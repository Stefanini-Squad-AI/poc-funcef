unit FRecebeContribuicao;

// Alterações:

{***************************************************************************************************
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 25/11/2014
Alteração  : VerificaRubricasNaHistRubSal  (inclusão da View VW_RUBXEVENTO)
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba "Incidência de
            Eventos" do cadastro de rubricas salariais
****************************************************************************************************}
{------------------------------------------------------------------------------
Pendência   : SOL 230424 PPM 353071
Responsável : William Moreira da Silva
Data        : 16/04/2014
Descrição   : O sistema não estava permitindo fazer o recebimento via folha gerando erro. 
------------------------------------------------------------------------------
Pendência   : SOL 198559/15217 e 15212 KINTANA 2047009 e 2047282
Responsável : William Moreira da Silva
Data        : 02/10/2013
Descrição   : Correção da validação para 13º
---------------------------------------------------------------------------------------------------
Autor(a)    : André Oliveira
Data        : 11/05/2012
Pendência   : SOL 164351  KITANA 1506587
Descricao   : Inserir campo para data de vencimento ao efetuar uma integração financeira com valor
negativo que gere AP(Contas a Pagar).
---------------------------------------------------------------------------------------------------
Pendência   : Sol 162505 Kintana 1381614
Responsável : Eraldo Luis da Silva
Data        : 31/01/2012
Descrição   : Envio de valores negativos recebidos via folha de pagamento.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 160466 KINTANA 1347998
Responsável : ALINE FREIRE
Data        : 06/07/2011
Descrição   : Implementação da nova funcionalidade para realizar a gravação
              dos campos CENTRO DE CUSTO E PROGRAMA PREVIDENCIAL.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 136185 KINTANA 815495
Responsável : RICARDO CRISTIANO
Data        : 07/10/2010
Descrição   : Implementação da nova funcionalidade do desfaz o envio de contribuições para o CAP/CAR.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 135340 KINTANA 804075
Responsável : BRUNO AZEVEDO
Data        : 13/05/2010
Descrição   : Adicionado condição "AND H.SITRECEBIMENTO >= 1" para trazer a qryTotalPatro.
---------------------------------------------------------------------------------------------------
Autor(a)    : Renato Visoni
Data        : 12/03/2010
Pendência   : SOL 132182 KINTANA 760569
Descricao   : O calculo do valor não estava considerendo o "FLGDEVOLUCAO" e ao rodar o envio para
3 planos sem sair da funcionalidade, o sistema estava fazendo o relacionamento errado dos documentos
pais e filhos.
-------------------------------------------------------------------------------------------------
Autor(a)    : Renato Visoni
Data        : 05/02/2010
Pendência   : SOL 130578 Kintana 734024
Descricao   : Solicito ajustar o processo de integração financeira para quando houver valor negativo
              no montante por plano, o documento que deverá ser gerado é a pagar.
-------------------------------------------------------------------------------------------------
Autor(a)    : Renato Visoni
Autor(a)    : Renato Visoni
Data        : 07/12/2009
Pendência   : SOL 126682  KINTANA 665067
Descricao   : Após integração contábil, apresentar log dos códigos de documentos gerados no CAP/CAR.
-------------------------------------------------------------------------------------------------
Autor(a)    : Renato Visoni
Data        : 02/01/2010
Pendência   : SOL 130015  Kintana 717839
Descricao   : A data dos documentos do PGA deverá ser informada manualmente na tela e os documentos
              filhos serão gerados com a data programada/disponibilidade informada.
-------------------------------------------------------------------------------------------------
Autor(a)    : Ádler Souza
Data        : 20/11/2009
Rotina      : IncluiHSTCONTRIBPREV / AlteraHSTCONTRIBPREV
Pendência   : SOL 127451  KINTANA 675787
Descricao   : Implementação de Variavel para verificar se a função esta vindo por outra tela.
-------------------------------------------------------------------------------------------------
Autor(a)    : Henrique Massão
Data        : 29/05/2009
Rotina      : RetornaIdTitular
Pendência   : SOL 108902  KINTANA 493923
Descricao   : O campo IDTITULAR está sendo inserido na tabela HSTCONTRIBPREV.
-------------------------------------------------------------------------------------------------
Rotina.............: AlteraHSTCONTRIBPREV
N. Sol.............: 18326
N. Kintana.........: 561346
Data...............: 02/06/2009
Responsável........: Renato Visoni
Descrição..........: O sistema estava validando errado a existencia de registros na hstcontribPrev.
----------------------------------------------------------------------------------------------------
Rotina.............: IncluiHSTCONTRIBPREV
N. Sol.............: 101015
N. Kintana.........: 447851
Data...............: 12/11/2008
Responsável........: Daniel Begnami
Descrição..........: Ao inserir o registro na tabela hstcontribprev, o campo mês referência não está
                     sendo preenchido e o campo flgconcessao deverá ser gravado sempre com o valor igual a zero. 
----------------------------------------------------------------------------------------------------
Rotina.............: bbtnReceberClick
N. Sol.............: 94507
N. Kintana.........: 407722
Data...............: 29/08/2008
Responsável........: Daniel Begnami
Descrição..........: Carregar a variavel IDPlanos e Mes de Cobrança do CheckBox
----------------------------------------------------------------------------------------------------
Autor(a)  : André Pontes
Rotina    :
Data      : 01/04/2008
Pendência : 25044
Alteração : 1) Correção da concatenação dos IDs dos planos, cujo código estava faltando
            2) Marcação dos checks "Documentos distintos por dia" e "Efetuar apenas integração". O
               estado de um passa a depender do estado de outro, pois a opção de datas só faz
               sentido se for escolhida "apenas integração"
----------------------------------------------------------------------------------------------------
Autor(a)  : André Pontes
Rotina    : RecebeContribuicao(...) e TotalPatroCAR(...)
Data      : 07/12/2007
Pendência : 27013
Alteração : Aplicação do filtro por plano a todos os recebimentos. Anteriormente, não filtrava
            plano se fosse folha de benefícios
----------------------------------------------------------------------------------------------------
Autor(a)   : André Pontes
Rotina     : TotalPatroCAR(...)
Data       : até 31/10/2007
Pendência  : 25044
Alteração  : Geração de documentos para CaR por Data de Recebimento gravada, em vez de pela data
             indicada na tela
             Só acontece se as opções "Efetuar apenas integração" e "Documentos distintos por dia"
             estiverem marcadas ao mesmo tempo
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : RecebeContribuicao
Data       : 22/08/2007
Pendência  : 26180
Alteração  : Correção no desfazer para apagar as contribuições patronais geradas considerando
             corretamente o lote indicado.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : RecebeContribuicao
Data       : 26/03/2007
Pendência  : 24903
Alteração  : Correção para se nao houve recebimento de NENUM TIPO DE contribuição
             para a Patrocinadora só então dar mensagem e passar para o próximo.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : AlteraHSTCONTRIBPREV
Data       : 06/03/2007
Pendência  : 24646
Alteração  : Acerto para complementar com todos os motivos da folha.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : TotalPatroCar
Data       : 06/03/2007
Pendência  : 24591
Alteração  : Acerto para considerar corretamente o CODTIPDOC.
Autor(a)   : Gleyber
Rotina     : AlteraHSTCONTRIBPREV, FormShow
Data       : 24/11/2006
Pendência  : 23812
Alteração  : Acerto na query qryEnvio.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : AlteraHSTCONTRIBPREV, FormShow
Data       : 27/12/2006
Pendência  : 24051
Alteração  : Acerto para receber saldamento (FUNCEF).
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : VerificaMotivosNaHistContrib
Data       : 18/12/2006
Pendência  : 24010
Alteração  : Correção na query para considerar corretamente o FLGDESCFOLHA.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : AlteraHSTCONTRIBPREV
Data       : 21/11/2006
Pendência  : 23596
Alteração  : Implementação para efetuar o recebimento de contribuições incluidas originalmente
             como sem destinatário.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : RecebeContribuicao
Data       : 19/10/2006
Pendência  : 23549
Alteração  : Correções para acertar o recebimento por lote.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : bbtnDesfazerClick
Data       : 05/09/2006
Pendência  : 23249
Alteração  : Correção na consulta para alterar sitrecebimento na hstcontribprev.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : RecebeContribuicao
Data       : 01/09/2006
Pendência  : 23216
Alteração  : Só atualiza Sitrecebimento, verificando HSTATRASOCONTRIB, para folha de patrocinadora.
----------------------------------------------------------------------------------------------------
Autor(a)   : Claudio Faria
Rotina     : bbtnReceberClick
Data       : 28/07/2006
Pendência  : 22017
Alteração  : Permitir fazer recebimentos por Patrocinadora e plano
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : bbtnDesfazerClick
Data       : 06/07/2006
Pendência  : 22775
Alteração  : Acerto na rotina de desfazer para considerar registros inseridos manualmente no
             histórico de contribuições que tenham recebimento na tabela TMPDESC.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : CobraContribuicaoPatroPart
Data       : 02/06/2006
Pendência  : 21624
Alteração  : Modificação da consulta para verificar se a contribuição foi encerrada no Mês de
             cobrança informada na tela
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : CobraContribuicaoPatroPart
Data       : 25/06/2006
Pendência  : 21624
Alteração  : Comentada a modificação do Léo
----------------------------------------------------------------------------------------------------
Autor(a)   : Leo
Rotina     : CobraContribuicaoPatroPart
Data       : 17/03/2006
Pendência  : 21624
Alteração  : criticar FLGCOBRA no cálculo de contribuições
----------------------------------------------------------------------------------------------------
Autor(a)   : Leo
Rotina     : TotalPatroCAR
Data       : 13/03/2006
Pendência  : 18753
Alteração  : modificação para tratar documento à receber ou à pagar
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : TotalPatroCAR
Data       : 11/01/2006
Pendência  : 19538
Alteração  : Implementação para gravar provisão da conta de abono.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : TotalPatroCAR
Data       : 09/01/2005
Pendencia  : 21205
Alteração  : Desfazendo a alteração do Léo de 14/11/2005 (pendência 20653)
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : RecebeContribuicao e CobraContribuicaoPatroPart
Data       : 13/12/2005
Pendencia  : 21026
Alteração  : Mudança da variável de mesreferencia para a COBRACONTRIBUICAOPATROPART para cobrança
             em folha de benefício.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : AlteraHSTCONTRIBPREV
Data       : 24/11/2005
Pendencia  : 20820
Alteração  : Acerto na comparação do valor recebido com utilização de NVL.
----------------------------------------------------------------------------------------------------
Autor(a)   : Leo
Rotina     : TotalPatroCAR
Data       : 14/11/2005
Pendencia  : 20769
Alteração  : acerto para não acusar erro no envio de devoluções abs(dvalorenviar)
----------------------------------------------------------------------------------------------------
Autor(a)   : Leo
Rotina     : TotalPatroCAR
Data       : 14/11/2005
Pendencia  : 20653
Alteração  : modificação na busca da conta de crédito
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : VerificaDadosIntegracao e BaixaAcertoFalecidos
Data       : 11/11/2005
Pendencia  : 20675
Alteração  : Acerto na query que verifica a existência da contribuição no histórico.
----------------------------------------------------------------------------------------------------
Autor(a)   : Paulo Ramos
Rotina     : VerificaDadosIntegracao e BaixaAcertoFalecidos
Data       : 28/10/2005 a 31/10/2005
Pendencia  : 20564
Alteração  : a) Rotina de verificação da parametrização:
             - tratar mês referência no distinct da Tmpdesc, visto que está replicando
               desnecessariamente as mensagens de ausência de parametrização.
             - efetuar a verificação de TODAS as patrocinadoras antes de iniciar o processo do recebimento.
             - tratar o tipo de desembolso para devolução no CAR apenas para contribuição patronal,
               no caso de Folha de Benefícios.
             - na mensagem de ausência de parametrização, mostrar o nome e o idcontribuicao.
             b) Tratar contribuições patronais oriundas de acerto pós-morte.
----------------------------------------------------------------------------------------------------
Autor(a)   : Leo
Rotina     : geral
Data       : 24/10/2005
Pendencia  : 20576
Alteração  : modificação no recebimento de participantes com desconto na Folha da Fundação. Para casos de participantes cedidos
             que retornam à Patrocinadora em determinado mês, gerando decontos em duas entidades, o sistema precisa de um controle
             para separar estes descontos na hora da integração, já que o IDPESSJUR dos cedidos é sempre  da Patrocinadora.
             A Folha da Fundação gravará sempre o IDMODULO 21 na tmpdesc, gravando ou alterando, o recebimento
             lendo estae IDMODULO, grava o FOLHAORIGEM, temporariamnete, como "F" para que a integração financeira grave a
             entidade como a fundação. Logo a pós a integração, o sistema volta o FOLHAORIGAM para "p".
----------------------------------------------------------------------------------------------------
Autor(a)   : Paulo Ramos
Rotina     : VerificaDadosIntegracao
Data       : 21/10/2005
Pendencia  : 20388
Alteração  : Verificar novo parâmetro de desembolso para devolução no CAR.
----------------------------------------------------------------------------------------------------
Autor(a)   : Paulo Ramos
Rotina     : RecebeContribuicao, AlteraHSTCONTRIBPREV
Data       : 18/10/2005 e 25.10.2005
Pendencia  : 20440
Alteração  : Utilizar o campo NumRecebimento gravado na Tmpdesc, para identificar univocamente
             o Histórico de Contribuição associado.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : CobraContribuicaoPatroPart e bbtnDesfazerClick
Data       : 29/09/2005
Pendencia  : 20371
Alteração  : 1) Alteração da rotina para não gerar contribuições patronais de folha de benefício
                já calculadas pelos eventos de concessão no AdmPrev.
             2) No 'Desfazer Recebimento', separar as rotinas específicas para a folha de benefício
                das que são direcionadas para folha de ativo.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : bbtnDesfazerClick
Data       : 27/09/2005
Pendencia  : 20169
Alteração  : Acertos na rotina de desfazer para deletar registros inseridos apenas pelo AdmPrev
             e acertar situação/valor recebido/data recebimento das demais.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : bbtnDesfazerClick
Data       : 26/09/2005
Pendencia  : 20169
Alteração  : Acertos na rotina de desfazer para deletar registros inseridos apenas pelo AdmPrev
             e acertar situação/valor recebido/data recebimento das demais.
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : bbtnDesfazerClick
Data       : 15/09/2005
Pendencia  : 20169
Alteração  : Inserindo uma rotina de desfazer documento no desfazer individual verificando pra
             isso se o documento só tem aquele participante
----------------------------------------------------------------------------------------------------
Autor(a)   : Gleyber
Rotina     : TotalPatroCAR
Data       : 12/09/2005
Pendencia  : 20169
Alteração  : Inclusão de novo parâmetro (sNaturezaDocumento) na chamada da rotina
              dtmAPrevIntegraBack.BuscaInfIntegra
----------------------------------------------------------------------------------------------------
Autor      : Gleyber
Rotina     : bbtnDesfazerClick
Pendência  : 20068
Data       : 06/09/2005
Descrição  : Correção para desfazer o recebimento de registros inseridos manualmente.
----------------------------------------------------------------------------------------------------
Autor      : Gleyber
Rotina     : IncluiHSTContribPrev
Pendência  : 20099
Data       : 06/09/2005
Descrição  : Implementação nas funcionalidades que incluem na HSTCONTRIBPREV para gravar
             o campo FLGCONCESSÃO. Este campo terá o conteúdo 2 para contribuições inseridas
             pela rotina de recebimento.
----------------------------------------------------------------------------------------------------
Autor      : Gleyber
Rotina     : CobraContribuicaoPatroPart
Pendência  : 19684
Data       : 10/08/2005
Descrição  : Acerto na query qryContribPartPatro para que possa contemplar casos de cobrança de
             contribuição de férias e contribuições em atraso (apenas para Folha de Benefícios)
----------------------------------------------------------------------------------------------------
Autor      : Gleyber
Rotina     : Diversas
Pendência  : 18524
Data       : 14/07/2005
Descrição  : Criação de uma opção para gravar o recebimento com a mesma data
             gravada na TMPDESC. Opção válida apenas para folha de benefício
             e folha da própria fundação.
----------------------------------------------------------------------------------------------------
Autor      : Gleyber
Rotina     : Diversas
Pendência  : 19552
Data       : 13/07/2005
Descrição  : Verificação das mensagens mostradas pelos FrmAguarde
----------------------------------------------------------------------------------------------------
Autor      : Gleyber
Rotina     : bbtnReceberClick e VerificaVencimento
Pendência  : 19562
Data       : 12/07/2005
Descrição  : Criação de rotina para verificar possíveis divergências nos
             nos calendários associados à patrocinadora/plano.
----------------------------------------------------------------------------------------------------
Autor      : Gleyber
Rotina     : TotalPatroCAR
Pendência  : 19595
Data       : 07/06/2005
Descrição  : Acerto na chamada da função FazerInsertContab para considerar se é devolução ou não.
----------------------------------------------------------------------------------------------------
Autor      : Leo
Rotina     : geral
Pendência  : 19521
Data       : 23/06/2005
Descrição  : acerto na cláusula where para pegar participantes cedidos quando no processo
             da fundação a que está cedido e não na patrocinadora de origem
----------------------------------------------------------------------------------------------------
Autor      : Gleyber
Rotina     : bbtnReceberClick
Pendência  : 19411
Data       : 09/06/2005
Descrição  : Acerto na mensagem final para frisar ao usuário a visualização
             do log de erros caso este exista.
----------------------------------------------------------------------------------------------------
Autor      : Gleyber
Rotina     : CobraContribuicaoPatroPart
Pendência  : 19435
Data       : 08/06/2005
Descrição  : Criação de campo virtual FLGATRASODEVOL
----------------------------------------------------------------------------------------------------
Autor      : Leo
Rotina     : TotalPatroCAR
Pendência  : 19154
Data       : 18/05/2005
Descrição  : modificação no lançamento da conta de baixa para o dataset de deocumentos.
             Mesmo que seja uma devolução, a conta de baixa é sempre a conta de débito, para CAR.
             A inversão ocorre na função BuscaInfIntegra porque é necessário para a contabilização.
----------------------------------------------------------------------------------------------------
Autor      : Leo
Rotina     : AlimentaQryDocumentos (chamada)
Data       : 16/052005
Descrição  : tratamento do IDPESSJURCEDIDO
----------------------------------------------------------------------------------------------------
Autor      : Leo
Data       : 16/05/2005
Descrição  : alteração da qrydocumentos e updDocumentos para inclusão do campo IDPESSJURCEDIDO
----------------------------------------------------------------------------------------------------
Rotina      : TotalPatroCAR
Autor(a)    : Leo
Data        : 16/05/2005
Descricao   : modificação da função para enviar os participantes cedidos separadamente, pois estes
              entrarão com o IDFORCLI da patrocinadora a quem está cedido e não amsua patro de origem,
              onde deve ser contabilizado patro/plano
----------------------------------------------------------------------------------------------------
Autor       : Leo
Rotina      : TotalPatroCAR
Data        : 12/05/2005
Descrição   : voltei a modificação que havia feito em 26042005 (FLGDEVOLUCAO), pois percebi que a
              contabilização era feita de forma errada, não invertendo cas contas
----------------------------------------------------------------------------------------------------
Rotina      : TrazDadosParcela
Autor(a)    : Leo
Data        : 12/05/2005
Pendência   : 19180
Descricao   : passagem do último parâmetro, salário atual
----------------------------------------------------------------------------------------------------
Autor       : Leo
Rotina      : tela, testes de integração(bIntegraCAR, bIntegraContab) e gravações de logtotalprev
Data        : 28/04/2005
Pendencia   : 19154
Descrição   : inclusão do filtro, em tela, chkIntegraLocal, que possibilita a inversão
              dos parâmetros de integração contábil/financeira, possibilitando o
              recebimento sem integração sem desmarcar para todo o sistema.
----------------------------------------------------------------------------------------------------
Autor       : Leo
Rotina      : bbtnReceberClick
Data        : 28/04/2005
Pendencia   : 19154
Descrição   : inclusão do filtro, em tela, chkIntegra, que possibilita o processamento apenas da
              integração contábil/financeira
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 28/04/2005
Pendencia   : 19110
Rotina      : bbtnDesfazerClick
Alteração   : acertei a função para não desfazer os registros de entrada manual
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 28/04/2005
Pendencia   : 19154
Rotina      : chamadas da função dtmAPrevIntegraBack.BuscaInfIntegra
Alteração   : passagem do parâmetro sMsgErro para a função dtmAPrevIntegraBack.BuscaInfIntegra, para que esta retorne
              uma possível mensagem de erro, já que ela não aciona mais um MSGDLG diretamente
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 27/04/2005
Pendencia   : 19154
Rotina      : bbtnDesfazerClick
Alteração   : inclui o tratamento para desfazer documentos criados para contribuições
              patronais de assistidos geradas pelo recebimento do admprev.
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 26 a 27/04/2005
Pendencia   : 19154
Rotina      : VerificaDadosIntegracao
Alteração   : criação da rotina VerificaDadosIntegracao, chamada no incio do recebimento, que
              verifica os parâmetros financeiros/contábeis básicos
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 26/04/2005
Pendencia   : 19154
Rotina      : bbtnDesfazerClick, RecebeContribuicao
Alteração   : modificação ads funções para respeitar o filtro de lote, dblkpcmbLote.
----------------------------------------------------------------------------------------------------
Autor       : Leo
Rotina      : TotalPatroCAR
Data        : 26/04/2005
Descrição   : passei o parâmetro FLGDEVOLUCAO fixo como 0, pois sempre lançamos como RECPAG = 'R'
----------------------------------------------------------------------------------------------------
Autor       : Leo
Rotina      : bbtnDesfazerClick
Data        : 25/04/2005
Descrição   : coloquei nvl em duas ocorrências de testes feitos na HSTCONTRIBPREV.FLGMANUAL
----------------------------------------------------------------------------------------------------
Autor       : Leo
Rotina      : RecebeContribuicao
Data        : 25/04/2005
Descrição   : caso o lote esteja selecionado, inclir os registros na HSTCONTRIBPREV com este
----------------------------------------------------------------------------------------------------
Autor      : Leo
Data       : 18/04/2005
Rotina     : Geral
Descrição  : tratamento para trabalhar com planos contábeis diferentes, IDPLANPREVCONTAB
----------------------------------------------------------------------------------------------------
Autor      : Leo
Data       : 15/04/2005
Rotina     : TotalPatroCAR,  e chamadas
Descrição  : comentei as duas primeiras chamadas da função TotalPatroCAR, que passavam o parãmetro existetmpdesc = True
             estas chamads serviam para pegar os rtegistros da tabela TMPDESC e fazer a integração contábil.
             Alterei a função TotalPatroCAR para pegar todos os registros da HSTCONTRIBPREV, mesmo que existam na TMPDESC.

             da forma que estava anteriormente, primeiro o sistema pegava os registros de contribuições da TMPDESC
             para depois pegar os da HSTCONTRIBPREV que não estivessem na TMPDESC, como entradas manuais.
             Isso é desnecessário pois todos os registros devem estar na HSTCONTRIBPREV após a primeira etapa do
             recebimento.
----------------------------------------------------------------------------------------------------
Autor      : Leo
Data       : 13/04/2005
Descrição  : alteração da qrydocumentos e updDocumentos para inclusão do campo RECPAG
----------------------------------------------------------------------------------------------------
Autor       : Leo
Rotina      : bbtnDesfazerClick
Data        : 12/04/2005
Descrição   : alterei a rotina de desfazer para não modificar registros inseridos manualmente
----------------------------------------------------------------------------------------------------
Autor       : Leo
Rotina      : TotalPatroCAR
Data        : 07/04/2005
Descrição   : comentei teste do flgdevolucao
              caso envie a conta de baixa diferente para devoluções, essas ficam
              em documentos diferentes das cobranças
----------------------------------------------------------------------------------------------------
Autor       : Bruno Bastos
Rotina      : RecebeContribuição e AtualizaUltMesPessoa
Data        : 06/04/2005
Pendência   : 18889
Descrição   : Foi colocado uma chamada da função AtualizaUltMesPessoa para
              atualizar o UltMesPreparo da ContribPrevPart, no caso das funda_
              ções que não fazem o preparo/envio das contribuições da patroci_
              nadoras e foi colocado nas condições do update nesta função, um
              filtro pelo UltMesPreparo da ContribPrevPartP
----------------------------------------------------------------------------------------------------
Autor       : Leo
Rotina      : TotalPatroCAR
Data        : 30/03/2005
Descrição   : acrescentei mensagem no caso de erro na descarregadocumentos
----------------------------------------------------------------------------------------------------
Autor       : Leo
Rotina      : AlteraHSTCONTRIBPREV
Data        : 22/03/2005
Descrição   : alteração na crítica do idmotivo para verificar atraso e devolução.
              A hstcontrib só tem a marcação para devolução ou não...caso seja um registro
              de atraso, pode se confundir com a cobrança normal do mês, nos casos da Funcef, pois não existe
              a diferenciação de atrasos e cbranças normais na importação, a não ser pelo motivo...
              como esses parâmetros de motivo dfe atraso e devolução são usados apenas na Funcef, acredito não
              ter modificado a lógica para os demais clientes
----------------------------------------------------------------------------------------------------
Autor       : Bruno Bastos
Rotina      : AtualizaParcelamneto
Data        : 11/03/2005
Descrição   : Acerto na atualização das parcelas pagas do parcelamento
----------------------------------------------------------------------------------------------------
Autor       : Leo
Rotina      : CobraContribuicaoPatroPart
Data        : 23/02/2005
Descrição   : acerto na atualização dos registros já processados.
              o sistema estava atualizando todos os registros da
              hstcontribporev de uma só vez, mas como o recebimento é processado duas vezes, uma para participantes
              e outra para beneficiário, não fazia a parte dos beneficiários por encontrar os registros já atualizados.
              coloquei a atualização da TMPDESC em fases, respeitando a ordem.
----------------------------------------------------------------------------------------------------
Autor       : Gleyber
Rotina      : CobraContribuicaoPatroPart
Data        : 14/02/2005
Pendência   : 18647
Descrição   : Acerto na query que procura contribuições patronais já alimentadas.
----------------------------------------------------------------------------------------------------
Autor       : Gleyber
Rotina      : CobraContribuicaoPatroPart
Data        : 10/12/2004
Pendência   : 18264
Descrição   : Na query que busca a contribuição patronal pertinente, busca apenas o ano da data
              final de contribuição para contribuições de 13º
----------------------------------------------------------------------------------------------------
Autor       : Gleyber
Rotina      : CobraContribuicaoPatroPart
Data        : 10/12/2004
Pendência   : 18265
Descrição   : Quando for 13º verificar se o ano inicial é o mesmo do corrente; se for então entra
              na funcionalidade CalculaContribuicaoACobrarNoMes
----------------------------------------------------------------------------------------------------
Autor       : Gleyber
Rotina      : bbtnReceberClick e bbtnDesfazerClick
Data        : 09/12/2004
Pendência   : 18249
Descrição   : - Na rotina de recebimento verifica se o usuário é o SUPER e avisa ao usuário as
                conseqüencias de continuar com esta operação.
              - Na rotina de desfazer recebimento é verificado se o ano/mês informado na tela é
                é o mesmo que foi parametrizado na PARAMSAL13. Se for então o desfazer realiza
                a atualização do campo ULTANO13 na CONTRIBPREVPARTP.
----------------------------------------------------------------------------------------------------
Autor       : Augusto
Rotina      : AlteraHSTCONTRIBPREV
Data        : 03/11/2004
Descrição   : Acerto nas pesquisas de contribuições a baixar
----------------------------------------------------------------------------------------------------
Autor       : Gleyber
Rotina      : bbtnDesfazerClick
Data        : 19/10/2004
Pendência   : 17694
Descrição   : Acerto no desfazer para apagar registros de contribuições da patronal.
----------------------------------------------------------------------------------------------------
Rotina      : Diversas
Autor(a)    : Camille
Data        : 08.10.2004
Pendência   : 17551
Descricao   : Substituicao das units do back pelas de 3 camadas :
                       U D o c u m e n t o    -> U C t r l D o c u m e n t o
                       U L a n c C o n t a b  -> U C t r l L a n c a m e nt o
----------------------------------------------------------------------------------------------------
Autor       : Gleyber
Rotina      : CobraContribuicaoPatroPart, AlteraHSTCONTRIBPREV
Data        : 16/09/2004
Pendência   : 17695
Descrição   : Acerto no desfazer para pegar o motivo de férias e para pegar o motivo de folha de
              pagamento.
----------------------------------------------------------------------------------------------------
Autor       : Gleyber
Rotina      : CobraContribuicaoPatroPart
Data        : 15/09/2004
Pendência   : 17694
Descrição   : Acerto na rotina de geração de contribuição patronal para folha da patrocinadora.
----------------------------------------------------------------------------------------------------
Autor       : Gleyber
Rotina      : BaixaAcertoFalecidos
Data        : 05/08/2004
Pendência   : 17260
Descrição   : Incluindo na query de update a data de recebimento.
----------------------------------------------------------------------------------------------------
Autor       : Gleyber
Rotina      : CobraContribuicaoPatroPart
Data        : 04/08/2004
Pendência   : 17259
Descrição   : Acerto para verificar previamente a existência do registro na tabela de histórico de
              contribuições independente se foi alimentada ou não.
----------------------------------------------------------------------------------------------------
Autor       : Leo
Rotina      : -----
Data        : 20072004
Descrição   : criação da função AtualizaParcelamento e chamada após recebimento
Data        : 15.07.2004
Descrição   : tratamento do recebimento de contribuições de parcelamento (REFIZ)
----------------------------------------------------------------------------------------------------
Autor       : Camille
Rotina      : -----
Data        : 07.07.2004
Pendência   : 17155
Descrição   : Gerar RAD na inclusao de documentos
----------------------------------------------------------------------------------------------------
Rotina      : bbtnDesfazerClick
Autor(a)    : Gleyber
Pendência   : 17123
Data        : 06/07/2004
Alteração   : Correção para impedir que registros que sejam inseridos manualmente na HSTCONTRIBPREV
              sejam apagados no desfazer.
----------------------------------------------------------------------------------------------------
Rotina      : RecebeContribuicao
Autor(a)    : Gleyber
Pendência   : 17129
Data        : 02/07/2004
Alteração   : Alterado o recebimento da patronal para não procurar o correspondente na HSTBENEF.
----------------------------------------------------------------------------------------------------
Rotina      : AlteraHSTCONTRIBPREV, VerificaMotivosNaHistContrib
Autor(a)    : Gleyber
Pendência   : 17133
Data        : 01/07/2004
Alteração   : Quando for recebimento de Folha de Benefícios passa a considerar além do motivo
              normal (prmIDMOTIVOFOLHABEN) o motivo de devolução (prmIDMOTIVODEVOLBEN)
              Criação de uma rotina para verificar existências de contribuições que estejam com
              motivos que não correspondam a folha escolhida.
----------------------------------------------------------------------------------------------------
Rotina      : bbtnDesfazerClick, FormShow, rgrpTipoFolhaClick
Autor(a)    : Gleyber
Pendência   : 17113
Data        : 30/06/2004
Alteração   : Implementação da rotina de desfazer individual. Só realiza o desfazer da patrocinadora
              se não houver sido escolhido um participante.
              A rotina de desfazer ou receber INDIVIDUAL só deverá funcionar para folha de benefícios,
              por isso o tabsheet só será visualizado se esta opção (folha de benefícios) for escolhida.
----------------------------------------------------------------------------------------------------
Rotina      : CobraContribuicaoPatroPart
Autor(a)    : Gleyber
Pendência   : 17092
Data        : 25/06/2004
Alteração   : Correção no campo MêsReferencia para pegar o mês correto para 13º passado pelo
              parâmetro.
----------------------------------------------------------------------------------------------------
Rotina      : RecebeContribuicao
Autor(a)    : Gleyber
Pendência   : 16911
Data        : 04/06/2004
Alteração   : Alteração para receber contribuições patronais de 13º no encerramento do benefício.
----------------------------------------------------------------------------------------------------
Rotina      : AlteraHSTCONTRIBPREV
Autor(a)    : Gleyber
Pendência   : 16903
Data        : 28/05/2004
Alteração   : Acrescentando um NVL na cláusula FLGDEVOLUCAO.
----------------------------------------------------------------------------------------------------
Rotina      : CobraContribuicaoPatroPart
Autor(a)    : Gleyber
Pendência   : 16741
Data        : 10/05/2004
Alteração   : Acerto na query de contribuições.
----------------------------------------------------------------------------------------------------
Rotina      : RecebeContribuicao
Autor(a)    : Camille
Pendência   : 16704
Data        : 03.05.2004
Alteração   : Acerto na baixa da contribuicao patronal feita por concesssões/eventos
----------------------------------------------------------------------------------------------------
Rotina      : RecebeContribuicao
Autor(a)    : Camille
Pendência   : 16695
Data        : 03.05.2004
Alteração   : Acerto na baixa da contribuicao de falecidos
----------------------------------------------------------------------------------------------------
Rotina      : RecebeContribuicao
Autor(a)    : Camille
Pendência   : 16617
Data        : 16.04.2004
Alteração   : Receber contribuicoes patronais da tmpdesc quando assim estiver
              parametrizado
----------------------------------------------------------------------------------------------------
Rotina      : Diversas
Autor(a)    : Camille
Pendência   : 16411
Data        : 12.04.2004
Alteração   : Nas clausulas que possuem FLGEVENTO = 1 acrescentei um OR FLGMANUAL = 1
              pois a tela de entrada manual não insere esse campo e o recebimento das
              contribuições entradas manualmente não está sendo feito
----------------------------------------------------------------------------------------------------
Rotina      : BaixaAcertoFalecidos
Autor(a)    : Gleyber
Pendência   : 16439
Data        : 07/04/2004
Alteração   : Acerto no tratatamento de comparações de valores (float).
----------------------------------------------------------------------------------------------------
Rotina      : Diversas
Autor(a)    : Camille
Pendência   : 16638
Data        : 05.04.2004
Alteração   : Acertos em tratamento das contribuições patronais
----------------------------------------------------------------------------------------------------
Rotina      : qryContribPartPatro
Autor(a)    : Camille
Pendência   : ----
Data        : 26.03.2004
Alteração   : Acrescentar FLGPARCELAMENTO na qry
----------------------------------------------------------------------------------------------------
Rotina      : AlteraHSTContribPrev e IncluiHSTContribPrev
Autor(a)    : Camille
Pendência   : ----
Data        : 11.03.2004
Alteração   : Atualizar numero de parcelas pagas do parcelamento
----------------------------------------------------------------------------------------------------
Rotina      : RecebeContribuicao
Autor(a)    : Gleyber
Pendência   : 16192
Data        : 08/03/2004
Alteração   : Re-inserida a rotina feita por Ricardo Vigorito originada da pendência
              15568 de 19/01/2004.
              Inserido um commit no final do recebimento da contribuição patronal.
----------------------------------------------------------------------------------------------------
Rotina      : VerificaRubricasNaHistRubSal
Autor(a)    : Gleyber
Pendência   : 16184
Data        : 05/03/2004
Alteração   : Alteração nas queries para pesquisar na CONTPREV apenas as contribuições que tenham
              o FLGPAGADOR = "C" (contribuição do participante);
              Alterado o decode das queries da função para considerar o FLGATRASODEVOL o valor "N"
              para quando o campo MES tiver valor identico ao campo MESCOBRANCA.
----------------------------------------------------------------------------------------------------
Rotina      : AlimentaQryDocumentos
Autor(a)    : Ricardo Vigorito
Pendência   : 16178
Data        : 04/03/2004
Alteração   : Alteração da chamadas da função, incluindo a passagem do idContribuicao
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 19.02.2004
Rotina      : RecebeContribuicao
Pendência   : 16133
Alteração   : Receber contribuicoes de pensionistas
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 11/02/2004
Rotina      : VerificaRubricasNaHistRubSal
Pendência   : 16097
Alteração   : Alterada a função para verificar se o valor não foi inserido na TMPDESC mas existe
              na HISTRUBSAL. Caso exista faz um update na TMPDESC
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 03.02.2004
Rotina      : Diversas
Pendencia   : 16043
Alteração   : Alteracoes para tratar os cedidos
----------------------------------------------------------------------------------------------------
Autor(a)    : LeoFuncef
Data        : 07/01/2004
Rotina      : AlteraHSTCONTRIBPREV
Alteração   : retirei o código que setava a variável balterou como True caso
              fosse altarado o sitrecebimento, mesmo não havendo alteração no valor.
----------------------------------------------------------------------------------------------------
Autor(a)    : Ricardo Vigorito
Data        : 19/01/2004
Rotina      : CobraContribuicaoPatroPart
Alteração   : Inibiu a geração da cobrança da Contribuiçao da Patrocinadora e alterou o recebimento
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 15.01.2004
Rotina      : Diversas
Pendencia   : --- ( Funcef )
Alteração   : Leitura da HistRubSal para verificar se a folha da fundação cobrou contribuicoes
              não enviadas pelo AdmPrev. Se sim, inserir na tmpdesc
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 05/11/2003
Pendência   : 15560
Rotina      : CobraContribuicaoPatroPart
Alteração   : Considera o campo FLGRECECONTPATRO apenas para folha da patrocinadora.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 31/10/2003
Pendência   : 15526
Rotina      : AlteraHSTCONTRIBPREV// Alteração   : Na execução da 2ª query (SITRECEBIMENTO=2) atribui valor para a variavel bAlterou
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 14/10/2003
Pendência   : 15212
Rotina      : bbtnDesfazerClick
Alteração   : Considerar o parâmetro FLGTPVLR da CONTPLANPATRO para apagar do histórico de contribuições
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 09.10.2003
Pendência   :
Alteração   : QRYCONTRIBPATRO - Acrescentei a clausula datafinal is null
              or datafinal >= mescobranca para não cobrar contribuicoes encerradas
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 09.10.2003
Pendência   :
Alteração   : O cálculo das patronais de ativos estava calculando os PID/PIA
              pois estes são mantidos mas quem paga suas contribuições é
              a patrocinadora. Alterei para resolver o erro
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 24/09/2003
Pendência   : 14985
Alteração   : Rotina para questionar o usuário qual data usar para contribuição
              patronal (informada ou calendário)
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 28.08.2003
Alteração   : Passei o campo sitenvio para o mesmo update do flgexistehst para não ter
              que acessar a TMPDESC do mes inteiro, duas vezes
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 27.08.2003
Alteração   : Alteração para não calcular a patronal por participante se a mesma vier no interface
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 23.06.2003
Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
----------------------------------------------------------------------------------------------------
Rotina      : AlteraHSTCONTRIBPREV e IncluiHSTCONTRIBPREV
Autor(a)    : Gleyber
Data        : 20/05/2003
Alteração   : Inclusão do parâmetro de Devolução
----------------------------------------------------------------------------------------------------
Rotina      : RecebeContribuicao
Autor(a)    : Gleyber
Data        : 19/05/2003
Alteração   : Ao desfazer o recebimento considera Tipo de Folha
----------------------------------------------------------------------------------------------------
Rotina      : BaixaAcertoFalecidos
Autor(a)    : Gleyber
Data        : 21/03/2003
Alteração   : Caso a query qryRecebimento esteja vazia não executa a função e
              retorna True;
----------------------------------------------------------------------------------------------------
Rotina      : RecebeContribuicao
Autor(a)    : Camille
Data        : 11.03.2003
Alteração   : Alteração de SP.FLGINTERNO para C.FLGINTERNO
              O flag que tem que ser gravado na HSTCONTRIBPREV é o da CONTPREV
              e não o da situação do participante hoje
----------------------------------------------------------------------------------------------------
Rotina      : AlteraHstContribPrev
Autor(a)    : Camille
Data        : 11.03.2003
Alteração   : Permitir que os registros com nulo no folha origem sejam atualizados
----------------------------------------------------------------------------------------------------
Rotina      : Desfazer Recebimento
Autor(a)    : Augusto
Data        : 14/01/2003
Alteração   : Alteração na Query que exclui o recebimento da patrocinadora.
----------------------------------------------------------------------------------------------------
Rotina      : RecebeContribuicao
Autor(a)    : Leo
Data        : 03.12.2002
Alteração   : tratamento para recebimento de parcelamentos
----------------------------------------------------------------------------------------------------
Rotina      : BaixaAcertoFalecidos
Autor(a)    : Leo
Data        : 31.10.2002
Alteração   : estava pegando o folhaorigem ='F' que não existe, troquei para 'P'
----------------------------------------------------------------------------------------------------
Rotina      : AlteraHstContribPrev
Autor(a)    : Leo
Data        : 22.10.2002
Alteração   : acrescentei a cláusula NVL(FOLHAORIGEM,''P'') = sfolhaorigem
              para tratar casos que foram enviados para patrocinadora e cobrados e folha de benefício
----------------------------------------------------------------------------------------------------
Rotina      : Documento.ForCli.Inserir
Autor(a)    : Leo
Data        : 20/09/2002
Alteração   : troquei o valor do parâmetro de subconta de 0 para -1
----------------------------------------------------------------------------------------------------
Rotina      : BaixaAcertoFalecidos
Autor(a)    : Carlos Guedes
Data        : 02/09/2002
Alteração   : O campo IDMOTIVO não estava na query
----------------------------------------------------------------------------------------------------
Rotina      : bbtnReceberClick
Autor(a)    : Leo
Data        : 02/09/2002
Alteração   : atualizaçlão do salário de participação pela histurbsal
              no caso de recebimento da folha da fundação
----------------------------------------------------------------------------------------------------
Rotina      : CobraContribuicaoPatroPart
Autor(a)    : Leo
Data        : 29/08/2002
Alteração   : coloquei uma crítica para verificar se já houve alimentação de reserva,
              e caso sim impedir a alteração
----------------------------------------------------------------------------------------------------
Rotina      : CobraContribuicaoPatroPart
Autor(a)    : Leo
Data        : 28/08/2002
Alteração   : retirei crítica de ULTMESPREPARO
----------------------------------------------------------------------------------------------------
Rotina      : qryContribPatro
Autor(a)    : Leo
Data        : 28/08/2002
Alteração   : retirei a cláusula --> AND ((CP.ULTMESPREPARO  <= :psMesCobranca ) OR
                                         (CP.ULTMESPREPARO IS NULL) )
----------------------------------------------------------------------------------------------------
Rotina      :
Autor(a)    : Leo
Data        : 04/07/2002
Alteração   : retirei idmotivo das cláusulas WHERE de atualização
              para pegar também registros de tratamentos de divergências que tem idmotivo diferente
----------------------------------------------------------------------------------------------------
Rotina      :
Autor(a)    : Leo
Data        : 04/07/2002
Alteração   : incluí FOLHAORIGEM nos inserts na hstcontribprev
----------------------------------------------------------------------------------------------------
Rotina      : RecebeContribuicao
Autor(a)    : Leo
Data        : 01/07/2002
Alteração   : update da HSTCONTRIBPREV para atualizar  sitrecebimento caso os alteradoes
              tenham sido recebidos com divergências
----------------------------------------------------------------------------------------------------
Rotina      : TotalPatroCAR
Autor(a)    : Leo
Data        : 28/06/2002
Alteração   : alterei query principal nas claúsulas da flha patro
----------------------------------------------------------------------------------------------------
Rotina      : TotalPatroCAR
Autor(a)    : Leo
Data        : 28/06/2002
Alteração   : troquei parâmetro da descarregadocumentos da folhabenef de C para B
----------------------------------------------------------------------------------------------------
Rotina      : RecebeContribuicao
Autor(a)    : Leo
Data        : 27/06/2002
Alteração   : tratamento de cntribuições parte patrocinadora geradas pelas concessões
----------------------------------------------------------------------------------------------------
Rotina      : GravaTotalExclusivaPatro
Autor(a)    : Leo
Data        : 10/06/2002
Alteração   : inslusão de FOLHAORIGEM em todos os inserts e updates da HSTCONTRIBPREV
----------------------------------------------------------------------------------------------------
Rotina      : TotalPatroCAR
Autor(a)    : Leo
Data        : 06/06/2002
Alteração   : alteração das queries de consulta para enviar para financeiro
----------------------------------------------------------------------------------------------------
Rotina      : AlimentaQryDocumentos
Autor(a)    : Leo
Data        : 06/06/2002
Alteração   : alteração das chamadas da função, trocando a conta caso devolução
----------------------------------------------------------------------------------------------------
Rotina      : AlteraHstContribPrev
Autor(a)    : Leo
Data        : 29.05.2002
Alteração   :  Acrescentei a cláusula
               ((IDMOTIVO       = '   + psIdMotivo+') OR (FLGEVENTO = 1)) AND
               para atualizar os registros que vieram de eventos
----------------------------------------------------------------------------------------------------
Rotina      : CobraContribuicaoPatroPart
Autor(a)    : Leo
Data        : 29.05.2002
Alteração   : Mudei ordem de Insert / Update para Update / Insert na HSTCONTRIBPREV
              por que caso fossem contribuições geradas por eventos, o recebimenyto estava
              gerando novamente a parte da patrocinadora
----------------------------------------------------------------------------------------------------
Rotina      : Desfazer Recebimento
Autor(a)    : Camille
Data        : 01.04.2002
Alteração   : Acrescentei tratamentos para folha de beneficio (FLGDESCFOLHA=B)
----------------------------------------------------------------------------------------------------
Rotina      : Recebimento
Autor(a)    : Leonardo
Data        : 27.09.2002
Alteração   : alterei a query contribpartpatro tirando da cláusula where
              a condição "AND (CPP.ULTMESPREPARO  < :ULTMESPREPARO)"
              pois o preparo atualiza este campo e com esta claúsula não estava
              sendo possível o cálculo das contribuições no recebimento
----------------------------------------------------------------------------------------------------
Rotina      : Recebimento
Autor(a)    : Camille
Data        : 19.04.2002
Alteração   : Gravar origem da contribuicao, se é folha de beneficio (B) ou de
              pagamento da patrocinadora (P)
----------------------------------------------------------------------------------------------------
Rotina      : BaixaAcertoFalecidos
Autor(a)    : Camille
Data        : 29.04.2002
Alteração   : Baixar acertos de contribuições de falecidos
----------------------------------------------------------------------------------------------------
Rotina      : Group Box Tipo de Folha
Autor(a)    : Camille
Data        : 29.04.2002
Alteração   : Impedir que sejam rodados os 2 tipos de folha de uma unica vez
---------------------------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, checklst,
  ComCtrls, wwdblook, Spin, Db, DBTables, OpenArqText,
  TB97, URegra, Wwdatsrc, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, IvDictio,
  IvMulti, IvEMulti, Wwquery, wwdbdatetimepicker, CMDateTimePicker,
  ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
  ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, DBGrids, MontaSelect, UCtrlDocumento,
  //RICARDO CRISTIANO SOL 136185 KINTANA 815495
  UCtrlLancamento, FTelaAut,
  //Andre Olivera SOL: 164351 Kintana: 1506587
  uCtrlFinanc, uCtrlContab, uCMTypes,uCMClientDataSet,FPedeDataVencimento;

type
  TfrmRecebeContribuicao = class(TfrmOkCancelar)
    SaveDlg: TSaveDialog;
    qryPatro: TwwQuery;
    qryAux: TwwQuery;
    qryRecebimento: TwwQuery;
    pgctrlOpcoes: TPageControl;
    tbsOpcoes: TTabSheet;
    pnlTabSheet1: TPanel;
    lbPatro: TLabel;
    chklstPatro: TCheckListBox;
    tbsResultado: TTabSheet;
    pnlTabSheet4: TPanel;
    bbtnSalvar: TBitBtn;
    memResult: TMemo;
    qryRegra: TwwQuery;
    qryTotalPatro: TwwQuery;
    qryContribPatro: TwwQuery;
    qryEnvio: TwwQuery;
    regcalculo: TRegra;
    qryContab: TwwQuery;
    qryContabil: TwwQuery;
    qryContabilPLACONTA: TStringField;
    qryContabilCODSUBCONTA: TFloatField;
    qryContabilNOME_1: TStringField;
    qryContabilNOME: TStringField;
    qryContabilLACDEBCRE: TStringField;
    qryContabilLACVALOR: TFloatField;
    qryContabilLACVALHIST: TFloatField;
    qryContabilLACHIST1: TStringField;
    qryContabilLACHIST2: TStringField;
    qryContabilLACHIST3: TStringField;
    qryContabilPLNCODIGO: TFloatField;
    qryContabilLACNUMLAN: TFloatField;
    qryContabilHITCODHIST: TStringField;
    qryContabilIDPESSOA: TFloatField;
    qryContabilIDEMPRESA: TFloatField;
    qryContabilIDMODULO: TFloatField;
    qryContabilUNIDNEGOC: TFloatField;
    qryContabilIDUSUARIOINCLUSAO: TFloatField;
    qryContabilCODCENTROCUSTO: TStringField;
    qryContabilPLANO: TFloatField;
    qryContabilLACTIPO: TStringField;
    qryContabilLACNUMDOC: TStringField;
    qryContabilLACHIST4: TStringField;
    qryContabilLACHIST5: TStringField;
    qryContabilLACTIPCONVOFICIAL: TStringField;
    qryContabilLACVALOFICIAL: TFloatField;
    qryContabilLACTIPCONVGER: TStringField;
    qryContabilLACVALGERENCIAL: TFloatField;
    qryContabilLACTIPCONVGEREN1: TStringField;
    qryContabilLACVALGEREN1: TFloatField;
    qryContabilLACTIPCONVGEREN2: TStringField;
    qryContabilLACVALGEREN2: TFloatField;
    qryContabilLACATOUTMOEDA: TStringField;
    qryContabilLACORIGEMAPLIC: TStringField;
    qryContabilTIPCODIGO: TStringField;
    qryContabilIDELEMDEMONSTRAT: TFloatField;
    qryContabilCODCENTROCUSTO_1: TStringField;
    qryContabilPLNDATDIA: TDateTimeField;
    updContabil: TUpdateSQL;
    updDocumentos: TUpdateSQL;
    qryDocumentos: TwwQuery;
    qryDocumentosCODDOCUMENTO: TFloatField;
    qryDocumentosPLANO: TFloatField;
    qryDocumentosPLACONTA: TStringField;
    qryDocumentosPLNCODIGO: TFloatField;
    qryDocumentosNUMLANCTO: TFloatField;
    qryDocumentosUNIDNEGOC: TFloatField;
    qryDocumentosCODCENTRORESPON: TStringField;
    qryDocumentosCODTIPRECDES: TStringField;
    qryDocumentosVALOR: TFloatField;
    qryPlanPatro: TwwQuery;
    qryContribPartPatro: TwwQuery;
    qryReduzContrib: TwwQuery;
    qryPlanReduz: TwwQuery;
    qryContabilIDPESSJUR: TFloatField;
    qryContabilIDPLANOPREV: TFloatField;
    qryDocumentosIDPESSJUR: TFloatField;
    qryDocumentosIDPLANOPREV: TFloatField;
    Label1: TLabel;
    Panel2: TPanel;
    grpMesAnoRef: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    bbtnReceber: TBitBtn;
    GroupBox3: TGroupBox;
    dtRecebimento: TCMDateTimePicker;
    bbtnDesfazer: TBitBtn;
    qrySalPart: TwwQuery;
    qryDocumentosIDCONTRIBUICAO: TFloatField;
    rgrpTipoFolha: TRadioGroup;
    qryResumoCobr: TwwQuery;
    dsResumoCobr: TwwDataSource;
    ppResumoCobr: TppBDEPipeline;
    rpResumoCobr: TppReport;
    ppHeaderBand3: TppHeaderBand;
    lblTitulo: TppLabel;
    rpResumoCobrDBImage1: TppDBImage;
    rpResumoCobrDBText1: TppDBText;
    rpResumoCobrDBText2: TppDBText;
    rpResumoCobrDBText3: TppDBText;
    rpResumoCobrDBText10: TppDBText;
    rpResumoCobrDBText11: TppDBText;
    rpResumoCobrDBText12: TppDBText;
    rpResumoCobrDBText13: TppDBText;
    rpResumoCobrDBText14: TppDBText;
    rpResumoCobrLabel10: TppLabel;
    ppDetailBand3: TppDetailBand;
    rpResumoCobrDBText5: TppDBText;
    rpResumoCobrDBText7: TppDBText;
    ppDBText156: TppDBText;
    ppDBText157: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLabel5: TppLabel;
    ppCalc3: TppSystemVariable;
    ppLine4: TppLine;
    ppCalc4: TppSystemVariable;
    rpResumoCobrGroup2: TppGroup;
    rpResumoCobrGroupHeaderBand2: TppGroupHeaderBand;
    rpResumoCobrLabel1: TppLabel;
    rpResumoCobrDBText4: TppDBText;
    rpResumoCobrGroupFooterBand2: TppGroupFooterBand;
    ppLabel171: TppLabel;
    rpResumoRecebidoPatro: TppDBCalc;
    rpResumoCobrGroup1: TppGroup;
    rpResumoCobrGroupHeaderBand1: TppGroupHeaderBand;
    rpResumoCobrLabel2: TppLabel;
    rpResumoCobrLabel4: TppLabel;
    rpResumoCobrLabel12: TppLabel;
    rpResumoCobrDBText15: TppDBText;
    rpResumoCobrLine2: TppLine;
    rpResumoCobrLine5: TppLine;
    ppLabel169: TppLabel;
    ppLabel170: TppLabel;
    rpResumoCobrGroupFooterBand1: TppGroupFooterBand;
    rpResumoCobrLabel6: TppLabel;
    rpRecebidoTot: TppDBCalc;
    rpResumoCobrLine3: TppLine;
    rpResumoCobrLine4: TppLine;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    qryDocumentosFLGDEVOLUCAO: TFloatField;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    lblParticip: TLabel;
    Label3: TLabel;
    lblPatro: TLabel;
    lblMatricula: TLabel;
    edNome: TEdit;
    edPlano: TEdit;
    edPatro: TEdit;
    edMatricula: TEdit;
    bbtnProcurar: TBitBtn;
    btndesfazselec: TBitBtn;
    MontaSelectPart: TMontaSelect;
    grpFolhaBen: TGroupBox;
    Label2: TLabel;
    qryLote: TwwQuery;
    dblkpcmbLote: TwwDBLookupCombo;
    qryloop: TwwQuery;
    qryDocumentosRECPAG: TStringField;
    qryDocumentosIDPLANPREVCONTAB: TFloatField;
    GroupBox1: TGroupBox;
    lblIntegraCAR: TLabel;
    lblIntegraContab: TLabel;
    chkIntegra: TCheckBox;
    chkIntegraLocal: TCheckBox;
    qryDocumentosIDPESSJURCEDIDO: TFloatField;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    chkDataRecTmpDesc: TCheckBox;
    chklstPlano: TCheckListBox;
    Label7: TLabel;
    qryPlano: TwwQuery;
    chkOutrosMotivos: TCheckBox;
    chkDocDia: TCheckBox;
    procedure bbtnReceberClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure regCalculoGetResult(sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btndesfazselecClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure grpMesAnoRefExit(Sender: TObject);
    procedure rgrpTipoFolhaClick(Sender: TObject);
    procedure chkIntegraLocalClick(Sender: TObject);
    procedure chklstPatroClickCheck(Sender: TObject);
    procedure chkDocDiaClick(Sender: TObject);
    procedure chkIntegraClick(Sender: TObject);


  private { Private declarations }

    CtrlDocumento           : TCtrlDocumento;  
    CtrlLancamento          : TCtrlLancamento;
    //Inicio - Andre Olivera SOL: 164351 Kintana: 1506587 //inicio
    CtrlDisponFinanc        : TCtrlFinanc;
    CtrlContab              : TCtrlContab;
    //Fim - Andre Olivera SOL: 164351 Kintana: 1506587 //fim
    sAnoMesCobrancaTela,
    sAnoMesCobranca13      : string;

    sTipoPagador           : char; // P - Participante ou Patrocinadora, N - Nucleo Familiar

    sTipoPlano             : string[1];
    sValorEsperado         : string;

    bErro,
    bNaoExisteRecebPatro,
    bNaoExisteRecebNenhum  : boolean;

    rValorEsperado,
    rValorRecebido         : Extended;
    cAuxSeparador          : char;
    sSQL, sValorRecebido   : string;

    iControleCommit        : longint;

    bEscolheuData          : Boolean;   

    bIntegraCAR, bIntegraContab : Boolean;

    function InformacoesOK: boolean;

    procedure CriaLista(
      chkListX: TCheckListBox;
      qryLista: TwwQuery);

    function InterfaceOK(
      iIdPatrocinadora: integer;
      sPatrocinadora: string
      ) : boolean;

    procedure GravaVoltaInterface(
      iIdPatrocinadora,
      iIdLote: integer);

    function RecebeContribuicao(
      iIdPatrocinadora: integer;
      sPatrocinadora,
      psIDPlanos: string
      ): boolean;

    function CobraContribuicaoPatroPart(
      piIdPessJur,
      piIdPlanoPrev: longint;
      psAnoMesReferencia,
      psAnoMesCobranca: string;
      piIdLote: longint;
      pcTipo: char { A - Assistidos, O - Outros }
      ): boolean;

    function IncluiHSTCONTRIBPREV(
      qryInclusao: TwwQuery;
      psValor: string;
      pcOrigem: char; // t - tempdesc c - calculo
      piIdLote: longint;
      var bIncluiu: boolean;
      psFlgDevolucao: string;           
      psFlgConcessao: string
      ): boolean;

    function AlteraHSTCONTRIBPREV(
      qryAlteracao : TwwQuery;
      var bAlterou : boolean;
      psValorEsperado, // caso esteja na query passar branco
      psValorRecebido,
      psIdMotivo : string;
      psFlgDevolucao : string;        
      aiNumRecebimento: integer;      
      psIdLote : string = ''          
      ): boolean;

    function GravaTotalExclusivaPatro(
      iIdPessJur: integer;
      sIDPlanos: string   
      ): boolean;

    function TotalPatroCAR(
      iIdPatroAtu,
      iFlgAceitaNaoIdent: integer;
      sNomePatro,
      sTipoContrib,
      psFlgPagador,
      psIDPlanos: string;  // ClaudioR - 26/07/2006 - CM 22017
      bExisteTmpDesc: boolean;
      bCedidos: Boolean
      ): boolean;

    function AtualizaUltMesPessoa(
      sIdPessJur,
      sIdPlanoPrev,
      sIdPessoa,
      sIdContribuicao,
      psAnoMesReferencia,
      psAnoMesCobranca: string
      ): boolean;

    function ContabilizaContribPATRO(
      piIdPessJur: longint;
      psIDPlanos:string // ClaudioR - 26/07/2006 - CM 22017
      ): boolean;

    function BaixaAcertoFalecidos(
      piIdPessJur: longint
      ): boolean;

    function AlteraHSTATRASOCONTRIB(
      qryAlteracao: TwwQuery;
      var bAlterou: boolean;
      psValorEsperado, // caso esteja na query passar branco
      psValorRecebido,
      psIdMotivo: string
      ): boolean;

    function VerificaRubricasNaHistRubSal: boolean;

    function VerificaMotivosNaHistContrib(
      piIdPessjur: Integer
      ): Boolean; 

    function AtualizaParcelamento(
      qryAux: twwquery;
      sAnoMesCobrancaTela: string;
      iIdPessjur: Integer
      ): Boolean;

    function VerificaDadosIntegracao(
      qryAux: twwquery;
      sAnoMesCobrancaTela: string;
      iIdPessjur: Integer
      ): Boolean;

    function VerificaVencimento(
      piIdPessjur: Integer;
      sIDPlanos: string//William Moreira da Silva - SOL 230424 PPM 353071
      ): Boolean;


    // Aline Freire SOL 160466 KINTANA 1347998
    // Funtion que retorna o valor de Centro de Custo
    function BuscaCentroCusto(
      idPessoaJur:integer;
      idPlanoPrev:integer;
      idDesconto:integer):string;

    procedure IntegraPGA(iCodDocumento:integer;var iDocPagar:integer;var iDocReceber:integer);
   //inicio - Andre Olivera SOL: 164351 Kintana: 1506587
      function ValidarDataVencimento() :string;

    procedure PedeDataVencimento(sCaptionForm, sTituloInf1: string;
      var iValor: Integer; var sData: string);
    //fim -Andre Olivera SOL: 164351 Kintana: 1506587

  public  { Public declarations }

   //RICARDO CRISTIANO SOL 136185 KINTANA 815495
   sIDPlanosDesfDoc : String;
   
   listaDocumento : TStringList; // Renato Visoni SOL 130015  Kintana 717839
   sMsg : String; // Renato Visoni SOL 126682  KINTANA 665067

   strCentroCusto:String; // Aline Freire SOL 160466 KINTANA 1347998
   sObservacaoDocum : String; // Douglas.siqueira Sol 162505 Kintana 1381614
  end;




var
  frmRecebeContribuicao: TfrmRecebeContribuicao;




implementation
{$R *.DFM}
uses 
  UMensErro, UDataBase, UAdmPrev, FLerSituacaoPlano, DPreparaContrib,
  DBaseDados, USistema, UModulo, UContribuicaoPrev, UIntegraBack,
  fAguarde, DAPrev, uSincronismo, UParticipante,
  //RICARDO CRISTIANO SOL 136185 KINTANA 815495
  DAPrevIntegraBack, FParcelamento, UFuncoesUteis, FDesfDocContribuicao,fObservacaoDocum;



{ ****************************** FUNCOES AUXILIARES ******************* }
function  TfrmRecebeContribuicao.InterfaceOK(iIdPatrocinadora : integer; sPatrocinadora : string) : boolean;
begin
   Result := False;
   with qryAux do
   begin
      Close;
      SQL.Clear;
      // Verificar se existem lotes que voltaram da patrocinadora e ainda nao
      // foram recebidos
      SQL.Add(' SELECT COUNT(IDLOTE) AS QUANTLOTE FROM CTRLINTERFACE '+
              ' WHERE  (MESREFERENCIA = '''+sAnoMesCobrancaTela+''') AND '+
              '        (TIPO          = ''P'' ) AND '+
              '        (FLGVOLTATMP   = 0 )    AND '+
              '        (IDPESSOA      = '+IntToStr(iIdPatrocinadora)+')');
      Open;
      if IsEmpty
      then begin // O interface desta patrocinadora não foi enviado
         Close;
         MsgDlg(' [AVISO] Não existem contribuições da patrocinadora '+sPatrocinadora+
                ' pendentes de recebimento até o momento. Verifique o Controle de Cobrança.',
                'Informação',mtInformation,[mbOk, mbHelp],0 );
         Exit;
      end //then - if IsEmpty
   end;//with
   Result := True;
end;//InterfaceOK



procedure TfrmRecebeContribuicao.GravaVoltaInterface(iIdPatrocinadora, iIdLote : integer);
begin
   // Atualizar tabela CTRLINTERFACE
   // Gravar flgVOLTATMP = True da patrocinadora na tabela CTRLNTERFACE
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE CTRLINTERFACE SET FLGVOLTATMP = 1, ' +
              '                          DATAVOLTATMP = SYSDATE ' +
              ' WHERE MESREFERENCIA = '''+sAnoMesCobrancaTela+''' AND ' +
              '       IDLOTE = '+IntToStr(iIdLote)+' AND ' +
              '       TIPO = ''P'' AND ' +
              '       IDPESSOA = '+IntToStr(iIdPatrocinadora));
      try
        ExecSQL;
      except
        memResult.Lines.Add(' Erro Específico da Patrocinadora[GRAVAÇÃO DO CONTROLE DE INTERFACE]');
        bErro := True;
      end;
   end;
end; //GravaVoltaInterface



procedure TfrmRecebeContribuicao.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
begin
  chkListX.Items.Clear;
  with qryLista do
  begin
     while not EOF do
     begin
        chkListX.Items.Add(FieldByName('Nome').AsString);
        Next;
     end;
  end;
end;

function TfrmRecebeContribuicao.InformacoesOk : boolean;
begin
   Result := False;
   if Trim(cmbMesCob.Text) = ''
   then begin
     MsgDlg('Mês de Referência do Recebimento não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     cmbMesCob.SetFocus;
     Exit;
   end;

   if Trim(spedAnoCob.Text) = ''
   then begin
     MsgDlg('Ano de Referência do Recebimento não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     spedAnoCob.SetFocus;
     Exit;
   end;

   Result := True;
end;

{ ****************************** FUNCOES DE COBRANÇA    ******************* }
function TfrmRecebeContribuicao.RecebeContribuicao(iIdPatrocinadora : integer;
                                                   sPatrocinadora,
                                                   psIDPlanos       : string) : boolean;


var
   bAlterou,
   bIncluiu,
   bReceContPartPatro,
   bTem13Assistido,                 
   bOk                    : boolean;

   iIdLoteAnterior,
   iIdLoteAtual,
   iIdNovoLote            : integer;
   sFlgDescFolha,
   sUltMesPreparo,
   sAnoMesAux,
   sDataVencimentoPatro,

   sSQL, sTipoFolha       : string;
   sflgdevol              : string; 
begin
   Result := False;

   frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                     'Verificando recebimentos ...');

   if rgrpTipoFolha.ItemIndex = 0
   then sFlgDescFolha := ' (T.FLGDESCFOLHA = ''P'') '
   else sFlgDescFolha := ' (T.FLGDESCFOLHA = ''B'') ';

   //William Moreira da Silva - SOL 230424 PPM 353071
   if rgrpTipoFolha.ItemIndex = 0
      then  sTipoFolha := 'PT'
      Else  sTipoFolha := 'AS';
   //William Moreira da Silva - SOL 230424 PPM 353071

   // RECEBER CONTRIBUICAO DO PARTICIPANTE
   // Selecionar registros da TMPDESC das contribuições da patrocinadora em questão
   qryRecebimento.Close;
   qryRecebimento.SQL.Clear;
   if sTipoPagador = 'P' 
   then begin
      qryRecebimento.SQL.Add(
               ' SELECT T.CODPROVDESC,     T.CODALTERADOR,    T.FLGALTERADOR,     T.FLGATRASODEVOL,                         '+
               '        T.FLGDESCFOLHA,    T.FLGDESCONTO,     T.FLGTIPODESC,                                                '+
               '        T.IDDESCONTO,      T.IDFUNDACAO,      T.IDMOTIVO,         T.IDPESSJUR,                              '+
               '        T.IDPESSOA,        T.IDPLANOPREV,     T.IDPROVENTO,       T.IDTITULAR,                              '+
               '        T.INSCRICAONUMERO, T.MATRICULA,       T.MESCOBRANCA,      T.MESREFERENCIA,                          '+
               '        T.NUMPRIORIDADE,   T.ORDEM,           T.SISTORIGEM,       T.VALOR,                                  '+
               '        T.CODPORTFORMA,    T.CODTIPDOC,       T.CODTIPRECDES,     T.RECPAG,                                 '+
               '        T.VALORBASE1,      T.VALORBASE2,      T.VALORBASE3,       T.DATAREFERENCIA,                         '+
               '        T.DESCRICAO,       T.REFERENCIA,      T.CODCENTROCUSTOC,  T.CODCENTROCUSTOD,                        '+
               '        T.CODCENTRORESPON, T.CODSUBCONTA,     T.IDEMPRESA,        T.IDEMPRESAPROP,                          '+
               '        T.PLACONTAC,       T.PLACONTAD,       T.PLANO,            T.UNIDNEGOC,                              '+
               '        T.DATACOBRANCA,    T.NODOCUMENTO,     T.COMPLDOCUMENTO,                                             '+
               '        T.VALORRECEBIDO,   T.DATARECEBIMENTO, T.CODDOCUMENTOPREV, T.CODDOCUMENTOEFET,                       '+
               '        T.PLNCODIGOPREV,   T.PLNCODIGOEFET,   C.IDCONTRIBPAI,     T.IDLOTE ,T.SEQPROPOSTA,                  '+
               '        T.FLGEXISTEHST,    C.FLGINTERNO,      C.ORDEMCALCULO,     C.IDREGRACALCULO,                         '+ 
               '        PP.INSCRICAODATA,  CPP.VALORBASE1,    CPP.VALORBASE2,     CPP.VALORBASE3,                           '+
               '        CPP.DATAINICIO,    CPP.DATAFINAL ,                                                                  '+
               '        T.NUMRECEBIMENTO, '+#13#10+ 
               '        C.VLRACEITADIVERG ,                                                                                 '+
               '        NVL(C.FLGPARCELAMENTO,0) FLGPARCELAMENTO,                                                            '+
               '        T.IDMODULO '+ 
               ' FROM   SITPART SP, CONTPREV C, ELEGPATRO EL, PARTPREVPLAN PP, TMPDESC  T, CONTRIBPREVPARTP CPP,            '+
               '        PLANPREVPATRO PLP                                                                                   '+ 
               ' WHERE  ( ( (EL.IDPESSJUR       = '+ IntToStr(iIdPatrocinadora)+') AND (EL.IDPESSJURCEDIDO IS NULL) ) OR    '+ 
               '            (EL.IDPESSJURCEDIDO = '+ IntToStr(iIdPatrocinadora)+')                                          '+ 
               '        )                                                                                                   '+ 
               ' AND    (T.MESCOBRANCA          = '''+sAnoMesCobrancaTela+''')                                              '+ 
               ' AND    (T.IDPESSJUR            = EL.IDPESSJUR)                                                             '+ 
               ' AND    (T.IDPESSOA             = EL.IDPESSOA)                                                              '+ 
               ' AND    (PLP.IDPESSJUR          = T.IDPESSJUR)                                                              '+
               ' AND    (PLP.IDPLANOPREV        = T.IDPLANOPREV)                                                            '+
               ' AND    ((C.FLGPAGADOR           = ''C'') OR ( (PLP.FLGRECECONTPATRO = 1) AND (C.FLGPAGADOR = ''P'') ) )    '+ 
               ' AND    ( (T.SITENVIO           = ''2'') OR (T.SITENVIO = ''1'' AND T.VALORRECEBIDO <> 0) )                 '+
               ' AND    NVL(T.VALORRECEBIDO,0)  > 0                                                                         '+
               ' AND    (T.FLGTIPODESC          = ''P'''+')                                                                 '+
               ' AND    (PP.IDPESSOA(+)         = T.IDPESSOA)                                                               '+
               ' AND    (PP.IDPLANOPREV(+)      = T.IDPLANOPREV)                                                            '+
               ' AND    (PP.IDPESSJUR(+)        = T.IDPESSJUR)                                                              '+
               ' AND    (PP.SEQPROPOSTA(+)      = T.SEQPROPOSTA)                                                            '+
               ' AND    (PP.IDSITPART           = SP.IDSITPART )                                                            '+
               ' AND    (C.IDPLANOPREV          = T.IDPLANOPREV)                                                            '+
               ' AND    (C.IDCONTRIBUICAO       = T.IDDESCONTO  )                                                           '+
               ' AND    (T.SEQPROPOSTA          = CPP.SEQPROPOSTA(+) )                                                      '+ 
               ' AND    (T.IDPESSJUR            = CPP.IDPESSJUR(+) )                                                        '+ 
               ' AND    (T.IDPLANOPREV          = CPP.IDPLANOPREV(+) )                                                      '+ 
               ' AND    (T.IDDESCONTO           = CPP.IDCONTRIBUICAO(+) )                                                   '+ 
               ' AND    (T.IDTITULAR            = CPP.IDPESSOA(+) )                                                         '+ 
               ' AND '+sFlgDescFolha                                                                                         );


      // if rgrpTipoFolha.ItemIndex = 0 then  // André Pontes - pendência 27013 - 07/12/2007 (retirado)
         qryRecebimento.SQL.Add(' AND    (T.IDPLANOPREV IN (' + psIDPlanos + '))                                            ');

      if Trim(dblkpcmbLote.Text) <> ''
      then qryRecebimento.SQL.Add(' AND T.IDLOTE = '+OraNumero(qryLote.FieldByName('IDLOTE').AsString) );

      if Trim(edNome.Text) <> '' 
      then qryRecebimento.SQL.Add(' AND T.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+
                                  ' AND T.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1])+
                                  ' AND T.IDPESSOA    = '+OraNumero(MontaSelectPart.ValoresChave[2])+
                                  ' AND T.SEQPROPOSTA = '+OraNumero(MontaSelectPart.ValoresChave[3]));

      qryRecebimento.SQL.Add(' ORDER BY T.IDLOTE, C.ORDEMCALCULO,  T.IDPESSOA                                                              ');
   end
   else begin // receber nucleo familiar
      qryRecebimento.SQL.Add(
               ' SELECT T.CODPROVDESC,     T.CODALTERADOR,    T.FLGALTERADOR,     T.FLGATRASODEVOL,                         '+
               '        T.FLGDESCFOLHA,    T.FLGDESCONTO,     T.FLGTIPODESC,                                                '+
               '        T.IDDESCONTO,      T.IDFUNDACAO,      T.IDMOTIVO,         T.IDPESSJUR,                              '+
               '        T.IDPESSOA,        T.IDPLANOPREV,     T.IDPROVENTO,       T.IDTITULAR,                              '+
               '        T.INSCRICAONUMERO, T.MATRICULA,       T.MESCOBRANCA,      T.MESREFERENCIA,                          '+
               '        T.NUMPRIORIDADE,   T.ORDEM,           T.SISTORIGEM,       T.VALOR,                                  '+
               '        T.CODPORTFORMA,    T.CODTIPDOC,       T.CODTIPRECDES,     T.RECPAG,                                 '+
               '        T.VALORBASE1,      T.VALORBASE2,      T.VALORBASE3,       T.DATAREFERENCIA,                         '+
               '        T.DESCRICAO,       T.REFERENCIA,      T.CODCENTROCUSTOC,  T.CODCENTROCUSTOD,                        '+
               '        T.CODCENTRORESPON, T.CODSUBCONTA,     T.IDEMPRESA,        T.IDEMPRESAPROP,                          '+
               '        T.PLACONTAC,       T.PLACONTAD,       T.PLANO,            T.UNIDNEGOC,                              '+
               '        T.DATACOBRANCA,    T.NODOCUMENTO,     T.COMPLDOCUMENTO,                                             '+
               '        T.VALORRECEBIDO,   T.DATARECEBIMENTO, T.CODDOCUMENTOPREV, T.CODDOCUMENTOEFET,                       '+
               '        T.PLNCODIGOPREV,   T.PLNCODIGOEFET,   C.IDCONTRIBPAI,     T.IDLOTE ,T.SEQPROPOSTA,                  '+
               '        T.FLGEXISTEHST,    C.FLGINTERNO,      C.ORDEMCALCULO,     C.IDREGRACALCULO,                         '+ 
               '        CPP.DATAINICIO AS INSCRICAODATA,  0 VALORBASE1,    0 VALORBASE2,     0 VALORBASE3,                  '+
               '        CPP.DATAINICIO,    CPP.DATAFINAL ,                                                                  '+
               '        T.NUMRECEBIMENTO, '+#13#10+ 
               '        C.VLRACEITADIVERG ,                                                                                 '+
               '        NVL(C.FLGPARCELAMENTO,0) FLGPARCELAMENTO,                                                            '+ 
               '        T.IDMODULO '+ 
               ' FROM   CONTPREV C, TMPDESC  T, NUCLEOFAMILIAR N, CONTRIBPREVNUCLEO CPP                                     '+
               ' WHERE  T.IDPESSJUR          = '+ IntToStr(iIdPatrocinadora)                                                 +
               ' AND    (T.MESCOBRANCA          = '''+sAnoMesCobrancaTela+''')                                              '+ 
               ' AND    ( (T.SITENVIO           = ''2'') OR (T.SITENVIO = ''1'' AND T.VALORRECEBIDO <> 0) )                 '+
               ' AND    NVL(T.VALORRECEBIDO,0)  > 0                                                                         '+
               ' AND    (T.FLGTIPODESC          = ''P'''+')                                                                 '+
               ' AND    (C.FLGPAGADOR           = ''C''      )                                                              '+ 
               ' AND    (C.IDPLANOPREV          = T.IDPLANOPREV)                                                            '+
               ' AND    (C.IDCONTRIBUICAO       = T.IDDESCONTO  )                                                           '+
               ' AND    (N.IDRESPNUCLEO         = T.IDPESSOA    )                                                           '+
               ' AND    (CPP.IDNUCLEOFAMILIAR   = N.IDNUCLEOFAMILIAR  )                                                     '+
               ' AND    (CPP.IDCONTRIBUICAO     = T.IDDESCONTO  )                                                           '+
               ' AND '+sFlgDescFolha                                                                                         );

      // if rgrpTipoFolha.ItemIndex = 0 then // André Pontes - pendência 27013 - 07/12/2007 (retirado) 
         qryRecebimento.SQL.Add(' AND    (T.IDPLANOPREV IN (' + psIDPlanos + '))                                      ');

      if Trim(dblkpcmbLote.Text) <> ''
      then qryRecebimento.SQL.Add(' AND T.IDLOTE = '+OraNumero(qryLote.FieldByName('IDLOTE').AsString) );

      if Trim(edNome.Text) <> '' 
      then qryRecebimento.SQL.Add(' AND T.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+
                                  ' AND T.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1])+
                                  ' AND T.IDPESSOA    = '+OraNumero(MontaSelectPart.ValoresChave[2])+
                                  ' AND T.SEQPROPOSTA = '+OraNumero(MontaSelectPart.ValoresChave[3]));

      qryRecebimento.SQL.Add(' ORDER BY T.IDLOTE, C.ORDEMCALCULO,  T.IDPESSOA                                                              ');
   end;

   qryRecebimento.Open;

   if sTipoPagador <> 'N'
   then bNaoExisteRecebPatro := qryRecebimento.IsEmpty; // Variavel que diz se a patrocinadora possui contribuições a serem recebidas.

   if bNaoExisteRecebPatro
   then begin
      frmAguarde.Apaga;
      memResult.Lines.Add('[AVISO] - '+qryPatro.FieldbyName('NOME').AsString+' : '+
                         ' nenhuma contribuição encontrada pendente de recebimento. ');
      Result := True;
      Exit;
   end;
   // Variavel que diz se a alguma patrocinadora possui contribuições a serem recebidas.
   if bNaoExisteRecebNenhum
   then bNaoExisteRecebNenhum := qryRecebimento.IsEmpty;

   qryRecebimento.First;
   iIdLoteAnterior := qryRecebimento.FieldByName('IdLote').AsInteger;
   frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                      'Recebendo Contribuições do Lote '+IntToSTr(iIdLoteAnterior)+' ... ');

   iControleCommit := 0;

   frmAguarde.pbAguarde.Min      := 0;
   frmAguarde.pbAguarde.Position := 0;
   frmAguarde.pbAguarde.Step     := 1;
   frmAguarde.pbAguarde.Max      := qryRecebimento.RecordCount;
   frmAguarde.pbAguarde.Visible  := True;

   qryRecebimento.First;

   bTem13Assistido := False;  

   while not qryRecebimento.EOF do
   begin

      if (Not bTem13Assistido) and
         (rgrpTipoFolha.ItemIndex = 1) and
         (Copy(qryRecebimento.FieldByName('MESREFERENCIA').AsString,6,2)='13')
       then bTem13Assistido := True;

      frmAguarde.pbAguarde.Position  := frmAguarde.pbAguarde.Position + 1; 
      Application.ProcessMessages;
      // Se mudou o lote -> gravar flgvoltatmp
      iIdLoteAtual := qryRecebimento.FieldByName('IdLote').AsInteger;
      inc(iControleCommit);

      if qryRecebimento.FieldByName('FLGATRASODEVOL').AsString = 'D'
       then sFlgDevol := '1'
       Else sFlgDevol := '';


      if iControleCommit >= 1000
      then begin
         if dtmBaseDados.dbBaseDados.InTransaction
         then begin
            dtmBaseDados.dbBaseDados.Commit;
            dtmBaseDados.dbBaseDados.StartTransaction;
         end;
         iControleCommit := 1;
      end;

      if (iIdLoteAtual <> iIdLoteAnterior)
      then begin
         // Gravar volta na Controle de Interface
         frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                           'Gravando controle de contribuições ... ');

         GravaVoltaInterface(qryPatro.FieldByname('IDPESSOA').AsInteger, iIdLoteAnterior);

         // Atualizar o ctrl de interface
         with qryAux do begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE CTRLINTERFACE SET FLGIDATMP    = 1,' +
                    '                          DATAIDATMP   = SYSDATE,' +
                    '                          FLGPREPARADO = 1,' +
                    '                          DATAPREPARO  = SYSDATE' +
                    ' WHERE IDLOTE = ' + IntToStr(iIdLoteAnterior) );
            try
              ExecSQL;
            except
              bErro := True;
              frmAguarde.Apaga; 
              Exit;
            end;
         end;

         frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                          'Recebendo Contribuições do Lote '+IntToSTr(iIdLoteAtual)+' ... ');
      end;

      // tratamento para alterador
      if  Trim(qryRecebimento.fieldbyname('codalterador').AsString) <> '' then
      begin
         if not AlteraHSTATRASOCONTRIB(qryRecebimento, bAlterou,'','',
                                       qryRecebimento.fieldbyname('idmotivo').AsString)
         then begin
            memResult.Lines.Add('[ERRO ] - Atualização do alterador - Recebimento Nº : '+qryRecebimento.FieldByName('NODOCUMENTO').AsString);
            iIdLoteAnterior := qryRecebimento.FieldByName('IdLote').AsInteger;
            qryRecebimento.Next;
            bErro := True;
            Continue;
         end;
      end
      else begin
         // Gravar recebimento de contribuição do Participante na tabela HSTCONTRIBPREV
         if not AlteraHSTCONTRIBPREV(qryRecebimento, bAlterou,'','',
                                     qryRecebimento.fieldbyname('idmotivo').AsString,
                                     sFlgDevol,   
                                     qryRecebimento.fieldbyname('NumRecebimento').asinteger 
                                     )
         then begin
         end;

         if not bAlterou
         then begin
            if not IncluiHSTCONTRIBPREV(qryRecebimento,'','T',qryRecebimento.FieldByName('IdLote').AsInteger,
                                        bIncluiu, sFlgDevol,
                                        '0' // '2' Daniel Begnami SOL:101015
                                        )
            then begin
               memResult.Lines.Add('[ERRO ] - Inserção no Histórico - Recebimento Nº : '+qryRecebimento.FieldByName('NODOCUMENTO').AsString);
               iIdLoteAnterior := qryRecebimento.FieldByName('IdLote').AsInteger;
               qryRecebimento.Next;
               bErro := True;
               Continue;
            end;

            if not AtualizaUltMesPessoa(qryRecebimento.FieldByName('IDPESSJUR').AsString,
                                 qryRecebimento.FieldByName('IDPLANOPREV').AsString,
                                 qryRecebimento.FieldByName('IDPESSOA').AsString,
                                 qryRecebimento.FieldByName('IDDESCONTO').AsString,
                                 qryRecebimento.FieldByName('MESREFERENCIA').AsString,
                                 qryRecebimento.FieldByName('MESCOBRANCA').AsString)
            then begin
               memResult.Lines.Add('[ERRO ] - Atualização na ContribPrevPartP - Recebimento Nº : '+qryRecebimento.FieldByName('NODOCUMENTO').AsString);
               iIdLoteAnterior := qryRecebimento.FieldByName('IdLote').AsInteger;
               qryRecebimento.Next;
               bErro := True;
               Continue;
            end;
         end;
      end;


      iIdLoteAnterior := qryRecebimento.FieldByName('IdLote').AsInteger;
      qryRecebimento.Next;
   end;//while
   // Fim - RECEBER CONTRIBUICAO DO PARTICIPANTE

   if dtmBaseDados.dbBaseDados.InTransaction
   then begin
      dtmBaseDados.dbBaseDados.Commit;
      dtmBaseDados.dbBaseDados.StartTransaction;
   end;

   if rgrpTipoFolha.ItemIndex = 0
    then begin
      frmAguarde.pbAguarde.Visible  := False;
      frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                             'Atualizando Situação do Recebimento ... ');

      //atualiza sitrecebimento dos registros da HSTCONTRIBPREV para
      //3, caso tenha alteradores recebidos parcialmente
      with qryAux do begin
         Close;
         SQL.Clear;
         SQL.Add(' UPDATE HSTCONTRIBPREV H SET H.SITRECEBIMENTO = ''3''                  '+ #13 +
                 ' WHERE  H.IDPESSJUR = '''+IntToStr(iIdPatrocinadora)+'''               '+ #13 +
                 ' AND    H.MESCOBRANCA = '''+sAnoMesCobrancaTela+'''                    '+ #13 +
                 ' AND    H.SITRECEBIMENTO = ''2''                                       '+ #13 +
                 ' AND    H.IDPLANOPREV IN (' + psIDPlanos + ')                          '+ #13 +
                 ' AND    EXISTS ( SELECT 1 FROM HSTATRASOCONTRIB HA                     '+ #13 +
                 '                 WHERE  HA.MESCOBRANCA    = H.MESCOBRANCA              '+ #13 +
                 '                 AND    HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO           '+ #13 +
                 '                 AND    NVL(HA.VALOR,0)   <> NVL(HA.VALORRECEBIDO,0) ) ');

         if Trim(edNome.Text) <> '' 
         then SQL.Add(' AND H.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+ #13 +
                      ' AND H.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1])+ #13 +
                      ' AND H.IDPESSOA    = '+OraNumero(MontaSelectPart.ValoresChave[2])+ #13 +
                      ' AND H.SEQPROPOSTA = '+OraNumero(MontaSelectPart.ValoresChave[3]));

         if Trim(dblkpcmbLote.Text) <> ''
          then SQL.Add(' AND H.IDLOTE   = '+OraNumero(qryLote.FieldByName('IDLOTE').AsString) );

         try
           ExecSQL;
         except
           memResult.Lines.Add('[ERRO ] - Atualização dos registros com divergências em alteradores.');
           bErro := True;
           frmAguarde.Apaga; 
           Exit;
         end;
         memResult.Lines.Add('[OK   ] - Atualização dos registros com divergências em alteradores.');


         Close;
         SQL.Clear;
         SQL.Add(' UPDATE HSTCONTRIBPREV H SET H.SITRECEBIMENTO = ''2''                   '+
                 ' WHERE  H.IDPESSJUR = '''+IntToStr(iIdPatrocinadora)+'''                '+
                 ' AND    H.MESCOBRANCA = '''+sAnoMesCobrancaTela+'''                     '+
                 ' AND    H.SITRECEBIMENTO <> ''2''                                       '+
                 ' AND    NVL(H.VALORESPERADO,0) > 0                                      '+
                 ' AND    NVL(H.VALORRECEBIDO,0) > 0                                      '+
                 ' AND    NVL(H.VALORESPERADO,0) = NVL(H.VALORRECEBIDO,0)                 '+
                 ' AND    H.IDPLANOPREV IN (' + psIDPlanos + ')                             '+
                 ' AND    NOT EXISTS ( SELECT 1 FROM HSTATRASOCONTRIB HA                  '+
                 '                     WHERE HA.MESCOBRANCA = H.MESCOBRANCA               '+
                 '                     AND   HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO         '+
                 '                     AND   NVL(HA.VALOR,0) <> NVL(HA.VALORRECEBIDO,0) ) ');

         if Trim(edNome.Text) <> '' 
         then SQL.Add(' AND H.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+
                      ' AND H.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1])+
                      ' AND H.IDPESSOA    = '+OraNumero(MontaSelectPart.ValoresChave[2])+
                      ' AND H.SEQPROPOSTA = '+OraNumero(MontaSelectPart.ValoresChave[3]));

         if Trim(dblkpcmbLote.Text) <> ''
          then SQL.Add(' AND H.IDLOTE   = '+OraNumero(qryLote.FieldByName('IDLOTE').AsString) );

         try
           ExecSQL;
         except
           memResult.Lines.Add('[ERRO ] - Atualização dos registros sem divergências em alteradores.');
           bErro := True;
           frmAguarde.Apaga; 
           Exit;
         end;
         memResult.Lines.Add('[OK   ] - Atualização dos registros sem divergências em alteradores.');

      end;
    end;


   frmAguarde.Mostra('Atualizando Tabela Temporária de Descontos ...');

   // Atualizar TEMPDESC colocando FLGEXISTEHST = 1
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' UPDATE TMPDESC  SET FLGEXISTEHST = 1, SITENVIO = ''9'' ' +
                  ' WHERE  IDPESSJUR  = '+IntToStr(iIdPatrocinadora)+
                  ' AND    MESCOBRANCA    = '''+sAnoMesCobrancaTela+''' '+
                  ' AND    IDPLANOPREV IN (' + psIDPlanos + ') '+
                  ' AND    ( (SITENVIO = ''2'') OR (SITENVIO = ''1'' AND VALORRECEBIDO <> 0) ) '+
                  ' AND    FLGTIPODESC    = ''P''');
   if rgrpTipoFolha.ItemIndex = 0
   then qryAux.SQL.Add(' AND (FLGDESCFOLHA = ''P'') ')
   else qryAux.SQL.Add(' AND (FLGDESCFOLHA = ''B'') ');

   if Trim(dblkpcmbLote.Text) <> ''
   then qryAux.SQL.Add(' AND IDLOTE = '+OraNumero(qryLote.FieldByName('IDLOTE').AsString) );

   if Trim(edNome.Text) <> '' 
   then qryAux.SQL.Add(' AND IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+
                       ' AND IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1])+
                       ' AND IDPESSOA    = '+OraNumero(MontaSelectPart.ValoresChave[2])+
                       ' AND SEQPROPOSTA = '+OraNumero(MontaSelectPart.ValoresChave[3]));

   if sTipoPagador = 'P' then qryAux.SQL.Add(' AND IDPESSOA = IDTITULAR ')
   else qryAux.SQL.Add(' AND IDPESSOA <> IDTITULAR ');
   

   try
      qryAux.ExecSQL;
   except
      memResult.Lines.Add('[ERRO ] - Atualização da Tabela Temporária de Descontos - Situação do Recebimento ');
      bErro := True;
   end;//try

   if not bErro
   then memResult.Lines.Add('[OK   ] - Atualização da Tabela Temporária de Descontos - Situação do Recebimento ');


   if dtmBaseDados.dbBaseDados.InTransaction
   then begin
      dtmBaseDados.dbBaseDados.Commit;
      dtmBaseDados.dbBaseDados.StartTransaction;
   end;

   memResult.Lines.Add('[OK   ] - Recebimento das contribuições pagas pelos participantes.');
   // Gravar volta na Controle de Interface
   // Grava último lote (não gravado no loop)
   if not bNaoExisteRecebPatro
   then begin
      frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                        'Gravando controle de contribuições ... ');
      GravaVoltaInterface(qryPatro.FieldByname('IdPessoa').AsInteger, iIdLoteAnterior);

      // Atualizar o ctrl de interface
      with qryAux do begin
         Close;
         SQL.Clear;
         SQL.Add(' UPDATE CTRLINTERFACE SET FLGIDATMP    = 1,' +
                 '                          DATAIDATMP   = SYSDATE,' +
                 '                          FLGPREPARADO = 1,' +
                 '                          DATAPREPARO  = SYSDATE' +
                 ' WHERE IDLOTE = ' + IntToStr(iIdLoteAnterior) );
         try
           ExecSQL;
         except
           bErro := True;
           frmAguarde.Apaga; 
           Exit;
         end;
      end;

      frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                      'Recebendo Contribuições do Lote '+IntToSTr(iIdLoteAtual)+' ... ');
   end;

   // ************************************************************************************
   // CALCULAR PATRONAIS QUE NAO VEM NO INTERFACE, CORRESPONDENTES A ATIVOS E M.PARCIAIS
   // ************************************************************************************
   //    -> Se contribuicoes da patro por participante nao vem no interface
   //       Entao o sistema deve prepará-las (calcular), e colocar no
   //             hist. com valoresperado = calculado e recebido = 0
   //       Senao (elas vem no interface)
   //             verificar as que nao vieram e colocar no hist.
   //             com valoresperado = calculado e recebido = 0
   if rgrpTipoFolha.ItemIndex = 0
   then begin
      qryPlanPatro.Close;
      qryPlanPatro.SQL.Clear;
      qryPlanPatro.SQL.Add(' SELECT PLP.IDPESSJUR, PL.IDPLANOPREV, PL.NOME, PLP.FLGRECECONTPATRO  '+
                           ' FROM   PLANPREV PL, PLANPREVPATRO PLP, PATRO PT                      '+
                           ' WHERE  PLP.IDPESSJUR   = '+IntToStr(iIdPatrocinadora)+
                           ' AND    PLP.IDPLANOPREV = PL.IDPLANOPREV                              '+
                           ' AND    PT.IDPESSOA     = PLP.IDPESSJUR                               '+
                           ' AND    PLP.IDPLANOPREV IN (                                          '+
                           '        SELECT DISTINCT IDPLANOPREV FROM HSTRUBRICAXPESS              '+
                           '        WHERE IDPESSOA       = '+IntToStr(iIdPatrocinadora)+
                           '        AND   MESREFERENCIA  = '''+sAnoMesCobrancaTela+''') ');

      if Trim(edNome.Text) <> '' 
      then qryPlanPatro.SQL.Add(' AND PLP.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+
                                ' AND PLP.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1]));

      qryPlanPatro.Open;
      while not qryPlanPatro.EOF do
      begin
         // Preencher data de vencimento desta patrocinadora
         sDataVencimentoPatro := CriticaDataCobrancaSit(dtmAPrev.qry,
                                                qryPlanPatro.FieldByName('IDPESSJUR').AsString,
                                                qryPlanPatro.FieldByName('IDPLANOPREV').AsString,
                                                //'PT',
                                                sTipoFolha,//William Moreira da Silva - SOL 230424 PPM 353071
                                                'N',
                                                Copy(sAnoMesCobrancaTela,6,2),
                                                Copy(sAnoMesCobrancaTela,1,4));
         if Trim(sDataVencimentoPatro) = ''
         then begin
            if MsgDlg('Calendário para contribuições da patrocinadora com problemas. Deseja continuar ? ',
                      'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
            then begin
               memResult.Lines.Add('Processamento cancelado. Motivo : Calendário para contribuições da patrocinadora com problemas. ');
               bErro := True;
               frmAguarde.Apaga; 
               Exit;
            end
            else sDataVencimentoPatro := DateToStr(date);
         end;

         if qryPlanPatro.FieldByName('FLGRECECONTPATRO').AsInteger = 1
         then bReceContPartPatro := True
         else bReceContPartPatro := False;

         if bReceContPartPatro
         then begin
            qryPlanPatro.Next;
            Continue;
         end;

         // a contrib. da patro por participante nao vem no interface
         iIdNovoLote := GeraLOTE(qryPlanPatro.FieldByName('IDPESSJUR').AsInteger,
                                 True,
                                 sAnoMesCobrancaTela,
                                 'P', // sTipo = Previdenciario
                                 'Contrib. pagas pela Patrocinadora '+sPatrocinadora+' por participante.',
                                 'N','1','1','1','1','1',
                                 DateToStr(date),DateToStr(date),DateToStr(date),
                                 DateToStr(date),DateToStr(date));

         if not CobraContribuicaoPatroPart ( qryPlanPatro.FieldByName('IdPessJur').AsInteger,
                                             qryPlanPatro.FieldByName('IdPlanoPrev').AsInteger,
                                             sAnoMesCobrancaTela,
                                             sAnoMesCobrancaTela,
                                             iIdNovoLote, 'O')
         then begin
            bErro := True;
         end;

         // Se o mes de cobranca da tela for o mes de cobrar o 13o., repetir a rotina acima para o
         // mes de referencia 13
         if ( sAnoMesCobranca13 = sAnoMesCobrancaTela )
         then begin
            if qryPatro.FieldByName('FlgAno13').AsString = 'C'
            then sAnoMesAux := Copy(sAnoMesCobrancaTela,1,4)+'/13'
            else sAnoMesAux := Copy(SAnoMesAnterior(Copy(sAnoMesCobrancaTela,1,4)+'/01'),1,4)+'/13';

            if not CobraContribuicaoPatroPart ( qryPlanPatro.FieldByName('IdPessJur').AsInteger,
                                                qryPlanPatro.FieldByName('IdPlanoPrev').AsInteger,
                                                sAnoMesAux,
                                                sAnoMesCobrancaTela,
                                                iIdNovoLote,'O')
            then begin
               bErro := True;
            end;
         end;


         qryPlanPatro.Next;
      end; // while not qryPlanPatro.EOF
   end;

   // ************************************************************************************
   // CALCULAR PATRONAIS CORRESPONDENTES A ASSISTIDOS, POIS A FOLHA DE BENEFICIOS NAO CALCULA
   // ************************************************************************************
   //    -> Se contribuicoes da patro por participante nao vem no interface
   //       Entao o sistema deve prepará-las (calcular), e colocar no
   //             hist. com valoresperado = calculado e recebido = 0
   //       Senao (elas vem no interface)
   //             verificar as que nao vieram e colocar no hist.
   //             com valoresperado = calculado e recebido = 0
   if (rgrpTipoFolha.ItemIndex = 1) and (sTipoPagador <> 'N') 
   then begin
      qryPlanPatro.Close;
      qryPlanPatro.SQL.Clear;
      qryPlanPatro.SQL.Add(' SELECT PLP.IDPESSJUR, PL.IDPLANOPREV, PL.NOME, PLP.FLGRECECONTPATRO  '+
                           ' FROM   PLANPREV PL, PLANPREVPATRO PLP, PATRO PT                      '+
                           ' WHERE  PLP.IDPESSJUR   = '+IntToStr(iIdPatrocinadora)+
                           ' AND    PLP.IDPLANOPREV = PL.IDPLANOPREV                              '+
                           ' AND    PT.IDPESSOA     = PLP.IDPESSJUR                               ');
      if Trim(edNome.Text) <> '' 
      then qryPlanPatro.SQL.Add(' AND PLP.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+
                                ' AND PLP.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1]));

      qryPlanPatro.Open;
      while not qryPlanPatro.EOF do
      begin
        // Preencher data de vencimento desta patrocinadora
        sDataVencimentoPatro:=
          CriticaDataCobrancaSit(
            dtmAPrev.qry,
            qryPlanPatro.FieldByName('IDPESSJUR').AsString,
             qryPlanPatro.FieldByName('IDPLANOPREV').AsString,
             //'PT',
             sTipoFolha,//William Moreira da Silva - SOL 230424 PPM 353071
             'N',
             Copy(sAnoMesCobrancaTela,6,2),
             Copy(sAnoMesCobrancaTela,1,4));

        if Trim(sDataVencimentoPatro) = '' then
        begin
          if MsgDlg('Calendário para contribuições da patrocinadora com problemas. Deseja continuar ? ',
                    'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo then
          begin
            memResult.Lines.Add('Processamento cancelado. Motivo : Calendário para contribuições da patrocinadora com problemas. ');
            bErro := True;
            frmAguarde.Apaga; 
            Exit;
          end
          else
            sDataVencimentoPatro := DateToStr(date);
        end;

        if (Trim(sDataVencimentoPatro) <> Trim(dtRecebimento.Text)) and
           (Not bEscolheuData) then
        begin
          if MsgDlg('Data informada é diferente da Data do Calendário para contribuições da patrocinadora.'+#13+#10+
                    'Deseja executar recebimento das contribuições patronais com a data do calendário ('+Trim(sDataVencimentoPatro)+') ? ',
                    'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
            sDataVencimentoPatro := dtRecebimento.Text;
          MsgDlg('As contribuições patronais serão recebidas com a data de '+Trim(sDataVencimentoPatro)+'.','Informação',mtInformation,[mbOK],0);
          bEscolheuData:=True;
        end;

        if  prmFLGCOBPATROFOLHA <> 1 then // Se patronais NÃO são geradas na folha de beneficios
        begin
          if (Trim(dblkpcmbLote.Text) <> '') then 
            iIdNovoLote := qryLote.FieldByName('IDLOTE').AsInteger
          else
          begin
            // a contrib. da patro por participante nao vem no interface
            iIdNovoLote:=
              GeraLOTE(
                qryPlanPatro.FieldByName('IDPESSJUR').AsInteger,
                True,
                sAnoMesCobrancaTela,
                'P', // sTipo = Previdenciario
                'Contrib. pagas pela Patrocinadora '+sPatrocinadora+' por participante.',
                'N','1','1','1','1','1',
                DateToStr(date),DateToStr(date),DateToStr(date),
                DateToStr(date),DateToStr(date));
          end;

          if not CobraContribuicaoPatroPart(qryPlanPatro.FieldByName('IdPessJur').AsInteger,
                                            qryPlanPatro.FieldByName('IdPlanoPrev').AsInteger,
                                            sAnoMesCobranca13, 
                                            sAnoMesCobrancaTela,
                                            iIdNovoLote, 'A') then
          begin
            bErro := True;
          end;
        end;

         // Marcar como recebidos as contribuições parte patrocinadora
         // geradas nas concessões, que portanto não vieram na Tmpdesc
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV H                                                         '+
                        ' SET    H.VALORRECEBIDO   = H.VALORESPERADO,                                     '+
                        '        H.SITRECEBIMENTO  = 2,                                                   '+
                        '        H.DATARECEBIMENTO = TO_DATE('''+sDataVencimentoPatro+''',''DD/MM/YYYY'') '+
                        ' WHERE  (H.IDPESSJUR   = '+qryPlanPatro.FieldByName('IdPessJur').AsString+' )    '+
                        ' AND    (H.IDPLANOPREV = '+qryPlanPatro.FieldByName('IdPlanoPrev').AsString+')   '+
                        ' AND    (H.MESCOBRANCA = '''+sAnoMesCobrancaTela+''')                            '+
                        ' AND    (H.FOLHAORIGEM =  ''B'')                                                 '+
                        ' AND    (NVL(H.VALORESPERADO,0) > 0)                                             '+
                        ' AND    (NVL(VALORRECEBIDO,0) = 0)                                               '+
                        ' AND    EXISTS ( SELECT 1 FROM CONTPREV C                                        '+
                        '                 WHERE    C.IDPLANOPREV       = H.IDPLANOPREV                    '+
                        '                 AND      C.IDCONTRIBUICAO    = H.IDCONTRIBUICAO                 '+
                        '                 AND      C.FLGPAGADOR = ''P'')                                  '+
                        ' AND    EXISTS ( SELECT 1 FROM HSTBENEFBFCIARIO HB                               '+
                        '                 WHERE  HB.MES              = '''+sAnoMesCobrancaTela+'''        '+
                        '                 AND    HB.IDPESSJUR        = '+qryPlanPatro.FieldByName('IDPESSJUR').AsString+
                        '                 AND    HB.IDPLANOPREV      = '+qryPlanPatro.FieldByName('IDPLANOPREV').AsString+
                        '                 AND    HB.IDHSTFOLHABENEF  IS NOT NULL                          '+
                        '                 AND    H.IDPESSJUR         = HB.IDPESSJUR                       '+
                        '                 AND    H.IDPLANOPREV       = HB.IDPLANOPREV                     '+
                        '                 AND    H.IDPESSOA          = HB.IDPESSOA                        '+
                        '                 AND    H.SEQPROPOSTA       = HB.SEQPROPOSTA    )                ');

         if Trim(dblkpcmbLote.Text) <> ''
         then qryAux.SQL.Add(' AND H.IDLOTE = '+OraNumero(qryLote.FieldByName('IDLOTE').AsString) );

         if Trim(edNome.Text) <> '' 
         then qryAux.SQL.Add(' AND H.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+
                             ' AND H.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1])+
                             ' AND H.IDPESSOA    = '+OraNumero(MontaSelectPart.ValoresChave[2])+
                             ' AND H.SEQPROPOSTA = '+OraNumero(MontaSelectPart.ValoresChave[3]));

         try
            qryAux.ExecSQL;
         except
            memResult.Lines.Add('[ERRO ]- Atualização das contribuições patronais provenientes de concessões.');
            bErro := True;
         end;//try

         if not bErro
         then memResult.Lines.Add('[OK   ]- Atualização das contribuições patronais provenientes de concessões.');

         if Not bErro
         then begin
            dtmBaseDados.dbBaseDados.Commit;
            if Not dtmBaseDados.dbBaseDados.InTransaction
             then dtmBaseDados.dbBaseDados.StartTransaction;
         end;

         qryPlanPatro.Next;
      end; // while not qryPlanPatro.EOF
   end;


   frmAguarde.Apaga;
   Result := True;
end; //RecebeContribuicao

function TfrmRecebeContribuicao.CobraContribuicaoPatroPart(piIdPessJur, piIdPlanoPrev : longint;
                                                           psAnoMesReferencia, psAnoMesCobranca : string;
                                                           piIdLote : longint;
                                                           pcTipo : char { A - Assistidos, O - Outros } ) : boolean;
//
// Observações importantes
// - Toda vez que for inserido uma contribuicao do participante manualmente a parte da
//   patro deve ser inserida manualmente.
// - Para o AdmPrev gerar contribuições patronais, estas terão que ter um benefício
//   correpondente (HSTBENEFBFCIARIO) no mesmo período.
//
var bIncluiu,
    bAlterou,
    bErroRegra,
    bErroLocal : boolean;
    sUltMesPreparo,
    sValorRegra : string;
    iFlgCobra1, iFlgCobra2 : integer;
    sSQL : string;
    sMsgErro,
    sAnoMesDataInicio,           
    sAnoMesDataFinal : string;   
    iNumProcesso     : Integer;  
    dValorContrib    : double;   
    bCobra13         : Boolean;  
begin
   Result := False;
   bErroLocal := False;

   bCobra13 := ((rgrpTipoFolha.ItemIndex = 0) and (Copy(psAnoMesReferencia,6,2) = '13')) Or 
               ((rgrpTipoFolha.ItemIndex = 1) and (Copy(psAnoMesReferencia,6,2) <> '00'));  

   if bCobra13  
   then begin
      iFlgCobra1 := 1;
      iFlgCobra2 := 1;
      sUltMesPreparo := copy(psAnoMesReferencia,1,5)+'13';                         
   end
   else begin
      iFlgCobra1 := 0;
      iFlgCobra2 := 1;
      sUltMesPreparo := psAnoMesCobranca;
   end;

   sSQL := ' SELECT DISTINCT H.MESREFERENCIA, H.MESCOBRANCA, H.IDMOTIVO, CPP.IDCONTRIBUICAO, CPP.IDPESSJUR, '+#13+#10+
           '    CPP.IDPLANOPREV, CPP.IDPESSOA, CPP.SEQPROPOSTA, CPP.VALORBASE1, CPP.VALORBASE2, '+#13+#10+
           '    CPP.VALORBASE3, CPP.DATAINICIO, CPP.DATAFINAL, CPP.ULTMESPREPARO, PF.DATANASC, '+#13+#10+
           '    PP.INSCRICAODATA, PP.IDSITPART, PP.SALPARTICIPACAO, SP.FLGINTERNO, CP.IDREGRACALCULO, '+#13+#10+
           '    CP.IDREGRAPRIMPAGTO, CP.IDREGRAULTPAGTO, CPP.IDPESSOA AS IDTITULAR, CPP.IDCONTRIBUICAO AS IDDESCONTO, '+#13+#10+
           '    C.NOME AS NOMECONTRIB, CP.VLRACEITADIVERG, 0 AS VALOR, 0 AS VALORRECEBIDO,  '+#13+#10+
           '    ''-'' AS CODDOCUMENTOPREV, '+#13+#10+
           '    ''-'' AS CODPORTFORMA,  '+#13+#10+
           '    ''-'' AS CODDOCUMENTOEFET, '+#13+#10+
           '    ''-'' AS PLNCODIGOPREV, '+#13+#10+
           '    ''-'' AS PLNCODIGOEFET, '+#13+#10+
           '    16 AS IDMODULO, '+#13+#10+ 
           '    EL.MATRICULA, 0 AS FLGDESCFOLHA, CPL.FLGTPVLR, PLP.FLGRECECONTPATRO, '+#13+#10+
           '    0 AS FLGPARCELAMENTO, '' '' AS FLGATRASODEVOL '+#13+#10+
           'FROM CONTRIBUICAO C, CONTPREV CP, CONTPLANPATRO CPL, CONTRIBPREVPARTP CPP, '+#13+#10+
           '     PARTPREVPLAN PP, PESSOAFISICA PF, SITPART SP, ELEGPATRO EL, '+#13+#10+
           '     PLANPREVPATRO PLP, HSTCONTRIBPREV H, CONTPREV CP1 '+#13+#10+
           'WHERE (CPP.IDPESSJUR = '+IntToStr(piIdPessJur)+') '+#13+#10+
           '  AND (CPP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+') '+#13+#10+
           '  AND ( (CP.FLGCOBRADECTERC = '+IntToStr(iFlgCobra1)+') OR (CP.FLGCOBRADECTERC = '+IntToStr(iFlgCobra2)+')  ) '+#13+#10+
           '  AND (PLP.IDPESSJUR = CPP.IDPESSJUR) '+#13+#10+
           '  AND (PLP.IDPLANOPREV = CPP.IDPLANOPREV) '+#13+#10;

   if rgrpTipoFolha.ItemIndex = 0
    then sSQL := sSQL + '  AND (PLP.FLGRECECONTPATRO = 0)  '+#13+#10
    Else sSQL := sSQL + '  AND (NVL(H.FLGCONCESSAO, 0) = 0)  '+#13+#10; 

   if bCobra13  
    then sSQL := sSQL + '  AND ((TO_CHAR(CPP.DATAFINAL,''YYYY'') >= '+QuotedStr(Copy(sAnoMesCobrancaTela,1,4))+') OR (CPP.DATAFINAL IS NULL) )'+#13+#10
    Else sSQL := sSQL + '  AND ((TO_CHAR(CPP.DATAFINAL,''YYYY/MM'') >= '''+sAnoMesCobrancaTela+''') OR (CPP.DATAFINAL IS NULL) )'+#13+#10;

   if pcTipo = 'A'
    then sSQL := sSQL + '  AND (CP.FLGINTERNO =  ''AS'' )'+#13+#10
    Else sSQL := sSQL + '  AND (CP.FLGINTERNO <> ''AS'' )'+#13+#10;

   sSQL := sSQL + '  AND (CP.FLGPAGADOR = ''P'') '+#13+#10+
           '  AND (CP.FLGINTERNO <> ''MA'' ) '+#13+#10+
           '  AND (CPP.IDPLANOPREV = CP.IDPLANOPREV) '+#13+#10+
           '  AND (CPP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '+#13+#10+
           '  AND (CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+#13+#10+
           '  AND (CPP.IDPESSJUR = PP.IDPESSJUR) '+#13+#10+
           '  AND (CPP.IDPLANOPREV = PP.IDPLANOPREV) '+#13+#10+
           '  AND (CPP.IDPESSOA = PP.IDPESSOA) '+#13+#10+
           '  AND (CPP.SEQPROPOSTA = PP.SEQPROPOSTA) '+#13+#10+
           '  AND (PP.IDPESSOA = PF.IDPESSOA) '+#13+#10+
           '  AND (PP.IDSITPART = SP.IDSITPART) '+#13+#10+
           '  AND (PP.IDPESSJUR = EL.IDPESSJUR) '+#13+#10+
           '  AND (PP.IDPESSOA = EL.IDPESSOA) '+#13+#10+
           '  AND (TO_CHAR(PP.INSCRICAODATA,'+QuotedStr('YYYY/MM')+')  <= '+ QuotedStr(sAnoMesCobrancaTela)+') '+#13+#10+
           '  AND (CPL.IDPESSJUR = CPP.IDPESSJUR) '+#13+#10+
           '  AND (CPL.IDPLANOPREV = CPP.IDPLANOPREV) '+#13+#10+
           '  AND (CPL.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO) '+#13+#10+
           '  AND (H.MESCOBRANCA = '+QuotedStr(sAnoMesCobrancaTela)+') '+#13+#10;

   if rgrpTipoFolha.ItemIndex = 0
    then sSQL := sSQL + '  AND (H.MESREFERENCIA >= '+QuotedStr(sAnoMesCobrancaTela)+') '+#13+#10
    Else sSQL := sSQL + '  AND ((H.MESREFERENCIA = H.MESCOBRANCA) OR (SUBSTR(H.MESREFERENCIA,6,2) = ''13''))' +#13+#10;

   sSQL := sSQL + '  AND (H.IDPESSJUR = CPP.IDPESSJUR) '+#13+#10+
           '  AND (H.IDPLANOPREV = CPP.IDPLANOPREV) '+#13+#10+
           '  AND (NVL(H.FLGDEVOLUCAO,0) = 0) '+#13+#10+ 
           '  AND (CP1.IDPLANOPREV = H.IDPLANOPREV) '+#13+#10+
           '  AND (CP1.IDCONTRIBUICAO = H.IDCONTRIBUICAO) '+#13+#10+
           '  AND (CP1.FLGPAGADOR = ''C'') '+#13+#10+
           '  AND (CPP.IDPESSJUR = H.IDPESSJUR) '+#13+#10+
           '  AND (CPP.IDPLANOPREV = H.IDPLANOPREV) '+#13+#10+
           '  AND (CPP.IDPESSOA = H.IDPESSOA) '+#13+#10+
           '  AND (CPP.SEQPROPOSTA = H.SEQPROPOSTA ) '+#13+#10+
           '  AND ((NVL(CPP.FLGCOBRA,0) = 1 ) OR (NVL(CPP.FLGCOBRA,0) = 0 AND TO_CHAR(CPP.DATAFINAL,''YYYY/MM'') = '+QuotedStr(sAnoMesCobrancaTela)+')) '+#13+#10; 

   if Trim(dblkpcmbLote.Text) <> ''
     then sSQL := sSQL + '  AND (H.IDLOTE   = '+qryLote.FieldByName('IDLOTE').AsString+')';

   // Se o recebimento for da Folha de Beneficios
   // Entao gerar as patronais de quem teve folha efetivada
   // Senao gerar as patronais de quem teve alguma contribuicao de participante recebida
   if rgrpTipoFolha.ItemIndex = 0 // Folha da Patrocinadora
    then begin
      sSQL := sSQL + '  AND EXISTS ( SELECT 1 FROM HSTCONTRIBPREV HST, CONTPREV CP         '+#13+#10+
                     '               WHERE  HST.MESCOBRANCA    = H.MESCOBRANCA             '+#13+#10+
                     '               AND    HST.MESREFERENCIA  = H.MESREFERENCIA           '+#13+#10+
                     '               AND    HST.IDPESSJUR      = '+IntToStr(piIdPessJur)    +#13+#10+
                     '               AND    HST.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)  +#13+#10+
                     '               AND    CP.IDPLANOPREV     = HST.IDPLANOPREV           '+#13+#10+
                     '               AND    CP.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO        '+#13+#10+
                     '               AND    CP.FLGPAGADOR      = ''C''                     '+#13+#10+
                     '               AND    CPP.IDPESSJUR      = HST.IDPESSJUR             '+#13+#10+
                     '               AND    CPP.IDPLANOPREV    = HST.IDPLANOPREV           '+#13+#10+
                     '               AND    CPP.IDPESSOA       = HST.IDPESSOA              '+#13+#10+
                     '               AND    CPP.SEQPROPOSTA    = HST.SEQPROPOSTA           '+#13+#10;
      if Trim(dblkpcmbLote.Text) <> ''
       then sSQL := sSQL +'               AND HST.IDLOTE = '+OraNumero(qryLote.FieldByName('IDLOTE').AsString)+#13+#10;

      if Trim(edNome.Text) <> ''
       then sSQL := sSQL +'               AND HST.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+#13+#10+
                          '               AND HST.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1])+#13+#10+
                          '               AND HST.IDPESSOA    = '+OraNumero(MontaSelectPart.ValoresChave[2])+#13+#10+
                          '               AND HST.SEQPROPOSTA = '+OraNumero(MontaSelectPart.ValoresChave[3])+#13+#10;
      sSQL := sSQL + ' ) '+#13+#10;

    end
    Else begin // Folha de Beneficio
      sSQL := sSQL + ' AND EXISTS ( SELECT 1 FROM HSTBENEFBFCIARIO HB, LOTEXHSTFOLHABENEF L   '+#13+#10+
                     '              WHERE  HB.MES              = H.MESCOBRANCA                '+#13+#10+
                     '              AND    HB.MESREFERENCIA    = H.MESREFERENCIA              '+#13+#10+
                     '              AND    HB.IDPESSJUR        = '+IntToStr(piIdPessJur)       +#13+#10+
                     '              AND    HB.IDPLANOPREV      = '+IntToStr(piIdPlanoPrev)     +#13+#10+
                     '              AND    HB.IDHSTFOLHABENEF  IS NOT NULL                    '+#13+#10+
                     '              AND    CPP.IDPESSJUR      = HB.IDPESSJUR                  '+#13+#10+
                     '              AND    CPP.IDPLANOPREV    = HB.IDPLANOPREV                '+#13+#10+
                     '              AND    CPP.IDPESSOA       = HB.IDPESSOA                   '+#13+#10+
                     '              AND    CPP.SEQPROPOSTA    = HB.SEQPROPOSTA                '+#13+#10+
                     '              AND    L.IDHSTFOLHABENEF  = HB.IDHSTFOLHABENEF            '+#13+#10;

      if Trim(dblkpcmbLote.Text) <> ''
       then sSQL := sSQL +' AND L.IDLOTE = '+OraNumero(qryLote.FieldByName('IDLOTE').AsString)+#13+#10;

      if Trim(edNome.Text) <> ''
       then sSQL := sSQL +'              AND H.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+#13+#10+
                          '              AND H.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1])+#13+#10+
                          '              AND H.IDPESSOA    = '+OraNumero(MontaSelectPart.ValoresChave[2])+#13+#10+
                          '              AND H.SEQPROPOSTA = '+OraNumero(MontaSelectPart.ValoresChave[3])+#13+#10;
      sSQL := sSQL + ' ) '+#13+#10;
   end;

   sSQL := sSQL +' ORDER BY CPP.IDCONTRIBUICAO ';

   frmAguarde.Mostra(sNomePatro+' - Verificando contribuições patronais ... ');
   // Esta query trará todas as contribuições da patrocinadora por participante,
   // Mesmo as já calculadas por eventos
   with qryContribPartPatro do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Open;
   end;

   if qryContribPartPatro.IsEmpty
   then begin
      frmAguarde.Apaga;
      memResult.Lines.Add('[AVISO] - Contribuições Patronais não encontradas para o plano '+IntToStr(piIdPlanoPrev)+'.');
      Result := True;
      Exit;
   end;

   frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                     'Calculando Contribuições Patronais por Participante ...' );

   iControleCommit := 0;

   frmAguarde.pbAguarde.Min      := 0;
   frmAguarde.pbAguarde.Position := 0;
   frmAguarde.pbAguarde.Step     := 1;
   frmAguarde.pbAguarde.Max      := qryContribPartPatro.RecordCount;
   frmAguarde.pbAguarde.Visible  := True;

   while not qryContribPartPatro.EOF do
   begin

      frmAguarde.pbAguarde.Position  := frmAguarde.pbAguarde.Position + 1; 
      Application.ProcessMessages;
      inc(iControleCommit);

      if iControleCommit >= 1000
      then begin
         if dtmBaseDados.dbBaseDados.InTransaction
         then begin
            dtmBaseDados.dbBaseDados.Commit;
            dtmBaseDados.dbBaseDados.StartTransaction;
         end;
         iControleCommit := 1;
      end;

      if rgrpTipoFolha.ItemIndex <> 1
       then begin
         qryaux.Close;
         qryaux.SQL.Clear;
         qryaux.SQL.add(' SELECT 1 FROM HSTCONTRIBPREV  '+
                 ' WHERE IDPESSJUR      = '+IntToStr(qryContribPartPatro.FieldByName('IDPESSJUR').AsInteger) + ' AND ' +
                 '       IDPLANOPREV    = '+IntToStr(qryContribPartPatro.FieldByName('IDPLANOPREV').AsInteger) + ' AND ' +
                 '       IDPESSOA       = '+IntToStr(qryContribPartPatro.FieldByName('IDPESSOA').AsInteger)+ ' AND ' +
                 '       SEQPROPOSTA    = '+IntToStr(qryContribPartPatro.FieldByName('SeqProposta').AsInteger)+ ' AND ' +
                 '       MESREFERENCIA  = '''+qryContribPartPatro.FieldByName('MESREFERENCIA').AsString + ''' AND ' +
                 '       IDCONTRIBUICAO = '+IntToStr(qryContribPartPatro.FieldByName('IDDESCONTO').AsInteger) + ' AND ' +
                 '       IDMOTIVO       = '+qryContribPartPatro.FieldByName('IDMOTIVO').AsString+'  AND '+
                 '       MESCOBRANCA    = '+ QuotedStr(qryContribPartPatro.FieldByName('MESCOBRANCA').AsString)+'  AND '+ 
                 '       VALORRECEBIDO > 0   '); 
         qryaux.open;
         if not qryaux.isempty then
         begin
            qryContribPartPatro.Next;
            Continue;
         end;
      end;

      // Se para este plano x patrocinadora o tipo de envio for : ENVIA VALOR
      // Entao Se a contribuicao já foi calculada neste mes atraves de evento
      //       Entao apenas atualizar o valor recebido e o sitrecebimento para 2 (recebido ok)
      //       Senao calcular e inserir/atualizar
      // Senao (ENVIA BASE)
      //       Calcular e inserir/atualizar
      if (qryContribPartPatro.FieldbyName('FlgTpVlr').AsString     <> 'V') or
         (pcTipo = 'A') or
         (qryContribPartPatro.FieldByName('UltMesPreparo').AsString <> psAnoMesCobranca) or
         (bCobra13)   
      then begin
         sSQL := MontaSQLContribNOVA(qryContribPartPatro.FieldByName('IdPessJur').AsInteger,
                          qryContribPartPatro.FieldByName('IdPlanoPrev').AsInteger,
                          qryContribPartPatro.FieldByName('IdPessoa').AsInteger,
                          qryContribPartPatro.FieldByName('SeqProposta').AsInteger,
                          qryContribPartPatro.FieldByName('IdContribuicao').AsInteger,
                          prmIdMotivoContrib,
                          qryContribPartPatro.FieldByName('FlgInterno').AsString,
                          qryContribPartPatro.FieldByName('MESREFERENCIA').AsString, 
                          dtRecebimento.Text, // sDataRef
                          '0',                // sValorFinal
                          qryContribPartPatro.FieldByName('InscricaoData').AsString,
                          qryContribPartPatro.FieldByName('DataNasc').AsString,
                          'N',                // sTipoCalculo
                          'HSTCONTRIBPREV',
                          'VALORRECEBIDO',
                          qryContribPartPatro.FieldByName('SALPARTICIPACAO').AsString,
                          qryContribPartPatro.FieldByName('IDSITPART').AsString,'','',0,-1,psAnoMesCobranca,-1);

         sValorRegra := RegraNumerica(qryContribPartPatro.FieldByName('IdRegraCalculo').AsString,
                                      sSQL,bErroRegra,iIdCalculoGeral,False); 
         if bErroRegra
         then begin
            memResult.Lines.Add('[ERRO ] - Execução da Regra de Cálculo Nº '+
                                 qryContribPartPatro.FieldByName('IdRegraCalculo').AsString);
            bErroLocal    := True;
            qryContribPartPatro.Next;
            Continue;
         end;

         sValorRegra := OraNumero(sValorRegra);

         if rgrpTipoFolha.ItemIndex = 1
         then begin
            sAnoMesDataInicio:= Trim(copy(qryContribPartPatro.FieldbyName('DATAINICIO').AsString,7,4)+
                                     copy(qryContribPartPatro.FieldbyName('DATAINICIO').AsString,3,3));

            sAnoMesDataFinal := Trim(copy(qryContribPartPatro.FieldbyName('DATAFINAL').AsString,7,4)+
                                     copy(qryContribPartPatro.FieldbyName('DATAFINAL').AsString,3,3));

            sSQL := ' SELECT NUMEROPROCESSO FROM HSTBENEFBFCIARIO H '+
                    ' WHERE  H.MES              = '+QuotedStr(qryContribPartPatro.FieldByName('MESCOBRANCA').AsString)+
                    ' AND    H.MESREFERENCIA    = '+QuotedStr(qryContribPartPatro.FieldByName('MESREFERENCIA').AsString)+
                    ' AND    H.IDPESSJUR        = '+qryContribPartPatro.FieldByName('IDPESSJUR').AsString +
                    ' AND    H.IDPLANOPREV      = '+qryContribPartPatro.FieldByName('IDPLANOPREV').AsString +
                    ' AND    H.IDHSTFOLHABENEF  IS NOT NULL                    '+
                    ' AND    H.IDPESSOA         = '+qryContribPartPatro.FieldByName('IDPESSOA').AsString +
                    ' AND    H.SEQPROPOSTA      = '+qryContribPartPatro.FieldByName('SEQPROPOSTA').AsString;

            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(sSQL);

            qryAux.Open;

            iNumProcesso := qryAux.FieldByName('NUMEROPROCESSO').AsInteger;

            if ((psAnoMesCobranca = sAnoMesDataInicio) or
                (psAnoMesCobranca = sAnoMesDataFinal )   ) Or
               ((bCobra13) and   
                ((Copy(psAnoMesCobranca,1,4) = Copy(sAnoMesDataInicio,1,4)) Or
                 (Copy(psAnoMesCobranca,1,4) = Copy(sAnoMesDataFinal,1,4 ))
                )
               )
            then begin
               dValorContrib    := CalculaContribuicaoACobrarNoMes(qryAux,
                                                  qryContribPartPatro.FieldByName('IDPESSJUR').AsInteger,
                                                  qryContribPartPatro.FieldByName('IDPLANOPREV').AsInteger,
                                                  qryContribPartPatro.FieldByName('IDPESSOA').AsInteger,
                                                  qryContribPartPatro.FieldByName('SEQPROPOSTA').AsInteger,
                                                  qryContribPartPatro.FieldByName('IDCONTRIBUICAO').AsInteger,
                                                  qryContribPartPatro.FieldByName('MESREFERENCIA').AsString,
                                                  qryContribPartPatro.FieldByName('FLGINTERNO').AsString,
                                                  qryContribPartPatro.FieldByName('DATAINICIO').AsString,
                                                  qryContribPartPatro.FieldByName('DATAFINAL').AsString,
                                                  qryContribPartPatro.FieldByName('IDMOTIVO').AsInteger,
                                                  0,
                                                  0,
                                                  iNumProcesso,
                                                  sMsgErro,
                                                  piIdLote);


               sValorRegra := OraNumero(FloatToStr(dValorContrib));
            end;
          end; // if rgrpTipoFolha.ItemIndex = 1


         //sempre tentar alterar antes
         //para atender casos de eventos, que por ter motivo diferente acarretariam
         //uma inclusão duplicada
         if not AlteraHSTCONTRIBPREV(qryContribPartPatro, bAlterou,
                  sValorRegra, sValorRegra, IntToStr(prmIdMotivoContrib), '',
                  0
                  )
         then begin
         end;

         if not bAlterou
         then begin
            if not IncluiHSTCONTRIBPREV (qryContribPartPatro,sValorRegra,'C',piIdLote,bIncluiu,'',
                                         '0') // '2' Daniel Begnami SOL:101015
            then begin
               memResult.Lines.Add('[ERRO ] - Gravação da contribuição '+Trim(qryContribPartPatro.FieldByName('NomeContrib').AsString)+ 'no histórico.');
               bErroLocal    := True;
               qryContribPartPatro.Next;
               Continue;
            end;
         end;
      end;

      // Atualizar ultmespreparo por pessoa
      if not AtualizaUltMesPessoa(qryContribPartPatro.FieldByName('IdPessJur').AsString,
                                  qryContribPartPatro.FieldByName('IdPlanoPrev').AsString,
                                  qryContribPartPatro.FieldByName('IdPessoa').AsString,
                                  qryContribPartPatro.FieldByName('IdContribuicao').AsString,
                                  qryContribPartPatro.FieldByName('MESREFERENCIA').AsString,
                                  psAnoMesCobranca)
      then begin
            memResult.Lines.Add('Erro[Gravação] Atualização do mês de cobrança ');
            bErroLocal := True;
      end;

      qryContribPartPatro.Next;
   end; // while not qryContribPartPatro.EOF

   memResult.Lines.Add('[OK   ] - Geração das Contribuições Patronais para o plano '+IntToStr(piIdPlanoPrev)+'.');

   if dtmBaseDados.dbBaseDados.InTransaction
   then begin
      dtmBaseDados.dbBaseDados.Commit;
      dtmBaseDados.dbBaseDados.StartTransaction;
   end;

   frmAguarde.pbAguarde.Visible  := False;
   frmAguarde.Apaga;

   Result := not bErroLocal;
end; // CobraContribuicaoPatroPart

function TfrmRecebeContribuicao.IncluiHSTCONTRIBPREV(qryInclusao : TwwQuery;
                                                     psValor : string;
                                                     pcOrigem : char;
                                                     piIdLote : longint;
                                                     var bIncluiu : boolean;
                                                     psFlgDevolucao : string;
                                                     psFlgConcessao : string): boolean;
var
  sSQL,
  sSQLValues: string;
  iParcela, iNumRecebimento: integer;
  rDif,
  sValAcumRec1 : extended;


  sIdParcelamento,  sAux : string;

  iAux : Integer;

  bDtVencTmpDesc : Boolean;
begin
  Result := False;
  bIncluiu := False;

  bDtVencTmpDesc := (chkDataRecTmpDesc.Checked) and
                    ((rgrpTipoFolha.ItemIndex = 1) Or
                    (qryInclusao.FieldbyName('IDPESSJUR').AsInteger = iIdFundacao))
                    and (UpperCase(qryInclusao.Name) <> 'QRYCONTRIBPARTPATRO') ;

  // tratamento do parcelamento
  if (qryInclusao.FieldByName('FLGPARCELAMENTO').AsInteger = 1)
  then begin

      bVeioDeEvento := True; // SOL 127451 - Ádler Souza
      frmparcelamento.TrazDadosParcela( qryaux,
                                        qryInclusao.FieldbyName('IdPessJur').AsString,
                                        qryInclusao.FieldbyName('IdPlanoPrev').AsString,
                                        qryInclusao.FieldbyName('IdPessoa').AsString,
                                        sIdParcelamento,
                                        sAux, sAux,  sAux, sAux, sAux, sAux, iAux);
  end;



  // Verificar se a contribuição existe na CONTRIBPREVPARTP
  // Se não existir, inserir e emitir aviso
  if (sTipoPagador <> 'N') and (qryInclusao.FieldbyName('DATAINICIO').AsString = '')
  then begin
     sSQL := ' INSERT INTO CONTRIBPREVPARTP (                                        '+
             '        CODPORTFORMA,      DATAINICIO,   DATAFINAL,    DIAVENCIMENTO,  '+
             '        FLGCOBRA,          FLGDESCFOLHA, FLGRECALCULA, FLGRETROATIVO,  '+
             '        IDCONTRIBUICAO,    IDPESSJUR,    IDPESSOA,     IDPLANOPREV,    '+
             '        IDTPPERIODICIDADE, QTDEPARCELAS, SEQPROPOSTA,  ULTANO13,       '+
             '        ULTMESPREPARO )                                                '+
             ' SELECT CP.CODPORTFORMA,                                               '+
             '        TO_DATE(''01/'+Copy(sAnoMesCobrancaTela,6,2)+'/'+Copy(sAnoMesCobrancaTela,1,4)+''',''DD/MM/YYYY''), '+
             '        TO_DATE(''01/'+Copy(sAnoMesCobrancaTela,6,2)+'/'+Copy(sAnoMesCobrancaTela,1,4)+''',''DD/MM/YYYY''), '+
             '        0,                                                                                                  '+
             '        0,                                                                                                  '+
             '        1,                                                                                                  '+
             '        0,                                                                                                  '+
             '        0,                                                                                                  '+
             qryInclusao.FieldbyName('IDDESCONTO').AsString+',                                                        '+
             qryInclusao.FieldbyName('IDPESSJUR').AsString+',                                                             '+
             qryInclusao.FieldbyName('IDPESSOA').AsString+',                                                              '+
             qryInclusao.FieldbyName('IDPLANOPREV').AsString+',                                                           '+
             '        C.IDTPPERIODICIDADE,                                                                                '+
             '        NULL,                                                                                               '+
             '        1,                                                                                                  '+
             '        0,                                                                                                  '+
             ''''+sAnoMesCobrancaTela+'''                                                                                 '+
             ' FROM  CONTPREV CP, CONTRIBUICAO C                                                                          '+
             ' WHERE CP.IDPLANOPREV    = '+qryInclusao.FieldbyName('IDPLANOPREV').AsString                                 +
             ' AND   CP.IDCONTRIBUICAO = '+qryInclusao.FieldbyName('IDDESCONTO').AsString                              +
             ' AND   C.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO                                                                 ';
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSQL);
     try
        qryAux.ExecSQL;
     except
        memResult.Lines.Add('[ERRO]-Identificada a contribuição '+qryInclusao.FieldbyName('IDDESCONTO').AsString+
                            ' no valor de '+OraNumero(qryInclusao.FieldbyName('VALORRECEBIDO').AsString)+
                            ' para a matrícula no. '+qryInclusao.FieldbyName('MATRICULA').AsString+
                            ' originada na Folha de Pagamento. Erro ao associá-la ao participante.');
     end;
     memResult.Lines.Add('[AVISO]-Identificada a contribuição '+qryInclusao.FieldbyName('IDDESCONTO').AsString+
                         ' no valor de '+OraNumero(qryInclusao.FieldbyName('VALORRECEBIDO').AsString)+
                         ' para a matrícula no. '+qryInclusao.FieldbyName('MATRICULA').AsString+
                         ' originada na Folha de Pagamento.');

  end;

  iNumRecebimento := LeUltRegistro(qryAux,'HSTCONTRIBPREV');
  sSQLValues := IntToStr(iNumRecebimento) + ',';

  if (pcOrigem = 'T') and (Trim(qryInclusao.FieldByName('IDMOTIVO').AsString) <> '')
  then sSQLValues := sSQLValues + qryInclusao.FieldByName('IDMOTIVO').AsString + ','
  else sSQLValues := sSQLValues + IntToStr(prmIdMotivoContrib) + ',';

  // Daniel Begnami SOL:101015
  if qryInclusao.FieldByName('MESREFERENCIA').AsString <> '' then
    sSQLValues := sSQLValues + '''' + qryInclusao.FieldByName('MESREFERENCIA').AsString + '''' + ',' // MESREFERENCIA
  else
    sSQLValues := sSQLValues + '''' + qryInclusao.FieldByName('MESCOBRANCA').AsString + '''' + ','; // MESCOBRANCA
  // Fim

  sSQLValues := sSQLValues + '''' + qryInclusao.FieldByName('MESCOBRANCA').AsString   + '''' + ','; // MESCOBRANCA

  if Trim(qryInclusao.FieldByName('IDPESSJUR').AsString) <> '' // IDPESSJUR
  then sSQLValues := sSQLValues + qryInclusao.FieldByName('IDPESSJUR').AsString + ','
  else sSQLValues := sSQLValues + 'NULL' + ',';

  if sTipoPagador <> 'N'
  then begin
     if Trim(qryInclusao.FieldByName('IDTITULAR').AsString) <> '' // IDPESSOA
     then sSQLValues := sSQLValues + qryInclusao.FieldByName('IDTITULAR').AsString + ','
     else sSQLValues := sSQLValues + 'NULL' + ',';
  end
  else begin
     if Trim(qryInclusao.FieldByName('IDPESSOA').AsString) <> '' // IDPESSOA
     then sSQLValues := sSQLValues + qryInclusao.FieldByName('IDPESSOA').AsString + ','
     else sSQLValues := sSQLValues + 'NULL' + ',';
  end;

  if Trim(qryInclusao.FieldByName('IDPLANOPREV').AsString) <> '' // IDPLANOPREV
  then sSQLValues := sSQLValues + qryInclusao.FieldByName('IDPLANOPREV').AsString + ','
  else sSQLValues := sSQLValues + 'NULL' + ',';

  if Trim(qryInclusao.FieldByName('SEQPROPOSTA').AsString) <> '' // SEQPROPOSTA
  then sSQLValues := sSQLValues + qryInclusao.FieldByName('SEQPROPOSTA').AsString + ','
  else sSQLValues := sSQLValues + 'NULL' + ',';

  if Trim(qryInclusao.FieldByName('IDDESCONTO').AsString) <> '' // IDCONTRIBUICAO
  then sSQLValues := sSQLValues + qryInclusao.FieldByName('IDDESCONTO').AsString + ','
  else sSQLValues := sSQLValues + 'NULL' + ',';

  if (pcOrigem = 'C')
  then begin
     rValorRecebido := StrToFloat(ClienteNumero(psValor));
     rValorEsperado := StrToFloat(ClienteNumero(psValor));
  end
  else begin
     if Trim(qryInclusao.FieldByName('VALORRECEBIDO').AsString) = ''
     then rValorRecebido := 0
     else rValorRecebido := qryInclusao.FieldByName('VALORRECEBIDO').AsFloat;

     if Trim(qryInclusao.FieldByName('VALOR').AsString) = ''
     then rValorEsperado := 0
     else rValorEsperado := qryInclusao.FieldByName('VALOR').AsFloat;
  end;

   cAuxSeparador    := DecimalSeparator;
   DecimalSeparator := '.';
   sValorRecebido   := FormatFloat('#0.00',rValorRecebido);
   sValorEsperado   := FormatFloat('#0.00',rValorEsperado);
   DecimalSeparator := cAuxSeparador;

  sSQLValues := sSQLValues + sValorRecebido + ','; // VALORRECEBIDO
  sSQLValues := sSQLValues + sValorEsperado + ',' + sValorEsperado + ','; // VALORCALCULADO, VALORESPERADO

  if sValorEsperado = sValorRecebido
  then sSQLValues := sSQLValues + '2, '
  else begin
     if rValorEsperado  >   rValorRecebido
     then rDif := rValorEsperado -  rValorRecebido
     else rDif := rValorRecebido -  rValorEsperado;

     if  rDif <= qryInclusao.FieldByName('VLRACEITADIVERG').AsFloat
     then sSQLValues := sSQLValues + '2, '
     else sSQLValues := sSQLValues + '3, ';
  end;

  if bDtVencTmpDesc
   then sSQLValues := sSQLValues + 'TO_DATE('''+Trim(qryInclusao.FieldbyName('DATARECEBIMENTO').AsString)+''',''dd/mm/yyyy'') ' + ','
   Else sSQLValues := sSQLValues + 'TO_DATE('''+Trim(dtRecebimento.Text)+''',''dd/mm/yyyy'') ' + ',';


  if (pcOrigem = 'T') and (qryInclusao.FieldByName('CODPORTFORMA').AsString <> '') // CODPORTFORMA
  then sSQLValues := sSQLValues + qryInclusao.FieldByName('CODPORTFORMA').AsString + ','
  else sSQLValues := sSQLValues + 'NULL' + ',';

  if pcOrigem = 'C'
  then begin
     sSQLValues := sSQLValues + IntToStr(piIdLote)+ ',';
     sSQLValues := sSQLValues + '1' + ',' // flgdescfolha
  end
  else begin
     if qryInclusao.FieldByName('IDLOTE').AsString <> '' // IDLOTE
     then sSQLValues := sSQLValues + qryInclusao.FieldByName('IDLOTE').AsString + ','
     else sSQLValues := sSQLValues + 'NULL' + ',';

     if (qryInclusao.FieldByName('FLGDESCFOLHA').AsString = 'B') or
        (qryInclusao.FieldByName('FLGDESCFOLHA').AsString = 'P') // FLGDESCFOLHA
     then sSQLValues := sSQLValues + '1' + ','
     else if (qryInclusao.FieldByName('FLGDESCFOLHA').AsString = 'O')
          then sSQLValues := sSQLValues + '0' + ','
          else sSQLValues := sSQLValues + 'NULL' + ',';
  end;

  sSQLValues := sSQLValues + 'TO_DATE('''+Trim(dtRecebimento.Text)+''',''dd/mm/yyyy'') ' + ',';

  sSQLValues := sSQLValues + '0' + ','; // FLGCALCRESERVA
  sSQLValues := sSQLValues + '''F''' + ','; // STIPO

  if Trim(qryInclusao.FieldByName('FLGINTERNO').AsString) <> '' // FLGSITFUNDACAO
  then sSQLValues := sSQLValues + '''' + qryInclusao.FieldByName('FLGINTERNO').AsString + '''' + ','
  else sSQLValues := sSQLValues + 'NULL' + ',';

  if Trim(qryInclusao.FieldByName('IDREGRACALCULO').AsString) <> '' // IDREGRACALCULO
  then sSQLValues := sSQLValues + qryInclusao.FieldByName('IDREGRACALCULO').AsString + ','
  else sSQLValues := sSQLValues + 'NULL' + ',';

  iParcela := 1;
  if iParcela < 0 then iParcela := 0;
  sSQLValues := sSQLValues + IntToStr(iParcela) + ','; // PARCELA

  if Trim(qryInclusao.FieldByName('VALORBASE1').AsString) <> '' // VALOROP1
  then sSQLValues := sSQLValues + OraNumero(qryInclusao.FieldByName('VALORBASE1').AsString) + ','
  else sSQLValues := sSQLValues + 'NULL' + ',';

  if Trim(qryInclusao.FieldByName('VALORBASE2').AsString) <> '' // VALOROP2
  then sSQLValues := sSQLValues + OraNumero(qryInclusao.FieldByName('VALORBASE2').AsString) + ','
  else sSQLValues := sSQLValues + 'NULL' + ',';

  if Trim(qryInclusao.FieldByName('VALORBASE3').AsString) <> '' // VALOROP3
  then sSQLValues := sSQLValues + OraNumero(qryInclusao.FieldByName('VALORBASE3').AsString) + ','
  else sSQLValues := sSQLValues + 'NULL' + ',';

  if Trim(qryInclusao.FieldByName('DATAINICIO').AsString) <> '' // DATAINICIO
  then sSQLValues := sSQLValues + 'TO_DATE(''' +DateToStr(qryInclusao.FieldByName('DATAINICIO').AsDateTime)+''',''dd/mm/yyyy'') ' + ','
  else sSQLValues := sSQLValues + 'NULL' + ',';

  if Trim(qryInclusao.FieldByName('DATAFINAL').AsString) <> '' // DATAFINAL
  then sSQLValues := sSQLValues + 'TO_DATE(''' +DateToStr(qryInclusao.FieldByName('DATAFINAL').AsDateTime)+''',''dd/mm/yyyy'') '
  else sSQLValues := sSQLValues + 'NULL';

  // Se a contribuicao foi descontada na folha de beneficio ou se o participante
  // for funcinario da propria fundacao
  // Entao atualizar o coddocumentoprev
  if ( (qryInclusao.FieldByName('FlgDescFolha').AsString  = 'B')       or
       ((qryInclusao.FieldByName('FlgDescFolha').AsString  = 'P') and
       (qryInclusao.FieldByName('IdPessJur').AsInteger = iIdFundacao))
      ) and
     ( Trim(qryInclusao.FieldByName('CODDOCUMENTOPREV').AsString) <> '')
  then sSQLValues := sSQLValues + ', CODDOCUMENTOPREV = '+ qryInclusao.FieldByName('CODDOCUMENTOPREV').AsString
  else sSQLValues := sSQLValues + ', NULL';


  // caso a folha da fundação tenha processado, marcar neste ponto como "F"
  if qryInclusao.FieldByName('IDMODULO').AsString  = '21'
  then sSQLValues := sSQLValues + ', ''F'' '
  else if qryInclusao.FieldByName('FlgDescFolha').AsString  = 'B'
  then sSQLValues := sSQLValues + ', ''B'' '
  else if qryInclusao.FieldByName('FlgDescFolha').AsString  = 'P'
       then sSQLValues := sSQLValues + ', ''P'' '
       else if qryInclusao.FieldByName('FlgDescFolha').AsString  = '0'
            then begin
               if rgrpTipoFolha.ItemIndex = 1
               then sSQLValues := sSQLValues + ', ''B'' '
               else sSQLValues := sSQLValues + ', ''P'' ';
            end;

  if psFlgDevolucao = '1'
    then sSQLValues := sSQLValues + ', 1 '
    Else sSQLValues := sSQLValues + ', 0 ';


  if trim(sIdParcelamento) <> ''
    then sSQLValues := sSQLValues + ', '+sIdParcelamento
    Else sSQLValues := sSQLValues + ', NULL ';

  sSQLValues := sSQLValues + ','+psFlgConcessao;
  sSQLValues := sSQLValues + ','+ qryInclusao.FieldByName('IDTITULAR').AsString;  //Henrique Massão SOL 108902

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' INSERT INTO HSTCONTRIBPREV(NUMRECEBIMENTO, IDMOTIVO, MESREFERENCIA,       '+
                 '                            MESCOBRANCA, IDPESSJUR, IDPESSOA, IDPLANOPREV, '+
                 '                            SEQPROPOSTA, IDCONTRIBUICAO, VALORRECEBIDO,    '+
                 '                            VALORCALCULADO, VALORESPERADO, SITRECEBIMENTO, '+
                 '                            DATARECEBIMENTO, CODPORTFORMA,                 '+
                 '                            IDLOTE, FLGDESCFOLHA, DATAPREVISAORECE,        '+
                 '                            FLGCALCRESERVA, TIPO, FLGSITFUNDACAO,          '+
                 '                            IDREGRACALCULO, PARCELA, VALOROP1, VALOROP2,   '+
                 '                            VALOROP3, DATAINICIO, DATAFINAL,               '+
                 '                            CODDOCUMENTOPREV, FOLHAORIGEM,                 '+
                 '                            FLGDEVOLUCAO, IDPARCELAMENTO,                  '+   
                 '                            FLGCONCESSAO, IDTITULAR)                                  '+
                 ' VALUES (' + sSQLValues + ')');
  try

     qryAux.ExecSQL;
  except
     //bErro := True; - leorefer - 2009
     bIncluiu := False;
     exit;
  end; //try

  bIncluiu := True;
  Result   := True;
end;



function TfrmRecebeContribuicao.AlteraHSTCONTRIBPREV(
           qryAlteracao : TwwQuery;
           var bAlterou : boolean;
           psValorEsperado, // caso esteja na query passar branco
           psValorRecebido,
           psIdMotivo : string;
           psFlgDevolucao : string;        
           aiNumRecebimento: integer;      
           psIdLote : string = ''          
           ): boolean;

var rDif, sValAcumRec1 : extended;
    sFolhaOrigem : string;

    sIdMotivoParametro, sIdParcelamento, sAux : string;

    iAux : Integer;
    bDtVencTmpDesc : Boolean;
begin
  Result := False;

  bDtVencTmpDesc := (chkDataRecTmpDesc.Checked) and
                    ((rgrpTipoFolha.ItemIndex = 1) Or
                     (qryAlteracao.FieldbyName('IDPESSJUR').AsInteger = iIdFundacao))
                    and (UpperCase(qryAlteracao.Name) <> 'QRYCONTRIBPARTPATRO') ;

  if Trim(psValorRecebido) = ''
  then begin
     if Trim(qryAlteracao.FieldByName('VALORRECEBIDO').AsString) = ''
     then rValorRecebido := 0
     else rValorRecebido := qryAlteracao.FieldByName('VALORRECEBIDO').AsFloat;
  end
  else rValorRecebido := StrToFloat(ClienteNumero(psValorRecebido));

  if Trim(psValorEsperado) = ''
  then begin
     if Trim(qryAlteracao.FieldByName('VALOR').AsString) = ''
     then rValorEsperado := 0
     else rValorEsperado := qryAlteracao.FieldByName('VALOR').AsFloat;
  end
  else rValorEsperado := StrToFloat(ClienteNumero(psValorEsperado));

{.}cAuxSeparador    := DecimalSeparator;
   DecimalSeparator := '.';
   sValorRecebido   := FormatFloat('#0.00',rValorRecebido);
   sValorEsperado   := FormatFloat('#0.00',rValorEsperado);
{.}DecimalSeparator := cAuxSeparador;

  sSQL :=  ' VALORCALCULADO  = ' + OraNumero(sValorEsperado);

  // Atualizar situacao do recebimento para 2 se Ok ou 3 se Divergente.
  // No caso de uma divergência (a menor ou a maior), verificar a margem
  // de aceitação cadastrada por contribuição (VLRACEITADIVERG na CONTPREV)
  // Caso a diferença seja menor ou igual à esta margem, entao o sistema
  // deverá ignorar a diferenca, colocando o valor esperado igual ao recebido
  // e a situacao (sitrecebimento) = 5, que significa divergente tratado
  // O valor calculado será mantido para posteriores conferencias
  if sValorEsperado = sValorRecebido then
  begin
    sSQL := sSQL + ', VALORRECEBIDO = ' + OraNumero(sValorRecebido);
    if rgrpTipoFolha.ItemIndex = 0 then 
      sSQL := sSQL + ', VALORESPERADO   = ' + OraNumero(sValorEsperado);
    sSQL := sSQL + ', SITRECEBIMENTO = ''2'' ';
  end
  else
  begin
    if rValorEsperado  >   rValorRecebido then
      rDif := rValorEsperado -  rValorRecebido
    else
      rDif := rValorRecebido -  rValorEsperado;

    if rDif <= qryAlteracao.fieldbyname('VLRACEITADIVERG').AsFloat then
    begin
      sSQL := sSQL + ', VALORRECEBIDO = ' + OraNumero(sValorRecebido);
      if rgrpTipoFolha.ItemIndex = 0 then 
        sSQL := sSQL + ', VALORESPERADO   = ' + OraNumero(sValorRecebido);
      sSQL := sSQL + ', SITRECEBIMENTO = ''2'' ';
    end
    else
    begin
      sSQL := sSQL + ', VALORRECEBIDO = ' +OraNumero(sValorRecebido);
      if rgrpTipoFolha.ItemIndex = 0 then 
        sSQL := sSQL + ', VALORESPERADO   = ' + OraNumero(sValorEsperado);
      sSQL := sSQL + ', SITRECEBIMENTO = ''3'' ';
    end;
  end;

  if bDtVencTmpDesc then
    sSQL := sSQL +', DATARECEBIMENTO = TO_DATE('''+Trim(qryAlteracao.FieldbyName('DATARECEBIMENTO').AsString)+''', ''dd/mm/yyyy'') '
  Else
    sSQL := sSQL +', DATARECEBIMENTO = TO_DATE('''+Trim(dtRecebimento.Text)+''', ''dd/mm/yyyy'') ';

  if (qryAlteracao.FieldByName('CODPORTFORMA').AsString <> '') and
     (qryAlteracao.FieldByName('CODPORTFORMA').AsString <> '-') then
    sSQL := sSQL + ', CODPORTFORMA = '+ qryAlteracao.FieldByName('CODPORTFORMA').AsString;

  // Se a contribuicao foi descontada na folha de beneficio ou se o participante
  // for funcinario da propria fundacao
  // Entao atualizar o coddocumentoprev
  if ((qryAlteracao.FieldByName('FlgDescFolha').AsString  = 'B') or
      ( (qryAlteracao.FieldByName('FlgDescFolha').AsString  = 'P') and
      (qryAlteracao.FieldByName('IdPessJur').AsInteger = iIdFundacao) ) ) and
     (Trim(qryAlteracao.FieldByName('CodDocumentoPrev').AsString) <> '') then
    sSQL := sSQL + ', CODDOCUMENTOPREV = '+ qryAlteracao.FieldByName('CODDOCUMENTOPREV').AsString;


  // caso a folha da fundaçlão tenha processado, macar como "F"
  if qryAlteracao.FieldByName('IDMODULO').AsString  = '21' then
    sSQL := sSQL + ', FOLHAORIGEM = ''F'' '
  else if qryAlteracao.FieldByName('FlgDescFolha').AsString  = 'B' then
    sSQL := sSQL + ', FOLHAORIGEM = ''B'' '
  else
    if qryAlteracao.FieldByName('FlgDescFolha').AsString  = 'P' then
      sSQL := sSQL + ', FOLHAORIGEM = ''P'' '
    else
      if qryAlteracao.FieldByName('FlgDescFolha').AsString  = '0' then
      begin
        if rgrpTipoFolha.ItemIndex = 1 then
          sSQL := sSQL + ', FOLHAORIGEM = ''B'' '
        else
          sSQL := sSQL + ', FOLHAORIGEM = ''P'' ';
      end;

  if rgrpTipoFolha.ItemIndex = 1 then
    sFolhaOrigem := 'B'
  else
    sFolhaOrigem := 'P';

  sSQL := sSQL + ', FLGDESCFOLHA = 1 '; 

  if psFlgDevolucao = '1'
    then sSQL := sSQL + ', FLGDEVOLUCAO = 1 '
    Else sSQL := sSQL + ', FLGDEVOLUCAO = 0 ';

  bAlterou := False;

  if Trim(psIdMotivo) = '' then
    psIdMotivo := qryAlteracao.FieldByName('IDMOTIVO').AsString;

  sIdMotivoParametro := psIdMotivo;

  if sFolhaOrigem = 'B' then
  begin
    psIdMotivo:=psIdMotivo+', '+
                IntToStr(prmIDMOTIVOFOLHABEN)+', '+
                IntToStr(prmIDMOTIVODEVOLBEN); 

    if prmIdMotDevolNaoIden > 0
    then psIdMotivo := psIdMotivo + ', ' + IntToStr(prmIdMotDevolNaoIden);

    if prmIdMotivoAcertoFL > 0
    then psIdMotivo := psIdMotivo + ', ' + IntToStr(prmIdMotivoAcertoFL);

    if prmIdMotivoAcertoMigracaoPlano > 0
    then psIdMotivo := psIdMotivo + ', ' + IntToStr(prmIdMotivoAcertoMigracaoPlano);

    if prmIDMOTIVOQUITANT > 0
    then psIdMotivo := psIdMotivo + ', ' + IntToStr(prmIDMOTIVOQUITANT);

    if prmIdMotAbnFolhaFund > 0
    then psIdMotivo := psIdMotivo + ', ' + IntToStr(prmIdMotAbnFolhaFund);

  end

  else
    if ((qryAlteracao.fieldbyname('FLGATRASODEVOL').AsString = 'A') and
        (prmIdMotivoContribAtraso > 0 )) then
      psIdMotivo := psIdMotivo+ ', '+IntToStr(prmIdMotivoContribAtraso)
    else
      if ((qryAlteracao.fieldbyname('FLGATRASODEVOL').AsString = 'D') and
          (prmIdMotivoContribDevoluc > 0 )) then
        psIdMotivo := psIdMotivo+ ', '+IntToStr(prmIdMotivoContribDevoluc)
      else
        psIdMotivo:=psIdMotivo+ ', '+
                    IntToStr(prmIdMotivoContrib)+', '+
                    IntToStr(prmIdMotivoFERIAS);    

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV H SET ' + sSQL + #13 +
                 ' WHERE H.IDPESSJUR      = '   + IntToStr(qryAlteracao.FieldByName('IDPESSJUR').AsInteger) + ' AND ' + #13 +
                 '       H.IDPLANOPREV    = '   + IntToStr(qryAlteracao.FieldByName('IDPLANOPREV').AsInteger) + ' AND ' + #13 +
                 '       H.IDPESSOA       = '   + IntToStr(qryAlteracao.FieldByName('IDPESSOA').AsInteger)+ ' AND ' + #13 +
                 '       H.SEQPROPOSTA    = '   + IntToStr(qryAlteracao.FieldByName('SeqProposta').AsInteger)+ ' AND ' + #13 +
                 '       H.MESREFERENCIA  = ''' + qryAlteracao.FieldByName('MESREFERENCIA').AsString + ''' AND ' + #13 +
                 '       H.IDCONTRIBUICAO = '   + IntToStr(qryAlteracao.FieldByName('IDDESCONTO').AsInteger) + ' AND ' + #13 +
                 '       ( (H.FOLHAORIGEM = '''+sFolhaOrigem+''') OR (H.FOLHAORIGEM IS NULL)) AND '+ #13 + 
                 '       H.MESCOBRANCA    = ''' + qryAlteracao.FieldByName('MESCOBRANCA').AsString+''' AND ');

  if Trim(psIdLote) <> ''
  then begin
    qryAux.SQL.Add('       ( (H.IDLOTE   = '+OraNumero(psIdLote)+') OR '+#13);
    qryAux.SQL.Add('         (EXITS (SELECT 1 '+ #13 +
                   '                 FROM TMPDESC TD'+ #13 +
                   '                 WHERE (TD.IDPESSJUR             = H.IDPESSJUR)'+ #13 +
                   '                   AND (TD.IDPLANOPREV           = H.IDPLANOPREV)'+ #13 +
                   '                   AND (TD.IDPESSOA              = H.IDPESSOA)'+ #13 +
                   '                   AND (TD.SEQPROPOSTA           = H.SEQPROPOSTA)'+ #13 +
                   '                   AND (TD.MESREFERENCIA         = H.MESREFERENCIA)'+ #13 +
                   '                   AND (TD.MESCOBRANCA           = H.MESCOBRANCA)'+ #13 +
                   '                   AND (TD.IDDESCONTO            = H.IDCONTRIBUICAO)'+ #13 +
                   '                   AND ( (H.FOLHAORIGEM = ''B'') OR (H.FOLHAORIGEM IS NULL) )'+ #13 +
                   '                   AND (TD.IDLOTE                = '+OraNumero(psIdLote)+')'+ #13 +
                   '                   AND (TD.VALOR                 = H.VALORESPERADO)'+ #13 +
                   '                   AND (NVL(H.VALORRECEBIDO,0)   = 0)'+ #13 +
                   '                   AND (TD.NUMRECEBIMENTO        = '+OraNumero(qryAlteracao.FieldByName('NUMRECEBIMENTO').AsString)+' )'+ #13 +
                   '                   AND (DECODE(TD.FLGATRASODEVOL,''D'',1,0) = H.FLGDEVOLUCAO) ) )');
  end;

  if (sFolhaOrigem = 'B') then
   qryAux.SQL.Add('NVL(H.VALORRECEBIDO,0) = 0 AND ');  

  if (sFolhaOrigem = 'B') and (aiNumRecebimento > 0) then
  begin
    qryAux.SQL.Add('NUMRECEBIMENTO = '+inttostr(aiNumRecebimento)+' AND ');
  end;
  if (sFolhaOrigem = 'P') then
    qryAux.SQL.Add('H.SITRECEBIMENTO IN (0,1) AND '); 

  if  (sFolhaOrigem = 'P') and
      (qryAlteracao.FieldByName('IDPESSJUR').AsInteger = iIdFundacao) and
      (psFlgDevolucao = '1') then
    qryAux.SQL.Add('       H.FLGDEVOLUCAO = 1')
  else
  begin
    if Not chkOutrosMotivos.Checked  
     then qryAux.SQL.Add('       ((IDMOTIVO     IN ('+ psIdMotivo+') ) '+  
                   ' OR (FLGEVENTO = 1) OR (FLGMANUAL = 1) ) AND '); 

    if psFlgDevolucao = '1' then
      qryAux.SQL.Add('       H.FLGDEVOLUCAO = 1 ')
    Else
      qryAux.SQL.Add('       NVL(H.FLGDEVOLUCAO,0) = 0 ');  
  end;

  try
    qryAux.ExecSQL;
    //if qryAux.RowsAffected >= 1 then //Renato Visoni SOL 118326 KINTANA 561346
      //bAlterou := True;  //Renato Visoni SOL 118326 KINTANA 561346
  except
    exit;
  end; //try

  //Renato Visoni SOL 118326 KINTANA 561346
  qryAux.Close;
  qryAux.SQL.Clear;


  qryAux.SQL.Add(' SELECT COUNT(*) TOTAL FROM HSTCONTRIBPREV H  ' + #13 +
                 ' WHERE H.IDPESSJUR      = '   + IntToStr(qryAlteracao.FieldByName('IDPESSJUR').AsInteger) + ' AND ' + #13 +
                 '       H.IDPLANOPREV    = '   + IntToStr(qryAlteracao.FieldByName('IDPLANOPREV').AsInteger) + ' AND ' + #13 +
                 '       H.IDPESSOA       = '   + IntToStr(qryAlteracao.FieldByName('IDPESSOA').AsInteger)+ ' AND ' + #13 +
                 '       H.SEQPROPOSTA    = '   + IntToStr(qryAlteracao.FieldByName('SeqProposta').AsInteger)+ ' AND ' + #13 +
                 '       H.MESREFERENCIA  = ''' + qryAlteracao.FieldByName('MESREFERENCIA').AsString + ''' AND ' + #13 +
                 '       H.IDCONTRIBUICAO = '   + IntToStr(qryAlteracao.FieldByName('IDDESCONTO').AsInteger) + ' AND ' + #13 +
                 '       ( (H.FOLHAORIGEM = '''+sFolhaOrigem+''') OR (H.FOLHAORIGEM IS NULL)) AND '+ #13 +
                 '       H.MESCOBRANCA    = ''' + qryAlteracao.FieldByName('MESCOBRANCA').AsString+''' ' );


  if (sFolhaOrigem = 'B') and (aiNumRecebimento > 0) then
  begin
    qryAux.SQL.Add('AND NUMRECEBIMENTO = '+inttostr(aiNumRecebimento));
  end;

  if Not chkOutrosMotivos.Checked
  then qryAux.SQL.Add('AND((IDMOTIVO     IN ('+ psIdMotivo+') ) '+ ' OR (FLGEVENTO = 1) OR (FLGMANUAL = 1) )  ');

  qryAux.Open;

  if qryAux.FieldByname('Total').asInteger > 0 then begin
    bAlterou := True;
  end;

  //Fim Renato Visoni SOL 118326 KINTANA 561346



  // Se alterou e for uma contribuicao de parcelamento, atualizar numero de parcelas pagas
  if (bAlterou) and
     (qryAlteracao.FieldByName('FLGPARCELAMENTO').AsInteger = 1) then
  begin
    bVeioDeEvento := True; // SOL 127451 Ádler Souza

    frmparcelamento.TrazDadosParcela(
      qryaux,
      qryAlteracao.FieldbyName('IdPessJur').AsString,
      qryAlteracao.FieldbyName('IdPlanoPrev').AsString,
      qryAlteracao.FieldbyName('IdPessoa').AsString,
      sIdParcelamento,
      sAux, sAux,  sAux, sAux, sAux, sAux, iAux);
  end;

  Result := True;
end;



function TfrmRecebeContribuicao.GravaTotalExclusivaPatro(iIdPessJur: integer; sIDPlanos: string): boolean;
var
  sSQLValues,
  sValorRegra,
  sDataPrevista,
  sDescPreparo,
  sAnoMesCalculo   : string;
  rTotal, rEnvio   : extended;

  iNumReg,
  iParcela, iNumRecebimento, iIdLote : integer;

  bCobrouTudo,
  bCobrou13,
  bAlgumaExclusiva  : boolean;
begin
  Result := False;

  // Abrir query com as contribuicoes EXCLUSIVAS da patrocinadora que sejam
  // associadas aos eventos de Inscricao , Reinscricao ou Mantido Parcial
  qryContribPatro.Close;
  qryContribPatro.ParamByName('PIIDPESSJUR').AsInteger     := iIdPessJur;
  qryContribPatro.ParamByName('ANOMESCOBRANCA').AsString   := sAnoMesCobrancaTela; 
  qryContribPatro.SQL.add('AND    (PL.IDPLANOPREV IN ( ' + sIDPlanos + ' ))');

  qryContribPatro.Open;
  if qryContribPatro.IsEmpty
  then begin
     Result := True;
     memResult.Lines.Add(' ');
     Exit;
  end;

  rTotal := 0;
  iIdLote := LeUltRegistro(qryAux,'CTRLINTERFACE');

  if sAnoMesCobrancaTela = '' then Exit;

  iNumReg  := 0;

  bAlgumaExclusiva := False;
  bCobrouTudo      := False;
  bCobrou13        := False;

  sDataPrevista := CriticaDataCobrancaSit(dtmAPrev.qry,
                                          qryContribPatro.FieldByName('IDPESSJUR').AsString,
                                          qryContribPatro.FieldByName('IDPLANOPREV').AsString,
                                          'PT', 'N',
                                          Copy(sAnoMesCobrancaTela,6,2),
                                          Copy(sAnoMesCobrancaTela,1,4));

  if Trim(sDataPrevista) = '' then sDataPrevista := DateToStr(date);


  sAnoMesCalculo   := sAnoMesCobrancaTela;
  qryContribPatro.First;
  while (not qryContribPatro.EOF)   do
  begin
      // Testa Periodicidade - Verifica se a contribuição deve ser cobrada
      // no mês de cobranca informado
      if not TestaPeriodicidade(qryContribPatro.FieldByName('QTDEMESES').AsString,
                                qryContribPatro.FieldByName('ULTMESPREPARO').AsString,
                                sAnoMesCobrancaTela)
      then begin
         qryContribPatro.Next;
         Continue;
      end;

      qryRegra.Close;
      qryRegra.ParamByName('IdPessJur').AsInteger       := iIdPessJur;
      qryRegra.ParamByName('IdPlanoPrev').AsInteger     := qryContribPatro.FieldByName('IDPLANOPREV').AsInteger;
      qryRegra.ParamByName('IdContribuicao').AsInteger  := qryContribPatro.FieldByName('IDCONTRIBUICAO').AsInteger;
      qryRegra.ParamByName('IdRegraCalculo').AsInteger  := qryContribPatro.FieldByName('IDREGRACALCULO').AsInteger;
      qryRegra.ParamByName('ValorBase1').AsString       := OraNumero(qryContribPatro.FieldByName('ValorBase1').AsString);
      qryRegra.ParamByName('ValorBase2').AsString       := OraNumero(qryContribPatro.FieldByName('ValorBase2').AsString);
      qryRegra.ParamByName('ValorBase3').AsString       := OraNumero(qryContribPatro.FieldByName('ValorBase3').AsString);

      qryRegra.ParamByName('pMesReferencia').AsString   := sAnoMesCalculo;
      qryRegra.ParamByName('DataRef').AsString          := '01/'+Copy(sAnoMesCobrancaTela,6,2)+'/'+Copy(sAnoMesCobrancaTela,1,4);
      qryRegra.Open;

      if (qryRegra.IsEmpty) or (StrToInt(qryRegra.FieldByName('IDREGRACALCULO').AsString) <= 0)
      then begin
         qryContribPatro.Next;
         Continue;
      end;


      regCalculo.QueryIn  := qryRegra;
      regCalculo.RuleName := qryRegra.FieldByName('IDREGRACALCULO').AsString;

      try
         regCalculo.Execute;
      except
         memResult.Lines.Add('Erro na Execução da Regra de Cálculo do Total de Contribuições Exclusivas da Patrocinadora');
         bErro := True;
         TiraSQL(qryAux);
      end;

      if regCalculo.Result <> ''
      then sValorRegra := ClienteNumero(regCalculo.Result)
      else sValorRegra := '0';

      if StrToFloat(ClienteNumero(sValorRegra)) <= 0
      then begin
         qryContribPatro.Next;
         Continue;
      end;

      rTotal := rTotal + StrToFloat(ClienteNumero(sValorRegra));

      iNumRecebimento := LeUltRegistro(qryAux,'HSTCONTRIBPREV');
      sSQLValues := IntToStr(iNumRecebimento) + ','; // NUMRECEBIMENTO

      sSQLValues := sSQLValues + IntToStr(prmIdMotivoContrib) + ','; // IDMOTIVO

      // A contribuicao que está sendo inserida neste momento é a contribuicao
      // normal do mês; logo, o mes de referencia é igual ao mes de cobranca
      // a menos que seja a contribuicao sobre 13o.
      sSQLValues := sSQLValues + '''' +sAnoMesCalculo + '''' + ','; // MESREFERENCIA
      sSQLValues := sSQLValues + '''' +sAnoMesCobrancaTela + '''' + ','; // MESCOBRANCA
      sSQLValues := sSQLValues + qryContribPatro.FieldByName('IDPESSJUR').AsString + ','; // IDPESSJUR
      sSQLValues := sSQLValues + qryContribPatro.FieldByName('IDPESSOA').AsString + ','; // IDPESSOA
      sSQLValues := sSQLValues + qryContribPatro.FieldByName('IDPLANOPREV').AsString + ','; // IDPLANOPREV
      sSQLValues := sSQLValues + qryContribPatro.FieldByName('SEQPROPOSTA').AsString + ','; // SEQPROPOSTA
      sSQLValues := sSQLValues + qryContribPatro.FieldByName('IDCONTRIBUICAO').AsString + ','; // IDCONTRIBUICAO
      sSQLValues := sSQLValues + OraNumero(sValorRegra) + ','; // VALORCALCULADO
      sSQLValues := sSQLValues + OraNumero(sValorRegra) + ','; // VALORESPERADO
      sSQLValues := sSQLValues + '''0''' + ',';                // SITRECEBIMENTO
      sSQLValues := sSQLValues + 'NULL' + ',';                 // DATARECEBIMENTO

      if qryContribPatro.FieldByName('CODPORTFORMA').AsString <> '' // CODPORTFORMA
      then sSQLValues := sSQLValues + qryContribPatro.FieldByName('CODPORTFORMA').AsString + ','
      else sSQLValues := sSQLValues + 'NULL' + ',';

      sSQLValues := sSQLValues + IntToStr(iIdLote) + ','; // IDLOTE

      sSQLValues := sSQLValues + '''' + qryContribPatro.FieldByName('FLGDESCFOLHA').AsString + '''' + ','; // FLGDESCFOLHA

      // Pega Data de Previsão de Recebimento
      if (qryContribPatro.FieldByName('DIAVENCIMENTO').AsString <> '') and
         (qryContribPatro.FieldByName('DIAVENCIMENTO').AsString <> '0')
      then sDataPrevista := qryContribPatro.FieldByName('DIAVENCIMENTO').AsString +
                            Copy(sDataPrevista,3,8);

      sSQLValues := sSQLValues + 'TO_DATE(''' + sDataPrevista + ''',''dd/mm/yyyy'')' + ',';

      sSQLValues := sSQLValues + '0' + ','; // FLGCALCRESERVA

      sSQLValues := sSQLValues + '''F'','; // TIPO

      sSQLValues := sSQLValues + '''' + qryContribPatro.FieldByName('FLGINTERNO').AsString + '''' + ','; //FLGSITFUNDACAO

      if qryContribPatro.FieldByName('IDREGRACALCULO').AsString <> ''
      then sSQLValues := sSQLValues + qryContribPatro.FieldByName('IDREGRACALCULO').AsString + ','
      else sSQLValues := sSQLValues + 'NULL';

      if iParcela < 0 then iParcela := 0;
      sSQLValues := sSQLValues + IntToStr(iParcela) + ','; // PARCELA

      if Trim(qryContribPatro.FieldByName('VALORBASE1').AsString) <> '' // VALOROP1
      then sSQLValues := sSQLValues + oranumero(qryContribPatro.FieldByName('VALORBASE1').AsString) + ','
      else sSQLValues := sSQLValues + 'NULL' + ',';

      if Trim(qryContribPatro.FieldByName('VALORBASE2').AsString) <> '' // VALOROP2
      then sSQLValues := sSQLValues + oranumero(qryContribPatro.FieldByName('VALORBASE2').AsString) + ','
      else sSQLValues := sSQLValues + 'NULL' + ',';

      if Trim(qryContribPatro.FieldByName('VALORBASE3').AsString) <> '' // VALOROP3
      then sSQLValues := sSQLValues + oranumero(qryContribPatro.FieldByName('VALORBASE3').AsString)                                                      + ','
      else sSQLValues := sSQLValues + 'NULL' + ',';

      if Trim(qryContribPatro.FieldByName('DATAINICIO').AsString) <> '' // DATAINICIO
      then sSQLValues := sSQLValues + 'TO_DATE(''' + qryContribPatro.FieldByName('DATAINICIO').AsString + ''',''dd/mm/yyyy'') ' + ','
      else sSQLValues := sSQLValues + 'NULL' + ',';

      if Trim(qryContribPatro.FieldByName('DATAFINAL').AsString) <> '' // DATAFINAL
      then sSQLValues := sSQLValues + 'TO_DATE(''' + qryContribPatro.FieldByName('DATAFINAL').AsString + ''',''dd/mm/yyyy'') '
      else sSQLValues := sSQLValues + 'NULL';


      if rgrpTipoFolha.ItemIndex = 1
      then sSQLValues := sSQLValues + ',  ''B'' '
      else sSQLValues := sSQLValues + ',  ''P'' ';

      sSQLValues := sSQLValues +','+ RetornaIdTitular(qryContribPatro.FieldByName('IDPESSOA').AsString ,qryContribPatro.FieldByName('IDPLANOPREV').AsString); //henrique Sol 108902


      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' INSERT INTO HSTCONTRIBPREV(NUMRECEBIMENTO, IDMOTIVO, MESREFERENCIA, ' +
                     '                            MESCOBRANCA, IDPESSJUR, IDPESSOA, IDPLANOPREV, ' +
                     '                            SEQPROPOSTA, IDCONTRIBUICAO, VALORCALCULADO, ' +
                     '                            VALORESPERADO, SITRECEBIMENTO, ' +
                     '                            DATARECEBIMENTO, CODPORTFORMA, IDLOTE, ' +
                     '                            FLGDESCFOLHA, DATAPREVISAORECE, ' +
                     '                            FLGCALCRESERVA, TIPO, FLGSITFUNDACAO, ' +
                     '                            IDREGRACALCULO, PARCELA, VALOROP1, VALOROP2, ' +
                     '                            VALOROP3, DATAINICIO, DATAFINAL, FOLHAORIGEM) ' +
                     ' VALUES (' + sSQLValues + ')');
      try
         qryAux.ExecSQL;
      except
         bErro := True;
      end; //try

      // Atualiza ULTMESPREPARO
      with qryAux do
      begin
          Close;
          SQL.Clear;
          SQL.Add(' UPDATE CONTRIBPREVPATRO SET ULTMESPREPARO = ''' + sAnoMesCobrancaTela + '''' +
                  ' WHERE  IDPESSOA       = ' + IntToStr(iIdPessJur) + ' AND ' +
                  '        IDCONTRIBUICAO = ' + qryContribPatro.FieldByName('IDCONTRIBUICAO').AsString + ' AND ' +
                  '        IDPLANOPREV    = ' + qryContribPatro.FieldByName('IDPLANOPREV').AsString);
          try
             ExecSQL;
          except
             bErro := True;
          end;
      end;

      if Copy(sAnoMesCalculo,6,2) = '13'
      then bCobrou13 := True
      else bCobrou13 := False;

      bAlgumaExclusiva := True;

      // Se for o mes de cobrar o 13o. da contribuicao, mudar o mes para ano/13
      // e voltar para o inicio do loop, sem ir para o proximo registro da query
      if ( sAnoMesCobranca13 = sAnoMesCobrancaTela ) and
         (not bCobrou13)
      then begin
         if qryPatro.FieldByName('FlgAno13').AsString = 'C'
         then sAnoMesCalculo := Copy(sAnoMesCobrancaTela,1,4)+'/13'
         else sAnoMesCalculo := Copy(SAnoMesAnterior(Copy(sAnoMesCobrancaTela,1,4)+'/01'),1,4)+'/13';
         Continue;
      end
      else begin
         sAnoMesCalculo := sAnoMesCobrancaTela;
      end;

      inc(iNumReg);
      qryContribPatro.Next;
  end;

  // Insere no CTRLINTERFACE
  if bAlgumaExclusiva
  then begin
     sDescPreparo := 'Contribuições exclusivas da Patrocinadora ' + qryPatro.FieldByName('NOME').AsString;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' INSERT INTO CTRLINTERFACE ' +
                    ' (MESREFERENCIA, TIPO, IDPESSOA, FLGIDATMP, ' +
                    '  DATAIDATMP, IDLOTE, NUMREG, VLRTOTAL, ' +
                    '  FLGPREPARADO, DESCRICAO, DATAPREPARO) ' +
                    '  VALUES (' + '''' + sAnoMesCobrancaTela + ''','+
                    '  ''P'' ' + ',' +
                       IntToStr(iIdPessJur) + ',' + ' 0, ' +
                    '  NULL, '+ IntToStr(iIdLote)+ ',' + IntToStr(iNumReg)  + ',' +
                       OraNumero(FloatToStr(rTotal))+ ',' +
                    '  1, ' + '''' + sDescPreparo + '''' + ',' + 'SYSDATE' + ')');

     try
        qryAux.ExecSQL;
     except
        bErro := True;
     end; //try
  end;

  Result := True;
end; // GravaTotalExclusivaPatro



procedure TfrmRecebeContribuicao.bbtnReceberClick(Sender: TObject);
var
  i, pl             : integer;
  iIdPatrocinadora  : longint;
  sNomePatro,
  sIDPlanos,
  sMsgErro          : string;
  bInterrompida     : Boolean;
  cTipoEnvPrev      : Char;
  sLogTotalPrev     : string;
  sMsg              : string;
  lbIntegracaoOK    : Boolean;
  

  //Renato Visoni SOL 130015  Kintana 717839
  sSQLwhere,sMsgPga : String;
  x : Integer;
  //Renato Visoni SOL 130015  Kintana 717839
begin
  inherited;

  //Renato Visoni SOL 130015  Kintana 717839
  sSQLwhere :='';
  sMsgPga   :='';
  listaDocumento := TstringList.Create;
  //Renato Visoni SOL 130015  Kintana 717839



  // Daniel Begnami 29/08/2008 Sol: 94507 - KT: 407722
  sAnoMesCobrancaTela  := Trim(spedAnoCob.Text)+'/';

  If cmbMesCob.ItemIndex <= 8 Then
    sAnoMesCobrancaTela := sAnoMesCobrancaTela+'0'+IntToStr(cmbMesCob.ItemIndex+1)
  Else
    sAnoMesCobrancaTela := sAnoMesCobrancaTela+IntToStr(cmbMesCob.ItemIndex+1);

  sIDPlanos := '';
  For i := 0 to (chklstPlano.Items.Count -1) do
  Begin
    If chklstPlano.Checked[i] Then
    Begin
      If qryPlano.Locate('Nome', chklstPlano.Items[i], [loCaseInsensitive, loPartialKey]) Then
        sIDPlanos := sIDPlanos + qryPlano.FieldByName('IDPLANOPREV').AsString + ', ';
    End;
  End;

  If Trim(sIDPlanos) <> '' Then
    sIDPlanos := Copy(sIDPlanos, 1, Length(sIDPlanos) -2);
  // Fim

  // Para cada patrocinadora, fazer o RECEBIMENTO  da cobrança
  for i := 0 to (chklstPatro.Items.Count - 1) do
  begin
    if not(chklstPatro.Checked[i]) then Continue;

    //Localiza id da Patro
    if not(qryPatro.Locate('Nome', chklstPatro.Items[i], [loCaseInsensitive, loPartialKey])) then Continue;

    iIdPatrocinadora := qryPatro.FieldByName('IDPESSOA').AsInteger;
    sNomePatro       := qryPatro.FieldByName('NOME').AsString;

    // ---------------------------------------------------------------------------------------------
    //William Moreira da Silva - SOL 230424 PPM 353071
    //if not(VerificaVencimento(iIdPatrocinadora)) then
    if not(VerificaVencimento(iIdPatrocinadora, sIDPlanos)) then
    begin
      sMsg := 'Foram achadas divergências nas datas de vencimentos dos planos desta patrocinadora.' + #13 +
              'O recebimento será encerrado!';

       MsgDlg(sMsg, Sistema.NomeModulo, mtError, [mbOk], 0);
       Repaint;

       memResult.Lines.Add('[ERRO ] - Divergências nas datas de vencimentos dos planos da patrocinadora '+sNomePatro+'.');
       memResult.Lines.Add('          Verifique calendário.');

       frmAguarde.Apaga; 
       Exit;
    end;
    // ---------------------------------------------------------------------------------------------

    // Gravar memo de Resultado
    memResult.Lines.Add('--------------------------------------------------------------------');
    memResult.Lines.Add('Patrocinadora : ' + qryPatro.FieldByName('NOME').AsString);
    memResult.Lines.Add('--------------------------------------------------------------------');

    // ---------------------------------------------------------------------------------------------
    if VerificaMotivosNaHistContrib(iIdPatrocinadora) then
    begin
      sMsg := 'Foram achadas contribuições com origem não reconhecida pelo sistema.' + #13 +
              'Deseja continuar assim mesmo?';

      if MsgDlg(sMsg, Sistema.NomeModulo, mtError, [mbYes, mbNo],0) = mrNo then
      begin
        if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;

        frmAguarde.Apaga;
        pgctrlOpcoes.ActivePage := tbsResultado;
        memResult.Lines.Add('[ERRO ] - Contribuiçoes com origem não reconhecida (Término solicitado pelo operador).');
        Exit;
      end;
    end;  //
    // ---------------------------------------------------------------------------------------------


    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // testa se o usuário marcou a opção de apenas integrar
    if not(chkIntegra.Checked) then
    begin
      // Se for a própria fundação E esteja rodando recebimento de folha da patro
      // Entao atualizar o salparticipacao  através da histrubsal
      if (qryPatro.FieldByName('IdPessoa').AsInteger = iIdFundacao) and (rgrpTipoFolha.ItemIndex = 0) then
      begin
        if not(dtmBaseDados.dbBaseDados.InTransaction) then dtmBaseDados.dbBaseDados.StartTransaction;

        frmAguarde.Mostra(sNomePatro + ' - Atualizando Salário de Participação ... ');

        sSQL :=
        'SELECT '                                                                                       + #13 +
        '  EL.MATRICULA, H.MES, H.MESCOBRANCA, H.IDPESSOA, H.IDPESSJUR, H.VALORPROVENTO, '              + #13 +
        '  PP.IDPLANOPREV, P.IDRUBSALPARTICIP '                                                         + #13 +

        'FROM '                                                                                         + #13 +
        '  HISTRUBSAL   H,  '                                                                           + #13 +
        '  ELEGPATRO    EL, '                                                                           + #13 +
        '  PARTPREVPLAN PP, '                                                                           + #13 +
        '  PATRO        P   '                                                                           + #13 +

        'WHERE '                                                                                        + #13 +
        '      PP.IDPESSJUR     = ' + qryPatro.FieldByName('IDPESSOA').AsString                         + #13 +
        '  AND TO_CHAR(PP.INSCRICAODATA, ''YYYY/MM'')     <= ' + QuotedStr(sAnoMesCobrancaTela)         + #13 +
        '  AND ( '                                                                                      + #13 +
        '      (PP.DATACANCELAMENTO IS NULL) OR '                                                       + #13 +
        '      (TO_CHAR(PP.DATACANCELAMENTO, ''YYYY/MM'') >= ' + QuotedStr(sAnoMesCobrancaTela) + ') '  + #13 +
        '      ) '                                                                                      + #13 +
        '  AND EL.IDPESSJUR     = PP.IDPESSJUR '                                                        + #13 +
        '  AND EL.IDPESSOA      = PP.IDPESSOA '                                                         + #13 +
        '  AND P.IDPESSOA       = PP.IDPESSJUR '                                                        + #13 +
        '  AND H.IDPESSJUR(+)   = P.IDPESSOA '                                                          + #13 +
        '  AND H.MESCOBRANCA(+) = ' + QuotedStr(sAnoMesCobrancaTela)                                    + #13 +
        '  AND H.IDRUBRICA(+)   = P.IDRUBSALPARTICIP '                                                  + #13;

        if Trim(edNome.Text) <> '' then sSQL := sSQL + 
        '  AND PP.IDPESSJUR     = ' + OraNumero(MontaSelectPart.ValoresChave[0])                        + #13 +
        '  AND PP.IDPLANOPREV   = ' + OraNumero(MontaSelectPart.ValoresChave[1])                        + #13 +
        '  AND PP.IDPESSOA      = ' + OraNumero(MontaSelectPart.ValoresChave[2])                        + #13 +
        '  AND PP.SEQPROPOSTA   = ' + OraNumero(MontaSelectPart.ValoresChave[3]) ;

        qrySalPart.Close;
        qrySalPart.SQL.Clear;
        qrySalPart.SQL.Text := sSQL;
        qrySalPart.Open;

        // -----------------------------------------------------------------------------------------

        while not(qrySalPart.EOF) do
        begin
          if qrySalPart.FieldByName('IDRUBSALPARTICIP').AsInteger <= 0 then
          begin
            memResult.Lines.Add('[AVISO] - Rubrica de Salário de Participação da Fundação não parametrizada.');
            Break;
          end;

          if qrySalPart.FieldByName('VALORPROVENTO').AsFloat <= 0 then
          begin
            memResult.Lines.Add('[AVISO] - Matrícula : '+qrySalPart.FieldbyName('MATRICULA').AsString+'- Rubrica de Salário de Participação não gerada pela Folha de Pagamento.');
            qrySalPart.Next;
            Continue;
          end;

          sSQL :=
          ' UPDATE  PARTPREVPLAN SET SALPARTICIPACAO = '+oranumero(qrySalPart.fieldbyname('VALORPROVENTO').AsString)+
          ' WHERE   IDPESSJUR     = '+qrySalPart.fieldbyname('IDPESSJUR').AsString+
          ' AND     IDPESSOA      = '+qrySalPart.fieldbyname('IDPESSOA').AsString+
          ' AND     FLGDESATIVADO = 0  ';

          try
            ExecutarQuery(qryAux,sSQL)
          except
            raise;
          end;

          qrySalPart.next;
        end;  // while not(qrySalPart.EOF)

        // -----------------------------------------------------------------------------------------

        memResult.Lines.Add('[OK   ] - Atualização do Salário de Participação');
        frmAguarde.Apaga;

        // Buscar se existem rubricas de contribuição na HISTRUBSAL que não existem
        // na TMPDESC. Se encontrar, inseri-las na TMPDESC para que o recebimento
        // possa recebê-las
        frmAguarde.Mostra(sNomePatro+' - Verificando Rubricas Extras da Folha de Pagamento ...');
        if not(VerificaRubricasNaHistRubSal) then
        begin
           memResult.Lines.Add('[ERRO ] - Verificação de Rubricas Extras da Folha de Pagamento da Fundação.');
           bErro :=  True;
        end;
        memResult.Lines.Add('[OK   ] - Verificação de Rubricas Extras da Folha de Pagamento da Fundação.');
        frmAguarde.Apaga;

      end;  // if (qryPatro.FieldByName('IdPessoa').AsInteger = iIdFundacao) and (rgrpTipoFolha.ItemIndex = 0)

      // -------------------------------------------------------------------------------------------

      // Se estiver rodando recebimento de folha da patrocinadora
      // Entao Testar se Total do Salario de Participacao está na HSTRUBRICAXPESS
      if (rgrpTipoFolha.ItemIndex = 0) then
      begin
        frmAguarde.Mostra(sNomePatro + ' - Verificando Total da Folha de Pagamento ...');

        with qrySalPart do
        begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT VALORACUMULADO FROM HSTRUBRICAXPESS '+
                  ' WHERE  IDPESSOA      = '+qryPatro.FieldByName('IdPessoa').AsString+
                  ' AND    IDPLANOPREV   IN (' + sIDPlanos + ') ' +  //ClaudioR - 25/07/2007 - CM 22017
                  ' AND    MESREFERENCIA = '''+sAnoMesCobrancaTela+'''');
          Open;

          if IsEmpty then
          begin
              sSQL:=' SELECT SUM(SALPARTICIPACAO) VALORTOTPART , IDPLANOPREV FROM '+
                ' PARTPREVPLAN WHERE '+
                ' IDPESSJUR = '+qryPatro.FieldByName('IdPessoa').AsString+'  '+
                ' AND IDPLANOPREV IN (' + sIDPlanos + ') ' +         //ClaudioR - 25/07/2007 - CM 22017
                ' AND EXISTS ( SELECT 1 FROM TMPDESC WHERE '+
                ' MESCOBRANCA = '''+sAnoMesCobrancaTela+'''  '+
                ' AND IDPESSJUR = PARTPREVPLAN.IDPESSJUR  '+
                ' AND IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV '+
                ' AND IDPESSOA = PARTPREVPLAN.IDPESSOA  '+
                ' AND NVL(SITENVIO,''0'') > ''0'' ) GROUP BY IDPLANOPREV  ';

              try
                 FazQuery(qrySalPart,sSQL);
              except
                 memResult.Lines.Add('[ERRO ] - Verificação do Total da Folha de Pagamento ...');
                 raise;
              end;

              qrySalPart.First;
              while not qrySalPart.EOF do
              begin
                 sSQL := 'INSERT INTO HSTRUBRICAXPESS (' +
                         'MESREFERENCIA,IDRUBRICA,VALORACUMULADO,IDPESSOA,IDPLANOPREV) ' +
                         'VALUES ( ' + '''' +sAnoMesCobrancaTela+ '''' + ', '+
                         ' '+qryPatro.FieldByName('IDRUBSALPARTICIP').AsString+' '+
                         ' ,' +oranumero(floattostr(qrySalPart.FieldByName('VALORTOTPART').AsFloat))+ ','+
                         ' '+qryPatro.FieldByName('IdPessoa').AsString+' '+
                         ' ,' +IntToStr(qrySalPart.fieldbyname('IDPLANOPREV').AsInteger) + ')';
                 try
                    ExecutarQuery(qryAux,sSQL)
                 except
                    memResult.Lines.Add('[ERRO ] - Gravação do Total da Folha de Pagamento ...');
                    raise;
                 end;
                 qrySalPart.Next;
              end;
          end;
        end;
        memResult.Lines.Add('[OK   ] - Verificação do Total da Folha de Pagamento ...');
        frmAguarde.Apaga;
      end;


      if rgrpTipoFolha.ItemIndex = 0 then
      begin
        frmAguarde.Mostra(sNomePatro + ' - Verificando se interface foi recebida ...');

        if not(InterfaceOk(iIdPatrocinadora, sNomePatro)) then
        begin
          memResult.Lines.Add('[AVISO] - Contribuições já recebidas. Mês de Recebimento Fechado.');
          frmAguarde.Apaga;
          Continue;
        end;
        frmAguarde.Apaga;
      end;


    end; // if not chkIntegra
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------


    bErro := False;
    if not(dtmBaseDados.dbBaseDados.InTransaction) then dtmBaseDados.dbBaseDados.StartTransaction;

    // Calcular o mes de cobranca do 13o. da patrocinadora que será feita agora
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT   MESREFERENCIA, IDREGRA AS IDRGSALARIO13 FROM PARAMSAL13  '+
                   ' WHERE    IDPESSJUR = '+IntToStr(iIdPatrocinadora)+
                   ' AND      EXERCICIO = '+Copy(sAnoMesCobrancaTela,1,4)+
                   ' AND      MESREFERENCIA >= '''+sAnoMesCobrancaTela+''''+
                   ' ORDER BY MESREFERENCIA ');
    qryAux.Open;

    if qryAux.IsEmpty then
      sAnoMesCobranca13 := '0000/00'
    else
    begin
      qryAux.First;
      sAnoMesCobranca13 := qryAux.FieldByName('MESREFERENCIA').AsString;
    end;

    // para ser usado nas funcoes
    // Receber contribuicoes da patrocinadora :
    // Para cada lote fazer
    //    -> Ler da tmpdesc
    //    -> Verificar se existe no hst
    //    -> Se existe, atualizar  Senao, inserir
    //    -> Se contribuicoes da patro por participante nao vem no interface
    //       Entao o sistema deve prepará-las (calcular), e colocar no
    //             hist. com valoresperado = calculado = recebido
    //       Senao (elas vem no interface)
    //             verificar as que nao vieram e colocar no hist.
    //             com valoresperado = calculado e recebido = 0
    //    -> Ao final do lote,
    //       Gerar CAR para a patrocinadora
    //       Contabilizar

    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------
    // testa se o usuário marcou a opção de apenas integrar
    if not(chkIntegra.Checked) then
    begin
      sTipoPagador := 'P';
      if not(RecebeContribuicao(iIdPatrocinadora, sNomePatro, sIDPlanos)) then bErro := True;

      if rgrpTipoFolha.ItemIndex = 1 then 
      begin
        sTipoPagador := 'N';

        if not(RecebeContribuicao(iIdPatrocinadora, sNomePatro, sIDPlanos)) then bErro := True;

        sTipoPagador := 'P';
      end;

         if rgrpTipoFolha.ItemIndex = 0 then
         begin
            // Calcular contribuicoes Exclusivas do mês
            frmAguarde.Mostra(sNomePatro+' - Verificando Contribuições Exclusivas ... ');
            if not GravaTotalExclusivaPatro(iIdPatrocinadora, sIDPlanos)
            then begin
               bErro := True;
               memResult.Lines.Add('[ERRO ] - Envio das contribuições exclusivas da Patrocinadora.');
            end
            else begin
               memResult.Lines.Add('[OK   ] - Envio das contribuições exclusivas da Patrocinadora.');
            end;
            frmAguarde.Apaga;

            // Verificar se a soma das contribuicoes que a patrocinadora
            // paga é superior a 10% do total da folha
            if not VerificaLimiteContribPATRO(iIdPatrocinadora, sAnoMesCobrancaTela, sAnoMesCobranca13, True, 'Normal',sMsgErro)
            then begin
               bErro := True;
               memResult.Lines.Add(sMsgErro);
               memResult.Lines.Add(' ');
               memResult.Lines.Add('Erro na Verificação do Limite das Contribuições da Patrocinadora.');
            end;
         end;

         // Baixar contribuicoes de participantes falecidas cobradas/devolvidas para seus beneficiarios
         if rgrpTipoFolha.ItemIndex = 1
         then begin
            frmAguarde.Mostra('Verificando Acertos Pós-Morte ...');
            if not BaixaAcertoFalecidos(iIdPatrocinadora)
            then begin
               bErro := True;
               memResult.Lines.Add('[ERRO ] - Baixa dos acertos de contribuição de participantes falecidos. ');
            end
            else begin
               memResult.Lines.Add('[OK   ] - Baixa dos acertos de contribuição de participantes falecidos. ');
            end;
            frmAguarde.Apaga;
         end;

      if ((rgrpTipoFolha.ItemIndex = 0) and (qryContribPatro.IsEmpty) and (bNaoExisteRecebPatro)) Or
         ((rgrpTipoFolha.ItemIndex = 1) and (qryContribPatro.IsEmpty) and (qryRecebimento.IsEmpty) and (bNaoExisteRecebPatro))
      then begin
        MsgDlg(' Não existem contribuições a serem recebidas da Patrocinadora ' + sNomePatro +'.','Informação',mtInformation,[mbOk,mbHelp],0);
        memResult.Lines.Add(' ');
        memResult.Lines.Add('[AVISO] - Não existem contribuições a serem recebidas da Patrocinadora.');
        if dtmBaseDados.dbBaseDados.InTransaction
        then dtmBaseDados.dbBaseDados.RollBack;
        Continue;
      end;
    end; //if not chkIntegra
    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------

    if bIntegraContab and
      ( ( (rgrpTipoFolha.ItemIndex = 0) and (qryPatro.FieldByName('FLGGERACAR').AsInteger = 1) ) or
          (rgrpTipoFolha.ItemIndex = 1) )
    then begin
       if not ContabilizaContribPATRO(iIdPatrocinadora, sIDPlanos)
       then begin
          bErro := True;
          memResult.Lines.Add(' ');
          memResult.Lines.Add('[ERRO ] - Envio das contribuições para o financeiro/contábil.');
       end
       else memResult.Lines.Add('[OK   ] - Verificação/Envio das contribuições para o financeiro/contábil.');

    end;


    if not(AtualizaParcelamento(qryAux, sAnoMesCobrancaTela, iIdPatrocinadora)) then
    begin
      bErro := True;
      memResult.Lines.Add('[ERRO ] - Atualização dos registros de parcelamento.');
    end;


    // Sincronismo : Fechar recebimento da patrocinadora
    if not(FechaMesSistema(qryAux,
                           sAnoMesCobrancaTela,
                           DateToStr(date),
                           iIdPatrocinadora,
                           cteIdModuloAdmPREV,
                           'R',
                           'A'
                          )) then
    begin
      bErro := True;
      memResult.Lines.Add('[ERRO ] - Fechamento do Recebimento de Contribuições da patrocinadora.');
    end;


    if dtmBaseDados.dbBaseDados.InTransaction then
    begin
       if chkIntegra.Checked then
          sLogTotalPrev := 'Recebimento Contrib [Apenas Integração]. - Mês '+sAnoMesCobrancaTela+'-Patro. '+sNomePatro
       else
       begin
          if (bIntegraContab and bIntegraCAR) then
          sLogTotalPrev := 'Recebimento Contrib . - Mês '+sAnoMesCobrancaTela+'-Patro. '+sNomePatro
          else sLogTotalPrev := 'Recebimento Contrib [Não Integrado]. - Mês '+sAnoMesCobrancaTela+'-Patro. '+sNomePatro;
       end;

       if (bErro)
       then begin
          memResult.Lines.Add('**********************************************');
          memResult.Lines.Add('ATENÇÃO!!');
          memResult.Lines.Add('Recebimento da Patrocinadora ' + sNomePatro + ' foi efetuado com problemas em algumas contribuições.');
          memResult.Lines.Add('Favor corrigir os erros apresentados no log de erros.');
          memResult.Lines.Add('É RECOMENDÁVEL QUE SEJA DESFEITO O RECEBIMENTO.');
          memResult.Lines.Add('**********************************************');
            
          bInterrompida := False;

          if not(GravaLogTOTALPREV(sLogTotalPrev)) then
          begin
            bErro := True;
            memResult.Lines.Add(' ');
            memResult.Lines.Add('[ERRO ] - Gravação do Log.');
          end;

          if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;
       end
       else begin
          bInterrompida := False;
          if not GravaLogTOTALPREV (sLogTotalPrev)
          then begin
             bErro := True;
             memResult.Lines.Add(' ');
             memResult.Lines.Add('[ERRO ] - Gravação do Log.');
          end;
          if dtmBaseDados.dbBaseDados.InTransaction
          then dtmBaseDados.dbBaseDados.Commit;
       end;
    end;
    memResult.Lines.Add('--------------------------------------------------------------------');

    // Processar recebimento da proxima patrocinadora
    frmAguarde.Mostra(sNomePatro + ' - Recebendo Contribuições  ... ');
  end; //for i := 0 to chklstPatro;

  frmAguarde.Apaga;

  // -----------------------------------------------------------------------------------------------
  // -----------------------------------------------------------------------------------------------
  // -----------------------------------------------------------------------------------------------
  // -----------------------------------------------------------------------------------------------

  // Exibir mensagem final
  bNaoExisteRecebNenhum := False;

  if bNaoExisteRecebNenhum then
    MsgDlg('Não existem contribuições a serem recebidas.', 'Informação',mtInformation,[mbOk,mbHelp],0)
  else
  if bInterrompida then
    MsgDlg('Recebimento de Contribuições interrompido.', 'Informação',mtInformation,[mbOk,mbHelp],0)
  else
  begin
    MsgDlg('Recebimento de Contribuições efetuado com sucesso.', 'Informação',mtInformation,[mbOk,mbHelp],0);
    // cguedes - 19/12/2002
    // Adicionando Log Padrao
    try
      if not(Sistema.GravaLogOperacoes(Self.Caption)) then raise Exception.Create('Erro ao gravar Log.')
    except
    end;
  end;





  ////////TESTE PGA ////////
  //Renato Visoni SOL 130015  Kintana 717839

  for x := 0 to listaDocumento.Count -1 do begin
    if sSQLwhere ='' then begin
      sSQLwhere := 'AND ((H.CODDOCUMENTOPREV = '+QuotedStr(listaDocumento[x])+')';
    end else begin
      sSQLwhere := sSQLwhere + ' OR (H.CODDOCUMENTOPREV = '+QuotedStr(listaDocumento[x])+')';
    end;
  end;

  if sSQLwhere <> '' then begin

    try

     CtrlDocumento.Destroy;
     CtrlDocumento := TCtrlDocumento.Create;
     CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );



     CtrlLancamento.Destroy;
     CtrlLancamento := TCtrlLancamento.Create;

     CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );

    except
    end;

    sSQLwhere := sSQLwhere + ')';

    Try
      sMsgPga := RealizaIntegracaoPGAIndiv('',CtrlDocumento,CtrlLancamento,'',sSQLwhere,'RECEBFOLHA');
      if sMsgPga = '' then begin
        memResult.Lines.Add(' - Integração com PGA realizada com sucesso - ')
      end else begin
        memResult.Lines.Add(sMsgPga);
      end;
    Except
       memResult.Lines.Add(' - Ocorreram problemas na Integração com PGA - ');
    end;



  end;
  //Renato Visoni SOL 130015  Kintana 717839


   //Renato Visoni SOL 132182 KINTANA 760569
  try
    CtrlDocumento.Destroy;
    CtrlDocumento := TCtrlDocumento.Create;
    CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );



    CtrlLancamento.Destroy;
    CtrlLancamento := TCtrlLancamento.Create;

    CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );

   except
   end;
  //Renato Visoni SOL 132182 KINTANA 760569






  listaDocumento.Destroy;

  TiraSQL(qryAux);
  memResult.Lines.Add('Término do Processamento : ' + DateTimeToStr(Now));
end;



procedure TfrmRecebeContribuicao.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then
    memResult.Lines.SaveToFile(savedlg.filename);
end;



procedure TfrmRecebeContribuicao.FormCreate(Sender: TObject);
begin
  inherited;

  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

   qryContabil.ParamByName('PLNCODIGO').AsInteger := -1;
   qryContabil.Prepare;
   qryContabil.Open; // query CachedUpdate que contém os registros a serem
                     // passados à LancaContab

   qryDocumentos.ParamByName('CODDOCUMENTO').AsInteger := -1;
   qryDocumentos.Prepare;
   qryDocumentos.Open; // query CachedUpdate que contém todos os documentos
                       // criados neste processo, que serão (ao final
                       // do mesmo) atualizados com o número da planilha
                       // contábil (plncodigo) gerada na contabilização

   try
      CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Documentos.','Erro',mtError,[mbOK],0);
      Abort;
   end;

   try
      CtrlLancamento := TCtrlLancamento.Create;
      CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Lançamento Contábil.','Erro',mtError,[mbOK],0);
      Abort;
   end;

  qryPatro.Close;
  qryPatro.SQL.Clear;
  qryPatro.SQL.Add(' SELECT P.IDPESSOA, P.NOME, PT.FLGACEITANAOID, PT.FLGANO13, PT.IDRUBSALPARTICIP,  '+ // leorefer - 29.07.2001
                   '        PT.FLGGERACAR                         '+ 
                   ' FROM   PESSOA P , PATRO PT                   '+
                   ' WHERE  P.IDPESSOA    = PT.IDPESSOA           '+
                   ' AND    PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+ 
                   ' ORDER BY P.NOME ');

  // Preencher chkList da Patrocinadora
  qryPatro.Open;
  CriaLista(chkLstPatro,qryPatro);
  //Inicio - Andre Olivera SOL: 164351 Kintana: 1506587
  CtrlDisponFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                         Sistema.IdUsuario,Sistema.UsaPlanoPatro);

  CtrlDisponFinanc.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,nil,False);

  CtrlContab         := TCtrlContab.Create;
  CtrlContab.Initialize( dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                         Sistema.ConnectionSide, Sistema.AppRemoteServer, true );
   //fim - Andre Olivera SOL: 164351 Kintana: 1506587
end;

procedure TfrmRecebeContribuicao.regCalculoGetResult(sender: TObject);
var
  sValorRegra : string;
begin
  inherited;
  sValorRegra := OraNumero(regCalculo.Result);
  if sValorRegra  = ''
  then begin     // Regra de calculo retornou vazio
     if regCalculo.Error
     then memResult.Lines.Add('Erro[Execução de Regra] - Recebimento Nº : '+qryRecebimento.FieldByName('NODOCUMENTO').AsString)
     else memResult.Lines.Add('Erro[Valor Calculado = BRANCO] - Recebimento Nº : '+qryRecebimento.FieldByName('NODOCUMENTO').AsString);
     Exit;
  end;
  sValorEsperado := sValorRegra;
end;



function TfrmRecebeContribuicao.TotalPatroCAR(iIdPatroAtu,
                                              iFlgAceitaNaoIdent : integer;
                                              sNomePatro, sTipoContrib, psFlgPagador,
                                              psIDPlanos : string;
                                              bExisteTmpDesc : boolean;
                                              bCedidos: Boolean): boolean;
var
  sMsgErro,
  sDataVencimentoPatro,
  sCodTipDoc,
  sCodPortForma,
  sContaD,       sContaC,
  sCodCCustoC,   sCodCCustoD,
  sCodTipRecDes, sCodCRespon,
  sCodCResponPatro,
  sTipCodPatro,
  sCodSubConta,
  sUnidNegoc,
  sIdEmpresaProp,
  sIdEmpresa,
  sPlano,
  sPlaContaDProvis, 
  sPlaContaCProvis,
  sRecPag : string ;

  sData : string;

  iPlnCodigo       : Integer;
  rTotal, dValorAux           : extended;
  iCodDocumento    : longint;

  sDecTerc : string;
  iDocPagar,iDocReceber:integer;
  sTipoDocGravar : string;
  strCentroCusto    : string;
  sDataVencimento :string;     //Andre Olivera SOL: 164351 Kintana: 1506587

begin
   {Objetivo: buscar todos os recebimentos via Interface, agrupados por Patrocinadora +
    Plano previdenciário + id da Contribuição para gerar o CAR das receitas das contribuições
    descontadas dos Participantes.}
  Result := True;
  rTotal := 0;

  strCentroCusto    :='';
  sDataVencimento := '';
  qryTotalPatro.Close;
  qryTotalPatro.SQL.Clear;


  if bExisteTmpDesc then
  begin
    // Se aceita contribuicoes nao identificadas, somar todas as contribuicoes
    // inclusive as com pessoa ou plano não identificados
    // Senao, somar apenas as identificadas
    if iFlgAceitaNaoIdent = 1 then
    begin
      qryTotalPatro.SQL.Add(' SELECT  T.IDPESSJUR, T.IDPLANOPREV,T.IDDESCONTO,  C.NOMERESUM,'+
                      '                 DECODE(T.FLGATRASODEVOL, ''D'', 1, 0) AS FLGDEVOLUCAO,'+
                      '                 T.MESREFERENCIA, SUM(T.VALORRECEBIDO) AS VALOR        '+
                      ' FROM    TMPDESC T, CONTPREV CP , CONTRIBUICAO C                       '+
                      ' WHERE   (T.MESCOBRANCA = '''+sAnoMesCobrancaTela+''')                 '+
                      ' AND     (T.IDPESSJUR = '+IntToStr(iIdPatroAtu)    +')                 '+
                      ' AND     ( (T.IDPESSOA <> T.IDPESSJUR ) or                             '+
                      '           (T.IDPESSOA IS NULL        ) or                             '+
                      '           (T.IDPLANOPREV IS NULL)                   )                 '+
                      ' AND     (T.SITENVIO     = ''9''                     )                 '+
                      ' AND     (T.FLGDESCFOLHA = ''P''                     )                 '+
                      ' AND     (T.FLGTIPODESC  = ''P''                     )                 '+
                      ' AND     (CP.IDPLANOPREV = T.IDPLANOPREV             )                 '+
                      ' AND     (CP.IDCONTRIBUICAO = T.IDDESCONTO           )                 '+
                      ' AND     (CP.FLGPAGADOR     = '''+psFlgPagador+'''   )                 '+
                      ' AND     (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO       )                 '+
                      ' AND     (T.IDPLANOPREV in ( ' + psIDPlanos + '      ))                '+ // ClaudioR - 26/07/2006 - CM 22017
                      ' AND NOT EXISTS ( SELECT 1 FROM HSTCONTRIBPREV                     '+
                      '                  WHERE  IDPESSJUR      = T.IDPESSJUR              '+
                      '                  AND    MESCOBRANCA    = T.MESCOBRANCA            '+
                      '                  AND    MESREFERENCIA  = T.MESREFERENCIA          '+
                      '                  AND    IDPLANOPREV    = T.IDPLANOPREV            '+
                      '                  AND    IDPESSOA       = T.IDPESSOA               '+
                      '                  AND    IDCONTRIBUICAO = T.IDDESCONTO             '+
                      '                  AND    CODDOCUMENTOPREV IS NOT NULL )            ');

      if Trim(dblkpcmbLote.Text) <> ''
      then qryTotalPatro.SQL.Add(' AND T.IDLOTE = '+OraNumero(qryLote.FieldByName('IDLOTE').AsString) );

      if Trim(edNome.Text) <> ''
      then qryTotalPatro.SQL.Add(' AND T.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+
                                 ' AND T.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1])+
                                 ' AND T.IDPESSOA    = '+OraNumero(MontaSelectPart.ValoresChave[2])+
                                 ' AND T.SEQPROPOSTA = '+OraNumero(MontaSelectPart.ValoresChave[3]));
      qryTotalPatro.SQL.Add(' GROUP BY T.IDPESSJUR,T.IDPLANOPREV,T.IDDESCONTO, C.NOMERESUM,         '+
                            '          T.FLGATRASODEVOL, T.MESREFERENCIA                            ');

    end
    else
    begin
       qryTotalPatro.SQL.Add(' SELECT  T.IDPESSJUR, T.IDPLANOPREV, T.IDDESCONTO,  C.NOMERESUM,'+
                      '               DECODE(T.FLGATRASODEVOL, ''D'', 1, 0) AS FLGDEVOLUCAO,'+
                      '               T.MESREFERENCIA, SUM(T.VALORRECEBIDO) AS VALOR        '+
                      ' FROM    TMPDESC T, CONTPREV CP, CONTRIBUICAO C               '+
                      ' WHERE   (T.MESCOBRANCA      = '''+sAnoMesCobrancaTela+'''  )          '+
                      ' AND     (T.IDPESSJUR        = '+IntToStr(iIdPatroAtu)+'    )          '+
                      ' AND     (T.IDPESSOA         <> T.IDPESSJUR                 )          '+
                      ' AND     (T.FLGDESCFOLHA     = ''P''                        )          '+
                      ' AND     (T.FLGTIPODESC      = ''P''                        )          '+
                      ' AND     (T.SITENVIO         = ''9''                        )          '+
                      ' AND     (CP.IDPLANOPREV     = T.IDPLANOPREV                )          '+
                      ' AND     (CP.IDCONTRIBUICAO  = T.IDDESCONTO                 )          '+
                      ' AND     (CP.FLGPAGADOR      = '''+psFlgPagador+'''         )          '+
                      ' AND     (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO              )          '+

                      ' AND NOT EXISTS ( SELECT 1 FROM HSTCONTRIBPREV                     '+
                      '                  WHERE  IDPESSJUR      = T.IDPESSJUR              '+
                      '                  AND    MESCOBRANCA    = T.MESCOBRANCA            '+
                      '                  AND    MESREFERENCIA  = T.MESREFERENCIA          '+
                      '                  AND    IDPLANOPREV    = T.IDPLANOPREV            '+
                      '                  AND    IDPESSOA       = T.IDPESSOA               '+
                      '                  AND    IDCONTRIBUICAO = T.IDDESCONTO             '+
                      '                  AND    CODDOCUMENTOPREV IS NOT NULL )            ');

      // If rgrpTipoFolha.ItemIndex = 0 Then // André Pontes - pendência 27013 - 07/12/2007 (retirado)
      qryTotalPatro.SQL.Add(' AND     (T.IDPLANOPREV in ( ' + psIDPlanos + '            )) ');

      if Trim(dblkpcmbLote.Text) <> ''
      then qryTotalPatro.SQL.Add(' AND T.IDLOTE = '+OraNumero(qryLote.FieldByName('IDLOTE').AsString) );

      if Trim(edNome.Text) <> ''
      then qryTotalPatro.SQL.Add(' AND T.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+
                                 ' AND T.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1])+
                                 ' AND T.IDPESSOA    = '+OraNumero(MontaSelectPart.ValoresChave[2])+
                                 ' AND T.SEQPROPOSTA = '+OraNumero(MontaSelectPart.ValoresChave[3]));
      qryTotalPatro.SQL.Add('  GROUP BY T.IDPESSJUR,T.IDPLANOPREV,T.IDDESCONTO, C.NOMERESUM,         '+
                            '           T.FLGATRASODEVOL, T.MESREFERENCIA                            ');
    end;
  end
  else  // if bExisteTmpDesc
  begin
    // ---------------------------------------------------------------------------------------------

    // André Pontes - até 03/10/2007 - pendência 25044
    // A query abaixo foi alterada para ter group by DATARECEBIMENTO, se o check estiver marcado na tela

    // ---------------------------------------------------------------------------------------------

    sSQL :=
    'SELECT '                                                                                       + #13 +
    '  H.IDPESSJUR, H.IDPLANOPREV, H.IDCONTRIBUICAO AS IDDESCONTO, C.NOMERESUM, '                   + #13;

    if chkDocDia.Checked then sSQL := sSQL +
    '  H.DATARECEBIMENTO, '                                                                         + #13;

    sSQL := sSQL +
    '  H.FLGDEVOLUCAO, H.MESCOBRANCA, '                                                             + #13 +
    '	 DECODE(H.MESREFERENCIA, H.MESCOBRANCA, H.MESCOBRANCA, '                                      +
             'DECODE(SUBSTR(H.MESREFERENCIA, 6, 2), ''13'', ''0000/13'', ''0000/00'')'              +
            ') AS MESREFERENCIA, '                                                                  + #13 +
    '  SUM(H.VALORRECEBIDO) AS VALOR, '                                                             + #13 +
    '  NVL(CPP.IDPLANPREVCONTAB, CPP.IDPLANOPREV) IDPLANPREVCONTAB, '                               + #13 +
    '  DECODE(H.FOLHAORIGEM, ''F'', ' + IntToStr(iIdFundacao)                                       +
              ', (NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR)) '                                          + #13 +
    '        ) IDPESSJURCEDIDO '                                                                    + #13 +

    // ---------------------------------------------------------------------------------------------

    'FROM '                                                                                         + #13 +
    '  HSTCONTRIBPREV   H,    '                                                                     + #13 +
    '  CONTPREV         CP,   '                                                                     + #13 +
    '  CONTRIBUICAO     C,    '                                                                     + #13 +
    '  CONTRIBPREVPARTP CPP,  '                                                                     + #13 +
    '  ELEGPATRO        EL    '                                                                     + #13 +

    // ---------------------------------------------------------------------------------------------

    'WHERE '                                                                                        + #13 +
    '      H.MESCOBRANCA            = ' + QuotedStr(sAnoMesCobrancaTela)                            + #13 +
    '  AND H.IDPESSJUR              = ' + IntToStr(iIdPatroAtu)                                     + #13 +
    '  AND H.IDPESSOA              <> H.IDPESSJUR '                                                 + #13 +
    '  AND NVL(H.VALORRECEBIDO, 0)  > 0 '                                                           + #13 +
    '  AND H.CODDOCUMENTOPREV       IS NULL '                                                       + #13 +
    '  AND H.FLGDESCFOLHA           = 1 '                                                           + #13;

    if rgrpTipoFolha.ItemIndex = 0 then sSQL := sSQL +
    '  AND H.FOLHAORIGEM            IN (''P'',''F'') '                                              + #13 +
    '  AND H.IDPLANOPREV            IN (' + psIDPlanos + ') '                                       + #13
    else sSQL := sSQL +
    '  AND H.FOLHAORIGEM            = ''B'' '                                                       + #13 +
    '  AND CP.FLGPAGADOR            = ''P'' '                                                       + #13;

    sSQL := sSQL +
    '  AND CP.IDPLANOPREV           = H.IDPLANOPREV '                                               + #13 +
    '  AND CP.IDCONTRIBUICAO        = H.IDCONTRIBUICAO '                                            + #13 +
    '  AND CP.FLGPAGADOR            = ' + QuotedStr(psFlgPagador)                                   + #13 +
    '  AND C.IDCONTRIBUICAO         = CP.IDCONTRIBUICAO '                                           + #13;

    if Trim(dblkpcmbLote.Text) <> '' then sSQL := sSQL +
    '  AND H.IDLOTE                 = ' + OraNumero(qryLote.FieldByName('IDLOTE').AsString)         + #13;

    if Trim(edNome.Text) <> '' then sSQL := sSQL +
    '  AND H.IDPESSJUR              = ' + OraNumero(MontaSelectPart.ValoresChave[0])                + #13 +
    '  AND H.IDPLANOPREV            = ' + OraNumero(MontaSelectPart.ValoresChave[1])                + #13 +
    '  AND H.IDPESSOA               = ' + OraNumero(MontaSelectPart.ValoresChave[2])                + #13 +
    '  AND H.SEQPROPOSTA            = ' + OraNumero(MontaSelectPart.ValoresChave[3])                + #13;

    sSQL := sSQL +
    '  AND CPP.IDPESSJUR            = H.IDPESSJUR '                                                 + #13 +
    '  AND CPP.IDPESSOA             = H.IDPESSOA '                                                  + #13 +
    '  AND CPP.IDPLANOPREV          = H.IDPLANOPREV '                                               + #13 +
    '  AND CPP.IDCONTRIBUICAO       = H.IDCONTRIBUICAO '                                            + #13 +
    '  AND EL.IDPESSJUR             = H.IDPESSJUR '                                                 + #13 +
    '  AND EL.IDPESSOA              = H.IDPESSOA '                                                  + #13;

    if bCedidos then sSQL := sSQL +
    '  AND (EL.IDPESSJURCEDIDO      IS NOT NULL OR  H.FOLHAORIGEM = ''F'') '                        + #13
    else sSQL := sSQL +
    '  AND (EL.IDPESSJURCEDIDO      IS NULL     AND H.FOLHAORIGEM <> ''F'') '                       + #13;

    //BRUNO AZEVEDO SOL 135340 KINTANA 804075
    sSQL := sSQL + ' AND H.SITRECEBIMENTO >= 1';
    // ---------------------------------------------------------------------------------------------

    sSQL := sSQL +
    'GROUP BY '                                                                                     + #13;

    if chkDocDia.Checked then sSQL := sSQL +
    '  H.DATARECEBIMENTO, '                                                                         + #13;

    sSQL := sSQL +
    '  H.IDPESSJUR, H.IDPLANOPREV, H.IDCONTRIBUICAO, C.NOMERESUM, H.FLGDEVOLUCAO, '                 + #13 +
    '  H.MESCOBRANCA, '                                                                             + #13 +
    '	 DECODE(H.MESREFERENCIA, H.MESCOBRANCA, H.MESCOBRANCA, '                                      +
             'DECODE(SUBSTR(H.MESREFERENCIA, 6, 2), ''13'', ''0000/13'', ''0000/00'')), '           + #13 +
    '  NVL(CPP.IDPLANPREVCONTAB, CPP.IDPLANOPREV), '                                                + #13 +
    '  DECODE(H.FOLHAORIGEM, ''F'', ' + IntToStr(iIdFundacao)                                       +
             ', (NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR))) '                                          + #13 +

    // ---------------------------------------------------------------------------------------------

    'ORDER BY '                                                                                     + #13 +
    '  NVL(CPP.IDPLANPREVCONTAB, CPP.IDPLANOPREV)';

    if chkDocDia.Checked then sSQL := sSQL + ', H.DATARECEBIMENTO ';

    // ---------------------------------------------------------------------------------------------
  end;

  // -----------------------------------------------------------------------------------------------
  // FIM André Pontes - 03/10/2007 - pendência 25044
  // -----------------------------------------------------------------------------------------------


  try
    qryTotalPatro.close;
    qryTotalPatro.sql.Clear;
    qryTotalPatro.SQL.Text := sSQL;
    qryTotalPatro.Open;
  except
    Result := False;
    bErro := True;
    Exit;
  end;

  // -----------------------------------------------------------------------------------------------

  //coloca o campo FOLHAORIGEM da HSTCOTRIBPREV para "P" onde estiver "F"
  //que foi utilizado para integração contábil/financeira de cedidos
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV H SET FOLHAORIGEM = ''P''  '+
                 ' WHERE    IDPESSJUR = '+IntToStr(iIdPatroAtu)+
                 ' AND      MESCOBRANCA = '''+sAnoMesCobrancaTela+''' '+
                 ' AND      FOLHAORIGEM = ''F'' '+
                 ' AND      EXISTS (SELECT 1 FROM CONTPREV '+
                 '          WHERE FLGPAGADOR = '''+psFlgPagador+''' '+
                 '          AND IDPLANOPREV = H.IDPLANOPREV '+
                 '          AND IDCONTRIBUICAO = H.IDCONTRIBUICAO) ');

  if Trim(dblkpcmbLote.Text) <> ''
  then qryaux.SQL.Add(' AND H.IDLOTE = '+OraNumero(qryLote.FieldByName('IDLOTE').AsString) );

  if Trim(edNome.Text) <> ''
  then qryaux.SQL.Add(' AND H.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+
                      ' AND H.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1])+
                      ' AND H.IDPESSOA    = '+OraNumero(MontaSelectPart.ValoresChave[2])+
                      ' AND H.SEQPROPOSTA = '+OraNumero(MontaSelectPart.ValoresChave[3]));

  qryAux.ExecSQL;

  // -----------------------------------------------------------------------------------------------

  if qryTotalPatro.IsEmpty then
  begin
    Result := True;
    Exit;
  end;

  // -----------------------------------------------------------------------------------------------

  qryTotalPatro.First;
  while not(qryTotalPatro.EOF) do
  begin
    if qryTotalPatro.FieldByName('VALOR').AsFloat <= 0 then
    begin
      qryTotalPatro.Next;
      Continue;
    end;

    if not dtmAPrevIntegraBack.BuscaInfIntegra(
                                       qryTotalPatro.FieldByName('IdPessjur').AsInteger,
                                       qryTotalPatro.FieldByName('IdPlanoPrev').AsInteger,
                                       -1,
                                       -1,
                                       qryTotalPatro.FieldByName('IdDesconto').AsInteger,
                                       'C',
                                       'P',
                                       qryTotalPatro.FieldByName('FlgDevolucao').AsInteger,
                                       sAnoMesCobrancaTela,
                                       qryTotalPatro.FieldByName('MESREFERENCIA').AsString,
                                       sTipCodPatro,
                                       sCodTipRecDes,
                                       sRecPag,
                                       sCodTipDoc,
                                       sCodPortForma,
                                       sCodCRespon,
                                       sCodSubConta,
                                       sCodCCustoD,
                                       sIdEmpresa,
                                       sCodCCustoC,
                                       sContaD,
                                       sPlano,
                                       sContaC,
                                       sPlaContaDProvis,
                                       sPlaContaCProvis,
                                       sUnidNegoc,
                                       sIdEmpresaProp,
                                       sRecPag,
                                       True,
                                       sMsgErro  )
    then
    begin
      memResult.Lines.Add('Falta de parametrização Contábil/Financeira da contribuição [código :'+qryTotalPatro.FieldbyName('IDDESCONTO').AsString+'].');
      memResult.Lines.Add(sMsgErro);
      memResult.Lines.Add('');
      Result := False;
      bErro := True;
      Exit;
    end;

    // ---------------------------------------------------------------------------------------------

    // Contabilizar as receitas de contribuição
    sDataVencimentoPatro := CriticaDataCobrancaSit(dtmAPrev.qry,
                                                   qryTotalPatro.FieldByName('IDPESSJUR').AsString,
                                                   qryTotalPatro.FieldByName('IDPLANOPREV').AsString,
                                                   'PT', 'N',
                                                   Copy(sAnoMesCobrancaTela,6,2),
                                                   Copy(sAnoMesCobrancaTela,1,4)
                                                  );

    if Trim(sDataVencimentoPatro) = '' then
    begin
      if MsgDlg('Calendário para contribuições da patrocinadora com problemas. Deseja continuar ? ',
                'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
      then begin
         Result := False;
         memResult.Lines.Add('[AVISO] - Processamento cancelado. Motivo : Calendário para contribuições da patrocinadora com problemas. ');
         bErro := True;
         Exit;
      end
      else
        sDataVencimentoPatro := DateToStr(date);
    end;

    // ---------------------------------------------------------------------------------------------

    sDecTerc := '';
    //if pos('13',qryTotalPatro.FieldByName('MESREFERENCIA').AsString) > 0 then sDecTerc := 'Décimo Terceiro';
    if pos('/13',qryTotalPatro.FieldByName('MESREFERENCIA').AsString) > 0 then sDecTerc := 'Décimo Terceiro';
    //William Moreira da Silva - SOL 198559/15217 e 15212


    if qryTotalPatro.FieldByName('FLGDEVOLUCAO').AsInteger = 0 then
    begin
      // Não é Devolucao
      FazerInsertContab(qryContabil, sContaC,sCodCCustoC,'C','1','',
                        'Receita-'+sTipoContrib,
                        'Patrocinadora - '+  copy(sNomePatro,1,24),
                        'Mês de cobrança : '+ sAnoMesCobrancaTela,
                        'Contribuição - '+qryTotalPatro.FieldByName('NOMERESUM').AsString,
                        sDecTerc,
                        StrToInt(OraNumero(sUnidNegoc)),-1,
                        qryTotalPatro.FieldByName('VALOR').asFloat,-1,
                        StrToDate(sDataVencimentoPatro),
                        sTipCodPatro,
                        qryTotalPatro.FieldByName('IDPESSJUR').AsInteger,
                        qryTotalPatro.FieldByName('IDPLANPREVCONTAB').AsInteger
                       );

      // contabilizar as receitas a receber de contribuição
      FazerInsertContab(qryContabil, sContaD,sCodCCustoD,'D','0','',
                        'A Receber-'+sTipoContrib,
                        'Patrocinadora - '+ copy(sNomePatro,1,24),
                        'Mês de cobrança : '+ sAnoMesCobrancaTela,
                        'Contribuição - '+qryTotalPatro.FieldByName('NOMERESUM').AsString,
                        sDecTerc,
                        StrToInt(OraNumero(sUnidNegoc)),-1,
                        qryTotalPatro.FieldByName('VALOR').asFloat,-1,
                        StrToDate(sDataVencimentoPatro),
                        sTipCodPatro,
                        qryTotalPatro.FieldByName('IDPESSJUR').AsInteger,
                        qryTotalPatro.FieldByName('IDPLANPREVCONTAB').AsInteger
                       );

      rTotal := rTotal + qryTotalPatro.FieldByName('VALOR').asFloat;
    end
    else  // if qryTotalPatro.FieldByName('FLGDEVOLUCAO').AsInteger = 0
    begin
      // É Devolucao
      FazerInsertContab(qryContabil, sContaD,sCodCCustoD,'D','0','',
                        'Estorno de Receita-'+sTipoContrib,
                        'Patrocinadora - '+  copy(sNomePatro,1,24),
                        'Mês de cobrança : '+ sAnoMesCobrancaTela,
                        'Contribuição - '+qryTotalPatro.FieldByName('NOMERESUM').AsString,
                        sDecTerc,
                        StrToInt(OraNumero(sUnidNegoc)),-1,
                        qryTotalPatro.FieldByName('VALOR').asFloat,-1,
                        StrToDate(sDataVencimentoPatro),
                        sTipCodPatro,
                        qryTotalPatro.FieldByName('IDPESSJUR').AsInteger,
                        qryTotalPatro.FieldByName('IDPLANPREVCONTAB').AsInteger
                       );

      // contabilizar as receitas a receber de contribuição
      FazerInsertContab(qryContabil, sContaC,sCodCCustoC,'C','1','',
                        'Devolucao-'+sTipoContrib,
                        'Patrocinadora - '+ copy(sNomePatro,1,24),
                        'Mês de cobrança : '+ sAnoMesCobrancaTela,
                        'Contribuição - '+qryTotalPatro.FieldByName('NOMERESUM').AsString,
                        sDecTerc,
                        StrToInt(OraNumero(sUnidNegoc)),-1,
                        qryTotalPatro.FieldByName('VALOR').asFloat,-1,
                        StrToDate(sDataVencimentoPatro),
                        sTipCodPatro,
                        qryTotalPatro.FieldByName('IDPESSJUR').AsInteger,
                        qryTotalPatro.FieldByName('IDPLANPREVCONTAB').AsInteger);

      rTotal := rTotal - qryTotalPatro.FieldByName('VALOR').asFloat;
    end;

    // ---------------------------------------------------------------------------------------------

    // Realizando lançamento contábil para conta de provisionamento
    // apenas 1/12 do valor da contribuição
    if (Trim(sPlaContaCProvis) <> '') and
       (Trim(sPlaContaDProvis) <> '') and
       (qryTotalPatro.FieldByName('FLGDEVOLUCAO').AsInteger = 0) and
       (qryTotalPatro.FieldByName('MESREFERENCIA').AsString = sAnoMesCobrancaTela) then
    begin
      // Crédito
      FazerInsertContab(qryContabil,
                        sPlaContaCProvis ,
                        sCodCCustoC,
                        'C',
                        '1',
                        '',
                        'Provisão Receb.Contrib.Abono Anual -'+sTipoContrib,
                        'Patrocinadora - '+  copy(sNomePatro,1,24),
                        'Mês de cobrança : '+ sAnoMesCobrancaTela,
                        'Contribuição - '+qryTotalPatro.FieldByName('NOMERESUM').AsString,
                        sDecTerc,
                        StrToInt(OraNumero(sUnidNegoc)),
                        -1,
                        (qryTotalPatro.FieldByName('VALOR').asFloat / 12),
                        -1,
                        StrToDate(sDataVencimentoPatro),
                        sTipCodPatro,
                        qryTotalPatro.FieldByName('IDPESSJUR').AsInteger,
                        qryTotalPatro.FieldByName('IDPLANPREVCONTAB').AsInteger);

      // Débito
      FazerInsertContab(qryContabil,
                        sPlaContaDProvis,
                        sCodCCustoD,
                        'D',
                        '0',
                        '',
                        'Provisão Receb.Contrib.Abono Anual -'+sTipoContrib,
                        'Patrocinadora - '+ copy(sNomePatro,1,24),
                        'Mês de cobrança : '+ sAnoMesCobrancaTela,
                        'Contribuição - '+qryTotalPatro.FieldByName('NOMERESUM').AsString,
                        sDecTerc,
                        StrToInt(OraNumero(sUnidNegoc)),
                        -1,
                        (qryTotalPatro.FieldByName('VALOR').asFloat / 12),
                        -1,
                        StrToDate(sDataVencimentoPatro),
                        sTipCodPatro,
                        qryTotalPatro.FieldByName('IDPESSJUR').AsInteger,
                        qryTotalPatro.FieldByName('IDPLANPREVCONTAB').AsInteger);
    end;


    // So alimentar qryDocumentos, que vai para o CAR, se a patro nao for a fundacao
    if (
       (iIdFundacao <> iIdPatroAtu) or
       ((iIdPatroAtu = iIdFundacao) and prmIntegraFundacao)
       )
       and bIntegraCAR
    then
    begin
      //caso seja uma devolução, a conta foi invertida dentro da função BuscaInfIntegra
      //pois a contabilização deve ser invertida, poré, a conta de baixa continua sendo a conta de débito que,
      //no caso de devolução é a conta de crédito
      if qryTotalPatro.FieldByName('FlgDevolucao').AsInteger = 1 then sContaD := sContaC;

      AlimentaQryDocumentos(qryDocumentos, -1, -1,
                            IntegraBack.Plano,
                            StrToInt(OraNumero(sUnidNegoc)),
                            sContaD,
                            sCodCRespon,
                            sCodTipRecDes,
                            qryTotalPatro.FieldByName('VALOR').asFloat,
                            qryTotalPatro.FieldByName('IDPESSJUR').AsInteger,
                            qryTotalPatro.FieldByName('IDPLANOPREV').AsInteger,
                            qryTotalPatro.FieldByName('IdDesconto').AsInteger, // Ricardo Vigorito 04/03/2004 - Pendência 16178
                            qryTotalPatro.fieldbyname('FLGDEVOLUCAO').AsInteger,
                            qryTotalPatro.fieldbyname('IDPLANPREVCONTAB').AsInteger,
                            qryTotalPatro.fieldbyname('IDPESSJURCEDIDO').AsInteger);
    end;

    // ---------------------------------------------------------------------------------------------
    // André Pontes - 04/10/2007 - pendência 25044
    // ---------------------------------------------------------------------------------------------

    // Se for necessário descarregar os documentos por dia
    if chkDocDia.Checked then
    begin
      if bIntegraContab then
      begin
        IncluiContabilidade(CtrlLancamento, qryContabil, iPlnCodigo, sMsgErro);
        if iPlnCodigo <= 0 then
        begin
          memResult.Lines.Add('[ERRO ] - Inclusão do lançamento na contabilidade : '+sMsgErro);
        end;
      end;

      // -------------------------------------------------------------------------------------------

      if ((iIdFundacao <> iIdPatroAtu) or
         ((iIdPatroAtu = iIdFundacao) and  prmIntegraFundacao))
         and bIntegraCAR then
      begin
        if prmTpDocRRecPatro = '' then
        begin
          memResult.Lines.Add('[ERRO ] - Tipo de Documento para Recebimento de Contribuições não parametrizado. Verifique');
          Result := False;
          Exit;
        end;

        // -----------------------------------------------------------------------------------------

        if qryTotalPatro.FieldByName('VALOR').AsCurrency < 0 then
          sRecPag := 'P'
        else
          sRecPag := 'R';

        // -----------------------------------------------------------------------------------------

        // Aline Freire SOL 160466 KINTANA 1347998
        strCentroCusto :='';
        if  sRecPag  = 'P' then begin
          strCentroCusto := BuscaCentroCusto(qryTotalPatro.FieldByName('IDPESSJUR').AsInteger,qryTotalPatro.FieldByName('IDPLANOPREV').AsInteger,qryTotalPatro.FieldByName('IDDESCONTO').AsInteger);
        end;
        // Aline Freire SOL 160466 KINTANA 1347998

        ////Inicio Douglas.siqueira Sol 162505 Kintana 1381614
        if sRecPag = 'P' then
           begin
             //inicio - Andre Olivera SOL: 164351 Kintana: 1506587
              sDataVencimento := ValidarDataVencimento;
              if (sDataVencimento = 'CANCEL')then
               begin
                    Result := False;
                    bErro := True;
                    Exit;
               end;
              //fim - Andre Olivera SOL: 164351 Kintana: 1506587
             if MsgDlg('Deseja informar uma observação para ser incluida no documento ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
              begin
              frmObservacaoDocum:= TfrmObservacaoDocum.Create(Application);
              frmObservacaoDocum.ShowModal;
              sObservacaoDocum := frmObservacaoDocum.ObsDocumento.Text;
              frmObservacaoDocum.Free;

              end;


           end;
        ////FIM Douglas.siqueira Sol 162505 Kintana 1381614


        if rgrpTipoFolha.ItemIndex = 0 then
        begin
          //inicio - Andre Olivera SOL: 164351 Kintana: 1506587
          if(sDataVencimento ='')then
            iCodDocumento := DescarregaDocumentos(CtrlDocumento,
                                                  qryDocumentos,
                                                  iIdPatroAtu,
                                                  iPlnCodigo,
                                                  prmTpDocRRecPatro,
                                                  sCodPortForma,
                                                  Copy(sAnoMesCobrancaTela, 6, 2),
                                                  Copy(sAnoMesCobrancaTela, 1, 4),
                                                  abs(qryTotalPatro.FieldByName('VALOR').AsCurrency),
                                                  qryTotalPatro.FieldByName('DATARECEBIMENTO').AsDateTime,
                                                  psFlgPagador, 'P',
                                                  '', '', sRecPag,
                                                  sObservacaoDocum{Douglas.siqueira Sol 162505 Kintana 1381614}, strCentroCusto, // Aline Freire SOL 160466 KINTANA 1347998
                                                  False
                                                  )
          else
          begin
              iCodDocumento := DescarregaDocumentos(CtrlDocumento,
                                                    qryDocumentos,
                                                    iIdPatroAtu,
                                                    iPlnCodigo,
                                                    prmTpDocRRecPatro,
                                                    sCodPortForma,
                                                    Copy(sAnoMesCobrancaTela, 6, 2),
                                                    Copy(sAnoMesCobrancaTela, 1, 4),
                                                    abs(qryTotalPatro.FieldByName('VALOR').AsCurrency),
                                                    qryTotalPatro.FieldByName('DATARECEBIMENTO').AsDateTime,
                                                    psFlgPagador, 'P',
                                                    '', '', sRecPag,
                                                    sObservacaoDocum{Douglas.siqueira Sol 162505 Kintana 1381614}, strCentroCusto, // Aline Freire SOL 160466 KINTANA 1347998
                                                    False,
                                                    sDataVencimento
                                                    );
              CtrlDocumento.UpdateDataDisponib(iCodDocumento,StrToDate(sDataVencimento));
          end;
          //fim - Andre Olivera SOL: 164351 Kintana: 1506587
        end
        else
        begin
          if sRecPag = 'R' then
            sTipoDocGravar := prmTpDocRRecPatro
          else
            sTipoDocGravar := prmTpDocPEnvioPatro;

          // Aline Freire SOL 160466 KINTANA 1347998
          strCentroCusto :='';
          if  sRecPag  = 'P' then begin
            strCentroCusto := BuscaCentroCusto(qryTotalPatro.FieldByName('IDPESSJUR').AsInteger,qryTotalPatro.FieldByName('IDPLANOPREV').AsInteger,qryTotalPatro.FieldByName('IDDESCONTO').AsInteger);
          end;
          // Aline Freire SOL 160466 KINTANA 1347998


        ////Inicio Douglas.siqueira Sol 162505 Kintana 1381614
        if sRecPag = 'P' then
           begin
              //inicio - Andre Olivera SOL: 164351 Kintana: 1506587
              sDataVencimento := ValidarDataVencimento;
              if (sDataVencimento = 'CANCEL')then
               begin
                    Result := False;
                    bErro := True;
                    Exit;
               end;
              //fim - Andre Olivera SOL: 164351 Kintana: 1506587
             if MsgDlg('Deseja informar uma observação para ser incluida no documento ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
              begin
                frmObservacaoDocum:= TfrmObservacaoDocum.Create(Application);
                frmObservacaoDocum.ShowModal;
                sObservacaoDocum := frmObservacaoDocum.ObsDocumento.Text;
                frmObservacaoDocum.Free;
              end;

           end;
        ////FIM Douglas.siqueira Sol 162505 Kintana 1381614
        //inicio - Andre Olivera SOL: 164351 Kintana: 1506587
         if(sDataVencimento = '')then
          iCodDocumento := DescarregaDocumentos(CtrlDocumento,
                                                qryDocumentos ,
                                                iIdPatroAtu,
                                                iPlnCodigo,
                                                sTipoDocGravar,
                                                sCodPortForma,
                                                Copy(sAnoMesCobrancaTela, 6, 2),
                                                Copy(sAnoMesCobrancaTela, 1, 4),
                                                abs(qryTotalPatro.FieldByName('VALOR').AsCurrency),
                                                qryTotalPatro.FieldByName('DATARECEBIMENTO').AsDateTime,
                                                psFlgPagador, 'B',
                                                '', '', sRecPag,sObservacaoDocum{Douglas.siqueira Sol 162505 Kintana 1381614},
                                                 strCentroCusto,// Aline Freire SOL 160466 KINTANA 1347998
                                                False
                                               )
         else
         begin
              iCodDocumento := DescarregaDocumentos(CtrlDocumento,
                                                qryDocumentos ,
                                                iIdPatroAtu,
                                                iPlnCodigo,
                                                sTipoDocGravar,
                                                sCodPortForma,
                                                Copy(sAnoMesCobrancaTela, 6, 2),
                                                Copy(sAnoMesCobrancaTela, 1, 4),
                                                abs(qryTotalPatro.FieldByName('VALOR').AsCurrency),
                                                qryTotalPatro.FieldByName('DATARECEBIMENTO').AsDateTime,
                                                psFlgPagador, 'B',
                                                '', '', sRecPag,sObservacaoDocum{Douglas.siqueira Sol 162505 Kintana 1381614},
                                                 strCentroCusto,// Aline Freire SOL 160466 KINTANA 1347998
                                                False,
                                                sDataVencimento
                                               );
              CtrlDocumento.UpdateDataDisponib(iCodDocumento,StrToDate(sDataVencimento));
         end;
         //fim - Andre Olivera SOL: 164351 Kintana: 1506587
        end;

        // -----------------------------------------------------------------------------------------


        // Renato Visoni SOL 126682  KINTANA 665067
          if iCodDocumento > 0 then begin
            if sRecPag = 'P' then begin
              sMsg :='Documento(s) gerado(s) no CAP: ' + intTostr(iCodDocumento);
            end else if sRecPag = 'R' then begin
              sMsg :='Documento(s) gerado(s) no CAR: ' + intTostr(iCodDocumento);
            end;

            memResult.Lines.Add(sMsg);
          end;
        // Renato Visoni SOL 126682  KINTANA 665067


        if iCodDocumento < 0 then
        begin
          Result := False;
          memResult.Lines.Add('[ERRO ] - Erro na inserção dos documentos : '+CtrlDocumento.MessageInfo);
          Exit;
        end
        else
        begin

        listaDocumento.Add(intTostr(iCodDocumento)); // Renato Visoni SOL 130015  Kintana 717839



//          Self.IntegraPGA(iCodDocumento,iDocPagar,iDocReceber);    //Thiago Passos PGA CGPC

          sData := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', qryTotalPatro.FieldByName('DATARECEBIMENTO').AsDateTime)) + ', ''DD/MM/YYYY'')';

          sSQL :=
          'UPDATE '                                                                                       + #13 +
          '  HSTCONTRIBPREV '                                                                             + #13 +
          'SET '                                                                                          + #13 +
          '  CODDOCUMENTOPREV       = ' + IntToStr(iCodDocumento)                                         + #13 +
       //   '  CODDOCUMENTOPGAPAGAR       = ' + IntToStr(iDocPagar)                                         + #13 +    //Thiago Passos PGA CGPC
       //   '  CODDOCUMENTOPGARECEBER       = ' + IntToStr(iDocReceber)                                         + #13 +//Thiago Passos PGA CGPC
          'WHERE '                                                                                        + #13 +
          '      MESCOBRANCA        = ' + QuotedStr(qryTotalPatro.FieldByName('MESCOBRANCA').AsString)    + #13;

          if qryTotalPatro.FieldByName('MESREFERENCIA').AsString = '0000/00' then sSQL := sSQL +
          '  AND MESREFERENCIA     <> MESCOBRANCA '                                                       + #13 +
          '  AND SUBSTR(MESREFERENCIA, 6, 2) <> ''13'' '                                                  + #13
          else
          if qryTotalPatro.FieldByName('MESREFERENCIA').AsString = '0000/13' then  sSQL := sSQL +
          '  AND MESREFERENCIA     <> MESCOBRANCA '                                                       + #13 +
          '  AND SUBSTR(MESREFERENCIA, 6, 2)  = ''13'' '                                                  + #13
          else sSQL := sSQL +
          '  AND MESREFERENCIA      = MESCOBRANCA '                                                       + #13;

          sSQL := sSQL +
          '  AND IDPESSJUR          = ' + IntToStr(qryTotalPatro.FieldByName('IDPESSJUR').AsInteger)      + #13 +
          '  AND IDPLANOPREV        = ' + IntToStr(qryTotalPatro.FieldByName('IDPLANOPREV').AsInteger)    + #13 +
          '  AND DATARECEBIMENTO    = ' + sData                                                           + #13 +
          '  AND IDCONTRIBUICAO     = ' + IntToStr(qryTotalPatro.FieldByName('IDDESCONTO').AsInteger)     + #13 +
          '  AND FLGDEVOLUCAO       = ' + IntToStr(qryTotalPatro.FieldByName('FLGDEVOLUCAO').AsInteger)   + #13 +
          '  AND CODDOCUMENTOPREV   IS NULL ';

          qryAux.SQL.Text := sSQL;

          try
            qryAux.ExecSQL;
          except
            Result := False;
            memResult.Lines.Add('[ERRO ] - Ao gravar documento no histórico de contribuições ');
            Exit;
          end;

        end;

        // -----------------------------------------------------------------------------------------

      end;  // if ((iIdFundacao <> iIdPatroAtu) or ...

      // -------------------------------------------------------------------------------------------

      if qryContabil.Active   and qryContabil.UpdatesPending    then qryContabil.CancelUpdates;
      if qryDocumentos.Active and qryDocumentos.UpdatesPending  then qryDocumentos.CancelUpdates;

    end;  // if chkDocDia.Checked

    // ---------------------------------------------------------------------------------------------
    // FIM André Pontes - 04/10/2007 - pendência 25044
    // ---------------------------------------------------------------------------------------------

    qryTotalPatro.Next;
  end;  // while not(qryTotalPatro.EOF) do


  // -----------------------------------------------------------------------------------------------
  // -----------------------------------------------------------------------------------------------

  // André Pontes - 04/10/2007 - pendência 25044
  // Se for para gerar 1 documento por dia, o código a partir desse ponto não deve ser executado,
  // pois já foi replicado acima
  if chkDocDia.Checked then
  begin
    if qryContabil.Active   and qryContabil.UpdatesPending    then qryContabil.CancelUpdates;
    if qryDocumentos.Active and qryDocumentos.UpdatesPending  then qryDocumentos.CancelUpdates;

    Result := True;
    Exit;
  end;

  // -----------------------------------------------------------------------------------------------
  // -----------------------------------------------------------------------------------------------

  qryTotalPatro.First;
  dValorAux := 0;
  while not(qryTotalPatro.EOF) do
  begin
    if qryTotalPatro.FieldByName('FlgDevolucao').AsInteger = 1 then
      dValorAux := dValorAux - qryTotalPatro.FieldByName('VALOR').asFloat
    else
      dValorAux := dValorAux + qryTotalPatro.FieldByName('VALOR').asFloat;

    qryTotalPatro.next;
  end;

  if dValorAux < 0 then
    sRecPag := 'P'
  else
    sRecPag := 'R';

  // -----------------------------------------------------------------------------------------------

  if abs(rTotal) <= 0 then  // leofuncef - 14112005
  begin
    Result := True;
    bErro := False;
    Exit;
  end;

  // -----------------------------------------------------------------------------------------------
  // Criar Patrocinadora como cliente para poder criar um CtrlDocumento no CAR
  if bIntegraCAR then
  begin
    try
      Ctrldocumento.ForCli.Inserir(iIdPatroAtu,             // liIdPessoa
                                   Sistema.IdEmpresa,       // liIdEmpresa
                                   -1,                      // liCodSubConta
                                   IntegraBack.Plano,       // liPlano
                                   prmIdRamoTipoCliPatro,   // liIdRamoTipoCli
                                   '',                      // sCCusto
                                   '',                      // sContaCAdianto
                                   '',                      // sContaCForCli
                                   '',                      // sContaCDespesa
                                   tfcCliente               // TipoForCli = (tfcFornecedor, tfcCliente)
                                  );

    except
      Result := False;
      memResult.Lines.add('[ERRO ] - Erro ao inserir patrocinadora como cliente.');
      bErro := True;
      Exit;
    end;
  end;

  // -----------------------------------------------------------------------------------------------

  if bIntegraContab then
  begin
    IncluiContabilidade(CtrlLancamento, qryContabil , iPlnCodigo, sMsgErro);
    if iPlnCodigo <= 0 then   // FDIAS - REFER - 11.07.2001
    begin
     memResult.Lines.Add('[ERRO ] - Inclusão do lançamento na contabilidade : '+sMsgErro);
    end;
  end;

  // -----------------------------------------------------------------------------------------------

  if ((iIdFundacao <> iIdPatroAtu) or
     ((iIdPatroAtu = iIdFundacao) and  prmIntegraFundacao)) 
     and bIntegraCAR then
  begin
    if prmTpDocRRecPatro = '' then
    begin
      memResult.Lines.Add('[ERRO ] - Tipo de Documento para Recebimento de Contribuições não parametrizado. Verifique');
      Result := False;
      Exit;
    end;

    // ---------------------------------------------------------------------------------------------

    if rgrpTipoFolha.ItemIndex = 0 then
    begin

      // Renato Visoni SOL 130578 Kintana 734024
      if sRecPag = 'P' then
        sTipoDocGravar := '136'
      else
        sTipoDocGravar := prmTpDocRRecPatro;
      // Renato Visoni SOL 130578 Kintana 734024

      // Aline Freire SOL 160466 KINTANA 1347998
      strCentroCusto :='';
      if  sRecPag  = 'P' then begin
        strCentroCusto := BuscaCentroCusto(qryTotalPatro.FieldByName('IDPESSJUR').AsInteger,qryTotalPatro.FieldByName('IDPLANOPREV').AsInteger,qryTotalPatro.FieldByName('IDDESCONTO').AsInteger);
      end;
      // Aline Freire SOL 160466 KINTANA 1347998


        ////Inicio Douglas.siqueira Sol 162505 Kintana 1381614
        if sRecPag = 'P' then
           begin
             //Inicio - Andre Olivera SOL: 164351 Kintana: 1506587
              sDataVencimento := ValidarDataVencimento;
              if (sDataVencimento = 'CANCEL')then
                begin
                   Result := False;
                   bErro := True;
                   Exit;
                end;
              //FIM  Andre Olivera SOL: 164351 Kintana: 1506587
             if MsgDlg('Deseja informar uma observação para ser incluida no documento ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
              begin
                frmObservacaoDocum:= TfrmObservacaoDocum.Create(Application);
                frmObservacaoDocum.ShowModal;
                sObservacaoDocum := frmObservacaoDocum.ObsDocumento.Text;
                frmObservacaoDocum.Free;

              end;

           end;
        ////FIM Douglas.siqueira Sol 162505 Kintana 1381614


          //inicio - Andre Olivera SOL: 164351 Kintana: 1506587
          if (sDataVencimento = '')then
            iCodDocumento := DescarregaDocumentos(CtrlDocumento,
                                                  qryDocumentos,
                                                  iIdPatroAtu,
                                                  iPlnCodigo,
                                                  sTipoDocGravar,//prmTpDocRRecPatro, // Renato Visoni SOL 130578 Kintana 734024
                                                  sCodPortForma,
                                                  Copy(sAnoMesCobrancaTela, 6, 2),
                                                  Copy(sAnoMesCobrancaTela, 1, 4),
                                                  rTotal,
                                                  StrToDate(dtRecebimento.Text),
                                                  psFlgPagador, 'P',
                                                  '','',sRecPag
                                                  ,sObservacaoDocum{Douglas.siqueira Sol 162505 Kintana 1381614},strCentroCusto // Aline Freire SOL 160466 KINTANA 1347998
                                                  )
           else
           begin
                iCodDocumento := DescarregaDocumentos(CtrlDocumento,
                                                  qryDocumentos,
                                                  iIdPatroAtu,
                                                  iPlnCodigo,
                                                  sTipoDocGravar,//prmTpDocRRecPatro, // Renato Visoni SOL 130578 Kintana 734024
                                                  sCodPortForma,
                                                  Copy(sAnoMesCobrancaTela, 6, 2),
                                                  Copy(sAnoMesCobrancaTela, 1, 4),
                                                  rTotal,
                                                  StrToDate(dtRecebimento.Text),
                                                  psFlgPagador, 'P',
                                                  '','',sRecPag
                                                  ,sObservacaoDocum,{Douglas.siqueira Sol 162505 Kintana 1381614}
                                                  strCentroCusto, // Aline Freire SOL 160466 KINTANA 1347998
                                                  True,
                                                  sDataVencimento
                                                  );
                CtrlDocumento.UpdateDataDisponib(iCodDocumento,StrToDate(sDataVencimento));
          end;
            //fim - Andre Olivera SOL: 164351 Kintana: 1506587
    end
    else
    begin
      if sRecPag = 'R' then
        sTipoDocGravar := prmTpDocRRecPatro
      else
        sTipoDocGravar := prmTpDocPEnvioPatro;

      // Aline Freire SOL 160466 KINTANA 1347998
      strCentroCusto :='';
      if  sRecPag  = 'P' then begin
        strCentroCusto := BuscaCentroCusto(qryTotalPatro.FieldByName('IDPESSJUR').AsInteger,qryTotalPatro.FieldByName('IDPLANOPREV').AsInteger,qryTotalPatro.FieldByName('IDDESCONTO').AsInteger);
      end;
      // Aline Freire SOL 160466 KINTANA 1347998


        ////Inicio Douglas.siqueira Sol 162505 Kintana 1381614
        if sRecPag = 'P' then
           begin
             //Inicio - Andre Olivera SOL: 164351 Kintana: 1506587
              sDataVencimento := ValidarDataVencimento;
              if (sDataVencimento = 'CANCEL')then
                begin
                  Result := False;
                  bErro := True;
                  Exit;
                end;
             //fim - Andre Olivera SOL: 164351 Kintana: 1506587
             if MsgDlg('Deseja informar uma observação para ser incluida no documento ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
              begin
                frmObservacaoDocum:= TfrmObservacaoDocum.Create(Application);
                frmObservacaoDocum.ShowModal;
                sObservacaoDocum := frmObservacaoDocum.ObsDocumento.Text;
                frmObservacaoDocum.Free;
              end;      
           end;
        ////FIM Douglas.siqueira Sol 162505 Kintana 1381614
      if (sDataVencimento = '')then
         iCodDocumento := DescarregaDocumentos(CtrlDocumento,
                                            qryDocumentos ,
                                            iIdPatroAtu,
                                            iPlnCodigo,
                                            sTipoDocGravar,
                                            sCodPortForma,
                                            Copy(sAnoMesCobrancaTela, 6, 2),
                                            Copy(sAnoMesCobrancaTela, 1, 4),
                                            rTotal,
                                            StrToDate(dtRecebimento.Text),
                                            psFlgPagador, 'B',  
                                            '','',sRecPag
                                            ,sObservacaoDocum{Douglas.siqueira Sol 162505 Kintana 1381614},strCentroCusto // Aline Freire SOL 160466 KINTANA 1347998
                                           )

      else
      begin
           iCodDocumento := DescarregaDocumentos(CtrlDocumento,
                                            qryDocumentos ,
                                            iIdPatroAtu,
                                            iPlnCodigo,
                                            sTipoDocGravar,
                                            sCodPortForma,
                                            Copy(sAnoMesCobrancaTela, 6, 2),
                                            Copy(sAnoMesCobrancaTela, 1, 4),
                                            rTotal,
                                            StrToDate(dtRecebimento.Text),
                                            psFlgPagador, 'B',  
                                            '','',sRecPag
                                            ,sObservacaoDocum{Douglas.siqueira Sol 162505 Kintana 1381614},strCentroCusto // Aline Freire SOL 160466 KINTANA 1347998
                                            True,
                                            sDataVencimento
                                           );
           CtrlDocumento.UpdateDataDisponib(iCodDocumento,StrToDate(sDataVencimento));
      end;
    end;

    // ---------------------------------------------------------------------------------------------

     // Renato Visoni SOL 126682  KINTANA 665067
    if iCodDocumento > 0 then begin
      if sRecPag = 'P' then begin
        sMsg :='Documento(s) gerado(s) no CAP: ' + intTostr(iCodDocumento);
      end else if sRecPag = 'R' then begin
        sMsg :='Documento(s) gerado(s) no CAR: ' + intTostr(iCodDocumento);
      end;

      memResult.Lines.Add(sMsg);
    end;
    // Renato Visoni SOL 126682  KINTANA 665067

    if iCodDocumento < 0 then
    begin
      Result := False;
      memResult.Lines.Add('[ERRO ] - Erro na inserção dos documentos : '+CtrlDocumento.MessageInfo);
      Exit;
    end;

    listaDocumento.Add(intTostr(iCodDocumento)); // Renato Visoni SOL 130015  Kintana 717839

    // ---------------------------------------------------------------------------------------------

  end;  // if ((iIdFundacao <> iIdPatroAtu) or ...

  // -----------------------------------------------------------------------------------------------



  if qryContabil.Active   and qryContabil.UpdatesPending    then qryContabil.CancelUpdates;
  if qryDocumentos.Active and qryDocumentos.UpdatesPending  then qryDocumentos.CancelUpdates;

  Result := True;
end;



function TfrmRecebeContribuicao.AtualizaUltMesPessoa(sIdPessJur,
                                                     sIdPlanoPrev,
                                                     sIdPessoa,
                                                     sIdContribuicao,
                                                     psAnoMesReferencia,
                                                     psAnoMesCobranca : string ) : boolean;
var sUltMesPreparo,
    sAno13       : string;
begin
   Result := False;

  if Copy(psAnoMesReferencia,6,2) = '13'
   then begin
      sUltMesPreparo := psAnoMesCobranca;
      sAno13         := Copy(psAnoMesCobranca,1,4);
   end
   else begin
      sUltMesPreparo := psAnoMesCobranca;
      sAno13         := ' ULTANO13 ';
   end;

   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE CONTRIBPREVPARTP SET ULTMESPREPARO = '''+sUltMesPreparo+''', '+
              '                             ULTANO13      = '+sAno13+
              ' WHERE  IDPESSJUR      = '+sIdPessJur     +
              ' AND    IDPLANOPREV    = '+sIdPlanoPrev   +
              ' AND    IDPESSOA       = '+sIdPessoa      +
              ' AND    SEQPROPOSTA    = 1'  +
              ' AND    ULTMESPREPARO  < '+QuotedStr(sUltMesPreparo)+ 
              ' AND    IDCONTRIBUICAO = '+sIdContribuicao+'');
      try
         ExecSQL;
      except
         Exit;
      end;
   end;
   Result := True;
end;




function TfrmRecebeContribuicao.ContabilizaContribPATRO ( piIdPessJur : longint; psIDPlanos:string ) : boolean;
var bErroEnvio     : boolean;

    sDataVencimentoPatro,
    sMsgErro,
    sCamposObrig,
    sSQL           : string;
    iPlnCodigo,
    iOrdem,
    iIdLoteEnvio,
    iUltimaContrib, iCodLancCAPCAR  : longint;
    rEnvio         : double;
begin
  Result := False;

  // Para recebimento da folha da patrocinadora, não contabilizar se :
  //    1. a patrocinadora for a propria fundacao
  //    2. o parametro de gerar contas a receber estiver False
  // Para recebimento da folha de benefícios, só enviar para o contas a receber
  //      e contabilidade as patronais, se elas foram calculadas pelo AdmPrev
  if (iIdFundacao = piIdPessJur)
      and (not prmIntegraFundacao) 
      and (rgrpTipoFolha.ItemIndex = 0)
  then begin
     Result := True;
     Exit;
  end;

  if (rgrpTipoFolha.ItemIndex = 0) and (qryPatro.FieldByName('FLGGERACAR').AsInteger = 0)
  then begin
     Result := True;
     Exit;
  end;

  frmAguarde.Mostra(sNomePatro+' - Verificando integração contábil/financeira ... ');

  //envio de participantes não cedidos
  if (rgrpTipoFolha.ItemIndex = 0)
  then begin
     if (not TotalPatroCAR(piIdPessJur,
                           qryPatro.FieldByName('FlgAceitaNaoId').AsInteger,
                           qryPatro.FieldByName('Nome').AsString,
                           'Contribuição de Participante ','C',
                           psIDPlanos, False, False))
     then begin
        memResult.Lines.Add('[ERRO ] - Envio de contribuições do participante lidas do histórico para CAR.');
        frmAguarde.Apaga;
        Exit;
     end;
     memResult.Lines.Add('[OK   ] - Envio de contribuições do participante lidas do histórico para CAR.');
  end;

  // Enviar contribuições patronais que NÃO existem na TMPDESC -> para ambas as folhas
  if ( (rgrpTipoFolha.ItemIndex = 0) and (qryPatro.FieldByName('FLGGERACAR').AsInteger = 1) ) or
       (rgrpTipoFolha.ItemIndex = 1)
  then begin
     if (not TotalPatroCAR(piIdPessJur,
                           qryPatro.FieldByName('FlgAceitaNaoId').AsInteger,
                           qryPatro.FieldByName('Nome').AsString,
                            'Contrib. Patro p/ Participante','P',
                           psIDPlanos, False, False))
     then begin
        memResult.Lines.Add('[ERRO ] - Envio de contribuições da patrocinadora lidas do histórico para CAR.');
        frmAguarde.Apaga;
        Exit;
     end;
     memResult.Lines.Add('[OK   ] - Envio de contribuições da patrocinadora lidas do histórico para CAR.');

  end;


  //envio de participantes cedidos
  if (rgrpTipoFolha.ItemIndex = 0)
  then begin
     if (not TotalPatroCAR(piIdPessJur,
                           qryPatro.FieldByName('FlgAceitaNaoId').AsInteger,
                           qryPatro.FieldByName('Nome').AsString,
                           'Contribuição de Participante ','C',
                           psIDPlanos, False, True))
     then begin
        memResult.Lines.Add('[ERRO ] - Envio de contribuições do participante lidas do histórico para CAR.');
        frmAguarde.Apaga;
        Exit;
     end;
     memResult.Lines.Add('[OK   ] - Envio de contribuições do participante lidas do histórico para CAR.');
  end;

  // Enviar contribuições patronais que NÃO existem na TMPDESC -> para ambas as folhas
  if ( (rgrpTipoFolha.ItemIndex = 0) and (qryPatro.FieldByName('FLGGERACAR').AsInteger = 1) ) or
       (rgrpTipoFolha.ItemIndex = 1)
  then begin
     if (not TotalPatroCAR(piIdPessJur,
                           qryPatro.FieldByName('FlgAceitaNaoId').AsInteger,
                           qryPatro.FieldByName('Nome').AsString,
                            'Contrib. Patro p/ Participante','P',
                           psIDPlanos, False, True))
     then begin
        memResult.Lines.Add('[ERRO ] - Envio de contribuições da patrocinadora lidas do histórico para CAR.');
        frmAguarde.Apaga;
        Exit;
     end;
     memResult.Lines.Add('[OK   ] - Envio de contribuições da patrocinadora lidas do histórico para CAR.');
  end;

  // As exclusivas só são geradas para folha da patrocinadora
  if (rgrpTipoFolha.ItemIndex = 0) and (qryPatro.FieldByName('FLGGERACAR').AsInteger = 1)
  then begin
     frmAguarde.Mostra(sNomePatro+' - Verificando integração contábil/financeira de contribuições exclusivas ... ');
     // Enviar contribuições EXCLUSIVAS
     sSQL := ' SELECT  HST.IDLOTE,           HST.MESREFERENCIA,      HST.NUMRECEBIMENTO,        '+
             '         HST.MESCOBRANCA,                                                         '+
             '         HST.IDMOTIVO,         HST.VALORESPERADO,      HST.IDREGRAALIMRESER,      '+
             '         HST.IDREGRACALCULO,   HST.DATARECEBIMENTO,    HST.VALORRECEBIDO,         '+
             '         HST.QUANTCOTAS,       HST.DATAPREVISAORECE,   HST.CODPORTFORMA,          '+
             '         HST.CODDOCUMENTOPREV,                                                    '+
             '         HST.FLGCALCRESERVA,   HST.VALORCALCULADO,     HST.VALOROP1,              '+
             '         HST.VALOROP2,         HST.VALOROP3,           HST.FLGDESCFOLHA,          '+
             '         HST.FATOR,            HST.IDCONTRIBUICAO,                                '+
             '         HST.IDPESSJUR,        HST.IDPLANOPREV,        HST.IDPESSOA,              '+
             '         HST.SEQPROPOSTA,                                                         '+
             '         HST.DATAINICIO,       HST.DATAFINAL,          HST.IDHISTPROPOSTA,        '+
             '         HST.FLGSITFUNDACAO,   ''0'' AS MATRICULA,                                '+
             '         CP.IDREGRACOBRANCA,   CP.FLGPAGADOR,                                     '+
             '         0 AS  INSCRICAONUMERO,  PT.IDFUNDACAO,                                   '+
             '         0 AS FLGDESCFOLHA,    C.NOME AS NOMECONTRIB,  CPP.DIAVENCIMENTO,         '+
             '         CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONTAD,             '+
             '         CPP.CODCENTROCUSTOC,  CPP.CODCENTROCUSTOD,    CPP.IDEMPRESA,             '+
             '         CPP.UNIDNEGOC,        CPP.IDEMPRESAPROP,      CPP.CODCENTRORESPON,       '+
             '         CPP.CODSUBCONTA,      CPP.RECPAG,             CPP.CODTIPRECDES,          '+
             '         ''P'' as RECPAGDEVOL, ''0'' AS CODTIPDESEMBDEVOL,                        '+
             '         CPP.TIPCODIGO,        CPP.CODTIPDOC,          CPP.CODPORTFORMA,          '+
             '         CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONTAD13,           '+
             '         CPP.CODCENTROCUSTOC13, CPP.IDEMPRESA13,       CPP.CODCENTROCUSTOD13,     '+
             '         CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,     '+
             '         CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPRECDES13,        '+
             '         CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORTFORMA13,        '+
             '         CPP.IDPLANPREVCONTAB, CPP.PLACONTADBANCO,     CPP.PLACONTADBANCO13,      '+
             '         ''0'' AS CODTIPDESEMBCAR,                                                '+
             '         0 AS SALMANTIDO,      HST.FLGDEVOLUCAO,       CPP.DATAINICIO             '+
             ' FROM    CONTRIBUICAO C,  CONTPREV CP,   PATRO PT,                                '+
             '         CONTRIBPREVPATRO CPP,  HSTCONTRIBPREV HST                                '+
             ' WHERE   (HST.MESCOBRANCA    <=  '''+sAnoMesCobrancaTela+''')                     '+
             ' AND     (HST.IDPESSJUR      = '+IntToStr(piIdPessJur)+')                         '+
             ' AND     (HST.SITRECEBIMENTO = ''0'')                                             '+
             ' AND     (CP.FLGPAGADOR      = ''E'')                                             '+
             ' AND     (CPP.IDPLANOPREV    = HST.IDPLANOPREV)                                   '+
             ' AND     (CPP.IDPESSOA       = HST.IDPESSOA)                                      '+
             ' AND     (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)                                '+
             ' AND     (PT.IDPESSOA        = CPP.IDPESSOA)                                      '+
             ' AND     (CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO)                                '+
             ' AND     (CP.IDPLANOPREV     = CPP.IDPLANOPREV)                                   '+
             ' AND     (C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO)                                 '+
             ' AND     (CPP.IDPLANOPREV IN (SELECT DISTINCT IDPLANOPREV FROM HSTRUBRICAXPESS    '+ 
             '                              WHERE  IDPESSOA      = '+IntToStr(piIdPessJur)       +
             '                              AND    MESREFERENCIA = '''+sAnoMesCobrancaTela+'''  '+
             '                              AND    IDPLANOPREV   in ( ' + psIDPlanos + '     )))'+ //ClaudioR - 26/07/2006 - CM 22017
             ' ORDER BY HST.IDLOTE ';

     qryEnvio.Close;
     qryEnvio.SQL.Clear;
     qryEnvio.SQL.Add(sSQL);
     try
       qryEnvio.Open;
     except
       memResult.Lines.Add('[ERRO ] - Leitura das contribuições exclusivas a enviar para o financeiro/contábil.');
       frmAguarde.Apaga;
       Exit;
     end;

     bErroEnvio     := False;
     iOrdem         := 0;
     iUltimaContrib := -1;
     iIdLoteEnvio   := -1;
     qryEnvio.First;
     while not qryEnvio.EOF do
     begin
         inc(iOrdem);
         while (iIdLoteEnvio <> qryEnvio.FieldByName('IdLote').AsInteger) and
               (not qryEnvio.EOF) do
         begin
            sDataVencimentoPatro := CriticaDataCobrancaSit(dtmAPrev.qry,
                                                   qryEnvio.FieldByName('IDPESSJUR').AsString,
                                                   qryEnvio.FieldByName('IDPLANOPREV').AsString,
                                                   'PT', 'N',
                                                   Copy(sAnoMesCobrancaTela,6,2),
                                                   Copy(sAnoMesCobrancaTela,1,4));

            if Trim(sDataVencimentoPatro) = ''
            then begin
               if MsgDlg('Calendário para contribuições da patrocinadora com problemas. Deseja continuar ? ',
                         'Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
               then begin
                  Result := False;
                  memResult.Lines.Add('[AVISO] - Processamento cancelado. Motivo : Calendário para contribuições da patrocinadora com problemas. ');
                  bErro := True;
                  frmAguarde.Apaga; 
                  Exit;
               end
               else sDataVencimentoPatro := DateToStr(date);
            end;


            iCodLancCAPCAR := -1;
            iPlnCodigo := 0;
            rEnvio := EnviaContribuicaoBANCO(qryContabil,qryDocumentos,qryEnvio, qryAux,
                                   Copy(sAnoMesCobrancaTela,6,2),
                                   sAnoMesCobrancaTela,
                                   'Cobrança de Contribuição exclusiva ',
                                   'Receita de Contribuição exclusiva ',
                                   // dtRecebimento.Text,
                                   sDataVencimentoPatro,
                                   qryEnvio.FieldByName('IdPessJur').AsInteger,
                                   qryEnvio.FieldByName('IdPlanoPrev').AsInteger,
                                   qryEnvio.FieldByName('IdPessoa').AsInteger,
                                   qryEnvio.FieldByName('IdContribuicao').AsInteger,
                                   iUltimaContrib,
                                   CtrlDocumento,
                                   qryEnvio.FieldByName('FlgPagador').AsString,
                                   'PT',
                                   -1, // deixar buscar codportforma
                                   'R',
                                   qryEnvio.FieldByName('ValorEsperado').AsFloat,
                                   sMsgErro, iCodLancCAPCAR, iPlnCodigo);

            if rEnvio <= 0
            then begin
               if Trim(sCamposObrig) <> ''
               then begin
                  memResult.Lines.Add(' ');
                  memResult.Lines.Add('[AVISO] - '+qryEnvio.FieldByName('NOMECONTRIB').AsString+' - Campos OBRIGATÓRIOS em branco : '+
                                      sCamposObrig);
                  iUltimaContrib := qryEnvio.FieldByName('IDCONTRIBUICAO').AsInteger;
                  qryEnvio.Next;
                  Continue;
               end
               else begin
                  if rEnvio = 0
                  then begin
                     memResult.Lines.Add(' ');
                     memResult.Lines.Add('[AVISO] - Lote não enviado : valor ZERO. ')
                  end
                  else begin
                     memResult.Lines.Add(' ');
                     memResult.Lines.Add(' Erro no envio do lote das Contribuições exclusivas da Patrocinadora.');
                     bErroEnvio := True;
                  end;
               end;
            end
            else begin
              try
              except
              end;
            end;

            iUltimaContrib := qryEnvio.FieldByName('IDCONTRIBUICAO').AsInteger;
            iIdLoteEnvio   := qryEnvio.FieldByName('IDLOTE').AsInteger;
            qryEnvio.Next;
         end;

         // Acabou um lote -> Atualizar ctrlinterface
         //                -> Atualizar historico de contribuicao com sitrecebimento = 1 (enviado)
         with qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE CTRLINTERFACE SET FLGIDATMP    = 1,' +
                    '                          DATAIDATMP   = SYSDATE,' +
                    '                          FLGPREPARADO = 1,' +
                    '                          DATAPREPARO  = SYSDATE ' +
                    ' WHERE IDLOTE = ' + IntToStr(iIdLoteEnvio) );
            try
              ExecSQL;
            except
              memResult.Lines.Add('[ERRO ] - Atualização do lote '+IntToStr(iIdLoteEnvio)+' - Contribuições Exclusivas. ');
              bErroEnvio := True;
            end;
         end;

         with qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO = ''1'' '+
                    ' WHERE IDLOTE = ' + IntToStr(iIdLoteEnvio) );
            try
              ExecSQL;
            except
              memResult.Lines.Add('[ERRO ] - Atualização da situação do lote '+IntToStr(iIdLoteEnvio)+' no histórico - Contribuições Exclusivas. ');
              bErroEnvio := True;
            end;
         end;
     end; // while

     iPlnCodigo := 0;

     // Descarrega qryContabil com os Lançamentos contábeis dos envios
     IncluiContabilidade(CtrlLancamento, qryContabil , iPlnCodigo,sMsgErro);
     if iPlnCodigo < 0
     then memResult.Lines.Add('[ERRO ] - Inclusão do lançamento na contabilidade : '+sMsgErro);


     // Atualiza os documentos gerados no CAP/CAR com o número da planilha gerada
     // para a contabilidade - plncodigo
     if (piIdPessJur <> iIdFundacao)   or
        ((piIdPessJur = iIdFundacao) and  prmIntegraFundacao) 
     then begin
        qryDocumentos.First;
        while not qryDocumentos.EOF do
        begin
           AdmPREV_Informa_Planilha( qryAux,
                                     iPlnCodigo,
                                     qryDocumentos.FieldByName ('CODDOCUMENTO').AsInteger,
                                     qryDocumentos.FieldByName ('NUMLANCTO').AsInteger);

           qryDocumentos.Next;
        end;
     end;

     try
        qryContabil.CancelUpdates;
        qryDocumentos.CancelUpdates;
     except
     end;
  end; // Fim - Geração das Exclusivas -> Apenas para folha da patrocinadora
  if not bErroEnvio then Result := True;
end; // ContabilizaContribPATRO



procedure TfrmRecebeContribuicao.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;

  DecodeDate(date, AYear, AMonth, ADay);

  if (AMonth >= 1) and (AMonth <= 12) then
  begin
    cmbMesCob.ItemIndex         := AMonth - 1;
    cmbMesCob.Text              := cmbMesCob.Items[cmbMesCob.ItemIndex];
    spedAnoCob.Text             := IntToStr(AYear);
  end;

  spedAnoCob.Text               := IntToStr(AYear);
  dtRecebimento.Text            := DateToStr(date);

  pgctrlOpcoes.ActivePage       := tbsOpcoes;

  bIntegraContab                := prmIntegraContab;
  bIntegraCAR                   := prmIntegraCAR;

  if bIntegraContab
  then lblIntegraContab.Caption := 'Integrar com Contabilidade ? Sim '
  else lblIntegraContab.Caption := 'Integrar com Contabilidade ? Não ';

  if bIntegraCAR
  then lblIntegraCAR.Caption    := 'Integrar com Contas a Receber ? Sim '
  else lblIntegraCAR.Caption    := 'Integrar com Contas a Receber ? Não ';

  chkIntegra.Enabled            :=  bIntegraContab and bIntegraCAR;
  chkIntegraLocal.Enabled       :=  bIntegraContab and bIntegraCAR;

  qryLote.Close;
  qryLote.ParamByName('MESCOBRANCA').AsString := Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2);
  qryLote.Open;
  dblkpcmbLote.Text := '';

  chkOutrosMotivos.Checked := False; 

  if rgrpTipoFolha.ItemIndex = 0 then
  begin
     grpFolhaBen.Visible := False;
     dblkpcmbLote.Text   := '';
  end
  else
  begin
     grpFolhaBen.Visible := True;
     dblkpcmbLote.Text   := '';
  end;

  TabSheet1.TabVisible := (rgrpTipoFolha.ItemIndex = 1); 
end;



procedure TfrmRecebeContribuicao.bbtnDesfazerClick(Sender: TObject);
var i, iIdPessJur, iPlnCodigo : longint;
    //RICARDO CRISTIANO SOL 136185 KINTANA 815495
    sIDPlanos,
    sUltMesPreparo,
    sMsgErro                  : string;
    bOk                       : boolean;
    cTipoEnvPrev              : char;
    iCodDocumento             : longint;
    bDesfaz13                 : Boolean; 
begin
  inherited;

  memResult.Clear;

  MsgDlg('Sempre será feito o desfazer de todos os planos','Atenção',mtInformation,[mbOk,mbHelp],0);

  // Preencher mes de referência
  if (Trim(cmbMesCob.Text) = '') or (Trim(spedAnoCob.Text) = '')
  then begin
     MsgDlg('Preencha o mês de cobrança.','Erro',mtError,[mbOk,mbHelp],0);
     frmAguarde.Apaga; 
     Exit;
  end;

  sAnoMesCobrancaTela  := Trim(spedAnoCob.Text)+'/';
  if cmbMesCob.ItemIndex <= 8
  then sAnoMesCobrancaTela := sAnoMesCobrancaTela+'0'+IntToStr(cmbMesCob.ItemIndex+1)
  else sAnoMesCobrancaTela := sAnoMesCobrancaTela+IntToStr(cmbMesCob.ItemIndex+1);

  //RICARDO CRISTIANO SOL 136185 KINTANA 815495 - Início
  if (Trim(dtRecebimento.Text) = '')
   then begin
     MsgDlg('O campo Data de Recebimento é obrigatório.','Erro',mtError,[mbOk,mbHelp],0);
         frmAguarde.Apaga;
         Exit;
      end;

  sIDPlanos := '';
  For i := 0 to (chklstPlano.Items.Count -1) do
  Begin
    If chklstPlano.Checked[i] Then
    Begin
      If qryPlano.Locate('Nome', chklstPlano.Items[i], [loCaseInsensitive, loPartialKey]) Then
        sIDPlanos := sIDPlanos + qryPlano.FieldByName('IDPLANOPREV').AsString + ', ';
    End;
  End;

  If Trim(sIDPlanos) <> '' Then
    sIDPlanos := Copy(sIDPlanos, 1, Length(sIDPlanos) -2)
  else
               begin
     MsgDlg('Selecione os Planos Previdenciários.','Erro',mtError,[mbOk,mbHelp],0);
               frmAguarde.Apaga;
               Exit;
            end;

  sIDPlanosDesfDoc := sIDPlanos;

  //Todo desfazer foi substituído por essa nova funcionalidade definida na IC.
  AbrirFormModal(frmDesfDocContribuicao, TfrmDesfDocContribuicao);        
  //RICARDO CRISTIANO SOL 136185 KINTANA 815495 - Fim

end;




function TfrmRecebeContribuicao.BaixaAcertoFalecidos(
  piIdPessJur: longint
  ): boolean;
var lsSQL: string;
    lssituacao: string;
    lrValor: real;
begin
  Result := False;

  lsSQL:=
    'SELECT H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA, H.SEQPROPOSTA, '+#13#10+
    '       H.IDCONTRIBUICAO, H.MESREFERENCIA, H.IDMOTIVO, '+#13#10+
    '       SUM(T.VALORRECEBIDO) AS VALORTMPDESC, '+#13#10+
    '       SUM(H.VALORRECEBIDO) AS VALORHST, '+#13#10+
    '       CP.FLGPAGADOR, '+#13#10+
    '       SUM(T.VALOR) AS VALORESPTMPDESC, '+#13#10+
    '       SUM(H.VALORESPERADO) AS VALORESPHST '+#13#10+
    'FROM HSTCONTRIBPREV H, TMPDESC T, CONTPREV CP '+#13#10+
    'WHERE H.MESCOBRANCA = '+quotedstr(sAnoMesCobrancaTela)+' '+#13#10+
    'AND H.IDMOTIVO = '+IntToStr(prmIdMotDevolNaoIden)+' '+#13#10+
    'AND H.IDPESSJUR = '+IntToStr(piIdPessJur)+' '+#13#10+
    'AND H.FLGDESCFOLHA = 1 '+#13#10;

  if rgrpTipoFolha.ItemIndex = 0 then
    lsSQL:=lsSQL+'AND T.FLGDESCFOLHA = ''P'' '+#13#10 
  else
    lsSQL:=lsSQL+'AND T.FLGDESCFOLHA = ''B'' '+#13#10;

  lsSQL:=lsSQL+
    'AND T.FLGTIPODESC = ''P'' '+#13#10+ 
    'AND T.MESREFERENCIA = H.MESREFERENCIA '+#13#10+
    'AND T.IDPESSJUR = H.IDPESSJUR '+#13#10+
    'AND T.IDPLANOPREV = H.IDPLANOPREV '+#13#10+
    'AND T.IDTITULAR = H.IDPESSOA '+#13#10+
    'AND T.SEQPROPOSTA = H.SEQPROPOSTA '+#13#10+
    'AND T.IDDESCONTO = H.IDCONTRIBUICAO '+#13#10+
    'AND T.IDTITULAR <> T.IDPESSOA '+#13#10;

  if Trim(dblkpcmbLote.Text) <> '' then
    lsSQL:=lsSQL+
      'AND T.IDLOTE = '+OraNumero(qryLote.FieldByName('IDLOTE').AsString)+' '+#13#10;

  if Trim(edNome.Text) <> '' then 
    lsSQL:=lsSQL+
      'AND T.IDPESSJUR = '+OraNumero(MontaSelectPart.ValoresChave[0])+#13#10+
      'AND T.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1])+#13#10+
      'AND T.IDPESSOA = '+OraNumero(MontaSelectPart.ValoresChave[2])+#13#10+
      'AND T.SEQPROPOSTA = '+OraNumero(MontaSelectPart.ValoresChave[3])+#13#10;

  lsSQL:=lsSQL+
    'AND CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO '+#13#10+
    'AND CP.IDPLANOPREV = H.IDPLANOPREV '+#13#10;

  lsSQL:=lsSQL+
    'GROUP BY H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA, H.SEQPROPOSTA, '+#13#10+
    '         H.IDCONTRIBUICAO, H.MESREFERENCIA , H.IDMOTIVO, CP.FLGPAGADOR '+#13#10;

  if not FazQuery(qryRecebimento, lsSQL) then
  begin
    Result:=True;
    exit;
  end
  else
  begin
    while not qryRecebimento.EOF do
    begin
      if (qryRecebimento.FieldByName('FLGPAGADOR').asstring = 'P') then
      begin
        lrValor:=qryRecebimento.FieldByName('VALORESPTMPDESC').asfloat;
        if Abs(qryRecebimento.FieldByName('VALORESPHST').AsFloat-
               qryRecebimento.FieldByName('VALORESPTMPDESC').AsFloat) > 0.01 then
          lssituacao:='3' //recebido com divergência
        else
          lssituacao:='2'; //recebido OK
      end
      else
      begin
        if qryRecebimento.FieldByName('VALORTMPDESC').AsFloat <= 0 then
        begin
          qryRecebimento.next;
          Continue;
        end;

        lrValor:=qryRecebimento.FieldByName('VALORTMPDESC').asfloat;
        if Abs(qryRecebimento.FieldByName('VALORHST').AsFloat-
               qryRecebimento.FieldByName('VALORTMPDESC').AsFloat) > 0.01 then 
          lssituacao:='3' //recebido com divergência
        else
          lssituacao:='2'; //recebido OK
      end;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(
        'UPDATE HSTCONTRIBPREV '+#13#10+
        'SET VALORRECEBIDO = '+OraNumero(floattostr(lrvalor))+', '+#13#10+
        '    SITRECEBIMENTO = '+lssituacao+', '+#13#10+
        '    FOLHAORIGEM = ''B'', '+#13#10+
        '    DATARECEBIMENTO = TO_DATE('''+dtRecebimento.Text+''',''DD/MM/YYYY'') '+#13#10+ 
        'WHERE IDPESSJUR = '+qryRecebimento.FieldByName('IDPESSJUR').AsString+' '+#13#10+
        'AND IDPESSOA = '+qryRecebimento.FieldByName('IDPESSOA').AsString+' '+#13#10+
        'AND IDPLANOPREV = '+qryRecebimento.FieldByName('IDPLANOPREV').AsString+' '+#13#10+
        'AND SEQPROPOSTA = '+qryRecebimento.FieldByName('SEQPROPOSTA').AsString+' '+#13#10+
        'AND IDCONTRIBUICAO = '+qryRecebimento.FieldByName('IDCONTRIBUICAO').AsString+' '+#13#10+
        'AND MESREFERENCIA = '+quotedstr(qryRecebimento.FieldByName('MESREFERENCIA').AsString)+' '+#13#10+
        'AND IDMOTIVO = '+qryRecebimento.FieldByName('IDMOTIVO').AsString+' '+#13#10);
      try
        qryAux.ExecSQL;
      except
        Exit;
      end;
      qryRecebimento.Next;
    end;
  end;
  Result:=True;
end;
 {
 SELECT H.IDPLANOPREV, H.IDCONTRIBUICAO, H.CODDOCUMENTOPREV,
       C.NOME, D.NODOCUMENTO, L.PLNCODIGO, PLN.PLNPLANIL, D.DATAEMISSAO, D.DATAVENCTO ,
	 SUM(H.VALORRECEBIDO) AS VALORHST
FROM   HSTCONTRIBPREV H, CtrlDocumento D, LANCTODOCUM L, PLANILHA PLN, CONTRIBUICAO C
WHERE  H.MESCOBRANCA = '2002/04'
AND    H.IDPESSJUR = 2003
AND    H.FLGDESCFOLHA = 1
AND    H.FOLHAORIGEM = 'P' 
AND    H.VALORESPERADO > 0
AND    H.VALORRECEBIDO > 0
AND    H.SITRECEBIMENTO >= 2
AND    H.SITRECEBIMENTO <= 3
AND    D.CODDOCUMENTO  = H.CODDOCUMENTOPREV
AND    L.CODDOCUMENTO  = D.CODDOCUMENTO
AND    PLN.PLNCODIGO   = L.PLNCODIGO 
AND    C.IDCONTRIBUICAO = H.IDCONTRIBUICAO 
GROUP BY H.IDPLANOPREV, H.IDCONTRIBUICAO, H.CODDOCUMENTOPREV,
       C.NOME, D.NODOCUMENTO, L.PLNCODIGO, PLN.PLNPLANIL, D.DATAEMISSAO, D.DATAVENCTO 
ORDER BY H.IDPLANOPREV


 }
procedure TfrmRecebeContribuicao.bbtnConfirmarClick(Sender: TObject);
var i : integer;
begin
  inherited;
  sAnoMesCobrancaTela  := Trim(spedAnoCob.Text)+'/';
  if cmbMesCob.ItemIndex <= 8
  then sAnoMesCobrancaTela := sAnoMesCobrancaTela+'0'+IntToStr(cmbMesCob.ItemIndex+1)
  else sAnoMesCobrancaTela := sAnoMesCobrancaTela+IntToStr(cmbMesCob.ItemIndex+1);

   for i := 0 to chklstPatro.Items.Count - 1 do
   begin
      if (not chklstPatro.Checked[i])  then Continue;

      if not qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive,loPartialKey])
      then Continue;

      qryFundacao.Close;
      qryFundacao.ParamByName('pFundacao').asinteger;
      qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
      qryFundacao.Prepare;
      qryFundacao.Open;

      with qryResumoCobr do
      begin
         Close;
         ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
         ParamByName('MESCOBRANCA').AsString := sAnoMesCobrancaTela;
         if rgrpTipoFolha.ItemIndex = 0
         then begin
            ParamByName('FOLHAORIGEM').AsString := 'P';
            lblTitulo.Caption := 'Resumo Mensal de Recebimentos via Interface - Mês Cob. : '+Trim(cmbMesCob.Text)+' / '+Trim(spedAnoCob.Text);
         end
         else begin
            ParamByName('FOLHAORIGEM').AsString := 'B';
            lblTitulo.Caption := 'Resumo Mensal de Recebimentos via Folha de Benefícios - Mês Cob. : '+Trim(cmbMesCob.Text)+' / '+Trim(spedAnoCob.Text);
         end;
         Open;

         rpResumoCobr.Print;
      end;
   end;
end;


function TfrmRecebeContribuicao.AlteraHSTATRASOCONTRIB ( qryAlteracao : TwwQuery;
                                                       var bAlterou : boolean;
                                                       psValorEsperado, // caso esteja na query passar branco
                                                       psValorRecebido,
                                                       psIdMotivo : string  ) : boolean;
var
  rDif,
  sValAcumRec1 : extended;
  bDtVencTmpDesc : Boolean;   
begin
  Result := False;

  bDtVencTmpDesc := (rgrpTipoFolha.ItemIndex = 1) Or
                    (qryAlteracao.FieldbyName('IDPESSJUR').AsInteger = iIdFundacao);

  if Trim(psValorRecebido) = ''
  then begin
     if Trim(qryAlteracao.FieldByName('VALORRECEBIDO').AsString) = ''
     then rValorRecebido := 0
     else rValorRecebido := qryAlteracao.FieldByName('VALORRECEBIDO').AsFloat;
  end
  else rValorRecebido := StrToFloat(ClienteNumero(psValorRecebido));

  if Trim(psValorEsperado) = ''
  then begin
     if Trim(qryAlteracao.FieldByName('VALOR').AsString) = ''
     then rValorEsperado := 0
     else rValorEsperado := qryAlteracao.FieldByName('VALOR').AsFloat;
  end
  else rValorEsperado := StrToFloat(ClienteNumero(psValorEsperado));

{.}cAuxSeparador    := DecimalSeparator;
   DecimalSeparator := '.';
   sValorRecebido   := FormatFloat('#0.00',rValorRecebido);
   sValorEsperado   := FormatFloat('#0.00',rValorEsperado);
{.}DecimalSeparator := cAuxSeparador;


  sSQL := '';

  if sValorEsperado = sValorRecebido
  then
  begin
     sSQL := sSQL + ' VALORRECEBIDO = ' + OraNumero(sValorRecebido);
     sSQL := sSQL + ', VALOR   = ' + OraNumero(sValorEsperado);
  end
  else begin
     if rValorEsperado  >   rValorRecebido
     then rDif := rValorEsperado -  rValorRecebido
     else rDif := rValorRecebido -  rValorEsperado;

     if  rDif <= qryAlteracao.fieldbyname('VLRACEITADIVERG').AsFloat
     then begin
        sSQL := sSQL + ' VALORRECEBIDO = ' + OraNumero(sValorRecebido);
        sSQL := sSQL + ', VALOR   = ' + OraNumero(sValorRecebido);
     end
     else begin
        sSQL := sSQL + ' VALORRECEBIDO = ' +OraNumero(sValorRecebido);
        sSQL := sSQL + ', VALOR   = ' + OraNumero(sValorEsperado);
     end;
  end;

  if bDtVencTmpDesc
   then sSQL := sSQL +', DATARECEBIMENTO = TO_DATE('''+Trim(qryAlteracao.FieldbyName('DATARECEBIMENTO').AsString)+''', ''dd/mm/yyyy'') '
   Else sSQL := sSQL +', DATARECEBIMENTO = TO_DATE('''+Trim(dtRecebimento.Text)+''', ''dd/mm/yyyy'') ';

  bAlterou := False;

  if Trim(psIdMotivo) = ''
  then psIdMotivo := qryAlteracao.FieldByName('IDMOTIVO').AsString;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE HSTATRASOCONTRIB SET ' + sSQL +
                 ' WHERE NUMRECEBIMENTO  = ( SELECT NUMRECEBIMENTO FROM  HSTCONTRIBPREV '+
                                           ' WHERE IDPESSJUR      = '   + IntToStr(qryAlteracao.FieldByName('IDPESSJUR').AsInteger) + ' AND ' +
                                           '       IDPLANOPREV    = '   + IntToStr(qryAlteracao.FieldByName('IDPLANOPREV').AsInteger) + ' AND ' +
                                           '       IDPESSOA       = '   + IntToStr(qryAlteracao.FieldByName('IDPESSOA').AsInteger)+ ' AND ' +
                                           '       SEQPROPOSTA    = '   + IntToStr(qryAlteracao.FieldByName('SeqProposta').AsInteger)+ ' AND ' +
                                           '       MESREFERENCIA  = ''' + qryAlteracao.FieldByName('MESREFERENCIA').AsString + ''' AND ' +
                                           '       IDCONTRIBUICAO = '   + IntToStr(qryAlteracao.FieldByName('IDDESCONTO').AsInteger) + ' AND ' +
                                           '       MESCOBRANCA    = ''' + qryAlteracao.FieldByName('MESCOBRANCA').AsString+''') AND ' +
                 ' CODALTERADOR    = '   + IntToStr(qryAlteracao.FieldByName('CODALTERADOR').AsInteger) + ' AND ' +
                 ' MESCOBRANCA     = ''' +qryAlteracao.FieldByName('MESCOBRANCA').AsString+ ''' AND ' +
                 ' MESREFERENCIA   = ''' + qryAlteracao.FieldByName('MESREFERENCIA').AsString + ''' AND ' +
                 ' IDMOTIVO        = '   + psIdMotivo+' ');
  try
     qryAux.ExecSQL;
     if qryAux.RowsAffected >= 1
     then bAlterou := True;
  except
     exit;
  end; //try


  Result := True;
end;



procedure TfrmRecebeContribuicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmAguarde.pbAguarde.Visible  := False;
  FreeAndNil( CtrlDocumento );
  FreeAndNil( CtrlLancamento );
  FreeAndNil( CtrlDisponFinanc );
  FreeAndNil( CtrlContab );
  inherited;
end;




function TfrmRecebeContribuicao.VerificaRubricasNaHistRubSal : boolean;
var sSQL : string;
begin
   Result := False;

   sSQL := ' SELECT EL.IDPESSJUR, H.IDPATRO, H.IDPESSOA, H.IDRUBRICA, H.CODPROVDESC,                                                                                                         '+
           '        H.MESCOBRANCA, H.VALORPROVENTO, H.DATAPAGAMENTO, H.IDMOTIVO,                                                                                                             '+
           // incio - edilaine - SOL 191668 / KTN 1820235
           //'      DECODE(P.FLGDECIMOTERCEIRO, 0, H.MES, (SUBSTR(H.MES,1,5)||''13'') ) AS MES,                                                                                              '+
           '        DECODE(NVL(RXE.FLGDECIMOTERCEIRO,0), 0, H.MES, (SUBSTR(H.MES,1,5)||''13'') ) AS MES,                                                                                     '+
           '        DECODE(P.FLGDESCONTO,1,DECODE(H.MES, H.MESCOBRANCA,''N'',''A''),''D'') AS FLGATRASODEVOL,                                                                                '+
           '        P.FLGDESCONTO, EL.MATRICULA,CONTRIB.IDPLANOPREV, CONTRIB.IDCONTRIBUICAO, H.IDMODULO, /*P.FLGDECIMOTERCEIRO*/                                                             '+
           '        NVL(RXE.FLGDECIMOTERCEIRO,0) AS FLGDECIMOTERCEIRO  '+
           ' FROM   ELEGPATRO EL, HISTRUBSAL H, PROVDESC P, VW_RUBXEVENTO RXE,                                                                                                               '+
           // fim - edilaine - SOL 191668 / KTN 1820235  (inclusao VW_RUBXEVENTO RXE)
           '        (                                                                                                                                                                        '+
           '                         SELECT C.IDRUBACERTO       AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBACERTODECT   AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBACJUD        AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBADIANT       AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBADIANT13     AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBATRACJUD     AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBDADACJUD     AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBDECTERC      AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBDECTERCATRA  AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBDECTERCDEVOL AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBDEVACJUD     AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBDEVADIANT13  AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBDEVADTACJUD  AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBDEVOLADIANT  AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBFERIASATRASO AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBFERIASDEVOL  AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBFERIASNORM   AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBRICA         AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBRICAATRASO   AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUBRICADEVOLUC  AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUB13ACJUD      AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUB13ATRACJUD   AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUB13DESCACJUD  AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUB13DEVACJUD   AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '                         SELECT C.IDRUB13DVADTACJUD AS IDRUBRICA, C.IDCONTRIBUICAO, C.IDPLANOPREV, C.FLGPAGADOR  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV       '+
           '        ) CONTRIB                                                                                                                                                                '+
           ' WHERE  H.MESCOBRANCA = '''+sAnoMesCobrancaTela+'''                                                                                                                              '+
           ' AND    ((H.IDMODULO  = 21) OR (H.IDMODULO IS NULL))                                                                                                                             '+
           ' AND    H.IDRUBRICA   = CONTRIB.IDRUBRICA                                                                                                                                        '+
           ' AND   (CONTRIB.FLGPAGADOR = ''C'')                                                                                                                                              '+
           ' AND NOT EXISTS ( SELECT 1 FROM TMPDESC T                                                                                                                                        '+
           '                  WHERE  T.IDPESSOA      = H.IDPESSOA                                                                                                                            '+
           // INICIO - edilaine - SOL 191668 / KTN 1820235
           //'                AND    T.MESREFERENCIA = (DECODE(P.FLGDECIMOTERCEIRO, 0, H.MES, (SUBSTR(H.MES,1,5)||''13'')) )                                                                 '+
           '                  AND    T.MESREFERENCIA = (DECODE(NVL(RXE.FLGDECIMOTERCEIRO,0), 0, H.MES, (SUBSTR(H.MES,1,5)||''13'')) )                                                        '+
           // FIM - edilaine - SOL 191668 / KTN 1820235
           '                  AND    T.MESCOBRANCA   = H.MESCOBRANCA                                                                                                                         '+
           '                  AND    T.IDPROVENTO    = H.IDRUBRICA  )                                                                                                                        '+
           ' AND P.IDPROVENTO = H.IDRUBRICA                                                                                                                                                  '+

           // edilaine - SOL 191668 / KTN 1820235
           ' AND P.IDPROVENTO = RXE.IDPROVENTO(+)                                                                                                                                            '+

           ' AND (                                                                                                                                                                           '+
           '       ( (EL.IDPESSJURCEDIDO IS NULL) AND (EL.IDPESSJUR = H.IDPESSJUR) ) OR                                                                                                      '+
           '       ( EL.IDPESSJURCEDIDO = H.IDPESSJUR )                                                                                                                                      '+
           '     )                                                                                                                                                                           '+
           ' AND EL.IDPESSOA  = H.IDPESSOA                                                                                                                                                   ';

   if Trim(edNome.Text) <> '' 
   then sSQL := sSQL + ' AND EL.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+
                       ' AND EL.IDPESSOA    = '+OraNumero(MontaSelectPart.ValoresChave[2]);

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.Open;
   while not qryAux.EOF do
   begin
        if not InsereTMPDESC ( dtmAPrev.qry,
                               '', // psCODALTERADOR,
                               '', // psCODCENTROCUSTOC,
                               '', // psCODCENTROCUSTOD,
                               '', // psCODCENTRORESPON,
                               '', // psCODDOCUMENTOEFET,
                               '', // psCODDOCUMENTOPREV,
                               '', // psCODPORTFORMA,
                               qryAux.FieldbyName('CODPROVDESC').AsString, // psCODPROVDESC,
                               '', // psCODSUBCONTA,
                               '', // psCODTIPDOC,
                               '', // psCODTIPRECDES,
                               '', // psCOMPLDOCUMENTO,
                               qryAux.FieldbyName('DATAPAGAMENTO').AsString, // psDATACOBRANCA,
                               qryAux.FieldbyName('DATAPAGAMENTO').AsString, // psDATARECEBIMENTO,
                               qryAux.FieldbyName('DATAPAGAMENTO').AsString, // psDATAREFERENCIA,
                               'Rubrica Extra Descontada Na Folha de Pagamento', // psDESCRICAO,
                               '', // psEXERCICIO,
                               '', // psFLGALTERADOR,
                               qryAux.FieldbyName('FLGATRASODEVOL').AsString, // psFLGATRASODEVOL,
                               'P', // psFLGDESCFOLHA,
                               qryAux.FieldbyName('FLGDESCONTO').AsString, // psFLGDESCONTO,
                               '0', // psFLGEXISTEHST,
                               '', // psFLGINTEVENTO,
                               'P',// psFLGTIPODESC,
                               qryAux.FieldbyName('IDCONTRIBUICAO').AsString, // psIDDESCONTO,
                               qryAux.FieldbyName('IDPESSJUR').AsString, // psIDEMPCOBRANCA,
                               '', // psIDEMPRESA,
                               '', // psIDEMPRESAPROP,
                               '', // psIDFAVORECIDO,
                               IntToStr(iIdFundacao), // psIDFUNDACAO,
                               '', // psIDLOTE,
                               qryAux.FieldbyName('IDMODULO').AsString, // psIDMODULO
                               qryAux.FieldbyName('IDMOTIVO').AsString, // psIDMOTIVO,
                               qryAux.FieldbyName('IDPESSJUR').AsString, // psIDPESSJUR,
                               qryAux.FieldbyName('IDPESSOA').AsString, // psIDPESSOA,
                               qryAux.FieldbyName('IDPLANOPREV').AsString, // psIDPLANOPREV,
                               '', // psIDPLANPREVCONTAB,
                               qryAux.FieldbyName('IDRUBRICA').AsString, // psIDPROVENTO,
                               qryAux.FieldbyName('IDPESSOA').AsString, // psIDTITULAR,
                               '', // psINSCRICAONUMERO,
                               qryAux.FieldbyName('MATRICULA').AsString, // psMATRICULA,
                               qryAux.FieldbyName('MESCOBRANCA').AsString, // psMESCOBRANCA,
                               qryAux.FieldbyName('MES').AsString, // psMESREFERENCIA,
                               '', // psNODOCUMENTO,
                               '', // psPERIODO,
                               '', // psPLACONTAC,
                               '', // psPLACONTAD,
                               '', // psPLANO,
                               '', // psRECPAG,
                               '***', // psREFERENCIA,
                               '1', // psSEQPROPOSTA,
                               qryAux.FieldbyName('IDMODULO').AsString, // psSISTORIGEM,
                               '2', // psSITENVIO,
                               '', // psTIPCODIGO,
                               '', // psUNIDNEGOC,
                               qryAux.FieldbyName('VALORPROVENTO').AsString, // psVALOR,
                               '', // psVALORBASE1,
                               '', // psVALORBASE2,
                               '', // psVALORBASE3,
                               qryAux.FieldbyName('VALORPROVENTO').AsString, // psVALORINFO,
                               qryAux.FieldbyName('VALORPROVENTO').AsString  // psVALORRECEBIDO
                       )
        then Break;
        qryAux.Next;
   end;

   // Rotina para verificar se o valor não foi inserido na TMPDESC mas existe
   //               na HISTRUBSAL. Caso exista faz um update na TMPDESC
   sSQL := ' SELECT H.IDPESSJUR, H.IDPATRO, H.IDPESSOA, H.IDRUBRICA, H.CODPROVDESC, '+
           '        H.MESCOBRANCA, CONTRIB.IDCONTRIBUICAO , H.DATAPAGAMENTO, '+
           // INICIO - edilaine - SOL 191668 / KTN 1820235
           //'      DECODE(P.FLGDECIMOTERCEIRO, 0, H.MES, (SUBSTR(H.MES,1,5)||''13'') ) AS MES, '+
           '        DECODE(NVL(RXE.FLGDECIMOTERCEIRO,0), 0, H.MES, (SUBSTR(H.MES,1,5)||''13'') ) AS MES, '+
           '        C.FLGTPVLR, H.VALORPROVENTO, T.VALOR, T.VALORRECEBIDO, /*P.FLGDECIMOTERCEIRO*/ '+
           '        NVL(RXE.FLGDECIMOTERCEIRO,0) FLGDECIMOTERCEIRO '+
           ' FROM   ELEGPATRO EL, HISTRUBSAL H, PROVDESC P, CONTPLANPATRO C, TMPDESC T, VW_RUBXEVENTO RXE, '+
           // INICIO - edilaine - SOL 191668 / KTN 1820235 (inclusao VW_RUBXEVENTO RXE)
           '        (SELECT C.IDRUBACERTO       AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBACERTODECT   AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBACJUD        AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBADIANT       AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBADIANT13     AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBATRACJUD     AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBDADACJUD     AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBDECTERC      AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBDECTERCATRA  AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBDECTERCDEVOL AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBDEVACJUD     AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBDEVADIANT13  AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBDEVADTACJUD  AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBDEVOLADIANT  AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBFERIASATRASO AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBFERIASDEVOL  AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBFERIASNORM   AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBRICA         AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBRICAATRASO   AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUBRICADEVOLUC  AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUB13ACJUD      AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUB13ATRACJUD   AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUB13DESCACJUD  AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUB13DEVACJUD   AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV UNION '+
           '         SELECT C.IDRUB13DVADTACJUD AS IDRUBRICA, C.FLGPAGADOR, C.IDCONTRIBUICAO, C.IDPLANOPREV  FROM CONTPREV C, PLANPREVPATRO PLP WHERE PLP.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND C.IDPLANOPREV = PLP.IDPLANOPREV ) CONTRIB '+
           ' WHERE CONTRIB.FLGPAGADOR = ''C'' '+
           ' AND   H.MESCOBRANCA = '''+sAnoMesCobrancaTela+''' '+
           ' AND    ((H.IDMODULO  = 21) OR (H.IDMODULO IS NULL)) '+
           ' AND    H.IDRUBRICA   = CONTRIB.IDRUBRICA '+
           ' AND    H.VALORPROVENTO > 0 '+
           ' AND    P.IDPROVENTO = H.IDRUBRICA '+
           ' AND    P.IDPROVENTO = RXE.IDPROVENTO(+) '+     // edilaine - SOL 191668 / KTN 1820235 (inclusao VW_RUBXEVENTO RXE)
           ' AND    EL.IDPESSJUR = H.IDPESSJUR '+
           ' AND    EL.IDPESSOA  = H.IDPESSOA  '+
           ' AND    C.IDPLANOPREV    = CONTRIB.IDPLANOPREV '+
           ' AND    C.IDPESSJUR      = H.IDPESSJUR '+
           ' AND    C.IDCONTRIBUICAO = CONTRIB.IDCONTRIBUICAO '+
           ' AND    T.IDPESSOA      = H.IDPESSOA '+
           // INICIO - edilaine - SOL 191668 / KTN 1820235
           //' AND  T.MESREFERENCIA = (DECODE(P.FLGDECIMOTERCEIRO, 0, H.MES, (SUBSTR(H.MES,1,5)||''13'')) ) '+
           ' AND    T.MESREFERENCIA = (DECODE(NVL(RXE.FLGDECIMOTERCEIRO,0), 0, H.MES, (SUBSTR(H.MES,1,5)||''13'')) ) '+
           // FIM - edilaine - SOL 191668 / KTN 1820235
           ' AND    T.MESCOBRANCA   = H.MESCOBRANCA '+
           ' AND    T.IDPESSJUR     = H.IDPESSJUR '+
           ' AND    ((T.VALORRECEBIDO = 0) OR (T.VALORRECEBIDO IS NULL)) ';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.Open;
   while Not qryAux.EOF do
    begin
     sSQL := 'UPDATE TMPDESC '+
             ' SET VALORRECEBIDO = '+OraNumero(FloatToStr(qryAux.FieldByName('VALORPROVENTO').AsFloat))+', '+
             '     DATARECEBIMENTO = TO_DATE('+QuotedStr(qryAux.FieldByName('DATAPAGAMENTO').AsString)+','+
                                               QuotedStr('DD/MM/YYYY')+'), ';
     if qryAux.FieldByName('FLGTPVLR').AsString = 'B'
      then begin
        sSQL := sSQL + '     VALOR = '+OraNumero(FloatToStr(qryAux.FieldByName('VALORPROVENTO').AsFloat))+', ';
        sSQL := sSQL + '     SITENVIO = 2 ';
      end
      Else if qryAux.FieldByName('VALORRECEBIDO').AsFloat <> qryAux.FieldByName('VALORPROVENTO').AsFloat
            then sSQL := sSQL + '     SITENVIO = 1 ';

     if qryAux.FieldByName('FLGDECIMOTERCEIRO').AsInteger = 1
      then sSQL := sSQL + 'WHERE MESREFERENCIA = '+ QuotedStr(Copy(qryAux.FieldByName('MES').AsString,1,5)+'13')
      Else sSQL := sSQL + 'WHERE MESREFERENCIA = '+QuotedStr(qryAux.FieldByName('MES').AsString);

     sSQL := sSQL + '   AND IDPESSOA = '+qryAux.FieldByName('IDPESSOA').AsString+
             '   AND IDPESSJUR = '+qryAux.FieldByName('IDPESSJUR').AsString+
             '   AND IDDESCONTO = '+qryAux.FieldByName('IDCONTRIBUICAO').AsString+
             '   AND MESCOBRANCA = '+QuotedStr(qryAux.FieldByName('MESCOBRANCA').AsString);

     dtmAPrev.qry.Close;
     dtmAPrev.qry.SQL.Clear;
     dtmAPrev.qry.SQL.Add(sSQL);

     Try
      dtmAPrev.qry.ExecSQL;
     Except
      Result := False;
      Exit;
     end;

     qryAux.Next;
    end;

   Result := True;
end; // VerificaRubricasNaHistRubSal

procedure TfrmRecebeContribuicao.btndesfazselecClick(Sender: TObject);
begin
  inherited;
  edNome.Text      := '';
  edMatricula.Text := '';
  edPatro.Text     := '';
  edPlano.Text     := '';

end;

procedure TfrmRecebeContribuicao.bbtnProcurarClick(Sender: TObject);
Var
 i : Integer;
begin
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     // 0-PARTPREVPLAN.IDPESSJUR
     // 1-PARTPREVPLAN.IDPLANOPREV
     // 2-DEPENTIT.IDPESSOA
     // 3-PARTPREVPLAN.SEQPROPOSTA
     // 4-ELEGPATRO.MATRICULA
     // 5-DEPENTIT.MATRICULA
     // 6-PESSOAB.NOME
     // 7-PLANPREV.NOME
     // 8-PATRO.NOME
     // 9-DEPENTIT.IDTITULAR
     edNome.Text      := MontaSelectPart.ValoresChave[6];
     edMatricula.Text := MontaSelectPart.ValoresChave[5];
     edPatro.Text     := MontaSelectPart.ValoresChave[8];
     edPlano.Text     := MontaSelectPart.ValoresChave[7];
     if MontaSelectPart.ValoresChave[2] = MontaSelectPart.ValoresChave[9]
     then lblParticip.Caption := 'Nome do Pagador (Participante)'
     else lblParticip.Caption := 'Nome do Pagador (Beneficiário)';

     For i := 0 to chklstPatro.Items.Count - 1
      Do chklstPatro.Checked[i] := (chklstPatro.Items[i] = MontaSelectPart.ValoresChave[8]);
  end;
end;



procedure TfrmRecebeContribuicao.grpMesAnoRefExit(Sender: TObject);
begin
  inherited;
  sAnoMesCobrancaTela  := Trim(spedAnoCob.Text)+'/';
  if cmbMesCob.ItemIndex <= 8
  then sAnoMesCobrancaTela := sAnoMesCobrancaTela+'0'+IntToStr(cmbMesCob.ItemIndex+1)
  else sAnoMesCobrancaTela := sAnoMesCobrancaTela+IntToStr(cmbMesCob.ItemIndex+1);

  qryLote.Close;
  qryLote.ParamByName('MESCOBRANCA').AsString := sAnoMesCobrancaTela;
  qryLote.Open;
  dblkpcmbLote.Text := '';
end;

procedure TfrmRecebeContribuicao.rgrpTipoFolhaClick(Sender: TObject);
begin
  inherited;

  TabSheet1.TabVisible := (rgrpTipoFolha.ItemIndex = 1); 

  if rgrpTipoFolha.ItemIndex = 0
  then begin
     grpFolhaBen.Visible := False;
     dblkpcmbLote.Text   := '';
     btndesfazselecClick(Self); 
  end
  else begin
     grpFolhaBen.Visible := True;
  end;
end;



function TfrmRecebeContribuicao.VerificaMotivosNaHistContrib(piIdPessjur: Integer): Boolean;
Var
 sSQL : string;
begin
 With qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT HC.IDPESSOA, EL.MATRICULA, HC.MESREFERENCIA, HC.VALORESPERADO, ');
    SQL.Add('       HC.IDCONTRIBUICAO, CO.NOMERESUM, HC.IDMOTIVO, MO.DESCRICAO ');
    SQL.Add('FROM HSTCONTRIBPREV HC, ELEGPATRO EL, CONTRIBUICAO CO, MOTIVO MO ');
    SQL.Add('WHERE (HC.MESCOBRANCA = '+QuotedStr(sAnoMesCobrancaTela)+')');

    if rgrpTipoFolha.ItemIndex = 1
     then begin
      SQL.Add('  AND (HC.FOLHAORIGEM     = ''B'')'  );

      sSQL := IntToStr(prmIdMotivoFolhaBen)+', '+ IntToStr(prmIdMotivoDevolBen);

      if prmIdMotDevolNaoIden > 0
      then sSQL := sSQL + ', ' + IntToStr(prmIdMotDevolNaoIden);

      if prmIdMotivoAcertoFL > 0
      then sSQL := sSQL + ', ' + IntToStr(prmIdMotivoAcertoFL);

      if prmIdMotivoAbono > 0
      then sSQL := sSQL + ', ' + IntToStr(prmIdMotivoAbono);

      SQL.Add('  AND (HC.IDMOTIVO NOT IN ('+sSQL+') )');
     end
     Else begin
      SQL.Add('  AND ((HC.FOLHAORIGEM    = ''P'') OR (HC.FOLHAORIGEM IS NULL) )');
      SQL.Add('  AND (HC.IDMOTIVO        <> '+IntToStr(prmIdMotivoContrib)+')');

     end;

    if Trim(edNome.Text) <> ''
     then begin
      SQL.Add('  AND (HC.IDPESSOA       = '+MontaSelectPart.ValoresChave[2]+')');
      SQL.Add('  AND (HC.IDPESSJUR      = '+MontaSelectPart.ValoresChave[0]+')');
      SQL.Add('  AND (HC.IDPLANOPREV    = '+MontaSelectPart.ValoresChave[1]+')');
     end
     Else SQL.Add('  AND (HC.IDPESSJUR      = '+IntToStr(piIdPessjur)+')');

    SQL.Add('  AND (HC.SITRECEBIMENTO <= 1 ) ');
    SQL.Add('  AND (NVL(HC.VALORRECEBIDO,0 ) = 0 )');
    SQL.Add('  AND (NVL(HC.FLGEVENTO,0) = 0 ) ');
    SQL.Add('  AND (NVL(HC.FLGMANUAL,0) = 0 ) ');
    SQL.Add('  AND (HC.IDPESSOA         = EL.IDPESSOA)');
    SQL.Add('  AND (HC.IDPESSJUR        = EL.IDPESSJUR)');
    SQL.Add('  AND (HC.IDCONTRIBUICAO   = CO.IDCONTRIBUICAO)');
    SQL.Add('  AND (HC.IDMOTIVO         = MO.IDMOTIVO)');
    SQL.Add('  AND (HC.FLGDESCFOLHA     = 1)'); 

    Open;

    Result:= (Not IsEmpty);

    if Result
     then
       while Not EOF do
        begin
         memResult.Lines.Add('Contrib.'+FieldByName('NOMERESUM').AsString+' - '+
                             'Matric.'+FieldByName('MATRICULA').AsString+' - '+
                             'Ref.'+QuotedStr(FieldByName('MESREFERENCIA').AsString)+' - '+
                             'Valor '+FormatFloat('###,##0.00',FieldByName('VALORESPERADO').AsFloat)+' - '+
                             'Motivo '+FieldByName('DESCRICAO').AsString+' - '+
                             'Origem não reconhecida');
         Next;
        end;
  end;
end;



function TfrmRecebeContribuicao.AtualizaParcelamento(qryAux : twwquery;
                              sAnoMesCobrancaTela : string;
                              iIdPessjur : Integer) : Boolean;
var sCont : string;                              
begin
   Result := True;


   qryloop.close;
   qryloop.SQL.text := '  SELECT IDPARCELAMENTO, IDPESSJUR, IDPLANOPREV, IDPESSOA , SEQPROPOSTA, '+
       ' VLRDIVIDAPART, VLRDIVIDAPATRO, SDODEVEDOR, FLGDESCFOLHA, NUMPARCELAS, '+
       ' PARCPAGAS, PARCGERADAS, '+
       ' VLRPRIMPRESTACAO '+
       ' FROM PARCELAMENTO '+
       ' WHERE SITPARCELAMENTO = 1 ';

   qryloop.open;


   while not qryloop.EOF do
   begin

      qryaux.close;
      qryaux.SQL.text := ' SELECT COUNT(1) CONT, IDCONTRIBUICAO '+
                         ' FROM HSTCONTRIBPREV '+
                         ' WHERE IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+' AND '+
                         ' IDPLANOPREV = '+qryloop.fieldbyname('IDPLANOPREV').AsString+' AND '+
                         ' IDPESSOA = '+qryloop.fieldbyname('IDPESSOA').AsString+'  AND '+
                         ' IDPARCELAMENTO = '+qryloop.fieldbyname('IDPARCELAMENTO').AsString+'  AND '+
                         ' NVL(VALORRECEBIDO,0) >0 '+
                         ' GROUP BY IDCONTRIBUICAO '+
                         ' ORDER BY CONT DESC ';
      qryaux.open;

      if qryaux.isempty then
      begin
         qryloop.next;
         Continue;
      end;


      sCont := qryaux.fieldbyname('CONT').AsString;

      qryaux.close;
      qryaux.SQL.text := ' UPDATE PARCELAMENTO SET PARCPAGAS = '+sCont+' '+
                         ' WHERE IDPARCELAMENTO = '+qryloop.fieldbyname('IDPARCELAMENTO').AsString+'';
      try
         qryaux.execSQL;
      except
         Result := False;
         exit;
      end;

      {
       Atualiza a situação do parcelamento para Quitado (SitParcelamento = 2),
       caso o número de parcelas pagas seja igual ao número tota de parcelas
      }
      qryaux.close;
      qryaux.SQL.text := ' UPDATE PARCELAMENTO SET SITPARCELAMENTO = 2 '+
                         ' WHERE IDPARCELAMENTO = '+ qryloop.fieldbyname('IDPARCELAMENTO').AsString +
                           ' AND PARCPAGAS      = NUMPARCELAS ';
      try
         qryaux.execSQL;
      except
         Result := False;
         exit;
      end;

      {
       Atualiza o FlgCobra para 0 (zero) da ContribPrevPartP para não gerar mais
       a contribuição em que foi parcelada a dívida
      }
      qryaux.close;
      qryaux.SQL.text :=
        ' UPDATE CONTRIBPREVPARTP '+
        ' SET FLGCOBRA = 0        '+
        ' WHERE IDCONTRIBUICAO IN (SELECT DISTINCT '+
                                     ' IDCONTRIBUICAO '+
                                  'FROM  HSTCONTRIBPREV H, PARCELAMENTO P '+
                                  'WHERE H.IDPESSJUR             = '+ qryloop.fieldbyname('IDPESSJUR').AsString      +
                                   ' AND H.IDPLANOPREV           = '+ qryloop.fieldbyname('IDPLANOPREV').AsString    +
                                   ' AND H.IDPESSOA              = '+ qryloop.fieldbyname('IDPESSOA').AsString       +
                                   ' AND H.IDPARCELAMENTO        = '+ qryloop.fieldbyname('IDPARCELAMENTO').AsString +
                                   ' AND H.IDPARCELAMENTO        = P.IDPARCELAMENTO '+
                                   ' AND P.PARCPAGAS             = P.NUMPARCELAS    '+
                                   ' AND NVL(H.VALORRECEBIDO, 0) > 0) '+
          ' AND IDPESSOA    = '+ qryloop.fieldbyname('IDPESSOA').AsString    +
          ' AND IDPESSJUR   = '+ qryloop.fieldbyname('IDPESSJUR').AsString   +
          ' AND IDPLANOPREV = '+ qryloop.fieldbyname('IDPLANOPREV').AsString ;

      Try
        qryAux.ExecSQL;
      Except
        Result := False;
        Exit;
      end;

      qryloop.next;
   end;


end;

function TfrmRecebeContribuicao.VerificaDadosIntegracao(
  qryAux: twwquery;
  sAnoMesCobrancaTela: string;
  iIdPessjur: Integer
  ): Boolean;
var lsSQL: string;
begin
  Result := False;
  berro := False;

  memResult.Lines.Add(' ');
  memResult.Lines.Add('Verificação de Parâmetros Contábeis e Financeiros Básicos');
  memResult.Lines.Add('---------------------------------------------------------');

  //verfica período contábil
  qryaux.close;
  qryaux.SQL.text:=
    'SELECT PERBLOQUE, PERBLOINT '+#13#10+
    'FROM PERIODO '+#13#10+
    'WHERE PEREXERCICIO = TO_NUMBER(SUBSTR('+quotedstr(sAnoMesCobrancaTela)+',1,4)) '+#13#10+
    'AND PERNUMERO = TO_NUMBER(SUBSTR('+quotedstr(sAnoMesCobrancaTela)+',6,2)) ';
  qryaux.open;

  if qryaux.isempty then
  begin
    memResult.Lines.Add('O período contábil não foi cadastrado.');
    berro := True;
  end
  else
  begin
    if (trim(qryaux.FieldByName('PERBLOINT').AsString) = 'S') or
       (trim(qryaux.FieldByName('PERBLOQUE').AsString) = 'S') then
    begin
      memResult.Lines.Add('Período contábil bloqueado - '''+sAnoMesCobrancaTela+'''');
      memResult.Lines.Add('');
      berro := True;
    end;
  end;

  //verifica parâmetros gerais
  qryaux.close;
  qryaux.SQL.text := 'SELECT F.IDPESSOA, P.NOME AS FUNDACAO, '+
                     '        PARAM.TIPOPERCOBRANCA,  PARAM.TPDOCRRECPATRO,  '+
                     '        PARAM.TPDOCPENVIOPATRO,     '+
                     '        PARAM.TIPOCLIPATRO,  PARAM.TIPOFAVPATRO '+
                     ' FROM   PESSOA P, FUNDACAO F, PARAMAPREV PARAM '+
                     ' WHERE  P.IDPESSOA       = F.IDPESSOA '+
                     ' AND    F.IDPESSOA       = '+IntToStr(iIdFundacao)+' '+
                     ' AND    PARAM.IDFUNDACAO = F.IDPESSOA '+
                     ' ORDER BY P.NOME ';
  qryaux.open;

  if qryaux.isempty then
  begin
    memResult.Lines.Add('[Não parametrizado] - Parâmetros Gerais.');
    berro := True;
  end
  else
  begin
    if (trim(qryaux.FieldByName('TIPOPERCOBRANCA').AsString) = '') then
    begin
      memResult.Lines.Add('[Não parametrizado] - Parâmetro Geral');
      memResult.Lines.Add('Tipo de Operação - Recebimento de Contribuições Previdenciárias.');
      memResult.Lines.Add('');
      berro := True;
    end;
    if (trim(qryaux.FieldByName('TPDOCRRECPATRO').AsString) = '') then
    begin
      memResult.Lines.Add('[Não parametrizado] - Parâmetro Geral');
      memResult.Lines.Add('Tipo de Documento - Contas a receber/via recebimento Patrocinadora.');
      memResult.Lines.Add('');
      berro := True;
    end;
    if (trim(qryaux.FieldByName('TIPOCLIPATRO').AsString) = '') then
    begin
      memResult.Lines.Add('[Não parametrizado] - Parâmetro Geral');
      memResult.Lines.Add('Tipo de Cliente para a Patrocinadora.');
      memResult.Lines.Add('');
      berro := True;
    end;
    if (trim(qryaux.FieldByName('TIPOFAVPATRO').AsString) = '') then
    begin
      memResult.Lines.Add('[Não parametrizado] - Parâmetro Geral');
      memResult.Lines.Add('Tipo de Favorecido para a Patrocinadora.');
      memResult.Lines.Add('');
      berro := True;
    end;
  end;

  lsSQL:=
    'SELECT DISTINCT T.IDDESCONTO IDCONTRIBUICAO, T.IDPLANOPREV, '+#13#10+
    '       DECODE(T.FLGATRASODEVOL,''D'',''D'',''N'') AS FLGATRASODEVOL, '+#13#10+
    '       DECODE(SUBSTR(T.MESREFERENCIA,6,2),''13'',''0000/13'',T.MESCOBRANCA) AS MESREFERENCIA '+#13#10+
    'FROM CONTPREV C, TMPDESC T, PLANPREVPATRO PLP '+#13#10+
    'WHERE (T.IDPESSJUR = '+ IntToStr(iIdPessjur)+') '+#13#10+
    'AND (T.MESCOBRANCA = '+quotedstr(sAnoMesCobrancaTela)+') '+#13#10+
    'AND (PLP.IDPESSJUR = T.IDPESSJUR) '+#13#10+
    'AND (PLP.IDPLANOPREV = T.IDPLANOPREV) '+#13#10+
    'AND ((C.FLGPAGADOR = ''C'') OR ((PLP.FLGRECECONTPATRO = 1) AND (C.FLGPAGADOR = ''P''))) '+#13#10+
    'AND ((T.SITENVIO = ''2'') OR (T.SITENVIO = ''1'' AND T.VALORRECEBIDO <> 0)) '+#13#10+
    'AND (NVL(T.VALORRECEBIDO,0) > 0) '+#13#10+
    'AND (T.FLGTIPODESC = ''P'') '+#13#10+
    'AND (C.IDPLANOPREV = T.IDPLANOPREV) '+#13#10+
    'AND (C.IDCONTRIBUICAO = T.IDDESCONTO) '+#13#10;

  //seleciona contribuições a serem recebidas para verificação de parâmetros
  //de integração
  if rgrpTipoFolha.ItemIndex = 0 then
    lsSQL:=lsSQL+
      'AND (T.FLGDESCFOLHA = ''P'') '+#13#10
  else
    lsSQL:=lsSQL+
      'AND (T.FLGDESCFOLHA = ''B'') '+#13#10+
      'AND (C.FLGPAGADOR = ''P'') '+#13#10;

  if Trim(dblkpcmbLote.Text) <> '' then
    lsSQL:=lsSQL+
      'AND T.IDLOTE = '+OraNumero(qryLote.FieldByName('IDLOTE').AsString)+#13#10;

  if Trim(edNome.Text) <> '' then
    lsSQL:=lsSQL+
      ' AND T.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+#13#10+
      ' AND T.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1])+#13#10+
      ' AND T.IDPESSOA    = '+OraNumero(MontaSelectPart.ValoresChave[2])+#13#10+
      ' AND T.SEQPROPOSTA = '+OraNumero(MontaSelectPart.ValoresChave[3])+#13#10;

  lsSQL:=lsSQL+
    'UNION '+#13#10+
    'SELECT DISTINCT H.IDCONTRIBUICAO, H.IDPLANOPREV, '+#13#10+
    '	      DECODE(H.FLGDEVOLUCAO,1,''D'',''N'') AS FLGATRASODEVOL, '+#13#10+
    '	      DECODE(SUBSTR(H.MESREFERENCIA,6,2),''13'',''0000/13'',H.MESCOBRANCA) AS MESREFERENCIA '+#13#10+
    'FROM CONTPREV C, HSTCONTRIBPREV H, PLANPREVPATRO PLP '+#13#10+
    'WHERE (H.IDPESSJUR = '+ IntToStr(iIdPessjur)+') '+#13#10+
    'AND (H.MESCOBRANCA = '+quotedstr(sAnoMesCobrancaTela)+') '+#13#10+
    'AND (PLP.IDPESSJUR = H.IDPESSJUR) '+#13#10+
    'AND (PLP.IDPLANOPREV = H.IDPLANOPREV) '+#13#10+
    'AND ((C.FLGPAGADOR = ''C'') OR ((PLP.FLGRECECONTPATRO = 1) AND (C.FLGPAGADOR = ''P''))) '+#13#10+
    'AND (H.SITRECEBIMENTO IN (0,1)) '+#13#10+
    'AND (H.VALORRECEBIDO IS NULL) '+#13#10+
    'AND (C.IDPLANOPREV = H.IDPLANOPREV) '+#13#10+
    'AND (C.IDCONTRIBUICAO = H.IDCONTRIBUICAO) '+#13#10;

  //seleciona contribuições a serem recebidas para verificação de parâmetros
  //de integração
  if rgrpTipoFolha.ItemIndex = 0 then
    lsSQL:=lsSQL+
      'AND (H.FOLHAORIGEM = ''P'') '+#13#10
  else
    lsSQL:=lsSQL+
      'AND (H.FOLHAORIGEM = ''B'') '+#13#10;

  if Trim(dblkpcmbLote.Text) <> '' then
    lsSQL:=lsSQL+
      'AND H.IDLOTE = '+OraNumero(qryLote.FieldByName('IDLOTE').AsString)+#13#10;

  if Trim(edNome.Text) <> '' then
    lsSQL:=lsSQL+
      ' AND H.IDPESSJUR   = '+OraNumero(MontaSelectPart.ValoresChave[0])+#13#10+
      ' AND H.IDPLANOPREV = '+OraNumero(MontaSelectPart.ValoresChave[1])+#13#10+
      ' AND H.IDPESSOA    = '+OraNumero(MontaSelectPart.ValoresChave[2])+#13#10+
      ' AND H.SEQPROPOSTA = '+OraNumero(MontaSelectPart.ValoresChave[3])+#13#10;

  lsSQL:=lsSQL+
    'ORDER BY IDPLANOPREV, IDCONTRIBUICAO, FLGATRASODEVOL, MESREFERENCIA'+#13#10;

  qryRecebimento.Close;
  qryRecebimento.SQL.Clear;
  qryRecebimento.SQL.Add(lsSQL);
  qryRecebimento.Open;

  while not qryRecebimento.EOF do
  begin
    //busca informações de integração nos níveis de contribuição/plano e contribuição/plano/patro
    qryaux.close;
    qryaux.SQL.text :=
      'SELECT CPATR.IDCONTRIBUICAO, CPATR.IDPLANOPREV, '+#13#10+
      '       DECODE(CPATR.PLACONTAC,         NULL, CPREV.PLACONTAC,         CPATR.PLACONTAC)         PLACONTAC,'+#13#10+
      '       DECODE(CPATR.PLACONTAC13,       NULL, CPREV.PLACONTAC13,       CPATR.PLACONTAC13)       PLACONTAC13,'+#13#10+
      '       DECODE(CPATR.CODCENTROCUSTOC,   NULL, CPREV.CODCENTROCUSTOC,   CPATR.CODCENTROCUSTOC)   CODCENTROCUSTOC,'+#13#10+
      '       DECODE(CPATR.CODCENTROCUSTOC13, NULL, CPREV.CODCENTROCUSTOC13, CPATR.CODCENTROCUSTOC13) CODCENTROCUSTOC13,'+#13#10+
      '       DECODE(CPATR.PLACONTAD,         NULL, CPREV.PLACONTAD,         CPATR.PLACONTAD)         PLACONTAD,'+#13#10+
      '       DECODE(CPATR.PLACONTAOUTROMES,  NULL, CPREV.PLACONTAOUTROMES,  CPATR.PLACONTAOUTROMES)  PLACONTAOUTROMES,'+#13#10+
      '       DECODE(CPATR.PLACONTAD13,       NULL, CPREV.PLACONTAD13,       CPATR.PLACONTAD13)       PLACONTAD13,'+#13#10+
      '       DECODE(CPATR.CODCENTROCUSTOD,   NULL, CPREV.CODCENTROCUSTOD,   CPATR.CODCENTROCUSTOD)   CODCENTROCUSTOD,'+#13#10+
      '       DECODE(CPATR.CODCENTROCUSTOD13, NULL, CPREV.CODCENTROCUSTOD13, CPATR.CODCENTROCUSTOD13) CODCENTROCUSTOD13,'+#13#10+
      '       DECODE(CPATR.CODSUBCONTA,       NULL, CPREV.CODSUBCONTA,       CPATR.CODSUBCONTA)       CODSUBCONTA,'+#13#10+
      '       DECODE(CPATR.CODSUBCONTA13,     NULL, CPREV.CODSUBCONTA13,     CPATR.CODSUBCONTA13)     CODSUBCONTA13,'+#13#10+
      '       DECODE(CPATR.CODTIPRECDES,      NULL, CPREV.CODTIPRECDES,      CPATR.CODTIPRECDES)      CODTIPRECDES,'+#13#10+
      '       DECODE(CPATR.CODTIPRECDES13,    NULL, CPREV.CODTIPRECDES13,    CPATR.CODTIPRECDES13)    CODTIPRECDES13,'+#13#10+
      '       DECODE(CPATR.CODTIPDESEMBDEVOL, NULL, CPREV.CODTIPDESEMBDEVOL, CPATR.CODTIPDESEMBDEVOL) CODTIPDESEMBDEVOL,'+#13#10+
      '       DECODE(CPATR.CODTIPDESEMB13,    NULL, CPREV.CODTIPDESEMB13,    CPATR.CODTIPDESEMB13)    CODTIPDESEMB13,'+#13#10+
      '       DECODE(CPATR.CODTIPRECEBDEV,    NULL, CPREV.CODTIPRECEBDEV,    CPATR.CODTIPRECEBDEV)    CODTIPRECEBDEV,'+#13#10+
      '       DECODE(CPATR.CODTIPRECEBDEV13,  NULL, CPREV.CODTIPRECEBDEV13,  CPATR.CODTIPRECEBDEV13)  CODTIPRECEBDEV13,'+#13#10+
      '       DECODE(CPATR.CODCENTRORESPON,   NULL, CPREV.CODCENTRORESPON,   CPATR.CODCENTRORESPON)   CODCENTRORESPON,'+#13#10+
      '       DECODE(CPATR.CODCENTRORESPON13, NULL, CPREV.CODCENTRORESPON13, CPATR.CODCENTRORESPON13) CODCENTRORESPON13,'+#13#10+
      '       DECODE(CPATR.UNIDNEGOC,         NULL, CPREV.UNIDNEGOC,         CPATR.UNIDNEGOC)         UNIDNEGOC,'+#13#10+
      '       DECODE(CPATR.UNIDNEGOC13,       NULL, CPREV.UNIDNEGOC13,       CPATR.UNIDNEGOC13)       UNIDNEGOC13,'+#13#10+
      '       DECODE(CPATR.CODTIPDOC,         NULL, CPREV.CODTIPDOC,         CPATR.CODTIPDOC)         CODTIPDOC,'+#13#10+
      '       DECODE(CPATR.CODTIPDOC13,       NULL, CPREV.CODTIPDOC13,       CPATR.CODTIPDOC13)       CODTIPDOC13,'+#13#10+
      '       DECODE(CPATR.CODPORTFORMA,      NULL, CPREV.CODPORTFORMA,      CPATR.CODPORTFORMA)      CODPORTFORMA,'+#13#10+
      '       DECODE(CPATR.CODPORTFORMA13,    NULL, CPREV.CODPORTFORMA13,    CPATR.CODPORTFORMA13)    CODPORTFORMA13,'+#13#10+
      '       PL.NOME PLANO, C.NOMERESUM AS CONTRIBUICAO, '+#13#10+
      '       C.NOME AS NOMECONTRIB '+#13#10+
      'FROM CONTPLANPATRO CPATR, CONTPREV CPREV, PLANPREV PL, CONTRIBUICAO C'+#13#10+
      'WHERE (CPATR.IDPESSJUR(+) = '+ IntToStr(iIdPessjur)+')'+#13#10+
      'AND (CPATR.IDPLANOPREV(+) = CPREV.IDPLANOPREV)'+#13#10+
      'AND (CPATR.IDCONTRIBUICAO(+) = CPREV.IDCONTRIBUICAO)'+#13#10+
      'AND (CPREV.IDPLANOPREV = '+qryRecebimento.fieldbyname('IDPLANOPREV').AsString+')'+#13#10+
      'AND (CPREV.IDCONTRIBUICAO = '+qryRecebimento.fieldbyname('IDCONTRIBUICAO').AsString+')'+#13#10+
      'AND (PL.IDPLANOPREV = '+qryRecebimento.fieldbyname('IDPLANOPREV').AsString+')'+#13#10+
      'AND (C.IDCONTRIBUICAO = '+qryRecebimento.fieldbyname('IDCONTRIBUICAO').AsString+')'+#13#10;

    qryaux.open;

    //testa existência dos registros na tabela
    if qryaux.isempty then
    begin
      memResult.Lines.Add('[Não parametrizado] - Todas as informações');
      memResult.Lines.Add('  Plano:'+qryaux.fieldbyname('PLANO').AsString);
      memResult.Lines.Add(
        '  Contribuição (ID='+qryaux.fieldbyname('IDCONTRIBUICAO').AsString+') : '+
        qryaux.fieldbyname('CONTRIBUICAO').AsString+' - '+
        qryaux.fieldbyname('NOMECONTRIB').AsString);
      memResult.Lines.Add('');
      berro := True;
    end
    else
    begin
      //testa décimo terceiro
      if (pos(qryrecebimento.fieldbyname('MESREFERENCIA').AsString,'13') <= 0 ) then
      begin
         if (trim(qryaux.FieldByName('PLACONTAC').AsString) = '') then
         begin
           memResult.Lines.Add('[Não parametrizado] - Conta de Crédito');
           memResult.Lines.Add('  Plano:'+qryaux.fieldbyname('PLANO').AsString);
           memResult.Lines.Add(
             '  Contribuição (ID='+qryaux.fieldbyname('IDCONTRIBUICAO').AsString+') : '+
             qryaux.fieldbyname('CONTRIBUICAO').AsString+' - '+
             qryaux.fieldbyname('NOMECONTRIB').AsString);
           memResult.Lines.Add('');
           berro := True;
         end;
         if (trim(qryaux.FieldByName('PLACONTAD').AsString) = '') then
         begin
           memResult.Lines.Add('[Não parametrizado] - Conta de Débito');
           memResult.Lines.Add('  Plano:'+qryaux.fieldbyname('PLANO').AsString);
           memResult.Lines.Add(
             '  Contribuição (ID='+qryaux.fieldbyname('IDCONTRIBUICAO').AsString+') : '+
             qryaux.fieldbyname('CONTRIBUICAO').AsString+' - '+
             qryaux.fieldbyname('NOMECONTRIB').AsString);
           memResult.Lines.Add('');
           berro := True;
         end;

         if (trim(qryaux.FieldByName('CODPORTFORMA').AsString) = '') then
         begin
           memResult.Lines.Add('[Não parametrizado] - Contas/Caixas x Forma de Pagamento ');
           memResult.Lines.Add('  Plano:'+qryaux.fieldbyname('PLANO').AsString);
           memResult.Lines.Add(
             '  Contribuição (ID='+qryaux.fieldbyname('IDCONTRIBUICAO').AsString+') : '+
             qryaux.fieldbyname('CONTRIBUICAO').AsString+' - '+
             qryaux.fieldbyname('NOMECONTRIB').AsString);
           memResult.Lines.Add('');
           berro := True;
         end;
         if (qryrecebimento.fieldbyname('FLGATRASODEVOL').AsString = 'D') then
         begin
           if (trim(qryaux.FieldByName('CODTIPDESEMBDEVOL').AsString) = '') then
           begin
             memResult.Lines.Add('[Não parametrizado] - Tipo de Desembolso');
             memResult.Lines.Add('  Plano:'+qryaux.fieldbyname('PLANO').AsString);
             memResult.Lines.Add(
               '  Contribuição (ID='+qryaux.fieldbyname('IDCONTRIBUICAO').AsString+') : '+
               qryaux.fieldbyname('CONTRIBUICAO').AsString+' - '+
               qryaux.fieldbyname('NOMECONTRIB').AsString);
             memResult.Lines.Add('');
             berro := True;
           end;
           if (trim(qryaux.FieldByName('CODTIPRECEBDEV').AsString) = '') then
           begin
             memResult.Lines.Add('[Não parametrizado] - Tipo de Desembolso para devolução pelo CAR');
             memResult.Lines.Add('  Plano:'+qryaux.fieldbyname('PLANO').AsString);
             memResult.Lines.Add(
               '  Contribuição (ID='+qryaux.fieldbyname('IDCONTRIBUICAO').AsString+') : '+
               qryaux.fieldbyname('CONTRIBUICAO').AsString+' - '+
               qryaux.fieldbyname('NOMECONTRIB').AsString);
             memResult.Lines.Add('');
             berro := True;
           end;
         end
         else
         begin
           if (trim(qryaux.FieldByName('CODTIPRECDES').AsString) = '') then
           begin
             memResult.Lines.Add('[Não parametrizado] - Tipo de Recebimento');
             memResult.Lines.Add('  Plano:'+qryaux.fieldbyname('PLANO').AsString);
             memResult.Lines.Add(
               '  Contribuição (ID='+qryaux.fieldbyname('IDCONTRIBUICAO').AsString+') : '+
               qryaux.fieldbyname('CONTRIBUICAO').AsString+' - '+
               qryaux.fieldbyname('NOMECONTRIB').AsString);
             memResult.Lines.Add('');
             berro := True;
           end;
         end;
      end
      else //décimo terceiro
      begin
        if (trim(qryaux.FieldByName('PLACONTAC13').AsString) = '') then
        begin
          memResult.Lines.Add('[Não parametrizado] - Conta de Crédito de Décimo Terceiro');
          memResult.Lines.Add('  Plano:'+qryaux.fieldbyname('PLANO').AsString);
          memResult.Lines.Add(
            '  Contribuição (ID='+qryaux.fieldbyname('IDCONTRIBUICAO').AsString+') : '+
            qryaux.fieldbyname('CONTRIBUICAO').AsString+' - '+
            qryaux.fieldbyname('NOMECONTRIB').AsString);
          memResult.Lines.Add('');
          berro := True;
        end;
        if (trim(qryaux.FieldByName('PLACONTAD13').AsString) = '') then
        begin
          memResult.Lines.Add('[Não parametrizado] - Conta de Débito de Décimo Terceiro');
          memResult.Lines.Add('  Plano:'+qryaux.fieldbyname('PLANO').AsString);
          memResult.Lines.Add(
            '  Contribuição (ID='+qryaux.fieldbyname('IDCONTRIBUICAO').AsString+') : '+
            qryaux.fieldbyname('CONTRIBUICAO').AsString+' - '+
            qryaux.fieldbyname('NOMECONTRIB').AsString);
          memResult.Lines.Add('');
          berro := True;
        end;

        if (trim(qryaux.FieldByName('CODPORTFORMA13').AsString) = '') then
        begin
          memResult.Lines.Add('[Não parametrizado] - Contas/Caixas x Forma de Pagamento de Décimo Terceiro');
          memResult.Lines.Add('  Plano:'+qryaux.fieldbyname('PLANO').AsString);
          memResult.Lines.Add(
            '  Contribuição (ID='+qryaux.fieldbyname('IDCONTRIBUICAO').AsString+') : '+
            qryaux.fieldbyname('CONTRIBUICAO').AsString+' - '+
            qryaux.fieldbyname('NOMECONTRIB').AsString);
          memResult.Lines.Add('');
          berro := True;
        end;
        if (qryrecebimento.fieldbyname('FLGATRASODEVOL').AsString = 'D') then
        begin
          if (trim(qryaux.FieldByName('CODTIPDESEMB13').AsString) = '') then
          begin
            memResult.Lines.Add('[Não parametrizado] - Tipo de Desembolso de Décimo Terceiro');
            memResult.Lines.Add('  Plano:'+qryaux.fieldbyname('PLANO').AsString);
            memResult.Lines.Add(
              '  Contribuição (ID='+qryaux.fieldbyname('IDCONTRIBUICAO').AsString+') : '+
              qryaux.fieldbyname('CONTRIBUICAO').AsString+' - '+
              qryaux.fieldbyname('NOMECONTRIB').AsString);
            memResult.Lines.Add('');
            berro := True;
          end;
          if (trim(qryaux.FieldByName('CODTIPRECEBDEV13').AsString) = '') then
          begin
            memResult.Lines.Add('[Não parametrizado] - Tipo de Desembolso para devolução pelo CAR de Décimo Terceiro');
            memResult.Lines.Add('  Plano:'+qryaux.fieldbyname('PLANO').AsString);
            memResult.Lines.Add(
              '  Contribuição (ID='+qryaux.fieldbyname('IDCONTRIBUICAO').AsString+') : '+
              qryaux.fieldbyname('CONTRIBUICAO').AsString+' - '+
              qryaux.fieldbyname('NOMECONTRIB').AsString);
            memResult.Lines.Add('');
            berro := True;
          end;
        end
        else
        begin
          if (trim(qryaux.FieldByName('CODTIPRECDES13').AsString) = '') then
          begin
            memResult.Lines.Add('[Não parametrizado] - Tipo de Recebimento de Décimo Terceiro');
            memResult.Lines.Add('  Plano:'+qryaux.fieldbyname('PLANO').AsString);
            memResult.Lines.Add(
              '  Contribuição (ID='+qryaux.fieldbyname('IDCONTRIBUICAO').AsString+') : '+
              qryaux.fieldbyname('CONTRIBUICAO').AsString+' - '+
              qryaux.fieldbyname('NOMECONTRIB').AsString);
            memResult.Lines.Add('');
            berro := True;
          end;
        end;
      end;
    end;
    qryRecebimento.next;
  end;
  if not berro then
    memResult.Lines.Add('Parametrização básica OK.');
  memResult.Lines.Add('-------------------------------------------------');

  Result := not berro;
end;

procedure TfrmRecebeContribuicao.chkIntegraLocalClick(Sender: TObject);
begin
  inherited;
  bIntegraContab := not bIntegraContab;
  bIntegraCAR := not bIntegraCAR;

  if bIntegraContab
  then lblIntegraContab.Caption := 'Integrar com Contabilidade ? Sim '
  else lblIntegraContab.Caption := 'Integrar com Contabilidade ? Não ';

  if bIntegraCAR
  then lblIntegraCAR.Caption := 'Integrar com Contas a Receber ? Sim '
  else lblIntegraCAR.Caption := 'Integrar com Contas a Receber ? Não ';

  chkIntegra.Enabled :=  bIntegraContab and bIntegraCAR;
end;



function TfrmRecebeContribuicao.VerificaVencimento(
  piIdPessjur: Integer; sIDPlanos: string  ): Boolean;
Var
 sDtVcto, sTipoFolha    : string;//William Moreira da Silva - SOL 230424 PPM 353071
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT DISTINCT PLP.IDPESSJUR, PL.IDPLANOPREV ');
  qryAux.SQL.Add('FROM PLANPREV PL, PLANPREVPATRO PLP, TMPDESC T');
  qryAux.SQL.Add('WHERE PLP.IDPESSJUR   = '+IntToStr(piIdPessjur));
  qryAux.SQL.Add('  AND PLP.IDPLANOPREV = PL.IDPLANOPREV ');
  qryAux.SQL.Add('  AND T.IDPESSJUR     = PLP.IDPESSJUR ');

  //William Moreira da Silva - SOL 230424 PPM 353071
  if Trim(sIDPlanos) <> '' Then
  begin
       qryAux.SQL.Add(' AND PLP.IDPLANOPREV IN ('+sIDPlanos+')');
  end;
  //William Moreira da Silva - SOL 230424 PPM 353071

  qryAux.SQL.Add('  AND T.MESCOBRANCA   = '''+sAnoMesCobrancaTela+'''  ');
  qryAux.SQL.Add('  AND ((T.SITENVIO    = ''2'') OR (T.SITENVIO = ''1'' AND T.VALORRECEBIDO <> 0)) ');
  qryAux.SQL.Add('  AND T.VALORRECEBIDO <> 0  ');
  qryAux.SQL.Add('  AND T.FLGTIPODESC   = ''P''  ');

  if rgrpTipoFolha.ItemIndex = 0
   then  qryAux.SQL.Add('  AND T.FLGDESCFOLHA = ''P'' ')
   Else  qryAux.SQL.Add('  AND T.FLGDESCFOLHA = ''B'' ');

  qryAux.SQL.Add('  AND T.IDDESCONTO  IN (SELECT IDCONTRIBUICAO FROM CONTRIBUICAO) ');
  qryAux.SQL.Add('ORDER BY PLP.IDPESSJUR, PL.IDPLANOPREV');

  qryAux.Open;

  Result := True;

  //William Moreira da Silva - SOL 230424 PPM 353071
    if rgrpTipoFolha.ItemIndex = 0
   then  sTipoFolha := 'PT'
   Else  sTipoFolha := 'AS';
   //William Moreira da Silva - SOL 230424 PPM 353071

  if qryAux.IsEmpty then Exit;

  sDtVcto := CriticaDataCobrancaSit(dtmAPrev.qry,
                                    qryAux.FieldByName('IDPESSJUR').AsString,
                                    qryAux.FieldByName('IDPLANOPREV').AsString,
                                    //'PT',
                                    sTipoFolha,
                                    'N',
                                    Copy(sAnoMesCobrancaTela,6,2),
                                    Copy(sAnoMesCobrancaTela,1,4));
  while Not qryAux.EOF do
   begin
    if sDtVcto <> CriticaDataCobrancaSit(dtmAPrev.qry,
                                         qryAux.FieldByName('IDPESSJUR').AsString,
                                         qryAux.FieldByName('IDPLANOPREV').AsString,
                                         //'PT',
                                         sTipoFolha,
                                         'N',
                                         Copy(sAnoMesCobrancaTela,6,2),
                                         Copy(sAnoMesCobrancaTela,1,4))
     then begin
       Result := False;
       Break;
     end;
    qryAux.Next;
   end;
end;



procedure TfrmRecebeContribuicao.chklstPatroClickCheck(Sender: TObject);
var i : integer;
    sSQLWhere, strPatro: string;
begin
   inherited;
   qryPlano.Close;
   qryPlano.SQL.Clear;
   strPatro:= ' ';

   for i := 0 to chklstPatro.Items.Count - 1 do
      if chklstPatro.Checked[i]
      then begin
         if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive,loPartialKey])
         then begin
            strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
         end;
    end;

    if Trim(strPatro) <> ''
    then begin
       strPatro   := Copy(strPatro, 1, Length(strPatro) - 2);

       sSQLWhere  := ' WHERE PP.IDPLANOPREV = PPP.IDPLANOPREV   '+
                     ' AND   PPP.IDPESSJUR  IN ('+strPatro+')   ';


       qryPlano.SQL.Add(' SELECT DISTINCT PP.IDPLANOPREV, PP.NOME                   '+
                        ' FROM   PLANPREV PP, PLANPREVPATRO PPP ');
       qryPlano.SQL.Add(sSQLWhere);
       qryPlano.SQL.Add(' ORDER  BY PP.NOME ');
    end
    else
       qryPlano.SQL.Add(' SELECT IDPLANOPREV,  NOME '+
                        ' FROM   PLANPREV   '+
                        ' ORDER  BY NOME ');

   qryPlano.Open;
   CriaLista(chklstPlano,qryPlano);
end;



procedure TfrmRecebeContribuicao.chkDocDiaClick(Sender: TObject);
begin
  inherited;
  if chkDocDia.Checked then chkIntegra.Checked := True;
end;



procedure TfrmRecebeContribuicao.chkIntegraClick(Sender: TObject);
begin
  inherited;
  if not(chkIntegra.Checked) then chkDocDia.Checked := False;
end;



procedure TfrmRecebeContribuicao.IntegraPGA(iCodDocumento:Integer;var iDocPagar:integer; var iDocReceber:integer);
var
  qryAux             : TwwQuery;
  qryParamPGA        : TwwQuery;
  iIDCONTRIBUICAOPGA : integer;
  sSQL               : String;
  iValorFinalLancto  : Currency;
  dDataLancto        : TDate;

   iPlnCodigoPagar, iPlnCodigoReceber: integer;
  sMsg: String;
  iPrograma:integer;

begin

  try

    qryAux := TwwQuery.Create(Application);
    qryAux.DatabaseName := 'BASEDADOS';
    qryParamPGA := TwwQuery.Create(Application);
    qryParamPGA.DatabaseName := 'BASEDADOS';

    // Define Data de Laçamento
    if dtRecebimento.Date < date then
      dDataLancto := dtRecebimento.date
    else
      dDataLancto := date;

    // Aplica percentual por Plano
    if (qryTotalPatro.FieldByName('IdPlanoPrev').AsInteger = 74) then
      iValorFinalLancto := (qryTotalPatro.FieldByName('VALOR').AsFloat * 7) / 100
    else if (qryTotalPatro.FieldByName('IdPlanoPrev').AsInteger = 2) then
      iValorFinalLancto := (qryTotalPatro.FieldByName('VALOR').AsFloat * 14.78) / 100
    else if (qryTotalPatro.FieldByName('IdPlanoPrev').AsInteger = 66) then
      iValorFinalLancto := (qryTotalPatro.FieldByName('VALOR').AsFloat * 8) / 100;

    // Carrega Parametros Contabil para o PGA
    sSQL := 'SELECT ' + QuotedStr(DateToStr(dDataLancto)) + 'AS DATALANCTO, '+
            ' 0 AS NUMDOC, ' +
            ' 0 AS STATUSDOCUMENTO, '+
            ' 2 AS OPERACAO, '+
            ' CTP.IDEMPRESA, '+
            ' CTP.PLANO, '+
            ' DECODE(CTP.UNIDNEGOC, '''', -1) AS UNIDADENEGOC, '+
            ' CTP.CODSUBCONTA, '+
            ' CTP.IDPLANOPREV,'+
            ' CTP.IDPESSJUR AS IDPATRO,'+
            ' ''TRANSFERÊNCIA PGA'' as LACHIST1 , '+
            ' '' LACHIST2, '+
            ' '' AS LACHIST3, '+
            ' '' AS LACHIST4, '+
            ' '' AS LACHIST5, '+
            ' CTP.CODCENTROCUSTOC, '+
            ' CTP.PLACONTAC, '+
            ' CTP.CODCENTROCUSTOD, '+
            ' CTP.PLACONTAD, '+
            ' CTP.IDCONTRIBUICAO, '+
            ' CTP.CODTIPRECDES, '+
            ' CTP.CODCENTRORESPON, '+
            ' CTP.CODPORTFORMA, '+
            ' PGA.IDPLANOPREV PGAPLANOPREV, '+
            ' PGA.IDPESSJUR AS IDPGAPATRO, '+
            ' PGA.CODCENTROCUSTOC AS PGACODCENTROCUSTOC, '+
            ' PGA.PLACONTAC AS PGAPLANOCONTAC, '+
            ' PGA.CODCENTROCUSTOD AS PGACODCENTROCUSTOD, '+
            ' PGA.PLACONTAD AS PGAPLACONTAD, '+
            ' PGA.IDCONTRIBUICAO AS PGAIDCONTRIBUICAO, '+
            ' PGA.CODCENTRORESPON AS PGACODCENTRORESPON, '+
            ' PGA.CODTIPRECDES PGACODTIPRECDES, '+
            ' PGA.CODPORTFORMA PGACODPORTFORMA, '+
            ' P.TPDOCRRECPATRO PGATPDOCRRECPATRO, '+
            ' '' AS COMPLEMENTO, '+
            ' '' OBSERVACAO '+
        ' FROM CONTPLANPATRO CTP, CONTPLANPATRO PGA, CONTRIBUICAO CON, PARAMAPREV P  '+
        ' WHERE CTP.IDCONTRIBUICAO = ' + IntToStr(qryTotalPatro.FieldByName('IDDESCONTO').AsInteger) +
        ' AND CTP.IDPLANOPREV = ' + IntToStr(qryTotalPatro.FieldByName('IDPLANOPREV').AsInteger) +
        ' AND CTP.IDPESSJUR = ' + IntToStr(qryTotalPatro.FieldByName('IDPESSJUR').AsInteger) +
        ' AND CON.IDCONTRIBUICAOPGA = PGA.IDCONTRIBUICAO '+
        ' AND CON.IDCONTRIBUICAO = CTP.IDCONTRIBUICAO ';

    with qryParamPGA do
    begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      open;
    end;

    iDocPagar := 0;
    iDocReceber := 0;
    iPlnCodigoPagar := 0;
    iPlnCodigoReceber := 0;



    // ---------------------< Realiza os Lançamentos C O N T Á B E I S >---------------------------//

    // ====> P A G A R - Plano Previdenciario
    CtrlLancamento.InsereLancaContab('2', // cTipoLanc
                                     Sistema.IdEmpresa, // IdEmpresa
                                     Sistema.IdModulo, // iModuloOrigem
                                     Sistema.IdUsuario, // liUsuario
                                     IntegraBack.Plano, // liCodPlano
                                     -1, // liUnidNegoc
                                     -1, // liSubContaDeb
                                     -1, // liSubContaCre
                                     qryParamPGA.FieldByName('IDPLANOPREV').AsInteger, // iPlanoPrev
                                     qryParamPGA.FieldByName('IDPATRO').AsInteger, // iPatro
                                     iPlnCodigoPagar, // liPlnCodigo
                                     0, // iNumLan
                                     qryParamPGA.FieldByName('DATALANCTO').AsString, // sDataLanc
                                     qryParamPGA.FieldByName('NUMDOC').AsString, // sNumDoc
                                     qryParamPGA.FieldByName('LACHIST1').AsString, // sHist1
                                     qryParamPGA.FieldByName('LACHIST2').AsString, // sHist2
                                     qryParamPGA.FieldByName('LACHIST3').AsString, // sHist3
                                     qryParamPGA.FieldByName('LACHIST4').AsString, // sHist4
                                     qryParamPGA.FieldByName('LACHIST5').AsString, // sHist5
                                     prmTpOperCobranca, // sTipoOper
                                     qryParamPGA.FieldByName('CODCENTROCUSTOD').AsString, // sCCustoD
                                     qryParamPGA.FieldByName('PLACONTAD').AsString, // sContaD
                                     qryParamPGA.FieldByName('CODCENTROCUSTOC').AsString, // sCCustoC
                                     qryParamPGA.FieldByName('PLACONTAC').AsString, // sContaC
                                     '', // sCodHist
                                     iValorFinalLancto, // rValLanc
                                     False, // bJunta
                                     Sistema.UsaPlanoPatro, // bUsaPlanoPatro
                                     -1, // iIdSegregaCriter
                                     -1 // dDataSegregaCriter
                                     );


    If CtrlLancamento.MessageInfo <> '' Then
      sMsg := sMsg + chr(13) + CtrlLancamento.MessageInfo;

    iPlnCodigoPagar := Trunc(CtrlLancamento.RetornoPlnCodigo);

    // R E C E B E R - PGA
    CtrlLancamento.InsereLancaContab('2', // cTipoLanc
                                     Sistema.IdEmpresa, // IdEmpresa
                                     Sistema.IdModulo, // iModuloOrigem
                                     Sistema.IdUsuario, // liUsuario
                                     IntegraBack.Plano, // liCodPlano
                                     -1, // liUnidNegoc
                                     -1, // liSubContaDeb
                                     -1, // liSubContaCre
                                     qryParamPGA.FieldByName('PgaPlanoContab').AsInteger, // iPlanoPrev
                                     qryParamPGA.FieldByName('IDPGAPATRO').AsInteger, // iPatro
                                     iPlnCodigoReceber, // liPlnCodigo
                                     0, // iNumLan
                                     qryParamPGA.FieldByName('DATALANCTO').AsString, // sDataLanc
                                     qryParamPGA.FieldByName('NUMDOC').AsString, // sNumDoc
                                     qryParamPGA.FieldByName('LACHIST1').AsString, // sHist1
                                     qryParamPGA.FieldByName('LACHIST2').AsString, // sHist2
                                     qryParamPGA.FieldByName('LACHIST3').AsString, // sHist3
                                     qryParamPGA.FieldByName('LACHIST4').AsString, // sHist4
                                     qryParamPGA.FieldByName('LACHIST5').AsString, // sHist5
                                     prmTpOperCobranca, // sTipoOper
                                     qryParamPGA.FieldByName('PGACODCENTROCUSTOD').AsString, // sCCustoD   PGA
                                     qryParamPGA.FieldByName('PGAPLACONTAD').AsString, // sContaD          PGa
                                     qryParamPGA.FieldByName('PGACODCENTROCUSTOC').AsString, // sCCustoC   PGA
                                     qryParamPGA.FieldByName('PGAPLACONTAC').AsString, // sContaC          PGA
                                     '', // sCodHist
                                     iValorFinalLancto, // rValLanc
                                     False, // bJunta
                                     Sistema.UsaPlanoPatro, // bUsaPlanoPatro
                                     -1, // iIdSegregaCriter
                                     -1 // dDataSegregaCriter
                                     );

    If CtrlLancamento.MessageInfo <> '' Then
      sMsg := sMsg + chr(13) + CtrlLancamento.MessageInfo;

    iPlnCodigoReceber := Trunc(CtrlLancamento.RetornoPlnCodigo);

    // ------------------------------------------------------------------------------------------//
               //Gerando Documento a Pagar no Financeiro para o Plano Previdenciario

               iDocPagar := CtrlDocumento.GetSequenceDocumento;
               //sNoDocPagar := IntToStr(iDocPagar);

               CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
               CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;
               CtrlDocumento.IdUsuario := Sistema.IdUsuario;
               CtrlDocumento.SetValues(iDocPagar, // CodDocumento
                  iDocPagar, // NoDocumento
                  '', // ComplDocumento
                  '0', // sStatus
                  'P', // RecPag
                  '2', // sOperacao
                  '', // sNumslip
                  '', // sNumleitcodbarras
                  qryParamPGA.FieldByName('PLACONTAD').AsString, // PlaConta -
                  qryParamPGA.FieldByName('CODCENTROCUSTOD').AsString, // CodCentroCusto
                  '', // NossoNumero
                  '', // NumDigCodBarras
                  '', // GrupoDoc
                  '', // sFlgemitelancbaix
                  '', // sFlgconfirmarecpag
                  '0', // EmisBloq
                  '', // Referencia
                  qryParamPGA.FieldByName('LACHIST1').AsString // Obs
                  qryParamPGA.FieldByName('DataLancto').AsDateTime, // DataVencto
                  Date, // DataEmissao
                  qryParamPGA.FieldByName('DataLancto').AsDateTime, // DataProgramada
                  0, // DataRemessa
                  0, // DataLimite
                  0, // DataCorrecao
                  0, // rVlrMulta
                  0, // rValorJuros
                  0, // rValorDesconto
                  0, // rPercJurosSimples
                  0, // rPercJurosAtuarial
                  qryParamPGA.FieldByName('TPDOCRRECPATRO').AsInteger, // CodTipDoc
                  Sistema.IdEmpresa, // IdPessoa
                  Sistema.IdModulo, // IdModulo
                  qryParamPGA.FieldByName('IDPATRO').AsInteger,
                  -1, // NumFatura
                  -1, // IdCBancaria
                  prmUnidNegoc // UnidNegoc
                  IntegraBack.Plano, // Plano
                  -1, // NumCPBaixa
                  -1, // NumAPGr
                  -1, // Moecodigo
                  -1, // LoteTransmissao
                  -1, // IndiceCorrecao
                  Sistema.IdUsuario, // IdUsuarioInclusao
                  Sistema.IdEmpresa, // IdEmpresa
                  0, // Flgnaoconciliado
                  -1, // Controleremess,
                  -1, // Codsubconta
                  qryParamPGA.FieldByName('Codportforma').AsInteger, // Codportforma
                  -1, // Codgrupocnab
                  -1, // CodGeradorINSS
                  qryParamPGA.FieldByName('codforma').AsInteger, // Codforma
                  -1 // iIdSegregaCriter
                  , ''
                  , iCodDocumento
                  );

               //Gerando o Raterio a Pagar no Plano Previdenciario
               iPrograma := -1;
               QryAux.Close;
               QryAux.SQL.Clear;
               QryAux.SQL.Add('Select idprograma from CentCust where codCentroCusto = ' + qryParamPGA.FieldByName('CODCENTROCUSTOD').AsString);
               Try
                  QryAux.Open;
                  If Not (QryAux.IsEmpty) Then
                     iPrograma := QryAux.FieldByName('idprograma').AsInteger;
               Except
                  showmessage('Erro ao buscar o IdPrograma no Plano Previdenciario' + QryAux.SQL.Gettext);
               End;

               If Not (QryAux.IsEmpty) Then
                  iPrograma := QryAux.FieldByName('idprograma').AsInteger;

               CtrlDocumento.RateioDocum.SetValues(iValorFinalLancto, // Valor
                  0, // ValorOM
                  0, // Vlrresorcamen
                  0, // Idrateiodocum
                  Sistema.IdEmpresa, // Idpessoa
                  iDocPagar, // Coddocumento
                  prmUnidNegoc, // Unidnegoc
                  0, // Moecodigo,
                  Sistema.IdUsuario, // Idusuarioinclusao
                  0, // Idreservaorcamen
                  IntegraBack.Plano, // Plano
                  qryParamPGA.FieldByName('IDPLANOPREV').AsInteger, // Idplanoprev
                  qryParamPGA.FieldByName('IDPATRO').AsInteger, // Idpatro
                  iPrograma, // Idprograma
                  -1, // Idprocesso
                  Sistema.IdEmpresa, // IdEmpresa
                  qryParamPGA.FieldByName('CodTipRecDes').AsString, // Codtiprecdes
                  'P', // Recpag
                  qryParamPGA.FieldByName('Codcentrorespon').AsString, // Codcentrorespon
                  qryParamPGA.FieldByName('CodCentroCustoD').AsString, // Codcentrocusto
                  '' // Numimovel
                  );

               //Gerando o Lancamento a Pagar no Plano Previdenciario

               CtrlDocumento.LanctoDocum.SetValues(//dtRecebimento,          // DataLancto
                  qryParamPGA.FieldByName('DataLancto').AsDateTime, //leocm - 21022006
                  iDocPagar, // CodDocumento
                  0, // Numlancto
                  iValorFinalLancto, // Vlrliquido
                  0, // ValorOM
                  iValorFinalLancto, // Valor
                  prmUnidNegoc, // Unidnegoc
                  iPlnCodigoPagar, // liPlncodigo
                  -1, // Numlotemanual
                  Sistema.IdUsuario, // Idusuarioinclusao
                  Sistema.IdEmpresa, // Idpessoa
                  -1, // Idnflivro,
                  -1, // Estorno
                  -1, // Codtipdoc
                  -1, // Coddocinss
                  -1, // Codalterador
                  '2', // Operacao
                  '', // NumRecibo
                  '', // Numnf
                  '', // Numfatura
                  '', // Historicocompl
                  '', // Flgtipofatura
                  'N', // Flgrecebeunf
                  '', // Flgfatemitida
                  'D', // Debcre
                  Sistema.IdModulo, // IdModulo
                  IntegraBack.Plano, // PlanoConta
                  True, // UsaPlanoPatro
                  False, // Contabiliza
                  -1, // iCodPortForma
                  0, // DiasFloat
                  '', // ContaBaixa
                  0 // SubContaBaixa
                  );
               If Not CtrlDocumento.Insert Then
                  Begin

                     sMsg := sMsg + chr(13) + CtrlDocumento.MessageInfo;
                     //               abort;
                  End;
               //      iNumLancto := CtrlDocumento.Lanctodocum.NumLancto;



                      //Gerando Documento a Pagar no Financeiro para PGA

               iDocReceber := CtrlDocumento.GetSequenceDocumento;
//               sNoDocReceber := IntToStr(iDocReceber);

               CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
               CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;
               CtrlDocumento.IdUsuario := Sistema.IdUsuario;
               CtrlDocumento.SetValues(iDocReceber, // CodDocumento
                  iDocReceber, // NoDocumento
                  '', // ComplDocumento
                  '0', // sStatus
                  'R', // RecPag
                  '2', // sOperacao
                  '', // sNumslip
                  '', // sNumleitcodbarras
                  qryParamPGA.FieldByName('PGAPLACONTAC').AsString, // PlaConta -    PGA
                  qryParamPGA.FieldByName('PGACODCENTROCUSTOC').AsString, // CodCentroCusto PGA
                  '', // NossoNumero
                  '', // NumDigCodBarras
                  '', // GrupoDoc
                  '', // sFlgemitelancbaix
                  '', // sFlgconfirmarecpag
                  '', // EmisBloq
                  '', // Referencia
                  qryParamPGA.FieldByName('AsStringLACHIST1').AsString, // Obs
                  qryParamPGA.FieldByName('DataLancto').AsDateTime, // DataVencto
                  Date, // DataEmissao
                  qryParamPGA.FieldByName('DataLancto').AsDateTime, // DataProgramada
                  0, // DataRemessa
                  0, // DataLimite
                  0, // DataCorrecao
                  0, // rVlrMulta
                  0, // rValorJuros
                  0, // rValorDesconto
                  0, // rPercJurosSimples
                  0, // rPercJurosAtuarial
                  qryParamPGA.FieldByName('PGATPDOCRRECPATRO').AsInteger, // CodTipDoc
                  Sistema.IdEmpresa, // IdPessoa
                  Sistema.IdModulo, // IdModulo
                  qryParamPGA.FieldByName('PGAIDPATRO').Asinteger,
                  -1, // NumFatura
                  -1, // IdCBancaria
                  prmUnidNegoc // UnidNegoc
                  IntegraBack.Plano, // Plano
                  -1, // NumCPBaixa
                  -1, // NumAPGr
                  -1, // Moecodigo
                  -1, // LoteTransmissao
                  -1, // IndiceCorrecao
                  Sistema.IdUsuario, // IdUsuarioInclusao
                  Sistema.IdEmpresa, // IdEmpresa
                  1, // Flgnaoconciliado
                  -1, // Controleremess,
                  -1, // Codsubconta
                  qryParamPGA.FieldByName('PGACodportforma').AsInteger, // Codportforma
                  -1, // Codgrupocnab
                  -1, // CodGeradorINSS
                  qryParamPGA.FieldByName('PGAcodforma').AsInteger, // Codforma
                  -1 // iIdSegregaCriter
                  , ''
                  ,iCodDocumento
                  );

               //Gerando o Raterio a Pagar no PGA

               iPrograma := -1;
               QryAux.Close;
               QryAux.SQL.Clear;
               QryAux.SQL.Add('Select idprograma from CentCust where codCentroCusto = ' + qryParamPGA.FieldByName('PGACODCENTROCUSTOC').AsString);
               Try
                  QryAux.Open;
                  If Not (QryAux.IsEmpty) Then
                     iPrograma := QryAux.FieldByName('idprograma').AsInteger;
               Except
                  showmessage('Deu erro 2' + QryAux.SQL.Gettext);
               End;



               CtrlDocumento.RateioDocum.SetValues(iValorFinalLancto, // Valor
                  0, // ValorOM
                  0, // Vlrresorcamen
                  0, // Idrateiodocum
                  Sistema.IdEmpresa, // Idpessoa
                  iDocReceber, // Coddocumento
                  prmUnidNegoc, // Unidnegoc
                  0, // Moecodigo,
                  Sistema.IdUsuario, // Idusuarioinclusao
                  0, // Idreservaorcamen
                  IntegraBack.Plano, // Plano
                  qryParamPGA.FieldByName('PGAPLANOPREV').AsInteger, // Idplanoprev   PGA
                  qryParamPGA.FieldByName('PGAIDPATRO').AsInteger, // Idpatro            PGA
                  iPrograma, // Idprograma
                  -1, // Idprocesso
                  Sistema.IdEmpresa, // IdEmpresa
                  qryParamPGA.FieldByName('PGACodTipRecDes').AsString, // Codtiprecdes
                  'R', // Recpag
                  qryParamPGA.FieldByName('PGACodcentrorespon').AsString, // Codcentrorespon  PGA
                  qryParamPGA.FieldByName('PGACodCentroCustoC').AsString, // Codcentrocusto    PGA
                  '' // Numimovel
                  );

               //Gerando o Lancamento a Pagar no PGA

               CtrlDocumento.LanctoDocum.SetValues(//dtRecebimento,          // DataLancto
                  qryParamPGA.FieldByName('DataLancto').AsDateTime, //leocm - 21022006
                  iDocReceber, // CodDocumento
                  0, // Numlancto
                  iValorFinalLancto, // Vlrliquido
                  0, // ValorOM
                  iValorFinalLancto, // Valor
                  prmUnidNegoc, // Unidnegoc
                  iPlnCodigoReceber, // liPlncodigo
                  -1, // Numlotemanual
                  Sistema.IdUsuario, // Idusuarioinclusao
                  Sistema.IdEmpresa, // Idpessoa
                  -1, // Idnflivro,
                  -1, // Estorno
                  -1, // Codtipdoc
                  -1, // Coddocinss
                  -1, // Codalterador
                  '2', // Operacao
                  '', // NumRecibo
                  '', // Numnf
                  '', // Numfatura
                  '', // Historicocompl
                  '', // Flgtipofatura
                  'N', // Flgrecebeunf
                  '', // Flgfatemitida
                  'C', // Debcre
                  Sistema.IdModulo, // IdModulo
                  IntegraBack.Plano, // PlanoConta
                  True, // UsaPlanoPatro
                  False, // Contabiliza
                  190, // iCodPortForma
                  0, // DiasFloat
                  '', // ContaBaixa
                  0 // SubContaBaixa
                  );
               If Not CtrlDocumento.Insert Then
                  Begin
                     sMsg := sMsg + chr(13) + CtrlDocumento.MessageInfo;
                  End;




    // ---------------------< Realiza os Lançamentos F I N A N C E I R O S >----------------------//

        //Gerando Documento a Pagar no Financeiro para o Plano Previdenciario




  finally
    FreeAndNil(qryAux);
    FreeAndNil(qryParamPGA);
  end;

end;

function TfrmRecebeContribuicao.BuscaCentroCusto(idPessoaJur, idPlanoPrev,
  idDesconto: integer): string;
begin
  with qryAux do
  begin
    SQL.Clear;
    SQL.Add(' SELECT DECODE(CPATR.CODCENTROCUSTOC,                     '+
            '            NULL,                                        '+
            '            CPREV.CODCENTROCUSTOC,                       '+
            '            CPATR.CODCENTROCUSTOC) CODCENTROCUSTOC       '+
            '   FROM CONTPLANPATRO CPATR, CONTPREV CPREV              '+
            '  WHERE (CPATR.IDPESSJUR(+)      = '+inttostr(qryTotalPatro.FieldByName('IDPESSJUR').AsInteger)+')'+
            '    AND (CPATR.IDPLANOPREV(+)    = CPREV.IDPLANOPREV)       '+
            '    AND (CPATR.IDCONTRIBUICAO(+) = CPREV.IDCONTRIBUICAO) '+
            '    AND (CPREV.IDPLANOPREV       = '+inttostr(qryTotalPatro.FieldByName('IDPLANOPREV').AsInteger)+')'+
            '    AND (CPREV.IDCONTRIBUICAO    = '+inttostr(qryTotalPatro.FieldByName('IDDESCONTO').AsInteger)+')');
    Open;
  end;

  if  qryAux.recordcount > 0 then
    strCentroCusto := trim(qryAux.fieldbyname('CODCENTROCUSTOC').asstring)
  else
    strCentroCusto := '';

  result := strCentroCusto;
end;

//Inicio - Andre Olivera SOL: 164351 Kintana: 1506587
procedure TfrmRecebeContribuicao.PedeDataVencimento(sCaptionForm,
  sTituloInf1: string; var iValor: Integer; var sData: string);
begin
  If frmPedeDataVencimento = Nil Then
     Application.CreateForm(TfrmPedeDataVencimento, frmPedeDataVencimento);

   with frmPedeDataVencimento do
   begin
      Caption := sCaptionForm;
      lblTitulo1.Caption := sTituloInf1;
      dtData.Visible := True;
      bbtnSair.Visible := False;
      bbtnAjuda.Visible := False;
      iOkCancel := 0;
      ShowModal;
       sData := dtData.Text;
       iValor := iOkCancel;
       dtData.Text := '';
   end;
end;

function TfrmRecebeContribuicao.ValidarDataVencimento: string;
var  sDataVencimento : string;
     bDisponibilidadeFinanceira, bBloqueioContabel : Boolean;
     iOkCancel : Integer;
begin
  inherited;
      sDataVencimento := '';
      repeat

        PedeDataVencimento('Inserir a Data de Vencimento',
        'Data de Vencimento',
         iOkCancel, sDataVencimento );
        if(iOkCancel <> 0)then
        begin
           if (sDataVencimento <>'')then
            begin
               bDisponibilidadeFinanceira := CtrlDisponFinanc.TestaDispFinanc(Sistema.IdEmpresa, Sistema.IdUsuario, StrToDate(sDataVencimento));
               if not (bDisponibilidadeFinanceira)then
               begin
                   MsgDlg('A Data de Vencimento não pode ser menor do que a Data da Disponibilidade.','Atenção',mtInformation,[mbOK],0);
                   sDataVencimento := '';
               end;
               if (sDataVencimento <>'') then
               begin
                   bBloqueioContabel  := CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa, Sistema.IdModulo, sDataVencimento);
                   if  not(bBloqueioContabel)then
                   begin
                       MsgDlg('A Data de Vencimento não pode ser menor do que a Data de Bloqueio.','Atenção',mtInformation,[mbOK],0);
                       sDataVencimento := '';
                   end;
               end;
            end
           else
              MsgDlg('A Data de Vencimento é obrigatório.','Atenção',mtInformation,[mbOK],0);
              
        end;
        until ((sDataVencimento <> '')and(iOkCancel <> 0)) or (iOkCancel <> 1);
      if(iOkCancel = 0)then
          Result :=  'CANCEL'
      else
          Result := sDataVencimento;
end;
//Fim - Andre Olivera SOL: 164351 Kintana: 1506587
end.
