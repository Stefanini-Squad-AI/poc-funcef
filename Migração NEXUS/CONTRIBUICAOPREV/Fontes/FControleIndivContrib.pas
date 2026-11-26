unit FControleIndivContrib;

// Alterações:
{
---------------------------------------------------------------------------------------------------
Alteração  : bbtnOkAlterador
Nº SIG.....: 89410
Data.......: 29/07/2019
Responsável: Taffarel Sevaybriker
Descrição..: Tratamento para FLGEVENTO vazio ocasionando erro na inserção de alterador.
---------------------------------------------------------------------------------------------------
Alteração  : FControleIndivContrib (.dfm), AbreQryContribuicao, AbreQryContribuicaoPendente
Nº SIG.....: 72382
Data.......: 02/08/2018
Responsável: Taffarel Sevaybriker
Descrição..: Incluído o campo SALCONTRIB da tabela HSTCONTRIBPREV no grid dbrgdContribuicao
---------------------------------------------------------------------------------------------------
Alteração  : AbreQryContribuicaoPendente
Nº SIG.....: 60728
Data.......: 17/01/2018
Responsável: Andre Imakawa
Descrição..: Correção para trazer registros da pessoa correta, quando ele é Titular e Pensionista
             ao mesmo tempo
---------------------------------------------------------------------------------------------------
Alteração  : PreencheDadosTitular
Nº SOL.....: 253577-17744
KTN / PPM  : 1063636
Data       : 12/01/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - inadimplencia
---------------------------------------------------------------------------------------------------
Pendência   : SOL 253577/18104 PPM 1283984
Responsável : Helio Lima Custodio
Data        : 11/02/2016
Descrição   : Correção para apresentar os cancelados.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 253577/17461 PPM 955564
Responsável : Helio Lima Custodio
Data        : 27/07/2015
DFM         : Alteração no MontaSelect e no cabeçalho
Descrição   : Ajustar contribuições para que na integração seja utilizado o plano contábil.
---------------------------------------------------------------------------------------------------
SOL         : 253577/17460
PPM         : 955546
Responsável : Helio Lima Custodio
Data        : 14/07/2015
Descrição   : Ajustar contribuições para que na integração seja utilizado o plano contábil.
---------------------------------------------------------------------------------------------------
// SOL162126*RE01
Pendência   : SOL 162126*RE01 KINTANA 792563
Responsável : Higor Nayde
Data        : 25/05/2015
Descrição   : Criação do campo Plano Contabil
---------------------------------------------------------------------------------------------------
Pendência   : SOL 199846 KINTANA 1923897
Responsável : Otacilio Aquino
Data        : 30/01/2013
Descrição   : Ajuste na opção do campo alterador para permanecer habilitado.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 86498 KINTANA
Responsável : BRUNO AZEVEDO
Data        : 13/04/2012
Descrição   : Ajustes no tratamento de divergências.
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
Autor(a)    : Wylliam Leite da Silva
Data        : 30/03/2012
Pendência   : SOL 176483  KITANA 1614052
Descricao   : Foi criada a variavel sDataPai
---------------------------------------------------------------------------------------------------
Autor(a)    : Vinicius Ferreira
Data        : 15/08/2011
Pendência   : SOL 160427 KITANA 1348415
Descricao   : Adcionar campo "Ano/Mês Referência" para filtro
{---------------------------------------------------------------------------------------------------
Autor(a)    : Daniel Begnami
Data        : 26/05/2010
Pendência   : SOL 84396 Kintana 525357
Descricao   : Implementação do Botaão sair desfazendo a transação e cancelando o envio no momento da mensagem
              de observação.
----------------------------------------------------------------------------------------------------
Autor(a)    : Renato Visoni
Pendência   : SOL 135980 Kintana 810287
Descricao   : Desabilitar a opção RETIRAR VALOR DEVOLVIDO DA RESERVA e deixar o 'Não' como Default.
----------------------------------------------------------------------------------------------------
Autor(a)    : Renato Visoni
Data        : 15/01/2010
Pendência   : SOL 129740 Kintana 714381
Descricao   : Ao Rodar 2 matriculas seguidas o sistema estava misturando os documentos filhos.
----------------------------------------------------------------------------------------------------
Autor(a)    : Renato Visoni
Data        : 15/01/2010
Pendência   : SOL 129675 Kintana 713813
Descricao   : Ao Desfazer o envio, o sistema nao estava limpando os documentos a pagar e receber do PGA.
----------------------------------------------------------------------------------------------------
Autor(a)    : Renato Visoni
Data        : 12/01/2010
Pendência   : SOL 129342  Kintana 710473
Descricao   :  Implantação referente ao PGA para envio das contribuições pelo
  botão "Enviar" localizado na tela de "Controle Individual de Contribuição".
----------------------------------------------------------------------------------------------------
// Autor(a)       : Jéssica Lana Nunes dos Santos
// Data           : 05/03/2009
// Pendência      : SOL 109421 KINTANA 496332
// Descricao      : Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
Autor     :
Rotina    :
Data      :
Pendencia :
Alteração :
----------------------------------------------------------------------------------------------------
Autor     : Daniel Begnami
Rotina    : -
Data      : 16/01/2008
Pendencia : SOL:104817 / KT:476992
Alteração : Não está sendo substituido valores NULOS pelo valor "0" (zero), além disso a coluna ALTERADOR está retornando com valores negativos por desconsiderar a DEVOLUÇÃO.
----------------------------------------------------------------------------------------------------
Autor     : Claudio Faria
Rotina    : -
Data      : 07/06/2008
Pendencia : 26613 (reabertura)
Alteração : Tirar criticas da devolução
----------------------------------------------------------------------------------------------------
ID        : CPREV_001
Autor     : André Pontes
Rotina    : tbButonDevolverClick(...), combo "Situação" (cmbSituacao),
            AbreQryContribuicao(...), FormShow
Data      : 16/06/2008
Pendencia : 26613 (reabertura)
Alteração : 1) Restrição também à operação de "Devolver" se o documento de CaP/CaR estiver enviado
               ou baixado
            2) Filtro pelo FlgDevolução em todos os itens da combo, de acordo com a situação
            3) 2 nova linhas na combo, para filtrar apenas cobrança ou devoluções, independente da
               situação
            4) Antes de abrir a query de contribuições, verificar se a query principal (qryTitular)
               está ativa
            5) cmbSituação ponteirada para a primeira linha no FormShow
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Rotina    : AbreQryContribuicao
Data      : 28/02/2008
Pendencia : 26613 (reabertura)
Alteração : Correção da qryContribuicao, que é sobrescrita em código
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Rotina    : tbButtonCancelarClick(...)
Data      : 28/12/2007
Pendencia : 26613 
Alteração : Alterações na ordem das colunas na grid para evidenciar devoluções, mais restrições a 
            desfazer através de verificação da situação dos documentos 
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : tbButtonAlterarClick
Data      : 27/07/2007
Pendencia : 25974
Alteração : Inclusão de crítica para proibir alteração de registro recebido ou enviado para a
            folha/contas a receber.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : tbButtonAlterarClick, tbButonDevolverClick e ProcessaDevolucao
Data      : 29/03/2007
Pendencia : 24936
Alteração : Inclusão de parâmetro para processar a retirada da reserva da contribuição devolvida.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : AbreQryContribuicao e AbreQryQuebraDoc
Data      : 13/09/2006
Pendencia : 23302
Alteração : Alteração nas queries para correta visualização das contribuições de devolução
----------------------------------------------------------------------------------------------------
utor(a)   : Gleyber
ata       : 05/09/2006
endencia  : 23243
otina     : bbtnOkAlteradorClick
lteração  : Atribuição do valor default para Unidades de Negócios (UNIDNEGOC) que possuiam antes o
            valor -1.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : tbButtonAlterarClick
Data      : 04/09/2006
Pendencia : 23235
Alteração : Mudança da rotina para dentro do botão alterar a fim de permitir a operação DEVOLVER.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : AbreQryQuebraDoc
Data      : 22/08/2006
Pendencia : 23192
Alteração : Acerto na inclusão de parâmetro na função.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : AbreQryContribuicao e AbreQryQuebraDoc
Data      : 22/08/2006
Pendencia : 23018
Alteração : Acerto na consulta para visualizar corretamente alteradores antes de realizar o envio.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : dbgrdContribuicaoFieldChanged
Data      : 14/08/2006
Pendencia : 23069
Alteração : Não permitir alteração de contribuições já recebidas.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : dbgrdContribuicaoFieldChanged
Data      : 14/08/2006
Pendencia : 23069
Alteração : Não permitir alteração de contribuições já recebidas.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : AbreQryQuebraDoc e tbButtonEnviarClick
Data      : 03/08/2006
Pendencia : 22920
Alteração : Inversão dos sinais na alteração anterior.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : AbreQryQuebraDoc e tbButtonEnviarClick
Data      : 27/07/2006
Pendencia : 22920
Alteração : Acerto na consideração do TIPOALTERADOR.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : AbreQryContribuicao
Data      : 31/05/2006
Pendencia : 22224
Alteração : Acerto na visualização de contribuições levando em consideração os alteradores
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : tbButtonEnviarClick
Data      : 01/06/2006
Pendencia : 22018
Alteração : Acerto no tratamento de mantidos ao fazer o envio de contribuições do participante
            e patronais
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : AbreQryContribuicao
Data      : 23/05/2006
Pendencia : 22153
Alteração : Acerto na visualização de contribuições já pagas.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : bbtnOKDesfazerClick
Data      : 18/05/2006
Pendencia : 22145
Alteração : Alteração no Update da HSTCONTRIBPREV para não considerar mais o mes de referência.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : tbButtonEnviarClick
Data      : 12/05/2006
Pendencia : 22145
Alteração : Alteração na rotina de envio para fazer devolução para patrocinadora.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : AbreQryContribuicao e AbreQryContribuicao
Data      : 04/05/2006
Pendencia : 22153
Alteração : Mudança de label de "Atrasada e não paga" para "Atrasada e já tratada".
            Mudança na visualização de contribuições já pagas.
------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : tbButtonCancelarClick
Data      : 08/03/2006
Pendencia : 21652
Alteração : verificar se o documento já foi enviado ao banco,caso sim, não deixar desfazer
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : tbButtonEnviarClick
Data      : 22/02/2006
Pendencia : 21614
Alteração : buscar o CODPORTFORMA na CONTPLANPATRO e CONTPREV para envio de contribuições para banco
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : AbreQryContribuicao
Data      : 02/02/2006
Pendencia : 21188
Alteração : Acerto. Retirei sinal negativo no segundo NVL(HA.VALORRECEBIDO,0).Eu havia colocado no primeiro e esqueci de retrirar do segundo.
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : tbButtonEnviarClick
Data      : 23/01/2006
Pendencia : 20769 - 20788 - 20940
Alteração : verifica se dentro do mês de cobrança existem vários meses de referência.
            Caso não exista, nem pergunta se deseja agrupar, apenas agrupa todos em um só documento.
            Caso exista, pergunta e continua o tratamento.
------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : tbButtonEnviarClick
Data      : 20/01/2006
Pendencia : 20769 - 20788 - 20940
Alteração : (1)Troquei o teste que verifica se o documento tem recpag R ou P para o while acima.
            (2)Caso o documento seja aberto, apurar RECPAG individual
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : AbreQryContribuicao
Data      : 17/01/2006
Pendencia : 21188
Alteração : acertei resolução da pendência, logo abaixo.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : tbButtonEnviarClick
Data      : 13/01/2006
Pendencia : 20769
Alteração : Retirado o comentário que inibia a atribuição à variável cRecPag.
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : AbreQryContribuicao
Data      : 09/01/2006
Pendencia : 21188
Alteração : Inversão dos sinais do campo VALOR da HSTATRASOCONTRIB.
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : tbButtonEnviarClick
Data      : 03/01/2006 - 06/01/2006
Pendencia : 20783
Alteração : definição do RECPAG para cada documento
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : AbreQryContribuicao , AbreQryQuebraDoc
Data      : 05/01/2006
Pendencia : 21188
Alteração : coloquei ABS no campo de somatórios de alterador para, caso o valor dos alterador de
            devolução seja maior que os de cobrança, não apareça o valor negativo na tela
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : tbButtonEnviarClick
Data      : 03/01/2006
Pendencia : 20769 - 20788 - 20940
Alteração : alteração do envio de altertador. Mudança da posição da chamada para após a descarrega
            documentos, quando já temos o número.
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : AbreQryQuebraDoc
Pendência : 20769 - 20788 - 20940
Data      : 29/12/2005
Descricao : criação da função para alimentar qry apenas com registros para envio, já ordenados
            por mês de cobrança e referência para
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : tbButtonEnviarClick
Pendência : 20769 - 20788 - 20940
Data      : 29/12/2005
Descricao : mudei de flgdevoluicao para flgselecionado, para verificar se mais de uma contribuição
            foi selecionada
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : tbButtonEnviarClick
Pendência : 20769 - 20788 - 20940
Data      : 28/12/2005 - 29/12/2005
Descricao : Modificação geral da função para tratar documentos por grupos de pessoas e utilizar a
            função DescarregaDocumentos como padrão para integração.
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : AbreQryContribuicao
Pendência : 20769 - 20788 - 20940
Data      : 26/12/2005
Descricao : inclusão do campo NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR) IDPESSJURCEDIDO, para tratamento
            padrão de integração financeira.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : tbButtonEnviarClick e bbtnOkAlteradorClick
Pendência : 20738
Data      : 30/11/2005
Descricao : Alterações na chamada das funções EnviaAlteradorBANCO e GeraAlteradorBANCO
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : AbreQryContribuicao
Data      : 08/11/2005
Pendência : 20360
Alteração : Adequação da tela para trabalhar com alteradores de devolução.
----------------------------------------------------------------------------------------------------
Autor     : Bruno Bastos
Rotina    : ProcessaDevolucao / ProcessaEstorno
Data      : 06/09/2005
Pendência : 19569
Alteração : Desfazer a alteração feita anteriormente.
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : ProcessaDevolucao
Data      : 18/08/2005
Pendência : 20006
Alteração : alteração para pegar a DATARECEBIMENTO correta da HSTCONTRIBPREV
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : tbButtonEnviarClick
Data      : 04/08/2005
Pendência : 19881
Alteração : alteração da modificação feita em 05012005 parra possibilitar a geração de doc. abetor ou não por mês
----------------------------------------------------------------------------------------------------
Autor     : Bruno Bastos
Data      : 18/07/2005
Pendência : 19749
Descrição : Buscar contribuições que calculam reserva
----------------------------------------------------------------------------------------------------
Autor     : Bruno Bastos
Rotina    : Várias
Data      : 30/06/2005
Pendência : 19569
Descrição : Buscar a data correta para fazer o estorno e devolução.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : qryDocumentos
Data      : 27/06/2005
Pendência : 19555
Descrição : Inclusão na query virtual do campo IDPESSJURCEDIDO.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : AbreQryContribuicao, pmmVisualisaDivergTratadasClick
Data      : 30/05/2005
Pendência : 17843
Alteração : Criação do filtro para visualizar ou não as contribuições com divergências já tratadas.
----------------------------------------------------------------------------------------------------
Autor     : Leo
Data      : 16/05/2005
Descrição : alteração da qrydocumentos e updDocumentos para inclusão do campo IDPESSJURCEDIDO
----------------------------------------------------------------------------------------------------
Autor     : Leo
Data      : 19/04/2005
Descrição : alteração da qrydocumentos e updDocumentos para inclusão dos campos RECPAG e
            IDPLANPREVCONTAB
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : PreencheDadosTitular
Data      : 10/03/2005
Pendência : 18418 / 18740
Descrição : Alterado o order by da qryContribuicao para:
            ORDER BY HST.MESCOBRANCA DESC, HST.MESREFERENCIA
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : bbtnOKDesfazerClick
Data      : 05/02/2005
Pendência : 18741
Descrição : Executar o update na documento apenas para quando FLGDESCFOLHA for igual a "0"
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : bbtnOKDesfazerClick
Data      : 05/02/2005
Pendência : 18636
Descrição : Realizar um update no campo EMISBLOQ na tabela DOCUMENTO para o valor 'N' a fim de
            permitir o estorno de documentos.
----------------------------------------------------------------------------------------------------
Autor     : Augusto
Rotina    : bbtnOKDesfazerClick
Data      : 02/02/2005
Pendencia : 18354
Descrição : Sempre cancelar o processo caso tenha ocorrido algum erro
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : qryQuebraDoc
Data      : 18/01/2005
Descrição : troquei o valor do PLNCODIGO de -1 para 0, pois para criação de novas planilhas, o valor
            deve ser passado como zero com o valor em -1 da erro
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : tbButtonEnviarClick
Data      : 05/01/2005
Descrição : inclusão de caixa de diálogo e tratamento para possibilitar a escolha do agrupamento de
            documentos, no envio. O usuário pode escolher o agrupamento por MESREFERENCIA ou fazer
            lançamentos de vários meses em um só documento.
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : ProcessaDevolucao
Data      : 26/11/2004
Pendência : 18173
Descrição : Acertado a ordem dos parâmetros da função AbateContribReserva
----------------------------------------------------------------------------------------------------
Rotina    : AbreQryContribuicao
Autor(a)  : Camille
Data      : 08.11.2004
Pendência : 17312
Descricao : Acrescimo do campo PARCELA
----------------------------------------------------------------------------------------------------
Rotina    : EnviaAlteradorBANCO
Autor(a)  : Camille
Data      : 28.10.2004
Pendência : -----
Descricao : Acerto na chamada as rotinas de integração com back 3 camadas
----------------------------------------------------------------------------------------------------
Rotina    : Diversas
Autor(a)  : Camille
Data      : 08.10.2004
Pendência : 17551
Descricao : Substituicao das units do back pelas de 3 camadas :
                   U D o c u m e n t o    -> U C t r l D o c u m e n t o
                   U L a n c C o n t a b  -> U C t r l L a n c a m e nt o
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : -----
Data      : 22.09.2004
Pendência : -----
Descrição : Acertar preenchimento do combo Forma de Cobranca e gravar LOGTOTALPREV
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : Desfazer
Data      : 22.07.2004
Pendência : -----
Descrição : Alteração na busca de documentos contabilizados juntos
----------------------------------------------------------------------------------------------------
Autor     : Augusto
Rotina    : ProcessaDevolucao
Data      : 21.07.2004
Pendência : -----
Descrição : Alteração na ordem dos parametros
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : -----
Data      : 20.07.2004
Pendência : -----
Descrição : Se a contribuicao já estiver recebida, não tentar baixar
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : -----
Data      : 07.07.2004
Pendência : 17155
Descrição : Gerar RAD na inclusao de documentos
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : Enviar e desfazer
Data      : 09.07.2004
Pendência : 17176
Descrição : Criação da tabela CONTABCONTFUND para gravar a planilha de contabilizacao das
            contribuicoes patronais quando a patro é a propria fundacao, pois nesses casos não há
            lancamento de documentos
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : -----
Data      : 08.07.2004
Pendência : 17176
Descrição : Não obrigar integracao contabil em todos os casos mas apenas para os casos de
            contabilizacao no envio
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : ----
Data      : 07.07.2004
Pendência : 17166
Descrição : Exibir soma dos alteradores na tela principal
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : ----
Data      : 02.07.2004
Pendência : 16635
Descrição : Não permitir exclusão de documento agrupado
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : BaixaContribCAR
Data      : 30.06.2004
Pendência : 17112
Descrição : Não impedir que continue se der erro em uma matricula
            ATENÇÃO :  ALTEREI A ROTINA PARA NÃO FAZER MAIS O LOOP NA
                       QRYCONTRIB. O LOOP  DEVE  SER  FEITO NA ROTINA
                       CHAMADORA.
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : tbButtonEnviarClick
Pendencia : 16955
Data      : 16.06.2004
Descrição : O sistema estava contabilizando o valor apenas da 1a. contribuicao
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : tbButtonEnviarClick
Pendencia : 16562
Data      : 13.04.2004
Descrição : Controle de quebra de documentos
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : VefificaContabMantido
Data      : 31.03.2004
Descrição : - Alteração do nome da rotina para VerificaContabMantidoNoEnvio
            - Alteracao do nome da variavel bContabiliza para bContabilizaNOEnvio
            - Padronizacao do critério de teste da variavel bContabiliza, que em algumas rotinas
              testava se contabilizava no envio e em outras no recebimento
----------------------------------------------------------------------------------------------------
Rotina    : ProcessaDevolucao
Autor(a)  : Leo
Data      : 03.03.2004
Alteração : Atualização das informações da tela após o envio
----------------------------------------------------------------------------------------------------
Rotina    : ProcessaDevolucao
Autor(a)  : Leo
Data      : 03.03.2004
Alteração : Uso do mesmo motivo que gerou o histórico, para os alteradores
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 17.02.2004
Alteração : Acerto da atualização dos registros no cancelamento
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 23.06.2003
Alteração : Inclusao do Filtro de MULTI-FUNDACAO
----------------------------------------------------------------------------------------------------
Rotina    : Cancelamento
Autor(a)  : Camille
Data      : 10.03.2003
Alteração : Alterar o IDMOTIVO para poder reenviar
----------------------------------------------------------------------------------------------------
Rotina    : ProcessaEstorno
Autor(a)  : Gleyber
Data      : 11/02/2003
Alteração : Correção no Update na HstContribPrev
----------------------------------------------------------------------------------------------------
Rotina    :
Autor(a)  : Gleyber
Data      : 19/11/2002
Alteração : Criação de filtros para visualização no grid
----------------------------------------------------------------------------------------------------
Rotina    : Cancelamento de Contribuicoes
Autor(a)  : Augusto
Data      : 19/11/2002
Alteração : Caso contabilização de Mantido seja feita no Recebimento não pode Cancelar.
----------------------------------------------------------------------------------------------------
Rotina    : tbButtonEnviarClick
Autor(a)  : Leo
Data      : 14.11.2002
Alteração : tratamento da marcação de contabilização no envio/recebimento para cobraça bancária de
            mantidos (VerificaContabMantidoNoEnvio)
----------------------------------------------------------------------------------------------------
Rotina    : AbateContribReserva
Autor(a)  : Leo
Data      : 03/10/2002
Alteração : alterei o parâmetro psDataAlimentacao onde era passado a DATARECEBIMENTO, agora passoa
            DATAPREVISAORECE
----------------------------------------------------------------------------------------------------
Rotina    : qryTipoAlterador
Autor(a)  : Leo  - leocm
Data      : 09/09/2002
Alteração : novo parâmetro RECPAG e seu tratamento
----------------------------------------------------------------------------------------------------
Rotina    : alteradores
Autor(a)  : Leo
Data      : 28/06/2002
Alteração : tratamento da qrytipoalterador para considerar apenas alteradores de determinada
            contribuição
----------------------------------------------------------------------------------------------------
Rotina    : alteradores
Autor(a)  : Leo
Data      : 17/06/2002
Alteração : alterei os JOINS das quaries que tratam alteradores para somente faze-lo através do
            NUMRECEBIMENTO, por que os alteradores
----------------------------------------------------------------------------------------------------
Rotina    : qrydocumentos
Autor(a)  : Leo
Data      : 13/06/2002
Alteração : incluí o flgdevolucao
----------------------------------------------------------------------------------------------------
Rotina    : GERAL
Autor(a)  : Leo
Data      : 13/06/2002
Alteração : modificações para inserção e alteração de alteradores após
            o envio do documento
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid, TB97Ctls, ComCtrls,  Spin,
  wwdblook, Menus, DBCtrls, Mask, wwdbedit, wwdbdatetimepicker,
  CMDateTimePicker, TEdNum, UConsPart, UCtrlDocumento, UCtrlLancamento;

type
  TfrmControleIndivContrib = class(TfrmOkCancelar)
    pmlParticipante: TPanel;
    stxtProcesso: TStaticText;
    MontaSelectPart: TMontaSelect;
    pnlContribuicoes: TPanel;
    pnlOperacoes: TPanel;
    qryTitular: TwwQuery;
    qryContaBancaria: TwwQuery;
    qryAux: TwwQuery;
    qrySalarios: TwwQuery;
    dsSalAux: TwwDataSource;
    qryContribuicao: TwwQuery;
    dsContribuicao: TwwDataSource;
    updContribuicao: TUpdateSQL;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    tbButtonCancelar: TToolbarButton97;
    ToolbarSep978: TToolbarSep97;
    ToolbarSep9711: TToolbarSep97;
    tbButtonEnviar: TToolbarButton97;
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
    Splitter1: TSplitter;
    tbButtonAlterar: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    qryAux2: TwwQuery;
    pgctrlCobrancas: TPageControl;
    tbsGrid: TTabSheet;
    tbsResult: TTabSheet;
    dbgrdContribuicao: TwwDBGrid;
    memResult: TMemo;
    tbsAlterar: TTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    lblData: TLabel;
    dtPrevista: TCMDateTimePicker;
    edValorPrev: TEditNum;
    lblContrib: TLabel;
    Panel1: TPanel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    rgrpDescBanco: TRadioGroup;
    grpPortForma: TGroupBox;
    qryForma: TwwQuery;
    dblkpcmbPortForma: TwwDBLookupCombo;
    tbsAlteradores: TTabSheet;
    qryAlteradores: TwwQuery;
    dsAlteradores: TwwDataSource;
    wwDBGrid1: TwwDBGrid;
    lblContrib2: TLabel;
    pmnuAlteradores: TPopupMenu;
    Excluir1: TMenuItem;
    Inserir1: TMenuItem;
    Alterar1: TMenuItem;
    N1: TMenuItem;
    pnlAlteradores: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    qryTipoAlterador: TwwQuery;
    Panel3: TPanel;
    bbtnOkAlterador: TBitBtn;
    bbtnCancelaAlterador: TBitBtn;
    dblkpcmbTipoAlterador: TwwDBLookupCombo;
    edValorAlterador: TEditNum;
    rgrpTipoAlterador: TRadioGroup;
    tbsMotivo: TTabSheet;
    Panel4: TPanel;
    Label5: TLabel;
    edMotivo: TEdit;
    bbtnOKDesfazer: TBitBtn;
    bbtnCancelMotivo: TBitBtn;
    tbButonEstornar: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    qryContabilIDPESSJUR: TFloatField;
    qryContabilIDPLANOPREV: TFloatField;
    tbButonDevolver: TToolbarButton97;
    ToolbarSep974: TToolbarSep97;
    qryContribuicaoFLGSELECIONADO: TFloatField;
    qryContribuicaoNODOCUMENTO: TFloatField;
    qryContribuicaoNOSSONUMERO: TStringField;
    qryContribuicaoNOMERESUM: TStringField;
    qryContribuicaoNOME: TStringField;
    qryContribuicaoMESREFERENCIA: TStringField;
    qryContribuicaoMESCOBRANCA: TStringField;
    qryContribuicaoDATAPREVISAORECE: TDateTimeField;
    qryContribuicaoVALORESPERADO: TFloatField;
    qryContribuicaoVALORRECEBIDO: TFloatField;
    qryContribuicaoSITRECEBIMENTO: TStringField;
    qryContribuicaoIDLOTE: TFloatField;
    qryContribuicaoNUMRECEBIMENTO: TFloatField;
    qryContribuicaoIDMOTIVO: TFloatField;
    qryContribuicaoDATARECEBIMENTO: TDateTimeField;
    qryContribuicaoCODPORTFORMA: TFloatField;
    qryContribuicaoVALOROP1: TFloatField;
    qryContribuicaoVALOROP2: TFloatField;
    qryContribuicaoVALOROP3: TFloatField;
    qryContribuicaoCODDOCUMENTOPREV: TFloatField;
    qryContribuicaoVALORCALCULADO: TFloatField;
    qryContribuicaoFLGDESCFOLHA: TFloatField;
    qryContribuicaoIDCONTRIBUICAO: TFloatField;
    qryContribuicaoIDPESSJUR: TFloatField;
    qryContribuicaoIDPLANOPREV: TFloatField;
    qryContribuicaoIDPESSOA: TFloatField;
    qryContribuicaoSEQPROPOSTA: TFloatField;
    qryContribuicaoDATAINICIO: TDateTimeField;
    qryContribuicaoDATAFINAL: TDateTimeField;
    qryContribuicaoFLGSITFUNDACAO: TStringField;
    qryContribuicaoFLGEVENTO: TFloatField;
    qryContribuicaoDATACANCELAMENTO: TDateTimeField;
    qryContribuicaoDATAEMISSCOB: TDateTimeField;
    qryContribuicaoFLGCALCRESERVA: TFloatField;
    qryContribuicaoMATRICULA: TStringField;
    qryContribuicaoFLGPAGADOR: TStringField;
    qryContribuicaoINSCRICAONUMERO: TFloatField;
    qryContribuicaoFLGDESCFOLHA_1: TFloatField;
    qryContribuicaoDIAVENCIMENTO: TFloatField;
    qryContribuicaoPLANO: TFloatField;
    qryContribuicaoPLACONTAC: TStringField;
    qryContribuicaoPLACONTAD: TStringField;
    qryContribuicaoNOMECONTRIB: TStringField;
    qryContribuicaoSALMANTIDO: TFloatField;
    qryContribuicaoFLGDEVOLUCAO: TFloatField;
    qryContribuicaoDATAINICIO_1: TDateTimeField;
    qryContribuicaoIDEMPRESA: TFloatField;
    qryContribuicaoPLANO_1: TFloatField;
    qryContribuicaoTIPCODIGO: TStringField;
    qryContribuicaoCODTIPDOC: TFloatField;
    qryContribuicaoPLANO13: TFloatField;
    qryContribuicaoPLACONTAC13: TStringField;
    qryContribuicaoPLACONTAD13: TStringField;
    qryContribuicaoCODCENTROCUSTOC13: TStringField;
    qryContribuicaoIDEMPRESA13: TFloatField;
    qryContribuicaoCODCENTROCUSTOD13: TStringField;
    qryContribuicaoUNIDNEGOC13: TFloatField;
    qryContribuicaoIDEMPRESAPROP13: TFloatField;
    qryContribuicaoCODCENTRORESPON13: TStringField;
    qryContribuicaoCODSUBCONTA13: TFloatField;
    qryContribuicaoRECPAG13: TStringField;
    qryContribuicaoCODTIPRECDES13: TStringField;
    qryContribuicaoTIPCODIGO13: TStringField;
    qryContribuicaoCODTIPDOC13: TFloatField;
    qryContribuicaoCODPORTFORMA13: TFloatField;
    qryContribuicaoIDPLANPREVCONTAB: TFloatField;
    qryContribuicaoPLACONTADBANCO: TStringField;
    qryContribuicaoPLACONTADBANCO13: TStringField;
    qryContribuicaoSALMANTIDO_1: TFloatField;
    qryContribuicaoFLGDEVOLUCAO_1: TFloatField;
    qryContribuicaoDATAINICIO_2: TDateTimeField;
    qryContribuicaoNOMESITUACAO: TStringField;
    qryContribuicaoIDREGRACALCULO: TFloatField;
    qryContribuicaoFLGINTERNO: TStringField;
    qryContribuicaoCODCENTROCUSTOC: TStringField;
    qryContribuicaoCODCENTROCUSTOD: TStringField;
    qryContribuicaoCODSUBCONTA: TFloatField;
    qryContribuicaoCODTIPRECDES: TStringField;
    qryContribuicaoCODCENTRORESPON: TStringField;
    qryContribuicaoUNIDNEGOC: TFloatField;
    qrySalAux: TwwQuery;
    UpdateSalAux: TUpdateSQL;
    qrySalariosMES: TStringField;
    qrySalariosMESCOBRANCA: TStringField;
    qrySalariosVALORPROVENTO: TFloatField;
    wwDataSource1: TwwDataSource;
    qrySalAuxMES: TStringField;
    qrySalAuxMESCOBRANCA: TStringField;
    qrySalAuxVALORPROVENTO: TStringField;
    qryContribuicaoTipoPgmto: TStringField;
    qryContribuicaoCODTIPDESEMBDEVOL: TStringField;
    qryContribuicaoCODCCUSTODEVOL: TStringField;
    qryContribuicaoPLACONTADEVOL: TStringField;
    pmnuFiltro: TPopupMenu;
    Visualizar1: TMenuItem;
    pmnNaoCanceladas: TMenuItem;
    pmnSomenteCanceladas: TMenuItem;
    pmnTodas: TMenuItem;
    N2: TMenuItem;
    Visualizarcontribuio1: TMenuItem;
    pmnTodasContrib: TMenuItem;
    pmnDoParticipante: TMenuItem;
    pmnDaPatro: TMenuItem;
    qryMotivo: TwwQuery;
    Label2: TLabel;
    dblkpcmbMotivoCancel: TwwDBLookupCombo;
    Panel7: TPanel;
    ConsPart1: TConsPart;
    bbtnProcurar: TBitBtn;
    Label11: TLabel;
    Panel2: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    cmbSituacao: TComboBox;
    meAnoMesCobranca: TMaskEdit;
    bbtnFiltro: TBitBtn;
    qryQuebraDoc: TwwQuery;
    updQuebraDoc: TUpdateSQL;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    lblParticipante: TLabel;
    lblPatrocinadora: TLabel;
    lblMatricula: TLabel;
    lblPlano: TLabel;
    lblSituacao: TLabel;
    qryContribuicaoSOMAALTERADORES: TFloatField;
    qryContribuicaoTOTALESPERADO: TFloatField;
    qryContribuicaoTOTALRECEBIDO: TFloatField;
    qryContribuicaoALTERADORESRECEB: TFloatField;
    Panel5: TPanel;
    bbtnSalvar: TBitBtn;
    SaveDlg: TSaveDialog;
    qryContribuicaoPARCELA: TFloatField;
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
    pmmVisualisaDivergTratadas: TMenuItem;
    N3: TMenuItem;
    qryReserva: TwwQuery;
    qryReservaxPlano: TwwQuery;
    qryContribuicaoIDPESSJURCEDIDO: TFloatField;
    rgrpRetiraReserva: TRadioGroup;
    qryContribuicaoVALORBASE1: TFloatField;
    meAnoMesReferencia: TMaskEdit;
    Label6: TLabel;
    qryContribuicaoNOMEPLANO: TStringField;
    qryPendente: TwwQuery;
    updPendente: TUpdateSQL;
    Label7: TLabel;
    lblTitular: TLabel;
    Label8: TLabel;
    lblMatriculaTitular: TLabel;
    Label9: TLabel;
    lblSituacaoTitPatro: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    lblSituacaoTitPlano: TLabel;
    qryContribuicaoSALCONTRIB: TFloatField;  //Taffarel - SIG72382

    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnSalariosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbButtonEnviarClick(Sender: TObject);
    procedure tbButtonAlterarClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure rgrpDescBancoClick(Sender: TObject);
    procedure tbButtonCancelarClick(Sender: TObject);
    procedure pgctrlCobrancasChange(Sender: TObject);
    procedure qryContribuicaoCalcFields(DataSet: TDataSet);
    procedure Excluir1Click(Sender: TObject);
    procedure Inserir1Click(Sender: TObject);
    procedure bbtnOkAlteradorClick(Sender: TObject);
    procedure bbtnCancelaAlteradorClick(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure bbtnOKDesfazerClick(Sender: TObject);
    procedure bbtnCancelMotivoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdContribuicaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure tbButonDevolverClick(Sender: TObject);
    procedure tbButonEstornarClick(Sender: TObject);
    procedure rgrpTipoAlteradorClick(Sender: TObject);
    procedure pmnTodasClick(Sender: TObject);
    procedure pmnNaoCanceladasClick(Sender: TObject);
    procedure pmnSomenteCanceladasClick(Sender: TObject);
    procedure pmnTodasContribClick(Sender: TObject);
    procedure pmnDoParticipanteClick(Sender: TObject);
    procedure pmnDaPatroClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure dbgrdContribuicaoTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure bbtnFiltroClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure pmmVisualisaDivergTratadasClick(Sender: TObject);
    procedure MontaSelectPartBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);


  private // Private declarations

    CtrlDocumento           : TCtrlDocumento;
    CtrlLancamento          : TCtrlLancamento;
    sSqlContribuicao        : String;
    function titularTemMaisDe3InadConsecutivas: Boolean; //Helio - SOL Nº 253577/17744 PPM Nº 1063636

    //Inicio - Helio - SOL Nº 253577/17461 PPM Nº 955564
    procedure AbreQryContribuicaoPendente( psOrdem : string );
    procedure AbreQryQuebraDocDependente(psNumRecebimento: string);
    //Fim - SOL Nº 253577/17461 PPM Nº 955564

  public  // Public declarations

    sTipOperEnvio : String;
    bAbriuOutroForm : boolean;
    cOperacao,
    cOperacaoAlterador   : char;
    sOrdemFiltro        : string;



    procedure PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta,
                                   pIdPessoa : longInt); //Helio - SOL Nº 253577/17461 PPM Nº 955564
    procedure LimpaTela;
    procedure ProcessaAlteracao;
    procedure ProcessaDevolucao;
    procedure ProcessaEstorno;
    function TestaFiltro : String;
    procedure AbreQryContribuicao( psOrdem : string );
    procedure AbreQryQuebraDoc( psNumRecebimento : string );
    procedure PreparaQryColetiva(sFlgReservaUltCot, sIdPatro, sMesCob, sMesRef, sIdPessoa: String);
    Procedure MontaQueryReservaPlano(piIdPessJur, piIdPlanoPrev, piIdContribuicao, piIdPessoa: Integer; psMesCobranca: String);


  end;



