Unit FCadRequerBenefPensionista;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************

{-------------------------------------------------------------------------------
Nº SIG....: WO17744
Rotina    : qryBeneficiario
Autor(a)  : Leandro Pocebon
Data      : 14/04/2025
Descrição : Tratamento para trazer  benefícios vinculados a
             matrícula de pensionista
// -----------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick
Nº SIG.....: WO7690
Data.......: 06/02/2024
Responsável: Edilaine
Descrição..: erro no calculo de alterador Correcao Monetaria na concessao
--------------------------------------------------------------------------------
Alteração  : bbtnOkDetClick
Nº SIG.....: 115877
Data.......: 07/05/2021
Responsável: edilaine
Descrição..: Validação das Datas de Requerimento, DIP e DIB apenas no beneficio
-------------------------------------------------------------------------------
Alteração  : bbtnOkDetClick
Nº SIG.....: 115300
Data.......: 16/04/2021
Responsável: edilaine
Descrição..: Validação das Datas de Requerimento, DIP e DIB
-------------------------------------------------------------------------------
Alteração  : qryDetBeforePost
Nº SIG.....: 113318
Data.......: 02/03/2021
Responsável: Edilaine
Descrição..: Ajuste plano contabil pelo pefil de investimento
-------------------------------------------------------------------------------
Alteração  : CriaLogOcorrencia
Nº SIG.....: 99886
Data.......: 14/05/2020
Responsável: Edilaine
Descrição..: mudança na passagem de parametro, de IDPLANOORIGEM para IDPLANOPREV
-------------------------------------------------------------------------------
Alteração  : FormShow, sbtnConcederClick, dblkpcmbPensionistaChange
Nº SIG.....: 84020
Data.......: 27/03/2019
Responsável: edilaine
Descrição..: Erro ao conceder pensão posterior ao requerimento
-------------------------------------------------------------------------------
Nº SIG.....: SIG73833
Data.......: 19/09/2018
Responsável: Fábio Sampaio
Descrição..: Manter o Perfil de investimento para benefício de auxílio funeral
             ou de pecúlio por morte originado da tela de
             "Registro de Falecimento de Beneficiário" (sTipoFormChamador = 'EV')
-------------------------------------------------------------------------------
Alteração  : ConcedeUmBeneficio
Nº SIG.....: 81749
Data.......: 04/02/2019
Responsável: edilaine
Descrição..: Erro ao conceder pensão para titular que é beneficiário
-------------------------------------------------------------------------------
Nº SIG.....: 70414
Data.......: 19/06/2018
Responsável: edilaine
Descrição..: Na concessão, não corrigir valores quando o índice for negativo
-------------------------------------------------------------------------------
Nº SIG.....: SIG TIBERO
Data.......: 01/03/2018
Responsável: Everson Luiz Pereira da Cunha
Descrição..: Melhoria no Planus para adequação ao TIBERO.
             Inclusão de alias nas tabelas e campos.
             Retirar INDEX, +rule etc
--------------------------------------------------------------------------------
Alteração  : (.dfm updDet), CmeCadastroConfirma
Nº SIG.....: 61218
Data.......: 08/01/2018
Responsável: Andre Imakawa
Descrição..: Perfil de investimento só deve ser inserido quando modulo Beneficio
             Previdenciario e Diferente de Concessão e Simulação.
--------------------------------------------------------------------------------
Alteração  : (.dfm updDet, qryDet), CmeCadastroConfirma
Nº SIG.....: 55933
Data.......: 02/10/2017
Responsável: Edilaine Ferraresi
Descrição..: Inclusão do perfil de investimento
--------------------------------------------------------------------------------
Alteração  : dtDataInicioExit e dblkpcmbBeneficiarioCloseUp
Nº SIG.....: 58900
Data.......: 29/11/2017
Responsável: Andre Imakawa
Descrição..: IdTpPagtoBenefic = 2 o campo data final deve ser preenchido com
             a data inicio
-------------------------------------------------------------------------------
Nº SIG.....: SIG49612
Data       : 03/07/2017
Responsável: Fernando Xavier
Descrição..: Na concessão de benefício único antecipado para pensão por morte,
             o sistema não esta calculando alteradores para o benefício.
-------------------------------------------------------------------------------
Nº SOL.....: 268616
KTN / PPM  : 1266499
Data       : 06/04/2016
Responsável: Peterson Victor
Descrição..: Bloqueio do campo dblkcmbTpPgtoBenef
{-------------------------------------------------------------------------------
Alteração  : GeraDemonstrativo
Nº SOL.....: 253577-18174
KTN / PPM  : 1327585
Data       : 31/03/2016
Responsável: Edilaine Ferraresi
Descrição..: Ajustes para Equacionamento do Deficit - gravação de demonstrativos
{-------------------------------------------------------------------------------
Alteração  : GeraDemonstrativo
Nº SOL.....: 270961
KTN / PPM  : 1342333
Data       : 22/03/2016
Responsável: Edilaine
Descrição..: após conceder benefício o 2o demonstrativo apresenta erro
{-------------------------------------------------------------------------------
Alteração  : GeraDemonstrativo
Nº SOL.....: 262968
KTN / PPM  : 1102753
Data       : 19/10/2015
Responsável: Edilaine
Descrição..: apresentar o novo demonstrativo de concessão
-------------------------------------------------------------------------------}
//Pendência   : SOL 260987 KINTANA 1051217
//Responsável : William Moreira da Silva
//Data        : 01/09/2015
//Descrição   : A rotina de Registro de falecimento esta apresetando um erro de
//              "Esta faltando um parênteses no final da condição."(.DFM)
//--------------------------------------------------------------------------------
//Pendência   : SOL 221079 KINTANA 2058169
//Responsável : Fernando Xavier
//Data        : 29/01/2012
//Descrição   : A rotina esta cancelando as contribuições do beneficio FUNCEF
//              ao cancelar um evento de Aposentadoria INSS.
//------------------------------------------------------------------------------
//Pendência   : SOL 232043 PPM 396781
//Responsável : Fernando Xavier
//Data        : 20/12/2012
//Descrição   : Não está pegando o indice do mês de Novembro para calculo do Abono Anual.
//--------------------------------------------------------------------------------
//Pendência   : SOL 211709/15287 KINTANA 2050393
//Responsável : Higor Nayde Ferreira
//Data        : 25/10/2013
//Descrição   : Atividade para liberação de versão 15188.
//              Retirar de campos e fazer com que não possa mais ser inserido
//              mais nenhum evento de morte no modulo.
//------------------------------------------------------------------------------
//Pendência   : SOL 213339 KINTANA 2054769
//Responsável : William Moreira da Silva
//Data        : 05/12/2013
//Descrição   : Ajustar a rotina de concessão de Pensão
//--------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Pendência   : SOL 220983 2053498 Kintana
// Data        : 28/11/2013
// Descricao   : Solicitamos que o campo texto seja gravado na inclusao
//--------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Pendência   : SOL 215522 Kintana 2046098
// Data        : 04/10/2013
// Descricao   : Solicitamos que o campo texto na tela de concessão de benefícios
//               seja gravado.
//--------------------------------------------------------------------------------
// Autor(a)    : Thiago Melo
// Pendência   : SOL 204075 Kintana 1972836  
// Data        : 04/07/2013
// Descricao   : PROBLEMA AO GRAVAR A SITUAÇÃO DO BENEFÍCIO 
//--------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SOL 209659 Kintana 2022632
// Data        : 21/06/2013
// Descricao   : Na cocessão de resgate apresenta mensagem de cancelamento,
//               impossibilitando a efetivação do mesmo.
//------------------------------------------------------------------------------
// Pendência : SOL 206918 - KINTANA 1999411
// Autor(a)  : douglas.siqueira
// Data      : 20/06/2013
// Descrição : Retirada Crítica SOL 161215
//--------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SOL 201131 Kintana 1944161
// Data        : 20/02/2013
// Descricao   : Trava implementada Sol 163064
//------------------------------------------------------------------------------
//Pendência   : SOL 163064 KINTANA 1388980
//Responsável : DOUGLAS DE SIQUEIRA
//Data        : 14/02/2013
//Descrição   : Trava no botão ok para verificar situação dos bonefícios.
// -----------------------------------------------------------------------------
// Pendência : SOL 160185
// Autor(a)  : André Felipe 
// Data      : 14/01/2013
// Descrição : Criação de campos para cadastro do CNPB e Plano Receptor
//--------------------------------------------------------------------------------------
//Pendência   : SOL 194556 Kintana 1855852
//Responsável : André Olivera
//Descrição   : **ERRO CONCESSÃO DE BENEFÍCIO COM ALTERADORES** A implementação
//              realizada no SOL 132938 não observou todas as opções da funcionalidade
//              Benefícioprev/Concessão e está apresentando erro na concessão de
//              "Concessão de Benefícios para Beneficiários de um Beneficiário".
//--------------------------------------------------------------------------------------
//Pendência   : SOL 132938 Kintana 770226
//Responsável : BRUNO AZEVEDO, Fernando Xavier e André Olivera
//Descrição   : inclusão do processo de Alteradores na concessão.
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SOL 169562/11863 Kintana 1821350
// Data        : 11/10/2012
// Descricao   : Na concessão, a rotina não está alterando a PROCESSOBENEF
//------------------------------------------------------------------------------
// Autor(a)    : Otacilio
// Pendência   : SOL 190588 Kintana 1802923
// Data        : 19/09/2012
// Descricao   : Erro ao conceder beneficio.
//------------------------------------------------------------------------------
// Autor(a)    : Vander Campos
// Pendência   : SOL 190523 Kintana 1801709
// Data        : 18/09/2012
// Descricao   : Ajuste na funcionalidade para que a opção "Requerer Beneficio" apresente somente os beneficios
//              cadastrados para o falecido.
//------------------------------------------------------------------------------
//Pendência   : SOL 186500/11002 KINTANA 1768929
//Responsável : BRUNO AZEVEDO
//Data        : 16/08/2012
//Descrição   : Ajuste na query de entrada da regra 24641 que determina o IDPLANPREVCONTAB.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Jonas Otavio
// Pendência   : SOL 170753 Kintana 1529212
// Data        : 29/06/2012
// Descricao   : Ajuste na funcionalidade para que a opção "Requerer Beneficio" apresente somente os beneficios
//cadastrados para o falecido.
//------------------------------------------------------------------------------
// Higor Nayde Ferreira  SOL - 173938 KTN - 1627112 Início
// Autor(a)    : Higor Nayde Ferreira
// Pendência   : SOL 173938 Kintana 1627112
// Data        : 24/07/2012
// Descricao   : Alterção no "Rodapé" do documento de Demonstrativo de Concessão
//antes e depois de ser confirmados os dados.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Douglas de Siqueira
// Pendência   : SOL 171125/7481 Kintana 1535617
// Data        : 10/01/2012
// Descricao   : Ajuste na rotina de requerimento de benefício quando chamada da tela de Registro de Falecimento
//de Beneficiário. Quando inserimos algum valor de opção para alguns casos o sistema está emitindo erro de constraint
//------------------------------------------------------------------------------
// Autor(a)    : Fanuel Junior
// Pendência   : SOL 172381 Kintana 1550197
// Data        : 20/01/2012
// Descricao   : Tela apresenta erro após confirmar botão OK
//------------------------------------------------------------------------------
//Pendência   : SOL 161215 Kintana
//Responsável : Marcos Merola
//Descrição   : Implementação de Trava Concessão.
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SOL 136385/7362 Kintana 1527997
//Data         : 26/12/2011
// Descricao   : inclusão do campo IDEVENTOGERADOR na query de entrada da regra
//               de cálculo de valor total
//------------------------------------------------------------------------------
//Pendência   : SOL 169376 Kintana 1501396
//Responsável : Fernando Xavier
//Data        : 25/11/2011
//Descrição   : Concessão de benefícios diferentes com a data de pagamento
//              diferentes o mesmo retorna que a matrícula já existe
//------------------------------------------------------------------------------
//Pendência   : SOL 164472 KINTANA 1442193
//Responsável : BRUNO AZEVEDO
//Data        : 07/11/2011
//Descrição   : Ajustes na geração de matrícula.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 160863 KINTANA 1381911
//Responsável : OTACILIO AQUINO
//Data        : 18/11/2011
//Descrição   : Gravar o Evento antes de fazer uma nova pesquisa.
//-----------------------------------------------------------------------------------
//Pendência   : SOL 140042.6361 Kintana 1410792
//Responsável : Fernando Xavier
//Descrição   : Erro Beneficio FUNCEF mês competência Reembolso.
// -----------------------------------------------------------------------------
//Pendência   : SOL 140042 Kintana 900220
//Responsável : Fernando Xavier
//Descrição   : Reembolso INSS .
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 162023 Kintana 1373448
//Responsável : RENATO VISONI
//Descrição   : Erro de constrainT
//--------------------------------------------------------------------------------
//Pendência   : SOL 162003 Kintana 1373069
//Responsável : FERNANDO XAVIER
//Descrição   : Erro de SQL ao selecionar benefício
//--------------------------------------------------------------------------------
//Pendência   : SOL 157583 Kintana 1269810
//Responsável : Vinicius Ferreira
//Descrição   : Erro ao alterar tipo de benefício
//--------------------------------------------------------------------------------
//Pendência   : SOL 149370 KINTANA 1075548
//Responsável : FERNANDO XAVIER
//Data        : 12/01/2011
//Descrição   : Erro ao quitar o Emprestimo
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 146984/3021 Kintana 1031393
//Responsável : Renato Visoni
//Descrição   : Inserção do planocontabil no demonstrativo de concessão
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 156428 KINTANA 1235970
//Responsável : BRUNO AZEVEDO
//Data        : 25/04/2011
//Descrição   : Não permitir conceder e requerer benefício sem informar DIB e DIP.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 154040 KINTANA 1167990
//Responsável : BRUNO AZEVEDO
//Data        : 02/03/2011
//Descrição   : Não exibir crítica quando o benefício for de pecúlio.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 130057-1781 KINTANA 717976
//Responsável : BRUNO AZEVEDO
//Data        : 04/05/2010
//Descrição   : Somente atualizar a HSTCONTRIBPREV se o evento gerador nao for de demissao.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 143353 KINTANA 929082
//Responsável : Fernando Xavier
//Data        : 06/09/2010
//Descrição   : Incluido um commit no final do processo do botão "bbtnConfirmarClick"
//              caso a transação esteja aberta.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 137519 KINTANA 831220
//Responsável : BRUNO AZEVEDO
//Data        : 16/06/2010
//Descrição   : Ajuste no controle de transação ao fechar a tela.
//--------------------------------------------------------------------------------------------------
// Autor(a)  :  Thiago Passos
// Data      :  05/03/2010
// Pendência :  SOL 131674 Kintana 752152
// Descricao :  Ajustando o controle de transação
// --------------------------------------------------------------------------------------
// Autor(a)  :  Renato Visoni
// Data      :  23/12/2009
// Pendência :  SOL 128888 Kintana 695913
// Descricao :  Favor verificar a emissão da mensagem "Existe uma transação
//              em aberto. A Transação será cancelada!"
// --------------------------------------------------------------------------------------
// Autor(a)  :  Daniel Begnami
// Data      :  06/10/2009
// Pendência :  SOL 124279 KT:629988
// Descricao :  Fechar a seção com RollBack no evento on-close do formulario, caso a seção esteja aberta.
// --------------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 28/09/2009
// Rotina      : ComparaValorReservaComHistorico
// Pendência   : SOL 123843 Kintana 636875
// Descricao   : Para alguns casos a concessão de resgate estava gerando diferneças
//               entre a alimentação das reservas e o valor resgatado.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Jéssica Lana
// Data        : 22/10/2009
// Rotina      : Concessão de Beneficio
// Pendência   : SOL 125930 \ Kintana 654723
// Descricao   : Mudança no critério de concessão de beneficio.
// *****************************************************************************
// Autor(a)    : Jéssica Lana
// Data        : 22/09/2009
// Rotina      : Concessão de Beneficio
// Pendência   : SOL 121166 \ Kintana 579890
// Descricao   : Inseri no sistema BENEFICIOPREV uma critica que trava o processo de concessão de beneficio
//               quando não há contribuição associado tanto de pensionista quanto de aposentado
//               evitando assim que os beneficios sejam concedidos sem CONTRIBUIÇÃO.
//---------------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 04/09/2007
// Rotina      : PessoaChangeSubtipo
// Pendencia   : 22119
// Alteração   : Confirmar que a FrmAguarde seja sempre fechada qdo terminar a uma operação
// --------------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 16/08/2007
// Rotina      : Varias
// Pendência   : 19962
// Descricao   :  Troca do DateToStr para FormatDateTime.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 01/08/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 19/06/2007
// Pendência   : 25647
// Rotina      : VerificaContribAtrasada
// Descricao   : Acerto na query para considerar apenas as contribuições com
//               sitrecebimento 0, 1 e 3
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 30/01/2007
// Pendência   : 24334
// Rotina      : várias
// Descricao   : Forçado formato de datas para 'dd/mm/yyyy' em todas as rotinas do form,
//               substituindo-se DateToStr() por FormatDateTime
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 27/12/2006
// Pendência   : 22208
// Rotina      : TestaQuitacaoDividas
// Descricao   : Permitir que seja feita uma concessão sem quitar um empréstimo
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 08/06/2007
// Pendência   : 25497
// Rotina      : reValorBeneficioBtnClick(...)
// Descricao   : Implementações para o caso do Beneficiário estar em plano diferente do titular
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 05/06/2007
// Pendência   : 25497
// Rotina      : reValorBeneficioBtnClick(...)
// Descricao   : Passar para a rotina de calculo do valor beneficio, o plnao da pessoa.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 27/10/2006
// Rotina      : bbtnOkDetClick
// Descricao   : Incluir IDSITPLANOPREV na query de Plano Contabil
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 23/10/2006
// Pendência   : 23563
// Rotina      : - (qryReservaPart e updReservaPart)
// Descricao   : Gravação do campo IDPARTICIPANTE na ReservaPart
//             ***************************************************************
//             *****  ATENÇÃO AO DAR MANUTENÇÃO NO updReservaPart:       *****
//             *****  A passagem do campo foi implementada diretamente   *****
//             *****  no UpdateSQL                                       *****
//             ***************************************************************
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 20/07/2006
// Rotina      : 21787
// Descricao   : 1) Converter o preview do ReportBuilder para o FPreview
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 02/02/2006
// Pendência   : 21431
// Rotina      : qryDetBeforePost
// Descricao   : Não atualizar o VALORNADIB quando for Concessão
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 24/01/2006
// Pendência   : 21195
// Rotina      : sbtnDemonsSRBClick
// Descricao   : Novo parametro para a função DisparaRelatorio. IDPESSOA.
//------------------------------------------------------------------------------
//  Autor(a)   : Gleyber
//  Rotina     : CobraContribAtrasada
//  Data       : 11/01/2006
//  Pendência  : 19538
//  Alteração  : Inclusão de dois novos parâmetros (sPlaContaDProvis e sPlaContaCProvis)
// -----------------------------------------------------------------------------
//  Autor(a)   : Bruno Bastos
//  Rotina     : CobraContribAtrasada
//  Data       : 25/10/2005
//  Pendencia  : 20518
//  Alteração  : Atribui a uma variável o número do recebimento retornado pela
//               função InsereHstContribPrev
//------------------------------------------------------------------------------
//  Autor(a)   : Gleyber
//  Rotina     : CobraContribAtrasada
//  Data       : 12/09/2005
//  Pendencia  : 20169
//  Alteração  : Inclusão de novo parâmetro (sNaturezaDocumento) na chamada da rotina
//               dtmAPrevIntegraBack.BuscaInfIntegra
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : ConcedeUmBeneficio
//  Data       : 06/07/2005
//  Pendência  : 19637
//  Descrição  : atualizar IDSITBENEFICIO para 3, encerrado, caso a datafinal seja anterior a atual
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : CalculaReservaParaBeneficio
//  Data       : 30/06/2005
//  Pendência  : 19575
//  Descrição  : não somar reservas de controle ao passar o somatório de reservas para a regra de
//               cálculo do benefício
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : EfetuaConcessao
//  Data       : 01/06/2005
//  Pendência  : 17806
//  Descrição  : Acrescentada crítica para verificação da data da DIB não ser
//               anterior à do pagamento do lote.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 28/04/2005
// Pendencia   :
// Rotina      : chamadas da função dtmAPrevIntegraBack.BuscaInfIntegra
// Alteração   : passagem do parâmetro sMsgErro para a função dtmAPrevIntegraBack.BuscaInfIntegra, para que esta retorne
//               uma possível mensagem de erro, já que ela não aciona mais um MSGDLG diretamente
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : CmeCadastroCancel
//  Data       : 08/03/2005
//  Pendência  : 18810
//  Descrição  : Executar um rollback ao cancelar processo caso Concessão
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : ConcedeUmBeneficio
//  Data       : 17/02/2005
//  Pendência  : 18314
//  Descrição  : Considerar para benefícios que tenham quitação automática.
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : ConcedeUmBeneficio
//  Data       : 31/01/2005
//  Pendência  : 18314 / 16939
//  Descrição  : Atualização dos campos necessários para encerrar benefício em
//               caso de quitação automática.
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : qryBeforePost
//  Data       : 30.11.2004
//  Descrição  : caso o titular não tenha o registro do evento, pegar o IDEVENTOGERADOR
//               do benefício
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : -----
//  Data       : 20.10.2004
//  Pendencia  : 17578
//  Descrição  : Filtrar planos ativos (PLANPREVCONTABIL.ATIVO = S)
//------------------------------------------------------------------------------
// Rotina      : OkDetClick
// Autor(a)    : Augusto
// Data        : 23/07/2004
// Descricao   : ACERTO - Tratamento do Percentual do beneficiario
// Data        : 31/05/2004
// Descricao   : ACERTO - atribuição automática de parametros contábeis individuais
//------------------------------------------------------------------------------
// Rotina      : OkDetClick
// Autor(a)    : Leo
// Data        : 28/05/2004
// Descricao   : ATUALIZAÇÃO - atribuição automática de parametros contábeis individuais
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 20/05/2004
// Descricao   : atribuição automática de parametros contábeis individuais
//------------------------------------------------------------------------------
// Rotina      : ConcedeUmBeneficio
// Autor(a)    : Gleyber
// Pendência   : 16276
// Data        : 30/03/2004
// Descricao   : Inclusão da função ExecutaRegraPlanPrevContab para gravação do
//               IDPLANPREVCONTAB da BENEFBFCIARIO
//------------------------------------------------------------------------------
// Rotina    : Varias
// Autor(a)  : Augusto
// Data      : 11/02/2004
// Descrição : Novo parametro IdPessoa na função BuscaDadosBeneficioAnterior
// Data      : 12/02/2004 -
// Descrição : Acertos diversos comentados no código
// Data      : 13/02/2004
//           : Novo parametro AbreRequerPensionista
// Data      : 17/02/2004
//           : IdPlanoPrev do titular passado para função
// Data      : 16/03/2004
//           : Acerto no cadastro da BENEFPLANPREV
// Data      : 18/03/2004
//           : Acerto na pesquisa dos dados do Titular
// -----------------------------------------------------------------------------
// Rotina    : Diversas
// Autor(a)  : Gleyber
// Data      : 27/01/2004
// Pendência : 15925
// Descrição : Inclusão do campo MATRÍCULA para gravação da matrícula do
//             Beneficiário / Pensionista
// -----------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Leo
// Data      : 10/12/2003
// Descrição : verificação do campo FLGACEITAACERTO, que esta se é para
//             pegar acertos do falecido
// -----------------------------------------------------------------------------
// Rotina    : QRYBENEFICIO
// Autor(a)  : Leo
// Data      : 08/01/2004
// Descrição : incluão do campo FLGACEITAACERTO
// -----------------------------------------------------------------------------
// Rotina    : reValorBeneficioBtnClick
// Autor(a)  : Leo
// Data      : 08/01/2004
// Descrição : passando o idplano do titular, pela forma de consulta  da função,
//que faz join com a partprevplan
// -----------------------------------------------------------------------------
// Rotina    : reValorTotalBtnClick
// Autor(a)  : Leo
// Data      : 08/01/2004
// Descrição : passando o idplano do titular, pela forma de consulta  da função,
//que faz join com a partprevplan
// -----------------------------------------------------------------------------
// Rotina    : Varias
// Autor(a)  : Augusto
// Data      : 05/12/2003
// Descrição : Alterações para suprir necessidades da FUNCEF
// -----------------------------------------------------------------------------
// Rotina    : ExecutaRegraDataPgtoBeneficio
// Autor(a)  : Ricardo Vigorito
// Data      : 17/1O/2003
// Descrição : Incluir o campo DATAREQUERIMENTO  para query de executa a data
// do pagamento do benefício  (foi movido '' ao chamar a função
// -----------------------------------------------------------------------------

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadMestreDetCS, StdCtrls, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
   TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid,
   ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdblook,
   TREdit, MskEdDlg, TEdNum, wwdbedit, FTelaAut, checklst, IvDictio,
   IvMulti, IvEMulti, FCadastroCS, wwdbdatetimepicker, CMDateTimePicker,
   DBCtrls, CmEventosCadastro, ImgList, ppTypes, DBGrids, FPreview,
   UBeneficio;     //edilaine - SIG55933

Const VetDescBeneficio: Array[1..7] Of String =
   ('Normal', 'Retido', 'Encerrado', 'Pendente de Concessão',
      'Encerrado por Morte do Beneficiário', 'Não Concedido',
      'Concedido em exigência');


Type
   TfrmCadRequerBenefPensionista = Class(TfrmCadMestreDetalheCS)
      qryTpPgtoBenef: TwwQuery;
      Label12: TLabel;
      dblkpcmbPensionista: TwwDBLookupCombo;
      Label5: TLabel;
      dtMortePensionista: TCMDateTimePicker;
      Label15: TLabel;
      dtDataRequerimento: TCMDateTimePicker;
      Label21: TLabel;
      grpPagamento: TGroupBox;
      Label16: TLabel;
      Label17: TLabel;
      Label20: TLabel;
      dtDataInicio: TCMDateTimePicker;
      dtDataFinal: TCMDateTimePicker;
      dblkcmbTpPgtoBenef: TwwDBLookupCombo;
      updDet: TUpdateSQL;
      qryDet: TwwQuery;
      qryAux: TwwQuery;
      MontaSelectPart: TMontaSelect;
      qryTitular: TwwQuery;
      qryBfciarioTitPlan: TwwQuery;
      updBfciarioTitPlan: TUpdateSQL;
      bbtnElegibilidade: TBitBtn;
      bbtnOpcoes: TBitBtn;
      lblNomeBenef: TLabel;
      qryFolha: TwwQuery;
      qryContrib: TwwQuery;
      Label1: TLabel;
      dblkpcmbPortForma: TwwDBLookupCombo;
      qryPortForma: TwwQuery;
      qryMovReservaTemp: TwwQuery;
      updMovReservaTemp: TUpdateSQL;
      qryReservaPart: TwwQuery;
      updReservaPart: TUpdateSQL;
      qryBenefAUX: TwwQuery;
      updBenefAUX: TUpdateSQL;
      Label6: TLabel;
      dblkpcmbBeneficiario: TwwDBLookupCombo;
      qryBeneficiario: TwwQuery;
      bbtnSelecionaBeneficiarios: TSpeedButton;
      dsBeneficiario: TwwDataSource;
      dblkpcmbBeneficio: TwwDBLookupCombo;
      qryDetNUMEROPROCESSO: TFloatField;
      qryDetIDPESSJUR: TFloatField;
      qryDetIDPLANOPREV: TFloatField;
      qryDetIDTITULAR: TFloatField;
      qryDetIDPESSOA: TFloatField;
      qryDetSEQPROPOSTA: TFloatField;
      qryDetIDBENEFICIO: TFloatField;
      qryDetCODPORTFORMA: TFloatField;
      qryDetIDSITBENEFICIO: TFloatField;
      qryDetIDDEPENDENCIA: TStringField;
      qryDetIDTPPAGTOBENEFIC: TFloatField;
      qryDetVALORATUAL: TFloatField;
      qryDetDATAREQUERIMENTO: TDateTimeField;
      qryDetDATAINICIO: TDateTimeField;
      qryDetDATAFINAL: TDateTimeField;
      qryDetFLGFORMAPAGTO: TStringField;
      qryDetVALORCALCULADO: TFloatField;
      qryDetDATAULTREAJUSTE: TDateTimeField;
      qryDetVLRCALCINSS: TFloatField;
      qryDetVLRINFINSS: TFloatField;
      qryDetDATAINICIOINSS: TDateTimeField;
      qryDetNUMPROCINSS: TStringField;
      qryDetDATAINICIOFUND: TDateTimeField;
      qryDetNUMORDEMEVENTO: TFloatField;
      qryDetNOME: TStringField;
      qryDetDESCRICAO: TStringField;
      qryDetFLGRESGATE: TFloatField;
      qryDetVALORBASE1: TFloatField;
      qryDetVALORBASE2: TFloatField;
      qryDetVALORBASE3: TFloatField;
      qrybeneficio1: TwwQuery;
      Panel1: TPanel;
      dsBenefAux: TwwDataSource;
      qryDetDEPEN: TStringField;
      qryReajINSS: TwwQuery;
      qryContaBancaria: TwwQuery;
      qryDetVALORTOTAL: TFloatField;
      qryDetDATACONCESSAO: TDateTimeField;
      qryDetFLGPROVISORIO: TFloatField;
      qryDetPERCPROVISORIO: TFloatField;
      qryDetPRAZOPROVISORIO: TFloatField;
      qryBeneficio: TwwQuery;
      qryDetIDRESPONSAVEL: TFloatField;
      qryDetULTMESREAJUSTE: TStringField;
      qryDetULTVALORATUALREAJ: TFloatField;
      qryAgenciaResgate: TwwQuery;
      lblAgencia: TLabel;
      dblkpcmbAgencia: TwwDBLookupCombo;
      qryDetIDAGENCIARESGATE: TFloatField;
      qryRelBenefPart: TwwQuery;
      updRelBenefPart: TUpdateSQL;
      sbtnConceder: TToolbarButton97;
      qryDetVALORCOTAS: TFloatField;
      QryBuscaContrib: TwwQuery;
      qryNucleoFamiliar: TwwQuery;
      QryBenefProc: TwwQuery;
      StringField1: TStringField;
      StringField2: TStringField;
      StringField3: TStringField;
      DateTimeField1: TDateTimeField;
      FloatField1: TFloatField;
      FloatField2: TFloatField;
      DateTimeField2: TDateTimeField;
      DateTimeField3: TDateTimeField;
      DateTimeField4: TDateTimeField;
      DateTimeField5: TDateTimeField;
      DateTimeField6: TDateTimeField;
      FloatField3: TFloatField;
      StringField4: TStringField;
      FloatField5: TFloatField;
      FloatField6: TFloatField;
      FloatField7: TFloatField;
      FloatField8: TFloatField;
      FloatField9: TFloatField;
      FloatField10: TFloatField;
      FloatField11: TFloatField;
      StringField5: TStringField;
      FloatField12: TFloatField;
      FloatField13: TFloatField;
      StringField6: TStringField;
      FloatField14: TFloatField;
      FloatField15: TFloatField;
      FloatField16: TFloatField;
      FloatField17: TFloatField;
      FloatField18: TFloatField;
      FloatField19: TFloatField;
      FloatField20: TFloatField;
      FloatField21: TFloatField;
      DateTimeField7: TDateTimeField;
      FloatField22: TFloatField;
      FloatField23: TFloatField;
      FloatField24: TFloatField;
      FloatField25: TFloatField;
      StringField7: TStringField;
      FloatField26: TFloatField;
      FloatField27: TFloatField;
      FloatField28: TFloatField;
      QryContribProc: TwwQuery;
      qryDetFLGTIPOINSS: TFloatField;
      qryTotalRecebedor: TwwQuery;
      updTotalRecebedor: TUpdateSQL;
      qryDetDIBBENEFANT: TDateTimeField;
      qryDetVALORBENEFANT: TFloatField;
      bbtnOutrasInformacoes: TBitBtn;
      qryDetVALORBINSSANT1: TFloatField;
      qryDetVALORBINSSANT2: TFloatField;
      qryDetVALORBINSSANT3: TFloatField;
      sbtnConcedeUm: TToolbarButton97;
      sbtnImprimirSimulacao: TToolbarButton97;
      bbtnProcurar: TBitBtn;
      qryDetFLGPECULIO: TFloatField;
      qryDetFLGBENEFMIN: TFloatField;
      sbtnCadContaCorrente: TToolbarButton97;
      grpInfSupl: TGroupBox;
      pnlBenefProv: TPanel;
      lblPercConc: TLabel;
      lblPrazoProv: TLabel;
      lblMesProv: TLabel;
      lblPercent: TLabel;
      dbrgrpBenefProvisorio: TDBRadioGroup;
      dbedPercConc: TwwDBEdit;
      dbedPrazoProv: TwwDBEdit;
      qryDetVALORSRB: TFloatField;
      lblNumProcesso: TLabel;
      lblSitProcesso: TLabel;
      qryDetIDPLANOORIGEM: TFloatField;
      qryDetIDBENEFREFEREN: TFloatField;
      qryDetVALORNADIB: TFloatField;
      sbtnDemonsSRB: TToolbarButton97;
      qryDetFLGDATAPREVISTA: TFloatField;
      pnlNaoBenefProv: TPanel;
      reValorBeneficio: TcmMaskEditDlg;
      lblValorBenef: TLabel;
      reValorTotal: TcmMaskEditDlg;
      Label7: TLabel;
      reValorSRB: TcmMaskEditDlg;
      Label8: TLabel;
      dtInicioFund: TCMDateTimePicker;
      Label3: TLabel;
      edNomeTitular: TEdit;
      Label2: TLabel;
      Label4: TLabel;
      edMatriculaParticipante: TEdit;
      Label9: TLabel;
      edMatriculaPensionista: TEdit;
      qryPensionista: TwwQuery;
      DBGrid1: TDBGrid;
      qryDetIDTITBENEF: TFloatField;
      Label10: TLabel;
      dbeMatriculaBenef: TwwDBEdit;
      qryDepentit: TwwQuery;
      dsDepentit: TwwDataSource;
      updDepentit: TUpdateSQL;
      qryDetIDPLANPREVCONTAB: TFloatField;
      qryDetFONTEPAGADORA: TFloatField;
      qryDetPLACONTAD: TStringField;
      qryDetPLACONTAC: TStringField;
      QryAlteradorCorrecao: TwwQuery; // sol 132938
      qryIncluiAlterador: TwwQuery;   // sol 132938
      QryFatorAtualizacao: TwwQuery; // sol 132938
      LblAlterador: TLabel;           // sol 132938
    qryBfciariotitPlanAux: TwwQuery;
    updBfciarioTitPlanAux: TUpdateSQL;
    qryDetTIPOBENEFICIO: TFloatField;
    qryDetTRGUSERINCLUSAO: TStringField;
    qryUser: TwwQuery;
    DbLAlterador: TwwDBLookupCombo;
    qryAux2: TwwQuery;
    qryDetCAMPOTEXTO1: TStringField;
    qryDetCAMPOTEXTO2: TStringField;
    qryDetCAMPOTEXTO3: TStringField;
    qryDetIDPERFILINVEST: TFloatField;
      Procedure CmeCadastroConfirma(Sender: TObject);
      Procedure CmeCadastroDelete(Sender: TObject);
      Procedure CmeCadastroInsert(Sender: TObject);
      Procedure CmeCadastroEdit(Sender: TObject);
      Procedure CmeDetalheConfirma(Sender: TObject);
      Procedure CmeCadastroFind(Sender: TObject);
      Procedure CmeDetalheInsert(Sender: TObject);
      Procedure CmeDetalheEdit(Sender: TObject);
      Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnProcurarClick(Sender: TObject);
      Procedure qryBeforePost(DataSet: TDataSet);
      Procedure qryDetBeforePost(DataSet: TDataSet);
      Procedure qryBeneficioAfterScroll(DataSet: TDataSet);
      Procedure bbtnOkDetClick(Sender: TObject);
      Procedure bbtnElegibilidadeClick(Sender: TObject);
      Procedure bbtnOpcoesClick(Sender: TObject);
      Procedure sbtnConcedeUmClick(Sender: TObject);
      Procedure dsStateChange(Sender: TObject);
      Procedure dsDetStateChange(Sender: TObject);
      Procedure qryDetAfterScroll(DataSet: TDataSet);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure dtInicioFundExit(Sender: TObject);
      Procedure dtDataInicioExit(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure sbtnExcluiDetClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure dblkpcmbBeneficioCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure dblkpcmbBeneficiarioCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure qryBeneficiarioAfterOpen(DataSet: TDataSet);
      Procedure bbtnSelecionaBeneficiariosClick(Sender: TObject);
      Procedure dblkpcmbBeneficioExit(Sender: TObject);
      Procedure bbtnVoltarDetClick(Sender: TObject);
      Procedure bbtnCancelarDetClick(Sender: TObject);
      Procedure sbtnAltDetClick(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure reValorBeneficioMouseMove(Sender: TObject;
         Shift: TShiftState; X, Y: Integer);
      Procedure reValorBeneficioExit(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure reValorTotalBtnClick(Sender: TObject);
      Procedure reValorTotalExit(Sender: TObject);
      Procedure dbrgrpBenefProvisorioClick(Sender: TObject);
      Procedure dbedPrazoProvExit(Sender: TObject);
      Procedure dbrgrpBenefProvisorioEnter(Sender: TObject);
      Procedure dbrgrpBenefProvisorioExit(Sender: TObject);
      Procedure sbtnConcederClick(Sender: TObject);
      Procedure bbtnOutrasInformacoesClick(Sender: TObject);
      Procedure CmeCadastroCancel(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure sbtnImprimirSimulacaoClick(Sender: TObject);
      Procedure bbtnProcParticipanteClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure sbtnCadContaCorrenteClick(Sender: TObject);
      Procedure reValorSRBBtnClick(Sender: TObject);
      Procedure sbtnDemonsSRBClick(Sender: TObject);
      Procedure dblkpcmbPensionistaChange(Sender: TObject);
      //  procedure qryqrybene(Sender: TObject);
      Procedure reValorBeneficioBtnClick(Sender: TObject);
    procedure dbeMatriculaBenefExit(Sender: TObject);
    procedure DbLAlteradorKeyPress(Sender: TObject; var Key: Char);
   Private
      FIdPlanoPrevTit : Integer;

      { Private declarations }
      sBeneficioAnterior  : String; //Vinicius Ferreira SOL 159322 KINTANA 1308856
      iFlgEmprestimo: Integer;
	  
	  sAnoMesAtualCalcAlt   : string; // SOL 232043 PPM 396781
      sAnoMesRefAux: String; // SOL 232043 PPM 396781  


      bAtivo: boolean;
      iIdEvento: longint;
      iIdEventoAux  : longint; // SOL 136385/7362 Kintana 1527997
      iIdLoteConcessao: longint;
      sAnoMesLoteConcessao,
      sDataPagamentoConcessao: String;
      sSQL : String;  // SOL 132938
      sIdContribuicaoAlteradores: String; //SOL132938 BRUNO
      iIdCalculo,

      iIdSitPart, iIdSitFunc, iIdSitPlanoPrev,
         iNumBenef, iIdBenefReferencia, NumeroProcesso: longint;

      iProvisorioAntes: longint;

      bPerguntouCancelar,
         bRecalculouProvisorio,
         bReajustouINSS,
         bAbriuOutroForm,
         bNovoBeneficio,
         bConcedeBeneficio, bPossuiDivPrevid, bPossuiDivAssist,
         bPossuiDivEmprest, bExecutouRegraConcessao, bQueryTitular,
         bQuerySalarios, bQueryContribuicoes, bGravaBenefReferencia: boolean;


      dValorSRB: double;
      rValorReal, rValorCotas, rValorDaCotaBenef: real;

      // Variaveis para controlar validacoes necessárias na concessao
      bCobraContribAtrasada,
         bConcedeuBeneficio: boolean;


      sNumProcINSS,
         sNumerosProcessos,
         sTipoSitFunc: String;
      // Variaveis para guardar e apresentar igual ao anterior quando
      // for outro beneficiario para o mesmo beneficio

      sValorReserva,
         sValorTotal,
         sDataInicioPagto,
         sDataDaCotaBenef,
         sTipoFormChamador, // EV - Evento, CO - Concessao, SI - Simulacao
      sDataFalePensionista,
         sMatricula, sNomeTitular, sNomePatro,
         sNomePlano, sNomeSitPart,
         sNomeSitFunc, sNomeSitPlano,
         sFlgInternoAntes,
         sFlgInternoDepois,
         sIdSitPartAntes,
         sIdSitPlanAntes,
         sIdSitFuncAntes,
         sIdSitPartDepois,
         sIdSitPlanDepois,
         sIdSitFuncDepois: String;

      sNumeroProcessoAntesGravar: String;
      sTempoServAnoAntes, sTempoServMesAntes, sTempoServDiaAntes: String;

      sParametrosDemonstra : string;       // edilaine - SOL 262968 / PPM 1102753
      sdataInicioConcessao : string;       // edilaine - SOL 262968 / PPM 1102753

      sListaProcessos : string;            // edilaine - SOL 270961 / PPM 1342333

      StrConcedidos: String;


      iFlgIncluiMesConc: integer;
      iTotRequeridos: word;

      //edilaine - SIG55933 - inicio
      PerfilAtual    : TRecPerfilInv;
      PerfilAnterior : TRecPerfilInv;
      bPerfilAtivo   : Boolean;
      //edilaine - SIG55933 - fim

      PerfilPensionista: TRecPerfilInv; // Alterado por FHBS - 19/09/2018 - SIG73833

      //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
      MatriculaBenefInicial: String;
	  //Vander Campos - SOL 190523 Kintana 1801709
      Procedure PesqBeneficio;
      Function CalculaAlteradores(pcTipo : Char;
                                psAnoMesRef : String;
                                pdValorCalculo : Double;
                                Var dValorTotalAlteradores : Currency;
                                piIdContribuicao : Integer = -1;
                                piNumLancamento  : LongInt = -1;
                                piflgevento : LongInt = -1): Boolean; // SOL 132938

      procedure InsereCorrecaoMonetaria(pcTipoCorracao : Char; { B - Beneficio C - Contribuição }
                                      QryDados       : TwwQuery;
                                      psAnoMesRef    : String;
                                      pdValor        : Double;
                                      piNumLancamento : LongInt = -1 ); // SOL 132938

      Procedure SelecionaProcesso(piNumeroProcesso: longint);
      Procedure PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta, piIdPensionista: longInt);
      Procedure PreencheDadosBeneficiario(piNumeroProcesso, piIdTitular, piIdPessoa, piIdPessJur, piIdPlanoPrev, piSeqProposta: longInt);
      Procedure SelecionaReservaPart;
      Function CalculaReservaParaBeneficio: double;
      Function AtualizaReservaPart(piIdBeneficio: longint): boolean;


      Function ConverteBeneficioParaCotas(prValorReal: real): real;
      Function ConverteBeneficioParaReal(prValorCotas: real): real;

      Function TestaQuitacaoDividas: boolean;
      Function VerificaBeneficioObrigatorio: boolean;

      Function VerificaNumeroDependentes: boolean;
      Function VerificaContribAtrasada(Var sMesAtraso: String): boolean;

      Function CalculaSaldoRealCont(piIdTipoReserva: integer; pdVlMovReal: double): double;
      Function DevolveReserva(piIdBeneficio, piIdBeneficiario: longint): boolean;
      Function MontaSQLBenefAssoc(piNumOrdem: longint): String;
      Function ConfirmaBeneficio: boolean;
      Function CobraContribAtrasada(piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta: longint;
         psDataInicioFund: String): boolean;

      Procedure MostraDemonstrativoConcessao(const homologado :Boolean = False; const HoraHomologacao: String = '');//Higor Nayde SOL - 173938 KINTANA - 1627112

      procedure GeraDemonstrativo(const HoraHomologacao: String = '');  // edilaine - SOL 262968 / PPM 1102753

      Function EfetuaConcessao(iIdSitEscolhida: word;
         Var rValorAtualizado,
         rValorAtualizadoTotal,
         rValorAtualizadoINSS,
         rValorAtualizadoTotalINSS: double;
         Var sUltMesReajuste,
         sUltMesReajusteINSS: String;
         Var bErro: boolean): word;

      Function ConcedeUmBeneficio(Sender: TObject; piIdSitBenef: integer): boolean;


   Public
      sDataDemissao,
         sIdDepen: String;
      rOpcao1, rOpcao2, rOpcao3: real;
      rCampoTexto1,rCampoTexto2,rCampoTexto3 : String;
      rTotalLote: double;
      iIdLote, iNumReg, wIdMotivo: longint;
      iNumeroProcesso, iIdTitular, iIdPessJur, iIdBenefTit,
      iIdPlanoPrevTit, iIdPlanoPrev, iIdPessoa, iSeqProposta,
      iIdPensionista: longInt;
	  sVlrATualMonBeneficio, sVlrATualMonContrib : string;
      sIdBeneficioAnt: String; //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929
      FIdEvento       : Integer; //Vander Campos - SOL 190523 Kintana 1801709
      { Public declarations }
   End;

Var
   frmCadRequerBenefPensionista: TfrmCadRequerBenefPensionista;
   iIdTitularSel, iIdPessjurSel, iIdPlanoPrevSel: Integer;

Function AbreRequerPensionista(psTipoChamador, // EV - Evento, CO - Concessao, MA - Manutencao de Processo
   pIdTitular, pIdPessJur, pIdPlanoPrev, pSeqProposta,
   pIdPensionista,
   pDataFalePensionista: String;
   Var psNumerosProcessos: String;
   pIdPlanoPrevBenef: String = '';
   pIdEventoAux : String = '';
   pIdBeneficioAnt: String = '';
   // SOL 190588 KTN 1802923 Otacilio
   pIdEventoGerador: integer = -1; //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929
   pIdPerfilInvest: integer = -1; // Alterado por FHBS - 19/09/2018 - SIG73833
   pIdPlanPrevContab: integer = -1 // Alterado por FHBS - 19/09/2018 - SIG73833
   ): boolean;

Implementation

Uses UAdmPrev, DBaseDados, UDataBase, UMensErro, UParticipante,
   fAguarde, FCadOpcoesBenef, FPedeBenefExigencia, UContribuicaoPrev,
   UMovReserva, FSelecionaBeneficiariosPensionista,
   UEventos, UIntegraBack, FMostraAux, DAPrev, FCadContaRequerimento,
   FEscolheMotivo, USistema, FPedeDadosBenefAnterior, FSelecionaLote,
   UFuncoesUteis, FLerTempoServico, DRelatAdmPREV2, DAPrevIntegraBack,

   RDemonstraConcessao,            // edilaine - SOL 262968 / PPM 1102753
   RDemonstraConcessaoINSS,        // edilaine - SOL 262968 / PPM 1102753

   FCadContaRequerBenef, FPRelDemosBenef, DDividaEP, UIntegraEP;

{$R *.DFM}
// ********************************** ********************** *************************
// ******************************* ROTINA A SER CHAMADA DAS TELAS ********************
// ********************************** ********************** *************************

Function AbreRequerPensionista(psTipoChamador, // EV - Evento, CO - Concessao, MA - Manutencao de Processo
   pIdTitular, pIdPessJur, pIdPlanoPrev, pSeqProposta,
   pIdPensionista,
   pDataFalePensionista: String;
   Var psNumerosProcessos: String;
   pIdPlanoPrevBenef: String = '';
   pIdEventoAux : String = '';
   pIdBeneficioAnt: String = '';
   // SOL 190588 KTN 1802923 Otacilio
   pIdEventoGerador: integer = -1; //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929
   pIdPerfilInvest: integer = -1; // Alterado por FHBS - 19/09/2018 - SIG73833
   pIdPlanPrevContab: integer = -1 // Alterado por FHBS - 19/09/2018 - SIG73833
   ): boolean;
Begin
   Application.CreateForm(TfrmCadRequerBenefPensionista, frmCadRequerBenefPensionista);

   If psTipoChamador = 'MA' Then
      frmCadRequerBenefPensionista.HelpContext := 160071
   Else
      If psTipoChamador = 'CO' Then
         frmCadRequerBenefPensionista.HelpContext := 160072
      Else
         If psTipoChamador = 'SI' Then
            frmCadRequerBenefPensionista.HelpContext := 160074;

   frmCadRequerBenefPensionista.bAbriuOutroForm := true;

   //Fanuel Junior SOL172381 Kintana1550197
   if pIdEventoAux = '' then
      pIdEventoAux := '0';

   If pIdPlanoPrevBenef = '' Then Begin
         pIdPlanoPrevBenef := pIdPlanoPrev;
      End;

   With frmCadRequerBenefPensionista Do
      Begin
         FIdEvento := pIdEventoGerador; // Vander Campos - SOL 190523 Kintana 1801709
         sTipoFormChamador := psTipoChamador;
         sTipoTelaBenef := sTipoFormChamador;

         //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929
         sIdBeneficioAnt := pIdBeneficioAnt;
         //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929

         sDataFalePensionista := pDataFalePensionista;
         iIdTitular := StrToInt(pIdTitular);
         iIdPessJur := StrToInt(pIdPessJur);
         iIdPlanoPrevTit := StrToInt(pIdPlanoPrev);
         iIdPlanoPrev := StrToInt(pIdPlanoPrevBenef);
         iSeqProposta := StrToInt(pSeqProposta);
         iIdPensionista := StrToInt(pIdPensionista);
         iIdEventoAux   := StrToInt(pIdEventoAux);

         PerfilPensionista.iIdPerfilInvest := pIdPerfilInvest; // Alterado por FHBS - 19/09/2018 - SIG73833
         PerfilPensionista.iIdPlanPrevContab := pIdPlanPrevContab; // Alterado por FHBS - 19/09/2018 - SIG73833

      End;
   //frmCadRequerBenefPensionista.
   frmCadRequerBenefPensionista.ShowModal;

   psNumerosProcessos := Copy(frmCadRequerBenefPensionista.sNumerosProcessos,
      2,
      length(frmCadRequerBenefPensionista.sNumerosProcessos) - 1
      );

   frmCadRequerBenefPensionista.Free;
   Result := True;
End;

// ********************************** ********************** *************************
// ********************************** PROCEDIMENTOS AUXILIARES ***********************
// ********************************** ********************** *************************

Function TfrmCadRequerBenefPensionista.CalculaAlteradores(pcTipo : Char;
                                               psAnoMesRef : String;
                                               pdValorCalculo : Double;
                                               Var dValorTotalAlteradores : Currency;
                                               piIdContribuicao : Integer = -1;
                                               piNumLancamento  : LongInt = -1;
                                               piflgevento : LongInt = -1): Boolean;
Var
  sDataRefInd, sAnoMesAnt, sSQL, sValorAlterador, sDataPrevisaoRecebimento,
  sComplementoSQL, sFlgInterno, sAnoMesInicio : String;
  dValorAlterador : Double;
  bErro : Boolean;
Begin
  Result := True;
  dValorTotalAlteradores := 0;

  sAnoMesRefAux := ''; //SOL 232043 PPM 396781

            // SOL 232043 PPM 396781
            If (Copy(psAnoMesRef,6,2) <> '13') Then
            psAnoMesRef := psAnoMesRef
            else
            begin
              sAnoMesRefAux := psAnoMesRef; // SOL 232043 PPM 396781
              psAnoMesRef := Copy(psAnoMesRef,1,5)+'11';
              // SOL 232043 PPM 396781
            end;  
    
  if StrToFloat(FormatFloat('#0.00',pdValorCalculo)) = 0 then Exit;
  if DbLAlterador.Text <> 'Sim' then Exit;

  If pdValorCalculo > 0 Then Begin
    sComplementoSQL := '(FLGATRASO = 1) AND ';
  End Else Begin
    sComplementoSQL := '(FLGDEVOL  = 1) AND ';
  End;

  If pcTipo = 'B' Then Begin { ALTERADORES BENEFICIOS }


    //BRUNO AZEVEDO SOL 202213 KINTANA 1954318
    If pdValorCalculo > 0 Then Begin
      sComplementoSQL := '(FLGATRASO = 1) AND ';
    End Else Begin
      sComplementoSQL := '(FLGDEVOL  = 1) AND ';
    End;

    sFlgInterno := 'AS';

    sSQL := 'SELECT '+
            '  AT.IDREGRACALCULO, T.CODALTERADOR, T.DESCRICAO '+
            'FROM   '+
            '  TIPOALTERADOR T, ALTERADORXBENEF AT '+
            'WHERE  '+
            '  (AT.FLGCOBRA = 1) AND '+
            sComplementoSQL+
            '  (AT.IDBENEFICIO = '+qryDet.FieldByName('IDBENEFICIO').AsString+') AND '+
            '  (AT.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+') AND '+
            '  (T.CODALTERADOR = AT.CODALTERADOR) '+
            'ORDER BY '+
            '  AT.NUMORDEM ';

  End Else Begin            { ALTERADORES CONTRIBUIÇÃO }

    sFlgInterno := 'AS';


    //BRUNO AZEVEDO SOL 202213 KINTANA 1954318
    If pdValorCalculo > 0 Then Begin
      sComplementoSQL := '(FLGDEVOL  = 1) AND ';
    End Else Begin
      sComplementoSQL := '(FLGATRASO = 1) AND ';
    End;

    sSQL := 'SELECT '+
            '  AT.IDREGRACALCULO, T.CODALTERADOR, T.DESCRICAO '+
            'FROM   '+
            '  TIPOALTERADOR T, ALTERADORXCONTRIB AT '+
            'WHERE '+
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
    { Buscar Data de previsao de recebimento }
    sDataPrevisaoRecebimento := CriticaDataCobrancaSit(dtmAPrev.qry,
                                           IntToStr(iIdFundacao),
                                           qryDet.FieldByName('IDPLANOPREV').AsString,
                                           sFlgInterno,
                                           'N',
                                           Copy(psAnoMesRef,6,2),Copy(psAnoMesRef,1,4),
                                           true);

    if Trim(sDataPrevisaoRecebimento) = '' then sDataPrevisaoRecebimento := FormatDateTime('dd/mm/yyyy', date);

    sDataRefInd  := '01/'+Copy(psAnoMesRef,6,2)+'/'+Copy(psAnoMesRef,1,4);
    if qryDet.FieldByName('DataInicioFund').AsString <> '' then
       sAnoMesInicio := formatdatetime('yyyy/mm',qryDet.FieldByName('DataInicioFund').Asdatetime)
    else
       sAnoMesInicio := '';

    If pcTipo = 'B' Then
    begin
       sSQL := 'SELECT '+OraNumero(FloatToStr(pdValorCalculo)) + ' AS VALOR, '+
               QuotedStr(QryAlteradorCorrecao.FieldByName('CODALTERADOR').AsString) + ' AS CODALTERADOR, ';
    end
    ELSE
    begin
       sSQL := 'SELECT '+OraNumero(FloatToStr(pdValorCalculo)) + ' AS VALOR, '+
               QuotedStr(QryAlteradorCorrecao.FieldByName('CODALTERADOR').AsString) + ' AS ALTERADOR, '+
               inttostr(piflgevento)                                             + ' AS FLGEVENTO,  '+
               QuotedStr(sAnoMesLoteConcessao)           + ' AS PROXMESCOB,  ';
    end;

    sSQL := sSQL +
                      QuotedStr(QryAlteradorCorrecao.FieldByName('DESCRICAO').AsString)    + ' AS NOMEALTERADOR, '+
                      QuotedStr(sDataRefInd)                + ' AS DATAREF, '+
                      QuotedStr('0')                        + ' AS FLGMIGRACAO, '+
                      QuotedStr(sAnoMesAnt)                 + ' AS ANOMESREFANT, '+
                      QuotedStr(psAnoMesRef)                + ' AS ANOMESREF, '+
                      QuotedStr(psAnoMesRef)                + ' AS MESREFERENCIA,    '+
                      QuotedStr(sDataPagamentoConcessao)         + ' AS DATARECEBIMENTO,  '+
                      QuotedStr(sDataPrevisaoRecebimento)   + ' AS DATAPREVISAORECE, '+

                      QuotedStr(sAnoMesInicio)              + ' AS ANOMESACERTOINI, '+
                      IntToStr (Sistema.IdModulo)           + ' AS IDMODULO, '+
                      QuotedStr(sAnoMesLoteConcessao)       + ' AS ANOMESACERTOFIM,  '+
                      '7'                                   + ' AS TIPOMOV           '+    //edilaine - SIG70414

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
    InsereCorrecaoMonetaria(pcTipo,qryDet, psAnoMesRef,
                            dValorAlterador,
                            piNumLancamento);
    QryAlteradorCorrecao.Next;
  End;

  dValorTotalAlteradores := StrToFloat(FormatFloat('#0.00',dValorTotalAlteradores))

End; { CalculaAlteradores }  // SOL 132938



procedure TfrmCadRequerBenefPensionista.InsereCorrecaoMonetaria(pcTipoCorracao : Char; { B - Beneficio C - Contribuição }
                                                     QryDados       : TwwQuery;
                                                     psAnoMesRef    : String;
                                                     pdValor        : Double;
                                                     piNumLancamento : LongInt = -1 );
Var
  iIdRubrica : Integer;
  bBenefProprio : Boolean;
  sFlgTipo, sDataInicio, sDataFinal : String;
  QryAuxiliar : Twwquery;
begin
  // ************************************************************************ //
  // INSERIR CORREÇÃO DE BENEFICIOS NA HSTATRASOBENEF OU NA HSTATRASOCONTRIB  //
  // ************************************************************************ //

  if StrToFloat(FormatFloat('#0.00',pdValor)) = 0 then  Exit;

  If pcTipoCorracao = 'B' Then Begin

  QryFatorAtualizacao.Close;
  QryFatorAtualizacao.Parambyname('COTMESREF').asString := QryDados.FieldByName('DATAINICIOFUND').AsString ;
  QryFatorAtualizacao.Open;
  QryFatorAtualizacao.Locate('MESINDICE',(sAnoMesLoteConcessao),[]);

  if QryFatorAtualizacao.FieldByName('COTACAO').asFloat = 1.0 then exit;
    { BENEFICIO }

    sFlgTipo := 'A'; { Atraso, pagar para o associado }
    if pdValor < 0 then begin
      sFlgTipo := 'D'; { Devolução, cobrar do associado }
    end;
    pdValor := Abs(pdValor);

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT SEQBENEFICIO '+
                   ' FROM   hstbenefbfciario '+
                   ' WHERE  NUMEROPROCESSO = '+QryDados.FieldByName('NUMEROPROCESSO').AsString+
                   ' AND    IDBENEFICIO  = '+QryDados.FieldByName('IDBENEFICIO').AsString+
                   ' AND    IDPESSJUR    = '+QryDados.FieldByName('IDPESSJUR').AsString+
                   ' AND    IDPLANOPREV  = '+QryDados.FieldByName('IDPLANOPREV').AsString+
                   ' AND    IDPESSOA     = '+QryDados.FieldByName('IDPESSOA').AsString+
                   ' AND    IDTITULAR    = '+QryDados.FieldByName('IDTITULAR').AsString+
                   ' AND    SEQPROPOSTA  = '+QryDados.FieldByName('SEQPROPOSTA').AsString);
    qryAux.Open;

	// SOL 232043 PPM 396781
    if sAnoMesRefAux <> '' then
      psAnoMesRef := sAnoMesRefAux;


    sSQL :='INSERT INTO HSTATRASOBENEF '+
           ' (IDPESSJUR, IDTITULAR, IDPLANOPREV, MES, IDMOTIVO, NUMEROPROCESSO,  '+
           '  IDBENEFICIO, IDPESSOA, MESREFERENCIA, SEQPROPOSTA, SEQBENEFICIO,   '+
           '  CODALTERADOR, VALOR, FLGTIPO, FLGRETROATIVO)                       '+
           'VALUES ( '+
             QryDados.FieldByName('IDPESSJUR').AsString               +', '+
             QryDados.FieldByName('IDTITULAR').AsString               +', '+
             QryDados.FieldByName('IDPLANOPREV').AsString             +', '+
             QuotedStr(sAnoMesLoteConcessao)                          +', '+
             inttostr(prmIDMOTIVOFOLHABEN)                       +', '+
             QryDados.FieldByName('NUMEROPROCESSO').AsString          +', '+
             QryDados.FieldByName('IDBENEFICIO').AsString             +', '+
             QryDados.FieldByName('IDPESSOA').AsString                +', '+
             QuotedStr(psAnoMesRef)                          +', '+
             QryDados.FieldByName('SEQPROPOSTA').AsString             +', '+
             qryAux.FieldByName('SEQBENEFICIO').AsString             +', '+
             QryAlteradorCorrecao.FieldByName('CODALTERADOR').AsString        +', '+
             OraNumero(FloattoStr(Abs(pdValor)))                      +', '+
             QuotedStr(sFlgTipo)                                      +', '+
             '1'                                                      +') ';

    QryAuxiliar := Twwquery.Create(Self);
    QryAuxiliar.databasename := 'basedados';
    QryAuxiliar.SQL.Add(' SELECT NOME FROM BENEFICIO WHERE IDBENEFICIO = '+QryDados.FieldByName('IDBENEFICIO').AsString);
    QryAuxiliar.Open;

    sVlrATualMonBeneficio := sVlrATualMonBeneficio+#13+#10+
                             PreparaStr(psAnoMesRef                                  ,8)+
                             PreparaStr(QryAuxiliar.FieldByName('NOME').AsString     ,34)+
                             PreparaStr(' '                                          ,1)+
                            // PreparaStr('(+)'+FormatFloat('#0.00',0)                 ,10)+  //Andre Oliveira SOL 194556 Kintana 1855852
                            // PreparaStr('(-)'+FormatFloat('#0.00',Abs(pdValor))      ,12);  //Andre Oliveira SOL 194556 Kintana 1855852
                            PreparaStr('(+)'+FormatFloat('#0.00',Abs(pdValor))      ,12)+  //Andre Oliveira SOL 194556 Kintana 1855852
                             PreparaStr('(-)'+FormatFloat('#0.00',0)                 ,10); //Andre Oliveira SOL 194556 Kintana 1855852

    FreeAndNil(QryAuxiliar);

  End Else If pcTipoCorracao = 'C' Then Begin

    { CONTRIBUIÇÃO }

    sFlgTipo := 'D'; { Atraso, pagar para o associado }
    if pdValor < 0 then begin
      sFlgTipo := 'A'; { Devolução, cobrar do associado }
    end;

    pdValor := Abs(pdValor);

	// SOL 232043 PPM 396781
    if sAnoMesRefAux <> '' then
      psAnoMesRef := sAnoMesRefAux;


    sSQL :='INSERT INTO HSTATRASOCONTRIB '+
           '  (NUMRECEBIMENTO, MESREFERENCIA, MESCOBRANCA, IDMOTIVO, FLGTIPO, '+
           '   VALOR, CODALTERADOR, FLGEVENTO)                                '+
           'VALUES( '+
           IntToStr(piNumLancamento)                                    +', '+
           QuotedStr(psAnoMesRef)                                       +', '+
           QuotedStr(sAnoMesLoteConcessao)                              +', '+
           '3003'                                                       +', '+ // incluido fixo verificar como buscar
           QuotedStr(sFlgTipo)                                          +', '+
           OraNumero(FloattoStr(Abs(pdValor)))                          +', '+
           QryAlteradorCorrecao.FieldByName('CODALTERADOR').AsString    +', '+
           QuotedStr('0')                                               +') ';

    QryAuxiliar := Twwquery.Create(Self);
    QryAuxiliar.databasename := 'basedados';
    QryAuxiliar.SQL.Add(' SELECT C.NOME FROM HSTCONTRIBPREV HST , CONTRIBUICAO  C '+
                        ' WHERE C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO '+
                        ' AND   HST.NUMRECEBIMENTO = '+IntToStr(piNumLancamento)+
                        ' AND   HST.IDPESSOA = '+QryDados.FieldByName('IDPESSOA').AsString );
    QryAuxiliar.Open;

    sVlrATualMonContrib := sVlrATualMonContrib+#13+#10+
                           PreparaStr(psAnoMesRef                                  ,8)+
                           PreparaStr(QryAuxiliar.FieldByName('NOME').AsString     ,34)+
                           PreparaStr(' '                                          ,1)+
                           //PreparaStr('(+)'+FormatFloat('#0.00',Abs(pdValor))      ,12)+  //Andre Oliveira SOL 194556 Kintana 1855852
                           //PreparaStr('(-)'+FormatFloat('#0.00',0)                 ,10); //Andre Oliveira SOL 194556 Kintana 1855852
                           PreparaStr('(+)'+FormatFloat('#0.00',0)                 ,12)+  //Andre Oliveira SOL 194556 Kintana 1855852
                           PreparaStr('(-)'+FormatFloat('#0.00',Abs(pdValor))      ,10); //Andre Oliveira SOL 194556 Kintana 1855852


    FreeAndNil(QryAuxiliar);

  End; { If }



  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);
  try
     qryAux.ExecSQL;
     qryAux.Close; //SOL 144007/2802 Kintana 1003179
  except
     MessageDlg('Erro ao inserir Correção monetária. Verifique.', mtInformation, [mbOK], 0);
     Exit;
  end;

end;  // SOL 132938

Procedure TfrmCadRequerBenefPensionista.SelecionaReservaPart;
Begin

   qryReservaPart.Close;
   qryReservaPart.ParamByName('IdPessJur').Value := iIdPessJur;
   qryReservaPart.ParamByName('IdPlanoPrev').Value := iIdPlanoPrev;
   qryReservaPart.ParamByName('IdTitular').Value := iIdTitular;
   qryReservaPart.ParamByName('SeqProposta').Value := iSeqProposta;
   qryReservaPart.Open;


End;

Procedure TfrmCadRequerBenefPensionista.SelecionaProcesso(piNumeroProcesso: longInt);
Begin

   qry.Close;
   qry.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
   qry.Open;

   qryDet.Close;
   qryDet.ParamByName('NumeroProcesso').AsInteger := qry.ParamByName('NumeroProcesso').AsInteger;
   qryDet.Open;

   //
   PesqBeneficio;
   If (piNumeroProcesso = -1) Or
      (qryDet.IsEmpty)
      Then Begin
         qryBeneficio.Close;
         qryBeneficio.ParamByName('IdPlanoPrev').AsInteger := qryDet.FieldByName('IdPlanoPrev').AsInteger;
         qryBeneficio.Open;
      End
   Else Begin
         qryBeneficio.Close;
         qryBeneficio.ParamByName('IdPlanoPrev').AsInteger := qryDet.FieldByName('IdPlanoPrev').AsInteger;
         qryBeneficio.Open;

      End;

   qryBenefAux.Close;
   qryBenefAux.ParamByName('NumeroProcesso').AsInteger := qry.ParamByName('NumeroProcesso').AsInteger;
   qryBenefAux.Open;

   // Refazer query de beneficiario
   qryBeneficiario.Close;
   qryBeneficiario.ParamByName('IdTitular').AsInteger := iIdTitular;
   qryBeneficiario.ParamByName('IdPensionista').AsInteger := iIdPensionista;

   qryBeneficiario.ParamByName('IDBENEFICIO').AsInteger := qryBenefAux.FieldByname('IDBENEFICIO').AsInteger;
   qryBeneficiario.Open;

   If piNumeroProcesso <= 0
      Then Begin
         lblNumProcesso.Caption := 'Processo Nº ';
         lblSitProcesso.Caption := '';
      End
   Else Begin
         lblNumProcesso.Caption := 'Processo Nº ' + IntToStr(piNumeroProcesso);
         lblSitProcesso.Caption := 'Situação : ' + qry.FieldByName('Descricao').AsString;
      End;

   pnlMestre.Enabled := False;

   bbtnProcurar.Visible := False;
   sbtnConcedeUm.Enabled := False;
   iIdLoteConcessao := -1;
   NumeroProcesso := pINumeroProcesso;

End; // SelecionaProcesso

Procedure TfrmCadRequerBenefPensionista.PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta, piIdPensionista: longInt);
Var
   sMesRef,
      sIdTpPagtoAnt,
      sFlgBenefMinimo,
      sValorSalario,
      sValorUltBeneficio: String;
Begin
   qryTitular.Close;
   qryTitular.ParamByName('IdPessoa').Value := piIdTitular;
   qryTitular.ParamByName('IdPessJur').Value := piIdPessJur;
   qryTitular.ParamByName('IdPlanoPrev').Value := iIdPlanoPrevTit;
   qryTitular.ParamByName('SeqProposta').Value := piSeqProposta;
   qryTitular.Open;

   If qryTitular.IsEmpty Then Exit;

   // Preencher evento do falecimento do titular
   qryAux.Close;
   qryAux.SQl.Clear; { Utilizar parametros p }
   qryAux.SQL.Add(' SELECT EG.IDEVENTOGERADOR                           ' +
      ' FROM   EVENTOSPREV E, EVENTOGERADOR EG              ' +
      ' WHERE  E.IDPESSJUR        = ' + IntToStr(piIdPessJur) +
      ' AND    E.IDPLANOPREV      = ' + IntToStr(piIdPlanoPrev) +
      ' AND    E.IDPESSOA         = ' + IntToStr(piIdTitular) +
      ' AND    E.SEQPROPOSTA      = ' + IntToStr(piSeqProposta) +
      ' AND    EG.IDEVENTOGERADOR = E.IDEVENTOGERADOR       ' +
      ' AND    EG.FLGINTERNO      = ''FL''                  ');
   qryAux.Open;
   If Not qryAux.IsEmpty
      Then iIdEvento := qryAux.FieldByName('IDEVENTOGERADOR').AsInteger
   Else iIdEvento := -1;

   qryPensionista.Close;
   qryPensionista.ParamByname('IDTITULAR').AsInteger := piIdTitular;
   qryPensionista.Open;

   If qryPensionista.Locate('IDPESSOA', piIdPensionista, [loCaseInsensitive])
      Then Begin
         dblkpcmbPensionista.Text := qryPensionista.FieldbyName('NOME').AsString;
         edMatriculaPensionista.Text := qryPensionista.FieldbyName('MATRICULA').AsString;
         dtMortePensionista.Date := qryPensionista.FieldbyName('DATAMORTE').AsDateTime;
      End
   Else Begin
         dblkpcmbPensionista.Text := '';
         edMatriculaPensionista.Text := '';
         dtMortePensionista.Text := '';
      End;

   // Dados da Patrocinadora e do Plano
   sNomePatro := qryTitular.FieldByName('NomePatro').AsString;
   sNomePlano := qryTitular.FieldByName('NomePlano').AsString;
   sNomeTitular := qryTitular.FieldByName('Nome').AsString;
   sMatricula := qryTitular.FieldByName('Matricula').AsString;
   edNomeTitular.Text := sNomeTitular;
   edMatriculaParticipante.Text := sMatricula;


   sValorReserva := CalcReservaPart(piIdPessJur,
      piIdPlanoPrev,
      piIdTitular,
      -1,
      piSeqProposta,
      FormatDateTime('dd/mm/yyyy', date),
      FormatDateTime('dd/mm/yyyy', date),
      '',
      '',
      '-1',
      qryAux
      );

   sMesRef := FormatDateTime('yyyy/mm', date);
   sValorSalario := CalcSALPART(piIdPessJur, piIdTitular, sMesRef, qryAux);

   // Situacoes
   iIdSitFunc := qryTitular.FieldbyName('IdSitFunc').AsInteger;
   iIdSitPart := qryTitular.FieldbyName('IdSitPart').AsInteger;
   iIdSitPlanoPrev := qryTitular.FieldbyName('IdSitPlanoPrev').AsInteger;
   sTipoSitFunc := qryTitular.FieldbyName('TipoSit').AsString;

   If sTipoFormChamador = 'SI'
      Then Begin
         sFlgInternoAntes := qryTitular.FieldByName('FLGINTERNO').AsString;
         sFlgInternoDepois := qryTitular.FieldByName('FLGINTERNO').AsString;
         sIdSitPartAntes := qryTitular.FieldByName('IDSITPART').AsString;
         sIdSitPartDepois := qryTitular.FieldByName('IDSITPART').AsString;
         sIdSitFuncAntes := qryTitular.FieldByName('IDSITFUNC').AsString;
         sIdSitFuncDepois := qryTitular.FieldByName('IDSITFUNC').AsString;
         sIdSitPlanAntes := qryTitular.FieldByName('IDSITPLANOPREV').AsString;
         sIdSitPlanDepois := qryTitular.FieldByName('IDSITPLANOPREV').AsString;
      End;

   sNomeSitPart := qryTitular.FieldByName('NomeSitPart').AsString;
   sNomeSitFunc := qryTitular.FieldByName('NomeSitFunc').AsString;
   sNomeSitPlano := qryTitular.FieldByName('NomeSitPlano').AsString;


   bPossuiDivPrevid := (qryTitular.FieldByName('FLGDEVEPREVIDENC').AsString = '1');
   bPossuiDivAssist := (qryTitular.FieldByName('FLGDEVEASSISTENC').AsString = '1');


   bQueryTitular := True;

   If Not bAbriuOutroForm
      Then Begin
         SelecionaReservaPart;

         With qryBfciarioTitPlan Do
            Begin
               Close;
               ParamByName('IdTitular').Value := piIdTitular;
               ParamByName('SeqProposta').Value := piSeqProposta;
               ParamByName('IdPessJur').Value := piIdPessJur;
               ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
               Open;
            End;

         With qryMovReservaTemp Do
            Begin
               Close;
               ParamByName('IdTitular').Value := piIdTitular;
               ParamByName('SeqProposta').Value := piSeqProposta;
               ParamByName('IdPessJur').Value := piIdPessJur;
               ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
               ParamByName('NumeroProcesso').Value := iNumeroProcesso;
               Open;
            End;
      End Else Begin
         With qryBfciarioTitPlan Do
            Begin
               Close;
               ParamByName('IdTitular').Value := piIdTitular;
               ParamByName('SeqProposta').Value := piSeqProposta;
               ParamByName('IdPessJur').Value := piIdPessJur;
               ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
               Open;
            End;

      End; // if not bAbriuOutroForm


End; //PreencheDadosTitular

Procedure TfrmCadRequerBenefPensionista.PreencheDadosBeneficiario(piNumeroProcesso, piIdTitular, piIdPessoa, piIdPessJur, piIdPlanoPrev, piSeqProposta: longInt);
Begin
   iIdPessoa := piIdPessoa;
   If Not bAbriuOutroForm
      Then Begin
         With qryRelBenefPart Do
            Begin
               Close;
               ParamByName('IdPessoa').Value := piIdPessoa;
               ParamByName('IdTitular').Value := piIdTitular;
               ParamByName('SeqProposta').Value := piSeqProposta;
               ParamByName('IdPessJur').Value := piIdPessJur;
               ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
               ParamByName('NumeroProcesso').Value := iNumeroProcesso;
               Open;
            End;
      End; // if not bAbriuOutroForm

   // Verificar conta bancaria do recebedor

   If ((qryBeneficiario.FieldByName('IDRESPONSAVEL').AsInteger <= 0) Or
      (qryBeneficiario.FieldByName('IDRESPONSAVEL').AsInteger = piIdPessoa))
      Then Begin
         qryContaBancaria.Close;
         qryContaBancaria.ParamByName('IdPessoa').Value := piIdPessoa;
         qryContaBancaria.Open;
      End
   Else Begin
         qryContaBancaria.Close;
         qryContaBancaria.ParamByName('IdPessoa').Value := qryBeneficiario.FieldByName('IdResponsavel').AsInteger;
         qryContaBancaria.Open;
      End;


   qryDepentit.Close;
   qryDepentit.ParamByName('IDTITULAR').AsInteger := piIdTitular;
   qryDepentit.ParamByName('IDPESSOA').AsInteger := piIdPessoa;
   qryDepentit.Open;

   If qryBeneficiario.FieldByName('MATRICULA').AsString <> qryDepentit.FieldByName('MATRICULA').AsString
      Then Begin
         qryDepentit.Edit;
         dbeMatriculaBenef.Field.Value := qryBeneficiario.FieldByName('MATRICULA').AsString;
         //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
         MatriculaBenefInicial := qryBeneficiario.fieldbyname('MATRICULA').AsString;
      End;


End; //PreencheDadosBeneficiario


Function TfrmCadRequerBenefPensionista.TestaQuitacaoDividas: boolean;
Var
   fSaldoAtualizado,
      fSaldoDevedor,
      fParcelasAberto: Currency;
   retButton: word;
   sMensagemErro: String;
Begin
   // Quando o Pagamento do Beneficio é unico
   // Devemos verificar se o beneficio obriga quitar as dividas e se o Titular possui dividas.
   // Caso Positivo, A Situacao do Beneficio Permanece Pendente de Concessao ate que o Titular quite a divida
   Result := False;

   If (qryBeneficio.FieldByName('FLGQUITAPREVIDEN').AsString = '0') And bPossuiDivPrevid Then
      Begin
         MsgDlg('O participante ' + sNomeTitular + ' possui dívida previdenciária e o ' +
            'plano não permite a Concessão deste benefício com este tipo de dívida. ',
            'Informação', mtInformation, [mbOk, mbHelp], 0);

         Exit;
      End;


   iFlgEmprestimo := -1;
   If (qryBeneficio.FieldByName('FLGQUITAEMPRESTI').AsString = '1') Then
      Begin

         If Not dtmDividaEP.ValorDevidoMutuario(qryDet.FieldByName('IdPessoa').AsInteger,
            StrToDate(sDataPagamentoConcessao),
            -1,
            10,
            fSaldoAtualizado,
            fSaldoDevedor,
            fParcelasAberto,
            False,
            False) Then
            Begin
               MsgDlg('Ocorreram erros na apuração do saldo devedor de empréstimo. Verifique.', 'Erro', mtError, [mbOk], 0);
               Exit;
            End;

         If fSaldoAtualizado > 0 Then
            Begin
               If MsgDlg('Saldo de empréstimo: ' + FormatFloat('#,0.00', fSaldoDevedor) + #13 +
                  'Itens em aberto:     ' + FormatFloat('#,0.00', fParcelasAberto) + #13 +
                  'Saldo atualizado:    ' + FormatFloat('#,0.00', fSaldoAtualizado) + '.' + #13 + #13 +
                  'Este saldo será descontado na Folha de Benefícios. Deseja continuar a concessão ? ',
                  'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
                  Begin
                     If (qryBeneficio.FieldByName('FLGPERMITEQUITAR').AsString = '1') Then
                        Begin
                           If MsgDlg('Deseja continuar com a concessão sem quitar o empréstimo?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
                              Begin
                                 iFlgEmprestimo := 1;
                                 Result := True;
                                 Exit;
                              End;
                        End;

                     MsgDlg('Concessão cancelada.', 'Informação', mtInformation, [mbOK], 0);
                     Exit;
                  End;

               iFlgEmprestimo := 0;
               
               //inicio SOL 149370 KINTANA 1075548
               qryAux.close;
               qryaux.sql.clear;
               qryaux.sql.add('SELECT IDPLANOPREV FROM CONTRATOEMPTMO ');
               qryaux.sql.add('WHERE  Idplanoprev = '+ qryDet.FieldByName('IDPLANOPREV').Asstring );
               qryaux.sql.add('AND IDPESSOA    = '+ qryDet.FieldByName('IdPessoa').Asstring );
               qryaux.sql.add('AND IDBENEF     = '+ qryDet.FieldByName('IdPessoa').Asstring );
               qryaux.sql.add('AND FLGSITUACAO NOT IN (''C'', ''K'', ''Q'') ');
               qryAux.open;

               if not(qryAux.IsEmpty) then   //fim SOL 149370 KINTANA 1075548

               If Not (dtmDividaEP.QuitaContratosMutuario(qryDet.FieldByName('IdPessoa').AsInteger,
                  StrToDate(sDataPagamentoConcessao),
                  dtMortePensionista.Date,
                  8,
                  'B',
                  iIdLoteConcessao,
                  sMensagemErro
                  )) Then
                  Begin
                     MsgDlg('Ocorreram erros na quitação automática de empréstimo. Verifique.', 'Erro', mtError, [mbOk], 0);
                     Exit;
                  End;
            End;

      End
   Else
      iFlgEmprestimo := 2;

   Result := True;
End; // TestaQuitacaoDividas

Function TfrmCadRequerBenefPensionista.CalculaSaldoRealCont(piIdTipoReserva: integer; pdVlMovReal: double): double;
Var dVlSaldoCont: double;
Begin
   Result := 0;

   qryaux.Close;
   qryaux.sql.clear;
   qryaux.sql.Add(' SELECT MAX(IDHISTRESERVA) , DATAMOV, SALDOREAL ,IDEVENTOGERADOR,IDBENEFICIO, ' +
      '        IDCONTRIBUICAO,VLRCOTAS,VLRREAL, SALDOREALCONT ' +
      ' FROM   HISTMOVRESERVA   ' +
      ' WHERE  (IDPLANOPREV   = ' + IntToStr(iIdPlanoPrev) + ')' +
      ' AND    (IDPESSJUR     = ' + IntToStr(iIdPessJur) + ')' +
      ' AND    (IDTIPORESERVA = ' + IntToStr(piIdTipoReserva) + ')' +
      ' AND    (SEQPROPOSTA   = ' + IntToStr(iSeqProposta) + ')' +
      ' AND    ((IDPESSOA IS NULL) OR (IDPESSOA = ' + IntToStr(iIdTitular) + '))' +
      ' GROUP  BY DATAMOV, SALDOREAL,IDEVENTOGERADOR,IDBENEFICIO, ' +
      '        IDCONTRIBUICAO,VLRCOTAS,VLRREAL, SALDOREALCONT ');
   Try
      qryaux.open;
   Except
      Exit;
   End;

   If qryaux.IsEmpty
      Then dVlSaldoCont := pdVlMovReal
   Else Begin
         qryaux.Last;
         If (qryaux.FieldByName('IDEVENTOGERADOR').AsString = '') And
            (qryaux.FieldByName('IDBENEFICIO').AsString = '') And
            (qryaux.FieldByName('IDCONTRIBUICAO').AsString = '') And
            (qryaux.FieldByName('VLRCOTAS').AsFloat <= 0) //o último lançamento foi uma atualização monetária
         Then dVlSaldoCont := pdVlMovReal
         Else dVlSaldoCont := qryaux.fieldbyname('SALDOREALCONT').AsFloat - pdVlMovReal;
      End;
   qryaux.close;
   Result := dVlSaldoCont;
End; //CalculaSaldoRealCont

Function TfrmCadRequerBenefPensionista.DevolveReserva(piIdBeneficio, piIdBeneficiario: longint): boolean;
Var dValorTotalReserva,
   dValorDaCotaNaData,
      dNovoValorReserva,
      dValorADevolverEmCotas: double;
   sDataRef: String;

Begin
   Result := False;
   dValorTotalReserva := 0;

   qryMovReservaTemp.First;
   While Not qryMovReservaTemp.Eof Do
      Begin
         If (qryMovReservaTemp.FieldByName('IdBeneficio').AsInteger <> piIdBeneficio) Or
            (qryMovReservaTemp.FieldByName('IdPessoa').AsInteger <> piIdBeneficiario)
            Then Begin
               qryMovReservaTemp.Next;
               continue;
            End;

         // Preencher valor da reserva do participante hoje
         If Not qryReservaPart.Locate('IdTipoReserva', qryMovReservaTemp.FieldByName('IdTipoReserva').AsInteger, [loCaseInsensitive])
            Then Begin
               // nao encontrou a reserva
               qryMovReservaTemp.Next;
               continue;
            End;

         With qryReservaPart Do
            Begin
               Edit;
               FieldByName('VALORRESERVA').AsFloat := qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat;
               Post;
            End;

         qryMovReservaTemp.Delete;
      End;

   Result := True;
End; // DevolveReserva

Function TfrmCadRequerBenefPensionista.VerificaNumeroDependentes: boolean;
Var iNumDepIRRF,
   iNumDepSalF,
      iNumDepIRRFCad,
      iNumDepSalFCad: longint;
Begin
   Result := False;
   // Verificar se o No. de Dependentes para IRRF e para Salario Familia coincidem
   // com o no. de dependentes cadastrados no sistemas que dizem que conta para IRRF
   // e para Salario Familia
   With qryAux Do
      Begin
         // Se a fundacao parametrizou que utilizara o calculo automatica de numero
         // de dependentes, entao nao atualizar por esta rotina abaixo
         Close;
         SQL.Clear;
         SQL.Add(' SELECT VALORPARAM FROM PARAMFOLHA ' +
            ' WHERE NOMEPARAM = ''FLGNUMDEPIRNUMDEPSALFAM'' ');
         Open;
         If (Not IsEmpty) And (FieldbyName('VALORPARAM').AsString = '1')
            Then Begin
               Result := True;
               Exit;
            End;

         Close;
         SQl.Clear;
         SQL.Add(' SELECT NUMDEPIRRF, NUMDEPSALF FROM PESSOAFISICA WHERE IDPESSOA = ' + IntToStr(iIdTitular));
         Open;
         If IsEmpty
            Then Begin
               iNumDepIRRF := 0;
               iNumDepSalF := 0;
            End
         Else Begin
               If Trim(FieldByName('NumDepIRRF').AsString) <> ''
                  Then iNumDepIRRF := FieldByName('NUMDEPIRRF').AsInteger
               Else iNumDepIRRF := 0;
               If Trim(FieldByName('NumDepSALF').AsString) <> ''
                  Then iNumDepSalF := FieldByName('NUMDEPSALF').AsInteger
               Else iNumDepSalF := 0;
            End;
      End;

   With qryAux Do
      Begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT COUNT(IDPESSOA) AS NUMDEPIRRF FROM DEPENTIT ' +
            ' WHERE IDTITULAR = ' + IntToStr(iIdTitular) +
            ' AND   IDPESSOA <> IDTITULAR ' +
            ' AND   FLGCONTAIMPOSTOR = 1 ');
         Open;
         If IsEmpty
            Then iNumDepIRRFCad := 0
         Else iNumDepIRRFCad := FieldByName('NumDepIRRF').AsInteger;

         If (iNumDepIRRF <> iNumDepIRRFCad)
            Then Begin
               If MsgDlg(' Existem ' + IntToStr(iNumDepIRRFCad) + ' dependentes cadastrados ' +
                  ' no sistema para IRRF. Porém existem ' + InttoStr(iNumDepIRRF) +
                  ' dependentes informados nos dados do participante. ' +
                  ' Deseja atualizar este número no cadastro de participante ? ',
                  'Confirmação', mtConfirmation, [mbyes, mbno], 0) = mrYes
                  Then Begin
                     Result := True;
                     qryAux.Close;
                     qryAux.SQL.Clear;
                     qryAux.SQl.Add(' UPDATE PESSOAFISICA SET NUMDEPIRRF = ' + IntToStr(iNumDepIRRFCad) +
                        ' WHERE IDPESSOA = ' + IntToStr(iIdTitular));
                     Try
                        qryAux.ExecSQL;
                     Except
                        Result := False;
                     End;
                  End
               Else If MsgDlg(' Deseja continuar com o processo ? ', 'Confirmação', mtConfirmation, [mbyes, mbno], 0) = mrYes
                  Then Result := True
               Else Result := False;

            End
         Else Result := True;
      End; //with qryAux

   With qryAux Do
      Begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT COUNT(IDPESSOA) AS NUMDEPSALF FROM DEPENTIT ' +
            ' WHERE IDTITULAR = ' + IntToStr(iIdTitular) +
            ' AND   IDPESSOA <> IDTITULAR ' +
            ' AND   FLGCONTASALARIOF = 1 ');
         Open;
         If IsEmpty
            Then iNumDepSalFCad := 0
         Else iNumDepSalFCad := FieldByName('NumDepSALF').AsInteger;

         If (iNumDepSalF <> iNumDepSalFCad)
            Then Begin
               If MsgDlg(' Existem ' + IntToStr(iNumDepSalFCad) + ' dependentes cadastrados ' +
                  ' no sistema para Salário Família. Porém existem ' + InttoStr(iNumDepSalF) +
                  ' dependentes informados nos dados do participante. ' +
                  ' Deseja atualizar este número no cadastro de participante ? ',
                  'Confirmação', mtConfirmation, [mbyes, mbno], 0) = mrYes
                  Then Begin
                     Result := True;
                     qryAux.Close;
                     qryAux.SQL.Clear;
                     qryAux.SQl.Add(' UPDATE PESSOAFISICA SET NUMDEPSALF = ' + IntToStr(iNumDepSalFCad) +
                        ' WHERE IDPESSOA = ' + IntToStr(iIdTitular));
                     Try
                        qryAux.ExecSQL;
                     Except
                        Result := False;
                     End;
                  End
               Else If MsgDlg(' Deseja continuar com o processo ? ', 'Confirmação', mtConfirmation, [mbyes, mbno], 0) = mrYes
                  Then Result := True
               Else Result := False;
            End
         Else Result := True;
      End; //with qryAux
End; // VerificaNumeroDependentes


Function TfrmCadRequerBenefPensionista.MontaSQLBenefAssoc(piNumOrdem: longint): String;
Var sValor,
   sSQL: String;

   iNumBenefAssoc: integer;
Begin
   Result := '';

   iNumBenefAssoc := 0;
   qryBenefAux.First;
   While Not qryBenefAux.Eof Do
      Begin
         If qryBenefAux.FieldByName('NumOrdemEvento').AsInteger >= piNumOrdem
            Then Begin
               qryBenefAux.Next;
               continue;
            End;
         inc(iNumBenefAssoc);

         If qryBenefAux.FieldByName('FlgCalcTodoMes').AsInteger = 1
            Then Begin
               If Trim(qryBenefAux.FieldByName('VALORCOTAS').AsString) <> ''
                  Then sValor := qryBenefAux.FieldByName('VALORCOTAS').AsString
               Else sValor := '0';
            End
         Else Begin
               If Trim(qryBenefAux.FieldByName('VALORATUAL').AsString) <> ''
                  Then sValor := qryBenefAux.FieldByName('VALORATUAL').AsString
               Else sValor := '0';
            End;

         sSQL := sSQL + ',' + OraNumero(sValor) + ' AS VALORASSOCIADO' + IntToStr(iNumBenefAssoc);

         If Trim(qryBenefAux.FieldByName('VALORBASE1').AsString) <> ''
            Then sValor := qryBenefAux.FieldByName('VALORBASE1').AsString
         Else sValor := '0';
         sSQL := sSQL + ',' + OraNumero(sValor) + ' AS ASSOC' + IntToStr(iNumBenefAssoc) + 'OP1';

         If Trim(qryBenefAux.FieldByName('VALORBASE2').AsString) <> ''
            Then sValor := qryBenefAux.FieldByName('VALORBASE2').AsString
         Else sValor := '0';
         sSQL := sSQL + ',' + OraNumero(sValor) + ' AS ASSOC' + IntToStr(iNumBenefAssoc) + 'OP2';

         If Trim(qryBenefAux.FieldByName('VALORBASE3').AsString) <> ''
            Then sValor := qryBenefAux.FieldByName('VALORBASE3').AsString
         Else sValor := '0';
         sSQL := sSQL + ',' + OraNumero(sValor) + ' AS ASSOC' + IntToStr(iNumBenefAssoc) + 'OP3';
         qryBenefAux.Next;
      End; //while
   Result := sSQL;
End; //MontaSQLBenefAssoc

Function TfrmCadRequerBenefPensionista.VerificaBeneficioObrigatorio: boolean;
Var bExisteBenefDaMesmaOrdem,
   bExisteBenefNaoRequerido: boolean;
   iIdBeneficiarioAntes,
      iIdBenefAntes,
      iNumBenefNaoRequeridos: longint;
   sMsg,
      sNomesBeneficios: String;
   varfields: variant;
Begin
   Result := False;
   iIdBenefAntes := qryDet.FieldByName('IdBeneficio').AsInteger;
   iIdBeneficiarioAntes := qryDet.FieldByName('IdPessoa').AsInteger;

   // Fazer verificacoes
   varFields := VarArrayCreate([0, 1], varVariant);
   varFields[0] := iIdBenefAntes;
   varFields[1] := iIdBeneficiarioAntes;

   qryDet.Locate('IdBeneficio;IdPessoa', varFields, [loCaseInsensitive]);
   // HIGOR NAYDE FERREIRA SOL 211709/15287
   If bExisteBenefNaoRequerido
      Then Begin
         sNomesBeneficios := Copy(sNomesBeneficios, 3, length(sNomesBeneficios) - 2);
         if (sistema.idmodulo <> 454) then begin  //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
           If iNumBenefNaoRequeridos = 1
              Then sMsg := 'O benefício  ' + sNomesBeneficios + ' é obrigatório e não foi requerido.'
           Else sMsg := 'Os benefícios ' + sNomesBeneficios + ' são obrigatórios e não foram requeridos.';

           If MsgDlg(sMsg + 'Deseja confirmar o Requerimento do Processo ' + IntToStr(iNumeroProcesso) + ' ? ',
              'Confirmação', mtConfirmation, [mbYes, mbNo], 1) = mrNo
              Then Begin
                 TiraSQL(qryAux);
                 Exit;
              End;
         end;
      End;
   Result := True;
End; // VerificaBeneficioObrigatorio


Function TfrmCadRequerBenefPensionista.VerificaContribAtrasada(Var sMesAtraso: String): boolean;
Var sMesRef: String;
Begin
   Result := False;

   // Verificar se participante tem contribuicoes atrasadas
   frmAguarde.Mostra('Verificando contribuições atrasadas ... ');
   sMesRef := FormatFloat('yyyy/mm', dtInicioFund.Date);

   // Inclusão de plics para o campo  SITRECEBIMENTO
   With qryAux Do
      Begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT HST.MESREFERENCIA FROM HSTCONTRIBPREV HST ' +
            ' WHERE  (HST.IDPESSOA  = ' + IntToSTr(iIdTitular) + ')' +
            ' AND    (HST.IDPESSJUR = ' + IntToSTr(iIdPessJur) + ')' +
            ' AND    (HST.IDPLANOPREV = ' + IntToSTr(iIdPlanoPrev) + ')' +
            ' AND    (HST.SEQPROPOSTA = ' + IntToSTr(iSeqProposta) + ')' +
            ' AND    (HST.VALORESPERADO > 0 )  ' +
            ' AND    (HST.SITRECEBIMENTO IN (''0'',''1'',''3'')) ' +
            ' AND    (HST.MESREFERENCIA < ''' + sMesRef + ''') ' +
            ' AND    (HST.MESCOBRANCA   < ''' + sAnoMesLoteConcessao + ''')' +
            ' AND    (HST.IDMOTIVO      <> ' + IntToStr(prmIdMotDevolNaoIden) + ')' +
            ' AND    (HST.IDCONTRIBUICAO NOT IN (SELECT IDCONTRIBUICAO FROM PARAMDOTACAO ' +
            '                                    WHERE  IDPESSJUR   = ' + IntToSTr(iIdPessJur) +
            '                                    AND    IDPLANOPREV = ' + IntToSTr(iIdPlanoPrev) + ') )' +
            ' ORDER BY HST.MESREFERENCIA DESC');
         Open;
         If Not IsEmpty
            Then Begin
               sMesAtraso := FieldByName('MesReferencia').AsString;
               Result := True;
            End;
         Close;
      End; //with
   frmAguarde.Apaga;
End; // VerificaContribAtrasada


Function TfrmCadRequerBenefPensionista.CobraContribAtrasada(piIdPessJur, piIdPlanoPrev,
   piIdPessoa, piSeqProposta: longint;
   psDataInicioFund: String): boolean;
Var sMesRef: String;
   dValorPorBeneficiario: double;
   iContBeneficiario: longint;

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
      sIdEmpresaProp: String;

   sPlaContaDProvis,
      sPlaContaCProvis,
      sMsgErro: String;
   iNumRecebimento: LongInt;
Begin
   Result := False;

   // Se o participante falecido tiver contribuicoes atrasadas, o sistema deve :
   // 1. Acertar o histórico do participante inserindo uma devolucao para ele
   // 2. Inserir o registro de devolucao na TMPDESC para ser descontado dos
   //    dependentes
   frmAguarde.Mostra('Atualizando contribuições atrasadas ... ');

   sMesRef := Copy(psDataInicioFund, 7, 4) + '/' + Copy(psDataInicioFund, 4, 2);

   With qryAux Do
      Begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT HST.MESREFERENCIA,  HST.MESCOBRANCA,    HST.IDMOTIVO,   ' +
            '        HST.NUMRECEBIMENTO, HST.VALORESPERADO,  HST.VALOROP1,   ' +
            '        HST.VALOROP2,       HST.VALOROP3,       HST.DATAINICIO, ' +
            '        HST.DATAFINAL,      HST.IDCONTRIBUICAO, RP.CODPROVDESC, ' +
            '        RP.IDRUBRICA                                            ' +
            ' FROM   CONTPREV CP, RUBRICAXPESS RP, HSTCONTRIBPREV HST  ' +
            ' WHERE  (HST.IDPESSOA       = ' + IntToSTr(iIdTitular) + ')' +
            ' AND    (HST.IDPESSJUR      = ' + IntToSTr(iIdPessJur) + ')' +
            ' AND    (HST.IDPLANOPREV    = ' + IntToSTr(iIdPlanoPrev) + ')' +
            ' AND    (HST.SEQPROPOSTA    = ' + IntToSTr(iSeqProposta) + ')' +
            ' AND    (HST.VALORESPERADO > 0 )  ' +
            ' AND    (HST.SITRECEBIMENTO <> ''2'') ' +
            ' AND    (HST.SITRECEBIMENTO <> ''5'') ' +
            ' AND    (HST.SITRECEBIMENTO <> ''9'') ' +
            ' AND    (HST.MESREFERENCIA < ''' + sMesRef + ''') ' +
            ' AND    (HST.IDCONTRIBUICAO NOT IN (SELECT IDCONTRIBUICAO FROM PARAMDOTACAO ' +
            '                                    WHERE  IDPESSJUR   = ' + IntToSTr(iIdPessJur) +
            '                                    AND    IDPLANOPREV = ' + IntToSTr(iIdPlanoPrev) + ') )' +
            ' AND    (CP.IDPLANOPREV    = HST.IDPLANOPREV)             ' +
            ' AND    (CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)          ' +
            ' AND    (RP.IDRUBRICA      = CP.IDRUBRICAATRASO)          ' +
            ' AND    (RP.IDPESSOA       = ' + IntToStr(iIdFundacao) + ')   ');
         Open;

         If IsEmpty Then
            Begin
               frmAguarde.Apaga;
               MsgDlg('Contribuições Atrasadas com parâmetros incompletos. ' + #13 +
                  'Verifique se as contribuições possuem rubrica de atraso e se as mesmas ' +
                  'estão associadas à Fundação.', 'Erro', mtError, [mbOk], 0);
               Exit;
            End;

         While Not Eof Do
            Begin
               //BRUNO AZEVEDO SOL 130057 KINTANA 717976
               if (iIdEvento <> 334) and (iIdEvento <> 337) and (iIdEvento <> 15) and (iIdEvento <> 336) and (iIdEvento <> 345) then begin
                 // Acertar histórico do participante
                 iNumRecebimento := InsereHstContribPREV(dtmAPrev.qryAux,
                    iIdTitular,
                    1,
                    iIdPessJur,
                    iIdPlanoPrev,
                    FieldByName('IdContribuicao').AsInteger,
                    prmIDMOTIVOFOLHABEN,
                    FieldByName('MesReferencia').AsString,
                    Copy(sDataPagamentoConcessao, 7, 4) + '/' + Copy(sDataPagamentoConcessao, 4, 2),
                    -1,
                    sDataPagamentoConcessao,
                    '',
                    FieldByName('ValorEsperado').AsFloat,
                    FieldByName('ValorEsperado').AsFloat,
                    0,
                    -1,
                    1,
                    FieldByName('ValorOp1').AsFloat,
                    FieldByName('ValorOp2').AsFloat,
                    FieldByName('ValorOp3').AsFloat,
                    FieldByName('DataInicio').AsString,
                    FieldByName('DataFinal').AsString,
                    'AS',
                    2,
                    1,
                    iIdLoteConcessao,
                    'F',
                    0,
                    0,
                    1,
                    1);

                 If iNumRecebimento < 0 Then
                    Begin
                       frmAguarde.Apaga;
                       Exit;
                    End;

                 dtmAPrev.qryAux.Close;
                 dtmAPrev.qryAux.SQL.Clear;
                 dtmAPrev.qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO = 9  ' +
                    ' WHERE  MESREFERENCIA  = ''' + FieldByName('MESREFERENCIA').AsString + '''' +
                    ' AND    MESCOBRANCA    = ''' + FieldByName('MESREFERENCIA').AsString + '''' +
                    ' AND    IDMOTIVO       =   ' + FieldByName('IDMOTIVO').AsString +
                    ' AND    NUMRECEBIMENTO =   ' + FieldByName('NUMRECEBIMENTO').AsString);
                 Try
                    dtmAPrev.qryAux.ExecSQL;
                 Except
                    frmAguarde.Apaga;
                    Exit;
                 End;
               end;
               //BRUNO AZEVEDO SOL 130057 KINTANA 717976

               // Contar quantos beneficiario tem e guardar o IdPessoa de Cada um deles
               qryDet.First;
               iContBeneficiario := 0;
               While Not qryDet.Eof Do
                  Begin
                     If (qryDet.FieldByName('IdSitBeneficio').AsInteger = 1) Or
                        (qryDet.FieldByName('IdSitBeneficio').AsInteger = 2) Or
                        (qryDet.FieldByName('FLGPECULIO').AsInteger = 1)
                        Then inc(iContBeneficiario);
                     qryDet.Next;
                  End;

               dValorPorBeneficiario := FieldByName('ValorEsperado').AsFloat / iContBeneficiario;

               qryDet.First;
               While Not qryDet.Eof Do
                  Begin

                     // ******************************************************************************
                     // Preencher Informacoes de Integracao com Financeiro e Contabilidade
                     // ******************************************************************************
                     If Not dtmAPrevIntegraBack.BuscaInfIntegra(iIdPessJur,
                        iIdPlanoPrev,
                        iIdTitular,
                        qryDet.FieldByName('IdPessoa').AsInteger,
                        FieldByName('IdContribuicao').AsInteger,
                        'C',
                        'B',
                        0,
                        Copy(sDataPagamentoConcessao, 7, 4) + '/' + Copy(sDataPagamentoConcessao, 4, 2),
                        FieldByName('MesReferencia').AsString,
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
                        sPlaContaDProvis,
                        sPlaContaCProvis,
                        sUnidNegoc,
                        sIdEmpresaProp,
                        'R',
                        True,
                        sMsgErro)
                        Then
                        Begin
                           frmAguarde.Apaga;
                           MsgDlg('Acerto de Contribuição : Erro ao buscar parametrização financeira. Verifique.', 'Erro', mtError, [mbOk], 0);
                           Exit;
                        End;

                     // Inserir divida na TMPDESC rateada por beneficiario
                     If Not InsereTMPDESC(dtmAPrev.qryAux,
                        '', // psCODALTERADOR
                        sCodCentroCustoC, // psCODCENTROCUSTOC
                        sCodCentroCustoD, // psCODCENTROCUSTOD
                        sCodCentroRespon, // psCODCENTRORESPON
                        '', // psCODDOCUMENTOEFET
                        '', // psCODDOCUMENTOPREV
                        sCodPortForma, // psCODPORTFORMA
                        FieldByName('CodProvDesc').AsString,
                        sCodSubConta, // psCODSUBCONTA
                        sCodTipDoc, // psCODTIPDOC
                        sCodTipRecDes, // psCODTIPRECDES
                        '', // psCOMPLDOCUMENTO
                        sDataPagamentoConcessao,
                        '', // psDATARECEBIMENTO
                        sDataPagamentoConcessao,
                        'Contrib. atrasada de particip. falecido. ',
                        '', // psEXERCICIO
                        '', // psFLGALTERADOR
                        'A', // psFLGATRASODEVOL
                        'B', // psFLGDESCFOLHA
                        '1', // psFLGDESCONTO
                        '1', // psFLGEXISTEHST
                        '',
                        'P', // psFLGTIPODESC
                        FieldByName('IdContribuicao').AsString, // psIDDESCONTO
                        sIdEmpresaProp, // psIDEMPCOBRANCA
                        sIdEmpresaProp, // psIDEMPRESA
                        sIdEmpresaProp, // psIDEMPRESAPROP
                        '', // psIDFAVORECIDO
                        IntToStr(iIdFundacao), // psIDFUNDACAO
                        IntToStr(iIdLoteConcessao), // psIDLOTE
                        '16', // psIDMODULO
                        IntToStr(prmIdMotivoFOLHABEN), // psIDMOTIVO
                        IntToStr(iIdPessJur), // psIDPESSJUR
                        qryDet.FieldByName('IdPessoa').AsString,
                        IntToStr(iIdPlanoPrev), // psIDPLANOPREV
                        IntToStr(iIdPlanoPrev), // psIDPLANPREVCONTAB
                        FieldByName('IdRubrica').AsString, // psIDPROVENTO
                        IntToStr(iIdTitular), // psIDTITULAR
                        qryTitular.FieldByName('InscricaoNumero').AsString,
                        qryTitular.FieldByName('Matricula').AsString,
                        Copy(sDataPagamentoConcessao, 7, 4) + '/' + Copy(sDataPagamentoConcessao, 4, 2),
                        FieldByName('MesReferencia').AsString,
                        '', // psNODOCUMENTO
                        '', // psPERIODO
                        sPlaContaC, // psPLACONTAC
                        sPlaContaD, // psPLACONTAD
                        sPlano, // psPLANO
                        'P', // psRECPAG
                        '***', // psREFERENCIA
                        '1', // psSEQPROPOSTA
                        '16', // SISTORIGEM
                        '0', // psSITENVIO
                        prmTpOperFolhaBen, // psTIPCODIGO,
                        sUnidNegoc, // psUNIDNEGOC,
                        FloatToStr(dValorPorBeneficiario),
                        FieldByName('ValorOp1').AsString, // psVALORBASE1,
                        FieldByName('ValorOp2').AsString, // psVALORBASE2,
                        FieldByName('ValorOp3').AsString, // psVALORBASE3,
                        '', // psVALORINFO,
                        '', // psVALORRECEBIDO
                        iNumRecebimento //NUMRECEBIMENTO
                        ) Then
                        Begin
                           frmAguarde.Apaga;
                           Exit;
                        End;

                     qryDet.Next;
                  End;
               Next;
            End;
      End; //with

   frmAguarde.Apaga;
   Result := True;
End; // CobraContribAtrasada

// ********************************** ********************** *************************
// ********************************** PROCEDIMENTOS OVERRIDE *************************
// ********************************** ********************** *************************

Procedure TfrmCadRequerBenefPensionista.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
   Inherited;
   // Se for concessao de beneficio, desbilitar o inserir
   sbtnInserir.Enabled := ((sTipoFormChamador <> 'CO') And (sTipoFormChamador <> 'MA'));
   sbtnConceder.Enabled := (sTipoFormChamador = 'CO') And (Not qryDet.IsEmpty);
   sbtnProcurar.Enabled := (sTipoFormChamador <> 'EV');

   sbtnImprimirSimulacao.Visible := False;
   sbtnImprimirSimulacao.Enabled := False;

   sbtnDemonsSRB.Visible := False;
   sbtnDemonsSRB.Enabled := False;

   LblAlterador.visible              := sbtnConceder.Enabled; // SOL 132938
   DbLAlterador.visible              := sbtnConceder.Enabled; // SOL 132938
   DbLAlterador.Enabled := True;
   
   If sTipoFormChamador = 'SI'
      Then Begin
         If Not prmFlgGravaSimulBenef
            Then sbtnProcurar.Enabled := False
         Else sbtnProcurar.Enabled := True;
         sbtnImprimirSimulacao.Visible := True;
         sbtnImprimirSimulacao.Enabled := True;
      End
   Else Begin
         sbtnDemonsSRB.Visible := True;
         sbtnDemonsSRB.Enabled := True;
      End;

End;

Procedure TfrmCadRequerBenefPensionista.CmeCadastroConfirma(Sender: TObject);
Begin
   Try
      //Vinicius Ferreira SOL 159322 KINTANA 1308856
      with qryBfciariotitPlanAux do
         if Active and UpdatesPending then ApplyUpdates;

      //Renato Visoni SOL 162023 KINTANA 1373448
      with qryBenefAux do begin
        if qryBenefAux.State in [dsEdit] then begin
          if Active and UpdatesPending then ApplyUpdates;
        end else begin
          if Active and UpdatesPending then CancelUpdates;
        end;
      end;
      //Renato Visoni SOL 162023 KINTANA 1373448

      With qry Do Begin
            If qry.State In [dsEdit, dsInsert] Then qry.Post;
            If Active And UpdatesPending
               Then ApplyUpdates;
         End;

      With qryBfciarioTitPlan Do
         If Active And UpdatesPending Then ApplyUpdates;

      With qryDet Do
         If Active And UpdatesPending
            Then Begin
               // Andre Imakawa - SIG 61218 - Inicio
               if (Sistema.IdModulo = 454) and (sTipoFormChamador <> 'CO')
                 and (sTipoFormChamador <> 'SI') then
               begin
                  updDet.InsertSQL.Clear;
                  updDet.InsertSQL.Add('insert into BENEFBFCIARIO' + #13#10 +
                  '  (NUMEROPROCESSO, IDPESSJUR, IDPLANOPREV, IDTITULAR, IDPESSOA,' + #13#10 +
                  'SEQPROPOSTA,' + #13#10 +
                  '   IDBENEFICIO, CODPORTFORMA, IDSITBENEFICIO, IDDEPENDENCIA,' + #13#10 +
                  'IDTPPAGTOBENEFIC,' + #13#10 +
                  '   VALORATUAL, DATAREQUERIMENTO, DATAINICIO, DATAFINAL,' + #13#10 +
                  'FLGFORMAPAGTO, VALORCALCULADO, DATAULTREAJUSTE, VLRCALCINSS,' + #13#10 +
                  'VLRINFINSS,' + #13#10 +
                  '   DATAINICIOINSS, NUMPROCINSS, DATAINICIOFUND, VALORCOTAS,' + #13#10 +
                  'VALORTOTAL,' + #13#10 +
                  '   DATACONCESSAO, FLGPROVISORIO, PERCPROVISORIO,' + #13#10 +
                  'PRAZOPROVISORIO, ULTMESREAJUSTE,' + #13#10 +
                  '   ULTVALORATUALREAJ, DIBBENEFANT, VALORBENEFANT,' + #13#10 +
                  'VALORBINSSANT1, VALORBINSSANT2,' + #13#10 +
                  '   VALORBINSSANT3, FLGBENEFMIN, VALORSRB, IDPLANOORIGEM,VALORNADIB,IDTITBENEF,' + #13#10 +
                  'IDPLANPREVCONTAB, FONTEPAGADORA, PLACONTAD, PLACONTAC,' + #13#10 +
                  'CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3, VALORBASE1, VALORBASE2, VALORBASE3' + #13#10 +
                  ',IDPERFILINVEST' + #13#10 +
                  ')' + #13#10 +
                  'values' + #13#10 +
                  '  (:NUMEROPROCESSO, :IDPESSJUR, :IDPLANOPREV, :IDTITULAR, :IDPESSOA,' + #13#10 +
                  ':SEQPROPOSTA,' + #13#10 +
                  '   :IDBENEFICIO, :CODPORTFORMA, :IDSITBENEFICIO, :IDDEPENDENCIA,' + #13#10 +
                  ':IDTPPAGTOBENEFIC,' + #13#10 +
                  '   :VALORATUAL, :DATAREQUERIMENTO, :DATAINICIO, :DATAFINAL,' + #13#10 +
                  ':FLGFORMAPAGTO, :VALORCALCULADO, :DATAULTREAJUSTE, :VLRCALCINSS,' + #13#10 +
                  ':VLRINFINSS,' + #13#10 +
                  '   :DATAINICIOINSS, :NUMPROCINSS, :DATAINICIOFUND, :VALORCOTAS,' + #13#10 +
                  ':VALORTOTAL,' + #13#10 +
                  '   :DATACONCESSAO, :FLGPROVISORIO, :PERCPROVISORIO,' + #13#10 +
                  ':PRAZOPROVISORIO, :ULTMESREAJUSTE,' + #13#10 +
                  '   :ULTVALORATUALREAJ, :DIBBENEFANT, :VALORBENEFANT,' + #13#10 +
                  ':VALORBINSSANT1, :VALORBINSSANT2,' + #13#10 +
                  '   :VALORBINSSANT3, :FLGBENEFMIN, :VALORSRB, :IDPLANOORIGEM, :VALORNADIB, :IDTITBENEF,' + #13#10 +
                  ':IDPLANPREVCONTAB, :FONTEPAGADORA,  :PLACONTAD, :PLACONTAC,' + #13#10 +
                  ':CAMPOTEXTO1, :CAMPOTEXTO2, :CAMPOTEXTO3, :VALORBASE1, :VALORBASE2, :VALORBASE3' + #13#10 +
                  ',:IDPERFILINVEST' + #13#10 +
                  ')');
               end;
               // Andre Imakawa - SIG 61218 - Fim

               updDet.ModifySQL.Clear;
               If (sTipoFormChamador = 'CO') And bConcedeuBeneficio
                  Then updDet.ModifySQL.Add(' UPDATE BENEFBFCIARIO                              ' +
                     ' SET                                               ' +
                     '   CODPORTFORMA = :CODPORTFORMA,                   ' +
                     '   IDSITBENEFICIO = :IDSITBENEFICIO,               ' +
                     '   IDDEPENDENCIA = :IDDEPENDENCIA,                 ' +
                     '   IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC,           ' +
                     '   DATAREQUERIMENTO = :DATAREQUERIMENTO,           ' +
                     '   DATAINICIO = :DATAINICIO,                       ' +
                     '   DATAFINAL = :DATAFINAL,                         ' +
                     '   FLGFORMAPAGTO = :FLGFORMAPAGTO,                 ' +
                     '   VALORCALCULADO = :VALORCALCULADO,               ' +
                     '   VLRCALCINSS = :VLRCALCINSS,                     ' +
                     '   VLRINFINSS = :VLRINFINSS,                       ' +
                     '   DATAINICIOINSS = :DATAINICIOINSS,               ' +
                     '   NUMPROCINSS = :NUMPROCINSS,                     ' +
                     '   DATAINICIOFUND = :DATAINICIOFUND,               ' +
                     '   VALORCOTAS = :VALORCOTAS,                       ' +
                     '   DATACONCESSAO = :DATACONCESSAO,                 ' +
                     '   FLGPROVISORIO = :FLGPROVISORIO,                 ' +
                     '   PERCPROVISORIO = :PERCPROVISORIO,               ' +
                     '   PRAZOPROVISORIO = :PRAZOPROVISORIO,             ' +
                     '   DIBBENEFANT = :DIBBENEFANT,                     ' +
                     '   VALORBENEFANT = :VALORBENEFANT,                 ' +
                     '   VALORBINSSANT1 = :VALORBINSSANT1,               ' +
                     '   VALORBINSSANT2 = :VALORBINSSANT2,               ' +
                     '   VALORBINSSANT3 = :VALORBINSSANT3,               ' +
                     '   FLGBENEFMIN = :FLGBENEFMIN,                     ' +
                     '   VALORSRB = :VALORSRB                            ' +
                     ' WHERE                                             ' +
                     '   NUMEROPROCESSO = :OLD_NUMEROPROCESSO AND        ' +
                     '   IDPESSJUR = :OLD_IDPESSJUR AND                  ' +
                     '   IDTITULAR = :OLD_IDTITULAR AND                  ' +
                     '   IDPLANOPREV = :OLD_IDPLANOPREV AND            ' +
                     '   IDPESSOA = :OLD_IDPESSOA AND                    ' +
                     '   SEQPROPOSTA = :OLD_SEQPROPOSTA AND              ' +
                     '   IDBENEFICIO = :OLD_IDBENEFICIO                  ')
               Else updDet.ModifySQL.Add(' UPDATE BENEFBFCIARIO                              ' +
                     ' SET                                               ' +
                     '   CODPORTFORMA = :CODPORTFORMA,                   ' +
                     '   IDSITBENEFICIO = :IDSITBENEFICIO,               ' +
                     '   IDDEPENDENCIA = :IDDEPENDENCIA,                 ' +
                     '   IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC,           ' +
                     '   VALORATUAL = :VALORATUAL,                       ' +
                     '   DATAREQUERIMENTO = :DATAREQUERIMENTO,           ' +
                     '   DATAINICIO = :DATAINICIO,                       ' +
                     '   DATAFINAL = :DATAFINAL,                         ' +
                     '   FLGFORMAPAGTO = :FLGFORMAPAGTO,                 ' +
                     '   VALORCALCULADO = :VALORCALCULADO,               ' +
                     '   DATAULTREAJUSTE = :DATAULTREAJUSTE,             ' +
                     '   VLRCALCINSS = :VLRCALCINSS,                     ' +
                     '   VLRINFINSS = :VLRINFINSS,                       ' +
                     '   DATAINICIOINSS = :DATAINICIOINSS,               ' +
                     '   NUMPROCINSS = :NUMPROCINSS,                     ' +
                     '   DATAINICIOFUND = :DATAINICIOFUND,               ' +
                     '   VALORCOTAS = :VALORCOTAS,                       ' +
                     '   VALORTOTAL = :VALORTOTAL,                       ' +
                     '   DATACONCESSAO = :DATACONCESSAO,                 ' +
                     '   FLGPROVISORIO = :FLGPROVISORIO,                 ' +
                     '   PERCPROVISORIO = :PERCPROVISORIO,               ' +
                     '   PRAZOPROVISORIO = :PRAZOPROVISORIO,             ' +
                     '   ULTMESREAJUSTE = :ULTMESREAJUSTE,               ' +
                     '   ULTVALORATUALREAJ = :ULTVALORATUALREAJ,         ' +
                     '   DIBBENEFANT = :DIBBENEFANT,                     ' +
                     '   VALORBENEFANT = :VALORBENEFANT,                 ' +
                     '   VALORBINSSANT1 = :VALORBINSSANT1,               ' +
                     '   VALORBINSSANT2 = :VALORBINSSANT2,               ' +
                     '   VALORBINSSANT3 = :VALORBINSSANT3,               ' +
                     '   FLGBENEFMIN = :FLGBENEFMIN,                     ' +
                     '   VALORSRB = :VALORSRB,                           ' +
                     IFF(Sistema.IdModulo <> 454, '''','  ,IDPERFILINVEST = :IDPERFILINVEST ')+  //edilaine - SIG55933 // Andre Imakawa - SIG 61218
                     ' WHERE                                             ' +
                     '   NUMEROPROCESSO = :OLD_NUMEROPROCESSO AND        ' +
                     '   IDPESSJUR = :OLD_IDPESSJUR AND                  ' +
                     '   IDPLANOPREV = :OLD_IDPLANOPREV AND              ' +
                     '   IDPLANOORIGEM = :OLD_IDPLANOORIGEM AND              ' +
                     '   IDTITULAR = :OLD_IDTITULAR AND                  ' +
                     '   IDPESSOA = :OLD_IDPESSOA AND                    ' +
                     '   SEQPROPOSTA = :OLD_SEQPROPOSTA AND              ' +
                     '   IDBENEFICIO = :OLD_IDBENEFICIO                  ');
               ApplyUpdates;
            End;

      If sTipoFormChamador <> 'SI'
         Then Begin
            With qryReservaPart Do
               If Active And UpdatesPending Then ApplyUpdates;

            With qryMovReservaTemp Do
               If Active And UpdatesPending Then ApplyUpdates;

         End;

      With qryRelBenefPart Do
         If Active And UpdatesPending Then ApplyUpdates;

      With qryRelBenefPart Do
         If Active And UpdatesPending And bGravaBenefReferencia Then ApplyUpdates;


      With qryDepentit Do
         If Active And UpdatesPending Then ApplyUpdates;


      SelecionaProcesso(qry.FieldByName('NumeroProcesso').AsInteger);

   Except
      Raise;
   End;


End; // CmeCadastro.Confirma(Self)

Procedure TfrmCadRequerBenefPensionista.CmeCadastroCancel(Sender: TObject);
Begin
   Try


      With qryDepentit Do
         If Active And UpdatesPending Then CancelUpdates;


      With qryBfciarioTitPlan Do
         If Active And UpdatesPending Then CancelUpdates;

      With qryMovReservaTemp Do
         If Active And UpdatesPending Then CancelUpdates;
   Except
      Raise;
   End;

   Inherited;


   If (sTipoFormChamador = 'CO') And (dtmBaseDados.dbBaseDados.InTransaction)
      Then dtmBaseDados.dbBaseDados.RollBack;

End;

Procedure TfrmCadRequerBenefPensionista.CmeCadastroDelete(Sender: TObject);
Begin
   // Verificar restricoes a exclusao
   qryMovReservaTemp.First;
   While Not qryMovReservaTemp.Eof Do
      Begin
         qryMovReservaTemp.Delete;
      End;

   qryRelBenefPart.First;
   While Not qryRelBenefPart.Eof Do
      Begin
         qryRelBenefPart.Delete;
      End;

   qryDet.First;
   While Not qryDet.Eof Do
      Begin
         qryDet.Delete;
      End;
   qry.Delete;
   dtmBaseDados.dbBaseDados.ApplyUpdates([qryRelBenefPart, qryMovReservaTemp, qryDet, qry]);
   SelecionaProcesso(-1);
End; // CmeCadastro.Delete(Self)

Procedure TfrmCadRequerBenefPensionista.CmeCadastroInsert(Sender: TObject);
Begin
   iNumeroProcesso := LeUltRegistro(qryAux, 'PROCESSOBENEF');

   SelecionaProcesso(iNumeroProcesso);

   iNumBenef := 0;

   Inherited;

   pnlMestre.Enabled := True;
   bbtnProcurar.visible := True;
   dtMortePensionista.Date := StrToDate(sDataFalePensionista);

   qry.FieldByName('DtEvento').AsDateTime := dtMortePensionista.Date;
   qry.FieldByName('DtDireito').AsDateTime := date;

   lblNumProcesso.Caption := 'Processo Nº ' + IntToStr(iNumeroProcesso);
   lblSitProcesso.Caption := 'Situação : Pendente de Concessão';

   bGravaBenefReferencia := False;
   bExecutouRegraConcessao := False;
   lblNomeBenef.Caption := '';
   sValorTotal := '0';
   sDataInicioPagto := FormatDateTime('dd/mm/yyyy', date);
End; // CmeCadastro.Insert(Self)

Procedure TfrmCadRequerBenefPensionista.CmeCadastroEdit(Sender: TObject);
Begin
   Inherited;
   pnlMestre.Enabled := True;
   bbtnProcurar.visible := False;
   bGravaBenefReferencia := False;
   bExecutouRegraConcessao := False;
   bConcedeuBeneficio := False;
   bPerguntouCancelar := False;


   // Desabilitar itens que nao possam ser alterados nem na MANUTENCAO DE PROCESSO
   If ((sTipoFormChamador = 'MA') And (qry.FieldbyName('IDSITPROCESSO').AsInteger <> 4))
      Then Begin
         dtInicioFund.Enabled := True;
         reValorBeneficio.Enabled := False;
         reValorSRB.Enabled := False;
         dtDataRequerimento.Enabled := True;
         dtDataInicio.Enabled := True;
         dtDataFinal.Enabled := True;
         pnlBenefProv.Enabled := False;
         dblkcmbTpPgtoBenef.Enabled := False;
      End
   Else Begin
         dtInicioFund.Enabled := True;
         reValorBeneficio.Enabled := True;
         reValorSRB.Enabled := True;
         dtDataRequerimento.Enabled := True;
         dtDataInicio.Enabled := True;
         dtDataFinal.Enabled := True;
         pnlBenefProv.Enabled := True;
         dblkcmbTpPgtoBenef.Enabled := False; // Peterson Victor SOL 268616 PPM 1266499
      End;

End; // CmeCadastro.Edit(Self)

Procedure TfrmCadRequerBenefPensionista.CmeDetalheConfirma(Sender: TObject);
Begin
   //
   Inherited;
End; // CmeDetalhe.Confirma(Self)

Procedure TfrmCadRequerBenefPensionista.CmeCadastroFind(Sender: TObject);
Var sTempoServAnoDigitado,
   sTempoServMesDigitado,
      sTempoServDiaDigitado: String;
Begin
   Inherited;
   If (MontaSelect.ValoresChave.count > 0) And (MontaSelect.ValoresChave[0] <> '')
      Then Begin
         iNumeroProcesso := StrToInt(MontaSelect.ValoresChave[0]);
         iIdTitular := StrToInt(MontaSelect.ValoresChave[1]);
         iSeqProposta := StrToInt(MontaSelect.ValoresChave[2]);
         iIdPessJur := StrToInt(MontaSelect.ValoresChave[3]);
         iIdPlanoPrev := StrToInt(MontaSelect.ValoresChave[4]);
         iIdPensionista := StrToInt(MontaSelect.ValoresChave[5]);
         iIdBenefTit := StrToInt(MontaSelect.ValoresChave[6]);
         iIdPlanoPrevTit := StrToInt(MontaSelect.ValoresChave[7]);
         bQueryTitular := False;
         bQuerySalarios := False;
         bQueryContribuicoes := False;
         bPerguntouCancelar := False;

         If sTipoFormChamador = 'SI'
            Then Begin
               Application.CreateForm(TfrmLerTempoServico, frmLerTempoServico);
               frmLerTempoServico.ShowModal;
               If frmLerTempoServico.ModalResult <> mrOk
                  Then Exit;
               sTempoServAnoDigitado := OraNumero(frmLerTempoServico.edTempoServTotal.Text);
               sTempoServMesDigitado := OraNumero(frmLerTempoServico.edTempoServMes.Text);
               sTempoServDiaDigitado := OraNumero(frmLerTempoServico.edTempoServDia.Text);
               frmLerTempoServico.Free;

               dtmAPrev.qry.Close;
               dtmAPrev.qry.Sql.Clear;
               dtmAPrev.qry.Sql.Add(' SELECT TEMPOSERVTOTAL, TEMPOSERVTOTMES, TEMPOSERVTOTDIA  ' +
                  ' FROM   ELEGPATRO ' +
                  ' WHERE  IDPESSJUR = ' + IntToStr(iIdPessJur) + ' AND ' +
                  '        IDPESSOA  = ' + IntToStr(iIdTitular));
               dtmAPrev.qry.Open;

               sTempoServAnoAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTAL').AsString);
               sTempoServMesAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTMES').AsString);
               sTempoServDiaAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTDIA').AsString);

               dtmAPrev.qry.Close;
               dtmAPrev.qry.Sql.Clear;
               dtmAPrev.qry.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVTOTAL   = ' + sTempoServAnoDigitado + ', ' +
                  '                      TEMPOSERVTOTMES  = ' + sTempoServMesDigitado + ', ' +
                  '                      TEMPOSERVTOTDIA  = ' + sTempoServDiaDigitado +
                  ' WHERE IDPESSJUR = ' + IntToStr(iIdPessJur) +
                  ' AND   IDPESSOA  = ' + IntToStr(iIdTitular));
               Try
                  dtmAPrev.qry.ExecSQL;
               Except
                  On E: EDBEngineError Do
                     Begin
                        MostrarErro(E);
                        Exit;
                     End;
               End;
            End;
         iIdCalculo := 0;
         iIdCalculoGeral := 0;

         SelecionaProcesso(iNumeroProcesso);
         { No caso de pensionista o Titular esta no campo IDBENEFTIT e usa o IDPLANOORIGEM tbm }
         { No caso de migrado usar o campo IDPLANOORIGEM                                       }
         bAbriuOutroForm := False;

         PreencheDadosTitular(iIdBenefTit, iIdPessJur, iIdPlanoPrevTit, iSeqProposta, iIdPensionista);
         PreencheDadosBeneficiario(iNumeroProcesso, iIdTitular, iIdPensionista, iIdPessJur, iIdPlanoPrev, iSeqProposta);
      End;
End; // CmeCadastro.Find(Self)

Procedure TfrmCadRequerBenefPensionista.CmeDetalheInsert(Sender: TObject);
Var sDataInicioAnt,
   sValorAnt,
      sNomeBenefAnt,
      sIdTpPagtoAnt,
      sFlgBenefMinAnt,
      sUltMesReajAnt,
      sDataFalePensionistaAnt,
      sCodBeneficioAnt: String;
   sValorBase1Ant,
      sValorBase2Ant,
      sValorBase3Ant: String;
Begin

   If Trim(dblkpcmbPensionista.Text) = ''
      Then Begin
         MsgDlg('Selecione o Pensionista.', 'Erro', mtError, [mbOk, mbHelp], 0);
         dblkpcmbPensionista.SetFocus;
         bbtnCancelarDetClick(frmCadRequerBenefPensionista);
         Exit;
      End;

   If (iIdTitular <= 0) Or (iIdPessJur <= 0) Or (iIdPlanoPrev <= 0) Or (iSeqProposta <= 0)
      Then Begin
         MsgDlg('Escolha o Participante Titular.', 'Erro', mtError, [mbOk, mbHelp], 0);
         If (bbtnProcurar.Enabled) And (bbtnProcurar.visible) Then
            bbtnProcurar.SetFocus;
         bbtnCancelarDetClick(frmCadRequerBenefPensionista);
         sbtnInsDet.Enabled := True;
         Exit;
      End;
   lblNomeBenef.Caption := '';

   //Vander Campos - SOL 190523 Kintana 1801709   
   PesqBeneficio;
   qryBeneficio.Close;
   qryBeneficio.ParamByName('IdPlanoPrev').Value := iIdPlanoPrev;
   qryBeneficio.Open;

   Inherited;

   rValorReal := 0;
   rValorCotas := 0;
   rValorDaCotaBenef := 0;
   sDataDaCotaBenef := '';

   reValorBeneficio.Text := '0';
   reValorSRB.Text := '0';
   dtDataRequerimento.Date := date;

   qryDet.FieldByName('ValorAtual').AsFloat := 0;
   qryDet.FieldByName('ValorCalculado').AsFloat := 0;
   qryDet.FieldByName('DataRequerimento').AsDateTime := date;
   qryDet.FieldByName('FlgFormaPagto').AsString := 'F';
   qryDet.FieldByName('FlgProvisorio').AsInteger := 0;
   dbrgrpBenefProvisorio.ItemIndex := 0;

   If (Trim(dtInicioFund.Text) = '') And (Trim(dtMortePensionista.Text) <> '')
      Then Begin
         qryDet.FieldByName('DataInicioFund').AsDateTime := dtMortePensionista.Date;
         dtInicioFund.Date := dtMortePensionista.Date;
      End;

   bbtnOpcoes.Visible := False;
   lblAgencia.Visible := False;
   dblkpcmbAgencia.Visible := False;

   If (dblkpcmbBeneficio.Enabled) And (dblkpcmbBeneficio.visible)
      Then dblkpcmbBeneficio.SetFocus;


   If Trim(sDataInicioPagto) <> ''
      Then Begin
         qryDet.FieldByName('DataInicio').AsString := sDataInicioPagto;
         dtDataInicio.Date := StrToDate(sDataInicioPagto);
      End
   Else Begin
         qryDet.FieldByName('DataInicio').AsDateTime := dtMortePensionista.Date;
         dtDataInicio.Date := StrToDate(dtMortePensionista.Text);
      End;

   lblPercConc.Visible := False;
   dbedPercConc.Visible := False;
   lblPercent.Visible := False;
   lblPrazoProv.Visible := False;
   dbedPrazoProv.Visible := False;
   lblMesProv.Visible := False;

   iIdBenefReferencia := -1;
   bReajustouInss := False;
   bRecalculouProvisorio := False;

   // Exibir dados do benefício anterior. Deixar o usuário informar tais dados
   BuscaDadosBeneficioAnterior(qryAux,
      iIdPessJur, iIdPlanoPrev, iIdTitular,
      qryDet.FieldByName('IdBeneficio').AsInteger,
      qryBeneficio.FieldByName('FlgReferencia').AsInteger,
      FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
      sDataInicioAnt,
      sValorAnt,
      sNomeBenefAnt,
      sIdTpPagtoAnt,
      sUltMesReajAnt,
      sFlgBenefMinAnt,
      sDataFalePensionistaAnt,
      sCodBeneficioAnt,
      sValorBase1Ant,
      sValorBase2Ant,
      sValorBase3Ant,
      sNumProcINSS,
      True,
      iIdPensionista
      );

   If Trim(sDataInicioAnt) <> ''
      Then Begin
         qryDet.FieldByName('DibBenefAnt').AsString := sDataInicioAnt;
         qryDet.FieldByName('ValorBenefAnt').AsString := ClienteNumero(sValorAnt);
      End;

End; // CmeDetalhe.Insert(Self)

Procedure TfrmCadRequerBenefPensionista.CmeDetalheEdit(Sender: TObject);
Begin
   Inherited;

   // Habilitar os componentes
   bbtnSelecionaBeneficiarios.Enabled := true;
   dtDataRequerimento.Enabled := true;
   dblkpcmbBeneficiario.Enabled := true;
   dbeMatriculaBenef.Enabled := True;

   dtInicioFund.Enabled := true;
   reValorBeneficio.Enabled := true;
   reValorSRB.Enabled := True;
   reValorTotal.Enabled := true;
   dtDataInicio.Enabled := true;
   dtDataFinal.Enabled := true;
   dblkcmbTpPgtoBenef.Enabled := False; // Peterson Victor SOL 268616 PPM 1266499
   dblkpcmbPortForma.Enabled := true;


   PesqBeneficio;
   {
   qryBeneficio.Close;
   qryBeneficio.ParamByName('IdEventoGerador').Value := iIdEvento; // SOL 170753 Kintana 1529212
   qryBeneficio.ParamByName('IdPlanoPrev').Value := iIdPlanoPrev;
   qryBeneficio.Open;
   If iIdEvento = 4 Then // SOL 170753 Kintana 1529212
         Begin
            qryBeneficio.Filter := 'FLGPECULIO = 1'; // SOL 170753 Kintana 1529212
            qryBeneficio.Filtered := True; // SOL 170753 Kintana 1529212
         end
         else
             begin
            qryBeneficio.Filtered := False; // SOL 170753 Kintana 1529212
             end  ;
   }

   reValorTotal.Text := qryDet.FieldByName('ValorTotal').AsString;

   If qryBeneficio.FieldbyName('FlgCalcTodoMes').AsInteger = 1
      Then Begin
         reValorBeneficio.Text := FormatFloat('#0.000000', qryDet.FieldByName('ValorCotas').AsFloat);
         rValorCotas := StrToFloat(FormatFloat('#0.000000', qryDet.FieldByName('ValorCotas').AsFloat));
         rValorReal := StrToFloat(FormatFloat('#0.000000', ConverteBeneficioParaReal(rValorCotas)));
      End
   Else Begin
         reValorBeneficio.Text := FormatFloat('#0.00', qryDet.FieldByName('ValorAtual').AsFloat);
         rValorReal := StrToFloat(FormatFloat('#0.00', qryDet.FieldByName('ValorAtual').AsFloat));
         rValorCotas := 0;
      End;

   reValorSRB.Text := FormatFloat('#0.00', qryDet.FieldByName('ValorSRB').AsFloat);

   If qryDet.FieldByName('FlgProvisorio').AsInteger <= 0
      Then Begin
         lblPercConc.Visible := False;
         dbedPercConc.Visible := False;
         lblPercent.Visible := False;
         lblPrazoProv.Visible := False;
         dbedPrazoProv.Visible := False;
         lblMesProv.Visible := False;
      End
   Else Begin
         lblPercConc.Visible := True;
         dbedPercConc.Visible := True;
         lblPercent.Visible := True;
         lblPrazoProv.Visible := True;
         dbedPrazoProv.Visible := True;
         lblMesProv.Visible := True;
      End;
   bRecalculouProvisorio := True;

   // Se o parametro do beneficio por plano (flgbenefinf) definir que
   //    o no. de beneficiarios elegiveis
   // Entao iNumBenef := qryBeneficiario.RecordCount, pois a qryBeneficiario
   //       está com os elegiveis
   // Senao, abrir uma query auxiliar com todos os beneficiarios do beneficios

   qryAux.Close;
   qryAux.SQL.Clear;

   qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BFCIARIOTITPLAN BF, BENEFPLANPREV BP ' +
      ' WHERE  (BF.IDTITULAR   = ' + IntToStr(iIdTitular) + ') ' +
      ' AND    (BF.IDPESSJUR   = ' + IntToStr(iIdPessJur) + ') ' +
      ' AND    (BF.IDPLANOORIGEM = ' + IntToStr(iIdPlanoPrev) + ') ' +
      ' AND    (BF.SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ') ' +
      ' AND    (BF.IDBENEFICIO = ' + qryBeneficio.FieldByName('IdBeneficio').AsString + ') ' +
      ' AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV) ' +
      ' AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO) ' +
      ' AND    ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  '
      );
   qryAux.Open;

   iNumBenef := qryAux.RecordCount;

   If Not qryBeneficio.Active Then Exit;

   If (qryBeneficio.FieldByName('flgBenefInf').AsInteger = 0) And
      (qryBeneficio.FieldByName('IdBeneficio').AsString <> '')
      Then Begin
         qryAux.Close;
         qryAux.SQL.Clear;

         qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BFCIARIOTITPLAN BF, BENEFPLANPREV BP ' +
            ' WHERE  (BF.IDTITULAR   = ' + IntToStr(iIdTitular) + ') ' +
            ' AND    (BF.IDPESSJUR   = ' + IntToStr(iIdPessJur) + ') ' +
            ' AND    (BF.IDPLANOORIGEM = ' + IntToStr(iIdPlanoPrev) + ') ' +
            ' AND    (BF.SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ') ' +
            ' AND    (BF.IDBENEFICIO = ' + qryBeneficio.FieldByName('IdBeneficio').AsString + ') ' +
            ' AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV) ' +
            ' AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO) ' +
            ' AND    ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  '
            );
         qryAux.Open;
         iNumBenef := qryAux.RecordCount;
      End;

End;
// ********************************** ********************** *************************
// ********************************** MÉTODOS DO FORM  ***** *************************
// ********************************** ********************** *************************

Procedure TfrmCadRequerBenefPensionista.FormCreate(Sender: TObject);
Begin
   sTipoFormChamador := '';
   Inherited;

   bbtnCancelar.ModalResult := mrNone;

   qryTpPgtoBenef.Close;
   qryTpPgtoBenef.Open;
   qryFolha.Close;
   qryFolha.ParamByName('idfundacao').asinteger := iIdFundacao;
   qryFolha.Open;
   qryPortForma.Close;
   qryPortForma.Open;
   qryAgenciaResgate.Close;
   qryAgenciaResgate.Open;

//   //Marcos Merola SOL161215  07/11/2011 Inicio
//   qryUser.Close;  Retirado pelo SOL 206918
//   qryUser.Open;
//   //Marcos Merola SOL161215  07/11/2011 Fim

   SelecionaProcesso(-1);
   bQueryTitular := False;
   bQuerySalarios := False;
   bQueryContribuicoes := False;
   qryBeneficiario.open;  // SOL 162003 Kintana 1373069 E SOL 162023 Kintana 1373448 INCLUIDO O qryBeneficiario.open;
   bAbriuOutroForm := False;
   qryIncluiAlterador.Open; // SOL 132938
   DblAlterador.Text := 'Não'; // SOL 132938 // SOL194556

   PerfilPensionista.iIdPerfilInvest := -1; // Alterado por FHBS - 19/09/2018 - SIG73833
   PerfilPensionista.iIdPlanPrevContab := -1; // Alterado por FHBS - 19/09/2018 - SIG73833
End;

Procedure TfrmCadRequerBenefPensionista.bbtnProcurarClick(Sender: TObject);
Begin
   MontaSelectPart.Executar;

   If (MontaSelectPart.ValoresChave.Count > 0) And (MontaSelectPart.ValoresChave[0] <> '')
      Then Begin
         iIdTitular := StrToInt(MontaSelectPart.ValoresChave[0]);
         iIdPessJur := StrToInt(MontaSelectPart.ValoresChave[1]);
         iIdPlanoPrev := StrToInt(MontaSelectPart.ValoresChave[2]);
         iSeqProposta := StrToInt(MontaSelectPart.ValoresChave[7]);
         bQueryTitular := False;
         bQuerySalarios := False;
         bQueryContribuicoes := False;
         { iIdPlanoPrev trocado por iIdPlanoPrevTit }
         PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrevTit, iSeqProposta, iIdPensionista);
      End; // if montasel.valoreschave.count > 0
End;


Procedure TfrmCadRequerBenefPensionista.qryBeforePost(DataSet: TDataSet);
Begin

   If Trim(dblkpcmbPensionista.Text) = ''
      Then Begin
         MsgDlg('O Pensionista deve ser informado.', 'Erro', mtError, [mbOk, mbHelp], 0);
         dblkpcmbPensionista.SetFocus;
         Abort;
      End;

   If Trim(dtMortePensionista.Text) = ''
      Then Begin
         MsgDlg('A Data do Evento deve ser informada.', 'Erro', mtError, [mbOk, mbHelp], 0);
         If (dtMortePensionista.Enabled) And (dtMortePensionista.visible) Then
            dtMortePensionista.SetFocus;
         Abort;
      End;


   If iIdEvento < 0 Then
      iIdEvento := qryBeneficio.fieldbyname('ideventogerador').AsInteger;

   Inherited;
   If qry.State = dsInsert
      Then Begin
         qry.FieldByName('NumeroProcesso').AsInteger := iNumeroProcesso;
         qry.FieldByName('DtRegistro').AsDateTime := date;
         If sTipoFormChamador <> 'SI'
            Then qry.FieldbyName('IdSitProcesso').AsInteger := 4 // Pendente de Concessao
         Else qry.FieldbyName('IdSitProcesso').AsInteger := 8; // Simulacao
         sNumerosProcessos := sNumerosProcessos + ',' + IntToStr(iNumeroProcesso);
         qry.FieldByName('IdEventoGerador').AsInteger := iIdEvento;
      End;

End;

Procedure TfrmCadRequerBenefPensionista.qryDetBeforePost(DataSet: TDataSet);
Var bBeneficioMinimo, bErro: boolean;
Begin
   If qryDet.State = dsInsert
      Then Begin
         qryDet.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
         { No caso de beneficio para o próprio beneficiario   }
         { utilizar novamente o IDTITULAR do beneficio, pois o Pensionista não é   }
         { beneficiario dele mesmo (BFCIARIOTITPLAN) dando erro de relacionamento. }
         If iIdPensionista = qrybeneficiario.fieldbyname('IDPESSOA').AsInteger Then
            qryDet.FieldByName('IDTITULAR').AsInteger := iIdTitular
         Else
            qryDet.FieldByName('IDTITULAR').AsInteger := iIdPensionista;
         {-}
         qryDet.FieldByName('IDTITBENEF').AsInteger := iIdTitular;
         qryDet.FieldByName('IDPESSOA').AsInteger := qrybeneficiario.fieldbyname('IDPESSOA').AsInteger;
         qryDet.FieldByName('IDPESSJUR').AsInteger := iIdPessJur;
         qryDet.FieldByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
         qryDet.FieldByName('IDPLANOORIGEM').AsInteger := StrToInt(BuscaPlanoOrigem(iIdPessJur,
            iIdTitular,
            FormatDateTime('yyyy/mm', date)
            ));
         qryDet.FieldByName('SEQPROPOSTA').AsInteger := iSeqProposta;
         qryDet.FieldByName('IDBENEFICIO').AsInteger := qrybeneficio.fieldbyname('IDBENEFICIO').AsInteger;
         If sTipoFormChamador <> 'SI'
            Then qryDet.FieldByName('IDSITBENEFICIO').AsInteger := 4
         Else qryDet.FieldByName('IDSITBENEFICIO').AsInteger := 8;
         qryDet.FieldByName('IDDEPENDENCIA').AsString := qrybeneficiario.fieldbyname('IDDEPENDENCIA').AsString;
         qryDet.FieldByName('FLGFORMAPAGTO').AsString := 'F';
         qryDet.FieldByName('DESCRICAO').AsString := 'Pendente de Concessão';
         qrydet.fieldbyname('NOME').AsString := qrybeneficio.fieldbyname('NOME').AsString;
         qrydet.fieldbyname('DEPEN').AsString := qrybeneficiario.fieldbyname('NOME').AsString;
      End;

   If Trim(reValorTotal.Text) = '' Then reValorTotal.Text := '0';
   If Trim(reValorBeneficio.Text) = '' Then reValorBeneficio.Text := '0';
   If Trim(reValorSRB.Text) = '' Then reValorSRB.Text := '0';

   //edilaine - SIG55933 - inicio
   if sTipoFormChamador <> 'CO' then
     qryDet.FieldByName('IDPERFILINVEST').AsInteger := PerfilAtual.iIdPerfilInvest
   else
     //PerfilAtual.iIdPerfilInvest := qryDet.FieldByName('IDPERFILINVEST').AsInteger;            //edilaine SIG113318
     PerfilAtual := BuscaPerfilInvestimento( qryDet.FieldByName('IDPERFILINVEST').AsInteger );   //edilaine SIG113318
   //edilaine - SIG55933 - fim


  // Thiago Melo SOL 220983 2053498 Kintana
  if qryDet.State in [DsInsert, DsEdit] then begin
    qryDet.FieldByName('VALORBASE1').AsFloat := rOpcao1;
    qryDet.FieldByName('VALORBASE2').AsFloat := rOpcao2;
    qryDet.FieldByName('VALORBASE3').AsFloat := rOpcao3;
    qryDet.FieldByName('CAMPOTEXTO1').AsString := rCampoTexto1;
    qryDet.FieldByName('CAMPOTEXTO2').AsString := rCampoTexto2;
    qryDet.FieldByName('CAMPOTEXTO3').AsString := rCampoTexto3;
  end;
  // Thiago Melo SOL 220983 2053498 Kintana

   sValorTotal := OraNumero(Trim(reValorTotal.Text));
   sDataInicioPagto := FormatDateTime('dd/mm/yyyy', dtDataInicio.Date);

   bNovoBeneficio := False;

   If qryBeneficio.FieldbyName('FlgCalcTodoMes').AsInteger = 1
      Then Begin // beneficio em cotas
         qryDet.FieldByName('ValorAtual').AsFloat := StrToFloat(FormatFloat('#0.000000', rValorReal));
         qryDet.FieldByName('ValorCalculado').AsFloat := rValorCotas;
         qryDet.FieldByName('ValorCotas').AsFloat := rValorCotas;
      End
   Else Begin // beneficio em real
         qryDet.FieldByName('ValorAtual').AsFloat := StrToFloat(FormatFloat('#0.00', rValorReal));
         qryDet.FieldByName('ValorCalculado').AsFloat := StrToFloat(FormatFloat('#0.00', rValorReal));
         qryDet.FieldByName('ValorCotas').AsFloat := rValorCotas;
      End;


   If Not bConcedeuBeneficio
      Then qryDet.FieldByName('VALORSRB').AsFloat := StrToFloat(ClienteNumero(reValorSRB.Text))
   Else qryDet.FieldByName('VALORSRB').AsFloat := dValorSRB;


   { Somente se não for concessão }
   If sTipoFormChamador <> 'CO' Then

      qryDet.FieldByName('VALORNADIB').AsFloat := qryDet.FieldByName('ValorAtual').AsFloat;

   qryDet.FieldByName('ValorTotal').AsFloat := StrToFloat(ClienteNumero(reValorTotal.Text));
   qryDet.FieldByName('NUMORDEMEVENTO').AsInteger := qryBeneficio.FieldByName('NUMORDEMEVENTO').AsInteger;
   If trim(dblkpcmbPortForma.text) = '' Then
      qryDet.fieldbyname('CODPORTFORMA').AsString := '';


   // Chamar a regra de verificação de benefício mínimo
   If qryBeneficio.FieldByName('IDREGRABENEFMIN').AsInteger > 0
      Then Begin

         bBeneficioMinimo := ExecutaRegraBeneficioMinimo(qryAux,
            qryBeneficio.FieldByName('IDREGRABENEFMIN').AsInteger,
            iIdPessJur,
            iIdPlanoPrev,
            iIdTitular,
            iSeqProposta,
            qryBeneficio.FieldByName('IdBeneficio').AsInteger,
            qrybeneficiario.fieldbyname('IDPESSOA').AsInteger,
            iIdSitFunc,
            iIdSitPart,
            iIdSitPlanoPrev,
            rOpcao1,
            rOpcao2,
            rOpcao3,
            FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
            FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
            '',
            FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
            FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),
            '0',
            '0',
            qryDet.FieldByName('DibBenefAnt').AsString,
            qryDet.FieldByName('ValorBenefAnt').AsString,
            qryDet.FieldByName('ValorAtual').AsString,
            0,
            bErro,
            reValorSRB.Text,
            '0',
            '');
         If bErro
            Then Begin
               MsgDlg('Erro na Regra de Verificação de Benefício Mínimo - Regra No. ' + qryBeneficio.FieldByName('IDREGRABENEFMIN').AsString,
                  'Erro', mtError, [mbOk], 0);
               Abort;
            End;

         If bBeneficioMinimo
            Then qryDet.FieldByName('FLGBENEFMIN').AsInteger := 1
         Else qryDet.FieldByName('FLGBENEFMIN').AsInteger := 0;
      End;



   qryDet.FieldByName('IDTPPAGTOBENEFIC').AsInteger := qryTpPgtoBenef.FieldByName('IDTPPAGTOBENEFIC').AsInteger;

   Inherited;

End;

Procedure TfrmCadRequerBenefPensionista.qryBeneficioAfterScroll(
   DataSet: TDataSet);
Begin
   Inherited;
   If (Not qryDet.Active) Or (Not (qryDet.State In [dsEdit, dsInsert]))
      Then Exit;

   If sTipoFormChamador <> 'SI'
      Then reValorTotal.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRgValorTotal').AsString) <> '')
   Else reValorTotal.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRegraSimula').AsString) <> '');

   reValorBeneficio.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRegraCalculo').AsString) <> '');


   If qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
      Then lblValorBenef.Caption := 'Valor (Cotas) '
   Else lblValorBenef.Caption := 'Valor (Real)  ';

   If qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC', qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
      Then Begin
         dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
         dblkcmbTpPgtoBenef.PerformSearch;
      End
   Else dblkcmbTpPgtoBenef.Text := '';

   bbtnOpcoes.Visible := (qryBeneficio.FieldbyName('FLGACEITAOPCAO').AsInteger = 1) or (qryBeneficio.FieldbyName('FLGOPCAOTEXTO').AsInteger = 1);

   lblAgencia.Visible := (qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1);
   dblkpcmbAgencia.Visible := (qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1);

   // Preencher qual é o beneficio de referencia
   If Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> ''
      Then iIdBenefReferencia := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
   Else iIdBenefReferencia := -1;
End;

Procedure TfrmCadRequerBenefPensionista.bbtnOkDetClick(Sender: TObject);
Var rPercProvisorio: double;
   beneficioselecionado: String;
   i, idbeneficioselecionado: integer; // contador de for
   sDataInicio, sDataFinal, sMsgErro: String;
   bErro: boolean;
   varFields: variant;

   sSql, sResult: String;

   sFlgFitEspecial, sFlgMigrado: String;
   sIdBeneficio: String; //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929
Begin

   idBeneficioSelecionado := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger; // guarda último beneficio selecionado
   iIdPessoa := qryBeneficiario.FieldByName('IDPESSOA').AsInteger;

   //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.Sql.Add('SELECT IDPESSOA, ');
   qryAux.Sql.Add('       MATRICULA AS MATRICULA' );
   qryAux.Sql.Add('  FROM DEPENTIT ');
   qryAux.Sql.Add(' WHERE MATRICULA =  ' + QuotedStr(dbeMatriculaBenef.Text));
   qryAux.Sql.Add(' AND   IDPESSOA  <> ' + Inttostr(iIdPessoa));  //SOL 169376 Kintana 1501396
   if (MatriculaBenefInicial <> '') then begin
     qryAux.SQL.Add('   AND MATRICULA <> ' + QuotedStr(MatriculaBenefInicial));
   end;
   qryAux.Open;

   if qryAux.Recordcount > 0 then begin
     MsgDlg('Matrícula já existe. ','Informação',mtInformation,[mbOk],0);
     Abort;
   end;
   //BRUNO AZEVEDO SOL 164472 KINTANA 1442193

            // Verificar hstbenefbfciario Vinicius Ferreira SOL 159322 KINTANA 1308856
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT * '+
                 ' FROM   hstbenefbfciario '+
                 ' WHERE     NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+
                 ' AND    IDBENEFICIO  = '+QuotedStr(sBeneficioAnterior)+  // SOL 162003 Kintana 1373069 E SOL 162023 Kintana 1373448 INCLUIDO O QuotedStr
                 ' AND    IDPESSJUR    = '+IntToStr(iIdPessJur)+
                 ' AND    IDPLANOPREV  = '+IntToStr(iIdPlanoPrev)+
                 ' AND    IDPESSOA     = '+IntToStr(iIdPessoa)+
                 ' AND    IDTITULAR    = '+IntToStr(iIdTitular)+
                 ' AND    SEQPROPOSTA  = '+IntToStr(iSeqProposta));
  qryAux.Open;

   if not (qryAux.IsEmpty) then
   begin

     MsgDlg('Não é possivel alterar benefício pois contém histórico.','Erro',mtError,[mbOk],0);
     qryAux.Close;
     Exit;
   end;

   // Fazer Validacoes
   If Trim(dtDataRequerimento.Text) = ''
      Then Begin
         MsgDlg('Data de Requerimento não preenchida.', 'Erro', mtError, [mbOk, mbHelp], 0);
         If (dtDataRequerimento.Enabled) And (dtDataRequerimento.visible) Then
            dtDataRequerimento.SetFocus;
         TiraSQL(qryAux);
         Abort;
      End;


   //BRUNO AZEVEDO SOL 156428 KINTANA 1235970
   if Trim(dtDataInicio.Text) = ''
    then begin
      MsgDlg('Data de Início do Pagamento não preenchida.','Erro',mtError,[mbOk],0);
      if (dtDataInicio.Enabled) and (dtDataInicio.Visible)
      then dtDataInicio.SetFocus;
      TiraSQL(qryAux);
      Abort;
    end;

   if Trim(dtInicioFund.Text) = ''
    then begin
      MsgDlg('Data de Início do Benefício não preenchida.','Erro',mtError,[mbOk],0);
      if (dtInicioFund.Enabled) and (dtInicioFund.Visible)
      then dtInicioFund.SetFocus;
      TiraSQL(qryAux);
      Abort;
   end;
   //BRUNO AZEVEDO SOL 156428 KINTANA 1235970


   //edilaine SIG115877 : inicio
   if (Sistema.IdModulo = 454)
   then begin
     //edilaine SIG115300 : inicio
     if (dtDataRequerimento.Date > date)
     then begin
        MsgDlg('A Data de Requerimento não pode ser superior a Data Atual. ',
               'Informação',mtInformation,[mbOk],0);
        dtDataRequerimento.SetFocus;
        Exit;
     end;

     if (Trim(dtInicioFund.Text) <> '') and
        (Trim(dtMortePensionista.Text) <> '') and
        (dtInicioFund.Date > dtMortePensionista.Date) then
     begin
        MsgDlg('A DIB (Data de Início na Fundação) não pode superior a Data do Evento. ',
               Sistema.NomeModulo, mtInformation, [mbOk], 0);
        Repaint;
        dtInicioFund.SetFocus;
        Exit;
     end;

     if (dtDataInicio.Date > date)
     then begin
        MsgDlg('A Data Início do Pagamento não pode ser superior a Data Atual. ',
               'Informação',mtInformation,[mbOk],0);
        if dtDataInicio.Canfocus then
           dtDataInicio.SetFocus;
        Exit;
     end;
     //edilaine SIG115300 : inicio
   end;
   //edilaine SIG115877 : fim


   If Trim(dblkpcmbBeneficio.Text) = ''
      Then Begin
         MsgDlg('Benefício não preenchido.', 'Erro', mtError, [mbOk, mbHelp], 0);
         If (dblkpcmbBeneficio.Enabled) And (dblkpcmbBeneficio.visible) Then
            dblkpcmbBeneficio.SetFocus;
         TiraSQL(qryAux);
         Abort;
      End;


   If ((Trim(reValorTotal.Text) = '') Or (StrToFloat(ClienteNumero(reValorTotal.Text)) <= 0)) And
      (qryBeneficio.FieldByName('FLGACEITAZERO').AsInteger <= 0)
      Then Begin
         MsgDlg('Valor Total do Benefício inválido.', 'Erro', mtError, [mbOk, mbHelp], 0);
         If (reValorTotal.Enabled) And (reValorTotal.Visible)
            Then reValorTotal.SetFocus;
         TiraSQL(qryAux);
         Abort;
      End;


   If (pnlNaoBenefProv.Visible) And
      ((Trim(reValorBeneficio.Text) = '') Or (StrToFloat(ClienteNumero(reValorBeneficio.Text)) <= 0))
      Then Begin
         MsgDlg('Valor do Benefício inválido.', 'Erro', mtError, [mbOk, mbHelp], 0);
         If (reValorBeneficio.Enabled) And (reValorBeneficio.visible) Then
            reValorBeneficio.SetFocus;
         TiraSQL(qryAux);
         Abort;
      End;

   If (Trim(dtDataInicio.Text) <> '') And (Trim(dtDataFinal.Text) <> '') And
      (dtDataInicio.Date > dtDataFinal.Date)
      Then Begin
         MsgDlg('Inconsistência : a data de início do pagamento é maior que a data final.', 'Erro', mtError, [mbOk, mbHelp], 0);
         If dtDataInicio.Enabled Then dtDataInicio.SetFocus;
         TiraSQL(qryAux);
         Abort;
      End;

   // Se o beneficio tem alguma opcao obrigatoria e esta opcao nao foi preenchida,
   // chamar cadastro de opcoes
   If ((qryBeneficio.FieldByName('NumOpcoes').AsInteger >= 1) And
      ((qryBeneficio.FieldbyName('flgObrigaOp1').AsInteger = 1) And (rOpcao1 <= 0)) Or
      ((qryBeneficio.FieldbyName('flgObrigaOp2').AsInteger = 1) And (rOpcao2 <= 0)) Or
      ((qryBeneficio.FieldbyName('flgObrigaOp3').AsInteger = 1) And (rOpcao3 <= 0))) or
      ((qryBeneficio.FieldByName('NUMOPCOESTEXTO').AsInteger >= 1) And
      (((qryBeneficio.FieldbyName('FLGOBRIGAOPTEXTO1').AsInteger = 1) And (rCampoTexto1 = '')) or
      ((qryBeneficio.FieldbyName('FLGOBRIGAOPTEXTO2').AsInteger = 1) And (rCampoTexto2 = '')) or
      ((qryBeneficio.FieldbyName('FLGOBRIGAOPTEXTO3').AsInteger = 1) And (rCampoTexto3 = '')))
      )
      Then Begin
         MsgDlg('Existe opção de benefício obrigatória não informada.', 'Erro', mtError, [mbOk, mbHelp], 0);
         bbtnOpcoesClick(Sender);
      End;

   //edilaine - SIG55933 - inicio
   {verifica se existe perfil parametrizado}
   if (sistema.IdModulo = 454) then  {só para Beneficioprev}
   begin
     PerfilAtual := BuscaPerfilInvestimento(iIdPessJur,
                                            iIdTitular,
                                            iIdPlanoPrev,
                                            iSeqProposta,
                                            -1,
                                            -1,
                                            dtDataInicio.Text,
                                            false,
                                            false,
                                            bPerfilAtivo);

     // Alterado por FHBS - 19/09/2018 - SIG73833
     if (sTipoFormChamador = 'EV') and
        (PerfilPensionista.iIdPerfilInvest > 0) and
        (PerfilPensionista.iIdPlanPrevContab > 0) and
        (qryBeneficio.FieldbyName('FLGPECULIO').AsInteger = 1) then
     begin
       PerfilAtual.iIdPerfilInvest := PerfilPensionista.iIdPerfilInvest;
       PerfilAtual.iIdPlanPrevContab := PerfilPensionista.iIdPlanPrevContab;
     end;
     // Alterado por FHBS - 19/09/2018 - SIG73833
     

     //if (sTipoFormChamador <> 'CO') then
     begin
       if (PerfilAtual.iIdPerfilInvest < 0) then
       begin
         MsgDlg('Participante não possui perfil de investimento cadastrado.','Erro',mtError,[mbOk],0);
         Abort;
       end
       else if (PerfilAtual.iIdPerfilInvest > 0) and (not bPerfilAtivo) then
       begin
         MsgDlg('O perfil de investimento do participante está inativo.','Erro',mtError,[mbOk],0);
         Abort;
       end;
     end;
   end
   else
   begin
     PerfilAtual.iIdPerfilInvest   := -1;
     PerfilAtual.iIdPlanPrevContab := -1;
   end;
   //edilaine - SIG55933 - fim
   
   // Se o usuario nao executou a regra de concessao, executá-la agora
   If Not bExecutouRegraConcessao
      Then bbtnElegibilidadeClick(Sender);

   // Se o usuario nao executou a regra de concessao, executá-la agora
   If Not bConcedeBeneficio
      Then Begin
         MsgDlg('A Regra de Elegibilidade nº ' +
            qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString +
            ' NÃO foi satisteita. Verifique. ', 'Informação', mtInformation, [mbOk, mbHelp], 0);
         Abort;
      End;


   //dados para contabilização individual
   If (prmIdRegraContabBenefIndiv > 0) Then
      Begin
         //a regra será executada para cada campo com possibilidade de
         //parametrização individual automática
         //a regra é única e o tipo de campo a ser retornada é informado através
         //do campo de nome "CAMPO" na query
         //caso não haja parametrização individual para determinado caso, a regra deve retornar "0" (zero)



         sFlgFitEspecial := '0';

         { Verifica se participante possui migração de plano }
         If PossuiMigracao(qryBeneficiario.fieldbyname('IDTITULAR').AsInteger,
            qryBeneficiario.fieldbyname('IDPLANOPREV').AsInteger,
            qry.FieldByName('DTEVENTO').AsString) Then Begin
               sFlgMigrado := '1';
            End Else Begin
               sFlgMigrado := '0';
            End;


         //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929
         if (Trim(sIdBeneficioAnt) <> '') then begin
           sIdBeneficio := sIdBeneficioAnt;
         end else begin
           sIdBeneficio := qryBeneficiario.fieldbyname('IDBENEFICIO').AsString;
         end;
         //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929

         sSQL := 'SELECT  ' + qryBeneficiario.fieldbyname('IDPESSOA').AsString + ' AS IDPESSOA ,' +
            ' ' + qryBeneficiario.fieldbyname('IDTITULAR').AsString + ' AS IDTITULAR ,' +
            //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929
            ' ' + IntToStr(iIdPlanoPrev) + ' AS IDPLANOPREV ,' +
            //' ' + qryBeneficiario.fieldbyname('IDPLANOPREV').AsString + ' AS IDPLANOPREV ,' +
            //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929
            ' ' + IntToStr(iIdSitPlanoPrev) + ' AS IDSITPLANOPREV,   ' +
            //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929
            ' ' + sIdBeneficio + ' AS IDBENEFICIO , ' +
            //' ' + qryBeneficiario.fieldbyname('IDBENEFICIO').AsString + ' AS IDBENEFICIO , ' +
            //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929
            ' ' + sFlgFitEspecial + ' AS FLGFITESPECIAL, ' + sFlgMigrado + ' AS FLGMIGRADO ';


           //IDPLANPREVCONTAB
         // Alterado por FHBS - 19/09/2018 - SIG73833
         if (PerfilAtual.iIdPlanPrevContab = -1) Then
         begin
           sResult := RegraString(inttostr(prmIdRegraContabBenefIndiv),
              sSQL + ', ''IDPLANPREVCONTAB'' AS CAMPO FROM DUAL',
              bErro, iIdCalculo);


           If bErro Then
              Begin
                 MsgDlg('Erro na regra para atribuição automática de entidade contábil.', 'Erro', mtError, [mbOk, mbHelp], 0);
                 TiraSQL(qryAux);
                 Abort;
              End;


           If trim(sResult) = '' Then
              Begin
                 MsgDlg('Erro na regra para atribuição automática de entidade contábil. Resultado nulo.', 'Erro', mtError, [mbOk, mbHelp], 0);
                 TiraSQL(qryAux);
                 Abort;
              End;


           If trim(sResult) <> '0' Then
              Begin
                 //testa validade da informação
                 qryaux.close;
                 qryaux.sql.text := '  SELECT * FROM  PLANPREVCONTABIL ' +
                    '  WHERE IDPLANOPREV = ' + sResult +
                    '  AND   NVL(ATIVO,''S'') = ''S''   ';
                 qryaux.open;

                 If qryaux.isempty Then
                    Begin
                       MsgDlg('[' + inttostr(prmIdRegraContabBenefIndiv) + '] - Regra para atribuição automática de entidade contábil. Resultado inválido: ' + sResult + '.', 'Erro', mtError, [mbOk, mbHelp], 0);
                       TiraSQL(qryAux);
                       Abort;
                    End;

                 qrydet.fieldbyname('IDPLANPREVCONTAB').AsString := trim(sResult);
              End;
           //FIM - IDPLANPREVCONTAB
         end
         else
         begin
           qrydet.fieldbyname('IDPLANPREVCONTAB').AsString := IntToStr(PerfilAtual.iIdPlanPrevContab);
         end;
         // Alterado por FHBS - 19/09/2018 - SIG73833


         //PLACONTAD
         sResult := RegraString(inttostr(prmIdRegraContabBenefIndiv),
            sSQL + ', ''PLACONTAD'' AS CAMPO FROM DUAL',
            bErro, iIdCalculo);


         If bErro Then
            Begin
               MsgDlg('Erro na regra para atribuição automática de conta para débito.', 'Erro', mtError, [mbOk, mbHelp], 0);
               TiraSQL(qryAux);
               Abort;
            End;


         If trim(sResult) = '' Then
            Begin
               MsgDlg('Erro na regra para atribuição automática de conta para débito. Resultado nulo.', 'Erro', mtError, [mbOk, mbHelp], 0);
               TiraSQL(qryAux);
               Abort;
            End;


         If trim(sResult) <> '0' Then
            Begin
               //testa validade da informação
               qryaux.close;
               qryaux.sql.text := '  SELECT 1 FROM  PLANOCONTA  ' +
                  '  WHERE PLACONTA = ' + sResult + ' ';
               qryaux.open;

               If qryaux.isempty Then
                  Begin
                     MsgDlg('[' + inttostr(prmIdRegraContabBenefIndiv) + '] - Regra para atribuição automática de conta para débito. Resultado inválido: ' + sResult + '.', 'Erro', mtError, [mbOk, mbHelp], 0);
                     TiraSQL(qryAux);
                     Abort;
                  End;

               qrydet.fieldbyname('PLACONTAD').AsString := trim(sResult);

            End;
         //FIM - PLACONTAD




         //PLACONTAC
         sResult := RegraString(inttostr(prmIdRegraContabBenefIndiv),
            sSQL + ', ''PLACONTAC'' AS CAMPO FROM DUAL',
            bErro, iIdCalculo);


         If bErro Then
            Begin
               MsgDlg('Erro na regra para atribuição automática de conta para crédito.', 'Erro', mtError, [mbOk, mbHelp], 0);
               TiraSQL(qryAux);
               Abort;
            End;


         If trim(sResult) = '' Then
            Begin
               MsgDlg('Erro na regra para atribuição automática de conta para crédito. Resultado nulo.', 'Erro', mtError, [mbOk, mbHelp], 0);
               TiraSQL(qryAux);
               Abort;
            End;


         If trim(sResult) <> '0' Then
            Begin
               //testa validade da informação
               qryaux.close;
               qryaux.sql.text := '  SELECT 1 FROM  PLANOCONTA  ' +
                  '  WHERE PLACONTA = ' + sResult + ' ';
               qryaux.open;

               If qryaux.isempty Then
                  Begin
                     MsgDlg('[' + inttostr(prmIdRegraContabBenefIndiv) + '] - Regra para atribuição automática de conta para crédito. Resultado inválido: ' + sResult + '.', 'Erro', mtError, [mbOk, mbHelp], 0);
                     TiraSQL(qryAux);
                     Abort;
                  End;


               qrydet.fieldbyname('PLACONTAC').AsString := trim(sResult);
            End;
         //FIM - PLACONTAC

      End;



   varFields := VarArrayCreate([0, 1], varVariant);
   varFields[0] := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
   varFields[1] := iIdPessoa;

   // Preencher campos ainda nao preenchidos
   If (qryDet.State = dsInsert) And
      (Not qryBfciarioTitPlan.Locate('IdBeneficio;IdPessoa', VarFields, [loCaseInsensitive]))
      Then Begin
         qryBfciarioTitPlan.Insert;

         qryBfciarioTitPlan.FieldByName('IdPessoa').AsInteger := iIdPessoa;
         qryBfciarioTitPlan.FieldByName('IdTitular').AsInteger := iIdTitular;

         qryBfciarioTitPlan.FieldByName('SeqProposta').AsInteger := iSeqProposta;
         qryBfciarioTitPlan.FieldByName('IdPessJur').AsInteger := iIdPessJur;
         qryBfciarioTitPlan.FieldByName('IDPLANOORIGEM').AsInteger := StrToInt(BuscaPlanoOrigem(iIdPessJur,
            iIdTitular,
            FormatDateTime('yyyy/mm', date)
            ));


         qryBfciarioTitPlan.FieldByName('IdPlanoPrev').AsInteger := iIdPlanoPrev;
         qryBfciarioTitPlan.FieldByName('IdBeneficio').AsInteger := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
         qryBfciarioTitPlan.FieldByName('Prioridade').AsFloat := 0;
         qryBfciarioTitPlan.FieldByName('Percentual').AsFloat := 100;
         qryBfciarioTitPlan.FieldByName('IdResponsavel').AsInteger := iIdPessoa;
         qryBfciarioTitPlan.Post;
      End; // if state = insert and not locate


   If qryDepentit.State = dsEdit
      Then qryDepentit.Post;


   // Preencher qual é o benefício de referência
   If Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> ''
      Then iIdBenefReferencia := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
   Else iIdBenefReferencia := -1;

   // Gravar beneficio auxiliar para usar depois os valores dos beneficios
   // e suas opcoes para passar para a regra de calculo dos outros beneficios
   If qryDet.State = dsInsert
      Then Begin
         qryBenefAux.Insert;
         qryBenefAux.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
         qryBenefAux.FieldByName('IDPESSOA').AsInteger := iIdPessoa;
         qryBenefAux.FieldByName('IDBENEFICIO').AsInteger := qryBeneficio.FieldbyName('IdBeneficio').AsInteger;
         qryBenefAux.FieldByName('NUMORDEMEVENTO').AsInteger := qryBeneficio.FieldbyName('NumOrdemEvento').AsInteger;
         qryBenefAux.FieldByName('VALORTOTAL').AsFloat := StrToFloat(ClienteNumero(Trim(reValorTotal.Text)));
         qryBenefAux.FieldByName('VALORATUAL').AsFloat := rValorReal;
         qryBenefAux.FieldByName('VALORCOTAS').AsFloat := rValorCotas;
         qryBenefAux.FieldByName('VALORBASE1').AsFloat := rOpcao1;
         qryBenefAux.FieldByName('VALORBASE2').AsFloat := rOpcao2;
         qryBenefAux.FieldByName('VALORBASE3').AsFloat := rOpcao3;
         qryBenefAux.FieldByName('CAMPOTEXTO1').AsString := rCampoTexto1;
         qryBenefAux.FieldByName('CAMPOTEXTO2').AsString := rCampoTexto2;
         qryBenefAux.FieldByName('CAMPOTEXTO3').AsString := rCampoTexto3;
         qryBenefAux.Post;
         inc(iTotRequeridos);
      End
   Else Begin
         {qryBenefAux.Edit;
         qryBenefAux.FieldByName('VALORTOTAL').AsFloat := StrToFloat(ClienteNumero(Trim(reValorTotal.Text)));
         qryBenefAux.FieldByName('VALORATUAL').AsFloat := rValorReal;
         qryBenefAux.FieldByName('VALORCOTAS').AsFloat := rValorCotas;
         qryBenefAux.FieldByName('VALORBASE1').AsFloat := rOpcao1;
         qryBenefAux.FieldByName('VALORBASE2').AsFloat := rOpcao2;
         qryBenefAux.FieldByName('VALORBASE3').AsFloat := rOpcao3;
         qryBenefAux.Post;}

          //Vinicius Ferreira SOL 159322 KINTANA 1308856

     qryBfciariotitPlanAux.Close;
     qryBfciariotitPlanAux.ParamByName('IdPessoa').Value    := iIdTitular;
     qryBfciariotitPlanAux.ParamByName('SeqProposta').Value := iSeqProposta;
     qryBfciariotitPlanAux.ParamByName('IdPessJur').Value   := iIdPessJur;
     qryBfciariotitPlanAux.ParamByName('IDPLANOPREV').Value := iIdPlanoPrev;
     qryBfciariotitPlanAux.ParamByName('idbeneficio').Value := sBeneficioAnterior;  //qryBeneficio.FieldbyName('IdBeneficio').AsInteger;
     qryBfciariotitPlanAux.Open;

     if qryBfciariotitPlanAux.RecordCount = 0 then begin

          qryBfciariotitPlanAux.Insert;
          qryBfciarioTitPlanAux.FieldByName('IdPessoa').AsInteger    := iIdTitular;
          qryBfciarioTitPlanAux.FieldByName('IdTitular').AsInteger   := iIdTitular;
          qryBfciarioTitPlanAux.FieldByName('SeqProposta').AsInteger := iSeqProposta;
          qryBfciarioTitPlanAux.FieldByName('IdPessJur').AsInteger   := iIdPessJur;
          qryBfciarioTitPlanAux.FieldByName('IdPlanoORIGEM').AsInteger := iIdPlanoPrev;
          qryBfciarioTitPlanAux.FieldByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
          qryBfciariotitPlanAux.FieldByName('IDBENEFICIO').AsInteger    := qryBeneficio.FieldbyName('IdBeneficio').AsInteger;// Vinicius Ferreira SOL 159322 KINTANA 1308856
          qryBfciarioTitPlanAux.FieldByName('Prioridade').AsFloat    := 0;
          qryBfciarioTitPlanAux.FieldByName('Percentual').AsFloat    := 100;
          qryBfciarioTitPlanAux.FieldByName('IdResponsavel').AsInteger := iIdTitular;
          //If qryBeneficio.FieldByName('FLGDESTBENEF').AsString = 'E' Then begin
          //  qryBfciarioTitPlanAux.FieldByName('IDRESPONNAOREC').AsInteger := qryEPP.FieldByName('IDPESSOA').AsInteger;
          //end;
         qryBfciariotitPlanAux.Post;
         

     end;

     qryBenefAux.Edit;
         qryBenefAux.FieldByName('VALORTOTAL').AsFloat := StrToFloat(ClienteNumero(Trim(reValorTotal.Text)));
         qryBenefAux.FieldByName('VALORATUAL').AsFloat := rValorReal;
         qryBenefAux.FieldByName('VALORCOTAS').AsFloat := rValorCotas;
         qryBenefAux.FieldByName('VALORBASE1').AsFloat := rOpcao1;
         qryBenefAux.FieldByName('VALORBASE2').AsFloat := rOpcao2;
         qryBenefAux.FieldByName('VALORBASE3').AsFloat := rOpcao3;
         qryBenefAux.FieldByName('CAMPOTEXTO1').AsString := rCampoTexto1;
         qryBenefAux.FieldByName('CAMPOTEXTO2').AsString := rCampoTexto2;
         qryBenefAux.FieldByName('CAMPOTEXTO3').AsString := rCampoTexto3;
         qryBenefAux.FieldByName('IDBENEFICIO').AsInteger    := qryBeneficio.FieldbyName('IdBeneficio').AsInteger;// Vinicius Ferreira SOL 159322 KINTANA 1308856
     qryBenefAux.Post;



      End;

   // Grava RELBENEFPART - Dados para o Relatório de Demonstrativo de Benefício
   If iIdCalculo > 0
      Then Begin

         If (Not qryRelBenefPart.active) Then
            Begin
               With qryRelBenefPart Do
                  Begin
                     Close;
                     ParamByName('IdPessoa').Value := iIdPessoa;
                     ParamByName('IdTitular').Value := iIdTitular;
                     ParamByName('SeqProposta').Value := iSeqProposta;
                     ParamByName('IdPessJur').Value := iIdPessJur;
                     ParamByName('IdPlanoPrev').Value := iIdPlanoPrev;
                     ParamByName('NumeroProcesso').Value := iNumeroProcesso;
                     Open;
                  End;
            End;


         If qryDet.State = dsInsert
            Then qryRelBenefPart.Insert
         Else qryRelBenefPart.Edit;


         qryRelBenefPart.FieldByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
         qryRelBenefPart.FieldByName('IDPESSJUR').AsInteger := iIdPessJur;
         qryRelBenefPart.FieldByName('IDTITULAR').AsInteger := iIdTitular;
         qryRelBenefPart.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
         qryRelBenefPart.FieldByName('IDBENEFICIO').AsInteger := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger;
         qryRelBenefPart.FieldByName('IDPESSOA').AsInteger := iIdPessoa;
         qryRelBenefPart.FieldByName('IDCALCULO').AsInteger := iIdCalculo;
         qryRelBenefPart.FieldByName('SEQPROPOSTA').AsInteger := iSeqProposta;
         qryRelBenefPart.FieldByName('DATACALCULO').AsDateTime := StrToDate(dtInicioFund.Text);
         qryRelBenefPart.FieldByName('FLGRECALCULO').AsInteger := 0;
         qryRelBenefPart.Post;

      End;


   If qryDepentit.State = dsEdit
      Then qryDepentit.Post;


   Inherited;

   // Verifica se todos beneficiarios já estão cadastrados no beneficio
   If iTotRequeridos = qryBeneficiario.RecordCount
      Then Begin
         MsgDlg('Requerimento de ' + lblNomeBenef.caption + ' concluído com sucesso ! ' +
            'Selecione novo benefício e os beneficiários que tenham direito',
            'Informação', mtInformation, [mbOk, mbHelp], 0);

         // Atualizar a reserva part com os valores  movimentados da reserva
         // para que o proximo beneficio já tenha seu valor atualizado
         //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929
         if (qryMovReservaTemp.Active) then begin
           If (qryBeneficio.FieldByName('FlgResgate').AsInteger = 1) And
             (Not AtualizaReservaPart(qryBeneficio.FieldByName('IdBeneficio').AsInteger))
             Then Begin
               MsgDlg('Ocorreu um erro na atualização do valor da reserva do participante. ',
                  'Erro', mtError, [mbOk, mbHelp], 0);
               TiraSQL(qryAux);
               Abort;
             End;
         end;
         //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929
         
         dblkpcmbBeneficio.Enabled := True;
         qrybeneficiario.Close;
         bbtnSelecionaBeneficiarios.Enabled := True;
         dtDataRequerimento.Enabled := False;
         dblkpcmbBeneficiario.Enabled := False;
         dbeMatriculaBenef.Enabled := False;
         dtInicioFund.Enabled := False;
         reValorBeneficio.Enabled := False;
         reValorTotal.Enabled := False;
         dtDataInicio.Enabled := False;
         dtDataFinal.Enabled := False;
         dblkcmbTpPgtoBenef.Enabled := False;
         dblkpcmbPortForma.Enabled := False;

         iTotRequeridos := 0;
         If (dblkpcmbBeneficio.Enabled) And (dblkpcmbBeneficio.visible) Then dblkpcmbBeneficio.SetFocus;
      End
   Else Begin
         qrybeneficio1.Close;
         qrybeneficio1.SQL.Clear;
         qrybeneficio1.SQL.Add('SELECT B.IDBENEFICIO, B.NOME ' +
            'FROM BENEFICIO B ' +
            'WHERE B.IDBENEFICIO = :IDBENEFICIO');
         qrybeneficio1.ParamByName('IDBENEFICIO').AsInteger := idbeneficioselecionado;
         qrybeneficio1.Open;
         bbtnSelecionaBeneficiarios.Enabled := false;

         dblkpcmbBeneficio.Text := qrybeneficio1.FieldByName('Nome').AsString;


         bbtnOpcoes.Visible := (qryBeneficio.FieldbyName('FLGACEITAOPCAO').AsInteger = 1) or (qryBeneficio.FieldbyName('FLGOPCAOTEXTO').AsInteger = 1);


         // Verificar se este benefício já foi requerido para algum beneficiário
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT BF.NUMEROPROCESSO, BF.DATAREQUERIMENTO, BF.IDSITBENEFICIO ' +
            ' FROM   BENEFBFCIARIO BF ' +
            ' WHERE  BF.IDTITULAR    = ' + IntToStr(iIdTitular) +
            ' AND    BF.SEQPROPOSTA  = ' + IntToStr(iSeqProposta) +
            ' AND    BF.IDPESSJUR    = ' + IntToStr(iIdPessJur) +
            ' AND    BF.IDPLANOORIGEM  = ' + IntToStr(iIdPlanoPrev) +
            ' AND    BF.IDBENEFICIO  = ' + qryBeneficio.FieldbyName('IdBeneficio').AsString +
            ' AND    BF.IDSITBENEFICIO = 4 ' +
            ' AND    BF.NUMEROPROCESSO = ' + IntToStr(iNumeroProcesso));

         qryAux.Open;
         If Not (qryAux.IsEmpty) Then
            Begin
               If MsgDlg('Este benefício já foi requerido em ' + qryAux.FieldByName('DataRequerimento').AsString +
                  ' e está pendente de concessão. ' +
                  'Verifique o processo nº ' + qryAux.FieldByName('NumeroProcesso').AsString + '. Deseja continuar ?',
                  'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
                  Then Begin
                     qryAux.Close;
                     dblkpcmbBeneficio.Text := '';
                     If (dblkpcmbBeneficio.Enabled) And (dblkpcmbBeneficio.visible) Then
                        dblkpcmbBeneficio.SetFocus;
                     Exit;
                  End;
            End;

         lblNomeBenef.Caption := dblkpcmbBeneficio.Text;


         // Executar regra de calculo de data de inicio e data final
         If (Trim(qryBeneficio.FieldByName('IdRegraInicio').AsString) <> '') And
            (qryBeneficio.FieldByName('IdRegraInicio').AsInteger > 0) Then
            Begin
               frmAguarde.Mostra('Regra de Data de Início - Nº ' + qryBeneficio.FieldByName('IdRegraInicio').AsString);

               Try
                  sDataInicio := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraInicio').AsInteger,
                     iIdPessJur,
                     iIdPlanoPrev,
                     iIdTitular,
                     iSeqProposta,
                     iIdPessoa,
                     qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                     rOpcao1,
                     rOpcao2,
                     rOpcao3,
                     FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
                     FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
                     FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
                     FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),
                     FormatDateTime('dd/mm/yyyy', date),
                     '',
                     '',
                     bErro,
                     sMsgErro
                     );
               Except
                  frmAguarde.Apaga;
               End;
               frmAguarde.Apaga;

               If bErro Then
                  Begin
                     MsgDlg(sMsgErro, 'Erro', mtError, [mbOk, mbHelp], 0);
                     qryDet.FieldByName('DataInicio').AsString := '';
                     dtDataInicio.Text := '';
                  End
               Else
                  Begin
                     If Trim(sDataInicio) <> '' Then
                        Begin
                           qryDet.FieldByName('DataInicio').AsString := sDataInicio;
                           dtDataInicio.Date := StrToDate(sDataInicio);
                        End;
                  End;
            End; //if regrainicio <> ''

         If (Trim(qryBeneficio.FieldByName('IdRegraFim').AsString) <> '') And
            (qryBeneficio.FieldByName('IdRegraFim').AsInteger > 0) Then
            Begin
               frmAguarde.Mostra('Regra de Data Final - Nº ' + qryBeneficio.FieldByName('IdRegraFim').AsString);

               Try
                  sDataFinal := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraFim').AsInteger,
                     iIdPessJur,
                     iIdPlanoPrev,
                     iIdTitular,
                     iSeqProposta,
                     iIdPessoa,
                     qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                     rOpcao1,
                     rOpcao2,
                     rOpcao3,
                     FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
                     FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
                     FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
                     FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),
                     FormatDateTime('dd/mm/yyyy', date),
                     '',
                     '',
                     bErro,
                     sMsgErro
                     );
               Except
                  frmAguarde.Apaga;
               End;
               frmAguarde.Apaga;

               If bErro Then
                  MsgDlg(sMsgErro, 'Erro', mtError, [mbOk, mbHelp], 0)
               Else
                  If Trim(sDataFinal) <> '' Then
                     Begin
                        qrydet.FieldByName('DATAFINAL').AsString := sDataFinal;
                        dtDataFinal.Date := StrToDate(sDataFinal);
                     End;
            End; // if regrafim <> ''

         If (dtDataRequerimento.Enabled) And (dtDataRequerimento.visible)
            Then dtDataRequerimento.SetFocus;
      End;

   frmAguarde.Apaga;


End;

Procedure TfrmCadRequerBenefPensionista.bbtnElegibilidadeClick(
   Sender: TObject);
Var bErro: boolean;
   sMsgErro: String;
Begin
   If Trim(dblkpcmbBeneficio.Text) = ''
      Then Begin
         MsgDlg('Preencha o Benefício.', 'Erro', mtError, [mbOk, mbHelp], 0);
         If (dblkpcmbBeneficio.Enabled) And (dblkpcmbBeneficio.visible) Then
            dblkpcmbBeneficio.SetFocus;
         Exit;
      End;

   bExecutouRegraConcessao := True;

   // Se for simulacao nao executar regra de elegibilidade
   If sTipoFormChamador = 'SI'
      Then Begin
         bConcedeBeneficio := True;
         bExecutouRegraConcessao := True;
         Exit;
      End;

   If (Trim(qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString) = '') Or
      (qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsInteger <= 0)
      Then bConcedeBeneficio := True
   Else Begin
         frmAguarde.Mostra('Regra de Elegibilidade - Nº ' + qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString);

         Try
            bConcedeBeneficio := ExecutaRegraElegibilidade(qryAux,
               qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsInteger,
               iIdPessJur,
               iIdPlanoPrev,
               iIdTitular,
               iSeqProposta,
               qryBeneficio.FieldByName('IdBeneficio').AsInteger,
               rOpcao1,
               rOpcao2,
               rOpcao3,
               FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
               FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
               sDataDemissao,
               FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),
               sFlgInternoAntes,
               sFlgInternoDepois,
               sIdSitPartAntes,
               sIdSitPlanAntes,
               sIdSitFuncAntes,
               sIdSitPartDepois,
               sIdSitPlanDepois,
               sIdSitFuncDepois,
               iNumBenef,
               0,
               bErro,
               sMsgErro
               );
         Except
            frmAguarde.Apaga;
         End;
         frmAguarde.Apaga;

         If bErro Then
            Begin
               MsgDlg(sMsgErro, 'Erro', mtError, [mbOk, mbHelp], 0);
               Exit;
            End
         Else
            Begin
               If Not bConcedeBeneficio Then
                  MsgDlg('A Regra de Elegibilidade nº ' +
                     qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString +
                     ' NÃO foi satisteita. Verifique. ', 'Informação', mtInformation, [mbOk, mbHelp], 0)
               Else
                  MsgDlg('A Regra de Elegibilidade nº ' +
                     qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString +
                     ' foi satisteita. ', 'Informação', mtInformation, [mbOk, mbHelp], 0);
            End;
      End;
End;

Procedure TfrmCadRequerBenefPensionista.bbtnOpcoesClick(Sender: TObject);
Var bPodeAlterarOpcoes, bOpcoesExistem: boolean;
   cAuxSeparador: char;
Begin
   Inherited;
      // Verificar se participante já fez opções
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3 FROM BENEFPLANOPART ' +
      ' WHERE IDPESSJUR   = ' + IntToStr(iIdPessJur) + ' AND ' +
      '       IDPESSOA    = ' + IntToStr(iIdTitular) + ' AND ' +
      '       IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
      '       SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND ' +
      '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
   qryAux.Open;

   If qryAux.IsEmpty
      Then Begin
         rOpcao1 := 0;
         rOpcao2 := 0;
         rOpcao3 := 0;
         rCampoTexto1 := '';
         rCampoTexto2 := '';
         rCampoTexto3 := '';
      End
   Else Begin
         If qryAux.FieldByName('VALORBASE1').AsString <> ''
            Then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
         Else rOpcao1 := 0;

         If qryAux.FieldByName('VALORBASE2').AsString <> ''
            Then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
         Else rOpcao2 := 0;

         If qryAux.FieldByName('VALORBASE3').AsString <> ''
            Then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
         Else rOpcao3 := 0;

         If qryAux.FieldByName('CAMPOTEXTO1').AsString <> ''
            Then rCampoTexto1 := qryAux.FieldByName('CAMPOTEXTO1').AsString
         Else rCampoTexto1 := '';

         If qryAux.FieldByName('CAMPOTEXTO2').AsString <> ''
            Then rCampoTexto2 := qryAux.FieldByName('CAMPOTEXTO2').AsString
         Else rCampoTexto2 := '';

         If qryAux.FieldByName('CAMPOTEXTO3').AsString <> ''
            Then rCampoTexto3 := qryAux.FieldByName('CAMPOTEXTO3').AsString
         Else rCampoTexto3 := '';

      End;

   bPodeAlterarOpcoes := True;

   If Not qryAux.IsEmpty
      Then Begin // Opcoes já cadastradas
         bOpcoesExistem := True;
         frmCadOpcoesBenef := TfrmCadOpcoesBenef.Create(Application);
         frmCadOpcoesBenef.LerOpcoes(sNomeTitular, sNomePlano, sNomePatro,
            dblkpcmbBeneficio.Text,
            qryBeneficio.FieldByName('NOMEVALORBASE1').AsString,
            qryBeneficio.FieldByName('NOMEVALORBASE2').AsString,
            qryBeneficio.FieldByName('NOMEVALORBASE3').AsString,
            qryBeneficio.FieldByName('NUMOPCOES').AsInteger,
            rOpcao1, rOpcao2, rOpcao3, bPodeAlterarOpcoes,
            qryBeneficio.FieldByName('FLGEDITAOP1').AsInteger,
            qryBeneficio.FieldByName('FLGEDITAOP2').AsInteger,
            qryBeneficio.FieldByName('FLGEDITAOP3').AsInteger,
            //Inicio - SOL160185
            qryBeneficio.FieldByName('NOMECAMPOTEXTO1').AsString,
            qryBeneficio.FieldByName('NOMECAMPOTEXTO2').AsString,
            qryBeneficio.FieldByName('NOMECAMPOTEXTO3').AsString,
            qryBeneficio.FieldByName('NUMOPCOESTEXTO').AsInteger,
            rCampoTexto1, rCampoTexto2, rCampoTexto3,
            qryBeneficio.FieldByName('FLGEDITAOPTEXTO1').AsInteger,
            qryBeneficio.FieldByName('FLGEDITAOPTEXTO2').AsInteger,
            qryBeneficio.FieldByName('FLGEDITAOPTEXTO3').AsInteger,
            //FIM - SOL160185
            iIdPessJur,
            iIdPlanoPrev,
            iIdTitular,
            iSeqProposta,
            qryBeneficio.FieldbyName('IdBeneficio').AsInteger,
            iNumeroProcesso,
            FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
            FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
            '',
            FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),
            '0',
            '0',
            '0', '0', '0',
            sFlgInternoAntes,
            sFlgInternoDepois,
            sIdSitPartAntes,
            sIdSitPlanAntes,
            sIdSitFuncAntes,
            sIdSitPartDepois,
            sIdSitPlanDepois,
            sIdSitFuncDepois);
         frmCadOpcoesBenef.Free;
      End
   Else Begin // Cadastrar Opcoes
         bOpcoesExistem := False;
         frmCadOpcoesBenef := TfrmCadOpcoesBenef.Create(Application);
         frmCadOpcoesBenef.LerOpcoes(sNomeTitular, sNomePlano, sNomePatro,
            dblkpcmbBeneficio.Text,
            qryBeneficio.FieldByName('NOMEVALORBASE1').AsString,
            qryBeneficio.FieldByName('NOMEVALORBASE2').AsString,
            qryBeneficio.FieldByName('NOMEVALORBASE3').AsString,
            qryBeneficio.FieldByName('NUMOPCOES').AsInteger,
            rOpcao1, rOpcao2, rOpcao3, bPodeAlterarOpcoes,
            qryBeneficio.FieldByName('FLGEDITAOP1').AsInteger,
            qryBeneficio.FieldByName('FLGEDITAOP2').AsInteger,
            qryBeneficio.FieldByName('FLGEDITAOP3').AsInteger,
            //Inicio - SOL160185
            qryBeneficio.FieldByName('NOMECAMPOTEXTO1').AsString,
            qryBeneficio.FieldByName('NOMECAMPOTEXTO2').AsString,
            qryBeneficio.FieldByName('NOMECAMPOTEXTO3').AsString,
            qryBeneficio.FieldByName('NUMOPCOESTEXTO').AsInteger,
            rCampoTexto1, rCampoTexto2, rCampoTexto3,
            qryBeneficio.FieldByName('FLGEDITAOPTEXTO1').AsInteger,
            qryBeneficio.FieldByName('FLGEDITAOPTEXTO2').AsInteger,
            qryBeneficio.FieldByName('FLGEDITAOPTEXTO3').AsInteger,
            //FIM - SOL160185
            iIdPessJur,
            iIdPlanoPrev,
            iIdTitular,
            iSeqProposta,
            qryBeneficio.FieldbyName('IdBeneficio').AsInteger,
            iNumeroProcesso,
            FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
            FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
            '',
            FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),
            '0',
            '0',
            '0', '0', '0',
            sFlgInternoAntes,
            sFlgInternoDepois,
            sIdSitPartAntes,
            sIdSitPlanAntes,
            sIdSitFuncAntes,
            sIdSitPartDepois,
            sIdSitPlanDepois,
            sIdSitFuncDepois);

         frmCadOpcoesBenef.Free;
      End;

   // Gravar Opcoes do participante na BenefPlanoPart
   If (((rOpcao1 >= 0) and (rOpcao2 >= 0) and (rOpcao3 >= 0)) or((rCampoTexto1 <>'') or (rCampoTexto2 <> '') or (rCampoTexto3 <>''))) And
      (Not bOpcoesExistem)
      Then Begin // Opcoes ainda nao existiam
      //SOL 171125/7481 Kintana 1535617 Douglas.Siqueira
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Append('SELECT * FROM PARTPREVPLAN WHERE');
      qryAux.SQL.Append('ROWNUM=1 AND');
      qryAux.SQL.Append('IDPESSJUR='+IntToStr(iIdPessJur)+' AND' );
      qryAux.SQL.Append('IDPESSOA='+IntToStr(iIdTitular)+' AND' );
      qryAux.SQL.Append('IDPLANOPREV='+IntToStr(iIdPlanoPrev)+' AND' );
      qryAux.SQL.Append('SEQPROPOSTA='+IntToStr(iSeqProposta));
      Try
         qryAux.open;
      Except
        On E: EDBEngineError Do
           Begin
               MostrarErro(E);
               Exit;
           End;
      End;

      If not qryAux.IsEmpty then
         Begin
         qryAux.Close;
         qryAux.SQL.Clear;
         cAuxSeparador := DecimalSeparator;
         DecimalSeparator := '.';
         qryAux.SQL.Add(' INSERT INTO BENEFPLANOPART (IDPESSJUR,IDPLANOPREV,IDPESSOA, SEQPROPOSTA, IDBENEFICIO,VALORBASE1, ' +
            '             VALORBASE2,VALORBASE3,CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3) ' +
            ' VALUES (' + IntToStr(iIdPessJur) + ',' + IntToStr(iIdPlanoPrev) + ',' +
            IntToStr(iIdTitular) + ',' + IntToSTr(iSeqProposta) + ',' +
            qryBeneficio.FieldByName('IDBENEFICIO').AsString + ',' +
            FormatFloat('#0.00000', rOpcao1) + ',' +
            FormatFloat('#0.00000', rOpcao2) + ',' +
            FormatFloat('#0.00000', rOpcao3) + ',' +
            QuotedStr(rCampoTexto1)          + ','+
            QuotedStr(rCampoTexto2)          + ','+
            QuotedStr(rCampoTexto3)          + ')');
         DecimalSeparator := cAuxSeparador;
         Try
            qryAux.ExecSQL;
         Except
            On E: EDBEngineError Do
               Begin
                  MostrarErro(E);
                  Exit;
               End;
         End; //try 

         End
       else
          qryAux.Close;
      //SOL 171125/7481 Kintana 1535617 Douglas.Siqueira
      End
   Else Begin // atualizar opcoes
         If (((rOpcao1 >= 0) and (rOpcao2 >= 0) and (rOpcao3 >= 0)) or((rCampoTexto1 <>'') or (rCampoTexto2 <> '') or (rCampoTexto3 <>''))) And
            (bOpcoesExistem)
         Then Begin
           qryAux.Close;
           qryAux.SQL.Clear;
           cAuxSeparador := DecimalSeparator;
           DecimalSeparator := '.';
           qryAux.SQL.Add(' UPDATE BENEFPLANOPART SET VALORBASE1 = ' + FormatFloat('#0.00000', rOpcao1) + ',' +
              '                           VALORBASE2 = ' + FormatFloat('#0.00000', rOpcao2) + ',' +
              '                           VALORBASE3 = ' + FormatFloat('#0.00000', rOpcao3) + ',' +
              '                           CAMPOTEXTO1 = ' +  QuotedStr(rCampoTexto1)        + ',' +
              '                           CAMPOTEXTO2 = ' +  QuotedStr(rCampoTexto2)        + ',' +
              '                           CAMPOTEXTO3 = ' +  QuotedStr(rCampoTexto3)        +
              ' WHERE IDPESSJUR   = ' + IntToSTr(iIdPessJur) + ' AND ' +
              '       IDPESSOA    = ' + IntToSTr(iIdTitular) + ' AND ' +
              '       IDPLANOPREV = ' + IntToSTr(iIdPlanoPrev) + ' AND ' +
              '       SEQPROPOSTA = ' + IntToSTr(iSeqProposta) + ' AND ' +
              '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
           DecimalSeparator := cAuxSeparador;
           Try
              qryAux.ExecSQL;
           Except
             On E: EDBEngineError Do
             Begin
               MostrarErro(E);
               Exit;
             End;
           End; // except
        End; // if
   End;

   // Thiago Melo SOL 215522 Kintana 2046098
   if (((rOpcao1 >= 0) and (rOpcao2 >= 0) and (rOpcao3 >= 0)) or((rCampoTexto1 <>'') or (rCampoTexto2 <> '') or (rCampoTexto3 <>''))) then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     cAuxSeparador := DecimalSeparator;
     DecimalSeparator := '.';
     qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET VALORBASE1 = ' + FormatFloat('#0.00000', rOpcao1) + ',' +
        '                           VALORBASE2 = ' + FormatFloat('#0.00000', rOpcao2) + ',' +
        '                           VALORBASE3 = ' + FormatFloat('#0.00000', rOpcao3) + ',' +
        '                           CAMPOTEXTO1 = ' +  QuotedStr(rCampoTexto1)        + ',' +
        '                           CAMPOTEXTO2 = ' +  QuotedStr(rCampoTexto2)        + ',' +
        '                           CAMPOTEXTO3 = ' +  QuotedStr(rCampoTexto3)        +
        ' WHERE IDPESSJUR   = ' + IntToSTr(iIdPessJur) + ' AND ' +
        '       IDPESSOA    = ' + IntToSTr(iIdTitular) + ' AND ' +
        '       IDPLANOPREV = ' + IntToSTr(iIdPlanoPrev) + ' AND ' +
        '       SEQPROPOSTA = ' + IntToSTr(iSeqProposta) + ' AND ' +
        '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
     DecimalSeparator := cAuxSeparador;
     try
        qryAux.ExecSQL;
     except
       on E: EDBEngineError do
       begin
         MostrarErro(E);
         Exit;
       end;
     end;
   end;
   // Thiago Melo SOL 215522 Kintana 2046098
End;

Procedure TfrmCadRequerBenefPensionista.sbtnConcedeUmClick(Sender: TObject);
Var iIdSitBenef, iIdSitTemp: integer;
   bSituacoesDiferentes: boolean;
Begin
   // Se estiver em insercao ou edicao, nao permitir concessao
   If qryDet.State In [dsEdit, dsInsert]
      Then Begin
         MsgDlg(' Este benefício não pode ser concedido antes de ser confirmado. ' +
            ' Confirme a operação antes de concedê-lo. ', 'Informação', mtInformation, [mbOk, mbHelp], 0);
         sbtnConcedeUm.Down := False;
         TiraSQL(qryAux);
         Exit;
      End;

   // Verificar se o motivo default na tabela de parametros está preenchido
   If prmIDMOTIVOFOLHABEN <= 0
      Then Begin
         MsgDlg('O parâmetro motivo da folha de benefício não está preenchido. ' +
            'Utilize a tela de parâmetros para cadastrá-lo. ', 'Informação', mtInformation, [mbOk, mbHelp], 0);
         sbtnConcedeUm.Down := False;
         TiraSQL(qryAux);
         Exit;
      End;

   // Dependendo da situacao do beneficio, nao faz sentido concede-lo novamente
   If (qryDet.FieldByName('IdSitBeneficio').AsInteger In [1, 3, 5])
      Then Begin
         MsgDlg(' Este benefício não pode ser concedido. Verifique sua situação.  ',
            'Informação', mtInformation, [mbOk, mbHelp], 0);
         sbtnConcedeUm.Down := False;
         TiraSQL(qryAux);
         Exit;
      End;

   //BRUNO AZEVEDO SOL 156428 KINTANA 1235970
   if Trim(qryDet.FieldByName('DataInicio').AsString) = ''
   then begin
    MsgDlg('Data de Início do Pagamento não preenchida.','Erro',mtError,[mbOk],0);
    sbtnConcedeUm.Down := False;
    TiraSQL(qryAux);
    Exit;
   end;

   if Trim(qryDet.FieldByName('DATAINICIOFUND').AsString) = ''
   then begin
    MsgDlg('Data de Início do Benefício não preenchida.','Erro',mtError,[mbOk],0);
    sbtnConcedeUm.Down := False;
    TiraSQL(qryAux);
    Exit;
   end;
   //BRUNO AZEVEDO SOL 156428 KINTANA 1235970


   // Atualizar query de conta bancaria
   // Verificar conta bancaria do recebedor
   If qryBeneficiario.FieldByName('NOMERESPONSAVEL').AsString = ''
      Then Begin
         qryContaBancaria.Close;
         qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('IdPessoa').AsInteger;
         qryContaBancaria.Open;
      End
   Else Begin
         qryContaBancaria.Close;
         qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('IdResponsavel').AsInteger;
         qryContaBancaria.Open;
      End;

    If Not qryBeneficio.Active Then
       PesqBeneficio;

    {
   If Not qryBeneficio.Active
      Then Begin
         qryBeneficio.Close;
         qryBeneficio.ParamByName('IdEventoGerador').Value := iIdEvento; // SOL 170753 Kintana 1529212
         qryBeneficio.ParamByName('IdPlanoPrev').Value := qryDet.FieldByName('IdPlanoPrev').AsInteger;
         qryBeneficio.Open;
         If iIdEvento = 4 Then // SOL 170753 Kintana 1529212
         Begin
            qryBeneficio.Filter := 'FLGPECULIO = 1'; // SOL 170753 Kintana 1529212
            qryBeneficio.Filtered := True; // SOL 170753 Kintana 1529212
         end
         else
             begin
            qryBeneficio.Filtered := False; // SOL 170753 Kintana 1529212
             end
      End;
   }

   // Chamar tela de Modo de Concessao
   With frmPedeBenefExigencia Do
      Begin
         // Modos de Concessao = N - concedido Normal
         //                      E - concedido em Exigencia
         //                      P - manter Pendente
         //                      C - nao conceder (Cancelar requerimento)
         ShowModal;
         Case cModoConcessao Of
            'N': iIdSitBenef := 1;
            'C': Begin // Cancelar
                  If MsgDlg('Deseja realmente "NÃO CONCEDER" este benefício ? ' +
                     ' Esta operação irá cancelar o requerimento do mesmo.', 'Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrYes
                     Then iIdSitBenef := 6 // nao concedido
                  Else iIdSitBenef := 4; // pendente de concessao
               End;
            'E': iIdSitBenef := 7;
            'P': iIdSitBenef := 4;
         Else iIdSitBenef := 1;
         End; //case
      End; //with

   If Not ConcedeUmBeneficio(Sender, iIdSitBenef)
      Then Begin
         sbtnConcedeUm.Down := False;
         TiraSQL(qryAux);
         Exit;
      End;

   // Se o processo só possuir um beneficio, atualizar situacao do processo
   // Caso contrario verificar se todos os beneficios do processo estao com a mesma
   // situacao
   If qryDet.RecordCount = 1
      Then Begin
         qry.FieldbyName('IdSitProcesso').AsInteger := iIdSitBenef;
         qry.FieldByName('Descricao').AsString := vetDescBeneficio[iIdSitBenef];
      End
   Else Begin // processo possui + de 1 beneficio
         // Verificar se existem beneficios com situacoes diferentes
         iIdSitTemp := iIdSitBenef;
         bSituacoesDiferentes := False;
         qryDet.DisableControls;
         qryDet.First;
         While Not qryDet.Eof Do
            Begin
               If (qryDet.FieldByName('IdSitBeneficio').AsInteger <> iIdSitTemp) And
                  (Not BeneficioDePagamentoUnico(qryDet.FieldByName('IdBeneficio').AsInteger))
                  Then bSituacoesDiferentes := True;
               qryDet.Next;
            End; //while
         qryDet.EnableControls;

         If bSituacoesDiferentes
            Then Begin // existe + de 1 beneficio no processo e estao com situacoes diferentes
               MsgDlg('O Processo Nº ' + IntToStr(iNumeroProcesso) + ' possui benefícios com situações diferentes.' +
                  'Caso estas situações não sejam regularizadas o processo não terá sua situação alterada.',
                  'Informação', mtInformation, [mbOk], 0);
               TiraSQL(qryAux);
            End
         Else Begin // existe +  de 1 beneficio no processo mas todos estao com  a mesma situacao
               qry.FieldbyName('IdSitProcesso').AsInteger := iIdSitTemp;
               qry.FieldByName('Descricao').AsString := vetDescBeneficio[iIdSitTemp];
            End;
      End; // else - if RecordCount = 1

   lblNumProcesso.Caption := 'Processo Nº ' + IntToStr(iNumeroProcesso);
   lblSitProcesso.Caption := 'Situação : ' + qry.FieldByName('Descricao').AsString;

   sbtnConcedeUm.Down := False;
   MsgDlg('Benefício concedido com sucesso.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
   TiraSQL(qryAux);
End;

Procedure TfrmCadRequerBenefPensionista.dsStateChange(Sender: TObject);
Begin
   Inherited;
   If sTipoFormChamador = 'CO'
      Then sbtnConcedeUm.Enabled := (ds.DataSet.State = dsEdit);
End;

Procedure TfrmCadRequerBenefPensionista.dsDetStateChange(Sender: TObject);
Begin
   Inherited;
   If sTipoFormChamador = 'CO'
      Then sbtnConcedeUm.Enabled := Not (ds.DataSet.State In [dsInsert, dsEdit]);

End;

Procedure TfrmCadRequerBenefPensionista.qryDetAfterScroll(DataSet: TDataSet);
Begin
   Inherited;
   If Not qryBeneficio.Active
      Then Begin
         If Not qryDet.Active
            Then Exit
         Else lblNomeBenef.Caption := qryDet.FieldByName('Nome').AsString;
      End
   Else lblNomeBenef.Caption := qryBeneficio.FieldByName('Nome').AsString;
   If qryDet.Active
      Then Begin
         rOpcao1 := qryDet.FieldByName('VALORBASE1').AsFloat;
         rOpcao2 := qryDet.FieldByName('VALORBASE2').AsFloat;
         rOpcao3 := qryDet.FieldByName('VALORBASE3').AsFloat;
         rCampoTexto1 := qryDet.FieldByName('CAMPOTEXTO1').AsString;
         rCampoTexto2 := qryDet.FieldByName('CAMPOTEXTO2').AsString;
         rCampoTexto3 := qryDet.FieldByName('CAMPOTEXTO3').AsString;
      End;

   reValorTotal.Text := qryDet.FieldByName('VALORTOTAL').AsString;
   reValorSRB.Text := qryDet.FieldByName('VALORSRB').AsString;

   If (qryBeneficio.Active) And (qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1)
      Then reValorBeneficio.Text := qryDet.FieldByName('ValorCotas').AsString
   Else reValorBeneficio.Text := qryDet.FieldByName('ValorAtual').AsString;

   rValorCotas := qryDet.FieldByName('ValorCotas').AsFloat;
   rValorReal := qryDet.FieldByName('ValorAtual').AsFloat;

   If qryDet.FieldByName('FlgProvisorio').AsInteger <= 0
      Then Begin
         lblPercConc.Visible := False;
         dbedPercConc.Visible := False;
         lblPercent.Visible := False;
         lblPrazoProv.Visible := False;
         dbedPrazoProv.Visible := False;
         lblMesProv.Visible := False;
      End
   Else Begin
         lblPercConc.Visible := True;
         dbedPercConc.Visible := True;
         lblPercent.Visible := True;
         lblPrazoProv.Visible := True;
         dbedPrazoProv.Visible := True;
         lblMesProv.Visible := True;
      End;

   // Verificar conta bancaria do recebedor
   If (Not qryBeneficiario.Active) Or (qryBeneficiario.FieldByName('NOMERESPONSAVEL').AsString = '')
      Then Begin
         qryContaBancaria.Close;
         qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('idPessoa').AsInteger;
         qryContaBancaria.Open;
      End
   Else Begin
         qryContaBancaria.Close;
         qryContaBancaria.ParamByName('IdPessoa').Value := qryBeneficiario.FieldByName('IdResponsavel').AsInteger;
         qryContaBancaria.Open;
      End;
End;

Procedure TfrmCadRequerBenefPensionista.sbtnAlterarClick(Sender: TObject);
Begin
   If (qry.FieldByName('IdSitProcesso').AsInteger <> 4) And
      (qry.FieldByName('IdSitProcesso').AsInteger <> 8) And
      (sTipoFormChamador <> 'MA')
      Then Begin
         MsgDlg(' Este processo não pode ser alterado. ', 'Informação', mtInformation, [mbOk, mbHelp], 0);
         bbtnCancelarClick(frmCadRequerBenefPensionista);
         Exit;
      End;
   Inherited;
End;

Procedure TfrmCadRequerBenefPensionista.dtInicioFundExit(Sender: TObject);
Begin
   Inherited;
   If (Trim(dtDataInicio.Text) = '') And (Trim(dtInicioFund.Text) <> '')
      Then Begin
         qryDet.FieldByName('DataInicio').AsDateTime := dtDataInicio.Date;
         dtDataInicio.Date := dtInicioFund.Date;
      End;

   If (Trim(dtInicioFund.Text) <> '') And
      (Trim(dtMortePensionista.Text) <> '') And
      (dtInicioFund.Date < dtMortePensionista.Date)
      Then Begin
         MsgDlg('A DIB (Data de Início na Fundação) não pode ser inferior a Data do Evento. ',
            'Informação', mtInformation, [mbOk, mbHelp], 0);
         dtInicioFund.SetFocus;
         Exit;
      End;

End;

Procedure TfrmCadRequerBenefPensionista.dtDataInicioExit(Sender: TObject);
Begin
   Inherited;
   If Trim(dtInicioFund.Text) = ''
      Then dtInicioFund.Date := dtDataInicio.Date;

   // Data de Inicio na Fundacao nao pode ser menor que a data no INSS,
   // nem que a data do evento
   If (Trim(dtDataInicio.Text) <> '') And
      (Trim(dtMortePensionista.Text) <> '') And
      (dtDataInicio.Date < dtMortePensionista.Date)
      Then Begin
         MsgDlg('A Data de Início do Pagamento não pode ser inferior a Data do Evento. ',
            'Informação', mtInformation, [mbOk, mbHelp], 0);
         dtDataInicio.SetFocus;
         Exit;
      End;

   sDataInicioPagto := FormatDateTime('dd/mm/yyyy', dtDataInicio.Date);

   //  Andre Imakawa - SIG 58900 - Inicio
   if (qryDet.State in [DsInsert, DsEdit]) and not(qryBeneficio.IsEmpty) then
   begin
     If (dtDataInicio.Text <> '') and (dtDataFinal.Enabled) and
       (qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger = 2) and (dtDataFinal.Text = '') Then
     Begin
       qryDet.FieldByName('DATAFINAL').AsString := qryDet.FieldByName('DataInicio').AsString;
       dtDataFinal.Text                         := dtDataInicio.Text;
     end;
   end;  
   //  Andre Imakawa - SIG 58900 - Fim
   
End;

Procedure TfrmCadRequerBenefPensionista.bbtnConfirmarClick(Sender: TObject);
Var bOk: boolean;
   sMesAtraso: String;
   IdParticipante: Integer;
   dCorrecaoMonetaria : Currency;  // SOL 132938
   sAnoMesAtual, sAnoMesFim : String;         // SOL 132938
   iNumRecebimento,  iIdContribuicao : INTEGER; // SOL 132938
   bAlteradorBua : boolean;  // SOL 132938
   sMsgErro: String;         // edilaine - SOL 270961 / PPM 1342333
Begin
   sNumeroProcessoAntesGravar := IntToStr(iNumeroProcesso);
   bAlteradorBua := false; // SOL 132938
   // Fazer verificacoes
   If qryDet.State In [dsInsert, dsEdit] Then
      Begin
         MsgDlg('O Processo não pode ser confirmado. ' +
            'Confirme o benefício em aberto. ', 'Erro', mtError, [mbOk, mbHelp], 0);
         Abort;
      End;

   // Verificar campos obrigatorios
   If qryDet.IsEmpty Then
      Begin
         MsgDlg('O Processo deve conter ao menos um benefício.', 'Erro', mtError, [mbOk, mbHelp], 0);
         Abort;
      End;

   With qryAux Do
      Begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT COUNT(DISTINCT BF.IDPESSOA)  AS NUMBENEF ' +
            ' FROM BENEFBFCIARIO BF, BENEFPLANPREV BP ' +
            ' WHERE BF.NUMEROPROCESSO = ' + IntToStr(iNumeroProcesso) +
            '   AND  ((BF.IDSITBENEFICIO = 1) OR (BF.IDSITBENEFICIO = 4)) ' +
            '   AND  (BP.IDPLANOPREV    = BF.IDPLANOPREV) ' +
            '   AND  (BP.IDBENEFICIO    = BF.IDBENEFICIO) ' +
            '   AND  ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  ');
         Open;

         If IsEmpty Then
            iNumBenef := 1
         Else
            iNumBenef := FieldByName('NUMBENEF').AsInteger;
      End;

   // Verificar consistencia de no de dependentes para IRRF e SalarioFamilia
   If Not VerificaNumeroDependentes Then Exit;

   // Verificar se existe  algum benefício obrigatorio no evento que não foi
   // requerido
   If Not VerificaBeneficioObrigatorio Then Exit;

   // Se está em edicao, e concedeu o beneficio, preparar contribuicoes
   If (qry.State = dsEdit) And (bConcedeuBeneficio) Then
      Begin
         bCobraContribAtrasada := False;

         //verifica se os acertos devem ser cobrados no benefício do beneficiário
         If qryBeneficio.FieldByName('FLGACEITAACERTO').AsInteger = 1 Then
            Begin
               // Verificar se participante tem contribuicoes atrasadas
               If VerificaContribAtrasada(sMesAtraso) Then
                  Begin
                     If qryBeneficio.FieldByName('FLGQUITAPREVIDEN').AsInteger = 0 Then
                        Begin
                           If MsgDlg('Este participante possui contribuições atrasadas desde ' + sMesAtraso + '. ' +
                              'Deseja cobrar estas contribuições na Folha de Benefícios ? ',
                              'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
                              Begin
                                 bCobraContribAtrasada := False;

                                 If MsgDlg('Deseja continuar a concessão do benefício ? ',
                                    'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo Then
                                    Begin
                                       TiraSQL(qryAux);
                                       Exit;
                                    End;
                              End
                           Else
                              bCobraContribAtrasada := True;
                        End
                     Else
                        Begin
                           MsgDlg('Este participante possui contribuições atrasadas desde ' + sMesAtraso + ' e ' +
                              'o benefício selecionado OBRIGA QUITAR as dívidas previdenciárias. ' +
                              'Verifique.', 'Erro', mtError, [mbOk, mbHelp], 0);
                           TiraSQL(qryAux);
                           Exit;
                        End;
                  End;
            End;

         If Not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         // Verificar beneficios POS-MORTE, ou seja, os beneficios que já foram pagos ao
         // participante com data posterior a data da morte do mesmo
         // Estes beneficios devem ser descontados dos beneficiarios
         If bOK Then
            Begin
               bOK := False;

               IdParticipante := qryDet.FieldByName('IDTITBENEF').AsInteger;

               bOK := TrataBeneficioPosMorte(iNumeroProcesso,
                  qryDet.FieldByName('IdPessJur').AsInteger,
                  qryDet.FieldByName('IdPlanoPrev').AsInteger,
                  IdParticipante,
                  qryDet.FieldByName('SeqProposta').AsInteger,
                  prmIdMotivoFolhaBen,
                  iNumBenef,
                  iIdLoteConcessao,
                  FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
                  sDataPagamentoConcessao,
                  qryDet.FieldByName('IdTitular').AsInteger
                  );

               If Not (bOK) Then
                  Begin
                     dtmBaseDados.dbBaseDados.RollBack;
                     MsgDlg('Erro na verificação/tratamento de benefício pós-morte. Verifique. ', 'Erro', mtError, [mbOk, mbHelp], 0);
                     TiraSQL(qryAux);
                     Exit;
                  End;
            End;

         If bOK Then
            Begin
               bOK := False;
               bOK := TrataAtrasoDevolContribPosMorte(iNumeroProcesso,
                  qryDet.FieldByName('IdPessJur').AsInteger,
                  qryDet.FieldByName('IdPlanoPrev').AsInteger,
                  qryDet.FieldByName('IdTitular').AsInteger,
                  qryDet.FieldByName('IdPessoa').AsInteger, //William Moreira da Silva - SOL 213339
                  qryDet.FieldByName('SeqProposta').AsInteger,
                  prmIdMotivoFolhaBen,
                  iNumBenef,
                  iIdLoteConcessao,
                  FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
                  sDataPagamentoConcessao
                  );

               If Not (bOK) Then
                  Begin
                     dtmBaseDados.dbBaseDados.RollBack;
                     MsgDlg('Erro na verificação/tratamento de benefício pós-morte. Verifique. ', 'Erro', mtError, [mbOk, mbHelp], 0);
                     TiraSQL(qryAux);
                     Exit;
                  End;
         End;


          // SOL 132938
          If Trim(DbLAlterador.Text) = 'Sim' Then
          Begin
             // para que seja possivel ordenar as contribuições de acordo com a ordenação dos beneficios
             // foi necessario criar uma query ordenada conforme a query que traz os beneficios no demonstrativo
             sSQL :=
                  ' SELECT BF.IDBENEFICIO FROM BENEFBFCIARIO BF , BENEFICIO B '+
                  ' WHERE  B.IDBENEFICIO = BF.IDBENEFICIO      '+
                  ' AND    BF.NUMEROPROCESSO = '+ qryDet.FieldByName('NUMEROPROCESSO').AsString +
                  ' ORDER  BY B.NOME                           ';

            If FazQuery(qryAux2, sSQL) Then
               qryAux2.First;

             while not qryAux2.Eof do
             begin

                //edilaine WO7690: inicio
                if not qryDet.Locate('IdBeneficio',qryAux2.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive]) then
                begin
                  qryAux2.next;
                  continue;
                end;
                //edilaine WO7690 - fim

                With qryAux do
                begin
                   Close;
                   SQL.Clear;
                   SQL.Add(' SELECT MESREFERENCIA FROM CTRLINTERFACE '+
                           ' WHERE  IDLOTE = '+IntToStr(iIdLoteConcessao));
                   Open;

                   sAnoMesFim :=  qryAux.FieldByName('MESREFERENCIA').Asstring;
                end;

                // verifica se é BUA
                sSQL :=
                      ' SELECT * ' +
                      ' FROM BENEFBFCIARIO BEN ' +
                      ' WHERE BEN.IDTPPAGTOBENEFIC = 2 ' +
                      ' AND   BEN.IDBENEFICIO   = '+ qryDet.FieldByName('IDBENEFICIO').AsString +
                      ' AND   BEN.IDPESSOA      = '+ qryDet.FieldByName('IDPESSOA').AsString +
                      ' AND   BEN.IDTITULAR     = '+ qryDet.FieldByName('IDTITULAR').AsString +
                      ' AND   BEN.IDPLANOPREV   = '+ qryDet.FieldByName('IDPLANOPREV').AsString ;

                If FazQuery(QryAux, sSQL) Then
                Begin
                   //sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIO').AsDateTime); //SIG49612
                   //sAnoMesFim   := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIO').AsDateTime); //SIG49612
                   bAlteradorBua := true;
                end
                else
                begin
                   bAlteradorBua := false;
                   //Inicio SIG49612
                   //if  qryDet.FieldByName('DATAINICIO').Asstring <> '' then
                   //   sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIO').AsDateTime)
                  //else
                   //   sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIOFUND').AsDateTime);
                   //Final SIG49612
                end;
                //Inicio SIG49612
                if  qryDet.FieldByName('DATAINICIO').Asstring <> '' then
                   sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIO').AsDateTime)
                else
                   sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIOFUND').AsDateTime);
                //Final SIG49612

                while  sAnoMesAtual <= sAnoMesFim do
                begin

                   sSQL :=
                   //' SELECT H.VALORPREV ' +
                    ' SELECT DECODE(H.FLGDEVOLUCAO,1,-H.VALORPREV ,H.VALORPREV) AS VALORPREV' +   //SOL 132938 André Oliveira
                   '   FROM BENEFICIO B, HSTBENEFBFCIARIO H, BENEFPLANPREV BPP ' +
                   '  WHERE H.IDLOTE = ' + QuotedStr(IntToStr(iIdLoteConcessao)) +
                   '    AND H.IDPESSJUR = '+ qryDet.FieldByName('IDPESSJUR').AsString +
                   '    AND H.IDPESSOA = '+ qryDet.FieldByName('IDPESSOA').AsString +
                   '    AND H.SEQPROPOSTA = 1 ' +
                   '    AND H.NUMEROPROCESSO = '+ qryDet.FieldByName('NUMEROPROCESSO').AsString +
                   '    AND H.IDBENEFICIO    = '+ qryDet.FieldByName('IDBENEFICIO').AsString +
                   '    AND BPP.IDBENEFICIO = H.IDBENEFICIO ' +
                   '    AND BPP.IDPLANOPREV = H.IDPLANOPREV ' +
                   '    AND H.FLGDEVOLUCAO = 0 ' +
                   '    AND H.FLGENVIADO = 0 ' +
                   '    AND B.IDBENEFICIO = H.IDBENEFICIO ' +
                   '    AND H.MESREFERENCIA = ' + QuotedStr(sAnoMesAtual);

                   If FazQuery(QryAux, sSQL) and (sAnoMesAtual <> sAnoMesFim) Then
                   Begin

                      If Not CalculaAlteradores('B', sAnoMesAtual,
                                             QryAux.FieldByName('VALORPREV').AsFloat,
                                             dCorrecaoMonetaria,
                                             -1,-1)
                      Then Begin
                         dtmBaseDados.dbBaseDados.RollBack;
                         MsgDlg('Erro no calculo dos alteradores.', 'Erro', mtError, [mbOk,mbHelp], 0);
                         TiraSQL(qryAux);
                         Exit;
                      End;
                   end;
                   if Length(sIdContribuicaoAlteradores) <= 0 then  //SOL 132938 André Oliveira
                      sIdContribuicaoAlteradores := '0';

                   // Buscar NUMRECEBIMENTO para inserir na HSTATRASOCONTRIB
                   sSQL := //'SELECT H.IDCONTRIBUICAO, H.NUMRECEBIMENTO, H.VALORESPERADO FROM '+
                   'SELECT H.IDCONTRIBUICAO, H.NUMRECEBIMENTO, DECODE(H.FLGDEVOLUCAO,1,H.VALORESPERADO ,-H.VALORESPERADO) AS VALORESPERADO FROM '+  //SOL 132938 André Oliveira
                           'HSTCONTRIBPREV H WHERE H.NUMRECEBIMENTO =      '+
                           '(SELECT MAX(NUMRECEBIMENTO) AS NUMRECEBIMENTO  '+
                           ' FROM HSTCONTRIBPREV HCP '+
                           ' WHERE                   '+
                           '  HCP.IDPESSOA = '+ qryDet.FieldByName('IDPESSOA').AsString      +' AND '+
                           '  HCP.IDMOTIVO = '+ inttostr(prmIdMotivoContrib)                 +' AND '+
                           '  HCP.MESREFERENCIA  = '+ QuotedStr(sAnoMesAtual)                +' AND '+
                           '  HCP.IDCONTRIBUICAO = H.IDCONTRIBUICAO                             AND '+
                           '  HCP.IDPESSOA = H.IDPESSOA )                                       AND '+
                           '  H.Idcontribuicao in ( ' +sIdContribuicaoAlteradores +' ) ';

                   If FazQuery(QryAux, sSQL) Then
                   Begin
                      iNumRecebimento := qryAux.FieldByName('NUMRECEBIMENTO').AsInteger;
                      iIdContribuicao := qryAux.FieldByName('IDCONTRIBUICAO').AsInteger;

                      If (((iNumRecebimento > 0) and not(bAlteradorBua)) and (sAnoMesAtual <> sAnoMesFim)) Then //Begin // SOL 232043 PPM 396781
                      Begin
                         // Calcular Alterados
                         If Not CalculaAlteradores('C', sAnoMesAtual,
                                                  qryAux.FieldByName('VALORESPERADO').AsInteger,
                                                  dCorrecaoMonetaria,
                                                  iIdContribuicao, iNumRecebimento,0)
                         Then Begin
                            dtmBaseDados.dbBaseDados.RollBack;
                            MsgDlg('Erro no calculo dos alteradores.', 'Erro', mtError, [mbOk,mbHelp], 0);
                            TiraSQL(qryAux);
                            Exit;
                         End;
                      END;
                   END;

                   if (((sAnoMesAtual = sAnoMesFim) and (sAnoMesAtual <> (Copy(sAnoMesAtual, 1,4) + '/13')))  and not(bAlteradorBua))  then
                   begin
                      sAnoMesAtual := Copy(sAnoMesAtual, 1,4) + '/13';
                      sAnoMesFim   := Copy(sAnoMesFim, 1,4) + '/13';
                   end else
                   if (Copy(sAnoMesAtual, 6,2) = '12') then
                   begin
                      sAnoMesAtual  := Copy(sAnoMesAtual, 1,4) + '/13';
                   end else
                   begin
                      sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
                   end;
                end;
                qryAux2.next;
             end;
          end;
          // SOL 132938


         //grava o mvimento na MOVBENEF
         qryDet.First;
         While Not qryDet.Eof Do
            Begin
               Try
                  CriaLogOcorrencia({qryDet.FieldByName('IdPlanoORIGEM').AsString,      //edilaine SIG99886}
                     qryDet.FieldByName('IdPlanoPREV').AsString,                        //edilaine SIG99886
                     qryDet.FieldByName('IdPessJur').AsString,
                     qryDet.FieldByName('IdTitular').AsString,
                     qryDet.FieldByName('IdBeneficio').AsString,
                     qryDet.FieldByName('NumeroProcesso').AsString,
                     qryDet.FieldByName('IdPessoa').AsString,
                     qryDet.FieldByName('SeqProposta').AsString,
                     '7',
                     FormatDateTime('dd/mm/yyyy', date),
                     qryDet.FieldByName('ValorAtual').AsString,
                     qryDet.FieldByName('ValorTotal').AsString,
                     qryDet.FieldByName('ValorCotas').AsString,
                     qryDet.FieldByName('DataInicio').AsString,
                     qryDet.FieldByName('DataFinal').AsString,
                     qryDet.FieldByName('ValorAtual').AsString,
                     qryDet.FieldByName('DataInicio').AsString,
                     qryDet.FieldByName('DataFinal').AsString,
                     '4',
                     qryDet.FieldByName('FlgDataPrevista').AsInteger,
                     qryAux,
                     '',
                     iIdLoteConcessao,
                     iIdCalculo,
                     False,
                     iFlgEmprestimo)
               Except
                  frmAguarde.Apaga;
                  dtmBaseDados.dbBaseDados.RollBack;
                  MsgDlg('Erro no registro da operação.', 'Erro', mtError, [mbOk, mbHelp], 0);
                  TiraSQL(qryAux);
                  Exit;
               End;

               qryDet.Next;
            End;

         If Not ConfirmaBeneficio Then
            Begin
               dtmBaseDados.dbBaseDados.RollBack;
               TiraSQL(qryAux);
               Exit;
            End;

         // Adicionando Log Padrao
         Try
            If Not Sistema.GravaLogOperacoes(Self.Caption) Then
               Raise exception.Create('Erro ao gravar Log.')
         Except
         End;

         // dtmBaseDados.dbBaseDados.Commit; Thiago Melo SOL 204075 Kintana 1972836         

         //Otacilio Aquino SOL 160863 Kintana 1381911
         uBeneficio.bGravaEvento := True;
      End;
  // Colocado o Inherited no fim da procedure
//inherited;//SOL 201131 Kintana 1944161//

 // SOL 169562/11863 Kintana 1821350 ** Inicio **

     lblSitProcesso.Caption := 'Situação : ' + qryDetDescricao.AsString;
     Refresh;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' UPDATE PROCESSOBENEF SET '+
                    ' IDSITPROCESSO = ' + IntToStr(qryDet.FieldByName('IDSITBENEFICIO').AsInteger) +
                    ' WHERE NUMEROPROCESSO = ' + IntToStr(iNumeroProcesso));
 try
     qryAux.ExecSQL;
  except
     if dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.RollBack;

     MsgDlg('Ocorreu um erro na atualização do Processo Beneficiário. Verifique. ',
            'Erro',mtError,[mbOk],0);
     Exit;
  end;
  
inherited;//SOL 201131 Kintana 1944161//
     // SOL 169562/11863 Kintana 1821350 ** Fim **   

   If (sTipoFormChamador = 'SI') And (Not prmFlgGravaSimulBenef) Then
      Begin
         // Verificar se existe relatorio parametrizavel para Simulacao de Beneficio
         With qryAux Do
            Begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT MAX(BP.IDRELATBENEFICIO) AS IDRELATBENEFICIO, MAX(BP.ORIGEMCMBENEFICIO) AS ORIGEMCMBENEFICIO ' +
                  ' FROM   BENEFPLANPREV BP, BENEFBFCIARIO BF        ' +
                  ' WHERE  BF.NUMEROPROCESSO IN (' + sNumeroProcessoAntesGravar + ')' +
                  ' AND    BP.IDPLANOPREV = BF.IDPLANOPREV ' +
                  ' AND    BP.IDBENEFICIO = BF.IDBENEFICIO ');
               Open;

               If (FieldByName('IdRelatBeneficio').AsInteger > 0) And
                  (MsgDlg('Esta simulação será descartada. Deseja imprimir relatório de simulação ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
                  Begin
                     sbtnImprimirSimulacaoClick(Sender);
                  End;

                  // INICIO Thiago Passos SOL 131674
               if not DesfazRequerimentos(qryAux, sNumeroProcessoAntesGravar) then //Thiago Passos SOL 131674
                 begin
                    dtmBaseDados.dbBaseDados.Rollback;
                    MsgDlg('Não foi possível desfazer os requerimentos. ', 'Erro', mtError, [mbOk, mbHelp], 0);
                 end
                 else
                   begin
                     if dtmBaseDados.dbBaseDados.InTransaction then
                        dtmBaseDados.dbBaseDados.Commit;
                   end;
                  // FIM Thiago Passos SOL 131674



            End;
      End;


   //Inicio SOL 143353 KINTANA 929082
   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
      dtmBaseDados.dbBaseDados.Commit;

      // edilaine - SOL 270961 / PPM 1342333
      if (sTipoFormChamador = 'CO') and  (bConcedeuBeneficio) then
      begin
        // chamar procedure que abre o processo em vários por pessoaxbeneficio
        if not DesmembraProcessosBeneficios(NumeroProcesso, sListaProcessos, sMsgErro ) then
        begin
          MsgDlg('Erro no desmembramento do Processo ['+sMsgErro+']. Verifique.','Erro',mtError,[mbOk],0);
          frmAguarde.Apaga;
          exit;
        end;

        // edilaine - SOL 262968 / PPM 1102753 - inicio
        if (sTipoFormChamador = 'CO') then
           GeraDemonstrativo(formatdatetime ('hh:mm:ss',now));
        // edilaine - SOL 262968 / PPM 1102753 - fim

      end;
      // edilaine - SOL 270961 / PPM 1342333


   end;
   //Fim SOL SOL 143353 KINTANA 929082


   //Otacilio Aquino SOL 160863 Kintana 1381911
   uBeneficio.bGravaEvento := True;
  // Colocado o Inherited no fim da procedure

End;

Procedure TfrmCadRequerBenefPensionista.sbtnExcluiDetClick(Sender: TObject);
Var qryAuxCalc, qryDelCalc: TQuery;
Begin
   If qrydet.isempty Then
      Begin
         sbtnExcluiDet.Down := false;
         exit;
      End;

   If Not qryBeneficio.Active
      Then Begin
         qryBeneficio.Close;
         qryBeneficio.ParamByName('IdEventoGerador').Value := iIdEvento; // SOL 170753 Kintana 1529212
         qryBeneficio.ParamByName('IdPlanoPrev').Value := iIdPlanoPrev;
         qryBeneficio.Open;
         If iIdEvento = 4 Then // SOL 170753 Kintana 1529212
         Begin
            qryBeneficio.Filter := 'FLGPECULIO = 1'; // SOL 170753 Kintana 1529212
            qryBeneficio.Filtered := True; // SOL 170753 Kintana 1529212
         end
         else
             begin
            qryBeneficio.Filtered := False; // SOL 170753 Kintana 1529212
             end
      End;

   // O usuario só terá este botao disponivel se o processo estiver
   // pendente ou nao concedido
   // Logo se o processo estiver pendente e o beneficio que o usuario esta
   // tentando excluir for resgate, o sistema devera devolver a reserva
   If ((qryDet.FieldByName('IdSitBeneficio').AsInteger = 4) Or
      (qryDet.FieldByName('IdSitBeneficio').AsInteger = 8)) And
      (qryDet.FieldByName('FlgResgate').AsInteger = 1)
      Then Begin
         If Not DevolveReserva(qryDet.FieldByName('IdBeneficio').AsInteger,
            qryDet.FieldByName('IdPessoa').AsInteger)
            Then Begin
               MsgDlg('Ocorreu um problema no acerto do saldo de reserva deste participante. ' +
                  'Para sua garantia o processo não será concedido até que o problema seja solucionado. ' +
                  'Verifique. ', 'Informação', mtInformation, [mbOk, mbHelp], 0);
               TiraSQL(qryAux);
               Exit;
            End;
      End;

   qryBenefAux.Locate('IdBeneficio', qryBeneficio.FieldByName('IdBeneficio').AsInteger, [loCaseInsensitive]);
   While (Not qryBenefAux.Eof) Or
      (qryBenefAux.FieldByName('IdBeneficio').AsInteger = qryBeneficio.FieldByName('IdBeneficio').AsInteger) Do
      Begin
         qryBenefAux.Delete;
      End;

   QryAuxCalc := Tquery.Create(Self);
   QryAuxCalc.databasename := 'basedados';
   QryAuxCalc.SQL.Add(' Select idcalculo from relbenefpart where numeroprocesso = ' + inttostr(iNumeroProcesso) +
      ' and idpessoa    = ' + qryBeneficiario.fieldbyname('idpessoa').asstring +
      ' and idbeneficio = ' + qrybeneficio.fieldbyname('idbeneficio').asString);
   QryAuxCalc.Open;
   QryDelCalc := Tquery.Create(Self);
   QryDelCalc.databasename := 'basedados';

   While Not QryAuxCalc.eof Do
      Begin
         QryDelCalc.sql.Clear;
         QryDelCalc.sql.add(' delete from relbenefpart where idcalculo = ' + QryAuxCalc.fieldbyname('idcalculo').asString +
            ' and idpessoa = ' + qryBeneficiario.fieldbyname('idpessoa').asstring);
         QryDelCalc.ExecSql;

         QryAuxCalc.next;
      End;
   QryDelCalc.Free;
   QryAuxCalc.Free;

   Inherited;

End;

Procedure TfrmCadRequerBenefPensionista.FormShow(Sender: TObject);
Begin
   InicializaEP;


   If bAbriuOutroForm
      Then Begin
         { iIdPlanoPrev trocado por iIdPlanoPrevTit }
         PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrevTit, iSeqProposta, iIdPensionista);
         FIdPlanoPrevTit := iIdPlanoPrevTit;
         Exit;
      End;

   sNumerosProcessos := '';

   Inherited;

   If sTipoFormChamador = 'EV' // form chamador é um dos eventos
   Then Begin
         Caption := 'Requerimento de Benefícios para Beneficiários de Pensionistas';

         // Verificar se beneficio já foi requerido por este evento
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT P.NUMEROPROCESSO FROM PROCESSOBENEF P, BENEFBFCIARIO B ' +
            ' WHERE ' +
            '       P.IDSITPROCESSO   IN (1,4) ' +
            ' AND   P.DTEVENTO = TO_DATE(''' + sDataFalePensionista + ''',''dd/mm/yyyy'') ' +
            ' AND   B.NUMEROPROCESSO = P.NUMEROPROCESSO ' +
            ' AND   B.IDTITULAR = ' + IntToStr(iIdTitular) +
            ' AND   B.IDPLANOORIGEM = ' + IntToStr(iIdPlanoPrev) +
            ' AND   B.IDPESSJUR  = ' + IntToStr(iIdPessJur));
         qryAux.Open;
         If qryAux.IsEmpty
            Then Begin
               qryAux.Close;
               sbtnInserirClick(Sender);
               // Preencher dados do evento
               Try
                  qryPensionista.Close;
                  qryPensionista.ParamByName('IDTITULAR').AsInteger := iIdTitular;
                  qryPensionista.Open;

                  If qryPensionista.Locate('IDPESSOA', iIdPensionista, [loCaseInsensitive])
                     Then Begin
                        dblkpcmbPensionista.Text := qryPensionista.FieldbyName('NOME').AsString;
                        edMatriculaPensionista.Text := qryPensionista.FieldbyName('MATRICULA').AsString;
                        dtMortePensionista.Date := qryPensionista.FieldbyName('DATAMORTE').AsDateTime;
                     End
                  Else Begin
                        dblkpcmbPensionista.Text := '';
                        edMatriculaPensionista.Text := '';
                        dtMortePensionista.Text := '';
                     End;
               Except
                  On E: EDBEngineError Do
                     Begin
                        MostrarErro(E);
                        MsgDlg(' Erro ao tentar localizar o evento gerador. Verifique. ', 'Informação', mtInformation, [mbOk, mbHelp], 0);
                     End;
               End;
            End
         Else Begin
               qryPensionista.Close;
               qryPensionista.ParamByName('IDTITULAR').AsInteger := iIdTitular;
               qryPensionista.Open;

               If qryPensionista.Locate('IDPESSOA', iIdPensionista, [loCaseInsensitive])
                  Then Begin
                     dblkpcmbPensionista.Text := qryPensionista.FieldbyName('NOME').AsString;
                     edMatriculaPensionista.Text := qryPensionista.FieldbyName('MATRICULA').AsString;
                     dtMortePensionista.Date := qryPensionista.FieldbyName('DATAMORTE').AsDateTime;
                  End
               Else Begin
                     dblkpcmbPensionista.Text := '';
                     edMatriculaPensionista.Text := '';
                     dtMortePensionista.Text := '';
                  End;
               iNumeroProcesso := qryAux.FieldbyName('NumeroProcesso').AsInteger;
               qryAux.Close;
               SelecionaProcesso(iNumeroProcesso);
               sbtnAlterarClick(Sender);
            End;

         // Desabilitar a concessao e a alteracao do tipo de evento
         sbtnConcedeUm.Enabled := False;

         // Simular um procurar com os dados passados como parametro
         bQueryTitular := False;
         bQuerySalarios := False;
         bQueryContribuicoes := False;
         bPerguntouCancelar := False;

         qryBeneficio.Close;
         qryBeneficio.ParamByName('IdEventoGerador').Value := FIdEvento; // SOL 170753 Kintana 1529212    //edilaine - SIG84020
         qryBeneficio.ParamByName('IdPlanoPrev').Value := iIdPlanoPrev;
         qryBeneficio.Open;
         If iIdEvento = 4 Then // SOL 170753 Kintana 1529212
         Begin
            qryBeneficio.Filter := 'FLGPECULIO = 1'; // SOL 170753 Kintana 1529212
            qryBeneficio.Filtered := True; // SOL 170753 Kintana 1529212
         end
         else
             begin
            qryBeneficio.Filtered := False; // SOL 170753 Kintana 1529212
             end  ;

         { iIdPlanoPrev trocado por iIdPlanoPrevTit }
         PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrevTit, iSeqProposta, iIdPensionista);
      End
   Else Begin
         If sTipoFormChamador = 'CO' // form chamador é o menu concessao
         Then Begin
               Caption := 'Concessão de Benefícios para Beneficiário';
               MontaSelect.Filtro.Add(' B.IDSITBENEFICIO = 4 ');
               sbtnInserir.Enabled := False;
               lblNomeBenef.Caption := '';
            End
         Else If sTipoFormChamador = 'SI' // form chamador é o menu simulacao
         Then Begin
               Caption := 'Simulação de Benefício para Beneficiário';
               MontaSelect.Filtro.Add(' B.IDSITBENEFICIO = 8 ');
               lblNomeBenef.Caption := '';
            End
         Else Begin // form chamador é o menu Manutencao de Requerimento
               Caption := 'Manutenção de Processos de Benefícios para Beneficiário';
               sbtnInserir.Enabled := False;
               lblNomeBenef.Caption := '';
            End;
      End;

   wIdMotivo := prmIdMotivoContrib;

   dblkcmbTpPgtoBenef.Enabled := False; // Peterson Victor SOL 268616 PPM 1266499

End;

Procedure TfrmCadRequerBenefPensionista.bbtnSairClick(Sender: TObject);
Begin
   // inherited;
   bbtnCancelar.ModalResult := mrCancel;
   Close;
   //
End;

Procedure TfrmCadRequerBenefPensionista.dblkpcmbBeneficioCloseUp(
   Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Var sDataInicio, sDataFinal, sMsgErro,
   sNomeBenefOrdemMenor: String;

   bExisteBenefOrdemMenor,
      bErro: boolean;

Begin
   Inherited;

  //Vander Campos - SOL 190523 Kintana 1801709
  if qryBeneficio.Recordcount = 0 then Exit;

  // Verificar hstbenefbfciario Vinicius Ferreira SOL 159322 KINTANA 1308856
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT * '+
                 ' FROM   hstbenefbfciario '+
                 ' WHERE     NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+
                 ' AND    IDBENEFICIO  = '+QuotedStr(sBeneficioAnterior)+   // SOL 162003 Kintana 1373069 E SOL 162023 Kintana 1373448 INCLUIDO O QuotedStr
                 ' AND    IDPESSJUR    = '+IntToStr(iIdPessJur)+
                 ' AND    IDPLANOPREV  = '+IntToStr(iIdPlanoPrev)+
                 ' AND    IDPESSOA     = '+IntToStr(iIdPessoa)+
                 ' AND    IDTITULAR    = '+IntToStr(iIdTitular)+
                 ' AND    SEQPROPOSTA  = '+IntToStr(iSeqProposta));
  qryAux.Open;

   if not (qryAux.IsEmpty) then
   begin

     MsgDlg('Não é possivel alterar benefício pois contém histórico.','Erro',mtError,[mbOk],0);
     qryAux.Close;
     Exit;
   end;

   bbtnSelecionaBeneficiarios.Enabled := True;
   bNovoBeneficio := True;
   dblkpcmbBeneficiario.Enabled := False;
   dbeMatriculaBenef.Enabled := False;
   iTotRequeridos := 0;

   If qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC', qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
      Then Begin
         dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
         dblkcmbTpPgtoBenef.PerformSearch;
      End
   Else dblkcmbTpPgtoBenef.Text := '';


   // Verificar se este benefício já foi requerido para algum beneficiário
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT BF.NUMEROPROCESSO, BF.DATAREQUERIMENTO, BF.IDSITBENEFICIO ' +
      ' FROM   BENEFBFCIARIO BF ' +
      ' WHERE  BF.IDTITULAR    = ' + IntToStr(iIdTitular) +
      ' AND    BF.SEQPROPOSTA  = ' + IntToStr(iSeqProposta) +
      ' AND    BF.IDPESSJUR    = ' + IntToStr(iIdPessJur) +
      ' AND    BF.IDPLANOORIGEM  = ' + IntToStr(iIdPlanoPrev) +
      ' AND    BF.IDBENEFICIO  = ' + qryBeneficio.FieldbyName('IdBeneficio').AsString +
      ' AND    BF.IDSITBENEFICIO = 4 ' +
      ' AND    BF.NUMEROPROCESSO = ' + IntToStr(iNumeroProcesso));
   qryAux.Open;
   If Not qryAux.IsEmpty
      Then Begin
         If MsgDlg('Este benefício já foi requerido em ' + qryAux.FieldByName('DataRequerimento').AsString +
            ' e está pendente de concessão. ' +
            'Verifique o processo nº ' + qryAux.FieldByName('NumeroProcesso').AsString + '. Deseja continuar ?',
            'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
            Then Begin
               qryAux.Close;
               dblkpcmbBeneficio.Text := '';
               If (dblkpcmbBeneficio.Enabled) And (dblkpcmbBeneficio.visible) Then
                  dblkpcmbBeneficio.SetFocus;
               Exit;
            End;
      End;



   If qryBenefAux.Locate('IdBeneficio', qryBeneficio.FieldByName('IdBeneficio').AsInteger, [loCaseInsensitive])
      Then Begin
         qryaux.SQL.clear;
         qryaux.sql.add('SELECT IDCALCULO FROM RELBENEFPART WHERE NUMEROPROCESSO = ' + IntToStr(iNumeroProcesso) +
            ' AND IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').asstring);
         qryaux.open;
         iIdCalculo := qryaux.fieldbyname('IDCALCULO').asInteger;
         qryAux.Close;
      End
   Else
      iIdCalculo := 0;

   { Atualizar Fonte Pagamento - SUPLEMENTAÇÃO  1 - INSS 2 }
   If (qryDet.Active) And (qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 0) Then
   begin
      qryDet.Edit; // Vinicius Ferreira SOL 159322 KINTANA 1308856
      qryDet.FieldByName('FONTEPAGADORA').AsInteger := 1;
   end
   Else begin
      qryDet.Edit;
      qryDet.FieldByName('FONTEPAGADORA').AsInteger := 2;
   end;

   lblNomeBenef.Caption := dblkpcmbBeneficio.Text;


   // Preencher qual é o beneficio de referencia
   If Trim(qryBeneficio.FieldByName('IDBENEFREF').AsString) <> '' Then Begin
         iIdBenefReferencia := qryBeneficio.FieldByName('IDBENEFREF').AsInteger;
      End Else Begin
         iIdBenefReferencia := -1;
      End;



   // Executar regra de calculo de data de inicio e data final
   If (Trim(qryBeneficio.FieldByName('IdRegraInicio').AsString) <> '') And
      (qryBeneficio.FieldByName('IdRegraInicio').AsInteger > 0) Then
      Begin
         frmAguarde.Mostra('Regra de Data de Início - Nº ' + qryBeneficio.FieldByName('IdRegraInicio').AsString);

         Try
            sDataInicio := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraInicio').AsInteger,
               iIdPessJur,
               iIdPlanoPrev,
               iIdTitular,
               iSeqProposta,
               iIdTitular,
               qryBeneficio.FieldByName('IdBeneficio').AsInteger,
               rOpcao1,
               rOpcao2,
               rOpcao3,
               FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
               FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
               FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
               FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),
               FormatDateTime('dd/mm/yyyy', date),
               '',
               '',
               bErro,
               sMsgErro
               );
         Except
            frmAguarde.Apaga;
         End;
         frmAguarde.Apaga;

         If bErro Then
            Begin
               MsgDlg(sMsgErro, 'Erro', mtError, [mbOk, mbHelp], 0);
               qryDet.FieldByName('DataInicioFund').AsString := '';
               qryDet.FieldByName('DataInicio').AsString := '';
               dtDataInicio.Text := '';
               dtInicioFund.Text := '';
            End
         Else
            Begin
               If Trim(sDataInicio) <> ''
                  Then Begin
                     qryDet.FieldByName('DataInicioFund').AsString := sDataInicio;
                     qryDet.FieldByName('DataInicio').AsString := sDataInicio;
                     dtDataInicio.Date := StrToDate(sDataInicio);
                     dtInicioFund.Date := StrToDate(sDataInicio);
                  End;
            End;
      End //if regrainicio <> ''
   Else
      Begin
         qryDet.FieldByName('DataInicio').AsString := dtInicioFund.Text;
         dtDataInicio.Date := dtInicioFund.Date;
      End;

   If (Trim(qryBeneficio.FieldByName('IdRegraFim').AsString) <> '') And
      (qryBeneficio.FieldByName('IdRegraFim').AsInteger > 0) Then
      Begin
         frmAguarde.Mostra('Regra de Data Final - Nº ' + qryBeneficio.FieldByName('IdRegraFim').AsString);

         Try
            sDataFinal := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraFim').AsInteger,
               iIdPessJur,
               iIdPlanoPrev,
               iIdTitular,
               iSeqProposta,
               iIdTitular,
               qryBeneficio.FieldByName('IdBeneficio').AsInteger,
               rOpcao1,
               rOpcao2,
               rOpcao3,
               FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
               FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
               FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
               FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),
               FormatDateTime('dd/mm/yyyy', date),
               '',
               '',
               bErro,
               sMsgErro);
         Except
            frmAguarde.Apaga;
         End;
         frmAguarde.Apaga;

         If bErro Then
            MsgDlg(sMsgErro, 'Erro', mtError, [mbOk, mbHelp], 0)
         Else
            If Trim(sDataFinal) <> '' Then
               dtDataFinal.Date := StrToDate(sDataFinal);
      End; // if regrafim <> ''

   TiraSQL(qryAux);

   // Verificar se participante já fez opções
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3 FROM BENEFPLANOPART ' +
      ' WHERE IDPESSJUR   = ' + IntToStr(iIdPessJur) + ' AND ' +
      '       IDPESSOA    = ' + IntToStr(iIdTitular) + ' AND ' +
      '       IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
      '       SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND ' +
      '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
   qryAux.Open;

   If qryAux.IsEmpty
      Then Begin
         rOpcao1 := 0;
         rOpcao2 := 0;
         rOpcao3 := 0;
         rCampoTexto1 :='';
         rCampoTexto2 :='';
         rCampoTexto3 :='';
         // Se participante nao fez opcoes, inserir registro na benefplanopart
         // para o caso de alguma regra ter que gravar valores lá
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' INSERT INTO BENEFPLANOPART (IDPESSJUR,IDPLANOPREV,IDPESSOA, SEQPROPOSTA, IDBENEFICIO,VALORBASE1, ' +
            '             VALORBASE2,VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3) ' +
            ' VALUES (' + IntToStr(iIdPessJur) + ',' +
            IntToStr(iIdPlanoPrevTit) + ',' +
            IntToStr(iIdTitular) + ',' + IntToSTr(iSeqProposta) + ',' +
            qryBeneficio.FieldByName('IDBENEFICIO').AsString + ',' +
            OraNumero(FormatFloat('#0.00000', rOpcao1)) + ',' +
            OraNumero(FormatFloat('#0.00000', rOpcao2)) + ',' +
            OraNumero(FormatFloat('#0.00000', rOpcao3)) +  ',' +
            QuotedStr(rCampoTexto1)  +  ',' +
            QuotedStr(rCampoTexto2)  +  ',' +
            QuotedStr(rCampoTexto3)  +')');
         Try
            //        qryAux.ExecSQL;
         Except
            MsgDlg('Erro na associação do benefício ao titular.', 'Erro', mtError, [mbOk, mbHelp], 0);
            Exit;
         End;
      End
   Else Begin
         If qryAux.FieldByName('VALORBASE1').AsString <> ''
            Then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
         Else rOpcao1 := 0;

         If qryAux.FieldByName('VALORBASE2').AsString <> ''
            Then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
         Else rOpcao2 := 0;

         If qryAux.FieldByName('VALORBASE3').AsString <> ''
            Then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
         Else rOpcao3 := 0;

         If qryAux.FieldByName('CAMPOTEXTO1').AsString <> ''
            Then rCampoTexto1 := qryAux.FieldByName('CAMPOTEXTO1').AsString
         Else rCampoTexto1 := '';

         If qryAux.FieldByName('CAMPOTEXTO2').AsString <> ''
            Then rCampoTexto2 := qryAux.FieldByName('CAMPOTEXTO2').AsString
         Else rCampoTexto2 := '';

         If qryAux.FieldByName('CAMPOTEXTO3').AsString <> ''
            Then rCampoTexto3 := qryAux.FieldByName('CAMPOTEXTO3').AsString
         Else rCampoTexto3 := '';
      End;
   qryAux.Close;


   If sTipoFormChamador <> 'SI'
      Then reValorTotal.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRgValorTotal').AsString) <> '')
   Else reValorTotal.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRegraSimula').AsString) <> '');

   reValorBeneficio.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRegraCalculo').AsString) <> '');


   If qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
      Then lblValorBenef.Caption := 'Valor (Cotas) '
   Else lblValorBenef.Caption := 'Valor (Real)  ';

   If qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC', qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
      Then Begin
         dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
         dblkcmbTpPgtoBenef.PerformSearch;
      End
   Else dblkcmbTpPgtoBenef.Text := '';

   bbtnOpcoes.Visible := (qryBeneficio.FieldbyName('FlgAceitaOpcao').AsInteger = 1) or (qryBeneficio.FieldbyName('FLGOPCAOTEXTO').AsInteger = 1);

   lblAgencia.Visible := (qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1);
   dblkpcmbAgencia.Visible := (qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1);

   If qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
      Then lblValorBenef.Caption := 'Valor (Cotas) '
   Else lblValorBenef.Caption := 'Valor (Real)  ';



   reValorSRB.ReadOnly := Not ((qryBeneficio.FieldByName('FLGACTVLRSRB').AsInteger = 1) Or
      (Not (Trim(qryBeneficio.FieldByName('IdRegraSRB').AsString) <> '')));

   reValorBeneficio.ReadOnly := Not ((qryBeneficio.FieldByName('FLGACTVLRATUAL').AsInteger = 1) Or
      (Not (Trim(qryBeneficio.FieldByName('IDREGRASIMULA').AsString) <> '')));

   reValorTotal.ReadOnly := Not ((qryBeneficio.FieldByName('FLGACTVLRTOTBEN').AsInteger = 1) Or
      (Not (Trim(qryBeneficio.FieldByName('IdRegraSimula').AsString) <> '')));





End;

Procedure TfrmCadRequerBenefPensionista.dblkpcmbBeneficiarioCloseUp(
   Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Var varFields: variant;
Begin
   Inherited;

   // Verificar se este beneficio já foi requerido para este beneficiario
   dblkpcmbBeneficio.PerformSearch;
   varFields := VarArrayCreate([0, 1], varVariant);
   varFields[0] := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
   varFields[1] := qryBeneficiario.FieldByName('IdPessoa').AsInteger;

   If qryBenefAux.Locate('IdBeneficio;IdPessoa', varFields, [loCaseInsensitive])
      Then Begin
         MsgDlg('Este beneficiário já está neste mesmo processo para este benefício. Verifique. ', 'Erro', mtError, [mbOk, mbHelp], 0);
         dblkpcmbBeneficiario.Text := '';
         dblkpcmbBeneficiario.SetFocus;
         Exit;
      End;

   PreencheDadosBeneficiario(iNumeroProcesso, iIdTitular, qryBeneficiario.FieldByName('IdPessoa').AsInteger,
      iIdPessJur, iIdPlanoPrev, iSeqProposta);

   // Verificar se exitem opções de beneficiario
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3, CAMPOTEXTO1, CAMPOTEXTO2, CAMPOTEXTO3 FROM BENEFPLANOPART ' +
      ' WHERE IDPESSJUR   = ' + IntToStr(iIdPessJur) + ' AND ' +
      '       IDPESSOA    = ' + IntToStr(iIdPessoa) + ' AND ' +
      '       IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
      '       SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND ' +
      '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
   qryAux.Open;

   If qryAux.IsEmpty
      Then Begin
         rOpcao1 := 0;
         rOpcao2 := 0;
         rOpcao3 := 0;
         rCampoTexto1 := '';
         rCampoTexto2 := '';
         rCampoTexto3 := '';
      End
   Else Begin
         If qryAux.FieldByName('VALORBASE1').AsString <> ''
            Then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
         Else rOpcao1 := 0;

         If qryAux.FieldByName('VALORBASE2').AsString <> ''
            Then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
         Else rOpcao2 := 0;

         If qryAux.FieldByName('VALORBASE3').AsString <> ''
            Then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
         Else rOpcao3 := 0;

         If qryAux.FieldByName('CAMPOTEXTO1').AsString <> ''
            Then rCampoTexto1 := qryAux.FieldByName('CAMPOTEXTO1').AsString
         Else rCampoTexto1 := '';

         If qryAux.FieldByName('CAMPOTEXTO2').AsString <> ''
            Then rCampoTexto2 := qryAux.FieldByName('CAMPOTEXTO2').AsString
         Else rCampoTexto2 := '';

         If qryAux.FieldByName('CAMPOTEXTO3').AsString <> ''
            Then rCampoTexto3 := qryAux.FieldByName('CAMPOTEXTO3').AsString
         Else rCampoTexto3 := '';
      End;
   qryAux.Close;

   If qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC', qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
      Then Begin
         dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
         dblkcmbTpPgtoBenef.PerformSearch;
      End
   Else dblkcmbTpPgtoBenef.Text := '';

   // Verificar se o beneficio de INSS já foi requerido.
   // Se sim, entao trazer os dados do INSS já preenchidos
   If bNovoBeneficio
      Then Begin
         sValorTotal := '0';
         sDataInicioPagto := FormatDateTime('dd/mm/yyyy', dtDataInicio.Date);
      End;

   //  Andre Imakawa - SIG 58900 - Inicio
   If (dtDataFinal.Enabled) and (qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger = 2) and (dtDataFinal.Text = '') Then
   Begin
     qryDet.FieldByName('DATAFINAL').AsString := qryDet.FieldByName('DataInicio').AsString;
     dtDataFinal.Text                         := dtDataInicio.Text;
   end;
   //  Andre Imakawa - SIG 58900 - Fim
      
End;

Procedure TfrmCadRequerBenefPensionista.qryBeneficiarioAfterOpen(
   DataSet: TDataSet);
Begin
   Inherited;

   // Se o parametro do beneficio por plano (flgbenefinf) definir que
   //    é para considerar o no. de beneficiarios elegiveis
   // Entao iNumBenef := qryBeneficiario.RecordCount, pois a qryBeneficiario
   //       está com os elegiveis
   // Senao, abrir uma query auxiliar com todos os beneficiarios do beneficios
   //       iNumBenef := numero total de beneficiarios
   iNumBenef := qryBeneficiario.RecordCount;

   If Not qryBeneficio.Active Then Exit;

   If (qryBeneficio.FieldByName('flgBenefInf').AsInteger = 0) And
      (qryBeneficio.FieldByName('IdBeneficio').AsString <> '')
      Then Begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BFCIARIOTITPLAN BF ' +
            ' WHERE  (BF.IDTITULAR   = ' + IntToStr(iIdTitular) + ') ' +
            ' AND    (BF.IDPESSJUR   = ' + IntToStr(iIdPessJur) + ') ' +
            ' AND    (BF.IDPLANOORIGEM = ' + IntToStr(iIdPlanoPrev) + ') ' +
            ' AND    (BF.SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ') ' +
            ' AND    (BF.IDBENEFICIO = ' + qryBeneficio.FieldByName('IdBeneficio').AsString + ') ');
         qryAux.Open;
         iNumBenef := qryAux.RecordCount;
      End;
End;

Procedure TfrmCadRequerBenefPensionista.bbtnSelecionaBeneficiariosClick(Sender: TObject);
Var sMsgErro: String;
   bConcedeBeneficio,
      bErro: boolean;

Begin
   Inherited;
   iIdTitularSel := iIdTitular;
   iIdPessjurSel := iIdPessjur;
   iIdPlanoprevSel := iIdPlanoprev;

   AbrirFormModal(frmSelecionaBeneficiariosPensionista, TfrmSelecionaBeneficiariosPensionista);

   If (Not bSaiuSel) And (bAlgumElegivel)
      Then Begin
         // Refazer query de beneficiario
         qryBeneficiario.Close;
         qryBeneficiario.ParamByName('IDTITULAR').AsInteger := iIdTitular;
         qryBeneficiario.ParamByName('IDPENSIONISTA').AsInteger := iIdPensionista;

         qryBeneficiario.ParamByName('IDBENEFICIO').AsInteger := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger;
         qryBeneficiario.Open;

         While Not qryBeneficiario.Eof Do
            Begin

               // EXECUTAR A REGAR DE BENEFICIARIO PARA CADA BENEFICIARIO
               If (Trim(qryBeneficio.FieldByName('IDREGRABENEFICIA').AsString) = '') Or
                  (qryBeneficio.FieldByName('IDREGRABENEFICIA').AsInteger <= 0)
                  Then bConcedeBeneficio := True
               Else Begin
                     frmAguarde.Mostra('Regra de Elegibilidade do Beneficiário  - Nº ' +
                        qryBeneficio.FieldByName('IDREGRABENEFICIA').AsString);

                     Try
                        bConcedeBeneficio := ExecutaRegraElegibilidadeBfciario(qryAux,
                           qryBeneficio.FieldByName('IDREGRABENEFICIA').AsInteger,
                           iIdPessJur,
                           iIdPlanoPrev,
                           iIdTitular,
                           qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                           iSeqProposta,
                           qryBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                           rOpcao1,
                           rOpcao2,
                           rOpcao3,
                           FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
                           FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
                           sDataDemissao,
                           bErro,
                           sMsgErro,
                           1);
                     Except
                        frmAguarde.Apaga;
                     End;
                     frmAguarde.Apaga;

                     If bErro Then
                        Begin
                           MsgDlg(sMsgErro, 'Erro', mtError, [mbOk, mbHelp], 0);
                           Exit;
                        End
                     Else Begin
                           If Not bConcedeBeneficio
                              Then Begin
                                 MsgDlg('A Regra de Elegibilidade do Beneficiário - Nº ' +
                                    qryBeneficio.FieldByName('IDREGRABENEFICIA').AsString +
                                    ' NÃO foi satisteita para ' +
                                    qryBeneficiario.FieldByName('Nome').AsString +
                                    '. Verifique. ', 'Informação', mtInformation, [mbOk, mbHelp], 0);
                                 Exit;
                              End;
                        End;
                  End;
               qryBeneficiario.Next;
            End;

         // Habilitar os componentes
         bbtnSelecionaBeneficiarios.Enabled := true;
         dtDataRequerimento.Enabled := true;
         dblkpcmbBeneficiario.Enabled := true;
         dbeMatriculaBenef.Enabled := true;
         dtInicioFund.Enabled := true;
         reValorBeneficio.Enabled := true;
         reValorSRB.Enabled := True;
         reValorTotal.Enabled := true;
         dtDataInicio.Enabled := true;
         dtDataFinal.Enabled := true;
         dblkcmbTpPgtoBenef.Enabled := False; // Peterson Victor SOL 268616 PPM 1266499
         dblkpcmbPortForma.Enabled := true;

         If (dtDataRequerimento.Enabled) And (dtDataRequerimento.visible)
            Then dtDataRequerimento.SetFocus;

         If qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC', qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
            Then Begin
               dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
               dblkcmbTpPgtoBenef.PerformSearch;
            End
         Else dblkcmbTpPgtoBenef.Text := '';
      End
   Else If Not bAlgumElegivel
      Then MsgDlg('Nenhum beneficiário foi aprovado pela regra de elegibilidade.', 'Informação', mtInformation, [mbOk, mbHelp], 0);

End;

Procedure TfrmCadRequerBenefPensionista.dblkpcmbBeneficioExit(
   Sender: TObject);
Var sDataInicio, sDataFinal, sMsgErro: String;
   bErro: boolean;
Begin
   Inherited;

   bbtnSelecionaBeneficiarios.Enabled := True;

   // Verificar se este benefício já foi requerido para algum beneficiário
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT BF.NUMEROPROCESSO, BF.DATAREQUERIMENTO, BF.IDSITBENEFICIO ' +
      ' FROM   BENEFBFCIARIO BF ' +
      ' WHERE  BF.IDTITULAR    = ' + IntToStr(iIdTitular) +
      ' AND    BF.SEQPROPOSTA  = ' + IntToStr(iSeqProposta) +
      ' AND    BF.IDPESSJUR    = ' + IntToStr(iIdPessJur) +
      ' AND    BF.IDPLANOORIGEM  = ' + IntToStr(iIdPlanoPrev) +
      ' AND    BF.IDBENEFICIO  = ' + qryBeneficio.FieldbyName('IdBeneficio').AsString +
      ' AND    BF.IDSITBENEFICIO = 4 ' +
      ' AND    BF.NUMEROPROCESSO = ' + IntToStr(iNumeroProcesso));
   qryAux.Open;
   If Not qryAux.IsEmpty
      Then Begin
         If MsgDlg('Este benefício já foi requerido em ' + qryAux.FieldByName('DataRequerimento').AsString +
            ' e está pendente de concessão. ' +
            'Verifique o processo nº ' + qryAux.FieldByName('NumeroProcesso').AsString + '. Deseja continuar ?',
            'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
            Then Begin
               qryAux.Close;
               dblkpcmbBeneficio.Text := '';
               If (dblkpcmbBeneficio.Enabled) And (dblkpcmbBeneficio.visible) Then
                  dblkpcmbBeneficio.SetFocus;
               Exit;
            End;
      End;


   //  lblNomeBenef.Caption := qryBeneficio.FieldByName('Nome').AsString;]
   lblNomeBenef.Caption := dblkpcmbBeneficio.Text;

   // Preencher qual é o beneficio de referencia
   If Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> ''
      Then iIdBenefReferencia := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
   Else iIdBenefReferencia := -1;

   // Executar regra de calculo de data de inicio e data final
   If (Trim(qryBeneficio.FieldByName('IdRegraInicio').AsString) = '') Or
      (qryBeneficio.FieldByName('IdRegraInicio').AsInteger <= 0) Then
      Begin
         frmAguarde.Mostra('Regra de Data de Início - Nº ' + qryBeneficio.FieldByName('IdRegraInicio').AsString);

         Try
            sDataInicio := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraInicio').AsInteger,
               iIdPessJur,
               iIdPlanoPrev,
               iIdTitular,
               iSeqProposta,
               iIdTitular,
               qryBeneficio.FieldByName('IdBeneficio').AsInteger,
               rOpcao1,
               rOpcao2,
               rOpcao3,
               FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
               FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
               FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
               FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),
               FormatDateTime('dd/mm/yyyy', date),
               '',
               '',
               bErro,
               sMsgErro);
         Except
            frmAguarde.Apaga;
         End;
         frmAguarde.Apaga;

         If bErro Then
            Begin
               MsgDlg(sMsgErro, 'Erro', mtError, [mbOk, mbHelp], 0);
               qryDet.FieldByName('DataInicio').AsString := '';
               dtDataInicio.Text := '';
            End
         Else
            Begin
               If Trim(sDataInicio) <> '' Then
                  Begin
                     qryDet.FieldByName('DataInicio').AsString := sDataInicio;
                     dtDataInicio.Text := sDataInicio;
                  End;
            End;
      End; //if regrainicio <> ''

   If (Trim(qryBeneficio.FieldByName('IdRegraFim').AsString) <> '') And
      (qryBeneficio.FieldByName('IdRegraFim').AsInteger > 0) Then
      Begin
         frmAguarde.Mostra('Regra de Data Final - Nº ' + qryBeneficio.FieldByName('IdRegraFim').AsString);

         Try
            sDataFinal := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraFim').AsInteger,
               iIdPessJur,
               iIdPlanoPrev,
               iIdTitular,
               iSeqProposta,
               iIdTitular,
               qryBeneficio.FieldByName('IdBeneficio').AsInteger,
               rOpcao1,
               rOpcao2,
               rOpcao3,
               FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
               FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
               FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
               FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),
               FormatDateTime('dd/mm/yyyy', date),
               '',
               '',
               bErro,
               sMsgErro
               );
         Except
            frmAguarde.Apaga;
         End;
         frmAguarde.Apaga;

         If bErro Then
            MsgDlg(sMsgErro, 'Erro', mtError, [mbOk, mbHelp], 0)
         Else
            dtDataFinal.date := StrToDate(sDataFinal);
      End; // if regrafim <> ''
   TiraSQL(qryAux);
End;

Procedure TfrmCadRequerBenefPensionista.bbtnVoltarDetClick(Sender: TObject);
Begin
   Inherited;
   lblNomeBenef.caption := 'Benefícios';
End;

Procedure TfrmCadRequerBenefPensionista.bbtnCancelarDetClick(Sender: TObject);
Begin
   Inherited;
   lblNomeBenef.caption := 'Benefícios';
End;

Procedure TfrmCadRequerBenefPensionista.sbtnAltDetClick(Sender: TObject);
Var iItem: Integer;
Begin
   If qryDet.IsEmpty Then
      Begin
         sbtnAltDet.Down := false;
         exit;
      End;

   Inherited;


   If (Not qryDet.Active) Then Exit;


   PreencheDadosBeneficiario(qryDet.FieldByName('numeroprocesso').AsInteger,
      qryDet.FieldByName('idtitular').AsInteger,
      qryDet.FieldByName('idpessoa').AsInteger,
      qryDet.FieldByName('idpessjur').AsInteger,
      qryDet.FieldByName('idplanoprev').AsInteger,
      qryDet.FieldByName('seqproposta').AsInteger);

   If qryDet.State = dsEdit
      Then Begin
         sBeneficioAnterior := IntToStr(qryDet.FieldByName('IdBeneficio').AsInteger);//Vinicius Ferreira SOL 159322 KINTANA 1308856

         If qryRelBenefPart.Locate('IdBeneficio', qryBeneficio.FieldByName('IdBeneficio').AsInteger, [loCaseInsensitive])
            Then iIdCalculo := qryRelBenefPart.FieldByName('IDCALCULO').AsInteger;

      End;
End;

Procedure TfrmCadRequerBenefPensionista.sbtnInserirClick(Sender: TObject);
Begin
   If qry.State = dsinsert Then exit;
   Inherited;
End;

Function TfrmCadRequerBenefPensionista.ConverteBeneficioParaCotas(prValorReal: real): real;
Begin
   Result := 0;
   // Verificar e beneficio é em real ou em cotas
   If (qryBeneficio.FieldByName('FLGCALCTODOMES').AsInteger = 1)
      Then Begin
         frmAguarde.Mostra('Convertendo benefício em cotas ...');

         If qryBeneficio.FieldbyName('IndiceReajBenef').AsString = ''
            Then Begin
               frmAguarde.Apaga;
               MsgDlg('O índice de conversão do valor do benefício não está cadastrado. ' +
                  'Verifique no Cadastro de Plano Previdenciário.',
                  'Informação', mtInformation, [mbOk, mbHelp], 0);
               Result := 0;
               Exit;
            End;

         // O beneficio é em cotas -> converter pelo indice
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT COTVALOR, COTDATA ' +
            ' FROM   COTACAOMOEDA      ' +
            ' WHERE  (MOECODIGO = ' + qryBeneficio.FieldbyName('IndiceReajBenef').AsString + ')' +
            ' AND    (COTDATA <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtInicioFund.Date)) + ', ''DD/MM/YYYY'') ) ' +
            ' ORDER BY COTDATA DESC ');
         qryAux.Open;
         If qryAux.IsEmpty
            Then Begin
               frmAguarde.Apaga;
               qryAux.Close;
               MsgDlg('O índice de conversão do valor do benefício não está cadastrado. ' +
                  'Verifique no Cadastro de Cotações da Moeda.',
                  'Informação', mtInformation, [mbOk, mbHelp], 0);
               Result := 0;
               Exit;
            End;

         qryAux.First;
         rValorDaCotaBenef := qryAux.FieldByName('CotValor').AsFloat;
         sDataDaCotaBenef := FormatDateTime('dd/mm/yyyy', qryAux.FieldByName('CotData').AsDateTime);

         // Converter de cota para real
         If rValorDaCotaBenef = 0
            Then Begin
               MsgDlg('O índice de conversão do valor do benefício está zerado. ' +
                  'Verifique no Cadastro de Cotações da Moeda.',
                  'Informação', mtInformation, [mbOk, mbHelp], 0);
               Result := 0;
            End
         Else Result := prValorReal / rValorDaCotaBenef;
      End
   Else Result := 0;
   frmAguarde.Apaga;
End; // ConverteBeneficioParaCotas


Function TfrmCadRequerBenefPensionista.ConverteBeneficioParaReal(prValorCotas: real): real;
Begin
   Result := 0;
   // Verificar e beneficio é em real ou em cotas
   If (qryBeneficio.FieldByName('FLGCALCTODOMES').AsInteger = 1)
      Then Begin
         frmAguarde.Mostra('Convertendo benefício para Real  ...');

         If qryBeneficio.FieldbyName('IndiceReajBenef').AsString = ''
            Then Begin
               frmAguarde.Apaga;
               MsgDlg('O índice de conversão do valor do benefício não está cadastrado. ' +
                  'Verifique no Cadastro de Plano Previdenciário.',
                  'Informação', mtInformation, [mbOk, mbHelp], 0);
               Result := 0;
               Exit;
            End;
         // O beneficio é em cotas -> converter pelo indice
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT COTVALOR, COTDATA ' +
            ' FROM   COTACAOMOEDA      ' +
            ' WHERE  (MOECODIGO = ' + qryBeneficio.FieldbyName('IndiceReajBenef').AsString + ')' +
            ' AND    (COTDATA <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtInicioFund.Date)) + ', ''DD/MM/YYYY'') ) ' +
            ' ORDER BY COTDATA DESC ');
         qryAux.Open;
         If qryAux.IsEmpty
            Then Begin
               frmAguarde.Apaga;
               qryAux.Close;
               MsgDlg('O índice de conversão do valor do benefício não está cadastrado. ' +
                  'Verifique no Cadastro de Cotações da Moeda.',
                  'Informação', mtInformation, [mbOk, mbHelp], 0);
               Result := 0;
               Exit;
            End;
         qryAux.First;

         rValorDaCotaBenef := qryAux.FieldByName('CotValor').AsFloat;
         sDataDaCotaBenef := FormatDateTime('dd/mm/yyyy', qryAux.FieldByName('CotData').AsDateTime);

         // Converter de cota para real
         If rValorDaCotaBenef = 0
            Then Begin
               MsgDlg('O índice de conversão do valor do benefício está zerado. ' +
                  'Verifique no Cadastro de Cotações da Moeda.',
                  'Informação', mtInformation, [mbOk, mbHelp], 0);
               Result := 0;
            End
         Else Result := prValorCotas * rValorDaCotaBenef;
      End
   Else Result := 0;
   frmAguarde.Apaga;
End; // ConverteBeneficioParaReal

Procedure TfrmCadRequerBenefPensionista.reValorBeneficioMouseMove(
   Sender: TObject; Shift: TShiftState; X, Y: Integer);
Begin
   Inherited;

   If Trim(dblkpcmbBeneficio.Text) = '' Then Exit;

   // Se o beneficio estiver em branco, mostrar hint dizendo para digitar ou calcular
   If (Trim(reValorBeneficio.Text) = '') Or (Trim(reValorBeneficio.Text) = '0')
      Then Begin
         If (Trim(qryBeneficio.FieldByName('IdRegraCalculo').AsString) = '')
            Then If qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
            Then reValorBeneficio.Hint := 'Digite o valor do benefício e Clique no botão à direita caso deseje convertê-lo em Cotas. '
            Else reValorBeneficio.Hint := 'Digite o valor do benefício. '
         Else reValorBeneficio.Hint := 'Clique no botão à direita para calcular o valor do benefício. ';
         Exit;
      End;

   // Se beneficio estiver em cotas, mostrar no hint o valor em real
   // se estiver em real, mostrar no hint o valor em cotas
   If qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
      Then reValorBeneficio.Hint := 'Valor em Real = ' + FloatToStr(rValorReal) +
      '. Cota Utilizada = ' + FormatFloat('#0.000000', rValorDaCotaBenef) +
         ' em ' + sDataDaCotaBenef + '.'
   Else reValorBeneficio.Hint := 'Clique no botão à direita para calcular o valor do benefício. ';

End;

Procedure TfrmCadRequerBenefPensionista.reValorBeneficioExit(Sender: TObject);
Begin
   Inherited;
   If (Trim(reValorBeneficio.Text) <> '') And (Trim(reValorBeneficio.Text) <> '0')
      Then rValorReal := StrToFloat(ClienteNumero(reValorBeneficio.Text))
   Else rValorReal := 0;
End;

Procedure TfrmCadRequerBenefPensionista.FormActivate(Sender: TObject);
Begin

   If bAbriuOutroForm
      Then Begin

      End;
   Inherited;
End;

Procedure TfrmCadRequerBenefPensionista.reValorTotalBtnClick(Sender: TObject);
Var rValorBeneficio,
   rValorReserva: double;
   bErro: boolean;
   sSQLBenefAssoc,
      sMsgErro: String;
   iIdRegraCalculo: longint;
Begin
   Inherited;
   // Calcular valor total do beneficio
   If Trim(dblkpcmbBeneficio.Text) = ''
      Then Begin
         MsgDlg('Preencha o Benefício.', 'Erro', mtError, [mbOk, mbHelp], 0);
         If (dblkpcmbBeneficio.Enabled) And (dblkpcmbBeneficio.visible) Then
            dblkpcmbBeneficio.SetFocus;
         Exit;
      End;

   If (Trim(qryBeneficio.FieldByName('IdRgValorTotal').AsString) = '') Or
      (qryBeneficio.FieldByName('IdRgValorTotal').AsInteger <= 0)
      Then Exit;

   If sTipoFormChamador = 'SI'
      Then If qryBeneficio.FieldByName('IdRegraSimula').AsInteger <= 0
      Then Exit
      Else iIdRegraCalculo := qryBeneficio.FieldByName('IdRegraSimula').AsInteger
   Else iIdRegraCalculo := qryBeneficio.FieldByName('IdRgValorTotal').AsInteger;

   frmAguarde.Mostra('Regra de Cálculo do Total - Nº ' + IntToStr(iIdRegraCalculo));

   // Executar regra de calculo da reserva para beneficio passando a query ReservaPart
   // que está com o valor abatido da reserva
   rValorReserva := CalculaReservaParaBeneficio;
   sValorReserva := FloatToStr(rValorReserva);
   sSQLBenefAssoc := MontaSQLBenefAssoc(qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

   // //SOL 136385/7362 Kintana 1527997
   // Verifica evento de falecimento
   if iIdEventoAux = -1 then  // -1 veio da tela de registro de falecimento deve passar zero
      iIdEventoAux := 0
   else
      iIdEventoAux := qryBeneficio.FieldByName('IDEVENTOGERADOR').AsInteger;
   // //SOL 136385/7362 Kintana 1527997


   // Executar regra de calculo do beneficio
   Try
      rValorBeneficio := ExecutaRegraValorTotal(qryAux,
         iIdRegraCalculo,
         iIdPessJur,
         iIdPlanoPrevTit, // passando o idplano do titular, pela forma de consulta  da função que faz join com a partprevplan
         iIdTitular,
         iSeqProposta,
         iNumeroProcesso,
         qryBeneficio.FieldByName('IdBeneficio').AsInteger,
         iNumBenef,
         rOpcao1,
         rOpcao2,
         rOpcao3,
         sSQLBenefAssoc,
         FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
         FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
         '',
         '0',
         '0',
         FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
         sValorReserva,
         qryDet.FieldByName('VALORBINSSANT1').AsString,
         qryDet.FieldByName('VALORBINSSANT2').AsString,
         qryDet.FieldByName('VALORBINSSANT3').AsString,
         bErro,
         sMsgErro,
         iIdCalculo,
         1,
         qryDet.FieldByName('DibBenefAnt').AsString,
         qryDet.FieldByName('ValorBenefAnt').AsString,
         StrToFloat(ClienteNumero(reValorSRB.Text)),
         iIdPensionista,
         iIdPessoa,

         0,
         0,
         0,
         '',
         '',
         -1,
         iIdEventoAux //SOL 136385/7362 Kintana 1527997
         );
   Except
      frmAguarde.Apaga;
   End;
   frmAguarde.Apaga;

   If bErro
      Then Begin
         MsgDlg(sMsgErro, 'Erro', mtError, [mbOk, mbHelp], 0);
         reValorTotal.Text := '0';
         Exit;
      End;

   // So formatar se o valor nao for em cota
   If qryBeneficio.FieldbyName('FlgCalcTodoMes').AsInteger = 0 Then
      reValorTotal.Text := FormatFloat('#0.00', rValorBeneficio)
   Else
      reValorTotal.Text := FormatFloat('#0.000000', rValorBeneficio)
End;

Procedure TfrmCadRequerBenefPensionista.reValorTotalExit(Sender: TObject);
Begin
   Inherited;
   sValorTotal := OraNumero(Trim(reValorTotal.Text));

   If qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
      Then rValorCotas := StrToFloat(ClienteNumero(sValorTotal))
   Else rValorCotas := 0;
End;

Procedure TfrmCadRequerBenefPensionista.dbrgrpBenefProvisorioClick(
   Sender: TObject);
Begin
   Inherited;
   If dbrgrpBenefProvisorio.ItemIndex = 0
      Then Begin
         lblPercConc.Visible := False;
         dbedPercConc.Visible := False;
         lblPercent.Visible := False;
         lblPrazoProv.Visible := False;
         dbedPrazoProv.Visible := False;
         lblMesProv.Visible := False;
      End
   Else Begin
         lblPercConc.Visible := True;
         dbedPercConc.Visible := True;
         lblPercent.Visible := True;
         lblPrazoProv.Visible := True;
         dbedPrazoProv.Visible := True;
         lblMesProv.Visible := True;
         If (dsDet.DataSet.State = dsInsert) And (Trim(dbedPrazoProv.Text) = '')
            Then Begin
               dbedPrazoProv.Text := qryBeneficio.FieldByName('PrazoProvisorio').AsString;
               qryDet.FieldByName('PrazoProvisorio').AsInteger := qryBeneficio.FieldByName('PrazoProvisorio').AsInteger;
            End;
      End;

End;

Procedure TfrmCadRequerBenefPensionista.dbedPrazoProvExit(Sender: TObject);
Var sDataFinal: String;
   iPrazoEmMeses: integer;
Begin
   Inherited;
   If Trim(dbedPrazoProv.Text) = '' Then Exit;

   // Calcular data final do beneficio
   Try
      iPrazoEmMeses := StrToInt(dbedPrazoProv.Text);
   Except
      MsgDlg('Prazo Máximo de Concessão inválido.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
      Exit;
   End;
   sDataFinal := CalculaDataAposPrazo(FormatDateTime('dd/mm/yyyy', dtDataInicio.Date), iPrazoEmMeses);

   If (Trim(dtDataFinal.Text) <> '') And
      (FormatDateTime('dd/mm/yyyy', dtDataFinal.Date) <> sDataFinal)
      Then Begin
         If MsgDlg('A data final informada até o momento não coincide com o prazo informado : ' +
            ' [Data Informada - ' + FormatDateTime('dd/mm/yyyy', dtDataFinal.Date) + ' e  ' +
            ' Data após Prazo - ' + sDataFinal + ']. ' +
            ' Confirma o Prazo ? ', 'Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrNo
            Then Begin
               dbedPrazoProv.Text := '';
               dbedPrazoProv.SetFocus;
               Exit;
            End
         Else If Trim(sDataFinal) <> ''
            Then dtDataFinal.Date := StrToDate(sDataFinal);
      End
   Else If Trim(sDataFinal) <> ''
      Then dtDataFinal.Date := StrToDate(sDataFinal);

End;

Function TfrmCadRequerBenefPensionista.ConfirmaBeneficio: boolean;
Begin
   Result := False;

   // edilaine - SOL 262968 / PPM 1102753 - inicio
   {MostraDemonstrativoConcessao;  }

   sParametrosDemonstra := '';
   GeraDemonstrativo();
   // edilaine - SOL 262968 / PPM 1102753 - fim


   //Higor Nayde SOL - 173938 KINTANA - 1627112   Inicio
   If MsgDlg('Deseja confirmar os resultados da concessão ?', 'Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrNo
      Then Result := False
   else begin

////Douglas.Siqueira SOL=163064 Kintana= 1388980
  if (sbtnInserir.Enabled=FALSE )and (bConcedeuBeneficio) then
//  if (sbtnConceder.Enabled )and (bConcedeuBeneficio) then
     begin
     Qrydet.First;
     while not Qrydet.Eof do
        begin
           if (Qrydet.FieldByName('IdTpPagtoBenefic').AsInteger = 1) and (Qrydet.FieldByName('FONTEPAGADORA').AsInteger = 1) then //FUNCEF
           begin
              if (qryDet.FieldByName('IdSitBeneficio').AsInteger<>1) and (qrydet.FieldbyName('datafinal').Asstring = '')  // SOL 201131 Kintana 1944161
              then    begin
                 MsgDlg('Situação(ões) do(s) benefício(s) inconsistente(s) ','Informação',mtInformation,[mbOk],0);

                 if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
                    dtmBaseDados.dbBaseDados.RollBack;

                    bbtnCancelarClick(Self);
           //      TiraSQL(qryAux);
                 Exit;
              end;
           end
           else
           if (Qrydet.FieldByName('IdTpPagtoBenefic').AsInteger = 1) and (Qrydet.FieldByName('FONTEPAGADORA').AsInteger = 2) then //INSS
           begin
              if QryDet.FieldByName('FLGPAGAINSS').AsInteger = 1 then
              begin
                 if (qryDet.FieldByName('IdSitBeneficio').AsInteger<>1) and (qrydet.FieldbyName('datafinal').Asstring = '')  //SOL 201131 Kintana 1944161
                 then  begin
                    MsgDlg('Situação(ões) do(s) benefício(s) inconsistente(s) ','Informação',mtInformation,[mbOk],0);

                 if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
                    dtmBaseDados.dbBaseDados.RollBack;

                    bbtnCancelarClick(Self);

             //       TiraSQL(qryAux);
                    Exit;
                 end;
              end
              else
              begin
                 if (qryDet.FieldByName('IdSitBeneficio').AsInteger<>2) {or (qry.FieldbyName('IdSitProcesso').AsInteger<>2)} // SOL 201131 Kintana 1944161
                 then   begin
                    MsgDlg('Situação(ões) do(s) benefício(s) inconsistente(s) ','Informação',mtInformation,[mbOk],0);


                 if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
                    dtmBaseDados.dbBaseDados.RollBack;

                    bbtnCancelarClick(Self);
                    Exit;
                  end;
              end;
           end
           else
           if Qrydet.FieldByName('IdTpPagtoBenefic').AsInteger = 2 then ///Pag único
           begin
              if (Qrydet.RecordCount=1) then
                 begin
                 if (QryDet.FieldByName('IdSitBeneficio').AsInteger<>3)
                   and (QryDet.FieldbyName('resgateparcelado').AsInteger<>1)   // SOL 209659 Kintana 2022632
                   then begin
                    MsgDlg('Situação(ões) do(s) benefício(s) inconsistente(s) ','Informação',mtInformation,[mbOk],0);

                 if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
                    dtmBaseDados.dbBaseDados.RollBack;

                    bbtnCancelarClick(Self);

               //     TiraSQL(qryAux);
                    Exit;
                    end
                 end
              else
              if (qryDet.FieldByName('IdSitBeneficio').AsInteger<>3) then
              begin
                 MsgDlg('Situação(ões) do(s) benefício(s) inconsistente(s) ','Informação',mtInformation,[mbOk],0);

                 if dtmBaseDados.dbBaseDados.InTransaction then      //Jéssica Lana SOL 119077
                    dtmBaseDados.dbBaseDados.RollBack;

                 bbtnCancelarClick(Self);                    
                    
               //  TiraSQL(qryAux);
                 Exit;
              end;
           end;

        Qrydet.next;
        end;/// fim do while

     end;
////fim.Douglas.Siqueira SOL=163064 Kintana= 1388980

        //MostraDemonstrativoConcessao(True,formatdatetime ('hh:mm:ss',now));     // edilaine - SOL 262968 / PPM 1102753 - comentado
        Result := True;
   end;
   //Higor Nayde SOL - 173938 KINTANA - 1627112 FIM

End; // ConfirmaBeneficio

Procedure TfrmCadRequerBenefPensionista.MostraDemonstrativoConcessao(const homologado :Boolean; const HoraHomologacao: String);//Higor Nayde SOL - 173938 KINTANA - 1627112
Var sFormato, sAnoMesAtual, sRecebedorAtual: String;
   iIdRecebedorAtual: longint;
   dValorIntegralNaDib,
      dValorTotalNaDib: double;
   sPlano : String; //Renato Visoni SOL 146984/3021 Kintana 1031393
Begin
   frmAguarde.Mostra('Preparando o Demonstrativo da Concessão...');

   If Not qryTitular.Active
      Then Begin
         qryTitular.Close;
         qryTitular.ParamByName('IdPessoa').Value := iIdTitular;
         qryTitular.ParamByName('IdPessJur').Value := iIdPessJur;
         qryTitular.ParamByName('IdPlanoPrev').Value := iIdPlanoPrev;
         qryTitular.ParamByName('SeqProposta').Value := iSeqProposta;
         qryTitular.Open;
      End;

   qryAux.Close;

   If frmMostraAux = Nil Then
      Application.CreateForm(TfrmMostraAux, frmMostraAux);

   frmMostraAux.Caption := 'Resumo da Concessão de Benefício ... ';

   // Exibir dados do participante
   With frmMostraAux.memResult.Lines Do
      Begin
         Clear;
         Add('------------------------------------------------------------------------------------------------------');
         Add('                                DEMONSTRATIVO DE CONCESSÃO               - VERSÃO : ' + Sistema.Versao);
         Add('                                                                           LOTE   : ' + IntToStr(iIdLoteConcessao));

         Add('USUÁRIO : ' + Sistema.NomeUsuario + '                               DATA DA CONCESSÃO : ' + FormatDateTime('dd/mm/yyyy', Date));
         Add('------------------------------------------------------------------------------------------------------');
         Add('Participante : ' + qryTitular.FieldByName('Nome').AsString);
         Add(' ');
         Add('Data de Nascimento  : ' + qryTitular.FieldByName('DataNasc').AsString);
         Add('Data do Falecimento : ' + qryTitular.FieldByName('DataMorte').AsString);

         Add('------------------------------------------------------------------------------------------------------');

         Add(PreparaStr('Patrocinadora  : ' + qryTitular.FieldByName('NomePatro').AsString, 50) +
            PreparaStr('Matrícula : ' + qryTitular.FieldByName('Matricula').AsString, 49));

         Add(PreparaStr('Plano Previdenciário : ' + qryTitular.FieldByName('NomePlano').AsString, 50) +
            PreparaStr('Data de Admissão : ' + qryTitular.FieldByName('DataAdmissao').AsString, 49));

         Add(PreparaStr('Número de Inscrição  : ' + qryTitular.FieldByName('InscricaoNumero').AsString, 50) +
            PreparaStr('Data de Demissão : ' + qryTitular.FieldByName('DataDemissao').AsString, 49));

         Add(PreparaStr('Data de Inscrição    : ' + qryTitular.FieldByName('InscricaoData').AsString, 50) +
            PreparaStr('Tempo Serv. Total : ' + qryTitular.FieldByName('TempoServTotal').AsString + ' anos ' +
            qryTitular.FieldByName('TempoServTotMes').AsString + ' meses ' +
            qryTitular.FieldByName('TempoServTotDia').AsString + ' dias ', 49));


         Add('------------------------------------------------------------------------------------------------------');
         Add('PROCESSO Nº : ' + qry.FieldbyName('NumeroProcesso').AsString);
         Add('PENSIONISTA : ' + Trim(dblkpcmbPensionista.Text) + ' - DATA : ' + FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date));
         Add('------------------------------------------------------------------------------------------------------');
         Add('=> BENEFÍCIOS CONCEDIDOS :');


         qryTotalRecebedor.Close;
         qryTotalRecebedor.ParamByName('IdPessoa').AsInteger := -1;
         qryTotalRecebedor.Open;

         qryDet.First;
         While Not qryDet.Eof Do
            Begin
               Add('------------------------------------------------------------------------------------------------------');
               Add('     => ' + qryDet.FieldByName('Nome').AsString + ' para ' + qryDet.FieldByName('Depen').AsString);

               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(' SELECT NOME FROM PESSOA WHERE IDPESSOA = ' + IntToStr(qryDet.FieldByName('IdResponsavel').AsInteger));
               qryAux.Open;

               If qryAux.FieldByName('NOME').AsString = ''
                  Then Begin
                     qryAux.Close;
                     qryAux.SQL.Clear;
                     qryAux.SQL.Add(' SELECT NOME FROM PESSOA WHERE IDPESSOA = ' + IntToStr(qryDet.FieldByName('IdPessoa').AsInteger));
                     qryAux.Open;
                  End;
               Add('        Recebedor : ' + qryAux.FieldByName('Nome').AsString);

               If qryTotalRecebedor.Locate('IdPessoa', qryDet.FieldByName('IdResponsavel').AsInteger, [])
                  Then Begin
                     qryTotalRecebedor.Edit;
                     qryTotalRecebedor.FieldByName('Total').AsFloat := qryTotalRecebedor.FieldByName('Total').AsFloat + qryDet.FieldByName('VALORATUAL').AsFloat;
                     qryTotalRecebedor.Post;
                  End
               Else Begin
                     qryTotalRecebedor.Insert;
                     qryTotalRecebedor.FieldByName('IdPessoa').AsInteger := qryDet.FieldByName('IdResponsavel').AsInteger;
                     qryTotalRecebedor.FieldByName('Nome').AsString := qryAux.FieldByName('Nome').AsString;
                     qryTotalRecebedor.FieldByName('Total').AsFloat := qryDet.FieldByName('VALORATUAL').AsFloat;
                     qryTotalRecebedor.Post;
                  End;

               Add(' ');

               Add('        ' + PreparaStr('Data de Requerimento : ' + qryDet.FieldByName('DataRequerimento').AsString, 50) +
                  PreparaStr('Data de Concessão : ' + FormatDateTime('dd/mm/yyyy', Date), 49));

               Add('        ' + PreparaStr('Data de Início na Fundação : ' + qryDet.FieldByName('DataInicioFUND').AsString, 50));


               dValorIntegralNaDib := PegaValorIntegral(dtmAPrev.qry,
                  iNumeroProcesso,
                  qryDet.FieldByName('IDBENEFICIO').AsInteger,
                  qryDet.FieldByName('IDPESSOA').AsInteger,
                  qryDet.FieldByName('DATAINICIOFUND').AsString);
               dValorTotalNaDib := PegaValorTotal(dtmAPrev.qry,
                  iNumeroProcesso,
                  qryDet.FieldByName('IDBENEFICIO').AsInteger,
                  qryDet.FieldByName('IDPESSOA').AsInteger,
                  qryDet.FieldByName('DATAINICIOFUND').AsString);
               Add('        ' + PreparaStr('Valor Total do Benefício = R$ ' + FormatFloat('#0.00', dValorTotalNaDib), 50));
               Add('        ' + PreparaStr('Valor Rateado do Benefício = R$ ' + FormatFloat('#0.00', dValorIntegralNaDib), 50));

               Add('------------------------------------------------------------------------------------------------------');
               qryDet.Next;
            End; // while not qryDet.Eof

         // Mostrar mês a mês quanto será pago e quanto será descontado
         Add('------------------------------------------------------------------------------------------------------');
         Add('=> BENEFÍCIOS A PAGAR                                                                                 ');
         Add('------------------------------------------------------------------------------------------------------');
         Add(' ');


         // Buscar BENEFICIOS a pagar no mês
         With qryAux Do
            Begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT DECODE(P.NOME , NULL, BENEF.NOME, P.NOME) AS RECEBEDOR, BP.FLGCALCTODOMES,                      ' +
                  '        DECODE(P.NOME,  NULL, PFBENEF.FLGISENTOIRRF, PF.FLGISENTOIRRF) AS FLGISENTOIRRF,                ' +
                  '        DECODE(BTIT.IDRESPONSAVEL, NULL, BTIT.IDPESSOA, BTIT.IDRESPONSAVEL) AS IDRESPONSAVEL,           ' +
                  '        DECODE(BP.FLGREFERENCIA, 1, 0, H.VALORSRB) AS VALORSRB,                                         ' +
                  '        B.NOME, H.MESREFERENCIA, H.FLGDEVOLUCAO,  H.VALORPREV , H.VALORINTEGRAL,                        ' +
                  '        BP.FLGREFERENCIA, BF.DATAINICIOFUND                                                             ' +

                 //Renato Visoni SOL 146984/3021 Kintana 1031393
                 ' ,(SELECT BF.IDPLANPREVCONTAB ' +
                 ' FROM BENEFBFCIARIO BF       ' +
                 ' WHERE BF.IDPLANOPREV    = H.IDPLANOPREV ' +
                 '  AND BF.IDBENEFICIO    = H.IDBENEFICIO  ' +
                 '  AND BF.NUMEROPROCESSO = H.NUMEROPROCESSO  ' +
                 '  AND BF.IDPESSJUR      = H.IDPESSJUR       ' +
                 '  AND BF.IDTITULAR      = H.IDTITULAR       ' +
                 '  AND BF.IDPLANOORIGEM  = H.IDPLANOORIGEM   ' +
                 '  AND BF.IDPESSOA       = H.IDPESSOA        ' +
                 '  AND BF.SEQPROPOSTA    = H.SEQPROPOSTA     ' +
                 '  AND ROWNUM = 1) AS CODIGO                 ' +
                 //Renato Visoni SOL 146984/3021 Kintana 1031393

                  ' FROM   PESSOA BENEF, PESSOA P, PESSOAFISICA PFBENEF, PESSOAFISICA PF, BENEFICIO B, BENEFPLANPREV BP,   ' +
                  '        BFCIARIOTITPLAN BTIT, HSTBENEFBFCIARIO H, BENEFBFCIARIO BF ' +
                  ' WHERE  H.IDLOTE           = ' + IntToStr(iIdLoteConcessao) +
                  ' AND    H.IDPESSJUR        = ' + IntToStr(iIdPessJur) +
                  ' AND    H.IDPLANOPREV      = ' + IntToStr(iIdPlanoPrev) +
                  ' AND    H.IDTITULAR        = ' + IntToStr(iIdTitular) +
                  ' AND    H.SEQPROPOSTA      = 1                                ' +
                  ' AND    H.IDMOTIVO         <> ' + IntToStr(prmIdMotDevolNaoIden) +
                  ' AND    B.IDBENEFICIO      = H.IDBENEFICIO                    ' +
                  ' AND    BF.NUMEROPROCESSO  = H .NUMEROPROCESSO                ' +
                  ' AND    BF.IDPLANOORIGEM   = H.IDPLANOORIGEM                  ' +
                  ' AND    BF.IDPLANOPREV     = H.IDPLANOPREV                    ' +
                  ' AND    BF.IDPESSJUR       = H.IDPESSJUR                      ' +
                  ' AND    BF.IDTITULAR       = H.IDTITULAR                      ' +
                  ' AND    BF.IDPESSOA        = H.IDPESSOA                       ' +
                  ' AND    BF.SEQPROPOSTA     = H.SEQPROPOSTA                    ' +
                  ' AND    BF.IDBENEFICIO     = H.IDBENEFICIO                    ' +
                  ' AND    BTIT.IDPESSJUR     = BF.IDPESSJUR                     ' +
                  ' AND    BTIT.IDPLANOPREV   = BF.IDPLANOPREV                   ' +
                  ' AND    BTIT.IDPLANOORIGEM = BF.IDPLANOORIGEM                 ' +
                  ' AND    BTIT.IDTITULAR     = BF.IDTITULAR                     ' +
                  ' AND    BTIT.SEQPROPOSTA   = BF.SEQPROPOSTA                   ' +
                  ' AND    BTIT.IDPESSOA      = BF.IDPESSOA                      ' +
                  ' AND    BTIT.IDBENEFICIO   = BF.IDBENEFICIO                   ' +
                  ' AND    BENEF.IDPESSOA     = BTIT.IDPESSOA                    ' +
                  ' AND    PFBENEF.IDPESSOA   = BTIT.IDPESSOA                    ' +
                  ' AND    P.IDPESSOA(+)      = BTIT.IDRESPONSAVEL               ' +
                  ' AND    PF.IDPESSOA(+)     = BTIT.IDRESPONSAVEL               ' +
                  ' AND    BP.IDPLANOPREV     = H.IDPLANOPREV                    ' +
                  ' AND    BP.IDBENEFICIO     = H.IDBENEFICIO                    ' +
                  ' ORDER BY BTIT.IDRESPONSAVEL, H.FLGDEVOLUCAO, BENEF.NOME, B.NOME, H.MESREFERENCIA ');
               Open;
               First;

               If FieldByName('FLGCALCTODOMES').AsInteger = 0 Then
                  sFormato := '#0.00'
               Else
                  sFormato := '#0.0000';

               sRecebedorAtual := '';
               iIdRecebedorAtual := -1;

               While (Not Eof) Do
                  Begin
                     sRecebedorAtual := FieldByName('RECEBEDOR').AsString;
                     iIdRecebedorAtual := FieldByName('IDRESPONSAVEL').AsInteger;

                     If FieldByName('FLGISENTOIRRF').AsInteger = 0 Then
                        Add(PreparaStr(' - RECEBEDOR : ' + sRecebedorAtual, 50) +
                           PreparaStr('Isento de Imposto de Renda : Não ', 49))
                     Else
                        Add(PreparaStr(' - RECEBEDOR : ' + sRecebedorAtual, 50) +
                           PreparaStr('Isento de Imposto de Renda : Sim ', 49));

                    Add('MÊS     ITEM                                PAGAR      DESCONTAR [INTEGRAL]  SRB  PLANO CONTAB');//Renato Visoni SOL 146984/3021 Kintana 1031393

                     sPlano := ''; //Renato Visoni SOL 146984/3021 Kintana 1031393
                     // Mostrar os beneficios deste recebedor
                     While (Not Eof) And (sRecebedorAtual = FieldByName('RECEBEDOR').AsString) Do
                        Begin
                           If FieldByName('FLGDEVOLUCAO').AsInteger = 0 Then
                                      Add(PreparaStr(FieldByName('MesReferencia').AsString, 8) +
                                 PreparaStr(FieldByName('Nome').AsString, 34) +
                                 ' '+PreparaStr('(+)' + FormatFloat(sFormato, FieldByName('ValorPrev').AsFloat), 12) +
                                 PreparaStr('(-)' + FormatFloat(sFormato, 0), 10) +
                                 PreparaStr('(+)' + FormatFloat(sFormato, FieldByName('ValorIntegral').AsFloat), 11) +
                                 PreparaStr(' ' + FormatFloat(sFormato, FieldByName('VALORSRB').AsFloat), 11)+
                                 PreparaStr(FieldByName('CODIGO').AsString                               ,10))//Renato Visoni SOL 146984/3021 Kintana 1031393
                           Else
                              Add(PreparaStr(FieldByName('MesReferencia').AsString, 8) +
                                 PreparaStr(FieldByName('Nome').AsString, 34) +
                                 PreparaStr('(+)' + FormatFloat(sFormato, 0), 12) +
                                 PreparaStr('(-)' + FormatFloat(sFormato, FieldByName('ValorPrev').AsFloat), 10) +
                                 PreparaStr('(-)' + FormatFloat(sFormato, 0), 11) +
                                 PreparaStr(' ' + FormatFloat(sFormato, FieldByName('VALORSRB').AsFloat), 11)+
                                 PreparaStr(FieldByName('CODIGO').AsString                               ,10));//Renato Visoni SOL 146984/3021 Kintana 1031393

                           //Renato Visoni SOL 146984/3021 Kintana 1031393
                           if sPlano = '' then begin
                             sPlano := FieldByName('CODIGO').AsString;
                           end else begin
                             sPlano := sPlano+','+FieldByName('CODIGO').AsString;
                           end;
                           //Renato Visoni SOL 146984/3021 Kintana 1031393

                     Next;
                        End; // while 2
                  End; // while 1
            End;

            // SOL 132938
            Add('----------------------------------------------------------------------------------------------');
            Add('=> VALORES DE ATUALIZAÇÃO MONETÁRIA                                                           ');

            Add('----------------------------------------------------------------------------------------------');
            Add(sVlrATualMonBeneficio);
            Add(' ');
            Add(sVlrATualMonContrib);
            Add(' ');
            // SOL 132938

         // Mostrar acertos de tratamento pos-morte
         Add('------------------------------------------------------------------------------------------------------');
         Add('=> ACERTOS DE BENEFÍCIOS DO TITULAR                                                                   ');
         Add('------------------------------------------------------------------------------------------------------');
         Add(' ');

         // Buscar ACERTOS
         With qryAux Do
            Begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT P.NOME  AS RECEBEDOR, T.IDPESSOA AS IDRESPONSAVEL,                        ' +
                  '        DECODE(PV.DESCRPROVDESC, NULL, PV.DESCRICAO, PV.DESCRPROVDESC) AS NOME,   ' +
                  '        T.MESREFERENCIA,                                                          ' +
                  '        T.FLGDESCONTO,  SUM(T.VALOR) AS VALORPREV                                 ' +
                  ' FROM   PESSOA P, TMPDESC T, PROVDESC PV                                          ' +
                  ' WHERE  T.IDLOTE           = ' + IntToStr(iIdLoteConcessao) +
                  ' AND    T.IDPESSJUR        = ' + IntToStr(iIdPessJur) +
                  ' AND    T.IDPLANOPREV      = ' + IntToStr(iIdPlanoPrev) +
                  ' AND    T.IDTITULAR        = ' + IntToStr(iIdTitular) +
                  ' AND    T.IDPESSOA         <> T.IDTITULAR                                          ' +
                  ' AND    T.SEQPROPOSTA      = 1                                                     ' +
                  ' AND    PV.IDPROVENTO      = T.IDPROVENTO                                          ' +
                  ' AND    P.IDPESSOA         = T.IDPESSOA                                            ' +
                  ' GROUP BY P.NOME  , T.IDPESSOA , ' +
                  '        DECODE(PV.DESCRPROVDESC, NULL, PV.DESCRICAO, PV.DESCRPROVDESC), ' +
                  '        T.MESREFERENCIA, T.FLGDESCONTO ' +
                  ' ORDER BY T.IDPESSOA,  T.MESREFERENCIA, DECODE(PV.DESCRPROVDESC, NULL, PV.DESCRICAO, PV.DESCRPROVDESC) ');
               Open;

               While (Not Eof) Do
                  Begin
                     sRecebedorAtual := FieldByName('RECEBEDOR').AsString;
                     iIdRecebedorAtual := FieldByName('IDRESPONSAVEL').AsInteger;

                     Add(' - RECEBEDOR : ' + sRecebedorAtual);
                     Add('   MÊS      ITEM                                    PAGAR          DESCONTAR      ');
                     // Mostrar os beneficios deste recebedor
                     While (Not Eof) And (sRecebedorAtual = FieldByName('RECEBEDOR').AsString) Do
                        Begin
                           If FieldByName('FLGDESCONTO').AsInteger = 0
                              Then Add('   ' +
                                 PreparaStr(FieldByName('MesReferencia').AsString, 9) +
                                 PreparaStr(FieldByName('Nome').AsString, 40) +
                                 PreparaStr('(+)' + FormatFloat(sFormato, FieldByName('ValorPrev').AsFloat), 15) +
                                 PreparaStr('(-)' + FormatFloat(sFormato, 0), 15))
                           Else Add('   ' +
                                 PreparaStr(FieldByName('MesReferencia').AsString, 9) +
                                 PreparaStr(FieldByName('Nome').AsString, 40) +
                                 PreparaStr('(+)' + FormatFloat(sFormato, 0), 15) +
                                 PreparaStr('(-)' + FormatFloat(sFormato, FieldByName('ValorPrev').AsFloat), 15));
                           Next;
                        End; // while 2
                  End; // while 1
            End;

          //Renato Visoni SOL 146984/3021 Kintana 1031393
          Add('----------------------------------------------------------------------------------------------');
          Add('Legenda Plano Contábil                                                                        ');
          Add('Código    Descrição                                                                           ');
          if sPlano <> '' then begin
            with qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT IDPLANOPREV AS CODIGO, NOME AS PLANO FROM PLANPREVCONTABIL');
               SQL.Add(' WHERE IDPLANOPREV IN ('+sPlano+')                  ');
               Open;

               while not Eof do
               begin
                  Add( PreparaStr(FieldByName('codigo').AsString                                ,10) +
                       PreparaStr(FieldByName('Plano').AsString                                 ,40));
                  Next;
               end;
            end;
          end;
          //Renato Visoni SOL 146984/3021 Kintana 1031393

        //Higor Nayde SOL - 173938 KINTANA - 1627112   Inicio
        if(not homologado)then
         begin
            Add('----------------------------------------------------------------------------------------------');
            Add('                         BENEFÍCIO NÃO HOMOLOGADO - APENAS PARA CONFERÊNCIA ');
            Add('----------------------------------------------------------------------------------------------');
         end
        else
         begin
            Add('----------------------------------------------------------------------------------------------');
            Add('                           BENEFÍCIO HOMOLOGADO - '+HoraHomologacao);
            Add('----------------------------------------------------------------------------------------------');
         end;
          {
         Add('------------------------------------------------------------------------------------------------------');
         Add('                                             APENAS PARA CONFERÊNCIA ');
         Add('------------------------------------------------------------------------------------------------------');
         }
         //Higor Nayde SOL - 173938 KINTANA - 1627112 FIM
      End; // with

   frmAguarde.Apaga;
   frmMostraAux.ShowModal;
End; // MostraDemonstrativoConcessao



Procedure TfrmCadRequerBenefPensionista.dbrgrpBenefProvisorioEnter(
   Sender: TObject);
Begin
   Inherited;
   iProvisorioAntes := dbrgrpBenefProvisorio.ItemIndex;

End;

Procedure TfrmCadRequerBenefPensionista.dbrgrpBenefProvisorioExit(
   Sender: TObject);
Begin
   Inherited;
   iProvisorioAntes := dbrgrpBenefProvisorio.ItemIndex;

   If iProvisorioAntes <> dbrgrpBenefProvisorio.ItemIndex
      Then bRecalculouProvisorio := False;
End;

Function TfrmCadRequerBenefPensionista.EfetuaConcessao(iIdSitEscolhida: word;
   Var rValorAtualizado,
   rValorAtualizadoTotal,
   rValorAtualizadoINSS,
   rValorAtualizadoTotalINSS: double;
   Var sUltMesReajuste,
   sUltMesReajusteINSS: String;
   Var bErro: boolean): word;
Var
   bPreparoOK,
      bFlgIntContab: boolean;
   sDataReserva,
      sMsgErro: String;
   dSaldoCotas: double;

   varfields: variant;

   sDataInicioINSS: String;
Begin
   Result := iIdSitEscolhida;

   If iIdLoteConcessao <= 0
      Then Begin
         iIdLoteConcessao := SelecionaLoteBeneficioAberto(sAnoMesLoteConcessao,

            iFlgIncluiMesConc);
         If iIdLoteConcessao <= 0
            Then Begin
               bErro := True;
               MsgDlg('Nenhum lote selecinado para efetuar a concessão. Verifique. ', 'Erro', mtError, [mbOk, mbHelp], 0);
               TiraSQL(qryAux);
               Result := 4;
               Exit;
            End;
      End;


   With qryAux Do
      Begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT DATAPAGAMENTO');
         SQL.Add('FROM CTRLINTERFACE');
         SQL.Add('WHERE IDLOTE = ' + IntToStr(iIdLoteConcessao));
         Open;

         If Not (IsEmpty) And (FieldByName('DATAPAGAMENTO').AsDateTime < dtInicioFund.Date) Then
            Begin
               bErro := True;
               MsgDlg('Atenção!!' + #13 + #13 +
                  'O lote escolhido possui uma data de pagamento (' + qryAux.FieldByName('DATAPAGAMENTO').AsString + ')' + #13 +
                  'anterior a data de inicio de beneficio - DIB (' + dtInicioFund.Text + ').' + #13 + #13 +
                  'Favor escolher outro lote.', 'Lote com data anterior', mtError, [mbOk, mbHelp], 0);
               Exit;
            End;
      End;

   If Not qryAux.IsEmpty
      Then sDataPagamentoConcessao := FormatDateTime('dd/mm/yyyy', qryAux.FieldByName('DATAPAGAMENTO').AsDateTime)
   Else sDataPagamentoConcessao := CriticaDataCobrancaSit(qryAux,
         IntToStr(iIdFundacao),
         '',
         'AS',
         'P',
         FormatDateTime('mm', date),
         FormatDateTime('yyyy', date),
         );

   // Preparar beneficio gravando-o no Historico de Beneficios
   If Not dtmBaseDados.dbBaseDados.InTransaction
      Then dtmBaseDados.dbBaseDados.StartTransaction;

   // Testar quitacao de dividas
   // Se, por algum motivo, o usuario disser que nao quer conceder,
   // manter a situacao = 4
   TestaQuitacaoDividas;

   // Calcular INSS antes da suplementacao pois no calculo da suplementacao é
   // necessário o valor do inss

   // Preencher qual é o beneficio de referencia
   If Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> ''
      Then iIdBenefReferencia := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
   Else iIdBenefReferencia := -1;

   varFields := VarArrayCreate([0, 1], varVariant);
   varFields[0] := iIdBenefReferencia;
   varFields[1] := qryDet.FieldByName('IdPessoa').AsInteger;


   dValorSRB := qryDet.FieldByName('VALORSRB').AsFloat;

   { Para cada concessão de beneficio, gerar um único IDCALCULO }
   iIdCalculo := -1;

   bPreparoOK := PreparaBeneficioConcedido(qryAux,
      qryDet.FieldByName('IdTitular').AsInteger,
      qryDet.FieldByName('IdPessoa').AsInteger,
      qryDet.FieldByName('SeqProposta').AsInteger,
      qryDet.FieldByName('IdPessJur').AsInteger,
      qryDet.FieldByName('IdPlanoPrev').AsInteger,
      qryDet.FieldByName('NumeroProcesso').AsInteger,
      qryBeneficio.FieldByName('IdBeneficio').AsInteger,
      prmIDMOTIVOFOLHABEN,
      iNumBenef,
      qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
      -1,
      qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
      qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
      qryDet.FieldByName('IdTpPagtoBenefic').AsInteger,

      qryDet.FieldByName('CODPORTFORMA').AsInteger,
      qryBeneficio.FieldByName('Nome').AsString,
      sNomePatro, sNomePlano, sMatricula,
      qryDet.FieldByName('DataInicio').AsString,
      qryDet.FieldByName('DataFinal').AsString,
      qryBeneficio.FieldByName('flgCalcTodoMes').AsString,
      qryDet.FieldByName('ValorTotal').AsFloat,
      qryDet.FieldByName('ValorCotas').AsFloat,
      qryDet.FieldByName('ValorTotal').AsFloat,
      True,
      rValorAtualizado,
      rValorAtualizadoTotal,
      sUltMesReajuste,
      bErro,
      bAux,
      sMsgErro, iIdLoteConcessao,
      qryDet.FieldByName('DATAINICIOFUND').AsString,
      7,
      0,
      dValorSRB,
      iIdCalculo
      , False, True, qryDet.FieldByName('IDPERFILINVEST').AsInteger  //edilaine - SIG55933
      );
   If bErro
      Then Begin
         dtmBaseDados.dbBaseDados.RollBack;
         MsgDlg(sMsgErro + ' O benefício será mantido como "Pendente de Concessão"  ' +
            'até que o problema seja resolvido. ', 'Erro', mtError, [mbOk, mbHelp], 0);
         TiraSQL(qryAux);
         Result := 4;
         Exit;
      End;


   // Chamar movimentacao de reservas

   bFlgIntContab := (IntegraBack.Contabilidade = 'S');
   // Para cada movimento de reserva feito, neste momento - de concessao do beneficio -
   // o sistema deve gerar o movimento de reserva efetivo e apagar a movreservatemp
   If qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1
      Then Begin
         qryMovReservaTemp.First;
         While Not qryMovReservaTemp.Eof Do
            Begin

               If qryMovReservaTemp.FieldbyName('IdBeneficio').AsInteger <>
                  qryDet.FieldbyName('IdBeneficio').AsInteger
                  Then Begin
                     qryMovReservaTemp.Next;
                     continue;
                  End;

               If qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat <= 0
                  Then Begin
                     qryMovReservaTemp.Delete;
                     continue;
                  End;

               If qryBeneficio.FieldByName('FlgDataIndiceRes').AsInteger = 0 // usar DIB
               Then sDataReserva := qryDet.FieldByName('DataInicioFund').AsString
               Else If qryBeneficio.FieldByName('FlgDataIndiceRes').AsInteger = 2 // usar Data do Requerimento
               Then sDataReserva := qryDet.FieldByName('DataRequerimento').AsString
               Else Begin // usar data do efetivo pagamento. Esta data será informada pelo usuario
                     PedeInfAux('Informe a Data do Efetivo Pagamento', 'Data do Efetivo Pagamento', '', 2, sDataReserva);

                     If Trim(sDataReserva) = ''
                        Then Begin
                           MsgDlg('O benefício está configurado para abater a reserva com a cota da data do efetivo ' +
                              'pagamento. A informação desta data é obrigatória. Verifique.', 'Erro', mtError, [mbOk, mbHelp], 0);
                           TiraSQL(qryAux);
                           Result := 4;
                           Exit;
                        End;
                  End;
               If Trim(sDataReserva) = '' Then sDataReserva := qryDet.FieldByName('DataInicioFund').AsString;

               dSaldoCotas := qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat -
                  qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat;


               If MoveReserva(qry.FieldByName('IdEventoGerador').AsString,
                  qryDet.FieldByName('IdTitular').AsString,
                  qryDet.FieldByName('SeqProposta').AsString,
                  sNomeTitular,
                  qryDet.FieldByName('IDBENEFICIO').AsString,
                  qryAux, dtmAPrev.RegraAPrev, sMsgErro,
                  qryDet.FieldByName('IDPESSJUR').AsString,
                  qryDet.FieldByName('IDPLANOPREV').AsString,
                  qryMovReservaTemp.FieldByName('IdTipoReserva').AsString,
                  qryDet.FieldByName('IDPESSJUR').AsString,
                  qryDet.FieldByName('IDPLANOPREV').AsString,
                  qryMovReservaTemp.FieldByName('IdTipoReserva').AsString,
                  bFlgIntContab,
                  OraNumero(qryMovReservaTemp.FieldByName('VlrAbatido').AsString),
                  Date, '',
                  qryDet.FieldByName('NUMEROPROCESSO').AsString,
                  'F',
                  qry.FieldByName('DtDireito').AsString,
                  1,
                  qryDet.FieldByName('VlrINFINSS').AsFloat,
                  StrToDate(sDataReserva),
                  OraNumero(FloatToStr(dSaldoCotas))) <> 2
                  Then Begin
                     MsgDlg('Ocorreram erros ao movimentar a reserva relativa ao benefício. ' +
                        'O benefício será mantido como "Pendente de Concessão"  ' +
                        'até que o problema seja resolvido. ', 'Erro', mtError, [mbOk, mbHelp], 0);
                     TiraSQL(qryAux);
                     Result := 4;
                     Exit;
                  End;

               qryMovReservaTemp.Delete;
            End;
      End;


   StrConcedidos := StrConcedidos + QryDet.FieldByName('IDPESSOA').AsString + ',';

   bConcedeuBeneficio := True;
End; // EfetuaConcessao


Procedure TfrmCadRequerBenefPensionista.sbtnConcederClick(Sender: TObject);
Var iIdSitBenef, iIdSitTemp: integer;
   bSituacoesDiferentes: boolean;
   //Marcos Merola SOL161215  07/11/2011 Inicio
   iUser : String;
   query:TwwQuery;
Begin
  //BRUNO AZEVEDO SOL 132938
  sVlrATualMonBeneficio := '';
  sVlrATualMonContrib   := '';
  //BRUNO AZEVEDO SOL 132938
  
 // iUser   := inttostr(sistema.IdUsuario);         Retirado pelo SOL 206918
//
//  if (qryDet.Fieldbyname('TIPOBENEFICIO').asFloat <> 6) then
//  begin
//    if (((qryDet.Fieldbyname('TRGUSERINCLUSAO').asString = 'CM'+Trim(iUser)) OR
//      (qryDet.Fieldbyname('TRGUSERINCLUSAO').asString = Trim(iUser)) OR
//      (qryDet.Fieldbyname('TRGUSERINCLUSAO').asString = 'CM'+Trim(iUser)) OR
//      (qryDet.Fieldbyname('TRGUSERINCLUSAO').asString = Trim(iUser)))) then
//    begin
//       MsgDlg('Você não possui permissão para efetuar a concessão do(s) benefício(s).','Informação',mtInformation,[mbOk],0);
//       Exit;
//    end;
//  end;
//  //Marcos Merola SOL161215  07/11/2011 Fim


  // edilaine - SOL 262968 / PPM 1102753 - inicio
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' select to_char(sysdate,''dd/mm/yyyy hh24:mi'') AS datenow from dual ');
  qryAux.Open;
  sdataInicioConcessao := qryAux.fieldByName('datenow').AsString;
  // edilaine - SOL 262968 / PPM 1102753 - fim


////douglas


  query:=TwwQuery.Create(Self);
  query.DataBaseName := 'BaseDados';
  query.Active:=false;
  query.Sql.Clear;
  query.Sql.add('SELECT FLGIMPEDCONC FROM PARAMAPREV');
  query.open;
  if (query.fieldbyname('FLGIMPEDCONC').text='1') then
       begin
        MsgDlg('Você não possui permissão para efetuar a concessão do(s) benefício(s).','Informação',mtInformation,[mbOk],0);
        Exit;
        end;

  query.Active:=false;
  query.destroy;
////douglas

   // Conceder todos os benefícios do processo
   sbtnAlterarClick(Sender);

   // Se estiver em insercao ou edicao, nao permitir concessao
   If qryDet.State In [dsEdit, dsInsert]
      Then Begin
         MsgDlg(' Este benefício não pode ser concedido antes de ser confirmado. ' +
            ' Confirme a operação antes de concedê-lo. ', 'Informação', mtInformation, [mbOk, mbHelp], 0);
         sbtnConcedeUm.Down := False;
         TiraSQL(qryAux);
         Exit;
      End;

   // Verificar se o motivo default na tabela de parametros está preenchido
   If prmIDMOTIVOFOLHABEN <= 0
      Then Begin
         MsgDlg('O parâmetro motivo da folha de benefício não está preenchido. ' +
            'Utilize a tela de parâmetros para cadastrá-lo. ', 'Informação', mtInformation, [mbOk, mbHelp], 0);
         sbtnConcedeUm.Down := False;
         TiraSQL(qryAux);
         Exit;
      End;

   // Dependendo da situacao do beneficio, nao faz sentido concede-lo novamente
   If (qryDet.FieldByName('IdSitBeneficio').AsInteger In [1, 3, 5])
      Then Begin
         MsgDlg(' Este benefício não pode ser concedido. Verifique sua situação.  ',
            'Informação', mtInformation, [mbOk, mbHelp], 0);
         sbtnConcedeUm.Down := False;
         TiraSQL(qryAux);
         Exit;
      End;

   //BRUNO AZEVEDO SOL 156428 KINTANA 1235970
   if Trim(qryDet.FieldByName('DataInicio').AsString) = ''
   then begin
    MsgDlg('Data de Início do Pagamento não preenchida.','Erro',mtError,[mbOk],0);
    sbtnConcedeUm.Down := False;
    TiraSQL(qryAux);
    Exit;
   end;

   if Trim(qryDet.FieldByName('DATAINICIOFUND').AsString) = ''
   then begin
    MsgDlg('Data de Início do Benefício não preenchida.','Erro',mtError,[mbOk],0);
    sbtnConcedeUm.Down := False;
    TiraSQL(qryAux);
    Exit;
   end;
   //BRUNO AZEVEDO SOL 156428 KINTANA 1235970

   // Atualizar query de conta bancaria
   // Verificar conta bancaria do recebedor
   If qryBeneficiario.FieldByName('NOMERESPONSAVEL').AsString = ''
      Then Begin
         qryContaBancaria.Close;
         qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('IdPessoa').AsInteger;
         qryContaBancaria.Open;
      End
   Else Begin
         qryContaBancaria.Close;
         qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('IdResponsavel').AsInteger;
         qryContaBancaria.Open;
      End;

   If Not qryBeneficio.Active
      Then Begin
         qryBeneficio.Close;
         //qryBeneficio.ParamByName('IdEventoGerador').Value := qry.FieldByName('IdEventoGerador').AsInteger;   //edilaine - SIG84020
         qryBeneficio.ParamByName('IdEventoGerador').Value := FIdEvento;                                        //edilaine - SIG84020
         qryBeneficio.ParamByName('IdPlanoPrev').Value := qryDet.FieldByName('IdPlanoPrev').AsInteger;
         qryBeneficio.Open;
         If iIdEvento = 4 Then // SOL 170753 Kintana 1529212
         Begin
            qryBeneficio.Filter := 'FLGPECULIO = 1'; // SOL 170753 Kintana 1529212
            qryBeneficio.Filtered := True; // SOL 170753 Kintana 1529212
         end
         else
             begin
            qryBeneficio.Filtered := False; // SOL 170753 Kintana 1529212
             end
      End;

   if (sistema.idmodulo <> 454) then begin  //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393

   // Chamar tela de Modo de Concessao
   If frmPedeBenefExigencia = Nil Then
      Application.CreateForm(TfrmPedeBenefExigencia, frmPedeBenefExigencia);

   With frmPedeBenefExigencia Do
      Begin
         // Modos de Concessao = N - concedido Normal
         //                      E - concedido em Exigencia
         //                      P - manter Pendente
         //                      C - nao conceder (Cancelar requerimento)
         ShowModal;
         Case cModoConcessao Of
            'N': iIdSitBenef := 1;
            'C': Begin // Cancelar
                  If MsgDlg('Deseja realmente "NÃO CONCEDER" este benefício ? ' +
                     ' Esta operação irá cancelar o requerimento do mesmo.', 'Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrYes
                     Then iIdSitBenef := 6 // nao concedido
                  Else iIdSitBenef := 4; // pendente de concessao
               End;
            'E': iIdSitBenef := 7;
            'P': iIdSitBenef := 4;
         Else iIdSitBenef := 1;
         End; //case
      End; //with
   end else begin
       iIdSitBenef := 1;
   end;


   qryDet.First;
   While Not qryDet.Eof Do
      Begin
         PreencheDadosBeneficiario(qryDet.FieldByName('NumeroProcesso').AsInteger,
            qryDet.FieldByName('IdTitular').AsInteger,
            qryDet.FieldByName('IdPessoa').AsInteger,
            qryDet.FieldByName('IdPessJur').AsInteger,
            qryDet.FieldByName('IdPlanoPrev').AsInteger,
            qryDet.FieldByName('SeqProposta').AsInteger);

         If Not ConcedeUmBeneficio(Sender, iIdSitBenef)
            Then Begin
               sbtnConceder.Down := False;
               TiraSQL(qryAux);
               Exit;
            End;
         qryDet.Next;
      End; // while

   // Se o processo só possuir um beneficio, atualizar situacao do processo
   // Caso contrario verificar se todos os beneficios do processo estao com a mesma
   // situacao
   If qryDet.RecordCount = 1
      Then Begin
         qry.FieldbyName('IdSitProcesso').AsInteger := iIdSitBenef;
         qry.FieldByName('Descricao').AsString := vetDescBeneficio[iIdSitBenef];
      End
   Else Begin // processo possui + de 1 beneficio
         // Verificar se existem beneficios com situacoes diferentes
         iIdSitTemp := iIdSitBenef;
         bSituacoesDiferentes := False;
         qryDet.DisableControls;
         qryDet.First;
         While Not qryDet.Eof Do
            Begin
               If (qryDet.FieldByName('IdSitBeneficio').AsInteger <> iIdSitTemp) And
                  (Not BeneficioDePagamentoUnico(qryDet.FieldByName('IdBeneficio').AsInteger))
                  Then bSituacoesDiferentes := True;
               qryDet.Next;
            End; //while
         qryDet.EnableControls;

         If bSituacoesDiferentes
            Then Begin // existe + de 1 beneficio no processo e estao com situacoes diferentes
               MsgDlg('O Processo Nº ' + IntToStr(iNumeroProcesso) + ' possui benefícios com situações diferentes.' +
                  'Caso estas situações não sejam regularizadas o processo não terá sua situação alterada.',
                  'Informação', mtInformation, [mbOk], 0);
               TiraSQL(qryAux);
            End
         Else Begin // existe +  de 1 beneficio no processo mas todos estao com  a mesma situacao
               qry.FieldbyName('IdSitProcesso').AsInteger := iIdSitTemp;
               qry.FieldByName('Descricao').AsString := vetDescBeneficio[iIdSitTemp];
            End;
      End; // else - if RecordCount = 1

   lblNumProcesso.Caption := 'Processo Nº ' + IntToStr(iNumeroProcesso);
   lblSitProcesso.Caption := 'Situação : ' + qry.FieldByName('Descricao').AsString;

   sbtnConcedeUm.Down := False;
   MsgDlg('Benefício concedido com sucesso.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
   TiraSQL(qryAux);
End;

Function TfrmCadRequerBenefPensionista.ConcedeUmBeneficio(Sender: TObject; piIdSitBenef: integer): boolean;
Var sNomeSituacao: String;
   rValorAtualizado,
      rValorAtualizadoTotal,
      rValorAtualizadoINSS,
      rValorAtualizadoTotalINSS: double;
   sUltMesReajuste,
      sUltMesReajusteINSS: String;
   bErro: boolean;
   varfields: variant;
   sMsgErro: String;
   iIdPlanPrevContab: Integer;
   sDataFinalATestar: String;
   idPessoa, Idtitular, Idbeneficio: String; // Jéssica SOL125930
   sEventoGerador: String; // Jéssica SOL125930
   sIDContribuicao: String; // Jéssica SOL125930
   dCorrecaoMonetaria : Currency;  // SOL 132938
   sAnoMesAtual, sAnoMesFim : String;         // SOL 132938
   iNumRecebimento,  iIdContribuicao : INTEGER; // SOL 132938
Begin
   Inherited;

   Result := False;


   //SOL 140042 Kintana 900220
   if qryDet.FieldByName('FONTEPAGADORA').AsInteger = 2 then    //SOL 140042.6361 Kintana 1410792
   begin
      qryAux2.close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.Add(' SELECT DISTINCT DC.MESCOBRANCA ');
      qryAux2.SQL.Add(' FROM   DETCONCINSS DC ' );
      qryAux2.SQL.Add(' WHERE  DC.NUMPROCINSS   = ' + QuotedStr(qryDet.FieldByName('NUMPROCINSS').asString));
      qryAux2.SQL.Add(' Union All ');
      qryAux2.SQL.Add(' SELECT DISTINCT TC.MESPROCESSAMENTO ');
      qryAux2.SQL.Add(' FROM   TEMPCONCINSS TC ' );
      qryAux2.SQL.Add(' WHERE TC.NUMPROCINSS    = ' + QuotedStr(qryDet.FieldByName('NUMPROCINSS').asString));
      qryAux2.Open;

      if not qryAux2.RecordCount > 1 then
      begin
         ShowMessage('Existe mais de um mês de cobrança de reembolso para os valores informados. Favor verificar no Reembolso INSS. ');
      end;
   end;
   //SOL 140042 Kintana 900220



   // SOL 125930
   // A
   qryAux2.close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(' SELECT B.IDEVENTOGERADOR ');
   qryAux2.SQL.Add(' from BENEFICIO B, BENEFBFCIARIO BF');
   qryAux2.SQL.Add(' WHERE B.IDBENEFICIO = BF.IDBENEFICIO');
   qryAux2.SQL.Add(' AND B.IDBENEFICIO =' + QuotedStr(qryDet.FieldByName('IDBENEFICIO').asString));
   qryAux2.SQL.Add(' AND BF.IDPESSOA =' + QuotedStr(qryDet.FieldByName('IDPESSOA').asString));
   qryAux2.SQL.Add(' AND BF.IDTITULAR =' + QuotedStr(qryDet.FieldByName('IDTITULAR').asString));
   qryAux2.SQL.Add(' AND BF.IDPLANOPREV =' + QuotedStr(qryDet.FieldByName('IDPLANOPREV').asString));
   qryAux2.SQL.Add(' AND BF.IDPESSJUR =' + QuotedStr(qryDet.FieldByName('IDPESSJUR').asString));
   qryAux2.SQL.Add(' AND BF.FONTEPAGADORA = 1');
   qryAux2.Open;
   sEventoGerador := qryAux2.FieldByname('IDEVENTOGERADOR').asString;
   // FIM - A
   If Not qryAux2.IsEmpty Then
      Begin
         sEventoGerador := qryAux2.FieldByname('IDEVENTOGERADOR').asString
      End
   Else
      Begin
         sEventoGerador := '-1';
      End;

   // B
   qryAux2.close;
   qryAux2.SQL.Clear;
   //edilaine - SIG81749 - inicio
   qryAux2.SQL.Add(' SELECT D.IDPESSOA, D.IDTITULAR FROM DEPENTIT D WHERE D.IDPESSOA = '+QuotedStr(qryDet.FieldByName('IdPessoa').asString));
   qryAux2.SQL.Add(' AND    D.IDTITULAR = '+QuotedStr(qryDet.FieldByName('IDTITULAR').asString));
   //edilaine - SIG81749 - fim
   qryAux2.Open;
   Idtitular := qryAux2.FieldByname('IDTITULAR').asString;
   idPessoa := qryAux2.FieldByname('IDPESSOA').asString;
   // FIM - B



   // C
   qryAux2.close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add('SELECT DISTINCT C.IDCONTRIBUICAO FROM CONTPREVEVENTO C, EVENTOSPREV EP ');
   qryAux2.SQL.Add('WHERE C.IDEVENTOGERADOR = EP.IDEVENTOGERADOR ');
   qryAux2.SQL.Add(' AND EP.IDPESSOA  =' + QuotedStr(IDTITULAR));
   qryAux2.SQL.Add(' AND EP.IDEVENTOGERADOR =' + sEventoGerador);
   qryAux2.Open;
   If Not qryAux2.IsEmpty Then
      Begin
         While Not qryAux2.eof Do
            Begin
               sIDContribuicao := sIDContribuicao + IntToStr(qryAux2.FieldByname('IDCONTRIBUICAO').AsInteger) + ',';
               qryAux2.next;
            End;
         sIDContribuicao := Copy(sIDContribuicao, 1, length(sIDContribuicao) - 1);
         sIdContribuicaoAlteradores := sIDContribuicao; //132938 BRUNO AZEVEDO
      End;
   // FIM - C

   // LOGICA
   //BRUNO AZEVEDO SOL 154040 KINTANA 1167990
   if (not qryAux2.IsEmpty) and (qryDet.FieldByName('FLGPECULIO').asString <> '1') then
      Begin
         If (Idtitular = idPessoa) Then
            Begin
               qryAux2.close;
               qryAux2.SQL.Clear;
               qryAux2.SQL.Add('SELECT * FROM CONTRIBPREVPARTP C WHERE IDPESSJUR = ' + qryDet.FieldByName('IDPESSJUR').asString);
               qryAux2.SQL.Add(' AND IDPESSOA = ' + QuotedStr(IDPESSOA));
               qryAux2.SQL.Add(' AND IDPLANOPREV = ' + qryDet.FieldByName('IDPLANOPREV').asString);
               qryAux2.SQL.Add(' AND IDCONTRIBUICAO IN (' + sIDContribuicao + ')');
               qryAux2.Open;
               If qryAux2.IsEmpty Then
                  Begin
                     MessageDlg('Não é possível conceder benefício sem contribuição vinculada ao Participante', mtInformation, [mbOK], 0);
                     Result := False;
                     Exit;
                  End
            End
         Else
            Begin
               qryAux2.close;
               qryAux2.SQL.Clear;
               qryAux2.SQL.Add('SELECT * FROM NUCLEOFAMILIAR N, CONTRIBPREVNUCLEO CP ');
               //Everson TIBERO - Início
               {qryAux2.SQL.Add('WHERE IDRESPNUCLEO = ' + QuotedStr(IDPESSOA));
               qryAux2.SQL.Add(' AND IDTITULAR = ' + QuotedStr(Idtitular));}
               qryAux2.SQL.Add('WHERE N.IDRESPNUCLEO = ' + QuotedStr(IDPESSOA));
               qryAux2.SQL.Add(' AND N.IDTITULAR = ' + QuotedStr(Idtitular));
               //Everson TIBERO - Fim

               qryAux2.SQL.Add(' AND N.IDNUCLEOFAMILIAR = CP.IDNUCLEOFAMILIAR');
               qryAux2.SQL.Add(' AND CP.IDCONTRIBUICAO IN (259, 633, 500) ');
               qryAux2.Open;
               If qryAux2.IsEmpty Then
                  Begin
                     MessageDlg('Não é possível conceder benefício sem contribuição vinculada ao Núcleo Familiar', mtInformation, [mbOK], 0);
                     Result := False;
                     Exit;
                  End
            End;
      End;
   {else

   begin
     //MessageDlg('Não é possível conceder benefício sem contribuição vinculada ao Participante', mtInformation, [mbOK], 0);
     //Result := False;
     //Exit;
   end;}


  {Jéssica Lana SOL 121166  KINTANA 579890 22/09/2009
   qryAux2.close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(' SELECT IDPESSOA, IDTITULAR, MATRICULA ');
   qryAux2.SQL.Add(' FROM DEPENTIT ' );
   qryAux2.SQL.Add(' WHERE MATRICULA =' + QuotedStr(qryPensionista.FieldbyName('MATRICULA').asString));
   qryAux2.SQL.Add(' AND IDPESSOA    =' + QuotedStr(qryDet.FieldByName('IdPessoa').asString));

   qryAux2.Open;
   idPessoa  := qryAux2.FieldByname('idPessoa').asString;
   Idtitular :=  qryAux2.FieldByname('idTitular').asString;

   if qryAux2.FieldByname('idPessoa').asString = qryAux2.FieldByname('idTitular').asString then begin

// Alteração SOL125930
   qryAux2.close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(' SELECT C.IDCONTRIBUICAO, EP.IDPESSOA, EP.IDBENEFICIO ');
   qryAux2.SQL.Add(' FROM CONTPREVEVENTO C, EVENTOSPREV EP ');
   qryAux2.SQL.Add(' WHERE C.IDEVENTOGERADOR = EP.IDEVENTOGERADOR ');
   qryAux2.SQL.Add(' AND EP.IDPESSOA = ' + QuotedStr(qryDet.FieldByName('IdPessoa').asString) );
   qryAux2.SQL.Add(' AND EP.IDBENEFICIO = ' + QuotedStr(qryDet.FieldByName('IdBeneficio').asString) );

   qryAux2.Open;

   idPessoa  := qryAux2.FieldByname('idPessoa').asString;
   idBeneficio := qryAux2.FieldByname('idBeneficio').asString;

   if not qryAux2.IsEmpty
   then begin

// Aposentado

   qryAux2.close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(' SELECT * FROM CONTRIBPREVPARTP ');
   qryAux2.SQL.Add(' WHERE IDPESSJUR = ' + qryDet.FieldByName('IDPESSJUR').asString);
   qryAux2.SQL.Add(' AND IDPESSOA  = '   + qryDet.FieldByName('IDPESSOA').asString);
   qryAux2.SQL.Add(' AND IDPLANOPREV = ' + qryDet.FieldByName('IDPLANOPREV').asString);
   qryAux2.SQL.Add(' AND IDCONTRIBUICAO IN ( SELECT C.IDCONTRIBUICAO ');
   qryAux2.SQL.Add(' FROM CONTPREVEVENTO C, EVENTOSPREV EP ');
   qryAux2.SQL.Add(' AND EP.IDPESSOA = IDPESSOA ');
   qryAux2.SQL.Add(' AND EP.IDBENEFICIO = IDBENEFICIO ');
   qryAux2.Open;

    if qryAux2.IsEmpty then begin
       MessageDlg('Não é possível conceder benefício sem a contribuição vinculada ao participante', mtInformation, [mbOK], 0);
       Result := False;
       Exit;
     end;
     end else begin

// Pensionista
   qryAux2.close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(' SELECT * FROM NUCLEOFAMILIAR N, CONTRIBPREVNUCLEO CP ');
   qryAux2.SQL.Add(' WHERE IDRESPNUCLEO = ' + QuotedStr(IDPESSOA));
   qryAux2.SQL.Add(' AND IDTITULAR =      ' + QuotedStr(IDTITULAR));
   qryAux2.SQL.Add(' AND N.IDNUCLEOFAMILIAR = CP.IDNUCLEOFAMILIAR ');
   qryAux2.SQL.Add(' AND CP.IDCONTRIBUICAO IN (''259'', ''633'', ''500'') ');

   qryAux2.Open;

     if qryAux2.IsEmpty then begin
       MessageDlg('Não é possível conceder benefício sem a contribuição vinculada ao Núcleo familiar', mtInformation, [mbOK], 0);
       Result := False;
       Exit;
     end;
   end;
  end;  //Fim SOL125930 }

  // Se o pagamento for para Folha de Beneficio
  // Verificar se participante possui conta bancaria
   If (qryDet.FieldByName('FLGFORMAPAGTO').AsString = 'F') And
      (Trim(dblkpcmbPortForma.Text) = '') And
      (qryContaBancaria.IsEmpty)
      Then Begin
         MsgDlg(' Este beneficiário/recebedor não possui Conta Bancária cadastrada. ' +
            ' Cadastre pelo menos uma conta para conceder o benefício.',
            'Informação', mtInformation, [mbOk, mbHelp], 0);
         sbtnConcedeUm.Down := False;
         TiraSQL(qryAux);
         Exit;
      End;

   // Se for um beneficio de resgate e tiver portador forma indicado
   // sugerir ao usuario que preencha a agencia para credito
   If (qryBeneficio.FieldByName('FlgResgate').AsInteger = 1) And
      (Trim(dblkpcmbPortForma.Text) <> '') And
      (Trim(dblkpcmbAgencia.Text) = '')
      Then Begin
         If MsgDlg(' Este participante não possui Agência para Crédito cadastrada. ' +
            ' Deseja cadastrar antes de conceder o benefício ? ',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
            Then Begin
               sbtnConcedeUm.Down := False;
               TiraSQL(qryAux);
               Exit;
            End;
      End;

   qryBeneficio.Locate('IdBeneficio', qryDet.FieldByName('IdBeneficio').AsInteger, [loCaseInsensitive]);


   // Renato Visoni SOL 123843 Kintana 636875
   If Not ComparaValorReservaComHistorico(QryAux, qryDet.FieldByName('IDPESSOA').asString, qryDet.FieldByName('IDPESSJUR').asString, qryDet.FieldByName('IDPLANOPREV').asString) Then Begin
         Result := False;
         Exit;
      End;
   // Renato Visoni SOL 123843 Kintana 636875

  // Verificar se existem algum benefício obrigatorio no evento que não foi
  // requerido
   If Not VerificaBeneficioObrigatorio
      Then Begin
         sbtnConcedeUm.Down := False;
         TiraSQL(qryAux);
         Exit;
      End;

   // Executar regra de elegibilidade
   If (piIdSitBenef <> 4) And (piIdSitBenef <> 6)
      Then bbtnElegibilidadeClick(Sender);

   If Not bConcedeBeneficio
      Then Begin
         sbtnConcedeUm.Down := False;
         TiraSQL(qryAux);
         Exit;
      End;

   // Se a situacao do beneficio for "Concedido Normal" (sit = 1)
   // Preparar o beneficio inserindo-o na benefbfciario
   If piIdSitBenef = 1
      Then Begin
         // Se o parametro do beneficio por plano (flgbenefinf) definir que
         //    o no. de beneficiarios elegiveis
         // Entao iNumBenef := qryBeneficiario.RecordCount, pois a qryBeneficiario
         //       está com os elegiveis
         // Senao, abrir uma query auxiliar com todos os beneficiarios do beneficios
         //       iNumBenef := numero total de beneficiarios

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BENEFBFCIARIO BF, BENEFPLANPREV BP  ' +
            ' WHERE  (BF.IDTITULAR      = ' + IntToStr(iIdTitular) + ') ' +
            ' AND    (BF.IDPESSJUR      = ' + IntToStr(iIdPessJur) + ') ' +
            ' AND    (BF.IDPLANOORIGEM  = ' + IntToStr(iIdPlanoPrev) + ') ' +
            ' AND    (BF.SEQPROPOSTA    = ' + IntToStr(iSeqProposta) + ') ' +
            ' AND    (BF.NUMEROPROCESSO = ' + IntToStr(iNumeroProcesso) + ')' +
            ' AND    (BF.IDBENEFICIO    = ' + qryBeneficio.FieldByName('IdBeneficio').AsString + ') ' +
            ' AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV) ' +
            ' AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO) ' +
            ' AND    ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  '
            );
         qryAux.Open;

         iNumBenef := qryAux.RecordCount;

         If Not qryBeneficio.Active Then Exit;

         If (qryBeneficio.FieldByName('flgBenefInf').AsInteger = 0) And
            (qryBeneficio.FieldByName('IdBeneficio').AsString <> '')
            Then Begin
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BFCIARIOTITPLAN BF, BENEFPLANPREV BP ' +
                  ' WHERE  (BF.IDTITULAR   = ' + IntToStr(iIdTitular) + ') ' +
                  ' AND    (BF.IDPESSJUR   = ' + IntToStr(iIdPessJur) + ') ' +
                  ' AND    (BF.IDPLANOORIGEM = ' + IntToStr(iIdPlanoPrev) + ') ' +
                  ' AND    (BF.SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ') ' +
                  ' AND    (BF.IDBENEFICIO = ' + qryBeneficio.FieldByName('IdBeneficio').AsString + ') ' +
                  ' AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV) ' +
                  ' AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO) ' +
                  ' AND    ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  '
                  );
               qryAux.Open;
               iNumBenef := qryAux.RecordCount;
            End;

         piIdSitBenef := EfetuaConcessao(piIdSitBenef,
            rValorAtualizado,
            rValorAtualizadoTotal,
            rValorAtualizadoINSS,
            rValorAtualizadoTotalINSS,
            sUltMesReajuste,
            sUltMesReajusteINSS, bErro);
         If bErro
            Then Begin
               sbtnConcedeUm.Down := False;
               TiraSQL(qryAux);
               Exit;
            End;

      // SOL 132938
      {If Trim(DbLAlterador.Text) = 'Sim' Then Begin
         With qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT MESREFERENCIA FROM CTRLINTERFACE '+
                    ' WHERE  IDLOTE = '+IntToStr(iIdLoteConcessao));
            Open;

            sAnoMesFim :=  qryAux.FieldByName('MESREFERENCIA').Asstring;

            if qryDet.FieldByName('DATAINICIO').Asstring <> '' then
               sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIO').AsDateTime)
            else
               sAnoMesAtual := FormatDateTime('yyyy/mm',qryDet.FieldByName('DATAINICIOFUND').AsDateTime);

            while  sAnoMesAtual <= sAnoMesFim do
            begin

               If Not CalculaAlteradores('B', sAnoMesAtual,
                                      qryDet.FieldByName('ValorAtual').AsFloat,
                                      dCorrecaoMonetaria,
                                      -1,-1)
               Then Begin
                  dtmBaseDados.dbBaseDados.RollBack;
                  MsgDlg('Erro no calculo dos alteradores.', 'Erro', mtError, [mbOk,mbHelp], 0);
                  TiraSQL(qryAux);
                  Exit;
               End;
             // Buscar NUMRECEBIMENTO para inserir na HSTATRASOCONTRIB
             sSQL := 'SELECT H.IDCONTRIBUICAO, H.NUMRECEBIMENTO FROM '+
                     'HSTCONTRIBPREV H WHERE H.NUMRECEBIMENTO =      '+
                     '(SELECT MAX(NUMRECEBIMENTO) AS NUMRECEBIMENTO  '+
                     ' FROM HSTCONTRIBPREV HCP '+
                     ' WHERE                   '+
                     '  HCP.IDPESSOA = '+ qryDet.FieldByName('IDPESSOA').AsString      +' AND '+
                     '  HCP.IDMOTIVO = '+ inttostr(prmIdMotivoContrib)                 +' AND '+
                   //  '  HCP.IDLOTE   = '+ IntToStr(iIdLoteConcessao)                   +' AND '+
                     '  HCP.MESREFERENCIA  = '+ QuotedStr(sAnoMesAtual)                +' ) AND '+
                     '  H.Idcontribuicao in ( ' +sIDContribuicao +' ) ';
                     
             If FazQuery(QryAux, sSQL) Then Begin

               iNumRecebimento := qryAux.FieldByName('NUMRECEBIMENTO').AsInteger;
               iIdContribuicao := qryAux.FieldByName('IDCONTRIBUICAO').AsInteger;

               If iNumRecebimento > 0 Then Begin
                 // Calcular Alterados
                   If Not CalculaAlteradores('C', sAnoMesAtual,
                                             qryDet.FieldByName('ValorAtual').AsFloat,
                                             dCorrecaoMonetaria,
                                             iIdContribuicao, iNumRecebimento,0)
                   Then Begin
                     dtmBaseDados.dbBaseDados.RollBack;
                     MsgDlg('Erro no calculo dos alteradores.', 'Erro', mtError, [mbOk,mbHelp], 0);
                     TiraSQL(qryAux);
                     Exit;
                   End;
               END;
             END;
             sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
            end;
         end;
      end;  }
      // SOL 132938
      End;

   // Se a situacao final do beneficio for 6 (nao concedido), devolver para
   // a reserva o valor que havia sido abatido
   If (piIdSitBenef = 6) And (qryDet.FieldByName('FlgResgate').AsInteger = 1)
      Then Begin
         If Not DevolveReserva(qryDet.FieldByName('IdBeneficio').AsInteger,
            qryDet.FieldByName('IdPessoa').AsInteger)
            Then Begin
               MsgDlg('Ocorreu um problema no acerto do saldo de reserva deste participante. ' +
                  'Para sua garantia o processo não será concedido até que o problema seja solucionado. ' +
                  'Verifique. ', 'Informação', mtInformation, [mbOk, mbHelp], 0);
               sbtnConcedeUm.Down := False;
               TiraSQL(qryAux);
               Exit;
            End;
      End;

   // Gravar situacao final do beneficio na qryDet (BenefBfciario)
   qryDet.DisableControls;
   qryDet.Edit;
   // Se o preparo de beneficio atualizou o beneficio, gravar os dados
   // agora, pois senao o requerimento irá substitui-los
   If Trim(sUltMesReajuste) <> ''
      Then Begin
         qryDet.FieldByName('UltMesReajuste').AsString := sUltMesReajuste;
         qryDet.FieldByName('ULTVALORATUALREAJ').AsFloat := qryDet.FieldByName('ValorAtual').AsFloat;
         qryDet.FieldByName('ValorAtual').AsFloat := rValorAtualizado;
         qryDet.FieldByName('ValorCalculado').AsFloat := rValorAtualizado;
         qryDet.FieldByName('ValorTOTAL').AsFloat := rValorAtualizadoTotal;

         If qryBeneficio.FieldbyName('FlgCalcTodoMes').AsInteger = 1
            Then rValorCotas := rValorAtualizado // beneficio em cotas
         Else rValorReal := rValorAtualizado; // beneficio em real
      End;

   qryDet.FieldByName('IdSitBeneficio').AsInteger := piIdSitBenef;
   qryDet.FieldByName('Descricao').AsString := vetDescBeneficio[piIdSitBenef];

   If piIdSitBenef = 1
      Then qryDet.FieldByName('DataConcessao').AsDateTime := Date;

   If FazQuery(qryAux, ' SELECT BF.IDSITBENEFICIO, BF.VALORATUAL ' +
      ' FROM BENEFBFCIARIO BF, MOVBENEF MB ' +
      ' WHERE BF.IDPESSOA       = ' + qryDet.FieldByName('IdPessoa').AsString +
      '   AND BF.IDBENEFICIO    = ' + qryDet.FieldByName('IdBeneficio').AsString +
      '   AND BF.NUMEROPROCESSO = ' + qryDet.FieldByName('NumeroProcesso').AsString +
      '   AND BF.IDPESSOA       = MB.IDPESSOA ' +
      '   AND BF.IDBENEFICIO    = MB.IDBENEFICIO ' +
      '   AND BF.NUMEROPROCESSO = MB.NUMEROPROCESSO ' +
      '   AND MB.MOTRETENC      = 8') Then
      Begin
         If qryaux.FieldByName('IdSitBeneficio').AsInteger = 3 Then
            Begin
               rValorReal := qryAux.FieldByName('valoratual').AsFloat;
               rValorCotas := qryAux.FieldByName('valoratual').AsFloat;
               qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;
               qryDet.FieldByName('DATAFINAL').AsString := qryDet.FieldByName('DATAINICIO').AsString;
            End;
      End;

   //verifica o cadastro e não a forma de pgto do benefício
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT T.FLGFREQUENCIA ' +
      ' FROM   TPPAGTOBENEFICIO T   ' +
      ' WHERE  T.IDTPPAGTOBENEFIC = ' + IntToStr(qrydet.FieldByName('IdTpPagtoBenefic').AsInteger));
   qryAux.Open;

   If (qryAux.FieldByName('FlgFrequencia').AsString = 'U')
      Then
      Begin
         qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;
         piIdSitBenef := 3;
      End;

   //edilaine - SIG84020 - inicio
   if Sistema.IdModulo <> 454 then
   begin
     // Se o beneficio tem datafinal <= MESATUAL
     // Entao Se a data final for no mes ATUAL (mes do lote)
     //       Entao Se o parametro de concessao for para conceder até mes anterior
     //             Entao NAO ENCERRAR BENEFICIO e NAO PAGAR MES ATUAL
     //             Senao ENCERRAR BENEFICIO e PAGAR MES ATUAL
     //       Senao // data final anterior ao mes atual
     //             ENCERRAR BENEFICIO e PAGAR ULTIMO MES

     If qryDet.FieldByName('FlgDataPrevista').AsInteger = 1
        Then sDataFinalATestar := Trim(qryDet.FieldByName('DATAFINALPREVISTA').AsString)
     Else sDataFinalATestar := Trim(qryDet.FieldByName('DATAFINAL').AsString);

     If (sDataFinalATestar <> '') And
        (Copy(sDataFinalATestar, 7, 4) + '/' + Copy(sDataFinalATestar, 4, 2) <= FormatDateTime('yyyy/mm', date))
        Then Begin
           If (Copy(sDataFinalATestar, 7, 4) + '/' + Copy(sDataFinalATestar, 4, 2) = FormatDateTime('yyyy/mm', date))
              Then Begin
                 If iFlgIncluiMesConc = 0
                    Then Begin
                       qryDet.FieldByName('IdSitBeneficio').AsInteger := 1;
                    End
                 Else Begin
                       If qryDet.FieldByName('FlgDataPrevista').AsInteger = 1
                          Then qryDet.FieldByName('IdSitBeneficio').AsInteger := 2
                       Else Begin
                             qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;


                             If Trim(qryDet.FieldByName('DATAFINAL').AsString) = ''
                                Then qryDet.FieldByName('DATAFINAL').AsString := qryDet.FieldByName('DATAINICIO').AsString;
                          End;
                    End;
              End
           Else Begin
                 If qryDet.FieldByName('FlgDataPrevista').AsInteger = 1
                    Then qryDet.FieldByName('IdSitBeneficio').AsInteger := 2
                 Else Begin
                       qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;

                       If Trim(qryDet.FieldByName('DATAFINAL').AsString) = ''
                          Then qryDet.FieldByName('DATAFINAL').AsString := qryDet.FieldByName('DATAINICIO').AsString;
                    End;
              End;
           piIdSitBenef := qryDet.FieldByName('IdSitBeneficio').AsInteger;
        End;
     end;
     //edilaine - SIG84020 - fim

   // Regra para indicar Entidade Contábil/Financeira.
   // Se não houver regra cadastrada gravar nulo senão
   // executar regra

   If (Trim(qryBeneficio.FieldByName('IDRGPLANPREVCONT').AsString) <> '') Then
      Begin
         iIdPlanPrevContab := ExecutaRegraPlanPrevContab(qryAux,
            qryBeneficio.FieldByName('IDRGPLANPREVCONT').AsInteger,
            iIdPessJur,
            iIdPlanoPrev,
            iIdTitular,
            iSeqProposta,
            qryBeneficio.FieldByName('IdBeneficio').AsInteger,
            rOpcao1,
            rOpcao2,
            rOpcao3,
            FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
            FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
            sDataDemissao,
            FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),
            sFlgInternoAntes,
            sFlgInternoDepois,
            sIdSitPartAntes,
            sIdSitPlanAntes,
            sIdSitFuncAntes,
            sIdSitPartDepois,
            sIdSitPlanDepois,
            sIdSitFuncDepois,
            iNumBenef,
            0,
            bErro,
            sMsgErro
            );

         If bErro Then
            MsgDlg(sMsgErro, 'Erro', mtError, [mbOk], 0)
         Else
            qryDet.FieldByName('IDPLANPREVCONTAB').AsInteger := iIdPlanPrevContab;
      End;

   qryDet.Post;
   qryDet.EnableControls;

   varFields := VarArrayCreate([0, 1], varVariant);
   varFields[0] := iIdBenefReferencia;
   varFields[1] := qryDet.FieldByName('IdPessoa').AsInteger;

   Result := True;
End;

Function TfrmCadRequerBenefPensionista.CalculaReservaParaBeneficio: double;
Var dTotReservaReal,
   dValorReservaCota,
      dValorDaCota: double;
   sDataRef,
      sDataInicio,
      sValorProvento,
      sValorAtualReserva,
      sValorReservaCota,
      sDataCancelamento,
      sValorTotReservaReal,
      sSQLReserva: String;
   bErro: boolean;
   iNumReg,
      iTotReserva,
      iFlgUltimo: integer;
   varfields: variant;
Begin
   Result := 0;

   If qryReservaPart.IsEmpty
      Then Exit;

   // Se tiver regra de calculo de reserva para pagamento
   // Entao utilizar a regra
   // Senao converter as reservas para real e somá-las
   If FormatDateTime('dd/mm/yyyy', qry.FieldByName('DTEVENTO').AsDateTime) <> ''
      Then sDataRef := FormatDateTime('dd/mm/yyyy', qry.FieldByName('DTEVENTO').AsDateTime)
   Else sDataRef := FormatDateTime('dd/mm/yyyy', date);

   If qryBeneficio.FieldByName('IdRegraPagamento').AsString <> ''
      Then Begin

         If Trim(dtInicioFund.Text) <> ''
            Then sDataInicio := FormatDateTime('dd/mm/yyyy', dtInicioFund.Date)
         Else sDataInicio := sDataRef;

         sValorProvento := CalcSALPART(iIdPessJur, iIdTitular,
            Copy(sDataInicio, 7, 4) + '/' + Copy(sDataInicio, 4, 2),
            qryAux
            );

         sSQLReserva := '';
         iNumReg := 0;
         iFlgUltimo := 0;
         iTotReserva := qryReservaPart.RecordCount;

         qryReservaPart.First;

         // Executar a regra de reserva para beneficio para cada reserva.
         // A regra retornará o valor em cotas que será usado da reserva para calcular o
         // valor do benefício. Este valor deve ser guardado na MOVRESERVATEMP
         // Quando acabar de executar a regra para todas as reservas, executá-la mais
         // uma vez para a regra retornar o valor total em real da reserva para benefício
         While (Not qryReservaPart.Eof) Or (iNumReg <= iTotReserva) Do
            Begin
               inc(iNumReg);

               // Quando a variavel iNumReg for > que a variavel iTotReserva significa que
               // já rodei a regra para todas as reservas e estou rodando a ultima vez para
               // pegar o total em real das reservas
               If iNumReg > iTotReserva
                  Then iFlgUltimo := 1;


               //se for o valor atual deve ser passado como o somatório
               //dos valorres abatidos
               If iFlgUltimo = 1 Then
                  Begin
                     sValorAtualReserva := OraNumero(FloatToStr(dTotReservaReal));
                  End
               Else
                  Begin
                     varFields := VarArrayCreate([0, 1], varVariant);
                     varFields[0] := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
                     varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;

                     If qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva', varFields, [loCaseInsensitive])
                        Then sValorAtualReserva := OraNumero(qryMovReservaTemp.FieldByName('VlrOriginal').AsString)
                     Else sValorAtualReserva := OraNumero(qryReservaPart.FieldByName('ValorReserva').AsString);
                  End;

               sDataCancelamento := qryTitular.FieldByName('DATACANCELAMENTO').AsString;
               If sDataCancelamento = '' Then sDataCancelamento := ' ';


               sSQLReserva := ' SELECT ' + IntToStr(iNumReg) + ' AS CONTRESERVA, ' +
                  IntToStr(iFlgUltimo) + ' AS ULTRESERVA, ' +
                  qryReservaPart.FieldByName('IdTipoReserva').AsString + ' AS IDTIPORESERVA,    ' +
                  qryReservaPart.FieldByName('IdPessJur').AsString + ' AS IDPESSJUR,        ' +
                  qryReservaPart.FieldByName('IdPlanoPrev').AsString + ' AS IDPLANOPREV,      ' +
                  qryReservaPart.FieldByName('IdPessoa').AsString + ' AS IDPESSOA,         ' +
                  qryReservaPart.FieldByName('SeqProposta').AsString + ' AS SEQPROPOSTA,   ' +
                  '' + qryReservaPart.FieldByName('FLGDESCIRRF').AsString + ' AS FLGDESCIRRF, ' +
                  qryBeneficio.FieldByName('IdBeneficio').AsString + ' AS IDBENEFICIO,          ' +
                  OraNumero(sValorProvento) + ' AS VALORPROVENTO,                              ' +
                  sValorAtualReserva + ' AS VALORRESERVA,                               ' +
                  '''' + qryReservaPart.FieldByName('MoeSigla').AsString + '''         AS MOESIGLA,     ' +
                  '''' + PreparaStrRegra(sDataInicio) + '''       AS DATAINICIO,                                         ' +
                  '''' + PreparaStrRegra(sDataRef) + '''          AS DATAREF,                                            ' +
                  '''' + PreparaStrRegra(qryReservaPart.FieldByName('DATAREFERENCIASA').AsString) + ''' AS DATAREFERENCIASA, ' +
                  '''' + PreparaStrRegra(qryReservaPart.FieldByName('DATANASC').AsString) + ''' AS DATANASC,       ' +
                  '''' + PreparaStrRegra(qryTitular.FieldByName('INSCRICAODATA').AsString) + ''' AS INSCRICAODATA,       ' +
                  '''' + PreparaStrRegra(sDataCancelamento) + '''    AS DATACANCELAMENTO, ' +
                  '''' + PreparaStrRegra(qryReservaPart.FieldByName('DATAADMISSAO').AsString) + '''    AS DATAADMISSAO,   ' +
                  '''' + qryReservaPart.FieldByName('CODHIERARQUIA').AsString + '''    AS CODHIERARQUIA,  ' +
                  '' + qryReservaPart.FieldByName('INDICEREAJUSTE').AsString + '    AS INDICEREAJUSTE, ' +
                  '' + qryReservaPart.FieldByName('FLGCONTROLE').AsString + '    AS FLGCONTROLE,    ' +

               '''' + PreparaStrRegra(FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date)) + ''' AS DATAREQUERIMENTO, ' +
                  '''' + PreparaStrRegra(FormatDateTime('dd/mm/yyyy', dtDataInicio.Date)) + ''' AS DATAINICIOPAGTO,  ' +

               '''' + PreparaStrRegra(sFlgInternoAntes) + '''  AS FLGINTERNOANT, ' +
                  '''' + PreparaStrRegra(sFlgInternoDepois) + ''' AS FLGINTERNO, ' +
                  '' + PreparaStrRegra(sIdSitPartAntes) + '   AS IDSITPARTATUAL, ' +
                  '' + PreparaStrRegra(sIdSitPlanAntes) + '   AS IDSITPLANOATUAL, ' +
                  '' + PreparaStrRegra(sIdSitFuncAntes) + '   AS IDSITFUNCATUAL, ' +
                  '' + PreparaStrRegra(sIdSitPartDepois) + '  AS IDSITPARTNOVO, ' +
                  '' + PreparaStrRegra(sIdSitPlanDepois) + '  AS IDSITPLANONOVO, ' +
                  '' + PreparaStrRegra(sIdSitFuncDepois) + '  AS IDSITFUNCNOVO, ' +
                  '''' + OraNumero(qryReservaPart.FieldByName('PERCENTUALSAQUE').AsString) + '''         AS PERCENTUALSAQUE ' +
                  ' FROM DUAL ';

               // Quando a variavel iNumReg for > que a variavel iTotReserva significa que
               // já rodei a regra para todas as reservas e estou rodando a ultima vez para
               // pegar o total em real das reservas
               If iNumReg <= iTotReserva
                  Then Begin
                     sValorReservaCota := RegraNumerica(qryBeneficio.FieldByName('IdRegraPagamento').AsString,
                        sSQLReserva, bErro, iIdCalculo);
                     If bErro
                        Then Begin
                           MsgDlg('Erro na Regra de Cálculo de Reserva para Benefício Nº ' + qryBeneficio.FieldByName('IdRegraPagamento').AsString + '.',
                              'Erro', mtError, [mbOk, mbHelp], 0);
                           dValorReservaCota := 0;
                           break;
                        End
                     Else dValorReservaCota := StrToFloat(ClienteNumero(sValorReservaCota));


                     //acumula valor a ser usado na regra de benefício
                     //que é o valor a ser abatido
                     dTotReservaReal := dTotReservaReal + dValorReservaCota;


                     If (qryBeneficio.FieldByName('FlgResgate').AsInteger = 1)
                        Then Begin
                           // Atualizar/inserir reserva na qryMovReservaTemp
                           varFields := VarArrayCreate([0, 1], varVariant);
                           varFields[0] := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
                           varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;
                           If qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva', varFields, [loCaseInsensitive, loPartialKey])
                              Then Begin
                                 qryMovReservaTemp.Edit;
                                 qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat := dValorReservaCota;
                                 qryMovReservaTemp.Post;
                              End
                           Else Begin
                                 qryMovReservaTemp.Insert;
                                 qryMovReservaTemp.FieldByName('IDMOVRESERVATMP').AsInteger := LeUltRegistro(qryAux, 'MOVRESERVATEMP');
                                 qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsInteger := qryReservaPart.FieldByName('IDTIPORESERVA').AsInteger;
                                 qryMovReservaTemp.FieldByName('IDPESSJUR').AsInteger := iIdPessJur;
                                 qryMovReservaTemp.FieldByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
                                 qryMovReservaTemp.FieldByName('IDTITULAR').AsInteger := iIdTitular;
                                 qryMovReservaTemp.FieldByName('IDPESSOA').AsInteger := iIdPessoa;
                                 qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsInteger := iSeqProposta;
                                 qryMovReservaTemp.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
                                 qryMovReservaTemp.FieldByName('IDBENEFICIO').AsInteger := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger;
                                 qryMovReservaTemp.FieldByName('DATAMOV').AsDateTime := StrToDate(sDataRef);
                                 qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat := dValorReservaCota;
                                 qryMovReservaTemp.FieldByName('VLRORIGINAL').AsFloat := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                                 qryMovReservaTemp.Post;
                              End;
                        End;
                     qryReservaPart.Next;
                  End
               Else Begin
                     sValorTotReservaReal := RegraNumerica(qryBeneficio.FieldByName('IdRegraPagamento').AsString,
                        sSQLReserva, bErro, iIdCalculo);
                     If bErro
                        Then Begin
                           MsgDlg('Erro na Regra de Cálculo de Reserva para Benefício Nº ' + qryBeneficio.FieldByName('IdRegraPagamento').AsString + '.',
                              'Erro', mtError, [mbOk, mbHelp], 0);
                           dTotReservaReal := 0;
                           break;
                        End
                     Else dTotReservaReal := StrToFloat(ClienteNumero(sValorTotReservaReal));
                  End;
            End; // while
      End
   Else Begin
         dTotReservaReal := 0;
         qryReservaPart.First;
         While Not qryReservaPart.Eof Do
            Begin


               If qryReservaPart.FieldByName('FLGCONTROLE').AsInteger = 1
                  Then Begin
                     qryReservaPart.Next;
                     continue;
                  End;

               If qryReservaPart.FieldByName('ValorReserva').AsString <> ''
                  Then Begin
                     dValorDaCota := VoltaValorCotacao(qryaux,
                        qryReservaPart.FieldByName('INDICEREAJUSTE').AsString, '', '',
                        FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date)
                        );

                     dTotReservaReal := dTotReservaReal + (qryReservaPart.FieldByName('ValorReserva').AsFloat
                        * dValorDaCota);

                     // Atualizar/inserir reserva na qryMovReservaTemp
                     If (qryBeneficio.FieldByName('FlgResgate').AsInteger = 1)
                        Then Begin
                           varFields := VarArrayCreate([0, 1], varVariant);
                           varFields[0] := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
                           varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;
                           If qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva', varFields, [loCaseInsensitive, loPartialKey])
                              Then Begin
                                 qryMovReservaTemp.Edit;
                                 qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                                 qryMovReservaTemp.Post;
                              End
                           Else Begin
                                 qryMovReservaTemp.Insert;
                                 qryMovReservaTemp.FieldByName('IDMOVRESERVATMP').AsInteger := LeUltRegistro(qryAux, 'MOVRESERVATEMP');
                                 qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsInteger := qryReservaPart.FieldByName('IDTIPORESERVA').AsInteger;
                                 qryMovReservaTemp.FieldByName('IDPESSJUR').AsInteger := iIdPessJur;
                                 qryMovReservaTemp.FieldByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
                                 qryMovReservaTemp.FieldByName('IDTITULAR').AsInteger := iIdTitular;
                                 qryMovReservaTemp.FieldByName('IDPESSOA').AsInteger := iIdPessoa;
                                 qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsInteger := iSeqProposta;
                                 qryMovReservaTemp.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
                                 qryMovReservaTemp.FieldByName('IDBENEFICIO').AsInteger := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger;
                                 qryMovReservaTemp.FieldByName('DATAMOV').AsDateTime := StrToDate(sDataRef);
                                 qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                                 qryMovReservaTemp.FieldByName('VLRORIGINAL').AsFloat := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                                 qryMovReservaTemp.Post;
                              End;
                        End;
                  End;
               qryReservaPart.Next;
            End;
      End;


   Try
      OraNumero(FloatToStr(dTotReservaReal));
   Except
      MsgDlg('O valor calculado para a reserva é inválido. ', 'Erro', mtError, [mbOk, mbHelp], 0);
      Exit;
   End;

   Result := dTotReservaReal;
End;

Function TfrmCadRequerBenefPensionista.AtualizaReservaPart(piIdBeneficio: longint): boolean;
Begin
   Result := False;
   qryMovReservaTemp.First;
   While Not qryMovReservaTemp.Eof Do
      Begin
         If qryMovReservaTemp.FieldByName('IdBeneficio').AsInteger <> piIdBeneficio
            Then Begin
               qryMovReservaTemp.Next;
               continue;
            End;

         If Not qryReservaPart.Locate('IdTipoReserva', qryMovReservaTemp.FieldByName('IdTipoReserva').AsInteger, [loCaseInsensitive])
            Then Begin
               qryMovReservaTemp.Next;
               continue;
            End;

         qryReservaPart.Edit;

         // Só zerar o saldo se o valor original era positivo, pois no caso da CBS pode existir reserva originalmente positivo
         If ((qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat - qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat) < 0) And
            (qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat > 0)
            Then qryReservaPart.FieldByName('ValorReserva').AsFloat := 0
         Else qryReservaPart.FieldByName('ValorReserva').AsFloat := qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
            - qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat;
         qryReservaPart.Post;

         qryMovReservaTemp.Next;
      End; // while

   Result := True;
End;

Procedure TfrmCadRequerBenefPensionista.bbtnOutrasInformacoesClick(
   Sender: TObject);
Var sDataInicioAnt,
   sValorAnt,
      sNomeBenefAnt,
      sIdTpPagtoAnt,
      sFlgBenefMinAnt,
      sUltMesReajAnt,
      sDataFalePensionistaAnt,
      sCodBeneficioAnt: String;

   sValorBase1Ant, sValorBase2Ant, sValorBase3Ant: String;

   iTotalBenef: longint;
Begin
   Inherited;

   BuscaDadosBeneficioAnterior(qryAux,
      iIdPessJur,
      iIdPlanoPrev,
      iIdTitular,
      qryDet.FieldByName('IdBeneficio').AsInteger,
      qryBeneficio.FieldByName('FlgReferencia').AsInteger,
      FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
      sDataInicioAnt,
      sValorAnt,
      sNomeBenefAnt,
      sIdTpPagtoAnt,
      sUltMesReajAnt,
      sFlgBenefMinAnt,
      sDataFalePensionistaAnt,
      sCodBeneficioAnt,
      sValorBase1Ant,
      sValorBase2Ant,
      sValorBase3Ant,
      sNumProcINSS,
      True,
      iIdPensionista
      );

   If sDataInicioAnt = ''
      Then Begin
         sDataInicioAnt := qryDet.FieldByName('DibBenefAnt').AsString;
         sValorAnt := ClienteNumero(qryDet.FieldByName('ValorBenefAnt').AsString);
      End;

   // Exibir dados do benefício anterior. Deixar o usuário informar tais dados
   frmPedeDadosBenefAnterior := TfrmPedeDadosBenefAnterior.Create(Application);
   With frmPedeDadosBenefAnterior Do
      Begin
         If Trim(sDataInicioAnt) = ''
            Then Begin
               lblNomeBenefAnt.Caption := 'Benefício Anterior não Encontrado no Banco de Dados da Fundação';
               lblTituloBenef.Caption := 'Salário de Benefício';
            End
         Else Begin
               lblNomeBenefAnt.Caption := sNomeBenefAnt;
               lblTituloBenef.Caption := 'Renda Mensal Inicial';
            End;

         dtDibBenefAnt.Text := sDataInicioAnt;
         edValorBenefAnt.Text := ClienteNumero(sValorAnt);

         If (qryBeneficio.FieldByName('FlgReferencia').AsInteger = 0) Or (prmNumOPINSS = 0)
            Then Begin
               grpParamINSS.Visible := False;
               Height := 184;
            End
         Else Begin
               grpParamINSS.Visible := True;
               Height := 344;

               iTotalBenef := qryBeneficiario.RecordCount;

               sSQLOpcaoINSS := ' SELECT PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA,  ' +
                  '        PP.INSCRICAOTIPO,                                                                   ' +
                  '        PF.DATANASC, PF.SEXO,  PF.DATAMORTE, PP.IDPESSOA AS IDTITULAR,  PP.SALPARTICIPACAO, ' +
                  '        PP.SALPARTICIPACAO AS VALORPROVENTO,                                                ' +
                  '        EL.SALTOTAL,  EL.DATAADMISSAO, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,' +
                  '        EL.TEMPOSERVTOTAL,  EL.DATADEMISSAO, SP.FLGINTERNO, ' +
                  '        EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, ' +
                  '        PP.IDPESSOA AS IDTITULAR, ' +
                  qryBeneficio.FieldByName('IdBeneficio').AsString + ' AS IDBENEFICIO,      ' +
                  IntToSTr(iNumeroProcesso) + ' AS NUMEROPROCESSO ,  ' +
                  IntToSTr(1) + ' AS FLGTIPOINSS,      ' +

               QuotedStr(FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date)) + ' AS DATAREF,          ' +
                  QuotedStr(FormatDateTime('dd/mm/yyyy', dtInicioFund.Date)) + ' AS DATAINICIO,       ' +
                  '''' + '          ' + ''' AS DATAINICIOINSS, ' +
                  QuotedStr(FormatDateTime('dd/mm/yyyy', dtDataInicio.Date)) + ' AS DATAINICIOPAGTO,  ' +
                  QuotedStr(FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date)) + ' AS DATAREQUERIMENTO, ' +

               IntToStr(iTotalBenef) + '   AS NUMBENEF           ' +
                  ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF  ' +
                  ' WHERE  PP.IDPESSJUR   = ' + IntToStr(iIdPessJur) + ' AND ' +
                  '        PP.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
                  '        PP.IDPESSOA    = ' + IntToStr(iIdTitular) + ' AND ' +
                  '        PP.SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND ' +
                  '        EL.IDPESSJUR   = PP.IDPESSJUR         AND ' +
                  '        EL.IDPESSOA    = PP.IDPESSOA          AND ' +
                  '        PF.IDPESSOA    = EL.IDPESSOA              ';

               If prmNumOpINSS >= 1
                  Then Begin
                     lblNomeBINSS1.Visible := True;
                     edOpcao1.Visible := True;
                     lblNomeBINSS1.Caption := prmNOMEBINSS1;
                     edOpcao1.Text := ClienteNumero(sValorBase1Ant);
                     edOpcao1.Enabled := prmFLGEDITABINSS1;
                  End;

               If prmNumOpINSS >= 2
                  Then Begin
                     lblNomeBINSS2.Visible := True;
                     edOpcao2.Visible := True;
                     lblNomeBINSS2.Caption := prmNOMEBINSS2;
                     edOpcao2.Text := ClienteNumero(sValorBase2Ant);
                     edOpcao2.Enabled := prmFLGEDITABINSS2;
                  End;

               If prmNumOpINSS >= 3
                  Then Begin
                     lblNomeBINSS3.Visible := True;
                     edOpcao3.Visible := True;
                     lblNomeBINSS3.Caption := prmNOMEBINSS3;
                     edOpcao3.Text := ClienteNumero(sValorBase3Ant);
                     edOpcao3.Enabled := prmFLGEDITABINSS3;
                  End;
            End;

         ShowModal;

         If ModalResult = mrOk
            Then Begin
               qryDet.FieldByName('DibBenefAnt').AsString := dtDibBenefAnt.Text;
               qryDet.FieldByName('ValorBenefAnt').AsFloat := StrtoFloat(ClienteNumero(edValorBenefAnt.Text));
               qryDet.FieldByName('VALORBINSSANT1').AsFloat := StrToFloat(ClienteNumero(edOpcao1.Text));
               qryDet.FieldByName('VALORBINSSANT2').AsFloat := StrToFloat(ClienteNumero(edOpcao2.Text));
               qryDet.FieldByName('VALORBINSSANT3').AsFloat := StrToFloat(ClienteNumero(edOpcao3.Text));
            End;

         Free;
      End; // with
End;

Procedure TfrmCadRequerBenefPensionista.bbtnCancelarClick(Sender: TObject);
Begin
   //Otacilio Aquino SOL 160863 Kintana 1381911
     uBeneficio.bGravaEvento := False;
   If (sTipoFormChamador = 'SI') And (Not bPerguntouCancelar)
      Then Begin
         bPerguntouCancelar := True;
         If MsgDlg('Deseja guardar as informações de Tempo de Serviço informadas para a Simulação ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
            Then Begin
               dtmAPrev.qry.Close;
               dtmAPrev.qry.Sql.Clear;
               dtmAPrev.qry.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVTOTAL   = ' + sTempoServAnoAntes + ', ' +
                  '                      TEMPOSERVTOTMES  = ' + sTempoServMesAntes + ', ' +
                  '                      TEMPOSERVTOTDIA  = ' + sTempoServDiaAntes +
                  ' WHERE IDPESSJUR = ' + IntToStr(iIdPessJur) +
                  ' AND   IDPESSOA  = ' + IntToStr(iIdTitular));
               Try
                  dtmAPrev.qry.ExecSQL;
               Except
                  On E: EDBEngineError Do
                     Begin
                        MostrarErro(E);
                        Exit;
                     End;
               End;
            End;
      End;

   Inherited;

End;

Procedure TfrmCadRequerBenefPensionista.sbtnImprimirSimulacaoClick(
   Sender: TObject);
Var sArquivoTemp,
   sSQLTemp,
      sSQL: String;
   iIdReports,
      iOrigemCM: longint;
Begin
   Inherited;

   // Verificar se existe relatorio parametrizavel para Simulacao de Beneficio
   If Trim(sNumeroProcessoAntesGravar) = ''
      Then sNumeroProcessoAntesGravar := IntToStr(iNumeroProcesso);

   With qryAux Do
      Begin
         Close;
         SQL.Clear;
         // Pegar id do relatorio
//         SQL.Add(' SELECT MAX(BP.IDRELATBENEFICIO) AS IDRELATBENEFICIO, MAX(ORIGEMCMBENEFICIO) AS ORIGEMCMBENEFICIO ' +  //Everson TIBERO
         SQL.Add(' SELECT MAX(BP.IDRELATBENEFICIO) AS IDRELATBENEFICIO, MAX(BP.ORIGEMCMBENEFICIO) AS ORIGEMCMBENEFICIO ' + //Everson TIBERO
            ' FROM   BENEFPLANPREV BP, BENEFBFCIARIO BF                              ' +
            ' WHERE  BF.NUMEROPROCESSO = ' + sNumeroProcessoAntesGravar +
            ' AND    BF.IDPLANOORIGEM    = BP.IDPLANOPREV ' +
            ' AND    BF.IDBENEFICIO    = BP.IDBENEFICIO ');
         Open;
         If FieldByName('IdRelatBeneficio').AsInteger <= 0
            Then Begin
               MsgDlg('Não existe relatório parametrizado para Simulação de Benefício. Verifique no Cadastro de Planos Previdenciários. ', 'Erro', mtError, [mbOk], 0);
               sbtnImprimirSimulacao.Down := False;
               qryAux.Close;
               Exit;
            End;
      End;

   // Verificar se foi gerado um IdCalculo para este módulo
   If (iIdCalculo <= 0) And (qryRelBenefPart.IsEmpty)
      Then Begin
         MsgDlg('A Regra de Simulação não gravou, em nenhum passo, os dados de sua execução. Verifique.', 'Erro', mtError, [mbOk], 0);
         sbtnImprimirSimulacao.Down := False;
         qryAux.Close;
         Exit;

         If iIdCalculo <= 0 Then iIdCalculo := qryRelBenefPart.FieldByName('IdCalculo').AsInteger;
      End;

   iIdReports := qryAux.FieldByName('IdRelatBeneficio').AsInteger;
   iOrigemCM := qryAux.FieldByName('OrigemCMBeneficio').AsInteger;

   // Abrir query com SQL do relatorio
   With qryAux Do
      Begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT D.TEMPLATE AS SQL ' +
            ' FROM   REPORTS R, DATAVIEW D        ' +
            ' WHERE  R.IDREPORTS  = ' + IntToStr(iIdReports) +
            ' AND    R.ORIGEMCM   = ' + IntToStr(iOrigemCM) +
            ' AND    D.IDDATAVIEW = R.IDDATAVIEW ' +
            ' AND    D.ORIGEMCMDV = R.ORIGEMCMDV ');
         Open;
         sSQL := FieldByName('SQL').AsString;
      End;

   // Abrir query com LAY-OUT do relatorio. Para isto, o campo TEMPLATE tem
   // que estar no FieldsEditor e a query tem que ser RequestLive
   With dtmRelatAdmPREV2.qryDoUsuario Do
      Begin
         Close;
         ParamByName('IdReports').AsInteger := iIdReports;
         ParamByName('OrigemCM').AsInteger := iOrigemCM;
         Open;
         If IsEmpty
            Then Begin
               MsgDlg('Faltam parâmetros para o relatório parametrizado para Simulação de Benefício. Verifique no Cadastro de Planos Previdenciários. ', 'Erro', mtError, [mbOk], 0);
               sbtnImprimirSimulacao.Down := False;
               qryAux.Close;
               Close;
               Exit;
            End;
      End;

   With dtmRelatAdmPREV2 Do
      Begin
         sArquivoTemp := Sistema.TempDir + 'APrevRelSimulaBenef.tmp';
         sSQLTemp := Sistema.TempDir + 'APrevSQLRelSimulaBenef.sql';
         qryDoUsuarioTEMPLATE.SaveToFile(sArquivoTemp);

         qryRelatParametrizavel.Close;
         qryRelatParametrizavel.SQL.Clear;
         qryRelatParametrizavel.SQL.Text := sSQL;
         qryRelatParametrizavel.SQL.Add(' AND DETCALCULO.IDCALCULO = ' + IntTostr(iIdCalculo));
         qryRelatParametrizavel.SQL.Add(' AND DETCALCULO.IDPESSOA  = ' + IntTostr(iIdTitular));
         qryRelatParametrizavel.SQL.SaveToFile(sSQLTemp);
         qryRelatParametrizavel.Open;

         dsRelatParametrizavel.DataSet := qryRelatParametrizavel;
         pplRelatParametrizavel.DataSource := dsRelatParametrizavel;
         rpRelatParametrizavel.Template.SaveTo := stFile;
         rpRelatParametrizavel.Template.Format := ftBinary;
         rpRelatParametrizavel.Template.FileName := sArquivoTemp;
         rpRelatParametrizavel.Template.LoadFromFile;
         rpRelatParametrizavel.DataPipeline := pplRelatParametrizavel;

         TFrmPreview.CreateModalPreview(Application, rpRelatParametrizavel, 'AdmPREV - ' + frmCadRequerBenefPensionista.Caption);

         DeleteFile(sArquivoTemp);
         DeleteFile(sSQLTemp);
      End;

End;

Procedure TfrmCadRequerBenefPensionista.bbtnProcParticipanteClick(
   Sender: TObject);
Var sTempoServAnoDigitado,
   sTempoServMesDigitado,
      sTempoServDiaDigitado: String;
Begin
   MontaSelectPart.Executar;

   If (MontaSelectPart.ValoresChave.Count > 0) And (MontaSelectPart.ValoresChave[0] <> '')
      Then Begin
         iIdTitular := StrToInt(MontaSelectPart.ValoresChave[0]);
         iIdPessJur := StrToInt(MontaSelectPart.ValoresChave[1]);
         iIdPlanoPrev := StrToInt(MontaSelectPart.ValoresChave[2]);
         iSeqProposta := StrToInt(MontaSelectPart.ValoresChave[7]);
         iIdPensionista := StrToInt(MontaSelectPart.ValoresChave[9]);
         bQueryTitular := False;
         bQuerySalarios := False;
         bQueryContribuicoes := False;

         If sTipoFormChamador = 'SI'
            Then Begin
               Application.CreateForm(TfrmLerTempoServico, frmLerTempoServico);
               frmLerTempoServico.ShowModal;
               If frmLerTempoServico.ModalResult <> mrOk
                  Then Exit;
               sTempoServAnoDigitado := OraNumero(frmLerTempoServico.edTempoServTotal.Text);
               sTempoServMesDigitado := OraNumero(frmLerTempoServico.edTempoServMes.Text);
               sTempoServDiaDigitado := OraNumero(frmLerTempoServico.edTempoServDia.Text);
               frmLerTempoServico.Free;

               dtmAPrev.qry.Close;
               dtmAPrev.qry.Sql.Clear;
               dtmAPrev.qry.Sql.Add(' SELECT TEMPOSERVTOTAL, TEMPOSERVTOTMES, TEMPOSERVTOTDIA  ' +
                  ' FROM   ELEGPATRO ' +
                  ' WHERE  IDPESSJUR = ' + IntToStr(iIdPessJur) + ' AND ' +
                  '        IDPESSOA  = ' + IntToStr(iIdTitular));
               dtmAPrev.qry.Open;

               sTempoServAnoAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTAL').AsString);
               sTempoServMesAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTMES').AsString);
               sTempoServDiaAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTDIA').AsString);

               dtmAPrev.qry.Close;
               dtmAPrev.qry.Sql.Clear;
               dtmAPrev.qry.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVTOTAL   = ' + sTempoServAnoDigitado + ', ' +
                  '                      TEMPOSERVTOTMES  = ' + sTempoServMesDigitado + ', ' +
                  '                      TEMPOSERVTOTDIA  = ' + sTempoServDiaDigitado +
                  ' WHERE IDPESSJUR = ' + IntToStr(iIdPessJur) +
                  ' AND   IDPESSOA  = ' + IntToStr(iIdTitular));
               Try
                  dtmAPrev.qry.ExecSQL;
               Except
                  On E: EDBEngineError Do
                     Begin
                        MostrarErro(E);
                        Exit;
                     End;
               End;
               bPerguntouCancelar := False;
            End;
         { iIdPlanoPrev trocado por iIdPlanoPrevTit }
         PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrevTit, iSeqProposta, iIdPensionista);
      End; // if montasel.valoreschave.count > 0
End;

Procedure TfrmCadRequerBenefPensionista.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   sTipoTelaBenef := '';
   //Marcos Merola SOL161215  07/11/2011 Inicio
  // qryUser.Close;Retirado pelo SOL 206918
   //Marcos Merola SOL161215  07/11/2011 Fim

   FinalizaEP;
   Inherited;
   //BRUNO AZEVEDO SOL 137519 KINTANA 831220
   // SOL124279 - Daniel Begnami
   //If (dtmBaseDados.dbBaseDados.InTransaction) And (sTipoFormChamador = 'CO') Then Begin // Renato Visoni SOL 128888 Kintana 695913
   //      dtmBaseDados.dbBaseDados.RollBack;
   //      ShowMessage('Existe uma transação em aberto. A Transação será cancelada!');
   //   End;
   // FIM SOL124279 - Daniel Begnami
   If (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
     dtmBaseDados.dbBaseDados.RollBack;
   end;
   //BRUNO AZEVEDO SOL 137519 KINTANA 831220
End;

Procedure TfrmCadRequerBenefPensionista.sbtnCadContaCorrenteClick(
   Sender: TObject);
Begin
   Inherited;
   // passa o parametro da qrycontabancaria pra o cadastro, para certificar que o recebedor(efetivo),
   // é o dono da conta (idresponsavel ou idpessoa)

   FrmCadContaRequerBenef := TFrmCadContaRequerBenef.Create(Self);
   FrmCadContaRequerBenef.qry.Close;
   FrmCadContaRequerBenef.qry.ParamByName('IDPESSOA').AsInteger :=
      qryContaBancaria.ParamByName('IdPessoa').AsInteger;
   FrmCadContaRequerBenef.qry.Open;
   FrmCadContaRequerBenef.iIdPessoa :=
      qryContaBancaria.ParamByName('IdPessoa').AsInteger;
   FrmCadContaRequerBenef.ShowModal;

   PreencheDadosBeneficiario(iNumeroProcesso, iIdTitular,
      qryDet.FieldByName('IdPessoa').AsInteger,
      iIdPessJur, iIdPlanoPrev, iSeqProposta);
   sbtnCadContaCorrente.dOWN := fALsE;
End;

Procedure TfrmCadRequerBenefPensionista.reValorSRBBtnClick(Sender: TObject);
Var rValorSRB: double;
   bErro: boolean;
   sSQLBenefAssoc,
      sMsgErro: String;
   iIdCalculoAnt,
      iIdRegraCalculo: longint;
Begin

   Inherited;

   If qryBeneficio.FieldByName('IdRegraSRB').AsInteger <= 0 Then Exit;

   frmAguarde.Mostra('Regra de Cálculo do SRB - Nº ' + qryBeneficio.FieldByName('IdRegraSRB').AsString);

   sSQLBenefAssoc := MontaSQLBenefAssoc(qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

   // Executar regra de calculo do beneficio
   Try
      rValorSRB := 0;
      iIdCalculoAnt := iIdCalculo;

      rValorSRB := ExecutaRegraCalculoSRB(qryAux,
         qryBeneficio.FieldByName('IdRegraSRB').AsInteger,
         iIdPessJur,
         iIdPlanoPrev,
         iIdTitular,
         iSeqProposta,
         qryBeneficio.FieldByName('IdBeneficio').AsInteger,
         iNumeroProcesso,
         iIdSitFunc, iIdSitPart, iIdSitPlanoPrev,
         rOpcao1,
         rOpcao2,
         rOpcao3,
         sSQLBenefAssoc,
         FormatDateTime('dd/mm/yyyy', dtMortePensionista.Date),
         FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),
         '',
         FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),
         FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),
         '0',
         '0',
         '0',
         False,
         0,
         qryDet.FieldByName('DibBenefAnt').AsString,
         qryDet.FieldByName('ValorBenefAnt').AsString,
         qryDet.FieldByName('VALORBINSSANT1').AsString,
         qryDet.FieldByName('VALORBINSSANT2').AsString,
         qryDet.FieldByName('VALORBINSSANT3').AsString,
         bErro,
         sMsgErro,
         iIdCalculo,
         0
         );
   Except
      frmAguarde.Apaga;
   End;
   frmAguarde.Apaga;

   If bErro Then
      Begin
         MsgDlg(sMsgErro, 'Erro', mtError, [mbOk, mbHelp], 0);
         reValorSRB.Text := '0';
         Exit;
      End;

   If iIdCalculo = 0 Then
      iIdCalculo := iIdCalculoAnt;

   reValorSRB.Text := FormatFloat('#0.00', rValorSRB);
End;

Procedure TfrmCadRequerBenefPensionista.sbtnDemonsSRBClick(Sender: TObject);
Begin
   Inherited;
   If Not qryDet.Active
      Then Begin
         sbtnDemonsSRB.Down := False;
         Exit;
      End;
   Try
      iIdCalculoGeral := iIdCalculo;
      frmPRelDemosBenef := TfrmPRelDemosBenef.Create(Application);
      If Not frmPRelDemosBenef.DisparaRelatorio('M',
         IntToStr(iIdTitular),
         IntToStr(iIdPessoa),
         IntToStr(iIdPessJur),
         IntToStr(iIdPlanoPrev),
         IntToStr(iNumeroProcesso),
         qryDet.FieldByName('DATAINICIOFUND').AsString,
         '')
         Then Begin
            MsgDlg('Erro ao Montar Demonstrativo de Cálculo.', 'Erro', mtError, [mbOk], 0);
            Exit;
         End;
   Finally
      frmPRelDemosBenef.Free;
      iIdCalculoGeral := 0;
      sbtnDemonsSRB.Down := False;
   End;

End;


Procedure TfrmCadRequerBenefPensionista.dblkpcmbPensionistaChange(
   Sender: TObject);
Begin
   Inherited;
   { Troca plano para o do Beneficiario }
   qryBeneficio.Close;
   qryBeneficio.ParamByName('IdEventoGerador').Value := FIdEvento; // SOL 170753 Kintana 1529212     //edilaine - SIG84020
   qryBeneficio.ParamByName('IdPlanoPrev').Value := iIdPlanoPrev;
   qryBeneficio.Open;
   If iIdEvento = 4 Then // SOL 170753 Kintana 1529212
         Begin
            qryBeneficio.Filter := 'FLGPECULIO = 1'; // SOL 170753 Kintana 1529212
            qryBeneficio.Filtered := True; // SOL 170753 Kintana 1529212
         end
         else
             begin
            qryBeneficio.Filtered := False; // SOL 170753 Kintana 1529212
            dblkpcmbBeneficio.Text := qryDet.FieldByName('Nome').AsString;   //edilaine - SIG84020
             end
End;

Procedure TfrmCadRequerBenefPensionista.reValorBeneficioBtnClick(
   Sender: TObject);
Var rPercProvisorio,
   rValorReserva,
      rValorBeneficio: double;
   bErro: boolean;
   sSQLBenefAssoc,
      sValorReserva,
      sMsgErro: String;
   iIdCalculoAnt,
      iIdBeneficio: LongInt;
Begin
   Inherited;
   If Trim(dblkpcmbBeneficio.Text) = ''
      Then Begin
         MsgDlg('Preencha o Benefício.', 'Erro', mtError, [mbOk, mbHelp], 0);
         If (dblkpcmbBeneficio.Enabled) And (dblkpcmbBeneficio.visible) Then
            dblkpcmbBeneficio.SetFocus;
         Exit;
      End;


   frmAguarde.Mostra('Regra de Cálculo de Benefício - Nº ' + qryBeneficio.FieldByName('IdRegraCalculo').AsString);

   sSQLBenefAssoc := MontaSQLBenefAssoc(qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

   // Executar regra de calculo do beneficio
   Try
      iIdCalculoAnt := iIdCalculo;

      rValorBeneficio := ExecutaRegraCalculoBeneficioBfciario(qryAux,
         qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
         -1,
         iIdPessJur,
         iIdPlanoPrev,
         iIdTitular,
         iSeqProposta,
         qryBeneficio.FieldByName('IdBeneficio').AsInteger,
         iNumeroProcesso,
         iNumBenef,
         rOpcao1, rOpcao2, rOpcao3,
         sSQLBenefAssoc,
         dtMortePensionista.Text,
         dtInicioFund.Text,
         '',
         reValorTotal.Text,
         '0',
         '0',
         FloatToStr(rValorReserva),
         bErro,
         sMsgErro,
         iIdCalculo,
         iIdPensionista,
         qryBeneficiario.FieldByName('IdDependencia').AsString,
         qryBeneficiario.FieldByName('Percentual').AsString,
         1,
         qryDet.FieldByName('DibBenefAnt').AsString,
         qryDet.FieldByName('ValorBenefAnt').AsString,
         FormatDateTime('YYYY/MM', qryDet.FieldByName('DATAINICIO').AsDateTime),
         iIdPensionista,
         qryDet.FieldByName('FLGPROVISORIO').AsInteger,
         qryDet.FieldByName('PRAZOPROVISORIO').AsInteger,
         qryDet.FieldByName('PERCPROVISORIO').AsFloat,
         0,
         qryDet.FieldByName('DATAREQUERIMENTO').AsString,
         2
         );
   Except
      frmAguarde.Apaga;
   End;
   frmAguarde.Apaga;

   If iIdCalculo = 0
      Then iIdCalculo := iIdCalculoAnt;

   If bErro Then
      Begin
         MsgDlg(sMsgErro, 'Erro', mtError, [mbOk, mbHelp], 0);
         rValorReal := 0;
         rValorCotas := 0;
         reValorBeneficio.Text := '0';
         Exit;
      End;

   // Se for beneficio provisorio, calcular o percentual de concessao
   If (dbrgrpBenefProvisorio.ItemIndex = 1) And
      (Trim(dbedPercConc.Text) <> '') Then
      Begin
         rPercProvisorio := StrToFloat(ClienteNumero(dbedPercConc.Text));
         rValorReal := (rPercProvisorio / 100) * rValorBeneficio;
      End
   Else
      Begin
         rValorReal := rValorBeneficio;
      End;


   If qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1 Then
      rValorCotas := rValorReal;

   If qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1 Then
      reValorBeneficio.Text := FormatFloat('#0.000000', rValorCotas)
   Else
      reValorBeneficio.Text := FormatFloat('#0.00', rValorReal);

   bRecalculouProvisorio := True;
End;

procedure TfrmCadRequerBenefPensionista.dbeMatriculaBenefExit(
  Sender: TObject);
var
  xQry: TwwQuery;
begin
  inherited;
  iIdPessoa := qryBeneficiario.FieldByName('IDPESSOA').AsInteger;
  try
    xQry := TwwQuery.Create(Self);
    with xQry do begin
      DatabaseName := 'BaseDados';
      Close;
      Sql.Clear();
      Sql.Add('SELECT IDPESSOA, ');
      Sql.Add('       MATRICULA AS MATRICULA' );
      Sql.Add('  FROM DEPENTIT ');
      Sql.Add(' WHERE MATRICULA =  ' + QuotedStr(dbeMatriculaBenef.Text));
      Sql.Add(' AND   IDPESSOA  <> ' + Inttostr(iIdPessoa));  //SOL 169376 Kintana 1501396
      //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
      if (MatriculaBenefInicial <> '') then begin
        SQL.Add('   AND MATRICULA <> ' + QuotedStr(MatriculaBenefInicial));
      end;
      //BRUNO AZEVEDO SOL 164472 KINTANA 1442193
      Open;
    end;

    if xQry.Recordcount > 0 then begin
      MsgDlg('Matrícula já existe. ','Informação',mtInformation,[mbOk],0);
    end;
  finally
    FreeAndNil(xQry);
  end;
end;
//BRUNO AZEVEDO SOL 164472 KINTANA 1442193

procedure TfrmCadRequerBenefPensionista.PesqBeneficio;
begin
   qryBeneficio.Close;
   qryBeneficio.ParamByName('IdEventoGerador').Value := FIdEvento; // SOL 170753 Kintana 1529212
   qryBeneficio.ParamByName('IdPlanoPrev').AsInteger := iIdPlanoPrevTit;
   qryBeneficio.Open;

   qryBeneficio.Filter := 'FLGPECULIO = 1'; // SOL 170753 Kintana 1529212
   qryBeneficio.Filtered := FIdEvento = 4;  // SOL 170753 Kintana 1529212
end;
procedure TfrmCadRequerBenefPensionista.DbLAlteradorKeyPress(
  Sender: TObject; var Key: Char);
begin
   inherited;
   if Key <> #0 then
       Key := #0;
end;


// edilaine - SOL 262968 / PPM 1102753
procedure TfrmCadRequerBenefPensionista.GeraDemonstrativo(const HoraHomologacao: String);
var
  iIdReport  : integer;
  sMensagem  : String;
  bDemonstraOK : boolean;
  iFontePagadora : integer;
  sTemAlterador : string;
  bConcessaoResgate : boolean;    // edilaine - SOL 253577-18174 / PPM 1327585
begin
   {Busca ID do report}
   if sParametrosDemonstra = emptyStr then
      iFontePagadora := qryDet.FieldByname('FONTEPAGADORA').AsInteger
   else
   begin
     iFontePagadora := StrToInt(copy( sParametrosDemonstra, pos('FONTEPAG', sParametrosDemonstra)+9, 1));
     sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'FONTEPAG='+IntToStr(iFontePagadora), '', []);
   end;

   // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
   {iIdReport := -1;
   qryAux.close;
   if iFontePagadora = 1 then
      qryAux.sql.Text := 'Select idreports from reports where idmodulo = 454 and name = ''Demonstrativo de Concessão de Benefícios'' '
   else
      qryAux.sql.Text := 'Select idreports from reports where idmodulo = 454 and name = ''Demonstrativo de Concessão de Benefícios do INSS'' ';
   qryAux.Open;
   if not qryAux.IsEmpty then
      iIdReport := qryAux.Fields[0].AsInteger;
   }// edilaine - SOL 253577-18174 / PPM 1327585 - fim

   sTemAlterador := iff(Trim(dblAlterador.text) = '', 'N', copy(dblAlterador.text,1,1));

   bConcessaoResgate := VerificaLoteRestage(iIdLoteConcessao);    // edilaine - SOL 253577-18174 / PPM 1327585

   if iFontePagadora = 1 then
   begin
      // edilaine - SOL 253577-18174 / PPM 1327585 {no sParametrosDemonstra foi substituido o delimitador  |=| por |  apenas}
      if sParametrosDemonstra = emptyStr then
         sParametrosDemonstra := InttoStr(iIdLoteConcessao) + '| ' +   // numLote
                                 InttoStr(iIdTitular)       + '| ' +   // idtitular
                                 InttoStr(iIdPessJur)       + '| ' +   // idPessJur
                                 InttoStr(iIdPlanoPrev)     + '| ' +   // idPlanoPrev
                                 InttoStr(iSeqProposta)     + '| ' +   // iSegProposta
                                 //qry.FieldbyName('NumeroProcesso').AsString + '|=| ' +   //numprocesso       // edilaine - SOL 270961 / PPM 1342333
                                 'PROC'+sNumeroProcessoAntesGravar+ '| ' +   //numprocesso                   // edilaine - SOL 270961 / PPM 1342333
                                 ''  + '| ' +   // sEvento
                                 ''  + '| ' +   // sDataEvento
                                 sdataInicioConcessao       + '| ' +   // sDataHoraConcessao
                                 sTemAlterador              + '| ' +   // FlgCorrecoes
                                 'HERDEIRO'                 + '| ' +   // Tipo concessao
                                 'visualiza|'                            // sDtHrHomologacao
      else
      begin   // edilaine - SOL 270961 / PPM 1342333 - inicio
        sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'PROC'+sNumeroProcessoAntesGravar, 'PROC'+sListaProcessos, []);
        sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'visualiza|', HoraHomologacao+'|', []);
      end;    // edilaine - SOL 270961 / PPM 1342333 - fim

      // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
      try
        try
          RptDemonstraConcessao :=  TRptDemonstraConcessao.create(self);
          with RptDemonstraConcessao do
          begin

            MontaSQLRelatorio;   //edilaine - SIG55933
            AbreConsultas(sParametrosDemonstra);

            if (HoraHomologacao = '') or (bConcessaoResgate) then
               TFrmPreview.CreateModalPreview(Application, rpDemonstraConcessaoFuncef, 'Concessão de Benefícios')
            else
               SalvarArquivoDemonstrativo();

            bDemonstraOK := true;
          end;
        except
          bDemonstraOK := false;
        end;
      finally
        RptDemonstraConcessao.free;
      end;

      {bDemonstraOK := TRptDemonstraConcessao.PrintReport(iIdReport,1, Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo,
                                                 sParametrosDemonstra,
                                                 '',
                                                 'BaseDados',
                                                 Sistema.NomeEmpresa,
                                                 Sistema.NomeModulo,
                                                 sMensagem);
      }// edilaine - SOL 253577-18174 / PPM 1327585 - fim

      sParametrosDemonstra := sParametrosDemonstra + 'FONTEPAG='+qryDet.FieldByname('FONTEPAGADORA').AsString;
   end
   else
   begin
      // edilaine - SOL 253577-18174 / PPM 1327585 {no sParametrosDemonstra foi substituido o delimitador  |=| por |  apenas}
      if sParametrosDemonstra = emptyStr then
         sParametrosDemonstra := 'PROC'+sNumeroProcessoAntesGravar+ '| ' +   //numprocesso                   // edilaine - SOL 270961 / PPM 1342333
                                 //qry.FieldbyName('NumeroProcesso').AsString + '|=| ' +   //numprocesso       // edilaine - SOL 270961 / PPM 1342333
                                 InttoStr(iIdLoteConcessao) + '| ' +   // numLote
                                 InttoStr(iSeqProposta)     + '| ' +   // iSegProposta
                                 InttoStr(iIdPessJur)       + '| ' +   // idPessJur
                                 InttoStr(iIdPlanoPrev)     + '| ' +   // idPlanoPrev
                                 qryDet.FieldByName('IDPLANPREVCONTAB').AsString + '| ' + // idPlanoPrevContab
                                 qryDet.FieldByName('IDPLANOORIGEM').AsString    + '| ' + // idPlanoOrigem
                                 InttoStr(iIdTitular)       + '| ' +   // idtitular
                                 'visualiza|'
      else
      begin  // edilaine - SOL 270961 / PPM 1342333 - inico
        sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'PROC'+sNumeroProcessoAntesGravar, 'PROC'+sListaProcessos, []);
        sParametrosDemonstra := stringreplace(sParametrosDemonstra, 'visualiza|', HoraHomologacao+'|', []);
      end;   // edilaine - SOL 270961 / PPM 1342333 - fim

      // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
      try
        try
          RptDemonstraConcessaoINSS :=  TRptDemonstraConcessaoINSS.create(self);
          with RptDemonstraConcessaoINSS do
          begin

            AbreConsultas(sParametrosDemonstra);

            if (HoraHomologacao = '') or (bConcessaoResgate) then
               TFrmPreview.CreateModalPreview(Application, rpDemonstraConcessaoINSS, 'Concessão de Benefícios')
            else
               SalvarArquivoDemonstrativo();

            bDemonstraOK := true;
          end;
        except
          bDemonstraOK := false;
        end;
      finally
        RptDemonstraConcessaoINSS.free;
      end;


      {bDemonstraOK := TRptDemonstraConcessaoINSS.PrintReport(iIdReport,1, Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo,
                                                sParametrosDemonstra,
                                                '',
                                                'BaseDados',
                                                Sistema.NomeEmpresa,
                                                Sistema.NomeModulo,
                                                sMensagem);
      }// edilaine - SOL 253577-18174 / PPM 1327585 - inicio

      sParametrosDemonstra := sParametrosDemonstra + 'FONTEPAG='+qryDet.FieldByname('FONTEPAGADORA').AsString;

   end;


   if not bDemonstraOK then
      MsgDlg(sMensagem, 'Impressão do Demonstrativo de Concessão.', mtError, [], 0);

end;


End.

