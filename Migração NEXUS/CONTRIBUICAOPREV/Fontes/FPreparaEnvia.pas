unit FPreparaEnvia;

// Alterações:
{*************************************************************************************
Pendência   : SIG62812
Responsável : Andre Imakawa
Data        : 15/03/2018
Descrição   : Tratamento para gerar o valor da contribuição no abono correto, para
              o IdPlanoPrev 66 e Idpessjur = 1.
**************************************************************************************
Pendência   : SIG 54406
Responsável : Taffarel
Data        : 11/09/2017
Descrição   : Preenchimento do IDTITULAR na tabela HSTCONTRIBPREV para as contribuicoes
              18 e 19.
**************************************************************************************
Nº SOL............: 228895
Nº PPM............: 1180796
Data da Alteração.: 09/12/2015
Responsável.......: Peterson Victor
Descrição.........: Alteração da validação para envio
**************************************************************************************
Nº SOL............: 262798
Nº PPM............: 1097367
Data da Alteração.: 02/10/2015
Alteração Form....: remoção do campo duplicado na inserção na HSTCONTRIBPREV
Responsável.......: William Santana
Descrição.........: remoção do campo duplicado na inserção na HSTCONTRIBPREV
**************************************************************************************
-------------------------------------------------------------------------------
Pendência   : SOL 253577/17460 PPM 955546
Responsável : Helio Lima Custodio
Data        : 22/07/2015
Descrição   : Ajustar contribuições para que na integração seja utilizado o plano contábil.
--------------------------------------------------------------------------------
Pendência   : SOL 242363 PPM 571945
Responsável : Fernando Xavier
Data        : 06/11/2014
Descrição   : Ao efetuarmos o preparo relativo ao mês 11/2014, deparamos com os
              seguintes probelmas: Para o idplanoprev=66 - REB/FUNCEF, metade das
              matrículas rodou somente as contribuições normais e outra metade
              rodou somente o 13º.Ex: 0402,0475, 1001, 0483,0599 Para o
              idplanoprev=2, rodou somente a rubrica de 13º.
--------------------------------------------------------------------------------
Pendência   : SOL 238582 PPM 504830
Responsável : Thiago Melo
Data        : 03/09/2014
Descrição   : Ocorre erro ao fazer o preparo das contribuições no mes de setembro
--------------------------------------------------------------------------------
Pendência   : SOL 189702 KINTANA 1816210
Responsável : TADEU PASSOS / William Santana
Data        : 14/08/2013
Descrição   : Salário usado no calculo da contribuição deve ser gravado no
              histórico no campo SALCONTRIB da tabela HSTCONTRIBPREV
--------------------------------------------------------------------------------
Pendência   : SOL 228328 KINTANA  2062202
Responsável : Fernando Xavier
Data        : 18/04/2014
Descrição   : O erro ocorre no momento de enviar as contribuições do autopatrocinio.
--------------------------------------------------------------------------------
Pendência   : SOL 222014 KTN 2055090
Responsável : Felipe A. Santos
Data        : 29/01/2014
Descrição   : passagem do campo IDTITULAR para sql de entrada que recupera o
              valor dos campos valoresperado e valorcalculado da HSTCONTRIBPREV
--------------------------------------------------------------------------------
Pendência   : SOL 207368 KINTANA 2021675
Responsável : Fernando Xavier
Data        : 16/07/2013
Descrição   : envio individual de contribuições
--------------------------------------------------------------------------------
Pendência   : SOL 123366/9801 KINTANA 1671674
Responsável : BRUNO AZEVEDO
Data        : 08/08/2012
Descrição   : Ajustes no PGA para recebimento dos documentos FILHO.
--------------------------------------------------------------------------------
Pendência   : SOL 184271 KINTANA 1720937
Responsável : BRUNO AZEVEDO
Data        : 04/07/2012
Descrição   : Ajuste na gravação do histórico de contribuições.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 148139 KINTANA 1040427
Responsável : Fernando Xavier
Data        : 11/08/2011
Descrição   : envio individual de contribuições
---------------------------------------------------------------------------------------------------
Pendência   : SOL 180156 Kintana 1668852
Responsável : Fernando Xavier
Data        : 24/05/2012
Descrição   : Inconsistência na gravação da data de envio de contribuições.
--------------------------------------------------------------------------------
Pendência   : SOL 166858 Kintana 1461555
Responsável : Otacilio Aquino
Data        : 10/02/2012
Descrição   : PERMITIR A MARCAÇÃO DE MAIS DE UM FLAG NA TELA
              CONTRIBUIÇÕES/ENVIO DE CONTRIBUIÇÕES/COBRANÇAS A ENVIAR
--------------------------------------------------------------------------------
Pendência   : SOL 171339 Kintana 1534555
Responsável : Fernando Xavier
Data        : 06/01/2012
Descrição   : Ao rodar o preparo não são geradas as contribuições
--------------------------------------------------------------------------------
Pendência   : SOL 130118 Kintana 817114
Responsável : Fernando Xavier
Data        : 16/12/2011
Descrição   : rotina de cobrança da contribuição para o custeio administrativo para 
              Participantes Licenciados e BPD  
--------------------------------------------------------------------------------
Pendência   : SOL 157382 Kintana 1257021
Responsável : Fanuel Junior
Data        : 06/05/2011
Descrição   : Inserção de campos na query de entrada da regra 643
--------------------------------------------------------------------------------
//Pendência   : SOL 153051 Kintana 1165364
//Responsável : Renato Visoni
//Descrição   : Inserir dados da conta bancaria no historico de Contribuição.
--------------------------------------------------------------------------------
Pendência   : SOL 132501 KINTANA 775244
Responsável : BRUNO AZEVEDO
Data        : 05/04/2010
Descrição   : Na inclusão de documentos verificar a parametrização por pagador.
-------------------------------------------------------------------------------
// Autor(a)       : Fernando Xavier
// Data           : 03/11/2010
// Pendência      : SOL 146616  KINTANA 1003916
// Descricao      : Erro no preparo dos mantidos
--------------------------------------------------------------------------------
// Autor(a)       : Ádler Souza
// Data           : 02/12/2009
// Pendência      : SOL 128014  KINTANA 682913
// Descricao      : Implementação de Variavel para verificar se a função esta
//                  vindo por outra tela.
--------------------------------------------------------------------------------
// Autor(a)       :  Henrique Massão
// Data           :  20/04/2009
// Pendência      :  SOL 55651 KINTANA 519981
// Descricao      :  Foi incluido a opção de "SIM para TODOS", para que nao seja
//                   clicado a todo momento individualmente.
//------------------------------------------------------------------------------
// Autor(a)       :  Jéssica Lana Nunes dos Santos
// Data           :  05/03/2009
// Pendência      :  SOL 109421 KINTANA 496332
// Descricao      :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
Autor     :
Rotina    :
Data      :
Pendencia :
Alteração :
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Rotina    : TestaPrimeiroPagto(...)
Data      : 28/12/2007
Pendencia : 27138
Alteração : Correção da query de entrada para cálculo de contribuições sobre 13º, em caso de manutenção recente
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Rotina    : PreparaQry(...)
Data      : 28/12/2007
Pendencia : 25604
Alteração : Criada opção para ignorar contribuições referentes a planos desativados
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Rotina    : bbtnDesfazerClick(...)
Data      : 19/11/2007
Pendencia : 23663 (reabertura)
Alteração : Inclusão do campo EMISBLOQ na query principal (sSQLEnvio), através de join com a tabela
            DOCUMENTO, e retirada de uma outra query que abria os documentos com um IN (..., ..., ...),
            que ocasionava erro quando há mais de 1000 argumentos
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : bbtnDesfazerClick
Data      : 17/04/2007
Pendencia : 25095
Alteração : Correção na rotina de desfazer preparo/envio para não buscar o campo
            CODDOCUMENTOPREV caso não tenha sido efetuado um envio bancário.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : bbtnDesfazerClick
Data      : 19/03/2007
Pendencia : 22081
Alteração : Filtro na consulta para buscar apenas as contribuições oriundas
            de evento, caso tenha marcado a opção "Enviar apenas as calculadas
            por evento ou novas inscrições".
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : chklstContrib
Data      : 17/11/2006
Pendencia : 20774
Alteração : Mudança no componente para poder visualizar todo o nome da
            contribuição.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : bbtnDesfazerClick
Data      : 17/11/2006
Pendencia : 23663
Alteração : Inserção de crítica para não permitir desfazer documentos enviados ao bancos com
            impressão do boleta.
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Rotina    : PreparaQry
Data      : 11/08/2006
Pendencia : 22743
Alteração : Criação da sSQLShared, que é a mesma query básica para diferentes situações, com
            apenas os filtros diferentes deixados nos "IFs"
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : vetsituacaoPreparo
Data      : 19/05/2006
Pendencia : 22242
Alteração : Inclusão da situação Manutenção de Saldo de Conta
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : bbtnDesfazerClick
Data      : 15/05/2006
Pendencia : 22329
Alteração : Ajuste na rotina de desfazer.
----------------------------------------------------------------------------------------------------
Autor     : Paulo Ramos
Rotina    : bbtnEnviarClick e bbtnDesfazerClick
Data      : 19/04/2006
Pendencia : 22116
Alteração : Ajustar para que a tela de aguarde seja sempre fechada, sendo o processo concluído com sucesso ou com erro.
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : bbtnDesfazerClick
Data      : 16/03/2006
Pendencia : 21561
Alteração : tratar filtro de data de vencimento no desfazer
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : EnviaContribuicaoCcp
Data      : 22/02/2006
Pendencia : 21614
Alteração : buscar o CODPORTFORMA na CONTPLANPATRO e CONTPREV para envio de contribuições para banco
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : bbtnDesfazerClick
Data      : 15/02/2006 (pendência feita em 12/12/2005)
Pendencia : 21029 - reabertura
Alteração : retirei String errado na query qryLotesAEnviar (" (and")
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : EnviaContribuicaoCcp
Data      : 15/02/2006
Pendencia : 21567
Alteração : verifica se existem documentos para serem descarregados.
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : EnviaContribuicaoCcp
Data      : 18/01/2006
Pendencia : 20769 - 20788 - 20940
Alteração : retirei a crítica or (sMesRefAnt <> qryEnvio.FieldByName('MesReferencia').AsString)
            do critério de abertura de documentos, pois, todos os clientes concordam
            no agrupamento de todas as cobranças por mês de cobrança, não importando o
            mês dse referência
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : EnviaContribuicaoCcp
Data      : 17/01/2006
Pendencia : 20769 - 20788 - 20940
Alteração : caso a data de vencimento da tela esteja preenchida, desconsiderar a DATAPREVISAORECE da HSTCONTRIBPREV e
            enviar todas as cobranças com a data colocada
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : EnviaContribuicaoCcp
Data      : 03/01/2006 - 06/01/2006
Pendencia : 20769 - 20788 - 20940
Alteração : alteração do envio de altertador. Mudança da posição da chamada para após a descarrega
            documentos, quando já temos o número.
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : EnviaContribuicaoCcp
Data      : 09/12/2005 - 12/12/2005
Pendencia : 20769 - 20788 - 20940
Alteração : Modificação geral da função para tratar documentos por grupos de pessoas e utilizar a
            função DescarregaDocumentos como padrão para integração.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : MontaSQLParaRegraCalculo
Data      : 15/12/2005
Pendencia : 21036
Alteração : Alteração de atribuição de variável
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : GeraHistorico e GravaHistorico
Data      : 15/12/2005
Pendencia : 21029
Alteração : Acerto no mesreferencia da query e na condição do update da HstContribprev
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : bbtnDesfazerClick
Data      : 12/12/2005
Pendencia : 21029
Alteração : Acerto para impedir o looping no desfazer individual
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : PreparaContribuicao e EnviaContribuicaoCcp
Data      : 12/12/2005
Pendencia : 21011
Alteração : Implementações / Acertos diversos
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : bbtnDesfazerClick
Pendência : 20751
Data      : 07/12/2005
Descricao : Acerto para apagar a tela de aguarde em caso de erro no desfazer.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : rgrpDataVencimentoClick
Pendência : 20747
Data      : 05/12/2005
Descricao : Acerto na visualização do groupbox grpdatasvencimento.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : EnviaContribuicaoCcp
Pendência : 20738
Data      : 30/11/2005
Descricao : Alterações na chamada da função EnviaAlteradorBANCO
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : EnviaContribuicaoCcp
Pendência : 20896
Data      : 02/12/2005
Descricao : Lançamento de cada contribuição em um documento distinto.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : EnviaContribuicaoCcp
Pendência : 19785
Data      : 26/07/2005
Descricao : Mudança da lógica de atualização da HSTCONTRIPREV.SITRECEBIMENTO para inidividual ao
            invés de uma vez por processo.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : EnviaContribuicaoCcp
Pendência : 19504
Data      : 08/07/2005
Descricao : Acerto na chamada da função AtualizaSitContrib
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : qryDocumentos
Pendência : 19385
Data      : 09/06/2005
Descricao : Acrescentado o campo virtual IDPLANOPREVCONTAB.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : PreparaContribuicao, EnviaContribuicaoCcp
Pendência : 18536
Data      : 03/06/2005
Descricao : - Criação de rotina específica para verificar o codportforma das contribuiçoes na
            CONTPLANPATRO e, se não houver, na CONTPREV. No caso de não existir é enviada uma
            mensagem detalhada ao usuário para corrigir a situação.
            - Acerto na mensagem final da rotina EnviaContribuicaoCcp para indicar que o envio foi
            cancelado (ROLLBACK)
----------------------------------------------------------------------------------------------------
Autor     : Augusto
Data      : 06/06/2005
Pendência : 19292
Descrição : Atualizar o campo MESULTREAJSAL no desfazer
----------------------------------------------------------------------------------------------------
Autor     : Leo
Data      : 16/05/2005
Descrição : alteração da qrydocumentos e updDocumentos para inclusão do campo IDPESSJURCEDIDO
----------------------------------------------------------------------------------------------------
otina     : TrazDadosParcela
utor(a)   : Leo
ata       : 12/05/2005
endência  : 19180
escricao  : passagem do último parâmetro, salário atual
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : GeraHistorico
Pendência : 18857
Data      : 05/04/2005
Descricao : Avisa ao usuário quando a contribuição está sendo preparada com valor zerado.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : PreparaContribuicao e GeraHistorico
Pendência : 17855
Data      : 05/04/2005
Descricao : Utilização do campo FLGNGRAVACONTZERO para parâmetro que indicará que o plano não
            gravará contribuições com valores zerados.
----------------------------------------------------------------------------------------------------
Autor     : Augusto
Rotina    : bbtnDesfazerClick
Data      : 01/03/2005
Descrição : Retirar da consulta dos beneficios a desfazer, os registro do tratamento de
            divergencia (FLGDIVERGENTE = 1)
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : MontaSQLAssoc
Data      : 17/02/2005
Descrição : inclusão dos campos EL.FLGDIRETOR, PP.IDSITPART, EL.IDSITFUNC na query para a regra
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : PreparaQry
Data      : 17/02/2005
Descrição : inclusão da cláusula  (CP.ULTANO13 IS NULL) para verificação da geração anterior do décimo terceiro
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : MontaSQLParaRegraCalculo
Data      : 16/12/2004
Pendência : 18308
Descrição : Acerto na passagem do campo VALORPROVENTO para casos de MANUTENÇÃO
----------------------------------------------------------------------------------------------------
Rotina     : várias
Autor(a)   : Leo
Data       : 07.12.2004
Pendência  : -----
Descricao  : acrescentei o IDMODULO nas queries para cálculo de alteradores
----------------------------------------------------------------------------------------------------
Rotina     : várias
Autor(a)   : Leo
Data       : 19.11.2004
Pendência  : -----
Descricao  : acrescentei alguns campos nas regras de cálculo
----------------------------------------------------------------------------------------------------
Rotina     : EnviaAlteradorBANCO
autor(a)   : Camille
Data       : 28.10.2004
Pendência  : -----
Descricao  : Acerto na chamada as rotinas de integração com back 3 camadas
----------------------------------------------------------------------------------------------------
Rotina     : Diversas
Autor(a)   : Camille
Data       : 08.10.2004
Pendência  : 17551
Descricao  : Substituicao das units do back pelas de 3 camadas :
                     U D o c u m e n t o    -> U C t r l D o c u m e n t o
                     U L a n c C o n t a b  -> U C t r l L a n c a m e nt o
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : -----
Data      : 24.08.2004
Pendência : -----
Descrição : Mostrar idpessoa do participante onde ocorreu o erro
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : PreparaQry
Data      : 18.08.2004
Descrição : Acerto da busca do salário de manutenção, mesmo sendo envio para a Folha, para facultativos
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : -----
Data      : 07.07.2004
Pendência : 17155
Descrição : Gerar RAD na inclusao de documentos
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : EnviaContribuicaoBANCO
Data      : 30.06.2004
Pendência : ----
Descrição : Exibir mensagem de erro para o caso de dar erro na GetCodigo
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : -----
Data      : 29.06.2004
Pendência : 17106
Descrição : 1. Caso seja feito um envio e ocorra algum erro no meio do processo,
               não permitir que o mesmo continue.
            2. Apresentar lista (log) com campos de parametrizacao faltando
            3. Não permitir envio se a integração financeira não estiver habilitada
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : bbtnDesfazerClick
Data      : 02/04/2004
Pendência : 16470
Descrição : Alteração na rotina para desfazer envio inclusive de registro
            incluidos manualmente, porém não desfazer o preparo destes.
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : VefificaContabMantido
Data      : 31.03.2004
Descrição : - Alteração do nome da rotina para VerificaContabMantidoNoEnvio
            - Alteracao do nome da variavel bContabiliza para bContabilizaNOEnvio
            - Padronizacao do critério de teste da variavel bContabiliza,
              que em algumas rotinas testava se contabilizava no envio e em
              outras no recebimento
----------------------------------------------------------------------------------------------------
Rotina    : Diversas
Autor(a)  : Camille
Data      : 24.03.2004
Alteração : Modificações para tratar devolucao de contribuicao corretamente
----------------------------------------------------------------------------------------------------
Rotina    : Geral
Autor(a)  : Leo - Funcef
Data      : 19.02.2004
Alteração : modificações diversas para atender a necessidades do envio de contribuições
            de adiantamento de décimo terceiro para mantidos e mantidos parciais
----------------------------------------------------------------------------------------------------
Rotina    : GravaHistorico
Autor(a)  : Leo
Data      : 29.12.2003
Alteração : vírgula faltando na instrução update no histórico
----------------------------------------------------------------------------------------------------
Rotina    : PreparaQry
Autor(a)  : Gleyber
Data      : 16/12/2003
Pendencia : 15815
Alteração : Criação de dois novos campos para a regra de primeiro e ultimo
            pagamento (13º) - DATADEMISSAO e IDSITFUNCNOVO
----------------------------------------------------------------------------------------------------
Rotina    : MontaSQLParaRegraCalculo e TestaPrimeiroPagto
Autor(a)  : Gleyber
Data      : 15/12/2003
Pendencia : 15801 e 15804
Alteração : Criação de novos campos para a regra de primeiro e ultimo
            pagamento (13º).
----------------------------------------------------------------------------------------------------
Rotina    : PreparaContribuicao
Autor(a)  : Leo
Data      : 14.10.2003
Pendencia : Melhoria
Alteração : modificação da rotina para forçar o preparo das contribuições
            pagas pela patrocinadora, caso sejam participantes com situação de mantido parcial.
            estes participantes tem contribuições pagas na folha e com FLGINTERNO na CONTPREV
            diferente de "MP".
----------------------------------------------------------------------------------------------------
Rotina    : PreparaQry
Autor(a)  : Leo
Data      : 14.10.2003
Pendencia : Melhoria
Alteração : modificação da rotina para forçar o preparo das contribuições
            pagas pela patrocinadora, caso sejam participantes com situação de mantido parcial.
            estes participantes tem contribuições pagas na folha e com FLGINTERNO na CONTPREV
            diferente de "MP".
----------------------------------------------------------------------------------------------------
Rotina    : MontaSQLParaRegraCalculo
Autor(a)  : Leo
Data      : 14.10.2003
Pendencia : Melhoria
Alteração : passagem do campo virtual SALPARTICIPACAO para a regra como o próprio
            PARTPREVPLAN.SALPARTICIPCAO. Estava indo como VALORPROVENTO.
----------------------------------------------------------------------------------------------------
Rotina    : Todas
Autor(a)  : Camille
Data      : 28.08.2003
Pendencia : Melhoria
Alteração : Substituição da chamada do frmProgressoBatch pelo frmAguarde
            para manter padrão do sistema
----------------------------------------------------------------------------------------------------
Rotina    : EnviaContribuicaoCcp
Autor(a)  : Augusto
Data      : 15/07/2003
Pendencia :
Alteração : Alteração foltro de pesquisa dos Lotes
----------------------------------------------------------------------------------------------------
Rotina    : EnviaContribuicaoCcp
Autor(a)  : Gleyber
Data      : 07/07/2003
Alteração : Alteração na chamada da função LerContribAEnviar
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 21.06.2003
Alteração : Inclusao do Filtro de MULTI-FUNDACAO
----------------------------------------------------------------------------------------------------
Rotina    : CriaLote
Autor(a)  : Carlos Guedes
Data      : 31/03/2003
Alteração : Mudando o tpo de insert feito na CTRLINTRFACE. Era cachedupdate e foi alterado para
            transação.
----------------------------------------------------------------------------------------------------
Rotina    : PreparaQry
Autor(a)  : Camille
Data      : 06.02.2003
Alteração : Inclusao do campo DATADEMISSAO na qryNCalcMantido
----------------------------------------------------------------------------------------------------
Rotina    : EnviaContribuicaoCcp
Autor(a)  : Leo
Data      : 20/01/2003
Alteração : acrescentei a crítica por folhaorigem
----------------------------------------------------------------------------------------------------
Rotina    : PreparaQry
Autor(a)  : Gleyber
Data      : 11/12/2002
Alteração : Acrescentei o campo DATAADMISSAO na query qryNCalcMantido13
            Incluida o campo IDSITPARTNOVO na regra de calculo.
            Incluida o campo VALORPROVENTO na regra de calculo.
----------------------------------------------------------------------------------------------------
Rotina    : PreparaQry
Autor(a)  : Gleyber
Data      : 04/12/2002
Alteração : Acrescentei o campo IDREGRACALCULO13 na query
----------------------------------------------------------------------------------------------------
Rotina    : GravaHistorico
Autor(a)  : Leo
Data      : 04.12.2002
Alteração : tratamento de contribuições de parcelamento
----------------------------------------------------------------------------------------------------
Rotina    : EnviaContribuicaoCcp
Autor(a)  : Leo
Data      : 14.11.2002
Alteração : tratamento da marcação de contabilização no envio/recebimento para
            cobraça bancária de mantidos (VerificaContabMantidoNoEnvio)
----------------------------------------------------------------------------------------------------
Rotina    : PreparaQry
Autor(a)  : Leo
Data      : 29.10.2002
Alteração : acerto do sql da query qryNCalcMantido13
----------------------------------------------------------------------------------------------------
Rotina    :
Autor(a)  : Leo
Data      : 24.10.2002
Alteração : commit parcial com ictMaxCommit
----------------------------------------------------------------------------------------------------
Rotina    : GeraHistorico
Autor(a)  : Leo
Data      : 23.10.2002
Alteração : teste para verificar se o flgtpvlr está com valor 'N' de não envia,
            então colocar o valoresperado igual a zero
----------------------------------------------------------------------------------------------------
Rotina    : EnviaContribuicaoCcp
Autor(a)  : Leo
Data      : 17.10.2002
Alteração : enviar registros resultado de tratamento de divegência com destino banco
----------------------------------------------------------------------------------------------------
Rotina    : Desfazer
Autor(a)  : Leo
Data      : 27.09.2002
Alteração : voltar valor do salário antes do reajuste
            caso  mês seja de reajuste e o valor esteja preenchido
----------------------------------------------------------------------------------------------------
Rotina    : GravaHistorico
Autor(a)  : Leo
Data      : 13.09.2002
Alteração : modificação para inclusão do FOLHAORIGEM
----------------------------------------------------------------------------------------------------
Rotina    : EncerraContribLote
Autor(a)  : Leo
Data      : 06.08.2002
Alteração : modificação no update do FLGCOBRA=0
            retirando as contribuições de auxílio doença
----------------------------------------------------------------------------------------------------
Rotina    : EnviaContribuicao
Autor(a)  : Camille
Data      : 01.04.2002
Alteração : Retirada de 2 parâmetros da chamada da EnviaContribuicao
            que não serão mais utilizados pois serão tratados dentro
            da rotina EnviaContribuicao, não precisando ser retornados
----------------------------------------------------------------------------------------------------
Rotina    : EnviaContribuicao
Autor(a)  : Camille
Data      : 05.04.2002
Alteração : Chamar o envio de alteradores mesmo que a contribuição seja do
            próprio mês de cobrança, pois o usuário pode ter inserido
            alteradores manualmente
----------------------------------------------------------------------------------------------------
Augusto 12/09/2002 - Alterações no Desfazer do Envio
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, wwdblook,
  Spin, Db, DBTables, Wwquery, checklst,  ComCtrls, TB97,
  Gauges, Wwdatsrc, Menus, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, IvDictio,
  IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker, UCtrlDocumento,
  UCtrlLancamento, fcLabel, uCtrlBaixaRecXPag, uCmSqlParams, Provider,
  DBClient, uCMClientDataSet, uCtrlPeriodo, uCtrlFinanc,
  uCMTypes;


const
  ictMaxCommit = 800;

  vetSituacaoPreparo : array[0..4] of String[2] = ('AT','MA','MP','MS','PT');

type
  TfrmPreparaEnvia = class(TfrmOkCancelar)
    Panel2: TPanel;
    grpMesAnoRef: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    rgrpTipoCobranca: TRadioGroup;
    qryContribuicao: TwwQuery;
    qryPlano: TwwQuery;
    qryPatro: TwwQuery;
    qryAux: TwwQuery;
    qryLotesAEnviar: TwwQuery;
    SaveDlg: TSaveDialog;
    bbtnEnviar: TBitBtn;
    dsContribACalcular: TwwDataSource;
    qryAux2: TwwQuery;
    pgctrlOpcoes: TPageControl;
    tbsBasico: TTabSheet;
    pnlTabSheet1: TPanel;
    tbsOpcoesAvanc: TTabSheet;
    pnlTabSheet2: TPanel;
    tbsResultado: TTabSheet;
    pnlTabSheet4: TPanel;
    chklstPlano: TCheckListBox;
    Label7: TLabel;
    chklstPatro: TCheckListBox;
    lbPatro: TLabel;
    lbParticipante: TLabel;
    chklstSituacao: TCheckListBox;
    bbtnSalvar: TBitBtn;
    memResult: TMemo;
    grpdatasvencimento: TGroupBox;
    Label2: TLabel;
    spedDiaIni: TSpinEdit;
    Label3: TLabel;
    spedDiaFim: TSpinEdit;
    dsPreparosAnt: TwwDataSource;
    rgrpContribuicoes: TRadioGroup;
    qryEnvio: TwwQuery;
    qryPreparosAntOld: TwwQuery;
    qryPreparosAntOldIDLOTE: TFloatField;
    qryPreparosAntOldMESREFERENCIA: TStringField;
    qryPreparosAntOldDESCRICAO: TStringField;
    qryPreparosAntOldFLGENVIAR: TFloatField;
    qryPreparosAntOldDATAPREPARO: TDateTimeField;
    qryPreparosAntOldDATAIDATMP: TDateTimeField;
    qryPreparosAntOldNUMREG: TFloatField;
    qryPreparosAntOldVLRTOTAL: TFloatField;
    qryPreparosAntOldFLGIDATMP: TFloatField;
    qryPreparosAntOldIDPESSOA: TFloatField;
    qryPreparosAntOldCODPORTFORMA: TFloatField;
    qryPreparosAntOldFLGVOLTATMP: TFloatField;
    qryPreparosAntOldFLGIDAINTERFACE: TFloatField;
    qryPreparosAntOldFLGVOLTAINTERFACE: TFloatField;
    qryPreparosAntOldFLGEMITIUCC: TFloatField;
    qryPreparosAntOldDATAVOLTATMP: TDateTimeField;
    qryPreparosAntOldDATAIDAINTERFACE: TDateTimeField;
    qryPreparosAntOldDATAVOLTAINTERFA: TDateTimeField;
    qryPreparosAntOldDATAEMITIUCC: TDateTimeField;
    qryPreparosAntOldTIPO: TStringField;
    qryPreparosAntOldFLGPREPARADO: TFloatField;
    qryPreparosAntOldFLGATRASODEVOL: TStringField;
    qryPreparosAntOldPATROCINADORA: TStringField;
    updPreparos: TUpdateSQL;
    lsLotesEnviados: TListBox;
    qryTotalPatro: TwwQuery;
    qryEnvioAtr: TwwQuery;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    dtVencBoleta: TCMDateTimePicker;
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
    rgrpDataVencimento: TRadioGroup;
    rgrpTipoOperacao: TRadioGroup;
    qryPlanPatro: TwwQuery;
    bbtnDesfazer: TBitBtn;
    GroupBox2: TGroupBox;
    chklstContrib: TCheckListBox;
    qryFiltroContrib: TwwQuery;
    qryMantidos: TwwQuery;
    qryContabilIDPESSJUR: TFloatField;
    qryContabilIDPLANOPREV: TFloatField;
    qryDesfazDocumentos: TwwQuery;
    updDesfazDocumentos: TUpdateSQL;
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
    qryDocumentosIDPESSJUR: TFloatField;
    qryDocumentosIDPLANOPREV: TFloatField;
    qryDocumentosIDCONTRIBUICAO: TFloatField;
    qryDocumentosFLGDEVOLUCAO: TFloatField;
    qryDocumentosRECPAG: TStringField;
    qryDocumentosIDPLANPREVCONTAB: TFloatField;
    qryDocumentosIDPESSJURCEDIDO: TFloatField;
    Label1: TLabel;
    chkApenas13: TCheckBox;
    Label5: TLabel;
    lblValores: TfcLabel;
    chkPlanoDesativado: TCheckBox;
    GroupBox3: TGroupBox; // SOL 130118 Kintana 817114
    CbEnvio: TCheckBox;   // SOL 130118 Kintana 817114
    CbPga: TCheckBox; // SOL 130118 Kintana 817114
    CbBpd: TCheckBox; // SOL 130118 Kintana 817114
    cdsDocRec: TCMClientDataSet; // SOL 130118 Kintana 817114
    cdsDocPag: TCMClientDataSet; // SOL 130118 Kintana 817114
    dspDocRec: TDataSetProvider; // SOL 130118 Kintana 817114
    qryDocPag: TwwQuery; // SOL 130118 Kintana 817114
    sqlLancFinanc: TCMSqlParams; // SOL 130118 Kintana 817114
    cdsLancFinanc: TCMClientDataSet; // SOL 130118 Kintana 817114
    qryPlanoxDocum: TwwQuery; // SOL 130118 Kintana 817114
    SQLDocPag: TCMSqlParams; // SOL 130118 Kintana 817114
    SQLDocRec: TCMSqlParams;
    grpMeses: TGroupBox;
    chkApenasMes: TCheckBox;
    chkApenasAtrasadas: TCheckBox;
    chkApenasDevolucoes: TCheckBox; // SOL 130118 Kintana 817114
	qrySalContrib: TwwQuery;

    procedure chklstPatroClickCheck(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnEnviarClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function  TestaIdregra (iidpessjur,iidplanoprev,iidcontribuicao,
                            iidpessoa : Integer;
                            psAnoMesReferencia : String ): Integer;
    procedure FormShow(Sender: TObject);
    procedure rgrpDataVencimentoClick(Sender: TObject);
    procedure rgrpContribuicoesClick(Sender: TObject);
    procedure rgrpTipoOperacaoClick(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure CbEnvioClick(Sender: TObject); // SOL 130118 Kintana 817114
    procedure CbPgaClick(Sender: TObject); // SOL 130118 Kintana 817114
    procedure CbBpdClick(Sender: TObject); // SOL 130118 Kintana 817114
    procedure eOnMessage(sMsg : string); // SOL 130118 Kintana 817114
 
  private // Private declarations
    bDisponibilidadeFinanceira : boolean; // SOL 130118 Kintana 817114
    rTotRec: Double;  // SOL 130118 Kintana 817114
    rTotPag: Double; // SOL 130118 Kintana 817114
    iCodPortFormaReceber: Integer; // SOL 130118 Kintana 817114
    iCodPortFormaPagar  : Integer; // SOL 130118 Kintana 817114
    CtrlBaixaRecXPag    : TCtrlBaixaRecXPag; // SOL 130118 Kintana 817114
    CtrlDisponFinanc    : TCtrlFinanc; // SOL 130118 Kintana 817114
    CtrlPeriodo         : TCtrlPeriodo; // SOL 130118 Kintana 817114
    CtrlDocumento       : TCtrlDocumento;
    CtrlLancamento      : TCtrlLancamento;
    liIdPessoa          : longint;

    // Variaveis usadas para filtrar a query de lotes (qryPreparosAnt)
    piDiaIniFiltro      : Integer;
    piDiaFimFiltro      : Integer;
    psIdPessJurFiltro   : String;
    psSitFundacaoFiltro : String;
    strTodasPatros      : String;   // Contem os id's de todas as patrocinadoras
    strTodasSituacoes   : String;   // Contem os flgInterno de todas as situacoes

    // Variaveis globais a unit
    sAnoMesCobrancaTelaInicial : String; // Indica o ano/mes informado pelo usuario na tela

    //=== Variaveis uzadas para o Preparo
    idLote,                        // identificador do lote que está sendo processado
    iNumRegTodosLotes,             // numero de registros de todos os lotes (soma) preparados
    iNumRegLote        : Integer;  // numero de registros do lote que está sendo processado
    rTotalTodosLotes,              // valor (R$) da soma de todos os lotes preparados
    rTotalLote         : real;     // valor (R$) da soma dos registros do lote que está sendo processado
    bExigeFinanc,
    bAlgumProblema     : boolean;

    iFlgNGravaContZero : Integer;  


    sDescLote,

    strPatro,
    strPlano,
    strSituacao        : String;


    strLotePrepAgora : String;


    sIdSitPartNovo,
    sIdSitFuncNovo,   
    sAnoMesRef      : String;

    
    bContribParcelamento : boolean;
    sIdParcelamento,
    sPercentual,
    sVlrDividaPart,
    sVlrDividaPatro,
    sVlrPrestacao,
    sVlrSdoDevedor, sSalBaseAtual  : String;

    bEnviouContribBanco : boolean;  

    //======  Procedimentos e funções Comuns ao Preparo e Envio
    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
    function  CommitPreparo      : boolean;
    function  InformacoesOK      : boolean;
    function  PreencheFiltroTela : boolean;

    //======  Procedimentos e funções usadas no Preparo
    procedure MontaSQLParaRegraCalculo(psAnoMesReferencia, sSitucao:String; var sSql : String);
    function  PreparaContribuicao : boolean;

    function  AtualizaLOTE  : boolean;
    function  CriaLOTE      : boolean;
    function  TestaPrimeiroPagto( var sValorRegra: String;
                                  psAnoMesReferencia,
                                  sValorAssoc1,  sValorAssoc2,  sValorAssoc3,
                                  sValorOp1Ass1, sValorOp1Ass2, sValorOp1Ass3 : String;
                                  var pbCobra13 : boolean;
                                  sFlgInterno : String ): boolean;

    function  PreparaQry(piIdPessJur      : Integer;
                         piIdPlanoPrev    : Integer;
                         piIdContribuicao : Integer;
                         psSitFundacao    : String
                        ): Boolean;

    function  GeraHistorico( psDataPrevista, sNomeContrib, psFlgInterno,
                             psAnoMesReferencia : String;
                             piQtdeContribAssoc : Integer;
                             var pbCobra13 : boolean ) : boolean;

    function  GravaHistorico(psAnoMesReferencia, psDataPrevista,  sValEsperado, sFlgNaoExigeRec : String;
                             iNumRecebimento,iNumParcela,iIdRegra   : Integer;
                             iIdPessoa,iIdPessJur,iIdPlanoPrev,iIdContribuicao : Integer;
                             bTestarValor : boolean; var bValorZERO : boolean) : boolean;

    function  EncerraContribLote(piIdLote,piIdPessJur, piIdPlanoPrev : Integer;
                                 psMesReferencia,psFlgSitFundacao,psStrLotes : String)  : boolean;

    //== Monta sql de contribuicoes que tem contribuicao associada
    function  MontaSQLAssoc(piIdPessJur, piIdPlanoPrev,
                            piIdPessoa,  piSeqProposta, piIdContribuicao,
                            piIdContribAssoc1,  piIdContribAssoc2,
                            piIdContribAssoc3,  piQtdeContribAssoc : Integer;
                            psFlgPagadorAssoc1, psFlgPagadorAssoc2,
                            psFlgPagadorAssoc3, psAnoMesReferencia : String;
                            var
                            sValorAssoc1,  sValorAssoc2,  sValorAssoc3,
                            sValorOp1Ass1, sValorOp1Ass2, sValorOp1Ass3 : String;
                            psFlgInterno : String )  : String;


    //======  Procedimentos e funções usadas no Envio
    procedure EnviaContribuicaoCcp;
    procedure EnviarContribRecebida(lsLotesEnviados : TListBox);
    function  ConfirmaOpcoes : boolean;
    function  GeraAlteradorPARCELA( piIdLote : longint;
                                    var sMsgErro : String ) : boolean;
    function  GeraSalarioMensalMantido( piIdPessJur,
                                        piIdPlanoPrev : longint ) : boolean;

    function AlteraIdloteAtrasoDevol : Boolean;

    function VerificaCodPortForma : Boolean;

    procedure FiltraDadosBaixa(sRecPag, pDocumentos: String); // SOL 130118 Kintana 817114

    procedure AbreQryPlanoxDocum(pDocumento: String); // SOL 130118 Kintana 817114

    //Inicio - Helio - SOL Nº 253577/17460 PPM Nº 955546
    function ObtemIdPlanoprevContbContribPrevpart(pIdPessoa,
                                                  pIdPessJur,
                                                  pIdPlanoPrev,
                                                  pIdContribuicao,
                                                  pSeqProposta : Integer) : Integer;
    //Fim - Helio - SOL Nº 253577/17460 PPM Nº 955546

  public  // Public declarations

    sAnoMesCobrancaTela : String;


  end;


var
  frmPreparaEnvia: TfrmPreparaEnvia;



implementation
{$R *.DFM}
uses
  UMensErro,     UDataBase,     UAdmPrev,     DBaseDados,
     UAutorizacao,  DPreparaContrib, USistema,
     UContribuicaoPrev,
     UParticipante, FAguarde,        UModulo,
     FLerSalarios , UIntegraBack,    DAPrev,
     FMostraAux, FSelecionaParticipantes, uSincronismo, UFuncoesUteis,
     FParcelamento,
     uCtrlParamIntegra; // SOL 130118 Kintana 817114

procedure TfrmPreparaEnvia.eOnMessage(sMsg : string); // SOL 130118 Kintana 817114
begin
   MsgDlg(sMsg,'Atenção',mtWarning,[mbOk],0);
end;  // SOL 130118 Kintana 817114

function  TfrmPreparaEnvia.ConfirmaOpcoes : boolean;
var sLinha, sPatrocinadoras, sPlanos, sSituacoes : String;
    i : Integer;
begin
    Result          := False;
    sPatrocinadoras := '';
    sPlanos         := '';
    sSituacoes      := '';

    // Preencher patrocinadoras
    for i := 0 to chklstPatro.Items.Count - 1 do
    begin
       if chklstPatro.Checked[i]
       then sPatrocinadoras := sPatrocinadoras + chklstPatro.Items[i]+',';
    end;
    sPatrocinadoras := Copy(sPatrocinadoras,1,length(Trim(sPatrocinadoras))-1);

    // Preencher planos
    for i := 0 to chklstPlano.Items.Count - 1 do
    begin
       if chklstPlano.Checked[i]
       then sPlanos := sPlanos + chklstPlano.Items[i]+',';
    end;
    sPlanos := Copy(sPlanos,1,length(Trim(sPlanos))-1);

    // Preencher situacoes
    for i := 0 to chklstSituacao.Items.Count - 1 do
    begin
       if chklstSituacao.Checked[i]
       then sSituacoes := sSituacoes + chklstSituacao.Items[i]+',';
    end;
    sSituacoes := Copy(sSituacoes,1,length(Trim(sSituacoes))-1);

    with frmMostraAux do
    begin
       Caption := 'Resumo das Opções de Cobrança de Contribuição';
       memResult.Lines.Clear;
       memResult.Lines.Add('Resumo das Opções de Cobrança de Contribuição - DATA : '+DateToStr(date));
       memResult.Lines.Add('----------------------------------------------------------------------------------------');
       memResult.Lines.Add(' ');

       sLinha := ' Cobrar contribuições referentes ao mês de '+Trim(cmbMesCob.Text)+ ' de '+Trim(spedAnoCob.Text);
       if Trim(sPatrocinadoras) = ''
       then sLinha := sLinha + ' de TODAS as patrocinadoras '
       else sLinha := sLinha + ' da(s) patrocinadora(s) '+sPatrocinadoras;

       if Trim(sPlanos) = ''
       then sLinha := sLinha + ' de TODOS os planos '
       else sLinha := sLinha + ' do(s) plano(s) '+sPlanos;

       if Trim(sSituacoes) = ''
       then sLinha := sLinha + ' que estejam em qualquer situação '
       else sLinha := sLinha + ' que estejam na(s) situação(ões) '+sSituacoes;

       sLinha := sLinha + ' e satisfaça(m) à(s) seguinte(s) condição(ões) :';
       memResult.Lines.Add(sLinha);

       sLinha := '';
       case rgrpTipoCobranca.ItemIndex of
            0 : sLinha := ' . Sejam descontas em Folha de Pagamento ';
            1 : sLinha := ' . Sejam cobradas através de Cobrança Bancária ';
            2 : sLinha := ' . Sejam cobradas através Relatório ';
            3 : sLinha := ' . Sejam cobradas em Folha de Pagamento OU em Cobrança Bancária OU Relatório ';
       end;

       // Kintana 1461555 SOL 166858 - Otacilio ** Inicio **
       {case rgrpMeses.ItemIndex of
            0 : sLinha := sLinha + ' ( tanto do mês quanto atrasadas ) ';
            1 : sLinha := sLinha + ' e não estejam atrasadas ';
            2 : sLinha := sLinha + ' e estejam atrasadas ';
       end;}
       if chkApenasMes.Checked then
         sLinha := sLinha + ' e do mês ';

       if chkApenasAtrasadas.Checked then
         sLinha := sLinha + ' e estejam atrasadas ';

       if chkApenasDevolucoes.Checked then
         sLinha := sLinha + ' e devolvidas ';

       // Kintana 1461555 SOL 166858 - Otacilio ** Fim **
       memResult.Lines.Add(sLinha);

       if (rgrpTipoCobranca.ItemIndex = 3) and (Trim(dtVencBoleta.Text) <> '')
       then begin
          sLinha := ' . LANÇAR '+Trim(dtVencBoleta.Text)+ ' COMO DATA DE VENCIMENTO DA COBRANÇA ';
          memResult.Lines.Add(sLinha);
       end;

       sLinha := '';
       if rgrpContribuicoes.ItemIndex = 1
       then sLinha := ' . Tenham sido geradas por eventos ';
       memResult.Lines.Add(sLinha);

       if rgrpDataVencimento.ItemIndex = 0
       then sLinha := ' . Tenham vencimento entre '+Trim(spedDiaIni.Text) +' e '+Trim(spedDiaFim.Text);

       if rgrpTipoOperacao.ItemIndex = 1
       then sLinha := ' . NÃO CALCULAR CONTRIBUIÇÕES. APENAS ENVIÁ-LAS PARA COBRANÇA. '
       else if rgrpTipoOperacao.ItemIndex = 2
            then sLinha := ' . NÃO ENVIAR CONTRIBUIÇÕES. APENAS CALCULÁ-LAS PARA CONFERÊNCIA ANTES DO ENVIO. ';

       memResult.Lines.Add('----------------------------------------------------------------------------------------');
       memResult.Lines.Add('     VERIFIQUE AS INFORMAÇÕES ACIMA ANTES DE CONFIRMAR A COBRANÇA ');
       memResult.Lines.Add('----------------------------------------------------------------------------------------');
       ShowModal;
    end; // with

    if MsgDlg('Confirma as opções apresentadas para a cobrança ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
    then Exit;
    Result := True;
end; // ConfirmaOpcoes



function TfrmPreparaEnvia.CommitPreparo:boolean;
begin
  result := True;
  try
    with dtmBaseDados.dbBaseDados do
         if InTransaction
         then begin
              if dtmPreparaContrib.qryLote.UpdatesPending then
                 dtmPreparaContrib.qryLote.ApplyUpdates;
              dtmBaseDados.dbBaseDados.Commit;
         end;
  except
    result := False;
    dtmPreparaContrib.qryLote.CancelUpdates;
    dtmBaseDados.dbBaseDados.Rollback;
  end;
end;



procedure TfrmPreparaEnvia.MontaSQLParaRegraCalculo(psAnoMesReferencia, sSitucao:String; var sSql : String);
var sIsPlanoAntes,
    sSalarioRegra,
    sSalario13,
    sMsgErro,
    sPartReinsc,
    sSQLAux,
    sDataInicioManut  // SOL 146616  KINTANA 1003916
            : String;
    bPartReinsc    : boolean;


    sNomeTabela, sCampoPessJur,
    sFlgPagadorAssoc1, sFlgPagadorAssoc2, sFlgPagadorAssoc3,
    sAssoc1Op1, sAssoc1Op2, sAssoc1Op3, sValorAssociado,
    sAssoc2Op1, sAssoc2Op2, sAssoc2Op3, sValorAssociado2,
    sAssoc3Op1, sAssoc3Op2, sAssoc3Op3, sValorAssociado3  : String;

    iQtdeContribAssoc,
    iIdContribAssoc1,
    iIdContribAssoc2,
    iValorTotal,
    iIdContribAssoc3    : Integer;

begin
  if sSitucao <> 'PT'
  then begin

     if (sSitucao = 'AT') and (dsContribACalcular.DataSet.FieldbyName('SALPARTICIPACAO').AsFloat <= 0)
     then begin
        memResult.Lines.Add('Matrícula :'+dsContribACalcular.DataSet.FieldbyName('MATRICULA').AsString+
                            ' - Possível problema : salário atual está ZERADO. Verifique');
     end;

     // se for 13o., buscar salario da histrubsal, senao, usar salario atual da partprevplan
     if Copy(psAnoMesReferencia,6,2) = '13'
     then begin
        sSalarioRegra := OraNumero(dsContribACalcular.DataSet.FieldbyName('SALPARTIC13').AsString);
        sSalario13    := OraNumero(sSalarioRegra);
     end
     else begin
        sSalarioRegra := OraNumero(dsContribACalcular.DataSet.FieldbyName('VALORPROVENTO').AsString);
        sSalario13    := '0';
     end;


     bPartReinsc := PartReinscrito (dsContribACalcular.DataSet.FieldbyName('IDPESSJUR').AsInteger,
                                    dsContribACalcular.DataSet.FieldbyName('IDPLANOPREV').AsInteger,
                                    dsContribACalcular.DataSet.FieldbyName('IDPESSOA').AsInteger,
                                    dtmAPrev.qry);
     if bPartReinsc
     then sPartReinsc := '1'
     else sPartReinsc := '0';

     // Buscar contribuicoes associadas
     sAssoc1Op1        := '0';
     sAssoc1Op2        := '0';
     sAssoc1Op3        := '0';
     sValorAssociado   := '0';
     sAssoc2Op1        := '0';
     sAssoc2Op2        := '0';
     sAssoc2Op3        := '0';
     sValorAssociado2  := '0';
     sAssoc3Op1        := '0';
     sAssoc3Op2        := '0';
     sAssoc3Op3        := '0';
     sValorAssociado3  := '0';
     sFlgPagadorAssoc1 := '';
     sFlgPagadorAssoc2 := '';
     sFlgPagadorAssoc3 := '';

     sSQLAux := ' SELECT CPP.IDCONTRIBPAI,  CPP.IDCONTRIBPAI2,  CPP.IDCONTRIBPAI3,         '+
                '        CPART.VALORBASE1,  CPART.VALORBASE2,   CPART.VALORBASE3,          '+
                '        CASSOC1.FLGPAGADOR AS FLGPAGADORASSOC1,                           '+
                '        CASSOC2.FLGPAGADOR AS FLGPAGADORASSOC2,                           '+
                '        CASSOC3.FLGPAGADOR AS FLGPAGADORASSOC3                            '+
                ' FROM   CONTRIBUICAO C, CONTPREV CPP, CONTPREV CASSOC1, CONTPREV CASSOC2, '+
                '        CONTPREV CASSOC3, CONTRIBPREVPARTP CPART                          '+
                ' WHERE  C.IDCONTRIBUICAO     = CPP.IDCONTRIBUICAO                         '+
                ' AND    CPP.IDPLANOPREV      = '+dsContribACalcular.DataSet.FieldbyName('IDPLANOPREV').AsString+
                ' AND    CPP.IDCONTRIBUICAO   = '+dsContribACalcular.DataSet.FieldbyName('IDCONTRIBUICAO').AsString+
                ' AND    CPART.IDPESSOA       = '+dsContribACalcular.DataSet.FieldbyName('IDPESSOA').AsString+
                ' AND    CPART.SEQPROPOSTA    = '+dsContribACalcular.DataSet.FieldbyName('SEQPROPOSTA').AsString+
                ' AND    CPART.IDPESSJUR      = '+dsContribACalcular.DataSet.FieldbyName('IDPESSJUR').AsString+
                ' AND    CPART.IDPLANOPREV    = '+dsContribACalcular.DataSet.FieldbyName('IDPLANOPREV').AsString+
                ' AND    CPART.IDCONTRIBUICAO = '+dsContribACalcular.DataSet.FieldbyName('IDCONTRIBUICAO').AsString+
                ' AND    CPP.IDPLANOPREV      = CASSOC1.IDPLANOPREV(+)     '+
                ' AND    CPP.IDCONTRIBPAI     = CASSOC1.IDCONTRIBUICAO(+)  '+
                ' AND    CPP.IDPLANOPREV      = CASSOC2.IDPLANOPREV(+)     '+
                ' AND    CPP.IDCONTRIBPAI2    = CASSOC2.IDCONTRIBUICAO(+)  '+
                ' AND    CPP.IDPLANOPREV      = CASSOC3.IDPLANOPREV(+)     '+
                ' AND    CPP.IDCONTRIBPAI3    = CASSOC3.IDCONTRIBUICAO(+)  '+
                ' ORDER  BY CPP.ORDEMCALCULO ';
     with qryAux2 do
     begin
        Close;
        SQL.Clear;
        SQL.Add(sSQLAux);
        Open;

        iQtdeContribAssoc := 0;
        iIdContribAssoc1  := 0;

        if qryAux2.FieldByName('IdContribPai').AsString <> ''
        then begin
           iIdContribAssoc1  := FieldByName('IdContribPai').AsInteger;
           sFlgPagadorAssoc1 := FieldByName('FlgPagadorAssoc1').AsString;
           inc(iQtdeContribAssoc);
        end;

        if FieldByName('IdContribPai2').AsString <> ''
        then begin
           iIdContribAssoc2 := FieldByName('IdContribPai2').AsInteger;
           sFlgPagadorAssoc2 := FieldByName('FlgPagadorAssoc2').AsString;
           inc(iQtdeContribAssoc);
        end;

        if FieldByName('IdContribPai3').AsString <> ''
        then begin
           iIdContribAssoc3  := FieldByName('IdContribPai3').AsInteger;
           sFlgPagadorAssoc3 := FieldByName('FlgPagadorAssoc3').AsString;
           inc(iQtdeContribAssoc);
        end;
     end;

     // Calcular 1a. opcao
     if iQtdeContribAssoc >= 1
     then begin
        if sFlgPagadorAssoc1 = 'E'
        then begin
           sNomeTabela   := 'CONTRIBPREVPATRO';
           sCampoPessJur := 'IDPESSOA';
        end
        else begin
           sNomeTabela   := 'CONTRIBPREVPARTP';
           sCampoPessJur := 'IDPESSJUR';
        end;

        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.Add(' SELECT H.VALORESPERADO, C.VALORBASE1, C.VALORBASE2, C.VALORBASE3 '+
                        ' FROM    HSTCONTRIBPREV H, '+sNomeTabela+' C '+
                        ' WHERE  C.'+sCampoPessJur+'  = '+dsContribACalcular.DataSet.FieldbyName('IDPESSJUR').AsString+
                        ' AND    C.IDPLANOPREV        = '+dsContribACalcular.DataSet.FieldbyName('IDPLANOPREV').AsString+
                        ' AND    C.IDPESSOA           = '+dsContribACalcular.DataSet.FieldbyName('IDPESSOA').AsString+
                        ' AND    C.IDCONTRIBUICAO     = '+IntToStr(iIdContribAssoc1)+
                        ' AND    H.SEQPROPOSTA(+)     = '+dsContribACalcular.DataSet.FieldbyName('SEQPROPOSTA').AsString+
                        ' AND    H.MESREFERENCIA      = '''+sAnoMesCobrancaTela +''''+
                        ' AND    C.'+sCampoPessJur+'  = H.IDPESSJUR      '+
                        ' AND    C.IDPLANOPREV        = H.IDPLANOPREV    '+
                        ' AND    C.IDPESSOA           = H.IDPESSOA       '+
                        ' AND    C.IDCONTRIBUICAO     = H.IDCONTRIBUICAO '+
                        ' ORDER BY H.MESREFERENCIA  ');
        qryAux2.Open;

        if not qryAux2.IsEmpty
        then begin
           sValorAssociado := OraNumero(qryAux2.FieldByName('VALORESPERADO').AsString);
           sAssoc1Op1      := OraNumero(qryAux2.FieldByName('ValorBase1').AsString);
           sAssoc1Op2      := OraNumero(qryAux2.FieldByName('ValorBase2').AsString);
           sAssoc1Op3      := OraNumero(qryAux2.FieldByName('ValorBase3').AsString);
        end;
     end;

     // Calcular 2a. opcao
     if iQtdeContribAssoc >= 2
     then begin
        if sFlgPagadorAssoc2 = 'E'
        then begin
           sNomeTabela   := 'CONTRIBPREVPATRO';
           sCampoPessJur := 'IDPESSOA';
        end
        else begin
           sNomeTabela   := 'CONTRIBPREVPARTP';
           sCampoPessJur := 'IDPESSJUR';
        end;

        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.Add(' SELECT H.VALORESPERADO, C.VALORBASE1, C.VALORBASE2, C.VALORBASE3 '+
                        ' FROM    HSTCONTRIBPREV H, '+sNomeTabela+' C '+
                        ' WHERE  C.'+sCampoPessJur+'  = '+dsContribACalcular.DataSet.FieldbyName('IDPESSJUR').AsString+
                        ' AND    C.IDPLANOPREV        = '+dsContribACalcular.DataSet.FieldbyName('IDPLANOPREV').AsString+
                        ' AND    C.IDPESSOA           = '+dsContribACalcular.DataSet.FieldbyName('IDPESSOA').AsString+
                        ' AND    C.IDCONTRIBUICAO     = '+IntToStr(iIdContribAssoc2)+
                        ' AND    H.SEQPROPOSTA(+)     = '+dsContribACalcular.DataSet.FieldbyName('SEQPROPOSTA').AsString+
                        ' AND    H.MESREFERENCIA      = '''+sAnoMesCobrancaTela +''''+
                        ' AND    C.'+sCampoPessJur+'  = H.IDPESSJUR      '+
                        ' AND    C.IDPLANOPREV        = H.IDPLANOPREV    '+
                        ' AND    C.IDPESSOA           = H.IDPESSOA       '+
                        ' AND    C.IDCONTRIBUICAO     = H.IDCONTRIBUICAO '+
                        ' ORDER BY H.MESREFERENCIA  ');
        qryAux2.Open;

        if not qryAux2.IsEmpty
        then begin
           sValorAssociado2 := OraNumero(qryAux2.FieldByName('VALORESPERADO').AsString);
           sAssoc2Op1       := OraNumero(qryAux2.FieldByName('ValorBase1').AsString);
           sAssoc2Op2       := OraNumero(qryAux2.FieldByName('ValorBase2').AsString);
           sAssoc2Op3       := OraNumero(qryAux2.FieldByName('ValorBase3').AsString);
        end;
     end;// opcao 2

     // Calcular 3a. opcao
     if iQtdeContribAssoc >= 3
     then begin
        if sFlgPagadorAssoc3 = 'E'
        then begin
           sNomeTabela   := 'CONTRIBPREVPATRO';
           sCampoPessJur := 'IDPESSOA';
        end
        else begin
           sNomeTabela   := 'CONTRIBPREVPARTP';
           sCampoPessJur := 'IDPESSJUR';
        end;

        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.Add(' SELECT H.VALORESPERADO, C.VALORBASE1, C.VALORBASE2, C.VALORBASE3 '+
                        ' FROM    HSTCONTRIBPREV H, '+sNomeTabela+' C '+
                        ' WHERE  C.'+sCampoPessJur+'  = '+dsContribACalcular.DataSet.FieldbyName('IDPESSJUR').AsString+
                        ' AND    C.IDPLANOPREV        = '+dsContribACalcular.DataSet.FieldbyName('IDPLANOPREV').AsString+
                        ' AND    C.IDPESSOA           = '+dsContribACalcular.DataSet.FieldbyName('IDPESSOA').AsString+
                        ' AND    C.IDCONTRIBUICAO     = '+IntToStr(iIdContribAssoc3)+
                        ' AND    H.SEQPROPOSTA(+)     = '+dsContribACalcular.DataSet.FieldbyName('SEQPROPOSTA').AsString+
                        ' AND    H.MESREFERENCIA      = '''+sAnoMesCobrancaTela +''''+
                        ' AND    C.'+sCampoPessJur+'  = H.IDPESSJUR      '+
                        ' AND    C.IDPLANOPREV        = H.IDPLANOPREV    '+
                        ' AND    C.IDPESSOA           = H.IDPESSOA       '+
                        ' AND    C.IDCONTRIBUICAO     = H.IDCONTRIBUICAO '+
                        ' ORDER BY H.MESREFERENCIA  ');
        qryAux2.Open;

        if not qryAux2.IsEmpty
        then begin
           sValorAssociado3 := OraNumero(qryAux2.FieldByName('VALORESPERADO').AsString);
           sAssoc3Op1       := OraNumero(qryAux2.FieldByName('ValorBase1').AsString);
           sAssoc3Op2       := OraNumero(qryAux2.FieldByName('ValorBase2').AsString);
           sAssoc3Op3       := OraNumero(qryAux2.FieldByName('ValorBase3').AsString);
        end;
     end;//opcao 3
     iValorTotal := 0;
     qryAux2.Close;
     qryAux2.SQL.Clear;
     qryAux2.SQL.Add(' SELECT NVL(BF.VALORTOTAL,0) AS VALORTOTAL'+
                     ' FROM   BENEFBFCIARIO BF '+
                     ' WHERE  BF.IDTITULAR      = (SELECT IDTITULAR FROM DEPENTIT '+
                                                 ' WHERE IDPESSOA    = '+dsContribACalcular.DataSet.FieldbyName('IDPESSOA').AsString +
                                                 ' and rownum <= 1' + ')'+
                     ' AND    BF.SEQPROPOSTA    = '+dsContribACalcular.DataSet.FieldbyName('SEQPROPOSTA').AsString+
                     ' AND    BF.IDPESSJUR      = '+dsContribACalcular.DataSet.FieldbyName('IDPESSJUR').AsString+
                     ' AND    BF.IDPLANOPREV    = '+dsContribACalcular.DataSet.FieldbyName('IDPLANOPREV').AsString+
                    // ' AND    BF.IDBENEFICIO    = &IDBENEFICIO--148
                     ' AND    BF.IDSITBENEFICIO <> 3 '+
                     ' order by numeroprocesso desc ' );
     qryAux2.Open;


     iValorTotal := qryAux2.FieldbyName('VALORTOTAL').Asinteger ;

     // SOL 146616  KINTANA 1003916
     If dsContribACalcular.DataSet.FieldbyName('DATAINICIOMANUT').AsString <> '' Then
        sDataInicioManut := dsContribACalcular.DataSet.FieldbyName('DATAINICIOMANUT').Asstring
     else
           sDataInicioManut := dsContribACalcular.DataSet.FieldbyName('DTINICIOINSC').AsString;
     // SOL 146616  KINTANA 1003916


     // Montar query
     sSql := '';
     sSql := 'SELECT '+
             ''''+dsContribACalcular.DataSet.FieldbyName('IDPESSJUR').AsString                +''' AS IDPESSJUR,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('IDPLANOPREV').AsString              +''' AS IDPLANOPREV,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('IDPESSOA').AsString                 +''' AS IDPESSOA,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('IDPESSOA').AsString                 +''' AS IDTITULAR,'+ // Felipe A. Santos SOL 222014 KTN 2055090
             ''''+dsContribACalcular.DataSet.FieldbyName('IDCONTRIBUICAO').AsString           +''' AS IDCONTRIBUICAO,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('IDSITPART').AsString                +''' AS IDSITPART,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('IDSITPART').AsString                +''' AS IDSITPARTNOVO,';

     If (sSitucao = 'MA') or (sSitucao = 'MP') or (sSitucao = 'MS')
      Then sSql := sSql + ''''+OraNumero(dsContribACalcular.DataSet.FieldbyName('VALORPROVENTO').AsString) +''' AS VALORPROVENTO,'
      Else sSql := sSql + ''''+OraNumero(sSalarioRegra) +''' AS VALORPROVENTO,';
     sSql := sSql +


             ''''+inttostr(iValorTotal)+''' AS VALORINFINSS, '+  // SOL 146616  KINTANA 1003916
             ''''+sDataInicioManut+'''      AS DATAINICIOMANUT, '+  // SOL 146616  KINTANA 1003916
             ''''+dsContribACalcular.DataSet.FieldbyName('IDSITFUNC').AsString                +''' AS IDSITFUNCNOVO,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('DIAVENCIMENTO').AsString            +''' AS DIAVENCIMENTO,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('CODPORTFORMA').AsString             +''' AS CODPORTFORMA,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('FLGDESCFOLHA').AsString             +''' AS FLGDESCFOLHA,'+
             ''''+OraNumero(dsContribACalcular.DataSet.FieldbyName('VALORBASE1').AsString)    +''' AS VALORBASE1,'+
             ''''+OraNumero(dsContribACalcular.DataSet.FieldbyName('VALORBASE2').AsString)    +''' AS VALORBASE2,'+
             ''''+OraNumero(dsContribACalcular.DataSet.FieldbyName('VALORBASE3').AsString)    +''' AS VALORBASE3,'+
                  OraNumero(sValorAssociado)                                                  +'   AS VALORASSOCIADO,  '+
                  OraNumero(sValorAssociado2)                                                 +'   AS VALORASSOCIADO2, '+
                  OraNumero(sValorAssociado3)                                                 +'   AS VALORASSOCIADO3, '+
                  OraNumero(sValorAssociado)                                                  +'   AS VALORASSOCIADOCOB,  '+
                  OraNumero(sAssoc1Op1)+' AS ASSOC1OP1, '+OraNumero(sAssoc1Op2)+' AS ASSOC1OP2, '+OraNumero(sAssoc1Op3)+' AS ASSOC1OP3, '+
                  OraNumero(sAssoc2Op1)+' AS ASSOC2OP1, '+OraNumero(sAssoc2Op2)+' AS ASSOC2OP2, '+OraNumero(sAssoc2Op3)+' AS ASSOC2OP3, '+
                  OraNumero(sAssoc3Op1)+' AS ASSOC3OP1, '+OraNumero(sAssoc1Op2)+' AS ASSOC3OP2, '+OraNumero(sAssoc1Op3)+' AS ASSOC3OP3, '+
             ''''+dsContribACalcular.DataSet.FieldbyName('FLGCOBRA').AsString                 +''' AS FLGCOBRA,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('QTDEPARCELAS').AsString             +''' AS QTDEPARCELAS,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('FLGRECALCULA').AsString             +''' AS FLGRECALCULA,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('FLGRETROATIVO').AsString            +''' AS FLGRETROATIVO,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('DATAINICIO').AsString               +''' AS DATAINICIO,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('DATAFINAL').AsString                +''' AS DATAFINAL,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('FLGINTERNO').AsString               +''' AS FLGINTERNO,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('IDREGRACALCULO').AsString           +''' AS IDREGRACALCULO,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('FLGACEITAOPCAO').AsString           +''' AS FLGACEITAOPCAO,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('NUMOPCOES').AsString                +''' AS NUMOPCOES,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('CONTRIBUICAO').AsString             +''' AS CONTRIBUICAO,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('NUMRECEBIMENTO').AsString           +''' AS NUMRECEBIMENTO,'+
             ''''+OraNumero(dsContribACalcular.DataSet.FieldbyName('SALTOTAL').AsString)      +''' AS SALTOTAL,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('TEMPONAOCREDITADO').AsString        +''' AS TEMPONAOCREDITADO,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('DATANASC').AsString                 +''' AS DATANASC,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('NUMDOCUMENTO').AsString             +''' AS NUMDOCUMENTO,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('DATAMORTE').AsString                +''' AS DATAMORTE,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('INSCRICAODATA').AsString            +''' AS INSCRICAODATA,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('DTINICIOINSC').AsString             +''' AS DTINICIOINSC,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('IDREGRAPRIMPAGTO').AsString         +''' AS IDREGRAPRIMPAGTO,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('IDREGRAULTPAGTO').AsString          +''' AS IDREGRAULTPAGTO,'+
             '''01/'+Copy(sAnoMesCobrancaTela,6,2)+'/'+Copy(sAnoMesCobrancaTela,1,4)          +''' AS DATAREF, '+
             ''''+dsContribACalcular.DataSet.FieldbyName('SEQPROPOSTA').AsString              +''' AS SEQPROPOSTA,'+
             ''''+dsContribACalcular.DataSet.FieldbyName('MATRICULA').AsString                +''' AS MATRICULA, '+
             ''''+OraNumero(dsContribACalcular.DataSet.FieldbyName('SALPARTICIPACAO').AsString) +''' AS SALPARTICIPACAO,'+
             ''''+OraNumero(sSalario13)                                                       +''' AS SALARIO13,      '+
             ''''+OraNumero(dsContribACalcular.DataSet.FieldbyName('VALORREMTOTAL').AsString) +''' AS VALORREMTOTAL,  '+
             ''''+OraNumero(dsContribACalcular.DataSet.FieldbyName('RUBPARCIAL').AsString)    +''' AS RUBPARCIAL,     '+
             ''''+sPartReinsc                                                                 +''' AS PARTREINSC,     '+
             ''''+sAnoMesCobrancaTela                                                         +''' AS ANOMESREF,      '+
             ''''+psAnoMesReferencia                                                          +''' AS MESREFERENCIA,      '+
             ''''+dsContribACalcular.DataSet.FieldbyName('DATAADMISSAO').AsString             +''' AS DATAADMISSAO,   '+
             ''''+OraNumero(dsContribACalcular.DataSet.FieldbyName('FLGDIRETOR').AsString)    +''' AS FLGDIRETOR,     '+
             ''''+OraNumero(sIdParcelamento)+'''                                                   AS IDPARCELAMENTO, '+
                  OraNumero(sPercentual)                                                      +'   AS PERCENTUAL ,    '+
                  OraNumero(sVlrDividaPart)                                                   +'   AS VLRDIVIDAPART,  '+
                  OraNumero(sVlrDividaPatro)                                                  +'   AS VLRDIVIDAPATRO, '+
                  OraNumero(sVlrPrestacao)                                                    +'   AS VALORPRESTACAO, '+
                  OraNumero(sVlrSdoDevedor)                                                   +'   AS SDODEVEDOR,     '+
                  OraNumero(sSalBaseAtual)                                                    +'   AS SALPARCATUAL      ';

            qryAux2.Close;
            qryAux2.Sql.Clear;
            QRYAUX2.SQL.ADD(' SELECT EV.IDEVENTOSPREV, EV.IDSITPLANOATUAL, EV.IDSITPLANONOVO, '+
                            '        EV.IDSITPARTATUAL, EV.IDSITPARTNOVO, EV.IDSITFUNCATUAL, EV.IDSITFUNCNOVO, '+
                            '        ST.FLGINTERNO,     STA.FLGINTERNO AS FLGINTERNOANT    '+
                            ' FROM   EVENTOSPREV EV, SITPART ST,  SITPART STA  '+
                            ' WHERE  EV.IDSITPARTATUAL = STA.IDSITPART         '+
                            ' AND    EV.IDSITPARTNOVO  = ST.IDSITPART          '+
                            ' AND    EV.IDEVENTOSPREV IN ( SELECT MAX(IDEVENTOSPREV)     '+
                            '                              FROM   EVENTOSPREV '+
                            '                              WHERE  IDPESSOA    = '+ DSCONTRIBACALCULAR.DATASET.FIELDBYNAME('IDPESSOA').ASString+
                            '                              AND    IDPLANOPREV = '+ DSCONTRIBACALCULAR.DATASET.FIELDBYNAME('IDPLANOPREV').ASString +
                            '                              AND    IDPESSJUR   = '+ DSCONTRIBACALCULAR.DATASET.FIELDBYNAME('IDPESSJUR').ASString+
                            '                              AND    DATAREGISTRO = ( SELECT MAX(DATAREGISTRO) FROM EVENTOSPREV '+
                            '                                                      WHERE IDPESSOA     = '+DSCONTRIBACALCULAR.DATASET.FIELDBYNAME('IDPESSOA').ASString+
                            '                                                      AND   IDPLANOPREV  = '+DSCONTRIBACALCULAR.DATASET.FIELDBYNAME('IDPLANOPREV').ASString +
                            '                                                      AND   IDPESSJUR    = '+DSCONTRIBACALCULAR.DATASET.FIELDBYNAME('IDPESSJUR').ASString+') '+
                            '                            )');


             qryAux2.Open;
             sIsPlanoAntes := qryAux2.FieldByName('idsitplanoatual').AsString;
             sIdSitPartNovo    := qryAux2.FieldByName('IDSITPARTNOVO').AsString;
             sIdSitFuncNovo    := qryAux2.FieldByName('IDSITFUNCNOVO').AsString;

             if (sSitucao = 'MA') or (sSitucao = 'MP') or (sSitucao = 'MS')
             then begin
                 sSql:= sSql + ', '''+sIsPlanoAntes+''' AS IDSITPLANOATUAL ';
                 sSql:= sSql + ', '''+OraNumero(dsContribACalcular.DataSet.FieldbyName('SALMANTIDO').AsString)      +''' AS SALMANTIDO      ';
                 sSql:= sSql + ', '''+          dsContribACalcular.DataSet.FieldbyName('DATAINICIOMANUT').AsString  +''' AS DATAINICIOMANUT ';
             end;

             if (sSitucao = 'AS')
             then begin
                 sSql:= sSql + ', '''+OraNumero(dsContribACalcular.DataSet.FieldbyName('VALORATUAL').AsString)  +''' AS VALORATUAL ';
             end;

             sSql    := sSql + ', ' + intTostr(dsContribACalcular.DataSet.FieldbyName('NUMPARCAVENCER').asInteger)  +' AS NUMPARCAVENCER ';   //Fanuel Junio SOL157382 Kintana1257021
             sSql    := sSql + ', ' + OraNumero(dsContribACalcular.DataSet.FieldbyName('SALARIOATUAL').AsString)  +' AS SALARIOATUAL  '; //Fanuel Junio SOL157382 Kintana1257021
             sSql    := sSql + ', ' + OraNumero(dsContribACalcular.DataSet.FieldbyName('PERCEN').AsString)  +' AS PERCEN ';  //Fanuel Junio SOL157382 Kintana1257021

             sSql    := sSql + ' ,  0 AS ORIGEM, '''+sSitucao+''' AS FLGINTERNO ';

             sSql    := sSql + ' FROM DUAL ';
   end
   else begin // montar query para Patrocinadora
      sSQL := ' SELECT   SUM(HT.VALORPROVENTO) AS VALORACUMULADO, '+
              IntToStr(dsContribACalcular.DataSet.FieldbyName('IdPessJur').AsInteger)+' AS IDPESSJUR, '+
              IntToStr(dsContribACalcular.DataSet.FieldbyName('IdPlanoPREV').AsInteger)+' AS IDPLANOPREV, '+
              IntToStr(dsContribACalcular.DataSet.FieldbyName('IdContribuicao').AsInteger)+' AS IDCONTRIBUICAO, '+
              IntToStr(dsContribACalcular.DataSet.FieldbyName('IdRegraCalculo').AsInteger)+' AS IDREGRACALCULO, '+
              OraNumero(FloatToStr(dsContribACalcular.DataSet.FieldbyName('ValorBase1').AsFloat)) +' AS VALORBASE1, '+
              OraNumero(FloatToStr(dsContribACalcular.DataSet.FieldbyName('ValorBase2').AsFloat)) +' AS VALORBASE2, '+
              OraNumero(FloatToStr(dsContribACalcular.DataSet.FieldbyName('ValorBase3').AsFloat)) +' AS VALORBASE3, '+
              '          RP.CODPROVDESC,   RP.IDRUBRICA, '+
              '          SYSDATE  AS DATAREF                     '+
              ' FROM     HISTRUBSAL          HT,                 '+
              '          PATRO               PT,                 '+
              '          RUBRICAXPESS        RP                  '+
              ' WHERE    RP.IDPESSOA         = '+IntToStr(dsContribACalcular.DataSet.FieldbyName('IdPessJur').AsInteger)+' AND  '+
              '          HT.IDPESSJUR        = '+IntToStr(dsContribACalcular.DataSet.FieldbyName('IdPessJur').AsInteger)+' AND  '+
              '          HT.IDRUBRICA        = RP.IDRUBRICA AND  '+
              '          PT.IDPESSOA         = HT.IDPESSJUR AND '+
              '          HT.MESCOBRANCA      = '''+sAnoMesCobrancaTela+''' AND '+
              '          HT.IDRUBRICA        = PT.IDRUBSALMANUT '+
              'GROUP BY RP.CODPROVDESC,   RP.IDRUBRICA ';
   end;
end;



function  TfrmPreparaEnvia.MontaSQLAssoc(piIdPessJur, piIdPlanoPrev,
                                  piIdPessoa, piSeqProposta,  piIdContribuicao,
                                  piIdContribAssoc1,  piIdContribAssoc2,
                                  piIdContribAssoc3,  piQtdeContribAssoc : Integer;
                                  psFlgPagadorAssoc1, psFlgPagadorAssoc2,
                                  psFlgPagadorAssoc3, psAnoMesReferencia : String;
                                  var
                                  sValorAssoc1,  sValorAssoc2,  sValorAssoc3,
                                  sValorOp1Ass1, sValorOp1Ass2, sValorOp1Ass3 : String;
                                  psFlgInterno : String )  : String;
var sSQLFinal, sDataInicioManut,
    sNomeTabela,sCampoPessJur  : String;
    sAssoc1Op1, sAssoc1Op2, sAssoc1Op3, sValorAssociado,
    sAssoc2Op1, sAssoc2Op2, sAssoc2Op3, sValorAssociado2,
    sAssoc3Op1, sAssoc3Op2, sAssoc3Op3, sValorAssociado3  : String;
    sstrseqproposta,
    sSalPart,sRemTotal : String;
    sAnoMesReferenciaAnt : String;
    sPartReinsc    : String;
    bPartReinsc    : boolean;
    iValorTotal    : integer;
begin
  Result := '';
  sSQLFinal := '';

  bPartReinsc := PartReinscrito (piIdPessJur, piIdPlanoPrev, piIdPessoa, dtmAPrev.qry);
  if bPartReinsc
  then sPartReinsc := '1'
  else sPartReinsc := '0';

  sAnoMesReferenciaAnt := SAnoMesAnterior(psAnoMesReferencia);
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

  // Calcular 1a. opcao
  if piQtdeContribAssoc >= 1
  then begin
     if psFlgPagadorAssoc1 = 'E'
     then begin
        sNomeTabela      := 'CONTRIBPREVPATRO';
        sCampoPessJur    := 'IDPESSOA';
        sstrseqproposta  := '';
        piidpessoa       := piidpessjur;
     end
     else begin
        sNomeTabela      := 'CONTRIBPREVPARTP';
        sCampoPessJur    := 'IDPESSJUR';
        sstrseqproposta  := ' C.SEQPROPOSTA = H.SEQPROPOSTA(+) AND ';
     end;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT H.VALORESPERADO, C.VALORBASE1, C.VALORBASE2, C.VALORBASE3 '+
                    ' FROM   HSTCONTRIBPREV H, '+sNomeTabela+' C '+
                    ' WHERE  C.'+sCampoPessJur+'  = '+IntToStr(piIdPessJur)  +' AND '+
                    '        C.IDPLANOPREV        = '+IntToStr(piIdPlanoPrev)+' AND '+
                    '        C.IDPESSOA           = '+IntToStr(piIdPessoa)   +' AND '+
                    '        C.IDCONTRIBUICAO     = '+IntToStr(piIdContribAssoc1)+'   AND '+
                    '        H.MESREFERENCIA(+)   = '''+psAnoMesReferencia       +''' AND '+
                    '        C.'+sCampoPessJur+'  = H.IDPESSJUR(+)   AND '+
                    '        C.IDPLANOPREV        = H.IDPLANOPREV(+) AND '+
                    '        C.IDPESSOA           = H.IDPESSOA(+)    AND '+
                    SSTRSEQPROPOSTA +
                    '        C.IDCONTRIBUICAO     = H.IDCONTRIBUICAO(+) ');
     qryAux.Open;
     if qryAux.FieldByName('ValorEsperado').AsString = ''
     then sValorAssociado := '0'
     else sValorAssociado := OraNumero(qryAux.FieldByName('ValorEsperado').AsString);

     if qryAux.FieldByName('ValorBase1').AsString = ''
     then sAssoc1Op1 := '0'
     else sAssoc1Op1 := OraNumero(qryAux.FieldByName('ValorBase1').AsString);

     if qryAux.FieldByName('ValorBase2').AsString = ''
     then sAssoc1Op2 := '0'
     else sAssoc1Op2 := OraNumero(qryAux.FieldByName('ValorBase2').AsString);

     if qryAux.FieldByName('ValorBase3').AsString = ''
     then sAssoc1Op3 := '0'
     else sAssoc1Op3 := OraNumero(qryAux.FieldByName('ValorBase3').AsString);
  end;

  // Calcular 2a. opcao
  if piQtdeContribAssoc >= 2
  then begin
     if psFlgPagadorAssoc2 = 'E'
     then begin
        sNomeTabela   := 'CONTRIBPREVPATRO';
        sCampoPessJur := 'IDPESSOA';
        sstrseqproposta  := ' ';
     end
     else begin
        sNomeTabela   := 'CONTRIBPREVPARTP';
        sCampoPessJur := 'IDPESSJUR';
        sstrseqproposta  := ' C.SEQPROPOSTA = H.SEQPROPOSTA(+) AND ';
     end;
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT H.VALORESPERADO, C.VALORBASE1, C.VALORBASE2, C.VALORBASE3 '+
                    ' FROM   HSTCONTRIBPREV H, '+sNomeTabela+' C '+
                    ' WHERE  C.'+sCampoPessJur+'      = '+IntToStr(piIdPessJur)  +' AND '+
                    '        C.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)+' AND '+
                    '        C.IDPESSOA        = '+IntToStr(piIdPessoa)   +' AND '+
                    '        C.IDCONTRIBUICAO  = '+IntToStr(piIdContribAssoc2)+' AND '+
                    '        H.MESREFERENCIA(+)   = '''+psAnoMesReferencia      +''' AND '+
                    '        C.'+sCampoPessJur+' = H.IDPESSJUR(+) AND '+
                    '        C.IDPLANOPREV    = H.IDPLANOPREV(+) AND '+
                    '        C.IDPESSOA       = H.IDPESSOA(+) AND '+
                    SSTRSEQPROPOSTA+
                    '        C.IDCONTRIBUICAO = H.IDCONTRIBUICAO(+) ');
     qryAux.Open;
     if qryAux.FieldByName('ValorEsperado').AsString = ''
     then sValorAssociado2 := '0'
     else sValorAssociado2 := OraNumero(qryAux.FieldByName('ValorEsperado').AsString);

     if qryAux.FieldByName('ValorBase1').AsString = ''
     then sAssoc2Op1 := '0'
     else sAssoc2Op1 := OraNumero(qryAux.FieldByName('ValorBase1').AsString);

     if qryAux.FieldByName('ValorBase2').AsString = ''
     then sAssoc2Op2 := '0'
     else sAssoc2Op2 := OraNumero(qryAux.FieldByName('ValorBase2').AsString);

     if qryAux.FieldByName('ValorBase3').AsString = ''
     then sAssoc2Op3 := '0'
     else sAssoc2Op3 := OraNumero(qryAux.FieldByName('ValorBase3').AsString);
  end;// opcao 2

  // Calcular 3a. opcao
  if piQtdeContribAssoc >= 3
  then begin
     if psFlgPagadorAssoc3 = 'E'
     then begin
        sNomeTabela   := 'CONTRIBPREVPATRO';
        sCampoPessJur := 'IDPESSOA';
        sstrseqproposta  := ' ';
     end
     else begin
        sNomeTabela   := 'CONTRIBPREVPARTP';
        sCampoPessJur := 'IDPESSJUR';
        sstrseqproposta  := ' C.SEQPROPOSTA = H.SEQPROPOSTA(+) AND ';
     end;
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT H.VALORESPERADO, C.VALORBASE1, C.VALORBASE2, C.VALORBASE3 '+
                    ' FROM   HSTCONTRIBPREV H, '+sNomeTabela+' C '+
                    ' WHERE  C.'+sCampoPessJur+'= '+IntToStr(piIdPessJur)      +' AND '+
                    '        C.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)     +' AND '+
                    '        C.IDPESSOA        = '+IntToStr(piIdPessoa)        +' AND '+
                    '        C.IDCONTRIBUICAO  = '+IntToStr(piIdContribAssoc3) +' AND '+
                    '        H.MESREFERENCIA(+)  = '''+psAnoMesReferencia    +''' AND '+
                    '        C.'+sCampoPessJur+' = H.IDPESSJUR(+) AND '+
                    '        C.IDPLANOPREV    = H.IDPLANOPREV(+)  AND '+
                    '        C.IDPESSOA       = H.IDPESSOA(+)     AND '+
                    SSTRSEQPROPOSTA+
                    '        C.IDCONTRIBUICAO = H.IDCONTRIBUICAO(+) ');
     qryAux.Open;
     if qryAux.FieldByName('ValorEsperado').AsString = ''
     then sValorAssociado3 := '0'
     else sValorAssociado3 := OraNumero(qryAux.FieldByName('ValorEsperado').AsString);

     if qryAux.FieldByName('ValorBase1').AsString = ''
     then sAssoc3Op1 := '0'
     else sAssoc3Op1 := OraNumero(qryAux.FieldByName('ValorBase1').AsString);

     if qryAux.FieldByName('ValorBase2').AsString = ''
     then sAssoc3Op2 := '0'
     else sAssoc3Op2 := OraNumero(qryAux.FieldByName('ValorBase2').AsString);

     if qryAux.FieldByName('ValorBase3').AsString = ''
     then sAssoc3Op3 := '0'
     else sAssoc3Op3 := OraNumero(qryAux.FieldByName('ValorBase3').AsString);
  end;//opcao 3

  iValorTotal := 0;
  qryAux2.Close;
  qryAux2.SQL.Clear;
  qryAux2.SQL.Add(' SELECT NVL(BF.VALORTOTAL,0) AS VALORTOTAL'+
                  ' FROM   BENEFBFCIARIO BF '+
                  ' WHERE  BF.IDTITULAR      = (SELECT IDTITULAR FROM DEPENTIT '+
                                              ' WHERE IDPESSOA    = '+dsContribACalcular.DataSet.FieldbyName('IDPESSOA').AsString +
                                              '  and rownum <= 1' + ')'+
                  ' AND    BF.SEQPROPOSTA    = '+dsContribACalcular.DataSet.FieldbyName('SEQPROPOSTA').AsString+
                  ' AND    BF.IDPESSJUR      = '+dsContribACalcular.DataSet.FieldbyName('IDPESSJUR').AsString+
                  ' AND    BF.IDPLANOPREV    = '+dsContribACalcular.DataSet.FieldbyName('IDPLANOPREV').AsString+
                 // ' AND    BF.IDBENEFICIO    = &IDBENEFICIO--148
                  ' AND    BF.IDSITBENEFICIO <> 3 '+
                  ' order by numeroprocesso desc ' );
   qryAux2.Open;


   iValorTotal := qryAux2.FieldbyName('VALORTOTAL').Asinteger ;

   // SOL 146616  KINTANA 1003916
   If dsContribACalcular.DataSet.FieldbyName('DATAINICIOMANUT').AsString <> '' Then
      sDataInicioManut := dsContribACalcular.DataSet.FieldbyName('DATAINICIOMANUT').Asstring
   else
      sDataInicioManut := dsContribACalcular.DataSet.FieldbyName('DTINICIOINSC').AsString;
   // SOL 146616  KINTANA 1003916

  if piIdPessJur = piIdPessoa
  then begin
     sSQLFinal := ' SELECT H.MESREFERENCIA , H.IDRUBRICA , RP.CODPROVDESC, H.VALORACUMULADO, H.VALORACUMULADO AS VALORPROVENTO, '+
                  '        CP.VALORBASE1, CP.VALORBASE2, CP.VALORBASE3, '+
                  '''01/'+Copy(sAnoMesCobrancaTela,6,2)+'/'+Copy(sAnoMesCobrancaTela,1,4)+''' AS DATAREF, '+
                  ''''+sAnoMesCobrancaTela+''' AS ANOMESREF, '+
                  ''''+inttostr(iValorTotal)+''' AS VALORTOTAL, '+   // SOL 146616  KINTANA 1003916
                  ''''+sDataInicioManut+''' AS DATAINICIOMANUT, '+   // SOL 146616  KINTANA 1003916

                    IntToStr(piIdPessJur)+' AS IDPESSJUR, '+ IntToStr(piIdPlanoPrev)+' AS IDPLANOPREV, '+
                    IntToStr(piIdPessoa) +' AS IDPESSOA,  '+ IntToStr(piIdContribuicao)+' AS IDCONTRIBUICAO, '+
                    sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                    sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                    sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3, '+
                    sValorAssociado+' AS VALORASSOCIADO, '+sValorAssociado2+' AS VALORASSOCIADO2, '+
                    sValorAssociado3+' AS VALORASSOCIADO3,  '+sValorAssociado+' AS VALORASSOCIADOCOB '+  
             ' FROM   HSTRUBRICAXPESS H, RUBRICAXPESS RP, CONTRIBPREVPATRO CP '+
             ' WHERE  (H.IDPESSOA        = ' +IntToStr(piIdPessJur)+')'+
             ' AND    (H.MESREFERENCIA   = '''+sAnoMesReferenciaAnt+''')'+
             ' AND    (CP.IDPLANOPREV    = ' +IntToStr(piIdPlanoPrev)+')'+
             ' AND    (CP.IDCONTRIBUICAO = ' +IntToStr(piIdContribuicao)+')'+
             ' AND    (H.IDPESSOA        = CP.IDPESSOA)'+
             ' AND    (H.IDPESSOA        = RP.IDPESSOA)'+
             ' AND    (H.IDRUBRICA       = RP.IDRUBRICA)';
  end
  else begin

     if (psFlgInterno = 'MA') or (psFlgInterno = 'MP') or (psFlgInterno = 'MS')
     then sSalPart  := OraNumero(FloatToStr(dsContribACalcular.DataSet.FieldByName('SalMantido').AsFloat))
     else sSalPart  := OraNumero(FloatToStr(dsContribACalcular.DataSet.FieldByName('SalParticipacao').AsFloat));

     //Andre Imakawa - SIG62812 - Inicio
     //passa o salário de décimo terceiro
     if copy(psAnoMesReferencia,6,2) = '13' then
       if not((piIdPlanoPrev = 66) and  (piIdPessJur = 1)) then
         sSalPart  := OraNumero(FloatToStr(dsContribACalcular.DataSet.FieldByName('SalPartic13').AsFloat));
     //Andre Imakawa - SIG62812 - Fim
     
     sRemTotal := OraNumero(FloatToStr(dsContribACalcular.DataSet.FieldByName('SalParticipacao').AsFloat));

     sSQLFinal := ' SELECT  CP.IDPESSJUR,        CP.IDPLANOPREV,     CP.IDPESSOA, CP.IDPESSOA AS IDTITULAR, '+ // Alterado por Felipe A. Santos SOL 222014 KTN 2055090
                  '         CP.IDCONTRIBUICAO,    CP.PLACONTAD,        CP.TIPCODIGO,       CP.CODCENTRORESPON, '+
                  '         CP.PLANO,             CP.IDEMPRESAPROP,    CP.PLACONTAC,       CP.DIAVENCIMENTO, '+
                  '         CP.CODSUBCONTA,       CP.CODCENTROCUSTOD,  CP.CODCENTROCUSTOC, CP.UNIDNEGOC,     '+
                  '         CP.IDEMPRESA,         CP.CODPORTFORMA,     CP.FLGDESCFOLHA,    CP.VALORBASE1,    '+
                  '         CP.VALORBASE2,        CP.VALORBASE3,       CP.FLGCOBRA,          '+
                  '         CP.QTDEPARCELAS,    CP.FLGRECALCULA,  '+
                  '         CP.FLGRETROATIVO,     CP.DATAINICIO,       CP.DATAFINAL,       ST.FLGINTERNO,    '+
                  '         C.IDREGRACALCULO,     C.FLGACEITAOPCAO,    C.NUMOPCOES ,       CONT.NOME AS CONTRIBUICAO, '+
                  '         -1 AS NUMRECEBIMENTO, EL.SALTOTAL,  '+
                  '         EL.TEMPONAOCREDITADO, PF.DATANASC,         P.NUMDOCUMENTO,     PF.DATAMORTE, EL.DATAADMISSAO, '+
                  '         PP.SALPARTICIPACAO,   PP.SALMANTIDO,       PP.SALMANTIDO   AS  RUBPARCIAL,   '+
                  '         PP.INSCRICAODATA,     PP.DTINICIOINSC,     C.IDREGRAPRIMPAGTO,  C.IDREGRAULTPAGTO,  '+
                  '         CP.SEQPROPOSTA, '+
                  '''01/'+Copy(sAnoMesCobrancaTela,6,2)+'/'+Copy(sAnoMesCobrancaTela,1,4) +''' AS DATAREF, '+
                  ''''+sAnoMesCobrancaTela+''' AS ANOMESREF, '+
                  ''''+inttostr(iValorTotal)+''' AS VALORTOTAL, '+   // SOL 146616  KINTANA 1003916
                  ''''+sDataInicioManut+''' AS DATAINICIOMANUT, '+   // SOL 146616  KINTANA 1003916
                  sSalPart  +' AS VALORPROVENTO, '+sRemTotal+' AS VALORREMTOTAL, '+
                  sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                  sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                  sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3, '+
                  sValorAssociado +' AS VALORASSOCIADO,  '+sValorAssociado2+' AS VALORASSOCIADO2, '+
                  sValorAssociado3+' AS VALORASSOCIADO3, '+sValorAssociado+' AS VALORASSOCIADOCOB, '+  
                  ''''+sPartReinsc +''' AS PARTREINSC '+
                  ' , '''+psAnoMesReferencia+''' AS MESREFERENCIA ,  0 AS ORIGEM, '''+psFlgInterno+''' AS FLGINTERNO '+  
                  ' , EL.FLGDIRETOR, PP.IDSITPART, EL.IDSITFUNC '+  
                  ' FROM    CONTRIBPREVPARTP CP,            CONTPREV            C,    '+
                  '         CONTRIBUICAO        CONT,       PARTPREVPLAN        PP,   '+
                  '         SITPART             ST,         ELEGPATRO           EL,   '+
                  '         PESSOA              P,          PESSOAFISICA        PF,   '+
                  '         PLANPREV            PL '+
                  ' WHERE   CP.IDPESSJUR   = '+IntToStr(piIdPessJur)         +'  AND '+
                  '         CP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev)       +' AND '+
                  '         CP.IDPESSOA    = '+IntToStr(piIdPESSOA)          +' AND '+
                  '         CP.SEQPROPOSTA = '+IntToStr(piSeqProposta)       +' AND '+
                  '         CP.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao) +' AND '+
                  '         CP.IDPLANOPREV = C.IDPLANOPREV AND           '+
                  '         CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND     '+
                  '         CP.IDPLANOPREV = PL.IDPLANOPREV  AND         '+
                  '         C.IDCONTRIBUICAO = CONT.IDCONTRIBUICAO AND   '+
                  '         CP.IDPESSJUR = PP.IDPESSJUR AND              '+
                  '         CP.IDPLANOPREV = PP.IDPLANOPREV AND          '+
                  '         CP.IDPESSOA = PP.IDPESSOA AND                '+
                  '         PP.IDPESSOA = EL.IDPESSOA AND                '+
                  '         PP.IDPESSJUR = EL.IDPESSJUR AND              '+
                  '         EL.IDPESSOA = P.IDPESSOA AND                 '+
                  '         PF.IDPESSOA = P.IDPESSOA AND                 '+
                  '         PP.IDSITPART = ST.IDSITPART ';
  end; // else - if piIdPessJur <> piIdPessoa


  //== Guarda os Valores encontrados para contrib. associada 
  sValorAssoc1  := sValorAssociado;
  sValorAssoc2  := sValorAssociado2;
  sValorAssoc3  := sValorAssociado3;
  sValorOp1Ass1 := sAssoc1Op1;
  sValorOp1Ass2 := sAssoc2Op1;
  sValorOp1Ass3 := sAssoc3Op1;

  Result := sSQLFinal;
end;//MontaSQLAssoc

function  TfrmPreparaEnvia.CriaLOTE : boolean;
var
  sSql: String;
begin
   Result := False;
   // Gerar novo lote
   idLote := LeUltRegistro(nil,'CTRLINTERFACE');

   if idLote < 0 then Exit;

   iNumRegLote := 0;
   rTotalLote  := 0;
   dtmPreparaContrib.qryAux.Sql.Clear;
   dtmPreparaContrib.qryAux.Sql.Add(
     ' INSERT INTO CTRLINTERFACE(IDLOTE, IDPESSOA, FLGPREPARADO, '+
     ' MESREFERENCIA, TIPO, DATAPREPARO, DESCRICAO)              '+
     ' VALUES('+IntToStr(IdLote)+','+IntToStr(qryPlanPatro.FieldByName('IdPessJur').AsInteger)+', '+
     ' 1, '''+sAnoMesCobrancaTela+''', ''P'', SYSDATE, '''+sDescLote+''') ');

   try
      dtmPreparaContrib.qryAux.ExecSql;
   except
      Exit;
   end;


   Result := True;
end; // CriaLote



function  TfrmPreparaEnvia.AtualizaLOTE : boolean;
var iNumRegAntes : Integer;
    rValorAntes  : Double;
    rValorLote   : Double;
begin
   Result := False;
   // Grava lote anterior e gera novo lote
   if not dtmPreparaContrib.qryLote.IsEmpty  // NAO é o 1o. lote -> gravar dados anteriores
   then begin
      if not dtmPreparaContrib.qryLote.Locate('IdLote',idLote,[loCaseInsensitive])
      then begin
         memResult.Lines.Add(' ');
         memResult.Lines.Add('Aviso : Lote '+IntToStr(idlote)+
                             ' não encontrado para atualização. Verifique. ');
         Result := True;
         Exit;
      end;

      if (iNumRegLote = 0)
      then begin
         memResult.Lines.Add(' ');
         memResult.Lines.Add('Aviso : Lote '+IntToStr(idlote)+
                             ' sem contribuição a ser enviada. ');
      end
      else begin
         dtmPreparaContrib.qryLote.Edit;
         if dtmPreparaContrib.qryLote.FieldByName('NumReg').AsString  <> ''
         then iNumRegAntes := dtmPreparaContrib.qryLote.FieldByName('NumReg').AsInteger
         else iNumRegAntes := 0;
         if dtmPreparaContrib.qryLote.FieldByName('VLRTOTAL').AsString <> ''
         then rValorAntes  := dtmPreparaContrib.qryLote.FieldByName('VLRTOTAL').AsFloat
         else rValorAntes  := 0;
         dtmPreparaContrib.qryLote.FieldByName('NumReg').AsInteger := iNumRegAntes+iNumRegLote;
         rValorLote        := StrToFloat(FormatFloat('#0.00',rValorAntes+rTotalLote));
         dtmPreparaContrib.qryLote.FieldByName('VLRTOTAL').AsFloat := rValorLote;
         try
            dtmPreparaContrib.qryLote.Post;
         except
            Exit;
         end;
      end;
   end;
   Result := True;
end; // AtualizaLOTE



function TfrmPreparaEnvia.EncerraContribLote(piIdLote,piIdPessJur, piIdPlanoPrev: Integer;
                                             psMesReferencia, psFlgSitFundacao, psStrLotes : String)  : boolean;
var sSQL : String;
begin
   Result     := False;

   sSQL := ' UPDATE  CONTRIBPREVPARTP SET FLGCOBRA = 0 '+
           ' WHERE   DATAFINAL IS NOT NULL '+
           ' AND     TO_CHAR(DATAFINAL,''YYYY/MM'') = ULTMESPREPARO '+
           ' AND     FLGCOBRA    = 1                                '+
           ' AND     IDPESSJUR   = '+IntToStr(piIdPessJur)+
           ' AND     IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+

           //testa se a contribuição não é de assistiso
           //por que neste caso a data final é prevista
           //a contribuição só é efetivamente finalizada
           //pela folha de benefícios
           ' AND EXISTS (SELECT 1 FROM CONTPREV CV '+
           '            WHERE CV.IDPLANOPREV = CONTRIBPREVPARTP.IDPLANOPREV AND '+
           '            CV.IDCONTRIBUICAO = CONTRIBPREVPARTP.IDCONTRIBUICAO AND '+
           '            CV.FLGINTERNO <> ''AS'' ) ';
            

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   try
      qryAux.ExecSQL;
   except
      memResult.Lines.Add('Erro no encerramento das contribuições terminadas no mês : '+psMesReferencia);
      Exit;
   end;

   Result := True;
end;//EncerraContribLote




function TfrmPreparaEnvia.InformacoesOk : boolean;
var liResult,
    liEmpresa : longInt;
    sMsgErro, sData : String;
begin
   Result := False;

   // TESTAR INFORMAÇÕES OBRIGATÓRIAS
   if Trim(cmbMesCob.Text) = ''
   then begin
     MsgDlg('Mês de Cobrança não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     cmbMesCob.SetFocus;
     Exit;
   end;

   if Trim(spedAnoCob.Text) = ''
   then begin
     MsgDlg('Ano de Cobrança não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     spedAnoCob.SetFocus;
     Exit;
   end;

   if rgrpTipoCobranca.ItemIndex < 0
   then begin
     MsgDlg('Selecione o Tipo de Cobrança. ','Erro',mtError,[mbOk,mbHelp],0);
     rgrpTipoCobranca.SetFocus;
     Exit;
   end;

   // Verificar se o parametro de Motivo default está preenchido
   if prmIdMotivoContrib <= 0
   then begin
      MsgDlg('O Motivo[default] para Cobrança de Contribuições Previdenciárias deverá ser preenchido. Utilize a tela de Parâmetros do Modulo.','Informação',mtInformation,[mbOk,mbHelp],0);
      Exit;
   end;

    
   if (IntegraBack.Financeiro = 'N') or (not prmIntegraCAR)
   then begin
      if rgrpTipoCobranca.ItemIndex = 1
      then begin
         MsgDlg('O sistema AdmPREV não está integrado com o Contas a Receber. '+#13+
                'As cobranças de contribuição do tipo "Cobrança Bancária" não podem ser enviadas.','Erro',mtError,[mbOk,mbHelp],0);
         Exit;
      end
      else begin
         if rgrpTipoCobranca.ItemIndex = 3
         then begin
            MsgDlg('O sistema AdmPREV não está integrado com o Contas a Receber. '+#13+
                   'As cobranças de contribuição do tipo "Cobrança Bancária" não podem ser enviadas.'+#13+
                   'Selecione o Tipo de Cobrança "Desconto em Folha" ou habilite a integração com o Contas a Receber.','Erro',mtError,[mbOk,mbHelp],0);
            Exit;
         end;
      end;
   end;

   liEmpresa   := Sistema.IdEmpresa;

   Result := True;
end;



procedure TfrmPreparaEnvia.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
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



//===================== FUNCOES DE VALIDACAO DO CALCULO
function TfrmPreparaEnvia.PreencheFiltroTela : boolean;
var
   i, iPos        : Integer;
begin
   Result         := False;
   strPlano       := ' ';
   strPatro       := ' ';
   strSituacao    := ' ';

   // Preencher planos selecionados
   for i := 0 to chklstPlano.Items.Count - 1 do
   begin
      if qryPlano.Locate('Nome',chklstPlano.Items[i],[loCaseInsensitive,loPartialKey])
      then begin
        if chklstPlano.checked[i] // Adicionar plano a String de planos
        then strPlano:= strPlano + qryPlano.FieldByName('IdPlanoPrev').AsString+ ', ';
      end;
   end;//for

   if Trim(strPlano) = ''
   then begin
      for i := 0 to chklstPlano.Items.Count - 1 do
      begin
         if qryPlano.Locate('Nome',chklstPlano.Items[i],[loCaseInsensitive,loPartialKey])
         then strPlano:= strPlano + qryPlano.FieldByName('IdPlanoPrev').AsString+ ', ';
      end;//for
   end;

   if Trim(strPlano) <> ''
   then strPlano := Copy(strPlano, 1, Length(strPlano) - 2);

   // Preencher patrocinadoras selecionadas
   for i := 0 to chklstPatro.Items.Count - 1 do
   begin
      if not qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive,loPartialKey])
      then continue;

      if not chklstPatro.checked[i] then continue;

      // Adicionar String da patrocinadora
      strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', '
   end;  //for

   // Se existem patrocinadoras ja enviadas e nao existe nenhuma
   // patrocinadora na String de patrocinadoras a String de
   // patrocinadoras deverá ter todas as patrocinadoras menos
   // as ja calculadas
   if (Trim(strPatro) = '')
   then begin
     strPatro := ' ';
     for i    := 0 to chklstPatro.Items.Count - 1 do
     begin
        if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive,loPartialKey])
        then strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
     end;  //for
   end;

   if Trim(strPatro) <> ''
   then strPatro := Copy(strPatro, 1, Length(strPatro) - 2);

   // Preencher situacoes selecionadas
   for i := 0 to chklstSituacao.Items.Count - 1 do
   begin
      if chklstSituacao.checked[i]
      then begin
         strSituacao := strSituacao +''''+vetSituacaoPreparo[i]+''', ';
      end;
   end;//for

   {== Se situacao ficou em branco atribuir todas}
   if Trim(strSituacao) = '' then
   for i := 0 to chklstSituacao.Items.Count - 1 do
       strSituacao  := strSituacao + ''''+vetSituacaoPreparo[i]+''', '
   else // SOL 130118 Kintana 817114
   if CbBpd.Checked then
      strSituacao := strSituacao +'''MS'''+ ', '; // SOL 130118 Kintana 817114

   if Trim(strSituacao) <> ''
   then strSituacao := Copy(strSituacao, 1, Length(strSituacao) - 2);

   Result := True;
end; // PreencheFiltroTela



function TfrmPreparaEnvia.PreparaQry(piIdPessJur      : Integer;
                                     piIdPlanoPrev    : Integer;
                                     piIdContribuicao : Integer;
                                     psSitFundacao    : String
                                    ): Boolean;
var
  iFlgDescFolha1  : Integer;
  iFlgDescFolha2  : Integer;
  iDiaIni         : Integer;
  iDiaFim         : Integer;
  MsgQry          : String;
  sSQL            : String;
  sSQLShared      : String;
  sAnoMes         : String;
  sAno, sMes      : String;
begin
  Result  := False;

  sAnoMes := QuotedStr(sAnoMesCobrancaTela);
  sMes    := QuotedStr(Copy(sAnoMesCobrancaTela, 6, 2));
  sAno    := QuotedStr(Copy(sAnoMesCobrancaTela, 1, 4));

  case rgrpTipoCobranca.ItemIndex of

    0:
    begin  // Desconto em Folha
      iFlgDescFolha1 := 1;
      iFlgDescFolha2 := 1;
    end;

    1:
    begin  // Forma
      iFlgDescFolha1 := 0;
      iFlgDescFolha2 := 0;
    end;

    2:
    begin  // Forma
      iFlgDescFolha1 := 0;
      iFlgDescFolha2 := 0;
    end;

    else  // Todos
      iFlgDescFolha1 := 1;
      iFlgDescFolha2 := 0;

  end;  // case rgrpTipoCobranca.ItemIndex



  //pega contribuições cobradas em folha para mantidos parciais
  //caso a situação sejua 'MP', mas a sit. da contribuição seja 'MA'
  if (qryPlanPatro.FieldbyName('FlgInterno').AsString = 'MP') and (psSitFundacao = 'MA') then
  begin
    iFlgDescFolha1 := 1;
    iFlgDescFolha2 := 0;
  end;

  // Kintana 1461555 SOL 166858 - Otacilio
  if rgrpDataVencimento.ItemIndex = 0 then
  begin // preparas contribuicoes independentes do dia de vencimento
    iDiaIni := 0;
    iDiaFim := 32;
  end
  else
  begin
    iDiaIni := StrToInt(Copy(dtVencBoleta.Text, 1, Pos('/', dtVencBoleta.Text) - 1)); //spedDiaIni.Value;
    iDiaFim := StrToInt(Copy(dtVencBoleta.Text, 1, Pos('/', dtVencBoleta.Text) - 1));//spedDiaFim.Value;
  end;

  // -----------------------------------------------------------------------------------------------

  sSQLShared :=
  'SELECT '                                                                                 + #13 +
  '  CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBUICAO, CP.PLACONTAD, '          + #13 +
  '  CP.TIPCODIGO, CP.CODCENTRORESPON, CP.PLANO, CP.IDEMPRESAPROP, CP.PLACONTAC, '          + #13 +
  '  CP.DIAVENCIMENTO, CP.CODSUBCONTA, CP.CODCENTROCUSTOD, CP.CODCENTROCUSTOC, '            + #13 +
  '  CP.UNIDNEGOC, CP.IDEMPRESA, CP.CODPORTFORMA,CP.FLGDESCFOLHA, CP.VALORBASE1, '          + #13 +
  '  CP.VALORBASE2, CP.VALORBASE3, CP.FLGCOBRA, CP.IDPLANPREVCONTAB, '                      + #13 +
  '  CP.QTDEPARCELAS, CP.FLGRECALCULA, CP.FLGRETROATIVO, '                                  + #13 +
  '  CP.DATAINICIO,CP.DATAFINAL,  CP.ULTMESPREPARO, ST.FLGINTERNO, '                        + #13 +
  '  C.IDREGRACALCULO, C.FLGACEITAOPCAO,C.NUMOPCOES , '                                     + #13 +
  '  CP.ULTANO13, '                                                                         + #13 +
  '  CONT.NOME AS CONTRIBUICAO, -1 AS NUMRECEBIMENTO , '                                    + #13 +
  '  EL.IDSITFUNC, EL.DATAADMISSAO,  EL.DATADEMISSAO, '                                     + #13 +
  '  EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC, P.NUMDOCUMENTO, PF.DATAMORTE, '        + #13 +
  '  PP.SALPARTICIPACAO, '                                                                  + #13 +
  '  PP.SALMANTIDO AS VALORPROVENTO,  PP.SALMANTIDO ,  PP.INSCRICAODATA, '                  + #13 +
  '  PP.DTINICIOINSC, '                                                                     + #13 +
  '  PP.SALMANTIDO AS VALORREMTOTAL, PP.SALPARTIC13, '                                      + #13 +
  '  C.IDREGRAPRIMPAGTO, C.IDREGRAULTPAGTO, TO_CHAR(SYSDATE, ''dd/mm/yyyy'') AS DATAREF, '  + #13 +
  '  CP.SEQPROPOSTA, PP.SALMANTIDO AS RUBPARCIAL, EL.MATRICULA, '                           + #13 +
  '  TP.QTDEMESES, PP.IDSITPART, '                                                          + #13 +
  '  C.FLGNAOEXIGEREC, C.FLGCOBRA13DTFIM, '                                                 + #13 +
  '  C.IDREGRAPRIMPGTO13, C.IDREGRAULTPGTO13, C.IDREGRACALCULO13, '                         + #13 +
  '  PP.DATAINICIOMANUT, '                                                                  + #13 +
  '  C.IDREGRAULTPGTO13, C.IDREGRAPRIMPGTO13, C.FLGPARCELAMENTO, EL.FLGDIRETOR '            + #13 +
  '  ,NVL(PCL.PERCENTUAL,0) AS PERCEN ,PCL.VLRSALBASE AS SALARIOATUAL, PCL.NUMPARCELAS AS NUMPARCAVENCER ' + #13 + //Fanuel Junior SOL 157382 Kintana 1257021


  'FROM '                                                                                   + #13 +
  '  PLANPREV         PL,   '                                                               + #13 +
  '  TPPERIODICIDADE  TP,   '                                                               + #13 +
  '  SITPART          ST,   '                                                               + #13 +
  '  CONTPREV         C,    '                                                               + #13 +
  '  CONTRIBUICAO     CONT, '                                                               + #13 +
  '  PATRO            PAT,  '                                                               + #13 +
  '  ELEGPATRO        EL,   '                                                               + #13 +
  '  PARTPREVPLAN     PP,   '                                                               + #13 +
  '  PLANPREVPATRO    PLP,  '                                                               + #13 +
  '  PESSOAFISICA     PF,   '                                                               + #13 +
  '  PESSOA           P,    '                                                               + #13 +
  '  CONTRIBPREVPARTP CP,   '                                                               + #13 +
  '  SITFUNC          STF   '                                                               + #13 +
  '  ,PARCELAMENTO     PCL   '                                                               + #13 +  //Fanuel Junio SOL157382 Kintana1257021

  'WHERE '                                                                                  + #13 +
  '      PP.IDPESSJUR           = ' + IntToStr(piIdPessJur)                                 + #13 +
  '  AND PP.IDPLANOPREV         = ' + IntToStr(piIdPlanoPrev)                               + #13 +
  '  AND CP.IDCONTRIBUICAO      = ' + IntToStr(piIdContribuicao)                            + #13 +
  '  AND CP.FLGCOBRA            = 1 '                                                       + #13 +

  '  AND CP.DIAVENCIMENTO       BETWEEN ' + IntToStr(iDiaIni) + ' AND ' + IntToStr(iDiaFim)               + #13 +
  '  AND CP.FLGDESCFOLHA        IN (' + IntToStr(iFlgDescFolha1) + ', ' + IntToStr(iFlgDescFolha2) + ') ' + #13 +
  '  AND ( CP.DATAFINAL         IS NULL OR TO_CHAR(CP.DATAFINAL, ''YYYY/MM'') >= ' + sAnoMes + ' ) '      + #13 +

  '  AND PP.IDSITPART           = ST.IDSITPART '                                            + #13 +
  '  AND PAT.IDPESSOA           = PP.IDPESSJUR '                                            + #13 +
  '  AND PP.IDPESSJUR           = PLP.IDPESSJUR '                                           + #13 +
  '  AND PP.IDPLANOPREV         = PLP.IDPLANOPREV '                                         + #13 +
  '  AND CP.IDPESSJUR           = PP.IDPESSJUR '                                            + #13 +

  ' AND PP.IDPESSJUR     = PCL.IDPESSJUR(+)    '                                            + #13 + //Fanuel Junio SOL157382 Kintana1257021
  ' AND PP.IDPLANOPREV   = PCL.IDPLANOPREV(+)  '                                            + #13 + //Fanuel Junio SOL157382 Kintana1257021
  ' AND PP.IDPESSOA      = PCL.IDPESSOA(+)     '                                            + #13 + //Fanuel Junio SOL157382 Kintana1257021

  '  AND CP.IDPLANOPREV         = PP.IDPLANOPREV '                                          + #13 +
  '  AND CP.IDPESSOA            = PP.IDPESSOA '                                             + #13 +
  '  AND CP.SEQPROPOSTA         = PP.SEQPROPOSTA '                                          + #13 +
  '  AND CP.IDPLANOPREV         = C.IDPLANOPREV '                                           + #13 +
  '  AND CP.IDCONTRIBUICAO      = C.IDCONTRIBUICAO '                                        + #13 +
  '  AND CP.IDTPPERIODICIDADE   = TP.IDTPPERIODICIDADE(+) '                                 + #13 +
  '  AND PP.IDPESSJUR           = EL.IDPESSJUR '                                            + #13 +
  '  AND PP.IDPESSOA            = EL.IDPESSOA '                                             + #13 +
  '  AND P.IDPESSOA             = EL.IDPESSOA '                                             + #13 +
  '  AND P.IDPESSOA             = PF.IDPESSOA '                                             + #13 +
  '  AND C.IDCONTRIBUICAO       = CONT.IDCONTRIBUICAO '                                     + #13 +
  '  AND PL.IDPLANOPREV         = PP.IDPLANOPREV '                                          + #13 +
  '  AND STF.IDSITFUNC          = EL.IDSITFUNC '                                            + #13;

  //se o usuário vai preparar apenas incentivados
  if rgrpTipoCobranca.ItemIndex = 2 then sSQLShared := sSQLShared +
  '  AND STF.FLGINTERNO         IN (6, 7) '                                                 + #13;

  // André Pontes - pendência 25604 - 25/12/2007
  if chkPlanoDesativado.Checked then sSQLShared := sSQLShared +
  '  AND PP.FLGDESATIVADO       = 0 '                                                       + #13;

  // -----------------------------------------------------------------------------------------------

  with dtmPreparaContrib do
  begin

    if psSitFundacao = 'PARCELA' then
    begin
      qryNCalcMantido.Close;
      qryNCalcMantido.SQL.Clear;

      sSQL := sSQLShared +
      '  AND ( '                                                                                + #13 +
      '        ( CP.ULTMESPREPARO  < ' + sAnoMes + ' ) '                                        + #13 +
      '        OR '                                                                             + #13 +
      '        ( ' + sMes + ' = ''13'' ) AND ( TO_CHAR(ULTANO13, ''0000'') < ' + sAno + ' ) '   + #13 +
      '      ) '                                                                                + #13 +

      '  AND ST.FLGINTERNO          NOT IN (''AT'', ''MA'', ''MP'') ';

      qryNCalcMantido.SQL.Text := sSQL;
      qryNCalcMantido.Open;
      dsContribACalcular.DataSet := qryNCalcMantido;
    end
    else  // if psSitFundacao = 'PARCELA'
    begin
      if (psSitFundacao = 'PT') then
      begin // CONTRIBUICAO DA PATROCINADORA
      end
      else
      begin
        // CONTRIBUICAO DE MANTIDO
        if ((psSitFundacao = 'MA') or (psSitFundacao = 'MP') or (psSitFundacao = 'MS'))
           and (rgrpTipoCobranca.ItemIndex <> 0) then
        begin
          if not(chkApenas13.Checked) then
          begin
            qryNCalcMantido.Close;
            qryNCalcMantido.SQL.Clear;

            sSQL := sSQLShared +
            '  AND ( '                                                                                + #13 +
            '        ( CP.ULTMESPREPARO  < ' + sAnoMes + ' ) '                                        + #13 +
            '        OR '                                                                             + #13 +
            '        ( '                                                                              + #13 +
            '          ( ' + sMes + ' = ''13'' ) AND '                                                + #13 +
            '          ( TO_CHAR(ULTANO13, ''0000'') < ' + sAno + ' ) '                               + #13 +
            '        ) '                                                                              + #13 +
            '      ) '                                                                                + #13;

            //pega contribuições cobradas em folha para mantidos parciais
            if (qryPlanPatro.FieldbyName('FLGINTERNO').AsString = 'MP') and (psSitFundacao = 'MA') then
            begin
              sSQL := sSQL +
            '  AND (ST.FLGINTERNO         = ''MP'' AND EL.IDPESSJURCEDIDO IS NULL) '                  + #13;
            end
            else
            begin
              sSQL := sSQL +
            '  AND (ST.FLGINTERNO         = ' + QuotedStr(psSitFundacao) + ' AND EL.IDPESSJURCEDIDO IS NULL) '  + #13;
            end;

            qryNCalcMantido.SQL.Text := sSQL;
            qryNCalcMantido.Open;
            dsContribACalcular.DataSet := qryNCalcMantido;
          end
          else
          begin
            qryNCalcMantido13.Close;
            qryNCalcMantido13.SQL.Clear;

            sSQL := sSQLShared +
            '  AND ( TO_CHAR(CP.ULTANO13, ''0000'') < ' + sAno + ' OR CP.ULTANO13 IS NULL ) '         + #13;

            // pega contribuições cobradas em folha para mantidos parciais
            if (qryPlanPatro.FieldbyName('FLGINTERNO').AsString = 'MP') and (psSitFundacao = 'MA') then
            begin
              sSQL := sSQL +
            '  AND (ST.FLGINTERNO = ''MP'' AND EL.IDPESSJURCEDIDO IS NULL) ';
            end
            else
            begin
              sSQL := sSQL +
            '  AND (ST.FLGINTERNO = ' + QuotedStr(psSitFundacao) + ' AND EL.IDPESSJURCEDIDO IS NULL) ';
            end;

            qryNCalcMantido13.SQL.Text := sSQL;
            qryNCalcMantido13.Open;
            dsContribACalcular.DataSet := qryNCalcMantido13;
          end;

          MsgQry := ' de mantido ';

        end
        else  // if ((psSitFundacao = 'MA') or (psSitFundacao = 'MP') or (psSitFundacao = 'MS'))
        begin
          // Se so manda percentual usar query que nao lê da HistRubSal
          if (qryContribuicao.FieldbyName('FlgTpVlr').AsString = 'B') or
             (qryContribuicao.FieldbyName('FlgTpVlr').AsString = '') then
          begin
            with qryAtivoBase Do
            begin
              Close;
              SQL.Clear;
              SQL.Add(
              ' SELECT  CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBUICAO, CP.PLACONTAD, '+
              '         CP.TIPCODIGO, CP.CODCENTRORESPON, CP.PLANO, CP.IDEMPRESAPROP, CP.PLACONTAC,                   '+
              '         CP.DIAVENCIMENTO, CP.CODSUBCONTA, CP.CODCENTROCUSTOD, CP.CODCENTROCUSTOC,                     '+
              '         CP.UNIDNEGOC, CP.IDEMPRESA, CP.CODPORTFORMA,CP.FLGDESCFOLHA, CP.VALORBASE1,                   '+
              '         CP.VALORBASE2, CP.VALORBASE3, CP.FLGCOBRA,  '+
              '         CP.QTDEPARCELAS, CP.FLGRECALCULA, CP.FLGRETROATIVO,  CP.IDPLANPREVCONTAB,                     '+
              '         CP.DATAINICIO,CP.DATAFINAL,   CP.ULTMESPREPARO,  ST.FLGINTERNO,                               '+
              '         CP.ULTANO13,  EL.DATAADMISSAO,                                                                '+
              '         C.IDREGRACALCULO, C.FLGACEITAOPCAO,C.NUMOPCOES ,                                              '+
              '         CONT.NOME AS CONTRIBUICAO, -1 AS NUMRECEBIMENTO ,  '+
              '         EL.IDSITFUNC, EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC, P.NUMDOCUMENTO, PF.DATAMORTE,   '+
              '         PP.SALPARTICIPACAO, '+
              '         PP.SALPARTICIPACAO AS VALORREMTOTAL, PP.INSCRICAODATA, PP.DTINICIOINSC,                       '+
              '         C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO,TO_CHAR(SYSDATE,''dd/mm/yyyy'') AS DATAREF,              '+
              '         CP.SEQPROPOSTA, 0 AS RUBPARCIAL, EL.MATRICULA,     '+
              '         TP.QTDEMESES, PP.IDSITPART,                         '+
              '         C.FLGNAOEXIGEREC, PP.SALPARTIC13, C.IDREGRACALCULO13,                '+
              '         C.FLGPARCELAMENTO                                                    '+
              '         , EL.FLGDIRETOR                                                      '+
              '         , PP.SALMANTIDO , PP.SALMANTIDO AS VALORPROVENTO,  PP.DATAINICIOMANUT '+
              ' FROM   PLANPREV PL,                                                          '+
              '        TPPERIODICIDADE TP,                                                   '+
              '        SITPART  ST,                                                          '+
              '        CONTPREV C,                                                           '+
              '        CONTRIBUICAO CONT,                                                    '+
              '        PATRO PAT,                                                            '+
              '        ELEGPATRO EL,                                                         '+
              '        PLANPREVPATRO PLP,                                                    '+
              '        PARTPREVPLAN PP,                                                      '+
              '        PESSOAFISICA PF,                                                      '+
              '        PESSOA P,                                                             '+
              '        CONTRIBPREVPARTP CP                                                   '+
              ' WHERE ((ST.FLGINTERNO       = ' + QuotedStr(psSitFundacao) + ' )   OR        '+
              '       ((EL.IDPESSJURCEDIDO IS NOT NULL) AND (ST.FLGINTERNO = ''MA'')))  AND  '+
              '       (CP.IDCONTRIBUICAO   = ' + IntToStr(piIdContribuicao) + ')  AND        '+
              '       (PP.IDPESSJUR        = ' + IntToStr(piIdPessJur) + ')       AND        '+
              '       (PP.IDPLANOPREV      = ' + IntToStr(piIdPlanoPrev) + ')     AND        '+
              '       (C.IDCONTRIBUICAO    = ' + IntToStr(piIdContribuicao) + ')  AND        ');

              // André Pontes - pendência 25604 - 25/12/2007
              if chkPlanoDesativado.Checked then SQL.Add(
              '       (PP.FLGDESATIVADO    = 0) AND ');

              if  not chkApenas13.Checked
              then SQL.Add('( ( CP.ULTMESPREPARO    < ''' + sAnoMesCobrancaTela + ''')   or         '+
              '        ( ((SUBSTR('''+sAnoMesCobrancaTela+''',6,2)) = ''13'' )    and        '+
              '          (TO_CHAR(CP.ULTANO13) < (SUBSTR('''+sAnoMesCobrancaTela+''',1,4))  )'+
              '        )                                                                     '+
              '      )  AND                                                                  ')
              else SQL.Add('( (CP.ULTANO13 IS NULL) OR (TO_CHAR(CP.ULTANO13) < (SUBSTR('''+sAnoMesCobrancaTela+''',1,4))  ) ) AND ');

              SQL.Add('       (CP.FLGCOBRA         = 1)                 AND                          '+
              '       (PP.IDSITPART        = ST.IDSITPART)      AND                          '+
              '       (PAT.IDPESSOA        = PP.IDPESSJUR)      AND                          '+
              '       (PP.IDPESSJUR        = PLP.IDPESSJUR)     AND                          '+
              '       (PP.IDPLANOPREV      = PLP.IDPLANOPREV)   AND                          '+
              '       (CP.IDPESSJUR        = PP.IDPESSJUR)      AND                          '+
              '       (CP.IDPLANOPREV      = PP.IDPLANOPREV)    AND                          '+
              '       (CP.IDPESSOA         = PP.IDPESSOA)       AND                          '+
              '       (CP.SEQPROPOSTA      = PP.SEQPROPOSTA)    AND                          '+
              '       ( CP.DIAVENCIMENTO >= '+IntToStr(iDiaIni) + ' AND CP.DIAVENCIMENTO <= '+IntToStr(iDiaFim)+') AND              '+
              '       ((CP.FLGDESCFOLHA = '+ IntToStr(iFlgDescFolha1) +') OR (CP.FLGDESCFOLHA = '+IntToStr(iFlgDescFolha2)+')) AND '+
              '      (((CP.FLGDESCFOLHA = 1)  OR                                     '+
              '        (CP.FLGDESCFOLHA = 0)) ) AND                                                           '+
              '       ((TO_CHAR(CP.DATAFINAL,''YYYY/MM'') >= '''+sAnoMesCobrancaTela+''' ) OR (CP.DATAFINAL IS NULL)) AND '+
              '       (CP.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+))  AND                                   '+
              '       (P.IDPESSOA          = PP.IDPESSOA) AND                                                 '+
              '       (PF.IDPESSOA         = PP.IDPESSOA) AND                                                 '+
              '       (EL.IDPESSOA         = PP.IDPESSOA) AND                                                 '+
              '       (EL.IDPESSJUR        = PP.IDPESSJUR) AND                                                '+
              '       (C.IDPLANOPREV       = PP.IDPLANOPREV) AND                                              '+
              '       (CONT.IDCONTRIBUICAO = C.IDCONTRIBUICAO) AND                                            '+
              '       (PL.IDPLANOPREV      = PP.IDPLANOPREV)  AND                                             '+
              '       (TO_CHAR(PP.INSCRICAODATA,''YYYY/MM'') <= '''+sAnoMesCobrancaTela+''') AND              '+
              '       ((PP.DATACANCELAMENTO IS  NULL) OR (TO_CHAR(PP.DATACANCELAMENTO,''YYYY/MM'') >= '''+sAnoMesCobrancaTela+''')) ' );

              Open;
            end;

            dsContribACalcular.DataSet := qryAtivoBase;

          end
          else  // if (qryContribuicao.FieldbyName('FlgTpVlr').AsString = 'B') or (qryContribuicao.FieldbyName('FlgTpVlr').AsString = '')
          begin
                With qryNCalcAtivo do
                begin
                  Close;
                  SQL.Clear;
                  SQL.ADD(
                  ' SELECT  CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBUICAO, CP.PLACONTAD,  '+
                  '         CP.TIPCODIGO, CP.CODCENTRORESPON, CP.PLANO, CP.IDEMPRESAPROP, CP.PLACONTAC,                    '+
                  '         CP.DIAVENCIMENTO, CP.CODSUBCONTA, CP.CODCENTROCUSTOD, CP.CODCENTROCUSTOC,                      '+
                  '         CP.UNIDNEGOC, CP.IDEMPRESA, CP.CODPORTFORMA,CP.FLGDESCFOLHA, CP.VALORBASE1,                    '+
                  '         CP.VALORBASE2, CP.VALORBASE3, CP.FLGCOBRA,                                                     '+
                  '         CP.QTDEPARCELAS, CP.FLGRECALCULA, CP.FLGRETROATIVO, CP.IDPLANPREVCONTAB,                       '+
                  '         CP.DATAINICIO,CP.DATAFINAL,   CP.ULTMESPREPARO,  ST.FLGINTERNO,                                '+
                  '         CP.ULTANO13,  EL.DATAADMISSAO,                                                                 '+
                  '         C.IDREGRACALCULO, C.FLGACEITAOPCAO,C.NUMOPCOES ,                                               '+
                  '         CONT.NOME AS CONTRIBUICAO, -1 AS NUMRECEBIMENTO ,                                              '+
                  '         EL.IDSITFUNC, EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC, P.NUMDOCUMENTO, PF.DATAMORTE,    '+
                  '         PP.SALPARTICIPACAO,                                                                            '+
                  '         PP.SALPARTICIPACAO  AS  VALORREMTOTAL, PP.SALPARTIC13,                                         '+
                  '         PP.INSCRICAODATA, PP.DTINICIOINSC,                                                             '+
                  '         C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO,TO_CHAR(SYSDATE,''dd/mm/yyyy'') AS DATAREF,               '+
                  '         CP.SEQPROPOSTA, 0 AS RUBPARCIAL, EL.MATRICULA,  '+
                  '         TP.QTDEMESES, PP.IDSITPART,                     '+
                  '         C.FLGNAOEXIGEREC ,   C.FLGCOBRA13DTFIM,                          '+
                  '         C.IDREGRAPRIMPGTO13, C.IDREGRAULTPGTO13, C.IDREGRACALCULO13,     '+
                  '         C.IDREGRAULTPGTO13, C.IDREGRAPRIMPGTO13         '+
                  '         , C.FLGPARCELAMENTO  '+
                  '         , EL.FLGDIRETOR                                                                               '+
                  '         , PP.SALMANTIDO, PP.SALMANTIDO AS VALORPROVENTO,  PP.DATAINICIOMANUT '+
                  ' FROM   PLANPREV PL,                                                '+
                  '        TPPERIODICIDADE TP,                                         '+
                  '        SITPART  ST,                                                '+
                  '        CONTPREV C,                                                 '+
                  '        CONTRIBUICAO CONT,                                          '+
                  '        PATRO PAT,                                                  '+
                  '        ELEGPATRO EL,                                               '+
                  '        PLANPREVPATRO PLP,                                          '+
                  '        PARTPREVPLAN PP,                                            '+
                  '        PESSOAFISICA PF,                                            '+
                  '        PESSOA P,                                                   '+
                  '        CONTRIBPREVPARTP CP                                         '+
                  ' WHERE ((ST.FLGINTERNO       = ' + QuotedStr(psSitFundacao) + ' )   OR        '+
                  '       ((EL.IDPESSJURCEDIDO IS NOT NULL) AND (ST.FLGINTERNO = ''MA'')))  AND  '+
                  '       PP.IDSITPART        = ST.IDSITPART      AND                  '+
                  '       PP.IDPESSJUR        = ' + IntToStr(piIdPessJur) + '      AND '+
                  '       PP.IDPLANOPREV      = ' + IntToStr(piIdPlanoPrev) + '    AND '+
                  '       PAT.IDPESSOA        = PP.IDPESSJUR      AND                  '+
                  '       PP.IDPESSJUR        = PLP.IDPESSJUR     AND                  '+
                  '       PP.IDPLANOPREV      = PLP.IDPLANOPREV   AND                  '+
                  '       CP.IDPESSOA         = PP.IDPESSOA       AND                  '+
                  '       CP.IDCONTRIBUICAO   = ' + IntToStr(piIdContribuicao) + ' AND ');

                  // André Pontes - pendência 25604 - 25/12/2007
                  if chkPlanoDesativado.Checked then SQL.Add(
                  '       PP.FLGDESATIVADO    = 0 AND ');

                  SQL.Add(
                  '       CP.SEQPROPOSTA      = PP.SEQPROPOSTA    AND                  '+
                  '       CP.IDPLANOPREV      = PP.IDPLANOPREV    AND                  '+
                  '       CP.IDPESSJUR        = PP.IDPESSJUR      AND                  '+
                  '      ( ( CP.ULTMESPREPARO  <  ''' + sAnoMesCobrancaTela + ''') or  '+
                  '        ( ((SUBSTR('''+sAnoMesCobrancaTela+''',6,2)) = ''13'') and  '+
                  '          (TO_CHAR(ULTANO13) < (SUBSTR('''+sAnoMesCobrancaTela+''',1,4))  )  '+
                  '        )                                                                    '+
                  '      )  AND                                                                 '+
                  '       CP.FLGCOBRA         = 1                 AND                           '+
                  '       ( CP.DIAVENCIMENTO >= '+IntToStr(iDiaIni) + ' AND CP.DIAVENCIMENTO <= '+IntToStr(iDiaFim)+') AND              '+
                  '       ((CP.FLGDESCFOLHA = '+ IntToStr(iFlgDescFolha1) +') OR (CP.FLGDESCFOLHA = '+IntToStr(iFlgDescFolha2)+')) AND  '+
                  '      (((CP.FLGDESCFOLHA = 1) OR (CP.FLGDESCFOLHA = 0)) )               AND  '+
                  '       ((TO_CHAR(CP.DATAFINAL,''YYYY/MM'') >= '''+sAnoMesCobrancaTela+''' ) OR (CP.DATAFINAL IS NULL)) AND  '+
                  '       CP.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+)  AND                                      '+
                  '       P.IDPESSOA          = PP.IDPESSOA       AND                                              '+
                  '       PF.IDPESSOA         = PP.IDPESSOA       AND                                              '+
                  '       EL.IDPESSOA         = PP.IDPESSOA       AND                                              '+
                  '       EL.IDPESSJUR        = PP.IDPESSJUR      AND                                              '+
                  '       C.IDCONTRIBUICAO    = ' + IntToStr(piIdContribuicao) + ' AND                             '+
                  '       C.IDPLANOPREV       = PP.IDPLANOPREV    AND                                              '+
                  '       CONT.IDCONTRIBUICAO = C.IDCONTRIBUICAO  AND                                              '+
                  '       PL.IDPLANOPREV      = PP.IDPLANOPREV AND                                                 '+
                  '       (TO_CHAR(PP.INSCRICAODATA,''YYYY/MM'') <= '''+sAnoMesCobrancaTela+''') AND               '+
                  '       ((PP.DATACANCELAMENTO IS  NULL) OR (TO_CHAR(PP.DATACANCELAMENTO,''YYYY/MM'') >= '''+sAnoMesCobrancaTela+''')) ');

                  Open;
                end;

                dsContribACalcular.DataSet := qryNCalcAtivo;

                MsgQry := 'não preparadas e não associadas. '
          end;  // if (qryContribuicao.FieldbyName('FlgTpVlr').AsString = 'B') or (qryContribuicao.FieldbyName('FlgTpVlr').AsString = '')
        end;  // if ((psSitFundacao = 'MA') or (psSitFundacao = 'MP') or (psSitFundacao = 'MS'))
      end;  // if (psSitFundacao = 'PT')
    end;  // if psSitFundacao = 'PARCELA'
  end;  // with dtmPreparaContrib

  if dsContribACalcular.DataSet.IsEmpty
  then
  begin
    dsContribACalcular.DataSet.Close;
    Exit;
  end;

  Result := True;
end;


//================================ FUNCOES DE GERACAO DO CALCULO
function TfrmPreparaEnvia.GravaHistorico(psAnoMesReferencia, psDataPrevista,  sValEsperado, sFlgNaoExigeRec : String;
                         iNumRecebimento,iNumParcela,iIdRegra   : Integer;
                         iIdPessoa,iIdPessJur,iIdPlanoPrev,iIdContribuicao : Integer;
                         bTestarValor : boolean; var bValorZERO : boolean) : boolean;

var
   rValor : real;

   sDataPrevisaoRece,
   sMesCobranca,
   sCodPortForma,
   sIdRegraCalculo,
   sSitRecebimento,
   sValorRecebido : String;
   sFlgdescfolha  : string;  // SOL 130118 Kintana 817114
   sCoddocumentoPrev, sDataRecebimento, sValRecebido : string; // SOL 130118 Kintana 817114
   sDataemissaoCob : string;  // SOL 180156 Kintana 1668852
   sFolhaOrigem : String;
   bGravaSalContrib : Boolean; // TADEU PASSOS SOL 189702 KINTANA 1816210
   sIdPlanPrevContab : Integer; //Helio - SOL Nº 253577/17460 PPM Nº 955546
begin
   Result     := False;
   bValorZERO := False;
   bGravaSalContrib := False; // TADEU PASSOS SOL 189702 KINTANA 1816210

   // Verifica se o valor esperado foi calculado, e retornou Zero
   try
      rValor  := StrToFloat(ClienteNumero(sValEsperado));
      if rValor  < 0    then Exit;
      if (bTestarValor) and
         (qryContribuicao.FieldbyName('FLGOBRIGATORIA').AsString = 'O') and
         (rValor = 0)
      then bValorZERO := True;
   except
      Exit;
   end;


   sValEsperado := ClienteNumero(FormatFloat('#0.00',rValor));

   if (dsContribACalcular.DataSet.FieldByName('DIAVENCIMENTO').AsString <> '') and
      (dsContribACalcular.DataSet.FieldByName('DIAVENCIMENTO').AsString <> '0')
   then psDataPrevista := dsContribACalcular.DataSet.FieldByName('DIAVENCIMENTO').AsString +Copy(psDataPrevista,3,8);

   if Trim(dtVencBoleta.Text) = ''
   then sDataPrevisaoRece := psDataPrevista
   else sDataPrevisaoRece := dtVencBoleta.Text;


   sMesCobranca     := sAnoMesCobrancaTela;

   sCodPortForma := dsContribACalcular.DataSet.FieldByName('CodPortForma').AsString;

   sFlgdescfolha :=  dsContribACalcular.DataSet.FieldByName('flgDescFolha').AsString; // SOL 130118 Kintana 817114

   if iIdRegra >= 0
   then sIdRegraCalculo := inttostr(iIdRegra);

   // Atualiza Flg para Contribuições que não exigem recebimento
   if sFlgNaoExigeRec = '' then sFlgNaoExigeRec := '0';
   if sFlgNaoExigeRec = '1'
   then begin
      sSitRecebimento  := '2'; // JA ENVIADO PARA PDV
      sValorRecebido   := OraNumero(sValEsperado);
   end
   else
   begin
      sSitRecebimento := '0'; // NAO ENVIADO
      sValorRecebido  := '0';
   end;

   // TADEU PASSOS SOL 189702 KINTANA 1816210
   if (rgrpTipoOperacao.ItemIndex = 0) or (rgrpTipoOperacao.ItemIndex = 2) then  // Tipo de Operação = Preparo
   begin
     if (dsContribACalcular.DataSet.FieldByName('flginterno').AsString = 'MA') or      // Autopatrocinado
        (dsContribACalcular.DataSet.FieldByName('flginterno').AsString = 'MP') then
     begin
       qrySalContrib.Close;
       qrySalContrib.ParamByName('IDPESSJUR').AsInteger   := dsContribACalcular.DataSet.FieldByName('IDPESSJUR').AsInteger;
       qrySalContrib.ParamByName('IDPESSOA').AsInteger    := dsContribACalcular.DataSet.FieldByName('IDPESSOA').AsInteger;
       qrySalContrib.ParamByName('IDPLANOPREV').AsInteger := dsContribACalcular.DataSet.FieldByName('IDPLANOPREV').AsInteger;
       qrySalContrib.ParamByName('SEQPROPOSTA').AsInteger := dsContribACalcular.DataSet.FieldByName('SEQPROPOSTA').AsInteger;
       qrySalContrib.ParamByName('FLGINTERNO').AsString   := dsContribACalcular.DataSet.FieldByName('FLGINTERNO').AsString;
       qrySalContrib.Open;

       if not qrySalContrib.IsEmpty then
         bGravaSalContrib := True;
     end;
   end;
   // TADEU PASSOS SOL 189702 KINTANA 1816210


   // Se o no. do recebimento for < 0, INSERIR nova linha no histórico
   // Caso contrário, ALTERAR
   if iNumRecebimento <= 0 then
   begin
      //if dsContribACalcular.DataSet.FieldByName('flgDescFolha').AsString = '0' then
      if sFlgdescfolha = '0' then // SOL 130118 Kintana 817114
      sFolhaOrigem := 'C'
      else  sFolhaOrigem := 'P';

      iNumRecebimento := LeUltRegistro(qryAux,'HSTCONTRIBPREV');
      // SOL 171339 Kintana 1534555
      sDataRecebimento  := 'Null';
      sCoddocumentoPrev := 'Null';//sCoddocumentoPrev := '20';
      // SOL 171339 Kintana 1534555
      if CbBpd.checked then   // SOL 130118 Kintana 817114
      begin
          sFolhaOrigem      := 'A';
          sSitRecebimento   := '0';
          sFlgdescfolha     := '0'; // 2


      end;     // SOL 130118 Kintana 817114

      //BRUNO AZEVEDO SOL 184271
      if sSitRecebimento = '0' then    // SOL 180156 Kintana 1668852
         sDataemissaoCob := 'NULL'  // SOL 180156 Kintana 1668852
      else if (sSitRecebimento = '1') or (sSitRecebimento = '2') then // SOL 180156 Kintana 1668852
         sDataemissaoCob := 'SYSDATE';  // SOL 180156 Kintana 1668852

      //Inicio - Helio - SOL Nº 253577/17460 PPM Nº 955546
      sIdPlanPrevContab :=
          ObtemIdPlanoprevContbContribPrevpart(dsContribACalcular.DataSet.FieldByName('IdPessoa').AsInteger,
                                               dsContribACalcular.DataSet.FieldByName('IdPessJur').AsInteger,
                                               dsContribACalcular.DataSet.FieldByName('IdPlanoPrev').AsInteger,
                                               dsContribACalcular.DataSet.FieldByName('IdContribuicao').AsInteger,
                                               dsContribACalcular.DataSet.FieldByName('SEQPROPOSTA').AsInteger);
      //Fim - Helio - SOL Nº 253577/17460 PPM Nº 955546

      qryaux.close;
      qryaux.sql.text := '   INSERT INTO HSTCONTRIBPREV  '+
          '  (IDREGRACALCULO , CODPORTFORMA , DATAPREVISAORECE , VALORESPERADO, '+
     //     '  FLGCALCRESERVA  , VALORCALCULADO  ,  VALOROP1 , VALOROP2 ,  VALOROP3 ,IDPLANPREVCONTAB, '+  //Higor Nayde  SOL 162126*RE01 KINTANA 792563
          '  FLGCALCRESERVA  , VALORCALCULADO  ,  VALOROP1 , VALOROP2 ,  VALOROP3 , '+   //William Santana - SOL 262798  - PPM 1097367
          '  FLGDESCFOLHA , FLGSITFUNDACAO ,  SITRECEBIMENTO , TIPO ,  PARCELA , '+
          '  IDLOTE,  VALORRECEBIDO, NUMRECEBIMENTO , MESREFERENCIA , MESCOBRANCA , IDMOTIVO , '+
          '  IDPESSJUR , IDPESSOA,   IDPLANOPREV , IDCONTRIBUICAO , SEQPROPOSTA, FOLHAORIGEM, IDPARCELAMENTO, NUMBANCO,NUMAGENCIA, '+
          '  CONTACORRENTE, DATARECEBIMENTO, '+
          //'  DATAEMISSCOB , '+ // SOL 180156 Kintana 1668852
          //BRUNO AZEVEDO SOL 184271
          '  DATAEMISSCOB '; // SOL 180156 Kintana 1668852

          // TADEU PASSOS SOL 189702 KINTANA 1816210
          if bGravaSalContrib then
            qryaux.sql.text := qryaux.sql.text + ' , CODDOCUMENTOPREV, SALCONTRIB, '
          else
            qryaux.sql.text := qryaux.sql.text + ' , CODDOCUMENTOPREV, '; //Renato Visoni SOL 153051 Kintana 1165364
          // TADEU PASSOS SOL 189702 KINTANA 1816210

          // Taffarel - SIG 54406 - Inicio
          if dsContribACalcular.DataSet.FieldByName('IDCONTRIBUICAO').AsInteger in [18, 19] then
          begin
            qryaux.sql.text := qryaux.sql.text + ' IDTITULAR, '
          end;
          // Taffarel - SIG 54406 - Fim

          qryaux.sql.text := qryaux.sql.text + ' IDPLANPREVCONTAB ) '; //RNG14 - Helio - SOL Nº 253577/17460 PPM Nº 955546

          qryaux.sql.text := qryaux.sql.text + // TADEU PASSOS SOL 189702 KINTANA 1816210
          ' VALUES  '+
          '  ('''+sIdRegraCalculo+''','''+sCodPortForma+''' , to_date('''+sDataPrevisaoRece+''',''dd/mm/yyyy'') , '+
          '  '+OraNumero(sValEsperado)+' , 0 , '+OraNumero(sValEsperado)+' , '+
          '  '+oranumero(dsContribACalcular.DataSet.FieldByName('ValorBase1').AsString)+' , '+
          '  '+oranumero(dsContribACalcular.DataSet.FieldByName('ValorBase2').AsString)+' , '+
          '  '+oranumero(dsContribACalcular.DataSet.FieldByName('ValorBase3').AsString)+' , '+
         // '  '+oranumero(dsContribACalcular.DataSet.FieldByName('IDPLANPREVCONTAB').AsString)+' , '+//Higor Nayde  SOL 162126*RE01 KINTANA 792563   //comentado- William Santana - SOL 262798  - PPM 1097367
          '  '+sFlgdescfolha+' , '+ // SOL 130118 Kintana 817114
          '  '''+dsContribACalcular.DataSet.FieldByName('flginterno').AsString+''' , '+
          '  '''+sSitRecebimento+''' , '+
          '  ''F'' , '+
          '  '+inttostr(iNumParcela)+' , '+
          '  '+inttostr(IDLOTE)+', '+
          '  '+sValorRecebido+' , '+
          '  '+inttostr(iNumRecebimento)+' , '+
          '  '''+psAnoMesReferencia+''' , '+
          '  '''+sMesCobranca+''' , '+
          '  '+inttostr(prmIdMotivoContrib)+' , '+
          '  '+dsContribACalcular.DataSet.FieldByName('IDPESSJUR').AsString+' , '+
          '  '+dsContribACalcular.DataSet.FieldByName('IDPESSOA').AsString+' , '+
          '  '+dsContribACalcular.DataSet.FieldByName('IDPLANOPREV').AsString+' , '+
          '  '+dsContribACalcular.DataSet.FieldByName('IDCONTRIBUICAO').AsString+' , '+
          '  '+dsContribACalcular.DataSet.FieldByName('SEQPROPOSTA').AsString+', '+
          '  '''+sFolhaOrigem+''', '+
          '  '''+sIdParcelamento+''' '+
          //Renato Visoni SOL 153051 Kintana 1165364
          ', ' + RetornaBancoAgenciaConta(dsContribACalcular.DataSet.FieldByName('IDPESSOA').AsString) +
          //Renato Visoni SOL 153051 Kintana 1165364
          //, '''+sIdParcelamento+''', '+// SOL 130118 Kintana 817114 // SOL 171339 Kintana 1534555
          ', '+sDataRecebimento+' ,'+ // SOL 130118 Kintana 817114
          //BRUNO AZEVEDO SOL 184271
          //', '+sDataemissaoCob+', '+  // SOL 180156 Kintana 1668852
          ' ' + sDataemissaoCob + ', ';  // SOL 180156 Kintana 1668852

          // TADEU PASSOS SOL 189702 KINTANA 1816210
          if bGravaSalContrib then
            // Thiago Melo SOL 238582 PPM 504830
            //qryaux.sql.text := qryaux.sql.text + ' ' + sCoddocumentoPrev + ', ' + qrySalContrib.FieldByName('SALMANTIDO').AsString +' )'
            qryaux.sql.text := qryaux.sql.text + ' ' + sCoddocumentoPrev + ', ' + StringReplace ( qrySalContrib.FieldByName('SALMANTIDO').AsString, ',', '.', [rfReplaceAll] ) +', '
            // Thiago Melo SOL 238582 PPM 504830
          else
            qryaux.sql.text := qryaux.sql.text + '  ' + sCoddocumentoPrev + ',  '; // SOL 130118 Kintana 817114
          // TADEU PASSOS SOL 189702 KINTANA 1816210

          // Taffarel - SIG 54406 - Inicio
          if dsContribACalcular.DataSet.FieldByName('IDCONTRIBUICAO').AsInteger in [18, 19] then
	  begin
            qryaux.sql.text := qryaux.sql.text + '  ' + dsContribACalcular.DataSet.FieldByName('IDPESSOA').AsString +' , ';
          end;
          // Taffarel - SIG 54406 - Fim

          qryaux.sql.text := qryaux.sql.text + ' ' + IntToStr(sIdPlanPrevContab) + ' ) ';//RNG14 - Helio - SOL Nº 253577/17460 PPM Nº 955546
      try
         qryaux.ExecSql;
      except
         exit
      end;
   end
   else
   begin

      qryaux.close;
      qryaux.sql.text := '   update HSTCONTRIBPREV set '+
          '  IDREGRACALCULO = '''+sIdRegraCalculo+''' ,   '+
          '  CODPORTFORMA = '''+sCodPortForma+''' , '+
          '  DATAPREVISAORECE = to_date('''+sDataPrevisaoRece+''',''dd/mm/yyyy'') , '+
          '  VALORESPERADO = '+OraNumero(sValEsperado)+' , '+
          '  FLGCALCRESERVA = 0 , '+
          '  VALORCALCULADO = '+OraNumero(sValEsperado)+' , '+
          '  VALOROP1 = '+oranumero(dsContribACalcular.DataSet.FieldByName('ValorBase1').AsString)+' , '+
          '  VALOROP2 = '+oranumero(dsContribACalcular.DataSet.FieldByName('ValorBase2').AsString)+' , '+
          '  VALOROP3 = '+oranumero(dsContribACalcular.DataSet.FieldByName('ValorBase3').AsString)+' , '+
          '  IDPLANPREVCONTAB = '+oranumero(dsContribACalcular.DataSet.FieldByName('IDPLANPREVCONTAB').AsString)+' , '+ //Higor Nayde  SOL 162126*RE01 KINTANA 792563
          '  FLGDESCFOLHA = '+dsContribACalcular.DataSet.FieldByName('flgDescFolha').AsString+' , '+
          '  FLGSITFUNDACAO = '''+dsContribACalcular.DataSet.FieldByName('flginterno').AsString+''' , '+
          '  SITRECEBIMENTO = '''+sSitRecebimento+''' , '+
          '  TIPO = ''F'' , '+
          '  PARCELA = '+inttostr(iNumParcela)+' , '+
          '  IDLOTE = '+inttostr(IDLOTE)+', '+
          '  VALORRECEBIDO = '+sValorRecebido+','+
          '  IDPARCELAMENTO = '''+sIdParcelamento+''' '+
          ' , DATAEMISSCOB     = NULL';   // SOL 180156 Kintana 1668852

          // TADEU PASSOS SOL 189702 KINTANA 1816210
          if bGravaSalContrib then

            // Thiago Melo SOL 238582 PPM 504830
            //qryaux.sql.text := qryaux.sql.text + ' , SALCONTRIB = ' + qrySalContrib.FieldByName('SALMANTIDO').AsString + ' ';
            qryaux.sql.text := qryaux.sql.text + ' , SALCONTRIB = ' + StringReplace ( qrySalContrib.FieldByName('SALMANTIDO').AsString, ',', '.', [rfReplaceAll] ) + ' ';
            // Thiago Melo SOL 238582 PPM 504830

          // TADEU PASSOS SOL 189702 KINTANA 1816210

          qryaux.sql.text := qryaux.sql.text + // TADEU PASSOS SOL 189702 KINTANA 1816210
          'where  '+
          '  NUMRECEBIMENTO = '+inttostr(iNumRecebimento)+' and '+
          '  MESREFERENCIA = '''+psAnoMesReferencia+''' and '+
          '  MESCOBRANCA = '''+sMesCobranca+''' and '+
          '  IDMOTIVO = '+inttostr(prmIdMotivoContrib)+' and '+
          '  IDPESSJUR = '+dsContribACalcular.DataSet.FieldByName('IDPESSJUR').AsString+' and '+
          '  IDPESSOA = '+dsContribACalcular.DataSet.FieldByName('IDPESSOA').AsString+' and '+
          '  IDPLANOPREV = '+dsContribACalcular.DataSet.FieldByName('IDPLANOPREV').AsString+' and '+
          '  IDCONTRIBUICAO = '+dsContribACalcular.DataSet.FieldByName('IDCONTRIBUICAO').AsString+' and '+
          '  SEQPROPOSTA = '+dsContribACalcular.DataSet.FieldByName('SEQPROPOSTA').AsString+' and '+
          '  SITRECEBIMENTO = 0';
      try
         qryaux.ExecSql;
      except
         exit
      end;
   end;

   Result := True;
end;



//verifica o número de contribuições, para ver que regra usar
function TfrmPreparaEnvia.TestaIdRegra (iidpessjur,iidplanoprev,iidcontribuicao,
                                        iidpessoa : Integer;
                                        psAnoMesReferencia : String): Integer;
var sMesDataInicio,
    sMesDataFinal : String;
begin
  //  0 ==> regra de cálculo da primeira contribuição
  //  1 ==> regra de contribuições normais
  //  2 ==> regra da última contribuição
  // 10 ==> erro

   Result         := 10;
   sMesDataInicio := '';
   sMesDataFinal  := '';

   // se a data de inicio estiver em branco retornar 1
   if Trim(dsContribACalcular.DataSet.FieldByName('DataInicio').AsString) = ''
   then begin
     Result := 1;
     Exit;
   end;

   try
      sMesDataInicio := Copy(dsContribACalcular.DataSet.FieldByName('DataInicio').AsString ,7,4)+'/'+
                        Copy(dsContribACalcular.DataSet.FieldByName('DataInicio').AsString ,4,2);

      sMesDataFinal  := Copy(dsContribACalcular.DataSet.FieldByName('DataFinal').AsString ,7,4)+'/'+
                        Copy(dsContribACalcular.DataSet.FieldByName('DataFinal').AsString ,4,2);

      if Copy(psAnoMesReferencia,6,2)  <> '13'
      then begin
         if sMesDataInicio >= sAnoMesCobrancaTela // sAnoMesReferencia
         then Result := 0    // 1a. contribuicao
         else begin // se a data final  estiver em branco retornar 1
            if Trim(dsContribACalcular.DataSet.FieldByName('DataFinal').AsString ) = ''
            then begin
               Result := 1;
               Exit;
            end;
            if sMesDataFinal <= sAnoMesCobrancaTela
            then Result := 2  // ultima contribuicao
            else Result := 1; // contribuicao normal
         end;
      end
      else begin
         if Copy(sMesDataInicio,1,4) >= Copy(sAnoMesCobrancaTela,1,4)
         then Result := 0    // 1a. contribuicao
         else begin // se a data final  estiver em branco retornar 1
            if Trim(dsContribACalcular.DataSet.FieldByName('DataFinal').AsString ) = ''
            then begin
               Result := 1;
               Exit;
            end;
            if Copy(sMesDataFinal,1,4)  <= Copy(sAnoMesCobrancaTela,1,4)
            then Result := 2  // ultima contribuicao
            else Result := 1; // contribuicao normal
         end;
      end;
   except
      Result := 10;
   end;
end;

function TfrmPreparaEnvia.GeraHistorico( psDataPrevista, sNomeContrib,
                                         psFlgInterno,
                                         psAnoMesReferencia : String;
                                         piQtdeContribAssoc : Integer;
                                         var pbCobra13 : boolean ) : boolean;
var
  sSQL,
  sValEsperado,
  sValorRegra,

  sAnoMesUltMesPreparo,
  sIdRegraCalculo,
  sValorAssoc1,  sValorAssoc2,  sValorAssoc3,
  sValorOp1Ass1, sValorOp1Ass2, sValorOp1Ass3 : String;
  bValorZERO,
  bErroRegra,
  bTestarValor : boolean;

  iNumRecebimentoHist : Integer;

  iNumProxParc : Integer;

begin
   Result        := False;
   bAlgumProblema:= False;
   sValEsperado      := '';


   bContribParcelamento :=  (dsContribACalcular.DataSet.FieldByName('FLGPARCELAMENTO').AsInteger = 1);

   sIdParcelamento := '';
   sPercentual := '0';
   sVlrDividaPart := '0';
   sVlrDividaPatro := '0';


   //verifica se o participante te parcelamento ativo              luis
   if bContribParcelamento then
   begin
     bVeioDeEvento := True; // SOL 128014 - Ádler Souza
     frmparcelamento.TrazDadosParcela( qryaux,
                                        dsContribACalcular.DataSet.FieldbyName('IdPessJur').AsString,
                                        dsContribACalcular.DataSet.FieldbyName('IdPlanoPrev').AsString,
                                        dsContribACalcular.DataSet.FieldbyName('IdPessoa').AsString,
                                        sIdParcelamento,
                                        sPercentual,
                                        sVlrDividaPart,
                                        sVlrDividaPatro,
                                        sVlrPrestacao,
                                        sVlrSdoDevedor,
                                        sSalBaseAtual,
                                        iNumProxParc);
   end;


   // Se Desc. em Banco ou Se é Folha e tem Ida p/ Patro e é um Valor Fixo,
   // entao Calcula Contribuicao,as outras, só grava no historico, com valor = 0
   if    ( dsContribACalcular.DataSet.FieldByName('FLGDESCFOLHA').AsInteger = 0)
      OR ((dsContribACalcular.DataSet.FieldByName('FLGDESCFOLHA').AsInteger = 1) AND
          (qryContribuicao.FieldbyName('FlgTpVlr').AsString = 'V'))
      OR ((dsContribACalcular.DataSet.FieldByName('FLGDESCFOLHA').AsInteger = 1)  and
          (dsContribACalcular.DataSet.FieldByName('FlgInterno').AsString <> 'AT'))
   then  begin
        // Contribuicao Nao Associada, usa os dados que estão na query a ser preparada
        if (piQtdeContribAssoc <= 0)
        then begin
            bErroRegra := False;

            liIdPessoa  := dsContribACalcular.DataSet.FieldByName('IdPessoa').AsInteger;

            // Montar qry para regra
            MontaSQLParaRegraCalculo(psAnoMesReferencia, psFlgInterno,sSql);

            if (Copy(psAnoMesReferencia,6,2) = '13') and (dsContribACalcular.DataSet.FieldbyName('IDREGRACALCULO13').AsString <> '')
            then sIdRegraCalculo := dsContribACalcular.DataSet.FieldbyName('IDREGRACALCULO13').AsString
            else sIdRegraCalculo := dsContribACalcular.DataSet.FieldbyName('IDREGRACALCULO').AsString;

            sValorRegra := RegraNumerica(sIdRegraCalculo, sSQL, bErroRegra, iIdCalculoGeral);


            if (sValorRegra = '') and (not bErroRegra)     //query estava vazia
            then begin
               memResult.Lines.Add('[ERRO] MATRÍCULA : '+dsContribACalcular.DataSet.FieldByName('Matricula').AsString+
                                   '- '+qryContribuicao.FieldByName('Nome').AsString+ ' - REGRA RETORNOU VAZIO ');
               Exit;
            end;


            if (dsContribACalcular.DataSet.FieldByName('FLGPARCELAMENTO').AsInteger = 1) and (StrToFloat(ClienteNumero(sValorRegra))<=0)
            then begin
               memResult.Lines.Add('[AVISO] PARCELAMENTO - MATRÍCULA : '+dsContribACalcular.DataSet.FieldByName('Matricula').AsString+
                                   '- '+qryContribuicao.FieldByName('Nome').AsString+ ' - REGRA DE PARCELAMENTO RETORNOU ZERO ');
               Exit;
            end;


            //Verificar e tratar Regra de 1o e Ultimo Pagamento
            if not TestaPrimeiroPagto(sValorRegra, psAnoMesReferencia, '0',  '0',  '0', '0', '0', '0',
                                      pbCobra13, dsContribACalcular.DataSet.FieldByName('FlgInterno').AsString)
            then Exit;

            sValEsperado      := OraNumero(sValorRegra);
        end
        else begin
           // contribuicao com 2 ou mais associadas ou contribuicao da patrocinadora
           sSQL := MontaSQLAssoc(dsContribACalcular.DataSet.FieldbyName('IdPessJur').AsInteger,
                                 dsContribACalcular.DataSet.FieldbyName('IdPlanoPrev').AsInteger,
                                 dsContribACalcular.DataSet.FieldbyName('IdPessoa').AsInteger,
                                 dsContribACalcular.DataSet.FieldbyName('SeqProposta').AsInteger,
                                 dsContribACalcular.DataSet.FieldbyName('IdContribuicao').AsInteger,
                                 qryContribuicao.FieldByName('IdContribPai').AsInteger,
                                 qryContribuicao.FieldByName('IdContribPai2').AsInteger,
                                 qryContribuicao.FieldByName('IdContribPai3').AsInteger,
                                 piQtdeContribAssoc,
                                 qryContribuicao.FieldByName('FlgPagadorAssoc1').AsString,
                                 qryContribuicao.FieldByName('FlgPagadorAssoc2').AsString,
                                 qryContribuicao.FieldByName('FlgPagadorAssoc3').AsString,
                                 psAnoMesReferencia,
                                 sValorAssoc1,  sValorAssoc2,  sValorAssoc3,
                                 sValorOp1Ass1, sValorOp1Ass2, sValorOp1Ass3,
                                 psFlgInterno);

           if sSQL = ''
           then begin
              memResult.Lines.Add('[ERRO] MATRÍCULA : '+dsContribACalcular.DataSet.FieldByName('Matricula').AsString+
                                  '- ERRO AO BUSCAR CONTRIBUIÇÕES ASSOCIADAS ');
              Exit;
            end;

           // Executa Regra de Calculo
           bErroRegra := False;


           if (Copy(psAnoMesReferencia,6,2) = '13') and (dsContribACalcular.DataSet.FieldbyName('IDREGRACALCULO13').AsString <> '')
           then sIdRegraCalculo := dsContribACalcular.DataSet.FieldbyName('IDREGRACALCULO13').AsString
           else sIdRegraCalculo := dsContribACalcular.DataSet.FieldbyName('IDREGRACALCULO').AsString;

           sValorRegra := RegraNumerica(sIdRegraCalculo,   sSQL,bErroRegra,iIdCalculoGeral);



           if (sValorRegra = '') and (not bErroRegra)   // query estava vazia
           then begin
              memResult.Lines.Add('[ERRO] MATRÍCULA : '+dsContribACalcular.DataSet.FieldByName('Matricula').AsString+
                                   '- '+qryContribuicao.FieldByName('Nome').AsString+ ' - REGRA RETORNOU VAZIO ');
              Exit;
           end;

           //Verificar e tratar Regra de 1o e Ultimo Pagamento
           if not TestaPrimeiroPagto(sValorRegra, psAnoMesReferencia,sValorAssoc1,  sValorAssoc2,  sValorAssoc3,
                                                  sValorOp1Ass1, sValorOp1Ass2, sValorOp1Ass3, pbCobra13, psFlgInterno)
           then Exit;

           sValEsperado  := OraNumero(sValorRegra);
        end;//Fim Contribuicao Associada

        if sValEsperado  = ''     // Valor esperado Calculado ficou em branco
        then begin
        memResult.Lines.Add('[ERRO] MATRÍCULA : '+dsContribACalcular.DataSet.FieldByName('Matricula').AsString+
                            '- '+qryContribuicao.FieldByName('Nome').AsString+ ' - REGRA RETORNOU VAZIO ');
          Exit;
        end;
   end; // Fim Executa Regra de Calculo

   bTestarValor  := (dsContribACalcular.DataSet.FieldByName('FLGDESCFOLHA').AsInteger = 0);

   // Gravar cobranca no Historico de Contribuicoes
   // Se só envia base de calculo, colocar 0 no valor esperado

   if (dsContribACalcular.DataSet.FieldByName('FLGDESCFOLHA').AsInteger = 1) AND
      ((qryContribuicao.FieldbyName('FlgTpVlr').AsString                 = 'B')
      or (qryContribuicao.FieldbyName('FlgTpVlr').AsString                = 'N'))
   then sValEsperado := '0'

   Else Begin
     If sValEsperado = '0'
      Then Begin
         If iFlgNGravaContZero = 1
           Then Begin
              memResult.Lines.Add('[AVISO] MATRÍCULA : '+dsContribACalcular.DataSet.FieldByName('Matricula').AsString+
                                  '- '+qryContribuicao.FieldByName('Nome').AsString+ ' - CONTRIBUIÇÃO ZERADA! GRAVAÇÃO NÃO PERMITIDA!');
              Exit;
           End
           Else memResult.Lines.Add('[AVISO] MATRÍCULA : '+dsContribACalcular.DataSet.FieldByName('Matricula').AsString+
                                    '- '+qryContribuicao.FieldByName('Nome').AsString+ ' - CONTRIBUIÇÃO ZERADA!');
      End;
   End;




   if CbBpd.Checked then // SOL 130118 Kintana 817114
   begin
      qryaux.close;
      qryaux.sql.text := ' SELECT NUMRECEBIMENTO FROM HSTCONTRIBPREV WHERE '+
                         ' IDPESSJUR = '+dsContribACalcular.DataSet.FieldByName('IdPessJur').AsString+' '+
                         ' AND MESCOBRANCA = '+ QuotedStr(sAnoMesCobrancaTela) +
                         ' AND MESREFERENCIA = '''+psAnoMesReferencia+''' '+
                         ' AND IDPESSOA =  '+dsContribACalcular.DataSet.FieldByName('IdPessoa').AsString+' '+
                         ' AND IDPLANOPREV= '+dsContribACalcular.DataSet.FieldByName('IdPlanoPrev').AsString+' '+
                         ' AND IDCONTRIBUICAO = '+dsContribACalcular.DataSet.FieldByName('IdContribuicao').AsString+' ';
      qryaux.open;
   end
   else  // SOL 130118 Kintana 817114
   begin
      qryaux.close;
      qryaux.sql.text := ' SELECT NUMRECEBIMENTO FROM HSTCONTRIBPREV WHERE '+
                         ' IDPESSJUR = '+dsContribACalcular.DataSet.FieldByName('IdPessJur').AsString+' '+
                         ' AND MESCOBRANCA = '+ QuotedStr(sAnoMesCobrancaTela) +
                         ' AND MESREFERENCIA = '''+psAnoMesReferencia+''' '+
                         ' AND CODDOCUMENTOPREV = 20 '+
                         ' AND IDPESSOA =  '+dsContribACalcular.DataSet.FieldByName('IdPessoa').AsString+' '+
                         ' AND IDPLANOPREV= '+dsContribACalcular.DataSet.FieldByName('IdPlanoPrev').AsString+' '+
                         ' AND IDCONTRIBUICAO = '+dsContribACalcular.DataSet.FieldByName('IdContribuicao').AsString+' ';
      qryaux.open;
   end;    // SOL 130118 Kintana 817114

   if qryaux.isempty then
      iNumRecebimentoHist := dsContribACalcular.DataSet.FieldByName('NumRecebimento').AsInteger
   else
      iNumRecebimentoHist := qryaux.FieldByName('NumRecebimento').AsInteger;

   if not GravaHistorico(psAnoMesReferencia, psDataPrevista, sValEsperado,
                         dsContribACalcular.DataSet.FieldByName('FlgNaoExigeRec').AsString,
                         iNumRecebimentoHist,    iNumProxParc,
                         dsContribACalcular.DataSet.FieldbyName('IdRegraCalculo').AsInteger,
                         dsContribACalcular.DataSet.FieldByName('IdPessoa').AsInteger,
                         dsContribACalcular.DataSet.FieldByName('IdPessJur').AsInteger,
                         dsContribACalcular.DataSet.FieldByName('IdPlanoPrev').AsInteger,
                         dsContribACalcular.DataSet.FieldByName('IdContribuicao').AsInteger,
                         bTestarValor,
                         bValorZERO)

   then begin
      if not bValorZERO
      then begin
         bAlgumProblema := True;
         memResult.Lines.Add('[ERRO] MATRÍCULA : '+dsContribACalcular.DataSet.FieldByName('Matricula').AsString+
                             '- '+qryContribuicao.FieldByName('Nome').AsString+ ' - ERRO NA GRAVAÇÃO NO HISTÓRICO ');
      end;
      Exit;
   end
   else begin
      inc(iNumRegLote);
      if sValEsperado <> ''
      then rTotalLote   := rTotalLote + StrToFloat(ClienteNumero(sValEsperado));
   end;

   if not AtualizaUltMesPREPARO(sAnoMesCobrancaTelaInicial,
                               dsContribACalcular.DataSet.FieldByName('IdPessJur').AsInteger,
                               dsContribACalcular.DataSet.FieldByName('IdPlanoPrev').AsInteger,
                               dsContribACalcular.DataSet.FieldByName('IdPessoa').AsInteger,
                               dsContribACalcular.DataSet.FieldByName('SeqProposta').AsInteger,
                               dsContribACalcular.DataSet.FieldByName('IdContribuicao').AsInteger)

   then begin
      memResult.Lines.Add('[ERRO] MATRÍCULA : '+dsContribACalcular.DataSet.FieldByName('Matricula').AsString+
                          '- '+qryContribuicao.FieldByName('Nome').AsString+ ' - ERRO NA ATUALIZAÇÃO DO ÚLTIMO MÊS PREPARADO ');
      Exit;
   end;

   Result := True;
end;// GeraHistorico

function TfrmPreparaEnvia.TestaPrimeiroPagto(var sValorRegra: String;
                                             psAnoMesReferencia,
                                             sValorAssoc1,  sValorAssoc2,  sValorAssoc3,
                                             sValorOp1Ass1, sValorOp1Ass2, sValorOp1Ass3 : String;
                                             var pbCobra13 : boolean ;
                                             sFlgInterno : String): boolean;
var
  sDataRef,
  sSQLRegra,
  sRegraPrimPgto,
  sRegraUltPgto,
  sValEsperado,
  sOrigem,
  sDataAdmissao,
  sValorInfInss,
  sInscData,
  sNumDepIrrf  : String;
  bErroLocal,
  bErroRegra    : boolean;
  iIdRegraUsada : Integer;
begin
  // Testar se é 1o. ou último pagamento para, se for o caso,
  // executar a regra de calculo do 1o. ou último valor
  {A função TESTAIDREGRA retornará
   0  ==> regra de cálculo da primeira contribuição
   1  ==> regra de contribuições normais
   2  ==> regra da última contribuição
   10 ==> erro}
  //  result := True;     //PROVISORIO - VOLTAR
  //  Exit;
  result       :=  False;
  sValEsperado :=  sValorRegra;  // Guarda o valor calculado, pela regra original
  // SOL 146616  KINTANA 1003916
  qryAux2.close;
  qryAux2.sql.clear;
  qryAux2.SQL.Add(' SELECT MAX(ORIGEM) AS ORIGEM'+
                  ' FROM EVOLFUNCPREV '+
                  ' WHERE IDPESSOA = '+dsContribACalcular.DataSet.FieldByName('Idpessoa').Asstring );
  qryAux2.Open;

  sOrigem := qryAux2.FieldByName('ORIGEM').Asstring ;

  qryAux2.close;
  qryAux2.sql.clear;
  qryAux2.SQL.Add(' SELECT NUMDEPIRRF  '+
                  ' FROM PESSOAFISICA '+
                  ' WHERE IDPESSOA = '+dsContribACalcular.DataSet.FieldByName('Idpessoa').Asstring );
  qryAux2.Open;
  sNumDepIrrf :=  qryAux2.FieldByName('NUMDEPIRRF').Asstring ;

  qryAux2.close;
  qryAux2.sql.clear;
  qryAux2.SQL.Add(' SELECT DATAADMISSAO  '+
                  ' FROM ELEGPATRO '+
                  ' WHERE IDPESSOA = '+dsContribACalcular.DataSet.FieldByName('Idpessoa').Asstring );
  qryAux2.Open;

  sDataAdmissao := qryAux2.FieldByName('DATAADMISSAO').Asstring ;


  qryAux2.close;
  qryAux2.sql.clear;
  qryAux2.SQL.Add(' SELECT VALORINFINSS, INSCRICAODATA  '+
                  ' FROM PARTPREVPLAN '+
                  ' WHERE IDPESSOA = '+dsContribACalcular.DataSet.FieldByName('Idpessoa').Asstring +
                  ' AND   IDPLANOPREV =  '+dsContribACalcular.DataSet.FieldByName('Idplanoprev').Asstring );
  qryAux2.Open;
  sValorInfInss := qryAux2.FieldByName('VALORINFINSS').Asstring ;
  sInscData     := qryAux2.FieldByName('INSCRICAODATA').Asstring ;
  //SOL 146616  KINTANA 1003916


  case TestaIdRegra( dsContribACalcular.DataSet.FieldByName('Idpessjur').AsInteger,
                     dsContribACalcular.DataSet.FieldByName('Idplanoprev').AsInteger,
                     dsContribACalcular.DataSet.FieldByName('Idcontribuicao').AsInteger,
                     dsContribACalcular.DataSet.FieldByName('Idpessoa').AsInteger,
                     psAnoMesReferencia) of
  0: begin
        if Copy(psAnoMesReferencia,6,2) = '13'
        then sRegraPrimPgto := dsContribACalcular.DataSet.fieldbyname('IDREGRAPRIMPGTO13').AsString
        else sRegraPrimPgto := dsContribACalcular.DataSet.fieldbyname('IDREGRAPRIMPAGTO').AsString;

        if sRegraPrimPgto <> ''
        then begin
          iIdRegraUsada  := dsContribACalcular.DataSet.Fieldbyname('IDREGRAPRIMPAGTO').AsInteger;
          sDataRef       := dsContribACalcular.DataSet.Fieldbyname('INSCRICAODATA').AsString;

          if trim(sNumDepIrrf) = '' then // SOL 242363 PPM 571945
             sNumDepIrrf := '0'; // SOL 242363 PPM 571945

          // André Pontes - pendência 27138 - 28/12/2007
          // sSQLRegra      := ' SELECT '+sValorREGRA+' AS VALORREFERENCIA, '''+sDataREF+ ''' AS DATAREF, '+
          sSQLRegra      := ' SELECT '+sValorREGRA+' AS VALORREFERENCIA, CPP.DATAINICIO AS DATAREF, '+
                                       sValorREGRA+' AS VALORPREV, '+
                             OraNumero(dsContribACalcular.DataSet.FieldbyName('VALORPROVENTO').AsString)+' AS VALORPROVENTO ,'+
                             OraNumero(dsContribACalcular.DataSet.FieldbyName('VALORREMTOTAL').AsString)+' AS VALORREMTOTAL ,'+
                             OraNumero(dsContribACalcular.DataSet.FieldbyName('RUBPARCIAL').AsString)+' AS RUBPARCIAL ,'+
                             ''''+dsContribACalcular.DataSet.FieldbyName('INSCRICAODATA').AsString+''' AS INSCRICAODATA ,'+
                             ''''+dsContribACalcular.DataSet.FieldbyName('DATANASC').AsString+''' AS DATANASC ,'+
                             dsContribACalcular.DataSet.FieldbyName('IDPESSJUR').AsString+' AS IDPESSJUR ,'+
                             dsContribACalcular.DataSet.FieldbyName('IDPLANOPREV').AsString+' AS IDPLANOPREV ,'+
                             dsContribACalcular.DataSet.FieldbyName('IDPESSOA').AsString+' AS IDPESSOA ,'+
                             dsContribACalcular.DataSet.FieldbyName('SEQPROPOSTA').AsString+' AS SEQPROPOSTA ,'+
                             dsContribACalcular.DataSet.FieldbyName('IDCONTRIBUICAO').AsString+' AS IDCONTRIBUICAO, '+
                             sValorAssoc1 +' AS VALORASSOCIADO,  '+
                             sValorAssoc2 +' AS VALORASSOCIADO2, '+
                             sValorInfInss+' AS VALINSS, '+
                             QuotedStr(sOrigem)+ ' AS ORIGEM, '+     // SOL 242363 PPM 571945
                             QuotedStr(sInscData)+' AS INSCRICAODATAFUND, '+ // SOL 242363 PPM 571945
                             '0'+' AS BSRUBRICA, '+
                             sNumDepIrrf + ' AS NUMDEPIRRF, '+   // SOL 242363 PPM 571945
                             QuotedStr(sDataAdmissao)+ ' AS DATAADMISSAO, ' + // SOL 242363 PPM 571945
                             sValorAssoc3 +' AS VALORASSOCIADO3, '+
                             sValorAssoc1 +' AS VALORASSOCIADOCOB,  '+
                             sValorOp1Ass1+' AS ASSOC1OP1, '+
                             sValorOp1Ass2+' AS ASSOC2OP1, '+
                             sValorOp1Ass3+' AS ASSOC3OP1, '+
                             ' NVL(CPP.VALORBASE1,0) VALORBASE1, '+
                             ' NVL(CPP.VALORBASE2,0) VALORBASE2, '+
                             ' NVL(CPP.VALORBASE3,0) VALORBASE3, '+
                             sIdSitPartNovo+' AS IDSITPARTNOVO,  '+
                             ' CPP.DATAINICIO, CPP.DATAFINAL,    '+
                             QuotedStr(dsContribACalcular.DataSet.FieldbyName('DATAINICIOMANUT').AsString)+' AS DATAINICIOMANUT,  '+
                             QuotedStr(psAnoMesReferencia)+ ' AS ANOMESREF, '+
                             sIdSitFuncNovo+' AS IDSITFUNCNOVO,  '+
                             QuotedStr(dsContribACalcular.DataSet.FieldbyName('DATADEMISSAO').AsString)+' AS DATADEMISSAO      '+
                             ', '''+sFlgInterno+''' AS FLGINTERNO '+
                             ' FROM  CONTRIBPREVPARTP  CPP   '+
                             ' WHERE CPP.IDPESSJUR      = '+dsContribACalcular.DataSet.FieldbyName('IDPESSJUR').AsString  +
                             ' AND   CPP.IDPLANOPREV    = '+dsContribACalcular.DataSet.FieldbyName('IDPLANOPREV').AsString+
                             ' AND   CPP.IDPESSOA       = '+dsContribACalcular.DataSet.FieldbyName('IDPESSOA').AsString   +
                             ' AND   CPP.IDCONTRIBUICAO = '+dsContribACalcular.DataSet.FieldbyName('IDCONTRIBUICAO').AsString;
          try
             sValorRegra    := RegraNumerica(sRegraPrimPgto,sSQLRegra,bErroRegra,iIdCalculoGeral);
             if not bErroRegra then
                sValorRegra := OraNumero(sValorRegra)
             else
                sValorRegra := sValEsperado;
          except
             memResult.Lines.Add('Matrícula : '+dsContribACalcular.DataSet.FieldByName('Matricula').AsString +
                                 '- Erro[Execução da Regra de Cálculo do 1o. Pagamento]');
             Exit;
          end;
        end;

  end;
  2: begin

        if Copy(psAnoMesReferencia,6,2) = '13'
        then sRegraUltPgto := dsContribACalcular.DataSet.fieldbyname('IDREGRAULTPGTO13').AsString
        else sRegraUltPgto := dsContribACalcular.DataSet.fieldbyname('IDREGRAULTPAGTO').AsString;

        if sRegraUltPgto <> ''
        then begin
           iIdRegraUsada      := dsContribACalcular.DataSet.Fieldbyname('IDREGRAULTPAGTO').AsInteger;
           sDataRef           := DateToStr(date);
           sSQLRegra          := ' SELECT '+sValorREGRA+' AS VALORREFERENCIA, '''+sDataREF+ ''' AS DATAREF, '+
                                 OraNumero(dsContribACalcular.DataSet.FieldbyName('VALORPROVENTO').AsString)+' AS VALORPROVENTO ,'+
                                 OraNumero(dsContribACalcular.DataSet.FieldbyName('VALORREMTOTAL').AsString)+' AS VALORREMTOTAL ,'+
                                 OraNumero(dsContribACalcular.DataSet.FieldbyName('RUBPARCIAL').AsString)+' AS RUBPARCIAL ,'+
                                 ''''+dsContribACalcular.DataSet.FieldbyName('INSCRICAODATA').AsString+''' AS INSCRICAODATA ,'+
                                 ''''+dsContribACalcular.DataSet.FieldbyName('DATANASC').AsString+''' AS DATANASC ,'+
                                 dsContribACalcular.DataSet.FieldbyName('IDPESSJUR').AsString+' AS IDPESSJUR ,'+
                                 dsContribACalcular.DataSet.FieldbyName('IDPLANOPREV').AsString+' AS IDPLANOPREV ,'+
                                 dsContribACalcular.DataSet.FieldbyName('IDPESSOA').AsString+' AS IDPESSOA ,'+
                                 dsContribACalcular.DataSet.FieldbyName('SEQPROPOSTA').AsString+' AS SEQPROPOSTA ,'+
                                 dsContribACalcular.DataSet.FieldbyName('IDCONTRIBUICAO').AsString+' AS IDCONTRIBUICAO, '+
                                 sValorInfInss+' AS VALINSS, '+
                                 QuotedStr(sOrigem)+ ' AS ORIGEM, '+      // SOL 242363 PPM 571945
                                 sInscData+' AS INSCRICAODATAFUND, '+
                                 '0'+' AS BSRUBRICA, '+
                                 sNumDepIrrf+ ' AS NUMDEPIRRF, '+
                                 sDataAdmissao+ ' AS DATAADMISSAO, ' +
                                 ' NVL(CPP.VALORBASE1,0) VALORBASE1, '+
                                 ' NVL(CPP.VALORBASE2,0) VALORBASE2, '+
                                 ' NVL(CPP.VALORBASE3,0) VALORBASE3  '+
                                 ', '''+sFlgInterno+''' AS FLGINTERNO '+  
                                 ' FROM  CONTRIBPREVPARTP  CPP   '+
                                 ' WHERE CPP.IDPESSJUR      = '+dsContribACalcular.DataSet.FieldbyName('IDPESSJUR').AsString  +
                                 ' AND   CPP.IDPLANOPREV    = '+dsContribACalcular.DataSet.FieldbyName('IDPLANOPREV').AsString+
                                 ' AND   CPP.IDPESSOA       = '+dsContribACalcular.DataSet.FieldbyName('IDPESSOA').AsString   +
                                 ' AND   CPP.IDCONTRIBUICAO = '+dsContribACalcular.DataSet.FieldbyName('IDCONTRIBUICAO').AsString;

           try
              sValorRegra    := RegraNumerica(sRegraUltPgto,sSQLRegra,bErroRegra,iIdCalculoGeral);
              if not bErroRegra then
                 sValorRegra := OraNumero(sValorRegra)
              else
                 sValorRegra := sValEsperado;
           except
              memResult.Lines.Add('Matrícula : '+dsContribACalcular.DataSet.FieldByName('Matricula').AsString+
                                  '- Erro[Execução da Regra de Cálculo do Último Pagamento]');
              exit;
           end;
        end;

        //=== Se for a ultima contribuicao, e paga 13 no final da mesma,
        //=== voltar e cobrar também a contrib de 13.
        if (dsContribACalcular.DataSet.FieldByName('FLGCOBRA13DTFIM').AsInteger = 1) and
           (Copy(psAnoMesReferencia,6,2) <> '13') 
        then pbCobra13  := True;
  end;
  10: begin //Erro
        memResult.Lines.Add('Matrícula : '+dsContribACalcular.DataSet.FieldByName('Matricula').AsString+
                            '- Erro[Erro no teste da regra] ');
        bErroLocal := True;
        Exit;
      end;
  end; //TestaIDRegra
  result := True;
end;

//====================================== PROCEDIMENTOS DO FORM
procedure TfrmPreparaEnvia.chklstPatroClickCheck(Sender: TObject);
var i : Integer;
    sSQLWhere     : String;
begin
  //Preenche ChkList dos Planos da Patrocinadora Selecionada - ALTERADO ABERTO

  qryPlano.Close;
  qryPlano.SQL.Clear;
  strPatro:= ' ';

  for i := 0 to chklstPatro.Items.Count - 1 do
     if chklstPatro.checked[i]
     then begin
        if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive,loPartialKey])
        then begin
           strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
        end;
   end;//for

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

procedure TfrmPreparaEnvia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.RollBack;


  with dtmPreparaContrib do
  begin
     qryLote.Close;
     qryNCalcMantido.Close;   qryNCalcMantido.UnPrepare;
     qryNCalcAtivo.Close;     qryNCalcAtivo.Unprepare;
     qryAtivoBase.Close;      qryAtivoBase.Unprepare;
  end;//with
  FreeAndNil( CtrlDocumento );   
  FreeAndNil( CtrlLancamento );
  FreeAndNil( CtrlBaixaRecXPag );// SOL 130118 Kintana 817114
  inherited;
end;

//================== ROTINAS DE CONTROLE DE PROCESSO - PREPARO E ENVIO
procedure TfrmPreparaEnvia.bbtnEnviarClick(Sender: TObject);
var bPreparoOk         : boolean;
    sAnoTela, sMesTela, strContrib : String;
    i                  : Integer;
    sPlanosContabEnvio : String;
    sMsgPga,
    sChkMsg // SOL 130118 Kintana 817114
    :String;
begin
  try
    UContribuicaoPrev.bSimParaTodos := False;//Henrique Massão
    memResult.Lines.Clear;

    // Preencher o mes de cobranca referente ao selecionado na tela
    sAnoTela := Trim(spedAnoCob.Text);
   if cmbMesCob.ItemIndex <= 8 then
      sMesTela  := '0'+IntToStr(cmbMesCob.ItemIndex+1)
   else sMesTela := IntToStr(cmbMesCob.ItemIndex+1);
      sAnoMesCobrancaTela   := sAnoTela+'/'+sMesTela;

   if (CbPga.Checked) and not(CbBpd.Checked) then
      sChkMsg := 'PGA'
   else
   if not(CbPga.Checked) and (CbBpd.Checked) then
      sChkMsg := 'BPD'
   else
   if (CbPga.Checked) and (CbBpd.Checked) then
      sChkMsg := 'PGA/BPD';


   if (CbPga.Checked) and (0 = 1) then
   begin
      Try
         sMsgPga := RealizaIntegracaoPGAIndiv(sAnoMesCobrancaTela,CtrlDocumento,CtrlLancamento,'','');
         if sMsgPga = '' then
            memResult.Lines.Add(' - Integração com '+sChkMsg+' realizada com sucesso- ')
         else
            memResult.Lines.Add(sMsgPga);

      Except
         memResult.Lines.Add(' - Ocorreram problemas na Integração com '+sChkMsg+' - ');
      end;
   end
   else
   begin

    // Guardar AnoMesCobrancaTela na variavel sAnoMesCobrancaTelaInicial para o caso
    // de, nas rotinas de sincronimo, o AnoMesCobranca ter que ser alterado apenas para
    // uma patrocinadora
    sAnoMesCobrancaTelaInicial := sAnoMesCobrancaTela;

    // Exibir todas as opcoes clicadas pelo usuario e verificar se ele
    // confirma as opcoes
    frmAguarde.Mostra('Verificando Informações Iniciais ...');

    if not(InformacoesOK) then
    begin
       frmAguarde.Apaga;
       Exit;
    end;
    frmAguarde.Apaga;

    bPreparoOk       := True;
    strLotePrepAgora := '';

    // Preencher Strings com codigos das patrocinadoras, planos e situacoes
    // selecionados
    if not(PreencheFiltroTela) then Exit;

    // Verificar se algum plano selecionado precisa de integracao com a contabilidade
    // para fazer o envio e o sistema está integrado com a contabilidade

    if (not prmIntegraContab) and ( (rgrpTipoCobranca.ItemIndex = 1) or (rgrpTipoCobranca.ItemIndex = 3) ) then
    begin
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add('SELECT NOME FROM PLANPREV WHERE FLGCONTABMANTIDO = 0 AND IDPLANOPREV IN ('+strPlano+')');
       qryAux.Open;
       if not(qryAux.IsEmpty) then
       begin
          sPlanosContabEnvio := '';
          qryAux.First;
          while not qryAux.EOF do
          begin
             sPlanosContabEnvio := sPlanosContabEnvio+#13+qryAux.FieldbyName('NOME').AsString;
             qryAux.Next;
          end;
          qryAux.Close;
          if MsgDlg('O sistema AdmPREV não está integrado com a Contabilidade. '+#13+
                 'Os planos a seguir estão parametrizados para contabilizar '+#13+
                 'as contribuições do tipo "Cobrança Bancária" no envio. '+#13+
                 'Logo, não poderão ser CONTABILIZADAS.'+#13+
                 sPlanosContabEnvio+#13+
                 'Deseja continuar ?','Confirmação',mtConfirmation,[mbOk,mbHelp],0) = mrNo then
          begin
             if dtmBaseDados.dbBaseDados.InTransaction
             then dtmBaseDados.dbBaseDados.Rollback;
             Exit;
          end;
       end;
    end;

    // Verificar se usuario optou so por "envio" ou "por preparo e envio"
     if (rgrpTipoOperacao.ItemIndex = 0) or (rgrpTipoOperacao.ItemIndex = 2) then //  Fazer preparo e envio OU fazer só preparo
     begin
        frmAguarde.Apaga;
        // Informa Salario de Manutencao Parcial
        if (chklstSituacao.ItemIndex = 2) or (chklstSituacao.ItemIndex = -1) then
        begin
           if MsgDlg('Deseja atualizar os salários dos Mantidos Parciais ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
           begin

              frmLerSalarios:= TfrmLerSalarios.Create(Application);
              frmLerSalarios.AssociaSalarios(strPatro, strPlano, False);
              frmLerSalarios.Free;
           end;

           if MsgDlg('Continua o Preparo ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo then
           begin
              if dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.Rollback;
              Exit;
           end;
        end;

        //=== Processa Preparo de Contribuicao, e atualiza query com lotes preparados
        bPreparoOK := PreparaContribuicao;
    end;

    //==== Processa Envio de Contibuicao, para Todos ou Algum Lote que tenha sido preparado
     if not(bPreparoOk) then
        if MsgDlg('Ocorreram problemas no preparo. Deseja processar envio mesmo assim ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
           bPreparoOk := True
        else
           bPreparoOk := False;

    // Preencher a variavel sAnoMesCobrancaTela novamente com o mes da tela,
    // pois ele pode ter sido alterado pelo sincronismo
    sAnoMesCobrancaTela := sAnoMesCobrancaTelaInicial;

    // Processar envio
     if (bPreparoOk) and (rgrpTipoOperacao.ItemIndex <> 2) then
     begin

       // Inicio Peterson Victor SOL 228895 PPM 1180796

       // Preencher filtro de contribuicoes, caso haja
       strContrib := ' ';
       for i := 0 to chklstContrib.Items.Count - 1 do
       begin
         if qryFiltroContrib.Locate('Nome',chklstContrib.Items[i],[loCaseInsensitive,loPartialKey]) then
         begin
           if chklstContrib.checked[i] then // Adicionar plano a String de planos
             strContrib:= strContrib + qryFiltroContrib.FieldByName('IdContribuicao').AsString+ ', ';
         end;
       end;

       if Trim(strContrib) = '' then
       begin
         for i := 0 to chklstContrib.Items.Count - 1 do
         begin
           if qryFiltroContrib.Locate('Nome',chklstContrib.Items[i],[loCaseInsensitive,loPartialKey]) then
             strContrib:= strContrib + qryFiltroContrib.FieldByName('IdContribuicao').AsString+ ', ';
         end;//for
       end;

       if Trim(strContrib) <> '' then
         strContrib := Copy(strContrib, 1, Length(strContrib) - 2);

       qryAux.Close;
       qryAux.SQL.Clear;

       qryAux.SQL.ADD(' SELECT COUNT(1) AS CONT');
       qryAux.SQL.ADD( ' FROM HSTCONTRIBPREV  ');
       qryAux.SQL.ADD( ' WHERE MESCOBRANCA = ' + QuotedStr(sAnoMesCobrancaTela));
       qryAux.SQL.ADD('       AND IDPESSJUR      IN  (' + strPatro    + ')  ');
       qryAux.SQL.ADD('       AND IDPLANOPREV    IN  (' + strPlano    + ')  ');


       if TRIM(strContrib) <> '' then
         qryAux.SQL.ADD('       AND IDCONTRIBUICAO IN  (' + strContrib  + ')  ');

       qryAux.SQL.ADD('       AND FLGSITFUNDACAO IN  (' + strSituacao + ')  ');
       qryAux.SQL.ADD('       AND FLGDEVOLUCAO = 1 ');


       qryAux.Open;

       if (not(qryAux.IsEmpty)) and
          (qryAux.FieldbyName('CONT').AsInteger > 0) then
       begin

       //verifica disponibilidade financeira  // SOL 130118 Kintana 817114
         bDisponibilidadeFinanceira := CtrlDisponFinanc.TestaDispFinanc(Sistema.IdEmpresa, Sistema.IdUsuario, dtVencBoleta.date);
         if not(bDisponibilidadeFinanceira) then begin
         //MsgDlg('Disponibilidade financeira bloqueada para esta operação.', 'Erro', mtError, [mbOK], 0);
           Exit;
         end;
       end;

       // Fim Peterson Victor SOL 228895 PPM 1180796

       if not (CtrlPeriodo.RetornaPeriodoExercicioDataProc(Sistema.IdEmpresa, dtVencBoleta.text)) then begin
         // Kintana 1461555 SOL 166858 - Otacilio
         MsgDlg({CtrlPeriodo.MessageInfo}'Data de Vencimento não Informada.' , 'Erro', mtError, [mbOK], 0);
         Exit;
       end;

       if CtrlPeriodo.TestaPeriodoBloqueadoProc(Sistema.IdEmpresa, tbBloqueado, CtrlPeriodo.Periodo, CtrlPeriodo.Exercicio,False) then begin
         MsgDlg(CtrlPeriodo.MessageInfo, 'Erro', mtError, [mbOK], 0);
         Exit;
       end;   // SOL 130118 Kintana 817114
         // Processar envio
       EnviaContribuicaoCcp;
     end;
     pgctrlOpcoes.ActivePage := tbsResultado;
     TiraSQL(qryAux);
   end; //Final do if (Apenas Pga)
   finally
      frmAguarde.Apaga;
   end;
end;



procedure TfrmPreparaEnvia.EnviarContribRecebida(lsLotesEnviados : TListBox);
var I : Integer;
    bLoteSemRec : Boolean;
begin
end;



function TfrmPreparaEnvia.PreparaContribuicao : boolean;
var
  i,
  iQtdeContribAssoc  : Integer;
  bCobra13,
  bCobra13Individual : boolean;
  iContReg,
  iIdPatroAtual      : longint;
  strContrib,
  sDataPrevista,
  sAnoMesReferencia  : String;
  cTipoEnvPrev       : char;
  icontcommit        : Integer;
  sAnoMesVerificar   : String;
begin
  inherited;
  Result := False;
  icontcommit := 0;

  memResult.Lines.Clear;
  memResult.Lines.Add('=================================================================================== ');
  memResult.Lines.Add('PREPARO DO ENVIO DE CONTRIBUIÇÕES - DATA : '+DateToStr(date)+' LISTA DE RESULTADOS ');
  memResult.Lines.Add('MÊS DE COBRANÇA : '+Trim(sAnoMesCobrancaTela));

  frmAguarde.Mostra('Verificando Parâmetros dos Planos ...');

  // Verificar se os dados para o plano estao ok
  qryPlanPatro.Close;
  qryPlanPatro.SQL.Clear;
  qryPlanPatro.SQL.Add(' SELECT DISTINCT P.NOME AS PATROCINADORA, PL.NOME AS PLANO,                    '+
                       '                 PLP.IDPESSJUR,      PLP.IDPLANOPREV, '+
                       '                 SP.FLGINTERNO,           PT.FLGANO13,      '+
                       '                 PL.FLGNGRAVACONTZERO  '+  
                       ' FROM   PLANPREVPATRO PLP, PLANPREV PL, PESSOA P, SITPART SP, PATRO PT         '+
                       ' WHERE  PLP.IDPLANOPREV  = PL.IDPLANOPREV                                      '+
                       ' AND    PLP.IDPESSJUR    = P.IDPESSOA                                          '+
                       ' AND    PLP.IDPESSJUR    = PT.IDPESSOA                                         '+
                       ' AND    SP.FLGINTERNO    <> ''PT''                                             '+
                       ' AND    PLP.IDPESSJUR    IN ('+strPatro+')                                     '+
                       ' AND    PLP.IDPLANOPREV  IN ('+strPlano+')                                     '+
                       ' AND    SP.FLGINTERNO    IN ('+strSituacao+')                                  '+
                       ' ORDER BY PLP.IDPESSJUR, PLP.IDPLANOPREV, SP.FLGINTERNO                        ');
  qryPlanPatro.Open;
  if qryPlanPatro.IsEmpty
  then begin
     frmAguarde.Apaga;
     MsgDlg('Os dados dos planos por patrocinadora não foram encontrados. Verifique :'+#13+
            '. Associação de Plano a Patrocinadora, '+#13+
            '. Associação de Calendário aos Planos por Patrocinadora e '+#13+
            '. Datas do Calendário. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  // Preencher variaveis globais
  rTotalTodosLotes      := 0;
  strLotePrepAgora      := '';
  iNumRegTodosLotes     := 0;
  bAlgumProblema        := False;

  iIdPatroAtual         := -1;
  bCobra13              := False;

  // Preencher filtro de contribuicoes, caso haja
  strContrib := ' ';
  for i := 0 to chklstContrib.Items.Count - 1 do
  begin
      if qryFiltroContrib.Locate('Nome',chklstContrib.Items[i],[loCaseInsensitive,loPartialKey])
      then begin
        if chklstContrib.checked[i] // Adicionar plano a String de planos
        then strContrib:= strContrib + qryFiltroContrib.FieldByName('IdContribuicao').AsString+ ', ';
      end;
  end;

  if Trim(strContrib) = ''
  then begin
     for i := 0 to chklstContrib.Items.Count - 1 do
     begin
        if qryFiltroContrib.Locate('Nome',chklstContrib.Items[i],[loCaseInsensitive,loPartialKey])
        then strContrib:= strContrib + qryFiltroContrib.FieldByName('IdContribuicao').AsString+ ', ';
     end;//for
  end;

  if Trim(strContrib) <> ''
  then strContrib := Copy(strContrib, 1, Length(strContrib) - 2);

  frmAguarde.Mostra('Iniciando Preparo de Contribuições ... ');

  if not GravaLogTOTALPREV ('Preparo Contrib. - Mês '+sAnoMesCobrancaTela+'[Patros.: '+strPatro+'-Planos:'+strPlano+']')
  then begin
     memResult.Lines.Add('- Erro na Gravação do Log. ');
  end;


  // Para cada patrocinadora, verificar se o mês de competencia da tela é
  // também o mes de cobrança das contribuiçoes do 13o. Se sim, enviar
  // mensagem para usuario de que irá cobrar também o 13o.
  bCobra13 := False;

  while not qryPlanPatro.EOF do
  begin

     iFlgNGravaContZero := qryPlanPatro.FieldByName('FLGNGRAVACONTZERO').AsInteger;

     if (iIdPatroAtual <> qryPlanPatro.FieldByName('IdPessJur').AsInteger)
     then begin
        // Para cada patrocinadora, verificar se o mês de competencia da tela é
        // também o mes de cobrança das contribuiçoes do 13o. Se sim, enviar
        // mensagem para usuario de que irá cobrar também o 13o.
        bCobra13 := False;

        iIdPatroAtual := qryPlanPatro.FieldByName('IdPessJur').AsInteger;
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT IDREGRA AS IDRGSALARIO13 FROM PARAMSAL13  '+
                        ' WHERE  IDPESSJUR = '+IntToStr(iIdPatroAtual)+
                        ' AND    EXERCICIO = '+Copy(sAnoMesCobrancaTela,1,4)+
                        ' AND    MESREFERENCIA = '''+sAnoMesCobrancaTela+'''');
        qryAux.Open;

        if not qryAux.IsEmpty
        then begin
            if MsgDlg('O mês '+sAnoMesCobrancaTela+' é o mês cadastrado como mês de cobrança '+
                      'das contribuições sobre 13º para a patrocinadora '+
                      qryPlanPatro.FieldByName('Patrocinadora').AsString+#13+
                      'Deseja realmente cobrar estas contribuições sobre 13º ? ',
                      'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
            then begin
               bCobra13 := False;
               if MsgDlg('Deseja continuar o Preparo de Contribuições ? ','Confirmação',
                  mtConfirmation, [mbYes, mbNo], 0 ) = mrNo
               then begin
                  qryPlanPatro.Close;
                  Exit;
               end;
            end
            else bCobra13 := True;
        end
         
        Else Begin
          bCobra13 := False;
          If (chkApenas13.Checked) And
             (MsgDlg('O mês '+sAnoMesCobrancaTela+' NÃO ESTÁ cadastrado como mês de cobrança '+
                     'das contribuições sobre 13º para a patrocinadora '+
                     qryPlanPatro.FieldByName('Patrocinadora').AsString+'.'+#13+
                     'É necessário antes realizar a parametrização na tela '+#13+
                     QuotedStr('PARÂMETROS PARA PAGAMENTO DO 13º SALÁRIO')+'.'+#13+
                     'Deseja continuar com o preparo das contribuições  ? ',
                     'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo)
           Then Begin
             qryPlanPatro.Close;
             Exit;
           End;
        End;
         

         
        // VERIFICAR SE EXISTEM PREPAROS DE MESES ANTERIORES NÃO FEITOS
        frmAguarde.Mostra(Trim(qryPlanPatro.FieldByName('Patrocinadora').AsString)+' - Verificando Geração de Mês Anterior ... ');
        sAnoMesVerificar := SAnoMesAnterior(sAnoMesCobrancaTela);
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT COUNT(*) AS TOTAL FROM HSTCONTRIBPREV '+
                       ' WHERE  IDPESSJUR   = '+IntToStr(iIdPatroAtual)+
                       ' AND    MESCOBRANCA = '''+sAnoMesVerificar+'''');
        case rgrpTipoCobranca.ItemIndex of
             0 : qryAux.SQL.Add(' AND FLGDESCFOLHA = 1 ');
             1 : qryAux.SQL.Add(' AND FLGDESCFOLHA = 0 ');
             2 : qryAux.SQL.Add(' AND FLGDESCFOLHA = 1 ');
        end;

        if strPlano <> ''
        then qryAux.SQL.Add(' AND IDPLANOPREV IN ('+strPlano+') ');

        if strContrib <> ''
        then qryAux.SQL.Add(' AND IDCONTRIBUICAO IN ('+strContrib+') ');

        if strSituacao <> ''
        then qryAux.SQL.Add(' AND FLGSITFUNDACAO IN ('+strSituacao+') ');

        qryAux.Open;

        if (qryAux.IsEmpty) or (qryAux.FieldByName('TOTAL').AsInteger <= 0)
        then begin
           if MsgDlg('O preparo do mês '+sAnoMesVerificar+' não foi executado para a patrocinadora '+Trim(qryPlanPatro.FieldByName('Patrocinadora').AsString)+'.'+#13+
                     'Caso o mês de '+sAnoMesCobrancaTela+' seja executado, nenhum mês anterior será processado pelo rotina mensal de cobrança.'+#13+
                     'Deseja continuar o preparo ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
           then begin
              frmAguarde.Apaga;
              qryPlanPatro.Close;
              Exit;
           end
           else begin
              GravaLogTOTALPREV ('Preparo Contrib. - Mês '+sAnoMesCobrancaTela+' sem processar mês '+sAnoMesVerificar+'-Patro:'+IntToStr(iIdPatroAtual));
           end;
        end;
        frmAguarde.Apaga;

     end;




     // Sincronismo : Verificar se o envio do CCP para a patrocinadora já foi encerrado
     // Se sim, dar a possibilidade de enviar para o próximo mês
     if (rgrpTipoCobranca.ItemIndex = 0) and
        ( VerificaFechamento( qryPlanPatro.FieldbyName('IdPessJur').AsInteger,
                              cteIdModuloCCP,
                              sAnoMesCobrancaTela,
                              'E', cTipoEnvPrev ) )
     then begin
        if MsgDlg(' O Envio do CCP para a patrocinadora '+qryPlanPatro.FieldByName('Patrocinadora').AsString+
                  ' já foi executado e encerrado para o mês : '+sAnoMesCobrancaTela+'.'+#13+
                  ' Deseja preparar estas contribuições para o próximo mês ? ',
                  'Confirmação',mtConfirmation, [mbYes, mbNo],0) = mrNo
        then begin
           memResult.Lines.Add(' Preparo da patrocinadora '+qryPlanPatro.FieldByName('Patrocinadora').AsString+
                               ' encerrado pelo usuário. ');
           frmAguarde.Apaga;
           Exit;
        end
        else begin
           sAnoMesCobrancaTela := ProximoMesAberto( sAnoMesCobrancaTela,
                                                    qryPlanPatro.FieldbyName('IdPessJur').AsInteger,
                                                    cteIdModuloCCP, 'E');

           MsgDlg(' O mês de cobrança destas contribuições foi alterado para : '+sAnoMesCobrancaTela+'.'+#13+
                  ' Ao final deste processamento, clique novamente sobre o botão "Processar" selecionando '+
                  ' este mês como mês de cobrança.','Atenção',mtInformation,[mbOk, mbHelp],0);
        end;
     end;


     memResult.Lines.Add('___________________________________________________________________________________ ');
     memResult.Lines.Add('=> Patrocinadora :'+ qryPlanPatro.FieldByName('Patrocinadora').AsString+
                         '- Plano : '+qryPlanPatro.FieldByName('Plano').AsString);
     memResult.Lines.Add('=> Preparo das contribuições para : '+ProcSituacao(qryPlanPatro.FieldByName('FlgInterno').AsString));

     sDescLote  := 'Contribuições Prev. - '+Trim(qryPlanPatro.FieldByName('Patrocinadora').AsString)+
                  ' - '+Trim(qryPlanPatro.FieldbyName('Plano').AsString)+
                  ' - '+ProcSituacao(qryPlanPatro.FieldByName('FlgInterno').AsString);

     // SE ESTIVER PROCESSANDO CONTRIBUICAO DE MANTIDO INTEGRAL, ENTAO GERAR O
     // SALARIO DE MANUTENCAO, PARA NA REGRA DE CALCULO ACESSAR ESTE SALARIO
     if qryPlanPatro.FieldbyName('FlgInterno').AsString = 'MA'
     then begin
         if not GERASALARIOMENSALMANTIDO (qryPlanPatro.FieldbyName('IdPessJur').AsInteger,
                                          qryPlanPatro.FieldbyName('IdPlanoPrev').AsInteger)
         then begin
           memResult.Lines.Add('- Erro na Geração dos Salários de Mantido.');
           qryPlanPatro.Next;
           continue;
         end;
     end;


     frmAguarde.Mostra('Verificando Contribuições - Patro : '+Trim(qryPlanPatro.FieldByName('Patrocinadora').AsString)+
                       ' - Plano : '+Trim(qryPlanPatro.FieldbyName('Plano').AsString));

     //  if sMesReferencia <> 13
     //  Abrir query de contribuicoes passando como parametros :
     //  1. o Plano do Loop (qryDatas)
     //  2. a situacao na fundacao
     qryContribuicao.Close;
     qryContribuicao.SQL.Clear;
     qryContribuicao.SQL.Add('SELECT DISTINCT C.IDCONTRIBUICAO, CPP.ORDEMCALCULO, CPP.FLGDESCFOLHA, C.NOME,  '+
                             '       CPP.IDREGRACALCULO , CPP.IDREGRAPRIMPAGTO,           '+
                             '       CPP.IDREGRAULTPAGTO, CPP.FLGPAGADOR, CPP.IDCONTRIBPAI, '+
                             '       CPP.IDCONTRIBPAI2, CPP.IDCONTRIBPAI3, CASSOC1.FLGPAGADOR AS FLGPAGADORASSOC1, '+
                             '       CASSOC2.FLGPAGADOR AS FLGPAGADORASSOC2,CASSOC3.FLGPAGADOR AS FLGPAGADORASSOC3,'+
                             '       C.FLGOBRIGATORIA, CPP.FLGINTERNO, CPP.FLGCOBRADECTERC, CPT.FLGTPVLR,     '+
                             '       NVL(CPT.CODPORTFORMA, CPP.CODPORTFORMA) CODPORTFORMA     '+   
                             'FROM   CONTRIBUICAO C, CONTPREV CPP, CONTPREV CASSOC1, CONTPREV CASSOC2,             '+
                             '       CONTPREV CASSOC3, CONTPLANPATRO CPT                             '+
                             'WHERE  C.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO AND    '+
                             '       ((CPP.FLGINTERNO    = '''+qryPlanPatro.FieldbyName('FlgInterno').AsString+'''');
     If qryPlanPatro.FieldbyName('FlgInterno').AsString = 'AT' Then
       qryContribuicao.SQL.Add(' ) OR (CPP.FLGINTERNO    = ''MP'')) AND ')  

      
     //verificar contribuições associadas
     else If qryPlanPatro.FieldbyName('FlgInterno').AsString = 'MP' Then
       qryContribuicao.SQL.Add(' ) OR (CPP.FLGINTERNO    = ''MA'')) AND ')
      

     Else qryContribuicao.SQL.Add(')) AND ');

     qryContribuicao.SQL.Add('       CPP.IDPLANOPREV   = '+IntToStr(qryPlanPatro.FieldbyName('IdPlanoPrev').AsInteger)+' AND '+
                             '       CPP.FLGDESCFOLHAULT  <> 2  AND '+   
                             '       CPP.IDPLANOPREV   = CASSOC1.IDPLANOPREV(+) AND     '+
                             '       CPP.IDCONTRIBPAI  = CASSOC1.IDCONTRIBUICAO(+) AND  '+
                             '       CPP.IDPLANOPREV   = CASSOC2.IDPLANOPREV(+) AND     '+
                             '       CPP.IDCONTRIBPAI2  = CASSOC2.IDCONTRIBUICAO(+) AND  '+
                             '       CPP.IDPLANOPREV    = CASSOC3.IDPLANOPREV(+) AND     '+
                             '       CPP.IDCONTRIBPAI3  = CASSOC3.IDCONTRIBUICAO(+) AND      '+
                             '       CPT.IDPLANOPREV    = CPP.IDPLANOPREV AND              '+
                             '       CPT.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO  AND       '+
                             '       CPT.IDPESSJUR      = '+IntToStr(qryPlanPatro.FieldbyName('IdPessjur').AsInteger)+'  '); // ANDRE DB2
     if Trim(strContrib) <> ''
     then qryContribuicao.SQL.Add(' AND  CPP.IDCONTRIBUICAO IN ('+strContrib+') ');
     qryContribuicao.SQL.Add( 'ORDER  BY CPP.ORDEMCALCULO ');
     qryContribuicao.Open;
     qryContribuicao.First;

      
     If Not VerificaCodPortForma
      Then Begin
        frmAguarde.Apaga;
        MsgDlg('O preparo de contribuições foi encerrado pois a verificação achou contribuiçoes'+#13+
               'com a forma de pagamento não parametrizada. Observe as mensagens no resultado '+#13+
               'para verificar quais são as contribuições a serem parametrizadas.',
               'Erro de Parametrização',mtError, [mbOk, mbHelp],0);

        memResult.Lines.Add('[AVISO] PREPARO ENCERRADO POR FALTA DE PARAMETRIZAÇÃO.');
        Exit;
      End;
      


      
     // Montar data prevista para a patrocinadora/situacao que estiver sendo executada agora
     sDataPrevista := CriticaDataCobrancaSit( dtmAPrev.qryAux,
                                              IntToStr(qryPlanPatro.FieldbyName('IDPESSJUR').AsInteger),
                                              IntToStr(qryPlanPatro.FieldbyName('IDPLANOPREV').AsInteger),
                                              qryPlanPatro.FieldbyName('FLGINTERNO').AsString,
                                              'N',
                                              Copy(sAnoMesCobrancaTela, 6,2),
                                              Copy(sAnoMesCobrancaTela, 1,4));


     // Inicializar o lote com -1. Só criar o lote se houver alguma contribuicao para esta patroxplano
     idLote := -1;

     while not qryContribuicao.EOF do
     begin
       // Iniciar transacao. Ao final do calculo de cada contribuicao, a transacao
       // sera gravada (commit)
       if not dtmBaseDados.dbBaseDados.InTransaction
       then   StartTransacao;

       iQtdeContribAssoc  := 0;

       // Verificar se a contribuicao possui regra de calculo
       if ( qryContribuicao.FieldByName('IDREGRACALCULO').AsString = '')
       then begin
          memResult.Lines.Add('[ERRO] '+qryContribuicao.FieldByName('Nome').AsString+ ' : REGRA DE CÁLCULO NÃO ASSOCIADA ');
          qryContribuicao.next;
          continue;
       end;

       // Verificar quantas contribuicoes associadas a contribuicao tem
       if qryContribuicao.FieldByName('IdContribPai').AsString  <> '' then inc(iQtdeContribAssoc);
       if qryContribuicao.FieldByName('IdContribPai2').AsString <> '' then inc(iQtdeContribAssoc);
       if qryContribuicao.FieldByName('IdContribPai3').AsString <> '' then inc(iQtdeContribAssoc);

       // Para uma contribuicao de um plano de uma patrocinadora
       // Calcular esta contribuicao para todos os participantes devidos
       // Inserir contribuição no historico
       if not(PreparaQry(qryPlanPatro.FieldByName('IdPessJur').AsInteger,
                         qryPlanPatro.FieldByName('IdPlanoPrev').AsInteger,
                         qryContribuicao.FieldbyName('IdContribuicao').AsInteger,
                         qryContribuicao.FieldByName('FlgInterno').AsString
                        )) then
       begin
          memResult.Lines.Add('[AVISO] '+qryContribuicao.FieldByName('Nome').AsString+ ' : 0 REGISTROS ');
          qryContribuicao.Next;
          Continue;
       end;

        
       frmAguarde.Mostra( qryPlanPatro.FieldByName('Patrocinadora').AsString+' - '+
                          qryPlanPatro.FieldbyName('Plano').AsString+' - '+
                          qryContribuicao.FieldByName('Nome').AsString);

       frmAguarde.pbAguarde.Min      := 0;
       frmAguarde.pbAguarde.Position := 0;
       frmAguarde.pbAguarde.Step     := 1;
       frmAguarde.pbAguarde.Max      := dsContribACalcular.DataSet.RecordCount;
       frmAguarde.pbAguarde.Visible  := True;

       iContReg := 0;
       dsContribACalcular.DataSet.First;
       while not dsContribACalcular.DataSet.EOF do
       begin
          inc(iContReg);

          frmAguarde.pbAguarde.Position  := frmAguarde.pbAguarde.Position + 1;  
          Application.ProcessMessages;

          if idLote <= 0
          then begin
            // Gerar novo lote
            if not CriaLOTE
            then begin
               memResult.Lines.Add('- Erro na Geração do Lote de '+sDescLote);
               continue;
            end;
          end;


          if not chkApenas13.checked
          then begin
             //== Testa Periodicidade - Verifica se a contribuição deve ser cobrada no mês de referência informado
             if not TestaPeriodicidade(dsContribACalcular.DataSet.FieldByName('QTDEMESES').AsString,
                                       dsContribACalcular.DataSet.FieldByName('ULTMESPREPARO').AsString,
                                       sAnoMesCobrancaTela)
             then  begin
                dsContribACalcular.DataSet.Next;
                Continue;
             end;
             bCobra13Individual := False;


             // Gerar historico para o mês normal
             if not GeraHistorico( sDataPrevista,
                                   qryContribuicao.FieldByName('Nome').AsString,
                                   qryPlanPatro.FieldbyName('FlgInterno').AsString,
                                   sAnoMesCobrancaTela,
                                   iQtdeContribAssoc,
                                   bCobra13Individual)
             then bAlgumProblema := True;
          end;

          if (qryPlanPatro.FieldByName('FlgAno13').AsString = 'A')
          then sAnoMesReferencia := IntToStr( StrToInt(Copy(sAnoMesCobrancaTela,1,4)) - 1)+'/13'
          else sAnoMesReferencia := Copy(sAnoMesCobrancaTela,1,4) +'/13';

          // Verificar se é o mes de cobrar contribuicao sobre 13o., ou
          // se é ultimo pagamento e deve cobrar contribuicao sobre 13o.
          // Se sim, repetir a GeraHistorico, para o 13o.
          if (bCobra13 or bCobra13Individual) and
             (qryContribuicao.FieldbyName('FlgCobraDecTerc').AsInteger = 1) and
             (dsContribACalcular.DataSet.FieldByName('UltAno13').AsInteger <>
              StrToInt(Copy(sAnoMesReferencia,1,4)) )
          then begin
             // Gerar historico para o mês normal
             if not GeraHistorico(sDataPrevista,
                                  qryContribuicao.FieldByName('Nome').AsString,
                                  qryPlanPatro.FieldbyName('FlgInterno').AsString,
                                  sAnoMesReferencia,
                                  iQtdeContribAssoc,
                                  bCobra13Individual)
             then bAlgumProblema := True;
          end;

          dsContribACalcular.DataSet.Next;



          //commit parcial
          inc(icontcommit);
          if icontcommit >= ictMaxCommit then
          begin
             CommitPreparo;
             if not dtmBaseDados.dbBaseDados.InTransaction
             then   StartTransacao;
             icontcommit := 0;
          end;
           

       end; // while not dsContribACalcular.DataSet.Next
       frmAguarde.pbAguarde.Visible  := False;
       //======= Joga para o banco os registros por contribuição
       AtualizaLote;
       CommitPreparo;

       qryContribuicao.Next;
     end;//while not qryContribuicao.EOF

     // Após processar todas as contribuicoes daquela situacao daquele plano,
     // verificar se a situacao é MANTIDO
     // Se sim, calcular as exclusivas (menos as de contingencia) da patrocinadora
     // deste tipo de participante
     // pois as exclusivas de ativo e mantido parcial são calculadas no recebimento
     // do interface
     with dtmPreparaContrib.qryContribPatro do
     begin
        Close;
        ParamByName('piIdPessJur').AsInteger  := qryPlanPatro.FieldByName('IdPessJur').AsInteger;
        ParamByName('psMesCobranca').AsString := sAnoMesCobrancaTela;
        Open;
     end; //with qryContribPatro

     if not dtmPreparaContrib.qryContribPatro.IsEmpty
     then begin
        dsContribACalcular.DataSet := dtmPreparaContrib.qryContribPatro;
        dsContribACalcular.DataSet.First;
        iContReg := 0;

         
        frmAguarde.Mostra( qryPlanPatro.FieldByName('Patrocinadora').AsString+' - '+
                           qryPlanPatro.FieldbyName('Plano').AsString+' - '+
                           dtmPreparaContrib.qryContribPatro.FieldByName('Contribuicao').AsString);

        frmAguarde.pbAguarde.Min      := 0;
        frmAguarde.pbAguarde.Position := 0;
        frmAguarde.pbAguarde.Step     := 1;
        frmAguarde.pbAguarde.Max      := dsContribACalcular.DataSet.RecordCount;
        frmAguarde.pbAguarde.Visible  := True;

        while not dsContribACalcular.DataSet.EOF do
        begin
           inc(iContReg);

           frmAguarde.pbAguarde.Position  := frmAguarde.pbAguarde.Position + 1;  
           Application.ProcessMessages;

           if idLote <= 0
           then begin
             // Gerar novo lote
             if not CriaLOTE
             then begin
                memResult.Lines.Add('- Erro na Geração do Lote de '+sDescLote);
                continue;
             end;
           end;

           // Verificar quantas contribuicoes associadas a contribuicao tem
           iQtdeContribAssoc := 0;
           if dtmPreparaContrib.qryContribPatro.FieldByName('IdContribPai').AsString  <> ''
           then inc(iQtdeContribAssoc);
           if dtmPreparaContrib.qryContribPatro.FieldByName('IdContribPai2').AsString <> ''
           then inc(iQtdeContribAssoc);
           if dtmPreparaContrib.qryContribPatro.FieldByName('IdContribPai3').AsString <> ''
           then inc(iQtdeContribAssoc);


           //== Testa Periodicidade - Verifica se a contribuição deve ser cobrada no mês de referência informado
           if not TestaPeriodicidade(dsContribACalcular.DataSet.FieldByName('QTDEMESES').AsString,
                                     dsContribACalcular.DataSet.FieldByName('ULTMESPREPARO').AsString,
                                     sAnoMesCobrancaTela)
           then  begin
              dsContribACalcular.DataSet.Next;
              Continue;
           end;

           bCobra13Individual := False;

           // Gerar historico para o mês normal
           if not GeraHistorico(sDataPrevista,
                                dtmPreparaContrib.qryContribPatro.FieldByName('Contribuicao').AsString,
                                'PT',
                                sAnoMesCobrancaTela,
                                iQtdeContribAssoc,
                                bCobra13Individual)
           then bAlgumProblema := True;

           if qryPlanPatro.FieldByName('FlgAno13').AsString = 'A'
           then sAnoMesReferencia := IntToStr( StrToInt(Copy(sAnoMesCobrancaTela,1,4)) - 1)+'/13'
           else sAnoMesReferencia := Copy(sAnoMesCobrancaTela,1,4) +'/13';

           // Verificar se é o mes de cobrar contribuicao sobre 13o., ou
           // se é ultimo pagamento e deve cobrar contribuicao sobre 13o.
           // Se sim, repetir a GeraHistorico, para o 13o.
           if (bCobra13 or bCobra13Individual) and
              (dtmPreparaContrib.qryContribPatro.FieldbyName('FlgCobraDecTerc').AsInteger = 1)
           then begin
              // Gerar historico para o mês normal
              if not GeraHistorico(sDataPrevista,
                                   dtmPreparaContrib.qryContribPatro.FieldByName('Contribuicao').AsString,
                                   'PT',
                                   sAnoMesReferencia,
                                   iQtdeContribAssoc,
                                   bCobra13Individual)
              then bAlgumProblema := True;
           end;

           dsContribACalcular.DataSet.Next;
        end; // while not dsContribACalcular.DataSet.Next
     end;


      
     // Preparar contribuições de PARCELAMENTO de participantes que não possuem mais contribuições
     // a pagar ( exemplo : mantidos de saldo de conta ) mas que possuem saldo devedor de
     // parcelamento
     qryContribuicao.Close;
     qryContribuicao.SQL.Clear;
     qryContribuicao.SQL.Add(' SELECT DISTINCT C.IDCONTRIBUICAO, CPP.ORDEMCALCULO, CPP.FLGDESCFOLHA, C.NOME,            '+
                             '        CPP.IDREGRACALCULO , CPP.IDREGRAPRIMPAGTO,                                        '+
                             '        CPP.IDREGRAULTPAGTO, CPP.FLGPAGADOR, CPP.IDCONTRIBPAI,                            '+
                             '        CPP.IDCONTRIBPAI2, CPP.IDCONTRIBPAI3, CASSOC1.FLGPAGADOR AS FLGPAGADORASSOC1,     '+
                             '        CASSOC2.FLGPAGADOR AS FLGPAGADORASSOC2,CASSOC3.FLGPAGADOR AS FLGPAGADORASSOC3,    '+
                             '        C.FLGOBRIGATORIA, CPP.FLGINTERNO, CPP.FLGCOBRADECTERC, CPT.FLGTPVLR               '+
                             ' FROM   CONTRIBUICAO C, CONTPREV CPP, CONTPREV CASSOC1, CONTPREV CASSOC2,                 '+
                             '        CONTPREV CASSOC3, CONTPLANPATRO CPT                                               '+
                             ' WHERE  C.IDCONTRIBUICAO    = CPP.IDCONTRIBUICAO                                          '+
                             ' AND    CPP.FLGPARCELAMENTO = 1                                                           '+
                             ' AND    CPP.IDPLANOPREV   = '+IntToStr(qryPlanPatro.FieldbyName('IdPlanoPrev').AsInteger)  +
                             ' AND    CPP.FLGDESCFOLHAULT  <> 2                                                         '+
                             ' AND    CPP.IDPLANOPREV    = CASSOC1.IDPLANOPREV(+)                                       '+
                             ' AND    CPP.IDCONTRIBPAI   = CASSOC1.IDCONTRIBUICAO(+)                                    '+
                             ' AND    CPP.IDPLANOPREV    = CASSOC2.IDPLANOPREV(+)                                       '+
                             ' AND    CPP.IDCONTRIBPAI2  = CASSOC2.IDCONTRIBUICAO(+)                                    '+
                             ' AND    CPP.IDPLANOPREV    = CASSOC3.IDPLANOPREV(+)                                       '+
                             ' AND    CPP.IDCONTRIBPAI3  = CASSOC3.IDCONTRIBUICAO(+)                                    '+
                             ' AND    CPT.IDPLANOPREV    = CPP.IDPLANOPREV                                              '+
                             ' AND    CPT.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO                                           '+
                             ' AND    CPT.IDPESSJUR      = '+IntToStr(qryPlanPatro.FieldbyName('IdPessjur').AsInteger)   );

     if Trim(strContrib) <> ''
     then qryContribuicao.SQL.Add(' AND  CPP.IDCONTRIBUICAO IN ('+strContrib+') ');
     qryContribuicao.SQL.Add( 'ORDER  BY CPP.ORDEMCALCULO ');
     qryContribuicao.Open;
     qryContribuicao.First;

     frmAguarde.Mostra('Verificando Parcelamentos Pendentes ...');
     frmAguarde.pbAguarde.Visible := False;
     while not qryContribuicao.EOF do
     begin
        iQtdeContribAssoc  := 0;
        // Verificar quantas contribuicoes associadas a contribuicao tem
        if qryContribuicao.FieldByName('IdContribPai').AsString  <> '' then inc(iQtdeContribAssoc);
        if qryContribuicao.FieldByName('IdContribPai2').AsString <> '' then inc(iQtdeContribAssoc);
        if qryContribuicao.FieldByName('IdContribPai3').AsString <> '' then inc(iQtdeContribAssoc);

        // Para uma contribuicao de um plano de uma patrocinadora
        // Calcular esta contribuicao para todos os participantes devidos
        // Inserir contribuição no historico
        if not(PreparaQry(qryPlanPatro.FieldByName('IdPessJur').AsInteger,
                          qryPlanPatro.FieldByName('IdPlanoPrev').AsInteger,
                          qryContribuicao.FieldbyName('IdContribuicao').AsInteger,
                          'PARCELA'
                         )) then
        begin
           qryContribuicao.Next;
           continue;
        end;

        dsContribACalcular.DataSet.First;
        while not dsContribACalcular.DataSet.EOF do
        begin
           if idLote <= 0
           then begin
             // Gerar novo lote
             if not CriaLOTE
             then begin
                memResult.Lines.Add('- Erro na Geração do Lote de '+sDescLote);
                continue;
             end;
           end;


           if not chkApenas13.checked
           then begin
              //== Testa Periodicidade - Verifica se a contribuição deve ser cobrada no mês de referência informado
              if not TestaPeriodicidade(dsContribACalcular.DataSet.FieldByName('QTDEMESES').AsString,
                                        dsContribACalcular.DataSet.FieldByName('ULTMESPREPARO').AsString,
                                        sAnoMesCobrancaTela)
              then  begin
                 dsContribACalcular.DataSet.Next;
                 Continue;
              end;
              bCobra13Individual := False;

              // Gerar historico para o mês normal
              if not GeraHistorico( sDataPrevista,
                                    qryContribuicao.FieldByName('Nome').AsString,
                                    qryPlanPatro.FieldbyName('FlgInterno').AsString,
                                    sAnoMesCobrancaTela,
                                    iQtdeContribAssoc,
                                    bCobra13Individual)
              then bAlgumProblema := True;
           end;
           dsContribACalcular.DataSet.Next;
        end;
        qryContribuicao.Next;
     end;
     frmAguarde.Apaga;


     frmAguarde.pbAguarde.Visible  := False;

     strLotePrepAgora  := strLotePrepAgora  + IntToStr(idlote)+',';
     rTotalTodosLotes  := rTotalTodosLotes  + rTotalLote;
     iNumRegTodosLotes := iNumRegTodosLotes + iNumRegLote;
     qryPlanPatro.Next;
  end;//while

  frmAguarde.Mostra('Efetivando Preparo ... ');

  if dsContribACalcular.DataSet <> nil
  then dsContribACalcular.DataSet.Close;

  qryAux.Close;

  // Gravar alteracoes
  // Nao posso usar o AplicaAlteracoes porque tenho 2 querys com UpdateSQL e
  // 2 querys sem UpdateSQL
  if CommitPreparo
  then begin
       //== Encerrar as contribuicoes devidas do lote
       if Trim(strLotePrepAgora) <> ''
       then if not EncerraContribLote(idlote,
                                      qryPlanPatro.FieldbyName('IdPessJur').AsInteger,
                                      qryPlanPatro.FieldByName('IdPlanoPrev').AsInteger,
                                      sAnoMesCobrancaTela,   //sMesReferencia
                                      qryPlanPatro.FieldByName('FlgInterno').AsString,
                                      strLotePrepAgora)
            then begin
               memResult.Lines.Add('=> Erro no Encerramento das Contribuições do Lote de '+sDescLote);
            end;
  end;

  frmAguarde.Apaga;

  if (not(bAlgumProblema)) and ((rTotalTodosLotes >= 0) or (iNumRegTodosLotes >= 0))
  then Result   := True    //MsgDlg('Preparo do Envio Contribuições efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0)
  else begin
     if (rTotalTodosLotes > 0) or (iNumRegTodosLotes > 0 )
     then  Result  := True    //MsgDlg('Preparo de Contribuições efetuado com alguns problemas.','Problemas',mtError,[mbOk,mbHelp],0)
     else  Result  := False;  //MsgDlg('Preparo de Contribuições encerrado sem nenhuma contribuição.','Informação',mtInformation,[mbOk,mbHelp],0);
  end;
end; // PreparaContribuicao



function  TfrmPreparaEnvia.GeraSalarioMensalMantido( piIdPessJur,
                                                     piIdPlanoPrev : longint ) : boolean;
var sUltDiaMes,
    sNovoSalario,
    sNovoSalarioAtivoMP,
    sMsgErro  : String;

begin
   Result := False;

   frmAguarde.Mostra('Verificando Salários dos Mantidos ...');
   sUltDiaMes := IntToStr(TrazUltDiaMes( StrToInt(Copy(sAnoMesCobrancaTela,6,2)), StrToInt(Copy(sAnoMesCobrancaTela,1,4))));

   with qryMantidos do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA, PP.INSCRICAONUMERO, PP.SALMANTIDO '+
              ' FROM   PARTPREVPLAN  PP, SITPART SP                              '+
              ' WHERE  PP.IDPESSJUR    = '+IntToStr(piIdPessJur)+
              ' AND    PP.IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
              ' AND    PP.IDSITPART    = SP.IDSITPART '+
              ' AND    SP.FLGINTERNO   = ''MA'' ' +
              ' AND    PP.DATAINICIOMANUT <= TO_DATE('''+sUltDiaMes+'/'+Copy(sAnoMesCobrancaTela,6,2)+'/'+Copy(sAnoMesCobrancaTela,1,4)+''',''dd/mm/yyyy'') '+
              ' AND    ((PP.DATACANCELAMENTO IS NULL) OR (PP.DATACANCELAMENTO >= TO_DATE('''+sUltDiaMes+'/'+Copy(sAnoMesCobrancaTela,6,2)+'/'+Copy(sAnoMesCobrancaTela,1,4)+''',''dd/mm/yyyy'') )) ');  
      Open;
      frmAguarde.pbAguarde.Min      := 0;
      frmAguarde.pbAguarde.Position := 0;
      frmAguarde.pbAguarde.Step     := 1;
      frmAguarde.pbAguarde.Max      := qryMantidos.RecordCount;
      frmAguarde.pbAguarde.Visible  := True;

      while not EOF do
      begin
         if FieldByName('SALMANTIDO').AsFloat <= 0
         then begin
            memResult.Lines.Add('Inscrição :'+FieldbyName('INSCRICAONUMERO').AsString+
                            ' - Possível problema : salário de manutenção atual está ZERADO. Verifique');

         end
         else begin
             
            try
               GeraSalarioRetroativo( piIdPessJur,
                                             piIdPlanoPrev,
                                             FieldByName('IdPessoa').AsInteger,
                                             'MA',
                                             '01/'+Copy(sAnoMesCobrancaTela,6,2)+'/'+Copy(sAnoMesCobrancaTela,1,4),
                                             sUltDiaMes+'/'+Copy(sAnoMesCobrancaTela,6,2)+'/'+Copy(sAnoMesCobrancaTela,1,4),
                                             FieldByName('SALMANTIDO').AsString,
                                             sNovoSalario,
                                             sNovoSalarioAtivoMP,
                                             qryAux,
                                             sMsgErro,
                                             'DM', False);
            except
            end;
         end;
         frmAguarde.pbAguarde.Position  := frmAguarde.pbAguarde.Position + 1;
         Application.ProcessMessages;
         Next;
      end;

   end;
   frmAguarde.Apaga;
   Result := True;
end;



procedure TfrmPreparaEnvia.EnviaContribuicaoCcp;
var bEnviouBanco,
    bAlgumaContribSele,
    bErro              : boolean;

    sDiaIni,
    sDiaFim,
    sSQLLotes,
    sIdPessoa,
    sSalarioMa,
    sCamposObrig,
    sCamposNObrig,
    sMesRefInicioMa,
    sLstLotesEnviados,
    strContrib,
    sMsgErro,
    sTipOperEnvio      : String;
    icontcommit        : Integer;

    i                  : Integer;

    iOrdem,
    iPlnCodigo,
    iTotalPendentes,
    iUltimaContrib,
    iCodLancCAPCAR     : longInt;

    rEnvio,
    rTotal         : double;
    cTipoEnvPrev   : char;


    sIdPessoaAnt, sIdContribuicao, sFlgPagador, sFlgSitfundacao,
    sMesRefAnt, sDataPrevisaoRece, sIdPessjur, sIdPlanoPrev, sCodCentroCusto, sCodportforma : String;

    bContabilizaNoENvio : Boolean;
    cRecPag             : char;
    bAlgumErro          : boolean;
    bEnvio13            : Boolean;


    sNumRecebimento, sAux1, sAux2 : String;

    sChkMsg, SQLwhere, sdataBpd, sMsgPga, sCodDocumentos : String; // SOL 130118 Kintana 817114

    piUltimaContrib : Integer;

    // Kintana 1461555 SOL 166858 - Otacilio
    sDataPreviRece : string;
begin

  // SOL 130118 Kintana 817114
  sMsgPga := '';
  if (CbPga.Checked) and not(CbBpd.Checked) then
     sChkMsg := 'PGA'
  else
  if not(CbPga.Checked) and (CbBpd.Checked) then
     sChkMsg := 'BPD'
  else
  if (CbPga.Checked) and (CbBpd.Checked) then
     sChkMsg := 'PGA/BPD';
  // SOL 130118 Kintana 817114

  icontcommit := 0;

  frmAguarde.Mostra('Verificando Dados Auxiliares ...');
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT TIPOPERENVIO FROM PARAMAPREV  ');
  qryAux.Open;

  if not qryAux.IsEmpty
  then sTipOperEnvio := qryAux.FieldByName('TIPOPERENVIO').AsString
  else sTipOperEnvio := '';
  qryAux.Close;


  // Verificação de existência de contribuições de 13º nos lotes a serem enviados
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT 1');
  qryAux.SQL.Add('FROM HSTCONTRIBPREV');
  qryAux.SQL.Add('WHERE (MESCOBRANCA = '''+sAnoMesCobrancaTela+''') ');
  qryAux.SQL.Add('  AND (IDPESSJUR   IN ('+strPatro+') )');
  qryAux.SQL.Add('  AND (IDPLANOPREV IN ('+strPlano+') )');
  qryAux.SQL.Add('  AND (FLGSITFUNDACAO IN ('+strSituacao+') )');
  qryAux.SQL.Add('  AND (MESREFERENCIA = '''+Copy(sAnoMesCobrancaTela,1,4)+'/13'+''') ');
  qryAux.Open;

  If (Not qryAux.IsEmpty) and (Not chkApenas13.Checked)
     // Kintana 1461555 SOL 166858 - Otacilio ** Inicio **
     {((rgrpMeses.ItemIndex = 1) Or (rgrpMeses.ItemIndex = 2)) }
     and ((chkApenasMes.Checked) or (chkApenasAtrasadas.Checked)) then
     // Kintana 1461555 SOL 166858 - Otacilio ** Fim **
  Begin
       If MsgDlg('Existem contribuições sobre 13º nos lotes a serem enviados.'+#13+
                 'Deseja realmente cobrar estas contribuições sobre 13º ? ',
                 'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
        Then Begin
          bEnvio13 := False;
          If MsgDlg('Deseja continuar o Envio de Contribuições ? ','Confirmação',
                    mtConfirmation, [mbYes, mbNo], 0 ) = mrNo
           Then Exit;
        End
        Else bEnvio13 := True;
  End
  Else
    bEnvio13 := False;


  frmAguarde.Apaga;

  frmAguarde.Mostra('Iniciando Envio de Contribuições ');
  lsLotesEnviados.Clear;
  bEnviouBanco := False;

  qryContabil.Close;
  qryContabil.ParamByName('PLNCODIGO').AsInteger := -1;
  qryContabil.Prepare;
  qryContabil.Open; // query CachedUpdate que contém os registros a serem
                    // passados à LancaContab

  qryDocumentos.Close;
  qryDocumentos.ParamByName('CODDOCUMENTO').AsInteger := -1;
  qryDocumentos.Prepare;
  qryDocumentos.Open; // query CachedUpdate que contém todos os documentos
                      // criados neste processo, que serão (ao final
                      // do mesmo) atualizados com o número da planilha
                      // contábil (plncodigo) gerada na contabilização

  memResult.Lines.Add('=================================================================================== ');
  memResult.Lines.Add('ENVIO DE COBRANÇA - DATA : '+DateToStr(date)+'    LISTA DE RESULTADOS ');
  memResult.Lines.Add('MÊS DE COBRANÇA : '+Trim(sAnoMesCobrancaTela));
  memResult.Lines.Add('___________________________________________________________________________________ ');

  // Kintana 1461555 SOL 166858 - Otacilio ** Inicio **
  {if rgrpMeses.ItemIndex <> 1
  then AlteraIdloteAtrasoDevol;}
  if not chkApenasMes.Checked then
    AlteraIdloteAtrasoDevol;
  // Kintana 1461555 SOL 166858 - Otacilio ** Fim **

  frmAguarde.Mostra('Verificando Lotes a Enviar ... ');

  // Preencher filtro de contribuicoes, caso haja
  strContrib := ' ';
  bAlgumaContribSele := False;
  bEnviouContribBanco := False;  
  for i := 0 to chklstContrib.Items.Count - 1 do
  begin
      if qryFiltroContrib.Locate('Nome',chklstContrib.Items[i],[loCaseInsensitive,loPartialKey])
      then begin
        if chklstContrib.checked[i] // Adicionar plano a String de planos
        then begin
           strContrib:= strContrib + qryFiltroContrib.FieldByName('IdContribuicao').AsString+ ', ';
           bAlgumaContribSele := True;
        end;
      end;
  end;

  if Trim(strContrib) = '' then
  begin
    for i := 0 to chklstContrib.Items.Count - 1 do
    begin
      if qryFiltroContrib.Locate('Nome',chklstContrib.Items[i],[loCaseInsensitive,loPartialKey])
      then strContrib:= strContrib + qryFiltroContrib.FieldByName('IdContribuicao').AsString + ', ';
    end;//for
  end;

  if Trim(strContrib) <> '' then strContrib := Copy(strContrib, 1, Length(strContrib) - 2);

  // -----------------------------------------------------------------------------------------------

  // Filtrar do historico os "IdLote" de acordo com os filtros do usuario na tela
  sSQLLotes :=
  'SELECT '                                                                                         + #13 +
  '  HST.IDLOTE, HST.IDMOTIVO, HST.IDPESSJUR, P.NOME AS PATROCINADORA, '                            + #13 +
  '  MAX(HST.FLGDESCFOLHA) AS FLGDESCFOLHA '                                                        + #13 +

  'FROM '                                                                                           + #13 +
  '  PESSOA          P,  '                                                                          + #13 +
  '  ELEGPATRO       EL, '                                                                          + #13 +
  '  HSTCONTRIBPREV  HST '                                                                          + #13 +

  'WHERE '                                                                                          + #13 +
  '      HST.MESCOBRANCA        = ' + QuotedStr(sAnoMesCobrancaTela)                                + #13 +
  '  AND HST.IDPESSJUR          IN (' + strPatro + ') '                                             + #13 +
  '  AND HST.IDPLANOPREV        IN (' + strPlano + ') '                                             + #13 +
  '  AND EL.IDPESSJUR           = HST.IDPESSJUR '                                                   + #13 +
  '  AND EL.IDPESSOA            = HST.IDPESSOA  '                                                   + #13;

  if Pos('AT', strSituacao) > 0 then sSQLLotes := sSQLLotes +
  '  AND ( '                                                                                        + #13 +
  '      (HST.FLGSITFUNDACAO    IN (' + strSituacao + ')) OR '                                      + #13 +
  '      ((EL.IDPESSJURCEDIDO   IS NOT NULL) AND (HST.FLGSITFUNDACAO = ''MA'')) '                   + #13 +
  '      ) '                                                                                        + #13
  else sSQLLotes := sSQLLotes +
  '  AND HST.FLGSITFUNDACAO     IN (' + strSituacao + ') '                                          + #13;


  if not(CbBpd.Checked) then
     sSQLLotes := sSQLLotes +
     '  AND HST.SITRECEBIMENTO     IN (''0'', ''8'') '                                              + #13
  else
     sSQLLotes := sSQLLotes +
     '  AND HST.SITRECEBIMENTO      IN (''0'',''1'',''8'') '                                        + #13;

  sSQLLotes := sSQLLotes +
  '  AND HST.IDPESSJUR          = P.IDPESSOA '                                                      + #13 +
  '  AND HST.IDLOTE             IS NOT NULL '                                                       + #13;

  // enviar apenas as geradas por eventos
  if rgrpContribuicoes.ItemIndex = 1 then sSQLLotes := sSQLLotes +
  '  AND HST.FLGEVENTO          = 1 '                                                               + #13;

  // -----------------------------------------------------------------------------------------------

  // Kintana 1461555 SOL 166858 - Otacilio ** Inicio **
  if not(chkApenas13.Checked) then
  begin
    //case rgrpMeses.ItemIndex of
    if (not chkApenasMes.Checked) and (not chkApenasAtrasadas.Checked) and (not chkApenasDevolucoes.Checked) then
    begin
      if chkApenasMes.Checked then
        //   1:
          if not(bEnvio13) then sSQLLotes := sSQLLotes + // apenas do mes
            '   AND HST.MESREFERENCIA      = HST.MESCOBRANCA ' + #13
          else sSQLLotes := sSQLLotes +
            '  AND ((HST.MESREFERENCIA    = HST.MESCOBRANCA) OR (HST.MESREFERENCIA = '+QuotedStr(Copy(sAnoMesCobrancaTela,1,4)+'/13')+') )';

         // 2:
      if chkApenasAtrasadas.Checked then
        if not(bEnvio13) then sSQLLotes := sSQLLotes + // apenas atrasadas
          '  AND HST.MESREFERENCIA     <> HST.MESCOBRANCA ' +
          '  AND HST.FLGDEVOLUCAO       = 0 '
        else sSQLLotes := sSQLLotes +
          '  AND ((HST.MESREFERENCIA   <> HST.MESCOBRANCA) OR (HST.MESREFERENCIA = '+QuotedStr(Copy(sAnoMesCobrancaTela,1,4)+'/13')+') )'+
          '  AND (HST.FLGDEVOLUCAO       = 0) ' ;

      //3:
      if chkApenasDevolucoes.Checked then
        sSQLLotes := sSQLLotes + '  AND (HST.MESREFERENCIA <> HST.MESCOBRANCA) '        + #13 +
                                 '  AND (HST.FLGDEVOLUCAO  = 1) '   {apenas devolucoes} + #13;
    end;
  end  // case rgrpMeses.ItemIndex of

  //end   // if not(chkApenas13.Checked)
  else sSQLLotes := sSQLLotes +
    '  AND HST.MESREFERENCIA      = ' + QuotedStr(Copy(sAnoMesCobrancaTela,1,4)+'/13')                + #13;

  // Kintana 1461555 SOL 166858 - Otacilio ** Fim **
  // -----------------------------------------------------------------------------------------------

  if rgrpDataVencimento.ItemIndex = 1 then
  begin
    // Kintana 1461555 SOL 166858 - Otacilio
    //sDiaIni := Trim(spedDiaIni.Text);
    //sDiaFim := Trim(spedDiaFim.Text);

    //if Trim(sDiaIni) <> '' then sSQLLotes := sSQLLotes +
    //'  AND TO_CHAR(HST.DATAPREVISAORECE, ''DD'') >= ' + QuotedStr(sDiaIni)                            + #13;

    //if Trim(sDiaFim) <> '' then sSQLLotes := sSQLLotes +
    //'  AND TO_CHAR(HST.DATAPREVISAORECE, ''DD'') <= ' + QuotedStr(sDiaFim)                            + #13;

    sSQLLotes := sSQLLotes +
      '  AND (TO_CHAR(HST.DATAPREVISAORECE, ''DD/MM/YYYY'') = ''' + dtVencBoleta.Text + ''' ) '     + #13;
  end;

  // -----------------------------------------------------------------------------------------------

  if (bAlgumaContribSele) and (Trim(strContrib) <> '') then sSQLLotes := sSQLLotes +
  '  AND HST.IDCONTRIBUICAO     IN (' + strContrib + ') '                                           + #13;

  // -----------------------------------------------------------------------------------------------

   
  if rgrpTipoCobranca.ItemIndex = 0 then sSQLLotes := sSQLLotes +
  '  AND HST.FLGDESCFOLHA       = 1 '                                                               + #13 +
  '  AND HST.FOLHAORIGEM        = ''P'' '                                                           + #13
  else if rgrpTipoCobranca.ItemIndex = 1 then sSQLLotes := sSQLLotes +
  '  AND HST.FLGDESCFOLHA       = 0 '                                                               + #13 +
  '  AND HST.FOLHAORIGEM        = ''C'' '                                                           + #13
  else if rgrpTipoCobranca.ItemIndex = 2 then sSQLLotes := sSQLLotes + // INCENTIVADOS
  '  AND HST.FLGDESCFOLHA       = 0 '                                                               + #13 +
  '  AND EXISTS ( '                                                                                 + #13 +
  '             SELECT 1 FROM '                                                                     + #13 +
  '               ELEGPATRO EL, '                                                                   + #13 +
  '               SITFUNC   SIT '                                                                   + #13 +
  '             WHERE '                                                                             + #13 +
  '                   EL.IDPESSJUR    = HST.IDPESSJUR '                                             + #13 +
  '               AND EL.IDPESSOA     = HST.IDPESSOA '                                              + #13 +
  '               AND SIT.IDSITFUNC   = EL.IDSITFUNC '                                              + #13 +
  '               AND SIT.FLGINTERNO  IN (6,7) '                                                    + #13 +
  '             ) '                                                                                 + #13 +
  '  AND HST.FOLHAORIGEM        = ''C'' '                                                           + #13
  else if rgrpTipoCobranca.ItemIndex = 3 then sSQLLotes := sSQLLotes +
  '  AND HST.FOLHAORIGEM       <> ''B'' '                                                           + #13;
   

  // -----------------------------------------------------------------------------------------------

  sSQLLotes := sSQLLotes +
  'GROUP BY '                                                                                       + #13 +
  '  HST.IDLOTE, HST.IDMOTIVO, HST.IDPESSJUR, P.NOME ';

  // -----------------------------------------------------------------------------------------------

  qryLotesAEnviar.Close;
  qryLotesAEnviar.SQL.Clear;
  qryLotesAEnviar.SQL.Add(sSQLLotes);
  qryLotesAEnviar.Open;
  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  //QRYLOTESAENVIAR.SQL.SaveToFile('c:\AdmPrev_Envio_Lotes.txt');
  QRYLOTESAENVIAR.SQL.SaveToFile( Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\AdmPrev_Envio_Lotes.txt');

  // -----------------------------------------------------------------------------------------------

  bErro := False;

  dtmBaseDados.dbBaseDados.StartTransaction;

  if not(GravaLogTOTALPREV('Envio Contrib. - Mês ' + sAnoMesCobrancaTela + '[Patros.: ' + strPatro + '-Planos:' + strPlano + ']')) then
  begin
    memResult.Lines.Add('[ERRO] - ERRO NA GRAVAÇÃO DO LOG. ');
  end;

  if qryLotesAEnviar.IsEmpty then
  begin
     memResult.Lines.Add('[AVISO] - NENHUM LOTE ENCONTRADO PARA PROCESSAMENTO DO ENVIO ');
  end;

  bAlgumErro := False;

  qryLotesAEnviar.First;
  // Para cada lote selecionado,
  // Ler contribuicoes e enviá-las (ou para banco ou para tmpdesc)
  while not qryLotesAEnviar.EOF do
  begin

     if (qryLotesAEnviar.FieldByName('FlgDescFolha').AsInteger = 1 )
     then begin
        if not ValidaLote(qryAux,sAnoMesCobrancaTela,
                           qryLotesAEnviar.FieldByName('IdLote').AsString, sMsgErro)
        then begin
            memResult.Lines.Add(' ');
            memResult.Lines.Add('[ERRO] LOTE Nº '+qryLotesAEnviar.FieldByName('IdLote').AsString+' : '+sMsgErro+'- LOTE NÃO ENVIADO ');
            qryLotesAEnviar.Next;
            continue;
        end;
        // Verificar sincronismo
        if (VerificaFechamento( qryLotesAEnviar.FieldbyName('IdPessJur').AsInteger,
                                cteIdModuloCCP,
                                sAnoMesCobrancaTela, 'E',cTipoEnvPrev) )
        then begin
           MsgDlg(' O Envio do CCP para a patrocinadora '+qryLotesAEnviar.FieldByName('Patrocinadora').AsString+
                     ' já foi executado e encerrado para o mês : '+sAnoMesCobrancaTela+'.'+#13+
                     ' Logo, para executar o envio para este mês será necessário desfazer o envio encerrado. ',
                     'Erro',mtError, [mbOk, mbHelp],0);

           memResult.Lines.Add('[AVISO] ENVIO DA PATROCINADORA '+QRYPLANPATRO.FIELDBYNAME('PATROCINADORA').ASString+
                               ' ENCERRADO PELO USUÁRIO. ');
           frmAguarde.Apaga;
           Exit;
        end;
     end;

     // Se for um lote de PARCELAMENTO, calcular os alteradores agora,
     // antes de fazer o envio, para que o envio leia também os alteradores.
     if (prmIdMotivoParcelaPREV > 0) and
        (qryLotesAEnviar.FieldByName('IdMotivo').AsInteger = prmIdMotivoParcelaPREV)
     then begin
        // Calcular e gerar no historico os alteradores das parcelas do lote
        if not GeraAlteradorPARCELA(qryLotesAEnviar.FieldByName('IdLote').AsInteger,
                                    sMsgErro)
        then begin
           memResult.Lines.Add('[ERRO] LOTE Nº '+qryLotesAEnviar.FieldByName('IdLote').AsString+
                               ' : '+sMsgErro);
           qryLotesAEnviar.Next;
           bErro := True;
           continue;
        end;
     end; // se for parcelamento

     // Se for cobranca em Folha, ou Ambas ou
     // (Se for cobranca bancaria e o usuario NAO optou por apenas atrasadas )
     if (rgrpTipoCobranca.ItemIndex = 0) or (rgrpTipoCobranca.ItemIndex = 3) or
        ( (rgrpTipoCobranca.ItemIndex = 1)
        {and (rgrpMeses.ItemIndex <> 2)}   
                                          //tratamento de divergências
        )
     then begin
        // Verificar contribuições do mês
        frmAguarde.Mostra('Verificando Cobranças do Lote Nº '+qryLotesAEnviar.FieldbyName('IDLOTE').AsString);

        // Guarda o Id de todos os lotes marcados para envio
        lsLotesEnviados.Items.Add(qryLotesAEnviar.FieldByName('IdLote').AsString);

        // Kintana 1461555 SOL 166858 - Otacilio ** Inicio **
        // Ler contribuicoes a enviar do lote atual
        sDataPreviRece := '';
        if rgrpDataVencimento.ItemIndex = 1 then
          sDataPreviRece := dtVencBoleta.Text;

        if not LerContribAEnviar(qryLotesAEnviar.FieldByName('IdLote').AsInteger,
                                 -1,
                                 sAnoMesCobrancaTela,
                                 qryEnvio,
                                 {rgrpMeses.ItemIndex} // Kintana 1461555 SOL 166858 - Otacilio
                                 chkApenasMes.Checked,
                                 chkApenasAtrasadas.Checked,
                                 chkApenasDevolucoes.Checked,
                                 sDataPreviRece)
        then begin
           memResult.Lines.Add('[ERRO] LOTE Nº '+qryLotesAEnviar.FieldByName('IdLote').AsString+
                               ' : ERRO NA LEITURA DAS CONTRIBUIÇÕES A ENVIAR ');
           qryLotesAEnviar.Next;
           bErro := True;
           continue;
        end;
        // Kintana 1461555 SOL 166858 - Otacilio ** Fim **

        //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
        //qryEnvio.SQL.SaveToFile('c:\AdmPrev_qryEnvio.txt');
        qryEnvio.SQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\AdmPrev_qryEnvio.txt');

        // Verificar se query a enviar está em branco
        if qryEnvio.IsEmpty
        then begin
            memResult.Lines.Add('[AVISO] LOTE Nº '+qryLotesAEnviar.FieldByName('IdLote').AsString+
                                ' : CONTRIBUIÇÕES NÃO ENCONTRADAS NO HISTÓRICO ');
            qryLotesAEnviar.Next;
            continue;
        end;

        // Inicializar variaveis por Lote
        memResult.Lines.Add('___________________________________________________________________________________ ');
        memResult.Lines.Add('=> Contribuições do Lote Nº : '+qryLotesAEnviar.FieldByName('IdLote').AsString);
        iUltimaContrib := -1;
        iOrdem     := 0;
        rTotal     := 0;
        sIdPessoa  := '';

        // Criar documento
        qryEnvio.First;

        sIdPessoaAnt := '';
        sMesRefAnt   := '';
        sNumRecebimento := '';
        sIdContribuicao := '';
        sFlgPagador := '';
        sflgSitFundacao := '';
        sDataPrevisaoRece := '';



        frmAguarde.Mostra('Enviando Cobranças do Lote Nº '+qryLotesAEnviar.FieldbyName('IDLOTE').AsString);

        frmAguarde.pbAguarde.Min      := 0;
        frmAguarde.pbAguarde.Position := 0;
        frmAguarde.pbAguarde.Step     := 1;
        frmAguarde.pbAguarde.Max      := qryEnvio.RecordCount;
        frmAguarde.pbAguarde.Visible  := True;

        while not qryEnvio.EOF do
        begin

           frmAguarde.Mostra('Enviando Cobranças do Lote Nº '+qryLotesAEnviar.FieldbyName('IDLOTE').AsString);

           // Enviar registro
           inc(iOrdem);

           sMsgErro := '';

           if (qryEnvio.FieldByName('FlgDescFolha').AsInteger = 1) and
              (
               (qryEnvio.FieldByName('FlgPagador').AsString    = 'C') OR
               ((qryEnvio.FieldByName('FlgPagador').AsString    = 'P') and
                (qryEnvio.FieldByName('FLGRECECONTPATRO').AsInteger    = 1))
              )
           then begin
              rEnvio := EnviaContribuicao(qryEnvio,iOrdem,
                                          qryLotesAEnviar.FieldByName('IdLote').AsInteger,
                                          -1, -1,
                                          qryEnvio.FieldByName('flgSitFundacao').AsString,
                                          qryEnvio.FieldByName('flgIntEvento').AsString,
                                          iUltimaContrib,bExigeFinanc);
           end
           else begin
              bEnviouBanco := True;
              sCamposObrig := '';
              cRecPag := 'R';

              if ( (qryEnvio.FieldbyName('FLGDEVOLUCAO').AsInteger = 0) and (not prmIntegraCAR) ) or
                 ( (qryEnvio.FieldbyName('FLGDEVOLUCAO').AsInteger = 1) and (not prmIntegraCAP) )
              then begin
                 if qryEnvio.FieldbyName('FLGDEVOLUCAO').AsInteger = 1
                 then begin
                    MsgDlg('O sistema AdmPREV NÃO está integrado ao sistema de Contas a Pagar.'+#13+
                           'Logo, não é possível efetuar o envio de contribuição para este sistema. Verifique.','Erro',mtError,[mbOK],0);
                    bErro := True;
                    rEnvio := -1;
                    memResult.Lines.Add('[ERRO] AdmPREV NÃO INTEGRADO com Contas a Pagar. ');
                 end
                 else begin
                    MsgDlg('O sistema AdmPREV NÃO está integrado ao sistema de Contas a Receber.'+#13+
                           'Logo, não é possível efetuar o envio de contribuição para este sistema. Verifique.','Erro',mtError,[mbOK],0);
                    bErro := True;
                    rEnvio := -1;
                    memResult.Lines.Add('[ERRO] AdmPREV NÃO INTEGRADO com Contas a Receber. ');
                 end;
              end
              else begin

                 rEnvio := EnviaContribuicaoBANCO (qryContabil, qryDocumentos, qryEnvio, qryAux,
                                      Copy(sAnoMesCobrancaTela,6,2) , sAnoMesCobrancaTela,
                                      Copy('Cobrança de '+qryEnvio.FieldByName('NomeContrib').AsString,1,40),
                                      Copy('Receita  de '+qryEnvio.FieldByName('NomeContrib').AsString,1,40),
                                      dtVencBoleta.Text,
                                      qryEnvio.FieldByName('IdPessJur').AsInteger,
                                      qryEnvio.FieldByName('IdPlanoPrev').AsInteger,
                                      qryEnvio.FieldByName('IdPessoa').AsInteger,
                                      qryEnvio.FieldByName('IdContribuicao').AsInteger,
                                      iUltimaContrib,
                                      CtrlDocumento,
                                      qryEnvio.FieldByName('FlgPagador').AsString,
                                      qryEnvio.FieldByName('flgSitFundacao').AsString,
                                      -1, // deixar a funcao buscar o codportforma
                                      cRecPag,
                                      qryEnvio.FieldByName('ValorEsperado').AsFloat,
                                      sMsgErro, iCodLancCAPCAR, iPlnCodigo);
              end;



           end;


           if rEnvio <= 0
           then begin
              if Trim(sCamposObrig) <> ''
              then begin
                 memResult.Lines.Add('[AVISO] '+qryEnvio.FieldByName('NomeContrib').AsString+' - CAMPOS OBRIGATÓRIOS EM BRANCO : '+
                                        '(Identificador : '+qryEnvio.FieldByName('IdPessoa').AsString+')'+
                                     sCamposObrig);
                 memResult.Lines.Add('         < este problema impacta apenas a rotina de recebimento. Envio OK. >');
              end
              else begin

                 if rEnvio < 0
                 then begin
                    memResult.Lines.Add('[ERRO] '+qryEnvio.FieldByName('NomeContrib').AsString+
                                        '(Identificador : '+qryEnvio.FieldByName('IdPessoa').AsString+')'+
                                        ' - '+sMsgErro);
                    bAlgumErro := True;
                 end;
              end;
              iultimacontrib :=   qryEnvio.FieldByName('IdContribuicao').AsInteger;


              // Alterando a situação da tabela de histórico individualmente
              With qryAux do
               Begin
                 Close;
                 SQL.Clear;
                 SQL.Add('UPDATE HSTCONTRIBPREV ');
                 SQL.Add('SET SITRECEBIMENTO = 1');
                 SQL.Add(' , DATAEMISSCOB     = SYSDATE '); // SOL 180156 Kintana 1668852
                 SQL.Add('WHERE MESREFERENCIA  = '+ QuotedStr(qryEnvio.FieldByName('MESREFERENCIA').AsString));
                 SQL.Add('  AND MESCOBRANCA    = '+ QuotedStr(qryEnvio.FieldByName('MESCOBRANCA').AsString));
                 SQL.Add('  AND IDMOTIVO       = '+ qryEnvio.FieldByName('IDMOTIVO').AsString);
                 SQL.Add('  AND NUMRECEBIMENTO = '+qryEnvio.FieldByName('NUMRECEBIMENTO').AsString);

                 Try
                   ExecSQL;
                 Except
                   memResult.Lines.Add('[ERRO ] ERRO AO ALTERAR A SITUAÇÃO NO HISTÓRICO DE CONTRIBUIÇÃO (RECEBIMENTO Nº '+qryEnvio.FieldByName('NUMRECEBIMENTO').AsString+').');
                   bErro := True;
                   bAlgumErro := True;
                 End;
              End;


              qryEnvio.Next;
              Continue;
           end
           else begin
              rTotal := rTotal + rEnvio;
              bErro  := False;

              // Se envio ok, Gera salário de Manutenção, para o mes processado
              if (qryEnvio.FieldByName('IDPESSOA').AsString  <> sIdPessoa)
              then begin
                  if (qryEnvio.FieldByName('flgSitFundacao').AsString = 'MA') or
                     (qryEnvio.FieldByName('flgSitFundacao').AsString = 'MP') or
                     (qryEnvio.FieldByName('flgSitFundacao').AsString = 'MS')
                  then begin
                     sIdPessoa  := qryEnvio.FieldByName('IDPESSOA').AsString;
                     sSalarioMa := qryEnvio.FieldByName('SalMantido').AsString;

                     // Verifica de Faz Pro-rata do salario de 'MA', se for o 1º pagto.
                     sMesRefInicioMa := Copy(qryEnvio.FieldByName('DATAINICIO').AsString,7,4)+'/'+
                                        Copy(qryEnvio.FieldByName('DATAINICIO').AsString,4,2);
                     if sMesRefInicioMa = sAnoMesCobrancaTela
                     then sSalarioMa   := OraNumero(FloatToStr(ValorProRataPrimeiro(sSalarioMa, qryEnvio.FieldByName('DATAINICIO').AsString)));

                     if not GerarHistoricoSalario(qryAux, qryEnvio.FieldByName('IdPessJur').AsString,
                                                          qryEnvio.FieldByName('IdPessoa').AsString,
                                                          sAnoMesCobrancaTela,
                                                          qryEnvio.FieldByName('flgSitFundacao').AsString,
                                                          sSalarioMa,
                                                          IntToStr(prmIdMotivoContrib))
                     then begin
                          memResult.Lines.Add('[ERRO] ERRO NA ATUALIZAÇÃO DO SALÁRIO DE MANUTENÇÃO ');
                          bErro := True;
                          bAlgumErro := True;
                     end;
                  end;
              end;
           end;

           VerificaContabMantidoNoEnvio(qryaux,bContabilizaNoEnvio,qryEnvio.FieldByName('IdPlanoPrev').AsInteger);

           if not ((qryEnvio.FieldByName('flgSitFundacao').AsString = 'MA')
                  and (not bContabilizaNoEnvio) )
           then begin
              if not prmIntegraContab
              then begin
                  memResult.Lines.Add('[AVISO] AdmPREV NÃO INTEGRADO COM CONTABILIDADE -> LANÇAMENTO CONTÁBIL NÃO EFETUADO ' );
              end
              else begin
                 if rEnvio > 0
                 then begin
                    IncluiContabilidade(CtrlLancamento, qryContabil , iPlnCodigo,sMsgErro);

                    if iPlnCodigo < 0
                    then begin
                       memResult.Lines.Add('[ERRO] ERRO NA INCLUSÃO DO LANÇAMENTO NA CONTABILIDADE : '+SMSGERRO);
                       bErro := True;
                       bAlgumErro := True;
                    end;
                 end;

                 // Atualiza os documentos gerados no CAP/CAR com o número da planilha gerada
                 // para a coguntabilidade - plncodigo
                 qryDocumentos.First;
                 While (not qryDocumentos.EOF) and (iPlnCodigo > 0) Do Begin
                    AdmPREV_Informa_Planilha(qryAux,iPlnCodigo,
                    qryDocumentos.FieldByName ('CODDOCUMENTO').AsInteger,
                    qryDocumentos.FieldByName ('NUMLANCTO').AsInteger);
                    qryDocumentos.Next;
                 end;


                 // Se o plncodigo > 0 e codlanccapcar < 0
                 // Entao é porque a contribuicao é da propria fundacao e só foi contabilizada
                 // Neste caso, gravar o plncodigo na hstcontrib para poder agrupar
                 if (iPlnCodigo > 0) and (iCodLancCAPCAR < 0)
                 then begin
                    qryAux.Close;
                    qryAux.SQL.Clear;
                    qryAux.SQL.Add(' INSERT INTO CONTABCONTFUND (NUMRECEBIMENTO, PLNCODIGO) '+
                                   ' VALUES ( '+qryEnvio.FieldByName('NumRecebimento').AsString+','+
                                                IntToStr(iPlnCodigo) +')');
                    try
                       qryAux.ExecSQL;
                    except
                       memResult.Lines.Add('[ERRO ] ERRO AO ATUALIZAR O NÚMERO DA PLANILHA NO HISTÓRICO DE CONTRIBUIÇÃO.');
                       bErro := True;
                       bAlgumErro := True;
                    end;
                 end;

              end;
           end;


           qryContabil.CancelUpdates;

           iultimacontrib := qryEnvio.FieldByName('IdContribuicao').AsInteger;


           // Alterando a situação da tabela de histórico individualmente
           With qryAux do
            Begin
              Close;
              SQL.Clear;
              SQL.Add('UPDATE HSTCONTRIBPREV ');
              SQL.Add('SET SITRECEBIMENTO = 1');
              SQL.Add(' , DATAEMISSCOB     = SYSDATE '); // SOL 180156 Kintana 1668852              
              SQL.Add('WHERE MESREFERENCIA  = '+ QuotedStr(qryEnvio.FieldByName('MESREFERENCIA').AsString));
              SQL.Add('  AND MESCOBRANCA    = '+ QuotedStr(qryEnvio.FieldByName('MESCOBRANCA').AsString));
              SQL.Add('  AND IDMOTIVO       = '+ qryEnvio.FieldByName('IDMOTIVO').AsString);
              SQL.Add('  AND NUMRECEBIMENTO = '+qryEnvio.FieldByName('NUMRECEBIMENTO').AsString);

              Try
                ExecSQL;
              Except
                memResult.Lines.Add('[ERRO ] ERRO AO ALTERAR A SITUAÇÃO NO HISTÓRICO DE CONTRIBUIÇÃO (RECEBIMENTO Nº '+qryEnvio.FieldByName('NUMRECEBIMENTO').AsString+').');
                bErro := True;
                bAlgumErro := True;
              End;
            End;




           sNumRecebimento := sNumRecebimento + ','+ qryEnvio.FieldByName('NumRecebimento').AsString;
           sIdContribuicao := qryEnvio.FieldByName('IdContribuicao').AsString;
           sFlgPagador := qryEnvio.FieldByName('FlgPagador').AsString;
           sflgSitFundacao := qryEnvio.FieldByName('flgSitFundacao').AsString;
           sIdPessoaAnt := qryEnvio.FieldByName('IdPessoa').AsString;
           sIdPessjur := qryEnvio.FieldByName('IdPessjur').AsString;
           sIdPlanoPrev := qryEnvio.FieldByName('IdPlanoPrev').AsString;
           sMesRefAnt := qryEnvio.FieldByName('MesReferencia').AsString;
           sCodportforma := qryEnvio.FieldByName('CodPortForma').AsString;



           BuscaInfFinancContrib(sAux1, sAux2, sCodPortForma,'CODPORTFORMA',
                     qryEnvio.FieldByName('CODPORTFORMA').AsString,
                     'S',
                     qryEnvio.FieldByName('IdPessjur').AsInteger,
                     qryEnvio.FieldByName('IdPlanoPrev').AsInteger,
                     qryEnvio.FieldByName('IdContribuicao').AsInteger,
                     piUltimaContrib,
                     qryEnvio.FieldByName('IdPessoa').AsInteger );

           if Trim(dtVencBoleta.Text) = ''
           then sDataPrevisaoRece := qryEnvio.FieldByName('DataPrevisaoRece').AsString
           else sDataPrevisaoRece := dtVencBoleta.Text;


           BuscaInfFinancContrib(sAux1, sAux2, sCodCentroCusto,'CODCENTROCUSTOD',
                      qryEnvio.FieldByName('CODCENTROCUSTOD').AsString,
                      'S',
                      qryEnvio.FieldByName('IdPessjur').AsInteger,
                      qryEnvio.FieldByName('IdPlanoPrev').AsInteger,
                      qryEnvio.FieldByName('IdContribuicao').AsInteger,
                      piUltimaContrib,
                      qryEnvio.FieldByName('IdPessoa').AsInteger );



           qryEnvio.Next;



           frmAguarde.pbAguarde.Position  := frmAguarde.pbAguarde.Position + 1;
           Application.ProcessMessages;

           // Se for a mesma pessoa
           // Entao  lançar as contribuições em um único documento e uma única planilha
           // Senao  reiniciar variaveis de Planilha(iPlnCodigo) e Documento(iCodLancCAPCAR) para
           //        que sejam criados novos registros

           sIdPessoa := qryEnvio.fieldbyname('IDPESSOA').AsString;

           if (sIdPessoaAnt <> sIdPessoa)
              or ((sDataPrevisaoRece <> qryEnvio.FieldByName('DataPrevisaoRece').AsString) and (trim(dtVencBoleta.Text) = ''))
              or (qryenvio.EOF)
              or (sFlgPagador <> qryEnvio.FieldByName('FlgPagador').AsString) then  //BRUNO AZEVEDO SOL 132501 KINTANA 775244
           begin

                 if not(CbBpd.Checked) then
                 begin
                    iCodLancCapCAR := DescarregaDocumentos( CtrlDocumento,
                                                       qryDocumentos,
                                                       qryEnvio.FieldByName('IdPessJur').AsInteger,
                                                       iPlnCodigo,
                                                       prmTpDocRRecBanco,
                                                       sCodportforma,
                                                       Copy(sAnoMesCobrancaTela,6,2),
                                                       Copy(sAnoMesCobrancaTela,1,4),
                                                       rTotal,
                                                       strtodate(sDataPrevisaoRece),
                                                       sFlgPagador,  //BRUNO AZEVEDO SOL 132501 KINTANA 775244
                                                       'P', sIdPessoaAnt ,
                                                       copy(sNumRecebimento,2,length(snumrecebimento)),
                                                       cRecPag,'',
                                                       sCodCentroCusto );

                    if iCodLancCapCAR < 0
                    then begin
                       bErro := True;
                       rEnvio := -1;
                       memResult.Lines.Add('[ERRO ] - Erro na inserção dos documentos : '+CtrlDocumento.MessageInfo);
                    end;


                    if (rEnvio > 0)
                    then begin
                       bEnviouContribBanco := True;
                       if not EnviaAlteradorBANCO( CtrlDocumento,
                                                   qryAux,qryAux2,
                                                   qryContabil,
                                                   qryDocumentos,
                                                   sMesRefAnt,
                                                   copy(sNumRecebimento,2,length(snumrecebimento)) ,
                                                   iCodLancCAPCAR,
                                                   sDataPrevisaoRece,
                                                   sDataPrevisaoRece,
                                                   sTipOperEnvio,
                                                   strtoint(sIdPessJur),
                                                   strtoint(sIdPlanoPrev),
                                                   strtoint(sIdPessoaAnt),
                                                   strtoint(sIdContribuicao),
                                                   iUltimaContrib,
                                                   sFlgPagador,
                                                   sMsgErro,
                                                   sflgSitFundacao)
                       then begin
                          bErro := True;
                          rEnvio := -1;
                          memResult.Lines.Add('[ERRO] ERRO NO ENVIO DOS ALTERADORES : '+sMsgErro);
                       end;
                    end;
                 end
                 else
                 begin
                    iCodLancCapCAR := DescarregaDocumentos( CtrlDocumento,
                                                       qryDocumentos,
                                                       qryEnvio.FieldByName('IdPessJur').AsInteger,
                                                       iPlnCodigo,
                                                       prmTpDocRRecBanco,
                                                       sCodportforma,
                                                       Copy(sAnoMesCobrancaTela,6,2),
                                                       Copy(sAnoMesCobrancaTela,1,4),
                                                       rTotal,
                                                       strtodate(sDataPrevisaoRece),
                                                       sFlgPagador,  //BRUNO AZEVEDO SOL 132501 KINTANA 775244
                                                       'P', sIdPessoaAnt ,
                                                       copy(sNumRecebimento,2,length(snumrecebimento)),
                                                       'P','BPD',
                                                       sCodCentroCusto );

                    if iCodLancCapCAR < 0
                    then begin
                       bErro := True;
                       rEnvio := -1;
                       memResult.Lines.Add('[ERRO ] - Erro na inserção dos documentos : '+CtrlDocumento.MessageInfo);
                    end;


                    if (rEnvio > 0)
                    then begin
                       bEnviouContribBanco := True;
                       if not EnviaAlteradorBANCO( CtrlDocumento,
                                                   qryAux,qryAux2,
                                                   qryContabil,
                                                   qryDocumentos,
                                                   sMesRefAnt,
                                                   copy(sNumRecebimento,2,length(snumrecebimento)) ,
                                                   iCodLancCAPCAR,
                                                   sDataPrevisaoRece,
                                                   sDataPrevisaoRece,
                                                   sTipOperEnvio,
                                                   strtoint(sIdPessJur),
                                                   strtoint(sIdPlanoPrev),
                                                   strtoint(sIdPessoaAnt),
                                                   strtoint(sIdContribuicao),
                                                   iUltimaContrib,
                                                   sFlgPagador,
                                                   sMsgErro,
                                                   sflgSitFundacao)
                       then begin
                          bErro := True;
                          rEnvio := -1;
                          memResult.Lines.Add('[ERRO] ERRO NO ENVIO DOS ALTERADORES : '+sMsgErro);
                       end;
                    end;

                    iCodLancCapCAR := DescarregaDocumentos( CtrlDocumento,
                                                       qryDocumentos,
                                                       qryEnvio.FieldByName('IdPessJur').AsInteger,
                                                       iPlnCodigo,
                                                       prmTpDocRRecBanco,
                                                       sCodportforma,
                                                       Copy(sAnoMesCobrancaTela,6,2),
                                                       Copy(sAnoMesCobrancaTela,1,4),
                                                       rTotal,
                                                       strtodate(sDataPrevisaoRece),
                                                       sFlgPagador,  //BRUNO AZEVEDO SOL 132501 KINTANA 775244
                                                       'P', sIdPessoaAnt ,
                                                       copy(sNumRecebimento,2,length(snumrecebimento)),
                                                       'R','BPD',
                                                       sCodCentroCusto );

                    if iCodLancCapCAR < 0
                    then begin
                       bErro := True;
                       rEnvio := -1;
                       memResult.Lines.Add('[ERRO ] - Erro na inserção dos documentos : '+CtrlDocumento.MessageInfo);
                    end;


                    if (rEnvio > 0)
                    then begin
                       bEnviouContribBanco := True;
                       if not EnviaAlteradorBANCO( CtrlDocumento,
                                                   qryAux,qryAux2,
                                                   qryContabil,
                                                   qryDocumentos,
                                                   sMesRefAnt,
                                                   copy(sNumRecebimento,2,length(snumrecebimento)) ,
                                                   iCodLancCAPCAR,
                                                   sDataPrevisaoRece,
                                                   sDataPrevisaoRece,
                                                   sTipOperEnvio,
                                                   strtoint(sIdPessJur),
                                                   strtoint(sIdPlanoPrev),
                                                   strtoint(sIdPessoaAnt),
                                                   strtoint(sIdContribuicao),
                                                   iUltimaContrib,
                                                   sFlgPagador,
                                                   sMsgErro,
                                                   sflgSitFundacao)
                       then begin
                          bErro := True;
                          rEnvio := -1;
                          memResult.Lines.Add('[ERRO] ERRO NO ENVIO DOS ALTERADORES : '+sMsgErro);
                       end;
                    end;
                 end;

              qryDocumentos.CancelUpdates;

              qryDocumentos.Close;
              qryDocumentos.ParamByName('CODDOCUMENTO').AsInteger := -1;
              qryDocumentos.Open;

              //SOL 207368 KINTANA 2021675
              qryContabil.Close;
              qryContabil.ParamByName('PLNCODIGO').AsInteger := -1;
              qryContabil.Open;


              iCodLancCAPCAR := -1;
              iPlnCodigo     := 0;
              sIdPessoaAnt   := sIdPessoa;
              sNumRecebimento := '';
              sMesRefAnt  := qryEnvio.FieldByName('MesReferencia').AsString;
           end;

           //commit parcial
           inc(icontcommit);
           if icontcommit >= ictMaxCommit then
           begin
              dtmBaseDados.dbBaseDados.Commit;
              if not dtmBaseDados.dbBaseDados.InTransaction
              then   StartTransacao;
              icontcommit := 0;
           end;


        end;//while not qryEnvio.EOF
        frmAguarde.pbAguarde.Visible  := False;
     end; // Se cobranca bancaria e opcao <> 2



     qryDocumentos.CancelUpdates;

     qryDocumentos.Close;
     qryDocumentos.ParamByName('CODDOCUMENTO').AsInteger := -1;
     qryDocumentos.Open;

     //SOL 207368 KINTANA 2021675
     qryContabil.Close;
     qryContabil.ParamByName('PLNCODIGO').AsInteger := -1;
     qryContabil.Open;


     //==== Atualiza Interface
     if not AtualizaCTRLINTERFACE(qryLotesAEnviar.FieldByName('IdLote').AsInteger,
                                 'FLGIDATMP','1',
                                 'DATAIDATMP',
                                  DateToStr(date))
     then begin
        memResult.Lines.Add('[ERRO] ERRO NA ATUALIZAÇÃO DO LOTE ');
        bErro := True;
     end;

     qryLotesAEnviar.Next;
  end; //while not qryPreparosAnt.EOF

  // Se foi feito algum envio para banco,
  // Agrupar documentos do participante por mes (1 boleta por mes)
  if bEnviouBanco
  then begin
     frmAguarde.Mostra('Verificando documentos a agrupar ...');

     sLstLotesEnviados := ' ';
     for i := 0 to (lsLotesEnviados.Items.Count - 1) do
     begin
        sLstLotesEnviados := sLstLotesEnviados+lsLotesEnviados.Items[i]+',';
     end;
     sLstLotesEnviados := Copy(sLstLotesEnviados,1,length(sLstLotesEnviados) -1);

     if not AgrupaBoletasBANCO(CtrlDocumento, qryAux, qryAux2, sLstLotesEnviados,'',2) //SOL 148139 KINTANA 1040427
     then begin
        memResult.Lines.Add('[ERRO] ERRO AO AGRUPAR DOCUMENTOS');
        bErro := True;
     end;
     frmAguarde.Apaga;
  end;

  frmAguarde.Mostra('Verificando cobranças de contribuições que não exigem recebimento ...');

  //==== Envia as contribuições com cobrança já recebida (FLGNAOEXIGERECEB = 1) "as contrib. do PDV"
  EnviarContribRecebida(lsLotesEnviados);

  frmAguarde.Apaga;


 // Se foi rodado o envio para patrocinadora (e nao banco)
 // Entao Verificar se usuario deseja fechar envio de alguma das patrocinadoras
 if (rgrpTipoOperacao.ItemIndex <> 2) and
    (Pos('AT',strSituacao) > 0) or (Pos('MP',strSituacao) > 0 )
 then begin
    for i := 0 to chklstPatro.Items.Count - 1 do
    begin
       if not chklstPatro.checked[i] then continue;

       if not qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive,loPartialKey])
       then continue;

       if MsgDlg('Deseja fechar o mês de envio para a patrocinadora '+qryPatro.FieldByName('Nome').AsString+' ? ',
                 'Confirmação',mtConfirmation, [mbYes, mbNo, mbHelp],0) = mrNo
       then continue;


       if not FechaMesSistema (qryAux,
                        sAnoMesCobrancaTelaInicial,
                        DateToStr(date),
                        qryPatro.FieldByName('IdPessoa').AsInteger,
                        cteIdModuloAdmPREV, // AdmPREV
                        'E', 'A')
       then Begin
         bErro := True;
         memResult.Lines.Add('[ERRO] Erro ao fechar o mês de envio para a patrocinadora '+qryPatro.FieldByName('Nome').AsString);
       End;
    end;
 end;

  //=== Informar resultado da operação
  memResult.Lines.Add(' ');
  memResult.Lines.Add('=> RESULTADO FINAL : ');
  if not bErro and ( not bAlgumErro )
  then begin
     if (CbBpd.Checked)  then
     begin
        With qryAux do
        Begin
           Close;
           SQL.Clear;
           SQL.Add('UPDATE HSTCONTRIBPREV ');
           SQL.Add('SET CODDOCUMENTOPREV = 20');
           SQL.Add(' ,  VALORRECEBIDO    = VALORESPERADO ');
           SQL.Add(' ,  DATARECEBIMENTO  = '+ QuotedStr(dtVencBoleta.text) );
           SQL.Add(' ,  SITRECEBIMENTO   = 1');
           SQL.Add(' ,  DATAEMISSCOB     = SYSDATE '); // SOL 180156 Kintana 1668852           
           SQL.Add('WHERE MESCOBRANCA    = '+ QuotedStr(sAnoMesCobrancaTela));
           SQL.Add('  AND IDCONTRIBUICAO IN ('+strContrib+') ');
           Try
              ExecSQL;
           Except
              memResult.Lines.Add('[ERRO ] ERRO AO ALTERAR A SITUAÇÃO NO HISTÓRICO DE CONTRIBUIÇÃO (RECEBIMENTO Nº '+qryEnvio.FieldByName('NUMRECEBIMENTO').AsString+').');
              bErro := True;
              bAlgumErro := True;
           End;
        End;
     end;
     //dtmBaseDados.dbBaseDados.Commit;
    if (CbEnvio.Checked) or (CbPga.Checked) or (CbBpd.Checked) then begin
      memResult.Lines.Add(' - Envio de Contribuições efetuado com sucesso - ');
      memResult.Lines.Add(' - Iniciando Integração com '+sChkMsg+' - ');
      if (CbBpd.Checked) then
      begin
         // verificar planos checados
         sdataBpd := datetostr(BuscaDataBPD(sChkMsg));
         for i := 0 to chklstPlano.Items.Count - 1 do
         begin
            SQLwhere := '';
               if chklstPlano.Checked[i] then
                  if qryPlano.Locate('Nome',chklstPlano.Items[i],[loCaseInsensitive,loPartialKey]) then
                     SQLwhere := ' And h.coddocumentoprev = 20 '+
                                 ' And h.idplanoprev =  '+qryPlano.FieldByName('IdPlanoPrev').AsString;
            Try
               if SQLwhere <> '' then
               begin
                  sMsgPga := RealizaIntegracaoPGAIndiv(sAnoMesCobrancaTela,CtrlDocumento,CtrlLancamento,'',SQLwhere,'BPD',sdataBpd,TRUE,sdataBpd);
               end;
            Except
               memResult.Lines.Add(' - Ocorreram problemas na Integração com '+sChkMsg+' - ');
            end;
         end;
         If sMsgPga = '' Then
         Begin
//            If dtmBaseDados.dbBaseDados.InTransaction Then
  //             dtmBaseDados.dbBaseDados.Commit;
            memResult.Lines.Add(sMsgPga);
            Showmessage('Integração com BPD realizada com Sucesso');
         //********************************************************
            //inicio baixa dos documentos gerados
            //PROCESSAR AS BAIXAS DO PGA
            qryAux.Close;
            qryAux.Sql.Clear;
            qryAux.Sql.Add('SELECT DISTINCT CODDOCUMENTOPGAPAGAR, CODDOCUMENTOPGARECEBER');
            qryAux.Sql.Add('  FROM HSTCONTRIBPREV');
            qryAux.Sql.Add('  WHERE CODDOCUMENTOPREV = 20');
//            qryAux.Sql.Add('    AND PLNCODIGO IS NOT NULL');
            qryAux.Sql.Add('    AND MESCOBRANCA =  '''+sAnoMesCobrancaTela +'''' );
            qryAux.Open;

            sCodDocumentos := '';
            while not qryAux.Eof do begin
               sCodDocumentos := sCodDocumentos + QuotedStr(qryAux.FieldByName('CODDOCUMENTOPGAPAGAR').AsString) + ',' + QuotedStr(qryAux.FieldByName('CODDOCUMENTOPGARECEBER').AsString) + ',';
               qryAux.Next;
            end;
            sCodDocumentos := Copy(sCodDocumentos, 1, Length(sCodDocumentos) - 1);

            //DELETAR DOCUMXDOCUM
            qryAux.Close;
            qryAux.Sql.Clear;
            qryAux.Sql.Add('DELETE FROM DOCUMXDOCUM');
            qryAux.SQL.Add(' WHERE IDDOCUMENTO IN ('+sCodDocumentos+')');
            qryAux.ExecSql;

            FiltraDadosBaixa('P', sCodDocumentos);
            FiltraDadosBaixa('R', sCodDocumentos);

            //FINALIZAR AS BAIXAS DO PGA
           // If not dtmBaseDados.dbBaseDados.InTransaction Then
            //   dtmBaseDados.dbBaseDados.startTransaction;

            if not CtrlBaixaRecXPag.ProcessaBaixaDocumento(cdsDocPag.Data, cdsDocRec.Data, cdsLancFinanc.Data,
                   Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.IdModulo,
                   iCodPortFormaPagar, iCodPortFormaReceber, ParamIntegra.Plano, STRTODATE(sdataBpd),
                   Sistema.UsaPlanoPatro, ParamIntegra.PartidaDobrada, rTotPag, rTotRec, False) then
            begin
                MsgDlg('Erro no processamento das Baixas:' + (#13+#10) + CtrlBaixaRecXPag.MessageInfo,'Atenção', mtError, [mbOk],0);
                memResult.Lines.Add('Erro no processamento das Baixas:' + (#13+#10) + CtrlBaixaRecXPag.MessageInfo);
            end;

            //If dtmBaseDados.dbBaseDados.InTransaction Then
            //   dtmBaseDados.dbBaseDados.Commit;
            //final baixa dos documentos gerados
         //********************************************************
         End
         Else
         Begin
            MessageDlg('ERRO AO REALIZAR INTEGRAÇÃO COM O PGA', mterror, [mbok], 0);
            dtmBaseDados.dbBaseDados.Rollback;
         End;
      end
      else
      begin
          Try                          //BRUNO AZEVEDO SOL 107221/5802 KINTANA 1365701              //SOL 207368 KINTANA 2021675
             SQLwhere := SQLwhere +#13+ ' AND H.IDCONTRIBUICAO IN ('+strContrib+') '; // SOL 228328 KINTANA  2062202
             RealizaIntegracaoPGAIndiv(sAnoMesCobrancaTela,CtrlDocumento,CtrlLancamento,'',SQLwhere,'PREPAROENVIO');
             memResult.Lines.Add(' - Integração com '+sChkMsg+' realizada com sucesso- ');
          Except
             memResult.Lines.Add(' - Ocorreram problemas na Integração com '+sChkMsg+' - ');
          end;
      end;
    end;

    MsgDlg('Envio de Contribuições efetuado com sucesso. ','Informação',mtInformation,[mbOk,mbHelp],0)  ;
    If dtmBaseDados.dbBaseDados.InTransaction Then
       dtmBaseDados.dbBaseDados.Commit;
  end
  else begin
    dtmBaseDados.dbBaseDados.RollBack;
    memResult.Lines.Add(' - Envio de Contribuições CANCELADO!! Verifique as mensagens de erro - ');
    MsgDlg('Envio de Contribuições CANCELADO!! Verifique as mensagens de erro no resultado!!','Envio Cancelado',mtInformation,[mbOk,mbHelp],0);
  end;
 end;



procedure TfrmPreparaEnvia.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then memResult.Lines.SaveToFile(savedlg.filename);
end;



procedure TfrmPreparaEnvia.FormCreate(Sender: TObject);
begin
  inherited;
  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  frmAguarde.Mostra('Lendo informações para iniciar Envio ... ');
  qryPatro.Close;
  qryPatro.SQL.Clear;
  qryPatro.SQL.Add(' SELECT P.IDPESSOA, P.NOME           '+
                   ' FROM   PESSOA  P, PATRO PT          '+
                   ' WHERE  P.IDPESSOA    = PT.IDPESSOA  '+
                   ' AND    PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+
                   ' ORDER BY P.NOME                     ');

  qryPlano.Close;
  qryPlano.SQL.Clear;
  qryPlano.SQL.Add(' SELECT IDPLANOPREV, NOME             '+
                   ' FROM   PLANPREV                      '+
                   ' WHERE  IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO PLP, PATRO PT '+
                   '                        WHERE PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+
                   '                        AND   PLP.IDPESSJUR = PT.IDPESSOA ) '+
                   ' ORDER  BY NOME                                             ');

  qryFiltroContrib.Close;
  qryFiltroContrib.SQL.Clear;
  qryFiltroContrib.SQL.Add(' SELECT IDCONTRIBUICAO, NOME '+
                           ' FROM   CONTRIBUICAO           '+
                           ' WHERE  IDCONTRIBUICAO IN (SELECT CP.IDCONTRIBUICAO FROM CONTPREV CP, PLANPREVPATRO PLP, PATRO PT '+ 
                           '                           WHERE PT.IDFUNDACAO = '+IntToStr(iIdFundacao)  +
                           '                           AND   PLP.IDPESSJUR = PT.IDPESSOA             '+
                           '                           AND   CP.IDPLANOPREV = PLP.IDPLANOPREV    )   '+
                           ' ORDER BY NOME ');


  with dtmPreparaContrib do
  begin
    qryLote.Close;         qryLote.open;

    qryNCalcMantido.Prepare;
    qryNCalcAtivo.Prepare;
    qryAtivoBase.Prepare;
  end;

    
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



  frmAguarde.Apaga;
  // 130118
  CbEnvio.Checked := true;
  CbPga.Checked   := true;
  CtrlBaixaRecXPag := TCtrlBaixaRecXPag.Create;
  CtrlBaixaRecXPag.InitializeAs(ParamIntegra);
  iCodPortFormaReceber := 144;
  iCodPortFormaPagar := 143;
  CtrlDisponFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                         Sistema.IdUsuario,Sistema.UsaPlanoPatro);

  CtrlDisponFinanc.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,nil,False,eOnMessage);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.InitializeAs(CtrlLancamento);
  CtrlPeriodo.OnMessageInfo := nil;
  //130118
end;

procedure TfrmPreparaEnvia.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12)
  then begin
     cmbMesCob.ItemIndex := AMonth - 1;
     cmbMesCob.Text      := cmbMesCob.Items[cmbMesCob.ItemIndex];
  end;
  spedAnoCob.Text   := IntToStr(AYear);
  dtVencBoleta.Text := '';

  // Preencher radio groups  com os defaults indicados
  rgrpTipoCobranca.ItemIndex   := 3;     // todos (Folha e Banco e relatório)

  // Kintana 1461555 SOL 166858 - Otacilio ** Inicio **
  //rgrpMeses.ItemIndex          := 0;     // Todas (atrasadas e do mes)
  chkApenasMes.Checked        := True;
  chkApenasAtrasadas.Checked  := True;
  chkApenasDevolucoes.Checked := True;
  // Kintana 1461555 SOL 166858 - Otacilio ** Fim **



  rgrpTipoOperacao.ItemIndex   := 0;     // Fazer envio e preparo
  rgrpContribuicoes.ItemIndex  := 0;     // Enviar todas as contribuicoes
  rgrpDataVencimento.ItemIndex := 1;     // Enviar contribuicoes por data de vencimento
  grpDatasVencimento.Visible   := False; // Só fica visivel se usuario quiser filtrar por vencimento

  // Preencher chkList da Patrocinadora
  qryPatro.Close;   qryPatro.Open;
  CriaLista(chkLstPatro,qryPatro);

  // Preencher String com ids de todas as patrocinadoras e todas as situacoes
  // para usar na qryPreparosAnt no caso de nao haver nada filtrado
  strTodasPatros    := '';

  strTodasSituacoes := ' ''AT'',  ''MA'', ''MP'', ''MS'', ''PT'' ';
  qryPatro.First;
  while not qryPatro.EOF do
  begin
     strTodasPatros := strTodasPatros+''''+qryPatro.FieldbyName('IdPessoa').AsString+''',';
     qryPatro.Next;
  end;
  strTodasPatros := Copy(strTodasPatros,1,length(strTodasPatros)-1);

  // Preenche ChkList dos Planos
  qryPlano.Close;   qryPlano.Open;
  CriaLista(chklstPlano,qryPlano);

  qryFiltroContrib.Close; qryFiltroContrib.Open;
  CriaLista(chklstContrib, qryFiltroContrib);
  
  // Configurar tabsheet
  pgctrlOpcoes.ActivePage := tbsBasico;
  bbtnConfirmar.Visible   := False;
  bbtnCancelar.Visible    := False;

  // Verifica Tabela de Parametros Contábeis
  qryAux.Sql.Clear;
  qryAux.Sql.Text  := ' SELECT MASCARA,   PAR.PLANO      '+
                      ' FROM   PLANO PLA, PARAMCONTAB PAR'+
                      ' WHERE  PAR.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+
                      ' AND    PLA.PLANO    = PAR.PLANO';
  qryAux.Open;
  if (not qryAux.EOF)
  then begin
       IntegraBack.Plano        := qryAux.FieldbyName('PLANO').AsInteger;
       IntegraBack.MascaraPlano := qryAux.FieldbyName('MASCARA').AsString;
  end
  else begin
     MsgDlg('Erro ao ler parâmetros contábeis','Erro',mtError,[mbOK],0);
     qryAux.Close;
     Close;
  end;

  sqlLancFinanc.open; // 130118

end;

procedure TfrmPreparaEnvia.rgrpDataVencimentoClick(Sender: TObject);
begin
  inherited;
  // Kintana 1461555 SOL 166858 - Otacilio
  //grpDatasVencimento.visible := (rgrpDataVencimento.ItemIndex = 1);
end;

procedure TfrmPreparaEnvia.rgrpContribuicoesClick(Sender: TObject);
begin
  inherited;
  if rgrpContribuicoes.ItemIndex = 1
  then rgrpTipoOperacao.ItemIndex := 1;
end;

procedure TfrmPreparaEnvia.rgrpTipoOperacaoClick(Sender: TObject);
begin
  inherited;
  if rgrpContribuicoes.ItemIndex = 1
  then rgrpTipoOperacao.ItemIndex := 1;
end;

procedure TfrmPreparaEnvia.bbtnDesfazerClick(Sender: TObject);
var bDesfazPreparo,
    bAbriuSelecaoPart,
    bOk,
    bIndividual     : boolean;
    mResult         : TModalResult;
    iIdLoteAtual    : longint;
    sMsg,
    sMsgErro,
    sAnoTela,
    sMesTela,
    sSQLEnvio,
    sIdsPessoaIndiv,
    sIdsPessJurIndiv,
    sIdsPlanosIndiv,
    sUltMesPreparo  : String;
    cTipoEnvPrev    : char;
    sDescLog, sSQLPPP : String;
    iContErro, iTotalDesfaz, iRegAtual       : Integer;
    sDiaIni, sDiaFim : String;
    sCodDocsEnviados : String;
begin
  inherited;

  try
    bDesfazPreparo := True;
    bIndividual    := False;
    bAbriuSelecaoPart := False;

    // Verificar se o usuario quer desfazer individualmente o preparo/envio
    mResult := MsgDlg('Deseja selecionar participantes ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbCancel],0);

    if mResult = mrCancel
    then Exit;

    if mResult = mrYes
    then begin
       frmSelecionaParticipantes := TfrmSelecionaParticipantes.Create(Application);
       mResult := frmSelecionaParticipantes.ShowModal;

       if (frmSelecionaParticipantes.qrySelecionados.IsEmpty) or
          (mResult = mrCancel)
       then begin
          frmSelecionaParticipantes.Free;
          Exit;
       end;

       sIdsPessoaIndiv  := '';
       sIdsPessJurIndiv := '';
       sIdsPlanosIndiv  := '';

       with frmSelecionaParticipantes.qrySelecionados do
       begin
          First;
          while not EOF do
          begin
             sIdsPessoaIndiv  := sIdsPessoaIndiv  + ','+ FieldByName('IdPessoa').AsString;
             if Pos(FieldByName('IdPessJur').AsString,sIdsPessJurIndiv) <= 0
             then sIdsPessJurIndiv := sIdsPessJurIndiv + ','+ FieldByName('IdPessJur').AsString;
             if Pos(FieldByName('IdPlanoPrev').AsString,sIdsPlanosIndiv) <= 0
             then sIdsPlanosIndiv  := sIdsPlanosIndiv  + ','+ FieldByName('IdPlanoPrev').AsString;
             Next;
          end; // while
          CancelUpdates;
       end; // with

       // Tirar a primeira virgula
       sIdsPessoaIndiv  := Copy(sIdsPessoaIndiv,2,length(sIdsPessoaIndiv)-1);
       sIdsPessJurIndiv := Copy(sIdsPessJurIndiv,2,length(sIdsPessJurIndiv)-1);
       sIdsPlanosIndiv  := Copy(sIdsPlanosIndiv,2,length(sIdsPlanosIndiv)-1);

       bIndividual := True;
       bAbriuSelecaoPart := True;
       frmSelecionaParticipantes.Free;
    end;

    // Verificar se o usuario quer desfazer só o envio ou preparo/envio
    mResult := MsgDlg('Deseja desfazer apenas o Envio ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbCancel],0);

    if mResult = mrCancel
    then Exit;

    if mResult = mrNo
    then bDesfazPreparo := True
    else bDesfazPreparo := False;

    sAnoTela := Trim(spedAnoCob.Text);
    if cmbMesCob.ItemIndex <= 8
    then sMesTela  := '0'+IntToStr(cmbMesCob.ItemIndex+1)
    else sMesTela := IntToStr(cmbMesCob.ItemIndex+1);
    sAnoMesCobrancaTela   := sAnoTela+'/'+sMesTela;

    if Copy(sAnoMesCobrancaTela,6,2) = '13'
    then sAnoMesCobrancaTela := Copy(sAnoMesCobrancaTela,1,5)+'12';

    sUltMesPreparo := SAnoMesAnterior(sAnoMesCobrancaTela);

    if not PreencheFiltroTela
    then  Exit;


    iContErro := 0;
    frmAguarde.Mostra('Desfazendo Operações ...');

    // ***************************************************************************
    // *** Desfazer ENVIO
    // *** 1. Apagar TMPDESC
    // *** 2. Atualizar lote na CTRLINTERFACE com o flgIdaTmp = 0, DataIdaTmp = null
    // *** 3. Atualizar sitrecebimento na HSTCONTRIBPREV com o valor 0 (nao enviado)
    // *** Desfazer PREPARO
    // *** 1. Apagar HSTCONTRIBPREV
    // *** 2. Atualizar ULTMESPREPARO
    // ***************************************************************************
    if bIndividual then
    begin
      sSQLEnvio :=
      'SELECT '                                                                                     + #13 +
      '  HST.NUMRECEBIMENTO,  HST.MESREFERENCIA,      HST.IDLOTE, '                                 + #13 +
      '  HST.IDPESSJUR,       HST.IDPLANOPREV,        HST.IDPESSOA, '                               + #13 +
      '  HST.SEQPROPOSTA,     HST.IDCONTRIBUICAO,     HST.FLGEVENTO, '                              + #13 +
      '  HST.FLGCONCESSAO,    HST.MESCOBRANCA,        HST.VALORESPERADO, '                          + #13 +
      '  HST.FLGDESCFOLHA,    HST.CODDOCUMENTOPREV,   HST.FLGSITFUNDACAO, '                         + #13 +
      '  PT.IDRUBSALMANUT,    PT.IDRUBSALMANUTPARC, '                                               + #13 +
      '  PP.MESULTREAJSAL,    NVL(PP.ULTSALMANTREAJ, 0) AS ULTSALMANTREAJ, '                        + #13 +
      '  NVL(PP.ULTSALAUXREAJ, 0) AS ULTSALAUXREAJ, NVL(PP.ULTSALREAJUSTE, 0) AS ULTSALREAJUSTE, '  + #13 +
      '  HST.FLGMANUAL,       C.PLNCODIGO, '                                                        + #13 +
      '  HST.FLGSITFUNDACAO, '                                                                      + #13 +
      '  DOC.EMISBLOQ '                                                                             + #13 +

      'FROM '                                                                                       + #13 +
      '  HSTCONTRIBPREV HST, '                                                                      + #13 +
      '  PARTPREVPLAN   PP,  '                                                                      + #13 +
      '  PATRO          PT,  '                                                                      + #13 +
      '  CONTABCONTFUND C,   '                                                                      + #13 +
      '  DOCUMENTO      DOC  '                                                                      + #13 +

      'WHERE '                                                                                      + #13 +
      '      (HST.IDPESSJUR      IN (' + sIdsPessJurIndiv + ')) '                                   + #13 +
      '  AND (HST.MESCOBRANCA     = ''' + sAnoMesCobrancaTela + ''') '                              + #13 +
      '  AND (HST.IDPLANOPREV    IN (' + sIdsPlanosIndiv + ')) '                                    + #13 +
      '  AND (HST.IDPESSOA       IN (' + sIdsPessoaIndiv + ')) '                                    + #13 +
      '  AND (HST.FLGDIVERGENTE  <> 1) '                                                            + #13 +
      '  AND (HST.SITRECEBIMENTO <= ''1'') '                                                        + #13 +
      '  AND (HST.IDPESSJUR       = PT.IDPESSOA) '                                                  + #13 +
      '  AND (PP.IDPESSJUR        = HST.IDPESSJUR) '                                                + #13 +
      '  AND (PP.IDPLANOPREV      = HST.IDPLANOPREV) '                                              + #13 +
      '  AND (PP.IDPESSOA         = HST.IDPESSOA) '                                                 + #13 +
      '  AND (C.NUMRECEBIMENTO(+) = HST.NUMRECEBIMENTO) '                                           + #13;

      if rgrpContribuicoes.ItemIndex = 1 then sSQLEnvio := sSQLEnvio +
      '  AND (HST.FLGEVENTO       = 1) '                                                            + #13;

      if not bDesfazPreparo then sSQLEnvio := sSQLEnvio +
      '  AND (HST.FLGCONCESSAO    = 0) '                                                            + #13;

      if rgrpTipoCobranca.ItemIndex = 0 then sSQLEnvio := sSQLEnvio +
      '  AND (FLGDESCFOLHA        = 1) '                                                            + #13
      else if rgrpTipoCobranca.ItemIndex = 1 then sSQLEnvio := sSQLEnvio +
      '  AND (FLGDESCFOLHA        = 0) '                                                            + #13
      else if rgrpTipoCobranca.ItemIndex = 2 then sSQLEnvio := sSQLEnvio +
      '  AND (HST.FLGDESCFOLHA    = 0 ) '                                                           + #13 +
      '  AND EXISTS ( '                                                                             + #13 +
      '             SELECT 1 '                                                                      + #13 +
      '             FROM '                                                                          + #13 +
      '               ELEGPATRO EL, '                                                               + #13 +
      '               SITFUNC   SIT '                                                               + #13 +
      '             WHERE '                                                                         + #13 +
      '                   EL.IDPESSJUR    = HST.IDPESSJUR '                                         + #13 +
      '               AND EL.IDPESSOA     = HST.IDPESSOA '                                          + #13 +
      '               AND SIT.IDSITFUNC   = EL.IDSITFUNC '                                          + #13 +
      '               AND SIT.FLGINTERNO IN (6,7) '                                                 + #13 +
      '             ) ';

    end
    else  // if bIndividual
    begin
      sSQLEnvio :=
      'SELECT '                                                                                     + #13 +
      '  HST.NUMRECEBIMENTO,    HST.MESREFERENCIA,    HST.IDLOTE, '                                 + #13 +
      '  HST.IDPESSJUR,         HST.IDPLANOPREV,      HST.IDPESSOA, '                               + #13 +
      '  HST.SEQPROPOSTA,       HST.IDCONTRIBUICAO,   HST.FLGEVENTO, '                              + #13 +
      '  HST.FLGCONCESSAO,      HST.MESCOBRANCA,      HST.FLGDESCFOLHA, '                           + #13 +
      '  HST.CODDOCUMENTOPREV,  HST.FLGSITFUNDACAO, '                                               + #13 +
      '  PT.IDRUBSALMANUT,      PT.IDRUBSALMANUTPARC, '                                             + #13 +
      '  PP.MESULTREAJSAL,      NVL(PP.ULTSALMANTREAJ, 0) AS ULTSALMANTREAJ, '                      + #13 +
      '  NVL(PP.ULTSALAUXREAJ, 0) AS ULTSALAUXREAJ, NVL(PP.ULTSALREAJUSTE, 0) AS ULTSALREAJUSTE, '  + #13 +
      '  HST.FLGMANUAL, C.PLNCODIGO, '                                                              + #13 +
      '  HST.FLGSITFUNDACAO, '                                                                      + #13 +
      '  DOC.EMISBLOQ '                                                                             + #13 +

      'FROM '                                                                                       + #13 +
      '  HSTCONTRIBPREV HST, '                                                                      + #13 +
      '  PARTPREVPLAN   PP,  '                                                                      + #13 +
      '  PATRO          PT,  '                                                                      + #13 +
      '  CONTABCONTFUND C,   '                                                                      + #13 +
      '  DOCUMENTO      DOC  '                                                                      + #13 +

      'WHERE '                                                                                      + #13 +
      '      (HST.IDPESSJUR        IN (' + strPatro + ')) '                                         + #13 +
      '  AND (HST.MESCOBRANCA       = ''' + sAnoMesCobrancaTela + ''') '                            + #13 +
      '  AND (HST.IDPLANOPREV      IN (' + strPlano + ')) '                                         + #13 +
      '  AND (HST.FLGSITFUNDACAO   IN (' + strSituacao + ')) '                                      + #13 +
      '  AND (HST.FLGDIVERGENTE    <> 1) '                                                          + #13 +
      '  AND (HST.SITRECEBIMENTO   <= ''1'') '                                                      + #13 +
      '  AND (HST.IDPESSJUR         = PT.IDPESSOA) '                                                + #13 +
      '  AND (PP.IDPESSJUR          = HST.IDPESSJUR) '                                              + #13 +
      '  AND (PP.IDPLANOPREV        = HST.IDPLANOPREV) '                                            + #13 +
      '  AND (PP.IDPESSOA           = HST.IDPESSOA) '                                               + #13 +
      '  AND (C.NUMRECEBIMENTO(+)   = HST.NUMRECEBIMENTO) '                                         + #13;

      if rgrpContribuicoes.ItemIndex = 1 then sSQLEnvio := sSQLEnvio +
      '  AND (HST.FLGEVENTO         = 1) '                                                          + #13;

      if not bDesfazPreparo then sSQLEnvio := sSQLEnvio +
      '  AND (HST.FLGCONCESSAO      = 0) '                                                          + #13;

      if rgrpTipoCobranca.ItemIndex = 0 then sSQLEnvio := sSQLEnvio +
      '  AND (HST.FLGDESCFOLHA      = 1) '                                                          + #13
      else if rgrpTipoCobranca.ItemIndex = 1 then sSQLEnvio := sSQLEnvio +
      '  AND ((HST.FLGDESCFOLHA     = 0) OR ((HST.FLGSITFUNDACAO = ''MP'') AND (FLGDESCFOLHA = 1) )) '    + #13
      else if rgrpTipoCobranca.ItemIndex = 2 then sSQLEnvio := sSQLEnvio +
      '  AND (HST.FLGDESCFOLHA      = 0 ) '                                                         + #13 +
      '  AND EXISTS ( '                                                                             + #13 +
      '             SELECT 1 '                                                                      + #13 +
      '             FROM '                                                                          + #13 +
      '               ELEGPATRO EL, '                                                               + #13 +
      '               SITFUNC   SIT '                                                               + #13 +
      '             WHERE '                                                                         + #13 +
      '                   EL.IDPESSJUR    = HST.IDPESSJUR '                                         + #13 +
      '               AND EL.IDPESSOA     = HST.IDPESSOA '                                          + #13 +
      '               AND SIT.IDSITFUNC   = EL.IDSITFUNC '                                          + #13 +
      '               AND SIT.FLGINTERNO IN (6,7) '                                                 + #13 +
      '             ) '                                                                             + #13;
    end;  // if bIndividual

    if not(chkApenas13.Checked) then
    begin
      // Kintana 1461555 SOL 166858 - Otacilio ** Inicio **
      //case rgrpMeses.ItemIndex of
      if (not chkApenasMes.Checked) and (not chkApenasAtrasadas.Checked) and (not chkApenasDevolucoes.Checked) then
      begin
          //1:
        if chkApenasMes.Checked then
          sSQLEnvio := sSQLEnvio + // apenas do mes
          '  AND (HST.MESREFERENCIA     = HST.MESCOBRANCA) '  + #13;

        //  2:
        if chkApenasAtrasadas.Checked then
          sSQLEnvio := sSQLEnvio + // apenas atrasadas
          '  AND (HST.MESREFERENCIA    <> HST.MESCOBRANCA) '  + #13 +
          '  AND (HST.FLGDEVOLUCAO      = 0) '                + #13;

        //3:
        if chkApenasDevolucoes.Checked then
          sSQLEnvio := sSQLEnvio + // apenas devolucoes
          '  AND (HST.MESREFERENCIA    <> HST.MESCOBRANCA) ' + #13 +
          '  AND (HST.FLGDEVOLUCAO      = 1) '               + #13;
      end;

      //end;
      // Kintana 1461555 SOL 166858 - Otacilio ** Fim **
    end
    else sSQLEnvio := sSQLEnvio +
      '  AND (HST.MESREFERENCIA     = ''' + Copy(sAnoMesCobrancaTela, 1, 4) + '/13' + ''') '        + #13;



    //if (dtVencBoleta.text <> '') then sSQLEnvio := sSQLEnvio +
    //  '  AND (TO_CHAR(HST.DATAPREVISAORECE, ''DD/MM/YYYY'') = ''' + dtVencBoleta.Text + ''' ) '     + #13;

    if rgrpDataVencimento.ItemIndex = 1 then
    begin
       {sDiaIni := Trim(spedDiaIni.Text);
       sDiaFim := Trim(spedDiaFim.Text);

      if Trim(sDiaIni) <> '' then sSQLEnvio := sSQLEnvio +
      '  AND (TO_CHAR(HST.DATAPREVISAORECE,''DD'') >= ''' + sDiaIni + ''') '                        + #13;

      if Trim(sDiaFim) <> '' then sSQLEnvio := sSQLEnvio +
      '  AND (TO_CHAR(HST.DATAPREVISAORECE,''DD'') <= ''' + sDiaFim + ''') '                        + #13;}

      sSQLEnvio := sSQLEnvio +
                   '  AND (TO_CHAR(HST.DATAPREVISAORECE, ''DD/MM/YYYY'') = ''' + dtVencBoleta.Text + ''' ) '     + #13;
    end;

    sSQLEnvio := sSQLEnvio +
      '  AND HST.CODDOCUMENTOPREV   = DOC.CODDOCUMENTO(+) '                                         + #13 +

      'ORDER BY '                                                                                   + #13 +
      '  HST.IDLOTE, HST.CODDOCUMENTOPREV ';

    // ---------------------------------------------------------------------------------------------

    with qryEnvio do
    begin
       Close;
       SQL.Clear;
      SQL.Text := sSQLEnvio;
       Open;
      if IsEmpty then
      begin
        frmAguarde.Apaga;
        MsgDlg('Nenhum envio de contribuição encontrado com os parâmetros indicados.', Sistema.NomeModulo, mtInformation, [mbOk], 0);
        Repaint;
          Exit;
       end;

       iTotalDesfaz := recordcount;
    end; // with qryEnvio

    sCodDocsEnviados := '';

    qryEnvio.First;
    while not(qryEnvio.EOF) do
    Begin
      if not(qryEnvio.FieldByName('CODDOCUMENTOPREV').IsNull) then
      begin
        if qryEnvio.FieldByName('EMISBLOQ').AsString = 'S' then
        begin
           if sCodDocsEnviados = ''
           then sCodDocsEnviados := qryEnvio.FieldByName('CODDOCUMENTOPREV').AsString                          //SOL 207368 KINTANA 2021675 mudei de qryaux pra qryenvio
           else sCodDocsEnviados := sCodDocsEnviados + ',' + qryEnvio.FieldByName('CODDOCUMENTOPREV').AsString;    //SOL 207368 KINTANA 2021675 mudei de qryaux pra qryenvio
        end;
      end;
      qryEnvio.Next;
    End;

    If Trim(sCodDocsEnviados) <> '' Then
    Begin
      MsgDlg('O(s) documento(s) ' + sCodDocsEnviados + ' já foram enviados ao banco e não podem ser desfeitos.', Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Repaint;
         Exit;
      end;

    // ---------------------------------------------------------------------------------------------

    dtmBaseDados.dbBaseDados.StartTransaction;

    if bIndividual then
    begin
      if bDesfazPreparo then
        sDescLog  := 'Desfazer Preparo e Envio - Individual - Mês ' + sAnoMesCobrancaTela
      else
        sDescLog  := 'Desfazer Apenas Envio - Individual - Mês '    + sAnoMesCobrancaTela;
    end
    else
    begin
      if bDesfazPreparo then
        sDescLog  := 'Desfazer Preparo e Envio - Coletivo  - Mês '  + sAnoMesCobrancaTela + '[Patros.: ' + strPatro + '-Planos:' + strPlano + ']'
      else
        sDescLog  := 'Desfazer Apenas Envio - Coletivo  - Mês '     + sAnoMesCobrancaTela + '[Patros.: ' + strPatro + '-Planos:' + strPlano + ']';
    end;


    if not GravaLogTOTALPREV (sDescLog)
    then begin
       frmAguarde.Apaga;
       memResult.Lines.Add('Erro na Gravação do Log.');
       dtmBaseDados.dbBaseDados.RollBack;
       pgctrlOpcoes.ActivePage := tbsResultado;
       Exit;
    end;

    qryEnvio.First;
    iRegAtual := 0;

    if qryDesfazDocumentos.Active and qryDesfazDocumentos.UpdatesPending
    then qryDesfazDocumentos.CancelUpdates;

    qryDesfazDocumentos.Close;
    qryDesfazDocumentos.Open;
    while not qryDesfazDocumentos.EOF do
          qryDesfazDocumentos.Delete;

    { Loop Principal }
    while not qryEnvio.EOF do
    begin
       inc(iRegAtual);
       frmAguarde.Mostra('Desfazendo...'+inttostr(iRegAtual)+' de '+inttostr(iTotalDesfaz)+' ... ');
       frmPreparaEnvia.update;

       iIdLoteAtual       := qryEnvio.FieldByName('IdLote').AsInteger;
       while (iIdLoteAtual = qryEnvio.FieldByName('IdLote').AsInteger) and
             (not qryEnvio.EOF) do
       begin
          if qryEnvio.FieldByName('FlgDescFolha').AsInteger = 1
          then begin // a contribuicao que está sendo desfeita foi enviada para o CCP
             with qryAux do
             begin
                Close;
                SQL.Clear;
                SQL.Add(' DELETE FROM TMPDESC          '+
                        ' WHERE  (MESCOBRANCA    = '''+sAnoMesCobrancaTela+''') '+
                        ' AND    (IDPESSJUR      = '+qryEnvio.FieldByName('IDPESSJUR').AsString     +')'+
                        ' AND    (IDPLANOPREV    = '+qryEnvio.FieldByName('IDPLANOPREV').AsString   +')'+
                        ' AND    (IDPESSOA       = '+qryEnvio.FieldByName('IDPESSOA').AsString      +')'+
                        ' AND    (FLGTIPODESC    = ''P'' ) '+
                        ' AND    (FLGDESCFOLHA   = ''P'' ) '+
                        ' AND    (SEQPROPOSTA    = '+qryEnvio.FieldByName('SEQPROPOSTA').AsString   +')'+
                        ' AND    (IDDESCONTO     = '+qryEnvio.FieldByName('IDCONTRIBUICAO').AsString+')');
                try
                   ExecSQL;
                except
                   memResult.Lines.Add('Erro ao apagar a contribuição da tabela do CCP.');
                   inc(iContErro);
                   qryEnvio.Next;
                   continue;
                end;
             end; // with
          end;

          // Se usuario optou por nao desfazer o preparo ou a contribuicao é
          // derivada de um evento ou de uma concessao, nao desfazer preparo
          if (not bDesfazPreparo) or
             (qryEnvio.FieldByName('FlgEvento').AsInteger    = 1) or
             (qryEnvio.FieldByName('FlgConcessao').AsInteger = 1)
          then begin
             with qryAux do
             begin
                Close;
                SQL.Clear;
                SQL.Add(' UPDATE HSTCONTRIBPREV  SET SITRECEBIMENTO = 0, CODDOCUMENTOPREV = NULL, DATAEMISSCOB = NULL '+
                        ' WHERE  (MESCOBRANCA    = '''+sAnoMesCobrancaTela+''') '+
                        ' AND    (NUMRECEBIMENTO = '+qryEnvio.FieldByName('NUMRECEBIMENTO').AsString+')'+
                        ' AND    (IDPESSJUR      = '+qryEnvio.FieldByName('IDPESSJUR').AsString+')'+
                        ' AND    (IDPLANOPREV    = '+qryEnvio.FieldByName('IDPLANOPREV').AsString+')'+
                        ' AND    (IDPESSOA       = '+qryEnvio.FieldByName('IDPESSOA').AsString+')'+
                        ' AND    (SEQPROPOSTA    = '+qryEnvio.FieldByName('SEQPROPOSTA').AsString+')'+
                        ' AND    (IDCONTRIBUICAO = '+qryEnvio.FieldByName('IDCONTRIBUICAO').AsString+')');
                try
                   ExecSQL;
                except
                   memResult.Lines.Add('Erro ao atualizar situação da contribuição no histórico.');
                   inc(iContErro);
                   qryEnvio.Next;
                   continue;
                end;
             end; // with

             // Desfazer o encerramento do envio
             if not ExcluiSincronismo ( qryAux,
                                        sAnoMesCobrancaTela,
                                        qryEnvio.FieldByName('IdPessJur').AsInteger,
                                        cteIdModuloAdmPREV,
                                        'E',
                                        cTipoEnvPrev)
             then begin
                memResult.Lines.Add('Erro ao desfazer sincronismo do envio.');
                inc(iContErro);
                qryEnvio.Next;
                continue;
             end;


             if qryEnvio.FieldByName('FlgDescFolha').AsInteger = 0
             then begin
                if (qryEnvio.FieldByName('CODDOCUMENTOPREV').AsInteger > 0) and
                   (not qryDesfazDocumentos.Locate('CODDOCUMENTO', qryEnvio.FieldByName('CODDOCUMENTOPREV').AsInteger, []))
                then begin
                   qryDesfazDocumentos.Insert;
                   qryDesfazDocumentos.FieldByName('CODDOCUMENTO').AsInteger := qryEnvio.FieldByName('CODDOCUMENTOPREV').AsInteger;
                   qryDesfazDocumentos.FieldByName('MESREFERENCIA').AsString := qryEnvio.FieldByName('MESREFERENCIA').AsString;
                   qryDesfazDocumentos.Post;
                end;
             end;
          end
          else begin // desfazer preparo e a contribuicao nao é de evento nem concessao
             if (qryEnvio.FieldByName('FlgEvento').AsInteger    = 0) and
                (qryEnvio.FieldByName('FlgConcessao').AsInteger = 0) and
                (qryEnvio.FieldByName('FLGMANUAL').AsInteger    = 0)

             then begin
                with qryAux do
                begin
                   Close;
                   SQL.Clear;
                   SQL.Add(' DELETE FROM HSTATRASOCONTRIB  '+
                           ' WHERE  (MESCOBRANCA    = '''+sAnoMesCobrancaTela+''') '+
                           ' AND    (NUMRECEBIMENTO = '+qryEnvio.FieldByName('NUMRECEBIMENTO').AsString+')');
                   try
                      ExecSQL;
                   except
                      memResult.Lines.Add('Erro ao apagar alteradores da contribuição.');
                      inc(iContErro);
                      qryEnvio.Next;
                      continue;
                   end;
                end; // with

                with qryAux do
                begin
                   Close;
                   SQL.Clear;
                   SQL.Add(' DELETE FROM HSTCONTRIBPREV  '+
                           ' WHERE  (MESCOBRANCA    = '''+sAnoMesCobrancaTela+''') '+
                           ' AND    (NUMRECEBIMENTO = '+qryEnvio.FieldByName('NUMRECEBIMENTO').AsString+')'+
                           ' AND    (IDPESSJUR      = '+qryEnvio.FieldByName('IDPESSJUR').AsString+')'+
                           ' AND    (IDPLANOPREV    = '+qryEnvio.FieldByName('IDPLANOPREV').AsString+')'+
                           ' AND    (IDPESSOA       = '+qryEnvio.FieldByName('IDPESSOA').AsString+')'+
                           ' AND    (SEQPROPOSTA    = '+qryEnvio.FieldByName('SEQPROPOSTA').AsString+')'+
                           ' AND    (IDCONTRIBUICAO = '+qryEnvio.FieldByName('IDCONTRIBUICAO').AsString+')');
                   try
                      ExecSQL;
                   except
                      memResult.Lines.Add('Erro ao apagar a contribuição da tabela de Histórico de Contribuições.');
                      inc(iContErro);
                      qryEnvio.Next;
                      continue;
                   end;
                end; // with

                if (qryEnvio.FieldByName('FlgSitFundacao').AsString = 'MA')
                then begin
                   with qryAux do
                   begin
                      Close;
                      SQL.Clear;
                      SQL.Add(' DELETE FROM HISTRUBSAL   '+
                              ' WHERE  (IDPESSJUR      = '+qryEnvio.FieldByName('IDPESSJUR').AsString+')'+
                              ' AND    (IDPESSOA       = '+qryEnvio.FieldByName('IDPESSOA').AsString+')'+
                              ' AND    (MESCOBRANCA    = '''+sAnoMesCobrancaTela+''') '+
                              ' AND    (IDRUBRICA      = '+qryEnvio.FieldByName('IDRUBSALMANUT').AsString+')');
                      try
                         ExecSQL;
                      except
                         memResult.Lines.Add('Erro ao apagar o salário do histórico de rubricas.');
                         inc(iContErro);
                         qryEnvio.Next;
                         continue;
                      end;
                   end; // with
                end;
                if (qryEnvio.FieldByName('FlgSitFundacao').AsString = 'MP')
                then begin
                   with qryAux do
                   begin
                      Close;
                      SQL.Clear;
                      SQL.Add(' DELETE FROM HISTRUBSAL   '+
                              ' WHERE  (IDPESSJUR      = '+qryEnvio.FieldByName('IDPESSJUR').AsString+')'+
                              ' AND    (IDPESSOA       = '+qryEnvio.FieldByName('IDPESSOA').AsString+')'+
                              ' AND    (MESCOBRANCA    = '''+sAnoMesCobrancaTela+''') '+
                              ' AND    (IDRUBRICA      = '+qryEnvio.FieldByName('IDRUBSALMANUTPARC').AsString+')');
                      try
                         ExecSQL;
                      except
                         memResult.Lines.Add('Erro ao apagar o salário do histórico de rubricas.');
                         inc(iContErro);
                         qryEnvio.Next;
                         continue;
                      end;
                   end; // with
                end;

             End;

             if qryEnvio.FieldByName('FlgDescFolha').AsInteger = 0
             then begin
                if (qryEnvio.FieldByName('CODDOCUMENTOPREV').AsInteger > 0) and
                   (not qryDesfazDocumentos.Locate('CODDOCUMENTO', qryEnvio.FieldByName('CODDOCUMENTOPREV').AsInteger, []))
                then begin
                   qryDesfazDocumentos.Insert;
                   qryDesfazDocumentos.FieldByName('CODDOCUMENTO').AsInteger := qryEnvio.FieldByName('CODDOCUMENTOPREV').AsInteger;
                   qryDesfazDocumentos.FieldByName('MESREFERENCIA').AsString := qryEnvio.FieldByName('MESREFERENCIA').AsString;
                   qryDesfazDocumentos.Post;
                end;


                if qryEnvio.FieldByName('PLNCODIGO').AsInteger > 0
                then begin
                   with qryAux do
                   begin
                      qryAux.Close;
                      qryAux.SQL.Clear;
                      qryAux.SQL.Add(' DELETE FROM CONTABCONTFUND '+
                                     ' WHERE  NUMRECEBIMENTO      = '+ qryEnvio.FieldByName('NUMRECEBIMENTO').AsString);
                      try
                         qryAux.ExecSQL;
                      except
                         memResult.Lines.Add('Erro ao apagar o salário do histórico de rubricas.');
                         inc(iContErro);
                         qryEnvio.Next;
                         continue;
                      end;
                   end; // with
                end;
             end;

             if bIndividual
             then begin
                with qryAux do
                begin
                   Close;
                   SQL.Clear;

                   SQL.Add(' UPDATE CTRLINTERFACE SET NUMREG = NUMREG - 1, '+
                           '                      VLRTOTAL = VLRTOTAL - '+OraNumero(qryEnvio.FieldByName('ValorEsperado').AsString)+
                           ' WHERE  (IDLOTE = '+qryEnvio.FieldByName('IDLOTE').AsString+')');
                   try
                      ExecSQL;
                   except
                      memResult.Lines.Add('Erro ao apagar a contribuição da tabela do CCP.');
                      inc(iContErro);
                      qryEnvio.Next;
                      continue;
                   end;
                end; // with
             end;


             if (qryEnvio.FieldByName('FlgEvento').AsInteger    = 0) and
                (qryEnvio.FieldByName('FlgConcessao').AsInteger = 0) and
                (qryEnvio.FieldByName('FLGMANUAL').AsInteger    = 0)

             then begin
               with qryAux do
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add(' UPDATE CONTRIBPREVPARTP SET ULTMESPREPARO = '''+sUltMesPreparo+''''+
                          ' WHERE  (IDPESSJUR      = '+qryEnvio.FieldByName('IDPESSJUR').AsString+')'+
                          ' AND    (IDPLANOPREV    = '+qryEnvio.FieldByName('IDPLANOPREV').AsString+')'+
                          ' AND    (IDPESSOA       = '+qryEnvio.FieldByName('IDPESSOA').AsString+')'+
                          ' AND    (SEQPROPOSTA    = '+qryEnvio.FieldByName('SEQPROPOSTA').AsString+')'+
                          ' AND    (IDCONTRIBUICAO = '+qryEnvio.FieldByName('IDCONTRIBUICAO').AsString+')');
                  try
                     ExecSQL;
                  except
                     memResult.Lines.Add('Erro ao atualizar último mês de cobrança.');
                     inc(iContErro);
                     qryEnvio.Next;
                     continue;
                  end;
               end; // with
             End;

          end; // fim de "desfazer preparo e a contribuicao nao é de evento nem concessao"




          //voltar valor do salário antes do resjuste, caso
          //este seja um mês de reajuste
          if (bDesfazPreparo) And
             (qryEnvio.FieldByName('MESREFERENCIA').AsString =
              qryEnvio.fieldbyname('MESULTREAJSAL').AsString) and
             ((qryEnvio.fieldbyname('ULTSALMANTREAJ').AsFloat > 0) or
              (qryEnvio.fieldbyname('ULTSALAUXREAJ').AsFloat  > 0) or
              (qryEnvio.fieldbyname('ULTSALREAJUSTE').AsFloat > 0) and

              (qryEnvio.FieldByName('FlgEvento').AsInteger    = 0) And
              (qryEnvio.FieldByName('FlgConcessao').AsInteger = 0) And
              (qryEnvio.FieldByName('FLGMANUAL').AsInteger    = 0)) Then


          begin

             sSQLPPP := 'UPDATE PARTPREVPLAN SET ';
             If (qryEnvio.FieldByName('FLGSITFUNDACAO').AsString = 'MA') Or
                (qryEnvio.FieldByName('FLGSITFUNDACAO').AsString = 'MP') Or
                (qryEnvio.FieldByName('FLGSITFUNDACAO').AsString = 'MS')
              Then sSQLPPP := sSQLPPP + ' SALMANTIDO   = ULTSALMANTREAJ,   '
              Else If qryEnvio.FieldByName('FLGSITFUNDACAO').AsString = 'AS'
                    Then sSQLPPP := sSQLPPP + ' SALAUXDOENCA   = ULTSALAUXREAJ,   '
                    Else sSQLPPP := sSQLPPP + ' SALPARTICIPACAO   = ULTSALREAJUSTE,   ';
             sSQLPPP := sSQLPPP + ' MESULTREAJSAL = '+QuotedStr(sAnoMesAnterior(qryEnvio.fieldbyname('MESULTREAJSAL').AsString))+' '+

                        'WHERE  (IDPESSJUR      = '+qryEnvio.FieldByName('IDPESSJUR').AsString      +') '+
                        ' AND   (IDPLANOPREV    = '+qryEnvio.FieldByName('IDPLANOPREV').AsString    +') '+
                        ' AND   (IDPESSOA       = '+qryEnvio.FieldByName('IDPESSOA').AsString       +') '+
                        ' AND   (SEQPROPOSTA    = '+qryEnvio.FieldByName('SEQPROPOSTA').AsString    +') ';

             QryAux.SQL.Clear;
             QryAux.SQL.Add(sSQLPPP);
             QryAux.ExecSQL;
          end;//if mesreferencia = mesultreajsal


          qryEnvio.Next;

       end; // while iIdLoteAtual = qryEnvio.IdLote

       if bDesfazPreparo
       then begin // desfazer PREPARO e ENVIO
          if (not bIndividual)
             and (qryEnvio.FieldByName('FLGMANUAL').AsInteger = 0)
          then begin
             with qryAux do
             begin
                Close;
                SQL.Clear;
                SQL.Add('DELETE FROM CTRLINTERFACE C');
                SQL.Add('WHERE (C.IDLOTE = '+qryEnvio.FieldByName('IDLOTE').AsString+' )');
                SQL.Add('  AND (NOT EXISTS (SELECT 1 FROM HSTCONTRIBPREV H');
                SQL.Add('                   WHERE H.IDLOTE = C.IDLOTE');
                SQL.Add('                     AND H.FLGMANUAL = 1) )');

                try
                   ExecSQL;
                except
                   memResult.Lines.Add('Erro ao apagar a contribuição da tabela de controle.');
                end;
             end; // with
          end;
       end
       else begin // desfazer apenas ENVIO
          with qryAux do
          begin
             Close;
             SQL.Clear;
             SQL.Add(' UPDATE CTRLINTERFACE SET FLGIDATMP = 0, DATAIDATMP = NULL  '+
                     ' WHERE  IDLOTE = '+IntToStr(iIdLoteAtual)+' ');
             try
                ExecSQL;
             except
                memResult.Lines.Add('Erro ao atualizar lote.');
             end;
          end;//with
       end

    end; // while not qryEnvio.EOF

    // Apagar documentos envolvidos no desfazer envio
    qryDesfazDocumentos.First;
    while not qryDesfazDocumentos.EOF do
    begin
       bOK   := EstornaContribuicaoBANCO (CtrlDocumento,
                                          CtrlLancamento,
                                          qryDesfazDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                          qryAux, dtmAPrev.qryAux,
                                          qryDesfazDocumentos.FieldByName('MESREFERENCIA').AsString,
                                          sMsgErro);

       if not bOk
       then begin
          memResult.Lines.Add('Erro no estorno ['+sMsgErro+']');
          inc(iContErro);
          qryDesfazDocumentos.Next;
          continue;
       end;
       qryDesfazDocumentos.Next;
    end;
    qryDesfazDocumentos.Close;

    frmAguarde.Apaga;

    if bDesfazPreparo
    then sMsg := 'Desfazer Preparo e Envio  '
    else sMsg := 'Desfazer Envio ';

    frmAguarde.Apaga;

    if MsgDlg(sMsg+'desfeito(s) com sucesso. Deseja efetivar a operação ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
    then begin
       memResult.Lines.Add(sMsg+' cancelado(s). ');
       dtmBaseDados.dbBaseDados.RollBack;
       MsgDlg(sMsg+' cancelado(s).','Informação',mtInformation,[mbOk, mbHelp],0);
       pgctrlOpcoes.ActivePage := tbsResultado;
    end
    else begin
       memResult.Lines.Add(sMsg+' efetivado(s). ');
       dtmBaseDados.dbBaseDados.Commit;
       MsgDlg(sMsg+' desfeito(s) com sucesso !','Informação',mtInformation,[mbOk, mbHelp],0);
       pgctrlOpcoes.ActivePage := tbsResultado;
    end;

  finally
    frmAguarde.Apaga;
  end;
end;



function TfrmPreparaEnvia.GeraAlteradorPARCELA( piIdLote : longint;
                                                var sMsgErro : String ) : boolean;
var sSQLRegra,
    sValorRegra : String;
    bErroRegra  : boolean;
begin
   Result := False;

   // Abrir query com todas as contribuicoes do lote e seus alteradores
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT HST.NUMRECEBIMENTO, HST.MESREFERENCIA, HST.MESCOBRANCA, '+
              '        HST.IDMOTIVO,       HST2.DATAPREVISAORECE,              '+
              '        AC.IDREGRACALCULO                                       '+
              ' FROM   ALTERADORXCONTRIB AC, HSTCONTRIBPREV HST, HSTCONTRIBPREV HST2 '+
              ' WHERE  HST.IDLOTE         = '+IntToStr(piIdLote)+
              ' AND    HST.MESCOBRANCA    = '''+sAnoMesCobrancaTela+''''+
              ' AND    HST.IDCONTRIBUICAO = AC.IDCONTRIBUICAO '+
              ' AND    HST2.NUMRECEBIMENTO = HST.NUMRECPARCELA1 '+
              ' AND    HST2.IDMOTIVO       = '+IntToStr(prmIdMotivoContrib)+
              ' AND    AC.FLGCOBRA        = 1 '+
              ' AND    AC.FLGATRASO       = 1 '+
              ' ORDER BY HST.NUMRECEBIMENTO ');
      Open;
      First;
      // Para cada recebimento calcular seus alteradores e gravar na HSTATRASOCONTRIB
      while not EOF do
      begin
         if FieldByName('IdRegraCalculo').AsFloat <= 0
         then begin
            Next;
            Continue;
         end;

         sSQLRegra := ' SELECT '''+FieldByName('MesReferencia').AsString    +''' AS MESREFERENCIA, '+
                              ''''+FieldByName('MesCobranca').AsString      +''' AS MESCOBRANCA, '+
                              ''''+FieldByName('DataPrevisaoRece').AsString +''' AS DATAPREVISAORECE, '+
                              OraNumero(FloatToStr(FieldByName('ValorEsperado').AsFloat))+' AS VALORESPERADO, '+
                              OraNumero(FloatToStr(FieldByName('ValorEsperado').AsFloat))+' AS VALORPREV, '+
                              OraNumero(FloatToStr(FieldByName('ValorRecebido').AsFloat))+' AS VALORRECEBIDO, '+
                              ' NULL AS DATARECEBIMENTO , '+
                              IntToSTr(Sistema.Idmodulo)      +'   AS IDMODULO '+                                
                      ' FROM DUAL ';

         try
            sValorRegra := RegraNumerica( FieldByName('IdRegraCalculo').AsString ,
                                          sSQLRegra, bErroRegra, iIdCalculoGeral);
         except
            sMsgErro := 'Erro na execução da regra de cálculo dos alteradores de parcelamento - Regra Nº '+FieldByName('IdRegraCalculo').AsString;
            Exit;
         end;

         if (Trim(sValorRegra) = '') or (StrToFloat(ClienteNumero(sValorRegra)) <= 0)
         then begin
            Next;
            continue;
         end;

         qryAux2.Close;
         qryAux2.SQL.Clear;
         qryAux2.SQL.Add(' INSERT INTO HSTATRASOCONTRIB ( CODALTERADOR,        '+
                         '             FLGEVENTO, FLGRETROATIVO, FLGTIPO,      '+
                         '             IDMOTIVO,  MESCOBRANCA,   MESREFERENCIA,'+
                         '             NUMRECEBIMENTO, VALOR)                  '+
                         ' VALUES ( '+FieldByName('CodAlterador').AsString     +','+
                                    '1, 0, ''A'', '+
                                      FieldByName('IdMotivo').AsString         +','+
                                 ''''+FieldByName('MesCobranca').AsString      +''','+
                                 ''''+FieldByName('MesReferencia').AsString    +''','+
                                      FieldByName('NumRecebimento').AsString   +','+
                                      OraNumero(sValorRegra)+')');
         try
            qryAux2.ExecSQL;
         except
            sMsgErro := 'Erro ao inserir alteradores de parcelamento. ';
            Exit;
         end;

         Next;
      end; // while not qryAux.EOF
   end; //with qryAux

   qryAux.Close;
   Result := True;
end; // GeraAlteradorPARCELA



function TfrmPreparaEnvia.AlteraIdloteAtrasoDevol : Boolean;
begin
     result := false;

     if not qryplanpatro.Active then
     begin
        qryPlanPatro.Close;
        qryPlanPatro.SQL.Clear;
        qryPlanPatro.SQL.Add(' SELECT P.NOME AS PATROCINADORA, PL.NOME AS PLANO, '+
                             '        PL.FLGUSASALARIO,                          '+
                             '        PLP.IDPESSJUR, PLP.IDPLANOPREV,  '+
                             '        CL.IDCALENDARIO,CL.FLGINTERNO,CL.ANOMESREF,CL.DATACOBNORMAL,CL.DATACOBATRASO, '+
                             '        CL.DATACOBDEVOLUCAO,CL.DATAPAGBENEF,CL.DATAPAGABONO,CL.DATAPAGANTBENEF,       '+
                             '        CL.DATAPAGANTABONO, PT.FLGANO13                             '+
                             ' FROM   PLANPREVPATRO PLP, PLANPREV PL, PESSOA P, CALENDDATAS CL, PATRO PT '+
                             ' WHERE  PLP.IDPLANOPREV  = PL.IDPLANOPREV             '+
                             ' AND    PLP.IDPESSJUR    = P.IDPESSOA                 '+
                             ' AND    PLP.IDCALENDARIO = CL.IDCALENDARIO            '+
                             ' AND    PLP.IDPESSJUR    = PT.IDPESSOA                '+
                             ' AND    CL.FLGINTERNO    <> ''PT''                    '+
                             ' AND    PLP.IDPESSJUR    IN ('+strPatro+')            '+
                             ' AND    PLP.IDPLANOPREV  IN ('+strPlano+')            '+
                             ' AND    CL.FLGINTERNO    IN ('+strSituacao+')         '+
                             ' AND    CL.ANOMESREF     = '''+sAnoMesCobrancaTela+''''+
                             ' ORDER BY PLP.IDPESSJUR, PLP.IDPLANOPREV, CL.FLGINTERNO ');
        qryPlanPatro.Open;

     end;

     qryplanpatro.first;

     while not qryplanpatro.EOF do
     begin
        //atualiza o campo idlote da hstcontribprev
        //nos registros que foram inseridos
        //como atrasos e devoluções, possivelmente por entrada manual
        //e sem o lote não serão tratados pelo envio

        qryaux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT COUNT(1) AS TOTAL FROM HSTCONTRIBPREV '+
                       ' WHERE  MESCOBRANCA    = '''+sAnoMesCobrancaTelaInicial+''''+
                       ' AND    IDPESSJUR      = '+qryPlanPatro.FieldByName('IdPessJur').AsString+
                       ' AND    IDPLANOPREV    = '+qryPlanPatro.FieldByName('IdPlanoPrev').AsString+
                       ' AND    IDLOTE IS NULL '+
                       ' AND    ((SITRECEBIMENTO = ''0'' ) OR (SITRECEBIMENTO = ''8'') ) '+
                       ' AND    FLGSITFUNDACAO = '''+qryPlanPatro.FieldByName('FlgInterno').AsString+'''');
         qryAux.Open;

         try
            qryaux.open;
         except
            exit;
         end;

        if (not qryAux.IsEmpty) and (qryAux.FieldbyName('TOTAL').AsFloat > 0)
        then begin
           sDescLote  := 'Atrasos / Devoluções Contribuições Prev. - '+Trim(qryPlanPatro.FieldByName('Patrocinadora').AsString)+
                         ' - '+Trim(qryPlanPatro.FieldbyName('Plano').AsString)+
                         ' - '+ProcSituacao(qryPlanPatro.FieldByName('FlgInterno').AsString);

           // Gerar lote na CTRLINTERFACE com flgPreparado   = True
           frmAguarde.Mostra('Gerando Lote de Preparo : '+sDescLote+' ... ');

           // Gerar novo lote
           idLote := LeUltRegistro(dtmAPrev.qry,'CTRLINTERFACE');

           if idLote < 0 then Exit;

           qryaux.Close;
           qryaux.sql.text := ' INSERT INTO CTRLINTERFACE(IDLOTE, IDPESSOA, FLGPREPARADO, '+
                              ' MESREFERENCIA, TIPO, DATAPREPARO, DESCRICAO)              '+
                              ' VALUES('+IntToStr(IdLote)+','+IntToStr(qryPlanPatro.FieldByName('IdPessJur').AsInteger)+', '+
                              ' 1, '''+sAnoMesCobrancaTela+''', ''P'', SYSDATE, '''+sDescLote+''') ';
           try
              qryaux.execsql;
           except
              exit;
           end;


           qryaux.Close;
           qryaux.sql.text := ' UPDATE HSTCONTRIBPREV  SET IDLOTE = '''+inttostr(idLote)+''' '+
                              ' , DATAEMISSCOB     = NULL '+ // SOL 180156 Kintana 1668852
                              ' WHERE  MESCOBRANCA    = '''+sAnoMesCobrancaTelaInicial+''''+
                              ' AND    IDPESSJUR      = '+qryPlanPatro.FieldByName('IdPessJur').AsString+
                              ' AND    IDPLANOPREV    = '+qryPlanPatro.FieldByName('IdPlanoPrev').AsString+
                              ' AND    IDLOTE IS NULL '+
                              ' AND    ((SITRECEBIMENTO = ''0'' ) OR (SITRECEBIMENTO = ''8'') ) '+
                              ' AND    FLGSITFUNDACAO = '''+qryPlanPatro.FieldByName('FlgInterno').AsString+'''';
           try
              qryaux.execsql;
           except
              exit;
           end;
        end;
        qryplanpatro.next;
     end;//while

     result := true;
end;



function TfrmPreparaEnvia.VerificaCodPortForma: Boolean;
Var
 bErro : Boolean;
begin
 qryContribuicao.First;
 While not qryContribuicao.EOF do
  Begin
    If qryContribuicao.FieldByName('CODPORTFORMA').IsNull
     Then Begin
       bErro := True;
       memResult.Lines.Add('** Contribuição '+qryContribuicao.FieldByName('NOME').AsString+
                           ' com a Forma de Pagamento não parametrizada.');
     End;
    qryContribuicao.Next;

  End;
 qryContribuicao.First;

 Result := Not bErro;
end;

procedure TfrmPreparaEnvia.CbBpdClick(Sender: TObject);
begin
  inherited;
  if (CbBpd.Checked) then
  begin
     CbPga.Checked   := false;
     CbEnvio.Checked := false;
  end;

  qryFiltroContrib.Close;
  qryFiltroContrib.SQL.Clear;
  qryFiltroContrib.SQL.Add(' SELECT IDCONTRIBUICAO, NOME '+
                           ' FROM   CONTRIBUICAO           '+
                           ' WHERE  IDCONTRIBUICAO IN (SELECT CP.IDCONTRIBUICAO FROM CONTPREV CP, PLANPREVPATRO PLP, PATRO PT '+
                           '                           WHERE PT.IDFUNDACAO = '+IntToStr(iIdFundacao)  +
                           '                           AND   PLP.IDPESSJUR = PT.IDPESSOA             '+
                           '                           AND   CP.IDPLANOPREV = PLP.IDPLANOPREV    )   ');
                           if (CbBpd.Checked) and not(CbPga.Checked) and not(CbEnvio.Checked) then
                           begin
                              qryFiltroContrib.SQL.Add(' and  exists (select 1 from CONTPREVEVENTO      '+
                              ' where Idcontribuicao = CONTRIBUICAO.IDCONTRIBUICAO                      '+
                              ' and   ideventogerador = 17)                                             ');
                           end;

                          qryFiltroContrib.SQL.Add('ORDER BY NOME ');



  with dtmPreparaContrib do
  begin
    qryLote.Close;         qryLote.open;

  end;
  qryFiltroContrib.Close;  qryFiltroContrib.Open;
  CriaLista(chklstContrib, qryFiltroContrib);
end;

procedure TfrmPreparaEnvia.CbPgaClick(Sender: TObject);
begin
  inherited;
  qryFiltroContrib.Close;
  qryFiltroContrib.SQL.Clear;
  qryFiltroContrib.SQL.Add(' SELECT IDCONTRIBUICAO, NOME '+
                           ' FROM   CONTRIBUICAO           '+
                           ' WHERE  IDCONTRIBUICAO IN (SELECT CP.IDCONTRIBUICAO FROM CONTPREV CP, PLANPREVPATRO PLP, PATRO PT '+
                           '                           WHERE PT.IDFUNDACAO = '+IntToStr(iIdFundacao)  +
                           '                           AND   PLP.IDPESSJUR = PT.IDPESSOA             '+
                           '                           AND   CP.IDPLANOPREV = PLP.IDPLANOPREV    )   ');
                           if (CbBpd.Checked) and not(CbPga.Checked) and not(CbEnvio.Checked) then
                           begin
                              qryFiltroContrib.SQL.Add(' and  exists (select 1 from CONTPREVEVENTO      '+
                              ' where Idcontribuicao = CONTRIBUICAO.IDCONTRIBUICAO                      '+
                              ' and   ideventogerador = 17)                                             ');
                           end;

                          qryFiltroContrib.SQL.Add('ORDER BY NOME ');



  with dtmPreparaContrib do
  begin
    qryLote.Close;         qryLote.open;

  end;
  qryFiltroContrib.Close;  qryFiltroContrib.Open;
  CriaLista(chklstContrib, qryFiltroContrib);
end;

procedure TfrmPreparaEnvia.CbEnvioClick(Sender: TObject);
begin
  inherited;
  qryFiltroContrib.Close;
  qryFiltroContrib.SQL.Clear;
  qryFiltroContrib.SQL.Add(' SELECT IDCONTRIBUICAO, NOME '+
                           ' FROM   CONTRIBUICAO           '+
                           ' WHERE  IDCONTRIBUICAO IN (SELECT CP.IDCONTRIBUICAO FROM CONTPREV CP, PLANPREVPATRO PLP, PATRO PT '+
                           '                           WHERE PT.IDFUNDACAO = '+IntToStr(iIdFundacao)  +
                           '                           AND   PLP.IDPESSJUR = PT.IDPESSOA             '+
                           '                           AND   CP.IDPLANOPREV = PLP.IDPLANOPREV    )   ');
                           if (CbBpd.Checked) and not(CbPga.Checked) and not(CbEnvio.Checked) then
                           begin
                              qryFiltroContrib.SQL.Add(' and  exists (select 1 from CONTPREVEVENTO      '+
                              ' where Idcontribuicao = CONTRIBUICAO.IDCONTRIBUICAO                      '+
                              ' and   ideventogerador = 17)                                             ');
                           end;

                          qryFiltroContrib.SQL.Add('ORDER BY NOME ');



  with dtmPreparaContrib do
  begin
    qryLote.Close;         qryLote.open;

  end;
  qryFiltroContrib.Close;  qryFiltroContrib.Open;
  CriaLista(chklstContrib, qryFiltroContrib);
end;

procedure TfrmPreparaEnvia.FiltraDadosBaixa(sRecPag, pDocumentos: String);
  procedure AdicionaPlanosPrevidenciarios;
  begin
    try
       //PAGAMENTOS
       if sRecPag = 'P' then
       begin
          cdsDocPag.DisableControls;
          while (not cdsDocPag.eof) do
          begin
             AbreQryPlanoxDocum(cdsDocPag.FieldByName('CODDOCUMENTO').AsString);
             while (not qryPlanoxDocum.Eof) do
             begin
                cdsDocPag.Edit;
                if (qryPlanoxDocum.recno > 1) then
                  cdsDocPag.fieldByName('PLANOPREV').asString := cdsDocPag.fieldByName('PLANOPREV').asString + '; '+ qryPlanoxDocum.fieldByName('NOME').asString
                else
                  cdsDocPag.fieldByName('PLANOPREV').asString := cdsDocPag.fieldByName('PLANOPREV').asString + qryPlanoxDocum.fieldByName('NOME').asString;
                cdsDocPag.Post;
                qryPlanoxDocum.Next;
             end;

             cdsDocPag.Next;
          end;
          cdsDocPag.EnableControls;
          
       //RECEBIMENTOS
       end else begin

          cdsDocRec.DisableControls;
          while (not cdsDocRec.eof) do
          begin
             AbreQryPlanoxDocum(cdsDocPag.FieldByName('CODDOCUMENTO').AsString);
             while (not qryPlanoxDocum.Eof) do
             begin
                cdsDocRec.Edit;
                if (qryPlanoxDocum.recno > 1) then
                  cdsDocRec.fieldByName('PLANOPREV').asString := cdsDocRec.fieldByName('PLANOPREV').asString + '; '+ qryPlanoxDocum.fieldByName('NOME').asString
                else
                  cdsDocRec.fieldByName('PLANOPREV').asString := cdsDocRec.fieldByName('PLANOPREV').asString + qryPlanoxDocum.fieldByName('NOME').asString;
                cdsDocRec.Post;
                qryPlanoxDocum.Next;
             end;

             cdsDocRec.Next;
          end;
       end;
    finally
       cdsDocRec.EnableControls;
    end;
  end;
begin
  if sRecPag = 'P' then begin
    with SQLDocPag do
    begin
      SQL.Clear;
      SQL.Append('SELECT');
      SQL.Append('  ''S'' AS SELECIONA,');
      SQL.Append('  ''N'' AS BAIXAPARCIAL,');
      SQL.Append('  0 AS VALORPAGO,');
      SQL.Append('  0 as VALORPAGOOOTRMOE,');
      SQL.Append('  U.SALDO,');
      SQL.Append('  U.SALDO1,');
      SQL.Append('  D.IDFORCLI,');
      SQL.Append('  D.OPERACAO,');
      SQL.Append('  D.IDPESSOA,');
      SQL.Append('  D.CODDOCUMENTO,');
      SQL.Append('  D.NODOCUMENTO,');
      SQL.Append('  D.COMPLDOCUMENTO,');
      SQL.Append('  D.DATAPROGRAMADA,');
      SQL.Append('  D.DATAVENCTO,');
      SQL.Append('  D.RECPAG,');
      SQL.Append('  P.NOME,');
      SQL.Append('  D.STATUS,');
      SQL.Append('  D.MOECODIGO,');
      SQL.Append('  D.PLANO,');
      SQL.Append('  D.PLACONTA,');
      SQL.Append('  D.CODCENTROCUSTO,');
      SQL.Append('  D.CODSUBCONTA,');
      SQL.Append('  D.CODGRUPOCNAB,');
      SQL.Append('  D.NOSSONUMERO,');
      SQL.Append('  L.NUMLANCTO,');
      SQL.Append('  L.VLRLIQUIDO,');
      SQL.Append('  DECODE(L.DEBCRE,''C'',''D'',''C'') AS DEBCRE,');
      SQL.Append('  L.VALOROUTRAMOEDA,');
      SQL.Append('  0 AS IMPRET,');
      SQL.Append('  0 AS IMP,');
      SQL.Append('  0 AS DIF,');
      SQL.Append('  D.IDMODULO,');
      SQL.Append('  D.CODTIPDOC');
      SQL.Append(', ''                                        ''  AS PLANOPREV ');
      SQL.Append('FROM');
      SQL.Append('  DOCUMENTO D,');
      SQL.Append('  PESSOA P,');
      SQL.Append('  LANCTODOCUM L,');
      SQL.Append('  (SELECT L.CODDOCUMENTO,');
      SQL.Append('  SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR * -1),DECODE(D.RECPAG,''R'',L.VALOR * -1,L.VALOR))) AS SALDO, ');
      SQL.Append('  SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA * -1,L.VALOROUTRAMOEDA))) AS SALDO1 ');
      SQL.Append('   FROM LANCTODOCUM L, DOCUMENTO D');
      SQL.Append('   WHERE D.CODDOCUMENTO IN ('+pDocumentos+') AND');
      SQL.Append('         D.CODDOCUMENTO = L.CODDOCUMENTO AND');
      SQL.Append('         D.RECPAG = ' + QuotedStr(sRecPag) + ' AND');
      SQL.Append('         D.STATUS <> ''2''');
      SQL.Append('   GROUP BY L.CODDOCUMENTO) U ');
      SQL.Append('WHERE');
      SQL.Append(' (D.RECPAG = ' + QuotedStr(sRecPag) + ' ) AND');
      SQL.Append('  D.CODTIPDOC IN');
      SQL.Append('       (SELECT CODTIPDOC');
      SQL.Append('        FROM TIPODOCRECPAG A');
      SQL.Append('        WHERE A.RECPAG = ' + QuotedStr(sRecPag) + ' AND NOT EXISTS');
      SQL.Append('                               (SELECT 1 FROM USUARIOXTPDOCTO B');
      SQL.Append('                                WHERE RECPAG = ' + QuotedStr(sRecPag) + ' AND');
      SQL.Append('                                      B.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario));
      SQL.Append('                                )');
      SQL.Append('        UNION');
      SQL.Append('        SELECT CODTIPDOC FROM TIPODOCRECPAG A');
      SQL.Append('        WHERE A.RECPAG = ' + QuotedStr(sRecPag) + ' AND EXISTS');
      SQL.Append('                               (SELECT 1 FROM USUARIOXTPDOCTO B');
      SQL.Append('                                WHERE RECPAG = ' + QuotedStr(sRecPag) + ' AND');
      SQL.Append('                                      A.CODTIPDOC = B.CODTIPDOC AND');
      SQL.Append('                                      B.IDUSUARIO = ' + IntToStr(Sistema.iDUsuario) + ')) AND ');
      SQL.Append(' (D.OPERACAO = L.OPERACAO) AND');
      SQL.Append(' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND');
      SQL.Append(' (L.ESTORNO IS NULL) AND');
      SQL.Append(' (D.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)+ ') AND');
      SQL.Append(' (D.STATUS = ''0'' OR D.STATUS=''1'' OR (D.STATUS IS NULL)) AND');
      SQL.Append(' (RTrim(D.OPERACAO) IN (''1'',''2'',''3'')) AND');
      SQL.Append(' (D.IDFORCLI = P.IDPESSOA) AND');
      SQL.Append(' (D.CODDOCUMENTO IN ('+pDocumentos+')) AND');
      SQL.Append(' (D.CODDOCUMENTO !=ALL (SELECT CODDOCUMENTO FROM LOTEXDOCUM ');
      SQL.Append('                                  WHERE FLGBAIXA IS NULL OR FLGBAIXA = ''N'')) AND ');
      SQL.Append(' (U.SALDO >0  ) AND');
      SQL.Append(' (U.CODDOCUMENTO = D.CODDOCUMENTO)');
      SQL.Append(' ORDER BY P.NOME, D.DATAPROGRAMADA, D.NODOCUMENTO');
      Open;
    end;        
  end else begin
    with SQLDocRec do
    begin
      SQL.Clear;
      SQL.Append('SELECT');
      SQL.Append('  ''S'' AS SELECIONA,');
      SQL.Append('  ''N'' AS BAIXAPARCIAL,');
      SQL.Append('  0 AS VALORPAGO,');
      SQL.Append('  0 as VALORPAGOOOTRMOE,');
      SQL.Append('  U.SALDO,');
      SQL.Append('  U.SALDO1,');
      SQL.Append('  D.IDFORCLI,');
      SQL.Append('  D.OPERACAO,');
      SQL.Append('  D.IDPESSOA,');
      SQL.Append('  D.CODDOCUMENTO,');
      SQL.Append('  D.NODOCUMENTO,');
      SQL.Append('  D.COMPLDOCUMENTO,');
      SQL.Append('  D.DATAPROGRAMADA,');
      SQL.Append('  D.DATAVENCTO,');
      SQL.Append('  D.RECPAG,');
      SQL.Append('  P.NOME,');
      SQL.Append('  D.STATUS,');
      SQL.Append('  D.MOECODIGO,');
      SQL.Append('  D.PLANO,');
      SQL.Append('  D.PLACONTA,');
      SQL.Append('  D.CODCENTROCUSTO,');
      SQL.Append('  D.CODSUBCONTA,');
      SQL.Append('  D.CODGRUPOCNAB,');
      SQL.Append('  D.NOSSONUMERO,');
      SQL.Append('  L.NUMLANCTO,');
      SQL.Append('  L.VLRLIQUIDO,');
      SQL.Append('  DECODE(L.DEBCRE,''C'',''D'',''C'') AS DEBCRE,');
      SQL.Append('  L.VALOROUTRAMOEDA,');
      SQL.Append('  0 AS IMPRET,');
      SQL.Append('  0 AS IMP,');
      SQL.Append('  0 AS DIF,');
      SQL.Append('  D.IDMODULO,');
      SQL.Append('  D.CODTIPDOC');
      SQL.Append(', ''                                        ''  AS PLANOPREV ');
      SQL.Append('FROM');
      SQL.Append('  DOCUMENTO D,');
      SQL.Append('  PESSOA P,');
      SQL.Append('  LANCTODOCUM L,');
      SQL.Append('  (SELECT L.CODDOCUMENTO,');
      SQL.Append('  SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR * -1),DECODE(D.RECPAG,''R'',L.VALOR * -1,L.VALOR))) AS SALDO, ');
      SQL.Append('  SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA * -1,L.VALOROUTRAMOEDA))) AS SALDO1 ');
      SQL.Append('   FROM LANCTODOCUM L, DOCUMENTO D');
      SQL.Append('   WHERE D.CODDOCUMENTO IN ('+pDocumentos+') AND');
      SQL.Append('         D.CODDOCUMENTO = L.CODDOCUMENTO AND');
      SQL.Append('         D.RECPAG = ' + QuotedStr(sRecPag) + ' AND');
      SQL.Append('         D.STATUS <> ''2''');
      SQL.Append('   GROUP BY L.CODDOCUMENTO) U ');
      SQL.Append('WHERE');
      SQL.Append(' (D.RECPAG = ' + QuotedStr(sRecPag) + ' ) AND');
      SQL.Append('  D.CODTIPDOC IN');
      SQL.Append('       (SELECT CODTIPDOC');
      SQL.Append('        FROM TIPODOCRECPAG A');
      SQL.Append('        WHERE A.RECPAG = ' + QuotedStr(sRecPag) + ' AND NOT EXISTS');
      SQL.Append('                               (SELECT 1 FROM USUARIOXTPDOCTO B');
      SQL.Append('                                WHERE RECPAG = ' + QuotedStr(sRecPag) + ' AND');
      SQL.Append('                                      B.IDUSUARIO = ' + IntToStr(Sistema.IDUsuario));
      SQL.Append('                                )');
      SQL.Append('        UNION');
      SQL.Append('        SELECT CODTIPDOC FROM TIPODOCRECPAG A');
      SQL.Append('        WHERE A.RECPAG = ' + QuotedStr(sRecPag) + ' AND EXISTS');
      SQL.Append('                               (SELECT 1 FROM USUARIOXTPDOCTO B');
      SQL.Append('                                WHERE RECPAG = ' + QuotedStr(sRecPag) + ' AND');
      SQL.Append('                                      A.CODTIPDOC = B.CODTIPDOC AND');
      SQL.Append('                                      B.IDUSUARIO = ' + IntToStr(Sistema.iDUsuario) + ')) AND ');
      SQL.Append(' (D.OPERACAO = L.OPERACAO) AND');
      SQL.Append(' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND');
      SQL.Append(' (L.ESTORNO IS NULL) AND');
      SQL.Append(' (D.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa)+ ') AND');
      SQL.Append(' (D.STATUS = ''0'' OR D.STATUS=''1'' OR (D.STATUS IS NULL)) AND');
      SQL.Append(' (RTrim(D.OPERACAO) IN (''1'',''2'',''3'')) AND');
      SQL.Append(' (D.IDFORCLI = P.IDPESSOA) AND');
      SQL.Append(' (D.CODDOCUMENTO IN ('+pDocumentos+')) AND');
      SQL.Append(' (D.CODDOCUMENTO !=ALL (SELECT CODDOCUMENTO FROM LOTEXDOCUM ');
      SQL.Append('                                  WHERE FLGBAIXA IS NULL OR FLGBAIXA = ''N'')) AND ');
      SQL.Append(' (U.SALDO > 0  ) AND');
      SQL.Append(' (U.CODDOCUMENTO = D.CODDOCUMENTO)');
      SQL.Append(' ORDER BY P.NOME, D.DATAPROGRAMADA, D.NODOCUMENTO');
      Open;
    end;
  end;
  AdicionaPlanosPrevidenciarios;
end;

procedure TfrmPreparaEnvia.AbreQryPlanoxDocum(pDocumento: String);
var
  sSQL: string;
begin
  with qryPlanoxDocum do begin
    Close;
    Sql.Clear();
    Sql.Add('SELECT DISTINCT PC.NOME ' +
            '  FROM PLANPREV PP, PLANPREVCONTABIL PC, RATEIODOCUM R ' +
            ' WHERE PP.IDPLANOPREV = PC.IDPLANOPREVPREV AND ' +
            '       PC.IDPLANOPREV = R.IDPLANOPREV AND ' +
            '       R.CODDOCUMENTO =  ' + (pDocumento)  +
            ' UNION ' +
            'SELECT DISTINCT PC.NOME ' +
            '  FROM PLANPREVCONTABIL PC, RATEIODOCUM R ' +
            ' WHERE IDPLANOPREVPREV IS NULL AND ' +
            '       PC.IDPLANOPREV = R.IDPLANOPREV AND ' +
            '       R.CODDOCUMENTO = ' + (pDocumento));
    Open;
  end;
end;

//Helio - SOL Nº 253577/17460 PPM Nº 955546
function TfrmPreparaEnvia.ObtemIdPlanoprevContbContribPrevpart(pIdPessoa,
                                                               pIdPessJur,
                                                               pIdPlanoPrev,
                                                               pIdContribuicao,
                                                               pSeqProposta : Integer) : Integer;
var
     qryTemp : TWWQuery;
begin
        qryTemp := TWWQuery.Create(nil);
        qryTemp.DatabaseName := dtmBaseDados.dbBaseDados.DataBaseName;

        qryTemp.SQL.Text := ' SELECT IDPLANPREVCONTAB FROM CONTRIBPREVPARTP ' +#13+
                            ' WHERE IDPESSOA = '     + IntToStr(pIdPessoa) +#13+
                            ' AND IDPESSJUR = '      + IntToStr(pIdPessJur) +#13+
                            ' AND IDPLANOPREV = '    + IntToStr(pIdPlanoPrev) +#13+
                            ' AND IDCONTRIBUICAO = ' + IntToStr(pIdContribuicao) +#13+
                            ' AND SEQPROPOSTA = '    + IntToStr(pSeqProposta) + ' ';
        try
           qryTemp.Open;
           Result := qryTemp.FieldByName('IDPLANPREVCONTAB').AsInteger;
        except
           qryTemp.Close;
           FreeAndNil(qryTemp);
           raise;
        end;

        qryTemp.Close;
        FreeAndNil(qryTemp);
end;

end.
