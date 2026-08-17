unit FCadRequerBenefBfciario;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Augusto
// Data        : 24/10/2007
// Rotina      : bbtnOkDetClick
// Pendência   : 26707
// Descricao   : Incluir IDSITPART na query de Plano Contabil
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 03/09/2007 - 06/09/2007 - 28/09/2007 
// Rotina      : CalculaReservaParaBeneficio
// Pendência   : 26280
// Descricao   : Passar dados de rateiro para a regra de calculo da reserva
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 01/08/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 07/05/2007
// Pendência   : 19061
// Rotina      : bbtnOpcoesClick
// Descricao   : Enviar e receber o IDCALCULO para as opções 
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 19/06/2007
// Pendência   : 25647
// Rotina      : VerificaContribAtrasada
// Descricao   : Acerto na query para considerar apenas as contribuições com
//               sitrecebimento 0, 1 e 3
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 07/05/2007
// Pendência   : 19061
// Rotina      : bbtnOpcoesClick
// Descricao   : Enviar e receber o IDCALCULO para as opções 
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 02/05/2007
// Pendência   : 24849
// Rotina      : bbtnProcurarClick
// Descricao   : Retirado o FLGDESATIVADO
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 26/02/2007
// Pendência   : 24579
// Rotina      : 1) QryTitular
// Descricao   :    Retirado o FLGDESATIVADO
//               2) BuscaPlanoOrigem
//                  Voltar a usar o plano selecionado por causa do saldamento.
//               3) MostraDemonstrativoConcessao
//                  Acerto na consulta das contribuições para voltar a pesquisar a HSTCONTRIBPREV
// Data        : 05/04/2007
// Pendência   : 25017
// Rotina      : ConcedeUmBeneficio
// Descricao   : Acerto no controle da DATAFINAL
// Data        : 24/04/2007
// Pendência   : 25178
// Rotina      : ConcedeUmBeneficio
// Descricao   : Inclusão de rotina para no caso de concessão de INSS fora do convenio
//               gerar movimento de retenção 
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 29/01/2007
// Pendência   : 24334
// Rotina      : várias
// Descricao   : Forçado formato de datas para 'dd/mm/yyyy' em todas as rotinas do form,
//               substituindo-se DateToStr() por FormatDateTime
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 23/01/2007
// Pendência   : 24270
// Rotina      : ForShow
// Descricao   : Acerto na pesquisa do processo a exibir quando vindo de evento para
//               exibir somente processos de pensionistas
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 09/01/2007
// Pendência   : 24027
// Rotina      : MostraDemonstrativoConcessao
// Descricao   : Acerto no demonstrativo para mostrar corretamente os
//               beneficiários envolvidos.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 03/01/2007
// Pendência   : 22208
// Rotina      : TestaQuitacaoDividas
// Descricao   : Permitir que seja feita uma concessão sem quitar um empréstimo
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 24/10/2006
// Pendência   : 23246
// Rotina      : VerificaProcessoEncerrado
// Descricao   : Implementação de nova rotina para reabrir processo no requerimeno.
//--------------------------------------------------------------------------------------------------
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
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 13/09/2006
// Rotina      : bbtnOkDetClick
// Descricao   : Incluir IDSITPLANOPREV na query de Plano Contabil
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 20/07/2006
// Rotina      : 21787
// Descricao   : 1) Converter o preview do ReportBuilder para o FPreview
//--------------------------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 18/07/2006
// Pendência   : 22739
// Rotina      : ConcedeUmBeneficio (em 2 pontos distintos)
// Descricao   : Não estava gravando a concessão se a data de término do benefício fosse anterior a hoje, ie,
//                se o benefício já fosse concedido encerrado. Gleyber: a data de concessão deve ser sempre
//                gravada (pq pode ser concessão retroativa)
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 03/07/2006
// Rotina      : 21883
// Descricao   : Correção para concessão de benefício de participante cancelado
//               pegar o calendário de assistido.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 29/03/2006 - 30/03/2006
// Rotina      : 21861
// Descricao   : 1) Novo controle de Convenio
//               2) Novo controle de Acompanhante (antigo ainda existe)
//               3) Acerto no demonstrativo de concessão para não exibir os FLGENVIADO = 8
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 02/02/2006
// Pendência   : 21431
// Rotina      : qryDetBeforePost
// Descricao   : Não atualizar o VALORNADIB quando for Concessão
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 24/01/2006
// Pendência   : 21195
// Rotina      : sbtnDemonsSRBClick
// Descricao   : Novo parametro para a função DisparaRelatorio. IDPESSOA.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Rotina      : CobraContribAtrasada
// Data        : 11/01/2006
// Pendência   : 19538
// Alteração   : Inclusão de dois novos parâmetros (sPlaContaDProvis e sPlaContaCProvis)
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 11/01/2006
// Pendência   : 19531
// Rotina      : Varias
// Descricao   : Atualizar o campo FLGPAGAINSS da BENEFBFCIARIO
//--------------------------------------------------------------------------------------------------
// Rotinas     : MostraDemonstrativoConcessao
// Autor(a)    : Augusto
// Data        : 23/11/2005 - 24/11/2005
// Pendência   :
// Descricao   : Incluir novas informações no demonstrativo de concessão
//--------------------------------------------------------------------------------------------------
//  Autor(a)   : Augusto
//  Rotina     : CmeCadastroConfirma
//  Data       : 03/11/2005
//  Pendencia  : 20602
//  Alteração  : Atualizar campo VALORNADIB quando na manutenção
//--------------------------------------------------------------------------------------------------
//  Autor(a)   : Bruno Bastos
//  Rotina     : CobraContribAtrasada
//  Data       : 25/10/2005
//  Pendencia  : 20518
//  Alteração  : Atribui a uma variável o número do recebimento retornado pela
//               função InsereHstContribPrev
//--------------------------------------------------------------------------------------------------
//  Autor(a)   : Augusto
//  Rotina     : dblkpcmbBeneficiarioCloseUp
//  Data       : 04/10/2005
//  Pendencia  : 20357
//  Alteração  : Cancela processo caso beneficio já tenha sido requerido para a pessoa
//--------------------------------------------------------------------------------------------------
//  Autor(a)   : Gleyber
//  Rotina     : CobraContribAtrasada
//  Data       : 12/09/2005
//  Pendencia  : 20169
//  Alteração  : Inclusão de novo parâmetro (sNaturezaDocumento) na chamada da rotina
//               dtmAPrevIntegraBack.BuscaInfIntegra
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : bbtnOkDetClick, bbtnOpcoesClick e dblkpcmbBeneficioCloseUp
//  Data       : 01/08/2005
//  Pendência  : 19060
//  Descrição  : Criar replicação de opção para todos os beneficiários de um benefício
//--------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : ConcedeUmBeneficio
//  Data       : 06/07/2005
//  Pendência  : 19637
//  Descrição  : atualizar IDSITBENEFICIO para 3, encerrado, caso a datafinal seja anterior a atual
//--------------------------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : CalculaReservaParaBeneficio
//  Data       : 30/06/2005
//  Pendência  : 19575
//  Descrição  : não somar reservas de controle ao passar o somatório de reservas para a regra de
//               cálculo do benefício
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : dblkpcmbBeneficioCloseUp
//  Data       : 03/06/2005
//  Pendência  : 18637
//  Descrição  : Alteração para criticar se benefício já foi requerido em outro processo
//               apenas se o form chamador for diferente de SIMULAÇÃO.
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : EfetuaConcessao
//  Data       : 01/06/2005
//  Pendência  : 17806
//  Descrição  : Acrescentada crítica para verificação da data da DIB não ser
//               anterior à do pagamento do lote.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 17/05/2005
// Pendencia   : 18560
// Rotina      : TestaQuitacaoDividas
// Alteração   : Testar Saldo da quitação do Emprestimo
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 28/04/2005
// Pendencia   :
// Rotina      : chamadas da função dtmAPrevIntegraBack.BuscaInfIntegra
// Alteração   : passagem do parâmetro sMsgErro para a função dtmAPrevIntegraBack.BuscaInfIntegra, para que esta retorne
//               uma possível mensagem de erro, já que ela não aciona mais um MSGDLG diretamente
//--------------------------------------------------------------------------------------------------
// Rotina      : EfetuaConcessao e sbtnConcederClick
// Autor(a)    : Gleyber
// Pendência   : 18306
// Data        : 14/04/2005
// Descricao   : Mudança da rotina RodaPadraoMovReserva de lugar
//--------------------------------------------------------------------------------------------------
// Rotina      : CmeCadastroConfirma, CmeCadastroCancel,
//               CalculaReservaParaBeneficio e DesindexaReserva
// Autor(a)    : Gleyber
// Pendência   : 18272
// Data        : 23/03/2005
// Descricao   : criação do campo FLGDESINDRES para a opção de DESINDEXAR RESERVA
//               ATÉ A DATA DO EVENTO
//--------------------------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : ConcedeUmBeneficio
//  Data       : 10/03/2005 
//  Descrição  : Atualizar sempre os valores do beneficio depois do preparo
//--------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : ConcedeUmBeneficio
//  Data       : 17/02/2005
//  Pendência  : 18314
//  Descrição  : Considerar para benefícios que tenham quitação automática.
//--------------------------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : ConcedeUmBeneficio
//  Data       : 31/01/2005
//  Pendência  : 18314 / 16939
//  Descrição  : Atualização dos campos necessários para encerrar benefício em
//               caso de quitação automática.
//--------------------------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : CmeCadastroCancel
//  Data       : 14/01/2005
//  Descrição  : Chamar Rollback somente se for Concessão
//  Data       : 06/01/2005
//  Descrição  : Executar um Rollback ao cancelar Processo
//  Rotina     : bbtnOkDetClick
//  Data       : 22/12/2004
//  Rotina     : Acerto na visualização do FrmAguarde
//  Data       : 19/11/2004
//  Pendencia  : 16931
//  Descrição  : Quando beneficio for de Resgate, Numero do Processo não é obrogatório
//--------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : -----
//  Data       : 23.10.2004
//  Pendencia  : 17865
//  Descrição  : Acerto em erro de ortografia ( "da beneficio" )
//--------------------------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : -----
//  Data       : 20.10.2004
//  Pendencia  : 17578
//  Descrição  : Filtrar planos ativos (PLANPREVCONTABIL.ATIVO = S)
//--------------------------------------------------------------------------------------------------
// Rotina      : dblkpcmbBeneficioCloseUp
// Autor(a)    : Augusto
// Data        : 13/10/2004
// Descricao   : Demonstrar caso a pessoa já possua este beneficio
//--------------------------------------------------------------------------------------------------
// Rotina      : reValorBeneficioBtnClick / reValorTotalBtnClick
// Autor(a)    : Augusto
// Data        : 21/09/2004
// Descricao   : Inicializar variavel bOk
// Pendência   : 17722
// Data        : 20/09/2004
// Descricao   : Novo parametro para função
//--------------------------------------------------------------------------------------------------
// Rotina      : qryDetBeforePost
// Autor(a)    : Camille
// Data        : 17.09.2004
// Descricao   : Acerto na gravacao da FONTEPAGADORA
//--------------------------------------------------------------------------------------------------
// Rotina      : FormShow
// Autor(a)    : Leo
// Data        : 14.09.2004
// Descricao   : acrescentei o filtro  BF.IDSITBENEFICIO IN (4,8,6) no MontaSelectPart
//--------------------------------------------------------------------------------------------------
// Rotina      : MontaSelect
// Autor(a)    : Leo
// Data        : 01/09/2004
// Descricao   : correção da ordem dos valores da propriedade Tipodedado do MontaSelect
//               que estavam errados
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Pendência   : 17393
// Data        : 17/08/2004
// Descricao   : Quando o parâmetro prmFlgGravaSimulBenef indicar para não gravar
//               na simulação de benefício, executa um rollback na transação.
//--------------------------------------------------------------------------------------------------
// Rotina      : CalculaReserva
// Autor(a)    : Camille
// Pendência   : 17391
// Data        : 16.08.2004
// Descricao   : Acrescentar IDTITULAR na query de calculo de reserva
//--------------------------------------------------------------------------------------------------
// Rotina      : dblkpcmbBeneficioCloseUp
// Autor(a)    : Gleyber
// Pendência   : 17366
// Data        : 11/08/2004
// Descricao   : Quando o usuário troca o benefício os campos de valor total,
//               valor rateado e valor srb são zerados.  
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Pendência   : 17230
// Data        : 10/08/2004
// Descricao   : Quando o usuário escolher não confirmar a concessão, todo o processo
//               de concessão é cancelado.
//--------------------------------------------------------------------------------------------------
// Rotina      : Varias
// Autor(a)    : Camille
// Data        : 05.08.2004
// Descricao   : Acertos na chamada do cadastro de conta bancaria e na habilitacao
//               dos botoes conta bancaria e demons.
//--------------------------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Pendência   : 17220
// Data        : 19.07.2004
// Descricao   : Implementar padrao de movimentacao de reservas para beneficiario
//--------------------------------------------------------------------------------------------------
// Rotina      : OkDetClick
// Autor(a)    : Augusto
// Data        : 07/07/2004
// Descricao   : Movi a função GeraMatricula para a uBeneficio, para ser usada
//               tbm no Desdobramento.
//--------------------------------------------------------------------------------------------------
// Rotina      : OkDetClick
// Autor(a)    : Augusto
// Data        : 31/05/2004
// Descricao   : ACERTO - atribuição automática de parametros contábeis individuais
// Data        : 18/06/2004
// Descricao   : IMPLEMENTAÇÃO - Opçao para gerar matricula na alteração do processo
// Data        : 19/06/2004
// Descricao   : ATUALIZAÇÂO - Rotina de Geração de Matricula, utilizar o campo criado
//--------------------------------------------------------------------------------------------------
// Rotina      : OkDetClick
// Autor(a)    : Leo
// Data        : 28/05/2004
// Descricao   : ATUALIZAÇÃO - atribuição automática de parametros contábeis individuais
//--------------------------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 19/05/2004
// Descricao   : atribuição automática de parametros contábeis individuais
//--------------------------------------------------------------------------------------------------
// Rotina      : GeraMatricula (nova)
// Autor(a)    : Augusto
// Data        : 18/05/2004
// Descricao   : Novas implementações para Gerar matricula automáticamente
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Leofuncef
// Data        : 10.05.2004
// Descricao   : modificações gerais para atribuição automática de
//               matrícula para pensionista, conforme parametrização
//--------------------------------------------------------------------------------------------------
// Rotina      : VerificaVALORLimiteBeneficio
// Autor(a)    : Camille
// Pendência   : 16644
// Data        : 04.05.2004
// Descricao   : Nova rotina para tratamento de valor limite de beneficio
//--------------------------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Pendência   : 16286
// Data        : 19.04.2004
// Descricao   : Não aplicar percentual de concessao de beneficio provisorio
//--------------------------------------------------------------------------------------------------
// Rotina      : MontaSelect
// Autor(a)    : Augusto
// Data        : 16/04/2004
// Descricao   : Inclusão do nome do beneficiario
//--------------------------------------------------------------------------------------------------
// Rotina      : ConcedeUmBeneficio
// Autor(a)    : Gleyber
// Pendência   : 16276
// Data        : 30/03/2004
// Descricao   : Inclusão da função ExecutaRegraPlanPrevContab para gravação do
//               IDPLANPREVCONTAB da BENEFBFCIARIO
//--------------------------------------------------------------------------------------------------
// Rotina    : MostraDemonstrativoConcessao
// Autor(a)  : Augusto
// Data      : 12/02/2004
// Descrição : Acerto no demonstrativo de Contribuicoes
// Data      : 19/03/2004 - bbtnConfirmarClick
// Descrição : Acerto para beneficarios migrados 
// -----------------------------------------------------------------------------
// Rotina    : EfetuaConcessao
// Autor(a)  : Augusto
// Data      : 08/02/2004
// Descrição : Acerto nos parametros da PreparaBeneficioConcedido
// Descrição : SRB no demontrativo não pode ser somado, errado quando varios beneficiarios .
// -----------------------------------------------------------------------------
// Rotina    : Diversas
// Autor(a)  : Gleyber
// Data      : 26/01/2004
// Pendência : 15925
// Descrição : Inclusão do campo MATRÍCULA para gravação da matrícula do
//             Beneficiário / Pensionista
// -----------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Gleyber
// Data      : 23/01/2004
// Pendência : 15983
// Descrição : Inclusão de um Commit final para simulação a fim de evitar travamento
//             no banco.
// -----------------------------------------------------------------------------
// Rotina    : dblkpcmbBeneficiarioloseUp
// Autor(a)  : Camille
// Data      : 15.01.2004
// Descrição : Chamar regra de data de inicio do beneficio
// Pendencia : 15903
// -----------------------------------------------------------------------------
// Rotina    : QRYBENEFICIO
// Autor(a)  : Leo
// Data      : 10/01/2004
// Descrição : incluão do campo FLGACEITAACERTO
// -----------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Leo
// Data      : 10/12/2003
// Descrição : verificação do campo FLGACEITAACERTO, que esta se é para
//             pegar acertos do falecido
// -----------------------------------------------------------------------------
// Rotina    : reValorBeneficioBtnClick
// Autor(a)  : Gleyber
// Data      : 09/01/2004
// Pendência : 15757
// Descrição : Acerto na funcionalidade de transformar o valor do benefício de
//             real para cotas.
// -----------------------------------------------------------------------------
// Autor(a)  : Augusto
// Data      : 15/11/2003
// Descrição : Quando beneficios de referencia a DIB (DATAINICIOFUND) não estava alterando
// -----------------------------------------------------------------------------
// Rotina    : FormShow
// Autor(a)  : Gleyber - Augusto FUNCEF pendencia 15153
// Data      : 07/11/2003
// Descrição : Inicia Transação - Quando Simulação.......
// -----------------------------------------------------------------------------
// Rotina    : reValorTotalBtnClick
// Autor(a)  : Leo
// Data      : 29/10/2003
// Descrição : chamaa da função DevolveReserva
// -----------------------------------------------------------------------------
// Rotina    : geral
// Autor(a)  : Leo
// Data      : 28/10/2003
// Descrição : Retirada das rotinas InsereHistContrib,GeraContribBenef e PreparaContribNucleo,
//             passando para a UBENEFICIO, pois os mesmos cálculos deveraim ser executados
//             pelo desdobramento.
//             Modificação na chamada da função GeraContribBenef.
// -----------------------------------------------------------------------------
// Rotina    : ProcessaNucleoFamiliar
// Autor(a)  : Augusto
// Data      : 28/10/2003
// Descrição : mensagem caso responsavel não esteja cadastrado
// -----------------------------------------------------------------------------
// Rotina    : InsereHistContrib
// Autor(a)  : Augusto
// Data      : 27/10/2003
// Descrição : IIdLote trocado pelo lote da concessao iIdLoteConcessao,
//             SQL da regra de primeiro e ultimo pagamento estavam errados
// -----------------------------------------------------------------------------
// Rotina    : FormShow
// Rotina    : ExecutaRegraDataPgtoBeneficio
// Autor(a)  : Ricardo Vigorito
// Data      : 15/1O/2003
// Descrição : Incluir o campo DATAREQUERIMENTO  para query de executa a data
// do pagamento do benefício
// -----------------------------------------------------------------------------
// Rotina    : FormShow
// Autor(a)  : Augusto
// Data      : 21/1O/2003
// Descrição : Inclusão do IDSITBENEFICIO = 6 na pesquisa dos processos a conceder
// -----------------------------------------------------------------------------
// Rotina    : bbtnOkDetClick
// Autor(a)  : Leo
// Data      : 09/1O/2003
// Descrição : crítica da data de requerimento, levando em conta o caso de resgate,
//             onde a data de requerimento pode ser menor que a data de evento
// -----------------------------------------------------------------------------
// Rotina    : qryDetAfterInsert
// Autor(a)  : Leo
// Data      : 18/09/2003
// Descrição : chamada da função limpavariáveis do regras
// -----------------------------------------------------------------------------
// Rotina      : CmeDetalheInsert
// Autor(a)    : Leo
// Data        : 09/09/2003
// Alteração   : alteração na comparação de data inicio na fundação
//--------------------------------------------------------------------------------------------------
// Rotina      : reValorCalcInssBtnClick
// Autor(a)    : Augusto
// Data        : 09/09/2003
// Alteração   : passar dados do beneficio anterior para calculo do INSS
//--------------------------------------------------------------------------------------------------
// Rotina      : dblkpcmbBeneficiarioCloseUp
// Autor(a)    : Gleyber
// Data        : 02/09/2003
// Alteração   : acerto de busca da datafinal para REFER.
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnOkDetClick
// Autor(a)    : Leo
// Data        : 01/09/2003
// Alteração   : estava criticando valor em reValorTotal mesmo para benef. Inss
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 31/07/2003
// Alteração   : QRYDET; QRYBENEFAUX; bbtnOpcoesClick; GeraContribBenef;
//               dblkpcmbBeneficiarioCloseUp; VerificaCamposObrigREGRA
// Pendência   : 14651 / 14652
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 25/07/2003
// Alteração   : Adicionando controles para os campos valor SRB, Total do Benefício,
//               Valor atual. Mesmo que tenha regra associada.
// Pendência   : 14645
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 20.06.2003
// Alteração   : Criação do campo FLGTIPOGRAVAINSS com parametro do plano
//--------------------------------------------------------------------------------------------------
// Rotina    : dblkpcmbBeneficiarioCloseUp
// Autor(a)  : Camille
// Data      : 27.05.2003
// Alteração : Rodar regra de data inicio e final por beneficiário
// -----------------------------------------------------------------------------
// Rotina    : dblkpcmbBeneficioCloseUp
// Autor(a)  : Augusto
// Data      : 29/04/2003
// Alteração : Não estava preenchendo o campo Data Final do Beneficio
// -----------------------------------------------------------------------------
// Rotina    :
// Autor(a)  : Gleyber
// Data      : 24/04/2003
// Alteração : Liberação do campo VALOR TOTAL e VALOR RATEADO para digitação
// -----------------------------------------------------------------------------
// Rotina    : Várias rotinas que calculam benefícios.
// Autor(a)  : Carlos Guedes
// Data      : 28/03/2003
// Alteração : Pendência: 13113
//  Verificar se o parâmetro prmQtdDiasRetroBenef possui valor mais que 0,
//  caso afirmativo verifca se a diferença da data do registro do evento e a data do requerimento
//  é maior do que o parâmetro, se for NÃO paga benefícios retroativos.
// -----------------------------------------------------------------------------
// Rotina    : MostraDemonstrativoConcessao
// Autor(a)  : Leo
// Data      : 28/03/2003
// Alteração : acrescentei no demonstrativo as contribuições calculadas para pensionistas
// -----------------------------------------------------------------------------
// Rotina    : InsereHistContrib
// Autor(a)  : Leo
// Data      : 28/03/2003
// Alteração : alterei a crítica para criação de lote
//             antes: if iIdLote  < 0
//             depois: if iIdLote  <= 0
// -----------------------------------------------------------------------------
// Rotina    : PreparaContribNucleo
// Autor(a)  : Leo
// Data      : 28/03/2003
// Alteração : inclusão dos campos DATAREF e NUMEORPROCESSO nas querys passadas para regras de
//             calculo de contribuição, normal, primeira e última.
// -----------------------------------------------------------------------------
// Rotina    : SelecionaProcesso
// Autor(a)  : Leo
// Data      : 28/03/2003
// Alteração : zerar a variável iIdLote
// -----------------------------------------------------------------------------
// Rotina    : ProcessaNucleoFamiliar
// Autor(a)  : Leo
// Data      : 27/03/2003
// Alteração : inclusão de nucleos familiares
// -----------------------------------------------------------------------------
// Rotina    : reValorInfINSSExit
// Autor(a)  : Leo
// Data      : 25/03/2003
// Alteração : mudar a cor do valor informado do Inss caso seja diferente do valor calculado
// -----------------------------------------------------------------------------
// Rotina    : bbtnOkDetClick
// Autor(a)  : Leo
// Data      : 25/03/2003
// Alteração : abrir a query qryRelBenefPart, caso desativada
// -----------------------------------------------------------------------------
// Rotina    : btn_SelecionaBeneficiosClick, dblkpcmbBeneficiarioCloseUp
// Autor(a)  : Leo
// Data      : 25/03/2003
// Alteração : caso o benef. do INSS seja requerido separadamente, este está com
//             outro NUMPROCESSO, que foi capturado em BuscaDadosINSSEmVigor.
//             caso o INSS já esteja requerido, usar o NUMPROCESSO dele.
// -----------------------------------------------------------------------------
// Rotina    : reValorInfINSSExit
// Autor(a)  : Leo
// Data      : 25/03/2003
// Alteração : mudar a cor do edit caso o valor seja diferente do calculado
// -----------------------------------------------------------------------------
// Rotina    : qryDetBeforePost
// Autor(a)  : Leo
// Data      : 25/03/2003
// Alteração : caso benefício do INSS gravar o valor total como o valor do INSS
//             que não estava sendo gravado
// -----------------------------------------------------------------------------
// Rotina    : dblkpcmbBeneficioCloseUp
// Autor(a)  : Carlos Guedes
// Data      : 25/03/2003
// Alteração : Desabilitando campo Data Final na caso do benef. ter pagto. vitalício
//          Pend: 13115
// -----------------------------------------------------------------------------
// Rotina    : VerificaNumeroDependentes
// Autor(a)  : Camille
// Data      : 06.02.2003
// Alteração : Se a fundacao parametrizou que utilizara o calculo automatica de numero
//             de dependentes, entao nao atualizar por esta rotina abaixo
// -----------------------------------------------------------------------------
// Rotina    : CalculaReservaParaBeneficio
// Autor(a)  : Augusto
// Data      : 29/01/2003
// Alteração : Caso a Data do Cancelamento esteja vazia (DATACANCELAMENTO = '')
//             passa para Regra um espaço ( ' ' ) (CBS)   
// -----------------------------------------------------------------------------
// Rotina    : TestaQuitacaoDividas
// Autor(a)  : Gleyber
// Data      : 15/01/2003
// Alteração : Inclusão da função QuitaContratosMutuarioMorte para quitação do empréstimo.
// -----------------------------------------------------------------------------
// Rotina    :
// Autor(a)  : Leo  (leofuncef
// Data      : 0512.2002
// Alteração : alteração para permitir banaf. provisório do INSS, e cálculos
// -----------------------------------------------------------------------------
// Rotina    : Gravação do Plano de Origem
// Autor(a)  : Camille
// Data      : 03.12.2002
// Alteração : Alteração para gravar no plano de origem o plano do qual o participante
//             migrou
// -----------------------------------------------------------------------------
// Rotina      : AbreRequerBfciario
// Autor(a)    : Augusto
// Data        : 22/11/2002
// Alteração   : Caso chamado de evento esconder o botão procurar.
// ----------------------------------------------------------------------------
// Rotina      : qryBeneficioAfterScroll/dblkpcmbBeneficioCloseUp/qryDetAfterScroll
// Autor(a)    : Gleyber
// Data        : 11/11/2002
// Alteração   : Permitir a visibilidade de parte do panel INFORMAÇÃO DA SUPLEMENTAÇÃO
// ----------------------------------------------------------------------------
// Rotina      : CobraContribAtrasada
// Autor(a)    : Leo
// Data        : 03.10.2002
// Alteração   : comentei achamada da função pois agora os acertos de atraso
//               são feitos também pela TrataAtrasoDevolContribPosMorte
// ----------------------------------------------------------------------------
// Rotina      : qrydet
// Autor(a)    : Leo
// Data        : 02.10.2002
// Alteração   : acrescentei o campo FLGDATAPREVISTA na qrydet
// -----------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Leo
// Data        : 02.10.2002
// Alteração   : gravar os registros de concessão na MOVBENEF
// -----------------------------------------------------------------------------
// Rotina      : qryDetBeforePost
// Autor(a)    : Leo
// Data        : 26.09.2002
// Alteração   : forçar a gravação do IDTPPAGTOBENEFIC
// -----------------------------------------------------------------------------
// Rotina      : CmeCadastroEdit
// Autor(a)    : Camille
// Data        : 24.09.2002
// Alteração   : Se o beneficio estiver pendente de concessao, permitir alterar dados
// -----------------------------------------------------------------------------
// Rotina    : dbedNumProcINSSExit
// Autor(a)  : Leo
// Data      : 24/09/2002
// Alteração : valida número do processo
// -----------------------------------------------------------------------------
// Rotina    : EfetuaConcessao
// Autor(a)  : Leo
// Data      : 23/09/2002
// Alteração : troquei a data passada para pagamento de DATAPREPARO para DATAPAGAMENTO
// -----------------------------------------------------------------------------
// Rotina    : EfetuaConcessao
// Autor(a)  : Carlos Eduardo
// Data      : 09/09/2002
// Alteração : Passando data do início do INNS correta pra função PreparaBeneficioConcedido
// -----------------------------------------------------------------------------
// Rotina    : PreparaBeneficioConcedido
// Autor(a)  : Camille
// Data      : 23.08.2002
// Alteração : Acrescimo do campo ValorSRB para PreparaBeneficioConcedido
// -----------------------------------------------------------------------------
// Rotina    : MostraDemonstrativoConcessao
// Autor(a)  : Camille
// Data      : 07.08.2002
// Alteração : Acrescimo do join do IDPESSOA
// -----------------------------------------------------------------------------
// Rotina    : Cálculo do Numero de Beneficiarios (inumbenef)
// Autor(a)  : Camille
// Data      : 07.08.2002
// Alteração : Calcular numero de beneficiarios sem considerar os beneficios do
//             INSS se estes não forem pagos
// -----------------------------------------------------------------------------
// Rotina    : qryDET
// Autor(a)  : Camille
// Data      : 07.08.2002
// Alteração : Acréscimo do campo VALORNADIB 
// -----------------------------------------------------------------------------
// Rotina    : ExecutaRegraBeneficioMinimo
// Autor(a)  : Camille
// Data      : 01.08.2002
// Alteração : Acréscimo do campo ValorSRB na query de calculo
// -----------------------------------------------------------------------------
// Rotina      : PreparaBeneficioConcedido
// Autor(a)    : Carlos Guedes
// Data        : 23/07/2002
// Alteração   : Estava sendo passado um valor já rateado para a função, que sofreria
//               novo rateio. Substituindo VALORATUAL por VALORTOTAL.
//               Pendência: 7753
// *****************************************************************************
// Rotina      : VerificaEvolucaoPensionista
// Autor(a)    : Carlos Guedes
// Data        : 17/07/2002
// Alteração   : Verifica e incorpora pensionistas à evolução funcional do titular.
//               Feito no requerimento para todos os pensionistas do titular.
//               Pendência: 6253
// *****************************************************************************
// Rotina      : qryBeneficioAfterScroll/dblkpcmbBeneficioCloseUp/qryDetAfterScroll
// Autor(a)    : Carlos Guedes
// Data        : 16/07/2002
// Alteração   : Caso benefício do INSS torna invisível grpInfSupl ( Informações da Suplementação )
//               Pendência:5718
// *****************************************************************************
// Rotina      : PreparaBeneficioConcedido
// Autor(a)    : Carlos Guedes
// Data        : 27/05/2002:
// Alteração   : A função PreencheDadosBeneficiario não estava sendo utilizada no lugar certo,
//      no retorno do montaselect, pois não era alimentada a qryrelbenefpart, utilizada no momento
//      da exclusão de benefícios para beneficiários.
// *****************************************************************************
// Rotina      : MostraDemonstrativoConcessao
// Autor(a)    : Carlos Guedes
// Data        : 10/06/2002:
// Alteração   : PARA ATENDER A ESTRUTURA PLANO POR BENEFICIÁRIO.
// *****************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, StdCtrls, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, Mask,  wwdblook,
  TREdit, MskEdDlg, TEdNum, wwdbedit,FTelaAut, checklst, IvDictio,
  IvMulti, IvEMulti,FCadastroCS, wwdbdatetimepicker, CMDateTimePicker,
  DBCtrls, CmEventosCadastro, ImgList, ppTypes, FPreview;

const VetDescBeneficio : array[1..7] of string =
                      ('Normal', 'Retido','Encerrado','Pendente de Concessão',
                       'Encerrado por Morte do Beneficiário','Não Concedido',
                       'Concedido em exigência');

  
type
  TfrmCadRequerBenefBfciario = class(TfrmCadMestreDetalheCS)
    qryEvento: TwwQuery;
    qryTpPgtoBenef: TwwQuery;
    Label12: TLabel;
    dblkpcmbEvento: TwwDBLookupCombo;
    Label5: TLabel;
    dtDataEvento: TCMDateTimePicker;
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
    qryBenefReferencia: TwwQuery;
    updBenefReferencia: TUpdateSQL;
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
    btn_SelecionaBeneficios: TSpeedButton;
    wwDtsBeneficiarios: TwwDataSource;
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
    grpInfINSS: TGroupBox;
    Label4: TLabel;
    dbedNumProcINSS: TwwDBEdit;
    Label2: TLabel;
    dtInicioINSS: TCMDateTimePicker;
    lblValorCalcInss: TLabel;
    reValorCalcInss: TcmMaskEditDlg;
    lblValorInfINSS: TLabel;
    reValorInfINSS: TEditNum;
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
    lblCodFundacao: TLabel;
    dsBeneficio: TwwDataSource;
    edCodFundacao: TStaticText;
    qryloop: TwwQuery;
    qryBeneficio: TwwQuery;
    qryDepentit: TwwQuery;
    dsDepentit: TwwDataSource;
    updDepentit: TUpdateSQL;
    Label9: TLabel;
    dbeMatriculaBenef: TwwDBEdit;
    qryDetIDPLANPREVCONTAB: TFloatField;
    qryDetUSUARIOALT: TFloatField;
    qryDetFONTEPAGADORA: TFloatField;
    qryDetPLACONTAD: TStringField;
    qryDetPLACONTAC: TStringField;
    BtMatricula: TSpeedButton;
    qryDetFLGMOVRESAPOSCONC: TFloatField;
    qryDetFLGMOVEURESERVA: TFloatField;
    qryDesindRes: TwwQuery;
    dsDesindRes: TwwDataSource;
    updDesindRes: TUpdateSQL;
    qryDResPart: TwwQuery;
    dsDResPart: TwwDataSource;
    updDResPart: TUpdateSQL;
    qryDetFLGPAGAINSS: TFloatField;
    Bevel1: TBevel;
    DbChbPossuiConvenio: TDBCheckBox;
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure reValorBeneficioBtnClick(Sender: TObject);
    procedure qryBeneficioAfterScroll(DataSet: TDataSet);
    procedure reValorCalcInssBtnClick(Sender: TObject);
    procedure dblkpcmbEventoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnElegibilidadeClick(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure reValorCalcInssExit(Sender: TObject);
    procedure reValorInfINSSExit(Sender: TObject);
    procedure sbtnConcedeUmClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dtInicioFundExit(Sender: TObject);
    procedure dtDataInicioExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dblkpcmbBeneficioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbBeneficiarioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryBeneficiarioAfterOpen(DataSet: TDataSet);
    procedure btn_SelecionaBeneficiosClick(Sender: TObject);
    procedure dblkpcmbBeneficioExit(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure qryDetBeforeInsert(DataSet: TDataSet);
    procedure reValorBeneficioMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure reValorBeneficioExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure reValorTotalBtnClick(Sender: TObject);
    procedure reValorTotalExit(Sender: TObject);
    procedure dbrgrpBenefProvisorioClick(Sender: TObject);
    procedure dbedPrazoProvExit(Sender: TObject);
    procedure reValorInfINSSEnter(Sender: TObject);
    procedure dbrgrpBenefProvisorioEnter(Sender: TObject);
    procedure dbrgrpBenefProvisorioExit(Sender: TObject);
    procedure sbtnConcederClick(Sender: TObject);
    procedure bbtnOutrasInformacoesClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnImprimirSimulacaoClick(Sender: TObject);
    procedure bbtnProcParticipanteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnCadContaCorrenteClick(Sender: TObject);
    procedure reValorSRBBtnClick(Sender: TObject);
    procedure qryDetAfterPost(DataSet: TDataSet);
    procedure sbtnDemonsSRBClick(Sender: TObject);
    procedure dbedNumProcINSSExit(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure Label12Click(Sender: TObject);
    procedure lblSitProcessoClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dtInicioINSSChange(Sender: TObject);
    procedure BtMatriculaClick(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure reValorSRBExit(Sender: TObject);
  private
    { Private declarations }
    iFlgEmprestimo          : Integer;  //ClaudioR - 27/12/2006

    sBeneficiosMovReserva   : string;
    iIdUsuarioAutoriza      : longint;
    bAtivo               : boolean;
    iIdLoteConcessao     : longint;
    sAnoMesLoteConcessao,
    sDataPagamentoConcessao : string;

    iIdEvento,                iIdPlanoPrevTit,
    iNumeroProcesso,       iIdTitular,               iIdPessJur,
    iIdPlanoPrev,          iIdPessoa,                iSeqProposta,
    iIdSitPart,            iIdSitFunc,               iIdSitPlanoPrev  ,
    iNumBenef,             iIdBenefReferencia,       NumeroProcesso            : longInt;

    iProvisorioAntes : longint;

    bPerguntouCancelar,
    bRecalculouProvisorio,
    bReajustouINSS,
    bAbriuOutroForm,
    bNovoBeneficio,
    bConcedeBeneficio,     bPossuiDivPrevid,         bPossuiDivAssist,
    bPossuiDivEmprest,     bExecutouRegraConcessao,  bQueryTitular,
    bQuerySalarios,        bQueryContribuicoes,      bGravaBenefReferencia : boolean;


    dValorSRB : double;
    rValorReal,            rValorCotas,              rValorDaCotaBenef : real;


    // Dados do INSS para preencher caso ja tenha sido requerido
    sNumProcINSS, sValorCalcINSS, sValorInfINSS, sDataInicioINSS,
    sValorBase1INSS, sValorBase2INSS, sValorBase3INSS, sFlgPagaINSS : string;
    
    // Variaveis para controlar validacoes necessárias na concessao
    bCobraContribAtrasada,
    bConcedeuBeneficio : boolean;

    sValorINSSAntes, sValorINSSDepois,
    sNumerosProcessos,
    sTipoSitFunc        : string;
    // Variaveis para guardar e apresentar igual ao anterior quando
    // for outro beneficiario para o mesmo beneficio
    iFlgTipoINSS : integer;
    sValorReserva,
    sValorTotal,       
    sDataInicioPagto,
    sDataDaCotaBenef,
    sTipoFormChamador, // EV - Evento, CO - Concessao, SI - Simulacao
    sDataEvento,           sFlgTpDemissao,
    sMatricula,            sNomeTitular,             sNomePatro,
    sNomePlano,            sNomeSitPart,
    sNomeSitFunc,          sNomeSitPlano,
    sFlgInternoAntes,
    sFlgInternoDepois,
    sIdSitPartAntes,
    sIdSitPlanAntes,
    sIdSitFuncAntes,
    sIdSitPartDepois,
    sIdSitPlanDepois,
    sMatriculaAtual, { Augusto 18/05/2004 }
    sIdSitFuncDepois : string;
    sIdBeneficiarioEncerrado : String; // Gleyber - 14/11/2006 - Pendência 23246

    sNumeroProcessoAntesGravar : string;
    sTempoServAnoAntes,    sTempoServMesAntes,       sTempoServDiaAntes         : string;

    // Augusto 18/09/00
    StrConcedidos    : string;

    //P.RAMOS - REFER - 03.07.2001
    iFlgIncluiMesConc   : integer;
    iTotRequeridos      : word;

    // cguedes - 27/03/2003
    bPagaRetroativo: Boolean;

    bValidaOpcaoBeneficio : Boolean; // Gleyber - 01/08/2005 - Pendência 19060

    procedure SelecionaProcesso(piNumeroProcesso : longint);
    procedure PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
    procedure PreencheDadosBeneficiario(piNumeroProcesso,piIdTitular, piIdPessoa,piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
    procedure GravaBeneficioDeReferencia;
    procedure SelecionaReservaPart;
    function  CalculaReservaParaBeneficio                     : double;
    function  AtualizaReservaPart ( piIdBeneficio : longint ) : boolean;


    function  ConverteBeneficioParaCotas( prValorReal : real) : real;
    function  ConverteBeneficioParaReal ( prValorCotas: real) : real;

    function  TestaQuitacaoDividas         : boolean;
    function  VerificaBeneficioObrigatorio : boolean;
    function  VerificaBeneficioRepetido    : boolean;
    function  VerificaNumeroDependentes    : boolean;
    function  VerificaContribAtrasada   ( var sMesAtraso : string) : boolean;
    function  VerificaAcertosFalecido   ( piNumeroProcesso  : longint;
                                          piIdPessJur       : longint;
                                          piIdPlanoPrev     : longint;
                                          piIdTitular       : longint;
                                          piSeqProposta     : longint;
                                          piIdLoteConcessao : longint;
                                          psDataEvento      : string;
                                          psDataPagamento   : string ) : boolean;

    function  CalculaSaldoRealCont(piIdTipoReserva : integer; pdVlMovReal : double) : double;
    function  DevolveReserva       ( piIdBeneficio, piIdBeneficiario : longint )   : boolean;
    function  ConfirmaBeneficio : boolean;
    function  CobraContribAtrasada(piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                                   psDataInicioFund : string) : boolean;

    procedure MostraDemonstrativoConcessao;
    function  AtualizaSitParticipante(piIdPessJur, piIdPlanoPrev,piIdPessoa,
                                      piSeqProposta, piIdEventoGerador : longint ) : boolean;
    function EfetuaConcessao(iIdSitEscolhida : word;
                             var rValorAtualizado,
                                 rValorAtualizadoTotal,
                                 rValorAtualizadoINSS,
                                 rValorAtualizadoTotalINSS : double;
                             var sUltMesReajuste,
                                 sUltMesReajusteINSS  : string;
                             var bErro                : boolean ) : word;
    procedure AtualizaEventosPrev(iIdPessJur,   iIdPlanoPrev, iIdPessoa,
                                  iSeqProposta, iIdEventoGerador : Integer);

    function  ConcedeUmBeneficio ( Sender : TObject; piIdSitBenef : integer ): boolean;


    //Function InsereHistContrib(AnoMesRef, AnoMesCob, sValorFinal:String):Boolean;   // Augusto 14/09/00
    //Function GeraContribBenef:Boolean; // Augusto 18/09/00
    //Function PreparaContribNucleo(idNucleoFamiliar, idcontribuicao : longint):Boolean;   // Augusto 13/09/00

    Procedure VerificaEvolucaoPensionista;
    { Augusto 15/04/2003 }
    function  VerificaCamposObrigREGRA                             : boolean;

    Procedure DesindexaReserva; // Gleyber - 23/03/2005 - Pendência 18272

    Procedure VerificaProcessoEncerrado; // Gleyber - 24/10/2006 - Pendência 23246

//     function ConcedeContribuicaoNucleo : boolean; // camille - 26.10.2000
  public
     iIdCalculo                   : Integer;        
     sDataDemissao,
     sIdDepen                     : string;
     rOpcao1,  rOpcao2,  rOpcao3  : real;
     rTotalLote                   : double; // Augusto 18/09/00
     iIdLote,iNumReg, wIdMotivo   : longint; // Augusto 18/09/00
     bFlgBenefMorte               : Boolean; // Gleyber - 24/10/2006 - Pendência 23246
    { Public declarations }
  end;

var
  frmCadRequerBenefBfciario: TfrmCadRequerBenefBfciario;
  iIdTitularSel, iIdPessjurSel, iIdPlanoPrevSel : Integer;

function  AbreRequerBfciario(psTipoChamador, // EV - Evento, CO - Concessao, MA - Manutencao de Processo
                             pIdTitular, pIdPessJur, pIdPlanoPrev, pSeqProposta,
                             pDataEvento,
                             pIdEventoGerador, pFlgTpDemissao : string;
                             var psNumerosProcessos : string;
                             psFlgInternoAntes,
                             psFlgInternoDepois,
                             psIdSitPartAntes,
                             psIdSitPlanAntes,
                             psIdSitFuncAntes,
                             psIdSitPartDepois,
                             psIdSitPlanDepois,
                             psIdSitFuncDepois   : string;
                             Var piIdCalculo : Integer;
                             pbFlgBenefMorte : Boolean = False ) : boolean;

implementation

uses UAdmPrev, DBaseDados, UDataBase, UMensErro, UBeneficio, UParticipante,
  fAguarde, FCadOpcoesBenef, FPedeBenefExigencia, UContribuicaoPrev,
  UMovReserva, fSelecionaBeneficiariosdoBeneficio,
  UEventos, UIntegraBack, FMostraAux, DAPrev, FCadContaRequerimento,
  FEscolheMotivo, USistema, FPedeDadosBenefAnterior, FSelecionaLote,
  UFuncoesUteis, FLerTempoServico, DRelatAdmPREV2, DAPrevIntegraBack,
  FCadContaRequerBenef, FPRelDemosBenef, DDividaEP , UIntegraEP;

{$R *.DFM}
// ********************************** ********************** *************************
// ******************************* ROTINA A SER CHAMADA DAS TELAS ********************
// ********************************** ********************** *************************
function  AbreRequerBfciario(psTipoChamador, // EV - Evento, CO - Concessao, MA - Manutencao de Processo
                             pIdTitular, pIdPessJur, pIdPlanoPrev, pSeqProposta,
                             pDataEvento,
                             pIdEventoGerador, pFlgTpDemissao : string;
                             var psNumerosProcessos : string;
                             psFlgInternoAntes,
                             psFlgInternoDepois,
                             psIdSitPartAntes,
                             psIdSitPlanAntes,
                             psIdSitFuncAntes,
                             psIdSitPartDepois,
                             psIdSitPlanDepois,
                             psIdSitFuncDepois   : string;
                             Var piIdCalculo : Integer;
                             pbFlgBenefMorte : Boolean = False ) : boolean;

begin
  Application.CreateForm(TfrmCadRequerBenefBfciario, frmCadRequerBenefBfciario);
  //Bruno Bastos - Help Context - Início
  if psTipoChamador = 'MA' Then
    frmCadRequerBenefBfciario.HelpContext := 160071
  else
    If psTipoChamador = 'CO' Then
      frmCadRequerBenefBfciario.HelpContext := 160072
    else
      If psTipoChamador = 'SI' Then
        frmCadRequerBenefBfciario.HelpContext := 160074;
  //Bruno Bastos - Help Context - Fim
  with frmCadRequerBenefBfciario do
  begin
     sTipoFormChamador := psTipoChamador;
     sTipoTelaBenef    := sTipoFormChamador;

     iIdEvento         := StrToInt(pIdEventoGerador);
     sDataEvento       := pDataEvento;
     iIdTitular        := StrToInt(pIdTitular);
     iIdPessJur        := StrToInt(pIdPessJur);
     iIdPlanoPrev      := StrToInt(pIdPlanoPrev);
     iSeqProposta      := StrToInt(pSeqProposta);
     sFlgTpDemissao    := pFlgTpDemissao;
     bFlgBenefMorte    := pbFlgBenefMorte;  // Gleyber - 24/10/2006 - Pendência 23246

     // Acertar situacoes da seguinte maneira :
     // Se a tela está chamando é evento, entao as situacoes anteriores
     //    são as que estao na tela do evento
     // Senao, Se a tela está sendo chamada pela "Manutencao de Processos" ou "Concessao"
     //        Entao as situacoes anteriores são as que estao na tabela eventosprev
     //              no evento <> do evento que estou fazendo agora
     sFlgInternoAntes  := psFlgInternoAntes;
     sFlgInternoDepois  := psFlgInternoDepois;
     sIdSitPartAntes   := psIdSitPartAntes;
     sIdSitPlanAntes   := psIdSitPlanAntes;
     sIdSitFuncAntes   := psIdSitFuncAntes;
     sIdSitPartDepois   := psIdSitPartDepois;
     sIdSitPlanDepois   := psIdSitPlanDepois;
     sIdSitFuncDepois   := psIdSitFuncDepois;

     bbtnProcurar.Visible := True;

     if psTipoChamador <> 'EV'
     then begin
        with dtmAPrev.qryAux do
        begin
           Close;
           SQL.Clear;
           SQL.Add(' SELECT EP.IDSITFUNCATUAL, EP.IDSITFUNCNOVO, EP.IDSITPLANOATUAL, EP.IDSITPLANONOVO, '+
	                '        EP.IDSITPARTATUAL, EP.IDSITPARTNOVO, SP.FLGINTERNO AS FLGINTERNOATUAL, '+
	                '        SP2.FLGINTERNO AS FLGINTERNONOVO                                       '+
                   ' FROM   EVENTOSPREV EP, SITPART SP, SITPART SP2  '+
                   ' WHERE  EP.IDSITPARTATUAL  = SP.IDSITPART        '+
                   ' AND    EP.IDSITPARTNOVO   = SP2.IDSITPART       '+
                   ' AND    EP.IDPESSJUR       = '+pIdPessJur+
                   ' AND    EP.IDPLANOPREV     = '+pIdPlanoPrev+
                   ' AND    EP.IDPESSOA        = '+pIdTitular+
                   ' AND    EP.SEQPROPOSTA     = '+pSeqProposta+
                   ' AND    EP.IDEVENTOGERADOR = '+pIdEventoGerador);
           Open;
           if not IsEmpty
           then begin
              sFlgInternoAntes  := FieldByName('FLGINTERNOATUAL').AsString;
              sFlgInternoDepois  := FieldByName('FLGINTERNONOVO').AsString;
              sIdSitPartAntes   := FieldByName('IDSITPARTATUAL').AsString;
              sIdSitPartDepois   := FieldByName('IDSITPARTNOVO').AsString;
              sIdSitFuncAntes   := FieldByName('IDSITFUNCATUAL').AsString;
              sIdSitFuncDepois   := FieldByName('IDSITFUNCNOVO').AsString;
              sIdSitPlanAntes   := FieldByName('IDSITPLANOATUAL').AsString;
              sIdSitPlanDepois   := FieldByName('IDSITPLANONOVO').AsString;
           end;
           Close;
        end; //with
     end else begin
       bbtnProcurar.Visible := False;   { Augusto 22/11/2002 }
     end; { If TipoChamador }

  end;
  
  frmCadRequerBenefBfciario.ShowModal;

  psNumerosProcessos := Copy(frmCadRequerBenefBfciario.sNumerosProcessos,
                             2,length(frmCadRequerBenefBfciario.sNumerosProcessos)-1);


  piIdCalculo := frmCadRequerBenefBfciario.iIdCalculo; { Augusto 07/5/2007 } 

  frmCadRequerBenefBfciario.Free;
  Result := True;
end;

// ********************************** ********************** *************************
// ********************************** PROCEDIMENTOS AUXILIARES ***********************
// ********************************** ********************** *************************
procedure TfrmCadRequerBenefBfciario.SelecionaReservaPart;
begin
{  if (qryReservaPart.Active) and (sTipoFormChamador <> 'SI')
  then begin
     if MsgDlg('As reservas do participante já foram selecionadas e podem ter sido alteradas. '+#13+
               'Deseja perder as alterações e refazer os dados das reservas ? ','Confirmação',
               mtConfirmation,[mbYes,mbNo],0) = mrNo
     then Exit;
  end;
}
  qryReservaPart.Close;
  qryReservaPart.ParamByName('IdPessJur').Value      := iIdPessJur;
  qryReservaPart.ParamByName('IdPlanoPrev').Value    := iIdPlanoPrev;
  qryReservaPart.ParamByName('IdTitular').Value      := iIdTitular;
  qryReservaPart.ParamByName('SeqProposta').Value    := iSeqProposta;
  qryReservaPart.Open;
end;



procedure TfrmCadRequerBenefBfciario.SelecionaProcesso(piNumeroProcesso : longInt);
begin

  qry.Close;
  qry.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('NumeroProcesso').AsInteger := qry.ParamByName('NumeroProcesso').AsInteger  ;
  qryDet.Open;

  if (piNumeroProcesso = -1) or
     (qryDet.IsEmpty)
  then begin
     qryBeneficio.Close; // CAMILLE - REFER - 02.06.1999
     qryBeneficio.ParamByName('IdEventoGerador').AsInteger := iIdEvento;
     qryBeneficio.ParamByName('IdPlanoPrev').AsInteger     := qryDet.FieldByName('IdPlanoPrev').AsInteger;
     qryBeneficio.Open;
  end
  else begin
     qryBeneficio.Close; // CAMILLE - REFER - 02.06.1999
     qryBeneficio.ParamByName('IdEventoGerador').AsInteger := qry.FieldByName('IdEventoGerador').AsInteger;
     qryBeneficio.ParamByName('IdPlanoPrev').AsInteger     := qryDet.FieldByName('IdPlanoPrev').AsInteger;
     qryBeneficio.Open;
  end;

  qryBenefAux.Close;
  qryBenefAux.ParamByName('NumeroProcesso').AsInteger := qry.ParamByName('NumeroProcesso').AsInteger;
  qryBenefAux.Open;

  if not qry.IsEmpty
  then iIdEvento := qry.FieldByName('IdEventoGerador').AsInteger;


  if sTipoFormChamador <> 'SI'
  then begin
      qryEvento.Close;
      qryEvento.ParamByName('IdEventoGerador').AsInteger := iIdEvento;
      qryEvento.Open;
  end
  else begin
      qryEvento.Close;
      qryEvento.SQL.Clear;
      qryEvento.SQL.Add(' SELECT IDEVENTOGERADOR, NOME, FLGRISCO, FLGINTERNO '+
                        ' FROM   EVENTOGERADOR                                                            '+
                        ' WHERE  FLGINTERNO IN (''FL'', ''RC'', ''BI'')                                   '+
                        ' AND    IDFUNDACAO = '+IntToStr(iIdFundacao)+ // CAMILLE - 25.06.2003
                        ' AND    IDEVENTOGERADOR IN (SELECT IDEVENTOGERADOR FROM BENEFICIO) '+
                        ' ORDER BY NOME        ');
      qryEvento.Open;
  end;

  if sTipoFormChamador <> 'EV'
  then begin
     if sTipoFormChamador <> 'SI'
     then begin
        with dtmAPrev.qryAux do
        begin
           Close;
           SQL.Clear;
           SQL.Add(' SELECT EP.IDSITFUNCATUAL, EP.IDSITFUNCNOVO, EP.IDSITPLANOATUAL, EP.IDSITPLANONOVO, '+
                   '        EP.IDSITPARTATUAL, EP.IDSITPARTNOVO, SP.FLGINTERNO AS FLGINTERNOATUAL, '+
                   '        SP2.FLGINTERNO AS FLGINTERNONOVO                                       '+
                   ' FROM   EVENTOSPREV EP, SITPART SP, SITPART SP2  '+
                   ' WHERE  EP.IDSITPARTATUAL  = SP.IDSITPART        '+
                   ' AND    EP.IDSITPARTNOVO   = SP2.IDSITPART       '+
                   ' AND    EP.IDPESSJUR       = '+IntToStr(qryDet.FieldByName('IdPessJur').AsInteger)+
                   ' AND    EP.IDPLANOPREV     = '+IntToStr(qryDet.FieldByName('IdPlanoPrev').AsInteger)+
                   ' AND    EP.IDPESSOA        = '+IntToStr(qryDet.FieldByName('IdTitular').AsInteger)+
                   ' AND    EP.SEQPROPOSTA     = '+IntToStr(qryDet.FieldByName('SeqProposta').AsInteger)+
                   ' AND    EP.IDEVENTOGERADOR = '+IntToStr(iIdEvento));
           Open;
           if not IsEmpty
           then begin
              sFlgInternoAntes  := FieldByName('FLGINTERNOATUAL').AsString;
              sFlgInternoDepois  := FieldByName('FLGINTERNONOVO').AsString;
              sIdSitPartAntes   := FieldByName('IDSITPARTATUAL').AsString;
              sIdSitPartDepois   := FieldByName('IDSITPARTNOVO').AsString;
              sIdSitFuncAntes   := FieldByName('IDSITFUNCATUAL').AsString;
              sIdSitFuncDepois   := FieldByName('IDSITFUNCNOVO').AsString;
              sIdSitPlanAntes   := FieldByName('IDSITPLANOATUAL').AsString;
              sIdSitPlanDepois   := FieldByName('IDSITPLANONOVO').AsString;
           end;
           Close;
        end; //with
     end;
  end;

  // Refazer query de beneficiario
  qryBeneficiario.Close;
  qrybeneficiario.SQL.Clear;
  qrybeneficiario.SQL.Add(' SELECT  P.NOME, D.DESCRICAO,                                '+
                          '  P.IDPESSOA, DT.NUMSEQUENCIA, DT.IDDEPENDENCIA,             '+
                          '  DT.FLGCONTAIMPOSTOR, DT.FLGCONTASALARIOF,                  '+
                          '  DT.FLGBENEFICIARIO,  BT.IDTITULAR,                         '+
                          '  BT.IDPESSJUR,BT.IDPLANOPREV,BT.IDPESSOA,                   '+
                          '  BT.IDRESPONSAVEL, BT.IDBENEFICIO,BT.PRIORIDADE,            '+
                          '  BT.PERCENTUAL, PRESP.NOME AS NOMERESPONSAVEL,              '+
                          '  PF.DATANASC, PF.SEXO, DT.MATRICULA, BT.IDPLANOORIGEM       '+  // Gleyber - 26/01/2004 - Pendência 15925
                          '  FROM   PESSOA P, PESSOA PRESP, DEPEN D, DEPENTIT DT,        '+
                          '         BFCIARIOTITPLAN BT, BENEFBFCIARIO BB, PESSOAFISICA PF '+
                          '  WHERE  (BB.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+')  '+
                          '  AND    (P.IDPESSOA        = BT.IDPESSOA)                   '+
                          '  AND    (PF.IDPESSOA       = P.IDPESSOA)                    '+
                          '  AND    (BB.IDPESSOA       = BT.IDPESSOA)                   '+
                          '  AND    (BB.IDTITULAR      = BT.IDTITULAR)                  '+
                          '  AND    (BB.IDPESSJUR      = BT.IDPESSJUR)                  '+
                          '  AND    (BB.IDPLANOPREV    = BT.IDPLANOPREV)                '+
                          // CGUEDES - 10/06/2002: PLANO POR BNEFICIÁRIO
                          '  AND    (BB.IDPLANOORIGEM  = BT.IDPLANOORIGEM)              '+

                          '  AND    (BB.IDBENEFICIO    = BT.IDBENEFICIO)                '+
                          '  AND    (BT.IDRESPONSAVEL  = PRESP.IDPESSOA(+))             '+
                          '  AND    (DT.IDPESSOA        = BT.IDPESSOA)                  '+
                          '  AND    (DT.IDTITULAR       = BT.IDTITULAR)                 '+
                          '  AND    (D.IDDEPENDENCIA    = DT.IDDEPENDENCIA)             '+
                          '  ORDER BY P.NOME                                            ');
  qryBeneficiario.Open;


  if piNumeroProcesso <= 0
  then begin
     lblNumProcesso.Caption   := 'Processo Nº ';
     lblSitProcesso.Caption := '';
  end
  else begin
     lblNumProcesso.Caption   := 'Processo Nº '+IntToStr(piNumeroProcesso);
     lblSitProcesso.Caption := 'Situação : '+qry.FieldByName('Descricao').AsString;
  end;

  pnlMestre.Enabled     := False;
  // cguedes - 12/12/2002
  bbtnProcurar.Visible  := False;
  sbtnConcedeUm.Enabled := False;
  iIdLoteConcessao := -1;
  iIdLote := -1;//leofuncef - 28032003
  NumeroProcesso := pINumeroProcesso;
  sBeneficiosMovReserva := ''; // CAMILLE - 22.10.2004

end; // SelecionaProcesso

procedure TfrmCadRequerBenefBfciario.PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
var
    sMesRef,
    sIdTpPagtoAnt,
    sFlgBenefMinimo,
    sValorSalario,
    sValorUltBeneficio : string;
begin
  qryTitular.Close;
  qryTitular.ParamByName('IdPessoa').Value := piIdTitular;
  qryTitular.ParamByName('IdPessJur').Value := piIdPessJur;
  qryTitular.ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
  qryTitular.ParamByName('SeqProposta').Value := piSeqProposta;
  qryTitular.Open;

  if qryTitular.IsEmpty then Exit;

  // Dados da Patrocinadora e do Plano
  sNomePatro    := qryTitular.FieldByName('NomePatro').AsString;
  sNomePlano    := qryTitular.FieldByName('NomePlano').AsString;
  sNomeTitular  := qryTitular.FieldByName('Nome').AsString;
  sMatricula    := qryTitular.FieldByName('Matricula').AsString;

  sValorReserva := CalcReservaPart(piIdPessJur,
                                   piIdPlanoPrev,
                                   piIdTitular,
                                   -1,
                                   piSeqProposta,
                                   FormatDateTime('dd/mm/yyyy', date),  // 24334
                                   FormatDateTime('dd/mm/yyyy', date),  // 24334
                                   '',
                                   '',
                                   '-1',
                                   qryAux
                                  );

  sMesRef         := FormatDateTime('yyyy/mm', Date); // 24334
  sValorSalario   := CalcSALPART(piIdPessJur, piIdTitular, sMesRef, qryAux);

  // Situacoes
  iIdSitFunc      := qryTitular.FieldbyName('IdSitFunc').AsInteger;
  iIdSitPart      := qryTitular.FieldbyName('IdSitPart').AsInteger;
  iIdSitPlanoPrev := qryTitular.FieldbyName('IdSitPlanoPrev').AsInteger;
  sTipoSitFunc    := qryTitular.FieldbyName('TipoSit').AsString;     //rosana - serpros - 04/06/1999

  if sTipoFormChamador = 'SI'
  then begin
     sFlgInternoAntes   := qryTitular.FieldByName('FLGINTERNO').AsString;
     sFlgInternoDepois  := qryTitular.FieldByName('FLGINTERNO').AsString;
     sIdSitPartAntes    := qryTitular.FieldByName('IDSITPART').AsString;
     sIdSitPartDepois   := qryTitular.FieldByName('IDSITPART').AsString;
     sIdSitFuncAntes    := qryTitular.FieldByName('IDSITFUNC').AsString;
     sIdSitFuncDepois   := qryTitular.FieldByName('IDSITFUNC').AsString;
     sIdSitPlanAntes    := qryTitular.FieldByName('IDSITPLANOPREV').AsString;
     sIdSitPlanDepois   := qryTitular.FieldByName('IDSITPLANOPREV').AsString;
  end;

  sNomeSitPart  := qryTitular.FieldByName('NomeSitPart').AsString;
  sNomeSitFunc  := qryTitular.FieldByName('NomeSitFunc').AsString;
  sNomeSitPlano := qryTitular.FieldByName('NomeSitPlano').AsString;


  bPossuiDivPrevid := (qryTitular.FieldByName('FLGDEVEPREVIDENC').AsString = '1');
  bPossuiDivAssist := (qryTitular.FieldByName('FLGDEVEASSISTENC').AsString = '1');
//  bPossuiDivEmprest:= (qryTitular.FieldByName('FlgDeveEmprestimo').AsString = '1');

  bQueryTitular := True;

  if not bAbriuOutroForm
  then begin
     SelecionaReservaPart;

     with qryBfciarioTitPlan do
     begin
        Close;
        ParamByName('IdTitular').Value   := piIdTitular;
        ParamByName('SeqProposta').Value := piSeqProposta;
        ParamByName('IdPessJur').Value   := piIdPessJur;
        ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
        Open;
     end;
     
     with qryBenefReferencia do
     begin
        Close;
        ParamByName('IdTitular').Value       := piIdTitular;
        ParamByName('SeqProposta').Value     := piSeqProposta;
        ParamByName('IdPessJur').Value       := piIdPessJur;
        ParamByName('IdPlanoPrev').Value     := piIdPlanoPrev;
        ParamByName('NumeroProcesso').Value  := iNumeroProcesso;
        Open;
     end;

     with qryMovReservaTemp do
     begin
        Close;
        ParamByName('IdTitular').Value      := piIdTitular;
        ParamByName('SeqProposta').Value    := piSeqProposta;
        ParamByName('IdPessJur').Value      := piIdPessJur;
        ParamByName('IdPlanoPrev').Value    := piIdPlanoPrev;
        ParamByName('NumeroProcesso').Value := iNumeroProcesso;
        Open;
     end;
  end; // if not bAbriuOutroForm
end; //PreencheDadosTitular

procedure TfrmCadRequerBenefBfciario.PreencheDadosBeneficiario(piNumeroProcesso, piIdTitular, piIdPessoa, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
begin
  iIdPessoa := piIdPessoa;
  if not bAbriuOutroForm
  then begin
     with qryRelBenefPart   do
     begin
        Close;
        ParamByName('IdPessoa').Value       := piIdPessoa;
        ParamByName('IdTitular').Value      := piIdTitular;
        ParamByName('SeqProposta').Value    := piSeqProposta;
        ParamByName('IdPessJur').Value      := piIdPessJur;
        ParamByName('IdPlanoPrev').Value    := piIdPlanoPrev;
        ParamByName('NumeroProcesso').Value := iNumeroProcesso;
        Open;
     end;
  end; // if not bAbriuOutroForm

  // Verificar conta bancaria do recebedor
  if qryBeneficiario.FieldByName('NOMERESPONSAVEL').AsString = ''
  then begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := piIdPessoa;
     qryContaBancaria.Open;
  end
  else begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryBeneficiario.FieldByName('IdResponsavel').AsInteger;
     qryContaBancaria.Open;
  end;
  // Gleyber - 26/01/2004 - Pendência 15925 - Início
  qryDepentit.Close;
  qryDepentit.ParamByName('IDTITULAR').AsInteger := piIdTitular;
  qryDepentit.ParamByName('IDPESSOA').AsInteger  := piIdPessoa;
  qryDepentit.Open;

  If (qryBeneficiario.FieldByName('MATRICULA').AsString <> qryDepentit.FieldByName('MATRICULA').AsString)
     and (prmIDRGDIGMATPENS = 0) //leofuncef - 10052004
   Then Begin
    qryDepentit.Edit;
    dbeMatriculaBenef.Field.Value := qryBeneficiario.FieldByName('MATRICULA').AsString;
   End;
  // Gleyber - 26/01/2004 - Pendência 15925 - Fim
end; //PreencheDadosBeneficiario

function  TfrmCadRequerBenefBfciario.AtualizaSitParticipante(piIdPessJur, piIdPlanoPrev,piIdPessoa,
                                      piSeqProposta, piIdEventoGerador : longint ) : boolean;
var iIdSitFuncNOVO, iIdSitPartNOVO, iIdSitPlanoNOVO : longint;
begin
   Result := False;
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO '+
              ' FROM   EVENTOSPREV '+
              ' WHERE  (IDPESSJUR       = '+IntToStr(piIdPessJur)       +')'+
              ' AND    (IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)     +')'+
              ' AND    (IDPESSOA        = '+IntToStr(piIdPessoa)        +')'+
              ' AND    (SEQPROPOSTA     = '+IntToStr(piSeqProposta)     +')'+
              ' AND    (IDEVENTOGERADOR = '+IntToStr(piIdEventoGerador) +')'+
              ' ORDER BY DATAREGISTRO DESC ');
      Open;
      if IsEmpty then Exit;

      iIdSitFuncNOVO  := FieldByName('IdSitFuncNovo').AsInteger;
      iIdSitPartNOVO  := FieldByName('IdSitPartNovo').AsInteger;
      iIdSitPlanoNOVO := FieldByName('IdSitPlanoNovo').AsInteger;

      Close;
      SQL.Clear;
      SQL.Add(' UPDATE ELEGPATRO SET IDSITFUNC = '+IntToStr(iIdSitFuncNOVO)+
              ' WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+
              ' AND    IDPESSOA  = '+IntToStr(piIdPessoa));
      try
         ExecSQL;
      except
         Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add(' UPDATE PARTPREVPLAN SET IDSITPART = '+IntToStr(iIdSitPartNOVO)+','+
              '                         IDSITPLANOPREV = '+IntToStr(iIdSitPlanoNOVO)+
              ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)   +
              ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev) +
              ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)    +
              ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta));
      try
         ExecSQL;
      except
         Exit;
      end;
   end; //with
   Result := True;
end;

procedure TfrmCadRequerBenefBfciario.GravaBeneficiodeReferencia;
var varfields : variant;
begin
  if iIdBenefReferencia <= 0
  then begin
     MsgDlg('O Benefício de Referência para '+qryBeneficio.FieldByName('Nome').AsString+
            ' não está associado. Verifique. ','Informação',mtInformation,[mbOk],0);
     Exit;
  end;

  varFields    := VarArrayCreate([0,1],varVariant);
  varFields[0] := iIdBenefReferencia;
  varFields[1] := iIdPessoa;


  // Verificar se participante já esta na bfciariotitplan para este beneficio
  if not qryBfciarioTitPlan.Locate('IdBeneficio;IdPessoa',varFields,[loCaseInsensitive])
  then begin
     qryBfciarioTitPlan.Insert;
     qryBfciarioTitPlan.FieldByName('IdPessoa').AsInteger    := iIdPessoa;
     qryBfciarioTitPlan.FieldByName('IdTitular').AsInteger   := iIdTitular;
     qryBfciarioTitPlan.FieldByName('SeqProposta').AsInteger := iSeqProposta;
     qryBfciarioTitPlan.FieldByName('IdPessJur').AsInteger   := iIdPessJur;

     { Augusto 26/02/2007 }
     //qryBfciarioTitPlan.FieldByName('IdPlanoorigem').AsInteger := StrToInt(BuscaPlanoOrigem( iIdPessJur, // CAMILLE - 03.12.2002
     //                                                                                         iIdTitular,
     //                                                                                         Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2)));
     qryBfciarioTitPlan.FieldByName('IdPlanoorigem').AsInteger := iIdPlanoPrev;


     // cguedes - 11/06/2002: neste momento cria-se o registro com IDPLANOPREV = IDPLANOORIGEM
     qryBfciarioTitPlan.FieldByName('IdPlanoPrev').AsInteger := iIdPlanoPrev;
     qryBfciarioTitPlan.FieldByName('IdBeneficio').AsInteger := iIdBenefReferencia;
     qryBfciarioTitPlan.FieldByName('Prioridade').AsFloat    := 0;
     qryBfciarioTitPlan.FieldByName('Percentual').AsFloat    := 100;
     qryBfciarioTitPlan.FieldByName('IdResponsavel').AsInteger := iIdPessoa;
     qryBfciarioTitPlan.Post;
  end; //with

  if not qryBenefReferencia.Locate('IdBeneficio;IdPessoa',varFields,[loCaseInsensitive])
  then begin
     bGravaBenefReferencia := True;
     qryBenefReferencia.Insert;
     qryBenefReferencia.FieldByName('NUMEROPROCESSO').AsInteger  := iNumeroProcesso;
     qryBenefReferencia.FieldByName('IDPESSJUR').AsInteger       := iIdPessJur;
     qryBenefReferencia.FieldByName('IDPLANOPREV').AsInteger     := iIdPlanoPrev;

     { Augusto 26/02/2007 }
     // CGUEDES - 23/07/2002
     //qryBenefReferencia.FieldByName('IDPLANOORIGEM').AsInteger   := StrToInt(BuscaPlanoOrigem( iIdPessJur, // CAMILLE - 03.12.2002
     //                                                                                         iIdTitular,
     //                                                                                         Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2)));
     qryBenefReferencia.FieldByName('IDPLANOORIGEM').AsInteger   := iIdPlanoPrev;

     qryBenefReferencia.FieldByName('IDTITULAR').AsInteger       := iIdTitular;
     qryBenefReferencia.FieldByName('IDPESSOA').AsInteger        := iIdPessoa;
     qryBenefReferencia.FieldByName('SEQPROPOSTA').AsInteger     := iSeqProposta;
     qryBenefReferencia.FieldByName('IDBENEFICIO').AsInteger     := iIdBenefReferencia;

     if sTipoFormChamador <> 'SI'
     then qryBenefReferencia.FieldByName('IDSITBENEFICIO').AsInteger  := 6 // Nao Concedido
     else qryBenefReferencia.FieldByName('IDSITBENEFICIO').AsInteger  := 8; // Nao Concedido

     qryBenefReferencia.FieldByName('IDDEPENDENCIA').AsString    := qryBeneficiario.FieldByName('IdDependencia').AsString;
     qryBenefReferencia.FieldByName('IDTPPAGTOBENEFIC').AsInteger := qryTpPgtoBenef.FieldByName('IDTPPAGTOBENEFIC').AsInteger;
     qryBenefReferencia.FieldByName('VALORCALCULADO').AsFloat    := StrToFloat(ClienteNumero(reValorCalcInss.Text));
     qryBenefReferencia.FieldByName('VLRCALCINSS').AsFloat       := StrToFloat(ClienteNumero(reValorCalcInss.Text));
     qryBenefReferencia.FieldByName('VLRINFINSS').AsFloat        := StrToFloat(ClienteNumero(reValorInfInss.Text));

     // CAMILLE - 20.06.2003
     if qryBeneficio.FieldByName('FLGTIPOGRAVAINSS').AsInteger = 0
     then begin
        qryBenefReferencia.FieldByName('VALORATUAL').AsFloat        := StrToFloat(ClienteNumero(reValorInfInss.Text));
        qryBenefReferencia.FieldByName('VALORTOTAL').AsFloat        := StrToFloat(ClienteNumero(reValorInfInss.Text));
     end
     else begin
        qryBenefReferencia.FieldByName('VALORATUAL').AsFloat        := StrToFloat(ClienteNumero(reValorCalcInss.Text));
        qryBenefReferencia.FieldByName('VALORTOTAL').AsFloat        := StrToFloat(ClienteNumero(reValorCalcInss.Text));
     end;

     qryBenefReferencia.FieldByName('DATAREQUERIMENTO').AsString := dtDataRequerimento.Text;
     qryBenefReferencia.FieldByName('DATAINICIO').AsString       := dtInicioINSS.Text;
     qryBenefReferencia.FieldByName('DATAFINAL').AsString        := dtDataFinal.Text;
     qryBenefReferencia.FieldByName('FLGFORMAPAGTO').AsString    := 'F';
     qryBenefReferencia.Post;
  end // with
  else begin // Editar beneficio de referencia
     bGravaBenefReferencia := True;
     qryBenefReferencia.Edit;
     qryBenefReferencia.FieldByName('VALORCALCULADO').AsFloat    := StrToFloat(ClienteNumero(reValorCalcInss.Text));
     qryBenefReferencia.FieldByName('VLRCALCINSS').AsFloat       := StrToFloat(ClienteNumero(reValorCalcInss.Text));
     qryBenefReferencia.FieldByName('VLRINFINSS').AsFloat        := StrToFloat(ClienteNumero(reValorInfInss.Text));
     qryBenefReferencia.FieldByName('VALORATUAL').AsFloat        := StrToFloat(ClienteNumero(reValorInfInss.Text));
     qryBenefReferencia.FieldByName('DATAREQUERIMENTO').AsString := dtDataRequerimento.Text;
     qryBenefReferencia.FieldByName('DATAINICIO').AsString       := dtInicioINSS.Text;
     qryBenefReferencia.FieldByName('DATAFINAL').AsString        := dtDataFinal.Text;
     qryBenefReferencia.Post;
  end;
end;

function TfrmCadRequerBenefBfciario.TestaQuitacaoDividas : boolean;
Var
  sDataSaldoEmprestimo : String;
  sMensagemErro        : String;
  fSaldoAtualizado,
  fSaldoDevedor,
  fParcelasAberto  : Currency;
  retButton            : Word;
begin
  // Quando o Pagamento do Beneficio é unico
  // Devemos verificar se o beneficio obriga quitar as dividas e se o Titular possui dividas.
  // Caso Positivo, A Situacao do Beneficio Permanece Pendente de Concessao ate que o Titular quite a divida
  Result := False;

  if (qryBeneficio.FieldByName('FLGQUITAPREVIDEN').AsString = '0') and bPossuiDivPrevid then
  begin
    MsgDlg('O participante '+sNomeTitular+ ' possui dívida previdenciária e o '+
              'plano não permite a Concessão deste benefício com este tipo de dívida. ',
              'Informação',mtInformation, [mbOk], 0);

    Exit;
  end;

  if (qryBeneficio.FieldByName('FLGQUITAASSISTEN').AsString = '0') and bPossuiDivAssist then
  begin
    MsgDlg('O participante '+sNomeTitular+ ' possui dívida assistencial e o '+
              'plano não permite a Concessão deste benefício com este tipo de dívida. ',
              'Informação',mtInformation, [mbOk], 0);
    Exit;
  end;

  iFlgEmprestimo := -1;
  if (qryBeneficio.FieldByName('FLGQUITAEMPRESTI').AsString = '1') then
  begin
     FazQuery(QryAux,' SELECT DATAPAGAMENTO FROM CTRLINTERFACE '+
                     ' WHERE  IDLOTE = '+IntToStr(iIdLoteConcessao));

    if QryAux.IsEmpty or (QryAux.FieldByName('DATAPAGAMENTO').AsString = '') then
      sDataSaldoEmprestimo := sDataPagamentoConcessao
    else
      sDataSaldoEmprestimo := QryAux.FieldByName('DATAPAGAMENTO').AsString;

     if not dtmDividaEP.ValorDevidoMutuario(qryDet.FieldByName('IdPessoa').AsInteger,
                                            StrToDate(sDataSaldoEmprestimo),
                                            -1,
                                            10,
                                            fSaldoAtualizado,
                                            fSaldoDevedor,
                                            fParcelasAberto,
                                            False, False ) then
    begin
        MsgDlg('Ocorreram erros na apuração do saldo devedor de empréstimo. Verifique.',
               'Erro',mtError,[mbOk],0);
        Exit;
     end;


    if fSaldoAtualizado > 0 then
    begin
      // ClaudioR - CM 22208 - 03/01/2006 - Inicio
      If MsgDlg('Saldo de empréstimo: ' + FormatFloat('#,0.00', fSaldoDevedor)    + #13 +
                'Itens em aberto:     ' + FormatFloat('#,0.00', fParcelasAberto)  + #13 +
                'Saldo atualizado:    ' + FormatFloat('#,0.00', fSaldoAtualizado) + '.'+ #13 + #13 +
                'Este saldo será descontado na Folha de Benefícios. Deseja continuar a concessão ? ',
                'Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrNo then
      begin
        If (qryBeneficio.FieldByName('FLGPERMITEQUITAR').AsString = '1') Then
        Begin
          If MsgDlg('Deseja continuar com a concessão sem quitar o empréstimo?', 'Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
          begin
            iFlgEmprestimo := 1;
            Result := True;     
            Exit;
          End;
        End;

        MsgDlg('Concessão cancelada.','Informação',mtInformation,[mbOK],0);
        Exit;
      end;

      iFlgEmprestimo := 0;
      if not(dtmDividaEP.QuitaContratosMutuario(qryDet.FieldByName('IdPessoa').AsInteger,
                                                StrToDate(sDataSaldoEmprestimo),
                                                dtDataEvento.Date,  // 24334
                                                8,
                                                'B',
                                                iIdLoteConcessao,
                                                sMensagemErro
                                                )) then
      begin
        MsgDlg('Ocorreram erros na quitação automática de empréstimo. Verifique.','Erro',mtError,[mbOk],0);
        Exit;
      end;
      // ClaudioR - CM 22208 - 03/01/2006 - Fim

    end; { if fSaldoAtualizado > 0 }
  end
  else
    iFlgEmprestimo := 2; // ClaudioR - CM 22208 - 27/12/2006

  Result := True;
end; // TestaQuitacaoDividas

function  TfrmCadRequerBenefBfciario.CalculaSaldoRealCont(piIdTipoReserva : integer; pdVlMovReal : double) : double;
var dVlSaldoCont : double;
begin
   Result := 0;

   //Lise - 19/10/2001 - Retirada da condição IDPESSOA IN (NULL,'''+IntToStr(iIdTitular)+''')
   // plics do IDTITULAR e substituído IN .
   qryaux.Close;
   qryaux.sql.clear;
   qryaux.sql.Add(' SELECT MAX(IDHISTRESERVA) , DATAMOV, SALDOREAL ,IDEVENTOGERADOR,IDBENEFICIO, '+
                  '        IDCONTRIBUICAO,VLRCOTAS,VLRREAL, SALDOREALCONT '+
                  ' FROM   HISTMOVRESERVA   '+
                  ' WHERE  (IDPLANOPREV   = '+IntToStr(iIdPlanoPrev)    +')'+
                  ' AND    (IDPESSJUR     = '+IntToStr(iIdPessJur)      +')'+
                  ' AND    (IDTIPORESERVA = '+IntToStr(piIdTipoReserva) +')'+
                  ' AND    (SEQPROPOSTA   = '+IntToStr(iSeqProposta)    +')'+
                  ' AND    ((IDPESSOA IS NULL) OR (IDPESSOA = '+IntToStr(iIdTitular) +'))'+
                  ' GROUP  BY DATAMOV, SALDOREAL,IDEVENTOGERADOR,IDBENEFICIO, '+
                  '        IDCONTRIBUICAO,VLRCOTAS,VLRREAL, SALDOREALCONT ');
   try
      qryaux.open;
   except
      Exit;
   end;

   if qryaux.IsEmpty
   then dVlSaldoCont := pdVlMovReal
   else begin
      qryaux.Last;
      if (qryaux.FieldByName('IDEVENTOGERADOR').AsString = '') and
         (qryaux.FieldByName('IDBENEFICIO').AsString     = '') and
         (qryaux.FieldByName('IDCONTRIBUICAO').AsString  = '') and
         (qryaux.FieldByName('VLRCOTAS').AsFloat <= 0) //o último lançamento foi uma atualização monetária
      then dVlSaldoCont := pdVlMovReal
      else dVlSaldoCont := qryaux.fieldbyname('SALDOREALCONT').AsFloat - pdVlMovReal;
   end;
   qryaux.close;
   Result := dVlSaldoCont;
end; //CalculaSaldoRealCont

function  TfrmCadRequerBenefBfciario.DevolveReserva(piIdBeneficio, piIdBeneficiario : longint)  : boolean;
var dValorTotalReserva,
    dValorDaCotaNaData,
    dNovoValorReserva,
    dValorADevolverEmCotas : double;
    sDataRef : string;

begin
   Result := False;
   dValorTotalReserva := 0;

   qryMovReservaTemp.First;
   while not qryMovReservaTemp.Eof do
   begin
       if (qryMovReservaTemp.FieldByName('IdBeneficio').AsInteger <> piIdBeneficio) or
          (qryMovReservaTemp.FieldByName('IdPessoa').AsInteger    <> piIdBeneficiario) 
       then begin
          qryMovReservaTemp.Next;
          continue;
       end;

       // Preencher valor da reserva do participante hoje
       if not qryReservaPart.Locate('IdTipoReserva', qryMovReservaTemp.FieldByName('IdTipoReserva').AsInteger,[loCaseInsensitive])
       then begin
          // nao encontrou a reserva
          qryMovReservaTemp.Next;
          continue;
       end;

       with qryReservaPart do
       begin
          Edit;
          FieldByName('VALORRESERVA').AsFloat := qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat;
          Post;
       end;

       qryMovReservaTemp.Delete;
   end;

   Result := True;
end; // DevolveReserva

function  TfrmCadRequerBenefBfciario.VerificaNumeroDependentes : boolean;
var iNumDepIRRF,
    iNumDepSalF,
    iNumDepIRRFCad,
    iNumDepSalFCad    : longint;
begin
  Result := False;
  // Verificar se o No. de Dependentes para IRRF e para Salario Familia coincidem
  // com o no. de dependentes cadastrados no sistemas que dizem que conta para IRRF
  // e para Salario Familia
  with qryAux do
  begin
     // CAMILLE - 06.02.2003
     // Se a fundacao parametrizou que utilizara o calculo automatica de numero
     // de dependentes, entao nao atualizar por esta rotina abaixo
     Close;
     SQL.Clear;
     SQL.Add(' SELECT VALORPARAM FROM PARAMFOLHA '+
             ' WHERE NOMEPARAM = ''FLGNUMDEPIRNUMDEPSALFAM'' ');
     Open;
     if (not IsEmpty) and (FieldbyName('VALORPARAM').AsString = '1')
     then begin
        Result := True;
        Exit;
     end;

     Close;
     SQl.Clear;
     SQL.Add(' SELECT NUMDEPIRRF, NUMDEPSALF FROM PESSOAFISICA WHERE IDPESSOA = '+IntToStr(iIdTitular));
     Open;
     if IsEmpty
     then begin
       iNumDepIRRF := 0;
       iNumDepSalF := 0;
     end
     else begin
       if Trim(FieldByName('NumDepIRRF').AsString) <> ''
       then iNumDepIRRF := FieldByName('NUMDEPIRRF').AsInteger
       else iNumDepIRRF := 0;
       if Trim(FieldByName('NumDepSALF').AsString) <> ''
       then iNumDepSalF := FieldByName('NUMDEPSALF').AsInteger
       else iNumDepSalF := 0;
     end;
  end;

  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT COUNT(IDPESSOA) AS NUMDEPIRRF FROM DEPENTIT '+
             ' WHERE IDTITULAR = '+IntToStr(iIdTitular)+
             ' AND   IDPESSOA <> IDTITULAR '+
             ' AND   FLGCONTAIMPOSTOR = 1 ');
     Open;
     if IsEmpty
     then iNumDepIRRFCad := 0
     else iNumDepIRRFCad := FieldByName('NumDepIRRF').AsInteger;

     if (iNumDepIRRF <> iNumDepIRRFCad)
     then begin
        if MsgDlg(' Existem '+IntToStr(iNumDepIRRFCad)+ ' dependentes cadastrados '+
                  ' no sistema para IRRF. Porém existem '+InttoStr(iNumDepIRRF)+
                  ' dependentes informados nos dados do participante. '+
                  ' Deseja atualizar este número no cadastro de participante ? ',
                  'Confirmação',mtConfirmation,[mbyes,mbno],0) = mrYes
        then begin
           Result := True;
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQl.Add(' UPDATE PESSOAFISICA SET NUMDEPIRRF = '+IntToStr(iNumDepIRRFCad)+
                          ' WHERE IDPESSOA = '+IntToStr(iIdTitular));
           try
             qryAux.ExecSQL;
           except
             Result := False;
           end;
        end
        else if MsgDlg(' Deseja continuar com o processo ? ','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrYes
             then Result := True
             else Result := False;

     end
     else Result := True;
  end;//with qryAux

  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT COUNT(IDPESSOA) AS NUMDEPSALF FROM DEPENTIT '+
             ' WHERE IDTITULAR = '+IntToStr(iIdTitular)+
             ' AND   IDPESSOA <> IDTITULAR '+
             ' AND   FLGCONTASALARIOF = 1 ');
     Open;
     if IsEmpty
     then iNumDepSalFCad := 0
     else iNumDepSalFCad := FieldByName('NumDepSALF').AsInteger;

     if (iNumDepSalF <> iNumDepSalFCad)
     then begin
        if MsgDlg(' Existem '+IntToStr(iNumDepSalFCad)+ ' dependentes cadastrados '+
                  ' no sistema para Salário Família. Porém existem '+InttoStr(iNumDepSalF)+
                  ' dependentes informados nos dados do participante. '+
                  ' Deseja atualizar este número no cadastro de participante ? ',
                  'Confirmação',mtConfirmation,[mbyes,mbno],0) = mrYes
        then begin
           Result := True;
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQl.Add(' UPDATE PESSOAFISICA SET NUMDEPSALF = '+IntToStr(iNumDepSalFCad)+
                          ' WHERE IDPESSOA = '+IntToStr(iIdTitular));
           try
             qryAux.ExecSQL;
           except
             Result := False;
           end;
        end
        else if MsgDlg(' Deseja continuar com o processo ? ','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrYes
             then Result := True
             else Result := False;
     end
     else Result := True;
  end;//with qryAux
end; // VerificaNumeroDependentes



function  TfrmCadRequerBenefBfciario.VerificaBeneficioObrigatorio : boolean;
var bExisteBenefDaMesmaOrdem,
    bExisteBenefNaoRequerido : boolean;
    iIdBeneficiarioAntes,
    iIdBenefAntes,
    iNumBenefNaoRequeridos : longint;
    sMsg ,
    sNomesBeneficios : string;
    varfields : variant;
begin
  Result := False;
  iIdBenefAntes        := qryDet.FieldByName('IdBeneficio').AsInteger;
  iIdBeneficiarioAntes := qryDet.FieldByName('IdPessoa').AsInteger;
  // Fazer verificacoes
  // Verificar se existem algum benefício obrigatorio no evento que não foi
  // requerido

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT B.IDBENEFICIO, B.NOME, B.NUMORDEMEVENTO '+
                 ' FROM BENEFICIO B, BENEFPLANPREV BP '+
                 ' WHERE  B.IDEVENTOGERADOR  = '+qryEvento.FieldByName('IdEventoGerador').AsString+
                 ' AND    B.FLGBENEFOBRIGATO = 1 '+
                 ' AND    BP.IDPLANOPREV     =  '+IntToStr(iIdPlanoPrev)+
                 ' AND    B.NUMORDEMEVENTO   <> '+OraNumero(qryDet.FieldByName('NumOrdemEvento').AsString)+
                 ' AND    BP.IDBENEFICIO     = B.IDBENEFICIO ');
  qryAux.Open;
  bExisteBenefNaoRequerido := False;
  sNomesBeneficios         := '';
  iNumBenefNaoRequeridos   := 0;

  while not qryAux.Eof do
  begin
     if not qryDet.Locate('IdBeneficio',qryAux.FieldbyName('IdBeneficio').AsInteger,[loCaseInsensitive])
     then begin
        // Verificar se tem outro beneficio da mesma ordem
        bExisteBenefDaMesmaOrdem := False;
        qryDet.First;
        while not qryDet.Eof do
        begin
           if (qryDet.FieldByName('NumOrdemEvento').AsInteger) =  (qryAux.FieldByName('NumOrdemEvento').AsInteger)
           then begin
              bExisteBenefDaMesmaOrdem := True;
              break;
           end;
           qryDet.Next;
        end;
        if not bExisteBenefDaMesmaOrdem
        then begin
           sNomesBeneficios := sNomesBeneficios +', '+qryAux.FieldByName('Nome').AsString;
           bExisteBenefNaoRequerido := True;
           inc(iNumBenefNaoRequeridos);
        end;
     end;
     qryAux.Next;
  end; //while

  // CAMILLE - REFER - 05.06.1999
  varFields := VarArrayCreate([0,1],varVariant);
  varFields[0] := iIdBenefAntes;
  varFields[1] := iIdBeneficiarioAntes;

  qryDet.Locate('IdBeneficio;IdPessoa',varFields,[loCaseInsensitive]);

  if bExisteBenefNaoRequerido
  then begin
     sNomesBeneficios := Copy(sNomesBeneficios,3,length(sNomesBeneficios) - 2);
     if iNumBenefNaoRequeridos = 1
     then sMsg := 'O benefício  '+sNomesBeneficios+ ' é obrigatório e não foi requerido.'
     else sMsg := 'Os benefícios '+sNomesBeneficios+ ' são obrigatórios e não foram requeridos.';

     if MsgDlg(sMsg+'Deseja confirmar o Requerimento do Processo '+IntToStr(iNumeroProcesso)+' ? ' ,
               'Confirmação',mtConfirmation,[mbYes,mbNo], 1) = mrNo
     then begin
        TiraSQL(qryAux);
        Exit;
     end;
  end;
  Result := True;
end; // VerificaBeneficioObrigatorio

function  TfrmCadRequerBenefBfciario.VerificaBeneficioRepetido    : boolean;
var bExisteBenefRepetido  : boolean;
    iNumBenefRepetido : integer;
    sMsg ,
    sNomesBeneficios : string;
begin
  Result := False;
  // Fazer verificacoes
  // Verificar se existem algum benefício obrigatorio no evento que não foi
  // Repetido
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT B.IDBENEFICIO, B.NOME, B.NUMORDEMEVENTO '+
                 ' FROM   BENEFICIO B, BENEFPLANPREV BP '+
                 ' WHERE  (B.IDEVENTOGERADOR = '+qryEvento.FieldByName('IdEventoGerador').AsString+')'+
                 ' AND    ((BP.FLGREFERENCIA  = 0 ) OR ((BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 0) ) ) '+
                 ' AND    (BP.IDPLANOPREV    = '+IntToStr(iIdPlanoPrev)+')'+
                 ' AND    (B.IDBENEFICIO     = BP.IDBENEFICIO) ');
  qryAux.Open;
  bExisteBenefRepetido := False;
  sNomesBeneficios     := '';
  iNumBenefRepetido    := 0;
  while not qryAux.Eof do
  begin
     if (qryDet.Locate('NumOrdemEvento',qryAux.FieldbyName('NumOrdemEvento').AsString,[loCaseInsensitive])) and
        (qryDet.FieldByName('IdBeneficio').AsString <> qryAux.FieldByName('IdBeneficio').AsString)
     then begin
        sNomesBeneficios := sNomesBeneficios +', '+qryAux.FieldByName('Nome').AsString;
        bExisteBenefRepetido := True;
        inc(iNumBenefRepetido);
     end;
     qryAux.Next;
  end; //while

  if bExisteBenefRepetido
  then begin
     sNomesBeneficios := Copy(sNomesBeneficios,3,length(sNomesBeneficios) - 2);
     if iNumBenefRepetido = 1
     then sMsg := 'O benefício  '+sNomesBeneficios+ ' possui o mesmo número de '+
                  'ordem de outro benefício neste processo. '
     else sMsg := 'Os benefícios '+sNomesBeneficios+ ' possum o mesmo número de ordem '+
                  'de outro benefício neste processo. ' ;

     if MsgDlg(sMsg+'Deseja confirmar o Requerimento do Processo '+IntToStr(iNumeroProcesso)+' ? ' ,
               'Confirmação',mtConfirmation,[mbYes,mbNo], 1) = mrNo
     then begin
        TiraSQL(qryAux);
        Exit;
     end;
  end;
  Result := True;
end; // VerificaBeneficioRepetido

function  TfrmCadRequerBenefBfciario.VerificaContribAtrasada (var sMesAtraso : string) : boolean;
var sMesRef : string;
begin
  Result := False;

  // Verificar se participante tem contribuicoes atrasadas
  frmAguarde.Mostra('Verificando contribuições atrasadas ... ');

  sMesRef := FormatDateTime('yyyy/mm', dtInicioFund.Date);  // 24334

  // Lise - 18/10/2001 - Inclusão de plics para o campo  SITRECEBIMENTO
  with qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT HST.MESREFERENCIA FROM HSTCONTRIBPREV HST '+
            ' WHERE (HST.IDPESSOA      = ' + IntToSTr(iIdTitular)   + ')' +
            '   AND (HST.IDPESSJUR     = ' + IntToSTr(iIdPessJur)   + ')' +
            '   AND (HST.IDPLANOPREV   = ' + IntToSTr(iIdPlanoPrev) + ')' +
            '   AND (HST.SEQPROPOSTA   = ' + IntToSTr(iSeqProposta) + ')' +
            '   AND (HST.VALORESPERADO > 0 )  '+
            // Gleyber - 19/06/2007 - Pendência 25647 - Início
            //' AND (HST.SITRECEBIMENTO <> ''2'') '+
            //' AND (HST.SITRECEBIMENTO <> ''5'') '+
            //' AND (HST.SITRECEBIMENTO <> ''9'') '+
            '   AND (HST.SITRECEBIMENTO IN (''0'',''1'',''3'')) '+
            // Gleyber - 19/06/2007 - Pendência 25647 - Fim
            '   AND (HST.MESREFERENCIA < '''+sMesRef+''') '+
            '   AND (HST.MESCOBRANCA   < '''+sAnoMesLoteConcessao+''')'+
            '   AND (HST.IDMOTIVO      <> '+IntToStr(prmIdMotDevolNaoIden)+')'+
            '   AND (HST.IDCONTRIBUICAO NOT IN (SELECT IDCONTRIBUICAO FROM PARAMDOTACAO '+
            '                                   WHERE  IDPESSJUR   = '+IntToSTr(iIdPessJur)+
            '                                     AND  IDPLANOPREV = '+IntToSTr(iIdPlanoPrev)+') )'+
            ' ORDER BY HST.MESREFERENCIA DESC');
    Open;

    if not IsEmpty then
    begin
      sMesAtraso := FieldByName('MesReferencia').AsString;
      Result     := True;
    end;

    Close;
  end; //with

  frmAguarde.Apaga;
end; // VerificaContribAtrasada


function  TfrmCadRequerBenefBfciario.CobraContribAtrasada(piIdPessJur, piIdPlanoPrev,
                                    piIdPessoa, piSeqProposta : longint;
                                   psDataInicioFund : string) : boolean;
var sMesRef           : string;
    dValorPorBeneficiario : double;
    iContBeneficiario     : longint;

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
    sMsgErro : String; //leocm - 28042005
    iNumRecebimento : LongInt; //Bruno Bastos - Pend. 20518 - 25/10/2005
begin
   Result := False;

   // Se o participante falecido tiver contribuicoes atrasadas, o sistema deve :
   // 1. Acertar o histórico do participante inserindo uma devolucao para ele
   // 2. Inserir o registro de devolucao na TMPDESC para ser descontado dos
   //    dependentes
   frmAguarde.Mostra('Atualizando contribuições atrasadas ... ');

   sMesRef := Copy(psDataInicioFund,7,4)+'/'+Copy(psDataInicioFund,4,2);

   // Lise - 18/10/2001 - Inclusão de plics para o campo  SITRECEBIMENTO
   with qryAux do
   begin
     Close;

     SQL.Clear;
     SQL.Add(' SELECT HST.MESREFERENCIA,  HST.MESCOBRANCA,    HST.IDMOTIVO,   '+
             '        HST.NUMRECEBIMENTO, HST.VALORESPERADO,  HST.VALOROP1,   '+
             '        HST.VALOROP2,       HST.VALOROP3,       HST.DATAINICIO, '+
             '        HST.DATAFINAL,      HST.IDCONTRIBUICAO, RP.CODPROVDESC, '+
             '        RP.IDRUBRICA                                            '+
             ' FROM   CONTPREV CP, RUBRICAXPESS RP, HSTCONTRIBPREV HST  '+
             ' WHERE  (HST.IDPESSOA       = '  +IntToSTr(iIdTitular)  +')'+
             ' AND    (HST.IDPESSJUR      = '  +IntToSTr(iIdPessJur)  +')'+
             ' AND    (HST.IDPLANOPREV    = '+IntToSTr(iIdPlanoPrev)+')'+
             ' AND    (HST.SEQPROPOSTA    = '+IntToSTr(iSeqProposta)+')'+
             ' AND    (HST.VALORESPERADO > 0 )  '+
             ' AND    (HST.SITRECEBIMENTO <> ''2'') '+
             ' AND    (HST.SITRECEBIMENTO <> ''5'') '+
             ' AND    (HST.SITRECEBIMENTO <> ''9'') '+
             ' AND    (HST.MESREFERENCIA < '''+sMesRef+''') '+
             ' AND    (HST.IDCONTRIBUICAO NOT IN (SELECT IDCONTRIBUICAO FROM PARAMDOTACAO '+
             '                                    WHERE  IDPESSJUR   = '+IntToSTr(iIdPessJur)+
             '                                    AND    IDPLANOPREV = '+IntToSTr(iIdPlanoPrev)+') )'+
             ' AND    (CP.IDPLANOPREV    = HST.IDPLANOPREV)             '+
             ' AND    (CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)          '+
             ' AND    (RP.IDRUBRICA      = CP.IDRUBRICAATRASO)          '+
             ' AND    (RP.IDPESSOA       = '+IntToStr(iIdFundacao)+')   ' );
     Open;

     if IsEmpty then
     begin
       MsgDlg('Contribuições Atrasadas com parâmetros incompletos. '+#13+
              'Verifique se as contribuições possuem rubrica de atraso e se as mesmas '+
              'estão associadas à Fundação.','Erro',mtError,[mbOk],0);

       frmAguarde.Apaga; //ClaudioR - 22119 - 04/09/2007
       Exit;
     end;

     while not Eof do
     begin
       // Acertar histórico do participante
       iNumRecebimento := InsereHstContribPREV( dtmAPrev.qryAux,
                                                iIdTitular,
                                                1,
                                                iIdPessJur,
                                                iIdPlanoPrev,
                                                FieldByName('IdContribuicao').AsInteger,
                                                prmIDMOTIVOFOLHABEN,
                                                FieldByName('MesReferencia').AsString,
                                                FormatDateTime('yyyy/mm', StrToDate(sDataPagamentoConcessao)), // 24334
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
                                                0, // FlgCalcReserva ??? Verificar o que fazer
                                                0,
                                                1,
                                                1 );

       If iNumRecebimento < 0 then //Bruno Bastos - Pend. 20518 - 25/10/2005
       Begin
         frmAguarde.Apaga; //ClaudioR - 22119 - 04/09/2007
         Exit;
       End;

       dtmAPrev.qryAux.Close;
       dtmAPrev.qryAux.SQL.Clear;
       dtmAPrev.qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV SET SITRECEBIMENTO = 9  '+
                               ' WHERE  MESREFERENCIA  = '''+FieldByName('MESREFERENCIA').AsString+ ''''+
                               ' AND    MESCOBRANCA    = '''+FieldByName('MESREFERENCIA').AsString+ ''''+
                               ' AND    IDMOTIVO       =   '+FieldByName('IDMOTIVO').AsString+
                               ' AND    NUMRECEBIMENTO =   '+FieldByName('NUMRECEBIMENTO').AsString);
       try
         dtmAPrev.qryAux.ExecSQL;
       except
         frmAguarde.Apaga; //ClaudioR - 22119 - 04/09/2007
         Exit;
       end;

       // Contar quantos beneficiario tem e guardar o IdPessoa de Cada um deles
       qryDet.First;
       iContBeneficiario := 0;
       while not qryDet.Eof do
       begin
          if (qryDet.FieldByName('IdSitBeneficio').AsInteger = 1) or
             (qryDet.FieldByName('IdSitBeneficio').AsInteger = 2) or
             (qryDet.FieldByName('FLGPECULIO').AsInteger = 1)  //leorefer - 0910 - inicio/fim
          then inc(iContBeneficiario);
          qryDet.Next;
       end;

       dValorPorBeneficiario := FieldByName('ValorEsperado').AsFloat / iContBeneficiario;

       qryDet.First;
       while not qryDet.Eof do
       begin

         // ******************************************************************************
         // Preencher Informacoes de Integracao com Financeiro e Contabilidade
         // ******************************************************************************
         if not dtmAPrevIntegraBack.BuscaInfIntegra( iIdPessJur,
                                                     iIdPlanoPrev,
                                                     iIdTitular,
                                                     qryDet.FieldByName('IdPessoa').AsInteger,
                                                     FieldByName('IdContribuicao').AsInteger,
                                                     'C',
                                                     'B',
                                                     0,
                                                     FormatDateTime('yyyy/mm', StrToDate(sDataPagamentoConcessao)), // 24334
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
                                                     sPlaContaDProvis,    // Gleyber - 11/01/2006 - Pendência 19538
                                                     sPlaContaCProvis,    // Gleyber - 11/01/2006 - Pendência 19538
                                                     sUnidNegoc,
                                                     sIdEmpresaProp,
                                                     'R',  // Gleyber - 12/09/2005 - Pendência 20169
                                                     True,
                                                     sMsgErro ) then //leocm - 28042005
         begin
            MsgDlg('Acerto de Contribuição : Erro ao buscar parametrização financeira. Verifique.','Erro',mtError,[mbOk],0);
            frmAguarde.Apaga; //ClaudioR - 22119 - 04/09/2007
            Exit;
         end;

         // Inserir divida na TMPDESC rateada por beneficiario
         if not InsereTMPDESC ( dtmAPrev.qryAux,
                                '',               // psCODALTERADOR
                                sCodCentroCustoC, // psCODCENTROCUSTOC
                                sCodCentroCustoD, // psCODCENTROCUSTOD
                                sCodCentroRespon, // psCODCENTRORESPON
                                '',               // psCODDOCUMENTOEFET
                                '',               // psCODDOCUMENTOPREV
                                sCodPortForma,    // psCODPORTFORMA
                                FieldByName('CodProvDesc').AsString,
                                sCodSubConta,    // psCODSUBCONTA
                                sCodTipDoc,      // psCODTIPDOC
                                sCodTipRecDes,   // psCODTIPRECDES
                                '',              // psCOMPLDOCUMENTO
                                sDataPagamentoConcessao,
                                '',              // psDATARECEBIMENTO
                                sDataPagamentoConcessao,
                                'Contrib. atrasada de particip. falecido. ',
                                '',              // psEXERCICIO
                                '',              // psFLGALTERADOR
                                'A',             // psFLGATRASODEVOL
                                'B',             // psFLGDESCFOLHA
                                '1',             // psFLGDESCONTO
                                '1',             // psFLGEXISTEHST
                                '',
                                'P',             // psFLGTIPODESC
                                FieldByName('IdContribuicao').AsString,    // psIDDESCONTO
                                sIdEmpresaProp,                            // psIDEMPCOBRANCA
                                sIdEmpresaProp,                            // psIDEMPRESA
                                sIdEmpresaProp,                            // psIDEMPRESAPROP
                                '',                                        // psIDFAVORECIDO
                                IntToStr(iIdFundacao),                     // psIDFUNDACAO
                                IntToStr(iIdLoteConcessao),                // psIDLOTE
                                '16',                                      // psIDMODULO
                                IntToStr(prmIdMotivoFOLHABEN),             // psIDMOTIVO
                                IntToStr(iIdPessJur),                      // psIDPESSJUR
                                qryDet.FieldByName('IdPessoa').AsString,
                                IntToStr(iIdPlanoPrev),                    // psIDPLANOPREV
                                IntToStr(iIdPlanoPrev),                    // psIDPLANPREVCONTAB
                                FieldByName('IdRubrica').AsString,         // psIDPROVENTO
                                IntToStr(iIdTitular),                      // psIDTITULAR
                                qryTitular.FieldByName('InscricaoNumero').AsString,
                                qryTitular.FieldByName('Matricula').AsString,
                                FormatDateTime('yyyy/mm', StrToDate(sDataPagamentoConcessao)), // 24334
                                FieldByName('MesReferencia').AsString,
                                '',                            // psNODOCUMENTO
                                '',                            // psPERIODO
                                sPlaContaC,                    // psPLACONTAC
                                sPlaContaD,                    // psPLACONTAD
                                sPlano,                        // psPLANO
                                'P',                           // psRECPAG
                                '***',                         // psREFERENCIA
                                '1',                           // psSEQPROPOSTA
                                '16',                          // SISTORIGEM
                                '0',                           // psSITENVIO
                                prmTpOperFolhaBen,             // psTIPCODIGO,
                                sUnidNegoc,                    // psUNIDNEGOC,
                                FloatToStr(dValorPorBeneficiario),
                                FieldByName('ValorOp1').AsString,      // psVALORBASE1,
                                FieldByName('ValorOp2').AsString,      // psVALORBASE2,
                                FieldByName('ValorOp3').AsString,      // psVALORBASE3,
                                '',                                    // psVALORINFO,
                                '',                                    // psVALORRECEBIDO
                                iNumRecebimento //NUMRECEBIMENTO //Bruno Bastos - Pend. 20518 - 25/10/2005
                      ) then
         Begin
           frmAguarde.Apaga; //ClaudioR - 22119 - 04/09/2007
           Exit;
         End;

         qryDet.Next;
       end;

       Next;
     end;
   end; //with

   frmAguarde.Apaga;

   Result := True;
end; // CobraContribAtrasada

// ********************************** ********************** *************************
// ********************************** PROCEDIMENTOS OVERRIDE *************************
// ********************************** ********************** *************************
procedure TfrmCadRequerBenefBfciario.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  // Se for concessao de beneficio, desbilitar o inserir
  sbtnInserir.Enabled  := ((sTipoFormChamador <> 'CO') and (sTipoFormChamador <> 'MA'));
  sbtnConceder.Enabled :=  (sTipoFormChamador  = 'CO') and (not qryDet.IsEmpty);
  sbtnProcurar.Enabled :=  (sTipoFormChamador <> 'EV');

  sbtnImprimirSimulacao.Visible := False;
  sbtnImprimirSimulacao.Enabled := False;

  sbtnDemonsSRB.Visible         := False;
  sbtnDemonsSRB.Enabled         := False;

  if sTipoFormChamador = 'SI' then
  begin
    if not prmFlgGravaSimulBenef then
      sbtnProcurar.Enabled      := False
    else
      sbtnProcurar.Enabled      := True;

    sbtnImprimirSimulacao.Visible := True;
    sbtnImprimirSimulacao.Enabled := True;
  end
  else
  begin
    sbtnDemonsSRB.Visible         := True;
    sbtnDemonsSRB.Enabled         := True;
  end;
end;

procedure TfrmCadRequerBenefBfciario.CmeCadastroConfirma(Sender: TObject);
begin
   try
      with qryBenefAux do
         if Active and UpdatesPending then CancelUpdates;

//      inherited;
      with qry do begin
         if qry.State in [dsEdit, dsInsert] then qry.Post;
         if Active and UpdatesPending
         then ApplyUpdates;
      end;

      with qryBfciarioTitPlan do
         if Active and UpdatesPending then ApplyUpdates;

      with qryDet do
         if Active and UpdatesPending
         then begin
            updDet.ModifySQL.Clear;
            if (sTipoFormChamador = 'CO') and bConcedeuBeneficio
            then updDet.ModifySQL.Add( ' UPDATE BENEFBFCIARIO                              '+
                                       ' SET                                               '+
                                       '   CODPORTFORMA = :CODPORTFORMA,                   '+
                                       '   IDSITBENEFICIO = :IDSITBENEFICIO,               '+
                                       '   IDDEPENDENCIA = :IDDEPENDENCIA,                 '+
                                       '   IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC,           '+
                                       '   DATAREQUERIMENTO = :DATAREQUERIMENTO,           '+
                                       '   DATAINICIO = :DATAINICIO,                       '+
                                       '   DATAFINAL = :DATAFINAL,                         '+
                                       '   FLGFORMAPAGTO = :FLGFORMAPAGTO,                 '+

                                       { Augusto 11/03/2005 - Atualizar VALORATUAL E VALORTOTAL }
                                       '   VALORATUAL = :VALORATUAL,                       '+
                                       '   VALORTOTAL = :VALORTOTAL,                       '+

                                       { Augusto 11/01/2006 - Atualizar FLGPAGAINSS }
                                       '   FLGPAGAINSS = :FLGPAGAINSS,                     '+

                                       '   VALORCALCULADO = :VALORCALCULADO,               '+
                                       '   VLRCALCINSS = :VLRCALCINSS,                     '+
                                       '   VLRINFINSS = :VLRINFINSS,                       '+
                                       '   DATAINICIOINSS = :DATAINICIOINSS,               '+
                                       '   NUMPROCINSS = :NUMPROCINSS,                     '+
                                       '   DATAINICIOFUND = :DATAINICIOFUND,               '+
                                       '   VALORCOTAS = :VALORCOTAS,                       '+
                                       '   DATACONCESSAO = :DATACONCESSAO,                 '+
                                       '   FLGPROVISORIO = :FLGPROVISORIO,                 '+
                                       '   PERCPROVISORIO = :PERCPROVISORIO,               '+
                                       '   PRAZOPROVISORIO = :PRAZOPROVISORIO,             '+
                                       '   DIBBENEFANT = :DIBBENEFANT,                     '+
                                       '   VALORBENEFANT = :VALORBENEFANT,                 '+
                                       '   VALORBINSSANT1 = :VALORBINSSANT1,               '+
                                       '   VALORBINSSANT2 = :VALORBINSSANT2,               '+
                                       '   VALORBINSSANT3 = :VALORBINSSANT3,               '+
                                       '   FLGBENEFMIN = :FLGBENEFMIN,                     '+
                                       '   VALORSRB = :VALORSRB                            '+
                                       ' WHERE                                             '+
                                       '   NUMEROPROCESSO = :OLD_NUMEROPROCESSO AND        '+
                                       '   IDPESSJUR = :OLD_IDPESSJUR AND                  '+
                                       '   IDTITULAR = :OLD_IDTITULAR AND                  '+
                                       '   IDPLANOPREV = :OLD_IDPLANOPREV AND            '+
                                       '   IDPESSOA = :OLD_IDPESSOA AND                    '+
                                       '   SEQPROPOSTA = :OLD_SEQPROPOSTA AND              '+
                                       '   IDBENEFICIO = :OLD_IDBENEFICIO                  ')
            else updDet.ModifySQL.Add( ' UPDATE BENEFBFCIARIO                              '+
                                       ' SET                                               '+
                                       '   CODPORTFORMA = :CODPORTFORMA,                   '+
                                       '   IDSITBENEFICIO = :IDSITBENEFICIO,               '+
                                       '   IDDEPENDENCIA = :IDDEPENDENCIA,                 '+
                                       '   IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC,           '+
                                       '   VALORATUAL = :VALORATUAL,                       '+
                                       '   DATAREQUERIMENTO = :DATAREQUERIMENTO,           '+
                                       '   DATAINICIO = :DATAINICIO,                       '+
                                       '   DATAFINAL = :DATAFINAL,                         '+
                                       '   FLGFORMAPAGTO = :FLGFORMAPAGTO,                 '+
                                       '   VALORCALCULADO = :VALORCALCULADO,               '+
                                       '   DATAULTREAJUSTE = :DATAULTREAJUSTE,             '+
                                       '   VLRCALCINSS = :VLRCALCINSS,                     '+
                                       '   VLRINFINSS = :VLRINFINSS,                       '+
                                       '   DATAINICIOINSS = :DATAINICIOINSS,               '+
                                       '   NUMPROCINSS = :NUMPROCINSS,                     '+
                                       '   DATAINICIOFUND = :DATAINICIOFUND,               '+
                                       '   VALORCOTAS = :VALORCOTAS,                       '+
                                       '   VALORTOTAL = :VALORTOTAL,                       '+
                                       '   DATACONCESSAO = :DATACONCESSAO,                 '+
                                       '   FLGPROVISORIO = :FLGPROVISORIO,                 '+
                                       '   PERCPROVISORIO = :PERCPROVISORIO,               '+
                                       '   PRAZOPROVISORIO = :PRAZOPROVISORIO,             '+
                                       '   ULTMESREAJUSTE = :ULTMESREAJUSTE,               '+
                                       '   ULTVALORATUALREAJ = :ULTVALORATUALREAJ,         '+
                                       '   DIBBENEFANT = :DIBBENEFANT,                     '+
                                       '   VALORBENEFANT = :VALORBENEFANT,                 '+
                                       '   VALORBINSSANT1 = :VALORBINSSANT1,               '+
                                       '   VALORBINSSANT2 = :VALORBINSSANT2,               '+
                                       '   VALORBINSSANT3 = :VALORBINSSANT3,               '+
                                       '   FLGBENEFMIN = :FLGBENEFMIN,                     '+

                                       { Augusto 03/11/2005 }
                                       '   VALORNADIB = :VALORNADIB,                       '+

                                       { Augusto 11/01/2006 - Atualizar FLGPAGAINSS }
                                       '   FLGPAGAINSS = :FLGPAGAINSS,                     '+

                                       '   VALORSRB = :VALORSRB                            '+
                                       ' WHERE                                             '+
                                       '   NUMEROPROCESSO = :OLD_NUMEROPROCESSO AND        '+
                                       '   IDPESSJUR = :OLD_IDPESSJUR AND                  '+
                                       '   IDPLANOPREV = :OLD_IDPLANOPREV AND              '+
                                       '   IDPLANOORIGEM = :OLD_IDPLANOORIGEM AND              '+
                                       '   IDTITULAR = :OLD_IDTITULAR AND                  '+
                                       '   IDPESSOA = :OLD_IDPESSOA AND                    '+
                                       '   SEQPROPOSTA = :OLD_SEQPROPOSTA AND              '+
                                       '   IDBENEFICIO = :OLD_IDBENEFICIO                  ');
            ApplyUpdates;
         end;

      if sTipoFormChamador <> 'SI'
      then begin
         with qryReservaPart do
            if Active and UpdatesPending then ApplyUpdates;

         with qryMovReservaTemp do
            if Active and UpdatesPending then ApplyUpdates;

      end;

      // Gleyber - 26/01/2004 - Pendência 15925 - Início
      with qryDepentit do
         if Active and UpdatesPending then ApplyUpdates;
      // Gleyber - 26/01/2004 - Pendência 15925 - Fim

      with qryBenefReferencia do
         if Active and UpdatesPending then ApplyUpdates;

      with qryRelBenefPart do
         if Active and UpdatesPending then ApplyUpdates;

      with qryRelBenefPart do
         if Active and UpdatesPending and bGravaBenefReferencia then ApplyUpdates;

      // Gleyber - 23/03/2005 - Pendência 18272 - Início
      With qryDResPart Do
       If (Active) And (UpdatesPending)
        Then ApplyUpdates;

      With qryDesindRes do
       If (Active) And (UpdatesPending)
        Then ApplyUpdates;
      // Gleyber - 23/03/2005 - Pendência 18272 - Fim

      SelecionaProcesso(qry.FieldByName('NumeroProcesso').AsInteger);

   except
      raise;
   end;

{ Delphi 3
   try
      qryBenefAux.CancelUpdates;

      if qry.State in [dsEdit, dsInsert]   then qry.Post;
      if qry.UpdatesPending                then qry.ApplyUpdates;
// Antes de Testar se existem Alteracoes testar se esta Ativa Augusto 15/08/00
      if (qryBfciarioTitPlan.Active = True) And (qryBfciarioTitPlan.UpdatesPending) then begin
        qryBfciarioTitPlan.ApplyUpdates;
      end;
      if qryDet.UpdatesPending             then qryDet.ApplyUpdates;
      if qryReservaPart.UpdatesPending     then qryReservaPart.ApplyUpdates;

       if qryMovReservaTemp.UpdatesPending  then qryMovReservaTemp.ApplyUpdates;

     // Antes de Testar se existem Alteracoes testar se esta Ativa Augusto 15/08/00
     if (qryRelBenefPart.Active = True) And (qryRelBenefPart.UpdatesPending) then
          qryRelBenefPart.ApplyUpdates;

      if bGravaBenefReferencia  and qryBenefReferencia.UpdatesPending
      then qryBenefReferencia.ApplyUpdates;
   except
      raise;
   end;

//   inherited;

   SelecionaProcesso(qry.FieldByName('NumeroProcesso').AsInteger);
   }
end; // CmeCadastro.Confirma(Self)

procedure TfrmCadRequerBenefBfciario.CmeCadastroCancel(Sender: TObject);
begin
  try
      // Gleyber - 26/01/2004 - Pendência 15925 - Início
      with qryDepentit do
         if Active and UpdatesPending then CancelUpdates;
      // Gleyber - 26/01/2004 - Pendência 15925 - Fim

     with qryBenefReferencia do
        if Active and UpdatesPending then CancelUpdates;

     with qryBfciarioTitPlan do
        if Active and UpdatesPending then CancelUpdates;

     with qryMovReservaTemp do
        if Active and UpdatesPending then CancelUpdates;

     // Gleyber - 23/03/2005 - Pendência 18272 - Início
     With qryDResPart Do
      If (Active) And (UpdatesPending)
       Then CancelUpdates;

     With qryDesindRes do
      If (Active) And (UpdatesPending)
       Then CancelUpdates;
     // Gleyber - 23/03/2005 - Pendência 18272 - Fim

  except
     raise;
  end;



  inherited;

  { Augusto 14/01/2005 }
  if (sTipoFormChamador = 'CO') and (dtmBaseDados.dbBaseDados.InTransaction)
  then dtmBaseDados.dbBaseDados.RollBack;

end;

procedure TfrmCadRequerBenefBfciario.CmeCadastroDelete(Sender: TObject);
begin
  // Verificar restricoes a exclusao
  qryMovReservaTemp.First;
  while not qryMovReservaTemp.Eof do
  begin
     qryMovReservaTemp.Delete;
  end;

  qryRelBenefPart.First;
  while not qryRelBenefPart.Eof do
  begin
     qryRelBenefPart.Delete;
  end;

  qryDet.First;
  while not qryDet.Eof do
  Begin
     qryDet.Delete;
  end;
  qry.Delete;
  dtmBaseDados.dbBaseDados.ApplyUpdates([qryRelBenefPart,qryMovReservaTemp,qryDet,qry]);
  SelecionaProcesso(-1);
end; // CmeCadastro.Delete(Self)

procedure TfrmCadRequerBenefBfciario.CmeCadastroInsert(Sender: TObject);
begin
   iNumeroProcesso := LeUltRegistro(qryAux,'PROCESSOBENEF');
   SelecionaProcesso(iNumeroProcesso);
   iNumBenef := 0;

   inherited;
   pnlMestre.Enabled    := True;
   // cguedes - 12/12/2002
   bbtnProcurar.visible := True;
   //P.Ramos 11.06.2001

   {A data do evento na tela deve ser igual a data de evento da tela de
    registro do evento e não a data de hoje}
   dtDataEvento.Date        := StrToDate(sDataEvento);

   qry.FieldByName('DtEvento').AsDateTime   := dtDataEvento.Date;
   qry.FieldByName('DtDireito').AsDateTime  := date;

   lblNumProcesso.Caption   := 'Processo Nº ' + IntToStr(iNumeroProcesso);
   lblSitProcesso.Caption   := 'Situação : Pendente de Concessão';

   bGravaBenefReferencia    := False;
   bExecutouRegraConcessao  := False;
   lblNomeBenef.Caption     := '';
   sValorTotal              := '0';
   sValorInfInss            := '0';
   sValorCalcInss           := '0';
   iFlgTipoINSS             := 2;
   sDataInicioPagto         := FormatDateTime('dd/mm/yyyy', date); // 24334
end; // CmeCadastro.Insert(Self)



procedure TfrmCadRequerBenefBfciario.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   pnlMestre.Enabled    := True;
   // cguedes - 12/12/2002
   bbtnProcurar.visible := False;
   bGravaBenefReferencia := False;
   bExecutouRegraConcessao := False;
   bConcedeuBeneficio      := False;
   bPerguntouCancelar := False;


   // Desabilitar itens que nao possam ser alterados nem na MANUTENCAO DE PROCESSO
   if ((sTipoFormChamador = 'MA') and (qry.FieldbyName('IDSITPROCESSO').AsInteger <> 4)) // CAMILLE - 24.09.2002
   then begin
      dtInicioFund.Enabled       := True;
      dtInicioINSS.Enabled       := True;
      reValorCalcInss.Enabled    := False;
      reValorInfINSS.Enabled     := False;
      reValorBeneficio.Enabled   := False;
      reValorSRB.Enabled         := False;
      dtDataRequerimento.Enabled := True;
      dtDataInicio.Enabled       := True;
      dtDataFinal.Enabled        := True;
      pnlBenefProv.Enabled       := False;
      dblkcmbTpPgtoBenef.Enabled := False;
   end
   else begin
      dtInicioFund.Enabled       := True;
      dtInicioINSS.Enabled       := True;
      reValorCalcInss.Enabled    := True;
      reValorInfINSS.Enabled     := True;
      reValorBeneficio.Enabled   := True;
      reValorSRB.Enabled         := True;
      dtDataRequerimento.Enabled := True;
      dtDataInicio.Enabled       := True;
      dtDataFinal.Enabled        := True;
      pnlBenefProv.Enabled       := True;
      dblkcmbTpPgtoBenef.Enabled := True;
   end;

end; // CmeCadastro.Edit(Self)

procedure TfrmCadRequerBenefBfciario.CmeDetalheConfirma(Sender: TObject);
begin
  //
  inherited;
end; // CmeDetalhe.Confirma(Self)

procedure TfrmCadRequerBenefBfciario.CmeCadastroFind(Sender: TObject);
var sTempoServAnoDigitado,
    sTempoServMesDigitado,
    sTempoServDiaDigitado : string;
begin
  inherited;
  if ((MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> ''))
     Or ((bFlgBenefMorte) And (MontaSelect.ValoresChave[0] <> '')) // Gleyber - 24/10/2006 - Pendência 23246
  then begin
     iNumeroProcesso := StrToInt(MontaSelect.ValoresChave[0]);
     iIdTitular      := StrToInt(MontaSelect.ValoresChave[1]);
     iSeqProposta    := StrToInt(MontaSelect.ValoresChave[2]);
     iIdPessJur      := StrToInt(MontaSelect.ValoresChave[3]);
     iIdPlanoPrev    := StrToInt(MontaSelect.ValoresChave[4]);
     { Augusto 19/03/2004 }
     iIdPlanoPrevTit := StrToInt(MontaSelect.ValoresChave[5]);

     bQueryTitular := False;
     bQuerySalarios := False;
     bQueryContribuicoes := False;
     bPerguntouCancelar := False;

     if sTipoFormChamador <> 'SI' then sbtnCadContaCorrente.Enabled := True; // CAMILLE - 05.08.2004
     if sTipoFormChamador <> 'SI' then sbtnDemonsSRB.Enabled        := True; // CAMILLE - 05.08.2004

     // FUNCEF - Se o chamador for uma SIMULACAO , entao pedir o tempo de servico
     if sTipoFormChamador = 'SI'
     then begin
        Application.CreateForm(TfrmLerTempoServico, frmLerTempoServico);
        frmLerTempoServico.ShowModal;
        if frmLerTempoServico.ModalResult <> mrOk
        then Exit;
        sTempoServAnoDigitado := OraNumero(frmLerTempoServico.edTempoServTotal.Text);
        sTempoServMesDigitado := OraNumero(frmLerTempoServico.edTempoServMes.Text);
        sTempoServDiaDigitado := OraNumero(frmLerTempoServico.edTempoServDia.Text);
        frmLerTempoServico.Free;

        dtmAPrev.qry.Close;
        dtmAPrev.qry.Sql.Clear;
        dtmAPrev.qry.Sql.Add(' SELECT TEMPOSERVTOTAL, TEMPOSERVTOTMES, TEMPOSERVTOTDIA  '+
                             ' FROM   ELEGPATRO '+
                             ' WHERE  IDPESSJUR = ' +IntToStr(iIdPessJur) + ' AND ' +
                             '        IDPESSOA  = ' +IntToStr(iIdTitular));
        dtmAPrev.qry.Open;

        sTempoServAnoAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTAL').AsString);
        sTempoServMesAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTMES').AsString);
        sTempoServDiaAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTDIA').AsString);

        dtmAPrev.qry.Close;
        dtmAPrev.qry.Sql.Clear;
        dtmAPrev.qry.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVTOTAL   = '+ sTempoServAnoDigitado +', '+
                             '                      TEMPOSERVTOTMES  = '+ sTempoServMesDigitado +', '+
                             '                      TEMPOSERVTOTDIA  = '+ sTempoServDiaDigitado +
                             ' WHERE IDPESSJUR = ' + IntToStr(iIdPessJur) +
                             ' AND   IDPESSOA  = ' + IntToStr(iIdTitular) );
        try
           dtmAPrev.qry.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;
     end;
     iIdCalculo      := 0;
     iIdCalculoGeral := 0;

     // Gleyber - 26/01/2004 - Pendência 15925 - Início
     If qryDepentit.State = dsEdit
      Then qryDepentit.Post;
     // Gleyber - 26/01/2004 - Pendência 15925 - Fim

     SelecionaProcesso(iNumeroProcesso);
     { Augusto 19/03/2004 }
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrevTit, iSeqProposta);
     // CGUEDES - 27/05/2002: Não estava sendo alimentada a qryrelbenefpart.
     PreencheDadosBeneficiario(iNUmeroProcesso,iIdTitular,qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                iIdPessJur,iIdPlanoPrev,iSeqProposta);
  end;
end; // CmeCadastro.Find(Self)

procedure TfrmCadRequerBenefBfciario.CmeDetalheInsert(Sender: TObject);
var sDataInicioAnt,
    sValorAnt,
    sNomeBenefAnt,
    sIdTpPagtoAnt,
    sFlgBenefMinAnt,
    sUltMesReajAnt,
    sDataEventoAnt,
    sCodBeneficioAnt     : string;
    sValorBase1Ant,
    sValorBase2Ant,
    sValorBase3Ant    : string;
begin

  if Trim(dblkpcmbEvento.Text) = ''
  then begin
    MsgDlg('Preencha o Evento Gerador.','Erro',mtError,[mbOk],0);
    dblkpcmbEvento.Enabled := True;
    dblkpcmbEvento.SetFocus;
    bbtnCancelarDetClick(frmCadRequerBenefBfciario);
    Exit;
  end;

  if (iIdTitular <= 0) or (iIdPessJur <= 0) or (iIdPlanoPrev <= 0) or (iSeqProposta <= 0 )
  then begin
    MsgDlg('Escolha o Participante Titular.','Erro',mtError,[mbOk],0);
    if (bbtnProcurar.enabled) and (bbtnProcurar.visible) then
    bbtnProcurar.SetFocus;
    bbtnCancelarDetClick(frmCadRequerBenefBfciario);
    sbtnInsDet.Enabled := True;
    Exit;
  end;
  lblNomeBenef.Caption := '';

//  if qryDet.IsEmpty then bNovoBeneficio := True;

{  if bNovoBeneficio
  then begin
     sNumProcINSS    := '';
     sValorCalcINSS  := '0';
     sValorInfINSS   := '0';
     sDataInicioINSS := '';
     sValorBase1INSS := '0';
     sValorBase2INSS := '0';
     sValorBase3INSS := '0';
  end;

}
  qryBeneficio.Close;
  qryBeneficio.ParamByName('IdEventoGerador').Value := qryEvento.FieldByName('IdEventoGerador').AsInteger;
  qryBeneficio.ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
  qryBeneficio.Open;

  inherited;

  // INICIO - cguedes - 27/03/2003
  // Se o parametro tiver valor maior que zero ó pq foi ativo, pois o default no banco é "0" (zero)
  If prmQtdDiasRetrBenef > 0 Then
    // se a diferença da datarequirimento e dataevento for menor do que o parametro,
    // então paga o retroativo normalmente, caso contrário não paga.
    bPagaRetroativo :=  (Abs(Date - dtDataEvento.Date)  < prmQtdDiasRetrBenef)
  Else
    bPagaRetroativo := True;
  // FIM - cguedes - 27/03/2003

  rValorReal              := 0;
  rValorCotas             := 0;
  rValorDaCotaBenef       := 0;
  sDataDaCotaBenef        := '';

  reValorBeneficio.Text   := '0';
  reValorSRB.Text         := '0';
  reValorCalcINSS.Text    := '0';
  reValorINfINSS.Text     := '0';
  dtDataRequerimento.Date := date;

  qryDet.FieldByName('ValorAtual').AsFloat            := 0;
  qryDet.FieldByName('ValorCalculado').AsFloat        := 0;
  qryDet.FieldByName('DataRequerimento').AsDateTime   := date;
  qryDet.FieldByName('FlgFormaPagto').AsString        := 'F';
  qryDet.FieldByName('FlgProvisorio').AsInteger       := 0;
  dbrgrpBenefProvisorio.ItemIndex                     := 0;

  dtInicioINSS.Date := dtDataEvento.Date;
  qryDet.FieldByName('DataInicioINSS').AsString := FormatDateTime('dd/mm/yyyy', dtDataEvento.Date); // 24334

  if (Trim(dtInicioFund.Text) = '') and (Trim(dtDataEvento.Text) <> '') then
  begin
    If bPagaRetroativo Then
    Begin
      qryDet.FieldByName('DataInicioFund').AsString := FormatDateTime('dd/mm/yyyy', dtDataEvento.Date); // 24334
      dtInicioFund.Date                             := dtDataEvento.Date;
    End Else
    Begin
      qryDet.FieldByName('DataInicioFund').AsString := FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date); // 24334
      dtInicioFund.Date                             := dtDataRequerimento.Date;
      dtInicioFund.Enabled :=  False;
      dtDataEvento.Enabled := dtInicioFund.Enabled;
    End;
  end;

  bbtnOpcoes.Visible      := False;
  lblAgencia.Visible      := False;
  dblkpcmbAgencia.Visible := False;

  reValorInfINSS.Color := clWindow;

  if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible)
  then dblkpcmbBeneficio.SetFocus;

  if Trim(sDataInicioPagto) = '' then   //gleyber - 09/09/2003 - trocou <> por =
  begin
    If bPagaRetroativo Then
      qryDet.FieldByName('DataInicio').AsString := sDataInicioPagto
    Else
      qryDet.FieldByName('DataInicio').AsString := dtDataRequerimento.Text;
      If Trim(sDataInicioPagto) <> '' Then { Augusto 13/10/2003 }
        dtDataInicio.Date                         := StrToDate(sDataInicioPagto);
  end else
  begin
     qryDet.FieldByName('DataInicio').AsString := FormatDateTime('dd/mm/yyyy', dtDataEvento.Date);  // 24334
     dtDataInicio.Date                         := dtDataEvento.Date;  // 24334
  end;

  lblPercConc.Visible             := False;
  dbedPercConc.Visible            := False;
  lblPercent.Visible              := False;
  lblPrazoProv.Visible            := False;
  dbedPrazoProv.Visible           := False;
  lblMesProv.Visible              := False;

  iIdBenefReferencia              := -1;
  bReajustouInss                  := False;
  bRecalculouProvisorio           := False;

  // Exibir dados do benefício anterior. Deixar o usuário informar tais dados
  BuscaDadosBeneficioAnterior ( qryAux,
                                iIdPessJur, iIdPlanoPrev, iIdTitular,
                                qryDet.FieldByName('IdBeneficio').AsInteger,
                                qryBeneficio.FieldByName('FlgReferencia').AsInteger,
                                FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),  // 24334
                                sDataInicioAnt,
                                sValorAnt,
                                sNomeBenefAnt,
                                sIdTpPagtoAnt,
                                sUltMesReajAnt,
                                sFlgBenefMinAnt,
                                sDataEventoAnt,
                                sCodBeneficioAnt,
                                sValorBase1Ant, sValorBase2Ant, sValorBase3Ant,
                                sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
                                True );

  if Trim(sDataInicioAnt) <> ''
  then begin
    qryDet.FieldByName('DibBenefAnt').AsString   := sDataInicioAnt;
    qryDet.FieldByName('ValorBenefAnt').AsString := ClienteNumero(sValorAnt);
  end;

end; // CmeDetalhe.Insert(Self)

procedure TfrmCadRequerBenefBfciario.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  sNumProcINSS    := '';
  sValorCalcINSS  := '0';
  sValorInfINSS   := '0';
  sDataInicioINSS := '';
  sValorBase1INSS := '0';
  sValorBase2INSS := '0';
  sValorBase3INSS := '0';

  // Habilitar os componentes
  btn_SelecionaBeneficios.enabled := true;
  dtDataRequerimento.Enabled      := true;
  dblkpcmbBeneficiario.enabled    := true;
  dbeMatriculaBenef.Enabled       := True;  // Gleyber - 26/01/2004 - Pendência 15925
  dbedNumProcINSS.enabled         := true;
  dtInicioINSS.enabled            := true;
  dtInicioFund.enabled            := true;
  reValorCalcInss.enabled         := true;
  reValorInfINSS.enabled          := true;
  reValorBeneficio.enabled        := true;
  reValorSRB.Enabled              := True;
  reValorTotal.enabled            := true;
  dtDataInicio.enabled            := true;
  dtDataFinal.enabled             := true;
  dblkcmbTpPgtoBenef.enabled      := true;
  dblkpcmbPortForma.enabled       := true;

  qryBeneficio.Close;
  qryBeneficio.ParamByName('IdEventoGerador').Value := qryEvento.FieldByName('IdEventoGerador').AsInteger;
  qryBeneficio.ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
  qryBeneficio.Open;

  reValorTotal.Text        := qryDet.FieldByName('ValorTotal').AsString;
  reValorCalcInss.Text     := FormatFloat('#0.00',qryDet.FieldByName('VlrCalcINSS').AsFloat);
  reValorInfInss.Text      := FormatFloat('#0.00',qryDet.FieldByName('VlrINFINSS').AsFloat);

  if qryBeneficio.FieldbyName('FlgCalcTodoMes').AsInteger = 1
  then begin
     reValorBeneficio.Text := FormatFloat('#0.000000',qryDet.FieldByName('ValorCotas').AsFloat);
     rValorCotas           := StrToFloat(FormatFloat('#0.000000',qryDet.FieldByName('ValorCotas').AsFloat));
     rValorReal            := StrToFloat(FormatFloat('#0.000000',ConverteBeneficioParaReal(rValorCotas)));
  end
  else begin
     reValorBeneficio.Text := FormatFloat('#0.00',qryDet.FieldByName('ValorAtual').AsFloat);
     rValorReal            := StrToFloat(FormatFloat('#0.00',qryDet.FieldByName('ValorAtual').AsFloat));
     rValorCotas           := 0;
  end;

  reValorSRB.Text          := FormatFloat('#0.00',qryDet.FieldByName('ValorSRB').AsFloat);

  if qryDet.FieldByName('FlgProvisorio').AsInteger <= 0
  then begin
    lblPercConc.Visible             := False;
    dbedPercConc.Visible            := False;
    lblPercent.Visible              := False;
    lblPrazoProv.Visible            := False;
    dbedPrazoProv.Visible           := False;
    lblMesProv.Visible              := False;
  end
  else begin
    lblPercConc.Visible             := True;
    dbedPercConc.Visible            := True;
    lblPercent.Visible              := True;
    lblPrazoProv.Visible            := True;
    dbedPrazoProv.Visible           := True;
    lblMesProv.Visible              := True;
  end;
  bRecalculouProvisorio := True;

  // CAMILLE - REFER - 10.09.1999
  // Se o parametro do beneficio por plano (flgbenefinf) definir que
  //    o no. de beneficiarios elegiveis
  // Entao iNumBenef := qryBeneficiario.RecordCount, pois a qryBeneficiario
  //       está com os elegiveis
  // Senao, abrir uma query auxiliar com todos os beneficiarios do beneficios
  //       iNumBenef := numero total de beneficiarios

  qryAux.Close;
  qryAux.SQL.Clear;
  // CAMILLE - 07.08.2002
  qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BFCIARIOTITPLAN BF, BENEFPLANPREV BP '+
                 ' WHERE  (BF.IDTITULAR   = '+IntToStr(iIdTitular)  +') '+
                 ' AND    (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)  +') '+
                 ' AND    (BF.IDPLANOORIGEM = '+IntToStr(iIdPlanoPrev)+') '+
                 ' AND    (BF.SEQPROPOSTA = '+IntToStr(iSeqProposta)+') '+
                 ' AND    (BF.IDBENEFICIO = '+qryBeneficio.FieldByName('IdBeneficio').AsString+') '+
                 ' AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV) '+
                 ' AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO) '+
                 ' AND    ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  '
                 );
  qryAux.Open;

  iNumBenef := qryAux.RecordCount;

  if not qryBeneficio.Active then Exit;

  if (qryBeneficio.FieldByName('flgBenefInf').AsInteger = 0) and
     (qryBeneficio.FieldByName('IdBeneficio').AsString <> '')
  then begin
    qryAux.Close;
    qryAux.SQL.Clear;
    // CAMILLE - 07.08.2002
    qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BFCIARIOTITPLAN BF, BENEFPLANPREV BP '+
                   ' WHERE  (BF.IDTITULAR   = '+IntToStr(iIdTitular)  +') '+
                   ' AND    (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)  +') '+
                   ' AND    (BF.IDPLANOORIGEM = '+IntToStr(iIdPlanoPrev)+') '+
                   ' AND    (BF.SEQPROPOSTA = '+IntToStr(iSeqProposta)+') '+
                   ' AND    (BF.IDBENEFICIO = '+qryBeneficio.FieldByName('IdBeneficio').AsString+') '+
                   ' AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV) '+
                   ' AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO) '+
                   ' AND    ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  '
                   );
    qryAux.Open;
    iNumBenef := qryAux.RecordCount;
  end;

  // INICIO - cguedes - 27/03/2003
  // No caso de manutenção de processo, caso o parametro seja maior do que zero,
  // desabilitar os componentes que manipulam das data de evento e requerimento.
  If sTipoFormChamador = 'MA' Then
  Begin
    If prmQtdDiasRetrBenef > 0 Then
    Begin
      dtInicioFund.Enabled :=  (Abs(Date - dtDataEvento.Date)  < prmQtdDiasRetrBenef);
      dtDataEvento.Enabled := dtInicioFund.Enabled;
    End;
  End;
  // FIM - cguedes - 27/03/2003

  BtMatricula.Visible := True;
end;
// ********************************** ********************** *************************
// ********************************** MÉTODOS DO FORM  ***** *************************
// ********************************** ********************** *************************

procedure TfrmCadRequerBenefBfciario.FormCreate(Sender: TObject);
begin
  sTipoFormChamador := '';
  inherited;
  // CAMILLE - REFER - 26.03.2001
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

  SelecionaProcesso(-1);
  bQueryTitular := False;
  bQuerySalarios := False;
  bQueryContribuicoes := False;
  bAbriuOutroForm     := False;

  dbeMatriculaBenef.ReadOnly := (prmIDRGDIGMATPENS = 1); //leofuncef - 10052004  
end;

procedure TfrmCadRequerBenefBfciario.bbtnProcurarClick(Sender: TObject);
begin
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     iIdTitular                := StrToInt(MontaSelectPart.ValoresChave[0]);
     iIdPessJur                := StrToInt(MontaSelectPart.ValoresChave[1]);
     iIdPlanoPrev              := StrToInt(MontaSelectPart.ValoresChave[2]);
     iSeqProposta              := StrToInt(MontaSelectPart.ValoresChave[7]);
     bQueryTitular := False;
     bQuerySalarios := False;
     bQueryContribuicoes := False;
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
  end; // if montasel.valoreschave.count > 0
end;


procedure TfrmCadRequerBenefBfciario.qryBeforePost(DataSet: TDataSet);
begin

  if Trim(dblkpcmbEvento.Text) = ''
  then begin
     MsgDlg('O Evento Gerador deve ser informado.','Erro',mtError,[mbOk],0);
     dblkpcmbEvento.Enabled := True;
     dblkpcmbEvento.SetFocus;
     Abort;
  end;

  if Trim(dtDataEvento.Text) = ''
  then begin
     MsgDlg('A Data do Evento deve ser informada.','Erro',mtError,[mbOk],0);
     if (dtDataEvento.enabled) and (dtDataEvento.visible) then
     dtDataEvento.SetFocus;
     Abort;
  end;

  inherited;
  if qry.State = dsInsert
  then begin
     qry.FieldByName('NumeroProcesso').AsInteger := iNumeroProcesso;
     qry.FieldByName('IdEventoGerador').AsInteger := qryEvento.FieldByName('IdEventoGerador').AsInteger;
     qry.FieldByName('DtRegistro').AsDateTime    := date;
     if sTipoFormChamador <> 'SI'
     then qry.FieldbyName('IdSitProcesso').AsInteger   := 4  // Pendente de Concessao
     else qry.FieldbyName('IdSitProcesso').AsInteger   := 8; // Simulacao
     sNumerosProcessos := sNumerosProcessos + ','+IntToStr(iNumeroProcesso);
  end;

end;

procedure TfrmCadRequerBenefBfciario.qryDetBeforePost(DataSet: TDataSet);
var bBeneficioMinimo, bErro : boolean;
begin
  if qryDet.State = dsInsert
  then begin
     qryDet.FieldByName('NumeroProcesso').AsInteger := iNumeroProcesso;
     qryDet.FieldByName('IdTitular').AsInteger      := iIdTitular;
     qryDet.FieldByName('IdPessJur').AsInteger      := iIdPessJur;
     qryDet.FieldByName('IdPlanoPrev').AsInteger    := iIdPlanoPrev;
     { Augusto 26/02/2007 }
     //qryDet.FieldByName('IdPlanoORIGEM').AsInteger    := StrToInt(BuscaPlanoOrigem( iIdPessJur, // CAMILLE - 03.12.2002
     //                                                                                         iIdTitular,
     //                                                                                         Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2)));
     qryDet.FieldByName('IdPlanoORIGEM').AsInteger    := iIdPlanoPrev;


     qryDet.FieldByName('SeqProposta').AsInteger    := iSeqProposta;
     qryDet.FieldByName('IdPessoa').AsInteger       := qrybeneficiario.fieldbyname('IDPESSOA').AsInteger;
     qryDet.FieldByName('IdBeneficio').AsInteger    := qrybeneficio.fieldbyname('IDBENEFICIO').AsInteger;

     if sTipoFormChamador <> 'SI'
     then qryDet.FieldByName('IdSitBeneficio').AsInteger := 4
     else qryDet.FieldByName('IdSitBeneficio').AsInteger := 8;

     qryDet.FieldByName('IdDependencia').AsString   := qrybeneficiario.fieldbyname('IDDEPENDENCIA').AsString;
     qryDet.FieldByName('FlgFormaPagto').AsString   := 'F';
     qryDet.FieldByName('Descricao').AsString       := 'Pendente de Concessão';
     qrydet.fieldbyname('NOME').AsString            := qrybeneficio.fieldbyname('NOME').AsString;
     qrydet.fieldbyname('DEPEN').AsString           := qrybeneficiario.fieldbyname('NOME').AsString;
  end;

  if Trim(reValorTotal.Text)     = '' then reValorTotal.Text     := '0';
  if Trim(reValorBeneficio.Text) = '' then reValorBeneficio.Text := '0';
  if Trim(reValorSRB.Text)       = '' then reValorSRB.Text       := '0';
  if Trim(reValorCalcInss.Text)  = '' then reValorCalcInss.Text  := '0';
  if Trim(reValorInfINSS.Text)   = '' then reValorInfINSS.Text   := '0';

  sValorTotal      := OraNumero(Trim(reValorTotal.Text));
  sValorInfInss    := OraNumero(Trim(reValorInfInss.Text));
  sValorCalcInss   := OraNumero(Trim(reValorCalcInss.Text));
  sDataInicioPagto := Trim(dtDataInicio.Text);
  iFlgTipoINSS     := 0;
  bNovoBeneficio := False;

  if qryBeneficio.FieldbyName('FlgCalcTodoMes').AsInteger = 1
  then begin // beneficio em cotas
     // qryDet.FieldByName('ValorAtual').AsFloat     := StrToFloat(FormatFloat('#0.000000',rValorReal));
     qryDet.FieldByName('ValorAtual').AsFloat     := StrToFloat(FormatFloat('#0.00',ConverteBeneficioParaReal(rValorCotas))); // Gleyber - Pendência 15757 - 06/02/2003
     qryDet.FieldByName('ValorCalculado').AsFloat := rValorCotas;
     qryDet.FieldByName('ValorCotas').AsFloat     := rValorCotas;
  end
  else begin // beneficio em real
     qryDet.FieldByName('ValorAtual').AsFloat     := StrToFloat(FormatFloat('#0.00',rValorReal));
     qryDet.FieldByName('ValorCalculado').AsFloat := StrToFloat(FormatFloat('#0.00',rValorReal));
     qryDet.FieldByName('ValorCotas').AsFloat     := rValorCotas;
  end;

  // CAMILLE - 17.09.2004
  if (qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 0)
  then qryDet.FieldByName('FONTEPAGADORA').AsInteger      := 1
  else qryDet.FieldByName('FONTEPAGADORA').AsInteger      := 2;

  // CAMILLE - 23.08.2002
  if not bConcedeuBeneficio
  then qryDet.FieldByName('VALORSRB').AsFloat          := StrToFloat(ClienteNumero(reValorSRB.Text))
  else qryDet.FieldByName('VALORSRB').AsFloat          := dValorSRB;

  { Augusto 02/02/2006 - Somente se não for concessão }
  If sTipoFormChamador <> 'CO' Then
    // CAMILLE - 07.08.2002
    qryDet.FieldByName('VALORNADIB').AsFloat           := qryDet.FieldByName('ValorAtual').AsFloat ;

  { Augusto 18/04/2006 }
  //if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 0 Then
  ///  QryDet.FieldByName('FLGPAGAINSS').AsString := QryBeneficio.FieldByName('FLGPAGAINSS').AsString;

  qryDet.FieldByName('VLRCALCINSS').AsFloat        := StrToFloat(ClienteNumero(reValorCalcInss.Text));
  qryDet.FieldByName('VlrINFINSS').AsFloat         := StrToFloat(ClienteNumero(reValorInfINSS.Text));
  
  { Augusto 11/03/2005 - Somente caso não seja concessão }
  If sTipoFormChamador <> 'CO' Then Begin
    //leofuncef - 25032003 - inicio
    //caso benefício do INSS gravar o valor total como o valor do INSS
    //que não estava sendo gravado
    if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1
    then qryDet.FieldByName('ValorTotal').AsFloat         := StrToFloat(FormatFloat('#0.00',rValorReal))
    else qryDet.FieldByName('ValorTotal').AsFloat         := StrToFloat(ClienteNumero(reValorTotal.Text));
    //leofuncef - 25/03/2003
  End;


  qryDet.FieldByName('NUMORDEMEVENTO').AsInteger   := qryBeneficio.FieldByName('NUMORDEMEVENTO').AsInteger;
  if trim(dblkpcmbPortForma.text) = '' then
    qryDet.fieldbyname('CODPORTFORMA').AsString := '';

  // CAMILLE - 01.11.2001
  // Chamar a regra de verificação de benefício mínimo
  if qryBeneficio.FieldByName('IDREGRABENEFMIN').AsInteger > 0
  then begin

     bBeneficioMinimo := ExecutaRegraBeneficioMinimo (qryAux,
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
                                                      FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),  // 24334
                                                      FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),  // 24334
                                                      FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date),  // 24334
                                                      FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),  // 24334
                                                      FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),  // 24334
                                                      reValorInfINSS.Text,
                                                      reValorCalcINSS.Text,
                                                      qryDet.FieldByName('DibBenefAnt').AsString,
                                                      qryDet.FieldByName('ValorBenefAnt').AsString,
                                                      qryDet.FieldByName('ValorAtual').AsString,
                                                      0,
                                                      bErro,
                                                      reValorSRB.Text,
                                                      '0',      // Augusto - 29/11/2002
                                                      '' );     // Agusuto - 29/11/2002
     if bErro
     then begin
        MsgDlg('Erro na Regra de Verificação de Benefício Mínimo - Regra No. '+qryBeneficio.FieldByName('IDREGRABENEFMIN').AsString,
               'Erro', mtError, [mbOk], 0);
        Abort;
     end;

     if bBeneficioMinimo
     then qryDet.FieldByName('FLGBENEFMIN').AsInteger := 1
     else qryDet.FieldByName('FLGBENEFMIN').AsInteger := 0;
  end;


  //leocbs - 2609 --não estava alterando
  qryDet.FieldByName('IDTPPAGTOBENEFIC').AsInteger := qryTpPgtoBenef.FieldByName('IDTPPAGTOBENEFIC').AsInteger;


  { Augusto 02/06/2004 - Atualiza Matricula do Dependente }
  ExecutarQuery(QryAux, 'UPDATE DEPENTIT SET MATRICULA = '+
                         QuotedStr(dbeMatriculaBenef.Text)+
                        'WHERE IDPESSOA = '+QryDet.FieldByName('IDPESSOA').AsString);



  inherited;

end;

procedure TfrmCadRequerBenefBfciario.reValorBeneficioBtnClick(
  Sender: TObject);
var rPercProvisorio,
    rValorReserva,
    rValorBeneficio : double;
    bErro : boolean;
    sSQLBenefAssoc,
    sValorReserva,
    sMsgErro : string;
    iIdCalculoAnt,
    iIdBeneficio : LongInt;
begin
  inherited;
  if Trim(dblkpcmbBeneficio.Text) = ''
  then begin
    MsgDlg('Preencha o Benefício.','Erro',mtError,[mbOk],0);
    if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then
    dblkpcmbBeneficio.SetFocus;
    Exit;
  end;

  // Se nao tiver regra, apenas converter o valor digitado para cotas
{  if (Trim(qryBeneficio.FieldByName('IdRegraCalculo').AsString) = '') or
     (qryBeneficio.FieldByName('IdRegraCalculo').AsInteger <= 0)
  then begin
     if (Trim(reValorBeneficio.Text) <> '') and (StrToFloat(ClienteNumero(reValorBeneficio.Text)) > 0)
     then begin
        if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
        then begin
           rValorCotas  := StrToFloat(ClienteNumero(reValorBeneficio.Text));
           rValorReal   := ConverteBeneficioParaReal(rValorCotas);
        end
        else begin
           rValorReal  := StrToFloat(ClienteNumero(reValorBeneficio.Text));
           rValorCotas := ConverteBeneficioParaCotas(rValorReal);
        end;
     end
     else begin
        rValorReal  := 0;
        rValorCotas := 0;
     end;
     Exit;
  end;
}

  frmAguarde.Mostra('Regra de Cálculo de Benefício - Nº '+qryBeneficio.FieldByName('IdRegraCalculo').AsString);

  sSQLBenefAssoc := MontaSQLBenefAssoc(qryBenefAux, qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

  // Executar regra de calculo do beneficio
  try
    iIdCalculoAnt   := iIdCalculo;

    rValorBeneficio := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                                            qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                                                            -1,
                                                            iIdPessJur, iIdPlanoPrev, iIdTitular,
                                                            iSeqProposta,
                                                            qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                            iNumeroProcesso,
                                                            iNumBenef,
                                                            rOpcao1, rOpcao2, rOpcao3,
                                                            sSQLBenefAssoc,
                                                            FormatDateTime('dd/mm/yyyy', dtDataEvento.Date), // 24334
                                                            FormatDateTime('dd/mm/yyyy', dtInicioFund.Date), // 24334
                                                            FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date), // 24334
                                                            reValorTotal.Text,
                                                            reValorInfInss.Text,
                                                            reValorCalcINSS.Text,
                                                            FloatToStr(rValorReserva),
                                                            bErro,
                                                            sMsgErro,
                                                            iIdCalculo,
                                                            qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                                            qryBeneficiario.FieldByName('IdDependencia').AsString,
                                                            qryBeneficiario.FieldByName('Percentual').AsString,
                                                            1,
                                                            qryDet.FieldByName('DibBenefAnt').AsString,
                                                            qryDet.FieldByName('ValorBenefAnt').AsString,
                                                            '',
                                                            -1,
                                                            qryDet.FieldByName('FLGPROVISORIO').AsInteger,   // CAMILLE - 19.04.2004
                                                            qryDet.FieldByName('PRAZOPROVISORIO').AsInteger, // CAMILLE - 19.04.2004
                                                            qryDet.FieldByName('PERCPROVISORIO').AsFloat,
                                                            0,    // CAMILLE - 19.04.2004
                                                            qryDet.FieldByName('DATAREQUERIMENTO').AsString  { Augusto 20/09/2004 }
                                                            );
  except
    frmAguarde.Apaga;
  end;

  frmAguarde.Apaga;

  if iIdCalculo = 0 then
    iIdCalculo := iIdCalculoAnt;

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    rValorReal  := 0;
    rValorCotas := 0;
    reValorBeneficio.Text := '0';
    Exit;
  end;

  // CAMILLE - 19.04.2004
  // O SISTEMA NÃO APLICARÁ MAIS O PERCENTUAL DE CONCESSAO AO BENEFICIO
  // AS REGRAS DE CALCULO DEVERÃO FAZER ISSO
  // Se for beneficio provisorio, calcular o percentual de concessao
  {if (dbrgrpBenefProvisorio.ItemIndex = 1) and
     (Trim(dbedPercConc.Text) <> '')
  then begin
     rPercProvisorio := StrToFloat(ClienteNumero(dbedPercConc.Text));
     rValorReal  := (rPercProvisorio / 100) * rValorBeneficio;
  end
  else begin
     rValorReal  := rValorBeneficio;
  end;
  }
  rValorReal  := rValorBeneficio;


  // CBS - 04.02.2002

  // Gleyber - Pendência 15757 - 09/01/2004
  // O trecho abaixo foi comentado pois tira toda a funcionalidade de
  // transformar real para cotas
  // if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  // then rValorCotas  := rValorReal;

  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  then Begin
    rValorCotas := ConverteBeneficioParaCotas(rValorReal); // Gleyber - Pendência 15757 - 09/01/2004
    reValorBeneficio.Text := FormatFloat('#0.000000',rValorCotas);
  end
  else reValorBeneficio.Text := FormatFloat('#0.00',rValorReal);
  bRecalculouProvisorio := True;

end;

procedure TfrmCadRequerBenefBfciario.reValorCalcInssBtnClick(
  Sender: TObject);
var rValorINSS : double;
    bErro : boolean;
    sMsgErro : string;
begin
  inherited;
  // Executar regra de calculo do valor do inss
  if (Trim(qryBeneficio.FieldByName('IDREGRACALCINSS').AsString) <> '') AND
     (qryBeneficio.FieldByName('IDREGRACALCINSS').AsInteger > 0)
  then begin
     frmAguarde.Mostra('Regra de Cálculo do INSS - Nº '+qryBeneficio.FieldByName('IdRegraCALCINSS').AsString);

     Try
       rValorINSS :=  ExecutaRegraCalculoINSS (qryAux,
                                    qryBeneficio.FieldByName('IdRegraCALCINSS').AsInteger,
                                    iIdPessJur, iIdPlanoPrev, iIdTitular,
                                    iSeqProposta,
                                    qryBeneficio.FieldbyName('IdBeneficio').AsInteger,
                                    iNumeroProcesso,
                                    iIdSitFunc, iIdSitPart, iIdSitPlanoPrev,
                                    rOpcao1, rOpcao2, rOpcao3,
                                    FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),  // 24334
                                    FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),  // 24334
                                    FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date),  // 24334
                                    FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),  // 24334
                                    1,
                                    bErro,
                                    sMsgErro, iIdCalculo,
                                    { Augusto 09/09/2003 - Passar dados do beneficio anterior }
                                    //'','',
                                    qryDet.FieldByName('DibBenefAnt').AsString,
                                    qryDet.FieldByName('ValorBenefAnt').AsString,

                                    qryDet.FieldByName('VALORBINSSANT1').AsString,
                                    qryDet.FieldByName('VALORBINSSANT2').AsString,
                                    qryDet.FieldByName('VALORBINSSANT3').AsString,0,'0');
     Except
       frmAguarde.Apaga; //ClaudioR - 22119 - 04/09/2007 
     End;

     frmAguarde.Apaga;

     if bErro then
     begin
       MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
       reValorCalcINSS.Text := '0';
       Exit;
     end
     else reValorCalcINSS.Text  := FloatToStr(rValorINSS);
  end // if idregra <> ''
  else
  begin
    rValorINSS := 0;
    reValorCalcINSS.Text := '0';
  end;
end;

procedure TfrmCadRequerBenefBfciario.qryBeneficioAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if (not qryDet.Active) or (not (qryDet.State in [dsEdit,dsInsert]))
  then Exit;

{  if sTipoFormChamador <> 'SI'
  then reValorTotal.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRgValorTotal').AsString)   <> '')
  else reValorTotal.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRegraSimula').AsString)   <> '');}

  // Gleyber - 24/04/2003 - Início
  if sTipoFormChamador = 'SI'
  then reValorTotal.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRegraSimula').AsString)   <> '');

  //reValorBeneficio.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRegraCalculo').AsString)   <> '');

  // Gleyber - 24/04/2003 - fim

// CGUEDES - 24/07/2003
//  reValorCalcINSS.ReadOnly  := (Trim(qryBeneficio.FieldByName('IdRegraCalcINSS').AsString)  <> '');
//  reValorSRB.ReadOnly       := (Trim(qryBeneficio.FieldByName('IdRegraSRB').AsString)  <> '');


  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  then lblValorBenef.Caption := 'Valor (Cotas) '
  else lblValorBenef.Caption := 'Valor (Real)  ';

  if qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC',qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
  then begin
     dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
     dblkcmbTpPgtoBenef.PerformSearch;
  end
  else dblkcmbTpPgtoBenef.Text := '';

  bbtnOpcoes.Visible := (qryBeneficio.FieldbyName('FLGACEITAOPCAO').AsInteger = 1 );

 lblAgencia.Visible      := (qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1 );
 dblkpcmbAgencia.Visible := (qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1 );

  // Preencher qual é o beneficio de referencia
  if Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> ''
  then iIdBenefReferencia  := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
  else iIdBenefReferencia  := -1;

  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1
  then begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';
     // CGUEDES - 16/07/2002
     // pnlBenefProv.Visible := False;
     // Gleyber - 11/11/2002
     // grpInfSupl.Visible := False;
     pnlNaoBenefProv.Visible := False;
     pnlBenefProv.Visible    := True;

  end
  else begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação '; // CAMILLE - 22.10.2004 - PENDENCIA 17865
     // CGUEDES - 16/07/2002
     // pnlBenefProv.Visible := True;
     // Gleyber - 11/11/2002
     // grpInfSupl.Visible := True;
     pnlNaoBenefProv.Visible := True;
     pnlBenefProv.Visible    := True;
  end;
end;

procedure TfrmCadRequerBenefBfciario.dblkpcmbEventoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (iIdPlanoPrev <= 0 ) or (not qryEvento.Active) then Exit;

  qryBeneficio.Close;
  qryBeneficio.ParamByName('IdEventoGerador').Value := qryEvento.FieldByName('IdEventoGerador').AsInteger;
  qryBeneficio.ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
  qryBeneficio.Open;
end;

procedure TfrmCadRequerBenefBfciario.bbtnOkDetClick(Sender: TObject);
var rPercProvisorio : double;
    beneficioselecionado : string ;
    i , idbeneficioselecionado : integer;  // contador de for
    sDataInicio, sDataFinal, sMsgErro{,sFlgFormaPagto} : string; // CAMILLE - REFER - 13.05.1999
    bErro : boolean;
    varFields : variant;

    sSql, sResult : String;

    sFlgFitEspecial, sFlgMigrado  : String;
    // Gleyber - 01/08/2005 - Pendência 19060 - Início
    cAuxSeparador : char;
    dVlrOpcao1,
    dVlrOpcao2,
    dVlrOpcao3    : Double;
    // Gleyber - 01/08/2005 - Pendência 19060 - Fim
begin

  idBeneficioSelecionado := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger; // guarda último beneficio selecionado
  iIdPessoa              := qryBeneficiario.FieldByName('IDPESSOA').AsInteger;

  // Fazer Validacoes
  if Trim(dtDataRequerimento.Text) = ''
  then begin
    MsgDlg('Data de Requerimento não preenchida.','Erro',mtError,[mbOk],0);
    if (dtDataRequerimento.enabled) and (dtDataRequerimento.visible) then
    dtDataRequerimento.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  if Trim(dtDataInicio.Text) = ''
  then begin
    MsgDlg('Data de Início do Pagamento não preenchida.','Erro',mtError,[mbOk],0);
    if (dtDataInicio.Enabled) and (dtDataInicio.Visible)
    then dtDataInicio.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  if Trim(dblkpcmbBeneficio.Text) = ''
  then begin
    MsgDlg('Benefício não preenchido.','Erro',mtError,[mbOk],0);
    if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then
    dblkpcmbBeneficio.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  // CAMILLE - REFER - 01.06.1999
  if (qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 0) and //leofuncef - 01092003
     ((Trim(reValorTotal.Text) = '') or (StrToFloat(ClienteNumero(reValorTotal.Text)) <= 0)) and
     (qryBeneficio.FieldByName('FLGACEITAZERO').AsInteger <= 0) // CAMILLE - 13.08.2002
  then begin
    MsgDlg('Valor Total do Benefício inválido.','Erro',mtError,[mbOk],0);
    if (reValorTotal.Enabled) and (reValorTotal.Visible)
    then reValorTotal.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;


  //leofuncef - 10052004
  if (prmIDRGDIGMATPENS = 1) and (trim(dbeMatriculaBenef.text)  = '')
  then begin
    MsgDlg('A matrícula da pensionista não foi preenchida. Verificar parametrização.','Erro',mtError,[mbOk],0);
    if (dtDataRequerimento.enabled) and (dtDataRequerimento.visible) then
    dtDataRequerimento.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;


  if (prmIDRGDIGMATPENS = 1) and
     (length(trim(dbeMatriculaBenef.text)) <> strtoint(prmMASCMATPENS))
  then begin
    MsgDlg('A matrícula do pensionista não está de acordo com o número de digitos parametrizado. Verificar regra do DV.','Erro',mtError,[mbOk],0);
    if (dtDataRequerimento.enabled) and (dtDataRequerimento.visible) then
    dtDataRequerimento.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;
  //fim - leofuncef- 10052004


  //leofuncef - 09102003 - inicio
  // Data do Requerimento nao pode ser menor que a data do evento
  if (Trim(dtDataRequerimento.Text) <> '') and
     (Trim(dtDataEvento.Text) <> '') and
     (dtDataRequerimento.Date < dtDataEvento.Date)   and  // 24334
     (qrybeneficio.fieldbyname('FLGRESGATE').AsInteger <> 1)
  then begin
     MsgDlg('A Data de Requerimento não pode ser inferior a Data do Evento. ',
            'Informação',mtInformation,[mbOk],0);
     dtDataRequerimento.SetFocus;
     Exit;
  end;
  //leofuncef - 09102003 - fim


  //leofuncef - 05122002 - inicio
  // se for benefício do INSS atribuir o valor Inf. do INSS ao valor do benefício.
  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1 Then
  begin
     rValorReal  := StrToFloat(ClienteNumero(reValorInfINSS.Text));
  end;
  //leofuncef - 05122002 - fim

     

  if  (pnlNaoBenefProv.Visible) and  // Gleyber - 11/11/2002
   ((Trim(reValorBeneficio.Text) = '') or (StrToFloat(ClienteNumero(reValorBeneficio.Text)) <= 0))
   and (qryBeneficio.FieldByName('FLGACEITAZERO').AsInteger <= 0) { Augusto 01/10/2003 }

  then begin
    MsgDlg('Valor do Benefício inválido.','Erro',mtError,[mbOk],0);
    if (reValorBeneficio.enabled) and (reValorBeneficio.visible) then
    reValorBeneficio.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  if (Trim(dtDataInicio.Text) <> '') and (Trim(dtDataFinal.Text) <> '') and
     (StrToDate(dtDataInicio.Text) > StrToDate(dtDataFinal.Text) )
  then begin
    MsgDlg('Inconsistência : a data de início do pagamento é maior que a data final.','Erro',mtError,[mbOk],0);
    if dtDataInicio.Enabled then dtDataInicio.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  // Se o beneficio obriga numero do processo e o numero estiver em
  // branco, dar mensagem
  if (qryBeneficio.FieldByName('flgObrigaNProc').AsString = '1') and
     (Trim(dbedNumProcINSS.Text) = '') and
     (sTipoFormChamador <> 'SI')
     { Augusto 19/11/2004 - Caso beneficio de Resgato, nº do processo não é obrigatório }
     and (qrybeneficio.fieldbyname('FLGRESGATE').AsInteger  <> 1)
  then begin
    MsgDlg('O Nº do Processo no INSS para este benefício é obrigatório e não foi preenchido. Verifique',
           'Erro',mtError,[mbOk],0);
    dbedNumProcINSS.SetFocus;
    TiraSQL(qryAux);
    Abort;
  end;

  if  (pnlNaoBenefProv.Visible) and  // Gleyber - 11/11/2002
    ((qryBeneficio.FieldbyName('IdRegraCalculo').AsInteger > 0) and
    ( not bRecalculouProvisorio))
  then begin
    MsgDlg('A opção "Benefício Provisório" foi alterada e o benefício não foi recalculado.'+#13+
           'Recalcule o benefício antes de confirmar a operação.',
           'Informação',mtInformation,[mbOk],0);
    TiraSQL(qryAux);
    Abort;
  end;

  // Se o beneficio tem alguma opcao obrigatoria e esta opcao nao foi preenchida,
  // chamar cadastro de opcoes
  if   (qryBeneficio.FieldByName('NumOpcoes').AsInteger >= 1) and
       ( ( (qryBeneficio.FieldbyName('flgObrigaOp1').AsInteger = 1) and (rOpcao1 <= 0) ) or
         ( (qryBeneficio.FieldbyName('flgObrigaOp2').AsInteger = 1) and (rOpcao2 <= 0) ) or
         ( (qryBeneficio.FieldbyName('flgObrigaOp3').AsInteger = 1) and (rOpcao3 <= 0) )
       )
  then begin
     // Gleyber - 01/08/2005 - Pendência 19060 - Início
     If bValidaOpcaoBeneficio
      Then Begin
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT DISTINCT VALORBASE1, VALORBASE2, VALORBASE3');
         qryAux.SQL.Add('WHERE IDPESSJUR   = ' + IntToSTr(iIdPessJur));
         qryAux.SQL.Add('  AND IDTITULAR   = ' + IntToStr(iIdTitular));
         qryAux.SQL.Add('  AND IDPLANOPREV = ' + IntToSTr(iIdPlanoPrev));
         qryAux.SQL.Add('  AND SEQPROPOSTA = ' + IntToSTr(iSeqProposta));
         qryAux.SQL.Add('  AND IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);

         Try
           qryAux.Open;
         Except
           On E:EDBEngineError Do
           Begin
              MostrarErro(E);
              Exit;
           End
         End;

         dVlrOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat;
         dVlrOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat;
         dVlrOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat;


         cAuxSeparador    := DecimalSeparator;
         DecimalSeparator := '.';

         qryAux.SQL.Clear;
         qryAux.SQL.Add('UPDATE BENEFBFCIARIO SET  VALORBASE1 = ' + FormatFloat('#0.00000',dVlrOpcao1) + ',');
         qryAux.SQL.Add('                          VALORBASE2 = ' + FormatFloat('#0.00000',dVlrOpcao2) + ',');
         qryAux.SQL.Add('                          VALORBASE3 = ' + FormatFloat('#0.00000',dVlrOpcao3) );
         qryAux.SQL.Add('WHERE IDPESSJUR   = ' + IntToSTr(iIdPessJur)   );
         qryAux.SQL.Add('  AND IDTITULAR   = ' + IntToStr(iIdTitular)   );
         qryAux.SQL.Add('  AND IDPESSOA    = ' + IntToStr(iIdPessoa)    );
         qryAux.SQL.Add('  AND IDPLANOPREV = ' + IntToSTr(iIdPlanoPrev) );
         qryAux.SQL.Add('  AND SEQPROPOSTA = ' + IntToSTr(iSeqProposta) );
         qryAux.SQL.Add('  AND IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);

         DecimalSeparator := cAuxSeparador;
         Try
           qryAux.Open;
         Except
           On E:EDBEngineError Do
           Begin
              MostrarErro(E);
              Exit;
           End
         End;
      End // If bValidaOpcaoBeneficio
      Else Begin
        MsgDlg('Existe opção de benefício obrigatória não informada.','Erro',mtError,[mbOk],0);
        bbtnOpcoesClick(Sender);
      End;
     // Gleyber - 01/08/2005 - Pendência 19060 - Fim
  end;

  // Se o usuario nao executou a regra de concessao, executá-la agora
  if not bExecutouRegraConcessao
  then bbtnElegibilidadeClick(Sender);

  // Se o usuario nao executou a regra de concessao, executá-la agora
  if not bConcedeBeneficio   // rosana - serpros - 10/05/1999
  then begin
       MsgDlg('A Regra de Elegibilidade nº '+
              qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString+
              ' NÃO foi satisteita. Verifique. ','Informação',mtInformation,[mbOk],0);
       Abort;
  end;


  // CAMILLE - 04.05.2004
  if sTipoFormChamador <> 'SI'
  then begin
     iIdUsuarioAutoriza := VerificaVALORLimiteBeneficio ( qryAux,
                                                          frmCadRequerBenefBfciario.Caption,
                                                          -1,
                                                          -1,
                                                          iIdPlanoPrev,
                                                          -1,
                                                          -1,
                                                          qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                          StrToFloat(ClienteNumero(reValorBeneficio.Text)),
                                                          False); // Requerimento = False, Outras = True
     if iIdUsuarioAutoriza < 0
     then begin
        MsgDlg('Requerimento de Benefício não permitido por exceder valor limite e não ter autorização. Verifique. ','Informação',mtInformation,[mbOk],0);
        Abort;
     end;
  end;



  //leofuncef - 19052004
  //dados para contabilização individual
  if prmIdRegraContabBenefIndiv > 0 then
  begin
     //a regra será executada para cada campo com possibilidade de
     //parametrização individual automática
     //a regra é única e o tipo de campo a ser retornada é informado através
     //do campo de nome "CAMPO" na query
     //caso não haja parametrização individual para determinado caso, a regra deve retornar "0" (zero)


     //leofuncef - 28052004
     sFlgFitEspecial := '0';
     {qryaux.close;
     qryaux.SQL.text := ' SELECT NVL(FLGFITESPECIAL ,0) FLGFITESPECIAL'+
                        ' FROM PARTPREVPLAN '+
                        ' WHERE IDPESSOA = '+IntToStr(iIdTitular)+' AND '+
                        ' IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+' ';
     qryaux.open;
     if not qryaux.isempty then
     sFlgFitEspecial :=  qryaux.fieldbyname('FLGFITESPECIAL').AsString;}



     { Inicio Augusto 31/05/2004 - Verifica se participante possui migração de plano }
     If PossuiMigracao(qryBeneficiario.fieldbyname('IDTITULAR').AsInteger,
                       qryBeneficiario.fieldbyname('IDPLANOPREV').AsInteger,
                       qry.FieldByName('DTEVENTO').AsString) Then Begin
       sFlgMigrado :=  '1';
     End Else Begin
       sFlgMigrado :=  '0';
     End;
     {sFlgMigrado := '0';
     qryaux.close;
     qryaux.SQL.text := '  SELECT 1 FROM BENEFBFCIARIO '+
                        '  WHERE IDPESSOA = '+qryBeneficiario.fieldbyname('IDPESSOA').AsString+' AND '+
                        '  IDTITULAR = '+qryBeneficiario.fieldbyname('IDTITULAR').AsString+' AND '+
                        '  IDPLANOPREV <> '+qryBeneficiario.fieldbyname('IDPLANOPREV').AsString+' AND '+
                        '  IDPLANOPREV = '+qryBeneficiario.fieldbyname('IDPLANOORIGEM').AsString+' AND '+
                        '  IDSITBENEFICIO = 3 ';
     qryaux.open;
     if not qryaux.isempty then}
     { Fim Augusto 31/05/2004 }



     sSQL := 'SELECT  '+qryBeneficiario.fieldbyname('IDPESSOA').AsString+' AS IDPESSOA ,'+
             ' '+qryBeneficiario.fieldbyname('IDTITULAR').AsString+' AS IDTITULAR ,'+
             ' '+qryBeneficiario.fieldbyname('IDPLANOPREV').AsString+' AS IDPLANOPREV ,'+
             ' '+qryBeneficiario.fieldbyname('IDBENEFICIO').AsString+' AS IDBENEFICIO , '+
             ' '+IntToStr(iIdSitPart)  +' AS IDSITPART, '+             { Augusto 24/10/2007 }
             ' '+IntToStr(iIdSitPlanoPrev)  +' AS IDSITPLANOPREV,   '+ { Augusto 13/09/2006 }
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
                           '  AND   NVL(ATIVO,''S'') = ''S''   '; // CAMILLE - 20.10.2004
        qryaux.open;

        if qryaux.isempty then
        begin
           MsgDlg('['+inttostr(prmIdRegraContabBenefIndiv)+'] - Regra para atribuição automática de entidade contábil. Resultado inválido: '+sResult+'.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Abort;
        end;

        qrydet.fieldbyname('IDPLANPREVCONTAB').AsString := trim(sResult);
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

        qrydet.fieldbyname('PLACONTAD').AsString := trim(sResult);

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


        qrydet.fieldbyname('PLACONTAC').AsString := trim(sResult);
     end;
     //FIM - PLACONTAC


  end;
  //leofuncef 19052004 - fim


  varFields    := VarArrayCreate([0,1],varVariant);
  varFields[0] := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
  varFields[1] := iIdPessoa;

  // Preencher campos ainda nao preenchidos
  if (qryDet.State = dsInsert) and
     (not qryBfciarioTitPlan.Locate('IdBeneficio;IdPessoa',VarFields,[loCaseInsensitive]))
  then begin
     qryBfciarioTitPlan.Insert;
     qryBfciarioTitPlan.FieldByName('IdPessoa').AsInteger    := iIdPessoa;   // Estava invertido o IdTitular
     qryBfciarioTitPlan.FieldByName('IdTitular').AsInteger   := iIdTitular;  // com o idPessoa - Gleyber - 25/04/2003
     qryBfciarioTitPlan.FieldByName('SeqProposta').AsInteger := iSeqProposta;
     qryBfciarioTitPlan.FieldByName('IdPessJur').AsInteger   := iIdPessJur;

     { Augusto 26/02/2007 }
     //qryBfciarioTitPlan.FieldByName('IDPLANOORIGEM').AsInteger := StrToInt(BuscaPlanoOrigem( iIdPessJur, // CAMILLE - 03.12.2002
     //                                                                                        iIdTitular,
     //                                                                                        Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2)));
     qryBfciarioTitPlan.FieldByName('IDPLANOORIGEM').AsInteger := iIdPlanoPrev;

     // cguedes - 11/06/2002
     qryBfciarioTitPlan.FieldByName('IdPlanoPrev').AsInteger := iIdPlanoPrev;
     qryBfciarioTitPlan.FieldByName('IdBeneficio').AsInteger := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
     qryBfciarioTitPlan.FieldByName('Prioridade').AsFloat    := 0;
     qryBfciarioTitPlan.FieldByName('Percentual').AsFloat    := 100;
     qryBfciarioTitPlan.FieldByName('IdResponsavel').AsInteger := iIdPessoa;
     qryBfciarioTitPlan.Post;
  end; // if state = insert and not locate

  // Gleyber - 27/11/2004 - Pendência 15925 - Início
  If qryDepentit.State = dsEdit
   Then qryDepentit.Post;
  // Gleyber - 27/11/2004 - Pendência 15925 - Fim

  // Preencher qual é o benefício de referência
  if Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> ''
  then iIdBenefReferencia  := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
  else iIdBenefReferencia  := -1;

  // Se necessario, gravar beneficio de referencia
  if qryBeneficio.FieldByName('IdBenefRef').AsInteger > 0
  then GravaBeneficioDeReferencia;

  // Gravar beneficio auxiliar para usar depois os valores dos beneficios
  // e suas opcoes para passar para a regra de calculo dos outros beneficios
  if qryDet.State = dsInsert
  then begin
     qryBenefAux.Insert;
     qryBenefAux.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
     qryBenefAux.FieldByName('IDPESSOA').AsInteger       := iIdPessoa;
     qryBenefAux.FieldByName('IDBENEFICIO').AsInteger    := qryBeneficio.FieldbyName('IdBeneficio').AsInteger;
     qryBenefAux.FieldByName('NUMORDEMEVENTO').AsInteger := qryBeneficio.FieldbyName('NumOrdemEvento').AsInteger;
     qryBenefAux.FieldByName('VALORTOTAL').AsFloat       := StrToFloat(ClienteNumero(Trim(reValorTotal.Text)));
     qryBenefAux.FieldByName('VALORATUAL').AsFloat       := rValorReal;
     qryBenefAux.FieldByName('VALORCOTAS').AsFloat       := rValorCotas;
     qryBenefAux.FieldByName('VALORBASE1').AsFloat       := rOpcao1;
     qryBenefAux.FieldByName('VALORBASE2').AsFloat       := rOpcao2;
     qryBenefAux.FieldByName('VALORBASE3').AsFloat       := rOpcao3;
     qryBenefAux.Post;
     inc(iTotRequeridos);
  end
  else begin
     qryBenefAux.Edit;
     qryBenefAux.FieldByName('VALORTOTAL').AsFloat       := StrToFloat(ClienteNumero(Trim(reValorTotal.Text)));
     qryBenefAux.FieldByName('VALORATUAL').AsFloat       := rValorReal;
     qryBenefAux.FieldByName('VALORCOTAS').AsFloat       := rValorCotas;
     qryBenefAux.FieldByName('VALORBASE1').AsFloat       := rOpcao1;
     qryBenefAux.FieldByName('VALORBASE2').AsFloat       := rOpcao2;
     qryBenefAux.FieldByName('VALORBASE3').AsFloat       := rOpcao3;
     qryBenefAux.Post;
  end;

  // Grava RELBENEFPART - Dados para o Relatório de Demonstrativo de Benefício
  if iIdCalculo > 0
  then begin

     //leofuncef - 25032003 - inicio
     if not qryRelBenefPart.active then
     begin
        with qryRelBenefPart   do
        begin
           Close;
           ParamByName('IdPessoa').Value       := iIdPessoa;
           ParamByName('IdTitular').Value      := iIdTitular;
           ParamByName('SeqProposta').Value    := iSeqProposta;
           ParamByName('IdPessJur').Value      := iIdPessJur;
           ParamByName('IdPlanoPrev').Value    := iIdPlanoPrev;
           ParamByName('NumeroProcesso').Value := iNumeroProcesso;
           Open;
        end;
     end;
     //leofuncef - 25032003 - fim


     if qryDet.State = dsInsert
     then qryRelBenefPart.Insert
     else qryRelBenefPart.Edit;

     qryRelBenefPart.FieldByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
     qryRelBenefPart.FieldByName('IDPESSJUR').AsInteger      := iIdPessJur;
     qryRelBenefPart.FieldByName('IDTITULAR').AsInteger      := iIdTitular;
     qryRelBenefPart.FieldByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
     qryRelBenefPart.FieldByName('IDBENEFICIO').AsInteger    := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger;
     qryRelBenefPart.FieldByName('IDPESSOA').AsInteger       := iIdPessoa;
     qryRelBenefPart.FieldByName('IDCALCULO').AsInteger      := iIdCalculo;
     qryRelBenefPart.FieldByName('SEQPROPOSTA').AsInteger    := iSeqProposta;
     qryRelBenefPart.FieldByName('DATACALCULO').AsDateTime   := StrToDate(dtInicioFund.Text);
     qryRelBenefPart.FieldByName('FLGRECALCULO').AsInteger   := 0;
     qryRelBenefPart.Post;

  end;

  inherited;

  // Verifica se todos beneficiarios já estão cadastrados no beneficio
  if iTotRequeridos = qryBeneficiario.RecordCount
  then begin
     MsgDlg('Requerimento de '+lblNomeBenef.caption+' concluído com sucesso ! '+
            'Selecione novo benefício e os beneficiários que tenham direito',
            'Informação',mtInformation,[mbOk],0);

     // Atualizar a reserva part com os valores  movimentados da reserva
     // para que o proximo beneficio já tenha seu valor atualizado
     if (qryBeneficio.FieldByName('FlgResgate').AsInteger = 1) and
        (not AtualizaReservaPart(qryBeneficio.FieldByName('IdBeneficio').AsInteger))
     then begin
        MsgDlg('Ocorreu um erro na atualização do valor da reserva do participante. ',
               'Erro',mtError,[mbOk],0);
        TiraSQL(qryAux);
        Abort;
     end;

     dblkpcmbBeneficio.Enabled := True;
     //qrybeneficiario.Close; { Augusto 03/02/2004 }
     btn_SelecionaBeneficios.enabled := True;
     dtDataRequerimento.Enabled      := False;
     dblkpcmbBeneficiario.enabled    := False;
     dbeMatriculaBenef.Enabled       := False;  // Gleyber - 26/01/2004 - Pendência 15925
     dbedNumProcINSS.enabled         := False;
     dtInicioINSS.enabled            := False;
     dtInicioFund.enabled            := False;
     reValorCalcInss.enabled         := False;
     reValorInfINSS.enabled          := False;
     reValorBeneficio.Enabled        := False;
     reValorTotal.Enabled            := False;
     dtDataInicio.enabled            := False;
     dtDataFinal.enabled             := False;
     dblkcmbTpPgtoBenef.enabled      := False;
     dblkpcmbPortForma.enabled       := False;

     iTotRequeridos                  := 0;
     if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then dblkpcmbBeneficio.SetFocus;
  end
  else begin
     qrybeneficio1.Close;
     qrybeneficio1.SQL.Clear;
     qrybeneficio1.SQL.Add('SELECT B.IDBENEFICIO, B.NOME '+
                           'FROM BENEFICIO B '+
                           'WHERE B.IDBENEFICIO = :IDBENEFICIO');
     qrybeneficio1.ParamByName('IDBENEFICIO').AsInteger := idbeneficioselecionado;
     qrybeneficio1.Open;
     btn_SelecionaBeneficios.enabled := false;

     dblkpcmbBeneficio.Text := qrybeneficio1.FieldByName('Nome').AsString;

     { Augusto 26/11/2002 }
     bbtnOpcoes.Visible := ( qryBeneficio.FieldbyName('FLGACEITAOPCAO').AsInteger = 1 );


     // Verificar se este benefício já foi requerido para algum beneficiário
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT BF.NUMEROPROCESSO, BF.DATAREQUERIMENTO, BF.IDSITBENEFICIO '+
                 ' FROM   BENEFBFCIARIO BF '+
                 ' WHERE  BF.IDTITULAR    = '+IntToStr(iIdTitular)+
                 ' AND    BF.SEQPROPOSTA  = '+IntToStr(iSeqProposta)+
                 ' AND    BF.IDPESSJUR    = '+IntToStr(iIdPessJur)+
                 ' AND    BF.IDPLANOORIGEM  = '+IntToStr(iIdPlanoPrev)+
                 ' AND    BF.IDBENEFICIO  = '+qryBeneficio.FieldbyName('IdBeneficio').AsString+
                 ' AND    BF.IDSITBENEFICIO = 4 '+
                 ' AND    BF.NUMEROPROCESSO < '+IntToStr(iNumeroProcesso));
     qryAux.Open;
     if not qryAux.IsEmpty
     then begin
         if MsgDlg('Este benefício já foi requerido em '+qryAux.FieldByName('DataRequerimento').AsString+
                   ' e está pendente de concessão. '+
                   'Verifique o processo nº '+qryAux.FieldByName('NumeroProcesso').AsString+'. Deseja continuar ?',
                   'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
         then begin
            qryAux.Close;
            dblkpcmbBeneficio.Text := '';
            if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then
            dblkpcmbBeneficio.SetFocus;
            Exit;
         end;
     end;

     lblNomeBenef.Caption := dblkpcmbBeneficio.Text;

     // camille - 07.08.2002
     { // Executar regra de calculo de data de inicio e data final
     if (Trim(qryBeneficio.FieldByName('IdRegraInicio').AsString) <> '') AND
        (qryBeneficio.FieldByName('IdRegraInicio').AsInteger >  0)
     then begin
        frmAguarde.Mostra('Regra de Data de Início - Nº '+qryBeneficio.FieldByName('IdRegraInicio').AsString);
        sDataInicio := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraInicio').AsInteger,
                                 iIdPessJur, iIdPlanoPrev, iIdTitular,
                                 iSeqProposta,
                                 iIdPessoa,
                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 dtDataEvento.Text,
                                 dtInicioFund.Text,
                                 dtDataInicio.Text, // Augusto 04/12/2002
                                 dtDataFinal.Text,  // Augusto 04/12/2002
                                 DateToStr(date),
                                 sFlgTpDemissao,
                                 bErro,
                                 sMsgErro);
        frmAguarde.Apaga;
        if bErro
        then begin
           MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
           qryDet.FieldByName('DataInicio').AsString := '';
           dtDataInicio.Text := '';
        end
        else begin
           if Trim(sDataInicio) <> ''
           then begin
              qryDet.FieldByName('DataInicio').AsString := sDataInicio;
              dtDataInicio.Date := StrToDate(sDataInicio);
           end;
        end;
     end; //if regrainicio <> ''

     if (Trim(qryBeneficio.FieldByName('IdRegraFim').AsString) <> '') and
        (qryBeneficio.FieldByName('IdRegraFim').AsInteger > 0)
     then begin
        frmAguarde.Mostra('Regra de Data Final - Nº '+qryBeneficio.FieldByName('IdRegraFim').AsString);
        sDataFinal := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraFim').AsInteger,
                                 iIdPessJur, iIdPlanoPrev, iIdTitular,
                                 iSeqProposta,
                                 iIdPessoa,
                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 dtDataEvento.Text,
                                 dtInicioFund.Text,
                                 dtDataInicio.Text, // Augusto 04/12/2002
                                 dtDataFinal.Text,  // Augusto 04/12/2002
                                 DateToStr(date),
                                 sFlgTpDemissao,
                                 bErro,
                                 sMsgErro);
        frmAguarde.Apaga;
        if bErro
        then MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0)
        else if Trim(sDataFinal) <> ''
             then begin
                qrydet.FieldByName('DATAFINAL').AsString := sDataFinal;
                dtDataFinal.Date := StrToDate(sDataFinal);
             end;
     end; // if regrafim <> ''
}
     if (dtDataRequerimento.enabled) and (dtDataRequerimento.visible)
     then dtDataRequerimento.SetFocus;
  end;

end;

procedure TfrmCadRequerBenefBfciario.bbtnElegibilidadeClick(
  Sender: TObject);
var bErro : boolean;
    sMsgErro : string;
begin
  if Trim(dblkpcmbBeneficio.Text) = ''
  then begin
    MsgDlg('Preencha o Benefício.','Erro',mtError,[mbOk],0);
    if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then
    dblkpcmbBeneficio.SetFocus;
    Exit;
  end;

  bExecutouRegraConcessao := True;

  // Se for simulacao nao executar regra de elegibilidade
  if sTipoFormChamador = 'SI'
  then begin
    bConcedeBeneficio       := True;
    bExecutouRegraConcessao := True;
    Exit;
  end;

  if (Trim(qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString) = '') or
     (qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsInteger <= 0) then
  begin
    bConcedeBeneficio := True;
  end
  else
  begin
     frmAguarde.Mostra( 'Regra de Elegibilidade - Nº ' +
                        qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString );

     Try
       bConcedeBeneficio := ExecutaRegraElegibilidade(qryAux,
                                                      qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsInteger,
                                                      iIdPessJur, iIdPlanoPrev, iIdTitular,
                                                      iSeqProposta,
                                                      qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                      rOpcao1, rOpcao2, rOpcao3,
                                                      FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),  // 24334
                                                      FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),  // 24334
                                                      sDataDemissao,
                                                      FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date),  // 24334
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
       frmAguarde.Apaga; //ClaudioR - 22119 - 04/09/2007
     End;

     frmAguarde.Apaga;

     if bErro then
     begin
       MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
       Exit;
     end
     else
     begin
        if not bConcedeBeneficio
        then  MsgDlg('A Regra de Elegibilidade nº '+
                     qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString+
                     ' NÃO foi satisteita. Verifique. ','Informação',mtInformation,[mbOk],0)
        else MsgDlg('A Regra de Elegibilidade nº '+
                     qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString+
                     ' foi satisteita. ','Informação',mtInformation,[mbOk],0);
     end;
  end;
end;

procedure TfrmCadRequerBenefBfciario.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
    cAuxSeparador : char;
begin
  inherited;
  // Verificar se participante já fez opções
  qryAux.Close;
  qryAux.SQL.Clear;

  // CGUEDES - 31/07/2003 - Pend.: 14651/2
  //qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM BENEFPLANOPART ' +
  qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM BENEFBFCIARIO ' +
                 ' WHERE IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND ' +
                 '       IDTITULAR   = ' + IntToStr(iIdTitular)   + ' AND ' +
                 '       IDPESSOA    = ' + IntToStr(iIdPessoa)    + ' AND ' +
                 '       IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
                 '       SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND ' +
                 '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
  qryAux.Open;

  if qryAux.IsEmpty then
  begin
     //leofuncef - 02092003
     //não pode zerar por que a qryaux deve estar vazia
     //apenas na alteração a qryaux estará preenchida pois
     //a benefbfcviario é gravada apenas no final
     {rOpcao1 := 0;
     rOpcao2 := 0;
     rOpcao3 := 0;}
     //leofuncef - 02092003 - fim
  end
  else
  begin
     if qryAux.FieldByName('VALORBASE1').AsString <> ''
     then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
     else rOpcao1 := 0;

     if qryAux.FieldByName('VALORBASE2').AsString <> ''
     then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
     else rOpcao2 := 0;

     if qryAux.FieldByName('VALORBASE3').AsString <> ''
     then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
     else rOpcao3 := 0;
  end;

  bPodeAlterarOpcoes := True;

  iIdCalculoGeral := iIdCalculo; { Augusto 07/05/2007 - Passar IDCALCULO para opçoes }

  if not qryAux.IsEmpty then
  begin // Opcoes já cadastradas
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
                                 iIdPessJur,
                                 iIdPlanoPrev,
                                 iIdTitular,
                                 iSeqProposta,
                                 qryBeneficio.FieldbyName('IdBeneficio').AsInteger,
                                 iNumeroProcesso,
                                 FormatDateTime('dd/mm/yyyy', dtDataEvento.Date), // 24334
                                 FormatDateTime('dd/mm/yyyy', dtInicioFund.Date), // 24334
                                 FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date), // 24334
                                 FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date), // 24334
                                 reValorInfINSS.Text,
                                 reValorCalcINSS.Text,
                                 sValorBase1INSS, sValorBase2INSS, sValorBase3INSS,
                                 sFlgInternoAntes,
                                 sFlgInternoDepois,
                                 sIdSitPartAntes,
                                 sIdSitPlanAntes,
                                 sIdSitFuncAntes,
                                 sIdSitPartDepois,
                                 sIdSitPlanDepois,
                                 sIdSitFuncDepois);
     frmCadOpcoesBenef.Free;
  end
  else
  begin // Cadastrar Opcoes
     bOpcoesExistem := False;
     frmCadOpcoesBenef := TfrmCadOpcoesBenef.Create(Application);
     frmCadOpcoesBenef.LerOpcoes(sNomeTitular, sNomePlano, sNomePatro,
                                 dblkpcmbBeneficio.Text,
                                 qryBeneficio.FieldByName('NOMEVALORBASE1').AsString, qryBeneficio.FieldByName('NOMEVALORBASE2').AsString,
                                 qryBeneficio.FieldByName('NOMEVALORBASE3').AsString,
                                 qryBeneficio.FieldByName('NUMOPCOES').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3, bPodeAlterarOpcoes,
                                 qryBeneficio.FieldByName('FLGEDITAOP1').AsInteger,
                                 qryBeneficio.FieldByName('FLGEDITAOP2').AsInteger,
                                 qryBeneficio.FieldByName('FLGEDITAOP3').AsInteger,
                                 iIdPessJur,
                                 iIdPlanoPrev,
                                 iIdTitular,
                                 iSeqProposta,
                                 qryBeneficio.FieldbyName('IdBeneficio').AsInteger,
                                 iNumeroProcesso,
                                 FormatDateTime('dd/mm/yyyy', dtDataEvento.Date), // 24334
                                 FormatDateTime('dd/mm/yyyy', dtInicioFund.Date), // 24334
                                 FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date), // 24334
                                 FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date), // 24334
                                 reValorInfINSS.Text,
                                 reValorCalcINSS.Text,
                                 sValorBase1INSS, sValorBase2INSS, sValorBase3INSS,
                                 sFlgInternoAntes,
                                 sFlgInternoDepois,
                                 sIdSitPartAntes,
                                 sIdSitPlanAntes,
                                 sIdSitFuncAntes,
                                 sIdSitPartDepois,
                                 sIdSitPlanDepois,
                                 sIdSitFuncDepois   );

     frmCadOpcoesBenef.Free;
  end;

  iIdCalculo := iIdCalculoGeral; { Augusto 07/05/2007 - Receber IDCALCULO das opçoes }


  // Gravar Opcoes do participante na BenefPlanoPart
  if (rOpcao1 >= 0) and (rOpcao2 >= 0) and (rOpcao3 >= 0) and
     (bOpcoesExistem) then { Augusto 24/10/2003 - retirei o NOT }
  begin // Opcoes ainda nao existiam
  // CGUEDES - 31/07/2003 - Pend.: 14651/2


     qryAux.SQL.Clear;
     cAuxSeparador    := DecimalSeparator;
     DecimalSeparator := '.';
     qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET  VALORBASE1 = ' + FormatFloat('#0.00000',rOpcao1) + ',' +
                    '                           VALORBASE2 = ' + FormatFloat('#0.00000',rOpcao2) + ',' +
                    '                           VALORBASE3 = ' + FormatFloat('#0.00000',rOpcao3) +
                    ' WHERE IDPESSJUR   = ' + IntToSTr(iIdPessJur)   + ' AND ' +
                    '       IDTITULAR   = ' + IntToStr(iIdTitular)   + ' AND ' +
                    '       IDPESSOA    = ' + IntToStr(iIdPessoa)    + ' AND ' +
                    '       IDPLANOPREV = ' + IntToSTr(iIdPlanoPrev) + ' AND ' +
                    '       SEQPROPOSTA = ' + IntToSTr(iSeqProposta) + ' AND ' +
                    '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
     DecimalSeparator := cAuxSeparador;
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;// except

    // Gleyber - 01/08/2005 - Pendência 19060 - Início
    If (Not bValidaOpcaoBeneficio) And
       (MsgDlg('As opções informadas são idênticas para todos os beneficiários deste benefício?','Confirmação',
               mtConfirmation,[mbYes,mbNo],0) = mrYes)
     Then bValidaOpcaoBeneficio := True;
    // Gleyber - 01/08/2005 - Pendência 19060 - Fim


{     qryAux.Close;
     qryAux.SQL.Clear;
     cAuxSeparador    := DecimalSeparator;
     DecimalSeparator := '.';
     qryAux.SQL.Add(' INSERT INTO BENEFPLANOPART (IDPESSJUR,IDPLANOPREV,IDPESSOA, SEQPROPOSTA, IDBENEFICIO,VALORBASE1, '+
                    '             VALORBASE2,VALORBASE3) '+
                    ' VALUES ('+ IntToStr(iIdPessJur) + ',' +  IntToStr(iIdPlanoPrev) + ','+
                                 IntToStr(iIdTitular) + ',' +  IntToSTr(iSeqProposta) + ','+
                                 qryBeneficio.FieldByName('IDBENEFICIO').AsString+','+
                                 FormatFloat('#0.00000',rOpcao1)+','+
                                 FormatFloat('#0.00000',rOpcao2)+','+
                                 FormatFloat('#0.00000',rOpcao3)+')');
     DecimalSeparator := cAuxSeparador;
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;//try
  end
  else begin // atualizar opcoes
     if(rOpcao1 >= 0) and (rOpcao2 >= 0) and (rOpcao3 >= 0) and
       (bOpcoesExistem)
     then begin
       qryAux.Close;
       qryAux.SQL.Clear;
       cAuxSeparador    := DecimalSeparator;
       DecimalSeparator := '.';
       qryAux.SQL.Add(' UPDATE BENEFPLANOPART SET VALORBASE1 = ' + FormatFloat('#0.00000',rOpcao1) + ',' +
                      '                           VALORBASE2 = ' + FormatFloat('#0.00000',rOpcao2) + ',' +
                      '                           VALORBASE3 = ' + FormatFloat('#0.00000',rOpcao3) +
                      ' WHERE IDPESSJUR   = ' + IntToSTr(iIdPessJur)   + ' AND ' +
                      '       IDPESSOA    = ' + IntToSTr(iIdTitular)   + ' AND ' +
                      '       IDPLANOPREV = ' + IntToSTr(iIdPlanoPrev) + ' AND ' +
                      '       SEQPROPOSTA = ' + IntToSTr(iSeqProposta) + ' AND ' +
                      '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
       DecimalSeparator := cAuxSeparador;
       try
          qryAux.ExecSQL;
       except
          on E:EDBEngineError do
          begin
             MostrarErro(E);
             Exit;
          end;
       end;// except
     end; // if
  }
  end;
end;

procedure TfrmCadRequerBenefBfciario.sbtnConcedeUmClick(Sender: TObject);
var iIdSitBenef, iIdSitTemp : integer;
    bSituacoesDiferentes    : boolean;
begin
  // Se estiver em insercao ou edicao, nao permitir concessao
  if qryDet.State in [dsEdit, dsInsert]
  then begin
     MsgDlg(' Este benefício não pode ser concedido antes de ser confirmado. '+
            ' Confirme a operação antes de concedê-lo. ','Informação',mtInformation,[mbOk],0);
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Verificar se o motivo default na tabela de parametros está preenchido
  if prmIDMOTIVOFOLHABEN <= 0
  then begin
     MsgDlg('O parâmetro motivo da folha de benefício não está preenchido. '+
            'Utilize a tela de parâmetros para cadastrá-lo. ','Informação',mtInformation,[mbOk],0);
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Dependendo da situacao do beneficio, nao faz sentido concede-lo novamente
  if (qryDet.FieldByName('IdSitBeneficio').AsInteger in [1,3,5])
  then begin
     MsgDlg(' Este benefício não pode ser concedido. Verifique sua situação.  ',
            'Informação',mtInformation,[mbOk],0);
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Atualizar query de conta bancaria
  // Verificar conta bancaria do recebedor
  if qryBeneficiario.FieldByName('NOMERESPONSAVEL').AsString = ''
  then begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('IdPessoa').AsInteger;
     qryContaBancaria.Open;
  end
  else begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('IdResponsavel').AsInteger;
     qryContaBancaria.Open;
  end;

  if not qryBeneficio.Active
  then begin
     qryBeneficio.Close;
     qryBeneficio.ParamByName('IdEventoGerador').Value := qry.FieldByName('IdEventoGerador').AsInteger;
     qryBeneficio.ParamByName('IdPlanoPrev').Value     := qryDet.FieldByName('IdPlanoPrev').AsInteger;
     qryBeneficio.Open;
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

  if not ConcedeUmBeneficio(Sender, iIdSitBenef)
  then begin
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Se o processo só possuir um beneficio, atualizar situacao do processo
  // Caso contrario verificar se todos os beneficios do processo estao com a mesma
  // situacao
  if qryDet.RecordCount = 1
  then begin
     qry.FieldbyName('IdSitProcesso').AsInteger := iIdSitBenef;
     qry.FieldByName('Descricao').AsString      := vetDescBeneficio[iIdSitBenef];
  end
  else begin // processo possui + de 1 beneficio
     // Verificar se existem beneficios com situacoes diferentes
     iIdSitTemp := iIdSitBenef;
     bSituacoesDiferentes := False;
     qryDet.DisableControls;
     qryDet.First;
     while not qryDet.Eof do
     begin

        // Gleyber - 08/11/2006 - Pendência 23246 - Início
        If (qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 3) Then
        Begin
          qryDet.Next;
          Continue;
        End;
        // Gleyber - 08/11/2006 - Pendência 23246 - Fim

        if (qryDet.FieldByName('IdSitBeneficio').AsInteger <> iIdSitTemp) and
           (not BeneficioDePagamentoUnico ( qryDet.FieldByName('IdBeneficio').AsInteger ) )
        then bSituacoesDiferentes := True;
        qryDet.Next;
     end;//while
     qryDet.EnableControls;

     if bSituacoesDiferentes
     then begin // existe + de 1 beneficio no processo e estao com situacoes diferentes
        MsgDlg('O Processo Nº '+IntToStr(iNumeroProcesso)+' possui benefícios com situações diferentes.' +
                  'Caso estas situações não sejam regularizadas o processo não terá sua situação alterada.',
                  'Informação', mtInformation, [mbOk], 0);
        TiraSQL(qryAux);
     end
     else begin // existe +  de 1 beneficio no processo mas todos estao com  a mesma situacao
        qry.FieldbyName('IdSitProcesso').AsInteger := iIdSitTemp;
        qry.FieldByName('Descricao').AsString      := vetDescBeneficio[iIdSitTemp];
     end;
  end; // else - if RecordCount = 1

  lblNumProcesso.Caption   := 'Processo Nº '+IntToStr(iNumeroProcesso);
  lblSitProcesso.Caption := 'Situação : '+qry.FieldByName('Descricao').AsString;

  sbtnConcedeUm.Down := False;
  MsgDlg('Benefício concedido com sucesso.', 'Informação',mtInformation,[mbOk, mbHelp],0);
  TiraSQL(qryAux);
end;

procedure TfrmCadRequerBenefBfciario.dsStateChange(Sender: TObject);
begin
  inherited;
  if sTipoFormChamador = 'CO'
  then sbtnConcedeUm.Enabled    := (ds.DataSet.State = dsEdit);
//  sbtnConcedeTodos.Enabled := (ds.DataSet.State = dsEdit);
end;

procedure TfrmCadRequerBenefBfciario.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if sTipoFormChamador = 'CO'
  then sbtnConcedeUm.Enabled    := not (ds.DataSet.State in [dsInsert,dsEdit]);

end;

procedure TfrmCadRequerBenefBfciario.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryBeneficio.Active
  then begin
     if not qryDet.Active
     then Exit
     else lblNomeBenef.Caption := qryDet.FieldByName('Nome').AsString;
  end
  else lblNomeBenef.Caption := qryBeneficio.FieldByName('Nome').AsString;
  if qryDet.Active
  then begin
     rOpcao1 := qryDet.FieldByName('VALORBASE1').AsFloat;
     rOpcao2 := qryDet.FieldByName('VALORBASE2').AsFloat;
     rOpcao3 := qryDet.FieldByName('VALORBASE3').AsFloat;
  end;

  reValorTotal.Text        := qryDet.FieldByName('VALORTOTAL').AsString;
  reValorCalcInss.Text     := qryDet.FieldByName('VLRCALCINSS').AsString;
  reValorInfInss.Text      := qryDet.FieldByName('VLRINFINSS').AsString;
  reValorSRB.Text          := qryDet.FieldByName('VALORSRB').AsString;

  if (qryBeneficio.Active) and (qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1)
  then reValorBeneficio.Text := qryDet.FieldByName('ValorCotas').AsString
  else reValorBeneficio.Text := qryDet.FieldByName('ValorAtual').AsString;

  rValorCotas := qryDet.FieldByName('ValorCotas').AsFloat;
  rValorReal  := qryDet.FieldByName('ValorAtual').AsFloat;

  if qryDet.FieldByName('FlgProvisorio').AsInteger <= 0
  then begin
    lblPercConc.Visible             := False;
    dbedPercConc.Visible            := False;
    lblPercent.Visible              := False;
    lblPrazoProv.Visible            := False;
    dbedPrazoProv.Visible           := False;
    lblMesProv.Visible              := False;
  end
  else begin
    lblPercConc.Visible             := True;
    dbedPercConc.Visible            := True;
    lblPercent.Visible              := True;
    lblPrazoProv.Visible            := True;
    dbedPrazoProv.Visible           := True;
    lblMesProv.Visible              := True;
  end;

  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1
  then begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';
     // CGUEDES - 16/07/2002
     //pnlBenefProv.Visible := False;
     // Gleyber - 11/11/2002
     // grpInfSupl.Visible := False;
     pnlNaoBenefProv.Visible := False;
     pnlBenefProv.Visible    := True;

  end
  else begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';  // CAMILLE - 22.10.2004 - PENDENCIA 17865
     // CGUEDES - 16/07/2002
     // pnlBenefProv.Visible := True;
     // Gleyber - 11/11/2002
     // grpInfSupl.Visible := True;
     pnlNaoBenefProv.Visible := True;
     pnlBenefProv.Visible    := True;

  end;

  // Verificar conta bancaria do recebedor
  if qryBeneficiario.FieldByName('NOMERESPONSAVEL').AsString = ''
  then begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('idPessoa').AsInteger;
     qryContaBancaria.Open;
  end
  else begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryBeneficiario.FieldByName('IdResponsavel').AsInteger;
     qryContaBancaria.Open;
  end;
end;

procedure TfrmCadRequerBenefBfciario.sbtnApagarClick(Sender: TObject);
begin
  // CAMILLE - REFER - 22.05.1999
  if MsgDlg(' Esta operação não irá desfazer o evento '+qryEvento.FieldByName('Nome').AsString+'.'+
            ' Para desfazer o evento, utilize a função "Cancelar Evento Registrado". '+
            ' Deseja continuar exclusão do processo ? ','Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo
  then begin
     sbtnApagar.Down := False;
     Exit;
  end;

  if (qry.FieldByName('IdSitProcesso').AsInteger <> 4) and // pendente
     (qry.FieldByName('IdSitProcesso').AsInteger <> 6) and // nao concedido
     (qry.FieldByName('IdSitProcesso').AsInteger <> 7)     // concedido em exigencia
  then begin
    MsgDlg(' Este processo não pode ser excluído. ','Informação',mtInformation,[mbOk],0);
    sbtnApagar.Down := False;
    Exit;
  end;

  // Se estiver deletando um processo ainda Pendente, ou concedido em exigencia
  // o sistema tem que devolver a reserva
  if (qry.FieldByName('IdSitProcesso').AsInteger = 4) or // pendente
     (qry.FieldByName('IdSitProcesso').AsInteger = 7) then     // concedido em exigencia
  begin
    frmAguarde.Mostra('Verificando saldo de reservas ... ');

    qryDet.DisableControls;
    qryDet.First;
    while not qryDet.Eof do
    begin
      if qryDet.FieldByName('FlgResgate').AsString = '1' then
      begin
        if not DevolveReserva( qryDet.FieldByName('IdBeneficio').AsInteger,
                               qryDet.FieldByName('IdPessoa').AsInteger) then
        begin
          MsgDlg('Ocorreu um problema no acerto do saldo de reserva deste participante. '+
                 'Para sua garantia o processo não será excluído até que o problema seja solucionado. '+
                 'Verifique. ','Informação',mtInformation,[mbOk],0);

          TiraSQL(qryAux);
          frmAguarde.Apaga;
          Exit;
        end;
      end;
      qryDet.Next;
    end; //while

    frmAguarde.Apaga;
    qryDet.EnableControls;
  end;

  inherited;
end;

procedure TfrmCadRequerBenefBfciario.sbtnAlterarClick(Sender: TObject);
begin
   // Gleyber - 24/10/2006 - Pendência 23246 - Início
   If bFlgBenefMorte
    Then Begin
      If qry.State <> dsEdit
       Then qry.Edit;
      qry.FieldByName('IdSitProcesso').AsInteger := 4;
      qry.Post;
    End;
   // Gleyber - 24/10/2006 - Pendência 23246 - Fim
   if (qry.FieldByName('IdSitProcesso').AsInteger <> 4) and  // Pendente de Concessao
      (qry.FieldByName('IdSitProcesso').AsInteger <> 8) and  // Simulacao
      (sTipoFormChamador <> 'MA')
   then begin
     MsgDlg(' Este processo não pode ser alterado. ','Informação',mtInformation,[mbOk],0);
     bbtnCancelarClick(frmCadRequerBenefBfciario);
     Exit;
   end;
  inherited;
end;

procedure TfrmCadRequerBenefBfciario.dtInicioFundExit(Sender: TObject);
begin
  inherited;
  if (Trim(dtDataInicio.Text) = '') and (Trim(dtInicioFund.Text) <> '')
  then begin
     qryDet.FieldByName('DataInicio').AsDateTime := StrToDate(dtDataInicio.Text);
     dtDataInicio.Date := dtInicioFund.Date;
  end;
  // Data de Inicio na Fundacao nao pode ser menor que a data no INSS,
  // nem que a data do evento
  if (Trim(dtInicioFund.Text) <> '') and
     (Trim(dtInicioINSS.Text) <> '') and
     (dtInicioFund.Date < dtInicioINSS.Date)  // 24334
  then begin
     MsgDlg('A DIB (Data de Início na Fundação) não pode ser inferior a Data de Início no INSS. ',
            'Informação',mtInformation,[mbOk],0);
     dtInicioFund.SetFocus;
     Exit;
  end;

  if (Trim(dtInicioFund.Text) <> '') and
     (Trim(dtDataEvento.Text) <> '') and
     (dtInicioFund.Date < dtDataEvento.Date)  // 24334
  then begin
     MsgDlg('A DIB (Data de Início na Fundação) não pode ser inferior a Data do Evento. ',
            'Informação',mtInformation,[mbOk],0);
     dtInicioFund.SetFocus;
     Exit;
  end;

end;

procedure TfrmCadRequerBenefBfciario.dtDataInicioExit(Sender: TObject);
begin
  inherited;
  if Trim(dtInicioFund.Text) = ''
  then dtInicioFund.Date := dtDataInicio.Date;

  // Data de Inicio na Fundacao nao pode ser menor que a data no INSS,
  // nem que a data do evento
  if (Trim(dtDataInicio.Text) <> '') and
     (Trim(dtDataEvento.Text) <> '') and
     (dtDataInicio.Date < dtDataEvento.Date)  // 24334
  then begin
     MsgDlg('A Data de Início do Pagamento não pode ser inferior a Data do Evento. ',
            'Informação',mtInformation,[mbOk],0);
     dtDataInicio.SetFocus;
     Exit;
  end;
  sDataInicioPagto := Trim(dtDataInicio.Text);
end;

procedure TfrmCadRequerBenefBfciario.bbtnConfirmarClick(Sender: TObject);
var bOk : boolean;
    sMesAtraso: string;
    sDataInicioContrib : string; // CAMILLE - 30.08.2004
    // Gleyber - 01/08/2005 - Pendência 19060 - Início
    cAuxSeparador : char;
    dVlrOpcao1,
    dVlrOpcao2,
    dVlrOpcao3    : Double;
    // Gleyber - 01/08/2005 - Pendência 19060 - Fim
begin
  sNumeroProcessoAntesGravar := IntToStr(iNumeroProcesso);

  // Fazer verificacoes
  if qryDet.State in [dsInsert,dsEdit]
  then begin
     MsgDlg('O Processo não pode ser confirmado. '+
            'Confirme o benefício em aberto. ','Erro',mtError,[mbOk],0);
     Abort;
  end;

  // Verificar campos obrigatorios
  if qryDet.IsEmpty
  then begin
     MsgDlg('O Processo deve conter ao menos um benefício.','Erro',mtError,[mbOk],0);
     Abort;
  end;

  with qryAux do
  begin
     Close;
     SQL.Clear;
     // CAMILLE - 07.08.2002
     SQL.Add(' SELECT COUNT(DISTINCT BF.IDPESSOA)  AS NUMBENEF '+
             ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP       '+
             ' WHERE  BF.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+
             ' AND    ((BF.IDSITBENEFICIO = 1) OR (BF.IDSITBENEFICIO = 4)) '+
             ' AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV) '+
             ' AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO) '+
             ' AND    ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  '
             );
     Open;
     if IsEmpty
     then iNumBenef := 1
     else iNumBenef := FieldByName('NUMBENEF').AsInteger;
  end;

  // Verificar consistencia de no de dependentes para IRRF e SalarioFamilia
  if not VerificaNumeroDependentes then Exit;

  // Verificar se existe  algum benefício obrigatorio no evento que não foi
  // requerido
  if not VerificaBeneficioObrigatorio then Exit;

  // Verificar se existem beneficios com o mesmo numero de ordem no mesmo
  // requerimento
  if not VerificaBeneficioRepetido then Exit;

  // CGUEDES - 17/07/2002
  If sTipoFormChamador = 'EV' Then
    VerificaEvolucaoPensionista;


  // Se está em edicao, e concedeu o beneficio, preparar contribuicoes
  if (qry.State = dsEdit) and (bConcedeuBeneficio)
  then begin

     bCobraContribAtrasada := False;


     if qryBeneficio.FieldByName('FLGACEITAACERTO').AsInteger = 1 then //leofuncef - 11012004
     //verifica se os acertos devem ser cobrados no benefício do beneficiário
     begin
        // Verificar se participante tem contribuicoes atrasadas
        if VerificaContribAtrasada(sMesAtraso)
        then begin
           { Augusto 04/02/2004 - 0 não obriga }
           if qryBeneficio.FieldByName('FLGQUITAPREVIDEN').AsInteger = 0 //1
           then begin
              if MsgDlg('Este participante possui contribuições atrasadas desde '+sMesAtraso+'. '+
                        'Deseja cobrar estas contribuições na Folha de Benefícios ? ',
                        'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
              then begin
                 bCobraContribAtrasada := False;
                 if MsgDlg('Deseja continuar a concessão do benefício ? ' ,
                        'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
                 then begin
                    TiraSQL(qryAux);
                    Exit;
                 end;
              end
              else bCobraContribAtrasada := True;
           end
           else begin
              MsgDlg('Este participante possui contribuições atrasadas desde '+sMesAtraso+' e '+
                     'o benefício selecionado OBRIGA QUITAR as dívidas previdenciárias. '+
                     'Verifique.','Erro',mtError,[mbOk],0);
              TiraSQL(qryAux);
              Exit;
           end;
        end;
     end;

     if not dtmBaseDados.dbBaseDados.InTransaction
     then dtmBaseDados.dbBaseDados.StartTransaction;



     //leocm - 03102002 - comentei
     //a  CobraContribAtrasada, pois isto é feito mais abaixo
     //na função
     {if bCobraContribAtrasada
     then begin
        bOK := False;
        bOK := CobraContribAtrasada(qryDet.FieldByName('IdPessJur').AsInteger,
                                    qryDet.FieldByName('IdPlanoPrev').AsInteger,
                                    qryDet.FieldByName('IdPessoa').AsInteger,
                                    qryDet.FieldByName('SeqProposta').AsInteger,
                                    dtInicioFund.Text);
        if not bOK
        then begin
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro no preparo das contribuições atrasadas. Verifique. ','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;
     end;}

     bOK := True; { Augusto 21/09/2004 - Variavel não estava sendo inicializada }

     // CAMILLE - 07.01.2004
     // Se o parametro prmFLGENVACERTOFALEC = True
     // Entao verificar se ficou algum acerto lançado para o proprio participante
     //       e que não tenha sido processado pela folha. Se sim, entao
     //       jogar esses acertos para o idmotivo = prmIdMotDevolNaoIden
     if bOK and prmFLGENVACERTOFALEC
     then begin
        bOK := False;
        bOK := VerificaAcertosFalecido( iNumeroProcesso,
                                        qryDet.FieldByName('IdPessJur').AsInteger,
                                        qryDet.FieldByName('IdPlanoPrev').AsInteger,
                                        qryDet.FieldByName('IdTitular').AsInteger,
                                        qryDet.FieldByName('SeqProposta').AsInteger,
                                        iIdLoteConcessao,
                                        FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),  // 24334
                                        sDataPagamentoConcessao  );
        if not bOK
        then begin
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro na verificação dos acertos lançados para o participante falecido. Verifique. ','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;
     end;

     // CAMILLE - REFER - 10.03.2001
     // Verificar beneficios POS-MORTE, ou seja, os beneficios que já foram pagos ao
     // participante com data posterior a data da morte do mesmo
     // Estes beneficios devem ser descontados dos beneficiarios
     if bOK
     then begin
        bOK := False;
        bOK := TrataBeneficioPosMorte( iNumeroProcesso,
                                       qryDet.FieldByName('IdPessJur').AsInteger,
                                       qryDet.FieldByName('IdPlanoPrev').AsInteger,
                                       qryDet.FieldByName('IdTitular').AsInteger,
                                       qryDet.FieldByName('SeqProposta').AsInteger,
                                       prmIdMotivoFolhaBen,
                                       iNumBenef, iIdLoteConcessao,
                                       FormatDateTime('dd/mm/yyyy', dtDataEvento.Date), // 24334
                                       sDataPagamentoConcessao,
                                       -1,
                                       sIdBeneficiarioEncerrado // Gleyber - 14/11/2006 - Pendência 23246
                                     );


        if not bOK
        then begin
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro na verificação/tratamento de benefício pós-morte. Verifique. ','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;

     end;


     // CAMILLE - REFER - 10.03.2001
     if bOK
     then begin
        bOK := False;
        bOK := TrataAtrasoDevolContribPosMorte( iNumeroProcesso,
                                          qryDet.FieldByName('IdPessJur').AsInteger,
                                          qryDet.FieldByName('IdPlanoPrev').AsInteger,
                                          qryDet.FieldByName('IdTitular').AsInteger,
                                          qryDet.FieldByName('SeqProposta').AsInteger,
                                          prmIdMotivoFolhaBen,
                                          iNumBenef, iIdLoteConcessao,
                                          FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),  // 24334
                                          sDataPagamentoConcessao,
                                          sIdBeneficiarioEncerrado // Gleyber - 14/11/2006 - Pendência 23246  );
                                          );

        if not bOK
        then begin
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro na verificação/tratamento de contribuição pós-morte. Verifique. ','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;
     end;

     // CAMILLE - REFER - 16.03.2001
{    if bOK
     then begin
        bOK := False;
        bOK := CalculaUltimaContrib13 ( qryDet.FieldByName('IdPessJur').AsInteger,
                                        qryDet.FieldByName('IdPlanoPrev').AsInteger,
                                        qryDet.FieldByName('IdTitular').AsInteger,
                                        qryDet.FieldByName('SeqProposta').AsInteger,
                                        iNumeroProcesso,
                                        iIdEvento,
                                        prmIdMotivoFolhaBen,
                                        1,
                                        1,
                                        0,
                                        iIdLoteConcessao,
                                        Copy(dtDataEvento.Text,7,4)+'/'+Copy(dtDataEvento.Text,4,2),
                                        sAnoMesLoteConcessao,
                                        sFlgInternoAntes,
                                        sFlgInternoDepois,
                                        sIdSitPartAntes,
                                        sIdSitPartDepois,
                                        qryTitular.FieldByName('INSCRICAODATA').AsString,
                                        qryTitular.FieldByName('DataNasc').AsString,
                                        True);

        if not bOK
        then begin
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro na verificação/tratamento de benefício pós-morte. Verifique. ','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;
     end;
}

     if bOk
     then begin
        bOK := AtualizaSitParticipante( qryDet.FieldByName('IDPESSJUR').AsInteger,
                                        qryDet.FieldByName('IDPLANOORIGEM').AsInteger, { Augusto 19/03/2004 - era IdPlanoPrev }
                                        qryDet.FieldByName('IDTITULAR').AsInteger,
                                        qryDet.FieldByName('SEQPROPOSTA').AsInteger,
                                        qryEvento.FieldByName('IDEVENTOGERADOR').AsInteger );
        if not bOK
        then begin
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro ao atualizar situações do beneficiário, verificar Eventos. Verifique. ','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;
     end;


     //leocm - 02102002 - inicio
     //grava o mvimento na MOVBENEF
     sDataInicioContrib := ''; // CAMILLE - 30.08.2004
     qryDet.First;
     while not qryDet.Eof do
     begin
        // CAMILLE - 04.05.2004
        // Se beneficio não foi concedido, não gravar logocorrencia
        if qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 4 // pendente de concessao
        then begin
           qryDet.Next;
           continue;
        end;

        // CAMILLE - 30.08.2004
        // Preencher a variavel sDataInicioContrib com a menor data de inicio dos
        // beneficios concedidos
        if sDataInicioContrib = ''
        then sDataInicioContrib := qryDet.FieldByName('DataInicio').AsString
        else if StrToDate(qryDet.FieldByName('DataInicio').AsString) < StrToDate(sDataInicioContrib)
             then sDataInicioContrib := qryDet.FieldByName('DataInicio').AsString;
        // FIM-CAMILLE - 30.08.2004

        try
           CriaLogOcorrencia(qryDet.FieldByName('IdPlanoORIGEM').AsString,
                             qryDet.FieldByName('IdPessJur').AsString,
                             qryDet.FieldByName('IdTitular').AsString,
                             qryDet.FieldByName('IdBeneficio').AsString,
                             qryDet.FieldByName('NumeroProcesso').AsString,
                             qryDet.FieldByName('IdPessoa').AsString,
                             qryDet.FieldByName('SeqProposta').AsString,
                             '7',
                             FormatDateTime('dd/mm/yyyy', date),  //24334
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
                             qryAux, '',
                             iIdLoteConcessao,
                             iIdCalculo,
                             False,
                             qryDet.FieldByName('USUARIOALT').AsInteger,
                             iFlgEmprestimo);
        except
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro no registro da operação.','Erro',mtError,[mbOk],0);
           TiraSQL(qryAux);
           Exit;
        end;

        qryDet.Next;
     end;
     //leocm - 0210202 - fim

     if Trim(sDataInicioContrib) = '' then sDataInicioContrib := sDataEvento;// CAMILLE - 30.08.2004

     // Augusto 12/09/00
     if not GeraContribBenef(QryLoop, QryContribProc, QryAux,
                             StrConcedidos,
                             iNumeroProcesso,
                             iIdLoteConcessao,
                             sAnoMesLoteConcessao,
                             sDataEvento,
                             Copy(sDataInicioContrib,7,4)+'/'+Copy(sDataInicioContrib,4,2), // CAMILLE - 30.08.2004
                             '', // sMotivoAtraso
                             -1, // iIdLoteRevisao
                             '', // psDataEncerramento
                             2 ) // piOrigem = Concessao

     then begin
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Erro no preparo das contribuições do núcleo familiar. Verifique. ','Erro',mtError,[mbOk],0);
        TiraSQL(qryAux);
        Exit;
     end;

     if not ConfirmaBeneficio
     then begin
        dtmBaseDados.dbBaseDados.RollBack;
        TiraSQL(qryAux);
        // Gleyber - 10/08/2004 - Pendência 17230 - Início
        MsgDlg('Todo o processo de concessão do benefício será cancelado.','Atenção',mtInformation,[mbOk],0);
        bbtnCancelarClick(Self);
        // Gleyber - 10/08/2004 - Pendência 17230 - Fim
        Exit;
     end;

    // cguedes - 19/12/2002
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

     dtmBaseDados.dbBaseDados.Commit;
  end  // if state = dsEdit e bConcedeuBeneficio
  else begin
     { Inicio Augusto 22/10/2003 }
     { Busca Contribuicoes associadas ao evento }
     QryBuscaContrib.Close;
     QryBuscaContrib.ParamByName('IDEVENTOGERADOR').AsInteger := iIdEvento;
     QryBuscaContrib.ParamByName('IDPLANOPREV').AsInteger     := iIdPlanoPrev;
     { Fim Augusto 22/10/2003 }

     QryBuscaContrib.Open;
     // Processo o Controle de Nucleos Familiares caso tenha contribuicao associada
     // ao evento
     If (Not QryBuscaContrib.IsEmpty) Then Begin

        If (Not ProcessaNucleoFamiliar(QryDet,QryNucleoFamiliar,QryAux,QryBuscaContrib,
                                       iIdTitular, iIdPessJur,
                                       iIdPlanoPrev,
                                       iIdEvento)) Then Begin

           MsgDlg('Erro ao associar contribuições ao Núcleo Familiar. Processo não Confirmado!','Erro',mtError,[mbOk],0);
           bbtnCancelarClick(Self);
           Exit;
        End;

     End;
     //-*
  end;

  // Camille - Delphi 5 - Tentar utilizar o inherited
  inherited;

{  //  inherited;
  // ***************************************************************************
  // CODIGO COPIADO DO PADRAO, COM EXCECAO DO REPETIR INSERT

     Screen.Cursor := crHourGlass;

     CmeCadastro.BeforeConfirma(Sender,bAtivo);
     if bAtivo then
     begin
//          bInsert := CmeCadastro.RepetirInsert and (CmeCadastro.Operacao = opInserir);
          CmeCadastro.Confirma(Self);
          if qry.IsEmpty then
             CmeCadastro.Operacao := opVazio
          else
              CmeCadastro.Operacao := opIdle;
//          if bInsert then
//             sbtnInserir.Click
//          else
//             AtualizaBotoes;
     end;
     Screen.Cursor := crDefault;

  // ***************************************************************************
}

  if (sTipoFormChamador = 'SI') and (not prmFlgGravaSimulBenef)
  then begin
      // Verificar se existe relatorio parametrizavel para Simulacao de Beneficio

      // Gleyber - Pendência 15983 - 23/01/2004 - Início
      If not dtmBaseDados.dbBaseDados.InTransaction
       Then dtmBaseDados.dbBaseDados.StartTransaction;
      // Gleyber - Pendência 15983 - 23/01/2004 - Fim

      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT MAX(BP.IDRELATBENEFICIO) AS IDRELATBENEFICIO, MAX(BP.ORIGEMCMBENEFICIO) AS ORIGEMCMBENEFICIO '+
                 ' FROM   BENEFPLANPREV BP, BENEFBFCIARIO BF        '+
                 ' WHERE  BF.NUMEROPROCESSO IN ('+sNumeroProcessoAntesGravar+')'+
                 ' AND    BP.IDPLANOPREV = BF.IDPLANOPREV '+
                 ' AND    BP.IDBENEFICIO = BF.IDBENEFICIO ' );
         Open;
         if (FieldByName('IdRelatBeneficio').AsInteger > 0) and
            (MsgDlg('Esta simulação será descartada. Deseja imprimir relatório de simulação ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes)
         then begin
            sbtnImprimirSimulacaoClick(Sender);
         end;
         DesfazRequerimentos(qryAux, sNumeroProcessoAntesGravar);
      end;

      // Gleyber - Pendência 15983 - 23/01/2004 - Início
      If dtmBaseDados.dbBaseDados.InTransaction
       //Then dtmBaseDados.dbBaseDados.Commit;
       Then dtmBaseDados.dbBaseDados.Rollback; // Gleyber - 16/08/2004 - Pendência 17393
      // Gleyber - Pendência 15983 - 23/01/2004 - Fim

  end;

end;



//******************************************************************************
// Augusto 18/09/00
// Gera Contribuicao de Beneficiario
{Function TfrmCadRequerBenefBfciario.GeraContribBenef:Boolean;
Var
  sSQL : String;
  wIdPlano, wIdTitular, wIdBenef, wIdBeneficio,
  wIdNucleofamiliair : Integer;
  PossuiNucleo:Boolean;
Begin
// Seta Resultado
  Result:=True;
// Caso nenhum tenha sido Concedido Sai
  If Trim(StrConcedidos) = '' Then Exit;

// Prepara e Abre  Consulta dos Beneficiarios a serm processados
  QryBenefProc.Close;

  //leorefer - 0801 - inicio

  // CGUEDES - 31/07/2003 - Pend.: 14651/2
  QryBenefProc.sql.text := ' SELECT BF.NUMEROPROCESSO,    BF.IDPESSJUR,       BF.IDPLANOPREV, '+
       'BF.IDTITULAR, '+
       'BF.IDPESSOA,          BF.SEQPROPOSTA,     BF.IDBENEFICIO, '+
       'BF.CODPORTFORMA,      BF.IDSITBENEFICIO,  BF.IDDEPENDENCIA, '+
       'BF.IDTPPAGTOBENEFIC,  BF.VALORATUAL,      BF.DATAREQUERIMENTO, '+
       'BF.DATAINICIO,        BF.DATAFINAL,        '+
       'BF.FLGFORMAPAGTO,     BF.VALORCALCULADO,  BF.DATAULTREAJUSTE, '+
       'BF.VLRCALCINSS,       BF.VLRINFINSS,      BF.DATAINICIOINSS, '+
       'BF.NUMPROCINSS,       BF.DATAINICIOFUND,  BF.VALORCOTAS, '+
       'BF.VALORTOTAL,        BF.DATACONCESSAO,   BF.FLGPROVISORIO, '+
       'BF.PERCPROVISORIO,    BF.PRAZOPROVISORIO, BF.ULTMESREAJUSTE, '+
       'BF.ULTVALORATUALREAJ, BF.IDAGENCIARESGATE,B.NUMORDEMEVENTO, '+
       'B.NOME,               S.DESCRICAO, '+
       'B.FLGRESGATE,         BF.VALORBASE1,   BF.VALORBASE2, '+
       'BF.VALORBASE3,     P.NOME DEPEN,       BTIT.IDRESPONSAVEL '+
       'FROM   BENEFBFCIARIO BF, BENEFICIO B, BENEFPLANPREV BPL, SITBENEFICIO S, '+
       'BENEFPLANOPART BPART, BFCIARIOTITPLAN BTIT, PESSOA P, TPPAGTOBENEFICIO TP '+
       'WHERE  BF.NUMEROPROCESSO = '+IntToStr(NumeroProcesso)+' '+
       'AND    BF.IDPESSOA       = P.IDPESSOA '+
       'AND    B.IDBENEFICIO     = BF.IDBENEFICIO '+
       'AND    BPL.IDBENEFICIO   = BF.IDBENEFICIO '+
       'AND    BPL.IDPLANOPREV   = BF.IDPLANOPREV '+
       'AND    BF.IDSITBENEFICIO = S.IDSITBENEFICIO(+) '+
       'AND    BF.IDTITULAR      = BPART.IDPESSOA(+) '+
       'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+) '+
       'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+) '+
       'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+) '+
       'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+) '+
       // CGUEDES - 10/06/2002: PLANO POR BENEFICIÁRIO.
       'AND    BF.IDPLANOORIGEM  = BTIT.IDPLANOORIGEM '+
       'AND    BF.IDPLANOPREV    = BTIT.IDPLANOPREV '+
       'AND    BF.IDTITULAR      = BTIT.IDTITULAR '+
       'AND    BF.IDPESSJUR      = BTIT.IDPESSJUR '+
       'AND    BF.IDPESSOA       = BTIT.IDPESSOA '+
       'AND    BF.IDBENEFICIO    = BTIT.IDBENEFICIO '+
       'AND    BF.SEQPROPOSTA    = BTIT.SEQPROPOSTA '+
       'AND    BPL.FLGREFERENCIA = 0  '+

       'AND    TP.IDTPPAGTOBENEFIC = B.IDTPPAGTOBENEFIC '+
       'AND    TP.FLGFREQUENCIA <> ''U'' ';

  //QryBenefProc.ParamByName('NUMEROPROCESSO').AsInteger := NumeroProcesso;
  //leorefer - 0801 - fim

  QryBenefProc.Sql.Add('AND BF.IDPESSOA IN ('+Trim(Copy( StrConcedidos,1,
                                             (Length(Trim(StrConcedidos))-1) )+')') );
  QryBenefProc.Sql.Add(' ORDER BY B.NOME ,  P.NOME ');
  QryBenefProc.Open;

  While Not QryBenefProc.Eof Do Begin
// Guarda Dados
    wIdPlano    := QryBenefProc.FieldByName('IDPLANOPREV').AsInteger;
    wIdTitular  := QryBenefProc.FieldByName('IDTITULAR').AsInteger;
    wIdBenef    := QryBenefProc.FieldByName('IDPESSOA').AsInteger;
    wIdBeneficio:= QryBenefProc.FieldByName('IDBENEFICIO').AsInteger;

    //Busca Nucleo Familiar no Arquivo de dependentes
    sSQL := 'SELECT DISTINCT '+
            '  IDNUCLEOFAMILIAR   '+
            'FROM   '+
            '  CM.BFCIARIOTITPLAN '+
            'WHERE  '+
            '  IDPLANOORIGEM = '+IntToStr(wIdPlano)    + ' AND ' +
            '  IDTITULAR   = '+IntToStr(wIdTitular)  + ' AND ' +
            '  IDPESSOA    = '+IntToStr(wIdBenef)    + ' AND ' +
            '  IDBENEFICIO = '+IntToStr(wIdBeneficio)+ ' AND ' +
            '  IDNUCLEOFAMILIAR IS NOT NULL';
    If FazQuery(QryLoop,sSQL) Then Begin
      wIdNucleoFamiliair := Qryloop.FieldByName('IDNUCLEOFAMILIAR').AsInteger;
      If FazQuery(Qryloop,'SELECT '+
                         '  IDCONTRIBUICAO       '+
                         'FROM   '+
                         '  CM.CONTRIBPREVNUCLEO '+
                         'WHERE  '+
                         '  IDNUCLEOFAMILIAR = '+IntToStr(wIdNucleoFamiliair) )
      Then Begin
        While Not Qryloop.Eof Do Begin
          ExecutarQuery(dtmAPrev.qryAux,'UPDATE CM.CONTRIBPREVNUCLEO SET '+
                                '  FLGCOBRA = 1 '+
                                'WHERE          '+
                                '  IDNUCLEOFAMILIAR = '+IntToStr(wIdNucleoFamiliair) +' AND '+
                                '  IDCONTRIBUICAO   = '+Qryloop.FieldByName('IDCONTRIBUICAO').AsString);


          //leofuncef - 22102003 - ativei o código abaixo
          if (Not PreparaContribNucleo(QryBenefProc, QryContribProc ,QryAux,
                              wIdNucleoFamiliair,
                              Qryloop.FieldByName('IDCONTRIBUICAO').AsInteger,
                              QryBenefProc.fieldbyname('NUMEROPROCESSO').AsInteger,
                              QryBenefProc.fieldbyname('IDPESSJUR').AsInteger,
                              QryBenefProc.fieldbyname('IDPLANOPREV').AsInteger,
                              QryBenefProc.fieldbyname('IDTITULAR').AsInteger,
                              QryBenefProc.fieldbyname('IDPESSOA').AsInteger,
                              QryBenefProc.fieldbyname('IDBENEFICIO').AsInteger,
                              iIdLoteConcessao, sAnoMesLoteConcessao, sDataEvento) )then begin

             dtmBaseDados.dbBaseDados.RollBack;
             MsgDlg('Erro ao Conceder os Benefícios do Núcleo Familiar.'+#13+
                    'O benefício será mantido como "Pendente de Concessão"  '+
                    'até que o problema seja resolvido. ','Erro',mtError,[mbOk],0);
            sbtnConcedeUm.Down := False;
            TiraSQL(qryloop);
            Exit;
          end;

          Qryloop.Next;
        End;
      End;

    End;

    QryBenefProc.Next;
  End;
//-*

End;}



//******************************************************************************
// Augusto 13/09/00
// Prepara as Cobtribuicoes dos Nucleos Familiares
{Function TfrmCadRequerBenefBfciario.PreparaContribNucleo(idNucleoFamiliar, idcontribuicao : longint):Boolean;
Var
  wAnoMesRef, wAnoMesCob, wAnoMesInicio, wAnoMesFinal,
  wUltAnoPrep, wUltMesPrep, sSQL  : String;
  wPrimeiroPagamento, bErro : Boolean;
  sValorRegra, sDataRef :String;
  Inteiro:Integer;
  dValorIntegral, dValorAtual, wValorRegra:Double;
Begin
// Inicia Resultado
  Result := False;

// Controle de Primeiro Pagamento
  wPrimeiroPagamento := True;

// Monta Ano Mes de Referencia AAAA/MM
//  wAnoMesRef := Copy(DateToStr(Date),7,4)+'/'+Copy(DateToSTr(Date),4,2);

// Monta Ano Mes de Conbranca = Ano/Mes Atual
  wAnoMesCob := sAnoMesLoteConcessao;

// Busca Dados a Serem Processados
  If FazQuery(QryContribProc,
    'SELECT '+
    '  CPN.IDCONTRIBUICAO, CPN.IDNUCLEOFAMILIAR, CPN.DATAINICIO,      CPN.DATAFINAL,     '+
    '  CPN.ULTMESPREPARO,  CPN.FLGCOBRA,         CTP.IDREGRACALCULO,  CTP.IDPLANOPREV,   '+
    '  CTP.IDRUBRICA,      CTP.IDREGRAPRIMPAGTO, CTP.IDREGRAULTPAGTO, CTP.CODPORTFORMA,  '+
    '  CTP.FLGDESCFOLHA,   CTP.FLGNAOEXIGEREC,   CON.NOME,            NF.IDRESPNUCLEO    '+
    'FROM   '+
    '  CM.CONTRIBPREVNUCLEO CPN, CM.CONTPREV CTP, CM.CONTRIBUICAO CON, CM.NUCLEOFAMILIAR NF '+
    'WHERE  '+
    '  (CPN.IDCONTRIBUICAO   = CTP.IDCONTRIBUICAO)  AND '   +
    '  (CPN.IDCONTRIBUICAO   = CON.IDCONTRIBUICAO)  AND '   +
    '  (CPN.IDNUCLEOFAMILIAR = NF.IDNUCLEOFAMILIAR) AND '   +
    '  (CPN.ULTMESPREPARO <= '+QuotedStr(wAnoMesCob)       +') AND'+
    '  (CPN.IDNUCLEOFAMILIAR = '+IntToStr(idNucleoFamiliar)+')')
  Then Begin

// Guarda ano e mes Inicio
    wUltAnoPrep  := Copy(QryContribProc.FieldByName('DATAINICIO').AsString,7,4);
    wUltMesPrep  := Copy(QryContribProc.FieldByName('DATAINICIO').AsString,4,2);
    wAnoMesInicio:= wUltAnoPrep+'/'+wUltMesPrep;


// Guarda ano e mes final
    wAnoMesFinal := Copy(QryContribProc.FieldByName('DATAFINAL').AsString,7,4)
                    +'/'+
                    Copy(QryContribProc.FieldByName('DATAFINAL').AsString,4,2);
// Guarda ano de Referencia
    wAnoMesRef := wAnoMesInicio;
// Inicia Processo ate o Ano / Mes de Cobancao (Atual)
    While (wAnoMesRef <= wAnoMesCob) Do Begin
(*- Retirado pois esta em desuso  ----------------------------------------------
      // Augusto 24/10/2003 - Pegar somatorio dos beneficios do nucleo no mes
      // de referencia.
      sSQL :=
        'SELECT '+
        '  SUM(HBB.VALORPREV) AS VLBENEFPGTO          '+
        'FROM   '+
        '  CM.BFCIARIOTITPLAN BTP, HSTBENEFBFCIARIO HBB '+
        'WHERE  '+
//        '  BTP.IDPLANOPREV = '+QryDet.FieldByName('IDPLANOPREV').AsString + ' AND ' +
//        '  BTP.IDTITULAR   = '+QryDet.FieldByName('IDTITULAR').AsString   + ' AND ' +
//        '  BTP.IDPESSOA    = '+QryDet.FieldByName('IDPESSOA').AsString    + ' AND ' +
        '  BTP.IDBENEFICIO = '+QryDet.FieldByName('IDBENEFICIO').AsString + ' AND ' +
        '  BTP.IDNUCLEOFAMILIAR = '+IntToStr(idNucleoFamiliar)+ ' AND ' +

        // Augusto 24/10/2003 - passar data de referencia do processo
        '  HBB.MESREFERENCIA = '+QuotedStr(wAnoMesRef)+ ' AND ' +

        // CGUEDES - 10/06/2002: PLANO POR BENEFICIÁRIO
        '  BTP.IDPLANOORIGEM = HBB.IDPLANOORIGEM AND '+
        '  BTP.IDPLANOPREV = HBB.IDPLANOPREV  AND  '+
        '  BTP.IDTITULAR   = HBB.IDTITULAR    AND  '+
        '  BTP.IDPESSOA    = HBB.IDPESSOA     AND  '+
        '  BTP.IDBENEFICIO = HBB.IDBENEFICIO  AND  '+
        '  BTP.SEQPROPOSTA = HBB.SEQPROPOSTA       '+
        '  AND BTP.IDPESSOA IN ('+Trim(Copy( StrConcedidos,1,
                                             (Length(Trim(StrConcedidos))-1) )+')') ;

      FazQuery(dtmAPrev.qryAux,ssQL);
// Monta SQL de Calculo da Regra
      wValorRegra := dtmAPrev.qryAux.FieldByName('VLBENEFPGTO').AsFloat;
------------------------------------------------------------------------------*)

      // Augusto 24/10/2003 - passar data de referencia do processo
      if (StrToInt(copy(QryContribProc.FieldByName('DATAINICIO').AsString,1,2)) >= 29) and
         (StrToInt(copy(wAnoMesRef,6,2)) = 2)
      then sDataRef := '28/'+copy(wAnoMesRef,6,2) + '/' + copy(wAnoMesRef,1,4)
      else sDataRef := copy(QryContribProc.FieldByName('DATAINICIO').AsString,1,2)+ '/' +
                       copy(wAnoMesRef,6,2) + '/' + copy(wAnoMesRef,1,4);

      // Inicio Augusto 25/10/2003
      If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0) Then Begin
        sDataRef := '30'+Copy(sDataRef,3,9)
      End;
      If (Copy(sDataRef,4,2) = '02') And (Copy(sDataRef,1,2) > '28') Then Begin
        sDataRef := '28'+Copy(sDataRef,3,9)
      End;


      wValorRegra := CalcBeneficioDoMovimento( dtmAPrev.qry,
                                               iNumeroProcesso,
                                               iIdPessJur,
                                               iIdPlanoPrev,
                                               iIdTitular,
                                               iIdPessoa,
                                               wAnoMesRef,
                                               iIdLoteConcessao,
                                               'S',
                                               'R'); // Valor Prev - Rateado

      // Augusto 27/10/2003 - Busca valor integral para passar para regra
      dValorIntegral := CalcBeneficioDoMovimento( dtmAPrev.qry,
                                                  iNumeroProcesso,
                                                  iIdPessJur,
                                                  iIdPlanoPrev,
                                                  iIdTitular,
                                                  iIdPessoa,
                                                  wAnoMesRef,
                                                  iIdLoteConcessao,
                                                  'S',
                                                  'I');

      sSQL := 'SELECT '+
                OraNumero(FloatToStr(wValorRegra))          +' AS VLBENEFPGTO,   '+
                OraNumero(FloatToStr(wValorRegra))          +' AS VALORATUAL,    '+
                OraNumero(FloatToStr(dValorIntegral))       +' AS VALORINTEGRAL, '+
                OraNumero(FloatToStr(wValorRegra))          +' AS VALORPROVENTO, '+ // Augusto 27/10/2003 - para funcionar na regra da FOLHA
                QuotedStr(PreparaStrRegra(QryContribProc.FieldByName('DATAINICIO').AsString))   +' AS DATAINICIO,  '+
                QuotedStr(PreparaStrRegra(QryContribProc.FieldByName('DATAFINAL').AsString))    +' AS DATAFINAL,   '+
                QryDet.FieldByName('IDPESSJUR').AsString    +' AS IDPESSJUR,   '+
                QryDet.FieldByName('IDPLANOPREV').AsString  +' AS IDPLANOPREV, '+
                QryDet.FieldByName('IDTITULAR').AsString    +' AS IDTITULAR,   '+
                QryDet.FieldByName('IDPESSOA').AsString     +' AS IDPESSOA,    '+
                QryDet.FieldByName('IDBENEFICIO').AsString  +' AS IDBENEFICIO  '+
                //leofuncef - 28032003 - inicio
                //inclui DATAREF, NUMPROCESSO
                ' ,'''+sDataRef+''' DATAREF '+
                ' ,'''+dtDataEvento.text+''' DATAEVENTO, '+
                ' '+IntToStr(qry.FieldByName('NumeroProcesso').AsInteger)+' NUMEROPROCESSO '+
                //leofuncef - 28032003 - fim
               'FROM DUAL ';
//--------------------------------------------------------------------------------------------------
// Executa Regra de Calculo
      sValorRegra := RegraNumerica(QryContribProc.FieldByName('IDREGRACALCULO').AsString,
                                   sSQL, bErro, Inteiro );
// Converte Retorno da Regra
      Try
        wValorRegra := StrToFloat(ClienteNumero(sValorRegra));
      Except
        MsgDlg('A Regra de Cálculo  Nº '+QryContribProc.FieldByName('IDREGRACALCULO').AsString+' retornou um valor inválido.',
               'Erro',mtError,[mbOk],0);
        Exit;
      End;

//--------------------------------------------------------------------------------------------------
// Executa Regra de Primeiro Pagamento caso seja.
      If (wPrimeiroPagamento = True) And
         (Trim(QryContribProc.FieldByName('IDREGRAPRIMPAGTO').AsString) <> '')
      Then Begin

// Monta SQL de Calculo da Regra
         sSQL := 'SELECT '+
                   OraNumero(FloatToStr(wValorRegra))          +' AS VALORREFERENCIA, '+ // Augusto 27/10/2003 estava sem OraNumero
                   OraNumero(FloatToStr(wValorRegra))          +' AS VLBENEFPGTO,   '+
                   OraNumero(FloatToStr(wValorRegra))          +' AS VALORATUAL,    '+
                   OraNumero(FloatToStr(dValorIntegral))       +' AS VALORINTEGRAL, '+
                   OraNumero(FloatToStr(wValorRegra))          +' AS VALORPROVENTO, '+ // Augusto 27/10/2003 - para funcionar na regra da FOLHA
                   QuotedStr(PreparaStrRegra(QryContribProc.FieldByName('DATAINICIO').AsString)) +' AS DATAINICIO,  '+
                   QuotedStr(PreparaStrRegra(QryContribProc.FieldByName('DATAFINAL').AsString))  +' AS DATAFINAL,   '+
                   QryDet.FieldByName('IDPESSJUR').AsString    +' AS IDPESSJUR,   '+
                   QryDet.FieldByName('IDPLANOPREV').AsString  +' AS IDPLANOPREV, '+
                   QryDet.FieldByName('IDTITULAR').AsString    +' AS IDTITULAR,   '+
                   QryDet.FieldByName('IDPESSOA').AsString     +' AS IDPESSOA,    '+
                   QryDet.FieldByName('IDBENEFICIO').AsString  +' AS IDBENEFICIO  '+
                   //leofuncef - 28032003 - inicio
                   //inclui DATAREF, NUMPROCESSO
                   ' ,'''+dtDataEvento.text+''' DATAREF, '+
                   ' '+IntToStr(qry.FieldByName('NumeroProcesso').AsInteger)+' NUMEROPROCESSO '+
                   //leofuncef - 28032003 - fim
                   'FROM DUAL ';
//--------------------------------------------------------------------------------------------------
// Executa Regra de Primeiro Pagamento
         sValorRegra := RegraNumerica(QryContribProc.FieldByName('IDREGRAPRIMPAGTO').AsString,
                                      sSQL, bErro, Inteiro );
// Converte Retorno da Regra
         Try
           wValorRegra := StrToFloat(ClienteNumero(sValorRegra));
         Except
           MsgDlg('A Regra de Primeiro Pagamento Nº '+QryContribProc.FieldByName('IDREGRAPRIMPAGTO').AsString+' retornou um valor inválido.',
                  'Erro',mtError,[mbOk],0);
           Exit;
         End;

// Altera controle de Primeiro Pagamento
        wPrimeiroPagamento := False;
      End;

//--------------------------------------------------------------------------------------------------
// Executa Regra de Ultimo Pagamento caso seja.
      If (wAnoMesRef = wAnoMesFinal) And
         (Trim(QryContribProc.FieldByName('IDREGRAULTPAGTO').AsString) <> '')
      Then Begin
// Monta SQL de Calculo da Regra
         sSQL := 'SELECT '+
                   OraNumero(FloatToStr(wValorRegra))          +' AS VALORREFERENCIA, '+ // Augusto 27/10/2003 estava sem OraNumero
                   OraNumero(FloatToStr(wValorRegra))          +' AS VLBENEFPGTO,   '+
                   OraNumero(FloatToStr(wValorRegra))          +' AS VALORATUAL,    '+
                   OraNumero(FloatToStr(dValorIntegral))       +' AS VALORINTEGRAL, '+
                   OraNumero(FloatToStr(wValorRegra))          +' AS VALORPROVENTO, '+ //Augusto 27/10/2003 - para funcionar na regra da FOLHA
                   QuotedStr(PreparaStrRegra(QryContribProc.FieldByName('DATAINICIO').AsString))   +' AS DATAINICIO,  '+
                   QuotedStr(PreparaStrRegra(QryContribProc.FieldByName('DATAFINAL').AsString))    +' AS DATAFINAL,   '+
                   QryDet.FieldByName('IDPESSJUR').AsString    +' AS IDPESSJUR,   '+
                   QryDet.FieldByName('IDPLANOPREV').AsString  +' AS IDPLANOPREV, '+
                   QryDet.FieldByName('IDTITULAR').AsString    +' AS IDTITULAR,   '+
                   QryDet.FieldByName('IDPESSOA').AsString     +' AS IDPESSOA,    '+
                   QryDet.FieldByName('IDBENEFICIO').AsString  +' AS IDBENEFICIO  '+
                   //leofuncef - 28032003 - inicio
                   //inclui DATAREF, NUMPROCESSO
                   ' ,'''+dtDataEvento.text+''' DATAREF, '+
                   ' '+IntToStr(qry.FieldByName('NumeroProcesso').AsInteger)+' NUMEROPROCESSO '+
                   //leofuncef - 28032003 - fim
                   'FROM DUAL ';
//--------------------------------------------------------------------------------------------------
// Executa Regra de Ultimo Pagamento
         sValorRegra := RegraNumerica(QryContribProc.FieldByName('IDREGRAPRIMPAGTO').AsString,
                                      sSQL, bErro, Inteiro );
// Converte Retorno da Regra
         Try
           wValorRegra := StrToFloat(ClienteNumero(sValorRegra));
         Except
           MsgDlg('A Regra de Ultimo Pagamento Nº '+QryContribProc.FieldByName('IDREGRAULTPAGTO').AsString+' retornou um valor inválido.',
                  'Erro',mtError,[mbOk],0);
           Exit;
         End;
      End;


      // Insere Registro no Historico de Contribuicao
      If Not InsereHistContrib(QryBenefProc, QryContribProc, QryAux,
                               wAnoMesRef,wAnoMesCob,sValorRegra,
                               iIdLoteConcessao) Then Begin
      // Seta Resultado
        Result := False;
        Exit;
      End;

//--------------------------------------------------------------------------------------------------
// Incrementa e Guarda ano e mes do ultimo preparo
      wUltMesPrep  := IntToStr(StrToInt(wUltMesPrep)+1);
// Acerta Mes
      If StrToInt(wUltMesPrep) < 10  Then wUltMesPrep := '0'+wUltMesPrep;
// Caso Pule o Ano, Acerta Ano
      If StrToInt(wUltMesPrep) >= 12 Then wUltAnoPrep := IntToStr(StrToInt(wUltAnoPrep)+1);
// Remonta Ano Mes
      wAnoMesRef:= wUltAnoPrep+'/'+wUltMesPrep;
    End;
  End;

// Acerta Resultado
  Result := True;
End; }



//******************************************************************************
// Augusto 14/09/00
// Insere regsitro Processado no Historico de Contribuicao
{Function TfrmCadRequerBenefBfciario.InsereHistContrib(AnoMesRef, AnoMesCob,
                                                      sValorFinal:String):Boolean;
Var
  sSQLValues, wAnoMesRef, wAnoMesCob, sFlgIntEvento,
  sSitFundacao, piSitRecebimento, sDescPreparo, sAtrasoDevol,
  sFlgVeioDoEvento : String;
  bErro : Boolean;
  iNumRecebimento, iParcela:Integer;
Begin
//--------------------------------------------------------------------------------------------------
// Desmembra Dados \\

// Monta Ano Mes de Referencia
//  wAnoMesCob := Copy(DateToStr(DataRef),7,4)+'/'+Copy(DateToSTr(DataRef),4,2);
// Monta Ano Mes de Cobranca = Ano/Mes Atual
//  wAnoMesCob := Copy(DateToStr(DataCob),7,4)+'/'+Copy(DateToSTr(DataCob),4,2);
// Gerar numero do recebimento
  iNumRecebimento := LeUltRegistro(dtmAPrev.qry, 'HSTCONTRIBPREV');
  Result := False;
// Só gerar lote de contribuicao caso o idlote esteja < 0
// Caso contrario, usar mesmo lote gerado anteriomente


  if iIdLoteConcessao <= 0 then begin //leofuncef - 28032003 - alterei de < para <=
    sDescPreparo:='Preparo de Contribuição : '+
                  QryContribProc.FieldByName('NOME').AsString;
    sAtrasoDevol:='N';
    iIdLoteConcessao := GeraLOTE(QryBenefProc.FieldbyName('IDPESSJUR').AsInteger,
                        True, // gravar o lote
                        AnoMesRef,
                        'P', sDescPreparo,sAtrasoDevol,
                        '1','0','0','0','0', DateToStr(Date),'','','','');
  end;

// Calcular número da parcela
  iParcela := 0;
  if iParcela < 0 then iParcela := 0;

  sSQLValues := ''''+AnoMesRef+''''; // MESREFERENCIA
  sSQLValues := sSQLValues+','''+AnoMesCob+'''';

  sSQLValues := sSQLValues+',' +IntToStr(iNumRecebimento);

  if (Trim(QryContribProc.FieldByName('CODPORTFORMA').AsString) <> '') and
     (QryContribProc.FieldByName('CODPORTFORMA').AsInteger > 0)
  then
    sSQLValues := sSQLValues+', ' +QryContribProc.FieldByName('CODPORTFORMA').AsString
  else
    sSQLValues := sSQLValues+', NULL ';

  sSQLValues := sSQLValues+', TO_DATE('''+AnoMesCob+''',''YYYY/MM'') ';//DATAPREVISAORECE

  sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);//VALORESPERADO

  sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);//VALORCALCULADO

  sSQLValues := sSQLValues+', '+QryContribProc.FieldByName('IDREGRACALCULO').AsString;  //IDREGRACALCULO

  // Lise - 18/10/2001 - Retirada QuotedStr do campo FLGDESCFOLHA para DB2.
  sSQLValues := sSQLValues+', '+QryContribProc.FieldByName('FLGDESCFOLHA').AsString;

// IdPessoa = Responsavel pelo Nucleo Familiar
  sSQLValues := sSQLValues+', '+QryContribProc.FieldbyName('IDRESPNUCLEO').AsString;

  sSQLValues := sSQLValues+', '+QryBenefProc.FieldbyName('SEQPROPOSTA').AsString;
  sSQLValues := sSQLValues+', '+QryBenefProc.FieldbyName('IDPESSJUR').AsString;
  sSQLValues := sSQLValues+', '+QryBenefProc.FieldbyName('IDPLANOPREV').AsString;

  sSQLValues := sSQLValues+', '+QryContribProc.FieldByName('IDCONTRIBUICAO').AsString;
  sSQLValues := sSQLValues+', 0'; //FLGCALCRESERVA

//  if Trim(QryContribProc.FieldbyName('VALORBASE1').AsString) <> '' // VALORBASE1
//  then sSQLValues := sSQLValues+', '+OraNumero(QryContribProc.FieldbyName('VALORBASE1').AsString)
//  else
  sSQLValues := sSQLValues+', NULL ';

//  if Trim(QryContribProc.FieldbyName('VALORBASE2').AsString) <> '' // VALORBASE2
//  then sSQLValues := sSQLValues+', '+OraNumero(QryContribProc.FieldbyName('VALORBASE2').AsString)
//  else
    sSQLValues := sSQLValues+', NULL ';

//  if Trim(QryContribProc.FieldbyName('VALORBASE3').AsString) <> '' // VALORBASE3
//  then sSQLValues := sSQLValues+', '+OraNumero(QryContribProc.FieldbyName('VALORBASE3').AsString)
//  else
    sSQLValues := sSQLValues+', NULL ';

  if Trim(QryContribProc.FieldbyName('DATAINICIO').AsString) <> ''
  then sSQLValues := sSQLValues+', TO_DATE('''+QryContribProc.FieldByName('DATAINICIO').AsString+''',''DD/MM/YYYY'') '
  else sSQLValues := sSQLValues+', NULL ';

  if Trim(QryContribProc.FieldbyName('DATAFINAL').AsString) <> ''
  then sSQLValues := sSQLValues+', TO_DATE('''+QryContribProc.FieldByName('DATAFINAL').AsString+''',''DD/MM/YYYY'') '
  else sSQLValues := sSQLValues+', NULL ';

  sSitFundacao:= 'AS' ;
  sSQLValues := sSQLValues+', '''+sSitFundacao+'''';       //FLGSITFUNDACAO

  piSitRecebimento:='0';
  if QryContribProc.FieldByName('FLGNAOEXIGEREC').AsString = '1'
  then sSQLValues := sSQLValues+', '+ '2'               //SITRECEBIMENTO
  else sSQLValues := sSQLValues+', '+QuotedStr(piSitRecebimento); //SITRECEBIMENTO

  sSQLValues := sSQLValues+', ''F''';   //TIPO
  sSQLValues := sSQLValues+', '+IntToStr(iIdLoteConcessao); //IDLOTE
  sSQLValues := sSQLValues+', '+IntToStr(iParcela);        //PARCELA

  if QryContribProc.FieldByName('FLGNAOEXIGEREC').AsString = '1'
  then begin
    sSQLValues := sSQLValues+', '+OraNumero(sValorFinal);   //VALORECEBIDO
    sSQLValues := sSQLValues+', TO_DATE(TO_CHAR('''+AnoMesCob+''',''DD/MM/YYYY''),''DD/MM/YYYY'') '; //DATARECEBIMENTO
  end
  else begin
    sSQLValues := sSQLValues+', NULL';   //VALORECEBIDO
    sSQLValues := sSQLValues+', NULL';   //DATARECEBIMENTO
  end;

  if sSitFundacao = 'AS'
  then sSQLValues := sSQLValues +', 1 '
  else sSQLValues := sSQLValues +', 0 ';

  sFlgVeioDoEvento := '';
  if sFlgVeioDoEvento <> ''
  then sSQLValues := sSQLValues +', 1 '
  else sSQLValues := sSQLValues +', 0 ';

  sSQLValues := sSQLValues +', SYSDATE ';

  sFlgIntEvento:='';
  if Trim(sFlgIntEvento) <> ''
  then sSQLValues := sSQLValues + ', '''+sFlgIntEvento+''''
  else sSQLValues := sSQLValues +', NULL ';

// Alimenta Motivo
// Pesquisa para ver se responsavel já possui Contribuicoes
  If FazQuery(QryAux,'SELECT '+
                     '  H.IDPESSOA          '+
                     'FROM   '+
                     '  CM.HSTCONTRIBPREV H '+
                     'WHERE  '+
                     '  H.IDPESSOA       = '+QryContribProc.FieldbyName('IDRESPNUCLEO').AsString    + ' AND ' +
                     '  H.MESREFERENCIA  = '+QuotedStr(AnoMesRef)                                   + ' AND ' +
                     '  H.MESCOBRANCA    = '+QuotedStr(AnoMesCob)                                   + ' AND ' +
                     '  H.IDCONTRIBUICAO = '+QryContribProc.FieldByName('IDCONTRIBUICAO').AsString  + ' AND ' +
                     '  H.SEQPROPOSTA    = '+QryBenefProc.FieldbyName('SEQPROPOSTA').AsString       + ' AND ' +
                     '  H.IDMOTIVO       = '+IntToStr(wIdMotivo)+ '     ')
  Then Begin
// Pede novo Motivo
    FrmEscolheMotivo := TFrmEscolheMotivo.Create(Self);
    FrmEscolheMotivo.wIdMotivo := wIdMotivo;
    FrmEscolheMotivo.ShowModal;
    wIdMotivo := FrmEscolheMotivo.wIdMotivo;
    FrmEscolheMotivo.Free;
  End;

// Monta linha
  sSQLValues := sSQLValues+',' +IntToStr(wIdMotivo);

  If wIdMotivo = -1 Then Exit;

// Inclui Registro no Banco de Dados
  With QryAux Do Begin
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO HSTCONTRIBPREV (MESREFERENCIA,MESCOBRANCA,NUMRECEBIMENTO,    '+
            '                             CODPORTFORMA,DATAPREVISAORECE,               '+
            '                             VALORESPERADO,VALORCALCULADO,IDREGRACALCULO, '+
            '                             FLGDESCFOLHA,IDPESSOA,SEQPROPOSTA,IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
            '                             FLGCALCRESERVA,VALOROP1,VALOROP2,VALOROP3,DATAINICIO,DATAFINAL,         '+
            '                             FLGSITFUNDACAO,SITRECEBIMENTO,TIPO,IDLOTE,PARCELA,                      '+
            '                             VALORRECEBIDO, DATARECEBIMENTO, FLGCONCESSAO, FLGEVENTO,                '+
            '                             DATAEMISSCOB,  FLGINTEVENTO, IDMOTIVO ) '+
            ' VALUES('+sSQLValues+')');
    Try
       Execsql;
       inc(iNumReg);
       rTotalLote := rTotalLote + StrToFloat(ClienteNumero(sValorFinal));
    Except
//       sMsgErro := 'Erro na gravação do Histórico de Contribuições. ';
       Raise;
       bErro := True;
       Result:= False;
       Exit;
    End;
  End;
  Result := True;
End;    }


procedure TfrmCadRequerBenefBfciario.sbtnExcluiDetClick(Sender: TObject);
var qryAuxCalc, qryDelCalc : TQuery;
begin
  // Gleyber - 24/10/2006 - Pendência 23246 - Início
  If (bFlgBenefMorte) And (qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 3)
   Then Begin
      MsgDlg('Este benefício está encerrado e não pode ser excluído.','Aviso',mtInformation,[mbOk],0);
      sbtnExcluiDet.Down := false;
      exit;
   End;
  // Gleyber - 24/10/2006 - Pendência 23246 - Fim

  if qrydet.isempty then
  begin
     sbtnExcluiDet.Down := false;
     exit;
  end;

  if not qryBeneficio.Active
  then begin
     qryBeneficio.Close;
     qryBeneficio.ParamByName('IdEventoGerador').Value := qryEvento.FieldByName('IdEventoGerador').AsInteger;
     qryBeneficio.ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
     qryBeneficio.Open;
  end;

  // O usuario só terá este botao disponivel se o processo estiver
  // pendente ou nao concedido
  // Logo se o processo estiver pendente e o beneficio que o usuario esta
  // tentando excluir for resgate, o sistema devera devolver a reserva
  if ( (qryDet.FieldByName('IdSitBeneficio').AsInteger = 4) or
       (qryDet.FieldByName('IdSitBeneficio').AsInteger = 8) ) and
     (qryDet.FieldByName('FlgResgate').AsInteger = 1)
  then begin
     if not DevolveReserva( qryDet.FieldByName('IdBeneficio').AsInteger,
                            qryDet.FieldByName('IdPessoa').AsInteger)
     then begin
        MsgDlg('Ocorreu um problema no acerto do saldo de reserva deste participante. '+
               'Para sua garantia o processo não será concedido até que o problema seja solucionado. '+
               'Verifique. ','Informação',mtInformation,[mbOk],0);
        TiraSQL(qryAux);
        Exit;
     end;
  end;

  qryBenefAux.Locate('IdBeneficio',qryBeneficio.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive]);
  while (not qryBenefAux.Eof) or
        (qryBenefAux.FieldByName('IdBeneficio').AsInteger = qryBeneficio.FieldByName('IdBeneficio').AsInteger)   do
  begin
     qryBenefAux.Delete;
  end;
  
  QryAuxCalc := Tquery.Create(Self);    //Peixoto  - SERPROS - 10/09/99
  QryAuxCalc.databasename := 'basedados';    //Peixoto  - SERPROS - 10/09/99
  QryAuxCalc.SQL.Add(' Select idcalculo from relbenefpart where numeroprocesso = '+inttostr(iNumeroProcesso)+
                     ' and idpessoa    = '+qryBeneficiario.fieldbyname('idpessoa').asstring+
                     ' and idbeneficio = '+qrybeneficio.fieldbyname('idbeneficio').asString);
  QryAuxCalc.Open;
  QryDelCalc := Tquery.Create(Self);    //Peixoto  - SERPROS - 10/09/99
  QryDelCalc.databasename := 'basedados';

  While not QryAuxCalc.eof do
  begin
     QryDelCalc.sql.Clear;
     QryDelCalc.sql.add(' delete from relbenefpart where idcalculo = '+ QryAuxCalc.fieldbyname('idcalculo').asString+
                        ' and idpessoa = '+qryBeneficiario.fieldbyname('idpessoa').asstring);
     QryDelCalc.ExecSql;

     QryAuxCalc.next;
  end;
  QryDelCalc.Free;
  QryAuxCalc.Free;

  inherited;
//  SelecionaProcesso(-1); // CAMILLE - REFER - 22.05.1999
end;

procedure TfrmCadRequerBenefBfciario.FormShow(Sender: TObject);
begin
  InicializaEP;

  sbtnCadContaCorrente.Enabled := False; // CAMILLE - 05.08.2004
  sbtnDemonsSRB.Enabled        := False; // CAMILLE - 05.08.2004

  sIdBeneficiarioEncerrado     := '';    // Gleyber - 14/11/2006 - Pendência 23246

  // CGUEDES - 04/01/2002:
  if bAbriuOutroForm
  then begin
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
     Exit;
  end;

  sNumerosProcessos := '';

  inherited;

  if sTipoFormChamador = 'EV' // form chamador é um dos eventos
  then begin
     Caption := 'Requerimento de Benefícios para Beneficiário';
     // Verificar se beneficio já foi requerido por este evento
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT P.NUMEROPROCESSO FROM PROCESSOBENEF P, BENEFBFCIARIO B '+
                    ' WHERE P.IDEVENTOGERADOR = '+IntToStr(iIdEvento)+
                    ' AND   P.IDSITPROCESSO   IN (1,4) '+
                    ' AND   P.DTEVENTO = TO_DATE('''+sDataEvento+''',''DD/MM/YYYY'') '+
                    ' AND   B.NUMEROPROCESSO = P.NUMEROPROCESSO '+
                    ' AND   B.IDTITULAR = '+IntToStr(iIdTitular)+
                    ' AND   B.IDPLANOORIGEM = '+IntToStr(iIdPlanoPrev)+
                    ' AND   B.IDPESSJUR  = '+IntToStr(iIdPessJur)+
                    ' AND   B.IDTITULAR <> B.IDPESSOA '); { Augusto 23/01/2007 }
     qryAux.Open;
     if qryAux.IsEmpty
     then begin
        // Gleyber - 24/10/2006 - Pendência 23246 - Início
        qryAux.Close;
        If Not bFlgBenefMorte
          Then sbtnInserirClick(Sender)
          Else VerificaProcessoEncerrado;
        // Gleyber - 24/10/2006 - Pendência 23246 - Fim

        // Preencher dados do evento
        try
           qryEvento.Close;
           qryEvento.ParamByName('IdEventoGerador').AsInteger := iIdEvento;
           qryEvento.Open;

           dblkpcmbEvento.Text  := qryEvento.FieldByName('Nome').AsString;
           dtDataEvento.Date    := StrToDate(sDataEvento);
           dtDataEvento.Enabled := False;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              MsgDlg(' Erro ao tentar localizar o evento gerador. Verifique. ','Informação',mtInformation,[mbOk],0);
           end;
        end;
     end
     else begin
        qryEvento.Close;
        qryEvento.ParamByName('IdEventoGerador').AsInteger := iIdEvento;
        qryEvento.Open;

        dblkpcmbEvento.Text := qryEvento.FieldByName('Nome').AsString;
        dtDataEvento.Date   := StrToDate(sDataEvento);
        iNumeroProcesso     := qryAux.FieldbyName('NumeroProcesso').AsInteger;

        qryAux.Close;

        SelecionaProcesso(iNumeroProcesso);
        sbtnAlterarClick(Sender);
     end;

     // Desabilitar a concessao e a alteracao do tipo de evento
     sbtnConcedeUm.Enabled := False;
     dblkpcmbEvento.Enabled := False;

     // Simular um procurar com os dados passados como parametro
     bQueryTitular       := False;
     bQuerySalarios      := False;
     bQueryContribuicoes := False;
     bPerguntouCancelar := False;

     qryBeneficio.Close;
     qryBeneficio.ParamByName('IdEventoGerador').Value := qryEvento.FieldByName('IdEventoGerador').AsInteger;
     qryBeneficio.ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
     qryBeneficio.Open;

     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
  end
  else begin
     if sTipoFormChamador = 'CO' // form chamador é o menu concessao
     then begin
        Caption := 'Concessão de Benefícios para Beneficiário';
        MontaSelect.Filtro.Add(' ( (B.IDSITBENEFICIO = 4) OR (B.IDSITBENEFICIO = 6) ) ');  { Augusto 21/10/2003 }
        sbtnInserir.Enabled := False;
        lblNomeBenef.Caption := '';
        dblkpcmbEvento.Enabled := True;
     end
     else if sTipoFormChamador = 'SI' // form chamador é o menu simulacao
          then begin
             Caption := 'Simulação de Benefício para Beneficiário';
             MontaSelect.Filtro.Add(' B.IDSITBENEFICIO = 8 ');
             lblNomeBenef.Caption   := '';
             dblkpcmbEvento.Enabled := True;

             { Gleyber - Augusto FUNCEF, pendencia 15153}
             If Not DtmBaseDados.dbBaseDados.InTransaction Then
               DtmBaseDados.dbBaseDados.StartTransaction;
          end
          else begin // form chamador é o menu Manutencao de Requerimento
             Caption := 'Manutenção de Processos de Benefícios para Beneficiário - NÃO CONCEDIDOS'; //leofuncef - 14092004
             MontaSelect.Filtro.Add(' B.IDSITBENEFICIO IN (4,8,6) '); //leofuncef - 14092004
             sbtnInserir.Enabled := False;
             lblNomeBenef.Caption := '';
             dblkpcmbEvento.Enabled := True;
          end;
  end;

  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 25.06.2003
  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 25.06.2003
  wIdMotivo  := prmIdMotivoContrib;
end;

procedure TfrmCadRequerBenefBfciario.bbtnSairClick(Sender: TObject);
begin
 // inherited;
 // CAMILLE - REFER - 26.03.2001
 bbtnCancelar.ModalResult := mrCancel;
 Close;
 //
end;

procedure TfrmCadRequerBenefBfciario.dblkpcmbBeneficioCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var sDataInicio, sDataFinal, sMsgErro,
    sNomeBenefOrdemMenor    : string;

    bExisteBenefOrdemMenor, // CAMILLE - 26.05.1999
    bErro : boolean;

    sProxMat, sDv , sSql : String;

begin
  inherited;

  // Gleyber - 11/08/2004 - Pendência 17366 - Início
  If Modified
   Then Begin
     reValorSRB.Text       := '';
     reValorTotal.Text     := '';
     reValorBeneficio.Text := '';
     bValidaOpcaoBeneficio := False; // Gleyber - 01/08/2005 - Pendência 19060
   End;
  // Gleyber - 11/08/2004 - Pendência 17366 - Fim

  If dblkpcmbBeneficio.Text <> '' Then
    edCodFundacao.Caption := qryBeneficio.FieldByName('CODBENEFICIO').AsString;
  btn_SelecionaBeneficios.Enabled := True;
  bNovoBeneficio                  := True;
  dblkpcmbBeneficiario.enabled    := False;
  dbeMatriculaBenef.Enabled       := False; // Gleyber - 26/01/2004 - Pendência 15925
  iTotRequeridos                  := 0;

  if qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC',qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
  then begin
     dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
     dblkcmbTpPgtoBenef.PerformSearch;
  end
  else dblkcmbTpPgtoBenef.Text := '';


  // Verificar se este benefício já foi requerido para algum beneficiário
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT BF.NUMEROPROCESSO, BF.DATAREQUERIMENTO, BF.IDSITBENEFICIO '+
                 ' FROM   BENEFBFCIARIO BF '+
                 ' WHERE  BF.IDTITULAR    = '+IntToStr(iIdTitular)+
                 ' AND    BF.SEQPROPOSTA  = '+IntToStr(iSeqProposta)+
                 ' AND    BF.IDPESSJUR    = '+IntToStr(iIdPessJur)+
                 ' AND    BF.IDPLANOORIGEM  = '+IntToStr(iIdPlanoPrev)+
                 ' AND    BF.IDBENEFICIO  = '+qryBeneficio.FieldbyName('IdBeneficio').AsString+
                 ' AND    BF.IDSITBENEFICIO = 4 '+
                 ' AND    BF.NUMEROPROCESSO < '+IntToStr(iNumeroProcesso));
  qryAux.Open;
  if not qryAux.IsEmpty
  then begin
     if MsgDlg('Este benefício já foi requerido em '+qryAux.FieldByName('DataRequerimento').AsString+
            ' e está pendente de concessão. '+
            'Verifique o processo nº '+qryAux.FieldByName('NumeroProcesso').AsString+'. Deseja continuar ?',
            'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then begin
        qryAux.Close;
        dblkpcmbBeneficio.Text := '';
        if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then
        dblkpcmbBeneficio.SetFocus;
        Exit;
     end;
  end;


  { Augusto 01/08/2007 - Iniciar Calculo para cada beneficio utilizado }
  iIdCalculo := 0;

  // PEIXOTO - SERPROS - 09.09.1999
  if qryBenefAux.Locate('IdBeneficio',qryBeneficio.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive])
  then begin
        qryaux.SQL.clear;
        qryaux.sql.add('SELECT IDCALCULO FROM RELBENEFPART WHERE NUMEROPROCESSO = '+IntToStr(iNumeroProcesso) +
                       ' AND IDBENEFICIO = '+qryBeneficio.FieldByName('IDBENEFICIO').asstring);
        qryaux.open;
        iIdCalculo  := qryaux.fieldbyname('IDCALCULO').asInteger;
        qryAux.Close;
  end;

  // Verificar se o benefício é de ordem maior que outro nao requerido
  bExisteBenefOrdemMenor := False; // CAMILLE - 26.05.1999
  sNomeBenefOrdemMenor   := '';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT B.IDBENEFICIO, B.NUMORDEMEVENTO, B.NOME, B.IDTPPAGTOBENEFIC '+
                 ' FROM   BENEFICIO B, BENEFPLANPREV BP  '+ // CAMILLE - REFER - 09.06.1999
                 ' WHERE  B.IDEVENTOGERADOR = '+IntToStr(iIdEvento)+
                 ' AND    B.IDBENEFICIO     <> '+qryBeneficio.FieldByName('IdBeneficio').AsString+
                 ' AND    BP.IDPLANOPREV   = '+IntToStr(iIdPlanoPrev)+
                 ' AND    B.IDBENEFICIO    = BP.IDBENEFICIO '+
                 ' AND    BP.FLGREFERENCIA = 0 ');
  qryAux.Open;
  if not qryAux.IsEmpty
  then begin
     qryAux.First;
     while not qryAux.Eof do
     begin
        if (qryAux.FieldByName('NUMORDEMEVENTO').AsInteger <
            qryBeneficio.FieldByName('NUMORDEMEVENTO').AsInteger) and
           (not qryBenefAux.Locate('IdBeneficio',qryAux.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive])) // CAMILLE - REFER - 09.06.1999
        then begin
           bExisteBenefOrdemMenor := True;
           sNomeBenefOrdemMenor   := qryAux.FieldByName('Nome').AsString;
           break;
        end;
        qryAux.Next;
     end;
     if (bExisteBenefOrdemMenor) and
        (MsgDlg('O benefício '+sNomeBenefOrdemMenor+' deveria ser requerido antes do '+
                    qryBeneficio.FieldByName('Nome').AsString+'. Confirma o requerimento ? ',
                    'Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo)
     then begin
        dblkpcmbBeneficio.Text := '';
        dblkpcmbBeneficio.SetFocus;
        Exit;
     end;
     // INICIO - CGUEDES - 25/03/2003
     dtDataFinal.Enabled :=  (qryAux.FieldByname('IDTPPAGTOBENEFIC').AsInteger <> prmIdTpPgBenVital);
     // FIM - CGUEDES - 25/03/2003

  end;

  lblNomeBenef.Caption := dblkpcmbBeneficio.Text;

  { Inicio Augusto 26/11/2002}
  // Preencher qual é o beneficio de referencia
  if Trim(qryBeneficio.FieldByName('IDBENEFREF').AsString) <> '' then begin
    iIdBenefReferencia  := qryBeneficio.FieldByName('IDBENEFREF').AsInteger;
  end else begin
    iIdBenefReferencia  := -1;
  end;

  If qryBeneficio.FieldByName('FLGREFERENCIA').AsString = '1' Then Begin
    grpInfINSS.Visible  := True;
  End Else Begin
    If Trim(qryBeneficio.FieldByName('IDBENEFREF').AsString) <> '' then begin
      grpInfINSS.Visible  := True;
     End Else Begin
      grpInfINSS.Visible  := False;
     End;
     { Augusto 21/08/2003 - obrigando INSS mostra grupo de dados - AGOMES - Pend 11732 }
     If (qryBeneficio.FieldByName('FLGOBRIGANPROC').AsString = '1') Then Begin
      grpInfINSS.Enabled  := True;
      grpInfINSS.Visible  := True;
     End;
  End;
  { Fim Augusto 26/11/2002}


  // Executar regra de calculo de data de inicio e data final
{  if (Trim(qryBeneficio.FieldByName('IdRegraInicio').AsString) <> '') and
     (qryBeneficio.FieldByName('IdRegraInicio').AsInteger >  0)
  then begin
     frmAguarde.Mostra('Regra de Data de Início - Nº '+qryBeneficio.FieldByName('IdRegraInicio').AsString);
     sDataInicio := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraInicio').AsInteger,
                                 iIdPessJur, iIdPlanoPrev, iIdTitular,
                                 iSeqProposta,
                                 iIdTitular,
                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 dtDataEvento.Text,
                                 dtInicioFund.Text,
                                 dtDataInicio.Text,  // Augusto 04/12/2002
                                 dtDataFinal.Text,   // Augusto 04/12/2002
                                 DateToStr(date),
                                 sFlgTpDemissao,
                                 bErro,
                                 sMsgErro);
     frmAguarde.Apaga;
     if bErro
     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
        qryDet.FieldByName('DataInicioFund').AsString := '';
        qryDet.FieldByName('DataInicio').AsString     := '';
        dtDataInicio.Text                             := '';
        dtInicioFund.Text                             := '';
     end
     else begin
        if Trim(sDataInicio) <> ''
        then begin
           qryDet.FieldByName('DataInicioFund').AsString := sDataInicio;
           qryDet.FieldByName('DataInicio').AsString := sDataInicio;
           dtDataInicio.Date := StrToDate(sDataInicio);
           dtInicioFund.Date := StrToDate(sDataInicio);
        end;
     end;
  end //if regrainicio <> ''
  else begin
     qryDet.FieldByName('DataInicio').AsString := dtInicioFund.Text;
     dtDataInicio.Date                         := dtInicioFund.Date;
  end;

  if (Trim(qryBeneficio.FieldByName('IdRegraFim').AsString) <> '') and
     (qryBeneficio.FieldByName('IdRegraFim').AsInteger > 0)
  then begin
     frmAguarde.Mostra('Regra de Data Final - Nº '+qryBeneficio.FieldByName('IdRegraFim').AsString);
     sDataFinal := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraFim').AsInteger,
                                 iIdPessJur, iIdPlanoPrev, iIdTitular,
                                 iSeqProposta,
                                 iIdTitular,
                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 dtDataEvento.Text,
                                 dtInicioFund.Text,
                                 dtDataInicio.Text, // Augusto 04/12/2002
                                 dtDataFinal.Text,  // Augusto 04/12/2002
                                 DateToStr(date),
                                 sFlgTpDemissao,
                                 bErro,
                                 sMsgErro);
     frmAguarde.Apaga;
     if bErro
     then MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0)
     else if Trim(sDataFinal) <> '' then begin
       qrydet.FieldByName('DATAFINAL').AsString := sDataFinal; // Augusto 29/04/2003
       dtDataFinal.Date := StrToDate(sDataFinal);
     end;
  end; // if regrafim <> ''
}

  TiraSQL(qryAux);

  // Verificar se participante já fez opções
  qryAux.Close;
  qryAux.SQL.Clear;

  // CGUEDES - 31/07/2003 - Pend.: 14651/2
  //qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM BENEFPLANOPART ' +
  qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM BENEFBFCIARIO ' +
                 ' WHERE IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND ' +
                 '       IDTITULAR   = ' + IntToStr(iIdTitular)   + ' AND ' +
                 '       IDPESSOA    = ' + IntToStr(iIdPessoa)    + ' AND ' +
                 '       IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
                 '       SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND ' +
                 '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
  qryAux.Open;

  // CGUEDES - 31/07/2003 - Pend.: 14651/2
{  if qryAux.IsEmpty
  then begin
     rOpcao1 := 0;
     rOpcao2 := 0;
     rOpcao3 := 0;
     // Se participante nao fez opcoes, inserir registro na benefplanopart
     // para o caso de alguma regra ter que gravar valores lá
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' INSERT INTO BENEFPLANOPART (IDPESSJUR,IDPLANOPREV,IDPESSOA, SEQPROPOSTA, IDBENEFICIO,VALORBASE1, '+
                    '             VALORBASE2,VALORBASE3) '+
                    ' VALUES ('+ IntToStr(iIdPessJur) + ',' +  IntToStr(iIdPlanoPrev) + ','+
                                 IntToStr(iIdTitular) + ',' +  IntToSTr(iSeqProposta) + ','+
                                 qryBeneficio.FieldByName('IDBENEFICIO').AsString+','+
                                 OraNumero(FormatFloat('#0.00000',rOpcao1))+','+
                                 OraNumero(FormatFloat('#0.00000',rOpcao2))+','+
                                 OraNumero(FormatFloat('#0.00000',rOpcao3))+')');
     try
        qryAux.ExecSQL;
     except
        MsgDlg('Erro na associação do benefício ao titular.','Erro',mtError,[mbOk],0);
        Exit;
     end;
  end
  else }

  // CGUEDES - 31/07/2003 - Pend.: 14651/2
  if qryAux.FieldByName('VALORBASE1').AsString <> ''
  then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
  else rOpcao1 := 0;

  if qryAux.FieldByName('VALORBASE2').AsString <> ''
  then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
  else rOpcao2 := 0;

  if qryAux.FieldByName('VALORBASE3').AsString <> ''
  then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
  else rOpcao3 := 0;

  qryAux.Close;

  {if sTipoFormChamador <> 'SI'
  then reValorTotal.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRgValorTotal').AsString)   <> '')
  else reValorTotal.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRegraSimula').AsString)   <> '');}

  // Gleyber - 24/04/2003 - Inicio
  if sTipoFormChamador = 'SI'
  then reValorTotal.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRegraSimula').AsString)   <> '');

  //reValorBeneficio.ReadOnly := (Trim(qryBeneficio.FieldByName('IdRegraCalculo').AsString)   <> '');
  // Gleyber - 24/04/2003 - Fim

// CGUEDES - 24/07/2003
//  reValorSRB.ReadOnly       := (Trim(qryBeneficio.FieldByName('IdRegraSRB').AsString)   <> '');
//  reValorCalcINSS.ReadOnly  := (Trim(qryBeneficio.FieldByName('IdRegraCalcINSS').AsString) <> '');


  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  then lblValorBenef.Caption := 'Valor (Cotas) '
  else lblValorBenef.Caption := 'Valor (Real)  ';

  if qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC',qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
  then begin
     dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
     dblkcmbTpPgtoBenef.PerformSearch;

     // INICIO - CGUEDES - 25/03/2003
     dtDataFinal.Enabled :=  (qryBeneficio.FieldByname('IDTPPAGTOBENEFIC').AsInteger <> prmIdTpPgBenVital);
     If Not dtDataFinal.Enabled Then
       dtDataFinal.Text := '';
     // FIM - CGUEDES - 25/03/2003

  end
  else dblkcmbTpPgtoBenef.Text := '';

  bbtnOpcoes.Visible := (qryBeneficio.FieldbyName('FlgAceitaOpcao').AsInteger = 1 );

  lblAgencia.Visible      := (qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1 );
  dblkpcmbAgencia.Visible := (qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1 );

  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  then lblValorBenef.Caption := 'Valor (Cotas) '
  else lblValorBenef.Caption := 'Valor (Real)  ';

  if qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1
  then begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';
     // CGUEDES - 16/07/2002
     // pnlBenefProv.Visible := False;
     // Gleyber - 11/11/2002
     // grpInfSupl.Visible := False;
     pnlNaoBenefProv.Visible := False;
     pnlBenefProv.Visible    := True;
  end
  else begin
     grpInfINSS.Caption   := ' Informações do Benefício no INSS ';
     grpInfSupl.Caption   := ' Informações do Benefício na Fundação ';  // CAMILLE - 22.10.2004 - PENDENCIA 17865
     // CGUEDES - 16/07/2002
     // pnlBenefProv.Visible := True;
     // Gleyber - 11/11/2002
     // grpInfSupl.Visible := True;
     pnlNaoBenefProv.Visible := True;
     pnlBenefProv.Visible    := True;
  end;

    // INÍCIO - cguedes - 24/07/2003 - Pend.: 14645
    reValorSRB.ReadOnly       := Not ((qryBeneficio.FieldByName('FLGACTVLRSRB').AsInteger = 1) Or
                                (Not (Trim(qryBeneficio.FieldByName('IdRegraSRB').AsString) <> '')));

    reValorBeneficio.ReadOnly := Not ((qryBeneficio.FieldByName('FLGACTVLRATUAL').AsInteger = 1) Or
                                (Not (Trim(qryBeneficio.FieldByName('IDREGRASIMULA').AsString) <> '')));

    reValorTotal.ReadOnly     := Not ((qryBeneficio.FieldByName('FLGACTVLRTOTBEN').AsInteger = 1) Or
                                (Not (Trim(qryBeneficio.FieldByName('IdRegraSimula').AsString) <> '')));



    // FIM - cguedes - 24/07/2003 - Pend.: 14645


  { Augusto 30/03/2006 }
  If QryDet.State  in [dsInsert, dsEdit] Then Begin
    QryDet.FieldByName('FLGPAGAINSS').AsInteger := QryBeneficio.FieldByName('FLGPAGAINSS').AsInteger;
  End;




end;

procedure TfrmCadRequerBenefBfciario.dblkpcmbBeneficiarioCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var varFields : variant;
    sNumeroProcessoInss : String;
    sDataInicio : string;
    bErro : boolean;
    sMsgErro : string;
    sProxMat, sDataFinal : string;
begin
  inherited;

  // Verificar se este beneficio já foi requerido para este beneficiario
  dblkpcmbBeneficio.PerformSearch;
  varFields := VarArrayCreate([0,1],varVariant);
  varFields[0] := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
  varFields[1] := qryBeneficiario.FieldByName('IdPessoa').AsInteger;
  if qryBenefAux.Locate('IdBeneficio;IdPessoa',varFields,[loCaseInsensitive])
  then begin
     MsgDlg('Este beneficiário já está neste mesmo processo para este benefício. Verifique. ','Erro',mtError,[mbOk],0);
     dblkpcmbBeneficiario.Text := '';
     dblkpcmbBeneficiario.SetFocus;
     Exit;
  end;

  { Inicio Augusto 13/10/2004 - Pesquisar a existencia de um beneficio igual }
  If (JaPossuiBeneficio(iIdPessJur, iIdTitular,
                        QryBeneficiario.FieldByName('IDPESSOA').AsInteger,      { Augusto 04/10/2005 - era iIdTitular, }
                        iIdPlanoPrev,
                        QryBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                        iSeqProposta, True))                                    { Augusto 04/10/2005 - Filtrar beneficios vitalicios }
    And (sTipoFormChamador <> 'SI') // Gleyber - 03/06/2005 - Pendência 18637
  Then Begin
    { Inicio Augusto 04/10/2005 - Sempre cancelar }
    MsgDlg('Este benefício já foi requerido para esta pessoa em outro processo. ',
           'Atenção', mtError, [mbOk],0);
    dblkpcmbBeneficiario.Text := '';
    dblkpcmbBeneficiario.SetFocus;
    Exit;

//     If MsgDlg('Este benefício já foi requerido em outro processo, deseja continuar? ',
//               'Atenção',mtConfirmation,[mbYes, mbNO],0) = mrNo
//     Then Begin
//       dblkpcmbBeneficio.Text := '';
//       dblkpcmbBeneficio.SetFocus;
//       Exit;
//     End;

    { Fim Augusto 04/10/2005 }
  End;
  { Fim Augusto 13/10/2004 }


  PreencheDadosBeneficiario(iNumeroProcesso,iIdTitular, qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                            iIdPessJur, iIdPlanoPrev, iSeqProposta);

  dbeMatriculaBenef.Enabled := True;

  // Verificar se exitem opções de beneficiario
  qryAux.Close;
  qryAux.SQL.Clear;

  // CGUEDES - 31/07/2003 - Pend.: 14651/2
  //qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM BENEFPLANOPART ' +
  qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM BENEFBFCIARIO ' +
                 ' WHERE IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND ' +
                 '       IDTITULAR   = ' + IntToStr(iIdTitular)   + ' AND ' +
                 '       IDPESSOA    = ' + IntToStr(iIdPessoa)    + ' AND ' +
                 '       IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
                 '       SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND ' +
                 '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
  qryAux.Open;

  if qryAux.IsEmpty
  then begin
     rOpcao1 := 0;
     rOpcao2 := 0;
     rOpcao3 := 0;
  end
  else begin
     if qryAux.FieldByName('VALORBASE1').AsString <> ''
     then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
     else rOpcao1 := 0;

     if qryAux.FieldByName('VALORBASE2').AsString <> ''
     then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
     else rOpcao2 := 0;

     if qryAux.FieldByName('VALORBASE3').AsString <> ''
     then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
     else rOpcao3 := 0;
  end;
  qryAux.Close;

  if qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC',qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
  then begin
     dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
     dblkcmbTpPgtoBenef.PerformSearch;
  end
  else dblkcmbTpPgtoBenef.Text := '';

  // Verificar se o beneficio de INSS já foi requerido.
  // Se sim, entao trazer os dados do INSS já preenchidos
  if bNovoBeneficio
  then begin
     sValorTotal       := '0';
     sValorInfInss     := '0';
     sValorCalcInss    := '0';
     sDataInicioPagto  := dtDataInicio.Text;
     iFlgTipoINSS      := 2;
  end;

  if qryBeneficio.FieldByName('FlgReferencia').AsInteger = 0
  then begin
     if (BuscaDadosINSSEmVigor ( qryAux,
                                 iIdPessJur, iIdPlanoPrev, iIdTitular,
                                 qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                 FormatDateTime('dd/mm/yyyy', dtInicioFund.Date), // 24334
                                 sValorCalcINSS, sValorInfINSS, sDataInicioINSS, sNumProcINSS,
                                 sValorBase1INSS, sValorBase2INSS, sValorBase3INSS,
                                 sNumeroProcessoInss, sFlgPagaINSS ) ) and
        (StrToFloat(ClienteNumero(sValorCalcInss)) > 0 )
     then begin
        qryDet.FieldByName('VLRCALCINSS').AsString    := ClienteNumero(sValorCalcINSS);
        qryDet.FieldByName('VLRINFINSS').AsString     := ClienteNumero(sValorInfINSS);
        qryDet.FieldByName('DATAINICIOINSS').AsString := sDataInicioINSS;
        qryDet.FieldByName('NUMPROCINSS').AsString    := sNumProcINSS;
        qryDet.FieldByName('FLGPAGAINSS').AsString    := sFlgPagaINSS;

        reValorCalcInss.Text    := ClienteNumero(sValorCalcINSS);
        reValorInfINSS.Text     := ClienteNumero(sValorInfINSS);
        dtInicioINSS.Date       := StrToDate(sDataInicioINSS);
        dbedNumProcINSS.Text    := sNumProcINSS;
        reValorCalcINSS.Enabled := False;
        dbedNumProcINSS.Enabled := False;

        //leofuncef - inicio - 25/03/2003
        //caso o benef. do INSS seja requerido separadamente, este está com
        //outro NUMPROCESSO, que foi capturado em BuscaDadosINSSEmVigor.
        //caso o INSS já esteja requerido, usar o NUMPROCESSO dele.
        if (trim(sNumeroProcessoInss) <> '') and
           (StrToInt(sNumeroProcessoInss) <>  iNumeroProcesso) then
        begin
           with qryBenefReferencia do
           begin
              Close;
              ParamByName('IdTitular').Value       := iIdTitular;
              ParamByName('SeqProposta').Value     := iSeqProposta;
              ParamByName('IdPessJur').Value       := iIdPessJur;
              ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
              ParamByName('NumeroProcesso').Value  := StrToInt(sNumeroProcessoInss);
              Open;
           end;
        end;
        //leofuncef - fim - 25/03/2003
     end
     else begin
        reValorCalcInss.Text    := '0';
        reValorInfINSS.Text     := '0';
        dbedNumProcINSS.Text    := '';
        reValorCalcINSS.Enabled := True;
        dbedNumProcINSS.Enabled := True;
     end;

     { Augusto 18/10/2007 - Somente persistir o VALOR TOTAL do beneficio caso não seja }
     { beneficio de Resgate, pois nesse caso é necessário recalcular o VALOR TOTAL     }
     { para abater os valores resgatados das suas reservas.                            }
     if ( ( qrybeneficio.fieldbyname('FLGRESGATE').AsInteger    <> 1 ) )
     Then reValorTotal.Text := ClienteNumero(sValorTotal);

  end
  else begin // esta requerendo o proprio beneficio do INSS -> repetir dados do beneficiario anterior
     reValorTotal.Text        := ClienteNumero(sValorTotal);
     reValorCalcInss.Text     := ClienteNumero(sValorCalcInss);
     reValorInfInss.Text      := ClienteNumero(sValorInfInss);
  end;

  // CAMILLE - 15.01.2004
  // Executar regra de calculo de data de inicio e data final
  if (Trim(qryBeneficio.FieldByName('IdRegraInicio').AsString) <> '') and
     (qryBeneficio.FieldByName('IdRegraInicio').AsInteger > 0)
  then begin
     frmAguarde.Mostra('Regra de Data de Início - Nº '+qryBeneficio.FieldByName('IdRegraInicio').AsString);
     
     sDataInicio := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraInicio').AsInteger,
                                 iIdPessJur, iIdPlanoPrev, iIdTitular,
                                 iSeqProposta,
                                 qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),       // 24334
                                 FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),       // 24334
                                 FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),       // 24334
                                 FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),        // 24334
                                 FormatDateTime('dd/mm/yyyy', date),                    // 24334
                                 FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date), // 24334
                                 sFlgTpDemissao,
                                 bErro,
                                 sMsgErro);
     frmAguarde.Apaga;

     if bErro
     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
        qryDet.FieldByName('DataInicio').AsString := '';
        dtDataInicio.Text := '';
     end
     else
     begin
        if Trim(sDataInicio) <> '' then
        begin
          qryDet.FieldByName('DataInicio').AsString := sDataInicio;
          dtDataInicio.Text                         := sDataInicio;
        end;
     end;
  end; //if regrainicio <> ''

  if (Trim(qryBeneficio.FieldByName('IdRegraFim').AsString) <> '') and
     (qryBeneficio.FieldByName('IdRegraFim').AsInteger > 0) then
  begin
     frmAguarde.Mostra('Regra de Data Final - Nº '+qryBeneficio.FieldByName('IdRegraFim').AsString);

     Try
       sDataFinal := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraFim').AsInteger,
                                                   iIdPessJur, iIdPlanoPrev, iIdTitular,
                                                   iSeqProposta,
                                                   qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                                   qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                                   rOpcao1, rOpcao2, rOpcao3,
                                                   FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),       // 24334
                                                   FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),       // 24334
                                                   FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),       // 24334
                                                   FormatDateTime('dd/mm/yyyy', dtDataFinal.Date),        // 24334
                                                   FormatDateTime('dd/mm/yyyy', date),                    // 24334
                                                   FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date), // 24334
                                                   sFlgTpDemissao,
                                                   bErro,
                                                   sMsgErro);
     Except
       frmAguarde.Apaga; //ClaudioR - 22119 - 04/09/2007
     End;

     frmAguarde.Apaga;

     if bErro then
       MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0)
     else
     begin
       qrydet.FieldByName('DATAFINAL').AsString := sDataFinal; // Augusto 29/04/2003

       If sDataFinal <> '' Then                                // Gleyber - 02/09/2003 (REFER)
         dtDataFinal.date := StrToDate(sDataFinal);            // Gleyber - 02/09/2003 (REFER)
     end;
  end; // if regrafim <> ''

  { Inicio Augusto 18/05/2004 - Passei do Beneficio pra cá }

  //leofuncef - 10052004
  //inclui B.FLGPECULIO, B.FLGRESGATE
  if (qrybeneficio.fieldbyname('FLGPECULIO').AsInteger <> 1) and
     (qrybeneficio.fieldbyname('FLGRESGATE').AsInteger <> 1) and
     (qrybeneficio.fieldbyname('FLGREFERENCIA').AsInteger <> 1) and { Augusto 21/05/2004 }
     (qryDet.State in [dsInsert]) and
     (trim(prmMASCMATPENS) <> '')
  then begin
     If qryDepentit.FieldByName('MATRICULA').AsString = '' Then Begin
       sProxMat := GeraMatricula(QryAux, iIdCalculo); { Augusto 07/07/2007 }
       qryDepentit.Edit;
       qryDepentit.FieldByName('MATRICULA').AsString := sProxMat;
     End;
  end;
  //fim - leofuncef - 10052004
  { Fim Augusto 18/05/2004 }


end;

procedure TfrmCadRequerBenefBfciario.qryBeneficiarioAfterOpen( DataSet: TDataSet );
begin
  inherited;
  // CAMILLE - REFER - 10.09.1999
  // Se o parametro do beneficio por plano (flgbenefinf) definir que
  //    é para considerar o no. de beneficiarios elegiveis
  // Entao iNumBenef := qryBeneficiario.RecordCount, pois a qryBeneficiario
  //       está com os elegiveis
  // Senao, abrir uma query auxiliar com todos os beneficiarios do beneficios
  //       iNumBenef := numero total de beneficiarios

  // iNumBenef := qryBeneficiario.RecordCount; { Augusto 06/09/2007 - Não filtrava por beneficio }

  if not qryBeneficio.Active then Exit;

  if // (qryBeneficio.FieldByName('flgBenefInf').AsInteger = 0) and { Augusto 28/09/2007 - Ignorar } 
     (qryBeneficio.FieldByName('IdBeneficio').AsString <> '')
  then begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BFCIARIOTITPLAN BF '+
                   ' WHERE  (BF.IDTITULAR   = '+IntToStr(iIdTitular)  +') '+
                   ' AND    (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)  +') '+
                   ' AND    (BF.IDPLANOORIGEM = '+IntToStr(iIdPlanoPrev)+') '+
                   ' AND    (BF.SEQPROPOSTA = '+IntToStr(iSeqProposta)+') '+
                   ' AND    (BF.IDBENEFICIO = '+qryBeneficio.FieldByName('IdBeneficio').AsString+') ');
    qryAux.Open;
    iNumBenef := qryAux.RecordCount;
  end;
end;

procedure TfrmCadRequerBenefBfciario.btn_SelecionaBeneficiosClick(Sender: TObject);
var sMsgErro: string;
    bConcedeBeneficio,
    bErro : boolean;

    sNumeroProcessoInss : String;

begin
  inherited;
  iIdTitularSel := iIdTitular;
  iIdPessjurSel := iIdPessjur;
  iIdPlanoprevSel := iIdPlanoprev;

  AbrirFormModal(frmSelecionaBeneficiariosdoBeneficio, TfrmSelecionaBeneficiariosdoBeneficio);

  if (not bSaiuSel) and (bAlgumElegivel)
  then begin
     { Augusto 03/02/2004 - Lembrando que a qryBeneficiario é alterada novamente }
     { no formulario fSelecionaBeneficiariosdoBeneficio                          }
     qryBeneficiario.Close;
     qryBeneficiario.ParamByName('IdTitular').AsInteger   := iIdTitular;
     qryBeneficiario.ParamByName('IdPessJur').AsInteger   := iIdPessJur;
     qryBeneficiario.ParamByName('IdPlanoPrev').AsInteger := iIdPlanoPrev;
     qryBeneficiario.ParamByName('IdBeneficio').AsInteger := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
     qryBeneficiario.Open;
     
     while not qryBeneficiario.Eof do
     begin
        // CAMILLE - REFER - 14.05.1999
        // EXECUTAR A REGAR DE BENEFICIARIO PARA CADA BENEFICIARIO
        if (Trim(qryBeneficio.FieldByName('IDREGRABENEFICIA').AsString) = '') or
           (qryBeneficio.FieldByName('IDREGRABENEFICIA').AsInteger <= 0)
        then bConcedeBeneficio := True
        else begin
           frmAguarde.Mostra('Regra de Elegibilidade do Beneficiário  - Nº '+
                              qryBeneficio.FieldByName('IDREGRABENEFICIA').AsString);

           Try
             bConcedeBeneficio := ExecutaRegraElegibilidadeBfciario(qryAux,
                                       qryBeneficio.FieldByName('IDREGRABENEFICIA').AsInteger,
                                       iIdPessJur, iIdPlanoPrev, iIdTitular,
                                       qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                       iSeqProposta,
                                       qryBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                                       rOpcao1, rOpcao2, rOpcao3,
                                       FormatDateTime('dd/mm/yyyy', dtDataEvento.Date), // 24334
                                       FormatDateTime('dd/mm/yyyy', dtInicioFund.Date), // 24334
                                       sDataDemissao,
                                       bErro,
                                       sMsgErro, 1);
           Except
             frmAguarde.Apaga; //ClaudioR - 22119 - 04/09/2007
           End;

           frmAguarde.Apaga;

           if bErro then
           begin
             MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
             Exit;
           end
           else
           begin
             if not bConcedeBeneficio then
             begin
               MsgDlg('A Regra de Elegibilidade do Beneficiário - Nº '+
                      qryBeneficio.FieldByName('IDREGRABENEFICIA').AsString+
                      ' NÃO foi satisteita para '+
                      qryBeneficiario.FieldByName('Nome').AsString+
                      '. Verifique. ','Informação',mtInformation,[mbOk],0);
               Exit;
             end;
           end;
         end;
         qryBeneficiario.Next;
     end;

     // Habilitar os componentes
     btn_SelecionaBeneficios.enabled := true;
     dtDataRequerimento.Enabled      := true;
     dblkpcmbBeneficiario.enabled    := true;
     dbeMatriculaBenef.Enabled       := True; // Gleyber - 26/01/2004 - Pendência 2004
     dbedNumProcINSS.enabled         := true;
     dtInicioINSS.enabled            := true;
     // INICIO - cguedes  - 28/03/2003
     dtInicioFund.enabled            := bPagaRetroativo;
     dtDataInicio.enabled            := bPagaRetroativo;
     // FIM - cguedes  - 28/03/2003
     reValorCalcInss.enabled         := true;
     reValorInfINSS.enabled          := true;
     reValorBeneficio.enabled        := true;
     reValorSRB.Enabled              := True;
     reValorTotal.enabled            := true;
     dtDataFinal.enabled             := true;
     dblkcmbTpPgtoBenef.enabled      := true;
     dblkpcmbPortForma.enabled       := true;

     if (dtDataRequerimento.enabled) and (dtDataRequerimento.visible)
     then dtDataRequerimento.SetFocus;

     if qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC',qryBeneficio.FieldbyName('IDTPPAGTOBENEFIC').AsInteger, [loCaseInsensitive])
     then begin
        dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString;
        dblkcmbTpPgtoBenef.PerformSearch;
     end
     else dblkcmbTpPgtoBenef.Text := '';

     sNumProcINSS    := '';
     sValorCalcINSS  := '0';
     sValorInfINSS   := '0';
     sDataInicioINSS := '';
     sValorBase1INSS := '0';
     sValorBase2INSS := '0';
     sValorBase3INSS := '0';

     // CAMILLE - FUNCEF - 27.03.2001
     // Verificar se o beneficio de INSS já foi requerido.
     // Se sim, entao trazer os dados do INSS já preenchidos
     if qryBeneficio.FieldbyName('FlgReferencia').AsInteger = 0
     then begin
        if (BuscaDadosINSSEmVigor ( qryAux,
                                    iIdPessJur, iIdPlanoPrev, iIdTitular,
                                    qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                                    qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                    FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),  // 24334
                                    sValorCalcINSS, sValorInfINSS, sDataInicioINSS,sNumProcINSS,
                                    sValorBase1INSS, sValorBase2INSS, sValorBase3INSS,
                                    sNumeroProcessoInss, sFlgPagaINSS )) and
           (StrToFloat(ClienteNumero(sValorCalcInss)) > 0 )
        then begin
           qryDet.FieldByName('VLRCALCINSS').AsString    := ClienteNumero(sValorCalcINSS);
           qryDet.FieldByName('VLRINFINSS').AsString     := ClienteNumero(sValorInfINSS);
           qryDet.FieldByName('DATAINICIOINSS').AsString := sDataInicioINSS;
           qryDet.FieldByName('NUMPROCINSS').AsString    := sNumProcINSS;
           qryDet.FieldByName('FLGPAGAINSS').AsString    := sFlgPagaINSS;


           reValorCalcInss.Text    := ClienteNumero(sValorCalcINSS);
           reValorInfINSS.Text     := ClienteNumero(sValorInfINSS);
           dtInicioINSS.Date       := StrToDate(sDataInicioINSS);
           dbedNumProcINSS.Text    := sNumProcINSS;
           reValorCalcINSS.Enabled := False;
           dbedNumProcINSS.Enabled := False;

           //leofuncef - inicio - 25/03/2003
           //caso o benef. do INSS seja requerido separadamente, este está com
           //outro NUMPROCESSO, que foi capturado em BuscaDadosINSSEmVigor.
           //caso o INSS já esteja requerido, usar o NUMPROCESSO dele.
           if (trim(sNumeroProcessoInss) <> '') and
              (StrToInt(sNumeroProcessoInss) <>  iNumeroProcesso) then
           begin
              with qryBenefReferencia do
              begin
                 Close;
                 ParamByName('IdTitular').Value       := iIdTitular;
                 ParamByName('SeqProposta').Value     := iSeqProposta;
                 ParamByName('IdPessJur').Value       := iIdPessJur;
                 ParamByName('IdPlanoPrev').Value     := iIdPlanoPrev;
                 ParamByName('NumeroProcesso').Value  := StrToInt(sNumeroProcessoInss);
                 Open;
              end;
           end;
           //leofuncef - fim - 25/03/2003

        end
        else begin
           reValorCalcInss.Text    := '0';
           reValorInfINSS.Text     := '0';
           dbedNumProcINSS.Text    := '';

           reValorCalcINSS.Enabled := True;
           dbedNumProcINSS.Enabled := True;
        end;
     end;
  end
  else if not bAlgumElegivel
       then MsgDlg('Nenhum beneficiário foi aprovado pela regra de elegibilidade.','Informação',mtInformation,[mbOk],0);

end;

procedure TfrmCadRequerBenefBfciario.dblkpcmbBeneficioExit(
  Sender: TObject);
var sDataInicio, sDataFinal, sMsgErro : string;
    bErro : boolean;
begin
  inherited;

  btn_SelecionaBeneficios.Enabled := True;

  // Verificar se este benefício já foi requerido para algum beneficiário
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT BF.NUMEROPROCESSO, BF.DATAREQUERIMENTO, BF.IDSITBENEFICIO '+
                 ' FROM   BENEFBFCIARIO BF '+
                 ' WHERE  BF.IDTITULAR    = '+IntToStr(iIdTitular)+
                 ' AND    BF.SEQPROPOSTA  = '+IntToStr(iSeqProposta)+
                 ' AND    BF.IDPESSJUR    = '+IntToStr(iIdPessJur)+
                 ' AND    BF.IDPLANOORIGEM  = '+IntToStr(iIdPlanoPrev)+
                 ' AND    BF.IDBENEFICIO  = '+qryBeneficio.FieldbyName('IdBeneficio').AsString+
                 ' AND    BF.IDSITBENEFICIO = 4 '+
                 ' AND    BF.NUMEROPROCESSO < '+IntToStr(iNumeroProcesso));
  qryAux.Open;
  if not qryAux.IsEmpty
  then begin
     if MsgDlg('Este benefício já foi requerido em '+qryAux.FieldByName('DataRequerimento').AsString+
            ' e está pendente de concessão. '+
            'Verifique o processo nº '+qryAux.FieldByName('NumeroProcesso').AsString+'. Deseja continuar ?',
            'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then begin
        qryAux.Close;
        dblkpcmbBeneficio.Text := '';
        if (dblkpcmbBeneficio.enabled) and (dblkpcmbBeneficio.visible) then
        dblkpcmbBeneficio.SetFocus;
        Exit;
     end;
  end;

  { Augusto 14/05/2004 - Atualizar Fonte Pagamento - SUPLEMENTAÇÃO  1 - INSS 2 }
  If (qryDet.Active) And (qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 0) Then
    qryDet.FieldByName('FONTEPAGADORA').AsInteger      := 1
  Else
    qryDet.FieldByName('FONTEPAGADORA').AsInteger      := 2;


//  lblNomeBenef.Caption := qryBeneficio.FieldByName('Nome').AsString;]
  lblNomeBenef.Caption := dblkpcmbBeneficio.Text;

  // Preencher qual é o beneficio de referencia
  if Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> ''
  then iIdBenefReferencia  := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
  else iIdBenefReferencia  := -1;

{  // Executar regra de calculo de data de inicio e data final
  if (Trim(qryBeneficio.FieldByName('IdRegraInicio').AsString) = '') or
     (qryBeneficio.FieldByName('IdRegraInicio').AsInteger <= 0)
  then begin
     frmAguarde.Mostra('Regra de Data de Início - Nº '+qryBeneficio.FieldByName('IdRegraInicio').AsString);
     sDataInicio := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraInicio').AsInteger,
                                 iIdPessJur, iIdPlanoPrev, iIdTitular,
                                 iSeqProposta,
                                 iIdTitular,
                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 dtDataEvento.Text,
                                 dtInicioFund.Text,
                                 dtDataInicio.Text, //  Augusto 04/12/2002
                                 dtDataFinal.Text,  //  Augusto 04/12/2002
                                 DateToStr(date),
                                 sFlgTpDemissao,
                                 bErro,
                                 sMsgErro);
     frmAguarde.Apaga;
     if bErro
     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
        qryDet.FieldByName('DataInicio').AsString := '';
        dtDataInicio.Text := '';
     end
     else begin
        if Trim(sDataInicio) <> ''
        then begin
           qryDet.FieldByName('DataInicio').AsString := sDataInicio;
           dtDataInicio.Text                         := sDataInicio;
        end;
     end;
  end; //if regrainicio <> ''

  if (Trim(qryBeneficio.FieldByName('IdRegraFim').AsString) <> '') and
     (qryBeneficio.FieldByName('IdRegraFim').AsInteger > 0)
  then begin
     frmAguarde.Mostra('Regra de Data Final - Nº '+qryBeneficio.FieldByName('IdRegraFim').AsString);
     sDataFinal := ExecutaRegraDataPgtoBeneficio(qryBeneficio.FieldByName('IdRegraFim').AsInteger,
                                 iIdPessJur, iIdPlanoPrev, iIdTitular,
                                 iSeqProposta,
                                 iIdTitular,
                                 qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 dtDataEvento.Text,
                                 dtInicioFund.Text,
                                 dtDataInicio.Text, // Augusto 04/12/2002
                                 dtDataFinal.Text,  // Augusto 04/12/2002
                                 DateToStr(date),
                                 sFlgTpDemissao,
                                 bErro,
                                 sMsgErro);
     frmAguarde.Apaga;
     if bErro
     then MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0) else begin
       qrydet.FieldByName('DATAFINAL').AsString := sDataFinal; // Augusto 29/04/2003
       dtDataFinal.date := StrToDate(sDataFinal);
     end;
  end; // if regrafim <> ''
}
  TiraSQL(qryAux);
end;

procedure TfrmCadRequerBenefBfciario.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  lblNomeBenef.caption := 'Benefícios';
end;

procedure TfrmCadRequerBenefBfciario.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  lblNomeBenef.caption := 'Benefícios';
end;

procedure TfrmCadRequerBenefBfciario.sbtnAltDetClick(Sender: TObject);
var iItem : Integer;
begin
  // Gleyber - 24/10/2006 - Pendência 23246 - Início
  If (bFlgBenefMorte) And (qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 3)
   Then Begin
      MsgDlg('Este benefício está encerrado e não pode ser alterado.','Aviso',mtInformation,[mbOk],0);
      sbtnAltDet.Down := false;
      exit;
   End;
  // Gleyber - 24/10/2006 - Pendência 23246 - Fim

  if qryDet.IsEmpty then
  begin
     sbtnAltDet.Down := false;
     exit;
  end;

  inherited;

  // rosana - refer - 03/08/99
  if (not qryDet.Active) or (not qryEvento.Active) then Exit;


  PreencheDadosBeneficiario(qryDet.FieldByName('numeroprocesso').AsInteger,
                            qryDet.FieldByName('idtitular').AsInteger,
                            qryDet.FieldByName('idpessoa').AsInteger,
                            qryDet.FieldByName('idpessjur').AsInteger,
                            qryDet.FieldByName('idplanoprev').AsInteger,
                            qryDet.FieldByName('seqproposta').AsInteger);

  if qryDet.State = dsEdit
  then begin
     if qryRelBenefPart.Locate('IdBeneficio',qryBeneficio.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive])
     then iIdCalculo := qryRelBenefPart.FieldByName('IDCALCULO').AsInteger;
  
{     // Preenche lista com o idcalculo, gerado na inclusao
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDCALCULO FROM RELBENEFPART '+
                    ' WHERE  IDPLANOPREV    = '+qryDet.FieldByName('idplanoprev').AsString+
                    ' AND    IDPESSJUR      = '+qryDet.FieldByName('idpessjur').AsString  +
                    ' AND    IDTITULAR      = '+qryDet.FieldByName('idtitular').AsString  +
                    ' AND    NUMEROPROCESSO = '+qryDet.FieldByName('numeroprocesso').AsString +
                    ' AND    IDPESSOA       = '+qryDet.FieldByName('idpessoa').AsString  +
                    ' AND    IDBENEFICIO    = '+qryDet.FieldByName('idbeneficio').AsString);
     qryAux.Open;
     if not qryAux.IsEmpty
     then iIdCalculo := qryAux.FieldByName('IDCALCULO').AsInteger;
}
  end;
end;

procedure TfrmCadRequerBenefBfciario.sbtnInserirClick(Sender: TObject);
begin
  if qry.State = dsinsert then exit;
  inherited;
end;

procedure TfrmCadRequerBenefBfciario.qryDetBeforeInsert(DataSet: TDataSet);
begin
  inherited;
{  dblkpcmbBeneficiario.text := '';
  sIdDepen := '';
  if (not qrydet.isempty)  then
  begin
     qrydet.first;
     while not qrydet.eof do
     begin
        if (qrydet.fieldbyname('Idbeneficio').AsString = qryBeneficio.FieldByName('IdBeneficio').AsString)
        then begin
           if sIdDepen = ''
           then sIdDepen := qrydet.fieldbyname('IdPessoa').AsString
           else sIdDepen := sIdDepen+','+qrydet.fieldbyname('IdPessoa').AsString;
        end;
        qrydet.next;
     end;
  end;
}  
end;

// CAMILLE - REFER - 14.05.1999
function TfrmCadRequerBenefBfciario.ConverteBeneficioParaCotas(prValorReal : real) : real;
begin
  Result := 0;
  // Verificar e beneficio é em real ou em cotas
  if (qryBeneficio.FieldByName('FLGCALCTODOMES').AsInteger = 1)
  then begin
     frmAguarde.Mostra('Convertendo benefício em cotas ...');

     if qryBeneficio.FieldbyName('IndiceReajBenef').AsString = '' then
     begin
       frmAguarde.Apaga;
       MsgDlg('O índice de conversão do valor do benefício não está cadastrado. '+
              'Verifique no Cadastro de Plano Previdenciário.',
              'Informação',mtInformation,[mbOk],0);
       Result := 0;
       Exit;
     end;

     // O beneficio é em cotas -> converter pelo indice
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT COTVALOR, COTDATA '+
                    ' FROM   COTACAOMOEDA      '+
                    ' WHERE  (MOECODIGO = '+qryBeneficio.FieldbyName('IndiceReajBenef').AsString+')'+
                    ' AND    (COTDATA <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtInicioFund.Date) + ''', ''DD/MM/YYYY'') ) ' +  // 24334
                    ' ORDER BY COTDATA DESC ');
     qryAux.Open;

     if qryAux.IsEmpty then
     begin
       frmAguarde.Apaga;
       qryAux.Close;
       MsgDlg('O índice de conversão do valor do benefício não está cadastrado. '+
              'Verifique no Cadastro de Cotações da Moeda.',
              'Informação',mtInformation,[mbOk],0);
       Result := 0;
       Exit;
     end;

     qryAux.First;
     rValorDaCotaBenef := qryAux.FieldByName('CotValor').AsFloat;
     sDataDaCotaBenef  := FormatDateTime('dd/mm/yyyy', qryAux.FieldByName('CotData').AsDateTime); //24334

     // Converter de cota para real
     if rValorDaCotaBenef = 0 then
     begin
       MsgDlg('O índice de conversão do valor do benefício está zerado. '+
              'Verifique no Cadastro de Cotações da Moeda.',
              'Informação',mtInformation,[mbOk],0);
       Result := 0;
     end
     else
       Result  := prValorReal / rValorDaCotaBenef;
  end
  else
    Result := 0;
    
  frmAguarde.Apaga;
end; // ConverteBeneficioParaCotas

// CAMILLE - REFER - 14.05.1999
function TfrmCadRequerBenefBfciario.ConverteBeneficioParaReal(prValorCotas : real) : real;
begin
  Result := 0;
  // Verificar e beneficio é em real ou em cotas
  if (qryBeneficio.FieldByName('FLGCALCTODOMES').AsInteger = 1)
  then begin
     frmAguarde.Mostra('Convertendo benefício para Real  ...');

     if qryBeneficio.FieldbyName('IndiceReajBenef').AsString = '' then
     begin
       frmAguarde.Apaga;

       MsgDlg('O índice de conversão do valor do benefício não está cadastrado. '+
              'Verifique no Cadastro de Plano Previdenciário.',
              'Informação',mtInformation,[mbOk],0);
       Result := 0;
       Exit;
     end;

     // O beneficio é em cotas -> converter pelo indice
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT COTVALOR, COTDATA '+
                    ' FROM   COTACAOMOEDA      '+
                    ' WHERE  (MOECODIGO = '+qryBeneficio.FieldbyName('IndiceReajBenef').AsString+')'+
                    ' AND    (COTDATA <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtInicioFund.Date) + ''', ''DD/MM/YYYY'') ) ' + // 24334
                    ' ORDER BY COTDATA DESC ');
     qryAux.Open;

     if qryAux.IsEmpty then
     begin
       frmAguarde.Apaga;

       qryAux.Close;
       MsgDlg('O índice de conversão do valor do benefício não está cadastrado. '+
              'Verifique no Cadastro de Cotações da Moeda.',
              'Informação',mtInformation,[mbOk],0);
       Result := 0;
       Exit;
     end;

     qryAux.First;
     rValorDaCotaBenef := qryAux.FieldByName('CotValor').AsFloat;
     sDataDaCotaBenef  := FormatDateTime('dd/mm/yyyy', qryAux.FieldByName('CotData').AsDateTime); // 24334

     // Converter de cota para real
     if rValorDaCotaBenef = 0 then
     begin
       MsgDlg('O índice de conversão do valor do benefício está zerado. '+
              'Verifique no Cadastro de Cotações da Moeda.',
              'Informação',mtInformation,[mbOk],0);
       Result := 0;
     end
     else
       Result  := prValorCotas * rValorDaCotaBenef;
  end
  else
    Result := 0;

  frmAguarde.Apaga;
end; // ConverteBeneficioParaReal

procedure TfrmCadRequerBenefBfciario.reValorBeneficioMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  // CAMILLE - REFER - 14.05.1999
  if Trim(dblkpcmbBeneficio.Text) = '' then Exit;

  // Se o beneficio estiver em branco, mostrar hint dizendo para digitar ou calcular
  if (Trim(reValorBeneficio.Text) = '') or (Trim(reValorBeneficio.Text) = '0')
  then begin
     if (Trim(qryBeneficio.FieldByName('IdRegraCalculo').AsString) = '')
     then if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
          then reValorBeneficio.Hint := 'Digite o valor do benefício e Clique no botão à direita caso deseje convertê-lo em Cotas. '
          else reValorBeneficio.Hint := 'Digite o valor do benefício. '
     else reValorBeneficio.Hint := 'Clique no botão à direita para calcular o valor do benefício. ';
     Exit;
  end;

  // Se beneficio estiver em cotas, mostrar no hint o valor em real
  // se estiver em real, mostrar no hint o valor em cotas
  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1
  then reValorBeneficio.Hint := 'Valor em Real = '+FloatToStr(rValorReal)+
                                '. Cota Utilizada = '+ FormatFloat('#0.000000',rValorDaCotaBenef)+
                                ' em '+sDataDaCotaBenef+'.'
  else reValorBeneficio.Hint := 'Clique no botão à direita para calcular o valor do benefício. ';

end;

procedure TfrmCadRequerBenefBfciario.reValorBeneficioExit(Sender: TObject);
begin
  inherited;
  if (Trim(reValorBeneficio.Text) <> '') and (Trim(reValorBeneficio.Text) <> '0')
  then rValorReal  := StrToFloat(ClienteNumero(reValorBeneficio.Text))
  else rValorReal  := 0;
  bRecalculouProvisorio := True;  // Gleyber - 25/04/2003
end;

procedure TfrmCadRequerBenefBfciario.FormActivate(Sender: TObject);
begin
  if bAbriuOutroForm  // CAMILLE - REFER - 26.05.1999
  then begin
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
     PreencheDadosBeneficiario(iNumeroProcesso,iIdTitular,
                               qryBeneficiario.FieldByName('IdPessoa').AsInteger,
                               iIdPessJur, iIdPlanoPrev, iSeqProposta);
     Exit;
  end;
  inherited;
end;

procedure TfrmCadRequerBenefBfciario.reValorTotalBtnClick(Sender: TObject);
var rValorBeneficio,
    rValorReserva    : double;
    bErro            : boolean;
    sSQLBenefAssoc,
    sMsgErro         : string;
    iIdRegraCalculo  : longint;
begin
  inherited;

  frmAguarde.Apaga;
  { Augusto 15/04/2003 }
  if not VerificaCamposObrigREGRA then Exit;

  // Calcular valor total do beneficio
  if Trim(dblkpcmbBeneficio.Text) = '' then
  begin
    MsgDlg('Preencha o Benefício.','Erro',mtError,[mbOk],0);

    If (dblkpcmbBeneficio.enabled) And
       (dblkpcmbBeneficio.visible) Then
      dblkpcmbBeneficio.SetFocus;

    Exit;
  end;

  if (Trim(qryBeneficio.FieldByName('IdRgValorTotal').AsString) = '') or
     (qryBeneficio.FieldByName('IdRgValorTotal').AsInteger <= 0)      then
    Exit;

  // Executar o exit do calculo do inss para garantir que o valor informado do inss
  // foi preenchido antes de calcular o valor da suplementacao
  try
    reValorCalcInssExit(Sender);
  except end;

  if sTipoFormChamador = 'SI' then
    if qryBeneficio.FieldByName('IdRegraSimula').AsInteger <= 0 then
      Exit
    else
      iIdRegraCalculo := qryBeneficio.FieldByName('IdRegraSimula').AsInteger
  else
    iIdRegraCalculo := qryBeneficio.FieldByName('IdRgValorTotal').AsInteger;

  frmAguarde.Mostra('Regra de Cálculo do Total - Nº '+IntToStr(iIdRegraCalculo));

  //leofuncef - 28102003 - inicio
  //limpa operações feitas na reserva para este benefício
  //retira erro de vários cálculos simultâneos
  if qryDet.FieldByName('FlgResgate').AsString = '1' then
  begin
    if not DevolveReserva( qryDet.FieldByName('IdBeneficio').AsInteger,
                           qryDet.FieldByName('IdPessoa').AsInteger) then
    begin
      MsgDlg('Ocorreu um problema no acerto do saldo de reserva deste participante. '+
             'Para sua garantia o processo não será excluído até que o problema seja solucionado. '+
             'Verifique. ','Informação',mtInformation,[mbOk],0);
      TiraSQL(qryAux);
      frmAguarde.Apaga;
      Exit;
    end;
  end;
  //leofuncef - 18102003

  // Executar regra de calculo da reserva para beneficio passando a query ReservaPart
  // que está com o valor abatido da reserva
  rValorReserva  := CalculaReservaParaBeneficio;
  sValorReserva  := FloatToStr(rValorReserva);
  sSQLBenefAssoc := MontaSQLBenefAssoc(qryBenefAux, qryBeneficio.FieldByName('NumOrdemEvento').AsInteger); 

  // Executar regra de calculo do beneficio
  try
    rValorBeneficio := ExecutaRegraValorTotal(qryAux,
                                              iIdRegraCalculo,
                                              iIdPessJur, iIdPlanoPrev, iIdTitular,
                                              iSeqProposta,
                                              iNumeroProcesso,
                                              qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                              iNumBenef,
                                              rOpcao1, rOpcao2, rOpcao3,
                                              sSQLBenefAssoc,
                                              FormatDateTime('dd/mm/yyyy', dtDataEvento.Date), // 24334
                                              FormatDateTime('dd/mm/yyyy', dtDataEvento.Date), // 24334
                                              FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date), // 24334
                                              reValorCalcInss.Text,
                                              reValorInfINSS.Text,
                                              FormatDateTime('dd/mm/yyyy', dtDataInicio.Date), // 24334
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
                                              -1,
                                              -1,
                                              qryDet.FieldByName('FLGPROVISORIO').AsInteger,   // CAMILLE - 19.04.2004
                                              qryDet.FieldByName('PRAZOPROVISORIO').AsInteger, // CAMILLE - 19.04.2004
                                              qryDet.FieldByName('PERCPROVISORIO').AsFloat,    // CAMILLE - 19.04.2004
                                              FormatDateTime('dd/mm/yyyy', qryDet.FieldByName('DATAREQUERIMENTO').AsDateTime)  // 24334
                                             );
  except
     frmAguarde.Apaga;
  end;

  frmAguarde.Apaga;

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    reValorTotal.Text := '0';
    Exit;
  end;

  // CBS - 04.02.2002
  // So formatar se o valor nao for em cota
  if qryBeneficio.FieldbyName('FlgCalcTodoMes').AsInteger = 0 then
    reValorTotal.Text := FormatFloat('#0.00',rValorBeneficio)
  else
    reValorTotal.Text := FormatFloat('#0.000000',rValorBeneficio)
end;

procedure TfrmCadRequerBenefBfciario.reValorTotalExit(Sender: TObject);
begin
  inherited;
  sValorTotal := OraNumero(Trim(reValorTotal.Text));

  if qryBeneficio.FieldByName('FlgCalcTodoMes').AsInteger = 1 then
    rValorCotas  := StrToFloat(ClienteNumero(sValorTotal))
  else
    rValorCotas := 0;
end;

procedure TfrmCadRequerBenefBfciario.reValorCalcInssExit(Sender: TObject);
begin
  inherited;
  if (Trim(reValorInfINSS.Text) = '') or (StrToFloat(ClienteNumero(reValorInfINSS.Text)) <= 0)
  then reValorInfINSS.Text := reValorCalcINSS.Text;
  sValorCalcInss := OraNumero(Trim(reValorCalcInss.Text));
end;

procedure TfrmCadRequerBenefBfciario.reValorInfINSSExit(Sender: TObject);
var sSQL,
    sAnoMesInicioINSS,
    sAnoMesInicioFundacao,
    sAnoMesAtual,
    sValorRegra,
    sValorAtual,
    sMsgErro : string;
    rValorRegra : double;
    bErro : boolean;

begin
  inherited;
{
  // REAJUSTAR O BENEFICIO DO INSS DO MES DE INICIO NO INSS
  // AO MES DE INICIO NA FUNDACAO
  if Trim(dtInicioINSS.Text) = ''
  then begin
     MsgDlg('A Data de Início no INSS não está preenchida. O Valor do INSS não poderá ser reajustado. ',
            'Informação',mtInformation,[mbOk],0);
     Exit;
  end;

  if Trim(dtInicioFund.Text) = ''
  then begin
     MsgDlg('A DIB (Data de Início na Fundação) não está preenchida. O Valor do INSS não poderá ser reajustado. ',
            'Informação',mtInformation,[mbOk],0);
     Exit;
  end;

  sValorINSSDepois := Trim(reValorInfINSS.Text);

  if (bReajustouINSS) and (sValorINSSAntes = sValorINSSDepois)
  then begin
     Exit;
  end;

  // PREENCHER MESES
  sAnoMesInicioINSS     := Copy(dtInicioINSS.Text,7,4)+'/'+Copy(dtInicioINSS.Text,4,2);
  sAnoMesInicioFundacao := Copy(dtInicioFund.Text,7,4)+'/'+Copy(dtInicioFund.Text,4,2);
  sAnoMesAtual          := sAnoMesInicioINSS;
  sValorAtual           := OraNumero(reValorCalcINSS.Text);

  if StrToFloat(ClienteNumero(sValorAtual)) > 0
  then begin
     // ABRIR QUERY COM REGRAS DE REAJUSTE
     qryReajINSS.Close;
     qryReajINSS.SQL.Clear;
     qryReajINSS.SQL.Add(' SELECT MESREAJ, IDRGREAJ FROM REAJINSS '+
                         ' WHERE  (MESREAJ >= '''+sAnoMesInicioINSS+''') '+
                         ' AND    (MESREAJ <= '''+sAnoMesInicioFundacao+''') ');
     qryReajINSS.Open;
     if qryReajINSS.IsEmpty
     then begin
        qryReajINSS.Close;
        Exit;
     end;

     // EXECUTAR REGRAS DE REAJUSTE PARA OS MESES QUE HOUVEREM
     while sAnoMesAtual <= sAnoMesInicioFundacao do
     begin
         // Se encontrar mes na tabela de reajuste -> reajustar
         // Senao, manter o valor
         if not qryReajINSS.Locate('MesReaj',sAnoMesAtual, [loCaseInsensitive])
         then begin
            sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
            continue;
         end;
         sSQL := ' SELECT '''+sAnoMesAtual+''' AS ANOMESREF, '+
                              sValorAtual +'   AS VALORATUAL '+
                 ' FROM DUAL ';
         sValorRegra := RegraNumerica(qryReajINSS.FieldByName('IdRgReaj').AsString,
                                      sSQL, bErro, iIdCalculoGeral );

         if bErro
         then begin
           MsgDlg('Ocorreu um erro na execução da Regra de Reajuste do INSS Nº '+qryReajINSS.FieldByName('IdRgReaj').AsString+'.',
                  'Erro',mtError,[mbOk],0);
           Exit;
        end;

        if Trim(sValorRegra) = ''
        then begin
           MsgDlg('A Regra de Reajuste do INSS Nº '+qryReajINSS.FieldByName('IdRgReaj').AsString+' retornou um valor em branco.',
                  'Erro',mtError,[mbOk],0);
           Exit;
        end;

        try
           rValorRegra := StrToFloat(ClienteNumero(sValorRegra));
        except
           MsgDlg('A Regra de Reajuste do INSS Nº '+qryReajINSS.FieldByName('IdRgReaj').AsString+' retornou um valor inválido.',
                  'Erro',mtError,[mbOk],0);
           Exit;
        end;

        sValorAtual  := OraNumero(sValorRegra);
        sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
     end;
  end;

  reValorCalcInss.Text := sValorAtual;}

  //leofuncef -  25032003 - inicio
  //mudar a cor do edit caso o valor seja diferente do calculado
  if Trim(reValorInfINSS.Text) <> Trim(reValorCalcINSS.Text)
  then reValorInfINSS.Color := clRed
  else reValorInfINSS.Color := clWindow;
  //leofuncef - 25032003 - fim

  {sValorInfInss := OraNumero(Trim(reValorInfInss.Text));}
end;

procedure TfrmCadRequerBenefBfciario.dbrgrpBenefProvisorioClick(
  Sender: TObject);
begin
  inherited;
  if dbrgrpBenefProvisorio.ItemIndex = 0
  then begin
    lblPercConc.Visible             := False;
    dbedPercConc.Visible            := False;
    lblPercent.Visible              := False;
    lblPrazoProv.Visible            := False;
    dbedPrazoProv.Visible           := False;
    lblMesProv.Visible              := False;
  end
  else begin
    lblPercConc.Visible             := True;
    dbedPercConc.Visible            := True;
    lblPercent.Visible              := True;
    lblPrazoProv.Visible            := True;
    dbedPrazoProv.Visible           := True;
    lblMesProv.Visible              := True;
    if (dsDet.DataSet.State = dsInsert) and (Trim(dbedPrazoProv.Text) = '')
    then begin
       dbedPrazoProv.Text := qryBeneficio.FieldByName('PrazoProvisorio').AsString;
       qryDet.FieldByName('PrazoProvisorio').AsInteger := qryBeneficio.FieldByName('PrazoProvisorio').AsInteger;
    end;
  end;

end;

procedure TfrmCadRequerBenefBfciario.dbedPrazoProvExit(Sender: TObject);
var sDataFinal : string;
    iPrazoEmMeses : integer;
begin
  inherited;
  if Trim(dbedPrazoProv.Text) = '' then Exit;

  // Calcular data final do beneficio
  try
     iPrazoEmMeses := StrToInt(dbedPrazoProv.Text);
  except
     MsgDlg('Prazo Máximo de Concessão inválido.','Informação',mtInformation,[mbOk],0);
     Exit;
  end;
  sDataFinal    := CalculaDataAposPrazo(dtDataInicio.Text,iPrazoEmMeses);

  if (Trim(dtDataFinal.Text) <> '') and
     (Trim(dtDataFinal.Text) <> sDataFinal)
  then begin
    if MsgDlg('A data final informada até o momento não coincide com o prazo informado : '+
              ' [Data Informada - '+Trim(dtDataFinal.Text)+ ' e  '+
              ' Data após Prazo - '+sDataFinal+']. '+
              ' Confirma o Prazo ? ','Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo
    then begin
       dbedPrazoProv.Text := '';
       dbedPrazoProv.SetFocus;
       Exit;
    end
    else if Trim(sDataFinal) <> ''
         then dtDataFinal.Date := StrToDate(sDataFinal);
  end
  else if Trim(sDataFinal) <> ''
       then dtDataFinal.Date := StrToDate(sDataFinal);

end;

function TfrmCadRequerBenefBfciario.ConfirmaBeneficio : boolean;
begin
   Result := False;

   MostraDemonstrativoConcessao;

   if MsgDlg('Deseja confirmar os resultados da concessão ?','Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo
   then Result := False
   else Result := True;
end; // ConfirmaBeneficio

procedure TfrmCadRequerBenefBfciario.MostraDemonstrativoConcessao;
var sFormato, sAnoMesAtual, sRecebedorAtual, sSQL : string;
    iIdRecebedorAtual             : longint;
    dValorIntegralNaDib,
    dValorTotalNaDib              : double;
    iIdBeneficio : Integer;
begin
   frmAguarde.Mostra('Preparando o Demonstrativo da Concessão...');

   if not qryTitular.Active
   then begin
     qryTitular.Close;
     qryTitular.ParamByName('IdPessoa').Value    := iIdTitular;
     qryTitular.ParamByName('IdPessJur').Value   := iIdPessJur;
     qryTitular.ParamByName('IdPlanoPrev').Value := iIdPlanoPrev;
     qryTitular.ParamByName('SeqProposta').Value := iSeqProposta;
     qryTitular.Open;
   end;

   qryAux.Close;

   If frmMostraAux = Nil Then
     Application.CreateForm(TfrmMostraAux, frmMostraAux);

   frmMostraAux.Caption := 'Resumo da Concessão de Benefício ... ';

   // Exibir dados do participante
   with frmMostraAux.memResult.Lines do
   begin
      Clear;
      Add('-----------------------------------------------------------------------------------------------------');
      Add(PreparaStr('                                DEMONSTRATIVO DE CONCESSÃO',72)+'- VERSÃO            : '+Sistema.Versao);
      Add(PreparaStr(' '                                                         ,72)+'  LOTE              : '+IntToStr(iIdLoteConcessao));
      Add(PreparaStr('USUÁRIO : '+Sistema.NomeUsuario                            ,72)+'  DATA DA CONCESSÃO : '+FormatDateTime('dd/mm/yyyy', date)); // 24334
      Add('-----------------------------------------------------------------------------------------------------');
      Add('Participante         : '+qryTitular.FieldByName('Nome').AsString);
      Add(' ');
      Add('Data de Nascimento   : '+qryTitular.FieldByName('DataNasc').AsString);
      Add('Data do Falecimento  : '+qryTitular.FieldByName('DataMorte').AsString);
      Add('-----------------------------------------------------------------------------------------------------');

      { Inicio Augusto 17/11/2003 - Reorganização dos dados }
      Add(PreparaStr('Patrocinadora        : '  +qryTitular.FieldByName('NomePatro').AsString,50)+
          PreparaStr('Matrícula : '       +qryTitular.FieldByName('Matricula').AsString,49));

      Add(PreparaStr('Plano Previdenciário : '+qryTitular.FieldByName('NomePlano').AsString,50)+
          PreparaStr('Data de Admissão : '+qryTitular.FieldByName('DataAdmissao').AsString,49));

      Add(PreparaStr('Número de Inscrição  : '+qryTitular.FieldByName('InscricaoNumero').AsString,50)+
          PreparaStr('Data de Demissão : '+qryTitular.FieldByName('DataDemissao').AsString,49));

      Add(PreparaStr('Data de Inscrição    : '+qryTitular.FieldByName('InscricaoData').AsString,50)+
          PreparaStr('Tempo Serv. Total : '+qryTitular.FieldByName('TempoServTotal').AsString+' anos '+
                                            qryTitular.FieldByName('TempoServTotMes').AsString+' meses '+
                                            qryTitular.FieldByName('TempoServTotDia').AsString+' dias ',49));

     {----------
      Add('  ');
      Add(PreparaStr('Patrocinadora  : '  +qryTitular.FieldByName('NomePatro').AsString,50)+
          PreparaStr('Matrícula : '       +qryTitular.FieldByName('Matricula').AsString,49));
      Add(PreparaStr(' ',50)+
          PreparaStr('Data de Admissão : '+qryTitular.FieldByName('DataAdmissao').AsString,49));
      Add(PreparaStr(' ',50)+
          PreparaStr('Data de Demissão : '+qryTitular.FieldByName('DataDemissao').AsString,49));
      Add(PreparaStr(' ',50)+
          PreparaStr('Tempo Serv. Total : '+qryTitular.FieldByName('TempoServTotal').AsString+' anos '+
                                            qryTitular.FieldByName('TempoServTotMes').AsString+' meses '+
                                            qryTitular.FieldByName('TempoServTotDia').AsString+' dias ',49));
      // Dados no Plano
      Add('  ');
      Add('Plano Previdenciário : '+qryTitular.FieldByName('NomePlano').AsString);
      Add('Número de Inscrição  : '+qryTitular.FieldByName('InscricaoNumero').AsString);
      Add('Data de Inscrição    : '+qryTitular.FieldByName('InscricaoData').AsString);
      --}

      { Fim Augusto 17/11/2003 - Reorganização dos dados }


      Add('-----------------------------------------------------------------------------------------------------');
      Add('PROCESSO Nº : '+qry.FieldbyName('NumeroProcesso').AsString);
      Add('EVENTO : '+Trim(dblkpcmbEvento.Text)+ ' - DATA : '+ FormatDateTime('dd/mm/yyyy', dtDataEvento.Date)); // 24334
      Add('-----------------------------------------------------------------------------------------------------');
      Add('=> BENEFÍCIOS CONCEDIDOS :');

      // FUNCEF - Abrir query com total por recebedor para demonstrar no final
      qryTotalRecebedor.Close;
      qryTotalRecebedor.ParamByName('IdPessoa').AsInteger := -1;
      qryTotalRecebedor.Open;

      qryDet.First;
      while not qryDet.Eof do
      begin
         Add('-----------------------------------------------------------------------------------------------------');
         Add('     => '+qryDet.FieldByName('Nome').AsString+ ' para '+ qryDet.FieldByName('Depen').AsString);

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT NOME FROM PESSOA WHERE IDPESSOA = '+ IntToStr(qryDet.FieldByName('IdResponsavel').AsInteger) );
         qryAux.Open;

         if qryAux.FieldByName('NOME').AsString = ''
         then begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' SELECT NOME FROM PESSOA WHERE IDPESSOA = '+ IntToStr(qryDet.FieldByName('IdPessoa').AsInteger) );
            qryAux.Open;
         end;
         Add('        Recebedor : '+qryAux.FieldByName('Nome').AsString);

         if qryTotalRecebedor.Locate('IdPessoa',qryDet.FieldByName('IdResponsavel').AsInteger,[])
         then begin
            qryTotalRecebedor.Edit;
            qryTotalRecebedor.FieldByName('Total').AsFloat := qryTotalRecebedor.FieldByName('Total').AsFloat + qryDet.FieldByName('VALORATUAL').AsFloat;
            qryTotalRecebedor.Post;
         end
         else begin
            qryTotalRecebedor.Insert;
            qryTotalRecebedor.FieldByName('IdPessoa').AsInteger := qryDet.FieldByName('IdResponsavel').AsInteger;
            qryTotalRecebedor.FieldByName('Nome').AsString      := qryAux.FieldByName('Nome').AsString;
            qryTotalRecebedor.FieldByName('Total').AsFloat      := qryDet.FieldByName('VALORATUAL').AsFloat;
            qryTotalRecebedor.Post;
         end;

         Add(' ');
         Add('        '+ PreparaStr('Data de Requerimento : '+qryDet.FieldByName('DataRequerimento').AsString, 50)+
                         PreparaStr('Data de Concessão : '+FormatDateTime('dd/mm/yyyy', date), 49));  // 24334

         Add('        '+ PreparaStr('Data de Início no INSS : '+qryDet.FieldByName('DataInicioINSS').AsString,50)+
                         PreparaStr('Data de Início na Fundação : '+qryDet.FieldByName('DataInicioFUND').AsString, 49));

         Add('        '+ PreparaStr('Valor do INSS : Calculado = R$ '+FormatFloat('#0.00', qryDet.FieldByName('VLRCALCINSS').AsFloat),50)+
                         PreparaStr('Informado = R$ '+FormatFloat('#0.00', qryDet.FieldByName('VLRINFINSS').AsFloat), 49));

         dValorIntegralNaDib := PegaValorIntegral( dtmAPrev.qry,
                                                   iNumeroProcesso,
                                                   qryDet.FieldByName('IDBENEFICIO').AsInteger,
                                                   qryDet.FieldByName('IDPESSOA').AsInteger,
                                                   qryDet.FieldByName('DATAINICIOFUND').AsString );

         dValorTotalNaDib    := PegaValorTotal   ( dtmAPrev.qry,
                                                   iNumeroProcesso,
                                                   qryDet.FieldByName('IDBENEFICIO').AsInteger,
                                                   qryDet.FieldByName('IDPESSOA').AsInteger,
                                                   qryDet.FieldByName('DATAINICIOFUND').AsString );
         { Augusto 24/10/2003 }
         Add('        '+ PreparaStr('Valor Total do Benefício = R$ '+FormatFloat('#0.00', dValorTotalNaDib) ,50)+
                         PreparaStr('Data Início Pagamento : '+qryDet.FieldByName('DataInicio').AsString, 49));
         {-}

         Add('        '+ PreparaStr('Valor Rateado do Benefício = R$ '+FormatFloat('#0.00', dValorIntegralNaDib),50));

         // Add('        '+ PreparaStr('Valor Total do Benefício = R$ '+FormatFloat('#0.00', qryDet.FieldByName('VALORTOTAL').AsFloat)  ,50));
         // Add('        '+ PreparaStr('Valor Rateado do Benefício = R$ '+FormatFloat('#0.00', qryDet.FieldByName('VALORATUAL').AsFloat),50));
         Add('-----------------------------------------------------------------------------------------------------');
         qryDet.Next;
      end; // while not qryDet.Eof

      // Mostrar mês a mês quanto será pago e quanto será descontado
      Add('-----------------------------------------------------------------------------------------------------');
      Add('=> BENEFÍCIOS A PAGAR                                                                                ');
      Add('-----------------------------------------------------------------------------------------------------');
      Add(' ');

      // Buscar BENEFICIOS a pagar no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT DECODE(P.NOME , NULL, BENEF.NOME, P.NOME) AS RECEBEDOR, BP.FLGCALCTODOMES,                      '+
                 '        DECODE(P.NOME,  NULL, PFBENEF.FLGISENTOIRRF, PF.FLGISENTOIRRF) AS FLGISENTOIRRF,                '+
                 '        DECODE(BTIT.IDRESPONSAVEL, NULL, BTIT.IDPESSOA, BTIT.IDRESPONSAVEL) AS IDRESPONSAVEL,           '+

                 '        BTIT.IDPESSOA, '+ { Augusto 24/11/2005 }

                 //'        SUM(DECODE(BP.FLGREFERENCIA, 1, 0, H.VALORSRB)) AS VALORSRB, '+ { Augusto 04/11/2003 }

                 '        DECODE(BP.FLGREFERENCIA, 1, 0, H.VALORSRB) AS VALORSRB, '+ { Augusto 08/02/2004 }
                 '        B.NOME, H.MESREFERENCIA, H.FLGDEVOLUCAO, ' +
                 '        SUM(H.VALORPREV) AS VALORPREV , SUM(H.VALORINTEGRAL) AS VALORINTEGRAL,'+ { Augusto 04/11/2003 }
                 '        BP.FLGREFERENCIA, BF.DATAINICIOFUND '+
                 ' FROM   PESSOA BENEF, PESSOA P, PESSOAFISICA PFBENEF, PESSOAFISICA PF, BENEFICIO B, BENEFPLANPREV BP,   '+
                 '        BFCIARIOTITPLAN BTIT, HSTBENEFBFCIARIO H, BENEFBFCIARIO BF '+
                 ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)      +
                 '   AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)            +
                 '   AND    H.IDPLANOORIGEM    = '+IntToStr(iIdPlanoPrev)          +
                 '   AND    H.IDTITULAR        = '+IntToStr(iIdTitular)            +
                 '   AND    H.SEQPROPOSTA      = 1                                '+
                 '   AND    H.IDMOTIVO         <> '+IntToStr(prmIdMotDevolNaoIden) +
                 '   AND    H.FLGENVIADO       = 0 '+ { Augusto 30/03/2006 - Não exibir desconveniado }
                 '   AND    B.IDBENEFICIO      = H.IDBENEFICIO                    '+
                 '   AND    BF.NUMEROPROCESSO  = H .NUMEROPROCESSO                '+
                 '   AND    BF.IDPLANOORIGEM   = H.IDPLANOORIGEM                  '+
                 '   AND    BF.IDPLANOPREV     = H.IDPLANOPREV                    '+
                 '   AND    BF.IDPESSJUR       = H.IDPESSJUR                      '+
                 '   AND    BF.IDTITULAR       = H.IDTITULAR                      '+
                 '   AND    BF.IDPESSOA        = H.IDPESSOA                       '+
                 '   AND    BF.SEQPROPOSTA     = H.SEQPROPOSTA                    '+
                 '   AND    BF.IDBENEFICIO     = H.IDBENEFICIO                    '+
                 '   AND    BTIT.IDPESSJUR     = BF.IDPESSJUR                     '+
                 '   AND    BTIT.IDPLANOPREV   = BF.IDPLANOPREV                   '+
                 '   AND    BTIT.IDPLANOORIGEM = BF.IDPLANOORIGEM                 '+
                 '   AND    BTIT.IDTITULAR     = BF.IDTITULAR                     '+
                 '   AND    BTIT.SEQPROPOSTA   = BF.SEQPROPOSTA                   '+
                 '   AND    BTIT.IDPESSOA      = BF.IDPESSOA                      '+
                 '   AND    BTIT.IDBENEFICIO   = BF.IDBENEFICIO                   '+
                 '   AND    BENEF.IDPESSOA     = BTIT.IDPESSOA                    '+
                 '   AND    PFBENEF.IDPESSOA   = BTIT.IDPESSOA                    '+
                 '   AND    P.IDPESSOA(+)      = BTIT.IDRESPONSAVEL               '+
                 '   AND    PF.IDPESSOA(+)     = BTIT.IDRESPONSAVEL               '+
                 '   AND    BP.IDPLANOPREV     = H.IDPLANOPREV                    '+
                 '   AND    BP.IDBENEFICIO     = H.IDBENEFICIO                    '+
                 { Inicio Augusto 04/11/2003 - Agrupar valores por recebedor }
                 ' GROUP BY '+
                 '   DECODE(P.NOME , NULL, BENEF.NOME, P.NOME), '+
                 '   BP.FLGCALCTODOMES, '+
                 '   DECODE(P.NOME,  NULL, PFBENEF.FLGISENTOIRRF, PF.FLGISENTOIRRF), '+
                 '   DECODE(BTIT.IDRESPONSAVEL, NULL, BTIT.IDPESSOA, BTIT.IDRESPONSAVEL), '+
                 '   BTIT.IDPESSOA,    '+ { Augusto 24/11/2005 }
                 '   H.VALORSRB,       '+ { Augusto 08/02/2004 }
                 '   B.NOME,           '+
                 '   H.MESREFERENCIA,  '+
                 '   H.FLGDEVOLUCAO,   '+
                 '   BP.FLGREFERENCIA, '+
                 '   BF.DATAINICIOFUND '+
                 { Fim Augusto 04/11/2003 }
                 'ORDER BY  '+
                 ' DECODE(P.NOME , NULL, BENEF.NOME, P.NOME), '+
                 ' H.FLGDEVOLUCAO, '+
                 ' B.NOME, '+
                 ' H.MESREFERENCIA ');
         Open;
         First;

         if FieldByName('FLGCALCTODOMES').AsInteger = 0 then
           sFormato := '#0.00'
         else
           sFormato := '#0.0000';
           
         sRecebedorAtual   := '';
         iIdRecebedorAtual := -1;

         while (not Eof) do
         begin
            sRecebedorAtual   := FieldByName('RECEBEDOR').AsString;
            iIdRecebedorAtual := FieldByName('IDRESPONSAVEL').AsInteger;

            if FieldByName('FLGISENTOIRRF').AsInteger = 0
            then Add(PreparaStr(' - RECEBEDOR : '+sRecebedorAtual,50)+
                     PreparaStr('Isento de Imposto de Renda : Não ', 49))
            else Add(PreparaStr(' - RECEBEDOR : '+sRecebedorAtual,50)+
                     PreparaStr('Isento de Imposto de Renda : Sim ', 49));

            Add('   MÊS      ITEM                                    PAGAR         DESCONTAR   [INTEGRAL]   SRB');
            // Mostrar os beneficios deste recebedor
            while (not Eof) and (sRecebedorAtual = FieldByName('RECEBEDOR').AsString) do
            begin
               if FieldByName('FLGDEVOLUCAO').AsInteger = 0
               then Add('   '+
                        PreparaStr(FieldByName('MesReferencia').AsString                        ,9)+
                        PreparaStr(FieldByName('Nome').AsString                                 ,40)+
                        PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,14)+
                        PreparaStr('(-)'+FormatFloat(sFormato,0)                                ,12)+
                        PreparaStr('(+)'+FormatFloat(sFormato,FieldByName('ValorIntegral').AsFloat) ,13)+
                        PreparaStr(' '+FormatFloat(sFormato,FieldByName('VALORSRB').AsFloat) ,15) )
               else Add('   '+
                        PreparaStr(FieldByName('MesReferencia').AsString                        ,9)+
                        PreparaStr(FieldByName('Nome').AsString                                 ,40)+
                        PreparaStr('(+)'+FormatFloat(sFormato,0)                                ,14)+
                        PreparaStr('(-)'+FormatFloat(sFormato,FieldByName('ValorPrev').AsFloat) ,12)+
                        PreparaStr('(-)'+FormatFloat(sFormato,0)                                ,13)+
                        PreparaStr(' '+FormatFloat(sFormato,FieldByName('VALORSRB').AsFloat) ,15) );
               Next;
            end; // while 2

            { Inicio Augusto 23/11/20051 }

            { Exibir memória de calculo caso exista }
            sSQL := 'SELECT '+
                    '  DET.IDCALCULO,   DET.IDDETCALCULO, DET.DESCRICAO, DET.VALOR, '+
                    '  BEN.IDBENEFICIO, BEN.NOME AS NOMEBENEFICIO '+
                    'FROM   '+
                    '  DETCALCULO DET,    CALCULO CAL,  RELBENEFPART REL, '+
                    '  BENEFPLANPREV BPP, BENEFICIO BEN                   '+
                    'WHERE '+
                    //'  DET.IDCALCULO   = '+ IntToStr( iIdCalculo )         +' AND '+
                    '  REL.IDPESSJUR   = '+ IntToStr( iIdPessJur )         +' AND '+
                    '  REL.IDPLANOPREV = '+ IntToStr( iIdPlanoPrev )       +' AND '+
                    '  REL.IDPESSOA    = '+ IntToStr( QryAux.FieldByName('IDPESSOA').AsInteger ) +' AND '+
                    // '  REL.IDBENEFICIO = '+ IntToStr( iIdBeneficio )       +' AND '+
                    '  REL.NUMEROPROCESSO = '+ IntToStr( iNumeroProcesso ) +' AND '+

                    '  DET.IDCALCULO = CAL.IDCALCULO AND '+
                    '  DET.IDCALCULO = REL.IDCALCULO AND '+

                    '  REL.IDPLANOPREV = BPP.IDPLANOPREV AND '+
                    '  REL.IDBENEFICIO = BPP.IDBENEFICIO AND '+

                    '  BPP.IDBENEFICIO = BEN.IDBENEFICIO  '+

                    'ORDER BY '+
                    '  BEN.NOME, REL.IDCALCULO, DET.IDDETCALCULO ';

            If FazQuery( DtmAPrev.QryAux, ssQL ) Then Begin

              Add(' ');
              Add('   => MEMÓRIA DE CÁLCULO ');
              Add(' ');
              Add('   DESCRIÇÃO                                                                  VALOR       ');

              While Not DtmAPrev.QryAux.Eof Do Begin

                //Add( ' - '+PreparaStr( DtmAPrev.QryAux.FieldByName('NOMEBENEFICIO').AsString, 70 ) );
                Add( ' ' );

                iIdBeneficio := DtmAPrev.QryAux.FieldByName('IDBENEFICIO').AsInteger;

                While ( iIdBeneficio = DtmAPrev.QryAux.FieldByName('IDBENEFICIO').AsInteger ) And
                      ( Not DtmAPrev.QryAux.Eof )
                Do Begin

                  Add( '   '+PreparaStr( DtmAPrev.QryAux.FieldByName('DESCRICAO').AsString, 70 )+
                       PreparaStr( ' ', 05 )+
                       PreparaStr( DtmAPrev.QryAux.FieldByName('VALOR').AsString, 30 )
                     );

                  DtmAPrev.QryAux.Next;

                End; { While Not QryAux.Eof Do Begin }

              End; { While Not QryAux.Eof Do Begin }

            End; { If FazQuery( }
            Add(' ');

            { Fim Augusto 23/11/2005 }



         end; // while 1
      end;

      // CAMILLE - 25.01.2003 - ESTA DUPLICANDO TUDO
      {// Gleyber - 16/09/2002 - Início
      // Mostra SRB
      Add('--------------------------------------------------------------------------------------------');
      Add('=> VALORES A PAGAR / RECEBER                                                                                         ');
      Add('--------------------------------------------------------------------------------------------');
      Add('MÊS      ITEM                                     PAGAR       DESCONTAR  [ORIGINAL] SRB     ');
      Add(' ');

      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT B.NOME, H.MESREFERENCIA, H.VALORPREV, H.VALORPREVMIN, '+
                 '        DECODE(BPP.FLGREFERENCIA,0,H.VALORSRB,NULL) VALORSRB '+
                 ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H, BENEFPLANPREV BPP '+
                 ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
                 ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    H.IDPLANOORIGEM    = '+IntToStr(iIdPlanoPrev)+
                 ' AND    H.IDTITULAR        = '+IntToStr(iIdTitular)+
                 ' AND    H.SEQPROPOSTA      = 1 '+
                 ' AND    BPP.IDBENEFICIO    = H.IDBENEFICIO '+
                 ' AND    BPP.IDPLANOPREV    = H.IDPLANOPREV '+
                 ' AND    H.FLGDEVOLUCAO     = 0 '+
                 ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
                 ' ORDER BY B.NOME, H.MESREFERENCIA ');
         Open;

         while not Eof do
         begin
            Add( PreparaStr(FieldByName('MesReferencia').AsString                          ,9)+
                 PreparaStr(FieldByName('Nome').AsString                                   ,40)+
                 PreparaStr(' '                                                            ,1)+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat)    ,12)+
                 PreparaStr('(-)'+FormatFloat('#0.00',0)                                   ,10)+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrevMin').AsFloat) ,12)+
                 PreparaStr(FormatFloat('#0.00',FieldByName('VALORSRB').AsFloat)           ,11));
            Next;
         end;
      end;
       // Gleyber - 16/09/2002 - Fim
      }

      // Mostrar acertos de tratamento pos-morte
      Add('----------------------------------------------------------------------------------------------------');
      Add('=> ACERTOS DE BENEFÍCIOS DO TITULAR                                                                 ');
      Add('----------------------------------------------------------------------------------------------------');
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
                 ' AND    T.IDPLANOPREV      = '+IntToStr(iIdPlanoPrev)+
                 ' AND    T.IDTITULAR        = '+IntToStr(iIdTitular)+
                 ' AND    T.IDPESSOA         <> T.IDTITULAR                                          '+
                 ' AND    T.SEQPROPOSTA      = 1                                                     '+
                 ' AND    PV.IDPROVENTO      = T.IDPROVENTO                                          '+
                 ' AND    P.IDPESSOA         = T.IDPESSOA                                            '+
                 ' AND    T.NUMRECEBIMENTO   IS NULL '); // Gleyber - 09/01/2006 - Pendência 24027

         // Gleyber - 14/11/2006 - Pendência 23246 - Início
         If Trim(sIdBeneficiarioEncerrado) <> ''
         Then SQL.Add(' AND    T.IDPESSOA NOT IN ('+sIdBeneficiarioEncerrado+')');
         // Gleyber - 14/11/2006 - Pendência 23246 - Fim

         SQL.Add(' GROUP BY P.NOME  , T.IDPESSOA , '+
                 '        DECODE(PV.DESCRPROVDESC, NULL, PV.DESCRICAO, PV.DESCRPROVDESC), '+
                 '        T.MESREFERENCIA, T.FLGDESCONTO '+
                 ' ORDER BY T.IDPESSOA,  T.MESREFERENCIA, DECODE(PV.DESCRPROVDESC, NULL, PV.DESCRICAO, PV.DESCRPROVDESC) ');
         Open;

         while (not Eof) do
         begin
            sRecebedorAtual   := FieldByName('RECEBEDOR').AsString;
            iIdRecebedorAtual := FieldByName('IDRESPONSAVEL').AsInteger;

            Add(' - RECEBEDOR : '+sRecebedorAtual);
            Add('   MÊS      ITEM                                    PAGAR          DESCONTAR      ');
            // Mostrar os beneficios deste recebedor
            while (not Eof) and (sRecebedorAtual = FieldByName('RECEBEDOR').AsString) do
            begin
               if FieldByName('FLGDESCONTO').AsInteger = 0
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

      //leofuncef - 28032003 - inicio
      // Mostrar acertos de tratamento pos-morte
      Add('-----------------------------------------------------------------------------------------------------');
      Add('=> CONTRIBUIÇÕES DO PENSIONISTA                                                                   ');
      Add('-----------------------------------------------------------------------------------------------------');
      Add(' ');
      // Buscar ACERTOS
      with qryAux do
      begin
         Close;
         SQL.Clear;

         { Inicio Augusto 26/02/2007 - Voltar consulta da HSTCONTRIBPREV e unir com TMPDESC }

         sSQL := ' SELECT DISTINCT 1 AS TIPO, P.NOME  AS RECEBEDOR, H.IDPESSOA AS IDRESPONSAVEL,   '+
                 '        CO.NOME,   H.MESREFERENCIA, H.VALORESPERADO AS VALORPREV, H.FLGDEVOLUCAO '+
                 ' FROM   PESSOA P, HSTCONTRIBPREV H, CONTRIBUICAO CO , BFCIARIOTITPLAN BT         '+
                 ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
                 ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    H.IDPLANOPREV      = '+IntToStr(iIdPlanoPrev)+
                 ' AND    H.IDPESSOA         =  BT.IDRESPONSAVEL '+
                 ' AND    H.SEQPROPOSTA      = 1        '+
                 ' AND    BT.IDPESSJUR  =  H.IDPESSJUR '+
                 ' AND    BT.IDPLANOPREV = H.IDPLANOPREV '+
                 ' AND    BT.IDTITULAR =   '+IntToStr(iIdTitular)+' '+
                 ' AND    BT.SEQPROPOSTA =  1 '+
                 ' AND    CO.IDCONTRIBUICAO    = H.IDCONTRIBUICAO        '+
                 ' AND    P.IDPESSOA         = H.IDPESSOA     ';


         sSQL := sSQL +
                 ' UNION ALL ';

         sSQL := sSQL +
                 ' SELECT DISTINCT 2 AS TIPO,  P.NOME  AS RECEBEDOR, H.IDPESSOA AS IDRESPONSAVEL, '+
                 '        CO.NOME,   H.MESREFERENCIA, H.VALOR AS VALORPREV ,  DECODE(H.FLGATRASODEVOL,''D'' , 1, 0) FLGDEVOLUCAO '+
                 ' FROM   PESSOA P, TMPDESC H, CONTRIBUICAO CO , BFCIARIOTITPLAN BT  '+
                 ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
                 ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    H.IDPLANOPREV      = '+IntToStr(iIdPlanoPrev)+
                 ' AND    H.IDPESSOA         = BT.IDRESPONSAVEL '+
                 ' AND    H.SEQPROPOSTA      = 1        '+
                 ' AND    BT.IDPESSJUR       = H.IDPESSJUR '+
                 ' AND    BT.IDPLANOPREV     = H.IDPLANOPREV '+
                 ' AND    BT.IDTITULAR       = '+IntToStr(iIdTitular)+
                 ' AND    BT.SEQPROPOSTA     = 1 '+
                 ' AND    CO.IDCONTRIBUICAO  = H.IDDESCONTO '+
                 ' AND    P.IDPESSOA         = H.IDPESSOA  '+
                 ' AND    H.NUMRECEBIMENTO   IS NOT NULL ';

         If Trim(sIdBeneficiarioEncerrado) <> ''
         Then sSQL := sSQL + ' AND    P.IDPESSOA NOT IN ('+sIdBeneficiarioEncerrado+')'+ #13 ;

         sSQL := sSQL + ' ORDER BY 3,  5, 4 ';

         { Fim Augusto 26/02/2007                                                           }
         
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
               if FieldByName('FLGDEVOLUCAO').AsInteger = 1 { Augusto 12/02/2004, era -> } //if FieldByName('FLGDESCONTO').AsInteger = 0
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
      //leofuncef - 28032003 - fim

      Add('-----------------------------------------------------------------------------------------------------');
      Add('                                             APENAS PARA CONFERÊNCIA ');
      Add('-----------------------------------------------------------------------------------------------------');
   end; // with
   frmAguarde.Apaga;
   frmMostraAux.ShowModal;
end; // MostraDemonstrativoConcessao


procedure TfrmCadRequerBenefBfciario.reValorInfINSSEnter(Sender: TObject);
begin
  inherited;
  sValorINSSAntes := Trim(reValorInfINSS.Text);
end;

procedure TfrmCadRequerBenefBfciario.dbrgrpBenefProvisorioEnter(
  Sender: TObject);
begin
  inherited;
  iProvisorioAntes := dbrgrpBenefProvisorio.ItemIndex;

end;

procedure TfrmCadRequerBenefBfciario.dbrgrpBenefProvisorioExit(
  Sender: TObject);
begin
  inherited;
  iProvisorioAntes := dbrgrpBenefProvisorio.ItemIndex; //leofuncef - 05122002

  if iProvisorioAntes <> dbrgrpBenefProvisorio.ItemIndex
  then bRecalculouProvisorio := False;
end;

function TfrmCadRequerBenefBfciario.EfetuaConcessao(iIdSitEscolhida : word;
                             var rValorAtualizado,
                                 rValorAtualizadoTotal,
                                 rValorAtualizadoINSS,
                                 rValorAtualizadoTotalINSS : double;
                             var sUltMesReajuste,
                                 sUltMesReajusteINSS  : string;
                             var bErro                : boolean ) : word;
var 
    bPreparoOK,
    bFlgIntContab   : boolean;
    sDataReserva,
    sMsgErro        : string;
    dSaldoCotas     : double;

    varfields       : variant;

    sDataInicioINSS : String;
begin
   Result := iIdSitEscolhida;

   if iIdLoteConcessao <= 0
   then begin
      iIdLoteConcessao := SelecionaLoteBeneficioAberto(sAnoMesLoteConcessao,
                                             // P.RAMOS - REFER - 03.07.2001
                                                       iFlgIncluiMesConc );
      if iIdLoteConcessao <= 0
      then begin
         bErro := True;
         MsgDlg('Nenhum lote selecinado para efetuar a concessão. Verifique. ','Erro',mtError,[mbOk, mbHelp],0);
         TiraSQL(qryAux);
         Result := 4;
         Exit;
      end;
   end;

   // Gleyber - 01/06/2005 - Pendência 17806 - Início
   With qryAux do
    Begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT DATAPAGAMENTO');
     SQL.Add('FROM CTRLINTERFACE');
     SQL.Add('WHERE IDLOTE = '+IntToStr(iIdLoteConcessao));
     Open;

     If (Not IsEmpty) And
        (StrToDate(FieldByName('DATAPAGAMENTO').AsString) < dtInicioFund.Date)
      Then Begin
         bErro := True;
         MsgDlg('Atenção!!'+#13+#13+
                'O lote escolhido possui uma data de pagamento ('+qryAux.FieldByName('DATAPAGAMENTO').AsString+')'+#13+
                'anterior a data de inicio de beneficio - DIB (' + FormatDateTime('dd/mm/yyyy', dtInicioFund.Date) + ').'+#13+#13+
                'Favor escolher outro lote.' , 'Lote com data anterior',mtError,[mbOk, mbHelp],0);
         Exit;
      End;
    End;

   {qryAux.Close;
   qryAux.SQL.Clear;
   //leocm - 2309 - inicio
   //troquei de
   //qryAux.SQL.Add(' SELECT DATAPREPARO FROM CTRLINTERFACE WHERE IDLOTE = '+IntToStr(iIdLoteConcessao));
   qryAux.SQL.Add(' SELECT DATAPAGAMENTO FROM CTRLINTERFACE WHERE IDLOTE = '+IntToStr(iIdLoteConcessao));
   //leocm - 2309 - fim
   qryAux.Open; }
   // Gleyber - 01/06/2005 - Pendência 17806 - Fim

   if (not qryAux.IsEmpty) And (qryEvento.FieldbyName('FLGINTERNO').AsString <> 'CA') // Gleyber - 03/07/2006 - Pendência 21883
   then sDataPagamentoConcessao := FormatDateTime('dd/mm/yyyy', qryAux.FieldByName('DATAPAGAMENTO').AsDateTime) // 24334
   else sDataPagamentoConcessao := CriticaDataCobrancaSit(qryAux,IntToStr(iIdFundacao),
                                                          '',
                                                          'AS',
                                                          'P',
                                                          FormatDateTime('mm', Date),   // 24334
                                                          FormatDateTime('yyyy', Date), // 24334
                                                         );


   // Gleyber - 15/01/2003 - início
   // Testar quitacao de dividas
   // Se, por algum motivo, o usuario disser que nao quer conceder,
   // manter a situacao = 4
   TestaQuitacaoDividas;
   // Gleyber - 15/01/2003 - fim

   //leofuncef - 28102003 - troquei a linha de abertura da transação
   //pois a TestaQuitacaoDividas já está abrindo
   // Preparar beneficio gravando-o no Historico de Beneficios
   if not dtmBaseDados.dbBaseDados.InTransaction
   then dtmBaseDados.dbBaseDados.StartTransaction;


   // CAMILLE - 23.01.2003
   // Calcular INSS antes da suplementacao pois no calculo da suplementacao é
   // necessário o valor do inss
   // leo - 27/05/2002: testando iIdBenefReferencia

   // Preencher qual é o beneficio de referencia
   if Trim(qryBeneficio.FieldByName('IdBenefRef').AsString) <> ''
   then iIdBenefReferencia  := qryBeneficio.FieldByName('IDBENEFREF').AsInteger
   else iIdBenefReferencia  := -1;

   varFields    := VarArrayCreate([0,1],varVariant);
   varFields[0] := iIdBenefReferencia;
   varFields[1] := qryDet.FieldByName('IdPessoa').AsInteger;

   // CGUEDES - 09/09/2002: se pagar benefício do INSS, utilizar data do inicio do do mesmo,
   // senão usar o primeiro dia do mês da DIB (Fundação)
   If qryBenefReferencia.FieldByName('FLGPAGAINSS').AsInteger = 1 Then
     sDataInicioINSS := qryDet.FieldByName('DataInicioINSS').AsString
   // cguedes - 10/09/2002
   Else  sDataInicioINSS := dtDataInicio.Text;//'01'+Copy(qryDet.FieldByName('DATAINICIOFUND').AsString,3,8);

   { Para cada concessão de beneficio, gerar um único IDCALCULO }
   iIdCalculo := -1;

   if iIdBenefReferencia > 0 Then
   if qryBenefReferencia.Locate('IdBeneficio;IdPessoa',varFields,[loCaseInsensitive])
   then begin
      // CAMILLE - 23.08.2002
      dValorSRB               := qryDet.FieldByName('VALORSRB').AsFloat;
      bPreparoOK := PreparaBeneficioConcedido(qryAux,
                             qryDet.FieldByName('IdTitular').AsInteger,
                             qryDet.FieldByName('IdPessoa').AsInteger,
                             qryDet.FieldByName('SeqProposta').AsInteger,
                             qryDet.FieldByName('IdPessJur').AsInteger,
                             qryDet.FieldByName('IdPlanoPrev').AsInteger,
                             qryDet.FieldByName('NumeroProcesso').AsInteger,
                             qryBenefReferencia.FieldByName('IdBeneficio').AsInteger,
                             prmIDMOTIVOFOLHABEN,
                             iNumBenef, // 1, // piTotBeneficiarios
                             qryBenefReferencia.FieldByName('IdRegraCalculo').AsInteger,
                             -1, //IDREGRAREAJBENEF
                             qryBenefReferencia.FieldByName('IdRegraPrimPagto').AsInteger,
                             qryBenefReferencia.FieldByName('IdRegraUltPagto').AsInteger,
                             qryBenefReferencia.FieldByName('IdTpPagtoBenefic').AsInteger,
                             {P.RAMOS 20.06.2001 INCLUSAO DO CODPORTFORMA}
                             qryDet.FieldByName('CODPORTFORMA').AsInteger,
                             qryBenefReferencia.FieldByName('Nome').AsString,
                             sNomePatro, sNomePlano, sMatricula,
                             sDataInicioINSS,// CGUEDES - 09/09/2002 qryDet.FieldByName('DataInicioINSS').AsString,
                             qryDet.FieldByName('DataFinal').AsString,
                             qryBenefReferencia.FieldByName('flgCalcTodoMes').AsString,
                             qryBenefReferencia.FieldByName('ValorAtual').AsFloat,
                             0, // valorcotas
                             qryBenefReferencia.FieldByName('ValorAtual').AsFloat, // CAMILLE - 13.08.2002
                             True,
                             rValorAtualizadoINSS,
                             rValorAtualizadoTotalINSS,
                             sUltMesReajusteINSS,
                             bErro,
                             bAux,
                             sMsgErro,iIdLoteConcessao,
                             { Augusto - Gleyber 12/12/2003 }
                             //qryDet.FieldByName('DataInicioINSS').AsString,
                             qryDet.FieldByName('DATAINICIO').AsString,
                             7,
                             0,
                             dValorSRB,
                             iIdCalculo);

      if bErro or (not bPreparoOK)
      then begin
         dtmBaseDados.dbBaseDados.RollBack;
         if Trim(sMsgErro) = '' then sMsgErro := 'Erro no Preparo do Benefício.';
         MsgDlg(sMsgErro+' O benefício será mantido como "Pendente de Concessão"  '+
               'até que o problema seja resolvido. ','Erro',mtError,[mbOk],0);
         TiraSQL(qryAux);
         Result := 4;
         Exit;
      end;
   end; // if Beneficio Referencia

   dValorSRB               := qryDet.FieldByName('VALORSRB').AsFloat;

   bPreparoOK := PreparaBeneficioConcedido(qryAux,
                             qryDet.FieldByName('IdTitular').AsInteger,
                             qryDet.FieldByName('IdPessoa').AsInteger,
                             qryDet.FieldByName('SeqProposta').AsInteger,
                             qryDet.FieldByName('IdPessJur').AsInteger,
                             qryDet.FieldByName('IdPlanoPrev').AsInteger,
                             qryDet.FieldByName('NumeroProcesso').AsInteger,
                             qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                             prmIDMOTIVOFOLHABEN,
                             iNumBenef, // 1, // piTotBeneficiarios
                             qryBeneficio.FieldByName('IdRegraCalculo').AsInteger,
                             -1, // IDREGRAREAJBENEF
                             qryBeneficio.FieldByName('IdRegraPrimPagto').AsInteger,
                             qryBeneficio.FieldByName('IdRegraUltPagto').AsInteger,
                             qryDet.FieldByName('IdTpPagtoBenefic').AsInteger,
                             {P.RAMOS 20.06.2001 INCLUSAO DO CODPORTFORMA}
                             qryDet.FieldByName('CODPORTFORMA').AsInteger,

                             qryBeneficio.FieldByName('Nome').AsString,
                             sNomePatro, sNomePlano, sMatricula,
                             qryDet.FieldByName('DataInicio').AsString,
                             qryDet.FieldByName('DataFinal').AsString,
                             qryBeneficio.FieldByName('flgCalcTodoMes').AsString,
                             { Augusto 08/02/2004 - Neste parametro deve se passar o ValorAtual (rateado) }
                             //qryDet.FieldByName('ValorTotal').AsFloat, // cguedes - 23/07/2002
                             qryDet.FieldByName('ValorAtual').AsFloat,
                             qryDet.FieldByName('ValorCotas').AsFloat,
                             qryDet.FieldByName('ValorTotal').AsFloat,
                             True,
                             rValorAtualizado,
                             rValorAtualizadoTotal,
                             sUltMesReajuste,
                             bErro,
                             bAux,
                             sMsgErro,iIdLoteConcessao,
                             { Augusto - Gleyber 12/12/2003 }
                             //qryDet.FieldByName('DataInicioINSS').AsString,
                             qryDet.FieldByName('DATAINICIO').AsString,
                             7,
                             0,
                             dValorSRB,
                             iIdCalculo);
   if bErro
   then begin
      dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg(sMsgErro+' O benefício será mantido como "Pendente de Concessão"  '+
            'até que o problema seja resolvido. ','Erro',mtError,[mbOk],0);
      TiraSQL(qryAux);
      Result := 4;
      Exit;
   end;




   // Grava FlgEfetivado = 1 na EventosPrev        - rosana - 15/10/1999
   AtualizaEventosPrev(qryDet.FieldByName('IdPessJur').AsInteger,
                       qryDet.FieldByName('IdPlanoPrev').AsInteger,
                       qryDet.FieldByName('IdTitular').AsInteger,
                       qryDet.FieldByName('SeqProposta').AsInteger,
                       qry.FieldByName('IdEventoGerador').AsInteger);


   // Chamar movimentacao de reservas

   bFlgIntContab := (IntegraBack.Contabilidade = 'S');
//   sIdEventoGerador := qry.FieldByName('IdEventoGerador').AsString;
//   sIdTitular   := qryDet.FieldbyName('IdTitular').AsString;
//   sSeqProposta := qryDet.FieldbyName('SeqProposta').AsString;

   // Para cada movimento de reserva feito, neste momento - de concessao do beneficio -
   // o sistema deve gerar o movimento de reserva efetivo e apagar a movreservatemp
   if qryBeneficio.FieldbyName('FlgResgate').AsInteger = 1
   then begin
      qryMovReservaTemp.First;
      while not qryMovReservaTemp.Eof do
      begin

         if qryMovReservaTemp.FieldbyName('IdBeneficio').AsInteger <>
            qryDet.FieldbyName('IdBeneficio').AsInteger
         then begin
            qryMovReservaTemp.Next;
            continue;
         end;

         if qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat <= 0
         then begin
            qryMovReservaTemp.Delete;
            continue;
         end;

         if qryBeneficio.FieldByName('FlgDataIndiceRes').AsInteger = 0       // usar DIB
         then sDataReserva := qryDet.FieldByName('DataInicioFund').AsString
         else if qryBeneficio.FieldByName('FlgDataIndiceRes').AsInteger = 2 // usar Data do Requerimento
         then sDataReserva := qryDet.FieldByName('DataRequerimento').AsString
         else begin // usar data do efetivo pagamento. Esta data será informada pelo usuario
            PedeInfAux('Informe a Data do Efetivo Pagamento','Data do Efetivo Pagamento','',2,sDataReserva);

            if Trim(sDataReserva) = ''
            then begin
               MsgDlg('O benefício está configurado para abater a reserva com a cota da data do efetivo '+
                     'pagamento. A informação desta data é obrigatória. Verifique.','Erro',mtError,[mbOk],0);
               TiraSQL(qryAux);
               Result := 4;
               Exit;
            end;
         end;
         if Trim(sDataReserva) = '' then sDataReserva := qryDet.FieldByName('DataInicioFund').AsString;

         dSaldoCotas := qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat -
                        qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat;

         if MoveReserva( qry.FieldByName('IdEventoGerador').AsString,
                      qryDet.FieldByName('IdTitular').AsString,
                      qryDet.FieldByName('SeqProposta').AsString,
                      sNomeTitular,
                      qryDet.FieldByName('IDBENEFICIO').AsString,
                      qryAux, dtmAPrev.RegraAPrev, sMsgErro,
                      qryDet.FieldByName('IDPESSJUR').AsString,
                      qryDet.FieldByName('IDPLANOPREV').AsString,
                      qryMovReservaTemp.FieldByName('IdTipoReserva').AsString, // IdTipoReservaOrig
                      qryDet.FieldByName('IDPESSJUR').AsString,
                      qryDet.FieldByName('IDPLANOPREV').AsString,
                      qryMovReservaTemp.FieldByName('IdTipoReserva').AsString, // IdTipoReservaDest
                      bFlgIntContab,
                      OraNumero(qryMovReservaTemp.FieldByName('VlrAbatido').AsString),
                      Date, '',
                      qryDet.FieldByName('NUMEROPROCESSO').AsString,
                      'F',
                      qry.FieldByName('DtDireito').AsString,
                      1,
                      qryDet.FieldByName('VlrINFINSS').AsFloat,
                      StrToDate(sDataReserva),
                      OraNumero(FloatToStr(dSaldoCotas)) ) <> 2
         then begin
            MsgDlg('Ocorreram erros ao movimentar a reserva relativa ao benefício. '+
                   'O benefício será mantido como "Pendente de Concessão"  '+
                   'até que o problema seja resolvido. ','Erro',mtError,[mbOk],0);
            TiraSQL(qryAux);
            Result := 4;
            Exit;
         end;

         qryMovReservaTemp.Delete;
      end;
   end;


   // CAMILLE - 19.07.2004
   // Executar PADRAO DE MOVIMENTACAO DE RESERVAS
   if qryDet.FieldByName('FLGMOVRESAPOSCONC').AsInteger = 1
   then begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQl.Add(' UPDATE BENEFBFCIARIO SET FLGMOVEURESERVA = 0 '+
                     ' WHERE  NUMEROPROCESSO = '+qryDet.FieldbyName('NUMEROPROCESSO').AsString+
                     ' AND    IDPESSJUR      = '+qryDet.FieldbyName('IDPESSJUR').AsString+
                     ' AND    IDPLANOPREV    = '+qryDet.FieldbyName('IDPLANOPREV').AsString+
                     ' AND    IDTITULAR      = '+qryDet.FieldbyName('IDTITULAR').AsString+
                     ' AND    IDPESSOA       = '+qryDet.FieldbyName('IDPESSOA').AsString+
                     ' AND    IDBENEFICIO    = '+qryDet.FieldbyName('IDBENEFICIO').AsString);
      try
         qryAux.ExecSQL;
      except
         MsgDlg('Ocorreram erros ao atualizar situação de movimento de reserva do processo. '+
                'O benefício será mantido como "Pendente de Concessão"  '+
                'até que o problema seja resolvido. ','Erro',mtError,[mbOk],0);
         TiraSQL(qryAux);
         Result := 4;
         Exit;
      end;
   end
   else begin
      // movimentar a reserva apenas uma vez por beneficio
      if Pos('*'+qryDet.FieldbyName('IDBENEFICIO').AsString+'*', sBeneficiosMovReserva) <= 0 // CAMILLE - 22.10.2004
      then begin
         sBeneficiosMovReserva := sBeneficiosMovReserva +'*'+qryDet.FieldbyName('IDBENEFICIO').AsString+'*'; // CAMILLE - 22.10.2004

      // Gleyber - 14/04/2005 - Pendência 18306 - Fim
      // O trecho abaixo foi movido para
      {   if not RODAPADRAOMOVRESERVA( qryDet.FieldByName('IDPESSJUR').AsInteger,
                                        qryDet.FieldByName('IDPLANOORIGEM').AsInteger,
                                        qryDet.FieldByName('IDTITULAR').AsInteger,
                                        qryDet.FieldByName('SEQPROPOSTA').AsInteger,
                                        -1,
                                        qry.FieldByName('IDEVENTOGERADOR').AsInteger,
                                        -1,
                                        qryDet.FieldByName('IDPLANOORIGEM').AsInteger,
                                        qryEvento.FieldbyName('FLGINTERNO').AsString,
                                        sDataPagamentoConcessao,
                                        sMsgErro,
                                        qryDet.FieldbyName('NUMEROPROCESSO').AsInteger,
                                        'C',
                                        dtDataFinal.Text )
         then begin
            MsgDlg('Ocorreram erros ao executar padrão de movimentação de reservas. '+
                   'O benefício será mantido como "Pendente de Concessão"  '+
                   'até que o problema seja resolvido. ','Erro',mtError,[mbOk],0);
            TiraSQL(qryAux);
            Result := 4;
            Exit;
         end }
      end;

      {qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQl.Add(' UPDATE BENEFBFCIARIO SET FLGMOVEURESERVA = 1 '+
                     ' WHERE  NUMEROPROCESSO = '+qryDet.FieldbyName('NUMEROPROCESSO').AsString+
                     ' AND    IDPESSJUR      = '+qryDet.FieldbyName('IDPESSJUR').AsString+
                     ' AND    IDPLANOPREV    = '+qryDet.FieldbyName('IDPLANOPREV').AsString+
                     ' AND    IDTITULAR      = '+qryDet.FieldbyName('IDTITULAR').AsString+
                     ' AND    IDPESSOA       = '+qryDet.FieldbyName('IDPESSOA').AsString+
                     ' AND    IDBENEFICIO    = '+qryDet.FieldbyName('IDBENEFICIO').AsString);
      try
         qryAux.ExecSQL;
      except
         MsgDlg('Ocorreram erros ao atualizar situação de movimento de reserva do processo. '+
                'O benefício será mantido como "Pendente de Concessão"  '+
                'até que o problema seja resolvido. ','Erro',mtError,[mbOk],0);
         TiraSQL(qryAux);
         Result := 4;
         Exit;
      end;}
   end;
   // CAMILLE - 19.07.2004 - FIM

   StrConcedidos := StrConcedidos + QryDet.FieldByName('IDPESSOA').AsString+',';

   bConcedeuBeneficio := True;
end; // EfetuaConcessao

procedure TfrmCadRequerBenefBfciario.AtualizaEventosPrev(iIdPessJur,   iIdPlanoPrev, iIdPessoa,
                                                         iSeqProposta, iIdEventoGerador : Integer);
var sDataEfetivado : string;
begin
    sDataEfetivado := ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''DD/MM/YYYY'')';  // 24334
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' UPDATE EVENTOSPREV SET FLGEFETIVADO  = 1, '+
                   '                        DATAEFETIVADO = '+sDataEfetivado+ // rosana - 15/10/99
                   ' WHERE   IDEVENTOSPREV IN '+
                   ' (SELECT MAX(IDEVENTOSPREV) FROM EVENTOSPREV          '+
                   ' WHERE  IDPESSOA        = '+IntToStr(iIdPessoa)        +
                   ' AND    IDPLANOPREV     = '+IntToStr(iIdPlanoPrev)     +
                   ' AND    IDPESSJUR       = '+IntToStr(iIdPessJur)       +
                   ' AND    SEQPROPOSTA     = '+IntToSTr(iSeqProposta)     +
                   ' AND    DATAREGISTRO = ( SELECT MAX(DATAREGISTRO) FROM EVENTOSPREV '+
                   '                                 WHERE IDPESSOA     = '+IntToStr(iIdPessoa)+
                   '                                 AND   IDPLANOPREV  = '+IntToStr(iIdPlanoPrev)+
                   '                                 AND   IDPESSJUR    = '+IntToStr(iIdPessJur)+
                   '                                 AND    IDEVENTOGERADOR = '+IntToStr(iIdEventoGerador)+') '+
                   ' AND    IDEVENTOGERADOR = '+IntToStr(iIdEventoGerador) +')');

    try
      qryAux.ExecSql;
    except
    end;
    qryAux.Close;
end;

procedure TfrmCadRequerBenefBfciario.sbtnConcederClick(Sender: TObject);
var iIdSitBenef, iIdSitTemp : integer;
    bSituacoesDiferentes    : boolean;
    sMsgErro                : String;  // Gleyber - 14/04/2005 - Pendência 18306
begin
  // Conceder todos os benefícios do processo
  sbtnAlterarClick(Sender);

  // Se estiver em insercao ou edicao, nao permitir concessao
  if qryDet.State in [dsEdit, dsInsert]
  then begin
     MsgDlg(' Este benefício não pode ser concedido antes de ser confirmado. '+
            ' Confirme a operação antes de concedê-lo. ','Informação',mtInformation,[mbOk],0);
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Verificar se o motivo default na tabela de parametros está preenchido
  if prmIDMOTIVOFOLHABEN <= 0
  then begin
     MsgDlg('O parâmetro motivo da folha de benefício não está preenchido. '+
            'Utilize a tela de parâmetros para cadastrá-lo. ','Informação',mtInformation,[mbOk],0);
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Dependendo da situacao do beneficio, nao faz sentido concede-lo novamente
  if (qryDet.FieldByName('IdSitBeneficio').AsInteger in [1,3,5])
  then begin
     MsgDlg(' Este benefício não pode ser concedido. Verifique sua situação.  ',
            'Informação',mtInformation,[mbOk],0);
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Atualizar query de conta bancaria
  // Verificar conta bancaria do recebedor
  if qryBeneficiario.FieldByName('NOMERESPONSAVEL').AsString = ''
  then begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('IdPessoa').AsInteger;
     qryContaBancaria.Open;
  end
  else begin
     qryContaBancaria.Close;
     qryContaBancaria.ParamByName('IdPessoa').Value := qryDet.FieldByName('IdResponsavel').AsInteger;
     qryContaBancaria.Open;
  end;

  if not qryBeneficio.Active
  then begin
     qryBeneficio.Close;
     qryBeneficio.ParamByName('IdEventoGerador').Value := qry.FieldByName('IdEventoGerador').AsInteger;
     qryBeneficio.ParamByName('IdPlanoPrev').Value     := qryDet.FieldByName('IdPlanoPrev').AsInteger;
     qryBeneficio.Open;
  end;

  // Chamar tela de Modo de Concessao
  If frmPedeBenefExigencia = Nil Then
    Application.CreateForm(TfrmPedeBenefExigencia, frmPedeBenefExigencia);

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

  sBeneficiosMovReserva := ''; // CAMILLE - 22.10.2004
  qryDet.First;
  while not qryDet.Eof do
  begin
     // Gleyber - 08/11/2006 - Pendência 23246 - Início
     If (qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 1) Or // Gleyber - 09/01/2007 - Pendência 24027
        (qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 3)
     Then Begin
       If Trim(sIdBeneficiarioEncerrado) = ''
       Then sIdBeneficiarioEncerrado := qryDet.FieldByName('IdPessoa').AsString
       Else sIdBeneficiarioEncerrado := sIdBeneficiarioEncerrado+', '+
                                        qryDet.FieldByName('IdPessoa').AsString;
       qryDet.Next;
       Continue;
     End;
     // Gleyber - 08/11/2006 - Pendência 23246 - Fim

     PreencheDadosBeneficiario( qryDet.FieldByName('NumeroProcesso').AsInteger,
                                qryDet.FieldByName('IdTitular').AsInteger,
                                qryDet.FieldByName('IdPessoa').AsInteger,
                                qryDet.FieldByName('IdPessJur').AsInteger,
                                qryDet.FieldByName('IdPlanoPrev').AsInteger,
                                qryDet.FieldByName('SeqProposta').AsInteger);
                                
     if not ConcedeUmBeneficio(Sender, iIdSitBenef)
     then begin
        sbtnConceder.Down := False;
        TiraSQL(qryAux);
        Exit;
     end;
     qryDet.Next;
  end; // while

  // Se o processo só possuir um beneficio, atualizar situacao do processo
  // Caso contrario verificar se todos os beneficios do processo estao com a mesma
  // situacao
  if qryDet.RecordCount = 1
  then begin
     qry.FieldbyName('IdSitProcesso').AsInteger := iIdSitBenef;
     qry.FieldByName('Descricao').AsString      := vetDescBeneficio[iIdSitBenef];
  end
  else begin // processo possui + de 1 beneficio
     // Verificar se existem beneficios com situacoes diferentes
     iIdSitTemp := iIdSitBenef;
     bSituacoesDiferentes := False;
     qryDet.DisableControls;
     qryDet.First;
     while not qryDet.Eof do
     begin

        // Gleyber - 08/11/2006 - Pendência 23246 - Início
        If (qryDet.FieldByName('IDSITBENEFICIO').AsInteger = 3) Then
        Begin
          qryDet.Next;
          Continue;
        End;
        // Gleyber - 08/11/2006 - Pendência 23246 - Fim

        if (qryDet.FieldByName('IdSitBeneficio').AsInteger <> iIdSitTemp) and
           (not BeneficioDePagamentoUnico ( qryDet.FieldByName('IdBeneficio').AsInteger ) )
        then bSituacoesDiferentes := True;
        qryDet.Next;
     end;//while
     qryDet.EnableControls;

     if bSituacoesDiferentes
     then begin // existe + de 1 beneficio no processo e estao com situacoes diferentes
        MsgDlg('O Processo Nº '+IntToStr(iNumeroProcesso)+' possui benefícios com situações diferentes.' +
                  'Caso estas situações não sejam regularizadas o processo não terá sua situação alterada.',
                  'Informação', mtInformation, [mbOk], 0);
        TiraSQL(qryAux);
     end
     else begin // existe +  de 1 beneficio no processo mas todos estao com  a mesma situacao
        qry.FieldbyName('IdSitProcesso').AsInteger := iIdSitTemp;
        qry.FieldByName('Descricao').AsString      := vetDescBeneficio[iIdSitTemp];
     end;
  end; // else - if RecordCount = 1

  lblNumProcesso.Caption   := 'Processo Nº '+IntToStr(iNumeroProcesso);
  lblSitProcesso.Caption := 'Situação : '+qry.FieldByName('Descricao').AsString;

  // Gleyber - 14/04/2005 - Pendência 18306 - Início

  If Not RodaPadraoMovReserva( qryDet.FieldByName('IDPESSJUR').AsInteger,
                               qryDet.FieldByName('IDPLANOORIGEM').AsInteger,
                               qryDet.FieldByName('IDTITULAR').AsInteger,
                               qryDet.FieldByName('SEQPROPOSTA').AsInteger,
                               -1,
                               qry.FieldByName('IDEVENTOGERADOR').AsInteger,
                               -1,
                               qryDet.FieldByName('IDPLANOORIGEM').AsInteger,
                               qryEvento.FieldbyName('FLGINTERNO').AsString,
                               sDataPagamentoConcessao,
                               sMsgErro,
                               qryDet.FieldbyName('NUMEROPROCESSO').AsInteger,
                               'C',
                               dtDataFinal.Text )
  then begin
     MsgDlg('Ocorreram erros ao executar padrão de movimentação de reservas. '+#13+
            'O processo de concessão será cancelado até que o problema seja resolvido. ',
            'Erro',mtError,[mbOk],0);
     bbtnCancelarClick(Self);
     Exit;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQl.Add(' UPDATE BENEFBFCIARIO SET FLGMOVEURESERVA = 1 '+
                 ' WHERE  NUMEROPROCESSO = '+qryDet.FieldbyName('NUMEROPROCESSO').AsString+
                 ' AND    IDPESSJUR      = '+qryDet.FieldbyName('IDPESSJUR').AsString+
                 ' AND    IDPLANOPREV    = '+qryDet.FieldbyName('IDPLANOPREV').AsString+
                 ' AND    IDTITULAR      = '+qryDet.FieldbyName('IDTITULAR').AsString+
                 ' AND    IDPESSOA       = '+qryDet.FieldbyName('IDPESSOA').AsString+
                 ' AND    IDBENEFICIO    = '+qryDet.FieldbyName('IDBENEFICIO').AsString);
  Try
    qryAux.ExecSQL;
  Except
    MsgDlg('Ocorreram erros ao atualizar situação de movimento de reserva do processo. '+#13+
            'O processo de concessão será cancelado até que o problema seja resolvido. ',
            'Erro',mtError,[mbOk],0);
     bbtnCancelarClick(Self);
     Exit;
  End;
  // Gleyber - 14/04/2005 - Pendência 18306 - Fim

  sbtnConcedeUm.Down := False;
  MsgDlg('Benefício concedido com sucesso.', 'Informação',mtInformation,[mbOk, mbHelp],0);
  TiraSQL(qryAux);
end;

function TfrmCadRequerBenefBfciario.ConcedeUmBeneficio ( Sender : TObject; piIdSitBenef : integer ): boolean;
var sNomeSituacao               : string;
    rValorAtualizado,
    rValorAtualizadoTotal,
    rValorAtualizadoINSS,
    rValorAtualizadoTotalINSS   : double;
    sUltMesReajuste,
    sUltMesReajusteINSS         : string;
    bErro                       : boolean;
    varfields                   : variant;
    sMsgErro                    : String;  // Gleyber - 30/03/2004 - Pendência 16276
    iIdPlanPrevContab           : Integer; // Gleyber - 30/03/2004 - Pendência 16276

    sDataFinalATestar : String;
begin
  inherited;

  iIdCalculo      := -1;
  iIdCalculoGeral := -1;


  Result := False;
  // Se o pagamento for para Folha de Beneficio
  // Verificar se participante possui conta bancaria
  if (qryDet.FieldByName('FLGFORMAPAGTO').AsString = 'F') and
     (Trim(dblkpcmbPortForma.Text) = '') and
     (qryContaBancaria.IsEmpty)
  then begin
     MsgDlg(' Este beneficiário/recebedor não possui Conta Bancária cadastrada. '+
            ' Cadastre pelo menos uma conta para conceder o benefício.',
            'Informação',mtInformation,[mbOk],0);
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Se for um beneficio de resgate e tiver portador forma indicado
  // sugerir ao usuario que preencha a agencia para credito
  if (qryBeneficio.FieldByName('FlgResgate').AsInteger = 1) and
     (Trim(dblkpcmbPortForma.Text) <> '') and
     (Trim(dblkpcmbAgencia.Text) = '')
  then begin
     if MsgDlg(' Este participante não possui Agência para Crédito cadastrada. '+
               ' Deseja cadastrar antes de conceder o benefício ? ',
               'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes
     then begin
        sbtnConcedeUm.Down := False;
        TiraSQL(qryAux);
        Exit;
     end;
  end;

  qryBeneficio.Locate('IdBeneficio',qryDet.FieldByName('IdBeneficio').AsInteger,[loCaseInsensitive]);

  // Verificar se existem algum benefício obrigatorio no evento que não foi
  // requerido
  if not VerificaBeneficioObrigatorio
  then begin
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Executar regra de elegibilidade
  if (piIdSitBenef <> 4) and (piIdSitBenef <> 6)
  then bbtnElegibilidadeClick(Sender);

  if not bConcedeBeneficio
  then begin
     sbtnConcedeUm.Down := False;
     TiraSQL(qryAux);
     Exit;
  end;

  // Testar quitacao de dividas
  // Se, por algum motivo, o usuario disser que nao quer conceder,
  // manter a situacao = 4
//  if not TestaQuitacaoDividas then piIdSitBenef := 4;

  // Se a situacao do beneficio for "Concedido Normal" (sit = 1)
  // Preparar o beneficio inserindo-o na benefbfciario
  if piIdSitBenef = 1
  then begin
       // CAMILLE - 07.08.2002
       // Se o parametro do beneficio por plano (flgbenefinf) definir que
       //    o no. de beneficiarios elegiveis
       // Entao iNumBenef := qryBeneficiario.RecordCount, pois a qryBeneficiario
       //       está com os elegiveis
       // Senao, abrir uma query auxiliar com todos os beneficiarios do beneficios
       //       iNumBenef := numero total de beneficiarios

       qryAux.Close;
       qryAux.SQL.Clear;
       // CAMILLE - 07.08.2002
       qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BENEFBFCIARIO BF, BENEFPLANPREV BP  '+
                      ' WHERE  (BF.IDTITULAR      = '+IntToStr(iIdTitular)  +') '+
                      ' AND    (BF.IDPESSJUR      = '+IntToStr(iIdPessJur)  +') '+
                      ' AND    (BF.IDPLANOORIGEM  = '+IntToStr(iIdPlanoPrev)+') '+
                      ' AND    (BF.SEQPROPOSTA    = '+IntToStr(iSeqProposta)+') '+
                      ' AND    (BF.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+')'+
                      ' AND    (BF.IDBENEFICIO    = '+qryBeneficio.FieldByName('IdBeneficio').AsString+') '+
                      ' AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV) '+
                      ' AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO) '+
                      ' AND    ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  '
                      );
       qryAux.Open;

       iNumBenef := qryAux.RecordCount;

       if not qryBeneficio.Active then Exit;

       if (qryBeneficio.FieldByName('flgBenefInf').AsInteger = 0) and
          (qryBeneficio.FieldByName('IdBeneficio').AsString <> '')
       then begin
         qryAux.Close;
         qryAux.SQL.Clear;
         // CAMILLE - 07.08.2002
         qryAux.SQL.Add(' SELECT BF.IDPESSOA FROM BFCIARIOTITPLAN BF, BENEFPLANPREV BP '+
                        ' WHERE  (BF.IDTITULAR   = '+IntToStr(iIdTitular)  +') '+
                        ' AND    (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)  +') '+
                        ' AND    (BF.IDPLANOORIGEM = '+IntToStr(iIdPlanoPrev)+') '+
                        ' AND    (BF.SEQPROPOSTA = '+IntToStr(iSeqProposta)+') '+
                        ' AND    (BF.IDBENEFICIO = '+qryBeneficio.FieldByName('IdBeneficio').AsString+') '+
                        ' AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV) '+
                        ' AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO) '+
                        ' AND    ((BP.FLGREFERENCIA = 0) OR ( (BP.FLGREFERENCIA = 1) AND (BP.FLGPAGAINSS = 1) ) )  '
                        );
         qryAux.Open;
         iNumBenef := qryAux.RecordCount;
       end;

       iIdUsuarioAutoriza := VerificaVALORLimiteBeneficio ( qryAux,
                                                            frmCadRequerBenefBfciario.Caption,
                                                            qryDet.FieldByName('NumeroProcesso').AsInteger,
                                                            qryDet.FieldByName('IdPessJur').AsInteger,
                                                            qryDet.FieldByName('IdPlanoPrev').AsInteger,
                                                            qryDet.FieldByName('IdTitular').AsInteger,
                                                            qryDet.FieldByName('IdPessoa').AsInteger,
                                                            qryDet.FieldByName('IdBeneficio').AsInteger,
                                                            qryDet.FieldByName('ValorAtual').AsFloat,
                                                            True); // Requerimento = False, Outras = True
       if iIdUsuarioAutoriza < 0
       then begin
          MsgDlg('Concessão de Benefício não permitida por exceder valor limite e não ter autorização. Verifique. ','Erro',mtError,[mbOk],0);
          Abort;
       end;

       piIdSitBenef := EfetuaConcessao(piIdSitBenef,
                                    rValorAtualizado,
                                    rValorAtualizadoTotal,
                                    rValorAtualizadoINSS,
                                    rValorAtualizadoTotalINSS,
                                    sUltMesReajuste,
                                    sUltMesReajusteINSS,bErro);
       if bErro
       then begin
         sbtnConcedeUm.Down := False;
         TiraSQL(qryAux);
         Exit;
       end;
  end;

  // Se a situacao final do beneficio for 6 (nao concedido), devolver para
  // a reserva o valor que havia sido abatido
  if (piIdSitBenef = 6) and (qryDet.FieldByName('FlgResgate').AsInteger = 1)
  then begin
     if not DevolveReserva (qryDet.FieldByName('IdBeneficio').AsInteger,
                            qryDet.FieldByName('IdPessoa').AsInteger)
     then begin
        MsgDlg('Ocorreu um problema no acerto do saldo de reserva deste participante. '+
               'Para sua garantia o processo não será concedido até que o problema seja solucionado. '+
               'Verifique. ','Informação',mtInformation,[mbOk],0);
        sbtnConcedeUm.Down := False;
        TiraSQL(qryAux);
        Exit;
     end;
  end;

  // Gravar situacao final do beneficio na qryDet (BenefBfciario)
  qryDet.DisableControls;
  qryDet.Edit;

  // CAMILLE - 04.05.2004
  if iIdUsuarioAutoriza > 0
  then qryDet.FieldByName('USUARIOALT').AsInteger := iIdUsuarioAutoriza;

  // Se o preparo de beneficio atualizou o beneficio, gravar os dados
  // agora, pois senao o requerimento irá substitui-los
  { Inicio Augusto 10/03/2005 - Sempre atualizar os valores do beneficio }
  if Trim(sUltMesReajuste) <> '' then begin
     qryDet.FieldByName('ULTMESREAJUSTE').AsString   := sUltMesReajuste;
     qryDet.FieldByName('ULTVALORATUALREAJ').AsFloat := qryDet.FieldByName('ValorAtual').AsFloat;
  End;
  qryDet.FieldByName('VALORATUAL').AsFloat        := rValorAtualizado;
  qryDet.FieldByName('VALORCALCULADO').AsFloat    := rValorAtualizado;
  qryDet.FieldByName('VALORTOTAL').AsFloat        := rValorAtualizadoTotal;
  if qryBeneficio.FieldbyName('FLGCALCTODOMES').AsInteger = 1
  then rValorCotas := rValorAtualizado  // beneficio em cotas
  else rValorReal  := rValorAtualizado; // beneficio em real
  //end;
  { Fim Augusto 10/03/2005 }


  //leofuncef - 06072005 - inicio
  // Se o beneficio tem datafinal <= MESATUAL
  // Entao Se a data final for no mes ATUAL (mes do lote)
  //       Entao Se o parametro de concessao for para conceder até mes anterior
  //             Entao NAO ENCERRAR BENEFICIO e NAO PAGAR MES ATUAL
  //             Senao ENCERRAR BENEFICIO e PAGAR MES ATUAL
  //       Senao // data final anterior ao mes atual
  //             ENCERRAR BENEFICIO e PAGAR ULTIMO MES

  if qryDet.FieldByName('FlgDataPrevista').AsInteger = 1
  then sDataFinalATestar := FormatDateTime('dd/mm/yyyy', qryDet.FieldByName('DATAFINALPREVISTA').AsDateTime)  // 24334
  else sDataFinalATestar := FormatDateTime('dd/mm/yyyy', qryDet.FieldByName('DATAFINAL').AsDateTime);         // 24334

  If ( sDataFinalATestar = '30/12/1899' ) Then sDataFinalATestar := ''; { Augusto 05/04/2007 - Ajuste para tratar datas nulas }

  if (sDataFinalATestar <> '') and
     (Copy(sDataFinalATestar,7,4)+'/'+Copy(sDataFinalATestar,4,2) <= FormatDateTime('yyyy/mm', Date)) then  // 24334
  begin
     if (Copy(sDataFinalATestar,7,4)+'/'+Copy(sDataFinalATestar,4,2) = FormatDateTime('yyyy/mm', Date)) then  // 24334
     begin


        if iFlgIncluiMesConc = 0
        then begin
           qryDet.FieldByName('IdSitBeneficio').AsInteger := 1;
        end
        else begin
           if qryDet.FieldByName('FlgDataPrevista').AsInteger = 1
           then qryDet.FieldByName('IdSitBeneficio').AsInteger := 2
           else begin
              qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;


              if Trim(qryDet.FieldByName('DATAFINAL').AsString) = ''
              then qryDet.FieldByName('DATAFINAL').AsString := qryDet.FieldByName('DATAINICIO').AsString; // CAMILLE - 11.05.2004 - PENDENCIA 16764
           end;
        end;
     end
     else begin
        if qryDet.FieldByName('FlgDataPrevista').AsInteger = 1
        then qryDet.FieldByName('IdSitBeneficio').AsInteger := 2
        else begin
           qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;

           if Trim(qryDet.FieldByName('DATAFINAL').AsString) = ''
           then qryDet.FieldByName('DATAFINAL').AsString := qryDet.FieldByName('DATAINICIO').AsString; // CAMILLE - 11.05.2004 - PENDENCIA 16764
        end;
     end;
     piIdSitBenef := qryDet.FieldByName('IdSitBeneficio').AsInteger;
  end;
  //leofuncef - 06072005 - fim


  qryDet.FieldByName('IdSitBeneficio').AsInteger := piIdSitBenef;
  qryDet.FieldByName('Descricao').AsString := vetDescBeneficio[piIdSitBenef];

   // André Pontes - 18/07/2006 - pendência 22739
   // Não estava gravando a concessão se a data de término do benefício fosse anterior a hoje, ie,
   // se o benefício já fosse concedido encerrado. Gleyber: a data de concessão deve ser sempre
   // gravada (pq pode ser concessão retroativa)
//  if piIdSitBenef = 1
//  then qryDet.FieldByName('DataConcessao').AsDateTime := Date;
   qryDet.FieldByName('DataConcessao').AsDateTime := Date;
   // FIM André Pontes - 18/07/2006 - pendência 22739

  //Bruno Bastos - Pend. 18314 e 16939 - 31/01/2005 - Início
  // Gleyber - 17/02/2005 - Pendência 18314 - Inicio
  If FazQuery(qryAux, ' SELECT BF.IDSITBENEFICIO, BF.VALORATUAL '+
                      ' FROM BENEFBFCIARIO BF, MOVBENEF MB '+
                      ' WHERE BF.IDPESSOA       = '+qryDet.FieldByName('IdPessoa').AsString+
                      '   AND BF.IDBENEFICIO    = '+qryDet.FieldByName('IdBeneficio').AsString+
                      '   AND BF.NUMEROPROCESSO = '+qryDet.FieldByName('NumeroProcesso').AsString+
                      '   AND BF.IDPESSOA       = MB.IDPESSOA '+
                      '   AND BF.IDBENEFICIO    = MB.IDBENEFICIO '+
                      '   AND BF.NUMEROPROCESSO = MB.NUMEROPROCESSO '+
                      '   AND MB.MOTRETENC      = 8') Then
  // Gleyber - 17/02/2005 - Pendência 18314 - Fim
  Begin
    If qryaux.FieldByName('IdSitBeneficio').AsInteger = 3 Then
    Begin
      rValorReal                                     := qryAux.FieldByName('valoratual').AsFloat;
      rValorCotas                                    := qryAux.FieldByName('valoratual').AsFloat;
      qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;
      qryDet.FieldByName('DATAFINAL').AsString       := qryDet.FieldByName('DATAINICIO').AsString; // CAMILLE - 11.05.2004 - PENDENCIA 16764
    End;
  End;
  //Bruno Bastos - Pend. 18314 e 16939 - 31/01/2005 - Fim

   // REFER - 19.01.2001
   // Se o beneficio for de pagamento unico, colocar como encerrado, porque a
   // folha de beneficio nao encerra
   //if BeneficioDePagamentoUnico ( qryDet.FieldByName('IdBeneficio').AsInteger )
   //then qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;

   //leorefer - inicio - 2711
   //verifica o cadastro e não a forma de pgto do benefício
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT T.FLGFREQUENCIA '+
                 ' FROM   TPPAGTOBENEFICIO T   '+
                 ' WHERE  T.IDTPPAGTOBENEFIC = '+IntToStr(qrydet.FieldByName('IdTpPagtoBenefic').AsInteger));
   qryAux.Open;

   if (qryAux.FieldByName('FlgFrequencia').AsString = 'U')
   then
   begin
      qryDet.FieldByName('IdSitBeneficio').AsInteger := 3;
      piIdSitBenef := 3;
   end;
   //leorefer - fim - 2711

  // Gleyber - 30/03/2004 - Pendência 16276 - Início
  // Regra para indicar Entidade Contábil/Financeira.
  // Se não houver regra cadastrada gravar nulo senão
  // executar regra

  If Trim(qryBeneficio.FieldByName('IDRGPLANPREVCONT').AsString) <> ''
   Then Begin
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
                                                     FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),       // 24334
                                                     FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),       // 24334
                                                     sDataDemissao,
                                                     FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date), // 24334
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
                                                     sMsgErro);
     If bErro
      Then MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0)
      Else qryDet.FieldByName('IDPLANPREVCONTAB').AsInteger := iIdPlanPrevContab;
   End;

  // Gleyber - 30/03/2004 - Pendência 16276 - Fim

  { Inicio Augusto 24/04/2007 - No caso de concessão fora do convênio com o INSS }
  { automáticamente reter beenficio e gerar motivmento de retenção com motivo 11 }
  { (Fora do convênio).                                                          }

  If ( QryDet.FieldByName('FLGPAGAINSS').AsInteger = 0 ) And
     ( QryBeneficio.FieldByName('FLGPAGAINSS').AsInteger = 1 ) And
     ( QryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1 ) Then
  Begin

    Try
      CriaLogOcorrencia( qryDet.FieldByName('IDPLANOORIGEM').AsString,
                         qryDet.FieldByName('IDPESSJUR').AsString,
                         qryDet.FieldByName('IDTITULAR').AsString,
                         qryDet.FieldByName('IDBENEFICIO').AsString,
                         qryDet.FieldByName('NUMEROPROCESSO').AsString,
                         qryDet.FieldByName('IDPESSOA').AsString,
                         qryDet.FieldByName('SEQPROPOSTA').AsString,
                         '3',
                         FormatDateTime('DD/MM/YYYY', Date),
                         qryDet.FieldByName('VALORATUAL').AsString,
                         qryDet.FieldByName('VALORTOTAL').AsString,
                         qryDet.FieldByName('VALORCOTAS').AsString,
                         qryDet.FieldByName('DATAINICIO').AsString,
                         qryDet.FieldByName('DATAFINAL').AsString,
                         qryDet.FieldByName('VALORATUAL').AsString,
                         qryDet.FieldByName('DATAINICIO').AsString,
                         qryDet.FieldByName('DATAFINAL').AsString,
                         QryDet.FieldByName('IDSITBENEFICIO').AsString,
                         qryDet.FieldByName('FLGDATAPREVISTA').AsInteger,
                         qryAux, '11',
                         iIdLoteConcessao,
                         iIdCalculo,
                         False,
                         qryDet.FieldByName('USUARIOALT').AsInteger,
                         iFlgEmprestimo );
    Except
      frmAguarde.Apaga;
      dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Erro no registro da Retenção.','Erro',mtError,[mbOk],0);
      TiraSQL(qryAux);
      Exit;
    End;

    QryDet.FieldByName('IDSITBENEFICIO').AsInteger := 2;
    QryDet.FieldByName('DESCRICAO').AsString       := VetDescBeneficio[2];

  End;

  { Fim Augusto 24/04/2007                                                       }

  qryDet.Post;
  qryDet.EnableControls;

  varFields    := VarArrayCreate([0,1],varVariant);
  varFields[0] := iIdBenefReferencia;
  varFields[1] := qryDet.FieldByName('IdPessoa').AsInteger;

  if qryBenefReferencia.Locate('IdBeneficio;IdPessoa',varFields,[loCaseInsensitive])
  then begin
     qryBenefReferencia.Edit;
     qryBenefReferencia.FieldByName('IDSITBENEFICIO').AsInteger  := 6;

   // André Pontes - 18/07/2006 - pendência 22739
   // Não estava gravando a concessão se a data de término do benefício fosse anterior a hoje, ie,
   // se o benefício já fosse concedido encerrado. Gleyber: a data de concessão deve ser sempre
   // gravada (pq pode ser concessão retroativa)
//  if piIdSitBenef = 1
//  then qryBenefReferencia.FieldByName('DataConcessao').AsDateTime := Date;
   qryBenefReferencia.FieldByName('DataConcessao').AsDateTime := Date;
   // FIM André Pontes - 18/07/2006 - pendência 22739

     if Trim(sUltMesReajusteINSS) <> ''
     then begin
        qryBenefReferencia.FieldByName('UltMesReajuste').AsString   := sUltMesReajusteINSS;
        qryBenefReferencia.FieldByName('ULTVALORATUALREAJ').AsFloat := qryBenefReferencia.FieldByName('ValorAtual').AsFloat;
        qryBenefReferencia.FieldByName('ValorAtual').AsFloat        := rValorAtualizadoINSS;
        qryBenefReferencia.FieldByName('ValorCalculado').AsFloat    := rValorAtualizadoINSS;
        qryBenefReferencia.FieldByName('valortotal').AsFloat        := rValorAtualizadoTotalINSS;
     end;

     qryBenefReferencia.Post;

     bGravaBenefReferencia := True;
  end; // with


  Result := True;
end;


Function TfrmCadRequerBenefBfciario.CalculaReservaParaBeneficio : double;
Var
  dTotReservaReal, dValorReservaCota, dValorDaCota    : double;

  sDataRef, sDataInicio, sDataCancelamento,
  sValorProvento,    sValorAtualReserva,
  sValorReservaCota, sValorTotReservaReal,

  sSQLReserva     : string;

  bErro           : boolean;
  iNumReg, iTotReserva,
  iFlgUltimo      : integer;

  varfields       : variant;

begin

   Result := 0;

   if qryReservaPart.IsEmpty
   then Exit;

   if FormatDateTime( 'DD/MM/YYYY', Qry.FieldByName('DTEVENTO').AsDateTime ) <> ''
   then sDataRef := FormatDateTime('dd/mm/yyyy', qry.FieldByName('DTEVENTO').AsDateTime)
   else sDataRef := FormatDateTime('dd/mm/yyyy', Date);

   if qryBeneficio.FieldByName('IDREGRAPAGAMENTO').AsString <> '' then
   begin

     if Trim(dtInicioFund.Text) <> ''
     then sDataInicio := FormatDateTime('dd/mm/yyyy', dtInicioFund.Date)
     else sDataInicio := sDataRef;

     sValorProvento := CalcSALPART( iIdPessJur, iIdTitular,
                                    Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2),
                                    qryAux );
     sSQLReserva := '';
     iNumReg     := 0;
     iFlgUltimo  := 0;
     iTotReserva := qryReservaPart.RecordCount;

     qryReservaPart.First;

     If qryBeneficio.FieldByName('FLGDESINDRES').AsInteger = 1
     Then DesindexaReserva;

     { Executar a regra de reserva para beneficio, para cada reserva.                  }

     { A regra retornará o valor em cotas que será retirado da reserva para calcular   }
     { o valor do benefício. Este valor será guardado na MOVRESERVATEMP                }

     { Quando acabar de executar a regra para todas as reservas, executá-la mais       }
     { uma vez para a regra retornar o valor total em real da reserva para benefício   }


     while (not qryReservaPart.Eof) or (iNumReg <= iTotReserva) do
     begin
        inc(iNumReg);

        { Quando a variavel iNumReg for > que a variavel iTotReserva significa }
        { que já rodei a regra para todas as reservas e estou rodando a ultima }
        { vez para pegar o total em real das reservas                          }
        if iNumReg > iTotReserva
        then iFlgUltimo := 1;


        if iFlgUltimo = 1 then { Última passada, passar Somatório como sendo o valor da reserva }
        begin
           sValorAtualReserva := OraNumero(FloatToStr(dTotReservaReal));
        end
        else
        begin

           varFields := VarArrayCreate([0,1],varVariant);
           varFields[0] := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger;
           varFields[1] := qryReservaPart.FieldByName('IDTIPORESERVA').AsInteger;

           if qryMovReservaTemp.Locate('IDBENEFICIO;IDTIPORESERVA',varFields , [loCaseInsensitive])
           then sValorAtualReserva := OraNumero(qryMovReservaTemp.FieldByName('VLRORIGINAL').AsString)
           else sValorAtualReserva := OraNumero(qryReservaPart.FieldByName('VALORRESERVA').AsString);

        end;

        sDataCancelamento := qryTitular.FieldByName('DATACANCELAMENTO').AsString;
        If sDataCancelamento = '' Then sDataCancelamento := ' ';

        sSQLReserva := ' SELECT '+IntToStr(iNumReg)+' AS CONTRESERVA, '+
                       IntToStr(iFlgUltimo)+' AS ULTRESERVA, '+
                       qryReservaPart.FieldByName('IdTipoReserva').AsString+ ' AS IDTIPORESERVA,    '+
                       qryReservaPart.FieldByName('IdPessJur').AsString    + ' AS IDPESSJUR,        '+
                       qryReservaPart.FieldByName('IdPlanoPrev').AsString  + ' AS IDPLANOPREV,      '+
                       qryReservaPart.FieldByName('IdPessoa').AsString     + ' AS IDPESSOA,         '+
                       qryReservaPart.FieldByName('IDPESSOA').AsString     + ' AS IDTITULAR,        '+
                       qryReservaPart.FieldByName('SeqProposta').AsString  + ' AS SEQPROPOSTA,   '+
                       ''+qryReservaPart.FieldByName('FLGDESCIRRF').AsString+ ' AS FLGDESCIRRF, '+
                       qryBeneficio.FieldByName('IdBeneficio').AsString+ ' AS IDBENEFICIO,          '+
                       OraNumero(sValorProvento) + ' AS VALORPROVENTO,                              '+
                       sValorAtualReserva        + ' AS VALORRESERVA,                               '+
                       ''''+qryReservaPart.FieldByName('MoeSigla').AsString+ '''         AS MOESIGLA,     '+
                       ''''+PreparaStrRegra(sDataInicio)+ '''       AS DATAINICIO,                                         '+
                       ''''+PreparaStrRegra(sDataRef)+ '''          AS DATAREF,                                            '+
                       ''''+PreparaStrRegra(qryReservaPart.FieldByName('DATAREFERENCIASA').AsString)+ ''' AS DATAREFERENCIASA, '+
                       ''''+PreparaStrRegra(qryReservaPart.FieldByName('DATANASC').AsString) +''' AS DATANASC,       '+
                       ''''+PreparaStrRegra(qryTitular.FieldByName('INSCRICAODATA').AsString)+''' AS INSCRICAODATA,       '+
                       ''''+ PreparaStrRegra(sDataCancelamento) +'''    AS DATACANCELAMENTO, '+
                       ''''+PreparaStrRegra(qryReservaPart.FieldByName('DATAADMISSAO').AsString)  +'''    AS DATAADMISSAO,   '+
                       ''''+qryReservaPart.FieldByName('CODHIERARQUIA').AsString +'''    AS CODHIERARQUIA,  '+
                       ''+OraNumero(qryReservaPart.FieldByName('INDICEREAJUSTE').AsString)+'    AS INDICEREAJUSTE, '+
                       ''+OraNumero(qryReservaPart.FieldByName('FLGCONTROLE').AsString)   +'    AS FLGCONTROLE,    '+
                       ''''+PreparaStrRegra(Trim(dtDataRequerimento.Text))   +''' AS DATAREQUERIMENTO,              '+
                       ''''+PreparaStrRegra(Trim(dtDataInicio.Text))         +''' AS DATAINICIOPAGTO, '+
                       ''''+PreparaStrRegra(sFlgInternoAntes)+'''  AS FLGINTERNOANT, '+
                       ''''+PreparaStrRegra(sFlgInternoDepois)+''' AS FLGINTERNO, '+
                       ''+PreparaStrRegra(sIdSitPartAntes)+'   AS IDSITPARTATUAL, '+
                       ''+PreparaStrRegra(sIdSitPlanAntes)+'   AS IDSITPLANOATUAL, '+
                       ''+PreparaStrRegra(sIdSitFuncAntes)+'   AS IDSITFUNCATUAL, '+
                       ''+PreparaStrRegra(sIdSitPartDepois)+'  AS IDSITPARTNOVO, '+
                       ''+PreparaStrRegra(sIdSitPlanDepois)+'  AS IDSITPLANONOVO, '+
                       ''+PreparaStrRegra(sIdSitFuncDepois)+'  AS IDSITFUNCNOVO, '+
                       ''''+OraNumero(qryReservaPart.FieldByName('PERCENTUALSAQUE').AsString)+'''   AS PERCENTUALSAQUE, '+
                       QuotedStr(dtDataFinal.Text)+ ' AS DATAFINAL,  '+

                       OraNumero(FloatToStr(rOpcao1))+ ' AS VALORBASE1, '+
                       OraNumero(FloatToStr(rOpcao2))+ ' AS VALORBASE2, '+
                       OraNumero(FloatToStr(rOpcao3))+ ' AS VALORBASE3, '+

                       qryBeneficiario.FieldByName('PERCENTUAL').AsString+'  AS PERCENTUAL, '+
                       IntToStr(iNumBenef) +' AS NUMBENEF '+

                       ' FROM DUAL ';

        if iNumReg <=  iTotReserva
        then begin
           sValorReservaCota    := RegraNumerica( qryBeneficio.FieldByName('IdRegraPagamento').AsString,
                                                  sSQLReserva, bErro, iIdCalculo );
           if bErro
           then begin
              MsgDlg('Erro na Regra de Cálculo de Reserva para Benefício Nº '+qryBeneficio.FieldByName('IdRegraPagamento').AsString+'.',
                     'Erro',mtError,[mbOk, mbHelp],0);
              dValorReservaCota := 0;
              break;
           end
           else dValorReservaCota := StrToFloat(ClienteNumero(sValorReservaCota));

           dTotReservaReal := dTotReservaReal + dValorReservaCota;

           if (qryBeneficio.FieldByName('FlgResgate').AsInteger = 1)
           then begin

              varFields := VarArrayCreate([0,1],varVariant);
              varFields[0] := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
              varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;

              if qryMovReservaTemp.Locate('IDBENEFICIO;IDTIPORESERVA',varFields , [loCaseInsensitive, loPartialKey])
              then begin
                 qryMovReservaTemp.Edit;
                 qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := ( qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat +
                                                                                  dValorReservaCota );
                 qryMovReservaTemp.Post;
              end
              else begin
                 qryMovReservaTemp.Insert;
                 qryMovReservaTemp.FieldByName('IDMOVRESERVATMP').AsInteger  := LeUltRegistro(qryAux,'MOVRESERVATEMP');
                 qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsInteger    := qryReservaPart.FieldByName('IDTIPORESERVA').AsInteger;
                 qryMovReservaTemp.FieldByName('IDPESSJUR').AsInteger        := iIdPessJur;
                 qryMovReservaTemp.FieldByName('IDPLANOPREV').AsInteger      := iIdPlanoPrev;
                 qryMovReservaTemp.FieldByName('IDTITULAR').AsInteger        := iIdTitular;
                 qryMovReservaTemp.FieldByName('IDPESSOA').AsInteger         := iIdPessoa;
                 qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsInteger      := iSeqProposta;
                 qryMovReservaTemp.FieldByName('NUMEROPROCESSO').AsInteger   := iNumeroProcesso;
                 qryMovReservaTemp.FieldByName('IDBENEFICIO').AsInteger      := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger;
                 qryMovReservaTemp.FieldByName('DATAMOV').AsDateTime         := StrToDate(sDataRef);
                 qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := dValorReservaCota;
                 qryMovReservaTemp.FieldByName('VLRORIGINAL').AsFloat        := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                 qryMovReservaTemp.Post;
              end;
           end;

           qryReservaPart.Next;

        end
        else begin

           sValorTotReservaReal := RegraNumerica( qryBeneficio.FieldByName('IdRegraPagamento').AsString,
                                                  sSQLReserva, bErro, iIdCalculo );
           if bErro
           then begin
              MsgDlg('Erro na Regra de Cálculo de Reserva para Benefício Nº '+qryBeneficio.FieldByName('IdRegraPagamento').AsString+'.',
                     'Erro',mtError,[mbOk, mbHelp],0);
              dTotReservaReal := 0;
              break;
           end
           else dTotReservaReal := StrToFloat(ClienteNumero(sValorTotReservaReal));

        end;

     end; { while (not qryReservaPart.Eof) or (iNumReg <= iTotReserva) do }

   end
   else
   begin

       { Não possui Regra. Então retirar todo o valor das reservas e retornar }
       { o somatório de todas as reservas em Real.                            }
       
       dTotReservaReal := 0;
       qryReservaPart.First;

       while not qryReservaPart.Eof do
       begin

           if qryReservaPart.FieldByName('FLGCONTROLE').AsInteger = 1
           then begin
              qryReservaPart.Next;
              continue;
           end;

           if qryReservaPart.FieldByName('ValorReserva').AsString <> ''
           then begin
              dValorDaCota  := VoltaValorCotacao(qryaux,
                                                 qryReservaPart.FieldByName('INDICEREAJUSTE').AsString,'','',
                                                 FormatDateTime('dd/mm/yyyy', dtDataEvento.Date)
                                                );

              dTotReservaReal := dTotReservaReal + (  qryReservaPart.FieldByName('ValorReserva').AsFloat
                                                    * dValorDaCota );

              if (qryBeneficio.FieldByName('FlgResgate').AsInteger = 1)
              then begin

                 varFields := VarArrayCreate([0,1],varVariant);
                 varFields[0] := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
                 varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;

                 if qryMovReservaTemp.Locate('IDBENEFICIO;IDTIPORESERVA',varFields , [loCaseInsensitive, loPartialKey])
                 then begin
                    qryMovReservaTemp.Edit;
                    qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                    qryMovReservaTemp.Post;
                 end
                 else begin
                    qryMovReservaTemp.Insert;
                    qryMovReservaTemp.FieldByName('IDMOVRESERVATMP').AsInteger  := LeUltRegistro(qryAux,'MOVRESERVATEMP');
                    qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsInteger    := qryReservaPart.FieldByName('IDTIPORESERVA').AsInteger;
                    qryMovReservaTemp.FieldByName('IDPESSJUR').AsInteger        := iIdPessJur;
                    qryMovReservaTemp.FieldByName('IDPLANOPREV').AsInteger      := iIdPlanoPrev;
                    qryMovReservaTemp.FieldByName('IDTITULAR').AsInteger        := iIdTitular;
                    qryMovReservaTemp.FieldByName('IDPESSOA').AsInteger         := iIdPessoa;
                    qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsInteger      := iSeqProposta;
                    qryMovReservaTemp.FieldByName('NUMEROPROCESSO').AsInteger   := iNumeroProcesso;
                    qryMovReservaTemp.FieldByName('IDBENEFICIO').AsInteger      := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger;
                    qryMovReservaTemp.FieldByName('DATAMOV').AsDateTime         := StrToDate(sDataRef);
                    qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                    qryMovReservaTemp.FieldByName('VLRORIGINAL').AsFloat        := qryReservaPart.FieldByName('ValorReserva').AsFloat;
                    qryMovReservaTemp.Post;
                 end;

              end;

           end;
           qryReservaPart.Next;

       end; { while not qryReservaPart.Eof do }

   end;


   try
     OraNumero(FloatToStr(dTotReservaReal));
   except
     MsgDlg('O valor calculado para a reserva é inválido. ','Erro',mtError,[mbOk],0);
     Exit;
   end;

   Result := dTotReservaReal;
   
end;

function TfrmCadRequerBenefBfciario.AtualizaReservaPart ( piIdBeneficio : longint ) : boolean;
begin
   Result := False;
   qryMovReservaTemp.First;
   while not qryMovReservaTemp.Eof do
   begin
      if qryMovReservaTemp.FieldByName('IdBeneficio').AsInteger <> piIdBeneficio
      then begin
         qryMovReservaTemp.Next;
         continue;
      end;

      if not qryReservaPart.Locate('IdTipoReserva',qryMovReservaTemp.FieldByName('IdTipoReserva').AsInteger,[loCaseInsensitive])
      then begin
         qryMovReservaTemp.Next;
         continue;
      end;

      qryReservaPart.Edit;

      // Só zerar o saldo se o valor original era positivo, pois no caso da CBS pode existir reserva originalmente positivo
      if (( qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat - qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat ) < 0) and // CAMILLE - CBS - 28.11.2001
          (qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat > 0 )
      then qryReservaPart.FieldByName('ValorReserva').AsFloat := 0
      else qryReservaPart.FieldByName('ValorReserva').AsFloat := qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                                               - qryMovReservaTemp.FieldByName('VlrAbatido').AsFloat;
      qryReservaPart.Post;

      qryMovReservaTemp.Next;
   end; // while

   Result := True;
end;

procedure TfrmCadRequerBenefBfciario.bbtnOutrasInformacoesClick(
  Sender: TObject);
var sDataInicioAnt,
    sValorAnt,
    sNomeBenefAnt,
    sIdTpPagtoAnt,
    sFlgBenefMinAnt,
    sUltMesReajAnt,
    sDataEventoAnt,
    sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
    sCodBeneficioAnt     : string;

    sValorBase1Ant, sValorBase2Ant, sValorBase3Ant : string;

    iTotalBenef : longint;
begin
  inherited;

  BuscaDadosBeneficioAnterior ( qryAux,
                                iIdPessJur, iIdPlanoPrev, iIdTitular,
                                qryDet.FieldByName('IdBeneficio').AsInteger,
                                qryBeneficio.FieldByName('FlgReferencia').AsInteger,
                                FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),  // 24334
                                sDataInicioAnt,
                                sValorAnt, sNomeBenefAnt,
                                sIdTpPagtoAnt,
                                sUltMesReajAnt,
                                sFlgBenefMinAnt,
                                sDataEventoAnt,
                                sCodBeneficioAnt,
                                sValorBase1Ant, sValorBase2Ant, sValorBase3Ant,
                                sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
                                True );

  if sDataInicioAnt = ''
  then begin
     sDataInicioAnt := qryDet.FieldByName('DibBenefAnt').AsString;
     sValorAnt      := ClienteNumero(qryDet.FieldByName('ValorBenefAnt').AsString);
  end;

  // Exibir dados do benefício anterior. Deixar o usuário informar tais dados
  frmPedeDadosBenefAnterior := TfrmPedeDadosBenefAnterior.Create(Application);
  with frmPedeDadosBenefAnterior do
  begin
     if Trim(sDataInicioAnt) = ''
     then begin
        lblNomeBenefAnt.Caption := 'Benefício Anterior não Encontrado no Banco de Dados da Fundação';
        lblTituloBenef.Caption  := 'Salário de Benefício';
     end
     else begin
        lblNomeBenefAnt.Caption := sNomeBenefAnt;
        lblTituloBenef.Caption  := 'Renda Mensal Inicial';
     end;

     dtDibBenefAnt.Text           := sDataInicioAnt;
     edValorBenefAnt.Text         := ClienteNumero(sValorAnt);

     if (qryBeneficio.FieldByName('FlgReferencia').AsInteger = 0) or (prmNumOPINSS = 0)
     then begin
        grpParamINSS.Visible := False;
        Height               := 184;
     end
     else begin
        grpParamINSS.Visible := True;
        Height               := 344;

        iTotalBenef          := qryBeneficiario.RecordCount;

        sSQLOpcaoINSS        := ' SELECT PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA,  '+
          '        PP.INSCRICAOTIPO,                                                                   '+
          '        PF.DATANASC, PF.SEXO,  PF.DATAMORTE, PP.IDPESSOA AS IDTITULAR,  PP.SALPARTICIPACAO, '+
          '        PP.SALPARTICIPACAO AS VALORPROVENTO,                                                '+
          '        EL.SALTOTAL,  EL.DATAADMISSAO, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,'+
          '        EL.TEMPOSERVTOTAL,  EL.DATADEMISSAO, SP.FLGINTERNO, '+
          '        EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
          '        PP.IDPESSOA AS IDTITULAR, '+
          qryBeneficio.FieldByName('IdBeneficio').AsString +  ' AS IDBENEFICIO,      '+
          IntToSTr(iNumeroProcesso)                        +  ' AS NUMEROPROCESSO ,  '+
          IntToSTr(1)                                      +  ' AS FLGTIPOINSS,      '+
          QuotedStr(FormatDateTime('dd/mm/yyyy', dtDataEvento.Date))            + ' AS DATAREF,          '+  // 24334
          QuotedStr(FormatDateTime('dd/mm/yyyy', dtInicioFund.Date))            + ' AS DATAINICIO,       '+  // 24334
          QuotedStr(FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date))            + ' AS DATAINICIOINSS,   '+  // 24334
          QuotedStr(FormatDateTime('dd/mm/yyyy', dtDataInicio.Date))            + ' AS DATAINICIOPAGTO,  '+  // 24334
          QuotedStr(FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date))      + ' AS DATAREQUERIMENTO, '+  // 24334
          IntToStr(iTotalBenef)                            +'   AS NUMBENEF           '+ // FUNCEF - 02.02.2001
          ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF  '+
          ' WHERE  PP.IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND '+
          '        PP.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND '+
          '        PP.IDPESSOA    = ' + IntToStr(iIdTitular)   + ' AND '+
          '        PP.SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND '+
          '        EL.IDPESSJUR   = PP.IDPESSJUR         AND '+
          '        EL.IDPESSOA    = PP.IDPESSOA          AND '+
          '        PF.IDPESSOA    = EL.IDPESSOA              ';

        if prmNumOpINSS >= 1
        then begin
           lblNomeBINSS1.Visible := True;
           edOpcao1.Visible      := True;
           lblNomeBINSS1.Caption :=  prmNOMEBINSS1;
           edOpcao1.Text         := ClienteNumero(sValorBase1Ant);
           edOpcao1.Enabled      := prmFLGEDITABINSS1;
        end;

        if prmNumOpINSS >= 2
        then begin
           lblNomeBINSS2.Visible := True;
           edOpcao2.Visible      := True;
           lblNomeBINSS2.Caption :=  prmNOMEBINSS2;
           edOpcao2.Text         := ClienteNumero(sValorBase2Ant);
           edOpcao2.Enabled      := prmFLGEDITABINSS2;
        end;

        if prmNumOpINSS >= 3
        then begin
           lblNomeBINSS3.Visible := True;
           edOpcao3.Visible      := True;
           lblNomeBINSS3.Caption :=  prmNOMEBINSS3;
           edOpcao3.Text         := ClienteNumero(sValorBase3Ant);
           edOpcao3.Enabled      := prmFLGEDITABINSS3;
        end;
     end;

     ShowModal;

     if ModalResult = mrOk
     then begin
        qryDet.FieldByName('DibBenefAnt').AsString := dtDibBenefAnt.Text;
        qryDet.FieldByName('ValorBenefAnt').AsFloat := StrtoFloat(ClienteNumero(edValorBenefAnt.Text));
        qryDet.FieldByName('VALORBINSSANT1').AsFloat := StrToFloat(ClienteNumero(edOpcao1.Text));
        qryDet.FieldByName('VALORBINSSANT2').AsFloat := StrToFloat(ClienteNumero(edOpcao2.Text));
        qryDet.FieldByName('VALORBINSSANT3').AsFloat := StrToFloat(ClienteNumero(edOpcao3.Text));
     end;

     Free;
  end; // with
end;

procedure TfrmCadRequerBenefBfciario.bbtnCancelarClick(Sender: TObject);
begin
  if (sTipoFormChamador = 'SI') and (not bPerguntouCancelar)
  then begin
     bPerguntouCancelar := True;
     if MsgDlg('Deseja guardar as informações de Tempo de Serviço informadas para a Simulação ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then begin
        dtmAPrev.qry.Close;
        dtmAPrev.qry.Sql.Clear;
        dtmAPrev.qry.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVTOTAL   = '+ sTempoServAnoAntes +', '+
                             '                      TEMPOSERVTOTMES  = '+ sTempoServMesAntes +', '+
                             '                      TEMPOSERVTOTDIA  = '+ sTempoServDiaAntes +
                             ' WHERE IDPESSJUR = ' + IntToStr(iIdPessJur) +
                             ' AND   IDPESSOA  = ' + IntToStr(iIdTitular) );
        try
           dtmAPrev.qry.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;
     end;
  end;

  inherited;

end;

procedure TfrmCadRequerBenefBfciario.sbtnImprimirSimulacaoClick(
  Sender: TObject);
var sArquivoTemp,
    sSQLTemp,
    sSQL : string;
    iIdReports,
    iOrigemCM          : longint;
begin
  inherited;

  // Verificar se existe relatorio parametrizavel para Simulacao de Beneficio
  if Trim(sNumeroProcessoAntesGravar) = ''
  then sNumeroProcessoAntesGravar := IntToStr(iNumeroProcesso);

  with qryAux do
  begin
     Close;
     SQL.Clear;
     // Pegar id do relatorio
     SQL.Add(' SELECT MAX(BP.IDRELATBENEFICIO) AS IDRELATBENEFICIO, MAX(ORIGEMCMBENEFICIO) AS ORIGEMCMBENEFICIO '+
             ' FROM   BENEFPLANPREV BP, BENEFBFCIARIO BF                              '+
             ' WHERE  BF.NUMEROPROCESSO = '+sNumeroProcessoAntesGravar+
             ' AND    BF.IDPLANOORIGEM    = BP.IDPLANOPREV '+
             ' AND    BF.IDBENEFICIO    = BP.IDBENEFICIO ');
     Open;
     if FieldByName('IdRelatBeneficio').AsInteger <= 0
     then begin
        MsgDlg('Não existe relatório parametrizado para Simulação de Benefício. Verifique no Cadastro de Planos Previdenciários. ', 'Erro',mtError,[mbOk],0);
        sbtnImprimirSimulacao.Down := False;
        qryAux.Close;
        Exit;
     end;
  end;

  // Verificar se foi gerado um IdCalculo para este módulo
  if (iIdCalculo <= 0) and (qryRelBenefPart.IsEmpty)
  then begin
     MsgDlg('A Regra de Simulação não gravou, em nenhum passo, os dados de sua execução. Verifique.', 'Erro',mtError,[mbOk],0);
     sbtnImprimirSimulacao.Down := False;
     qryAux.Close;
     Exit;

     if iIdCalculo <= 0 then iIdCalculo := qryRelBenefPart.FieldByName('IdCalculo').AsInteger;
  end;

  iIdReports := qryAux.FieldByName('IdRelatBeneficio').AsInteger;
  iOrigemCM  := qryAux.FieldByName('OrigemCMBeneficio').AsInteger;

  // Abrir query com SQL do relatorio
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT D.TEMPLATE AS SQL '+
             ' FROM   REPORTS R, DATAVIEW D        '+
             ' WHERE  R.IDREPORTS  = '+ IntToStr(iIdReports)+
             ' AND    R.ORIGEMCM   = '+ IntToStr(iOrigemCM) +
             ' AND    D.IDDATAVIEW = R.IDDATAVIEW '+
             ' AND    D.ORIGEMCMDV = R.ORIGEMCMDV ');
     Open;
     sSQL := FieldByName('SQL').AsString;
  end;

  // Abrir query com LAY-OUT do relatorio. Para isto, o campo TEMPLATE tem
  // que estar no FieldsEditor e a query tem que ser RequestLive
  with dtmRelatAdmPREV2.qryDoUsuario do
  begin
     Close;
     ParamByName('IdReports').AsInteger := iIdReports;
     ParamByName('OrigemCM').AsInteger  := iOrigemCM;
     Open;
     if IsEmpty
     then begin
        MsgDlg('Faltam parâmetros para o relatório parametrizado para Simulação de Benefício. Verifique no Cadastro de Planos Previdenciários. ', 'Erro',mtError,[mbOk],0);
        sbtnImprimirSimulacao.Down := False;
        qryAux.Close;
        Close;
        Exit;
     end;
  end;

  with dtmRelatAdmPREV2 do
  begin
     sArquivoTemp := Sistema.TempDir+'APrevRelSimulaBenef.tmp';
     sSQLTemp     := Sistema.TempDir+'APrevSQLRelSimulaBenef.sql';
     qryDoUsuarioTEMPLATE.SaveToFile(sArquivoTemp);

     qryRelatParametrizavel.Close;
     qryRelatParametrizavel.SQL.Clear;
     qryRelatParametrizavel.SQL.Text := sSQL;
     qryRelatParametrizavel.SQL.Add(' AND DETCALCULO.IDCALCULO = '+IntTostr(iIdCalculo));
     qryRelatParametrizavel.SQL.Add(' AND DETCALCULO.IDPESSOA  = '+IntTostr(iIdTitular));
     qryRelatParametrizavel.SQL.SaveToFile(sSQLTemp);
     qryRelatParametrizavel.Open;

     dsRelatParametrizavel.DataSet           := qryRelatParametrizavel;
     pplRelatParametrizavel.DataSource       := dsRelatParametrizavel;
     rpRelatParametrizavel.Template.SaveTo   := stFile;
     rpRelatParametrizavel.Template.Format   := ftBinary;
     rpRelatParametrizavel.Template.FileName := sArquivoTemp;
     rpRelatParametrizavel.Template.LoadFromFile;
     rpRelatParametrizavel.DataPipeline      := pplRelatParametrizavel;

     //ClaudioR - 20/07/2007 - CM 21787
     TFrmPreview.CreateModalPreview(Application, rpRelatParametrizavel, 'AdmPREV - ' + frmCadRequerBenefBfciario.Caption);

     //rpRelatParametrizavel.Print;
     //ClaudioR - Fim

     DeleteFile(sArquivoTemp);
     DeleteFile(sSQLTemp);
  end;

end;

procedure TfrmCadRequerBenefBfciario.bbtnProcParticipanteClick(
  Sender: TObject);
var sTempoServAnoDigitado,
    sTempoServMesDigitado,
    sTempoServDiaDigitado : string;
begin
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     iIdTitular                := StrToInt(MontaSelectPart.ValoresChave[0]);
     iIdPessJur                := StrToInt(MontaSelectPart.ValoresChave[1]);
     iIdPlanoPrev              := StrToInt(MontaSelectPart.ValoresChave[2]);
     iSeqProposta              := StrToInt(MontaSelectPart.ValoresChave[7]);
     bQueryTitular := False;
     bQuerySalarios := False;
     bQueryContribuicoes := False;

     // FUNCEF - Se o chamador for uma SIMULACAO , entao pedir o tempo de servico
     if sTipoFormChamador = 'SI'
     then begin
        Application.CreateForm(TfrmLerTempoServico, frmLerTempoServico);
        frmLerTempoServico.ShowModal;
        if frmLerTempoServico.ModalResult <> mrOk
        then Exit;
        sTempoServAnoDigitado := OraNumero(frmLerTempoServico.edTempoServTotal.Text);
        sTempoServMesDigitado := OraNumero(frmLerTempoServico.edTempoServMes.Text);
        sTempoServDiaDigitado := OraNumero(frmLerTempoServico.edTempoServDia.Text);
        frmLerTempoServico.Free;

        dtmAPrev.qry.Close;
        dtmAPrev.qry.Sql.Clear;
        dtmAPrev.qry.Sql.Add(' SELECT TEMPOSERVTOTAL, TEMPOSERVTOTMES, TEMPOSERVTOTDIA  '+
                             ' FROM   ELEGPATRO '+
                             ' WHERE  IDPESSJUR = ' +IntToStr(iIdPessJur) + ' AND ' +
                             '        IDPESSOA  = ' +IntToStr(iIdTitular));
        dtmAPrev.qry.Open;

        sTempoServAnoAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTAL').AsString);
        sTempoServMesAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTMES').AsString);
        sTempoServDiaAntes := OraNumero(dtmAPrev.qry.FieldByName('TEMPOSERVTOTDIA').AsString);

        dtmAPrev.qry.Close;
        dtmAPrev.qry.Sql.Clear;
        dtmAPrev.qry.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVTOTAL   = '+ sTempoServAnoDigitado +', '+
                             '                      TEMPOSERVTOTMES  = '+ sTempoServMesDigitado +', '+
                             '                      TEMPOSERVTOTDIA  = '+ sTempoServDiaDigitado +
                             ' WHERE IDPESSJUR = ' + IntToStr(iIdPessJur) +
                             ' AND   IDPESSOA  = ' + IntToStr(iIdTitular) );
        try
           dtmAPrev.qry.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;

        bPerguntouCancelar := False;

     end;
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
  end; // if montasel.valoreschave.count > 0
end;

procedure TfrmCadRequerBenefBfciario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sTipoTelaBenef    := '';
  FinalizaEP;
  inherited;
end;

procedure TfrmCadRequerBenefBfciario.sbtnCadContaCorrenteClick(
  Sender: TObject);
begin
  inherited;
  try
     // passa o parametro da qrycontabancaria pra o cadastro, para certificar que o recebedor(efetivo),
     // é o dono da conta (idresponsavel ou idpessoa)
     frmCadContaRequerBenef := TFrmCadContaRequerBenef.Create(Self);
     with frmCadContaRequerBenef do
     begin
        iIdPessoa := qryContaBancaria.ParamByName('IdPessoa').AsInteger;
        qry.Close;
        qry.ParamByName('IDPESSOA').AsInteger := qryContaBancaria.ParamByName('IdPessoa').AsInteger;
        qry.Open;
        ShowModal;
     end;

     { Re-Atualiza Dados do Beneficiario }
     PreencheDadosBeneficiario(iNumeroProcesso,iIdTitular,
                               qryDet.FieldByName('IdPessoa').AsInteger,
                               iIdPessJur, iIdPlanoPrev, iSeqProposta);
  finally
     sbtnCadContaCorrente.Down := False;
  end;
end;

procedure TfrmCadRequerBenefBfciario.reValorSRBBtnClick(Sender: TObject);
var rValorSRB            : double;
    bErro                : boolean;
    sSQLBenefAssoc,
    sMsgErro             : string;
    iIdCalculoAnt,
    iIdRegraCalculo      : longint;
begin

  inherited;

  if qryBeneficio.FieldByName('IdRegraSRB').AsInteger <= 0 then Exit;

  frmAguarde.Mostra('Regra de Cálculo do SRB - Nº '+qryBeneficio.FieldByName('IdRegraSRB').AsString);

  sSQLBenefAssoc := MontaSQLBenefAssoc(qryBenefAux, qryBeneficio.FieldByName('NumOrdemEvento').AsInteger);

  // Se nao tiver valor inf. do inss, mas o beneficio cadastrado antes deste
  // tiver, passar o valor dele para esta regra
  if (Trim(reValorInfInss.Text) = '') or
     (Trim(reValorInfINSS.Text) = '0') or
     (Trim(reValorInfInss.Text) <> '') and (StrToFloat(ClienteNumero(Trim(reValorInfInss.Text))) <= 0) and
     (not qryBenefAux.IsEmpty)
  then begin
     qryBenefAux.First;
     sValorInfINSS := OraNumero(qryBenefAux.FieldByName('VlrInfInss').AsString);
  end
  else sValorInfINSS := OraNumero(Trim(reValorInfInss.Text));

  // Executar regra de calculo do beneficio
  try
     rValorSRB       := 0;
     iIdCalculoAnt   := iIdCalculo;

     rValorSRB := ExecutaRegraCalculoSRB(qryAux,
                                         qryBeneficio.FieldByName('IdRegraSRB').AsInteger,
                                         iIdPessJur,
                                         iIdPlanoPrev,
                                         iIdTitular,
                                         iSeqProposta,
                                         qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                         iNumeroProcesso,
                                         iIdSitFunc, iIdSitPart, iIdSitPlanoPrev,
                                         rOpcao1, rOpcao2, rOpcao3,
                                         sSQLBenefAssoc,
                                         FormatDateTime('dd/mm/yyyy', dtDataEvento.Date),       // 24334
                                         FormatDateTime('dd/mm/yyyy', dtInicioFund.Date),       // 24334
                                         FormatDateTime('dd/mm/yyyy', dtInicioINSS.Date),       // 24334
                                         FormatDateTime('dd/mm/yyyy', dtDataInicio.Date),       // 24334
                                         FormatDateTime('dd/mm/yyyy', dtDataRequerimento.Date), // 24334
                                         sValorInfINSS,
                                         reValorCalcINSS.Text,
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
                                         0 );
     frmAguarde.Apaga;
  except
     frmAguarde.Apaga;
  end;

  frmAguarde.Apaga;
  if bErro
  then begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    reValorSRB.Text := '0';
    Exit;
  end;

  if iIdCalculo = 0
  then iIdCalculo := iIdCalculoAnt;

  reValorSRB.Text := FormatFloat('#0.00',rValorSRB);

end;

procedure TfrmCadRequerBenefBfciario.qryDetAfterPost(DataSet: TDataSet);
begin
  inherited;
  // Verificar se todos os beneficiários já foram requeridos


end;

procedure TfrmCadRequerBenefBfciario.VerificaEvolucaoPensionista;
{Se FLGINCORPORAPENS estiver marcado no plano, incorpora os dependentes à evolução funcional do
titular, inserindo na tabela EVOLFUNCPREV cada um.
Não fazer para benefício de pagamento único.
Verificar se dependente já foi inserido na tabela EVOLFUNCPREV.}

  {-->}
  Procedure PreecheVariaveis(qryAux: TwwQuery; var pWhere     : String);
  var
    sSeqHistFuncPrev : String;
  Begin
    With qryAux DO
    Begin
      If Active Then
      Begin
        // pega o sequence.
        sSeqHistFuncPrev := IntToStr(LeUltRegistro(Nil,'EVOLFUNCPREV'));

        pWhere :=
          qryBeneficiario.FieldByName('IDPESSOA').AsString +','+
          qryBeneficiario.FieldByName('IDPESSJUR').AsString +','+
          sSeqHistFuncPrev  +',';

        If FieldByName('IdCargoExt').AsString <> '' Then
          pWhere := pWhere + FieldByName('IdCargoExt').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('IdFuncao').AsString <> '' Then
          pWhere := pWhere + FieldByName('IdFuncao').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('IdPessJurCG').AsString <> '' Then
          pWhere := pWhere + FieldByName('IdPessJurCG').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('IdPessJurFG').AsString <> '' Then
          pWhere := pWhere + FieldByName('IdPessJurFG').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('Perc1AC').AsString <> '' Then
          pWhere := pWhere + FieldByName('Perc1AC').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('Perc2AC').AsString <> '' Then
          pWhere := pWhere + FieldByName('Perc2AC').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('PercATS').AsString <> '' Then
          pWhere := pWhere + FieldByName('PercATS').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('PercInsalub').AsString <> '' Then
          pWhere := pWhere + FieldByName('PercInsalub').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('PercPericul').AsString <> '' Then
          pWhere := pWhere + FieldByName('PercPericul').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('PercFuncao').AsString <> '' Then
          pWhere := pWhere + FieldByName('PercFuncao').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('ModoFuncao').AsString <> '' Then
          pWhere := pWhere + '''' +FieldByName('ModoFuncao').AsString  +''','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('DataInicio').IsNull Then
          pWhere := pWhere + 'NULL,'
        Else pWhere := pWhere + 'TO_DATE('''+FieldByName('DataInicio').AsString+''',''DD/MM/YYYY''),';

        If FieldByName('DataFinal').IsNull Then
          pWhere := pWhere + 'NULL,'
        Else pWhere := pWhere + 'TO_DATE('''+FieldByName('DataFinal').AsString+''',''DD/MM/YYYY''),';

        pWhere := pWhere + ''''+FieldByName('Origem').AsString  +''',';

        If FieldByName('PercAdNot').AsString <> '' Then
          pWhere := pWhere + FieldByName('PercAdNot').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('QTDEMINUTOS').AsString <> '' Then
          pWhere := pWhere + FieldByName('QTDEMINUTOS').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('IdPessJurGR').AsString <> '' Then
          pWhere := pWhere + FieldByName('IdPessJurGR').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('IdGrupoFunc').AsString <> '' Then
          pWhere := pWhere + FieldByName('IdGrupoFunc').AsString  +','
        Else pWhere := pWhere + 'NULL,';

        If FieldByName('PercAdicionalNot').AsString <> '' Then
          pWhere := pWhere + FieldByName('PercAdicionalNot').AsString
        Else pWhere := pWhere + 'NULL';


      End;
    End; // With qryAux DO
  End;
  {<--}

  {-->}
  Procedure AbreQuery(Var qryAux: TwwQuery);
  Begin
    // Busca dados da ÚLTIMA evolução do titular para usar no insert.
    qryAux.Sql.Clear;
    qryAux.Sql.Add(
      ' SELECT * FROM EVOLFUNCPREV ' +
      ' WHERE IDPESSOA = '+ qryBeneficiario.FieldByName('IDTITULAR').AsString+
      '   AND IDPESSJUR = '+ qryBeneficiario.FieldByName('IDPESSJUR').AsString+
      '   AND SEQHISTFUNC = (SELECT MAX(SEQHISTFUNC) SEQHISTFUNC FROM EVOLFUNCPREV '+
      '                   WHERE IDPESSOA = '+ qryBeneficiario.FieldByName('IDTITULAR').AsString+
      '                    AND IDPESSJUR = '+ qryBeneficiario.FieldByName('IDPESSJUR').AsString+')');
    qryAux.Open;
  End;
  {<--}

  {-->}
  Function HePagtoUnico(QryAux: TwwQuery; pIdTpPagto: String): Boolean;
  Begin
    With qryAux do
    Begin
      Sql.Clear;
      Sql.Add( ' SELECT FLGFREQUENCIA FROM TPPAGTOBENEFICIO ' +
               ' WHERE IDTPPAGTOBENEFIC = '+pIdTpPagto);
      Open;
      If (IsEmpty) Or (FieldByname('FLGFREQUENCIA').AsString = 'U') Then
        Result := True
      Else Result := False;
    End;
  End;
  {<--}

Var
  _qry: TwwQuery;
  sWhere     : String;
begin
  try

  _qry := TwwQuery.Create(Application);
  _qry.DatabaseName :=  'BaseDados';

  // verificar se flag está permite operação.
  If qryTitular.FieldByName('FLGUSAEVOLFUNC').AsInteger = 1 Then

    // verifica se incorpora pensionista à evolução funcional do titular.
    If qryTitular.FieldByName('FLGINCORPORAPENS').AsInteger = 1 Then
    Begin

      // verifica que o beneficio é pagto único.
      If HePagtoUnico(_qry,qryDet.FieldByName('IDTPPAGTOBENEFIC').AsString) Then Exit;

      // Se Titular não possui evolução funcional sai.
      AbreQuery(_qry);
      If _qry.IsEmpty Then Exit;

    // verifica se o dependente já exite na evolução.
      qryBeneficiario.First;
      while Not qryBeneficiario.EOF Do
      Begin

        // procura
        _qry.Sql.Clear;
        _qry.Sql.Add(' SELECT COUNT(*) NUM FROM EVOLFUNCPREV '+
                     ' WHERE IDPESSOA = '+ qryBeneficiario.FieldByName('IDPESSOA').AsString+
                     '   AND IDPESSJUR = '+ qryBeneficiario.FieldByName('IDPESSJUR').AsString);
        _qry.Open;

        // se existir algum registro passa para o próximo.
        If _qry.FieldByName('NUM').AsInteger > 0 Then Break;

        AbreQuery(_qry);
        PreecheVariaveis(_qry, sWhere);

        _qry.Sql.Clear;
        _qry.Sql.Add(
        ' INSERT INTO EVOLFUNCPREV (IDPESSOA, IDPESSJUR, SEQHISTFUNC, IDCARGOEXT, '+
        '       IDFUNCAO, IDPESSJURCG, IDPESSJURFG, PERC1AC, PERC2AC, PERCATS, PERCINSALUB, PERCPERICUL,  '+
        '       PERCFUNCAO, MODOFUNCAO, DATAINICIO, DATAFINAL, ORIGEM,  '+
        '       PERCADNOT, QTDEMINUTOS, IDPESSJURGR, IDGRUPOFUNC, PERCADICIONALNOT ) VALUES '+
        '('+ sWhere +')');

        _qry.ExecSQL;
        qryBeneficiario.Next;
      End;  // while Not qryBeneficiario.EOF Do
    End;  // If qryTitular.FieldByName('FLGINCORPORAPENS').AsInteger = 1 Then
  Finally
    _qry.Free;
  ENd;
end;

procedure TfrmCadRequerBenefBfciario.sbtnDemonsSRBClick(Sender: TObject);
begin
  inherited;
  if not qryDet.Active
  then begin
     sbtnDemonsSRB.Down := False;
     Exit;
  end;
  try
     iIdCalculoGeral   := iIdCalculo;
     frmPRelDemosBenef := TfrmPRelDemosBenef.Create(Application);
     if not frmPRelDemosBenef.DisparaRelatorio('M',
                                               IntToStr(iIdTitular),
                                               IntToStr(iIdPessoa), { Augusto 24/01/2006 - Parametro IDPESSOA  }
                                               IntToStr(iIdPessJur),
                                               IntToStr(iIdPlanoPrev),
                                               IntToStr(iNumeroProcesso),
                                               qryDet.FieldByName('DATAINICIOFUND').AsString,
                                               '')
     then begin
        MsgDlg('Erro ao Montar Demonstrativo de Cálculo.','Erro',mtError,[mbOk],0);
        Exit;
     end;
  finally
     frmPRelDemosBenef.Free;
     iIdCalculoGeral := 0;
     sbtnDemonsSRB.Down := False;
  end;

end;

procedure TfrmCadRequerBenefBfciario.dbedNumProcINSSExit(Sender: TObject);
begin
  inherited;
  if (dbedNumProcINSS.text <> '') then
  begin
     if not ValidaNumProcesso(qrydet.fieldbyname('NUMPROCINSS').AsString) then
     begin
        // CAMILLE - 30.08.2004 - MUDEI MENSAGEM
        if MsgDlg('O Número do Processo no INSS informado é INVÁLIDO. '+#13+
                  'Deseja manter este número e continuar a operação ?', Caption, mtError , [mbNo, mbYes], 0) = mrNo then
        begin
           if dbedNumProcINSS.CanFocus then dbedNumProcINSS.setfocus
        end;
     end;
  end;
end;


function TfrmCadRequerBenefBfciario.VerificaCamposObrigRegra : boolean;
begin
   Result := False;

   // Verificar campos obrigatorios
   if Trim(dblkpcmbBeneficio.Text) = ''
   then begin
     MsgDlg('Preencha o Benefício.','Erro',mtError,[mbOk],0);
     dblkpcmbBeneficio.SetFocus;
     Exit;
   end;
   if Trim(dtDataEvento.Text) = ''
   then begin
     MsgDlg('Preencha a Data do Evento.','Erro',mtError,[mbOk],0);
     dtDataEvento.SetFocus;
     Exit;
   end;
   if Trim(dtInicioFund.Text) = ''
   then begin
     MsgDlg('Preencha a Data de Início da Fundação.','Erro',mtError,[mbOk],0);
     dblkpcmbBeneficio.SetFocus;
     Exit;
   end;

   // Se for beneficio provisorio, verificar percentual de concessao
   if (dbrgrpBenefProvisorio.ItemIndex = 1) and
      (Trim(dbedPercConc.Text) = '')
   then begin
     MsgDlg('Este benefício está marcado como "PROVISÓRIO". '+
            'Preencha o Percentual de Concessão. ','Erro',mtError,[mbOk],0);
     dbrgrpBenefProvisorio.SetFocus;
     Exit;
   end;


   //leofuncef - 02092003 - inicio
   //comentei o teste do valorbase1 2 e 3 do benefbfciario
   // Se o beneficio tem alguma opcao obrigatoria e esta opcao nao foi preenchida,
   // chamar cadastro de opcoes
   if   (qryBeneficio.FieldByName('NumOpcoes').AsInteger >= 1) and
        ( ( (qryBeneficio.FieldbyName('flgObrigaOp1').AsInteger = 1) and (rOpcao1 <= 0) ) or
          ( (qryBeneficio.FieldbyName('flgObrigaOp2').AsInteger = 1) and (rOpcao2 <= 0) ) or
          ( (qryBeneficio.FieldbyName('flgObrigaOp3').AsInteger = 1) and (rOpcao3 <= 0) )
        )
   then begin
      MsgDlg('Existe opção de benefício obrigatória não informada.','Erro',mtError,[mbOk],0);
      Exit;
   end;
   //leofuncef - 02092003 - fim

   // Verificar se participante já fez opções
   {frmAguarde.Mostra(' Verificando opções obrigatórias ...');
   qryAux.Close;
   qryAux.SQL.Clear;
   // CGUEDES - 31/07/2003 - Pend.: 14651/2
   //qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM BENEFPLANOPART ' +
   qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM BENEFBFCIARIO ' +
                  ' WHERE IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND ' +
                  '       IDTITULAR   = ' + IntToStr(iIdTitular)   + ' AND ' +
                  '       IDPESSOA    = ' + IntToStr(iIdPessoa)    + ' AND ' +
                  '       IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
                  '       SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND ' +
                  '       IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
    qryAux.Open;

    if (not qryAux.IsEmpty) and
       (qryBeneficio.FieldByName('NumOpcoes').AsInteger >= 1) and
       ( ( (qryBeneficio.FieldByName('FlgObrigaOp1').AsInteger = 1) and
           ( (qryAux.FieldByName('ValorBase1').AsString = '') or
             (qryAux.FieldByName('ValorBase1').AsFloat <= 0 ) )
         ) or
         ( (qryBeneficio.FieldByName('FlgObrigaOp2').AsInteger = 1) and
           ( (qryAux.FieldByName('ValorBase2').AsString = '') or
             (qryAux.FieldByName('ValorBase2').AsFloat <= 0) )
         )or
         ( (qryBeneficio.FieldByName('FlgObrigaOp3').AsInteger = 1) and
           ( (qryAux.FieldByName('ValorBase3').AsString = '') or
             (qryAux.FieldByName('ValorBase3').AsFloat <= 0) )
         )
       )
    then begin
       MsgDlg('Existe uma ou mais opções de benefício obrigatórias não preenchidas. Verifique. ','Informação',mtInformation,[mbOk],0);
       frmAguarde.Apaga;
       Exit;
    end;

    if (qryAux.IsEmpty) and
       (qryBeneficio.FieldByName('FlgAceitaOpcao').AsInteger = 1) and
       ( ( qryBeneficio.FieldByName('FlgObrigaOp1').AsInteger = 1  )or
         ( qryBeneficio.FieldByName('FlgObrigaOp2').AsInteger = 1  )or
         ( qryBeneficio.FieldByName('FlgObrigaOp3').AsInteger = 1  ) )
    then begin
       MsgDlg('Existe uma ou mais opções de benefício obrigatórias não preenchidas. Verifique. ','Informação',mtInformation,[mbOk],0);
       frmAguarde.Apaga;
       Exit;
    end;
    frmAguarde.Apaga;}



    Result := True;
end; { VerificaCamposObrigRegra }

function TfrmCadRequerBenefBfciario.VerificaAcertosFalecido( piNumeroProcesso  : longint;
                                                             piIdPessJur       : longint;
                                                             piIdPlanoPrev     : longint;
                                                             piIdTitular       : longint;
                                                             piSeqProposta     : longint;
                                                             piIdLoteConcessao : longint;
                                                             psDataEvento      : string;
                                                             psDataPagamento   : string ) : boolean;
begin
    Result := False;
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' UPDATE HSTBENEFBFCIARIO HST SET IDMOTIVO = '+IntToStr(prmIdMotDevolNaoIden)+
                   ' WHERE  HST.IDPESSJUR      = '+IntToStr(piIdPessJur)+
                   ' AND    HST.IDPLANOPREV    = '+IntToStr(piIDPLANOPREV)+
                   ' AND    HST.IDTITULAR      = '+IntToStr(piIDTITULAR)+
                   ' AND    HST.SEQPROPOSTA    = '+IntToStr(piSEQPROPOSTA)+
                   ' AND    HST.IDPESSOA       = '+IntToStr(piIDTITULAR)+
                   ' AND    HST.IDMOTIVO       = '+IntToStr(prmIdMotivoAcertoFL)+
                   ' AND    HST.VLBENEFPGTO    IS NULL '+
                   ' AND    HST.FLGENVIADO     = 0 ');
    try
       qryAux.ExecSQL;
    except
       Exit;
    end;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV HST SET IDMOTIVO = '+IntToStr(prmIdMotDevolNaoIden)+
                   ' WHERE  HST.IDPESSJUR      = '+IntToStr(piIdPessJur)+
                   ' AND    HST.IDPLANOPREV    = '+IntToStr(piIDPLANOPREV)+
                   ' AND    HST.IDPESSOA       = '+IntToStr(piIDTITULAR)+
                   ' AND    HST.SEQPROPOSTA    = '+IntToStr(piSEQPROPOSTA)+
                   ' AND    HST.IDMOTIVO       = '+IntToStr(prmIdMotivoAcertoFL)+
                   ' AND    HST.SITRECEBIMENTO = 0 ');
    try
       qryAux.ExecSQL;
    except
       Exit;
    end;

    Result := True;
end;

procedure TfrmCadRequerBenefBfciario.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dtmaprev.regraAPrev.LimpaVariaveis; //leofuncef - 10092003 - limpar variáveis de regras
end;

procedure TfrmCadRequerBenefBfciario.Label12Click(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled   := True;
end;

procedure TfrmCadRequerBenefBfciario.lblSitProcessoClick(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled   := True;
end;

procedure TfrmCadRequerBenefBfciario.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled   := True;

end;

procedure TfrmCadRequerBenefBfciario.dtInicioINSSChange(Sender: TObject);
begin
  inherited;
  { Augusto 15/11/2003 }
  If (qryDet.State in [dsEdit, dsInsert]) And
     (qryBeneficio.FieldByName('FLGREFERENCIA').AsInteger = 1)
  Then Begin
    qryDet.FieldByName('DataInicioFund').AsString := dtInicioINSS.Text;
  End;
end;


procedure TfrmCadRequerBenefBfciario.BtMatriculaClick(Sender: TObject);
Var
  sProxMat : String;
begin
  inherited;

  { Inicio Augusto 18/06/2004 - Passei do Beneficio pra cá }
  If (Not qryDepentit.FieldByName('MATRICULA').IsNull) Then Begin
    if MsgDlg('Já existe uma matricula para este beneficiário. Realmente deja gerar uma nova? ',
              'Atenção',mtWarning,[mbyes,mbno],0) = mrNo
    then Exit;
  End;
  if (qrybeneficio.fieldbyname('FLGPECULIO').AsInteger <> 1) and
     (qrybeneficio.fieldbyname('FLGRESGATE').AsInteger <> 1) and
     (qrybeneficio.fieldbyname('FLGREFERENCIA').AsInteger <> 1) and { Augusto 21/05/2004 }
     (qryDet.State in [dsEdit]) and
     (Trim(prmMASCMATPENS) <> '')
  then begin
     If Trim(dbeMatriculaBenef.Text) = '' Then Begin
       sProxMat := GeraMatricula(QryAux, iIdCalculo);
       qryDepentit.Edit;
       qryDepentit.FieldByName('MATRICULA').AsString := sProxMat;
     End;
  end;
  { Fim Augusto 18/05/2004 }
end;

procedure TfrmCadRequerBenefBfciario.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
  BtMatricula.Visible := False;
end;

procedure TfrmCadRequerBenefBfciario.reValorSRBExit(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

// Gleyber - 23/03/2005 - Pendência 18272 - Início
procedure TfrmCadRequerBenefBfciario.DesindexaReserva;
Var
  sMesLimite,
  sMesUltMov,
  sDataMov,
  sSql             : String;
  dValorAtualizado : double;
  iIdHistorico     : longint;
begin
  // Pega o mês anterior ao do evento
  sMesLimite := sAnoMesAnterior(FormatDateTime('yyyy/mm', dtDataEvento.Date));  // 24334

  qryReservaPart.First;
  While Not qryReservaPart.Eof do
   Begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT MAX(DATAMOV) AS MAIORDATAMOV');
     qryAux.SQL.Add('FROM HISTMOVRESERVA');
     qryAux.SQL.Add('WHERE IDTIPORESERVA   = '+qryReservaPart.FieldByName('IDTIPORESERVA').AsString);
     qryAux.SQL.Add('  AND IDPLANOPREV     = '+qryReservaPart.FieldByName('IDPLANOPREV').AsString);
     qryAux.SQL.Add('  AND IDPESSOA        = '+qryReservaPart.FieldByName('IDPESSOA').AsString);
     qryAux.SQL.Add('  AND IDPESSJUR       = '+qryReservaPart.FieldByName('IDPESSJUR').AsString);
     qryAux.SQL.Add('  AND FLGENTRADA      = 1');
     qryAux.SQL.Add('  AND VLRREAL         = 0');
     qryAux.SQL.Add('  AND VLRCOTAS        = 0');
     qryAux.SQL.Add('  AND PERCENTUAL      = 0');
     qryAux.SQL.Add('  AND FLGENTRADA      = 1');
     qryAux.SQL.Add('  AND IDBENEFICIO     IS NULL');
     qryAux.SQL.Add('  AND IDCONTRIBUICAO  IS NULL');
     qryAux.SQL.Add('  AND IDEVENTOGERADOR IS NULL');
     qryAux.Open;

     sDataMov   := qryAux.FieldByName('MAIORDATAMOV').AsString;
     
     sMesUltMov := Copy(qryAux.FieldByName('MAIORDATAMOV').AsString,7,4)+'/'+
                   Copy(qryAux.FieldByName('MAIORDATAMOV').AsString,4,2);

     // Se a reserva em questão já foi corrigida posterior ao evento
     // deverá ser desindexada ate um mês antes do evento

     If sMesUltMov > sMesLimite
      Then Begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT IDPLANOPREV, IDTIPORESERVA, IDPESSJUR, IDPESSOA, SEQPROPOSTA, SYSDATE AS DATAMOV,');
        qryAux.SQL.Add('       VLRREAL, VLRCOTAS, SALDOREAL, 0 AS FLGENTRADA, PERCENTUAL, IDPARTICIPANTE,');
        qryAux.SQL.Add('       SALDOREALCONT, DATAALIMENTACAO, VALORINDICE, MESREFERENCIA, FLGPROCEDENCIA, ');
        qryAux.SQL.Add('       SALDOCORRIGIDO, INDICECORRECAO, SALDOCOTAS, DATAINDICE ');
        qryAux.SQL.Add('FROM HISTMOVRESERVA');
        qryAux.SQL.Add('WHERE IDTIPORESERVA   = '+qryReservaPart.FieldByName('IDTIPORESERVA').AsString);
        qryAux.SQL.Add('  AND IDPLANOPREV     = '+qryReservaPart.FieldByName('IDPLANOPREV').AsString);
        qryAux.SQL.Add('  AND IDPESSOA        = '+qryReservaPart.FieldByName('IDPESSOA').AsString);
        qryAux.SQL.Add('  AND IDPESSJUR       = '+qryReservaPart.FieldByName('IDPESSJUR').AsString);
        qryAux.SQL.Add('  AND FLGENTRADA      = 1');
        qryAux.SQL.Add('  AND VLRREAL         = 0');
        qryAux.SQL.Add('  AND VLRCOTAS        = 0');
        qryAux.SQL.Add('  AND PERCENTUAL      = 0');
        qryAux.SQL.Add('  AND IDREGRACALCULO  IS NULL ');
        qryAux.SQL.Add('  AND IDBENEFICIO     IS NULL');
        qryAux.SQL.Add('  AND IDCONTRIBUICAO  IS NULL');
        qryAux.SQL.Add('  AND IDEVENTOGERADOR IS NULL');
        qryAux.SQL.Add('  AND SALDOCORRIGIDO  IS NOT NULL');
        qryAux.SQL.Add('  AND INDICECORRECAO  > 0');
        qryAux.SQL.Add('  AND DATAMOV > TO_DATE('+QuotedStr(sDataMov) +', '+QuotedStr('DD/MM/YYYY')+')');
        qryAux.SQL.Add('ORDER BY MESREFERENCIA DESC');
        qryAux.Open;

        // Abre o histórico em cache apenas para inserir os novos registros
        If Not qryDesindRes.Active
         Then Begin
           qryDesindRes.ParamByName('IDPLANOPREV').AsInteger   := qryReservaPart.FieldByName('IDPLANOPREV').AsInteger;
           qryDesindRes.ParamByName('IDPESSOA').AsInteger      := qryReservaPart.FieldByName('IDPESSOA').AsInteger;
           qryDesindRes.ParamByName('IDPESSJUR').AsInteger     := qryReservaPart.FieldByName('IDPESSJUR').AsInteger;
           qryDesindRes.Open;
         End;

        // Abre as reservas do participante em cache para atualizar
        If Not qryDResPart.Active
         Then Begin
           qryDResPart.ParamByName('IDPLANOPREV').AsInteger   := qryReservaPart.FieldByName('IDPLANOPREV').AsInteger;
           qryDResPart.ParamByName('IDPESSOA').AsInteger      := qryReservaPart.FieldByName('IDPESSOA').AsInteger;
           qryDResPart.ParamByName('IDPESSJUR').AsInteger     := qryReservaPart.FieldByName('IDPESSJUR').AsInteger;
           qryDResPart.Open
         End;

        While Not qryAux.Eof do
         Begin
           // Pega o valor corrigido e aplica o índice para desindexar a reserva
           dValorAtualizado := qryAux.FieldByName('SALDOCORRIGIDO').AsFloat /
                               qryAux.FieldByName('INDICECORRECAO').AsFloat;
           iIdHistorico     := LeUltRegistro(nil,'HISTMOVRESERVA');

           With qryDesindRes do
            Begin
              Insert;

              FieldByName('IDHISTRESERVA').AsInteger    := iIdHistorico;
              FieldByName('IDPLANOPREV').AsInteger      := qryAux.FieldByName('IDPLANOPREV').AsInteger;
              FieldByName('IDTIPORESERVA').AsInteger    := qryAux.FieldByName('IDTIPORESERVA').AsInteger;
              FieldByName('IDPESSJUR').AsInteger        := qryAux.FieldByName('IDPESSJUR').AsInteger;
              FieldByName('IDPESSOA').AsInteger         := qryAux.FieldByName('IDPESSOA').AsInteger;
              FieldByName('SEQPROPOSTA').AsInteger      := qryAux.FieldByName('SEQPROPOSTA').AsInteger;
              FieldByName('DATAMOV').AsDateTime         := Date;
              FieldByName('VLRREAL').AsFloat            := qryAux.FieldByName('VLRREAL').AsFloat;
              FieldByName('VLRCOTAS').AsFloat           := qryAux.FieldByName('VLRCOTAS').AsFloat;
              FieldByName('SALDOREAL').AsFloat          := dValorAtualizado;
              FieldByName('FLGENTRADA').AsInteger       := 0;
              FieldByName('PERCENTUAL').AsFloat         := qryAux.FieldByName('PERCENTUAL').AsFloat;
              FieldByName('IDPARTICIPANTE').AsInteger   := qryAux.FieldByName('IDPARTICIPANTE').AsInteger;
              FieldByName('SALDOREALCONT').AsFloat      := qryAux.FieldByName('SALDOREALCONT').AsFloat;
              FieldByName('DATAALIMENTACAO').AsDateTime := qryAux.FieldByName('DATAALIMENTACAO').AsDateTime;
              FieldByName('VALORINDICE').AsFloat        := qryAux.FieldByName('VALORINDICE').AsFloat;
              FieldByName('MESREFERENCIA').AsString     := qryAux.FieldByName('MESREFERENCIA').AsString;
              FieldByName('FLGPROCEDENCIA').AsInteger   := qryAux.FieldByName('FLGPROCEDENCIA').AsInteger;
              FieldByName('SALDOCORRIGIDO').AsFloat     := qryAux.FieldByName('SALDOCORRIGIDO').AsFloat;
              FieldByName('INDICECORRECAO').AsFloat     := qryAux.FieldByName('INDICECORRECAO').AsFloat;
              FieldByName('SALDOCOTAS').AsFloat         := dValorAtualizado;
              FieldByName('DATAINDICE').AsDateTime      := qryAux.FieldByName('DATAINDICE').AsDateTime;

              Post;
            End; // With qryDesindRes do

            With qryDResPart do
             Begin
              If Locate('IDPLANOPREV;IDPESSJUR;IDTIPORESERVA;IDPESSOA;SEQPROPOSTA',
                        VarArrayOf([qryAux.FieldByName('IDPLANOPREV').AsInteger,
                                    qryAux.FieldByName('IDPESSJUR').AsInteger,
                                    qryAux.FieldByName('IDTIPORESERVA').AsInteger,
                                    qryAux.FieldByName('IDPESSOA').AsInteger,
                                    qryAux.FieldByName('SEQPROPOSTA').AsInteger]),
                                    [loPartialKey])
               Then Begin
                 Edit;
                 FieldByName('VALORRESERVA').AsFloat := dValorAtualizado;
                 Post;
               End;

             End; // With qryDResPart do
           qryAux.Next;
         End; // While Not qryAux.Eof do

      End; // If sMesUltMov > sMesLimite
   End;
end;
// Gleyber - 23/03/2005 - Pendência 18272 - Fim

// Gleyber - 24/10/2006 - Pendência 23246 - Início
procedure TfrmCadRequerBenefBfciario.VerificaProcessoEncerrado;
begin
 qryAux.Close;
 qryAux.SQL.Clear;
 qryAux.SQL.Add('SELECT DISTINCT EL.MATRICULA, DP.MATRICULA, PTIT.NOME, PDEP.NOME, P.NUMEROPROCESSO,');
 qryAux.SQL.Add('       BF.NOME, P.DTEVENTO, PP.INSCRICAONUMERO, P.NUMEROPROCESSO, B.IDTITULAR,');
 qryAux.SQL.Add('       B.SEQPROPOSTA, B.IDPESSJUR, B.IDPLANOPREV, B.IDPLANOORIGEM');
 qryAux.SQL.Add('FROM PROCESSOBENEF P,');
 qryAux.SQL.Add('     BENEFBFCIARIO B,');
 qryAux.SQL.Add('     BENEFPLANPREV BPL,');
 qryAux.SQL.Add('     BENEFICIO     BF,');
 qryAux.SQL.Add('     PESSOA        PTIT,');
 qryAux.SQL.Add('     ELEGPATRO     EL,');
 qryAux.SQL.Add('     PARTPREVPLAN  PP,');
 qryAux.SQL.Add('     PESSOA        PDEP,');
 qryAux.SQL.Add('     DEPENTIT      DP');
 qryAux.SQL.Add('WHERE (P.NUMEROPROCESSO = B.NUMEROPROCESSO)');
 qryAux.SQL.Add('  AND (B.IDTITULAR = PTIT.IDPESSOA)');
 qryAux.SQL.Add('  AND (B.IDTITULAR <> B.IDPESSOA)');
 qryAux.SQL.Add('  AND (BF.IDBENEFICIO = B.IDBENEFICIO)');
 qryAux.SQL.Add('  AND (BPL.IDBENEFICIO = B.IDBENEFICIO)');
 qryAux.SQL.Add('  AND (BPL.IDPLANOPREV = B.IDPLANOPREV)');
 qryAux.SQL.Add('  AND (EL.IDPESSOA = B.IDTITULAR)');
 qryAux.SQL.Add('  AND (EL.IDPESSJUR = B.IDPESSJUR)');
 qryAux.SQL.Add('  AND (BF.FLGDESTBENEF <> ''P'')');
 qryAux.SQL.Add('  AND (B.IDPESSJUR = PP.IDPESSJUR)');
 qryAux.SQL.Add('  AND (B.IDPLANOORIGEM = PP.IDPLANOPREV )');
 qryAux.SQL.Add('  AND (B.IDTITULAR = PP.IDPESSOA)');
 qryAux.SQL.Add('  AND (B.SEQPROPOSTA = PP.SEQPROPOSTA)');
 qryAux.SQL.Add('  AND (B.IDPESSOA = PDEP.IDPESSOA)');
 qryAux.SQL.Add('  AND (DP.IDTITULAR = B.IDTITULAR)');
 qryAux.SQL.Add('  AND (DP.IDPESSOA = B.IDPESSOA)');
 qryAux.SQL.Add('  AND (DP.IDTITULAR = '+IntToStr(iIdTitular)+')');
 qryAux.SQL.Add('  AND (P.IDEVENTOGERADOR = '+IntToStr(iIdEvento)+')');
 qryAux.SQL.Add('  AND (P.IDSITPROCESSO = 3)');

 qryAux.Open;

 If qryAux.IsEmpty
  Then Begin
    bFlgBenefMorte := False;
    sbtnInserirClick(Self);
    Exit;
  End;

 If MsgDlg('Existe um processo encerrado para este evento.'+#13+
           'Deseja reabri-lo?','Processo Encerrado',mtConfirmation,
           [mbYes,MbNo],0) = mrNo
  Then Begin
    bFlgBenefMorte := False;
    sbtnInserirClick(Self);
    Exit;
  End;

 MontaSelect.Filtro.Add('DP.IDTITULAR = '+IntToStr(iIdTitular));
 MontaSelect.Filtro.Add('P.IDEVENTOGERADOR = '+IntToStr(iIdEvento));
 MontaSelect.Filtro.Add('P.IDSITPROCESSO = 3');

 MontaSelect.RepeteConsulta := True;
 MontaSelect.ExibePergunta := False;
 MontaSelect.ItemsBusca.Clear;
 MontaSelect.ItemsBusca.Add(qryAux.FieldByName('MATRICULA').AsString);
 MontaSelect.Executar;

 If MontaSelect.RetornouValor
  Then CmeCadastroFind(Self)
  Else Begin
    bFlgBenefMorte := False;
    sbtnInserirClick(Self);
    Exit;
  End;

 sbtnAlterarClick(Self);
end;
// Gleyber - 24/10/2006 - Pendência 23246 - Fim

end.


{
COLUNAS ANTIGO
P.NUMEROPROCESSO
PES.NOME
BF.NOME
P.DTEVENTO
EL.MATRICULA
PP.INSCRICAONUMERO
PESSOA.NOME
}


