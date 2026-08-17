{-------------------------------------------------------------------------------
-- SR. DESENVOLVEDOR, POR FAVOR PREENCHA ABAIXO QUANDO FIZER ALGUMA ALTERAÇÃO --
--------------------------------------------------------------------------------
ALTERAÇÃOES / IMPLEMENTAÇÕES ---------------------------------------------------
--------------------------------------------------------------------------------
WO          : 41032 (40760)
Responsável : Edilaine
Data        : 07/07/2026
Descrição   : Trocar componente para apresentação das fotos
--------------------------------------------------------------------------------
WO          : 28061
Responsável : Leandro Pocebon
Data        : 27/11/2025
Descrição   : Ajuste trazer data nascimento correto
--------------------------------------------------------------------------------
alteração   : FormShow
WO          : 5749
Responsável : Helen Vasquez Bianchi
Data        : 25/04/2024 (merge 08/10/2025)
Descrição   : Adicionado verificações de acesso nos menu devido a LGPD
              Cor e Tipo Sanguineo visible False
--------------------------------------------------------------------------------
alteração   : (dfm gbTitular) NBKelegpartPageChanged
WO          : 18367
Responsável : Edilaine
Data        : 05/03/2025
Descrição   : Inclusão dos campos BSTITULAR, FABTITULAR e PERC_PENSAO
--------------------------------------------------------------------------------
alteração   : form
WO          : 1950
Responsável : André Imakawa
Data        : 10/08/2023
Descrição   : Ajuste dos campos Tipo Ação e Status Ação.
--------------------------------------------------------------------------------
alteração   : dblkMesCobrancaChange
SIG         : 127512
Responsável : André Imakawa
Data        : 29/07/2022
Descrição   : Não exibir rubricas salariais FUNCEF na Consulta Geral de Pessoas.
--------------------------------------------------------------------------------
alteração   : NBKelegpartPageChanged
SIG         : 97640
Responsável : Fábio Sampaio
Data        : 12/02/2020
Descrição   : Ajuste no consulta geral para acesso aos dados do pensionista
--------------------------------------------------------------------------------
SIG         : 88279
Responsável : André Imakawa
Data        : 28/01/2020
Descrição   : Correção listagem das mensagens
--------------------------------------------------------------------------------
SIG         : 85075
Responsável : Taffarel Sevaybriker
Data        : 15/05/2019
Descrição   : Adicionado campo DATAREGISTRO no order by da busca.
--------------------------------------------------------------------------------
SIG         : 67891
Responsável : Denis Horongoso
Data        : 04/05/2018
Descrição   : Correção na apresentação dos campos "Situação do Participante
              Titular no Plano" e "Situação do Beneficiário no Plano"
--------------------------------------------------------------------------------
SIG         : SIG TIBERO
Responsável : Everson Luiz Pereira da Cunha
Data        : 26/02/2018
Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
              Retirada de INDEX, +rule etc.
              Melhoria realizada para adaptação ao TIBERO.
--------------------------------------------------------------------------------
SIG         : 59307
Responsável : Taffarel Sevaybriker
Data        : 20/02/2018
Descrição   : Erro na consulta de benefício para herdeiro/designado
--------------------------------------------------------------------------------SIG         : 62096
Responsável : Andre Imakawa
Data        : 23/01/2018
Descrição   : Erro abrir Consulta Geral pelo modulo CentralAP.
--------------------------------------------------------------------------------
SIG         : (dfm) pnlOpcMolestia
Responsável : Edilaine Ferraresi
Data        : 22/01/2018
Descrição   : não permitir mudança na marcadação de moléstia graveem Dados Pessoais
--------------------------------------------------------------------------------
SIG         : 42986
Responsável : Peterson Victor
Data        : 09/11/2017
Descrição   : ajustes nova regra de dependentes
--------------------------------------------------------------------------------
alteração   : {.dfm dbgrdLogAltDepen), AjustaPainelSitAtualTitular, SituaoAtual1Click,
              FormResize
SIG         : 42986
Responsável : Edilaine
Data        : 04/08/2017
Descrição   : ajustes para apresentação maximizada dos paineis
--------------------------------------------------------------------------------
// Data       : 07/07/2017
// Sol        : 50441
// Autor      : Darivaldo Alencar
// Descrição  : Inclusão de: pnlMolPlanos e alinhamento da label Label1.
//------------------------------------------------------------------------------
alteração   : .dfm (PgPortabEntrada e PgPortabSaida), NBKelegpartPageChanged,
              DblkPlanosChange, Entrada1Click e Sada1Click
SIG         : 25332
Responsável : André Imakawa
Data        : 11/05/2017
Descrição   : criação do menu: Vida no Plano/Portabilidade/Entrada
                               Vida no Plano/Portabilidade/Saida
--------------------------------------------------------------------------------
// Data       : 21/02/2017
// Sol        : 21868
// Autor      : Peterson Victor/Darivaldo Alencar
// Descrição  : Inclusão de campos e reposicionamento de campos
//------------------------------------------------------------------------------
// Data       : 21/02/2017
// Sig        : 21866
// Autor      : William Santana
// DFM        : criação de checkbox e label Data Inclusão
// Descrição  :
--------------------------------------------------------------------------------
Pendência   : SIG 37689
Responsável : Darivalo Alencar
Data        : 05/05/2017
Descrição   : Inclusão de campos TEMPOSERVTOTAL,TEMPOSERVTOTDIA ,TEMPOSERVTOTMES
              na pgHistoricoFuncional
--------------------------------------------------------------------------------
Pendência   : SOL 208658/15297  KTN 2050337
Responsável : Felipe Azevedo Santos
Data        : 06/09/2013
Descrição   : recompilação do SOL 208658.
--------------------------------------------------------------------------------
Pendência   : SOL 208658 Kintana 2018716
Responsável : Felipe Azevedo Santos
Data        : 24/06/2013
Descrição   : criação no menu: Vida no Plano/Contribuições/Histórico do SRB.
--------------------------------------------------------------------------------
// Data       : 03/06/2016
// Sol        : 269360
// PPM        : 1294692
// Autor      : Darivaldo Alencar
// DFM        : criação do panel pnlSituacao
// Descrição  : Componentes estão sobrepondo outros objetos na tela dentro do
                NBKelegpart quando a resoluço do windows está em 125%.
//------------------------------------------------------------------------------
// Data       : 21/03/2016
// Sol        : 270869
// PPM        : 1340102
// Autor      : Helio Lima Custódio
// Descrição  : Correção Triguer do Usuário de Inclusão estava errado e não
//              estava sendo mostrado em alguns casos.
//------------------------------------------------------------------------------
// Data       : 07/03/2016
// Sol        : 253577/18154
// PPM        : 1320388
// Autor      : Helio Lima Custódio
// DFM        : Inclusão de Desfeito e Movimento Desfeito na DbgridMovBenef
// Descrição  : Apresentar também movimentações que possuem identificador do
//              desfazer operações de benefícios preenchidos.
//------------------------------------------------------------------------------
// Data       : 16/02/2016
// Sol        : 269137
// PPM        : 1287534
// Autor      : Peterson Victor
// Descrição  : Consulta do Saldo esta retornando informações de mais de uma matricula
//------------------------------------------------------------------------------
// Rotinas    : (.dfm) lables: lblDIB e lblDIP  (retirada da Funcef)
// Data       : 14/01/2016
//Nº SOL......: 253577-18064
//KTN / PPM   : 1240079
// Autor      : Edilaine
// Descrição  : Ajustes para Equacionamento do Deficit
//------------------------------------------------------------------------------
// Data       : 27.08.2015
// Sol        : 253577/17604
// PPM        : 999484
// Autor      : Helio Lima Custódio
// Descrição  : Reestrutaração dos campos em PgBeneficiosSituacaoAtual,
//              inclusão de campos na PgBeneficiosHistoricoMovimentacoes
--------------------------------------------------------------------------------
// Data       : 07.08.2015
// Sol        : 148922/8841
// PPM        : 1628565
// Autor      : Jonas Otavio
// Rotina     : Botão Ajuda
// Descrição  : Confeccionar documentação do módulo de Empréstimo
--------------------------------------------------------------------------------
//Rotinas     : (.dfm aba PgBeneficiosSituacaoAtual inclusão pnlDEC)
//Pendência   : SOL 249378-17134 PPM 758026
//Responsável : Edilaine Ferraresi
//Data        : 29/04/2015
//Descrição   : Alterar Consulta Geral de Pessoa para apresentar novos campos
//              nas informações dos benefícios INSS
--------------------------------------------------------------------------------
//Pendência   : SOL 252873 PPM 790284
//Responsável : Petri Nocentini
//Data        : 19/05/2015
//Descrição   : Duplicidade de informações na tela.
--------------------------------------------------------------------------------
//Pendência   : SOL 245986 PPM 630400
//Responsável : Fernando Xavier
//Data        : 12/01/2014
//Descrição   : Duplicidade de informações na tela.
--------------------------------------------------------------------------------
//Pendência   : SOL 208715 Kintana 2015769
//Responsável : Felipe A. Santos                                     
//Data        : 04/07/2013
//Descrição   : Alteração do campo SALPART na query (qryHstSalParticipacao) no
//              menu : Vida no Plano/Contribuições/
//                     Histórico do Salário de Participação.
--------------------------------------------------------------------------------
//Pendência   : SOL 239566 PPM 519625            
//Responsável : Thiago Melo
//Data        : 17/09/2014
//Descrição   : Correção do erro ocasionado pelo SOL 222547
--------------------------------------------------------------------------------
//Pendência   : SOL 222547 KTN 486701
//Responsável : Fernando Xavier
//Data        : 18/08/2014
//DFM         : Alteração em DFM.
//Descrição   : A consulta está trazendo o campo Nível do Cargo, porém não está
//              exibindo no Form.
--------------------------------------------------------------------------------
//Pendência   : SOL 235491 KTN 450100
//Responsável : Fernando Xavier
//Data        : 17/07/2014
//Descrição   : **ALTERAÇÃO MANUAL NÃO GRAVA MOVBENEF** .
--------------------------------------------------------------------------------
Pendência   : SOL 200665/13992 KTN 1940550
Responsável : William Santana
Data        : 26/05/2014
Descrição   : inclusão dos novos campos na sub-grid de histórico de movimentação de beneficios
             ( alteração somente no dfm )
--------------------------------------------------------------------------------
Pendência   : SOL 208116 Kintana 2016014
Responsável : Felipe A. Santos
Data        : 07/05/2014
Descrição   : Mudança na grid de dependentes de designado para designado para
              resgate no menu agenda pessoal > dependentes 
--------------------------------------------------------------------------------
Pendência   : SOL 205798 KTN 2013525 
Responsável : Felipe A. Santos
Data        : 17/09/2013
Descrição   : Alterado o caption Dependente para Dependente Funcef da aba de
              Agenda Pessoal/ Dependentes , alteração somente no dfm
--------------------------------------------------------------------------------
Pendência   : SOL 224464 Kintana 2058543
Responsável : Thiago Melo
Data        : 17/04/2014
Descrição   : Corrigir cargos que possuem duplicidade
--------------------------------------------------------------------------------
Pendência   : SOL 193317 Kintana 1854470
Responsável : Higor Nayde ferreira
Data        : 03/12/2013
Descrição   : A tela de eventos disponível na Consulta Geral de Pessoas
			 (Vida no Plano / Eventos) demonstra os eventos registrados em todas
			  as matrículas que possuem o mesmo CPF.
--------------------------------------------------------------------------------
Pendência   : SOL 180917 KTN 1706762
Responsável : Felipe Azevedo dos Santos
Data        : 24/07/2013
Descrição   : no menu Vida Funcional / Evolução Funcional/ Aba cargos. foi
              incluido o campo Nível do Cargo(NIVELINDIV1) da tabela EVOLFUNC.
--------------------------------------------------------------------------------
Pendência   : SOL 218844 Kintana 2053565
Responsável : Fernando Xavier
Data        : 21/11/2013
Descrição   : Gentileza verificar pois as definiçoes de acesso não esta
              refletindo na funcionalidade de Rubricas salariais.
--------------------------------------------------------------------------------
Pendência   : SOL 215849 Kintana 2044962
Responsável : Thiago Melo
Data        : 06/09/2013
Descrição   : Erro consulta geral de pessoa (patrocinadora).
--------------------------------------------------------------------------------
Pendência   : SOL 210801 Kintana 2042824
Responsável : Thiago Melo
Data        : 18/07/2013
Descrição   : Erro consulta geral de pessoa.
--------------------------------------------------------------------------------
Pendência   : SOL 173532 KINTANA 1833116
Responsável : William Santana
Data        : 18/07/2013
Descrição   : inclusão do grid histórico de alterações na página pgDependentes.
--------------------------------------------------------------------------------
Pendência   : SOL 201305 Kintana 1958008
Responsável : Fernando Xavier
Data        : 11/03/2013
Descrição   : não é possivel vizualizar as informções na parte superior da tela
              como situação na patrocinadora, nome do do dependente e matricula,
              além disso não é possível alterar o cadastro.
--------------------------------------------------------------------------------
Pendência   : SOL 177560 Kintana 1696073
Responsável : William Moreira da Silva
Descrição   : Retirar o campo Categoria da "Consulta Geral de Pessoas"
--------------------------------------------------------------------------------
Pendência   : SOL 192897 Kintana 1835724
Responsável : FELIPE AZEVEDO DOS SANTOS
Descrição   : Inclusão do campo OBSERVAOCAO no Grid na Page pgContribuicoesRe -
              servaHistoricoAlimentacao
--------------------------------------------------------------------------------
Pendência   : SOL 124332 Kintana  630255
Responsável : Fernando Xavier
Descrição   : Consulta para visualização do histórico do SALARIO DE PARTICIPACAO
--------------------------------------------------------------------------------
Pendência   : SOL 186139 Kintana 1751410
Responsável : Fernando Xavier
Data        : 31/07/2012
Descrição   : erro na consulta de planos do titular, para a matricula 0230556.
              As informações aparecem duplicadas.
--------------------------------------------------------------------------------
Pendência   : SOL 157911  KINTANA:1271166
Responsável : MONICA GONZAGA
Data        : 20/06/2012
Descrição   : Adicionado os campos datafim e datainicio da molestia.
--------------------------------------------------------------------------------
Pendência   : SOL 180928 KINTANA:1678130
Responsável : MONICA GONZAGA
Data        : 29/05/2012
Descrição   : Correção do parametros da qyrPlanos no evento DblkPatroChange.
--------------------------------------------------------------------------------
Pendência   : SOL 125795 Kintana 1009799
Responsável : Fernando Xavier
Data        : 03/05/2012
Descrição   : Verificado o motivo em replicar as contribuições de participantes
              que são dependentes e titulares ao mesmo tempo, ao informar os
              dados das contribuiçõe
--------------------------------------------------------------------------------
Pendência   : SOL 180148 Kintana 1664935
Responsável : Fanuel Junior
Data        : 28/05/2012
Descrição   : Gentileza corrigir eventos duplicados, conforme verificamos o
              motivo é por falta de algum relacionamento.
--------------------------------------------------------------------------------
Pendência   : SOL 180997 Kintana 1677634
Responsável : Fanuel Marinho
Data        : 25/05/2012
Descrição   : ERRO AO PESQUISAR MATRÍCULA NA CONSULTA GERAL DE PESSOA
--------------------------------------------------------------------------------
Pendência   : SOL 37791/4261 Kintana 1187530
Responsável : Renato Visoni
Descrição   : Visualização da Matricula na consulta Geral de Pessoas.
--------------------------------------------------------------------------------
Pendência   : SOL 157908 Kintana 1267933
Responsável : Fanuel Junior
Data        : 31/01/2012
Descrição   : Solicito que seja omitida a informação de "Elegível a Benefício"
              disponível nas telas Consulta Geral de Pessoa e em
              Cadastros/Dependente e Beneficiário
--------------------------------------------------------------------------------
Pendência   : SOL 177868 KINTANA 1632116
Responsável : Vinicius Ferreira
Data        : 10/04/2012
Descrição   : Correção do parametros da qyrPlanos no evento DblkPatroChange.
--------------------------------------------------------------------------------
Pendência   : SOL 176101 KINTANA 1604595
Responsável : José Roberto Marque
Data        : 12/03/2012
Descrição   : Alterado borderstyle do form de BsSizeable para BSSINGLE no .dfm
--------------------------------------------------------------------------------
Pendência   : SOL 164831 KINTANA 1422552
Responsável : BRUNO AZEVEDO
Data        : 29/12/2011
Descrição   : Demonstrar os planos a que o dependente esteja vinculado.
--------------------------------------------------------------------------------
Pendência   : SOL 159619 Kintana 1322712
Responsável : José Roberto Marque
Data        : entre 19/01/2012 e 27/01/2012
Descrição   : Implementação deste form em MDI;
              Implementação dos botôes Minimizar e maximizar
              Substituição do tmainmenu por uma toolbar com Pop-ups
--------------------------------------------------------------------------------
Pendência   : SOL 161339 Kintana 1361327
Responsável : Fanuel Junior
Data        : 28/12/2011
Descrição   : Erro na tela geral de consultas
--------------------------------------------------------------------------------
Pendência   : SOL 149830/6382 Kintana 1411404
Responsável : Eraldo Silva
Data        : 26/09/2011
Descrição   : Alteração nomenclatura "Histórico de Movimentações"
--------------------------------------------------------------------------------
Pendência   : SOL 149830/6383 Kintana 1411406
Responsável : Eraldo Silva
Data        : 26/09/2011
Descrição   : Reativação tela Histórico de Movimentações "MOVBENEF"
--------------------------------------------------------------------------------
Pendência   : SOL 150834 Kintana 1104309
Responsável : Fanuel Junior
Data        : 17/06/2011
Descrição   : Demonstrar os planos a que o dependente esteja vinculado.
--------------------------------------------------------------------------------
Pendência   : SOL 159147 KTN 1311761
Responsável : Eraldo Silva
Data        : 08/06/2011
Descrição   : Redimensionar tela CONSULTA/CONSULTA GERAL DE PESSOA
--------------------------------------------------------------------------------
Pendência   : SOL 151853 KTN 1130323
Responsável : Fernando Xavier
Data        : 15/04/2011
Descrição   : implementação das informações relativo à compra de tempo, a título
              de histórico das compras efetivadas, no consulta geral de pessoas
--------------------------------------------------------------------------------
Pendência   : SOL 149445/4281 KINTANA 1188441
Responsável : Fernando Xavier
Data        : 25/10/2010
Descrição   : Tela consulta geral de pessoas, mostrar a situação atual da matrícula
              referente comp.: "Pago no convênio INSS". Os nomes que estão mudando de posição.
--------------------------------------------------------------------------------
Pendência   : SOL 37791  KINTANA 523676
Responsável : Marcelo Almeida
Data        : 20/10/2010
Descrição   : Incluir informações de cadastros anteriores do participante em
              historico de tempo de serviço e de contribuições.
--------------------------------------------------------------------------------
Pendência   : SOL 154231/4301 KINTANA  1188872
Responsável : Fernando Xavier
Data        : 18/03/2011
Descrição   : Erro no comando: (TO_DATE(?, 'YYYY/MM') BETWEEN
              TO_DATE(HR.datainicio, 'YYYY/MM') AND TO_DATE(HR.datafim, 'YYYY/MM'))
--------------------------------------------------------------------------------
Pendência   : SOL 150170 KINTANA 1092826
Responsável : BRUNO AZEVEDO
Data        : 10/03/2011
Descrição   : Trazer os dados dos cargos dos func. da funcef da EVOLFUNC.
--------------------------------------------------------------------------------
Pendência   : SOL 148127 Kintana 1036903
Responsável : Renato Visoni
Descrição   : Foram Acrescentadas algumas informações no Histórico de Contribuições
              do Previdenciário.
--------------------------------------------------------------------------------
Pendência   : SOL 136383 - Kintana 815815
Responsável : Marcelo Almeida
Data        : 02/10/2010
Descrição   : Implementação de uma rotina de registro e gerenciamento de
              revisões realizadas pela COABE.
--------------------------------------------------------------------------------
Responsável : Renato Visoni
Pendência   : SOL 126929 Kintana 668755
Descrição   : Apresentar Data Início IR, Data Fim IR, Data Inicio Sal.Familia, Data Fim Sal.Familia,
              Data inicio invalidez, data fim invalidez ,Início Moléstia e Fim Moléstia na Grid.
---------------------------------------------------------------------------------------------------
Pendência    : SOL 153017 Kintana 1147347
Data         : 15/02/2011
Responsável  : Fanuel Junior
Descrição    : Corrigido o erro que nao permite escolher a patrocinadora.
--------------------------------------------------------------------------------
Pendência    : SOL 152011 Kintana 1126727
Data         : 03/02/2011
Responsável  : Fanuel Junior
Descrição    : Travar o campo PATROCINADORA não permitindo que o mesmo seja
               alterado
--------------------------------------------------------------------------------
Pendência   : SOL 151024 Kintana 1103373
Responsável : FERNANDO XAVIER
Data        : 19/01/2011
Descrição   : Participantes titulares e dependentes ao mesmo tempo - Exibição de benefício
--------------------------------------------------------------------------------
Pendência   : SOL 151082 Kintana 1103382
Responsável : BRUNO AZEVEDO
Data        : 18/01/2011
Descrição   : Adicionado em todas as querys os campos criados no SOL141386.
--------------------------------------------------------------------------------
Pendência   : SOL 141386 Kintana 1031786
Responsável : BRUNO AZEVEDO
Data        : 11/01/2011
Descrição   : Adicionado os campos "Isento de IR" e "Desconta IR sobre suplementação e INSS juntos".
--------------------------------------------------------------------------------
Pendência    : SOL 149792 Kintana 1079222
Data         : 29/12/2010
Responsável  : Fanuel Junior
Descrição    : Corrigido o problema das patricionadoras do SOL144955 quando o titular
tem apenas uma patrocinadora
--------------------------------------------------------------------------------
Pendência    : SOL 144955 KINATA 963745
Data         : 04/11/2010
Responsável  : Fanuel Junior
Descrição    : Foi criado o combobox DblkPatro e a qryListPatros que retorna as
patrocinadoras da pessoa que está sendo consultada.
--------------------------------------------------------------------------------
Pendência   : SOL 141073 Kintana 141073
Responsável : BRUNO AZEVEDO
Data        : 20/09/2010
Descrição   : Correção no controle de transação das funcionalidades:
              "Contribuições por Núcleo Familiar";
              "Entrada Manual de Contribuições por Núcleo Familiar";
              "Consulta Geral de Pessoa".
--------------------------------------------------------------------------------
Pendência    : SOL 143794 KINATA 943403
Data         : 17/09/2010
Responsável  : Fanuel Junior
Descrição    : Ajuste na query 'qryPlanos' que além de exibir os planos do
pensionista também exibia os planos do titular.
--------------------------------------------------------------------------------
Pendência    : SOL 127789 KINATA 680107
Data         : 03/12/2009
Responsável  : Ádler Souza
Descrição    : Correção na query 'qryPlanos' onde os dados estavam vindo planos
duplicados.
--------------------------------------------------------------------------------
Pendencia   : Sol 141514 Kintana 895847
Responsável : Fernando Xavier
Data        : 10/08/2010
Descrição   : ajustar o calculo da idade.
--------------------------------------------------------------------------------
Pendencia   : Sol 141055 Kintana 887892
Responsável : Ádler Souza
Data        : 03/08/2010
Descrição   : Correção da Inconsistência na tela.
--------------------------------------------------------------------------------
Pendencia   : Sol 127323 Kintana 674396
Responsável : Ádler Souza
Data        : 10/05/2010
Descrição   : Incluir os campos DATA DE NOMEAÇÃO e DATA DE EXONERAÇÃO.
--------------------------------------------------------------------------------
Pendência   : SOL 127144 Kintana 670910
Responsável : Renato Visoni
Data        : 01/04/2010
Descrição   : inclusao do "Historico de Percentual de contribuicao".
--------------------------------------------------------------------------------
Pendência   : SOL 125889 KTN 653789
Responsável : Jéssica Lana
Data        : 20/10/2009
Descrição   : Ao trocar de plano, o plano selecionado não estava retornando as
              informações certas no DBgrid, porque o parametro alimentado estava
              passando DEPOIS da qry dar o open.
--------------------------------------------------------------------------------
Pendência   : SOL 124593 KTN635549
Responsável : Jéssica Lana
Data        : 25/09/2009
Descrição   : Coloquei o componente NBKelegpartPageChanged(self) antes de passar
              os parametros para os dados do titular/dependente.
              Não estava mudando os valores conforme mudava de titular para dependente.
--------------------------------------------------------------------------------
Pendência   : SOL 124776 KTN 638410
Responsável : Jéssica Lana
Data        : 30/09/2009
Descrição   : Erro de SQL ao entrar no contracheque
--------------------------------------------------------------------------------
Pendência   : SOL 122747 Kintana 610299
Responsável : Jéssica Lana
Data        : 21/08/2009
Descrição   : Ao buscar uma matricula de pensionista o campo Matricula estava
              retornando a matricula de ativo
--------------------------------------------------------------------------------
Pendência   : SOL 102263 Kintana 456414
Responsável : Renato Visoni
Data        : 27/01/2009
Descrição   : Acrescentar o campo Tipo de Recurso e Origem do Recurso na grid de
              historico de contribuições.
--------------------------------------------------------------------------------
Pendência   : 97689
Responsável : José Nilton Henrique
Data        : 06/10/2008
Descrição   : Favor corrigir na tela de ação judicial, no consulta geral de
              pessoa, a data início e data fim da ação. Os campos existem porém,
              as datas não aparecem. Matricula Teste = 2261704.
--------------------------------------------------------------------------------
Pendência   : 95377
Responsável : José Nilton Henrique
Data        : 15/09/2008
Descrição   : Correção em CONSULTA GERAL PESSOA, ao verificar Agenda
              Pessoal>Ação Judicial, o Numero do Processo não é exibido no campo
              especificado. O numero de processo existe na base de dados.
              Matricula = 2261704.
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante.
Pendência    : 27866
Data         : 06/05/2008
Responsável  : Daniel Simões
Descrição    : Apenas coloquei o align do 'fFrameConsultaHistorico1' como
               alClient...
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante.
Pendência   : 27836
Responsável : Daniel Simões
Data        : 29/04/2008
Descrição   : Correção na guia 'Vida no Plano / Benefícios / Pagamentos /
              Contra-Cheque' onde dava 'Access Violation' porque a frame que
              aponta para o objeto 'fFrameConsultaHistorico' na bpl CMFBCOMUM50
              foi "arrancada" nos padrões anteriores...
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17
Pendência    : 27429
Responsável  : Daniel Simões
Data         : 18/02/2008
Descrição    : Correção de erro ao abrir a tela com Participante sem plano
               previdenciário... 
--------------------------------------------------------------------------------
Padrão      : 5.10.19
Pendência   : 26764
Responsável : Daniel Simões
Data        : 11/12/2007
Descrição   : Ajuste na combo que exibe os planos para poder trazer os dados de
              acordo com a matrícula do participante.

       (2ª) : Correção para poder mudar também a matrícula...
--------------------------------------------------------------------------------
Pendência   : 26658
Responsável : Daniel Simões
Data        : 30/10/2007
Descrição   : Passa a limpar os campos de Ação Judicial sempre que fecha a query
--------------------------------------------------------------------------------
Pendência   : 24612
Responsável : Daniel Simões
Data        : 29/05/2007
Descrição   : Substituição do componente 'DBEdit' por um 'DBRadioGroup' para
              fins de exibição do campo 'FLGDIRETOR' na tela...
--------------------------------------------------------------------------------
Pendência   : 24030
Responsável : Marchetti
Data        : 08/03/2007
Descrição   : Acerto na exibição da data de inscrição no plano. Caso o
              participante tenha trocado de plano, o sistema mostra a data de
              inicio correspondente ao plano selecionado (FUNCEF)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 23535
Responsável : Daniel Simões
Data        : 26/02/2007
Descrição   : Acerto na exibição dos campos no plano do titular no form
              "Consulta Geral de Pessoas" e ajuste na formatação do campo
              "Salário de Manutenção"...
--------------------------------------------------------------------------------
Pendência   : 22282
Responsável : Daniel Simões
Data        : 22/02/2007
Descrição   : Acerto na query "dtmConsPart.qryHstRubricas" que trás as rúbricas
              dentro do mês escolhido. Passa a abrir a query sem filtros quando
              não seleciona nenhum mês na combo...
--------------------------------------------------------------------------------
Pendência   : 21394
Responsável : Daniel Simões
Data        : 19/01/2007
Descrição   : Implementação do botão que chama os dados pessoais do
              participante/dependente ( Consulta Geral de Pessoa )
--------------------------------------------------------------------------------
Pendência   : 22208
Responsável : Cláudio Faria
Data        : 05/01/2007
Descrição   : Inclusão do campo "posicão do emprestimo"(FLGEMPRESTIMO) na
              "dbgrMovBenef"
--------------------------------------------------------------------------------
Pendência   : 21922
Responsável : Daniel Simões
Data        : Novembro de 2006
Descrição   : Implementação de mais dois campos no grid em "Vida no Plano".
              "Tipo Opção IR" e "Data Opção IR" ...
--------------------------------------------------------------------------------
Pendência   : 22332
Responsável : Daniel Simões
Data        : 07/06/2006
Descrição   :
--------------------------------------------------------------------------------
Pendência   : 22323
Responsável : Daniel Simões
Data        : 05/06/2006
Descrição   :
--------------------------------------------------------------------------------
18/09/2003 - André Tavares - pendência - 15055
21/10/2003 - André Tavares - pendência - 15468
28/10/2003 - André Tavares - pendência - 15518
13/10/2003 - André Tavares - pendência - 15616
27/11/2003 - André Tavares - pendência - 15543
--------------------------------------------------------------------------------
22/11/2003 - André Tavares - pendêcia  - 15211:
             Descrição : Incorporação dos fontes da FUNCEF (Flávio dias)
--------------------------------------------------------------------------------
22/11/2003 - André Tavares - pendêcia  - 15254:
             Descrição : Inclusão do campo datacancela da tabela depentit no
                         grid de depententes
--------------------------------------------------------------------------------
22/11/2003 - André Tavares - pendêcia  - 15971:
             Descrição : Inclusão de um decode (11) na query qryMovBenef
--------------------------------------------------------------------------------
13/12/2003 - André Tavares - pendêcia  - 15889:
             Descrição : Ajuste do grid na tela.
--------------------------------------------------------------------------------
20/01/2004 - André Tavares - pendêcia  - 15928
25/02/2003 - André Tavares - pendência - 16109
26/02/2004 - Andre Tavares - pendência - 16122
--------------------------------------------------------------------------------
12/04/2004 - Andre Tavares - pendencia - 16681 - 16699
             Descrição : (alterei a query qryrubIndiv)
--------------------------------------------------------------------------------
04/10/2004 - André Tavares - pendência 17503
05/10/2004 - Andre Tavares - pendência 17477
11/10/2004 - andre tavares - pendência 17362
--------------------------------------------------------------------------------
14/10/2004 - andre tavares - pendência 17909
             Descrição : Alterada a query qrypartgeral
--------------------------------------------------------------------------------
25/10/2004 - André Tavares - pendência 17697
             Descrição : Na ítem Benefícios/Situação. Alterar Final Pgto para
                         Final Pgto Efetivo, inserir Pgto Prevista.
--------------------------------------------------------------------------------
25/10/2004 - André Tavares - pendência 17472
             Descrição : Criação do ítem de Menu 'Vida Na Fundação'
--------------------------------------------------------------------------------
25/10/2004 - André Tavares - pendência 17631
             Descrição : Os dados de um depentente/pencionista nao aparecem na
                         parte superior da tela
--------------------------------------------------------------------------------
29/10/2004 - andre tavares - pendência 17834
             Descrição : Exibir o planoprevcontabil do participante ou assistido
--------------------------------------------------------------------------------
26/11/2004 - andre tavares - pendência 18028
             Descrição : Colocar o join (BB.NUMEROPROCESSO = HBN.NUMEROPROCESSO)
                         na query qryBenef - para nao dar produto cartesiano
--------------------------------------------------------------------------------
07/01/2005 - andre tavares - pendência 17854
             Descrição : No grid de planos foi adicionado o nome da
                         patrocinadora do mesmo.
--------------------------------------------------------------------------------
21/03/2005 - andre tavares - pendência 18476
             Descrição : Descrição do erro: o combo Planos não está habilitando
                         para mostrar todos os planos, por isso não está
                         mostrando os benefícios do plano selecionado. (este
                         erro é procedente).
--------------------------------------------------------------------------------
21/03/2005 - andre tavares - pendência 18747
             Descrição : Não está mostrando o planoprevContábil.
--------------------------------------------------------------------------------
16/06/2006 - Alberto Carvalho - pendência 22425
             Descrição : Dados funcionais buscam apenas o primeiro patrocinador.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}
unit fconspart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, ExtCtrls, fcClearPanel,
  fcButtonGroup, fcOutlookBar, dConsPart, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, Mask, wwdbedit, MAHlpBtn, Buttons, TB97Tlbr, TB97, Db,
  DBTables, Wwquery, MontaSelect, Menus, DBCtrls, DBCGrids, wwdblook,
  ComCtrls, wwriched, DBCtrls2, wwdbdatetimepicker, CMDateTimePicker,  FTelaAut,
  fFrameConsultaHistorico, AppEvnts, FPai, UAutorizacao, uCtrlTempoServico, uCmClientDataSet,
  Wwdatsrc, DBaseDados, usistema, Provider, DBClient, Spin, TREdit,
  uCmSqlParams, uCMFileUtils, dConsPart1, TB97Tlwn, ToolWin, Tabnotbk,dxCntner,
  dxEditor, dxEdLib, dxDBELib, JPEG;

type
  TFRMconspart = class(TForm)
    qryAux: TwwQuery;
    ScrollBox2: TScrollBox;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    wwDBEdit28: TwwDBEdit;
    wwDBEdit29: TwwDBEdit;
    wwDBEdit30: TwwDBEdit;
    wwDBEdit31: TwwDBEdit;
    dbedSitPart: TwwDBEdit;
    wwDBEdit33: TwwDBEdit;
    wwDBEdit37: TwwDBEdit;
    wwDBEdit38: TwwDBEdit;
    edClassific: TEdit;
    wwDBEdit39: TwwDBEdit;
    DblkPlanos: TwwDBLookupCombo;
    Label1: TLabel;
    ApplicationEvents: TApplicationEvents;
    Label169: TLabel;
    wwDBEdit90: TwwDBEdit;
    Dock972: TDock97;
    lblBloqueio: TLabel;
    tb97Fundo2: TToolbar97;
    bbtnSair2: TBitBtn;
    bbtnAjuda2: TmaHelpBitBtn;
    bbtnProcurar: TBitBtn;
    ds: TwwDataSource;
    CmCdsEMPRESA: TStringField;
    CmCdsMATRICULA: TStringField;
    CmCdsDATAINICIO: TDateTimeField;
    CmCdsDATAFINAL: TDateTimeField;
    CmCdsTEMPOCALC: TFloatField;
    CmCdsFLGCONTATS: TFloatField;
    CmCdsTEMPOSERVANTERIOR: TFloatField;
    CmCdsTEMPONAOCREDITADO: TFloatField;
    CmCdsTEMPOSEMCONVERSAO: TFloatField;
    CmCdsTEMPOTOTALEXT: TStringField;
    CmCdsTEMPOSEMCONVERSAOEXT: TStringField;
    CmCdsTEMPOSERVCALC: TFloatField;
    CmCdsTEMPOSITESPECIAL: TFloatField;
    CmCdsNOME: TStringField;
    CmCdsCPF: TStringField;
    CmCdsIDPESSOA: TFloatField;
    CmCdsSEQHISTFUNC: TFloatField;
    CmCdsTEMPOINDIVEXT: TStringField;
    CmCds: TCMClientDataSet;
    NBKelegpart: TNotebook;
    lblNomePai: TLabel;
    lblNomeMae: TLabel;
    lblEstadoCivil: TLabel;
    Naturalidade: TLabel;
    Label51: TLabel;
    lblEMail: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label106: TLabel;
    Label2: TLabel;
    Label135: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    dbednomepai: TwwDBEdit;
    dbednomemae: TwwDBEdit;
    dbedEstadoCivil: TwwDBEdit;
    pnlDependentes: TPanel;
    wwDBEdit16: TwwDBEdit;
    wwDBEdit17: TwwDBEdit;
    dbedEMail: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit7: TwwDBEdit;
    wwDBEdit8: TwwDBEdit;
    wwDBEdit9: TwwDBEdit;
    wwDBEdit10: TwwDBEdit;
    wwDBEdit12: TwwDBEdit;
    DBImage1: TDBImage;
    DbedIdade: TwwDBEdit;
    dbedNumElegBenef: TwwDBEdit;
    DbeditCidade: TwwDBEdit;
    wwDBEdit88: TwwDBEdit;
    Panel1: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel2: TPanel;
    DBCtrlGrid2: TDBCtrlGrid;
    Bevel2: TBevel;
    Label120: TLabel;
    Label123: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label129: TLabel;
    Label124: TLabel;
    Label121: TLabel;
    Label128: TLabel;
    Label125: TLabel;
    Label122: TLabel;
    wwDBEdit41: TwwDBEdit;
    wwDBEdit44: TwwDBEdit;
    wwDBEdit47: TwwDBEdit;
    wwDBEdit48: TwwDBEdit;
    wwDBEdit50: TwwDBEdit;
    wwDBEdit45: TwwDBEdit;
    wwDBEdit42: TwwDBEdit;
    wwDBEdit49: TwwDBEdit;
    wwDBEdit46: TwwDBEdit;
    wwDBEdit43: TwwDBEdit;
    Panel7: TPanel;
    DBCtrlGridTelefones: TDBCtrlGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label63: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit32: TwwDBEdit;
    wwDBEdit35: TwwDBEdit;
    GroupBox4: TGroupBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    Label73: TLabel;
    Panel24: TPanel;
    DBGrContatos: TwwDBGrid;
    DBRichEdObs: TwwDBRichEdit;
    dbgrContaBancaria: TwwDBGrid;
    Panel8: TPanel;
    Panel9: TPanel;
    dbgriddepen: TwwDBGrid;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText5: TDBText;
    Panel6: TPanel;
    wwDBEdit18: TwwDBEdit;
    wwDBEdit19: TwwDBEdit;
    wwDBEdit20: TwwDBEdit;
    PanelDadosFuncionais: TPanel;
    lblnomepatro: TLabel;
    Label151: TLabel;
    lblNomeCargo: TLabel;
    Label18: TLabel;
    Label156: TLabel;
    lblDataAdmissao: TLabel;
    Label165: TLabel;
    lblNomeFilial: TLabel;
    lblSitFunc: TLabel;
    lblSalarioTotal: TLabel;
    Label102: TLabel;
    Label67: TLabel;
    Label69: TLabel;
    Label68: TLabel;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    dbednomepatro: TwwDBEdit;
    dbedCargo: TwwDBEdit;
    DbedFunc: TwwDBEdit;
    dbednivel: TwwDBEdit;
    wwDBEdit82: TwwDBEdit;
    dbeddataadmissao: TwwDBEdit;
    wwDBEdit87: TwwDBEdit;
    dbedFilial: TwwDBEdit;
    dbedsitfunc: TwwDBEdit;
    dbedsaltotal: TwwDBEdit;
    wwDBEdit40: TwwDBEdit;
    wwDBEdit92: TwwDBEdit;
    wwDBEdit93: TwwDBEdit;
    wwDBEdit94: TwwDBEdit;
    dbeValor1: TwwDBEdit;
    dbeValor2: TwwDBEdit;
    dbeValor3: TwwDBEdit;
    Bevel1: TBevel;
    Label101: TLabel;
    DBText1: TDBText;
    pgctrlDetalhe: TPageControl;
    tbsDet: TTabSheet;
    pnlControlesDet: TPanel;
    Label75: TLabel;
    lblTituloTipo: TLabel;
    Label76: TLabel;
    dblkpcmbCargoxNivel: TwwDBLookupCombo;
    dbDataInicio: TCMDateTimePicker;
    dblkpcmbModoCargo: TwwDBLookupCombo;
    dbgrdDet: TwwDBGrid;
    tbsFuncao: TTabSheet;
    pnlControlesFuncao: TPanel;
    tbsAdicCompens: TTabSheet;
    pnlAdicCompensatorio: TPanel;
    tbsATS: TTabSheet;
    pnlATS: TPanel;
    tbsAdicInsalub: TTabSheet;
    Panel29: TPanel;
    tbsAdicNoturno: TTabSheet;
    pnlAdicNoturno: TPanel;
    tbsAdicPericul: TTabSheet;
    Panel32: TPanel;
    tbsRubSal: TTabSheet;
    pnlControlesRubSalarial: TPanel;
    Panel43: TPanel;
    pnlHstFuncional: TPanel;
    dbgridhistfunc: TwwDBGrid;
    wwDBGrid11: TwwDBGrid;
    Panel28: TPanel;
    Panel18: TPanel;
    Label74: TLabel;
    Label14: TLabel;
    Label54: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    dblkMesCobranca: TwwDBLookupCombo;
    dblkPatros: TwwDBLookupCombo;
    wwDBEdit25: TwwDBEdit;
    wwDBEdit26: TwwDBEdit;
    wwDBEdit83: TwwDBEdit;
    Panel3: TPanel;
    grpbxHstEventPro: TGroupBox;
    wwDBGrid2: TwwDBGrid;
    GroupBox2: TGroupBox;
    pnlEventPrevHstContrib: TPanel;
    Shape2: TShape;
    Shape3: TShape;
    Label16: TLabel;
    Label17: TLabel;
    Panel4: TPanel;
    dbgHstContFechado: TwwDBGrid;
    Panel5: TPanel;
    dbgrdEventos: TwwDBGrid;
    DBCtrlGrid1: TDBCtrlGrid;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label58: TLabel;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit44: TDBEdit;
    Panel12: TPanel;
    Panel13: TPanel;
    dbgridproc: TwwDBGrid;
    Panel14: TPanel;
    GrdRub: TwwDBGrid;
    Panel26: TPanel;
    wwDBGrid7: TwwDBGrid;
    Panel27: TPanel;
    Panel30: TPanel;
    wwDBGrid9: TwwDBGrid;
    wwDBGrid10: TwwDBGrid;
    Panel31: TPanel;
    dbgrdSitAtualTit: TDBCtrlGrid;
    bvlSitAtualTit: TBevel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    dbtNoneValBase1: TDBText;
    dbtNoneValBase2: TDBText;
    dbtNoneValBase3: TDBText;
    wwDBEdit51: TwwDBEdit;
    wwDBEdit52: TwwDBEdit;
    wwDBEdit53: TwwDBEdit;
    wwDBEdit54: TwwDBEdit;
    wwDBEdit55: TwwDBEdit;
    wwDBEdit56: TwwDBEdit;
    wwDBEdit57: TwwDBEdit;
    Panel22: TPanel;
    lblSaldosReserva: TLabel;
    LblSaldoResControle: TLabel;
    Panel15: TPanel;
    dbgrdResPoupanca: TwwDBGrid;
    dbgrHistReserva: TwwDBGrid;
    Panel35: TPanel;
    wwDBGrid12: TwwDBGrid;
    Panel33: TPanel;
    Panel34: TPanel;
    DBCtrlGrid4: TDBCtrlGrid;
    Bevel4: TBevel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    lblDIP: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    lblBSDIB: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    lblFormaPagamento: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    DBEdNumProcCM: TwwDBEdit;
    wwDBEdit58: TwwDBEdit;
    wwDBEdit59: TwwDBEdit;
    wwDBEdit60: TwwDBEdit;
    wwDBEdit61: TwwDBEdit;
    wwDBEdit62: TwwDBEdit;
    wwDBEdit63: TwwDBEdit;
    wwDBEdit64: TwwDBEdit;
    wwDBEdit65: TwwDBEdit;
    dbedBSDIB: TwwDBEdit;
    wwDBEdit69: TwwDBEdit;
    wwDBEdit70: TwwDBEdit;
    wwDBEdit71: TwwDBEdit;
    dbedFormaPagamento: TwwDBEdit;
    wwDBEdit79: TwwDBEdit;
    wwDBEdit80: TwwDBEdit;
    Panel25: TPanel;
    dbgirdbenef: TwwDBGrid;
    Panel19: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Label26: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    DBEdit7: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit4: TDBEdit;
    dbgRubIndiv: TwwDBGrid;
    Panel21: TPanel;
    dbgridpart: TwwDBGrid;
    Panel40: TPanel;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    Label164: TLabel;
    wwDBEdit84: TwwDBEdit;
    wwDBEdit85: TwwDBEdit;
    wwDBEdit86: TwwDBEdit;
    edValEnq: TEdit;
    wwDBGrid13: TwwDBGrid;
    dbgrdCompoDIB: TwwDBGrid;
    Panel39: TPanel;
    Panel10: TPanel;
    wwDBGrid4: TwwDBGrid;
    wwDBGrid5: TwwDBGrid;
    Panel11: TPanel;
    dbgridpartprev: TwwDBGrid;
    Panel20: TPanel;
    Panel23: TPanel;
    dbgirdcontrib: TwwDBGrid;
    Panel37: TPanel;
    Panel38: TPanel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    pnlPrevidenciario: TPanel;
    dbgridPrev: TwwDBGrid;
    pnlAssistencial: TPanel;
    dbgridplanass: TwwDBGrid;
    Panel41: TPanel;
    pnlRestoMestre: TPanel;
    Panel42: TPanel;
    gbInfVara: TGroupBox;
    lbCodVara: TLabel;
    lbNomeVara: TLabel;
    edCodVara: TEdit;
    edNomeVara: TEdit;
    gbInfSecao: TGroupBox;
    lbCodSecao: TLabel;
    lbUfSecao: TLabel;
    lbNomeSecao: TLabel;
    edCodSecao: TEdit;
    edNomeSecao: TEdit;
    cmbUF: TDBLookupComboBox;
    Panel44: TPanel;
    Panel45: TPanel;
    gbxbanco: TGroupBox;
    lbBanco: TLabel;
    lbAgencia: TLabel;
    lbConta: TLabel;
    lbOperacao: TLabel;
    dblkBanco: TwwDBLookupCombo;
    dblkAgencia: TwwDBLookupCombo;
    dblkConta: TwwDBLookupCombo;
    cmbOperacao: TComboBox;
    gbDatas: TGroupBox;
    lbDataInicio: TLabel;
    lbDataFim: TLabel;
    dbdtInicio: TCMDateTimePicker;
    dbdtFinal: TCMDateTimePicker;
    Panel46: TPanel;
    Panel47: TPanel;
    gbNumProc: TGroupBox;
    edNumProc: TEdit;
    gbxPercentual: TGroupBox;
    Label105: TLabel;
    redPercAcao: TRealEdit;
    gbStatus: TGroupBox;
    cmbStatusAcao: TComboBox;
    PnlAcaoJudicial: TPanel;
    lblAutorAcao: TLabel;
    Panel48: TPanel;
    Label114: TLabel;
    cmbTipoOAcao: TComboBox;
    edAutorAcao: TEdit;
    cbxFazdeposito: TCheckBox;
    pnlCompensacao: TPanel;
    Panel49: TPanel;
    gbAnoMesInicio: TGroupBox;
    lbAnoInicio: TLabel;
    lbMesInicio: TLabel;
    cbMesInicio: TComboBox;
    speAnoInicio: TSpinEdit;
    gbAnoMesFinal: TGroupBox;
    lbAnoFim: TLabel;
    lbMesFim: TLabel;
    cbMesFim: TComboBox;
    speAnoFinal: TSpinEdit;
    GroupBox5: TGroupBox;
    redCompTotal: TRealEdit;
    GroupBox6: TGroupBox;
    pnlsaldo: TPanel;
    GroupBox7: TGroupBox;
    redsaldo: TRealEdit;
    GroupBox8: TGroupBox;
    Label166: TLabel;
    Label167: TLabel;
    edtcodvaracomp: TEdit;
    edtNomeVaracomp: TEdit;
    GroupBox9: TGroupBox;
    edtNumproccomp: TEdit;
    dbgRegras: TwwDBGrid;
    Label168: TLabel;
    DBRichEditOBS: TwwDBRichEdit;
    dbgrdFuncao: TwwDBGrid;
    dbgrdAdicCompens: TwwDBGrid;
    dbgrdATS: TwwDBGrid;
    dbgrdAdicInsalub: TwwDBGrid;
    dbgrdAdicNoturno: TwwDBGrid;
    dbgrdAdicPericul: TwwDBGrid;
    dbgrdRubSal: TwwDBGrid;
    Label78: TLabel;
    wwDBEdit27: TwwDBEdit;
    Panel50: TPanel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    wwDBEdit95: TwwDBEdit;
    wwDBEdit96: TwwDBEdit;
    wwDBEdit97: TwwDBEdit;
    wwDBEdit98: TwwDBEdit;
    wwDBEdit99: TwwDBEdit;
    Panel51: TPanel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    wwDBEdit101: TwwDBEdit;
    wwDBEdit102: TwwDBEdit;
    wwDBEdit103: TwwDBEdit;
    dbedValorCargo: TwwDBEdit;
    wwDBEdit105: TwwDBEdit;
    Label90: TLabel;
    Panel52: TPanel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    wwDBEdit106: TwwDBEdit;
    wwDBEdit107: TwwDBEdit;
    wwDBEdit108: TwwDBEdit;
    wwDBEdit109: TwwDBEdit;
    dbedValorFunc: TwwDBEdit;
    Panel53: TPanel;
    Panel54: TPanel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    wwDBEdit111: TwwDBEdit;
    wwDBEdit112: TwwDBEdit;
    wwDBEdit113: TwwDBEdit;
    wwDBEdit114: TwwDBEdit;
    dbedValFuncFac: TwwDBEdit;
    Panel55: TPanel;
    Label171: TLabel;
    Label172: TLabel;
    Label173: TLabel;
    Label174: TLabel;
    wwDBEdit117: TwwDBEdit;
    wwDBEdit118: TwwDBEdit;
    wwDBEdit119: TwwDBEdit;
    edtValorAdicComp: TwwDBEdit;
    wwDBEdit121: TwwDBEdit;
    Label175: TLabel;
    Panel56: TPanel;
    wwDBEdit116: TwwDBEdit;
    wwDBEdit122: TwwDBEdit;
    wwDBEdit123: TwwDBEdit;
    wwDBEdit124: TwwDBEdit;
    wwDBEdit125: TwwDBEdit;
    opcao1: TDBText;
    opcao2: TDBText;
    opcao3: TDBText;
    opcao4: TDBText;
    opcao5: TDBText;
    opcao6: TDBText;
    wwDBEdit126: TwwDBEdit;
    wwDBEdit100: TwwDBEdit;
    Label85: TLabel;
    wwDBEdit104: TwwDBEdit;
    Label170: TLabel;
    Panel57: TPanel;
    dbLkMesInicial: TwwDBLookupCombo;
    Label176: TLabel;
    Label177: TLabel;
    DblkMesFinal: TwwDBLookupCombo;
    Label178: TLabel;
    dblkNomeReserva: TwwDBLookupCombo;
    CMSqlParams1: TCMSqlParams;
    CmCdsFATOR: TFloatField;
    CmCdsFLGCONCOMITANTE: TFloatField;
    Label180: TLabel;
    wwDBEdit81: TwwDBEdit;
    lblNomeRecebDadosPessoais: TLabel;
    dbedNomeRecebDadosPessoais: TwwDBEdit;
    dbedCPFRecebDadosPessoais: TwwDBEdit;
    lblCPFRecebDadosPessoais: TLabel;
    dbedRGRecebDadosPessoais: TwwDBEdit;
    lblRGRecebDadosPessoais: TLabel;
    lblExpedicaoRecebDadosPessoais: TLabel;
    lblUFRecebDadosPessoais: TLabel;
    dbedExpedicaoRecebDadosPessoais: TwwDBEdit;
    dbedUFRecebDadosPessoais: TwwDBEdit;
    Panel58: TPanel;
    Label182: TLabel;
    DBCtrlGrid5: TDBCtrlGrid;
    DBEdit38: TDBEdit;
    Label181: TLabel;
    DBEdit39: TDBEdit;
    Label183: TLabel;
    Label184: TLabel;
    DBEdit40: TDBEdit;
    Label185: TLabel;
    DBEdit46: TDBEdit;
    Label186: TLabel;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    Label187: TLabel;
    DBEdit49: TDBEdit;
    Label188: TLabel;
    Label189: TLabel;
    DBEdit50: TDBEdit;
    Label190: TLabel;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    Label191: TLabel;
    DBEdit53: TDBEdit;
    Label192: TLabel;
    DBEdit54: TDBEdit;
    Label193: TLabel;
    Label194: TLabel;
    DBEdit55: TDBEdit;
    Label195: TLabel;
    DBEdit56: TDBEdit;
    Panel36: TPanel;
    dbgrdOutrasInforms: TwwDBGrid;
    wwDBGrid3: TwwDBGrid;
    Panel60: TPanel;
    twMensagem: TToolWindow97;
    Panel61: TPanel;
    BitBtn1: TBitBtn;
    reditMSG: TRichEdit;
    wwDBEdit36: TwwDBEdit;
    Label196: TLabel;
    wwDBGrid6: TwwDBGrid;
    wwDBGrid14: TwwDBGrid;
    Panel63: TPanel;
    Panel62: TPanel;
    Panel64: TPanel;
    dbedPlanoContab: TwwDBEdit;
    Label197: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    wwDBGrid15: TwwDBGrid;
    Panel65: TPanel;
    Panel66: TPanel;
    wwDBGrid16: TwwDBGrid;
    dbedBeneficioInicial: TwwDBEdit;
    wwDBEdit127: TwwDBEdit;
    lblBeneficioInicial: TLabel;
    Label201: TLabel;
    sbtnTitular: TBitBtn;
    sep1: TToolbarSep97;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    chkTodasPatro: TCheckBox;
    dbrgrpDiretor: TDBRadioGroup;
    edtSitBenefPlano: TwwDBEdit;
    lblSitBenefPlano: TLabel;
    tbsAdicConfianca: TTabSheet;
    dbgAdicConfianca: TwwDBGrid;
    qryMatricula: TwwQuery;
    dsMatricula: TwwDataSource;
    qryMatriculaMATRICULA: TStringField;
    edtMatricula: TwwDBEdit;
    Panel67: TPanel;
    wwDBGrid17: TwwDBGrid;
    lbNomeacao: TLabel;
    lbExoneracao: TLabel;
    dbeDataExoneracao: TwwDBEdit;
    dbeDtNomeacao: TwwDBEdit;
    wwDBEdit34: TwwDBEdit;
    Label77: TLabel;
    DblkPatro: TwwDBLookupCombo;
    Label113: TLabel;
    edtflgisentoir: TwwDBEdit;
    edtsomeirsupinss: TwwDBEdit;
    Label179: TLabel;
    dbedtHMDIP: TwwDBEdit;
    dbedtHMDIB: TwwDBEdit;
    cbHistoricoRevisoesBeneficios: TComboBox;
    dbgrMovBenef: TwwDBGrid;
    pnlHistoricoRevisoesBeneficios: TPanel;
    dbmmHMDescricaoRevisao: TDBMemo;
    dbgrdContribPrev: TwwDBGrid;
    Label202: TLabel;
    dbMesReferenciaIni: TwwDBLookupCombo;
    dbMesReferenciaFim: TwwDBLookupCombo;
    Label203: TLabel;
    dbNomeContribuicao: TwwDBLookupCombo;
    Label204: TLabel;
    edtDataUltAlteracao: TEdit;
    Label205: TLabel;
    edtPercentual: TEdit;
    Label206: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    edtTEMPOSEMCONVERSAO: TEdit;
    edtTEMPOSEMCONVERSAOEXT: TEdit;
    edtTEMPOSERVCALC: TEdit;
    edtTEMPOTOTALEXT: TEdit;
    Panel68: TPanel;
    wwDBGrid18: TwwDBGrid;
    qryCpCarencia: TwwQuery;
    qryCpCarenciaDATACOMPRA: TDateTimeField;
    qryCpCarenciaQTDEMESES: TFloatField;
    qryCpCarenciaVALORPATROCINADORA: TFloatField;
    qryCpCarenciaVALORPATROCINANTE: TFloatField;
    qryCpCarenciaVALORTOTAL: TFloatField;
    dsCpCarencia: TwwDataSource;
    Panel69: TPanel;
    Label53: TLabel;
    Label207: TLabel;
    Label208: TLabel;
    Label209: TLabel;
    Label210: TLabel;
    wwDBEdit11: TwwDBEdit;
    wwDBEdit15: TwwDBEdit;
    wwDBEdit21: TwwDBEdit;
    wwDBEdit22: TwwDBEdit;
    wwDBEdit23: TwwDBEdit;
    wwDBEdit24: TwwDBEdit;
    dbgridbeneficios: TwwDBGrid;
    DbgridMovBenef: TwwDBGrid;
    Panel70: TPanel;
    ToolBar1: TToolBar;
    AgendaPessoal: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    VidaNaFundao1: TToolButton;
    PopupMenu1: TPopupMenu;
    DadosPessoais: TMenuItem;
    Documentos: TMenuItem;
    Enderecos: TMenuItem;
    Telefones: TMenuItem;
    Contatos: TMenuItem;
    ContasBancrias: TMenuItem;
    Dependentes: TMenuItem;
    AoJudicial: TMenuItem;
    OutrasInformaes1: TMenuItem;
    PopupMenu2: TPopupMenu;
    DadosBasicos: TMenuItem;
    EvolucaoFuncional: TMenuItem;
    HistoricoFuncional: TMenuItem;
    RubricasSalariais: TMenuItem;
    Dadosparaenquadramento1: TMenuItem;
    PopupMenu3: TPopupMenu;
    Eventos: TMenuItem;
    Previdencirios2: TMenuItem;
    Assistenciais3: TMenuItem;
    Protocolos: TMenuItem;
    ProcessosRad: TMenuItem;
    RUB: TMenuItem;
    Contribuicoes: TMenuItem;
    CompradeCarnciadeTempo1: TMenuItem;
    HistricodePercentualdeContribuio2: TMenuItem;
    Parcelamento2: TMenuItem;
    Reserva2: TMenuItem;
    HistricodeAlimentao2: TMenuItem;
    Saldo2: TMenuItem;
    Histrico2: TMenuItem;
    SituaoAtual2: TMenuItem;
    DoBeneficirio1: TMenuItem;
    DoTitular1: TMenuItem;
    Beneficios: TMenuItem;
    Pagamentos: TMenuItem;
    InformedeRendimentos1: TMenuItem;
    RubricasIndividuais: TMenuItem;
    ContraCheque: TMenuItem;
    HistricodeMovimentaes2: TMenuItem;
    HistricodeRevises2: TMenuItem;
    Histrico3: TMenuItem;
    SituaoAtual3: TMenuItem;
    Processos: TMenuItem;
    Beneficiarios: TMenuItem;
    Assistenciais5: TMenuItem;
    Previdencirios3: TMenuItem;
    Enquadramento: TMenuItem;
    Emprestimo: TMenuItem;
    Planos2: TMenuItem;
    DoBeneficirio2: TMenuItem;
    DoTitular2: TMenuItem;
    Previdencirias2: TMenuItem;
    Aprovasdas1: TMenuItem;
    dbMatriculas: TwwDBLookupCombo;//SOL 37791/4261 Kintana 1187530
    Label211: TLabel;
    Panel153: TPanel;
    grdHstSalParticipacao: TwwDBGrid;
    HistricodeSalriodeParticipao1: TMenuItem;
    DBRichHistReservaObs: TwwDBRichEdit;
    Panel71: TPanel;
    Panel59: TPanel;    // MONICA GONZAGA SOL 157911
    dbgrdLogAltDepen: TwwDBGrid;
    pnlDEC: TPanel;
    lblDtEntrConv: TLabel;
    dbeDtEtnrada: TwwDBEdit;
    dbcbBenef142: TDBCheckBox;
    dbeServAnos: TwwDBEdit;
    lblServAno: TLabel;
    dbeServMes: TwwDBEdit;
    lblServMes: TLabel;
    dbeServDias: TwwDBEdit;
    lblServDia: TLabel;
    lblTempoServ: TLabel;
    lblDIB: TLabel;
    wwDBEdit14: TwwDBEdit;
    lblFABDIB: TLabel;
    dbedFABDIB: TwwDBEdit;
    lblValorAtualBS: TLabel;
    dbedValorAtualBS: TwwDBEdit;
    lblValorTotalBS: TLabel;
    dbedValorTotalBS: TwwDBEdit;
    lblValorAtualFAB: TLabel;
    dbedValorAtualFAB: TwwDBEdit;
    lblValorTotalFAB: TLabel;
    dbedValorTotalFAB: TwwDBEdit;
    lblValorAtual: TLabel;
    dbedValorAtual: TwwDBEdit;
    lblValorTotal: TLabel;
    dbedValorTotal: TwwDBEdit;
    lblCalcDeficit: TLabel;
    dbedCalcDeficit: TwwDBEdit;
    Label155: TLabel;
    wwDBEdit78: TwwDBEdit;
    Label145: TLabel;
    wwDBEdit66: TwwDBEdit;
    dbchkPagoConvenio: TDBCheckBox; // WILIAM SANTANA SOL 173532 KINTANA 1833116
	lblDtInclusao: TLabel;
    edtDataInclusao: TwwDBEdit;
    HistoricoSRB: TMenuItem;
    pnlHistSRB: TPanel;
    dbgrdHistSRB01: TwwDBGrid;
    dbgrdHistSRB02: TwwDBGrid;
    lblTempoServico: TLabel;
    lblHfAnos: TLabel;
    lblHfMes: TLabel;
    lblHfDias: TLabel;
    dbeHfAno: TEdit;
    dbeHfMes: TEdit;
    dbeHfDia: TEdit;
	Portabilidade1: TMenuItem;
    Entrada1: TMenuItem;
    Sada1: TMenuItem;
    dbgrPortabEntrada: TDBCtrlGrid;
    bvlBvPortabEntrada: TBevel;
    grpPortabEntradaOrigem: TGroupBox;
    lblPortabEntradaNome: TLabel;
    lblPortabEntradacnpj: TLabel;
    lblPortabEntradacnpb: TLabel;
    grpPortabEntrada: TGroupBox;
    lblPortabEntradaDtReceb: TLabel;
    lblPortabEntradaVlPortado: TLabel;
    lblPortabEntradaPlano: TLabel;
    lblPortabEntradaMeses: TLabel;
    lblPortabEntradaDtIR: TLabel;
    grpPortabEntradaTipo: TGroupBox;
    pnlPortabEntrada: TPanel;
    DBEPortabEntradaCNPJ: TwwDBEdit;
    DBEPortabEntradaNome: TwwDBEdit;
    DBEPortabEntradaCNPB: TwwDBEdit;
    DBEPortabEntradaDTReceb: TwwDBEdit;
    DBEPortabEntradaValor: TwwDBEdit;
    DBEPortabEntradaPlano: TwwDBEdit;
    DBEPortabEntradaMeses: TwwDBEdit;
    DBEPortabEntradaDtIR: TwwDBEdit;
    grpPortabEntradaTpIR: TGroupBox;
    dbchkPortabEntradaAberta: TDBCheckBox;
    dbchkPortabEntradaFechada: TDBCheckBox;
    dbchkPortabEntradaRegressivo: TDBCheckBox;
    dbchkPortabEntradaProgressivo: TDBCheckBox;
    dbgrPortabSaida: TDBCtrlGrid;
    pnlPortabSaida: TPanel;
    bvlPortabSaida: TBevel;
    grpPortabSaidaEntidadeDestino: TGroupBox;
    lblPortabSaidaNome: TLabel;
    lblPortabSaidaCnpj: TLabel;
    lblPortabSaidaBeneficio: TLabel;
    lblPortabSaidaCnpb: TLabel;
    grp1: TGroupBox;
    lblPortabSaidaDtSol: TLabel;
    lblPortabSaidaDtRegistro: TLabel;
    lblPortabSaidaDtEfetiva: TLabel;
    lblPortabSaidaVlPortado: TLabel;
    lblPortabSaidaVlPortadoCotas: TLabel;
    DBENOME1: TwwDBEdit;
    DBENOME: TwwDBEdit;
    DBENOME2: TwwDBEdit;
    DBENOME3: TwwDBEdit;
    DBENOME4: TwwDBEdit;
    DBEDATASOLICITACAO: TwwDBEdit;
    DBEDATASOLICITACAO1: TwwDBEdit;
    DBEDATAPAGAMENTO: TwwDBEdit;
    DBEDATAPAGAMENTO1: TwwDBEdit;
    dbedLotacaoF: TwwDBEdit;
    LblLotacaoF: TLabel;
    lblEstadoCivilDepen: TLabel;
    dbedEstadoCivilDepen: TwwDBEdit;
    lblGrauParentescoDepen: TLabel;
    dbedGrauParentDepen: TwwDBEdit;
    lblDeficienteDepen: TLabel;
    dbedDeficienteDepen: TwwDBEdit;
    lblIdadeDepen: TLabel;
    dbedIdadeDepen: TwwDBEdit;
    lblIRRFDepen: TLabel;
    dbedDepIRRFDepen: TwwDBEdit;
    dbedEscolaridadeDepen: TwwDBEdit;
    lblEscolaridadeDepen: TLabel;
    lblDataInclusaoDepen: TLabel;
    wwDBEdit75: TwwDBEdit;
    lblOrigemInclusaoDepen: TLabel;
    wwDBEdit76: TwwDBEdit;
    lblUltimaAtualizacaoDepen: TLabel;
    wwDBEdit77: TwwDBEdit;
    wwDBEdit89: TwwDBEdit;
    lblCanceladoEmDepen: TLabel;
    wwDBEdit91: TwwDBEdit;
    lblSituacaoDepen: TLabel;
    wwDBEdit110: TwwDBEdit;
    lblEmailDepen: TLabel;
    lblEmailFuncef: TLabel;
    wwDBEdit115: TwwDBEdit;
    lblNomePaiDepen: TLabel;
    wwDBEdit120: TwwDBEdit;
    lblNomeMaeDepen: TLabel;
    wwDBEdit128: TwwDBEdit;
    lblNaturalidadeDepen: TLabel;
    wwDBEdit129: TwwDBEdit;
    wwDBEdit130: TwwDBEdit;
    lblCidadeDepen: TLabel;
    lblNacionalidadeDepen: TLabel;
    wwDBEdit131: TwwDBEdit;
    dbedTipoDeficiencia: TwwDBEdit;
    lblTipoDeficiencia: TLabel;
    TabDepen: TTabControl;
    edtResponsavel: TwwDBEdit;
    edtTpResponsavel: TwwDBEdit;
    lblResponsavel: TLabel;
    lblTpResponsavel: TLabel;
    pnlDadosPessoaisDepen: TPanel;
    sptOutrasInforms: TSplitter;
    sptDependentes: TSplitter;
    pnlMolPlanos: TPanel;
    rgMolestia: TRadioGroup;
    rgDependIR: TRadioGroup;
    grpPlanoPrev: TGroupBox;
    lblDataCancelREG: TLabel;
    lblDataCancelREB: TLabel;
    lblDataCancelNOVO: TLabel;
    chkREGREPLAN: TCheckBox;
    chkREB: TCheckBox;
    chkNOVOPLANO: TCheckBox;
    dbedDataCancelREG: TwwDBEdit;
    dbedDataCancelREB: TwwDBEdit;
    dbedDataCancelNOVO: TwwDBEdit;
    btnHistMolestia: TButton;
    btnHistIR: TButton;
    sptEventosPrev: TSplitter;
    pnlSaldoHstAlimentacao: TPanel;
    LblTotalControle: TLabel;
    lblTotal: TLabel;
    sptHstMovimentacao: TSplitter;
    sptBenefPrev: TSplitter;
    pnlDadosBenefPrev: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label64: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label134: TLabel;
    Label79: TLabel;
    DBEdit36: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit43: TDBEdit;
    wwDBGrid8: TwwDBGrid;
    DBEdit37: TDBEdit;
    sptEmprestimo: TSplitter;
    sptPlanos: TSplitter;
    Label141: TLabel;
    dbedIRComplemento: TwwDBEdit;
    GroupBox1: TGroupBox;
    btnHstMolestiaTit: TButton;
    pnlOpcMolestia: TPanel;
    rbMolestiaTitNao: TRadioButton;
    rbMolestiaTitSim: TRadioButton;
    pnlOpcao: TPanel;
    lblValorOpcao1: TDBText;
    dbedValorOpcao1: TwwDBEdit;
    lblValorOpcao2: TDBText;
    dbedValorOpcao2: TwwDBEdit;
    lblValorOpcao3: TDBText;
    dbedValorOpcao3: TwwDBEdit;
    gbTitular: TGroupBox;
    lblBSTitular: TLabel;
    dbedValorBSTit: TwwDBEdit;
    dbedValorFABTit: TwwDBEdit;
    lblFABTitular: TLabel;
    lblTotalTitular: TLabel;
    dbedValorTotalTit: TwwDBEdit;
    dbedPercPensao: TwwDBEdit;
    lblPercPensao: TLabel;
    imgPessoa1: TImage;
    procedure MostraInformacoesBancarias;
  //  procedure DadosPessoaisClick(Sender: TObject);
 //   procedure DocumentosClick(Sender: TObject);
    procedure DadosPessoais_1Click(Sender: TObject);
    procedure Documentos_1Click(Sender: TObject);
    procedure bbtnSair2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgHstContFechadoCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure AtualizaDadosRub;
    procedure AtualizaDadosPlano;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure dbgridPrevFieldChanged(Sender: TObject; Field: TField);
    procedure dblkRecebedorChange(Sender: TObject);
    procedure dbgrVersoesRowChanged(Sender: TObject);
    procedure dbgridbeneficiosFieldChanged(Sender: TObject; Field: TField);
    Function TransformaDiasTempo(Tempo:Integer):String;
    Function TempoExtenso(Tempo:Integer):String;
    procedure wwDBGrid3RowChanged(Sender: TObject);
    procedure dblkMesCobrancaChange(Sender: TObject);
    procedure wwDBGrid5CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    // tavares
    procedure MostraBloqueio;
    procedure TbshHstRubricasShow(Sender: TObject);
    procedure RodaRegraElegibilidade;
    procedure NBKelegpartPageChanged(Sender: TObject);
    procedure Enderecos_1Click(Sender: TObject);
    procedure PrevidenciarioClick(Sender: TObject);
    procedure AssistencialClick(Sender: TObject);
    procedure HistoricoFuncionalClick(Sender: TObject);
    procedure DadosBasicosClick(Sender: TObject);
    procedure TelefonesClick(Sender: TObject);
    procedure ContasBancriasClick(Sender: TObject);
    procedure DependentesClick(Sender: TObject);
    procedure EmprestimoClick(Sender: TObject);
    procedure ProtocolosClick(Sender: TObject);
    procedure ProcessosRadClick(Sender: TObject);
    procedure Saldo1Click(Sender: TObject);
    procedure RubricasIndividuaisClick(Sender: TObject);
    procedure ContraChequeClick(Sender: TObject);
    procedure Previdencirios1Click(Sender: TObject);
    procedure Assistenciais1Click(Sender: TObject);
    procedure Histrico1Click(Sender: TObject);
    procedure Previdencirias1Click(Sender: TObject);
    procedure Assistenciais2Click(Sender: TObject);
    procedure ContatosClick(Sender: TObject);
    procedure HistoricoClick(Sender: TObject);
    procedure RUBClick(Sender: TObject);
    procedure RubricasSalariaisClick(Sender: TObject);
    procedure EvolucaoFuncionalClick(Sender: TObject);
    procedure ClassificaPessoa;
    procedure HabilitaMenuItens;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function  ExisteForm(frm: string): Boolean;
    procedure sbtnTitularClick(Sender: TObject);
    procedure DblkPlanosChange(Sender: TObject);
    procedure ProcessosClick(Sender: TObject);
    procedure SituaoAtualClick(Sender: TObject);
    procedure HistricodeAlimentao1Click(Sender: TObject);
    procedure SituaoAtual1Click(Sender: TObject);
    procedure dbgriddepenDblClick(Sender: TObject);
    procedure dbgridpartprevDblClick(Sender: TObject);
    procedure HistricodeMovimentaes1Click(Sender: TObject);
    procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
    procedure EnquadramentoClick(Sender: TObject);
    procedure wwDBGrid6CalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgrHistReservaTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure AcaoJudicialClick(Sender: TObject);
    procedure DadosparaEnquadramento1Click(Sender: TObject);
    function  BuscaValorCARGO (piIdCargo, pIdPessjur : longint) : double;
    procedure dbLkMesInicialChange(Sender: TObject);
    procedure DblkMesFinalChange(Sender: TObject);
    procedure dblkNomeReservaChange(Sender: TObject);
    procedure Parcelamento1Click(Sender: TObject);
    procedure wwDBGrid4RowChanged(Sender: TObject);
    procedure OutrasInformaes1Click(Sender: TObject);
    procedure dblkPatrosCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure twMensagemVisibleChanged(Sender: TObject);
    procedure VidaNaFundao1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DblkPlanosCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure Titular2Click(Sender: TObject);
    procedure Beneficirios1Click(Sender: TObject);
    procedure Beneficirio1Click(Sender: TObject);
    procedure chkTodasPatroClick(Sender: TObject);
    procedure HistricodePercentualdeContribuio1Click(Sender: TObject);
    procedure DblkPatroChange(Sender: TObject);
    procedure cbHistoricoRevisoesBeneficiosChange(Sender: TObject);
    procedure DblkPatroKeyPress(Sender: TObject; var Key: Char);
    procedure DblkPatroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbMesReferenciaIniChange(Sender: TObject);
    procedure dbMesReferenciaFimChange(Sender: TObject);
    procedure dbNomeContribuicaoChange(Sender: TObject);
    procedure MmCompradeCarenciadeTempoClick(Sender: TObject);
    procedure HistricodeRevises1Click(Sender: TObject);
    procedure SituaoAtual3Click(Sender: TObject);
    procedure dbMatriculasChange(Sender: TObject);
    procedure grdHstSalParticipacaoColEnter(Sender: TObject);
    procedure grdHstSalParticipacaoDblClick(Sender: TObject);
    procedure grdHstSalParticipacaoDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);  
    
    procedure FormResize(Sender: TObject);
    procedure btnHistMolestiaClick(Sender: TObject);
    procedure btnHistIRClick(Sender: TObject);
    procedure TabDepenChange(Sender: TObject);
    procedure dbgriddepenCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
    procedure HistricodeSalriodeParticipao1Click(Sender: TObject);
    procedure DBRichHistReservaObsCreateDialog(Form: TForm);
    procedure bbtnAjuda2Click(Sender: TObject);//SOL 37791/4261 Kintana 1187530
    procedure dbgrdHistSRB01DblClick(Sender: TObject);
    procedure dbgrdHistSRB02DblClick(Sender: TObject);
    procedure dbgrdHistSRB01CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);  // Felipe A. Santos SOL 208658 Kintana 2018716    
    procedure dbgrdHistSRB02CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure HistoricoSRBClick(Sender: TObject);   // Felipe A. Santos SOL 208658 Kintana 2018716
	 procedure Entrada1Click(Sender: TObject);
    procedure Sada1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);


  private
   { Private declarations }
    bListaTitular          : Boolean; //Darivaldo Alencar SIG21868;
    CtrlTempoServico       : TCtrlTempoServico;
    varFields              : Variant;
    bInsere                : Boolean;
    sStringAux             : String;
    i                      : Integer;
    nTotOrdem1, nTotOrdem2 : Double;
    lTotOrdem2             : Boolean;

    //Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484
    LstGridbeneficios : TStringList;
    LstgridMovBenef : TStringList;
    //Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484

    //edilaine - SIG42986 - inicio
    iAlturaIniForm         : integer;
    wsStateForm            : TWindowState;
    //edilaine - SIG42958 - fim

    procedure CloseDatasets;

    function ContaElegiveisAbeneficio: Integer;
    function ClienteNum(sNumero:String): String;
    function BuscaValorFUNCAOConsEleg(piIdPessJur,
                                      piIdFuncao:LongInt;
                                      psData:String): Double;
    procedure MsgErro(sMsg: String);

    procedure FiltraHistRubSal(sIdpessjur: string);
    procedure FiltraHistMovReserva;
    Procedure TotalizaReserva;

    Procedure FiltraContribuicao(); // Renato Visoni SOL 148127 Kintana 1036903


    function ContaRegistro (qry : TdataSet) : integer;
    function BuscaDtEntrada(pIdPessoa, pIdpessjur, pIdPlanoprev: integer): TdateTime;
    function GetMatricula : string;

    procedure LimpaParametros(const qry: TwwQuery);
    procedure CreatefrmFrameConsultaHistorico;
    procedure DestroyfrmFrameConsultaHistorico;

    //Marcelo Almeida - SOL 136383 - Kintana 815815
    procedure CarregarHistoricoRevisoesBeneficios;
    //Marcelo Almeida - SOL 136383 - Kintana 815815

    //Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484
    procedure OnQrySituacaoAtualBenefAfterScroll(DataSet: TDataSet);
    procedure MostraOcultaCamposDbgridbeneficios;
    procedure MostraOcultaCamposDbgridMovBenef;
    procedure ReorganizaCamposBeneficiosSituacaoAtual;
    procedure mostraCamposBSFABDeficit;
    procedure mostraCamposBSFAB;
    procedure MostraCamposDeficit;
    procedure ocultaCamposBSFABDeficit;
    procedure OnQryBeneficiosAntesAfterScroll(DataSet: TDataSet);
    procedure OnQryBeneficiosAfterScroll(DataSet: TDataSet);
    //Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484

    Procedure PreparaCamposScrollBox; //Darivaldo Alencar SIG21868
    Procedure SelecionaTelaDados;//Darivaldo Alencar SIG21868
    Procedure CalculaIdade; //Darivaldo Alencar SIG21868

    procedure AjustaPainelSitAtualTitular;    //edilaine - SIG42986

    procedure CarregarImagemPessoa(CampoImg: TBlobField; FrameImg : TImage);

  public
  { Public declarations }
    //Marcelo Almeida - Correção de Erro em Design Time.
    frmFrameConsultaHistorico1 : TfrmFrameConsultaHistorico;

    { flags de Classificação da pessoa }
    fElegivel, fParticipante_Assistido, fParticipante_Falecido,
    fRecebedor_Beneficio, fDependente, fParticipante_Ativo,
    fParticipante_Cancelado, fBeneficiario,
    fRecebedor_Pensao_Alimenticia, fAlimentado, fTitular : Boolean;
    bAcessaDependente, bAchouLinhaVazia : boolean;
    pgAcessoDireto : string;
    //PghistSalPartControlaInsert : Boolean; -- Felipe A. Santos SOL 208715 Kintana 2015769
    teste, teste2: String;
    bContDetalhe     : Boolean;

    // Daniel - 22136
    bConsPessoaGeral : Boolean;

    // Daniel - 21394
    bFiario : Boolean;

    bContDetalheSRB01, bContDetalheSRB02 : Boolean; // Felipe A. Santos SOL 208658 Kintana 2018716
  end;



var
  FRMconspart: TFRMconspart;

  // Daniel - 21394
  sTitular : String;

  sidpessoaconspart, sidpessjurconspart, sidplanoprevconspart,
  sseqpropostaconspart, sdatabasename, sIDRGELEGBENEF, sIdTitular,
  sIdPlanoPrev , sMatricula,sMtl : String; // Daniel - 26764 ( sMatricula (2ª) )
  iIdtitular : Integer;
  bRodandoElegibilidade, bFuncef : boolean;   // FDias - 12.12.2003
  TotalSaldo, TotSdoResCtrl, TotalSaldoReal, TotSdoResCtrlReal : Extended;       // FDias - 12.12.2003

  iIdCalculoGeral     : longInt ; // variavel criada para passar para a funcao RegraNumerica

  function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
  procedure TiraSQL( qry : TwwQuery);



implementation
{$R *.DFM}
uses
   UMensErro, UConsPart, FConsPessoaGeral, FTitulares, fAguarde,
  FHistMolestia, FHistIR;




procedure TfrmConsPart.bbtnSair2Click(Sender: TObject);
begin

  frmConsPart.close;
end;


procedure TfrmConsPart.FormShow(Sender: TObject);
var qryAutorizaRubSalariais, qryOperfunc : TwwQuery; // SOL 218844 Kintana 2053565
    sIdOperFunc : string; // SOL 218844 Kintana 2053565
begin
  try
    // inicio SOL 218844 Kintana 2053565
    sIdOperFunc := '' ;

    qryOperfunc := TwwQuery.Create(Self);
    qryOperfunc.DataBaseName := 'BASEDADOS';

    qryOperfunc.Close;
    qryOperfunc.SQL.Clear;
    qryOperfunc.SQL.Add(' SELECT IDOPERFUNC FROM OPERFUNC ');
    qryOperfunc.SQL.Add(' WHERE IDMODULO = '+inttostr(Sistema.IdModulo));
    qryOperfunc.SQL.Add(' AND IDOPERACAO = 1 AND IDFUNCAO = (SELECT IDFUNCAO  FROM FUNCAO ');
    qryOperfunc.SQL.Add(' WHERE IDMODULO = '+inttostr(Sistema.IdModulo));
    qryOperfunc.SQL.Add(' AND   UPPER(NOMEFUNCAO) = UPPER(''RUBRICAS SALARIAIS'')) ');
    qryOperfunc.open;

    sIdOperFunc := qryOperfunc.FieldByName('IDOPERFUNC').AsString;

    qryAutorizaRubSalariais := TwwQuery.Create(Self);
    qryAutorizaRubSalariais.DataBaseName := 'BASEDADOS';

    if trim(sIdOperFunc) <> '' then
    begin
      qryAutorizaRubSalariais.Close;
      qryAutorizaRubSalariais.SQL.Clear;
      qryAutorizaRubSalariais.SQL.Add(' SELECT DISTINCT IDOPERFUNC FROM ( SELECT AUTORIZA.IDOPERFUNC FROM AUTORIZA , OPERFUNC ');
      qryAutorizaRubSalariais.SQL.Add('  WHERE (AUTORIZA.IDOPERFUNC = OPERFUNC.IDOPERFUNC)            ');
      qryAutorizaRubSalariais.SQL.Add('    AND (AUTORIZA.IDPESSOA   = '+IntToStr(Sistema.IdEmpresa)  + ' )');
      qryAutorizaRubSalariais.SQL.Add('    AND (AUTORIZA.IDOPERFUNC = '+sIdOperFunc+' ) ');
      qryAutorizaRubSalariais.SQL.Add('    AND (AUTORIZA.IDESPACESSO = '+IntToStr(Sistema.IdEspAcesso) + ' ) ');
      qryAutorizaRubSalariais.SQL.Add('    AND (OPERFUNC.IDMODULO = '+IntToStr(Sistema.IdModulo) + ' ) ');

      qryAutorizaRubSalariais.SQL.Add('    union  ');
      qryAutorizaRubSalariais.SQL.Add(' SELECT AUTORIZA.IDOPERFUNC FROM AUTORIZA , OPERFUNC WHERE ');
      qryAutorizaRubSalariais.SQL.Add('    (AUTORIZA.IDOPERFUNC = OPERFUNC.IDOPERFUNC)  ');
      qryAutorizaRubSalariais.SQL.Add('    AND (AUTORIZA.IDPESSOA   = '+IntToStr(Sistema.IdEmpresa)  + ' )');
      qryAutorizaRubSalariais.SQL.Add('    AND (OPERFUNC.IDMODULO = '+IntToStr(Sistema.IdModulo) + ' ) ');

      qryAutorizaRubSalariais.SQL.Add('   AND exists  (SELECT GRUPOACESSO.IDESPACESSO FROM GRUPOACESSO, GRUPOUSU  ');
      qryAutorizaRubSalariais.SQL.Add('   WHERE GRUPOUSU.IDUSUARIO = ' + IntToStr(Sistema.IdUsuario)+ '  ');
      qryAutorizaRubSalariais.SQL.Add('   AND   GRUPOACESSO.IDGRUPO = GRUPOUSU.IDGRUPO    ');
      qryAutorizaRubSalariais.SQL.Add('   AND    GRUPOACESSO.IDESPACESSO = AUTORIZA.IDESPACESSO ) ');
      qryAutorizaRubSalariais.SQL.Add('   AND (AUTORIZA.IDOPERFUNC = '+sIdOperFunc+' ) ');
      qryAutorizaRubSalariais.SQL.Add('   )');
      qryAutorizaRubSalariais.Open;

      RubricasSalariais.enabled := (qryAutorizaRubSalariais.recordcount > 0);
    end;

    // Final SOL 218844 Kintana 2053565


    //Showmessage('FormShow');

    //Darivaldo Alencar SIG 21868 -inicio
    //bAcessaDependente := False
    bAcessaDependente:= not(Trim(FConsPessoaGeral.cIdTitular) = Trim(FConsPessoaGeral.cIdPessoa));
    bListaTitular    := (bAcessaDependente);
    PreparaCamposScrollBox;
    //Darivaldo Alencar SIG 21868 -fim

    sDatabaseName     := 'BaseDados';

    CloseDatasets;

    //Darivaldo Alencar SIG 21868 -inicio
     //  if (nbkElegPart.ActivePage <> 'PgDadosPessoais') then  nbkElegPart.ActivePage := 'PgDadosPessoais';
     SelecionaTelaDados;
    //Darivaldo Alencar SIG 21868 -fim

    NBKelegpartPageChanged(Self);

    //Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484
    LstGridbeneficios  := TStringList.Create;
    LstgridMovBenef    := TStringList.Create;
    //Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484

    //Inicio - Helen V Bianchi - WO5749   PgDadosPessoais
     if DadosPessoais.enabled = false then
     begin
        NBKelegpart.ActivePage := 'PgVazio' ;
     end;
    //Fim - Helen V Bianchi - WO5749

  Finally
     qryAutorizaRubSalariais.free;
     qryOperfunc.free;
  End;

  //edtSitBenefPlano.width:= 361; //Denis Horongoso - SIG67891
  edtSitBenefPlano.width:= 405; //Denis Horongoso - SIG67891
end;



procedure TfrmConsPart.dbgHstContFechadoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   with dtmConsPart do
   begin
      if (qryEventosPrev.State in [dsInactive]) or (qryHstContF.State in [dsInactive]) then
      begin
         Exit;
      end;


      if qryHstContF.FieldByName('FLGASSOCIADA').AsString = '0' then
      begin
         ABrush.Color := clMaroon;
         AFont.Color  := clWindow;
         if highlight then
         begin
           ABrush.Color := clMaroon;
           AFont.Color  := clWindow;
         end;
      end
      else
      if qryHstContF.FieldByName('FLGASSOCIADA').AsString = '1' then
      begin
         ABrush.Color := clTeal;
         AFont.Color  := clWindow;
         if highlight then
         begin
            ABrush.Color := clTeal;
            AFont.Color  := clWindow;
         end;
      end;
   end;
end;



procedure TfrmConsPart.bbtnProcurarClick(Sender: TObject);
begin
   dtmConsPart1.qryMessagemFiario.Close;
   twMensagem.Hide;

   pgAcessoDireto       := '';
   fTitular             := False;
   bAcessaDependente    := False;

   frmConsPessoaGeral := TFrmConsPessoaGeral.Create(frmConsPart);

   frmConsPessoaGeral.ModalResult := mrCancel;
   frmConsPessoaGeral.ShowModal;

   if FrmConsPessoaGeral.ModalResult = mrOk then
   begin
      FRMconspart.Refresh;
      CloseDatasets;
      FRMconspart.Refresh;

      if (nbkElegPart.ActivePage <> 'PgDadosPessoais') then  nbkElegPart.ActivePage := 'PgDadosPessoais';

      NBKelegpartPageChanged(self);

      //Darivaldo Alencar SIG 21868 -inicio
      bAcessaDependente:= not(Trim(FConsPessoaGeral.cIdTitular) = Trim(FConsPessoaGeral.cIdPessoa));
      PreparaCamposScrollBox;
      SelecionaTelaDados;

      bListaTitular:= (bAcessaDependente);

      CalculaIdade;
     //Darivaldo Alencar SIG 21868 -fim
   end;
end;


Procedure TfrmConsPart.AtualizaDadosRub;
begin
  With dtmConsPart Do
  begin
    With qryRUBpendentes Do
     begin
       if Active Then Close;
       if not Prepared then Prepare;
       ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
       ParamByName('IDPESSJUR').AsFloat := StrToIntDef(sidpessjurconspart, -1);
       ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
       Open;
     end;
    qryTipoDocRubPendentes.Close;
    qryTipoDocRubPendentes.Open;

    With QryRubs Do
     Begin
       if Active then Close;
       if Not Prepared then Prepare;
       DatabaseName := sdatabasename;
       ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
//       tavares 04/05/2002  - Esses parâmetros não são mais necessários
       Open;
     End;
    qryTipoDocXRub.Close;
    qryTipoDocXRub.Open;

    qryRubXBeneficio.Close;
    qryRubXBeneficio.Open;

    qryHistRubs.Close;
    qryHistRubs.Open;

  end;
end;

Procedure TfrmConsPart.AtualizaDadosPlano;
begin
  With dtmConsPart, dtmConsPart1 Do
  begin
    With qrycontribprev Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

    With qrycontrib Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

    With qryContribuicoes Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
      Open;
    end;
    // FDias - 12.12.2003
    With qryParcelamento Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDPESSOA').AsFloat    := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
      Open;
    end;

    With qrybenef Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdTitular, -1);
      ParamByName('IDPESSOA').AsFloat    := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

    With qrypartprev Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sIdPessoaConspart, -1);
    // início - andre Tavares - 03/03/2004 - pendência 16131
    dtmConsPart1.qrypartprev.Filtered := False;
    dtmConsPart1.qrypartprev.Filter := ' idpessjur = ' + sidpessjurconspart + ' and idplanoorigem = '+sidplanoprevconspart;
    dtmConsPart1.qrypartprev.Filtered := True;
    // fim - andre Tavares - 03/03/2004 - pendência 16131

      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

    With qrypart Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sIdPessoaConspart, -1);
    // início - andre Tavares - 03/03/2004 - pendência 16131
    dtmConsPart.qrypart.Filtered := False;
    dtmConsPart.qrypart.Filter := ' idpessjur = ' + sidpessjurconspart + ' and idplanoorigem = '+sidplanoprevconspart;
    dtmConsPart.qrypart.Filtered := True;
    // fim - andre Tavares - 03/03/2004 - pendência 16131
      ParamByName('SEQPROPOSTA').AsFloat := StrtoIntDef(sseqpropostaconspart, -1);
    end;

    With qryevent Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

    With qryReserva Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

    With qryHistReserva Do
    begin
      ParamByName('IDTITULAR').AsFloat   := StrToIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

  end;
end;

procedure TfrmConsPart.dbgridPrevFieldChanged(Sender: TObject; Field: TField);
begin
  AtualizaDadosPlano;
end;


procedure TfrmConsPart.dbgrVersoesRowChanged(Sender: TObject);
begin
  dtmConsPart1.qryHstVersoes.Close;
  dtmConsPart1.qryHstVersoes.ParamByName('IDTITULAR').AsInteger       := StrtoIntDef(sidpessoaconspart, -1);
  dtmConsPart1.qryHstVersoes.ParamByName('IDHSTFOLHABENEF').AsInteger := dtmConsPart1.qryVersoes.FieldByName('IDHSTFOLHABENEF').AsInteger;
  dtmConsPart1.qryHstVersoes.ParamByName('IDRESPONSAVEL').AsInteger   := dtmConsPart.qryRecebedor.FieldByName('IDRESPONSAVEL').AsInteger;
  dtmConsPart1.qryHstVersoes.Open;
end;


procedure TfrmConsPart.dbgridbeneficiosFieldChanged(Sender: TObject; Field: TField);
begin
inherited;
end;


// FDIAS - 13.12.2001 - FCRT
// AS DUAS PRÓXIMAS FUNÇÕES ESTÃO NA UADMPREV
// E FORAM COPIADAS PARA CÁ


//******************************************************************************
// Transforma numero de dias Dias em Tempo DDMMAAAA
Function TfrmConsPart.TransformaDiasTempo(Tempo:Integer):String;
Var
  I:Integer;
  wAnoF, wMesF, wDiaF:Double;
  wAno, wMes, wDia, wStrTempo:String;
Begin
  Result :='';

// Calcula Tempos
  wAnoF := (Tempo/360);
  wMesF := (Frac(wAnoF)*12);
  wDiaF := Round((wMesF-Int(wMesF))*30);

// Separa Tempos
  wAno := FloatToStr( Int( wAnoF ) );
  wMes := FloatToStr( Int( wMesF ) );
  wDia := FloatToStr( Int( wDiaF ) );

  If StrToInt(wAno) < 10 Then wAno:= '0'+wAno;
  If StrToInt(wMes) < 10 Then wMes:= '0'+wMes;
  If StrToInt(wDia) < 10 Then wDia:= '0'+wDia;

// Caso Dias = 30 Aumenta Mes
  If wDia = '30' Then Begin
    wMes:= IntToStr((StrToInt(wMes)+1));
    If (StrToInt(wMes) < 10) Then wMes:= '0'+wMes;
    wDia:= '00';
  End;
// Caso Meses = 12 Aumenta Ano
  If wMes = '12' Then Begin
    wAno:= IntToStr((StrToInt(wAno)+1));
    wMes:= '00';
  End;

  wStrTempo:=wAno+wMes+wDia;

  I := Length(wStrTempo);

  Result := StringofChar('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas

End;



//******************************************************************************
// Retorna tempo em extenso
Function TfrmConsPart.TempoExtenso(Tempo:Integer):String;
Var
  wStrAno, wStrMes, wStrDia, wStrTempo :String;
  wTempo, I:Integer;
Begin
// Decodifica Tempo Final
  wStrTempo:=IntToStr(Tempo);
// Caso Vazio, Sai Fora
  If Trim(wStrTempo) = '' Then Exit;

  wStrTempo := TransformaDiasTempo(StrToInt(wStrTempo));
  I := Length(wStrTempo);
  wStrTempo:= StringofChar('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas
  wStrAno  :=Copy(wStrTempo,1,2);
  wStrMes  :=Copy(wStrTempo,3,2);
  wStrDia  :=Copy(wStrTempo,5,2);
// Monta String do Resultador
  Result := wStrAno + ' ano(s), '+
            wStrMes + ' mes(es) e '+
            wStrDia + ' dia(s) ';
End;

procedure TfrmConsPart.wwDBGrid3RowChanged(Sender: TObject);
begin
  dtmConsPart.qryhstEmprestimo.Close;
  dtmConsPart.qryhstEmprestimo.ParamByName('IDCONTRATOEMPTMO').AsFloat :=
  dtmConsPart.qryEmprestimos.FieldByName('IDCONTRATOEMPTMO').AsFloat;
  dtmConsPart.qryhstEmprestimo.Open;
end;

procedure TfrmConsPart.wwDBGrid5CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  If Field.FieldName = 'FLGRECEBIDO' Then  ABrush.Color := $00C6FFFF;
end;

procedure TfrmConsPart.MostraBloqueio;
begin
  dtmConsPart.qryPessoaFisica.close;
  dtmConsPart.qryPessoaFisica.paramByName('IDPESSOA').asInteger := StrtoInt(sidpessoaconspart);
  dtmConsPart.qryPessoaFisica.open;
  lblBloqueio.Visible := dtmConsPart.qryPessoaFisicaFLGBLOQUEIO.asInteger = 1;
  dtmConsPart.qryPessoaFisica.close;
end;


procedure TfrmConsPart.dblkMesCobrancaChange(Sender: TObject);
var sSqlSemIdPessJur : string;
begin
  dtmConsPart.qryHstRubricas.Close;
  sSqlSemIdPessJur  :=  'SELECT H.IDPESSOA,    H.IDPESSJUR,     H.IDMOTIVO,      H.IDPATRO, '                 +#13#10+
                        '       H.MES,         H.MESCOBRANCA,   H.REFERENCIA,    H.IDRUBRICA, '               +#13#10+
                        '       H.CODPROVDESC, H.VALORPROVENTO, H.VALORINTEGRAL, SUMPROVDESC.SUMDESCONTO, '   +#13#10+
                        '       SUMPROVDESC.SUMPROVENTO, '                                                    +#13#10+
                        '       SUMPROVDESC.SUMPROVENTO - SUMPROVDESC.SUMDESCONTO AS SUMLIQ, '                +#13#10+
                        '       H.FLGCOMPOESALPART, H.FLGCOMPOESALBENEF, H.FLGCOMPOEREMTOTAL, '               +#13#10+
                        '       H.FLGIRRF,          H.SEQRUBRICA,        C.DESCRICAO, '                       +#13#10+
                        '       DECODE(C.FLGDESCONTO,0,''PROVENTO'', '                                        +#13#10+
                        '                            1,''DESCONTO'', '                                        +#13#10+
                        '                            2,''ESPECIAL'') AS PROVENTODESC, '                       +#13#10+
                        '       H.FLGSRB, DECODE(H.FLGSRB,1,''ATIVO OU MANTIDO TOTAL'', '                     +#13#10+
                        '                                 2,''AUX. DOENÇA'', '                                +#13#10+
                        '                                 3,''INSS'', '                                       +#13#10+
                        '                                 4,''SAL. VIRTUAL'', '                               +#13#10+
                        '                                 5,''MANTIDO PARCIAL'', '                            +#13#10+
                        '                                 0,''OUTROS'') AS DESCFLGSRB '                       +#13#10+
                        'FROM HISTRUBSAL H, PROVDESC C , '                                                    +#13#10+
                        '   ( SELECT SUM(DECODE(P1.FLGDESCONTO,1,VALORPROVENTO,0)) AS SUMDESCONTO, '          +#13#10+
                        '            SUM(DECODE(P1.FLGDESCONTO,0,VALORPROVENTO,0)) AS SUMPROVENTO '           +#13#10+
                        '     FROM HISTRUBSAL H1, PROVDESC P1 '                                               ;
//                        '     WHERE (H1.IDPESSOA = :IDPESSOA) '                                               +#13#10+//SOL 37791/4261 Kintana 1187530


                        //Renato Visoni //SOL 37791/4261 Kintana 1187530
                        if dbMatriculas.Text = '' then begin
                          sSqlSemIdPessJur  := sSqlSemIdPessJur  + ' WHERE H1.IDPESSOA IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO =  (SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = :IDPESSOA))' ;
                        end else begin
                          sSqlSemIdPessJur  := sSqlSemIdPessJur  + ' WHERE (H1.IDPESSOA = :IDPESSOA) ';
                        end;
                        sSqlSemIdPessJur  := sSqlSemIdPessJur  +
                        //Renato Visoni //SOL 37791/4261 Kintana 1187530

                        // Início Tavares 28/01/2003 pendência 11678 pega as rubricas de controle
                        '     AND ((H1.IDMODULO <> 18) OR '                                                   +#13#10+
                        '         ((H1.IDMODULO = 18) AND (H1.IDHSTFOLHABENEF IS NULL))) '                    +#13#10+

                        // Início Tavares 28/01/2003 pendência 11678
                        '     AND (H1.IDRUBRICA = P1.IDPROVENTO) '                                            +#13#10+
                        '     AND (P1.FLGDESCONTO <> 2) '                                                     +#13#10;

                        // Daniel - 22282
                        if (dblkMesCobranca.Text<>'') and (dblkMesCobranca.LookupValue<>'') then
                          sSqlSemIdPessJur := sSqlSemIdPessJur+'     AND (H1.MESCOBRANCA = :MESCOBRANCA) '    +#13#10;
                        // Fim.

                        sSqlSemIdPessJur := sSqlSemIdPessJur+' ) SUMPROVDESC ' ;
                     //   'WHERE (H.IDPESSOA = :IDPESSOA) '                                                     +#13#10+//SOL 37791/4261 Kintana 1187530
                       //Renato Visoni SOL 37791/4261 Kintana 1187530
                        if dbMatriculas.Text = '' then begin
                          sSqlSemIdPessJur  := sSqlSemIdPessJur  + ' WHERE H.IDPESSOA IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO =  (SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = :IDPESSOA))' ;
                        end else begin
                          sSqlSemIdPessJur  := sSqlSemIdPessJur  + 'WHERE (H.IDPESSOA = :IDPESSOA) ';
                        end;

                        sSqlSemIdPessJur := sSqlSemIdPessJur+
                        //Renato Visoni SOL 37791/4261 Kintana 1187530
                        '  AND (H.IDRUBRICA = C.IDPROVENTO) '                                                 +#13#10;

                        // Daniel - 22282
                        if (dblkMesCobranca.Text<>'') and (dblkMesCobranca.LookupValue<>'') then
                          sSqlSemIdPessJur := sSqlSemIdPessJur+'  AND (H.MESCOBRANCA = :MESCOBRANCA) '        +#13#10;
                        // Fim.

                        // Andre Imakawa - SIG 127512 - Inicio
                        sSqlSemIdPessJur := sSqlSemIdPessJur+ ' AND (H.IDPESSJUR = 91008)' +#13#10;
                        // Andre Imakawa - SIG 127512 - Fim

                        // Início Tavares 28/01/2003 pendência 11678 pega as rubricas de controle
                        sSqlSemIdPessJur := sSqlSemIdPessJur+
                        '  AND ((H.IDMODULO <> 18) OR ((H.IDMODULO = 18) AND (H.IDHSTFOLHABENEF IS NULL))) '  +#13#10+

                        // Início Tavares 28/01/2003 pendência 11678
                        'ORDER BY C.FLGDESCONTO, MES DESC, CODPROVDESC ';

  if dtmConsPart.qryHstRubricas.Active then
    dtmConsPart.qryHstRubricas.Close;

  dtmConsPart.qryHstRubricas.sql.Text := sSqlSemIdPessJur;

  if not dtmConsPart.qryHstRubricas.Prepared then
    dtmConsPart.qryHstRubricas.Prepare;

 // dtmConsPart.qryHstRubricas.ParamByName('IDPESSOA').AsInteger := StrToIntDef(sIdPessoaConsPart,-1);SOL 37791/4261 Kintana 1187530

  //Renato Visoni SOL 37791/4261 Kintana 1187530
  if dbMatriculas.Text <> '' then begin
     dtmConsPart.qryHstRubricas.ParamByName('IDPESSOA').asString := dbMatriculas.LookupValue;

     //BRUNO AZEVEDO 37791
     {dtmConsPart.qryMesRubrica.Close;
     dtmConsPart.qryMesRubrica.ParamByName('idPessoa').asInteger := StrToInt(dbMatriculas.LookupValue);
     dtmConsPart.qryMesRubrica.Open;

     dtmConsPart.qryMesRubrica.First;
     dtmConsPart.qryMesRubrica.Filtered := False;
     dtmConsPart.qryMesRubrica.Filter   :=  ' idmodulo <> 18 ';
     dtmConsPart.qryMesRubrica.Filtered := True;   }
  end else begin
    dtmConsPart.qryHstRubricas.ParamByName('IDPESSOA').AsInteger := StrToIntDef(sIdPessoaConsPart,-1);
  end;
  //Renato Visoni SOL 37791/4261 Kintana 1187530

  if (dblkMesCobranca.Text<>'') and (dblkMesCobranca.LookupValue<>'') then
    dtmConsPart.qryHstRubricas.ParamByName('MESCOBRANCA').AsString := dtmConsPart.qryMesRubrica.FieldByName('MESCOBRANCA').AsString;

  dtmConsPart.qryHstRubricas.Open;
end;

procedure TfrmConsPart.TbshHstRubricasShow(Sender: TObject);
begin
  dtmConsPart.qryHstRubricas.Close;
end;

procedure TfrmConsPart.RodaRegraElegibilidade;
var bElegivel, bErro : boolean;
    sSQL, sMsgErro : string;
begin
  // Rodar regra de elegibilidade de cada um dos dependentes
  bRodandoElegibilidade := True;
  dtmConsPart.qryDepentit.DisableControls;    //edilaine - SIG42986
  dtmConsPart.qryDepentit.First;
  while not dtmConsPart.qryDepentit.EOF do
  begin
    //sSQL := ' SELECT  PF.DATANASC,  PF.DATAMORTE, PF.SEXO, PF.ESTCIVIL, PP.DTINICIOINSC,  '+ //wo28061 leandro
    sSQL := ' SELECT  TRUNC(PF.DATANASC) AS DATANASC,  PF.DATAMORTE, PF.SEXO, PF.ESTCIVIL, PP.DTINICIOINSC,  '+
            '         EL.TEMPONAOCREDITADO, EL.DATAADMISSAO, EL.IDSITFUNC,                 '+
            '         EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL, DE.FLGBENEFICIARIO,       '+
            '         EL.TEMPOSERVTOTAL,    EL.DATADEMISSAO, EL.DATADEMISSAO,              '+
            '         EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
            '         PP.FLGDEVEPREVIDENC, PP.FLGDEVEASSISTENC, PP.FLGDEVEEMPRESTIMO,      '+
            '         PP.IDSITPART, PP.IDSITPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,        '+
            '         PP.IDPESSJUR,  PP.IDPLANOPREV, PP.INSCRICAODATA,SP.FLGINTERNO,      '+
            '         D.FLGDESIGNADO, DE.IDDEPENDENCIA, D.IDSITDEPENDENTE, DE.IDTITULAR,   '+
            '''' +DateToStr(date)+ ''' AS DATAREF, PF.NUMDEPIRRF '+
            ' FROM  ELEGPATRO EL, DEPENTIT DE, PESSOAFISICA PF, '+
            '       PARTPREVPLAN PP, SITPART SP, DEPENDENTE D '+
            ' WHERE PP.IDPESSOA    = ' + sidpessoaconspart + ' AND '+
            '       PP.SEQPROPOSTA = ' + sseqpropostaconspart + ' AND '+
            '       PP.IDPLANOPREV = ' + sidplanoprevconspart + ' AND '+
            '       PP.IDPESSJUR   = ' + sidpessjurconspart + ' AND '+
            '       DE.IDPESSOA    = ' + dtmConsPart.qryDepentit.FieldByName('IDPESSOA').AsString + ' AND '+
            '       DE.IDPESSOA    = D.IDPESSOA AND '+
            '       EL.IDPESSOA    = PP.IDPESSOA  AND '+
            '       EL.IDPESSJUR   = PP.IDPESSJUR AND '+
            '       SP.IDSITPART   = PP.IDSITPART AND '+
            '       DE.IDTITULAR   = EL.IDPESSOA  AND '+
            '       DE.IDPESSOA    = PF.IDPESSOA(+) ';

    bElegivel := RegraBooleana(sIDRGELEGBENEF, sSQL , bErro);

    dtmConsPart.qryDepentit.Edit;
    if bElegivel
    then dtmConsPart.qryDepentit.FieldByName('FLGELEGIVEL').AsInteger := 1
    else dtmConsPart.qryDepentit.FieldByName('FLGELEGIVEL').AsInteger := 0;
    dtmConsPart.qryDepentit.Post;
    dtmConsPart.qryDepentit.Next;
  end;
  dtmConsPart.qryDepentit.EnableControls;    //edilaine - SIG42986
  bRodandoElegibilidade := False;
end;


{ FUNCOES RELACIONADAS AO SISTEMA DE  REGRA DE NEGOCIO }
function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
var sResult : string;
    cAux    : char;
begin
   Result := True;
   bErro  := False;

   if Trim(sNumRegra) = '' then Exit;
   iIdCalculoGeral := 0;

   Result := False;
   with dtmConsPart do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      if qryRegra.IsEmpty
      then begin
         qryRegra.Close;
         tirasql(qryRegra);
         Exit;
      end;
      cAux := DecimalSeparator;
      regraAPrev.QueryIn := dtmConsPart.qryRegra;
      try
         regraAPrev.Execute;
      finally
         DecimalSeparator := cAux;
         iIdCalculoGeral := 0;
      end;
      if not regraAPrev.Error
      then begin
         sResult     := Trim(UpperCase(regraAPrev.Result));
         if sResult  = 'False'
         then Result := False
         else Result := True;
      end // if not regra.error
      else bErro     := True;
      qryRegra.Close;
   end;
end;

procedure TiraSQL( qry : TwwQuery);
begin
   with qry do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT 1 FROM DUAL ');
     Open;
     Close;
   end;
end;



procedure TFRMconspart.DadosPessoais_1Click(Sender: TObject);
begin
  //Darivaldo Alencar SIG 21868 -inicio
    if (nbkElegPart.ActivePage <> 'PgDadosPessoais') then  nbkElegPart.ActivePage := 'PgDadosPessoais';
  SelecionaTelaDados;
  PreparaCamposScrollBox;
  //Darivaldo Alencar SIG 21868 -fim
end;

procedure TFRMconspart.Documentos_1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgDocumentos'
end;

procedure TFRMconspart.NBKelegpartPageChanged(Sender: TObject);
var i          : Integer;
    stTipoTel  : String;
    DtAux      : TDateTime;
    sPlanoPrev : String; // Daniel - 26764
    iPlanoPrev : Integer; // Daniel - 27429
    qryAuxCPF: TwwQuery;
    sFiltroMes : String;  // SOL 245986 PPM 630400
    bInicioLaco : boolean;  // SOL 245986 PPM 630400
begin
  // Alterado por FHBS - 12/02/2020 - SIG97640
  chkREGREPLAN.checked := False;
  dbedDataCancelREG.text :=  '';
  chkREB.checked := False;
  dbedDataCancelREB.text := '';
  chkNOVOPLANO.checked := False;
  dbedDataCancelNOVO.text := '';
  // Alterado por FHBS - 12/02/2020 - SIG97640


  qryAuxCPF := TwwQuery.Create(Application);
  qryAuxCPF.DatabaseName := 'BaseDados';
  //Higor Nayde ferreira SOL 193317 Kintana 1854470


  // Daniel - 21394
  if (bFIario=False) then
       sIdTitular := FConsPessoaGeral.cIdTitular
  else sIdTitular := sTitular;
  // Fim.

  if (not fTitular) and (not bAcessaDependente) then begin
    if (FConsPessoaGeral.cIdpessoa<>'') then begin
      sIdPessoaConsPart  := FConsPessoaGeral.cIdPessoa;
      sIdPessJurConsPart := FConsPessoaGeral.cIdPessjur;
      iIdTitular         := StrToIntDef(FConsPessoaGeral.cIdTitular,-1);
      sIdTitular         := FConsPessoaGeral.cIdTitular; // André Tavares - 15518
      sIdPlanoPrev       := FConsPessoaGeral.cIdPlanoPrev; // Daniel - 26764
      sMtl               := FConsPessoaGeral.cMatricula; // Peterson Victor
    end;
  end;

  if (sIdPessoaConsPart='') then sIdPessoaConsPart := '-1';

  // Marchetti - 24692 e 25124
  if (Trim(sIdTitular)=Trim(sIdPessoaConsPart)) then begin
    lblSitBenefPlano.Visible := False;
    edtSitBenefPlano.Visible := False;
  end else begin
    lblSitBenefPlano.Visible := True;
    edtSitBenefPlano.Visible := True;
  end;
  // Fim.

// André Tavares - 18746 - Início ----------------------------------------------
  if not (dtmConsPart.qryPlanos.Active) then begin

    //executa a query listpatros

    // Thiago Melo SOL 210801 Kintana 2042824
    if (Trim(sIdTitular) = Trim(sIdPessoaConsPart)) then begin
      dtmConsPart.qryListPatros.ParamByName('idPessoa').asFloat := StrtoIntDef(sidpessoaconspart, -1);
    end else begin
      dtmConsPart.qryListPatros.ParamByName('idPessoa').asFloat := StrtoIntDef(sIdTitular, -1);
    end;
    //dtmConsPart.qryListPatros.ParamByName('idPessoa').asFloat := StrtoIntDef(sidpessoaconspart, -1);
    // Thiago Melo SOL 210801 Kintana 2042824
    dtmConsPart.qryListPatros.Open;

    dtmConsPart.qryPlanos.Sql.Clear;
    sPlanoPrev := sIdPlanoPrev; // Daniel - 26764
    if (Trim(sIdTitular)=Trim(sIdPessoaConsPart)) then begin
      dtmConsPart.qryPlanos.Sql.Add('SELECT PA.IDPLANOPREV, PA.SEQPROPOSTA, PA.IDPESSJUR, ');
      dtmConsPart.qryPlanos.Sql.Add('       PL.NOME, DECODE (PA.FLGDESATIVADO, 1, ''DESATIVADO'', 0, ''ATIVO'', NULL, ''ATIVO'') AS STATUS, ');
      dtmConsPart.qryPlanos.Sql.Add('       SIT.DESCRICAO AS SIT, PL.IDRGELEGBENEF, SITPP.DESCRICAO AS SITPLANO, ');
      dtmConsPart.qryPlanos.Sql.Add('       PA.INSCRICAODATA, PA.INSCRICAONUMERO, PA.DATACANCELAMENTO, EVENT.DATAMIGRACAO ');
      dtmConsPart.qryPlanos.Sql.Add('FROM PARTPREVPLAN PA, PLANPREV PL, SITPART SIT, SITPLANOPREV SITPP, ');
      dtmConsPart.qryPlanos.Sql.Add('   ( SELECT EP.IDPESSOA, EP.IDPLANOPREV, EP.IDPESSJUR, ');
      dtmConsPart.qryPlanos.Sql.Add('            TO_CHAR(EP.DATAEVENTO, ''DD/MM/YYYY'') AS DATAMIGRACAO ');
      dtmConsPart.qryPlanos.Sql.Add('     FROM EVENTOGERADOR EG, EVENTOSPREV EP, PARTPREVPLAN PP ');
      dtmConsPart.qryPlanos.Sql.Add('     WHERE EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR AND ');
      dtmConsPart.qryPlanos.Sql.Add('           EG.FLGINTERNO      = ''TP'' AND ');
      dtmConsPart.qryPlanos.Sql.Add('           PP.IDPESSOA        = :IDPESSOA AND ');
      dtmConsPart.qryPlanos.Sql.Add('           PP.IDPESSOA        = EP.IDPESSOA AND ');
      dtmConsPart.qryPlanos.Sql.Add('           PP.IDPLANOPREV     = EP.IDPLANOPREV AND ');
      dtmConsPart.qryPlanos.Sql.Add('           PP.IDPESSJUR       = EP.IDPESSJUR ) EVENT, ELEGPATRO EL ');
      dtmConsPart.qryPlanos.Sql.Add('WHERE (EL.IDPESSOA       = :IDPESSOA) ');
      dtmConsPart.qryPlanos.Sql.Add('  AND (EL.IDPESSOA       = PA.IDPESSOA(+)) ');
      dtmConsPart.qryPlanos.Sql.Add('  AND (EL.IDPESSJUR      = PA.IDPESSJUR(+)) ');
      dtmConsPart.qryPlanos.Sql.Add('  AND (PL.IDPLANOPREV    = PA.IDPLANOPREV) ');
      dtmConsPart.qryPlanos.Sql.Add('  AND (PA.IDSITPART      = SIT.IDSITPART(+)) ');
      // dtmConsPart.qryPlanos.Sql.Add('  AND (EL.IDPESSOA       = PJ.IDPESSOA     )');
      // dtmConsPart.qryPlanos.Sql.Add('  AND (PJ.NOME           = :PATROCINADORA  )');
      dtmConsPart.qryPlanos.Sql.Add('  AND (PA.IDPESSJUR           = :PATROCINADORA  )');
      dtmConsPart.qryPlanos.Sql.Add('  AND (PA.IDSITPLANOPREV = SITPP.IDSITPLANOPREV) ');
      dtmConsPart.qryPlanos.Sql.Add('  AND (EVENT.IDPESSOA(+) = PA.IDPESSOA) ');
      dtmConsPart.qryPlanos.Sql.Add('  AND (EVENT.IDPLANOPREV(+) = PA.IDPLANOPREV) '); // Ádler Souza - SOL127789 KTN680107
      dtmConsPart.qryPlanos.Sql.Add('  AND (PA.DATACANCELAMENTO = EVENT.DATAMIGRACAO(+)) '); // Ádler Souza - SOL127789 KTN680107

      dtmConsPart.qryPlanos.Sql.Add('ORDER BY PA.FLGDESATIVADO ');
      dtmConsPart.qryPlanos.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sIdTitular, -1);
      //Fanuel Junior
      dtmConsPart.qryPlanos.ParamByName('PATROCINADORA').AsString := FConsPessoaGeral.cIdPessjur;
    end else begin
      // Marchetti - 25124 e 24692

      //BRUNO AZEVEDO SOL 164831 KINTANA 1422552
      dtmConsPart.qryPlanos.Sql.Add('      SELECT DISTINCT ''BENEFICIÁRIO'' TESTE, ');
      dtmConsPart.qryPlanos.Sql.Add('       EVENT.IDPLANOPREV, ');
      dtmConsPart.qryPlanos.Sql.Add('       TO_CHAR(EVENT.SEQPROPOSTA) AS SEQPROPOSTA, ');
      dtmConsPart.qryPlanos.Sql.Add('       TO_CHAR(EVENT.IDPESSJUR) AS IDPESSJUR, ');
      dtmConsPart.qryPlanos.Sql.Add('       PL.NOME, ');
      dtmConsPart.qryPlanos.Sql.Add('       DECODE(EVENT.FLGDESATIVADO,1,''DESATIVADO'',0,''ATIVO'',NULL,''ATIVO'') AS STATUS, ');
      dtmConsPart.qryPlanos.Sql.Add('       SIT.DESCRICAO AS SIT, ');
      dtmConsPart.qryPlanos.Sql.Add('       PL.IDRGELEGBENEF, ');
      dtmConsPart.qryPlanos.Sql.Add('       SITPP.DESCRICAO AS SITPLANO, ');
      dtmConsPart.qryPlanos.Sql.Add('       NVL(PA.INSCRICAODATA,EVENT.DATAINICIO) INSCRICAODATA, ');
      dtmConsPart.qryPlanos.Sql.Add('       PA.INSCRICAONUMERO, ');
      dtmConsPart.qryPlanos.Sql.Add('       EVENT.DATACANCELAMENTO, ');
      dtmConsPart.qryPlanos.Sql.Add('       EVENT.DATAMIGRACAO, ');
      dtmConsPart.qryPlanos.Sql.Add('       PA.FLGDESATIVADO ');
      dtmConsPart.qryPlanos.Sql.Add('FROM (SELECT EP.IDPESSOA, ');
      dtmConsPart.qryPlanos.Sql.Add('             EP.IDPESSOA IDTITULAR, ');
      dtmConsPart.qryPlanos.Sql.Add('             EP.SEQPROPOSTA, ');
      dtmConsPart.qryPlanos.Sql.Add('             PP.FLGDESATIVADO, ');
      dtmConsPart.qryPlanos.Sql.Add('             EP.IDPLANOPREV, ');
      dtmConsPart.qryPlanos.Sql.Add('             EP.IDPESSJUR, ');
      dtmConsPart.qryPlanos.Sql.Add('             TO_CHAR(EP.DATAEVENTO,''DD/MM/YYYY'') AS DATAMIGRACAO, ');
      dtmConsPart.qryPlanos.Sql.Add('             NULL DATAINICIO, ');
      dtmConsPart.qryPlanos.Sql.Add('             PP.DATACANCELAMENTO ');
      dtmConsPart.qryPlanos.Sql.Add('      FROM EVENTOGERADOR EG, ');
      dtmConsPart.qryPlanos.Sql.Add('           EVENTOSPREV EP, ');
      dtmConsPart.qryPlanos.Sql.Add('           PARTPREVPLAN PP ');
      dtmConsPart.qryPlanos.Sql.Add('      WHERE EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR ');
      dtmConsPart.qryPlanos.Sql.Add('        AND EG.FLGINTERNO = ''TP'' ');
      dtmConsPart.qryPlanos.Sql.Add('        AND PP.IDPESSOA = EP.IDPESSOA ');
      dtmConsPart.qryPlanos.Sql.Add('        AND PP.IDPLANOPREV = EP.IDPLANOPREV ');
      dtmConsPart.qryPlanos.Sql.Add('        AND PP.IDPESSJUR = EP.IDPESSJUR ');
      dtmConsPart.qryPlanos.Sql.Add('      UNION ');
      dtmConsPart.qryPlanos.Sql.Add('      SELECT BF.IDPESSOA, ');
      dtmConsPart.qryPlanos.Sql.Add('             BF.IDTITULAR, ');
      dtmConsPart.qryPlanos.Sql.Add('             BF.SEQPROPOSTA, ');
      dtmConsPart.qryPlanos.Sql.Add('             DECODE(BF.IDSITBENEFICIO,1,0,1), ');
      dtmConsPart.qryPlanos.Sql.Add('             BF.IDPLANOPREV, ');
      dtmConsPart.qryPlanos.Sql.Add('             BF.IDPESSJUR, ');
      dtmConsPart.qryPlanos.Sql.Add('             NULL DATAMIGRACAO, ');
      dtmConsPart.qryPlanos.Sql.Add('             TO_CHAR(BF.DATAINICIO,''DD/MM/YYYY'') DATAINICIO, ');
      dtmConsPart.qryPlanos.Sql.Add('             BF.DATAFINAL ');
      dtmConsPart.qryPlanos.Sql.Add('      FROM BENEFBFCIARIO BF ');
      dtmConsPart.qryPlanos.Sql.Add('      WHERE BF.IDTITULAR <> BF.IDPESSOA AND ');

      // Thiago Melo SOL 210801 Kintana 2042824
{      dtmConsPart.qryPlanos.Sql.Add('            BF.IDTPPAGTOBENEFIC = 1 AND ');
      dtmConsPart.qryPlanos.Sql.Add('            BF.FONTEPAGADORA = 1) EVENT ');
      dtmConsPart.qryPlanos.Sql.Add('            BF.IDTPPAGTOBENEFIC = 1) EVENT ');}
      // Thiago Melo SOL 210801 Kintana 2042824

      // Taffarel - SIG59307
      dtmConsPart.qryPlanos.Sql.Add('     BF.NUMEROPROCESSO IN');
      dtmConsPart.qryPlanos.Sql.Add('     (SELECT MAX(bf2.numeroprocesso)');
      dtmConsPart.qryPlanos.Sql.Add('           FROM benefbfciario bf2');
      dtmConsPart.qryPlanos.Sql.Add('          WHERE bf2.idpessoa = bf.idpessoa');
      dtmConsPart.qryPlanos.Sql.Add('            AND bf2.idtitular = bf.idtitular');
      dtmConsPart.qryPlanos.Sql.Add('            AND bf2.idplanoprev = bf.idplanoprev');
      dtmConsPart.qryPlanos.Sql.Add('            AND DECODE(BF2.IDSITBENEFICIO, 1, 0, 1) =');
      dtmConsPart.qryPlanos.Sql.Add('                   (SELECT MIN(DECODE(BF1.IDSITBENEFICIO, 1, 0, 1))');
      dtmConsPart.qryPlanos.Sql.Add('                           FROM benefbfciario bf1');
      dtmConsPart.qryPlanos.Sql.Add('                          WHERE bf1.idpessoa = bf.idpessoa');
      dtmConsPart.qryPlanos.Sql.Add('                           AND bf1.idtitular = bf.idtitular');
      dtmConsPart.qryPlanos.Sql.Add('                           AND bf1.idplanoprev = bf.idplanoprev))) EVENT ');
      // Taffarel - SIG59307

      dtmConsPart.qryPlanos.Sql.Add('     JOIN PLANPREV PL ON EVENT.IDPLANOPREV = PL.IDPLANOPREV ');
      dtmConsPart.qryPlanos.Sql.Add('     JOIN DEPENTIT EL ON EVENT.IDPESSOA = EL.IDPESSOA AND ');
      dtmConsPart.qryPlanos.Sql.Add('                         EVENT.IDTITULAR = EL.IDTITULAR ');
      dtmConsPart.qryPlanos.Sql.Add('     LEFT JOIN PARTPREVPLAN PA ON EL.IDTITULAR = PA.IDPESSOA AND ');
      dtmConsPart.qryPlanos.Sql.Add('                                  EVENT.IDPLANOPREV = PA.IDPLANOPREV ');
      dtmConsPart.qryPlanos.Sql.Add('     LEFT JOIN SITPART SIT ON PA.IDSITPART = SIT.IDSITPART ');
      dtmConsPart.qryPlanos.Sql.Add('     LEFT JOIN SITPLANOPREV SITPP ON PA.IDSITPLANOPREV = SITPP.IDSITPLANOPREV ');
      dtmConsPart.qryPlanos.Sql.Add('WHERE EVENT.IDPESSOA = :IDPESSOA AND ');
      dtmConsPart.qryPlanos.Sql.Add('      EVENT.IDTITULAR = :IDTITULAR ');
      //BRUNO AZEVEDO SOL 164831 KINTANA 1422552

      {dtmConsPart.qryPlanos.Sql.Add('SELECT DISTINCT BF.IDPLANOPREV, BF.SEQPROPOSTA, ');
      dtmConsPart.qryPlanos.Sql.Add('       BF.IDPESSJUR, PP.NOME, ');
      dtmConsPart.qryPlanos.Sql.Add('       SIT.DESCRICAO AS SIT, ');
      dtmConsPart.qryPlanos.Sql.Add('       PP.IDRGELEGBENEF, ');
      dtmConsPart.qryPlanos.Sql.Add('       SITP.DESCRICAO AS SITPLANO, ');
      dtmConsPart.qryPlanos.Sql.Add('       0 AS INSCRICAONUMERO ');
      // Fim.

      dtmConsPart.qryPlanos.Sql.Add('FROM BENEFBFCIARIO BF,PLANPREV PP, ');
      dtmConsPart.qryPlanos.Sql.Add('     PARTPREVPLAN PA, SITPART SIT, '); // Marchetti - 19217
      dtmConsPart.qryPlanos.Sql.Add('     SITPLANOPREV SITP, '); // Marchetti - 25124 e 24692

// Marchetti - 22128 - Início --------------------------------------------------
      dtmConsPart.qryPlanos.Sql.Add('     ( ');
      dtmConsPart.qryPlanos.Sql.Add('       SELECT ');
      dtmConsPart.qryPlanos.Sql.Add('              DISTINCT DECODE(ATIV.IDSITBENEFICIO,NULL,DECODE(DESAT.IDSITBENEFICIO,3,''DESATIVADO'',''ATIVO''),''ATIVO'') AS SITPLANO ');
      dtmConsPart.qryPlanos.Sql.Add('       FROM ');
      dtmConsPart.qryPlanos.Sql.Add('            BENEFBFCIARIO BF, ');
      dtmConsPart.qryPlanos.Sql.Add('          ( ');
      dtmConsPart.qryPlanos.Sql.Add('            SELECT DISTINCT ');
      dtmConsPart.qryPlanos.Sql.Add('                   IDPESSOA, IDSITBENEFICIO ');
      dtmConsPart.qryPlanos.Sql.Add('            FROM ');
      dtmConsPart.qryPlanos.Sql.Add('                 BENEFBFCIARIO ');
      dtmConsPart.qryPlanos.Sql.Add('            WHERE ');
      dtmConsPart.qryPlanos.Sql.Add('                  IDPESSOA = :IDPESSOA ');
      dtmConsPart.qryPlanos.Sql.Add('              AND IDPESSJUR = :PATROCINADORA '); // Fanuel SOL 149792 Kintana 1079222
      dtmConsPart.qryPlanos.Sql.Add('              AND IDSITBENEFICIO = 3 ');
      dtmConsPart.qryPlanos.Sql.Add('          ) DESAT, ');
      dtmConsPart.qryPlanos.Sql.Add('          ( ');
      dtmConsPart.qryPlanos.Sql.Add('            SELECT DISTINCT ');
      dtmConsPart.qryPlanos.Sql.Add('                   IDPESSOA, IDSITBENEFICIO ');
      dtmConsPart.qryPlanos.Sql.Add('            FROM ');
      dtmConsPart.qryPlanos.Sql.Add('                 BENEFBFCIARIO ');
      dtmConsPart.qryPlanos.Sql.Add('            WHERE ');
      dtmConsPart.qryPlanos.Sql.Add('                  IDPESSOA = :IDPESSOA ');
      dtmConsPart.qryPlanos.Sql.Add('              AND IDPESSJUR = :PATROCINADORA '); // Fanuel SOL 149792 Kintana 1079222
      dtmConsPart.qryPlanos.Sql.Add('              AND IDSITBENEFICIO <> 3 ');
      dtmConsPart.qryPlanos.Sql.Add('          ) ATIV ');
      dtmConsPart.qryPlanos.Sql.Add('       WHERE ');
      dtmConsPart.qryPlanos.Sql.Add('             BF.IDPESSOA = DESAT.IDPESSOA(+) ');
      dtmConsPart.qryPlanos.Sql.Add('         AND BF.IDPESSOA = ATIV.IDPESSOA(+) ');
      dtmConsPart.qryPlanos.Sql.Add('         AND BF.IDPESSOA = :IDPESSOA ');
      dtmConsPart.qryPlanos.Sql.Add('         AND BF.IDPESSJUR = :PATROCINADORA '); // Fanuel SOL 149792 Kintana 1079222
      dtmConsPart.qryPlanos.Sql.Add('     ) SITPLANO, ');
// Marchetti - 22128 - Fim -----------------------------------------------------

      dtmConsPart.qryPlanos.Sql.Add('     ( SELECT M1.IDPESSOA, M1.IDTITULAR, M1.IDPLANOPREV, M1.IDPESSJUR, ');
      dtmConsPart.qryPlanos.Sql.Add('             M1.DATAMOV AS DATACANCELAMENTO FROM MOVBENEF M1 ');
      dtmConsPart.qryPlanos.Sql.Add('       WHERE M1.IDPESSOA IN (SELECT M2.IDPESSOA FROM MOVBENEF M2 ');
      dtmConsPart.qryPlanos.Sql.Add('       WHERE TIPOMOV = 7 AND M2.DATAMOV = M1.DATAMOV AND M2.IDPESSOA = M1.IDPESSOA) ');
      dtmConsPart.qryPlanos.Sql.Add('         AND M1.TIPOMOV = 4 AND IDTITULAR <> IDPESSOA) MB, ');
      dtmConsPart.qryPlanos.Sql.Add('     ( SELECT M1.IDPESSOA, M1.IDTITULAR, M1.IDPLANOPREV, M1.IDPESSJUR, ');
      dtmConsPart.qryPlanos.Sql.Add('              M1.DATAMOV AS INSCRICAODATA FROM MOVBENEF M1 ');
      dtmConsPart.qryPlanos.Sql.Add('       WHERE M1.TIPOMOV = 7 AND IDTITULAR <> IDPESSOA) MBC ');
      dtmConsPart.qryPlanos.Sql.Add('WHERE BF.IDPESSOA       = :IDPESSOA AND ');
      dtmConsPart.qryPlanos.Sql.Add('      BF.IDPESSJUR      = :PATROCINADORA AND '); // Fanuel SOL 149792 Kintana 1079222
      dtmConsPart.qryPlanos.Sql.Add('      BF.IDTITULAR     <> BF.IDPESSOA       AND ');
      dtmConsPart.qryPlanos.Sql.Add('      PP.IDPLANOPREV    = PA.IDPLANOPREV    AND '); // Ádler Souza - SOL127789 KTN680107
      dtmConsPart.qryPlanos.Sql.Add('      BF.IDPESSOA       = MB.IDPESSOA(+)    AND ');
      dtmConsPart.qryPlanos.Sql.Add('      BF.IDTITULAR      = MB.IDTITULAR(+)   AND ');
      dtmConsPart.qryPlanos.Sql.Add('      BF.IDPESSJUR      = MB.IDPESSJUR(+)   AND ');
      dtmConsPart.qryPlanos.Sql.Add('      BF.IDPLANOPREV    = MB.IDPLANOPREV(+) AND ');
      dtmConsPart.qryPlanos.Sql.Add('      BF.IDPESSOA       = MBC.IDPESSOA(+)   AND ');
      dtmConsPart.qryPlanos.Sql.Add('      BF.IDTITULAR      = MBC.IDTITULAR(+)  AND ');
      dtmConsPart.qryPlanos.Sql.Add('      BF.IDPESSJUR      = MBC.IDPESSJUR(+)  AND ');

      // Marchetti - 19217
      dtmConsPart.qryPlanos.Sql.Add('      PA.IDPESSOA(+)    = BF.IDTITULAR      AND ');
      
      dtmConsPart.qryPlanos.Sql.add('      PA.IDPESSJUR      = BF.IDPESSJUR      AND ');
      dtmConsPart.qryPlanos.Sql.add('      PA.IDPLANOPREV    = BF.IDPLANOPREV    AND ');

      dtmConsPart.qryPlanos.Sql.Add('      SIT.IDSITPART(+)  = PA.IDSITPART      AND ');
      // Fim.

      dtmConsPart.qryPlanos.Sql.Add('      BF.IDPLANOPREV    = MBC.IDPLANOPREV(+) ');
      dtmConsPart.qryPlanos.Sql.Add('      AND SITP.IDSITPLANOPREV = PA.IDSITPLANOPREV '); // Marchetti - 25124 e 24692  }
      dtmConsPart.qryPlanos.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sIdPessoaConsPart,-1);
      //BRUNO AZEVEDO SOL 164831 KINTANA 1422552
      dtmConsPart.qryPlanos.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(Trim(sIdTitular),-1);
      //dtmConsPart.qryPlanos.ParamByName('PATROCINADORA').AsString := FConsPessoaGeral.cIdPessjur; // Fanuel SOL 149792 Kintana 1079222
      //BRUNO AZEVEDO SOL 164831 KINTANA 1422552
    end;
  end else sPlanoPrev := DblkPlanos.LookupValue; // Daniel - 26764
// André Tavares - 18746 - Fim -------------------------------------------------

  if not dtmConsPart.qryPlanos.Active then dtmConsPart.qryPlanos.Open;

  // Daniel - 27429
  if (sPlanoPrev='') then
       iPlanoPrev := 0
  else iPlanoPrev := StrToInt(sPlanoPrev);
  // Fim.

  if (DblkPatro.LookupValue = '') then begin
    DblkPatro.LookupValue := FConsPessoaGeral.cIdPessjur;
  end;

  DblkPlanos.LookupValue := sPlanoPrev; // Daniel - 26764

  sidplanoprevconspart := sPlanoPrev;  //Jéssica Lana SOL125889 KTN653789

  // Daniel - 26764 (2ª)
  qryMatricula.ParamByName('PIDPLANOPREV').AsInteger := iPlanoPrev; // Daniel - 27429
  qryMatricula.ParamByName('PIDPESSOA').AsInteger    := StrtoIntDef(sIdPessoaConsPart,-1);
  qryMatricula.ParamByName('MATRICULA').AsString     := sIdPessjurConsPart;  //Jéssica SOL 124776
  //qryMatricula.ParamByName('MATRICULA').AsInteger    := StrtoIntDef(sIdPessjurConsPart, -1);
  qryMatricula.Open;
  // Fim.

  // Marchetti - 24692 e 25124
  DtmconsPart1.qrySitBenefPlano.Close;
  DtmconsPart1.qrySitBenefPlano.ParamByName('PIDPESSOA').AsInteger    := StrtoIntDef(sIdPessoaConsPart,-1);
  DtmconsPart1.qrySitBenefPlano.ParamByName('PIDPLANOPREV').AsInteger := StrToIntDef(DblkPlanos.LookupValue,-1);
  DtmconsPart1.qrySitBenefPlano.Open;
  // Fim.

  dtmConsPart.qryPlanos.Locate('IDPESSJUR; IDPLANOPREV', VarArrayOf([StrToIntDef(sIdPessJurConspart,-1),StrToIntDef(DblkPlanos.LookupValue,-1)]),[loCaseInsensitive]);
  DblkPlanos.Text        := dtmConsPart.qryPlanos.FieldByName('NOME').AsString;
  DblkPlanos.LookupValue := dtmConsPart.qryPlanos.FieldByName('IDPLANOPREV').AsString;

// André Tavares - 04/10/2004 - 17503 - Início ---------------------------------
  if (Trim(sIdTitular) <> Trim(sIdpessoaConsPart)) and not (dtmConsPart1.qryPlanoBenefciario.Active) then begin
    dtmConsPart1.qryPlanoBenefciario.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sIdTitular,-1);
    dtmConsPart1.qryPlanoBenefciario.ParamByName('IDPESSOA').AsFloat  := StrtoIntDef(sIdPessoaConsPart,-1);
    dtmConsPart1.qryPlanoBenefciario.Open;
    DblkPlanos.Enabled := True;

    if not dtmConsPart1.qryPlanoBenefciario.IsEmpty then DblkPlanos.text := dtmConsPart1.qryPlanoBenefciario.FieldByName('NOME').AsString;

    DblkPlanos.Enabled := False;
  end;

  DblkPlanos.Enabled := dtmConsPart.qryPlanos.RecordCount>1;
// André Tavares - 04/10/2004 - 17503 - Fim ------------------------------------

// André Tavares - 26/10/2004 - 17825 - Início ---------------------------------
  dtmConsPart1.qryDadosTitular.Close;
  dtmConsPart1.qryDadosTitular.ParamByName('IDTITULAR').AsInteger   := StrToIntDef(sIdTitular,-1);
  dtmConsPart1.qryDadosTitular.ParamByName('IDPLANOPREV').AsInteger := StrToIntDef(DblkPlanos.LookupValue,-1); // Marchetti - 25810
  dtmConsPart1.qryDadosTitular.Open;

  // Marchetti - 25002
  if Sistema.TipoCliente = 19991 then
       // Alberto - 22425 - 12/06/2006
       dtmConsPart1.qryDadosTitular.Locate('IDPESSJUR', StrToIntDef(FConsPessoaGeral.cIdPessjur,-1),[loCaseInsensitive])
  else dtmConsPart1.qryDadosTitular.Locate('IDPESSJUR', strToIntDef(sIdPessJurConspart, -1), [loCaseInsensitive]);
  // Fim.
// André Tavares - 26/10/2004 - 17825 - Início ---------------------------------

  // Marchetti - 24030
  if Sistema.TipoCliente = 19991 then
     dtAux := BuscaDtEntrada(StrToInt(sIdTitular),StrToIntDef(sIdPessjurConsPart,-1),dtmConsPart.qryPlanos.FieldByName('IDPLANOPREV').AsInteger);
  // Fim

  if NBKelegpart.ActivePage = 'PgDadosPessoais' then (* PgDadosPessoais - 1 *)
  begin
    HabilitaMenuItens;
    MostraBloqueio;

    // Busca um participante ou dependente
    if (not dtmConsPart.qrypartgeral.Active)       and
       (not dtmConsPart.qryDependente.Active)      and
       (not dtmConsPart.qryRespNaoElegivel.Active) and
       (not dtmConsPart.qryRecebedorPensaoAlim.Active) then begin
      frmAguarde.Min := 0;
      frmaguarde.Max := 2;
      frmAguarde.Mostra('Buscando Dados da Pessoa Selecionada ...');
      frmAguarde.Pos := 1;
      frmAguarde.Repaint;

      // Tavares 22/11/2002
      sIdPlanoPrevConsPart := intToStr(strToIntDef(dtmConsPart.qryPlanos.FieldByName('IDPLANOPREV').AsString,-1));
      sIdPessJurConsPart   := intToStr(strToIntDef(dtmConsPart.qryPlanos.FieldByName('IDPESSJUR').AsString,StrToIntDef(FConsPessoaGeral.cIdPessjur,-1)));
      sIdPlanoPrevConsPart := intToStr(strToIntDef(dtmConsPart.qryPlanos.FieldByName('IDPLANOPREV').AsString,-1));
      sSeqPropostaConsPart := intToStr(strToIntDef(dtmConsPart.qryPlanos.FieldByName('SEQPROPOSTA').AsString,-1));
      sIDRGELEGBENEF       := dtmConsPart.qryPlanos.FieldByName('IDRGELEGBENEF').AsString;

      dtmConsPart.DsPartGeral.DataSet.Close;
                                   
      if not dtmConsPart.qryPartGeral.Active and (Trim(sIdTitular)=Trim(sIdPessoaConsPart)) then begin
        dtmConsPart.DsPartGeral.DataSet                          := dtmConsPart.qryPartGeral;
        dtmConsPart.qryPartGeral.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sIdPessoaConsPart,-1);

        if (dtmConsPart.qryPartGeral.Prepared) then dtmConsPart.qryPartGeral.unPrepare;

        dtmConsPart.qryPartGeral.Prepare;
        dtmConsPart.qryPartGeral.Open;

        if not (dtmConsPart.qryPartGeral.IsEmpty) then begin             // FDias - 11.12.2003
          dtmConsPart.qryRecebDadosPessoais.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sIdPessoaConsPart,-1);

          { David - 20656 - A query foi alterada e agora pego os números dos
            documentos sem que seja necessário informar IDOCUMENTO (independente
            da fundação). }

          dtmConsPart.qryRecebDadosPessoais.Prepare;
          dtmConsPart.qryRecebDadosPessoais.Open;

          if not (dtmConsPart.qryRecebDadosPessoais.IsEmpty) then begin
            lblNomeRecebDadosPessoais.Visible       := True;
            lblCPFRecebDadosPessoais.Visible        := True;
            lblRGRecebDadosPessoais.Visible         := True;
            lblExpedicaoRecebDadosPessoais.Visible  := True;
            lblUFRecebDadosPessoais.Visible         := True;
            dbedNomeRecebDadosPessoais.Visible      := True;
            dbedCPFRecebDadosPessoais.Visible       := True;
            dbedRGRecebDadosPessoais.Visible        := True;
            dbedExpedicaoRecebDadosPessoais.Visible := True;
            dbedUFRecebDadosPessoais.Visible        := True;
          end else begin
            lblNomeRecebDadosPessoais.Visible       := False;
            lblCPFRecebDadosPessoais.Visible        := False;
            lblRGRecebDadosPessoais.Visible         := False;
            lblExpedicaoRecebDadosPessoais.Visible  := False;
            lblUFRecebDadosPessoais.Visible         := False;
            dbedNomeRecebDadosPessoais.Visible      := False;
            dbedCPFRecebDadosPessoais.Visible       := False;
            dbedRGRecebDadosPessoais.Visible        := False;
            dbedExpedicaoRecebDadosPessoais.Visible := False;
            dbedUFRecebDadosPessoais.Visible        := False;
          end;

          //edilaine - SIG42986 - inicio
          rbMolestiaTitSim.checked := dtmConsPart.qryPartGeral.FieldByName('FLGMOLESTIAGRAVE').AsString = 'Sim';
          rbMolestiaTitNao.checked := dtmConsPart.qryPartGeral.FieldByName('FLGMOLESTIAGRAVE').AsString <> 'Sim';
          //edilaine - SIG42986 - fim

          CarregarImagemPessoa(TBlobField(dtmConsPart.qryPartGeral.FieldByName('IMAGEM')), imgPessoa1);   //edilaine WO41032

          frmAguarde.Next;
          frmAguarde.Repaint;
        end;
      end;

      // André Tavares - 18/09/2003 - 15055
      if (not (dtmConsPart.qryPartGeral.Active)) or ((dtmConsPart.qryPartGeral.IsEmpty) and
              (dtmConsPart.qryPartGeral.Active)) then begin
        if not (dtmConsPart.qryDependente.Active) then begin
          dtmConsPart.DsPartGeral.DataSet                           := dtmConsPart.qryDependente;
          dtmConsPart.qryDependente.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sIdPessoaConsPart,-1);

          if not (dtmConsPart.qryDependente.Prepared) then dtmConsPart.qryDependente.unPrepare;

          dtmConsPart.qryDependente.Prepare;
          dtmConsPart.qryDependente.Open;

          if not (dtmConsPart.qryDependente.IsEmpty) then begin //Fdias - Funcef - 11.12.2003
            dtmConsPart.qryRecebDadosPessoais.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sIdPessoaConsPart,-1);

            { David - 20656 - A query foi alterada e agora pego os números dos
              documentos sem que seja necessário informar IDOCUMENTO
              (independente da fundação). }

            dtmConsPart.qryRecebDadosPessoais.Prepare;
            dtmConsPart.qryRecebDadosPessoais.Open;

            if not (dtmConsPart.qryRecebDadosPessoais.IsEmpty) then begin
              lblNomeRecebDadosPessoais.Visible       := True;
              lblCPFRecebDadosPessoais.Visible        := True;
              lblRGRecebDadosPessoais.Visible         := True;
              lblExpedicaoRecebDadosPessoais.Visible  := True;
              lblUFRecebDadosPessoais.Visible         := True;
              dbedNomeRecebDadosPessoais.Visible      := True;
              dbedCPFRecebDadosPessoais.Visible       := True;
              dbedRGRecebDadosPessoais.Visible        := True;
              dbedExpedicaoRecebDadosPessoais.Visible := True;
              dbedUFRecebDadosPessoais.Visible        := True;
            end else begin
              lblNomeRecebDadosPessoais.Visible       := False;
              lblCPFRecebDadosPessoais.Visible        := False;
              lblRGRecebDadosPessoais.Visible         := False;
              lblExpedicaoRecebDadosPessoais.Visible  := False;
              lblUFRecebDadosPessoais.Visible         := False;
              dbedNomeRecebDadosPessoais.Visible      := False;
              dbedCPFRecebDadosPessoais.Visible       := False;
              dbedRGRecebDadosPessoais.Visible        := False;
              dbedExpedicaoRecebDadosPessoais.Visible := False;
              dbedUFRecebDadosPessoais.Visible        := False;
            end;

            frmAguarde.Next;
            frmAguarde.Repaint;
          end;
        end;
      end;

      // Se não é um participante ou dependente  - (só pode ser um recebedor ou um responsável)
      // André Tavares - 18/09/2003 - 15055
      if (not (dtmConsPart.qryPartGeral.Active)) and ((dtmConsPart.qryDependente.IsEmpty) and
              (dtmConsPart.qryDependente.Active)) then begin

        // Busca um reponsável não elegível
        if not (dtmConsPart.qryRespNaoElegivel.Active) then begin
          dtmConsPart.DsPartGeral.DataSet                                := dtmConsPart.qryRespNaoElegivel;
          dtmConsPart.qryRespNaoElegivel.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sIdPessoaConsPart,-1);

          if not (dtmConsPart.qryRespNaoElegivel.Prepared) then
            dtmConsPart.qryRespNaoElegivel.unPrepare;

          dtmConsPart.qryRespNaoElegivel.Prepare;
          dtmConsPart.qryRespNaoElegivel.Open;

          if not (dtmConsPart.qryRespNaoElegivel.IsEmpty) then begin
            frmAguarde.Next;
            frmAguarde.Repaint;
          end;
        end;
      end;

      // André Tavares - 18/09/2003 - 15055
      if (not (dtmConsPart.qryPartGeral.Active)) and ((dtmConsPart.qryRespNaoElegivel.IsEmpty) and
              (dtmConsPart.qryRespNaoElegivel.Active)) then begin

        // Busca um recebedor de Pensao Alimentícia
        if not (dtmConsPart.qryRecebedorPensaoAlim.Active) then begin
          if not (dtmConsPart.qryRecebedorPensaoAlim.Prepared) then dtmConsPart.qryRecebedorPensaoAlim.Prepare;

          dtmConsPart.DsPartGeral.DataSet                                    := dtmConsPart.qryRecebedorPensaoAlim;
          dtmConsPart.qryRecebedorPensaoAlim.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sIdPessoaConsPart,-1);
          dtmConsPart.qryRecebedorPensaoAlim.Open;

          if not (dtmConsPart.qryRecebedorPensaoAlim.IsEmpty) then begin
            frmAguarde.Next;
            frmAguarde.Repaint;
          end;
        end;
      end;

      // André Tavares - 18/09/2003 - 15055
      if ((dtmConsPart.qryPartGeral.IsEmpty=True)) and ((dtmConsPart.qryRecebedorPensaoAlim.IsEmpty=True) or
          (dtmConsPart.qryRecebedorPensaoAlim.IsEmpty=True)) then begin

        // Busca dados da pessoa que é somente elegível
        if not (dtmConsPart.qrySoElegivel.Active) then begin
          if not (dtmConsPart.qrySoElegivel.Prepared) then dtmConsPart.qrySoElegivel.Prepare;

          dtmConsPart.DsPartGeral.DataSet                            := dtmConsPart.qrySoElegivel;
          dtmConsPart.qrySoElegivel.ParamByName('IDPESSOA').AsFloat  := StrToIntDef(sIdPessoaConsPart,-1);
          dtmConsPart.qrySoElegivel.ParamByName('IDTITULAR').AsFloat := StrToIntDef(sIdTitular,-1); // Marchetti - 25400
          dtmConsPart.qrySoElegivel.Open;

          if not (dtmConsPart.qrySoElegivel.IsEmpty) then begin
            frmAguarde.Next;
            frmAguarde.Repaint;
          end;
        end;
      end;

      frmAguarde.Apaga;

// Andre Tavares - 17477 - 05/10/2004 - Início ---------------------------------
      if not (dtmConsPart1.qryMessagemFiario.Active) then begin
        dtmConsPart1.qryMessagemFiario.ParamByName('IDPESSOA').AsFloat  := StrtoIntDef(sIdPessoaConsPart,-1);
        dtmConsPart1.qryMessagemFiario.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sIdTitular,-1);
        dtmConsPart1.qryMessagemFiario.Open;
        dtmConsPart1.qryMessagemFiario.First;

        if not (dtmConsPart1.qryMessagemFiario.IsEmpty) then begin
          dtmConsPart1.qryMessagemFiario.fetchall; //Andre Imakawa - SIG 88279
          rEditMSG.Text      := dtmConsPart1.qryMessagemFiario.FieldByName('DESCRICAO').AsString;
          twMensagem.Visible := True;
          BitBtn2.Enabled    := dtmConsPart1.qryMessagemFiario.RecordCount>1;
          BitBtn3.Enabled    := False;
        end;
      end;
// Andre Tavares - 17477 - 05/10/2004 - Fim ------------------------------------

      // Faz o cálculo da Idade da Pessoa
      DbedIdade.Text := '';

      if (not dtmConsPart.DsPartGeral.DataSet.FieldByName('DATANASC').IsNull) and
         (dtmConsPart.DsPartGeral.DataSet.FieldByName('DATAMORTE').IsNull) then
           DbedIdade.Text := IntToStr(Trunc((Date-dtmConsPart.DsPartGeral.DataSet.FieldByName('DATANASC').AsDateTime)/365.25)) //Sol 141514 Kintana 895847 alterado a forma de calculo de 365 passou a ser dividido por 365.25
      else DbedIdade.Text := IntToStr(Trunc((dtmConsPart.DsPartGeral.DataSet.FieldByName('DATAMORTE').AsDateTime-dtmConsPart.DsPartGeral.DataSet.FieldByName('DATANASC').AsDateTime)/365.25));//Sol 141514 Kintana 895847 alterado a forma de calculo de 365 passou a ser dividido por 365.25

      // Põe o número de elegíveis a benefício
      dbedNumElegBenef.Text := IntToStr(ContaElegiveisAbeneficio);
    end;

    // André Tavares - 27/11/2003 - 15543
    dtAux := BuscaDtEntrada(StrToInt(sIdTitular),StrToIntDef(sIdPessjurConsPart,-1),dtmConsPart.qryPlanos.FieldByName('IDPLANOPREV').AsInteger);

    if ( Trim(pgAcessoDireto)<>'' ) then NBKelegpart.ActivePage := pgAcessoDireto;

    // Marchetti - Pendencia 24727
    // Somente pega a matricula, caso a query não retorne a matricula do participante pelo fato dele ser pensionista
    if edtMatricula.Text = '' then edtMatricula.Text := GetMatricula;
    // Fim.
  end (* Fim PgDadosPessoais - 1 *)
  else
  //Peterson Victor SIG21868 - INICIO
  if (NBKelegpart.ActivePage = 'PgDadosPessoaisDepen') then
  begin
    HabilitaMenuItens;
    MostraBloqueio;

    // Busca um participante ou dependente
    if (not dtmConsPart.qrypartgeral.Active)       and
       (not dtmConsPart.qryDependente.Active)      and
       (not dtmConsPart.qryRespNaoElegivel.Active) and
       (not dtmConsPart.qryRecebedorPensaoAlim.Active) then
    begin
      frmAguarde.Min := 0;
      frmaguarde.Max := 2;
      frmAguarde.Mostra('Buscando Dados da Pessoa Selecionada ...');
      frmAguarde.Pos := 1;
      frmAguarde.Repaint;

      sIdPlanoPrevConsPart := intToStr(strToIntDef(dtmConsPart.qryPlanos.FieldByName('IDPLANOPREV').AsString,-1));
      sIdPessJurConsPart   := intToStr(strToIntDef(dtmConsPart.qryPlanos.FieldByName('IDPESSJUR').AsString,StrToIntDef(FConsPessoaGeral.cIdPessjur,-1)));
      sIdPlanoPrevConsPart := intToStr(strToIntDef(dtmConsPart.qryPlanos.FieldByName('IDPLANOPREV').AsString,-1));
      sSeqPropostaConsPart := intToStr(strToIntDef(dtmConsPart.qryPlanos.FieldByName('SEQPROPOSTA').AsString,-1));
      sIDRGELEGBENEF       := dtmConsPart.qryPlanos.FieldByName('IDRGELEGBENEF').AsString;

      dtmConsPart.DsPartGeral.DataSet.Close;


      if not dtmConsPart.qryPartGeral.Active and (Trim(sIdTitular)=Trim(sIdPessoaConsPart)) then
       begin
        dtmConsPart.DsPartGeral.DataSet                          := dtmConsPart.qryPartGeral;
        dtmConsPart.qryPartGeral.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sIdPessoaConsPart,-1);

        if (dtmConsPart.qryPartGeral.Prepared) then dtmConsPart.qryPartGeral.unPrepare;

        dtmConsPart.qryPartGeral.Prepare;
        dtmConsPart.qryPartGeral.Open;

        if not (dtmConsPart.qryPartGeral.IsEmpty) then begin
          dtmConsPart.qryRecebDadosPessoais.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sIdPessoaConsPart,-1);

          { David - 20656 - A query foi alterada e agora pego os números dos
            documentos sem que seja necessário informar IDOCUMENTO (independente
            da fundação). }

          dtmConsPart.qryRecebDadosPessoais.Prepare;
          dtmConsPart.qryRecebDadosPessoais.Open;

          if not (dtmConsPart.qryRecebDadosPessoais.IsEmpty) then begin
            lblNomeRecebDadosPessoais.Visible       := True;
            lblCPFRecebDadosPessoais.Visible        := True;
            lblRGRecebDadosPessoais.Visible         := True;
            lblExpedicaoRecebDadosPessoais.Visible  := True;
            lblUFRecebDadosPessoais.Visible         := True;
            dbedNomeRecebDadosPessoais.Visible      := True;
            dbedCPFRecebDadosPessoais.Visible       := True;
            dbedRGRecebDadosPessoais.Visible        := True;
            dbedExpedicaoRecebDadosPessoais.Visible := True;
            dbedUFRecebDadosPessoais.Visible        := True;
          end else begin
            lblNomeRecebDadosPessoais.Visible       := False;
            lblCPFRecebDadosPessoais.Visible        := False;
            lblRGRecebDadosPessoais.Visible         := False;
            lblExpedicaoRecebDadosPessoais.Visible  := False;
            lblUFRecebDadosPessoais.Visible         := False;
            dbedNomeRecebDadosPessoais.Visible      := False;
            dbedCPFRecebDadosPessoais.Visible       := False;
            dbedRGRecebDadosPessoais.Visible        := False;
            dbedExpedicaoRecebDadosPessoais.Visible := False;
            dbedUFRecebDadosPessoais.Visible        := False;
          end;

          frmAguarde.Next;
          frmAguarde.Repaint;
        end;
      end;

      if (not (dtmConsPart.qryPartGeral.Active)) or ((dtmConsPart.qryPartGeral.IsEmpty) and
              (dtmConsPart.qryPartGeral.Active)) then begin
        if not (dtmConsPart.qryDependente.Active) then begin
          dtmConsPart.DsPartGeral.DataSet                           := dtmConsPart.qryDependente;
          dtmConsPart.qryDependente.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sIdPessoaConsPart,-1);

          if not (dtmConsPart.qryDependente.Prepared) then dtmConsPart.qryDependente.unPrepare;

          dtmConsPart.qryDependente.Prepare;
          dtmConsPart.qryDependente.Open;

          if not (dtmConsPart.qryDependente.IsEmpty) then
          begin
              dtmConsPart.qryDependente.first;

              while not dtmConsPart.qryDependente.EOF do
              begin

                if dtmConsPart.qryDependente.FieldByName('PLANO').AsString = 'REG/REPLAN' then
                begin
                       chkREGREPLAN.checked := True;
                       dbedDataCancelREG.text :=  dtmConsPart.qryDependente.FieldByName('DATACANCEL').AsString;
                end
                else
                if dtmConsPart.qryDependente.FieldByName('PLANO').AsString = 'REB' then
                begin
                     chkREB.checked := True;
                     dbedDataCancelREB.text := dtmConsPart.qryDependente.FieldByName('DATACANCEL').AsString;
                end
                else
                if dtmConsPart.qryDependente.FieldByName('PLANO').AsString = 'NOVO PLANO' then
                begin
                     chkNOVOPLANO.checked := True;
                     dbedDataCancelNOVO.text := dtmConsPart.qryDependente.FieldByName('DATACANCEL').AsString;
                end;
                dtmConsPart.qryDependente.next;
              end;
             dtmConsPart.qryDependente.first;
          end;

          
          if dtmConsPart.qryDependente.FieldByName('FLGCONTAIMPOSTOR').AsString = 'Sim' then
             rgDependIR.ItemIndex := 0
          else
             rgDependIR.ItemIndex := 1;

          if dtmConsPart.qryDependente.FieldByName('FLGMOLESTIAGRAVE').AsString = 'Sim' then
             rgMolestia.ItemIndex := 0
          else
             rgMolestia.ItemIndex := 1;
        end;
      end;

      frmAguarde.Apaga;

      // Faz o cálculo da Idade da Pessoa
      dbedIdadeDepen.Text := '';

      CalculaIdade;

      dbedNumElegBenef.Text := IntToStr(ContaElegiveisAbeneficio);
    end;

    dtAux := BuscaDtEntrada(StrToInt(sIdTitular),StrToIntDef(sIdPessjurConsPart,-1),dtmConsPart.qryPlanos.FieldByName('IDPLANOPREV').AsInteger);

    if ( Trim(pgAcessoDireto)<>'' ) then NBKelegpart.ActivePage := pgAcessoDireto;

    // Somente pega a matricula, caso a query não retorne a matricula do participante pelo fato dele ser pensionista
    if edtMatricula.Text = '' then edtMatricula.Text := GetMatricula;

  end
  //Peterson Victor SIG21868 - FIM
  else
  if (NBKelegpart.ActivePage='PgDocumentos') then (* PgDocumentos - 2 *)
  begin
    if not (dtmConsPart1.qryDocTitular.Prepared) then dtmConsPart1.qryDocTitular.Prepare;

    dtmConsPart1.qryDocTitular.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sIdPessoaConsPart,-1);
    dtmConsPart1.qryDocTitular.Open;
  end (* Fim PgDocumentos - 2 *)
  else
  if (NBKelegpart.ActivePage='PgEnderecos') then (* PgEnderecos - 3 *)
  begin
    if (dtmConsPart1.qryEndereco.Active)       then dtmConsPart1.qryEndereco.Close;
    if not (dtmConsPart1.qryEndereco.Prepared) then dtmConsPart1.qryEndereco.Prepare;

    dtmConsPart1.qryEndereco.DatabaseName                     := sDataBaseName;
    dtmConsPart1.qryEndereco.ParamByName('IDTITULAR').AsFloat := StrToIntDef(sIdPessoaConsPart,-1);
    dtmConsPart1.qryEndereco.Open;
  end (* Fim PgEnderecos - 3 *)
  else
  if (NBKelegpart.ActivePage='pgAcaoJudicial') then (* PgAcaoJudicial - 4 *)
  begin
    if (dtmConsPart.qryAcaoJudicial.Active)       then dtmConsPart.qryAcaoJudicial.Close;

    // Daniel - 26658
    //cmbTipoOAcao.Text  := '';
    edAutorAcao.Text   := '';
    //cmbStatusAcao.Text := ''; //Fanuel Junior SOL161339 Kintana1361327
    //cmbOperacao.Text   := ''; //Fanuel Junior SOL161339 Kintana1361327
    edCodVara.Text     := '';
    edNomeVara.Text    := '';
    edCodSecao.Text    := '';
    edNomeSecao.Text   := '';
    edNumProc.Text     := '';
    redPercAcao.Value  := 0;
    // Fim.

    //Fanuel Junior
    cmbTipoOAcao.Enabled  := true;
    cmbOperacao.Enabled   := true;
    cmbStatusAcao.Enabled := true;


    if not (dtmConsPart.qryAcaoJudicial.Prepared) then dtmConsPart.qryAcaoJudicial.Prepare;

    dtmConsPart.qryAcaoJudicial.DatabaseName                       := sDataBaseName;
    dtmConsPart.qryAcaoJudicial.ParamByName('IIDPESSOA').AsInteger := StrToInt(sIdPessoaConsPart);
    dtmConsPart.qryAcaoJudicial.Open;

    if (dtmConsPart.qryAcaoJudicial.IsEmpty) then begin
      dtmConsPart.qryCompensaIR.Close;
      dtmConsPart.qryCompensaIR.ParamByName('IDPESSOA').AsInteger := StrtoInt(sidpessoaconspart);
      dtmConsPart.qryCompensaIR.Open;

      if (dtmConsPart.qryCompensaIR.IsEmpty) then
        cbxFazdeposito.Visible := True
      else begin
        pnlCompensacao.BringToFront;
        cmbTipoOAcao.ItemIndex := 2;
        cbMesInicio.ItemIndex  := (StrToIntDef(Copy(dtmConspart.qryCompensair.FieldByName('ANOMESINICIO').AsString,6,2),-1)-1);
        speAnoInicio.Text      := Copy(dtmConspart.qryCompensair.FieldByName('ANOMESINICIO').AsString,1,4);
        cbMesFim.ItemIndex     := (StrToIntDef(Copy(dtmConspart.qryCompensair.FieldByName('ANOMESFIM').AsString,6,2),-1)-1);
        speAnoFinal.Text       := Copy(dtmConspart.qryCompensair.FieldByName('ANOMESFIM').AsString,1,4);
        redCompTotal.Text      := FormatFloat('#,##0.00',dtmConspart.qryCompensair.FieldByName('COMPTOTAL').AsFloat);
        redSaldo.Text          := FormatFloat('#,##0.00',dtmConspart.qryCompensair.FieldByName('SALDOCOMP').AsFloat);
        edtNumproccomp.Text    := dtmConspart.qryCompensair.FieldByName('NUMEROPROCESSO').AsString;
        edtcodvaracomp.Text    := dtmConspart.qryCompensair.FieldByName('CODVARA').AsString;
        edtNomeVaracomp.Text   := dtmConspart.qryCompensair.Fieldbyname('NOMEVARA').AsString;
        pnlSaldo.Caption       := FormatFloat('#,##0.00',(dtmConspart.qryCompensair.FieldByName('COMPTOTAL').AsFloat-
                                                          dtmConspart.qryCompensair.FieldByName('SALDOCOMP').AsFloat));
      end;

      cbxFazdeposito.visible   := False;
      cmbTipooacao.enabled     := False;
      cbMesInicio.enabled      := False;
      speAnoInicio.readonly    := True;
      speAnoFinal.readonly     := True;
      cbMesFim.enabled         := False;
      redCompTotal.readonly    := True;
      redSaldo.readonly        := True;
      edtNumproccomp.readonly  := True;
      edtcodvaracomp.readonly  := True;
      edtNomeVaracomp.readonly := True;
      pnlsaldo.enabled         := False;
    end else begin
      pnlRestoMestre.BringToFront;
      cmbTipoOAcao.ItemIndex    := dtmConsPart.qryAcaoJudicial.FieldByName('TIPOACAO').AsInteger;
      cmbTipoOAcao.Enabled      := False;
      cmbOperacao.ItemIndex     := StrToIntDef(dtmConsPart.qryAcaoJudicial.FieldByName('CODOPERACAO').AsString,-1);
      cmbOperacao.Enabled       := False;
      cmbTipoOAcao.ItemIndex    := StrToIntDef(dtmConsPart.qryAcaoJudicial.FieldByName('TIPOACAO').AsString,-1);
      cmbTipoOAcao.Enabled      := False;
      edCodVara.Text            := dtmConsPart.qryAcaoJudicial.FieldByName('CODVARA').AsString;
      edCodVara.ReadOnly        := True;
      edNomeVara.Text           := dtmConsPart.qryAcaoJudicial.FieldByName('NOMEVARA').AsString;
      edNomeVara.ReadOnly       := True;
      edCodSecao.Text           := dtmConsPart.qryAcaoJudicial.FieldByName('CODSECAO').AsString;
      edCodSecao.ReadOnly       := True;
      edNomesecao.Text          := dtmConsPart.qryAcaoJudicial.FieldByName('NOMESECAO').AsString;
      edNomesecao.ReadOnly      := True;
      edAutorAcao.Text          := dtmConsPart.qryAcaoJudicial.FieldByName('AUTORACAO').AsString;
      edAutorAcao.ReadOnly      := True;
      cmbStatusAcao.ItemIndex   := dtmConsPart.qryAcaoJudicial.FieldByName('SITPROCESSO').AsInteger;
      cmbStatusAcao.Enabled     := False;
      //SOL95377 - Nilton
      edNumProc.Text            := dtmConspart.qryAcaoJudicial.FieldByName('NUMEROPROCESSO').AsString;
      edAutorAcao.ReadOnly      := True;
      //Fim
      //SOL97689 - Nilton
       dbdtInicio.Date          := dtmConspart.qryAcaoJudicial.FieldByName('DATAINICIO').AsDateTime;
       dbdtInicio.ReadOnly      := True;
       dbdtFinal.Date           := dtmConspart.qryAcaoJudicial.FieldByName('DATAFINAL').AsDateTime;
       dbdtInicio.ReadOnly      := True;
      //Fim

      //Fanuel Junior SOL161339 Kintana1361327
      cbxFazdeposito.checked :=  dtmConspart.qryAcaoJudicial.Fieldbyname('FLGFAZDEPOSITO').Value;

      if (cmbTipoOacao.ItemIndex=1) then begin
        gbxPercentual.Visible := True;
        redPercAcao.Text      := FormatFloat('#,##0.00',dtmConsPart.qryAcaoJudicial.FieldByName('PERCACAO').AsFloat);
      end else begin
        gbxPercentual.Visible := False;
        rEdPercAcao.Text      := '';
      end;

      rEdPercAcao.ReadOnly := True;
      dtmConsPart.QryDetalheRegra.Close;
      dtmConsPart.QryDetalheRegra.ParamByName('IDPROCJUD').AsInteger := dtmConsPart.qryAcaoJudicial.FieldByName('IDPROCJUD').AsInteger;
      dtmConsPart.QryDetalheRegra.ParamByName('IDPESSOA').AsInteger  := dtmConsPart.qryAcaoJudicial.FieldByName('IDPESSOA').AsInteger;
      dtmConsPart.QryDetalheRegra.Open;
    end;

    
       //Fanuel Junior 161339 Inicio
      MostraInformacoesBancarias;
      //Fanuel Junior 161339 Fim
      
  end (* Fim PgAcaoJudicial - 4 *)
  else
  if (NBKelegpart.ActivePage='OutrasInformacoes') then (* OutrasInformacoes - 5 *)
  begin
    // André Tavares - 20/01/2004 - 15928
    dtmConsPart1.qryOutrasInforms.Close;
    dtmConsPart1.qryOutrasInforms.ParamByName('IDPESSOA').Value := StrToInt(sIdPessoaConsPart);
    dtmConsPart1.qryOutrasInforms.Open;
    // Fim.
  end (* Fim OutrasInformacoes - 5 *)
  else
  if (NBKelegpart.ActivePage='PgEventosPrevidenciarios') then (* PgEventosPrevidenciarios - 6 *)
  begin
    if (dtmConsPart.qryEventosPrev.Active)       then dtmConsPart.qryEventosPrev.Close;
    if not (dtmConsPart.qryEventosPrev.Prepared) then dtmConsPart.qryEventosPrev.Prepare;

    dtmConsPart.qryEventosPrev.DatabaseName                     := sDataBaseName;
	//Higor Nayde ferreira SOL 193317 Kintana 1854470
    qryAuxCPF.close;
    qryAuxCPF.SQL.Clear;
    qryAuxCPF.SQL.Add('SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = '+sIdPessoaConsPart);
    qryAuxCPF.Open;
	//Higor Nayde ferreira SOL 193317 Kintana 1854470

   //Renato Visoni SOL 37791/4261 Kintana 1187530
    dtmConsPart.qryEventosPrev.Close;
    dtmConsPart.qryEventosPrev.SQL.Clear;
    dtmConsPart.qryEventosPrev.SQL.Add(' SELECT   DP.MATRICULA, ');
    dtmConsPart.qryEventosPrev.SQL.Add('         EP.IDPLANOPREV, ');
    dtmConsPart.qryEventosPrev.SQL.Add('         EP.IDPESSJUR, ');
    dtmConsPart.qryEventosPrev.SQL.Add('         EP.IDEVENTOSPREV,');
    dtmConsPart.qryEventosPrev.SQL.Add('         EG.NOME, ');
    dtmConsPart.qryEventosPrev.SQL.Add('         EP.DATAEVENTO, ');
    dtmConsPart.qryEventosPrev.SQL.Add('         EP.DATAREGISTRO, ');
    dtmConsPart.qryEventosPrev.SQL.Add('         EP.DATAEFETIVADO, ');
    dtmConsPart.qryEventosPrev.SQL.Add('         EP.DATAVOLTA,');
    dtmConsPart.qryEventosPrev.SQL.Add('         EP.INSCRICAONUMERO, ');
    dtmConsPart.qryEventosPrev.SQL.Add('         SF1.DESCRICAO AS SITFUNCATUAL, ');
    dtmConsPart.qryEventosPrev.SQL.Add('         SPL1.DESCRICAO AS SITPLANOATUAL,');
    dtmConsPart.qryEventosPrev.SQL.Add('         SP1.DESCRICAO AS SITPARTATUAL,');
    dtmConsPart.qryEventosPrev.SQL.Add('         SF2.DESCRICAO AS SITFUNCNOVO,');
    dtmConsPart.qryEventosPrev.SQL.Add('         SPL2.DESCRICAO AS SITPLANONOVO,');
    dtmConsPart.qryEventosPrev.SQL.Add('         SP2.DESCRICAO AS SITPARTNOVO,');
    dtmConsPart.qryEventosPrev.SQL.Add('         PF.NOME AS PATRO,');
    dtmConsPart.qryEventosPrev.SQL.Add('         PL.NOME AS PLANO');

    dtmConsPart.qryEventosPrev.SQL.Add(' FROM     PESSOA PF,');
    dtmConsPart.qryEventosPrev.SQL.Add('         EVENTOSPREV EP,');
    dtmConsPart.qryEventosPrev.SQL.Add('         EVENTOGERADOR EG,');
    dtmConsPart.qryEventosPrev.SQL.Add('         SITPART SP1,');
    dtmConsPart.qryEventosPrev.SQL.Add('         SITPART SP2,');
    dtmConsPart.qryEventosPrev.SQL.Add('         SITFUNC SF1,');
    dtmConsPart.qryEventosPrev.SQL.Add('         SITFUNC SF2,');
    dtmConsPart.qryEventosPrev.SQL.Add('         SITPLANOPREV SPL1,');
    dtmConsPart.qryEventosPrev.SQL.Add('         SITPLANOPREV SPL2,');
    dtmConsPart.qryEventosPrev.SQL.Add('         PLANPREV PL,');
    dtmConsPart.qryEventosPrev.SQL.Add('         DEPENTIT DP,');
    dtmConsPart.qryEventosPrev.SQL.Add('         PARTPREVPLAN PA');

    dtmConsPart.qryEventosPrev.SQL.Add(' WHERE    (EP.IDPESSJUR = :IDPESSJUR)');


	//Higor Nayde ferreira SOL 193317 Kintana 1854470

    if (qryAuxCPF.FieldByName('NUMDOCUMENTO').AsString <> '00000000000') and (qryAuxCPF.FieldByName('NUMDOCUMENTO').AsString <> '') then
        dtmConsPart.qryEventosPrev.SQL.Add(' AND      (EP.IDPESSOA IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO =  (SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = :IDTITULAR))) ')
    else
        dtmConsPart.qryEventosPrev.SQL.Add(' AND      (EP.IDPESSOA IN (:IDTITULAR))');

    //Higor Nayde ferreira SOL 193317 Kintana 1854470

    dtmConsPart.qryEventosPrev.SQL.Add(' AND      (EP.IDPESSJUR = PF.IDPESSOA)');
   
    dtmConsPart.qryEventosPrev.SQL.Add(' AND      (DP.IDPESSOA    = EP.IDPESSOA)');
    dtmConsPart.qryEventosPrev.SQL.Add(' AND      (DP.IDPESSOA    = PA.IDPESSOA)');
    dtmConsPart.qryEventosPrev.SQL.Add(' AND      (PA.IDPLANOPREV = EP.IDPLANOPREV)');

    dtmConsPart.qryEventosPrev.SQL.Add(' AND      (EP.IDEVENTOGERADOR = EG.IDEVENTOGERADOR)');
    dtmConsPart.qryEventosPrev.SQL.Add(' AND      (EP.IDSITPARTATUAL  = SP1.IDSITPART(+))');
    dtmConsPart.qryEventosPrev.SQL.Add(' AND      (EP.IDSITPARTNOVO   = SP2.IDSITPART(+))');
    dtmConsPart.qryEventosPrev.SQL.Add(' AND      (EP.IDSITFUNCATUAL  = SF1.IDSITFUNC(+))');

    dtmConsPart.qryEventosPrev.SQL.Add(' AND      (EP.IDSITFUNCNOVO   = SF2.IDSITFUNC(+))');
    dtmConsPart.qryEventosPrev.SQL.Add(' AND      (EP.IDSITPLANOATUAL = SPL1.IDSITPLANOPREV)');
    dtmConsPart.qryEventosPrev.SQL.Add(' AND      (EP.IDSITPLANONOVO  = SPL2.IDSITPLANOPREV)');
    dtmConsPart.qryEventosPrev.SQL.Add(' AND      (EP.IDPLANOPREV = PL.IDPLANOPREV)');
    //Fanuel Junior SOL 180148 Kintana 1664935
    dtmConsPart.qryEventosPrev.SQL.Add(' AND      (DP.IDPESSOA = DP.IDTITULAR)');
    //Fanuel Junior SOL 180148 Kintana 1664935

    //dtmConsPart.qryEventosPrev.SQL.Add(' ORDER BY EP.DATAEVENTO DESC, EG.NOME'); //Taffarel - SIG85075
    dtmConsPart.qryEventosPrev.SQL.Add(' ORDER BY EP.DATAEVENTO DESC, EP.DATAREGISTRO DESC, EG.NOME'); //Taffarel - SIG85075

    //Renato Visoni SOL 37791/4261 Kintana 1187530+
    dtmConsPart.qryEventosPrev.ParamByName('IDTITULAR').AsFloat := StrToIntDef(sIdPessoaConsPart,-1);
    dtmConsPart.qryEventosPrev.ParamByName('IDPESSJUR').AsFloat := StrToIntDef(DblkPatro.LookupValue,-1);

    if not (dtmConsPart.qryEventosPrev.Active) then dtmConsPart.qryEventosPrev.Open;

    if not (dtmConsPart.qryHstContF.Active) then begin
      if not (dtmConsPart.qryHstContF.Prepared) then dtmConsPart.qryHstContF.Prepare;

      dtmConsPart.qryHstContF.DatabaseName                          := sDataBaseName;
      dtmConsPart.qryHstContF.ParamByName('IdEventosPrev').AsString := dtmConsPart.qryEventosPrev.FieldByName('IDEVENTOSPREV').AsString;
      dtmConsPart.qryHstContF.Open;
    end;
  end (* Fim PgEventosPrevidenciarios - 6 *)
  else
  if (NBKelegpart.ActivePage='PgEventosAssistenciais') then (* PgEventosAssistenciais - 7 *)
  begin
    if not (dtmConsPart.qryEvent.Prepared) then dtmConsPart.qryevent.Prepare;

    dtmConsPart.qryEvent.DatabaseName                       := sDataBaseName;
    dtmConsPart.qryEvent.ParamByName('IDTITULAR').AsFloat   := StrToIntDef(sIdPessoaConsPart,-1);
    dtmConsPart.qryEvent.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sIdPessJurConsPart,-1);
    dtmConsPart.qryEvent.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sIdPlanoPrevConsPart,-1);
    dtmConsPart.qryEvent.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sSeqPropostaConsPart,-1);

    // Andre Tavares - 26/02/2004 - 16122
    dtmConsPart.qryEvent.Filtered := False;
    dtmConsPart.qryEvent.Filter   := ' idpessjur = '+sIdPessJurConsPart+' and idplanoprev = '+sIdPlanoPrevConsPart;
    dtmConsPart.qryEvent.Filtered := True;
    // Fim.

    if not (dtmConsPart.qryEvent.Active) then dtmConsPart.qryevent.Open;
  end (* Fim PgEventosAssistenciais - 7 *)
  else
  if NBKelegpart.ActivePage = 'PgHistoricoFuncional' then (* PgHistoricoFuncional - 8 *)
  begin
    Ds.DataSet := cmCds;
    cmCds.Close;
    cmCds.Data := CtrlTempoServico.CalculaTempos(StrtoInt(sidpessoaconspart), Date,False,'',True);

    //Darivaldo Alencar SIG37689 -inicio
        //    //Inicio -  Pendência   : SOL 37791  KINTANA 523676
        //    edtTEMPOSEMCONVERSAO.Text := IntToStr(CtrlTempoServico.TotalizadorTempoSimples);
        //    edtTEMPOSEMCONVERSAOEXT.Text := CtrlTempoServico.TotalizadorTempoSimplesExt;
        //    edtTEMPOSERVCALC.Text := IntToStr(CtrlTempoServico.TotalizadorTempoCalc);
        //    edtTEMPOTOTALEXT.Text := CtrlTempoServico.TotalizadorTempoCalcExt;
        //    //Fim -  Pendência   : SOL 37791  KINTANA 523676
    dbeHfAno.text:= IntToStr(CtrlTempoServico.BuscaTemposServico(StrtoInt(sidpessoaconspart),0));
    dbeHfMes.text:= IntToStr(CtrlTempoServico.BuscaTemposServico(StrtoInt(sidpessoaconspart),1));
    dbeHfDia.text:= IntToStr(CtrlTempoServico.BuscaTemposServico(StrtoInt(sidpessoaconspart),2));
    //Darivaldo Alencar SIG37689 -fim
  end (* Fim PgHistoricoFuncional - 8 *)
  else
  if (NBKelegpart.ActivePage='PgDadosBasicos') then begin (* PgDadosBasicos - 9 *)
    if not dtmConsPart.qryValoresBaseDepentit.prepared then dtmConsPart.qryValoresBaseDepentit.Prepare;

    dtmConsPart.qryValoresBaseDepentit.ParamByName('IDPESSOA').AsInteger  := StrtoIntDef(sIdPessoaConsPart,-1);
    dtmConsPart.qryValoresBaseDepentit.ParamByName('IDTITULAR').AsInteger := StrtoIntDef(sIdTitular,-1); // André Tavares - 15616

    if not dtmConsPart.qryValoresBaseDepentit.Active then dtmConsPart.qryValoresBaseDepentit.Open;

// André Tavares - 09/11/2003 - 14471 - Início ---------------------------------
    dtmConsPart.qryRunTime.Sql.text := ' SELECT IDDEPENDENCIA FROM VWPARTICIPDEPEN WHERE IDDEPENDENCIA = ''PRP'' AND IDPESSOA = '+sIdPessoaConsPart;
    dtmConsPart.qryRunTime.Open;

    if dtmConsPart.qryRunTime.isEmpty then begin
      dtmConsPart.qryRunTime.Close;
      dtmConsPart.qryRunTime.Sql.text := ' SELECT IDDEPENDENCIA FROM VWPARTICIPDEPEN WHERE IDDEPENDENCIA <> ''PRP'' AND IDPESSOA = '+sIdPessoaConsPart;
      dtmConsPart.qryRunTime.Open;
    end;

    PanelDadosFuncionais.Visible := fTitular;
// André Tavares - 09/11/2003 - 14471 - Fim ------------------------------------

    if not dtmConsPart.qryDataInicioInss.prepared then dtmConsPart.qryDataInicioInss.Prepare;

    dtmConsPart.qryDataInicioInss.ParamByName('IDPESSOA').AsInteger := StrtoIntDef(sIdPessoaConsPart,-1);

    if not dtmConsPart.qryDataInicioInss.Active      then dtmConsPart.qryDataInicioInss.Open;
    if not dtmConsPart.qryTelefoneComercial.prepared then dtmConsPart.qryTelefoneComercial.Prepare;

    dtmConsPart.qryTelefoneComercial.ParamByName('IDPESSOA').AsInteger := StrtoIntDef(sIdPessoaConsPart,-1);

    if not dtmConsPart.qryTelefoneComercial.Active then dtmConsPart.qryTelefoneComercial.Open;
  end (* Fim PgDadosBasicos - 9 *)
  else
  if NBKelegpart.ActivePage = 'PgTelefones' then (* PgTelefones - 10 *)
  begin
    if not dtmConsPart.qryTelefones.prepared then dtmConsPart.qryTelefones.Prepare;

    dtmConsPart.qryTelefones.ParamByName('IdPessoa').asInteger := StrtoIntDef(sidpessoaconspart, -1);

    if not dtmConsPart.qryTelefones.Active then dtmConsPart.qryTelefones.Open;

// André Tavares - 28/01/2003 - 11695 - Início ---------------------------------
    dtmConsPart.qryTelefones.First;
    sttipotel := '';

    while not dtmConsPart.qryTelefones.EOF do begin
      dtmConsPart.qryTelefones.edit;
      sttipotel := dtmConsPart.qryTelefonesTIPO.asString;

      for i := 1 to length(sttipotel) do begin
        if upCase(sttipotel[i]) = 'C' then
          dtmConsPart.qryTelefonesFLGCOM.asString   := '1'
        else if upCase(sttipotel[i]) = 'P' then
          dtmConsPart.qryTelefonesFLPART.asString   := '1'
        else if upCase(sttipotel[i]) = 'L' then
          dtmConsPart.qryTelefonesFLGCEL.asString   := '1'
        else if upCase(sttipotel[i]) = 'F' then
          dtmConsPart.qryTelefonesFLGFAX.asString   := '1'
        else if upCase(sttipotel[i]) = 'M' then
          dtmConsPart.qryTelefonesFLGMODEM.asString := '1'
        else if upCase(sttipotel[i]) = 'R' then
          dtmConsPart.qryTelefonesFLGREC.asString   := '1';
      end;

      dtmConsPart.qryTelefones.Post;
      dtmConsPart.qryTelefones.next;
    end;
// André Tavares - 28/01/2003 - 11695 - Fim ------------------------------------
  end (* Fim PgTelefones - 10 *)
  else
  if NBKelegpart.ActivePage = 'PgContasBancarias' then (* PgContasBancarias - 11 *)
  begin
    if not dtmConsPart1.qryContaCorrente.prepared then dtmConsPart1.qryContaCorrente.Prepare;

    dtmConsPart1.qryContaCorrente.ParamByName('IdPessoa').asInteger := StrtoIntDef(sidpessoaconspart, -1);

    if not dtmConsPart1.qryContaCorrente.Active then dtmConsPart1.qryContaCorrente.Open;
  end (* Fim PgContasBancarias - 11 *)
  else
  if NBKelegpart.ActivePage = 'PgDependentes' then (* PgDependentes - 12 *)
  begin
    if not dtmConsPart.qryDepenTit.Prepared then dtmConsPart.qryDepenTit.Prepare;

    dtmConsPart.qryDepenTit.Close;  //Fanuel Junior SOL150834 Kintana1104309
    dtmConsPart.qryDepenTit.ParamByName('IDTITULAR').asInteger := StrtoIntDef(sidpessoaconspart, -1);

    //Darivaldo Alencar SIG21868 -Inicio --Estava estourando erro quando a combobox vinha vazia
    // dtmConsPart.qryDepenTit.ParamByName('IDPLANOPREV').asInteger := StrToInt(DblkPlanos.LookUpValue); //Fanuel Junior SOL150834 Kintana1104309
    dtmConsPart.qryDepenTit.ParamByName('IDPLANOPREV').asInteger  := StrToIntDef(DblkPlanos.LookUpValue,-1);
    //Darivaldo Alencar SIG21868 -Fim

    if not dtmConsPart.qryDepenTit.Active  then dtmConsPart.qryDepenTit.Open;
    if not dtmconsPart.qryDepentit.IsEmpty then RodaRegraElegibilidade;

    dtmConsPart.qryDepenTit.first; // André Tavares - 20/01/2004 - 15928

    // William Santana SOL 173532 KTN 1833116

    //edilaine - SIG42986 - inicio
    {dtmConsPart.qryLogAltDependentes.Close;
    dtmConsPart.qryLogAltDependentes.ParamByName('IDTITULAR').AsInteger := dtmConsPart.qryDepenTit.FieldByName('IDTITULAR').AsInteger;
    dtmConsPart.qryLogAltDependentes.Open;
    }//edilaine - SIG42986 - inicio

    // William Santana SOL 173532 KTN 1833116 - fim


  end (* Fim PgDependentes - 12 *)
  else
  if NBKelegpart.ActivePage = 'PgEmprestimos' then (* PgEmprestimos - 13 *)
  begin
    if not dtmConsPart.qryEmprestimos.Prepared then dtmConsPart.qryEmprestimos.Prepare;

     sidplanoprevconspart := DblkPlanos.LookUpValue;
    dtmConsPart.qryEmprestimos.ParamByName('IDPESSOA').AsInteger := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryEmprestimos.ParamByName('IDTITULAR').AsInteger := StrtoIntDef(sIdTitular, -1);

    // Andre Tavares - 03/03/2004 - 16131
    dtmConsPart.qryEmprestimos.Filtered := False;
    dtmConsPart.qryEmprestimos.Filter   := ' idpatro = ' + sidpessjurconspart + ' and idplanoprev = '+sidplanoprevconspart;
    dtmConsPart.qryEmprestimos.Filtered := True;
    // Fim.

    if not dtmConsPart.qryEmprestimos.Active then dtmConsPart.qryEmprestimos.Open;

    dtmConsPart.qryhstEmprestimo.Close;
    dtmConsPart.qryhstEmprestimo.ParamByName('IDCONTRATOEMPTMO').AsFloat := dtmConsPart.qryEmprestimos.FieldByName('IDCONTRATOEMPTMO').AsFloat;
    dtmConsPart.qryhstEmprestimo.Open;
  end (* Fim PgEmprestimos - 13 *)
  else
  if NBKelegpart.ActivePage = 'PgProtocolos' then (* PgProtocolos - 14 *)
  begin
    if not dtmConsPart.qryFiario.Prepared then dtmConsPart.qryFiario.Prepare;

    dtmConsPart.qryFiario.ParamByName('IDTITULAR').AsInteger := StrtoIntDef(sidpessoaconspart, -1);

    if not dtmConsPart.qryFiario.Active then dtmConsPart.qryFiario.Open;
  end (* Fim PgProtocolos - 14 *)
  else
  if NBKelegpart.ActivePage = 'PgProcessosRAD' then (* PgProcessosRAD - 15 *)
  begin
    if not dtmConsPart.qryprocesso.Prepared then dtmConsPart.qryprocesso.Prepare;

    dtmConsPart.qryprocesso.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);

    if not dtmConsPart.qryprocesso.Active Then dtmConsPart.qryprocesso.Open;
  end (* Fim PgProcessosRAD - 15 *)
  else if NBKelegpart.ActivePage = 'PgContribuicoesReservaSaldo' then (* PgContribuicoesReservaSaldo - 16 *)
  begin
    if not dtmConsPart.qryReserva.Prepared then dtmConsPart.qryReserva.Prepare;

    dtmConsPart.qryReserva.ParamByName('IDMATRICULA').AsString   := sMtl; // Peterson Victor Sol 269137 PPM 1287534
    dtmConsPart.qryReserva.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryReserva.ParamByName('IDPESSJUR').AsFloat   := StrtoIntDef(sidpessjurconspart, -1);
    dtmConsPart.qryReserva.ParamByName('IDPLANOPREV').AsFloat := StrtoIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryReserva.ParamByName('SEQPROPOSTA').AsFloat := StrtoIntDef(sseqpropostaconspart, -1);

    if not dtmConsPart.qryReserva.Active Then dtmConsPart.qryReserva.Open;

    TotalSaldo                  := 0;
    TotSdoResCtrl               := 0;
    lblSaldosReserva.Caption    := 'Saldo de Res. do Participante: R$ ';
    LblSaldoResControle.Caption := 'Saldo de Res. de Controle: R$ ';
    dtmConsPart.qryReserva.DisableControls;
    dtmConsPart.qryReserva.First;

    while not dtmConsPart.qryReserva.EOF do begin
      if (dtmConsPart.qryReservaFLGCOLETIVA.asInteger = 0) or (dtmConsPart.qryReservaFLGCOLETIVA.isnull) then begin
        if dtmConsPart.qryReservaFLGCONTROLE.asInteger = 0 then
          TotalSaldo := TotalSaldo + dtmConsPart.qryReservaVLRATUAL.asFloat
        else begin
          if (dtmConsPart.qryReservaFLGTITULARCOLET.asString = 'T') then begin
            if dtmConsPart.qryReservaCOTVALOR.IsNull then
                 TotSdoResCtrl := TotSdoResCtrl + dtmConsPart.qryReservaVALORRESERVA.AsFloat
            else TotSdoResCtrl := TotSdoResCtrl + dtmConsPart.qryReservaVLRATUAL.AsFloat;
          end;
        end;
      end;

      dtmConsPart.qryReserva.Next;
    end;

    dtmConsPart.qryReserva.First;
    dtmConsPart.qryReserva.EnableControls;
    lblSaldosReserva.Caption    := lblSaldosReserva.Caption + FormatFloat('#,##0.00', TotalSaldo);
    LblSaldoResControle.Caption := LblSaldoResControle.Caption + FormatFloat('#,##0.00', TotSdoResCtrl);
  end (* Fim PgContribuicoesReservaSaldo - 16 *)
  else
  //FDias - 12.12.2003
  if NBKelegpart.ActivePage = 'Parcelamento' then (* Parcelamento - 17 *)
  begin
    if dtmConsPart1.qryParcelamento.Active       then dtmConsPart1.qryParcelamento.Close;
    if not dtmConsPart1.qryParcelamento.Prepared then dtmConsPart1.qryParcelamento.Prepare;

    dtmConsPart1.qryParcelamento.DatabaseName                       := sDataBaseName;
    dtmConsPart1.qryParcelamento.ParamByName('IDPESSOA').AsFloat    := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart1.qryParcelamento.ParamByName('IDPESSJUR').AsFloat   := StrtoIntDef(sidpessjurconspart, -1);
    dtmConsPart1.qryParcelamento.ParamByName('IDPLANOPREV').AsFloat := StrtoIntDef(sidplanoprevconspart, -1);
    dtmConsPart1.qryParcelamento.ParamByName('SEQPROPOSTA').AsFloat := StrtoIntDef(sseqpropostaconspart, -1);
    dtmConsPart1.qryParcelamento.Open;
  end (* Fim Parcelamento - 17 *)
  else
  // Renato Visoni SOL 127144 Kintana 670910
  if NBKelegpart.ActivePage = 'pgHistoricodePercentual' then begin
    dtmConsPart.QryHistoricoPercentual.close;
    dtmConsPart.QryHistoricoPercentual.ParamByname('IDPESSJUR').asInteger   := StrtoIntDef(sidpessjurconspart, -1);
    dtmConsPart.QryHistoricoPercentual.ParamByname('IDPESSOA').asInteger    := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.QryHistoricoPercentual.ParamByname('IDPLANOPREV').asInteger := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.QryHistoricoPercentual.Open;
  end else
  // Fernando Xavier SOL 124332 Kintana  630255
  if NBKelegpart.ActivePage = 'PghistSalParticipacao' then begin

    bContDetalhe := True; // Felipe A. Santos SOL 208715 Kintana 2015769

    dtmConsPart.qryHstSalParticipacao.close;
    dtmConsPart.qryHstSalParticipacao.ParamByname('IDPESSOA').asInteger    := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryHstSalParticipacao.ParamByname('IDPLANOPREV').asInteger := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryHstSalParticipacao.ParamByname('IDPESSJUR').asInteger := StrToIntDef(sidpessjurconspart, -1);  // Felipe A. Santos SOL 208715 Kintana 2015769
    dtmConsPart.qryHstSalParticipacao.Open;

    dtmConsPart.qryHstSalParticipGrid.Close;
    dtmConsPart.qryHstSalParticipGrid.open;
    dtmConsPart.qryHstSalParticipacao.first;

    // SOL 245986 PPM 630400
    dtmConsPart.qryHstSalParticipacaoAux.close;
    dtmConsPart.qryHstSalParticipacaoAux.ParamByname('IDPESSOA').asInteger    := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryHstSalParticipacaoAux.ParamByname('IDPLANOPREV').asInteger := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryHstSalParticipacaoAux.ParamByname('IDPESSJUR').asInteger := StrToIntDef(sidpessjurconspart, -1);  // Felipe A. Santos SOL 208715 Kintana 2015769
    dtmConsPart.qryHstSalParticipacaoAux.Open;
    // SOL 245986 PPM 630400


    dtmConsPart.qryHstSalParticipGrid.Close;
    dtmConsPart.qryHstSalParticipGrid.open;
    dtmConsPart.qryHstSalParticipacao.first;
    dtmConsPart.qryHstSalParticipacaoAux.first;
    //PghistSalPartControlaInsert := true; // Felipe A. Santos SOL 208715 Kintana 2015769
    // SOL 245986 PPM 630400  inicio
    while not dtmConsPart.qryHstSalParticipacaoAux.eof do
    begin
       //Petri SOL 252873 PPM 790284
       while (trim(dtmConsPart.qryHstSalParticipacaoAux.FieldByName('SALCONT').Asstring) = '') and (dtmConsPart.qryHstSalParticipacaoAux.FieldByName('MESFILTRO').asstring = dtmConsPart.qryHstSalParticipacao.FieldByName('MESFILTRO').asstring) and not(dtmConsPart.qryHstSalParticipacaoAux.eof) do
       begin
          dtmConsPart.qryHstSalParticipacaoAux.next;
       end;

       if sFiltroMes <> dtmConsPart.qryHstSalParticipacaoAux.FieldByName('MESFILTRO').asstring then
       begin
          while (not(dtmConsPart.qryHstSalParticipacao.eof)) and bInicioLaco do
          begin
             dtmConsPart.qryHstSalParticipGrid.append;
             dtmConsPart.qryHstSalParticipGrid.FieldByName('SALPART').Asstring    := dtmConsPart.qryHstSalParticipacao.FieldByName('SALPART').Asstring;
             dtmConsPart.qryHstSalParticipGrid.FieldByName('TIPO').asstring      := dtmConsPart.qryHstSalParticipacao.FieldByName('TIPO').AsString;
             dtmConsPart.qryHstSalParticipGrid.FieldByName('MESFILTRO').asstring := dtmConsPart.qryHstSalParticipacao.FieldByName('MESFILTRO').asstring;
             dtmConsPart.qryHstSalParticipacao.next;
          end;
          dtmConsPart.qryHstSalParticipacao.Filtered := false;
          dtmConsPart.qryHstSalParticipacao.Filter := 'MESFILTRO = '+ QuotedStr(dtmConsPart.qryHstSalParticipacaoAux.FieldByName('MESFILTRO').asstring);
          dtmConsPart.qryHstSalParticipacao.Filtered := true;
          dtmConsPart.qryHstSalParticipacao.first;
          bInicioLaco := true;
       end;
       while (trim(dtmConsPart.qryHstSalParticipacao.FieldByName('SALPART').Asstring) = '') and (dtmConsPart.qryHstSalParticipacao.FieldByName('MESFILTRO').asstring = dtmConsPart.qryHstSalParticipacaoAux.FieldByName('MESFILTRO').asstring)  and not(dtmConsPart.qryHstSalParticipacao.eof) do
       begin
          dtmConsPart.qryHstSalParticipacao.next;
       end;
       //Petri SOL 252873 PPM 790284
       //código movido para antes de checar o mês filtro, quando o registro seguinte se referia a um mês diferente apresentava divergencia na tela
       //while (trim(dtmConsPart.qryHstSalParticipacaoAux.FieldByName('SALCONT').Asstring) = '') and (dtmConsPart.qryHstSalParticipacaoAux.FieldByName('MESFILTRO').asstring = dtmConsPart.qryHstSalParticipacao.FieldByName('MESFILTRO').asstring) and not(dtmConsPart.qryHstSalParticipacaoAux.eof) do
       //begin
          //dtmConsPart.qryHstSalParticipacaoAux.next;
       //end;

       dtmConsPart.qryHstSalParticipGrid.append;

       if (dtmConsPart.qryHstSalParticipacaoAux.FieldByName('TIPO').AsString = 'D') then
       begin
         if (trim(dtmConsPart.qryHstSalParticipacao.FieldByName('SALPART').Asstring) <> '' ) and not(dtmConsPart.qryHstSalParticipacao.Eof) then //Petri SOL 252873 PPM 790284
            dtmConsPart.qryHstSalParticipGrid.FieldByName('SALPART').Asstring    := dtmConsPart.qryHstSalParticipacao.FieldByName('SALPART').Asstring;

         if (trim(dtmConsPart.qryHstSalParticipacaoAux.FieldByName('SALCONT').Asstring) <> '' ) and not(dtmConsPart.qryHstSalParticipacaoAux.Eof) then //Petri SOL 252873 PPM 790284
            dtmConsPart.qryHstSalParticipGrid.FieldByName('SALCONT').Asstring    := dtmConsPart.qryHstSalParticipacaoAux.FieldByName('SALCONT').Asstring;

       end
       else
       begin
          dtmConsPart.qryHstSalParticipGrid.FieldByName('SALPART').Asstring    := dtmConsPart.qryHstSalParticipacao.FieldByName('SALPART').Asstring;
          dtmConsPart.qryHstSalParticipGrid.FieldByName('SALCONT').Asstring    := dtmConsPart.qryHstSalParticipacaoAux.FieldByName('SALCONT').Asstring;
       end;

       dtmConsPart.qryHstSalParticipGrid.FieldByName('TIPO').asstring      := dtmConsPart.qryHstSalParticipacaoAux.FieldByName('TIPO').AsString;
       dtmConsPart.qryHstSalParticipGrid.FieldByName('MESFILTRO').asstring := dtmConsPart.qryHstSalParticipacaoAux.FieldByName('MESFILTRO').asstring;
       sFiltroMes := dtmConsPart.qryHstSalParticipacaoAux.FieldByName('MESFILTRO').asstring;
       dtmConsPart.qryHstSalParticipacao.next;
       dtmConsPart.qryHstSalParticipacaoAux.next;
    end;
    if (dtmConsPart.qryHstSalParticipacaoAux.eof) and not(dtmConsPart.qryHstSalParticipacao.eof) then
    begin
      while not(dtmConsPart.qryHstSalParticipacao.eof)  do
      begin
         if (trim(dtmConsPart.qryHstSalParticipacao.FieldByName('SALPART').Asstring) = '') then
            dtmConsPart.qryHstSalParticipacao.next
         else
         begin
            dtmConsPart.qryHstSalParticipGrid.append;
            dtmConsPart.qryHstSalParticipGrid.FieldByName('SALPART').Asstring    := dtmConsPart.qryHstSalParticipacao.FieldByName('SALPART').Asstring;
            dtmConsPart.qryHstSalParticipGrid.FieldByName('TIPO').asstring      := dtmConsPart.qryHstSalParticipacaoAux.FieldByName('TIPO').AsString;
            dtmConsPart.qryHstSalParticipGrid.FieldByName('MESFILTRO').asstring := dtmConsPart.qryHstSalParticipacaoAux.FieldByName('MESFILTRO').asstring;
         end;
         dtmConsPart.qryHstSalParticipacao.next;
      end;
    end;
    // SOL 245986 PPM 630400 fim

    dtmConsPart.qryHstSalParticipGrid.Filter := 'TIPO = '+ QuotedStr('T');
    dtmConsPart.qryHstSalParticipGrid.Filtered := True;

    //dtmConsPart.qryHstSalParticipGrid.DisableControls;
  end else
  // Fernando Xavier SOL 124332 Kintana  630255
  // Renato Visoni SOL 127144 Kintana 670910
  if NBKelegpart.ActivePage = 'PgBeneficiosPagamentosRubricasIndividuais' then (* PgBeneficiosPagamentosRubricasIndividuais - 18 *)
  begin
    if not dtmConsPart.qryRubIndiv.Prepared then dtmConsPart.qryRubIndiv.Prepare;

    dtmConsPart.qryRubIndiv.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);

    if not dtmConsPart.qryRubIndiv.Active then dtmConsPart.qryRubIndiv.Open;
  end (* Fim PgBeneficiosPagamentosRubricasIndividuais - 18 *)
  else
  if ( NBKelegpart.ActivePage = 'PgBeneficiosPagamentosContraCheque' ) then (* PgBeneficiosPagamentosContraCheque - 19 *)
  begin
    if (not(Assigned(frmFrameConsultaHistorico1))) then
    begin
      CreatefrmFrameConsultaHistorico;
    end;

    frmFrameConsultaHistorico1.AjustaFrame(wsStateForm);    //edilaine - SIG42986

    // Utiliza o frame da Folha de Benefícios
    frmFrameConsultaHistorico1.ResetaFrame;
    frmFrameConsultaHistorico1.MontaQry;

    //if DblkPatro.LookupValue = '1' then exit;  erro

    if ( frmConsPart.Visible ) then frmFrameConsultaHistorico1.ExecutaConsulta(iIdTitular);

    pgAcessoDireto := '';
  end (* Fim PgBeneficiosPagamentosContraCheque - 19 *)
  else
  if NBKelegpart.ActivePage = 'PgBeneficiariosPrevidenciarios' then (* PgBeneficiariosPrevidenciarios - 20 *)
  begin
    if not ( dtmConsPart1.qrypartprev.Prepared ) then dtmConsPart1.qrypartprev.Prepare;

    dtmConsPart1.qrypartprev.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart1.qrypartprev.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);

    // André Tavares - 03/03/2004 - 16131
    dtmConsPart1.qrypartprev.Filtered := False;
    dtmConsPart1.qrypartprev.Filter   := ' idpessjur = '+sidpessjurconspart+' and idplanoorigem = '+sidplanoprevconspart;
    dtmConsPart1.qrypartprev.Filtered := True;
    // Fim.

    if not dtmConsPart1.qrypartprev.Active then dtmConsPart1.qrypartprev.Open;

    dtmConsPart1.qrypartprev.FieldByName('VALORBASE1').DisplayLabel := dtmConsPart1.qrypartprev.FieldByName('NOMEVALORBASE1').AsString;

    if not dtmConsPart1.QryContaCorrentepartprev.Prepared then dtmConsPart1.QryContaCorrentepartprev.Prepare;
    if not dtmConsPart1.QryContaCorrentepartprev.Active then dtmConsPart1.QryContaCorrentepartprev.Open;
  end (* Fim PgBeneficiariosPrevidenciarios - 20 *)
  else if NBKelegpart.ActivePage = 'PgBeneficiariosAssistenciais' then (* PgBeneficiariosAssistenciais - 21 *)
  begin
    if not dtmConsPart.qrypart.Prepared then dtmConsPart.qrypart.Prepare;

    dtmConsPart.qrypart.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qrypart.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);

    // Andre Tavares - 03/03/2004 - 16131
    dtmConsPart.qrypart.Filtered := False;
    dtmConsPart.qrypart.Filter   := ' idpessjur = ' + sidpessjurconspart + ' and idplanoprev = '+sidplanoprevconspart;
    dtmConsPart.qrypart.Filtered := True;
    // Fim.

    if not dtmConsPart.qrypart.Active then dtmConsPart.qrypart.Open;
  end (* Fim PgBeneficiariosAssistenciais - 21 *)
  else
  if NBKelegpart.ActivePage = 'PgContribuicoesHistoricoPrevidenciario' then (* PgContribuicoesHistoricoPrevidenciario - 22 *)
  begin
    { Desabilita o controle porque a query retorna muitas linhas e assim fica
      mais rápido porque o DBcontrol não é atualizado a cada linha retornada. }
    dtmConsPart1.qrycontribprev.DisableControls;
    dtmConsPart1.qrycontribprev.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sidpessoaConspart, -1);
    dtmConsPart1.qrycontribprev.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1); // 8538 => Retirado o filtro 'IDPESSJUR' ...
    dtmConsPart1.qrycontribprev.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);

    if not dtmConsPart1.qrycontribprev.Active then begin
      if (dtmConsPart1.qrycontribprev.Prepared) and (not dtmConsPart1.qrycontribprev.Active) then dtmConsPart1.qrycontribprev.unPrepare;

      if not dtmConsPart1.qrycontribprev.active then begin
        dtmConsPart1.qrycontribprev.Prepare;
        dtmConsPart1.qrycontribprev.Open;
      end;
    end;

    dtmConsPart1.qrycontribprev.EnableControls;

    //Renato Visoni SOL 148127 Kintana 1036903
    DtmconsPart1.QryMesCobranca.Close;
    DtmconsPart1.QryMesCobranca.ParamByname('IDPESSOA').asInteger :=  StrtoIntDef(sidpessoaconspart, -1);
    DtmconsPart1.QryMesCobranca.Open;

    DtmconsPart1.QryContribuicao.Close;
    DtmconsPart1.QryContribuicao.ParamByname('IDPESSOA').asInteger :=  StrtoIntDef(sidpessoaconspart, -1);
    DtmconsPart1.QryContribuicao.Open;


    with qryAux do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT DTINICIO,PERCENTUAL FROM HSTPERCONTRIBPREV');
      SQL.Add('WHERE IDPESSOA = :IDPESSOA AND ((DTFIM IS NULL) OR (DTFIM = (SELECT MAX(DTFIM) FROM HSTPERCONTRIBPREV WHERE IDPESSOA = :IDPESSOA)))');
      SQL.Add('ORDER BY dtfim DESC');
      ParamByname('IDPESSOA').asInteger := StrtoIntDef(sidpessoaconspart, -1);
      Open;
      First;

      edtDataUltAlteracao.Text := FieldByname('DTINICIO').asString;
      edtPercentual.Text       := FieldByname('PERCENTUAL').asString;
    end;

    //Renato Visoni SOL 148127 Kintana 1036903


  end (* Fim PgContribuicoesHistoricoPrevidenciario - 22 *)
  else
  if NBKelegpart.ActivePage = 'PgContribuicoesHistoricoAssistencial' then (* PgContribuicoesHistoricoAssistencial - 23 *)
  begin
    { Desabilita o controle porque a query retorna muitas linhas e assim fica
      mais rápido porque o DBcontrole não é atualizado a cada linha retornada. }
    dtmConsPart1.qrycontrib.DisableControls;

    if not dtmConsPart1.qrycontrib.Prepared then dtmConsPart1.qrycontrib.Prepare;

    sidplanoprevconspart := DblkPlanos.LookUpValue;
    dtmConsPart1.qrycontrib.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart1.qrycontrib.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart1.qrycontrib.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart1.qrycontrib.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);

    // Andre Tavares - 03/03/2004 - 16131
    dtmConsPart1.qrycontrib.Filtered := False;
    dtmConsPart1.qrycontrib.Filter   := ' idpessjur = ' + sidpessjurconspart + ' and idplanoprev = '+sidplanoprevconspart;
    dtmConsPart1.qrycontrib.Filtered := True;
    // Fim.

    if not dtmConsPart1.qrycontrib.Active then dtmConsPart1.qrycontrib.Open;

    dtmConsPart1.qrycontrib.EnableControls;
  end (* Fim PgContribuicoesHistoricoAssistencial - 23 *)
  else if NBKelegpart.ActivePage = 'PgContatos' then (* PgContatos - 24 *)
  begin
    if not dtmConsPart1.qryContatos.Prepared then dtmConsPart1.qryContatos.Prepare;

    dtmConsPart1.qryContatos.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);

    if not dtmConsPart1.qryContatos.Active then dtmConsPart1.qryContatos.Open;
  end (* Fim PgContatos - 24 *)
  else if NBKelegpart.ActivePage = 'PgBeneficiosHistorico' then (* PgBeneficiosHistorico - 25 *)
  begin
    { desabilita o controle porque a query retorna muitas linhas e assim fica
      mais rápido porque o DBcontrole não é atualizado a cada linha retornada. }
    dtmConsPart.qryBenef.DisableControls;

    if not dtmConsPart.qryBenef.Prepared then dtmConsPart.qryBenef.Prepare;

    // André Tavares - 21/10/2003 - 15205
    dtmConsPart.qryBenef.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdTitular, -1);
    dtmConsPart.qryBenef.ParamByName('IDPESSOA').AsFloat    := StrtoIntDef(sIdPessoaConspart, -1);
    // Fim.

    dtmConsPart.qryBenef.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qryBenef.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryBenef.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);

    if not dtmConsPart.qryBenef.Active then dtmConsPart.qryBenef.Open;

    dtmConsPart.qryBenef.EnableControls;
    dtmConsPart.qryBenefPERCENTUAL.Visible := ( sIdTitular <> sIdPessoaConspart );
    //edilaine WO18367 : inicio
    dtmConsPart.qryBenefFLGAPRESENTABSFAB.Visible := false;
    dtmConsPart.qryBenefBSTITULAR.Visible   := ( sIdTitular <> sIdPessoaConspart ); //( dtmConsPart.qryBenefFLGAPRESENTABSFAB.AsInteger = 1);
    dtmConsPart.qryBenefFABTITULAR.Visible  := ( sIdTitular <> sIdPessoaConspart ); //( dtmConsPart.qryBenefFLGAPRESENTABSFAB.AsInteger = 1);
    dtmConsPart.qryBenefPERC_PENSAO.Visible := ( sIdTitular <> sIdPessoaConspart ); //( dtmConsPart.qryBenefFLGAPRESENTABSFAB.AsInteger = 1);
    //edilaine WO18367 : fim
  end (* Fim PgBeneficiosHistorico - 25 *)
  else
  if NBKelegpart.ActivePage = 'PgRUB' then (* PgRUB - 26 *)
  begin
    if not dtmConsPart.QryRubs.Prepared then dtmConsPart.QryRubs.Prepare;

    dtmConsPart.QryRubs.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);

    if not dtmConsPart.QryRubs.Active            then dtmConsPart.QryRubs.Open;
    if not dtmConsPart.qryTipoDocXRub.Prepared   then dtmConsPart.qryTipoDocXRub.Prepare;
    if not dtmConsPart.qryTipoDocXRub.Active     then dtmConsPart.qryTipoDocXRub.Open;
    if not dtmConsPart.qryRubXBeneficio.Prepared then dtmConsPart.qryRubXBeneficio.Prepare;
    if not dtmConsPart.qryRubXBeneficio.Active   then dtmConsPart.qryRubXBeneficio.Open;
    if not dtmConsPart.qryHistRubs.Prepared      then dtmConsPart.qryHistRubs.Prepare;
    if not dtmConsPart.qryHistRubs.Active        then dtmConsPart.qryHistRubs.Open;
  end (* Fim PgRUB - 26 *)
  else if NBKelegpart.ActivePage = 'PgRubricasSalariais' then (* PgRubricasSalariais - 27 *)
  begin
    if not dtmConsPart.qryMesRubrica.Prepared then dtmConsPart.qryMesRubrica.Prepare;

    dtmConsPart.qryMesRubrica.ParamByName('idPessoa').asInteger := StrtoIntDef(sidpessoaconspart, -1);

    if not dtmConsPart.qryMesRubrica.Active then dtmConsPart.qryMesRubrica.Open;


    //Renato Visoni SOL 37791/4261 Kintana 1187530
    dtmConsPart.QryMatriculas.Close;
    dtmConsPart.QryMatriculas.ParamByname('IDPESSOA').asInteger := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.QryMatriculas.Open;

    dbMatriculas.LookupValue := sidpessoaconspart;
    //Renato Visoni SOL 37791/4261 Kintana 1187530

    dtmConsPart.qryMesRubrica.First;
    dtmConsPart.qryMesRubrica.Filtered := False;
    dtmConsPart.qryMesRubrica.Filter   :=  ' idmodulo <> 18 ';
    dtmConsPart.qryMesRubrica.Filtered := True;

    if not dtmConsPart.qryPatros.Prepared then dtmConsPart.qryPatros.Prepare;

    dtmConsPart.qryPatros.ParamByName('idPessoa').asFloat := StrtoIntDef(sidpessoaconspart, -1);

    if not dtmConsPart.qryPatros.Active then dtmConsPart.qryPatros.Open;

    dblkPatros.LookupValue      := sidpessjurconspart;
    dblkPatros.Text             := dtmConsPart.qryPatros.fieldByName('NOME').asString;
    DblkMesCobranca.Text        := dtmConsPart.qryMesRubrica.fieldByName('MesCobranca').asString;
    DblkMesCobranca.LookupValue := dtmConsPart.qryMesRubrica.fieldByName('MesCobranca').asString;
    dblkMesCobrancaChange(self);
  end (* Fim PgRubricasSalariais - 27 *)
  else if NBKelegpart.ActivePage = 'PgEvolucaoFuncional' then (* PgEvolucaoFuncional - 28 *)
  begin
    if not dtmConsPart.qry.Prepared then dtmConsPart.qry.Prepare;


    FConsPessoaGeral.cIdPessjur :=  DblkPatro.LookUpValue;
    dtmConsPart.qry.ParamByName('IDPESSJUR').Value :=  DblkPatro.LookUpValue;//StrToIntDef(FConsPessoaGeral.cIdPessjur, -1); // Alberto - 22425 - 16/06/2006

    dtmConsPart.qry.ParamByName('IDPESSOA').Value  := StrtoIntDef(sidpessoaconspart, -1);

    if not dtmConsPart.qry.Active      then dtmConsPart.qry.Open;

    //BRUNO AZEVEDO SOL 150170 KINTANA 1092826
    dtmConsPart.qryDet.Close;
    dtmConsPart.qryDet.Sql.Clear;
    if (DblkPatro.LookUpValue <> '1') then begin
      with dtmConsPart.qryDet do begin
        Sql.Add('SELECT DISTINCT ');
        // Thiago Melo SOL 224464 Kintana 2058543
        //Sql.Add('       DT.MATRICULA, E.IDPESSJUR,       E.IDPESSOA,');///SOL 37791/4261 Kintana 1187530
        Sql.Add('       EL.MATRICULA, E.IDPESSJUR, E.IDPESSOA,');
        // Thiago Melo SOL 224464 Kintana 2058543
        Sql.Add('       E.IDPESSJURCG,     E.IDCARGOEXT,');
        Sql.Add('       E.IDPESSJURFG,     E.IDFUNCAO,');
        Sql.Add('       E.DATAINICIO,      E.DATAFINAL,');
        Sql.Add('       E.PERC1AC,         E.PERC2AC,');
        Sql.Add('       E.PERCATS,         E.PERCINSALUB,');
        Sql.Add('       E.PERCPERICUL,     E.PERCFUNCAO,');
        Sql.Add('       E.MODOFUNCAO,');
        Sql.Add('       E.ORIGEM, CE.CODIGO,');
        Sql.Add('       DECODE(E.ORIGEM, ''I'', ''Interface'',');
        Sql.Add('                        ''C'', ''Cadastrado'',');
        Sql.Add('                        ''E'', ''Evento de Manutenção'',');
        Sql.Add('                        ''R'', ''Retroativo'') AS DESCORIGEM,');
        Sql.Add('       DECODE(E.MODOFUNCAO, ''EF'', ''EFETIVO'',');
        Sql.Add('                            ''BC'', ''BOLSA DE CARGO'' ) AS DESCMODO,');
        Sql.Add('       DECODE(E.FLGSITPART,''AS'', ''Assistido'',');
        Sql.Add('                           ''AT'', ''Ativo'',');
        Sql.Add('                                 ''Outros'') AS DESCSITCADASTRADA,');
        Sql.Add('       CE.TITULO AS CARGO,');
        Sql.Add('       E.FLGSITPART,');
        // Thiago Melo SOL 239566 PPM 519625
        Sql.Add('       '' '' AS NIVEL');
        //Sql.Add('       '' '' AS NIVELINDIV1 AS NIVEL'); // Felipe Azevedo dos Santos // SOL 222547 KTN 486701
        // Thiago Melo SOL 239566 PPM 519625

      //  Sql.Add('  FROM EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N');SOL 37791/4261 Kintana 1187530
     //   Sql.Add(' WHERE E.IDPESSOA     = :IDPESSOA');SOL 37791/4261 Kintana 1187530

        // Thiago Melo SOL 224464 Kintana 2058543
        //Sql.Add('  FROM EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N, DEPENTIT DT');//SOL 37791/4261 Kintana 1187530
        Sql.Add('  FROM EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N, elegpatro el');
        // Thiago Melo SOL 224464 Kintana 2058543

        //Renato Visoni SOL 37791/4261 Kintana 1187530
        //Sql.Add(' WHERE E.IDPESSOA     = :IDPESSOA');

        sql.Add(' WHERE      (E.IDPESSOA IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO =  (SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = :IDPESSOA))) ');

        //Renato Visoni SOL 37791/4261 Kintana 1187530

        Sql.Add('   AND E.IDPESSJUR    = :IDPESSJUR');
        // Thiago Melo SOL 224464 Kintana 2058543
        //Sql.Add('   AND DT.IDPESSOA    = E.IDPESSOA ');//SOL 37791/4261 Kintana 1187530
        Sql.Add('   AND el.IDPESSOA    = E.IDPESSOA');
        Sql.Add('   AND EL.IDPESSJUR   = E.IDPESSJUR');
        // Thiago Melo SOL 224464 Kintana 2058543
        Sql.Add('   AND CE.IDCARGOEXT  = E.IDCARGOEXT');
        Sql.Add('   AND CE.IDPESSJUR   = E.IDPESSJUR');
        Sql.Add('   AND CN.IDPESSJUR   = CE.IDPESSJUR');
        Sql.Add('   AND CN.IDCARGOEXT  = CE.IDCARGOEXT');
        Sql.Add('   AND N.IDNIVEL      = CN.IDNIVEL');
        Sql.Add('   AND N.IDPESSJUR    = CN.IDPESSJUR');
        Sql.Add('   AND CN.DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA)');
        Sql.Add('                            FROM CARGOXNIVEL');
        Sql.Add('                           WHERE IDPESSJUR = CN.IDPESSJUR AND');
        Sql.Add('                                 IDCARGOEXT = CN.IDCARGOEXT AND');
        Sql.Add('                                 DATAFIM IS NULL)');
        Sql.Add(' ORDER BY E.DATAINICIO DESC');
      end;
    end else begin
      with dtmConsPart.qryDet do begin
       { Sql.Add('SELECT A.CODIGO, A.CARGO, A.DATAINICIO, B.DATAFIM AS DATAFINAL, S.FLGINTERNO DESCSITCADASTRADA, ''EFETIVO'' DESCMODO, '''' SITUACAO_CADASTRADA, ''ModFol'' DESCORIGEM ');
        Sql.Add('FROM');
        Sql.Add('(SELECT  E.IDCARGO CODIGO, C.TITULO CARGO, E.DATAALTERFUNC DATAINICIO, TO_DATE('''') DATAFIM, ROWNUM LINHA, EL.IDPESSOA, EL.IDPESSJUR');
        Sql.Add('  FROM   EVOLFUNC E, CARGO C, ELEGPATRO EL');
        Sql.Add('  WHERE  E.IDCARGO = C.IDCARGO');
        Sql.Add('  AND    E.IDPESSOA = EL.IDPESSOA');
        Sql.Add('  AND    EL.IDPESSJUR = :IDPESSJUR');
        Sql.Add('  AND    EL.MATRICULA = (SELECT MATRICULA FROM DEPENTIT WHERE IDPESSOA = :IDPESSOA AND IDTITULAR = :IDPESSOA)');
        Sql.Add('  AND    E.IDMOTIVO IN (25,54,50)');
        Sql.Add('  ORDER BY 3) A,');
        Sql.Add('(SELECT  E.IDCARGO CODIGO, C.TITULO CARGO, TO_DATE('''') DATAINICIO, (E.DATAALTERFUNC - 1) DATAFIM, (ROWNUM - 1) LINHA, EL.IDPESSOA, EL.IDPESSJUR');
        Sql.Add('  FROM   EVOLFUNC E, CARGO C, ELEGPATRO EL');
        Sql.Add('  WHERE  E.IDCARGO = C.IDCARGO');
        Sql.Add('  AND    E.IDPESSOA = EL.IDPESSOA');
        Sql.Add('  AND    EL.IDPESSJUR = :IDPESSJUR');
        Sql.Add('  AND    EL.MATRICULA = (SELECT MATRICULA FROM DEPENTIT WHERE IDPESSOA = :IDPESSOA AND IDTITULAR = :IDPESSOA)');
        Sql.Add('  AND    E.IDMOTIVO IN (25,54,50)');
        Sql.Add('  ORDER BY 4) B,');
        Sql.Add('PARTPREVPLAN P, SITPART S');
        Sql.Add('WHERE  A.LINHA         = B.LINHA (+)');
        Sql.Add('AND    A.IDPESSOA      = B.IDPESSOA (+)');
        Sql.Add('AND    A.IDPESSJUR     = B.IDPESSJUR (+)');
        Sql.Add('AND    A.IDPESSOA      = P.IDPESSOA (+)');
        Sql.Add('AND    P.IDSITPART     = S.IDSITPART');
        Sql.Add('AND    P.FLGDESATIVADO = 0');retirei solSOL 37791/4261 Kintana 1187530}
        ///SOL 37791/4261 Kintana 1187530
        Sql.Add('SELECT  A.MATRICULA, ');
        Sql.Add('        A.CODIGO, ');
        Sql.Add('        A.CARGO, ');
        Sql.Add('        A.DATAINICIO, ');
        Sql.Add('        B.DATAFIM AS DATAFINAL, ');
        Sql.Add('        S.FLGINTERNO DESCSITCADASTRADA, ');
        Sql.Add('        ''EFETIVO'' DESCMODO, ');
        Sql.Add('        '''' SITUACAO_CADASTRADA, ');
        Sql.Add('        ''ModFol'' DESCORIGEM, ');
        Sql.Add('        A.NIVELINDIV1 AS NIVEL'); // Felipe Azevedo dos Santos // SOL 222547 KTN 486701
        Sql.Add('  FROM (SELECT EL.MATRICULA, ');
        Sql.Add('               E.IDCARGO CODIGO, ');
        Sql.Add('               C.TITULO CARGO, ');
        Sql.Add('               E.DATAALTERFUNC DATAINICIO, ');
        Sql.Add('               TO_DATE('''') DATAFIM, ');
        Sql.Add('               ROWNUM LINHA, ');
        Sql.Add('               EL.IDPESSOA, ');
        Sql.Add('               EL.IDPESSJUR, ');
        Sql.Add('               E.NIVELINDIV1 '); // Felipe Azevedo dos Santos
        Sql.Add('          FROM EVOLFUNC E, CARGO C, ELEGPATRO EL ');
        Sql.Add('         WHERE E.IDCARGO = C.IDCARGO ');
        Sql.Add('           AND E.IDPESSOA = EL.IDPESSOA ');
        Sql.Add('           AND EL.IDPESSJUR = :IDPESSJUR ');
        Sql.Add('           AND EL.MATRICULA IN ');
        Sql.Add('               (SELECT MATRICULA ');
        Sql.Add('                  FROM DEPENTIT ');
        Sql.Add('                 WHERE IDPESSOA IN ');
        Sql.Add('                       (SELECT IDPESSOA ');
        Sql.Add('                          FROM PESSOA ');
        Sql.Add('                         WHERE NUMDOCUMENTO = ');
        Sql.Add('                               (SELECT NUMDOCUMENTO ');
        Sql.Add('                                  FROM PESSOA ');
        Sql.Add('                                 WHERE IDPESSOA = :IDPESSOA)) ');
        Sql.Add('                   AND IDTITULAR = IDPESSOA) ');
        Sql.Add('           AND E.IDMOTIVO IN (25, 54, 50) ');
        Sql.Add('         ORDER BY 3) A, ');
        Sql.Add('       (SELECT EL.MATRICULA, ');
        Sql.Add('               E.IDCARGO CODIGO, ');
        Sql.Add('               C.TITULO CARGO, ');
        Sql.Add('               TO_DATE('''') DATAINICIO, ');
        Sql.Add('               (E.DATAALTERFUNC - 1) DATAFIM, ');
        Sql.Add('               (ROWNUM - 1) LINHA, ');
        Sql.Add('               EL.IDPESSOA, ');
        Sql.Add('               EL.IDPESSJUR, ');
        Sql.Add('               E.NIVELINDIV1 '); // Felipe Azevedo dos Santos
        Sql.Add('          FROM EVOLFUNC E, CARGO C, ELEGPATRO EL ');
        Sql.Add('         WHERE E.IDCARGO = C.IDCARGO ');
        Sql.Add('           AND E.IDPESSOA = EL.IDPESSOA ');
        Sql.Add('           AND EL.IDPESSJUR = :IDPESSJUR ');
        Sql.Add('           AND EL.MATRICULA = ');
        Sql.Add('               (SELECT MATRICULA ');
        Sql.Add('                  FROM DEPENTIT ');
        Sql.Add('                 WHERE IDPESSOA = :IDPESSOA ');
        Sql.Add('                   AND IDTITULAR = :IDPESSOA) ');
        Sql.Add('           AND E.IDMOTIVO IN (25, 54, 50) ');
        Sql.Add('         ORDER BY 4) B, ');
        Sql.Add('       PARTPREVPLAN P, ');
        Sql.Add('       SITPART S ');
        Sql.Add('WHERE A.LINHA  = B.LINHA (+) ');
        Sql.Add('   AND A.IDPESSOA = B.IDPESSOA(+) ');
        Sql.Add('   AND A.IDPESSJUR = B.IDPESSJUR(+) ');
        Sql.Add('   AND A.IDPESSOA = P.IDPESSOA(+) ');
        Sql.Add('   AND P.IDSITPART = S.IDSITPART ');
        Sql.Add('   AND P.IDPLANOPREV = :IDPLANOPREV');
        Sql.Add(' ORDER BY A.DATAINICIO DESC');

        dtmConsPart.qryDet.ParamByName('IDPLANOPREV').Value  := StrToIntDef(sidplanoprevconspart, -1);
      ///SOL 37791/4261 Kintana 1187530
      end;
    end;
    if not dtmConsPart.qryDet.Prepared then dtmConsPart.qryDet.Prepare;

    dtmConsPart.qryDet.ParamByName('IDPESSJUR').Value := DblkPatro.LookUpValue; //StrToIntDef(FConsPessoaGeral.cIdPessjur, -1); // Alberto - 22425 - 16/06/2006

    //dtmConsPart.qryDet.ParamByName('IDPESSJUR').Value := StrToIntDef(FConsPessoaGeral.cIdPessjur, -1); // Alberto - 22425 - 16/06/2006
    dtmConsPart.qryDet.ParamByName('IDPESSOA').Value  := StrtoIntDef(sIdTitular, -1);

    if not dtmConsPart.qryDet.Active      then dtmConsPart.qryDet.Open;
    //BRUNO AZEVEDO SOL 150170 KINTANA 1092826

    if not dtmConsPart.qryFuncao.Prepared then dtmConsPart.qryFuncao.Prepare;

    dtmConsPart.qryFuncao.ParamByName('IDPESSJUR').Value   := StrToIntDef(FConsPessoaGeral.cIdPessjur, -1); // Alberto - 22425 - 16/06/2006
    dtmConsPart.qryFuncao.ParamByName('IDPESSOA').Value    := StrtoIntDef(sIdTitular, -1);
    dtmConsPart.qryFuncao.ParamByName('IDPLANOPREV').Value := StrToIntDef(sidplanoprevconspart, -1);

    if not dtmConsPart.qryFuncao.Active then dtmConsPart.qryFuncao.Open;

    dtmConsPart.qryFuncao.First;

    while not dtmConsPart.qryFuncao.EOF do begin
      dtmConsPart.qryFuncao.Edit;
      dtmConsPart.qryFuncao.fieldByName('VALORFUNCAO').asFloat :=  BuscaValorFUNCAOConsEleg(strToIntDef(dtmConsPart.qryFuncao.FieldByName('IdPessJur').asString, -1),
                                                                                strToIntDef(dtmConsPart.qryFuncao.FieldByName('IDfuncao').asString, -1),
                                                                                DateToStr(now));
      dtmConsPart.qryFuncao.Post;
      dtmConsPart.qryFuncao.Next;
    end;

    if not dtmConsPart.qryAdicCompens.Prepared then dtmConsPart.qryAdicCompens.Prepare;

    dtmConsPart.qryAdicCompens.ParamByName('IDPESSJUR').Value := StrToIntDef(FConsPessoaGeral.cIdPessjur, -1); // Alberto - 22425 - 16/06/2006
    dtmConsPart.qryAdicCompens.ParamByName('IDPESSOA').Value  := StrtoIntDef(sIdTitular, -1);

    if not dtmConsPart.qryAdicCompens.Active then dtmConsPart.qryAdicCompens.Open;

    dtmConsPart.qryAdicCompens.First;

    while not dtmConsPart.qryAdicCompens.EOF do begin
      dtmConsPart.qryAdicCompens.Edit;
      dtmConsPart.qryAdicCompens.fieldByName('VALORADICCOMP').asFloat := (BuscaValorFUNCAOConsEleg(strToIntDef(dtmConsPart.qryAdicCompens.FieldByName('IDPESSJUR').asString, -1),
                                                                               strToIntDef(dtmConsPart.qryAdicCompens.FieldByName('IDFUNCAO').asString, -1),
                                                                               DateToStr(now)) * (dtmConsPart.qryAdicCompens.fieldByName('PERC1AC').asFloat)/100);
      dtmConsPart.qryAdicCompens.Post;
      dtmConsPart.qryAdicCompens.Next;
    end;

    if not dtmConsPart.qryAdicInsalub.Prepared then dtmConsPart.qryAdicInsalub.Prepare;

    dtmConsPart.qryAdicInsalub.ParamByName('IDPESSJUR').Value := StrToIntDef(FConsPessoaGeral.cIdPessjur, -1); // Alberto - 22425 - 16/06/2006
    dtmConsPart.qryAdicInsalub.ParamByName('IDPESSOA').Value  := StrtoIntDef(sIdTitular, -1);

    if not dtmConsPart.qryAdicInsalub.Active   then dtmConsPart.qryAdicInsalub.Open;
    if not dtmConsPart.qryAdicPericul.Prepared then dtmConsPart.qryAdicPericul.Prepare;

    dtmConsPart.qryAdicPericul.ParamByName('IDPESSJUR').Value := StrToIntDef(FConsPessoaGeral.cIdPessjur, -1); // Alberto - 22425 - 16/06/2006
    dtmConsPart.qryAdicPericul.ParamByName('IDPESSOA').Value  := StrtoIntDef(sIdTitular, -1);

    if not dtmConsPart.qryAdicPericul.Active   then dtmConsPart.qryAdicPericul.Open;
    if not dtmConsPart.qryAdicNoturno.Prepared then dtmConsPart.qryAdicNoturno.Prepare;

    dtmConsPart.qryAdicNoturno.ParamByName('IDPESSJUR').Value := StrToIntDef(FConsPessoaGeral.cIdPessjur, -1); // Alberto - 22425 - 16/06/2006
    dtmConsPart.qryAdicNoturno.ParamByName('IDPESSOA').Value  := StrtoIntDef(sIdTitular, -1);

    if not dtmConsPart.qryAdicNoturno.Active then dtmConsPart.qryAdicNoturno.Open;

    // Marchetti - 25802
    if not dtmConsPart.qryAdicConfianca.Prepared then dtmConsPart.qryAdicConfianca.Prepare;

    dtmConsPart.qryAdicConfianca.ParamByName('IDPESSJUR').Value := StrToIntDef(FConsPessoaGeral.cIdPessjur, -1);
    dtmConsPart.qryAdicConfianca.ParamByName('IDPESSOA').Value  := StrtoIntDef(sIdTitular, -1);

    if not dtmConsPart.qryAdicConfianca.Active then dtmConsPart.qryAdicConfianca.Open;
    // Fim.

    if not dtmConsPart.qryATS.Prepared then dtmConsPart.qryATS.Prepare;

    dtmConsPart.qryATS.ParamByName('IDPESSJUR').Value := StrToIntDef(FConsPessoaGeral.cIdPessjur, -1); // Alberto - 22425 - 16/06/2006
    dtmConsPart.qryATS.ParamByName('IDPESSOA').Value  := StrtoIntDef(sIdTitular, -1);

    if not dtmConsPart.qryATS.Active then dtmConsPart.qryATS.Open;

    dtmConsPart.qryRubSalarial.Close;
    dtmConsPart.qryRubSalarial.ParamByName('IDPESSJUR').Value   := StrToIntDef(FConsPessoaGeral.cIdPessjur, -1); // Alberto - 22425 - 16/06/2006
    dtmConsPart.qryRubSalarial.ParamByName('IDPESSOA').Value    := StrtoIntDef(sIdTitular, -1);

    if not dtmConsPart.qryRubSalarial.Active then dtmConsPart.qryRubSalarial.Open;
    if not dtmConsPart.qryFuncoes.Prepared   then dtmConsPart.qryFuncoes.Prepare;

    dtmConsPart.qryFuncoes.ParamByName('IDPESSJUR').Value  := StrToIntDef(sidpessjurconspart, -1);

    if not dtmConsPart.qryFuncoes.Active       then dtmConsPart.qryFuncoes.Open;
    if not dtmConsPart.qryCargoxNivel.Prepared then dtmConsPart.qryCargoxNivel.Prepare;

    dtmConsPart.qryCargoxNivel.ParamByName('IDPESSJUR').Value := StrToIntDef(sidpessjurconspart, -1);

    if not dtmConsPart.qryCargoxNivel.Active then dtmConsPart.qryCargoxNivel.Open;
    if not dtmConsPart.qryProvDesc.Prepared  then dtmConsPart.qryProvDesc.Prepare;

    dtmConsPart.qryProvDesc.ParamByName('IDPESSJUR').Value := StrToIntDef(sidpessjurconspart, -1);

    if not dtmConsPart.qryProvDesc.Active then dtmConsPart.qryProvDesc.Open;
  end (* Fim PgEvolucaoFuncional - 28 *)
  else
  if NBKelegpart.ActivePage = 'pgCompraCarenciaTempo' then begin
  // SOL 151853 KTN 1130323
    qryCpCarencia.Close;
    qryCpCarencia.Parambyname('IDPESSJUR').asInteger   := StrToIntDef(sidpessjurconspart, -1);
    qryCpCarencia.Parambyname('IDPESSOA').asInteger    := StrtoIntDef(sIdTitular, -1);
    qryCpCarencia.Parambyname('IDPLANOPREV').asInteger := StrToIntDef(sidplanoprevconspart, -1);
    qryCpCarencia.Open;
  // SOL 151853 KTN 1130323
  end else
  if NBKelegpart.ActivePage = 'PgBeneficiosProcessos' then (* PgBeneficiosProcessos - 29 *)
  begin
    dtmConsPart.qryProcessosBenef.ParamByName('IDPESSOA').asFloat  := StrToIntDef(sIdPessoaConspart, -1);
    dtmConsPart.qryProcessosBenef.ParamByName('IDTITULAR').asFloat := StrToIntDef(sIdTitular, -1);
    sidplanoprevconspart := DblkPlanos.LookUpValue;
    // Andre Tavares - 03/03/2004 - 16131
    dtmConsPart.qryProcessosBenef.Filtered := False;
    dtmConsPart.qryProcessosBenef.Filter   := ' idpessjur = ' + sidpessjurconspart + ' and idplanoprev = '+sidplanoprevconspart;
    dtmConsPart.qryProcessosBenef.Filtered := True;
    // Fim.

    if not dtmConsPart.qryProcessosBenef.Prepared then dtmConsPart.qryProcessosBenef.Prepare;
    if not dtmConsPart.qryProcessosBenef.Active   then dtmConsPart.qryProcessosBenef.Open;

    dtmConsPart.qryProcessosBenefPERCENTUAL.Visible := ( sIdTitular <> sIdPessoaConspart );
  end (* Fim PgBeneficiosProcessos - 29 *)
  else if NBKelegpart.ActivePage = 'PgBeneficiosSituacaoAtual' then (* PgBeneficiosSituacaoAtual - 30 *)
  begin
    dtmConsPart.qrySituacaoAtualBenef.ParamByName('PIDEMPRESA').asInteger := Sistema.IdEmpresa;
    dtmConsPart.qrySituacaoAtualBenef.ParamByName('IDPESSOA').asFloat     := StrToIntDef(sIdPessoaConspart, -1);
    dtmConsPart.qrySituacaoAtualBenef.ParamByName('IDTITULAR').asFloat    := StrToIntDef(sIdTitular, -1); //SOL 151024 Kintana 1103373
    // Andre Tavares - 03/03/2004 - 16131
     sIdPlanoPrevConsPart := DblkPlanos.LookupValue;
    dtmConsPart.qrySituacaoAtualBenef.Filtered := False;
    dtmConsPart.qrySituacaoAtualBenef.Filter   := ' idpessjur = ' + sidpessjurconspart + ' and idplanoprev = '+sidplanoprevconspart;
    dtmConsPart.qrySituacaoAtualBenef.Filtered := True;
    // Fim.

    if not dtmConsPart.qrySituacaoAtualBenef.Prepared then dtmConsPart.qrySituacaoAtualBenef.Prepare;
    if not dtmConsPart.qrySituacaoAtualBenef.Active   then dtmConsPart.qrySituacaoAtualBenef.Open;

    //dbchkPAgoConvenio.Visible := (dtmConsPart.qrySituacaoAtualBenef.FieldByName('FLGPAGAINSS').AsInteger = 1);
  end (* Fim PgBeneficiosSituacaoAtual - 30 *)
  else
  if NBKelegpart.ActivePage = 'PgContribuicoesReservaHistoricoAlimentacao' then (* PgContribuicoesReservaHistoricoAlimentacao - 31 *)
  begin

     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT 1 FROM DEPENTIT ');
        SQL.Add(' WHERE IDPESSOA = IDTITULAR ');
        SQL.Add(' AND MATRICULA = :MATRICULA ');
        ParamByname('MATRICULA').AsString := edtMatricula.Text;
        Open;
     end;

     if Not(qryAux.isEmpty) then  // SOL 125795 1009799 Kintana
     begin
        dtmConsPart.cDSHistReserva.Close;
        dtmConsPart.qryHistReserva.ParamByName('IDTITULAR').AsFloat   := StrToIntDef(sIdPessoaConspart, -1);
        dtmConsPart.qryHistReserva.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
        dtmConsPart.qryHistReserva.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
        dtmConsPart.qryHistReserva.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);

        dtmConsPart.qryMesReferencia.Close;
        dtmConsPart.qryMesReferencia.ParamByName('IDTITULAR').AsFloat   := StrToIntDef(sIdPessoaConspart, -1);
        dtmConsPart.qryMesReferencia.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
        dtmConsPart.qryMesReferencia.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
        dtmConsPart.qryMesReferencia.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
        dtmConsPart.qryMesReferencia.Open;

        dtmConsPart.qryNomeReserva.Close;
        dtmConsPart.qryNomeReserva.ParamByName('IDTITULAR').AsFloat   := StrToIntDef(sIdPessoaConspart, -1);
        dtmConsPart.qryNomeReserva.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
        dtmConsPart.qryNomeReserva.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
        dtmConsPart.qryNomeReserva.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
        dtmConsPart.qryNomeReserva.Open;

        if not dtmConsPart.CdsHistReserva.active then dtmConsPart.cDSHistReserva.Open;

        TotalizaReserva;
     end
     else
     begin
        dtmConsPart.cDSHistReserva.Close;
        dtmConsPart.qryHistReserva.ParamByName('IDTITULAR').AsFloat   := -1;
        dtmConsPart.qryHistReserva.ParamByName('IDPESSJUR').AsFloat   := -1;
        dtmConsPart.qryHistReserva.ParamByName('IDPLANOPREV').AsFloat := -1;
        dtmConsPart.qryHistReserva.ParamByName('SEQPROPOSTA').AsFloat := -1;

        dtmConsPart.qryMesReferencia.Close;
        dtmConsPart.qryMesReferencia.ParamByName('IDTITULAR').AsFloat   := -1;
        dtmConsPart.qryMesReferencia.ParamByName('IDPESSJUR').AsFloat   := -1;
        dtmConsPart.qryMesReferencia.ParamByName('IDPLANOPREV').AsFloat := -1;
        dtmConsPart.qryMesReferencia.ParamByName('SEQPROPOSTA').AsFloat := -1;
        dtmConsPart.qryMesReferencia.Open;

        dtmConsPart.qryNomeReserva.Close;
        dtmConsPart.qryNomeReserva.ParamByName('IDTITULAR').AsFloat   := -1;
        dtmConsPart.qryNomeReserva.ParamByName('IDPESSJUR').AsFloat   := -1;
        dtmConsPart.qryNomeReserva.ParamByName('IDPLANOPREV').AsFloat := -1;
        dtmConsPart.qryNomeReserva.ParamByName('SEQPROPOSTA').AsFloat := -1;
        dtmConsPart.qryNomeReserva.Open;

        if not dtmConsPart.CdsHistReserva.active then dtmConsPart.cDSHistReserva.Open;

        TotalizaReserva;
     end;
  end (* Fim PgContribuicoesReservaHistoricoAlimentacao - 31 *)
  else
  if NBKelegpart.ActivePage = 'PgContribuicoesSituacaoAtual' then (* PgContribuicoesSituacaoAtual - 32 *)
  begin
    dtmConsPart.qryContribSitAtual.ParamByName('IDPESSOA').AsFloat    := StrToIntDef(sIdTitular, -1);

    dtmConsPart.qryContribSitAtual.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(dblkPatro.LookupValue, -1);
    dtmConsPart.qryContribSitAtual.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryContribSitAtual.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);

    if (dtmConsPart.qryContribSitAtual.prepared) and (not dtmConsPart.qryContribSitAtual.active) then dtmConsPart.qryContribSitAtual.unPrepare;

    if not dtmConsPart.qryContribSitAtual.active then begin
      dtmConsPart.qryContribSitAtual.prepare;
      dtmConsPart.qryContribSitAtual.Open;
    end;
  end (* Fim PgContribuicoesSituacaoAtual - 32 *)
  else
  if NBKelegpart.ActivePage = 'PgContrSitAtualBeneficiario' then (* PgContrSitAtualBeneficiario - 33 *)
  begin
    if not dtmConsPart1.qryContribSitAtualBeneficiario.Active then begin
      dtmConsPart1.qryContribSitAtualBeneficiario.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sIdPessoaConsPart, -1);
      dtmConsPart1.qryContribSitAtualBeneficiario.Open;
    end;
  end (* Fim PgContrSitAtualBeneficiario - 33 *)
  else
  if NBKelegpart.ActivePage = 'PgBeneficiosHistoricoRevisoes' then (* PgBeneficiosHistoricoRevisoes - 34 *)
  begin
    //Marcelo Almeida - SOL 136383 - Kintana 815815
    CarregarHistoricoRevisoesBeneficios();
    //Marcelo Almeida - SOL 136383 - Kintana 815815

    //Marcelo Almeida - SOL 136383 - Kintana 815815 ** Comentamos o código abaixo porque a funcionalidade mudou para chamada CarregarHistoricoRevisoesBeneficios();
    {
    if not dtmConsPart1.qryBeneficios.Prepared then dtmConsPart1.qryBeneficios.Prepare;

    // Andre Tavares - 17362 - 11/10/2004
    dtmConsPart1.qryBeneficios.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidTitular, -1);
    dtmConsPart1.qryBeneficios.ParamByName('IDPESSOA').AsFloat  := StrtoIntDef(sidpessoaconspart, -1);
    // Fim.

    dtmConsPart1.qryBeneficios.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);

// Andre Tavares - 03/03/2004 - 16131 - Início ---------------------------------
    dtmConsPart1.qryBeneficios.Filtered := False;

    if (Trim(sidpessjurconspart) <> '') and (Trim(sidplanoprevconspart) <> '' ) then
       dtmConsPart1.qryBeneficios.Filter := ' idpessjur = ' + sidpessjurconspart + ' and idplanoprev = '+sidplanoprevconspart
    else
       if Trim(sidplanoprevconspart) <> '' then
          dtmConsPart1.qryBeneficios.Filter := ' idplanoprev = '+sidplanoprevconspart
       else
          if (Trim(sidpessjurconspart) <> '') then
             dtmConsPart1.qryBeneficios.Filter := ' idpessjur = ' + sidpessjurconspart;

    dtmConsPart1.qryBeneficios.Filtered := True;
// Andre Tavares - 03/03/2004 - 16131 - Fim ------------------------------------

    if not dtmConsPart1.qryBeneficios.Active then dtmConsPart1.qryBeneficios.Open;

    dtmConsPart.qryMovBenef.ParamByName('IDPESSOA').AsInteger       := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryMovBenef.ParamByName('IDTITULAR').AsInteger      := StrtoIntDef(sidTitular, -1);
    dtmConsPart.qryMovBenef.ParamByName('NUMEROPROCESSO').AsInteger := dtmConsPart1.qrybeneficios.FieldByName('NUMEROPROCESSO').AsInteger;

    if not dtmConsPart.qryMovBenef.Active then dtmConsPart.qryMovBenef.Open;

    dtmConsPart.qryBenefPERCENTUAL.Visible := ( sIdTitular <> sIdPessoaConspart );
    }
    //Marcelo Almeida - SOL 136383 - Kintana 815815

  end; (* Fim PgBeneficiosHistoricoMovimentacoes - 34 *)

  //Eraldo Silva - SOL 149830/6383 - Kintana 1411406 INICIO
  if NBKelegpart.ActivePage = 'PgBeneficiosHistoricoMovimentacoes' then (* PgBeneficiosHistoricoMovimentacoes - 34 *)
  begin
      if not dtmConsPart1.qryBeneficios.Prepared then dtmConsPart1.qryBeneficios.Prepare;
    dtmConsPart1.qryBeneficios.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidTitular, -1);
    dtmConsPart1.qryBeneficios.ParamByName('IDPESSOA').AsFloat  := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart1.qryBeneficios.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    dtmConsPart1.qryBeneficios.Filtered := False;
    if (Trim(sidpessjurconspart) <> '') and (Trim(sidplanoprevconspart) <> '' ) then
       dtmConsPart1.qryBeneficios.Filter := ' idpessjur = ' + sidpessjurconspart + ' and idplanoprev = '+sidplanoprevconspart
    else
       if Trim(sidplanoprevconspart) <> '' then
          dtmConsPart1.qryBeneficios.Filter := ' idplanoprev = '+sidplanoprevconspart
       else
          if (Trim(sidpessjurconspart) <> '') then
             dtmConsPart1.qryBeneficios.Filter := ' idpessjur = ' + sidpessjurconspart;
    dtmConsPart1.qryBeneficios.Filtered := True;
    dtmConsPart1.qryBeneficios.DisableControls;//Helio - SOL Nº 253577/17604 PPM Nº 999484
    if not dtmConsPart1.qryBeneficios.Active then dtmConsPart1.qryBeneficios.Open;
    //Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484
    MostraOcultaCamposDbgridbeneficios;
    dtmConsPart1.qryBeneficios.EnableControls;
    //Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484
    dtmConsPart.qryMovBenef.ParamByName('IDPESSOA').AsInteger       := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryMovBenef.ParamByName('IDTITULAR').AsInteger      := StrtoIntDef(sidTitular, -1);
    dtmConsPart.qryMovBenef.ParamByName('NUMEROPROCESSO').AsInteger := dtmConsPart1.qrybeneficios.FieldByName('NUMEROPROCESSO').AsInteger;
    dtmConsPart.qryMovBenef.DisableControls;//Helio - SOL Nº 253577/17604 PPM Nº 999484
    if not dtmConsPart.qryMovBenef.Active then dtmConsPart.qryMovBenef.Open;
    //Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484
    MostraOcultaCamposDbgridMovBenef;
    dtmConsPart.qryMovBenef.EnableControls;
    //Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484
    dtmConsPart.qryBenefPERCENTUAL.Visible := ( sIdTitular <> sIdPessoaConspart );
    end
   //Eraldo Silva - SOL 149830/6383 - Kintana 1411406 FIM

  else
  if NBKelegpart.ActivePage = 'PgPlanosBenef' then (* PgPlanosBenef - 35 *)
  begin
    if not dtmConsPart1.qryPlanPrevBenef.Active then begin
      dtmConsPart1.qryPlanPrevBenef.paramByName('IDPESSOA').asInteger := strToIntDef(sIdpessoaConspart, -1);
      dtmConsPart1.qryPlanPrevBenef.Open;
      if dtmConsPart1.qryPlanPrevBenef.isEmpty then begin
        dtmConsPart1.qryPlanPrevBenef.Close;
        dtmConsPart1.qryPlanPrevBenef.paramByName('IDPESSOA').asInteger := strToIntDef(sIdTitular, -1);
        dtmConsPart1.qryPlanPrevBenef.Open;
      end;
    end;
  end (* Fim PgPlanosBenef - 35 *)
  else
  if NBKelegpart.ActivePage = 'PgPlanos' then (* PgPlanos - 36 *)
  begin
    if not dtmConsPart1.qryplanprev.Active then begin
      //Renato Visoni SOL 37791/4261 Kintana 1187530
      dtmConsPart1.qryplanprev.Close;
      dtmConsPart1.qryplanprev.SQL.Clear;
      dtmConsPart1.qryplanprev.SQL.Add(' SELECT       DP.MATRICULA, ');
      dtmConsPart1.qryplanprev.SQL.Add('               PL.IDPLANOPREV, ');
      dtmConsPart1.qryplanprev.SQL.Add('               PL.NOME, ');
      dtmConsPart1.qryplanprev.SQL.Add('               SIT.DESCRICAO, ');
      dtmConsPart1.qryplanprev.SQL.Add('               SITPART.DESCRICAO SITPART, ');
      dtmConsPart1.qryplanprev.SQL.Add('               PA.INSCRICAODATA, ');
      dtmConsPart1.qryplanprev.SQL.Add('               PA.INSCRICAONUMERO, ');
      dtmConsPart1.qryplanprev.SQL.Add('               PA.SALPARTICIPACAO, ');
      dtmConsPart1.qryplanprev.SQL.Add('               PA.SALMANTIDO, ');
      dtmConsPart1.qryplanprev.SQL.Add('               PA.DATACANCELAMENTO,');
      dtmConsPart1.qryplanprev.SQL.Add('               PA.DATAINICIOMANUT, ');
      dtmConsPart1.qryplanprev.SQL.Add('               PA.DTINICIOINSC, ');
      dtmConsPart1.qryplanprev.SQL.Add('               PA.FLGFITESPECIAL,');
      dtmConsPart1.qryplanprev.SQL.Add('               PA.IDPESSJUR AS CODPATRO,');

      dtmConsPart1.qryplanprev.SQL.Add('               DECODE(NVL(PA.TIPOOPCAOIR,0),0,''Sem Opção'',1,''Progressiva'',2,''Regressiva'') AS TIPOOPCAOIR,');
      dtmConsPart1.qryplanprev.SQL.Add('               PA.DATAOPCAOIR,');

      dtmConsPart1.qryplanprev.SQL.Add('               P.NOME AS PATROCINADORA');
      dtmConsPart1.qryplanprev.SQL.Add('  FROM');
      dtmConsPart1.qryplanprev.SQL.Add('               PARTPREVPLAN PA ,');
      dtmConsPart1.qryplanprev.SQL.Add('               SITPLANOPREV SIT,');
      dtmConsPart1.qryplanprev.SQL.Add('               SITPART,');
      dtmConsPart1.qryplanprev.SQL.Add('               PLANPREV PL,');
      dtmConsPart1.qryplanprev.SQL.Add('               PESSOA P,');
      dtmConsPart1.qryplanprev.SQL.Add('               DEPENTIT DP ');
      dtmConsPart1.qryplanprev.SQL.Add('  WHERE');
      dtmConsPart1.qryplanprev.SQL.Add('  PA.IDPESSOA IN (SELECT IDPESSOA FROM PESSOA WHERE NUMDOCUMENTO =  (SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = :IDTITULAR)) ');
      dtmConsPart1.qryplanprev.SQL.Add('  AND          (DP.IDPESSOA = PA.IDPESSOA)');
      dtmConsPart1.qryplanprev.SQL.Add('  AND     (PA.IDSITPLANOPREV = SIT.IDSITPLANOPREV)');
      dtmConsPart1.qryplanprev.SQL.Add('  AND     (PA.IDSITPART = SITPART.IDSITPART)');
      dtmConsPart1.qryplanprev.SQL.Add('  AND     (PL.IDPLANOPREV = PA.IDPLANOPREV)');
      dtmConsPart1.qryplanprev.SQL.Add('  AND     (PA.IDPESSJUR = P.IDPESSOA)');
      dtmConsPart1.qryplanprev.SQL.Add('  AND     (PA.IDPESSJUR = :IdpessJur)');
      dtmConsPart1.qryplanprev.SQL.Add('  AND     (DP.IDPESSOA  = DP.IDTITULAR)');   // SOL 186139 Kintana 1751410
      dtmConsPart1.qryplanprev.SQL.Add('  ORDER BY PA.FLGDESATIVADO, PA.DTINICIOINSC DESC');
      //Renato Visoni SOL 37791/4261 Kintana 1187530

      dtmConsPart1.qryplanprev.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sIdTitular, -1);
      dtmConsPart1.qryplanprev.ParamByName('IdPessJur').AsString := DblkPatro.LookUpValue;


      if not dtmConsPart1.qryplanprev.Prepared then dtmConsPart1.qryplanprev.Prepare;

      dtmConsPart1.qryplanprev.Open;
    end;

    if not dtmConsPart1.qryplanass.Active then begin
      dtmConsPart1.qryplanass.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sidpessoaconspart, -1);
      dtmConsPart1.qryplanass.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
      dtmConsPart1.qryplanass.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);

      if not dtmConsPart1.qryplanass.Prepared then dtmConsPart1.qryplanass.Prepare;

      dtmConsPart1.qryplanass.Open;
    end;

// Andre Tavares - 17834 - 29/10/2004 - Início ---------------------------------
    dbedPlanoContab.DataSource := nil;
    dbedPlanoContab.text := '';
    if (fParticipante_Assistido or fRecebedor_Beneficio or fRecebedor_Pensao_Alimenticia) and (not dtmConsPart1.qryPlanoContabAssist.Active) then
    begin
      dbedPlanoContab.DataSource := dtmConsPart1.dsPlanoContabAssist;
      dtmConsPart1.qryPlanoContabAssist.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
      dtmConsPart1.qryPlanoContabAssist.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidtitular, -1);
      dtmConsPart1.qryPlanoContabAssist.ParamByName('IDPESSJUR').AsFloat := StrToIntDef(sidpessjurconspart, -1);
      dtmConsPart1.qryPlanoContabAssist.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      dtmConsPart1.qryPlanoContabAssist.Open;
    end else
    if (fParticipante_Ativo) and (not dtmConsPart1.qryPlanoContabAtivo.Active) then
    begin
      dbedPlanoContab.DataSource := dtmConsPart1.dsPlanoContabAtivo;
      dtmConsPart1.qryPlanoContabAtivo.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
      dtmConsPart1.qryPlanoContabAtivo.Open;
    end;
// Andre Tavares - 17834 - 29/10/2004 - Fim ------------------------------------
  end (* Fim PgPlanos - 36 *)
  else
  if NBKelegpart.ActivePage = 'PgEnquadramento' then (* PgEnquadramento - 37 *)
  begin
    qryAux.Close;
    qryAux.DataBaseName := 'BaseDados';

    if not dtmConsPart.qryEvolFuncCargo.Active then begin
      dtmConsPart.qryEvolFuncCargo.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);

      if not dtmConsPart.qryEvolFuncCargo.Active then dtmConsPart.qryEvolFuncCargo.Open;
    end;

    if not dtmConsPart.qryEvolFuncATS.Active then begin
      dtmConsPart.qryEvolFuncATS.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);

      if not dtmConsPart.qryEvolFuncATS.Active then dtmConsPart.qryEvolFuncATS.Open;
    end;

    if not dtmConsPart.qryEvolFuncao.Active then begin
      dtmConsPart.qryEvolFuncao.Open;

      varFields := VarArrayCreate([0,1],varVariant);

      (* PREENCHER QUERY SECAO 1 COM AS FUNCOES E SEUS DADOS, GRAVADOS NA DETCALCULO *)
      with qryAux do begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT  EV.IDPESSOA, EV.DATAINICIO, EV.DATAFINAL, '                                             +
                '         CEXT.CODIGO AS CODIGO, CEXT.TITULO AS NOME, '                                           +
                '         D.DESCRICAO, D.VALOR '                                                                  +
                ' FROM    PESSOA P, PESSOA PAT, PESSOAFISICA PF, EVOLFUNCPREV EV , '                              +
                '         CARGOEXT CEXT, DETCALCULO D '                                                           +
                ' WHERE   EV.IDPESSOA       = '+sIdPessoaConsPart                                                 +
                ' AND     P.IDPESSOA        = EV.IDPESSOA '                                                       +
                ' AND     PF.IDPESSOA       = EV.IDPESSOA '                                                       +
                ' AND     PAT.IDPESSOA      = EV.IDPESSJUR '                                                      +
                ' AND     CEXT.IDCARGOEXT   = EV.IDFUNCAO '                                                       +
                ' AND     D.IDPESSOA        = EV.IDPESSOA '                                                       +
                ' AND     D.IDCALCULO =  ( SELECT MAX(IDCALCULO) FROM DETCALCULO '                                +
                '                          WHERE  IDPESSOA = '+sIdPessoaConsPart                                  +
                '                          AND    UPPER(DESCRICAO) LIKE ''%CALCULO DO ENQUADRAMENTO%'') '         +
                ' AND     ((D.DESCRICAO LIKE ''%CODFUNC/%/MODO%'') OR (D.DESCRICAO LIKE ''%CODACPF/%/MODO%'') ) ' +
                ' AND     SUBSTR(D.VALOR,1,3) = RTRIM(CEXT.CODIGO) '                                              +
                ' ORDER BY EV.DATAINICIO ' );
        Open;
        First;

        while not EOF do begin
          { Verificar se a funcao já nao foi incluida pela data inicio e codigo
            Se nao encontrar, verificar se a desccontrole já foi incluida
            Se nao encontrar, entao inserir. }
          varFields[0] := FieldByName('DATAINICIO').AsString;
          varFields[1] := FieldByName('CODIGO').AsString;
          bInsere      := True;

          with dtmConsPart.qryEvolFuncao do begin
            First;

            while not EOF do begin
              if (Trim(FieldByName('DATACONTROLE').AsString) = Trim(qryAux.FieldByName('DATAINICIO').AsString)) and
                 (Trim(FieldByName('CODIGO').AsString)       = Trim(qryAux.FieldByName('CODIGO').AsString)) then
              begin
                bInsere := False;
                Break;
              end else begin
                if Trim(FieldByName('DESCCONTROLE').AsString) = Trim(Copy(qryAux.FieldByName('DESCRICAO').AsString,1,30)) then begin
                  bInsere := False;
                  Break;
                end;
              end;

              Next;
            end;
          end;

          if bInsere then begin
            dtmConsPart.qryEvolFuncao.Insert;
            dtmConsPart.qryEvolFuncao.FieldByName('CODIGO').AsString     := FieldByName('CODIGO').AsString;
            dtmConsPart.qryEvolFuncao.FieldByName('DATAINICIO').AsString := FieldByName('DATAINICIO').AsString;
            dtmConsPart.qryEvolFuncao.FieldByName('DATAFINAL').AsString  := FieldByName('DATAFINAL').AsString;
            dtmConsPart.qryEvolFuncao.FieldByName('NOME').AsString       := FieldByName('NOME').AsString;

            sStringAux := FieldByName('VALOR').AsString;
            i          := Pos('/',sStringAux);
            sStringAux := Copy(sStringAux,i+1, Length(sStringAux) - i);
            i          := Pos('/',sStringAux);
            dtmConsPart.qryEvolFuncao.FieldByName('PERCPBC').AsString := Copy(sStringAux,1,i-1);

            if Pos('ACPF', FieldByName('DESCRICAO').AsString) > 0 then
                 dtmConsPart.qryEvolFuncao.FieldByName('MODO').AsString    := 'AC'
            else dtmConsPart.qryEvolFuncao.FieldByName('MODO').AsString    := Copy(sStringAux,i+1,2);

            dtmConsPart.qryEvolFuncao.FieldByName('DATACONTROLE').AsString := FieldByName('DATAINICIO').AsString;
            dtmConsPart.qryEvolFuncao.FieldByName('DESCCONTROLE').AsString := Copy(FieldByName('DESCRICAO').AsString, 1,30);
            dtmConsPart.qryEvolFuncao.Post;
          end;

          Next;
        end;
      end;
    end;

    (* PREENCHER QUERY SECAO 2 COM OS QUADROS COMPONENTES X VALOR E COMPONENTES X PERCENTUAL *)
    bAchouLinhaVazia := False;

    with qryAux do begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  1 AS ORDEM,                                                     '              +
              '         D.IDPESSOA,                                                     '              +
              '         '' '' AS NOMEITEM,                                              '              +
              '         REPLACE(REPLACE(D.DESCRICAO, ''DIB'',''''), '':'', '''') AS DESCITEM, '        +
              '         D.VALOR AS VALORITEM                                            '              +
              ' FROM    DETCALCULO D                                                    '              +
              ' WHERE   D.IDPESSOA  = '+sIdPessoaConsPart                                              +
              ' AND     D.IDCALCULO =  ( SELECT MAX(IDCALCULO) FROM DETCALCULO          '              +
              '                          WHERE  IDPESSOA = '+sIdPessoaConsPart                         +
              '                          AND    UPPER(DESCRICAO) LIKE ''%CALCULO DO ENQUADRAMENTO%'') '+
              ' AND     D.DESCRICAO LIKE ''%DIB%''                                                    '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CODFUNC%'')                                          '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CODACPF%'')                                          '+
              ' AND     NOT (D.DESCRICAO LIKE ''%BNH%'')                                              '+
              ' AND     NOT (D.DESCRICAO LIKE ''%ENQUADRAMENTO%'')                                    '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CÓDIGO%'')                                           '+
              ' UNION                                                                                 '+
              ' SELECT  2 AS ORDEM,                                                                   '+
              '         D.IDPESSOA,                                                                   '+
              '         ''Outras Rubricas Salariais'' AS NOMEITEM,                                    '+
              '         REPLACE(REPLACE(D.DESCRICAO, ''DIB'',''''), '':'', '''') AS DESCITEM, '        +
              '         D.VALOR AS VALORITEM                                                          '+
              ' FROM    DETCALCULO D                                                                  '+
              ' WHERE   D.IDPESSOA  = '+sidpessoaconspart+
              ' AND     D.IDCALCULO =  ( SELECT MAX(IDCALCULO) FROM DETCALCULO                        '+
              '                          WHERE  IDPESSOA = '+sidpessoaconspart+
              '                          AND    UPPER(DESCRICAO) LIKE ''%CALCULO DO ENQUADRAMENTO%'') '+
              ' AND     D.DESCRICAO LIKE ''%BNH%DIB%''                                                '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CODFUNC%'')                                          '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CODACPF%'')                                          '+
              ' AND     NOT (D.DESCRICAO LIKE ''%ENQUADRAMENTO%'')                                    '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CÓDIGO%'')                                           '+
              ' ORDER BY ORDEM ');

      Open;
      nTotOrdem1 := 0;
      nTotOrdem2 := 0;
      lTotOrdem2 := True;

      // Inserir tudo que não é percentual
      First;

      dtmConsPart.qryEnqSecao2.Open;
      dtmConsPart.qryEnqSecao2.Delete;

      while not EOF do begin
        if Pos('%',FieldByName('DESCITEM').AsString) > 0 then begin
          Next;
          Continue;
        end;

        if (FieldByName('ORDEM').AsString = '2') and (lTotOrdem2) then begin
          lTotOrdem2 := False;
          dtmConsPart.qryEnqSecao2.Append;
          dtmConsPart.qryEnqSecao2.FieldByName('ORDEM').AsString        := FieldByName('ORDEM').AsString;
          dtmConsPart.qryEnqSecao2.FieldByName('IDPESSOA').AsString     := FieldByName('IDPESSOA').AsString;
          dtmConsPart.qryEnqSecao2.FieldByName('NOMEITEM').AsString     := FieldByName('NOMEITEM').AsString;
          dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString     := 'Sub-Total';
          dtmConsPart.qryEnqSecao2.FieldByName('VALORITEM').AsFloat     := nTotOrdem1;
          dtmConsPart.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString := '';
          dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString     := '';
          dtmConsPart.qryEnqSecao2.Post;
        end;

        dtmConsPart.qryEnqSecao2.Append;
        dtmConsPart.qryEnqSecao2.FieldByName('ORDEM').AsString        := FieldByName('ORDEM').AsString;
        dtmConsPart.qryEnqSecao2.FieldByName('IDPESSOA').AsString     := FieldByName('IDPESSOA').AsString;
        dtmConsPart.qryEnqSecao2.FieldByName('NOMEITEM').AsString     := FieldByName('NOMEITEM').AsString;
        dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString     := FieldByName('DESCITEM').AsString;
        dtmConsPart.qryEnqSecao2.FieldByName('VALORITEM').AsFloat     := StrToFloat(ClienteNum(FieldByName('VALORITEM').AsString));
        dtmConsPart.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString := '';
        dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString     := '';
        dtmConsPart.qryEnqSecao2.Post;

        if FieldByName('ORDEM').AsString = '1' then
             nTotOrdem1 := nTotOrdem1 + StrToFloat(ClienteNum(FieldByName('VALORITEM').AsString))
        else nTotOrdem2 := nTotOrdem2 + StrToFloat(ClienteNum(FieldByName('VALORITEM').AsString));

        Next;
      end;

      dtmConsPart.qryEnqSecao2.Append;
      dtmConsPart.qryEnqSecao2.FieldByName('ORDEM').AsString        := FieldByName('ORDEM').AsString;
      dtmConsPart.qryEnqSecao2.FieldByName('IDPESSOA').AsString     := FieldByName('IDPESSOA').AsString;
      dtmConsPart.qryEnqSecao2.FieldByName('NOMEITEM').AsString     := FieldByName('NOMEITEM').AsString;
      dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString     := 'Sub-Total';
      dtmConsPart.qryEnqSecao2.FieldByName('VALORITEM').AsFloat     := nTotOrdem2;
      dtmConsPart.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString := '';
      dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString     := '';
      dtmConsPart.qryEnqSecao2.Post;

      dtmConsPart.qryEnqSecao2.Append;
      dtmConsPart.qryEnqSecao2.FieldByName('ORDEM').AsString        := FieldByName('ORDEM').AsString;
      dtmConsPart.qryEnqSecao2.FieldByName('IDPESSOA').AsString     := FieldByName('IDPESSOA').AsString;
      dtmConsPart.qryEnqSecao2.FieldByName('NOMEITEM').AsString     := FieldByName('NOMEITEM').AsString;
      dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString     := 'Total';
      dtmConsPart.qryEnqSecao2.FieldByName('VALORITEM').AsFloat     := nTotOrdem1 + nTotOrdem2;
      dtmConsPart.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString := '';
      dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString     := '';
      dtmConsPart.qryEnqSecao2.Post;

      edValEnq.Text := FloattoStr(nTotOrdem1 + nTotOrdem2);

      // Inserir os percentuais
      First;

      while not EOF do begin
        if Pos('%',FieldByName('DESCITEM').AsString) <= 0 then begin
          Next;
          Continue;
        end;

        if dtmConsPart.qryEnqSecao2.IsEmpty then begin
          dtmConsPart.qryEnqSecao2.Append;
          dtmConsPart.qryEnqSecao2.FieldByName('NOMEITEM').AsString     := FieldByName('NOMEITEM').AsString;
          dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString     := '';
          dtmConsPart.qryEnqSecao2.FieldByName('VALORITEM').AsFloat     := 0;
          dtmConsPart.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString := FieldByName('DESCITEM').AsString;

          if StrToFloat(ClienteNum(FieldByName('VALORITEM').AsString)) = 0 then
               dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString := ''
          else dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString := ClienteNum(FieldByName('VALORITEM').AsString);

          dtmConsPart.qryEnqSecao2.Post;
        end else begin
          dtmConsPart.qryEnqSecao2.First;

          while not dtmConsPart.qryEnqSecao2.EOF do begin
            if Pos(copy(FieldByName('DESCITEM').AsString,7,5),dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString) > 0 then begin
              bAchouLinhaVazia := True;

              dtmConsPart.qryEnqSecao2.Edit;
              dtmConsPart.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString := FieldByName('DESCITEM').AsString;

              if StrToFloat(ClienteNum(FieldByName('VALORITEM').AsString)) = 0 then
                   dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString := ''
              else dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString := ClienteNum(FieldByName('VALORITEM').AsString);

              dtmConsPart.qryEnqSecao2.Post;
            end;

            dtmConsPart.qryEnqSecao2.Next;
          end;

          if not bAchouLinhaVazia then begin
            dtmConsPart.qryEnqSecao2.Append;
            dtmConsPart.qryEnqSecao2.FieldByName('NOMEITEM').AsString     := FieldByName('NOMEITEM').AsString;
            dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString     := '';
            dtmConsPart.qryEnqSecao2.FieldByName('VALORITEM').AsFloat     := 0;
            dtmConsPart.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString := FieldByName('DESCITEM').AsString;

            if StrToFloat(ClienteNum(FieldByName('VALORITEM').AsString)) = 0 then
                 dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString := ''
            else dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString := ClienteNum(FieldByName('VALORITEM').AsString);

            dtmConsPart.qryEnqSecao2.Post;
          end;
        end;

        Next;
      end;

      dtmConsPart.qryEnqSecao2.First;

      while not dtmConsPart.qryEnqSecao2.EOF do begin
        if (dtmConsPart.qryEnqSecao2.FieldByName('VALORITEM').AsFloat = 0 ) and
           (dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString = '' ) then dtmConsPart.qryEnqSecao2.Delete;

        dtmConsPart.qryEnqSecao2.Next;
      end;
    end;

    dtmConsPart.qryEnqSecao2.First;
  end (* Fim PgEnquadramento - 37 *)
// André Tavares - 15211 - 20/10/2003 - Início ---------------------------------
  else
  if NBKelegpart.ActivePage = 'pgDadosParaEnquadramento' then (* pgDadosParaEnquadramento - 38 *)
  begin
    sidplanoprevconspart :=  DblkPlanos.LookupValue;
    dtmConsPart.qrySitFuncional.Close;
    dtmConsPart.qrySitFuncional.paramByName('IDPESSOA').asInteger  := strToInt(sIdpessoaConsPart);
    dtmConsPart.qrySitFuncional.paramByName('IDPESSJUR').asInteger := strToInt(sidpessjurconspart);
    dtmConsPart.qrySitFuncional.Open;

    dbedValorCargo.Text := FormatFloat('#,##0.00', BuscaValorCargo(strToIntDef(dtmConsPart.qrySitFuncional.fieldByName('IDCARGOEXT').asString, -1),
                                                                   strToIntDef(sidpessjurconspart, -1)));

    dtmConsPart.qryFuncAtual.Close;
    dtmConsPart.qryFuncAtual.ParamByName('IDPESSOA').asInteger    := strToInt(sIdpessoaConsPart);
    dtmConsPart.qryFuncAtual.ParamByName('IDPESSJUR').asInteger   := strToInt(sidpessjurconspart);
    dtmConsPart.qryFuncAtual.ParamByName('IDPLANOPREV').asInteger := strToInt(sidplanoprevconspart);
    dtmConsPart.qryFuncAtual.Open;

    dbedValorFunc.Text := FormatFloat('#,##0.00', BuscaValorFUNCAOConsEleg(strToIntDef(dtmConsPart.qryFuncAtual.FieldByName('IdPessJur').asString, -1),
                                                                           strToIntDef(dtmConsPart.qryFuncAtual.FieldByName('IDfuncao').asString, -1),
                                                                           DateToStr(now)));

    dtmConsPart.qryFuncFacult.Close;
    dtmConsPart.qryFuncFacult.ParamByName('IDPESSOA').asInteger  := strToInt(sIdpessoaConsPart);
    dtmConsPart.qryFuncFacult.ParamByName('IDPESSJUR').asInteger := strToInt(sidpessjurconspart);
    dtmConsPart.qryFuncFacult.Open;

    dbedValFuncFac.Text := FormatFloat('#,##0.00', BuscaValorFUNCAOConsEleg(strToIntDef(dtmConsPart.qryFuncFacult.FieldByName('IdPessJur').asString, -1),
                                                                            strToIntDef(dtmConsPart.qryFuncFacult.FieldByName('IDfuncao').asString, -1),
                                                                            DateToStr(now)));

    dtmConsPart.qryAdicCompens.Close;
    dtmConsPart.qryAdicCompens.ParamByName('IDPESSJUR').Value := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qryAdicCompens.ParamByName('IDPESSOA').Value  := StrtoIntDef(sIdpessoaConsPart, -1);
    dtmConsPart.qryAdicCompens.Open;

    edtValorAdicComp.Text := FormatFloat('#,##0.00', BuscaValorFUNCAOConsEleg(strToIntDef(dtmConsPart.qryAdicCompens.FieldByName('IdPessJur').asString, -1),
                                                                              strToIntDef(dtmConsPart.qryAdicCompens.FieldByName('IDfuncao').asString, -1),
                                                                              DateToStr(now)));
 end (* Fim pgDadosParaEnquadramento - 38 *)
// André Tavares - 15211 - 20/10/2003 - Fim ------------------------------------
// André Tavares - 17472 - 25/10/2004 - Início ---------------------------------
 else
 if NBKelegpart.ActivePage = 'PgVidaNaFundacao' then (* PgVidaNaFundacao - 39 *)
 begin
   dtmConsPart1.qryVidaFundacao.Close;
   dtmConsPart1.qryVidaFundDet.Close;
   dtmConsPart1.qryVidaFundacao.paramByName('IDPESSOA').asInteger  := strToInt(sIdTitular);
   dtmConsPart1.qryVidaFundacao.Open;
   dtmConsPart1.qryVidaFundDet.Open;
 end; (* Fim PgVidaNaFundacao - 39 / Fim Geral *)
// André Tavares - 17472 - 25/10/2004 - Fim ------------------------------------

      //Ádler Souza - Sol 127323  Kintana 674396
      if dtmConspart.qrypartgeral.fieldbyname('FLGDIRETOR').AsString = 'Não' then
      begin
        lbNomeacao.visible := false;
        lbExoneracao.visible := false;
        dbeDtNomeacao.visible := false;
        dbeDataExoneracao.visible := false;
      end
      else
      begin
        lbNomeacao.visible := true;
        lbExoneracao.visible := true;
        dbeDtNomeacao.visible := true;
        dbeDataExoneracao.visible := true;
      end;
      //Fim - Ádler Souza - Sol 127323  Kintana 674396

  // Felipe A.dos Santos SOL 208658 Kintana 2018716

  if NBKelegpart.ActivePage = 'PgHistSRB' then
  begin
       sPlanoPrev := DblkPlanos.Value;
       pnlHistSRB.Caption := 'Histórico do Salário Real de Benefício (' + sPlanoPrev + ')';
       bContDetalheSRB01 := True;
       bContDetalheSRB02 := True;

       if sPlanoPrev = 'REG/REPLAN' then
       begin
          pnlHistSRB.Width := 840;
          dbgrdHistSRB02.Visible := True;

          dtmConsPart.qryHistSRBregreplan.Close;
          dtmConsPart.qryHistSRBregreplan.ParamByName('IDPESSOA').AsString := sidpessoaconspart;
          dtmConsPart.qryHistSRBregreplan.ParamByName('IDPESSJUR').AsString := sidpessjurconspart;
          dtmConsPart.qryHistSRBregreplan.ParamByName('IDPLANOPREV').AsString := sidplanoprevconspart;
          dtmConsPart.qryHistSRBregreplan.Open;

          dtmConsPart.qryHistSRBGrid01.DisableControls; // Felipe A. Santos SOL 208658/15297  KTN 2050337
          dtmConsPart.qryHistSRBGrid01.Close;
          dtmConsPart.qryHistSRBGrid01.Open;

          if not(dtmConsPart.qryHistSRBGrid01.IsEmpty) then
             dtmConsPart.qryHistSRBGrid01.Delete;

          dtmConsPart.qryHistSRBGrid02.DisableControls; // Felipe A. Santos SOL 208658/15297  KTN 2050337
          dtmConsPart.qryHistSRBGrid02.Close;
          dtmConsPart.qryHistSRBGrid02.Open;

          if not(dtmConsPart.qryHistSRBGrid02.IsEmpty) then
             dtmConsPart.qryHistSRBGrid02.Delete;

          // Salário Real de Benefício - Tempo de Contribuição

          dtmConsPart.qryHistSRBregreplan.Filtered := False;
          dtmConsPart.qryHistSRBregreplan.Filter := 'TIPOBENEF = 3';
          dtmConsPart.qryHistSRBregreplan.Filtered := True;

          if not(dtmConsPart.qryHistSRBregreplan.IsEmpty) then
          begin
             dtmConsPart.qryHistSRBregreplan.First;
             while not(dtmConsPart.qryHistSRBregreplan.Eof) do
             begin
               with dtmConsPart do
               begin
                  qryHistSRBGrid01.Append;
                  qryHistSRBGrid01.FieldByName('SRB').AsString := qryHistSRBregreplan.FieldByName('SRB').AsString;
                  qryHistSRBGrid01.FieldByName('MESREFER').AsString := qryHistSRBregreplan.FieldByName('MESREFER').AsString;
                  qryHistSRBGrid01.FieldByName('TIPO').AsString := qryHistSRBregreplan.FieldByName('TIPO').AsString;
                  qryHistSRBregreplan.Next;
               end;
             end;
          end;

          // Salário Real de Benefício - Invalidez/Pensão de Ativo

          dtmConsPart.qryHistSRBregreplan.Filtered := False;
          dtmConsPart.qryHistSRBregreplan.Filter := 'TIPOBENEF = 2';
          dtmConsPart.qryHistSRBregreplan.Filtered := True;


          if not(dtmConsPart.qryHistSRBregreplan.IsEmpty) then
          begin
             dtmConsPart.qryHistSRBregreplan.First;
             while not(dtmConsPart.qryHistSRBregreplan.Eof) do
             begin
               with dtmConsPart do
               begin
                  qryHistSRBGrid02.Append;
                  qryHistSRBGrid02.FieldByName('SRB').AsString := qryHistSRBregreplan.FieldByName('SRB').AsString;
                  qryHistSRBGrid02.FieldByName('MESREFER').AsString := qryHistSRBregreplan.FieldByName('MESREFER').AsString;
                  qryHistSRBGrid02.FieldByName('TIPO').AsString := qryHistSRBregreplan.FieldByName('TIPO').AsString;
                  qryHistSRBregreplan.Next;
               end;
             end;
          end;

          dtmConsPart.qryHistSRBGrid01.Filtered := False;
          dtmConsPart.qryHistSRBGrid01.Filter := 'TIPO = ' + QuotedStr('T');
          dtmConsPart.qryHistSRBGrid01.Filtered := True;

          dtmConsPart.qryHistSRBGrid02.Filtered := False;
          dtmConsPart.qryHistSRBGrid02.Filter := 'TIPO = ' + QuotedStr('T');
          dtmConsPart.qryHistSRBGrid02.Filtered := True;

          dbgrdHistSRB01.Selected.Clear;
          dbgrdHistSRB01.Selected.Add('SRB'#9'57'#9'Salário Real de Benefício - Tempo de Contribuição');
          dbgrdHistSRB01.ApplySelected;

          dbgrdHistSRB02.Selected.Clear;
          dbgrdHistSRB02.Selected.Add('SRB'#9'57'#9'Salário Real de Benefício - Invalidez/Pensão de Ativo');
          dbgrdHistSRB02.ApplySelected;

          dtmConsPart.qryHistSRBGrid01.EnableControls; // Felipe A. Santos SOL 208658/15297  KTN 2050337
          dtmConsPart.qryHistSRBGrid02.EnableControls; // Felipe A. Santos SOL 208658/15297  KTN 2050337

          dtmConsPart.qryHistSRBregreplan.Close; // Felipe A. Santos SOL 208658/15297  KTN 2050337
       end
       else if sPlanoPrev = 'REB' then
       begin
          dbgrdHistSRB02.Visible := False;
          pnlHistSRB.Width := 420;

          dtmConsPart.qryHistSRBreb.Close;
          dtmConsPart.qryHistSRBreb.ParamByName('IDPESSOA').AsString := sidpessoaconspart;
          dtmConsPart.qryHistSRBreb.ParamByName('IDPESSJUR').AsString := sidpessjurconspart;
          dtmConsPart.qryHistSRBreb.ParamByName('IDPLANOPREV').AsString := sidplanoprevconspart;
          dtmConsPart.qryHistSRBreb.Open;

          if not(dtmConsPart.qryHistSRBreb.IsEmpty) then
          begin
            dtmConsPart.qryHistSRBGrid01.DisableControls; // Felipe A. Santos SOL 208658/15297  KTN 2050337
            dtmConsPart.qryHistSRBGrid01.Close;
            dtmConsPart.qryHistSRBGrid01.Open;

            if not(dtmConsPart.qryHistSRBGrid01.IsEmpty) then
               dtmConsPart.qryHistSRBGrid01.Delete;

            dtmConsPart.qryHistSRBreb.First;
            while not(dtmConsPart.qryHistSRBreb.Eof) do
            begin
              with dtmConsPart do
              begin
                  qryHistSRBGrid01.Append;
                  qryHistSRBGrid01.FieldByName('SRB').AsString := qryHistSRBreb.FieldByName('SRB').AsString;
                  qryHistSRBGrid01.FieldByName('MESREFER').AsString := qryHistSRBreb.FieldByName('MESREFER').AsString;
                  qryHistSRBGrid01.FieldByName('TIPO').AsString := qryHistSRBreb.FieldByName('TIPO').AsString;
                  qryHistSRBGrid01.Post;
                  qryHistSRBreb.Next;
              end;
            end;
          end;

          if dtmConsPart.qryHistSRBGrid01.RecordCount = 1 then
             dtmConsPart.qryHistSRBGrid01.Delete;

          dtmConsPart.qryHistSRBGrid01.Filtered := False;
          dtmConsPart.qryHistSRBGrid01.Filter := 'TIPO = '  + QuotedStr('A') + ' OR TIPO = ' + QuotedStr('T');
          dtmConsPart.qryHistSRBGrid01.Filtered := True;

          dbgrdHistSRB01.Selected.Clear;
          dbgrdHistSRB01.Selected.Add('SRB'#9'57'#9'Salário Real de Benefício - Invalidez/Pensão de Ativo');
          dbgrdHistSRB01.ApplySelected;

          dtmConsPart.qryHistSRBGrid01.EnableControls; // Felipe A. Santos SOL 208658/15297  KTN 2050337
          dtmConsPart.qryHistSRBreb.Close; // Felipe A. Santos SOL 208658/15297  KTN 2050337
       end
       else if sPlanoPrev = 'NOVO PLANO' then
       begin
          dbgrdHistSRB02.Visible := False;
          pnlHistSRB.Width := 420;

          dtmConsPart.qryHistSRBnovoplano.Close;
          dtmConsPart.qryHistSRBnovoplano.ParamByName('IDPESSOA').AsString := sidpessoaconspart;
          dtmConsPart.qryHistSRBnovoplano.ParamByName('IDPESSJUR').AsString := sidpessjurconspart;
          dtmConsPart.qryHistSRBnovoplano.ParamByName('IDPLANOPREV').AsString := sidplanoprevconspart;
          dtmConsPart.qryHistSRBnovoplano.Open;

          if not(dtmConsPart.qryHistSRBnovoplano.IsEmpty) then
          begin
            dtmConsPart.qryHistSRBGrid01.DisableControls; // Felipe A. Santos SOL 208658/15297  KTN 2050337
            dtmConsPart.qryHistSRBGrid01.Close;
            dtmConsPart.qryHistSRBGrid01.Open;

            if not(dtmConsPart.qryHistSRBGrid01.IsEmpty) then
               dtmConsPart.qryHistSRBGrid01.Delete;

            dtmConsPart.qryHistSRBnovoplano.First;
            while not(dtmConsPart.qryHistSRBnovoplano.Eof) do
            begin
              with dtmConsPart do
              begin
                  qryHistSRBGrid01.Append;
                  qryHistSRBGrid01.FieldByName('SRB').AsString := qryHistSRBnovoplano.FieldByName('SRB').AsString;
                  qryHistSRBGrid01.FieldByName('MESREFER').AsString := qryHistSRBnovoplano.FieldByName('MESREFER').AsString;
                  qryHistSRBGrid01.FieldByName('TIPO').AsString := qryHistSRBnovoplano.FieldByName('TIPO').AsString;
                  qryHistSRBGrid01.Post;
                  qryHistSRBnovoplano.Next;
              end;
            end;
          end;

          if dtmConsPart.qryHistSRBGrid01.RecordCount = 1 then
             dtmConsPart.qryHistSRBGrid01.Delete;
           
          dtmConsPart.qryHistSRBGrid01.Filtered := False;
          dtmConsPart.qryHistSRBGrid01.Filter := 'TIPO = '  + QuotedStr('A') + ' OR TIPO = ' + QuotedStr('T');
          dtmConsPart.qryHistSRBGrid01.Filtered := True;

          dbgrdHistSRB01.Selected.Clear;
          dbgrdHistSRB01.Selected.Add('SRB'#9'57'#9'Salário Real de Benefício - Invalidez/Pensão de Ativo');
          dbgrdHistSRB01.ApplySelected;

          dtmConsPart.qryHistSRBGrid01.EnableControls; // Felipe A. Santos SOL 208658/15297  KTN 2050337

          dtmConsPart.qryHistSRBnovoplano.Close; // Felipe A. Santos SOL 208658/15297  KTN 2050337
       end;
  end;
  // Felipe A.dos Santos SOL 208658 Kintana 2018716 - fim
  // Andre Imakawa - SIG 25332 - Inicio
  if NBKelegpart.ActivePage = 'PgPortabEntrada' then
  begin
    dtmConsPart.qryPortabEntrada.ParamByName('IDPESSOA').asFloat     := StrToIntDef(sIdTitular, -1);
    dtmConsPart.qryPortabEntrada.ParamByName('IDPESSJUR').asFloat    := StrToIntDef(dblkPatro.LookupValue, -1);
    dtmConsPart.qryPortabEntrada.ParamByName('IDPLANOPREV').asFloat  := StrToIntDef(DblkPlanos.LookupValue, -1);
    // Fim.

    if not dtmConsPart.qryPortabEntrada.Prepared then dtmConsPart.qryPortabEntrada.Prepare;
    if not dtmConsPart.qryPortabEntrada.Active   then dtmConsPart.qryPortabEntrada.Open;
	
end;

if NBKelegpart.ActivePage = 'PgPortabSaida' then
  begin
    dtmConsPart.qryPortabSaida.ParamByName('IDPESSOA').asFloat     := StrToIntDef(sIdTitular, -1);
    dtmConsPart.qryPortabSaida.ParamByName('IDPESSJUR').asFloat    := StrToIntDef(dblkPatro.LookupValue, -1);
    dtmConsPart.qryPortabSaida.ParamByName('IDPLANOPREV').asFloat  := StrToIntDef(DblkPlanos.LookupValue, -1);
    // Fim.

    if not dtmConsPart.qryPortabSaida.Prepared then dtmConsPart.qryPortabSaida.Prepare;
    if not dtmConsPart.qryPortabSaida.Active   then dtmConsPart.qryPortabSaida.Open;

  end;
  // Andre Imakawa - SIG 25332 - Fim
end;

procedure TFRMconspart.CloseDatasets;
var
   i : integer;
begin
   // Fecha todos as queries abertas
   with dtmConspart  do
   begin
      for i := 0 to (ComponentCount - 1) do
      begin
         if (Components[i] is TwwQuery) and
            ((Components[i] as TwwQuery).Active) then
         begin
            (Components[i] as TwwQuery).Close;
            (Components[i] as TwwQuery).Filter   := '';
            (Components[i] as TwwQuery).Filtered := False;
         end;

         if (Components[i] is TQuery) and
            ((Components[i] as TQuery).Active) then
         begin
            (Components[i] as TQuery).Close;
            (Components[i] as TQuery).Filter   := '';
            (Components[i] as TQuery).Filtered := False;
         end;

         if (Components[i] is TCmClientDataSet) and
            ((Components[i] as TCmClientDataSet).Active) then
         begin
            (Components[i] as TCmClientDataSet).Close;
            (Components[i] as TCmClientDataSet).Filter   := '';
            (Components[i] as TCmClientDataSet).Filtered := False;
         end;

         if (Components[i] is TClientDataSet) and
            ((Components[i] as TClientDataSet).Active) then
         begin
            (Components[i] as TClientDataSet).Close;
            (Components[i] as TClientDataSet).Filter   := '';
            (Components[i] as TClientDataSet).Filtered := False;
         end;
      end;
   end;

   // Fecha todos as queries abertas do outro datamodule
   with dtmConspart1  do
   begin
      for i := 0 to (ComponentCount - 1) do
      begin
         if (Components[i] is TwwQuery) and
            ((Components[i] as TwwQuery).Active)
            // André Pontes - 16/05/2005 - 18686
            and ((Components[i] as TwwQuery).Name <> 'qryRes')
            then
         begin
            (Components[i] as TwwQuery).Close;
            (Components[i] as TwwQuery).Filter   := '';
            (Components[i] as TwwQuery).Filtered := False;
         end;

         if (Components[i] is TQuery) and
            ((Components[i] as TQuery).Active)
            // André Pontes - 16/05/2005 - 18686
            and ((Components[i] as TQuery).Name <> 'qryRes')
            then
         begin
            (Components[i] as TQuery).Close;
            (Components[i] as TQuery).Filter   := '';
            (Components[i] as TQuery).Filtered := False;
         end;

         if (Components[i] is TCmClientDataSet) and
            ((Components[i] as TCmClientDataSet).Active)
            // André Pontes - 16/05/2005 - 18686
            and ((Components[i] as TCmClientDataSet).Name = 'dts')
            then
         begin
            (Components[i] as TCmClientDataSet).Close;
            (Components[i] as TCmClientDataSet).Filter   := '';
            (Components[i] as TCmClientDataSet).Filtered := False;
         end;

         if (Components[i] is TClientDataSet) and
            ((Components[i] as TClientDataSet).Active)
            // André Pontes - 16/05/2005 - 18686
            and ((Components[i] as TClientDataSet).Name = 'dts')
            then
         begin
            (Components[i] as TClientDataSet).Close;
            (Components[i] as TClientDataSet).Filter   := '';
            (Components[i] as TClientDataSet).Filtered := False;
         end;
      end;
   end;
end;



procedure TfrmConsPart.dblkRecebedorChange(Sender: TObject);
begin
  dtmConsPart1.qryHstVersoes.Close;
  dtmConsPart1.qryHstVersoes.ParamByName('IDTITULAR').AsInteger       := StrtoIntDef(sidpessoaconspart, -1);
  dtmConsPart1.qryHstVersoes.ParamByName('IDHSTFOLHABENEF').AsInteger := dtmConsPart1.qryVersoes.FieldByName('IDHSTFOLHABENEF').AsInteger;
  dtmConsPart1.qryHstVersoes.ParamByName('IDRESPONSAVEL').AsInteger   := dtmConsPart.qryRecebedor.FieldByName('IDRESPONSAVEL').AsInteger;
  dtmConsPart1.qryHstVersoes.Open;
end;



procedure TFRMconspart.Enderecos_1Click(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgEnderecos';
end;



procedure TFRMconspart.PrevidenciarioClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgEventosPrevidenciarios';
end;



procedure TFRMconspart.AssistencialClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgEventosAssistenciais';
end;



procedure TFRMconspart.HistoricoFuncionalClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgHistoricoFuncional';
end;



procedure TFRMconspart.DadosBasicosClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgDadosBasicos';
end;



procedure TFRMconspart.TelefonesClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgTelefones';
end;



procedure TFRMconspart.ContasBancriasClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgContasBancarias';
end;



procedure TFRMconspart.DependentesClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgDependentes';
   PreparaCamposScrollBox;//Darivaldo Alencar SIG 21868
end;



procedure TFRMconspart.EmprestimoClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgEmprestimos';
end;



procedure TFRMconspart.ProtocolosClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgProtocolos';
end;



procedure TFRMconspart.ProcessosRadClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgProcessosRAD';
end;



procedure TFRMconspart.Saldo1Click(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgContribuicoesReservaSaldo';
end;



procedure TFRMconspart.RubricasIndividuaisClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgBeneficiosPagamentosRubricasIndividuais';
end;



procedure TFRMconspart.ContraChequeClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgBeneficiosPagamentosContraCheque';
end;



procedure TFRMconspart.Previdencirios1Click(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgBeneficiariosPrevidenciarios';
end;



procedure TFRMconspart.Assistenciais1Click(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgBeneficiariosAssistenciais';
end;



procedure TFRMconspart.Histrico1Click(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgContribuicoesHistorico';
end;



procedure TFRMconspart.Previdencirias1Click(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgContribuicoesHistoricoPrevidenciario';
end;



procedure TFRMconspart.Assistenciais2Click(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgContribuicoesHistoricoAssistencial';
end;



procedure TFRMconspart.ContatosClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgContatos';
end;



procedure TFRMconspart.HistoricoClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgBeneficiosHistorico';
end;



procedure TFRMconspart.RUBClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgRUB';
end;



procedure TFRMconspart.RubricasSalariaisClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgRubricasSalariais';
end;



procedure TFRMconspart.EvolucaoFuncionalClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgEvolucaoFuncional';
end;



procedure TFRMconspart.ProcessosClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgBeneficiosProcessos';
end;



procedure TFRMconspart.SituaoAtualClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgBeneficiosSituacaoAtual';
end;



procedure TFRMconspart.HistricodeAlimentao1Click(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgContribuicoesReservaHistoricoAlimentacao';
end;



procedure TFRMconspart.SituaoAtual1Click(Sender: TObject);
begin
   AjustaPainelSitAtualTitular;    //edilaine - SIG42986

   NBKelegpart.ActivePage := 'PgContribuicoesSituacaoAtual';
end;



{ seta os Flags de classificação da pessoa }
procedure TFRMconspart.ClassificaPessoa;
var
   sClassifica : string;
begin
   SClassifica := '';
   fElegivel                     := True;
   fParticipante_Assistido       := False;
   fParticipante_Falecido        := False;
   fRecebedor_Beneficio          := False;
   fDependente                   := False;
   fParticipante_Ativo           := False;
   fParticipante_Cancelado       := False;
   fBeneficiario                 := False;
   fRecebedor_Pensao_Alimenticia := False;
   fAlimentado                   := False;
   fTitular                      := False;

//  verificar se essa pessoa tem um titular
// A verificação de titularidade abaixo serve para habilitar o btão de acesso aos dados do titular
// verifica se a pessoa é Titular

   dtmConsPart.qryClassifica.Close;
   dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDPESSOA, IDTITULAR FROM DEPENTIT WHERE IDPESSOA  = '+sidpessoaconspart +
                                         ' AND IDTITULAR = '+ sIdTitular;
   dtmConsPart.qryClassifica.Open;

   if (not dtmConsPart.qryClassifica.isEmpty) then
   begin
     fTitular := (dtmConsPart.qryClassifica.fieldByName('IDPESSOA').asInteger =
                  dtmConsPart.qryClassifica.fieldByName('IDTITULAR').asInteger);

   end
   else
     fTitular := trim(sIdTitular) = trim(sIdpessoaConsPart);

// andre tavares 25/09/2003 - coloquei este if
   if (not bAcessaDependente) then
   begin
     if fTitular then
       sidpessoaconspart := sIdTitular
     else
       sidpessoaconspart := FConsPessoaGeral.cIdpessoa;
   end;

   if dtmConsPart.qryClassifica.isEmpty then
   begin
     dtmConsPart.qryClassifica.Close;
     dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDTITULAR, IDRESPONSAVEL FROM BFCIARIOTITPLAN WHERE IDRESPONSAVEL = '+sidpessoaconspart;
     dtmConsPart.qryClassifica.Open;
     fTitular := (not dtmConsPart.qryClassifica.isEmpty) and
                 (dtmConsPart.qryClassifica.fieldByName('IDRESPONSAVEL').asInteger =
                  dtmConsPart.qryClassifica.fieldByName('IDTITULAR').asInteger);
     sIdTitular := dtmConsPart.qryClassifica.fieldByName('IDTITULAR').asString;
   end;
   if dtmConsPart.qryClassifica.isEmpty then
   begin
     dtmConsPart.qryClassifica.Close;
     dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDFAVORECIDO, IDTITULAR FROM RUBRICAINDIV WHERE FLGPENSAOALIM = 1 AND IDFAVORECIDO = '+sidpessoaconspart;
     dtmConsPart.qryClassifica.Open;
     fTitular := (not dtmConsPart.qryClassifica.isEmpty) and
                 (dtmConsPart.qryClassifica.fieldByName('IDFAVORECIDO').asInteger =
                  dtmConsPart.qryClassifica.fieldByName('IDTITULAR').asInteger);
     sIdTitular := dtmConsPart.qryClassifica.fieldByName('IDTITULAR').asString;
   end;
//18/09/2003 - André Tavares - pendência - 15055 -

  // SE É FALECIDO - pessoaFisica -> DataMorte
  dtmConsPart.qryClassifica.Close;
  dtmConsPart.qryClassifica.Sql.Text := ' SELECT DATAMORTE FROM PESSOAFISICA WHERE IDPESSOA = '+sidpessoaconspart;
  dtmConsPart.qryClassifica.Open;
  if (dtmConsPart.qryClassifica.IsEmpty = False) and
     (dtmConsPart.qryClassifica.FieldByName('DATAMORTE').asString <> '') then
  begin
    fParticipante_Falecido := True;
    SClassifica := SClassifica + 'Falecido ';
    fElegivel := False;
    edClassific.text := SClassifica;
    exit;
  end;

  dtmConsPart.qryClassifica.Close;
  dtmConsPart.qryClassifica.Sql.Text := ' SELECT SP.FLGINTERNO, PPP.FLGDESATIVADO FROM PARTPREVPLAN PPP, SITPART SP '+
                                        ' WHERE PPP.IDSITPART = SP.IDSITPART(+) AND (NVL(PPP.FLGDESATIVADO, 0) = 0) AND PPP.IDPESSOA = '+sidpessoaconspart;
  dtmConsPart.qryClassifica.Open;
  if dtmConsPart.qryClassifica.IsEmpty then
  begin
    dtmConsPart.qryClassifica.Close;
    dtmConsPart.qryClassifica.Sql.Text := ' SELECT SP.FLGINTERNO, NVL(PPP.FLGDESATIVADO, 0) AS FLGDESATIVADO FROM PARTPREVPLAN PPP, SITPART SP '+
                                          ' WHERE PPP.IDSITPART = SP.IDSITPART(+) AND (PPP.FLGDESATIVADO = 1) AND PPP.IDPESSOA = '+sidpessoaconspart;
    dtmConsPart.qryClassifica.Open;
  end;

// SITUAÇÕES DO PARETICIPANTE  - sitpart - FlgInterno
  // ativo
  if (dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'AT') or
     ((dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'MS') and
      (dtmConsPart.qryClassifica.FieldByName('FLGDESATIVADO').asInteger = 0))then
  begin
    fParticipante_Ativo := True;
    SClassifica := SClassifica + 'Participante Ativo ';
    fElegivel := False;
  end
  // assistido
  else if (dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'AS') then
  begin
    fParticipante_Assistido := True;
    SClassifica := SClassifica + 'Participante Assistido ';
    fElegivel := False;

    if fParticipante_Assistido then dtmConsPart.qryClassifica.Open;
  end

  // ativo em autopatrocínio total
  else if dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'MA' then
  begin
    fParticipante_Assistido := True;
    SClassifica := SClassifica + 'Participante Ativo em Autopatrocínio Total ';
    fElegivel := False;
  end
  // ativo em autopatrocínio parcial
  else if dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'MP' then
  begin
    fParticipante_Assistido := True;
    SClassifica := SClassifica + 'Participante Ativo em Autopatrocínio Parcial ';
    fElegivel := False;
  end
  // cancelado
  // tavares 16/01/2003
  else if (dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'CA') or
          ((dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'MS') and
           (dtmConsPart.qryClassifica.FieldByName('FLGDESATIVADO').asInteger = 1)) then
  begin
    fParticipante_Cancelado := True;
    SClassifica := SClassifica + 'Participante Cancelado ';
    fElegivel := False;
  end;

  // verifica se é elegível
  if  fElegivel Then Begin
      if not dtmConsPart.qryElegivel.Prepared then dtmConsPart.qryElegivel.Prepare;
      dtmConsPart.qryElegivel.ParamByName('IDPESSOA').asFloat := StrtoIntDef(sidpessoaconspart, -1);
      if not dtmConsPart.qryElegivel.Active then dtmConsPart.qryElegivel.Open;
      fElegivel := not dtmConsPart.qryElegivel.IsEmpty;

      if fElegivel then
        SClassifica := SClassifica + 'Elegível ';
  end;

  // verificar se é Beneficiário ou seja
  // tem um benefício na bfciariotitplan com idpessoa e o idtitular <>
    // se não foi ainda classificado anteriormente o label não deve ter o traço (-)
    // foi classificado, colocar o traço antes do label

  if trim(sIdTitular) = '' then
    sIdTitular := FConsPessoaGeral.cIdTitular;
  dtmConsPart.qryClassifica.Close;
  dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDPESSOA, IDTITULAR FROM BFCIARIOTITPLAN WHERE IDPESSOA = '+ sidpessoaconspart +
  ' AND IDTITULAR = '+ sIdTitular ;
  dtmConsPart.qryClassifica.Open;
  fBeneficiario := (dtmConsPart.qryClassifica.IsEmpty = False) and (dtmConsPart.qryClassifica.FieldByName('IDPESSOA').asString <> dtmConsPart.qryClassifica.FieldByName('IDTITULAR').asString);
  if fBeneficiario then
    SClassifica := SClassifica + ' - Beneficiário ';


  //VERIFICAR SE É DEPENDENTE   Depentit -> IDDEPENDENCIA
  // verificar se é Beneficiário ou seja
  // tem um benefício na bfciariotitplan com idpessoa e o idtitular <>
    // se não foi ainda classificado anteriormente o label não deve ter o traço (-)
    // foi classificado, colocar o traço antes do label

  dtmConsPart.qryClassifica.Close;
  dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDPESSOA, IDTITULAR FROM DEPENTIT WHERE IDPESSOA = '+sidpessoaconspart +
                                        ' AND IDTITULAR = ' + sidTitular;
  dtmConsPart.qryClassifica.Open;
  fDependente :=  (dtmConsPart.qryClassifica.IsEmpty = False) and
                  (dtmConsPart.qryClassifica.FieldByName('IDPESSOA').asString <> dtmConsPart.qryClassifica.FieldByName('IDTITULAR').asString);

  if fDependente then
    SClassifica := SClassifica + ' - Dependente ';

  // verificar se é recebedor de benefício
   dtmConsPart.qryClassifica.Close;
   //Everson TIBERO - Início
{   dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDPESSOA, IDRESPONSAVEL, ' +
   'NVL(DESCRICAO,''PRP'')AS DESCRECEB FROM BFCIARIOTITPLAN BF, TIPORECEBEDOR TP ' +}

   dtmConsPart.qryClassifica.Sql.Text := ' SELECT BF.IDPESSOA, BF.IDRESPONSAVEL, ' +
   'NVL(TP.DESCRICAO,''PRP'')AS DESCRECEB FROM BFCIARIOTITPLAN BF, TIPORECEBEDOR TP ' +
   //Everson TIBERO - Fim

   'WHERE BF.IDRESPONSAVEL = '+sidpessoaconspart +
   ' AND  BF.CODTIPORECEBEDOR = TP.CODTIPORECEBEDOR(+)';
   dtmConsPart.qryClassifica.Open;
//FDias - 12.12.2003 - ver se é Tutor / Curador

   fRecebedor_Beneficio := not dtmConsPart.qryClassifica.IsEmpty;

   if fRecebedor_Beneficio then Begin
     SClassifica := SClassifica + ' - Recebedor de Benefício ';
     if dtmConsPart.qryClassifica.FieldByName('DESCRECEB').AsString <> 'PRP' Then
        SClassifica := SClassifica + ' ('+ dtmConsPart.qryClassifica.FieldByName('DESCRECEB').AsString + ')';
   end;

  if not dtmConsPart.qryRubricaIndiv.Prepared then dtmConsPart.qryRubricaIndiv.Prepare;
  dtmConsPart.qryRubricaIndiv.ParamByName('IDPESSOA').asFloat := StrtoIntDef(sidpessoaconspart, -1);
  if not dtmConsPart.qryRubricaIndiv.Active then dtmConsPart.qryRubricaIndiv.Open;

  //verificar se é recebedor de pensão alimentícia
  fRecebedor_Pensao_Alimenticia := (dtmConsPart.qryRubricaIndivIDFAVORECIDO.asInteger = strToIntDef(sidpessoaconspart, -1)) and
                                   (dtmConsPart.qryRubricaIndivFLGPENSAOALIM.asInteger = 1);
   if fRecebedor_Pensao_Alimenticia then
     SClassifica := SClassifica + ' - Recebedor de Pensão Alimentícia ';





  //verificar se é Alimentado
  fAlimentado := (dtmConsPart.qryRubricaIndivIDALIMENTADO.asInteger = strToIntDef(sidpessoaconspart, -1)) and
                 (dtmConsPart.qryRubricaIndivFLGPENSAOALIM.asInteger = 1);

   if fAlimentado then
     SClassifica := SClassifica + ' - Alimentado';

   if (fElegivel = False)                    and
      (fParticipante_Assistido = False)      and
      (fParticipante_Falecido = False)       and
      (fRecebedor_Beneficio = False)         and
      (fDependente = False)                  and
      (fParticipante_Ativo = False)          and
      (fParticipante_Cancelado = False)      and
      (fBeneficiario = False)                and
      (fRecebedor_Pensao_Alimenticia = False)and
      (fAlimentado = False)                  then
      SClassifica := SClassifica + 'Não Elegível - Não Dependente';
   if SClassifica[2] = '-' then
     SClassifica := copy (SClassifica, 4, length(SClassifica));

   edClassific.text := SClassifica;

// inicio - 18/09/2003 - André Tavares - pendência - 15055 -
  if (fTitular) then
  begin
    sIdPessoaConspart := sIdTitular;
  end;

  sbtnTitular.Visible := sIdTitular <> sIdPessoaConspart;

// fim - 18/09/2003 - André Tavares - pendência - 15055 -
end;



{ habilita os itens de Menu Pertinentes 'a classificação da Pessoa }
procedure TFRMconspart.HabilitaMenuItens;
begin
  ClassificaPessoa;
//--- Agenda Pessoal
  sbtnTitular.Visible := sIdTitular <> sIdPessoaConspart;

{ andre tavares - deve habilitar para qualquer pessoa ***}
  DadosPessoais.Enabled    := not dtmConsPart.dsPartGeral.Dataset.isEmpty;
  Documentos.Enabled       := not dtmConsPart.dsPartGeral.Dataset.isEmpty;
  Enderecos.Enabled        := not dtmConsPart.dsPartGeral.Dataset.isEmpty;
  Telefones.Enabled        := not dtmConsPart.dsPartGeral.Dataset.isEmpty;
  Contatos.Enabled         := not dtmConsPart.dsPartGeral.Dataset.isEmpty;
  ContasBancrias.Enabled   := not dtmConsPart.dsPartGeral.Dataset.isEmpty;
  Dependentes.Enabled      := not dtmConsPart.dsPartGeral.Dataset.isEmpty;
  OutrasInformaes1.Enabled := not dtmConsPart.dsPartGeral.Dataset.isEmpty;

  //--- Vida Funcional

  DadosBasicos.Enabled    := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fDependente or fRecebedor_Beneficio;

  EvolucaoFuncional.Enabled := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario;

  HistoricoFuncional.Enabled := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido;

  //RubricasSalariais.Enabled := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
  //                           fParticipante_Falecido;

  //--- Vida no Plano

  Eventos.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio;

  Protocolos.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio;

  ProcessosRad.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio;

  RUB.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio;

  Contribuicoes.Enabled :=  fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fRecebedor_Beneficio;

  // incluí participante ativo porque possibilita a visualização do benefício caso o participante tenha estado em benefício
  Beneficios.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado
                     or fParticipante_Falecido or fBeneficiario or fRecebedor_Beneficio;

  Processos.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario or fRecebedor_Beneficio;

  DoBeneficirio1.Enabled := fDependente or fBeneficiario or fRecebedor_Beneficio;

//  Beneficirio1.Enabled := fDependente or fBeneficiario or fRecebedor_Beneficio;

  Pagamentos.Enabled := True;
  Contracheque.Enabled := True;

  RubricasIndividuais.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario or
                            fRecebedor_Beneficio or fRecebedor_Pensao_Alimenticia or fAlimentado or fRecebedor_Beneficio;
//159619-jrm6
  Beneficiarios.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fRecebedor_Beneficio;

  Enquadramento.Enabled :=  fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario or fRecebedor_Beneficio;

  Emprestimo.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario or fRecebedor_Beneficio;

  //--- Vida na Fundação

  VidaNaFundao1.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                           fParticipante_Falecido or fBeneficiario or
                           fRecebedor_Beneficio or fRecebedor_Pensao_Alimenticia or fAlimentado or fRecebedor_Beneficio;

  // Atenção!! este método tem que ser chamado aqui para que sejam habilitadas as
  //permissões pertinentes ao usuário
  Autorizacao.AutorizarForm(self, afNormal);

end;


procedure TFRMconspart.FormCreate(Sender: TObject);
var Resultado : Integer;
    qry       : tWWquery;
begin
  bFuncef          := False; // FDias - 12.12.2003
  sIdTitular       := '';
  CtrlTempoServico := TCtrlTempoServico.Create;
  CtrlTempoServico.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro);
// FDias - 12.12.2003 - início
  qry              := twwquery.Create(nil);
  qry.DataBaseName := 'BaseDados';

  try
    qry.SQL.Add('SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
    qry.Open;

    // COMPARA O CNPJ DA FUNDAÇÃO COM O CNPJ DA FUNCEF
    if qry.fieldbyname('NUMDOCUMENTO').asstring = '00436923000190' then Begin
      //Darivaldo Alencar SIG37689 -início
      //pnlHstFuncional.Caption    := 'Histórico de Tempo de Serviço';
      pnlHstFuncional.Caption        := 'Tempo de Serviço à Previdência Social';
      dbgridhistfunc.visible         := false;
      Label59.visible                := false;
      Label60.visible                := false;
      edtTEMPOSEMCONVERSAO.visible   := false;
      edtTEMPOSEMCONVERSAOEXT.visible:= false;
      edtTEMPOSERVCALC.visible       := false;
      edtTEMPOTOTALEXT.visible       := false;
      //Darivaldo Alencar SIG37689 -fim
      HistoricoFuncional.Caption := '&Histórico de Tempo de Serviço';
      bFuncef := True;
    end;
  finally
    qry.free;
  end;
// FDias - 12.12.2003 - fim
  CreatefrmFrameConsultaHistorico;

  //Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484
  dtmConsPart.OnQrySituacaoAtualBenefAfterScroll := OnQrySituacaoAtualBenefAfterScroll;
  dtmConsPart1.OnQryBeneficiosAntesAfterScroll   := OnQryBeneficiosAntesAfterScroll;
  dtmConsPart1.OnQryBeneficiosAfterScroll        := OnQryBeneficiosAfterScroll;
  //Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484
end;



procedure TFRMconspart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sIDPessoaConsPart := '';

  DestroyfrmFrameConsultaHistorico;
  CloseDataSets;

  dtmConsPart.Free;
  dtmConsPart := nil;

  dtmConsPart1.Free;
  dtmConsPart1 := nil;

  FRMconspart.Release;
  FRMconspart := nil;

  CtrlTempoServico.Free;

  bConsPessoaGeral := False;
  Action := caFree;

  //Inicio - Helio - SOL Nº 253577/17604 PPM Nº 999484
  FreeAndNil(LstGridbeneficios);
  FreeAndNil(LstgridMovBenef);
  //Fim - Helio - SOL Nº 253577/17604 PPM Nº 999484
end;



function TFRMconspart.ExisteForm(frm: string): Boolean;
var
   i: Integer;
begin
   Result := False;

   for i := 0 to Screen.FormCount - 1 do
   begin
      if uppercase(Screen.Forms[i].Name) = uppercase(frm) then
      begin
         Result := True;
         Break;
      end;
   end;
end;


procedure TFRMconspart.sbtnTitularClick(Sender: TObject);
var
   bExibeTitular: Boolean;//Darivaldo Alencar SIG21868
begin
  dtmConsPart1.qryMessagemFiario.Close;
  twMensagem.Hide;
  FRMconspart.Refresh;
  sbtnTitular.Refresh;
  bAcessaDependente := False;
  if bListaTitular then  //Darivaldo Alencar SIG21868
    begin
      frmTitulares := TfrmTitulares.Create(FRMconspart);
  frmTitulares.qryTitulares.Close;
  frmTitulares.qryTitulares.paramByname('IDPESSOA').asInteger := strToIntDef(sidpessoaconspart, -1);
  if not frmTitulares.qryTitulares.Prepared then frmTitulares.qryTitulares.Prepare;
    frmTitulares.qryTitulares.Open;
  frmTitulares.showModal;
    end
  else begin
     if (frmTitulares<> nil) then
         frmTitulares:= nil;
  end;

  //Darivaldo Alencar SIG21868 -inicio
  //if frmTitulares.ModalResult = mrOK then
  if (frmTitulares<> nil) then
      bExibeTitular := (frmTitulares.ModalResult = mrOK)
  else bExibeTitular:= True;

  if (bExibeTitular) then
  begin
    if not bListaTitular then
       sidpessoaconspart := sIdTitular
    else
  //Darivaldo Alencar SIG21868 -fim
    sidpessoaconspart := frmTitulares.qryTitulares.fieldByname('IDTITULAR').asString;
    // INÍCIO - andre tavares - pendencia 16690
    sidtitular := sidpessoaconspart;
    FConsPessoaGeral.cIdTitular := sidtitular;
    FConsPessoaGeral.cIdpessoa  := sidtitular;
    // FIM - andre tavares - pendencia 16690
    fTitular := True;
    closeDatasets;// andre tavares - pendencia 16690

    if nbkElegPart.ActivePage <> 'PgDadosPessoais' then   NBKelegpart.ActivePage := 'PgDadosPessoais';
    NBKelegpartPageChanged(Sender);

    DependentesClick(self);//Darivaldo Alencar SIG21868
  end;
end;

procedure TFRMconspart.DblkPlanosChange(Sender: TObject);
begin
  // Fecha as queries para atualizar os seus resultados com o plano selecionado.
  if dtmConsPart1.qrycontribprev.Active    then dtmConsPart1.qryContribPrev.Close;
  if dtmConsPart.qryBenef.Active           then dtmConsPart.qryBenef.Close;
  if dtmConsPart.qryReserva.Active         then dtmConsPart.qryReserva.Close;
  if dtmConsPart.qryHistReserva.Active     then dtmConsPart.qryHistReserva.Close;
  if dtmConsPart.qryContribSitAtual.Active then dtmConsPart.qryContribSitAtual.Close;

  if qryMatricula.Active then qryMatricula.Close; // Daniel - 26764 (2ª)
  
  // Andre Imakawa - SIG 25332 - Inicio
  if dtmConsPart.qryPortabEntrada.Active then dtmConsPart.qryPortabEntrada.Close;
  if dtmConsPart.qryPortabSaida.Active then dtmConsPart.qryPortabSaida.Close;
  // Andre Imakawa - SIG 25332 - Fim

  NBKelegpartPageChanged(self);  //Jéssica Lana - SOL124593 KTN635549

  sIdPlanoPrevConsPart := dtmConsPart.qryPlanos.FieldByName('IDPLANOPREV').AsString;
  sIdPessJurConsPart   := dtmConsPart.qryPlanos.FieldByName('IDPESSJUR').AsString;
  sIdPlanoPrevConsPart := DblkPlanos.LookupValue;
  sSeqPropostaConsPart := dtmConsPart.qryPlanos.FieldByName('SEQPROPOSTA').AsString;
  sIdRGElegBenef       := dtmConsPart.qryPlanos.FieldByName('IDRGELEGBENEF').AsString;


// André Tavares - 15605 Início ------------------------------------------------
  if (Trim(sIdPessJurConsPart)<>'') and (ContaRegistro(dtmConsPart.dsPartGeral.Dataset)>1) then begin
    // Daniel - 23136
    FConsPessoaGeral.cIdPessJur := DblkPatro.LookUpValue;
    if ( bConsPessoaGeral=False ) then
         dtmConsPart.dspartgeral.Dataset.Filter := ' IDPESSJUR = '+sIdPessJurConsPart
    else dtmConsPart.dspartgeral.Dataset.Filter := ' IDPESSJUR = '+FConsPessoaGeral.cIdPessJur; // Alberto - 22425

    dtmConsPart.dsPartGeral.Dataset.Filtered := True;
  end else begin
    dtmConsPart.dsPartGeral.Dataset.Filter   := '';
    dtmConsPart.dsPartGeral.Dataset.Filtered := False;
  end;
// André Tavares - 15605 - Fim -------------------------------------------------

  if (Trim(sIdPessJurConsPart)<>'') and (ContaRegistro(dtmConsPart.qryValoresBaseDepentit)>1) then begin
    dtmConsPart.qryValoresBaseDepentit.Filter   := ' IDPESSJUR = ' + sIdPessJurConsPart;
    dtmConsPart.qryValoresBaseDepentit.Filtered := True;
  end else begin
    dtmConsPart.qryValoresBaseDepentit.Filter   := '';
    dtmConsPart.qryValoresBaseDepentit.Filtered := False;
  end;

  FiltraHistRubSal(sIdPessJurConsPart);
end;


// esta função foi implementada para contar o número de elegíveis a benefício
function TFRMconspart.ContaElegiveisAbeneficio :integer;
var NumElegiveis : integer;
    sSQL : string;
    bElegivel, bErro : boolean;
begin
  NumElegiveis := 0;
  bElegivel := False;
  dtmConsPart.qryPessoaLigTitular.close;
  dtmConsPart.qryPessoaLigTitular.paramByName('IDPESSOA').asInteger := strToIntDef(sIdPessoaConsPart, -1);
  dtmConsPart.qryPessoaLigTitular.Open;
  bRodandoElegibilidade := True;
  dtmConsPart.qryDepentit.DisableControls;    //edilaine - SIG42986
  dtmConsPart.qryPessoaLigTitular.First;
  while not dtmConsPart.qryPessoaLigTitular.EOF do
  begin
    //sSQL := ' SELECT  PF.DATANASC,  PF.DATAMORTE, PF.SEXO, PF.ESTCIVIL, PP.DTINICIOINSC,  '+ //WO28061 LEANDRO
    sSQL := ' SELECT  TRUNC(PF.DATANASC) AS DATANASC,  PF.DATAMORTE, PF.SEXO, PF.ESTCIVIL, PP.DTINICIOINSC,  '+   //WO28061 LEANDRO
            '         EL.TEMPONAOCREDITADO, EL.DATAADMISSAO, EL.IDSITFUNC,                 '+
            '         EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL, DE.FLGBENEFICIARIO,       '+
            '         EL.TEMPOSERVTOTAL,    EL.DATADEMISSAO, EL.DATADEMISSAO,              '+
            '         EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
            '         PP.FLGDEVEPREVIDENC, PP.FLGDEVEASSISTENC, PP.FLGDEVEEMPRESTIMO,      '+
            '         PP.IDSITPART, PP.IDSITPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,        '+
            '         PP.IDPESSJUR,  PP.IDPLANOPREV, PP.INSCRICAODATA,SP.FLGINTERNO,      '+
            '         D.FLGDESIGNADO, DE.IDDEPENDENCIA, D.IDSITDEPENDENTE, DE.IDTITULAR,   '+
            '''' +DateToStr(date)+ ''' AS DATAREF, PF.NUMDEPIRRF '+
            ' FROM  ELEGPATRO EL, DEPENTIT DE, PESSOAFISICA PF, '+
            '       PARTPREVPLAN PP, SITPART SP, DEPENDENTE D '+
            ' WHERE PP.IDPESSOA    = ' + sidpessoaconspart + ' AND '+
            '       PP.SEQPROPOSTA = ' + sseqpropostaconspart + ' AND '+
            '       PP.IDPLANOPREV = ' + sidplanoprevconspart + ' AND '+
            '       PP.IDPESSJUR   = ' + sidpessjurconspart + ' AND '+
            '       DE.IDPESSOA    = ' + dtmConsPart.qryPessoaLigTitular.FieldByName('IDPESSOA').AsString + ' AND '+
            '       DE.IDPESSOA    = D.IDPESSOA AND '+
            '       EL.IDPESSOA    = PP.IDPESSOA  AND '+
            '       EL.IDPESSJUR   = PP.IDPESSJUR AND '+
            '       SP.IDSITPART   = PP.IDSITPART AND '+
            '       DE.IDTITULAR   = EL.IDPESSOA  AND '+
            '       DE.IDPESSOA    = PF.IDPESSOA(+) ';

    bElegivel := RegraBooleana(sIDRGELEGBENEF, sSQL , bErro);
    if bElegivel then
      NumElegiveis := NumElegiveis + 1;
    dtmConsPart.qryPessoaLigTitular.Next;
  end; //fim while
  dtmConsPart.qryDepentit.EnableControls;    //edilaine - SIG42986
  bRodandoElegibilidade := False;
  ContaElegiveisAbeneficio := NumElegiveis;
end;


procedure TFRMconspart.dbgriddepenDblClick(Sender: TObject);
begin
  bAcessaDependente := True;
  sidpessoaconspart := dtmConspart.qryDepentit.fieldByname('IDPESSOA').asString;
  closeDatasets;
  fTitular := False;

  //NBKelegpart.ActivePage := 'PgDadosPessoais';   //Peterson Victor SIG21868
    NBKelegpart.ActivePage := 'PgDadosPessoaisDepen'; //Peterson Victor SIG21868

  PreparaCamposScrollBox;//Darivaldo Alencar SIG 21868
  bListaTitular:= False; //Darivaldo Alencar SIG 21868
end;

procedure TFRMconspart.dbgridpartprevDblClick(Sender: TObject);
begin
  bAcessaDependente := True;
  sidpessoaconspart := dtmConspart1.qrypartprev.fieldByname('IDPESSOA').asString;
  closeDatasets;
  fTitular := False;
  //Darivaldo Alencar SIG 21868 -inicio
  //nbkElegPart.ActivePage := 'PgDadosPessoais';
   SelecionaTelaDados;
  //Darivaldo Alencar SIG 21868 -fim
end;

procedure TFRMconspart.HistricodeMovimentaes1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgBeneficiosHistoricoMovimentacoes';
end;

procedure TFRMconspart.ApplicationEventsIdle(Sender: TObject;
  var Done: Boolean);
begin
  Application.ProcessMessages;
  FRMconspart.Repaint;
end;

procedure TFRMconspart.EnquadramentoClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgEnquadramento';
end;


procedure TFRMconspart.wwDBGrid6CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  // FDIAS - FUNCEF - 12.12.2002
  if (dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString = 'Sub-Total' ) or
     (dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString = 'Total' ) Then
    aBrush.Color := clBtnFace;
end;


function TFRMconspart.ClienteNum(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   sCliente := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sCliente := sCliente + DecimalSeparator;
           bPrimPonto := True;
        end
        else sCliente := sCliente;
     end
     else begin
        if sNumero[i] <> DecimalSeparator
        then sCliente := sCliente + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sCliente := sCliente+DecimalSeparator;
              bPrimPonto := True;
           end
           else sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1
   do begin
      sResult := sResult + sCliente[i];
   end;
   Result := sResult;

end;


function TFRMconspart.BuscaValorFUNCAOConsEleg  ( piIdPessJur,
                                     piIdFuncao             : longint;
                                     psData                 : string   ) : double;
var iIdGrupoFunc : longint;
  qryAuxLocal : TwwQuery;
begin
   Result := 0;
   qryAuxLocal := TwwQuery.Create(nil);
   qryAuxLocal.DataBaseName := 'BaseDados';
   try
     // Buscar o grupo que a funcao estava na data indicada
     with qryAuxLocal do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT IDGRUPOFUNC FROM GRUPOCARGOEXT  '+
                ' WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
                ' AND    IDCARGOEXT     =  '+IntToStr(piIdFuncao)+
                ' AND    DATAVIGENCIA   = ( SELECT MAX(DATAVIGENCIA) '+
                '                           FROM GRUPOCARGOEXT       '+
                '                           WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
                '                           AND    IDCARGOEXT     =  '+IntToStr(piIdFuncao)+
                '                           AND    DATAVIGENCIA   <= TO_DATE('''+psData+''',''DD/MM/YYYY'')      '+
                '                           AND    ((DATAFIM      >= TO_DATE('''+psData+''',''DD/MM/YYYY'') ) OR '+
                '                                    (DATAFIM      IS NULL) ) ) ');
        Open;
        if not IsEmpty
        then begin
           iIdGrupoFunc := FieldByName('IDGRUPOFUNC').AsInteger;
           Close;
           SQL.Clear;
           SQL.Add(' SELECT VALOR FROM FAIXAGRUPO  '+
                   ' WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
                   ' AND    IDGRUPOFUNC    =  '+IntToStr(iIdGrupoFunc)+
                   ' AND    DATAEFETIVACAO = (SELECT MAX(DATAEFETIVACAO) '+
                   '                          FROM   FAIXAGRUPO            '+
                   ' 			 WHERE  IDPESSJUR      = '+IntToStr(piIdPessJur)+
                   '                          AND    IDGRUPOFUNC    =  '+IntToStr(iIdGrupoFunc)+
                   ' 			 AND    DATAEFETIVACAO <= TO_DATE('''+psData+''', ''DD/MM/YYYY'') ) ');
           Open;
           if not IsEmpty
           then Result := FieldByName('VALOR').AsFloat;
           Close;
        end
        else begin // Funcao não tem grupo. Verificar se ela tem valor na tabela de funcao sem grupo
           Close;
           SQL.Clear;
           SQL.Add(' SELECT VALOR FROM FAIXAFUNCAO  '+
                   ' WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
                   ' AND    IDCARGOEXT     =  '+IntToStr(piIdFuncao)+
                   ' AND    DATAEFETIVACAO = (SELECT MAX(DATAEFETIVACAO) '+
                   '                          FROM   FAIXAFUNCAO          '+
                   ' 			                 WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
                   '                          AND    IDCARGOEXT     =  '+IntToStr(piIdFuncao)+
                   ' 			                 AND    DATAEFETIVACAO <= TO_DATE('''+psData+''', ''DD/MM/YYYY'') ) ');
           Open;
           if not IsEmpty
           then Result := FieldByName('VALOR').AsFloat;
           Close;
        end;
     end;
   finally
     qryAuxLocal.Free;
   end;
end;



procedure TFRMconspart.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;



procedure TFRMconspart.dbgrHistReservaTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  if (AFieldName <> 'OBSERVACAO') then
     dtmConsPart.CdsHistReserva.IndexFieldNames := aFieldName;
end;


procedure TFRMconspart.AcaoJudicialClick(Sender: TObject);
begin
    NBKelegpart.ActivePage := 'PgAcaoJudicial';
end;


//início - André Tavares - pendência 15211 - 20/10/2003
procedure TFRMconspart.DadosparaEnquadramento1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'pgDadosParaEnquadramento'
end;


function TFRMconspart.BuscaValorCARGO (  piIdCargo, pIdPessjur : longint ) : double;
var  qryAux : Twwquery;
     sIdPessjur, sIdCargoExt, sDataVigencia : string;
begin
   sIdPessjur    := '';
   sIdCargoExt   := '';
   sDataVigencia := '';
   qryAux := Twwquery.Create(nil);
   qryAux.DataBaseName := 'BaseDados';
   Result := 0;
   qryAux.sql.Clear;
   qryAux.Sql.Add (' SELECT NVL(C.IDCARGOEXT, -1) as IDCARGOEXT, C.CODIGO, C.TITULO, C.TIPO, C.JORNADA, C.FLGATIVO, ');
   qryAux.Sql.Add ('        C.NOMERESUMIDO, C.CBO, NVL(C.IDPESSJUR, -1) as IDPESSJUR,       ');
   qryAux.Sql.Add ('        DECODE(C.FLGATIVO, 1, ''Ativa'', 0, ''Desativada'', 2 , ''Em Extinção'') AS SITUACAO, ');
   qryAux.Sql.Add ('        CAR.CODIGO AS CODCARREIRA, CAR.NOME AS NOMECARREIRA, PCS.CODIGO AS CODPCS, N.CODIGO AS NIVEL, ');
   qryAux.Sql.Add ('        N.IDNIVEL, PCS.NOME AS NOMEPCS,');
   qryAux.Sql.Add ('        MAX(CN.DATAVIGENCIA) AS DATAVIGENCIA');
   qryAux.Sql.Add ('        FROM   CARGOEXT C, CARREIRA CAR, PCS PCS, NIVEL N, CARGOXNIVEL CN');
   qryAux.Sql.Add ('        WHERE  C.IDPESSJUR   = '+ intToStr(pIdpessjur));
   qryAux.Sql.Add ('        AND    C.IDCARGOEXT  = '+ intToStr(piIdCargo));
   qryAux.Sql.Add ('        AND    C.TIPO        = ''C''');
   qryAux.Sql.Add ('        AND    CAR.IDCARREIRA(+)  = C.IDCARREIRA');
   qryAux.Sql.Add ('        AND    PCS.IDPCS(+)       = C.IDPCS');
   qryAux.Sql.Add ('        AND    CN.IDPESSJUR(+)    = C.IDPESSJUR');
   qryAux.Sql.Add ('        AND    CN.IDCARGOEXT(+)   = C.IDCARGOEXT');
   qryAux.Sql.Add ('        AND    CN.IDNIVEL      = N.IDNIVEL(+)');
   qryAux.Sql.Add ('        GROUP BY C.IDCARGOEXT,C.CODIGO, C.TITULO, C.TIPO, C.JORNADA, C.FLGATIVO,');
   qryAux.Sql.Add ('                 C.NOMERESUMIDO, C.CBO, C.FLGATIVO, CAR.CODIGO,CAR.NOME, C.IDPESSJUR, PCS.CODIGO, N.IDNIVEL,');
   qryAux.Sql.Add ('                 PCS.NOME , N.CODIGO');
   qryAux.Sql.Add ('        ORDER BY C.CODIGO');
   qryAux.Open;

   sIdPessjur    := qryAux.fieldByName('IDPESSJUR').asString;
   sIdCargoExt   := qryAux.fieldByName('IDCARGOEXT').asString;
   sDataVigencia := qryAux.fieldByName('DATAVIGENCIA').asString;

   if trim(sIdPessjur) = '' then
     sIdPessjur := '-1';
   if trim(sIdCargoExt) = '' then
     sIdCargoExt := '-1';
   if trim(sDataVigencia) = '' then
     sDataVigencia := dateToStr(date);


   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT FN.VALOR FROM FAIXANIVEL FN, CARGOXNIVEL C '+
              ' WHERE  C.IDPESSJUR    = '+ sIdPessjur +
              ' AND    C.IDCARGOEXT   = '+ sIdCargoExt +
              ' AND    C.DATAVIGENCIA = TO_DATE('''+sDataVigencia+''', ''DD/MM/YYYY'')  '+
              ' AND    FN.IDPESSJUR   = C.IDPESSJURNIVEL '+
              ' AND    FN.IDNIVEL     = C.IDNIVEL '+
              ' AND    FN.DATAEFETIVACAO = (SELECT MAX(FN.DATAEFETIVACAO) '+
              '                             FROM FAIXANIVEL FN, CARGOXNIVEL C       '+
              ' 	        	    WHERE  C.IDPESSJUR    = '+ sIdPessjur +
              '                             AND    C.IDCARGOEXT   = '+IntToStr(piIdCargo)+
              '                             AND    C.DATAVIGENCIA = TO_DATE('''+sDataVigencia+''', ''DD/MM/YYYY'')  '+
              '                             AND    FN.IDPESSJUR   = C.IDPESSJURNIVEL '+
              ' 			    AND    FN.IDNIVEL     = C.IDNIVEL '+
              ' 			    AND    FN.DATAEFETIVACAO <= TO_DATE('''+DateToStr(date)+''', ''DD/MM/YYYY'') ) ');
      Open;
      if not IsEmpty
      then Result := FieldByName('VALOR').AsFloat;
      Close;
   end;
   qryAux.Free;
end;



procedure TFRMconspart.FiltraHistMovReserva;
var sFiltro :string;
begin
  sFiltro := '';
  if dtmConsPart.cDSHistReserva.Active then
  begin
    if (trim(dbLkMesInicial.Text) <> '') and (trim(dbLkMesFinal.Text) <> '') then
    begin
      sFiltro := 'MESREFERENCIA >= '+ quotedStr(dbLkMesInicial.LookupValue)+
                 ' AND  MESREFERENCIA <= '+ quotedStr(dbLkMesFinal.LookupValue);
    end
    else if (trim(dbLkMesInicial.Text) = '') and (trim(dbLkMesFinal.Text) <> '') then
    begin
      sFiltro := ' MESREFERENCIA <= '+ quotedStr(dbLkMesFinal.LookupValue);
    end
    else if (trim(dbLkMesInicial.Text) <> '') and (trim(dbLkMesFinal.Text) = '') then
    begin
      sFiltro := ' MESREFERENCIA <= '+ quotedStr(dbLkMesInicial.LookupValue);
    end;

    if trim(dblkNomeReserva.text) <> '' then
    begin
      if sFiltro = '' then
        sFiltro := ' NOME like ' + '''' + dblkNomeReserva.LookupValue + '%'+''''
      else
        sFiltro := sFiltro + ' AND NOME like ' + '''' + dblkNomeReserva.LookupValue + '%'+'''';
    end;

    dtmConsPart.cDSHistReserva.Filter   := sFiltro;
    dtmConsPart.cDSHistReserva.Filtered := True;
  end;
end;

procedure TFRMconspart.dbLkMesInicialChange(Sender: TObject);
begin
  FiltraHistMovReserva;
  TotalizaReserva;
end;

procedure TFRMconspart.DblkMesFinalChange(Sender: TObject);
begin
  FiltraHistMovReserva;
  TotalizaReserva;
end;

procedure TFRMconspart.dblkNomeReservaChange(Sender: TObject);
begin
  FiltraHistMovReserva;
  TotalizaReserva;
end;

//fim - André Tavares - pendência 15211 - 20/10/2003



procedure TFRMconspart.TotalizaReserva;
var
   vlrindice   : Double;
   _qryAux     : Twwquery;
begin
  if not dtmConsPart.CdsHistReserva.Active then exit;

  lblTotal.Caption         := 'Saldo Total R$ ';
  LblTotalControle.Caption := 'Saldo Total de Res. de Controle R$ ';
  TotSdoResCtrl := 0;
  TotalSaldo    := 0;
  dtmConsPart.CdsHistReserva.disableControls;
  dtmConsPart.CdsHistReserva.first;
  vlrindice := dtmConsPart.CdsHistReservaVALORINDICE.AsFloat;

  while not dtmConsPart.CdsHistReserva.EOF do
  begin
    if (dtmConsPart.CdsHistReservaFLGCOLETIVA.asInteger = 0) or
       (dtmConsPart.CdsHistReservaFLGCOLETIVA.isnull) then
    begin
      if dtmConsPart.CdsHistReservaFLGCONTROLE.asInteger = 0 then
        if dtmConsPart.CdsHistReservaFLGENTRADA.AsString = 'E' Then  //FDias - 12.12.2003
          if not bFuncef then
            TotalSaldo := TotalSaldo + dtmConsPart.CdsHistReservaVLRCOTAS.asFloat
          else
            TotalSaldo := TotalSaldo + dtmConsPart.CdsHistReservaVLRCOTAS.asFloat * dtmConsPart.CdsHistReserva.fieldByName('COTVALOR').asFloat
        else
//início - andre tavares - 12/04/2004 - pendencia 16681
          if not bFuncef then
               TotalSaldo := TotalSaldo - abs(dtmConsPart.CdsHistReservaVLRCOTAS.asFloat)
          else TotalSaldo := TotalSaldo - abs(dtmConsPart.CdsHistReservaVLRCOTAS.asFloat * dtmConsPart.CdsHistReserva.fieldByName('COTVALOR').asFloat)
//fim - andre tavares - 12/04/2004 - pendencia 16681
      else if (dtmConsPart.CdsHistReservaFLGTITULARCOLET.asString   = 'T') then
      begin
        if dtmConsPart.CdsHistReservaFLGENTRADA.AsString = 'E' Then  //FDias - 12.12.2003
          if not bFuncef then
            TotSdoResCtrl := TotSdoResCtrl + dtmConsPart.CdsHistReservaVLRCOTAS.asFloat
          else
            TotSdoResCtrl := TotSdoResCtrl + dtmConsPart.CdsHistReservaVLRCOTAS.asFloat * dtmConsPart.CdsHistReserva.fieldByName('COTVALOR').asFloat
        else
//início - andre tavares - 12/04/2004 - pendencia 16681
          if not bFuncef then
               TotSdoResCtrl := TotSdoResCtrl - abs(dtmConsPart.CdsHistReservaVLRCOTAS.asFloat)
          else TotSdoResCtrl := TotSdoResCtrl - abs(dtmConsPart.CdsHistReservaVLRCOTAS.asFloat * dtmConsPart.CdsHistReserva.fieldByName('cotvalor').asFloat)
//fim - andre tavares - 12/04/2004 - pendencia 16681
      end;
    end;
    dtmConsPart.CdsHistReserva.Next;
  end;
  if not bFuncef then
  begin
    TotalSaldoReal    := vlrindice * TotalSaldo;
    TotSdoResCtrlReal := vlrindice * TotSdoResCtrl;
  end else
  begin
    TotalSaldoReal    := TotalSaldo;
    TotSdoResCtrlReal := TotSdoResCtrl;
  end;
  dtmConsPart.CdsHistReserva.first;
  dtmConsPart.CdsHistReserva.EnableControls;
  if not bFuncef then
  begin
    lblTotal.Caption         := lblTotal.Caption + FormatFloat('#,##0.00', TotalSaldoReal) +
                                ' / ' + FormatFloat('#,##0.00', TotalSaldo) + ' Cotas (' +
                                FormatFloat('#,##0.00', vlrindice) + ')';
    LblTotalControle.Caption := LblTotalControle.Caption + FormatFloat('#,##0.00', TotSdoResCtrlReal) +
                                ' / ' + FormatFloat('#,##0.00', TotSdoResCtrl) + ' Cotas ('+
                                FormatFloat('#,##0.00', vlrindice) + ')';
  end else
  begin
    lblTotal.Caption         := lblTotal.Caption + FormatFloat('#,##0.00', TotalSaldoReal) +
                                ' / ' + FormatFloat('#,##0.00', TotalSaldo);
    LblTotalControle.Caption := LblTotalControle.Caption + FormatFloat('#,##0.00', TotSdoResCtrlReal) +
                                ' / ' + FormatFloat('#,##0.00', TotSdoResCtrl);
  end;
end;



// André Tavares - Implementei esta função porque a propriedade
// RecordCount do Dataset não funciona para este caso.
function TFRMconspart.ContaRegistro(qry: TdataSet): integer;
begin
   result := 0;
   if not qry.Active then
     exit;
   qry.DisableControls;
   qry.Filter := '';
   qry.Filtered := False;
   qry.First;
   while not qry.EOF do
   begin
     result := result + 1;
     qry.Next;
   end;
   qry.EnableControls;
   qry.First;
end;



// André Tavares - 27/11/2003 - pendência 15543
// pega a primeira data de inscrição na fundação
function TFRMconspart.BuscaDtEntrada(pIdPessoa, pIdpessjur, pIdPlanoprev: integer): TdateTime;
var qry : tWWquery;
begin
   result := 0;
   qry := twwquery.Create(nil);
   qry.DataBaseName := 'BaseDados';
   try
// início andré tavares - 25/02/2003 - pendência 16109
      qry.Close;
      qry.sql.clear;

      // Marchetti - Pendencia 24030
      if Sistema.TipoCliente = 19991 then
      begin
         qry.sql.add('SELECT INSCRICAODATA, DATACANCELAMENTO                       ');
         qry.sql.add('FROM PARTPREVPLAN WHERE IDPESSOA = ' + intToStr(pIdpessoa)    );
         qry.sql.add(' AND IDPESSJUR                   = ' + intToStr(pIdpessjur)   );
         qry.sql.add(' AND IDPLANOPREV                 = ' + intToStr(pIdPlanoprev) );
         qry.Open;
         result := qry.fieldByName('INSCRICAODATA').asDateTime;
      end
      // Fim Marchetti - Pendencia 24030
      else
      begin
         qry.sql.add(' SELECT EP1.IDPESSOA, ');
         qry.sql.add('        EP1.IDPLANOPREV, ');
         qry.sql.add('        EP1.IDPESSJUR, ');
         qry.sql.add('        DT.DATAMIGRACAO ');
         qry.sql.add(' FROM EVENTOGERADOR EG1, EVENTOSPREV EP1, PARTPREVPLAN PP1, ');
         qry.sql.add('      (SELECT EP.IDPESSOA, ');
         qry.sql.add('              MAX(EP.DATAEVENTO) AS DATAMIGRACAO ');
         qry.sql.add('       FROM EVENTOGERADOR EG, EVENTOSPREV EP, PARTPREVPLAN PP ');
         qry.sql.add('       WHERE EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR AND ');
         qry.sql.add('             EG.FLGINTERNO      = ''TP'' AND ');
         qry.sql.add('             EP. IDPESSOA       = '+ intToStr(pIdpessoa) +' AND ');
         qry.sql.add('             PP.IDPESSOA        = EP.IDPESSOA AND ');
         qry.sql.add('             PP.IDPLANOPREV     = EP.IDPLANOPREV AND ');
         qry.sql.add('             PP.IDPESSJUR       = EP.IDPESSJUR  AND ');
         qry.sql.add('             PP.FLGDESATIVADO   = 1 ');
         qry.sql.add('       GROUP BY EP.IDPESSOA) DT ');
         qry.sql.add(' WHERE EG1.IDEVENTOGERADOR = EP1.IDEVENTOGERADOR AND ');
         qry.sql.add('       EG1.FLGINTERNO      = ''TP'' AND ');
         qry.sql.add('       EP1. IDPESSOA       = '+ intToStr(pIdpessoa) +' AND ');
         qry.sql.add('       PP1.IDPESSOA        = EP1.IDPESSOA AND ');
         qry.sql.add('       PP1.IDPLANOPREV     = EP1.IDPLANOPREV AND ');
         qry.sql.add('       PP1.IDPESSJUR       = EP1.IDPESSJUR  AND  ');
         qry.sql.add('       PP1.FLGDESATIVADO   = 1 AND ');
         qry.sql.add('       EP1.DATAEVENTO      = DT.DATAMIGRACAO ');
         qry.Open;
         // se houve migração
         if not qry.IsEmpty then
         begin
            qry.Close;
            qry.Sql.Clear;
     // fim andré tavares - 25/02/2003 - pendência 16109
            qry.sql.add('SELECT MIN(INSCRICAODATA) AS INSCRICAODATA ');
            qry.sql.add('FROM PARTPREVPLAN WHERE IDPESSOA = ' + intToStr(pIdpessoa)    );
            qry.Open;
            result := qry.fieldByName('INSCRICAODATA').asDateTime;
// início andré tavares - 25/02/2003 - pendência 16109
         end
         else
         begin
            qry.Close;
            qry.Sql.Clear;
            qry.sql.add('SELECT INSCRICAODATA, DATACANCELAMENTO                       ');
            qry.sql.add('FROM PARTPREVPLAN WHERE IDPESSOA = ' + intToStr(pIdpessoa)    );
            qry.sql.add(' AND IDPESSJUR                   = ' + intToStr(pIdpessjur)   );
            qry.sql.add(' AND FLGDESATIVADO = 0                                       ');
            qry.Open;
            result := qry.fieldByName('INSCRICAODATA').asDateTime;
         end;
// fim andré tavares - 25/02/2003 - pendência 16109
      end;
   finally
      qry.free;
   end;
end;



procedure TFRMconspart.Parcelamento1Click(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'Parcelamento';
end;



procedure TFRMconspart.wwDBGrid4RowChanged(Sender: TObject);
begin
   dtmConsPart.qryhstEmprestimo.Close;
   dtmConsPart.qryhstEmprestimo.ParamByName('IDCONTRATOEMPTMO').AsFloat :=
   dtmConsPart.qryEmprestimos.FieldByName('IDCONTRATOEMPTMO').AsFloat;
   dtmConsPart.qryhstEmprestimo.Open;
end;



procedure TFRMconspart.OutrasInformaes1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'OutrasInformacoes';
end;



procedure TFRMconspart.dblkPatrosCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   FiltraHistRubSal(dblkPatros.LookupValue);
   DblkPatro.LookUpValue := dblkPatros.LookUpValue;
   dtmConsPart.qryPlanos.Close;
   dtmConsPart.qryPlanos.ParamByName('IDPESSOA').AsInteger := StrtoIntDef(sidpessoaconspart, -1);
   dtmConsPart.qryPlanos.ParamByName('PATROCINADORA').AsString := DblkPatro.LookUpValue;
   dtmConsPart.qryPlanos.Open;


   edtMatricula.Text :=  GetMatricula;
   sidpessjurconspart := DblkPatro.LookupValue;
end;



procedure TFRMconspart.FiltraHistRubSal(sIdpessjur: string);
begin
   dtmConsPart.qryHstRubricas.Filtered := False;

   if trim(sIdPessjur) <> '' then
   begin
     dtmConsPart.qryHstRubricas.Filter := ' IDPESSJUR = ' + sIdPessjur;
     dtmConsPart.qryHstRubricas.Filtered := True;
   end;
end;



function TFRMconspart.GetMatricula: string;
var
   qry : TwwQuery;
begin
   result := '******';
   qry := Twwquery.Create(nil);
   qry.DataBaseName := 'BaseDados';

   if trim(sidPessoaConsPart) = trim(sIdTitular) then
   begin
     qry.Close;
     qry.sql.text := ' SELECT MATRICULA FROM ELEGPATRO WHERE IDPESSOA = ' + intToStr(StrtoIntDef(sIdTitular, -1))
                     + ' AND IDPESSJUR = ' +intToStr(StrtoIntDef(sIdPessjurConsPart, -1));
     qry.Open;
   end
   else
   begin
     qry.Close;
     qry.sql.text := ' SELECT MATRICULA FROM DEPENTIT WHERE IDPESSOA = '+ intToStr(StrtoIntDef(sIdPessoaConsPart, -1))+
                   ' AND IDTITULAR = '+ intToStr(StrtoIntDef(sIdTitular, -1));
     qry.Open;
   end;
   result := qry.FieldByName('MATRICULA').asString;
   qry.Free;
end;



procedure TFRMconspart.BitBtn1Click(Sender: TObject);
begin
   inherited;
   twMensagem.Visible := False;
end;



procedure TFRMconspart.twMensagemVisibleChanged(Sender: TObject);
begin
   inherited;
   //Fanuel Marinho SOL180997 Kintana1677634
   twMensagem.left := (Self.width - twMensagem.width) div 2;
   twMensagem.top  := (Self.height - twMensagem.height) div 2;
   //twMensagem.left := (FRMconspart.width - twMensagem.width) div 2;
   //twMensagem.top  := (FRMconspart.height - twMensagem.height) div 2;
end;



procedure TFRMconspart.VidaNaFundao1Click(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgVidaNaFundacao';
end;



procedure TFRMconspart.BitBtn2Click(Sender: TObject);
begin
   dtmConsPart1.qryMessagemFiario.Next;

   if not(dtmConsPart1.qryMessagemFiario.EOF) then
   begin
      reditMSG.text := dtmConsPart1.qryMessagemFiario.fieldByName('DESCRICAO').asString;
      BitBtn3.Enabled := True;
   end
   else
   begin
      BitBtn2.Enabled := False;
      BitBtn3.Enabled := True;
   end;
end;



procedure TFRMconspart.BitBtn3Click(Sender: TObject);
begin
   dtmConsPart1.qryMessagemFiario.Prior;

   if not(dtmConsPart1.qryMessagemFiario.BOF) then
   begin
      reditMSG.text := dtmConsPart1.qryMessagemFiario.fieldByName('DESCRICAO').asString;
      BitBtn2.Enabled := True;
   end
   else
   begin
      BitBtn2.Enabled := True;
      BitBtn3.Enabled := False;
   end;
end;



procedure TFRMconspart.DblkPlanosCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   // verifica se o plano é cancelado
   if not DtmconsPart1.QryBuscaCancPlano.active then
   begin
      DtmconsPart1.QryBuscaCancPlano.ParamByName('IDPESSOA').asInteger := strToInt(sIdPessoaConsPart);
      DtmconsPart1.QryBuscaCancPlano.Open;
   end;
end;



procedure TFRMconspart.Titular2Click(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgPlanos';
end;



procedure TFRMconspart.Beneficirios1Click(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgContrSitAtualBeneficiario';
end;



procedure TFRMconspart.Beneficirio1Click(Sender: TObject);
begin
   inherited;
   NBKelegpart.ActivePage := 'PgPlanosBenef';
end;



procedure TFRMconspart.chkTodasPatroClick(Sender: TObject);
begin
    dtmConsPart.cDSHistReserva.Close;
    
    LimpaParametros(dtmConsPart.qryHistReserva);
    dtmConsPart.qryHistReserva.ParamByName('IDTITULAR').AsFloat   := StrToIntDef(sIdPessoaConspart, -1);

    if not chkTodasPatro.Checked then
       dtmConsPart.qryHistReserva.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);

    dtmConsPart.qryHistReserva.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryHistReserva.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);

    dtmConsPart.qryMesReferencia.Close;
    dtmConsPart.qryMesReferencia.ParamByName('IDTITULAR').AsFloat   := StrToIntDef(sIdPessoaConspart, -1);
    dtmConsPart.qryMesReferencia.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qryMesReferencia.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryMesReferencia.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    dtmConsPart.qryMesReferencia.Open;

    dtmConsPart.qryNomeReserva.Close;
    dtmConsPart.qryNomeReserva.ParamByName('IDTITULAR').AsFloat   := StrToIntDef(sIdPessoaConspart, -1);
    dtmConsPart.qryNomeReserva.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qryNomeReserva.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryNomeReserva.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    dtmConsPart.qryNomeReserva.Open;

    if not dtmConsPart.CdsHistReserva.active then dtmConsPart.cDSHistReserva.Open;

    TotalizaReserva;
end;


procedure TFRMconspart.LimpaParametros(const qry: TwwQuery);
var
   i: integer;
begin
   // fecha a query p/ evitar problemas
   qry.Close;

   // prepara a query se já não estiver preparada
   if not(qry.Prepared) then qry.Prepare;

   // zera os parâmetros
   for i := 0 to (qry.ParamCount - 1) do
   begin
      qry.Params[i].Bound := False;
      qry.Params[i].Clear;
      qry.Params[i].Bound := True;
   end;
end;

procedure TFRMconspart.HistricodePercentualdeContribuio1Click(
  Sender: TObject);
begin
  inherited;
  NBKelegpart.ActivePage := 'pgHistoricodePercentual';
end;

procedure TFRMconspart.CreatefrmFrameConsultaHistorico;
var
  index : Integer;
  pagina : TPage;
begin
  //As definições do objeto (FRAME) abaixo foram retiradas do DFM deste FORM devido erro em design time.
  pagina := nil;
  for index := 0 to NBKelegpart.ControlCount-1 do
  begin
    if (NBKelegpart.Controls[index] is TPage) then
    begin
      pagina := TPage(NBKelegpart.Controls[index]);
      if (pagina.Caption = 'PgBeneficiosPagamentosContraCheque') then
      begin
        frmFrameConsultaHistorico1 := TfrmFrameConsultaHistorico.Create(pagina);
        frmFrameConsultaHistorico1.Parent := pagina;
        with frmFrameConsultaHistorico1 do
        begin
          Top := 19;
          Width := 790;
          Height := 310;
          Align := alClient;
          TabOrder := 1;
          with pnlFundo do
          begin
            Width := 790;
            Height := 310;
            with Splitter1 do
            begin
              Width := 790;
            end;
            with PnlValores do
            begin
              Top := 280;
              Width := 790;
            end;
            with PageControl1 do
            begin
              Width := 790;
              Height := 196;
              with TabSheet1 do
              begin
                with dbgDetalhe do
                begin
                  Width := 782;
                  Height := 168;
                end;
              end;
            end;
            with PnlHistorico do
            begin
              Width := 790;
              with dbgHistorico do
              begin
                Width := 491;
              end;
              with DBGridRecebedor do
              begin
                Left := 493;
              end;
            end;

            // edilaine - SIG42986 - inicio
            with dbgHistorico do
            begin
              Selected.Clear;
              Selected.Add('IDHSTFOLHABENEF'#9'6'#9'Versão');         // Versão folha
              Selected.Add('MESCOBRANCA'#9'7'#9'Mês');                // Mes
              Selected.Add('DATAPAGAMENTO'#9'15'#9'Dt. Pagamento');   // Dt Pagto
              Selected.Add('HISTORICO'#9'50'#9'Histórico');           // Historico
              ApplySelected;
            end;

            with dbgDetalhe do
            begin
              Selected.Delete(12);   // S.Fam
              Selected.Delete(11);   // IR
            end;
            // edilaine - SIG42986 - fim
          end;
        end;
        Break;
      end;
    end;

  end;
  if (not(Assigned(frmFrameConsultaHistorico1))) then
  begin
    raise Exception.Create('Não foi possível carregar a consulta de histórico!');
  end;
end;

procedure TFRMconspart.DestroyfrmFrameConsultaHistorico;
begin
  if Assigned(frmFrameConsultaHistorico1) then
  begin
    FreeAndNil(frmFrameConsultaHistorico1);
  end;
end;

procedure TFRMconspart.DblkPatroChange(Sender: TObject);
var
  // Thiago Melo SOL 215849 Kintana 2044962
  x : SmallInt;
  paramPatrocinadora, paramTitular: Boolean;
  // Thiago Melo SOL 215849 Kintana 2044962
begin
  inherited;

  paramPatrocinadora := False;

  dtmConsPart.qryPlanos.Close;
  // Vinicius Ferreira SOL 177868 KINTANA 1632116
  if (Trim(sIdTitular)=Trim(sIdPessoaConsPart)) then
  begin
     dtmConsPart.qryPlanos.ParamByName('IDPESSOA').AsInteger := StrtoIntDef(sidpessoaconspart, -1);

     // Thiago Melo SOL 215849 Kintana 2044962
     for x := 0 to dtmConsPart.qryPlanos.Params.Count do begin
       if ((dtmConsPart.qryPlanos.Params[x].Name = 'PATROCINADORA') or
           (dtmConsPart.qryPlanos.Params[x].Name = 'IDTITULAR')) then begin
         if dtmConsPart.qryPlanos.Params[x].Name = 'PATROCINADORA' then begin
           paramPatrocinadora := True;
           Break;
         end else begin
           paramTitular := True;
           Break;
         end;
       end;
     end;

     if paramPatrocinadora then begin
       if (DblkPatro.LookupValue = '') then begin
         dtmConsPart.qryPlanos.ParamByName('PATROCINADORA').AsString := FConsPessoaGeral.cIdPessjur;
       end else begin
         dtmConsPart.qryPlanos.ParamByName('PATROCINADORA').AsString := DblkPatro.LookupValue;
       end;
     end;

     if paramTitular then begin
       if (Trim(sIdTitular)<>Trim(sIdPessoaConsPart)) then begin
         dtmConsPart.qryPlanos.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sIdPessoaConsPart,-1);
       end else begin
         dtmConsPart.qryPlanos.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(Trim(sIdTitular),-1);
       end;
     end;

     //dtmConsPart.qryPlanos.ParamByName('PATROCINADORA').AsString := DblkPatro.LookupValue;

     // Thiago Melo SOL 215849 Kintana 2044962
  end
  else
  begin   // SOL 186139 Kintana 1751410
     if (Trim(sIdTitular)<>Trim(sIdPessoaConsPart)) then
        dtmConsPart.qryPlanos.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sIdPessoaConsPart,-1) // SOL 186139 Kintana 1751410
     else
        dtmConsPart.qryPlanos.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(Trim(sIdTitular),-1); //MONICA GONZAGA SOL180928 KTN 1678130 Descartado // SOL 186139 Kintana 1751410
  end; // SOL 186139 Kintana 1751410

  // Vinicius Ferreira SOL 177868 KINTANA 1632116
  dtmConsPart.qryPlanos.Open;

  edtMatricula.Text :=  GetMatricula;
  sidpessjurconspart := DblkPatro.LookupValue;

  // SOL 201305 Kintana 1958008
  DblkPlanos.Enabled := true;
  DblkPlanos.Text        := dtmConsPart.qryPlanos.FieldByName('NOME').AsString;
  dtmConsPart1.qryDadosTitular.Close;
  dtmConsPart1.qryDadosTitular.ParamByName('IDTITULAR').AsInteger   := StrToIntDef(sIdTitular,-1);
  dtmConsPart1.qryDadosTitular.ParamByName('IDPLANOPREV').AsInteger := StrToIntDef(dtmConsPart.qryPlanos.FieldByName('IDPLANOPREV').AsString,-1); // Marchetti - 25810
  dtmConsPart1.qryDadosTitular.Open;
  // Marchetti - 25002
  if Sistema.TipoCliente = 19991 then
       // Alberto - 22425 - 12/06/2006
       dtmConsPart1.qryDadosTitular.Locate('IDPESSJUR', StrToIntDef(FConsPessoaGeral.cIdPessjur,-1),[loCaseInsensitive])
  else dtmConsPart1.qryDadosTitular.Locate('IDPESSJUR', strToIntDef(sIdPessJurConspart, -1), [loCaseInsensitive]);
  // Fim.
  DblkPlanos.Enabled := dtmConsPart.qryPlanos.RecordCount>1;
  // SOL 201305 Kintana 1958008

  if NBKelegpart.ActivePage = 'PgEvolucaoFuncional' then
  begin

    dtmConsPart.qryDet.Close;
    dtmConsPart.qryDet.Prepare;
    dtmConsPart.qryDet.ParamByName('IDPESSJUR').Value := DblkPatro.LookUpValue; //StrToIntDef(FConsPessoaGeral.cIdPessjur, -1); // Alberto - 22425 - 16/06/2006
    dtmConsPart.qryDet.ParamByName('IDPESSOA').Value  := StrtoIntDef(sIdTitular, -1);
    dtmConsPart.qryDet.Open;

  end;

end;

procedure TFRMconspart.CarregarHistoricoRevisoesBeneficios;
begin
  //Marcelo Almeida - SOL 136383 - Kintana 815815
  pnlHistoricoRevisoesBeneficios.Visible := True;
  if (DtmconsPart.qryHistoricoRevisoesBeneficios.Active) then
  begin
    DtmconsPart.qryHistoricoRevisoesBeneficios.Close;
  end;
  DtmconsPart.qryHistoricoRevisoesBeneficios.ParamByName('idpessoa').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
  DtmconsPart.qryHistoricoRevisoesBeneficios.ParamByName('idplanoprev').AsFloat := StrtoIntDef(sidplanoprevconspart, -1);
  DtmconsPart.qryHistoricoRevisoesBeneficios.ParamByName('idpessjur').AsFloat := StrtoIntDef(sidpessjurconspart, -1);
  DtmconsPart.qryHistoricoRevisoesBeneficios.Prepare;
  DtmconsPart.qryHistoricoRevisoesBeneficios.Open;
  cbHistoricoRevisoesBeneficios.Clear;
  if (not(DtmconsPart.qryHistoricoRevisoesBeneficios.IsEmpty)) then
  begin
    DtmconsPart.qryHistoricoRevisoesBeneficios.First;
    while not(DtmconsPart.qryHistoricoRevisoesBeneficios.Eof) do
    begin
      cbHistoricoRevisoesBeneficios.Items.AddObject(DtmconsPart.qryHistoricoRevisoesBeneficios.FieldByName('NOMEBENEFICIO').AsString, TObject(DtmconsPart.qryHistoricoRevisoesBeneficios.FieldByName('IDBENEFICIO').AsInteger));
      DtmconsPart.qryHistoricoRevisoesBeneficios.Next;
    end;
    cbHistoricoRevisoesBeneficios.ItemIndex := 0;
    cbHistoricoRevisoesBeneficios.Enabled := True;
    dbmmHMDescricaoRevisao.Enabled := True;
  end
  else
  begin
    ShowMessage('Nenhum registro no histórico de revisão encontrado!');
    cbHistoricoRevisoesBeneficios.Enabled := False;
    dbmmHMDescricaoRevisao.Enabled := False;
  end;
  cbHistoricoRevisoesBeneficios.ItemIndex := 0;
  cbHistoricoRevisoesBeneficios.onChange(self);
  pnlHistoricoRevisoesBeneficios.Visible := (cbHistoricoRevisoesBeneficios.Items.Count = 0);
  //Marcelo Almeida - SOL 136383 - Kintana 815815
end;

procedure TFRMconspart.cbHistoricoRevisoesBeneficiosChange(
  Sender: TObject);
begin
  inherited;
  //Marcelo Almeida - SOL 136383 - Kintana 815815
  if (cbHistoricoRevisoesBeneficios.ItemIndex >= 0) then
  begin
    DtmconsPart.qryHistoricoRevisoesBeneficios.Locate('idbeneficio', Integer(cbHistoricoRevisoesBeneficios.Items.Objects[cbHistoricoRevisoesBeneficios.ItemIndex]), []);
  end
  else
  begin
    DtmconsPart.qryHistoricoRevisoes.Close;
  end;
  pnlHistoricoRevisoesBeneficios.Visible := DtmconsPart.qryHistoricoRevisoes.IsEmpty;
  //Marcelo Almeida - SOL 136383 - Kintana 815815
end;

procedure TFRMconspart.DblkPatroKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TFRMconspart.DblkPatroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_DELETE) then begin
    Key := 0;
  end;


end;


//Renato Visoni SOL 148127 Kintana 1036903
procedure TFRMconspart.FiltraContribuicao;
var sFiltro :string;
begin

  sFiltro := '';
  if dtmConsPart1.qrycontribprev.Active then
  begin
    if (trim(dbMesReferenciaIni.Text) <> '') and (trim(dbMesReferenciaFim.Text) <> '') then
    begin
      sFiltro := 'MESREFERENCIA >= '+ quotedStr(dbMesReferenciaIni.LookupValue)+
                 ' AND  MESREFERENCIA <= '+ quotedStr(dbMesReferenciaFim.LookupValue);
    end
    else if (trim(dbMesReferenciaIni.Text) = '') and (trim(dbMesReferenciaFim.Text) <> '') then
    begin
      sFiltro := ' MESREFERENCIA <= '+ quotedStr(dbMesReferenciaFim.LookupValue);
    end
    else if (trim(dbMesReferenciaIni.Text) <> '') and (trim(dbMesReferenciaFim.Text) = '') then
    begin
      sFiltro := ' MESREFERENCIA <= '+ quotedStr(dbMesReferenciaIni.LookupValue);
    end;

    if trim(dbNomeContribuicao.text) <> '' then
    begin
      if sFiltro = '' then
        sFiltro := ' CONTRIB = ' + quotedStr(dbNomeContribuicao.LookupValue)
      else
        sFiltro := sFiltro + ' AND CONTRIB = ' + quotedStr(dbNomeContribuicao.LookupValue);
    end;

  end;

  dtmConsPart1.qrycontribprev.Filter   := sFiltro;
  dtmConsPart1.qrycontribprev.Filtered := True;

end;
//Renato Visoni SOL 148127 Kintana 1036903


procedure TFRMconspart.dbMesReferenciaIniChange(Sender: TObject);
begin
  FiltraContribuicao(); //Renato Visoni SOL 148127 Kintana 1036903
end;

procedure TFRMconspart.dbMesReferenciaFimChange(Sender: TObject);
begin
  FiltraContribuicao(); //Renato Visoni SOL 148127 Kintana 1036903
end;

procedure TFRMconspart.dbNomeContribuicaoChange(Sender: TObject);
begin
  FiltraContribuicao(); //Renato Visoni SOL 148127 Kintana 1036903
end;

procedure TFRMconspart.MmCompradeCarenciadeTempoClick(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'pgCompraCarenciaTempo'; // SOL 151853 KTN 1130323
end;

 //Eraldo Silva - SOL 149830/6383 - Kintana 1411406 INICIO
procedure TFRMconspart.HistricodeRevises1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgBeneficiosHistoricoRevisoes';
end;
 //Eraldo Silva - SOL 149830/6383 - Kintana 1411406 FIM

(*

*)
// Fanuel Junior SOL 161339 Kintana 1361327
procedure TFRMconspart.MostraInformacoesBancarias;
begin

//Busca o banco                                                          

if DtmconsPart.qryAcaoJudicial.FieldByName('IDBANCO').AsInteger <> 0 then
   begin
        DtmconsPart.qryBanco.Close;
        DtmconsPart.qryBanco.Open;
        DtmconsPart.qryBanco.Locate('IDPESSOA',DtmconsPart.qryAcaoJudicial.FieldByName('IDBANCO').AsInteger, []);
        dblkBanco.LookUpValue := DtmconsPart.qryBanco.FieldByName('IDPESSOA').AsString;
        dblkBanco.Enabled := true;
   end
else
   begin
        dblkBanco.Enabled := false;
        dblkBanco.LookUpValue := '';
   end;

//Busca Agência
DtmconsPart.qryAgencia.Close;
DtmconsPart.qryAgencia.ParamByName('IDBANCO').AsInteger := DtmconsPart.qryAcaoJudicial.FieldByName('IDBANCO').AsInteger;
DtmconsPart.qryAgencia.Open;
DtmconsPart.qryAgencia.Locate('IDPESSOA', DtmconsPart.qryAcaoJudicial.FieldByName('IDAGENCIABANCARIA').AsInteger, []);
dblkAgencia.LookUpValue := DtmconsPart.qryAgencia.FieldByName('IDPESSOA').AsString;
dblkAgencia.Enabled :=  not (DtmconsPart.qryAgencia.FieldByName('IDPESSOA').AsString = '');


  //Busca Conta Corrente
DtmconsPart.qryConta.Close;
DtmconsPart.qryConta.ParamByName('IDAGENCIA').AsInteger := DtmconsPart.qryAcaoJudicial.FieldByName('IDAGENCIABANCARIA').AsInteger;
DtmconsPart.qryConta.Open;
DtmconsPart.qryConta.Locate('IDCBANCARIA', DtmconsPart.qryAcaoJudicial.FieldByName('IDCBANCARIA').AsInteger, []);
dblkConta.LookUpValue := DtmconsPart.qryConta.FieldByName('IDCBANCARIA').AsString;
dblkConta.Enabled :=  not (DtmconsPart.qryConta.FieldByName('IDCBANCARIA').AsString = '')

end;
// Fanuel Junior SOL 161339 Kintana 1361327


//Eraldo Silva do cavaco
procedure TFRMconspart.SituaoAtual3Click(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PgBeneficiosSituacaoAtual';
end;



procedure TFRMconspart.dbMatriculasChange(Sender: TObject);//SOL 37791/4261 Kintana 1187530
begin

  if (dbMatriculas.LookupValue <> '') then
   begin
    dtmConsPart.qryMesRubrica.Close;
    dtmConsPart.qryMesRubrica.ParamByName('idPessoa').asInteger := StrToInt(dbMatriculas.LookupValue);
    dtmConsPart.qryMesRubrica.Open;

    dtmConsPart.qryMesRubrica.First;
    dtmConsPart.qryMesRubrica.Filtered := False;
    dtmConsPart.qryMesRubrica.Filter   :=  ' idmodulo <> 18 ';
    dtmConsPart.qryMesRubrica.Filtered := True;

    DblkMesCobranca.Text        := dtmConsPart.qryMesRubrica.fieldByName('MesCobranca').asString;
    DblkMesCobranca.LookupValue := dtmConsPart.qryMesRubrica.fieldByName('MesCobranca').asString;
    dblkMesCobrancaChange(self);
    end;

end;

procedure TFRMconspart.grdHstSalParticipacaoColEnter(Sender: TObject);
begin
   teste := grdHstSalParticipacao.datasource.dataset.fieldbyname('MESFILTRO').asstring;
end;

procedure TFRMconspart.grdHstSalParticipacaoDblClick(Sender: TObject);
var sRegistroClicado : String;
begin
    //dtmConsPart.qryHstSalParticipGrid.DisableControls;
   //iRecNo := dtmConsPart.qryHstSalParticipGrid.recno;
   sRegistroClicado := dtmConsPart.qryHstSalParticipGrid.FieldByName('MESFILTRO').asstring ;

   if dtmConsPart.qryHstSalParticipacao.active then
   begin
      if bContDetalhe then begin
         //dtmConsPart.qryHstSalParticipGrid.Filter := '';
         //dtmConsPart.qryHstSalParticipGrid.Filtered := False;
         dtmConsPart.qryHstSalParticipGrid.Filter := '(TIPO = '+QuotedStr('T')+') OR (MESFILTRO = '+ QuotedStr(dtmConsPart.qryHstSalParticipGrid.FieldByName('MESFILTRO').asstring)+')';
        // dtmConsPart.qryHstSalParticipGrid.Filtered := True;
         bContDetalhe := false;
      end
      else begin
        // dtmConsPart.qryHstSalParticipGrid.Filtered := False;
         dtmConsPart.qryHstSalParticipGrid.Filter := '(TIPO = '+QuotedStr('T')+')';
        // dtmConsPart.qryHstSalParticipGrid.Filtered := True;
         bContDetalhe  := true;
      end
   end;
   //dtmConsPart.qryHstSalParticipGrid.enableControls;
   //dtmConsPart.qryHstSalParticipGrid.recno  := iRecNo;
   dtmConsPart.qryHstSalParticipGrid.Locate('MESFILTRO', sRegistroClicado,[]);
end;

procedure TFRMconspart.grdHstSalParticipacaoDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   teste2 := grdHstSalParticipacao.datasource.dataset.fieldbyname('MESFILTRO').asstring;
end;

procedure TFRMconspart.HistricodeSalriodeParticipao1Click(Sender: TObject);
begin
   NBKelegpart.ActivePage := 'PghistSalParticipacao';
end;

procedure TFRMconspart.DBRichHistReservaObsCreateDialog(Form: TForm);
begin
  Form.Height := 200;
  Form.Width := 400;

  Form.Top := Self.Top + ((Self.Height - Form.Height) div 2);
  Form.Left := Self.Left + ((Self.Width - Form.Width) div 2);
end;

procedure TFRMconspart.bbtnAjuda2Click(Sender: TObject);
begin
   //SOL  148922/8841 - Jonas
   if  (Sistema.IdModulo        = 15)  then
      begin
           Application.HelpContext(230030)
      end;
end;

//Helio - SOL Nº 253577/17604 PPM Nº 999484
procedure TFRMconspart.OnQrySituacaoAtualBenefAfterScroll(DataSet: TDataSet);
begin
       ReorganizaCamposBeneficiosSituacaoAtual;
end;

//Helio - SOL Nº 253577/17604 PPM Nº 999484
procedure TFRMconspart.ReorganizaCamposBeneficiosSituacaoAtual;
var
     mostraBSFAB,
     mostraDeficit : Boolean;
begin
       mostraBSFAB := dtmConsPart.qrySituacaoAtualBenef.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1;
       mostraDeficit := dtmConsPart.qrySituacaoAtualBenef.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1;

       if (mostraBSFAB and mostraDeficit) then
           mostraCamposBSFABDeficit
       else if mostraBSFAB then
                 mostraCamposBSFAB
       else if mostraDeficit then
                 MostraCamposDeficit
       else
           ocultaCamposBSFABDeficit;
end;

//Helio - SOL Nº 253577/17604 PPM Nº 999484
procedure TFRMconspart.mostraCamposBSFABDeficit;
begin
      lblBSDIB.Visible          := True;
      dbedBSDIB.Visible         := True;
      lblFABDIB.Visible         := True;
      dbedFABDIB.Visible        := True;
      lblValorAtualBS.Visible   := True;
      dbedValorAtualBS.Visible  := True;
      lblValorTotalBS.Visible   := True;
      dbedValorTotalBS.Visible  := True;
      lblValorAtualFAB.Visible  := True;
      dbedValorAtualFAB.Visible := True;
      lblValorTotalFAB.Visible  := True;
      dbedValorTotalFAB.Visible := True;
      lblCalcDeficit.Visible    := True;
      dbedCalcDeficit.Visible   := True;
      //edilaine WO18367 : inicio
      gbTitular.visible  := dtmConsPart.qrySituacaoAtualBenef.FieldByName('PERC_PENSAO').AsInteger <> -1;
      dbedValorTotalTit.visible := (gbTitular.visible) and
                                   (dtmConsPart.qrySituacaoAtualBenef.FieldByName('VLRTOTALTITULAR').AsInteger > 0);
      lblTotalTitular.visible   := dbedValorTotalTit.visible;
      //edilaine WO18367 : fim

      //Darivaldo Alencar SOL 269360 - PPM.1294692 -inicio

      //      lblBSDIB.Top              := 121;
      //      lblBSDIB.Left             := 105;
      //      dbedBSDIB.Top             := 136;
      //      dbedBSDIB.Left            := 103;
      //      lblFABDIB.Top             := 121;
      //      lblFABDIB.Left            := 199;
      //      dbedFABDIB.Top            := 136;
      //      dbedFABDIB.Left           := 197;
      //      lblBeneficioInicial.Top   := 121;
      //      lblBeneficioInicial.Left  := 290;
      //      dbedBeneficioInicial.Top  := 136;
      //      dbedBeneficioInicial.Left := 290;
      //      lblFormaPagamento.Top     := 121;
      //      lblFormaPagamento.Left    := 441;
      //      dbedFormaPagamento.Top    := 136;
      //      dbedFormaPagamento.Left   := 439;
      //      lblValorAtualBS.Top       := 160;
      //      lblValorAtualBS.Left      := 14;
      //      dbedValorAtualBS.Top      := 175;
      //      dbedValorAtualBS.Left     := 12;
      //      lblValorTotalBS.Top       := 160;
      //      lblValorTotalBS.Left      := 102;
      //      dbedValorTotalBS.Top      := 175;
      //      dbedValorTotalBS.Left     := 100;
      //      lblValorAtualFAB.Top      := 160;
      //      lblValorAtualFAB.Left     := 197;
      //      dbedValorAtualFAB.Top     := 175;
      //      dbedValorAtualFAB.Left    := 195;
      //      lblValorTotalFAB.Top      := 160;
      //      lblValorTotalFAB.Left     := 292;
      //      dbedValorTotalFAB.Top     := 175;
      //      dbedValorTotalFAB.Left    := 290;
      //      lblValorAtual.Top         := 160;
      //      lblValorAtual.Left        := 386;
      //      dbedValorAtual.Top        := 175;
      //      dbedValorAtual.Left       := 384;
      //      lblValorTotal.Top         := 160;
      //      lblValorTotal.Left        := 479;
      //      dbedValorTotal.Top        := 175;
      //      dbedValorTotal.Left       := 477;
      //      lblCalcDeficit.Top        := 160;
      //      lblCalcDeficit.Left       := 573;
      //      dbedCalcDeficit.Top       := 175;
      //      dbedCalcDeficit.Left      := 571;
      //
            lblBSDIB.Top              := Label148.top;
            lblBSDIB.Left             := wwDBEdit69.width + 9 + wwDBEdit69.left;
            dbedBSDIB.Top             := wwDBEdit69.top;
            dbedBSDIB.Left            := lblBSDIB.Left;
            lblFABDIB.Top             := lblBSDIB.top;
            lblFABDIB.Left            := dbedBSDIB.width + 9 + dbedBSDIB.left;
            dbedFABDIB.Top            := dbedBSDIB.top;
            dbedFABDIB.Left           := lblFABDIB.left;
            lblBeneficioInicial.Top   := lblBSDIB.top;
            lblBeneficioInicial.Left  := dbedFABDIB.width + 9 + dbedFABDIB.left;
            dbedBeneficioInicial.Top  := dbedBSDIB.top;
            dbedBeneficioInicial.Left := lblBeneficioInicial.left;
            lblFormaPagamento.Top     := lblBSDIB.top;
            lblFormaPagamento.Left    := dbedBeneficioInicial.width + 9 + dbedBeneficioInicial.left;
            dbedFormaPagamento.Top    := dbedBSDIB.top;
            dbedFormaPagamento.Left   := lblFormaPagamento.left;
            lblValorAtualBS.Top       := lblBSDIB.top + 48;
            lblValorAtualBS.Left      := NBKelegpart.left + 16;
            dbedValorAtualBS.Top      := wwDBEdit69.top+ 48;
            dbedValorAtualBS.Left     := lblValorAtualBS.left;
            lblValorTotalBS.Top       := lblValorAtualBS.top;
            lblValorTotalBS.Left      := dbedValorAtualBS.width + 9 + dbedValorAtualBS.left;
            dbedValorTotalBS.Top      := dbedValorAtualBS.Top;
            dbedValorTotalBS.Left     := lblValorTotalBS.left;
            lblValorAtualFAB.Top      := lblValorTotalBS.Top;
            lblValorAtualFAB.Left     := dbedValorTotalBS.width + 9 + dbedValorTotalBS.left;
            dbedValorAtualFAB.Top     := dbedValorTotalBS.top;
            dbedValorAtualFAB.Left    := lblValorAtualFAB.Left;
            lblValorTotalFAB.Top      := lblValorTotalBS.Top;
            lblValorTotalFAB.Left     := dbedValorAtualFAB.width + 9 + dbedValorAtualFAB.left;
            dbedValorTotalFAB.Top     := dbedValorTotalBS.top;
            dbedValorTotalFAB.Left    := lblValorTotalFAB.Left;
            lblValorAtual.Top         := lblValorTotalBS.Top;
            lblValorAtual.Left        := dbedValorTotalFAB.width + 9 + dbedValorTotalFAB.left;
            dbedValorAtual.Top        := dbedValorTotalBS.top;
            dbedValorAtual.Left       := lblValorAtual.Left ;
            lblValorTotal.Top         := lblValorTotalBS.Top;
            lblValorTotal.Left        := dbedValorAtual.width + 9 + dbedValorAtual.left;
            dbedValorTotal.Top        := dbedValorTotalBS.top;
            dbedValorTotal.Left       := lblValorTotal.Left;
            lblCalcDeficit.Top        := lblValorTotalBS.Top;
            lblCalcDeficit.Left       := dbedValorTotal.width + 9 + dbedValorTotal.left;
            dbedCalcDeficit.Top       := dbedValorTotalBS.top;
            dbedCalcDeficit.Left      := lblCalcDeficit.Left;

      //      lblValorOpcao1.Top  := 196;
      //      dbedValorOpcao1.Top := 211;
      //      lblValorOpcao2.Top  := 196;
      //      dbedValorOpcao2.Top := 211;
      //      lblValorOpcao3.Top  := 196;
      //      dbedValorOpcao3.Top := 211;

      //edilaine WO18367 : inicio
      //lblValorOpcao1.Top  := dbedValorAtual.top + 26;
      //dbedValorOpcao1.Top := lblValorOpcao1.top + 15;
      //lblValorOpcao2.Top  := lblValorOpcao1.Top;
      //dbedValorOpcao2.Top := dbedValorOpcao1.Top;
      //lblValorOpcao3.Top  := lblValorOpcao1.Top;
      //dbedValorOpcao3.Top := dbedValorOpcao1.Top;
      if gbTitular.visible then
      begin
        gbTitular.top       := dbedValorAtual.top + 26;
        pnlOpcao.Top        := gbTitular.Top + gbTitular.Height + 3
      end
      else
        pnlOpcao.Top        := dbedValorAtual.top + 26;
      //edilaine WO18367 : fim

      //pnlDEC.Top := 240;
      //pnlDEC.Top := dbedValorOpcao1.top + 33;              //edilaine WO18367
      pnlDEC.Top := pnlOpcao.top + pnlOpcao.Height + 1;      //edilaine WO18367
      //Darivaldo Alencar SOL 269360 - PPM.1294692 -fim
      //DBCtrlGrid4.Height := 326;
end;

//Helio - SOL Nº 253577/17604 PPM Nº 999484
procedure TFRMconspart.mostraCamposBSFAB;
begin
       mostraCamposBSFABDeficit;

       lblCalcDeficit.Visible    := False;
       dbedCalcDeficit.Visible   := False;
end;

//Helio - SOL Nº 253577/17604 PPM Nº 999484
procedure TFRMconspart.MostraCamposDeficit;
begin
      lblBSDIB.Visible          := False;
      dbedBSDIB.Visible         := False;
      lblFABDIB.Visible         := False;
      dbedFABDIB.Visible        := False;
      lblValorAtualBS.Visible   := False;
      dbedValorAtualBS.Visible  := False;
      lblValorTotalBS.Visible   := False;
      dbedValorTotalBS.Visible  := False;
      lblValorAtualFAB.Visible  := False;
      dbedValorAtualFAB.Visible := False;
      lblValorTotalFAB.Visible  := False;
      dbedValorTotalFAB.Visible := False;
      lblCalcDeficit.Visible    := True;
      dbedCalcDeficit.Visible   := True;
      gbTitular.visible         := false;         //edilaine WO18367

      //Darivaldo Alencar SOL 269360 - PPM.1294692 -- inicio
      //      lblBeneficioInicial.Top   := 121;
      //      lblBeneficioInicial.Left  := 105;
      //      dbedBeneficioInicial.Top  := 136;
      //      dbedBeneficioInicial.Left := 103;
      //      lblFormaPagamento.Top     := 121;
      //      lblFormaPagamento.Left    := 248;
      //      dbedFormaPagamento.Top    := 136;
      //      dbedFormaPagamento.Left   := 246;
      //      lblValorAtual.Top         := 160;
      //      lblValorAtual.Left        := 14;
      //      dbedValorAtual.Top        := 175;
      //      dbedValorAtual.Left       := 12;
      //      lblValorTotal.Top         := 160;
      //      lblValorTotal.Left        := 102;
      //      dbedValorTotal.Top        := 175;
      //      dbedValorTotal.Left       := 100;
      //      lblCalcDeficit.Top        := 160;
      //      lblCalcDeficit.Left       := 197;
      //      dbedCalcDeficit.Top       := 175;
      //      dbedCalcDeficit.Left      := 195;
      lblBeneficioInicial.Top   := lblBSDIB.top;
      lblBeneficioInicial.Left  := lblBSDIB.left;
      dbedBeneficioInicial.Top  := dbedBSDIB.top;
      dbedBeneficioInicial.Left := dbedBSDIB.left;
      lblFormaPagamento.Top     := lblBeneficioInicial.Top;
      lblFormaPagamento.Left    := dbedBeneficioInicial.width + 9 + dbedBeneficioInicial.left;
      dbedFormaPagamento.Top    := dbedBeneficioInicial.Top;
      dbedFormaPagamento.Left   := dbedBeneficioInicial.width + 9 +dbedBeneficioInicial.left;
      lblValorAtual.Top         := Label148.Top + 39;
      lblValorAtual.Left        := DBCtrlGrid4.left + 13;
      dbedValorAtual.Top        := lblValorAtual.Top + 15;
      dbedValorAtual.Left       := lblValorAtual.left;
      lblValorTotal.Top         := lblValorAtual.top;
      lblValorTotal.Left        := dbedValorAtual.width + 9 + dbedValorAtual.left;
      dbedValorTotal.top        := dbedValorAtual.top;
      dbedValorTotal.left       := lblValorTotal.Left;
      lblCalcDeficit.Top        := lblValorAtual.Top;
      lblCalcDeficit.left       := dbedValorTotal.width + 9 +dbedValorTotal.left;
      dbedCalcDeficit.top       := dbedValorAtual.top;
      dbedCalcDeficit.Left      := lblCalcDeficit.left;

      //      lblValorOpcao1.Top  := 196;
      //      dbedValorOpcao1.Top := 211;
      //      lblValorOpcao2.Top  := 196;
      //      dbedValorOpcao2.Top := 211;
      //      lblValorOpcao3.Top  := 196;
      //      dbedValorOpcao3.Top := 211;

      //edilaine WO18367 : inicio
      //lblValorOpcao1.Top  := dbedValorAtual.top + 26;
      //dbedValorOpcao1.Top := lblValorOpcao1.top + 15;
      //lblValorOpcao2.Top  := lblValorOpcao1.Top;
      //dbedValorOpcao2.Top := dbedValorOpcao1.Top;
      //lblValorOpcao3.Top  := lblValorOpcao1.Top;
      //dbedValorOpcao3.Top := dbedValorOpcao1.Top;
      pnlOpcao.Top        := dbedValorAtual.top + 26;
      //edilaine WO18367 : fim

      //pnlDEC.Top := 240;
      //pnlDEC.Top := dbedValorOpcao1.top + 33;              //edilaine WO18367
      pnlDEC.Top := pnlOpcao.top + pnlOpcao.Height + 1;      //edilaine WO18367
      //Darivaldo Alencar SOL 269360 - PPM.1294692 -- fim
      //DBCtrlGrid4.Height := 326;
end;

//Helio - SOL Nº 253577/17604 PPM Nº 999484
procedure TFRMconspart.ocultaCamposBSFABDeficit;
begin
      lblBSDIB.Visible          := False;
      dbedBSDIB.Visible         := False;
      lblFABDIB.Visible         := False;
      dbedFABDIB.Visible        := False;
      lblValorAtualBS.Visible   := False;
      dbedValorAtualBS.Visible  := False;
      lblValorTotalBS.Visible   := False;
      dbedValorTotalBS.Visible  := False;
      lblValorAtualFAB.Visible  := False;
      dbedValorAtualFAB.Visible := False;
      lblValorTotalFAB.Visible  := False;
      dbedValorTotalFAB.Visible := False;
      lblCalcDeficit.Visible    := False;
      dbedCalcDeficit.Visible   := False;
      gbTitular.visible         := false;         //edilaine WO18367

       //Darivaldo Alencar SOL 269360 - PPM.1294692 -- inicio
      //      lblBeneficioInicial.Top   := 121;
      //      lblBeneficioInicial.Left  := 105;
      //      dbedBeneficioInicial.Top  := 136;
      //      dbedBeneficioInicial.Left := 103;
      //      lblFormaPagamento.Top     := 121;
      //      lblFormaPagamento.Left    := 248;
      //      dbedFormaPagamento.Top    := 136;
      //      dbedFormaPagamento.Left   := 246;

      //      lblValorAtual.Top         := 121;
      //      lblValorAtual.Left        := 510;
      //      dbedValorAtual.Top        := 136;
      //      dbedValorAtual.Left       := 508;
      //      lblValorTotal.Top         := 121;
      //      lblValorTotal.Left        := 599;
      //      dbedValorTotal.Top        := 136;
      //      dbedValorTotal.Left       := 597;
      lblBeneficioInicial.Top   := lblBSDIB.top;
      lblBeneficioInicial.Left  := lblBSDIB.left;
      dbedBeneficioInicial.Top  := dbedBSDIB.top;
      dbedBeneficioInicial.Left := dbedBSDIB.left;
      lblFormaPagamento.Top     := lblBeneficioInicial.Top;
      lblFormaPagamento.Left    := dbedBeneficioInicial.width + 9 + dbedBeneficioInicial.left;
      dbedFormaPagamento.Top    := dbedBeneficioInicial.Top;
      dbedFormaPagamento.Left   := dbedBeneficioInicial.width + 9 +dbedBeneficioInicial.left;
      lblValorAtual.Top         := lblBeneficioInicial.Top;
      lblValorAtual.Left        := dbedFormaPagamento.width + 9+dbedFormaPagamento.left;
      dbedValorAtual.Top        := dbedBeneficioInicial.Top;
      dbedValorAtual.Left       := dbedFormaPagamento.width + 9 +dbedFormaPagamento.left;
      lblValorTotal.Top         := lblBeneficioInicial.Top;
      lblValorTotal.Left        := dbedValorAtual.width + 9 +dbedValorAtual.left;
      dbedValorTotal.Top        := dbedBeneficioInicial.Top;
      dbedValorTotal.Left       := dbedValorAtual.width + 9 +dbedValorAtual.left;

      //      lblValorOpcao1.Top  := 160;
      //      dbedValorOpcao1.Top := 175;
      //      lblValorOpcao2.Top  := 160;
      //      dbedValorOpcao2.Top := 175;
      //      lblValorOpcao3.Top  := 160;
      //      dbedValorOpcao3.Top := 175;

      //edilaine WO18367 : inicio
      //lblValorOpcao1.Top  := lblValorAtualBS.top;
      //dbedValorOpcao1.Top := dbedValorAtualBS.top;
      //lblValorOpcao2.Top  := lblValorOpcao1.Top;
      //dbedValorOpcao2.Top := dbedValorOpcao1.Top;
      //lblValorOpcao3.Top  := lblValorOpcao1.Top;
      //dbedValorOpcao3.Top := dbedValorOpcao1.Top;
      pnlOpcao.Top        := lblValorAtualBS.top;
      //edilaine WO18367 : fim

      //pnlDEC.Top := 240;
      //pnlDEC.Top := dbedValorOpcao1.top + 33;              //edilaine WO18367
      pnlDEC.Top := pnlOpcao.top + pnlOpcao.Height + 1;      //edilaine WO18367
      //Darivaldo Alencar SOL 269360 - PPM.1294692 -- fim
      //DBCtrlGrid4.Height := 290;
end;

//Helio - SOL Nº 253577/17604 PPM Nº 999484
procedure TFRMconspart.MostraOcultaCamposDbgridbeneficios;
var
     aprensetaDeficit,
     apresentaBSFAB : Boolean;
begin
       dtmConsPart1.qryBeneficios.Filtered := False;
       dtmConsPart1.qryBeneficios.Filter   := ' FLGAPRESENTADEFICIT = 1 ';
       dtmConsPart1.qryBeneficios.Filtered := True;
       aprensetaDeficit := dtmConsPart1.qryBeneficios.RecordCount > 0;

       dtmConsPart1.qryBeneficios.Filtered := False;
       dtmConsPart1.qryBeneficios.Filter   := ' FLGAPRESENTABSFAB = 1 ';
       dtmConsPart1.qryBeneficios.Filtered := True;
       apresentaBSFAB := dtmConsPart1.qryBeneficios.RecordCount > 0;
       dtmConsPart1.qryBeneficios.Filtered := False;

       if LstGridbeneficios.Text = '' then
          LstGridbeneficios.Assign(dbgridbeneficios.Selected);

       dbgridbeneficios.Selected.Assign(LstGridbeneficios);

       if Not aprensetaDeficit then
           dbgridbeneficios.Selected.Delete(31);

       if Not apresentaBSFAB then
       begin
              dbgridbeneficios.Selected.Delete(30);
              dbgridbeneficios.Selected.Delete(29);
              dbgridbeneficios.Selected.Delete(28);
              dbgridbeneficios.Selected.Delete(27);
       end;
end;

//Helio - SOL Nº 253577/17604 PPM Nº 999484
procedure TFRMconspart.OnQryBeneficiosAntesAfterScroll(DataSet: TDataSet);
begin
      dtmConsPart.qryMovBenef.DisableControls;
end;

//Helio - SOL Nº 253577/17604 PPM Nº 999484
procedure TFRMconspart.OnQryBeneficiosAfterScroll(DataSet: TDataSet);
begin
       MostraOcultaCamposDbgridMovBenef;
       dtmConsPart.qryMovBenef.EnableControls;
end;

//Helio - SOL Nº 253577/17604 PPM Nº 999484
procedure TFRMconspart.MostraOcultaCamposDbgridMovBenef;
var
     apresentaBSFAB : Boolean;
begin
       dtmConsPart.qryMovBenef.Filtered := False;
       dtmConsPart.qryMovBenef.Filter   := ' FLGAPRESENTABSFAB = 1 ';
       dtmConsPart.qryMovBenef.Filtered := True;
       apresentaBSFAB := dtmConsPart.qryMovBenef.RecordCount > 0;
       dtmConsPart.qryMovBenef.Filtered := False;

       if LstgridMovBenef.Text = '' then
          LstgridMovBenef.Assign(DbgridMovBenef.Selected);

       DbgridMovBenef.Selected.Assign(LstgridMovBenef);

       DbgridMovBenef.DataSource := nil;

       if Not apresentaBSFAB then
       begin
              //Inicio - Helio - SOL Nº 270869 PPM Nº 1340102
              {DbgridMovBenef.Selected.Delete(24);
              DbgridMovBenef.Selected.Delete(23);
              DbgridMovBenef.Selected.Delete(22);
              DbgridMovBenef.Selected.Delete(21);
              DbgridMovBenef.Selected.Delete(20);
              DbgridMovBenef.Selected.Delete(19);
              DbgridMovBenef.Selected.Delete(18);
              DbgridMovBenef.Selected.Delete(17);}
              DbgridMovBenef.Selected.Delete(26); //VLRFABTOTALNOVO
              DbgridMovBenef.Selected.Delete(25); //VLRFABATUALNOVO
              DbgridMovBenef.Selected.Delete(24); //VLRFABTOTALANT
              DbgridMovBenef.Selected.Delete(23); //VLRFABATUALANT
              DbgridMovBenef.Selected.Delete(22); //VLRBSTOTALNOVO
              DbgridMovBenef.Selected.Delete(21); //VLRBSATUALNOVO
              DbgridMovBenef.Selected.Delete(20); //VLRBSTOTALANT10
              DbgridMovBenef.Selected.Delete(19); //VLRBSATUALANT10
              //Fim - Helio - SOL Nº 270869 PPM Nº 1340102
       end;
       
       DbgridMovBenef.DataSource := dtmConsPart.dsMovBenef;
end;

procedure TFRMconspart.FormResize(Sender: TObject);
begin
//inherited;

  // Andre Imakawa - SIG 62096 - Inicio
  if not(FRMconspart = nil) then
  begin
    //edilaine - SIG42986 - inicio
    if FRMconspart.Height > iAlturaIniForm then
      wsStateForm := wsMaximized
    else
      wsStateForm := wsNormal;
    //edilaine - SIG42958 - fim
  end;
  // Andre Imakawa - SIG 62096 - Fim

  //edilaine - SIG42986 - incio
  if NBKelegpart.ActivePage = 'PgContribuicoesSituacaoAtual' then
     AjustaPainelSitAtualTitular
  else if NBKelegpart.ActivePage = 'PgBeneficiosPagamentosContraCheque' then
  begin
    if Assigned(frmFrameConsultaHistorico1) then
       frmFrameConsultaHistorico1.AjustaFrame(wsStateForm);
  end
  else if NBKelegpart.ActivePage = 'PgContribuicoesReservaHistoricoAlimentacao' then
  begin
    if wsStateForm = wsNormal then
    begin
      lblTotal.left := 23;
      lblTotal.alignment := taLeftJustify;
    end
    else
    begin
      lblTotal.left := LblTotalControle.left - lblTotal.width - 50;
      lblTotal.alignment := taRightJustify;
    end;
  end;
  //edilaine - SIG42986 - fim

end;

//Peterson Victor SIG21868 - INICIO
procedure TFRMconspart.btnHistMolestiaClick(Sender: TObject);
begin
   FrmHistMolestia := TFrmHistMolestia.Create(frmConsPart);

   FrmHistMolestia.qryMolestia.Close;
   FrmHistMolestia.qryMolestia.paramByname('IDPESSOA').asInteger := strToIntDef(sIdPessoaConsPart, -1);

   if not FrmHistMolestia.qryMolestia.Prepared then
      FrmHistMolestia.qryMolestia.Prepare;

   FrmHistMolestia.qryMolestia.Open;
   FrmHistMolestia.ModalResult := mrCancel;
   FrmHistMolestia.ShowModal;
end;

procedure TFRMconspart.btnHistIRClick(Sender: TObject);
begin
   FrmHistIR := TFrmHistIR.Create(frmConsPart);

   FrmHistIR.qryHistIR.Close;
   FrmHistIR.qryHistIR.paramByname('IDPESSOA').asInteger := strToIntDef(sIdPessoaConsPart, -1);

   if not FrmHistIR.qryHistIR.Prepared then
      FrmHistIR.qryHistIR.Prepare;

   FrmHistIR.qryHistIR.Open;
   FrmHistIR.ModalResult := mrCancel;
   FrmHistIR.ShowModal;
end;

{*** Darivaldo Alencar SIG 21868 Substituido componente TNotebook por TTabControl}
procedure TFRMconspart.TabDepenChange(Sender: TObject);
begin
 case TabDepen.TabIndex of
        0 :
        begin
           dtmConsPart.qryDepenTit.Filtered := False;
        end;
        1:
        begin
           dtmConsPart.qryDepenTit.Filtered := False;
           {**Darivaldo Alencar SIG21868
            dtmConsPart.qryDepenTit.Filter := 'FLGISENTOIRRF = 1 '; }
           // Peterson Victor - SIG SIG42986
           //dtmConsPart.qryDepenTit.Filter := 'FLGCONTAIMPOSTOR = 1 ';
             dtmConsPart.qryDepenTit.Filter := ' INICIOIMPOSTOR is not null AND (FIMIMPOSTOR is null or FIMIMPOSTOR > ''' + formatdatetime('dd/mm/yyyy', now) + ''') AND FLGIGNORAVALIR = 0';
           //Peterson Victor SIG SIG42986
           dtmConsPart.qryDepenTit.Filtered := True;
        end;
        2:
        begin
           dtmConsPart.qryDepenTit.Filtered := False;
           dtmConsPart.qryDepenTit.Filter := 'FLGDEPLEGAL = 1 ';
           dtmConsPart.qryDepenTit.Filtered := True;
        end;
        3:
        begin
           dtmConsPart.qryDepenTit.Filtered := False;
           dtmConsPart.qryDepenTit.Filter := 'FLGDESIGNADO = 1 ';
           dtmConsPart.qryDepenTit.Filtered := True;
        end;
     end;
end;
//Peterson Victor SIG21868 - FIM

{Darivaldo Alencar SIG21868 -inicio}
procedure TFRMconspart.dbgriddepenCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   {fonte vermelha para dependente cancelado}
   if ((dtmConsPart.qryDepenTit.recordcount <> 0) and (dtmConsPart.qryDepenTit.FieldByName('DATACANCELA').AsString <> EmptyStr) ) then
        AFont.Color := clRed
   else AFont.Color := clWindowText;
end;

procedure TFRMconspart.PreparaCamposScrollBox;
begin
   //edilaine - SIG42986 - inicio
   {if not(bAcessaDependente) then
     begin
       //versão titular
        DblkPatro.left := wwDBEdit38.left;
        DblkPatro.Top  := wwDBEdit38.Top +35;
        DblkPatro.width:= wwDBEdit37.width;
        DblkPlanos.top := edtResponsavel.Top +36;
        wwDBEdit29.left:= DblkPatro.left +368;
     end
   else begin
       //versão dependente
        DblkPatro.left := edClassific.left;
        DblkPatro.Top  := edtResponsavel.Top +36;
        DblkPatro.width:= DblkPlanos.width;
        DblkPlanos.top := DblkPatro.Top +36;
        wwDBEdit29.left:= wwDBEdit38.left;
        TabDepenChange(Self);
   end; }

   DblkPatro.left := edClassific.left;
   DblkPatro.Top  := edtResponsavel.Top +36;
   DblkPatro.width:= DblkPlanos.width;
   DblkPlanos.top := DblkPatro.Top +36;
   wwDBEdit29.left:= wwDBEdit38.left;

    //Denis Horongoso - SIG67891 - Início
   {if (not bAcessaDependente) then
   begin
     Label169.left   := lblSitBenefPlano.left;
     Label169.caption := 'Situação do Participante Titular no Plano';
     wwDBEdit90.left := edtSitBenefPlano.left;
     wwDBEdit90.width := 361;

   end
   else
   begin
     wwDBEdit90.left := DblkPlanos.left;
     wwDBEdit90.width := 405;
     Label169.caption := 'Situação do Beneficiário no Plano';
     Label169.left   := wwDBEdit90.left;

     TabDepenChange(Self);
   end;}

   if bAcessaDependente then
      TabDepenChange(Self);
   //Denis Horongoso - SIG67891 - Fim
   //edilaine - SIG42986 - fim

  {versão em comum}
   Label115.left  := DblkPatro.left;
   Label115.Top   := DblkPatro.Top -12;
   wwDBEdit39.left:= DblkPatro.left;
   wwDBEdit39.top := DblkPatro.top;
   //Label1.left    := DblkPlanos.top; //Darivaldo Alencar SIG50441
   Label1.left    := DblkPlanos.left;  //Darivaldo Alencar SIG50441
   Label1.top     := DblkPlanos.top -13;//Darivaldo Alencar SIG50441
   //wwDBEdit90.top := DblkPlanos.top +36; //Denis Horongoso - SIG67891
   //Label169.top   := wwDBEdit90.top -12; //Denis Horongoso - SIG67891
   edtSitBenefPlano.top := DblkPlanos.top +34;  //Denis Horongoso - SIG67891
   lblSitBenefPlano.top := edtSitBenefPlano.top -13;  //Denis Horongoso - SIG67891
   Label109.left  := wwDBEdit29.left;
   wwDBEdit28.left:= wwDBEdit29.left +104;
   Label108.left  := wwDBEdit28.left;

   //edilaine - SIG42986 - inicio
   {edtResponsavel.visible   := bAcessaDependente;
   lblResponsavel.visible   := edtResponsavel.visible;
   lblTpResponsavel.visible := edtResponsavel.visible;
   edtTpResponsavel.visible := edtResponsavel.visible;
   }//edilaine - SIG42986 - fim
end;

procedure TFRMconspart.SelecionaTelaDados;
begin
  if (bAcessaDependente) then
      begin
         if (nbkElegPart.ActivePage <> 'PgDadosPessoaisDepen') then
             nbkElegPart.ActivePage := 'PgDadosPessoaisDepen';
      end
  else begin
       if (nbkElegPart.ActivePage <> 'PgDadosPessoais') then
           nbkElegPart.ActivePage := 'PgDadosPessoais';
  end;
end;


procedure TFRMconspart.CalculaIdade;
begin
    if (not dtmConsPart.DsPartGeral.DataSet.FieldByName('DATANASC').IsNull) and
       (dtmConsPart.DsPartGeral.DataSet.FieldByName('DATAMORTE').IsNull) then
         dbedIdadeDepen.Text := IntToStr(Trunc((Date-dtmConsPart.DsPartGeral.DataSet.FieldByName('DATANASC').AsDateTime)/365.25))
    else dbedIdadeDepen.Text := IntToStr(Trunc((dtmConsPart.DsPartGeral.DataSet.FieldByName('DATAMORTE').AsDateTime-dtmConsPart.DsPartGeral.DataSet.FieldByName('DATANASC').AsDateTime)/365.25));
end;
{Darivaldo Alencar SIG21868 -fim}

procedure TFRMconspart.dbgrdHistSRB01DblClick(Sender: TObject);
var
   sRegistroClicado, sFiltro : string;
begin
   // Felipe A. Santos SOL 208658 Kintana 2018716
   sRegistroClicado := dtmConspart.qryHistSRBGrid01.FieldByName('MESREFER').AsString;

   if bContDetalheSRB01 then
   begin

      if DblkPlanos.Value = 'REG/REPLAN' then
         sFiltro := '(TIPO = ' + QuotedStr('T') + ') OR ' +
                    '(MESREFER = ' + QuotedStr(sRegistroClicado) + ')'
      else if DblkPlanos.Value = 'REB' then
        sFiltro := '(TIPO = ' + QuotedStr('A') + ' OR TIPO = ' + QuotedStr('T') + ') OR ' +
                   '(MESREFER = ' + QuotedStr(sRegistroClicado) + ')'
      else if DblkPlanos.Value = 'NOVO PLANO' then
        sFiltro := '(TIPO = ' + QuotedStr('A') + ' OR TIPO = ' + QuotedStr('T') + ') OR ' +
                   '(MESREFER = ' + QuotedStr(sRegistroClicado) + ')';

      dtmConspart.qryHistSRBGrid01.Filtered := False;
      dtmConspart.qryHistSRBGrid01.Filter := sFiltro;
      dtmConspart.qryHistSRBGrid01.Filtered := True;

      bContDetalheSRB01 := False;
   end
   else
   begin
      dtmConspart.qryHistSRBGrid01.Filtered := False;

      if DblkPlanos.Value = 'REG/REPLAN' then
         dtmConspart.qryHistSRBGrid01.Filter := 'TIPO = ' + QuotedStr('T')
      else if DblkPlanos.Value = 'REB' then
        dtmConspart.qryHistSRBGrid01.Filter := 'TIPO = ' + QuotedStr('A') + ' OR TIPO = ' + QuotedStr('T')
      else if DblkPlanos.Value = 'NOVO PLANO' then
        dtmConspart.qryHistSRBGrid01.Filter := 'TIPO = ' + QuotedStr('A') + ' OR TIPO = ' + QuotedStr('T');

      dtmConspart.qryHistSRBGrid01.Filtered := True;

      bContDetalheSRB01 := True;
   end;

    dtmConspart.qryHistSRBGrid01.Locate('MESREFER', sRegistroClicado, []);
    // Felipe A. Santos SOL 208658 Kintana 2018716 - fim
end;

procedure TFRMconspart.dbgrdHistSRB02DblClick(Sender: TObject);
var
   sRegistroClicado: string;
begin
   // Felipe A. Santos SOL 208658 Kintana 2018716
   sRegistroClicado := dtmConspart.qryHistSRBGrid02.FieldByName('MESREFER').AsString;

   if bContDetalheSRB02 then
   begin
      dtmConspart.qryHistSRBGrid02.Filtered := False;
      dtmConspart.qryHistSRBGrid02.Filter := '(TIPO = ' + QuotedStr('T') + ') OR ' +
                                             '(MESREFER = ' + QuotedStr(sRegistroClicado) + ')';
      dtmConspart.qryHistSRBGrid02.Filtered := True;

      bContDetalheSRB02 := False;
   end
   else
   begin
      dtmConspart.qryHistSRBGrid02.Filtered := False;
      dtmConspart.qryHistSRBGrid02.Filter := 'TIPO = ' + QuotedStr('T');
      dtmConspart.qryHistSRBGrid02.Filtered := True;

      bContDetalheSRB02 := True;
   end;

    dtmConspart.qryHistSRBGrid02.Locate('MESREFER', sRegistroClicado, []);
    // Felipe A. Santos SOL 208658 Kintana 2018716 - fim
end;

procedure TFRMconspart.dbgrdHistSRB01CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
     // Felipe A. Santos SOL 208658 Kintana 2018716
     if (dtmConspart.qryHistSRBGrid01.FieldByName('TIPO').AsString = 'T') or
        (dtmConspart.qryHistSRBGrid01.FieldByName('TIPO').AsString = 'A') then
       AFont.Style := [fsBold];
     // Felipe A. Santos SOL 208658 Kintana 2018716 - fim
end;

procedure TFRMconspart.dbgrdHistSRB02CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
     // Felipe A. Santos SOL 208658 Kintana 2018716
     if dtmConspart.qryHistSRBGrid02.FieldByName('TIPO').AsString = 'T' then
       AFont.Style := [fsBold];
     // Felipe A. Santos SOL 208658 Kintana 2018716 - fim
end;

procedure TFRMconspart.HistoricoSRBClick(Sender: TObject);
begin
   //Felipe A. Santos SOL 208658 Kintana 2018716
   NBKelegpart.ActivePage := 'PgHistSRB';
end;

// Andre Imakawa - SIG 25332 - Inicio
procedure TFRMconspart.Entrada1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgPortabEntrada';
end;

procedure TFRMconspart.Sada1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgPortabSaida';
end;
// Andre Imakawa - SIG 25332 - Fim



//edilaine - SIG42986 - inicio
procedure TFRMconspart.AjustaPainelSitAtualTitular;
var
  numLinhas : byte;
begin
   numLinhas := 3;
   if wsStateForm = wsMaximized then
   begin
     numLinhas := Trunc(dbgrdSitAtualTit.height / bvlSitAtualTit.height);
   end;
   dbgrdSitAtualTit.rowCount := numLinhas;
end;

procedure TFRMconspart.FormActivate(Sender: TObject);
begin
  iAlturaIniForm := Self.Height;
  wsStateForm    := Self.WindowState;
end;
//edilaine - SIG42986 - fim


//edilaine WO41032 : inicio
procedure TFRMconspart.CarregarImagemPessoa(CampoImg: TBlobField; FrameImg : TImage);
var
  Bmp: TBitmap;

  function BlobImagemParaBitmap(CampoBlob: TBlobField; Bitmap: TBitmap): Boolean;
  var
    MS: TMemoryStream;
    JPG: TJPEGImage;
    B1, B2, B3: Byte;
  begin
    Result := False;

    if (CampoBlob = nil) or CampoBlob.IsNull then
      Exit;

    MS := TMemoryStream.Create;
    JPG := TJPEGImage.Create;
    try
      CampoBlob.SaveToStream(MS);

      if MS.Size < 3 then
        Exit;

      MS.Position := 0;
      MS.Read(B1, 1);
      MS.Read(B2, 1);
      MS.Read(B3, 1);
      MS.Position := 0;

      { BMP começa com "BM" }
      if (B1 = Ord('B')) and (B2 = Ord('M')) then
      begin
        Bitmap.LoadFromStream(MS);
        Result := True;
      end
      { JPG começa com FF D8 FF }
      else if (B1 = $FF) and (B2 = $D8) and (B3 = $FF) then
      begin
        JPG.LoadFromStream(MS);
        Bitmap.Assign(JPG);  { aqui converte JPEG para BMP em memória }
        Result := True;
      end;
    finally
      JPG.Free;
      MS.Free;
    end;
  end;

begin
  Bmp := TBitmap.Create;
  try
    if BlobImagemParaBitmap(CampoImg, Bmp) then
      FrameImg.Picture.Bitmap.Assign(Bmp)
    else
      FrameImg.Picture := nil;
  finally
    Bmp.Free;
  end;
end;
//edilaine WO41032 : fim

end.