var
  frmControleIndivContrib: TfrmControleIndivContrib;



implementation
{$R *.DFM}
uses
  FAguarde, UParticipante, FTelaAut, UMensErro, DBaseDados, UContribuicaoPrev, UAdmPrev, DAPrev,
  UMovReserva, USistema, UModulo, UIntegraBack;



procedure TfrmControleIndivContrib.LimpaTela;
begin
   pgctrlCobrancas.ActivePage := tbsGrid;
   tbsResult.TabVisible       := False;
   tbsAlterar.TabVisible      := False;
   tbsMotivo.TabVisible       := False;
   lblParticipante.Caption    := '';
   lblMatricula.Caption       := '';
   lblPatrocinadora.Caption   := '';
   lblPlano.Caption           := '';
   lblSituacao.Caption        := '';
   //Inicio - Helio - SOL Nº 253577/17461 PPM Nº 955564
   lblTitular.Caption          := '';
   lblMatriculaTitular.Caption := '';
   lblSituacaoTitPatro.Caption := '';
   lblSituacaoTitPlano.Caption := '';
   //Fim - Helio - SOL Nº 253577/17461 PPM Nº 955564
end;



procedure TfrmControleIndivContrib.PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta,
                                   pIdPessoa : longInt); //Helio - SOL Nº 253577/17461 PPM Nº 955564
var sValorReserva,
    sMsgErro      : string;
    bOk           : boolean;
    bAlgumAviso   : boolean;
    dValorPago    : Double;
    sUltDtBaixa   : string;              // edilaine - SOL 253577-17664 / PPM 1019932
    temMaisDe3InadConsecutivas : boolean; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
