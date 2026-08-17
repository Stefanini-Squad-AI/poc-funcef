{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------
 N. Solicitação: WO39837
 Dt Alteração..: 02/07/2026
 Responsável...: Leandro Pocebon
 Descrição.....: No objeto SqlDoc, esta buscando na tabela USUARIOSISTEMA somente
                 quando a informação é cadastrada na tabela DOCUMENTO.
-------------------------------------------------------------------------------
 N. Solicitação: WO30708
 Dt Alteração..: 20/01/2026
 Responsável...: Paulo Nobre
 Descrição.....: Devido a Migração, na função VerificaUsuXCRespon, foi retirado
                 o espaço de 10 posições inclusos ao CODCENTRORESPON.
--------------------------------------------------------------------------------
 N. Solicitação: WO27958
 Dt Alteração..: 22/11/2025
 Responsável...: Edilaine
 Descrição.....: testes pós-migracao Oracle
--------------------------------------------------------------------------------
 N. Solicitação: WO25413
 Dt Alteração..: 09/09/2025
 Responsável...: Luis Ferrari
 Descrição.....: Correção do rateio por planilha e por Rateio definido.
--------------------------------------------------------------------------------
 N. Solicitação: WO8229
 Dt Alteração..: 11/03/2024
 Responsável...: Luis Ferrari
 Descrição.....: Readequação do rateio e da tela, incluindo a importação de rateio por planilha,
                 validações e correções na tela de acordo com opção de rateio escolhido.
--------------------------------------------------------------------------------
 N. Solicitação: WO24106               
 Dt Alteração..: 06/08/2025
 Responsável...: Paulo Nobre
 Descrição.....: Incluso o campo FLGVALORBASE no objeto "SqlAlt".
                 Em dblkAlteradorExit, incluso rotina para identificar se o
                 alterador usa o valor base para a retenção de tributos, caso a
                 flag seja = 'S', então, força a atribuição ao VALORBASERETENCAO
                 do VALOR DA AP (Campo "Valor Moeda Corrente").
--------------------------------------------------------------------------------
 N. Solicitação: WO23322
 Dt Alteração..: 18/07/2025
 Responsável...: Paulo Nobre
 Descrição.....: No objeto SqlDoc, foi incluido no SQL a possibilidade de voltar
                 a mostrar o nome da usuário que lançou o documento, pois este
                 foi descaracterizado na tabela USUARIOSISTEMA..
-------------------------------------------------------------------------------
 N. Solicitação: WO14157/WO14159
 Dt Alteração..: 03/10/2024
 Responsável...: Luis Ferrari
 Descrição.....: Nova Aba de Informações Judiciais, novos campos na pesquisa.
--------------------------------------------------------------------------------
 N. Solicitação: WO 3606
 Dt Alteração..: 09/01/2024
 Responsável...: Cássio Florencio Rovaroto
 Descrição.....: Adequação do processo de alteração de AP's, fazendo a correção
                 automática da data de tributos.
--------------------------------------------------------------------------------
 N. Solicitação: WO 3524
 Dt Alteração..: 25/10/2023
 Responsável...: Cássio Florencio Rovaroto
 Descrição.....: Alteração no formato de atribuição de valor de tributação,
                 trocando arredondamento por "truncamento" na 2ª casa decimal. 
--------------------------------------------------------------------------------
 N. Solicitação: WO 3185
 Dt Alteração..: 22/09/2023
 Responsável...: Everson Cunha
 Descrição.....: Alteração de label na aba Nota Fiscal
                 De: Empresa optante pelo Simples Nacional
                 Para: Empresa isenta de tributação ou optante pelo Simples
                 Nacional
                 Pedido Leo Wagner CONTAB
--------------------------------------------------------------------------------
 N. Solicitação: WO 2946
 Dt Alteração..: 15/09/2023
 Responsável...: Everson Cunha
 Descrição.....: Ajuste aba nota fiscal para obrigar código da atividade quando
                 marcada a nota como de serviços
--------------------------------------------------------------------------------
 N. Solicitação: WO 2626
 Dt Alteração..: 01/09/2023
 Responsável...: Cássio Florencio Rovaroto
 Descrição.....: Adequação do processo de lançamento de tributação,
                 não permitindo o lançamento de alteradores de tributação com
                 AP já gerada.
--------------------------------------------------------------------------------
 N. Solicitação: WO 2522
 Dt Alteração..: 29/08/2023
 Responsável...: Cássio Florencio Rovaroto
 Descrição.....: Correção na atualização do saldo após inserção de tributação.
--------------------------------------------------------------------------------
 N. Solicitação: WO 1728
 Dt Alteração..: 02/08/2023
 Responsável...: Cássio Florencio Rovaroto
 Descrição.....: Adaptações para as definições de tipo de serviços.
--------------------------------------------------------------------------------
 N. SIG........: 136888
 Dt Alteração..: 23/06/2023
 Responsável...: Cássio Florencio Rovaroto
 Descrição.....: Inclusão de opção para definição de optante pelo Simples Nacional e
                 definição de tipo de nota.
--------------------------------------------------------------------------------
 N. SIG........: 133236
 Dt Alteração..: 27/04/2023  
 Responsável...: Cássio Florencio Rovaroto
 Descrição.....: Inclusão do tratamento de tributação de notas fiscais de serviço.
--------------------------------------------------------------------------------
 N. SIG........: 130032
 Dt Alteração..: 10/11/2022
 Responsável...: Everson Cunha
 Descrição.....: Verificar atividade projeto Sintética no rateio FDO
--------------------------------------------------------------------------------
 N. SIG........: 124994
 Dt Alteração..: 11/10/2022
 Responsável...: Everson Cunha
 Descrição.....: Permitir a inclusão de mais de um rateio FDO
--------------------------------------------------------------------------------
 N. SIG........: 117182
 Dt Alteração..: 01/12/2021
 Responsável...: Everson Cunha
 Descrição.....: Permitir a inclusão de rateio FDO mesmo nos casos em que o
                 valor total da AP não corresponda ao valor total do FDO.
--------------------------------------------------------------------------------
 N. SIG.............: 118992 e 118993
 Data da Alteração..: 17/09/2021
 Responsável........: Everson Cunha
 Descrição..........: Inclusão do campo Cod. Dossiê
--------------------------------------------------------------------------------
 N. SIG.............: 114780
 Data da Alteração..: 22/06/2021
 Responsável........: Everson Cunha
 Descrição..........: Inclusão do campo CPF/CNPJ na pesquisa
--------------------------------------------------------------------------------
//Rotina.............: TestaAlterador
//N. SIG.............: 116274
//Data da Alteração..: 27/05/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção no processo de lançamento de alteradores de retenção.
//***************************************************************************************
//Rotina.............: CmeDetalheInsert, CmeDetalheEdit, CmeDetalheConfirma,
//					           CmeCadastroFind, FormCreate, TestaAlterador, dblcTipoRDCloseUp,
//					           CmeCadastroBeforeConfirma, dblkAlteradorChange, dbLkpCbTipoServicoCloseUp,
//					           CmeDetalheDelete, dbLkpCbProcCPRBCloseUp
//N. SIG.............: 115585
//Data da Alteração..: 18/05/2021 
//Alteração Form.....: FLancDocCapCarMT
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação de definição de tipo de serviço e valor base para 
//                     alteradores de tributo.
//******************************************************************************
//Rotinas............: (dfm rateio fdo)  FormCreate, FormClose VerificaRateio
                       tbcDetalheChange, , btnGrupoRateioClick
//N. SIG..........   : 115594
//Data da Alteração: : 28/04/2021
//Responsável:       : Edilaine
//Descrição.......   : Integração com FDO Digital para rateio de lançamentos
//***************************************************************************************
//N. SIG..........   : 92533
//Data da Alteração: : 07/10/2019
//Responsável:       : Ewerton Beltramini
//Descrição.......   : Correção do carregamento de Flag de marcação da criação contabil
//                     ou não quando chamado pela folha de beneficios.
//***************************************************************************************
//Rotina.............: tbcDetalheChange
//N. SIG.............: 88813
//Data da Alteração..: 17/07/2019
//Alteração Form.....: FLancDocCapCarMT
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na verificação de dados de NFS durante a consulta do documento
//******************************************************************************
//N. SIG..........   : 82262
//Form...............: SelecionaTipoDesembolso, SqlGrupoSubQuerySomatorio
//Data da Alteração: : 25/06/2019
//Responsável:       : Darivaldo Alencar
//Descrição.......   : Correção de performance na abertura da funcionalidade
//******************************************************************************
//N. SIG..........   : 87621
//Form...............: MontaQuery
//Data da Alteração: : 14/06/2019
//Responsável:       : Andre Imakawa
//Descrição.......   : Incluir a alteração do SIG 46608
//******************************************************************************
//N. SIG..........   : 86328
//Data da Alteração: : 22/05/2019
//Responsável:       : Taffarel Sevaybriker
//Descrição.......   : Só alterar a conta bancária quando o Favorecido for alterado.
//******************************************************************************
//N. SIG..........   : 46608
//Data da Alteração: : 24/04/2019
//Responsável:       : Everson Cunha
//Descrição.......   : Inclusão do campo OBS no filtro do botão Procurar
//******************************************************************************
//Rotina             : SelDocs, verificaCodBarra
//N. SIG..........   : 81972
//Data da Alteração: : 28/02/2019
//Responsável:       : Fábio Sampaio
//Descrição.......   : Alteração para validar o código de barras apenas se existir alteração.
//***************************************************************************************
//Rotina             : FormCreate, CmeDetalheInsert, CmeDetalheEdit, CmeCadastroAtualizaBotoes
//										 tbcDetalheChange, dblcTipoRDCloseUp, SelecionaTipoDesembolso, SelDocs,
//										 CmeCadastroApplyInsert, CmeCadastroApplyEdit, CmeCadastroBeforeConfirma
//N. SIG..........   : 23656.57673
//Data da Alteração: : 01/11/2017
//Alteração Form:    : FLancDocCapCarMT
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Atualização na funcionalidade de lançamento de documento, que
//                     permite a definição de rateio para serviços que possuem cessão de
//										           mão de obra.
//***************************************************************************************
//SIG..........: 27101
//Data.........: 15/03/2017
//Responsável..: William Santana
//Descrição....: Travar inclusão do registro caso data de vencimento ou data programada não seja dia útil.
//--------------------------------------------------------------------------------------------------
//SIG..........: 20321
//Data.........: 13/07/2016
//Responsável..: Andre Imakawa
//Descrição....: Não utilizar uCtrlIntBanco, replicada algumas rotinas desse objeto para a tela.
//--------------------------------------------------------------------------------------------------
//SIG..........: 19929
//Data.........: 19/05/2016
//Responsável..: Peterson Victor
//Descrição....: Não alterar a conta
//--------------------------------------------------------------------------------------------------
//Rotina......: .dfm (gbBoleto, imgLista), DbeNossoNoKeyPress, VerificaNossoNumero, CmeCadastroInsert,
                CmeCadastroFind, FormCreate, sbtnAlterarClick, CmeCadastroApplyInsert, CmeCadastroApplyEdit,
                CmeCadastroDelete
//SOL..........: 222006-17039
//Kintana......: 712379
//Data.........: 13/04/2015     
//Responsável..: Edilaine Ferraresi
//Descrição....: Criação do campo nosso numero na funcionalidade de lançamento de documentos e alteração
//               de dados bancários.
//--------------------------------------------------------------------------------------------------
//Rotina......: -
//SOL..........: 250751
//Kintana......: 719394
//Data.........: 23/03/2013
//Responsável..: William Moreira da Silva
//Descrição....: Ao digitar qualquer letra no campo do favorecido, o sistema criticava que não existia.
 --------------------------------------------------------------------------------------------------
//Rotina......: -
//SOL..........: 188852
//Kintana......: 1784376
//Data.........: 22/03/2013
//Responsável..: higor Nayde Ferreira
//Descrição....: Aviso para avaliação de fornecedores para pagamentos feitos antes da execução do serviço.
------------------------------------------------------------------------------
Nº SOL......: 229349
Nº KINTANA..: 2063459
Data........: 01/04/2014
Responsável.: Fernando Xavier
Descrição...: Ao alterar o valor do documento 2805 o sistema esta tentando
              alterar um centro de custo.
--------------------------------------------------------------------------------
Nº SOL......: 225023
Nº KINTANA..: 2060526
Data........: 18/02/2014
Responsável.: Fernando Xavier
Descrição...: Ao alterar o tipo de despesa o sistema está mantendo a subdespesa
              anteriormente selecionada
--------------------------------------------------------------------------------
Nº SOL......: 199983
Nº KINTANA..: 1967697
Data........: 28/08/2013
Responsável.: William Santana
Descrição...: Tratamento de mensagens na verificação de FDO.
              Acrescentado try..except no CmeCadastroApplyEdit
--------------------------------------------------------------------------------
 Nº SOL......: 202079
 Nº KINTANA..: 1961212
 Data........: 15/03/2013
 Responsável.: Marcio Sanches
 Descrição...: Ajuste no erro ao tentar ALTERAR um documento a Pagar.
------------------------------------------------------------------------------
 Rotina......: CmeCadastroBeforeConfirma
 Nº SOL......: 199641
 Nº KINTANA..: 1921256
 Data........: 25/01/2013
 Responsável.: Edilaine Ferraresi
 Descrição...: permitir que o NODOCUMENTO não seja limitado pelo tipo integer
-----------------------------------------------------------------------------
 Rotina......: FormCreate
 Nº SOL......: 199363
 Nº KINTANA..: 1919425
 Data........: 23/01/2013
 Responsável.: Marcio Sanches Spinosa/ Edilaine Ferraresi
 Descrição...: validar obrigatoriedade do desembolso.
------------------------------------------------------------------------------
 Rotina......: bbtnOkDetClick
 Nº SOL......: 195755
 Nº KINTANA..: 1871968
 Data........: 04/12/2012
 Responsável.: Edilaine Ferraresi
 Descrição...: verifica se foi selecionado uma sub-despesa antes de filtrar
-----------------------------------------------------------------------------
 Nº SOL......: 172384/9603
 Nº KINTANA..: 1661662
 Data........: 25/06/2012
 Responsável.: Vander Campos
 Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
  N. Sol..........: 178983
  N. Kintana......: 1656753
  Data............: 20/07/2012
  Responsável.....: Douglas.Siqueira
  Descrição.......: Alteração LblNumAp.caption para"Nº da AR"
{-------------------------------------------------------------------------------
  N. Sol..........: 179108
  N. Kintana......: 1654527
  Data............: 27/06/2012
  Responsável.....: Edilaine Ferraresi
  Rotina..........: CmeCadastroApplyEdit
  Descrição.......: na alteração do valor do documento atualizar o alterador
                    lançado automatico por desembolso
--------------------------------------------------------------------------------
  N. Sol..........: 180549
  N. Kintana......: 1674039
  Data............: 28/05/2012
  Responsável.....: Fanuel Marinho dos Santos Junior
  Descrição.......: Correção do formato de data dos campos do grupo "Datas"
{-------------------------------------------------------------------------------
  N. Sol..........: 178962
  N. Kintana......: 1659255
  Data............: 16/15/2012
  Responsável.....: Edilaine Ferraresi
  Descrição.......: *.dfm  (sqlAlteradores)
--------------------------------------------------------------------------------
  N. Sol..........: 136242
  N. Kintana......: 813941
  Data............: 16/12/2011
  Responsável.....: Fábio Henrique Beccaria Sampaio
  Descrição.......: Implementação das FLAGs FLGSimples e FLGEspecial
-------------------------------------------------------------------------------}
{
SOL..........: 160624
Kintana......: 1351068
Data.........: 13/04/2012
Responsável..: Fernando Xavier
Descrição....: Entrada Manual de Contribuições
DFM..........: Alteração a sql do OBJETO SqlTipoDoc

{--------------------------------------------------------------------------------------------------}
{
SOL..........: 173992
Kintana......: 1569687
Data.........: 09/02/2012
Responsável..: Douglas.Siqueira
Descrição....: Foi adicionado no "SQLLancamento" no Where(L.IDUSUARIOINCLUSAO = P.IDPESSOA(+))}

{--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 136120
Nº KINTANA..: 812527
Data........: 28/11/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação de rotina para obrigar a fazer a avaliação do Fornecedor
-----------------------------------------------------------------------------------------------------}

{******************************************************************************
{
Rotina ......: CmeCadastroFind  e SqlUnidNegocio
SOL..........: 163982
Kintana......: 1404974
Data.........: 23/09/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi adicionado um procedimento para que não seja retornado em
               branco os registro que estiverem com atividades em Branco.
               O componente SqlUnidNegocio teve um filtro adicionado para que
               retorne apenas as atividades ativas.
--------------------------------------------------------------------------------
Rotina..........: SQLLancamento (formulario)
N. Sol..........: 130138
N. Kintana......: 719114
Data............: 29/03/2010
Responsável.....: Marilza Colpani
Descrição.......: Inclusão de parametros no objeto SQLLancamento do formulario.
--------------------------------------------------------------------------------
Rotina..........: AtualizaPlanoPatro, CmeDetalheInsert, CmeDetalheConfirma
N. Sol..........: 122623
N. Kintana......: 603580
Data............: 13/11/2009
Responsável.....: Ricardo Alves
Descrição.......: Criação e tratamento dos campos patrocinadora financeiro e
                  plano previdenciário financeiro}
//------------------------------------------------------------------------------
// Autor......: José Roberto Marque
// Data.......: 02/10/2011
// Sol........: 136242
// Kintana....: 813941
// Descrição..: Implementação dos lançamentos automáticos de alteradores
//              de impostos
//------------------------------------------------------------------------------
//
// Autor......: Arnaldo V. Scarin
// Data.......: 13/01/2010
// Sol........: 129613
// Kintana....: 712474
// Descrição..: Correção do erro ao alterar o Rateio de um documento
//------------------------------------------------------------------------------
//
// Autor......: Arnaldo V. Scarin
// Data.......: 19/10/2009
// Sol........: 123802 e 123804
// Kintana....: 622474 e 622272
// Descrição..: Criar rotina para lançamento automático de rateios de segregação
//              quando o tipo de desembolso/recebimento for de uso exclusivo PGA
//              (Financiamento Habitacional)
//------------------------------------------------------------------------------
// Autor......: Arnaldo V. Scarin
// Data.......: 10/09/2009
// Sol........: 121273
// Kintana....: 626031
// Descrição..: Alteração para validar a data de disponibilidade financeira
//
//--------------------------------------------------------------------------------
{Autor    : Bruno Bastos
Data      : 07.11.2007
Pendencia : 25204
Descrição : Não permitir que os valores dos rateios sejam diferentes dos escolhidos para o compromisso orçamentário.
--------------------------------------------------------------------------------
Autor     : Marcus Oliveira
Data      : 31.07.2007
Pendencia : 25312
Descrição : Mudar o parametro default do ParamGlobal para ParamCap do Plano e Patro.
--------------------------------------------------------------------------------

ANDRÉ TAVARES - PENDÊNCIA 24791 - 04/04/2007 - alterei a query SqlTipoDoc para exibir corretamente o tipo de documento se é fiscal ou não.
NVL(FLGDOCFISCAL, 'N') as FLGDOCFISCAL
--------------------------------------------------------------------------------
Autor     : Antonio Marcos (amf)
Data      : 31.05.2007
Pendencia : 25484
Descrição : Obriga dados bancários caso a forma de pagamento (tabela FORMARECPAG) tenha vínculo bancário.
--------------------------------------------------------------------------------
Autor     : Antonio Marcos (amf)
Data      : 27.04.2007
Pendencia : 24756
Descrição : Desabilita o groupbox de contas bancárias caso não haja dados bancários no cadastro do fornecedor - aba dados bancários.
--------------------------------------------------------------------------------
Autor     : Marcus Oliveira
Data      : 24.04.2007
Pendencia : 24823
Descrição : Mostrar só os portadores formas habilitados.
--------------------------------------------------------------------------------
Autor     : Antonio Marcos Fernandes de Souza (amf)
Rotina    : cmeDetalheBeforeConfirma e cmeDetalheConfirma
Data      : 12.04.2007
Pendencia : 22592
Descrição : Bloqueia a inserção de registro quando já existir um tipo de desembolso que obriga cotas.
            Exige do usuário a indicação da quantidade de cotas (aba geral)
--------------------------------------------------------------------------------
Autor     : Antonio Marcos Fernandes de Souza (amf)
Rotina    : CmeDetalheConfirma
Data      : 01.03.2007
Pendencia : 24450
Descrição : Verifica se o plano previdenciário encontra-se na lista de planos previdenciários
            cadastrados na conta corrente associada ao portador-forma.
--------------------------------------------------------------------------------
Rotina    : CadastroBeforeConfirma
Data      : 17/01/2007
Pendencia : 24201
Autor     : Marcus Oliveira
Descrição : Ativar a validações quando o usuário clicar direto no botão de "OK"
            final na aba do Rateio e corrigida a Tab Order.
--------------------------------------------------------------------------------
Rotina    : MsResOrc
Data      : 26/12/2006
Pendência : 23238
Autor     : Rodolpho da Silva
Descrição : Incluir no MS o campo IDOPERACAO
--------------------------------------------------------------------------------
Rotina    : HabilitarControles
Data      : 20.10.2006
Pendência : 23425
Autor     : Marcus Santos Oliveira
Descrição : Habilita o campo Observação na guia Geral e o Histórico Lançamento
            em dados de lançamentos no modo de pesquisa.
--------------------------------------------------------------------------------
Rotina    : BeforeConfirma
Data      : 28.08.2006
Pendência : 21704
Autor     : Antonio Marcos Fernandes de Souza(amf)
Descrição : Avisa o usuário sobre a duplicação do documento
--------------------------------------------------------------------------------
Rotina    : BeforeConfirma
Data      : 26.08.2006
Pendência : 21703
Autor     : Antonio Marcos Fernandes de Souza(amf)
Descrição : Obriga a informação de dados bancários caso a forma de pagamento
            possua vínculo bancário
--------------------------------------------------------------------------------
Rotina    : várias
Data      : 19/07/2006
Pendência : 22079, 22409, 22249
Autor     : andre tavares
Descrição : 22079 implementação da impressão de ficha de compensação ao lançar um
documento com portador forma que tenha um modelo de ficha de compesação associado;
22409 desabilitar os controles da tela se não estiver em modo de inserção ou edição;
22249 não permitir a inserção manual na aba contas de baixa.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Rotina    : event beforeConfirma
Data      : 11/07/2006
Pendência : 22788
Autor     : andre tavares
Descrição : permitir alteração da data de disponibilidade no CAR;
            somente testar a data de disponibilidade de a datadisp = 0.
--------------------------------------------------------------------------------
------------------------------------------------------------------------------
 Rotinas   :
 Data      : 10.07.2006
 Autor     : Alex / Tavares
 Pendência : 22515
 Descrição : Retiradas todas as referencias as contas contábeis da tela _Plano
             retiradas as referências ao componete ccontabil na aba contabilização. Caducou a alteração da contabilização.
             Retirado ObrigaSubconta
             Retirado TestaContaCC, TestaContaxCC
 ------------------------------------------------------------------------------
//20317 - andre tavares 23/03/2006 - selecionar os lançamentos contábeis de antecipação de receita
{------------------------------------------------------------------------------
 Rotinas   : Evento OnChange do dblookUp dos alteradores selecionados
 Data      : 27.01.2006
 Autor     : Antonio Marcos Fernandes de Souza (amf)
 Pendência : 18886
 Descrição : Adicionada a observação do Alterador Selecionado.
------------------------------------------------------------------------------
 Rotinas   : FazerInsertContab, FazContabilizacao
 Data      : 23/01/2006
 Autor     : André Tavares
 Pendência : 21283
 Descrição : não estava fazendo múltiplas conta de baixa se não integrasse com a conabilidade.
------------------------------------------------------------------------------
------------------------------------------------------------------------------
 Rotinas   : LancaContabCred
 Data      : 27/10/2005
 Autor     : Rodolpho da Silva
 Pendência : 20589
 Descrição : Corrigido o erro em que ao tentar inserir um documento, onde o
             mesmo não seja contabilizado, gerava o erro: "mensagem de conta
             contabil não cadastrada".
{------------------------------------------------------------------------------
{------------------------------------------------------------------------------
 Rotinas   : LancaContabCred
 Data      : 21/10/2005
 Autor     : Rodolpho da Silva
 Pendência : 20530
 Descrição : Corrigido o erro em que não era gravado a subconta contábil, sendo
             a mesma é obrigada no tipo de desembolso.
{------------------------------------------------------------------------------
{------------------------------------------------------------------------------
 Rotinas   : FazContabilizacao - zerando o CdsContab
             CmeCadastroBeforeConfirma,
             divs
 Data      : 02/08/2005
 Autor     : Alex Pereira
 Pendência : 19870 - Erro ao remontar contabilização do documento
 Descrição : Este erro somente ocorria quando clicado o botão ok final da tela
             tivesse qualquer tipo de erro no processo, desta forma a
             contabilização não era excluída para remontar nova.
             O problema foi causado pelo desenvolvimento da pendência 18937.
             A variável: bConfirmou não voltava para false - retirada a variável
{------------------------------------------------------------------------------
{------------------------------------------------------------------------------
 Rotinas   : VerificaSeDocAdiantEstaRegularizado
 Data      : 22/06/2005
 Autor     : Rodolpho da Silva
 Pendência : 18588
 Descrição : Não permitir que documentos com adiantamentos já regularizados
             sejam alterados sem antes excluir a regularização do mesmo
{------------------------------------------------------------------------------
{------------------------------------------------------------------------------
 Rotinas   : VerificaPreenchimentoSegregaDetalhe
 Data      : 20/05/2005
 Autor     : Alex Pereira
 Pendência : 19296
             Quando o parâmetro segregação virtual está ligado o sistema está
             dando erro no momento de se inserir um rateio
{------------------------------------------------------------------------------
 Rotinas   : LancaContabDeb
 Data      : 18/05/2005
 Autor     : Alex Pereira
 Pendência : 19281
         // Na alteração do documento o cdsdet não tem o campo PLACONTACREDITO preenchida
         // se a parametrização da conta contábil for feita no cadastro do fornecedor,
         // pois este preenchimento seria feito o evento dblcTipoRDCloseUp
         // neste caso precisamos verificar se a conta está nula para utilizarmos a conta
         // do fornecedor

         Corrigida a alteração do documento, quando a conta contábil de baixa é parametrizada
         no cadastro do fornecedor.
         Corrigido acesso aos botões alterar e excluir para documentos de outros módulos.
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
 Rotinas   : procure pelo número da pendência
 Data      : 27/04/2005
 Autor     : André Tavares
 Pendência : 19097
 Descrição : retirar os parâmetros FLGEXCLUIPLANIL e FLGEXCLUICONTAB
------------------------------------------------------------------------------}
//------------------------------------------------------------------------------
// Data      : 25/04/2005
// Autor     : Marcio Motta
// Pendência : 17317
// Descrição : Inclusão de Utilização de Históricos Contábeis
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Data      : 13/04/2005
// Autor     : André Tavares
// Pendência : 18937
// Descrição : Desabilitar os botoes de inserir excluir e alterar da aba de contabilização
// e deletar a contabilizacao ao sair da aba.
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Data      : 24/03/2005
// Autor     : Rodolpho da Silva
// Pendência : 18368
// Descrição : Não permitir que seja possível alterar a DATAPROGRAMADA
//             para um período bloqueado da Contabilidade
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Data      : 14/01/2005
// Autor     : Rodolpho da Silva
// Pendência : 18324
// Descrição : Não permitir que ao importar um arquivo txt com os campos obrigatórios
//             preenchidos e principalmente com critério de segregação o sistema,
//             no momento em que o usuário por algum motivo altera o documento o
//             sistema apagava o critério de segregação da tabela documento.
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Data      : 14/12/2004
// Autor     : Alex Pereira
// Pendência : 18107
// Descrição : fazer as críticas por programa, quando o plano administrativo foi parametrizado
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Data      : 22/11/2004
// Autor     : Bruno Bastos
//            (Alteração feita a pedido do Alex. Não analisei. Somente fiz.)
// Pendência : 18126
// Descrição : Alteração da propriedade filtro do componente MontaSelect
//             Saiu: TIPODOCRECPAG.DEBCRE = LANCTODOCUM.DEBCRE
//             Entrou: (TIPODOCRECPAG.DEBCRE = LANCTODOCUM.DEBCRE) OR (DOCUMENTO.OPERACAO = '15')
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotinas   : SQLPlanoPrev.SQL
// Data      : 22/10/2004
// Autor     : Alex Pereira
// Pendência : 17587 / 17590
// Descrição : Interpretar se o PlanoPrevContabil está ativo ou não
//------------------------------------------------------------------------------
// Rotinas   : Componente MontaSelect
// Data      : 27/08/2004
// Autor     : André Tavares
// Pendência : 17684
// Descrição : Alteração na query do MontaSelect
//------------------------------------------------------------------------------
// Rotinas   : FormCreate, SelDocs
// Data      : 04/08/2004
// Autor     : André Tavares
// Pendência : 17290
// Descrição : correcao de erro na pasta de contabilizaçao no combo centro de custo
//------------------------------------------------------------------------------
// Rotinas   : Várias
// Data      : 04/08/2004
// Autor     : David Ayrolla
// Pendência : 17232
// Descrição : Limitar a retenção de INSS de autônomos ao teto.
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotinas   : FormCreate, SelDocs
// Data      : 28/06/2004
// Autor     : André Tavares
// Pendência : 16975
// Descrição : esconde o campo de compromisso orcamentario se estiver co contas a receber.
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotinas   : LancaContabDeb, LancaContabCred, btnGrupoRateioClick
// Data      : 18/06/2004
// Autor     : André Tavares
// Pendência : 16992
// Descrição : Quando se faz um rateio pré-definido, não estava contabilizando corretamente.
//------------------------------------------------------------------------------
// Rotinas   :
// Data      : 07/06/2004 (Término)
// Autor     : David Ayrolla
// Pendência : 14646
// Descrição : Criação de processo RAD no lançamento de documentos.
//------------------------------------------------------------------------------
// Rotinas   :
// Data      : 21/05/2004
// Autor     : André Tavares
// Pendência : 15367 e 15368
// Descrição : substituição das queries que listam Centro de Custo e Centro de
//Responsabilidade por métodos do CmGlobalObj50 que já contemplam o DE-PARA
//
//
//------------------------------------------------------------------------------
// Rotinas   : CmeCadastroApplyDelete
// Data      : 27/04/2004
// Autor     : Alex Pereira
// Pendência : 16220
// Descrição : Implementar a conciliação de CPMF em Lança e baixa simultanea,
//             Passar parâmetro com o número do lote para exclusão do documento
//             com lança e baixa simultânea
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotinas   : nenhuma
// Data      : 19/04/2004
// Autor     : André Tavares
// Pendência : 15866
// Descrição : Adicionar no grid da pasta Rateio o campo Num. do compromisso orçamentário.
//------------------------------------------------------------------------------

{ -----------------------------------------------------------------------------}
// Rotinas   : TfrmLancDocCAPCAR.CmeDetalheConfirma
//             VerificaPreenchimentoSegregaMestre
//             VerificaPreenchimentoSegregaDetalhe
//             FazContabilizacao  /  FazerInsertContab
// Data      : 22/01/2004
// Autor     : Alex Pereira
// Pendência : 14451
// Descrição : Ocultar Atividade/Projeto no cadastro do alterador.
//             Travar lançamentos
//             SE PARAMINTEGRA.SEGREGAVIRTUAL
//                E LANCA E BAIXA SIMULTANEA
//                  ENTÃO OBRIGAR PLANO = COMUM
//                              E PATRO = COMUM
//             MOTIVO: BAIXA DO FLUXO PRIMÁRIO SEGREGADO (NOVA SEGREGAÇÃO)
//
// Data      : 22/01/2004
// Descrição : Corrigido o adiantamento.
//------------------------------------------------------------------------------
// Rotinas   : Várias
// Data      : 16/01/2004 (término)
// Autor     : David Ayrolla
// Pendência : 14393
// Descrição : Implementação de retenção de INSS para autônomos.
//------------------------------------------------------------------------------
// Rotina    : várias
// Data      : até 19/05/2003 a 27/05/2003
// Autor     : André Pontes
// Descrição : Implementação de lançamento através de percentuais de rateio
//             pré-definidos
//------------------------------------------------------------------------------
// Rotina    : FormCreate
// Data      : 28/08/2003
// Autor     : David Ayrolla
// Descrição : Filtragem dos tipos de desembolso pelo campo ATIVO
// Pendência : 14458
//------------------------------------------------------------------------------
// Rotina    : SetaCentResponDesemb
// Data      : 18/12/2003
// Autor     : David Ayrolla
// Descrição : O campo centro de responsabilidade permanecia vazio mesmo após o
//             seu preenchimento (em algumas estações). Resolvi o problema
//             mudando a filtragem da query que o preenche.
// Pendência : 15656
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotina    : sbtnAlterarClick
// Data      : 18/12/2003
// Autor     : Alex Pereira
// Descrição : Se a tela estivesse em com a guia Rateio ativa, procurar um
//             documento clicar alterar do documento e clicar alterar do detalhe
//             estava dando erro pois o form de herança não encontrava o grid
//             do detalhe.
// Pendência : 15832
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotina    : SelDocs
// Data      : 14/01/2004
// Autor     : Alex Pereira
// Descrição : Criar a aba Contas baixa para mostrar o rateio para documentos
//             com múltiplas contas de baixa.
// Pendência : 15862
//------------------------------------------------------------------------------}
{******************************************************************************}
{  Sistema - Contas a Pagar                                                    }
{  Unit    - FLancDocCapCarMT                                                  }
{******************************************************************************}

unit FLancDocCapCarMT;

interface

uses
   WIndows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MontaSelect, DBTables, Db, Wwdatsrc, TB97,
   MAHlpBtn, StdCtrls, Buttons, Grids, TB97Tlbr, TB97Ctls, IvDictio,
   IvMulti, IvEMulti, CMProcuraMask, CMProcuraSubTipo, CMDBLookupCombo,
   ppComm, ppProd, ppClass, ppReport, ppTypes, CMProcura, EditReg,
   wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro, ImgList,
   DBClient, uCMClientDataSet, uCmSqlParams, uCMTypes, FCadastroMestreDetMT,
   Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook,
   TREdit, wwdbedit, DBCtrls, uCtrlPeriodo, uCtrlDocumento, uCtrlLancDocCapCar,
   uCtrlPadroes, uCtrlIntBanco, uCtrlGrupoRateio, uCtrlParamCap, CMDatabase,ComObj,
   // 23/01/04 Alex 14451
   uCtrlSegregacao,
   // 01/04/2004 Marchetti 15733 e 15734
   uCtrlPlanPrevContabPatro,
   // André Tavares - pendência 15367 - 20/05/2004
   uctrlCentRespon, uctrlCentroCusto,
   // Marcio Motta - 17317 - 20/04/2005
   uListaCamposHistCapCar, uCtrlModeloHistorico,
   // amf p:18886 - 27.01.2006
   uCtrlTipoAlterador,uCtrlParamGlobal,
   fConfigBarrasCMMT,

   //Marcus Oliveira 07/11/06
   uModulo,

   //amf 01.03.2007 24450
   uCtrlPortadorConta,
   uCtrlPortadorForma,
   uCtrlTipoRecebDesemb,

   //amf 31.05.2007 25484
   uCtrlPessoaForne,
   uCtrlFormaRecPag,
   // Início Sol: 136242 Ktn: 813941 - JRM6
   uCtrlAlteradorImpostos,
   // Término Sol: 136242 Ktn: 813941 - JRM6

   uCtrlListaServicos, //Cássio Rovaroto - SIG nº 123523

   uCtrlIntegraOrcFDO,                    //edilaine SIG115594
   uDialogsCapCar, // edilaine - SOL 222006-17039 / PPM 712379

   FSelAltTributacao, //Cássio Rovaroto - SIG nº 123523
   uCtrlPlacontasCapCar, dxCntner, dxEditor, dxEdLib, dxDBELib,
   // Inicio WO8229 Ferrari
   UImportaArquivoNovo,
   // Fim  WO8229 Ferrari
   FJustificativa, FCadForne, uCtrlAvaliacaoFornec, wwQuery; //Thaise - SOL 126120

type
   TContabDoc = record
      PLANO          : Integer;
      PLACONTA       : String;
      CODCENTROCUSTO : String;
   end;

   TfrmLancDocCAPCAR = class(TFrmCadastroMestreDetMT)
      dsContabil: TwwDataSource;
      tbsContabil: TTabSheet;
      dbgrdContabil: TwwDBGrid;
      pnlContabil: TPanel;
      sbtnEstornar: TToOlbarButton97;
      tbsLancamento: TTabSheet;
      dbgLancamentos: TwwDBGrid;
      dsLancamento: TwwDataSource;
      TbsAlteradores: TTabSheet;
      PnlAlteradores: TPanel;
      TbsGeral: TTabSheet;
      GpBarras: TGroupBox;
      Label5: TLabel;
      DbeBarras: TwwDBEdit;
      DbeLInhaDigit: TwwDBEdit;
      GpConta: TGroupBox;
      Label14: TLabel;
      Label15: TLabel;
      Label18: TLabel;
      DbEdtConta: TwwDBEdit;
      DbEdtBanco: TwwDBEdit;
      DbEdtAgencia: TwwDBEdit;
      DBText1: TDBText;
      Label9: TLabel;
      MemObs: TDBMemo;
      ImlDocs: TImageList;
      PnlRateioGeral: TPanel;
      lblUnidNegoc: TLabel;
      lblCentroRespon: TLabel;
      lblTipoRD: TLabel;
      Label6: TLabel;
      dblcUnidNegoc: TwwDBLookupCombo;
      dblcCentroRespon: TwwDBLookupCombo;
      dblcTipoRD: TwwDBLookupCombo;
      CmbCentCusto: TwwDBLookupCombo;
      BtnBuscaContaCor: TSpeedButton;
      GpDotorc: TPanel;
      SpeedButton1: TSpeedButton;
      ReResorc: TDBRealEdit;
      Label17: TLabel;
      PnlPrograma: TPanel;
      Label13: TLabel;
      CmbPrograma: TCMDBLookupCombo;
      edMoedaDet: TEdit;
      lblMoedaDet: TLabel;
      dbeValorMoedaDet: TRealEdit;
      lblValorOutDet: TLabel;
      dbeValorDet: TRealEdit;
      lblValorDet: TLabel;
      GrdAlteradores: TwwDBGrid;
      DsAlteradores: TwwDataSource;
      lblAlterador: TLabel;
      lblValOut: TLabel;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label20: TLabel;
      EdtHist: TDBEdit;
      DtLancto: TCMDateTimePicker;
      DbROutraMoeda: TDBRealEdit;
      DbrValor: TDBRealEdit;
      dblkAlterador: TwwDBLookupCombo;
      DbrValLiquido: TDBRealEdit;
      DclAtivProjeto: TwwDBLookupCombo;
      CkbContabiliza: TDBCheckBox;
      MsResORc: TMontaSelect;
      LblEstorno: TLabel;
      TbsDadosLanc: TTabSheet;
      SqlDoc: TCMSqlParams;
      SQLDet: TCMSqlParams;
      CdsDet: TCMClientDataSet;
      SqlContab: TCMSqlParams;
      CdsContab: TCMClientDataSet;
      SQLAlteradores: TCMSqlParams;
      CdsAlteradores: TCMClientDataSet;
      SQLLancamento: TCMSqlParams;
      CdsLancamento: TCMClientDataSet;
      LblMesmaData: TLabel;
      SQLMoeda: TCMSqlParams;
      CdsMoeda: TCMClientDataSet;
      CdsDadosConta: TCMClientDataSet;
      SqlDadosConta: TCMSqlParams;
      SQLPlanoPrev: TCMSqlParams;
      CdsPlanoPrev: TCMClientDataSet;
      SQLProgramaPrev: TCMSqlParams;
      CdsProgramaPrev: TCMClientDataSet;
      SQLPatroPrev: TCMSqlParams;
      CdsPatroPrev: TCMClientDataSet;
      SQLTipoRD: TCMSqlParams;
      CdsTipoRD: TCMClientDataSet;
      CdsAlt: TCMClientDataSet;
      SqlAlt: TCMSqlParams;
      CdsSubContaForCli: TCMClientDataSet;
      SqlSubContaForCli: TCMSqlParams;
      SqlValida: TCMSqlParams;
      CdsValida: TCMClientDataSet;
      SqlSubConta: TCMSqlParams;
      CdsSubConta: TCMClientDataSet;
      SqlCentroRespon: TCMSqlParams;
      CdsCentroRespon: TCMClientDataSet;
      SqlPortForma: TCMSqlParams;
      CdsPortForma: TCMClientDataSet;
      SqlCCusto: TCMSqlParams;
      CdsCCusto: TCMClientDataSet;
      SqlAuxTipoRD: TCMSqlParams;
      CdsAuxTipoRD: TCMClientDataSet;
      SqlTipoDoc: TCMSqlParams;
      CdsTipoDoc: TCMClientDataSet;
      SqlCentroCusto: TCMSqlParams;
      CdsCentroCusto: TCMClientDataSet;
      CdsUnidNegoc: TCMClientDataSet;
      SqlUnidNegoc: TCMSqlParams;
      SqlFormaPag: TCMSqlParams;
      CdsFormaPag: TCMClientDataSet;
      SqlCliAdianto: TCMSqlParams;
      CdsForCliAdianto: TCMClientDataSet;
      SqlForneAdianto: TCMSqlParams;
      CdsAux: TCMClientDataSet;
      SqlAux: TCMSqlParams;
      PnlDados: TPanel;
      lblHistorico: TLabel;
      dbeHistorico: TwwDBEdit;
      gbDatas: TGroupBox;
      lblData: TLabel;
      lblEmissao: TLabel;
      lblVencimento: TLabel;
      lblProgramada: TLabel;
      dbeDataLanc: TCMDateTimePicker;
      dbeDataEmi: TCMDateTimePicker;
      dbeDataVenc: TCMDateTimePicker;
      dbeDataProgr: TCMDateTimePicker;
      gbOutros: TGroupBox;
      cbEnglobParc: TCheckBox;
      cbLancaBaixa: TCheckBox;
      cbIntegra: TCheckBox;
      BtnStatus: TToolbarButton97;
      Label10: TLabel;
      DBText3: TDBText;
      DBText2: TDBText;
      lblModulo: TLabel;
      Bevel2: TBevel;
      Image1: TImage;
      LblDIspFinanc: TLabel;
      dbeDataDisponib: TCMDateTimePicker;
      sqlGrupoRateio: TCMSqlParams;
      cdsGrupoRateio: TCMClientDataSet;
      CdsIDGRUPORATEIO: TFloatField;
      CdsIDMODULO: TFloatField;
      CdsGRRDESCRICAO: TStringField;
      cdsPadraoRateio: TCMClientDataSet;
      cdsVerificaRateio: TCMClientDataSet;
      tbsContasBaixa: TTabSheet;
      wwDBGrid1: TwwDBGrid;
      sqlCCBaixasXDocum: TCMSqlParams;
      CdsCCBaixasXDocum: TCMClientDataSet;
      dsCCBaixasXDocum: TwwDataSource;
      Label11: TLabel;
      Label12: TLabel;
      Label16: TLabel;
      EdtImovel: TwwDBEdit;
      CmbPlano: TCMDBLookupCombo;
      CmbPatro: TCMDBLookupCombo;
      SqlProcessoRad: TCMSqlParams;
      CdsProcessoRad: TCMClientDataSet;
    DBCheckBox1: TDBCheckBox;
    grBoxRAD: TGroupBox;
    dbtxtNumProc: TDBText;
    lblProcesso: TLabel;
    Label19: TLabel;
    dbtxtStatusProc: TDBText;
    SqlRAD: TCMSqlParams;
    cdsRAD: TCMClientDataSet;
    DsRAD: TwwDataSource;
    Label4: TLabel;
    RdFicha: TRadioButton;
    RdArrecad: TRadioButton;
    Label21: TLabel;
    mmObsAlt: TMemo;
    sqlContaBancaria: TCMSqlParams;
    cdsContaBancaria: TCMClientDataSet;
    PnlOpcao: TPanel;
    PnlGeral: TPanel;
    Dbereferencia: TwwDBEdit;
    DblCodForma: TwwDBLookupCombo;
    CmbSubConta: TwwDBLookupCombo;
    PnlLancPrin: TPanel;
    lblMoeda: TLabel;
    lblTipoDocum: TLabel;
    Bevel1: TBevel;
    DbeNoDocumento: TwwDBEdit;
    CmpForCli: TCMProcuraForCli;
    dbeCompl: TwwDBEdit;
    dbenNumDoc: TDBRealEdit;
    dblcMoeda: TwwDBLookupCombo;
    dbeValorMoeda: TDBRealEdit;
    dbeValorCorrente: TDBRealEdit;
    dblcTipoDoc: TwwDBLookupCombo;
    dblcPortadorForma: TwwDBLookupCombo;
    dbenChBordero: TDBRealEdit;
    lblValor: TLabel;
    Label7: TLabel;
    lblValorMoeda: TLabel;
    lblNumDoc: TLabel;
    lblBarra: TLabel;
    lblPortadorForma: TLabel;
    lblNumChBordero: TLabel;
    LblSubContaCli: TLabel;
    LblFormaPag: TLabel;
    Label8: TLabel;
    PnlAp: TPanel;
    LblNumAp: TLabel;
    BtnNumApgr: TSpeedButton;
    EdtNumAp: TwwDBEdit;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    dbQtdeCota: TDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    dbtxtNOMEPATRO: TDBText;
    dbtxtDESCPLANO: TDBText;
    tbsVinculacao: TTabSheet;
    dbgVinculacao: TwwDBGrid;
    sqlDocPai: TCMSqlParams;
    cdsDocPai: TCMClientDataSet;
    dsDocPai: TwwDataSource;
    btnInsereAlteradores: TToolbarButton97;
    dbchkFlgEspecial: TDBCheckBox;
    cdsSubDespesaRateio: TCMClientDataSet;
    Label23: TLabel;
    CboSubDespesa: TCMDBLookupCombo;
    Label24: TLabel;
    cboAlteradoresDescRateio: TwwDBLookupCombo;
    cdsSubDespesaAlteradores: TCMClientDataSet;
    gbBoleto: TGroupBox;
    DbeNossoNo: TwwDBEdit;
    Label25: TLabel;
    pnlSituacao: TPanel;
    btnBolSit: TToolbarButton97;
    imgLista: TImageList;
    tbsNotaFiscal: TTabSheet;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    dbEdtNotaFiscal: TwwDBEdit;
    dbEdtNumSerie: TwwDBEdit;
    dbDtpDataEmissao: TCMDateTimePicker;
    dbMmDadosAdicoinaisNfs: TDBMemo;
    cdsTipoServico: TCMClientDataSet;
    cdsProcessos: TCMClientDataSet;
    sqlTipoServico: TCMSqlParams;
    sqlProcessos: TCMSqlParams;
    dsTipoServico: TDataSource;
    dsProcessos: TDataSource;
    edtValorBruto: TRealEdit;
    lblTipoServico: TLabel;
    dbLkpCbTipoServico: TwwDBLookupCombo;
    lblProcessos: TLabel;
    dbLkpCbProcCPRB: TwwDBLookupCombo;
    Bevel3: TBevel;
    edtValorBaseRetencao: TDBRealEdit;
    lblValorBaseRetencao: TLabel;
    cmProcListaServicos: TCMProcura;
    lblAtivProdServ: TLabel;
    msListaServico: TMontaSelect;
    btnAddAlteradores: TBitBtn;
    rgTipoNF: TRadioGroup;
    dbchkFlgSimples: TDBCheckBox;
    TbsInfoJudicial: TTabSheet;
    lblParteContraria: TLabel;
    dbecontraParte: TwwDBEdit;
    dbedtCodDossie: TwwDBEdit;
    rgFuncef: TRadioGroup;
    lblCodDossie: TLabel;
    lblNumeroProcesso: TLabel;
    edtNumeroProc: TMaskEdit;
    odAbreArq: TOpenDialog;
    pnlrateio: TPanel;
    Label26: TLabel;
    sbtnSelArquivo: TToolbarButton97;
    rbFDO: TRadioButton;
    edNumFDO: TEdit;
    dblkCResponsa: TwwDBLookupCombo;
    rbRateioPre: TRadioButton;
    DBcboGrupoRateio: TwwDBLookupCombo;
    edtArquivo: TEdit;
    rbPLANILHA: TRadioButton;
    btnGrupoRateio: TBitBtn;
    pnlResultado: TPanel;
    Panel2: TPanel;
    pnlMensagem: TPanel;
    memResultado: TMemo;
    dbgrdRateio: TwwDBGrid;
    dsPadraoRateio: TwwDataSource;
    pnlCorrecaoRateio: TPanel;
    Label27: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    dblcUnidNegPlanilha: TwwDBLookupCombo;
    dblcCentroRespPlanilha: TwwDBLookupCombo;
    dblcTipoRDPlanilha: TwwDBLookupCombo;
    cmdCCustoPlanilha: TwwDBLookupCombo;
    Panel4: TPanel;
    Label46: TLabel;
    cmdProgPlanilha: TCMDBLookupCombo;
    dbeValorPlanilha: TRealEdit;
    cmdPlanoPlanilha: TCMDBLookupCombo;
    cmdPatroPlanilha: TCMDBLookupCombo;
    Dock975: TDock97;
    Bevel4: TBevel;
    Toolbar972: TToolbar97;
    sbtnAltPadrao: TToolbarButton97;
    sbtnExcluiPadrao: TToolbarButton97;
    Dock976: TDock97;
    Toolbar973: TToolbar97;
    bbtnOkPadrao: TBitBtn;
    bbtnCancelarPadrao: TBitBtn;
    bbtnVoltarPadrao: TBitBtn;
    Label36: TLabel;
    lblTotal: TLabel;
    sbtnIncPadrao: TToolbarButton97;
      procedure FormCreate(Sender: TObject);
      procedure tbcDetalheChange(Sender: TObject);
      procedure dbeValorMoedaExit(Sender: TObject);
      procedure dbeValorMoedaDetExit(Sender: TObject);
      procedure dblcUnidNegocExit(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure sbtnEstornarClick(Sender: TObject);
      procedure dblcMoedaExit(Sender: TObject);
      procedure dbeDataVencExit(Sender: TObject);
      procedure sbtnInserirClick(Sender: TObject);
      procedure bbtnOkDetClick(Sender: TObject);
      procedure bbtnCancelarDetClick(Sender: TObject);
      procedure bbtnVoltarDetClick(Sender: TObject);
      procedure sbtnInsDetClick(Sender: TObject);
      procedure sbtnAltDetClick(Sender: TObject);
      procedure sbtnExcluiDetClick(Sender: TObject);
      procedure dbeValorCorrenteChange(Sender: TObject);
      procedure sbtnAlterarClick(Sender: TObject);
      procedure sbtnApagarClick(Sender: TObject);
      procedure dsLancamentoDataChange(Sender: TObject; Field: TField);
      procedure cbLancaBaixaClick(Sender: TObject);
      procedure CmpForCliEnter(Sender: TObject);
      procedure CmpForCliExit(Sender: TObject);
      procedure dblcTipoRDCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: boolean);
      procedure SpeedButton1Click(Sender: TObject);
      procedure dblcCentroResponExit(Sender: TObject);
      procedure DbeNoDocumentoExit(Sender: TObject);
      procedure dblcTipoDocExit(Sender: TObject);
      procedure dbeDataEmiExit(Sender: TObject);
      procedure BtnNumApgrClick(Sender: TObject);
      procedure dbeValorCorrenteExit(Sender: TObject);
      procedure CmbProgramaExit(Sender: TObject);
      procedure CmbPlanoExit(Sender: TObject);
      procedure CmbPatroExit(Sender: TObject);
      procedure CmbCentCustoExit(Sender: TObject);
      procedure dblcTipoRDExit(Sender: TObject);
      procedure CmbCentCustoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: boolean);
      procedure dblcUnidNegocCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: boolean);
      procedure CmpForCliApertouBotao(Sender: TObject);
      procedure CmbProgramaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: boolean);
      procedure CmbPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: boolean);
      procedure CmbPlanoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: boolean);
      procedure BtnBuscaContaCorClick(Sender: TObject);
      procedure DclAtivProjetoExit(Sender: TObject);
      procedure dblkAlteradorExit(Sender: TObject);
      procedure DbrValorExit(Sender: TObject);
      procedure CdsalteradoresAfterInsert(DataSet: TDataSet);
      procedure cbEnglobParcClick(Sender: TObject);
      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeDetalheConfirma(Sender: TObject);
      procedure CmeDetalheEdit(Sender: TObject);
      procedure CmeDetalheInsert(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure dblcCentroResponCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure CdsAfterOpen(DataSet: TDataSet);
      procedure CdsDetAfterOpen(DataSet: TDataSet);
      procedure CdsUnidNegocAfterOpen(DataSet: TDataSet);
      procedure CdsTipoRDAfterOpen(DataSet: TDataSet);
      procedure CdsDetAfterInsert(DataSet: TDataSet);
      procedure CdsLancamentoAfterOpen(DataSet: TDataSet);
      procedure CdsContabAfterOpen(DataSet: TDataSet);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
      procedure CdsAlteradoresAfterPost(DataSet: TDataSet);
      procedure CdsDetAfterCancel(DataSet: TDataSet);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure DBcboGrupoRateioExit(Sender: TObject);
      procedure btnGrupoRateioClick(Sender: TObject);
    procedure dblcTipoRDEnter(Sender: TObject);
    procedure ReResOrcExit(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure RdFichaClick(Sender: TObject);
    procedure RdArrecadClick(Sender: TObject);
    procedure DbeBarrasExit(Sender: TObject);
    procedure DbeLinhaDigitExit(Sender: TObject);
    procedure dblkAlteradorChange(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dblcTipoDocChange(Sender: TObject);
    procedure dbQtdeCotaChange(Sender: TObject);
    procedure cdsDocPaiAfterOpen(DataSet: TDataSet);
    procedure FazerAvaliacao;
    procedure JustificarFornec;
    procedure AbrirAvaliacao;
 // SOL 189828 KTN 1794500 - Paulo Nobre
      //procedure FazChamadaAlteradores;
//      Procedure SalvaDadosParaAlteradores;
    procedure btnInsereAlteradoresClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dsDetDataChange(Sender: TObject; Field: TField);
    procedure CmpForCliChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DbeNossoNoKeyPress(Sender: TObject; var Key: Char);
    procedure CmeCadastroDelete(Sender: TObject);
    Function  ObrigaDadosBancarios(iBanco, iFormaPag: Integer): Boolean; // Andre Imakawa - SIG20321
    Function  ValidaCodBarrasSispag(sCodBarras: String; idv: Integer): Boolean; // Andre Imakawa - SIG20321
    Function  ValidaCodBarrasArrecad(sCodBarras: String): Boolean;
    procedure dbeDataProgrChange(Sender: TObject);
    procedure dbeDataVencChange(Sender: TObject);
    procedure dbLkpCbTipoServicoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edNumFDOKeyPress(Sender: TObject; var Key: Char);
    procedure rbFDOClick(Sender: TObject); // Andre Imakawa - SIG20321
    procedure CmeDetalheDelete(Sender: TObject);
    procedure dbLkpCbProcCPRBCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);// Andre Imakawa - SIG20321
    procedure cmProcListaServicosValidaDados(Sender: TObject);
    procedure btnAddAlteradoresClick(Sender: TObject);
    procedure rgTipoNFClick(Sender: TObject);
    procedure rgFuncefClick(Sender: TObject);
    procedure sbtnSelArquivoClick(Sender: TObject);
    procedure rbPLANILHAClick(Sender: TObject);
    procedure rbRateioPreClick(Sender: TObject);
    procedure dblcUnidNegPlanilhaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcUnidNegPlanilhaExit(Sender: TObject);
    procedure dblcCentroRespPlanilhaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCentroRespPlanilhaExit(Sender: TObject);
    procedure cmdProgPlanilhaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmdProgPlanilhaExit(Sender: TObject);
    procedure cmdPatroPlanilhaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcTipoRDPlanilhaExit(Sender: TObject);
    procedure bbtnOkPadraoClick(Sender: TObject);
    procedure bbtnCancelarPadraoClick(Sender: TObject);
    procedure bbtnVoltarPadraoClick(Sender: TObject);
    procedure sbtnAltPadraoClick(Sender: TObject);
    procedure cmdCCustoPlanilhaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcTipoRDPlanilhaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmdPlanoPlanilhaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmdPlanoPlanilhaExit(Sender: TObject);
    procedure dbeValorPlanilhaExit(Sender: TObject);
    procedure sbtnExcluiPadraoClick(Sender: TObject);
    procedure sbtnIncPadraoClick(Sender: TObject);

   private  // Private declarations
      //andre tavares - pendência 22079 - 14/07/2006
      _FrmConfigBarrasCMMT : TFrmConfigBarrasCMMT;
      placontas: TPlacontas;

      sDataLanc         : String; // André Tavares - pendência 18937 - 22/04/2005
      ctrlCentRespon    : TCtrlCentRespon;// André Tavares - pendência 15367 - 20/05/2004
      CtrlIntBanco      : TCtrlIntBanco;
      CtrlGrupoRateio   : TCtrlGrupoRateio;
      CtrlParamCap      : TCtrlParamCap;
      // 23/01/04 Alex 14451
      CtrlSegregacao    : TCtrlSegregacao;
      // amf 18886 27.01.2006
      CtrlTipoAlterador : TCtrlTipoAlterador;

      //amf 01.03.2007 24450
      CtrlPortadorConta : TCtrlPortadorConta;
      CtrlPortadorForma : TCtrlPortadorForma;

      //amf 12.04.2007 22592
      ctrlTipoRecebDesemb: TCtrlTiporecebdesemb;

      CtrlAvaliacaoFornec: TCtrlAvaliacaoFornec;

      //amf 31.05.2007 25484
      CtrlPessoaForne: TCtrlPessoaForne;
      CtrlFormaRecPag: TCtrlFormaRecPag;

      CtrlParamGlobal   : TCtrlParamGlobal;
      CtrlIntegraOrcFDO : TCtrlIntegraOrcFDO;                //edilaine SIG115594
      CtrlListaServicos : TCtrlListaServicos;

      _IdForCliAdianto: Integer;
      _DataLancto: TDateTime;
      _DataDisponib : TDateTime;
      _CodTipDoc: Integer;
      _CodLancCAPCAR: Integer;
      _CodLancContab: Integer;
      _cdsAux : TcmClientDataset;
      _CodCentroRespon: String;
      _NomeCentroRespon: String;
      _Ativproj: String;
      _Crespom: String;
      _Tpdesmb: String;
      _Ccusto: String;
      _Programa : string;
      _PlanoPrevDet: Integer;
      _PatroDet: Integer;
      _Modulo: Integer;
      _ContaCliFor: String;
      _CCustoCliFor: String;
      _Valida: Boolean;
      _ContabDoc :TContabDoc;
      _IdCidade: Integer;
      _IdPais: Integer;
      _UF: String;
      _UsoPGA : Boolean;
      FlgExit : Boolean;// flg para evitar passar duas vezes o exit //Higor Nayde SOL 188854 Kintana 1784331

      _NossoNumero : string;   // edilaine - SOL 222006-17039 / PPM 712379

      _LiberaAlteracaoOutroSistema: Boolean;
      AbrindoTela: Boolean; //Bruno Bastos - Pend. 14399 e 14400 - 14/08/2003
      sCodCentResp: String;

      _ValorCotacao: Double;

      //Marcus Oliveira 23425
      iContaXCaixa: integer;

      _ValorEdit: Double;
      _ValorCorrente: Double;
      _ValorMoeda: Double;

      _LancDocCapCar: TCtrlLancDocCapCar;
      _oPeriodo: TCtrlPeriodo;
      _oDocumento: TCtrlDocumento;

      // 23/01/04 Alex 14451 definir o critério para segregação
      sDescSegregaCriter: string;
      FlgServicoExec: boolean; //Higor Nayde SOL 188852 Kintana 1784376
      FlgExec: string;   //Higor Nayde SOL 188852 Kintana 1784376

      // 01/04/2004 Marchetti Pendencia 15733 e 15734
      CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;

      // 20/04/2005
      CtrlModeloHistorico : TCtrlModeloHistorico;
      //Iferreira - 27432

      IdForCli: Integer;

      //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
      CdsRateioAlteradorFDO : TClientDataSet;
      //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

      //Cássio Rovaroto - SIG nº 23656.57673 - Início
		  bDesembolsoServico: boolean;
      bExisteProcSusp: boolean;
     // bCPRBLancado: boolean;
      //Cássio Rovaroto - SIG nº 23656.57673 - Fim
      bFornOld: Integer; //Taffarel - SIG86328

      _oldNumLeitCodBarras: String; // Alterado por FHBS - 28/02/2019 - SIG81972
      bMsgAlteradorRetencao: Boolean; //Cássio Rovaroto - SIG nº 115585

      _IdServico: Integer;
      _CodNaturezaREINF: Integer;
      cdsAltTributo : TCMClientDataSet;
      iCalcTributos: Integer;
      sProcFuncef: string;              //luis WO14157-14159

      // Inicio WO8229 Ferrari
      lIdPessoa,lIdPessJur,lIdPlanoPrev,liSeqProposta : integer;
      vColunasArq  : TArrayStr;
      vColunaTipo  : TArrayTipo;
      vColunaOpcao : TArrayOpcao;
      vDadosProntos : TArrayImportaRateio;
      iNumeroTotal : Integer;
      iNumeroOK : Integer;
      vHash : string;
      idCalculo  : Integer;
      dTotal : Double;

      procedure ValidaArquivo(var iNumFalhas : integer; var iNumOK :Integer; var vDadosProntos : TArrayImportaRateio);


      procedure EmptyDataSet(Dts: TDataSet);

      function  Arredonda(const fValor     : Extended;
                          const iDecimais  : word
                         ): Extended;

      function  VerificaRateio: Boolean;
      function  VerificaTipoDesembXCRespon: Boolean;

      //Marcus Oliveira 23425
      procedure ControlesReadyOnly(bLigar: boolean);

      function  VerificaUsuXCRespon: Boolean;
      function  VerificaTipoDesembXForn: Boolean;
      function  VerificaPreenchimentoSegregaMestre: boolean;
      function  VerificaPreenchimentoSegregaDetalhe: boolean;
      // fim 22/01/04 Alex 14451

      //  Rodolpho da Silva - P: 18588 - 22/06/2005
      function  VerificaSeDocAdiantEstaRegularizado : boolean;

      function  VerificaNossoNumero : boolean;   // edilaine - SOL 222006-17039 / PPM 712379

      procedure SelDocs(iCodDocumento: Integer);
      procedure SelecionaTipoDesembolso;

      function  BuscaNomeConta(sPlaconta: String; iPlano: integer): String;
      procedure MontaCentroDeCusto;
      procedure ExecutaPrevAdianto;
      function  ConfereSaldo(iCodDocumento: integer; bVerificaLanc: boolean): boolean;
      function  VerificaParcelas(sNumFatura: String): boolean;
      procedure SetaCentResponDesemb(iNumReserva: LongInt; bLimpa: boolean);
      procedure SetaEnglobaParcela;
      procedure AtualizaSaldo;
      procedure setaplanopatroglobal;
      function  TestaAlterador: boolean;
      function  DoEnglobarParcelar: Boolean;
      function  ValidaOperacao: Boolean;
      procedure CalculaValorEdit;

      // Início: Marcio Motta - 18492 - 19/01/2005
      function  BuscaIdReservaOrcamento(NumCompromisso: integer): integer;
      function  VerificaTipoDesembolso: boolean;
      //    Fim: Marcio Motta

     // início andre tavares pendencia 19942 - 26/08/2005 - valida também o códogo de barras da arrecadação
     function verificaCodBarra : boolean;
     // fim andre tavares pendencia 19942 - 26/08/2005 - valida também o códogo de barras da arrecadação

     //andre tavares - pendência 22079 - 14/07/2006
     function EmitirBloqueto: Boolean;

     //andre tavares - pendência 21603 - 27/07/2006
     function reprogDataVencto(const sTextoPergunta: string): boolean;
     procedure AjustaUsoPGA(const pUsoPGA: String);
     procedure InsereSegregacaoFinancHabitacional;
     // Ricardo A. SOL 122623 KTN 603580
     procedure AtualizaPlanoPatro;

     //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
     Procedure SetRATEIO_ORCAMENTO;
     Procedure PreencheComboRateio;
     //

     //Cássio Rovaroto - SIG nº 23656.57673
     function VerificaLanctoCPRB: boolean;

     function LancamentoAlteradoresTributacao(IdServico: Integer): Boolean;
     function AlteracaoAlteradoresTributacao(IdServico: Integer): Boolean;
     function RegistraDadosAlterador(iIdServico, iTipoTributo: Integer; iTipoOperacao: Integer = 0): Boolean;
     function VerificaAlteradorTribLancado(iIdServico: Integer): Boolean;
     function ExcluiAlteradoresTributacao: Boolean;

     function SqlGrupoSubQuerySomatorio(sSQLInterno, sGroupBy, sOwner: String): String;//SIG82262

   public   // Public declarations
      class procedure AbrirForm(OperacaoLanc: TOperacaoLancDocCapCar);
	// SOL 189828 KTN 1794500 - Paulo Nobre
      Function FazChamadaAlteradores: Boolean;
      Procedure SalvaDadosParaAlteradores;
      //
  end;


var
  frmLancDocCAPCAR: TfrmLancDocCAPCAR;
  _OperacaoLanc: TOperacaoLancDocCapCar;
  //  Início SOL: 136242 Kintana: 813941 - JRM6
  v_codtiporecdes,
  v_numdoc,
  v_recPag,
  v_unidnegoc,
  v_numfatura, v_dscUnidNegoc {SOL 189828 KTN 1794500 - Paulo Nobre}: String;
  v_datamov:        TDatetime;
  v_ValorMov:       Real;
  v_estorno,
  v_Plncodigo,
  vCoddocumento_Alt,
  v_codtipdoc:      Integer;
  //  Término SOL: 136242 Kintana: 813941 - JRM6

implementation
{$R *.DFM}
uses
   uMensErro, uDataBase, DBaseDados, uSistema, ustring, dReports,
   fMostraRelat, DDadosBancarios, udiasuteis, JclMath, uFormManager,
   Registry, uCtrlParamIntegra, uFuncaoGeral, FRegPrevAdiantoMT,
   DCapCarMT, FAgrupaParcelaMT, uMidasUtil, fAguarde, uCtrlFinanc, uCmDialogs,
   uVerificaPreenchimento,
   //DAVID - Retenção de Imposto
   fRetencaoINSS, uCmMath, FTelaAut,
   //VANDER
   UCtrlOrcamento;




procedure TfrmLancDocCAPCAR.CmeCadastroInsert(Sender: TObject);
var
   cdsPlanoPatro: TCMclientDataSet;

begin
  cdsPlanoPatro := TCMclientDataSet.Create(nil);
  cdsPlanoPatro.data := _LancDocCapCar.ListaPlanoPatroParamCap;

  _IdForCliAdianto := 0;
  _NossoNumero     := '';    // edilaine - SOL 222006-17039 / PPM 712379

  SelDocs(-1);

  inherited;

  Cds.FieldByName('FLGCONTAINVEST').AsInteger := 0;
  Cds.FieldByName('FLGESPECIAL').AsString := 'N';
  Cds.FieldByName('FLGSIMPLES').AsString := 'N';

  { Alex 14/04 tirado este bloco do cdsafterinsert, lá estava dando erro no tipodoc }
  Cds.FieldByName('RECPAG').AsString := ParamIntegra.RecPag;
  Cds.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  Cds.FieldByName('IDMODULO').AsFloat := Sistema.IdModulo;
  Cds.FieldByName('DATALANCTO').AsDateTime := _DataLancto;
  Cds.FieldByName('DATAEMISSAO').AsDateTime := _DataLancto;
  Cds.FieldByName('DATAVENCTO').AsDateTime := _DataLancto;
  Cds.FieldByName('DATAPROGRAMADA').AsDateTime := _DataLancto;
  Cds.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;

  if ( _OperacaoLanc = opldAdiantamento ) then
     Cds.FieldByName('CODTIPDOC').AsInteger := Modulo.CodAForne
  else
     Cds.FieldByName('CODTIPDOC').AsInteger := _CodTipDoc;
  { fim tirado este bloco daqui do cdsafterinsert }

  PnlAp.Enabled := True;


  SetaCentResponDesemb(-1, True);
  cbLancaBaixa.Checked := False;
  cbLancaBaixaClick(Self);
  pnlMestre.Enabled := True;
  dbenChBordero.Enabled := False;
  lblNumChBordero.Enabled := False;
  cbEnglobParc.Checked := False;
  cbLancaBaixa.Checked := False;

  if _OperacaoLanc = opldEfetivo then
    cbIntegra.Checked := False
  else
    cbIntegra.Checked := True;

  _CodLancCAPCAR := 0;
  _CodLancContab := 0;

  dbeValorMoeda.Enabled          := False;
  dbeValorCorrente.Enabled       := True;
  rgTipoNf.Enabled               := True; //Cássio Rovaroto - WO 1728

  if CmpForCli.CanFocus then  CmpForCli.SetFocus;

  if iContaXCaixa > 0 then
  begin
    dblcPortadorForma.LookupValue := IntToStr(iContaXCaixa);
    CdsPortForma.Locate( 'CODPORTFORMA', iContaXCaixa, [] );
    dblcPortadorForma.text:= CdsPortForma.fieldbyname('Descricao').AsString;

  end;

  SetaEnglobaParcela;

 //MArcus Oliveira P. 23425 19/10/06
 ControlesReadyOnly(False);
end;



procedure TfrmLancDocCAPCAR.CmeDetalheInsert(Sender: TObject);
var
  bVazio : Boolean;
  sNumProcessoSusp : String;
begin
  sNumProcessoSusp := '';
  bVazio := CdsDet.IsEmpty;
  _cdsAux.Data := copyClientDataset(cdsDet);    // tavares - pendência 17279

  inherited;

  if pgctrlDetalhe.ActivePage.PageIndex = 1 then
  begin
     CdsDet.FieldByName('NumReserva').AsInteger := 0;

     if CdsCentroRespon.IsEmpty then
     begin
        dblcCentroRespon.Enabled := False;
        CdsDet.FieldByName('CODCENTRORESPON').AsString := _CodCentroRespon;
        CdsDet.FieldByName('NOME_1').AsString := _NomeCentroRespon;
     end;

     CdsDet.FieldByName('MOECODIGO').Clear;

     dbeValorMoedaDet.Value   := 0;
     dbeValorDet.Value        := 0;
     edMoedaDet.Text          := '';

     if Cds.FieldByName('MOECODIGO').AsInteger <> 0 then
     begin
        CdsDet.FieldByName('MOECODIGO').AsInteger := Cds.FieldByName('MOECODIGO').AsInteger;
        edMoedaDet.Text := CdsMoeda.FieldByName('MOESIGLA').AsString;
     end
     else
     begin
       dbeValorMoedaDet.Value := 0;
     end;

     CmbCentCusto.CloseUp(True);

     if not(bVazio) then
     begin
       if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;

       CdsDet.FieldByName('UNIDNEGOC').AsStrIng       := _Ativproj;
       dblcUnidNegoc.CloseUp(True);

       CdsDet.FieldByName('CODCENTRORESPON').AsStrIng := _Crespom;
       dblcCentroRespon.CloseUp(True);

       CdsDet.FieldByName('CODTIPRECDES').AsStrIng    := _Tpdesmb;
       dblcTipoRD.CloseUp(True);
       dblcTipoRDExit(Self);

       CdsDet.FieldByName('CODCENTROCUSTO').AsStrIng  := _Ccusto;
       CmbCentCusto.CloseUp(True);

       // início - andré tavares - pendência 17279 - 26/08/2004
       CdsDet.FieldByName('IDPROGRAMA').AsStrIng  := _Programa;
       CmbPrograma.CloseUp(True);
       CmbPrograma.LookupValue := _Programa;
       if trim(_Programa) <> '' then
         CdsProgramaPrev.Locate('IDPROGRAMA', _Programa, []);
       // fim - andré tavares - pendência 17279 - 26/08/2004

       // Ricardo A. SOL 122623 KTN 603580
         if _PlanoPrevDet = 0 then begin
          CdsDet.FieldByName('IDPLANOORIGEM').Clear;
         end
         else
         begin
            CdsDet.FieldByName('IDPLANOORIGEM').AsFloat := _PlanoPrevDet;
            CmbPlano.LookupValue := FloatToStr(_PlanoPrevDet);
         end;

       CmbPlano.CloseUp(True);

       // Ricardo A. SOL 122623 KTN 603580
       if _PatroDet = 0 then
          CdsDet.FieldByName('IDPATROORIGEM').Clear
       else
          begin
             CdsDet.FieldByName('IDPATROORIGEM').AsFloat := _PatroDet;
             CmbPatro.LookupValue := FloatToStr(_PatroDet);
          end;
       CmbPatro.CloseUp(True);
     end
     else
        setaplanopatroglobal;

     if (Trim(_Crespom) = '') or
        (Trim(_Crespom) = '9999999999') then
     begin
        CdsDet.FieldByName('CODCENTRORESPON').asstrIng  := '9999999999';
        dblcCentroRespon.CloseUp(True);
     end;

   //Cássio Rovaroto - SIG nº 115585 - Início
    //Cássio Rovaroto - SIG nº 23656.57673 - Início
   {if (ParamIntegra.RecPag = 'P') and (pgctrlDetalhe.ActivePage = tbsDet) then
    begin
    	cdsProcessos.Close;
      sqlProcessos.Prepare;
      sqlProcessos.ParamByName('PIDFORCLI').AsInteger := cds.FieldByName('IDFORCLI').AsInteger;
      sqlProcessos.ParamByName('PDATAFIM').AsString := cds.FieldByName('DATAEMISSAO').AsString;
      sqlProcessos.Open;

		  if not(cdsProcessos.IsEmpty) then
    	begin
    		lblProcessos.Enabled := True;
      	dbLkpCbProcCPRB.Enabled := True;
      end
      else
      begin
    		lblProcessos.Enabled := False;
      	dbLkpCbProcCPRB.Enabled := False;
      end;

      lblTipoServico.Enabled := False;
  		dbLkpCbTipoServico.Enabled := False;
    end;   }
    //Cássio Rovaroto - SIG nº 23656.57673 - Fim
    //Cássio Rovaroto - SIG nº 115585 - Fim

    // edilaine - SOL 222006-17039 / PPM 712379 - inicio
    {RN13: Ao clicar no botão <INSERIR>, o campo Nosso Numero deverá ser habilitado e a situação do boleto deve estar oculta}
    if ParamIntegra.RecPag = 'R' then
       pnlSituacao.Visible := false;
    // edilaine - SOL 222006-17039 / PPM 712379 - fim

     CdsAux.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);
     if trim(cdsAux.fieldByName('FLGDESVINCCC').asString) <> 'S' then //andré tavares - pendência 26515 - 05/10/2007
       MontaCentroDeCusto;

     // Ricardo A. SOL 122623 KTN 603580
     AtualizaPlanoPatro;
     // Alterado por Arnaldo V. Scarin em 19/10/2009
     // SOL 123802 e 123804 -> CGPC 028.
     AjustaUsoPGA(CdsTipoRD.FieldByName('FLGFINANCHABITACIONAL').asString);
  end;

  //Cássio Rovaroto - SIG nº 115585 - Início
  if (ParamIntegra.recPag = 'P') and (pgctrlDetalhe.ActivePage = TbsAlteradores) then
  begin
    cdsProcessos.Close;
    sqlProcessos.Prepare;
    sqlProcessos.ParamByName('PIDFORCLI').AsInteger := cds.FieldByName('IDFORCLI').AsInteger;
    sqlProcessos.ParamByName('PDATAFIM').AsString := cds.FieldByName('DATAEMISSAO').AsString;
    sqlProcessos.Open;

		if not(cdsProcessos.IsEmpty) then
    begin
      lblProcessos.Enabled := True;
      dbLkpCbProcCPRB.Enabled := True;
    end
    else
    begin
      lblProcessos.Enabled := False;
      dbLkpCbProcCPRB.Enabled := False;
    end;

    lblTipoServico.Enabled := False;
  	dbLkpCbTipoServico.Enabled := False;
    lblValorBaseRetencao.Enabled := False;
    edtValorBaseRetencao.Enabled := False;
  end;
  //Cássio Rovaroto - SIG nº 115585 - Fim
end;

procedure TfrmLancDocCAPCAR.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if (Cds.State In ([dsInsert,dsEdit])) then
  begin
     if (pgctrlDetalhe.ActivePage.PageIndex = 1)  then
     begin
        if not (CdsDet.State In ([dsInsert,dsEdit])) then CdsDet.Edit;

        _TpDesmb := CdsDet.FieldByName('CODTIPRECDES').AsStrIng;
        // Fim - Marcio Motta

        dblcTipoRD.Text          := CdsDet.FieldByName('DESCRICAO').Text;
        dblcCentroRespon.Text    := CdsDet.FieldByName('NOME_1').Text;
        dblcUnidNegoc.Text       := CdsDet.FieldByName('NOME').Text;

        CdsDet.FieldByName('MOECODIGO').Clear;

        dbeValorMoedaDet.Value   := CdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat;
        dbeValorDet.Value        := CdsDet.FieldByName('VALOR').AsFloat;
        edMoedaDet.Text          := '';

        if CdsCentroRespon.IsEmpty then
        begin
           dblcCentroRespon.Enabled:=False;
           CdsDet.FieldByName('CODCENTRORESPON').AsString := _CodCentroRespon;
           CdsDet.FieldByName('NOME_1').AsString := _NomeCentroRespon;
        end;
        if Cds.FieldByName('MOECODIGO').AsInteger <> 0 then
        begin
           CdsDet.FieldByName('MOECODIGO').AsInteger := Cds.FieldByName('MOECODIGO').AsInteger;
           edMoedaDet.Text := CdsMoeda.FieldByName('MOESIGLA').AsString;
        end
        else
           dbeValorMoedaDet.Value:=0;

        //CmbCentCusto.CloseUp(True);    // Edilaine - SOL 195755 / KTN 1871968

        // Edilaine - SOL 195755 / KTN 1871968
        cdsSubDespesaRateio.Data := _oDocumento.Orcamento.ListaSubDespesas(opapDesembolso,
                                                                   _TpDesmb,
                                                                   Cds.FieldByName('IDFORCLI').AsInteger,
                                                                   _CCusto,
                                                                   Sistema.IdEmpresa,
                                                                   CdsDet.FieldByName( 'TipoDespesa' ).asinteger);


        setaplanopatroglobal;

        //Cássio Rovaroto - SIG nº 115585 - Início
        {
        //Cássio Rovaroto - SIG nº 23656.57673 - Início
    		if (ParamIntegra.RecPag = 'P') and (pgctrlDetalhe.ActivePage = tbsDet) then
    		begin
    			cdsProcessos.Close;
      		sqlProcessos.Prepare;
      		sqlProcessos.ParamByName('PIDFORCLI').AsInteger := cds.FieldByName('IDFORCLI').AsInteger;
      		sqlProcessos.ParamByName('PDATAFIM').AsString := cds.FieldByName('DATAEMISSAO').AsString;
      		sqlProcessos.Open;

		  		if not(cdsProcessos.IsEmpty) then
    			begin
    				lblProcessos.Enabled := True;
      			dbLkpCbProcCPRB.Enabled := True;
      		end
      		else
      		begin
          	lblProcessos.Enabled := False;
      			dbLkpCbProcCPRB.Enabled := False;
      		end
    		end;
    		//Cássio Rovaroto - SIG nº 23656.57673 - Fim
        }
     end;
     
     if (ParamIntegra.RecPag = 'P') and (pgctrlDetalhe.ActivePage = tbsAlteradores) then
     begin
      cdsProcessos.Close;
      sqlProcessos.Prepare;
      sqlProcessos.ParamByName('PIDFORCLI').AsInteger := cds.FieldByName('IDFORCLI').AsInteger;
      sqlProcessos.ParamByName('PDATAFIM').AsString := cds.FieldByName('DATAEMISSAO').AsString;
      sqlProcessos.Open;

		  if not(cdsProcessos.IsEmpty) then
    	begin
    	  lblProcessos.Enabled := True;
      	dbLkpCbProcCPRB.Enabled := True;
      end
      else
      begin
        lblProcessos.Enabled := False;
      	dbLkpCbProcCPRB.Enabled := False;
      end
     end;
     //Cássio Rovaroto - SIG nº 115585 - Fim
  end;
end;

procedure TfrmLancDocCAPCAR.CmeDetalheConfirma(Sender: TObject);
var contaRegIguais: integer;
    cdsLocal: TClientDataSet;
begin
  CdsAux.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);
  if CmeCadastro.Operacao In [OpInserir,OpAlterar] then
  begin
    //Cássio Rovaroto - SIG nº 115585 - Início
    if (ParamIntegra.RecPag = 'P') and (pgctrlDetalhe.ActivePage.PageIndex = 3)
        and (CdsAlteradores.State In [dsInsert,dsEdit])  then
    begin
      if (dbLkpCbTipoServico.LookupValue <> EmptyStr) and not(bDesembolsoServico) then
        bDesembolsoServico := True;

      if (dbLkpCbProcCPRB.LookupValue <> EmptyStr) and not(bExisteProcSusp) then
        bExisteProcSusp := True
    end;
    //Cássio Rovaroto - SIG nº 115585 - Início

    // início - andré tavares - pendência 17279 - 26/08/2004
    if (not _cdsAux.IsEmpty) and (CdsDet.state in [dsEdit, dsInsert]) then
    begin
      _cdsAux.first;
      contaRegIguais := 0;
      while not _cdsAux.Eof do  // verifica se já existe algum registro igual
      begin
        if(dblcUnidNegoc.lookupValue       = _cdsAux.FieldByName('UNIDNEGOC').AsStrIng)     and
          (dblcCentroRespon.lookupValue    = _cdsAux.FieldByName('CODCENTRORESPON').AsStrIng)and
          (dblcTipoRD.lookupValue          = _cdsAux.FieldByName('CODTIPRECDES').AsStrIng) and
          (CmbCentCusto.lookupValue        = _cdsAux.FieldByName('CODCENTROCUSTO').AsStrIng) and
          (CmbPrograma.lookupValue         = _cdsAux.FieldByName('IDPROGRAMA').AsStrIng) and
          (CmbPlano.lookupValue            = _cdsAux.FieldByName('IDPLANOPREV').AsStrIng ) and

           // Ricardo A. SOL 122623 KTN 603580
          (CmbPatro.lookupValue            = _cdsAux.FieldByName('IDPATROORIGEM').AsStrIng ) and

          (CdsDet.FieldByName('UNIDNEGOC').AsStrIng       <> '') and
          (CdsDet.FieldByName('CODCENTRORESPON').AsStrIng <> '') and
          (CdsDet.FieldByName('CODTIPRECDES').AsStrIng    <> '') and
          (CdsDet.FieldByName('CODCENTROCUSTO').AsStrIng  <> '') and
          (CdsDet.FieldByName('IDPROGRAMA').AsStrIng      <> '') and

           // Ricardo A. SOL 122623 KTN 603580
          (CdsDet.FieldByName('IDPATROORIGEM').AsStrIng   <> '') and
          (CdsDet.FieldByName('IDPLANOPREV').AsStrIng     <> '') then
        begin
          contaRegIguais := contaRegIguais + 1;
          if (contaRegIguais >= 1) and (cdsDet.Recno <> _cdsAux.Recno) then
          begin
            MsgDlg('Neste rateio existe um registro repetido.','Erro',mtWarning,[mbOk],0);
            Abort;
          end;
        end;
        _cdsAux.next;
      end;
    end;
    // fim - andré tavares - pendência 17279 - 26/08/2004

    if (pgctrlDetalhe.ActivePage.PageIndex = 1) and (CdsDet.State In [dsInsert,dsEdit]) then
       begin
           // Início - Marcio Motta - 20/01/2005 - 18492
           if (ReResOrc.Lines[0] <> '') and (ReResOrc.Value > 0) then
             if not VerificaTipoDesembolso then
               begin
                  MsgDlg('Este Compromisso Orçamentário não pode ser utilizado para este Desembolso!','Erro',mtError,[mbOk],0);
                  Repaint;
                  if ReResOrc.CanFocus then ReResOrc.SetFocus;
                  EXIT;
               end;

           // Fim - Marcio Motta - 20/01/2005 - 18492

           if (Trim(dblcUnidNegoc.Text) = '') then
           begin
              if ( ParamIntegra.ObrigaAbc ) then
              begin
                MsgDlg('Obrigatório preencher a Atividade','Erro',mtError,[mbOk],0);
               Repaint;
                if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
                exit
              end
              else
              begin
                CdsDet.FieldByName('UNIDNEGOC').AsFloat := -1;
                dblcUnidNegoc.LookupValue := '-1';
              end;
           end;

           if CdsCentroRespon.isEmpty then
           begin
              //SOL90371 - 14/07/2008 - Nilton

              MsgDlg('O vínculo do Usuário ao Centro de Responsabilidade é obrigatório.'+#13+'Contate a Área Responsável.','Erro',mtError,[mbOk],0);
              Abort;

             {  CdsDet.FieldByName('NOME_1').Text := _NomeCentroRespon;
                CdsDet.FieldByName('CODCENTRORESPON').AsString := '9999999999';
                dblcCentroRespon.LookupValue   := '9999999999';
             }
           end
           else
           begin
              if (Trim(dblcCentroRespon.Text) = '') then
              begin
                 if ( ParamIntegra.ObrigaCrespon ) then
                 begin
                   MsgDlg('Obrigatório preencher o Centro de Responsabilidade','Erro',mtError,[mbOk],0);
                   Repaint;
                   if dblcCentroRespon.CanFocus then dblcCentroRespon.SetFocus;
                   exit;
                 end
                 else if (CdsDet.FieldByName('CODCENTRORESPON').AsString = '') or
                         (dblcCentroRespon.LookupValue = '')then
                 begin
                  MsgDlg('O vínculo do Usuário ao Centro de Responsabilidade é obrigatório.'+#13+'Contate a Área Responsável.','Erro',mtError,[mbOk],0);
                  exit;
                 {
                  CdsDet.FieldByName('CODCENTRORESPON').AsString := '9999999999';
                  dblcCentroRespon.LookupValue := '9999999999';
                  CdsDet.FieldByName('NOME_1').AsString := _NomeCentroRespon;
                 }
                 end;
              end;
              CdsDet.FieldByName('NOME_1').Text := dblcCentroRespon.Text;
           end;
           //CATIA -Pendência 18951 - 12/04/2006
           IF ParamIntegra.RecPag = 'P' then
           begin
           //andré tavares - pendência 26515 - 05/10/2007 -
             CdsAux.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);

             If (CdsAux.FieldByName('FLGOBRIGAPROG').AsString = 'S') THEN
             begin
               If Trim(cmbprograma.text) = ''  then
               begin
                 MsgDlg('Obrigatório preencher o PROGRAMA','Erro',mtError,[mbOk],0);
                 exit;
               end;
             end;
           end;

           if Trim(dblcTipoRD.Text) = '' then
           begin
              MsgDlg('Obrigatório preencher o Tipo de Recebimento/Desembolso','Erro',mtError,[mbOk],0);
               Repaint;
              if dblcTipoRD.CanFocus then dblcTipoRD.SetFocus;
              exit;
           end;

           if (dbeValorMoedaDet.Value = 0) and (Cds.FieldByName('MOECODIGO').AsInteger <> 0) then
           begin
              MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk],0);
               Repaint;
              if dbeValorMoedaDet.CanFocus then dbeValorMoedaDet.SetFocus;
              exit;
           end;

           if (dbeValorDet.Value = 0) and (dbeValorCorrente.Value <> 0) then
           begin
              MsgDlg('Obrigatório preencher o Valor em Moeda Corrente','Erro',mtError,[mbOk],0);
               Repaint;
              if dbeValorDet.CanFocus then dbeValorDet.SetFocus;
              exit;
           end;

           if Sistema.UsaPlanoPatro then
           begin
             if not _UsoPGA and ((Trim(CmbPlano.Text) = '') or (Trim(CmbPatro.Text) = '' )) then
             begin
               MsgDlg('Obrigatório preencher o Plano Previdenciário e a Patrocinadora na ''Pasta'' Previdência','Erro',mtError,[mbOk],0);
               Repaint;
               if cmbPlano.CanFocus then cmbPlano.SetFocus;
               exit;
             end;
           end;

           // 15/12/04 Alex 18107
           if CmbPrograma.Text = '' then
             CdsDet.FieldByName('FLGTIPOPROGRAMA').Clear
           else
             CdsDet.FieldByName('FLGTIPOPROGRAMA').AsString := CdsProgramaPrev.FieldByName('FLGTIPOPROGRAMA').AsString;


           // Alterado por Arnaldo V. Scarin em 19/10/2009
           // SOL 123802 e 123804 -> CGPC 028.
           If _UsoPGA and (CdsDet.State = dsInsert) then
             InsereSegregacaoFinancHabitacional;

           If Not _UsoPGA then
           begin
             // 22/01/04 Alex 14451 - Nova segregação
             if not VerificaPreenchimentoSegregaDetalhe then
               exit;
             _ValorEdit :=  _ValorEdit - dbeValorDet.Value;
             CdsDet.FieldByName('VALOR').Value             := dbeValorDet.Value;
             CdsDet.FieldByName('VALOROUTRAMOEDA').Value   := dbeValorMoedaDet.Value;
           end;

           CdsDet.FieldByName('DESCRICAO').Text          := dblcTipoRD.Text;
           CdsDet.FieldByName('NOME').Text               := dblcUnidNegoc.Text;
           CdsDet.FieldByName('MOESIGLA').Text           := edMoedaDet.Text;

           if CdsDet.FieldByName('CODDOCUMENTO').AsInteger<=0 then
           begin
              CdsDet.FieldByName('RECPAG').AsString := ParamIntegra.RecPag;
              CdsDet.FieldByName('CODDOCUMENTO').AsInteger := Cds.FieldByName('CODDOCUMENTO').AsInteger;
              CdsDet.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
           end;

           // 26/01/04 Alex estes campos não entram na grid se for repedito o insert
           // Ricardo A. SOL 122623 KTN 603580
           CdsDet.FieldByName('IDSEGREGACRITER').AsInteger := -1;  // A SEGREGAÇÃO É RESOLVIDA NO PROCESSO CONTÁBIL
           CdsDet.FieldByName('NOMECENTROCUSTO').AsString := CmbCentCusto.Text;

           If Not _UsoPGA then
           begin
             CdsDet.FieldByName('NOMEPATROORIGEM').AsString := CmbPatro.Text;
             CdsDet.FieldByName('DESCPLANOORIGEM').AsString := CmbPlano.Text;
             CdsDet.FieldByName('NOMEPATRO').AsString := CmbPatro.Text;
             CdsDet.FieldByName('DESCPLANO').AsString := CmbPlano.Text;
           end;

           CdsDet.FieldByName('DESCRICAO').AsString := dblcTipoRD.Text;
           if not CdsTipoRD.FieldByName('PLACONTACREDITO').isnull then
              CdsDet.FieldByName('PLACONTACREDITO').asstrIng := CdsTipoRD.FieldByName('PLACONTACREDITO').asstrIng
           else
              CdsDet.FieldByName('PLACONTACREDITO').asstrIng := CmpForCli.ForCliReg.CContabil  ;
           // FIM 26/01/04 Alex estes campos não entram na grid se for repedito o insert

    end;
    SetaCentResponDesemb(-1,True);
  end;

  inherited;

  if (CdsDet.state = dsInsert) then
  begin
    CdsDet.FieldByName('CODCENTROCUSTO').AsStrIng  := _Ccusto;
    CdsDet.FieldByName('CODTIPRECDES').AsStrIng    := _Tpdesmb;
    CdsDet.FieldByName('UNIDNEGOC').AsStrIng       := _Ativproj;
    // início - andré tavares - pendência 17279 - 26/08/2004
    CdsDet.FieldByName('IDPROGRAMA').AsStrIng  := _Programa;
    CmbPrograma.CloseUp(True);
    // fim - andré tavares - pendência 17279 - 26/08/2004

    if (Trim(_Crespom) = '') or (Trim(_Crespom) = '9999999999') then
    begin
       CdsDet.FieldByName('CODCENTRORESPON').asstrIng  := '9999999999';
       CdsDet.FieldByName('NOME_1').Text := _NomeCentroRespon;
    end
    else
       CdsDet.FieldByName('CODCENTRORESPON').asstrIng  := _Crespom;

     if trim(cdsAux.fieldByName('FLGDESVINCCC').asString) <> 'S' then //andré tavares - pendência 26515 - 05/10/2007
      MontaCentroDeCusto;
  end;


  {amf 01.03.2007 24450 - trava o lançamento se o plano previdenciário selecionado não estiver na lista
                          de planos previdenciários associados a contacorrente ligada ao portador-forma.}
  if (dblcPortadorForma.Text <> '') then
  begin
       if (cds.State in [dsInsert, dsEdit]) then
       begin
          try
            cdsLocal := TClientDataSet.Create(nil);
            cdsLocal.Data := CtrlPortadorForma.ListPortadorforma('',
                                                                 cds.FieldByName('CODPORTFORMA').AsInteger,
                                                                 Sistema.IdEmpresa,
                                                                 );

            if cdsAux.fieldByName('FLGOBRIGAMESMOPP').asString <> 'S' then //andré tavares - pendência 26434
              if (CtrlPortadorConta.PlanoPrevDifereDaLista(cdsLocal.FieldByName('CODPORTADOR').AsInteger,
                                                         cdsDet.FieldByName('IDPLANOPREV').AsInteger)) then
              begin
                MsgDlg('Plano Previdenciário ' + cmbPlano.DisplayValue + ' não encontrado na lista de planos'#13#10'associados a contacorrente para o portador-forma selecionado.'#13#10 + dblcPortadorForma.DisplayValue ,'Erro',mtError,[mbOk],0);
                abort;
              end;
          finally
            FreeAndNil(cdsLocal);
          end;
       end;
  end;
end;


procedure TfrmLancDocCAPCAR.CmeCadastroFind(Sender: TObject);
begin
    IdForCli:=  Cds.FieldByName('IDFORCLI').AsInteger;
    //Marcus Oliveira 23425
    ControlesReadyOnly(True);
     // Alex 02/08/2005 19870 bconfirmou := false; //andre tavares - pendência 18937 - 14/04/2005
     if (MontaSelect.RetornouValor) then
     begin

        _CodLancCAPCAR := StrtoInt(MontaSelect.ValoresChave[0]);

        SelDocs(_CodLancCAPCAR);

        _CodLancContab := Cds.FieldByName('PLNCODIGO').AsInteger;
        _Modulo := Cds.FieldByName('IDMODULO').AsInteger;

        _ContaCliFor := Cds.FieldByName('PLACONTA').AsString;
        _CCustoCliFor := Cds.FieldByName('CODCENTROCUSTO').AsString;

        cbLancaBaixa.Checked := ((Cds.FieldByName('OPERACAO').AsString = '10') or (Cds.FieldByName('OPERACAO').AsString = '15'));
        cbEnglobParc.Checked := ((Cds.FieldByName('OPERACAO').AsString = '1') or (Cds.FieldByName('OPERACAO').AsString = '11'));
        cbIntegra.Checked := (Cds.FieldByName('PLNCODIGO').AsInteger = 0) and (_Modulo <> 18);  //Ewerton Beltramini SIG92533

        SetaEnglobaParcela;

        AbrindoTela  := False; //Bruno Bastos - Pend. 14399 e 14400 - 14/08/2003
        sCodCentResp := CdsDet.FieldByName('CODCENTRORESPON').AsString;
        //Vinicius Maciel - SOL 163982 KTN 1404974
        if((dbLcUnidNegoc.Text = '') and (dbLcUnidNegoc.LookupValue <> '')) then
        dbLcUnidNegoc.Text := CtrlParamCap.recuperaAtividadePerd(dbLcUnidNegoc.LookupValue);
        //Vinicius Maciel - SOL 163982 KTN 1404974 - FIM

        // edilaine - SOL 222006-17039 / PPM 712379 - inicio
        {RN12: Ao <PROCURAR> um documento, o campo Nosso Numero deverá estar inabilitado conforme os demais campos e a
               situação do boleto deve ser exibido conforme regras: [RN06], [RN07], [RN08], [RN09] e [RN10]}
        if ParamIntegra.RecPag = 'R' then
        begin
          _NossoNumero := Trim(cds.FieldByName('NOSSONUMERO').AsString);

          {RN06: Doc com status 0 ou 1 e o Nosso Numero não preenchido, devem ficar com a identificação: em branco ou sem visualização inicial}
          {RN10: Doc com status 2 e o Nosso Numero não preenchido, devem ficar com a identificação: em branco ou sem visualização inicial}
          btnBolSit.caption    := ' ';
          btnBolSit.ImageIndex := -1;
          pnlSituacao.visible := false;

          if (cds.FieldByName('STATUS').AsInteger = 0) and (Trim(cds.FieldByName('NOSSONUMERO').AsString) <> emptyStr) then
          begin
            {RN07: Doc com status 0 e o Nosso Numero preenchido, devem ficar com a identificação: cancelado}
            btnBolSit.caption    := ' Cancelado';
            btnBolSit.ImageIndex := 1;
            pnlSituacao.visible  := true;
          end
          else if (cds.FieldByName('STATUS').AsInteger = 1) and (Trim(cds.FieldByName('NOSSONUMERO').AsString) <> emptyStr) then
          begin
            {RN08: Doc com status 1 e o Nosso Numero preenchido, devem ficar com a identificação: emitido}
            btnBolSit.caption    := ' Emitido';
            btnBolSit.ImageIndex := 2;
            pnlSituacao.visible  := true;
          end
          else if (cds.FieldByName('STATUS').AsInteger = 2) and (Trim(cds.FieldByName('NOSSONUMERO').AsString) <> emptyStr) then
          begin
            {RN09: Doc com status 2 e o Nosso Numero preenchido, devem ficar com a identificação: emitido}
            btnBolSit.caption    := ' Pago';
            btnBolSit.ImageIndex := 0;
            pnlSituacao.visible  := true;
          end;
        end;
        // edilaine - SOL 222006-17039 / PPM 712379 - fim

        //Cássio Rovaroto - SIG nº 115585 - Início
        {
        //Cássio Rovaroto - SIG nº 23656.57673 - Início
        cdsDet.First;
        while not cdsDet.Eof do
        begin
          if cdsDet.FieldByName('IDTIPOSERVICO').AsInteger > 0 then
          begin
            cdsDet.Edit;
            cdsDet.FieldByName('SERVICO').asString := 'S';
            cdsDet.Post;
          end
          else
          begin
            cdsDet.Edit;
            cdsDet.FieldByName('SERVICO').asString := 'N';
            cdsDet.Post;
          end;
          cdsDet.Next;
        end;
        //Cássio Rovaroto - SIG nº 23656.57673 - Fim
        }

        if Cds.FieldByName('NFSSERVICO').AsInteger <> 0 then
        begin
          rgTipoNF.Enabled := True;

          if Cds.FieldByName('NFSSERVICO').AsInteger = -1 then
            rgTipoNF.ItemIndex := 0
          else
            rgTipoNF.ItemIndex := 1;
          rgTipoNF.Enabled := False;
        end;

        cdsAlteradores.First;
        while not cdsAlteradores.Eof do
        begin
          if cdsAlteradores.FieldByName('IDTIPOSERVICO').AsInteger > 0 then
          begin
            bDesembolsoServico := True;
            Break;
          end
          else
            bDesembolsoServico := False;

          cdsAlteradores.Next;
        end;
        cdsAlteradores.First;
        //Cássio Rovaroto - SIG nº 115585 - Fim
     end;

end;




procedure TfrmLancDocCAPCAR.CmeCadastroEdit(Sender: TObject);
begin
  ControlesReadyOnly(False);
  inherited;
  PnlAp.Enabled := _LiberaAlteracaoOutroSistema;

  //DAVID - Pendência 14646
  if Cds.FieldByName('IDPROCESSO').AsInteger <> 0 then
  begin
    CdsProcessoRad.Close;
    SqlProcessoRad.Prepare;
    SqlProcessoRad.ParamByName('IDPROCESSO').AsInteger := Cds.FieldByName('IDPROCESSO').AsInteger;
    SqlProcessoRad.Open;

    if CdsProcessoRad.IsEmpty then
    begin
      MsgDlg('O processo RAD deste documento não foi encontrado. Não é possível alterá-lo.','Erro',mtError,[mbOk],0);
      Repaint;
      bbtnCancelar.Click;
      exit;
    end;
  end;

  if Cds.FieldByName('ESTORNO').AsInteger <> 0 then
  begin
     MsgDlg('Este Lançamento foi estornado ou é um estorno. Proibido Alterar.','Erro',mtError,[mbOk],0);
      Repaint;
     bbtnCancelar.Click;
     exit;
  end;


  if Cds.FieldByName('MOECODIGO').AsInteger <> 0 then
  begin
    dbeValorMoeda.Enabled:=True;
    dbeValorCorrente.Enabled:=False;
  end
  else
  begin
    dbeValorMoeda.Enabled:=False;
    dbeValorCorrente.Enabled:=True;
  end;

  if CmpForCli.CanFocus then CmpForCli.SetFocus;

  _Valida := True;

  if cbLancaBaixa.Checked then
  begin
     dbenChBordero.Enabled := True;
     lblNumChBordero.Enabled := True;
  end
  else
  begin
     dbenChBordero.Enabled := False;
     lblNumChBordero.Enabled := False;
  end;

  If CmeCadastro.Operacao <> OpAlterar then // Peterson Victor SIG 19929
     DtmDadosBancarios.SetaContaPreferencial(Cds.FieldByName('IDFORCLI').AsFloat, Cds); // Peterson Victor SIG 19929

  _ContabDoc.PLANO          := 0;
  _ContabDoc.PLACONTA       := '';
  _ContabDoc.CODCENTROCUSTO := '';

  if ParamIntegra.IntegraContab and not(cbIntegra.Checked) and
     (( Cds.FieldByName('IDMODULO').AsInteger = 3 ) or
      ( Cds.FieldByName('IDMODULO').AsInteger = 4 )) then
  begin
     _DataLancto := Cds.FieldByName('DATALANCTO').AsDateTime;
     _ContabDoc.PLANO := Cds.FieldByName('PLANO').AsInteger;
     _ContabDoc.PLACONTA := Trim(Cds.FieldByName('PLACONTA').AsString);
     _ContabDoc.CODCENTROCUSTO := Trim(Cds.FieldByName('CODCENTROCUSTO').AsString);
  end
  else
     _DataLancto := 0;

  If CmeCadastro.Operacao = OpAlterar then
  begin
    If Sistema.IDModulo = 3 then
      _DataDisponib := Cds.FieldByName('DATAPROGRAMADA').asDateTime
    else
      _DataDisponib := Cds.FieldByName('DATADISPONIB').asDateTime;


    MsgDlg('Caso haja a necessidade de inserção de novos alteradores, realize a ação ' +#13#10+
             'através da funcionalidade Lançamento de Alteradores.', 'Aviso', mtInformation, [mbOK], 0);
    btnAddAlteradores.Visible := False;
    // Início SOL: 136242 Kintana: 813941 - JRM6
    // Habilita o botão para inserir alteradores
    btnInsereAlteradores.Enabled := False;      
    //  Término SOL: 136242 Kintana: 813941 - JRM6

    _IdServico :=  Cds.FieldByName('NFSSERVICO').AsInteger;
  end;
end;


function TfrmLancDocCAPCAR.BuscaNomeConta(sPlaconta:String; iPlano: integer):String;
begin
  SqlDadosConta.Prepare;
  SqlDadosConta.ParamByName('PLACONTA').AsString := sPlaconta;
  SqlDadosConta.ParamByName('PLANO').AsInteger := iPlano;
  SqlDadosConta.Open;

  if not CdsDadosConta.IsEmpty then
     Result := CdsDadosConta.Fields[0].AsString
  else
   begin
     MsgDlg('Conta "' + sPlaconta + '" do plano "' + IntToStr(iPlano) + '" não cadsatrada', 'Atenção', mtWarning, [ mbOk ], 0);
      Repaint;
   end;
end;




procedure TfrmLancDocCAPCAR.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   //Bruno Bastos - Pend. 14399 e 14400 - 13/08/2003 - Início
   If Not AbrindoTela Then
   Begin
     if sbtnAlterar.Enabled then
     begin
        CdsAux.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);
        If (CdsAux.FieldByName('FLGACESSLANCDOC').AsString = 'S') And
           (sCodCentResp <> '') Then
        Begin
          SqlAux.Sql.Clear;
          SqlAux.Sql.Add(
          ' SELECT * FROM PESSOAXCRESP '+
          ' WHERE IDPESSOA  = ' + IntToStr(Sistema.IdEmpresa) +
          '   AND IDPESSOAACESSO  = ' + IntToStr(Sistema.IdUsuario) +
          '   AND CODCENTRORESPON = ' + sCodCentResp);
          SqlAux.Open;

          If CdsAux.IsEmpty Then
          Begin
            sbtnAlterar.Enabled := False;
            sbtnApagar.Enabled  := False;
          End
          Else
          Begin
            sbtnAlterar.Enabled := True;
            sbtnApagar.Enabled  := True;
          End;
        End;
     end;
   End;
   //Bruno Bastos - Pend. 14399 e 14400 - 13/08/2003 - Fim

   if (((_Modulo <> 3) and (_Modulo <> 4)) or
        (Cds.FieldByName('FLGIMPORTADO').AsString = 'S')) then

   begin
      sbtnAlterar.Enabled := False;
      sbtnApagar.Enabled  := False;
   end
   else
   begin
      if ( ParamIntegra.IntegraContab ) and (cbIntegra.Checked = False) and (sbtnInserir.Down = False) and (sbtnAlterar.Down = False) and (sbtnApagar.Down = False) then
      begin
         if ( ParamIntegra.EstornaContab ) then
            sbtnApagar.Enabled  :=False;
      end;
   end;
   //Cássio - SOL Nº 121398, 121399 - KINTANA Nº584211, 584209 - Início
   //sbtnEstornar.Enabled := (LblEstorno.Enabled) and (sbtnAlterar.Enabled) and (not bbtnConfirmar.Enabled);
   //Cássio - SOL Nº 121398, 121399 - KINTANA Nº584211, 584209 - Fim
   gbOutros.Enabled := bbtnConfirmar.Enabled;

   if _OperacaoLanc = opldContratoPrevisao then
   begin
      cbIntegra.Enabled:=False;
      cbLancaBaixa.Enabled:=False;
   end
   else
      if _OperacaoLanc = opldAdiantamento then
      begin
         cbEnglobParc.Enabled := False;
         cbLancaBaixa.Enabled := True;
         cbIntegra.Enabled := False;
      end;


  //início - andre tavares - pendência 22409 - 19/07/2006
  //MArcus Adicionado o dsBrowse   P. 23425 24/10/2006
  PnlDados.Enabled := cds.State in [dsEdit, dsInsert, dsBrowse];
  TbsGeral.Enabled := cds.State in [dsEdit, dsInsert, dsBrowse];
  TbsInfoJudicial.Enabled := cds.State in [dsEdit, dsInsert, dsBrowse];  // WO14157 Ferrari

  //fim - andre tavares - pendência 22409 - 19/07/2006

end;

// Início-Form-Create...
procedure TfrmLancDocCAPCAR.FormCreate(Sender: TObject);
var RegAutoriza: TRegistry;
begin
  //início - andré tavares - pendência 26515 - 05/10/2007
  //carrega os parâmetros uma só vez.
  CtrlParamCap := TCtrlParamCap.Create;
  CtrlParamCap.InitializeAs(Padroes);
  CdsAux.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);
  MontaCentroDeCusto;
  //fim - andré tavares - pendência 26515 - 05/10/2007

  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  CdsRateioAlteradorFDO                := TClientDataSet.Create(Nil);
  cboAlteradoresDescRateio.LookUpTable := CdsRateioAlteradorFDO;
  PreencheComboRateio;
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

  iContaXCaixa := -1;
  rbPLANILHA.Enabled := false;
  CmpForCli.Enabled := false;
  grBoxRAD.visible := sistema.UsaRAD;
  sDataLanc := '';
  cmProcListaServicos.Enabled := False;

  AbrindoTela := True;

  //início - andre tavares - pendência 17275 - 26/08/2004
  _Programa := '';
  _cdsAux := TcmClientDataset.Create(nil);
  //fim - andre tavares - pendência 17275 - 26/08/2004

//início - André Tavares - pendência 16975 - 28/06/2004 - não exibe o campo de
// compromisso orcamentário se estiver no contas a receber.
  Label17.Visible            := sistema.IdModulo <> 4;
  ReResOrc.Visible           := sistema.IdModulo <> 4;
  SpeedButton1.Visible       := sistema.IdModulo <> 4;
//fim - André Tavares - pendência 16975 - 28/06/2004

//início - André Tavares - pendência 15367 - 20/05/2004
  CtrlCentRespon := TCtrlCentRespon.Create;
  CtrlCentRespon.InitializeAS( Padroes );
//fim - André Tavares - pendência 15367 - 20/05/2004

  CtrlGrupoRateio := TCtrlGrupoRateio.Create;
  CtrlGrupoRateio.InitializeAs( Padroes );

  _oPeriodo := TCtrlPeriodo.Create;
  _oPeriodo.InitializeAs(Padroes);

  _oDocumento := TCtrlDocumento.Create;
  _oDocumento.InitializeAs(Padroes);

  _LancDocCapCar := TCtrlLancDocCapCar.Create;
  _LancDocCapCar.InitializeAs(Padroes);
  //DAVID - Retenção de Imposto
  _LancDocCapCar.OnRetencaoINSS := RetencaoOutrasEmpresas;

  _LancDocCapCar.OnPergunta := reprogDataVencto;

  // 23/01/04 Alex 14451 Nova Segregação de Recursos
  CtrlSegregacao := TCtrlSegregacao.Create;
  CtrlSegregacao.InitializeAs(Padroes);
  CtrlSegregacao.GetParams(Sistema.IdEmpresa);

  // 01/04/2004 Marchetti Pendencia 15733 e 15734
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(Padroes);

  // Marcio Motta - 17317 - 20/04/2005
  CtrlModeloHistorico := TCtrlModeloHistorico.Create;
  CtrlModeloHistorico.InitializeAs(Padroes);

  //amf 18886 27.01.2006
  CtrlTipoAlterador := TCtrlTipoAlterador.Create;
  CtrlTipoAlterador.InitializeAs(Padroes);

  //amf 01.03.2007 24450
  CtrlPortadorConta := TCtrlPortadorConta.Create;
  CtrlPortadorConta.InitializeAs(Padroes);

  CtrlPortadorForma := TCtrlPortadorForma.Create;
  CtrlPortadorForma.InitializeAs(Padroes);

  CtrlIntegraOrcFDO := TCtrlIntegraOrcFDO.Create;        //edilaine SIG115594
  CtrlIntegraOrcFDO.InitializeAs(Padroes);               //edilaine SIG115594

  CtrlListaServicos := TCtrlListaServicos.Create;
  CtrlListaServicos.InitializeAs(Padroes);

  //andre tavares
  CtrlParamGlobal := TCtrlParamGlobal.Create;
  CtrlParamGlobal.InitializeAs(padroes);
  // Andre Imakawa - SIG20321 - Inicio
  {
  CtrlIntBanco := TCtrlIntBanco.Create;
  CtrlIntBanco.InitializeAS( Padroes );
  }
  // Andre Imakawa - SIG20321 - Fim

  //amf 12.04.2007 22592
  ctrlTipoRecebDesemb := TCtrlTipoRecebDesemb.Create;
  ctrlTipoRecebDesemb.InitializeAs(Padroes);

  CtrlPessoaForne := TCtrlPessoaForne.Create;
  CtrlPessoaForne.InitializeAs(Padroes);

  CtrlFormaRecPag := TCtrlFormaRecPag.Create;
  CtrlFormaRecPag.InitializeAs(Padroes);

  _LiberaAlteracaoOutroSistema := False;

  RegAutoriza := TRegistry.Create;
  Try
     RegAutoriza.RootKey := HKEY_CURRENT_USER;

     if ( ParamIntegra.RecPag = 'P' ) then
        RegAutoriza.OpenKey('Software\CM\Contas a Pagar', True)
     else
        RegAutoriza.OpenKey('Software\CM\Contas a Receber', True);

     if RegAutoriza.ValueExists('Libera Alteração de Documentos') then
        _LiberaAlteracaoOutroSistema := (RegAutoriza.ReadString('Libera Alteração de Documentos') = 'S')
     else
        RegAutoriza.WriteString('Libera Alteração de Documentos','N');
  Finally
     RegAutoriza.Free;
  end;

  DiasUteis.SetLogradouro(Sistema.IdEmpresa, _IdCidade, _IdPais, _UF);

  DbeNoDocumento.Visible := (Trim( ParamIntegra.MascaraNoDocum ) <> '');
  dbenNumDoc.Visible := not DbeNoDocumento.Visible;

  dbeCompl.ReadOnly := ParamIntegra.AssociaComplTipoFat;

  _Modulo := 0;

  inherited;

  if ( ParamIntegra.IntegraContab ) then
  begin
     cbIntegra.Checked    := False;
     cbIntegra.Enabled    := True;
  end
  else
  begin
     cbIntegra.Checked    := True;
     cbIntegra.Enabled    := False;
  end;

   if ( ParamIntegra.RecPag = 'R' ) then
   begin
      LblNumAp.Caption           := 'Nº da AR';///SOL 178983 Douglas.Siqueira
//      LblNumAp.Caption           := 'Nº da GR'; douglas.siqueira
      lblTipoRD.Caption          := 'Tipo de Recebimento';
      Caption                    := 'Lançamento de Documentos no Contas a Receber';
      CmpForCli.Caption          := ' Cliente ';
      CmpForCli.ForCli           := fcCliente;
      lblPortadorForma.Caption   := 'Contas/Caixas x Tipo Cobr';
      lblNumChBordero.Caption    := 'No. Recebto.';
      LblFormaPag.Caption        := 'Tipos de Cobrança';

      //edilaine SIG115594 : inicio
       rbFDO.Visible             := False;
       edNumFDO.Visible          := False;
      //lblRateio.Visible        := False;
      rbRateioPre.Visible        := False;
      //edilaine SIG115594 : fim
      DBcboGrupoRateio.Visible   := False;
      btnGrupoRateio.Visible     := False;

      {RN11 - Ao abrir a funcionalidade, o campo de Nosso Numero deverá estar inabilitado e a situação do boleto deve estar oculto }
      pnlSituacao.visible        := false;   // edilaine - SOL 222006-17039 / PPM 712379

   end
   else
   begin
      LblNumAp.Caption           := 'Nº da AP';
      lblTipoRD.Caption          := 'Tipo de Desembolso';
      Caption                    := 'Lançamento de Documentos no Contas a Pagar';
      CmpForCli.Caption          := ' Favorecido ';
      CmpForCli.ForCli           := fcFornecedor;
      lblPortadorForma.Caption   := 'Contas/Caixas x Forma de Pag';
      lblNumChBordero.Caption    := 'No. Ch./Borderô';
      LblFormaPag.Caption        := 'Forma de Pagamento';
      LblSubContaCli.Caption     := 'Sub-Conta Fornecedor';

      sqlGrupoRateio.Open;
   end;

   GpDotorc.Enabled := (( ParamIntegra.IntegraOrcamento ) and ( ParamIntegra.RecPag = 'P' ));
   // HABILITAR E DESABILATR Campos do orcamento...
   ///VANDER

   gbBoleto.visible := ( ParamIntegra.RecPag = 'R' );   // edilaine - SOL 222006-17039 / PPM 712379

   GpBarras.Visible := ( ParamIntegra.RecPag = 'P' );
   GpConta.Visible := ( ParamIntegra.RecPag = 'P' );

   if GpDotorc.Enabled then
      MsResORc.Filtro.Add('RESERVAORCAMEN.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

   _DataLancto := Date;
   _CodTipDoc := 0;
   pnlMestre.Enabled := False;
   _CodLancCAPCAR := 0;
   _CodLancContab := 0;

   MontaSelect.Filtro.Add('DOCUMENTO.RECPAG = ' + QuotedStr(ParamIntegra.RecPag));
   MontaSelect.Filtro.Add('DOCUMENTO.IDPESSOA = '+IntToStr(Sistema.idempresa));
   MontaSelect.Filtro.Add('TIPODOCRECPAG.CODTIPDOC In (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ' +
                          QuotedStr(ParamIntegra.RecPag) + ' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + QuotedStr(ParamIntegra.RecPag) + ' and b.idusuario=' +
                          Inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ' +
                          QuotedStr(ParamIntegra.RecPag) + '  and exists (select 1 from UsuarioxTpdocto b where recpag=' + QuotedStr(ParamIntegra.RecPag) + ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                          Inttostr(sistema.idusuario)+'))');
   MontaSelect.Filtro.Add('TIPODOCRECPAG.RECPAG = ' + QuotedStr(ParamIntegra.RecPag));

  if _OperacaoLanc = opldContratoPrevisao then
     MontaSelect.Filtro.Add('DOCUMENTO.OPERACAO = ''11'' OR DOCUMENTO.OPERACAO = ''12''')
  else
    if _OperacaoLanc = opldAdiantamento then
     MontaSelect.Filtro.Add('DOCUMENTO.OPERACAO = ''14'' or DOCUMENTO.OPERACAO = ''15''')
    else
     MontaSelect.Filtro.Add('DOCUMENTO.OPERACAO = ''1'' OR DOCUMENTO.OPERACAO = ''2'' OR DOCUMENTO.OPERACAO = ''10''');

  SelDocs(-1);
  _Modulo := Cds.FieldByName('IDMODULO').AsInteger;

  if _OperacaoLanc = opldEfetivo then
  begin
     if ( ParamIntegra.RecPag = 'R' ) then
     begin
       Caption := 'Lançamento de Documentos no Contas a Receber';
       HelpContext           := 40009;   // edilaine - SOL 222006-17039 / PPM 712379
       bbtnAjuda.HelpContext := 40009;   // edilaine - SOL 222006-17039 / PPM 712379
     end
     else
     begin
// Daniel Simões - 25/01/2006 - Início------------------------------------------
       Caption := 'Lançamento de Documentos no Contas a Pagar';
       HelpContext           := 30009;
       bbtnAjuda.HelpContext := 30009;
     end;
  end
  else
  begin

     if _OperacaoLanc = opldContratoPrevisao then
     begin
       lblEmissao.Caption := 'Início';
       lblData.Caption := 'Quebra';
     end;

     if ( ParamIntegra.RecPag = 'R' ) then
     begin
        if _OperacaoLanc = opldAdiantamento then
           Caption  := 'Lançamento de Adiantamento no Contas a Receber'
        else
           Caption  := 'Lançamento de Previsões no Contas a Receber';
     end
     else
     begin
        if _OperacaoLanc = opldAdiantamento then
        begin
          Caption := 'Lançamento de Adiantamento no Contas a Pagar';
          HelpContext           := 30015;
          bbtnAjuda.HelpContext := 30015;
        end
        else
        begin
          Caption := 'Lançamento de Previsões no Contas a Pagar';
          HelpContext           := 30013;
          bbtnAjuda.HelpContext := 30013;
        end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
     end;

     cbIntegra.Checked:=True;
  end;

  CmpForCli.Mensagens.EmBranco := CmpForCli.Caption + CmpForCli.Mensagens.EmBranco;
  CmpForCli.Mensagens.NaoExiste:= CmpForCli.Caption + CmpForCli.Mensagens.NaoExiste;

  SqlFormaPag.Prepare;
  SqlFormaPag.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlFormaPag.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  SqlFormaPag.OPen;

  if UpperCase( Sistema.TipoEmpresa ) = 'P' then
  begin
     PnlPrograma.Visible := True;

     SqlPlanoPrev.Prepare;
     SqlPlanoPrev.Open;

     SqlProgramaPrev.Prepare;
     SqlProgramaPrev.Open;

     SqlPatroPrev.Prepare;
     SqlPatroPrev.Open;
  end
  else
  begin
     PnlRateioGeral.Parent := pnlControlesDet;
     PnlPrograma.Visible := False;
  end;

  if ( not ParamIntegra.TipoOperOk ) and ( ParamIntegra.IntegraContab ) then
  begin
    MsgDlg('Para ter este sistema Integrado com a Contabilidade é necessário cadastrar o Tipo de Operação 03 no GlobalCM. Caso este código não seja cadastrado, este sistema não aceitará nenhum lançamento.','Atenção',mtWarnIng,[mbOk],0);
   Repaint;
    Close;
    Exit;
  end;

  SqlAlt.Prepare;
  SqlAlt.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  SqlAlt.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlAlt.Open;

  SqlTipoDoc.Prepare;
  SqlTipoDoc.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  SqlTipoDoc.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlTipoDoc.Open;

  SqlPortForma.Prepare;
  SqlPortForma.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  SqlPortForma.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlPortForma.Open;

  SqlMoeda.Open;

  _NomeCentroRespon := '';
  _CodCentroRespon  := '';

  //Bruno Bastos - 14399 e 14400 - 14/08/2003 - Início

  //andré tavares - pendência 26515 - 05/10/2007 - comentei o código abaixo, pois isso já foi feito no formCreate
  CdsAux.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);
  If CdsAux.FieldByName('FLGACESSLANCDOC').AsString = 'S' Then
  Begin
// início - André Tavares - pendência 15367 - 20/05/2004
    cdsCentroRespon.Data := CtrlCentRespon.ListaCentResponAtrib_Usu(Sistema.IdUsuario,
                            Sistema.IdEmpresa, tcrAmbos, ParamIntegra.PlanoCentroRespon);
// fim - André Tavares - pendência 15367 - 20/05/2004
  End
  Else
  begin
// início - André Tavares - pendência 15367 - 20/05/2004
    cdsCentroRespon.Data := CtrlCentRespon.GetCentResponPadrao(Sistema.IdEmpresa, ParamIntegra.PlanoCentroRespon);
    _NomeCentroRespon := CdsCentroRespon.FieldByName('NOME').AsString;
    _CodCentroRespon := CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
    cdsCentroRespon.Data := CtrlCentRespon.ListaCentRespon(Sistema.IdEmpresa, '', 1, '', ParamIntegra.PlanoCentroRespon, true, true);
  end;
// fim - André Tavares - pendência 15367 - 20/05/2004

  SqlUnidNegoc.Prepare;
  SqlUnidNegoc.ParamByName('IDPESSOA').AsFloat := Sistema.idempresa;
  SqlUnidNegoc.Open;

  if ( ParamIntegra.IntegraContab ) then
  begin
     With SqlSubConta, Sql Do
     begin
        Clear;
        Add(' SELECT ');
        Add('    NOMESUBCONTA, ');
        Add('    CODSUBCONTA ');
        Add(' FROM ');
        Add('    SUBCONTA ');
        Add(' WHERE ');
        Add('   (IDPESSOA = :IDPESSOA) ');
        Add(' ORDER BY ');
        Add('   NOMESUBCONTA ');

        Prepare;
        ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
        Open;
     end;

     With SqlSubContaForCli, Sql Do
     begin
        Clear;
        Add(' SELECT ');
        Add('    NOMESUBCONTA, ');
        Add('    CODSUBCONTA ');
        Add(' FROM ');
        Add('    SUBCONTA ');
        Add(' WHERE ');
        Add('   (IDPESSOA = :IDPESSOA) ');
        Add(' ORDER BY ');
        Add('   NOMESUBCONTA ');

        Prepare;
        ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
        Open;
     end;

     tbsContabil.Enabled := (not cbIntegra.Checked);
  end
  else
  begin
    tbsContabil.Enabled := False;
    CmbSubConta.Enabled := False;
  end;



  if _OperacaoLanc = opldContratoPrevisao then
  begin
     cbIntegra.Enabled:=False;
     cbLancaBaixa.Enabled:=False;
  end
  else
     if _OperacaoLanc = opldAdiantamento then
     begin
        cbEnglobParc.Enabled := False;
        cbLancaBaixa.Enabled := True;
        cbIntegra.Enabled := False;
     end;

  SelecionaTipoDesembolso;

  (* Gustavo 16/04/2003 - Inicio - Solicita data para disponibilidade financeira*)
  With TCtrlFinanc.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, Sistema.UsaPlanoPatro) Do
  Try
    InitializeAs(Padroes);
    LblDIspFinanc.Visible := ((ParamIntegra.RecPag = 'R') and IntegraDispFinanc);
    dbeDataDisponib.Visible := LblDIspFinanc.Visible;
  finally
    Free;
  end;
  (* Gustavo 16/04/2003 - Inicio - Solicita data para disponibilidade financeira*)


// inicio - andre tavares - 04/08/2004 - pendência 17290 ***
  With SqlCCusto, Sql Do
  begin
     Clear;
     Add(' SELECT ');
     Add('    CENT.CODEXTERNO, ');
     Add('    CENT.CODCENTROCUSTO, ');
     Add('    CENT.NOME ');
     Add(' FROM ');
     Add('    CENTCUST CENT ');
     Add(' WHERE ');
     Add('    CENT.ATIVO = ''S'' and ');
     Add('    CODCENTROCUSTO IN ');
     Add('       ( ');
     Add('          SELECT ');
     Add('             CODCENTROCUSTO ');
     Add('          FROM ');
     Add('             CONTASxCC CONT ');
     Add('          WHERE ');
     Add('             CONT.IDEMPRESA = CENT.IDEMPRESA and ');
     Add('             CONT.CODCENTROCUSTO= CENT.CODCENTROCUSTO and ');
     Add('             CONT.IDEMPRESA = :IDEMPRESA and ');
     Add('             CONT.PLANO = :PLANO  ');
     Add('            ) AND CENT.IDPLANCENTCUST = :IDPLANCENTCUST');

     prepare;
     ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
     ParamByName('PLANO').AsInteger := ParamIntegra.Plano;
     ParamByName('IDPLANCENTCUST').AsInteger := ParamIntegra.PlanoCentroCusto;
     Open;
  end;
  CtrlAvaliacaoFornec := TCtrlAvaliacaoFornec.Create;
  CtrlAvaliacaoFornec.InitializeAs(Padroes);

// fim - andre tavares - 04/08/2004 - pendência 17290

  // Início Sol: 136242 Ktn: 813941 - FHBS
  btnInsereAlteradores.Visible := (Sistema.IdModulo = 3);
  dbchkFlgSimples.Visible      := (Sistema.IdModulo = 3);
  //Cássio Rovaroto - SIG nº 136888 - Início
  //dbchkFlgEspecial.Visible     := (Sistema.IdModulo = 3);
  dbchkFlgEspecial.Visible     := False;
  //Cássio Rovaroto - SIG nº 136888 - Fim
  // Fim Sol: 136242 Ktn: 813941 - FHBS

  //Cássio - SIG nº 23656.57673 - Início
  //CboSubDespesa.enabled := CdsAux.FieldByName('FLGINTEGRAORC').Asstring = 'S';   //MARCIO SANCHES SPINOSA - EDILAINE FERRARESI - 199363/1919425
  Label23.Visible := CdsAux.FieldByName('FLGINTEGRAORC').Asstring = 'S';
  CboSubDespesa.Visible := CdsAux.FieldByName('FLGINTEGRAORC').Asstring = 'S';

	lblTipoServico.Enabled := False;
  dbLkpCbTipoServico.Enabled := False;

  bDesembolsoServico := False;
  bExisteProcSusp := False;

  if ParamIntegra.RecPag = 'R' then
  	tbsNotaFiscal.Visible := False;

  //bCPRBLancado := False; // Inicia com a necessidade de lançamento de CPRB
	//Cássio - SIG nº 23656.57673 - Fim

  bMsgAlteradorRetencao := True; //Cássio Rovaroto - SIG nº 115585
  sqlTipoServico.Open; //Cássio Rovaroto - SIG nº 115585

  edNumFDO.Enabled := False;
  dblkCResponsa.Enabled := False;
  DBcboGrupoRateio.Enabled := False;
  btnGrupoRateio.Enabled := False;
  rbFDO.Enabled := False;
  rbRateioPre.Enabled := False;
  //Cássio Rovaroto - WO 1728 - Início
  rgTipoNF.Enabled := False;
  cmProcListaServicos.Enabled  := False;
  //Cássio Rovaroto - WO 1728 - Fim

  iCalcTributos := 0;
 _IdServico := -1;

end; // Fim-Form-Create...



procedure TfrmLancDocCAPCAR.tbcDetalheChange(Sender: TObject);
begin
  inherited;

   if ( ParamIntegra.RecPag = 'P' ) and ( tbcDetalhe.TabIndex = 1 ) then
   begin
      //edilaine SIG115594 : inicio
       rbFDO.Visible             := true;
       edNumFDO.Visible          := true;
      //lblRateio.Visible        := true;
      rbRateioPre.Visible        := true;
      //edilaine SIG115594 : fim
      dblkCResponsa.Visible := True;
      Label26.Visible := True;
      Bevel3.Visible := True;
      DBcboGrupoRateio.Visible   := True;
      btnGrupoRateio.Visible     := True;
      btnGrupoRateio.Enabled := True;
   end
   else
   begin
      //edilaine SIG115594 : inicio
       rbFDO.Visible             := False;
       edNumFDO.Visible          := False;
      //lblRateio.Visible        := False;
      rbRateioPre.Visible        := False;
      //edilaine SIG115594 : fim
      dblkCResponsa.Visible := False;
      Label26.Visible := False;
      Bevel3.Visible := False;
      DBcboGrupoRateio.Visible   := False;
      btnGrupoRateio.Visible     := False;
   end;


  //Se o sistema está integrado com a contabilidade e a origem do lançamento for cap ou car
  //faz a contabilização do mesmo
  if ( ParamIntegra.IntegraContab ) and
     ((Cds.FieldByName('IDMODULO').AsInteger = 3) or
     (Cds.FieldByName('IDMODULO').AsInteger = 4)) and
     (Cds.State In ([dsInsert,dsEdit])) and
     (pgctrlDetalhe.ActivePage.PageIndex = 2) then
  begin
     cds.Edit;
     Cds.FieldByName('DEBCRE').AsString := CdsTipoDoc.FieldByName('DEBCRE').AsString;
     cdsDet.edit; // SOL 229349 Kintana 2063459
     CdsAux.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);
     if (CdsAux.FieldByName('FLGINTEGRAORC').Asstring = 'S') then   //MARCIO SANCHES SPINOSA - EDILAINE FERRARESI - 199363/1919425
        _oDocumento.Orcamento.FDO_VALIDA(opapDesembolso, cdsDet, cdsSubDespesaRateio); // SOL 229349 Kintana 2063459
     cdsDet.post; // SOL 229349 Kintana 2063459
     if not _LancDocCapCar.DeterminaContabilizacao((not cbIntegra.Checked),
                                                   placontas, TClientDataSet(cds),
                                                   TClientDataSet(cdsCCBaixasXDocum),
                                                   TClientDataSet(cdsContab),
                                                   TClientDataSet(cdsDet).data,
                                                   sistema.idEmpresa, paramIntegra.Plano, cbLancaBaixa.Checked,
                                                   _OperacaoLanc, dblcTipoDoc.Text,
                                                   paramintegra.recpag) then
      begin
         MsgDlg( _LancDocCapCar.MessageInfo, 'Erro Contabilização',mtError,[mbOk],0);
      end;
      cds.FieldByName('PLANO').asInteger           := placontas.iPlano;
      cds.FieldByName('PLACONTA').asString         := placontas.sPlacontaPass;
      Cds.FieldByName('CODCENTROCUSTO').AsString   := placontas.scodCentroCusto;
      cds.FieldByName('IDSEGREGACRITER').asInteger := placontas.iIdSegregaCriter;

     CmeDetalhe.AtualizaBotoes(Self);
  end;

  //Se o sistema não está integrado com a contabilidade passa direto para pasta de lançamentos
  if (( not ParamIntegra.IntegraContab ) or
      (cbIntegra.Checked = True)) and
      (Cds.State In ([dsInsert,dsEdit])) then
  begin
      if tbcDetalhe.TabIndex = 2 then
      begin
         pgctrlDetalhe.ActivePage := tbsLancamento;
         tbcDetalhe.TabIndex := 3;
         tbcDetalheChange(Self);
      end;
  end;

   if (tbcDetalhe.TabIndex = 4) then
   begin
     sbtnInsDet.Enabled := ((sbtnInserir.Down) and ( _OperacaoLanc = opldEfetivo ));
     sbtnAltDet.Enabled := sbtnInsDet.Enabled;
     sbtnExcluiDet.Enabled := sbtnInsDet.Enabled;
   end
   else
   begin
    //início - andre tavares - pendência 22409 - 19/07/2006
     sbtnInsDet.Enabled := bbtnConfirmar.Enabled;
    //fim - andre tavares - pendência 22409 - 19/07/2006
     sbtnAltDet.Enabled := sbtnInsDet.Enabled;
     sbtnExcluiDet.Enabled := sbtnInsDet.Enabled;
   end;

   //Cássio Rovaroto - SIG nº 23656.57673 - Início
   if (ParamIntegra.RecPag = 'P') and (pgctrlDetalhe.ActivePage = tbsNotaFiscal) then
   begin
      btnAddAlteradores.Visible := False;
     	edtValorBruto.Text := dbeValorCorrente.Text;
      edtValorBruto.Enabled := True;
     if cds.State in [dsInsert, dsEdit] then
    begin  
      //Cássio Rovaroto - SIG nº 88813 - Início
      cds.FieldByName('NFSNUMERO').asString := cds.FieldByName('NODOCUMENTO').asString;
      cds.FieldByName('NFSDATAEMISSAO').asDateTime := cds.FieldByName('DATAEMISSAO').asDateTime;

      if dbchkFlgSimples.Checked then
        btnAddAlteradores.Visible := False
      else
        btnAddAlteradores.Visible := (CtrlListaServicos.ExisteTributacaoServico(_IdServico)) and (rgTipoNF.ItemIndex <> 0);
    end;
    //Cássio Rovaroto - SIG nº 88813 - Fim
    //if iCalcTributos = 0 then
    // if MsgDlg( 'Não foram definidos os alteradores de tributação. Deseja continuar?', 'Confirmação', mtConfirmation,[mbYes, mbNO],0) = mrNo then

   end;
   //Cássio Rovaroto - SIG nº 23656.57673 - Fim
end;


procedure TfrmLancDocCAPCAR.dbeValorMoedaExit(Sender: TObject);
begin
  inherited;
  dbeValorCorrente.Value := dbeValorMoeda.Value * _ValorCotacao;
end;


procedure TfrmLancDocCAPCAR.dbeValorMoedaDetExit(Sender: TObject);
begin
  inherited;
  dbeValorDet.Value:=dbeValorMoedaDet.Value * _ValorCotacao;
end;


procedure TfrmLancDocCAPCAR.dblcUnidNegocExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     if Cds.FieldByName('MOECODIGO').AsInteger <> 0 then
     begin
        CdsDet.FieldByName('MOECODIGO').AsInteger := Cds.FieldByName('MOECODIGO').AsInteger;
        dbeValorMoedaDet.Enabled := True;
        dbeValorDet.Enabled := False;
     end
     else
     begin
        dbeValorMoedaDet.Enabled := False;
        dbeValorDet.Enabled := True;
     end;

     if (Trim(dblcUnidNegoc.Text)<>'') and
        (ActiveControl.Tag <> 9999) and
        (CdsUnidNegoc.FieldByName('UNETIPO').AsString <> 'A') then
     begin
        MsgDlg('Atividade/Projeto precisa ser analítica!', 'Atenção', mtWarnIng, [mbOk], 0);
         Repaint;
        if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
     end;

     _AtivProj := CdsUnidNegoc.FieldByName('UNIDNEGOC').asstrIng;
  end;
end;




procedure TfrmLancDocCAPCAR.bbtnCancelarClick(Sender: TObject);
begin
  FlgExit:= true; //Higor - SOL 188852 Kintana 1784376
  btnInsereAlteradores.Enabled := False;

  //edilaine SIG15594 : inicio
  if (ParamIntegra.RecPag = 'P') then
  begin
    rbFDO.checked         := false;
    rbRateioPre.checked   := false;
    rbPLANILHA.checked    := false;    // WO8229 Ferrari
    edtArquivo.text       := '';       // WO8229 Ferrari
    edNumFDO.text         := '';
    dblkCResponsa.text    := '';
    DBcboGrupoRateio.text := '';
  end;
  //edilaine SIG15594 : fim

  CmpForCli.Enabled := false;
  cmProcListaServicos.Enabled := False;

  SetaCentResponDesemb(-1,True);

  if not sbtnInsDet.Enabled then bbtnCancelarDetClick(Self);

  pnlMestre.Enabled:=False;

  inherited;

  //edilaine SIG15594 : inicio
  if (ParamIntegra.RecPag = 'P') then
  begin
    rbFDO.enabled            := false;
    rbRateioPre.enabled      := false;
    rbPLANILHA.enabled       := false;    // WO8229 Ferrari
    edtArquivo.enabled       := false;       // WO8229 Ferrari
    sbtnSelArquivo.enabled   := false;    // WO8229 Ferrari
    edNumFDO.enabled         := false;
    dblkCResponsa.enabled    := false;
    DBcboGrupoRateio.enabled := false;
  end;
  //edilaine SIG15594 : fim

  // Inicio WO8229 Ferrari
  memResultado.clear;
  pnlResultado.visible := False;
  dbgrdDet.visible := True;

  // Fim WO8229 Ferrari

end;




procedure TfrmLancDocCAPCAR.sbtnEstornarClick(Sender: TObject);
begin
  inherited;
  CmpForCli.Enabled := true;

  _TpDesmb   := '';
  _AtivProj  := '';
  _Ccusto   := '';
  _CRespom   := '';
  _Programa := ''; // andre tavares - pendência 17279

  if not Cds.FieldByName('CODDOCUMENTO').isNull then
     if ConfereSaldo(Cds.FieldByName('CODDOCUMENTO').AsInteger,True) then Exit;

  if Cds.FieldByName('ESTORNO').AsInteger <> 0 then
  begin
     MsgDlg('Este Lançamento foi estornado ou é um estorno. Proibido estornar outra vez.','Erro',mtError,[mbOk],0);
      Repaint;
     sbtnEstornar.Down:=False;
     exit;
  end;

  {**
    O Parâmetro oeDialogProcessa indica que será exibida uma caixa de diálogo na
    tela e o processamento será efetuado na aplicação servidora
  **}
  
  if _oDocumento.Estornar(Cds.FieldByName('DATALANCTO').AsDateTime,
                          Sistema.IdModulo,
                          Sistema.IdEmpresa,
                          Sistema.IdUsuario,
                          Cds.FieldByName('CODDOCUMENTO').AsInteger,
                          0,
                          ParamIntegra.Plano,
                          Sistema.UsaPlanoPatro,
                          oeDialogProcessa,
                          0,
                          0,
                          true,
                          true,
                          fdoEstornoAP
                          ) then
  begin
     MsgDlg('Documento estornado com sucesso', 'Atenção',  mtInformation, [mbOk], 0);
      Repaint;
     CmeCadastro.Find(Self);
  end
  else
   begin
     MsgDlg(_oDocumento.MessageInfo,'Atenção',mtWarning,[mbOk],0);
      Repaint;
  end;


  sbtnEstornar.Down := False;
end;




procedure TfrmLancDocCAPCAR.dblcMoedaExit(Sender: TObject);
begin
  inherited;
  if not Cds.FieldByName('MOECODIGO').isNull then
  begin
     _ValorCotacao := FuncaoGeral.TestaCotacaoMoeda(Cds.FieldByName('MOECODIGO').AsInteger, dbeDataLanc.Text, 'S');
     if  (_ValorCotacao = 0) then
     begin
        if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
        exit;
     end;
     dbeValorMoeda.Enabled:=True;
     dbeValorCorrente.Enabled:=False;
  end
  else
  begin
     dbeValorMoeda.Enabled:=False;
     dbeValorCorrente.Enabled:=True;
  end;
end;




procedure TfrmLancDocCAPCAR.dbeDataVencExit(Sender: TObject);
begin
  inherited;
  if sbtnInserir.Down = True then
  begin
    //Início - William Santana - SIG 27101
//     if _IdCidade <> 0 then
//       if not diasuteis.DiaUtil(dbeDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false) then
//       begin
//         if (Application.MessageBox('Data de vencimento não é um dia útil. Deseja alterar ?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
//         begin
//            if (Application.MessageBox('Lançar para o primeiro dia útil posterior?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
//              dbeDataVenc.Date := diasuteis.PrimeiroDiaUtilPosterior(dbeDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false)
//            else
//              dbeDataVenc.Date := diasuteis.UltDiaUtilAnterior(dbeDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false);
//         end;
//      end;

    if dbeDataVenc.text <> emptyStr then
    begin
     Cds.FieldByName('DATAPROGRAMADA').AsDateTime := strtodate(dbeDataVenc.text);
     dbeDataProgr.text := dbeDataVenc.text;
    end;
     //Término - William Santana - SIG 27101

  end;

end;


//Início - William Santana - SIG 27101
procedure TfrmLancDocCAPCAR.dbeDataVencChange(Sender: TObject);
begin
  inherited;
  if length(dbeDataVenc.text) = 10 then
    if not diasuteis.DiaUtil(dbeDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false) then
      begin
        MsgDlg('Data de vencimento não é um dia útil','Erro',mtError,[mbOk],0);
        if dbeDataVenc.CanFocus then dbeDataVenc.SetFocus;
        exit;
      end;
end;

procedure TfrmLancDocCAPCAR.dbeDataProgrChange(Sender: TObject);
begin
  inherited;
  if length(dbeDataProgr.text) = 10 then
    if not diasuteis.DiaUtil(dbeDataProgr.Date, _IdCidade, _IdPais, _UF, true, false, false) then
    begin
      MsgDlg('Data programada não é um dia útil','Erro',mtError,[mbOk],0);
      if dbeDataProgr.CanFocus then dbeDataProgr.SetFocus;
      exit;
    end;
end;
//Término - William Santana - SIG 27101


procedure TfrmLancDocCAPCAR.ExecutaPrevAdianto;
begin
  if ParamIntegra.RecPag = 'P' then
  begin
     SqlForneAdianto.Prepare;
     SqlForneAdianto.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
     SqlForneAdianto.ParamByName('IDFORCLI').AsInteger := CmpForCli.ForCliReg.Id;
     SqlForneAdianto.ParamByName('IDRAMOFORNECEDOR').AsInteger := Modulo.RamoFornAdianto;
     SqlForneAdianto.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
     SqlForneAdianto.Open;
  end
  else
  begin
     SqlCliAdianto.Prepare;
     SqlCliAdianto.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
     SqlCliAdianto.ParamByName('IDFORCLI').AsInteger := CmpForCli.ForCliReg.Id;
     SqlCliAdianto.ParamByName('IDTIPOCLIENTE').AsInteger := Modulo.IdTipoCliAdianto;
     SqlCliAdianto.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
     SqlCliAdianto.Open;
  end;

  if not CdsForCliAdianto.IsEmpty then
     if (Application.MessageBox('Existe adiantamento\previsão pendente. Deseja regularizar agora ?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
       AbrirFormModal(FrmRegPrevAdiantoMT, TFrmRegPrevAdiantoMT)
     else
       _IdForCliAdianto := 0;


//andre tavares 29/06/2006
  //primeiro seta o foco aqui
  if dbenNumDoc.Canfocus then dbenNumDoc.SetFocus;

end;




procedure TfrmLancDocCAPCAR.sbtnInserirClick(Sender: TObject);
begin
  // Alex - 29/01/2007 - Já estava apertado inserir
  if (CmeCadastro.Operacao = opInserir) then
  begin
     sbtnInserir.Down := true;
     Exit;
  end;

  CmpForCli.Enabled := true;
  sDataLanc := ''; // André Tavares - pendência 18937 - 25/04/2005
  _TpDesmb  :='';
  _AtivProj := '';
  _Ccusto  :='';
  _CRespom  :='';
  _Programa := ''; // andre tavares - pendência 17279

  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange(Sender);

  dblcTipoRD.Enabled := False;
  //CboSubDespesa.Enabled := False;


  _ValorEdit := 0;
  _Valida := True;


  inherited;

  //edilaine SIG15594 : inicio
  if (ParamIntegra.RecPag = 'P') then
  begin
    rbFDO.enabled            := true;
    rbRateioPre.enabled      := true;
    edNumFDO.enabled         := true;
    dblkCResponsa.enabled    := true;
    DBcboGrupoRateio.enabled := true;
    rbPLANILHA.Enabled       := true;        // WO8229 Ferrari
  end;
  //edilaine SIG15594 : fim

  if CmpForCli.CanFocus then
     CmpForCli.setFocus;

  cmProcListaServicos.Enabled := True;
end;




procedure TfrmLancDocCAPCAR.bbtnOkDetClick(Sender: TObject);
begin
  //início andre tavares - pendência 15372 - 03/06/2004
  if (cdsDet.State in [dsInsert, dsEdit]) and ((trim(CmbCentCusto.text) <> '') and (trim(CmbCentCusto.lookupvalue) <> '')) then
  begin
    cdsDet.FieldByName('CODEXTERNOCR').asString := CdsCentroRespon.fieldByName('CODEXTERNO').asString;
    cdsDet.FieldByName('CODEXTERNOCC').asString := CdsCentroCusto.fieldByName('CODEXTERNO').asString;
  end;
  //fim andre tavares - pendência 15372 - 03/06/2004

  //Bruno Bastos - Pend. 25204 - Início
  if MsResORc.RetornouValor then
  begin
    //Testa se os campos do compromisso orçamentário estão iguais aos do rateio
       //Plano Previdenciário
    if ( CmbPlano.LookupValue           <> MsResORc.ValoresChave[3] ) and
       ( trim(MsResORc.ValoresChave[3]) <> ''                       ) then
    begin
      MsgDlg('Plano previdenciário do compromisso orçamentário diferente do plano previdenciário do rateio.','Informação',mtInformation,[mbOk],0);
      Abort;
    end;

       //Patrocinadora
    if ( CmbPatro.LookupValue           <> MsResORc.ValoresChave[4] ) and
       ( trim(MsResORc.ValoresChave[4]) <> ''                       ) then
    begin
      MsgDlg('Patrocinadora do compromisso orçamentário diferente da patrocinadora do rateio.','Informação',mtInformation,[mbOk],0);
      Abort;
    end;

       //Atividade e Projeto
    if ( dblcUnidNegoc.LookupValue      <> MsResORc.ValoresChave[5] ) and
       ( trim(MsResORc.ValoresChave[5]) <> ''                       ) then
    begin
      MsgDlg('Atividade/projeto do compromisso orçamentário diferente de atividade/projeto do rateio.','Informação',mtInformation,[mbOk],0);
      Abort;
    end;

       //Centro de Custo
    if ( CmbCentCusto.LookupValue       <> MsResORc.ValoresChave[6] ) and
       ( trim(MsResORc.ValoresChave[6]) <> ''                       ) then
    begin
      MsgDlg('Centro de custo do compromisso orçamentário diferente do centro de custo do rateio.','Informação',mtInformation,[mbOk],0);
      Abort;
    end;

       //Centro de Responsabilidade
    if ( dblcCentroRespon.LookupValue   <> MsResORc.ValoresChave[7] ) and
       ( trim(MsResORc.ValoresChave[7]) <> ''                       ) then
    begin
      MsgDlg('Centro de responsabilidade do compromisso orçamentário diferente do centro de responsabilidade do rateio.','Informação',mtInformation,[mbOk],0);
      Abort;
    end;

       //Programa
    if ( CmbPrograma.LookupValue        <> MsResORc.ValoresChave[8] ) and
       ( trim(MsResORc.ValoresChave[8]) <> ''                       ) then
    begin
      MsgDlg('Programa do compromisso orçamentário diferente do programa do rateio.','Informação',mtInformation,[mbOk],0);
      Abort;
    end;
  end;
  //Bruno Bastos - Pend. 25204 - Fim

  // início - andré tavares - pendência 17279 - 26/08/2004
  if trim(CdsDet.FieldByName('IDPROGRAMA').AsStrIng) <> '' then
    _Programa := CdsDet.FieldByName('IDPROGRAMA').AsStrIng;

  CmbPrograma.LookupValue := _Programa;
  if trim(_Programa) <> '' then
    CdsProgramaPrev.Locate('IDPROGRAMA', _Programa, []);

  if (cdsDet.State in [dsEdit, dsInsert]) and (trim(CmbPrograma.Text)<> '') then
    CdsDet.FieldByName('DESCPROGRAMA').AsString := CmbPrograma.Text;
  // fim - andré tavares - pendência 17279 - 26/08/2004

  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  if (cdsDet.State in [dsInsert, dsEdit])    Then
  begin
    Try
      if (CdsAux.FieldByName('FLGINTEGRAORC').Asstring = 'S') then   //MARCIO SANCHES SPINOSA - EDILAINE FERRARESI - 199363/1919425
        _oDocumento.Orcamento.FDO_VALIDA(opapDesembolso, cdsDet, cdsSubDespesaRateio);
    Except
      on ErroFDO : EProcessoFDO do
      Begin
        Case ErroFDO.Origem of
          opapDesembolso : ErroFDO.BuscaInfoCodOrigem(CdsTipoRD, 'CODTIPRECDES', 'Descricao');
          opapAlterador  : ErroFDO.BuscaInfoCodOrigem(CdsAlt,    'CODALTERADOR', 'Descricao');
        End;

        MsgDlg(ErroFDO.Message,'Informação',mtInformation,[mbOk],0);
        Abort;
      End;

      On E : Exception do RAISE;
    End;

    SetRATEIO_ORCAMENTO;
    //
    cdsDet.FieldByName('PossuiGrupoOrcamen').AsInteger := CdsTipoRD.FieldByName('PossuiGrupoOrcamen').AsInteger;
    cdsDet.FieldByName('IDPROGRAMAORCAMEN' ).AsInteger := CdsProgramaPrev.FieldByName('IDPROGRAMAORCAMEN').AsInteger;
    //
    // Campos abaixo utilizados para verificar se o alterador quando lançado possui a mesma conta de acordo com o relacionamento
    _oDocumento.Orcamento.CopyFieldsFDO(CDS, cdsDet, ['IDFORCLI','DATAVENCTO', 'DATALANCTO']);
    if (Trim(CboSubDespesa.LookupValue) <> '') then
    Begin
      cdsDet.FieldByName( 'IDDESPESAORC' ).AsString := CboSubDespesa.LookupValue;
      cdsDet.FieldByName( 'SUBDESPESA'   ).AsString := cdsSubDespesaRateio.FieldByName( 'SUBDESPESA' ).AsString;
      _oDocumento.Orcamento.CopyFieldsFDO(opapDesembolso, cdsSubDespesaRateio, cdsDet);
    End;
    //
  end;
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662


  if (tbcDetalhe.TabIndex = 4) then
  begin
     if not TestaAlterador then Exit;

     //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
     if (cdsAlteradores.State in [dsInsert, dsEdit])       and
        (Trim(cboAlteradoresDescRateio.LookupValue) <> '') then
     begin
       cdsAlteradores.FieldByName( 'ACRESDECRES'      ).AsString := cdsAlt.FieldByName('ACRESDECRES').AsString;
       cdsAlteradores.FieldByName( 'FLGOBRIGARESERVA' ).AsString := cdsAlt.FieldByName('FLGOBRIGARESERVA').AsString;

       // 11/10/2012
       // A lógica abaixo utiliza O Dataset cdsSubDespesaAlteradores que era utilizado para selecionar a
       // sub despesa de acordo com um combo que existia na ABA de Alteradores, para continuar o funcionamento
       // e realizar a alteração de maneira rápida apenas exclui o Combo e com o Filter abaixo faz com que o
       // funcionamento fique o mesmo.
       if Trim(CdsRateioAlteradorFDO.FieldByName('IDDESPESAORC').AsString) <> '' then   // Edilaine - SOL 195755 / KTN 1871968
         With cdsSubDespesaAlteradores do
           Try
             Filtered := False;
             Filter   := 'IDDESPESAORC = ' + CdsRateioAlteradorFDO.FieldByName('IDDESPESAORC').AsString;
             Filtered := True;
             // Campos abaixo utilizados para verificar se o alterador quando lançado possui a mesma conta de acordo com o relacionamento
             _oDocumento.Orcamento.CopyFieldsFDO(opapAlterador, cdsSubDespesaAlteradores, cdsAlteradores);
           Finally
             Filtered := False;
             Filter   := '';
           End;

     end;
     //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  end;

  inherited;

 If tbcDetalhe.TabIndex = 1 Then
      Begin
         dbeValorDet.Value := _ValorEdit;
         If IsFloatZero(dbeValorDet.Value) Then
            Begin
               bbtnVoltarDet.Click;

               // SOL 189828 KTN 1794500 - Paulo Nobre
               //************************************************************************************
               //
               If Sistema.IDModulo = 3 Then // Somente no contas a pagar
                  Begin
                     // Limpar o CDS
                     EmptyDataSet(CdsAlteradores);

                     CdsDet.First;
                     While Not CdsDet.Eof Do
                        Begin
                           // Preenche os campos com os dados para gerar os alteradores
                           SalvaDadosParaAlteradores;
                           v_datamov := Date;
                           // Roda rotina automática de Inserção dos alteradores;
                           FazChamadaAlteradores;

                           CdsDet.Next;
                        End;
                     CdsDet.First;

                     //Cássio Rovaroto - SIG nº 123523 - Início
                     //pgctrlDetalhe.ActivePage := tbsAlteradores;
                     //tbcDetalhe.TabIndex := 4;
                     pgctrlDetalhe.ActivePage := tbsNotaFiscal;
                     tbcDetalhe.TabIndex := 7;
                     tbcDetalheChange(tbcDetalhe);
                     //Cássio Rovaroto - SIG nº 123523 - Fim
                  End;
               //************************************************************************************
            End;
      End;
end;

Procedure TFrmLancDocCAPCAR.InsereSegregacaoFinancHabitacional;
var // Posicao : TBookMark;
    oQry : tQuery;
    bPrimeiroRegistro : boolean;

    Procedure FazQuery;
    begin
      With oQry do
      begin
        DataBaseName := 'BaseDados';
        Sql.Add('SELECT C.IDSEGREGACRITER,');
        Sql.Add('       C.DESCRICAO,');
        Sql.Add('       D.DATAINI,');
        Sql.Add('       D.DATAFIM,');
        Sql.Add('       CC.IDPATRO,');
        Sql.Add('       CC.IDPLANOPREV,');
        Sql.Add('       CC.COTACAO');
        Sql.Add('FROM SEGREGACRITER C, SEGREGADATA D, SEGREGACOTACAO CC');
        Sql.Add('WHERE c.idsegregacriter = d.idsegregacriter');
        Sql.Add('  AND D.IDSEGREGADATA = CC.IDSEGREGADATA');
        Sql.Add('  and Upper(descricao) = ''FINANCIAMENTO HABITACIONAL''');
        Sql.Add('  AND dataini <= :DataIni');
        Sql.Add('  and (datafim >= :DataFim or DATAFIM is Null)');
        Sql.Add('ORDER BY DATAFIM DESC');
        Prepare;
        ParamByName('DataIni').AsDateTime := dbeDataProgr.Date;
        ParamByName('DataFim').AsDateTime := dbeDataProgr.Date;
      End;
    End;

    procedure CopiaLinhas;
    var rValorTotal, rValorTotalOm : Double;
        rCotacao, rVal, rValOm : Double;
        sDescricao, sNome, sMoeSigla, sNomeCentroCusto,
        sNomeCentroRespon, sCodExternoCR, sCodExternoCC : String;

        procedure GuardaValores;
        begin
          sDescricao         := dblcTipoRD.Text;
          sNome              := dblcUnidNegoc.Text;
          sMoeSigla          := edMoedaDet.Text;
          sNomeCentroCusto   := CmbCentCusto.Text;
          sNomeCentroRespon  := dblcCentroRespon.Text;
          sCodExternoCR      := CdsCentroRespon.fieldByName('CODEXTERNO').asString;
          sCodExternoCC      := CdsCentroCusto.fieldByName('CODEXTERNO').asString;
        end;

    begin
      rValorTotal   := 0;
      rValorTotalOM := 0;
      oQry.Open;
      While Not oQry.Eof do
      begin
        If bPrimeiroRegistro then
          GuardaValores
        else
        begin
          CdsDet.Post;
          CdsDet.Insert;
        end;

        CdsPatroPrev.Locate('IdPessoa',    oQry.FieldByName('IdPatro').asInteger,    []);
        CdsPlanoPrev.Locate('IdPlanoPrev', oQry.FieldByName('IdPlanoPrev').asInteger,[]);
        CdsProgramaPrev.Locate('IDPrograma',_Programa,[]);

        if CdsDet.FieldByName('CODDOCUMENTO').AsInteger <= 0 then
        begin
          CdsDet.FieldByName('RECPAG').AsString        := ParamIntegra.RecPag;
          CdsDet.FieldByName('CODDOCUMENTO').AsInteger := Cds.FieldByName('CODDOCUMENTO').AsInteger;
          CdsDet.FieldByName('IDPESSOA').AsInteger     := Sistema.IdEmpresa;
        end;

        CdsDet.FieldByName('DESCRICAO').Text := sDescricao;
        CdsDet.FieldByName('NOME').Text      := sNome;
        CdsDet.FieldByName('MOESIGLA').Text  := sMoeSigla;
        CdsDet.FieldByName('IDSEGREGACRITER').AsInteger := -1;

        if not CdsTipoRD.FieldByName('PLACONTACREDITO').isnull then
          CdsDet.FieldByName('PLACONTACREDITO').asstrIng := CdsTipoRD.FieldByName('PLACONTACREDITO').asstrIng
        else
          CdsDet.FieldByName('PLACONTACREDITO').asstrIng := CmpForCli.ForCliReg.CContabil  ;

        CdsDet.FieldByName('CODCENTROCUSTO').AsString    := _Ccusto;
        CdsDet.FieldByName('NOMECENTROCUSTO').AsString   := sNomeCentroCusto;

        cdsDet.FieldByName('CODEXTERNOCR').asString      := sCodExternoCR;
        cdsDet.FieldByName('CODEXTERNOCC').asString      := sCodExternoCC;

        CdsDet.FieldByName('CODTIPRECDES').AsString      := _Tpdesmb;
        CdsDet.FieldByName('UNIDNEGOC').AsString         := _Ativproj;
        CdsDet.FieldByName('IDPROGRAMA').AsString        := _Programa;
        CdsDet.FieldByName('DESCPROGRAMA').AsString      := CmbPrograma.Text;
        CdsDet.FieldByName('CODCENTRORESPON').asstrIng   := _Crespom;
        CdsDet.FieldByName('NOME_1').Text                := sNomeCentroRespon;

        rCotacao := oQry.FieldByName('Cotacao').AsFloat / 100;
        rVal     := RoundCm(dbeValorDet.Value      * rCotacao,2);
        rValOM   := RoundCm(dbeValorMoedaDet.Value * rCotacao,2);

        CdsDet.FieldByName('VALOR').Value           := rVal;
        CdsDet.FieldByName('VALOROUTRAMOEDA').Value := rValOM;

        CdsDet.FieldByName('IDPLANOORIGEM').AsInteger   := oQry.FieldByName('IdPlanoPrev').asInteger;
        CdsDet.FieldByName('DESCPLANOORIGEM').AsString  := CmbPlano.Text;
        CdsDet.FieldByName('IDPATROORIGEM').AsInteger   := oQry.FieldByName('IdPatro').asInteger;
        CdsDet.FieldByName('NOMEPATROORIGEM').AsString  := CmbPatro.Text;

        AtualizaPlanoPatro;

        If CdsDet.FieldByName('IDPLANOPREV').AsInteger = 0 then
        begin
          CdsDet.FieldByName('IDPLANOPREV').AsInteger        := oQry.FieldByName('IdPlanoPrev').asInteger;
          CdsDet.FieldByName('IDPATRO').AsInteger            := oQry.FieldByName('IdPatro').asInteger;
          cdsDet.FieldByName(dbtxtDESCPLANO.DataField).Value := CmbPlano.Text;
          cdsDet.FieldByName(dbtxtNomePatro.DataField).Value := CmbPatro.Text;
        end;


        if not VerificaPreenchimentoSegregaDetalhe then
        begin
          Abort;
          exit;
        end;

        rValorTotal   := rValorTotal   + rVal;
        rValorTotalOM := rValorTotalOM + rValOM;
        bPrimeiroRegistro := False;
        oQry.Next;
      end;
      If dbeValorDet.Value <> rValorTotal then
        CdsDet.FieldByName('VALOR').Value := CdsDet.FieldByName('VALOR').Value + (dbeValorDet.Value - rValorTotal);
      If dbeValorMoedaDet.Value <> rValorTotalOM then
        CdsDet.FieldByName('VALOROUTRAMOEDA').Value := CdsDet.FieldByName('VALOROUTRAMOEDA').Value + (dbeValorMoedaDet.Value - rValorTotalOM);
      oQry.Close;
      _ValorEdit :=  _ValorEdit - dbeValorDet.Value;
    end;

begin
  // criar aqui a rotina para inserir lancamentos
  bPrimeiroRegistro := True;
//  posicao := cdsDet.GetBookMark;
  try
    oQry := TQuery.Create(nil);
    try
      FazQuery;
      CopiaLinhas;
    except
      exit;
    end;
  finally
    FreeAndNil(oQry);
  end;
//  cdsDet.GotoBookMark(Posicao);
//  CdsDet.FreeBookMark(Posicao);
//  CdsDet.Edit;
end;




procedure TfrmLancDocCAPCAR.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  pnlrateio.visible := True;   //WO8229 Ferrari
  if (tbcDetalhe.TabIndex = 4) then AtualizaSaldo;
end;

procedure TfrmLancDocCAPCAR.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  pnlrateio.visible := True;   //WO8229 Ferrari
  if (tbcDetalhe.TabIndex = 4) then AtualizaSaldo;
end;

procedure TfrmLancDocCAPCAR.sbtnInsDetClick(Sender: TObject);
begin
  if not ValidaOperacao then Exit;

  if ( CmeCadastro.Operacao in [opInserir, opAlterar] ) then
  begin
    inherited;
    pnlResultado.visible := False; //WO8229 Ferrari
    pnlrateio.visible := False;    //WO8229 Ferrari
    if (tbcDetalhe.TabIndex = 1) then
    begin
       if IsFloatZero(_ValorEdit) then
       begin
          MsgDlg('O Total do Rateio Já Foi Fechado!', 'Erro', mtError, [mbOk], 0);
          Repaint;
          bbtnCancelarDet.Click;
       end
       else
          dbeValorDet.Value := _ValorEdit;
    end;
  end;
end;

procedure TfrmLancDocCAPCAR.sbtnAltDetClick(Sender: TObject);
begin
  if not ValidaOperacao then Exit;

  if ( CdsAtual <> nil ) and CdsAtual.IsEmpty then
  begin
    sbtnAltDet.Down := false;
    Exit;
  end;

  if ( CmeCadastro.Operacao in [opInserir, opAlterar] ) then
  begin
    inherited;
    pnlResultado.visible := False;   //WO8229 Ferrari
    pnlrateio.visible := False;     //WO8229 Ferrari
    if tbcDetalhe.TabIndex = 1 then
    begin

      if CdsDet.State <> DsEdit then
        CdsDet.Edit;

      if (_ValorEdit <> 0) and (CdsDet.State = DsInsert) then
      begin
         _ValorEdit := (_ValorEdit + CdsDet.FieldByName('VALOR').AsFloat);
         dbeValorDet.Value := _ValorEdit
      end
      else
      begin
        _ValorEdit := CdsDet.FieldByName('VALOR').AsFloat;
        dbeValorDet.Value := CdsDet.FieldByName('VALOR').AsFloat;
      end;

      //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
      SetRATEIO_ORCAMENTO;
      //CboSubDespesa.Enabled    := CdsDet.FieldByName('FLGOBRIGARESERVA').AsString = 'S';

     // Alterado por Arnaldo V. Scarin em 13/01/2010
     // SOL: 129614 KTN: 712474
     // Correção do erro ao alterar o Rateio de um documento
     CdsAux.Data := CtrlParamCap.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);
      if trim(cdsAux.fieldByName('FLGDESVINCCC').asString) <> 'S' then //andré tavares - pendência 26515 - 05/10/2007
        MontaCentroDeCusto;
        
    end;

  end;
end;




procedure TfrmLancDocCAPCAR.sbtnExcluiDetClick(Sender: TObject);
begin
  if not ValidaOperacao then Exit;

  if ( CdsAtual <> nil ) and CdsAtual.IsEmpty then Exit;

  if ( CmeCadastro.Operacao in [opInserir, opAlterar] ) then
  begin
    if (tbcDetalhe.TabIndex = 1) then
       _ValorEdit := _ValorEdit + CdsDet.FieldByName('VALOR').AsFloat;

    inherited;
  end;
end;


procedure TfrmLancDocCAPCAR.dbeValorCorrenteChange(Sender: TObject);
begin
  inherited;
  if CmeCadastro.Operacao In [OpInserir,OpAlterar] then
  begin
     CalculaValorEdit;

     if Cds.State in [ DsEdit, DsInsert ] then
        Cds.FieldByName('VLRLIQUIDO').AsFloat := dbeValorCorrente.Value;
  end;
end;




procedure TfrmLancDocCAPCAR.sbtnAlterarClick(Sender: TObject);
begin

  if (CmeCadastro.Operacao = opAlterar) then
  begin
    // Início SOL: 136242 Kintana: 813941 - JRM6
    // Habilita o botão para inserir alteradores
    btnInsereAlteradores.Enabled := True;
    //  Término SOL: 136242 Kintana: 813941 - JRM6
    sbtnAlterar.Down := true;
    Exit;
  end;

  CmpForCli.Enabled := true;
  sDataLanc := Cds.FieldByName('DATALANCTO').AsString; // ANDRE TAVARES - pendência 19937
  bFornOld := Cds.FieldByName('IDFORCLI').AsInteger; //Taffarel - SIG86328

  if (Cds.FieldByName('OPERACAO').AsString = '10') then
  begin
    MsgDlg('Não é possível alterar ' + Caption + ' efetuados com a opção de "Lança e Baixa"', 'Erro', mtError,[mbOk],0);
   Repaint;
    sbtnAlterar.Down := False;
  end
  else

  // Início -  Rodolpho da Silva - P: 18588 - 22/06/2005
  if not VerificaSeDocAdiantEstaRegularizado then
  begin
     MsgDlg('Não é possível alterar documento com adiantamento já regularizado. ' + #13 +
            'Para alterar, é necessário excluir a regularização do mesmo.','Erro',mtError,[mbOk],0);
     sbtnAlterar.Down := False;
     Exit;
  end;
  {else}      // edilaine - SOL 222006-17039 / PPM 712379 - comentado
  // Fim -  Rodolpho da Silva - P: 18588 - 22/06/2005

  // edilaine - SOL 222006-17039 / PPM 712379 - inicio
  {RN02. Documentos com status 1 (um), não podem ser alterados e/ou excluídos.}
  if cds.FieldByName('STATUS').AsInteger = 1 then
  begin
    {RN18. A mensagem [MSG01] deverá ser emitida logo ao clicar em <ALTERAR>, quando esta se enquadrar na regra [RN02]}
    AvisoDlg('Aviso', 'Este documento não pode ser alterado e/ou excluído.'+#10+'Existe boleto ou arquivo emitido', taCenter);
    Repaint;
    {RN20. O estado da tela quando executada as regras: [RN18] e [RN19] é: - Efeito do clique no botão <CANCELAR>}
    bbtnCancelar.Click;
    exit;
  end;

  {RN03. Documentos com status 2 (um), não podem ser alterados e/ou excluídos.}
  if cds.FieldByName('STATUS').AsInteger = 2 then
  begin
    {RN19. A mensagem [MSG01] deverá ser emitida logo ao clicar em <EXCLUIR>, quando esta se enquadrar na regra [RN03]}
    AvisoDlg('Aviso', 'Este documento não pode ser alterado e/ou excluído.'+#10+'Documento baixado', taCenter);
    Repaint;
    {RN20. O estado da tela quando executada as regras: [RN18] e [RN19] é: - Efeito do clique no botão <CANCELAR>}
    bbtnCancelar.Click;
    exit;
  end;
  // edilaine - SOL 222006-17039 / PPM 712379 - fim


    if Modulo.StatusIsAtivo(Cds.FieldByName('IDFORCLI').AsInteger) then
    begin
      _TpDesmb  := '';
      _AtivProj := '';
      _Ccusto  :='';
      _Crespom  := '';
      _Programa := ''; // andre tavares - pendência 17279

      if not Cds.FieldByName('CODDOCUMENTO').isNull and
        (not _LiberaAlteracaoOutroSistema) then
      begin
        if VerificaParcelas(Cds.FieldByName('NUMFATURA').AsString) then Exit;
        if ConfereSaldo(Cds.FieldByName('CODDOCUMENTO').AsInteger,False) then Exit;
      end;

      _ValorEdit := 0;

      inherited;

    end
    else
      sbtnAlterar.Down := False;

  tbcDetalheChange(tbcDetalhe);

  //edilaine SIG15594 : inicio
  if (ParamIntegra.RecPag = 'P') then
  begin
    rbFDO.enabled            := true;
    rbRateioPre.enabled      := true;
    edNumFDO.enabled         := true;
    dblkCResponsa.enabled    := true;
    DBcboGrupoRateio.enabled := true;
  end;
  //edilaine SIG15594 : fim
  cmProcListaServicos.Enabled := True;

end;




procedure TfrmLancDocCAPCAR.sbtnApagarClick(Sender: TObject);
begin
  CmpForCli.Enabled := true;
  _TpDesmb  := '';
  _AtivProj := '';
  _Ccusto  := '';
  _Crespom  := '';
  _Programa := ''; // andre tavares - pendência 17279
  cmProcListaServicos.Enabled := True;
  inherited;
end;

procedure TfrmLancDocCAPCAR.dsLancamentoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (not bbtnConfirmar.Enabled) and
     (not CdsLancamento.IsEmpty) then
  begin
    SqlContab.Prepare;
    SqlContab.ParamByName('PLNCODIGO').AsFloat := CdsLancamento.FieldByName('PLNCODIGO').AsInteger;
    //20317 - andre tavares - para poder selecionar os lançamentos contábeis de antecipação de receita
    SqlContab.ParamByName('PLNANTECIPA').AsFloat := CdsLancamento.FieldByName('PLNANTECIPA').AsInteger;
    SqlContab.Open;
  end;
end;




function TfrmLancDocCAPCAR.ConfereSaldo(iCodDocumento: integer;bVerificaLanc: boolean):boolean;
begin
 _oDocumento.Saldo.CalculaSaldo(iCodDocumento);

 if bVerificalanc then
    Result :=  ( ((Cds.FieldByName('STATUS').AsString = '2') and
                  (Cds.FieldByName('OPERACAO').asstrIng <> '10')) or
               (not FloatsEqual(Abs(_oDocumento.Saldo.Valor), Abs(dbeValorCorrente.Value))))
 else
    Result :=  ( ((Cds.FieldByName('STATUS').AsString = '2') and
                  (Cds.FieldByName('OPERACAO').asstrIng <> '10')) or
                  (IsFloatZero(_oDocumento.Saldo.Valor)));

 if Result then
   begin
    MsgDlg('Existem outros lançamentos para este documento, proibido alterar, excluir ou estornar','Erro',mtError,[mbOk],0);
   Repaint;
   end;
end;




function TfrmLancDocCAPCAR.VerificaParcelas(sNumFatura: String):boolean;
begin
 if (sNumFatura = '0') or (sNumFatura = '') then
    Result := False
 else
 begin
    Result := FazQuery(DtmBaseDados.qry,'SELECT CODDOCUMENTO FROM DOCUMENTO WHERE NUMFATURA = ' + sNumFatura + ' and OPERACAO = ''3''');
    DtmBaseDados.qry.Close;
    if Result then
      begin
       MsgDlg('O Documento foi Englobado\Parcelado, favor excluir as parcelas para modificar o documento','Erro',mtError,[mbOk],0);
      Repaint;
      end;
 end;
end;




procedure TfrmLancDocCAPCAR.cbLancaBaixaClick(Sender: TObject);
begin
  inherited;
  dbenChBordero.Enabled   := cbLancaBaixa.Checked;
  lblNumChBordero.Enabled := cbLancaBaixa.Checked;

  if not cbLancaBaixa.Checked then
     if (Cds.State In ([dsInsert,dsEdit])) then Cds.FieldByName('NUMCHQBORDERO').Clear;
end;




procedure TfrmLancDocCAPCAR.CmpForCliEnter(Sender: TObject);
begin
  inherited;
  dblcTipoRD.Enabled := False;
  //CboSubDespesa.Enabled := False;  
end;




procedure TfrmLancDocCAPCAR.CmpForCliExit(Sender: TObject);
begin
  Try
  if FlgExit then begin //Higor Nayde SOL 188852 Kintana 1784376
    //início - andre tavares - pendência 22237 - 23/08/2006 - busca a conta bancária do novo fornecedor
    if cds.state in [dsEdit, dsInsert] then
    begin
      sqlContaBancaria.Prepare;
      sqlContaBancaria.paramByName('IDFORCLI').asInteger := Cds.FieldByName('IDFORCLI').asInteger;
      sqlContaBancaria.Open;

      //amf 27.04.2007 25203 - Não habilitar o gpConta caso o fornecedor não tenha dados bancários.
      gpConta.Enabled := (not cdsContaBancaria.IsEmpty);

      if Cds.FieldByName('IDFORCLI').asInteger <> bFornOld then //Taffarel - SIG86328
         Cds.FieldByName('IDCBANCARIA').AsInteger := cdsContaBancaria.FieldByName('IDCBANCARIA').asInteger;
    end;
    //fim - andre tavares - pendência 22237 - 23/08/2006

    frmAguarde.Mostra( 'Favor aguardar' );
    frmAguarde.Min := 0;
    frmAguarde.Max := 5;
    frmAguarde.Pos := 0;
    inherited;
    if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) and
       (ActiveControl <> nil) and (ActiveControl.Tag <> 9999) and _Valida then
    begin
       if ( not (Cds.State in [DsEdit, DsInsert]) ) then Cds.Edit;

       if CdsCentroRespon.IsEmpty then SelecionaTipoDesembolso;
       frmAguarde.Pos := 1;

       if (CmpForCli.Valida = VcOk) and (Modulo.StatusIsAtivo(CmpForCli.ForCliReg.Id)) then
       begin
          if ( CmeCadastro.Operacao = OpInserir ) and
             ( _OperacaoLanc = opldEfetivo ) and
             ( _IdForCliAdianto <> CmpForCli.ForCliReg.Id ) then
             begin
               _IdForCliAdianto := CmpForCli.ForCliReg.Id;
               if DtmDadosBancarios <> nil then
               begin
                 DtmCapCarMT.CdsAdtoPendente.Close;
                 DtmCapCarMT.CdsPrevPendente.Close;
                 ExecutaPrevAdianto;
               end;
             end;

          frmAguarde.Pos := 2;
          Cds.FieldByName('CODSUBCONTA').AsString := CmpForCli.ForCliReg.SubConta;
          CmbSubConta.LookupValue := CmpForCli.ForCliReg.SubConta;

          If CmeCadastro.Operacao <> OpAlterar then // Peterson Victor SIG 19929
             DtmDadosBancarios.SetaContaPreferencial(CmpForCli.ForCliReg.Id, Cds); // Peterson Victor SIG 19929
          frmAguarde.Pos := 3;

          if ( ParamIntegra.IntegraContab ) and
              ((Cds.FieldByName('IDMODULO').AsInteger = 3) or
               (Cds.FieldByName('IDMODULO').AsInteger = 4)) then
          begin
             if (Trim(CmpForCli.ForCliReg.CAdiantamento) = '') and
                ( _OperacaoLanc = opldAdiantamento ) then
             begin
               MsgDlg('Como a contabilidade está Integrada, é obrigatório preencher a conta contabil de Adiantamento','Erro',mtError,[mbOk],0);
               Repaint;
               bbtnCancelar.Click;
               exit;
             end;
             if ( ParamIntegra.RecPag = 'R' ) then
             begin
                if Trim(CmpForCli.ForCliReg.CContabil) = '' then
                begin
                  MsgDlg('Como a contabilidade está Integrada, é obrigatório preencher a conta contabil deste Cliente','Erro',mtError,[mbOk],0);
                  Repaint;
                  bbtnCancelar.Click;
                  exit;
                end;

                if CmpForCli.ForCliReg.CContabil = CmpForCli.ForCliReg.CReceita then
                   cbIntegra.Checked:=True;
             end
             else
             begin
                if Trim(CmpForCli.ForCliReg.CContabil) = '' then
                begin
                  MsgDlg('Como a contabilidade está Integrada, é obrigatório preencher a conta contabil deste Fornecedor','Erro',mtError,[mbOk],0);
                  Repaint;
                  bbtnCancelar.Click;
                  exit;
                end;
                if CmpForCli.ForCliReg.CContabil = CmpForCli.ForCliReg.CDespesa then
                   cbIntegra.Checked:=True;
             end;
          end;

          if DbeNoDocumento.Visible then
          begin
             Cds.FieldByName('COMPLDOCUMENTO').AsString := ParamIntegra.BuscaCodigoFiscalReduzido(CmpForCli.ForCliReg.Id);
             frmAguarde.Pos := 4;

             if (Trim(Cds.FieldByName('COMPLDOCUMENTO').AsString) = '') and
                ( ParamIntegra.AssociaComplTipoFat ) then
                begin
                   MsgDlg('Não foi cadastrada a Classificação Fiscal para este ' + CmpForCli.caption + ' ou o código reduzido da mesma não foi preenchido. Não é possível Inserir o documento.','Erro',mtError,[mbOk],0);
                  Repaint;
                   bbtnCancelar.Click;
                   exit;
                end;
          end;
          frmAguarde.Pos := 5;
       end
       else
       begin
          tbcDetalhe.TabIndex := 0;
          if CmpForCli.CanFocus then CmpForCli.SetFocus;
          Exit;
       end;

       if DbeNoDocumento.CanFocus then
         DbeNoDocumento.SetFocus
       else
         if dbenNumDoc.CanFocus then
           dbenNumDoc.SetFocus;

         //William Moreira da Silva - SOL 250751
         FlgExit := false;
         if (CtrlAvaliacaoFornec.VerificaQualificacao(Cds.FieldByName('IDFORCLI').AsInteger))then begin
           MsgDlg('Este fornecedor possui 04 ou mais qualificações técnicas negativas!', 'Atenção', mtInformation, [mbOk],0);
         end;
         if (dbenNumDoc.canfocus) then
            dbenNumDoc.setfocus;  // Macete usado para forçar a saída do campo a assim atualizar os ponteiros de dados (Cds e o registro da classe)
         FlgExit := true;
         end;

    end //Higor Nayde SOL 188852 Kintana 1784376
    else
    begin
         bbtnCancelarClick(self);
    End;
    //William Moreira da Silva - SOL 250751
    Finally
    frmAguarde.Apaga;
  end;
end;

procedure TfrmLancDocCAPCAR.dblcTipoRDCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: boolean);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin

    if trim(cdsAux.fieldByName('FLGDESVINCCC').asString) <> 'S' then //andré tavares - pendência 26515 - 05/10/2007
      MontaCentroDeCusto;

    if CdsDet.State In [DsEdit, DsInsert] then
    begin
       CdsDet.FieldByName('DESCRICAO').AsString := dblcTipoRD.Text;
       if not CdsTipoRD.FieldByName('PLACONTACREDITO').isnull then
          CdsDet.FieldByName('PLACONTACREDITO').asstrIng := CdsTipoRD.FieldByName('PLACONTACREDITO').asstrIng
       else
          CdsDet.FieldByName('PLACONTACREDITO').asstrIng := CmpForCli.ForCliReg.CContabil  ;

       _TpDesmb := CdsTipoRD.FieldByName('CODTIPRECDES').asstrIng;
       CdsDet.FieldByName('HITCODHIST').AsString := CdsTipoRD.FieldByName('HITCODHIST').AsString;

       // Ricardo A. SOL 122623 KTN 603580
       AtualizaPlanoPatro;

       // Alterado por Arnaldo V. Scarin em 19/10/2009
       // SOL 123802 e 123804 -> CGPC 028.
       AjustaUsoPGA(CdsTipoRD.FieldByName('FLGFINANCHABITACIONAL').asString);

       //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
       //cdsSubDespesaRateio.Data := _oDocumento.Orcamento.ListaSubDespesas(opapDesembolso, _TpDesmb, Cds.FieldByName('IDFORCLI').AsInteger, CdsDet.FieldByName('CODCENTROCUSTO').AsString, Sistema.IdEmpresa);
       //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
        // Edilaine - SOL 195755 / KTN 1871968
        // SOL 225023 KINTANA 2060526
        if _CCusto <> '' then
        cdsSubDespesaRateio.Data := _oDocumento.Orcamento.ListaSubDespesas(opapDesembolso,
                                                                   _TpDesmb,
                                                                   Cds.FieldByName('IDFORCLI').AsInteger,
                                                                   _CCusto,
                                                                   Sistema.IdEmpresa,
                                                                   CdsDet.FieldByName( 'TipoDespesa' ).asinteger);

        // SOL 225023 KINTANA 2060526

        //Cássio Rovaroto - SIG nº 115585 - Início
        {
        //Cássio Rovaroto - SIG nº 23656.57673 - Início
        if ParamIntegra.RecPag = 'P' then
        begin
          if _LancDocCapCar.VerificaTipoServico(CdsTipoRD.FieldByName('CODTIPRECDES').asString, ParamIntegra.RecPag) then
          begin
            sqlTipoServico.Open;
          	 lblTipoServico.Enabled := True;
            dbLkpCbTipoServico.Enabled := True;
          end;
        end;
        //Cássio Rovaroto - SIG nº 23656.57673 - Fim
        }
        //Cássio Rovaroto - SIG nº 115585 - Fim
    end;
  end;
end;

procedure TFrmLancDocCapCar.AjustaUsoPGA(Const pUsoPGA : String);
begin
  _UsoPGA := pUsoPGA = 'S';
  CmbPatro.Enabled := Not _UsoPGA;
  CmbPlano.Enabled := Not _UsoPGA;
  If _UsoPGA then
  begin
    CmbPatro.Text := '';
    CmbPlano.Text := '';
    cdsDet.FieldByName(CmbPatro.DataField).Clear;
    cdsDet.FieldByName(CmbPlano.DataField).Clear;
    cdsDet.FieldByName(dbtxtNomePatro.DataField).Clear;
    cdsDet.FieldByName(dbtxtDESCPLANO.DataField).Clear;
  end;
end;

procedure TfrmLancDocCAPCAR.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  MsResORc.Executar;
  if MsResORc.RetornouValor then
  begin
    if not (CdsDet.State In [DsEdit, DsInsert]) then CdsDet.Edit;

    CdsDet.FieldByName('NUMRESERVA').AsInteger := StrToInt(MsResORc.ValoresChave[1]);
    CdsDet.FieldByName('IDRESERVAORCAMEN').AsFloat := StrToFloat(MsResORc.ValoresChave[0]);

    ReResorc.Value := CdsDet.FieldByName('NUMRESERVA').AsInteger;
    SetaCentResponDesemb(CdsDet.FieldByName('IDRESERVAORCAMEN').AsInteger, False);
  end;
end;




procedure TfrmLancDocCAPCAR.dblcCentroResponExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     if (Trim(dblcCentroRespon.Text)<>'') and
        (ActiveControl.Tag <> 9999) and
        (CdsCentroRespon.FieldByName('ANALITICOSINTET').AsString <> 'A') then
     begin
        MsgDlg('Centro de Responsabilidade tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
         Repaint;
        if dblcCentroRespon.CanFocus then dblcCentroRespon.SetFocus;
     end;

     _CRespom:= CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
  end;
end;


procedure TfrmLancDocCAPCAR.SetaCentResponDesemb(iNumReserva:LongInt;bLimpa: boolean);
var
  sFiltroDesemb, sFiltroCRespon: String;
begin
  if (not bLimpa) and
     FazQuery(DtmBaseDados.Qry,'SELECT ' +
                               ' CP.CODCENTRORESPON, CP.CODTIPRECDES ' +
                               'FROM ' +
                               ' COMPCONTASORCAMEN CP, RESERVAORCAMEN RE ' +
                               'WHERE ' +
                               ' (RE.IDRESERVAORCAMEN = ' + IntToStr(iNumReserva) + ') and ' +
                               ' (RE.IDPLANOORCAMEN = CP.IDPLANOORCAMEN)     and ' +
                               ' (RE.IDCONTAORCAMEN = CP.IDCONTAORCAMEN)') then
  begin
    sFiltroDesemb  := '';
    sFiltroCRespon := '';

    while not DtmBaseDados.Qry.Eof Do
    begin

      if not DtmBaseDados.Qry.FieldByname('CODTIPRECDES').isNull then
         if sFiltroDesemb = '' then
            sFiltroDesemb  := ' CODTIPRECDES = ''' + trim( DtmBaseDados.Qry.FieldByname('CODTIPRECDES').AsString ) + ''''
         else
            sFiltroDesemb  := sFiltroDesemb + ' OR CODTIPRECDES = ''' + trim( DtmBaseDados.Qry.FieldByname('CODTIPRECDES').AsString ) + '''';

      if not DtmBaseDados.Qry.FieldByname('CODCENTRORESPON').isNull then
         if sFiltroCRespon = '' then
            sFiltroCRespon := ' CODCENTRORESPON = ''' + trim( DtmBaseDados.Qry.FieldByname('CODCENTRORESPON').AsString ) + ''''
         else
            sFiltroCRespon := sFiltroCRespon + ' OR CODCENTRORESPON = ''' + trim( DtmBaseDados.Qry.FieldByname('CODCENTRORESPON').AsString ) + '''';

      DtmBaseDados.Qry.Next;
    end;

    if sFiltroDesemb <> '' then
    begin
      CdsTipoRD.Filter         := sFiltroDesemb;
      CdsTipoRD.Filtered       := True;
    end
    else
    begin
      CdsTipoRD.Filtered       := False;
      CdsTipoRD.Filter         := '';
    end;

    if sFiltroCRespon <> '' then
    begin
      CdsCentroRespon.Filter   := sFiltroCRespon;
      CdsCentroRespon.Filtered := True;
    end
    else
    begin
      CdsCentroRespon.Filtered       := False;
      CdsCentroRespon.Filter         := '';
    end;
  end
  else
  begin
    CdsTipoRD.Filtered       := False;
    CdsTipoRD.Filter         := '';
    CdsCentroRespon.Filtered := False;
    CdsCentroRespon.Filter   := '';
  end;
end;




procedure TfrmLancDocCAPCAR.DbeNoDocumentoExit(Sender: TObject);
var
  sNoDocum :String;
begin
  inherited;
  if (CmeCadastro.Operacao In [Opalterar,OpInserir]) and
     (ActiveControl.tag <> 9999) and
     (DbeNoDocumento.Visible) then
  begin

    sNodocum := Cds.FieldByName('NUMFATURA_1').AsString;
    while (Pos('.',sNodocum) <> 0) Do
          Delete(sNoDocum,Pos('.',sNodocum),1);

    if Trim(sNoDocum) <> '' then
    begin
       Cds.FieldByName('NODOCUMENTO').AsString := sNoDocum;
       if Cds.FieldByName('IDFORCLI').isNull then
       begin
          if CmpForCli.CanFocus then CmpForCli.SetFocus;
       end
       else
         if dbeDataEmi.CanFocus then dbeDataEmi.SetFocus;
    end
    else
      if dbeDataEmi.CanFocus then dbeDataEmi.SetFocus;
  end;
end;




procedure TfrmLancDocCAPCAR.SetaEnglobaParcela;
var
  sNumDocumento, sAuxMasacara :String;
begin
  inherited;
  if (dblcTipoDoc.Text <> '') and
     (CmeCadastro.Operacao In [OpInserir, OpAlterar]) then
  begin
     cbEnglobParc.Enabled := (( _OperacaoLanc <> opldAdiantamento ) and
                              ((CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').AsString = 'A') OR
                               (CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').IsNull)));
     cbEnglobParc.Checked := (CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').AsString = 'S') Or
                             ((Cds.FieldByName('OPERACAO').AsString = '1') or (Cds.FieldByName('OPERACAO').AsString = '11'));
  end;

  if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) and
     (CdsTipoDoc.FieldByName('FLGGERANUMDOC').AsString = 'S') and
     (dbenNumDoc.Value = 0.00) and
     (dblcTipoDoc.Text <> '') then
  begin
    if ParamIntegra.MascaraNoDocum <> '' then
    begin
       sNumDocumento := IntToStr(_oDocumento.GetSequenceDocumento);
       Cds.FieldByName('NODOCUMENTO').AsFloat := StrToFloat(sNumDocumento);

       if (CdsTipoDoc.FieldByName('FLGCODDOCIGUALNODOC').AsString = 'S')  then // 160624
          Cds.FieldByName('CODDOCUMENTO').Asstring := sNumDocumento; // 160624

       sAuxMasacara := ParamIntegra.MascaraNoDocum;

       while Pos('9',sAuxMasacara) <> 0 Do
             sAuxMasacara[Pos('9',sAuxMasacara)] := '0';

       sNumDocumento := Copy(sAuxMasacara, 1, Length(sAuxMasacara) - Length(sNumDocumento)) + sNumDocumento;
       Cds.FieldByName('NUMFATURA_1').AsString := sNumDocumento;
       DbeNoDocumentoExit(Self);
    end
    else
    begin
       if (Trim(dblcTipoDoc.text) <> '') and (Cds.FieldByName('NODOCUMENTO').AsFloat = 0) then
       begin
          Cds.FieldByName('NODOCUMENTO').AsFloat := _oDocumento.GetSequenceDocumento;
          if (CdsTipoDoc.FieldByName('FLGCODDOCIGUALNODOC').AsString = 'S')  then // 160624
             Cds.FieldByName('CODDOCUMENTO').AsFloat := Cds.FieldByName('NODOCUMENTO').AsFloat ; // 160624
       end;

    end;
  end;
end;




procedure TfrmLancDocCAPCAR.dblcTipoDocExit(Sender: TObject);
begin
  inherited;
  SetaEnglobaParcela;
  AtualizaSaldo;
end;

procedure TfrmLancDocCAPCAR.MontaCentroDeCusto;
var ctrlCentroCusto: TCtrlCentroCusto;
begin

  ctrlCentroCusto := TCtrlCentroCusto.Create;
  ctrlCentroCusto.InitializeAS( Padroes );
  dblcTipoRD.LookupValue := dblcTipoRD.LookupValue;

  try

    if not cbIntegra.Checked then //se integra com a contabilidade
    begin
      if (not CdsTipoRD.isEmpty) and (trim(CdsTipoRD.FieldByName('PLACONTA').AsString) <> '') then
        cdsCentroCusto.Data := ctrlCentroCusto.ListaCentCustXContasxCC(sistema.IdEmpresa,
                               ParamIntegra.Plano, CdsTipoRD.FieldByName('PLACONTA').AsString,
                               ParamIntegra.PlanoCentroCusto);

      if (not CdsDet.IsEmpty) and (CdsCentroCusto.IsEmpty) and (not CdsDet.FieldByName('IDPROGRAMA').isNull) then
        cdsCentroCusto.Data := ctrlCentroCusto.ListaCcustoXTipoRdxCCxConta(Sistema.IdEmpresa,
                                             ParamIntegra.RecPag, Trim(dblcTipoRD.LookupValue),
                                             CdsDet.FieldByName('IDPROGRAMA').AsInteger,
                                             ParamIntegra.PlanoCentroCusto);

    end;

    //Ref. SOL 89575 - Nilton
    //if CdsCentroCusto.IsEmpty then
    //begin
      cdsCentroCusto.Data := ctrlCentroCusto.ListaCentroCusto(sistema.IdEmpresa, '', true,
                                                    1, '', ParamIntegra.PlanoCentroCusto);
    //end;

  finally
    ctrlCentroCusto.free;
  end;
end;



procedure TfrmLancDocCAPCAR.dbeDataEmiExit(Sender: TObject);
begin
  inherited;
  if sbtnInserir.Down = True then
  begin
     Cds.FieldByName('DATALANCTO').AsDateTime := strtodate(dbeDataEmi.text);
     dbeDataLanc.text := dbeDataEmi.text;
  end;
end;




procedure TfrmLancDocCAPCAR.BtnNumApgrClick(Sender: TObject);
begin
  inherited;
  if Cds.State in [DsEdit, DsInsert] then
     Cds.FieldByName('NUMAPGR').AsInteger := LeUltRegistro(nil,'SEQAPGR');
end;




procedure TfrmLancDocCAPCAR.AtualizaSaldo;
var
  rSaldoAtualizaDoc :Double;

  function CalcValAlteradores:Double;
  var
    Natureza : Integer;
  begin
    Result := 0;

    if not CdsAlteradores.IsEmpty then
    begin
      if CdsAlteradores.State In [DsEdit, DsInsert] then
      begin
        if ( CdsAlteradores.FieldByName('DEBCRE').AsString = CdsTipoDoc.FieldByName('DEBCRE').AsString ) then
         begin
          Natureza := 1;
        end else begin
          Natureza := -1;
        end;
        Result := Result + ( CdsAlteradores.FieldByName('VALOR').AsFloat * Natureza );
      end else begin

        while not CdsAlteradores.Eof Do begin
          if ( CdsAlteradores.FieldByName('DEBCRE').AsString = CdsTipoDoc.FieldByName('DEBCRE').AsString ) then
         begin
            Natureza := 1;
          end else begin
            Natureza := -1;
          end;
          Result := Result + ( CdsAlteradores.FieldByName('VALOR').AsFloat * Natureza );

          CdsAlteradores.Next;
        end;

        CdsAlteradores.First;
      end;
    end;
  end;
begin
  if (CmeCadastro.Operacao = OpInserir) then
  begin
    rSaldoAtualizaDoc := dbeValorCorrente.Value + CalcValAlteradores;
    BtnStatus.Caption    := 'Documento Em Aberto '  + (#13+#10) + 'Saldo: '+ FormatFloat('#,##0.00', rSaldoAtualizaDoc);
  end;
end;




procedure TfrmLancDocCAPCAR.dbeValorCorrenteExit(Sender: TObject);
begin
  inherited;
  AtualizaSaldo;
end;




procedure TfrmLancDocCAPCAR.CmbProgramaExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
     CdsDet.FieldByName('DESCPROGRAMA').AsString := CmbPrograma.Text;
  // início - andré tavares - pendência 17279 - 26/08/2004
  _Programa := CdsDet.FieldByName('IDPROGRAMA').AsStrIng;
  // fim - andré tavares - pendência 17279 - 26/08/2004

end;




procedure TfrmLancDocCAPCAR.CmbPlanoExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     // Ricardo A. SOL 122623 KTN 603580
     _PlanoPrevDet := CdsDet.FieldByName('IDPLANOORIGEM').AsInteger;
     CdsDet.FieldByName('DESCPLANOORIGEM').AsString := CmbPlano.Text;
  end;
end;




procedure TfrmLancDocCAPCAR.CmbPatroExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     // Ricardo A. SOL 122623 KTN 603580
     CdsDet.FieldByName('NOMEPATROORIGEM').AsString := CmbPatro.Text;
     _PatroDet := CdsDet.FieldByName('IDPATROORIGEM').AsInteger;
  end;
end;




procedure TfrmLancDocCAPCAR.CmbCentCustoExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     if (Trim(CmbCentCusto.Text)<>'') and (ActiveControl.Tag <> 9999) and
        (CdsCentroCusto.FieldByName('STATUSGRUPOCDC').AsString <> 'A') then
     begin
        MsgDlg('Centro de custo tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
         Repaint;
        if CmbCentCusto.CanFocus then CmbCentCusto.SetFocus;
     end;

    _CCusto := CdsCentroCusto.FieldByName('CODCENTROCUSTO').asstrIng;
    CdsDet.FieldByName('NOMECENTROCUSTO').AsString := CmbCentCusto.Text;

    //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    cdsSubDespesaRateio.Data := _oDocumento.Orcamento.ListaSubDespesas(opapDesembolso,
                                                                       _TpDesmb,
                                                                       Cds.FieldByName('IDFORCLI').AsInteger,
                                                                       _CCusto,
                                                                       Sistema.IdEmpresa,
                                                                       CdsDet.FieldByName('TipoDespesa').Asinteger);
    //CboSubDespesa.Enabled    := CdsDet.FieldByName('FLGOBRIGARESERVA').AsString = 'S';
    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  end;

end;




procedure TfrmLancDocCAPCAR.dblcTipoRDExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
    _TpDesmb := CdsTipoRD.FieldByName('CODTIPRECDES').asstrIng;
    CdsDet.FieldByName('FLGOBRIGARESERVA').AsString := CdsTipoRD.FieldByName('FLGOBRIGARESERVA').AsString;
    // Alterado por Arnaldo V. Scarin em 19/10/2009
    // SOL 123802 e 123804 -> CGPC 028.
    AjustaUsoPGA(CdsTipoRD.FieldByName('FLGFINANCHABITACIONAL').asString);
  end;
end;




procedure TfrmLancDocCAPCAR.CmbCentCustoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: boolean);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
    if (Trim(CmbCentCusto.Text)<>'') and
       (ActiveControl.Tag <> 9999) and
       (CdsCentroCusto.FieldByName('STATUSGRUPOCDC').AsString <> 'A') then
    begin
       MsgDlg('Centro de custo tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
      Repaint;
       if CmbCentCusto.CanFocus then CmbCentCusto.SetFocus;
    end;

    _CCusto := CdsCentroCusto.FieldByName('CODCENTROCUSTO').asstrIng;
    CdsDet.FieldByName('NOMECENTROCUSTO').AsString := CmbCentCusto.Text;

    if not CdsCentroCusto.FieldByName('IDPROGRAMA').isNull then
       CdsDet.FieldByName('IDPROGRAMA').AsFloat := CdsCentroCusto.FieldByName('IDPROGRAMA').AsFloat
    else
       CdsDet.FieldByName('IDPROGRAMA').Clear;

    // Ricardo A. SOL 122623 KTN 603580
    AtualizaPlanoPatro;

    //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    cdsSubDespesaRateio.Data := _oDocumento.Orcamento.ListaSubDespesas(opapDesembolso,
                                                                       _TpDesmb,
                                                                       Cds.FieldByName('IDFORCLI').AsInteger,
                                                                       _CCusto,
                                                                       Sistema.IdEmpresa,
                                                                       CdsDet.FieldByName( 'TipoDespesa' ).asinteger);
    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

  end;
end;




procedure TfrmLancDocCAPCAR.dblcUnidNegocCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: boolean);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     if Cds.FieldByName('MOECODIGO').AsInteger <> 0 then
     begin
        CdsDet.FieldByName('MOECODIGO').AsInteger := Cds.FieldByName('MOECODIGO').AsInteger;
        dbeValorMoedaDet.Enabled := True;
        dbeValorDet.Enabled := False;
     end
     else
     begin                                                 
        dbeValorMoedaDet.Enabled := False;
        dbeValorDet.Enabled := True;
     end;

     if (Trim(dblcUnidNegoc.Text)<>'') and
        (ActiveControl.Tag <> 9999) and
        (CdsUnidNegoc.FieldByName('UNETIPO').AsString <> 'A') then
     begin
        MsgDlg('Atividade/Projeto precisa ser analítica!', 'Atenção', mtWarnIng, [mbOk], 0);
         Repaint;
        if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
     end;

     _AtivProj := CdsUnidNegoc.FieldByName('UNIDNEGOC').asstrIng;
  end;

end;




procedure TfrmLancDocCAPCAR.CmpForCliApertouBotao(Sender: TObject);
begin
  inherited;
  _IdForCliAdianto := Cds.FieldByName('IDFORCLI').AsInteger;
end;




procedure TfrmLancDocCAPCAR.CmbProgramaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: boolean);
begin
  inherited;
  // início - andré tavares - pendência 17279 - 26/08/2004
  _Programa := CdsDet.FieldByName('IDPROGRAMA').AsStrIng;
  // fim - andré tavares - pendência 17279 - 26/08/2004
  CdsDet.FieldByName('DESCPROGRAMA').AsString := CmbPrograma.Text;

  // Ricardo A. SOL 122623 KTN 603580
  AtualizaPlanoPatro;

end;




procedure TfrmLancDocCAPCAR.CmbPatroCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: boolean);
begin
  inherited;
   // Ricardo A. SOL 122623 KTN 603580
  _PatroDet := CdsDet.FieldByName('IDPATROORIGEM').AsInteger;
  CdsDet.FieldByName('NOMEPATROORIGEM').AsString := CmbPatro.Text;
  AtualizaPlanoPatro;

end;




procedure TfrmLancDocCAPCAR.CmbPlanoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: boolean);
begin
  inherited;
   // Ricardo A. SOL 122623 KTN 603580
  _PlanoPrevDet := CdsDet.FieldByName('IDPLANOORIGEM').AsInteger;
  CdsDet.FieldByName('DESCPLANOORIGEM').AsString := CmbPlano.Text;
  AtualizaPlanoPatro;

end;




procedure TfrmLancDocCAPCAR.BtnBuscaContaCorClick(Sender: TObject);
begin
  inherited;
  if CmeCadastro.Operacao In [OpInserir, OpAlterar] then
  begin
     With DtmDadosBancarios Do
     begin
        SetaFiltroMs(Cds.FieldByName('IDFORCLI').AsFloat);
        if MsContaCor.Executar = MrOk then
        begin
          Cds.FieldByName('IDCBANCARIA').AsFloat := StrToFloat(MsContaCor.ValoresChave[0]); //CONTABANCARIA.IDCBANCARIA
          Cds.FieldByName('CONTACORRENTE').AsString := MsContaCor.ValoresChave[1]; //CONTABANCARIA.CONTACORRENTE
          Cds.FieldByName('NUMBANCO').AsString := MsContaCor.ValoresChave[2]; //BANCO.NUMBANCO
          Cds.FieldByName('NUMAGENCIA').AsString := MsContaCor.ValoresChave[3]; //AGENCIABANCARIA.NUMAGENCIA
          Cds.FieldByName('DESCTIPOCONTA').AsString := MsContaCor.ValoresChave[4]; //CONTABANCARIA.TIPOCONTA
        end;
     end;
  end;
end;


procedure TfrmLancDocCAPCAR.setaplanopatroglobal;
var
cdsLocal : TCMClientDataSet;

begin
   cdsLocal := TCMClientDataSet.Create(nil);
   cdsLocal.data := _lancDocCapCar.ListaPlanoPatroParamCap;

   // Ricardo A. SOL 122623 KTN 603580
   if CdsDet.FieldByName('IDPLANOORIGEM').IsNull and
   //Marcus Oliveira P.25312 31/07/2007 Inicio
      (cdslocal.FieldByName('IDPLANOPREV').AsInteger > 0) then
   begin
      CdsDet.FieldByName('IDPLANOORIGEM').AsFloat := cdslocal.FieldByName('IDPLANOPREV').asfloat;
      CmbPlano.Lookupvalue := cdslocal.FieldByName('IDPLANOPREV').AsString;

      _PlanoPrevDet := cdslocal.FieldByName('IDPLANOPREV').AsInteger;
      CmbPlano.CloseUp(True);
      CmbPlanoExit(Self);
   end;

   // Ricardo A. SOL 122623 KTN 603580
   if ( CdsDet.FieldByName('IDPATROORIGEM').IsNull ) and

      ( cdslocal.FieldByName('IDPATRO').AsInteger > 0 ) then
   begin
      _PatroDet := cdslocal.FieldByName('IDPATRO').AsInteger;

      CmbPatro.Lookupvalue :=cdslocal.FieldByName('IDPATRO').AsString;
      CdsDet.FieldByName('IDPATROORIGEM').AsFloat := cdslocal.FieldByName('IDPATRO').AsInteger;

   //Marcus Oliveira P.25312 31/07/2007 Fim

      CmbPatro.CloseUp(True);
      CmbPatroExit(Self);
   end;
end;




procedure TfrmLancDocCAPCAR.DclAtivProjetoExit(Sender: TObject);
begin
  inherited;
  if (Trim(DclAtivProjeto.Text) <> '') and
     (CdsAlteradores.State In [DsEdit,DsInsert]) then
     CdsAlteradores.FieldByName('NOME').AsString := DclAtivProjeto.Text;
end;




procedure TfrmLancDocCAPCAR.dblkAlteradorExit(Sender: TObject);
begin
  inherited;
  if (Trim(dblkAlterador.Text) <> '') and
     (CdsAlteradores.State In [DsEdit,DsInsert]) then
  begin
    CdsAlteradores.FieldByName('DESCRICAO').AsString := dblkAlterador.Text;
    CdsAlteradores.FieldByName('DEBCRE').AsString := CdsAlt.FieldByName('ACRESDECRES').AsString;
    CdsAlteradores.FieldByName('FLGINCIDEIRRF').AsString := CdsAlt.FieldByName('FLGINCIDEIRRF').AsString;
    //Linha Acima - Bruno Bastos - Pend. 14392 - 12/08/2003

    // Paulo Nobre - WO24106 - Inicio
    if CdsAlt.FieldByName('FLGVALORBASE').asString = 'S' Then
    Begin
        cdsAlteradores.FieldByName('VALORBASERETENCAO').asFloat := cds.FieldByName('VALOR').asFloat;
        edtValorBaseRetencao.Enabled := False;
    end;
    // Paulo Nobre - WO24106 - Fim

    //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    cdsSubDespesaAlteradores.Data    := _oDocumento.Orcamento.ListaSubDespesas(opapAlterador,
                                                                               dblkAlterador.LookUpValue,
                                                                               Cds.FieldByName('IDFORCLI').AsInteger,
                                                                               CdsDet.FieldByName('CODCENTROCUSTO').AsString,
                                                                               Sistema.IdEmpresa,
                                                                               CdsDet.FieldByName( 'TipoDespesa' ).Asinteger);
    CdsRateioAlteradorFDO.Data       := CdsDet.Data;
    cboAlteradoresDescRateio.Enabled := True;
    //cboAlteradoresSubDespesa.Enabled := True;
    //cboAlteradoresDescRateio.Enabled := cdsSubDespesaAlteradores.FieldByName('FLGOBRIGARESERVA').AsString = 'S';
    //cboAlteradoresSubDespesa.Enabled := cboAlteradoresDescRateio.Enabled;
    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  end;
end;




function TfrmLancDocCAPCAR.TestaAlterador:boolean;
begin
  Result := False;
  if Trim(dblkAlterador.Text) = '' then
   begin
     MsgDlg('O Alterador não foi Informado','Erro',mtError,[mbOk],0);
     Repaint;
   end
  else
     if DbrValor.Value = 0.00 then
        MsgDlg('O Valor do Alterador não foi Informado','Erro',mtError,[mbOk],0)
     else
        if DtLancto.Text = '' then
           MsgDlg('A Data de Lançamento do Alterador não foi Informada','Erro',mtError,[mbOk],0)
          //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
     else{ if (cboAlteradoresSubDespesa.Enabled)          AND
             (cboAlteradoresSubDespesa.LookUpValue = '') then
             MsgDlg('A Sub-Despesa não foi Informada!','Erro',mtError,[mbOk],0)
          //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
          else}
            Result := True;
  //Cássio Rovaroto - SIG nº 115585 - Início
  //if (dbLkpCbTipoServico.LookupValue = EmptyStr ) then
  if (dbLkpCbTipoServico.Enabled) and (dbLkpCbTipoServico.LookupValue = EmptyStr ) then //Cássio Rovaroto - SIG nº 116274
  begin
    MsgDlg('É necessário informar o tipo de serviço relacionado. ', 'Atenção', mtWarning, [mbOk], 0);
    Result := False;
    Abort;
    Exit;
  end;

  //if (edtValorBaseRetencao.Visible) and ((edtValorBaseRetencao.Value = 0) or //Cássio Rovaroto - SIG nº 116274
  if (edtValorBaseRetencao.Enabled) and ((edtValorBaseRetencao.Value = 0) or //Cássio Rovaroto - SIG nº 116274
                                         (FloatToStr(edtValorBaseRetencao.Value) =  EmptyStr))
  then
  begin
    MsgDlg('É necessário definir o valor base de retenção. ', 'Atenção', mtWarning, [mbOk], 0);
    Result := False;
    Abort;
    Exit;
  end;

  if (edtValorBaseRetencao.Enabled) then
  begin
    if (bMsgAlteradorRetencao) then
      if Application.MessageBox(PChar('O valor base da retenção é, realmente, R$ ' +  edtValorBaseRetencao.Text + '?'),
                                        'Confirmar',36) <> 6 then
      begin
        edtValorBaseRetencao.SetFocus;
        bMsgAlteradorRetencao := False;
        Result := False;
      end
      else
        Result := True;
  end;
  //Cássio Rovaroto - SIG nº 115585 - Fim

  if not Result then Abort;
end;




procedure TfrmLancDocCAPCAR.DbrValorExit(Sender: TObject);
begin
  inherited;
  if CdsAlteradores.State In [DsEdit,DsInsert] then
     CdsAlteradores.FieldByName('VLRLIQUIDO').AsFloat := CdsAlteradores.FieldByName('VALOR').AsFloat;
end;

procedure TfrmLancDocCAPCAR.CdsalteradoresAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if not cbIntegra.Checked then
  begin
     CdsAlteradores.FieldByName('CONTABILIZA').AsString := 'S';
     CkbContabiliza.Enabled := True;
  end
  else
  begin
     CdsAlteradores.FieldByName('CONTABILIZA').AsString := 'N';
     CkbContabiliza.Enabled := cbIntegra.Enabled;
  end;
end;

procedure TfrmLancDocCAPCAR.cbEnglobParcClick(Sender: TObject);
begin
  inherited;
  BtnNumApgr.Enabled := not cbEnglobParc.checked;
  GpConta.Enabled := not cbEnglobParc.checked;

  if sbtnInserir.Down then EdtNumAp.text:='';
end;

procedure TfrmLancDocCAPCAR.SelecionaTipoDesembolso;
Const
   //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
   SqlGrupoOrcamen = ' (Select Count(1)'
                   + '    From Tipordxccxconta TCO'
                   + '   Where TCO.CodTiPrecDes = T.CodTiPrecDes '
                   + '     and NOT TCO.IDGRUPOORCAMEN is null) PossuiGrupoOrcamen ' + #13;
   //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

begin
  if (Trim(dblcCentroRespon.Text)<>'') and (ActiveControl.Tag <> 9999) and
     (CdsCentroRespon.FieldByName('ANALITICOSINTET').AsString <> 'A') then
  begin
     MsgDlg('Centro de Responsabilidade tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
     if dblcCentroRespon.CanFocus then dblcCentroRespon.SetFocus;
     exit;
  end;

  _CRespom:= CdsCentroRespon.FieldByName('CODCENTRORESPON').asstrIng;

  dblcTipoRD.Enabled := True;
  CboSubDespesa.enabled := CdsAux.FieldByName('FLGINTEGRAORC').Asstring = 'S';   //Marcio Sanches Spinosa xxxx  

  if ParamIntegra.RecPag = 'P' then
  begin
    SqlTipoRD.Sql.Clear;
    SqlTipoRD.Sql.Add(
    //SIG82262 - Inicio
//                        'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
//                        'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, '+#13+
//                        'T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST, T.FLGFINANCHABITACIONAL,'+#13+
//                        SqlGrupoOrcamen + //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
//                        ', T.FLGMAODEOBRA ' + //Cássio Rovaroto - SIG nº 23656.57673
    //SIG82262 - Fim
                        'FROM TIPORECEBDESEMB T, FORNXDESEMB F ' + #13 +
                        ' WHERE (T.ANASINT = ''A'') and ' +
                        '       (T.RECPAG        = '''+ParamIntegra.RecPag+''') and  ' +
                        '       (T.IDPESSOA      = '+InttoStr(Sistema.idempresa)+ ') and ' +
                        '       (F.IDPESSOA      = '+IntToStr(CmpForCli.ForCliReg.Id) + ') and ' +
                        '       (F.RECPAG        = T.RECPAG) and  ' +
                        '       (F.IDEMPRESAPROP = T.IDPESSOA) and ' +
                        '       (T.ATIVO <> ''N'') and ' +

                        '       (F.CODTIPRECDES  = T.CODTIPRECDES) ');

    if not CdsCentroRespon.IsEmpty then
      SqlTipoRD.Sql.Add( ' and  ((T.CODTIPRECDES IN ' +
                         '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                         '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                         '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                         '            (RECPAG = T.RECPAG))) OR ' +
                         //'             not EXISTS (SELECT * ' +//SIG82262
                         '             NOT EXISTS (SELECT 1' +   //SIG82262
                         '                         FROM TRDXCRESPON ' +
                         '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                         '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');

    SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');

    //SIG82262 -Inicio
    SqlTipoRD.Sql.Text:= SqlGrupoSubQuerySomatorio(SqlTipoRD.Sql.Text,
                                                   'DISTINCT T.RECPAG, T.DESCRICAO, T.CODTIPRECDES,  T.IDPESSOA, T.PLANO, T.PLACONTA, '+
                                                   'T.IDUSUARIOINCLUSAO, T.ANASINT, T.PLACONTACREDITO, '+
                                                   'T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST, T.FLGFINANCHABITACIONAL,'+
                                                   'T.FLGMAODEOBRA ',
                                                   '|T.|');
    //SIG82262 -Fim
    SqlTipoRD.Open;

    if CdsTipoRD.IsEmpty then
    begin
        SqlTipoRD.Sql.Clear;
        SqlTipoRD.Sql.Add(
        //SIG82262 - Inicio
//                           'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +#13+
//                           'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, '+#13+
//                           'T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST, T.FLGFINANCHABITACIONAL, '+#13+
//                           SqlGrupoOrcamen + //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
//                           ', T.FLGMAODEOBRA ' + //Cássio Rovaroto - SIG nº 23656.57673
        //SIG82262 - Fim
                           'FROM TIPORECEBDESEMB T, RAMOXDESEMB R ' +#13+
                           ' WHERE (T.ANASINT = ''A'') and ' +#13+
                           '       (T.RECPAG           = '''+ParamIntegra.RecPag+''') and  ' +#13+
                           '       (T.IDPESSOA         = ' + InttoStr(Sistema.idempresa) + ') and ' +#13+
                           '       (R.IDRAMOFORNECEDOR IN (SELECT IDRAMOFORNECEDOR FROM FORNXRAMO WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) + ')) and ' +#13+
                           '       (R.RECPAG           = T.RECPAG)   and ' +#13+
                           '       (R.IDPESSOA         = T.IDPESSOA) and ' +#13+
                           '       (T.ATIVO <> ''N'') and ' +#13+
                           '       (R.CODTIPRECDES     = T.CODTIPRECDES) ');
        if not CdsCentroRespon.IsEmpty then
           SqlTipoRD.Sql.Add( '     and  ((T.CODTIPRECDES IN ' +#13+
                              '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +#13+
                              '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +#13+
                              '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +#13+
                              '            (RECPAG = T.RECPAG))) OR ' +#13+
                              //'             not EXISTS (SELECT * ' +#13+  //SIG82262
                              '             NOT EXISTS (SELECT 1 ' +#13+    //SIG82262
                              '                         FROM TRDXCRESPON ' +#13+
                              '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +#13+
                              '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');

        SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');


        //SIG82262 -Inicio
         SqlTipoRD.Sql.Text:= SqlGrupoSubQuerySomatorio(SqlTipoRD.Sql.Text,
                                                         'DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                                                         'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, '+
                                                         'T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST, T.FLGFINANCHABITACIONAL, '+
                                                         'T.FLGMAODEOBRA ',
                                                         '|T.|');
        //SIG82262 -Fim
        SqlTipoRD.Open;

        if CdsTipoRD.IsEmpty then
        begin
          SqlTipoRD.Sql.Clear;
          //SIG82262 -Inicio
          SqlTipoRD.Sql.Add(
//          'SELECT T.CODTIPRECDES, T.RECPAG, T.PLACONTACREDITO, T.PLANO, T.PLACONTA,'+#13+
//                            'T.DESCRICAO, T.ANASINT, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST,' +#13+
//                            'T.FLGFINANCHABITACIONAL,'+#13+
//                            SqlGrupoOrcamen + //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
//                            'T.FLGMAODEOBRA ' + //Cássio Rovaroto - SIG nº 23656.57673
          //SIG82262 -Fim
                             'FROM TIPORECEBDESEMB T WHERE (ANASINT = ''A'') and (RECPAG = ''' + ParamIntegra.RecPag +
                             ''') and (IDPESSOA = '+InttoStr(Sistema.idempresa) + ') ' +
                             ' and  (T.ATIVO <> ''N'')  ' );
          if not CdsCentroRespon.IsEmpty then
            SqlTipoRD.Sql.Add('  and ((T.CODTIPRECDES IN ' +
                              '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                              '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                              '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                              '            (RECPAG = T.RECPAG))) OR ' +
                              //'             not EXISTS (SELECT * ' + //SIG82262
                              '             NOT EXISTS (SELECT 1 ' +   //SIG82262
                              '                         FROM TRDXCRESPON ' +
                              '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                              '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');
          SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');

          //SIG82262
          SqlTipoRD.Sql.Text:= SqlGrupoSubQuerySomatorio(SqlTipoRD.Sql.Text,
                                                         'T.RECPAG, T.DESCRICAO, T.CODTIPRECDES, T.PLACONTACREDITO, T.PLANO, T.PLACONTA,'+
                                                         'T.ANASINT, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST,'+
                                                         'T.FLGFINANCHABITACIONAL,'+
                                                         'T.FLGMAODEOBRA',
                                                         '|T.|');
          //SIG82262
          SqlTipoRD.Open;
        end;
      end
      else
      begin
         if CdsDet.State in [ DsEdit, DsInsert ] then
         begin
           dblcTipoRD.LookupValue := CdsTipoRD.FieldByName('CODTIPRECDES').AsString;
           dblcTipoRD.Text := CdsTipoRD.FieldByName('DESCRICAO').AsString;
         end;
      end;
  end
  else { Contas a Receber }
  begin
    SqlTipoRD.Sql.Clear;
    SqlTipoRD.Sql.Add('SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +#13+
                      'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA,'+#13+
                      'T.FLGCALCULAIMPOSTO, T.HITCODHIST,T.FLGFINANCHABITACIONAL,' +
                      SqlGrupoOrcamen + //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                      ', T.FLGMAODEOBRA ' + //Cássio Rovaroto - SIG nº 23656.57673
                      ' FROM TIPORECEBDESEMB T, CLIXRECEB F ' + #13+
                      ' WHERE (T.ANASINT = ''A'') and ' +
                      '       (T.RECPAG        = '''+ParamIntegra.RecPag+''') and  ' +
                      '       (T.IDPESSOA      = '+InttoStr(Sistema.idempresa)+ ') and ' +
                      '       (F.IDPESSOA      = '+IntToStr(CmpForCli.ForCliReg.Id) + ') and ' +
                      '       (F.RECPAG        = T.RECPAG) and  ' +
                      '       (F.IDEMPRESA     = T.IDPESSOA) and ' +
                      '       (T.ATIVO <> ''N'') and ' +

                      '       (F.CODTIPRECDES  = T.CODTIPRECDES)  ');

    if not CdsCentroRespon.IsEmpty then
      SqlTipoRD.Sql.Add('  and     ((T.CODTIPRECDES IN ' +
                        '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                        '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                        '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                        '            (RECPAG = T.RECPAG))) OR ' +
                        '             not EXISTS (SELECT * ' +
                        '                         FROM TRDXCRESPON ' +
                        '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                        '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');


    SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');
    SqlTipoRD.Open;

    if CdsTipoRD.IsEmpty then
    begin
        SqlTipoRD.Sql.Clear;

        if Sistema.TipoEmpresa = 'P' then
        begin
           SqlTipoRD.Sql.Add('SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +#13+
                             'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA,'+#13+
                             'T.FLGCALCULAIMPOSTO, T.HITCODHIST, T.FLGFINANCHABITACIONAL,'+#13+
                             SqlGrupoOrcamen + //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                             ', T.FLGMAODEOBRA ' + //Cássio Rovaroto - SIG nº 23656.57673
                             ' FROM TIPORECEBDESEMB T, TIPOCLIXRECEB TR ' + #13+
                             ' WHERE (T.ANASINT = ''A'') and ' +
                             '       (T.RECPAG           = '''+ParamIntegra.RecPag+''') and  ' +
                             '       (T.IDPESSOA         = ' + InttoStr(Sistema.idempresa) + ') and ' +
                             '       (TR.IDTIPOCLIENTE IN (SELECT IDTIPOCLIENTE FROM CLIXTIPOCLI WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) + ')) and ' +
                             '       (TR.RECPAG           = T.RECPAG)   and ' +
                             '       (TR.IDPESSOA         = T.IDPESSOA) and ' +
                             '       (T.ATIVO <> ''N'') and ' +

                             '       (TR.CODTIPRECDES     = T.CODTIPRECDES) ');

           if not CdsCentroRespon.IsEmpty then
             SqlTipoRD.Sql.Add('   and  ((T.CODTIPRECDES IN ' +
                               '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                               '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                               '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                               '            (RECPAG = T.RECPAG))) OR ' +
                               '             not EXISTS (SELECT * ' +
                               '                         FROM TRDXCRESPON ' +
                               '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                               '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');

           SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');
           if CdsTipoRD.IsEmpty then
           begin
             SqlTipoRD.Sql.Clear;
             SqlTipoRD.Sql.Add('SELECT T.CODTIPRECDES, T.RECPAG, T.PLACONTACREDITO, T.PLANO,'+#13+
                               'T.PLACONTA, T.DESCRICAO, T.ANASINT, T.FLGOBRIGARESERVA,'+#13+
                               'T.FLGCALCULAIMPOSTO, T.HITCODHIST, T.FLGFINANCHABITACIONAL,' +#13+
                               SqlGrupoOrcamen + //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                               ', T.FLGMAODEOBRA ' + //Cássio Rovaroto - SIG nº 23656.57673
                               'FROM TIPORECEBDESEMB T WHERE (ANASINT = ''A'') and (RECPAG = ''' + ParamIntegra.RecPag +
                               ''') and (IDPESSOA = '+InttoStr(Sistema.idempresa) + ') ' +
                               ' and  (T.ATIVO <> ''N'')  ' );


             if not CdsCentroRespon.IsEmpty then
               SqlTipoRD.Sql.Add('    and   ((T.CODTIPRECDES IN ' +
                                 '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                                 '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                                 '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                                 '            (RECPAG = T.RECPAG))) OR ' +
                                 '             not EXISTS (SELECT * '+
                                 '                         FROM TRDXCRESPON ' +
                                 '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                                 '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');

              SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');
              SqlTipoRD.Open;
           end;
        end
        else
         begin
           SqlTipoRD.Sql.Clear;
           SqlTipoRD.Sql.Add('SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                             'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO,'+#13+
                             'T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST, T.FLGFINANCHABITACIONAL, ' +
                             SqlGrupoOrcamen + //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                             ', T.FLGMAODEOBRA ' + //Cássio Rovaroto - SIG nº 23656.57673
                             ' FROM ' +#13+
                             ' TIPORECEBDESEMB T, TIPOCLIXRECEB TR ' +
                             ' WHERE (T.ANASINT = ''A'') and ' +
                             '       (T.RECPAG           = '''+ParamIntegra.RecPag+''') and  ' +
                             '       (T.IDPESSOA         = ' + InttoStr(Sistema.idempresa) + ') and ' +
                             '       (TR.IDTIPOCLIENTE IN (SELECT IDTIPOCLIENTE FROM CLIENTEPESS WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) + ')) and ' +
                             '       (TR.RECPAG           = T.RECPAG)   and ' +
                             '       (T.ATIVO <> ''N'') and ' +

                             '       (TR.IDPESSOA         = T.IDPESSOA) and ' +
                             '       (TR.CODTIPRECDES     = T.CODTIPRECDES)  ');

           if not CdsCentroRespon.IsEmpty then
             SqlTipoRD.Sql.Add('   and  ((T.CODTIPRECDES IN ' +
                               '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                               '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                               '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                               '            (RECPAG = T.RECPAG))) OR ' +
                               '             not EXISTS (SELECT * ' +
                               '                         FROM TRDXCRESPON ' +
                               '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                               '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');

           SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');
           SqlTipoRD.Open;

           if CdsTipoRD.IsEmpty then
           begin
            SqlTipoRD.Sql.Clear;
            SqlTipoRD.Sql.Add('SELECT T.CODTIPRECDES, T.RECPAG, T.PLACONTACREDITO, T.PLANO, T.PLACONTA, T.DESCRICAO,'+#13+
                              'T.ANASINT, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST, T.FLGFINANCHABITACIONAL, ' +#13+
                              SqlGrupoOrcamen + //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                              ', T.FLGMAODEOBRA ' + //Cássio Rovaroto - SIG nº 23656.57673
                              'FROM TIPORECEBDESEMB T WHERE (ANASINT = ''A'') and (RECPAG = ''' + ParamIntegra.RecPag +
                              ''') and (IDPESSOA = '+InttoStr(Sistema.idempresa) + ') ' +
                              ' and  (T.ATIVO <> ''N'')  ' );


            if not CdsCentroRespon.IsEmpty then
               SqlTipoRD.Sql.Add('    and ((T.CODTIPRECDES IN ' +
                                 '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                                 '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                                 '            (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
                                 '            (RECPAG = T.RECPAG))) OR ' +
                                 '             not EXISTS (SELECT * ' +
                                 '                         FROM TRDXCRESPON ' +
                                 '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
                                 '                               (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))');
            SqlTipoRD.Sql.Add(' ORDER BY T.RECPAG, T.DESCRICAO');
            SqlTipoRD.Open;
           end;
         end;
      end
      else
      begin
         if CdsDet.State in [ DsEdit, DsInsert ] then
         begin
           dblcTipoRD.LookupValue := CdsTipoRD.FieldByName('CODTIPRECDES').AsString;
           dblcTipoRD.Text := CdsTipoRD.FieldByName('DESCRICAO').AsString;
         end;
      end;
  end;
end;


procedure TfrmLancDocCAPCAR.dblcCentroResponCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if not CdsCentroRespon.IsEmpty then SelecionaTipoDesembolso;
end;




procedure TfrmLancDocCAPCAR.SelDocs(iCodDocumento: Integer);
   procedure ExibeStatusDoc;
   begin
     try
       BtnStatus.ImageIndex := -1;

       if Cds.FieldByName('ESTORNO').AsInteger <> 0 then
       begin
           BtnStatus.Caption    := 'Doc. Estornado\Cancelado';
           BtnStatus.ImageIndex := 2;
       end
       else
       begin
          if ( _OperacaoLanc <> opldAdiantamento ) and
             ( Trim(Cds.FieldByName('STATUS').AsString) = '2' ) then
          begin
            if Cds.FieldByName('NUMFATURA').AsInteger <> 0 then
            begin
              BtnStatus.Caption    := 'Documento Englobado\Parcelado ';
              BtnStatus.ImageIndex := 3
            end
            else
            begin
              BtnStatus.Caption    := 'Documento Baixado ';
              BtnStatus.ImageIndex := 1
            end;
          end
          else
          begin
            _oDocumento.Saldo.CalculaSaldo(Cds.FieldByName('CODDOCUMENTO').AsInteger);

            if ( _OperacaoLanc = opldAdiantamento ) then
            begin
              if ( Cds.FieldByName('OPERACAO').AsString = '14' ) then
                BtnStatus.Caption  := 'Adiantamento Em Aberto '
              else
                if ( Cds.FieldByName('OPERACAO').AsString = '15' ) then
                begin
                   if IsFloatZero(_oDocumento.Saldo.Valor) then
                      BtnStatus.Caption  := 'Adiantamento Regularizado '
                   else
                      if FloatsEqual(Abs(_oDocumento.Saldo.Valor), Cds.FieldByName('VALOR').AsFloat) then
                          BtnStatus.Caption  := 'Adiantamento Baixado '
                      else
                          BtnStatus.Caption  := 'Adiantamento Parcialmente Regularizado ' + (#13+#10) + 'Saldo: '+ FormatFloat('#,##0.00', Abs( _oDocumento.Saldo.Valor ) );
                end
                else
                  BtnStatus.Caption  := 'Adiantamento Em Aberto '
            end
            else
              if IsFloatZero(_oDocumento.Saldo.Valor) then
                BtnStatus.Caption    := 'Documento Em Aberto '
              else
                BtnStatus.Caption    := 'Documento Em Aberto '  + (#13+#10) + 'Saldo: '+ FormatFloat('#,##0.00', _oDocumento.Saldo.Valor );

            BtnStatus.ImageIndex := 0
          end;
       end;
     except
         MsgDlg('Erro ao associar imagens','Erro',mtError,[mbOk],0);
     end;
   end;
begin
   SqlDoc.Prepare;
   SqlDoc.ParambyName('CODDOCUMENTO').AsInteger := iCodDocumento;
   SqlDoc.Open;

   SqlDocPai.Prepare;
   SqlDocPai.ParamByName('CODDocumento').asInteger := iCodDocumento;
   SqlDocPai.Open;

   sDataLanc := Cds.fieldByName('DATALANCTO').asString; // André Tavares - pendência 18937 - 25/04/2005

   // andre tavares pendencia 19942 - 26/08/2005
   if RdFicha.checked then
     cds.FieldByName('NUMDIGCODBARRAS').EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; '
   else
     cds.FieldByName('NUMDIGCODBARRAS').EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; ';

   SQLDet.Prepare;
   SQLDet.ParambyName('CODDOCUMENTO').AsInteger := iCodDocumento;
   SQLDet.Open;

//inicio - André Tavares - pendência 16975 - 28/06/2004 - esconde o campo de compromisso orcamentario se estiver co contas a receber
   dbgrdDet.Fields[6].Visible := sistema.IdModulo <> 4;
//fim - André Tavares - pendência 16975 - 28/06/2004


   SQLLancamento.Prepare;
   SQLLancamento.ParambyName('CODDOCUMENTO').AsInteger := iCodDocumento;
   SQLLancamento.Open;

   SqlContab.Prepare;
   SqlContab.ParambyName('PLNCODIGO').AsInteger := CdsLancamento.FieldByName('PLNCODIGO').AsInteger;
   SqlContab.ParamByName('PLNANTECIPA').AsFloat := CdsLancamento.FieldByName('PLNANTECIPA').AsInteger;
   SqlContab.Open;

   SQLAlteradores.Prepare;
   SQLAlteradores.ParambyName('CODDOCUMENTO').AsInteger := iCodDocumento;
   SQLAlteradores.Open;

   // 14/01/04 Alex 15862 Múltiplas contas de baixa
   sqlCCBaixasXDocum.Prepare;
   sqlCCBaixasXDocum.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;
   sqlCCBaixasXDocum.Open;

   //luis WO14157-14159 : inicio
   if CdsCCBaixasXDocum.IsEmpty then
   begin
     if tbcDetalhe.Tabs.Count >= 10 then
     begin
       if tbcDetalhe.Tabs.Strings[9] = 'Contas Baixa' then
         if pgctrlDetalhe.ActivePageIndex = 9 then begin
         // se excluir a página com o foco nela, ela fica perdida
           pgctrlDetalhe.ActivePageIndex := 0;
           tbcDetalhe.TabIndex := 0;
         end;
         tbcDetalhe.Tabs.Delete(9);
     end;
   end
   else
   begin
   	if tbcDetalhe.Tabs.Count >= 10 then
    begin
    	if tbcDetalhe.Tabs.Strings[9] <> 'Contas Baixa' then begin
      	tbcDetalhe.Tabs.Insert(9, 'Contas Baixa');
      end;
    end
    else
    begin
    	tbcDetalhe.Tabs.Insert(9, 'Contas Baixa');
    end;
   end;
   //luis WO14157-14159 : fim
   // 14/01/04 Alex 15862 Múltiplas contas de baixa

   //Cássio Rovaroto - SIG nº 23656.57673 - Início
   if ParamIntegra.recPag =  'R' then
   begin
     //luis WO14157-14159 : inicio
     if tbcDetalhe.Tabs.Count >= 9 then
     begin
   			if tbcDetalhe.Tabs.Strings[8] = 'Informações Judiciais' then
    		begin
    			if pgctrlDetalhe.ActivePageIndex = 8 then
      		begin
          	pgctrlDetalhe.ActivePageIndex := 0;
        		tbcDetalhe.TabIndex := 0;
      		end;
   //   		tbcDetalhe.Tabs.Delete(9);
        end;
     end;
     //luis WO14157-14159 : fim
   end;
   //Cássio Rovaroto - SIG nº 23656.57673 - Início

   // início - andre tavares - pendência ???? - 07/05/2005
   cdsRAD.Close;
   sqlRad.Prepare;
   sqlRad.paramByName('IDPROCESSO').asInteger := cds.FieldByName('IDPROCESSO').asInteger;
   sqlRad.Open;
   // fim - andre tavares - pendência ???? - 07/05/2005
   ExibeStatusDoc;

   _oldNumLeitCodBarras := Cds.FieldByName('NumLeitCodBarras').AsString; // Alterado por FHBS - 28/02/2019 - SIG81972
end;




procedure TfrmLancDocCAPCAR.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if DbeNoDocumento.Visible then
     Cds.FieldByName('NUMFATURA_1').EditMask :=  ParamIntegra.MascaraNoDocum + ';1; ';

  //amf 19.04.2007 22592 - dispara apenas para o cds relacionado ao SqlDoc.
  if (DataSet.tag = 1) then
  begin
     //amf 25.05.2007 - acerto da máscara de entrada.
     TFloatField(DataSet.FieldByName('QTDECOTAS')).DisplayFormat := '#,##0.000000';
     TFloatField(DataSet.FieldByName('QTDECOTAS')).EditFormat    := '###0.000000';
  end;

end;




procedure TfrmLancDocCAPCAR.CdsDetAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(CdsDet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  TFloatField(CdsDet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';

  if ParamIntegra.RecPag = 'R' then
  begin
     CdsDet.FieldByName('DESCRICAO').DisplayLabel := 'Recebimento';
     CdsDet.FieldByName('NOME').DisplayLabel      := 'Projeto';
  end
  else
  begin
     CdsDet.FieldByName('DESCRICAO').DisplayLabel := 'Desembolso';
     CdsDet.FieldByName('NOME').DisplayLabel      := 'Atividade';
  end;

end;




procedure TfrmLancDocCAPCAR.CdsUnidNegocAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('UNECODIGO').EditMask := ParamIntegra.MascaraUnidNegoc + ';0;_';
end;




procedure TfrmLancDocCAPCAR.CdsTipoRDAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if ParamIntegra.RecPag = 'P' then
     DataSet.Fields[0].EditMask := ParamIntegra.MascaraDesemb + ';0;_'
  else
     DataSet.Fields[0].EditMask := ParamIntegra.MascaraReceb + ';0;_';
end;




procedure TfrmLancDocCAPCAR.CdsDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CdsDet.FieldByName( 'VALOR'      ).AsFloat    := _ValorEdit;
  CdsDet.FieldByName( 'RECPAG'     ).AsString   := ParamIntegra.RecPag;
  CdsDet.FieldByName( 'IDPESSOA'   ).AsFloat    := Sistema.IdEmpresa;

  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  CdsDet.FieldByName( 'IDFORCLI'   ).AsInteger  := Cds.FieldByName( 'IDFORCLI'   ).AsInteger;
  CdsDet.FieldByName( 'DATAVENCTO' ).AsDateTime := Cds.FieldByName( 'DATAVENCTO' ).AsDateTime;
  SetRATEIO_ORCAMENTO;
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
end;

procedure TfrmLancDocCAPCAR.CdsLancamentoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  TFloatField(DataSet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';
end;




procedure TfrmLancDocCAPCAR.CdsContabAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('LACVALOR')).DisplayFormat := '#,##0.00';
end;




procedure TfrmLancDocCAPCAR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(_cdsAux); // tavares - pendência 17279
//início - André Tavares - pendência 15367 - 20/05/2004
  FreeAndNil(CtrlCentRespon);
//fim - André Tavares - pendência 15367 - 20/05/2004

  //FreeAndNil(CtrlIntBanco); // Andre Imakawa - SIG20321

  FreeAndNil(_LancDocCapCar);
  FreeAndNil(_oPeriodo);
  FreeAndNil(_oDocumento);

  // 23/01/04 Alex 14451 - Nova Segregação
  FreeAndNil(CtrlParamCap); // Bruno esqueceu
  FreeAndNil(CtrlSegregacao);
  // fim 23/01/04 Alex 14451 - Nova Segregação

  // 01/04/2004 Marchetti Pendencia 15733 e 15734
  FreeAndNil(CtrlPlanPrevContabPatro);

  //andre tavares
  FreeAndNil(CtrlParamGlobal);

  // Marcio Motta - 17317 - 20/04/2005
  FreeAndNil(CtrlModeloHistorico);

  FreeAndNil(CtrlTipoAlterador);

  //amf 01.03.2007 24450
  FreeAndNil(CtrlPortadorConta);
  FreeAndNil(CtrlPortadorForma);

  //amf 12.04.2007
  FreeAndNil(ctrlTipoRecebDesemb);

  FreeAndNil(CtrlIntegraOrcFDO);        //edilaine SIG115594

  //amf 31.05.2007
  FreeAndNil(CtrlPessoaForne);
  FreeAndNil(CtrlFormaRecPag);

  inherited;
end;

procedure TfrmLancDocCAPCAR.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  //higor Nayde Ferreira SOL 188852 KTN 1784376
  if (flgServicoExec) then begin
      if CtrlAvaliacaoFornec.FornecPassivo(Cds.FieldByName('IDFORCLI').AsInteger) then
        FazerAvaliacao;
  end;
//fim - Higor
  inherited;

  // 22/01/04 alex 14451 - chamar as restrições da segregação virtual
  // as mensagens já são dadas no tratamento
  Accept := VerificaPreenchimentoSegregaMestre;

  //Cássio Rovaroto - SIG nº 23656.57673 - Início
  if (Sistema.IdModulo = 3)  then
   Accept := VerificaLanctoCPRB;

   if not Accept then Exit;
  //Cássio Rovaroto - SIG nº 23656.57673 - Fim

  //Cássio Rovaroto - SIG nº 123523 - Início
  {Registro de tributação será lançamento apenas no Contas a Pagar }
  //if Sistema.IdModulo = 3 then
  //  Accept := LancamentoAlteradoresTributacao(_IdServico);
  //Cássio Rovaroto - SIG nº 123523 - Fim

  // edilaine - SOL 222006-17039 / PPM 712379 - incio
  {efetua validações para campo Nosso Número apenas no Contas a Receber}
  if Sistema.IdModulo = 4 then
     Accept := VerificaNossoNumero();
  // edilaine - SOL 222006-17039 / PPM 712379 - fim

  if not Accept then Exit;

  (* Gustavo 03/04/2003 - Inicio *)
  {Accept := _LancDocCapCar.ProcessaDocumento(Sistema.IdUsuario, Sistema.IdEspAcesso,
  ParamIntegra.uNidNegoc, (not cbIntegra.Checked), Sistema.UsaPlanoPatro,
  (Cds.fieldByName('DATALANCTO').asString <> sDataLanc), // andre tavares pendência 18937
  cbEnglobParc.Checked, cbLancaBaixa.Checked, ( CdsPortForma.FieldByName('LANCAFINANC').AsString = 'S' ),
  GpDotorc.Enabled, Cds.Data, CdsAlteradores.Data, CdsDet.Data, CdsContab.Data,
  DtmCapCarMT.CdsPrevPendente.Data, DtmCapCarMT.CdsAdtoPendente.Data, CdsCCBaixasXDocum.Data,
  opInserir, _OperacaoLanc, ParamIntegra.PartidaDobrada, dbeDataLanc.Date, _oDocumento.DataDisponibilidade,
  (cbLancaBaixa.Checked and  (_OperacaoLanc = opldAdiantamento) and ParamIntegra.IntegraContab), Modulo.SlipAutomatico,
  CdsContab.FieldByName('IDSEGREGACRITER').AsInteger);}
  (* Gustavo 03/04/2003 - Fim *)


  begin
  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    Try
      Accept := _LancDocCapCar.ProcessaDocumento(Sistema.IdUsuario, Sistema.IdEspAcesso,
                ParamIntegra.uNidNegoc, (not cbIntegra.Checked), Sistema.UsaPlanoPatro,
                (Cds.fieldByName('DATALANCTO').asString <> sDataLanc), // andre tavares pendência 18937
                cbEnglobParc.Checked, cbLancaBaixa.Checked, ( CdsPortForma.FieldByName('LANCAFINANC').AsString = 'S' ),
                GpDotorc.Enabled, Cds.Data, CdsAlteradores.Data, CdsDet.Data, CdsContab.Data,
                DtmCapCarMT.CdsPrevPendente.Data, DtmCapCarMT.CdsAdtoPendente.Data, CdsCCBaixasXDocum.Data,
                opInserir, _OperacaoLanc, ParamIntegra.PartidaDobrada, dbeDataLanc.Date, _oDocumento.DataDisponibilidade,
                (cbLancaBaixa.Checked and  (_OperacaoLanc = opldAdiantamento) and ParamIntegra.IntegraContab), Modulo.SlipAutomatico,
                CdsContab.FieldByName('IDSEGREGACRITER').AsInteger);
    Except
      on ErroFDO : EProcessoFDO_GetContaSaldoOrcado do
      Begin
         Accept := False;
         Case ErroFDO.Origem of
           opapDesembolso : ErroFDO.BuscaInfoCodOrigem(CdsTipoRD, 'CODTIPRECDES', 'Descricao');
           opapAlterador  : ErroFDO.BuscaInfoCodOrigem(CdsAlt,    'CODALTERADOR', 'Descricao');
         End;
         _LancDocCapCar.MessageInfo := ErroFDO.Message;
       End;

      On E:Exception do RAISE;
    End;
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  end;

   If Accept Then
      Begin
         If Not DoEnglobarParcelar Then
            //  Início SOL: 136242 Kintana: 813941 - JRM6
            // SOL 189828 KTN 1794500 - Paulo Nobre
            // Se o coddocumento estiver preenchido significa que foi gerado um registro valido.
 //          If trunc(_lancdoccapcar.coddocumento) <> 0 Then
 //           FazChamadaAlteradores;
         //  Término SOL: 136242 Kintana: 813941 - JRM6

            _LancDocCapCar.ImprimeEspelhoDoc(_LancDocCapCar.CodDocumento, Modulo.IdReports, Modulo.NomeReport, _OperacaoLanc);

         //Iferreira 22/02/2008 - 27432
         EmptyDataSet(Cds);
      End
  else
  begin
    //DAVID - Retenção de Imposto
    if trim( _LancDocCapCar.MessageInfo ) <> '' then
      MsgDlg(_LancDocCapCar.MessageInfo, 'Atenção', mtError, [ MbOk ], 0)
  end;

end;

class procedure TfrmLancDocCAPCAR.AbrirForm(OperacaoLanc: TOperacaoLancDocCapCar);
begin
  if ExisteForm(FrmLancDocCapCar) then
     MsgDlg('A tela de ' + FrmLancDocCapCar.Caption + ' está aberta, para acessar outra opção é obrigatório sair da operação atual.', 'Atenção', mtInformation, [ MbOk ], 0)
  else
  begin
     _OperacaoLanc := OperacaoLanc;
     uFormManager.AbrirForm(FrmLancDocCapCar, TFrmLancDocCapCar, false);
  end;
end;

procedure TfrmLancDocCAPCAR.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
var
	cdsAux : TClientDataSet;
  dValAliqCPRB : Double;
begin
  //higor Nayde Ferreira SOL 188852 KTN 1784376
   if (flgServicoExec) then begin
      if CtrlAvaliacaoFornec.FornecPassivo(Cds.FieldByName('IDFORCLI').AsInteger) then
        FazerAvaliacao;
   end;
//fim - Higor
  inherited;
  
  // 22/01/04 alex 14451 - chamar as restrições da segregação virtual
  // as mensagens já são dadas no tratamento
  Accept := VerificaPreenchimentoSegregaMestre;

    // Rodolpho da Silva - 21/06/2006
  if CtrlTipoAlterador.ExisteLancIRRF(Cds.FieldByName('CODDOCUMENTO').AsInteger) then
  begin
     MsgDlg('Este documento não pode ser alterado ou excluído, pois há um documento de imposto do INSS lançado relacionado a este.','Aviso',mtWarning,[mbOk],0);
     Accept := False;
     Exit;
  end;


  // edilaine - SOL 222006-17039 / PPM 712379 - incio
  {efetua validações para campo Nosso Número apenas no Contas a Receber}
  if Sistema.IdModulo = 4 then
     Accept := VerificaNossoNumero();
  // edilaine - SOL 222006-17039 / PPM 712379 - fim

  if not Accept then Exit;      // edilaine - SOL 222006-17039 / PPM 712379 - inserido mais abaixo

  //William Santana SOL 199983 KIN 1967697
   {
  (* Gustavo 03/04/2003 - Inicio *)
  Accept := _LancDocCapCar.ProcessaDocumento(Sistema.IdUsuario, Sistema.IdEspAcesso,
  ParamIntegra.uNidNegoc, (not cbIntegra.Checked), Sistema.UsaPlanoPatro,
  (Cds.fieldByName('DATALANCTO').asString <> sDataLanc), // andre tavares pendência 18937
  cbEnglobParc.Checked, cbLancaBaixa.Checked, ( CdsPortForma.FieldByName('LANCAFINANC').AsString = 'S' ),
  GpDotorc.Enabled, Cds.Data, CdsAlteradores.Data, CdsDet.Data, CdsContab.Data,
  DtmCapCarMT.CdsPrevPendente.Data, DtmCapCarMT.CdsAdtoPendente.Data, CdsCCBaixasXDocum.Data,
  opAlterar, _OperacaoLanc, ParamIntegra.PartidaDobrada, dbeDataLanc.Date, _oDocumento.DataDisponibilidade,
  (cbLancaBaixa.Checked and  (_OperacaoLanc = opldAdiantamento) and ParamIntegra.IntegraContab), Modulo.SlipAutomatico,
  CdsContab.FieldByName('IDSEGREGACRITER').AsInteger);
  (* Gustavo 03/04/2003 - Fim *)
   }
  ////
   Try
      Accept := _LancDocCapCar.ProcessaDocumento(Sistema.IdUsuario, Sistema.IdEspAcesso,
      ParamIntegra.uNidNegoc, (not cbIntegra.Checked), Sistema.UsaPlanoPatro,
      (Cds.fieldByName('DATALANCTO').asString <> sDataLanc), // andre tavares pendência 18937
      cbEnglobParc.Checked, cbLancaBaixa.Checked, ( CdsPortForma.FieldByName('LANCAFINANC').AsString = 'S' ),
      GpDotorc.Enabled, Cds.Data, CdsAlteradores.Data, CdsDet.Data, CdsContab.Data,
      DtmCapCarMT.CdsPrevPendente.Data, DtmCapCarMT.CdsAdtoPendente.Data, CdsCCBaixasXDocum.Data,
      opAlterar, _OperacaoLanc, ParamIntegra.PartidaDobrada, dbeDataLanc.Date, _oDocumento.DataDisponibilidade,
      (cbLancaBaixa.Checked and  (_OperacaoLanc = opldAdiantamento) and ParamIntegra.IntegraContab), Modulo.SlipAutomatico,
      CdsContab.FieldByName('IDSEGREGACRITER').AsInteger);

    Except
      on ErroFDO : EProcessoFDO_GetContaSaldoOrcado do
      Begin
         Accept := False;
         Case ErroFDO.Origem of
           opapDesembolso : ErroFDO.BuscaInfoCodOrigem(CdsTipoRD, 'CODTIPRECDES', 'Descricao');
           opapAlterador  : ErroFDO.BuscaInfoCodOrigem(CdsAlt,    'CODALTERADOR', 'Descricao');
         End;
         _LancDocCapCar.MessageInfo := ErroFDO.Message;
       End;

      On E:Exception do RAISE;
   End;

   //END - William Santana SOL 199983 KIN 1967697

  if ( not (Cds.State in [DsEdit, DsInsert]) ) then Cds.Edit;


  if Accept then
  begin
  	//Cássio Rovaroto - SIG nº 23656.57673 - Início
    if ParamIntegra.RecPag = 'P' then
		begin
      cdsAux := TclientDataSet.Create(nil);
    	try
      	cdsAux.Data := _LancDocCapCar.ListaDadosCPRBFornecedor(cds.FieldByName('IDFORCLI').asInteger);

      	if not(cdsAux.IsEmpty) and ((bDesembolsoServico) and not(bExisteProcSusp))then
      	begin
      		dValAliqCPRB := cdsAux.FieldByName('ALIQCPRB').AsFloat;
      		MsgDlg('Realizar o lançamento da retenção de ' + FloatToStr(dValAliqCPRB) + '% de CPRB da nota fiscal de serviço, ' +
        				 'através de alteradores, se ainda não foi lançado.', 'Atenção', mtInformation, [mbOk],0);
       	end;
  		finally
  			FreeAndNil(cdsAux);
      end;
    end;
    //Cássio Rovaroto - SIG nº 23656.57673 - Fim

   If Not DoEnglobarParcelar Then
            Begin
               // SOL 189828 KTN 1794500 - Paulo Nobre
               // Edilaine - SOL 179108 / KTN 1654527
            //   If trunc(_lancdoccapcar.coddocumento) <> 0 Then
              //    Begin
                     //            SalvaDadosParaAlteradores;
                     //            FazChamadaAlteradores;
                //  End;
               // Edilaine - SOL 179108 / KTN 1654527 - fim

               _LancDocCapCar.ImprimeEspelhoDoc(_LancDocCapCar.CodDocumento, Modulo.IdReports, Modulo.NomeReport, _OperacaoLanc);
            End;
    //DAVID - Retenção de INSS
    CmeCadastro.Cancel( Self );
    SelDocs(_CodLancCAPCAR);
    _CodLancContab := Cds.FieldByName('PLNCODIGO').AsInteger;
    _Modulo := Cds.FieldByName('IDMODULO').AsInteger;
    _ContaCliFor := Cds.FieldByName('PLACONTA').AsString;
    _CCustoCliFor := Cds.FieldByName('CODCENTROCUSTO').AsString;
    cbLancaBaixa.Checked := ((Cds.FieldByName('OPERACAO').AsString = '10') or (Cds.FieldByName('OPERACAO').AsString = '15'));
    cbEnglobParc.Checked := ((Cds.FieldByName('OPERACAO').AsString = '1') or (Cds.FieldByName('OPERACAO').AsString = '11'));
    cbIntegra.Checked := (Cds.FieldByName('PLNCODIGO').AsInteger = 0);
    SetaEnglobaParcela;
    AbrindoTela  := False; //Bruno Bastos - Pend. 14399 e 14400 - 14/08/2003
    sCodCentResp := CdsDet.FieldByName('CODCENTRORESPON').AsString;

    //Marcus Oliveira 23425
    ControlesReadyOnly(False);

    //Iferreira 22/02/2008 - 27432
    EmptyDataSet(Cds);
  end
  else
    //DAVID - Retenção de Imposto
    if trim( _LancDocCapCar.MessageInfo ) <> '' then
      MsgDlg(_LancDocCapCar.MessageInfo, 'Atenção', mtError, [ MbOk ], 0);

   //Marcus Oliveira 23425
   ControlesReadyOnly(False);

//  if Accept then
//    if CtrlAvaliacaoFornec.FornecPassivo(IdForCli) then
//      FazerAvaliacao;
end;




procedure TfrmLancDocCAPCAR.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  (* Gustavo 03/04/2003 - Inicio *)
  Accept := _LancDocCapCar.ProcessaDocumento(Sistema.IdUsuario, Sistema.IdEspAcesso,
  ParamIntegra.uNidNegoc, (not cbIntegra.Checked), Sistema.UsaPlanoPatro,
  (Cds.fieldByName('DATALANCTO').asString <> sDataLanc), // andre tavares pendência 18937
  cbEnglobParc.Checked, cbLancaBaixa.Checked, ( CdsPortForma.FieldByName('LANCAFINANC').AsString = 'S' ),
  GpDotorc.Enabled, Cds.Data, CdsAlteradores.Data, CdsDet.Data, CdsContab.Data,
  DtmCapCarMT.CdsPrevPendente.Data, DtmCapCarMT.CdsAdtoPendente.Data, CdsCCBaixasXDocum.Data,
  opApagar, _OperacaoLanc, ParamIntegra.PartidaDobrada, 0, 0,
  (cbLancaBaixa.Checked and  (_OperacaoLanc = opldAdiantamento) and ParamIntegra.IntegraContab), Modulo.SlipAutomatico,
  (* Gustavo 03/04/2003 - Fim *)

  // Alex 16220 27/04/04 - Para exclusão do documento com lança e baixa simultânea é necessário o número do lote
  -1, CdsLancamento.FieldByName('NUMLOTE').AsInteger);

  if not Accept then MsgDlg(_LancDocCapCar.MessageInfo, 'Atenção', mtError, [ MbOk ], 0);
     EmptyDataSet(CdsDet);
     EmptyDataSet(CdsLancamento);
     EmptyDataSet(CdsContab);
     EmptyDataSet(CdsAlteradores);
     EmptyDataSet(CdsCCBaixasXDocum);
end;




procedure TfrmLancDocCAPCAR.CdsAlteradoresAfterPost(DataSet: TDataSet);
begin
  inherited;
  AtualizaSaldo;
end;

function TfrmLancDocCAPCAR.DoEnglobarParcelar: Boolean;
var
  DadosParcela: TParcelaAutomatica;
begin
    if ( _OperacaoLanc in [ opldEfetivo, opldContratoPrevisao ] ) and
        (cbEnglobParc.Checked) then
    begin
      Result := True;

      if (Application.MessageBox('Deseja Parcelar\Englobar este documento agora ?',
                              'Atenção',
                              Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
      begin
         DadosParcela.CodDocumento := Trunc(_LancDocCapCar.CodDocumento);
         DadosParcela.RazaoSocial := CmpForCli.Text;
         DadosParcela.DataEmissao := dbeDataEmi.Date;
         DadosParcela.DataLancto := dbeDataLanc.Date;
         DadosParcela.FormaDePagamento := StrToIntDef(DblCodForma.LookupValue,0);
         DadosParcela.PortadorForma := StrToIntDef(dblcPortadorForma.LookupValue,0);
         DadosParcela.TipoDeDocumento := StrToIntDef(dblcTipoDoc.LookupValue,0);
         DadosParcela.IdForCli := CmpForCli.ForCliReg.Id;

         if _OperacaoLanc = opldEfetivo then
            TFrmAgrupaParcelaMT.AbrirForm( opfDocumento, DadosParcela )
         else
            TFrmAgrupaParcelaMT.AbrirForm( opfContratoPrev, DadosParcela );
      end;
    end
    else
      Result := false;
end;




procedure TfrmLancDocCAPCAR.CdsDetAfterCancel(DataSet: TDataSet);
begin
  inherited;
  CalculaValorEdit;
end;




procedure TfrmLancDocCAPCAR.CalculaValorEdit;
var
  rValorDet: Double;
begin
  inherited;
  CdsDet.DisableControls;
  Try
    rValorDet := 0;

    CdsDet.First;
    while not CdsDet.Eof Do
    begin
       rValorDet := rValorDet + CdsDet.FieldByName('VALOR').AsFloat;
       CdsDet.Next;
    end;

    _ValorEdit := dbeValorCorrente.Value - rValorDet;
  finally
    CdsDet.EnableControls;
  end;
end;




function TfrmLancDocCAPCAR.ValidaOperacao: Boolean;
begin
  Result := True;

  if ( not CdsLancamento.IsEmpty ) and
     ( tbcDetalhe.TabIndex = 2 ) and
     ( Cds.FieldByName('OPERACAO').AsString <> CdsLancamento.FieldByName('OPERACAO').AsString) then
  begin
     MsgDlg('Esta Contabilização não se refere ao lançamento do documento. Verifique na pasta "Lançamentos".', 'Atenção', mtInformation, [MbOk], 0);
     Result := False;
  end;

  if Result and
     ( CdsAtual <> nil ) and
     ( CdsAtual.State in [DsEdit, DsInsert] ) then Result := False;
end;




procedure TfrmLancDocCAPCAR.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
  TotalRateioOM, TotalRateio, rTotalContab, rValorCliFor, rValorCheckForCli: Real;
  sNomeConta, sObriga, sNome, sSubConta: String;
  bExiste,
  bExisteRetOutros, bExisteContab : Boolean;

  VlOutros, VlINSSDoc : extended;

  //amf 02.03.2007 24450
  cdsLocal: TClientDataSet;

  //amf 16.04.2007 22592
  iExigeCota: integer;
  cdsContaBancoForn: TClientDataSet;
  cdsFormaRecPag: TClientDataSet;

  oFinan    : TCtrlFinanc;
  dOldDataDisp,
  dNewDataDisp : TDateTime;
  bDataOld,
  bDataNew  : Boolean;
begin  //Rodolpho - Marcus 17/01/2007 P. 24201
  if ((tbcDetalhe.TabIndex = 1) and (CdsDet.State = dsInsert)) then
  begin
     bbtnOkDet.Click;
     bbtnVoltarDet.Click;
  end;

  inherited;    //Aqui ele pega o 2º virtual nessa procedure
  Accept := False;

  bExisteContab := false;

  //Cássio Rovaroto - SIG nº 23656.57673
  //bDesembolsoServico := False;  //Cássio Rovaroto - SIG nº 115585

  _oDocumento.CodDocumento := cds.FieldByName('CodDocumento').asFloat; // Andre tavares - pendência 18178 - 02/12/2004
  (* Gustavo 03/04/2003 - Inicio *)

  // Alterado por Arnaldo V. Scarin em 09/09/2009
  // Alteração para validar a data de disponibilidade financeira
  // SOL: 121273 Kintana: 626031
  dOldDataDisp := _DataDisponib;
  If Sistema.IdModulo = 3 then // CAP
    dNewDataDisp := dbeDataProgr.Date;
//  else
//    dNewDataDisp := dbeDataDisponib.Date;


  _oDocumento.DataDisponibilidade := 0;
  (* Gustavo 03/04/2003 - Fim *)

  if ( CmeCadastro.Operacao in [ OpInserir, OpAlterar ] ) then
  begin
    (* Gustavo 03/04/2003 - Inicio - Solicita data para disponibilidade financeira*)
    if _OperacaoLanc = opldEfetivo then
       _oDocumento.DataDisponibilidade := Cds.FieldByName('DATADISPONIB').AsDateTime;
    (* Gustavo 03/04/2003 - Fim *)

    if (Cds.FieldByName('DATADISPONIB').AsDateTime = 0) and
       (ParamIntegra.RecPag = 'P') then //andre tavares - pendência 22788 - 11/07/2006
      _oDocumento.DataDisponibilidade := Cds.FieldByName('DATAPROGRAMADA').AsDateTime;

    if CdsDet.IsEmpty then
    begin
      MsgDlg( 'Informe o rateio para o documento', 'Aviso', mtWarning, [ mbOk ], 0 );
      Repaint;
      Exit;
    end;

    if ( not (Cds.State in [DsEdit, DsInsert]) ) then
      Cds.Edit;

    if ( Cds.FieldByName('NODOCUMENTO').AsFloat < 1 ) then
    begin
      MsgDlg('O Número do documento está inválido', 'Erro', mtError, [ mbOk ], 0 );
      Exit;
    end;

    if ParamIntegra.Integracontab then
    begin
       if ( ParamIntegra.IntegraContab ) and
          ((Cds.FieldByName('IDMODULO').AsInteger = 3) or
           (Cds.FieldByName('IDMODULO').AsInteger = 4)) then begin
           cdsDet.edit; // SOL 229349 Kintana 2063459
           if (CdsAux.FieldByName('FLGINTEGRAORC').Asstring = 'S') then   //MARCIO SANCHES SPINOSA - EDILAINE FERRARESI - 199363/1919425
              _oDocumento.Orcamento.FDO_VALIDA(opapDesembolso, cdsDet, cdsSubDespesaRateio); // // SOL 229349 Kintana 2063459
           cdsDet.post; // SOL 229349 Kintana 2063459
         bExisteContab := _LancDocCapCar.DeterminaContabilizacao((not cbIntegra.Checked),
                                                                 placontas, TClientDataSet(cds),
                                                                 TClientDataSet(cdsCCBaixasXDocum),
                                                                 TClientDataSet(cdsContab),
                                                                 TClientDataSet(cdsDet).data,
                                                                 sistema.idEmpresa, ParamIntegra.plano, cbLancaBaixa.Checked,
                                                                 _OperacaoLanc, dblcTipoDoc.Text,
                                                                 paramintegra.Recpag);
         end;
         if not bExisteContab then
         begin
           accept := false;
           MsgDlg( _LancDocCapCar.MessageInfo, 'Erro Contabilização',mtError,[mbOk],0);
           exit;
         end;
         if (placontas.sPlacontaPass = '') and (cdsCCBaixasXDocum.IsEmpty) and (cbIntegra.Checked) then
         begin
           accept := false;
           MsgDlg( 'A Conta de Baixa do Documento não foi parametrizada!'+#13+
                   'Mesmo que o Documento não seja Contabilizado esta Conta é Obrigatória, pois será utilizada na Baixa do Mesmo.' , 'Erro Contabilização',mtError,[mbOk],0);
           exit;
         end;

         cds.FieldByName('PLANO').asInteger           := placontas.iPlano;
         cds.FieldByName('PLACONTA').asString         := placontas.sPlacontaPass;
         Cds.FieldByName('CODCENTROCUSTO').AsString   := placontas.scodCentroCusto;
         cds.FieldByName('IDSEGREGACRITER').asInteger := placontas.iIdSegregaCriter;
     end;
  end;

  if not verificaCodBarra then  exit;
  // fim andre tavares pendencia 19942 - 26/08/2005 - valida também o códogo de barras da arrecadação

  if (Trim(dblcPortadorForma.Text) = '') then
  begin
     if (cbLancaBaixa.Checked) then
     begin
        MsgDlg('Obrigatório Indicar '+ lblPortadorForma.Caption ,'Erro',mtError,[mbOk],0);
        if dblcPortadorForma.CanFocus then dblcPortadorForma.SetFocus;
        exit;
     end;
  end
  else
    if ( ParamIntegra.RecPag = 'P' ) and
       (not CdsPortForma.FieldByName('CODARQUIVOREMESSA').isNull) and
       (not CdsPortForma.FieldByName('CODFORMAPAGTO').isNull) and
       // Andre Imakawa - SIG20321 - Inicio
       {CtrlIntBanco.ObrigaDadosBancarios(CdsPortForma.FieldByName('CODARQUIVOREMESSA').AsInteger,
                                  CdsPortForma.FieldByName('CODFORMAPAGTO').AsInteger) and}
       ObrigaDadosBancarios(CdsPortForma.FieldByName('CODARQUIVOREMESSA').AsInteger,
                                  CdsPortForma.FieldByName('CODFORMAPAGTO').AsInteger) and
       // Andre Imakawa - SIG20321 - Fim                           
       ((DbEdtBanco.Text = '') or (DbEdtAgencia.Text = '') or (DbEdtConta.Text = '')) then
    begin
        MsgDlg('Esta forma de pagamento obriga a Indicação da conta bancária', 'Aviso', mtInformation, [mbOk], 0);
        Exit;
    end;

  if (CmpForCli.Valida <> VcOk) then  exit;

  if Cds.FieldByName('NODOCUMENTO').IsNull then
  begin
    MsgDlg('Obrigatório preencher o Número do Documento','Erro',mtError,[mbOk],0);
    if dbenNumDoc.CanFocus then
       dbenNumDoc.SetFocus
    else
       if DbeNoDocumento.CanFocus then
         DbeNoDocumento.SetFocus;
    exit;
  end;

  if Modulo.ObrigaFormaPagto and (DblCodForma.Text = '') then
  begin
    MsgDlg('Obrigatório Indicar ' + LblFormaPag.Caption + ' na ''Pasta'' Geral','Erro',mtError,[mbOk],0);
    if DblCodForma.CanFocus then DblCodForma.SetFocus;
    exit;
  end;

  if Trim(dbeDataEmi.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a ' + lblEmissao.Caption,'Erro',mtError,[mbOk],0);
    if dbeDataEmi.CanFocus then dbeDataEmi.SetFocus;
    exit;
  end;

  if Trim(dbeDataLanc.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a ' + lblData.Caption,'Erro',mtError,[mbOk],0);
    if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
    exit;
  end;

  if Trim(dbeDataVenc.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a ' + lblVencimento.Caption,'Erro',mtError,[mbOk],0);
    if dbeDataVenc.CanFocus then dbeDataVenc.SetFocus;
    exit;
  end;

  if Trim(dbeDataProgr.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a ' + lblProgramada.Caption,'Erro',mtError,[mbOk],0);
    if dbeDataProgr.CanFocus then dbeDataProgr.SetFocus;
    exit;
  end;

  if StrToDate(dbeDataVenc.Text) < StrToDate(dbeDataEmi.Text) then
  begin
    MsgDlg('A ' + lblVencimento.Caption + ' não pode ser menor que ' + lblEmissao.Caption,'Erro',mtError,[mbOk],0);
    if dbeDataVenc.CanFocus then dbeDataVenc.SetFocus;
    exit;
  end;

  if StrToDate(dbeDataProgr.Text) < StrToDate(dbeDataLanc.Text)  then
  begin
    MsgDlg('A ' + lblProgramada.Caption + ' não pode ser menor que a ' + lblData.Caption,'Erro',mtError,[mbOk],0);
    if dbeDataProgr.CanFocus then dbeDataProgr.SetFocus;
    exit;
  end;

  //Início - William Santana - SIG 27101
  if not diasuteis.DiaUtil(dbeDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false) then
  begin
    MsgDlg('Data de vencimento não é um dia útil','Erro',mtError,[mbOk],0);
    if dbeDataVenc.CanFocus then dbeDataVenc.SetFocus;
    exit;
  end;

  if not diasuteis.DiaUtil(dbeDataProgr.Date, _IdCidade, _IdPais, _UF, true, false, false) then
  begin
    MsgDlg('Data programada não é um dia útil','Erro',mtError,[mbOk],0);
    if dbeDataProgr.CanFocus then dbeDataProgr.SetFocus;
    exit;
  end;
  //Término - William Santana - SIG 27101

  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange(Sender);

  if ( ParamIntegra.IntegraContab ) and
     (cbIntegra.Checked = False)       and
     ((Cds.FieldByName('IDMODULO').AsInteger = 3) or
     (Cds.FieldByName('IDMODULO').AsInteger = 4)) then
  begin
     if (CmeCadastro.Operacao = OpAlterar) and
        (Cds.FieldByName('DATALANCTO').OldValue <> null) and
        ( Cds.FieldByName('DATALANCTO').Value <> Cds.FieldByName('DATALANCTO').OldValue  ) then
     begin
       _oPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DateToStr( Cds.FieldByName('DATALANCTO').OldValue ));
       if _oPeriodo.TestaPeriodoBloqueado(Sistema.IdEmpresa, tbBloqOuInt, _oPeriodo.Periodo, _oPeriodo.Exercicio, False) then
       begin
          MsgDlg(_oPeriodo.MessageInfo, Caption, mtWarning, [ MbOk ], 0);
          if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
          exit;
       end;
     end;

     _oPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, Cds.FieldByName('DATALANCTO').AsString);
     if _oPeriodo.TestaPeriodoBloqueado(Sistema.IdEmpresa, tbBloqOuInt, _oPeriodo.Periodo, _oPeriodo.Exercicio, False) then
     begin
        MsgDlg(_oPeriodo.MessageInfo, Caption, mtWarning, [ MbOk ], 0);
        if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
        exit;
     end;
  end;

  // Alterado por Arnaldo V. Scarin em 09/09/2009
  // Alteração para validar a data de disponibilidade financeira
  // SOL: 121273 Kintana: 626031
  If Sistema.IdModulo = 3 then
  begin
    if (CmeCadastro.Operacao = OpAlterar) then
    begin
      oFinan := TCtrlFinanc.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, Sistema.UsaPlanoPatro);
      Try
        oFinan.InitializeAs(Padroes);
        bDataOld := oFinan.TestaDispFinanc(Sistema.IdEmpresa,Sistema.IdUsuario,dOldDataDisp);
        bDataNew := oFinan.TestaDispFinanc(Sistema.IdEmpresa,Sistema.IdUsuario,dNewDataDisp);
        If Not bDataOld or Not bDataNew then
        begin
          MsgDlg(oFinan.MessageInfo, Caption, mtWarning, [ MbOk ], 0);
          if dbeDataProgr.CanFocus then
            dbeDataProgr.SetFocus;
          exit;
        end;

      finally
        FreeAndNil(oFinan)
      end;
    end;
  end;

  if (dbeValorMoeda.Value = 0) and (Cds.FieldByName('MOECODIGO').AsInteger <> 0) then
     begin
       MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk],0);
       if dbeValorMoeda.CanFocus then dbeValorMoeda.SetFocus;
       exit;
     end;

  if dbeValorCorrente.Value = 0 then
     begin
       if (MsgDlg('Confirma o lançamento do documento com valor ''0''(Zero)?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrNo) then
       begin
        if dbeValorCorrente.CanFocus then dbeValorCorrente.SetFocus;
        exit;
       end;
     end;

  if Trim(dblcTipoDoc.text) = '' then
     begin
       MsgDlg('Obrigatório preencher o Tipo de Documento','Erro',mtError,[mbOk],0);
       if dblcTipoDoc.CanFocus then dblcTipoDoc.SetFocus;
       exit;
     end;

  if (cbLancaBaixa.Checked) then
  begin
     if Trim(dblcPortadorForma.text) = '' then
     begin

       Cds.FieldByName('CODPORTFORMA').Value := -1;

       if ( ParamIntegra.RecPag = 'R' ) then
          MsgDlg('Obrigatório preencher a Cobrança','Erro',mtError,[mbOk],0)
       else
          MsgDlg('Obrigatório preencher a Forma de Pagamento','Erro',mtError,[mbOk],0);
       if dblcPortadorForma.CanFocus then dblcPortadorForma.SetFocus;
       exit;
     end;

     if Trim(dbenChBordero.text) = '' then
     begin
       if ( ParamIntegra.RecPag = 'R' ) then
          MsgDlg('Obrigatório preencher o Número do Lote de Recebimento','Erro',mtError,[mbOk],0)
       else
          MsgDlg('Obrigatório preencher o Número do Cheque/Borderô','Erro',mtError,[mbOk],0);
       if dbenChBordero.CanFocus then dbenChBordero.SetFocus;
       exit;
     end;

     if ( ParamIntegra.RecPag = 'R' ) then
        Cds.FieldByName('DATACFLOAT').AsDateTime := Cds.FieldByName('DATALANCTO').AsDateTime  +
                                                    CdsPortForma.FieldByName('DMAIS').AsInteger
     else
        Cds.FieldByName('DATACFLOAT').AsDateTime := Cds.FieldByName('DATALANCTO').AsDateTime  -
                                                    CdsPortForma.FieldByName('DMAIS').AsInteger;

     if ( ParamIntegra.IntegraContab ) and (_OperacaoLanc <> opldAdiantamento) then
     begin
        _ContaCliFor := CdsPortForma.FieldByName('PLACONTA').AsString;
        _CCustoCliFor := CdsPortForma.FieldByName('CODCENTROCUSTO').AsString;
     end;
  end;

  TotalRateioOM:=0;
  TotalRateio  := 0;
  CdsDet.First;

  iExigeCota := 0;
  while (not CdsDet.EOF) do
  begin

     TotalRateio   := TotalRateio + CdsDet.FieldByName('VALOR').AsFloat;
     TotalRateioOM := TotalRateioOM + CdsDet.FieldByName('VALOROUTRAMOEDA').AsFloat;

     {amf 01.03.2007 24450 - trava o lançamento se o plano previdenciário selecionado não estiver na lista
                             de planos previdenciários associados a contacorrente ligada ao portador-forma.}
     if (dblcPortadorForma.Text <> '') then
     begin
          if (cds.State in [dsInsert, dsEdit]) then
          begin
             try
               cdsLocal := TClientDataSet.Create(nil);
               cdsLocal.Data := CtrlPortadorForma.ListPortadorforma('',
                                                                    cds.FieldByName('CODPORTFORMA').AsInteger,
                                                                    Sistema.IdEmpresa,
                                                                    );

               if cdsAux.fieldByName('FLGOBRIGAMESMOPP').asString <> 'S' then //andré tavares - pendência 26434
                 if (CtrlPortadorConta.PlanoPrevDifereDaLista(cdsLocal.FieldByName('CODPORTADOR').AsInteger,
                                                              cdsDet.FieldByName('IDPLANOPREV').AsInteger)) then
                 begin
                      MsgDlg('Plano Previdenciário ' + cmbPlano.DisplayValue + ' não encontrado na lista de planos'#13#10'associados a contacorrente para o portador-forma selecionado.'#13#10 + dblcPortadorForma.DisplayValue ,'Erro',mtError,[mbOk],0);
                      Accept := False;
                      exit;
                 end;
                 
             finally
               FreeAndNil(cdsLocal);
             end;
          end;
     end;


     //amf 16.04.2007 22592 - verifica se tipo de desembolso obriga cotas.
     if (ctrlTipoRecebDesemb.TipoDesembObrigaCota(Sistema.IdEmpresa,
                                                  ParamIntegra.RecPag,
                                                  cdsDet.FieldByName('CODTIPRECDES').AsString) ) then
        inc(iExigeCota);


     //amf 19.04.2007 22592
     if (iExigeCota > 1) then
     begin
        MsgDlg('Já existe rateio cujo desembolso obriga quantidade de cotas.'#13#10+
               'Tipo de Desembolso: ' + dblcTipoRD.DisplayValue ,'Erro',mtWarning,[mbOk],0);
        Accept := False;
        exit;
     end;

     CdsDet.Next;
  end;

  if not FloatsEqual(dbeValorCorrente.Value, TotalRateio) then
     begin
       MsgDlg('Total do Rateio não bate com o Valor do Lançamento','Erro',mtError,[mbOk],0);
       _ValorEdit := dbeValorCorrente.Value - TotalRateio;
       exit;
     end;

  if (not IsFloatZero(dbeValorMoeda.Value)) and
     (not FloatsEqual(dbeValorMoeda.Value, TotalRateioOM)) then
     begin
       MsgDlg('Total do Rateio em outra moeda não bate com o Valor do Lançamento em outra moeda','Erro',mtError,[mbOk],0);
       exit;
     end;

  _DataLancto := Cds.FieldByName('DATALANCTO').AsDateTime;
  _CodTipDoc := Cds.FieldByName('CODTIPDOC').AsInteger;

  Cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  Cds.FieldByName('DEBCRE').AsString := CdsTipoDoc.FieldByName('DEBCRE').AsString;
  Cds.FieldByName('NOME').AsString := CmpForCli.ForCliReg.Nome;
  rTotalContab := 0;
  rValorCliFor := 0;

  if Cds.FieldByName('DEBCRE').AsString = 'C' then
     rValorCheckForCli := (dbeValorCorrente.Value * (-1))
  else
     rValorCheckForCli := dbeValorCorrente.Value;

  // Alex 14/04/04 16597
  // se for múltiplas contas de baixa não passar por aqui
  if ( ParamIntegra.IntegraContab ) and
     ( CdsCCBaixasXDocum.IsEmpty ) then
  begin
     sObriga := '';
     sNome := '';
     sSubConta := '';

     if Sobriga <> 'S' then _CCustoCliFor := '';

  end;

  if ( ParamIntegra.IntegraContab ) and ( not cbIntegra.Checked ) and
     ((Cds.FieldByName('IDMODULO').AsInteger = 3) or
     (Cds.FieldByName('IDMODULO').AsInteger = 4)) then
  begin
     CdsContab.First;
     while (not CdsContab.Eof) do
     begin
        if CdsContab.FieldByName('LACDEBCRE').AsString = 'D' then
           rTotalContab   := rTotalContab   +  CdsContab.FieldByName('LACVALOR').AsFloat
        else
           rTotalContab   := rTotalContab   - CdsContab.FieldByName('LACVALOR').AsFloat;

        CdsContab.Next;
     end;

     if (not IsFloatZero(rTotalContab)) then
     begin
       MsgDlg('Total do Débito não bate com o Total do Crédito na Contabilização. Verifique','Erro',mtError,[mbOk],0);
       exit;
     end;

  end;


 //amf 26.08.2006 21703
  if _LancDocCapCar.VinculoBancario
     ('P', cdsPortForma.FieldByName('CODPORTFORMA').AsFloat) and (paramIntegra.RecPag = 'P') then
  begin
     if (cds.FieldByName('NUMBANCO').IsNull) OR
        (Trim(cds.FieldByName('NUMBANCO').AsString) = '') OR
        (cds.FieldByName('NUMAGENCIA').IsNull) OR
        (Trim(cds.FieldByName('NUMAGENCIA').AsString) = '') OR
        (cds.FieldByName('CONTACORRENTE').IsNull) OR
        (Trim(cds.FieldByName('CONTACORRENTE').AsString) = '') then
     begin
        MsgDlg('Os dados bancários são obrigatórios. Verifique na aba Geral', 'Erro',mtError,[mbOk],0);
        Accept := False;
        Exit;
     end;
  end;

  //amf 31.05.2007 25484 - Verifica o vínculo bancário do Fornecedor
  try
    cdsContaBancoForn := TClientDataSet.Create(nil);
    cdsContaBancoForn.Data := CtrlPessoaForne.SelContaBancaria(cds.FieldByName('IDFORCLI').AsFloat);

    cdsFormaRecPag      := TClientDataSet.Create(nil);
    cdsFormaRecPag.Data := CtrlFormaRecPag.ListFormaRecPag(Sistema.IdEmpresa,
                                                           cds.FieldByName('CODFORMA').AsFloat,
                                                           'P');
    if ( cdsFormaRecPag.FieldByName('FLGDADOSBANCARIOS').AsString = 'S' ) then
       if ( cdsContaBancoForn.IsEmpty ) then
       begin
           MsgDlg('Este fornecedor não possui dados bancários e esta forma de pagamento '#13#10 +'exige dados bancários. Verifique na aba Geral', 'Erro',mtError,[mbOk],0);
           Accept := False;
           Exit;
       end;

  finally
    FreeAndNil(cdsContaBancoForn);
    FreeAndNil(cdsFormaRecPag);
  end;

  //amf 26.08.2006 21704 - Verifica a duplicação do documento
  if _LancDocCapCar.DocumentoDuplicado(CmeCadastro.Operacao,
                                       //cds.FieldByName('NODOCUMENTO').AsInteger,          // Edilaine - SOL 199641 / KTN 1921256 - comentado
                                       StrToInt64(cds.FieldByName('NODOCUMENTO').AsString), // Edilaine - SOL 199641 / KTN 1921256
                                       cds.FieldByName('COMPLDOCUMENTO').AsString,
                                       cds.FieldByName('VALOR').AsFloat,
                                       cds.FieldByName('IDFORCLI').AsInteger,
                                       cds.FieldByName('DATAVENCTO').AsDateTime) then
  begin
     if Application.MessageBox
       ('Já foi encontrado um documento com o mesmo valor para esta data de vencimento.' +
        'Deseja Continuar ?', 'Aviso', mb_YesNo + mb_IconWarning) = idNo then
     begin
       Accept := False;
       Exit;
     end;
  end;

  //amf 12.04.2007 22592
  if (iExigeCota > 0) then
  begin
     if (cds.FieldByName('QTDECOTAS').IsNull) then
     begin
       MsgDlg('É obrigatório indicar o valor da quantidade de cotas. Verifique na aba Geral', 'Erro',mtError,[mbOk],0);
       Accept := False;
       Exit;
     end
  end;

  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange(Sender);


  //Cássio Rovaroto - WO 3606 - Início
  //Verifica se a AP está em alteração
  if (Sistema.IdModulo = 3) and (CmeCadastro.Operacao = OpAlterar) then
  begin
    //Verifica se na AP há serviço e se há alteradores de tributação
    if not AlteracaoAlteradoresTributacao(_IdServico) then
    begin
      MsgDlg('Não foi possível fazer a alteração da data dos alteradores de tributação.', 'Erro',mtError,[mbOk],0);
      Accept := False;
      Exit;
    end;

  end;
  //Cássio Rovaroto - WO 3606 - Fim

  inherited;

  dblcTipoRD.Enabled := False;
  //CboSubDespesa.Enabled := False;

  if sbtnInserir.Down then
  begin
    _ValorEdit := 0;
    _Valida := True;
    if CmpForCli.CanFocus then CmpForCli.SetFocus;
  end;

  //Cássio Rovaroto - SIG nº 115585 - Início


  if (ParamIntegra.RecPag = 'P')  then
  begin
   //Cássio Rovaroto - SIG nº 23656.57673 - Início
   {cdsDet.First;
   while not (cdsDet.Eof) do
   begin
    if ((cdsDet.FieldByName('IDPROCESSOSUSP').AsInteger > 0) and not (bExisteProcSusp)) then
    	bExisteProcSusp :=  True;

    if (cdsDet.FieldByName('SERVICO').AsString =  'S') and (cdsDet.FieldByName('IDTIPOSERVICO').AsInteger > 0) then
    begin
    	bDesembolsoServico := True;
      Break;
    end;

	  cdsDet.Next;
   end;}
   //Cássio Rovaroto - SIG nº 23656.57673 - Fim

   if (Sistema.IdModulo = 3) and (CmeCadastro.Operacao in [ OpInserir, OpAlterar ]) then
   begin
    if (bDesembolsoServico) and (cds.FieldByName('NFSNUMERO').AsString = '') then
    begin
    	MsgDlg('É obrigatória a inclusão dos dados da nota fiscal de serviço.', 'Erro',mtError,[mbOk],0);
     Accept := False;
     pgctrlDetalhe.ActivePageIndex := 7;
     Exit;
    end;

    if (bDesembolsoServico) and (cds.FieldByName('NFSSERIE').AsString = '') then
    begin
   	 MsgDlg('É obrigatório informar o número de série da nota fiscal de serviço.', 'Erro',mtError,[mbOk],0);
     Accept := False;
     pgctrlDetalhe.ActivePageIndex := 7;
     Exit;
    end;

    if (bDesembolsoServico) and ((cds.FieldByName('NFSDATAEMISSAO').AsDatetime = 0) or (dbDtpDataEmissao.SelText = '')) then
    begin
   	 MsgDlg('É obrigatório informar a data de emissão da nota fiscal de serviço.', 'Erro',mtError,[mbOk],0);
     Accept := False;
     pgctrlDetalhe.ActivePageIndex := 7;
     Exit;
    end;

    //if (rgTipoNF.ItemIndex = 1) and (cds.FieldByName('NFSSERVICO').asString = EmptyStr)  then //Everson Cunha - WO2946
    if (rgTipoNF.ItemIndex = 1) and ((cds.FieldByName('NFSSERVICO').asString = EmptyStr) or (cds.FieldByName('NFSSERVICO').asinteger = -1)) then //Everson Cunha - WO2946
    begin
      MsgDlg('Informe o tipo de serviço, produto ou atividade da nota fiscal.', 'Erro',mtError,[mbOk],0);
      Accept := False;
      pgctrlDetalhe.ActivePageIndex := 7;
      Exit;
    end;
   end;
  end;
  //Cássio Rovaroto - SIG nº 115585 - Fim

  Accept := True;
end;


procedure TfrmLancDocCAPCAR.DBcboGrupoRateioExit(Sender: TObject);
begin
   inherited;

   if DBcboGrupoRateio.LookupValue <> '' then
   begin
      cdsPadraoRateio.Data := CtrlGrupoRateio.LookupPadraoRateioDoc(StrToInt(DBcboGrupoRateio.LookupValue),
                                                                    Sistema.IDEmpresa);
   end;
end;



procedure TfrmLancDocCAPCAR.btnGrupoRateioClick(Sender: TObject);
var
   iContador      : Integer;
   iQuantRateio   : Integer;
   fTotalRateado  : Extended;
   fTotalRestante : Extended;
   fTotalFDO      : Extended;
   fVlrRateio     : Extended;
begin
   inherited;

   if (cdsPadraoRateio.FindField('VALORFDO') <> nil) and (rbPLANILHA.checked) then
      begin
        if dbeValorCorrente.Value <>  dTotal then
        begin
          MsgDlg('Valor do documento diverge do total de rateio ('+FormatFloat('#,##0.00',dTotal)+').' + #13#10 + 'Verificar as linhas importadas e realizar os ajustes necessários','Aviso',mtWarning,[mbOk],0);
          exit;
        end;
      end;

   if not(VerificaRateio) then Exit;

   if (cdsPadraoRateio.Active) and not(cdsPadraoRateio.IsEmpty) then
   begin
      iContador      := 1;
      iQuantRateio   := cdsPadraoRateio.RecordCount;
      fTotalRestante := Cds.FieldByName('VALOR').AsCurrency;

      cdsPadraoRateio.First;
{      if (rbPLANILHA.checked) then
        begin
          cdsPadraoRateio.edit;
          cdsPadraoRateio.FieldByName('TOTAL').AsCurrency := dTotal;
          cdsPadraoRateio.post;
        end;
}
      CdsDet.DisableControls;

      //edilaine SIG115594 : inicio
      if (cdsPadraoRateio.FindField('VALORFDO') <> nil) and (rbFDO.checked) then
      begin
        fTotalFDO      := Arredonda(cdsPadraoRateio.FieldByName('TOTAL').AsCurrency, 2);
        if Floattostr(fTotalRestante) <>  Floattostr(fTotalFDO) then
        begin
          //Everson Cunha - SIG117182 - Ini
          //CdsDet.EnableControls;
          //MsgDlg('Valor do documento diverge do total de rateio ('+FormatFloat('#,##0.00',fTotalFDO)+').','Erro',mtWarning,[mbOk],0);
          MsgDlg('Valor do documento diverge do total de rateio ('+FormatFloat('#,##0.00',fTotalFDO)+').' + #13#10 + 'Verificar as linhas importadas e realizar os ajustes necessários','Aviso',mtWarning,[mbOk],0);
          //exit;
          //Everson Cunha - SIG117182 - Ini
        end;
      end;
      //edilaine SIG115594 : fim

      while not(cdsPadraoRateio.EOF) do
      begin
         fTotalRateado  := Cds.FieldByName('VALOR').AsCurrency;

         //edilaine SIG115594 : inicio
         if cdsPadraoRateio.FindField('VALORFDO') <> nil then
            fVlrRateio     := Arredonda(cdsPadraoRateio.FieldByName('VALORFDO').AsCurrency, 2)
         else
            fVlrRateio     := Arredonda(fTotalRateado * cdsPadraoRateio.FieldByName('PERCENTRATEIO').AsCurrency / 100, 2);
         //edilaine SIG115594 : fim

         // se for o ultimo registro da query colocar o valor restante nela
         //if iContador = iQuantRateio then fVlrRateio := fTotalRestante; //Everson Cunha - SIG117182

         _ValorEdit :=  _ValorEdit - fVlrRateio; //Everson Cunha - SIG117182

         // inserção do Rateio
         CdsDet.Insert;

         CdsDet.FieldByName('CODDOCUMENTO').AsInteger    := Cds.FieldByName('CODDOCUMENTO').AsInteger;
         CdsDet.FieldByName('IDPESSOA').AsInteger        := Sistema.IdEmpresa;

         CdsDet.FieldByName('UNIDNEGOC').AsInteger       := cdsPadraoRateio.FieldByName('UNIDNEGOC').AsInteger;
         CdsDet.FieldByName('NOME').Text                 := cdsPadraoRateio.FieldByName('UNIDNEGOCIO').AsString;

         CdsDet.FieldByName('RECPAG').AsString           := ParamIntegra.RecPag;

         //edilaine SIG115594 : inicio
         if rbFDO.checked then
         begin
           if cdsPadraoRateio.FindField('CODCREXTERNO') <> nil then
              cdsDet.FieldByName('CODEXTERNOCR').asString  := CdsCentroRespon.fieldByName('CODEXTERNO').asString;
           CdsDet.FieldByName('CODCENTRORESPON').AsString  := CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
           CdsDet.FieldByName('NOME_1').Text               := CdsCentroRespon.FieldByName('NOME').AsString;
         end
         else
         begin
           if cdsPadraoRateio.fieldByName('CODCREXTERNO').asString <> '' then
              cdsDet.FieldByName('CODEXTERNOCR').asString  := cdsPadraoRateio.fieldByName('CODCREXTERNO').asString;
           CdsDet.FieldByName('CODCENTRORESPON').AsString  := cdsPadraoRateio.FieldByName('CODCENTRORESPON').AsString;
           CdsDet.FieldByName('NOME_1').Text               := cdsPadraoRateio.FieldByName('CENTRORESPON').AsString;
         end;
         //edilaine SIG115594 : fim

         CdsDet.FieldByName('CODTIPRECDES').AsStrIng     := cdsPadraoRateio.FieldByName('CODTIPRECDES').AsString;
         CdsDet.FieldByName('DESCRICAO').Text            := cdsPadraoRateio.FieldByName('TIPODESEMBOLSO').AsString;
         CdsDet.FieldByName('VALOR').Value               := fVlrRateio;

         CdsDet.FieldByName('CODCENTROCUSTO').AsStrIng   := cdsPadraoRateio.FieldByName('CODCENTROCUSTO').AsString;
         CdsDet.FieldByName('CODEXTERNOCC').asString       := cdsPadraoRateio.FieldByName('CODCCEXTERNO').AsString;
         CdsDet.FieldByName('NOMECENTROCUSTO').AsString  := cdsPadraoRateio.FieldByName('CENTROCUSTO').AsString;
         With SqlAuxTipoRD, Sql Do
         begin
           Clear;
           Add(' SELECT ');
           Add('    T.PLACONTACREDITO, ');
           Add('    T.PLACONTA, ');
           Add('    P.PLACCUST ');
           Add(' FROM ');
           Add('    TIPORECEBDESEMB T, ');
           Add('    PLANOCONTA P ');
           Add(' WHERE ');
           Add('    RTrim(T.CODTIPRECDES) = :CODTIPRECDES ');
           Add('    and T.RECPAG = :RECPAG ');
           Add('    and T.IDPESSOA = :IDPESSOA ');
           Add('    and P.PLACONTA(+) = T.PLACONTA ');
           Add('    and P.PLANO(+)    = T.PLANO ');
           Prepare;
           ParamByName('CODTIPRECDES').AsString := Trim(CdsDet.FieldByName('CODTIPRECDES').AsString);
           ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
           ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
           Open;
         end;

         if trim (CdsTipoRD.FieldByName('PLACONTACREDITO').asstrIng) <> '' then
           CdsDet.FieldByName('PLACONTACREDITO').asstrIng := CdsTipoRD.FieldByName('PLACONTACREDITO').asstrIng
         else
           CdsDet.FieldByName('PLACONTACREDITO').asstrIng := CmpForCli.ForCliReg.CContabil;
         //fim - André Tavares - pendência 16992 - 17/04/2004

         // Ricardo A. SOL 122623 KTN 603580
         CdsDet.FieldByName('IDPLANOORIGEM').AsInteger   := cdsPadraoRateio.FieldByName('IDPLANOPREV').AsInteger;
         CdsDet.FieldByName('DESCPLANOORIGEM').AsString  := cdsPadraoRateio.FieldByName('PLANPREV').AsString;

         CdsDet.FieldByName('IDPATROORIGEM').AsInteger   := cdsPadraoRateio.FieldByName('IDPATRO').AsInteger;
         CdsDet.FieldByName('NOMEPATROORIGEM').AsString  := cdsPadraoRateio.FieldByName('PATRO').AsString;

         CdsDet.FieldByName('IDPROGRAMA').AsInteger      := cdsPadraoRateio.FieldByName('IDPROGRAMA').AsInteger;
         CdsDet.FieldByName('DESCPROGRAMA').AsString     := cdsPadraoRateio.FieldByName('DESCPROGRAMA').AsString;

         AtualizaPlanoPatro();
         
         CdsDet.Post;

         fTotalRestante := fTotalRestante - fVlrRateio;
         inc(iContador);

         cdsPadraoRateio.Next;
      end;
      rbPLANILHA.checked    := false;    // WO8229 Ferrari
      edtArquivo.text       := '';       // WO8229 Ferrari
      sbtnSelArquivo.enabled   := false;    // WO8229 Ferrari

      _cdsAux.Data := copyClientDataset(cdsDet);    // tavares - pendência 17279

      CdsDet.EnableControls;
   end;
end;




function TfrmLancDocCAPCAR.Arredonda(const fValor     : Extended;
                                     const iDecimais  : Word
                                    ): Extended;
begin
   Result := (round(fValor * Power(10, iDecimais))) / Power(10, iDecimais);
end;





function TfrmLancDocCAPCAR.VerificaRateio: Boolean;
var
   sMsg : String;
   sNumFDO : string;                   //edilaine SIG115594
begin
   Result := False;
   try

      if (Cds.FieldByName('VALOR').IsNull) or (Cds.FieldByName('VALOR').AsCurrency = 0) then
         raise EValidacao.CreateVal('É necessário indicar o Valor do Documento antes de fazer o Rateio!', btnGrupoRateio);

      //if not(dbgrdDet.DataSource.DataSet.IsEmpty) then //Everson Cunha - SIG124994
         //raise EValidacao.CreateVal('O Rateio já foi preenchido! ' + #13 + 'Não é possível executar Rateio Pré-definido', btnGrupoRateio);     //edilaine SIG115594
      //   raise EValidacao.CreateVal('O Rateio já foi preenchido! ' + #13 + 'Não é possível efetuar o rateio novamente', btnGrupoRateio);       //edilaine SIG115594 //Everson Cunha - SIG124994


      //edilaine SIG115594 : inicio
      if (not rbFDO.checked) and (not rbRateioPre.checked) and (not rbPLANILHA.checked) then
         raise EValidacao.CreateVal('É necessário selecionar o tipo de Rateio!', btnGrupoRateio);

      if (rbFDO.checked) then
      begin
        if (Trim(edNumFDO.text) = '') then
        begin
          raise EValidacao.CreateVal('É necessário indicar o Padrão de Rateio FDO!', btnGrupoRateio);
          edNumFDO.setfocus;
        end
        else if (dblkCResponsa.text = '') then
        begin
          raise EValidacao.CreateVal('É necessário indicar o Centro de Responsabilidade!', btnGrupoRateio);
          dblkCResponsa.setfocus;
        end
        else
        begin
          // busca dados do FDO Digital
          sMsg    := '';

          sNumFDO := Trim(edNumFDO.text);
          if Pos('FDO', sNumFDO) = 0 then
             sNumFDO := 'FDO-'+sNumFDO;

          cdsPadraoRateio.Data := CtrlIntegraOrcFDO.GetRateioFDO(sNumFDO, ParamIntegra.RecPag,
                                                                 CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString,
                                                                 sMsg);

          if sMsg <> '' then
             raise EValidacao.CreateVal(sMsg, btnGrupoRateio);
        end;
      end
//      else if (rbRateioPre.checked) and (DBcboGrupoRateio.LookupValue <> '') then      // WO25413 Ferrari
      else if (rbRateioPre.checked) and (DBcboGrupoRateio.LookupValue = '') then        // WO25413 Ferrari
      begin
        raise EValidacao.CreateVal('É necessário indicar o Padrão de Rateio!', btnGrupoRateio);
        DBcboGrupoRateio.setfocus;
      end
      // Inicio WO8229 Ferrari
      // aqui colocar a rotina de importação e verificação da planilha
      else if (rbPLANILHA.checked) then
      begin
        if (Trim(edtArquivo.text) = '') then
        begin
          raise EValidacao.CreateVal('É necessário Selecionar um arquivo para importação!', btnGrupoRateio);
          edtArquivo.setfocus;
        end;
        memResultado.clear;
        pnlResultado.visible := False;
        dbgrdDet.visible := True;
      end;

      // Fim WO8229 Ferrari

      //if not(cdsPadraoRateio.Active) then
      //   raise EValidacao.CreateVal('É necessário indicar o Padrão de Rateio!', btnGrupoRateio);
      //edilaine SIG115594 : fim

      if cdsPadraoRateio.IsEmpty then
         raise EValidacao.CreateVal('O Padrão de Rateio selecionado está vazio!', btnGrupoRateio);

      cdsPadraoRateio.First;
      while not(cdsPadraoRateio.EOF) do
      begin
         if not(VerificaTipoDesembXCRespon) then
         begin
            sMsg := 'O Tipo de Desembolso "' + cdsPadraoRateio.FieldByName('TIPODESEMBOLSO').AsString +
                    '" não está associado ao ' + 'Centro de Responsabilidade "' +
                    cdsPadraoRateio.FieldByName('CENTRORESPON').AsString + '"! ' + #13 +
                    'O Rateio está inválido. ';
            raise EValidacao.CreateVal(sMsg, btnGrupoRateio);
         end;

         if not(VerificaTipoDesembXForn) then
         begin
            sMsg := 'O Tipo de Desembolso "' + cdsPadraoRateio.FieldByName('TIPODESEMBOLSO').AsString +
                    '" não está associado ao ' + 'Fornecedor "' +
                    CmpForCli.Text + '" ou seu Ramo! ' + #13 +
                    'O Rateio está inválido. ';
            raise EValidacao.CreateVal(sMsg, btnGrupoRateio);
         end;

         if not(VerificaUsuXCRespon) then
         begin
            sMsg := 'O Usuário corrente não está associado ao Centro de Responsabilidade "' +
                    cdsPadraoRateio.FieldByName('CENTRORESPON').AsString + '"! ' + #13 +
                    'O Rateio está inválido. ';
            raise EValidacao.CreateVal(sMsg, btnGrupoRateio);
         end;

         cdsPadraoRateio.Next;
      end;

      //Everson Cunha - SIG130032 - Ini
      if cdsPadraoRateio.locate('UNETIPO', 'S', []) then
         raise EValidacao.CreateVal('Existe Atividade e Projeto Sintética vinculada ao rateio FDO.' + #13#10 + 'Favor verificar o rateio no cadastro do FDO', btnGrupoRateio);
      //Everson Cunha - SIG130032 - Fim

   except

      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
   Result := True;
end;




function TfrmLancDocCAPCAR.VerificaTipoDesembXCRespon: Boolean;
begin
   Result := True;

   cdsVerificaRateio.Data := CtrlGrupoRateio.LookupTipoDesembXCRespon(Sistema.IDEmpresa,
                                                                      'P',
                                                                      Espaco(cdsPadraoRateio.FieldByName('CODCENTRORESPON').AsString, 10));

   // Se não houver Tipos de Desembolso associados ao Centro de Responsabilidade, está OK
   if cdsVerificaRateio.IsEmpty then Exit;

   cdsVerificaRateio.First;
   while not(cdsVerificaRateio.EOF) do
   begin
      // Se o Tipo de Desembolso estiver associado, está OK
      if trim(cdsVerificaRateio.FieldByName('CODTIPRECDES').AsString) =
         trim(cdsPadraoRateio.FieldByName('CODTIPRECDES').AsString) then Exit;

      cdsVerificaRateio.Next;
   end;

   Result := False;
end;




function TfrmLancDocCAPCAR.VerificaPreenchimentoSegregaDetalhe: boolean;
begin
   Result := False;
   try

      if (Cds.FieldByName('VALOR').IsNull) or (Cds.FieldByName('VALOR').AsCurrency = 0) then
         raise EValidacao.CreateVal('É necessário indicar o Valor do Documento antes de fazer o Rateio!', btnGrupoRateio);

      // início Andre tavares - 19243
      if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(CdsDet.FieldByName('IDPATROORIGEM').AsInteger,
             CdsDet.FieldByName('IDPLANOORIGEM').AsInteger) then
      begin
        MsgDlg(CtrlPlanPrevContabPatro.MessageInfo,'Erro',mtError,[mbOk],0);
        Result := false;
        Abort;
      end;
      //fim Andre Tavares - 19243

      // Se segregação ativada
      // não permitir lança e baixa simultânea para plano <> comum e patro <> comum
      // esta trava tb deve ser feita no objeto pois o usuário pode selecionar lança e baixa
      // após ter sido feito o rateio. _LancDocCapCar.ProcessaDocumento
      if ParamIntegra.SegregaVirtual then begin
         // travas lança e baixa simulanea
         if cbLancaBaixa.Checked then begin
            // se permitir lançar um plano carimbado, fura a segregação do fluxo primário
            if not ((ParamIntegra.PlanoPrevGlobal = CdsDet.FieldByName('IDPLANOORIGEM').AsInteger) or
                    (ParamIntegra.PlanoPrevAdm = CdsDet.FieldByName('IDPLANOORIGEM').AsInteger)) then
               raise EValidacao.createVal ('Para lançamentos de Lança e Baixa Simultânea, onde a segregação está ativa, não é permitido lançar um Plano Previdenciário diferente do "Comum"/"Adminitrativo"!', cmbPlano);

            // se permitir lançar uma patro carimbada, fura a segregação do fluxo primário
            if ParamIntegra.PatroGlobal <> CdsDet.FieldByName('IDPATROORIGEM').AsInteger then
               raise EValidacao.createVal ('Para lançamentos de Lança e Baixa Simultânea, onde a segregação está ativa, não é permitido lançar uma Patrocinadora diferente da "Comum"!',CmbPatro);

         end;

         // se plano = comum/adm  então  patro = comum
         if ((ParamIntegra.PlanoPrevGlobal = CdsDet.FieldByName('IDPLANOORIGEM').AsInteger) or
             (ParamIntegra.PlanoPrevAdm  = CdsDet.FieldByName('IDPLANOORIGEM').AsInteger) or
             (ParamIntegra.PatroGlobal = CdsDet.FieldByName('IDPATROORIGEM').AsInteger)) and
            ( not ((ParamIntegra.PlanoPrevGlobal = CdsDet.FieldByName('IDPLANOORIGEM').AsInteger) or
                   (ParamIntegra.PlanoPrevAdm  = CdsDet.FieldByName('IDPLANOORIGEM').AsInteger)) or
            (ParamIntegra.PatroGlobal <> CdsDet.FieldByName('IDPATROORIGEM').AsInteger)) then
            raise EValidacao.createVal('Para lançamentos, onde a segregação está ativa, se lançar em um Plano Previdenciário "Comum"/"Administrativo" a Patrocinadora deve ser "Comum", e vice-versa!',cmbPlano);

         // Alex 14/12/04 18107 fazer as críticas por programa, quando o plano administrativo foi parametrizado
         if (CdsDet.FieldByName('FLGTIPOPROGRAMA').AsString <> '') and (ParamIntegra.PlanoPrevAdm > 0) then begin
           // o programa administrativo foi escolhido
           if CdsDet.FieldByName('FLGTIPOPROGRAMA').AsString = 'ADM' then begin
             if ParamIntegra.PlanoPrevGlobal = CdsDet.FieldByName('IDPLANOPREV').AsInteger then // escolhido o plano O.C.
               raise EValidacao.createVal ('O programa Administrativo não permite o plano de "Operações Comuns"!', cmbPlano);

           end else if CdsDet.FieldByName('FLGTIPOPROGRAMA').AsString = 'INV' then begin
             if (ParamIntegra.PlanoPrevAdm  = CdsDet.FieldByName('IDPLANOPREV').AsInteger) then // escolhido o plano ADM
               raise EValidacao.createVal ('O programa de Investimentos não permite o plano de "Operações Administrativas"!', cmbPlano);

           end else if (CdsDet.FieldByName('FLGTIPOPROGRAMA').AsString = 'PRE') or (CdsDet.FieldByName('FLGTIPOPROGRAMA').AsString = 'ASS') then begin
             if ParamIntegra.PlanoPrevGlobal = CdsDet.FieldByName('IDPLANOPREV').AsInteger then // escolhido o plano O.C.
               raise EValidacao.createVal ('O programa Previdencial / Assistencial não permite o plano de "Operações Comuns"!', cmbPlano);

             if (ParamIntegra.PlanoPrevAdm  = CdsDet.FieldByName('IDPLANOPREV').AsInteger) then // escolhido o plano ADM
               raise EValidacao.createVal ('O programa Previdencial / Assistencial não permite o plano de "Operações Administrativas"!', cmbPlano);
           end;
         end;
         // Alex 14/12/04 18107 fazer as críticas por programa, quando o plano administrativo foi parametrizado

       end;
       // fim 22/01/04 Alex 14451 - Nova segregação


   except

      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Segregação de Recursos', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
   Result := True;
end;




function TfrmLancDocCAPCAR.VerificaPreenchimentoSegregaMestre: boolean;
begin
   Result := true;
   if not ParamIntegra.SegregaVirtual then exit;
   try
     try
       CdsDet.DisableControls;

       if (_OperacaoLanc = opldAdiantamento) and (CdsDet.RecordCount > 1) then
         raise EValidacao.createVal('Apenas um rateio é permitido em documentos de adiantamento!',cmbPlano);

       CdsDet.First;
       while not CdsDet.Eof do begin
         Result := VerificaPreenchimentoSegregaDetalhe;
         if not Result then exit;
         CdsDet.Next;
       end;

     except
       on ev : EValidacao do
       begin
          Result := false;
          if ev.Show then MsgDlg(ev.message, 'Segregação de Recursos', mtWarning, [mbOk], 0);
          Repaint;
          if ev.Control.CanFocus then ev.Control.SetFocus;
          Exit;
       end;
     end;
   finally
      CdsDet.EnableControls;
   end;
end;




function TfrmLancDocCAPCAR.VerificaTipoDesembXForn: Boolean;
begin
   Result := True;

   // 1º - Verifica se o Tipo de Desembolso está associado ao Fornecedor

   cdsVerificaRateio.Data := CtrlGrupoRateio.LookupTipoDesembXForn(Sistema.IDEmpresa,
                                                                   Cds.FieldByName('IDFORCLI').AsFloat,
                                                                   'P');

   cdsVerificaRateio.First;
   while not(cdsVerificaRateio.EOF) do
   begin
      // Se o Tipo de Desembolso estiver associado, está OK
      if trim(cdsVerificaRateio.FieldByName('CODTIPRECDES').AsString) =
         trim(cdsPadraoRateio.FieldByName('CODTIPRECDES').AsString) then Exit;

      cdsVerificaRateio.Next;
   end;

   // 2º - Verifica se o Tipo de Desembolso está associado ao Ramo do Fornecedor

   cdsVerificaRateio.Data := CtrlGrupoRateio.LookupRamoFornXDesemb(Sistema.IDEmpresa,
                                                                   Cds.FieldByName('IDFORCLI').AsFloat,
                                                                   'P');

   // Se não houver Tipos de Desembolso associados ao Ramo do Fornecedor, está OK
   if cdsVerificaRateio.IsEmpty then Exit;

   cdsVerificaRateio.First;
   while not(cdsVerificaRateio.EOF) do
   begin
      // Se o Tipo de Desembolso estiver associado, está OK
      if trim(cdsVerificaRateio.FieldByName('CODTIPRECDES').AsString) =
         trim(cdsPadraoRateio.FieldByName('CODTIPRECDES').AsString) then Exit;

      cdsVerificaRateio.Next;
   end;

   Result := False;
end;





function TfrmLancDocCAPCAR.VerificaUsuXCRespon: Boolean;
begin
   Result := True;

   cdsVerificaRateio.Data := CtrlGrupoRateio.LookupUsuXCRespon(Sistema.IDEmpresa,
                                                               Sistema.IDUsuario,
                                                               'P',
//                                                               Espaco(cdsPadraoRateio.FieldByName('CODCENTRORESPON').AsString, 10)
                                                               trim(cdsPadraoRateio.FieldByName('CODCENTRORESPON').AsString)  // Paulo Nobre - WO30708
                                                               );

   // Se não houver Tipos de Desembolso associado ao Centro de Responsabilidade, está OK
   if not(cdsVerificaRateio.IsEmpty) then Exit;

   Result := False;
end;




procedure TfrmLancDocCAPCAR.dblcTipoRDEnter(Sender: TObject);
begin
  // Marcio Motta - 18492 - 19/01/2005
  dblcTipoRD.Text := '';
  CdsDet.FieldByName('CODTIPRECDES').Clear;

  // Alterado por Arnaldo V. Scarin em 19/10/2009
  // SOL 123802 e 123804 -> CGPC 028.
  AjustaUsoPGA('N');

  if ReResOrc.Value = 0 then
    SetaCentResponDesemb(-1, False)
  else
    SetaCentResponDesemb(BuscaIdReservaOrcamento(Trunc(ReResOrc.Value)), False);
  // Fim - Marcio Motta
end;




function TfrmLancDocCAPCAR.BuscaIdReservaOrcamento(NumCompromisso: integer): integer;
// Marcio Motta - 18492 - 19/01/2005
//******************************************************************************
//* Função para buscar o IDRESERVAORCAMEN, fornecendo o número do Compromisso  *
//* Necessário para a filtragem do TIPO DE DESEMBOLSO                          *
//******************************************************************************

var
  CdsTemp: TCMClientDataSet;
  SqlParam: TCMSqlParams;

begin
  if NumCompromisso > 0 then
    begin
      try
        CdsTemp  := TCMClientDataSet.Create(nil);
        SqlParam := TCMSqlParams.Create(nil);
        SqlParam.ClientDataSet := CdsTemp;

        SqlParam.SQL.Add('SELECT IDRESERVAORCAMEN');
        SqlParam.SQL.Add('FROM RESERVAORCAMEN');
        SqlParam.SQL.Add('WHERE NUMRESERVA = ' + IntToStr(NumCompromisso));

        CdsTemp.Close;
        SqlParam.Open;

        if CdsTemp.IsEmpty then
          Result := -1
        else
          Result := CdsTemp.FieldByName('IDRESERVAORCAMEN').AsInteger;

      finally
        FreeAndNil(CdsTemp);
        FreeAndNil(SqlParam);
      end;
    end
  else
    Result := -1;
end;




function TfrmLancDocCAPCAR.VerificaTipoDesembolso: boolean;
// Marcio Motta - 18492 - 20/01/2005
//******************************************************************************
//* Função para verificar se o Compromisso Orçamentário corresponde ao         *
//* TIPO DE DESEMBOLSO selecionado                                             *
//******************************************************************************

var
  CdsTemp: TCMClientDataSet;
  SqlParam: TCMSqlParams;
  sIdReserva: string;
begin
  Result := False;

  try
    CdsTemp  := TCMClientDataSet.Create(nil);
    SqlParam := TCMSqlParams.Create(nil);
    SqlParam.ClientDataSet := CdsTemp;

    // Busca o ID da Reserva
    sIdReserva := IntToStr(BuscaIdReservaOrcamento(Trunc(ReResOrc.Value)));

    // Busca os Tipos de Desembolsos permitidos
    SqlParam.SQL.Add('SELECT CP.CODCENTRORESPON, CP.CODTIPRECDES');
    SqlParam.SQL.Add('FROM COMPCONTASORCAMEN CP, RESERVAORCAMEN RE');
    SqlParam.SQL.Add('WHERE (RE.IDRESERVAORCAMEN = ' + sIdReserva + ')');
    SqlParam.SQL.Add('AND (RE.IDPLANOORCAMEN = CP.IDPLANOORCAMEN)');
    SqlParam.SQL.Add('AND (RE.IDCONTAORCAMEN = CP.IDCONTAORCAMEN)');
    SqlParam.SQL.Add('AND CP.CODTIPRECDES IS NOT NULL');

    CdsTemp.Close;
    SqlParam.Open;

    // Se o Tipo de Desembolso selecionado não for permitido
    if (CdsTemp.IsEmpty) or (CdsTemp.Locate('CODTIPRECDES', _TpDesmb, [])) then
      Result := True;

  finally
    FreeAndNil(CdsTemp);
    FreeAndNil(SqlParam);
  end;
end;




procedure TfrmLancDocCAPCAR.ReResOrcExit(Sender: TObject);
begin
  inherited;
  // Marcio Motta - 18492 - 21/01/2005
  if (ReResOrc.Lines[0] <> '') and (ReResOrc.Value > 0) then
    begin
      CdsDet.FieldByName('NUMRESERVA').AsFloat := ReResOrc.Value;
      CdsDet.FieldByName('IDRESERVAORCAMEN').AsFloat := BuscaIdReservaOrcamento(Trunc(ReResOrc.Value));
      SetaCentResponDesemb(CdsDet.FieldByName('IDRESERVAORCAMEN').AsInteger, False);
    end;
end;




procedure TfrmLancDocCAPCAR.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  sDataLanc := Cds.fieldByName('DATALANCTO').asString; // André Tavares - pendência 18937 - 25/04/2005

  iContaXCaixa := StrtoIntDef( dblcPortadorForma.LookupValue, -1 );

  //  Rodolpho da Silva - P: 18588 - 11/08/2005
  DtmCapCarMT.CdsAdtoPendente.Close;
  DtmCapCarMT.CdsPrevPendente.Close;

  EmitirBloqueto; //andré tavares pendência 24373 - 01/02/2007

  //edilaine SIG15594 : inicio
  if (ParamIntegra.RecPag = 'P') then
  begin
    rbFDO.checked       := false;
    rbRateioPre.checked := false;
    edNumFDO.text       := '';
    dblkCResponsa.text  := '';
  end;
  //edilaine SIG15594 : fim
end;

function TfrmLancDocCAPCAR.VerificaSeDocAdiantEstaRegularizado: boolean;
//  Rodolpho da Silva - P: 18588 - 22/06/2005
begin
   Result := False;
   CdsLancamento.DisableControls;
   CdsLancamento.First;
   while not CdsLancamento.Eof do
   begin
       if CdsLancamento.FieldByName('OPERACAO').AsInteger in [16,17] then
          Exit;
      CdsLancamento.Next;
   end;
   CdsLancamento.EnableControls;
   CdsLancamento.First;
   Result := True;
end;




procedure TfrmLancDocCAPCAR.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   //  Rodolpho da Silva - P: 18588 - 11/08/2005
   DtmCapCarMT.CdsAdtoPendente.Close;
   DtmCapCarMT.CdsPrevPendente.Close;

end;


// andre tavares pendencia 19942 - 26/08/2005
procedure TfrmLancDocCAPCAR.RdFichaClick(Sender: TObject);
begin
  inherited;
   if RdFicha.checked then
     cds.FieldByName('NUMDIGCODBARRAS').EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; ';
end;

// andre tavares pendencia 19942 - 26/08/2005
procedure TfrmLancDocCAPCAR.RdArrecadClick(Sender: TObject);
begin
  inherited;
   if RdArrecad.checked then
     cds.FieldByName('NUMDIGCODBARRAS').EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; ';
end;

// andre tavares pendencia 19942 - 26/08/2005
function TfrmLancDocCAPCAR.verificaCodBarra: boolean;
begin
  result := true;

  if RdFicha.Checked then
  begin
    if (Trim(DbeBarras.Text) <> '') then
      if (_oldNumLeitCodBarras <> DbeBarras.Text) then // Alterado por FHBS - 28/02/2019 - SIG81972
        //if not CtrlIntBanco.ValidaCodBarrasSispag(DbeBarras.Text,11) then // Andre Imakawa - SIG20321
        if not ValidaCodBarrasSispag(DbeBarras.Text,11) then // Andre Imakawa - SIG20321
        begin
          result := false;
          if DbeBarras.CanFocus then DbeBarras.setFocus;
        end;


    if (Trim(DbeLInhaDigit.Text) <> '') then
      //if not CtrlIntBanco.ValidaCodBarrasSispag(DbeLInhaDigit.Text,10) then // Andre Imakawa - SIG20321
      if not ValidaCodBarrasSispag(DbeLInhaDigit.Text,10) then  // Andre Imakawa - SIG20321
      begin
        result := false;
        if DbeLInhaDigit.CanFocus then DbeLInhaDigit.setFocus;
      end;
  end else
  begin
    If (Trim(DbeLInhaDigit.Text) <> '') then
      //if Not CtrlIntBanco.ValidaCodBarrasArrecad(DbeLInhaDigit.Text) then // Andre Imakawa - SIG20321
      if Not ValidaCodBarrasArrecad(DbeLInhaDigit.Text) then // Andre Imakawa - SIG20321
      begin
        result := false;
        if DbeLInhaDigit.CanFocus then DbeLInhaDigit.setFocus;
      end;
  end;
end;

// andre tavares pendencia 19942 - 26/08/2005
procedure TfrmLancDocCAPCAR.DbeBarrasExit(Sender: TObject);
begin
  inherited;
  verificaCodBarra;
end;

// andre tavares pendencia 19942 - 26/08/2005
procedure TfrmLancDocCAPCAR.DbeLinhaDigitExit(Sender: TObject);
begin
  inherited;
  verificaCodBarra;
end;

procedure TfrmLancDocCAPCAR.dblkAlteradorChange(Sender: TObject);
var
   cdsAux: TClientDataSet;
begin
  inherited;
  mmObsAlt.Lines.Text := '';
  cdsAux := TClientDataSet.Create(nil);
  if Trim(dblkAlterador.LookUpValue) <> '' then
  begin
     cdsAux.Data := CtrlTipoalterador.listTipoalterador(0,'',StrToFloat(dblkAlterador.LookUpValue));
     mmObsAlt.Lines.Text := cdsAux.FieldByName('OBSERVACAO').AsString;

     //Cássio Rovaroto - SIG nº 115585 - Início
     lblTipoServico.Enabled := cdsAux.FieldByName('FLGLANCANFS'). asString = 'S';
     dbLkpCbTipoServico.Enabled := cdsAux.FieldByName('FLGLANCANFS'). asString = 'S';
     lblValorBaseRetencao.Enabled := cdsAux.FieldByName('FLGVALORBASE'). asString = 'S';
     edtValorBaseRetencao.Enabled := cdsAux.FieldByName('FLGVALORBASE'). asString = 'S';
     lblProcessos.Enabled := cdsAux.FieldByName('FLGLANCANFS'). asString = 'S';
     dbLkpCbProcCPRB.Enabled := not (cdsProcessos.IsEmpty);
     //Cássio Rovaroto - SIG nº 115585 - Fim
  end;
  FreeAndNil(cdsAux);
end;

procedure TfrmLancDocCAPCAR.sbtnProcurarClick(Sender: TObject);
begin
  CmpForCli.Enabled := true;
  cmProcListaServicos.Enabled := True;
  inherited;
  //luis WO14157-14159 : inicio
  edtNumeroProc.text := Cds.FieldByName('NUMPROCESSO').asstring;
  if Cds.FieldByName('PARTEFUNCEF').asstring = 'S' then
    rgFuncef.itemindex := 0
  else if Cds.FieldByName('PARTEFUNCEF').asstring = 'N' then
    rgFuncef.itemindex := 1
  else
    rgFuncef.itemindex := -1;
  //luis WO14157-14159 : fim
end;

//andre tavares - pendência 22079 - 14/07/2006
procedure TfrmLancDocCAPCAR.dblcTipoDocChange(Sender: TObject);
begin
  inherited;
  cdsPortForma.filtered := false;
  if trim(dblcTipoDoc.LookupValue) <> '' then
  begin
    cdsPortForma.filter := ' CODTIPDOC = '+ dblcTipoDoc.LookupValue;
    cdsPortForma.filtered := true;
  end;
  cdsPortForma.filtered := not cdsPortForma.IsEmpty;

  dblcPortadorForma.LookupValue := '';
  dblcPortadorForma.Text := '';
end;

//início - andre tavares - pendência 22079 - 14/07/2006
function TfrmLancDocCAPCAR.EmitirBloqueto: Boolean;
begin
  result := true;
  try
    // se o portadorforma do documento emite ficha de compensação e não foi emitido então
    //  perguntar se quer emitir ficha de compensação
    //  se sim então
    //    chamar o form de emissão ficha de compensação preenchido
    if (not CdsPortForma.fieldByName('IDCONFIGBARRAS').IsNull) and (ParamIntegra.RecPag = 'R') and
       (trim(dblcPortadorForma.Text) <> '') and (_OperacaoLanc = opldEfetivo) and
       (Application.MessageBox('Deseja Emitir uma Ficha de Compensação?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
    begin
      _FrmConfigBarrasCMMT := TFrmConfigBarrasCMMT.Create(self);
      _FrmConfigBarrasCMMT.formStyle        := fsNormal;
      _FrmConfigBarrasCMMT.Visible := false;
      _FrmConfigBarrasCMMT.coddocumento     := trunc(_lancdoccapcar.coddocumento);
      _FrmConfigBarrasCMMT.idconfigBarras   := CdsPortForma.fieldByName('IDCONFIGBARRAS').asInteger;
      _FrmConfigBarrasCMMT.codportadorforma := CdsPortForma.fieldByName('CODPORTFORMA').asInteger;
      _FrmConfigBarrasCMMT.idtipocliente    := Modulo.IdTipoCliAdianto;
      _FrmConfigBarrasCMMT.codTipoDoc       := CdsTipoDoc.fieldByName('CODTIPDOC').asInteger;;
      _FrmConfigBarrasCMMT.idmodulo         := sistema.idmodulo;
      _FrmConfigBarrasCMMT.idusuario        := sistema.idusuario;
      _FrmConfigBarrasCMMT.HabilitaImpressao(true);
      _FrmConfigBarrasCMMT.ShowModal;
      _FrmConfigBarrasCMMT.Release;
    end;
  except
    result := false;
  end;//try
end;
//fim - andre tavares - pendência 22079 - 14/07/2006

//início - andre tavares - pendência 21603 - 27/07/2006
function TfrmLancDocCAPCAR.reprogDataVencto(const sTextoPergunta: string): boolean;
begin

  result := MsgDlg(sTextoPergunta,
                  'Confirmar', mtConfirmation, [mbYes,mbNo],0) = mrYes;

end;
//fim - andre tavares - pendência 21603 - 27/07/2006

procedure TfrmLancDocCAPCAR.ControlesReadyOnly(bLigar: boolean);
begin
   //Marcus Oliveira P. 23425 20/10/2006

   //Dados pra lançamento
   dbeHistorico.ReadOnly      := bLigar;
   PnlLancPrin.Enabled        := not(bLigar);
   pnlOpcao.Enabled           := not(bLigar);
   gbDatas.Enabled            := not(bLigar);
   GpBarras.Enabled           := not(bLigar);
   GpConta.Enabled            := not(bLigar);
   PnlGeral.Enabled           := not(bLigar);
   MemObs.ReadOnly            := bLigar;
   cmProcListaServicos.Enabled := not(bLigar);
   rgTipoNF.Enabled           := not(bLigar); //Cássio Rovaroto - WO 1728

end;

procedure TfrmLancDocCAPCAR.dbQtdeCotaChange(Sender: TObject);
var
  strCota: string;
  i: integer;
  iVirgulas: integer;
begin
  inherited;

  strCota := dbQtdeCota.Text;
  iVirgulas := 0;
  for i := 1 to length(strCota) do
  begin
     if (strCota[i] = ',') then
        inc(iVirgulas);

     if (iVirgulas > 1) then
     begin
        dbQtdeCota.Clear;
        break;
     end;
  end;

end;

procedure TfrmLancDocCAPCAR.EmptyDataSet(Dts: TDataSet);
begin
  Dts.First;
  while not Dts.Eof Do Dts.Delete;
end;

procedure TfrmLancDocCAPCAR.cdsDocPaiAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
end;


procedure TfrmLancDocCAPCAR.AtualizaPlanoPatro;
var
  recPlanoPatro: TDadosFinanceiro;
begin
  // Ricardo A. SOL 122623 KTN 603580
  if CdsDet.State in [ dsEdit, dsInsert ] then
  begin

      recPlanoPatro := _oDocumento.LocalizaPlanoPatroFinanceiro(
                        CdsDet.FieldByName( 'IDPESSOA' ).AsInteger,
                        //         _oDocumento.Codportforma,
                        Cds.FieldByName( 'CODPORTFORMA' ).AsInteger,
                        Cds.FieldByName( 'IDFORCLI' ).AsInteger,
                        CdsDet.FieldByName( 'IDPATROORIGEM' ).AsInteger,
                        CdsDet.FieldByName( 'IDPLANOORIGEM' ).AsInteger,
                        CdsDet.FieldByName( 'IDPROGRAMA' ).AsInteger,
                        CdsDet.FieldByName( 'RECPAG' ).AsString,
                        CdsDet.FieldByName( 'CODCENTROCUSTO' ).AsString,
                        CdsDet.FieldByName( 'CODTIPRECDES' ).AsString
                        );

      CdsDet.FieldByName( 'IDPATRO' ).AsInteger := recPlanoPatro.IdPatroFinanceiro;
      CdsDet.FieldByName( 'NOMEPATRO' ).AsString := recPlanoPatro.NomePatroFinanceiro;
      CdsDet.FieldByName( 'IDPLANOPREV' ).AsInteger := recPlanoPatro.IdPlanoFinanceiro;
      CdsDet.FieldByName( 'DESCPLANO' ).AsString := recPlanoPatro.DescPlanoFinanceiro;

      With CdsDet.FieldByName( 'TipoDespesa' ) do
        if recPlanoPatro.ReceitaDespesaAdministrativa Then
           AsInteger := 1
        Else
           AsInteger := 2;

  end;
end;

procedure TfrmLancDocCAPCAR.FazerAvaliacao;
var lCentRespons: String;
begin
  if Sistema.IdModulo = 3 then
  begin
    CdsDet.First;
    while not CdsDet.Eof do
    begin
      lCentRespons:= lCentRespons + ', ' + QuotedStr(CdsDet.FieldByName('CODCENTRORESPON').AsString);
      CdsDet.Next;
    end;
    Delete(lCentRespons, 1, 1);

    if CtrlAvaliacaoFornec.AvaliaFornec(lCentRespons) then
      JustificarFornec;
  end;
end;

procedure TfrmLancDocCAPCAR.JustificarFornec;
begin
   if not CtrlAvaliacaoFornec.TrazMesAtual(Cds.FieldByName('IDFORCLI').AsInteger, Cds.FieldByName('DATAEMISSAO').AsDateTime) then
   begin
     Application.MessageBox('Para a criação da AP é necessário realizar a avaliação do fornecedor', Pchar(ExtractFileName(Application.Title)), MB_ICONINFORMATION);
     AbrirAvaliacao;
   end else
   begin
     if MessageDlg('Deseja avaliar o Fornecedor?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       AbrirAvaliacao
     else
     begin
      flgServicoExec := false;    //higor Nayde Ferreira SOL 188852 KTN 1784376
      Application.CreateForm(TfrmJustificativa, frmJustificativa);
      frmJustificativa.pIdPessoa:= Cds.FieldByName('IDFORCLI').AsInteger;
      frmJustificativa.ShowModal;
     end;
   end;

end;

procedure TfrmLancDocCAPCAR.AbrirAvaliacao;
var
  frmCadForneAvalia: TfrmCadForne;
begin
    Application.CreateForm(TFrmCadForne, frmCadForneAvalia);
    if frmCadForneAvalia.FormStyle <> fsNormal then
    begin
      frmCadForneAvalia.FormStyle := fsNormal;
      frmCadForneAvalia.Visible := False;
    end;

    frmCadForneAvalia.nConsModulo:= 4;
    frmCadForneAvalia.nIdPessoa:= Cds.FieldByName('IDFORCLI').AsInteger;
    frmCadForneAvalia.DtEmissao:= Cds.FieldByName('DATAEMISSAO').AsDateTime;
    frmCadForneAvalia.WindowState:= wsMaximized;


    frmCadForneAvalia.ShowModal;
    frmCadForneAvalia.Release;

end;


Function TfrmLancDocCAPCAR.FazChamadaAlteradores: Boolean;
Var
   vObjAlteradores: tCtrlAlteradorImpostos;
   qryAux: TwwQuery;
   sSQL, sDescAlterador, sDescUnidNegoc: String;
Begin
   // Inicio SOL: 136242 Kintana: 813941 - JRM6
   // Propósito : Fazer chamada passando os parametros necessários ao
   //             Programa responsável pelo lançamento dos alteradores
   //             cadastrados para o tipo de desembolso.
   vObjAlteradores := Nil;
   //  1 - Testa se o objeto já foi criado
   If vObjAlteradores = Nil Then
      Begin
         vObjAlteradores := TCtrlAlteradorImpostos.create;
      End;
   //  2 - Preenche os campos necessários (Estes são do documento a pagar que se está criando.
   {}
   vObjAlteradores.p_IDPESSOA := Sistema.IdEmpresa;
   vObjAlteradores.p_CNPJBUSCAR := cmpforcli.forclireg.documento;
   vObjAlteradores.p_coddocumento := trunc(_lancdoccapcar.coddocumento + 1); // Cds.FieldByName('CODDOCUMENTO').AsInteger;
   vObjAlteradores.p_codTipRecDes := v_codtiporecdes;
   vObjAlteradores.p_numlancto := StrToInt64(v_numdoc); // Edilaine - SOL 199641 / KTN 1921256
   If (vObjAlteradores.p_coddocumento = 1) And (vCoddocumento_Alt <> 0) Then
      Begin
         vObjAlteradores.p_coddocumento := vCoddocumento_Alt + 1;
      End;
   {}
   vObjAlteradores.p_plncodigo := v_plncodigo;
   vObjAlteradores.p_datalancto := v_datamov;
   vObjAlteradores.p_valor := v_ValorMov;
   vObjAlteradores.p_VALORBRUTO := v_ValorMov;
   vObjAlteradores.p_debcre := v_recPag;
   {}
   vObjAlteradores.p_RecPag := v_recPag;
   //vObjAlteradores.p_historicocompl  :=  CdsDet.FieldByName( 'HISTORICOCOMPL' ).AsString;
   vObjAlteradores.p_estorno := V_Estorno;
   vObjAlteradores.p_codtipdoc := v_codtipdoc;
   vObjAlteradores.p_vlrliquido := V_Valormov;
   vObjAlteradores.p_numfatura := v_numfatura;
   {}
   vObjAlteradores.p_unidnegoc := Strtoint(v_unidnegoc);
   {}
   vObjAlteradores.p_FlgSimples := dbchkFlgSimples.Checked;
   vObjAlteradores.p_FlgEspecial := dbchkFlgEspecial.Checked;

   // SOL 189828 KTN 1794500 - Paulo Nobre
   vObjAlteradores.p_flgcontabiliza := 'S'; // Força a Contabilização
   vObjAlteradores.p_flgincideIRRF := CdsAlt.FieldByName('FLGINCIDEIRRF').AsString;
   vObjAlteradores.p_dscUnidNegoc := v_dscUnidNegoc;
   //

   //  3- Dispara a geração de alteradores.
   vObjAlteradores.VerificaAlteradores;

   // SOL 189828 KTN 1794500 - Paulo Nobre
   result := (vObjAlteradores.p_contagem > 0);

   // Término SOL: 136242 Kintana: 813941 - JRM6
End;

procedure TfrmLancDocCAPCAR.SalvaDadosParaAlteradores;
begin
  //  Início SOL: 136242 Kintana: 813941 - JRM6
  //  Salva os dados necessários à rotina de alteradores antes de efetivar o lancamento.
  //  Ao efetivar o lançamento os campos são todos limpos de forma que não podem ser usados
  //  Posteriormente.
  {}
  v_codtiporecdes :=  CdsDet.FieldByName('CODTIPRECDES').AsStrIng;
  v_numdoc        :=  IntToStr( Trunc( dbenNumDoc.value ) );
  v_datamov       :=  Cds.FieldByName('DATAVENCTO').AsDateTime;
  v_ValorMov      :=  CdsDet.FieldByName('VALOR').AsFloat;
  v_recPag        :=  CdsDet.FieldByName( 'RECPAG' ).AsString;
  v_estorno       :=  Cds.FieldByName('ESTORNO').AsInteger;
  v_plncodigo     :=  Cds.FieldByName('PLNCODIGO').AsInteger;
  v_codtipdoc     :=  Cds.FieldByName('CODTIPDOC').AsInteger;
  v_numfatura     :=  Cds.FieldByName('NUMFATURA').AsString;
  v_unidnegoc     :=  CdsDet.FieldByName('UNIDNEGOC').AsString;
  // Término SOL: 136242 Kintana: 813941 - JRM6
   // SOL 189828 KTN 1794500 - Paulo Nobre
   v_dscUnidNegoc := DclAtivProjeto.text;

   // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmLancDocCAPCAR.btnInsereAlteradoresClick(Sender: TObject);
var ict, iconta: Integer;
begin
  inherited;
  iConta := 0;
  //  Início SOL: 136242 Kintana: 813941 - JRM6
  if sbtnAlterar.Down then
  begin
    // Preenche os campos com os dados para gerar os alteradores
    SalvaDadosParaAlteradores;
    // Acerta o Numero do documento
    vCoddocumento_Alt := ( Cds.FieldByName('CODDOCUMENTO').asInteger );
    v_datamov         := Date;
    iConta            := 0;
    {}
    // Roda rotina de Inserção dos alteradores automáticos;
    FazChamadaAlteradores;
    //  Realiza o refresh do dataset dos alteradores.
    SQLAlteradores.Prepare;
    SQLAlteradores.ParambyName('CODDOCUMENTO').AsInteger := vCoddocumento_Alt;
    SQLAlteradores.Open;

    //  Muda para aba de alteradores
    for Ict := 0 to 3 do
      pgCtrlDetalhe.SelectNextPage( True );

  end;
  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmLancDocCAPCAR.bbtnConfirmarClick(Sender: TObject);
var vdocumento, vidforcli,vnodcumento : integer; //Higor - SOL 188852 Kintana 1784376
    sflgservico : string;  //Higor - SOL 188852 Kintana 1784376
begin
//  Início SOL: 136242 Kintana: 813941 - JRM6
  //  Foi implementado um Try... Finally com teste pelo botao inserir, de modo
  //  a garantir que a geracao automatica de alteradores ocorra somente na inclusao.
  Cds.FieldByName('PARTEFUNCEF').asstring := sProcFuncef;                      //luis WO14157-14159
  Cds.FieldByName('NUMPROCESSO').asstring := edtNumeroProc.text;               //luis WO14157-14159
  try //higor Nayde Ferreira SOL 188852 KTN 1784376 Inicio
     if (MsgDlg('O Serviço foi executado?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrYes) then  begin
     //if MessageDlg('O Serviço foi executado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       FlgServicoExec := true;
       FlgExec  := 'S'
     end
     else  begin
       FlgServicoExec := false;
       FlgExec := 'N';
     end;

      if SbtnInserir.down then
        SalvaDadosParaAlteradores;

       vnodcumento := Cds.FieldByName('NODOCUMENTO').AsInteger;
       vidforcli  := Cds.FieldByName('IDFORCLI').AsInteger;
      
      inherited;
      //flgServicoExec
      if FlgServicoExec then
            sflgservico := 'S'
      else
           sflgservico := 'N';

      vdocumento := CtrlAvaliacaoFornec.BuscaDocumento(vnodcumento,vidforcli);
      if(vdocumento <> 0) then begin
        CtrlAvaliacaoFornec.AtualizaAvaliaDocumento(vnodcumento, vdocumento,
        strTOint(CtrlAvaliacaoFornec.BuscaAvaliacao(vidforcli)),vidforcli,FlgExec,sflgservico,'S');
      end;
      FlgExit:= true;

    // Se o coddocumento estiver preenchido significa que foi gerado um registro valido.
    {
    if trunc( _lancdoccapcar.coddocumento ) <> 0 then
      // Se a condicao abaixo for satisfeita, significa que esta incluindo.
      if SbtnInserir.down then
        FazChamadaAlteradores;
    {}    //higor Nayde Ferreira SOL 188852 KTN 1784376 fim
  finally
    btnInsereAlteradores.Enabled := False;
  end;
  // Término SOL: 136242 Kintana: 813941 - JRM6
end;

procedure TfrmLancDocCAPCAR.SetRATEIO_ORCAMENTO;
begin
  Assert(cdsDet.State in [dsInsert, dsEdit], 'State inválido para CdsDet!');

  cdsDet.FieldByName('DESC_RATEIO_ORCAMENTO').AsString := //cdsDet.FieldByName('CODCENTROCUSTO').AsString
                                                          CdsCentroCusto.FieldByName('Nome').AsString
                                                        + ' - ' + CdsTipoRD.FieldByName('DESCRICAO').AsString;

  //Determina um ID se necessário
  With cdsDet.FieldByName('IDRATEIO_ORCAMENTO') do
    if AsInteger = 0 Then
    Begin
       Inc(IDRATEIO_ORCAMENTO);
       AsInteger := IDRATEIO_ORCAMENTO;
    End;

end;

procedure TfrmLancDocCAPCAR.FormDestroy(Sender: TObject);
begin
  inherited;
  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  cboAlteradoresDescRateio.LookUpTable := Nil;
  FreeAndNil(CdsRateioAlteradorFDO);
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
end;

procedure TfrmLancDocCAPCAR.PreencheComboRateio;
begin
  CdsRateioAlteradorFDO.Data  := CdsDet.Data;
end;

procedure TfrmLancDocCAPCAR.dsDetDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  if (Field <> NIL) AND
     (CdsDet.State In ([dsInsert,dsEdit])) AND
     (Field.FieldName = 'CODTIPRECDES') Then
     SetRATEIO_ORCAMENTO;
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

end;

//Higor Nayde - SOL 188852 Kintana 1784376 - Início

procedure TfrmLancDocCAPCAR.CmpForCliChange(Sender: TObject);   //higor Nayde Ferreira SOL 188852 KTN 1784376 INICIO
begin
  //William Moreira da Silva - SOL 250751
  {If CmpForCli.Valida = VcOk Then
      Begin
         FlgExit := false;
         if (CtrlAvaliacaoFornec.VerificaQualificacao(Cds.FieldByName('IDFORCLI').AsInteger))then begin
           MsgDlg('Este fornecedor possui 04 ou mais qualificações técnicas negativas!', 'Atenção', mtInformation, [mbOk],0);
         end;
         if (dbenNumDoc.canfocus) then
            dbenNumDoc.setfocus;  // Macete usado para forçar a saída do campo a assim atualizar os ponteiros de dados (Cds e o registro da classe)
         FlgExit := true;
         {showmessage(inttostr(CmpForCli.ForCliReg.Id));
         if (_LancDocCapCar.VerificaQualificacao(Cds.FieldByName('IDFORCLI').AsInteger))then begin
            MsgDlg('Este fornecedor possui 04 ou mais qualificações técnicas negativas!', 'Atenção', mtInformation, [mbOk],0);
         end; }
      //End;

  // Inherited;
  //William Moreira da Silva - SOL 250751
end;      //higor Nayde Ferreira SOL 188852 KTN 1784376 FIM

procedure TfrmLancDocCAPCAR.FormShow(Sender: TObject);
begin
  inherited;
  FlgExit:=true;    //higor Nayde Ferreira SOL 188852 KTN 1784376
  rbPLANILHA.Enabled := false;    // WO8229 Ferrari
end;
//Higor Nayde SOL 188852 Kintana 1784376 - Fim


// edilaine - SOL 222006-17039 / PPM 712379
procedure TfrmLancDocCAPCAR.DbeNossoNoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #08 ]) then
     key := #0;
end;

// edilaine - SOL 222006-17039 / PPM 712379 - inicio
function TfrmLancDocCAPCAR.VerificaNossoNumero: boolean;
var
  tpRetorno : TRetornoOpNossoNumero;
begin
  Result := true;

  if ( CmeCadastro.Operacao in [ OpInserir ] ) then
  begin
    {RN14: Verificar se na inclusao o campo NOSSONUMERO esta preenchido. Se estiver alterar status para 1 e emisbloq para 'S'}
    if Trim(cds.FieldByName('NOSSONUMERO').AsString) <> emptyStr then
    begin
      cds.FieldByName('EMISBLOQ').AsString := 'S';
      cds.FieldByName('STATUS').AsString   := '1';
    end
  end
  else if ( CmeCadastro.Operacao in [ OpAlterar ] ) then
  begin
    {RN16. Se o status estiver 0 (zero) e o campo Nosso Numero preenchido}
    if (Trim(cds.FieldByName('NOSSONUMERO').AsString) <> emptyStr) and
       (cds.FieldByName('STATUS').AsInteger = 0)then
    begin
      if _NossoNumero <> Trim(cds.FieldByName('NOSSONUMERO').AsString) then
      begin
        {RN16. se houve mudança o sistema deverá gravar o Nosso Numero, status = 1 e EmisBloq = S}
        cds.FieldByName('EMISBLOQ').AsString := 'S';
        cds.FieldByName('STATUS').AsString   := '1';
      end
      else
      begin
        {RN16 - Se não houve mudança, o sistema deverá exibir a Aba Geral e emitir a mensagem [MSG03]}
        pgctrlDetalhe.ActivePage := TbsGeral;
        tbcDetalhe.TabIndex := 5;
        tbsGeral.SetFocus;
        MsgOperacaoNossoNumero('Confirmação', 'Nosso Número não alterado!', imgLista, tpRetorno);

        if tpRetorno = trLanca then
        begin
          {RN17. Ao clicar em <Lançar> na mensagem [MSG03] da regra [RN16], o sistema deverá gravar o Nosso Numero,
                 alterar o status do documento para 1 e Emisbloq para "S"}
          cds.FieldByName('EMISBLOQ').AsString := 'S';
          cds.FieldByName('STATUS').AsString   := '1';
        end
        else if tpRetorno = trNaoLanca then
        begin
          {RN17. Ao clicar em <Não lançar> na mensagem [MSG03] da regra [RN16], o sistema deverá fechar a mensagem [MSG03]
                 e retornar a Aba Geral mantendo o registro em tela e o foco no campo Nosso Numero}
          dbeNossoNo.setFocus;
          Result := false;
        end
        else if tpRetorno = trApaga then
        begin
          {RN17. Ao clicar em <Apagar Nosso Numero e lançar> na mensagem [MSG03] da regra [RN16], o sistema deverá
                 apagar o Nosso Numero preenchido e seguir o fluxo normal da alteração do documento, mantendo o status
                 do documento como 0 (zero) e o identificador de boleto emitido (emisbloq) como "N" (Não).}
          cds.FieldByName('EMISBLOQ').AsString    := 'N';
          cds.FieldByName('STATUS').AsString      := '';
          cds.FieldByName('NOSSONUMERO').AsString := '';
        end;
      end;
    end;
  end;

end;


procedure TfrmLancDocCAPCAR.CmeCadastroDelete(Sender: TObject);
begin
  // edilaine - SOL 222006-17039 / PPM 712379 - inicio
  {RN02. Documentos com status 1 (um), não podem ser alterados e/ou excluídos.}
  if cds.FieldByName('STATUS').AsInteger = 1 then
  begin
    {RN22. A mensagem [MSG01] deverá ser emitida logo ao clicar em <EXCLUIR>, quando esta se enquadrar na regra [RN02]}
    AvisoDlg('Aviso', 'Este documento não pode ser alterado e/ou excluído.'+#10+'Existe boleto ou arquivo emitido', taCenter);
    Repaint;
    {RN24. O estado da tela quando executada as regras: [RN22] e [RN23] é: - Efeito do clique no botão <CANCELAR>}
    bbtnCancelar.Click;
    exit;
  end;

  {RN03. Documentos com status 2 (um), não podem ser alterados e/ou excluídos.}
  if cds.FieldByName('STATUS').AsInteger = 2 then
  begin
    {RN23. A mensagem [MSG02] deverá ser emitida logo ao clicar em <EXCLUIR>, quando esta se enquadrar na regra [RN03]}
    AvisoDlg('Aviso', 'Este documento não pode ser alterado e/ou excluído.'+#10+'Documento baixado', taCenter);
    Repaint;
    {RN24. O estado da tela quando executada as regras: [RN22] e [RN23] é: - Efeito do clique no botão <CANCELAR>}
    bbtnCancelar.Click;
    exit;
  end;
  // edilaine - SOL 222006-17039 / PPM 712379 - fim

  inherited;
end;

// Andre Imakawa - SIG20321 - Inicio

Function TfrmLancDocCAPCAR.ObrigaDadosBancarios(iBanco, iFormaPag: Integer): Boolean;
Begin
   Result := False;
   Case iBanco Of
      0: Result := (Not (iFormaPag In [30, 31]));
      1: Result := (iFormaPag In [1, 2, 4]);
      2, 3, 5, 6, 7, 8, 9, 10, 11, 12: Result := True;
      4, 17: Result := (Not (iFormaPag In [30, 31]));
      13, 14: Result := True;
   End;
End;

Function TfrmLancDocCAPCAR.ValidaCodBarrasSispag(sCodBarras: String; idv: Integer): Boolean;
Var
   sTipoCodigo, sAuxCodBarras, sProd: String;
   X, iBase, iDividendo, iDigito, I, Z, isprod: Integer;
   iCdigito: Array[0..3] Of Integer;
Begin
   Result := False;
   sTipoCodigo := '';
   Case idv Of
      10: //Composição da represantação numérica do código de barras - parte superior da ficha de compensação
         Begin
            sTipoCodigo := 'Superior';
            //Cálculo do DV Módulo 10 base 2
            If Length(sCodBarras) >= 33 Then
               Begin
                  //Cálculo do DV do Campo 1
                  iBase := 2;
                  iDividendo := 0;
                  I := 9;
                  sAuxCodBarras := Copy(sCodBarras, 1, 9);
                  For X := 1 To 9 Do
                     Begin
                        isprod := 0;

                        sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                        For Z := 1 To Length(sProd) Do
                           isprod := isprod + StrToInt(sProd[Z]);

                        iDividendo := iDividendo + isprod;
                        If iBase = 2 Then
                           iBase := 1
                        Else
                           Inc(iBase);
                        dec(I)
                     End;
                  iCdigito[0] := 10 - (iDividendo Mod 10);

                  //Cálculo do DV do Campo 2
                  iBase := 2;
                  iDividendo := 0;
                  I := 10;
                  sAuxCodBarras := Copy(sCodBarras, 11, 10);
                  For X := 1 To 10 Do
                     Begin
                        isprod := 0;

                        sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                        For Z := 1 To Length(sProd) Do
                           isprod := isprod + StrToInt(sProd[Z]);

                        iDividendo := iDividendo + isprod;
                        If iBase = 2 Then
                           iBase := 1
                        Else
                           Inc(iBase);
                        dec(I)
                     End;
                  iCdigito[1] := 10 - (iDividendo Mod 10);

                  //Cálculo do DV do Campo 3
                  iBase := 2;
                  iDividendo := 0;
                  I := 10;
                  sAuxCodBarras := Copy(sCodBarras, 22, 10);
                  For X := 1 To 10 Do
                     Begin
                        isprod := 0;

                        sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                        For Z := 1 To Length(sProd) Do
                           isprod := isprod + StrToInt(sProd[Z]);

                        iDividendo := iDividendo + isprod;
                        If iBase = 2 Then
                           iBase := 1
                        Else
                           Inc(iBase);
                        dec(I)
                     End;
                  iCdigito[2] := 10 - (iDividendo Mod 10);

                  //-------------------------------------------------------

                  For X := 0 To 2 Do
                     If iCdigito[X] = 10 Then iCdigito[X] := 0;

                  Result := ((iCdigito[0] = StrToInt(sCodBarras[10])) And
                     (iCdigito[1] = StrToInt(sCodBarras[21])) And
                     (iCdigito[2] = StrToInt(sCodBarras[32])));
                  {AND (iCDigito[3] = StrToInt(sCodBarras[33])));}
               End;
         End;

      11: //Composição do código de barras - parte inferior da ficha de compensação
         Begin
            sTipoCodigo := 'Inferior';
            //Cálculo do DV Módulo 11 base 9
            If Length(sCodBarras) >= 40 Then
               Begin
                  iBase := 2;
                  iDividendo := 0;
                  sAuxCodBarras := Copy(sCodBarras, 1, 4) + Copy(sCodBarras, 6, 39);
                  For X := 1 To 43 Do
                     Begin
                        iDividendo := iDividendo + (StrToInt(sAuxCodBarras[44 - X]) * iBase);
                        If iBase = 9 Then
                           iBase := 2
                        Else
                           Inc(iBase);
                     End;
                  iDigito := 11 - (iDividendo Mod 11);

                  If iDigito In [10, 11] Then iDigito := 1;

                  Result := (iDigito = StrToInt(sCodBarras[5]));
               End;
         End;
   End;

   If Not Result Then MsgAviso('Código de Barras ' + sTipoCodigo + ' Incorreto', 'Aviso');
End;

Function TfrmLancDocCAPCAR.ValidaCodBarrasArrecad(sCodBarras: String): Boolean;
Var
   iBlocoDigitos: Array[1..48] Of integer;
   iSomatorio: Array[1..48] Of integer;
   i, p, peso, resto: integer;
   dv1, dv2, dv3, dv4: integer;
Begin
   resto := 0;
   dv1 := 0;
   dv2 := 0;
   dv3 := 0;
   dv4 := 0;
   result := false;
   For i := 1 To 48 Do
      iSomatorio[i] := 0;

   // vare o string e pega cada dígito do código de barras
   p := 1;
   For i := 1 To length(sCodBarras) Do
      Begin
         If (sCodBarras[i] >= '0') And (sCodBarras[i] <= '9') Then
            Begin
               iBlocoDigitos[p] := strToInt(sCodBarras[i]);
               p := p + 1;
            End
      End;

   peso := 2;
   For i := 1 To 48 Do
      Begin
         If Not (i In [12, 24, 36, 48]) Then // posições dos dvs no array
            Begin
               iSomatorio[i] := (iBlocoDigitos[i] * peso);
               If iSomatorio[i] > 9 Then
                  iSomatorio[i] := iSomatorio[i] - 9;
               If peso = 2 Then
                  peso := 1
               Else
                  peso := 2;
            End
         Else
            peso := 2;
      End;

   // cálculo do dv1
   resto := 0;
   For i := 1 To 11 Do
      dv1 := dv1 + iSomatorio[i];
   If dv1 > 10 Then
      resto := dv1 Mod 10
   Else
      resto := dv1;
   If resto = 0 Then
      dv1 := 0
   Else
      dv1 := 10 - resto;

   // cálculo do dv2
   resto := 0;
   For i := 13 To 23 Do
      dv2 := dv2 + iSomatorio[i];
   If dv2 > 10 Then
      resto := dv2 Mod 10
   Else
      resto := dv2;
   If resto = 0 Then
      dv2 := 0
   Else
      dv2 := 10 - resto;

   // cálculo do dv3
   resto := 0;
   For i := 25 To 35 Do
      dv3 := dv3 + iSomatorio[i];
   If dv3 > 10 Then
      resto := dv3 Mod 10
   Else
      resto := dv3;
   If resto = 0 Then
      dv3 := 0
   Else
      dv3 := 10 - resto;

   // cálculo do dv4
   resto := 0;
   For i := 37 To 47 Do
      dv4 := dv4 + iSomatorio[i];
   If dv4 > 10 Then
      resto := dv4 Mod 10
   Else
      resto := dv4;
   If resto = 0 Then
      dv4 := 0
   Else
      dv4 := 10 - resto;

   result := (dv1 = iBlocoDigitos[12]) And (dv2 = iBlocoDigitos[24]) And
      (dv3 = iBlocoDigitos[36]) And (dv4 = iBlocoDigitos[48]);

   If Not Result Then
      MsgAviso('Código de Barras de Guia de Arrecadação Incorreto', 'Aviso');
End;

// Andre Imakawa - SIG20321 - Fim



procedure TfrmLancDocCAPCAR.dbLkpCbTipoServicoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //Cássio Rovaroto -  SIG nº 115585 - Início
	{if dbLkpCbTipoServico.DisplayValue <> '' then
  	cdsDet.FieldByName('SERVICO').AsString := 'S'
  else
    cdsDet.FieldByName('SERVICO').AsString := 'N';}
  cdsAlteradores.FieldByName('TIPOSERVICO').asString := dbLkpCbTipoServico.DisplayValue;
  //Cássio Rovaroto -  SIG nº 115585 - Fim
end;

function TfrmLancDocCAPCAR.VerificaLanctoCPRB: boolean;
var
	cdsAux : TClientDataSet;
  dValAliqCPRB : Double;
  sMsg: string;
	tRetorno: TRetornoOpLanctoCPRB;
begin
	//Cássio Rovaroto - SIG nº 23656.57673 - Início
  Result := True;
  //if not(bCPRBLancado) then
  //begin
  	cdsAux := TClientDataSet.Create(nil);

    try
    	cdsAux.Data := _LancDocCapCar.ListaDadosCPRBFornecedor(cds.FieldByName('IDFORCLI').asInteger);

      if not(cdsAux.IsEmpty) and ((bDesembolsoServico) and not(bExisteProcSusp))then
      begin
      	dValAliqCPRB := cdsAux.FieldByName('ALIQCPRB').AsFloat;
        sMsg := 'Necessário lançar a retenção de ' + FloatToStr(dValAliqCPRB) + '% de CPRB. Deseja realizá-lo?';
        MsgOpLanctoCPRB('Atenção', sMsg, imgLista, tRetorno);

        if tRetorno = trLancaAlt then
        begin
          Result := False;
          //bCPRBLancado := True;
          pgctrlDetalhe.ActivePage := TbsAlteradores;
          tbcDetalhe.TabIndex := 4;
          tbcDetalheChange(tbcDetalhe);
      	end
        else
        if tRetorno = trNaoLancaAlt then
        	if MsgDlg('Notas fiscais de serviço com cessão de mão de obra exigem retenção de CPRB. Confirma a ausência do lançamento?',
          					'Aviso', mtWarning, [mbYes, mbNo], 0) = mrNo then
          	Result := False;
 			end;
  	finally
  		FreeAndNil(cdsAux);
    end;
  //end;
  //Cássio Rovaroto - SIG nº 23656.57673 - Fim

end;

//SIG82262 -Inicio  -sOwner separados por "|OWNNER1.|OWNNER2.|OWNNER3.|"
function TfrmLancDocCAPCAR.SqlGrupoSubQuerySomatorio(sSQLInterno, sGroupBy, sOwner: String): String;
var
   sGroupTBLOwner,
   sOwnerTemp: String;
   i: Integer;
begin
   sOwnerTemp:= EmptyStr;
   sGroupTBLOwner:= StringReplace(sGroupBy, 'DISTINCT', EmptyStr, [rfReplaceAll, rfIgnoreCase]);
   for i:= 2 to Length(sOwner) do
     begin
        if (sOwner[i] = '|') then
           begin
              sGroupTBLOwner:= StringReplace(sGroupTBLOwner, sOwnerTemp, 'TBL.', [rfReplaceAll, rfIgnoreCase]);
              sOwnerTemp:= EmptyStr;
           end
        else sOwnerTemp:= sOwnerTemp + sOwner[i];
     end;

     Result:=
     'SELECT COUNT(TCO.RECPAG)AS PossuiGrupoOrcamen, '+ sGroupTBLOwner +#13+
     '  FROM ('+#13+
     '     SELECT '+ sGroupBy + #13+
           sSQLInterno + #13+
     '    )TBL '+ #13+
     ' LEFT JOIN Tipordxccxconta TCO ON TCO.CodTiPrecDes = TBL.CodTiPrecDes AND ' +#13+
     '      TCO.IDGRUPOORCAMEN IS NOT NULL ' +#13+
     ' GROUP BY '+ sGroupTBLOwner;
end;
//SIG82262 -Fim

procedure TfrmLancDocCAPCAR.edNumFDOKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', '-', '/', #8, #9]) then
     key := #0;
end;

procedure TfrmLancDocCAPCAR.rbFDOClick(Sender: TObject);
begin
  inherited;
  if rbFDO.checked then
  begin
    dblkCResponsa.enabled    := True;
    edNumFDO.enabled := True;
    DBcboGrupoRateio.enabled := False;
    sbtnSelArquivo.enabled   := False;
    if cdsCentroRespon.isEmpty then
       cdsCentroRespon.Data := CtrlCentRespon.GetCentResponPadrao(Sistema.IdEmpresa);
  end;
end;

procedure TfrmLancDocCAPCAR.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
  cdsAlteradores.First;
  bExisteProcSusp := False;
  while not cdsAlteradores.Eof do
  begin
    if not cdsAlteradores.FieldByName('IDTIPOSERVICO').IsNull then
    begin
      bDesembolsoServico := True;
      Break;
    end
    else
      bDesembolsoServico := False;
    cdsAlteradores.Next;
  end;
end;

procedure TfrmLancDocCAPCAR.dbLkpCbProcCPRBCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsAlteradores.FieldByName('NUMPROCESSO').asString := dbLkpCbProcCPRB.DisplayValue;
end;

function TfrmLancDocCAPCAR.LancamentoAlteradoresTributacao(
  IdServico: Integer): Boolean;
begin
  Result := False;
  cdsAltTributo := TCMClientDataSet.Create(nil);
  try
    cdsAltTributo.Data := CtrlListaServicos.GetTipoTributacaoServico(IdServico);

    if not cdsAltTributo.IsEmpty then
    begin
      if not VerificaAlteradorTribLancado(IdServico) then
      begin
        if MsgDlg('Deseja fazer o registro de tributação?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNO then
        begin
          if MsgDlg('Deseja continuar o lançamento?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYES then
          begin
            MsgDlg('Este lançamento indica a inclusão de tributação. ' + #13#10 +
                   'Faça o lançamento, se necessário, após o registro do documento', 'Aviso', mtWarning, [mbOK], 0);
            Result := True;
          end
          else
            Result := False;
        end
        else
        begin
          while not cdsAltTributo.Eof do
          begin
            Result := RegistraDadosAlterador(IdServico, cdsAltTributo.FieldByName('TIPOTRIBUTO').asInteger);
            if Result then
              cdsAltTributo.Next
            else
              Exit;
          end;
        end;
      end
      else
        Result := True;
    end
    else
      Result := True;
  finally
    FreeAndNil(cdsAltTributo);
  end;
end;

function TfrmLancDocCAPCAR.RegistraDadosAlterador(
  iIdServico, iTipoTributo: Integer; iTipoOperacao: Integer): Boolean;
var
  cdsAux: TCMClientDataSet;
  iCodAlterador: Integer;
  sDescAlterador: string;
  dAliquota : Double;
  sAcrescDesc: string;
  iPeriodoTributacao: Integer;
begin
  Result := False;
  cdsAux := TCMClientDataSet.Create(nil);
  try
    cdsAux.Data := CtrlListaServicos.GetAlteradorTributacaoServico(iIdServico, iTipoTributo);

    if iTipoOperacao = 0 then
    begin
      if not cdsAlteradores.Locate('CODALTERADOR', cdsAux.FieldByName('CODALTERADOR').asInteger, [loCaseInsensitive, loPartialKey]) then
      begin

          if cdsAux.RecordCount = 1 then
          begin
            iCodAlterador := cdsAux.FieldByName('CODALTERADOR').asInteger;
            sDescAlterador := cdsAux.FieldByName('DESCRICAO').asString;
            dAliquota := cdsAux.FieldByName('ALIQUOTA').asFloat;
            sAcrescDesc := cdsAux.FieldByName('ACRESDECRES').asString;
            iPeriodoTributacao := cdsAux.FieldByName('PERTRIBUTO').asInteger;
            Result := True;
          end
          else
          begin
            try
              frmSelAltTributacao := TfrmSelAltTributacao.Create(Application);
              frmSelAltTributacao.Visible := False;
              frmSelAltTributacao.cdsAlteradores.Data  := CtrlListaServicos.GetAlteradorTributacaoServico(iIdServico, iTipoTributo);
              frmSelAltTributacao.lblText2.Caption := cdsAux.FieldByName('DESC_TIPOTRIBUTO').asString +
                                                      ' possui mais de um tipo de alterador.';
              frmSelAltTributacao.ShowModal;
              iCodAlterador := frmSelAltTributacao.iCodAlterador;
              sDescAlterador := frmSelAltTributacao.sDescricao;
              dAliquota := frmSelAltTributacao.dAliquota;
              sAcrescDesc := frmSelAltTributacao.sAcrescDesc;
              iPeriodoTributacao := frmSelAltTributacao.iPeriodoTributacao;

              Result := frmSelAltTributacao.bOperacaoOK;
            finally
              FreeAndNil(frmSelAltTributacao);
            end;
          end;

          if Result then
          begin
            try
              cdsAlteradores.Append;
              CdsAlteradores.FieldByName('DESCRICAO').AsString := sDescAlterador;
              cdsAlteradores.FieldByName('CODALTERADOR').asInteger := iCodAlterador;
              cdsAlteradores.FieldByName('VALOR').asFloat := StrToFloat(FormatFloat('#0.00', cds.FieldByName('VALOR').asFloat * (dAliquota/100))); // Cássio Rovaroto - WO 3524
              cdsAlteradores.FieldByName('VALOROUTRAMOEDA').asFloat := 0.00;
              cdsAlteradores.FieldByName('VLRLIQUIDO').asFloat := StrToFloat(FormatFloat('#0.00', (cds.FieldByName('VALOR').asFloat * (dAliquota/100)))); // Cássio Rovaroto - WO 3524
              cdsAlteradores.FieldByName('HISTORICOCOMPL').asString := EmptyStr;
              cdsAlteradores.FieldByName('UNIDNEGOC').asInteger := -1;

              if iPeriodoTributacao = 0 then
                cdsAlteradores.FieldByName('DATALANCTO').asDatetime := dbeDataLanc.Date
              else
                cdsAlteradores.FieldByName('DATALANCTO').asDatetime := dbeDataVenc.Date;

              cdsAlteradores.FieldByName('VALORBASERETENCAO').asFloat := cds.FieldByName('VALOR').asFloat;
              cdsAlteradores.FieldByName('DEBCRE').asString := sAcrescDesc;
              cdsAlteradores.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
              cdsAlteradores.FieldByName('CONTABILIZA').asString := 'S';
              cdsAlteradores.FieldByName('TIPOLANCALT').asInteger := 1;
              cdsAlteradores.Post;
            except
              on e: Exception do
              begin
                Result := False;
                MsgDlg('Não possível registrar o alterador (' + e.Message + ')', 'Erro', mtError, [mbOK], 0);
              end;
            end;
          end
          else
          begin
            cdsAlteradores.DisableControls;
            cdsAlteradores.Filtered := False;
            cdsAlteradores.Filter := 'TIPOLANCALT = 1';
            cdsAlteradores.Filtered := True;

            while not cdsAlteradores.Eof do
            begin
              cdsAlteradores.Delete;
              cdsAlteradores.Next;
            end;
            cdsAlteradores.Filtered := False;
            cdsAlteradores.First;
            cdsAlteradores.EnableControls;

            MsgDlg('O registro de tributação não foi realizado. ', 'Aviso', mtWarning, [mbOK], 0);
            Result := False;
          end;
      end
      else
        Result := True;
    end
    else
    begin
      if cdsAlteradores.Locate('CODALTERADOR', cdsAux.FieldByName('CODALTERADOR').asInteger, [loCaseInsensitive, loPartialKey]) then
      begin
        iPeriodoTributacao := cdsAux.FieldByName('PERTRIBUTO').asInteger;
        try
          cdsAlteradores.Edit;
          if iPeriodoTributacao = 0 then
            cdsAlteradores.FieldByName('DATALANCTO').asDatetime := dbeDataLanc.Date
          else
            cdsAlteradores.FieldByName('DATALANCTO').asDatetime := dbeDataVenc.Date;
          cdsAlteradores.Post;
        except
          on e: Exception do
          begin
            Result := False;
            MsgDlg('O registro de alteração da data de tributação não foi realizado.', 'Erro', mtError, [mbOK], 0);
          end;
        end;
          Result := True;
      end
      else
        Result := True;
    end;
  finally
    FreeAndNil(CdsAux);
  end;
end;

procedure TfrmLancDocCAPCAR.cmProcListaServicosValidaDados(
  Sender: TObject);
begin
  inherited;
  if msListaServico.RetornouValor then
  begin
    _IdServico:= StrToInt(msListaServico.ValoresChave[0]);
    _CodNaturezaREINF := StrToInt(msListaServico.ValoresChave[1]);

    if CmeCadastro.Operacao = opAlterar then
    begin
      MsgDlg('Documentos em alteração devem ter sua tributação lançada manualmente, ' +#13#10+
             'através da funcionalidade Lançamento de Alteradores.', 'Aviso', mtInformation, [mbOK], 0);
      btnAddAlteradores.Visible := False;
    end
    else
    begin
      btnAddAlteradores.Visible := (CtrlListaServicos.ExisteTributacaoServico(_IdServico)) and (rgTipoNF.ItemIndex <> 0);
      iCalcTributos := 0;

      if dbchkFlgSimples.Checked then
      begin
        btnAddAlteradores.Visible := False;
        MsgDlg('Empresas optantes pelo Simples Nacional não possuem tributação aplicável.', 'Aviso', mtInformation, [mbOK], 0);
      end;
    end;

  end;
end;

function TfrmLancDocCAPCAR.VerificaAlteradorTribLancado(iIdServico: Integer): Boolean;
var
  iTipoTributoAnt, iTributoLanc, iAltLanc: Integer;
  cdsAux: TClientDataSet;
begin
  Result := False;
  iAltLanc := 0;
  iTributoLanc := 0;
  iTipoTributoAnt := -1;
  cdsAux := TClientDataSet.Create(nil);
  try
    cdsAux.Data := CtrlListaServicos.ListTributacaoServico(iIdServico);

    if not cdsAlteradores.IsEmpty then
    begin
      while not cdsAux.Eof do
       begin
        if cdsAlteradores.Locate('CODALTERADOR', cdsAux.FieldByName('CODALTERADOR').asInteger, [loCaseInsensitive, loPartialKey]) then
          Inc(iAltLanc);

        if (iTipoTributoAnt <> cdsAux.FieldByName('TIPOTRIBUTO').asInteger) then
         Inc(iTributoLanc);

        iTipoTributoAnt := cdsAux.FieldByName('TIPOTRIBUTO').asInteger;
        cdsAux.Next;
       end;

       if iAltLanc = iTributoLanc then
        Result := True;
    end;

  finally
    FreeAndNil(cdsAux);
  end;
end;

procedure TfrmLancDocCAPCAR.btnAddAlteradoresClick(Sender: TObject);
var
  bOk: Boolean;
begin
  inherited;
  bOk := False;
  Inc(iCalcTributos);

  if Sistema.IdModulo = 3 then
    bOK := LancamentoAlteradoresTributacao(_IdServico);

  if bOk then
  begin
    pgctrlDetalhe.ActivePage := tbsAlteradores;
    tbcDetalhe.TabIndex := 4;
    tbcDetalheChange(tbcDetalhe);
    AtualizaSaldo;
  end;

end;

function TfrmLancDocCAPCAR.ExcluiAlteradoresTributacao: Boolean;
begin
  Result := False;
  try
    cdsAlteradores.DisableControls;
    cdsAlteradores.First;

    while not cdsAlteradores.Eof do
    begin
      if cdsAlteradores.FieldByName('TIPOLANCALT').asInteger = 1 then
        cdsAlteradores.Delete;
      cdsAlteradores.Next;
    end;
  except
    Result := False
  end;
end;

procedure TfrmLancDocCAPCAR.rgTipoNFClick(Sender: TObject);
begin
  inherited;
  if (rgTipoNF.ItemIndex = 0) then
  begin
    cmProcListaServicos.Text := EmptyStr;
    if Cds.state in [dsInsert, dsEdit] then                  //POS-MIGRACAO
       Cds.FieldByName('NFSSERVICO').AsInteger := -1;
    _IdServico:= -1;
    _CodNaturezaREINF := -1;
    cmProcListaServicos.Enabled := False;
  end
  else
    cmProcListaServicos.Enabled := True;
  btnAddAlteradores.Visible := (rgTipoNF.ItemIndex = 1) and (Cds.FieldByName('NFSSERVICO').AsInteger > 0) and not (dbchkFlgSimples.Checked);
end;

function TfrmLancDocCAPCAR.AlteracaoAlteradoresTributacao(
  IdServico: Integer): Boolean;
begin
  Result := False;
  cdsAltTributo := TCMClientDataSet.Create(nil);
  try
    cdsAltTributo.Data := CtrlListaServicos.GetTipoTributacaoServico(IdServico);

    if not cdsAltTributo.IsEmpty then
    begin
      if VerificaAlteradorTribLancado(IdServico) then
      begin
        cdsAlteradores.First;
        while not cdsAltTributo.Eof do
        begin
          Result := RegistraDadosAlterador(IdServico, cdsAltTributo.FieldByName('TIPOTRIBUTO').asInteger, 1);
          if Result then
            cdsAltTributo.Next
          else
            Exit;
        end;
      end;
    end
    else
      Result := True;
  finally
    FreeAndNil(cdsAltTributo);
  end;
end;

//luis WO14157-14159 : inicio
procedure TfrmLancDocCAPCAR.rgFuncefClick(Sender: TObject);
begin
  inherited;
  Case rgFuncef.itemindex Of
    0: sProcFuncef := 'S';
    1: sProcFuncef := 'N';
  End;
end;
//luis WO14157-14159 : fim


// Inicio WO8229 Ferrari
procedure TfrmLancDocCAPCAR.sbtnSelArquivoClick(Sender: TObject);
var
  iNumFalhas,iNumOK    : integer;
begin
  inherited;
  if odAbreArq.Execute then
    begin
      edtArquivo.Text := odAbreArq.FileName;
      sbtnSelArquivo.Down := False;
      iNumFalhas := 0;
      iNumOK := 0;
      setlength(vDadosProntos, 0);
      dbgrdDet.visible := False;
      pnlResultado.visible := True;
      pnlCorrecaoRateio.visible := False;
      ValidaArquivo(iNumFalhas,iNumOK, vDadosProntos);
   end;
end;
// Fim WO8229 Ferrari

// Inicio WO8229 Ferrari
procedure TfrmLancDocCAPCAR.ValidaArquivo(var iNumFalhas : integer; var iNumOK :Integer; var vDadosProntos: TArrayImportaRateio);
var
  Excel, oSheet   : Variant;
  iLinha,iCol,iaba: integer;
  sCampo          : string;
  TipoColuna      : TTipoDado;
  TipoOpcao       : TOpcaoColuna;
  sValor          : string;
  sPreparo        : integer;
  sAnoMesVig      : string;
  DadosImportacao : TRecDadosRateio;
  bErro           : boolean;
  sMensagem       : string;
  aba             : byte;
  i,linha,iNoOK   : Integer;
begin
  inherited;


  Screen.Cursor := crHourGlass;

  memResultado.Clear;
  iaba := 1;
  iNoOK := 0;
  // definindo numero de colunas do arquivo e cabeçalho
  SetLength(vColunasArq, 8);
  for iCol := Low(vColunasArq) to High(vColunasArq) do
  begin
    case iCol of
      0 : sCampo := 'ID-Atividade/Projeto';
      1 : sCampo := 'ID-Centro Responsabilidade';
      2 : sCampo := 'ID-Tipo Desembolso';
      3 : sCampo := 'ID-Centro Custo';
      4 : sCampo := 'Programa';
      5 : sCampo := 'Patrocinadora';
      6 : sCampo := 'Plano Previdenciario';
      7 : sCampo := 'Valor';
    end;
    vColunasArq[iCol] := AnsiUpperCase(sCampo);
  end;

  // definindo o tipo das colunas
  SetLength(vColunaTipo, 8);
  for iCol := Low(vColunaTipo) to High(vColunaTipo) do
  begin
    case iCol of
            3,4,5,6 : TipoColuna := tdInteger;
              0,1,2 : TipoColuna := tdString;
                  7 : TipoColuna := tdReal;
    end;
    vColunaTipo[iCol] := TipoColuna;
  end;

  // definindo a obrigatoriedade das colunas
  SetLength(vColunaOpcao, 8);
  for iCol := Low(vColunaOpcao) to High(vColunaOpcao) do
  begin
    case iCol of
      0,1,2,3,4,5,6,7: TipoOpcao := ocObrigatoria ;
       else  TipoOpcao := ocOpcional;
    end;
    vColunaOpcao[iCol] := TipoOpcao;
  end;

  // Cria o objeto
  Excel := CreateOleObject('Excel.application');
  Excel.Visible := False;
  // Abre o Arquivo
  Excel.WorkBooks.Open(ExpandUNCFileName(odAbreArq.FileName),1);
  for aba := 1 to Excel.Workbooks[1].sheets.Count -1 do
     if Excel.WorkBooks[1].Sheets[aba].Name = 'importacao' then
       begin
         iaba := aba;
         break;
       end;


  // Indica a partir de qual linha começar a pegar os registros
  iLinha := 2;

  try
     // Valida o layout do arquivo excel
     dTotal := 0;
     if (ValidaLayout(Excel, vColunasArq)) and (Excel.WorkBooks[1].Sheets[aba].Name = 'importacao') then
     begin
       memResultado.Lines.Add('Resultado Validação do Arquivo de Importação:') ;
       memResultado.Lines.Add(edtArquivo.text) ;
       memResultado.Lines.Add('') ;
       if UltimaLinha(Excel, iLinha, 5, length(vColunasArq)) then
       begin
         memResultado.Lines.Add('O arquivo selecionado não possui informações.') ;
         inc(iNumFalhas);
       end
       else
       begin

         while not UltimaLinha(Excel, iLinha, 5, length(vColunasArq)) do
         begin
           if ValidaLinhaVazia(Excel,iLinha,length(vColunasArq)) then
           begin
             memResultado.Lines.Add('Linha '+ inttostr(iLinha)+', Vazia...') ;
             inc(iLinha);
             continue;
           end;
           //zerando valores
           DadosImportacao.iIdAtividade               := '';
           DadosImportacao.iIdCentroResponsabilidade  := '';
           DadosImportacao.iIdTipoDesembolso          := '';
           DadosImportacao.iIdCentroCusto             := -1;
           DadosImportacao.iIdPrograma                := -1;
           DadosImportacao.iIdPatro                   := -1;
           DadosImportacao.iIdPlanPrev                := -1;
           DadosImportacao.dValor                     := -1;

           // validando o tipo de dado das colunas e preenchimento
           for iCol := Low(vColunasArq) to High(vColunasArq) do
           begin

             if ValidaDadosColunaExcel(iLinha, iCol+1, Excel, vColunasArq[iCol], vColunaTipo[iCol], vColunaOpcao[iCol], memResultado, iaba, iNumFalhas) then
               sValor := Trim(VarToStr(Excel.workbooks[1].sheets[iaba].cells[iLinha, iCol+1].Value));
               // valida regras especificas do campo
               case iCol of
                 0 : DadosImportacao.iIdAtividade := sValor;
                 1 : DadosImportacao.iIdCentroResponsabilidade := sValor;
                 2 : DadosImportacao.iIdTipoDesembolso := sValor;
                 3 : DadosImportacao.iIdCentroCusto := strtoint(sValor);
                 4 : DadosImportacao.iIdPrograma := strtoint(sValor);
                 5 : DadosImportacao.iIdPatro := strtoint(sValor);
                 6 : DadosImportacao.iIdPlanPrev := strtoint(sValor);
                 7 : DadosImportacao.dValor := strtofloat(sValor);
               end;
           end;

           // verifica se dados preenchidos corretamente para importacao
           if (DadosImportacao.iIdAtividade <> '') and (DadosImportacao.iIdCentroResponsabilidade <> '-1') and
              (DadosImportacao.iIdTipoDesembolso <> '-1') and (DadosImportacao.iIdCentroCusto <> -1)   and
              (DadosImportacao.iIdPrograma <> -1)  and (DadosImportacao.iIdPatro <> -1)  and
              (DadosImportacao.iIdPlanPrev <> -1) and (DadosImportacao.dValor <> -1) then
             begin
               memResultado.Lines.Add(DadosImportacao.iIdAtividade + '    ' + DadosImportacao.iIdTipoDesembolso + '  Registro OK...') ;
               inc(iNumOK);
             end
           else
             begin
              memResultado.Lines.Add('Linha '+ inttostr(iLinha)+', Registro Inconsistente...') ;
              inc(iNoOK);
             end;

           setlength(vDadosProntos, high(vDadosProntos)+2);

           vDadosProntos[high(vDadosProntos)].iIdAtividade                   := DadosImportacao.iIdAtividade;
           vDadosProntos[high(vDadosProntos)].iIdCentroResponsabilidade      := DadosImportacao.iIdCentroResponsabilidade;
           vDadosProntos[high(vDadosProntos)].iIdTipoDesembolso              := DadosImportacao.iIdTipoDesembolso;
           vDadosProntos[high(vDadosProntos)].iIdCentroCusto                 := DadosImportacao.iIdCentroCusto;
           vDadosProntos[high(vDadosProntos)].iIdPrograma                    := DadosImportacao.iIdPrograma;
           vDadosProntos[high(vDadosProntos)].iIdPatro                       := DadosImportacao.iIdPatro;
           vDadosProntos[high(vDadosProntos)].iIdPlanPrev                    := DadosImportacao.iIdPlanPrev;
           vDadosProntos[high(vDadosProntos)].dValor                         := DadosImportacao.dValor;
           dTotal := dTotal + DadosImportacao.dValor;

           // Contador de linha
           inc(iLinha);
         end;
       end;

       memResultado.Lines.Add('------------------------------------------------------------------');
       memResultado.Lines.Add('Total de inconsistências...: '+IntToStr(iNumFalhas));
       memResultado.Lines.Add('Total de registros OK......: '+IntToStr(iNumOK));
       memResultado.Lines.Add('Total de registros Não OK..: '+IntToStr(iNoOK));
       memResultado.Lines.Add('Total de registros Planilha: '+IntToStr(iLinha-7));  //tira o cabeçalho e as 11 linhas de final da planilha
       iNumeroTotal := (iLinha-7);
       iNumeroOK := iNumOK;
       // Transferindo para cdsPadraoRateio
       cdsPadraoRateio.Data := _LancDocCapCar.getCamposRateio;
       for i := low(vDadosProntos) to high(vDadosProntos) do
         begin
           linha := i + 2;
           // inserção da Planilha no cdsPadraoRateio
           if CdsCentroRespon.Locate('CODCENTRORESPON', vDadosProntos[i].iIdCentroResponsabilidade, []) then
             SelecionaTipoDesembolso;
           cdsPadraoRateio.Insert;
           cdsPadraoRateio.FieldByName('IDPADRRATEIODOC').asString := '0';
           cdsPadraoRateio.FieldByName('IDGRUPORATEIO').asString := '0';
           if CdsProgramaPrev.Locate('IDPROGRAMA',vDadosProntos[i].iIdPrograma, []) then
             begin
               cdsPadraoRateio.FieldByName('IDPROGRAMA').asString := IntToStr(vDadosProntos[i].iIdPrograma);
               cdsPadraoRateio.FieldByName('DESCPROGRAMA').AsString := CdsProgramaPrev.FieldByName('DESCPROGRAMA').AsString;
               cdsPadraoRateio.FieldByName('FLGIDPROGRAMA').asString := 'S';
               // flag = 0
             end                                                                                      
           else                                                                                       
             begin                                                                                    
               memResultado.Lines.Add('Programa não localizado, linha '+ inttostr(linha)) ;
               cdsPadraoRateio.FieldByName('FLGIDPROGRAMA').asString := 'N' ;
          //     raise EValidacao.CreateVal('Programa não localizado!', btnGrupoRateio);
             end;
           cdsPadraoRateio.FieldByName('IDEMPRESAPROP').asString := inttostr(vDadosProntos[i].iIdPatro);
           cdsPadraoRateio.FieldByName('RECPAG').asString := 'P';
           if CdsTipoRD.Locate('CODTIPRECDES', vDadosProntos[i].iIdTipoDesembolso, []) then
             begin
               cdsPadraoRateio.FieldByName('CODTIPRECDES').asString := vDadosProntos[i].iIdTipoDesembolso;
               cdsPadraoRateio.FieldByName('TIPODESEMBOLSO').AsString := CdsTipoRD.FieldByName('DESCRICAO').AsString;
               cdsPadraoRateio.FieldByName('FLGTIPODESEMBOLSO').asString := 'S';
             end
           else
             begin
               memResultado.Lines.Add('Tipo de Desembolso não localizado, linha '+ inttostr(linha)) ;
               cdsPadraoRateio.FieldByName('FLGTIPODESEMBOLSO').asString := 'N';
          //     raise EValidacao.CreateVal('Tipo de Desembolso não localizado!', btnGrupoRateio);
             end;
           if CdsCentroCusto.Locate('CODCENTROCUSTO', vDadosProntos[i].iIdCentroCusto, []) then
             begin
               cdsPadraoRateio.FieldByName('CODCENTROCUSTO').asString := inttostr(vDadosProntos[i].iIdCentroCusto);
               cdsPadraoRateio.FieldByName('CENTROCUSTO').AsString := CdsCentroCusto.FieldByName('NOME').AsString;
               cdsPadraoRateio.FieldByName('CODCCEXTERNO').asString := inttostr(vDadosProntos[i].iIdCentroCusto);
               cdsPadraoRateio.FieldByName('NOMECENTROCUSTO').AsString := CdsCentroCusto.FieldByName('NOME').AsString;
               cdsPadraoRateio.FieldByName('FLGCENTROCUSTO').asString := 'S' ;
             end
           else
             begin
               memResultado.Lines.Add('Centro de Custo não localizado, linha '+ inttostr(linha)) ;
               cdsPadraoRateio.FieldByName('FLGCENTROCUSTO').asString := 'N';
          //     raise EValidacao.CreateVal('Centro de Custo não localizado!', btnGrupoRateio);
             end;
           if CdsCentroRespon.Locate('CODCENTRORESPON', vDadosProntos[i].iIdCentroResponsabilidade, []) then
             begin
               cdsPadraoRateio.FieldByName('CODCENTRORESPON').asString := vDadosProntos[i].iIdCentroResponsabilidade;
               cdsPadraoRateio.FieldByName('CENTRORESPON').AsString := CdsCentroRespon.FieldByName('NOME').AsString;
               cdsPadraoRateio.FieldByName('CODCREXTERNO').asString := vDadosProntos[i].iIdCentroResponsabilidade;
               cdsPadraoRateio.FieldByName('FLGCENTRORESPON').asString := 'S' ;
             end
           else
             begin
               memResultado.Lines.Add('Centro de Responsabilidade não localizado, linha '+ inttostr(linha)) ;
               cdsPadraoRateio.FieldByName('FLGCENTRORESPON').asString := 'N' ;
          //     raise EValidacao.CreateVal('Centro de Responsabilidade não localizado!', btnGrupoRateio);
             end;
           if CdsUnidNegoc.Locate('UNIDNEGOC', vDadosProntos[i].iIdAtividade, []) then
             begin
               cdsPadraoRateio.FieldByName('UNIDNEGOC').asString := vDadosProntos[i].iIdAtividade;
               cdsPadraoRateio.FieldByName('UNIDNEGOCIO').AsString := CdsUnidNegoc.FieldByName('nome').AsString;
             end
           else
             begin
               memResultado.Lines.Add('Unidade de Negocio não localizado, linha '+ inttostr(linha)) ;
          //     raise EValidacao.CreateVal('Unidade de Negocio não localizado!', btnGrupoRateio);
             end;
           if CdsPatroPrev.Locate('IdPessoa', vDadosProntos[i].iIdPatro, []) then
             begin
               cdsPadraoRateio.FieldByName('IDPATRO').asString := inttostr(vDadosProntos[i].iIdPatro);
               cdsPadraoRateio.FieldByName('PATRO').AsString := CdsPatroPrev.FieldByName('nome').AsString;
            //   cdsPadraoRateio.FieldByName('IDPATROORIGEM').AsString := cdsPadraoRateio.FieldByName('IDPATRO').asString;   // WO25413 Ferrari
             end
           else
             begin
               memResultado.Lines.Add('Patrocinadora não localizado, linha '+ inttostr(linha)) ;
          //     raise EValidacao.CreateVal('Patrocinadora não localizado!', btnGrupoRateio);
             end;
           if CdsPlanoPrev.Locate('IdPlanoPrev', vDadosProntos[i].iIdPlanPrev, []) then
             begin
               cdsPadraoRateio.FieldByName('IDPLANOPREV').asString := inttostr(vDadosProntos[i].iIdPlanPrev);
               cdsPadraoRateio.FieldByName('PLANPREV').AsString := CdsPlanoPrev.FieldByName('nome').AsString;
             //  cdsPadraoRateio.FieldByName('IDPLANOORIGEM').AsString := cdsPadraoRateio.FieldByName('IDPLANOPREV').asString;   // WO25413 Ferrari
             end
           else
             begin
               memResultado.Lines.Add('Patrocinadora não localizado, linha '+ inttostr(linha)) ;
          //     raise EValidacao.CreateVal('Patrocinadora não localizado!', btnGrupoRateio);
             end;
           cdsPadraoRateio.FieldByName('VALORFDO').AsCurrency := vDadosProntos[i].dValor;
           cdsPadraoRateio.FieldByName('TOTAL').AsCurrency := dTotal;
           cdsPadraoRateio.FieldByName('UNETIPO').AsString := 'N';
           cdsPadraoRateio.Post;
           lblTotal.caption := formatfloat('#,##0.00',dTotal);

         end;
       TFloatField(cdsPadraoRateio.FieldByName('VALORFDO')).DisplayFormat := '#,##0.00';



     end
     else
     begin
       MsgDlg('Arquivo não está no formato válido.', 'Atenção', mtInformation, [mbOk], 0);
       edtArquivo.text := '';
       if Excel.WorkBooks[1].Sheets[aba].Name <> 'importacao' then
         begin
           memResultado.Lines.Add('Aba importacao não encontrada dentro do Arquivo...') ;
           inc(iNumFalhas);
           memResultado.Lines.Add('Total de inconsistências...: '+IntToStr(iNumFalhas));
         end;
     end;
   //  edtArquivo.text := '';
  finally
     Excel.ActiveWorkBook.Saved:= 1;
     Excel.DisplayAlerts:= 0;
     Excel.ActiveWorkBook.Close(SaveChanges:= 0);
     Excel.Workbooks.Close;
     Excel.Quit;
     Excel := Unassigned;
     Screen.Cursor := crDefault;
  end;

end;

procedure TfrmLancDocCAPCAR.rbPLANILHAClick(Sender: TObject);
begin
  inherited;
  if rbPLANILHA.checked then
    begin
      if cdsCentroRespon.isEmpty then
        cdsCentroRespon.Data := CtrlCentRespon.GetCentResponPadrao(Sistema.IdEmpresa);
      sbtnSelArquivo.enabled := True;
      dblkCResponsa.enabled    := False;
      edNumFDO.enabled := False;
      DBcboGrupoRateio.enabled := False;
    end;
end;

procedure TfrmLancDocCAPCAR.rbRateioPreClick(Sender: TObject);
begin
  inherited;
  if rbRateioPre.checked then
    begin
      sbtnSelArquivo.enabled := False;
      dblkCResponsa.enabled    := False;
      edNumFDO.enabled := False;
      DBcboGrupoRateio.enabled := True;
    end;

end;

procedure TfrmLancDocCAPCAR.dblcUnidNegPlanilhaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsPadraoRateio.State In [DsEdit, DsInsert] then
  begin
     if (Trim(dblcUnidNegPlanilha.Text)<>'') and
        (ActiveControl.Tag <> 9999) and
        (CdsUnidNegoc.FieldByName('UNETIPO').AsString <> 'A') then
     begin
        MsgDlg('Atividade/Projeto precisa ser analítica!', 'Atenção', mtWarnIng, [mbOk], 0);
         Repaint;
        if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
     end;

     _AtivProj := CdsUnidNegoc.FieldByName('UNIDNEGOC').asstrIng;
     cdsPadraoRateio.FieldByName('UNIDNEGOCIO').AsString := CdsUnidNegoc.FieldByName('nome').AsString;
  end;

end;

procedure TfrmLancDocCAPCAR.dblcUnidNegPlanilhaExit(Sender: TObject);
begin
  inherited;
  if cdsPadraoRateio.State In [DsEdit, DsInsert] then
  begin
     if (Trim(dblcUnidNegPlanilha.Text)<>'') and
        (ActiveControl.Tag <> 9999) and
        (CdsUnidNegoc.FieldByName('UNETIPO').AsString <> 'A') then
     begin
        MsgDlg('Atividade/Projeto precisa ser analítica!', 'Atenção', mtWarnIng, [mbOk], 0);
         Repaint;
        if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
     end;

     _AtivProj := CdsUnidNegoc.FieldByName('UNIDNEGOC').asstrIng;
     cdsPadraoRateio.FieldByName('UNIDNEGOCIO').AsString := CdsUnidNegoc.FieldByName('nome').AsString;
  end;

end;

procedure TfrmLancDocCAPCAR.dblcCentroRespPlanilhaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsPadraoRateio.State In [DsEdit, DsInsert] then
    cdsPadraoRateio.FieldByName('CENTRORESPON').AsString := CdsCentroRespon.FieldByName('NOME').AsString;
  if not CdsCentroRespon.IsEmpty then SelecionaTipoDesembolso;
  dblcTipoRDPlanilha.enabled := True;
end;

procedure TfrmLancDocCAPCAR.dblcCentroRespPlanilhaExit(Sender: TObject);
begin
  inherited;
  if cdsPadraoRateio.State In [DsEdit, DsInsert] then
  begin
     if (Trim(dblcCentroRespPlanilha.Text)<>'') and
        (ActiveControl.Tag <> 9999) and
        (CdsCentroRespon.FieldByName('ANALITICOSINTET').AsString <> 'A') then
     begin
        MsgDlg('Centro de Responsabilidade tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
         Repaint;
        if dblcCentroRespPlanilha.CanFocus then dblcCentroRespPlanilha.SetFocus;
     end;

     _CRespom:= CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
    cdsPadraoRateio.FieldByName('CENTRORESPON').AsString := CdsCentroRespon.FieldByName('NOME').AsString;
  end;
  if not CdsCentroRespon.IsEmpty then SelecionaTipoDesembolso;
  dblcTipoRDPlanilha.enabled := True;

end;

procedure TfrmLancDocCAPCAR.cmdProgPlanilhaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  _Programa := cdsPadraoRateio.FieldByName('IDPROGRAMA').AsStrIng;
  cdsPadraoRateio.FieldByName('DESCPROGRAMA').AsString := cmdProgPlanilha.Text;

end;

procedure TfrmLancDocCAPCAR.cmdProgPlanilhaExit(Sender: TObject);
begin
  inherited;
  if cdsPadraoRateio.State In [DsEdit, DsInsert] then
     cdsPadraoRateio.FieldByName('DESCPROGRAMA').AsString := cmdProgPlanilha.Text;
  // início - andré tavares - pendência 17279 - 26/08/2004
  _Programa := cdsPadraoRateio.FieldByName('IDPROGRAMA').AsStrIng;

end;

procedure TfrmLancDocCAPCAR.cmdPatroPlanilhaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
//  _PatroDet := cdsPadraoRateio.FieldByName('IDPATROORIGEM').AsInteger;    // WO25413 Ferrari
  _PatroDet := cdsPadraoRateio.FieldByName('IDPATRO').AsInteger;    // WO25413 Ferrari
  cdsPadraoRateio.FieldByName('NOMEPATROORIGEM').AsString := cmdPatroPlanilha.Text;
//  cdsPadraoRateio.FieldByName('IDPATRO').asString := cdsPadraoRateio.FieldByName('IDPATROORIGEM').AsString;   // WO25413 Ferrari
  cdsPadraoRateio.FieldByName('PATRO').AsString := CdsPatroPrev.FieldByName('nome').AsString;

end;

procedure TfrmLancDocCAPCAR.dblcTipoRDPlanilhaExit(Sender: TObject);
begin
  inherited;
  if cdsPadraoRateio.State In [DsEdit, DsInsert] then
  begin
    _TpDesmb := CdsTipoRD.FieldByName('CODTIPRECDES').asstrIng;
    cdsPadraoRateio.FieldByName('TIPODESEMBOLSO').AsString := CdsTipoRD.FieldByName('DESCRICAO').AsString;
  end;

end;

procedure TfrmLancDocCAPCAR.bbtnOkPadraoClick(Sender: TObject);
begin
  inherited;
  if cdsPadraoRateio.State In [DsEdit, DsInsert] then
    cdsPadraoRateio.post;
  dbgrdDet.visible := False;
  pnlResultado.visible := True;
  pnlCorrecaoRateio.visible := False;
  memResultado.visible := True;
  dbgrdRateio.visible := True;

end;

procedure TfrmLancDocCAPCAR.bbtnCancelarPadraoClick(Sender: TObject);
begin
  inherited;
  dbgrdDet.visible := False;
  pnlResultado.visible := True;
  pnlCorrecaoRateio.visible := False;
  memResultado.visible := True;
  dbgrdRateio.visible := True;

end;

procedure TfrmLancDocCAPCAR.bbtnVoltarPadraoClick(Sender: TObject);
begin
  inherited;
  dbgrdDet.visible := False;
  pnlResultado.visible := True;
  pnlCorrecaoRateio.visible := False;
  memResultado.visible := True;
  dbgrdRateio.visible := True;

end;

procedure TfrmLancDocCAPCAR.sbtnAltPadraoClick(Sender: TObject);
begin
  inherited;
  if cdsPadraoRateio.isempty then Exit;
  memResultado.visible := False;
  dbgrdRateio.visible := False;
  dbeValorPlanilha.text := floattostr(cdsPadraoRateio.FieldByName('VALORFDO').AsCurrency);
  pnlCorrecaoRateio.visible := True;
  cdsPadraoRateio.edit;

end;

procedure TfrmLancDocCAPCAR.cmdCCustoPlanilhaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsPadraoRateio.State In [DsEdit, DsInsert] then
  begin
    if (Trim(cmdCCustoPlanilha.Text)<>'') and
       (ActiveControl.Tag <> 9999) and
       (CdsCentroCusto.FieldByName('STATUSGRUPOCDC').AsString <> 'A') then
    begin
       MsgDlg('Centro de custo tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
      Repaint;
       if cmdCCustoPlanilha.CanFocus then cmdCCustoPlanilha.SetFocus;
    end;

    _CCusto := CdsCentroCusto.FieldByName('CODCENTROCUSTO').asstrIng;
    cdsPadraoRateio.FieldByName('NOMECENTROCUSTO').AsString := cmdCCustoPlanilha.Text;
    cdsPadraoRateio.FieldByName('CENTROCUSTO').AsString := cmdCCustoPlanilha.Text;

    if not CdsCentroCusto.FieldByName('IDPROGRAMA').isNull then
       cdsPadraoRateio.FieldByName('IDPROGRAMA').AsFloat := CdsCentroCusto.FieldByName('IDPROGRAMA').AsFloat
    else
       cdsPadraoRateio.FieldByName('IDPROGRAMA').Clear;
  end;     

end;

procedure TfrmLancDocCAPCAR.dblcTipoRDPlanilhaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if cdsPadraoRateio.State In [DsEdit, DsInsert] then
  begin

    if trim(cdsAux.fieldByName('FLGDESVINCCC').asString) <> 'S' then
      MontaCentroDeCusto;

    if cdsPadraoRateio.State In [DsEdit, DsInsert] then
    begin
       cdsPadraoRateio.FieldByName('TIPODESEMBOLSO').AsString := dblcTipoRDPlanilha.Text;
       if not CdsTipoRD.FieldByName('PLACONTACREDITO').isnull then
          cdsPadraoRateio.FieldByName('PLACONTACREDITO').asstrIng := CdsTipoRD.FieldByName('PLACONTACREDITO').asstrIng
       else
          cdsPadraoRateio.FieldByName('PLACONTACREDITO').asstrIng := CmpForCli.ForCliReg.CContabil  ;

       _TpDesmb := CdsTipoRD.FieldByName('CODTIPRECDES').asstrIng;
       cdsPadraoRateio.FieldByName('HITCODHIST').AsString := CdsTipoRD.FieldByName('HITCODHIST').AsString;

    end;
  end;

end;



// Fim WO8229 Ferrari

procedure TfrmLancDocCAPCAR.cmdPlanoPlanilhaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
//  _PlanoPrevDet := cdsPadraoRateio.FieldByName('IDPLANOORIGEM').AsInteger;    // WO25413 Ferrari
  _PlanoPrevDet := cdsPadraoRateio.FieldByName('IDPLANOPREV').AsInteger;      // WO25413 Ferrari
  cdsPadraoRateio.FieldByName('DESCPLANOORIGEM').AsString := cmdPlanoPlanilha.Text;
  cdsPadraoRateio.FieldByName('PLANPREV').AsString := cmdPlanoPlanilha.Text;
//  cdsPadraoRateio.FieldByName('IDPLANOPREV').AsString := cdsPadraoRateio.FieldByName('IDPLANOORIGEM').asString;   // WO25413 Ferrari

end;

procedure TfrmLancDocCAPCAR.cmdPlanoPlanilhaExit(Sender: TObject);
begin
  inherited;
  if cdsPadraoRateio.State In [DsEdit, DsInsert] then
    begin
//      _PlanoPrevDet := cdsPadraoRateio.FieldByName('IDPLANOORIGEM').AsInteger;    // WO25413 Ferrari
      _PlanoPrevDet := cdsPadraoRateio.FieldByName('IDPLANOPREV').AsInteger;    // WO25413 Ferrari
      cdsPadraoRateio.FieldByName('DESCPLANOORIGEM').AsString := cmdPlanoPlanilha.Text;
      cdsPadraoRateio.FieldByName('PLANPREV').AsString := cmdPlanoPlanilha.Text;
//      cdsPadraoRateio.FieldByName('IDPLANOPREV').AsString := cdsPadraoRateio.FieldByName('IDPLANOORIGEM').asString;   // WO25413 Ferrari
    end;
end;

procedure TfrmLancDocCAPCAR.dbeValorPlanilhaExit(Sender: TObject);
begin
  inherited;
    if cdsPadraoRateio.State In [DsEdit, DsInsert] then
      begin
        dTotal := dTotal - cdsPadraoRateio.FieldByName('VALORFDO').AsCurrency;
        cdsPadraoRateio.FieldByName('VALORFDO').AsCurrency := dbeValorPlanilha.Value;
        dTotal := dTotal + dbeValorPlanilha.Value;
        cdsPadraoRateio.FieldByName('TOTAL').AsCurrency := dTotal;
        lblTotal.caption := formatfloat('#,##0.00',dTotal);
      end;
end;

procedure TfrmLancDocCAPCAR.sbtnExcluiPadraoClick(Sender: TObject);
begin
  inherited;
  if cdsPadraoRateio.isempty then Exit;

  if (MsgDlg('Deseja excluir registro do Rateio?', 'Confirmação',mtConfirmation,[mbyes,mbNo],0) = mrYes) then
    begin
      dTotal := dTotal - cdsPadraoRateio.FieldByName('VALORFDO').AsCurrency;
      lblTotal.caption := formatfloat('#,##0.00',dTotal);
      cdsPadraoRateio.delete
    end;
end;

procedure TfrmLancDocCAPCAR.sbtnIncPadraoClick(Sender: TObject);
begin
  inherited;
  if cdsPadraoRateio.isempty then Exit;
  memResultado.visible := False;
  dbgrdRateio.visible := False;
  dbeValorPlanilha.text := floattostr(cdsPadraoRateio.FieldByName('VALORFDO').AsCurrency);
  pnlCorrecaoRateio.visible := True;
  cdsPadraoRateio.insert;

end;

end.
