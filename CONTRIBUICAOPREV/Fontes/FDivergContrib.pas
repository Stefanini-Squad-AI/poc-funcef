unit FDivergContrib;

// Alterações:
{
{
-------------------------------------------------------------------------------
Rotina.....: .dfm
Nº WO......: WO38661
Data.......: 30/06/2026
Responsável: Leandro
Descrição..: Inclusao campo PLACONTADEB np qryContab 
--------------------------------------------------------------------------------
Rotina.....: TrataDivergenciaBanco
Nº SIG.....: SIG100591
Data.......: 09/07/2020
Responsável: Edilaine
Descrição..: Permitir filtro por mais de uma contribuição
--------------------------------------------------------------------------------
Nº SIG.....: SIG100430
Data.......: 15/06/2020
Responsável: Taffarel Sevaybriker
Descrição..: Ajuste complementar ao SIG95604.
--------------------------------------------------------------------------------
Rotina.....: TrataDivergenciaBanco
Nº SIG.....: SIG97583
Data.......: 03/03/2020
Responsável: Edilaine
Descrição..: problema ao registrar alteradores no tratamento de divergencias via banco
--------------------------------------------------------------------------------
Nº SIG.....: SIG95604
Data.......: 18/12/2019
Responsável: Taffarel Sevaybriker
Descrição..: Não permitir prosseguir com a cobrança se houver outra contribuição
             pendente vinculada ao mesmo documento.
--------------------------------------------------------------------------------
Nº SIG.....: 95433
Data.......: 16/12/2019
Responsável: Taffarel Sevaybriker
Descrição..: O sistema está vinculando o documento criado nas contribuições preparadas
             no mesmo mês da cobrança.
--------------------------------------------------------------------------------
Alteração  : TrataFiltro, ExibeDivergSintet, ExibeDivergAnalit,
             PreparaQrySintetica, sbtnFluxOperClick, BuscaFiltrosLog,
             edtMesRefExit, chkMesRefClick, cmbFiltraMesRefChange
SIG........: 79795
Data       : 21/12/2018
Responsável: Everson Cunha
Descrição..: Inclusão do filtro Ano/Mês Referência
-------------------------------------------------------------------------------
Alteração  : CobraProxMes, TrataDivergenciaBanco, ExisteAcaoJudicialVigente
SIG........: 50870
Data       : 14/02/2018
Responsável: Denis Horongoso
Descrição..: Verificar se beneficiário possui ação judicial vigente. Caso tenha, não gerar cobrança
-------------------------------------------------------------------------------
Alteração  : ExibeDivergAnalit
SIG........: 64089
Data       : 06/03/2018
Responsável: Luiz Carlos
Descrição..: Alteração na query de divergências para buscar salario de contribuiçao
-------------------------------------------------------------------------------
Alteração  : ExibeDivergAnalit, ExibeDivergSintet
SIG........: 63700
Data       : 27/02/2018
Responsável: Taffarel
Descrição..: Alteração na query de divergências para buscar a situação na HSTCONTRIBPREV
-------------------------------------------------------------------------------
Alteração  : InsereHistorico, ExibeDivergAnalit
SIG........: 51896
Data       : 20/09/2017
Responsável: Taffarel
Descrição..: Adição do campo SALCONTRIB e VALORBASE1 no insert da tabela HSTCONTRIBPREV
-------------------------------------------------------------------------------
Alteração  : FormataCampoFloat, InsereHistorico, CobraProxMes, DescontarnoPrximoBenefcio1Click
             chkSitPartInterno (removido)
SIG........: 35577
Data       : 21/12/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento - Tratamento de divergencia com recebimento
             no proximo beneficio
--------------------------------------------------------------------------------
Alteração  : Timer1
SIG........: 25787
Data       : 28/11/2016
Responsável: Peterson Victor
Descrição..: Criada rotina no Timer1 para despejo de memoria
-------------------------------------------------------------------------------
Alteração  : VerificaCobrancaBancariaPendente
SIG........: 27350
Data       : 25/08/2016
Responsável: William Santana
Descrição..: Contabilmente, estão sendo apropriadas no REG/REPLAN SALDADO
             e no tratamento está contabilizando no REG/REPLAN NÃO SALDADO
-------------------------------------------------------------------------------
Alteração  : Bloqueio de disponibilidade financeira somente para contas à pagar
Nº SIG.....: 23567
Data       : 06/07/2016
Responsável: Michelle Suellyn Mota
Descrição..: Procedure pmnuCobraImedClick
Antes de chamar a função que verifica se possui bloqueio de disponibilidade
financeira, verifica se é contas à pagar ou à receber pelo campo FLGDEVOLUCAO.
{-------------------------------------------------------------------------------
Alteração  : Campo não parametrizado corretamente
Nº SIG.....: 20204
Data       : 20/05/2016
Responsável: Darivaldo Alencar
Descrição..: rotina BaixaDocumentoNAOPAGO alterado parametrização de
             planprevcontab para planprev
-------------------------------------------------------------------------------
Alteração  : TrataDivergenciaBanco
Nº SIG.....: 19562
Data       : 26/04/2016
Responsável: Peterson Victor
Descrição..: Ajuste query
-------------------------------------------------------------------------------
Alteração  : (.dfm) cadastro de email (mnuprinc)
Nº SOL.....: 253577-17744
KTN / PPM  : 1063636
Data       : 04/01/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - inadimplencia
-------------------------------------------------------------------------------
//  Nº SOL: 253577/17778
//  Nº PPM: 1073239
//  Data da Alteração: 06/11/2015
//  Responsável: Robson Andrade
//  DFM        : Ajuste no tratamento de Divergência
//  Descrição:  Ajustar para que seja gerada uma nova planilha contábil no tratamento de divergências.
---------------------------------------------------------------------------------------------------
//  Nº SOL: 253577/17460
//  Nº PPM: 955546
//  Data da Alteração: 15/07/2015
//  Responsável: Helio Lima Custodio
//  DFM        : Ajuste no SQL do qryEnvioBanco
//  Descrição:  Ajustar contribuições para que na integração seja utilizado o plano contábil.
---------------------------------------------------------------------------------------------------
//  Nº SOL: 240582
//  Nº PPM: 563271
//  Data da Alteração: 31/10/2014
//  Responsável: Helio Lima Custodio
//  Descrição:   Muda origem do endereco de e-mail para tratamento de divergencias
---------------------------------------------------------------------------------------------------
Pendência   : SOL 228812 Kintana 2062778
Responsável : Felipe A. Santos
Data        : 24/03/2014
Descrição   : correção do loop infinito na rotina de tratamento de divergências
---------------------------------------------------------------------------------------------------
Pendência   : SOL 205323 KINTANA 1998345
Responsável : WIlliam Santana
Data        : 16/11/2013
Descrição   : Automatização do Processo de Inadimplência de Contribuições.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 86498/11362 KINTANA 1813678
Responsável : BRUNO AZEVEDO
Data        : 16/11/2012
Descrição   : Ajustes no tratamento de divergências.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 188547 KTN 1779022
Responsável : Felipe Azevedo dos Santos
Data        : 16/11/2012
Descrição   : Alteração somente no DFM , inclusão do campo
              Data prevista do pagamento no dbgrdDivergAnalit
---------------------------------------------------------------------------------------------------
Pendência   : SOL 172728 KINTANA 1556309
Responsável : Andre Oliveira
Data        : 07/08/2012
Descrição   : Implementar campos para informar o período a ser tratado
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
Pendência   : SOL 136737 KINTANA 972753
Responsável : BRUNO AZEVEDO
Data        : 13/07/2011
Descrição   : Ajustes na contabilização do tratamento de divergências.
---------------------------------------------------------------------------------------------------
// Autor(a)       :  Renato Visoni
// Data           :  04/02/2010
// Pendência      :  SOL 130020 Kintana 717837
// Descricao      :  Implementar o envio do PGA  no Tratamento de Divergência de Contribuição.
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Autor(a)       :  Jéssica Lana Nunes dos Santos
// Data           :  05/03/2009
// Pendência      : SOL 109421 KINTANA 496332
// Descricao      :  Alteração de gravação de arquivos de log na raiz do disco C: .
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Autor       : André Pontes
Rotina      : DocBaixadoCAR
Data        : 27/11/2007
Pendencia   : 26928
Alteração   : Incluída nova consulta, em caso de documento com status '2', para determinar se há
              valor efetivamente baixado (landtodocum de operação = 5)
----------------------------------------------------------------------------------------------------
Autor       : André Pontes
Rotina      : CobraProxMes(...) e TrataDivergenciaBanco(...) 
Data        : 31/10/2007
Pendencia   : 26750
Alteração   : Mais uma cláusula para determinar se o recebimento está pendente. SitRecebimento = 3
              indica que o recebimento foi efetivamente feito mas esté realmente divergente (para
              o caso de documentos baixados por retorno automático, com valor recebido = 0).
----------------------------------------------------------------------------------------------------
Autor       : Augusto
Rotina      : DocBaixadoCAR
Data        : 27/10/2007
Pendencia   : 26739
Alteração   : Limpar conteudo do componente antes de incluir nova consulta
----------------------------------------------------------------------------------------------------
Autor       : André Pontes
Rotina      : CobraProxMes(...) e TrataDivergenciaBanco(...) 
Data        : 26/10/2007
Pendencia   : 26720
Alteração   : Verificação do valor recebido para determinar se o recebimento está pendente antes de
              olhar o documento.
----------------------------------------------------------------------------------------------------
Autor       : André Pontes
Rotina      : -
Data        : 25/10/2007
Pendencia   : 26716
Alteração   : Corrigido nome do campo para CODDOCUMENTOPREV, onde estava CODOCUMENTOPREV
----------------------------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : TrataDivergenciaBanco
//  Data       : 01/10/2007
//  Pendencia  : 26474
//  Alteração  : Inclusão de testes antes de executar a rotina de verificação de baixa no CAP/CAR
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : BuscaFiltrosLog
//  Data       : 09/08/2007
//  Pendencia  : 25173
//  Alteração  : Ajuste no tratamento de divergências para verificar se o registro
//               já foi baixado no CAP/CAR  
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : BuscaFiltrosLog
//  Data       : 08/01/2007
//  Pendencia  : 22053
//  Alteração  : Implementação de rotina para gravar no LOGTOTALPREV os filtros selecionados.
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : qryPlanilhaDocumento
//  Data       : 23/11/2006
//  Pendencia  : 23825
//  Alteração  : Acerto na propriedade AFTEROPEN da qryPlanilhaDocumento que estava igual a qryDivergAnalit.
// -------------------------------------------------------------------------------------------------
//  Autor      : André Pontes
//  Rotina     : ExibeDivergSintet e ExibeDivergAnalit
//  Data       : 06/11/2006
//  Pendencia  : 23681
//  Alteração  : Retirado o filtro por plano, para tratar todas as divergências, não apenas as do plano atual do participante
//               Retirado o filtro por FLGDESATIVADO = 0 do MontaSelect de seleção de participante
// -------------------------------------------------------------------------------------------------
//  Autor      : André Pontes
//  Rotina     :
//  Data       : 18/09/2006
//  Pendencia  : 23191
//  Alteração  : Controle de contabilização de contribuições anteriores: não contabilizar novamente
//               uma contribuição enviada anteriormente para CaR (se já contabilizada anteriormente),
//               mais gravação da planilha anterior no novo documento
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : InsereHistorico, ExibeDivergAnalit
//  Data       : 17/08/2006
//  Pendencia  : 23028
//  Alteração  : Acerto na função para gravar o campo DATAINICIAL
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : pmnuCobraImedClick
//  Data       : 07/06/2006
//  Pendencia  : 22018
//  Alteração  : Acerto na passagem de parâmetros da funcionalidade TERMINATRANSACAO.
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : TrataDivergenciaBanco
//  Data       : 07/06/2006
//  Pendencia  : 22018
//  Alteração  : Comentada a passagem de parâmetro SNUMRECEBIMENTO DescarregaDocumentos
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : modificação de query
//  Data       : 04/05/2006
//  Pendencia  : 22153
//  Alteração  : Mudança de label de "Atrasada e não paga" para "Atrasada e já tratada".
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : TrataDivergenciaBanco
//  Data       : 10/04/2006
//  Pendencia  : 22018
//  Alteração  : Acerto na passagem de parâmetros para a função DESCARREGADOCUMENTOS
//               única, preenchida pelo usuário
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : pmnuCobraImedClick, pmnuDevolveImedClick , TrataDivergenciaBanco  
//  Data       : 20/03/2006
//  Pendencia  : 21466
//  Alteração  : retirei a crítica de dataprevisaorecebimento para abrirr novo documento, pois, a data de cobrança é
//               única, preenchida pelo usuário
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : EnviaContribuicaoBANCO, EnviaAlteradorBANCO
//  Data       : 16/03/2006
//  Pendencia  : 21614
//  Alteração  : passei o psDataCobranca ao invés da dataprevisaorece que estava sendo passada, do registro
//               anterior
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : TrataDivergenciaBanco
//  Data       : 22/02/2006
//  Pendencia  : 21614
//  Alteração  : buscar o CODPORTFORMA na CONTPLANPATRO e CONTPREV para envio de contribuições para banco
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : qryenviobanco
//  Data       : 16/01/2006
//  Pendencia  : 20769 - 20788 - 20940
//  Alteração  : modificação do campo de plano contábil, colocando NVL(CPP.IDPLANPREVCONTAB,HST.IDPLANOPREV)
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : ExibeDivergSintet, ExibeDivergAnalit
//  Data       : 05/01/2006
//  Pendencia  : 21188
//  Alteração  : modificação na seleção para não cobrar registros de devolução
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : TrataDivergenciaBanco
//  Data       : 03/01/2006  - 06/01/2006
//  Pendencia  : 20769 - 20788 - 20940
//  Alteração  : alteração do envio de altertador. Mudança da posição da chamada para após a descarrega documentos, quando
//               já temos o número.
// -------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : qryenviobanco
//  Pendência  : 20769 - 20788 - 20940
//  Data       : 03/01/2006
//  Descricao  : acrecentei as cláusulas
//   NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR) IDPESSJURCEDIDO
//   DECODE(CPP.IDPLANPREVCONTAB,NULL, HST.IDPLANOPREV) AS IDPLANPREVCONTAB
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : TrataDivergenciaBanco
//  Pendência  : 20769 - 20788 - 20940
//  Data       : 29/12/2005 - 02/01/2006
//  Descricao  : Modificação geral da função para tratar documentos por grupos de pessoas e utilizar a
//               função DescarregaDocumentos como padrão para integração.
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : TrataDivergenciaBanco
//  Pendência  : 20738
//  Data       : 30/11/2005
//  Descricao  : Alterações na chamada da função EnviaAlteradorBANCO
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : ExibeDivergAnalit, ExibeDivergSintet
//  Data       : 30/05/2005
//  Pendência  : 17843
//  Alteração  : Criação do filtro para visualizar ou não as contribuições com
//               divergências já tratadas.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : AlimentaQryDocumentos (chamada)
//  Data       : 16/05/2005
//  Descrição  : tratamento do IDPESSJURCEDIDO
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 16/05/2005
//  Descrição  : alteração da qrydocumentos e updDocumentos para inclusão do campo IDPESSJURCEDIDO
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 19/04/2005
//  Descrição  : alteração da qrydocumentos e updDocumentos para inclusão do campo IDPLANPREVCONTAB
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 13/04/2005
//  Descrição  : alteração da qrydocumentos e updDocumentos para inclusão do campo RECPAG
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : geral
//  Data       : 11/04/2005
//  Descrição  : inclusão do parâmetro do sistema prmIntegraFundacao na verificação de geração de
//               integração contábil/finenceira
//               esta parâmetro indica se deve haver integração no recebimento de contribuições
//               da fundação
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : TrataDivergenciaBanco
//  Pendencia  : 18674
//  Data       : 11/03/2005
//  Descrição  : Acerto na query que busca o CODDOCUMENTOPREV na HSTCONTRIBPREV
//------------------------------------------------------------------------------
// Rotina      : várias
// Autor(a)    : Leo
// Data        : 06.01.2005
// Pendência   : -----
// Descrição   : inclusão de caixa de diálogo e tratamento para possibilitar a escolha
//               do agrupamento de documentos, no envio. O usuário pode escolher o agrupamento por MESREFERENCIA ou
//               fazer lançamentos de vários meses em um só documento.
//------------------------------------------------------------------------------
// Rotina      : várias
// Autor(a)    : Leo
// Data        : 07.12.2004
// Pendência   : -----
// Descricao   : acrescentei o IDMODULO nas queries para cálculo de alteradores
//------------------------------------------------------------------------------
// Rotina      : qryDivergAnalit
// Autor(a)    : Augusto
// Data        : 24/11/2004
// Pendência   : 18155
// Descricao   : Indicação de devolução no Grid Analitico
//------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Data        : 08.10.2004
// Pendência   : 17551
// Descricao   : Substituicao das units do back pelas de 3 camadas :
//                        U D o c u m e n t o    -> U C t r l D o c u m e n t o
//                        U L a n c C o n t a b  -> U C t r l L a n c a m e nt o
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : ExibeDivergAnalit e ExibeDivergSintet
//  Pendencia  : 17849
//  Data       : 06.10.2004
//  Descrição  : Acerto no modo "todas as divergencias" que não exibia as não
//               pagas
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : pmnu
//  Pendencia  : -----
//  Data       : 26.08.2004
//  Descrição  : Tirei menu de registro de inadimplencia pois ele estava
//               completamente diferente do EVENTO registro de inadimplencia
//               e gerando inconsistencias
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : pmnuDevolveIgnoraClick
//  Pendencia  : 17397
//  Data       : 20.07.2004
//  Descrição  : Impedir de ignorar diferença se o VALORRECEBIDO for nulo ou 0.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : PreparaQryJurosAtraso
//  Data       : 19.08.2004
//  Descrição  : passagem do flgevento na query
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : -----
//  Pendencia  : 16635
//  Data       : 20.07.2004
//  Descrição  : Padronização das mensagens
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : VerificaCobrancaBancariaPendente
//  Pendencia  : 16635
//  Data       : 20.07.2004
//  Descrição  :
//              *** ESPECIFICACAO *** 
//              Quando uma contribuicao, enviada para o contas a receber, não
//              for paga, iremos baixar o documento referente ao mês não pago
//              O documento ficará como baixado porém não pago.
//              Para isso, ele deve ficar com status 2 e ter um lancamento na
//              lanctodocum com operacao 4 e codigo do alterador
//              Além disso, se o parametro for contabiliza no envio,
//              ao lancarmos o documento para o mes seguinte, este documento
//              não deve mais ser contabilizado, apenas seus alteradores devem
//              ser contabilizados, pois o valor principal foi contabilizado
//              no 1o. envio.
//              ----------------------------------------------------------------
//              1a. Cobranca   | Diverg. Cobrar em | Contabilizacao
//              ----------------------------------------------------------------
//              Banco          | Banco             | Só contabilizar alteradores
//              ----------------------------------------------------------------
//              Banco          | Desc. Folha       | ?????
//              ----------------------------------------------------------------
//              Desc. Folha    | Banco             | ?????
//              ----------------------------------------------------------------
//              Desc. Folha    | Desc. Folha       | ?????
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : -----
//  Data       : 14.07.2004
//  Descrição  : a seleção por forma de pagamento não estava sendo respeitada por que
//               as funções de exibição pegavam este campo da HSTCONTRIBPREV. Alterei para
//               pegar da CONTRIBPREVPARTP
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : -----
//  Data       : 14.07.2004
//  Descrição  : correção da função de envio automático que tem um diálogo perguntando se deseja enviar, deseja enviar todos ou não deseja
//               caso o usuário escolhesse a opção não enviar, o diálogo aparrecia novamente para todas as contribuições
//               selecionadas
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : -----
//  Data       : 07.07.2004
//  Pendência  : 17155
//  Descrição  : Gerar RAD na inclusao de documentos
//------------------------------------------------------------------------------
// Rotina      : ----
// Autor(a)    : Camille
// Pendencia   : 16437
// Data        : 02.07.2004
// Alteração   : Colocar categoria interna de sitpart como filtro
//------------------------------------------------------------------------------
// Rotina      : ----
// Autor(a)    : Camille
// Pendencia   : 16781
// Data        : 23.06.2004
// Alteração   : Gravar numero de recebimentos mesmo que não tenham sido contabilizados
//               caso contrario, não agrupa boletas
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 14/06/2004
// Alteração   : Novos parametros para pesquisa
//------------------------------------------------------------------------------
// Rotina      : CalculaAlteradores
// Autor(a)    : Leo
// Data        : 03.06.2004
// Alteração   : teste de parametro(prmFLGACUMALTER) para verificar se acumula valores de alteradores
//------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Pendência   : 16781
// Data        : 12.05.2004
// Alteração   : Essa pendencia foi recusada pois o erro não ocorria, porém
//               foi feita uma otimização para perguntar uma única vez se deseja
//               enviar
//------------------------------------------------------------------------------
// Rotina      : pmnuCobraImedClick
// Autor(a)    : Camille
// Pendência   : 15009 - Reaberta
// Data        : 05.05.2004
// Alteração   : Chamar rotina de envio da ucontribuicaoprev e não
//               o frmControleIndivContrib
//------------------------------------------------------------------------------
// Rotina      : AlimentaQryDocumentos
// Autor(a)    : Ricardo Vigorito
// Pendência   : 16178
// Data        : 04/03/2004
// Alteração   : alteração da chamadas da função, incluindo a passagem do
//  idContribuicao
//------------------------------------------------------------------------------
// Rotina      : pmnuCobraImedClick
// Autor(a)    : Gleyber
// Data        : 30/12/2003
// Pendência   : 15009
// Alteração   : Implementando opção de envio para cobrança bancária.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 23.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      : ExibeDivergSintet
// Autor(a)    : Carlos Guedes
// Data        : 13/05/2003
// Alteração   : Acrescentando o ítem "Cancelado" ao sFlgSitPart
//------------------------------------------------------------------------------
// Rotina      : InsereHistorico
// Autor(a)    : Augusto
// Data        : 16/04/2003
// Alteração   : Não corrige os registros enviados para Folha de Beneficio,
//               ela corrigirá depois
//------------------------------------------------------------------------------
// Rotina      : TrataDivergenciaBanco
// Autor(a)    : Leo
// Data        : 17/10/2002
// Alteração   : comentei integração com contar a receber
//               o envio efetivo vai ser feito no envio normal do mês
//------------------------------------------------------------------------------
// Rotina      : InsereHistorico
// Autor(a)    : Leo
// Data        : 13/09/2002
// Alteração   : FOLHAORIGEM ''C'' PARA REGISTROS ENVIADOS PARA BANCO
//------------------------------------------------------------------------------
// Rotina      : AtualizaVlHistorico
// Autor(a)    : Leo
// Data        : 27/08/2002
// Alteração   : acerto na atualização do sitrecebimento
//------------------------------------------------------------------------------
// Rotina      : GERAL
// Autor(a)    : Leo
// Data        : 01/07/2002
// Alteração   : modificações gerais para atender alteradores divergentes
//------------------------------------------------------------------------------
// Rotina      : PreparaQryJurosAtraso
// Autor(a)    : Leo
// Data        : 26/06/2002
// Alteração   : acrescentei o nvl na comparação de valores que não funcionava caso um fosse nulo
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 26/06/2002
// Alteração   : tratamento para FLGDEVOLUCAO
//------------------------------------------------------------------------------
// Rotina      : ExibeDivergAnalit
// Autor(a)    : Leo
// Data        : 14/06/2002
// Alteração   : retirei tabela PESSOAFISICA da query, retirei algumas cláusulas do where
//------------------------------------------------------------------------------
// Rotina      : qrydocumentos
// Autor(a)    : Leo
// Data        : 13/06/2002
// Alteração   : incluí o flgdevolucao
//------------------------------------------------------------------------------
// Rotina      : AlimentaQryDocumentos
// Autor(a)    : Leo
// Data        : 06/06/2002
// Alteração   : alteração da chamadas da função, incluindo (zero) no último parâmetro(flgdevolucao)
----------------------------------------------------------------------------------------------------
 Responsável: Leonardo
 Essa função tem como objetivo tratar os casos de divergências no recebimento
 de contribuições previdenciárias.
 Alteracoes :
 06.11.2000 : Cada tipo de tratamento dado pelo usuario será gravado com um código
              no histórico de contribuicao para uma futura identificação. Os códigos são:
              0 - nao é divergencia
              1 - Cobrar Diferença via Interface
              2 - Cobrar Diferença via Cobrança Bancária
              3 - Descontar no Próximo Benefício
              4 - Devolver Diferença via Interface
              5 - Devolver Diferença via Devolução Bancária
              6 - Acrescentar no Próximo Benefício
              7 - Adicionar Diferença como Aporte
              8 - Ignorar Diferença - Ainda não recalculou a patronal
              9 - Ignorar Diferença - Já recalculou a patronal
----------------------------------------------------------------------------------------------------
  Lise - 05/11/2001
  Alterada qryContabil valores dos campos IDPESSJUR, IDPLANOPREV de 1 para -1.00 .
  Alterada qryDocumentos valores dos campos idpessjur, idplanoprev de 1 para -1.00 .
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  ComCtrls, Spin, wwdblook, Db, DBTables, Wwquery, MontaSelect, Grids,
  Wwdbigrd, Wwdbgrid, Wwdatsrc, Menus, TB97Ctls, TB97Tlwn, TREdit, DBCtrls,
  Mask, wwdbedit, URegra, Gauges, UConsPart, IvDictio, IvMulti, IvEMulti, UCtrlDocumento,
  UCtrlLancamento, uCtrlFinanc, ImgList, wwdbdatetimepicker,
  CMDateTimePicker, ppDB, ppParameter, ppBands, ppMemo, ppModule, raCodMod,
  ppCtrls, ppReport, ppStrtch, ppSubRpt, jpeg, ppPrnabl, ppClass, ppVar,
  ppCache, ppProd, ppRelatv, ppDBPipe, ppDBBDE, ppComm, ppEndUsr,
  OleServer, Outlook8, comobj, TXComp, TXRB, DBClient, wwclient,
  FSelecionaLote, CheckLst;   // edilaine - SIG35577

const
   vetOperador : array[0..5] of string[2] = ('= ','> ','>=','< ','<=','<>');

type
  // edilaine - SIG35577: inicio
  TRLote = record
    iIdLoteSelecionado : integer;
    sMesCobranca       : string;
    sDataPagamento     : string;
  end;
  // edilaine - SIG35577: fim
  
  TfrmDivergContrib = class(TfrmOkCancelar)
    imModos: TImageList;
    pnlDireita: TPanel;
    pnlEsquerda: TPanel;
    trvModos: TTreeView;
    pnlDirTopo: TPanel;
    lblModo: TLabel;
    lblTituloMesRef: TLabel;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    pgctrlDivergencias: TPageControl;
    tbsFiltro: TTabSheet;
    tbsDivergencias: TTabSheet;
    pnlTabSheetFiltro: TPanel;
    pnlFiltroEsq: TPanel;
    pnlFiltro1: TPanel;
    pnlFiltro2: TPanel;
    pnlFiltro3: TPanel;
    pnlFiltro4: TPanel;
    pnlFiltro5: TPanel;
    chkPatro: TCheckBox;
    chkPlano: TCheckBox;
    chkContrib: TCheckBox;
    chkTempo: TCheckBox;
    chkParticipante: TCheckBox;
    Panel1: TPanel;
    chkValor: TCheckBox;
    pnlFiltroDir: TPanel;
    pnlFiltroDir1: TPanel;
    pnlFiltroDir2: TPanel;
    pnlFiltroDir3: TPanel;
    pnlFiltroDir4: TPanel;
    pnlFiltroDir5: TPanel;
    pnlFiltroDir6: TPanel;
    dblkpcmbPatro: TwwDBLookupCombo;
    edParticipante: TEdit;
    cmbFiltraTempo: TComboBox;
    cmbFiltraValor: TComboBox;
    dblkpcmbPlano: TwwDBLookupCombo;
    dblkpcmbContrib: TwwDBLookupCombo;
    spbtnProcParticip: TSpeedButton;
    pnlDivergencia: TPanel;
    edTempo: TEdit;
    edValor: TEdit;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    qryContrib: TwwQuery;
    MontaSelectPart: TMontaSelect;
    qryDivergSintet: TwwQuery;
    dbgrdDivergSintet: TwwDBGrid;
    dsDivergSintet: TwwDataSource;
    dbgrdDivergAnalit: TwwDBGrid;
    qryDivergAnalit: TwwQuery;
    dsDivergAnalit: TwwDataSource;
    pmnu: TPopupMenu;
    pnlFiltroBottom: TPanel;
    pmnuCobraProx: TMenuItem;
    pmnuCobraImed: TMenuItem;
    pmnuDevolveProx: TMenuItem;
    pmnuDevolveImed: TMenuItem;
    pmnuDevolveIgnora: TMenuItem;
    pmnuAdiconarDif: TMenuItem;
    Splitter1: TSplitter;
    DescontarnoPrximoBenefcio1: TMenuItem;
    AcrescentarnoPrximoBenefcio1: TMenuItem;
    pnlResult: TPanel;
    SaveDlg: TSaveDialog;
    Dock97Top: TDock97;
    tb97Atalho: TToolbar97;
    sbtndiverganalit: TToolbarButton97;
    spbtnDivergSintet: TToolbarButton97;
    sbtnFluxOper: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    bbtnVerResultado: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    ToolbarSep975: TToolbarSep97;
    ToolbarSep976: TToolbarSep97;
    tb97Param: TToolWindow97;
    pnlTextoFluxOper: TPanel;
    Bevel1: TBevel;
    pnlparam: TPanel;
    grpbxvlraceite: TGroupBox;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    SpeedButton20: TSpeedButton;
    qryparam: TwwQuery;
    dsparam: TwwDataSource;
    RealEdit1: TRealEdit;
    N1: TMenuItem;
    ParmetrosPadro1: TMenuItem;
    BitBtn1: TBitBtn;
    SpeedButton3: TSpeedButton;
    qryaux: TwwQuery;
    qrybusca: TwwQuery;
    RegCalculo: TRegra;
    qryexecuta: TwwQuery;
    qryatraso: TwwQuery;
    qryalterador: TwwQuery;
    pnlProgresso: TPanel;
    lblMsg2: TLabel;
    gagProgresso: TGauge;
    imVerifica: TImage;
    lblMsg1: TLabel;
    btncancelaprogress: TBitBtn;
    qryDivergSintetAux: TwwQuery;
    wwDBGrid1: TwwDBGrid;
    qryalteradorxcontrib: TwwQuery;
    dsalteradorxcontrib: TwwDataSource;
    ConsPart1: TConsPart;
    DadosdoParticipante1: TMenuItem;
    qryaltaux: TwwQuery;
    RichEdAdaptacao: TRichEdit;
    Panel2: TPanel;
    bbtnVoltar: TBitBtn;
    bbtnSalvar: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    memResult: TMemo;
    Splitter2: TSplitter;
    mnuprinc: TMainMenu;
    GerarContribuies1: TMenuItem;
    ParmetrosPadro2: TMenuItem;
    DadosdoParticipante2: TMenuItem;
    N2: TMenuItem;
    CobrarDiferenanoProximoMs1: TMenuItem;
    CobrarDiferenaImediatamente1: TMenuItem;
    DescontarnoPrximoBenefcio2: TMenuItem;
    DevolverDiferenanoPrximoMs1: TMenuItem;
    DevolverDiferenaImediatamente1: TMenuItem;
    AcrescentarnoPrximoBenefcio2: TMenuItem;
    AdicionarDiferenacomoAporte1: TMenuItem;
    IgnorarDiferena1: TMenuItem;
    N3: TMenuItem;
    RegistrarInadimplncia2: TMenuItem;
    ContribuiesnoRecebidasPeloInterface1: TMenuItem;
    Preparo1: TMenuItem;
    qrycontribaux: TwwQuery;
    VerificarParticipantesDevedores1: TMenuItem;
    dbgrdDivergAnalitIButton: TwwIButton;
    dbgrdDivergSintetIButton: TwwIButton;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    qryreservaxcontrib: TwwQuery;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    qryUpdReservaPart: TwwQuery;
    pnlFiltro6: TPanel;
    chkSituacao: TCheckBox;
    pnlFiltroDirSit: TPanel;
    cmbSituacao: TComboBox;
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
    qryAux1: TwwQuery;
    qryEnvioBanco: TwwQuery;
    qryContabilIDPESSJUR: TFloatField;
    qryContabilIDPLANOPREV: TFloatField;
    qryAcertaContrib: TwwQuery;
    pmnuRecalcularPatronais: TMenuItem;
    qryNumRecebAEnviar: TwwQuery;
    updNumRecebAEnviar: TUpdateSQL;
    Panel4: TPanel;
    ChkTipoCobranca: TCheckBox;
    Panel5: TPanel;
    CbxTipoCobranca: TComboBox;
    Panel6: TPanel;
    ChkFormaPagamento: TCheckBox;
    Panel7: TPanel;
    DbLkcFormaPagamento: TwwDBLookupCombo;
    QryFormaPagamento: TwwQuery;
    qrySitPartInterno: TwwQuery;
    chkTodasDiverg: TCheckBox;
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
    pnlFiltro8: TPanel;
    chkDivTrat: TCheckBox;
    qryPlanilhaDocumento: TwwQuery;
    qryPlanilhaDocumentoPLNCODIGO: TFloatField;
    cmdtDataReceInicial: TCMDateTimePicker;
    cmdtDataReceFinal: TCMDateTimePicker;
    lblRecPeriodo: TLabel;
    Label2: TLabel;
    UpdateSQL1: TUpdateSQL;
   //William Santana SOL 205323 KIN 1998345
    pdsg1: TppDesigner;
    ppAuxEmail: TppBDEPipeline;
    TppTEnvioEmail: TppReport;
    ppParameterList1: TppParameterList;
    qryAuxEmail: TwwQuery;
    dsEnvioEmail1: TwwDataSource;
    ppDivAnalit: TppBDEPipeline;
    outlook: TOutlookApplication;
    extr1: TExtraOptions;
    pplfDivAnalitppField1: TppField;
    pplfDivAnalitppField2: TppField;
    pplfDivAnalitppField3: TppField;
    pplfDivAnalitppField4: TppField;
    pplfDivAnalitppField5: TppField;
    pplfDivAnalitppField6: TppField;
    pplfDivAnalitppField7: TppField;
    pplfDivAnalitppField8: TppField;
    pplfDivAnalitppField9: TppField;
    pplfDivAnalitppField10: TppField;
    pplfDivAnalitppField11: TppField;
    pplfDivAnalitppField12: TppField;
    pplfDivAnalitppField13: TppField;
    pplfDivAnalitppField14: TppField;
    pplfDivAnalitppField15: TppField;
    pplfDivAnalitppField16: TppField;
    pplfDivAnalitppField17: TppField;
    pplfDivAnalitppField18: TppField;
    pplfDivAnalitppField19: TppField;
    pplfDivAnalitppField20: TppField;
    pplfDivAnalitppField21: TppField;
    pplfDivAnalitppField22: TppField;
    pplfDivAnalitppField23: TppField;
    pplfDivAnalitppField24: TppField;
    pplfDivAnalitppField25: TppField;
    pplfDivAnalitppField26: TppField;
    updRep: TUpdateSQL;
    qryRep: TwwQuery;
    pplfAuxEmailppField1: TppField;
    pplfAuxEmailppField2: TppField;
    pplfAuxEmailppField3: TppField;
    pplfAuxEmailppField4: TppField;
    pplfAuxEmailppField5: TppField;
    pplfAuxEmailppField6: TppField;
    pplfAuxEmailppField7: TppField;
    pplfAuxEmailppField8: TppField;
    phdrbnd1: TppHeaderBand;
    psystmvrbl1: TppSystemVariable;
    plbl1: TppLabel;
    plbl2: TppLabel;
    pmg1: TppImage;
    plbl15: TppLabel;
    plbl16: TppLabel;
    plbl17: TppLabel;
    pmpar1: TppMemo;
    plbl5: TppLabel;
    plbl6: TppLabel;
    plbl7: TppLabel;
    plbl8: TppLabel;
    plbl9: TppLabel;
    plbl10: TppLabel;
    plbl11: TppLabel;
    plbl12: TppLabel;
    pln1: TppLine;
    pln2: TppLine;
    pln3: TppLine;
    pln4: TppLine;
    pln5: TppLine;
    pln7: TppLine;
    pln6: TppLine;
    pdtlbnd1: TppDetailBand;
    sub1: TppSubReport;
    pchldrprt1: TppChildReport;
    ptlbnd1: TppTitleBand;
    pdtlbnd2: TppDetailBand;
    pln10: TppLine;
    pln12: TppLine;
    pln15: TppLine;
    pln16: TppLine;
    pln17: TppLine;
    pln18: TppLine;
    pln20: TppLine;
    psmrybnd1: TppSummaryBand;
    pln19: TppLine;
    pln11: TppLine;
    plbl13: TppLabel;
    plbl14: TppLabel;
    pln13: TppLine;
    pln14: TppLine;
    pln8: TppLine;
    rcdmdl1: TraCodeModule;
    pftrbnd1: TppFooterBand;
    plbl3: TppLabel;
    plbl4: TppLabel;
    pmpar3: TppMemo;
    pmpar4: TppMemo;
    pm5: TppMemo;
    pmpar2: TppMemo;
    pdbtxt1: TppDBText;
    pdbtxt2: TppDBText;
    pdbtxt3: TppDBText;
    pdbm1: TppDBMemo;
    pdbtxt4: TppDBText;
    pdbtxt5: TppDBText;
    pvrbl1: TppVariable;
    qryFLGemail: TwwQuery;
    strngfldFLGemailMESREFERENCIA: TStringField;
    strngfldFLGemailMESCOBRANCA: TStringField;
    fltfldFLGemailNUMRECEBIMENTO: TFloatField;
    fltfldFLGemailIDMOTIVO: TFloatField;
    fltfldFLGemailIDPESSOA: TFloatField;
    fltfldFLGemailIDRETROATIVO: TFloatField;
    fltfldFLGemailVALORESPERADO: TFloatField;
    fltfldFLGemailIDPLANOPREV: TFloatField;
    fltfldFLGemailIDREGRAALIMRESER: TFloatField;
    fltfldFLGemailIDREGRACALCULO: TFloatField;
    dtmfldFLGemailDATARECEBIMENTO: TDateTimeField;
    fltfldFLGemailIDCONTRIBUICAO: TFloatField;
    fltfldFLGemailVALORRECEBIDO: TFloatField;
    fltfldFLGemailQUANTCOTAS: TFloatField;
    dtmfldFLGemailDATAPREVISAORECE: TDateTimeField;
    fltfldFLGemailCODPORTFORMA: TFloatField;
    fltfldFLGemailPLNCODIGOPREV: TFloatField;
    fltfldFLGemailVALORBASE1: TFloatField;
    fltfldFLGemailCODDOCUMENTOPREV: TFloatField;
    fltfldFLGemailPLNCODIGOEFET: TFloatField;
    fltfldFLGemailCODDOCUMENTOEFET: TFloatField;
    fltfldFLGemailVALORBASE2: TFloatField;
    fltfldFLGemailFLGCALCRESERVA: TFloatField;
    fltfldFLGemailVALORCALCULADO: TFloatField;
    fltfldFLGemailVALOROP1: TFloatField;
    fltfldFLGemailVALOROP2: TFloatField;
    fltfldFLGemailVALOROP3: TFloatField;
    fltfldFLGemailFLGDESCFOLHA: TFloatField;
    strngfldFLGemailCODREFERENCIA: TStringField;
    fltfldFLGemailFATOR: TFloatField;
    dtmfldFLGemailDATAINICIO: TDateTimeField;
    dtmfldFLGemailDATAFINAL: TDateTimeField;
    fltfldFLGemailIDHISTPROPOSTA: TFloatField;
    strngfldFLGemailFLGSITFUNDACAO: TStringField;
    fltfldFLGemailIDLOTE: TFloatField;
    strngfldFLGemailSITRECEBIMENTO: TStringField;
    strngfldFLGemailTIPO: TStringField;
    fltfldFLGemailPARCELA: TFloatField;
    fltfldFLGemailSEQPROPOSTA: TFloatField;
    fltfldFLGemailVLRTOTRETROATIVO: TFloatField;
    fltfldFLGemailVLRDIFRETROATIVO: TFloatField;
    fltfldFLGemailFLGAPORTE: TFloatField;
    dtmfldFLGemailDTCOBRANCA: TDateTimeField;
    fltfldFLGemailFLGDEVOLUCAO: TFloatField;
    fltfldFLGemailFLGDIVERGENTE: TFloatField;
    fltfldFLGemailFLGCONCESSAO: TFloatField;
    fltfldFLGemailFLGEVENTO: TFloatField;
    fltfldFLGemailFONTEPAGADORA: TFloatField;
    dtmfldFLGemailTRGDTINCLUSAO: TDateTimeField;
    strngfldFLGemailTRGUSERINCLUSAO: TStringField;
    dtmfldFLGemailDATAULTALIM: TDateTimeField;
    fltfldFLGemailPERCRESERVA: TFloatField;
    fltfldFLGemailIDPESSJUR: TFloatField;
    dtmfldFLGemailDATAEMISSCOB: TDateTimeField;
    strngfldFLGemailMOTIVOCANCEL: TStringField;
    strngfldFLGemailFLGINTEVENTO: TStringField;
    dtmfldFLGemailDATACANCELAMENTO: TDateTimeField;
    strngfldFLGemailFLGDATAINDRESERV: TStringField;
    fltfldFLGemailNUMRECPARCELA1: TFloatField;
    fltfldFLGemailNUMRECPARCELA2: TFloatField;
    fltfldFLGemailIDLANCIRRF: TFloatField;
    fltfldFLGemailOPTRATDIVERG: TFloatField;
    fltfldFLGemailPERCCALCULO: TFloatField;
    fltfldFLGemailVALORPARARESERVA: TFloatField;
    fltfldFLGemailFLGMANUAL: TFloatField;
    strngfldFLGemailFOLHAORIGEM: TStringField;
    fltfldFLGemailIDPARCELAMENTO: TFloatField;
    fltfldFLGemailIDMOVBENEF: TFloatField;
    fltfldFLGemailIDTIPORECURSO: TFloatField;
    strngfldFLGemailORIGEMRECURSO: TStringField;
    fltfldFLGemailIDTITULAR: TFloatField;
    fltfldFLGemailCODDOCUMENTOPGAPAGAR: TFloatField;
    fltfldFLGemailCODDOCUMENTOPGARECEBER: TFloatField;
    fltfldFLGemailIDPORTABILIDADE: TFloatField;
    fltfldFLGemailSALCONTRIB: TFloatField;
    dtmfldFLGemailTRGDTALTERACAO: TDateTimeField;
    strngfldFLGemailTRGUSERALTERACAO: TStringField;
    fltfldFLGemailIDRUBRICA: TFloatField;
    strngfldFLGemailNUMBANCO: TStringField;
    strngfldFLGemailNUMAGENCIA: TStringField;
    strngfldFLGemailCONTACORRENTE: TStringField;
    fltfldFLGemailPLNCODIGO: TFloatField;
    fltfldFLGemailIDCONTRATOEMPTMO: TFloatField;
    fltfldFLGemailFLGIMPORTADO: TFloatField;
    strngfldFLGemailUSERINTEGRACAO: TStringField;
    dtmfldFLGemailDTINTEGRACAO: TDateTimeField;
    fltfldFLGemailFLGENVIOEMAIL: TFloatField;
    dtmfldFLGemailDTAENVIOEMAIL: TDateTimeField;
    pvrbl2: TppVariable;
    cdsAuxEmail: TClientDataSet;
    strngfldAuxEmailIDPESSOA: TStringField;
    strngfldAuxEmailIDPESSJUR: TStringField;
    strngfldAuxEmailIDPLANOPREV: TStringField;
    strngfldAuxEmailMATRICULA: TStringField;
    strngfldAuxEmailMESREFERENCIA: TStringField;
    strngfldAuxEmailMESCOBRANCA: TStringField;
    strngfldAuxEmailIDMOTIVO: TStringField;
    strngfldAuxEmailNUMRECEBIMENTO: TStringField;
    Timer1: TTimer;
    MontaSelectPartbkp: TMontaSelect;
    pnlMesRef: TPanel;
    chkMesRef: TCheckBox;
    pnlFiltroMesRef: TPanel;
    cmbFiltraMesRef: TComboBox;
    edtMesRef: TEdit;
    qryDivergencias: TwwQuery; //TAES - SIG100430
    pnlValidacao: TPanel; //TAES - SIG100430
    lblValidacao: TLabel; //TAES - SIG100430
    gagValidacao: TGauge;
    chklstContrib: TCheckListBox;
    qryFiltroContrib: TwwQuery;
    qryContabilPLACONTADEBITO: TStringField; //TAES - SIG100430
    //END - William Santana SOL 205323 KIN 1998345

    procedure trvModosCollapsing(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
    procedure trvModosExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
    procedure trvModosChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure dblkpcmbPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbPlanoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbContribCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure edTempoExit(Sender: TObject);
    procedure edValorExit(Sender: TObject);
    procedure spbtnProcParticipClick(Sender: TObject);
    procedure dblkpcmbPatroExit(Sender: TObject);
    procedure dblkpcmbPlanoExit(Sender: TObject);
    procedure dblkpcmbContribExit(Sender: TObject);
    procedure chkPatroClick(Sender: TObject);
    procedure chkPlanoClick(Sender: TObject);
    procedure chkContribClick(Sender: TObject);
    procedure chkTempoClick(Sender: TObject);
    procedure chkValorClick(Sender: TObject);
    procedure chkParticipanteClick(Sender: TObject);
    procedure spbtnDivergAnalitClick(Sender: TObject);
    procedure spbtnDivergSintetClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure ParmetrosPadro1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure sbtnFluxOperClick(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure qryparamBeforeOpen(DataSet: TDataSet);
    procedure qryparamAfterOpen(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgrdDivergSintetMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgrdDivergAnalitMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cmbMesRefChange(Sender: TObject);
    procedure spedAnoRefChange(Sender: TObject);
    procedure dblkpcmbPatroChange(Sender: TObject);
    procedure dblkpcmbPlanoChange(Sender: TObject);
    procedure dblkpcmbContribChange(Sender: TObject);
    procedure cmbFiltraTempoChange(Sender: TObject);
    procedure cmbFiltraValorChange(Sender: TObject);
    procedure pmnuCobraProxClick(Sender: TObject);
    procedure btncancelaprogressClick(Sender: TObject);
    procedure pmnuCobraImedClick(Sender: TObject);
    procedure DescontarnoPrximoBenefcio1Click(Sender: TObject);
    procedure pmnuDevolveProxClick(Sender: TObject);
    procedure pmnuDevolveImedClick(Sender: TObject);
    procedure AcrescentarnoPrximoBenefcio1Click(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure pmnuAdiconarDifClick(Sender: TObject);
    procedure pmnuDevolveIgnoraClick(Sender: TObject);
    procedure DadosdoParticipante1Click(Sender: TObject);
    procedure ConsPart1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Preparo1Click(Sender: TObject);
    procedure VerificarParticipantesDevedores1Click(Sender: TObject);
    procedure qryDivergAnalitAfterOpen(DataSet: TDataSet);
    procedure qryDivergSintetAfterOpen(DataSet: TDataSet);
    procedure dbgrdDivergAnalitTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure dbgrdDivergSintetIButtonClick(Sender: TObject);
    procedure dbgrdDivergAnalitIButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pmnuRecalcularPatronaisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DbLkcFormaPagamentoChange(Sender: TObject);
    procedure CbxTipoCobrancaChange(Sender: TObject);
    //procedure dblkpcmbSitPartInternoChange(Sender: TObject);    // edilaine - SIG35577
    procedure chkTodasDivergClick(Sender: TObject);
    procedure cmdtDataReceInicialChange(Sender: TObject);
    procedure cmdtDataReceFinalChange(Sender: TObject);
    procedure dbgrdDivergAnalitMultiSelectRecord(Grid: TwwDBGrid;
      Selecting: Boolean; var Accept: Boolean);

    //William Santana SOL 205323 KIN 1998345
    //procedure mniCadastrarEmail1Click(Sender: TObject);            // edilaine - SOL 253577-17744 / PPM 1063636
    function  EnviarEmailParticipantes(email: String): boolean;
    procedure atualizaflgenvioemail;
    procedure pvrbl2Print(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edtMesRefExit(Sender: TObject);
    procedure chkMesRefClick(Sender: TObject);
    procedure cmbFiltraMesRefChange(Sender: TObject);
    procedure chklstContribClickCheck(Sender: TObject);
    //END - William Santana SOL 205323 KIN 1998345


  private // Private declarations

    {
    Modos de Tratamento :
         0 : TODAS as Contribuicoes Divergentes
         1 : Contribuicoes Nao Pagas
         2 : Contribuicoes pagas a menor
         3 : contribuicoes pagas a maior
         4 : contribuicoes pagas em atraso
         5 : TODOS os Inadimplentes
         6 : Inadimplentes Registrados
         7 : Inadimplentes Cancelados
    }

    sSqlDivergSintet , sSqlDivergAnalit : String;
    lIdPessoa,lIdPessJur,lIdPlanoPrev,liSeqProposta : integer; // identificadores do participante
    lIdTitular : integer;   //edilaine - SIG35577

    iNumRecebimentoInserido : longint;
    bAlgumIgnorar           : boolean;
    sTipOperEnvio           : string;
    sNumRecebEnviados       : string;
    bSimParaTodos           : boolean;
    bNaoParaTodos           : boolean;
    sMsgErro                : string;
    lsMatricula             : string;
    CtrlDocumento           : TCtrlDocumento;
    CtrlLancamento          : TCtrlLancamento;
    CtrlFinanc              : TCtrlFinanc;

    sMesRef, sMesCob, sIdPessoa, sIdContribuicao, sFlgPagador,
    sFlgSitfundacao, sNumRecebimento,
    sDataPrevisaoRece, sIdPessjur, sIdPlanoPrev, sCodPortForma,
    sCodCentroCusto  : String;
    rTotal : Double;
    rTotalDocumento : Double; //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678
    sNumRecebEnviadosAlterador: String; //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678

    iCodLancCAPCAR, iPlnCodigo      : longInt;

    lstIdContrib : TStringList;  //edilaine SIG100591

    rDadosLote   : TRLote;     // edilaine - SIG35577

    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);    //edilaine SIG100591

    function  TrataFiltro : boolean;
    function  ItemSelecionado : integer;
    procedure ExibeDivergSintet;
    procedure ExibeDivergAnalit;
    function  CobraProxMes(var qryLeitura                      : Twwquery ;
                               bIndividual                     : boolean ;
                               sMesNovaCobranca, sDataRef,
                               sCodPortForma,    Referencia    : String ;
                               flgtipodesc,      flgdescfolha,
                               crecpag : char;
                               piOpTratDiverg : longint  ) : Boolean;

    function PreparaQryJurosAtraso( IdPatro,
                                    IdPlano              : integer;
                                    sMesRef,
                                    sMesCob,
                                    sMesNovaCob          : string;
                                    IdParticipante,
                                    IdContribuicao       : integer;
                                    sNumRec,
                                    psDataCobranca       : string;
                                    var pdValorAlterador : double ) : Boolean; 

    function  TestaValorRegraCalculo(var Regra : TRegra): Boolean;

    procedure PreparaTransacao(sTransacao : String);

    procedure TerminaTransacao(sTransacao : String ; bErro, bErroserio : Boolean);
    function  AtualizaSitRecebimento( numrecebimento : string;
                                      mesreferencia  : string;
                                      mescobranca    : string;
                                      idmotivo       : string;
                                      snome          : string;
                                      scontrib       : string;
                                      bApenasTrata   : boolean;
                                      piOpTratDiverg : longint;
                                      psMatricula    : string = '') : boolean;
    procedure PreparaQrySintetica;

    function  InsereAporte(qryLeitura: twwquery ; bindividual : boolean) :  Boolean;
    function  AtualizaVlHistorico(var qryLeitura : twwquery ; bAporte : Boolean ; sCompara : String; piOpTratDiverg : word) : Boolean;
    function  CalculaAporte(qryLeitura : twwquery) : Boolean;
    function  Ignora(qryLeitura: twwquery ; bindividual : boolean) :  Boolean;
    function  GravaSituacao(qryLeitura : twwquery ; sidsitplanoprevdiverg : String) : Boolean;
    function  BuscaOpcoes(sidsitplanoprev,snome,smatricula,splano,spatro: String;
                      iModo : integer ; dValorEsperado,dValorRecebido : Extended   ) : boolean;
    function  BuscaPodeCCP(qrybusca : twwquery ; snome,smatricula,splano,spatro: String;
                      iModo : integer  ) : boolean;
    function  GeraContribNReceb(qrycontrib,qryaux : twwquery; smesref,sIdMotivo : String) : Boolean;

    // Rotina para Calcular o Alterador e Incluir no Historico de Contribuicao
    function  CalculaAlteradores( qryAux,           qryLeitura       : TwwQuery;
                                  sIdPlanoPrev,     sIdContribuicao,
                                  psMesCobranca,    psMesReferencia  : String ;
                                  cRecPag                            : Char ;
                                  bApenasTrata                       : Boolean;
                                  psNumRecebimento                   : String;
                                  psDataCobranca                     : string ) : Boolean; 

    function  InsereHistorico(    var qryLeitura                     : TwwQuery;
                                  sMesCob,          sCodportforma,
                                  sDataRef,         sIdRegra         : String;
                                  dValorAlter,      dValorEsperado,
                                  dValorRecebido                     : Extended;
                                  pcFlgDescFolha,   cRecPag          : char;
                                  bAporte                            : Boolean;
                                  sIdContrib                         : String;
                                  piIdLote                           : longint;
                                  flgtipodesc                        : string;
                                  pNumRecebimentoPai : String = '' //Helio - SOL Nº 253577/17744 PPM Nº 1063636
                                  ) : Boolean;


    function  TrataDivergenciaBanco( var CtrlDocumento                   : TCtrlDocumento;
                                     psDataCobranca                  : string;
                                     piCodPortForma,
                                     piIdLote       : longint;
                                     cRecPag                         : char;
                                     bInsereUltDoc : Boolean) : boolean;

    function  AcertaPatronalPorAceitar : boolean;

    function  VerificaCobrancaBancariaPendente ( var qryLeitura : TwwQuery ;
                                                 var sMsgErro   : string    ) : boolean;

    function BuscaPlanilhaDoc(const iDocumento: Integer): Integer;

    function BuscaFiltrosLog : String; 

    function DocBaixadoCAR( psCodDocumento : String ) : Boolean; 

    function DataDeHoje( psData : String ) : Boolean;            

    //Helio - SOL Nº 240582 PPM Nº 563271
    function ObtemEmailTrataDivergencia : String;
    procedure EnviaEMailComImgAnexo(sRemetente, sDestinatario, sAssunto, sMensagem, pathImg : String);
    procedure SalvaImgBanco(chaveImg, pathImg : String);
    procedure RemoveImgBanco(chaveImg : String);
    //FIM Helio - SOL Nº 240582 PPM Nº 563271

    procedure FormataCampoFloat(qry : TwwQuery);                           // edilaine - SIG35577
    procedure MontaConsultaEnviaBanco(iIdTitular, iIdPessoa : integer);    // edilaine - SIG35577

    procedure AtualizaLancamento(pPlnCodigo : Integer; pIdPlanPrevContab : String); //Helio - SOL Nº 253577/17460 PPM Nº 955546

    //Denis Horongoso - SIG50870 - Inicio
    function ExisteAcaoJudicialVigente(sIdPessoa,
                                       sIdTitular,
                                       sIdContribuicao,
                                       sIdPlanoPrev,
                                       sIdPessJur,
                                       sSeqProposta: string;
                                       var sTipoAcao,
                                       sMotivo: string): boolean;
    //Denis Horongoso - SIG50870 - Fim
  public  // Public declarations 

     iModo         : integer;
     bCancelaenvio : Boolean;
     dValorParcial : extended;
     bAlguma       : Boolean;
     sDataIndice   : String;
     bVerificouGrupo, bApenasUmDocumento : Boolean;
     listaDocumentos : TStringList; // Renato Visoni SOL 130020 Kintana 717837
     ListaDocsSelecionados : TStringList; //TAES - SIG95604
     bPossuiErroAcao : Boolean; //SIG50870
     bPossuiAcaoErro : Boolean; //SIG50870
     bProcessou      : Boolean; //SIG50870

     function MarcaDevedoresAdmPrev( qryhistorico , qryaux : twwquery) : Boolean;
     Function PedeConfirma:Boolean;


  end;




var
  frmDivergContrib: TfrmDivergContrib;
  bSaiuMotivo : Boolean;
  sIdMotivoDiverg,strSituacaoDiverg,StrPatroDiverg  : String;




implementation
{$R *.DFM}
uses
  UAdmPrev, FAguarde, UMensErro, FTelaAut, UDataBase, DBaseDados,
  FVlrDtDiverg, FContAporte, FCancelaDiveg,  USistema, UContribuicaoPrev,
  DAPrev, UFuncoesUteis, 
  UMovReserva, UModulo, FDataIndiceDiverg, UIntegraBack,
  uSincronismo, FDivergPedeNovoMesCob, FControleIndivContrib,

  wwStoreP;//Helio - SOL Nº 240582 PPM Nº 563271


// edilaine - SIG35577 - inicio
function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: char): char;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;
// edilaine - SIG35577 - fim



function  TfrmDivergContrib.ItemSelecionado : integer;
var 
  i : integer;
begin
   Result := 0;
   for i := 0 to trvModos.Items.Count - 1 do
      if trvModos.Items.Item[i].Selected
      then begin
         Result := i;
         Break;
      end;

      if result in [5,6,7] then result := result + 3;
end;



function  TfrmDivergContrib.TrataFiltro;
begin
   Result := False;
   if (chkPatro.Checked)  and (Trim(dblkpcmbPatro.Text) = '')
   then begin
      MsgDlg('A Patrocinadora deve ser informada para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      dblkpcmbPatro.SetFocus;
      Exit;
   end;

   if (chkPlano.Checked)  and (Trim(dblkpcmbPlano.Text) = '' )
   then begin
      MsgDlg('O Plano Previdenciário deve ser informado para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      dblkpcmbPlano.SetFocus;
      Exit;
   end;

   //edilaine SIG100591 : inicio
   if (chkContrib.Checked) and {(Trim(dblkpcmbContrib.Text) = '')}
      (lstIdContrib.Text = '')
   then begin
      MsgDlg('A Contribuição deve ser informada para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      //dblkpcmbContrib.SetFocus;
      Exit;
   end;
   //edilaine SIg100591 : fim

   if (chkTempo.Checked)  and (Trim(cmbFiltraTempo.Text) = '')
   then begin
      MsgDlg('A Faixa de Tempo de Divergência deve ser informada para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      cmbFiltraTempo.SetFocus;
      Exit;
   end;

   if (chkTempo.Checked)  and (Trim(edTempo.Text) = '')
   then begin
      MsgDlg('O Tempo de Divergência deve ser informado para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      edTempo.SetFocus;
      Exit;
   end;

   if (chkValor.Checked)  and (Trim(cmbFiltraValor.Text) = '')
   then begin
      MsgDlg('A Faixa de Valor de Divergência deve ser informada para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      cmbFiltraValor.SetFocus;
      Exit;
   end;

   if (chkValor.Checked)  and (Trim(edValor.Text) = '')
   then begin
      MsgDlg('O Valor de Divergência deve ser informado para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      edTempo.SetFocus;
      Exit;
   end;

   if (chkParticipante.Checked)  and (Trim(edParticipante.Text) = '')
   then begin
      MsgDlg('O Participante deve ser informado para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      edTempo.SetFocus;
      Exit;
   end;

   if (chkSituacao.Checked)  and (Trim(cmbSituacao.Text) = '')
   then begin
      MsgDlg('A situação na fundação deve ser informado para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      cmbSituacao.SetFocus;
      Exit;
   end;

   //Everson Cunha - SIG79795 - Início
   if (chkMesRef.Checked) and (Trim(cmbFiltraMesRef.Text) = '')
   then begin
      MsgDlg('A Faixa de Mês Referência deve ser informada para o filtro desejado. ','Informação',mtInformation,[mbOk],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      cmbFiltraMesRef.SetFocus;
      Exit;
   end;

   if (chkMesRef.Checked) and (Trim(edtMesRef.Text) = '')
   then begin
      MsgDlg('O Mês de Referência deve ser informado para o filtro desejado. ','Informação',mtInformation,[mbOk],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      edtMesRef.SetFocus;
      Exit;
   end;
   //Everson Cunha - SIG79795 - Fim

   Result := True;
end;

procedure TfrmDivergContrib.ExibeDivergSintet;
var sSQL,
    sFlgSitPart,
    //inicio André Oliveira SOL 172728 KINTANA 1556309
    sAnoMesCobrancaTela,
    sDataRecInicial,
    sDataRecFinal,
    //fim André Oliveira SOL 172728 KINTANA 1556309

    sOperador : string;
    iModoSelecionado : word;
begin
    if not TrataFiltro then Exit;

    iModoSelecionado := ItemSelecionado;

    if iModoSelecionado = -1
    then begin
      MsgDlg('Selecione um Modo de Divergência na Lista de Modos. ','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
    end;

    frmAguarde.Mostra('Atualizando Divergências ... ');

    
    qryNumRecebAEnviar.Close;
    qryNumRecebAEnviar.Open;

    bSimParaTodos := False; 
    bNaoParaTodos := False;
    //inicio André Oliveira SOL 172728 KINTANA 1556309
    sDataRecInicial := FormatDateTime('DD/MM/YYYY', cmdtDataReceInicial.Date);
    sDataRecFinal   := FormatDateTime('DD/MM/YYYY', cmdtDataReceFinal.date);
    //fim André Oliveira SOL 172728 KINTANA 1556309

    // Preencher o mes de cobranca de acordo com a tela
    sAnoMesCobrancaTela := FormaAnoMesTela(cmbMesRef, spedAnoRef);

    //BRUNO AZEVEDO SOL 86498
    sSQL := ' SELECT  DISTINCT SUM(DECODE(NVL(H.FLGDEVOLUCAO,0), 0, H.VALORESPERADO, -H.VALORESPERADO)) AS VALORESPERADO, '+
            '         SUM(DECODE(NVL(H.FLGDEVOLUCAO,0), 0, -H.VALORRECEBIDO,H.VALORRECEBIDO)) AS VALORRECEBIDO, '+
            '         NVL(H.FLGDEVOLUCAO,0) FLGDEVOLUCAO, '+
            '         C.NOME, C.IDCONTRIBUICAO, CT.IDPLANOPREV, PL.NOME PLANPREV,                '+
            '         PESSJUR.NOME PESSJUR , PESSJUR.IDPESSOA IDPESSJUR                          '+
            //edilaine - SIG35577 - inicio
            {' FROM    CONTRIBPREVPARTP CTP, CONTRIBUICAO C, SITPLANOPREV SP,  PLANPREV PL,       '+
            '         CONTPREV CT,PARTPREVPLAN PP, PESSOA PESSJUR,                               '+
            '         NUCLEOFAMILIAR NF, CONTRIBPREVNUCLEO CTN,                                  '+
            '         HSTCONTRIBPREV H, SITPART SPART, ELEGPATRO EL, PATRO PT '; }

            ' FROM   HSTCONTRIBPREV H                                       '+
            '        JOIN PESSOA PESSJUR ON PESSJUR.IDPESSOA = H.IDPESSJUR  '+
            '        JOIN PARTPREVPLAN PP ON PP.IDPESSOA    = NVL(H.IDTITULAR, H.IDPESSOA) '+
            '                            AND PP.IDPESSJUR   = H.IDPESSJUR                  '+
            '                            AND PP.IDPLANOPREV = H.IDPLANOPREV                '+
            '                            AND PP.SEQPROPOSTA = H.SEQPROPOSTA                '+
            '        JOIN DEPENTIT DP ON DP.IDTITULAR = NVL(H.IDTITULAR, H.IDPESSOA)       '+
            '                        AND DP.IDPESSOA  = H.IDPESSOA                         '+
            '        JOIN PATRO PT ON PT.IDPESSOA = H.IDPESSJUR                            '+
            '                     AND PT.IDFUNDACAO = '+IntToStr(iIdFundacao) +
            '        JOIN CONTRIBUICAO C ON C.IDCONTRIBUICAO = H.IDCONTRIBUICAO            '+
            '        JOIN CONTPREV CT ON CT.IDCONTRIBUICAO = H.IDCONTRIBUICAO              '+
            '                        AND CT.IDPLANOPREV    = H.IDPLANOPREV                 '+
            '        JOIN SITPART SPART ON  SPART.IDSITPART = PP.IDSITPART                     '+
            '        JOIN SITPLANOPREV SP ON SP.IDSITPLANOPREV = PP.IDSITPLANOPREV         '+
            '        JOIN PLANPREV PL ON PL.IDPLANOPREV = H.IDPLANOPREV                    ';
            //edilaine - SIG35577 fim
   //inicio André Oliveira SOL 172728 KINTANA 1556309
   if(iModoSelecionado in [0,1,2,3,4])then
   begin
        if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
         then sSQL := sSQL +' WHERE   ((H.DATAPREVISAORECE,''DD/MM/YYYY'') <= to_date('+QuotedStr(sDataRecInicial)+' ''DD/MM/YYYY'') '
         else sSQL := sSQL +' WHERE   (H.DATAPREVISAORECE >=  to_date('+QuotedStr(sDataRecInicial)+',''DD/MM/YYYY'') AND  H.DATAPREVISAORECE  <=  to_date('+QuotedStr(sDataRecFinal)+',''DD/MM/YYYY'') ) ';

   end
   else
   begin
        if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
         then sSQL := sSQL +' WHERE   (TO_CHAR(H.DATAPREVISAORECE,''YYYY/MM'') <= '''+sAnoMesCobrancaTela+''' ) '
         else sSQL := sSQL +' WHERE   (TO_CHAR(H.DATAPREVISAORECE,''YYYY/MM'') = '''+sAnoMesCobrancaTela+''' )  ';
   end;

    //fim André Oliveira SOL 172728 KINTANA 1556309

    //edilaine - SIG35577 inicio
    {sSQL := sSQL + ' AND    (PT.IDPESSOA   = H.IDPESSJUR )                             '+
                   ' AND    (PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+')                ';
    }//edilaine - SIG35577 fim

    if chkParticipante.Checked
    then sSQL := sSQL+' AND (H.IDPESSOA     = '+IntToStr(lIdPessoa)   +') '+
                      ' AND (H.SEQPROPOSTA  = '+IntToStr(liSeqProposta)+') '+
                      ' AND (H.IDPESSJUR    = '+IntToStr(lIdPessJur)  +') ';

    //edilaine - SIG35577 - inicio
    {sSQL := sSQL + ' AND (H.IDPESSOA        = PP.IDPESSOA)       '+
                   ' AND (H.SEQPROPOSTA     = PP.SEQPROPOSTA)    '+
                   ' AND (H.IDPESSJUR       = PP.IDPESSJUR)      '+
                   ' AND (H.IDPLANOPREV     = PP.IDPLANOPREV)    '+

                   ' AND (CTP.IDPESSOA        = H.IDPESSOA)       '+
                   ' AND (CTP.SEQPROPOSTA     = H.SEQPROPOSTA)    '+
                   ' AND (CTP.IDPESSJUR       = H.IDPESSJUR)      '+
                   ' AND (CTP.IDPLANOPREV     = H.IDPLANOPREV)    '+
                   ' AND (CTP.IDCONTRIBUICAO    = H.IDCONTRIBUICAO)    '+

                   ' AND (C.IDCONTRIBUICAO  = CT.IDCONTRIBUICAO) '+
                   ' AND (C.IDCONTRIBUICAO  = H.IDCONTRIBUICAO)  '+
                   ' AND (PP.IDPLANOPREV    = CT.IDPLANOPREV)    '+
                   ' AND (PP.IDSITPLANOPREV = SP.IDSITPLANOPREV) '+
                   ' AND (EL.IDPESSOA       = PP.IDPESSOA)       '+
                   ' AND (EL.IDPESSJUR      = PP.IDPESSJUR)      '+
                   ' AND (PP.IDSITPART      = SPART.IDSITPART)   '+
                   ' AND (H.IDPESSJUR       = PESSJUR.IDPESSOA)  '+
                   ' AND (H.IDPLANOPREV     = PL.IDPLANOPREV)    ';
    }//edilaine - SIG35577 - fim

    
    If chkDivTrat.Checked
     Then sSQL := sSQL+' AND (H.SITRECEBIMENTO <> 4) ';
    

    if chkPatro.Checked
    then sSQL := sSQL+' AND (H.IDPESSJUR = '+qryPatro.FieldByName('IdPessoa').AsString+') ';

    if chkPlano.Checked
    then sSQL := sSQL + ' AND (H.IDPLANOPREV = '+qryPlano.FieldByName('IdPlanoPrev').AsString+') ';

    //edilaine SIg100591 : inicio
    if chkContrib.Checked
    //then sSQL := sSQL + ' AND (H.IDCONTRIBUICAO = '+qryContrib.FieldByName('IdContribuicao').AsString+') ';
    then sSQL := sSQL + ' AND (H.IDCONTRIBUICAO IN ('+lstIdContrib.CommaText+') ) ';
    //edilaine SIg100591 : fim

    if chkTempo.Checked
    then begin
      sOperador := vetOperador[cmbFiltraTempo.ItemIndex];

      If IsDB2_Padrao Then
       begin
         sSQL := sSQL + ' AND '+
         '  ( StrToInt(MONTH(TO_DATE(''SYSDATE'',''dd/mm/yyyy''))) - MONTH(TO_DATE(''DATARECEBIMENTO'',''dd/mm/yyyy'')) '+sOperador+' '+Trim(edTempo.Text)+ ' ';
         end
      Else
         sSQL := sSQL + ' AND '+' ( TRUNC(MONTHS_BETWEEN(SYSDATE,H.DATARECEBIMENTO) ,0) '+sOperador+' '+Trim(edTempo.Text)+') ';
    end;

    if chkValor.Checked
    then begin
      sOperador := vetOperador[cmbFiltraValor.ItemIndex];
      sSQL := sSQL + ' AND '+' ( (NVL(H.VALORRECEBIDO,0) - NVL(H.VALORESPERADO,0)) '+sOperador+' '+OraNumero(trim(edValor.Text))+') ';
    end;

    //Everson Cunha - SIG79795 - Início
    if chkMesRef.Checked
    then begin
      sOperador := vetOperador[cmbFiltraMesRef.ItemIndex];
      sSQL := sSQL + ' AND '+' ( H.MESREFERENCIA '+sOperador+' '+QuotedStr(trim(edtMesRef.Text))+') ';
    end;
    //Everson Cunha - SIG79795 - Fim

    if chkSituacao.Checked
    then begin

       case cmbSituacao.ItemIndex of
            0 : sFlgSitPart := 'AT';
            1 : sFlgSitPart := 'MA';
            2 : sFlgSitPart := 'MP';
            3 : sFlgSitPart := 'AS';
            4 : sFlgSitPart := 'CA'; 
       end;
       // Taffarel - SIG63700 - Início
       // edilaine - SIG35577 - inicio
       If cmbSituacao.ItemIndex = 0 Then // ativo
       Begin
         //sSQL := sSQL + ' AND ((SPART.FLGINTERNO = ''AT'' ) OR (SPART.FLGINTERNO = ''MA''))';
         //sSQL := sSQL + ' AND (NVL(H.FLGSITFUNDACAO, SPART.FLGINTERNO) = ''AT'' ) OR (NVL(H.FLGSITFUNDACAO, SPART.FLGINTERNO) = ''MA'')';    //edilaine SIg100591
         sSQL := sSQL + ' AND (NVL(H.FLGSITFUNDACAO, SPART.FLGINTERNO) IN (''AT'', ''MA'') )';                                                 //edilaine SIg100591
                                 //' OR ((SP.FLGINTERNO = ''MA'') AND(EL.IDPESSJURCEDIDO IS NOT NULL))) ';
       End Else if cmbSituacao.ItemIndex = 3 Then
         //sSQL := sSQL + ' AND (SPART.FLGINTERNO in (''AS'', ''CA'') ) '
         sSQL := sSQL + ' AND (NVL(H.FLGSITFUNDACAO, SPART.FLGINTERNO) in (''AS'', ''CA'') ) '
       Else
         //sSQL := sSQL + ' AND (SPART.FLGINTERNO = '''+sFlgSitPart+''' ) ';
         sSQL := sSQL + ' AND (NVL(H.FLGSITFUNDACAO, SPART.FLGINTERNO) = '''+sFlgSitPart+''' ) ';
       // edilaine - SIG35577 - fim
       // Taffarel - SIG63700 - Fim
    end;

    case iModoSelecionado of
         0 : begin // TODAS as Contribuicoes Divergentes
                sSQL := sSQL+' AND (NVL(H.VALORESPERADO,0) <> NVL(H.VALORRECEBIDO,0))  ';
                //sSQL := sSQL+' AND  ((H.SITRECEBIMENTO =''1'') OR (H.SITRECEBIMENTO = ''3'')) ';
                sSQL := sSQL+' AND  (H.SITRECEBIMENTO IN (''1'', ''3'') ) ';     //edilaine SIG100591
             end;
         1 : begin // Contribuicoes Nao Pagas
                //sSQL := sSQL+' AND (NVL(H.VALORESPERADO,0) > 0) '; //BRUNO AZEVEDO SOL 86498/11362
                sSQL := sSQL+' AND (NVL(H.VALORRECEBIDO,0) <= 0) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO IN (''1'',''3'') ) ';
                //BRUNO AZEVEDO SOL 86498
                //sSQL := sSQL+' AND (NVL(H.FLGDEVOLUCAO,0) =0 ) ';
             end;
         2 : begin // Contribuicoes pagas a menor
                sSQL := sSQL+' AND (NVL(H.VALORRECEBIDO,0) < NVL(H.VALORESPERADO,0)) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'')  ';
                sSQL := sSQL+' AND (NVL(H.FLGDEVOLUCAO,0) =0 ) ';
             end;
         3 : begin // contribuicoes pagas a maior
                sSQL := sSQL+' AND (((NVL(H.VALORRECEBIDO,0) > NVL(H.VALORESPERADO,0)) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3''))   ';
                sSQL := sSQL+' OR (NVL(H.FLGDEVOLUCAO,0) =1 )) ';
             end;
         4 : begin // contribuicoes pagas em atraso
                sSQL := sSQL+' AND (NVL(H.VALORESPERADO,0) = NVL(H.VALORRECEBIDO,0)) ';
                sSQL := sSQL+' AND (H.DATAPREVISAORECE < H.DATARECEBIMENTO ) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'')  ';
                sSQL := sSQL+' AND (NVL(H.FLGDEVOLUCAO,0) =0 )) ';
             end;
         8 : begin // TODOS os Inadimplentes
                sSQL := sSQL+' AND (NVL(H.VALORESPERADO,0) <> NVL(H.VALORRECEBIDO,0)) ';
                //sSQL := sSQL + ' AND ((SP.FLGINTERNO = ''IN'') OR (SP.FLGINTERNO = ''CI'') ) ';     //edilaine SIG100591
                sSQL := sSQL + ' AND (SP.FLGINTERNO IN (''IN'' , ''CI'') ) ';                         //edilaine SIG100591
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'')  ';
             end;
         9 : begin // Inadimplentes Registrados
                sSQL := sSQL+' AND (NVL(H.VALORESPERADO,0) <> NVL(H.VALORRECEBIDO,0)) ';
                sSQL := sSQL + ' AND (SP.FLGINTERNO = ''IN'')  ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'')  ';
             end;
        10 : begin // Inadimplentes Cancelados
                sSQL := sSQL+' AND (NVL(H.VALORESPERADO,0) <> NVL(H.VALORRECEBIDO,0)) ';
                sSQL := sSQL+ ' AND (SP.FLGINTERNO = ''CI'') ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'')  ';
             end;
    end;

    { Tipo de Cobranca }
    If ChkTipoCobranca.Checked = True Then Begin
      Case CbxTipoCobranca.ItemIndex Of
        1 : sSQL := sSQL + ' AND (H.FLGDESCFOLHA = 1) ';
        2 : sSQL := sSQL + ' AND (H.FLGDESCFOLHA = 0) ';
        3 : sSQL := sSQL + ' AND (H.FLGDESCFOLHA = 1) ';
      End;
    End;

    { Forma de Pagamento }
    If ChkFormaPagamento.Checked Then Begin
      sSQL := sSQL + ' AND (H.CODPORTFORMA = '+ DbLkcFormaPagamento.LookupValue +') ';     //edilaine - SIG35577
    End;

    //edilaine - SIG35577 - inicio
    {if chkSitPartInterno.Checked
    then sSQL := sSQL + ' AND (SPART.FLGINTERNO = '''+qrySitPartInterno.FieldByName('FLGINTERNO').AsString+''')';
    }//edilaine - SIG35577 - fim


    sSQL := sSQL + ' GROUP BY H.FLGDEVOLUCAO, C.NOME, C.IDCONTRIBUICAO , CT.IDPLANOPREV,PL.NOME , PESSJUR.NOME  , PESSJUR.IDPESSOA ';

    qryDivergSintet.Close;
    qryDivergSintet.SQL.Clear;
    qryDivergSintet.SQl.Add(sSQL);
    try
       qryDivergSintet.Open;
    except
    end;

    if not tbsDivergencias.TabVisible
    then tbsDivergencias.TabVisible := True;
    dbgrdDivergSintet.Visible := True;
    dbgrdDivergAnalit.Visible := False;
    pgctrlDivergencias.ActivePage := tbsDivergencias;

    frmAguarde.Apaga;
end;



procedure TfrmDivergContrib.ExibeDivergAnalit;
var sSQL,
    //inicio André Oliveira SOL 172728 KINTANA 1556309
    sAnoMesCobrancaTela,
    sDataRecInicial,
    sDataRecFinal,
    //fim André Oliveira SOL 172728 KINTANA 1556309
    sFlgSitPart,
    sOperador : string;
    iModoSelecionado : word;
begin
    if not TrataFiltro then Exit;

    iModoSelecionado := ItemSelecionado;

    if iModoSelecionado = -1
    then begin
       MsgDlg('Selecione um Modo de Divergência na Lista de Modos. ','Erro',mtError,[mbOk,mbHelp],0);
       Exit;
    end;

    frmAguarde.Mostra('Atualizando Divergências ... ');

    //inicio André Oliveira SOL 172728 KINTANA 1556309
    sDataRecInicial := FormatDateTime('DD/MM/YYYY', cmdtDataReceInicial.Date);
    sDataRecFinal   := FormatDateTime('DD/MM/YYYY', cmdtDataReceFinal.date);
    //fim André Oliveira SOL 172728 KINTANA 1556309

    // Preencher o mes de cobranca de acordo com a tela
    sAnoMesCobrancaTela := FormaAnoMesTela(cmbMesRef, spedAnoRef);

    //BRUNO AZEVEDO SOL 86498
    sSQL := ' SELECT distinct  '+                 //edilaine - SIG35577
            '        DECODE(NVL(H.FLGDEVOLUCAO,0), 0, H.VALORESPERADO, -H.VALORESPERADO) AS VALORESPERADO,'+
            '        DECODE(NVL(H.FLGDEVOLUCAO,0), 0, -H.VALORRECEBIDO,H.VALORRECEBIDO) AS VALORRECEBIDO, '+
            '        NVL(H.FLGDEVOLUCAO,0) FLGDEVOLUCAO,   '+
            '        H.MESREFERENCIA,     H.MESCOBRANCA,    H.IDLOTE,        '+
            '        H.CODDOCUMENTOPREV,  H.VALOROP1,       H.VALOROP2,      '+
            '        H.VALOROP3,          H.FLGDESCFOLHA,   H.FLGCALCRESERVA,'+
            '        H.VALORCALCULADO,    H.NUMRECEBIMENTO, H.IDMOTIVO,      '+
            '        H.SITRECEBIMENTO,    H.IDREGRACALCULO, H.CODDOCUMENTOPREV, '+
            '        H.DATARECEBIMENTO,   H.DATAPREVISAORECE, '+
            '        C.IDCONTRIBUICAO,    C.NOME AS NOMECONTRIB,             '+
            '        C.NOMERESUM,                                            '+
            '        DP.MATRICULA ,       P.NOME AS NOMEPARTICIP,            '+       //edilaine - SIG35577
            '        CT.IDPLANOPREV,      CT.FLGPAGADOR,    CT.IDRUBRICAATRASO, '+
            '        CT.IDRUBRICADEVOLUC, SPART.FLGINTERNO FLGSITPART,          '+    //edilaine - SIG35577
            '        PL.NOME PLANPREV,    PESSJUR.NOME PESSJUR,              '+
            '        H.IDPESSJUR,         H.IDPESSOA,       PP.IDSITPART,     '+      //edilaine - SIG35577
            '        H.SEQPROPOSTA,       PP.SALPARTICIPACAO,                '+
            '        PP.IDPESSOA IDPART,  SP.DESCRICAO SITPLANOPREV ,        '+
            '        SP.FLGINTERNO FLGSITPLANOPREV, '+

            //edilaine - SIG35577 - INICIO
            {'       CTP.VALORBASE1,      CTP.VALORBASE2,        CTP.VALORBASE3,      '+
            '        CTP.CODCENTROCUSTOC, CTP.PLACONTAC,         CTP.PLACONTAD,       '+
            '        CTP.CODCENTROCUSTOD, CTP.CODCENTROCUSTOC,   CTP.CODCCUSTODEVOL,  '+
            '        CTP.PLACONTADEVOL,   CTP.CODSUBCONTA,       CTP.CODPORTFORMA,    '+
            '        CTP.CODTIPRECDES,    CTP.CODTIPDESEMBDEVOL, CTP.CODCENTRORESPON, '+
            '        CTP.UNIDNEGOC ,                                                  '+ }

            '        NVL(H.CODPORTFORMA, DECODE(H.IDPESSOA, H.IDTITULAR, CTP.CODPORTFORMA, CTN.CODPORTFORMA)) CODPORTFORMA,  '+
            '        DECODE(H.IDPESSOA, H.IDTITULAR, CTP.VALORBASE1, NULL) AS VALORBASE1, '+
            '        DECODE(H.IDPESSOA, H.IDTITULAR, CTP.VALORBASE2, NULL) AS VALORBASE2, '+
            '        DECODE(H.IDPESSOA, H.IDTITULAR, CTP.VALORBASE3, NULL) AS VALORBASE3, '+
            '        NVL(DECODE(H.IDPESSOA, H.IDTITULAR, CTP.IDPLANPREVCONTAB, CTN.IDPLANPREVCONTAB), H.IDPLANPREVCONTAB) AS IDPLANPREVCONTAB, '+
            '        DP.IDTITULAR,  '+
            //edilaine - SIG35577 - FIM
            '        NVL(HA.VALOR,0) VALORALTER , NVL(HA.VALORRECEBIDO,0) VALORRECEBIDOALTER, '+
            '        H.FLGSITFUNDACAO, '+ 
            '        H.DATAINICIO, 0 as SELECIONADO,     '+ //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678

            //Luiz Carlos - SIG64089 - Inicio
            //'        H.SALCONTRIB                        '+ //Taffarel - SIG51896
            '        NVL(H.SALCONTRIB, PP.SALPARTICIPACAO) as SALCONTRIB '+
            //Luiz Carlos - SIG64089 - Fim
            //edilaine - SIG35577 - inicio
            //'        , CTP.IDPLANPREVCONTAB ' + //Helio - SOL Nº 253577/17460 PPM Nº 955546
            ' FROM   HSTCONTRIBPREV H                                       '+
            '        JOIN PESSOA P ON P.IDPESSOA = H.IDPESSOA               '+
            '        JOIN PESSOA PESSJUR ON PESSJUR.IDPESSOA = H.IDPESSJUR  '+
            '        JOIN PARTPREVPLAN PP ON PP.IDPESSOA    = NVL(H.IDTITULAR, H.IDPESSOA) '+
            '                            AND PP.IDPESSJUR   = H.IDPESSJUR                  '+
            '                            AND PP.IDPLANOPREV = H.IDPLANOPREV                '+
            '                            AND PP.SEQPROPOSTA = H.SEQPROPOSTA                '+
            '        JOIN DEPENTIT DP ON DP.IDTITULAR = NVL(H.IDTITULAR, H.IDPESSOA)       '+
            '                        AND DP.IDPESSOA  = H.IDPESSOA                         '+
            '        JOIN PATRO PT ON PT.IDPESSOA = H.IDPESSJUR                            '+
            '                     AND PT.IDFUNDACAO = '+IntToStr(iIdFundacao) +
            '        JOIN CONTRIBUICAO C ON C.IDCONTRIBUICAO = H.IDCONTRIBUICAO            '+
            '        JOIN CONTPREV CT ON CT.IDCONTRIBUICAO = H.IDCONTRIBUICAO              '+
            '                        AND CT.IDPLANOPREV    = H.IDPLANOPREV                 '+
            '        JOIN SITPART SPART ON  SPART.IDSITPART = PP.IDSITPART                 '+
            '        JOIN SITPLANOPREV SP ON SP.IDSITPLANOPREV = PP.IDSITPLANOPREV         '+
            '        JOIN PLANPREV PL ON PL.IDPLANOPREV = H.IDPLANOPREV                    '+
            '        LEFT JOIN (SELECT SUM(VALOR) VALOR ,                                  '+
            '                          SUM(VALORRECEBIDO) VALORRECEBIDO, NUMRECEBIMENTO    '+
            '                     FROM HSTATRASOCONTRIB                                    '+
            '                    GROUP BY NUMRECEBIMENTO) HA ON H.NUMRECEBIMENTO = HA.NUMRECEBIMENTO '+
            '        LEFT JOIN CONTRIBPREVPARTP CTP ON H.IDTITULAR      = CTP.IDPESSOA       '+
            '                                      AND H.IDCONTRIBUICAO = CTP.IDCONTRIBUICAO '+
            '                                      AND H.IDPLANOPREV    = CTP.IDPLANOPREV    '+
            '                                      AND H.IDPESSJUR      = CTP.IDPESSJUR      '+
            '                                      AND H.SEQPROPOSTA    = CTP.SEQPROPOSTA    '+
            '        LEFT JOIN NUCLEOFAMILIAR NF ON H.IDTITULAR = NF.IDTITULAR               '+
            '        LEFT JOIN CONTRIBPREVNUCLEO CTN  ON H.IDPESSOA     = CTN.IDPESSOA       '+
            '                                      AND H.IDCONTRIBUICAO = CTN.IDCONTRIBUICAO '+
            '                                      AND H.IDPLANOPREV    = CTN.IDPLANOPREV    '+
            '                                      AND H.IDPESSJUR      = CTN.IDPESSJUR      '+
            '                                      AND H.SEQPROPOSTA    = CTN.SEQPROPOSTA    ';
            //edilaine - SIG35577 - FIM

    //inicio André Oliveira SOL 172728 KINTANA 1556309
   if(iModoSelecionado in [0,1,2,3,4])then
   begin
       if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
        then sSQL := sSQL +' WHERE   ((H.DATAPREVISAORECE,''DD/MM/YYYY'') <= to_date('+QuotedStr(sDataRecInicial)+' ''DD/MM/YYYY'') '
        else sSQL := sSQL +' WHERE   (H.DATAPREVISAORECE >=  to_date('+QuotedStr(sDataRecInicial)+',''DD/MM/YYYY'') AND  H.DATAPREVISAORECE  <=  to_date('+QuotedStr(sDataRecFinal)+',''DD/MM/YYYY'') ) ';
   end
   else
   begin
       if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
        then sSQL := sSQL +' WHERE   (TO_CHAR(H.DATAPREVISAORECE,''YYYY/MM'') <= '''+sAnoMesCobrancaTela+''' ) '
        else sSQL := sSQL +' WHERE   (TO_CHAR(H.DATAPREVISAORECE,''YYYY/MM'') = '''+sAnoMesCobrancaTela+''' )  ';
   end;
   //fim André Oliveira SOL 172728 KINTANA 1556309

    //edilaine - SIG35577 - inicio
    {sSQL := sSQL +' AND    (PT.IDPESSOA   = H.IDPESSJUR )                          '+
                 +' AND    (PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+')             ';
    }//edilaine - SIG35577 - fim

    if chkParticipante.Checked
    then sSQL := sSQL+' AND (H.IDPESSOA    = '+IntToStr(lIdPessoa)   +') '+
                      ' AND (H.SEQPROPOSTA = '+IntToStr(liSeqProposta)+') '+
                      ' AND (H.IDPESSJUR   = '+IntToStr(lIdPessJur)  +') ';

    //edilaine - SIG35577 - INICIO
    {sSQL := sSQL + ' AND (H.IDPESSOA         = PP.IDPESSOA)       '+
                   ' AND (H.SEQPROPOSTA      = PP.SEQPROPOSTA)    '+

                   ' AND (HA.NUMRECEBIMENTO(+) = H.NUMRECEBIMENTO)  '+

                   ' AND (CTP.IDPESSOA       = PP.IDPESSOA)       '+
                   ' AND (CTP.SEQPROPOSTA    = PP.SEQPROPOSTA)    '+
                   ' AND (H.IDPESSJUR        = PP.IDPESSJUR)      '+
                   ' AND (H.IDPESSJUR        = CTP.IDPESSJUR )    '+
                   ' AND (H.IDPLANOPREV      = CTP.IDPLANOPREV)   '+
                   ' AND (CTP.IDCONTRIBUICAO = H.IDCONTRIBUICAO)  '+
                   ' AND (H.IDPLANOPREV      = PP.IDPLANOPREV)    '+
                   ' AND (PP.IDSITPLANOPREV  = SP.IDSITPLANOPREV) '+
                   ' AND (PP.IDSITPART       = SPART.IDSITPART)   '+
                   ' AND (EL.IDPESSOA        = PP.IDPESSOA)       '+
                   ' AND (EL.IDPESSJUR       = PP.IDPESSJUR)      '+
                   ' AND (C.IDCONTRIBUICAO   = CT.IDCONTRIBUICAO) '+
                   ' AND (C.IDCONTRIBUICAO   = H.IDCONTRIBUICAO)  '+
                   ' AND (PP.IDPLANOPREV     = CT.IDPLANOPREV)    '+
                   ' AND (P.IDPESSOA         = PP.IDPESSOA)       '+
                   ' AND (H.IDPESSJUR        = PESSJUR.IDPESSOA)  '+
                   ' AND (H.IDPLANOPREV      = PL.IDPLANOPREV)    '+
                   ' AND (PP.IDSITPART       = SIT.IDSITPART)     ';
    }//edilaine - SIG35577 - FIM


    If chkDivTrat.Checked
     Then sSQL := sSQL+' AND (H.SITRECEBIMENTO <> 4) ';
    

    if chkPatro.Checked
    then sSQL := sSQL+' AND (H.IDPESSJUR = '+qryPatro.FieldByName('IdPessoa').AsString+') ';

    if chkPlano.Checked
    then sSQL := sSQL + ' AND (H.IDPLANOPREV = '+qryPlano.FieldByName('IdPlanoPrev').AsString+') ';

    //edilaine SIg100591 : inicio
    if chkContrib.Checked
    //then sSQL := sSQL + ' AND (H.IDCONTRIBUICAO = '+qryContrib.FieldByName('IdContribuicao').AsString+') ';
    then sSQL := sSQL + ' AND (H.IDCONTRIBUICAO IN ('+lstIdContrib.CommaText+') ) ';
    //edilaine SIg100591 : fim


    if chkTempo.Checked
    then begin
      sOperador := vetOperador[cmbFiltraTempo.ItemIndex];

      If IsDB2_Padrao Then
       begin
         sSQL := sSQL + ' AND '+
         '  ( StrToInt(MONTH(TO_DATE(''SYSDATE'',''dd/mm/yyyy''))) - MONTH(TO_DATE(''DATARECEBIMENTO'',''dd/mm/yyyy'')) '+sOperador+' '+Trim(edTempo.Text)+ ' ';
         end
      Else
      sSQL := sSQL + ' AND '+'  ( TRUNC(MONTHS_BETWEEN(SYSDATE,H.DATARECEBIMENTO) ,0) '+sOperador+' '+Trim(edTempo.Text)+') ';
    end;

    if chkValor.Checked
    then begin
      sOperador := vetOperador[cmbFiltraValor.ItemIndex];
      sSQL := sSQL + ' AND '+' ( (NVL(H.VALORRECEBIDO,0) - NVL(H.VALORESPERADO,0)) '+sOperador+' '+OraNumero(trim(edValor.Text))+') ';
    end;

    //Everson Cunha - SIG79795 - Início
    if chkMesRef.Checked
    then begin
      sOperador := vetOperador[cmbFiltraMesRef.ItemIndex];
      sSQL := sSQL + ' AND '+' ( H.MESREFERENCIA '+sOperador+' '+QuotedStr(trim(edtMesRef.Text))+') ';
    end;
    //Everson Cunha - SIG79795 - Fim

    if chkSituacao.Checked
    then begin
       case cmbSituacao.ItemIndex of
            0 : sFlgSitPart := 'AT';
            1 : sFlgSitPart := 'MA';
            2 : sFlgSitPart := 'MP';
            3 : sFlgSitPart := 'AS';
            4 : sFlgSitPart := 'CA';
       end;

       // Taffarel - SIG63700 - Início
       // edilaine - SIG35577 - inicio
       If cmbSituacao.ItemIndex = 0 Then // ativo
       Begin
         //sSQL := sSQL + ' AND ((SPART.FLGINTERNO = ''AT'' ) OR (SPART.FLGINTERNO = ''MA''))';
         //sSQL := sSQL + ' AND (NVL(H.FLGSITFUNDACAO, SPART.FLGINTERNO) = ''AT'' ) OR (NVL(H.FLGSITFUNDACAO, SPART.FLGINTERNO) = ''MA'')';  //edilaine SIG100591
         sSQL := sSQL + ' AND (NVL(H.FLGSITFUNDACAO, SPART.FLGINTERNO) IN (''AT'', ''MA'') )';                                               //edilaine SIG100591
                                 //' OR ((SP.FLGINTERNO = ''MA'') AND(EL.IDPESSJURCEDIDO IS NOT NULL))) ';
       End Else if cmbSituacao.ItemIndex = 3 Then
         //sSQL := sSQL + ' AND (SPART.FLGINTERNO in (''AS'', ''CA'') ) '
         sSQL := sSQL + ' AND (NVL(H.FLGSITFUNDACAO, SPART.FLGINTERNO) in (''AS'', ''CA'') ) '
       Else
         //sSQL := sSQL + ' AND (SPART.FLGINTERNO = '''+sFlgSitPart+''' ) ';
         sSQL := sSQL + ' AND (NVL(H.FLGSITFUNDACAO, SPART.FLGINTERNO) = '''+sFlgSitPart+''' ) ';
       // edilaine - SIG35577 - fim
       // Taffarel - SIG63700 - Fim
    end;


    case iModoSelecionado of
         0 : begin // TODAS as Contribuicoes Divergentes
                sSQL := sSQL+' AND ((NVL(H.VALORESPERADO,0) <> NVL(H.VALORRECEBIDO,0)) '+
                             '      OR   (NVL(HA.VALOR,0) <> NVL(HA.VALORRECEBIDO,0))) ';
                //sSQL := sSQL+' AND  ((H.SITRECEBIMENTO =''1'') OR (H.SITRECEBIMENTO = ''3'')) ';     //edilaine SIG100591
                sSQL := sSQL+' AND  (H.SITRECEBIMENTO IN (''1'', ''3'')) ';                            //edilaine SIG100591
             end;
         1 : begin // Contribuicoes Nao Pagas
                sSQL := sSQL+' AND  (NVL(H.VALORRECEBIDO,0) <= 0) '+
                             //' AND  ((H.SITRECEBIMENTO =''1'') OR (H.SITRECEBIMENTO = ''3'')) ';     //edilaine SIG100591
                             ' AND  (H.SITRECEBIMENTO IN (''1'', ''3'')) ';                            //edilaine SIG100591
                //BRUNO AZEVEDO SOL 86498
                //sSQL := sSQL+' AND (NVL(H.FLGDEVOLUCAO,0) =0 ) ';

             end;
         2 : begin // Contribuicoes pagas a menor
                sSQL := sSQL+' AND ((NVL(H.VALORRECEBIDO,0) < NVL(H.VALORESPERADO,0)) '+
                             '      OR   (NVL(HA.VALOR,0) > NVL(HA.VALORRECEBIDO,0))) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'' ) ';
                sSQL := sSQL+' AND (NVL(H.FLGDEVOLUCAO,0) =0 ) ';
             end;
         3 : begin // contribuicoes pagas a maior
                sSQL := sSQL+' AND ((((NVL(H.VALORRECEBIDO,0) > NVL(H.VALORESPERADO,0)) '+
                             '     OR   (NVL(HA.VALOR,0) < NVL(HA.VALORRECEBIDO,0))) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'' )) ';
                sSQL := sSQL+' OR (NVL(H.FLGDEVOLUCAO,0) = 1 )) ';
             end;
         4 : begin // contribuicoes pagas em atraso
                sSQL := sSQL+' AND ((NVL(H.VALORESPERADO,0) = NVL(H.VALORRECEBIDO,0)) '+
                             '     AND   (NVL(HA.VALOR,0) = NVL(HA.VALORRECEBIDO,0))) ';
                sSQL := sSQL+' AND (H.DATAPREVISAORECE < H.DATARECEBIMENTO ) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'' ) ';
                sSQL := sSQL+' AND (NVL(H.FLGDEVOLUCAO,0) =0 ) ';
             end;

         8 : begin // TODOS os Inadimplentes
                sSQL := sSQL+' AND ((NVL(H.VALORESPERADO,0) <> NVL(H.VALORRECEBIDO,0)) '+
                             '     OR   (NVL(HA.VALOR,0) <> NVL(HA.VALORRECEBIDO,0))) ';
                //sSQL := sSQL + ' AND ((SP.FLGINTERNO = ''IN'') OR (SP.FLGINTERNO = ''CI'') ) ';       //edilaine SIG100591
                sSQL := sSQL + ' AND (SP.FLGINTERNO  IN (''IN'', ''CI'') ) ';                           //edilaine SIG100591
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'' ) ';
             end;
         9 : begin // Inadimplentes Registrados
                sSQL := sSQL+' AND ((NVL(H.VALORESPERADO,0) <> NVL(H.VALORRECEBIDO,0)) '+
                             '     OR   (NVL(HA.VALOR,0) <> NVL(HA.VALORRECEBIDO,0))) ';
                sSQL := sSQL + ' AND (SP.FLGINTERNO = ''IN'')  ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'' ) ';
             end;
        10 : begin // Inadimplentes Cancelados
                sSQL := sSQL+' AND ((NVL(H.VALORESPERADO,0) <> NVL(H.VALORRECEBIDO,0)) '+
                             '     OR   (NVL(HA.VALOR,0) <> NVL(HA.VALORRECEBIDO,0))) ';
                sSQL := sSQL + ' AND (SP.FLGINTERNO = ''CI'') ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'' ) ';
             end;
    end;

    { Tipo de Cobranca }
    If ChkTipoCobranca.Checked = True Then Begin
      Case CbxTipoCobranca.ItemIndex Of
        1 : sSQL := sSQL + ' AND (H.FLGDESCFOLHA = 1) ';
        2 : sSQL := sSQL + ' AND (H.FLGDESCFOLHA = 0) ';
        3 : sSQL := sSQL + ' AND (H.FLGDESCFOLHA = 1) ';
      End;
    End;

    { Forma de Pagamento }
    If ChkFormaPagamento.Checked Then Begin
      sSQL := sSQL + ' AND (H.CODPORTFORMA = '+ DbLkcFormaPagamento.LookupValue +') ';       //edilaine - SIG35577
    End;

    //edilaine - SIG35577 - inicio
    {if chkSitPartInterno.Checked
    then sSQL := sSQL + ' AND (SPART.FLGINTERNO = '''+qrySitPartInterno.FieldByName('FLGINTERNO').AsString+''')';
    }//edilaine - SIG35577 - fim

    sSqlDivergAnalit := sSQL;
    sSQL := sSQL + ' ORDER BY P.NOME, H.MESREFERENCIA, H.DATAPREVISAORECE, C.NOME ';

    qryDivergAnalit.Close;
    qryDivergAnalit.SQL.Clear;
    qryDivergAnalit.SQl.Add(sSQL);
    try
       qryDivergAnalit.Open;
    except
    end;

    if not tbsDivergencias.TabVisible
    then tbsDivergencias.TabVisible := True;
    dbgrdDivergSintet.Visible := False;
    dbgrdDivergAnalit.Visible := True;
    pgctrlDivergencias.ActivePage := tbsDivergencias;

    if qryDivergAnalit.isempty then
    dbgrdDivergAnalit.PopupMenu := nil
    else     dbgrdDivergAnalit.PopupMenu := pmnu;

    frmAguarde.Apaga;
end;//ExibeDivergAnalit



function  TfrmDivergContrib.AcertaPatronalPorAceitar : boolean;
var sAnoMesCobrancaTela,
    sAnoMesCobranca13,
    sIdContribAssoc,
    sValorRegra,
    sTipCodPatro,
    sCodCResponPatro,
    sContaD,sContaC,
    sCodCCustoC,sCodCCustoD,sCodTipRecDes,sCodCRespon,
    sDataVencimentoPatro,
    sSQL        : string;
    bAcertouAlguma,
    bErro       : boolean;
    iPlnCodigo,
    iCodDocumento,
    iUnidNegoc,
    iCodPortFormaPatro,
    iUnidNegocPatro,
    iIdPatroAtu : longint;
    rTotal      : double;
    iModoSelecionado : word;// André Oliveira SOL 172728 KINTANA 1556309
begin
  Result    := False;

  dtmBaseDados.dbBaseDados.StartTransaction;
  frmAguarde.Mostra('Verificando Patronais ... ');
  //inicio André Oliveira SOL 172728 KINTANA 1556309
  iModoSelecionado := ItemSelecionado;

  if(iModoSelecionado in [0,1,2,3,4])then
  begin
    if (FormatDateTime('MM/YYYY',cmdtDataReceInicial.date)) <> (FormatDateTime('MM/YYYY', cmdtDataReceFinal.date)) then
    begin

         MsgDlg('Para o Recálculo Patronal o período selecionado só pode conter um mês.','Atenção',mtInformation,[mbOk],0);
         cmdtDataReceInicial.SetFocus;
         frmAguarde.Apaga;
         dtmBaseDados.dbBaseDados.RollBack;
          Result    := True;
         Exit;
    end;
    sAnoMesCobrancaTela := FormatDateTime('MM/YYYY',cmdtDataReceInicial.date);
  end
  else
      sAnoMesCobrancaTela := FormaAnoMesTela(cmbMesRef, spedAnoRef);
  //inicio André Oliveira SOL 172728 KINTANA 1556309
  bAcertouAlguma      := False;

  // Se houve algum Ignorar, Entao recalcuar as patronais
  with qryExecuta do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT PLP.IDPESSJUR,   CP.IDPLANOPREV,   CP.IDCONTRIBUICAO, '+
             '        CP.IDCONTRIBPAI, CP.IDCONTRIBPAI2, CP.IDCONTRIBPAI3,  '+
             '        CP.FLGPAGADOR                                         '+
             ' FROM   PLANPREVPATRO PLP, CONTPREV CP                        '+
             ' WHERE  CP.FLGPAGADOR IN (''P'', ''E'')                       '+
             ' AND    PLP.IDPLANOPREV = CP.IDPLANOPREV                      '+
             ' ORDER BY PLP.IDPESSJUR, CP.IDPLANOPREV, CP.ORDEMCALCULO      ');
     // Abrir query com todas as contribuicoes patronais
     Open;
     rTotal := 0;
     while not Eof do
     begin
        Application.ProcessMessages;
        sIdContribAssoc := '';
        if FieldByName('FLGPAGADOR').AsString = 'P'
        then begin
           if FieldByName('IDCONTRIBPAI').AsString <> ''
           then sIdContribAssoc := FieldByName('IDCONTRIBPAI').AsString;

           if FieldByName('IDCONTRIBPAI2').AsString <> ''
           then if Trim(sIdContribAssoc) = ''
                then sIdContribAssoc := FieldByName('IDCONTRIBPAI2').AsString
                else sIdContribAssoc := sIdContribAssoc + ','+ FieldByName('IDCONTRIBPAI2').AsString;

           if FieldByName('IDCONTRIBPAI3').AsString <> ''
           then if Trim(sIdContribAssoc) = ''
                then sIdContribAssoc := FieldByName('IDCONTRIBPAI3').AsString
                else sIdContribAssoc := sIdContribAssoc + ','+ FieldByName('IDCONTRIBPAI3').AsString;
        end;

        qryAcertaContrib.Close;
        qryAcertaContrib.SQL.Clear;
        qryAcertaContrib.SQL.Add(' SELECT PF.DATANASC, PP.SALPARTICIPACAO, PP.INSCRICAODATA, PP.IDSITPART, '+
                                 '        P.NOME AS NOMEPARTICIP, EL.MATRICULA, C.NOMERESUM,               '+
                                 '        CP.IDREGRACALCULO,                                               '+
                                 '        H.*                                                              '+
                                 ' FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL, CONTPREV CP,            '+
                                 '        PARTPREVPLAN PP, HSTCONTRIBPREV H, CONTRIBUICAO C                ');

        if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
        then qryAcertaContrib.SQL.Add(' WHERE   (TO_CHAR(H.DATAPREVISAORECE,''YYYY/MM'') <= '''+sAnoMesCobrancaTela+''' ) ')
        else qryAcertaContrib.SQL.Add(' WHERE  H.MESCOBRANCA     = '''+sAnoMesCobrancaTela+'''');

        qryAcertaContrib.SQL.Add(' AND    H.IDPESSJUR       = '+FieldByName('IDPESSJUR').AsString+
                                 ' AND    H.IDPLANOPREV     = '+FieldByName('IDPLANOPREV').AsString);

        qryAcertaContrib.SQL.Add(' AND    H.OPTRATDIVERG    = 8         '+
                       ' AND    PP.IDPESSJUR      = H.IDPESSJUR         '+
                       ' AND    PP.IDPLANOPREV    = H.IDPLANOPREV       '+
                       ' AND    PP.IDPESSOA       = H.IDPESSOA          '+
                       ' AND    PP.SEQPROPOSTA    = H.SEQPROPOSTA       '+
                       ' AND    PF.IDPESSOA       = H.IDPESSOA          '+
                       ' AND    CP.IDPLANOPREV    = H.IDPLANOPREV       '+
                       ' AND    CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO    '+
                       ' AND    P.IDPESSOA        = PP.IDPESSOA         '+  
                       ' AND    EL.IDPESSJUR      = PP.IDPESSJUR        '+  
                       ' AND    EL.IDPESSOA       = PP.IDPESSOA         '+  
                       ' AND    C.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO   '+  
                       ' ORDER BY CP.ORDEMCALCULO ');
        qryAcertaContrib.Open;
        if qryAcertaContrib.IsEmpty
        then begin
           Next;
           continue;
        end;

        qryAcertaContrib.First;
        while not qryAcertaContrib.Eof do
        begin
           Application.ProcessMessages;
           sSQL := MontaSQLContribNOVA(qryAcertaContrib.FieldByName('IDPESSJUR').AsInteger,
                                       qryAcertaContrib.FieldByName('IDPLANOPREV').AsInteger,
                                       qryAcertaContrib.FieldByName('IDPESSOA').AsInteger,
                                       qryAcertaContrib.FieldByName('SEQPROPOSTA').AsInteger,
                                       qryAcertaContrib.FieldByName('IDCONTRIBUICAO').AsInteger,
                                       qryAcertaContrib.FieldByName('IDMOTIVO').AsInteger,
                                       qryAcertaContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                       qryAcertaContrib.FieldByName('MESREFERENCIA').AsString,
                                       qryAcertaContrib.FieldByName('DATAPREVISAORECE').AsString,
                                       '0',
                                       qryAcertaContrib.FieldByName('INSCRICAODATA').AsString,
                                       qryAcertaContrib.FieldByName('DATANASC').AsString,
                                       'N',
                                       'HSTCONTRIBPREV',
                                       'VALORESPERADO',
                                       qryAcertaContrib.FieldByName('SALPARTICIPACAO').AsString,
                                       qryAcertaContrib.FieldByName('IDSITPART').AsString,
                                       '',
                                       '', 0,-1,
                                       qryAcertaContrib.FieldByName('MESCOBRANCA').AsString,0  );

           sValorRegra := RegraNumerica(qryAcertaContrib.FieldByName('IDREGRACALCULO').AsString, sSQL, bErro, iIdCalculoGeral);

           if FormatFloat('#0.00', qryAcertaContrib.FieldByName('VALORESPERADO').AsFloat) = FormatFloat('#0.00', StrToFloat(ClienteNumero(sValorRegra)) )
           then begin
              qryAcertaContrib.Next;
              continue;
           end;

           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(' UPDATE  HSTCONTRIBPREV SET VALORESPERADO = '+OraNumero(sValorRegra)+', SITRECEBIMENTO = ''T'''+
                          ' WHERE   MESREFERENCIA  = '''+qryAcertaContrib.FieldByName('MESREFERENCIA').AsString+''''+
                          ' AND     MESCOBRANCA    = '''+qryAcertaContrib.FieldByName('MESCOBRANCA').AsString  +''''+
                          ' AND     IDMOTIVO       =   '+qryAcertaContrib.FieldByName('IDMOTIVO').AsString+
                          ' AND     NUMRECEBIMENTO =   '+qryAcertaContrib.FieldByName('NUMRECEBIMENTO').AsString );
           try
              qryAux.ExecSQL;
           except
              memResult.Lines.Add('   [ERRO  ] '+qryAcertaContrib.FieldByName('MATRICULA').AsString+' - '+qryAcertaContrib.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                                  '            [Mês:'+qryAcertaContrib.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryAcertaContrib.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                  '            Erro na atualização do valor esperado da contribuição patronal');

              frmAguarde.Apaga;
              dtmBaseDados.dbBaseDados.RollBack;
              Exit;
           end;

           rTotal := rTotal + StrToFloat(ClienteNumero(sValorRegra));
           bAcertouAlguma := True;
           qryAcertaContrib.Next;
        end;

        Next;
     end; // while

     if not bAcertouAlguma
     then begin
        Result := True;  //erro prendia a transação
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.RollBack;
        Exit;
     end;

     // Apos recalcular as contribuicoes e acerta-las no historico,
     // Excluir seus documentos no CAR e inserir novamente. Caso o documento
     // já tenha sido baixado e, entao, inserir um novo documento de acerto
     qryAcertaContrib.Close;
     qryAcertaContrib.SQL.Clear;
     qryAcertaContrib.SQL.Add(' SELECT  DISTINCT CODDOCUMENTOPREV , IDPESSJUR, IDPLANOPREV, IDCONTRIBUICAO AS IDDESCONTO '+
                              ' FROM    HSTCONTRIBPREV                                                                   ');
     if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas 
     then qryAcertaContrib.SQL.Add(' WHERE   (TO_CHAR(DATAPREVISAORECE,''YYYY/MM'') <= '''+sAnoMesCobrancaTela+''' )     ')
     else qryAcertaContrib.SQL.Add(' WHERE   (MESCOBRANCA    = '''+sAnoMesCobrancaTela+''') ');

     qryAcertaContrib.SQL.Add(' AND     (SITRECEBIMENTO = ''T'' )             '+
                              ' ORDER  BY IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO');
     qryAcertaContrib.Open;
     while not qryAcertaContrib.Eof do
     begin
        Application.ProcessMessages;
        if qryAcertaContrib.FieldByName('CODDOCUMENTOPREV').AsString = ''
        then begin
           qryAcertaContrib.Next;
           continue;
        end;

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE  HSTCONTRIBPREV SET CODDOCUMENTOPREV = NULL ');
        if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas 
        then qryAux.SQL.Add(' WHERE   (TO_CHAR(DATAPREVISAORECE,''YYYY/MM'') <= '''+sAnoMesCobrancaTela+''' ) ')
        else qryAux.SQL.Add(' WHERE   MESCOBRANCA      = '''+sAnoMesCobrancaTela+'''');


        qryAux.SQL.Add(' AND     CODDOCUMENTOPREV =   '+qryAcertaContrib.FieldByName('CODDOCUMENTOPREV').AsString);
        try
           qryAux.ExecSQL;
        except
           memResult.Lines.Add('   [ERRO  ] Documento No.'+qryAcertaContrib.FieldByName('CODDOCUMENTOPREV').AsString+' - Erro ao desassociar documento do histórico - Contrib. Patronal.');
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           Exit;
        end;

        if not EstornaContribuicaoBANCO (CtrlDocumento,
                                         CtrlLancamento,
                                         qryAcertaContrib.FieldByName('CODDOCUMENTOPREV').AsInteger,
                                         dtmAPrev.qry, qryAux,
                                         sAnoMesCobrancaTela,
                                         sMsgErro )
        then begin
           memResult.Lines.Add('   [ERRO  ] Documento No.'+qryAcertaContrib.FieldByName('CODDOCUMENTOPREV').AsString+' - Erro na exclusão/estorno do documento - Contrib. Patronal.');
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           Exit;
        end;

        qryAcertaContrib.Next;
     end;

     // Incluir documento com novos valores
     qryAcertaContrib.Close;
     qryAcertaContrib.SQL.Clear;
     qryAcertaContrib.SQL.Add(' SELECT SUM(H.VALORESPERADO) AS VALOR, H.IDPESSJUR, H.IDPLANOPREV, H.IDCONTRIBUICAO AS IDDESCONTO, '+
                              '        C.NOMERESUM                                                                                '+
                              ' FROM  HSTCONTRIBPREV  H, CONTRIBUICAO C                                                           ');
     if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas 
     then qryAcertaContrib.SQL.Add(' WHERE   (TO_CHAR(H.DATAPREVISAORECE,''YYYY/MM'') <= '''+sAnoMesCobrancaTela+''' ) ')
     else qryAcertaContrib.SQL.Add(' WHERE (H.MESCOBRANCA = '''+sAnoMesCobrancaTela+''') ');


     qryAcertaContrib.SQL.Add(' AND   (H.SITRECEBIMENTO = ''T'') AND (H.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+
                              ' GROUP BY H.IDPESSJUR, H.IDPLANOPREV, H.IDCONTRIBUICAO, C.NOMERESUM         ');
     qryAcertaContrib.Open;
     while not qryAcertaContrib.Eof do
     begin
        Application.ProcessMessages;
        iIdPatroAtu := qryAcertaContrib.FieldByName('IDPESSJUR').AsInteger;

        // Preencher variaveis para integracao contabil/financeira
        BuscaContabPatro  (iIdPatroAtu, iCodPortFormaPatro, sTipCodPatro, sCodCResponPatro, iUnidNegocPatro);
        BuscaContabContrib(iIdPatroAtu,
                           qryAcertaContrib.FieldByName('IdPlanoPrev').AsInteger,
                           qryAcertaContrib.FieldByName('IdDesconto').AsInteger,-1,sContaD,sContaC,
                           sCodCCustoC,sCodCCustoD,sCodTipRecDes,sCodCRespon,iUnidNegoc);

        sDataVencimentoPatro := CriticaDataCobrancaSit(dtmAPrev.qry,
                                               qryAcertaContrib.FieldByName('IDPESSJUR').AsString,
                                               qryAcertaContrib.FieldByName('IDPLANOPREV').AsString,
                                               'PT', 'N',
                                               Copy(sAnoMesCobrancaTela,6,2),
                                               Copy(sAnoMesCobrancaTela,1,4));
        if Trim(sDataVencimentoPatro) = '' then sDataVencimentoPatro := DateToStr(date);

        FazerInsertContab(qryContabil, sContaC,sCodCCustoC,'C','1','',
                   'Receita-Contrib. Patro p/ Participante',
                   'Patrocinadora - '+  copy(sNomePatro,1,24),
                   'Mês de cobrança : '+ sAnoMesCobrancaTela,
                   'Contribuição .: '+QryAcertaContrib.FieldByName('NOMERESUM').AsString,
                   '',iUnidNegoc,-1,
                   qryAcertaContrib.FieldByName('VALOR').AsFloat,-1,
                   StrToDate(sDataVencimentoPatro),
                   prmTpDocRRecPatro,
                   qryAcertaContrib.FieldByName('IDPESSJUR').AsInteger,
                   qryAcertaContrib.FieldByName('IDPLANOPREV').AsInteger);
        // contabilizar as receitas a receber de contribuição
        if sContaD <> ''
        then FazerInsertContab(qryContabil, sContaD,sCodCCustoD,'D','0','',
                   'A Receber-Contrib. Patro p/ Participante',
                   'Patrocinadora - '+ copy(sNomePatro,1,24),
                   'Mês de cobrança : '+ sAnoMesCobrancaTela,
                   'Contribuição .: '+QryAcertaContrib.FieldByName('NOMERESUM').AsString,
                   '',iUnidNegoc,-1,
                   qryAcertaContrib.FieldByName('VALOR').AsFloat,-1,
                   StrToDate(sDataVencimentoPatro),
                   prmTpDocRRecPatro,
                   qryAcertaContrib.FieldByName('IDPESSJUR').AsInteger,
                   qryAcertaContrib.FieldByName('IDPLANOPREV').AsInteger);


        // So alimentar qryDocumentos, que vai para o CAR,se a patro nao for a fundacao
        if ((iIdFundacao <> iIdPatroAtu)
            or  ((iIdPatroAtu = iIdFundacao) and  prmIntegraFundacao)) 
            and prmIntegraCAR
        then AlimentaQryDocumentos(QryDocumentos,-1,-1,IntegraBack.Plano,iUnidNegoc, sContaD,
                  sCodCRespon,sCodTipRecDes,qryAcertaContrib.FieldByName('VALOR').AsFloat,
                  qryAcertaContrib.FieldByName('IDPESSJUR').AsInteger,
                  qryAcertaContrib.FieldByName('IDPLANOPREV').AsInteger,
                  qryAcertaContrib.FieldByName('IDDESCONTO').AsInteger,0,
                  qryAcertaContrib.FieldByName('IDPLANOPREV').AsInteger,   
                  qryAcertaContrib.FieldByName('IDPESSJUR').AsInteger); 

        qryAcertaContrib.Next;
     end;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' UPDATE  HSTCONTRIBPREV SET SITRECEBIMENTO = 1 ');

     if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas 
     then qryAux.SQL.Add(' WHERE   (TO_CHAR(DATAPREVISAORECE,''YYYY/MM'') <= '''+sAnoMesCobrancaTela+''' ) ')
     else qryAux.SQL.Add(' WHERE   MESCOBRANCA      = '''+sAnoMesCobrancaTela+'''');

     qryAux.SQL.Add(' AND     SITRECEBIMENTO = ''T''                    ');
     try
        qryAux.ExecSQL;
     except
        memResult.Lines.Add('   [ERRO  ] Erro na atualização da situação no histórico  - Contrib. Patronal.');
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.RollBack;
        Exit;
     end;

     // Criar Patrocinadora como cliente para poder criar um documento no CAR
     if prmIntegraCAR
     then begin
        try
           
           Ctrldocumento.ForCli.Inserir( iIdPatroAtu,             // liIdPessoa
                                         Sistema.IdEmpresa,       // liIdEmpresa
                                         -1,                      // liCodSubConta
                                         IntegraBack.Plano,       // liPlano
                                         prmIdRamoTipoCliPatro,   // liIdRamoTipoCli
                                         '',                      // sCCusto
                                         '',                      // sContaCAdianto
                                         '',                      // sContaCForCli
                                         '',                      // sContaCDespesa
                                         tfcCliente);             // TipoForCli = (tfcFornecedor, tfcCliente)

        except
           memResult.Lines.Add('   [ERRO  ] Erro ao inserir patrocinadora código '+IntToStr(iIdPatroAtu)+' como cliente. ');
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           Exit;
        end;
     end;

     if prmIntegraContab
     then begin
        IncluiContabilidade(CtrlLancamento, qryContabil , iPlnCodigo, sMsgErro);
        if iPlnCodigo < 0
        then begin
           memResult.Lines.Add('   [ERRO  ] Erro na inclusão do lançamento na contabilidade : '+sMsgErro );
        end;
     end;

     if ((iIdFundacao <> iIdPatroAtu)
        or ((iIdPatroAtu = iIdFundacao) and  prmIntegraFundacao)) 
        and prmIntegraCAR
     then begin
        iCodDocumento := DescarregaDocumentos( CtrlDocumento, 
                                               qryDocumentos , iIDPatroAtu,iplnCodigo,
                                               prmTpDocRRecPatro,
                                               inttoStr(icodPortFormaPatro),
                                               Copy(sAnoMesCobrancaTela,6,2),
                                               Copy(sAnoMesCobrancaTela,1,4),
                                               rTotal,
                                               StrToDate(sDataVencimentoPatro), 'P', 'P', 'R');
        if iCodDocumento < 0
        then begin
           memResult.Lines.Add('   [ERRO  ] Erro na efetivação dos lançamentos da patrocinadora código '+IntToStr(iIdPatroAtu)+' no CAP/CAR.'); 
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           Exit;
        end;
     end;

     qryContabil.CancelUpdates;
     qryDocumentos.CancelUpdates;
  end; // with

  // Calcular o mes de cobranca do 13o. da patrocinadora que será feita agora
  frmAguarde.Mostra('Verificando Patronais sobre 13º ... ');
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT DISTINCT H.IDPESSJUR, PT.MESREFERENCIA AS MESCOBRANCA13  '+
             ' FROM   PARAMSAL13 PT, CONTPREV CP, HSTCONTRIBPREV H             ');
     if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas 
     then SQL.Add(' WHERE   (TO_CHAR(H.DATAPREVISAORECE,''YYYY/MM'') <= '''+sAnoMesCobrancaTela+''' ) ')
     else SQL.Add( ' WHERE  H.MESCOBRANCA     = '''+sAnoMesCobrancaTela+'''');

     SQL.Add(' AND    H.OPTRATDIVERG    = 9                                           '+
             ' AND    H.IDPESSJUR       = PT.IDPESSJUR                                '+
             ' AND    TO_CHAR(PT.EXERCICIO) = TO_CHAR(H.DATAPREVISAORECE,''YYYY/YY'') '+ 
             ' AND    CP.IDPLANOPREV    = H.IDPLANOPREV                               '+
             ' AND    CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO                            ');
     Open;

     while not Eof do
     begin
        Application.ProcessMessages;
        sAnoMesCobranca13 := Copy(sAnoMesCobrancaTela,1,4);
        if FieldByName('MesCobranca13').AsInteger <= 9
        then sAnoMesCobranca13 := sAnoMesCobranca13 +'/0'+FieldByName('MesCobranca13').AsString
        else sAnoMesCobranca13 := sAnoMesCobranca13 +'/' +FieldByName('MesCobranca13').AsString;

        if not VerificaLimiteContribPATRO(FieldByName('IdPessJur').AsInteger ,
                                          sAnoMesCobrancaTela,
                                          sAnoMesCobranca13,
                                          False,
                                          'Atraso',
                                          sMsgErro)
        then begin
            memResult.Lines.Add('   [ERRO  ] Erro na Verificação do Limite das Contribuições da Patrocinadora. '+#13+#10+
                                '            '+sMsgErro);
            frmAguarde.Apaga;
            dtmBaseDados.dbBaseDados.RollBack;
            Exit;
        end;
        Next;
     end; // while
  end; // with
  frmAguarde.Apaga;
  dtmBaseDados.dbBaseDados.Commit;
  Result := True;
end;




procedure TfrmDivergContrib.trvModosCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  inherited;

  Node.ImageIndex := 1;
  Node.SelectedIndex := 1;

end;


procedure TfrmDivergContrib.trvModosExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  Node.ImageIndex := 2;
  Node.SelectedIndex := 2;

end;

procedure TfrmDivergContrib.trvModosChange(Sender: TObject;
  Node: TTreeNode);
var iModoSelecionado : integer;
begin
  inherited;
  lblModo.Caption  := Node.Text;
  iModoSelecionado := ItemSelecionado;

  {
  Modos de Tratamento :
         0 : TODAS as Contribuicoes Divergentes
         1 : Contribuicoes Nao Pagas
         2 : Contribuicoes pagas a menor
         3 : contribuicoes pagas a maior
         4 : contribuicoes pagas em atraso
         5 : divergencias ainda não cobradas/devolvidas
         6 : divergencias ainda não devolvidas
         7 : divergencias ainda não cobradas
         8 : TODOS os Inadimplentes
         9 : Inadimplentes Registrados
         10 : Inadimplentes Cancelados
  }

  N1.visible := not (iModoSelecionado in  [0,8,9,10]);
  N4.visible := not (iModoSelecionado in  [1,2,3,4,7]);
  cmdtDataReceInicial.Visible  := iModoSelecionado in [0,1,2,3,4];
  cmdtDataReceFinal.Visible  := ((iModoSelecionado in [0,1,2,3,4]) and not (chkTodasDiverg.Visible and chkTodasDiverg.Checked));
  lblRecPeriodo.Visible  := ((iModoSelecionado in [0,1,2,3,4]) and not (chkTodasDiverg.Visible and chkTodasDiverg.Checked));
  if not (cmdtDataReceInicial.Visible)  then
     cmdtDataReceInicial.Clear;
  if not (cmdtDataReceFinal.Visible)  then
     cmdtDataReceFinal.Clear;
  pmnuCobraProx.Visible     := (iModoSelecionado in [1,2,4,7]);
  pmnuCobraImed.Visible     := (iModoSelecionado in [1,2,4,7]);
  pmnuDevolveProx.Visible   := (iModoSelecionado in [3,6]);
  pmnuDevolveImed.Visible   := (iModoSelecionado in [3,6]);
  DescontarnoPrximoBenefcio1.visible  := (iModoSelecionado in [1,2,4,7]);
  AcrescentarnoPrximoBenefcio1.visible := (iModoSelecionado in [3,6]);
  pmnuDevolveIgnora.Visible := (iModoSelecionado in [1,2,3,4,7]);
  pmnuAdiconarDif.Visible   := (iModoSelecionado in [3,6]);

  ParmetrosPadro2.enabled := ((not qryDivergSintet.isempty) or (not qryDivergAnalit.isempty));
  DadosdoParticipante2.enabled := ((not qryDivergAnalit.isempty) and (dbgrdDivergAnalit.visible));
  CobrarDiferenanoProximoMs1.enabled := (iModoSelecionado in [1,2,4,7]) and  ( (not qryDivergAnalit.isempty));
  CobrarDiferenaImediatamente1.enabled := (iModoSelecionado in [1,2,4,7]) and ( (not qryDivergAnalit.isempty));
  DescontarnoPrximoBenefcio2.enabled := (iModoSelecionado in [1,2,4,7]) and ( (not qryDivergAnalit.isempty));
  DevolverDiferenanoPrximoMs1.enabled := (iModoSelecionado in [3,6]) and  ( (not qryDivergAnalit.isempty));
  DevolverDiferenaImediatamente1.enabled := (iModoSelecionado in [3,6]) and ( (not qryDivergAnalit.isempty));
  AcrescentarnoPrximoBenefcio2.enabled := (iModoSelecionado in [3,6]) and ( (not qryDivergAnalit.isempty));
  AdicionarDiferenacomoAporte1.enabled := (iModoSelecionado in [3,6]) and ( (not qryDivergAnalit.isempty));
  IgnorarDiferena1.enabled := (iModoSelecionado in [1,2,3,4,7]) and ((not qryDivergAnalit.isempty));
  RegistrarInadimplncia2.enabled := (iModoSelecionado in [1,2,4,7]) and ( (not qryDivergAnalit.isempty));


  if tb97Param.Visible then
  tb97Param.Visible := False;

  if (dbgrdDivergAnalit.Visible) and (qryDivergAnalit.active) then
  begin
     spbtnDivergAnalitClick(self);
  end
  else if (dbgrdDivergSintet.Visible) and (qryDivergSintet.active) then
  begin
     spbtnDivergSintetClick(self);
  end;


  if   iModoSelecionado  in [1,2,3,4,6,7]
  then
  begin
     Node.ImageIndex := 0;
     Node.SelectedIndex := 0;
  end;

  if   iModoSelecionado  in [9,10]
  then
  begin
     Node.ImageIndex := 3;
     Node.SelectedIndex := 3;
  end;


end;


procedure TfrmDivergContrib.FormCreate(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;

  lstIdContrib := TStringList.create;  //edilaine SIG100591

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
   
   try
      CtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa,
                                       Sistema.IdModulo,
                                       Sistema.IdUsuario,
                                       True);
      CtrlFinanc.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle Financeiro.','Erro',mtError,[mbOK],0);
      Abort;
   end;
   
   //inicio André Oliveira SOL 172728 KINTANA 1556309

  // Preencher Mes e Ano de Referencia com o Mes e Ano Corrente
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12)
  then begin
     cmbMesRef.ItemIndex := AMonth - 1;
     cmbMesRef.Text := cmbMesRef.Items[cmbMesRef.ItemIndex];
  end;
  spedAnoRef.Text := IntToStr(AYear);
  // Exibir os Itens Principais da Arvore expandidos
  trvModos.Items[0].Expanded := True; // Contribuicoes Divergentes
  //trvModos.Items[5].Expanded := True; // Divergências já tratadas
  trvModos.Items[5].Expanded := True; // Inadimplentes

  lblModo.Caption := trvModos.Items[0].Text;

  // Preparar form
  WindowState := wsMaximized;
  bbtnConfirmar.Visible := False;
  bbtnCancelar.Visible  := False;
  pgctrlDivergencias.ActivePage := tbsFiltro;
  tbsDivergencias.TabVisible    := False;

  // Abrir querys
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;
  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;  
  qryPlano.Open;
  qryContrib.Close;
  qryContrib.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;  
  qryContrib.Open;

  QryFormaPagamento.Open;
  qrySitPartInterno.Close;  
  qrySitPartInterno.Open;   

  bPossuiErroAcao := False; //SIG50870
  bProcessou      := False; //SIG50870
end;

procedure TfrmDivergContrib.dblkpcmbPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if Trim(dblkpcmbPatro.Text) <> '' then chkPatro.checked := True;
end;

procedure TfrmDivergContrib.dblkpcmbPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if Trim(dblkpcmbPlano.Text) <> '' then chkPlano.Checked := True;
end;

procedure TfrmDivergContrib.dblkpcmbContribCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if Trim(dblkpcmbContrib.Text) <> '' then chkContrib.Checked := True;
end;

procedure TfrmDivergContrib.edTempoExit(Sender: TObject);
begin
  inherited;
  if Trim(edTempo.Text) <> '' then chkTempo.Checked := True;
end;

procedure TfrmDivergContrib.edValorExit(Sender: TObject);
begin
  inherited;
  if Trim(edValor.Text) <> '' then chkValor.Checked := True;
end;

procedure TfrmDivergContrib.spbtnProcParticipClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     edParticipante.Text    := MontaSelectPart.ValoresChave[3];
     lIdPessoa              := StrToInt(MontaSelectPart.ValoresChave[0]);
     lIdPessJur             := StrToInt(MontaSelectPart.ValoresChave[1]);
     lIdPlanoPrev           := StrToInt(MontaSelectPart.ValoresChave[2]);
     liSeqProposta          := StrToInt(MontaSelectPart.ValoresChave[5]);  //edilaine - SIG35577
     lIdTitular             := StrToInt(MontaSelectPart.ValoresChave[6]);  //edilaine - SIG35577

     chkTodasDiverg.Visible := True;  
     lsMatricula            := MontaSelectPart.ValoresChave[4];   
  end
  else begin
     edParticipante.Text    := '';
     lIdPessoa              := -1;
     lIdPessJur             := -1;
     lIdPlanoPrev           := -1;
     liSeqProposta          := -2;
     lIdTitular             := -1;    //edilaine - SIG35577
     chkTodasDiverg.Visible := False;
     chkTodasDiverg.Checked := False;  
     lsMatricula            := '';       
  end;
  if Trim(edParticipante.Text) <> '' then chkParticipante.checked := True;

  if tb97Param.Visible then
  tb97Param.Visible := False;
end;

procedure TfrmDivergContrib.dblkpcmbPatroExit(Sender: TObject);
begin
  inherited;
  if Trim(dblkpcmbPatro.Text) <> '' then chkPatro.checked := True;
end;

procedure TfrmDivergContrib.dblkpcmbPlanoExit(Sender: TObject);
begin
  inherited;
  if Trim(dblkpcmbPlano.Text) <> '' then chkPlano.checked := True;
end;

procedure TfrmDivergContrib.dblkpcmbContribExit(Sender: TObject);
begin
  inherited;
  if Trim(dblkpcmbContrib.Text) <> '' then chkContrib.checked := True;
end;

procedure TfrmDivergContrib.chkPatroClick(Sender: TObject);
begin
  inherited;
  if not chkPatro.checked then dblkpcmbPatro.Text := '';
end;

procedure TfrmDivergContrib.chkPlanoClick(Sender: TObject);
begin
  inherited;
  if not chkPlano.checked then dblkpcmbPlano.Text := '';
end;

procedure TfrmDivergContrib.chkContribClick(Sender: TObject);
begin
  inherited;
  if not chkContrib.checked then dblkpcmbContrib.Text := '';
end;

procedure TfrmDivergContrib.chkTempoClick(Sender: TObject);
begin
  inherited;
  if not chkTempo.checked then edTempo.Text := '';
end;

procedure TfrmDivergContrib.chkValorClick(Sender: TObject);
begin
  inherited;
  if not chkValor.checked then edValor.Text := '';
end;

procedure TfrmDivergContrib.chkParticipanteClick(Sender: TObject);
begin
  inherited;
  if not chkParticipante.checked
  then begin
     edParticipante.Text := '';
     chkTodasDiverg.Visible := False;  
     chkTodasDiverg.Checked := False;
  end;
end;

procedure TfrmDivergContrib.spbtnDivergSintetClick(Sender: TObject);
var
 iModoSelecionado : word; //André Oliveira SOL 172728 KINTANA 1556309
begin
    iModoSelecionado := ItemSelecionado;  //André Oliveira SOL 172728 KINTANA 1556309begin
  if(iModoSelecionado in [0,1,2,3,4])then
  begin
      if not (chkTodasDiverg.Visible and chkTodasDiverg.Checked)then
      begin
          if(cmdtDataReceInicial.Text = '') or (cmdtDataReceFinal.Text = '')then
          begin
               MsgDlg('É necessário informar a data inicial e a final.','Atenção',mtInformation,[mbOk],0);
               if(cmdtDataReceInicial.Text = '') then
                  cmdtDataReceInicial.SetFocus
               else
                  cmdtDataReceFinal.SetFocus;
               Exit;
          end
          else if(cmdtDataReceInicial.Date >cmdtDataReceFinal.Date)then
          begin
               MsgDlg('A data inicial deverá ser menor que a data final.','Atenção',mtInformation,[mbOk],0);
               cmdtDataReceInicial.SetFocus;
               Exit;
          end;
      end
      else
      begin
           if(cmdtDataReceInicial.Text = '')then
          begin
               MsgDlg('É necessário informar uma data de previsão de recebimento','Atenção',mtInformation,[mbOk],0);
               cmdtDataReceInicial.SetFocus;
               Exit;
          end
      end;
  end;
  inherited;
  ExibeDivergSintet;

  if tb97Param.Visible then
  tb97Param.Visible := False;
end;
procedure TfrmDivergContrib.spbtnDivergAnalitClick(Sender: TObject);
var
 iModoSelecionado : word; //André Oliveira SOL 172728 KINTANA 1556309
begin
    iModoSelecionado := ItemSelecionado;  //André Oliveira SOL 172728 KINTANA 1556309

  if(iModoSelecionado in [0,1,2,3,4])then
  begin
      if not (chkTodasDiverg.Visible and chkTodasDiverg.Checked)then
      begin
          if(cmdtDataReceInicial.Text = '') or (cmdtDataReceFinal.Text = '')then
          begin
               MsgDlg('É necessário informar a data inicial e a final.','Atenção',mtInformation,[mbOk],0);
               if(cmdtDataReceInicial.Text = '') then
                  cmdtDataReceInicial.SetFocus
               else
                  cmdtDataReceFinal.SetFocus;
               Exit;
          end
          else if(cmdtDataReceInicial.Date >cmdtDataReceFinal.Date)then
          begin
               MsgDlg('A data inicial deverá ser menor que a data final.','Atenção',mtInformation,[mbOk],0);
               cmdtDataReceInicial.SetFocus;
               Exit;
          end;
      end
      else
      begin
           if(cmdtDataReceInicial.Text = '')then
          begin
               MsgDlg('É necessário informar uma data de previsão de recebimento','Atenção',mtInformation,[mbOk],0);
               cmdtDataReceInicial.SetFocus;
               Exit;
          end
      end;
  end;
  inherited;
  ExibeDivergAnalit;

  if tb97Param.Visible then
  tb97Param.Visible := False;

  ListaDocsSelecionados.Clear; //TAES - SIG100430
end;

function TfrmDivergContrib.InsereHistorico(var qryLeitura               : TwwQuery ;
                                           sMesCob,     sCodportforma,
                                           sDataRef,    sIdRegra        : String ;
                                           dValorAlter, dValorEsperado,
                                           dValorRecebido               : Extended ;
                                           pcFlgDescFolha,
                                           cRecPag                      : char ;
                                           bAporte                      : Boolean ;
                                           sIdContrib                   : String;
                                           piIdLote                     : longint;
                                           flgtipodesc                  : string;
                                           pNumRecebimentoPai : String = '' //Helio - SOL Nº 253577/17744 PPM Nº 1063636
                                            ) : Boolean;
var sSql,
    sSQLValues,
    sValor,
    sNumRec,
    sFlgDevolucao   : String;
    cAux            : char;
    bGravaLoteAgora : boolean;
begin
   result := False;

   pnlProgresso.Update;
   Application.ProcessMessages;
   frmDivergContrib.update;
   if bCancelaenvio then
   begin
      memResult.Lines.Add('***********************************');
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('***********************************');
      exit;
   end;


   
   //tratamento para flgdevolucao
   if qryLeitura.FieldByName('FLGDEVOLUCAO').AsInteger = 1 then
   begin
      if uppercase(crecpag) = 'R'
      then begin
         cAux := DecimalSeparator;
         DecimalSeparator := '.';
         //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678
         //sValor := floattostr(dValorAlter+(dValorEsperado-dValorRecebido) );
         sValor := floattostr(Abs(dValorAlter+(dValorEsperado-dValorRecebido)) );
         DecimalSeparator := cAux;
         //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678
         //sFlgDevolucao := '1';
         sFlgDevolucao := '0';
      end
      else begin
         cAux := DecimalSeparator;
         DecimalSeparator := '.';
         //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678
         //sValor := floattostr(dValorAlter+(dValorRecebido-dValorEsperado) );
         sValor := floattostr(Abs(dValorAlter+(dValorRecebido-dValorEsperado)) );
         DecimalSeparator := cAux;
         //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678
         //sFlgDevolucao := '0';
         sFlgDevolucao := '1';
      end;
   end
   else
   begin

      if uppercase(crecpag) = 'R'
      then begin
         cAux := DecimalSeparator;
         DecimalSeparator := '.';
         //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678
         //sValor := floattostr(dValorAlter+(dValorEsperado-dValorRecebido) );
         sValor := floattostr(Abs(dValorAlter+(dValorEsperado-dValorRecebido)) );
         DecimalSeparator := cAux;
         sFlgDevolucao := '0';
      end
      else begin
         cAux := DecimalSeparator;
         DecimalSeparator := '.';
         //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678
         //sValor := floattostr(dValorAlter+(dValorRecebido-dValorEsperado) );
         sValor := floattostr(Abs(dValorAlter+(dValorRecebido-dValorEsperado)) );
         DecimalSeparator := cAux;
         sFlgDevolucao := '1';
      end;
   end;
   


   if  dValorEsperado <> dValorRecebido then
   begin

      if piIdLote <= 0
      then begin
         piIdLote := LeUltRegistro(qryAux,'CTRLINTERFACE');
         bGravaLoteAgora := True;
      end
      else bGravaLoteAgora := False;

      sNumRec := IntToStr(LeUltRegistro(qryaux,'HSTCONTRIBPREV'));

      sSql := ' INSERT INTO HSTCONTRIBPREV( MESREFERENCIA,  MESCOBRANCA,  NUMRECEBIMENTO,   '+
              '             IDMOTIVO,       IDREGRACALCULO, CODPORTFORMA, DATAPREVISAORECE, '+
              '             VALORESPERADO,  VALORCALCULADO, IDPESSOA,     IDPESSJUR,        '+
              '             IDPLANOPREV,    IDCONTRIBUICAO, VALOROP1,     VALOROP2,         '+
              '             VALOROP3,       FLGCALCRESERVA, FLGDESCFOLHA, SITRECEBIMENTO,   '+
              '             TIPO,           FLGAPORTE,      FLGDEVOLUCAO, FLGDIVERGENTE,    '+
              '             FLGSITFUNDACAO, PARCELA,        IDLOTE,   FOLHAORIGEM,          '+
              '             SEQPROPOSTA, DATAINICIO,                                        '+
              '             IDTITULAR,                                                      '+ //edilaine - SIG35577
              '             IDPLANPREVCONTAB,                                               '+ //Helio - SOL Nº 253577/17460 PPM Nº 955546
              '             NUMRECEBIMENTOPAI,                                              '+ //Helio - SOL Nº 253577/17744 PPM Nº 1063636
              '             VALORBASE1,                                                     '+ //Taffarel - SIG51896
              '             SALCONTRIB)                                                     '+ //Taffarel - SIG51896
              '             VALUES('+
              ' '''+qryLeitura.FieldByName('MESREFERENCIA').AsString+''','+
              ' '''+sMesCob+''','+
                    sNumRec+','+
                    IntToStr(prmIdMotivoDiverg)+',';

      if Trim(sIdRegra) <> ''
      then sSQL := sSQL + sIdRegra+','
      else sSQL := sSQL + ' NULL, ';

      if Trim(scodportforma) <> ''
      then sSQL := sSQL + scodportforma+','
      else sSQL := sSQL + ' NULL ,';

      if Trim(sDataRef) <> ''
      then sSQL := sSQL + ' TO_DATE('''+sDataRef+''',''dd/mm/yyyy''),'
      else sSQL := sSQL + ' NULL ,';

      sSQL := sSQL +OraNumero(sValor)+','; // ValorEsperado
      sSQL := sSQL +OraNumero(sValor)+','; // ValorCalculado

      sSQL := sSQL +qryLeitura.FieldByName('IDPESSOA').AsString+', ';
      sSQL := sSQL +qryLeitura.FieldByName('IDPESSJUR').AsString+', ';
      sSQL := sSQL +qryLeitura.FieldByName('IDPLANOPREV').AsString+', ';

      if bAporte
      then sSQL := sSQL + sIdContrib+', '
      else sSQL := sSQL +qryLeitura.FieldByName('IDCONTRIBUICAO').AsString+', ';

      if Trim(qryLeitura.FieldByName('VALORBASE1').AsString) <> ''
      then sSQL := sSQL +OraNumero(qryLeitura.FieldByName('VALORBASE1').AsString)+','
      else sSQL := sSQL + ' NULL ,';

      if Trim(qryLeitura.FieldByName('VALORBASE2').AsString) <> ''
      then sSQL := sSQL +OraNumero(qryLeitura.FieldByName('VALORBASE2').AsString)+','
      else sSQL := sSQL + ' NULL ,';

      if Trim(qryLeitura.FieldByName('VALORBASE3').AsString) <> ''
      then sSQL := sSQL +OraNumero(qryLeitura.FieldByName('VALORBASE3').AsString)+','
      else sSQL := sSQL + ' NULL ,';

      sSQL := sSQL +' 0,'; // flgcalcreserva

      sSQL := sSQL+ pcFlgDescFolha+',';

      if bAporte // sitrecebimento
      then sSQL := sSQL+ ' ''2'', '
      else sSQL := sSQL+ ' ''0'', ';

      sSQL := sSQL+ ' ''F'', ';

      if bAporte
      then sSQL := sSQL+ ' 1  '
      else sSQL := sSQL+ ' 0  ';

      sSQL := sSQL + ', '+sFlgDevolucao+', 1 ,'+
                   ' '''+qryLeitura.FieldByName('FLGSITPART').AsString+''' '+
                   ', 0, '+IntToStr(piIdLote)+' '; // Parcela

      //FOLHAORIGEM
      if trim(flgtipodesc) = '' then
      sSQL := sSQL+ ' , ''C''  '
      

      else sSQL := sSQL+ ' ,'''+flgtipodesc+''' ';

      sSQL := sSQL +', 1 ';

      //edilaine - SIG35577: inicio
      if qryLeitura.FieldByName('DATAINICIO').AsString <> '' then
            sSQL := sSQL +', TO_DATE('+QuotedStr(qryLeitura.FieldByName('DATAINICIO').AsString)+',''DD/MM/YYYY'')'
      else
         sSQL := sSQL +', NULL ';

      if (Assigned(qryLeitura.FindField('IDTITULAR'))) and (qryLeitura.FieldByName('IDTITULAR').AsString <> '') then
         sSQL := sSQL +', ' + qryLeitura.FieldByName('IDTITULAR').AsString + ' '
      else
         sSQL := sSQL +', NULL ';
      //edilaine - SIG35577: fim

      //Inicio - Helio - SOL Nº 253577/17460 PPM Nº 955546
      if (Not  bAporte) And //sitrecebimento = 0
         (Assigned(qryLeitura.FindField('IDPLANPREVCONTAB'))) AND
         (qryLeitura.FieldByName('IDPLANPREVCONTAB').AsString <> '') then       //edilaine - SIG35577
      begin
            sSQL := sSQL +', ' + qryLeitura.FieldByName('IDPLANPREVCONTAB').AsString + ' ';
      end else
           sSQL := sSQL +', NULL ';
      //Fim - Helio - SOL Nº 253577/17460 PPM Nº 955546

      //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
      if Trim(pNumRecebimentoPai) <> '' then
      begin
            sSQL := sSQL +', ' + pNumRecebimentoPai + ' ';
      end else
           sSQL := sSQL +', NULL ';
      //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

      //Inicio - Taffarel - SIG51896
      if Trim(qryLeitura.FieldByName('VALORBASE1').AsString) <> ''
      then sSQL := sSQL +', '+OraNumero(qryLeitura.FieldByName('VALORBASE1').AsString)+''
      else sSQL := sSQL + ', NULL ';

      if Trim(qryLeitura.FieldByName('SALCONTRIB').AsString) <> ''
      then sSQL := sSQL +', '+OraNumero(qryLeitura.FieldByName('SALCONTRIB').AsString)+''
      else sSQL := sSQL + ', NULL ';
      //FIM - Taffarel - SIG51896

      sSQL := sSQL +' ) ';
      qryaux.Close;
      qryaux.SQL.Clear;
      qryaux.SQL.Add(sSQL);
      try
        qryaux.Execsql;
        iNumRecebimentoInserido := StrToInt(sNumRec);
      except
        iNumRecebimentoInserido := -1;
        Exit;
      end;
   end;

   { Não corrige os registros enviados para Folha de Beneficio, ela corrigirá depois  }
   //If flgtipodesc <> 'B' Then          //edilaine - SIG35577
   Begin
   // Inserir alterador no historico de alteradores
     if not CalculaAlteradores( qryAux,
                                qryLeitura,
                                qryLeitura.FieldByName('idplanoprev').AsString,
                                qryLeitura.FieldByName('idcontribuicao').AsString,
                                sMesCob,
                                qryLeitura.FieldByName('MesReferencia').AsString,
                                cRecPag,
                                False,
                                sNumRec,
                                sDataRef)
     then begin
        Exit;
     end;
   End;


   if  dValorEsperado <> dValorRecebido then
   begin
      // Se for para gravar o lote agora, inserir lote na ctrlinterface
      if bGravaLoteAgora
      then begin
         sSQLValues := '';
         sSQLValues := IntToStr(piIdLote);
         sSQLValues := sSQLValues +', '+qryLeitura.FieldByName('IDPESSJUR').AsString;
         sSQLValues := sSQLValues+', '''+sMesCob+'''';
         sSQLValues := sSQLValues+', ''P''';
         if sFlgDevolucao = '1'
         then begin
            sSQLValues := sSQLValues+', ''Matrícula : '+qryLeitura.FieldByName('Matricula').AsString+' - Devolução de Contribuição.''';
            sSQLValues := sSQLValues+', ''D''';
         end
         else begin
            sSQLValues := sSQLValues+', ''Matrícula : '+qryLeitura.FieldByName('Matricula').AsString+' - Acerto de Contribuição.''';
            sSQLValues := sSQLValues+', ''A''';
         end;

         sSQLValues := sSQLValues+', 1'; // sFlgPreparado
         sSQLValues := sSQLValues+', 0'; // sFlgIdaTmp
         sSQLValues := sSQLValues+', 0'; // sFlgVoltaTmp
         sSQLValues := sSQLValues+', 0'; // sFlgIdaInterface
         sSQLValues := sSQLValues+', 0'; // sFlgVoltaInterface
         sSQLValues := sSQLValues+', TO_DATE('''+DateToStr(date)+''',''dd/mm/yyyy'')'; // sDataPreparo
         sSQLValues := sSQLValues+', NULL '; // sDataIdaTmp
         sSQLValues := sSQLValues+', NULL '; // sDataVoltaTmp
         sSQLValues := sSQLValues+', NULL '; // sDataIdaInterface
         sSQLValues := sSQLValues+', NULL '; // sDATAVOLTAINTERFA

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' INSERT INTO CTRLINTERFACE (IDLOTE,IDPESSOA,MESREFERENCIA,TIPO,DESCRICAO, FLGATRASODEVOL,'+
                    '                            FLGPREPARADO,FLGIDATMP,FLGVOLTATMP, '+
                    '                            FLGIDAINTERFACE,FLGVOLTAINTERFACE,  '+
                    '                            DATAPREPARO,DATAIDATMP,DATAVOLTATMP,DATAIDAINTERFACE,DATAVOLTAINTERFA) '+
                    ' VALUES('+sSQLValues+')');

         try
            qryAux.ExecSQL;
         except
            Exit;
         end;
      end;
   end;//if dValorEsperado <> dValorRecebido

   Result := True;
end;


function TfrmDivergContrib.AtualizaVlHistorico(var qryLeitura : twwquery ; bAporte : Boolean;
                                               sCompara : String; piOpTratDiverg : word) : Boolean;
var sSql: String;
begin
   result := False;

   pnlProgresso.Update;
   Application.ProcessMessages;
   frmDivergContrib.update;
   if bCancelaenvio then
   begin
      memResult.Lines.Add('***********************************');
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('***********************************');
      exit;
   end;


   if not bAporte then
   begin
     sSql := ' UPDATE HSTCONTRIBPREV SET '+sCompara+' SITRECEBIMENTO = ''2'' , OPTRATDIVERG = '+IntToStr(piOpTratDiverg)+
              ' WHERE (NUMRECEBIMENTO = '+qryLeitura.FieldByName('NUMRECEBIMENTO').AsString+') '+
              ' AND (MESREFERENCIA    = '''+qryLeitura.FieldByName('MESREFERENCIA').AsString+''') '+
              ' AND (IDMOTIVO         = '+qryLeitura.FieldByName('IDMOTIVO').AsString+') '+
              ' AND (MESCOBRANCA      = '''+qryLeitura.FieldByName('MESCOBRANCA').AsString+''') ';

      qryaux.Close;
      qryaux.SQL.Clear;
      qryaux.SQL.Add(sSQL);
      try
        qryaux.Execsql;
      except
        Exit;
      end;
   end
   else
   begin

      sSql := ' UPDATE HSTCONTRIBPREV SET  SITRECEBIMENTO = ''4'', FLGDEVOLUCAO = 0  , OPTRATDIVERG = '+IntToStr(piOpTratDiverg)+
              ' WHERE (NUMRECEBIMENTO = '+qryLeitura.FieldByName('NUMRECEBIMENTO').AsString+') '+
              ' AND (MESREFERENCIA = '''+qryLeitura.FieldByName('MESREFERENCIA').AsString+''') '+
              ' AND (IDMOTIVO = '+qryLeitura.FieldByName('IDMOTIVO').AsString+') '+
              ' AND (MESCOBRANCA = '''+qryLeitura.FieldByName('MESCOBRANCA').AsString+''') ';

      qryaux.Close;
      qryaux.SQL.Clear;
      qryaux.SQL.Add(sSQL);
      try
        qryaux.Execsql;
      except
        Exit;
      end;
   end;

   result := True;
end;


//-----------Atualiza situação no histórico de contribuições previdenciárias -----//
function  TfrmDivergContrib.AtualizaSitRecebimento( numrecebimento : string;
                                                    mesreferencia  : string;
                                                    mescobranca    : string;
                                                    idmotivo       : string;
                                                    snome          : string;
                                                    scontrib       : string;
                                                    bApenasTrata   : boolean;
                                                    piOpTratDiverg : longint;
                                                    psMatricula    : string = '') : boolean;

var sSQL : string;
begin
   Result := False;

   if not bApenasTrata then
   begin
      sSQL := ' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO = ''4'' , OPTRATDIVERG = '+IntToStr(piOpTratDiverg)+
              ' WHERE (NUMRECEBIMENTO = '+numrecebimento+') '+
              ' AND (MESREFERENCIA = '''+mesreferencia+''') '+
              ' AND (MESCOBRANCA = '''+mescobranca+''') '+
              ' AND (IDMOTIVO = '+idmotivo+') ';
   end
   else
   begin
      sSQL := ' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO = ''8'' , OPTRATDIVERG = '+IntToStr(piOpTratDiverg)+
              ' WHERE (NUMRECEBIMENTO = '+numrecebimento+') '+
              ' AND (MESREFERENCIA = '''+mesreferencia+''') '+
              ' AND (MESCOBRANCA = '''+mescobranca+''') '+
              ' AND (IDMOTIVO = '+idmotivo+') ';
   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   try
     qryAux.ExecSQL;
   except
      memResult.Lines.Add('   [ERRO  ] '+psMatricula+' - '+sNome                     +#13+#10+
                          '            [Mês:'+mesreferencia+'-Contrib:'+sContrib+'] '+#13+#10+
                          '            Erro na atualização da situação no histórico.');

      Exit;
   end;
   Result := True;
end;//AtualizaSitRecebimento



function TfrmDivergContrib.CalculaAlteradores( qryAux,           qryLeitura       : TwwQuery;
                                               sIdPlanoPrev,     sIdContribuicao,
                                               psMesCobranca,    psMesReferencia  : String ;
                                               cRecPag                            : Char ;
                                               bApenasTrata                       : Boolean;
                                               psNumRecebimento                   : String;
                                               psDataCobranca                     : string ) : Boolean;  

var bErro : boolean;
    cAux  : char;
    sSQL,
    sTipo,
    sDesc : String;
    dValorAlterador : double;
begin
   bErro         := False;
   Result        := False;
   dValorParcial :=0;

   pnlProgresso.Update;

   qryaltaux.close;
   qryaltaux.sql.clear;
   qryaltaux.sql.add(' SELECT TIPOALTERADOR.CODALTERADOR, IDREGRACALCULO, DESCRICAO NOMEALTERADOR '+
                     ' FROM   ALTERADORXCONTRIB, TIPOALTERADOR '+
                     ' WHERE  TIPOALTERADOR.CODALTERADOR = ALTERADORXCONTRIB.CODALTERADOR '+
                     ' AND    ALTERADORXCONTRIB.IDPLANOPREV = '+sidplanoprev+' '+
                     ' AND    ALTERADORXCONTRIB.IDCONTRIBUICAO = '+sidcontribuicao+' '+
                     ' AND    ALTERADORXCONTRIB.FLGCOBRA = 1 ');

   if uppercase(cRecPag) = 'R'
   then qryaltaux.sql.add(' AND ALTERADORXCONTRIB.FLGATRASO = 1 ')
   else qryaltaux.sql.add(' AND ALTERADORXCONTRIB.FLGDEVOL = 1 ');
   if bApenasTrata
   then qryaltaux.sql.add(' AND ALTERADORXCONTRIB.FLGCALCRESERVA = 1 ');
   qryaltaux.Open;

   if qryaltaux.isempty
   then begin
      gagProgresso.Progress :=  gagProgresso.Progress +1 ;
      result := True;
      Exit;
   end;

   qryaltaux.First;

   pnlProgresso.Update;
   Application.ProcessMessages;
   frmDivergContrib.update;
   if bCancelaenvio
   then begin
      memResult.Lines.Add('***********************************');
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('***********************************');
      exit;
   end;

   while not qryaltaux.Eof do
   begin
      if not PreparaQryJurosAtraso(qryLeitura.FieldByName('idpessjur').AsInteger,
                                   qryLeitura.FieldByName('idplanoprev').AsInteger,
                                   qryLeitura.FieldByName('mesreferencia').AsString,
                                   qryLeitura.FieldByName('mescobranca').AsString,
                                   psMesCobranca,
                                   qryLeitura.FieldByName('idpessoa').AsInteger,
                                   qryLeitura.FieldByName('IdContribuicao').AsInteger,
                                   qryLeitura.FieldByName('numrecebimento').AsString,
                                   psDataCobranca,
                                   dValorAlterador )  

      then begin
         memResult.Lines.Add('   [ERRO  ] '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString                 +#13+#10+
                             '            [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryLeitura.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                             '            Erro na preparação da Regra de Cálculo de Alterador por Atraso.                                                     ');

          
         bErro := True;
         balguma := True;
         qryaltaux.next;
         continue;
      end
      else  balguma := True;

      pnlProgresso.Update;
      Application.ProcessMessages;
      frmDivergContrib.update;
      if bCancelaenvio
      then begin
         memResult.Lines.Add('***********************************');
         memResult.Lines.Add('Processo interrompido pelo usuário.');
         memResult.Lines.Add('***********************************');
         exit;
      end;

      if qryaltaux.FieldByName('IDREGRACALCULO').AsString <> ''
      then begin
         balguma := True;
         regCalculo.RuleName := qryaltaux.FieldByName('IDREGRACALCULO').AsString;
         try
            regCalculo.QueryIn := qryAtraso;
            regCalculo.Execute;
         except
            memResult.Lines.Add('   [ERRO  ] '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString                 +#13+#10+
                                '            [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryLeitura.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                '            Erro na execução da Regra de Cálculo de Alterador por Atraso.                                                       ');

            bErro := True;
            balguma := True;
            qryaltaux.next;
            continue;
         end;
      end
      else begin
         memResult.Lines.Add('   [ERRO  ] '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString                 +#13+#10+
                             '            [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryLeitura.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                             '            Regra de Cálculo de Alterador por Atraso não cadastrada. ');


         bErro := True;
         balguma := True;
         qryaltaux.next;
         continue;
      end;

      if (not bApenasTrata) and (StrToFloat(ClienteNumero(RegCalculo.Result)) > 0)     //BRUNO AZEVEDO DESCOMENTAR
      then begin
         // Se for a receber -> atraso, se for a pagar -> devolução
         if uppercase(cRecPag) = 'R'
         then sTipo := 'A'
         else sTipo := 'D';


         if (prmFLGACUMALTER = 1) then
            dValorAlterador := dValorAlterador + StrToFloat(ClienteNumero(RegCalculo.Result))
         else dValorAlterador :=  StrToFloat(ClienteNumero(RegCalculo.Result));



         sSQL := ' INSERT INTO HSTATRASOCONTRIB( MESREFERENCIA, MESCOBRANCA, '+
                 '                               NUMRECEBIMENTO,IDMOTIVO,    '+
                 '             CODALTERADOR,VALOR,FLGTIPO) '+
                 '             VALUES( '+
                 ' '''+ psMesReferencia +''','+
                 ' '''+ psMesCobranca   +''','+
                        psNumRecebimento+','+
                        IntToStr(prmIdMotivoDiverg)+','+
                        qryAltAux.FieldByName('codalterador').AsString+', '+
                       OraNumero(FloatToStr(dValorAlterador))+','+
                 ' '''+sTipo+''' )';

         qryaux.Close;
         qryaux.SQL.Clear;
         qryaux.SQL.Add(sSQL);
         try
           qryaux.Execsql;
         except
            memResult.Lines.Add('   [ERRO  ] '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString                 +#13+#10+
                                '            [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryLeitura.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                '            Erro na gravação do alterador '+qryAltAux.FieldByName('codalterador').AsString+' no histórico.');
             
            bErro := True;
            balguma := True;
            qryaltaux.next;
            continue;
         end;
         bAlguma := True;
      end;//if not bapenastrata

      bAlguma := True;
      qryaltaux.next;
   end;
   if not bErro then result := True;
end;

function TfrmDivergContrib.CobraProxMes(var qryLeitura : Twwquery ; bindividual : Boolean ;
                                        sMesNovaCobranca, sDataRef, sCodPortForma ,referencia : String ;
                                        flgtipodesc,flgdescfolha,
                                        crecpag : char;
                                        piOpTratDiverg : longint  ) : Boolean;
var bErro,
    bOK   : boolean;
    i     : integer;
    sSQLValues,
    sAnoMesCobrancaTela : string;
    iIdLote             : longint;
    cAux                : Char;
    iOpTratDiverg       : word;
    sDocumentosSel      : string;
    iModoSelecionado : word;//André Oliveira SOL 172728 KINTANA 1556309
    bGravaLote       : boolean;  // edilaine - SIG35577
    bAcaoJudicial       : boolean; //Denis Horongoso - SIG50870
    sTipoAcao           : String;  //Denis Horongoso - SIG50870
    sMotivo             : String;  //Denis Horongoso - SIG50870
begin
   Result := False;
   bErro  := False;

   iModoSelecionado := ItemSelecionado;//André Oliveira SOL 172728 KINTANA 1556309

   if prmIdMotivoDiverg <= 0
   then begin
      MsgDlg('Motivo padrão para tratamento de divergência não cadastrado. Verique.',
             'Erro',mtError,[mbOk, mbHelp],0);
      Exit;
   end;
    //inicio André Oliveira SOL 172728 KINTANA 1556309
   // Preencher o mes de cobranca de acordo com a tela
   if not (iModoSelecionado in  [0,1,2,3,4])then
   begin
       sAnoMesCobrancaTela := FormaAnoMesTela(cmbMesRef, spedAnoRef);
       if Trim(sMesNovaCobranca) = ''
       then sMesNovaCobranca    := ProximoAnoMes(StrToInt(Copy(sAnoMesCobrancaTela,6,2)),
                                    StrToInt(Copy(sAnoMesCobrancaTela,1,4)));
   end;
   //fim André Oliveira SOL 172728 KINTANA 1556309
   if flgDescFolha = 'B'
   then begin
      sMesNovaCobranca := ProximoMesAberto( sMesNovaCobranca,
                                              qryLeitura.FieldByName('IdPessJur').AsInteger,
                                              cteIdModuloFolhaBen,
                                              'E');

   end
   else begin
      if qryLeitura.FieldByName('IdPessJur').AsInteger = iIdFundacao
      then sMesNovaCobranca := ProximoMesAberto( sMesNovaCobranca,
                                                   qryLeitura.FieldByName('IdPessJur').AsInteger,
                                                   cteIdModuloFolhaCM,
                                                   'E')
      else sMesNovaCobranca := ProximoMesAberto( sMesNovaCobranca,
                                              qryLeitura.FieldByName('IdPessJur').AsInteger,
                                              cteIdModuloCCP,
                                              'E');

   end;

   if Trim(sDataRef) = ''
   then begin
      if qryLeitura.FieldByName('flgsitpart').AsString = 'AS'
      then sDataRef := CriticaDataCobrancaSit(dtmAPrev.qry,
                                          IntToStr(iIdFundacao),
                                          qryLeitura.FieldByName('idplanoprev').AsString,
                                          'AS', 'N',
                                          Copy(sMesNovaCobranca,6,2), Copy(sMesNovaCobranca,1,4))
      else sDataRef := CriticaDataCobrancaSit(dtmAPrev.qry,
                                          qryLeitura.FieldByName('idpessjur').AsString,
                                          qryLeitura.FieldByName('idplanoprev').AsString,
                                          qryLeitura.FieldByName('flgsitpart').AsString, 'N',
                                          Copy(sMesNovaCobranca,6,2), Copy(sMesNovaCobranca,1,4));
   end;

   // edilaine - SIG35577 - inicio
   bGravaLote := (rDadosLote.iIdLoteSelecionado <= 0);

   if bGravaLote then
      iIdLote := LeUltRegistro(qryAux,'CTRLINTERFACE')
   else
   begin
      iIdLote          := rDadosLote.iIdLoteSelecionado;
      sMesNovaCobranca := rDadosLote.sMesCobranca;
      sDataRef         := rDadosLote.sDataPagamento;
   end;
   // edilaine - SIG35577 - fim

   if bIndividual
   then begin
      if dbgrdDivergAnalit.SelectedList.Count > 0 then
      begin
         gagProgresso.Progress := 0;
         gagProgresso.MaxValue := dbgrdDivergAnalit.SelectedList.Count;
         for i:= 0 to dbgrdDivergAnalit.SelectedList.Count-1 do
         begin

            // -------------------------------------------------------------------------------------
            
            If (qryLeitura.FieldByName('CODDOCUMENTOPREV').AsInteger > 0) And
               (DocBaixadoCAR(qryLeitura.FieldByName('CODDOCUMENTOPREV').AsString)) and
               (qryLeitura.FieldByName('VALORRECEBIDO').AsFloat = 0) and 
               (qryLeitura.FieldByName('SITRECEBIMENTO').AsInteger <> 3) then
            Begin
               memResult.Lines.Add('   [ERRO  ] Documento nº '+qryLeitura.FieldByName('CODDOCUMENTOPREV').AsString+' - está baixado no CAR mas não foi realizado ' + #13+#10+
                                   '            o recebimento da contribuição. Utilize a tela do menu CONTRIBUIÇÕES | RECEBIMENTO DE COBRANÇAS VIA BANCO '+#13+#10+
                                   '            para proceder o recebimento das contribuições. [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'- Contrib:'+
                                   qryLeitura.FieldByName('NOMERESUM').AsString+']' );
               Continue;
            End;
            
            // -------------------------------------------------------------------------------------

            dbgrdDivergAnalit.datasource.dataset.GotoBookmark(dbgrdDivergAnalit.SelectedList.items[i]);
            lblMsg2.Caption  := 'Matrícula : '+qryLeitura.FieldByName('MATRICULA').AsString+' ... ';
            if BuscaOpcoes( qryLeitura.FieldByName('FLGSITPART').AsString,
                            qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                            qryLeitura.FieldByName('MATRICULA').AsString,
                            qryLeitura.FieldByName('PLANPREV').AsString,
                            qryLeitura.FieldByName('PESSJUR').AsString,imodo,
                            qryLeitura.FieldByName('VALORESPERADO').AsFloat,
                            qryLeitura.FieldByName('VALORRECEBIDO').AsFloat )
            then begin
               cAux             := DecimalSeparator;
               DecimalSeparator := '.';
               bAlguma          := True;

               //Denis Horongoso - SIG50870 - Inicio
               bAcaoJudicial := False;

               if (iModoSelecionado = 1) and (piOpTratDiverg = 3) then //Contribuições não pagas e Descontar no próximo benefício
                  bAcaoJudicial := ExisteAcaoJudicialVigente(qryLeitura.FieldByName('IdPessoa').AsString,
                                                             qryLeitura.FieldByName('IdTitular').AsString,
                                                             qryLeitura.FieldByName('IdContribuicao').AsString,
                                                             qryLeitura.FieldByName('IdPlanoPrev').AsString,
                                                             qryLeitura.FieldByName('IdPessJur').AsString,
                                                             qryLeitura.FieldByName('SeqProposta').AsString,
                                                             sTipoAcao,
                                                             sMotivo);

               if bAcaoJudicial then
               begin
                  memResult.Lines.Add('   [ERRO  ] Matrícula '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString+': Participante possui'+#13+#10+
                                      '            ação judicial do tipo "'+sMotivo+'" e não teve'+#13+#10+
                                      '            sua contribuição '+sTipoAcao);
                  bErro := True;
                  bPossuiErroAcao := True;
               end
               else
               begin
               //Denis Horongoso - SIG50870 - Fim
               // Verifica baixa de documento não pago
               if not VerificaCobrancaBancariaPendente ( qryLeitura,
                                                         sMsgErro    )
               then begin
                  memResult.Lines.Add(sMsgErro);
                  bErro := True;
               end
               else begin
                  // Inserir devolucao no historico
                  if not InsereHistorico( qryLeitura, sMesNovaCobranca, sCodPortForma, sdataref,'',
                                          0, // dValorParcial,
                                          qryLeitura.FieldByName('valoresperado').AsFloat,
                                          qryLeitura.FieldByName('valorrecebido').AsFloat,
                                          flgDescFolha,
                                          crecpag,False,'',iIdLote, flgtipodesc,
                                          qryLeitura.FieldByName('NumRecebimento').AsString)        //edilaine - SIG35577
                  then begin
                     memResult.Lines.Add('   [ERRO  ] '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString                 +#13+#10+
                                         '            [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryLeitura.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                         '            Erro na gravação do histórico de Contribuições.                                                                     ');

                     bErro := True;
                  end;
                  if not AtualizaSitRecebimento( qryLeitura.FieldByName('numrecebimento').AsString,
                                                 qryLeitura.FieldByName('mesreferencia').AsString,
                                                 qryLeitura.FieldByName('mescobranca').AsString,
                                                 qryLeitura.FieldByName('idmotivo').AsString,
                                                 qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                                                 qryLeitura.FieldByName('nomecontrib').AsString, False,piOpTratDiverg,
                                                 qryLeitura.FieldByName('MATRICULA').AsString  
                                                 )
                  then begin
                     balguma := True;
                     bErro := True;
                  end;
               end;
               end; //Denis Horongoso - SIG50870
               DecimalSeparator := cAux;
            end//if buscaopcoes
            else begin
               bAlguma := True;
               bErro   := True;
            end;
            gagProgresso.Progress := gagProgresso.Progress + 1;  
            gagProgresso.Update;                                 
         end;//for
      end
      else begin
          
         gagProgresso.Progress := 0;
         gagProgresso.MaxValue := 1;
         lblMsg2.Caption  := 'Matrícula : '+qryLeitura.FieldByName('MATRICULA').AsString+' ... ';
         if  BuscaOpcoes(qryLeitura.FieldByName('FLGSITPART').AsString,
                       qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                       qryLeitura.FieldByName('MATRICULA').AsString,
                       qryLeitura.FieldByName('PLANPREV').AsString,
                       qryLeitura.FieldByName('PESSJUR').AsString,imodo,
                       qryLeitura.FieldByName('VALORESPERADO').AsFloat,
                       qryLeitura.FieldByName('VALORRECEBIDO').AsFloat)
         then begin
            cAux := DecimalSeparator;
            DecimalSeparator := '.';
            balguma := True;

            //Denis Horongoso - SIG50870 - Inicio
            bAcaoJudicial := False;

            if (iModoSelecionado = 1) and (piOpTratDiverg = 3) then //Contribuições não pagas e Descontar no próximo benefício
               bAcaoJudicial := ExisteAcaoJudicialVigente(qryLeitura.FieldByName('IdPessoa').AsString,
                                                          qryLeitura.FieldByName('IdTitular').AsString,
                                                          qryLeitura.FieldByName('IdContribuicao').AsString,
                                                          qryLeitura.FieldByName('IdPlanoPrev').AsString,
                                                          qryLeitura.FieldByName('IdPessJur').AsString,
                                                          qryLeitura.FieldByName('SeqProposta').AsString,
                                                          sTipoAcao,
                                                          sMotivo);
             
            if bAcaoJudicial then
            begin
               memResult.Lines.Add('   [ERRO  ] Matrícula '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString+': Participante possui'+#13+#10+
                                   '            ação judicial do tipo "'+sMotivo+'" e não teve'+#13+#10+
                                   '            sua contribuição '+sTipoAcao);
               bErro := True;
               bPossuiErroAcao := True;
            end
            else
            begin
            //Denis Horongoso - SIG50870 - Fim
            // Verifica baixa de documento não pago
            if not VerificaCobrancaBancariaPendente ( qryLeitura,
                                                      sMsgErro    )
            then begin
               memResult.Lines.Add(sMsgErro);
               bErro := True;
            end
            else begin
               if not InsereHistorico(qryLeitura,sMesNovaCobranca,sCodPortForma,sdataref,'',
                                      dValorParcial,qryLeitura.FieldByName('valoresperado').AsFloat,qryLeitura.FieldByName('valorrecebido').AsFloat,
                                      flgDescFolha,crecpag,False,'',iIdLote, flgtipodesc,
                                      qryLeitura.FieldByName('NumRecebimento').AsString)        //edilaine - SIG35577
               then begin
                  memResult.Lines.Add('   [ERRO  ] '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString                 +#13+#10+
                                      '            [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryLeitura.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                      '            Erro na gravação do histórico de contribuições.');


                  bErro := True;
               end;

               if not AtualizaSitRecebimento(qryLeitura.FieldByName('numrecebimento').AsString,
                                             qryLeitura.FieldByName('mesreferencia').AsString,
                                             qryLeitura.FieldByName('mescobranca').AsString,
                                             qryLeitura.FieldByName('idmotivo').AsString,
                                             qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                                             qryLeitura.FieldByName('nomecontrib').AsString, False,piOpTratDiverg,
                                             qryLeitura.FieldByName('MATRICULA').AsString  
                                             )
               then begin
                  bErro := True;
               end;
            end;
          end; //Denis Horongoso - SIG50870

            DecimalSeparator := cAux;
         end//if buscaopcoes
         else begin
            balguma := True;
            bErro := True;
         end;
         gagProgresso.Progress := gagProgresso.Progress + 1;  
         gagProgresso.Update;
      end;
   end//bindividual
   else begin
      if dbgrdDivergSintet.SelectedList.Count > 0
      then begin
         for i:= 0 to dbgrdDivergSintet.SelectedList.Count-1 do
         begin
            dbgrdDivergSintet.datasource.dataset.GotoBookmark(dbgrdDivergSintet.SelectedList.items[i]);
            PreparaQrySintetica;
             
            gagProgresso.Progress := 0;
            gagProgresso.MaxValue := qryDivergSintetAux.RecordCount;
            qryDivergSintetAux.First;
            while not  qryDivergSintetAux.Eof do
            begin
               lblMsg2.Caption  := 'Matrícula : '+qryLeitura.FieldByName('MATRICULA').AsString+' ... ';

               // ----------------------------------------------------------------------------------
               
               If (qryLeitura.FieldByName('CODDOCUMENTOPREV').AsInteger > 0) And
                  (DocBaixadoCAR(qryLeitura.FieldByName('CODDOCUMENTOPREV').AsString)) and
                  (qryLeitura.FieldByName('VALORRECEBIDO').AsFloat = 0) and 
                  (qryLeitura.FieldByName('SITRECEBIMENTO').AsInteger <> 3) then 
               Begin
                  memResult.Lines.Add('   [ERRO  ] Documento nº '+qryLeitura.FieldByName('CODDOCUMENTOPREV').AsString+' - está baixado no CAR mas não foi realizado ' + #13+#10+
                                      '            o recebimento da contribuição. Utilize a tela do menu CONTRIBUIÇÕES | RECEBIMENTO DE COBRANÇAS VIA BANCO '+#13+#10+
                                      '            para proceder o recebimento das contribuições. [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'- Contrib:'+
                                      qryLeitura.FieldByName('NOMERESUM').AsString+']' );

                  qryDivergSintetAux.Next;
                  Continue;
               End;
               
               // ----------------------------------------------------------------------------------

               if BuscaOpcoes(qryLeitura.FieldByName('FLGSITPART').AsString,
                          qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                          qryLeitura.FieldByName('MATRICULA').AsString,
                          qryLeitura.FieldByName('PLANPREV').AsString,
                          qryLeitura.FieldByName('PESSJUR').AsString,imodo,
                          qryLeitura.FieldByName('VALORESPERADO').AsFloat,
                          qryLeitura.FieldByName('VALORRECEBIDO').AsFloat)
               then begin
                  cAux := DecimalSeparator;
                  DecimalSeparator := '.';
                  balguma := True;
                   
                  // Verifica baixa de documento não pago
                  if not VerificaCobrancaBancariaPendente ( qryLeitura,
                                                            sMsgErro    )
                  then begin
                     memResult.Lines.Add(sMsgErro);
                     bErro := True;
                  end
                  else begin
                     if not InsereHistorico(qryLeitura,sMesNovaCobranca,sCodPortForma,sdataref,'',
                                            dValorParcial,qryLeitura.FieldByName('valoresperado').AsFloat,
                                            qryLeitura.FieldByName('valorrecebido').AsFloat,
                                            flgDescFolha,crecpag,False,'',iIdLote, flgtipodesc,
                                            qryLeitura.FieldByName('NumRecebimento').AsString)        //edilaine - SIG35577
                     then begin
                        memResult.Lines.Add('   [ERRO  ] '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString                 +#13+#10+
                                            '            [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryLeitura.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                            '            Erro na gravação do histórico de contribuições.');


                        balguma := True;
                        bErro := True;
                     end;

                     if not AtualizaSitRecebimento(qryLeitura.FieldByName('numrecebimento').AsString,
                                                   qryLeitura.FieldByName('mesreferencia').AsString,
                                                   qryLeitura.FieldByName('mescobranca').AsString,
                                                   qryLeitura.FieldByName('idmotivo').AsString,
                                                   qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                                                   qryLeitura.FieldByName('nomecontrib').AsString, False,piOpTratDiverg,
                                                   qryLeitura.FieldByName('MATRICULA').AsString

                                                   )
                     then begin
                        balguma := True;
                        bErro := True;
                     end;
                  end;
                  DecimalSeparator := cAux;
               end//if buscaopcoes
               else
               begin
                  balguma := True;
                  bErro := True;
               end;

               gagProgresso.Progress := gagProgresso.Progress + 1;  
               gagProgresso.Update;                                 

               qryDivergSintetAux.next;
            end;// while
         end;//for
      end
      else begin
         PreparaQrySintetica;
          
         gagProgresso.Progress := 0;
         gagProgresso.MaxValue := qryDivergSintetAux.RecordCount;
         qryDivergSintetAux.First;
         while not  qryDivergSintetAux.eof do
         begin
            lblMsg2.Caption  := 'Matrícula : '+qryLeitura.FieldByName('MATRICULA').AsString+' ... ';
            if BuscaOpcoes(qryLeitura.FieldByName('FLGSITPART').AsString,
                       qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                       qryLeitura.FieldByName('MATRICULA').AsString,
                       qryLeitura.FieldByName('PLANPREV').AsString,
                       qryLeitura.FieldByName('PESSJUR').AsString,imodo,
                       qryLeitura.FieldByName('VALORESPERADO').AsFloat,
                       qryLeitura.FieldByName('VALORRECEBIDO').AsFloat)
            then begin
               cAux := DecimalSeparator;
               DecimalSeparator := '.';
               balguma := True;
                
               // Verifica baixa de documento não pago
               if not VerificaCobrancaBancariaPendente ( qryLeitura,
                                                         sMsgErro    )
               then begin
                  memResult.Lines.Add(sMsgErro);
                  bErro := True;
               end
               else begin
                  if not InsereHistorico(qryLeitura,sMesNovaCobranca,sCodPortForma,sdataref,'',
                                         dValorParcial,qryLeitura.FieldByName('valoresperado').AsFloat,
                                         qryLeitura.FieldByName('valorrecebido').AsFloat,
                                         flgDescFolha,crecpag,False,'',iIdLote, flgtipodesc,
                                         qryLeitura.FieldByName('NumRecebimento').AsString)        //edilaine - SIG35577
                  then begin
                     memResult.Lines.Add('   [ERRO  ] '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString                 +#13+#10+
                                         '            [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryLeitura.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                         '            Erro na gravação do histórico de contribuições.');


                     balguma := True;
                     bErro := True;
                  end;

                  if not AtualizaSitRecebimento(qryLeitura.FieldByName('numrecebimento').AsString,
                                                qryLeitura.FieldByName('mesreferencia').AsString,
                                                qryLeitura.FieldByName('mescobranca').AsString,
                                                qryLeitura.FieldByName('idmotivo').AsString,
                                                qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                                                qryLeitura.FieldByName('nomecontrib').AsString, False,piOpTratDiverg,
                                                qryLeitura.FieldByName('MATRICULA').AsString  
                                                )
                  then begin
                     balguma := True;
                     bErro := True;
                  end;
               end;
               DecimalSeparator := cAux;
            end//if buscaopcoes
            else begin
               balguma := True;
               bErro := True;
            end;

            gagProgresso.Progress :=  gagProgresso.Progress +1 ;
            gagProgresso.Update;
            qryDivergSintetAux.next;
         end; // while
      end;
   end;//bindividual

   // Gravar lote do tratamento
   if bGravaLote {iIdLote > 0}    // edilaine - SIG35577
   then begin
      sSQLValues := '';
      sSQLValues := IntToStr(iIdLote);
      sSQLValues := sSQLValues +', '+qryLeitura.FieldByName('IDPESSJUR').AsString;
      sSQLValues := sSQLValues+', '''+sMesNovaCobranca+'''';
      sSQLValues := sSQLValues+', ''P''';
      if cRecPag = 'P'
      then begin
         sSQLValues := sSQLValues+', ''Trat. Divergência - Devolução de Contribuição.''';
         sSQLValues := sSQLValues+', ''D''';
      end
      else begin
         sSQLValues := sSQLValues+', ''Trat. Divergência - Cobrança de Contribuição.''';
         sSQLValues := sSQLValues+', ''A''';
      end;

      sSQLValues := sSQLValues+', 1'; // sFlgPreparado
      sSQLValues := sSQLValues+', 0'; // sFlgIdaTmp
      sSQLValues := sSQLValues+', 0'; // sFlgVoltaTmp
      sSQLValues := sSQLValues+', 0'; // sFlgIdaInterface
      sSQLValues := sSQLValues+', 0'; // sFlgVoltaInterface
      sSQLValues := sSQLValues+', TO_DATE('''+DateToStr(date)+''',''dd/mm/yyyy'')'; // sDataPreparo
      sSQLValues := sSQLValues+', NULL '; // sDataIdaTmp
      sSQLValues := sSQLValues+', NULL '; // sDataVoltaTmp
      sSQLValues := sSQLValues+', NULL '; // sDataIdaInterface
      sSQLValues := sSQLValues+', NULL '; // sDATAVOLTAINTERFA

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' INSERT INTO CTRLINTERFACE (IDLOTE,IDPESSOA,MESREFERENCIA,TIPO,DESCRICAO, FLGATRASODEVOL,'+
                 '                            FLGPREPARADO,FLGIDATMP,FLGVOLTATMP, '+
                 '                            FLGIDAINTERFACE,FLGVOLTAINTERFACE,  '+
                 '                            DATAPREPARO,DATAIDATMP,DATAVOLTATMP,DATAIDAINTERFACE,DATAVOLTAINTERFA) '+
                 ' VALUES('+sSQLValues+')');

      try
         qryAux.ExecSQL;
      except
         // memResult.Lines.Add('Erro ao gravar lote no controle de lotes.');
         memResult.Lines.Add('   [ERRO  ] Erro ao gravar o Lote No. '+IntToStr(iIdLote));
         bErro := True;
      end;
   end;

   if not bErro
   then Result := True;
end;

procedure  TfrmDivergContrib.PreparaQrySintetica;
var sSql,
    //inicio André Oliveira SOL 172728 KINTANA 1556309
    sAnoMesCobrancaTela,
    sDataRecInicial,
    sDataRecFinal,
    //fim André Oliveira SOL 172728 KINTANA 1556309
     sOperador : String;
    iModoSelecionado : Integer;
begin
    if not TrataFiltro then Exit;

    iModoSelecionado := ItemSelecionado;

    if iModoSelecionado = -1
    then begin
      MsgDlg('Selecione um Modo de Divergência na Lista de Modos. ','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
    end;

    // Preencher o mes de cobranca de acordo com a tela
    sAnoMesCobrancaTela := FormaAnoMesTela(cmbMesRef, spedAnoRef);

    sSQL := ' SELECT DISTINCT NVL(H.VALORESPERADO,0) VALORESPERADO,                                                                '+
            '        NVL(H.VALORRECEBIDO,0) VALORRECEBIDO, H.FLGDEVOLUCAO,                                                         '+
            '        C.NOME AS NOMECONTRIB, P.NOME AS NOMEPARTICIP, EL.MATRICULA , C.IDCONTRIBUICAO,                               '+
            '        CT.IDPLANOPREV, H.MESREFERENCIA, H.MESCOBRANCA, H.IDLOTE, PP.IDPESSJUR,PP.IDPESSOA,                           '+
            '        H.CODDOCUMENTOPREV,PP.IDSITPART, SIT.FLGINTERNO FLGSITPART ,                                                  '+
            '        H.VALOROP1,H.VALOROP2,H.VALOROP3,H.FLGDESCFOLHA, H.FLGCALCRESERVA, H.SITRECEBIMENTO,                          '+
            '        H.VALORCALCULADO, H.NUMRECEBIMENTO, H.DATARECEBIMENTO, H.IDMOTIVO, SP.DESCRICAO SITPLANOPREV,                 '+
            '        SP.FLGINTERNO FLGSITPLANOPREV, PP.SEQPROPOSTA, H.DATARECEBIMENTO , CT.IDRUBRICAATRASO, CT.IDRUBRICADEVOLUC,   '+
            '        PL.NOME PLANPREV, PESSJUR.NOME PESSJUR, H.IDREGRACALCULO , H.CODDOCUMENTOPREV, PP.SEQPROPOSTA,                '+
            '        C.NOMERESUM                                                                                                   '+ 
            ' FROM   SITPLANOPREV SP,SITPART SIT, PLANPREV PL,CONTRIBUICAO C,CONTPREV CT,PARTPREVPLAN PP, ELEGPATRO EL,            '+
            '        PESSOA P,  PESSOA PESSJUR, HSTCONTRIBPREV H, CONTRIBUICAO C                                                   ';

   //inicio André Oliveira SOL 172728 KINTANA 1556309
   if not (iModoSelecionado in  [0,1,2,3,4])then
   begin
       if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
        then sSQL := sSQL +' WHERE   (TO_CHAR(H.DATAPREVISAORECE,''YYYY/MM'') <= '''+sAnoMesCobrancaTela+''' ) '
        else sSQL := sSQL +' WHERE   (TO_CHAR(H.DATAPREVISAORECE,''YYYY/MM'') = '''+sAnoMesCobrancaTela+''' )  ';
   end
   else
   begin
      if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
       then sSQL := sSQL +' WHERE   H.DATAPREVISAORECE <= to_date('+QuotedStr(sDataRecInicial)+' ''DD/MM/YYYY'') '
       else sSQL := sSQL +' WHERE   (H.DATAPREVISAORECE >=  to_date('+QuotedStr(sDataRecInicial)+',''DD/MM/YYYY'') AND  H.DATAPREVISAORECE  <=  to_date('+QuotedStr(sDataRecFinal)+',''DD/MM/YYYY'') ) ';
   end;
   //fim André Oliveira SOL 172728 KINTANA 1556309


    if chkParticipante.Checked
    then sSQL := sSQL+' AND (H.IDPESSOA    = '+IntToStr(lIdPessoa)    +') '+
                      ' AND (H.SEQPROPOSTA = '+IntToStr(liSeqProposta)+') '+
                      ' AND (H.IDPESSJUR   = '+IntToStr(lIdPessJur)   +') '+
                      ' AND (H.IDPLANOPREV = '+IntToStr(lIdPlanoPrev) +') ';


    if chkPatro.Checked
    then sSQL := sSQL+' AND (H.IDPESSJUR = '+qryPatro.FieldByName('IdPessoa').AsString+') ';

    if chkPlano.Checked
    then sSQL := sSQL + ' AND (H.IDPLANOPREV = '+qryPlano.FieldByName('IdPlanoPrev').AsString+') ';


    sSQL := sSQL + ' AND (H.IDCONTRIBUICAO = '+qryDivergSintet.FieldByName('IdContribuicao').AsString+') '+
                   ' AND (C.IDCONTRIBUICAO = H.IDCONTRIBUICAO) ';  

    if chkTempo.Checked
    then begin
      sOperador := vetOperador[cmbFiltraTempo.ItemIndex];

      If IsDB2_Padrao Then
       begin
         sSQL := sSQL + ' AND '+
         '  ( StrToInt(MONTH(TO_DATE(''SYSDATE'',''dd/mm/yyyy''))) - MONTH(TO_DATE(''DATARECEBIMENTO'',''dd/mm/yyyy'')) '+sOperador+' '+Trim(edTempo.Text)+ ' ';
         end
      Else
      sSQL := sSQL + ' AND '+'  ( TRUNC(MONTHS_BETWEEN(SYSDATE,H.DATARECEBIMENTO) ,0) '+sOperador+' '+Trim(edTempo.Text)+') ';
    end;

    if chkValor.Checked
    then begin
      sOperador := vetOperador[cmbFiltraValor.ItemIndex];
      sSQL := sSQL + ' AND '+' ( (NVL(H.VALORRECEBIDO,0) - NVL(H.VALORESPERADO,0)) '+sOperador+' '+OraNumero(trim(edValor.Text))+') ';
    end;

    //Everson Cunha - SIG79795 - Início
    if chkMesRef.Checked
    then begin
      sOperador := vetOperador[cmbFiltraMesRef.ItemIndex];
      sSQL := sSQL + ' AND '+' ( H.MESREFERENCIA '+sOperador+' '+QuotedStr(trim(edtMesRef.Text))+') ';
    end;
    //Everson Cunha - SIG79795 - Fim


    case iModoSelecionado of
         0 : begin // TODAS as Contribuicoes Divergentes
                sSQL := sSQL+' AND (NVL(H.VALORESPERADO,0) <> NVL(H.VALORRECEBIDO,0)) ';
                sSQL := sSQL+' AND  ((H.SITRECEBIMENTO =''1'') OR (H.SITRECEBIMENTO = ''3'')) ';
             end;
         1 : begin // Contribuicoes Nao Pagas
                sSQL := sSQL+' AND (NVL(H.VALORESPERADO,0) <> NVL(H.VALORRECEBIDO,0)) ';
                sSQL := sSQL+' AND (NVL(H.VALORRECEBIDO,0) <= 0) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'' ) ';
             end;
         2 : begin // Contribuicoes pagas a menor
                sSQL := sSQL+' AND (NVL(H.VALORRECEBIDO,0) < NVL(H.VALORESPERADO,0)) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'' ) ';
             end;
         3 : begin // contribuicoes pagas a maior
                sSQL := sSQL+' AND (NVL(H.VALORRECEBIDO,0) > NVL(H.VALORESPERADO,0)) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'' ) ';
             end;
         4 : begin // contribuicoes pagas em atraso
                sSQL := sSQL+' AND (NVL(H.VALORESPERADO,0) = NVL(H.VALORRECEBIDO,0)) ';
                sSQL := sSQL+' AND (H.DATAPREVISAORECE < H.DATARECEBIMENTO ) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'' ) ';
             end;
         5 : begin // divergencias já tratadas, ainda não cobradas/devolvidas
                sSQL := sSQL+' AND (NVL(H.VALORESPERADO,0) <> NVL(H.VALORRECEBIDO,0)) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''8'') ';
             end;
         6 : begin // divergencias já tratadas, ainda não devolvidas
                sSQL := sSQL+' AND (H.FLGDEVOLUCAO = 1 ) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''8'' ) ';
             end;
         7 : begin // divergencias tratadas, ainda não cobradas
                sSQL := sSQL+' AND (H.FLGDEVOLUCAO = 0 ) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''8'' ) ';
             end;
         8 : begin // TODOS os Inadimplentes
                sSQL := sSQL+' AND (NVL(H.VALORESPERADO,0) <> NVL(H.VALORRECEBIDO,0)) ';
                sSQL := sSQL + ' AND ((SP.FLGINTERNO = ''IN'') OR (SP.FLGINTERNO = ''CI'') ) ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'' ) ';
             end;
         9 : begin // Inadimplentes Registrados
                sSQL := sSQL+' AND (NVL(H.VALORESPERADO,0) <> NVL(H.VALORRECEBIDO,0)) ';
                sSQL := sSQL + ' AND (SP.FLGINTERNO = ''IN'')  ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'' ) ';
             end;
         10 : begin // Inadimplentes Cancelados
                sSQL := sSQL+' AND (NVL(H.VALORESPERADO,0) <> NVL(H.VALORRECEBIDO,0)) ';
                sSQL := sSQL + ' AND (SP.FLGINTERNO = ''CI'') ';
                sSQL := sSQL+' AND (H.SITRECEBIMENTO = ''3'' ) ';
             end;
    end;


    sSQL := sSQL + ' AND (H.IDPESSOA    = PP.IDPESSOA) '+
                   ' AND (H.SEQPROPOSTA = PP.SEQPROPOSTA) '+
                   ' AND (H.IDPESSJUR   = PP.IDPESSJUR) '+
                   ' AND (H.IDPLANOPREV = PP.IDPLANOPREV) '+
                   ' AND (PP.IDSITPLANOPREV  = SP.IDSITPLANOPREV) '+
                   ' AND (EL.IDPESSOA  = PP.IDPESSOA) '+
                   ' AND (EL.IDPESSJUR = PP.IDPESSJUR) '+
                   ' AND (C.IDCONTRIBUICAO = CT.IDCONTRIBUICAO) '+
                   ' AND (C.IDCONTRIBUICAO = H.IDCONTRIBUICAO) '+
                   ' AND (PP.IDPLANOPREV = CT.IDPLANOPREV) '+
                   ' AND (P.IDPESSOA = PP.IDPESSOA) '+
                   ' AND (H.IDPESSJUR = PESSJUR.IDPESSOA) '+
                   ' AND (H.IDPLANOPREV = PL.IDPLANOPREV) '+
                   ' AND (PP.IDSITPART = SIT.IDSITPART) ';
    sSQL := sSQL + ' ORDER BY P.NOME, C.NOME ';

    qryDivergSintetAux.Close;
    qryDivergSintetAux.SQL.Clear;
    qryDivergSintetAux.SQl.Add(sSQL);
    try
       qryDivergSintetAux.Open;
    except
    end;
end;


function TfrmDivergContrib.PreparaQryJurosAtraso( IdPatro,
                                                  IdPlano              : integer;
                                                  sMesRef,
                                                  sMesCob,
                                                  sMesNovaCob          : string;
                                                  IdParticipante,
                                                  IdContribuicao       : integer ;
                                                  sNumRec,
                                                  psDataCobranca       : string;
                                                  var pdValorAlterador : double ) : Boolean;  
var sSQL : string;                                                  
begin
   Result := False;

   if Trim(psDataCobranca) = '' then psDataCobranca := DateToStr(date);
   sSQL := ' SELECT H.MESREFERENCIA, '''+sMesNovaCob+''' AS MESCOBRANCA, '+
           '        H.NUMRECEBIMENTO, H.IDMOTIVO,                        '+
           '        H.DATAPREVISAORECE,                                  '+
           '        TO_DATE('''+psDataCobranca+''', ''DD/MM/YYYY'')    AS DATARECEBIMENTO, '+
           '        TO_DATE('''+psDataCobranca+''', ''DD/MM/YYYY'')    AS DATAREF,         '+
           '        NVL(H.VALORESPERADO,0) + (NVL(HA.VALOR,0))         AS VALORESPERADO,   '+
           '        NVL(H.VALORRECEBIDO,0) + (NVL(HA.VALORRECEBIDO,0)) AS VALORRECEBIDO,   '+
           '        NVL(H.VALORESPERADO,0) + (NVL(HA.VALOR,0))         AS VALORPREV,       '+
           '        (NVL(HA.VALOR,0))                                  AS ALTERADOR,        '+
           '        0 FLGEVENTO, '+ 
           IntToSTr(Sistema.Idmodulo)      +'   AS IDMODULO '+ 
           ' FROM   PLANPREV,CONTPREV, /*CONTRIBPREVPARTP,*/ HSTCONTRIBPREV H ,            '+   //edilaine - SIG36752
           '        ( SELECT SUM(VALOR) VALOR ,                                            '+
           '                 SUM(VALORRECEBIDO) VALORRECEBIDO, NUMRECEBIMENTO              '+
           '          FROM HSTATRASOCONTRIB                                                '+
           '          WHERE MESCOBRANCA = '''+sMesCob+'''                                  '+
           '          GROUP BY NUMRECEBIMENTO) HA                                          '+
           ' WHERE  (H.IDPESSJUR      = '+IntToStr(idPatro)+')           AND               '+   //edilaine - SIG36752
           '        (H.IDPLANOPREV    = '+IntToStr(idPlano)+')           AND               '+   //edilaine - SIG36752
           '        (CONTPREV.IDCONTRIBUICAO         = '+IntToStr(idContribuicao)+')    AND        '+
           '        (CONTPREV.IDPLANOPREV            = H.IDPLANOPREV)                   AND        '+          //edilaine - SIG36752
           '        (CONTPREV.IDCONTRIBUICAO         = H.IDCONTRIBUICAO)                AND        '+          //edilaine - SIG36752
           '        (CONTPREV.FLGPAGADOR             <> ''E'')                          AND        '+
           '        (PLANPREV.IDPLANOPREV            = H.IDPLANOPREV)                   AND        '+          //edilaine - SIG36752
           '        (nvl(H.VALORESPERADO,0)          <> nvl(H.VALORRECEBIDO,0))         AND        '+ 
           '        (H.MESREFERENCIA                 = '''+sMesRef+ ''')                AND        '+
           '        (H.MESCOBRANCA                   = '''+sMesCob+''')                 AND        '+
           '        (H.IDPESSOA                      = H.IDPESSOA)                      AND        '+          //edilaine - SIG36752
           '        (H.NUMRECEBIMENTO                = '+sNumRec+')                     AND        '+
           '        (HA.NUMRECEBIMENTO(+)            = H.NUMRECEBIMENTO)                           ';

   if IdParticipante > 0
   then sSQL := sSQL +' AND (H.IDPESSOA = '+IntToStr(idParticipante)+')';


   qryAtraso.Close;
   qryAtraso.SQL.Clear;
   qryAtraso.SQL.Add(sSQL);
   try
      qryAtraso.Open;

      if qryAtraso.IsEmpty
      then pdValorAlterador := 0
      else pdValorAlterador := qryAtraso.FieldByName('ALTERADOR').AsFloat;

   except
      exit;
   end;
   Result := True;
end;//PreparaQryJurosAtraso

procedure TfrmDivergContrib.bbtnVoltarClick(Sender: TObject);
begin
  inherited;
pgctrlDivergencias.visible := True;
pnlResult.visible := False;

end;

procedure TfrmDivergContrib.bbtnVerResultadoClick(Sender: TObject);
begin
  inherited;
pgctrlDivergencias.visible := False;
pnlResult.visible := True;
end;

procedure TfrmDivergContrib.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute
  then memResult.Lines.SaveToFile(savedlg.filename);
end;

procedure TfrmDivergContrib.ParmetrosPadro1Click(Sender: TObject);
begin
  inherited;
  If PedeConfirma Then Begin
    qryparam.close;
    qryparam.open;
    tb97Param.visible := True;
    tb97Param.Top := 56;
    tb97Param.Left := 120;
  //atualizar valor
 End;
end;

procedure TfrmDivergContrib.SpeedButton3Click(Sender: TObject);
begin
  inherited;
   RealEdit1.Text := qryparam.FieldByName('VLRACEITADIVERG').AsString;
end;

procedure TfrmDivergContrib.sbtnFluxOperClick(Sender: TObject);
begin
  inherited;
  dblkpcmbPatro.Text   := '' ; chkPatro.Checked   := False;
  dblkpcmbPlano.Text   := '' ; chkPlano.Checked   := False;
  dblkpcmbContrib.Text := '' ; chkContrib.Checked := False;
  cmbFiltraTempo.Text  := '' ; edTempo.Text := '';  chkTempo.Checked := False;
  cmbFiltraValor.Text  := '' ; edValor.Text := '';  chkValor.Checked := False;
  edParticipante.Text  := '' ; chkParticipante.Checked := False;

  //edilaine SIG100591 - inicio
  cmbSituacao.text     := '' ; chkSituacao.checked := false;

  lstIdContrib.clear;
  CriaLista(chklstContrib, qryFiltroContrib);
  //edilaine SIG100591 - fim

  //Everson Cunha - SIG79795 - Início
  chkMesRef.Checked := False;
  cmbFiltraMesRef.Text := '';
  edtMesRef.Text := '';
  //Everson Cunha - SIG79795 - Fim

  CbxTipoCobranca.Text := '' ;     ChkTipoCobranca.Checked := False;
  DbLkcFormaPagamento.Text := '' ; ChkFormaPagamento.Checked := False;

  //chkSitPartInterno.Checked := False;     //edilaine - SIG35577
  //dblkpcmbSitPartInterno.Text := '';      //edilaine - SIG35577

  lIdPessoa            := -1;
  lIdPessJur           := -1;
  lIdPlanoPrev         := -1;
  liSeqProposta        := -2;
end;

procedure TfrmDivergContrib.SpeedButton20Click(Sender: TObject);
begin
  inherited;
   
   If RealEdit1.Value = 0
    Then Begin
      MsgDlg('Valores zerados ou nulos não podem ser aceitos neste parâmetro. ','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
    End;
   

   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add(' UPDATE CONTPREV SET VLRACEITADIVERG = '+OraNumero(trim(RealEdit1.text))+' '+
                   ' WHERE IDPLANOPREV = '+qryparam.FieldByName('IDPLANOPREV').AsString+' '+
                   ' AND IDCONTRIBUICAO = '+qryparam.FieldByName('IDCONTRIBUICAO').AsString+' ');
   try
      qryaux.execsql;
   except
      raise
   end;

   qryparam.close;
   qryparam.open;
end;

procedure TfrmDivergContrib.qryparamBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if (dbgrdDivergSintet.visible) and ( not qryDivergSintet.isempty)  then
  begin
     qryparam.parambyname('IDCONT').AsString := qryDivergSintet.FieldByName('IDCONTRIBUICAO').AsString;
     qryparam.parambyname('IDPLANO').AsString := qryDivergSintet.FieldByName('IDPLANOPREV').AsString;
  end
  else if (dbgrdDivergAnalit.visible) and ( not qryDivergAnalit.isempty)  then
  begin
     qryparam.parambyname('IDCONT').AsString := qryDivergAnalit.FieldByName('IDCONTRIBUICAO').AsString;
     qryparam.parambyname('IDPLANO').AsString := qryDivergAnalit.FieldByName('IDPLANOPREV').AsString;
  end;
end;

procedure TfrmDivergContrib.qryparamAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RealEdit1.Text := qryparam.FieldByName('VLRACEITADIVERG').AsString;
  qryalteradorxcontrib.close;
  qryalteradorxcontrib.open;
end;

procedure TfrmDivergContrib.BitBtn1Click(Sender: TObject);
begin
  //inherited;
  tb97Param.visible := False;
end;

procedure TfrmDivergContrib.dbgrdDivergSintetMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var iModoSelecionado : integer;
begin
  inherited;
  if tb97Param.Visible then
  tb97Param.Visible := False;

  iModoSelecionado := ItemSelecionado;

  if (qryDivergSintet.isempty) or (iModoSelecionado in [0,5,8]) or (iModoSelecionado < 0) then
  begin
     dbgrdDivergSintet.PopupMenu := nil;
     dbgrdDivergSintet.ShowHint := False;
  end
  else
  begin
     ConsPart1.sIdPessoa := '';
     ConsPart1.sSeqProposta := '';
     ConsPart1.sIdPlanoprev := '';
     ConsPart1.DataBaseName := 'BaseDados';
     ConsPart1.sIdPessjur := '';
     DadosdoParticipante1.visible := False;
     DadosdoParticipante2.enabled := False;

     dbgrdDivergSintet.PopupMenu := nil;
     dbgrdDivergSintet.ShowHint := False;
  end;


  ParmetrosPadro2.enabled := ((not qryDivergSintet.isempty) or (not qryDivergAnalit.isempty));
  DadosdoParticipante2.enabled := ((not qryDivergAnalit.isempty) and (dbgrdDivergAnalit.visible));
  CobrarDiferenanoProximoMs1.enabled := (iModoSelecionado in [1,2,4,7]) and  ( (not qryDivergAnalit.isempty));
  CobrarDiferenaImediatamente1.enabled := (iModoSelecionado in [1,2,4,7]) and ( (not qryDivergAnalit.isempty));
  DescontarnoPrximoBenefcio2.enabled := (iModoSelecionado in [1,2,4,7]) and ( (not qryDivergAnalit.isempty));
  DevolverDiferenanoPrximoMs1.enabled := (iModoSelecionado in [3,6]) and  ( (not qryDivergAnalit.isempty));
  DevolverDiferenaImediatamente1.enabled := (iModoSelecionado in [3,6]) and ( (not qryDivergAnalit.isempty));
  AcrescentarnoPrximoBenefcio2.enabled := (iModoSelecionado in [3,6]) and ( (not qryDivergAnalit.isempty));;
  AdicionarDiferenacomoAporte1.enabled := (iModoSelecionado in [3,6]) and ( (not qryDivergAnalit.isempty));;
  IgnorarDiferena1.enabled := (iModoSelecionado in [1,2,3,4,7]) and ( (not qryDivergAnalit.isempty));;
  RegistrarInadimplncia2.enabled := (iModoSelecionado in [1,2,4,7]) and ( (not qryDivergAnalit.isempty));;

end;

function TfrmDivergContrib.BuscaOpcoes(sidsitplanoprev,snome,smatricula,splano,spatro: String;
                      iModo : integer ; dValorEsperado,dValorRecebido : Extended  ) : boolean;
var sCaso: String;
begin
   result := False;

  case imodo of
     1: sCaso := 'Cobrar diferença no próximo mês';
     2: sCaso := 'Cobrar Diferença Imediatamente';
     3: sCaso := 'Descontar no Próximo Benefício';
     4: sCaso := 'Devolver Diferença no Próximo Mês';
     5: sCaso := 'Devolver Diferença Imediatamente';
     6: sCaso := 'Acrescentar no Próximo Benefício';
     7: sCaso := 'Adicionar Diferença como Aporte';
     8: sCaso := 'Ignorar Diferença';
     9: sCaso := 'Tratar Divergência e não Devolver no momento';
    10: sCaso := 'Tratar Divergência e não Cobrar no momento';
  end;


  //testa situação
  if uppercase(sidsitplanoprev) = 'AT' then
  begin
     if imodo in [3,6] then
     begin
        memResult.Lines.Add('   [ERRO  ] '+smatricula+' - '+snome+#13+#10+
                            '            Não foi possível '+sCaso+' -> Situação na Fundação: Ativo. ');
         
        exit;
     end;
  end
  else   if (uppercase(sidsitplanoprev) = 'MA') And (cmbSituacao.ItemIndex <> 0 {ativo}) then
  begin
     if imodo in [1,3,4,6] then
     begin
        memResult.Lines.Add('   [ERRO  ] '+smatricula+' - '+snome+#13+#10+
                            '            Não foi possível '+sCaso+' -> Situação na Fundação: Mantido.');
         
        Exit;
     end;
  end
  else   if uppercase(sidsitplanoprev) = 'MP' then
  begin
     if imodo in [3,6] then
     begin
        memResult.Lines.Add('   [ERRO  ] '+smatricula+' - '+snome+#13+#10+
                            '            Não foi possível '+sCaso+' -> Situação na Fundação: Mantido Parcial.');
         
        exit;
     end;
  end
  else   if uppercase(sidsitplanoprev) = 'AS' then
  begin
     if imodo in [1,2,4] then
     begin
        memResult.Lines.Add('   [ERRO  ] '+smatricula+' - '+snome+#13+#10+
                            '            Não foi possível '+sCaso+' -> Situação na Fundação: Assistido.');
         
        exit;
     end;
  end;


  //testa valores(principalmente no caso de um tratamento bach  por contribuições
  //onde mesmo sabendo qual a diferença predominante , não se sabe previamente
  //se há outro tipo de divergência)
  if  dValorEsperado > dValorRecebido then
  begin
     if imodo in [4,5,6,7] then
     begin
        memResult.Lines.Add('   [ERRO  ] '+smatricula+' - '+snome+#13+#10+
                            '            Não foi possível '+sCaso+' -> Valor Recebido maior que valor Esperado.');
         
        exit;
     end;
  end
  else if dValorRecebido < dValorEsperado then
  begin
     if imodo in [1,2,3] then
     begin
        memResult.Lines.Add('   [ERRO  ] '+smatricula+' - '+snome+#13+#10+
                            '            Não foi possível '+sCaso+' -> Valor Esperado maior que valor Recebido.');
         
        exit;
     end;
  end;

  result := True;

end;

function TfrmDivergContrib.BuscaPodeCCP(qrybusca : twwquery ; snome,smatricula,splano,spatro: String;
                      iModo : integer  ) : boolean;
var sCaso: String;
begin
  result := False;

  case imodo of
     1: sCaso := 'Cobrar diferença no próximo mês';
     2: sCaso := 'Cobrar Diferença Imediatamente';
     3: sCaso := 'Descontar no Próximo Benefício';
     4: sCaso := 'Devolver Diferença no Próximo Mês';
     5: sCaso := 'Devolver Diferença Imediatamente';
     6: sCaso := 'Acrescentar no Próximo Benefício';
     7: sCaso := 'Adicionar Diferença como Aporte';
     8: sCaso := 'Ignorar Diferença';
     9: sCaso := 'Tratar Divergência e não Devolver no momento';
    10: sCaso := 'Tratar Divergência e não Cobrar no momento';
  end;

  // testa se for banco ou folha de benefícios
  // deve ter anteriormente o documento a ser alterado
  // no CAP/CAR
  // se não tiver não deixa
  if (qrybusca.FieldByName('CODDOCUMENTOPREV').AsString = '') then 
  begin
     if imodo in [2,5{6,3}] then
     begin
        memResult.Lines.Add('   [ERRO  ] '+smatricula+' - '+snome+#13+#10+
                            '            Não foi possível '+sCaso+' -> Esta contribuição foi descontada em folha '+#13+#10+
                            '            de pagamento, não existindo documentos a serem alterados no CAP/CAR.');
         
        exit;
     end;
  end;

  result := True;
end;

procedure TfrmDivergContrib.dbgrdDivergAnalitMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var iModoSelecionado : integer;
begin
  inherited;
  if tb97Param.Visible then
  tb97Param.Visible := False;

  iModoSelecionado := ItemSelecionado;

  if (qryDivergAnalit.isempty) or (iModoSelecionado in [0,5,8]) or (iModoSelecionado < 0) then
  begin
     dbgrdDivergAnalit.PopupMenu := nil;
     dbgrdDivergAnalit.ShowHint := False;
  end
  else
  begin
     dbgrdDivergAnalit.PopupMenu := pmnu;
     ConsPart1.sIdPessoa := qryDivergAnalit.FieldByName('IDPESSOA').AsString;
     ConsPart1.sSeqProposta := qryDivergAnalit.FieldByName('SEQPROPOSTA').AsString;
     ConsPart1.sIdPlanoprev := qryDivergAnalit.FieldByName('IDPLANOPREV').AsString;
     ConsPart1.DataBaseName := 'BaseDados';
     ConsPart1.sIdPessjur := qryDivergAnalit.FieldByName('IDPESSJUR').AsString;
     DadosdoParticipante1.visible := True;
     DadosdoParticipante2.enabled := False;
  end;

  ParmetrosPadro2.enabled := ((not qryDivergSintet.isempty) or (not qryDivergAnalit.isempty));
  DadosdoParticipante2.enabled := ((not qryDivergAnalit.isempty) and (dbgrdDivergAnalit.visible));
  CobrarDiferenanoProximoMs1.enabled := (iModoSelecionado in [1,2,4,7]) and  ( (not qryDivergAnalit.isempty));
  CobrarDiferenaImediatamente1.enabled := (iModoSelecionado in [1,2,4,7]) and ( (not qryDivergAnalit.isempty));
  DescontarnoPrximoBenefcio2.enabled := (iModoSelecionado in [1,2,4,7]) and ( (not qryDivergAnalit.isempty));
  DevolverDiferenanoPrximoMs1.enabled := (iModoSelecionado in [3,6]) and  ( (not qryDivergAnalit.isempty));
  DevolverDiferenaImediatamente1.enabled := (iModoSelecionado in [3,6]) and ( (not qryDivergAnalit.isempty));
  AcrescentarnoPrximoBenefcio2.enabled := (iModoSelecionado in [3,6]) and ( (not qryDivergAnalit.isempty));;
  AdicionarDiferenacomoAporte1.enabled := (iModoSelecionado in [3,6]) and ( (not qryDivergAnalit.isempty));;
  IgnorarDiferena1.enabled := (iModoSelecionado in [1,2,3,4,7]) and ( (not qryDivergAnalit.isempty));;
  RegistrarInadimplncia2.enabled := (iModoSelecionado in [1,2,4,7]) and ( (not qryDivergAnalit.isempty));;



end;

procedure TfrmDivergContrib.cmbMesRefChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible
  then tb97Param.Visible := False;


end;

procedure TfrmDivergContrib.spedAnoRefChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
  tb97Param.Visible := False;
end;

procedure TfrmDivergContrib.dblkpcmbPatroChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
  tb97Param.Visible := False;
end;

procedure TfrmDivergContrib.dblkpcmbPlanoChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
  tb97Param.Visible := False;
end;

procedure TfrmDivergContrib.dblkpcmbContribChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
  tb97Param.Visible := False;
end;

procedure TfrmDivergContrib.cmbFiltraTempoChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
  tb97Param.Visible := False;
end;

procedure TfrmDivergContrib.cmbFiltraValorChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
  tb97Param.Visible := False;
end;

function TfrmDivergContrib.TestaValorRegraCalculo(var Regra : TRegra): Boolean;
var dValor : Double;
    cAux : Char;
    i:Integer;
begin
   result := False;

   if regra.result = '' then exit;

   cAux := DecimalSeparator;

   i:=pos(',',regra.result);
   if i=0 then
   begin
      DecimalSeparator := '.';
      i:= pos('.',Regra.result);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   try
      dValor := strtofloat(regra.result);
   except
      exit;
   end;

   if dValor = 0 then
   begin
      result := True;
      exit;
   end;

   DecimalSeparator := cAux;

   result := True;
end;

procedure TfrmDivergContrib.pmnuCobraProxClick(Sender: TObject);
var bErro : Boolean;
    //inicio André Oliveira SOL 172728 KINTANA 1556309
    sAnoMesCobrancaTela,
    sDataRecInicial,
    sDataRecFinal,
    //fim André Oliveira SOL 172728 KINTANA 1556309

    sMesNovaCobranca      : string;
    mrResultado : TModalResult;
   iModoSelecionado : word; //André Oliveira SOL 172728 KINTANA 1556309
begin
	inherited;
    iModoSelecionado := ItemSelecionado;  //André Oliveira SOL 172728 KINTANA 1556309

  // Inversao do preenchimento da variavel iModo para poder utiliza-la dentro
  // da PedeConfirma
  iModo := 1;

  If Not PedeConfirma Then Exit;


  if prmIdMotivoDiverg <= 0
  then begin
     MsgDlg('Motivo para Tratamento de Divergência não preenchido.','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  bErro := False;
  bAlguma := False;
  //inicio André Oliveira SOL 172728 KINTANA 1556309
    sDataRecInicial := FormatDateTime('DD/MM/YYYY', cmdtDataReceInicial.Date);
    sDataRecFinal   := FormatDateTime('DD/MM/YYYY', cmdtDataReceFinal.date);

  // Preencher o mes de cobranca de acordo com a tela
  sAnoMesCobrancaTela := FormaAnoMesTela(cmbMesRef, spedAnoRef);

  // Preencher tela com o novo mes de cobranca - Default = proximo mes
  sMesNovaCobranca    := ProximoAnoMes(StrToInt(Copy(sAnoMesCobrancaTela,6,2)),
                                       StrToInt(Copy(sAnoMesCobrancaTela,1,4)));

    //fim André Oliveira SOL 172728 KINTANA 1556309
  frmDivergPedeNovoMesCob := TfrmDivergPedeNovoMesCob.Create(Self);

  try
     with frmDivergPedeNovoMesCob do
     begin
        Caption             := 'Informe o mês para cobrança da divergência ... ';
        //inicio André Oliveira SOL 172728 KINTANA 1556309
          
        if not (iModoSelecionado in  [0,1,2,3,4])then
        begin
            cmbMesCob.ItemIndex := StrToInt(Copy(sMesNovaCobranca,6,2)) - 1;
            cmbMesCob.Text      := cmbMesCob.Items[cmbMesCob.ItemIndex];
            spedAnoCob.Text     := Copy(sMesNovaCobranca,1,4);
        end
        else
            spedAnoCob.Text := '';
        //fim André Oliveira SOL 172728 KINTANA 1556309
        mrResultado := ShowModal;


        if (Trim(cmbMesCob.Text) = '') or (Trim(spedAnoCob.Text) = '') or (mrResultado <> mrOK)
        then begin
           MsgDlg('Novo mês de cobrança incompleto. Verifique.','Erro',mtError,[mbOk, mbHelp],0);
           //frmDivergPedeNovoMesCob.Free;
           Exit;
        end;

        // Preencher o mes de cobranca referente ao selecionado na tela
        sMesNovaCobranca := Trim(spedAnoCob.Text);
        if cmbMesCob.ItemIndex <= 8
        then sMesNovaCobranca  := sMesNovaCobranca+'/'+'0'+IntToStr(cmbMesCob.ItemIndex+1)
        else sMesNovaCobranca  := sMesNovaCobranca+'/'+    IntToStr(cmbMesCob.ItemIndex+1);
     end;
  finally
     frmDivergPedeNovoMesCob.Free;
  end;

  PreparaTransacao('Cobra Divergência no Próximo Mês...');


  if dbgrdDivergAnalit.visible
  then begin
     if not CobraProxMes(qryDivergAnalit,True, sMesNovaCobranca,'','','***','P','1','R',1) then bErro := True;
  end
  else begin
     if not CobraProxMes(qryDivergSintetAux,False,sMesNovaCobranca,'','','***','P','1','R',1) then bErro := True;
  end;
     
  if (iModoSelecionado in  [0,1,2,3,4])then
  begin
      if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
      then begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                   '-Meses Até '+sDataRecInicial+ ' - Op : Cobrar Via Interface no Mês '+sMesNovaCobranca+
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end
      else begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência - Período de '+sDataRecInicial+' a '+sDataRecFinal+
                                   ' - Op : Cobrar Via Interface no Mês '+sMesNovaCobranca+
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end;
  end
  else
  begin
       if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
       then begin
           if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                     '-Meses Até '+sAnoMesCobrancaTela+ ' - Op : Cobrar Via Interface no Mês '+sMesNovaCobranca+
                                     '-'+BuscaFiltrosLog)
           then bErro := True;
       end
       else begin
           if not GravaLogTOTALPREV ('Tratamento de Divergência - Mês '+sAnoMesCobrancaTela+
                                     ' - Op : Cobrar Via Interface no Mês '+sMesNovaCobranca+
                                     '-'+BuscaFiltrosLog)
           then bErro := True;
       end;
  end;

  TerminaTransacao('Cobrança da Diferença no Próximo Mês',bErro,False);

end;

procedure TfrmDivergContrib.PreparaTransacao(sTransacao : String);
begin
  if not  dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction ;

  bCancelaenvio := False;
  bbtnVerResultado.enabled := False;

  memresult.lines.clear;

  pnlProgresso.Visible := True;
  pnlFundo.enabled := False;
  pnlProgresso.Left := 194;
  pnlProgresso.Top :=  140;

  memResult.Lines.Add(''+sTransacao+' - Data:'+datetostr(date)+'');
  memResult.Lines.Add('_______________________________________________');


  pnlProgresso.Update;
  Application.ProcessMessages;
  frmDivergContrib.update;
  if bCancelaenvio then
  begin
     memResult.Lines.Add('***********************************');
     memResult.Lines.Add('Processo interrompido pelo usuário.');
     memResult.Lines.Add('***********************************');
     exit;
  end;

  pnlProgresso.BringToFront;
  btncancelaprogress.enabled := True;
  btncancelaprogress.setfocus;
end;

procedure TfrmDivergContrib.btncancelaprogressClick(Sender: TObject);
begin
  bcancelaenvio := True;
  pnlProgresso.Visible := False;
  pnlFundo.enabled := True;

  dtmBaseDados.dbBaseDados.RollBack;
  with qryAux do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT 1 FROM DUAL');
    Open;
    Close;
 end;

 Application.ProcessMessages;
 frmDivergContrib.update;
 inherited;

end;

procedure TfrmDivergContrib.TerminaTransacao(sTransacao : String ; bErro, bErroSerio : Boolean);
begin
  gagProgresso.Progress := gagProgresso.MaxValue;
  pnlProgresso.Update;
  pnlProgresso.Visible := False;
  pnlFundo.enabled := True;
  if not  balguma then bErro := False;
  if not  balguma then bErroserio := False;

  if not bcancelaenvio then
  begin
     if bErroserio then
     begin
        qrybusca.Close;
        qryatraso.close;
        qryalterador.close;
        qryAux.Close;
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg(''+sTransacao+' efetuado com erros. '+
               'Por ser um processo que deve ser executado sem erros,'+
               ' as operações processadas serão desfeitas.','Informação',mtInformation,[mbOk],0);
        bbtnVerResultado.enabled := True;
        pgctrlDivergencias.visible := False;
        pnlResult.visible := True;
        exit;
     end;
  end;


  if not  bcancelaenvio then
  begin
     if not(bErro)
     then begin
       qrybusca.Close;
       qryatraso.close;
       qryalterador.close;
       qryAux.Close;

       Try
         If Not Sistema.GravaLogOperacoes(Self.Caption+' - '+sTransacao) Then
           raise exception.Create('Erro ao gravar Log.')
       Except
       End;

       dtmBaseDados.dbBaseDados.Commit;
       if balguma then
       MsgDlg(''+sTransacao+' efetuado com sucesso.','Informação',mtInformation,[mbOk],0)
       else  MsgDlg('Nenhum processo foi efetuado.','Informação',mtInformation,[mbOk],0);

       //SIG50870 - início
       if bPossuiErroAcao then
       begin
         bbtnVerResultado.enabled := True;
         pgctrlDivergencias.visible := False;
         pnlResult.visible := True;
       end;
       //SIG50870 - fim
     end
     else begin
       qrybusca.Close;
       qryatraso.close;
       qryalterador.close;
       qryAux.Close;

       if MsgDlg(''+sTransacao+' efetuado com erros.Deseja efetivar ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
       then dtmBaseDados.dbBaseDados.RollBack
       else dtmBaseDados.dbBaseDados.Commit;

       bbtnVerResultado.enabled := True;
       pgctrlDivergencias.visible := False;
       pnlResult.visible := True;
     end;
  end;//bcancela

  if balguma then
  begin
     if dbgrdDivergAnalit.visible then
     begin
        qryDivergAnalit.close;
        qryDivergAnalit.open;
     end
     else
     begin
        qryDivergSintetAux.close;
        qryDivergSintetAux.open;
     end;
  end;//if


  with qryAux do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT 1 FROM DUAL');
    Open;
    Close;
  end;
end;

procedure TfrmDivergContrib.pmnuCobraImedClick(Sender: TObject);
var bErro         : boolean;
    sDataCobranca : string;
    iIdLote,
    iNumReg,
    iCodPortForma : longint;
    i             : integer;
    rTotalDiverg  : double;
    //inicio André Oliveira SOL 172728 KINTANA 1556309
    sAnoMesCobrancaTela,
    sDataRecInicial,
    sDataRecFinal,
    //fim André Oliveira SOL 172728 KINTANA 1556309

    // Renato Visoni SOL 130020 Kintana 717837
    sSQLwhere,sMsgPga : String;
    x : Integer;
    // Renato Visoni SOL 130020 Kintana 717837

   iModoSelecionado : word; //André Oliveira SOL 172728 KINTANA 1556309
   sFlgDevolucao: Char; //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678

    // William Santana SOL 205323 KIN
    emailteste, emailreal, sMesRef, sMesCob, sMatr: string;
    mForcereset : TmemoryStream;
    //END -  William Santana SOL 205323 KIN
    bTemDocPendente : Boolean; //TAES - SIG95604
    sCodigoDocumento, sNumeroRecebimento : String;  //TAES - SIG95604
    sSQL, sRecebimentos, sDocumentos, sUltimoProc : String; //TAES - SIG100430
begin
  inherited;
  // Inversao do preenchimento da variavel iModo para poder utiliza-la dentro
  // da PedeConfirma

  iModoSelecionado := ItemSelecionado;//André Oliveira SOL 172728 KINTANA 1556309
  // Renato Visoni SOL 130020 Kintana 717837
  ListaDocumentos := TStringList.Create;
  sSQLwhere       := '';
  sMsgPga         := '';
  x               := 0;
  // Renato Visoni SOL 130020 Kintana 717837
  
  iModo := 2;

  // Se o usuário tiver clicado na divergência sintética, obrigá-lo a visualizar
  // de forma analítica antes de fazer a devolução
  if not dbgrdDivergAnalit.Visible
  then begin
     MsgDlg('Selecione a opção "Divergência Analíticas" antes de escolher este tipo de tratamento de divergência.',
            'Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  If Not PedeConfirma Then Exit;
  //inicio André Oliveira SOL 172728 KINTANA 1556309
  sAnoMesCobrancaTela := FormaAnoMesTela(cmbMesRef, spedAnoRef);
  sDataRecInicial := FormatDateTime('DD/MM/YYYY', cmdtDataReceInicial.Date);
  sDataRecFinal   := FormatDateTime('DD/MM/YYYY', cmdtDataReceFinal.date);
  //fim André Oliveira SOL 172728 KINTANA 1556309


  bErro := False;
  bPossuiErroAcao := False; //SIG50870
  bProcessou      := False; //SIG50870

  if PedeDadosEnvioBanco( sDataCobranca, iCodPortForma, 'R')
  then begin


     If Not DataDeHoje(sDataCobranca) Then
     Begin
       MsgDlg('A data da cobrança deve ser, pelo menos, igual ou maior que a data atual.',
              'Erro',mtError,[mbOk, mbHelp],0);
       Exit;
     End;

     // Início - Michelle Mota - SIG23567
     // Se for documentos de contas a receber, não verifica o bloqueio
     if (qryDivergAnalit.fieldbyname('FLGDEVOLUCAO').AsInteger = 1) then begin //Michelle Mota - SIG23567
     If Not CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa,
                                       Sistema.IdUsuario,
                                       StrToDate(sDataCobranca)) Then
     Begin
       MsgDlg('A data da cobrança está bloqueada como disponibilidade financeira.',
              'Erro',mtError,[mbOk, mbHelp],0);
       Exit;
     End;
     end;// Término - Michelle Mota - SIG23567

     PreparaTransacao('Cobrar Divergência Imediatamente...');

     bAlguma := True;

     // Gerar lote
     iIdLote := GeraLOTE(qryDivergAnalit.FieldByName('IdPessJur').AsInteger,
                         True,
                         Copy(sDataCobranca,7,4)+'/'+Copy(sDataCobranca,4,2),
                         'R',
                         'Cobrança de Diverg. de Contribuição via CAR. ',
                         'A',
                         '1','1', '0', '0','0',
                         DateToStr(date), DateToStr(date), '','', '');
     rTotalDiverg := 0;
     iNumReg      := 0;

     sNumRecebEnviados := '';  


     
     sMesRef := qryDivergAnalit.FieldByName('MesReferencia').AsString;
     sIdPessoa := qryDivergAnalit.FieldByName('IdPessoa').AsString;

     rTotal := 0;

     iCodLancCAPCAR := 0;
     iPlnCodigo := 0;

      //William Santana  SOL 205323 KIN 1998345
      cdsAuxEmail.Close;
      cdsAuxEmail.CreateDataSet;
      cdsAuxEmail.EmptyDataSet;
      //William Santana  SOL 205323 KIN 1998345

     //TAES - SIG95604 - início
     memResult.Lines.Clear;
     qryDivergAnalit.DisableControls;
     bTemDocPendente := False;
     //TAES - SIG95604 - fim

     // Verificar se dois ou  mais participantes foram selecionados, ou se é para
     // tratar apenas o corrente.
     if dbgrdDivergAnalit.SelectedList.Count > 0
     then begin
        //TAES - SIG100430 - início
        //TAES - SIG95604 - início
        if(ListaDocsSelecionados.Count) > 0 then
        begin
          qryDivergAnalit.Filtered := False;
          qryDivergAnalit.Filter := 'SELECIONADO = 1';
          qryDivergAnalit.Filtered := True;
          qryDivergAnalit.First;

          sRecebimentos := EmptyStr;
          sDocumentos := EmptyStr;
          sUltimoProc := EmptyStr;

          for i := 0 to ListaDocsSelecionados.Count-1 do
          begin
            if(sRecebimentos = '') then
               sRecebimentos := sRecebimentos + ListaDocsSelecionados.Strings[i]
            else
               sRecebimentos := sRecebimentos + ',' + ListaDocsSelecionados.Strings[i];
          end;

          while not qryDivergAnalit.Eof do begin
            if(qryDivergAnalit.fieldByName('CODDOCUMENTOPREV').AsString) <> '' then
            begin
              if(sDocumentos = '') then
                 sDocumentos := sDocumentos + qryDivergAnalit.fieldByName('CODDOCUMENTOPREV').AsString
              else
                 sDocumentos := sDocumentos + ',' + qryDivergAnalit.fieldByName('CODDOCUMENTOPREV').AsString;
            end;

            qryDivergAnalit.Next;
          end;

          pnlValidacao.Visible := True;
          pnlValidacao.enabled := False;
          pnlValidacao.Left := 750;
          pnlValidacao.Top :=  450;

          pnlValidacao.Update;
          Application.ProcessMessages;
          frmDivergContrib.update;

          pnlValidacao.BringToFront;

          gagValidacao.Progress := 0;
          gagValidacao.MaxValue := qryDivergAnalit.RecordCount;

          sSQL := ' SELECT H.NUMRECEBIMENTO, H.CODDOCUMENTOPREV, D.MATRICULA FROM HSTCONTRIBPREV H, DEPENTIT D ';
          sSQL := sSQL + ' WHERE H.CODDOCUMENTOPREV IN (' + sDocumentos + ') AND H.IDPESSOA = D.IDPESSOA ';
          sSQL := sSQL + ' AND NUMRECEBIMENTO NOT IN (' + sRecebimentos + ')';

          qryDivergencias.Close;
          qryDivergencias.SQL.Clear;
          qryDivergencias.SQl.Add(sSQL);
          try
             qryDivergencias.Open;
          except
          end;

          qryDivergencias.First;
          qryDivergAnalit.First;

          while not qryDivergAnalit.Eof do begin

            qryDivergencias.First;

            while not qryDivergencias.Eof do begin
              if((qryDivergAnalit.fieldByName('CODDOCUMENTOPREV').AsString = qryDivergencias.fieldByName('CODDOCUMENTOPREV').AsString) AND (qryDivergAnalit.fieldByName('NUMRECEBIMENTO').AsString <> qryDivergencias.fieldByName('NUMRECEBIMENTO').AsString) AND (qryDivergencias.fieldByName('NUMRECEBIMENTO').AsString <> sUltimoProc)) then
              begin
                 memResult.Lines.Add(' [ALERTA] O numero de recebimento ' + qryDivergencias.fieldByName('NUMRECEBIMENTO').AsString +
                                    ' está vinculado ao documento ' + qryDivergencias.fieldByName('CODDOCUMENTOPREV').AsString + #13+#10 +
                                    ' que não foi selecionado para o tratamento. Matrícula: ' + qryDivergencias.fieldByName('MATRICULA').AsString);

                 bTemDocPendente := True;
                 sUltimoProc := qryDivergencias.fieldByName('NUMRECEBIMENTO').AsString;
              end;

              qryDivergencias.Next;
            end;
            qryDivergAnalit.Next;
          end;

          {while not qryDivergAnalit.Eof do begin
            for i := 0 to ListaDocsSelecionados.Count-1 do
            begin
              if(ListaDocsSelecionados.Strings[i] = qryDivergAnalit.fieldByName('CODDOCUMENTOPREV').AsString) then
              begin
                memResult.Lines.Add(' [ALERTA] O número de recebimento ' + qryDivergAnalit.fieldByName('NUMRECEBIMENTO').AsString +
                ' está vinculado ao documento ' + qryDivergAnalit.fieldByName('CODDOCUMENTOPREV').AsString + #13+#10 +
                'que não foi selecionado para o tratamento. Matrícula: ' + qryDivergAnalit.fieldByName('MATRICULA').AsString);

                bTemDocPendente := True;

                Break;
              end;
            end;

            gagValidacao.Progress := gagValidacao.Progress + 1;
            gagValidacao.Update;

            qryDivergAnalit.Next;
          end;}

          pnlValidacao.Visible := False;

          if (bTemDocPendente) then
          begin
            btncancelaprogressClick(Sender);
            MsgDlg('Existem registros pendentes vinculados aos mesmos documentos selecionados para tratamento. Verifique!','Atenção',mtWarning,[mbOk],0);
            bbtnVerResultadoClick(Sender);
            qryDivergAnalit.Filtered := False;
            qryDivergAnalit.EnableControls;
            bbtnVerResultado.Enabled := True;
            Exit;
          end;

          qryDivergAnalit.EnableControls;
          //TAES - SIG95604 - fim
        end;
        //TAES - SIG100430 - fim

        bVerificouGrupo :=  false;

        gagProgresso.Progress := 0;
        gagProgresso.MaxValue := dbgrdDivergAnalit.SelectedList.Count;

        qryDivergAnalit.Filtered := False;
        qryDivergAnalit.Filter := 'SELECIONADO = 1';
        qryDivergAnalit.Filtered := True;
        qryDivergAnalit.First;

        i := -1;
        while not qryDivergAnalit.Eof do begin
          i := i + 1;
        //for i:= 0 to dbgrdDivergAnalit.SelectedList.Count - 1 do
        //begin
           //dbgrdDivergAnalit.DataSource.DataSet.GotoBookmark(dbgrdDivergAnalit.SelectedList.items[i]);
           //William Santana  SOL 205323 KIN 1998345
           cdsAuxEmail.append;
           cdsAuxEmail.fieldByName('IDPESSOA').AsString      := qryDivergAnalit.fieldByName('IDPESSOA').AsString;
           cdsAuxEmail.fieldByName('IDPESSJUR').AsString     := qryDivergAnalit.fieldByName('IDPESSJUR').AsString;
           cdsAuxEmail.fieldByName('IDPLANOPREV').AsString   := qryDivergAnalit.fieldByName('IDPLANOPREV').AsString;
           cdsAuxEmail.fieldByName('MATRICULA').AsString     := qryDivergAnalit.fieldByName('MATRICULA').AsString;
           cdsAuxEmail.fieldByName('MESREFERENCIA').AsString := qryDivergAnalit.fieldByName('MESREFERENCIA').AsString;
           //Helio - SOL Nº 240582 PPM Nº 563271
           //cdsAuxEmail.fieldByName('MESCOBRANCA').AsString   := qryDivergAnalit.fieldByName('MESCOBRANCA').AsString;
           cdsAuxEmail.fieldByName('MESCOBRANCA').AsString   := copy(sDataCobranca, 7, 4) + '/' + copy(sDataCobranca, 4, 2);
           //FIM Helio - SOL Nº 240582 PPM Nº 563271
           cdsAuxEmail.fieldByName('NUMRECEBIMENTO').AsString := qryDivergAnalit.fieldByName('NUMRECEBIMENTO').AsString;
           cdsAuxEmail.fieldByName('IDMOTIVO').AsString       := qryDivergAnalit.fieldByName('IDMOTIVO').AsString;
           cdsAuxEmail.post;
           //END - William Santana  SOL 205323 KIN 1998345
           
           sIdContribuicao  := qryDivergAnalit.FieldByName('IdContribuicao').AsString;
           sFlgPagador      := qryDivergAnalit.FieldByName('FlgPagador').AsString;
           sflgSitFundacao  := qryDivergAnalit.FieldByName('flgSitFundacao').AsString;
           sIdPessjur       := qryDivergAnalit.FieldByName('IdPessjur').AsString;
           sIdPlanoPrev     := qryDivergAnalit.FieldByName('IdPlanoPrev').AsString;
           sCodPortForma    := qryDivergAnalit.FieldByName('codportforma').AsString;

           //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678
           //if not TrataDivergenciaBanco(CtrlDocumento,sDataCobranca, iCodPortForma,iIdLote, 'R', True)
           sFlgDevolucao := 'R';
           if (qryDivergAnalit.FieldByName('FLGDEVOLUCAO').AsInteger = 1) then begin
             sFlgDevolucao := 'P';
           end;

           //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678
           sIdPessoa := qryDivergAnalit.FieldByName('IDPESSOA').AsString;

           //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678
           rTotalDiverg := rTotalDiverg + ( qryDivergAnalit.FieldByName('ValorEsperado').AsFloat -
                                            qryDivergAnalit.FieldByName('ValorRecebido').AsFloat);

           rTotalDocumento := rTotalDiverg;

           if not TrataDivergenciaBanco(CtrlDocumento, sDataCobranca, iCodPortForma,iIdLote, sFlgDevolucao, (i = dbgrdDivergAnalit.SelectedList.Count -1))
           then begin
              if not(bPossuiAcaoErro) then bErro := True; //50870
              qryDivergAnalit.Next; // Felipe A. Santos SOL 228812 Kintana 2062778
              continue;
           end;
           //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678

           inc(iNumReg);
           gagProgresso.Progress := gagProgresso.Progress + 1;
           gagProgresso.Update;
           qryDivergAnalit.Next;
        end;//for
        qryDivergAnalit.Filtered := False;

     end
     else begin
        gagProgresso.Progress := 0;
        gagProgresso.MaxValue := 1;


        sIdContribuicao := qryDivergAnalit.FieldByName('IdContribuicao').AsString;
        sFlgPagador := qryDivergAnalit.FieldByName('FlgPagador').AsString;
        sflgSitFundacao := qryDivergAnalit.FieldByName('flgSitFundacao').AsString;
        sIdPessjur := qryDivergAnalit.FieldByName('IdPessjur').AsString;
        sIdPlanoPrev := qryDivergAnalit.FieldByName('IdPlanoPrev').AsString;
        sCodPortForma := qryDivergAnalit.FieldByName('codportforma').AsString;

        //William Santana  SOL 205323 KIN 1998345
        cdsAuxEmail.append;
        cdsAuxEmail.fieldByName('IDPESSOA').AsString      := qryDivergAnalit.fieldByName('IDPESSOA').AsString;
        cdsAuxEmail.fieldByName('IDPESSJUR').AsString     := qryDivergAnalit.fieldByName('IDPESSJUR').AsString;
        cdsAuxEmail.fieldByName('IDPLANOPREV').AsString   := qryDivergAnalit.fieldByName('IDPLANOPREV').AsString;
        cdsAuxEmail.fieldByName('MATRICULA').AsString     := qryDivergAnalit.fieldByName('MATRICULA').AsString;
        cdsAuxEmail.fieldByName('MESREFERENCIA').AsString := qryDivergAnalit.fieldByName('MESREFERENCIA').AsString;
        //Helio - SOL Nº 240582 PPM Nº 563271
        //cdsAuxEmail.fieldByName('MESCOBRANCA').AsString   := qryDivergAnalit.fieldByName('MESCOBRANCA').AsString;
        cdsAuxEmail.fieldByName('MESCOBRANCA').AsString   := copy(sDataCobranca, 7, 4) + '/' + copy(sDataCobranca, 4, 2);
        //FIM Helio - SOL Nº 240582 PPM Nº 563271
        cdsAuxEmail.fieldByName('NUMRECEBIMENTO').AsString := qryDivergAnalit.fieldByName('NUMRECEBIMENTO').AsString;
        cdsAuxEmail.fieldByName('IDMOTIVO').AsString       := qryDivergAnalit.fieldByName('IDMOTIVO').AsString;
        cdsAuxEmail.post;
        //William Santana  SOL 205323 KIN 1998345

        //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678
        //if not TrataDivergenciaBanco(CtrlDocumento,sDataCobranca, iCodPortForma,iIdLote, 'R', True)
        sFlgDevolucao := 'R';
        if (qryDivergAnalit.FieldByName('FLGDEVOLUCAO').AsInteger = 1) then begin
          sFlgDevolucao := 'P';
        end;

        //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678
        rTotalDiverg := rTotalDiverg + ( qryDivergAnalit.FieldByName('ValorEsperado').AsFloat -
                                         qryDivergAnalit.FieldByName('ValorRecebido').AsFloat);

        rTotalDocumento := rTotalDiverg;

        //TAES - SIG95604 - início
        sCodigoDocumento := qryDivergAnalit.fieldByName('CODDOCUMENTOPREV').AsString;

        if(sCodigoDocumento <> '') then
        begin
          sNumeroRecebimento := qryDivergAnalit.fieldByName('NUMRECEBIMENTO').AsString;

          //TAES - SIG100430 - início
          sSQL := ' SELECT H.NUMRECEBIMENTO, H.CODDOCUMENTOPREV, D.MATRICULA FROM HSTCONTRIBPREV H, DEPENTIT D ';
          sSQL := sSQL + ' WHERE H.CODDOCUMENTOPREV = ' + sCodigoDocumento + ' AND H.IDPESSOA = D.IDPESSOA '; //AND D.MATRICULA = ' + QuotedStr(qryDivergAnalit.fieldByName('MATRICULA').AsString) + ' ';
          //sSQL := sSQL + ' AND SITRECEBIMENTO = 1 ';

          qryDivergencias.Close;
          qryDivergencias.SQL.Clear;
          qryDivergencias.SQl.Add(sSQL);
          try
             qryDivergencias.Open;
          except
          end;

          qryDivergencias.First;

          while not qryDivergencias.Eof do begin
            if((sCodigoDocumento = qryDivergencias.fieldByName('CODDOCUMENTOPREV').AsString) AND (sNumeroRecebimento <> qryDivergencias.fieldByName('NUMRECEBIMENTO').AsString)) then
            begin
              memResult.Lines.Add(' [ALERTA] O numero de recebimento ' + qryDivergencias.fieldByName('NUMRECEBIMENTO').AsString +
              ' está vinculado ao documento ' + qryDivergencias.fieldByName('CODDOCUMENTOPREV').AsString + #13+#10 +
              'que não foi selecionado para o tratamento. Matrícula: ' + qryDivergencias.fieldByName('MATRICULA').AsString);

              bTemDocPendente := True;
            end;

            qryDivergencias.Next;
          end;
         //TAES - SIG100430 - fim

          if (bTemDocPendente) then
          begin
            btncancelaprogressClick(Sender);
            MsgDlg('Existem registros pendentes vinculados aos mesmos documentos selecionados para tratamento. Verifique!','Atenção',mtWarning,[mbOk],0);
            bbtnVerResultadoClick(Sender);
            qryDivergAnalit.EnableControls;
            qryDivergAnalit.First;
            bbtnVerResultado.Enabled := True;
            Exit;
          end;
        end;

        qryDivergAnalit.EnableControls;
        //TAES - SIG95604 - fim

        if not TrataDivergenciaBanco(CtrlDocumento,sDataCobranca, iCodPortForma,iIdLote, sFlgDevolucao, True)
        then begin
           bErro := True;
        end;
        //BRUNO AZEVEDO SOL 86498/11362 KINTANA 1813678

        inc(iNumReg);
        gagProgresso.Progress := gagProgresso.Progress + 1;  
        gagProgresso.Update;                                 
     end; //bindividual

     // Atualizar lote
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' UPDATE CTRLINTERFACE SET VLRTOTAL = '+OraNumero(FloatToStr(rTotalDiverg))+','+
                '                          NUMREG   = '+IntToStr(iNumReg)+
                ' WHERE  IDLOTE = '+IntToStr(iIdLote) );
     end;

     lblMsg2.Caption := 'Verificando Lançamentos ... ';
     pnlProgresso.Update;


     sNumRecebEnviados := Copy(sNumRecebEnviados,1,length(sNumRecebEnviados)-1);
     // Se foi feito algum envio para banco,
     // Agrupar documentos do participante por mes (1 boleta por mes)
     if Trim(sNumRecebEnviados) <> ''
     then begin
        lblMsg2.Caption := 'Agrupando Documentos ... ';
        pnlProgresso.Update;


        if not AgrupaBoletasBANCO(CtrlDocumento, qryAux, qryAux1, '', sNumRecebEnviados, 2)// SOL 148139 KINTANA 1040427
        then begin
           memResult.Lines.Add('   [ERRO  ] Erro ao agrupar as boletas. ');

           bErro := True;
        end;

     end;
     //inicio André Oliveira SOL 172728 KINTANA 1556309
     if(iModoSelecionado in [0,1,2,3,4])then
     begin
       if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
       then begin
          if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                    '-Meses Até '+sDataRecInicial+
                                    ' - Op : Cobrar Via Banco em '+sDataCobranca+
                                    '-'+BuscaFiltrosLog)
          then bErro := True;
       end
       else begin
          if not GravaLogTOTALPREV ('Tratamento de Divergência - Período de '+sDataRecInicial+' a '+sDataRecFinal+
                                    ' - Op : Cobrar Via Banco em '+sDataCobranca+
                                    '-'+BuscaFiltrosLog)
          then bErro := True;
       end;
     end
     else
     begin
          if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas 
          then begin
            if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                      '-Meses Até '+sAnoMesCobrancaTela+
                                      ' - Op : Cobrar Via Banco em '+sDataCobranca+
                                      '-'+BuscaFiltrosLog)
            then bErro := True;
          end
         else begin
            if not GravaLogTOTALPREV ('Tratamento de Divergência - Mês '+sAnoMesCobrancaTela+
                                      ' - Op : Cobrar Via Banco em '+sDataCobranca+
                                      '-'+BuscaFiltrosLog)
            then bErro := True;
         end;
     end;
     //fim André Oliveira SOL 172728 KINTANA 1556309

     if not(bProcessou) AND (bPossuiErroAcao) then bErro := True;

     TerminaTransacao('Cobrar Divergência Imediatamente',False, bErro);

  ////////TESTE PGA ////////
  //Renato Visoni SOL 130020 Kintana 717837
  for x := 0 to listaDocumentos.Count -1 do begin
    if sSQLwhere ='' then begin
      sSQLwhere := 'AND ((H.CODDOCUMENTOPREV = '+QuotedStr(listaDocumentos[x])+')';
    end else begin
      sSQLwhere := sSQLwhere + ' OR (H.CODDOCUMENTOPREV = '+QuotedStr(listaDocumentos[x])+')';
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
      sMsgPga := RealizaIntegracaoPGAIndiv('',CtrlDocumento,CtrlLancamento,'',sSQLwhere,'DIVERG');
      if sMsgPga = '' then begin
        memResult.Lines.Add(' - Integração com PGA realizada com sucesso - ')
      end else begin
        memResult.Lines.Add(sMsgPga);
      end;
    Except
       memResult.Lines.Add(' - Ocorreram problemas na Integração com PGA - ');
    end;



  end;
  //Renato Visoni SOL 130020 Kintana 717837

  // edilaine - SOL 253577-17744 / PPM 1063636 - comentado inicio
  {//William Santana SOL 205323 KIN 1998345
    if MsgDlg('Deseja enviar e-mail de cobrança para os participantes selecionados?','',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      mForceReset := TMemoryStream.Create;
      mForceReset.Clear;
      
      qryAux1.close;
      qryAux1.sql.clear;
      qryAux1.SQL.ADD('SELECT NAME, IDREPORTS, DESCRIPTION, TEMPLATE FROM CM.REPORTS ');
      qryAux1.SQL.ADD(' WHERE NAME = ''ModeloEmail'' AND IDREPORTS = 205323 ');
      qryAux1.open;

      if qryAux1.isEmpty then
        TppTEnvioEmail.Template.SaveToStream( mForceReset )
      else
      begin
        TBlobField( qryAux1.FieldByName( 'TEMPLATE' ) ).SaveToStream( mForceReset );
        TppTEnvioEmail.Template.LoadFromStream( mForceReset );
      end;

      if (ansiuppercase(Sistema.AliasServidor) <> 'PRODUCAO') then
      emailteste := inputbox('Teste SOL 205323','Coloque um e-mail para teste:','') ;

      if cdsAuxEmail.Active then
      begin
        cdsAuxEmail.First;

        sMatr   := cdsAuxEmail.fieldByName('MATRICULA').AsString;
        sMesRef := cdsAuxEmail.fieldByName('MESREFERENCIA').AsString;
        sMesCob := cdsAuxEmail.fieldByName('MESCOBRANCA').AsString;

        while not cdsAuxEmail.Eof  do
        begin
          qryAuxEmail.close;
          qryAuxEmail.sql.Clear;
          qryAuxEmail.sql.add(' SELECT HST.MESREFERENCIA, HST.MESCOBRANCA, HST.VALORESPERADO, HST.VALORRECEBIDO, ');
          qryAuxEmail.sql.add(' EL.MATRICULA,                                                                    ');
          qryAuxEmail.sql.add(' DECODE(HST.FLGDEVOLUCAO,0,SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0)),   ');
          qryAuxEmail.sql.add(' SUM(DECODE(TA.ACRESDECRES,''C'',NVL(HA.VALOR,0),''D'',NVL(-HA.VALOR,0),0)))AS SOMAALTERADORES,          ');
          qryAuxEmail.sql.add(' ABS(DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORESPERADO,0), NVL(-HST.VALORESPERADO,0) )+                   ');
          qryAuxEmail.sql.add(' SUM(DECODE(TA.ACRESDECRES,''C'',NVL(-HA.VALOR,0),''D'',NVL(HA.VALOR,0),0)))AS TOTALESPERADO , PE.EMAIL, ');
          qryAuxEmail.sql.add('  C.NOME AS NOMECONTRIB, PE.NOME AS NOMEPARTICIP                                                         ');
          qryAuxEmail.sql.add('  FROM   CONTRIBUICAO C,       CONTPREV CP, PATRO PT,  SITPART SP, ELEGPATRO EL, PARTPREVPLAN PP,        ');
          qryAuxEmail.sql.add(' CONTRIBPREVPARTP CPP, HSTCONTRIBPREV HST,   DOCUMENTO D, HSTATRASOCONTRIB HA, TIPOALTERADOR TA  , PESSOA PE  ');
          qryAuxEmail.sql.add('  WHERE (HST.IDPESSOA      =   ' + quotedstr(cdsAuxEmail.fieldByName('IDPESSOA').AsString )  +')              ');
          qryAuxEmail.sql.add(' AND    (HST.IDPESSJUR     =   ' + quotedstr(cdsAuxEmail.fieldByName('IDPESSJUR').AsString ) +')              ');
          qryAuxEmail.sql.add(' AND    (HST.IDPLANOPREV   =   ' + quotedstr(cdsAuxEmail.fieldByName('IDPLANOPREV').AsString) +')             ');
          qryAuxEmail.sql.add(' AND    (EL.MATRICULA      =   ' + quotedstr(sMatr  ) +')                                                     ');
          qryAuxEmail.sql.add(' AND    (HST.MESCOBRANCA   in (''' + sMesCob +'''))                                                           ');
          qryAuxEmail.sql.add(' AND    (HST.MESREFERENCIA in (''' + sMesRef +'''))                                                           ');
          qryAuxEmail.sql.add(' AND    ((HST.VALORRECEBIDO = 0 ) OR (HST.VALORRECEBIDO IS NULL))                                             ');
          qryAuxEmail.sql.add(' AND    ( HST.FLGDEVOLUCAO = 0 )                                                                              ');
          qryAuxEmail.sql.add(' AND    (HST.SITRECEBIMENTO = 1)                                                                              ');

          qryAuxEmail.sql.add(' AND    (HST.FLGDESCFOLHA = 0) AND (HST.IDPESSOA  = PE.IDPESSOA ) AND (HST.CODDOCUMENTOPREV = D.CODDOCUMENTO(+))');
          qryAuxEmail.sql.add(' AND    (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO)  AND    (CPP.IDPESSJUR      = HST.IDPESSJUR)                  ');
          qryAuxEmail.sql.add(' AND    (CPP.IDPLANOPREV    = HST.IDPLANOPREV)   AND    (CPP.IDPESSOA       = HST.IDPESSOA)                   ');
          qryAuxEmail.sql.add(' AND    (CPP.SEQPROPOSTA    = HST.SEQPROPOSTA)   AND    (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)             ');
          qryAuxEmail.sql.add(' AND    (PP.IDPESSJUR       = CPP.IDPESSJUR)     AND    (PP.IDPLANOPREV     = CPP.IDPLANOPREV)                ');
          qryAuxEmail.sql.add(' AND    (PP.IDPESSOA        = CPP.IDPESSOA)      AND    (PP.SEQPROPOSTA     = CPP.SEQPROPOSTA)                ');
          qryAuxEmail.sql.add(' AND    (PT.IDPESSOA        = PP.IDPESSJUR)      AND    (EL.IDPESSOA        = PP.IDPESSOA)                    ');
          qryAuxEmail.sql.add(' AND    (EL.IDPESSJUR       = PP.IDPESSJUR)      AND    (CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO)             ');
          qryAuxEmail.sql.add(' AND    (CP.IDPLANOPREV     = CPP.IDPLANOPREV)   AND    (C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO)              ');
          qryAuxEmail.sql.add(' AND    (PP.IDSITPART       = SP.IDSITPART)      AND    (HA.NUMRECEBIMENTO(+) = HST.NUMRECEBIMENTO)           ');
          qryAuxEmail.sql.add(' AND    (HA.MESCOBRANCA(+)    = HST.MESCOBRANCA) AND    (HA.MESREFERENCIA(+)  = HST.MESREFERENCIA)            ');
          qryAuxEmail.sql.add(' AND    (HA.IDMOTIVO(+)       = HST.IDMOTIVO)    AND    (HA.CODALTERADOR      = TA.CODALTERADOR(+))           ');
          qryAuxEmail.sql.add('  AND  ROWNUM < 3                                                                                             ');
          qryAuxEmail.sql.add('GROUP BY D.NODOCUMENTO,        D.NOSSONUMERO,          C.NOMERESUM,                                           ');
          qryAuxEmail.sql.add('        C.NOME,               HST.MESREFERENCIA,      HST.MESCOBRANCA,                                        ');
          qryAuxEmail.sql.add('        HST.DATAPREVISAORECE,                                                                                 ');
          qryAuxEmail.sql.add('       HST.VALORESPERADO,    HST.VALORRECEBIDO,      HST.SITRECEBIMENTO,                                      ');
          qryAuxEmail.sql.add('        HST.IDLOTE,           HST.NUMRECEBIMENTO,     HST.FLGDEVOLUCAO,                                       ');
          qryAuxEmail.sql.add('        HST.IDMOTIVO,         HST.DATARECEBIMENTO,                                                            ');
          qryAuxEmail.sql.add('        HST.VALOROP1,                                                                                         ');
          qryAuxEmail.sql.add('        HST.VALOROP2,         HST.VALOROP3,           HST.CODDOCUMENTOPREV,                                   ');
          qryAuxEmail.sql.add('        HST.VALORCALCULADO,   HST.FLGDESCFOLHA,                                                               ');
          qryAuxEmail.sql.add('        HST.IDCONTRIBUICAO,   HST.IDPESSJUR,          HST.IDPLANOPREV,                                        ');
          qryAuxEmail.sql.add('        HST.IDPESSOA,         HST.SEQPROPOSTA,        HST.DATAINICIO,                                         ');
          qryAuxEmail.sql.add('        HST.DATAFINAL,        HST.FLGSITFUNDACAO,     HST.FLGEVENTO,                                          ');
          qryAuxEmail.sql.add('        HST.DATACANCELAMENTO, HST.DATAEMISSCOB,       HST.FLGCALCRESERVA,                                     ');
          qryAuxEmail.sql.add('        HST.PARCELA,                                                                                          ');
          qryAuxEmail.sql.add('        EL.MATRICULA,         CP.FLGPAGADOR,                                                                  ');
          qryAuxEmail.sql.add('        CP.CODCENTROCUSTOC,   CP.CODCENTROCUSTOD,     PP.INSCRICAONUMERO,                                     ');
          qryAuxEmail.sql.add('        CPP.FLGDESCFOLHA,     CPP.DIAVENCIMENTO,      CP.CODTIPRECDES,                                        ');
          qryAuxEmail.sql.add('        CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONTAD,                                          ');
          qryAuxEmail.sql.add('        CP.CODSUBCONTA ,        CP.CODCENTRORESPON,                                                           ');
          qryAuxEmail.sql.add('        PP.SALMANTIDO,        CP.UNIDNEGOC,                                                                   ');
          qryAuxEmail.sql.add('        CPP.IDEMPRESA,        CPP.PLANO,              CPP.DATAINICIO,                                         ');
          qryAuxEmail.sql.add('        CPP.TIPCODIGO,        CPP.CODTIPDOC,                                                                  ');
          qryAuxEmail.sql.add('        HST.CODPORTFORMA,     CPP.CODPORTFORMA,                                                               ');
          qryAuxEmail.sql.add('        CPP.PLANO13,          CPP.PLACONTAC13,        CPP.PLACONTAD13,                                        ');
          qryAuxEmail.sql.add('       CPP.CODCENTROCUSTOC13,CPP.IDEMPRESA13,        CPP.CODCENTROCUSTOD13,                                   ');
          qryAuxEmail.sql.add('        CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13,                                  ');
          qryAuxEmail.sql.add('        CPP.CODSUBCONTA13,    CPP.RECPAG13,           CPP.CODTIPRECDES13,                                     ');
          qryAuxEmail.sql.add('        CPP.TIPCODIGO13,      CPP.CODTIPDOC13,        CPP.CODPORTFORMA13,                                     ');
          qryAuxEmail.sql.add('        CPP.IDPLANPREVCONTAB, CPP.PLACONTADBANCO,     CPP.PLACONTADBANCO13,                                   ');
          qryAuxEmail.sql.add('       CPP.CODTIPDESEMBDEVOL, CPP.CODCCUSTODEVOL, CPP.PLACONTADEVOL,                                          ');
          qryAuxEmail.sql.add('        PP.SALMANTIDO,        HST.FLGDEVOLUCAO,       CPP.DATAINICIO,                                         ');
          qryAuxEmail.sql.add('        HST.FLGDEVOLUCAO,     HST.SITRECEBIMENTO,                                                             ');
          qryAuxEmail.sql.add('        CP.IDREGRACALCULO,    SP.FLGINTERNO , NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR),                          ');
          qryAuxEmail.sql.add('        D.RECPAG,HST.valorbase1, PE.EMAIL, C.NOME , PE.NOME                                                   ');
          qryAuxEmail.sql.add('  ORDER BY  HST.MESREFERENCIA DESC                                                                            ');
          qryAuxEmail.open;

          if not (qryAuxEmail.isempty) then
          begin
           pmpar2.lines.text := stringreplace((pmpar2.lines.text),'<DATA>',sDataCobranca,[rfReplaceAll]);

           emailreal := qryAuxEmail.fieldByName('Email').AsString;

           cdsAuxEmail.next;

           //Se houver mais de um registro selecionado ocm mesma matricula, só envia um e-mail.
           if (sMatr = cdsAuxEmail.fieldByName('MATRICULA').AsString) and not(cdsAuxEmail.eof) then
            begin
             sMatr   := cdsAuxEmail.fieldByName('MATRICULA').AsString;
             sMesRef := (sMesRef) + quotedstr(',') + (cdsAuxEmail.fieldByName('MESREFERENCIA').AsString);
             sMesCob := (sMesCob) + quotedstr(',') + (cdsAuxEmail.fieldByName('MESCOBRANCA').AsString);
            end
           else
           begin

            sMatr   := cdsAuxEmail.fieldByName('MATRICULA').AsString;
            sMesRef := cdsAuxEmail.fieldByName('MESREFERENCIA').AsString;
            sMesCob := cdsAuxEmail.fieldByName('MESCOBRANCA').AsString;

            //Helio - SOL Nº 240582 PPM Nº 563271
            if Trim(ObtemEmailTrataDivergencia) <> '' then
            begin
            //FIM Helio - SOL Nº 240582 PPM Nº 563271
              if (ansiuppercase(Sistema.AliasServidor) <> 'PRODUCAO') then
               EnviarEmailParticipantes(emailteste)
              else
               EnviarEmailParticipantes(emailreal);
            //Helio - SOL Nº 240582 PPM Nº 563271
            end else
               MsgDlg('Caixa de Saída do e-mail não parametrizada. Favor verificar.', Sistema.NomeModulo, mtWarning, [mbOk], 0);
            //FIM Helio - SOL Nº 240582 PPM Nº 563271

           end;

          end
          else
           cdsAuxEmail.next;

           TppTEnvioEmail.Template.LoadFromStream( mForceReset );
        end;

        cdsAuxEmail.Close;
      end;
     mForceReset.Clear;
    end ;
  //END - William Santana SOL 205323 KIN 1998345
  } // edilaine - SOL 253577-17744 / PPM 1063636 - comentado fim

  listaDocumentos.Destroy;

  end;
end;

procedure TfrmDivergContrib.DescontarnoPrximoBenefcio1Click(
  Sender: TObject);
var bErro : boolean;
    //inicio André Oliveira SOL 172728 KINTANA 1556309
    sAnoMesCobrancaTela,
    sDataRecInicial,
    sDataRecFinal,
    //fim André Oliveira SOL 172728 KINTANA 1556309
    sMesNovaCobranca : string;
        mrResultado : TModalResult;

    iModoSelecionado : word;     //André Oliveira SOL 172728 KINTANA 1556309
    sFlgDevolucao : char;        // edilaine - SIG35577
begin

  inherited;
    iModoSelecionado := ItemSelecionado;   //André Oliveira SOL 172728 KINTANA 1556309
  // Inversao do preenchimento da variavel iModo para poder utiliza-la dentro
  // da PedeConfirma
  iModo := 3;

  If Not PedeConfirma Then Exit;

  bErro := False;
  bPossuiErroAcao := False; //SIG50870
  bProcessou      := False; //SIG50870

  //inicio André Oliveira SOL 172728 KINTANA 1556309
    sDataRecInicial := FormatDateTime('DD/MM/YYYY', cmdtDataReceInicial.Date);
    sDataRecFinal   := FormatDateTime('DD/MM/YYYY', cmdtDataReceFinal.date);

  // Preencher o mes de cobranca de acordo com a tela
  sAnoMesCobrancaTela := FormaAnoMesTela(cmbMesRef, spedAnoRef);

  // Preencher tela com o novo mes de cobranca - Default = proximo mes
  sMesNovaCobranca    := ProximoAnoMes(StrToInt(Copy(sAnoMesCobrancaTela,6,2)),
                                       StrToInt(Copy(sAnoMesCobrancaTela,1,4)));
    //fim André Oliveira SOL 172728 KINTANA 1556309


  // edilaine - SIG35577: inicio
  rDadosLote.iIdLoteSelecionado := SelecionaLoteNormal(sMesNovaCobranca,
                                                       rDadosLote.sDataPagamento );
  if rDadosLote.iIdLoteSelecionado <= 0
  then begin
     bErro := True;
     MsgDlg('Nenhum lote selecinado. Verifique. ','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;
  rDadosLote.sMesCobranca := sMesNovaCobranca;
  // edilaine - SIG35577: fim

  // edilaine - SIG35577 - inicio comentario
  {frmDivergPedeNovoMesCob := TfrmDivergPedeNovoMesCob.Create(Self);

  try
     with frmDivergPedeNovoMesCob do
     begin
        Caption             := 'Informe o mês para cobrança da divergência ... ';
        //inicio André Oliveira SOL 172728 KINTANA 1556309
        if not (iModoSelecionado in  [0,1,2,3,4])then
        begin
          cmbMesCob.ItemIndex := StrToInt(Copy(sMesNovaCobranca,6,2)) - 1;
          cmbMesCob.Text      := cmbMesCob.Items[cmbMesCob.ItemIndex];
          spedAnoCob.Text     := Copy(sMesNovaCobranca,1,4);
        end
        else
            spedAnoCob.Text := '';
        //fim André Oliveira SOL 172728 KINTANA 1556309

         mrResultado := ShowModal;


        if (Trim(cmbMesCob.Text) = '') or (Trim(spedAnoCob.Text) = '') or (mrResultado <> mrOK)
        then begin
           MsgDlg('Novo mês de cobrança incompleto. Verifique.','Erro',mtError,[mbOk, mbHelp],0);
           //frmDivergPedeNovoMesCob.Free;
           Exit;
        end;

        // Preencher o mes de cobranca referente ao selecionado na tela
        sMesNovaCobranca := Trim(spedAnoCob.Text);
        if cmbMesCob.ItemIndex <= 8
        then sMesNovaCobranca  := sMesNovaCobranca+'/'+'0'+IntToStr(cmbMesCob.ItemIndex+1)
        else sMesNovaCobranca  := sMesNovaCobranca+'/'+    IntToStr(cmbMesCob.ItemIndex+1);
     end;
  finally
     frmDivergPedeNovoMesCob.Free;
  end;
  } // edilaine - SIG35577 - fim comentario

  PreparaTransacao('Cobra Divergência no próximo Benefício...');    

  // edilaine - SIG35577 - inicio
  if dbgrdDivergAnalit.visible then
     sFlgDevolucao := iif(qryDivergAnalit.FieldByName('FLGDEVOLUCAO').AsInteger = 1, 'P', 'R')
  else
     sFlgDevolucao := iif(qryDivergSintetAux.FieldByName('FLGDEVOLUCAO').AsInteger = 1, 'P', 'R');
  // edilaine - SIG35577 - fim

  if dbgrdDivergAnalit.visible then
  begin
     if not CobraProxMes(qryDivergAnalit,True,sMesNovaCobranca,'','','','B','1',sFlgDevolucao {'R'},3) then bErro := True;        // edilaine - SIG35577
  end
  else
  begin
     if not CobraProxMes(qryDivergSintetAux,False,sMesNovaCobranca,'','','','B','1',sFlgDevolucao {'R'},3) then bErro := True;    // edilaine - SIG35577
  end;
  if  (iModoSelecionado in  [0,1,2,3,4])then
  begin
      if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
      then begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                   '-Meses Até '+sDataRecInicial+ ' - Op : Cobrar na Folha de Benefício do Mês '+sMesNovaCobranca+
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end
      else begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência - Período de '+sDataRecInicial+' a '+sDataRecFinal+
                                   ' - Op : Cobrar na Folha de Benefício do Mês '+sMesNovaCobranca+
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end;
  end
  else
  begin
      if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
      then begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                   '-Meses Até '+sAnoMesCobrancaTela+ ' - Op : Cobrar na Folha de Benefício do Mês '+sMesNovaCobranca+
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end
      else begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência - Mês '+sAnoMesCobrancaTela+
                                   ' - Op : Cobrar na Folha de Benefício do Mês '+sMesNovaCobranca+
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end;
  end;

  TerminaTransacao('Cobra Divergência no próximo Benefício',bErro,False);

end;

procedure TfrmDivergContrib.pmnuDevolveProxClick(Sender: TObject);
var bErro : boolean;
    mrResultado : TModalResult;

    //inicio André Oliveira SOL 172728 KINTANA 1556309
    sAnoMesCobrancaTela,
    sDataRecInicial,
    sDataRecFinal,
    //fim André Oliveira SOL 172728 KINTANA 1556309
    sMesNovaCobranca : string;
    iModoSelecionado : word;     //André Oliveira SOL 172728 KINTANA 1556309
begin
    inherited;
    iModoSelecionado := ItemSelecionado; // André Oliveira SOL 172728 KINTANA 1556309
  // Inversao do preenchimento da variavel iModo para poder utiliza-la dentro
  // da PedeConfirma
  iModo := 4;

  If Not PedeConfirma Then Exit;


  bErro := False;

 //inicio André Oliveira SOL 172728 KINTANA 1556309
    sDataRecInicial := FormatDateTime('DD/MM/YYYY', cmdtDataReceInicial.Date);
    sDataRecFinal   := FormatDateTime('DD/MM/YYYY', cmdtDataReceFinal.date);

  // Preencher o mes de cobranca de acordo com a tela
  sAnoMesCobrancaTela := FormaAnoMesTela(cmbMesRef, spedAnoRef);

  // Preencher tela com o novo mes de cobranca - Default = proximo mes
  sMesNovaCobranca    := ProximoAnoMes(StrToInt(Copy(sAnoMesCobrancaTela,6,2)),
                                       StrToInt(Copy(sAnoMesCobrancaTela,1,4)));

    //fim André Oliveira SOL 172728 KINTANA 1556309

  frmDivergPedeNovoMesCob := TfrmDivergPedeNovoMesCob.Create(Self);

  try
     with frmDivergPedeNovoMesCob do
     begin
        Caption             := 'Informe o mês para devolução da divergência ... ';
        //inicio André Oliveira SOL 172728 KINTANA 1556309
        if not (iModoSelecionado in  [0,1,2,3,4])then
        begin
          cmbMesCob.ItemIndex := StrToInt(Copy(sMesNovaCobranca,6,2)) - 1;
          cmbMesCob.Text      := cmbMesCob.Items[cmbMesCob.ItemIndex];
          spedAnoCob.Text     := Copy(sMesNovaCobranca,1,4);
        end
        else
            spedAnoCob.Text := '';
        //fim André Oliveira SOL 172728 KINTANA 1556309

         mrResultado := ShowModal;


        if (Trim(cmbMesCob.Text) = '') or (Trim(spedAnoCob.Text) = '') or (mrResultado <> mrOK)
        then begin
           MsgDlg('Mês de devolução incompleto. Verifique.','Erro',mtError,[mbOk, mbHelp],0);
           //frmDivergPedeNovoMesCob.Free;
           Exit;
        end;

        // Preencher o mes de cobranca referente ao selecionado na tela
        sMesNovaCobranca := Trim(spedAnoCob.Text);
        if cmbMesCob.ItemIndex <= 8
        then sMesNovaCobranca  := sMesNovaCobranca+'/'+'0'+IntToStr(cmbMesCob.ItemIndex+1)
        else sMesNovaCobranca  := sMesNovaCobranca+'/'+    IntToStr(cmbMesCob.ItemIndex+1);
     end;
  finally
     frmDivergPedeNovoMesCob.Free;
  end;

  PreparaTransacao('Devolve Divergência no próximo mês...');

  if dbgrdDivergAnalit.visible
  then begin
     if not CobraProxMes(qryDivergAnalit,True,sMesNovaCobranca,'','','***','P','1','P',4) then bErro := True;
  end
  else begin
     if not CobraProxMes(qryDivergSintetAux,False,sMesNovaCobranca,'','','***','P','1','P',4) then bErro := True;
  end;
  //inicio André Oliveira SOL 172728 KINTANA 1556309
  if  (iModoSelecionado in  [0,1,2,3,4])then
  begin
      if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
      then begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                   '-Meses Até '+sDataRecInicial+  ' - Op : Devolver via Interface no Mês '+sMesNovaCobranca+
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end
      else begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência - Período de '+sDataRecInicial+' a '+sDataRecFinal+
                                   ' - Op : Devolver via Interface no Mês '+sMesNovaCobranca+
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end;
  end
  else
  begin
     if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
     then begin
       if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                 '-Meses Até '+sAnoMesCobrancaTela+ ' - Op : Cobrar na Folha de Benefício do Mês '+sMesNovaCobranca+
                                 '-'+BuscaFiltrosLog)
       then bErro := True;
     end
     else begin
       if not GravaLogTOTALPREV ('Tratamento de Divergência - Mês '+sAnoMesCobrancaTela+
                                 ' - Op : Cobrar na Folha de Benefício do Mês '+sMesNovaCobranca+
                                 '-'+BuscaFiltrosLog)
       then bErro := True;
     end;
  end;
  //fim André Oliveira SOL 172728 KINTANA 1556309

  TerminaTransacao('Devolve Divergência no próximo mês',bErro,False);

end;

procedure TfrmDivergContrib.pmnuDevolveImedClick(Sender: TObject);
var bErro         : boolean;
    sDataCobranca : string;
    iIdLote,
    iNumReg,
    iCodPortForma : longint;
    i             : integer;
    rTotalDiverg  : double;
    //inicio André Oliveira SOL 172728 KINTANA 1556309
    sAnoMesCobrancaTela,
    sDataRecInicial,
    sDataRecFinal
    //fim André Oliveira SOL 172728 KINTANA 1556309
    : string;
    // Renato Visoni SOL 130020 Kintana 717837
    sSQLwhere,sMsgPga : String;
    x : Integer;
    // Renato Visoni SOL 130020 Kintana 717837

    iModoSelecionado : word;//André Oliveira SOL 172728 KINTANA 1556309
begin
	inherited;
    iModoSelecionado := ItemSelecionado; //André Oliveira SOL 172728 KINTANA 1556309

  // Inversao do preenchimento da variavel iModo para poder utiliza-la dentro
  // da PedeConfirma

  // Renato Visoni SOL 130020 Kintana 717837
  ListaDocumentos := TStringList.Create;
  sSQLwhere       := '';
  sMsgPga         := '';
  x               := 0;
  // Renato Visoni SOL 130020 Kintana 717837

  iModo := 5;

  If Not PedeConfirma Then Exit;

   //inicio André Oliveira SOL 172728 KINTANA 1556309
    sDataRecInicial := FormatDateTime('DD/MM/YYYY', cmdtDataReceInicial.Date);
    sDataRecFinal   := FormatDateTime('DD/MM/YYYY', cmdtDataReceFinal.date);
   sAnoMesCobrancaTela := FormaAnoMesTela(cmbMesRef, spedAnoRef);
   //fim André Oliveira SOL 172728 KINTANA 1556309
  // Se o usuário tiver clicado na divergência sintética, obrigá-lo a visualizar
  // de forma analítica antes de fazer a devolução
  if not dbgrdDivergAnalit.Visible
  then begin
     MsgDlg('Selecione a opção "Divergência Analíticas" antes de escolher este tipo de tratamento de divergência.',
            'Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  bErro := False;

  if PedeDadosEnvioBanco( sDataCobranca, iCodPortForma, 'P')
  then begin
     PreparaTransacao('Devolver Divergência Imediatamente...');

     bAlguma := True;

     // Gerar lote
     iIdLote := GeraLOTE(qryDivergAnalit.FieldByName('IdPessJur').AsInteger,
                         True,
                         Copy(sDataCobranca,7,4)+'/'+Copy(sDataCobranca,4,2),
                         'P',
                         'Devolução de Diverg. de Contribuição via CAP. ',
                         'D',
                         '1','1', '0', '0','0',
                         DateToStr(date), DateToStr(date), '','', '');
     rTotalDiverg := 0;
     iNumReg      := 0;


     
     sMesRef := qryDivergAnalit.FieldByName('MesReferencia').AsString;
     sIdPessoa := qryDivergAnalit.FieldByName('IdPessoa').AsString;


     rTotal := 0;

     iCodLancCAPCAR := 0;
     iPlnCodigo := 0;
     


     // Verificar se dois ou  mais participantes foram selecionados, ou se é para
     // tratar apenas o corrente.
     if dbgrdDivergAnalit.SelectedList.Count > 0
     then begin
        bVerificouGrupo :=  false;

         
        gagProgresso.Progress := 0;
        gagProgresso.MaxValue := dbgrdDivergAnalit.SelectedList.Count;

        for i:= 0 to dbgrdDivergAnalit.SelectedList.Count - 1 do
        begin
           dbgrdDivergAnalit.DataSource.DataSet.GotoBookmark(dbgrdDivergAnalit.SelectedList.items[i]);

           
           sIdContribuicao := qryDivergAnalit.FieldByName('IdContribuicao').AsString;
           sFlgPagador := qryDivergAnalit.FieldByName('FlgPagador').AsString;
           sflgSitFundacao := qryDivergAnalit.FieldByName('flgSitFundacao').AsString;
           sIdPessjur := qryDivergAnalit.FieldByName('IdPessjur').AsString;
           sIdPlanoPrev := qryDivergAnalit.FieldByName('IdPlanoPrev').AsString;
           sCodPortForma := qryDivergAnalit.FieldByName('codportforma').AsString;

           if not TrataDivergenciaBanco(CtrlDocumento, sDataCobranca, iCodPortForma,iIdLote, 'P', (i = dbgrdDivergAnalit.SelectedList.Count -1) )
           then begin
              bErro := True;
              continue;
           end;
           rTotalDiverg := rTotalDiverg + ( qryDivergAnalit.FieldByName('ValorRecebido').AsFloat -
                                                 qryDivergAnalit.FieldByName('ValorEsperado').AsFloat);
           inc(iNumReg);
           gagProgresso.Progress := gagProgresso.Progress + 1;
           gagProgresso.Update;
        end;//for
     end
     else begin
         
        gagProgresso.Progress := 0;
        gagProgresso.MaxValue := 1;

        
        sIdContribuicao := qryDivergAnalit.FieldByName('IdContribuicao').AsString;
        sFlgPagador     := qryDivergAnalit.FieldByName('FlgPagador').AsString;
        sflgSitFundacao := qryDivergAnalit.FieldByName('flgSitFundacao').AsString;
        sIdPessjur      := qryDivergAnalit.FieldByName('IdPessjur').AsString;
        sIdPlanoPrev    := qryDivergAnalit.FieldByName('IdPlanoPrev').AsString;
        sCodPortForma   := qryDivergAnalit.FieldByName('codportforma').AsString;

        if not TrataDivergenciaBanco(CtrlDocumento,sDataCobranca, iCodPortForma,iIdLote, 'P', True)
        then begin
           bErro := True;
        end;
        rTotalDiverg := rTotalDiverg + ( qryDivergAnalit.FieldByName('ValorRecebido').AsFloat -
                                         qryDivergAnalit.FieldByName('ValorEsperado').AsFloat);
        inc(iNumReg);
        gagProgresso.Progress := gagProgresso.Progress + 1;  
        gagProgresso.Update;

     end; //bindividual

     // Atualizar lote
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' UPDATE CTRLINTERFACE SET VLRTOTAL = '+OraNumero(FloatToStr(rTotalDiverg))+','+
                '                          NUMREG   = '+IntToStr(iNumReg)+
                ' WHERE  IDLOTE = '+IntToStr(iIdLote) );
     end;
     //inicio André Oliveira SOL 172728 KINTANA 1556309
     if  (iModoSelecionado in  [0,1,2,3,4])then
     begin

         if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
         then begin
            if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                      '-Meses Até '+sDataRecInicial+ ' - Op : Devolver via Banco em '+sDataCobranca+
                                      '-'+BuscaFiltrosLog)
            then bErro := True;
         end
         else begin
            if not GravaLogTOTALPREV ('Tratamento de Divergência - Período de '+sDataRecInicial+' a '+sDataRecFinal+
                                      ' - Op : Devolver via Banco em '+sDataCobranca+
                                      '-'+BuscaFiltrosLog)
            then bErro := True;
         end;
     end
     else
     begin
         if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas 
         then begin
            if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                      '-Meses Até '+sAnoMesCobrancaTela+ ' - Op : Devolver via Banco em '+sDataCobranca+
                                      '-'+BuscaFiltrosLog)
            then bErro := True;
         end
         else begin
            if not GravaLogTOTALPREV ('Tratamento de Divergência - Mês '+sAnoMesCobrancaTela+
                                      ' - Op : Devolver via Banco em '+sDataCobranca+
                                      '-'+BuscaFiltrosLog)
            then bErro := True;
         end;
     end;
     //fim André Oliveira SOL 172728 KINTANA 1556309
     TerminaTransacao('Devolver de Divergência Imediatamente',bErro,False);


    ////////TESTE PGA ////////
    //Renato Visoni SOL 130020 Kintana 717837
    for x := 0 to listaDocumentos.Count -1 do begin
      if sSQLwhere ='' then begin
        sSQLwhere := 'AND ((H.CODDOCUMENTOPREV = '+QuotedStr(listaDocumentos[x])+')';
      end else begin
        sSQLwhere := sSQLwhere + ' OR (H.CODDOCUMENTOPREV = '+QuotedStr(listaDocumentos[x])+')';
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
        sMsgPga := RealizaIntegracaoPGAIndiv('',CtrlDocumento,CtrlLancamento,'',sSQLwhere,'DIVERG');
        if sMsgPga = '' then begin
          memResult.Lines.Add(' - Integração com PGA realizada com sucesso - ')
        end else begin
          memResult.Lines.Add(sMsgPga);
        end;
      Except
         memResult.Lines.Add(' - Ocorreram problemas na Integração com PGA - ');
      end;



    end;
    //Renato Visoni SOL 130020 Kintana 717837

    listaDocumentos.Destroy;


  end;

end;

function TfrmDivergContrib.TrataDivergenciaBanco( var CtrlDocumento : TCtrlDocumento;
                                                  psDataCobranca : string;
                                                  piCodPortForma,
                                                  piIdLote       : longint;
                                                  cRecPag        : char ;
                                                  bInsereUltDoc : Boolean) : boolean;
var rEnvio,
    rValorDivergencia   : real;
    sNomeOp1            : string;
    sNomeOp2            : string;
    bErro               : boolean;
    iOpTratDiverg       : word;
    bContabilizaNoEnvio : Boolean;
    mrResult            : TModalResult;

    sTipDoc, sAux1, sAux2 : String;

    piUltimaContrib     : Integer;

    CodDocAnt           : Integer;
    PlnCodAnt           : Integer;
    iModoSelecionado    : word; //BRUNO AZEVEDO SOL 86498/11362
    fValorEnviar        : Extended; //BRUNO AZEVEDO SOL 86498/11362
    flgEraNegativo      : Boolean;//William Moreira da Silva 86498/11362
    sTipoAcao           : String; //Denis Horongoso - SIG50870
    sMotivo             : String; //Denis Horongoso - SIG50870
    sRecPag        : String; //BRUNO AZEVEDO SOL 86498/11362


begin
   Result := False;
   flgEraNegativo := false;
   bPossuiAcaoErro := False; //SIG50870

   lblMsg2.Caption  := 'Matrícula : '+qryDivergAnalit.FieldByName('MATRICULA').AsString+' ... ';

   //BRUNO AZEVEDO SOL 86498/11362
   iModoSelecionado := ItemSelecionado;
   //BRUNO AZEVEDO SOL 86498/11362

   // Verifica baixa de documento não pago
   if not VerificaCobrancaBancariaPendente ( qryDivergAnalit,  sMsgErro    )
   then begin
      memResult.Lines.Add(sMsgErro);
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   PlnCodAnt := -1;
   if qryDivergAnalit.FieldByName('CODDOCUMENTOPREV').AsInteger > 0 then
   begin
      PlnCodAnt := BuscaPlanilhaDoc(qryDivergAnalit.FieldByName('CODDOCUMENTOPREV').AsInteger);
   end;

   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------

   if (qryDivergAnalit.FieldByName('CODDOCUMENTOPREV').AsInteger > 0) and
      (DocBaixadoCAR(qryDivergAnalit.FieldByName('CODDOCUMENTOPREV').AsString)) and
      (qryDivergAnalit.FieldByName('VALORRECEBIDO').AsFloat = 0) and
      (qryDivergAnalit.FieldByName('SITRECEBIMENTO').AsInteger <> 3) then
   Begin
      memResult.Lines.Add('   [ERRO  ] Documento nº '+qryDivergAnalit.FieldByName('CODDOCUMENTOPREV').AsString+' - está baixado no CAR mas não foi realizado ' + #13+#10+
                          '            o recebimento da contribuição. Utilize a tela do menu CONTRIBUIÇÕES | RECEBIMENTO DE COBRANÇAS VIA BANCO '+#13+#10+
                          '            para proceder o recebimento das contribuições. [Mês:'+qryDivergAnalit.FieldByName('MESREFERENCIA').AsString+'- Contrib:'+
                          qryDivergAnalit.FieldByName('NOMERESUM').AsString+']' );
      Exit;
   End;
   // ----------------------------------------------------------------------------------------------



   // Verificar se é uma devolucao e se o valor esperado é realmente maior que o recebido
   if (qryDivergAnalit.FieldByName('ValorEsperado').AsFloat > qryDivergAnalit.FieldByName('ValorRecebido').AsFloat) and
      (cRecPag = 'P')
   then begin
      memResult.Lines.Add('   [ERRO  ] '+qryDivergAnalit.FieldByName('MATRICULA').AsString+' - '+qryDivergAnalit.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                          '            [Mês:'+qryDivergAnalit.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryDivergAnalit.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                          '            Não existe diferença a devolver. Motivo : Valor Esperado maior que o Valor Recebido ');
      Exit;
   end;

   // Verificar se é uma cobranca e se o valor esperado é realmente menor que o recebido
   //BRUNO AZEVEDO SOL 86498/11362
   if (iModoSelecionado <> 1) then begin
     if (qryDivergAnalit.FieldByName('ValorEsperado').AsFloat < qryDivergAnalit.FieldByName('ValorRecebido').AsFloat) and
        (cRecPag = 'R')
     then begin
        memResult.Lines.Add('   [ERRO  ] '+qryDivergAnalit.FieldByName('MATRICULA').AsString+' - '+qryDivergAnalit.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                            '            [Mês:'+qryDivergAnalit.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryDivergAnalit.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                            '            Não existe cobrança a fazer. Motivo : Valor Esperado menor que o Valor Recebido ');
        Exit;
     end;
   end;
   //BRUNO AZEVEDO SOL 86498/11362

   // Verificar se é uma cobranca e se o valor esperado é realmente menor que o recebido
   //BRUNO AZEVEDO SOL 86498/11362
   if (iModoSelecionado <> 1) then begin
     if (qryDivergAnalit.FieldByName('ValorEsperado').AsFloat <= 0)
     then begin
        memResult.Lines.Add('   [AVISO ] '+qryDivergAnalit.FieldByName('MATRICULA').AsString+' - '+qryDivergAnalit.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                            '            [Mês:'+qryDivergAnalit.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryDivergAnalit.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                            '            Não existe cobrança a fazer. Motivo : Valor Esperado igual a ZERO');
        Result := True;
        Exit;
     end;
   end;
   //BRUNO AZEVEDO SOL 86498/11362

   //Denis Horongoso - SIG50870 - Inicio
   if iModoSelecionado = 1 then //Contribuições Não Pagas
   begin
      if ExisteAcaoJudicialVigente(qryDivergAnalit.FieldByName('IdPessoa').AsString,
                                   qryDivergAnalit.FieldByName('IdTitular').AsString,
                                   qryDivergAnalit.FieldByName('IdContribuicao').AsString,
                                   qryDivergAnalit.FieldByName('IdPlanoPrev').AsString,
                                   qryDivergAnalit.FieldByName('IdPessJur').AsString,
                                   qryDivergAnalit.FieldByName('SeqProposta').AsString,
                                   sTipoAcao,
                                   sMotivo) then
      begin
         memResult.Lines.Add('   [ERRO  ] Matrícula '+qryDivergAnalit.FieldByName('MATRICULA').AsString+' - '+qryDivergAnalit.FieldByName('NOMEPARTICIP').AsString+': Participante possui'+#13+#10+
                             '            ação judicial do tipo "'+sMotivo+'" e não teve'+#13+#10+
                             '            sua contribuição '+sTipoAcao);

         bPossuiErroAcao := True;
         bPossuiAcaoErro := True;
         Exit;
      end;
   end;
   //Denis Horongoso - SIG50870 - Fim
   if cRecPag = 'R'
   then begin
      sNomeOp1 := 'Cobrança de ';
      sNomeOp2 := 'Receita de ';
      iOpTratDiverg := 2;
   end
   else begin
      sNomeOp1 := 'Devolução de ';
      sNomeOp2 := 'Estorno de Receita de ';
      iOpTratDiverg := 5;
   end;

   // Se for Receber
   // Entao Pagou a Menor -> cobrar diferenca -> diferenca = esperado - recebido
   // Senao Pagou a Maior -> devolver diferenca -> diferenca = recebido - esperado
   if cRecPag = 'R'
   then rValorDivergencia := qryDivergAnalit.FieldByName('ValorEsperado').AsFloat -
                             qryDivergAnalit.FieldByName('ValorRecebido').AsFloat
   else rValorDivergencia := qryDivergAnalit.FieldByName('ValorRecebido').AsFloat -
                             qryDivergAnalit.FieldByName('ValorEsperado').AsFloat;

   // Atualizar sitrecebimento para 4  (Divergente e tratado)

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO = 4, OPTRATDIVERG = '+IntToStr(iOpTratDiverg)+

                  //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
                  //', NUMRECEBIMENTOPAI = (SELECT NUMRECEBIMENTO FROM HSTCONTRIBPREV ' +#13+
                  //'                       WHERE IDPLANOPREV = ' + qryDivergAnalit.FieldByName('IdPlanoPrev').AsString +#13+
                  //'                       AND IDPESSOA = ' + qryDivergAnalit.FieldByName('IdPessoa').AsString +#13+
                  //'                       AND IDPESSJUR = ' + qryDivergAnalit.FieldByName('IdPessJur').AsString +#13+
                  //'                       AND SEQPROPOSTA = ' + qryDivergAnalit.FieldByName('SeqProposta').AsString +#13+
                  //'                       AND IDCONTRIBUICAO = ' + qryDivergAnalit.FieldByName('IdContribuicao').AsString +#13+
                  //'                       AND IDMOTIVO = ' + qryDivergAnalit.FieldByName('IdMotivo').AsString +#13+
                  //'                       AND SITRECEBIMENTO = 4' +#13+
                  //'                       AND MESCOBRANCA = (SELECT MAX(MESCOBRANCA) FROM HSTCONTRIBPREV' +#13+
                  //'                                            WHERE IDPLANOPREV =' + qryDivergAnalit.FieldByName('IdPlanoPrev').AsString +#13+
                  //'                                            AND IDPESSOA = ' + qryDivergAnalit.FieldByName('IdPessoa').AsString +#13+
                  //'                                            AND IDPESSJUR = ' + qryDivergAnalit.FieldByName('IdPessJur').AsString +#13+
                  //'                                            AND SEQPROPOSTA = ' + qryDivergAnalit.FieldByName('SeqProposta').AsString +#13+
                  //'                                            AND IDCONTRIBUICAO = ' + qryDivergAnalit.FieldByName('IdContribuicao').AsString +#13+
                  //'                                            AND IDMOTIVO = ' + qryDivergAnalit.FieldByName('IdMotivo').AsString +#13+
                  //'                                            AND SITRECEBIMENTO = 4 ))' +#13+
                  //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

                  'WHERE  MESREFERENCIA  = '''+qryDivergAnalit.FieldByName('MesReferencia').AsString+''''+
                  'AND    MESCOBRANCA    = '''+qryDivergAnalit.FieldByName('MesCobranca').AsString+''''+
                  'AND    NUMRECEBIMENTO =   '+qryDivergAnalit.FieldByName('NumRecebimento').AsString+
                  'AND    IDMOTIVO       =   '+qryDivergAnalit.FieldByName('IdMotivo').AsString+
                  'AND    IDPESSJUR      =   '+qryDivergAnalit.FieldByName('IdPessJur').AsString+
                  'AND    IDPLANOPREV    =   '+qryDivergAnalit.FieldByName('IdPlanoPrev').AsString+
                  'AND    IDPESSOA       =   '+qryDivergAnalit.FieldByName('IdPessoa').AsString+
                  'AND    SEQPROPOSTA    =   '+qryDivergAnalit.FieldByName('SeqProposta').AsString+
                  'AND    IDCONTRIBUICAO =   '+qryDivergAnalit.FieldByName('IdContribuicao').AsString);
   try
      qryAux.ExecSQL;
   except
      memResult.Lines.Add('   [ERRO  ] '+qryDivergAnalit.FieldByName('MATRICULA').AsString+' - '+qryDivergAnalit.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                          '            [Mês:'+qryDivergAnalit.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryDivergAnalit.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                          '            Erro na atualização da situação da contribuição ');
      Exit;
   end;

//Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
//   qryAux.Close;
//   qryAux.SQL.Clear;
//   qryAux.SQL.Add('UPDATE HSTCONTRIBPREV SET '+
//
//                  //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
//                  '  NUMRECEBIMENTOPAI = (SELECT NUMRECEBIMENTO FROM HSTCONTRIBPREV ' +#13+
//                  '                       WHERE IDPLANOPREV = ' + qryDivergAnalit.FieldByName('IdPlanoPrev').AsString +#13+
//                  '                       AND IDPESSOA = ' + qryDivergAnalit.FieldByName('IdPessoa').AsString +#13+
//                  '                       AND IDPESSJUR = ' + qryDivergAnalit.FieldByName('IdPessJur').AsString +#13+
//                  '                       AND SEQPROPOSTA = ' + qryDivergAnalit.FieldByName('SeqProposta').AsString +#13+
//                  '                       AND IDCONTRIBUICAO = ' + qryDivergAnalit.FieldByName('IdContribuicao').AsString +#13+
//                  '                       AND IDMOTIVO = ' + qryDivergAnalit.FieldByName('IdMotivo').AsString +#13+
//                  '                       AND SITRECEBIMENTO = 4' +#13+
//                  '                       AND MESCOBRANCA = (SELECT MIN(MESCOBRANCA) FROM HSTCONTRIBPREV' +#13+
//                  '                                            WHERE IDPLANOPREV =' + qryDivergAnalit.FieldByName('IdPlanoPrev').AsString +#13+
//                  '                                            AND IDPESSOA = ' + qryDivergAnalit.FieldByName('IdPessoa').AsString +#13+
//                  '                                            AND IDPESSJUR = ' + qryDivergAnalit.FieldByName('IdPessJur').AsString +#13+
//                  '                                            AND SEQPROPOSTA = ' + qryDivergAnalit.FieldByName('SeqProposta').AsString +#13+
//                  '                                            AND IDCONTRIBUICAO = ' + qryDivergAnalit.FieldByName('IdContribuicao').AsString +#13+
//                  '                                            AND IDMOTIVO = ' + qryDivergAnalit.FieldByName('IdMotivo').AsString +#13+
//                  '                                            AND SITRECEBIMENTO = 4 ))' +#13+
//                  //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636
//
//                  'WHERE  MESREFERENCIA  = '''+qryDivergAnalit.FieldByName('MesReferencia').AsString+''''+
//                  'AND    MESCOBRANCA    = '''+qryDivergAnalit.FieldByName('MesCobranca').AsString+''''+
//                  'AND    NUMRECEBIMENTO =   '+qryDivergAnalit.FieldByName('NumRecebimento').AsString+
//                  'AND    IDMOTIVO       =   '+qryDivergAnalit.FieldByName('IdMotivo').AsString+
//                  'AND    IDPESSJUR      =   '+qryDivergAnalit.FieldByName('IdPessJur').AsString+
//                  'AND    IDPLANOPREV    =   '+qryDivergAnalit.FieldByName('IdPlanoPrev').AsString+
//                  'AND    IDPESSOA       =   '+qryDivergAnalit.FieldByName('IdPessoa').AsString+
//                  'AND    SEQPROPOSTA    =   '+qryDivergAnalit.FieldByName('SeqProposta').AsString+
//                  'AND    IDCONTRIBUICAO =   '+qryDivergAnalit.FieldByName('IdContribuicao').AsString);
//   try
//      qryAux.ExecSQL;
//   except
//      memResult.Lines.Add('   [ERRO  ] '+qryDivergAnalit.FieldByName('MATRICULA').AsString+' - '+qryDivergAnalit.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
//                          '            [Mês:'+qryDivergAnalit.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryDivergAnalit.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
//                          '            Erro na atualização da situação da contribuição ');
//      Exit;
//   end;
//Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

   // Incluir linha com a divergencia
   if not InsereHistorico( qryDivergAnalit, Copy(psDataCobranca,7,4)+'/'+Copy(psDataCobranca,4,2),
                           IntToStr(piCodPortForma), psDataCobranca,'',
                           0,   // dValorAlterador
                           qryDivergAnalit.FieldByName('valoresperado').AsFloat,
                           qryDivergAnalit.FieldByName('valorrecebido').AsFloat,
                           '0',   // flgDescFolha
                           cRecPag,
                           False, // Aporte
                           '',    // IdContribuicao se for aporte
                           piIdLote, '',
                           qryDivergAnalit.FieldByName('NumRecebimento').AsString//Helio - SOL Nº 253577/17744 PPM Nº 1063636
                           )
   then begin
       memResult.Lines.Add('   [ERRO  ] '+qryDivergAnalit.FieldByName('MATRICULA').AsString+' - '+qryDivergAnalit.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                           '            [Mês:'+qryDivergAnalit.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryDivergAnalit.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                           '            Erro na gravação do histórico de contribuições.');

       Exit;
   end;


   if (iNumRecebimentoInserido > 0)  and (not bNaoParaTodos)
   then begin


      if not bSimParaTodos
      then mrResult := MsgDlg('Deseja processar o Envio das contribuições neste momento ?','Confirmação',mtConfirmation,[mbYes,mbNo],0);

      if mrResult = mrNo then  bNaoParaTodos := True;
      if mrResult = mrYes then  bSimParaTodos := True;

      if bSimParaTodos
      then begin


         if not bVerificouGrupo then
         begin
            bApenasUmDocumento := false;
            bVerificouGrupo := true;

            if MsgDlg('Deseja que as contribuições sejam agrupadas em documento por mês? (caso a opção seja NÃO, apenas um documento será gerado por pessoa)','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
            then bApenasUmDocumento := true;

         end;



         qryContabil.Close;
         qryContabil.ParamByName('PLNCODIGO').AsInteger := -1;
         qryContabil.Prepare;
         qryContabil.Open; // query CachedUpdate que contém os registros a serem
                           // passados à LancaContab


         MontaConsultaEnviaBanco(qryDivergAnalit.FieldByName('IDTITULAR').AsInteger,             // edilaine - SIG 35577
                                 qryDivergAnalit.FieldByName('IDPESSOA').AsInteger );

         qryEnvioBanco.Close;
         qryEnvioBanco.ParamByName('IDPESSJUR').AsInteger      := qryDivergAnalit.FieldByName('IDPESSJUR').AsInteger;
         qryEnvioBanco.ParamByName('IDPLANOPREV').AsInteger    := qryDivergAnalit.FieldByName('IDPLANOPREV').AsInteger;
         qryEnvioBanco.ParamByName('IDPESSOA').AsInteger       := qryDivergAnalit.FieldByName('IDPESSOA').AsInteger;
         qryEnvioBanco.ParamByName('SEQPROPOSTA').AsInteger    := qryDivergAnalit.FieldByName('SEQPROPOSTA').AsInteger;
         qryEnvioBanco.ParamByName('NUMRECEBIMENTO').AsInteger := iNumRecebimentoInserido;
         qryEnvioBanco.Open;

         //BRUNO AZEVEDO SOL 86498/11362
         fValorEnviar := qryEnvioBanco.FieldByName('ValorEsperado').AsFloat;
         if (fValorEnviar <= 0) then begin
           fValorEnviar := (fValorEnviar * -1);
         end;
         //BRUNO AZEVEDO SOL 86498/11362

         rEnvio := EnviaContribuicaoBANCO ( qryContabil,
                                            qryDocumentos,
                                            qryEnvioBanco,
                                            qryAux,
                                            Copy(qryEnvioBanco.FieldByName('MesReferencia').AsString,6,2),
                                            qryEnvioBanco.FieldByName('MesReferencia').AsString,
                                            Copy('Cobrança de '+qryEnvioBanco.FieldByName('NomeContrib').AsString,1,40),
                                            Copy('Receita de '+qryEnvioBanco.FieldByName('NomeContrib').AsString,1,40),
                                            psDataCobranca,
                                            qryEnvioBanco.FieldByName('IdPessJur').AsInteger,
                                            qryEnvioBanco.FieldByName('IdPlanoPrev').AsInteger,
                                            qryEnvioBanco.FieldByName('IdPessoa').AsInteger,
                                            qryEnvioBanco.FieldByName('IdContribuicao').AsInteger,
                                            qryEnvioBanco.FieldByName('IdContribuicao').AsInteger,
                                            CtrlDocumento,
                                            qryEnvioBanco.FieldByName('FlgPagador').AsString,
                                            qryEnvioBanco.FieldByName('FlgSitFundacao').AsString,
                                            qryEnvioBanco.FieldByName('CODPORTFORMA').AsInteger,
                                            cRecPag,
                                            //BRUNO AZEVEDO SOL 86498/11362
                                            //qryEnvioBanco.FieldByName('ValorEsperado').AsFloat,
                                            fValorEnviar,
                                            //BRUNO AZEVEDO SOL 86498/11362
                                            sMsgErro,
                                            iCodLancCAPCAR,
                                            iPlnCodigo,
                                            //Inicio - Helio - SOL Nº 253577/17460 PPM Nº 955546
                                            '', //psObservacao
                                            qryDivergAnalit.FieldByName('IDPLANPREVCONTAB').AsString);
                                            //Fim - Helio - SOL Nº 253577/17460 PPM Nº 955546

         //edilaine - SIG35577 - incicio
         {//BRUNO AZEVEDO SOL 86498/11362
         if ((rEnvio <= 0) and ((iModoSelecionado = 1))) then begin
           rEnvio := (rEnvio * -1);
           flgEraNegativo := true;//William Moreira da Silva 86498/11362
         end;
         //BRUNO AZEVEDO SOL 86498/11362
         } //edilaine - SIG35577 - fim

         if (rEnvio <= 0)
         then begin
           memResult.Lines.Add('   [ERRO  ] '+qryEnvioBanco.FieldByName('MATRICULA').AsString+' - '+qryEnvioBanco.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                               '            [Mês:'+qryEnvioBanco.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryEnvioBanco.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                               '            Erro ao enviar contribuição para CAP/CAR.'+#13+
                               '            ['+iff(CtrlDocumento.MessageInfo <> '', CtrlDocumento.MessageInfo, sMsgErro)+']');    //edilaine - SIG35577

           Exit;
         end;

         //edilaine - SIG35577 - inicio
         {//William Moreira da Silva 86498/11362
         if ((flgEraNegativo) and (iModoSelecionado = 1)) then
         begin
            rEnvio := (rEnvio * -1);
            flgEraNegativo := false;
         end;
         //William Moreira da Silva 86498/11362
         }//edilaine - SIG35577 - fim

         // Atualizar sitrecebimento para 1 (enviado e nao recebido)
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO   = 1,    '+
                        '                          DATACANCELAMENTO = NULL, '+
                        '                          MOTIVOCANCEL     = NULL  '+ // Peterson Victor SIG19562
                        //'                          NUMRECEBIMENTOPAI = ' + qryDivergAnalit.FieldByName('NumRecebimento').AsString + ' ' +//Helio - SOL Nº 253577/17744 PPM Nº 1063636
                        'WHERE  MESREFERENCIA  = '''+qryEnvioBanco.FieldByName('MesReferencia').AsString+''''+
                        'AND    MESCOBRANCA    = '''+qryEnvioBanco.FieldByName('MesCobranca').AsString+''''+
                        'AND    NUMRECEBIMENTO =   '+qryEnvioBanco.FieldByName('NumRecebimento').AsString+
                        'AND    IDMOTIVO       =   '+qryEnvioBanco.FieldByName('IdMotivo').AsString);
         try
            qryAux.ExecSQL;
         except
            memResult.Lines.Add('   [ERRO  ] '+qryEnvioBanco.FieldByName('MATRICULA').AsString+' - '+qryEnvioBanco.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                                '            [Mês:'+qryEnvioBanco.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryEnvioBanco.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                '            Erro na atualização da situação da contribuição para "enviada".');

            Exit;
         end;


         sNumRecebEnviados := sNumRecebEnviados + qryEnvioBanco.FieldByName('NumRecebimento').AsString+',';

         sNumRecebimento := sNumRecebimento + IFF(sNumRecebimento = '', '', ',') + qryEnvioBanco.FieldByName('NumRecebimento').AsString; //TAES - SIG95433

         VerificaContabMantidoNoEnvio(qryaux,bContabilizaNoEnvio,qryEnvioBanco.FieldByName('IdPlanoPrev').AsInteger);

         if not ((qryEnvioBanco.FieldByName('FlgSitFundacao').AsString = 'MA')
                 and (not bContabilizaNoEnvio))
         then
         begin
          { Robson Andrade - SOL 253577/17778 PPM 1073239 - Início

           ######################################################################
           No tratamento de divergência o sistema "não" deverá utilizar a planilha
           do mês anterior, é feita baixa ( extorno ) e sempre deverá ser gerada
           nova planilha com novo documento
           #####################################################################

           // if not(PlnCodAnt > 0)
           // then
           // begin
               // Descarrega qryContabil com os Lançamentos contábeis dos envios (mantidos)
               IncluiContabilidade(CtrlLancamento, qryContabil, iPlnCodigo, sMsgErro);
               if iPlnCodigo < 0
               then begin
                  memResult.Lines.Add('   [ERRO  ] '+qryEnvioBanco.FieldByName('MATRICULA').AsString+' - '+qryEnvioBanco.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                                   '            [Mês:'+qryEnvioBanco.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryEnvioBanco.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                   '            Erro na inclusão do lançamento na contabilidade : '+sMsgErro);

                  Exit;
              // end;
           // end
           // else
           // begin
           //    iPlnCodigo := PlnCodAnt;

               //Incio - Helio - SOL Nº 253577/17460 PPM Nº 955546
           //    AtualizaLancamento(iPlnCodigo,
                                  qryDivergAnalit.FieldByName('IDPLANPREVCONTAB').AsString);
               //Fim - Helio - SOL Nº 253577/17460 PPM Nº 955546
            //end;

           Robson Andrade - SOL 253577/17778 PPM 1073239 - Fim  }

            { Robson Andrade - SOL 253577/17778 PPM 1073239 - Inicio }
            IncluiContabilidade(CtrlLancamento, qryContabil, iPlnCodigo, sMsgErro);
            if iPlnCodigo < 0
            then begin
               memResult.Lines.Add('   [ERRO  ] '+qryEnvioBanco.FieldByName('MATRICULA').AsString+' - '+qryEnvioBanco.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                                '            [Mês:'+qryEnvioBanco.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryEnvioBanco.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                '            Erro na inclusão do lançamento na contabilidade : '+sMsgErro);

               Exit;
            end;
            { Robson Andrade - SOL 253577/17778 PPM 1073239 - Fim  }

            qryDocumentos.First;
            while not qryDocumentos.EOF Do
            Begin
               try
                  AdmPREV_Informa_Planilha(qryAux,iPlnCodigo,
                                             qryDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                             qryDocumentos.FieldByName('NUMLANCTO').AsInteger);

               except
                  memResult.Lines.Add('   [ERRO  ] Documento No.'+qryDocumentos.FieldByName('CODDOCUMENTO').AsString+' - Erro ao associar número da planilha contábil.');

                  Exit;
               end;
               qryDocumentos.Next;
            end;

            try
               if not qryContabil.IsEmpty   then qryContabil.CancelUpdates;
            except
            end;
         end;
      end;


      // testa se deve descarregar os documentos neste momento
      // caso seja mês diferente e o usuário tenha optado por vários documentos, um por mês
      // Se for a mesma pessoa
      // Entao  lançar as contribuições em um único documento e uma única planilha
      // Senao  reiniciar variaveis de Planilha(iPlnCodigo) e Documento(iCodLancCAPCAR) para
      //        que sejam criados novos registros
      rTotal := rTotal + rEnvio;


      if not qryEnvioBanco.isempty then
      begin
         //BRUNO AZEVEDO SOL 86498/11362
         qryDivergAnalit.Next;
         if ((sMesRef <> qryEnvioBanco.FieldByName('MesReferencia').AsString) and (not bApenasUmDocumento))
            or (sIdPessoa <> qryDivergAnalit.FieldByName('IdPessoa').AsString )
            or (bInsereUltDoc) then
         begin
            //BRUNO AZEVEDO SOL 86498/11362 - COMENTADO
            //if cRecPag = 'R' then
            //sTipDoc := prmTpDocRRecBanco
            //else sTipDoc := prmTpDocPEnvioBanco;

            BuscaInfFinancContrib(sAux1, sAux2, sCodCentroCusto,'CODCENTROCUSTOD',
                      qryEnvioBanco.FieldByName('CODCENTROCUSTOD').AsString,
                      'S',
                      qryEnvioBanco.FieldByName('IdPessjur').AsInteger,
                      qryEnvioBanco.FieldByName('IdPlanoPrev').AsInteger,
                      qryEnvioBanco.FieldByName('IdContribuicao').AsInteger,
                      piUltimaContrib,
                      qryEnvioBanco.FieldByName('IdPessoa').AsInteger );



            BuscaInfFinancContrib(sAux1, sAux2, sCodPortForma,'CODPORTFORMA',
                      qryEnvioBanco.FieldByName('CODPORTFORMA').AsString,
                      'S',
                      qryEnvioBanco.FieldByName('IdPessjur').AsInteger,
                      qryEnvioBanco.FieldByName('IdPlanoPrev').AsInteger,
                      qryEnvioBanco.FieldByName('IdContribuicao').AsInteger,
                      piUltimaContrib,
                      qryEnvioBanco.FieldByName('IdPessoa').AsInteger );


            //BRUNO AZEVEDO SOL 86498/11362
            sRecPag := 'R';
            if (rTotalDocumento > 0) then begin
              sRecPag := 'R';
            end else begin
              sRecPag := 'P';
            end;

            if sRecPag = 'R' then
            sTipDoc := prmTpDocRRecBanco
            else sTipDoc := prmTpDocPEnvioBanco;
            //BRUNO AZEVEDO SOL 86498/11362

            if qryDocumentos.recordCount > 0 then                       //edilaine - SIG35577
              iCodLancCapCAR := DescarregaDocumentos( CtrlDocumento,
                                                 qryDocumentos,
                                                 strtoint(sIdPessJur),
                                                 iPlnCodigo,
                                                 sTipDoc,
                                                 sCodPortForma,
                                                 Copy(psDataCobranca,4,2),
                                                 Copy(psDataCobranca,7,4),
                                                 rTotal,
                                                 strtodate(psDataCobranca),
                                                 '',
                                                 'P',
                                                 qryEnvioBanco.FieldByName('IDPESSOA').AsString,
                                                 sNumRecebimento, //TAES - SIG95433
                                                 sRecPag,'',
                                                 sCodCentroCusto );

            if iCodLancCapCAR < 0
            then begin
               bErro := True;
               rEnvio := -1;
               memResult.Lines.Add('[ERRO ] - Erro na inserção dos documentos : '+CtrlDocumento.MessageInfo);

               Exit;
            end;

            ListaDocumentos.Add(intTostr(iCodLancCapCAR)); // Renato Visoni SOL 130020 Kintana 717837

            //BRUNO AZEVEDO SOL 86498/1136
            sNumRecebEnviadosAlterador := sNumRecebimento;
            if copy(sNumRecebEnviadosAlterador, 1,1) = ',' then      //edilaine SIG97583
              sNumRecebEnviadosAlterador := Copy(sNumRecebEnviadosAlterador,2,length(sNumRecebEnviadosAlterador));

            if not EnviaAlteradorBANCO( CtrlDocumento,
                                        qryAux,
                                        qryAux1,
                                        qryContabil,
                                        qryDocumentos,
                                        sMesRef,
                                        //BRUNO AZEVEDO SOL 86498/11362
                                        //qryEnvioBanco.FieldByName('NUMRECEBIMENTO').AsString,
                                        sNumRecebEnviadosAlterador,
                                        //BRUNO AZEVEDO SOL 86498/11362
                                        iCodLancCAPCAR,
                                        psDataCobranca,
                                        psDataCobranca,
                                        sTipOperEnvio,
                                        strtoint(sIdPessJur),
                                        strtoint(sIdPlanoPrev),
                                        strtoint(sIdPessoa),
                                        strtoint(sIdContribuicao),
                                        strtoint(sIdContribuicao),
                                        sFlgPagador,
                                        sMsgErro,
                                        sFlgSitFundacao)
            then begin
               memResult.Lines.Add('   [ERRO  ] '+qryEnvioBanco.FieldByName('MATRICULA').AsString+' - '+qryEnvioBanco.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                                   '            [Mês:'+qryEnvioBanco.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryEnvioBanco.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                   '            Erro ao enviar alteradores da contribuição para CAP/CAR.');

               bErro := True;
               rEnvio := -1;

               Exit;
            end;

            //BRUNO AZEVEDO SOL 86498/1136
            sNumRecebEnviadosAlterador := '';

            qryDocumentos.CancelUpdates;

            qryDocumentos.Close;
            qryDocumentos.ParamByName('CODDOCUMENTO').AsInteger := -1;
            qryDocumentos.Open;

            if not(qryContabil.IsEmpty) then qryContabil.CancelUpdates;

            rTotal := 0;
            iCodLancCAPCAR := -1;
            iPlnCodigo     := 0;
            sMesRef := qryEnvioBanco.FieldByName('mesreferencia').AsString;
            sIdPessoa := qryEnvioBanco.FieldByName('idpessoa').AsString;
            sNumRecebimento := '';
         end;
         if not(qryDivergAnalit.Eof) then begin
           qryDivergAnalit.Prior;
         end;
      end;
   end;

   bProcessou := True; //SIG50870
   Result := True;
end; // TrataDivergenciaBanco


procedure TfrmDivergContrib.AcrescentarnoPrximoBenefcio1Click(
  Sender: TObject);
var bErro : boolean;
    //inicio André Oliveira SOL 172728 KINTANA 1556309
    sAnoMesCobrancaTela,
    sDataRecInicial,
    sDataRecFinal,
    //fim André Oliveira SOL 172728 KINTANA 1556309
    sMesNovaCobranca : string;
        mrResultado : TModalResult;

    iModoSelecionado : word;  //André Oliveira SOL 172728 KINTANA 1556309
begin
	inherited;
    iModoSelecionado := ItemSelecionado;  //André Oliveira SOL 172728 KINTANA 1556309


  // Inversao do preenchimento da variavel iModo para poder utiliza-la dentro
  // da PedeConfirma
  iModo := 6;

  If Not PedeConfirma Then Exit;


  bErro := False;

  //inicio André Oliveira SOL 172728 KINTANA 1556309
    sDataRecInicial := FormatDateTime('DD/MM/YYYY', cmdtDataReceInicial.Date);
    sDataRecFinal   := FormatDateTime('DD/MM/YYYY', cmdtDataReceFinal.date);

  // Preencher o mes de cobranca de acordo com a tela
  sAnoMesCobrancaTela := FormaAnoMesTela(cmbMesRef, spedAnoRef);


  // Preencher tela com o novo mes de cobranca - Default = proximo mes
  sMesNovaCobranca    := ProximoAnoMes(StrToInt(Copy(sAnoMesCobrancaTela,6,2)),
                                       StrToInt(Copy(sAnoMesCobrancaTela,1,4)));
   
    //fim André Oliveira SOL 172728 KINTANA 1556309

  frmDivergPedeNovoMesCob := TfrmDivergPedeNovoMesCob.Create(Self);

  try
     with frmDivergPedeNovoMesCob do
     begin
        Caption             := 'Informe o mês para acrescentar a divergência ... ';
        //inicio André Oliveira SOL 172728 KINTANA 1556309
        if not  (iModoSelecionado in  [0,1,2,3,4])then
        begin
            cmbMesCob.ItemIndex := StrToInt(Copy(sMesNovaCobranca,6,2)) - 1;
            cmbMesCob.Text      := cmbMesCob.Items[cmbMesCob.ItemIndex];
            spedAnoCob.Text     := Copy(sMesNovaCobranca,1,4);
        end
        else
            spedAnoCob.Text := '';
        //fim André Oliveira SOL 172728 KINTANA 1556309

        mrResultado := ShowModal;


        if (Trim(cmbMesCob.Text) = '') or (Trim(spedAnoCob.Text) = '') or (mrResultado <> mrOK)
        then begin
           MsgDlg('Mês para acrescentar a divergência incompleto. Verifique.','Erro',mtError,[mbOk, mbHelp],0);
           //frmDivergPedeNovoMesCob.Free;
           Exit;
        end;

        // Preencher o mes de cobranca referente ao selecionado na tela
        sMesNovaCobranca := Trim(spedAnoCob.Text);
        if cmbMesCob.ItemIndex <= 8
        then sMesNovaCobranca  := sMesNovaCobranca+'/'+'0'+IntToStr(cmbMesCob.ItemIndex+1)
        else sMesNovaCobranca  := sMesNovaCobranca+'/'+    IntToStr(cmbMesCob.ItemIndex+1);
     end;
  finally
     frmDivergPedeNovoMesCob.Free;
  end;

  PreparaTransacao('Acrescenta Divergência no próximo Benefício...');

  if dbgrdDivergAnalit.visible then
  begin
     if not CobraProxMes(qryDivergAnalit,True,sMesNovaCobranca,'','','','B','1','P',6) then bErro := True;
     //qryDivergAnalit.close;
     //qryDivergAnalit.open;
  end
  else
  begin
     if not CobraProxMes(qryDivergSintetAux,False,sMesNovaCobranca,'','','','B','1','P',6) then bErro := True;
     //qryDivergSintetAux.close;
     //qryDivergSintetAux.open;
  end;
   //inicio André Oliveira SOL 172728 KINTANA 1556309
  if  (iModoSelecionado in  [0,1,2,3,4])then
  begin
      if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
      then begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                   '-Meses Até '+sDataRecInicial+' - Op : Devolver na Próxima Folha de Benefício do Mês '+sMesNovaCobranca+
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end
      else begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência - Período de '+sDataRecInicial+' a '+sDataRecFinal+
                                   ' - Op : Devolver na Próxima Folha de Benefício do Mês '+sMesNovaCobranca+
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end;
  end
  else begin
     if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas 
     then begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                   '-Meses Até '+sAnoMesCobrancaTela+ ' - Op : Devolver na Próxima Folha de Benefício do Mês '+sMesNovaCobranca+
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end
     else begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência - Mês '+sAnoMesCobrancaTela+
                                   ' - Op : Devolver na Próxima Folha de Benefício do Mês '+sMesNovaCobranca+
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
     end;

  end;
  //fim André Oliveira SOL 172728 KINTANA 1556309
  TerminaTransacao('Acrescenta Divergência no próximo Benefício',bErro,False);
end;

procedure TfrmDivergContrib.bbtnSairClick(Sender: TObject);
begin

  if dtmBaseDados.dbBaseDados.InTransaction then Exit;

  inherited;
end;



function TfrmDivergContrib.CalculaAporte(qryLeitura : twwquery ) : Boolean;
var bErro : Boolean;
begin
   bErro := False;
   result := False;

   frmContAporte.AbrirFormContrib(qryLeitura.FieldByName('IDPESSJUR').AsString,
                 qryLeitura.FieldByName('IDPLANOPREV').AsString,
                 qryLeitura.FieldByName('IDPESSOA').AsString,
                 qryLeitura.FieldByName('SEQPROPOSTA').AsString,
                 qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                 qryLeitura.FieldByName('PLANPREV').AsString,
                 qryLeitura.FieldByName('PESSJUR').AsString);

   if bSaiuContApp then
   begin
      memResult.Lines.Add('***********************************');
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('***********************************');
      btncancelaprogressClick(self);
   end;

   if not bSaiuCont then
   begin
      qrybusca.close;
      qrybusca.sql.clear;
      qrybusca.sql.add(' SELECT VALOR, IDPESSJUR,IDPLANOPREV,IDDESCONTO,PLANO,PLACONTAC, '+
                       '         PLACONTAD,FLGDESCONTO,FLGDESCFOLHA, FLGTIPODESC,          '+
                       '         FLGTIPODESC,CODTIPDOC,CODTIPRECDES,RECPAG,CODSUBCONTA,     '+
                       '         CODPORTFORMA, UNIDNEGOC,CODCENTRORESPON,CODCENTROCUSTOD,   '+
                       '         CODCENTROCUSTOC,IDEMPRESA,IDEMPRESAPROP,IDMOTIVO,FLGALTERADOR, '+
                       '         FLGATRASODEVOL,TIPCODIGO,MESREFERENCIA,DATACOBRANCA,       '+
                       '         CODALTERADOR,IDFUNDACAO, CODDOCUMENTOPREV,IDLOTE,ORDEM, MATRICULA,  '+
                       '         PERIODO,EXERCICIO,INSCRICAONUMERO INSCRICAO,NODOCUMENTO,COMPLDOCUMENTO , '+
                       '         PLNCODIGOPREV, IDFUNDACAO , FLGDESCFOLHA '+
                       ' FROM    TMPDESC    '+
                       ' WHERE  (IDPESSJUR = '+qryLeitura.FieldByName('idpessjur').AsString+') '+
                       ' AND    (IDTITULAR = '+qryLeitura.FieldByName('idpessoa').AsString+') '+
                       ' AND    (IDPLANOPREV = '+qryLeitura.FieldByName('idplanoprev').AsString+') '+
                       ' AND    (MESREFERENCIA = '''+qryLeitura.FieldByName('mesreferencia').AsString+''') '+
                       ' AND    (IDDESCONTO = '+qryLeitura.FieldByName('idcontribuicao').AsString+') '+
                       ' AND    (SITENVIO = ''1'') ');

      try
         qrybusca.open;
      except
      end;

      balguma := True;

      if qrybusca.isempty then
      begin
         memResult.Lines.Add('   [ERRO  ] '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString                 +#13+#10+
                             '            [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryLeitura.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                             '            Contribuição não encontrada na Tabela Temporária de Descontos.');
          
         bErro := True;
         balguma := True;
         Exit;
      end;

      pnlProgresso.Update;
      Application.ProcessMessages;
      frmDivergContrib.update;
      if bCancelaenvio then
      begin
         memResult.Lines.Add('***********************************');
         memResult.Lines.Add('Processo interrompido pelo usuário.');
         memResult.Lines.Add('***********************************');
         exit;
      end;


      if not InsereHistorico(qryLeitura,qryLeitura.FieldByName('MESCOBRANCA').AsString,
                      '',qryLeitura.FieldByName('DATARECEBIMENTO').AsString,
                      qryLeitura.FieldByName('IDREGRACALCULO').AsString,
                      0,qryLeitura.FieldByName('VALORESPERADO').AsFloat,
                      qryLeitura.FieldByName('VALORRECEBIDO').AsFloat ,
                      '0',
                      'P',True,sIdContrib, -1 , 'P')
      then
      begin
         memResult.Lines.Add('   [ERRO  ] '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString                 +#13+#10+
                             '            [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryLeitura.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                             '            Erro na gravação do aporte no histórico de contribuições.');
          
         balguma := True;
         bErro := True;
      end;


      if not AtualizaVlHistorico(qryLeitura,True,'',7) then
      begin
         memResult.Lines.Add('   [ERRO  ] '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString                 +#13+#10+
                             '            [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryLeitura.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                             '            Erro na atualização da situação do aporte no histórico de contribuição.');
          
         balguma := True;
         bErro := True;
      end;


      pnlProgresso.Update;
      Application.ProcessMessages;
      frmDivergContrib.update;
      if bCancelaenvio then
      begin
         memResult.Lines.Add('***********************************');
         memResult.Lines.Add('Processo interrompido pelo usuário.');
         memResult.Lines.Add('***********************************');
         exit;
      end;
   end
   else begin
      memResult.Lines.Add('   [ERRO  ] '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString                 +#13+#10+
                          '            [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryLeitura.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                          '            Processo Cancelado pelo usuário.');
       
      exit;
   end;

   if not bErro then result := True;

end;

function TfrmDivergContrib.InsereAporte(qryLeitura: twwquery ; bindividual : boolean) :  Boolean;
var bErro : Boolean;
    i : Integer;
begin
   bErro := False;
   result := False;

   pnlProgresso.Update;

   if bIndividual then
   begin

      if dbgrdDivergAnalit.SelectedList.Count > 0 then
      begin
          
         gagProgresso.Progress := 0;
         gagProgresso.MaxValue := dbgrdDivergAnalit.SelectedList.Count;
         for i:= 0 to dbgrdDivergAnalit.SelectedList.Count-1 do
         begin
            dbgrdDivergAnalit.datasource.dataset.GotoBookmark(dbgrdDivergAnalit.SelectedList.items[i]);
            lblMsg2.Caption  := 'Matrícula : '+qryLeitura.FieldByName('MATRICULA').AsString+' ... ';
            if BuscaOpcoes(qryLeitura.FieldByName('FLGSITPART').AsString,
                       qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                       qryLeitura.FieldByName('MATRICULA').AsString,
                       qryLeitura.FieldByName('PLANPREV').AsString,
                       qryLeitura.FieldByName('PESSJUR').AsString,imodo,
                       qryLeitura.FieldByName('VALORESPERADO').AsFloat,
                       qryLeitura.FieldByName('VALORRECEBIDO').AsFloat)
            then begin
               if not CalculaAporte(qryLeitura) then bErro := True
            end//if buscaopcoes
            else begin
               balguma := True;
               bErro := True;
            end;
            gagProgresso.Progress := gagProgresso.Progress + 1;  
            gagProgresso.Update;                                 
            bAlguma := True;
         end;//for
      end
      else begin
          
         gagProgresso.Progress := 0;
         gagProgresso.MaxValue := 1;
         lblMsg2.Caption  := 'Matrícula : '+qryLeitura.FieldByName('MATRICULA').AsString+' ... ';
         if BuscaOpcoes(qryLeitura.FieldByName('FLGSITPART').AsString,
                    qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                    qryLeitura.FieldByName('MATRICULA').AsString,
                    qryLeitura.FieldByName('PLANPREV').AsString,
                    qryLeitura.FieldByName('PESSJUR').AsString,imodo,
                    qryLeitura.FieldByName('VALORESPERADO').AsFloat,
                    qryLeitura.FieldByName('VALORRECEBIDO').AsFloat)
         then
         begin
            if not CalculaAporte(qryLeitura) then bErro := True;

         end//if buscaopcoes
         else
         begin
            balguma := True;
            bErro := True;
         end;

         gagProgresso.Progress :=  gagProgresso.Progress +1 ;
         gagProgresso.Update;
         bAlguma := True;
      end;
   end//bindividual
   else begin
      if dbgrdDivergSintet.SelectedList.Count > 0 then
      begin
         for i:= 0 to dbgrdDivergSintet.SelectedList.Count-1 do
         begin
            dbgrdDivergSintet.datasource.dataset.GotoBookmark(dbgrdDivergSintet.SelectedList.items[i]);
            PreparaQrySintetica;
             
            gagProgresso.Progress := 0;
            gagProgresso.MaxValue := qryDivergSintetAux.RecordCount;
            qryDivergSintetAux.First;
            while not  qryDivergSintetAux.eof do
            begin
              lblMsg2.Caption  := 'Matrícula : '+qryLeitura.FieldByName('MATRICULA').AsString+' ... ';
              if BuscaOpcoes(qryLeitura.FieldByName('FLGSITPART').AsString,
                         qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                         qryLeitura.FieldByName('MATRICULA').AsString,
                         qryLeitura.FieldByName('PLANPREV').AsString,
                         qryLeitura.FieldByName('PESSJUR').AsString,imodo,
                         qryLeitura.FieldByName('VALORESPERADO').AsFloat,
                         qryLeitura.FieldByName('VALORRECEBIDO').AsFloat)
              then
              begin
                 if not CalculaAporte(qryLeitura) then bErro := True;
              end//if buscaopcoes
              else
              begin
                 balguma := True;
                 bErro := True;
              end;

              gagProgresso.Progress :=  gagProgresso.Progress +1 ;
              gagProgresso.Update;
              bAlguma := True;
              qryDivergSintetAux.next;
            end;
         end;//for
      end
      else begin
         PreparaQrySintetica;
          
         gagProgresso.Progress := 0;
         gagProgresso.MaxValue := qryDivergSintetAux.RecordCount;
         qryDivergSintetAux.First;
         while not  qryDivergSintetAux.eof do
         begin
           lblMsg2.Caption  := 'Matrícula : '+qryLeitura.FieldByName('MATRICULA').AsString+' ... ';
           if BuscaOpcoes(qryLeitura.FieldByName('FLGSITPART').AsString,
                      qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                      qryLeitura.FieldByName('MATRICULA').AsString,
                      qryLeitura.FieldByName('PLANPREV').AsString,
                      qryLeitura.FieldByName('PESSJUR').AsString,imodo,
                      qryLeitura.FieldByName('VALORESPERADO').AsFloat,
                      qryLeitura.FieldByName('VALORRECEBIDO').AsFloat)
           then
           begin
              if not CalculaAporte(qryLeitura) then bErro := True;
           end//if buscaopcoes
           else
           begin
              balguma := True;
              bErro := True;
           end;

           gagProgresso.Progress :=  gagProgresso.Progress +1 ;
           gagProgresso.Update;
           bAlguma := True;
           qryDivergSintetAux.next;
         end;
      end;

   end;//bindividual


   if not bErro then
   result := True;

end;


procedure TfrmDivergContrib.pmnuAdiconarDifClick(Sender: TObject);
var bErro : Boolean;
    //inicio André Oliveira SOL 172728 KINTANA 1556309
    sAnoMesCobrancaTela,
    sDataRecInicial,
    sDataRecFinal : string;
    iModoSelecionado : word;
    //fim André Oliveira SOL 172728 KINTANA 1556309
begin
    inherited;
    iModoSelecionado := ItemSelecionado; //André Oliveira SOL 172728 KINTANA 1556309

  // Inversao do preenchimento da variavel iModo para poder utiliza-la dentro
  // da PedeConfirma
  iModo := 7;

  If Not PedeConfirma Then Exit;


 bErro := False;
 PreparaTransacao('Adicionar diferença como Aporte...');

 if dbgrdDivergAnalit.visible then
 begin
    if not InsereAporte(qryDivergAnalit,True) then bErro := True;
 end
 else
 begin
    if not InsereAporte(qryDivergSintetAux,False) then bErro := True;
 end;

 //inicio André Oliveira SOL 172728 KINTANA 1556309
 sDataRecInicial := FormatDateTime('DD/MM/YYYY', cmdtDataReceInicial.Date);
 sDataRecFinal   := FormatDateTime('DD/MM/YYYY', cmdtDataReceFinal.date);
 sAnoMesCobrancaTela := FormaAnoMesTela(cmbMesRef, spedAnoRef);

 if  (iModoSelecionado in  [0,1,2,3,4])then
 begin
     if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas
     then begin
        if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                   '-Meses Até '+sDataRecInicial+ ' - Op : Adicionar como Aporte.'+
                                  '-'+BuscaFiltrosLog)
        then bErro := True;
     end
     else begin
        if not GravaLogTOTALPREV ('Tratamento de Divergência - Período de '+sDataRecInicial+' a '+sDataRecFinal+
                                  ' - Op : Adicionar como Aporte.'+
                                  '-'+BuscaFiltrosLog)
        then bErro := True;
     end;
 end
 else
 begin
     if chkTodasDiverg.Visible and chkTodasDiverg.Checked // Exibir Todas 
     then begin
        if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                  '-Meses Até '+sAnoMesCobrancaTela+ ' - Op : Adicionar como Aporte.'+
                                  '-'+BuscaFiltrosLog)
        then bErro := True;
     end
     else begin
        if not GravaLogTOTALPREV ('Tratamento de Divergência - Mês '+sAnoMesCobrancaTela+
                                  ' - Op : Adicionar como Aporte.'+
                                  '-'+BuscaFiltrosLog)
        then bErro := True;
     end;
 end;

 //fim André Oliveira SOL 172728 KINTANA 1556309
 TerminaTransacao('Adicionar diferença como Aporte',bErro,False);

end;

procedure TfrmDivergContrib.pmnuDevolveIgnoraClick(Sender: TObject);
var bErro : boolean;
    //inicio André Oliveira SOL 172728 KINTANA 1556309
    sAnoMesCobrancaTela,
    sDataRecInicial,
    sDataRecFinal : string;
    iModoSelecionado : word;
    //fim André Oliveira SOL 172728 KINTANA 1556309
begin
   inherited;
   iModoSelecionado := ItemSelecionado;  //André Oliveira SOL 172728 KINTANA 1556309;

  If qryDivergAnalit.FieldByName('VALORRECEBIDO').AsFloat = 0
   Then Begin
     MsgDlg('Não é possível IGNORAR A DIFERENÇA  de um valor recebido ZERADO.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
   End;
  

  // Inversao do preenchimento da variavel iModo para poder utiliza-la dentro
  // da PedeConfirma
  iModo := 8;

  If Not PedeConfirma Then Exit;

  if MsgDlg(' O valor RECEBIDO será aceito pelo sistema e o valor ESPERADO será igualado ao RECEBIDO. '+#13+
            ' Confirma ? ','Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrNo
  then Exit;


  bErro := False;

  PreparaTransacao('Ignorar diferença ...');

  if dbgrdDivergAnalit.visible
  then begin
     if not Ignora(qryDivergAnalit,True) then bErro := True;
  end
  else begin
     if not Ignora(qryDivergSintetAux,False) then bErro := True;
  end;

  //inicio André Oliveira SOL 172728 KINTANA 1556309
  sDataRecInicial := FormatDateTime('DD/MM/YYYY', cmdtDataReceInicial.Date);
  sDataRecFinal   := FormatDateTime('DD/MM/YYYY', cmdtDataReceFinal.date);
  sAnoMesCobrancaTela := FormaAnoMesTela(cmbMesRef, spedAnoRef);
  if not (iModoSelecionado in  [0,1,2,3,4])then
  begin
      if chkTodasDiverg.Visible and chkTodasDiverg.Checked
      then begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                   '-Meses Até '+sDataRecInicial+ ' - Op : Ignorar Diferença.' +
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end
      else begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência - Período de '+sDataRecInicial+' a '+sDataRecFinal+
                                   ' - Op : Ignorar Diferença.'+
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end;
  end
  else
  begin
      if chkTodasDiverg.Visible and chkTodasDiverg.Checked
      then begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência Individual-Matr:'+lsMatricula+
                                   '-Meses Até '+sAnoMesCobrancaTela+' - Op : Ignorar Diferença.' +
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end
      else begin
         if not GravaLogTOTALPREV ('Tratamento de Divergência - Mês '+sAnoMesCobrancaTela+
                                   ' - Op : Ignorar Diferença.'+
                                   '-'+BuscaFiltrosLog)
         then bErro := True;
      end;
  end;
   //fim André Oliveira SOL 172728 KINTANA 1556309

  TerminaTransacao('Ignorar diferença',bErro,False);
end;

function TfrmDivergContrib.Ignora(qryLeitura: twwquery ; bindividual : boolean) :  Boolean;
var bErro,
    bOk,A  : Boolean;
    i,sOpcao : Integer;
    cAux : char;
    valorreserva,rvalcota,ValCorr,ValCotasAdicionar,rValAdicionarCotas,reValReal :extended;
    mrResult : TModalResult;
    cValorAceito : char;
begin

   bErro := False;
   result := False;
   bAlgumIgnorar := True;

   pnlProgresso.Update;

    
   mrResult := MsgDlg('Para aceitar o valor RECEBIDO clique no botão SIM. '+#13+
                      'Para aceitar o valor ESPERADO clique no botão NÃO. '+#13+
                      'Para cancelar a operação clique no botão CANCELAR. ','Confirmação',mtConfirmation, [mbYes,mbNo,mbCancel],0);

   if mrResult = mrCancel
   then begin
      memResult.Lines.Add('***********************************');
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('***********************************');
      exit;
   end
   else if mrResult = mrYes
        then cValorAceito := 'R'
        else cValorAceito := 'E';

   if bIndividual
   then  begin
      if dbgrdDivergAnalit.SelectedList.Count > 0
      then begin
          
         gagProgresso.Progress := 0;
         gagProgresso.MaxValue := dbgrdDivergAnalit.SelectedList.Count;
         for i:= 0 to dbgrdDivergAnalit.SelectedList.Count-1 do
         begin
            dbgrdDivergAnalit.datasource.dataset.GotoBookmark(dbgrdDivergAnalit.SelectedList.items[i]);

            pnlProgresso.Update;
            Application.ProcessMessages;
            frmDivergContrib.update;
            if bCancelaenvio then
            begin
               memResult.Lines.Add('***********************************');
               memResult.Lines.Add('Processo interrompido pelo usuário.');
               memResult.Lines.Add('***********************************');
               exit;
            end;

            lblMsg2.Caption  := 'Matrícula : '+qryLeitura.FieldByName('MATRICULA').AsString+' ... ';
            bOk := BuscaOpcoes(qryLeitura.FieldByName('FLGSITPART').AsString,
                       qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                       qryLeitura.FieldByName('MATRICULA').AsString,
                       qryLeitura.FieldByName('PLANPREV').AsString,
                       qryLeitura.FieldByName('PESSJUR').AsString,imodo,
                       qryLeitura.FieldByName('VALORESPERADO').AsFloat,
                       qryLeitura.FieldByName('VALORRECEBIDO').AsFloat);

            if not bOk
            then begin
               bErro := True;
               continue;
            end;


            // Atualizar o valor no histórico e marcá-la como nao recalculada.
            // para no sair da tela perguntar se deseja recalcular o valor da
            // patrocinadora

            if cValorAceito = 'R'  
            then begin
               if not AtualizaVlHistorico(qryLeitura,False,' VALORESPERADO = VALORRECEBIDO, ', 8)
               then bErro := True;
            end
            else begin
               if not AtualizaVlHistorico(qryLeitura,False,' VALORRECEBIDO = VALORESPERADO,',  8)
               then bErro := True;
            end;

            gagProgresso.Progress := gagProgresso.Progress +1 ;
            gagProgresso.Update;

            bAlguma := True;
         end;//for
      end
      else begin
         pnlProgresso.Update;
         Application.ProcessMessages;
         frmDivergContrib.update;
         if bCancelaenvio
         then begin
            memResult.Lines.Add('***********************************');
            memResult.Lines.Add('Processo interrompido pelo usuário.');
            memResult.Lines.Add('***********************************');
            exit;
         end;
          
         gagProgresso.Progress := 0;
         gagProgresso.MaxValue := 1;

         lblMsg2.Caption  := 'Matrícula : '+qryLeitura.FieldByName('MATRICULA').AsString+' ... ';
         bOk := BuscaOpcoes(qryLeitura.FieldByName('FLGSITPART').AsString,
                        qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                        qryLeitura.FieldByName('MATRICULA').AsString,
                        qryLeitura.FieldByName('PLANPREV').AsString,
                        qryLeitura.FieldByName('PESSJUR').AsString,imodo,
                        qryLeitura.FieldByName('VALORESPERADO').AsFloat,
                        qryLeitura.FieldByName('VALORRECEBIDO').AsFloat);
         if bOK
         then begin
            if cValorAceito = 'R'  
            then begin
               if not AtualizaVlHistorico(qryLeitura,False,' VALORESPERADO = VALORRECEBIDO, ',8)
               then bErro := True;
            end
            else begin
               if not AtualizaVlHistorico(qryLeitura,False,' VALORRECEBIDO = VALORESPERADO, ',8)
               then bErro := True;
            end;

            bAlguma := True;
         end;

         gagProgresso.Progress :=  gagProgresso.Progress +1 ;
         gagProgresso.Update;

         bAlguma := True;
      end;
   end//bindividual
   else begin
      if dbgrdDivergSintet.SelectedList.Count > 0
      then begin
         for i:= 0 to dbgrdDivergSintet.SelectedList.Count-1 do
         begin
            dbgrdDivergSintet.datasource.dataset.GotoBookmark(dbgrdDivergSintet.SelectedList.items[i]);
            PreparaQrySintetica;
             
            gagProgresso.Progress := 0;
            gagProgresso.MaxValue := qryDivergSintetAux.RecordCount;
            while not  qryDivergSintetAux.eof do
            begin
               pnlProgresso.Update;
               Application.ProcessMessages;
               frmDivergContrib.update;
               if bCancelaenvio then
               begin
                  memResult.Lines.Add('***********************************');
                  memResult.Lines.Add('Processo interrompido pelo usuário.');
                  memResult.Lines.Add('***********************************');
                  exit;
               end;

               lblMsg2.Caption  := 'Matrícula : '+qryLeitura.FieldByName('MATRICULA').AsString+' ... ';
               bOk := BuscaOpcoes( qryLeitura.FieldByName('FLGSITPART').AsString,
                                   qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                                   qryLeitura.FieldByName('MATRICULA').AsString,
                                   qryLeitura.FieldByName('PLANPREV').AsString,
                                   qryLeitura.FieldByName('PESSJUR').AsString,imodo,
                                   qryLeitura.FieldByName('VALORESPERADO').AsFloat,
                                   qryLeitura.FieldByName('VALORRECEBIDO').AsFloat);
               if bOk
               then begin
                 if cValorAceito = 'R'  
                 then begin
                    if not AtualizaVlHistorico(qryLeitura,False,' VALORESPERADO = VALORRECEBIDO, ',8)
                    then bErro := True;
                 end
                 else begin
                    if not AtualizaVlHistorico(qryLeitura,False,' VALORRECEBIDO = VALORESPERADO, ',8)
                    then bErro := True;
                 end;
               end;

              gagProgresso.Progress :=  gagProgresso.Progress +1 ;
              gagProgresso.Update;

              bAlguma := True;

              qryDivergSintetAux.next;
            end;
         end;//for
      end
      else begin
         PreparaQrySintetica;
          
         gagProgresso.Progress := 0;
         gagProgresso.MaxValue := qryDivergSintetAux.RecordCount;
         while not  qryDivergSintetAux.eof do
         begin
           pnlProgresso.Update;
           Application.ProcessMessages;
           frmDivergContrib.update;
           if bCancelaenvio then
           begin
              memResult.Lines.Add('***********************************');
              memResult.Lines.Add('Processo interrompido pelo usuário.');
              memResult.Lines.Add('***********************************');
              exit;
           end;

           lblMsg2.Caption  := 'Matrícula : '+qryLeitura.FieldByName('MATRICULA').AsString+' ... ';
           bOk := BuscaOpcoes(qryLeitura.FieldByName('FLGSITPART').AsString,
                      qryLeitura.FieldByName('NOMEPARTICIP').AsString,
                      qryLeitura.FieldByName('MATRICULA').AsString,
                      qryLeitura.FieldByName('PLANPREV').AsString,
                      qryLeitura.FieldByName('PESSJUR').AsString,imodo,
                      qryLeitura.FieldByName('VALORESPERADO').AsFloat,
                      qryLeitura.FieldByName('VALORRECEBIDO').AsFloat);
           if bOK
           then begin
              if cValorAceito = 'R'  
              then begin
                 if not AtualizaVlHistorico(qryLeitura,False,' VALORESPERADO = VALORRECEBIDO,  ',8)
                 then bErro := True;
              end
              else begin
                 if not AtualizaVlHistorico(qryLeitura,False,' VALORRECEBIDO = VALORESPERADO, ',8)
                 then bErro := True;
              end;
           end;

           gagProgresso.Progress :=  gagProgresso.Progress +1 ;
           gagProgresso.Update;
           bAlguma := True;
           qryDivergSintetAux.next;
         end;
      end;
   end;//bindividual

   if not bErro
   then result := True;
end; // Ignora






function TfrmDivergContrib.GravaSituacao(qryLeitura : twwquery ; sidsitplanoprevdiverg : String) : Boolean;
begin
   result := False;

   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add(' UPDATE PARTPREVPLAN SET IDSITPLANOPREV = '+sidsitplanoprevdiverg+' '+
                  ' WHERE (IDPESSOA = '+qryLeitura.FieldByName('IDPESSOA').AsString+') '+
                  ' AND (IDPESSJUR = '+qryLeitura.FieldByName('IDPESSJUR').AsString+') '+
                  ' AND (IDPLANOPREV = '+qryLeitura.FieldByName('IDPLANOPREV').AsString+') '+
                  ' AND (SEQPROPOSTA = '+qryLeitura.FieldByName('SEQPROPOSTA').AsString+') ');
   try
      qryaux.execsql;
   except
      memResult.Lines.Add('   [ERRO  ] '+qryLeitura.FieldByName('MATRICULA').AsString+' - '+qryLeitura.FieldByName('NOMEPARTICIP').AsString                 +#13+#10+
                          '            [Mês:'+qryLeitura.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qryLeitura.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                          '            Erro na atualização da situação do participante no plano.');
       
      balguma := True;
      exit;
   end;

   result := True;
end;




procedure TfrmDivergContrib.DadosdoParticipante1Click(Sender: TObject);
begin
  inherited;
  If PedeConfirma Then Begin
   ConsPart1.MostraConsulta;
  End;
end;


procedure TfrmDivergContrib.ConsPart1Click(Sender: TObject);
begin
  inherited;
//
//código do componente
//
end;

procedure TfrmDivergContrib.BitBtn2Click(Sender: TObject);
begin
  inherited;
  RichEdAdaptacao.Lines.Text := memresult.Lines.Text;
  RichEdAdaptacao.Print('');
end;


//função com o objetivo de gerar as contribuições que
//por algum motivo não foram geradas pelo recebimento
//no interface, mas devem ser cobradas
{
-pegar todos os contribuintes ativos, verificando se estão
no histórico em um certo mês de referência onde outras
contribuições já foram geradas, verificando a periodicicadde
da contribuição
-inserir no histórico de contribuições
}
function TfrmDivergContrib.GeraContribNReceb(qrycontrib,qryaux : twwquery; smesref,sIdMotivo : String) : Boolean;
var sAnoMesHoje,
    sMesHoje,
    sAnoHoje,
    sDataRefInicio,
    sDataCobranca,
    sSitFundacao,
    sAnoMesCobranca,
    sDataRefFinal,
    sAnoMesFinal,
    sStrNumRecebimento,
    sDataRef,
    sSqlRegraAux,
    sValorRegra,
    sValorFinal,
    sAnoMesAtual,
    sSQLValues,
    sTipoPagto,
    sIdRegra,
    sDataCobrancaParaCalculo,
    sAnoMesCobrancaParaCalculo,
    sAnoMesCobrancaTela,
    sStringRegra ,
    sMesCalc: String;

    bErro,bErroRegra,bRegraPrimUltPagto : Boolean;

    iMes,
    iIdContribuicao,
    iUltDiaMes,
    iParcela,
    iNumRecebimento : Integer;

begin
   result := False;
   bErro := False;
   sTipoPagto := '';
   sIdRegra := '';

   qrycontrib.close;
   qrycontrib.sql.clear;
   qrycontrib.sql.add(
      ' SELECT CT.SEQPROPOSTA,CT.IDPESSOA, CT.IDPESSJUR, CT.IDPLANOPREV,                                  '+
      '        CV.IDRUBRICA , CV.IDRUBRICADEVOLUC , CV.IDRUBRICAATRASO, NVL(PT.SALMANTIDO,0) SALMANTIDO,  '+
      '        CT.UNIDNEGOC UNIDNEGOCCT, CT.CODPORTFORMA CODPORTFORMACT ,                                 '+
      '        CT.CODTIPRECDES CODTIPRECDESCT, CT.CODCENTRORESPON CODCENTRORESPONCT,                      '+
      '        CT.TIPCODIGO TIPCODIGOCT,CT.DATAINICIO, CT.DATAFINAL,                                      '+
      '        CT.CODTIPDOC CODTIPDOCCT, CT.IDEMPRESAPROP IDEMPRESAPROPCT,                                '+
      '        CV.UNIDNEGOC UNIDNEGOCCV, CV.CODPORTFORMA CODPORTFORMACV , CV.TIPCODIGO TIPCODIGOCV,       '+
      '        CV.CODTIPRECDES CODTIPRECDESCV, CV.CODCENTRORESPON CODCENTRORESPONCV,                      '+
      '        CV.CODTIPDOC CODTIPDOCCV, CV.IDEMPRESAPROP IDEMPRESAPROPCV, CT.DATAINICIO,                 '+
      '        SIT.FLGINTERNO FLGSITPART , PE.NOME PESSOA , CO.NOME CONTRIB, PESSJUR.NOME PESSJUR,        '+
      '        PV.NOME PLANPREV, CV.IDREGRACALCULO, CV.IDREGRAPRIMPAGTO, CV.IDREGRAULTPAGTO,              '+
      '        CT.FLGDESCFOLHA, CT.VALORBASE1, VALORBASE2, VALORBASE3, CO.IDCONTRIBUICAO,                 '+
      '        PF.DATANASC , PT.INSCRICAODATA, PT.IDSITPART,                                              '+
      '        EL.MATRICULA, CO.NOMERESUM, PE.NOME AS NOMEPARTICIP                                        '+
      ' FROM   PESSOA PE, PESSOA PESSJUR, PESSOAFISICA PF, SITPART SIT,TPPERIODICIDADE P,                 '+
      '        CONTRIBUICAO CO, PLANPREV PV, CONTPREV CV,                                                 '+
      '        CONTRIBPREVPARTP CT,  ELEGPATRO EL, PARTPREVPLAN PT                                        '+
      ' WHERE (PT.IDPESSOA    = CT.IDPESSOA)                                                              '+
      ' AND   (PT.IDPESSOA    = PE.IDPESSOA)                                                              '+
      ' AND   (PT.IDPESSJUR   = PESSJUR.IDPESSOA)                                                         '+
      ' AND   (PT.IDPESSJUR   = CT.IDPESSJUR)                                                             '+
      ' AND   (PT.IDPLANOPREV = CT.IDPLANOPREV)                                                           '+
      ' AND   (PT.SEQPROPOSTA = CT.SEQPROPOSTA)                                                           '+
      ' AND   (PF.IDPESSOA(+) = PT.IDPESSOA)                                                              '+
      ' AND   (PV.IDPLANOPREV = CT.IDPLANOPREV)                                                           '+
      ' AND   (PT.IDSITPART   = SIT.IDSITPART)                                                            '+
      ' AND   (EL.IDPESSJUR   = PT.IDPESSJUR)                                                             '+
      ' AND   (EL.IDPESSOA    = PT.IDPESSOA)                                                              ');

      if Trim(strPatroDiverg) <> ''
      then qrycontrib.sql.add(' AND (PT.IDPESSJUR IN ('+strPatroDiverg+')) ');

      if Trim(strSITUACAODiverg) <> ''
      then qrycontrib.sql.add(' AND (SIT.FLGINTERNO IN ('+strSITUACAODiverg+')) ');

   qrycontrib.sql.add(
      ' AND (CT.FLGCOBRA = 1)                                                                             '+
      ' AND (CT.IDPESSOA||CT.SEQPROPOSTA||CT.IDCONTRIBUICAO||CT.IDPLANOPREV||CT.IDPESSJUR                 '+
      ' NOT IN                                                                                            '+
      ' (SELECT IDPESSOA||SEQPROPOSTA||IDCONTRIBUICAO||IDPLANOPREV||IDPESSJUR                             '+
      '  FROM HSTCONTRIBPREV                                                                              '+
      '  WHERE (MESREFERENCIA = '''+smesref+''')                                                          '+
      '  AND (IDPESSOA =CT.IDPESSOA)                                                                      '+
      '  AND (SEQPROPOSTA = CT.SEQPROPOSTA)                                                               '+
      '  AND (IDPLANOPREV = CT.IDPLANOPREV)                                                               '+
      '  AND (IDCONTRIBUICAO = CT.IDCONTRIBUICAO)                                                         '+
      '  AND (IDPESSJUR = CT.IDPESSJUR) ))                                                                '+
      '  AND (CT.IDPESSJUR||CT.IDPLANOPREV||CT.IDCONTRIBUICAO                                             '+
      '  IN                                                                                               '+
      '  (SELECT IDPESSJUR||IDPLANOPREV||IDCONTRIBUICAO                                                   '+
      '   FROM HSTCONTRIBPREV                                                                             '+
      '   WHERE (MESREFERENCIA = '''+smesref+''')                                                         '+
      '   AND (IDPLANOPREV = CT.IDPLANOPREV)                                                              '+
      '   AND (IDCONTRIBUICAO = CT.IDCONTRIBUICAO)                                                        '+
      '   AND (IDPESSJUR = CT.IDPESSJUR) ))                                                               '+
      '  AND (CO.IDCONTRIBUICAO = CT.IDCONTRIBUICAO)                                                      '+
      '  AND (CT.IDCONTRIBUICAO = CV.IDCONTRIBUICAO)                                                      '+
      '  AND (P.IDTPPERIODICIDADE = CO.IDTPPERIODICIDADE)                                                 '+
      '  AND (CT.IDPLANOPREV = CV.IDPLANOPREV)                                                            '+
      '  AND (CT.DATAINICIO <= TO_DATE('''+smesref+''',''YYYY/MM''))                                      ');
   qrycontrib.open;

   if qrycontrib.isempty then
   begin
      result := True;
      exit;
   end;

   pnlProgresso.Update;
   Application.ProcessMessages;
   frmDivergContrib.update;
   if bCancelaenvio then
   begin
      memResult.Lines.Add('***********************************');
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('***********************************');
      exit;
   end;


   // Preencher datas
   sAnoMesHoje := copy(datetostr(date),7,4)+'/'+copy(datetostr(date),4,2);
   sMesHoje    := Copy(sAnoMesHoje,6,2);
   sAnoHoje    := Copy(sAnoMesHoje,1,4);

   // Preencher data da cobranca da contribuicao
   if qrycontrib.FieldByName('flgsitpart').AsString = 'AS' then
   begin
      sDataCobranca   := CriticaDataCobrancaSit(dtmAPrev.qry,inttostr(sistema.idempresa),
                                               qrycontrib.FieldByName('idplanoprev').AsString,
                                               qrycontrib.FieldByName('flgsitpart').AsString, 'N',
                                               sMesHoje, sAnoHoje);
   end
   else
   begin
      sDataCobranca   := CriticaDataCobrancaSit(dtmAPrev.qry,qrycontrib.FieldByName('idpessjur').AsString,
                                               qrycontrib.FieldByName('idplanoprev').AsString,
                                               qrycontrib.FieldByName('flgsitpart').AsString, 'N',
                                               sMesHoje, sAnoHoje);
   end;

   sAnoMesCobranca := Copy(sDataCobranca,7,4)+'/'+Copy(sDataCobranca,4,2);


   if copy(smesref,6,2) = '13' then
   sMesCalc := copy(smesref,1,5)+'12'
   else sMesCalc := smesref;

   if qrycontrib.FieldByName('flgsitpart').AsString = 'AS' then
   begin
      sDataCobrancaParaCalculo   := CriticaDataCobrancaSit(dtmAPrev.qry,inttostr(sistema.idempresa),
                                              qrycontrib.FieldByName('idplanoprev').AsString,
                                              qrycontrib.FieldByName('flgsitpart').AsString, 'N',
                                              Copy(sMesCalc,6,2), Copy(sAnoMesHoje,1,4));
   end
   else
   begin
      sDataCobrancaParaCalculo   := CriticaDataCobrancaSit(dtmAPrev.qry,qrycontrib.FieldByName('idpessjur').AsString,
                                              qrycontrib.FieldByName('idplanoprev').AsString,
                                              qrycontrib.FieldByName('flgsitpart').AsString, 'N',
                                              Copy(sMesCalc,6,2), Copy(sAnoMesHoje,1,4));
   end;

   sAnoMesCobrancaParaCalculo := Copy(sDataCobrancaParaCalculo,7,4)+'/'+Copy(sDataCobrancaParaCalculo,4,2);


   sAnoMesAtual       := sAnoMesHoje;
   iMes               := StrToInt(Copy(sAnoMesAtual,6,2));
   sStrNumRecebimento := '';

   gagProgresso.Progress := 0;
   gagProgresso.MaxValue := qryContrib.RecordCount;

   // A qry está com as contribuicoes da CONTRIBPREVPARTP que devem
   // ser preparadas
   qryContrib.First;
   while not qryContrib.eof do
   begin

      lblMsg2.Caption  := 'Matrícula : '+qrycontrib.FieldByName('MATRICULA').AsString+' ... ';
      // Preencher variavel mes atual com o mes que esta sendo preparado no loop
      sAnoMesAtual:= sAnoMesHoje;
      sValorFinal := '0';
      bRegraPrimUltPagto := False;

      iIdContribuicao  := qryContrib.FieldByName('IdContribuicao').AsInteger;
      sIdRegra  := qryContrib.FieldByName('IdRegraCalculo').AsString;
      sTipoPagto := 'N';

      if sIdRegra = '' then
      begin
         memResult.Lines.Add('   [ERRO  ] '+qrycontrib.FieldByName('MATRICULA').AsString+' - '+qrycontrib.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                             '            [Mês:'+qrycontrib.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qrycontrib.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                             '            Regra de Cálculo da Contribuição não encontrada ');

          
         bErro := True;
         balguma := True;
         gagProgresso.Progress :=  gagProgresso.Progress +1 ;
         gagProgresso.Update;
         qrycontrib.next;
         continue;
      end;


      iUltDiaMes := TrazUltDiaMes(StrToInt(copy(sAnoMesCobrancaParaCalculo,6,2)),(StrToInt(copy(sAnoMesCobrancaParaCalculo,1,4))));
      sDataRef := IntToStr(iUltDiaMes) + '/' + copy(sAnoMesCobrancaParaCalculo,6,2) + '/' + copy(sAnoMesCobrancaParaCalculo,1,4);
      sSQLRegraAux := MontaSQLContribNOVA(qrycontrib.FieldByName('idpessjur').AsInteger,
                             qrycontrib.FieldByName('idplanoprev').AsInteger,
                             qrycontrib.FieldByName('idpessoa').AsInteger,
                             qrycontrib.FieldByName('seqproposta').AsInteger,
                             qrycontrib.FieldByName('idcontribuicao').AsInteger,
                             strtoint(sIdMotivo),
                             qrycontrib.FieldByName('flgsitpart').AsString,
                             sAnoMesAtual,
                             sDataRef,
                             sValorFinal,
                             qryContrib.FieldByName('InscricaoData').AsString,
                             qryContrib.FieldByName('DataNasc').AsString,sTipoPagto,
                             'HSTCONTRIBPREV','VALORESPERADO','',
                             qryContrib.FieldByName('Idsitpart').AsString,'','',0,-1,
                             sAnoMesCobranca,0 ); // PROVISORIO

      pnlProgresso.Update;
      Application.ProcessMessages;
      frmDivergContrib.update;
      if bCancelaenvio then
      begin
         memResult.Lines.Add('***********************************');
         memResult.Lines.Add('Processo interrompido pelo usuário.');
         memResult.Lines.Add('***********************************');
         exit;
      end;

      // Chamar regra
      try
         sValorRegra := RegraNumerica(sIdRegra, sSQLRegraAux,bErroRegra,iIdCalculoGeral);
      except
      end;

      if bErroRegra
      then begin
         memResult.Lines.Add('   [ERRO  ] '+qrycontrib.FieldByName('MATRICULA').AsString+' - '+qrycontrib.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                             '            [Mês:'+qrycontrib.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qrycontrib.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                             '            Erro na execução da regra de cálculo');
         bErro := True;
         bAlguma := True;

         gagProgresso.Progress :=  gagProgresso.Progress +1 ;
         gagProgresso.Update;
         qrycontrib.next;
         continue;
      end
      else if sValorRegra = ''
           then begin
              memResult.Lines.Add('   [ERRO  ] '+qrycontrib.FieldByName('MATRICULA').AsString+' - '+qrycontrib.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                                  '            [Mês:'+qrycontrib.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qrycontrib.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                  '            A regra de cálculo retornou um valor em branco ');
              bErro := True;
              bAlguma := True;

              gagProgresso.Progress :=  gagProgresso.Progress +1 ;
              gagProgresso.Update;
              qrycontrib.next;
              continue;
           end
      else if (sValorRegra = '0') or (sValorRegra = '0.00')
           then begin
              memResult.Lines.Add('   [ERRO  ] '+qrycontrib.FieldByName('MATRICULA').AsString+' - '+qrycontrib.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                                  '            [Mês:'+qrycontrib.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qrycontrib.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                  '            A regra de cálculo retornou um valor igual a ZERO.');
              bErro := True;
               bAlguma := True;

              gagProgresso.Progress :=  gagProgresso.Progress +1 ;
              gagProgresso.Update;
              qrycontrib.next;
              continue;
           end;

      sValorFinal := OraNumero(sValorRegra);

      if StrToFloat(ClienteNumero(sValorRegra)) >= 0
      then sValorFinal := sValorRegra;


      // Verificar se é o primeiro ou ultimo pagamento
      if (sAnoMesCobrancaParaCalculo <=
          copy(qrycontrib.FieldByName('DATAINICIO').AsString,7,4)+'/'+
          copy(qrycontrib.FieldByName('DATAINICIO').AsString,4,2)) and
         (qrycontrib.FieldByName('IDREGRAPRIMPAGTO').AsString <> '')
      then begin
         sTipoPagto := 'P';
         sIdregra :=  qrycontrib.FieldByName('IDREGRAPRIMPAGTO').AsString;
         bRegraPrimUltPagto := True;
      end;


      if (sAnoMesCobrancaParaCalculo =
              copy(qrycontrib.FieldByName('DATAFINAL').AsString,7,4)+'/'+
              copy(qrycontrib.FieldByName('DATAFINAL').AsString,4,2)) and
              (qrycontrib.FieldByName('IDREGRAULTPAGTO').AsString <> '') and
              (qrycontrib.FieldByName('IDREGRAULTPAGTO').AsString <> '')
      then begin
         sTipoPagto := 'U';
         sIdregra :=  qrycontrib.FieldByName('IDREGRAULTPAGTO').AsString;
         bRegraPrimUltPagto := True;
      end;


      //se for primeiro ou última contribuicão
      if bRegraPrimUltPagto then
      begin

         if uppercase(sTipoPagto) = 'P' then
         sStringRegra := 'Primeiro Pagamento'
         else if uppercase(sTipoPagto) = 'U' then
         sStringRegra := 'Último Pagamento';

         if sIdRegra = '' then
         begin
              memResult.Lines.Add('   [ERRO  ] '+qrycontrib.FieldByName('MATRICULA').AsString+' - '+qrycontrib.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                                  '            [Mês:'+qrycontrib.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qrycontrib.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                  '            Regra de '+sStringRegra+' não encontrada. ');
            bErro := True;
            balguma := True;

            gagProgresso.Progress :=  gagProgresso.Progress +1 ;
            gagProgresso.Update;

            qrycontrib.next;
            continue;
         end;


         sSQLRegraAux := MontaSQLContribNOVA(qrycontrib.FieldByName('idpessjur').AsInteger,
                         qrycontrib.FieldByName('idplanoprev').AsInteger,
                         qryContrib.FieldByName('IdPessoa').AsInteger,
                         qryContrib.FieldByName('SeqProposta').AsInteger,
                         qryContrib.FieldByName('IdContribuicao').AsInteger,
                         strtoint(sIdMotivo),
                         qrycontrib.FieldByName('flgsitpart').AsString,
                         sAnoMesAtual,
                         sDataRef, sValorFinal,
                         qryContrib.FieldByName('InscricaoData').AsString,
                         qryContrib.FieldByName('DataNasc').AsString,sTipoPagto,
                         'HSTCONTRIBPREV','VALORESPERADO','',
                         qryContrib.FieldByName('Idsitpart').AsString,
                         qryContrib.FieldByName('DATAINICIO').AsString,
                         qryContrib.FieldByName('DATAFINAL').AsString,
                         0,-1,sAnoMesCobranca,0); // PROVISORIO


         pnlProgresso.Update;
         Application.ProcessMessages;
         frmDivergContrib.update;
         if bCancelaenvio then
         begin
            memResult.Lines.Add('***********************************');
            memResult.Lines.Add('Processo interrompido pelo usuário.');
            memResult.Lines.Add('***********************************');
            exit;
         end;


         // Chamar regra
         try
            sValorRegra := RegraNumerica(sIdRegra, sSQLRegraAux,bErroRegra,iIdCalculoGeral);
         except
         end;

         if bErroRegra
         then begin
            memResult.Lines.Add('   [ERRO  ] '+qrycontrib.FieldByName('MATRICULA').AsString+' - '+qrycontrib.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                                '            [Mês:'+qrycontrib.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qrycontrib.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                '            Erro na execução da regra de cálculo  ');

            bErro := True;
            bAlguma := True;

            gagProgresso.Progress :=  gagProgresso.Progress +1 ;
            gagProgresso.Update;
            qrycontrib.next;
            continue;
         end
         else if sValorRegra = ''
              then begin
                 memResult.Lines.Add('   [ERRO  ] '+qrycontrib.FieldByName('MATRICULA').AsString+' - '+qrycontrib.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                                     '            [Mês:'+qrycontrib.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qrycontrib.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                     '            A regra de cálculo retornou um valor em branco ');
                 bErro := True;
                 bAlguma := True;

                 gagProgresso.Progress :=  gagProgresso.Progress +1 ;
                 gagProgresso.Update;
                 qrycontrib.next;
                 continue;
              end
         else if (sValorRegra = '0') or (sValorRegra = '0.00')
              then begin
                 memResult.Lines.Add('   [ERRO  ] '+qrycontrib.FieldByName('MATRICULA').AsString+' - '+qrycontrib.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                                     '            [Mês:'+qrycontrib.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qrycontrib.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                     '            A regra de cálculo retornou um valor igual a ZERO.');
                 bErro := True;
                  bAlguma := True;

                 gagProgresso.Progress :=  gagProgresso.Progress +1 ;
                 gagProgresso.Update;
                 qrycontrib.next;
                 continue;
              end;

         sValorFinal := OraNumero(sValorRegra);

         if StrToFloat(ClienteNumero(sValorRegra)) >= 0
         then sValorFinal := sValorRegra;

      end;//fim (cobrança PRIMEIRO / ÚLTIMO )

      // Gerar numero do recebimento
      iNumRecebimento := LeUltRegistro(dtmAPrev.qry, 'HSTCONTRIBPREV');

      // Calcular número da parcela
      iParcela := CalculaNumParcela(sAnoMesAtual,
                               qryContrib.FieldByName('Idpessjur').AsInteger,
                               qryContrib.FieldByName('idplanoprev').AsInteger,
                               qryContrib.FieldByName('IdPessoa').AsInteger,
                               qryContrib.FieldByName('SeqProposta').AsInteger,
                               qryContrib.FieldByName('IdContribuicao').AsInteger);
      if iParcela < 0 then iParcela := 0;

      pnlProgresso.Update;
      Application.ProcessMessages;
      frmDivergContrib.update;
      if bCancelaenvio then
      begin
         memResult.Lines.Add('***********************************');
         memResult.Lines.Add('Processo interrompido pelo usuário.');
         memResult.Lines.Add('***********************************');
         exit;
      end;

      // Inserir valor final na HSTCONTRIBPREV
      with dtmAPrev.qry do
      begin
         sSQLValues := ''''+sAnoMesAtual+''''; // MESREFERENCIA
         sSQLValues := sSQLValues+','''+sAnoMesCobranca+'''';
         sSQLValues := sSQLValues+',' +IntToStr(iNumRecebimento);
         sSQLValues := sSQLValues+',' +sIdMotivo;
         if (Trim(qryContrib.FieldByName('CodPortFormacv').AsString) <> '') and
            (qryContrib.FieldByName('CodPortFormacv').AsInteger > 0)
         then sSQLValues := sSQLValues+', ' +qryContrib.FieldByName('CodPortFormacv').AsString
            else if (Trim(qryContrib.FieldByName('CodPortFormact').AsString) <> '') and
                    (qryContrib.FieldByName('CodPortFormact').AsInteger > 0)
            then sSQLValues := sSQLValues+', ' +qryContrib.FieldByName('CodPortFormact').AsString
               else sSQLValues := sSQLValues+', NULL ';
         sSQLValues := sSQLValues+', TO_DATE('''+sDataCobranca+''',''DD/MM/YYYY'') ';//DATAPREVISAORECE
         sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);//VALORESPERADO
         sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);//VALORCALCULADO
         sSQLValues := sSQLValues+', '+qrycontrib.FieldByName('IdRegraCalculo').AsString;
         sSQLValues := sSQLValues+', '+qryContrib.FieldByName('FlgDescFolha').AsString;
         sSQLValues := sSQLValues+', '+qryContrib.FieldByName('IdPessoa').AsString;
         sSQLValues := sSQLValues+', '+qryContrib.FieldByName('SeqProposta').AsString;
         sSQLValues := sSQLValues+', '+qryContrib.FieldByName('idpessjur').AsString;
         sSQLValues := sSQLValues+', '+qryContrib.FieldByName('idplanoprev').AsString;
         sSQLValues := sSQLValues+', '+qryContrib.FieldByName('IdContribuicao').AsString;
         sSQLValues := sSQLValues+', 0'; //FLGCALCRESERVA
         if Trim(qryContrib.FieldByName('ValorBase1').AsString) <> ''
         then sSQLValues := sSQLValues+', '+OraNumero(qryContrib.FieldByName('ValorBase1').AsString)
         else sSQLValues := sSQLValues+', NULL ';

         if Trim(qryContrib.FieldByName('ValorBase2').AsString) <> ''
         then sSQLValues := sSQLValues+', '+OraNumero(qryContrib.FieldByName('ValorBase2').AsString)
         else sSQLValues := sSQLValues+', NULL ';

         if Trim(qryContrib.FieldByName('ValorBase3').AsString) <> ''
         then sSQLValues := sSQLValues+', '+OraNumero(qryContrib.FieldByName('ValorBase3').AsString)
         else sSQLValues := sSQLValues+', NULL ';

         if Trim(qryContrib.FieldByName('DATAINICIO').AsString) <> ''
         then sSQLValues := sSQLValues+', TO_DATE('''+qryContrib.FieldByName('DataInicio').AsString+''',''DD/MM/YYYY'') '
         else sSQLValues := sSQLValues+', NULL ';

         if Trim(qryContrib.FieldByName('DATAFINAL').AsString) <> ''
         then sSQLValues := sSQLValues+', TO_DATE('''+qryContrib.FieldByName('DataFINAL').AsString+''',''DD/MM/YYYY'') '
         else sSQLValues := sSQLValues+', NULL ';

         sSQLValues := sSQLValues+', '''+qrycontrib.FieldByName('flgsitpart').AsString+''' ';       //FLGSITFUNDACAO
         sSQLValues := sSQLValues+', ''0'' ';//SITRECEBIMENTO
         sSQLValues := sSQLValues+', ''F''';   //TIPO

         sSQLValues := sSQLValues+', NULL'  ;         //IDLOTE
         sSQLValues := sSQLValues+', '+IntToStr(iParcela);        //PARCELA

         Close;
         SQL.Clear;
         SQL.Add(' INSERT INTO HSTCONTRIBPREV (MESREFERENCIA,MESCOBRANCA,NUMRECEBIMENTO,IDMOTIVO,'+
                 '                             CODPORTFORMA,DATAPREVISAORECE,'+
                 '                             VALORESPERADO,VALORCALCULADO,IDREGRACALCULO, '+
                 '                             FLGDESCFOLHA,IDPESSOA,SEQPROPOSTA,IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
                 '                             FLGCALCRESERVA,VALOROP1,VALOROP2,VALOROP3,DATAINICIO,DATAFINAL,         '+
                 '                             FLGSITFUNDACAO,SITRECEBIMENTO,TIPO,IDLOTE,PARCELA) '+
                 ' VALUES('+sSQLValues+')');
         try
            Execsql;
            bAlguma := True;
          except
            memResult.Lines.Add('   [ERRO  ] '+qrycontrib.FieldByName('MATRICULA').AsString+' - '+qrycontrib.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                                '            [Mês:'+qrycontrib.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qrycontrib.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                '            Erro na gravação da contribuição no histórico  ');

            bErro := True;

            gagProgresso.Progress :=  gagProgresso.Progress +1 ;
            gagProgresso.Update;
            qrycontrib.next;
            continue;
         end;
      end;//with

      pnlProgresso.Update;
      Application.ProcessMessages;
      frmDivergContrib.update;
      if bCancelaenvio then
      begin
         memResult.Lines.Add('***********************************');
         memResult.Lines.Add('Processo interrompido pelo usuário.');
         memResult.Lines.Add('***********************************');
         exit;
      end;

      if sTipoPagto = 'U'
      then begin
         if not EncerraCobrancaContrib(qryContrib.FieldByName('idpessjur').AsInteger,
                                       qryContrib.FieldByName('idplanoprev').AsInteger,
                                       qryContrib.FieldByName('IdPessoa').AsInteger,
                                       qryContrib.FieldByName('SeqProposta').AsInteger,
                                       qryContrib.FieldByName('IdContribuicao').AsInteger)
         then begin
            memResult.Lines.Add('   [ERRO  ] '+qrycontrib.FieldByName('MATRICULA').AsString+' - '+qrycontrib.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                                '            [Mês:'+qrycontrib.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qrycontrib.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                                '            Erro no Encerramento da Cobrança da Contribuição ');

            bErro    := True;

            gagProgresso.Progress :=  gagProgresso.Progress +1 ;
            gagProgresso.Update;
            qrycontrib.next;
            continue;
         end;
      end;


      if not AtualizaUltMesPREPARO(sAnoMesFinal, qryContrib.FieldByName('idpessjur').AsInteger,
                                   qryContrib.FieldByName('idplanoprev').AsInteger,
                                   qryContrib.FieldByName('IdPessoa').AsInteger,
                                   qryContrib.FieldByName('SeqProposta').AsInteger,
                                   qryContrib.FieldByName('IdContribuicao').AsInteger)
      then begin
         memResult.Lines.Add('   [ERRO  ] '+qrycontrib.FieldByName('MATRICULA').AsString+' - '+qrycontrib.FieldByName('NOMEPARTICIP').AsString                +#13+#10+
                             '            [Mês:'+qrycontrib.FieldByName('MESREFERENCIA').AsString+'-Contrib:'+qrycontrib.FieldByName('NOMERESUM').AsString+'] '+#13+#10+
                             '            Erro na gravação do Último Mês de Preparo.  ');
         bErro    := True;
      end;


      gagProgresso.Progress :=  gagProgresso.Progress +1 ;
      gagProgresso.Update;
      qrycontrib.next;
   end;//while
   if not bErro then result := True;
end;


procedure TfrmDivergContrib.Preparo1Click(Sender: TObject);
var bErro : Boolean;
    sAno , sMesReferencia ,sAnoMesReferencia: String;
begin
  inherited;
  If Not PedeConfirma Then Exit;
end;



//função que marca o flg de devedor no previdenciário
//caso o recebimento de um lote já tenha sido feito e
//não tenha se procesado o recebimento de uma certa contribuição
//ou esta seja recebida com divergência(para menor)
//e em ambos os casos a data de vencimento já tenham passado
function TfrmDivergContrib.MarcaDevedoresAdmPrev( qryhistorico , qryaux : twwquery) : Boolean;
var bErro : Boolean;
begin
   result := False;
   bErro := False;
   lblMsg2.Caption := '';

   lblMsg1.Caption := 'Atualizando Participantes sem Dívida...';
   pnlProgresso.Update;

   //zera todas as marcações de dívida
   qryaux.close;
   qryaux.SQL.clear;
   qryaux.sql.add(' UPDATE PARTPREVPLAN SET FLGDEVEPREVIDENC = 0 ');
   try
      qryaux.execsql;
   except
      memResult.Lines.Add('   [ERRO  ] Erro na atualização dos participantes sem dívida');
      bErro := True;
   end;

   pnlProgresso.Update;
   Application.ProcessMessages;
   frmDivergContrib.update;
   if bCancelaenvio then
   begin
      memResult.Lines.Add('***********************************');
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('***********************************');
      exit;
   end;

   lblMsg1.Caption := 'Buscando Participantes com Dívida...';
   pnlProgresso.Update;

   qryhistorico.close;
   qryhistorico.sql.clear;
   qryhistorico.sql.add(' SELECT DISTINCT HSTCONTRIBPREV.IDPESSOA, HSTCONTRIBPREV.IDPLANOPREV, '+
                        ' HSTCONTRIBPREV.IDPESSJUR, HSTCONTRIBPREV.SEQPROPOSTA, P.NOME, TMPDESC.MATRICULA '+
                        ' FROM PESSOA P,HSTCONTRIBPREV, TMPDESC '+
                        ' WHERE (HSTCONTRIBPREV.NUMRECEBIMENTO = TMPDESC.NODOCUMENTO) '+
                        ' AND (TMPDESC.IDTITULAR = P.IDPESSOA) '+
                        ' AND (TMPDESC.IDTITULAR = HSTCONTRIBPREV.IDPESSOA) '+
                        ' AND (TMPDESC.IDPLANOPREV = HSTCONTRIBPREV.IDPLANOPREV) '+
                        ' AND (TMPDESC.IDPESSJUR = HSTCONTRIBPREV.IDPESSJUR) '+
                        ' AND (TMPDESC.IDLOTE = HSTCONTRIBPREV.IDLOTE) '+
                        ' AND (TMPDESC.SITENVIO = ''1'' OR SITENVIO = ''3'') '+
                        //verifica que a data do vencimento já passou
                        ' AND (TMPDESC.DATACOBRANCA < SYSDATE) '+
                        //verifica que já foi feito recebimento do lote
                        ' AND (0 <(SELECT COUNT(H.IDPESSOA) FROM HSTCONTRIBPREV H '+
                        ' WHERE IDLOTE = HSTCONTRIBPREV.IDLOTE AND H.SITRECEBIMENTO <> ''1'')) '+
                        //verifica se o valor recebido é menor que o esperado
                        ' AND (NVL(HSTCONTRIBPREV.VALORRECEBIDO,0) < HSTCONTRIBPREV.VALORESPERADO)');
   try
      qryhistorico.open;
   except
      memResult.Lines.Add('   [ERRO  ] Erro na abertura da consulta dos Participantes com dívida');

      bErro := True;
      exit;
   end;


   qryhistorico.first;


   pnlProgresso.Update;
   Application.ProcessMessages;
   frmDivergContrib.update;
   if bCancelaenvio then
   begin
      memResult.Lines.Add('***********************************');
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('***********************************');
      exit;
   end;

   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add(' UPDATE PARTPREVPLAN SET FLGDEVEPREVIDENC = 1 '+
                  ' WHERE (IDPESSOA = :IDPESSOA) '+
                  ' AND (IDPESSJUR = :IDPESSJUR) '+
                  ' AND (IDPLANOPREV = :IDPLANOPREV) '+
                  ' AND (SEQPROPOSTA = :SEQPROPOSTA) ');

   lblMsg1.Caption := 'Atualizando Situação dos Participantes...';
   pnlProgresso.Update;

   while not qryhistorico.eof do
   begin
      qryaux.parambyname('IDPESSOA').AsString := qryhistorico.FieldByName('IDPESSOA').AsString;
      qryaux.parambyname('IDPESSJUR').AsString := qryhistorico.FieldByName('IDPESSJUR').AsString;
      qryaux.parambyname('IDPLANOPREV').AsString := qryhistorico.FieldByName('IDPLANOPREV').AsString;
      qryaux.parambyname('SEQPROPOSTA').AsString := qryhistorico.FieldByName('SEQPROPOSTA').AsString;
      try
         qryaux.execsql;
      except
         memResult.Lines.Add('   [ERRO  ] '+qryhistorico.FieldByName('MATRICULA').AsString+' - '+qryhistorico.FieldByName('NOME').AsString                +#13+#10+
                             '            Erro na Atualização da Situação do Participante com Dívida. ');

         bErro := True;
      end;


      pnlProgresso.Update;
      Application.ProcessMessages;
      frmDivergContrib.update;
      if bCancelaenvio then
      begin
         memResult.Lines.Add('***********************************');
         memResult.Lines.Add('Processo interrompido pelo usuário.');
         memResult.Lines.Add('***********************************');
         exit;
      end;

      balguma := True;
      qryhistorico.next;
   end;//while

   if not bErro then result := True;
end;

procedure TfrmDivergContrib.VerificarParticipantesDevedores1Click(
  Sender: TObject);

var bErro : Boolean;
begin
  inherited;
  If Not PedeConfirma Then Exit;

  bErro := False;
  bAlguma := False;


  PreparaTransacao('Verifica Participantes com Dívida Previdenciária...');

  pnlProgresso.Update;
  Application.ProcessMessages;
  frmDivergContrib.update;
  if bCancelaenvio then
  begin
     memResult.Lines.Add('***********************************');
     memResult.Lines.Add('Processo interrompido pelo usuário.');
     memResult.Lines.Add('***********************************');
     exit;
  end;

  if not MarcaDevedoresAdmPrev(qrycontribaux,qryaux)
  then bErro := True;

  TerminaTransacao('Verificação dos Participantes com Dívida Previdenciária.',bErro,False);

end;

procedure TfrmDivergContrib.qryDivergAnalitAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dbgrdDivergAnalit.UnselectAll;
  dbgrdDivergAnalitIButton.Glyph := SpeedButton2.Glyph;
  dbgrdDivergAnalitIButton.Hint := 'Selecionar Todos';

  FormataCampoFloat(qryDivergAnalit);   // edilaine - SIG35577
end;

procedure TfrmDivergContrib.qryDivergSintetAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dbgrdDivergSintet.UnselectAll;
  dbgrdDivergSintetIButton.Glyph := SpeedButton2.Glyph;
  dbgrdDivergSintetIButton.Hint := 'Selecionar Todos';

  FormataCampoFloat(qryDivergSintet);   // edilaine - SIG35577
end;

procedure TfrmDivergContrib.dbgrdDivergAnalitTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
 // qryDivergAnalit.close;
 // qryDivergAnalit.sql.clear;
 // qryDivergAnalit.sql.add(sSqlDivergAnalit + 'ORDER BY '+AFieldName+', P.NOME ');
 // qryDivergAnalit.open;
end;

procedure TfrmDivergContrib.dbgrdDivergSintetIButtonClick(Sender: TObject);
begin
  inherited;

  if  not dbgrdDivergSintet.datasource.dataset.isempty then
  begin
     if uppercase(dbgrdDivergSintetIButton.Hint) = 'SELECIONAR TODOS'
     then
     begin
        dbgrdDivergSintet.SelectAll;
        dbgrdDivergSintetIButton.Glyph := SpeedButton1.Glyph;
        dbgrdDivergSintetIButton.Hint := 'Retirar Seleção';
     end
     else
     begin
        dbgrdDivergSintet.UnSelectAll;
        dbgrdDivergSintetIButton.Glyph := SpeedButton2.Glyph;
        dbgrdDivergSintetIButton.Hint := 'Selecionar Todos';
     end;
  end;
end;

procedure TfrmDivergContrib.dbgrdDivergAnalitIButtonClick(Sender: TObject);
begin
  inherited;

  if  not dbgrdDivergAnalit.datasource.dataset.isempty then
  begin
     if uppercase(dbgrdDivergAnalitIButton.Hint) = 'SELECIONAR TODOS'
     then
     begin
        dbgrdDivergAnalit.SelectAll;
        dbgrdDivergAnalitIButton.Glyph := SpeedButton1.Glyph;
        dbgrdDivergAnalitIButton.Hint := 'Retirar Seleção';

        //BRUNO AZEVEDO SOL 86498/1136
        qryDivergAnalit.First;
        while not qryDivergAnalit.Eof do begin
          qryDivergAnalit.Edit;
          qryDivergAnalit.FieldByName('SELECIONADO').AsInteger := 1;
          if qryDivergAnalit.FieldByName('CODDOCUMENTOPREV').AsString <> '' then ListaDocsSelecionados.Add(qryDivergAnalit.FieldByName('NUMRECEBIMENTO').AsString); //TAES - SIG100430
          qryDivergAnalit.Post;
          qryDivergAnalit.Next;
        end;
     end
     else
     begin
        dbgrdDivergAnalit.UnSelectAll;
        dbgrdDivergAnalitIButton.Glyph := SpeedButton2.Glyph;
        dbgrdDivergAnalitIButton.Hint := 'Selecionar todos';

        //BRUNO AZEVEDO SOL 86498/1136
        qryDivergAnalit.First;
        while not qryDivergAnalit.Eof do begin
          qryDivergAnalit.Edit;
          qryDivergAnalit.FieldByName('SELECIONADO').AsInteger := 0;
          if qryDivergAnalit.FieldByName('CODDOCUMENTOPREV').AsString <> '' then
          begin
            if (ListaDocsSelecionados.IndexOf(qryDivergAnalit.FieldByName('NUMRECEBIMENTO').AsString) > -1) then //TAES - SIG100430
              ListaDocsSelecionados.Delete(ListaDocsSelecionados.IndexOf(qryDivergAnalit.FieldByName('NUMRECEBIMENTO').AsString)) //TAES - SIG100430
          end;
          qryDivergAnalit.Post;
          qryDivergAnalit.Next;
        end;
     end;
  end;

end;

function TfrmDivergContrib.PedeConfirma:Boolean;
var sMensagem : string;
begin
  Result := False;
   
  sMensagem := '';
  case iModo of
       1 : sMensagem := 'Cobrar Diferença via Interface.';
       2 : sMensagem := 'Cobrar Diferença via Cobrança Bancária.';
       3 : sMensagem := 'Descontar no Próximo Benefício.';
       4 : sMensagem := 'Devolver Diferença via Interface.';
       5 : sMensagem := 'Devolver Diferença via Devolução Bancária.';
       6 : sMensagem := 'Acrescentar no Próximo Benefício.';
       7 : sMensagem := 'Adicionar como Aporte.';
       8 : sMensagem := 'Ignorar Diferença.';
  end;

  if MsgDlg('A opção selecionada foi '+sMensagem+#13+'Confirma a opção selecionada ?','Confirmação',mtConfirmation, [mbYes,mbNo],0) = mrYes
  then begin
     Result := True;
     lblMsg1.Caption := 'Processando Opção : '+sMensagem;
  end;
end;

procedure TfrmDivergContrib.FormShow(Sender: TObject);
begin
  inherited;
  bAlgumIgnorar := False;
  chkTodasDiverg.Visible := False;  
   
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT TIPOPERENVIO FROM PARAMAPREV  ');
  qryAux.Open;
  if not qryAux.IsEmpty
  then sTipOperEnvio := qryAux.FieldByName('TIPOPERENVIO').AsString
  else sTipOperEnvio := '';
  qryAux.Close;

  rDadosLote.iIdLoteSelecionado := -1;      // edilaine - SIG35577
  ListaDocsSelecionados := TStringList.Create(); //TAES - SIG95604

  //edilaine SIG100591 : inicio
  qryFiltroContrib.Close; qryFiltroContrib.Open;
  CriaLista(chklstContrib, qryFiltroContrib);
  //edilaine SIG100591 : fim

end;

procedure TfrmDivergContrib.pmnuRecalcularPatronaisClick(Sender: TObject);
begin
  inherited;

  if not AcertaPatronalPorAceitar
  then begin
     MsgDlg('Erro ao Recalcular Contribuição Patronal. Verifique.', 'Erro',mtError, [mbOk, mbHelp],0);
     bbtnVerResultadoClick(Sender);
     Exit;
  end;

end;

procedure TfrmDivergContrib.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( CtrlDocumento  );
  FreeAndNil( CtrlLancamento );
  FreeAndNil( CtrlFinanc );
  FreeANdNil(ListaDocsSelecionados);

  FreeANdNil(lstIdContrib);  //edilaine SIG100591

  inherited;
  QryFormaPagamento.Close;

  if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
end;

procedure TfrmDivergContrib.DbLkcFormaPagamentoChange(Sender: TObject);
begin
  inherited;
  ChkFormaPagamento.Checked := Not (Trim(DbLkcFormaPagamento.Text) = '')
end;

procedure TfrmDivergContrib.CbxTipoCobrancaChange(Sender: TObject);
begin
  inherited;
  ChkTipoCobranca.Checked := Not (Trim(CbxTipoCobranca.Text) = '')
end;

 
function TfrmDivergContrib.VerificaCobrancaBancariaPendente ( var qryLeitura : TwwQuery ;
                                                              var sMsgErro   : string    ) : boolean;
begin
   Result := False;

   // Se a contribuicao foi descontada em folha, não precisa verificar documento
   // pendente
   if qryLeitura.FieldByName('FLGDESCFOLHA').AsInteger = 1
   then begin
      Result := True;
      Exit;
   end;

   //BRUNO AZEVEDO SOL 136737 KINTANA 972753
   if not BaixaDocumentoNAOPAGO( CtrlDocumento,
                                  qryAux,
                                  qryLeitura.FieldByName('MESREFERENCIA').AsString,
                                  qryLeitura.FieldByName('CODDOCUMENTOPREV').AsInteger,
                                  //Darivaldo Alencar SIG- 20204 -inicio
                                  //Inicio - Helio - SOL Nº 253577/17460 PPM Nº 955546
                                  qryLeitura.FieldByName('IDPLANOPREV').AsInteger,
                                  //qryLeitura.FieldByName('IDPLANPREVCONTAB').AsInteger,
                                  //Fim - Helio - SOL Nº 253577/17460 PPM Nº 955546
                                  //Darivaldo Alencar SIG-20204 - fim
                                  qryLeitura.FieldByName('NOMERESUM').AsString,
                                  sMsgErro,
                                  qryLeitura.FieldByName('IDCONTRIBUICAO').AsInteger,
                                  qryContabil,
                                  CtrlLancamento,
                                  qryLeitura.FieldByName('IDPESSJUR').AsInteger,
                                  qryLeitura.FieldByName('IDPLANPREVCONTAB').AsInteger  //William Santana - SIG 27350
                                   )
   then Exit;
   //BRUNO AZEVEDO SOL 136737 KINTANA 972753

   Result := True;
end;

//edilaine - SIG35577 - inicio
{procedure TfrmDivergContrib.dblkpcmbSitPartInternoChange(Sender: TObject);
begin
  inherited;
  chkSitPartInterno.Checked := not (Trim(dblkpcmbSitPartInterno.Text) = '');
end;
}//edilaine - SIG35577 - fim

procedure TfrmDivergContrib.chkTodasDivergClick(Sender: TObject);
var
 iModoSelecionado : word; //André Oliveira SOL 172728 KINTANA 1556309
begin

  inherited;
 iModoSelecionado := ItemSelecionado;
 if(iModoSelecionado in [0,1,2,3,4])then
 begin
    if chkTodasDiverg.Visible and chkTodasDiverg.Checked
    then begin //André Oliveira SOL 172728 KINTANA 1556309
         lblTituloMesRef.Caption := 'Previsão de Recebimento Até';
         lblRecPeriodo.Visible :=  False;
         cmdtDataReceFinal.Visible :=  False;
         cmdtDataReceFinal.Clear;
    end
    else begin
         lblTituloMesRef.Caption := 'Previsão de Recebimento Em';
         lblRecPeriodo.Visible :=  True;
         cmdtDataReceFinal.Visible :=  True;
    end;
 end
 else
 begin
    if chkTodasDiverg.Visible and chkTodasDiverg.Checked
    then begin
       lblTituloMesRef.Caption := 'Previsão de Recebimento Até';
    end
    else begin
       lblTituloMesRef.Caption := 'Previsão de Recebimento Em';
    end;
 end;
end;


function TfrmDivergContrib.BuscaPlanilhaDoc(const iDocumento: Integer): Integer;
begin
   Result := -1;
   try
      try
         with qryPlanilhaDocumento do
         begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
            Open;

            if qryPlanilhaDocumentoPLNCODIGO.AsInteger > 0 then
            begin
               Result := qryPlanilhaDocumentoPLNCODIGO.AsInteger
            end;
         end;
      except
      end;
   finally
      qryPlanilhaDocumento.Close;
   end;
end;



function TfrmDivergContrib.BuscaFiltrosLog: String;
Var
  sFiltro : String;
begin
  sFiltro := '';

  // Patrocinadora
  If Trim(dblkpcmbPatro.Text) <> ''
  Then sFiltro := 'Patrocinadora: '+dblkpcmbPatro.Text+', ';

  // Plano Previdenciário
  If Trim(dblkpcmbPlano.Text) <> ''
  Then sFiltro := sFiltro + 'Plano: '+dblkpcmbPlano.Text+', ';

  // Contribuição
  //edilaine SIG100591 : inicio
  //If Trim(dblkpcmbContrib.Text) <> ''
  //Then sFiltro := sFiltro + 'Contribuição: '+dblkpcmbContrib.Text+', ';

  If lstIdContrib.count > 0
  Then sFiltro := sFiltro + 'Contribuição: ('+lstIdContrib.commatext+'), ';
  //edilaine SIG100591 : fim

  // Tempo de Divergência
  If Trim(edTempo.Text) <> ''
  Then sFiltro := sFiltro + 'Tempo: '+cmbFiltraTempo.Text+' '+edTempo.Text+', ';

  //Everson Cunha - SIG79795 - Início
  // Mês de Referência
  If Trim(edtMesRef.Text) <> ''
  Then sFiltro := sFiltro + 'Mês Referência: '+cmbFiltraMesRef.Text+' '+edtMesRef.Text+', ';
  //Everson Cunha - SIG79795 - Fim

  // Valor de Divergência
  If Trim(edValor.Text) <> ''
  Then sFiltro := sFiltro + 'Valor: '+cmbFiltraValor.Text+' '+edValor.Text+', ';

  // Participante
  If Trim(edParticipante.Text) <> ''
  Then sFiltro := sFiltro + 'Nome: '+edParticipante.Text+', ';

  // Situação
  If Trim(cmbSituacao.Text) <> ''
  Then sFiltro := sFiltro + 'Situação: '+cmbSituacao.Text+', ';

  // Tipo de Cobrança
  If Trim(CbxTipoCobranca.Text) <> ''
  Then sFiltro := sFiltro + 'Tipo: '+CbxTipoCobranca.Text+', ';

  // Forma de Pagamento
  If Trim(DbLkcFormaPagamento.Text) <> ''
  Then sFiltro := sFiltro + 'Forma Pagto: '+DbLkcFormaPagamento.Text+', ';

  //edilaine - SIG35577 - inicio
  // Categoria da Situação do Particip. na Fundação
  {If Trim(dblkpcmbSitPartInterno.Text) <> ''
  Then sFiltro := sFiltro + 'Cat.Sit.Part.: '+dblkpcmbSitPartInterno.Text+', ';
  }//edilaine - SIG35577 - fim

  // Não visualizar divergências já tratadas
  If chkDivTrat.Checked
  Then sFiltro := sFiltro + 'Não visualizar divergências já tratadas, ';

  // retira o último espço com a vírgula
  If Length(sFiltro) > 1
  Then sFiltro := Copy(sFiltro, 1, Length(sFiltro)-2);

  Result := UpperCase(sFiltro);
end;



function TfrmDivergContrib.DocBaixadoCAR(psCodDocumento: String): Boolean;
Var
  sSql : String;
begin
  sSQL :=
  'SELECT 1 '                                           + #13 +
  'FROM '                                               + #13 +
  '  DOCUMENTO  '                                       + #13 +
  'WHERE '                                              + #13 +
  '      IDMODULO     = ' + IntToStr(Sistema.IdModulo)  + #13 +
  '  AND CODDOCUMENTO = ' + psCodDocumento              + #13 +
  '  AND STATUS       = ''2'' ';

  qryAux1.Close;
  qryAux1.SQL.Clear;
  qryAux1.SQL.Text := sSQL;
  qryAux1.Open;

  Result := not(qryAux1.IsEmpty);

  qryAux1.Close;

  if not(Result) then Exit;

  // -----------------------------------------------------------------------------------------------
  // André Pontes - pendência 26928 - 27/11/2007

  sSQL :=
  'SELECT '                                                         + #13 +
  '  SUM(DECODE(LDO.OPERACAO, 5, LDO.VALOR, 0)) AS VALOR_BAIXADO '  + #13 +
  'FROM '                                                           + #13 +
  '  LANCTODOCUM LDO, '                                             + #13 +
  '  DOCUMENTO   DOC  '                                             + #13 +
  'WHERE '                                                          + #13 +
  '      DOC.CODDOCUMENTO = ' + psCodDocumento                      + #13 +
  '  AND LDO.ESTORNO      IS NULL '                                 + #13 +
  '  AND DOC.CODDOCUMENTO = LDO.CODDOCUMENTO ';

  qryAux1.Close;
  qryAux1.SQL.Clear;
  qryAux1.SQL.Text := sSQL;
  qryAux1.Open;

  Result := (qryAux1.FieldByName('VALOR_BAIXADO').AsFloat > 0);

  qryAux1.Close;

  // FIM André Pontes - pendência 26928 - 27/11/2007
  // -----------------------------------------------------------------------------------------------
end;



function TfrmDivergContrib.DataDeHoje(psData: String): Boolean;
begin
  If StrToDate(psData) < Date Then
    Result := False
  Else
    Result := True;
end;



procedure TfrmDivergContrib.cmdtDataReceInicialChange(Sender: TObject);
begin
  inherited;
 if tb97Param.Visible
  then tb97Param.Visible := False;
  
end;

procedure TfrmDivergContrib.cmdtDataReceFinalChange(Sender: TObject);
begin
  inherited;
if tb97Param.Visible then
  tb97Param.Visible := False;
end;

procedure TfrmDivergContrib.dbgrdDivergAnalitMultiSelectRecord(
  Grid: TwwDBGrid; Selecting: Boolean; var Accept: Boolean);
begin
  inherited;
  qryDivergAnalit.Edit;
  if (qryDivergAnalit.FieldByName('SELECIONADO').AsInteger = 0) then begin
    qryDivergAnalit.FieldByName('SELECIONADO').AsInteger := 1;
    if qryDivergAnalit.FieldByName('CODDOCUMENTOPREV').AsString <> '' then ListaDocsSelecionados.Add(qryDivergAnalit.FieldByName('NUMRECEBIMENTO').AsString); //TAES - SIG95604
  end else begin
    qryDivergAnalit.FieldByName('SELECIONADO').AsInteger := 0;
    if qryDivergAnalit.FieldByName('CODDOCUMENTOPREV').AsString <> '' then ListaDocsSelecionados.Delete(ListaDocsSelecionados.IndexOf(qryDivergAnalit.FieldByName('NUMRECEBIMENTO').AsString)); //TAES - SIG95604
  end;
  qryDivergAnalit.Post;
end;

// edilaine - SOL 253577-17744 / PPM 1063636 - comentado inicio
//William Santana SOL 205323 KIN 1998345
{procedure TfrmDivergContrib.mniCadastrarEmail1Click(Sender: TObject);
var
  aRptMemoryStream :TMemoryStream;

begin
  inherited;
  aRptMemoryStream := TMemoryStream.Create;

  qryAux1.close;
  qryAux1.sql.clear;
  qryAux1.SQL.ADD('SELECT NAME, IDREPORTS, DESCRIPTION, TEMPLATE FROM CM.REPORTS ');
  qryAux1.SQL.ADD(' WHERE NAME = ''ModeloEmail'' AND IDREPORTS = 205323 ');

  qryAux1.open;

  aRptMemoryStream.Clear;

  if qryAux1.isEmpty then
    TppTEnvioEmail.Template.SaveToStream( aRptMemoryStream )
  else
  begin
    TBlobField( qryAux1.FieldByName( 'TEMPLATE' ) ).SaveToStream( aRptMemoryStream );
    TppTEnvioEmail.Template.LoadFromStream( aRptMemoryStream );
  end;
  pdsg1.showmodal;

  aRptMemoryStream.Clear;
  TppTEnvioEmail.Template.SaveToStream( aRptMemoryStream );
  
  if not  dtmBaseDados.dbBaseDados.InTransaction then
    StartTransacao;

  TppTEnvioEmail.Template.SaveToStream( aRptMemoryStream ) ;
  aRptMemoryStream.Position := 0;

  qryRep.open;
  if qryAux1.isEmpty then
  begin
      qryRep.Insert;
      TBlobField( qryrep.FieldByName( 'TEMPLATE' ) ).LoadFromStream( aRptMemoryStream );
      qryrep.FieldByName('NAME').asString := 'ModeloEmail';
      qryrep.FieldByName('IDREPORTS').asInteger := 205323;
      qryrep.FieldByName('DESCRIPTION').asString := 'Modelo Email Inadinplência';
      qryRep.Post;

  end
  else
  begin
      qryRep.Edit;
      TBlobField( qryrep.FieldByName( 'TEMPLATE' ) ).LoadFromStream( aRptMemoryStream );

      qryRep.Post;
  end;
               
  try
   CommitTransacao;
  except
   RollBackTransacao;
  end;

  aRptMemoryStream.Clear;

end;
} // edilaine - SOL 253577-17744 / PPM 1063636 - comentado fim


function TfrmDivergContrib.EnviarEmailParticipantes(email: String): boolean;
var
 MailItem : Variant;
 emailRemetente, assunto, corpoEmail, pathImgAnexo : String; //Helio - SOL Nº 240582 PPM Nº 563271
begin

 try
  DeviceExportToFile(TppTEnvioEmail, edfJpeg, 'c:\planus\temp\email1.jpg'); // o sistema coloca + 0001 no nome arquivo

  try

   //Helio - SOL Nº 240582 PPM Nº 563271
   {comenta, o envio sera feito pelo oracle
    nao mais pelo outlook
   MailItem := outlook.CreateItem(olMailItem) ;

   MailItem.Recipients.Add(email);
   MailItem.Subject := 'Contribuições não recolhidas';
   MailItem.Attachments.Add('C:\Planus\Temp\email10001.jpg');
   MailItem.htmlbody := '<HTML><HEAD></HEAD><BODY><IMG SRC="cid:email10001.jpg"></IMG></BODY></HTML>'; //@C:\Planus\Temp\email10001.jpg
   MailItem.send;}
   //Helio - SOL Nº 240582 PPM Nº 563271

    try
      //Helio - SOL Nº 240582 PPM Nº 563271
      {if not MailItem.Submitted then
      begin
      end;}
      emailRemetente := ObtemEmailTrataDivergencia;
      corpoEmail     := '<HTML><HEAD></HEAD><BODY><IMG SRC="cid:email10001.jpg"></IMG></BODY></HTML>';
      pathImgAnexo   := 'C:\Planus\Temp\email10001.jpg';

      //procedimento para permitir caracter special no assunto
      //mensagem já convertida de utf8 para base64
      //assunto := 'Contribuições não recolhidas' //mensagem sem converter
      assunto := 'Q29udHJpYnVpw6fDtWVzIG7Do28gcmVjb2xoaWRhcw=='; //em base64
      //tem que converter de UTF8 para base64!!!
      //converter de ascii para base64 nao funciona!!!

      //faz com o que servico de e-mail entenda
      //que tem que exibir o assunto de base64, como uff8
      assunto := '=?UTF-8?B?' + assunto + '?=';

      EnviaEMailComImgAnexo(emailRemetente,
                            email,
                            assunto,
                            corpoEmail,
                            pathImgAnexo);
      //FIM Helio - SOL Nº 240582 PPM Nº 563271
    except
      //quando envia o e-mail sem erros, cai nesse exception
      atualizaflgenvioemail;
    end;
   except     
  end;
  finally
    deletefile('c:\planus\temp\email10001.jpg');
 end;  
end;

procedure TfrmDivergContrib.atualizaflgenvioemail;
begin

   try
     StartTransacao;

     qryFLGemail.close;
     qryFLGemail.sql.clear;

     qryFLGemail.sql.add(' update HSTCONTRIBPREV set        ');
     qryFLGemail.sql.add(' FLGENVIOEMAIL = :FLGENVIOEMAIL, ');
     qryFLGemail.sql.add(' DTAENVIOEMAIL = :DTAENVIOEMAIL  ');
     qryFLGemail.sql.add(' WHERE                          ');
     qryFLGemail.sql.add(' MESREFERENCIA = :MESREFERENCIA and ');
     qryFLGemail.sql.add(' MESCOBRANCA = :MESCOBRANCA and     ');
     qryFLGemail.sql.add(' NUMRECEBIMENTO = :NUMRECEBIMENTO and  ');
     qryFLGemail.sql.add(' IDMOTIVO = :IDMOTIVO and              ');
     qryFLGemail.sql.add(' IDPESSOA = :IDPESSOA and              ');
     qryFLGemail.sql.add(' IDPLANOPREV = :IDPLANOPREV and         ');
     qryFLGemail.sql.add(' IDPESSJUR = :IDPESSJUR               ');

     qryFLGemail.prepare ;
     qryFLGemail.paramByName('IDPESSOA').AsString      := cdsAuxEmail.fieldByName('IDPESSOA').AsString;
     qryFLGemail.paramByName('IDPESSJUR').AsString     := cdsAuxEmail.fieldByName('IDPESSJUR').AsString;
     qryFLGemail.paramByName('IDPLANOPREV').AsString   := cdsAuxEmail.fieldByName('IDPLANOPREV').AsString;
     qryFLGemail.paramByName('MESREFERENCIA').AsString := cdsAuxEmail.fieldByName('MESREFERENCIA').AsString;
     qryFLGemail.paramByName('MESCOBRANCA').AsString   := cdsAuxEmail.fieldByName('MESCOBRANCA').AsString;
     qryFLGemail.paramByName('NUMRECEBIMENTO').AsString := cdsAuxEmail.fieldByName('NUMRECEBIMENTO').AsString;
     qryFLGemail.paramByName('IDMOTIVO').AsString       := cdsAuxEmail.fieldByName('IDMOTIVO').AsString;

     qryFLGemail.paramByName('FLGENVIOEMAIL').AsString := '1';
     qryFLGemail.paramByName('DTAENVIOEMAIL').asDATETIME := NOW();

     qryFLGemail.ExecSQL;

    CommitTransacao;
   except
    RollBackTransacao;
   end;

end;                 

procedure TfrmDivergContrib.pvrbl2Print(Sender: TObject);
begin
  inherited;
  pmpar2.lines.text := stringreplace((pmpar2.lines.text),'<VALOR>',FormatFloat('#,##0.00',pvrbl2.value),[rfReplaceAll]);
end;
//END - William Santana SOL 205323 KIN 1998345


//Helio - SOL Nº 240582 PPM Nº 563271
function TfrmDivergContrib.ObtemEmailTrataDivergencia : String;
var
    qryTemp : TWWQuery;
    sqlTemp : String;
begin

    qryTemp := TWWQuery.Create(dtmBaseDados);
    qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

    try
       qryTemp.SQL.Clear;
       qryTemp.SQL.Text := ' SELECT EMAILTRATDIVERG FROM PARAMAPREV ';

       qryTemp.Open;

       Result := '';

       if not qryTemp.IsEmpty then
          Result := qryTemp.FieldByName('EMAILTRATDIVERG').AsString;

    finally
       qryTemp.Close;
       FreeAndNil(qryTemp);
    end;

end;

//Helio - SOL Nº 240582 PPM Nº 563271
procedure TfrmDivergContrib.EnviaEMailComImgAnexo(sRemetente, sDestinatario, sAssunto, sMensagem, pathImg : String);
var
  wwStoredProc : TwwStoredProc;
  var chaveImg : String;
begin


     wwStoredProc := TwwStoredProc.Create( nil );
     chaveImg := 'img' + FormatDateTime('hhmmsszzz', Now()); //chave unica para aquele img

     //a procedure CM.ENVIA_EMAIL_IMGANEXO busca essa imagem para enviar no e-mail como anexo
     SalvaImgBanco(chaveImg, pathImg);


     try
	 wwStoredProc.DatabaseName   :=  dtmBaseDados.dbBaseDados.DataBaseName;
	 wwStoredProc.StoredProcName := 'CM.ENVIA_EMAIL_IMGANEXO';
	 wwStoredProc.Params.CreateParam( ftString,  'p_from'     , ptInput).AsString  := sRemetente;
	 wwStoredProc.Params.CreateParam( ftString,  'p_to'       , ptInput).AsString  := sDestinatario;
	 wwStoredProc.Params.CreateParam( ftString,  'p_subject'  , ptInput).AsString  := sAssunto;
	 wwStoredProc.Params.CreateParam( ftString,  'p_text_msg' , ptInput).AsString  := sMensagem;
	 wwStoredProc.Params.CreateParam( ftString,  'p_smtp_host', ptInput).AsString  := 'smtp.funcef.com.br';
	 wwStoredProc.Params.CreateParam( ftInteger, 'p_smtp_port', ptInput).AsInteger := 25;
         wwStoredProc.Params.CreateParam( ftString,  'p_attach_name', ptInput).AsString := 'email10001.jpg';
         wwStoredProc.Params.CreateParam( ftString,  'p_attach_mime', ptInput).AsString := 'image/jpeg';
         wwStoredProc.Params.CreateParam( ftString,  'p_chave_imgblob', ptInput).AsString := chaveImg;



	 wwStoredProc.Prepare;
	 wwStoredProc.ExecProc;


     Except
	 wwStoredProc.Free;
         RemoveImgBanco(chaveImg);
         Raise;
     end;

     
     wwStoredProc.Free;
     RemoveImgBanco(chaveImg);
end;

//Helio - SOL Nº 240582 PPM Nº 563271
procedure TfrmDivergContrib.SalvaImgBanco(chaveImg, pathImg : String);
var
  qryTemp     : TWWQuery;
  //qryBlob     : TWWQuery;
  image       : TImage;
  ms          : TMemoryStream;
  blobField   : TBlobField;
begin

    image := TImage.Create(nil);
    ms := TMemoryStream.Create;
    qryTemp := TwwQuery.Create(dtmBaseDados);
    //qryBlob := TWWQuery.Create(dtmBaseDados);


    try
       image := TImage.Create(nil);
       image.Picture.LoadFromFile(pathImg);
       image.Picture.Graphic.SaveToStream(ms);

       StartTransacao;

       qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
       qryTemp.SQL.Clear;

       //insere image
       qryTemp.Params.CreateParam(ftBlob, 'blobImg', ptInput);
       qryTemp.SQL.Text := ' INSERT INTO TEMPIMGEMAIL(CHAVE, IMGLRAW) VALUES(' +
                                 QuotedStr(chaveImg) + ', :IMGLRAW) ';
       qryTemp.ParamByName('IMGLRAW').LoadFromStream(ms, ftBlob);

       qryTemp.Prepare;
       qryTemp.ExecSQL;

       //salva passa long raw para blob
       qryTemp.SQL.Text := ' UPDATE TEMPIMGEMAIL ' +#13+
                           '    SET IMGBLOB = ' +#13+
                           '        (SELECT TO_LOB(IMGLRAW) ' +#13+
                           '           FROM TEMPIMGEMAIL ' +#13+
                           '          WHERE CHAVE =  ' + QuotedStr(chaveImg) + ') ' +#13+
                           '  WHERE CHAVE = ' + QuotedStr(chaveImg);

       qryTemp.Prepare;
       qryTemp.ExecSQL;

       CommitTransacao;

    except
       RollBackTransacao;
    end;

    image.Free;
    ms.Free;
    qryTemp.Free;
end;

//Helio - SOL Nº 240582 PPM Nº 563271
procedure TfrmDivergContrib.RemoveImgBanco(chaveImg : String);
var
  qryTemp     : TWWQuery;

begin

    qryTemp := TwwQuery.Create(dtmBaseDados);

    try

       StartTransacao;

       qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
       qryTemp.SQL.Clear;

       qryTemp.SQL.Text := ' DELETE FROM TEMPIMGEMAIL WHERE CHAVE = ' + QuotedStr(chaveImg);

       qryTemp.Prepare;
       qryTemp.ExecSQL;

       CommitTransacao;

    except
       RollBackTransacao;
    end;

    qryTemp.Free;
end;

//Helio - SOL Nº 253577/17460 PPM Nº 955546
procedure TfrmDivergContrib.AtualizaLancamento(pPlnCodigo : Integer; pIdPlanPrevContab : String);
var
    qryTemp : TWWQuery;
begin

        qryTemp := TWWQuery.Create(Nil);

        try
            qryTemp.DatabaseName := dtmBaseDados.dbBaseDados.DataBaseName;

            qryTemp.SQL.Text := ' UPDATE LANCAMENTO SET ' +
                                ' IDPLANOPREV = ' + pIdPlanPrevContab +#13+
                                ' WHERE PLNCODIGO = ' + IntToStr(pPlnCodigo);

            qryTemp.ExecSQL;

        except
           qryTemp.Close;
           FreeAndNil(qryTemp);
           raise;
        end;

        qryTemp.Close;
        FreeAndNil(qryTemp);
end;

//Denis Horongoso - SIG50870 - Inicio
function TfrmDivergContrib.ExisteAcaoJudicialVigente(sIdPessoa,
                                                     sIdTitular,
                                                     sIdContribuicao,
                                                     sIdPlanoPrev,
                                                     sIdPessJur,
                                                     sSeqProposta: string;
                                                     var sTipoAcao,
                                                     sMotivo: string): boolean;
var
    qryTemp : TWWQuery;
begin
  Result    := False;
  sTipoAcao := '';
  sMotivo   := '';

  qryTemp := TWWQuery.Create(dtmBaseDados);
  qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

  try
    qryTemp.SQL.Add('SELECT DECODE(CTN.IDNUCLEOFAMILIAR, NULL, CTP.FLGPREPARO, CTN.FLGPREPARO) AS FLGPREPARO,              ');
    qryTemp.SQL.Add('       DECODE(CTN.IDNUCLEOFAMILIAR, NULL, CTP.IDMOTIVO, CTN.IDMOTIVO) AS IDMOTIVO,                    ');
    qryTemp.SQL.Add('       DECODE(CTN.IDNUCLEOFAMILIAR, NULL, CTP.ANOMESFIMACAO, CTN.ANOMESFIMACAO) AS ANOMESFIMACAO,     ');
    qryTemp.SQL.Add('       (SELECT M.DESCRICAO FROM MOTIVO M                                                              ');
    qryTemp.SQL.Add('         WHERE IDMOTIVO = DECODE(CTN.IDNUCLEOFAMILIAR, NULL, CTP.IDMOTIVO, CTN.IDMOTIVO)) AS DESCRICAO');
    qryTemp.SQL.Add('  FROM HSTCONTRIBPREV H                                                                               ');
    qryTemp.SQL.Add('  LEFT JOIN (SELECT CP.IDPESSOA, CP.IDCONTRIBUICAO, CP.IDPLANOPREV, CP.IDPESSJUR, CP.SEQPROPOSTA,     ');
    qryTemp.SQL.Add('                    AJP.IDMOTIVOACJUDDEFICIT AS IDMOTIVO, AJP.FLGPREPARO,                             ');
    qryTemp.SQL.Add('                    AJP.ANOMESFIMACJUDDEFICIT AS ANOMESFIMACAO                                        ');
    qryTemp.SQL.Add('               FROM CONTRIBPREVPARTP CP                                                               ');
    qryTemp.SQL.Add('               JOIN CONTRIBPARTPACJUDDEFICIT AJP ON AJP.IDPESSOA       = CP.IDPESSOA                  ');
    qryTemp.SQL.Add('                                                AND AJP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO            ');
    qryTemp.SQL.Add('                                                AND AJP.IDPLANOPREV    = CP.IDPLANOPREV               ');
    qryTemp.SQL.Add('                                                AND AJP.IDPESSJUR      = CP.IDPESSJUR                 ');
    qryTemp.SQL.Add('                                                AND AJP.SEQPROPOSTA    = CP.SEQPROPOSTA               ');
    qryTemp.SQL.Add('            ) CTP ON H.IDTITULAR      = CTP.IDPESSOA                                                  ');
    qryTemp.SQL.Add('                 AND H.IDCONTRIBUICAO = CTP.IDCONTRIBUICAO                                            ');
    qryTemp.SQL.Add('                 AND H.IDPLANOPREV    = CTP.IDPLANOPREV                                               ');
    qryTemp.SQL.Add('                 AND H.IDPESSJUR      = CTP.IDPESSJUR                                                 ');
    qryTemp.SQL.Add('                 AND H.SEQPROPOSTA    = CTP.SEQPROPOSTA                                               ');
    qryTemp.SQL.Add('  LEFT JOIN NUCLEOFAMILIAR NF ON H.IDTITULAR = NF.IDTITULAR                                           ');
    qryTemp.SQL.Add('  LEFT JOIN (SELECT CN.IDPESSOA, CN.IDCONTRIBUICAO, CN.IDPLANOPREV, CN.IDPESSJUR, CN.SEQPROPOSTA,     ');
    qryTemp.SQL.Add('                    CN.IDNUCLEOFAMILIAR,                                                              ');
    qryTemp.SQL.Add('                    AJN.IDMOTIVOACJUDDEFICIT AS IDMOTIVO, AJN.FLGPREPARO,                             ');
    qryTemp.SQL.Add('                    AJN.ANOMESFIMACJUDDEFICIT AS ANOMESFIMACAO                                        ');
    qryTemp.SQL.Add('               FROM CONTRIBPREVNUCLEO CN                                                              ');
    qryTemp.SQL.Add('               JOIN CONTRIBNUCLEOACJUDDEFICIT AJN ON AJN.IDNUCLEOFAMILIAR = CN.IDNUCLEOFAMILIAR       ');
    qryTemp.SQL.Add('                                                 AND AJN.IDCONTRIBUICAO   = CN.IDCONTRIBUICAO         ');
    qryTemp.SQL.Add('            ) CTN  ON H.IDPESSOA       = CTN.IDPESSOA                                                 ');
    qryTemp.SQL.Add('                  AND H.IDCONTRIBUICAO = CTN.IDCONTRIBUICAO                                           ');
    qryTemp.SQL.Add('                  AND H.IDPLANOPREV    = CTN.IDPLANOPREV                                              ');
    qryTemp.SQL.Add('                  AND H.IDPESSJUR      = CTN.IDPESSJUR                                                ');
    qryTemp.SQL.Add('                  AND H.SEQPROPOSTA    = CTN.SEQPROPOSTA                                              ');
    qryTemp.SQL.Add('  WHERE H.IDPESSOA       = ' + sIdPessoa                                                               );
    qryTemp.SQL.Add('    AND H.IDTITULAR      = ' + sIdTitular                                                              );
    qryTemp.SQL.Add('    AND H.IDCONTRIBUICAO = ' + sIdContribuicao                                                         );
    qryTemp.SQL.Add('    AND H.IDPLANOPREV    = ' + sIdPlanoPrev                                                            );
    qryTemp.SQL.Add('    AND H.IDPESSJUR      = ' + sIdPessJur                                                              );
    qryTemp.SQL.Add('    AND H.SEQPROPOSTA    = ' + sSeqProposta                                                            );
    qryTemp.SQL.Add('    AND NVL(DECODE(CTN.IDNUCLEOFAMILIAR, NULL, CTP.ANOMESFIMACAO, CTN.ANOMESFIMACAO), TO_CHAR(SYSDATE, ''YYYY/MM'')) >= ''' + FormatDateTime('YYYY/MM', Date) + '''');

    qryTemp.Open;

    Result := False;

    if (qryTemp.FieldByName('IdMotivo').AsInteger > 0) then
    begin
       case qryTemp.FieldByName('FlgPreparo').AsInteger of
         0: sTipoAcao := 'Preparada/Não Enviada';
         1: sTipoAcao := 'Não Preparada';
       end;

      sMotivo := qryTemp.FieldByName('Descricao').AsString;
      Result := true;
    end;

  finally
    qryTemp.Close;
    FreeAndNil(qryTemp);
  end;
end;
//Denis Horongoso - SIG50870 - Fim

procedure TfrmDivergContrib.Timer1Timer(Sender: TObject);
var
MainHandle : THandle;
begin
  inherited;

  try
     MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
     SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
     CloseHandle(MainHandle) ;
  except
  end;

  Application.ProcessMessages;
end;

// edilaine - SIG35577 - inicio
procedure TfrmDivergContrib.FormataCampoFloat(qry: TwwQuery);
var
   i : integer;
begin
  for i := 0 to qry.fields.Count-1 do
  begin
    if qry.Fields[i].DataType = ftFloat then
       TNumericField(qry.Fields[i]).DisplayFormat := '#,##0.00';
  end;
end;


procedure TfrmDivergContrib.MontaConsultaEnviaBanco(iIdTitular, iIdPessoa: integer);
begin
  qryEnvioBanco.close;
  qryEnvioBanco.SQL.clear;
  qryEnvioBanco.SQL.Add('SELECT C.NOMERESUM,            ');
  qryEnvioBanco.SQL.Add('       C.NOME AS NOMECONTRIB,  ');
  qryEnvioBanco.SQL.Add('       P.NOME AS NOMEPARTICIP, ');
  qryEnvioBanco.SQL.Add('       C.NOME,               HST.MESREFERENCIA,      HST.MESCOBRANCA,     ');
  qryEnvioBanco.SQL.Add('       HST.DATAPREVISAORECE, HST.FLGDESCFOLHA,                            ');
  qryEnvioBanco.SQL.Add('       HST.VALORESPERADO,    HST.VALORRECEBIDO,      HST.SITRECEBIMENTO,  ');
  qryEnvioBanco.SQL.Add('       HST.IDLOTE,           HST.NUMRECEBIMENTO,     HST.FLGDEVOLUCAO,    ');
  qryEnvioBanco.SQL.Add('       HST.IDMOTIVO,         HST.DATARECEBIMENTO,    HST.FLGDEVOLUCAO,    ');
  qryEnvioBanco.SQL.Add('       HST.VALOROP1,         HST.VALOROP2,           HST.VALOROP3,        ');   
  qryEnvioBanco.SQL.Add('       HST.CODDOCUMENTOPREV, HST.VALORCALCULADO,     HST.FLGDESCFOLHA,    ');
  qryEnvioBanco.SQL.Add('       HST.IDCONTRIBUICAO,   HST.IDPESSJUR,          HST.IDPLANOPREV,     ');
  qryEnvioBanco.SQL.Add('       HST.IDPESSOA,         HST.SEQPROPOSTA,        HST.DATAINICIO,      ');
  qryEnvioBanco.SQL.Add('       HST.DATAFINAL,        HST.FLGSITFUNDACAO,     HST.FLGEVENTO,       ');
  qryEnvioBanco.SQL.Add('       HST.DATACANCELAMENTO, HST.DATAEMISSCOB,       HST.FLGCALCRESERVA,  ');
  qryEnvioBanco.SQL.Add('       DP.MATRICULA,                                                      ');
  qryEnvioBanco.SQL.Add('       CP.FLGPAGADOR,        CP.CODCENTROCUSTOC,     CP.CODCENTROCUSTOD,  ');
  qryEnvioBanco.SQL.Add('       CP.CODTIPRECDES,      CP.UNIDNEGOC,                                ');
  qryEnvioBanco.SQL.Add('       CP.CODSUBCONTA,       CP.CODCENTRORESPON,     CP.IDREGRACALCULO,   ');
  qryEnvioBanco.SQL.Add('       SP.FLGINTERNO,                                                     ');

  qryEnvioBanco.SQL.Add('       PP.INSCRICAONUMERO,   PP.SALMANTIDO,                               ');

  qryEnvioBanco.SQL.Add('       HST.IDPESSJUR AS IDPESSJURCEDIDO,                                  ');
  qryEnvioBanco.SQL.Add('       NVL(HST.IDPLANPREVCONTAB,HST.IDPLANOPREV) AS IDPLANPREVCONTAB,     ');
  qryEnvioBanco.SQL.Add('       DECODE(HST.FLGDEVOLUCAO, 0,                                        ');
  qryEnvioBanco.SQL.Add('                                DECODE(HST.SITRECEBIMENTO,                ');
  qryEnvioBanco.SQL.Add('                                       ''0'', ''Não enviada para cobrança'',           ');
  qryEnvioBanco.SQL.Add('                                       ''1'', ''Enviada e não recebida'',              ');
  qryEnvioBanco.SQL.Add('                                       ''2'', ''Recebida corretamente'',               ');
  qryEnvioBanco.SQL.Add('                                       ''3'', ''Recebida com divergência(NT)'',        ');
  qryEnvioBanco.SQL.Add('                                       ''4'', ''Atrasada e já tratada'',               ');
  qryEnvioBanco.SQL.Add('                                       ''5'', ''Divergência paga'',                    ');
  qryEnvioBanco.SQL.Add('                                       ''6'', ''Divergência enviada e não recebida'',  ');
  qryEnvioBanco.SQL.Add('                                       ''7'', ''Financiada ou Renegociada'',           ');
  qryEnvioBanco.SQL.Add('                                       ''8'', ''Cancelada'',                           ');
  qryEnvioBanco.SQL.Add('                                       ''9'', ''Cobrada na Folha de Benefício''),      ');
  qryEnvioBanco.SQL.Add('                                DECODE(HST.SITRECEBIMENTO,                             ');
  qryEnvioBanco.SQL.Add('                                       ''0'', ''Não enviada para devolução'',          ');
  qryEnvioBanco.SQL.Add('                                       ''1'', ''Enviada e não efetivamente paga'',     ');
  qryEnvioBanco.SQL.Add('                                       ''2'', ''Paga corretamente'',                   ');
  qryEnvioBanco.SQL.Add('                                       ''3'', ''Paga com divergência(NT)'',            ');
  qryEnvioBanco.SQL.Add('                                       ''7'', ''Financiada ou Renegociada'',           ');
  qryEnvioBanco.SQL.Add('                                       ''8'', ''Cancelada'',                           ');
  qryEnvioBanco.SQL.Add('                                       ''9'', ''Paga na Folha de Benefício'')          ');
  qryEnvioBanco.SQL.Add('             ) AS NOMESITUACAO,                                                        ');

  if iIdPessoa = iIdTitular then
  begin
    qryEnvioBanco.SQL.Add('     NVL(HST.CODPORTFORMA, CPP.CODPORTFORMA) AS CODPORTFORMA,             ');
    qryEnvioBanco.SQL.Add('     CPP.PLANO,            CPP.PLACONTAC,          CPP.PLACONTAD,         ');
    qryEnvioBanco.SQL.Add('     CPP.DATAINICIO,       CPP.PLANO13,            CPP.PLACONTAC13,       ');
    qryEnvioBanco.SQL.Add('     CPP.PLACONTAD13,      CPP.CODCENTROCUSTOC13,  CPP.CODCENTROCUSTOD13, ');
    qryEnvioBanco.SQL.Add('     CPP.UNIDNEGOC13,      CPP.IDEMPRESAPROP13,    CPP.CODCENTRORESPON13, ');
    qryEnvioBanco.SQL.Add('     CPP.CODSUBCONTA13,    CPP.CODTIPRECDES13,     CPP.CODPORTFORMA13,    ');
    qryEnvioBanco.SQL.Add('     CPP.IDEMPRESA  ');
  end
  else
  begin
    qryEnvioBanco.SQL.Add('     NVL(HST.CODPORTFORMA, CPN.CODPORTFORMA) AS CODPORTFORMA,             ');
    qryEnvioBanco.SQL.Add('     CPN.PLANO,            CPN.PLACONTAC,          CPN.PLACONTAD,         ');
    qryEnvioBanco.SQL.Add('     CPN.DATAINICIO,       CPN.PLANO13,            CPN.PLACONTAC13,       ');
    qryEnvioBanco.SQL.Add('     CPN.PLACONTAD13,      CPN.CODCENTROCUSTOC13,  CPN.CODCENTROCUSTOD13, ');
    qryEnvioBanco.SQL.Add('     CPN.UNIDNEGOC13,      CPN.IDEMPRESAPROP13,    CPN.CODCENTRORESPON13, ');
    qryEnvioBanco.SQL.Add('     CPN.CODSUBCONTA13,    CPN.CODTIPRECDES13,     CPN.CODPORTFORMA13,    ');
    qryEnvioBanco.SQL.Add('     CPN.IDEMPRESA  ');
  end;

  qryEnvioBanco.SQL.Add('FROM   HSTCONTRIBPREV HST                     ');

  qryEnvioBanco.SQL.Add('JOIN   PESSOA P ON P.IDPESSOA = HST.IDPESSOA  ');

  qryEnvioBanco.SQL.Add('JOIN   CONTRIBUICAO C ON C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO              ');

  qryEnvioBanco.SQL.Add('JOIN   PARTPREVPLAN PP ON PP.IDPESSOA    = NVL(HST.IDTITULAR, HST.IDPESSOA) ');
  qryEnvioBanco.SQL.Add('                      AND PP.IDPESSJUR   = HST.IDPESSJUR                    ');
  qryEnvioBanco.SQL.Add('                      AND PP.IDPLANOPREV = HST.IDPLANOPREV                  ');
  qryEnvioBanco.SQL.Add('                      AND PP.SEQPROPOSTA = HST.SEQPROPOSTA                  ');

  qryEnvioBanco.SQL.Add('JOIN   DEPENTIT DP ON DP.IDTITULAR = NVL(HST.IDTITULAR, HST.IDPESSOA)       ');
  qryEnvioBanco.SQL.Add('                  AND DP.IDPESSOA  = HST.IDPESSOA                           ');

  qryEnvioBanco.SQL.Add('JOIN   CONTPREV CP ON CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO                ');
  qryEnvioBanco.SQL.Add('                  AND CP.IDPLANOPREV    = HST.IDPLANOPREV                   ');

  qryEnvioBanco.SQL.Add('JOIN   SITPART SP ON SP.IDSITPART = PP.IDSITPART  ');

  if iIdPessoa = iIdTitular then
  begin
    qryEnvioBanco.SQL.Add('LEFT JOIN CONTRIBPREVPARTP CPP ON HST.IDTITULAR      = CPP.IDPESSOA        ');
    qryEnvioBanco.SQL.Add('                              AND HST.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO  ');
    qryEnvioBanco.SQL.Add('                              AND HST.IDPLANOPREV    = CPP.IDPLANOPREV     ');
    qryEnvioBanco.SQL.Add('                              AND HST.IDPESSJUR      = CPP.IDPESSJUR       ');
    qryEnvioBanco.SQL.Add('                              AND HST.SEQPROPOSTA    = CPP.SEQPROPOSTA     ');
  end
  else
  begin
    qryEnvioBanco.SQL.Add('LEFT JOIN NUCLEOFAMILIAR NF ON HST.IDTITULAR = NF.IDTITULAR                ');
    qryEnvioBanco.SQL.Add('LEFT JOIN CONTRIBPREVNUCLEO CPN ON HST.IDCONTRIBUICAO = CPN.IDCONTRIBUICAO ');
    qryEnvioBanco.SQL.Add('                               AND HST.IDPESSOA       = CPN.IDPESSOA       ');
    qryEnvioBanco.SQL.Add('                               AND HST.IDPLANOPREV    = CPN.IDPLANOPREV    ');
    qryEnvioBanco.SQL.Add('                               AND HST.IDPESSJUR      = CPN.IDPESSJUR      ');
    qryEnvioBanco.SQL.Add('                               AND HST.SEQPROPOSTA    = CPN.SEQPROPOSTA    ');
  end;

  qryEnvioBanco.SQL.Add('WHERE  (HST.IDPESSOA    = :IDPESSOA )             ');
  qryEnvioBanco.SQL.Add('AND    (HST.IDPESSJUR   = :IDPESSJUR )            ');
  qryEnvioBanco.SQL.Add('AND    (HST.IDPLANOPREV = :IDPLANOPREV )          ');
  qryEnvioBanco.SQL.Add('AND    (HST.SEQPROPOSTA = :SEQPROPOSTA )          ');
  qryEnvioBanco.SQL.Add('AND    (HST.NUMRECEBIMENTO = :NUMRECEBIMENTO )    ');

end;
// edilaine - SIG35577 - fim

//Everson Cunha - SIG79795 - Início
procedure TfrmDivergContrib.edtMesRefExit(Sender: TObject);
begin
  inherited;
  if Trim(edtMesRef.Text) <> '' then
    chkMesRef.Checked := True;
end;
//Everson Cunha - SIG79795 - Fim

//Everson Cunha - SIG79795 - Início
procedure TfrmDivergContrib.chkMesRefClick(Sender: TObject);
begin
  inherited;
  if not chkMesRef.checked then
    edtMesRef.Text := '';
end;
//Everson Cunha - SIG79795 - Fim

//Everson Cunha - SIG79795 - Início
procedure TfrmDivergContrib.cmbFiltraMesRefChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
    tb97Param.Visible := False;
end;
//Everson Cunha - SIG79795 - Fim


//edilaine SIG100591 : inicio
procedure TfrmDivergContrib.chklstContribClickCheck(Sender: TObject);
var
  iIdContrib : string;
  ind : integer;
begin
  inherited;
  ind := chklstContrib.ItemIndex;
  if qryFiltroContrib.Locate('Nome',chklstContrib.Items[ind],[loCaseInsensitive,loPartialKey]) then
  begin
    iIdContrib := qryFiltroContrib.FieldByName('IdContribuicao').AsString;

    if chklstContrib.checked[ind] then
    begin
      if lstIdContrib.IndexOf(iIdContrib) = -1 then
         lstIdContrib.Add(iIdContrib);
    end
    else
    begin
      if lstIdContrib.IndexOf(iIdContrib) > -1 then
         lstIdContrib.Delete( lstIdContrib.IndexOf(iIdContrib) );
    end;
  end;

  chkContrib.Checked := lstIdContrib.Count > 0;

end;

procedure TfrmDivergContrib.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
begin
  chkListX.Items.Clear;
  qryLista.first;
  with qryLista do
  begin
     while not EOF do
     begin
        chkListX.Items.Add(FieldByName('Nome').AsString);
        Next;
     end;
  end;
end;
//edilaine SIG100591 : fim


end.