begin
  bOk := True; //Helio - SOL Nº 253577/17461 PPM Nº 955564
  qryTitular.Close;
  qryTitular.ParamByName('IdPessoa').Value   := piIdTitular;
  qryTitular.ParamByName('IdPessJur').Value   := piIdPessJur;
  qryTitular.ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
  qryTitular.ParamByName('SeqProposta').Value := piSeqProposta;
  qryTitular.Open;

  with qryContaBancaria do
  begin
     Close;
     ParamByName('IdPessoa').Value := piIdTitular;
     Open;
  end;

  // Baixar contribuicoes antes de exibir
  // A qryContrib deve ter os seguintes campos :
  //              ValorEsperado,   CodDocumentoPrev,
  //              NumRecebimento,  MesReferencia,
  //              MesCobranca,     IdMotivo

  frmAguarde.Mostra('Buscando Histórico de Contribuições ...');

  //Inicio - Helio - SOL Nº 253577/17461 PPM Nº 955564
  qryPendente.Close;
  qryPendente.Open;
  //Fim - Helio - SOL Nº 253577/17461 PPM Nº 955564

  if piIdTitular = pIdPessoa then //Helio - SOL Nº 253577/17461 PPM Nº 955564
       AbreQryContribuicao('')
  //Inicio - Helio - SOL Nº 253577/17461 PPM Nº 955564
  else begin
       qryPendente.Edit;
       qryPendente.FieldByName('IDPESSJUR').AsInteger := piIdPessJur;
       qryPendente.FieldByName('IDPLANOPREV').AsInteger := piIdPlanoPrev;
       qryPendente.FieldByName('SEQPROPOSTA').AsInteger := piSeqProposta;
       qryPendente.FieldByName('IDPESSOA').AsInteger := pIdPessoa;
       qryPendente.FieldByName('IDTITULAR').AsInteger := piIdTitular;
       qryPendente.Post;

       AbreQryContribuicaoPendente('');
  end;
  //Fim - Helio - SOL Nº 253577/17461 PPM Nº 955564

  qryContribuicao.DisableControls;

  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;
    
  memResult.Lines.Clear;
  memResult.Lines.Add('=================================================================================== ');
  memResult.Lines.Add('CONTROLE INDIVIDUAL DE CONTRIBUIÇÕES - DATA : '+DateToStr(date)                      );
  memResult.Lines.Add(' ');
  memResult.Lines.Add('MATRICULA : '+lblMatricula.Caption+' - PARTICIPANTE : '+lblParticipante.Caption);
  memResult.Lines.Add(' ');
  memResult.Lines.Add('ANÁLISE DA BAIXA DE CONTRIBUIÇÕES DO CONTAS A RECEBER ');
  memResult.Lines.Add('=================================================================================== ');

  bAlgumAviso := False;
  qryContribuicao.First;
  dValorPago := 0;
  temMaisDe3InadConsecutivas := titularTemMaisDe3InadConsecutivas; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
  while not qryContribuicao.Eof do
  begin
       // Se a contribuicao já estiver recebida, não tentar baixar
       if (qryContribuicao.FieldByName('SITRECEBIMENTO').AsInteger = 2) or
          (qryContribuicao.FieldByName('SITRECEBIMENTO').AsInteger = 3)
       then begin
          qryContribuicao.Next;
          continue;
       end;

       bOk := BaixaContribCAR( qryAux,
                               qryContribuicao.FieldByName('MESCOBRANCA').AsString,
                               qryContribuicao.FieldByName('MESREFERENCIA').AsString,
                               qryContribuicao.FieldByName('NUMRECEBIMENTO').AsInteger,
                               qryContribuicao.FieldByName('SITRECEBIMENTO').AsInteger,
                               qryContribuicao.FieldByName('CODDOCUMENTOPREV').AsInteger,
                               qryContribuicao.FieldByName('IDMOTIVO').AsInteger,
                               qryContribuicao.FieldByName('VALORESPERADO').AsFloat,
                               sMsgErro,
                               sUltDtBaixa,                                          // edilaine - SOL 253577-17744 / PPM 1063636
                               qryContribuicao.FieldByName('NOMERESUM').AsString,
                               );
       if not bOK
       then begin
          MsgDlg('O participante possui contribuições baixadas no Contas a Receber e não recebidas no AdmPrev. '+#13+
                 'Porém, ocorreu o seguinte erro no recebimento dessas contribuições : '+#13+
                 sMsgErro,'Erro',mtError,[mbOK],0);
          dtmBaseDados.dbBaseDados.RollBack;
          break;
       end;

       // edilaine - SOL 253577-17744 / PPM 1063636 - inicio
       if (sUltDtBaixa <> emptyStr) and
          (temMaisDe3InadConsecutivas) then
       begin
         try
            // ajusta data de retorno da inadimplencia
            bOk := AjustaEventoInadimplencia(qryAux,
                                            qryTitular.FieldByName('IdPessoa').AsInteger,
                                            sMsgErro,
                                            sUltDtBaixa);

            if not bOk then
            begin
               MsgDlg('O participante possui contribuições baixadas no Contas a Receber e não recebidas no AdmPrev. '+#13+
                      'Porém, ocorreu o seguinte erro na atualização da inadimplência : '+#13+
                      sMsgErro,'Erro',mtError,[mbOK],0);
               dtmBaseDados.dbBaseDados.RollBack;
            end;

            if Trim(sMsgErro) <> '' then
            begin
               bAlgumAviso := True;
               memResult.Lines.Add(sMsgErro);
            end;
         except
            MsgDlg('Ocorreu um erro na atualização da inadimplência['+sMsgErro+']. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
            dtmBaseDados.dbBaseDados.RollBack;
         end;
      end;
      // edilaine - SOL 253577-17744 / PPM 1063636 - fim

       if Trim(sMsgErro) <> ''
       then begin
          bAlgumAviso := True;
          memResult.Lines.Add(sMsgErro);
       end;
       qryContribuicao.Next;
  end;
  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Commit;
  qryContribuicao.First;
  qryContribuicao.EnableControls;
  frmAguarde.Apaga;
  if not bOk
  then MsgDlg('Ocorreu um erro na atualização das contribuições['+sMsgErro+']. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
  qryContribuicao.Close;

  //qryContribuicao.SQL.SaveToFile('C:\ProjetosCM5\Teste3.txt');

  qryContribuicao.Open;
  qryContribuicao.First;
  qryContribuicao.EnableControls;

  if bAlgumAviso                              
  then begin
     memResult.Lines.Add('=================================================================================== ');
     memResult.Lines.Add('ATENÇÃO : As contribuições baixadas no CAR com valor maior que o esperado           ');
     memResult.Lines.Add('          pelo AdmPREV devem ser analisadas e recebidas manualmente no AdmPREV      ');
     memResult.Lines.Add('          para que seja dado o devido tratamento a diferença de valores.            ');
     memResult.Lines.Add('=================================================================================== ');

     If MsgDlg('O recebimento de contribuições pendentes retornou mensagens no log.'+#13+
               'Deseja ver agora o log da operação ?',
               'Baixa Automática',mtConfirmation,[mbYes,mbNo],0) = mrYes
      Then Begin
        pgctrlCobrancas.ActivePage := tbsResult;
        tbsResult.TabVisible       := True;
        tbsAlterar.TabVisible      := False;
        tbsMotivo.TabVisible       := False;
      End;

  end;
end; //PreencheDadosTitular

procedure TfrmControleIndivContrib.FormActivate(Sender: TObject);
begin
  if bAbriuOutroForm
  then begin
     PreencheDadosTitular(qryTitular.FieldByName('IdTitular').AsInteger,
                          qryTitular.FieldByName('IdPessJur').AsInteger,
                          qryTitular.FieldByName('IdPlanoPrev').AsInteger,
                          qryTitular.FieldByName('SeqProposta').AsInteger,
                          -1); //completar a escritura da procedure, nunca passa aqui //Helio - SOL Nº 253577/17461 PPM Nº 955564
     Exit;
  end;
  inherited;
  qryForma.Close;
  qryForma.ParamByName('RecPag').AsString := 'R';
  qryForma.Open;
end;



procedure TfrmControleIndivContrib.FormCreate(Sender: TObject);
begin
  inherited;
  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  bAbriuOutroForm     := False;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT TIPOPERENVIO FROM PARAMAPREV  ');
  qryAux.Open;
  if not qryAux.IsEmpty
  then sTipOperEnvio := qryAux.FieldByName('TIPOPERENVIO').AsString
  else sTipOperEnvio := '';
  qryAux.Close;

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
end;



procedure TfrmControleIndivContrib.sbtnSalariosClick(Sender: TObject);
Var
  I : Integer;
  SalString:String;
  Salario : Double;
begin
  inherited;
  if (not qryTitular.Active) or (qryTitular.IsEmpty)
  then begin
     MsgDlg('Selecione o Participante. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  frmAguarde.Mostra('Verificando salários ... ');

  qrySalarios.Close;
  qrySalarios.ParamByName('IdPessoa').Value  := qryTitular.FieldbyName('IdPessoa').AsInteger;
  qrySalarios.ParamByName('IdPessJur').Value := qryTitular.FieldbyName('IdPessJur').AsInteger;
  if   qryTitular.FieldByName('FlgInterno').AsString = 'MA'
  then qrySalarios.ParamByName('IdRubrica').Value := qryTitular.FieldbyName('IdRubSalManut').AsInteger
  else if qryTitular.FieldByName('FlgInterno').AsString = 'MP'
  then qrySalarios.ParamByName('IdRubrica').Value := qryTitular.FieldbyName('IdRubSalManutParc').AsInteger
  else qrySalarios.ParamByName('IdRubrica').Value := qryTitular.FieldbyName('IdRubSalParticip').AsInteger;

  frmAguarde.Apaga;

  With qrySalarios  Do
   Begin
    Open;
    First;
    qrySalAux.Open;
    For i := 1 to 48 Do
    begin
      qrySalAux.Insert;
      qrySalAux.Fields[0].AsString  := FieldByName('MES').AsString;
      qrySalAux.Fields[1].AsString  := FieldByName('MESCOBRANCA').AsString;
      Salario := FieldByName('VALORPROVENTO').AsFloat;
      SalString := FormatFloat('###########,##0.00',Salario);
      qrySalAux.Fields[2].AsString   :=  SalString; { Salario}
      qrySalAux.Post;
      Next;
      If Eof Then Break;
    end;
  end;
end;



procedure TfrmControleIndivContrib.FormShow(Sender: TObject);
begin
  inherited;

  WindowState := wsMaximized;

  sOrdemFiltro := 'DESC';

  LimpaTela;

  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');

  // CPREV_001
  cmbSituacao.ItemIndex := 0;
end;



procedure TfrmControleIndivContrib.tbButtonEnviarClick(Sender: TObject);
var bAlgumaSelecionada,
    bExigeFinanc,
    bErro          : boolean;
    rEnvio         : double;
    iOrdem         : integer;
    cRecPag        : char;
    sNumRecebEnviados,
    sMsgErro,
    sCamposObrig,
    sCamposNObrig, sMesCobEnvio, sMesCobEnvioAnt  : string;
    iPlnCodigo,
    iUltimaContrib, iCodLancCAPCAR  : longint;

    bContabilizaNoEnvio : Boolean;

    sObservacao  : string;

    bApenasUmDocumento : Boolean;

    icontcontrib : Integer;

    sNumRecebimento, sMesRefAnt, sMesCobAnt,
    sMesRef, sMesCob, sIdContribuicao, sFlgPagador, sFlgSitFundacao, sDataPrevisaoRece, sCodPortForma,
    sCodCentroCusto: String;


    rTotal, dVlRecPag : Double;

    bCAR : Boolean;

    sTipDoc, sAux1, sAux2 : String;

    piUltimaContrib : Integer;

    bVariosMeses : Boolean;

    bExisteContPatro,
    bExisteContpart   : Boolean;
    sFlagPagador      : String;

    sMsgPga, sSQLwhere : String; // Renato Visoni SOL 129342
    iFlgagrupaboleta : integer; //SOL 148139 KINTANA 1040427
    bDependente : Boolean;//Helio - SOL Nº 253577/17461 PPM Nº 955564
begin
  inherited;

  cOperacao := 'E';
  frmAguarde.Mostra('Verificando contribuições selecionadas ... ');

  // Verificar se alguma contribuicao foi selecionada
  // E para cada uma das selecionadas verificar se ela
  // já foi enviada
  memResult.Lines.Clear;
  qryContribuicao.DisableControls;
  qryContribuicao.First;
  bAlgumaSelecionada := False;

  bExisteContpart  := False;
  bExisteContPatro := False;

  sNumRecebimento := '';
  icontcontrib := 0;
  dVlRecPag := 0;
  sMesRef := qryContribuicao.FieldByName('mesreferencia').AsString;
  bVariosMeses := false;


  while not qryContribuicao.Eof do
  begin
     if qryContribuicao.FieldByName('FlgSelecionado').AsInteger = 1
     then
     begin
        bAlgumaSelecionada := True;
        sNumRecebimento := sNumRecebimento + ', '+qryContribuicao.FieldByName('NumRecebimento').AsString;

        bExisteContpart  := (qryContribuicao.FieldByName('FLGPAGADOR').AsString = 'C');
        bExisteContpatro := (qryContribuicao.FieldByName('FLGPAGADOR').AsString = 'P');

        if qryContribuicao.FieldByName('FlgDevolucao').AsInteger = 1 then
           dVlRecPag := dVlRecPag -  qryContribuicao.FieldByName('ValorEsperado').AsFloat
        else dVlRecPag := dVlRecPag +  qryContribuicao.FieldByName('ValorEsperado').AsFloat;

        inc(icontcontrib);

        //verifica se existe quebra de mês
        if sMesRef <> qryContribuicao.FieldByName('mesreferencia').AsString then
           bVariosMeses := true;

     end;


     // Se o usuario selecionou uma contribuicao já enviarda -> msg Erro
     if (qryContribuicao.FieldByName('FlgSelecionado').AsInteger = 1)  and
        (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 0) and
        (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 4) and
        (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 8)
     then begin
        frmAguarde.Apaga;
        MsgDlg('A contribuição '+qryContribuicao.FieldByName('Nome').AsString+
               ' referente ao mês '+qryContribuicao.FieldByName('MesReferencia').AsString+
               ' já foi enviada para cobrança. '+#13+
               'Caso deseje reenviá-la, utilize a operação "Cancelar" antes da operação "Enviar". ',
               'Informação',mtInformation,[mbOk,mbHelp],0);
        qryContribuicao.EnableControls;
        Exit;
     end;

     // Se o usuario selecionou uma contribuicao que nao é p/ Banco -> msg Erro
     if (qryContribuicao.FieldByName('FlgSelecionado').AsInteger = 1) and
        (qryContribuicao.FieldByName('FlgDescFolha').AsInteger = 1)
     then begin
        frmAguarde.Apaga;
        MsgDlg('A contribuição '+qryContribuicao.FieldByName('Nome').AsString+
               ' referente ao mês '+qryContribuicao.FieldByName('MesReferencia').AsString+
               ' está registrada para cobrança via "Folha" e não "Banco".'+#13+
               'Caso deseje alterar a forma de cobrança utilize a operação "Alterar". '+
               'Para enviar a contribuição via "Folha" utilize a opção de menu "Contribuições | Envio de Cobranca".',
               'Informação',mtInformation,[mbOk,mbHelp],0);
        qryContribuicao.EnableControls;
        Exit;
     end;
     qryContribuicao.Next;
  end; // while not qryContribuicao.Eof


  qryContribuicao.EnableControls;
  frmAguarde.Apaga;

  if not bAlgumaSelecionada
  then begin
     qryContribuicao.First;
     MsgDlg('Selecione alguma contribuição. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;


  If ((bExisteContpart) And (bExisteContPatro)) And (QryQuebraDoc.FieldByName('FlgSitFundacao').AsString <> 'MA')
   Then Begin
     qryContribuicao.First;
     MsgDlg('Esta operação não pode ser realizada com contribuições de participante e contribuições patronais simultâneamente.'+#13+
            'Selecione apenas contribuições de participante ou contribuições patronais.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
   End;


  frmAguarde.Mostra('Verificando dados auxiliares ...');
  frmAguarde.Apaga;


  // Enviar contribuicoes selecionadas
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

  frmAguarde.Mostra('Enviando contribuições ...');
  dtmBaseDados.dbBaseDados.StartTransaction;


  bErro := False;
  rEnvio := 0;
  iOrdem := 1;
  iultimacontrib := -1;

  sNumRecebEnviados := '';


  sObservacao       := '';
  if MsgDlg('Deseja informar uma OBSERVAÇÃO para ser incluída no documento ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes
  then begin
     PedeInfAux('Digite a Observação Desejada ...',
                'Observação para Lançamento dos Documentos',
                '', 1, sObservacao );
  end;

  // SOL: 84396 - Daniel Begnami
  if (sObservacao = 'SAIR') then
  begin

    if dtmBaseDados.dbBaseDados.InTransaction
      then dtmBaseDados.dbBaseDados.RollBack;

    frmAguarde.Apaga;

    ShowMessage('O Envio foi cancelado !');

    exit;

  end;
  // FIM

  bApenasUmDocumento := not bVariosMeses;

  if (icontcontrib > 1) and (not bApenasUmDocumento) then
  begin
     if MsgDlg('Deseja que as contribuições sejam agrupadas em documento por mês? (caso a opção seja NÃO, apenas um documento será gerado)','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
     begin
        bApenasUmDocumento := true;
        iFlgagrupaboleta := 0; // SOL 148139 KINTANA 1040427
     end
     else // SOL 148139 KINTANA 1040427
     begin
        iFlgagrupaboleta := 1;   // SOL 148139 KINTANA 1040427
     end;
  end
  else // SOL 148139 KINTANA 1040427
  if (icontcontrib <= 1) then
  begin
     iFlgagrupaboleta := 0;  // SOL 148139 KINTANA 1040427
  end
  else // SOL 148139 KINTANA 1040427
  if (icontcontrib > 1) then
  begin
     iFlgagrupaboleta := 1;  // SOL 148139 KINTANA 1040427
  end;

  //Inicio - Helio - SOL Nº 253577/17461 PPM Nº 955564
  //AbreQryQuebraDoc(copy(sNumRecebimento,2,length(snumrecebimento)));
  if qryPendente.IsEmpty then
       AbreQryQuebraDoc(copy(sNumRecebimento,2,length(snumrecebimento)))
  else
       AbreQryQuebraDocDependente(copy(sNumRecebimento,2,length(snumrecebimento)));
  //Fim Helio - SOL Nº 253577/17461 PPM Nº 955564

  iCodLancCAPCAR := 0;
  rTotal := 0;

  sMesRef := QryQuebraDoc.FieldByName('mesreferencia').AsString;
  sMesCob := QryQuebraDoc.FieldByName('mescobranca').AsString;

  sNumRecebimento := '';

  if (dVlRecPag >= 0) and ( bApenasUmDocumento) then
  begin
     cRecPag := 'R';
     sTipDoc := prmTpDocRRecBanco;
  end
  else if (dVlRecPag < 0) and (bApenasUmDocumento) then
  begin
     cRecPag := 'P';
     sTipDoc := prmTpDocPEnvioBanco;
  end;


  QryQuebraDoc.First;
  sFlagPagador := QryQuebraDoc.FieldByName('FLGPAGADOR').AsString;
  while not QryQuebraDoc.Eof do
  begin


     sCamposObrig := '';
     if QryQuebraDoc.FieldByName('FlgDevolucao').AsInteger = 1
     then begin

        if not bApenasUmDocumento then
        begin
           cRecPag := 'P';
           sTipDoc := prmTpDocPEnvioBanco;
        end;


        if (not prmIntegraCAP)
        then begin
           memResult.Lines.Add(QryQuebraDoc.FieldByName('MesReferencia').AsString+':'+QryQuebraDoc.FieldByName('NomeContrib').AsString);
           memResult.Lines.Add('    '+'- Sistema não integrado com Contas a Pagar -> contribuição não enviada.');
           iultimacontrib :=   QryQuebraDoc.FieldByName('IdContribuicao').AsInteger;
           QryQuebraDoc.Next;
           bErro := True;
           Continue;
        end;
     end
     else begin
        if not bApenasUmDocumento then
        begin
           cRecPag := 'R'; 
           sTipDoc := prmTpDocRRecBanco;
        end;

        if (not prmIntegraCAR)
        then begin
           memResult.Lines.Add(QryQuebraDoc.FieldByName('MesReferencia').AsString+':'+QryQuebraDoc.FieldByName('NomeContrib').AsString);
           memResult.Lines.Add('    '+'- Sistema não integrado com Contas a Receber -> contribuição não enviada.');
           iultimacontrib :=   QryQuebraDoc.FieldByName('IdContribuicao').AsInteger;
           QryQuebraDoc.Next;
           bErro := True;
           Continue;
        end;
     end;


     rEnvio := EnviaContribuicaoBANCO (qryContabil,qryDocumentos,QryQuebraDoc, qryAux,
                             Copy(QryQuebraDoc.FieldByName('MesReferencia').AsString,6,2),
                             QryQuebraDoc.FieldByName('MesReferencia').AsString,
                             Copy('Cobrança de '+QryQuebraDoc.FieldByName('NomeContrib').AsString,1,40),
                             Copy('Receita de '+QryQuebraDoc.FieldByName('NomeContrib').AsString,1,40),
                             QryQuebraDoc.FieldByName('DataPrevisaoRece').AsString,
                             QryQuebraDoc.FieldByName('IdPessJur').AsInteger,
                             QryQuebraDoc.FieldByName('IdPlanoPrev').AsInteger,
                             QryQuebraDoc.FieldByName('IdPessoa').AsInteger,
                             QryQuebraDoc.FieldByName('IdContribuicao').AsInteger,
                             iUltimaContrib,
                             CtrlDocumento,
                             QryQuebraDoc.FieldByName('FlgPagador').AsString,
                             QryQuebraDoc.FieldByName('FlgSitFundacao').AsString,
                             QryQuebraDoc.FieldByName('CODPORTFORMA').AsInteger,
                             cRecPag,
                             QryQuebraDoc.FieldByName('ValorEsperado').AsFloat,
                             sMsgErro, iCodLancCAPCAR, iPlnCodigo,
                             sObservacao,
                             QryQuebraDoc.FieldByName('IDPLANPREVCONTAB').AsString); //Helio - SOL Nº 253577/17460 PPM Nº 955546
     if (rEnvio <= 0) and (Trim(sCamposObrig) <> '')
     then begin
        memResult.Lines.Add(QryQuebraDoc.FieldByName('MesReferencia').AsString+':'+QryQuebraDoc.FieldByName('NomeContrib').AsString);
        memResult.Lines.Add('    '+'- Campos OBRIGATÓRIOS em branco : '+sCamposObrig)
     end
     else if rEnvio = 0
          then begin
             memResult.Lines.Add(QryQuebraDoc.FieldByName('MesReferencia').AsString+':'+QryQuebraDoc.FieldByName('NomeContrib').AsString);
             memResult.Lines.Add('    '+'- Contribuição enviada com valor ZERO.')
          end
          else if rEnvio < 0
               then begin
                  memResult.Lines.Add(QryQuebraDoc.FieldByName('MesReferencia').AsString+':'+QryQuebraDoc.FieldByName('NomeContrib').AsString);
                  memResult.Lines.Add('    '+'- Erro no Envio : '+sMsgErro);
               end;
     if rEnvio <= 0
     then begin
        iultimacontrib :=   QryQuebraDoc.FieldByName('IdContribuicao').AsInteger;
        QryQuebraDoc.Next;
        bErro := True;
        Continue;
     end;

     rTotal := rTotal + rEnvio;

     GravaLogTOTALPREV ('Controle Indiv.-Enviar-Matr.'+lblMatricula.Caption+'-'+
                        'Mês Cob.:'+QryQuebraDoc.FieldByName('MesCobranca').AsString+'-'+
                        'Mês Ref.:'+QryQuebraDoc.FieldByName('MesReferencia').AsString+'-'+
                        'Cód.:'+QryQuebraDoc.FieldByName('IdContribuicao').AsString+'-'+
                        'Num Rec.:'+QryQuebraDoc.FieldByName('NumRecebimento').AsString);



     // Atualizar sitrecebimento para 1 (enviado e nao recebido)
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO = 1 , '+
                    ' DATACANCELAMENTO = NULL, MOTIVOCANCEL = NULL '+
                    ' , DATAEMISSCOB     = SYSDATE  '+  // SOL 180156 Kintana 1668852
                    ' , IDPLANPREVCONTAB = '+QryQuebraDoc.FieldByName('IDPLANPREVCONTAB').AsString+ //Higor Nayde 162126*RE01 KINTANA 792563
                    'WHERE  MESREFERENCIA  = '''+QryQuebraDoc.FieldByName('MesReferencia').AsString+''''+
                    'AND    MESCOBRANCA    = '''+QryQuebraDoc.FieldByName('MesCobranca').AsString+''''+
                    'AND    NUMRECEBIMENTO =   '+QryQuebraDoc.FieldByName('NumRecebimento').AsString+
                    'AND    IDMOTIVO       =   '+QryQuebraDoc.FieldByName('IdMotivo').AsString);
     try
        qryAux.ExecSQL;
     except
        memResult.Lines.Add(QryQuebraDoc.FieldByName('MesReferencia').AsString+':'+QryQuebraDoc.FieldByName('NomeContrib').AsString);
        memResult.Lines.Add('    '+'- Erro na atualização da situação da contribuição ');
        bErro := True;
     end;



     // Atualiza os documentos gerados no CAP/CAR com o número da planilha gerada
     // para a contabilidade - plncodigo
     VerificaContabMantidoNoEnvio(qryaux,bContabilizaNoEnvio,QryQuebraDoc.FieldByName('IdPlanoPrev').AsInteger);

     if not ((QryQuebraDoc.FieldByName('FlgSitFundacao').AsString = 'MA')
             and (not bContabilizaNoEnvio))
     then  begin
        if not prmIntegraContab
        then begin
           memResult.Lines.Add(QryQuebraDoc.FieldByName('MesReferencia').AsString+':'+QryQuebraDoc.FieldByName('NomeContrib').AsString);
           memResult.Lines.Add('    '+'[AVISO] Sistema não integrado com Contabilidade -> envio da contribuição não contabilizado.');
           iultimacontrib :=   QryQuebraDoc.FieldByName('IdContribuicao').AsInteger;
           QryQuebraDoc.Next;
           Continue;
        end;
        // Descarrega qryContabil com os Lançamentos contábeis dos envios (mantidos)
        IncluiContabilidade(CtrlLancamento, qryContabil , iPlnCodigo,sMsgErro);
        if iPlnCodigo < 0
        then begin
           memResult.Lines.Add(QryQuebraDoc.FieldByName('MesReferencia').AsString+':'+QryQuebraDoc.FieldByName('NomeContrib').AsString);
           memResult.Lines.Add('    '+'[ERRO ] Erro na inclusão do lançamento na contabilidade : '+sMsgErro);
           bErro := True;
        end;

        qryDocumentos.First;
        While not qryDocumentos.EOF Do
        Begin
           try
              AdmPREV_Informa_Planilha(qryAux,iPlnCodigo,
                                         qryDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                         qryDocumentos.FieldByName('NUMLANCTO').AsInteger);
           except
              memResult.Lines.Add(QryQuebraDoc.FieldByName('MesReferencia').AsString+':'+QryQuebraDoc.FieldByName('NomeContrib').AsString);
              memResult.Lines.Add('    '+'[ERRO ] Erro ao atualizar o número da planilha nos documentos gerados.');
              bErro := True;
           end;
           qryDocumentos.Next;
        end;
        try
           if not qryContabil.IsEmpty   then qryContabil.CancelUpdates;
        except
        end;
     end;

     // Se o plncodigo > 0 e codlanccapcar < 0
     // Entao é porque a contribuicao é da propria fundacao e só foi contabilizada
     // Neste caso, gravar o plncodigo na hstcontrib para poder agrupar
     if (iPlnCodigo > 0) and (iCodLancCAPCAR < 0)
     then begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' INSERT INTO CONTABCONTFUND (NUMRECEBIMENTO, PLNCODIGO) '+
                       ' VALUES ( '+QryQuebraDoc.FieldByName('NumRecebimento').AsString+','+
                                    IntToStr(iPlnCodigo) +')');
        try
           qryAux.ExecSQL;
        except
           memResult.Lines.Add(QryQuebraDoc.FieldByName('MesReferencia').AsString+':'+QryQuebraDoc.FieldByName('NomeContrib').AsString);
           memResult.Lines.Add('    '+'[ERRO ] Erro ao atualizar o número da planilha no histórico de contribuição.');
           bErro := True;
        end;
     end;

     sNumRecebEnviados := sNumRecebEnviados + QryQuebraDoc.FieldByName('NumRecebimento').AsString+',';
     iultimacontrib :=   QryQuebraDoc.FieldByName('IdContribuicao').AsInteger;
     inc(iOrdem);

     sIdContribuicao := QryQuebraDoc.FieldByName('IdContribuicao').AsString;
     sFlgPagador := QryQuebraDoc.FieldByName('FlgPagador').AsString;
     sflgSitFundacao := QryQuebraDoc.FieldByName('flgSitFundacao').AsString;
     sDataPrevisaoRece := QryQuebraDoc.FieldByName('DataPrevisaoRece').AsString;
     sNumRecebimento := sNumRecebimento + ','+ QryQuebraDoc.FieldByName('NumRecebimento').AsString;
     sCodPortForma := QryQuebraDoc.FieldByName('CODPORTFORMA').AsString;
     sDataPai.vData := StrToDate(sDataPrevisaoRece); //Wylliam Leite da Silva SOL: 176483 Kintana: 1614052

     BuscaInfFinancContrib(sAux1, sAux2, sCodPortForma,'CODPORTFORMA',
                      QryQuebraDoc.FieldByName('CODPORTFORMA').AsString,
                      'S',
                      QryQuebraDoc.FieldByName('IdPessjur').AsInteger,
                      QryQuebraDoc.FieldByName('IdPlanoPrev').AsInteger,
                      QryQuebraDoc.FieldByName('IdContribuicao').AsInteger,
                      piUltimaContrib,
                      QryQuebraDoc.FieldByName('IdPessoa').AsInteger );





     BuscaInfFinancContrib(sAux1, sAux2, sCodCentroCusto,'CODCENTROCUSTOD',
                QryQuebraDoc.FieldByName('CODCENTROCUSTOD').AsString,
                'S',
                QryQuebraDoc.FieldByName('IdPessjur').AsInteger,
                QryQuebraDoc.FieldByName('IdPlanoPrev').AsInteger,
                QryQuebraDoc.FieldByName('IdContribuicao').AsInteger,
                piUltimaContrib,
                QryQuebraDoc.FieldByName('IdPessoa').AsInteger );


     QryQuebraDoc.Next;

     //Inicio - Helio - SOL Nº 253577/17461 PPM Nº 955564
     if qryPendente.IsEmpty then
           bDependente := False
     else
           bDependente := True;
     //Fim - Helio - SOL Nº 253577/17461 PPM Nº 955564

     // testa se deve descarregar os documentos neste momento
     // caso seja mês diferente e o usuário tenha optado por vários documentos, um por mês
     // Se for a mesma pessoa
     // Entao  lançar as contribuições em um único documento e uma única planilha
     // Senao  reiniciar variaveis de Planilha(iPlnCodigo) e Documento(iCodLancCAPCAR) para
     //        que sejam criados novos registros
     if ((sMesRef <> QryQuebraDoc.FieldByName('MesReferencia').AsString) and (not bApenasUmDocumento))
        or (sMesCob <> QryQuebraDoc.FieldByName('MesCobranca').AsString)
        or (sDataPrevisaoRece <> QryQuebraDoc.FieldByName('DataPrevisaoRece').AsString)
        or (sFlagPagador <> QryQuebraDoc.FieldByName('FLGPAGADOR').AsString)
        or (QryQuebraDoc.eof)
        then
     begin

        If sFlagPagador = 'P'
         Then iCodLancCapCAR := DescarregaDocumentos( CtrlDocumento,
                                                      qryDocumentos,
                                                      QryQuebraDoc.FieldByName('IdPessJur').AsInteger,
                                                      iPlnCodigo,
                                                      sTipDoc,
                                                      sCodPortForma,
                                                      Copy(sMesCob,6,2),
                                                      Copy(sMesCob,1,4),
                                                      rTotal,
                                                      strtodate(sDataPrevisaoRece),
                                                      '',
                                                      'P', QryQuebraDoc.FieldByName('IDPESSJUR').AsString,
                                                      copy(sNumRecebimento,2,length(snumrecebimento)),
                                                      cRecPag , sObservacao,
                                                      sCodCentroCusto,
                                                      //Inicio - Helio - SOL Nº 253577/17461 PPM Nº 955564
                                                      True,
                                                      '',
                                                      bDependente
                                                      //Fim - Helio - SOL Nº 253577/17461 PPM Nº 955564
                                                      )
         Else iCodLancCapCAR := DescarregaDocumentos( CtrlDocumento,
                                                      qryDocumentos,
                                                      QryQuebraDoc.FieldByName('IdPessJur').AsInteger,
                                                      iPlnCodigo,
                                                      sTipDoc,
                                                      sCodPortForma,
                                                      Copy(sMesCob,6,2),
                                                      Copy(sMesCob,1,4),
                                                      rTotal,
                                                      strtodate(sDataPrevisaoRece),
                                                      '',
                                                      'P', QryQuebraDoc.FieldByName('IDPESSOA').AsString,
                                                      copy(sNumRecebimento,2,length(snumrecebimento)),
                                                      cRecPag , sObservacao,
                                                      sCodCentroCusto,
                                                      //Inicio - Helio - SOL Nº 253577/17461 PPM Nº 955564
                                                      True,
                                                      '',
                                                      bDependente
                                                      //Fim - Helio - SOL Nº 253577/17461 PPM Nº 955564
                                                      );

        sFlagPagador := QryQuebraDoc.FieldByName('FLGPAGADOR').AsString;  
        

        if iCodLancCapCAR < 0
        then begin
           bErro := True;
           rEnvio := -1;
           memResult.Lines.Add('[ERRO ] - Erro na inserção dos documentos : '+CtrlDocumento.MessageInfo); 
        end;


        if not EnviaAlteradorBANCO( CtrlDocumento, 
                      qryAux,qryAux2,
                      qryContabil,
                      qryDocumentos,  
                      sMesRef,
                      copy(sNumRecebimento,2,length(snumrecebimento)) ,
                      iCodLancCAPCAR, 
                      sDataPrevisaoRece,
                      sDataPrevisaoRece,
                      sTipOperEnvio,
                      QryQuebraDoc.FieldByName('IdPessJur').AsInteger,
                      QryQuebraDoc.FieldByName('IdPlanoPrev').AsInteger,
                      QryQuebraDoc.FieldByName('IdPessoa').AsInteger,
                      strtoint(sIdContribuicao),
                      iUltimaContrib,
                      sFlgPagador,
                      sMsgErro,
                      sFlgSitFundacao) 
        then begin
           memResult.Lines.Add(sMesRef+':'+QryQuebraDoc.FieldByName('NomeContrib').AsString);
           memResult.Lines.Add('    '+'- Erro no Envio de Alteradores : '+sMsgErro);
           iultimacontrib :=   QryQuebraDoc.FieldByName('IdContribuicao').AsInteger;

           bErro := True;
           rEnvio := -1;
        end;

        qryDocumentos.CancelUpdates;

        qryDocumentos.Close;
        qryDocumentos.ParamByName('CODDOCUMENTO').AsInteger := -1;
        qryDocumentos.Open;

        if not qryContabil.IsEmpty   then qryContabil.CancelUpdates;



        rTotal := 0;
        iCodLancCAPCAR := -1;
        iPlnCodigo     := 0;
        sMesRef := QryQuebraDoc.FieldByName('mesreferencia').AsString;
        sMesCob := QryQuebraDoc.FieldByName('mescobranca').AsString;
        sNumRecebimento := '';
        dVlRecPag := 0;
     end;
  end;



  sNumRecebEnviados := Copy(sNumRecebEnviados,1,length(sNumRecebEnviados)-1);

  // Se foi feito algum envio para banco,
  // Agrupar documentos do participante por mes (1 boleta por mes)
  frmAguarde.Mostra('Verificando documentos a agrupar ...'); 

  // SOL 148139 KINTANA 1040427
  if not AgrupaBoletasBANCO(CtrlDocumento, qryAux, qryAux2, '', sNumRecebEnviados, iFlgagrupaboleta) // SOL 148139 KINTANA 1040427

  then begin
     memResult.Lines.Add('Finalização do Envio ');
     memResult.Lines.Add('    '+'[ERRO ] Erro ao agrupar documentos. ');
     bErro := True;
  end;
  frmAguarde.Apaga;



  if not bErro then
  begin
    Try
      If Not Sistema.GravaLogOperacoes(Copy(Self.Caption + ' - Envio de Contribuições',1,100)) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;



    memResult.Lines.Add(' ');
    memResult.Lines.Add('=> Envio de Contribuições efetuado com sucesso');
    MsgDlg('Envio de Contribuições efetuado com sucesso. ','Informação',mtInformation,[mbOk,mbHelp],0);

    if dtmBaseDados.dbBaseDados.InTransaction
      Then dtmBaseDados.dbBaseDados.Commit;




    // Renato Visoni SOL 129342
    qryContribuicao.First;
    sSQLwhere :='';
    while not qryContribuicao.Eof do begin
      if qryContribuicao.FieldByName('FlgSelecionado').AsInteger = 1 then begin
        if sSQLwhere ='' then begin
          sSQLwhere := 'AND ((C.IDCONTRIBUICAO = '+QuotedStr(qryContribuicao.FieldByName('idContribuicao').asString)+') AND (H.MESCOBRANCA = ' + QuotedStr(qryContribuicao.FieldByName('MESCOBRANCA').asString)+')';
        end else begin
          sSQLwhere := sSQLwhere + ' OR (C.IDCONTRIBUICAO = '+QuotedStr(qryContribuicao.FieldByName('idContribuicao').AsString)+') AND (H.MESCOBRANCA = ' + QuotedStr(qryContribuicao.FieldByName('MESCOBRANCA').asString)+')';

        end;

      end;
      qryContribuicao.Next;
    end;
    if sSQLwhere <> '' then begin
      sSQLwhere := sSQLwhere +')';
    end;

    sMsgPga :='';



    Try
      sMsgPga := RealizaIntegracaoPGAIndiv('',CtrlDocumento,CtrlLancamento,MontaSelectPart.ValoresChave[0],sSQLwhere);
      if sMsgPga = '' then begin
        memResult.Lines.Add(' - Integração com PGA realizada com sucesso- ')
      end else begin
        memResult.Lines.Add(sMsgPga);
      end;
    Except
       memResult.Lines.Add(' - Ocorreram problemas na Integração com PGA - ');
    end;


    //Renato Visoni SOL 129740 Kintana 714381
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
   //Renato Visoni SOL 129740 Kintana 714381











  end
  else begin
    MsgDlg('Envio de Contribuições efetuado com alguns problemas. '+#13+
           'Verifique a lista de mensagens.','Erro',mtError,[mbOK],0);
    dtmBaseDados.dbBaseDados.RollBack;
    memResult.Lines.Add(' ');
    memResult.Lines.Add('=> Envio de Contribuições NÃO efetuado');
  end;

  try
     if not qryDocumentos.IsEmpty then qryDocumentos.CancelUpdates;
     if not qryContabil.IsEmpty   then qryContabil.CancelUpdates;
  except
  end;

  try
     frmAguarde.Mostra('Atualizando situações ...');
     qryContribuicao.Close;
     qryContribuicao.Open;
  finally
     frmAguarde.Apaga;
  end;


  pgctrlCobrancas.ActivePage := tbsResult;
  tbsResult.TabVisible := True;
  tbsAlterar.TabVisible := False;
  tbsMotivo.TabVisible  := False;
end;

procedure TfrmControleIndivContrib.tbButtonAlterarClick(Sender: TObject);
begin
  inherited;
  // SOL 199846 KTN 1923897 Otacilio ** Inicio **
  If qryContribuicao.IsEmpty then
  Begin
    MsgDlg('Não existe contribuição a ser alterada.', 'Atenção', mtWarning, [mbOK],0);
    Exit;
  End;
  // SOL 199846 KTN 1923897 Otacilio ** Fim **

  cOperacao := 'A';

  If qryContribuicao.FieldByName('SITRECEBIMENTO').AsInteger > 1 Then
  Begin
    MsgDlg('Não é possível alterar registro já recebido! Operação Cancelada!', 'Atenção', mtWarning, [mbOK],0);
    Exit;
  End
  Else
    If qryContribuicao.FieldByName('SITRECEBIMENTO').AsInteger = 1 Then
    Begin
      If qryContribuicao.FieldByName('CODDOCUMENTOPREV').AsString <> '' Then
        MsgDlg('Esta contribuição já foi enviada para o sistema de Contas e Receber não podendo ser alterada. '+#13+
               'Caso seja necessário, utilize a opção de "Desfazer" ou a tela de Tratamento de Divergência.', 'Atenção', mtWarning, [mbOK],0)
      Else
        MsgDlg('Esta contribuição já foi enviada para a folha não podendo ser alterada. '+#13+
               'Caso seja necessário, utilize a opção de "Desfazer" ou a tela de Tratamento de Divergência.', 'Atenção', mtWarning, [mbOK],0);

      Exit;
    End;

  // Verificar se a contribuição ainda não foi enviada
  if ((qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 0) and
     (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 4) and
     (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 8))
     and
     //se foi enviado mas ainda não foi recebido
     //abrir a opção de alterar a data de vancimento
     ((qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 0) and
      (qryContribuicao.FieldByName('ValorRecebido').AsFloat > 0) and
      (qryContribuicao.FieldByName('FlgDescFolha').AsInteger = 0 ) )
  then begin
     MsgDlg('Esta contribuição já foi enviada para '+
            qryContribuicao.FieldByName('TipoPgmto').AsString+'.'+#13+
            'Caso deseje alterar algum de seus dados, utilize a operação "Cancelar".',
            'Informação',mtInformation,[mbOk,mbHelp],0);
     Exit;
  end;
  pgctrlCobrancas.ActivePage := tbsAlterar;
  tbsResult.TabVisible := False;
  tbsMotivo.TabVisible  := False;
  tbsAlterar.TabVisible := True;

  lblContrib.Caption      := qryContribuicao.FieldByName('NomeContrib').AsString+
                         '['+qryContribuicao.FieldByName('MesReferencia').AsString+']'+
                         ' = '+FormatFloat('#0.00', qryContribuicao.FieldByName('ValorEsperado').AsFloat);

  dtPrevista.Text         := qryContribuicao.FieldByName('DataPrevisaoRece').AsString;
  edValorPrev.Text        := qryContribuicao.FieldByName('ValorEsperado').AsString;
  rgrpDescBanco.Visible   := True;
  grpPortForma.Visible    := True;
  rgrpRetiraReserva.Visible := False; 

  if (qryContribuicao.FieldByName('SitRecebimento').AsInteger = 1) and
  (qryContribuicao.FieldByName('ValorRecebido').AsFloat = 0) and
  (qryContribuicao.FieldByName('FlgDescFolha').AsInteger = 0 )  then
  begin
     dtPrevista.enabled := True;
     edValorPrev.enabled := false;
     rgrpDescBanco.enabled := false;
     grpPortForma.enabled := false;
  end
  else
  begin
     dtPrevista.enabled := True;
     edValorPrev.enabled := true;
     rgrpDescBanco.enabled := true;
     grpPortForma.enabled := true;
  end;

  if qryContribuicao.FieldByName('FLGDEVOLUCAO').AsInteger = 0
  then begin
     lblData.Caption         := 'Data Prevista';
     rgrpDescBanco.Caption   := 'Descontar em Banco ? ';
     grpPortForma.Caption    := 'Forma de Cobrança';
     edValorPrev.Color       := clWindow;
     edValorPrev.ReadOnly    := False;

     if qryContribuicao.FieldByName('FlgDescFolha').AsInteger = 0
     then rgrpDescBanco.ItemIndex := 0
     else rgrpDescBanco.ItemIndex := 1;

     qryForma.Close;
     qryForma.ParamByName('RecPag').AsString := 'R';
     qryForma.Open;
  end
  else begin
     lblContrib.Caption      := 'Devolução de Contribuições';
     lblData.Caption         := 'Data para Devolução';

     rgrpDescBanco.Caption   := 'Devolver em Banco ? ';
     grpPortForma.Caption    := 'Forma de Pagamento';
     edValorPrev.Color       := clWindow;
     edValorPrev.ReadOnly    := False;

     if qryContribuicao.FieldByName('FlgDescFolha').AsInteger = 0
     then rgrpDescBanco.ItemIndex := 0
     else rgrpDescBanco.ItemIndex := 1;

     qryForma.Close;
     qryForma.ParamByName('RecPag').AsString := 'P';
     qryForma.Open;
  end;

  grpPortForma.Visible    := (rgrpDescBanco.ItemIndex = 0);

  if (qryContribuicao.FieldByName('CODPORTFORMA').AsInteger > 0) and
     (qryForma.Locate('CODPORTFORMA',qryContribuicao.FieldByName('CODPORTFORMA').AsInteger,[loCaseInsensitive]))
  then dblkpcmbPortForma.Text  := qryForma.FieldByName('NOME').AsString
  else dblkpcmbPortForma.Text  := '';
end;



procedure TfrmControleIndivContrib.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  pgctrlCobrancas.ActivePage := tbsGrid;
  tbsResult.TabVisible  := False;
  tbsAlterar.TabVisible := False;
  tbsMotivo.TabVisible  := False;
end;

procedure TfrmControleIndivContrib.bbtnOkDetClick(Sender: TObject);
begin
   if cOperacao = 'A'
   then ProcessaAlteracao
   else if cOperacao = 'D'
   then ProcessaDevolucao
   else ProcessaEstorno;
end;

procedure TfrmControleIndivContrib.rgrpDescBancoClick(Sender: TObject);
begin
  inherited;
  grpPortForma.Visible := (rgrpDescBanco.ItemIndex = 0);
end;



procedure TfrmControleIndivContrib.tbButtonCancelarClick(Sender: TObject);
var
  bAlgumaSelecionada  : boolean;
  sDocumentosSel      : string;
  sNumRecebSel        : string;
  bEncontrou          : boolean;
  sDocAux             : String;
  sSQL, sMsg          : string;
begin
  inherited;

  cOperacao := 'C';
  
  frmAguarde.Mostra('Verificando contribuições selecionadas ... ');
  // Verificar se alguma contribuicao foi selecionada
  // E para cada uma das selecionadas verificar se ela
  // já foi enviada
  memResult.Lines.Clear;
  qryContribuicao.DisableControls;
  qryContribuicao.First;
  bAlgumaSelecionada := False;
  sDocumentosSel     := '';
  sNumRecebSel       := '';

  while not qryContribuicao.Eof do
  begin
     if qryContribuicao.FieldByName('FlgSelecionado').AsInteger = 1
     then begin
        bAlgumaSelecionada := True;
        // Se o usuario selecionou uma contribuicao ainda não enviada -> msgErro
        if (qryContribuicao.FieldByName('SitRecebimento').AsInteger = 0)
        then begin
           frmAguarde.Apaga;
           MsgDlg('A contribuição '+qryContribuicao.FieldByName('Nome').AsString+
                  ' referente ao mês '+qryContribuicao.FieldByName('MesReferencia').AsString+
                  ' ainda não foi enviada para cobrança. '+#13+
                  'Caso deseje enviá-la, utilize a operação "Enviar". ',
                  'Informação',mtInformation,[mbOk,mbHelp],0);
           qryContribuicao.EnableControls;
           Exit;
        end;

        if (qryContribuicao.FieldByName('CODDOCUMENTOPREV').AsString <> '' ) and
           (Pos(qryContribuicao.FieldByName('CODDOCUMENTOPREV').AsString, sDocumentosSel) <= 0)
        then begin
           if Trim(sDocumentosSel) = ''
           then sDocumentosSel := qryContribuicao.FieldByName('CODDOCUMENTOPREV').AsString
           else sDocumentosSel := sDocumentosSel +','+qryContribuicao.FieldByName('CODDOCUMENTOPREV').AsString;

          // --------------------------------------------------------------------------------------
          // André Pontes - 27/12/2007 - pendência 26613
          sSQL :=
          'SELECT STATUS, EMISBLOQ FROM DOCUMENTO WHERE CODDOCUMENTO = ' + qryContribuicao.FieldByName('CODDOCUMENTOPREV').AsString;

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Text := sSQL;
          qryAux.Open;

          if not(qryAux.IsEmpty) then
          begin
            if trim(qryAux.FieldByName('STATUS').AsString) = '2' then
            begin
              sMsg := 'O documento ' + qryContribuicao.FieldByName('CODDOCUMENTOPREV').AsString +
                      ' já está baixado, e não pode ser desfeito.';

              frmAguarde.Apaga;
              Repaint;

              MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
              Repaint;

              qryContribuicao.EnableControls;

              Exit;
            end;

            if trim(qryAux.FieldByName('EMISBLOQ').AsString) = 'S' then
            begin
              sMsg := 'O documento ' + qryContribuicao.FieldByName('CODDOCUMENTOPREV').AsString +
                      ' já está enviado, e não pode ser desfeito.';

              frmAguarde.Apaga;
              Repaint;

              MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
              Repaint;

              qryContribuicao.EnableControls;

              Exit;
            end;

            qryAux.Close;
          end;
          // FIM André Pontes - 27/12/2007 - pendência 26613
          // --------------------------------------------------------------------------------------
        end;

        if (Pos(qryContribuicao.FieldByName('NUMRECEBIMENTO').AsString, sNumRecebSel) <= 0)
        then begin
           if Trim(sNumRecebSel) = ''
           then sNumRecebSel := qryContribuicao.FieldByName('NUMRECEBIMENTO').AsString
           else sNumRecebSel := sNumRecebSel +','+qryContribuicao.FieldByName('NUMRECEBIMENTO').AsString;
        end;
     end;

     qryContribuicao.Next;
  end; // while not qryContribuicao.Eof

  qryContribuicao.EnableControls;
  frmAguarde.Apaga;

  if not bAlgumaSelecionada
  then begin
     qryContribuicao.First;
     MsgDlg('Selecione alguma contribuição. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  if Trim(sDocumentosSel) <> ''
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT COUNT(*) AS TOTAL '+
                    ' FROM   DOCUMENTO         '+
                    ' WHERE  CODGRUPOCNAB IN ( SELECT DISTINCT CODGRUPOCNAB FROM DOCUMENTO WHERE CODDOCUMENTO IN ('+sDocumentosSel+') )'+
                    ' AND    CODDOCUMENTO NOT IN ('+sDocumentosSel+') ');
     qryAux.Open;
     if (not qryAux.IsEmpty) and (qryAux.FieldByName('TOTAL').AsInteger > 0)
     then begin
        qryContribuicao.First;
        MsgDlg('Os documentos selecionados estão agrupadas com outros documentos não selecionados.'+#13+
               'Não é permitido desfazer um envio para o Contas a Receber parcialmente.'+#13+
               'Selecione todos os documentos do grupo e refaça a operação.','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
     end;

     //verificar se os documentos já foram enviados para o banco
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT CODDOCUMENTO '+
                    ' FROM   DOCUMENTO         '+
                    ' WHERE  CODDOCUMENTO IN ('+sDocumentosSel+') '+
                    ' AND    EMISBLOQ = ''S'' ');
     qryAux.Open;
     if (not qryAux.IsEmpty)
     then begin
        sDocAux := '';
        while not qryaux.eof do
        begin
           if sDocAux = '' then
              sDocAux := qryAux.FieldByName('CODDOCUMENTO').AsString
           else sDocAux := sDocAux +','+qryAux.FieldByName('CODDOCUMENTO').AsString;
           qryaux.next;
        end;


        qryContribuicao.First;
        MsgDlg('O(s) documento(s) '+sDocAux+' já foram enviados ao banco enão podem ser desfeitos.','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
     end;

     bEncontrou := False;
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT COUNT(HOUTROS.NUMRECEBIMENTO) AS TOTAL                                                   '+
                    ' FROM   HSTCONTRIBPREV HOUTROS, LANCTODOCUM L                                                    '+
                    ' WHERE  HOUTROS.IDPESSOA       = '+qryContribuicao.FieldByName('IDPESSOA').AsString               +
                    ' AND    L.CODDOCUMENTO         = HOUTROS.CODDOCUMENTOPREV                                        '+
                    ' AND    HOUTROS.NUMRECEBIMENTO NOT IN ('+sNumRecebSel+')                                         '+
                    ' AND    L.PLNCODIGO IN ( SELECT L2.PLNCODIGO                                                     '+
                    '                         FROM   HSTCONTRIBPREV H, LANCTODOCUM L2                                 '+
                    '                         WHERE  H.IDPESSOA = '+qryContribuicao.FieldByName('IDPESSOA').AsString   +
                    '                         AND    H.NUMRECEBIMENTO IN ('+sNumRecebSel+')                        '+
                    '                         AND    L2.CODDOCUMENTO = H.CODDOCUMENTOPREV )                           ');
     qryAux.Open;
     if (not qryAux.IsEmpty) and (qryAux.FieldByName('TOTAL').AsInteger > 0)
     then bEncontrou := True
     else begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT COUNT(HOUTROS.NUMRECEBIMENTO) AS TOTAL                                                   '+
                       ' FROM   HSTCONTRIBPREV HOUTROS                                                                   '+
                       ' WHERE  HOUTROS.IDPESSOA       = '+qryContribuicao.FieldByName('IDPESSOA').AsString               +
                       ' AND    HOUTROS.NUMRECEBIMENTO NOT IN ('+sNumRecebSel+')                                         '+
                       ' AND    HOUTROS.PLNCODIGOPREV IN ( SELECT L2.PLNCODIGO                                           '+
                       '                         FROM   HSTCONTRIBPREV H, LANCTODOCUM L2                                 '+
                       '                         WHERE  H.IDPESSOA = '+qryContribuicao.FieldByName('IDPESSOA').AsString   +
                       '                         AND    H.NUMRECEBIMENTO IN ('+sNumRecebSel+')                        '+
                       '                         AND    L2.CODDOCUMENTO = H.CODDOCUMENTOPREV )                           ');
        qryAux.Open;
        if (not qryAux.IsEmpty) and (qryAux.FieldByName('TOTAL').AsInteger > 0)
        then bEncontrou := True
     end;

     if bEncontrou
     then begin
        qryContribuicao.First;
        MsgDlg('As contribuições selecionadas foram enviadas em uma única operação e estão contabilizadas em uma única planilha, '+
               'juntamente com outras contribuições não selecionadas. '+#13+
               'Não é permitido desfazer um envio para o Contas a Receber parcialmente.'+#13+
               'Selecione todas as contribuições do grupo e refaça a operação.','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
     end;

  end;

  if MsgDlg('Confirma o cancelamento das contribuições selecionadas ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
  then Exit;

  edMotivo.Text := '';
  tbsMotivo.TabVisible  := True;
  pgctrlCobrancas.ActivePage := tbsMotivo;

end;

procedure TfrmControleIndivContrib.pgctrlCobrancasChange(Sender: TObject);
begin
  inherited;
  if pgctrlCobrancas.ActivePage = tbsAlteradores
  then begin
     lblContrib2.Caption      := qryContribuicao.FieldByName('NomeContrib').AsString+
                         '['+qryContribuicao.FieldByName('MesReferencia').AsString+']'+
                         ' = '+FormatFloat('#0.00', qryContribuicao.FieldByName('ValorEsperado').AsFloat);
     qryAlteradores.Close;
     qryAlteradores.ParamByName('NumRecebimento').AsInteger := qryContribuicao.FieldByName('NumRecebimento').AsInteger;
     qryAlteradores.Open;
  end
  else begin
     lblContrib.Caption := qryContribuicao.FieldByName('NomeContrib').AsString+
                         '['+qryContribuicao.FieldByName('MesReferencia').AsString+']'+
                         ' = '+FormatFloat('#0.00', qryContribuicao.FieldByName('ValorEsperado').AsFloat);
  end;
end;



procedure TfrmControleIndivContrib.qryContribuicaoCalcFields(DataSet: TDataSet);
begin
  inherited;

  if qryContribuicao.FieldByName('FlgDescFolha').AsInteger = 1
  then qryContribuicao.FieldByName('TipoPgmto').AsString := 'Folha'
  else qryContribuicao.FieldByName('TipoPgmto').AsString := 'Banco';
end;



procedure TfrmControleIndivContrib.Excluir1Click(Sender: TObject);
begin
  inherited;
  if qryAlteradores.isempty then exit;

  if (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 0) and // nao enviada
     (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 4) and // diverg. tratada
     (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 8)     // cancelada
  then begin
    MsgDlg('A contribuição selecionada já foi enviada para cobrança. '+#13+
           'Caso deseje apagá-la, utilize a operação "Cancelar" antes da operação "Excluir". ',
           'Informação',mtInformation,[mbOk,mbHelp],0);
    Exit;
  end;

  if MsgDlg('Deseja realmente excluir este alterador ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
  then Exit;
  frmAguarde.Mostra('Excluindo alterador ... ');
  qryAux.Close;
  qryAux.SQL.Clear;

  qryAux.SQL.Add(' DELETE FROM HSTATRASOCONTRIB '+
                 ' WHERE  (MESREFERENCIA  = '''+qryAlteradores.FieldByName('MESREFERENCIA').AsString +''') '+
                 ' AND    (NUMRECEBIMENTO = '+qryAlteradores.FieldByName('NUMRECEBIMENTO').AsString  +') '+
                 ' AND    (MESCOBRANCA    = '''+qryAlteradores.FieldByName('MESCOBRANCA').AsString   +''') '+
                 ' AND    (IDMOTIVO       = '+qryAlteradores.FieldByName('IDMOTIVO').AsString        +') '+
                 ' AND    (CODALTERADOR   = '+qryAlteradores.FieldByName('CODALTERADOR').AsString    +') '+
                 ' AND    (FLGTIPO        = '''+qryAlteradores.FieldByName('FLGTIPO').AsString       +''') ');
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        frmAguarde.Apaga;
        MostrarErro(E);
        Exit;
     end;
  end;


  frmAguarde.Apaga;

  qryAlteradores.Close;
  qryAlteradores.ParamByName('NumRecebimento').AsInteger := qryContribuicao.FieldByName('NumRecebimento').AsInteger;
  qryAlteradores.Open;
end;



procedure TfrmControleIndivContrib.Inserir1Click(Sender: TObject);
begin
  inherited;
  // SOL 199846 KTN 1923897 Otacilio ** Inicio **
  If qryContribuicao.IsEmpty then
  Begin
    MsgDlg('Não existe contribuição a ser alterada.', 'Atenção', mtWarning, [mbOK],0);
    Exit;
  End;
  // SOL 199846 KTN 1923897 Otacilio ** Fim **

  if qryContribuicao.FieldByName('valorrecebido').AsFloat > 0  then
  begin
    MsgDlg('A contribuição selecionada já foi recebida.',
           'Informação',mtInformation,[mbOk,mbHelp],0);
    Exit;
  end;

  if qryContribuicao.FieldByName('flgdescfolha').AsInteger = 1 then
  begin
     if (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 0) and // nao enviada
        (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 4) and // diverg. tratada
        (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 8)     // cancelada
     then begin
        MsgDlg('A contribuição selecionada já foi enviada para cobrança. '+#13+
           'Caso deseje inserir mais um alterador, utilize a operação "Cancelar" antes da operação "Inserir". ',
           'Informação',mtInformation,[mbOk,mbHelp],0);
        Exit;
     end;
  end
  else
  begin
     if (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 0) and // nao enviada
        (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 4) and // diverg. tratada
        (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 8)     // cancelada
     then begin
        if MsgDlg('A contribuição selecionada já foi enviada para cobrança. '+#13+
           'A Inserção dos valores pode causar erros no recebimento dos documentos pelo Contas a Receber. '+#13+
           'Deseja alterar mesmo assim ?',
           'Informação',mtWarning ,[mbYes,mbNo],0)= mrno then Exit;
     end;
  end;


  qrytipoalterador.close;

  if rgrpTipoAlterador.itemindex = 0 then
  qrytipoalterador.parambyname('recpag').AsString := 'R'
  else  qrytipoalterador.parambyname('recpag').AsString := 'P';

  qrytipoalterador.parambyname('idplanoprev').AsString := qryContribuicao.FieldByName('idplanoprev').AsString;
  qrytipoalterador.parambyname('idcontribuicao').AsString := qryContribuicao.FieldByName('idcontribuicao').AsString;
  qrytipoalterador.open;


  pnlAlteradores.BringToFront;
  dblkpcmbTipoAlterador.Enabled := True;
  dblkpcmbTipoAlterador.Text    := '';
  cOperacaoAlterador := 'I'; // Inserção
end;

procedure TfrmControleIndivContrib.Alterar1Click(Sender: TObject);
begin
  inherited;

  if qryAlteradores.isempty then exit;

  if qryContribuicao.FieldByName('valorrecebido').AsFloat > 0  then
  begin
    MsgDlg('A contribuição selecionada já foi recebida.',
           'Informação',mtInformation,[mbOk,mbHelp],0);
    Exit;
  end;

  if qryContribuicao.FieldByName('flgdescfolha').AsInteger = 1 then
  begin
     if (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 0) and // nao enviada
        (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 4) and // diverg. tratada
        (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 8)     // cancelada
     then begin
        MsgDlg('A contribuição selecionada já foi enviada para cobrança. '+#13+
           'Caso deseje inserir mais um alterador, utilize a operação "Cancelar" antes da operação "Inserir". ',
           'Informação',mtInformation,[mbOk,mbHelp],0);
        Exit;
     end;
  end
  else
  begin
     if (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 0) and // nao enviada
        (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 4) and // diverg. tratada
        (qryContribuicao.FieldByName('SitRecebimento').AsInteger <> 8)     // cancelada
     then begin
        if MsgDlg('A contribuição selecionada já foi enviada para cobrança. '+#13+
           'A alteração dos valores pode causar erros no recebimento dos documentos pelo Contas a Receber. '+#13+
           'Deseja alterar mesmo assim ?',
           'Informação',mtWarning ,[mbYes,mbNo],0)= mrno then Exit;
     end;
  end;



  qrytipoalterador.close;

  if rgrpTipoAlterador.itemindex = 0 then
  qrytipoalterador.parambyname('recpag').AsString := 'R'
  else  qrytipoalterador.parambyname('recpag').AsString := 'P';

  qrytipoalterador.parambyname('idplanoprev').AsString := qryContribuicao.FieldByName('idplanoprev').AsString;
  qrytipoalterador.parambyname('idcontribuicao').AsString := qryContribuicao.FieldByName('idcontribuicao').AsString;
  qrytipoalterador.open;



  pnlAlteradores.BringToFront;
  cOperacaoAlterador := 'A'; // Alteracao

  // Preencher tela
  if qryTipoAlterador.Locate('CodAlterador',qryAlteradores.FieldByName('CodAlterador').AsInteger,[loCaseInsensitive])
  then dblkpcmbTipoAlterador.Text := qryTipoAlterador.FieldByName('Descricao').AsString
  else begin
     MsgDlg('Alterador não encontrado. ','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  // SOL 199846 KTN 1923897 Otacilio
  //dblkpcmbTipoAlterador.Enabled := False;
  edValorAlterador.Text := ClienteNumero(qryAlteradores.FieldByName('Valor').AsString);
  if qryAlteradores.FieldByName('flgtipo').AsString = 'A'
  then rgrpTipoAlterador.ItemIndex := 0
  else rgrpTipoAlterador.ItemIndex := 1;
end;



procedure TfrmControleIndivContrib.bbtnOkAlteradorClick(Sender: TObject);
var
  sTipo, sMsgErro : string;
  iPlnCodigo : LongInt;
begin
  inherited;

  // verificar campos obrigatorios
  if Trim(dblkpcmbTipoAlterador.Text) = ''
  then begin
     MsgDlg('Preencha o tipo de alterador.','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  if Trim(edValorAlterador.Text) = ''
  then begin
     MsgDlg('Preencha o valor do alterador.','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  if rgrpTipoAlterador.ItemIndex = 0
  then sTipo := 'A'
  else sTipo := 'D';

  qryAux.Close;
  qryAux.SQL.Clear;
  if cOperacaoAlterador = 'I' // inserção
  then begin
     qryAux.SQL.Add(' INSERT INTO HSTATRASOCONTRIB (MESREFERENCIA,  MESCOBRANCA,   '+
                    '             NUMRECEBIMENTO,  IDMOTIVO, VALOR, CODALTERADOR,  '+
                    '             FLGTIPO,     FLGRETROATIVO,   FLGEVENTO)         '+
                    ' VALUES ('''+ qryContribuicao.FieldByName('MesReferencia').AsString +''' , '+
                             ''''+ qryContribuicao.FieldByName('MesCobranca').AsString   +''', '+
                                   qryContribuicao.FieldByName('NumRecebimento').AsString+', '+
                                   qryContribuicao.FieldByName('IdMotivo').AsString      +', '+
                                   OraNumero(Trim(edValorAlterador.Text))                +', '+
                                   qryTipoAlterador.FieldByName('CodAlterador').AsString +', '+
                             ''''+ sTipo                                                 +''', '+
                             '0 '                                                        +', '); //89410
                                   //qryContribuicao.FieldByName('FlgEvento').AsString + ')'); //89410

     //89410 - início
     if(qryContribuicao.FieldByName('FlgEvento').AsString = EmptyStr) then
        qryAux.SQL.Add('0)')
     else
        qryAux.SQL.Add(qryContribuicao.FieldByName('FlgEvento').AsString + ')');
     //89410 - fim

     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;

     if qryContribuicao.FieldByName('coddocumentoprev').AsInteger > 0 then
     begin
        if not GeraAlteradorBANCO ( CtrlDocumento,   
                                    qryAux,
                                    qryContabil,   
                                    qryDocumentos, 
                                    qryContribuicao.FieldByName('coddocumentoprev').AsInteger,
                                    qryTipoAlterador.FieldByName('CodAlterador').AsInteger,
                                    StrToFloat(ClienteNumero(Trim(edValorAlterador.Text))),
                                    qryContribuicao.FieldByName('DataPrevisaoRece').AsString,
                                    sTipOperEnvio,
                                    qryContribuicao.FieldByName('IdPessJur').AsInteger,
                                    qryContribuicao.FieldByName('IdPlanoPrev').AsInteger,
                                    qryContribuicao.FieldByName('IdPessoa').AsInteger,
                                    qryContribuicao.FieldByName('IdContribuicao').AsInteger,
                                    -1,
                                    sMsgErro,
                                    qryContribuicao.FieldByName('IDSITPART').AsString,        
                                    qryContribuicao.FieldByName('NUMRECEBIMENTO').AsInteger,  
                                    qryContribuicao.FieldByName('MESREFERENCIA').AsString)    
        then begin
          Exit;
        end;
     end;
  end
  else begin // alteração
     qryAux.SQL.Add(' UPDATE HSTATRASOCONTRIB '+
                    ' SET    VALOR   = '+OraNumero(Trim(edValorAlterador.Text))          +', '+
                    '        FLGTIPO = '''+sTipo+''''+
                    ' WHERE  MESREFERENCIA  = '''+ qryContribuicao.FieldByName('MesReferencia').AsString +''''+
                    ' AND    MESCOBRANCA    = '''+ qryContribuicao.FieldByName('MesCobranca').AsString   +''''+
                    ' AND    NUMRECEBIMENTO =   '+ qryContribuicao.FieldByName('NumRecebimento').AsString+
                    ' AND    IDMOTIVO       =   '+ qryContribuicao.FieldByName('IdMotivo').AsString      +
                    ' AND    CODALTERADOR   =   '+ qryAlteradores.FieldByName('CodAlterador').AsString );
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;

     if qryContribuicao.FieldByName('coddocumentoprev').AsInteger >0  then
     begin
        qryaux.close;
        qryaux.SQL.text := ' SELECT '+
                           ' L.CODDOCUMENTO  , L.NUMLANCTO     , L.CODALTERADOR  , '+
                           ' L.PLNCODIGO     , L.DATALANCTO    , '+
                           ' L.VALOR         , L.VALOROUTRAMOEDA, L.DEBCRE         , '+
                           ' L.OPERACAO       , L.HISTORICOCOMPL , '+
                           ' L.IDUSUARIOINCLUSAO, L.ESTORNO  , D.CODPORTFORMA '+
                           ' FROM LANCTODOCUM L, DOCUMENTO D '+
                           ' WHERE D.CODDOCUMENTO = '+qryContribuicao.FieldByName('CODDOCUMENTOPREV').AsString+' '+
                           ' AND L.CODDOCUMENTO = D.CODDOCUMENTO '+
                           ' AND L.CODALTERADOR = '+qryAlteradores.FieldByName('CODALTERADOR').AsString+' '+
                           ' AND L.VALOR = '+oranumero(qryAlteradores.FieldByName('VALOR').AsString)+' ';
        qryaux.open;

        if not qryaux.IsEmpty then
        begin
           iPlnCodigo := qryaux.fieldbyname('plncodigo').AsInteger;

           CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
           CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;
           CtrlDocumento.IdUsuario   := Sistema.IdUsuario;   

           CtrlDocumento.LanctoDocum.SetValues( qryAux.FieldByName('DATALANCTO').AsDateTime, // DataLancto
                                                qryAux.FieldByName('CODDOCUMENTO').AsInteger,         // CodDocumento
                                                qryAux.FieldByName('NUMLANCTO').AsInteger,                      // Numlancto
                                                StrToFloat(ClienteNumero(Trim(edValorAlterador.Text))),                 // Vlrliquido
                                                qryAux.FieldByName('VALOROUTRAMOEDA').AsFloat,                      // ValorOM
                                                StrToFloat(ClienteNumero(Trim(edValorAlterador.Text))),                 // Valor
                                                prmUnidNegoc,           // Unidnegoc      
                                                iPlnCodigo,             // liPlncodigo
                                                -1,                     // Numlotemanual
                                                Sistema.IdUsuario,      // Idusuarioinclusao
                                                Sistema.IdEmpresa,      // Idpessoa
                                                -1,                     // Idnflivro,
                                                qryAux.FieldByName('ESTORNO').AsInteger,                     // Estorno
                                                -1,                     // Codtipdoc
                                                -1,                     // Coddocinss
                                                qryAux.FieldByName('CODALTERADOR').AsInteger,         // Codalterador
                                                '4',                    // Operacao
                                                '',                     // NumRecibo
                                                '',                     // Numnf
                                                '',                     // Numfatura
                                                qryAux.FieldByName('HISTORICOCOMPL').AsString,// Historicocompl
                                                '',                     // Flgtipofatura
                                                'N',                    // Flgrecebeunf
                                                '',                     // Flgfatemitida
                                                qryAux.FieldByName('DEBCRE').AsString,                // Debcre
                                                Sistema.IdModulo,       // IdModulo
                                                IntegraBack.Plano,      // PlanoConta
                                                True,                   // UsaPlanoPatro
                                                False,                  // Contabiliza
                                                qryAux.FieldByName('CODPORTFORMA').AsInteger,                     // iCodPortForma
                                                0,                      //  DiasFloat
                                                '',                     // ContaBaixa
                                                0                       // SubContaBaixa
                                               );
           if not CtrlDocumento.Update
           then begin
              sMsgErro := 'Erro na Geração do Lançamento do Alterador no Contas a Receber.';
              Exit;
           end;
        end;
     end;

  end;

  if qryContribuicao.FieldByName('coddocumentoprev').AsInteger >0 then
  begin
     try
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE DOCUMENTO SET EMISBLOQ = ''N'' '+
                       ' WHERE  CODDOCUMENTO = '+IntToSTr(qryContribuicao.FieldByName('coddocumentoprev').AsInteger));
        qryAux.ExecSQL;
     except
        sMsgErro := 'Erro na atualização do Documento no Contas a Receber';
        Exit;
     end;
  end;

  try
  except
  end;

  qryAlteradores.Close;
  qryAlteradores.ParamByName('NumRecebimento').AsInteger := qryContribuicao.FieldByName('NumRecebimento').AsInteger;
  qryAlteradores.Open;
  pnlAlteradores.SendToBack;

  if qryPendente.IsEmpty then //Helio - SOL Nº 253577/17461 PPM Nº 955564
       AbreQryContribuicao('')
  //Inicio - Helio - SOL Nº 253577/17461 PPM Nº 955564
  else
       AbreQryContribuicaoPendente('');
  //Fim - Helio - SOL Nº 253577/17461 PPM Nº 955564

end;

procedure TfrmControleIndivContrib.bbtnCancelaAlteradorClick(Sender: TObject);
begin
  inherited;
  qryAlteradores.Close;
  qryAlteradores.ParamByName('NumRecebimento').AsInteger := qryContribuicao.FieldByName('NumRecebimento').AsInteger;
  qryAlteradores.Open;
  pnlAlteradores.SendToBack;
end;



procedure TfrmControleIndivContrib.bbtnOKDesfazerClick(Sender: TObject);
var
    rEstorno       : double;
    iOrdem         : integer;

    sMsgErro,
    sCamposObrig,
    sCamposNObrig  : string;
    iPlnCodigo,
    iUltimaContrib : longint;

    bExigeFinanc,
    bOk            : boolean;

    sNumDocumento  : string;

    bContabilizaNoEnvio : Boolean;
begin
  inherited;

  frmAguarde.Mostra('Cancelando contribuições ...');
  dtmBaseDados.dbBaseDados.StartTransaction;

  bOk       := True;
  rEstorno := 0;
  iOrdem := 1;
  iultimacontrib := -1;

  qryContribuicao.First;
  while not qryContribuicao.Eof do
  begin
     if qryContribuicao.FieldByName('FlgSelecionado').AsInteger = 0
     then begin
        qryContribuicao.Next;
        continue;
     end;

     sCamposObrig := '';

     sNumDocumento := OraNumero(qryContribuicao.FieldbyName('CODDOCUMENTOPREV').AsString);



     //Renato Visoni SOL 129675 Kintana 713813
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV SET CODDOCUMENTOPGAPAGAR = NULL ,CODDOCUMENTOPGARECEBER = NULL');
     qryAux.SQL.Add(' ,  IDPLANPREVCONTAB   = '+ qryContribuicao.FieldByName('IDPLANPREVCONTAB').AsString);  //Higor Nayde 162126*RE01 KINTANA 792563
     qryAux.SQL.Add(' WHERE  CODDOCUMENTOPREV  = '+ sNumDocumento);

     try
        qryAux.ExecSQL;
     except
        memResult.Lines.Add(' Erro na atualização dos documentos PGA ');
        bOk := False;
        iultimacontrib := qryContribuicao.FieldByName('IdContribuicao').AsInteger;
        qryContribuicao.Next;
        Continue;
     end;
     //Renato Visoni SOL 129675 Kintana 713813



     // ************************************************************************
     // Desfazer TODAS as contribuicoes que tenham o mesmo CODDOCUMENTO
     // ************************************************************************
     // Atualizar sitrecebimento para 8 (cancelado e pode reenviar)
     qryAux.Close;
     qryAux.SQL.Clear;
     if (qryContribuicao.FieldByName('FlgDescFolha').AsInteger = 0) and
        (StrToInt(sNumDocumento) > 0 )
     then begin
        qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO   = 0,           '+
                       '                           CODDOCUMENTOPREV = NULL,        '+
                       '                           VALORRECEBIDO    = NULL,        '+
                       '                           DATARECEBIMENTO  =  NULL,       '+
                       '                           DATAEMISSCOB     = NULL,        '+
                       '                           DATACANCELAMENTO = SYSDATE    ');

        if Trim(edMotivo.Text) <> ''
        then qryAux.SQL.Add(' , MOTIVOCANCEL     = '''+Trim(edMotivo.Text)+'''' )
        else qryAux.SQL.Add(' , MOTIVOCANCEL     = NULL '                       );
        qryAux.SQL.Add(' ,  IDPLANPREVCONTAB   = '+ qryContribuicao.FieldByName('IDPLANPREVCONTAB').AsString);

        qryAux.SQL.Add(' WHERE  MESCOBRANCA    = '''+qryContribuicao.FieldByName('MesCobranca').AsString+''''+
                       ' AND    CODDOCUMENTOPREV = '+sNumDocumento);
     end
     else begin
        qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO   = 0,           '+
                       '                           CODDOCUMENTOPREV = NULL,        '+
                       '                           VALORRECEBIDO    = NULL,        '+
                       '                           DATARECEBIMENTO  =  NULL,       '+
                       '                           DATAEMISSCOB     = NULL,        '+
                       '                           DATACANCELAMENTO = SYSDATE    ');
        if Trim(edMotivo.Text) <> ''
        then qryAux.SQL.Add(' , MOTIVOCANCEL     = '''+Trim(edMotivo.Text)+'''' )
        else qryAux.SQL.Add(' , MOTIVOCANCEL     = NULL '                       );

        qryAux.SQL.Add(' ,  IDPLANPREVCONTAB   = '+ qryContribuicao.FieldByName('IDPLANPREVCONTAB').AsString);  //Higor Nayde 162126*RE01 KINTANA 792563
        qryAux.SQL.Add(' WHERE  (NUMRECEBIMENTO  = '+qryContribuicao.FieldByName('NumRecebimento').AsString+')'+
                       ' AND    (MESCOBRANCA     = '''+qryContribuicao.FieldByName('MesCobranca').AsString+''')'+
                       ' AND    (IDMOTIVO        = '+qryContribuicao.FieldByName('IdMotivo').AsString+')');
     end;

     try
        qryAux.ExecSQL;
     except
        memResult.Lines.Add(' Erro na atualização da situação da contribuição ');
        bOk := False;
        iultimacontrib := qryContribuicao.FieldByName('IdContribuicao').AsInteger;
        qryContribuicao.Next;
        Continue;
     end;

     if qryContribuicao.FieldByName('FlgDescFolha').AsInteger = 0
     then begin
        qryAux.Close;
        qryAux.SQL.Clear;
        // APAGAR A CONTABCONTFUND. O LANCAMENTO DA PLANILHA SERÁ DESFEITO
        // NA ESTORNACONTRIBUICAOBANCO
        qryAux.SQL.Add(' DELETE FROM CONTABCONTFUND '+
                       ' WHERE  NUMRECEBIMENTO      = '+ qryContribuicao.FieldByName('NUMRECEBIMENTO').AsString);
        try
           qryAux.ExecSQL;
        except
           bOk := False;
        end;
     end;

     
     If (qryContribuicao.FieldByName('FlgDescFolha').AsInteger = 0) And
        (StrToInt(sNumDocumento) > 0 )
      Then Begin
        
        Try
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add('UPDATE DOCUMENTO ');
          qryAux.SQL.Add('SET EMISBLOQ = '+QuotedStr('N'));
          qryAux.SQL.Add('WHERE CODDOCUMENTO = '+qryContribuicao.FieldByName('CodDocumentoPrev').AsString);
          qryAux.SQL.Add('  AND EMISBLOQ <> '+QuotedStr('N'));
          qryAux.ExecSQL;
        Except
          memResult.Lines.Add('[ERRO  ] Documento No. '+qryContribuicao.FieldByName('CodDocumentoPrev').AsString+#13#10+
                              'Erro ao atualizar emissão de bloqueto no documento.');
          Exit;
        End;
        
      End;
     

     if qryContribuicao.FieldByName('FlgDescFolha').AsInteger = 1
     then begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' DELETE FROM TMPDESC '+
                       ' WHERE  IDPESSJUR     = '+ qryContribuicao.FieldByName('IDPESSJUR').AsString+
                       ' AND    IDPLANOPREV   = '+ qryContribuicao.FieldByName('IDPLANOPREV').AsString+
                       ' AND    IDPESSOA      = '+ qryContribuicao.FieldByName('IDPESSOA').AsString+
                       ' AND    SEQPROPOSTA   = '+ qryContribuicao.FieldByName('SEQPROPOSTA').AsString+
                       ' AND    IDDESCONTO    = '+ qryContribuicao.FieldByName('IDCONTRIBUICAO').AsString+
                       ' AND    MESREFERENCIA = '''+ qryContribuicao.FieldByName('MESREFERENCIA').AsString+''''+
                       ' AND    MESCOBRANCA   = '''+ qryContribuicao.FieldByName('MESCOBRANCA').AsString+''''+
                       ' AND    IDMOTIVO      = '+ qryContribuicao.FieldByName('IDMOTIVO').AsString);
        try
           qryAux.ExecSQL;
        except
           bOk := False;
        end;

     end
     else begin
        bOK   := EstornaContribuicaoBANCO (CtrlDocumento,
                                           CtrlLancamento,
                                           qryContribuicao.FieldByName('CodDocumentoPrev').AsInteger,
                                           qryAux, qryAux2,
                                           qryContribuicao.FieldByName('MesReferencia').AsString,
                                           sMsgErro);

     end;

     if not bOk
     then begin
        memResult.Lines.Add('Erro no estorno ['+sMsgErro+']');
        iultimacontrib := qryContribuicao.FieldByName('IdContribuicao').AsInteger;
        qryContribuicao.Next;
        Continue;
     end;

     iultimacontrib :=   qryContribuicao.FieldByName('IdContribuicao').AsInteger;
     inc(iOrdem);

     GravaLogTOTALPREV ('Controle Indiv.-Desfazer-Matr.'+lblMatricula.Caption+'-'+
                        'Mês Cob.:'+qryContribuicao.FieldByName('MesCobranca').AsString+'-'+
                        'Mês Ref.:'+qryContribuicao.FieldByName('MesReferencia').AsString+'-'+
                        'Cód.:'+qryContribuicao.FieldByName('IdContribuicao').AsString+'-'+
                        'Num Rec.:'+qryContribuicao.FieldByName('NumRecebimento').AsString);

     qryContribuicao.Next;
  end;
  frmAguarde.Apaga;

  try
  except
  end;

  if bOk
  then begin

     Try
       If Not Sistema.GravaLogOperacoes(Copy(Self.Caption + ' - Cancelamento de Contribuições',1,100)) Then
         raise exception.Create('Erro ao gravar Log.')
     Except
     End;

    dtmBaseDados.dbBaseDados.Commit;
    memResult.Lines.Add(' - Cancelamento de Contribuições efetuado com sucesso - ');
    MsgDlg('Cancelamento de Contribuições efetuado com sucesso. ','Informação',mtInformation,[mbOk,mbHelp],0)
  end
  else
  begin
    MsgDlg('Cancelamento de Contribuições encontrou alguns problemas. Processo será cancelado.',
           'Erro',mtError,[mbOk],0);
    dtmBaseDados.dbBaseDados.RollBack;

    memResult.Lines.Add(' - Cancelamento de Contribuições com alguns problemas, processo foi cancelado - ');
  end;


  try
     frmAguarde.Mostra('Atualizando situações ...');
     qryContribuicao.Close;
     qryContribuicao.Open;
  finally
     frmAguarde.Apaga;
  end;

  pgctrlCobrancas.ActivePage := tbsResult;
  tbsResult.TabVisible := True;
  tbsAlterar.TabVisible := False;
  tbsMotivo.TabVisible  := False;

end;

procedure TfrmControleIndivContrib.bbtnCancelMotivoClick(Sender: TObject);
begin
  inherited;
  tbsResult.TabVisible  := False;
  tbsAlterar.TabVisible := False;
  tbsMotivo.TabVisible  := False;
  pgctrlCobrancas.ActivePage := tbsGrid;
end;

procedure TfrmControleIndivContrib.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    qryContribuicao.CancelUpdates;
  except
  end;
  FreeAndNil( CtrlDocumento );
  FreeAndNil( CtrlLancamento );

  qryPendente.Close;//Helio - SOL Nº 253577/17461 PPM Nº 955564

  inherited;

end;

procedure TfrmControleIndivContrib.dbgrdContribuicaoCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if (not qryContribuicao.Active) or (qryContribuicao.IsEmpty)
  then Exit;

  if qryContribuicao.FieldByName('SITRECEBIMENTO').AsInteger = 1 then
    AFont.Color := clNavy        // azul = enviado e nao recebido
  else if qryContribuicao.FieldByName('SITRECEBIMENTO').AsInteger = 2 then
    AFont.Color := clTeal        // verde = recebido corretamente
  else if qryContribuicao.FieldByName('SITRECEBIMENTO').AsInteger = 3 then
    AFont.Color := clRed         // vermelho = recebido com divergencia
  else
    AFont.Color := clWindowText  // preto = outras situacoes

end;

procedure TfrmControleIndivContrib.tbButonDevolverClick(Sender: TObject);
var
  sMsg            : string;
  sSQL            : string;
  rTotalRecebido  : double;
begin
  inherited;
  cOperacao := 'D';

  // Verificar se as contribuições selecionadas possuem valorrecebido > 0
  rTotalRecebido := 0;
  qryContribuicao.DisableControls;
  qryContribuicao.First;
  while not qryContribuicao.Eof do
  begin
     if qryContribuicao.FieldByName('FlgSelecionado').AsInteger = 0
     then begin
        qryContribuicao.Next;
        Continue;
     end;

     if (qryContribuicao.FieldByName('SitRecebimento').AsInteger =  0) or
        (qryContribuicao.FieldByName('SitRecebimento').AsInteger =  1) or
        (qryContribuicao.FieldByName('ValorRecebido').AsFloat <= 0 )
     then begin
        MsgDlg('Nas contribuições selecionadas existe(m) contribuição(ões) que não '+
               'possui(em) valor para ser devolvido. Verifique.',
               'Informação',mtInformation,[mbOk,mbHelp],0);
        qryContribuicao.EnableControls;
        Exit;
     end;

     // --------------------------------------------------------------------------------------------

     // CPREV_001
     //sSQL :=
//     'SELECT STATUS, EMISBLOQ FROM DOCUMENTO WHERE CODDOCUMENTO = ' + qryContribuicao.FieldByName('CODDOCUMENTOPREV').AsString;
//
//     qryAux.Close;
//     qryAux.SQL.Clear;
//     qryAux.SQL.Text := sSQL;
//     qryAux.Open;
//
//     if not(qryAux.IsEmpty) then
//     begin
//       if trim(qryAux.FieldByName('STATUS').AsString) = '2' then
//       begin
//         sMsg := 'O documento ' + qryContribuicao.FieldByName('CODDOCUMENTOPREV').AsString +
//                 ' já está baixado, e não pode ser desfeito.';
//
//         frmAguarde.Apaga;
//         Repaint;
//
//         MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
//         Repaint;
//
//         qryContribuicao.EnableControls;
//
//         Exit;
//       end;
//
//       if trim(qryAux.FieldByName('EMISBLOQ').AsString) = 'S' then
//       begin
//         sMsg := 'O documento ' + qryContribuicao.FieldByName('CODDOCUMENTOPREV').AsString +
//                 ' já está enviado, e não pode ser desfeito.';
//
//         frmAguarde.Apaga;
//         Repaint;
//
//         MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
//         Repaint;
//
//         qryContribuicao.EnableControls;
//
//         Exit;
//       end;
//
//       qryAux.Close;
//     end;
     // FIM CPREV_001
     // --------------------------------------------------------------------------------------------

     rTotalRecebido := rTotalRecebido + qryContribuicao.FieldByName('ValorRecebido').AsFloat;

     qryContribuicao.Next;
  end; // while not Eof
  qryContribuicao.EnableControls;

  pgctrlCobrancas.ActivePage := tbsAlterar;
  tbsResult.TabVisible := False;
  tbsMotivo.TabVisible  := False;
  tbsAlterar.TabVisible := True;

  lblContrib.Caption      := 'Devolução de Contribuições';
  lblData.Caption         := 'Data para Devolução';
  rgrpDescBanco.Visible   := True;
  grpPortForma.Visible    := True;

  //Renato Visoni SOL 135980 Kintana 810287
  {
  rgrpRetiraReserva.Visible   := True;
  rgrpRetiraReserva.ItemIndex := -1;
  }
  rgrpRetiraReserva.Visible   := False;
  rgrpRetiraReserva.ItemIndex := 1;
  //Renato Visoni SOL 135980 Kintana 810287

  rgrpDescBanco.Caption   := 'Devolver em Banco ? ';
  grpPortForma.Caption    := 'Forma de Pagamento';
  edValorPrev.Color       := clSilver;
  edValorPrev.ReadOnly    := True;
  dtPrevista.Text         := DateToStr(date);
  edValorPrev.Text        := FormatFloat('0.00',rTotalRecebido);
  rgrpDescBanco.ItemIndex := 0;
  grpPortForma.Visible    := True;
  qryForma.Close;
  qryForma.ParamByName('RecPag').AsString := 'P';
  qryForma.Open;
  dblkpcmbPortForma.Text  := '';
end;

procedure TfrmControleIndivContrib.ProcessaAlteracao;
var sAnoMesCob,
    sSQL,
    sMesRefAnt,
    sMesCobAnt   : string;
    iNumRecebAnt,
    iIdMotivoAnt : longint;
    varfields    : variant;
    bApagouAlteradores : boolean;
begin
  inherited;

  // ABRIR QUERY DE ALTERADORES QUE PODE NAO ESTAR ABERTA
  qryAlteradores.Close;
  qryAlteradores.ParamByName('NumRecebimento').AsInteger := qryContribuicao.FieldByName('NumRecebimento').AsInteger;
  qryAlteradores.Open;

  //se já foi enviado então verificar
  //se o documento já foi baixado no CAR
  //se foi, não deixar continuar
  //se não, avançar
  if (qryContribuicao.FieldByName('SitRecebimento').AsInteger = 1) and
  (qryContribuicao.FieldByName('ValorRecebido').AsFloat = 0) and
  (qryContribuicao.FieldByName('CodDocumentoPrev').AsString <> '') then
  begin
      qryaux.close;
      qryaux.sql.text := ' SELECT 1 FROM DOCUMENTO  '+
                         ' WHERE IDMODULO = '+IntToStr(Sistema.IdModulo)+' '+
                         ' AND CODDOCUMENTO = '+qryContribuicao.FieldByName('CodDocumentoPrev').AsString+' '+
                         ' AND STATUS = ''2'' ';
      qryaux.open;
      if not qryaux.isempty then
      begin
         MsgDlg('O documento já foi baixado no Contas a Receber. A alteração não é possível. ','Erro',mtError,[mbOk,mbHelp],0);
         bbtnCancelarDet.SetFocus;
         Exit;
      end;
  end;

  // Verificar campos em branco
  if Trim(dtPrevista.Text) = ''
  then begin
     MsgDlg('Preencha a Data Prevista para Cobrança. ','Erro',mtError,[mbOk,mbHelp],0);
     dtPrevista.SetFocus;
     Exit;
  end;

  if Trim(edValorPrev.Text) = ''
  then begin
     MsgDlg('Preencha o Valor Previsto para Cobrança. ','Erro',mtError,[mbOk,mbHelp],0);
     edValorPrev.SetFocus;
     Exit;
  end;

  // Preencher o mes de cobranca
  sAnoMesCob := Copy(Trim(dtPrevista.Text),7,4)+'/'+Copy(Trim(dtPrevista.Text),4,2);

  dtmBaseDados.dbBaseDados.StartTransaction;
  // Apagar os alteradores para poder trocar o mes de cobranca
  bApagouAlteradores := False;
  if sAnoMesCob <> qryContribuicao.FieldByName('MesCobranca').AsString
  then begin
     bApagouAlteradores := True;
     qryAux.Close;
     qryAux.SQL.Clear;

     qryAux.SQL.Add(' DELETE FROM HSTATRASOCONTRIB '+
                    ' WHERE (MESREFERENCIA  = '''+qryContribuicao.FieldByName('MesReferencia').AsString+''') '+
                    ' AND   (MESCOBRANCA    = '''+qryContribuicao.FieldByName('MesCobranca').AsString+''')   '+
                    ' AND   (NUMRECEBIMENTO = '  +qryContribuicao.FieldByName('NumRecebimento').AsString+')  '+
                    ' AND   (IDMOTIVO       = '  +qryContribuicao.FieldByName('IdMotivo').AsString+') ');
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           dtmBaseDados.dbBaseDados.RollBack;
           MostrarErro(E);
           Exit;
        end;
     end;
  end;
  // Alterar os dados
  sSQL := ' UPDATE HSTCONTRIBPREV '+
          ' SET DATAPREVISAORECE = TO_DATE('''+Trim(dtPrevista.Text)+''', ''dd/mm/yyyy''), '+
          '     MESCOBRANCA      = '''+Trim(sAnoMesCob)+''', ';

  if rgrpDescBanco.ItemIndex = 0 // Descontar em banco = Sim
  then begin
     sSQL := sSQL + ' FLGDESCFOLHA = 0, ';
     sSQL := sSQL + ' CODPORTFORMA = '''+qryForma.FieldByName('CodPortForma').AsString+''', ';
     sSQL := sSQL + ' FOLHAORIGEM  = ''C'', ';
  end
  else begin
     sSQL := sSQL + ' FLGDESCFOLHA = 1, ';
     sSQL := sSQL + ' CODPORTFORMA = NULL, ';
     sSQL := sSQL + ' FOLHAORIGEM  = ''P'', ';
  end;

  sSQL := sSQL + ' VALORESPERADO = '+OraNumero(edValorPrev.Text);
  sSQL := sSQL + ' ,  IDPLANPREVCONTAB   = ' + qryContribuicao.FieldByName('IDPLANPREVCONTAB').AsString+  //Higor Nayde 162126*RE01 KINTANA 792563
                 ' WHERE (MESREFERENCIA  = '''+qryContribuicao.FieldByName('MesReferencia').AsString+''') '+
                 ' AND   (MESCOBRANCA    = '''+qryContribuicao.FieldByName('MesCobranca').AsString+''')   '+
                 ' AND   (NUMRECEBIMENTO = '  +qryContribuicao.FieldByName('NumRecebimento').AsString+')  '+
                 ' AND   (IDMOTIVO       = '  +qryContribuicao.FieldByName('IdMotivo').AsString+') ';

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        dtmBaseDados.dbBaseDados.RollBack;
        MostrarErro(E);
        Exit;
     end;
  end;


  //alterar a data de venciment no CAR
  //e a data das demais contribuições enviadas no mesmo documento
  if (qryContribuicao.FieldByName('SitRecebimento').AsInteger = 1) and
  (qryContribuicao.FieldByName('ValorRecebido').AsFloat = 0) and
  (qryContribuicao.FieldByName('CodDocumentoPrev').AsString <> '') then
  begin
      qryaux.close;
      qryaux.sql.text := ' UPDATE DOCUMENTO SET DATAVENCTO = TO_DATE('''+Trim(dtPrevista.Text)+''', ''dd/mm/yyyy''), '+
                         ' EMISBLOQ = ''N'' '+
                         ' WHERE IDMODULO = '+IntToStr(Sistema.IdModulo)+' '+
                         ' AND CODDOCUMENTO = '+qryContribuicao.FieldByName('CodDocumentoPrev').AsString+'';
      try
         qryaux.execsql;
      except
         on E:EDBEngineError do
         begin
            dtmBaseDados.dbBaseDados.RollBack;
            MostrarErro(E);
            Exit;
         end;
      end;


      qryaux.close;
      qryaux.sql.text := ' UPDATE HSTCONTRIBPREV SET DATAPREVISAORECE = TO_DATE('''+Trim(dtPrevista.Text)+''', ''dd/mm/yyyy'') '+
                         ' WHERE  '+
                         ' (MESREFERENCIA  = '''+qryContribuicao.FieldByName('MesReferencia').AsString+''') '+
                         ' AND (MESCOBRANCA    = '''+qryContribuicao.FieldByName('MesCobranca').AsString+''') '+
                         ' AND (CODDOCUMENTOPREV = '+qryContribuicao.FieldByName('CodDocumentoPrev').AsString+') ';
      try
         qryaux.execsql;
      except
         on E:EDBEngineError do
         begin
            dtmBaseDados.dbBaseDados.RollBack;
            MostrarErro(E);
            Exit;
         end;
      end;

  end;



  // Se apagou os alteradores, inseri-los com o novo mes de cobranca
  if bApagouAlteradores
  then begin
     qryAlteradores.First;
     while not qryAlteradores.Eof do
     begin
        sSQL := ' INSERT INTO HSTATRASOCONTRIB(MESREFERENCIA,           '+
                '             NUMRECEBIMENTO,MESCOBRANCA,IDMOTIVO,      '+
                '             VALOR,CODALTERADOR,FLGTIPO,FLGRETROATIVO, '+
                '             FLGEVENTO) '+
                ' VALUES('''+qryAlteradores.FieldByName('MesReferencia').AsString +''', '+
                             qryAlteradores.FieldByName('NumRecebimento').AsString+',   '+
                        ''''+sAnoMesCob                                           +''', '+
                             qryAlteradores.FieldByName('IdMotivo').AsString      +',   '+
                   OraNumero(qryAlteradores.FieldByName('Valor').AsString)        +',   '+
                             qryAlteradores.FieldByName('CodAlterador').AsString  +',   '+
                        ''''+qryAlteradores.FieldByName('FlgTipo').AsString       +''', ';

        if Trim(qryAlteradores.FieldByName('FlgRetroativo').AsString) <> ''
        then sSQL := sSQL + qryAlteradores.FieldByName('FlgRetroativo').AsString+', '
        else sSQL := sSQL + 'NULL, ';

        if Trim(qryAlteradores.FieldByName('FlgEvento').AsString) <> ''
        then sSQL := sSQL + qryAlteradores.FieldByName('FlgEvento').AsString
        else sSQL := sSQL + 'NULL ';

        sSQL := sSQL + ')';

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSQL);
        try
           qryAux.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              dtmBaseDados.dbBaseDados.RollBack;
              MostrarErro(E);
              Exit;
           end;
        end;
        qryAlteradores.Next;
     end;
  end;

  Try
    If Not Sistema.GravaLogOperacoes(Copy(Self.Caption + ' - Alteração',1,100)) Then
      raise exception.Create('Erro ao gravar Log.')
  Except
  End;

  GravaLogTOTALPREV ('Controle Indiv.-Alteração-Matr.'+lblMatricula.Caption+'-'+
                     'Mês Cob.:'+qryContribuicao.FieldByName('MesCobranca').AsString+'-'+
                     'Mês Ref.:'+qryContribuicao.FieldByName('MesReferencia').AsString+'-'+
                     'Cód.:'+qryContribuicao.FieldByName('IdContribuicao').AsString+'-'+
                     'Num Rec.:'+qryContribuicao.FieldByName('NumRecebimento').AsString);

  dtmBaseDados.dbBaseDados.Commit;

  sMesRefAnt   := qryContribuicao.FieldByName('MesReferencia').AsString;
  sMesCobAnt   := qryContribuicao.FieldByName('MesCobranca').AsString;
  iNumRecebAnt := qryContribuicao.FieldByName('NumRecebimento').AsInteger;
  iIdMotivoAnt := qryContribuicao.FieldByName('IdMotivo').AsInteger;

  try
     frmAguarde.Mostra('Atualizando situações ...');
     qryContribuicao.Close;
     qryContribuicao.Open;
  finally
     frmAguarde.Apaga;
  end;

  varFields := VarArrayCreate([0,3],varVariant);
  varFields[0] := sMesRefAnt;
  varFields[1] := sMesCobAnt;
  varFields[2] := iNumRecebAnt;
  varFields[3] := iIdMotivoAnt;

  qryContribuicao.Locate('MESREFERENCIA;MESCOBRANCA;NUMRECEBIMENTO;IDMOTIVO', varFields , [loCaseInsensitive, loPartialKey]);

  pgctrlCobrancas.ActivePage := tbsGrid;
  tbsResult.TabVisible := False;
  tbsAlterar.TabVisible := False;
  tbsMotivo.TabVisible  := False;

end;

procedure TfrmControleIndivContrib.ProcessaDevolucao;
var iFlgDescFolha   : integer;
    iNumReg,
    iIdLote,
    iNumRecebimento : longint;
    sValorCotas,
    sSQL,
    sMsgErro,
    sAnoMesCobranca : string;
    rTotalLote      : double;
    bProcessouAlguma,
    bErro           : boolean;
begin

   bErro := False;
   if Trim(dtPrevista.Text) = ''
   then begin
      MsgDlg('Preencha a "Data para Devolução".','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   
   if rgrpRetiraReserva.ItemIndex = -1
   then begin
      MsgDlg('opção "RETIRAR CONTRIBUIÇÃO DEVOLVIDA DA RESERVA" não preenchida!','Erro',mtError,[mbOk,mbHelp],0);
      rgrpRetiraReserva.SetFocus;
      Exit;
   end;
   

   qryContribuicao.First;

   // Gerar lote de contribuicao
   iIdLote := GeraLOTE(qryContribuicao.FieldByName('IdPessJur').AsInteger,True,
                       sAnoMesCobranca,
                       'P', 'Devolução de Contribuição - Matrícula : '+qryTitular.FieldByName('Matricula').AsString,
                       'D','1','0','0','0','0', DateToStr(date),'','','','');
   if iIdLote < 0
   then begin
      MsgDlg(' Erro na geração do lote de contribuições. ','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   rTotalLote := 0;
   iNumReg    := 0;

   // Pedir para o usuario informar :
   // 1. para que mes ela deseja devolver (mescobranca)
   // 2. qual a data que é para registrar como data de devolucao (datacobranca)
   sAnoMesCobranca  := Copy(Trim(dtPrevista.Text),7,4)+'/'+Copy(dtPrevista.Text,4,2);
   bProcessouAlguma := False;

   dtmBaseDados.dbBaseDados.StartTransaction;

   qryContribuicao.First;
   while not qryContribuicao.EOF do
   begin
      // Verificar se a contribuicao foi selecionada
      if qryContribuicao.FieldByName('FlgSelecionado').AsInteger = 0
      then begin
         qryContribuicao.Next;
         continue;
      end;

      // Para ser devolvida a contribuição tem que ter as seguintes condições :
      // 1. Valor Recebido > 0
      if (Trim(qryContribuicao.FieldByName('ValorRecebido').AsString) = '') or
         (qryContribuicao.FieldByName('ValorRecebido').AsFloat <= 0)
      then begin
         qryContribuicao.Next;
         continue;
      end;

      // Se for uma contribuicao de divergência
      // Entao apenas devolver a contribuição inserindo-a no histórico de contribuicao
      // Senao ( então é uma contribuição normal do mês)
      // Entao zerar o salário e devolver todas as outras contribuições do mesmo mês

      if rgrpDescBanco.ItemIndex = 0
      then iFlgDescFolha := 0
      else iFlgDescFolha := 1;

      iNumRecebimento := InsereHstContribPREV( dtmAPrev.qryAux, qryContribuicao.FieldByName('IdPessoa').AsInteger,
                               qryContribuicao.FieldByName('SeqProposta').AsInteger,
                               qryContribuicao.FieldByName('IdPessJur').AsInteger,
                               qryContribuicao.FieldByName('IdPlanoPrev').AsInteger,
                               qryContribuicao.FieldByName('IdContribuicao').AsInteger,
                               prmIdMotivoDiverg,
                               qryContribuicao.FieldByName('MesReferencia').AsString,
                               sAnoMesCobranca,
                               qryForma.FieldByName('CodPortForma').AsInteger,
                               dtPrevista.Text,   // DataCobranca
                               '',            // DataRecebimento
                               qryContribuicao.FieldByName('ValorRecebido').AsFloat, // ValorEsperado
                               qryContribuicao.FieldByName('ValorRecebido').AsFloat, // ValorCalculado
                               0, // ValorRecebido
                               qryContribuicao.FieldByName('IdRegraCalculo').AsInteger,
                               iFlgDescFolha,
                               qryContribuicao.FieldbyName('ValorOp1').AsFloat,
                               qryContribuicao.FieldbyName('ValorOp2').AsFloat,
                               qryContribuicao.FieldbyName('ValorOp3').AsFloat,
                               qryContribuicao.FieldbyName('DataInicio').AsString,
                               qryContribuicao.FieldbyName('DataFinal').AsString,
                               qryContribuicao.FieldbyName('FlgInterno').AsString,
                               0, // nao enviado
                               0, // parcela
                               iIdLote, // idlote
                               'F',     // tipo
                               0,       // flgcalcreserva
                               1,       // flgdevolucao
                               0,       // flgconcessao
                               0,       // flgevento
                               qryContribuicao.FieldbyName('IDPLANPREVCONTAB').AsString); //Higor Nayde 162126*RE01 KINTANA 792563
         if iNumRecebimento < 0
         then begin
            MsgDlg('Erro na gravação do Histórico de Contribuições. ','Erro',mtError,[mbOk,mbHelp],0);
            bErro := True;
            break;
         end;

         // Gravar alteradores de devolucao
         if not GravaAlterador('D',qryContribuicao.FieldByName('MesReferencia').AsString,
                     sAnoMesCobranca,
                     '1',
                     iNumRecebimento,
                     prmIdMotivoDiverg, //passar mesmo motivo da devolução
                     qryContribuicao.FieldByName('IdPlanoPrev').AsInteger, //piIdPlanoPrev,
                     qryContribuicao.FieldByName('IdContribuicao').AsInteger,
                     qryContribuicao.FieldByName('IdPessJur').AsInteger, //piIdPessJur,
                     qryContribuicao.FieldByName('DataRecebimento').AsString,// Data referencia
                     qryContribuicao.FieldByName('DataRecebimento').AsString,// Data previsao
                     dtPrevista.Text,
                     OraNumero(qryContribuicao.FieldByName('ValorRecebido').AsString),
                     sMsgErro )
         then begin
            MsgDlg(sMsgErro+'. Erro na gravação dos alteradores da contribuição.','Erro',mtError,[mbOk,mbHelp],0);
            bErro    := True;
            break;
         end;

         GravaLogTOTALPREV ('Controle Indiv.-Devolver-Matr.'+lblMatricula.Caption+'-'+
                            'Mês Cob.:'+qryContribuicao.FieldByName('MesCobranca').AsString+'-'+
                            'Mês Ref.:'+qryContribuicao.FieldByName('MesReferencia').AsString+'-'+
                            'Cód.:'+qryContribuicao.FieldByName('IdContribuicao').AsString+'-'+
                            'Num Rec.:'+qryContribuicao.FieldByName('NumRecebimento').AsString);

         // Se a contribuicao alimentou reserva, retirar ela da reserva
         if (qryContribuicao.FieldbyName('FlgCalcReserva').AsInteger = 1)
            And (rgrpRetiraReserva.ItemIndex = 0) then
         begin
            if not AbateContribReserva ( qryContribuicao.FieldByName('MesReferencia').AsString,
                                         qryContribuicao.FieldByName('IdContribuicao').AsString,
                                         qryContribuicao.FieldByName('IdPlanoPrev').AsString,
                                         qryContribuicao.FieldByName('IdPessJur').AsString,
                                         qryContribuicao.FieldByName('SeqProposta').AsString,
                                         qryContribuicao.FieldByName('IdPessoa').AsString,
                                         FloatToStr(qryContribuicao.FieldByName('ValorRecebido').AsFloat),
                                         qryContribuicao.FieldByName('DataPrevisaoRece').AsString,
                                         qryAux,qryAux2 )
            then begin
               MsgDlg('Erro ao abater a contribuição a devolver da reserva.','Erro',mtError,[mbOk,mbHelp],0);
               bErro    := True;
               break;
            end;
         end;

         inc(iNumReg);
         rTotalLote := rTotalLote + qryContribuicao.FieldByName('ValorRecebido').AsFloat;
         bProcessouAlguma := True;

      qryContribuicao.Next;
   end; // while not qryContribuicao.Eof

   // Atualizar lote
   if bProcessouAlguma
   then begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE CTRLINTERFACE SET NUMREG = '+IntToStr(iNumReg)+ ', '+
                     '                          VLRTOTAL = '+OraNumero(FloatToStr(rTotalLote))+
                     ' WHERE  (IDLOTE = '+IntToStr(iIdLote)+')');
      try
         qryAux.ExecSQL;
      except
         MsgDlg('Erro atualizar lote no controle de interface. ','Erro',mtError,[mbOk,mbHelp],0);
         bErro    := True;
      end;
   end;

   if not bErro
   then begin
      dtmBaseDados.dbBaseDados.Commit;
      MsgDlg('Contribuições preparadas para devolver. Utilize a opção "Enviar" para enviá-las para pagamento. ',
             'Informação',mtInformation,[mbOk,mbHelp],0);
   end
   else begin
      dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Erro ao gravar a devolução das contribuições. Operação cancelada. ','Erro',mtError,[mbOk,mbHelp],0);
   end;

   try
      frmAguarde.Mostra('Atualizando situações ...');
      qryContribuicao.Close;
      qryContribuicao.Open;
   finally
      frmAguarde.Apaga;
   end;

   pgctrlCobrancas.ActivePage := tbsGrid;
   tbsResult.TabVisible  := False;
   tbsMotivo.TabVisible  := False;
   tbsAlterar.TabVisible := False;
end;



procedure TfrmControleIndivContrib.ProcessaEstorno;
var iFlgDescFolha   : integer;
    iNumReg,
    iIdLote,
    iNumRecebimento : longint;
    sValorCotas,
    sSQL,
    sMsgErro,
    sAnoMesCobranca : string;
    rValorEmReal,
    rValorEmCota,
    rValorDaCota,
    rTotalLote      : double;
    bProcessouAlguma,
    bErro           : boolean;
begin

   bErro := False;
   if Trim(dtPrevista.Text) = ''
   then begin
      MsgDlg('Preencha a "Data para Devolução".','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   qryContribuicao.First;

   rTotalLote := 0;
   iNumReg    := 0;

   // Pedir para o usuario informar :
   // 1. para que mes ela deseja devolver (mescobranca)
   // 2. qual a data que é para registrar como data de devolucao (datacobranca)
   sAnoMesCobranca  := Copy(Trim(dtPrevista.Text),7,4)+'/'+Copy(dtPrevista.Text,4,2);

   bProcessouAlguma := False;

   dtmBaseDados.dbBaseDados.StartTransaction;


   qryContribuicao.First;
   while not qryContribuicao.EOF do
   begin
      // Verificar se a contribuicao foi selecionada
      if qryContribuicao.FieldByName('FlgSelecionado').AsInteger = 0
      then begin
         qryContribuicao.Next;
         continue;
      end;

      // Para ser devolvida a contribuição tem que ter as seguintes condições :
      // 1. Valor Recebido > 0
      if (Trim(qryContribuicao.FieldByName('ValorRecebido').AsString) = '') or
         (qryContribuicao.FieldByName('ValorRecebido').AsFloat <= 0)
      then begin
         qryContribuicao.Next;
         continue;
      end;

         if rgrpDescBanco.ItemIndex = 0
         then iFlgDescFolha := 0
         else iFlgDescFolha := 1;

         // Se a contribuicao alimentou reserva, retirar ela da reserva
         if qryContribuicao.FieldbyName('FlgCalcReserva').AsInteger = 1 then
         begin
            if not AbateContribReserva ( qryContribuicao.FieldByName('MesReferencia').AsString,
                                         qryContribuicao.FieldByName('IdContribuicao').AsString,
                                         qryContribuicao.FieldByName('IdPlanoPrev').AsString,
                                         qryContribuicao.FieldByName('IdPessJur').AsString,
                                         qryContribuicao.FieldByName('SeqProposta').AsString,
                                         qryContribuicao.FieldByName('IdPessoa').AsString,
                                         FloatToStr(qryContribuicao.FieldByName('ValorRecebido').AsFloat),
                                         qryContribuicao.FieldByName('DataPrevisaoRece').AsString,
                                         qryAux,qryAux2 )

            then begin
               MsgDlg('Erro ao abater a contribuição a devolver da reserva.','Erro',mtError,[mbOk,mbHelp],0);
               bErro    := True;
               break;
            end;

            with qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' DELETE TMPDESC '+
                       ' WHERE  MESREFERENCIA   = '''+qryContribuicao.FieldByName('MESREFERENCIA').AsString+''''+
                       ' AND    MESCOBRANCA     = '''+qryContribuicao.FieldByName('MESCOBRANCA').AsString+''''+
                       ' AND    IDPESSOA        = '+qryContribuicao.FieldByName('IDPESSOA').AsString+
                       ' AND    IDDESCONTO      = '+qryContribuicao.FieldByName('IDCONTRIBUICAO').AsString);
               try
                  ExecSQL;
               except
                  MsgDlg('Erro ao excluir contribuição da tabela temporária de descontos.','Erro',mtError,[mbOk,mbHelp],0);
                  bErro    := True;
                  break;
               end;
            end;

            with qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' UPDATE HSTCONTRIBPREV SET FLGCALCRESERVA = 0 ,  DATAULTALIM = NULL, '+
                       '        SITRECEBIMENTO = 1, VALORRECEBIDO = NULL '+
                       ' , DATAEMISSCOB     = SYSDATE  '+  // SOL 180156 Kintana 1668852
                       ' ,  IDPLANPREVCONTAB   = '+ qryContribuicao.FieldByName('IDPLANPREVCONTAB').AsString+  //Higor Nayde 162126*RE01 KINTANA 792563
                       ' WHERE MESREFERENCIA   = '''+qryContribuicao.FieldByName('MesReferencia').AsString+''''+
                       ' AND   MESCOBRANCA     = '''+qryContribuicao.FieldByName('MesCobranca').AsString+''''+
                       ' AND   IDMOTIVO        = '  +qryContribuicao.FieldByName('IdMotivo').AsString+
                       ' AND   NUMRECEBIMENTO  = '  +qryContribuicao.FieldByName('NumRecebimento').AsString);
               try
                  ExecSQL;
               except
                  MsgDlg('Erro ao atualizar situação da contribuição no histórico.','Erro',mtError,[mbOk,mbHelp],0);
                  bErro    := True;
                  break;
               end;
            end;

            GravaLogTOTALPREV ('Controle Indiv.-Desfazer-Matr.'+lblMatricula.Caption+'-'+
                               'Mês Cob.:'+qryContribuicao.FieldByName('MesCobranca').AsString+'-'+
                               'Mês Ref.:'+qryContribuicao.FieldByName('MesReferencia').AsString+'-'+
                               'Cód.:'+qryContribuicao.FieldByName('IdContribuicao').AsString+'-'+
                               'Num Rec.:'+qryContribuicao.FieldByName('NumRecebimento').AsString);
            
         end;

         inc(iNumReg);
         rTotalLote := rTotalLote + qryContribuicao.FieldByName('ValorRecebido').AsFloat;
         bProcessouAlguma := True;

      qryContribuicao.Next;
   end; // while not qryContribuicao.Eof

   if not bErro then
   begin
      Try
        If Not Sistema.GravaLogOperacoes(Copy(Self.Caption + ' - Estorno',1,100)) Then
          raise exception.Create('Erro ao gravar Log.')
      Except
      End;

      dtmBaseDados.dbBaseDados.Commit;
      MsgDlg('Estorno efetuado com sucesso.  ', 'Informação',mtInformation,[mbOk,mbHelp],0);
   end
   else begin
      dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Erro ao estornar as contribuições. Operação cancelada. ','Erro',mtError,[mbOk,mbHelp],0);
   end;

  pgctrlCobrancas.ActivePage := tbsGrid;
  tbsResult.TabVisible  := False;
  tbsMotivo.TabVisible  := False;
  tbsAlterar.TabVisible := False;


end;

procedure TfrmControleIndivContrib.tbButonEstornarClick(Sender: TObject);
var rTotalRecebido : double;
begin
  inherited;
  cOperacao := 'E';

  // Verificar se as contribuições selecionadas possuem valorrecebido > 0
  rTotalRecebido := 0;
  qryContribuicao.DisableControls;
  qryContribuicao.First;
  while not qryContribuicao.Eof do
  begin
     if qryContribuicao.FieldByName('FlgSelecionado').AsInteger = 0
     then begin
        qryContribuicao.Next;
        Continue;
     end;

     if (qryContribuicao.FieldByName('SitRecebimento').AsInteger =  0) or
        (qryContribuicao.FieldByName('SitRecebimento').AsInteger =  1) or
        (qryContribuicao.FieldByName('ValorRecebido').AsFloat <= 0 )
     then begin
        MsgDlg('Nas contribuições selecionadas existe(m) contribuição(ões) que não '+
               'possui(em) valor para ser estornado. Verifique.',
               'Informação',mtInformation,[mbOk,mbHelp],0);
        qryContribuicao.EnableControls;
        Exit;
     end;
     rTotalRecebido := rTotalRecebido + qryContribuicao.FieldByName('ValorRecebido').AsFloat;

     qryContribuicao.Next;
  end; // while not Eof
  qryContribuicao.EnableControls;

  pgctrlCobrancas.ActivePage := tbsAlterar;
  tbsResult.TabVisible := False;
  tbsMotivo.TabVisible  := False;
  tbsAlterar.TabVisible := True;

  lblContrib.Caption      := 'Estorno de Contribuições';
  lblData.Caption         := 'Data de Estorno';
  rgrpDescBanco.Visible   := False;
  rgrpRetiraReserva.Visible := False; 
  grpPortForma.Visible    := False;
  edValorPrev.Color       := clSilver;
  edValorPrev.ReadOnly    := True;
  dtPrevista.Text         := DateToStr(date);
  edValorPrev.Text        := FormatFloat('0.00',rTotalRecebido);
  rgrpDescBanco.ItemIndex := 0;
  qryForma.Close;
  qryForma.ParamByName('RecPag').AsString := 'P';
  qryForma.Open;
  dblkpcmbPortForma.Text  := '';
end;

procedure TfrmControleIndivContrib.rgrpTipoAlteradorClick(Sender: TObject);
begin
  inherited;

  qrytipoalterador.close;
  if rgrpTipoAlterador.itemindex = 0 then
  qrytipoalterador.parambyname('recpag').AsString := 'R'
  else  qrytipoalterador.parambyname('recpag').AsString := 'P';
  qrytipoalterador.parambyname('idplanoprev').AsString := qryContribuicao.FieldByName('idplanoprev').AsString;
  qrytipoalterador.parambyname('idcontribuicao').AsString := qryContribuicao.FieldByName('idcontribuicao').AsString;
  qrytipoalterador.open;

  dblkpcmbTipoAlterador.text := '';
end;


procedure TfrmControleIndivContrib.pmnTodasClick(Sender: TObject);
begin
  inherited;
  pmnTodas.Checked             := True;
  pmnNaoCanceladas.Checked     := False;
  pmnSomenteCanceladas.Checked := False;

  qryContribuicao.Filter       := TestaFiltro;
  qryContribuicao.Filtered     := False;
  qryContribuicao.First;
end;

procedure TfrmControleIndivContrib.pmnNaoCanceladasClick(Sender: TObject);
begin
  inherited;
  pmnTodas.Checked             := False;
  pmnNaoCanceladas.Checked     := True;
  pmnSomenteCanceladas.Checked := False;

  qryContribuicao.Filter       := TestaFiltro;
  qryContribuicao.Filtered     := True;
  qryContribuicao.First;
end;

procedure TfrmControleIndivContrib.pmnSomenteCanceladasClick(
  Sender: TObject);
begin
  inherited;
  pmnTodas.Checked             := False;
  pmnNaoCanceladas.Checked     := False;
  pmnSomenteCanceladas.Checked := True;

  qryContribuicao.Filter       := TestaFiltro;
  qryContribuicao.Filtered     := True;
  qryContribuicao.First;
end;

procedure TfrmControleIndivContrib.pmnTodasContribClick(Sender: TObject);
begin
  inherited;
  pmnTodasContrib.Checked      := True;
  pmnDoParticipante.Checked    := False;
  pmnDaPatro.Checked           := False;

  qryContribuicao.Filter       := TestaFiltro;
  qryContribuicao.Filtered     := False;
  qryContribuicao.First;
end;

procedure TfrmControleIndivContrib.pmnDoParticipanteClick(Sender: TObject);
begin
  inherited;
  pmnTodasContrib.Checked      := False;
  pmnDoParticipante.Checked    := True;
  pmnDaPatro.Checked           := False;

  qryContribuicao.Filter       := TestaFiltro;
  qryContribuicao.Filtered     := True;
  qryContribuicao.First;
end;

procedure TfrmControleIndivContrib.pmnDaPatroClick(Sender: TObject);
begin
  inherited;
  pmnTodasContrib.Checked      := False;
  pmnDoParticipante.Checked    := False;
  pmnDaPatro.Checked           := True;

  qryContribuicao.Filter       := TestaFiltro;
  qryContribuicao.Filtered     := True;
  qryContribuicao.First;
end;

function TfrmControleIndivContrib.TestaFiltro: String;
Var
 sFiltro1, sFiltro2 : String;
begin
  // Limpa Variaveis
  sFiltro1 := '';
  sFiltro2 := '';

  // Verifica 1º Filtro
  If pmnTodas.Checked  Then sFiltro1            := '';
  If pmnNaoCanceladas.Checked Then sFiltro1     := 'SITRECEBIMENTO <> 8';
  If pmnSomenteCanceladas.Checked Then sFiltro1 := 'SITRECEBIMENTO = 8';

  // Verifica 2º Filtro
  If pmnTodasContrib.Checked Then sFiltro2   := '';
  If pmnDoParticipante.Checked Then sFiltro2 := 'FLGPAGADOR = '+QuotedStr('C');
  If pmnDaPatro.Checked Then sFiltro2        := 'FLGPAGADOR = '+QuotedStr('P');

  // Testa ambos os filtros
  If sFiltro1 + sFiltro2 = ''
     Then TestaFiltro:=''
  Else If (sFiltro1 <> '') and (sFiltro2 = '')
          Then TestaFiltro := sFiltro1
       Else If (sFiltro1 <> '') and (sFiltro2 <> '')
               Then TestaFiltro := '('+sFiltro1+') AND ('+sFiltro2+')'
               Else TestaFiltro := sFiltro2;
end;



procedure TfrmControleIndivContrib.bbtnProcurarClick(Sender: TObject);
var lIdPessoa, lIdPessJur, lIdPlanoPrev, liSeqProposta,
    lIdTitular : longint; //Helio - SOL Nº 253577/17461 PPM Nº 955564
begin
  inherited;

  MontaSelectPart.Executar;

  pgctrlCobrancas.ActivePage := tbsGrid;
  pnlAlteradores.SendToBack;
  tbsResult.TabVisible  := False;
  tbsAlterar.TabVisible := False;
  tbsMotivo.TabVisible  := False;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     lIdPessoa    := StrToInt(MontaSelectPart.ValoresChave[0]);
     lIdTitular   := StrToInt(MontaSelectPart.ValoresChave[18]); //Helio - SOL Nº 253577/17461 PPM Nº 955564
     lIdPessJur   := StrToInt(MontaSelectPart.ValoresChave[1]);
     lIdPlanoPrev := StrToInt(MontaSelectPart.ValoresChave[2]);
     liSeqProposta := StrToInt(MontaSelectPart.ValoresChave[16]);
     lblParticipante.Caption        := MontaSelectPart.ValoresChave[3];
     lblMatricula.Caption   := MontaSelectPart.ValoresChave[4];
     lblPatrocinadora.Caption       := MontaSelectPart.ValoresChave[5];
     lblPlano.Caption       := MontaSelectPart.ValoresChave[6];
     lblSituacao.Caption := MontaSelectPart.ValoresChave[8];

     //Inicio - Helio - SOL Nº 253577/17461 PPM Nº 955564
     lblTitular.Caption          := MontaSelectPart.ValoresChave[19];
     lblMatriculaTitular.Caption := MontaSelectPart.ValoresChave[20];
     lblSituacaoTitPatro.Caption := MontaSelectPart.ValoresChave[7];
     lblSituacaoTitPlano.Caption := MontaSelectPart.ValoresChave[9];
     //Fim - Helio - SOL Nº 253577/17461 PPM Nº 955564

     //Inicio - Helio - SOL Nº 253577/17461 PPM Nº 955564
     //PreencheDadosTitular(lIdPessoa, lIdPessJur, lIdPlanoPrev, liSeqProposta);
     PreencheDadosTitular(lIdTitular, lIdPessJur, lIdPlanoPrev, liSeqProposta, lIdPessoa);
     //Fim - Helio - SOL Nº 253577/17461 PPM Nº 955564
  end
  else begin
     lIdPessoa := -1;
     lIdPessJur := -1;
     lIdPlanoPrev := -1;
     liSeqProposta := -2;
     LimpaTela;
  end;
end;

procedure TfrmControleIndivContrib.dbgrdContribuicaoTitleButtonClick(
  Sender: TObject; AFieldName: String);
var iFlgSelecionado : word;
begin
  inherited;
  if AFieldName = 'FLGSELECIONADO'
  then begin
     qryContribuicao.DisableControls;
     qryContribuicao.First;
     iFlgSelecionado := 0;
     while not qryContribuicao.Eof do
     begin
        if qryContribuicao.FieldByName('FLGSELECIONADO').AsInteger = 0
        then iFlgSelecionado := 1;
        qryContribuicao.Edit;
        qryContribuicao.FieldByName('FLGSELECIONADO').AsInteger := iFlgSelecionado;
        qryContribuicao.Post;
        qryContribuicao.Next;
     end;
     qryContribuicao.First;
     qryContribuicao.EnableControls;
  end
  else begin
     if sOrdemFiltro = ''
     then sOrdemFiltro := 'DESC'
     else sOrdemFiltro := '';

     if qryPendente.IsEmpty then //Helio - SOL Nº 253577/17461 PPM Nº 955564
         AbreQryContribuicao(' ORDER BY '+AFieldName+' '+sOrdemFiltro)
     //Inicio - Helio - SOL Nº 253577/17461 PPM Nº 955564
     else
          AbreQryContribuicaoPendente(' ORDER BY '+AFieldName+' '+sOrdemFiltro);
     //Fim - Helio - SOL Nº 253577/17461 PPM Nº 955564

  end;
end;



//AO ALTERAR O SCRIPT DESTA FUNÇÃO, VERIFICAR A NECESSIDADE DE ALTERAR A FUNÇÃO AbreQryQuebraDoc
procedure TfrmControleIndivContrib.AbreQryContribuicao( psOrdem : string );
begin
  // CPREV_001
  if not(qryTitular.Active) then Exit;

   qryContribuicao.DisableControls;
   with qryContribuicao do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT 0.00 AS FLGSELECIONADO,                                                         ');
      SQL.Add('        D.NODOCUMENTO,        D.NOSSONUMERO,          C.NOMERESUM,                      ');
      SQL.Add('        C.NOME,               HST.MESREFERENCIA,      HST.MESCOBRANCA,                  ');
      SQL.Add('        HST.DATAPREVISAORECE,                                                           ');
      SQL.Add('        HST.SALCONTRIB,                                                                 '); //Taffarel - SIG72382
      SQL.Add('        HST.VALORESPERADO,    HST.VALORRECEBIDO,      HST.SITRECEBIMENTO,               ');
      SQL.Add('        HST.IDLOTE,           HST.NUMRECEBIMENTO,     HST.FLGDEVOLUCAO,                 ');

      // André Pontes - pendência 26613 (reabertura) - 28/02/2008
      SQL.Add('        DECODE(NVL(HST.FLGDEVOLUCAO, 0), 1, ''devolução'', '''') AS DEVOLUCAO, '         );

      SQL.Add('        HST.IDMOTIVO,         HST.DATARECEBIMENTO,                                      ');
      SQL.Add('        HST.VALOROP1,                                                                   ');
      SQL.Add('        HST.VALOROP2,         HST.VALOROP3,           HST.CODDOCUMENTOPREV,             ');
      SQL.Add('        HST.VALORCALCULADO,   HST.FLGDESCFOLHA,                                         ');
      SQL.Add('        HST.IDCONTRIBUICAO,   HST.IDPESSJUR,          HST.IDPLANOPREV,                  ');
      SQL.Add('        HST.IDPESSOA,         HST.SEQPROPOSTA,        HST.DATAINICIO,                   ');
      SQL.Add('        HST.DATAFINAL,        HST.FLGSITFUNDACAO,     HST.FLGEVENTO,                    ');
      SQL.Add('        HST.DATACANCELAMENTO, HST.DATAEMISSCOB,       HST.FLGCALCRESERVA,               ');
      SQL.Add('        HST.PARCELA,                                                                    ');
      SQL.Add('        EL.MATRICULA,         CP.FLGPAGADOR,                                            ');
      SQL.Add('        CP.CODCENTROCUSTOC,   CP.CODCENTROCUSTOD,     PP.INSCRICAONUMERO,               ');
      SQL.Add('        CPP.FLGDESCFOLHA,     CPP.DIAVENCIMENTO,      CP.CODTIPRECDES,                  ');
      SQL.Add('        CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONTAD,                    ');
      SQL.Add('        C.NOME  NOMECONTRIB,  CP.CODSUBCONTA ,        CP.CODCENTRORESPON,               ');
      SQL.Add('        PP.SALMANTIDO,        CP.UNIDNEGOC,                                             ');
      SQL.Add('        CPP.IDEMPRESA,        CPP.PLANO,              CPP.DATAINICIO,                   ');
      SQL.Add('        CPP.TIPCODIGO,        CPP.CODTIPDOC,                                            ');
      SQL.Add('        NVL(HST.CODPORTFORMA,CPP.CODPORTFORMA) AS CODPORTFORMA,                         ');
      SQL.Add('        CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONTAD13,                  ');
      SQL.Add('        CPP.CODCENTROCUSTOC13,CPP.IDEMPRESA13,        CPP.CODCENTROCUSTOD13,            ');
      SQL.Add('        CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,            ');
      SQL.Add('        CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPRECDES13,               ');
      SQL.Add('        CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORTFORMA13,               ');
      SQL.Add('        NVL(CPP.IDPLANPREVCONTAB, HST.IDPLANOPREV) AS IDPLANPREVCONTAB, ');
      SQL.Add('        CPP.PLACONTADBANCO,     CPP.PLACONTADBANCO13,             ');
      SQL.Add('        CPP.CODTIPDESEMBDEVOL, CPP.CODCCUSTODEVOL, CPP.PLACONTADEVOL,                   ');
      SQL.Add('        PP.SALMANTIDO,        HST.FLGDEVOLUCAO,       CPP.DATAINICIO,                   ');
      SQL.Add('        DECODE(HST.FLGDEVOLUCAO, 0, DECODE( HST.SITRECEBIMENTO, ''0'', ''Não enviada para cobrança'', ');
      SQL.Add('                                                                ''1'', ''Enviada e não recebida'',    ');
      SQL.Add('                                                                ''2'', ''Recebida corretamente'',     ');
      SQL.Add('                                                                ''3'', ''Recebida com divergência(NT)'', ');
      SQL.Add('                                                                ''4'', ''Atrasada e já tratada'',          ');
      SQL.Add('                                                                ''5'', ''Divergência paga'',             ');
      SQL.Add('                                                                ''6'', ''Divergência enviada e não recebida'', ');
      SQL.Add('                                                                ''7'', ''Financiada ou Renegociada'',          ');
      SQL.Add('                                                                ''8'', ''Cancelada'',                          ');
      SQL.Add('                                                                ''9'', ''Cobrada na Folha de Benefício''),     ');
      SQL.Add('                                    DECODE( HST.SITRECEBIMENTO, ''0'', ''Não enviada para devolução'',         ');
      SQL.Add('                                                                ''1'', ''Enviada e não efetivamente paga'',    ');
      SQL.Add('                                                                ''2'', ''Paga corretamente'',                  ');
      SQL.Add('                                                                ''3'', ''Paga com divergência(NT)'',           ');
      //BRUNO AZEVEDO SOL KINTANA
      SQL.Add('                                                                ''4'', ''Atrasada e já tratada'',          ');
      SQL.Add('                                                                ''7'', ''Financiada ou Renegociada'',          ');
      SQL.Add('                                                                ''8'', ''Cancelada'',                          ');
      SQL.Add('                                                                ''9'', ''Paga na Folha de Benefício'')) AS NOMESITUACAO, ');
      SQL.Add('        CP.IDREGRACALCULO,    SP.FLGINTERNO,                                                  ');


      // Daniel Begnami SOL:104817

//    SQL.Add('        DECODE(HST.FLGDEVOLUCAO,0,                                                                                    ');
//    SQL.Add('                                  SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALOR,''D'',HA.VALOR,0)),                       ');
//    SQL.Add('                                  SUM(DECODE(TA.ACRESDECRES,''C'',HA.VALOR,''D'',-HA.VALOR,0))) AS SOMAALTERADORES,   ');

      //BRUNO AZEVEDO SOL KINTANA
      SQL.Add(' SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0)) AS SOMAALTERADORES,');


      SQL.Add('      DECODE(HST.FLGDEVOLUCAO,0,SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0)),               ');
      SQL.Add('                          SUM(DECODE(TA.ACRESDECRES,''C'',NVL(HA.VALOR,0),''D'',NVL(-HA.VALOR,0),0)))AS SOMAALTERADORES,  ');


//    SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORESPERADO,0), -NVL(HST.VALORESPERADO,0))+                          ');
//    SQL.Add('              SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALOR,''D'',HA.VALOR,0))) AS TOTALESPERADO,                         ');

      SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORESPERADO,0), NVL(-HST.VALORESPERADO,0) )+                         ');
      SQL.Add('              SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0)))AS TOTALESPERADO,            ');



//    SQL.Add('        SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALORRECEBIDO,''D'',HA.VALORRECEBIDO,0)) AS ALTERADORESRECEB,             ');

      SQL.Add('        DECODE(HST.FLGDEVOLUCAO,0,SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALORRECEBIDO,0),''D'',NVL(HA.VALORRECEBIDO,0),0)), ');
      SQL.Add('                                  SUM(DECODE(TA.ACRESDECRES,''C'',NVL(HA.VALORRECEBIDO,0),''D'',NVL(-HA.VALORRECEBIDO,0),0))  ');
      SQL.Add('        )AS ALTERADORESRECEB,                                                                                                 ');



//    SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORRECEBIDO,0), -NVL(HST.VALORRECEBIDO,0))+                          ');
//    SQL.Add('              SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALORRECEBIDO,''D'',HA.VALORRECEBIDO,0))) AS  TOTALRECEBIDO,        ');

      SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO, 0,NVL(HST.VALORRECEBIDO,0), NVL(-HST.VALORRECEBIDO,0) )+                         ');
      SQL.Add('        SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALORRECEBIDO,0),''D'',NVL(HA.VALORRECEBIDO,0),0))) AS  TOTALRECEBIDO,    ');

      // FIM SOL:104817

      SQL.Add('        NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR) IDPESSJURCEDIDO, ');

      SQL.Add('        D.RECPAG RECPAGDOC,     ');
      SQL.Add('        (SELECT DECODE(HST.IDPLANPREVCONTAB,2,''REG/REPLAN'',74,''NOVO PLANO'',PN.NOME) AS NOME from PLANPREVCONTABIL PN WHERE ( HST.IDPLANPREVCONTAB = PN.IDPLANOPREV)) as NOMEPLANO, HST.valorbase1  ');  //higor Nayde SOL162126*RE01 
      SQL.Add(' FROM   CONTRIBUICAO C,       CONTPREV CP, PATRO PT,  SITPART SP,                             ');
      SQL.Add('        ELEGPATRO EL,         PARTPREVPLAN PP,  CONTRIBPREVPARTP CPP,                         ');
      SQL.Add('        HSTCONTRIBPREV HST,   DOCUMENTO D, HSTATRASOCONTRIB HA, TIPOALTERADOR TA              ');
      SQL.Add(' WHERE  (HST.IDPESSOA    = '+qryTitular.FieldByName('IdPessoa').AsString+' )                  ');
      SQL.Add(' AND    (HST.IDPESSJUR   = '+qryTitular.FieldByName('IdPessJur').AsString+' )                 ');
      SQL.Add(' AND    (HST.IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' )               ');
      SQL.Add(' AND    (NVL(HST.IDTITULAR, HST.IDPESSOA) = '+qryTitular.FieldByName('IdTitular').AsString+' )               '); // Andre Imakawa - SIG 60728
      SQL.Add(' AND    (HST.CODDOCUMENTOPREV = D.CODDOCUMENTO(+) )                                           ');
      SQL.Add(' AND    (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO)                                               ');
      SQL.Add(' AND    (CPP.IDPESSJUR      = HST.IDPESSJUR)                                                  ');
      SQL.Add(' AND    (CPP.IDPLANOPREV    = HST.IDPLANOPREV)                                                ');
      SQL.Add(' AND    (CPP.IDPESSOA       = HST.IDPESSOA)                                                   ');
      SQL.Add(' AND    (CPP.SEQPROPOSTA    = HST.SEQPROPOSTA)                                                ');
      SQL.Add(' AND    (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)                                             ');
      SQL.Add(' AND    (PP.IDPESSJUR       = CPP.IDPESSJUR)                                                  ');
      SQL.Add(' AND    (PP.IDPLANOPREV     = CPP.IDPLANOPREV)                                                ');
      SQL.Add(' AND    (PP.IDPESSOA        = CPP.IDPESSOA)                                                   ');
      SQL.Add(' AND    (PP.SEQPROPOSTA     = CPP.SEQPROPOSTA)                                                ');
      SQL.Add(' AND    (PT.IDPESSOA        = PP.IDPESSJUR)                                                   ');
      SQL.Add(' AND    (EL.IDPESSOA        = PP.IDPESSOA)                                                    ');
      SQL.Add(' AND    (EL.IDPESSJUR       = PP.IDPESSJUR)                                                   ');
      SQL.Add(' AND    (CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO)                                             ');
      SQL.Add(' AND    (CP.IDPLANOPREV     = CPP.IDPLANOPREV)                                                ');
      SQL.Add(' AND    (C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO)                                              ');
      SQL.Add(' AND    (PP.IDSITPART       = SP.IDSITPART)                                                   ');
      SQL.Add(' AND    (HA.NUMRECEBIMENTO(+) = HST.NUMRECEBIMENTO)                                           ');
      SQL.Add(' AND    (HA.MESCOBRANCA(+)    = HST.MESCOBRANCA)                                              ');
      SQL.Add(' AND    (HA.MESREFERENCIA(+)  = HST.MESREFERENCIA)                                            ');
      SQL.Add(' AND    (HA.IDMOTIVO(+)       = HST.IDMOTIVO)                                                 ');
      SQL.Add(' AND    (HA.CODALTERADOR      = TA.CODALTERADOR(+))                                           ');


      If (pmmVisualisaDivergTratadas.Checked) And (cmbSituacao.ItemIndex <> 5)
       Then SQL.Add('AND (HST.SITRECEBIMENTO <> 4 Or (HST.SITRECEBIMENTO = 4 AND NVL(HST.VALORRECEBIDO, 0) > 0))');


      if (Trim(meAnoMesCobranca.Text) <> '') and (Trim(meAnoMesCobranca.Text) <> '/')
      then SQL.Add('AND HST.MESCOBRANCA = '''+meAnoMesCobranca.Text+'''');

      //SOL 160427 KITANA 1348415 - Vinicius Ferreira
      if (Trim(meAnoMesReferencia.Text) <> '') and (Trim(meAnoMesReferencia.Text) <> '/')
      then SQL.Add('AND HST.MESREFERENCIA = '''+meAnoMesReferencia.Text+'''');


      if (Trim(cmbSituacao.Text) <> '') and (UpperCase(Trim(cmbSituacao.Text)) <> 'TODAS') then
      begin
        // -----------------------------------------------------------------------------------------
        // CPREV_001

        case cmbSituacao.ItemIndex of                                                     // Todas

          1 : SQL.Add('AND (HST.SITRECEBIMENTO = 0 AND NVL(HST.FLGDEVOLUCAO, 0) = 0) ');  // Não enviada para cobrança
          2 : SQL.Add('AND (HST.SITRECEBIMENTO = 1 AND NVL(HST.FLGDEVOLUCAO, 0) = 0) ');  // Enviada e não recebido
          3 : SQL.Add('AND (HST.SITRECEBIMENTO = 2 AND NVL(HST.FLGDEVOLUCAO, 0) = 0) ');  // Recebida corretamente
          4 : SQL.Add('AND (HST.SITRECEBIMENTO = 3 AND NVL(HST.FLGDEVOLUCAO, 0) = 0) ');  // Recebida com divergência(NT)
          5 : SQL.Add('AND (HST.SITRECEBIMENTO = 4 AND NVL(HST.FLGDEVOLUCAO, 0) = 0) ');  // Atrasada e já tratada
          6 : SQL.Add('AND (HST.SITRECEBIMENTO = 5 AND NVL(HST.FLGDEVOLUCAO, 0) = 1) ');  // Divergência paga
          7 : SQL.Add('AND (HST.SITRECEBIMENTO = 6 AND NVL(HST.FLGDEVOLUCAO, 0) = 0) ');  // Divergência enviada e não recebida
          8 : SQL.Add('AND (HST.SITRECEBIMENTO = 7 AND NVL(HST.FLGDEVOLUCAO, 0) = 0) ');  // Financiada ou Renegociada
          9 : SQL.Add('AND (HST.SITRECEBIMENTO = 8) ');                                   // Cancelada
          10: SQL.Add('AND (HST.SITRECEBIMENTO = 9 AND NVL(HST.FLGDEVOLUCAO, 0) = 0) ');  // Cobrada na Folha de Benefício
          11: SQL.Add('AND (HST.SITRECEBIMENTO = 0 AND NVL(HST.FLGDEVOLUCAO, 0) = 1) ');  // Não enviada para devolução
          12: SQL.Add('AND (HST.SITRECEBIMENTO = 1 AND NVL(HST.FLGDEVOLUCAO, 0) = 1) ');  // Enviada e não efetivamente paga
          13: SQL.Add('AND (HST.SITRECEBIMENTO = 2 AND NVL(HST.FLGDEVOLUCAO, 0) = 1) ');  // Paga corretamente
          14: SQL.Add('AND (HST.SITRECEBIMENTO = 3 AND NVL(HST.FLGDEVOLUCAO, 0) = 1) ');  // Paga com divergência(NT)
          15: SQL.Add('AND (HST.SITRECEBIMENTO = 9 AND NVL(HST.FLGDEVOLUCAO, 0) = 1) ');  // Paga na Folha de Benefício
          16: SQL.Add('AND NVL(HST.FLGDEVOLUCAO, 0) = 0 ');                               // Todas (Cobranças)
          17: SQL.Add('AND NVL(HST.FLGDEVOLUCAO, 0) = 1 ');                               // Todas (Devoluções)
         end;

        // FIM CPREV_001
        // -----------------------------------------------------------------------------------------
      end;

      SQl.Add('GROUP BY D.NODOCUMENTO,        D.NOSSONUMERO,          C.NOMERESUM,                     ');
      SQL.Add('        C.NOME,               HST.MESREFERENCIA,      HST.MESCOBRANCA,                  ');
      SQL.Add('        HST.DATAPREVISAORECE,                                                           ');
      SQL.Add('        HST.SALCONTRIB,                                                                 '); //Taffarel - SIG72382
      SQL.Add('        HST.VALORESPERADO,    HST.VALORRECEBIDO,      HST.SITRECEBIMENTO,               ');
      SQL.Add('        HST.IDLOTE,           HST.NUMRECEBIMENTO,     HST.FLGDEVOLUCAO,                 ');

      // André Pontes - pendência 26613 (reabertura) - 28/02/2008
      SQL.Add('        DECODE(NVL(HST.FLGDEVOLUCAO, 0), 1, ''devolução'', ''''), '                      );

      SQL.Add('        HST.IDMOTIVO,         HST.DATARECEBIMENTO,                                      ');
      SQL.Add('        HST.VALOROP1,                                                                   ');
      SQL.Add('        HST.VALOROP2,         HST.VALOROP3,           HST.CODDOCUMENTOPREV,             ');
      SQL.Add('        HST.VALORCALCULADO,   HST.FLGDESCFOLHA,                                         ');
      SQL.Add('        HST.IDCONTRIBUICAO,   HST.IDPESSJUR,          HST.IDPLANOPREV,                  ');
      SQL.Add('        HST.IDPESSOA,         HST.SEQPROPOSTA,        HST.DATAINICIO,                   ');
      SQL.Add('        HST.DATAFINAL,        HST.FLGSITFUNDACAO,     HST.FLGEVENTO,                    ');
      SQL.Add('        HST.DATACANCELAMENTO, HST.DATAEMISSCOB,       HST.FLGCALCRESERVA,               ');
      SQL.Add('        HST.PARCELA,                                                                    ');
      SQL.Add('        EL.MATRICULA,         CP.FLGPAGADOR,                                            ');
      SQL.Add('        CP.CODCENTROCUSTOC,   CP.CODCENTROCUSTOD,     PP.INSCRICAONUMERO,               ');
      SQL.Add('        CPP.FLGDESCFOLHA,     CPP.DIAVENCIMENTO,      CP.CODTIPRECDES,                  ');
      SQL.Add('        CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONTAD,                    ');
      SQL.Add('        CP.CODSUBCONTA ,        CP.CODCENTRORESPON,                                     ');
      SQL.Add('        PP.SALMANTIDO,        CP.UNIDNEGOC,                                             ');
      SQL.Add('        CPP.IDEMPRESA,        CPP.PLANO,              CPP.DATAINICIO,                   ');
      SQL.Add('        CPP.TIPCODIGO,        CPP.CODTIPDOC,                                            ');
      SQL.Add('        HST.CODPORTFORMA,     CPP.CODPORTFORMA,                                         ');
      SQL.Add('        CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONTAD13,                  ');
      SQL.Add('        CPP.CODCENTROCUSTOC13,CPP.IDEMPRESA13,        CPP.CODCENTROCUSTOD13,            ');
      SQL.Add('        CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,            ');
      SQL.Add('        CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPRECDES13,               ');
      SQL.Add('        CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORTFORMA13,               ');
      SQL.Add('        CPP.IDPLANPREVCONTAB, CPP.PLACONTADBANCO,     CPP.PLACONTADBANCO13,             ');
      SQL.Add('        CPP.CODTIPDESEMBDEVOL, CPP.CODCCUSTODEVOL, CPP.PLACONTADEVOL,                   ');
      SQL.Add('        PP.SALMANTIDO,        HST.FLGDEVOLUCAO,       CPP.DATAINICIO,                   ');
      SQL.Add('        HST.FLGDEVOLUCAO,     HST.SITRECEBIMENTO,                                       ');
      SQL.Add('        CP.IDREGRACALCULO,    SP.FLGINTERNO , NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR),    ');
      SQL.Add('        D.RECPAG,HST.valorbase1 ,HST.IDPLANPREVCONTAB                                                                       '); //Higor Nayde 162126*RE01 KINTANA 792563

      if Trim(psOrdem) = ''
      then SQL.Add(' ORDER BY  HST.MESREFERENCIA DESC                                                         ')
      else SQL.Add(psOrdem);

       //qryContribuicao.SQL.SaveToFile('C:\ProjetosCM5\Teste.txt');

      Open;
   end;
   qryContribuicao.EnableControls;
end;




//AO ALTERAR O SCRIPT DESTA FUNÇÃO, VERIFICAR A NECESSIDADE DE ALTERAR A FUNÇÃO AbreQryContribuicao
procedure TfrmControleIndivContrib.AbreQryQuebraDoc( psNumRecebimento : string );
begin


   with qryQuebraDoc    do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT 1 AS FLGSELECIONADO,                                                            ');
      SQL.Add('        D.NODOCUMENTO,        D.NOSSONUMERO,          C.NOMERESUM,                      ');
      SQL.Add('        C.NOME,               HST.MESREFERENCIA,      HST.MESCOBRANCA,                  ');
      SQL.Add('        HST.DATAPREVISAORECE,                                                           ');
      SQL.Add('        HST.VALORESPERADO,    HST.VALORRECEBIDO,      HST.SITRECEBIMENTO,               ');
      SQL.Add('        HST.IDLOTE,           HST.NUMRECEBIMENTO,     HST.FLGDEVOLUCAO,                 ');
      SQL.Add('        HST.IDMOTIVO,         HST.DATARECEBIMENTO,                                      ');
      SQL.Add('        HST.VALOROP1,                                                                   ');
      SQL.Add('        HST.VALOROP2,         HST.VALOROP3,           HST.CODDOCUMENTOPREV,             ');
      SQL.Add('        HST.VALORCALCULADO,   HST.FLGDESCFOLHA,                                         ');
      SQL.Add('        HST.IDCONTRIBUICAO,   HST.IDPESSJUR,          HST.IDPLANOPREV,                  ');
      SQL.Add('        HST.IDPESSOA,         HST.SEQPROPOSTA,        HST.DATAINICIO,                   ');
      SQL.Add('        HST.DATAFINAL,        HST.FLGSITFUNDACAO,     HST.FLGEVENTO,                    ');
      SQL.Add('        HST.DATACANCELAMENTO, HST.DATAEMISSCOB,       HST.FLGCALCRESERVA,               ');
      SQL.Add('        HST.PARCELA,                                                                    ');
      SQL.Add('        EL.MATRICULA,         CP.FLGPAGADOR,                                            ');
      SQL.Add('        CP.CODCENTROCUSTOC,   CP.CODCENTROCUSTOD,     PP.INSCRICAONUMERO,               ');
      SQL.Add('        CPP.FLGDESCFOLHA,     CPP.DIAVENCIMENTO,      CP.CODTIPRECDES,                  ');
      SQL.Add('        CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONTAD,                    ');
      SQL.Add('        C.NOME  NOMECONTRIB,  CP.CODSUBCONTA ,        CP.CODCENTRORESPON,               ');
      SQL.Add('        PP.SALMANTIDO,        CP.UNIDNEGOC,                                             ');
      SQL.Add('        CPP.IDEMPRESA,        CPP.PLANO,              CPP.DATAINICIO,                   ');
      SQL.Add('        CPP.TIPCODIGO,        CPP.CODTIPDOC,                                            ');
      SQL.Add('        NVL(HST.CODPORTFORMA,CPP.CODPORTFORMA) AS CODPORTFORMA,                         ');
      SQL.Add('        CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONTAD13,                  ');
      SQL.Add('        CPP.CODCENTROCUSTOC13,CPP.IDEMPRESA13,        CPP.CODCENTROCUSTOD13,            ');
      SQL.Add('        CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,            ');
      SQL.Add('        CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPRECDES13,               ');
      SQL.Add('        CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORTFORMA13,               ');
      //Inicio - Helio - SOL Nº 253577/17460 PPM Nº 955546
      //RNG04
      //SQL.Add('        NVL(CPP.IDPLANPREVCONTAB,HST.IDPLANOPREV) AS IDPLANPREVCONTAB ,                 ');
      SQL.Add('        NVL(HST.IDPLANPREVCONTAB,HST.IDPLANOPREV) AS IDPLANPREVCONTAB ,                 ');
      //Fim - Helio - SOL Nº 253577/17460 PPM Nº 955546
      SQL.Add('        CPP.PLACONTADBANCO,     CPP.PLACONTADBANCO13,                                   ');
      SQL.Add('        CPP.CODTIPDESEMBDEVOL, CPP.CODCCUSTODEVOL, CPP.PLACONTADEVOL,                   ');
      SQL.Add('        PP.SALMANTIDO,        HST.FLGDEVOLUCAO,       CPP.DATAINICIO,                   ');
      SQL.Add('        DECODE(HST.FLGDEVOLUCAO, 0, DECODE( HST.SITRECEBIMENTO, ''0'', ''Não enviada para cobrança'',          ');
      SQL.Add('                                                                ''1'', ''Enviada e não recebida'',             ');
      SQL.Add('                                                                ''2'', ''Recebida corretamente'',              ');
      SQL.Add('                                                                ''3'', ''Recebida com divergência(NT)'',       ');
      SQL.Add('                                                                ''4'', ''Atrasada e já tratada'',              ');
      SQL.Add('                                                                ''5'', ''Divergência paga'',                   ');
      SQL.Add('                                                                ''6'', ''Divergência enviada e não recebida'', ');
      SQL.Add('                                                                ''7'', ''Financiada ou Renegociada'',          ');
      SQL.Add('                                                                ''8'', ''Cancelada'',                          ');
      SQL.Add('                                                                ''9'', ''Cobrada na Folha de Benefício''),     ');
      SQL.Add('                                    DECODE( HST.SITRECEBIMENTO, ''0'', ''Não enviada para devolução'',         ');
      SQL.Add('                                                                ''1'', ''Enviada e não efetivamente paga'',    ');
      SQL.Add('                                                                ''2'', ''Paga corretamente'',                  ');
      SQL.Add('                                                                ''3'', ''Paga com divergência(NT)'',           ');
      SQL.Add('                                                                ''7'', ''Financiada ou Renegociada'',          ');
      SQL.Add('                                                                ''8'', ''Cancelada'',                          ');
      SQL.Add('                                                                ''9'', ''Paga na Folha de Benefício'')) AS NOMESITUACAO, ');
      SQL.Add('        CP.IDREGRACALCULO,    SP.FLGINTERNO,                                            ');

      // Daniel Begnami SOL:104817

//    SQL.Add('        DECODE(HST.FLGDEVOLUCAO,0,                                                                                    ');
//    SQL.Add('                                  SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALOR,''D'',HA.VALOR,0)),                       ');
//    SQL.Add('                                  SUM(DECODE(TA.ACRESDECRES,''C'',HA.VALOR,''D'',-HA.VALOR,0))) AS SOMAALTERADORES,   ');

      SQL.Add('      DECODE(HST.FLGDEVOLUCAO,0,SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0)),               ');
      SQL.Add('                          SUM(DECODE(TA.ACRESDECRES,''C'',NVL(HA.VALOR,0),''D'',NVL(-HA.VALOR,0),0)))AS SOMAALTERADORES,  ');

//    SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORESPERADO,0), -NVL(HST.VALORESPERADO,0))+                          ');
//    SQL.Add('              SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALOR,''D'',HA.VALOR,0))) AS TOTALESPERADO,                         ');

      SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORESPERADO,0), NVL(-HST.VALORESPERADO,0) )+                         ');
      SQL.Add('              SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0)))AS TOTALESPERADO,            ');

//    SQL.Add('        SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALORRECEBIDO,''D'',HA.VALORRECEBIDO,0)) AS ALTERADORESRECEB,             ');

      SQL.Add('        DECODE(HST.FLGDEVOLUCAO,0,SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALORRECEBIDO,0),''D'',NVL(HA.VALORRECEBIDO,0),0)), ');
      SQL.Add('                                  SUM(DECODE(TA.ACRESDECRES,''C'',NVL(HA.VALORRECEBIDO,0),''D'',NVL(-HA.VALORRECEBIDO,0),0))  ');
      SQL.Add('        )AS ALTERADORESRECEB,                                                                                                 ');

//    SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORRECEBIDO,0), -NVL(HST.VALORRECEBIDO,0))+                          ');
//    SQL.Add('              SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALORRECEBIDO,''D'',HA.VALORRECEBIDO,0))) AS  TOTALRECEBIDO,        ');

      SQL.Add('        ABS(DECODE(HST.FLGDEVOLUCAO, 0,NVL(HST.VALORRECEBIDO,0), NVL(-HST.VALORRECEBIDO,0) )+                          ');
      SQL.Add('        SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALORRECEBIDO,0),''D'',NVL(HA.VALORRECEBIDO,0),0))) AS  TOTALRECEBIDO, ');

      // FIM SOL:104817

      SQL.Add('        NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR) IDPESSJURCEDIDO, ');

      SQL.Add('        NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR) IDPESSJURCEDIDO     ');
      SQL.Add(' FROM   CONTRIBUICAO C,       CONTPREV CP, PATRO PT,  SITPART SP,                             ');
      SQL.Add('        ELEGPATRO EL,         PARTPREVPLAN PP,  CONTRIBPREVPARTP CPP,                         ');
      SQL.Add('        HSTCONTRIBPREV HST,   DOCUMENTO D, HSTATRASOCONTRIB HA, TIPOALTERADOR TA              ');
      SQL.Add(' WHERE  (HST.IDPESSOA    = '+qryTitular.FieldByName('IdPessoa').AsString+' )                  ');
      SQL.Add(' AND    (HST.IDPESSJUR   = '+qryTitular.FieldByName('IdPessJur').AsString+' )                 ');
      SQL.Add(' AND    (HST.IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+' )               ');
      SQL.ADD(' AND    (HST.NUMRECEBIMENTO IN ('+psNumRecebimento+') )                                       ');
      SQL.Add(' AND    (HST.CODDOCUMENTOPREV = D.CODDOCUMENTO(+) )                                           ');
      SQL.Add(' AND    (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO)                                               ');
      SQL.Add(' AND    (CPP.IDPESSJUR      = HST.IDPESSJUR)                                                  ');
      SQL.Add(' AND    (CPP.IDPLANOPREV    = HST.IDPLANOPREV)                                                ');
      SQL.Add(' AND    (CPP.IDPESSOA       = HST.IDPESSOA)                                                   ');
      SQL.Add(' AND    (CPP.SEQPROPOSTA    = HST.SEQPROPOSTA)                                                ');
      SQL.Add(' AND    (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)                                             ');
      SQL.Add(' AND    (PP.IDPESSJUR       = CPP.IDPESSJUR)                                                  ');
      SQL.Add(' AND    (PP.IDPLANOPREV     = CPP.IDPLANOPREV)                                                ');
      SQL.Add(' AND    (PP.IDPESSOA        = CPP.IDPESSOA)                                                   ');
      SQL.Add(' AND    (PP.SEQPROPOSTA     = CPP.SEQPROPOSTA)                                                ');
      SQL.Add(' AND    (PT.IDPESSOA        = PP.IDPESSJUR)                                                   ');
      SQL.Add(' AND    (EL.IDPESSOA        = PP.IDPESSOA)                                                    ');
      SQL.Add(' AND    (EL.IDPESSJUR       = PP.IDPESSJUR)                                                   ');
      SQL.Add(' AND    (CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO)                                             ');
      SQL.Add(' AND    (CP.IDPLANOPREV     = CPP.IDPLANOPREV)                                                ');
      SQL.Add(' AND    (C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO)                                              ');
      SQL.Add(' AND    (PP.IDSITPART       = SP.IDSITPART)                                                   ');
      SQL.Add(' AND    (HA.NUMRECEBIMENTO(+) = HST.NUMRECEBIMENTO)                                           ');
      SQL.Add(' AND    (HA.MESCOBRANCA(+)    = HST.MESCOBRANCA)                                              ');
      SQL.Add(' AND    (HA.MESREFERENCIA(+)  = HST.MESREFERENCIA)                                            ');
      SQL.Add(' AND    (HA.IDMOTIVO(+)       = HST.IDMOTIVO)                                                 ');
      SQL.Add(' AND    (HA.CODALTERADOR      = TA.CODALTERADOR(+))                                           ');

      If (pmmVisualisaDivergTratadas.Checked) And (cmbSituacao.ItemIndex <> 5)
       Then SQL.Add('AND HST.SITRECEBIMENTO <> 4');

      if (Trim(meAnoMesCobranca.Text) <> '') and (Trim(meAnoMesCobranca.Text) <> '/')
      then SQL.Add('AND HST.MESCOBRANCA = '''+meAnoMesCobranca.Text+'''');

      //SOL 160427 KITANA 1348415 - Vinicius Ferreira
      if (Trim(meAnoMesReferencia.Text) <> '') and (Trim(meAnoMesReferencia.Text) <> '/')
      then SQL.Add('AND HST.MESREFERENCIA = '''+meAnoMesReferencia.Text+'''');

      if (Trim(cmbSituacao.Text) <> '') and (UpperCase(Trim(cmbSituacao.Text)) <> 'TODAS')
      then begin
         case cmbSituacao.ItemIndex of
              1 : SQL.Add('AND HST.SITRECEBIMENTO = 0 ');
              2 : SQL.Add('AND HST.SITRECEBIMENTO = 1 ');
              3 : SQL.Add('AND HST.SITRECEBIMENTO = 2 ');
              4 : SQL.Add('AND HST.SITRECEBIMENTO = 3 ');
              5 : SQL.Add('AND HST.SITRECEBIMENTO = 4 ');
              6 : SQL.Add('AND HST.SITRECEBIMENTO = 5 ');
              7 : SQL.Add('AND HST.SITRECEBIMENTO = 6 ');
              8 : SQL.Add('AND HST.SITRECEBIMENTO = 7 ');
              9 : SQL.Add('AND HST.SITRECEBIMENTO = 8 ');
              10: SQL.Add('AND HST.SITRECEBIMENTO = 9 ');
              11: SQL.Add('AND HST.SITRECEBIMENTO = 0 ');
              12: SQL.Add('AND HST.SITRECEBIMENTO = 1 ');
              13: SQL.Add('AND HST.SITRECEBIMENTO = 2 ');
              14: SQL.Add('AND HST.SITRECEBIMENTO = 3 ');
              15: SQL.Add('AND HST.SITRECEBIMENTO = 9 ');
         end;
      end;


      SQl.Add('GROUP BY D.NODOCUMENTO,        D.NOSSONUMERO,          C.NOMERESUM,                     ');
      SQL.Add('        C.NOME,               HST.MESREFERENCIA,      HST.MESCOBRANCA,                  ');
      SQL.Add('        HST.DATAPREVISAORECE,                                                           ');
      SQL.Add('        HST.VALORESPERADO,    HST.VALORRECEBIDO,      HST.SITRECEBIMENTO,               ');
      SQL.Add('        HST.IDLOTE,           HST.NUMRECEBIMENTO,     HST.FLGDEVOLUCAO,                 ');
      SQL.Add('        HST.IDMOTIVO,         HST.DATARECEBIMENTO,                                      ');
      SQL.Add('        HST.VALOROP1,                                                                   ');
      SQL.Add('        HST.VALOROP2,         HST.VALOROP3,           HST.CODDOCUMENTOPREV,             ');
      SQL.Add('        HST.VALORCALCULADO,   HST.FLGDESCFOLHA,                                         ');
      SQL.Add('        HST.IDCONTRIBUICAO,   HST.IDPESSJUR,          HST.IDPLANOPREV,                  ');
      SQL.Add('        HST.IDPLANPREVCONTAB,                  '); //Helio - SOL Nº 253577/17460 PPM Nº 955546
      SQL.Add('        HST.IDPESSOA,         HST.SEQPROPOSTA,        HST.DATAINICIO,                   ');
      SQL.Add('        HST.DATAFINAL,        HST.FLGSITFUNDACAO,     HST.FLGEVENTO,                    ');
      SQL.Add('        HST.DATACANCELAMENTO, HST.DATAEMISSCOB,       HST.FLGCALCRESERVA,               ');
      SQL.Add('        HST.PARCELA,                                                                    '); 
      SQL.Add('        EL.MATRICULA,         CP.FLGPAGADOR,                                            ');
      SQL.Add('        CP.CODCENTROCUSTOC,   CP.CODCENTROCUSTOD,     PP.INSCRICAONUMERO,               ');
      SQL.Add('        CPP.FLGDESCFOLHA,     CPP.DIAVENCIMENTO,      CP.CODTIPRECDES,                  ');
      SQL.Add('        CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONTAD,                    ');
      SQL.Add('        CP.CODSUBCONTA ,        CP.CODCENTRORESPON,                                     ');
      SQL.Add('        PP.SALMANTIDO,        CP.UNIDNEGOC,                                             ');
      SQL.Add('        CPP.IDEMPRESA,        CPP.PLANO,              CPP.DATAINICIO,                   ');
      SQL.Add('        CPP.TIPCODIGO,        CPP.CODTIPDOC,                                            ');
      SQL.Add('        HST.CODPORTFORMA,     CPP.CODPORTFORMA,                                         ');
      SQL.Add('        CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONTAD13,                  ');
      SQL.Add('        CPP.CODCENTROCUSTOC13,CPP.IDEMPRESA13,        CPP.CODCENTROCUSTOD13,            ');
      SQL.Add('        CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,            ');
      SQL.Add('        CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPRECDES13,               ');
      SQL.Add('        CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORTFORMA13,               ');
      SQL.Add('        CPP.IDPLANPREVCONTAB, CPP.PLACONTADBANCO,     CPP.PLACONTADBANCO13,             ');
      SQL.Add('        CPP.CODTIPDESEMBDEVOL, CPP.CODCCUSTODEVOL, CPP.PLACONTADEVOL,                   ');
      SQL.Add('        PP.SALMANTIDO,        HST.FLGDEVOLUCAO,       CPP.DATAINICIO,                   ');
      SQL.Add('        HST.FLGDEVOLUCAO,     HST.SITRECEBIMENTO,                                       ');
      SQL.Add('        CP.IDREGRACALCULO,    SP.FLGINTERNO , NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR),    ');
      SQL.Add('        D.RECPAG                                                                        ');

      SQL.Add(' ORDER BY HST.MESCOBRANCA, CP.FLGPAGADOR, HST.DATAPREVISAORECE                      ');

      //qryQuebraDoc.SQL.SaveToFile('C:\ProjetosCM5\Teste1.txt');

      Open;
   end;
end;

//Helio - SOL Nº 253577/17461 PPM Nº 955564
procedure TfrmControleIndivContrib.AbreQryQuebraDocDependente( psNumRecebimento : string );
begin


   with qryQuebraDoc    do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT D.NODOCUMENTO,');
      SQL.Add('        D.NOSSONUMERO,');
      SQL.Add('        C.NOMERESUM,');
      SQL.Add('        C.NOME,');
      SQL.Add('        H.MESREFERENCIA,');
      SQL.Add('        H.MESCOBRANCA,');
      SQL.Add('        H.DATAPREVISAORECE,');
      SQL.Add('        H.VALORESPERADO,');
      SQL.Add('        H.VALORRECEBIDO,');
      SQL.Add('        H.SITRECEBIMENTO,');
      SQL.Add('        H.IDLOTE,');
      SQL.Add('        H.NUMRECEBIMENTO,');
      SQL.Add('        H.FLGDEVOLUCAO,');
      SQL.Add('        H.IDMOTIVO,');
      SQL.Add('        H.DATARECEBIMENTO,');
      SQL.Add('        H.VALOROP1,');
      SQL.Add('        H.VALOROP2,');
      SQL.Add('        H.VALOROP3,');
      SQL.Add('        H.CODDOCUMENTOPREV,');
      SQL.Add('        H.VALORCALCULADO,');
      SQL.Add('        H.FLGDESCFOLHA,');
      SQL.Add('        H.IDCONTRIBUICAO,');
      SQL.Add('        H.IDPESSJUR,');
      SQL.Add('        H.IDPLANOPREV,');
      SQL.Add('        H.IDPESSOA,');
      SQL.Add('        H.SEQPROPOSTA,');
      SQL.Add('        H.DATAINICIO,');
      SQL.Add('        H.DATAFINAL,');
      SQL.Add('        H.FLGSITFUNDACAO,');
      SQL.Add('        H.FLGEVENTO,');
      SQL.Add('        H.DATACANCELAMENTO,');
      SQL.Add('        H.DATAEMISSCOB,');
      SQL.Add('        H.FLGCALCRESERVA,');
      SQL.Add('        H.PARCELA,');
      SQL.Add('        DE.MATRICULA,');
      SQL.Add('        CP.FLGPAGADOR,');
      SQL.Add('        CP.CODCENTROCUSTOC,');
      SQL.Add('        CP.CODCENTROCUSTOD,');
      SQL.Add('        PP.INSCRICAONUMERO,');
      SQL.Add('        H.FLGDESCFOLHA,');
      SQL.Add('        H.FLGDESCFOLHA, --ALTERADO');
      //SQL.Add('        --CPP.DIAVENCIMENTO,');
      SQL.Add('        CP.CODTIPRECDES,');
      //SQL.Add('        --CPP.PLANO,');
      //SQL.Add('        --CPP.PLACONTAC,');
      //SQL.Add('        --CPP.PLACONTAD,');
      SQL.Add('        C.NOME NOMECONTRIB,');
      SQL.Add('        CP.CODSUBCONTA,');
      SQL.Add('        CP.CODCENTRORESPON,');
      SQL.Add('        PP.SALMANTIDO,');
      SQL.Add('        CP.UNIDNEGOC,');
      //SQL.Add('        --CPP.IDEMPRESA,');
      //SQL.Add('        --CPP.PLANO,');
      SQL.Add('        CPN.DATAINICIO,');
      //SQL.Add('        --CPP.TIPCODIGO,');
      //SQL.Add('        --CPP.CODTIPDOC,');
      SQL.Add('        NVL(H.CODPORTFORMA, CPN.CODPORTFORMA) AS CODPORTFORMA,');
      //SQL.Add('        --CPP.PLANO13,');
      //SQL.Add('        --CPP.PLACONTAC13,');
      //SQL.Add('        --CPP.PLACONTAD13,');
      //SQL.Add('        --CPP.CODCENTROCUSTOC13,');
      //SQL.Add('        --CPP.IDEMPRESA13,');
      //SQL.Add('        --CPP.CODCENTROCUSTOD13,');
      //SQL.Add('        --CPP.UNIDNEGOC13,');
      //SQL.Add('        --CPP.IDEMPRESAPROP13,');
      //SQL.Add('        --CPP.CODCENTRORESPON13,');
      //SQL.Add('        --CPP.CODSUBCONTA13,');
      //SQL.Add('        --CPP.RECPAG13,');
      //SQL.Add('        --CPP.CODTIPRECDES13,');
      //SQL.Add('        --CPP.TIPCODIGO13,');
      //SQL.Add('        --CPP.CODTIPDOC13,');
      //SQL.Add('        --CPP.CODPORTFORMA13,');
      SQL.Add('        NVL(H.IDPLANPREVCONTAB, H.IDPLANOPREV) AS IDPLANPREVCONTAB,');
      //SQL.Add('        --CPP.PLACONTADBANCO,');
      //SQL.Add('        --CPP.PLACONTADBANCO13,');
      //SQL.Add('        --CPP.CODTIPDESEMBDEVOL,');
      //SQL.Add('        --CPP.CODCCUSTODEVOL,');
      //SQL.Add('        --CPP.PLACONTADEVOL,');
      SQL.Add('        PP.SALMANTIDO,');
      SQL.Add('        H.FLGDEVOLUCAO,');
      SQL.Add('        CPN.DATAINICIO,');
      SQL.Add('        DECODE(H.FLGDEVOLUCAO,0,');
      SQL.Add('               DECODE(H.SITRECEBIMENTO,''0'',''Não enviada para cobrança'',');
      SQL.Add('                                       ''1'',''Enviada e não recebida'',');
      SQL.Add('                                       ''2'',''Recebida corretamente'',');
      SQL.Add('                                       ''3'',''Recebida com divergência(NT)'',');
      SQL.Add('                                       ''4'',''Atrasada e já tratada'',');
      SQL.Add('                                       ''5'',''Divergência paga'',');
      SQL.Add('                                       ''6'',''Divergência enviada e não recebida'',');
      SQL.Add('                                       ''7'',''Financiada ou Renegociada'',');
      SQL.Add('                                       ''8'',''Cancelada'',');
      SQL.Add('                                       ''9'',''Cobrada na Folha de Benefício''),');
      SQL.Add('               DECODE(H.SITRECEBIMENTO,''0'',''Não enviada para devolução'',');
      SQL.Add('                                       ''1'',''Enviada e não efetivamente paga'',');
      SQL.Add('                                       ''2'',''Paga corretamente'',');
      SQL.Add('                                       ''3'',''Paga com divergência(NT)'',');
      SQL.Add('                                       ''7'',''Financiada ou Renegociada'',');
      SQL.Add('                                       ''8'',''Cancelada'',');
      SQL.Add('                                       ''9'',''Paga na Folha de Benefício'')) AS NOMESITUACAO,');
      SQL.Add('        CP.IDREGRACALCULO,');
      SQL.Add('        S.FLGINTERNO,');
      SQL.Add('        DECODE(H.FLGDEVOLUCAO,0,SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR, 0),''D'',NVL(HA.VALOR, 0),0)),SUM(DECODE(TA.ACRESDECRES,''C'',NVL(HA.VALOR, 0),''D'',NVL(-HA.VALOR, 0),0))) AS SOMAALTERADORES,');
      SQL.Add('        ABS(DECODE(H.FLGDEVOLUCAO,0,NVL(H.VALORESPERADO, 0),NVL(-H.VALORESPERADO, 0)) +SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR, 0),''D'',NVL(HA.VALOR, 0),0))) AS TOTALESPERADO,');
      SQL.Add('        DECODE(H.FLGDEVOLUCAO,0,SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALORRECEBIDO, 0),''D'',NVL(HA.VALORRECEBIDO, 0),0)),SUM(DECODE(TA.ACRESDECRES,''C'',NVL(HA.VALORRECEBIDO, 0),''D'',NVL(-HA.VALORRECEBIDO, 0),0))) AS ALTERADORESRECEB,');
      SQL.Add('        ABS(DECODE(H.FLGDEVOLUCAO,0,NVL(H.VALORRECEBIDO, 0),NVL(-H.VALORRECEBIDO, 0)) +SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALORRECEBIDO, 0),''D'',NVL(HA.VALORRECEBIDO, 0),0))) AS TOTALRECEBIDO,');
      SQL.Add('        H.IDPESSJUR AS IDPESSJURCEDIDO'); //helio aqui mudar
      //SQL.Add(' --       NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR) IDPESSJURCEDIDO,');
      //SQL.Add(' --       NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR) IDPESSJURCEDIDO');
      SQL.Add('   FROM HSTCONTRIBPREV H');
      SQL.Add('   LEFT JOIN HSTATRASOCONTRIB HA');
      SQL.Add('     ON HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO');
      SQL.Add('    AND HA.MESCOBRANCA = H.MESCOBRANCA');
      SQL.Add('    AND HA.MESREFERENCIA = H.MESREFERENCIA');
      SQL.Add('    AND HA.IDMOTIVO = H.IDMOTIVO');
      SQL.Add('   LEFT JOIN TIPOALTERADOR TA');
      SQL.Add('     ON TA.CODALTERADOR = HA.CODALTERADOR');
      SQL.Add('   LEFT JOIN DOCUMENTO D');
      SQL.Add('     ON D.CODDOCUMENTO = H.CODDOCUMENTOPREV');
      SQL.Add('   JOIN BENEFXTAXA BT');
      SQL.Add('     ON H.IDCONTRIBUICAO = BT.IDCONTRIBUICAO');
      SQL.Add('   JOIN BFCIARIOTITPLAN BTT');
      SQL.Add('     ON H.IDPESSOA = BTT.IDRESPONSAVEL');
      SQL.Add('    AND BT.IDBENEFICIO = BTT.IDBENEFICIO');
      SQL.Add('    AND H.IDPLANOPREV = BTT.IDPLANOPREV');
      SQL.Add('   JOIN CONTRIBPREVNUCLEO CPN');
      SQL.Add('     ON H.IDCONTRIBUICAO = CPN.IDCONTRIBUICAO');
      SQL.Add('    AND BTT.IDNUCLEOFAMILIAR = CPN.IDNUCLEOFAMILIAR');
      SQL.Add('   JOIN CONTRIBUICAO C');
      SQL.Add('     ON C.IDCONTRIBUICAO = H.IDCONTRIBUICAO');
      SQL.Add('   JOIN DEPENTIT DE');
      SQL.Add('     ON DE.IDTITULAR = H.IDTITULAR');
      SQL.Add('    AND DE.IDPESSOA = H.IDPESSOA');
      SQL.Add('   JOIN CONTPREV CP');
      SQL.Add('     ON CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO');
      SQL.Add('    AND CP.IDPLANOPREV = H.IDPLANOPREV');
      SQL.Add('   JOIN PARTPREVPLAN PP');
      SQL.Add('     ON PP.IDPESSOA = DE.IDTITULAR');
      SQL.Add('    AND PP.IDPESSJUR = H.IDPESSJUR');
      SQL.Add('    AND (PP.FLGDESATIVADO = 0 OR');
      SQL.Add('        (PP.FLGDESATIVADO = 1 AND EXISTS');
      SQL.Add('         (SELECT 1');
      SQL.Add('             FROM PARTPREVPLAN PPP1');
      SQL.Add('            WHERE PPP1.IDPESSOA = PP.IDPESSOA');
      SQL.Add('              AND PPP1.IDPLANOPREV <> PP.IDPLANOPREV');
      SQL.Add('              AND PPP1.FLGDESATIVADO = 0)))');
      SQL.Add('   JOIN SITPART S');
      SQL.Add('     ON S.IDSITPART = PP.IDSITPART');
      SQL.Add('   JOIN PATRO PT');
      SQL.Add('     ON PT.IDPESSOA        = PP.IDPESSJUR');

      SQL.Add(' WHERE H.IDPESSOA = ' + qryPendente.FieldByName('IDPESSOA').AsString);
      SQL.Add('    AND H.IDPESSJUR = ' + qryPendente.FieldByName('IdPessJur').AsString);
      SQL.Add('    AND H.IDPLANOPREV = ' + qryPendente.FieldByName('IdPlanoPrev').AsString);
      SQL.Add('    AND H.NUMRECEBIMENTO IN (' + psNumRecebimento + ')');

      If (pmmVisualisaDivergTratadas.Checked) And (cmbSituacao.ItemIndex <> 5)
       Then SQL.Add('AND HST.SITRECEBIMENTO <> 4');

      if (Trim(meAnoMesCobranca.Text) <> '') and (Trim(meAnoMesCobranca.Text) <> '/')
      then SQL.Add('AND HST.MESCOBRANCA = '''+meAnoMesCobranca.Text+'''');

      //SOL 160427 KITANA 1348415 - Vinicius Ferreira
      if (Trim(meAnoMesReferencia.Text) <> '') and (Trim(meAnoMesReferencia.Text) <> '/')
      then SQL.Add('AND HST.MESREFERENCIA = '''+meAnoMesReferencia.Text+'''');

      if (Trim(cmbSituacao.Text) <> '') and (UpperCase(Trim(cmbSituacao.Text)) <> 'TODAS')
      then begin
         case cmbSituacao.ItemIndex of
              1 : SQL.Add('AND HST.SITRECEBIMENTO = 0 ');
              2 : SQL.Add('AND HST.SITRECEBIMENTO = 1 ');
              3 : SQL.Add('AND HST.SITRECEBIMENTO = 2 ');
              4 : SQL.Add('AND HST.SITRECEBIMENTO = 3 ');
              5 : SQL.Add('AND HST.SITRECEBIMENTO = 4 ');
              6 : SQL.Add('AND HST.SITRECEBIMENTO = 5 ');
              7 : SQL.Add('AND HST.SITRECEBIMENTO = 6 ');
              8 : SQL.Add('AND HST.SITRECEBIMENTO = 7 ');
              9 : SQL.Add('AND HST.SITRECEBIMENTO = 8 ');
              10: SQL.Add('AND HST.SITRECEBIMENTO = 9 ');
              11: SQL.Add('AND HST.SITRECEBIMENTO = 0 ');
              12: SQL.Add('AND HST.SITRECEBIMENTO = 1 ');
              13: SQL.Add('AND HST.SITRECEBIMENTO = 2 ');
              14: SQL.Add('AND HST.SITRECEBIMENTO = 3 ');
              15: SQL.Add('AND HST.SITRECEBIMENTO = 9 ');
         end;
      end;


      
      SQL.Add(' GROUP BY D.NODOCUMENTO,');
      SQL.Add('        D.NOSSONUMERO,');
      SQL.Add('        C.NOMERESUM,');
      SQL.Add('        C.NOME,');
      SQL.Add('        H.MESREFERENCIA,');
      SQL.Add('        H.MESCOBRANCA,');
      SQL.Add('        H.DATAPREVISAORECE,');
      SQL.Add('        H.VALORESPERADO,');
      SQL.Add('        H.VALORRECEBIDO,');
      SQL.Add('        H.SITRECEBIMENTO,');
      SQL.Add('        H.IDLOTE,');
      SQL.Add('        H.NUMRECEBIMENTO,');
      SQL.Add('        H.FLGDEVOLUCAO,');
      SQL.Add('        H.IDMOTIVO,');
      SQL.Add('        H.DATARECEBIMENTO,');
      SQL.Add('        H.VALOROP1,');
      SQL.Add('        H.VALOROP2,');
      SQL.Add('        H.VALOROP3,');
      SQL.Add('        H.CODDOCUMENTOPREV,');
      SQL.Add('        H.VALORCALCULADO,');
      SQL.Add('        H.FLGDESCFOLHA,');
      SQL.Add('        H.IDCONTRIBUICAO,');
      SQL.Add('        H.IDPESSJUR,');
      SQL.Add('        H.IDPLANOPREV,');
      SQL.Add('        H.IDPESSOA,');
      SQL.Add('        H.SEQPROPOSTA,');
      SQL.Add('        H.DATAINICIO,');
      SQL.Add('        H.DATAFINAL,');
      SQL.Add('        H.FLGSITFUNDACAO,');
      SQL.Add('        H.FLGEVENTO,');
      SQL.Add('        H.DATACANCELAMENTO,');
      SQL.Add('        H.DATAEMISSCOB,');
      SQL.Add('        H.FLGCALCRESERVA,');
      SQL.Add('        H.PARCELA,');
      SQL.Add('        DE.MATRICULA,');
      SQL.Add('        CP.FLGPAGADOR,');
      SQL.Add('        CP.CODCENTROCUSTOC,');
      SQL.Add('        CP.CODCENTROCUSTOD,');
      SQL.Add('        PP.INSCRICAONUMERO,');
      SQL.Add('        H.FLGDESCFOLHA,');
      //SQL.Add('        --CPP.FLGDESCFOLHA,');
      //SQL.Add('        --CPP.DIAVENCIMENTO,');
      SQL.Add('        CP.CODTIPRECDES,');
      //SQL.Add('        --CPP.PLANO,');
      //SQL.Add('        --CPP.PLACONTAC,');
      //SQL.Add('        --CPP.PLACONTAD,');
      SQL.Add('        C.NOME,');
      SQL.Add('        CP.CODSUBCONTA,');
      SQL.Add('        CP.CODCENTRORESPON,');
      SQL.Add('        PP.SALMANTIDO,');
      SQL.Add('        CP.UNIDNEGOC,');
      //SQL.Add('        --CPP.IDEMPRESA,');
      //SQL.Add('        --CPP.PLANO,');
      SQL.Add('        CPN.DATAINICIO,');
      //SQL.Add('        --CPP.TIPCODIGO,');
      //SQL.Add('        --CPP.CODTIPDOC,');
      SQL.Add('        NVL(H.CODPORTFORMA, CPN.CODPORTFORMA),');
      //SQL.Add('        --CPP.PLANO13,');
      //SQL.Add('        --CPP.PLACONTAC13,');
      //SQL.Add('        --CPP.PLACONTAD13,');
      //SQL.Add('        --CPP.CODCENTROCUSTOC13,');
      //SQL.Add('        --CPP.IDEMPRESA13,');
      //SQL.Add('        --CPP.CODCENTROCUSTOD13,');
      //SQL.Add('        --CPP.UNIDNEGOC13,');
      //SQL.Add('        --CPP.IDEMPRESAPROP13,');
      //SQL.Add('        --CPP.CODCENTRORESPON13,');
      //SQL.Add('        --CPP.CODSUBCONTA13,');
      //SQL.Add('        --CPP.RECPAG13,');
      //SQL.Add('        --CPP.CODTIPRECDES13,');
      //SQL.Add('        --CPP.TIPCODIGO13,');
      //SQL.Add('        --CPP.CODTIPDOC13,');
      //SQL.Add('        --CPP.CODPORTFORMA13,');
      SQL.Add('        NVL(H.IDPLANPREVCONTAB, H.IDPLANOPREV),');
      //SQL.Add('        --CPP.PLACONTADBANCO,');
      //SQL.Add('        --CPP.PLACONTADBANCO13,');
      //SQL.Add('        --CPP.CODTIPDESEMBDEVOL,');
      //SQL.Add('        --CPP.CODCCUSTODEVOL,');
      //SQL.Add('        --CPP.PLACONTADEVOL,');
      SQL.Add('        PP.SALMANTIDO,');
      SQL.Add('        H.FLGDEVOLUCAO,');
      SQL.Add('        CPN.DATAINICIO,');
      SQL.Add('        H.SITRECEBIMENTO,');
      SQL.Add('        CP.IDREGRACALCULO,');
      SQL.Add('        S.FLGINTERNO');

      SQL.Add(' ORDER BY CP.FLGPAGADOR                      ');

      //qryQuebraDoc.SQL.SaveToFile('C:\ProjetosCM5\Teste1.txt'); //helio aqui comentar

      Open;
   end;
end;



procedure TfrmControleIndivContrib.bbtnFiltroClick(Sender: TObject);
begin
  inherited;
  if qryPendente.IsEmpty then //Helio - SOL Nº 253577/17461 PPM Nº 955564
       AbreQryContribuicao('')
  //Inicio - Helio - SOL Nº 253577/17461 PPM Nº 955564
  else
       AbreQryContribuicaoPendente('');
  //Fim - Helio - SOL Nº 253577/17461 PPM Nº 955564
end;

procedure TfrmControleIndivContrib.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if SaveDlg.Execute
  then memResult.Lines.SaveToFile(SaveDlg.FileName);

end;


procedure TfrmControleIndivContrib.pmmVisualisaDivergTratadasClick(
  Sender: TObject);
begin
  inherited;
  If cmbSituacao.ItemIndex <> 5
   Then Begin
    pmmVisualisaDivergTratadas.Checked := (Not pmmVisualisaDivergTratadas.Checked);

    if qryPendente.IsEmpty then //Helio - SOL Nº 253577/17461 PPM Nº 955564
        AbreQryContribuicao('')
    //Inicio - Helio - SOL Nº 253577/17461 PPM Nº 955564
    else
         AbreQryContribuicaoPendente('');
    //Fim - Helio - SOL Nº 253577/17461 PPM Nº 955564
   End;
end;



procedure TfrmControleIndivContrib.PreparaQryColetiva(sFlgReservaUltCot, sIdPatro, sMesCob, sMesRef, sIdPessoa: String);
Var
  sSql, data_aux : String;
begin

  sSQL := ' SELECT HST.NUMRECEBIMENTO,HST.VALORRECEBIDO,HST.VALORESPERADO, HST.MESREFERENCIA,       '+
          '        NVL(HST.FLGDEVOLUCAO,0) FLGDEVOLUCAO,                                            '+
          '        HST.IDMOTIVO,HST.IDCONTRIBUICAO,  '+
          '        TO_DATE(TO_CHAR(HST.DATARECEBIMENTO, '+QuotedStr('DD/MM/YYYY')+')) DATARECEBIMENTO,  '+ 
          '        HST.DATAPREVISAORECE,  '+
          '        HST.MESCOBRANCA, HST.IDPESSOA IDPART,HST.IDPESSJUR,HST.IDPLANOPREV,REP.IDPESSOA, '+
          '        HST.SEQPROPOSTA,RXC.IDTIPORESERVA,RXC.IDREGRACALCULORE,                          '+
          '        RXP.INDICEREAJUSTE,RXC.PERCENTUAL,RXP.NOME RESERVA,                              '+
          '        RXP.FLGMODATUALIZACAO,                                                           '+ 
          '        REP.VALORRESERVA,                                                                '+
          '        PL.FLGRESERVAULTCOT ,                                                            '+
          '        HST.VALOROP1,                                                                    '+ 
          '        HST.VALOROP2,                                                                    '+ 
          '        HST.VALOROP3,                                                                    '+
          '        RXC.VALORMAXIMORATEIO,'+#13#10+
          '        TRUNC(SYSDATE) AS DTINICIOINSC, 0 AS SALPARTICIPACAO  ';

  // Se flag for 2 busca o campo datalancto na tabela LANCTODOCUM
  // Se a patrocinadora for a propria fundacao, usar a data do recebimento
  if sFlgReservaUltCot = '1' Then
  Begin
    if IntToStr(iIdFundacao) = sIdPatro Then
      sSQL := sSQL + ', TO_DATE(TO_CHAR(HST.DATARECEBIMENTO, '+QuotedStr('DD/MM/YYYY')+')) AS DATALANCTO  '
    else
      sSQL := sSQL + ', L.DATALANCTO ';
  end
  else
    if sFlgReservaUltCot = '2' Then
    begin
      sSQL := sSQL + ', TO_DATE(TO_CHAR(HST.DATARECEBIMENTO, '+QuotedStr('DD/MM/YYYY')+')) AS DATALANCTO  '
  end
  else
  begin
    data_aux := datetostr(date);
    sSQL     := sSQL + ',''' + data_aux + ''' DATALANCTO ';
  end;

  sSQL := sSQL + ' FROM   HSTCONTRIBPREV HST, RESERVAXPLANO RXP , PLANPREV PL, RESERVAXCONTRIB RXC,      '+
                 '        RESERVAPART REP  ';

  if (sFlgReservaUltCot = '1') and (IntToStr(iIdFundacao) <> sIdPatro ) then
    sSQL := sSQL +  ', LANCTODOCUM L, DOCUMENTO DOC ';

  sSql := sSql + ' WHERE ';

  sSQL := sSQL + '(HST.MESCOBRANCA    = ''' + sMesCob + ''') ';

   //se houverem reservas de controle alimentadas pelas mesmas
   //contribuições das reservas normais, estas já estarão marcadas
   //flgcalcreserva = 1, tendo então a necessidade de ler estes regitros
  if ((qryReservaxPlano.FieldbyName('FlgControle').AsInteger = 1) or
     (qryreservaxplano.FieldByName('FLGCOLETIVA').asString = '1')) And 
     ((Sistema.TipoCliente = 19991) Or
      (Sistema.TipoCliente = 20011)) Then
  begin // flgcalcreserva = 0 ou 1
    sSql := sSql + ' AND   (HST.MESREFERENCIA = HST.MESREFERENCIA ) '+
                   ' AND ( (HST.FLGCALCRESERVA = 0) OR     '+
                   '       (HST.FLGCALCRESERVA = 1) )      ';
  end
  else
  begin // flgcalcreserva = 0 ou 0, ou seja, so pegara as contribuicao com flgcalcreserva = 0
    sSql := sSql + ' AND   (HST.MESREFERENCIA = HST.MESREFERENCIA ) '+
                   ' AND ( (HST.FLGCALCRESERVA = 0) OR     '+
                   '       (HST.FLGCALCRESERVA = 0) )      ';
  end;



  sSql := sSql +  ' AND    (NVL(HST.VALORRECEBIDO,0) > 0 )                                  '+
  ' AND    (RXP.ANALITICOSINTETI = ''A'')                             '+
  ' AND    (HST.IDPLANOPREV      = '+qryContribuicao.FieldByName('IdPlanoPrev').AsString+') '+
  ' AND    (RXC.IDTIPORESERVA    = '+qryReservaxPlano.FieldByName('IdTipoReserva').AsString+')                    '+
  ' AND    (HST.MESREFERENCIA    = '+qryReservaxPlano.FieldbyName('MesReferencia').AsString+')                    '+
  ' AND    (HST.IDMOTIVO         = '+qryReservaxPlano.FieldbyName('IdMotivo').AsString+') ';

  if (qryReservaxPlano.FieldByName('IDRGVLRMAXRATEIO').AsString = '') or
     (qryreservaxplano.FieldByName('FLGCOLETIVA').asString      = '1') then
    sSQL := sSQL + ' AND (RXC.IDCONTRIBUICAO   = '+qryReservaxPlano.FieldbyName('IdContribuicao').AsString+') ';


  if Trim(sIdPatro) <> '' then
    sSQL := sSQL + 'AND (HST.IDPESSJUR = '+ sIdPatro + ')';


  if Trim(sIdPessoa) <> '' then
    sSQL := sSQL + ' AND (HST.IDPESSOA = '+sIdPessoa+')';

  if (sFlgReservaUltCot = '1') and (IntToStr(iIdFundacao) <> sIdPatro) then
  begin
    sSql := sSql + ' AND (TO_NUMBER(L.OPERACAO) IN (5,10) )';
    sSql := sSql + ' AND (L.CODDOCUMENTO = HST.CODDOCUMENTOPREV ) ';
    sSql := sSql + ' AND (L.CODDOCUMENTO=DOC.CODDOCUMENTO) ';
    sSql := sSql + ' AND (DOC.STATUS=TO_CHAR(2)) ';
    sSql := sSql + ' AND (L.ESTORNO IS NULL) ';
  end;

  sSQL := sSQL + ' AND    (RXC.IDPLANOPREV   = HST.IDPLANOPREV)      '+
  ' AND    (RXP.IDPLANOPREV   = HST.IDPLANOPREV )                    '+
  ' AND    (RXP.IDTIPORESERVA = RXC.IDTIPORESERVA)                   '+
  ' AND    (RXP.FLGCOLETIVA = 1 )                                    '+
  ' AND    (REP.IDPLANOPREV = HST.IDPLANOPREV )                      '+
  ' AND    (RXC.IDCONTRIBUICAO= HST.IDCONTRIBUICAO)                  ';

  if Trim(sIdPatro) <> '' then
    sSQL := sSQL + ' AND (REP.IDPESSJUR IN (' + sIdPatro + ') ) ';

  sSQL := sSQL + ' AND    (REP.IDTIPORESERVA= RXC.IDTIPORESERVA)                    '+
  ' AND    (REP.IDPESSOA    = '+ InttoStr(iIdFundacaoAtual) + ')     '+
  ' AND    (REP.SEQPROPOSTA = HST.SEQPROPOSTA)                       '+
  ' AND    (PL.IDPLANOPREV = REP.IDPLANOPREV )                       ';

  sSQL := sSQL + ' ORDER BY HST.MESREFERENCIA, HST.IDCONTRIBUICAO                           ';

  qryReserva.Close;
  qryReserva.Sql.Clear;
  qryReserva.Sql.Add(sSQL);
  qryReserva.Open;
end;



Procedure TfrmControleIndivContrib.MontaQueryReservaPlano(piIdPessJur,
  piIdPlanoPrev, piIdContribuicao, piIdPessoa: Integer; psMesCobranca: String);
Var
  sSql : String;

begin

  sSql :=
  ' SELECT /*RULE*/ DISTINCT '+#13#10+
    ' H.MESCOBRANCA, '+#13#10+
    ' RP.FLGMODATUALIZACAO, '+#13#10+
    ' RP.IDTIPORESERVA, '+#13#10+
    ' RP.NOME , '+#13#10+
    ' RP.FLGCONTROLE, '+#13#10+
    ' RP.FLGCOLETIVA, '+#13#10+
    ' PL.IDPLANOPREV, '+#13#10+
    ' PL.NOME NOMEPLANO, '+#13#10+
    ' PL.FLGRESERVAULTCOT, '+#13#10+
    ' RC.IDCONTRIBUICAO, '+#13#10+
    ' RC.PERCENTUAL, '+#13#10+
    ' RP.INDICEREAJUSTE, '+#13#10+
    ' RP.INDICECORRECAO, '+#13#10+
    ' C.NOME AS NOMECONTRIBUICAO, '+#13#10+
    ' CT.FLGPARCELAMENTO, '+#13#10+
    ' M.MOESIGLA, '+#13#10+
    ' H.MESREFERENCIA, '+#13#10+
    ' H.IDMOTIVO, '+#13#10+
    ' RC.IDRGVLRMAXRATEIO, '+#13#10+
    ' CT.IDREGRAVLRRESERVA, '+#13#10+
    ' PL.FLGTIPOBUSCACOTA, '+#13#10+
    '''          '' AS DATAINDICECORRECAO '+#13#10+

  ' FROM '+#13#10+
   ' PLANPREV PL, '+#13#10+
   ' CONTPREV CT, '+#13#10+
   ' RESERVAXPLANO RP, '+#13#10+
   ' CONTRIBUICAO C, '+#13#10+
   ' RESERVAXCONTRIB RC, '+#13#10+
   ' HSTCONTRIBPREV H, '+#13#10+
   ' MOEDA M '+#13#10+

  ' WHERE (H.IDPESSJUR             = '+IntToStr(piIdPessJur)+') '+#13#10+
    ' AND (H.IDPLANOPREV           = '+IntToStr(piIdPlanoPrev)+') '+#13#10+
    ' AND (H.IDPESSOA              = '+IntToStr(piIdPessoa)+') '+#13#10+
    ' AND (H.MESCOBRANCA           = '+QuotedStr(psMesCobranca)+') '+#13#10+
    ' AND (RC.IDCONTRIBUICAO       = '+IntToStr(piIdContribuicao)+') '+#13#10+
    ' AND (NVL(H.VALORRECEBIDO,0)  > 0) '+#13#10+
    ' AND (NVL(H.FLGCALCRESERVA,0) = 1) '+#13#10+
    ' AND (H.MESREFERENCIA         = H.MESREFERENCIA) '+#13#10+
    ' AND (H.SEQPROPOSTA           = 1) '+#13#10+
    ' AND (H.IDMOTIVO              = H.IDMOTIVO) '+#13#10+
    ' AND (H.IDPESSOA              = H.IDPESSOA) '+#13#10+
    ' AND (H.IDCONTRIBUICAO        = H.IDCONTRIBUICAO) '+#13#10+
    ' AND (CT.IDPLANOPREV          = H.IDPLANOPREV) '+#13#10+
    ' AND (CT.IDCONTRIBUICAO       = H.IDCONTRIBUICAO) '+#13#10+
    ' AND (RC.IDPLANOPREV          = H.IDPLANOPREV) '+#13#10+
    ' AND (RC.IDCONTRIBUICAO       = H.IDCONTRIBUICAO) '+#13#10+
    ' AND (RP.IDPLANOPREV          = H.IDPLANOPREV) '+#13#10+
    ' AND (RP.IDTIPORESERVA        = RC.IDTIPORESERVA) '+#13#10+
    ' AND (RP.ANALITICOSINTETI     = ''A'') '+#13#10+
    ' AND (PL.IDPLANOPREV          = H.IDPLANOPREV) '+#13#10+
    ' AND (C.IDCONTRIBUICAO        = H.IDCONTRIBUICAO) '+#13#10+
    ' AND (RP.INDICECORRECAO       = M.MOECODIGO(+)) '+#13#10+

  ' ORDER BY '+#13#10+
    ' RC.IDCONTRIBUICAO, '+#13#10+
    ' H.MESREFERENCIA, '+#13#10+
    ' H.IDMOTIVO, '+#13#10+
    ' RP.FLGCOLETIVA, '+#13#10+
    ' RP.NOME '+#13#10;

  qryReservaxPlano.Sql.Clear;
  qryReservaxPlano.Sql.Add(sSql);
  qryReservaxPlano.Open;
end;

//Helio - SOL Nº 253577/17461 PPM Nº 955564
procedure TfrmControleIndivContrib.MontaSelectPartBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
const
      paramQry:array[0..4] of string      = ('ELEGPATRO.MATRICULA', 'PESSOA.NOME', 'PARTPREVPLAN.INSCRICAONUMERO', 'PLANPREV.NOME', 'PATRO.NOME');
      paramQryUnion:array[0..4] of string = ('DE.MATRICULA', 'P.NOME', 'PP.INSCRICAONUMERO', 'PLP.NOME', 'PATRO.NOME');

var
     filtro,
     filtroUnion,
     orderBy,
     FiltroAntigo : String;
     lstFiltroAntigo, //configurado no montaselect
     strLstSplit : TStringList;
     i : Integer;

begin


   lstFiltroAntigo := TStringList.Create;
   strLstSplit := TStringList.Create;

   For i := 0 to MontaSelectPart.Filtro.Count-1 do
   begin
        if i = 0 then
           lstFiltroAntigo.Add('WHERE ');

        lstFiltroAntigo.Add('   ( '+ MontaSelectPart.Filtro[i] + ' )');
        if i <> MontaSelectPart.Filtro.Count-1 then
           lstFiltroAntigo[lstFiltroAntigo.Count-1] :=  lstFiltroAntigo[lstFiltroAntigo.Count-1]+' AND';

   end;

   //quebra o sql no filtro do sql antigo
   //separando o filtro montado pelo montaselect em strLstSplit[1]
   //e a parte anterior do sql em strLstSplit[0]
   sqlText := StringReplace(Trim(sqlText), #13#10, '&&&&',[rfReplaceAll]);
   FiltroAntigo := StringReplace(Trim(lstFiltroAntigo.Text), #13#10, '&&&&',[rfReplaceAll]);
   strLstSplit.Text := StringReplace(sqlText, FiltroAntigo, #13#10, [rfReplaceAll]);
   filtro := StringReplace(strLstSplit[1], '&&&&', #13#10, [rfReplaceAll]);;

   //remove order by, etc do filtro
   filtro := StringReplace(Trim(filtro), #13#10, '&&&&',[rfReplaceAll]);
   strLstSplit.Text := StringReplace(Trim(filtro), 'ORDER BY', #13#10,[rfReplaceAll]);
   filtro := StringReplace(Trim(strLstSplit[0]), '&&&&', #13#10,[rfReplaceAll]);
   orderBy := 'ORDER BY ' + StringReplace(Trim(strLstSplit[1]), '&&&&', #13#10,[rfReplaceAll]);

   filtroUnion := filtro;

   for i := 0 to Length(paramQry) -1 do
        filtroUnion := StringReplace(filtroUnion, paramQry[i], paramQryUnion[i],[rfReplaceAll]);

  FreeAndNil(lstFiltroAntigo);
  FreeAndNil(strLstSplit);

  sqlText := ' SELECT ELEGPATRO.MATRICULA AS C0, ' +#13+
             '        PESSOA.NOME AS C1, ' +#13+
             '        PARTPREVPLAN.INSCRICAONUMERO AS C2, ' +#13+
             '        PLANPREV.NOME AS C3, --PLANO, ' +#13+
             '        PATRO.NOME AS C4, --PATRO, ' +#13+
             '        ELEGPATRO.IDPESSOA, ' +#13+
             '        ELEGPATRO.IDPESSJUR AS C6, ' +#13+
             '        PLANPREV.IDPLANOPREV AS C7, ' +#13+
             '        PESSOA.NOME AS C8, ' +#13+
             '        ELEGPATRO.MATRICULA AS C9, ' +#13+
             '        PATRO.NOME AS PATRO, ' +#13+
             '        PLANPREV.NOME AS PLANO, ' +#13+
             '        SITFUNC.DESCRICAO AS C12, ' +#13+
             '        SITPART.DESCRICAO AS C13, ' +#13+
             '        SITPLANOPREV.DESCRICAO AS C14, ' +#13+
             '        PESSOA.NUMDOCUMENTO AS C15, ' +#13+
             '        PESSOAFISICA.DATANASC AS C16, ' +#13+
             '        PARTPREVPLAN.INSCRICAONUMERO AS C17, ' +#13+
             '        PARTPREVPLAN.INSCRICAODATA AS C18, ' +#13+
             '        ELEGPATRO.DATAINICIOAFAST AS C19, ' +#13+
             '        ELEGPATRO.DATAFIMAFAST AS C20, ' +#13+
             '        PARTPREVPLAN.SEQPROPOSTA AS C21, ' +#13+
             '        PARTPREVPLAN.DTINICIOINSC AS C22, ' +#13+
             '        PESSOA.IDPESSOA AS IDTITULAR, ' +#13+
             '        PESSOA.NOME AS NOMETITULAR, ' +#13+
             '        ELEGPATRO.MATRICULA AS MATRICULATITULAR ' +#13+
             '   FROM PESSOA, ' +#13+
             '        ELEGPATRO, ' +#13+
             '        PARTPREVPLAN, ' +#13+
             '        PESSOA PATRO, ' +#13+
             '        PLANPREV, ' +#13+
             '        SITFUNC, ' +#13+
             '        SITPART, ' +#13+
             '        SITPLANOPREV, ' +#13+
             '        PESSOAFISICA ' +#13+
             '  WHERE PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA ' +#13+
             '    AND ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA ' +#13+
             '    AND ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR ' +#13+
             '    AND PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV ' +#13+
             '    AND PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR ' +#13+
             '    AND ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC ' +#13+
             '    AND PARTPREVPLAN.IDSITPART = SITPART.IDSITPART ' +#13+
             '    AND PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV ' +#13+
             '    AND PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA ' +#13+
             '    AND PARTPREVPLAN.IDPESSJUR IN ' +#13+
             '        (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = 1) ' +#13
             //Helio - SOL Nº 253577/18104 PPM Nº 1283984 //'        AND PARTPREVPLAN.FLGDESATIVADO <> 1 ' +#13


             + filtro +#13+
             ' UNION ' +#13+
             ' SELECT DISTINCT DE.MATRICULA AS C0, ' +#13+
             '                 P.NOME AS C1, ' +#13+
             '                 PP.INSCRICAONUMERO AS C2, ' +#13+
             '                 PLP.NOME AS C3, --PLANO, ' +#13+
             '                 PATRO.NOME AS C4, --PATRO, ' +#13+
             '                 P.IDPESSOA, ' +#13+
             '                 BTT.IDPESSJUR AS C6, ' +#13+
             '                 BTT.IDPLANOPREV AS C7, ' +#13+
             '                 P.NOME AS C8, ' +#13+
             '                 DE.MATRICULA AS C9, ' +#13+
             '                 PATRO.NOME AS PATRO, ' +#13+
             '                 PLP.NOME PLANO, ' +#13+
             '                 SFUNC.DESCRICAO AS C12, --AS SIT_PARTI_TIT_NA_PATROCINADORA, ' +#13+
             '                 SPART.DESCRICAO AS C13, --AS SIT_PARTI_TIT_NA_FUNDAÇÃO, ' +#13+
             '                 SPLANO.DESCRICAO AS C14, --AS SIT_BENEF_NO_PLANO, ' +#13+
             '                 P.NUMDOCUMENTO AS C15, ' +#13+
             '                 PF.DATANASC AS C16, ' +#13+
             '                 PP.INSCRICAONUMERO AS C17, ' +#13+
             '                 PP.INSCRICAODATA AS C17, ' +#13+
             '                 EL.DATAINICIOAFAST AS C18, ' +#13+
             '                 EL.DATAFIMAFAST AS C19, ' +#13+
             '                 PP.SEQPROPOSTA AS C20, ' +#13+
             '                 PP.DTINICIOINSC AS C21, ' +#13+
             '                 TIT.IDPESSOA AS IDTITULAR, ' +#13+
             '                 TIT.NOME AS NOMETITULAR, ' +#13+
             '                 EL.MATRICULA AS MATRICULATITULAR ' +#13+
             '   FROM DEPENTIT        DE, ' +#13+
             '        PESSOA          P, ' +#13+
             '        PESSOA          TIT, ' +#13+
             '        ELEGPATRO       EL, ' +#13+
             '        PESSOAFISICA    PF, ' +#13+
             '        PARTPREVPLAN    PP, ' +#13+
             '        SITPART         SPART, ' +#13+
             '        SITFUNC         SFUNC, ' +#13+
             '        SITPLANOPREV    SPLANO, ' +#13+
             '        BFCIARIOTITPLAN BTT, ' +#13+
             '        PLANPREV        PLP, ' +#13+
             '        PESSOA          PATRO ' +#13+
             '  WHERE DE.IDPESSOA = BTT.IDPESSOA ' +#13+
             '    AND P.IDPESSOA = DE.IDPESSOA ' +#13+
             '    AND TIT.IDPESSOA = DE.IDTITULAR ' +#13+
             '    AND EL.IDPESSOA = DE.IDTITULAR ' +#13+
             '    AND SFUNC.IDSITFUNC = EL.IDSITFUNC ' +#13+
             '    AND SPART.IDSITPART = PP.IDSITPART ' +#13+
             '    AND SPLANO.IDSITPLANOPREV = PP.IDSITPLANOPREV ' +#13+
             '    AND PP.IDPESSOA = EL.IDPESSOA ' +#13+
             '    AND PF.IDPESSOA = DE.IDTITULAR ' +#13+
             '    AND BTT.IDPLANOPREV = PLP.IDPLANOPREV ' +#13+
             '    AND BTT.IDPESSJUR = PATRO.IDPESSOA ' +#13+
             '    AND PP.FLGDESATIVADO <> 1 ' +#13+
             '    AND DE.IDTITULAR <> DE.IDPESSOA ' +#13 //Helio - SOL Nº 253577/18104 PPM Nº 1283984
             + filtroUnion +
             orderBy;
end;

//Helio - SOL Nº 253577/17461 PPM Nº 955564
procedure TfrmControleIndivContrib.AbreQryContribuicaoPendente( psOrdem : string );
begin
       qryContribuicao.DisableControls;

       qryContribuicao.SQL.Clear;
       qryContribuicao.SQL.Add(' SELECT 0.00 AS FLGSELECIONADO, ');
       qryContribuicao.SQL.Add('        D.NODOCUMENTO, ');
       qryContribuicao.SQL.Add('        D.NOSSONUMERO, ');
       qryContribuicao.SQL.Add('        C.NOMERESUM, ');
       qryContribuicao.SQL.Add('        C.NOME, ');
       qryContribuicao.SQL.Add('        HC.MESREFERENCIA, ');
       qryContribuicao.SQL.Add('        HC.MESCOBRANCA, ');
       qryContribuicao.SQL.Add('        HC.DATAPREVISAORECE, ');
       qryContribuicao.SQL.Add('        HC.SALCONTRIB, '); //Taffarel - SIG72382
       qryContribuicao.SQL.Add('        HC.VALORESPERADO, ');
       qryContribuicao.SQL.Add('        HC.VALORRECEBIDO, ');
       qryContribuicao.SQL.Add('        HC.SITRECEBIMENTO, ');
       qryContribuicao.SQL.Add('        HC.IDLOTE, ');
       qryContribuicao.SQL.Add('        HC.NUMRECEBIMENTO, ');
       qryContribuicao.SQL.Add('        HC.FLGDEVOLUCAO, ');
       qryContribuicao.SQL.Add('        DECODE(NVL(HC.FLGDEVOLUCAO, 0), 1, ''devolução'', '''') AS DEVOLUCAO, ');
       qryContribuicao.SQL.Add('        HC.IDMOTIVO, ');
       qryContribuicao.SQL.Add('        HC.DATARECEBIMENTO, ');
       qryContribuicao.SQL.Add('        HC.VALOROP1, ');
       qryContribuicao.SQL.Add('        HC.VALOROP2, ');
       qryContribuicao.SQL.Add('        HC.VALOROP3, ');
       qryContribuicao.SQL.Add('        HC.CODDOCUMENTOPREV, ');
       qryContribuicao.SQL.Add('        HC.VALORCALCULADO, ');
       qryContribuicao.SQL.Add('        HC.FLGDESCFOLHA, ');
       qryContribuicao.SQL.Add('        HC.IDCONTRIBUICAO, ');
       qryContribuicao.SQL.Add('        HC.IDPESSJUR, ');
       qryContribuicao.SQL.Add('        HC.IDPLANOPREV, ');
       qryContribuicao.SQL.Add('        HC.IDPESSOA, ');
       qryContribuicao.SQL.Add('        HC.SEQPROPOSTA, ');
       qryContribuicao.SQL.Add('        HC.DATAINICIO, ');
       qryContribuicao.SQL.Add('        HC.DATAFINAL, ');
       qryContribuicao.SQL.Add('        HC.FLGSITFUNDACAO, ');
       qryContribuicao.SQL.Add('        HC.FLGEVENTO, ');
       qryContribuicao.SQL.Add('        HC.DATACANCELAMENTO, ');
       qryContribuicao.SQL.Add('        HC.DATAEMISSCOB, ');
       qryContribuicao.SQL.Add('        HC.FLGCALCRESERVA, ');
       qryContribuicao.SQL.Add('        HC.PARCELA, ');
       qryContribuicao.SQL.Add('        DE.MATRICULA, ');
       qryContribuicao.SQL.Add('        CP.FLGPAGADOR, ');
       qryContribuicao.SQL.Add('        CP.CODCENTROCUSTOC, ');
       qryContribuicao.SQL.Add('        CP.CODCENTROCUSTOD,            ');
       qryContribuicao.SQL.Add('        CP.CODTIPRECDES,        ');
       qryContribuicao.SQL.Add('        C.NOME NOMECONTRIB, ');
       qryContribuicao.SQL.Add('        CP.CODSUBCONTA, ');
       qryContribuicao.SQL.Add('        CP.CODCENTRORESPON,        ');
       qryContribuicao.SQL.Add('        CP.UNIDNEGOC,        ');
       qryContribuicao.SQL.Add('        HC.CODPORTFORMA AS CODPORTFORMA,        ');
       qryContribuicao.SQL.Add('        HC.IDPLANOPREV AS IDPLANPREVCONTAB,      ');
       qryContribuicao.SQL.Add('        HC.FLGDEVOLUCAO,        ');
       qryContribuicao.SQL.Add('        DECODE(HC.FLGDEVOLUCAO,0, ');
       qryContribuicao.SQL.Add('              DECODE(HC.SITRECEBIMENTO, ');
       qryContribuicao.SQL.Add('                     ''0'',''Não enviada para cobrança'', ');
       qryContribuicao.SQL.Add('                     ''1'',''Enviada e não recebida'', ');
       qryContribuicao.SQL.Add('                     ''2'',''Recebida corretamente'', ');
       qryContribuicao.SQL.Add('                     ''3'',''Recebida com divergência(NT)'', ');
       qryContribuicao.SQL.Add('                     ''4'',''Atrasada e já tratada'', ');
       qryContribuicao.SQL.Add('                     ''5'',''Divergência paga'', ');
       qryContribuicao.SQL.Add('                     ''6'',''Divergência enviada e não recebida'', ');
       qryContribuicao.SQL.Add('                     ''7'',''Financiada ou Renegociada'', ');
       qryContribuicao.SQL.Add('                     ''8'',''Cancelada'', ');
       qryContribuicao.SQL.Add('                     ''9'',''Cobrada na Folha de Benefício''), ');
       qryContribuicao.SQL.Add('              DECODE(HC.SITRECEBIMENTO, ');
       qryContribuicao.SQL.Add('                     ''0'',''Não enviada para devolução'', ');
       qryContribuicao.SQL.Add('                     ''1'',''Enviada e não efetivamente paga'', ');
       qryContribuicao.SQL.Add('                     ''2'',''Paga corretamente'', ');
       qryContribuicao.SQL.Add('                     ''3'',''Paga com divergência(NT)'',                      ');
       qryContribuicao.SQL.Add('                     ''4'',''Atrasada e já tratada'', ');
       qryContribuicao.SQL.Add('                     ''7'',''Financiada ou Renegociada'', ');
       qryContribuicao.SQL.Add('                     ''8'',''Cancelada'', ');
       qryContribuicao.SQL.Add('                     ''9'',''Paga na Folha de Benefício'')) AS NOMESITUACAO, ');
       qryContribuicao.SQL.Add('        CP.IDREGRACALCULO,        ');
       qryContribuicao.SQL.Add('        SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR, 0),''D'',NVL(HA.VALOR, 0),0)) AS SOMAALTERADORES,        ');
       qryContribuicao.SQL.Add('        DECODE(HC.FLGDEVOLUCAO,0,SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR, 0),''D'',NVL(HA.VALOR, 0),0)),SUM(DECODE(TA.ACRESDECRES,''C'',NVL(HA.VALOR, 0),''D'',NVL(-HA.VALOR, 0),0))) AS SOMAALTERADORES, ');
       qryContribuicao.SQL.Add('        ABS(DECODE(HC.FLGDEVOLUCAO,0,NVL(HC.VALORESPERADO, 0),NVL(-HC.VALORESPERADO, 0)) + SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR, 0),''D'',NVL(HA.VALOR, 0),0))) AS TOTALESPERADO, ');
       qryContribuicao.SQL.Add('        DECODE(HC.FLGDEVOLUCAO,0,SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALORRECEBIDO, 0),''D'',NVL(HA.VALORRECEBIDO, 0),0)),SUM(DECODE(TA.ACRESDECRES,''C'',NVL(HA.VALORRECEBIDO, 0),''D'',NVL(-HA.VALORRECEBIDO, 0),0))) AS ALTERADORESRECEB, ');
       qryContribuicao.SQL.Add('        ABS(DECODE(HC.FLGDEVOLUCAO,0,NVL(HC.VALORRECEBIDO, 0),NVL(-HC.VALORRECEBIDO, 0)) + SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALORRECEBIDO, 0),''D'',NVL(HA.VALORRECEBIDO, 0),0))) AS TOTALRECEBIDO, ');
       qryContribuicao.SQL.Add('        D.RECPAG RECPAGDOC, ');
       qryContribuicao.SQL.Add('        HC.VALORBASE1, ');
       qryContribuicao.SQL.Add('        CPP.CODTIPDESEMBDEVOL, ');
       qryContribuicao.SQL.Add('        CPP.PLACONTADEVOL, ');
       qryContribuicao.SQL.Add('        CPP.FLGDESCFOLHA, ');
       qryContribuicao.SQL.Add('        CPP.DIAVENCIMENTO, ');
       qryContribuicao.SQL.Add('        CPP.PLANO, ');
       qryContribuicao.SQL.Add('        CPP.PLANO, ');
       qryContribuicao.SQL.Add('        CPP.PLACONTAC, ');
       qryContribuicao.SQL.Add('        CPP.PLACONTAD, ');
       qryContribuicao.SQL.Add('        CPP.DATAINICIO, ');
       qryContribuicao.SQL.Add('        CPP.DATAINICIO, ');
       qryContribuicao.SQL.Add('        CPP.IDEMPRESA, ');
       qryContribuicao.SQL.Add('        CPP.TIPCODIGO, ');
       qryContribuicao.SQL.Add('        CPP.CODTIPDOC, ');
       qryContribuicao.SQL.Add('        CPP.PLANO13, ');
       qryContribuicao.SQL.Add('        CPP.PLACONTAC13, ');
       qryContribuicao.SQL.Add('        CPP.PLACONTAD13, ');
       qryContribuicao.SQL.Add('        CPP.CODCENTROCUSTOC13, ');
       qryContribuicao.SQL.Add('        CPP.IDEMPRESA13, ');
       qryContribuicao.SQL.Add('        CPP.CODCENTROCUSTOD13, ');
       qryContribuicao.SQL.Add('        CPP.UNIDNEGOC13, ');
       qryContribuicao.SQL.Add('        CPP.IDEMPRESAPROP13, ');
       qryContribuicao.SQL.Add('        CPP.CODCENTRORESPON13, ');
       qryContribuicao.SQL.Add('        CPP.CODSUBCONTA13, ');
       qryContribuicao.SQL.Add('        CPP.RECPAG13, ');
       qryContribuicao.SQL.Add('        CPP.CODTIPRECDES13, ');
       qryContribuicao.SQL.Add('        CPP.TIPCODIGO13, ');
       qryContribuicao.SQL.Add('        CPP.CODTIPDOC13, ');
       qryContribuicao.SQL.Add('        CPP.CODPORTFORMA13, ');
       qryContribuicao.SQL.Add('        CPP.PLACONTADBANCO, ');
       qryContribuicao.SQL.Add('        CPP.PLACONTADBANCO13, ');
       qryContribuicao.SQL.Add('        CPP.CODCCUSTODEVOL, ');
       qryContribuicao.SQL.Add('        PP.SALMANTIDO, ');
       qryContribuicao.SQL.Add('        PP.SALMANTIDO, ');
       qryContribuicao.SQL.Add('        PP.INSCRICAONUMERO, ');
       qryContribuicao.SQL.Add('        SP.FLGINTERNO, ');
       qryContribuicao.SQL.Add('        NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR) IDPESSJURCEDIDO, ');
       qryContribuicao.SQL.Add('        PPC.NOME AS NOMEPLANO ');
       qryContribuicao.SQL.Add('   FROM HSTCONTRIBPREV HC ');
       qryContribuicao.SQL.Add('   JOIN BENEFXTAXA BT ');
       qryContribuicao.SQL.Add('     ON HC.IDCONTRIBUICAO = BT.IDCONTRIBUICAO ');
       qryContribuicao.SQL.Add('   JOIN BFCIARIOTITPLAN BTT ');
       qryContribuicao.SQL.Add('     ON HC.IDPESSOA = BTT.IDRESPONSAVEL ');
       qryContribuicao.SQL.Add('    AND BT.IDBENEFICIO = BTT.IDBENEFICIO ');
       qryContribuicao.SQL.Add('    AND HC.IDPLANOPREV = BTT.IDPLANOPREV ');
       qryContribuicao.SQL.Add('    AND NVL(HC.IDTITULAR, HC.IDPESSOA) = BTT.IDTITULAR ');  // Andre Imakawa - SIG 60728
       qryContribuicao.SQL.Add('   JOIN CONTRIBPREVNUCLEO CPN ');
       qryContribuicao.SQL.Add('     ON HC.IDCONTRIBUICAO = CPN.IDCONTRIBUICAO ');
       qryContribuicao.SQL.Add('    AND BTT.IDNUCLEOFAMILIAR = CPN.IDNUCLEOFAMILIAR ');
       qryContribuicao.SQL.Add('   LEFT JOIN DOCUMENTO D ');
       qryContribuicao.SQL.Add('     ON D.CODDOCUMENTO = HC.CODDOCUMENTOPREV ');
       qryContribuicao.SQL.Add('   JOIN CONTRIBUICAO C ');
       qryContribuicao.SQL.Add('     ON C.IDCONTRIBUICAO = HC.IDCONTRIBUICAO ');
       qryContribuicao.SQL.Add('   JOIN CONTPREV CP ');
       qryContribuicao.SQL.Add('     ON CP.IDCONTRIBUICAO = BT.IDCONTRIBUICAO ');
       qryContribuicao.SQL.Add('    AND CP.IDPLANOPREV = BTT.IDPLANOPREV ');
       qryContribuicao.SQL.Add('   JOIN DEPENTIT DE ');
       qryContribuicao.SQL.Add('     ON DE.IDTITULAR = BTT.IDTITULAR ');
       qryContribuicao.SQL.Add(' 	 AND DE.IDPESSOA = BTT.IDPESSOA ');
       qryContribuicao.SQL.Add('   LEFT JOIN HSTATRASOCONTRIB HA ');
       qryContribuicao.SQL.Add('     ON HA.NUMRECEBIMENTO = HC.NUMRECEBIMENTO ');
       qryContribuicao.SQL.Add('    AND HA.MESCOBRANCA = HC.MESCOBRANCA ');
       qryContribuicao.SQL.Add('    AND HA.MESREFERENCIA = HC.MESREFERENCIA ');
       qryContribuicao.SQL.Add('    AND HA.IDMOTIVO = HC.IDMOTIVO ');
       qryContribuicao.SQL.Add(' 	LEFT JOIN TIPOALTERADOR TA ');
       qryContribuicao.SQL.Add(' 	  ON HA.CODALTERADOR = TA.CODALTERADOR ');
       qryContribuicao.SQL.Add(' 	LEFT JOIN CONTRIBPREVPARTP CPP ');
       qryContribuicao.SQL.Add(' 	  ON CPP.IDPESSJUR = HC.IDPESSJUR ');
       qryContribuicao.SQL.Add(' 	  AND CPP.IDPLANOPREV = HC.IDPLANOPREV ');
       qryContribuicao.SQL.Add(' 	  AND CPP.IDPESSOA = HC.IDPESSOA ');
       qryContribuicao.SQL.Add(' 	  AND CPP.SEQPROPOSTA = HC.SEQPROPOSTA ');
       qryContribuicao.SQL.Add(' 	  AND CPP.IDCONTRIBUICAO = HC.IDCONTRIBUICAO ');
       qryContribuicao.SQL.Add(' 	LEFT JOIN PARTPREVPLAN PP ');
       qryContribuicao.SQL.Add(' 	  ON PP.IDPESSJUR    = HC.IDPESSJUR ');
       qryContribuicao.SQL.Add(' 	  AND PP.IDPLANOPREV = HC.IDPLANOPREV ');
       qryContribuicao.SQL.Add(' 	  AND PP.IDPESSOA    = HC.IDPESSOA ');
       qryContribuicao.SQL.Add(' 	  AND PP.SEQPROPOSTA = HC.SEQPROPOSTA ');
       qryContribuicao.SQL.Add(' 	LEFT JOIN SITPART SP ');
       qryContribuicao.SQL.Add(' 	  ON PP.IDSITPART = SP.IDSITPART ');
       qryContribuicao.SQL.Add(' 	LEFT JOIN ELEGPATRO EL ');
       qryContribuicao.SQL.Add(' 	  ON EL.IDPESSJUR = HC.IDPESSJUR ');
       qryContribuicao.SQL.Add(' 	  AND EL.IDPESSOA = HC.IDPESSOA ');
       qryContribuicao.SQL.Add(' 	LEFT JOIN PLANPREVCONTABIL PPC ');
       qryContribuicao.SQL.Add(' 	  ON HC.IDPLANPREVCONTAB = PPC.IDPLANOPREV ');
       qryContribuicao.SQL.Add('  WHERE HC.IDPESSJUR = ' + qryPendente.FieldByName('IDPESSJUR').AsString );
       qryContribuicao.SQL.Add('    AND HC.IDPLANOPREV = ' + qryPendente.FieldByName('IDPLANOPREV').AsString );
       qryContribuicao.SQL.Add('    AND HC.SEQPROPOSTA = ' + qryPendente.FieldByName('SEQPROPOSTA').AsString );
       qryContribuicao.SQL.Add('    AND BTT.IDPESSOA = ' + qryPendente.FieldByName('IDPESSOA').AsString );
       qryContribuicao.SQL.Add('    AND BTT.IDTITULAR = ' + qryPendente.FieldByName('IDTITULAR').AsString ); // Andre Imakawa - SIG 60728


      If (pmmVisualisaDivergTratadas.Checked) And (cmbSituacao.ItemIndex <> 5)
       Then qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO <> 4 Or (HC.SITRECEBIMENTO = 4 AND NVL(HC.VALORRECEBIDO, 0) > 0))');


      if (Trim(meAnoMesCobranca.Text) <> '') and (Trim(meAnoMesCobranca.Text) <> '/')
      then qryContribuicao.SQL.Add('AND HC.MESCOBRANCA = '''+meAnoMesCobranca.Text+'''');

      //SOL 160427 KITANA 1348415 - Vinicius Ferreira
      if (Trim(meAnoMesReferencia.Text) <> '') and (Trim(meAnoMesReferencia.Text) <> '/')
      then qryContribuicao.SQL.Add('AND HC.MESREFERENCIA = '''+meAnoMesReferencia.Text+'''');


      if (Trim(cmbSituacao.Text) <> '') and (UpperCase(Trim(cmbSituacao.Text)) <> 'TODAS') then
      begin
        // -----------------------------------------------------------------------------------------
        // CPREV_001

        case cmbSituacao.ItemIndex of                                                     // Todas

          1 : qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 0 AND NVL(HC.FLGDEVOLUCAO, 0) = 0) ');  // Não enviada para cobrança
          2 : qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 1 AND NVL(HC.FLGDEVOLUCAO, 0) = 0) ');  // Enviada e não recebido
          3 : qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 2 AND NVL(HC.FLGDEVOLUCAO, 0) = 0) ');  // Recebida corretamente
          4 : qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 3 AND NVL(HC.FLGDEVOLUCAO, 0) = 0) ');  // Recebida com divergência(NT)
          5 : qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 4 AND NVL(HC.FLGDEVOLUCAO, 0) = 0) ');  // Atrasada e já tratada
          6 : qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 5 AND NVL(HC.FLGDEVOLUCAO, 0) = 1) ');  // Divergência paga
          7 : qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 6 AND NVL(HC.FLGDEVOLUCAO, 0) = 0) ');  // Divergência enviada e não recebida
          8 : qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 7 AND NVL(HC.FLGDEVOLUCAO, 0) = 0) ');  // Financiada ou Renegociada
          9 : qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 8) ');                                   // Cancelada
          10: qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 9 AND NVL(HC.FLGDEVOLUCAO, 0) = 0) ');  // Cobrada na Folha de Benefício
          11: qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 0 AND NVL(HC.FLGDEVOLUCAO, 0) = 1) ');  // Não enviada para devolução
          12: qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 1 AND NVL(HC.FLGDEVOLUCAO, 0) = 1) ');  // Enviada e não efetivamente paga
          13: qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 2 AND NVL(HC.FLGDEVOLUCAO, 0) = 1) ');  // Paga corretamente
          14: qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 3 AND NVL(HC.FLGDEVOLUCAO, 0) = 1) ');  // Paga com divergência(NT)
          15: qryContribuicao.SQL.Add('AND (HC.SITRECEBIMENTO = 9 AND NVL(HC.FLGDEVOLUCAO, 0) = 1) ');  // Paga na Folha de Benefício
          16: qryContribuicao.SQL.Add('AND NVL(HC.FLGDEVOLUCAO, 0) = 0 ');                               // Todas (Cobranças)
          17: qryContribuicao.SQL.Add('AND NVL(HC.FLGDEVOLUCAO, 0) = 1 ');                               // Todas (Devoluções)
         end;

        // FIM CPREV_001
        // -----------------------------------------------------------------------------------------
      end;

      qryContribuicao.SQL.Add('  GROUP BY D.NODOCUMENTO, ');
      qryContribuicao.SQL.Add('        D.NOSSONUMERO, ');
      qryContribuicao.SQL.Add('        C.NOMERESUM, ');
      qryContribuicao.SQL.Add('        C.NOME, ');
      qryContribuicao.SQL.Add('        HC.MESREFERENCIA, ');
      qryContribuicao.SQL.Add('        HC.MESCOBRANCA, ');
      qryContribuicao.SQL.Add('        HC.DATAPREVISAORECE, ');
      qryContribuicao.SQL.Add('        HC.SALCONTRIB, '); //Taffarel - SIG72382     
      qryContribuicao.SQL.Add('        HC.VALORESPERADO, ');
      qryContribuicao.SQL.Add('        HC.VALORRECEBIDO, ');
      qryContribuicao.SQL.Add('        HC.SITRECEBIMENTO, ');
      qryContribuicao.SQL.Add('        HC.IDLOTE, ');
      qryContribuicao.SQL.Add('        HC.NUMRECEBIMENTO, ');
      qryContribuicao.SQL.Add('        HC.FLGDEVOLUCAO, ');
      qryContribuicao.SQL.Add('        DECODE(NVL(HC.FLGDEVOLUCAO, 0), 1, ''devolução'', ''''), ');
      qryContribuicao.SQL.Add('        HC.IDMOTIVO, ');
      qryContribuicao.SQL.Add('        HC.DATARECEBIMENTO, ');
      qryContribuicao.SQL.Add('        HC.VALOROP1, ');
      qryContribuicao.SQL.Add('        HC.VALOROP2, ');
      qryContribuicao.SQL.Add('        HC.VALOROP3, ');
      qryContribuicao.SQL.Add('        HC.CODDOCUMENTOPREV, ');
      qryContribuicao.SQL.Add('        HC.VALORCALCULADO, ');
      qryContribuicao.SQL.Add('        HC.FLGDESCFOLHA, ');
      qryContribuicao.SQL.Add('        HC.IDCONTRIBUICAO, ');
      qryContribuicao.SQL.Add('        HC.IDPESSJUR, ');
      qryContribuicao.SQL.Add('        HC.IDPLANOPREV, ');
      qryContribuicao.SQL.Add('        HC.IDPESSOA, ');
      qryContribuicao.SQL.Add('        HC.SEQPROPOSTA, ');
      qryContribuicao.SQL.Add('        HC.DATAINICIO, ');
      qryContribuicao.SQL.Add('        HC.DATAFINAL, ');
      qryContribuicao.SQL.Add('        HC.FLGSITFUNDACAO, ');
      qryContribuicao.SQL.Add('        HC.FLGEVENTO, ');
      qryContribuicao.SQL.Add('        HC.DATACANCELAMENTO, ');
      qryContribuicao.SQL.Add('        HC.DATAEMISSCOB, ');
      qryContribuicao.SQL.Add('        HC.FLGCALCRESERVA, ');
      qryContribuicao.SQL.Add('        HC.PARCELA, ');
      qryContribuicao.SQL.Add('        CP.FLGPAGADOR, ');
      qryContribuicao.SQL.Add('        CP.CODCENTROCUSTOC, ');
      qryContribuicao.SQL.Add('        CP.CODCENTROCUSTOD,        ');
      qryContribuicao.SQL.Add('        CP.CODTIPRECDES,        ');
      qryContribuicao.SQL.Add('        C.NOME, ');
      qryContribuicao.SQL.Add('        CP.CODSUBCONTA, ');
      qryContribuicao.SQL.Add('        CP.CODCENTRORESPON,        ');
      qryContribuicao.SQL.Add('        CP.UNIDNEGOC,        ');
      qryContribuicao.SQL.Add('        HC.CODPORTFORMA,        ');
      qryContribuicao.SQL.Add('        HC.IDPLANOPREV,     ');
      qryContribuicao.SQL.Add('        HC.FLGDEVOLUCAO,       ');
      qryContribuicao.SQL.Add('        CP.IDREGRACALCULO, ');
      qryContribuicao.SQL.Add('        DE.MATRICULA, ');
      qryContribuicao.SQL.Add('        D.RECPAG, ');
      qryContribuicao.SQL.Add('        HC.VALORBASE1, '); 
      qryContribuicao.SQL.Add('        CPP.CODTIPDESEMBDEVOL, ');
      qryContribuicao.SQL.Add('        CPP.PLACONTADEVOL, ');
      qryContribuicao.SQL.Add('        CPP.FLGDESCFOLHA, ');
      qryContribuicao.SQL.Add('        CPP.DIAVENCIMENTO, ');
      qryContribuicao.SQL.Add('        CPP.PLANO, ');
      qryContribuicao.SQL.Add('        CPP.PLANO, ');
      qryContribuicao.SQL.Add('        CPP.PLACONTAC, ');
      qryContribuicao.SQL.Add('        CPP.PLACONTAD, ');
      qryContribuicao.SQL.Add('        CPP.DATAINICIO, ');
      qryContribuicao.SQL.Add('        CPP.DATAINICIO, ');
      qryContribuicao.SQL.Add('        CPP.IDEMPRESA, ');
      qryContribuicao.SQL.Add('        CPP.TIPCODIGO, ');
      qryContribuicao.SQL.Add('        CPP.CODTIPDOC, ');
      qryContribuicao.SQL.Add('        CPP.PLANO13, ');
      qryContribuicao.SQL.Add('        CPP.PLACONTAC13, ');
      qryContribuicao.SQL.Add('        CPP.PLACONTAD13, ');
      qryContribuicao.SQL.Add('        CPP.CODCENTROCUSTOC13, ');
      qryContribuicao.SQL.Add('        CPP.IDEMPRESA13, ');
      qryContribuicao.SQL.Add('        CPP.CODCENTROCUSTOD13, ');
      qryContribuicao.SQL.Add('        CPP.UNIDNEGOC13, ');
      qryContribuicao.SQL.Add('        CPP.IDEMPRESAPROP13, ');
      qryContribuicao.SQL.Add('        CPP.CODCENTRORESPON13, ');
      qryContribuicao.SQL.Add('        CPP.CODSUBCONTA13, ');
      qryContribuicao.SQL.Add('        CPP.RECPAG13, ');
      qryContribuicao.SQL.Add('        CPP.CODTIPRECDES13, ');
      qryContribuicao.SQL.Add('        CPP.TIPCODIGO13, ');
      qryContribuicao.SQL.Add('        CPP.CODTIPDOC13, ');
      qryContribuicao.SQL.Add('        CPP.CODPORTFORMA13, ');
      qryContribuicao.SQL.Add('        CPP.PLACONTADBANCO, ');
      qryContribuicao.SQL.Add('        CPP.PLACONTADBANCO13, ');
      qryContribuicao.SQL.Add('        CPP.CODCCUSTODEVOL, ');
      qryContribuicao.SQL.Add('        PP.SALMANTIDO, ');
      qryContribuicao.SQL.Add('        PP.SALMANTIDO, ');
      qryContribuicao.SQL.Add('        PP.INSCRICAONUMERO, ');
      qryContribuicao.SQL.Add('        SP.FLGINTERNO, ');
      qryContribuicao.SQL.Add('        EL.IDPESSJURCEDIDO, ');
      qryContribuicao.SQL.Add('        EL.IDPESSJUR, ');
      qryContribuicao.SQL.Add('        HC.IDPLANPREVCONTAB, ');
      qryContribuicao.SQL.Add('        PPC.NOME ');

      if Trim(psOrdem) = '' then
         qryContribuicao.SQL.Add(' ORDER BY HC.MESREFERENCIA DESC ')
      else
         qryContribuicao.SQL.Add(psOrdem);

       qryContribuicao.Open;
       qryContribuicao.EnableControls;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
function TfrmControleIndivContrib.titularTemMaisDe3InadConsecutivas : Boolean;
var
     qryTemp : TwwQuery;
begin
       Result := False;

       qryTemp := TwwQuery.Create(Application);
       qryTemp.DatabaseName := dtmBaseDados.dbBaseDados.DataBaseName;

       try
         qryTemp.SQL.Text := 'SELECT DISTINCT' + #13#10 +
                              '      DE.MATRICULA,' + #13#10 +
                              '      P.NOME,' + #13#10 +
                              '      PL.NOME PLANO,' + #13#10 +
                              '      P1.NOME PATRO,' + #13#10 +
                              '      PL.IDPLANOPREV,' + #13#10 +
                              '      P1.IDPESSOA AS IDPATRO,' + #13#10 +
                              '      P1.NOME AS IDPATRO,' + #13#10 +
                              '      S.DESCRICAO,' + #13#10 +
                              '      DE.IDTITULAR,' + #13#10 +
                              '      DE.IDPESSOA' + #13#10 +
                              ' FROM' + #13#10 +
                              '(SELECT Z.IDPESSOA,' + #13#10 +
                              '       Z.MESREFERENCIA,' + #13#10 +
                              '       Z.QTD_NAOPAGA,' + #13#10 +
                              '       DECODE(Z.QTD_NAOPAGA, 0, ''Paga'', ''Aberta'') AS STATUS_MES_ATUAL,' + #13#10 +
                              '       DECODE(Z.QTD_NAOPAGA,' + #13#10 +
                              '              0,' + #13#10 +
                              '              NULL,' + #13#10 +
                              '              DENSE_RANK() OVER(PARTITION BY Z.GRUPO ORDER BY Z.IDPESSOA, Z.IDPLANOPREV, Z.IDPESSJUR, Z.MESREFERENCIA)) AS CONSECUTIVAS,' + #13#10 +
                              '        Z.IDPLANOPREV,' + #13#10 +
                              '        Z.IDPESSJUR' + #13#10 +
                              '  FROM (SELECT Y.*, MAX(Y.MUDOU) OVER(ORDER BY Y.IDPESSOA, Y.IDPLANOPREV, Y.IDPESSJUR, Y.MESREFERENCIA, Y.SEQ) AS GRUPO' + #13#10 +
                              '          FROM (SELECT X.*,' + #13#10 +
                              '                       CASE' + #13#10 +
                              '                         WHEN (X.IDPESSOA <> LAG(X.IDPESSOA) OVER(ORDER BY X.IDPESSOA, X.IDPLANOPREV, X.IDPESSJUR, X.MESREFERENCIA, X.SEQ)) THEN' + #13#10 +
                              '                                  SEQ' + #13#10 +
                              '                         WHEN (X.IDPLANOPREV <> LAG(X.IDPLANOPREV) OVER(ORDER BY X.IDPESSOA, X.IDPLANOPREV, X.IDPESSJUR, X.MESREFERENCIA, X.SEQ)) THEN' + #13#10 +
                              '                                  SEQ' + #13#10 +
                              '                         WHEN (X.IDPESSJUR <> LAG(X.IDPESSJUR) OVER(ORDER BY X.IDPESSOA, X.IDPLANOPREV, X.IDPESSJUR, X.MESREFERENCIA, X.SEQ)) THEN' + #13#10 +
                              '                                  SEQ' + #13#10 +
                              '                         WHEN'  + #13#10 +
                              '                           QTD_NAOPAGA = LAG(QTD_NAOPAGA) OVER(ORDER BY X.IDPESSOA, X.IDPLANOPREV, X.IDPESSJUR, X.MESREFERENCIA, X.SEQ) THEN' + #13#10 +
                              '                          NULL' + #13#10 +
                              '                         ELSE' + #13#10 +
                              //'                          TO_CHAR( TO_DATE(X.MESREFERENCIA, ''YYYY/MM''), ''YYYYMM'')||X.IDPESSOA||X.IDPLANOPREV||X.IDPESSJUR' + #13#10 +
                              '                          SEQ--X.IDPLANOPREV||X.MESREFERENCIA||X.IDPESSOA||X.IDPESSJUR' + #13#10 +
                              '                       END AS MUDOU' + #13#10 +
                              '                  FROM (SELECT H.IDPESSOA,' + #13#10 +
                              '                               H.MESREFERENCIA,' + #13#10 +
                              '                               DECODE(SUM(DECODE(H.SITRECEBIMENTO,' + #13#10 +
                              '                                                 0,' + #13#10 +
                              '                                                 1, -- /*''Nao Enviada''*/,' + #13#10 +
                              '                                                 1,' + #13#10 +
                              '                                                 1, -- ''Enviada e não recebida'',' + #13#10 +
                              '                                                 --3,' + #13#10 +
                              '                                                 --1, -- ''Recebida com divergência (NT)'',' + #13#10 +
                              '                                                 --4,' + #13#10 +
                              '                                                 --1, -- ''Atrasada e ja tratada'',' + #13#10 +
                              '                                                 --6,' + #13#10 +
                              '                                                 --1, -- ''Divergência enviada e não recebida'',' + #13#10 +
                              '                                                 --7,' + #13#10 +
                              '                                                 --1, -- ''Financiada ou Renegociada ''' + #13#10 +
                              '                                                 0)),' + #13#10 +
                              '                                      0,' + #13#10 +
                              '                                      0,' + #13#10 +
                              '                                      1) AS QTD_NAOPAGA,' + #13#10 +
                              '                               RANK() OVER(ORDER BY H.IDPESSOA, H.IDPLANOPREV, H.IDPESSJUR, H.MESREFERENCIA) AS SEQ,' + #13#10 +
                              '                               H.IDPLANOPREV,' + #13#10 +
                              '                               H.IDPESSJUR' + #13#10 +
                              '                          FROM' + #13#10 +
                              '                               HSTCONTRIBPREV H' + #13#10 +
                              '                               JOIN DEPENTIT DE' + #13#10 +
                              '                                 ON DE.IDPESSOA = H.IDPESSOA' + #13#10 +
                              '                               JOIN PARTPREVPLAN PP' + #13#10 +
                              '                                 ON PP.IDPESSOA = DE.IDTITULAR' + #13#10 +
                              '                                AND PP.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                              '                                AND PP.IDPESSJUR = H.IDPESSJUR' + #13#10 +
                              '                                JOIN SITPART S' + #13#10 +
                              '                                  ON S.IDSITPART = PP.IDSITPART' + #13#10 +
                              '                                 --AND S.FLGINTERNO NOT IN (''CA'')' + #13#10 +
                              '                         WHERE H.IDPESSOA = ' + qryTitular.FieldByName('IdPessoa').AsString + #13#10+
                              '                           AND S.FLGINTERNO = ' + QuotedStr(qryTitular.FieldByName('FLGINTERNO').AsString) + #13#10+
                              '                           AND H.IDPLANOPREV = ' + qryTitular.FieldByName('IDPLANOPREV').AsString + #13#10+
                              '                           AND H.IDPESSJUR = ' + qryTitular.FieldByName('IDPESSJUR').AsString + #13#10+
                              '                               AND H.FLGDEVOLUCAO = 0' + #13#10 +
                              '                               AND (S.IDSITPART = 10 OR S.FLGINTERNO NOT IN (''CA''))' + #13#10 +
                              '                               AND NOT EXISTS(SELECT 1 FROM EVENTOSPREV EVNT' + #13#10 +
                              '                                WHERE IDPESSJUR = H.IDPESSJUR' + #13#10 +
                              '                                      AND EVNT.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                              '                                      AND EVNT.IDPESSOA = H.IDPESSOA' + #13#10 +
                              '                                      AND EVNT.SEQPROPOSTA = H.SEQPROPOSTA' + #13#10 +
                              '                                      AND EVNT.DATAVOLTA IS NOT NULL' + #13#10 +
                              '                                      AND EVNT.IDEVENTOGERADOR = 274)' + #13#10 +
                              '                         GROUP BY H.IDPESSOA, H.IDPLANOPREV, H.IDPESSJUR, H.MESREFERENCIA' + #13#10 +
                              '                         ORDER BY H.IDPESSOA, H.IDPLANOPREV, H.IDPESSJUR, H.MESREFERENCIA' + #13#10 +
                              '                         ) X) Y) Z) PARC' + #13#10 +
                              'INNER JOIN DEPENTIT DE' + #13#10 +
                              '   ON DE.IDPESSOA = PARC.IDPESSOA' + #13#10 +
                              'INNER JOIN PESSOA P' + #13#10 +
                              '  ON P.IDPESSOA = PARC.IDPESSOA' + #13#10 +
                              'INNER JOIN PLANPREV PL' + #13#10 +
                              '  ON PL.IDPLANOPREV = PARC.IDPLANOPREV' + #13#10 +
                              'INNER JOIN PESSOA P1' + #13#10 +
                              '  ON P1.IDPESSOA = PARC.IDPESSJUR' + #13#10 +
                              'INNER JOIN PARTPREVPLAN PP' + #13#10 +
                              '  ON PP.IDPESSOA = DE.IDTITULAR' + #13#10 +
                              ' AND PP.IDPLANOPREV = PARC.IDPLANOPREV' + #13#10 +
                              ' AND PP.IDPESSJUR = PARC.IDPESSJUR' + #13#10 +
                              'INNER JOIN SITPART S' + #13#10 +
                              '  ON S.IDSITPART = PP.IDSITPART' + #13#10 +
                              ' --AND S.FLGINTERNO NOT IN (''CA'')' + #13#10 +
                              '  WHERE PARC.CONSECUTIVAS >= 3';


         qryTemp.Open;

         if Not qryTemp.IsEmpty then
             Result := true;
       finally
         qryTemp.Close;
         FreeAndNil(qryTemp);
       end;
end;

end.
