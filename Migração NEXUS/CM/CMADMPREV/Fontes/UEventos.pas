// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//******************************************************************************
//Rotina...........: ReativaParticipanteNaPatro
//Nº SIG:........... 101481
//Data da Alteração: 18/08/2020
//Responsável......: Taffarel Sevaybriker
//Descrição........: Não alterar DATACANCELAMENTO e FLGDESATIVADO para o evento gerador 354.
//******************************************************************************
//Rotina...........: PodeRegistrarEvento
//Nº SIG:........... 86058
//Data da Alteração: 13/05/2019
//Responsável......: Edilaine
//Descrição........: Crítica ao registrar evento de Resgate complementar para Beneficiário Designado
//******************************************************************************
//Nº SIG:........... 80755
//Data da Alteração: 17/01/2019
//Responsável......: Everson Cunha
//Descrição........: Não devem ser preparadas as contribuições quando o
//                   evento é "Aposentadoria Tempo de Contribuição".
//                   Informações repassadas pelo analista Tiago Von - COSIS
//******************************************************************************
//Nº SIG:........... 74780
//Data da Alteração: 20/09/2018
//Responsável......: Andre Imakawa
//Descrição........: Suspensão das contribuições para o IDEventoGerador = 356
//******************************************************************************
//Nº SIG:........... 50633
//Data da Alteração: 08/08/2018
//Responsável......: Andre Imakawa
//Descrição........: Desfazer a alteraçãod o SIG 21872 e nao efetuar o update quando modulo
//					 CadastroPrev
//***************************************************************************************
// Nº SIG.....: SIG TIBERO
// Data.......: 06/03/2018
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
// -----------------------------------------------------------------------------
//Nº SIG:........... 21872
//Data da Alteração: 14/06/2016
//Responsável......: William Santana
//Descrição........: Módulo de cadastro não pode alterar as tabelas do contribuição
//***************************************************************************************
//Nº SOL:........... 264614
//Nº PPM...........: 1157652
//Data da Alteração: 11/11/2015
//Responsável......: William Santana
//Descrição........: Alinhado com o Tiago Von Paumgartten Baia a inclusão di filtro FLGDESATIVADO = 0
//                   na rotina de update da PARTPREVPLAN  para casos de RETORNO DE CANCELADO PARA ATIVO
//***************************************************************************************
// Autor(a)  : William Moreira da Silva
// Data      : 09/07/2014
// Pendência : SOL 235054 PPM 442686
// Descricao : Insconsistência ao registrar eventos
// -----------------------------------------------------------------------------
//Pendência   : SOL 225863 KINTANA 2059478
//Responsável : Thiago/Fernando Xavier
//Data        : 06/02/2014
//Descrição   : Ao iniciar a concessão do benefício de aposentadoria por idade,
//              identificamos no final do processo que o sistema não esta gravando
//              o evento de concessão.
//--------------------------------------------------------------------------------
//Pendência   : SOL 177151/9541 KTN 1665621
//Responsável : André Felipe
//Data        : 09/08/2013
//Descrição   : Permitir o cadastro deste evento e do seu Resgate mesmo que o 
//				participante já tenha evento da categoria de falecimento 
//				cadastrado e/ou esteja cancelado na fundação.
//Observação  : Tadeu Passos, apenas subiu a demanada.
//--------------------------------------------------------------------------------
//Pendência   : SOL 164143 KINTANA 1409158
//Responsável : BRUNO AZEVEDO
//Data        : 02/09/2011
//Descrição   : Ajuste nas contribuições no evento TS.
//--------------------------------------------------------------------------------
//Pendência   : SOL 160072/5463 Kintana 1346609
//Responsável : Aline Freire
//Data        : 29/06/2011
//Rotina      : SuspendeContribuicoes
//Descrição   : Ao selecionar a opção (Não) na crítica: "Deseja informar salário de participação",
//              permitir registrar o evento.
//--------------------------------------------------------------------------------
//Pendência   : SOL 155863 Kintana 1216997
//Responsável : Renato Visoni
//Data        : 13/08/2010
//Descrição   : Pois ao conceder pecúlio por morte da 2003400, o sistema está
//              trazendo acertos referentes ao evento de falecimento do titular,
//              quando o correto é não trazer.
//--------------------------------------------------------------------------------
//Pendência   : SOL 121596 KINTANA 587023
//Responsável : Ádler Souza
//Data        : 13/08/2010
//Descrição   : Informar manualmente (pelo usuário) a data de previsão de
//              pagamento nos cálculos de autopatrocinio total.
//--------------------------------------------------------------------------------
//Pendência   : SOL 130119 KINTANA 789646
//Responsável : BRUNO AZEVEDO
//Data        : 28/04/2010
//Descrição   : Ratear o valor das devoluções de acordo com o fim da manutenção.
//--------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 28/03/2007
// Pendência   : 24628
// Rotina      : SuspendeContribuicoes
// Descricao   : Permitir fazer a cobrança da última contribuição mesmo para
//               contribuição parametrizada como 'NÃO ENVIAR VALOR'.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 20/03/2007
// Pendência   : 22091
// Rotina      : SuspendeContribuicoes
// Descricao   : Correção para não permitir alterar valores de documentos que já
//               tenham sido enviados para Banco (contas a receber).
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 16/02/2007
// Pendência   : 24435
// Rotina      : SuspendeContribuicoes
// Descricao   : Correção para que quando cancelar as contribuições abertas após
//               a data de cancelamento, não cancelar as contribuições que já
//               tenham sido enviadas para o banco e aguardam seu recebimento.
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 23/10/2006
// Pendência   : 23563
// Rotina      : InsereNaPatrocinadoraNova
// Descricao   : Gravação do campo IDPARTICIPANTE na ReservaPart
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 18/10/2006
// Pendência   : 23533
// Rotina      : VoltaSituacoesParticipante
// Descricao   : Alteração da query para verificar o último evento corretamente.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 05/10/2006
// Pendência   : 23457
// Rotina      : AssociaNovasContribuicoes
// Descricao   : Alteração da chamada da rotina GERASALARIORETROATIVO para induzir
//               a gravação correta do valor do campo SALAUXDOENCA para requerimentos
//               de auxílio doença.
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 13/06/2005
//  Pendência  : 18853
//  Rotina     : SuspendeContribuicoes
//  Descrição  : Através do parâmetro prmFLGNAOACERTCONTDP, a fundação pode optar
//               por realizar acertos ou não no evento de demissão da patrocinadora
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Data        : 23/05/2005
// Pendência   : 18995
// Rotina      : ReativaParticipanteNaPatro
// Descrição   : No retorno do mantido para a condição de ativo o IDPESSJUR deve
//               vir como nulo.
//------------------------------------------------------------------------------
// Autor       : Paulo Ramos
// Data        : 03/02/2005
// Rotina      : SuspendeContribuicoes
// Descrição   : Quando não se informa o salário de participação sair da rotina
//               de forma que o evento seja cancelado.
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 26/01/2005
// Rotina      : AssociaRubricasIndividuais
// Descrição   : retirei a cláusula "AND  IDSEQINTERNOFB IS NULL" na verificação de existência da rubrica individual
//               por ocorrência de conmstraint no caso de inserção pela Folha
//------------------------------------------------------------------------------
// Autor       : Augusto
// Data        : 23/12/2004
// Rotina      : SuspendeContribuicoes
// Descrição   : Respeitar o FLGTPVLR no Preparo de Contribuição
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 04/12/2004
// Rotina      : AssociaRubricasIndividuais
// Descrição   : verifica se evento anterior já inseriu as reubricas de inserção automática
//------------------------------------------------------------------------------
// Autor       : Augusto
// Data        : 29/11/2004
// Rotina      : EfetuaPareclamentoContribuicao
// Descrição   : Nova função para chamar a rotina de parcelamento
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 05/10/2004
// Rotina      : AssociaNovasContribuicoes
// Descrição   : Acerto para reajustar salario, mesmo no mes de inicio
//------------------------------------------------------------------------------
// Autor       : Augusto
// Data        : 28/09/2004
// Pendência   : 17769
// Descrição   : AssociaNovasContribuicoes
//               Acerto para reajustar salario, mesmo no mes de inicio
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 20.09.2004
// Rotina      : ReativaParticipanteNaPatro
// Descrição   : retirei FLGUSOUBONUS da inserção na HISTFUNCPREV
//------------------------------------------------------------------------------
// Autor       : Camille
// Data        : 23.08.2004
// Pendência   : ------
// Descrição   : ReativaParticipanteNaPatro
//               Gravar histfuncprev com possivel alteracao de matricula e
//               atualizar depentit com possivel alteracao de matricula
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : GravaHSTCONTEVENTOSPRFechado
//  Data       : 18.08.2004
//  Pendencia  : ------
//  Descrição  : Estava associando contribuição de pensionista a participante
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : SuspendeContribuicoes
//  Data       : 13.04.2004
//  Pendencia  : 16409
//  Descrição  : Tratamento de acerto de contribuicoes já existentes no historico
//------------------------------------------------------------------------------
// Rotina      : SuspendeContribuicoes
// Autor(a)    : Camille
// Data        : 12.04.2004
// Pendência   : 16240
// Alteração   : Caso o evento de falecimento seja de uma pessoa que não estava
//               em beneficios, a tela que tratará da devolucao de contribuição
//               será a tela FDevolveContribuicoes, que irá inserir o historico
//               com o motivo de Receber Nao Identificado
//               Caso a pessoa esteja assistida, a propria rotina de encerramento
//               faz o acerto
//------------------------------------------------------------------------------
// Rotina      : AssociaNovasContribuicoes
// Autor(a)    : Gleyber
// Data        : 06/04/2004
// Pendência   : 16429
// Alteração   : Utilização do parâmetro prmFLGNAOTRAZOP para não apagar opções
//               de contribuições associadas - Apenas para evento de Reinscrição.
//------------------------------------------------------------------------------
// Rotina      : AssociaNovasContribuicoes
// Autor(a)    : Gleyber
// Data        : 23/03/2004
// Pendência   : 16282
// Alteração   : Mudança na query para selecionar as contribuições para envio
//               apenas de mantido ( FLGDESCFOLHA=0 ) ou de ativos ( FLGDESCFOLHA=1 )
//               e parametrizados como "ENVIA BASE" (B) ou "ENVIA VALOR" (V).
//------------------------------------------------------------------------------
// Rotina      : AssociaNovasContribuicoes
// Autor(a)    : Leo
// Data        : 10.03.2004
// Alteração   : criação do parâmetro não obrigatório (pbAbreTelaCadContrib = True)
//               que controla a chamada da tela de cadastro de contribuições
//------------------------------------------------------------------------------
// Rotina      : ExecutaRegraAssociaContribuicao
// Autor(a)    : Camille
// Data        : 30.01.2004
// Pendência   : 15982
// Alteração   : Incluir valores base e id do eventogerador
//------------------------------------------------------------------------------
// Rotina      : ReativaParticipanteNaPatro
// Autor(a)    : Camille
// Data        : 20.01.2004
// Pendência   : ------
// Alteração   : Permitir a passagem do salário do ativo na volta
//------------------------------------------------------------------------------
// Rotina      : AssociaNovasContribuicoes
// Autor(a)    : Camille
// Data        : 17.12.2003
// Pendência   : 15145
// Alteração   : Abrir a tela de contribuições de qualquer maneira
//               para que o usuario possa conferir ou alterar as contribuições
//               associadas antes das mesmas serem calculadas
//------------------------------------------------------------------------------
// Rotina      : GravaHSTCONTEVENTOSPRFechado
// Autor(a)    : Gleyber
// Data        : 26/11/2003
// Pendência   : 15145
// Alteração   : Complementando a pendência 15145 - acertando a passagem de datas
//               para as queries
//------------------------------------------------------------------------------
// Rotina      : ExecutaRegraAssociaContribuicao
// Autor(a)    : Gleyber
// Data        : 25/11/2003
// Pendência   : 15704
// Alteração   : Incluir o campo NOMECONTRIB na query que executa a regra de
//               associação de contribuicao
//------------------------------------------------------------------------------
// Rotina      : PodeRegistrarEvento
// Autor(a)    : Leo
// Data        : 18/11/2003
// Alteração   : retirei crítica de afastado na patrocinadora, pois ser afastado na patrocinadora
//               é, inclusive, um requisito para a manutenção
//------------------------------------------------------------------------------
// Rotina      : CartaEvento
// Autor(a)    : Gleyber
// Data        : 09/10/2003
// Pendência   : 14938
// Alteração   : Criação de rotina para imprimir cartas que estejam cadastradas
//------------------------------------------------------------------------------
// Rotina      : AssociaNovasContribuicoes
// Autor(a)    : Camille
// Data        : 27/06/2003
// Alteração   : Executar rotina que verifica se teve reajuste da data do evento até a dib
//               e reajustar o salário. Pendencia 14340
//------------------------------------------------------------------------------
// Rotina      : ReassociaContribuicoesParticipante
// Autor(a)    : Augusto
// Data        : 11/06/2003
// Alteração   : Acerto na rotina quando não encontra dados no Historico. 
//------------------------------------------------------------------------------
// Rotina      : AssociaNovasContribuicoes
// Autor(a)    : Gleyber
// Data        : 15/05/2003
// Alteração   : Pega data do benefício para gerar salário virtual (AS)
//------------------------------------------------------------------------------
// Rotina      : ReassociaContribuicoesParticipante
// Autor(a)    : Camille
// Data        : 29/04/2003
// Alteração   : Gravação dos novos campos DATAINICIO e DATAFINAL
//------------------------------------------------------------------------------
// Rotina      : GravaHSTCONTEVENTOSPRFechado
// Autor(a)    : Camille
// Data        : 29/04/2003
// Alteração   : Gravação dos novos campos DATAINICIO e DATAFINAL
//------------------------------------------------------------------------------
// Rotina      : SuspendeContribuicoes
// Autor(a)    : Augusto
// Data        : 25/04/2003
// Alteração   : Variavel IdLote iniciada com -1
//------------------------------------------------------------------------------
// Rotina      : AssociaRubricasIndividuais
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : rotina de associação de rubricas por evento gerador
//------------------------------------------------------------------------------
// Rotina    : ExecutaRegraAssociaContribuicao
// Autor     : Gleyber
// Data      : 17/10/2002
// Alteração : Passar o número do processo do benefício atual na query para regra
//             de associação de contribuições.
// -----------------------------------------------------------------------------
// Rotina    : VoltaSituacoesParticipante
// Autor     : Carlos Guedes
// Data      : 12/09/2002
// Alteração : A atualização estava pgando os campos IDSIT's..ATUAL quando o correto
//      era pegar os campos IDSIT's...NOVO.
// -----------------------------------------------------------------------------
// Rotina    : GravaHSTCONTEVENTOSPRNovaPatro
// Autor     : Carlos Guedes
// Data      : 03/09/2002
// Alteração : Função similar a GravaHSTCONTEVENTOSPRFechado,
//              porém com mais um parametro: PatroAntiga
// -----------------------------------------------------------------------------
// Rotina    : AssociaNovasContribuicoes
// Autor     : Camille
// Data      : 22.08.2002
// Alteração : Passar como data de inicio da geração de salários a data do evento
// e nao a dib do beneficio. como o parametro pdteventoini está com a dib
// buscar a data do evento
// -----------------------------------------------------------------------------
// Rotina    : ReativaParticipanteNaPatro
// Autor     : Carlos Guedes
// Data      : 11/07/2002:
// Alteração : Retirando do update o campo INSCRICAODATA da PARTPREVPLAN, pois
// ela não é alterada no caso da volta de mantido para ativo.
// *****************************************************************************


unit UEventos;

interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ppDB, ppDBPipe, ppDBBDE, ppBands, ppCtrls, ppClass, ppVar,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppEndUsr, ppTmPlat,
  FPreview, Pptypes;
  
var
   sMotivoEvento,
   strContribuicaoAAssociar: string;

   Function EfetuaPareclamentoContribuicao(piIdPessJur, piIdPlanoPrev, piIdTitular,
                                           piIdPessoa, piSeqProposta : Integer ) : Boolean;


   // Rotina para testar se o participante pode ser registrado em um determinado evento
   function PodeRegistrarEvento( qry: TwwQuery;
                              sIdpessJur, sIdPlanoPrev,sIdPessoa, sSeqProposta,
                              sFlgEvento, sIdSitFunc, sIdSitPart, sIdSitPlano: string;
                              var sMotivo : string;
                              sIDEvento :String = '0'): boolean;

   // Grava o Histórico de contribuições por eventos: Todas as Contribuições suspensas e todas as novas contribuições associadas
   function GravaHSTCONTEVENTOSPRFechado(pIdEventosPrev,
                                         pIdPlanoPrevDesassocia,
                                         pIdEventoGerador,
                                         pIdEventosPrvAntes,
                                         pIdPessoa,
                                         pIdPessJur,
                                         pSeqProposta,
                                         psSalPart,
                                         psPartReinsc,
                                         psDataEvento    : string;
                                         bEventoSuspendeContribuicoes: boolean;
                                         qryAux,
                                         qryGrava    : TwwQuery;
                                         pIdPlanoPrevAssocia : string  ): Boolean;

function AssociaNovasContribuicoes( pIdPessJur,
                                    pIdPlanoPrev,
                                    pIdPessoa,
                                    pSeqProposta,
                                    pIdEventoGerador,
                                    pDtEventoIni,
                                    pDtEventoFin,
                                    pMatricula,
                                    pIdSitPart,
                                    sSalarioPart             : string;
                                    bRequerBenef,
                                    bPrepararContrib,
                                    bManutBenefIndicado      : boolean;
                                    qryAux,
                                    qryGrava                 : TwwQuery;
                                    sFlgIntEvento            : string;
                                    piIdEventosPrev          : longint;
                                    psUltimoAnoMesContrib    : string;
                                    const psDataInicioEvento : string = '01/01/1900';
                                    qryContribAssocTransfPlano : TwwQuery = nil; 
                                    pbAbreTelaCadContrib  :  Boolean = True;
                                    psDataPrevPagamento   :  string = '' ): boolean;

   // Suspende a Cobrança de todas as Contribuições Previdenciarias do Participante
   function SuspendeContribuicoes( pIdPessJur,       pIdPlanoPrev,
                                   pIdPessoa,        pSeqProposta,
                                   pIdEventoGerador, pDtEventoIni,
                                   pDtEventoFin,     pMatricula,
                                   pIdSitPart                       : string;
                                   qryAux,           qryGrava       : TwwQuery;
                                   sFlgIntEvento,
                                   sFlgSitPartAnt                   : string;
                                   psDataFinal : String = ''        //BRUNO AZEVEDO SOL 130119 KINTANA 789646
                                   ) : boolean;

   // Verifica se o Participante possui beneficios para o evento solicitado (Somente para o Aberto)
   function ParticipantePossuiBeneficiosParaEvento(pIdPessJur, pIdPlanoPrev, pIdPessoa, pIdEventoGerador: string; qryAux: TwwQuery): boolean;

   function RetornaContribuicoesAntigas(pIdEventoAnterior, pIdEventoGerAnterior,
                                        pIdEventosPrev,    pIdPlanoPrev,  pIdEventoGerador,
                                        pIdPessoa,         pIdPessJur,    pSeqProposta,
                                        psDataFinalManut,  psDataVoltaAtivo,
                                        sIdSitPartAtual,  // situacao que o participante está agora, antes de dar o OK no evento
                                        sIdSitPartAntigo  // situacao para a qual o participante está retornando
                                                                   : string;
                                        bEventoSuspendeContribuicoes   : boolean;
                                        qryAux, qryGrava               : TwwQuery;
                                        sFlgIntEvento                  : string)   : boolean;

                                       
   function VerificaCopiaOpcaoContrib(qryAux: TwwQuery; sIdPessoa,    sIdPlanoPrev, sIdPessjur,
                                                        sSeqProposta, sIdContribuicao : string;
                                                        iNumOpcao   : Integer;
                                      var sValorBase1, sValorBase2, sValorBase3 : string ): string;

                                                        
   function ExecutaRegraDtFinalPDv(pIdRegraDtFinal, sSQL:string; var sMsgErro:string) :string;

   function BuscaOpcaoContOrigem(qry : TwwQuery; sIdPessoa,sIdPlanoPrev,
                                 sIdPessjur, sSeqProposta, sIdContribuicao:string):string;

                             
   function VoltaSituacoesParticipante( qry, qryAux : TwwQuery;
                                     piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta,
                                     piIdEventoEncerrado : longint;
                                     var piIdEventoAnterior,
                                         piIdSitPart : longint;
                                     var psFlgIntSitPart,
                                         sMsgErro : string;
                                     pbPedeEvento : boolean ) : boolean;

   function DesassociaContribuicoesParticipante( qry, qryAux : TwwQuery;
                                     piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta,
                                     piIdEventoEncerrado : longint;
                                     var sMsgErro : string) : boolean;

   function ReassociaContribuicoesParticipante( qry,
                                                qryAux               : TwwQuery;
                                                piIdPessJur,
                                                piIdPlanoPrev,
                                                piIdPessoa,
                                                piSeqProposta,
                                                piIdEventoAnterior,              // evento antes da concessao de beneficio
                                                piIdEventoAtual      : longint;  // evento da concessao de beneficio que está sendo encerrado agora
                                                var sMsgErro         : string) : boolean;

   function PedeSituacoesAoRetorno(var piIdSitFunc,
                                       piIdSitPart,
                                       piIdSitPlano,
                                       piIdEvento : longint;
                                       pbPedeEvento : boolean) : boolean;

   function AbateSalario          (piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                                   psDataReferencia : string;
                                   var sMsgErro : string ) : boolean;

   function GeraSalarioVoltaEvento ( qryAux : TwwQuery;
                                     piIdPessJur, piIdPlanoPrev, piIdPessoa,
                                     piSeqProposta,
                                     piIdEvento          : longint;
                                     psDataVoltaEvento   : string;
                                         piIdSitPart     : longint;
                                         psFlgSitPart    : string;
                                     var sMsgErro        : string) : boolean;

function ExecutaRegraAssociaContribuicao (piIdPessJur          : longint;
                                          piIdPlanoPrev        : longint;
                                          piIdPessoa           : longint;
                                          piSeqProposta        : longint;
                                          piIdContribuicao     : longint;
                                          piIdRegraValidacao   : longint;
                                          psDataEvento         : string;
                                          psPartReinsc         : string;
                                          psPartResgPoupanca   : string;
                                          psUltMesPreparo      : string;
                                          psSalPart            : string;
                                          psDataInscFund       : string;
                                          psIdEventoGerador    : string;     
                                          pdValorBase1         : double = 0; 
                                          pdValorBase2         : double = 0; 
                                          pdValorBase3         : double = 0  ): boolean; 

   function InsereNaPatrocinadoraNova ( qryAux, qryGrava : TwwQuery;
                                        piIdPessoa,
                                        piIdPessJurAntigo, piIdPessJurNovo,
                                        piIdPlanoPrevAntigo, piIdPlanoPrevNovo,
                                        piIdSitFuncNovo : longint;
                                        psMatriculaNova, psDataAdmissaoNova : string;
                                        piIdSitPartNovo, piIdSitPlanoNovo,
                                        piInscricaoNumeroNovo : longint;
                                        psDataInscricaoNova,
                                        psSalParticipacaoNovo   : string;
                                        piIdEventoGerador       : longint;
                                        psFlgIntEvento,
                                        psPartReinsc,
                                        psUltMesPreparo         : string;
                                        var sMsgErro            : string ) : boolean;

   function CancelaNaPatrocinadoraAntiga ( qryAux, qryGrava     : TwwQuery;
                                           piIdPessoa,
                                           piIdPessJurAntigo,
                                           piIdPlanoPrevAntigo,
                                           piIdSitPartAntiga,
                                           piIdEventoGerador    : longint;
                                           psFlgIntEvento,
                                           psDataVolta,
                                           psMatriculaAntiga    : string;
                                           var sMsgErro         : string;
                                           psDataFinal : String = '' ) : boolean;  //BRUNO AZEVEDO SOL 130119 KINTANA 789646

   function ReativaParticipanteNaPatro ( qryAux, qryGrava     : TwwQuery;
                                         piIdPessoa,
                                         piIdPessJurNovo,
                                         piIdPlanoPrevNovo,
                                         piIdSitFuncNova,
                                         piIdSitPartNova,
                                         piIdSitPlanoNova,
                                         piIdEventosPrev,
                                         piIdEventoGerador    : longint;
                                         sFlgIntEvento,
                                         psNovaDataAdmissao,
                                         psNovaDataInscricao  : string;
                                         var sMsgErro         : string;
                                         psSalarioAtivo       : string = '0'; 
                                         psMatricula          : string = '' ; 
                                         psDataVolta          : string = ''  ) : boolean; 

   function VoltaContribuicoesAnteriores( qryAux, qryGrava : TwwQuery;
                                          piIdPessoa,
                                          piIdPessJurAntigo, piIdPessJurNovo,
                                          piIdPlanoPrevAntigo, piIdPlanoPrevNovo,
                                          piIdSitPartAntigo,
                                          piIdSitPartNova,
                                          piIdEventoGeradorNovo,
                                          piIdEventosPrevNovo       : longint;
                                          psFlgIntEvento,
                                          psMatriculaAntiga,
                                          psMatriculaNova,
                                          psDataVolta,
                                          psDataEvento,
                                          psPartReinsc,
                                          psUltMesPreparo,
                                          psSalParticipacaoNovo,
                                          psDtInicioInsc            : string;
                                          var sMsgErro              : string ;
                                          psDataFinal : String = '' ) : boolean;    //BRUNO AZEVEDO SOL 130119 KINTANA 789646

   
   function InsereRubricaInformada ( qry             : TwwQuery;
                                  piIdPessJur,
                                  piIdPessoa      : longint;
                                  psFlgSitPart,
                                  psFlgIntEvento,
                                  psValorSalario,
                                  psAnoMesRef      : string ) : boolean;


   function GravaHSTCONTEVENTOSPRNovaPatro(pIdEventosPrev,
                                         pIdPlanoPrevDesassocia,
                                         pIdEventoGerador,
                                         pIdEventosPrvAntes,
                                         pIdPessoa,
                                         pIdPessJur,
                                         piIdPessJurAntigo,
                                         pSeqProposta,
                                         psSalPart,
                                         psPartReinsc,
                                         psDataEvento    : string;
                                         bEventoSuspendeContribuicoes: boolean;
                                         qryAux,
                                         qryGrava    : TwwQuery;
                                         pIdPlanoPrevAssocia : string  ): Boolean;


   function AssociaRubricasIndividuais(pIdPessJur,       pIdPlanoPrev,     pIdPessoa,
                                   pSeqProposta,     pIdEventoGerador, pDtEventoIni   : string;
                                   qryAux,           qryGrava                         : TwwQuery;
                                   var sMensErro : String ): boolean;

   
   // Gerar cartas do evento
   function CartaEvento(psIdPessoa, psIdPessjur, psIdPlanoPrev, psIdEventoGerador,
                        psSeqProposta : String) : Boolean;


implementation

uses
    uDataBase,
    UMensErro, DAprev, UAdmPrev, UContribuicaoPrev, FCadContribParticipante,
    UParticipante, FAguarde, UFuncoesUteis, UBeneficio, FPedeSituacoesAnt,
    FDevolveContribuicoes, USincronismo, uSistema, dRelatEspecificos,
    fParcelamento; 

   function GravaHSTCONTEVENTOSPRNovaPatro(pIdEventosPrev,
                                         pIdPlanoPrevDesassocia,
                                         pIdEventoGerador,
                                         pIdEventosPrvAntes,
                                         pIdPessoa,
                                         pIdPessJur,
                                         piIdPessJurAntigo,
                                         pSeqProposta,
                                         psSalPart,
                                         psPartReinsc,
                                         psDataEvento    : string;
                                         bEventoSuspendeContribuicoes: boolean;
                                         qryAux,
                                         qryGrava    : TwwQuery;
                                         pIdPlanoPrevAssocia : string  ): Boolean;
var
  iIdAssociacao: Integer;
  sDataInscFund, sMesRef,
  sValorBaseOrigem,
  sSQL: string;
  bErro: Boolean;

  sUltMesPreparo,
  sPartResgPoupanca,
  sAssoc1Op1,          sAssoc2Op1,         sAssoc3Op1,
  sAssoc1Op2,          sAssoc2Op2,         sAssoc3Op2,
  sAssoc1Op3,          sAssoc2Op3,         sAssoc3Op3 : string;
  bAssocia,
  bPartResgPoupanca : boolean;

Begin
  Result := False;
  iIdAssociacao := 0;

  // Grava HSTCONTEVENTOSPR as contribuições que serão suspensas
  if bEventoSuspendeContribuicoes
  then begin
     // Filtra todas as contribuições atuais que serão suspensas
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDCONTRIBUICAO FROM CONTRIBPREVPARTP '  +
                    ' WHERE SEQPROPOSTA = ' + pSeqProposta           + ' AND ' +
                    '       IDPESSJUR   = ' + piIdPessJurAntigo      + ' AND ' +
                    '       IDPLANOPREV = ' + pIdPlanoPrevDesassocia + ' AND ' +
                    '       IDPESSOA    = ' + pIdPessoa              + ' AND ' +
                    '       FLGCOBRA    = 1 ');
     qryAux.Open;
     while not qryAux.EOF do
     begin
        iIdAssociacao := iIdAssociacao + 1;
        // Grava todas as contribuiçoes atuais que serão suspensas, como não associadas
        qryGrava.Close;
        qryGrava.Sql.Clear;
        qryGrava.Sql.Add(' INSERT INTO HSTCONTEVENTOSPR(IDEVENTOSPREV, IDASSOCIACAO, IDEVENTOGERADORF, ' +
                         '             IDPLANOPREVF, IDCONTRIBUICAOF, TIPO, FLGASSOCIADA) ' +
                         ' VALUES( ' + pIdEventosPrev + ',' + IntToStr(iIdAssociacao) + ',' + pIdEventoGerador + ',' +
                                       pIdPlanoPrevDesassocia + ',' + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ',' + '''F''' + ', 0' + ')');
        try
           qryGrava.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;
        qryAux.Next;
     end;
  end;

  // Grava HSTCONTEVENTOSPR as novas contribuições que serão associadas
  // Filtra todas as novas contribuições que deverão ser associadas
  sDataInscFund := CalcDataInscFund( StrToInt(pIdPessJur),
                                     StrToInt(pIdPlanoPrevDesassocia),
                                     StrToInt(pIdPessoa),StrToInt(pSeqProposta),qryAux);

  
  if Trim(psDataEvento) = '' then psDataEvento := FormatDateTime('dd/mm/yyyy', date); 

  sMesRef := Copy(psDataEvento,7,4)+'/'+Copy(psDataEvento,4,2);

  if Trim(psSalPart) = ''
  then psSalPart :=  CalcSALPART(StrToInt(pIdPessJur), StrToInt(pIdPessoa),
                     sMesRef,qryAux);
  if Trim(psPartReinsc) = ''
  then psPartReinsc := '0';

  bPartResgPoupanca    := PartResgPoupanca( StrToInt(pIdPessJur),
                                            StrToInt(pIdPlanoPrevDesassocia),
                                            StrToInt(pIdPessoa),
                                            StrToInt(pSeqProposta),
                                           qryAux);
  if bPartResgPoupanca
  then sPartResgPoupanca := '1'
  else sPartResgPoupanca := '0';

  sUltMesPreparo      := CalcUltMesContribuicao( StrToInt(pIdPessJur),
                                                  StrToInt(pIdPlanoPrevDesassocia),
                                                  StrToInt(pIdPessoa),
                                                  StrToInt(pSeqProposta), -1,
                                                  sMesRef,
                                                  qryAux);
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT CPE.IDCONTRIBUICAO, CPE.IDREGRAVALIDAASS  '+
                 ' FROM   CONTPREV CP, CONTPREVEVENTO CPE           '+
                 ' WHERE  CPE.IDPLANOPREV     = ' + pIdPlanoPrevAssocia +
                 ' AND    CPE.IDEVENTOGERADOR = ' + pIdEventoGerador +
                 ' AND    CP.IDPLANOPREV      = CPE.IDPLANOPREV '+
                 ' AND    CP.IDCONTRIBUICAO   = CPE.IDCONTRIBUICAO ');
  qryAux.Open;
  qryAux.First;
  strContribuicaoAAssociar := '';

  // Chama regra de Validação de Associação de Contrib, para verificar se a
  // contribuição deve ser associada ao Participante ou não
  while not qryAux.EOF do
  begin
     bAssocia := False;
     bAssocia := ExecutaRegraAssociaContribuicao (StrToInt(pIdPessJur),
                                         StrToInt(pIdPlanoPrevAssocia  ),
                                         StrToInt(pIdPessoa),
                                         StrToInt(pSeqProposta),
                                         qryAux.FieldByName('IdContribuicao').AsInteger,
                                         qryAux.FieldByName('IdRegraValidaAss').AsInteger,
                                         psDataEvento,
                                         psPartReinsc,
                                         sPartResgPoupanca,
                                         sUltMesPreparo,
                                         psSalPart,
                                         sDataInscFund,pIdEventoGerador);

     if bAssocia                                   
     then strContribuicaoAAssociar := strContribuicaoAAssociar + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ', ';

     qryAux.Next;
  end;

  // Grava todas as novas contribuiçoes que serão associadas, como associadas
  if Trim(strContribuicaoAAssociar) <> ''
  then strContribuicaoAAssociar := Copy(strContribuicaoAAssociar, 1, Length(strContribuicaoAAssociar) - 2)
  else strContribuicaoAAssociar := '0';

  // Filtra somente as contribuição que a regra validou
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDCONTRIBUICAO FROM CONTPREVEVENTO ' +
                 ' WHERE IDPLANOPREV     = ' + pIdPlanoPrevAssocia     + ' AND ' +
                 '       IDEVENTOGERADOR = ' + pIdEventoGerador + ' AND ' +
                 '       IDCONTRIBUICAO IN (' + strContribuicaoAAssociar + ')');
  qryAux.Open;
  qryAux.First;
  while not qryAux.EOF do
  begin
     iIdAssociacao := iIdAssociacao + 1;
     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' INSERT INTO HSTCONTEVENTOSPR(IDEVENTOSPREV, IDASSOCIACAO, IDEVENTOGERADORF, ' +
                      '             IDPLANOPREVF, IDCONTRIBUICAOF, TIPO, FLGASSOCIADA) ' +
                      ' VALUES( ' + pIdEventosPrev + ',' + IntToStr(iIdAssociacao) + ',' + pIdEventoGerador + ',' +
                                    pIdPlanoPrevAssocia + ',' + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ',' + '''F''' + ', 1' + ')');
     try
        qryGrava.ExecSQL;
     except
        on E:EDBEngineError do
           begin
                MostrarErro(E);
                Exit;
           end;
     end;
     qryAux.Next;
  end;

  Result := True;
End;


function PodeRegistrarEvento( qry: TwwQuery;
                              sIdpessJur, sIdPlanoPrev,sIdPessoa, sSeqProposta,
                              sFlgEvento, sIdSitFunc, sIdSitPart, sIdSitPlano: string;
                              var sMotivo : string;
                              sIDEvento :String = '0'): boolean;
var sFlgSitFunc, sFlgSitPart, sFlgSitPlano : string;
    bParticipanteFalecido : boolean;
begin
  Result := True;
  bParticipanteFalecido := False;
  sMotivo               := '';

  // Buscar os flags das 3 situacoes
  sFlgSitFunc  := '';
  sFlgSitPart  := '';
  sFlgSitPlano := '';
  if sIdSitFunc <> ''
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT TIPOSIT FROM SITFUNC WHERE IDSITFUNC = '+sIdSitFunc);
     qry.Open;
     if not qry.IsEmpty
     then sFlgSitFunc := qry.FieldByName('TipoSit').AsString;
  end;

  if sIdSitPart <> ''
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT FLGINTERNO FROM SITPART WHERE IDSITPART = '+sIdSitPART);
     qry.Open;
     if not qry.IsEmpty
     then sFlgSitPART := qry.FieldByName('FlgInterno').AsString;
  end;

  if sIdSitPlano <> ''
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT FLGINTERNO FROM SITPLANOPREV  WHERE IDSITPLANOPREV = '+sIdSitPlano);
     qry.Open;
     if not qry.IsEmpty
     then sFlgSitPlano := qry.FieldByName('FlgInterno').AsString;
  end;

  // Verificar se participante é falecido
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(' SELECT DATAMORTE FROM PESSOAFISICA WHERE IDPESSOA = '+sIdPessoa);
  qry.Open;
  if (not qry.IsEmpty) and (qry.FieldByName('DataMorte').AsString <> '')
  then bParticipanteFalecido := True
  else bParticipanteFalecido := False;
  qry.Close;

  // Tratar condicoes para cada caso
  // ***************************************************************************
  // ************************* DEMISSAO COM CANCELAMENTO ***********************
  // ***************************************************************************
  if sFlgEvento = 'DC'  //'Demissão com Cancelamento'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;

  end

  // ***************************************************************************
  // ************************* DEMISSAO COM MANUTENCAO DE CONTRIBUICAO *********
  // ***************************************************************************
  else if (sFlgEvento = 'DM') or (sFlgEvento = 'PD') //'Demissão com Manutenção de Contribuição'
  then begin                                         //'Demissão com Manutenção por PDV'
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo  := 'O participante está registrado como falecido no sistema.';
        Result   := False;
        Exit;
     end;

     // Verificar se participante está em algum Plano de Demissao
     if (sFlgEvento = 'PD') and (sFlgSitPart = 'MA')
     then begin
        sMotivo  := 'O participante já está registrado como Mantido em Programa de Demissão.';
        Result   := False;
        Exit;
     end;

     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo  := 'O participante está Cancelado na Fundação .';
        Result   := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  // ***************************************************************************
  // ************************* DEMISSAO COM MANUTENCAO DE SALDO DE CONTA *******
  // ***************************************************************************
  else if sFlgEvento = 'DS'  //'Demissão com Manutenção de Saldo de Conta'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
  end
  // ***************************************************************************
  // ************************* DEMISSAO DA PATROCINADORA                 *******
  // ***************************************************************************
  else if sFlgEvento = 'DP'  //'Demissão da Patrocinadora'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;

     // Verificar se participante está demitido
     if (sFlgSitFunc = '0') or (sFlgSitFunc = '1') or (sFlgSitFunc = '6') or (sFlgSitFunc = '7')
     then begin
        sMotivo  := 'O participante está demitido da patrocinadora.';
        Result   := False;
        Exit;
     end;
  end
  // ***************************************************************************
  // ************************* MANUTENCAO PARCIAL ******************************
  // ***************************************************************************
  else if sFlgEvento = 'MP'  //'Manutenção Parcial'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante já não está manutencao parcial
     if sFlgSitPart = 'MP'
     then begin
        sMotivo := 'O participante já está em Manutenção Parcial no sistema.';
        Result  := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;
     // Verificar se participante está em PID/PIA
     if sFlgSitFunc = 'P'
     then begin
        sMotivo  := 'O participante está em PID ou PIA .';
        Result   := False;
        Exit;
     end;

     // Verificar se participante já não está em Manutencao Total
     if (sFlgSitPart = 'MA')
     then begin
        sMotivo  := 'O participante já está em Manutenção Total no sistema.';
        Result   := False;
        Exit;
     end;

     // Verificar se participante já não está demitido
     if sFlgSitFunc = 'D'
     then begin
        sMotivo := 'O participante já está desligado da patrocinadora no sistema.';
        Result  := False;
        Exit;
     end;
     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  // ***************************************************************************
  // ************************* AFASTAMENTO *************************************
  // ***************************************************************************
  else if sFlgEvento = 'AF'  //'Afastamento'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;


  end
  // ***************************************************************************
  // ************************* TEMPO DE SERVICO AFASTAMENTO ********************
  // ***************************************************************************
  else if sFlgEvento = 'TS'  //'Tempo de Serviço'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  // ***************************************************************************
  // ************************* IDADE *******************************************
  // ***************************************************************************
  else if sFlgEvento = 'ID'  //'Idade'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  // ***************************************************************************
  // ************************* INCAPACIDADE ************************************
  // ***************************************************************************
  else if sFlgEvento = 'IN'  //'Incapacidade'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  // ***************************************************************************
  // ************************* DOENCA ******************************************
  // ***************************************************************************
  else if sFlgEvento = 'DO'  //'Doença'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;

     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'AC'  //'Acidente'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'OE'  //'Outros Eventos Temporários'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'CP'  //'Cancelamento por Iniciativa do Participante'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'CI'  //'Cancelamento por Inadimplência'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'CD'  //'Cancelamento por Descumprimento de Prazo'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'RI'  //'Registro de Inadimplência'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'FL'  //'Falecimento'
  then begin
     // Verificar se participante não está falecido

     if (sFlgSitPart = 'CA') and (sIDEvento<>'346') and (sIdEvento <> '387')    //edilaine - SIG86058
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'FR'  //'Função de Risco'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'EB'  //'Encerramento de Benefício'
  then begin
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'RP'  //'Resgate a Pedido'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'TR'  //'Transferência de Reserva'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'TP'  //'Transferência de Plano'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'MU'  //'Mudança de Perfil'
  then begin
  end
  else if sFlgEvento = 'RA'  //'Retorno de Mantido Para Ativo'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'IP'  //'Inscrição do Participante'
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
     // Verificar se participante está cancelado na fundacao
     if sFlgSitPart = 'CA'
     then begin
        sMotivo := 'O participante está Cancelado na Fundação .';
        Result  := False;
        Exit;
     end;

     // Verificar se participante está desligado do Plano
     if sFlgSitPlano = 'DE'
     then begin
        sMotivo := 'O participante está Desligado do Plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'RM'  //'Reinscrição do Participante'
  then begin
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;

     // Verificar se participante está NORMAL no Plano
     if (sFlgSitPlano = 'NO') and (sFlgSitPart = 'AT') 
     then begin
        sMotivo := ' O participante está com situação NORMAL no plano e ATIVO na fundação.';
        Result  := False;
        Exit;
     end;

     // Se participante não estiver ativo na patrocinadora, mas estiver Assistido
     // no plano, entao ele NAO pode reinscrever. Caso contrário, o participante
     // não está ativo na patrocinadora mas nào está assistido no plano, entao
     // pode reinscrever
     if (sFlgSitFunc <> 'A')  and (sFlgSitPart = 'AS')
     then begin
        sMotivo := ' O participante está ASSISTIDO no plano.';
        Result  := False;
        Exit;
     end;
  end
  else if sFlgEvento = 'AI'  // Exclusiva do INSS
  then begin
     // Verificar se participante não está falecido
     if bParticipanteFalecido
     then begin
        sMotivo        := 'O participante está registrado como falecido no sistema.';
        Result         := False;
        Exit;
     end;
  end;
end;

function GravaHSTCONTEVENTOSPRFechado(pIdEventosPrev,
                                      pIdPlanoPrevDesassocia,
                                      pIdEventoGerador,
                                      pIdEventosPrvAntes,
                                      pIdPessoa,
                                      pIdPessJur,
                                      pSeqProposta,
                                      psSalPart,
                                      psPartReinsc,
                                      psDataEvento    : string;
                                      bEventoSuspendeContribuicoes: boolean;
                                      qryAux,
                                      qryGrava    : TwwQuery;
                                      pIdPlanoPrevAssocia : string  ): Boolean;
var
  iIdAssociacao: Integer;
  sDataInscFund, sMesRef,
  sValorBaseOrigem,
  sSQL: string;
  bErro: Boolean;

  sUltMesPreparo,
  sPartResgPoupanca,
  sAssoc1Op1,          sAssoc2Op1,         sAssoc3Op1,
  sAssoc1Op2,          sAssoc2Op2,         sAssoc3Op2,
  sAssoc1Op3,          sAssoc2Op3,         sAssoc3Op3 : string;
  bAssocia,
  bPartResgPoupanca : boolean;

  sDataAux : string;

begin
  Result := False;
  iIdAssociacao := 0;

  // Grava HSTCONTEVENTOSPR as contribuições que serão suspensas
  if bEventoSuspendeContribuicoes
  then begin

      qryGrava.Close;
      qryGrava.SQL.Clear;
      qryGrava.SQL.Add('INSERT INTO HSTCONTEVENTOSPR(IDEVENTOSPREV, IDASSOCIACAO, IDEVENTOGERADORF, '+
                       ' IDPLANOPREVF, IDCONTRIBUICAOF, TIPO, FLGASSOCIADA, DATAINICIO, DATAFINAL)  '+
                       'SELECT '+pIdEventosPrev+' , ROWNUM, '+pIdEventoGerador +                  ','+
                       ' CPP.IDPLANOPREV, CPP.IDCONTRIBUICAO, ''F'',0,      '+
                       ' CPP.DATAINICIO, CPP.DATAFINAL '+
                       ' FROM CONTRIBPREVPARTP CPP                       ' +
                       ' WHERE SEQPROPOSTA = ' + pSeqProposta +
                       ' AND   IDPESSJUR   = ' + pIdPessJur   +
                       ' AND   IDPLANOPREV = ' + pIdPlanoPrevDesassocia +
                       ' AND   IDPESSOA    = ' + pIdPessoa    +
                       ' AND   FLGCOBRA    = 1                        ' );

      // Andre Imakawa - SIG 74780 - Inicio
      if pIdEventoGerador = '356' then
        qryGrava.SQL.Add(' AND NOT EXISTS (SELECT 1 FROM CONTPREV CP WHERE CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO AND CP.FLGINTERNO LIKE ''M%'')' );
      // Andre Imakawa - SIG 74780 - Fim
      
      try
         qryGrava.ExecSQL;
         iIdAssociacao := qryGrava.RowsAffected;
      except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Exit;
         end;
      end;
  end;

  // Grava HSTCONTEVENTOSPR as novas contribuições que serão associadas
  // Filtra todas as novas contribuições que deverão ser associadas
  sDataInscFund := CalcDataInscFund( StrToInt(pIdPessJur),
                                     StrToInt(pIdPlanoPrevDesassocia),
                                     StrToInt(pIdPessoa),StrToInt(pSeqProposta),qryAux);

  
  if Trim(psDataEvento) = '' then psDataEvento := FormatDateTime('dd/mm/yyyy', date); 

  sMesRef := Copy(psDataEvento,7,4)+'/'+Copy(psDataEvento,4,2);

  if Trim(psSalPart) = ''
  then psSalPart :=  CalcSALPART(StrToInt(pIdPessJur), StrToInt(pIdPessoa),
                     sMesRef,qryAux);
  if Trim(psPartReinsc) = ''
  then psPartReinsc := '0';

  bPartResgPoupanca    := PartResgPoupanca( StrToInt(pIdPessJur),
                                            StrToInt(pIdPlanoPrevDesassocia),
                                            StrToInt(pIdPessoa),
                                            StrToInt(pSeqProposta),
                                           qryAux);
  if bPartResgPoupanca
  then sPartResgPoupanca := '1'
  else sPartResgPoupanca := '0';

  sUltMesPreparo      := CalcUltMesContribuicao( StrToInt(pIdPessJur),
                                                  StrToInt(pIdPlanoPrevDesassocia),
                                                  StrToInt(pIdPessoa),
                                                  StrToInt(pSeqProposta), -1,
                                                  sMesRef,
                                                  qryAux);
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT CPE.IDCONTRIBUICAO, CPE.IDREGRAVALIDAASS  '+
                 ' FROM   CONTPREV CP, CONTPREVEVENTO CPE           '+
                 ' WHERE  CPE.IDPLANOPREV     = ' + pIdPlanoPrevAssocia +
                 ' AND    CPE.IDEVENTOGERADOR = ' + pIdEventoGerador +
                 ' AND    CP.FLGPAGADOR       <> ''R''               '+
                 ' AND    CP.IDPLANOPREV      = CPE.IDPLANOPREV '+
                 ' AND    CP.IDCONTRIBUICAO   = CPE.IDCONTRIBUICAO ');

                 //Renato Visoni SOL 155863 Kintana 1216997
                 if (pIdEventoGerador = '4') then begin // Falecimento
                   qryAux.Sql.Add(' AND EXISTS (SELECT 1 ');
                   qryAux.Sql.Add('             FROM benefbfciario bf, beneficio b ');
                   qryAux.Sql.Add('             WHERE bf.idbeneficio = b.idbeneficio AND ');
                   qryAux.Sql.Add('             b.ideventogerador = cpe.ideventogerador AND ');
                   qryAux.Sql.Add('             bf.idplanoprev = cpe.idplanoprev AND ');
                   qryAux.Sql.Add('             bf.idsitbeneficio = 4 AND ');
                   qryAux.Sql.Add('             b.flgpeculio = 0 AND ');
                   qryAux.Sql.Add('             bf.idtitular = '+ pIdPessoa+')');
                 end;
                 //Renato Visoni SOL 155863 Kintana 1216997


  qryAux.Open;
  qryAux.First;
  strContribuicaoAAssociar := '';

  // Chama regra de Validação de Associação de Contrib, para verificar se a
  // contribuição deve ser associada ao Participante ou não
  while not qryAux.EOF do
  begin
     bAssocia := False;
     bAssocia := ExecutaRegraAssociaContribuicao (StrToInt(pIdPessJur),
                                         StrToInt(pIdPlanoPrevAssocia  ),
                                         StrToInt(pIdPessoa),
                                         StrToInt(pSeqProposta),
                                         qryAux.FieldByName('IdContribuicao').AsInteger,
                                         qryAux.FieldByName('IdRegraValidaAss').AsInteger,
                                         psDataEvento,
                                         psPartReinsc,
                                         sPartResgPoupanca,
                                         sUltMesPreparo,
                                         psSalPart,
                                         sDataInscFund,pIdEventoGerador);

     if bAssocia
     then strContribuicaoAAssociar := strContribuicaoAAssociar + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ', ';

     qryAux.Next;
  end;

  // Grava todas as novas contribuiçoes que serão associadas, como associadas
  if Trim(strContribuicaoAAssociar) <> ''
  then strContribuicaoAAssociar := Copy(strContribuicaoAAssociar, 1, Length(strContribuicaoAAssociar) - 2)
  else strContribuicaoAAssociar := '0';

  // Filtra somente as contribuição que a regra validou
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDCONTRIBUICAO FROM CONTPREVEVENTO ' +
                 ' WHERE IDPLANOPREV     = ' + pIdPlanoPrevAssocia     + ' AND ' +
                 '       IDEVENTOGERADOR = ' + pIdEventoGerador + ' AND ' +
                 '       IDCONTRIBUICAO IN (' + strContribuicaoAAssociar + ')');
  qryAux.Open;
  qryAux.First;
  while not qryAux.EOF do
  begin
     iIdAssociacao := iIdAssociacao + 1;
     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' INSERT INTO HSTCONTEVENTOSPR(IDEVENTOSPREV, IDASSOCIACAO, IDEVENTOGERADORF, ' +
                      '             IDPLANOPREVF, IDCONTRIBUICAOF, TIPO, FLGASSOCIADA) ' +
                      ' VALUES( ' + pIdEventosPrev + ',' + IntToStr(iIdAssociacao) + ',' + pIdEventoGerador + ',' +
                                    pIdPlanoPrevAssocia + ',' + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ',' + '''F''' + ', 1' + ')');
     try
        qryGrava.ExecSQL;
     except
        on E:EDBEngineError do
           begin
                MostrarErro(E);
                Exit;
           end;
     end;
     qryAux.Next;
  end;

  Result := True;
end;

function RetornaContribuicoesAntigas( pIdEventoAnterior,
                                      pIdEventoGerAnterior,
                                      pIdEventosPrev,
                                      pIdPlanoPrev,
                                      pIdEventoGerador,
                                      pIdPessoa,
                                      pIdPessJur,
                                      pSeqProposta,
                                      psDataFinalManut,  psDataVoltaAtivo,
                                      sIdSitPartAtual,  // situacao que o participante está agora, antes de dar o OK no evento
                                      sIdSitPartAntigo  // situacao para a qual o participante está retornando
                                                                   : string;
                                      bEventoSuspendeContribuicoes : boolean;
                                      qryAux, qryGrava             : TwwQuery;
                                      sFlgIntEvento                : string)      : boolean;
var
  iIdAssociacao, iIdLote : Integer;
  sSQL,
  sMatricula,
  sInscricaoData,
  sDataAdmissao,
  sDataDemissao,
  sDataCancelamento,
  sSexo,
  sDataNasc,
  sNomePatro,
  sNomePlano,
  sNomeParticipante,
  sTempoServAnterior,
  sTempoNaoCreditado,
  sDtInicioInsc,
  sPartReinscrito,
  sSalarioPart,
  sValorProvento,
  sMesRef,
  sPartResgPoupanca,
  sUltMesPreparo,
  sInscricaoDataFund,
  sDescPreparo,
  sMsgErro,
  sProximoAnoMesCob, sFlgIntSitPart, sDataCobranca,
  strContribuicaoADesassociar,
  sIdRegraCalcOp1, sIdRegraCalcOp2, sIdRegraCalcOp3,
  sNomeOp1,        sNomeOp2,        sNomeOp3,
  sValorBase1,     sValorBase2,     sValorBase3,
  sAssoc1Op1,      sAssoc2Op1,      sAssoc3Op1,
  sAssoc1Op2,      sAssoc2Op2,      sAssoc3Op2,
  sAssoc1Op3,      sAssoc2Op3,      sAssoc3Op3,
  sDtInicioPreparo, sDtFimPreparo,  sValorRegra                : string;
  dDiferenca,
  rValorOpcao1,    rValorOpcao2,    rValorOpcao3 : double;
  bErro,
  bPartResgPoupanca: Boolean;
begin
  Result := False;
  iIdAssociacao := 0;
  strContribuicaoADesassociar := '';
  strContribuicaoAAssociar    := '';
  sFlgIntSitPart := RetornaFlgIntSitPart (StrToInt(sIdSitPartAtual));

  
  if Trim(psDataVoltaAtivo) = '' then psDataVoltaAtivo := FormatDateTime('dd/mm/yyyy', date);
  if Trim(psDataFinalManut) = '' then psDataFinalManut := FormatDateTime('dd/mm/yyyy', StrToDate(psDataVoltaAtivo) - 1);
  

  // Grava data da volta da manutenção
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' UPDATE EVENTOSPREV '+
                   ' SET    DATAVOLTA        = TO_DATE('''+psDataFinalManut+''',''dd/mm/yyyy'')'+
                   ' WHERE  IDEVENTOSPREV    = '+pIdEventoAnterior+
                   ' AND    IDEVENTOGERADOR  = '+pIdEventoGerAnterior);
  try
     qryGrava.ExecSQL;
  except
     on E:EDBEngineError do
        begin
             MostrarErro(E);
             Exit;
        end;
  end;

  // Grava HSTCONTEVENTOSPR as contribuições que serão suspensas
  if bEventoSuspendeContribuicoes
  then begin
     // Filtra todas as contribuições atuais que serão suspensas
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDCONTRIBUICAO FROM CONTRIBPREVPARTP ' +
                    ' WHERE  SEQPROPOSTA  =  ' + pSeqProposta + ' AND ' +
                    '        IDPESSJUR    =  ' + pIdPessJur   + ' AND ' +
                    '        IDPLANOPREV  =  ' + pIdPlanoPrev + ' AND ' +
                    '        IDPESSOA     =  ' + pIdPessoa    + ' AND ' +
                    '        FLGDESCFOLHA = 0                     AND ' +
                    '        FLGCOBRA     = 1 ');

     qryAux.Open;
     while not qryAux.EOF do
     begin
        iIdAssociacao := iIdAssociacao + 1;
        strContribuicaoADesassociar := strContribuicaoADesassociar +
                                       qryAux.FieldByName('IDCONTRIBUICAO').AsString+',';

        qryAux.Next;
     end; // while
  end; // if suspende

  if strContribuicaoADesassociar <> ''
  then begin
       //Grava FlgCobra = 0 p/ as contribuições atuais, suspende contribuição
       strContribuicaoADesassociar := Copy(strContribuicaoADesassociar, 1,Length(strContribuicaoADesassociar)-1);
       qryGrava.Sql.Clear;
       qryGrava.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0, ' +
                        '        DATAFINAL   = TO_DATE('''+psDataFinalManut+''',''dd/mm/yyyy'')'+
                        ' WHERE  SEQPROPOSTA = ' + pSeqProposta + ' AND ' +
                        '        IDPESSJUR   = ' + pIdPessJur   + ' AND ' +
                        '        IDPLANOPREV = ' + pIdPlanoPrev + ' AND ' +
                        '        IDPESSOA    = ' + pIdPessoa    + ' AND ' +
                        '        IDCONTRIBUICAO IN ('+strContribuicaoADesassociar+')');
       try
          qryGrava.ExecSQL;
       except
          on E:EDBEngineError do
          begin
             MostrarErro(E);
             Exit;
          end;
       end;
  end;
  qryAux.Close;

  // Preencher dados do elegivel / participante
  frmAguarde.Mostra('Verificando dados do participante  ... ');
  qryAux.Close;
  qryAux.SQl.Clear;
  qryAux.SQL.Add(' SELECT EL.DATAADMISSAO,  EL.DATADEMISSAO, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO, '+
                 '        PP.INSCRICAODATA, PP.DTINICIOINSC, PP.DATACANCELAMENTO,  PP.SALMANTIDO, '+
                 '        PP.SALPARTICIPACAO, PF.DATANASC, PF.DATAMORTE, PF.SEXO,  PL.NOME AS NOMEPLANO, '+
                 '        PESPATRO.NOME AS NOMEPATRO, PESPART.NOME AS NOMEPARTICIPANTE,  PP.IDSITPART,   '+
                 '        EL.MATRICULA '+
                 ' FROM   PESSOAFISICA PF, PESSOA PESPATRO, PESSOA PESPART, PLANPREV PL, ELEGPATRO EL, PARTPREVPLAN PP '+
                 ' WHERE  (PP.IDPESSOA       = '+pIdPessoa+') '+
                 ' AND    (PP.IDPESSJUR      = '+pIdPessJur+')'+
                 ' AND    (PP.IDPLANOPREV    = '+pIdPlanoPrev+')'+
                 ' AND    (PESPART.IDPESSOA  = '+pIdPessoa+')'+
                 ' AND    (PESPATRO.IDPESSOA = '+pIdPessJur+')'+
                 ' AND    (PL.IDPLANOPREV    = '+pIdPlanoPrev+')'+
                 ' AND    (PP.IDPESSOA       = EL.IDPESSOA) '+
                 ' AND    (PP.IDPESSJUR      = EL.IDPESSJUR) '+
                 ' AND    (PF.IDPESSOA       = EL.IDPESSOA) ');
  try
     qryAux.Open;
  except
     on E:EDBEngineError do
     begin
        frmAguarde.Apaga;
        MostrarErro(E);
        Exit;
     end;
  end;

  if qryAux.IsEmpty
  then begin
     frmAguarde.Apaga;
     MsgDlg('Erro na abertura dos dados do participante. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  sInscricaoData    := qryAux.FieldByName('InscricaoData').AsString;
  sDataAdmissao     := qryAux.FieldByName('DATAADMISSAO').AsString;
  sDataDemissao     := qryAux.FieldByName('DATADEMISSAO').AsString;
  sDataCancelamento := qryAux.FieldByName('DATACANCELAMENTO').AsString;
  sSexo             := qryAux.FieldByName('SEXO').AsString;
  sDataNasc         := qryAux.FieldbyName('DataNasc').AsString;
  sNomePatro        := qryAux.FieldbyName('NomePatro').AsString;
  sNomePlano        := qryAux.FieldbyName('NomePlano').AsString;
  sNomeParticipante := qryAux.FieldbyName('NomeParticipante').AsString;
  sMatricula        := qryAux.FieldbyName('MATRICULA').AsString;

  if Trim(qryAux.FieldByName('TempoServAnterior').AsString) = ''
  then sTempoServAnterior := '0'
  else sTempoServAnterior := qryAux.FieldByName('TempoServAnterior').AsString;

  if Trim(qryAux.FieldByName('TempoNaoCreditado').AsString) = ''
  then sTempoNaoCreditado := '0'
  else sTempoNaoCreditado := qryAux.FieldByName('TempoNaoCreditado').AsString;

  sDtInicioInsc  := qryAux.FieldByName('DtInicioInsc').AsString;
  if qryAux.FieldByName('InscricaoData').AsString <> qryAux.FieldByName('DtInicioInsc').AsString
  then sPartReinscrito := '1'
  else sPartReinscrito := '0';

  sValorProvento := '0';

  if (Trim(qryAux.FieldByName('SALMANTIDO').AsString) <> '') and
          (qryAux.FieldByName('SALMANTIDO').AsFloat    > 0)
  then sValorProvento  := qryAux.FieldByName('SALMANTIDO').AsString;
  qryAux.Close;

  // Verificar se é necessário cobrar a ultima contribuicao do evento que está
  // sendo encerrado, da seguinte forma :
  //     Verificar se alguma contribuicao já foi cobrada no mes do final da manutencao
  //     Se NAO foi cobrada nenhuma contribuicao
  //     Entao preparar a ultima contribuicao, do dia 01 do mes do final da
  //           manutencao até a data final da manutencao
  //     Se FOI cobrada alguma contribuicao
  //     Entao ela foi cobrada integral. Assim, o sistema deve calcular o valor
  //           pro-rata da contribuicao e verificar se a contribuicao já foi
  //           paga pelo participante.
  //           Se sim - a contribuicao já foi paga pelo participante
  //           Entao devolver a parte a maior (se houver)
  //           Senao entao alterar o valor esperado, para quando ela for recebida
  //                 gerar uma divergencia
  // Verificando se alguma contribuicao foi cobrada no mes do final da manutencao

  if Trim(strcontribuicaoADesassociar) <> ''
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT H.VALORESPERADO, H.VALORRECEBIDO, H.SITRECEBIMENTO '+
                    ' FROM   CONTPREVEVENTO C, HSTCONTRIBPREV H '+
                    ' WHERE  H.MESREFERENCIA   = '''   + Copy(psDataFinalManut,7,4)+'/'+Copy(psDataFinalManut,4,2)+''''+
                    ' AND    H.IDPESSJUR       = '     + pIdPessJur   +
                    ' AND    H.IDPLANOPREV     = '     + pIdPlanoPrev +
                    ' AND    H.IDPESSOA        = '     + pIdPessoa    +
                    ' AND    H.SEQPROPOSTA     = '     + pSeqProposta +
                    ' AND    C.IDEVENTOGERADOR = '     + pIdEventoGerAnterior +
                    ' AND    H.IDCONTRIBUICAO  IN ( '  + strContribuicaoADesassociar+') '+
                    ' AND    H.IDPLANOPREV     = C.IDPLANOPREV '+
                    ' AND    H.IDCONTRIBUICAO  = C.IDCONTRIBUICAO ');

     try
        qryAux.Open;
     except
        on E:EDBEngineError do
        begin
           frmAguarde.Apaga;
           MostrarErro(E);
           Exit;
        end;
     end;

     if qryAux.IsEmpty
     then begin // nao cobrou as contribuicoes do evento que está sendo encerrado no mes do final
        // Cobrar ultima contribuicao do evento que está sendo encerrado do dia 01
        // a data final do evento
        frmAguarde.Mostra('Cobrando última contribuição...');
        sDescPreparo := 'Encerramento de Evento('+sFlgIntEvento+') - Última Contribuição  - Matrícula: ' + sMatricula;
        iIdLote := -1;
        sDtInicioPreparo := '01/'+Copy(psDataFinalManut,4,7);
        sDtFimPreparo    := psDataFinalManut;
        if PreparaContribuicao(StrToInt(pIdPessJur), StrToInt(pIdPlanoPrev), prmIdMotivoContrib,
                               0, qryGrava,  qryAux,
                               sSQL, '',     // sSQLRegra vai vazio para ser montada dentro da funcao
                               '',   '',
                               sFlgIntSitPart,
                               sDtInicioPreparo,
                               sDtFimPreparo,
                               sDescPreparo,  'R', 'RA',
                               False, False, sMsgErro, iIdLote,
                               sValorProvento, sIdSitPartAtual,
                               sFlgIntEvento, True, True,'',False, StrToInt(pIdEventoGerAnterior), '','',1,0)
        then begin
           frmAguarde.Apaga;
           MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
           Exit;
        end;
     end
     else begin // foi cobrada alguma contribuicao
        //  Calcular o valor pro-rata da contribuicao e verificar se a contribuicao já foi
        //  paga pelo participante.
        //  Se sim - a contribuicao já foi paga pelo participante
        //  Entao devolver a parte a maior (se houver)
        //  Senao entao alterar o valor esperado, para quando ela for recebida
        //  gerar uma divergencia

        // 1o. Abrir query com todas as contribuicoes que o participante deverá pagar
        //     pela ultima vez
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT CPP.VALORBASE1,     CPP.VALORBASE2,    CPP.VALORBASE3,     '+
                       '        CPP.IDCONTRIBUICAO, CP.IDREGRACALCULO, CP.IDREGRAULTPAGTO, '+
                       '        CPP.DATAINICIO,     CPP.DATAFINAL,                         '+
                       '        H.MESREFERENCIA,    H.VALORESPERADO,   H.VALORRECEBIDO,    '+
                       '        H.SITRECEBIMENTO,   H.NUMRECEBIMENTO                       '+
                       ' FROM   CONTPREV CP, CONTRIBPREVPARTP CPP, CONTPREVEVENTO C, HSTCONTRIBPREV H '+
                       ' WHERE  H.MESREFERENCIA(+)   = '''   + Copy(psDataFinalManut,7,4)+'/'+Copy(psDataFinalManut,4,2)+''''+
                       ' AND    CPP.IDPESSJUR       = '     + pIdPessJur   +
                       ' AND    CPP.IDPLANOPREV     = '     + pIdPlanoPrev +
                       ' AND    CPP.IDPESSOA        = '     + pIdPessoa    +
                       ' AND    CPP.SEQPROPOSTA     = '     + pSeqProposta +
                       ' AND    C.IDEVENTOGERADOR = '     + pIdEventoGerAnterior +
                       ' AND    H.IDCONTRIBUICAO  IN ( '  + strContribuicaoADesassociar+') '+
                       ' AND    CPP.IDPLANOPREV     = C.IDPLANOPREV       '+
                       ' AND    CPP.IDCONTRIBUICAO  = C.IDCONTRIBUICAO    '+
                       ' AND    CPP.IDPLANOPREV     = CP.IDPLANOPREV      '+
                       ' AND    CPP.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO   '+
                       ' AND    CPP.IDPESSJUR       = H.IDPESSJUR(+)      '+
                       ' AND    CPP.IDPLANOPREV     = H.IDPLANOPREV(+)    '+
                       ' AND    CPP.IDPESSOA        = H.IDPESSOA(+)       '+
                       ' AND    CPP.SEQPROPOSTA     = H.SEQPROPOSTA(+)    '+
                       ' AND    CPP.IDCONTRIBUICAO  = H.IDCONTRIBUICAO(+) '+
                       ' ORDER BY CP.ORDEMCALCULO ');
        try
           qryAux.Open;
        except
           on E:EDBEngineError do
           begin
              frmAguarde.Apaga;
              MostrarErro(E);
              Exit;
           end;
        end;

        // Inserir uma devolucao para o participante da diferenca
        if (sFlgIntSitPart = 'AS') then
        begin
          sDataCobranca   := CriticaDataCobrancaSit(dtmAPrev.qry,
                                                    IntToStr(iIdFundacao),
                                                    pIdPlanoPrev,
                                                    sFlgIntSitPart, 'N',
                                                    
                                                    
                                                    Copy(FormatDateTime('dd/mm/yyyy', date),4,2), 
                                                    Copy(FormatDateTime('dd/mm/yyyy', date),7,4));

          sProximoAnoMesCob := ProximoMesAberto( 
                                                 Copy(FormatDateTime('dd/mm/yyyy', date),7,4) + '/' +      
                                                 Copy(FormatDateTime('dd/mm/yyyy', date),4,2),             
                                                 StrToInt(pIdPessJur),
                                                 cteIdModuloFolhaBen,
                                                 'E')
        end
        else
        begin
           sDataCobranca   := CriticaDataCobrancaSit(dtmAPrev.qry,
                                                  pIdPessJur,
                                                  pIdPlanoPrev,
                                                  sFlgIntSitPart, 'N',
                                                  
                                                  
                                                  Copy(FormatDateTime('dd/mm/yyyy', date),4,2),  
                                                  Copy(FormatDateTime('dd/mm/yyyy', date),7,4)); 

           if StrToInt(pIdPessJur) = iIdFundacao Then
             sProximoAnoMesCob := ProximoMesAberto( 
                                                    Copy(FormatDateTime('dd/mm/yyyy', date),7,4) + '/' +       
                                                    Copy(FormatDateTime('dd/mm/yyyy', date),4,2),              
                                                    StrToInt(pIdPessJur),
                                                    cteIdModuloFolhaCM,
                                                    'E')
           else
             sProximoAnoMesCob := ProximoMesAberto( 
                                                    Copy(FormatDateTime('dd/mm/yyyy', date),7,4) + '/' +       
                                                    Copy(FormatDateTime('dd/mm/yyyy', date),4,2),              
                                                    StrToInt(pIdPessJur),
                                                    cteIdModuloCCP,
                                                    'E');
        end;

        qryAux.First;
        while not qryAux.Eof do
        begin
           sSQL := MontaSQLContribNOVA( StrToInt(pIdPessJur),
                                        StrToInt(pIdPlanoPrev),
                                        StrToInt(pIdPessoa),
                                        StrToInt(pSeqProposta),
                                        qryAux.FieldByName('IdContribuicao').AsInteger,
                                        -1,
                                        sFlgIntSitPart,
                                        sMesRef,
                                        psDataFinalManut,
                                        '0',
                                        sInscricaoData,
                                        sDataNasc,
                                        'N',
                                        'HSTCONTRIBPREV',
                                        'VALORESPERADO',
                                        sValorProvento,
                                        sIdSitPartAtual,
                                        psDataFinalManut,
                                        psDataVoltaAtivo,0,-1,sProximoAnoMesCob,-1);
           sValorRegra := RegraNumerica( qryAux.FieldByName('IdRegraCalculo').AsString,
                                         sSQL,bErro,iIdCalculoGeral);
           if bErro
           then begin
              frmAguarde.Apaga;
              MsgDlg('Erro na Execução da Regra de Cálculo Nº '+qryAux.FieldbyName('IDREGRACALCULO').AsString,'Erro',mtError,[mbOk,mbHelp],0);
              Exit;
           end;
           if sValorRegra = '' then sValorRegra := '0';
           if qryAux.FieldByName('IdRegraUltPagto').AsString <> ''
           then begin
              sSQL := MontaSQLContribNOVA(StrToInt(pIdPessJur),
                                          StrToInt(pIdPlanoPrev),
                                          StrToInt(pIdPessoa),
                                          StrToInt(pSeqProposta),
                                          qryAux.FieldByName('IdContribuicao').AsInteger,
                                          prmIdMotivoContrib,
                                          sFlgIntSitPart,
                                          qryAux.FieldByName('MesReferencia').AsString,
                                          psDataFinalManut,
                                          sValorRegra,
                                          sInscricaoData,
                                          sDataNasc,
                                          'U',
                                          'HSTCONTRIBPREV',
                                          'VALORESPERADO',
                                          sValorProvento,
                                          sIdSitPartAtual,
                                          psDataFinalManut,
                                          psDataFinalManut,0,-1,sProximoAnoMesCob,-1);

              sValorRegra := RegraNumerica( qryAux.FieldByName('IdRegraUltPagto').AsString,
                                            sSQL,bErro,iIdCalculoGeral);
              if bErro
              then begin
                 frmAguarde.Apaga;
                 MsgDlg('Erro na Execução da Regra de Cálculo de Último Pagamento Nº '+qryAux.FieldbyName('IDREGRACALCULO').AsString,'Erro',mtError,[mbOk,mbHelp],0);
                 Exit;
              end
           end;

           if qryAux.FieldByName('NumRecebimento').AsInteger <= 0
           then begin // contribuicao ainda nao foi preparada
              if InsereHstContribPREV( dtmAPrev.qry,
                                           StrToInt(pIdPessoa),
                                           StrToInt(pSeqProposta),
                                           StrToInt(pIdPessJur),
                                           StrToInt(pIdPlanoPrev),
                                           qryAux.FieldByName('IdContribuicao').AsInteger,
                                           prmIdMotivoDiverg,
                                           qryAux.FieldByName('MesReferencia').AsString,
                                           sProximoAnoMesCob,
                                           -1,
                                           sDataCobranca,
                                           '',
                                           StrToFloat(ClienteNumero(sValorRegra)),
                                           StrToFloat(ClienteNumero(sValorRegra)),
                                           0,
                                           qryAux.FieldByName('IdRegraCalculo').AsInteger,
                                           1,
                                           qryAux.FieldByName('ValorBase1').AsFloat,
                                           qryAux.FieldByName('ValorBase2').AsFloat,
                                           qryAux.FieldByName('ValorBase3').AsFloat,
                                           qryAux.FieldByName('DataInicio').AsString,
                                           qryAux.FieldByName('DataFinal').AsString,
                                           sFlgIntSitPart,
                                           0, 0, -1, 'F', 0, 1, 0, 1) < 0
              then begin
                frmAguarde.Apaga;
                MsgDlg('Erro ao inserir devolução de contribuição. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
                Exit;
              end;
           end
           else begin
              // Comparar o valor calculado com o valor pago
              if qryAux.FieldByName('SitRecebimento').AsInteger <= 1
              then begin // entao a contribuicao ainda nao foi paga pelo participante
                 dtmAPrev.qry.Close;
                 dtmAPrev.qry.SQL.Clear;
                 dtmAPrev.qry.SQL.Add(' UPDATE HSTCONTRIBPREV SET VALORESPERADO = '+OraNumero(sValorRegra)+
                         ' WHERE  NUMRECEBIMENTO = '+qryAux.FieldByName('NumRecebimento').AsString);
                 try
                    dtmAPrev.qry.ExecSQL;
                 except
                    on E:EDBEngineError do
                    begin
                       frmAguarde.Apaga;
                       MostrarErro(E);
                       Exit;
                    end;
                 end;
              end
              else begin // a contribuicao já foi paga pelo participante

                 dDiferenca := qryAux.FieldByName('ValorRecebido').AsFloat - StrToFloat(ClienteNumero(sValorRegra));

                 if InsereHstContribPREV( dtmAPrev.qry,
                                              StrToInt(pIdPessoa),
                                              StrToInt(pSeqProposta),
                                              StrToInt(pIdPessJur),
                                              StrToInt(pIdPlanoPrev),
                                              qryAux.FieldByName('IdContribuicao').AsInteger,
                                              prmIdMotivoDiverg,
                                              qryAux.FieldByName('MesReferencia').AsString,
                                              sProximoAnoMesCob,
                                              -1,
                                              sDataCobranca,
                                              '',
                                              dDiferenca,
                                              dDiferenca,
                                              0,
                                              qryAux.FieldByName('IdRegraCalculo').AsInteger,
                                              1,
                                              qryAux.FieldByName('ValorBase1').AsFloat,
                                              qryAux.FieldByName('ValorBase2').AsFloat,
                                              qryAux.FieldByName('ValorBase3').AsFloat,
                                              qryAux.FieldByName('DataInicio').AsString,
                                              qryAux.FieldByName('DataFinal').AsString,
                                              sFlgIntSitPart,
                                              0, 0, -1, 'F', 0, 1, 0, 1) < 0
                 then begin
                   frmAguarde.Apaga;
                   MsgDlg('Erro ao inserir devolução de contribuição. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
                   Exit;
                 end;
              end;
           end; // else- if qry.NumRecebimento <= 0

           qryAux.Next;
        end; // while
     end;
  end; // if strcontribuicaoadesassocir <> ''

  
  // Reassociar contribuicoes
  // Preparar as contribuicoes reassociadas da data de inicio até hoje
  qryAux.Close;
  if sFlgIntEvento = 'DM'
  then begin
     
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDCONTRIBUICAO, IDREGRAVALIDAASS FROM CONTPREVEVENTO ' +
                    ' WHERE  IDPLANOPREV     = ' + pIdPlanoPrev    +
                    ' AND    IDEVENTOGERADOR = ' +pIdEventoGerador);
  end
  else
  begin
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT IDCONTRIBUICAOF as IDCONTRIBUICAO FROM HSTCONTEVENTOSPR HE '+
                    ' WHERE  HE.IDEVENTOSPREV   =   '+pIdEventoAnterior +
                    ' AND    HE.FLGASSOCIADA    = 0 ');
  end;

  qryAux.Open;
  if qryAux.IsEmpty
  then begin
     frmAguarde.Apaga;
     Result      := False;
     if MsgDlg('Não existe contribuição a ser reassociada ao participante. '+#13+
               'Deseja continuar a efetivação do evento de retorno ? ',
               'Confirmação', mtConfirmation, [mbYes,mbNo],0) = mrYes
     then Result := True;
     Exit;

  end
  else begin
     qryAux.First;
     while not qryAux.EOF do
     begin

         strContribuicaoAAssociar := strContribuicaoAAssociar +
                                     qryAux.FieldByName('IDCONTRIBUICAO').AsString+',';
         qryAux.Next;
     end;
  end;
  strContribuicaoAAssociar := Copy(strContribuicaoAAssociar, 1,Length(strContribuicaoAAssociar)-1);

  if not AssociaNovasContribuicoes(pIdPessJur,             pIdPlanoPrev,
                                   pIdPessoa,              pSeqProposta,
                                   pIdEventoGerador,       psDataVoltaAtivo,
                                   '',                     sMatricula,
                                   sIdSitPartAntigo, // situacao para a qual o participante está voltando
                                   sValorProvento,         False,
                                   True,                   False,
                                   qryAux,                 qryGrava,
                                   sFlgIntEvento,          -1,'' ) then
  begin
     frmAguarde.Apaga; 

     if MsgDlg(' Ocorreram problemas na Associação das Contribuições ao Participante.'+
               ' Deseja efetivar o evento ? ','Confirmação', mtconfirmation, [mbYes,mbNo],0) = mrNo then
       Exit
     else
       if MsgDlg(' Se este evento for retroativo, as contribuições não associadas não serão cobradas .'+
                  ' Confirma a efetivação do evento ? ','Confirmação', mtconfirmation, [mbYes,mbNo],0) = mrNo then
         Exit;
  end;  

  frmAguarde.Apaga;
  Result := True;
end; // Retorna contribuicoes antigas

function AssociaNovasContribuicoes( pIdPessJur,
                                    pIdPlanoPrev,
                                    pIdPessoa,
                                    pSeqProposta,
                                    pIdEventoGerador,
                                    pDtEventoIni,
                                    pDtEventoFin,
                                    pMatricula,
                                    pIdSitPart,
                                    sSalarioPart             : string;
                                    bRequerBenef,
                                    bPrepararContrib,
                                    bManutBenefIndicado      : boolean;
                                    qryAux,
                                    qryGrava                 : TwwQuery;
                                    sFlgIntEvento            : string;
                                    piIdEventosPrev          : longint;
                                    psUltimoAnoMesContrib    : string;
                                    const psDataInicioEvento : string = '01/01/1900';
                                    qryContribAssocTransfPlano : TwwQuery = nil; 
                                    pbAbreTelaCadContrib  :  Boolean = True;
                                    psDataPrevPagamento   :  string = '' ): boolean;


var
  sFlgCobra,           sFlgRetroativo,     sDataFinal,
  sIdTpPeriodicidade,  sSql,               sFlgInternoSitPart,
  sDescPreparo,        sMsgErro,           sSQLBuscaInf,
  sBrancosBuscaInf,    sValorEncontrado,   sCodPortForma,
  sFlgDescFolha,       sInscricaoData,     sDtInicioInsc,
  sPartReinscrito,     sValorProvento,     sMesRef,
  sPartResgPoupanca,   sUltMesPreparo,     sDataNasc,
  sInscricaoDataFund,  sTempoServAnterior, sTempoNaoCreditado,
  sValorBase1,         sValorBase2,        sValorBase3,
  sAssoc1Op1,          sAssoc2Op1,         sAssoc3Op1,
  sAssoc1Op2,          sAssoc2Op2,         sAssoc3Op2,
  sAssoc1Op3,          sAssoc2Op3,         sAssoc3Op3,
  sIdRegraCalcOp1,     sIdRegraCalcOp2,    sIdRegraCalcOp3,
  sNomeOp1,            sNomeOp2,           sNomeOp3,
  sDataAdmissao,       sDataDemissao,      sDataCancelamento,
  sSexo,               sNomePatro,         sNomePlano,
  sSQLOpcao,           sFlgTpDemissao,     sNomeParticipante,
  sNovoSalario,        sSalarioAtivoMP,
  sParamAux1,          sParamAux2,
  sDataInicioGerarSalario,
  sDataFinalGerarSalario,
  sParamAux3   : string;

  rValorOpcao1, rValorOpcao2, rValorOpcao3 : double;
  iIdLote : longint;

  bErro,
  bPartResgPoupanca   : boolean;

  sDataDIB         : String;   
  sAnoMesIniReaj   : string;   
  sAnoMesFimReaj   : string;   
  sAnoMesAtualReaj : string;   
  bApagaOpcoes     : Boolean;  
begin
  Result    := False;

  If psUltimoAnoMesContrib = 'DIB'
   Then Begin
      sDataDIB              := pDtEventoIni;
      psUltimoAnoMesContrib := '';
   End
   Else sDataDIB := '';
  
  If (prmFlgNaoTrazOp = 1) And
     (sFlgIntEvento = 'RM')     // Apenas para Reinscrição de Participante
   Then bApagaOpcoes := True
   Else bApagaOpcoes := False;
  
  if Trim(strContribuicaoAAssociar) = ''
  then Exit;                              
                                          // PARA QUE PROSSEGUIR NA ROTINA SE O EVENTO NAO TEM
                                          // NENHUMA CONTRIBUICAO A ASSOCIAR ?????
  // Verifica se as Cont. associadas pelo evento devem ser para banco(Mantido) ou folha
  if  (sFlgIntEvento = 'DM') or  //Demissão com Manutenção de Contribuição
      (sFlgIntEvento = 'PD')     //Demissão com Manutenção de Contribuição
  then sFlgDescFolha := '0'
  else sFlgDescFolha := '';


  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT DESCRICAO, FLGINTERNO FROM SITPART ' +
                 ' WHERE IDSITPART = ' + pIdSitPart);
  qryAux.Open;
  sFlgInternoSitPart := qryAux.FieldByName('FLGINTERNO').AsString;
  sDescPreparo := 'Contribuição de ' + qryAux.FieldByName('DESCRICAO').AsString + ' - Matrícula: ' + pMatricula;

  // Se for manutenção, Executa regra de cálculo da data inicial do beneficio,
  // para gravar como a data final das contribuições de manutenção.
  sDataFinal := '';
  if  (sFlgIntEvento = 'PD') or ((sFlgIntEvento = 'DM') and
      (bManutBenefIndicado) )
  then begin
       rValorOpcao1 := 0;
       rValorOpcao2 := 0;
       rValorOpcao3 := 0;
       sSql  := '';
       sSql  := ' SELECT EP.IDREGRADTFIMEV, EP.PRZMESESEVENT,  EP.IDEVENTOGERADOR,  '+
                '        EP.IDREGRARESGATE, BP.IDREGRACALCULO, B.TIPOBENEFICIO,     '+
                '        EV.IDBENEFICIO,      '+
                '        PF.DATANASC,       PF.SEXO, EL.DATAADMISSAO,  EL.IDCARGOEXT, '+
                '        EV.IDPESSOA, EV.IDPLANOPREV, EV.IDPESSJUR, EV.SEQPROPOSTA, '+
                '        To_Date( '+''''+pDtEventoIni+''', ''dd/mm/yyyy'') as DATAEVENTO, '+
                '        To_Date( '+''''+pDtEventoIni+''', ''dd/mm/yyyy'') as DATAEVENT,  '+
                '        To_Date( '+''''+pDtEventoIni+''', ''dd/mm/yyyy'') as DATAREF     '+
                ' FROM   EVENTOSPLANO EP, BENEFICIO B, BENEFPLANPREV BP, EVENTOSPREV EV, PESSOAFISICA PF, ELEGPATRO EL '+
                ' WHERE  EP.IDEVENTOGERADOR = ' + pIdEventoGerador + ' AND ' +
                '        EP.IDPLANOPREV     = ' + pIdPlanoPrev     + ' AND ' +
                '        EV.IDPESSOA        = ' + pIdPessoa        + ' AND ' +
                '        EV.SEQPROPOSTA     = ' + pSeqProposta     + ' AND ' +
                '        EV.IDPESSJUR       = ' + pIdPessJur       + ' AND ' +
                '        EL.IDPESSJUR       = EV.IDPESSJUR AND '+
                '        EL.IDPESSOA        = EV.IDPESSOA AND '+
                '        EV.IDPLANOPREV     = EP.IDPLANOPREV       AND '+
                '        EV.IDEVENTOGERADOR = EP.IDEVENTOGERADOR   AND '+
                '        EP.IDPLANOPREV     = BP.IDPLANOPREV       AND '+
                '        BP.IDBENEFICIO     = EV.IDBENEFICIO       AND '+
                '        BP.IDBENEFICIO     = B.IDBENEFICIO        AND '+
                '        EV.IDPESSOA        = PF.IDPESSOA  ';
       qryAux.Close;
       qryAux.Sql.Clear;
       qryAux.Sql.Add(sSQL);
       qryAux.Open;

       if (not qryAux.IsEmpty) and
          (qryAux.FieldByName('IDREGRADTFIMEV').AsString <> '')
       then begin
          sMsgErro   := '';
          frmAguarde.Mostra('Regra de Data Final - Nº '+qryAux.FieldByName('IDREGRADTFIMEV').AsString);
          sDataFinal := ExecutaRegraDtFinalPDv(qryAux.FieldByName('IDREGRADTFIMEV').AsString, sSQL, sMsgErro);

          if (Trim(sDataFinal) <> '') and
             (StrToDate(sDataFinal) <= StrToDate(pDtEventoIni) )
          then begin
             frmAguarde.Apaga;
             MsgDlg(' A data final calculada para este evento pela regra nº '+qryAux.FieldByName('IDREGRADTFIMEV').AsString+
                    ' é anterior a data início do evento. Verifique. '+#13+
                    ' . Data de Início Informada : '+pDtEventoIni+#13+
                    ' . Data Final Calculada     : '+sDataFinal, 'Erro', mtError, [mbOk, mbHelp], 0);
             Exit;
          end;

          frmAguarde.Apaga;

          if (sMsgErro <> '')
          then begin
             MsgDlg('Associando Contribuições - '+#13+sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
             Exit;              // Nao efetiva o evento.
          end;

          pDtEventoFin  := sDataFinal;

          // Gravar data final como data volta na eventos prev
          if (piIdEventosPrev > 0) and (Trim(sDataFinal) <> '' )
          then begin
             qryAux.Close;
             qryAux.SQL.Clear;
             qryAux.SQL.Add(' UPDATE EVENTOSPREV SET DATAVOLTA = TO_DATE('''+sDataFinal+''', ''dd/mm/yyyy'')' +
                            ' WHERE  IDEVENTOSPREV = '+IntToStr(piIdEventosPrev));
             try
                qryAux.ExecSQL;
             except
                MsgDlg('Erro ao atualizar a data limite do evento. ','Erro',mtError,[mbOk,mbHelp],0);
                Exit;
             end;
          end;

       end;
  end;

  frmAguarde.Mostra('Verificando contribuições a cobrar ... ');

  // Verifica se o Evento possui Contribuições associadas
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT CP.IDCONTRIBUICAO, NVL(C.QTDEPARCELAS,0) AS QTDEPARCELAS,  C.IDTPPERIODICIDADE, '+
                 '        TP.QTDEMESES,      CT.FLGDESCFOLHA, CT.NUMOPCOES         '+
                 ' FROM   CONTPREVEVENTO CP,  CONTRIBUICAO C, TPPERIODICIDADE TP,   '+
                 '        CONTPREV CT    ' +
                 ' WHERE  (CP.IDPLANOPREV      = ' + pIdPlanoPrev     + ') AND ' +
                 '        (CP.IDEVENTOGERADOR  = ' + pIdEventoGerador + ') AND ' +
                 '        (CP.IDCONTRIBUICAO IN (' + strContribuicaoAAssociar + ')) AND ' +
                 '        (CT.FLGPAGADOR  <> ''E'') AND '+
                 '        (CP.IDCONTRIBUICAO   = C.IDCONTRIBUICAO) AND ' +
                 '        (CP.IDPLANOPREV      = CT.IDPLANOPREV)    AND ' +
                 '        (CP.IDCONTRIBUICAO   = CT.IDCONTRIBUICAO) AND ' +
                 '        (C.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+)) ');
  qryAux.Open;

  if qryAux.IsEmpty
  then begin
     frmAguarde.Apaga;
     Result := True;
     Exit;
  end;

  qryAux.First;

  // Se o evento permite requerer beneficio, Só passa a cobrar as novas contribuições na Concessão
  if bRequerBenef
  then begin
     sFlgCobra      := '1';//William Moreira da Silva SOL 235054 PPM 442686
     sFlgRetroativo := '1';
  end
  else begin        // Se o evento não permite requerer beneficio, passa a cobrar as novas contribuições imediatamente
     sFlgCobra      := '1';
     sFlgRetroativo := '0';
  end;

  // Data de Inicio da Contribuição
  if Trim(pDtEventoIni) = '' Then
    pDtEventoIni := FormatDateTime('dd/mm/yyyy', Date); 

  // Associa novas Contribuicaoes
  while not qryAux.EOF do
  begin
     if sDataFinal = '' then
     begin
        if Trim(pDtEventoFin) = ''
        then begin
            // Calcular Data Final da Contribuição utilizando a quantidade de parcelas
            sDataFinal := CalcDataFinal(StrToDate(pDtEventoIni), qryAux.FieldByName('QTDEPARCELAS').AsString, qryAux.FieldByName('QTDEMESES').AsString);
            if Trim(sDataFinal) <> ''
            then begin
               try
                  StrToDate(sDataFinal);
               except
                    frmAguarde.Apaga;
                    if MsgDlg('Erro no Cálculo da Data Final da contribuição. '+
                              'A Data será gravada em branco. Confirma ?','Informação', mtInformation, [mbNo, mbYes], 1) = mrYes
                    then sDataFinal := ''
                    else exit;      // Nao efetiva o evento.
               end
            end;    // if datafinal <> ''
        end
        else sDataFinal := pDtEventoFin;
     end;

     if qryAux.FieldByName('IDTPPERIODICIDADE').AsString <> ''
     then sIdTpPeriodicidade := qryAux.FieldByName('IDTPPERIODICIDADE').AsString
     else sIdTpPeriodicidade := 'NULL';

     // Verifica CODPORTFORMA
     if sFlgDescFolha = ''
     then if (qryAux.FieldByName('FLGDESCFOLHA').AsString = '')
          then sFlgDescFolha := '1'
          else sFlgDescFolha := qryAux.FieldByName('FLGDESCFOLHA').AsString;

     if sFlgDescFolha = '1'
     then sCodPortForma := 'NULL'
     else if BuscaInfFinancContrib(sSQLBuscaInf, sBrancosBuscaInf, sValorEncontrado,
                                      'CODPORTFORMA','','N', StrToInt(pIdPessJur), StrToInt(pIdPlanoPrev),
                                      qryAux.FieldByName('IDCONTRIBUICAO').AsInteger,-1)
          then sCodPortForma := sValorEncontrado
          else sCodPortForma := 'NULL';

     frmAguarde.Mostra('Associando contribuições a cobrar ... ');

     if (sFlgIntEvento = 'TP') and (qryContribAssocTransfPlano <> nil)
     then begin
        if qryContribAssocTransfPlano.Locate('IDCONTRIBUICAO',qryAux.FieldByName('IDCONTRIBUICAO').AsInteger,[loCaseInsensitive])
        then begin
           // Verifica se a contribuicao copia valor das opçoes
           sSQLOpcao  := ' VALORBASE1 = '+OraNumero(qryContribAssocTransfPlano.FieldByName('VALORBASE1').AsString)+','+
                         ' VALORBASE2 = '+OraNumero(qryContribAssocTransfPlano.FieldByName('VALORBASE2').AsString)+','+
                         ' VALORBASE3 = '+OraNumero(qryContribAssocTransfPlano.FieldByName('VALORBASE3').AsString);
           sParamAux1 := OraNumero(qryContribAssocTransfPlano.FieldByName('VALORBASE1').AsString);
           sParamAux2 := OraNumero(qryContribAssocTransfPlano.FieldByName('VALORBASE2').AsString);
           sParamAux3 := OraNumero(qryContribAssocTransfPlano.FieldByName('VALORBASE3').AsString);
        end;
     end
     else begin
        // Verifica se a contribuicao copia valor das opçoes
        sSQLOpcao := VerificaCopiaOpcaoContrib(qryGrava, pIdPessoa,  pIdPlanoPrev,
                                                         pIdPessjur, pSeqProposta,
                                                         qryAux.FieldByName('IDCONTRIBUICAO').AsString,
                                                         qryAux.FieldByName('NUMOPCOES').AsInteger,
                                                         sParamAux1, sParamAux2, sParamAux3);
     end;

     // Verifica se a contribuição já está associada ao participante
     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' SELECT IDCONTRIBUICAO FROM CONTRIBPREVPARTP ' +
                      ' WHERE SEQPROPOSTA    = ' + pSeqProposta + ' AND ' +
                      '       IDPESSJUR      = ' + pIdPessJur   + ' AND ' +
                      '       IDPLANOPREV    = ' + pIdPlanoPrev + ' AND ' +
                      '       IDPESSOA       = ' + pIdPessoa    + ' AND ' +
                      '       IDCONTRIBUICAO = ' + qryAux.FieldByName('IDCONTRIBUICAO').AsString);
     qryGrava.Open;

     if qryGrava.IsEmpty
     then begin
        // Associa a contribuição ao participante
        qryGrava.Close;
        qryGrava.Sql.Clear;
        if Trim(sDataFinal) <> ''
        then qryGrava.Sql.Add(' INSERT INTO CONTRIBPREVPARTP(IDPESSJUR, IDPESSOA, IDPLANOPREV, IDCONTRIBUICAO, SEQPROPOSTA, ' +
                         '                                 FLGRETROATIVO, FLGCOBRA, DATAINICIO, DATAFINAL, IDTPPERIODICIDADE, ' +
                         '                                 FLGDESCFOLHA, CODPORTFORMA ) ' +
                         ' VALUES( ' + pIdPessJur + ',' + pIdPessoa + ',' + pIdPlanoPrev + ',' +
                                   qryAux.FieldByName('IDCONTRIBUICAO').AsString + ',' + pSeqProposta + ',' +
                                   sFlgRetroativo + ',' + sFlgCobra + ', To_Date('''+pDtEventoIni+''',''DD/MM/YYYY'') ' + ',' +
                                   'To_Date(''' + sDataFinal + ''',''DD/MM/YYYY'') ' + ',' + sIdTpPeriodicidade + ',' +
                                   sFlgDescFolha + ',' + sCodPortForma + ')')
        else qryGrava.Sql.Add(' INSERT INTO CONTRIBPREVPARTP(IDPESSJUR, IDPESSOA, IDPLANOPREV, IDCONTRIBUICAO, SEQPROPOSTA, ' +
                         '                                 FLGRETROATIVO, FLGCOBRA, DATAINICIO, DATAFINAL, IDTPPERIODICIDADE, ' +
                         '                                 FLGDESCFOLHA, CODPORTFORMA ) ' +
                         ' VALUES( ' + pIdPessJur + ',' + pIdPessoa + ',' + pIdPlanoPrev + ',' +
                                   qryAux.FieldByName('IDCONTRIBUICAO').AsString + ',' + pSeqProposta + ',' +
                                   sFlgRetroativo + ',' + sFlgCobra + ', To_Date('''+pDtEventoIni+''',''DD/MM/YYYY'') ' + ',' +
                                   ' null, ' + sIdTpPeriodicidade + ',' +
                                   sFlgDescFolha + ',' + sCodPortForma + ')');

        try
           qryGrava.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              frmAguarde.Apaga;
              MostrarErro(E);
              Exit;
           end;
        end;
     end
     else begin
        // Altera a contribuição do participante
        if sSqlOpcao <> ''
        then sSqlOpcao := ' ,'+sSqlOpcao;

        qryGrava.Close;
        qryGrava.Sql.Clear;
        if Trim(sDataFinal) <> ''
        then qryGrava.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGRETROATIVO = ' + sFlgRetroativo + ',' +
                         '                                FLGCOBRA   = ' + sFlgCobra + ',' +
                         '                                DATAINICIO = To_Date(''' + pDtEventoIni + ''',''DD/MM/YYYY'')' + ',' +
                         '                                DATAFINAL  = To_Date(''' + sDataFinal   + ''',''DD/MM/YYYY'')' + ',' +
                         '                                FLGDESCFOLHA = ' + sFlgDescFolha + ',' +
                         '                                CODPORTFORMA = ' + sCodPortForma +
                                                      sSQLOpcao    +
                         ' WHERE SEQPROPOSTA    = ' + pSeqProposta + ' AND ' +
                         '       IDPESSJUR      = ' + pIdPessJur   + ' AND ' +
                         '       IDPLANOPREV    = ' + pIdPlanoPrev + ' AND ' +
                         '       IDPESSOA       = ' + pIdPessoa    + ' AND ' +
                         '       IDCONTRIBUICAO = ' + qryAux.FieldByName('IDCONTRIBUICAO').AsString)
        else qryGrava.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGRETROATIVO = ' + sFlgRetroativo + ',' +
                         '                                FLGCOBRA   = ' + sFlgCobra + ',' +
                         '                                DATAINICIO = To_Date(''' + pDtEventoIni + ''',''DD/MM/YYYY'')' + ',' +
                         '                                DATAFINAL  = NULL,                   '  +
                         '                                FLGDESCFOLHA = ' + sFlgDescFolha + ','  +
                         '                                CODPORTFORMA = ' + sCodPortForma +
                                                      sSQLOpcao    +
                         ' WHERE SEQPROPOSTA    = ' + pSeqProposta + ' AND ' +
                         '       IDPESSJUR      = ' + pIdPessJur   + ' AND ' +
                         '       IDPLANOPREV    = ' + pIdPlanoPrev + ' AND ' +
                         '       IDPESSOA       = ' + pIdPessoa    + ' AND ' +
                         '       IDCONTRIBUICAO = ' + qryAux.FieldByName('IDCONTRIBUICAO').AsString);
        try
           qryGrava.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              frmAguarde.Apaga;
              MostrarErro(E);
              Exit;
           end;
        end;
        sSQLOpcao := '';
     end;

     // Copia opções entre contribuições
     if sSQLOpcao <> '' then
     begin
        qryGrava.Close;
        qryGrava.Sql.Clear;
        qryGrava.Sql.Add(' UPDATE CONTRIBPREVPARTP SET ' + sSQLOpcao    +
                         ' WHERE SEQPROPOSTA         = ' + pSeqProposta + ' AND ' +
                         '       IDPESSJUR           = ' + pIdPessJur   + ' AND ' +
                         '       IDPLANOPREV         = ' + pIdPlanoPrev + ' AND ' +
                         '       IDPESSOA            = ' + pIdPessoa    + ' AND ' +
                         '       IDCONTRIBUICAO      = ' + qryAux.FieldByName('IDCONTRIBUICAO').AsString);
        try
           qryGrava.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              frmAguarde.Apaga;
              MostrarErro(E);
              Exit;
           end;
        end;
     end;

     // Se estiver parametrizado apaga as opcoes para reinscricao
     If bApagaOpcoes
      Then Begin
        qryGrava.Close;
        qryGrava.SQL.Clear;
        qryGrava.SQL.Add(' UPDATE CONTRIBPREVPARTP '+
                         ' SET VALORBASE1 = NULL, '+
                         '     VALORBASE2 = NULL, '+
                         '     VALORBASE3 = NULL  '+
                         ' WHERE SEQPROPOSTA    = ' + pSeqProposta +
                         '   AND IDPESSJUR      = ' + pIdPessJur   +
                         '   AND IDPLANOPREV    = ' + pIdPlanoPrev +
                         '   AND IDPESSOA       = ' + pIdPessoa    +
                         '   AND IDCONTRIBUICAO = ' + qryAux.FieldByName('IDCONTRIBUICAO').AsString);
        Try
           qryGrava.ExecSQL;
        Except
           on E:EDBEngineError do
           Begin
              frmAguarde.Apaga;
              MostrarErro(E);
              Exit;
           End;
        End;
     End;

     qryAux.Next;
  end; // end - while not qryAux.Eof
  frmAguarde.Apaga;

  // ************************************************************************************
  // SE FOR OS EVENTOS Manut.Parc, Manut. Integ, PID, PIA, Reinsc. ou Insc. ou Assistido
  // ENTAO GERAR OS SALARIOS RETROATIVAMENTE, CONSIDERANDO INCLUSIVE OS REAJUSTES
  // E OS PRO-RATA
  // ************************************************************************************
  if  (sFlgIntEvento = 'IP') or (sFlgIntEvento = 'RM') or
      (sFlgIntEvento = 'MP') or (sFlgIntEvento = 'DM') or
      (sFlgIntEvento = 'AF') or (sFlgIntEvento = 'PD') or
      (sFlgIntEvento = 'RA') or
      ( ( (sFlgIntEvento = 'DO') or (sFlgIntEvento = 'AC') or (sFlgIntEvento = 'FR') ) and
        ( StrToFloat(ClienteNumero(sSalarioPart)) > 0 )
      )
  then begin
     if (sFlgIntEvento = 'AF') or (sFlgIntEvento = 'PD') or
        (sFlgIntEvento = 'DO') or (sFlgIntEvento = 'AC') or (sFlgIntEvento = 'FR')
     then sDataFinal := pDtEventoFin;


     if (sFlgIntEvento = 'IP') or (sFlgIntEvento = 'RM') or (sFlgIntEvento = 'RA') Then
       sDataFinalGerarSalario := FormatDateTime('dd/mm/yyyy', date) 
     else
       sDataFinalGerarSalario := sDataFinal;

     // PASSAR COMO DATA DE INICIO DA GERAÇÃO DE SALÁRIOS A DATA DO EVENTO
     // E NAO A DIB DO BENEFICIO. COMO O PARAMETRO pDtEventoIni está com a DIB
     // BUSCAR A DATA DO EVENTO
     if piIdEventosPrev > 0
     then begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT DATAEVENTO FROM EVENTOSPREV '+
                       ' WHERE  IDEVENTOSPREV = '+IntToStr(piIdEventosPrev) );
        qryAux.Open;
        if not qryAux.IsEmpty
        then sDataInicioGerarSalario := qryAux.FieldByName('DATAEVENTO').AsString
        else sDataInicioGerarSalario := pDtEventoIni;
     end
     else sDataInicioGerarSalario := pDtEventoIni;

     
     If sDataDIB <> ''
     Then begin
        sDataInicioGerarSalario := sDataDIB;

        
        // Executar rotina que verifica se teve reajuste da data do evento até a dib
        // e reajustar o salário. Pendencia 14340
        if (Copy(psDataInicioEvento,7,4)+'/'+Copy(psDataInicioEvento,4,2)) < (Copy(sDataDIB,7,4)+'/'+Copy(sDataDIB,4,2))
        then begin
           sAnoMesIniReaj   := Copy(psDataInicioEvento,7,4)+'/'+Copy(psDataInicioEvento,4,2);
           sAnoMesFimReaj   := SAnoMesAnterior(Copy(sDataDIB,7,4)+'/'+Copy(sDataDIB,4,2));
           sAnoMesAtualReaj := sAnoMesIniReaj;
           while sAnoMesAtualReaj <= sAnoMesFimReaj do
           begin
              if not ReajustaSalPatro(qryAux,
                                      sAnoMesAtualReaj,
                                      pIdPessjur,
                                      pIdPlanoprev,
                                      pIdPessoa,
                                      '01/'+Copy(sAnoMesAtualReaj,6,2)+'/'+Copy(sAnoMesAtualReaj,1,4),
                                      psDataInicioEvento,
                                      sSalarioPart,
                                      'AS',
                                      True 
                                     )
              then begin
                 frmAguarde.Apaga;
                 MsgDlg(' Ocorreram problemas na verificação de reajustes para o período de '+
                          sAnoMesIniReaj+' a '+sAnoMesFimReaj+'.','Erro', mtError, [mbOk],0);
                 Exit;
              end;
              sAnoMesAtualReaj  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtualReaj, 6,2)), StrToInt(Copy(sAnoMesAtualReaj, 1,4)));
           end;
        end;
     end;

     if not GeraSalarioRetroativo( StrToInt(pIdPessJur), StrToInt(pIdPlanoPrev),
                                   StrToInt(pIdPessoa),
                                   sFlgInternoSitPart,
                                   sDataInicioGerarSalario, 
                                   sDataFinalGerarSalario,  
                                   sSalarioPart,
                                   sNovoSalario,
                                   sSalarioAtivoMP,
                                   qryAux, sMsgErro, sFlgIntEvento, False,
                                   9)  
     then begin
        frmAguarde.Apaga;
        MsgDlg(' Ocorreram problemas na Geração dos Salários no Histórico.'+#13+
                  '[Erro : '+sMsgErro+']. Verifique.','Erro', mtError, [mbOk],0);
        Exit;
     end;
  end; // Fim da Geracao de Salarios

  // **************************************************************************
  // ********** PREPARAR DADOS PARA CALCULAR OPCOES DAS CONTRIBUICOES QUE
  // ********** FORAM ASSOCIADAS
  // **************************************************************************
  // Preencher dados do elegivel / participante
  frmAguarde.Mostra('Verificando dados do participante  ... ');
  qryAux.Close;
  qryAux.SQl.Clear;
  qryAux.SQL.Add(' SELECT EL.DATAADMISSAO, EL.DATADEMISSAO, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO, '+
                 '        PP.INSCRICAODATA, PP.DTINICIOINSC, PP.DATACANCELAMENTO, '+
                 '        PP.SALPARTICIPACAO, PF.DATANASC, PF.DATAMORTE, PF.SEXO, PL.NOME AS NOMEPLANO, '+
                 '        PESPATRO.NOME AS NOMEPATRO, PESPART.NOME AS NOMEPARTICIPANTE '+
                 ' FROM   PESSOAFISICA PF, PESSOA PESPATRO, PESSOA PESPART, PLANPREV PL, ELEGPATRO EL, PARTPREVPLAN PP '+
                 ' WHERE  (PP.IDPESSOA       = '+pIdPessoa+') '+
                 ' AND    (PP.IDPESSJUR      = '+pIdPessJur+')'+
                 ' AND    (PP.IDPLANOPREV    = '+pIdPlanoPrev+')'+
                 ' AND    (PESPART.IDPESSOA  = '+pIdPessoa+')'+
                 ' AND    (PESPATRO.IDPESSOA = '+pIdPessJur+')'+
                 ' AND    (PL.IDPLANOPREV    = '+pIdPlanoPrev+')'+
                 ' AND    (PP.IDPESSOA       = EL.IDPESSOA) '+
                 ' AND    (PP.IDPESSJUR      = EL.IDPESSJUR) '+
                 ' AND    (PF.IDPESSOA       = EL.IDPESSOA) ');
  try
     qryAux.Open;
  except
     on E:EDBEngineError do
     begin
        frmAguarde.Apaga;
        MostrarErro(E);
        Exit;
     end;
  end;

  if qryAux.IsEmpty
  then begin
     frmAguarde.Apaga;
     MsgDlg('Erro na abertura dos dados do participante. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  sInscricaoData := qryAux.FieldByName('InscricaoData').AsString;
  sDataAdmissao  := qryAux.FieldByName('DATAADMISSAO').AsString;
  sDataDemissao  := qryAux.FieldByName('DATADEMISSAO').AsString;
  sDataCancelamento := qryAux.FieldByName('DATACANCELAMENTO').AsString;
  sSexo          := qryAux.FieldByName('SEXO').AsString;
  sDataNasc      := qryAux.FieldbyName('DataNasc').AsString;
  sNomePatro     := qryAux.FieldbyName('NomePatro').AsString;
  sNomePlano     := qryAux.FieldbyName('NomePlano').AsString;
  sNomeParticipante := qryAux.FieldbyName('NomeParticipante').AsString;

  if Trim(qryAux.FieldByName('TempoServAnterior').AsString) = ''
  then sTempoServAnterior := '0'
  else sTempoServAnterior := qryAux.FieldByName('TempoServAnterior').AsString;

  if Trim(qryAux.FieldByName('TempoNaoCreditado').AsString) = ''
  then sTempoNaoCreditado := '0'
  else sTempoNaoCreditado := qryAux.FieldByName('TempoNaoCreditado').AsString;

  sDtInicioInsc  := qryAux.FieldByName('DtInicioInsc').AsString;

  if qryAux.FieldByName('InscricaoData').AsString <> qryAux.FieldByName('DtInicioInsc').AsString
  then sPartReinscrito := '1'
  else sPartReinscrito := '0';

  if (sSalarioPart <> '') and ( StrToFloat(ClienteNumero(sSalarioPart)) > 0) 
  then sValorProvento := OraNumero(sSalarioPart)
  else begin
        sValorProvento       := BuscaSalarioPESSOA ( dtmAPrev.qryAux,
                                                     StrToInt(pIdPessJur),
                                                     StrToInt(pIdPlanoPrev),
                                                     StrToInt(pIdPessoa),
                                                     StrToInt(pSeqProposta),
                                                     sFlgInternoSitPart,
                                                     Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2));

        if Trim(sValorProvento) = '' then sValorProvento := '0';
  end;
  bPartResgPoupanca    := PartResgPoupanca( StrToInt(pIdPessJur),
                                            StrToInt(pIdPlanoPrev),
                                            StrToInt(pIdPessoa),
                                            StrToInt(pSeqProposta),
                                           qryAux);
  if bPartResgPoupanca
  then sPartResgPoupanca := '1'
  else sPartResgPoupanca := '0';

  sMesRef              := Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2);
  if (Trim(psUltimoAnoMesContrib) = '') or (psUltimoAnoMesContrib = '0000/00') or (Trim(psUltimoAnoMesContrib) = '/')
  then sUltMesPreparo       := CalcUltMesContribuicao( StrToInt(pIdPessJur),
                                                  StrToInt(pIdPlanoPrev),
                                                  StrToInt(pIdPessoa),
                                                  StrToInt(pSeqProposta), -1,
                                                  sMesRef,
                                                  qryAux)
  else sUltMesPreparo := psUltimoAnoMesContrib;

  if (Trim(sValorProvento) = '') or (Trim(sValorProvento) = '0')  and
       ( (sFlgIntEvento = 'DO') or (sFlgIntEvento = 'AC') or (sFlgIntEvento = 'FR') ) 
  then begin
     if MsgDlg(' O Salário de Participação do Participante não foi encontrado no sistema. '+
              ' Deseja continuar o Recálculo das Opções de Contribuição ? ','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrNO
     then begin
        if MsgDlg(' O Salário de Participação do Participante não foi encontrado no sistema. '+
                  ' Deseja continuar o Registro do Evento ? ','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrNO
        then begin
           frmAguarde.Apaga;
           Exit;
        end;
     end;
  end;

  sInscricaoDataFund := CalcDataInscFund(StrToInt(pIdPessJur), StrToInt(pIdPlanoPrev),
                                         StrToInt(pIdPessoa),  StrToInt(pSeqProposta),qryAux);

  if Trim(sInscricaoDataFund) = '' then sInscricaoDataFund := FormatDateTime('dd/mm/yyyy', date); 

  // Se a Contribuição possui opções, chamar tela de Cadastro de Contribuições
  // para informar o Valor base para a regra de Cálculo da Contribuição
  // Abrir a tela de contribuições de qualquer maneira
  // para que o usuario possa conferir ou alterar as contribuições associadas antes
  // das mesmas serem calculadas
  frmAguarde.Mostra('Contribuições com opções calculadas  ... ');
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT CP.IDCONTRIBUICAO, ' +
                 '        CP.IDREGRACALCOP1,CP.IDREGRACALCOP2,CP.IDREGRACALCOP3,        '+
                 '        CP.IDREGRAVALIDAOP1,CP.IDREGRAVALIDAOP2,CP.IDREGRAVALIDAOP3,  '+
                 '        CP.NUMOPCOES, CP.NOMEVALORBASE1, CP.NOMEVALORBASE2, CP.NOMEVALORBASE3, '+
                 '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, CPP.DATAINICIO, CPP.DATAFINAL  '+
                 ' FROM   CONTPREV CP, CONTRIBUICAO C, CONTRIBPREVPARTP CPP '+
                 ' WHERE  (CPP.IDPESSOA    = '+pIdPessoa       +') AND '+
                 '        (CPP.IDPESSJUR   = '+pIdPessJur      +') AND '+
                 '        (CPP.IDPLANOPREV = '+pIdPlanoPrev    +') AND '+
                 '        (CPP.SEQPROPOSTA = '+pSeqProposta    +') AND '+
                 '        (CP.IDPLANOPREV  = CPP.IDPLANOPREV ) AND '+
                 '        (CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO) AND '+
                 '        (CP.IDCONTRIBUICAO IN (' + strContribuicaoAAssociar + ')) AND ' +
                 '        (CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO) ');
  qryAux.Open;
  frmAguarde.Apaga; 

  if not qryAux.IsEmpty
  then begin
     // Verificar se algumas das contribuicoes encontradas têm regra de calculo
     frmAguarde.Mostra('Calculando opções  das contribuições  ... ');
     while not qryAux.Eof do
     begin
        // Recalcular apenas as opcoes que possuem regra de calculo
        sIdRegraCalcOp1 := qryAux.FieldbyName('IdRegraCalcOp1').AsString;
        sIdRegraCalcOp2 := qryAux.FieldbyName('IdRegraCalcOp2').AsString;
        sIdRegraCalcOp3 := qryAux.FieldbyName('IdRegraCalcOp3').AsString;
        sNomeOp1        := qryAux.FieldbyName('NomeValorBase1').AsString;
        sNomeOp2        := qryAux.FieldbyName('NomeValorBase2').AsString;
        sNomeOp3        := qryAux.FieldbyName('NomeValorBase3').AsString;
        if Trim(qryAux.FieldbyName('ValorBase1').AsString) <> ''
        then sValorBase1 := qryAux.FieldbyName('ValorBase1').AsString
        else sValorBase1 := '0';

        if Trim(qryAux.FieldbyName('ValorBase2').AsString) <> ''
        then sValorBase2 := qryAux.FieldbyName('ValorBase2').AsString
        else sValorBase2 := '0';

        if Trim(qryAux.FieldbyName('ValorBase3').AsString) <> ''
        then sValorBase3 := qryAux.FieldbyName('ValorBase3').AsString
        else sValorBase3 := '0';

        PreencheContribAssociada( StrToInt(pIdPessJur),
                                  StrToInt(pIdPlanoPrev),
                                  StrToInt(pIdPessoa),
                                  StrToInt(pSeqProposta),
                                  qryAux.FieldByName('IdContribuicao').AsInteger,
                                  sAssoc1Op1, sAssoc2Op1, sAssoc3Op1,
                                  sAssoc1Op2, sAssoc2Op2, sAssoc3Op2,
                                  sAssoc1Op3, sAssoc2Op3, sAssoc3Op3, dtmAPrev.qryAux);

        sSQL := ' SELECT '+pIdPessoa + ' AS IDPESSOA,  '+
                           pIdPessJur+ ' AS IDPESSJUR, '+
                           pIdPlanoPrev   +'  AS IDPLANOPREV, '+
                           qryAux.FieldByName('IdContribuicao').AsString+ ' AS IDCONTRIBUICAO, '+
                           ''''+PreparaStrRegra(sInscricaoData) +'''  AS INSCRICAODATA, '+
                           ''''+PreparaStrRegra(sDtInicioInsc)  +'''  AS DTINICIOINSC, '+
                           ''''+PreparaStrRegra(sDataNasc)      +'''  AS DATANASC, '+
                           OraNumero(sValorBase1)+' AS VALORBASE1, '+
                           OraNumero(sValorBase2)+' AS VALORBASE2, '+
                           OraNumero(sValorBase3)+' AS VALORBASE3, '+
                           OraNumero(sAssoc1Op1)+' AS ASSOC1OP1, '+
                           OraNumero(sAssoc2Op1)+' AS ASSOC2OP1, '+
                           OraNumero(sAssoc3Op1)+' AS ASSOC3OP1, '+
                           OraNumero(sAssoc1Op2)+' AS ASSOC1OP2, '+
                           OraNumero(sAssoc2Op2)+' AS ASSOC2OP2, '+
                           OraNumero(sAssoc3Op2)+' AS ASSOC3OP3, '+
                           OraNumero(sAssoc1Op3)+' AS ASSOC1OP3, '+
                           OraNumero(sAssoc2Op3)+' AS ASSOC2OP3, '+
                           OraNumero(sAssoc3Op3)+' AS ASSOC3OP3, '+
                           OraNumero(sValorProvento)+ ' AS VALORPROVENTO, '+
                           ''''+PreparaStrRegra(sInscricaoDataFund)+''' AS INSCRICAODATAFUND, '+
                           ''''+PreparaStrRegra(sSexo)+''' AS SEXO, '+
                           PreparaStrRegra(sTempoServAnterior)  +' AS TEMPOSERVANTERIOR, '+
                           PreparaStrRegra(sTempoNaoCreditado)  +' AS TEMPONAOCREDITADO, '+
                           PreparaStrRegra(sPartReinscrito)     + ' AS PARTREINSC, '+
                           PreparaStrRegra(sPartResgPoupanca)   +  ' AS RESGPOUPANCA, '+
                           ''''+PreparaStrRegra(sUltMesPreparo)+''' AS ULTMESPREPARO, '+
                           ''''+PreparaStrRegra(sDataAdmissao)+ ''' AS DATAADMISSAO, '+
                           ''''+PreparaStrRegra(sDataDemissao)+ ''' AS DATADEMISSAO, '+
                           ''''+PreparaStrRegra(sDataCancelamento)+ ''' AS DATACANCELAMENTO, '+
                           ''''+PreparaStrRegra(qryAux.FieldByName('DataInicio').AsString)+ ''' AS DATAINICIO, '+
                           ''''+PreparaStr(qryAux.FieldByName('DataFinal').AsString,10)+ ''' AS DATAFINAL    '+
                ' FROM   DUAL ';

        if Trim(sIdRegraCalcOp1) <> ''
        then begin
           // Executa Regra de Cálculo do Valor das Opções
           try
              sValorBase1 := RegraNumerica(sIdRegraCalcOp1,sSQL,bErro, iIdCalculoGeral);
           except
              frmAguarde.Apaga;
              MsgDlg('A Regra de Cálculo da Opção '+sNomeOp1+ ' - nº '+sIdRegraCalcOp1+' - '+
                     ' retornou um valor inválido = '+sValorBase1,'Erro',mtError,[mbOk,mbHelp],0);
              TiraSQL(dtmaprev.qryAux);
              Exit;
           end;

           if Trim(sValorBase1) = ''
           then begin
              frmAguarde.Apaga;
              MsgDlg('A Regra de Cálculo da Opção '+sNomeOp1+ ' - nº '+sIdRegraCalcOp1+' - '+
                     ' retornou um valor em branco. ','Erro',mtError,[mbOk,mbHelp],0);
              TiraSQL(dtmaprev.qryAux);
              Exit;
           end;

           try
              rValorOpcao1 := StrToFloat(ClienteNumero(sValorBase1));
           except
              frmAguarde.Apaga;
              MsgDlg('A Regra de Cálculo da Opção '+sNomeOp1+ ' - nº '+sIdRegraCalcOp1+' - '+
                     ' retornou um valor em inválido = '+sValorBase1+'.','Erro',mtError
                     ,[mbOk,mbHelp],0);
              TiraSQL(dtmaprev.qryAux);
              Exit;
           end;
        end;

        if Trim(sIdRegraCalcOp2) <> ''
        then begin
           // Executa Regra de Cálculo do Valor das Opções
           try
              sValorBase2 := RegraNumerica(sIdRegraCalcOp2,sSQL,bErro, iIdCalculoGeral);
           except
              frmAguarde.Apaga;
              MsgDlg('A Regra de Cálculo da Opção '+sNomeOp2+ ' - nº '+sIdRegraCalcOp2+' - '+
                     ' retornou um valor inválido = '+sValorBase2,'Erro',mtError,[mbOk,mbHelp],0);
              TiraSQL(dtmaprev.qryAux);
           end;

           if Trim(sValorBase2) = ''
           then begin
              frmAguarde.Apaga;
              MsgDlg('A Regra de Cálculo da Opção '+sNomeOp2+ ' - nº '+sIdRegraCalcOp2+' - '+
                     ' retornou um valor em branco. ','Erro',mtError,[mbOk,mbHelp],0);
              TiraSQL(dtmaprev.qryAux);
              Exit;
           end;

           try
              rValorOpcao2 := StrToFloat(ClienteNumero(sValorBase2));
           except
              frmAguarde.Apaga;
              MsgDlg('A Regra de Cálculo da Opção '+sNomeOp2+ ' - nº '+sIdRegraCalcOp2+' - '+
                     ' retornou um valor em inválido = '+sValorBase2+'.','Erro',mtError
                     ,[mbOk,mbHelp],0);
              TiraSQL(dtmaprev.qryAux);
              Exit;
           end;
        end;

        if Trim(sIdRegraCalcOp3) <> ''
        then begin
           // Executa Regra de Cálculo do Valor das Opções
           try
              sValorBase3 := RegraNumerica(sIdRegraCalcOp3,sSQL,bErro, iIdCalculoGeral);
           except
              frmAguarde.Apaga;
              MsgDlg('A Regra de Cálculo da Opção '+sNomeOp3+' - nº '+sIdRegraCalcOp3+' - '+
                     ' retornou um valor inválido =,'+sValorBase3,'Erro',mtError,[mbOk,mbHelp],0);
              TiraSQL(dtmaprev.qryAux);
              Exit;
           end;

           if Trim(sValorBase3) = ''
           then begin
              frmAguarde.Apaga;
              MsgDlg('A Regra de Cálculo da Opção '+sNomeOp3+' - nº '+sIdRegraCalcOp3+' - '+
                     ' retornou um valor em branco. ','Erro',mtError,[mbOk,mbHelp],0);
              TiraSQL(dtmaprev.qryAux);
              Exit;
           end;

           try
              rValorOpcao3 := StrToFloat(ClienteNumero(sValorBase3));
           except
              frmAguarde.Apaga;
              MsgDlg('A Regra de Cálculo da Opção '+sNomeOp3+ ' - nº '+sIdRegraCalcOp3+' - '+
                     ' retornou um valor em inválido = '+sValorBase3+'.','Erro',mtError
                     ,[mbOk,mbHelp],0);
              TiraSQL(dtmaprev.qryAux);
              Exit;
           end;
        end;
        // Altera a contribuição do participante
        qryGrava.Close;
        qryGrava.Sql.Clear;
        qryGrava.Sql.Add(' UPDATE CONTRIBPREVPARTP SET VALORBASE1 = '+OraNumero(sValorBase1)+','+
                         '                             VALORBASE2 = '+OraNumero(sValorBase2)+','+
                         '                             VALORBASE3 = '+OraNumero(sValorBase3)+
                         ' WHERE SEQPROPOSTA    = ' + pSeqProposta + ' AND ' +
                         '       IDPESSJUR      = ' + pIdPessJur   + ' AND ' +
                         '       IDPLANOPREV    = ' + pIdPlanoPrev + ' AND ' +
                         '       IDPESSOA       = ' + pIdPessoa    + ' AND ' +
                         '       IDCONTRIBUICAO = ' + qryAux.FieldByName('IDCONTRIBUICAO').AsString);
        try
           qryGrava.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              frmAguarde.Apaga;
              MostrarErro(E);
              Exit;
           end;
        end;

        qryAux.Next;
     end; //while

     frmAguarde.Apaga;


     
     if pbAbreTelaCadContrib then
     begin

        // Chamar cadastro de contribuicao do participante
        frmCadContribParticipante := TfrmCadContribParticipante.Create(Application);
        frmCadContribParticipante.AssociaContrib(sNomeParticipante,
                                                 sNomePatro,
                                                 sNomePlano,
                                                 pDtEventoIni,
                                                 StrToInt(pIdPessoa),
                                                 StrToInt(pIdPessJur),
                                                 StrToInt(pIdPlanoPrev),
                                                 StrToInt(pSeqProposta), False);
        frmCadContribParticipante.Free;

        if MsgDlg('Deseja confirmar Opções das Contribuições e a '+#13+
                  'Associação de Contribuições ao Participante ? ',
                  'Confirmação', mtconfirmation, [mbYes,mbNo],0) = mrNo
        then begin
           Result := False;
           Exit;
        end;
     end;

  end; // if not qryAux.IsEmpty
  frmAguarde.Apaga;

  
  if (not bPrepararContrib)
  then begin// Se não for para preparar as Contribuições (No caso do Evento Inscrição do Participante}
     Result := True;
     Exit;
  end;

  // Chama Função de Preparo de Contribuições
  sSQL := ' SELECT CPP.IDCONTRIBUICAO, CPP.SEQPROPOSTA, CPP.IDPESSOA,      CPP.CODPORTFORMA,    '+
          '        CPP.FLGDESCFOLHA,   CPP.VALORBASE1,  CPP.VALORBASE2,    CPP.VALORBASE3,      '+
          '        CPP.DATAINICIO,     CPP.DATAFINAL,   CP.ORDEMCALCULO,   PP.INSCRICAODATA,    '+
          '        PF.DATANASC,                                                                 '+
          '        C.NOME,             CP.NUMOPCOES ,   CP.NOMEVALORBASE1, CP.NOMEVALORBASE2,   '+
          '        CP.NOMEVALORBASE3,  CTP.FLGTPVLR,    CP.FLGDESCFOLHA,                        '+
          '        PL.FLGGERACTNAOENV                                                           '+
          ' FROM   CONTRIBUICAO C, CONTPREV CP , PARTPREVPLAN PP, CONTRIBPREVPARTP CPP,         '+
          '        PESSOAFISICA PF, CONTPLANPATRO CTP,                                          '+
          '        PLANPREV PL                                                                  '+
          ' WHERE  CPP.IDPESSJUR      = ' + pIdPessJur                                           +
          ' AND    CPP.IDPLANOPREV    = ' + pIdPlanoPrev                                         +
          ' AND    CPP.IDPESSOA       = ' + pIdPessoa                                            +
          ' AND    CPP.SEQPROPOSTA    = ' + pSeqProposta                                         +
          ' AND    CPP.IDCONTRIBUICAO IN (' + strContribuicaoAAssociar + ')                     '+
          ' AND    CPP.FLGCOBRA      = 1                                                        '+
          ' AND    C.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO                                       '+
          ' AND    PP.IDPESSJUR      = CPP.IDPESSJUR                                            '+
          ' AND    PP.IDPLANOPREV    = CPP.IDPLANOPREV                                          '+
          ' AND    PP.IDPESSOA       = CPP.IDPESSOA                                             '+
          ' AND    PP.SEQPROPOSTA    = CPP.SEQPROPOSTA                                          '+
          ' AND    PF.IDPESSOA       = PP.IDPESSOA                                              '+
          ' AND    CP.IDPLANOPREV    = CPP.IDPLANOPREV                                          '+
          ' AND    CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO                                       '+
          // A mudança abaixo servirá para selecionar as contribuições
          // para envio apenas de mantido ( FLGDESCFOLHA=0 ) ou de
          // ativos ( FLGDESCFOLHA=1 ) e parametrizados como
          // "ENVIA BASE" (B) ou "ENVIA VALOR" (V).
          ' AND    CTP.IDPLANOPREV   = CP.IDPLANOPREV                                           '+
          ' AND    CTP.IDPESSJUR     = PP.IDPESSJUR                                             '+
          ' AND    CTP.IDCONTRIBUICAO= CP.IDCONTRIBUICAO                                        '+
          ' AND    PL.IDPLANOPREV    = CP.IDPLANOPREV                                           '+ 
          ' AND    (    (CP.FLGDESCFOLHA = 0)                                                   '+
          '          OR ( CP.FLGDESCFOLHA = 1 AND                                               '+
          '               ( (CTP.FLGTPVLR IN (''V'',''B'')) OR (PL.FLGGERACTNAOENV = 1 ) ) )    '+ 
          '        )                                                                            '+
          
          ' ORDER BY CP.ORDEMCALCULO                                                            ';
  frmAguarde.Mostra('Verificando opções de contribuição ... ');
  // Verifica se a tabela nao esta vazia
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(sSQL);
  qryAux.Open;
  if qryAux.IsEmpty
  then begin
     Result := True;
     frmAguarde.Apaga;
     Exit;
  end;

  // Verificar se as opcoes estao preenchidas
  while not qryAux.Eof do
  begin
     if (qryAux.FieldbyName('NumOpcoes').AsString  <> '') and
        (qryAux.FieldbyName('NumOpcoes').AsInteger >= 1)
     then begin
        if (qryAux.FieldByName('NumOpcoes').AsInteger >= 1)  and
           (qryAux.FieldByName('ValorBase1').AsString = '') and
           (MsgDlg('A opção '+qryAux.FieldbyName('NomeValorBase1').AsString+
                   ' da contribuição '+qryAux.FieldByName('Nome').AsString+
                   ' não foi informada nem calculada. '+
                   ' Deseja calcular as contribuições deste participante ? ','Confirmação',
                   mtConfirmation,[mbYes,mbNo],0) = mrNo)
        then begin
           frmAguarde.Apaga;
           Result := True;
           TiraSQL(qryAux);
           Exit;
        end;
        if (qryAux.FieldByName('NumOpcoes').AsInteger >= 2)  and
           (qryAux.FieldByName('ValorBase2').AsString = '') and
           (MsgDlg('A opção '+qryAux.FieldbyName('NomeValorBase2').AsString+
                   ' da contribuição '+qryAux.FieldByName('Nome').AsString+
                   ' não foi informada nem calculada. '+
                   ' Deseja calcular as contribuições deste participante ? ','Confirmação',
                   mtConfirmation,[mbYes,mbNo],0) = mrNo)
        then begin
           frmAguarde.Apaga;
           Result := True;
           TiraSQL(qryAux);
           Exit;
        end;
        if (qryAux.FieldByName('NumOpcoes').AsInteger >= 3)  and
           (qryAux.FieldByName('ValorBase3').AsString = '') and
           (MsgDlg('A opção '+qryAux.FieldbyName('NomeValorBase3').AsString+
                   ' da contribuição '+qryAux.FieldByName('Nome').AsString+
                   ' não foi informada nem calculada. '+
                   ' Deseja calcular as contribuições deste participante ? ','Confirmação',
                   mtConfirmation,[mbYes,mbNo],0) = mrNo)
        then begin
           frmAguarde.Apaga;
           Result := True;
           TiraSQL(qryAux);
           Exit;
        end;
     end;
     qryAux.Next;
  end;
  frmAguarde.Apaga;

  
  //caso seja um retorno de mantido para ativo, não calcular contribuições de ativo
  if sFlgIntEvento = 'RA' then
  begin
     frmAguarde.Apaga;
     Result := True;
     exit;
  end;

  frmAguarde.Mostra('Calculando Contribuição ...');
  iIdLote := -1;
  if PreparaContribuicao(StrToInt(pIdPessJur),
                         StrToInt(pIdPlanoPrev),
                         prmIdMotivoContrib,
                         0, 
                         qryGrava, qryAux,
                         sSQL,
                         '', 
                         '', 
                         '', 
                         sFlgInternoSitPart, 
                         pDtEventoIni,
                         pDtEventoFin,
                         sDescPreparo,
                         'R',
                         '1',
                         False, 
                         False,
                         sMsgErro,
                         iIdLote,
                         sSalarioPart, // Salario de Participacao
                         pIdSitPart,
                         sFlgIntEvento,True,True,'',False, StrToInt(pIdEventoGerador),'','',0,0, psDataPrevPagamento)
  then begin
     MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
     frmAguarde.Apaga;
     exit;
  end;

  // Depois de calcular todas as contribuições do participante,
  // Preparar as contribuicoes exclusivas associadas ao evento (MENOS AS DE CONTINGENCIA)
  // e atualizar a tabela do evento dizendo que cobrou as exclusivas
  // Chama Função de Preparo de Contribuições
   sSQL := ' SELECT TP.QTDEMESES,         CP.ULTMESPREPARO,            CP.IDPESSOA,         '+
           ' CP.IDPESSOA AS IDPESSJUR,    CP.IDPLANOPREV,              CP.IDCONTRIBUICAO,   '+
           ' CP.UNIDNEGOC,                CP.TIPCODIGO,                CP.CODCENTRORESPON,  '+
           ' CP.IDEMPRESA,                CP.IDEMPRESAPROP,            CP.PLANO,            '+
           ' CP.CODSUBCONTA,              CP.PLACONTAC,                CP.CODPORTFORMA,     '+
           ' CP.PLACONTAD,                CP.CODCENTROCUSTOC,          CP.CODCENTROCUSTOD,  '+
           ' CP.DIAVENCIMENTO,            CP.VALORBASE1,               CP.VALORBASE2,       '+
//           ' CP.VALORBASE3,               DATAINICIO,                  DATAFINAL,           '+  //Everson TIBERO
           ' CP.VALORBASE3,               CP.DATAINICIO,               CP.DATAFINAL,        '+    //Everson TIBERO
           ' C.IDREGRACALCULO,            C.FLGACEITAOPCAO,                                 '+
           ' C.NUMOPCOES ,                CONT.NOME ,                  -1 AS NUMRECEBIMENTO, '+
           ' C.IDREGRAPRIMPAGTO,          C.IDREGRAULTPAGTO,           ''PT'' AS FLGINTERNO,  '+
           ' 0 AS FLGDESCFOLHA,           1 AS SEQPROPOSTA,    '+
           ' CP.QTDEPARCELAS,             ''Patrocinadora'' AS MATRICULA,                   '+
           ' CPL.FLGTPVLR,        '+
           ' C.IDREGRACALCULO13,          C.FLGNAOEXIGEREC,            - 1 AS NUMRECEBIMENTO, '+
           ' TO_CHAR(SYSDATE,''dd/mm/yyyy'') AS INSCRICAODATA,                               '+
           ' TO_CHAR(SYSDATE,''dd/mm/yyyy'') AS DATANASC,                                    '+
           ' C.FLGCOBRADECTERC,           C.IDCONTRIBPAI,              C.IDCONTRIBPAI2,      '+
           ' C.IDCONTRIBPAI3                                                                 '+
           ' FROM   PLANPREV PL, CONTPREV C, CONTPLANPATRO CPL, CONTRIBUICAO  CONT, CONTRIBPREVPATRO CP,        '+
           '        TPPERIODICIDADE TP,                                                      '+
           ' PATRO PT, CONTPREVEVENTO CPE, EVENTOGERADOR EG, PLANPREVPATRO PLP               '+
           ' WHERE  (CP.IDPESSOA          = '+pIdPessJur             +') '+
           ' AND    (CPE.IDPLANOPREV      = '+pIdPlanoPrev           +') '+
           ' AND    (CPE.IDEVENTOGERADOR  = '+pIdEventoGerador       +') '+
           ' AND    (CP.FLGCOBRA          = 1)                           '+
           ' AND    (C.FLGCONTINGENCIA    <> 1)                           '+
           ' AND    (CP.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+) )    '+
           ' AND    (CP.IDPLANOPREV       = C.IDPLANOPREV)               '+
           ' AND    (CP.IDCONTRIBUICAO    = C.IDCONTRIBUICAO)            '+
           ' AND    (C.IDCONTRIBUICAO     = CONT.IDCONTRIBUICAO)         '+
           ' AND    (C.IDPLANOPREV        = PL.IDPLANOPREV)              '+
           ' AND    (CP.IDPESSOA          = PT.IDPESSOA)                 '+
           ' AND    (CP.IDPESSOA          = PLP.IDPESSJUR)               '+
           ' AND    (CP.IDPLANOPREV       = PLP.IDPLANOPREV)             '+
           ' AND    (C.IDPLANOPREV        = CPE.IDPLANOPREV)             '+
           ' AND    (C.IDCONTRIBUICAO     = CPE.IDCONTRIBUICAO)          '+
           ' AND    (CPL.IDPESSJUR        = CP.IDPESSOA)                 '+
           ' AND    (CPL.IDPLANOPREV      = C.IDPLANOPREV)               '+
           ' AND    (CPL.IDCONTRIBUICAO   = C.IDCONTRIBUICAO)            '+
           ' AND    (CPE.IDEVENTOGERADOR  = EG.IDEVENTOGERADOR)          ';

  frmAguarde.Mostra('Verificando contribuições exclusivas ... ');

  // Verifica se a tabela nao esta vazia
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(sSQL);
  qryAux.Open;
  if not qryAux.IsEmpty
  then begin
     Result := True;
     frmAguarde.Apaga;
     Exit;
  end;

  frmAguarde.Mostra('Calculando Contribuições Exclusivas ...');
  iIdLote := -1;

  sDescPreparo := 'Contribuição Exclusiva [parcela de evento] - Matrícula: ' + pMatricula;

  if PreparaContribuicao(StrToInt(pIdPessJur),
                         StrToInt(pIdPlanoPrev),
                         prmIdMotivoContrib,
                         0, 
                         qryGrava, qryAux,
                         sSQL,
                         '', 
                         '', 
                         '', 
                         'PT', 
                         pDtEventoIni,
                         pDtEventoFin,
                         sDescPreparo,
                         'R',
                         '1',
                         False, 
                         False,
                         sMsgErro,
                         iIdLote,
                         sSalarioPart, 
                         pIdSitPart,
                         sFlgIntEvento,True,True,'',False,StrToInt(pIdEventoGerador),'','',0,0,psDataPrevPagamento)
  then begin
     MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
     frmAguarde.Apaga;
     exit;
  end;

  // Atualizar flag que cobrou da patrociandora
  qryGrava.Close;
  qryGrava.SQL.Clear;
  qryGrava.SQL.Add(' UPDATE EVENTOSPREV SET FLGCOBROUPATRO = 1 '+
                   ' WHERE  IDEVENTOSPREV = '+IntToStr(piIdEventosPrev));
  try
     qryGrava.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        frmAguarde.Apaga;
        MostrarErro(E);
        Exit;
     end;
  end;

  frmAguarde.Apaga;
  Result := True;
end; // AssociaNovasContribuicoes


function InsereRubricaInformada ( qry             : TwwQuery;
                                  piIdPessJur,
                                  piIdPessoa      : longint;
                                  psFlgSitPart,
                                  psFlgIntEvento,
                                  psValorSalario,
                                  psAnoMesRef      : string ) : boolean;
var iIdRubrica           : longint;
    sCodProvDesc,
    sFlgSRB,
    sFlgCompoeRemTotal,
    sFlgCompoeSalBenef,
    sFlgCompoeSalPart,
    sFlgIRRF             : string;
begin
   Result := False;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT  PT.IDRUBSALMANUT, PT.IDRUBSALMANUTPARC, PT.IDRUBSALPARTICIP, PT.IDRUBSALAUXDOENCA   '+
               ' FROM    PATRO PT                                                           '+
               ' WHERE   PT.IDPESSOA = '+IntToStr(piIdPessJur));
   qry.Open;

   if psFlgSitPart = 'MA' // Mantido
   then begin
      iIdRubrica := qry.FieldByName('IDRUBSALMANUT').AsInteger;
      sFlgSRB      := '1';
   end
   else begin
      if psFlgSitPart = 'MP' // Mantido Parcial
      then begin
         iIdRubrica := qry.FieldByName('IDRUBSALMANUTPARC').AsInteger;
         sFlgSRB      := '5';
      end
      else if psFlgSitPart = 'AS' // Assistido (só nos casos de assistencia temporaria)
           then begin
              iIdRubrica := qry.FieldByName('IDRUBSALAUXDOENCA').AsInteger;
              sFlgSRB      := '4';
           end
           else begin             // Outras situacoes (Ativo, etc)
              iIdRubrica := qry.FieldByName('IDRUBSALPARTICIP').AsInteger;
              sFlgSRB      := '1';
           end;
   end;

   if iIdRubrica <= 0 then Exit;

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT RP.CODPROVDESC,   '+
               '        PV.FLGCOMPOEREMTOTAL,  PV.FLGCOMPOESALBENEF,          '+
               '        PV.FLGCOMPOESALPART,   PV.FLGIRRF  '+
               ' FROM   PATRO PT, RUBRICAXPESS RP, PROVDESC PV  '+
               ' WHERE  PT.IDPESSOA  = '+IntToStr(piIdPessJur)+
               ' AND    RP.IDPESSOA  = PT.IDPESSOA '+
               ' AND    RP.IDRUBRICA = '+IntToStr(iIdRubrica)+
               ' AND    RP.IDRUBRICA = PV.IDPROVENTO ');
   qry.Open;
   if not qry.IsEmpty
   then begin
      sCodProvDesc       := qry.FieldByName('CODPROVDESC').AsString;
      sFlgCompoeRemTotal := qry.FieldByName('FLGCOMPOEREMTOTAL').AsString;
      sFlgCompoeSalBenef := qry.FieldByName('FLGCOMPOESALBENEF').AsString;
      sFlgCompoeSalPart  := qry.FieldByName('FLGCOMPOESALPART').AsString;
      sFlgIRRF           := qry.FieldByName('FLGIRRF').AsString;

      if Trim(sFlgCompoeRemTotal) <> '1' then sFlgCompoeRemTotal := '0';
      if Trim(sFlgCompoeSalBenef) <> '1' then sFlgCompoeSalBenef := '0';
      if Trim(sFlgCompoeSalPart)  <> '1' then sFlgCompoeSalPart  := '0';
      if Trim(sFlgIRRF)           <> '1' then sFlgIRRF := '0';
   end;

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' INSERT INTO HISTRUBSAL ( '+
               ' CODPROVDESC, FLGCOMPOEREMTOTAL, FLGCOMPOESALBENEF, FLGCOMPOESALPART, '+
               ' FLGIRRF, FLGPREVIA, FLGSRB, IDMOTIVO, IDPATRO, IDPESSJUR, IDPESSOA,  '+
               ' IDRUBRICA, MES, MESCOBRANCA, REFERENCIA, SEQRUBRICA, VALORPROVENTO,  '+
               ' IDMODULO, VALORINTEGRAL)  '+
               ' VALUES ( '''+sCodProvDesc+''', '+
                              sFlgCompoeRemTotal+', '+
                              sFlgCompoeSalBenef+', '+
                              sFlgCompoeSalPart +', '+
                              sFlgIRRF          +', '+
                              '0 , '+
                              sFlgSRB           +', '+
                              IntToStr(prmIdMotivoContrib)+', '+
                              IntToStr(piIdPessJur)+', '+
                              IntToStr(piIdPessJur)+', '+
                              IntToStr(piIdPessoa) +', '+
                              IntToStr(iIdRubrica) +', '+
                            ''''+psAnoMesRef+''', '+
                            ''''+psAnoMesRef+''', '+
                            ''' *** '', '+
                            '1 ,'+
                            OraNumero(psValorSalario)+','+
                            IntToStr(Sistema.IdModulo)+','+
                            OraNumero(psValorSalario)+')');
   try
      qry.ExecSQL;
   except
      Exit;
   end;

   Result := True;
end;

function SuspendeContribuicoes( pIdPessJur,       pIdPlanoPrev,
                                pIdPessoa,        pSeqProposta,
                                pIdEventoGerador, pDtEventoIni,
                                pDtEventoFin,     pMatricula,
                                pIdSitPart                       : string;
                                qryAux,           qryGrava       : TwwQuery;
                                sFlgIntEvento,
                                sFlgSitPartAnt                   : string;
                                psDataFinal : String = '' ) : boolean;      //BRUNO AZEVEDO SOL 130119 KINTANA 789646
var
  sSql,
  sFlgInternoSitPart,
  sDescPreparo,
  sMsgErro,
  sNomeEvento,
  sDtFinalContrib,
  sSalarioPart : string;
  iTipoDevolucao,
  iIdLote                                            : integer;
  bCobraUltima,
  bCobraUltima13 : boolean;
  sNovoSalario,
  sSalarioAtivoMP,
  sUltimoDiaMesFinal : string;
begin
  Result := False;

  // Andre Imakawa - SIG 50633 - Inicio
  {
  //Início - William Santana - SIG 21872
  //Caso o sistema seja CadastroPrev, não deve ser alterada tabelas do módulo de contribuição
  if (Sistema.IdModulo = 452) then
  begin
     Result := True;
     Exit;
  end ;
  //Término - William Santana - SIG 21872
  }
  // Andre Imakawa - SIG 50633 - Fim

  iIdLote := -1; { ( a variavel não estava sendo alimentada no ) }
                 { caso de FLDDESCFOLHA = 1 e não gerava Lote  }

  // Grava Data Final de todas as Contribuições Previdenciarias do Participante
  // que serão suspensas(desassociadas)
  if (sFlgIntEvento <> 'DP') and (sFlgIntEvento <> 'CP')
  then sDtFinalContrib := SubTraiDias(pDtEventoIni, 1)
  else sDtFinalContrib := pDtEventoIni;

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP SET DATAFINAL = TO_DATE('''+sDtFinalContrib+''',''DD/MM/YYYY'')' +
                 ' WHERE SEQPROPOSTA = ' + pSeqProposta + ' AND ' +
                 '       IDPESSJUR   = ' + pIdPessJur   + ' AND ' +
                 '       IDPLANOPREV = ' + pIdPlanoPrev + ' AND ' +
                 '       IDPESSOA    = ' + pIdPessoa    + ' AND ' +
                 '       FLGCOBRA    = 1 ');
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT NOME FROM   EVENTOGERADOR WHERE  IDEVENTOGERADOR = ' + sIdEventoGerador);
  qryAux.Open;

  if not qryAux.IsEmpty then sNomeEvento := qryAux.FieldByName('nome').AsString;

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT DESCRICAO, FLGINTERNO FROM SITPART WHERE IDSITPART = ' + pIdSitPart);
  qryAux.Open;
  sFlgInternoSitPart := qryAux.FieldByName('FLGINTERNO').AsString;


  // Verificar se existe o salário na data do evento. Se não existir, dar uma mensagem
  // Como a situacao anterior do participante pode não ser a correspondente ao salário
  // Entao, verificar qualquer uma das rubricas de salário.
  // Ex. : Demissao da Patrocinadora : ativo -> mantido saldo de conta
  //       Demissao com Manutencao   : mantido saldo de conta -> mantido
  //       Neste caso, a situacao que queriamos seria ATIVO, porém a passada pela
  //       funcao será MANTIDO SALDO DE CONTA
  sSalarioPart := '0';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT  IDRUBSALMANUT, IDRUBSALMANUTPARC, IDRUBSALPARTICIP, IDRUBSALAUXDOENCA   '+
                 ' FROM    PATRO                                                '+
                 ' WHERE   IDPESSOA = '+pIdPessJur);
  qryAux.Open;

  if qryAux.FieldByName('IDRUBSALPARTICIP').AsInteger > 0
  then begin
     sSalarioPart := BuscaRubricaMES( StrToInt(pIdPessJur),
                                      StrToInt(pIdPessoa),
                                      qryAux.FieldByName('IDRUBSALPARTICIP').AsInteger,
                                      Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2),
                                      False,
                                      qryGrava);
  end;

  if (StrToFloat(ClienteNumero(sSalarioPart)) <= 0) and
     (qryAux.FieldByName('IDRUBSALMANUT').AsInteger > 0)
  then begin
     sSalarioPart := BuscaRubricaMES( StrToInt(pIdPessJur),
                                      StrToInt(pIdPessoa),
                                      qryAux.FieldByName('IDRUBSALMANUT').AsInteger,
                                      Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2),
                                      False,
                                      qryGrava);

  end;

  if (StrToFloat(ClienteNumero(sSalarioPart)) <= 0) and
     (qryAux.FieldByName('IDRUBSALMANUTPARC').AsInteger > 0)
  then begin
     sSalarioPart := BuscaRubricaMES( StrToInt(pIdPessJur),
                                      StrToInt(pIdPessoa),
                                      qryAux.FieldByName('IDRUBSALMANUTPARC').AsInteger,
                                      Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2),
                                      False,
                                      qryGrava);

  end;

  if (StrToFloat(ClienteNumero(sSalarioPart)) <= 0) and
     (qryAux.FieldByName('IDRUBSALAUXDOENCA').AsInteger > 0)
  then begin
     sSalarioPart := BuscaRubricaMES( StrToInt(pIdPessJur),
                                      StrToInt(pIdPessoa),
                                      qryAux.FieldByName('IDRUBSALAUXDOENCA').AsInteger,
                                      Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2),
                                      False,
                                      qryGrava);

  end;

  // SEMPRE Cobrar a ultima contribuicao da situacao anterior ao evento
  // E TESTAR se é para cobrar a contribuição sobre 13o. da ultima

  // Se o evento for RETORNO DE MANTIDO PARA ATIVO (RA)
  // Entao a ultima contribuicao é do mes do retorno, porém o ultmespreparo pode
  // estar posterior a este mes
  sSQL := ' SELECT CPP.IDCONTRIBUICAO, CPP.SEQPROPOSTA, CPP.IDPESSOA,      '+
          '        CPP.CODPORTFORMA,   CP.FLGDESCFOLHAULT AS FLGDESCFOLHA, '+
          '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3,         '+
          '        CPP.DATAINICIO, CPP.DATAFINAL, CP.ORDEMCALCULO,         '+
          '        PP.INSCRICAODATA, PF.DATANASC                           '+
          ' FROM   CONTPREV CP, PARTPREVPLAN PP, CONTRIBPREVPARTP CPP, PESSOAFISICA PF  ' +
          '        ,CONTPLANPATRO CPL '+ 
          ' WHERE  CPP.IDPESSJUR      = ' + pIdPessJur   + ' AND ' +
          '        CPP.IDPLANOPREV    = ' + pIdPlanoPrev + ' AND ' +
          '        CPP.IDPESSOA       = ' + pIdPessoa    + ' AND ' +
          '        CPP.SEQPROPOSTA    = ' + pSeqProposta + ' AND ' ;

  if (sFlgIntEvento <> 'RA') and (sFlgIntEvento <> 'DC') 
  then sSQL := sSQL +  '       CPP.ULTMESPREPARO  < '''+Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2)+''' AND ';

  sSQL := sSQL +' CPP.FLGCOBRA       = 1 AND '+
          '       CP.FLGDESCFOLHAULT <> 2 AND '+ // nao cobrar ultima contribuicao
          '       PP.IDPESSJUR       = CPP.IDPESSJUR AND   '+
          '       PP.IDPLANOPREV     = CPP.IDPLANOPREV AND '+
          '       PP.IDPESSOA        = CPP.IDPESSOA AND    '+
          '       PP.SEQPROPOSTA     = CPP.SEQPROPOSTA AND '+
          '       PF.IDPESSOA        = PP.IDPESSOA     AND '+
          '       CP.IDPLANOPREV     = CPP.IDPLANOPREV AND '+
          '       CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO  '+

          
          
          '       AND CP.IDPLANOPREV     = CPL.IDPLANOPREV    '+
          '       AND CP.IDCONTRIBUICAO  = CPL.IDCONTRIBUICAO '+
          '       AND CPP.IDPESSJUR      = CPL.IDPESSJUR      ';

          

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(sSQL);
  qryAux.Open;

  // Se a data do evento for no dia 1o. do mes
  // ou nao houverem contribuicoes com a situacao da query acima, entao nao há ultima contribuicao a cobrar
  if (qryAux.IsEmpty) or (Copy(pDtEventoIni,1,2) = '01') or ((sFlgIntEvento = 'FL') and (sFlgSitPartAnt = 'AS'))
  //BRUNO AZEVEDO SOL 164143 KINTANA 1409158
      or (sFlgIntEvento = 'TS')
  then bCobraUltima := False
  else bCobraUltima := True;

  if bCobraUltima
  then begin
      // Se nao encontrar o salário, entao deixar o usuario informar.
      // Se o salário continuar zerado, deixar prosseguir para todos os eventos, com excessao de manutencao
      // A rotina preparacontribuicao irá inserir a contribuicao com valor ZERO e o sistema irá demonstrar
      // divergência se a mesma vier no interface.
      if (StrToFloat(ClienteNumero(sSalarioPart)) <= 0)
      then begin
         if MsgDlg('O salário de participação do mês '+Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2)+' não foi encontrado. '+#13+
                   'Deseja informar o valor do salário neste momento ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes
         then begin
            PedeInfAux('Informe o Salário de Participação do Mês '+Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2)+' : ',
                       'Salário de Participação (R$)','', 1, sSalarioPart );
         end;
         if ((StrToFloat(ClienteNumero(sSalarioPart)) <= 0)) and
            ((sFlgIntEvento = 'DM') or
           //(sFlgIntEvento = 'DS') or  // Aline Freire SOL 160072/5463 Kintana 1346609
             (sFlgIntEvento = 'AF') or
             (sFlgIntEvento = 'PD') )
         then begin
            MsgDlg('O salário de participação do mês '+Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2)+' não foi encontrado. '+#13+
                   'O evento não poderá ser registrado pois a última contribuição não poderá ser cobrada. Verifique.','Erro',mtError,[mbOK],0);
            exit;
         end;

         // Grava salario informado na HISTRUBSAL
         if ((StrToFloat(ClienteNumero(sSalarioPart)) > 0))
         then begin
            if not InsereRubricaInformada ( qryGrava,
                                            StrToInt(pIdPessJur),
                                            StrToInt(pIdPessoa),
                                            sFlgInternoSitPart,
                                            sFlgIntEvento,
                                            sSalarioPart,
                                            Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2))
            then begin
               MsgDlg('Erro ao inserir salário de participação do mês '+Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2)+' no histórico.','Erro',mtError,[mbOK],0);
               Exit;
            end;
         end;
      end;


     if qryAux.FieldByName('FLGDESCFOLHA').AsInteger = 0 then iIdLote := -1;

     sDescPreparo       := 'Última Contribuição antes do evento '+ sNomeEvento + ' - Matrícula: ' + pMatricula;

     //Everson Cunha - SIG80755 - Início
     //  if ((StrToFloat(ClienteNumero(sSalarioPart)) > 0)) then // Aline Freire SOL 160072/5463 Kintana 1346609
     // Segundo o analista Tiago Von - COSIS, não deve ser preparada contribuição quando o evento é "Aposentadoria Tempo de Contribuição"
     if (StrToFloat(ClienteNumero(sSalarioPart)) > 0) and (pIdEventoGerador <> '2') then // Aline Freire SOL 160072/5463 Kintana 1346609
     //Everson Cunha - SIG80755 - Fim
     begin
       if PreparaContribuicao( StrToInt(pIdPessJur),
                             StrToInt(pIdPlanoPrev),
                             prmIdMotivoContrib,
                             0,
                             qryGrava,
                             qryAux,
                             sSQL,
                             '', '', '',
                             sFlgInternoSitPart,
                             '01/'+Copy(pDtEventoIni,4,2)+'/'+Copy(pDtEventoIni,7,4),
                             sDtFinalContrib,
                             sDescPreparo,
                             'N' ,
                             '1',
                             False,
                             False,
                             sMsgErro,
                             iIdLote,
                             sSalarioPart,
                             pIdSitPart,
                             sFlgIntEvento,
                             True,
                             True,
                             Copy(sDtFinalContrib,7,4)+'/'+Copy(sDtFinalContrib,4,2),
                             False,
                             StrToInt(pIdEventoGerador),
                             '',
                             '',
                             1,0)
       then begin
          MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
          Exit;
       end;
     end;
  end;

  // Tratamento para 13o.
  if not bCobraUltima
  then begin
     sSQL := ' SELECT CPP.IDCONTRIBUICAO, CPP.SEQPROPOSTA, CPP.IDPESSOA, ' +
             '        CPP.CODPORTFORMA,    CP.FLGDESCFOLHAULT AS FLGDESCFOLHA, '+
             '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+
             '        CPP.DATAINICIO, CPP.DATAFINAL, CP.ORDEMCALCULO, PP.INSCRICAODATA, PF.DATANASC ' +
             ' FROM   CONTPREV CP, PARTPREVPLAN PP, CONTRIBPREVPARTP CPP, PESSOAFISICA PF  ' +
             ' WHERE  CPP.IDPESSJUR      = ' + pIdPessJur   + ' AND ' +
             '        CPP.IDPLANOPREV    = ' + pIdPlanoPrev + ' AND ' +
             '        CPP.IDPESSOA       = ' + pIdPessoa    + ' AND ' +
             '        CPP.SEQPROPOSTA    = ' + pSeqProposta + ' AND ' ;

     if (sFlgIntEvento <> 'RA')
     AND (pDtEventoIni <> '') // SOL 225863 KINTANA 2059478
     then sSQL := sSQL + '  CPP.ULTANO13  < '+Copy(pDtEventoIni,7,4)+' AND ';

     sSQL := sSQL +' CPP.FLGCOBRA       = 1 AND '+
             '       CP.FLGDESCFOLHAULT <> 2 AND '+ // nao cobrar ultima contribuicao
             '       PP.IDPESSJUR       = CPP.IDPESSJUR AND   '+
             '       PP.IDPLANOPREV     = CPP.IDPLANOPREV AND '+
             '       PP.IDPESSOA        = CPP.IDPESSOA AND    '+
             '       PP.SEQPROPOSTA     = CPP.SEQPROPOSTA AND '+
             '       PF.IDPESSOA        = PP.IDPESSOA     AND '+
             '       CP.IDPLANOPREV     = CPP.IDPLANOPREV AND '+
             '       CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO ';

     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(sSQL);
     qryAux.Open;

     // Se a data do evento for no dia 1o. do mes
     // ou nao houverem contribuicoes com a situacao da query acima, entao nao há ultima contribuicao a cobrar
     // adicionando condição se dtevento for 1º do mês.
     if (qryAux.IsEmpty) or (Copy(pDtEventoIni,1,2) = '01') or ((sFlgIntEvento = 'FL') and (sFlgSitPartAnt = 'AS') ) or
        (sFlgSitPartAnt = 'AT') or (sFlgSitPartAnt = 'MP') or  (sFlgSitPartAnt = 'MA')
     then bCobraUltima13 := False
     else bCobraUltima13 := True;
  end;

  if bCobraUltima13
  then begin
      if StrToFloat(ClienteNumero(sSalarioPart)) <= 0
      then begin
         if MsgDlg('O salário de participação do mês '+Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2)+' não foi encontrado. '+#13+
                   'Deseja informar o valor do salário neste momento ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes
         then begin
            PedeInfAux('Informe o Salário de Participação do Mês '+Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2)+' : ',
                       'Salário de Participação (R$)','', 1, sSalarioPart );
         end;
         if ((StrToFloat(ClienteNumero(sSalarioPart)) <= 0)) and
            ((sFlgIntEvento = 'DM') or
             //(sFlgIntEvento = 'DS') or // Aline Freire SOL 160072/5463 Kintana 1346609
             (sFlgIntEvento = 'AF') or
             (sFlgIntEvento = 'PD') )
         then begin
            MsgDlg('O salário de participação do mês '+Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2)+' não foi encontrado. '+#13+
                   'O evento não poderá ser registrado pois a última contribuição não poderá ser cobrada. Verifique.','Erro',mtError,[mbOK],0);
            exit;
         end;

         // Grava salario informado na HISTRUBSAL
         if ((StrToFloat(ClienteNumero(sSalarioPart)) > 0))
         then begin
            if not InsereRubricaInformada ( qryGrava,
                                            StrToInt(pIdPessJur),
                                            StrToInt(pIdPessoa),
                                            sFlgInternoSitPart,
                                            sFlgIntEvento,
                                            sSalarioPart,
                                            Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2))
            then begin
               MsgDlg('Erro ao inserir salário de participação do mês '+Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2)+' no histórico.','Erro',mtError,[mbOK],0);
               Exit;
            end;
         end;
      end;

     if qryAux.FieldByName('FLGDESCFOLHA').AsInteger = 0 then iIdLote := -1;

     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT DESCRICAO, FLGINTERNO FROM SITPART ' +
                    ' WHERE IDSITPART = ' + pIdSitPart);
     qryAux.Open;
     sFlgInternoSitPart := qryAux.FieldByName('FLGINTERNO').AsString;
     sDescPreparo       := 'Última Contribuição Sobre 13o. antes do evento '+ sNomeEvento + ' - Matrícula: ' + pMatricula;
     sSalarioPart       := BuscaSalarioPESSOA ( qryAux,
                                                StrToInt(pIdPessJur),
                                                StrToInt(pIdPlanoPrev),
                                                StrToInt(pIdPessoa),
                                                StrToInt(pSeqProposta),
                                                sFlgInternoSitPart,
                                                Copy(pDtEventoIni,7,4)+'/13');

     if ((StrToFloat(ClienteNumero(sSalarioPart)) > 0)) then // Aline Freire SOL 160072/5463 Kintana 1346609
     begin
       if PreparaContribuicao( StrToInt(pIdPessJur),
                               StrToInt(pIdPlanoPrev),
                               prmIdMotivoContrib,
                               0,
                               qryGrava,
                               qryAux,
                               sSQL,
                               '', '', '',
                               sFlgInternoSitPart,
                               '01/'+Copy(pDtEventoIni,4,2)+'/'+Copy(pDtEventoIni,7,4),
                               sDtFinalContrib,
                               sDescPreparo,
                               'N' ,
                               '1',
                               False,
                               False,
                               sMsgErro,
                               iIdLote,
                               sSalarioPart,
                               pIdSitPart,
                               sFlgIntEvento,
                               True,
                               True,
                               '',
                               True,
                               StrToInt(pIdEventoGerador),
                               '',
                               '',
                               1,0)
       then begin
          MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
          Exit;
       end;
     end;
  end;

  // Andre Imakawa - SIG 50633 - Inicio
  if (Sistema.IdModulo <> 452) then
  begin
    // CUSTOMIZACAO - IDENTIFICADA PELA
    // Neste ponto, a contribuicao do ultimo mes do evento, estará acertada,
    // inclusive o seu valor esperado pro-rateada
    // Agora, falta tratar as contribuicoes POSTERIORES ao mes do evento
    // O tratamento a ser dado é :
    // 1. se a contribuicao estiver apenas PREPARADA, entao EXCLUI-LA
    // 2. se a contribuicao estiver ENVIADA, entao ZERAR O VALOR ESPERADO
    // 3. se a contribuicao estiver RECEBIDA, entao DEVOLVER O VALOR RECEBIDO
    sSQL := ' SELECT HST.IDCONTRIBUICAO, HST.VALORESPERADO, HST.VALORRECEBIDO,  '+
            '        HST.NUMRECEBIMENTO, HST.MESREFERENCIA, HST.MESCOBRANCA,    '+
            '        HST.IDPESSOA,       HST.IDPESSJUR,     HST.SITRECEBIMENTO, '+
            '        HST.IDPLANOPREV,    HST.SEQPROPOSTA,   HST.IDMOTIVO,       '+
            '        HST.FLGEVENTO,      HST.FLGCONCESSAO                       '+ 
            ' FROM   CONTRIBPREVPARTP CPP, HSTCONTRIBPREV HST                   '+
            ' WHERE  (HST.IDPESSOA       = '+pIdPessoa        +')'+
            ' AND    (HST.IDPESSJUR      = '+pIdPessJur       +')'+
            ' AND    (HST.IDPLANOPREV    = '+pIdPlanoPrev     +')'+
            ' AND    (HST.SEQPROPOSTA    = '+pSeqProposta     +')'+
            ' AND    (HST.MESREFERENCIA  > '''+Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2) +''')'+
            ' AND    (SUBSTR(HST.MESREFERENCIA,6,2) <> ''13'' ) '+
            ' AND    ((HST.SITRECEBIMENTO IN (0,1) ) OR (NOT (HST.SITRECEBIMENTO = 1 AND HST.CODDOCUMENTOPREV IS NOT NULL))) '+ 
            ' AND    (HST.FLGDEVOLUCAO = 0 ) '+
            ' AND    ((HST.OPTRATDIVERG IS NULL) OR (HST.OPTRATDIVERG <= 0) ) '+
            ' AND    (HST.IDMOTIVO       <> '+IntToStr(prmIdMotivoDiverg)                        +'  )'+
            ' AND    (CPP.IDPESSJUR      = HST.IDPESSJUR      ) '+
            ' AND    (CPP.IDPLANOPREV    = HST.IDPLANOPREV    ) '+
            ' AND    (CPP.IDPESSOA       = HST.IDPESSOA       ) '+
            ' AND    (CPP.SEQPROPOSTA    = HST.SEQPROPOSTA    ) '+
            ' AND    (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO ) '+
            ' AND    (CPP.FLGCOBRA       = 1                  ) '+
            ' AND    ((HST.VALORRECEBIDO  IS NULL) OR (HST.VALORRECEBIDO  = 0)) '+
            ' AND    (HST.IDCONTRIBUICAO NOT IN ( SELECT IDCONTRIBUICAO FROM PARAMDOTACAO  '+
            '                                     WHERE   IDPESSJUR   = '+pIdPessJur+
            '                                     AND     IDPLANOPREV = '+pIdPlanoPrev+') ) ';

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(sSQL);
    qryAux.Open;

    while not qryAux.Eof do
    begin
       if (qryAux.FieldByName('SITRECEBIMENTO').AsInteger = 0) and
          (qryAux.FieldByName('FLGEVENTO').AsInteger      = 0) and
          (qryAux.FieldByName('FLGCONCESSAO').AsInteger   = 0)
       then begin // preparada
          with qryGrava do
          begin
             Close;
             SQL.Clear;
             SQL.Add(' DELETE FROM HSTATRASOCONTRIB '+
                     ' WHERE  MESREFERENCIA  = '''+qryAux.FieldByName('MESREFERENCIA').AsString+''''+
                     ' AND    MESCOBRANCA    = '''+qryAux.FieldByName('MESCOBRANCA').AsString+''''+
                     ' AND    IDMOTIVO       = '+qryAux.FieldByName('IDMOTIVO').AsString+
                     ' AND    NUMRECEBIMENTO = '+qryAux.FieldByName('NUMRECEBIMENTO').AsString);
             try
                ExecSQL;
             except
                on E:EDBEngineError do
                begin
                   MostrarErro(E);
                   Exit;
                end;
             end;

             Close;
             SQL.Clear;
             SQL.Add(' DELETE FROM HSTCONTRIBPREV '+
                     ' WHERE  MESREFERENCIA  = '''+qryAux.FieldByName('MESREFERENCIA').AsString+''''+
                     ' AND    MESCOBRANCA    = '''+qryAux.FieldByName('MESCOBRANCA').AsString+''''+
                     ' AND    IDMOTIVO       = '+qryAux.FieldByName('IDMOTIVO').AsString+
                     ' AND    NUMRECEBIMENTO = '+qryAux.FieldByName('NUMRECEBIMENTO').AsString);
             try
                ExecSQL;
             except
                on E:EDBEngineError do
                begin
                   MostrarErro(E);
                   Exit;
                end;
             end;
          end; // with qryGrava
       end
       else begin // enviada
          with qryGrava do
          begin
             Close;
             SQL.Clear;
             SQL.Add(' UPDATE HSTCONTRIBPREV SET VALORCALCULADO   = VALORESPERADO,                                              '+
                     '                           VALORESPERADO    = 0,                                                          '+
                     '                           MOTIVOCANCEL     = ''Suspensão de Contribuição por Evento - '+sNomeEvento+''', '+
                     '                           DATACANCELAMENTO = TO_DATE('''+pDtEventoIni+''', ''DD/MM/YYYY'')               '+
                     ' WHERE  MESREFERENCIA  = '''+qryAux.FieldByName('MESREFERENCIA').AsString+'''                             '+
                     ' AND    MESCOBRANCA    = '''+qryAux.FieldByName('MESCOBRANCA').AsString+'''                               '+
                     ' AND    IDMOTIVO       = '+qryAux.FieldByName('IDMOTIVO').AsString                                         +
                     ' AND    NUMRECEBIMENTO = '+qryAux.FieldByName('NUMRECEBIMENTO').AsString                                   +
                     ' AND    FLGDEVOLUCAO   = 0                                                                                '+ 
                     ' AND    ((OPTRATDIVERG IS NULL) OR (OPTRATDIVERG <= 0))                                                   '+
                     ' AND    CODDOCUMENTOPREV IS NULL                                                                          '); 
             try
                ExecSQL;
             except
                on E:EDBEngineError do
                begin
                   MostrarErro(E);
                   Exit;
                end;
             end;
          end; // with qryGrava
       end;

       qryAux.Next;
    end;
  end;
  // Andre Imakawa - SIG 50633 - Fim

  // Se for evento de benefício entao não devolver as contribuicoes, só devolver
  // na concessao
  // Senao Devolver contribuicoes cobradas posteriores a data de inicio do evento
  // Sendo que no mes da data de inicio do evento, a devolução deverá ser pro-rata
  // e o salario na histrubsal deverá ser gravado com este mesmo pro-rata
  if ( (sFlgInterno <>  'DA' ) and        (sFlgInterno <>  'TS' ) and
      (sFlgInterno <>  'ID' ) and        (sFlgInterno <>  'IN' ) and
      (sFlgInterno <>  'DO' ) and        (sFlgInterno <>  'AC' ) and
      (sFlgInterno <>  'FL' ) and        (sFlgInterno <>  'RC' ) and
      (sFlgInterno <>  'TE' )  )
      OR
      
      // Se for falecimento mas o participante não era assistido
      // Entao a rotina de encerramento de beneficios não foi chamada
      //       Com isso, não foi feito acerto de contribuicoes posteriores
      //       a data do falecimento. O que deve ser feito agora
      ( (sFlgInterno = 'FL') and (sFlgSitPartAnt <> 'AS' ) )
  then begin
        // DEVOLVER CONTRIBUICOES PAGAS
        qryAux.Close;
        qryAux.Sql.Clear;
        qryAux.Sql.Add(' SELECT SP.FLGINTERNO , P.NOME '+
                   ' FROM   EVENTOSPREV EP, SITPART SP, PESSOA P '+
                   ' WHERE  EP.IDSITPARTATUAL  = SP.IDSITPART        '+
                   ' AND    EP.IDPESSJUR       = '+pIdPessJur+
                   ' AND    EP.IDPLANOPREV     = '+pIdPlanoPrev+
                   ' AND    EP.IDPESSOA        = '+pIdPessoa+
                   ' AND    EP.SEQPROPOSTA     = '+pSeqProposta+
                   ' AND    EP.IDEVENTOGERADOR = '+pIdEventoGerador+
                   ' AND    EP.IDPESSOA        = P.IDPESSOA ');
        qryAux.Open;

        iTipoDevolucao := 0;                                          
        if ((sFlgIntEvento = 'DP') And (prmFLGNAOACERTCONTDP = 0)) OR 
           (sFlgIntEvento = 'DM') OR (sFlgIntEvento = 'CP')
        then   iTipoDevolucao := DevolveContribuicoes ( StrToInt(pIdPessJur),
                                      StrToInt(pIdPlanoPrev),
                                      StrToInt(pIdPessoa),
                                      StrToInt(pSeqProposta),
                                      iIdLote,
                                      pMatricula,
                                      qryAux.FieldByName('Nome').AsString,
                                      qryAux.FieldByName('FlgInterno').AsString,
                                      pDtEventoIni, // inicio do beneficio, por exemplo
                                      psDataFinal,    //BRUNO AZEVEDO SOL 130119 KINTANA 789646
                                      Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2),
                                      Copy(pDtEventoFin,7,4)+'/'+Copy(pDtEventoFin,4,2),
                                      0,                                             
                                      'E',sFlgIntEvento, pIdEventoGerador )
        else
         // Apenas para garantir que a primeira condição acima
         // não saia apenas por o flag estar ligado
         If sFlgIntEvento <> 'DP' Then
          iTipoDevolucao := DevolveContribuicoes ( StrToInt(pIdPessJur),
                                      StrToInt(pIdPlanoPrev),
                                      StrToInt(pIdPessoa),
                                      StrToInt(pSeqProposta),
                                      iIdLote,
                                      pMatricula,
                                      qryAux.FieldByName('Nome').AsString,
                                      qryAux.FieldByName('FlgInterno').AsString,
                                      pDtEventoIni, // inicio do beneficio, por exemplo
                                      psDataFinal,     //BRUNO AZEVEDO SOL 130119 KINTANA 789646
                                      Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2),
                                      Copy(pDtEventoFin,7,4)+'/'+Copy(pDtEventoFin,4,2),
                                      -1,                                             
                                      'E',sFlgIntEvento, pIdEventoGerador );

        // Retorno : -1 - não devolver e parar processamento
        //            0 - não devolver e continuar processamento
        //            1 - devolver
        if iTipoDevolucao < 0 then Exit;
  end;

  // Andre Imakawa - SIG 74780 - Inicio
  // Suspender a cobrança de todas as Contribuições Previdenciarias do Participante
  if pIdEventoGerador <> '356' then
  begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA  = 0  ' +
                   ' WHERE SEQPROPOSTA = ' + pSeqProposta + ' AND ' +
                   '       IDPESSJUR   = ' + pIdPessJur   + ' AND ' +
                   '       IDPLANOPREV = ' + pIdPlanoPrev + ' AND ' +
                   '       IDPESSOA    = ' + pIdPessoa    + ' AND ' +
                   '       FLGCOBRA    = 1');
  end
  else
  begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP CPP SET CPP.FLGCOBRA  = 0  ' +
                   ' WHERE CPP.SEQPROPOSTA = ' + pSeqProposta + ' AND ' +
                   '       CPP.IDPESSJUR   = ' + pIdPessJur   + ' AND ' +
                   '       CPP.IDPLANOPREV = ' + pIdPlanoPrev + ' AND ' +
                   '       CPP.IDPESSOA    = ' + pIdPessoa    + ' AND ' +
                   '       CPP.FLGCOBRA    = 1 AND '+
                   '       NOT EXISTS (SELECT 1 FROM CONTPREV CP WHERE CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO AND CP.FLGINTERNO LIKE ''M%'')' );
  end;
  // Andre Imakawa - SIG 74780 - Fim

  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  Result := True;
end; // SuspendeContribuicoes

function ParticipantePossuiBeneficiosParaEvento(pIdPessJur, pIdPlanoPrev, pIdPessoa, pIdEventoGerador: string; qryAux: TwwQuery): boolean;
begin
  Result := False;

 {Verifica se o Participante possui beneficios para o evento solicitado}
 {Somente para o Aberto}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDBENEFICIO FROM BENEFPLANOPART ' +
                 ' WHERE IDPESSOA     = ' + pIdPessoa    + ' AND ' +
                 '       IDPESSJUR    = ' + pIdPessJur   + ' AND ' +
                 '       IDPLANOPREV  = ' + pIdPlanoPrev + ' AND ' +
                 '       IDBENEFICIO IN ' +
                 '      (SELECT IDBENEFICIO FROM BENEFICIO ' +
                 '       WHERE IDEVENTOGERADOR = ' + pIdEventoGerador + ')');
  qryAux.Open;

  if not qryAux.IsEmpty then // Se possui beneficios
     Result := True
  else
     begin
          Result := False;
          MsgDlg('Este Participante não possui benefícios para o evento solicitado.','Informação',mtInformation,[mbOk,mbHelp],0);
     end;
end;

function VerificaCopiaOpcaoContrib(qryAux: TwwQuery;
                                   sIdPessoa,    sIdPlanoPrev, sIdPessjur,
                                   sSeqProposta, sIdContribuicao : string;
                                   iNumOpcao   : Integer;
                                   var sValorBase1, sValorBase2, sValorBase3 : string): string;
var
   sSQL, sValorOpcao  : string;
begin
    sSQL := '';

    result := sSQL;   

    sValorBase1 := '';
    sValorBase2 := '';
    sValorBase3 := '';

    if iNumOpcao <= 0 then Exit;

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' SELECT OP.IDCONTRIBUICAO, OP.NUMOPCAO,    OP.IDCONTRIBCOP, '+
                   '        OP.NUMOPCAOCOP,    CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3 '+
                   ' FROM   OPCAOCONTRIB OP,   CONTRIBPREVPARTP CPP '+
                   ' WHERE  OP.IDCONTRIBUICAO = '+sIdContribuicao +
                   ' AND    CPP.IDPESSOA      = '+sIdPessoa +
                   ' AND    CPP.IDPLANOPREV   = '+sIdPlanoPrev +
                   ' AND    CPP.IDPESSJUR     = '+sIdPessJur +
                   ' AND    CPP.SEQPROPOSTA   = '+sSeqProposta +
                   ' AND    OP.IDCONTRIBCOP   = CPP.IDCONTRIBUICAO '+
                   ' ORDER  BY OP.NUMOPCAO   ');
    qryAux.Open;
    while not qryAux.Eof do
    begin
         sValorOpcao := qryAux.FieldByName('VALORBASE'+
                                            qryAux.FieldByName('NUMOPCAOCOP').AsString).AsString;
         if qryAux.FieldByName('NUMOPCAO').AsInteger = 1
         then begin
            sSQL := sSQL + 'VALORBASE1 = '+OraNumero(sValorOpcao) +', ';
            sValorBase1 := OraNumero(sValorOpcao);
         end
         else if qryAux.FieldByName('NUMOPCAO').AsInteger = 2
              then begin
                 sSQL := sSQL + 'VALORBASE2 = '+OraNumero(sValorOpcao) +', ';
                 sValorBase2 := OraNumero(sValorOpcao);
              end
              else if qryAux.FieldByName('NUMOPCAO').AsInteger = 3
                   then begin
                      sSQL := sSQL + 'VALORBASE3 = '+OraNumero(sValorOpcao) +', ';
                      sValorBase3 := OraNumero(sValorOpcao);
                   end;
         qryAux.Next;
    end;
    qryAux.Close;

    if sSQL <> '' then
       sSQL := Copy(sSQl, 1, Length(sSQL)-2);
    result  := sSQL;
end;


function ExecutaRegraDtFinalPDv(pIdRegraDtFinal, sSQL : string;
                                var sMsgErro : string):string;
var sData : string;
    bErro : Boolean;
    dDataFinal : TDateTime;
begin
    sData    := '';
    Result   := '';
    sMsgErro := '';

    if pIdRegraDtFinal = ''
    then begin
       sMsgErro := 'A regra de cálculo da data final do evento, não está associada ';
       Exit;
    end;

    with dtmAPREV do
    begin
       qryRegra.Close;
       qryRegra.SQL.Clear;
       qryRegra.SQl.Add(sSQL);
       qryRegra.Open;

       try
         regraAPrev.QueryIn  := qryRegra;
         regraAPrev.RuleName := pIdRegraDtFinal;
         regraAPrev.Execute;
       except
          sMsgErro  := 'Ocorreu um erro na execução da data final.';
          Exit;
       end;

       if RegraAPrev.Error
       then begin
          sMsgErro := 'Erro na execução da regra da data final.';
          Exit;
       end;

       sData := RegraAPrev.Result;

    end;

    if (Trim(sData) <> '') and (Trim(sData) = '0')
    then begin
       sData := '';
       Result := sData;
       Exit;
    end;

    if (StrToInt(Copy(sData,4,2)) = 2) and (StrToInt(Copy(sData,1,2)) > 28)
    then begin
       sData := IntToStr(TrazUltDiaMes(StrToInt(Copy(sData,4,2)),
                                       StrToInt(Copy(sData,7,4))))+
                Copy(sData,3,8);
    end;

    // Se a regra retornar 0, entender que é branco
    if (Trim(sData) <> '')
    then begin
       try
         dDataFinal := StrToDate(sData);
       except
         sMsgErro   := 'A regra da data final retornou uma data inválida';
         sData      := '';
       end;
    end;

    Result       := sData;
end;

function BuscaOpcaoContOrigem(qry : TwwQuery; sIdPessoa,sIdPlanoPrev,
                              sIdPessjur, sSeqProposta, sIdContribuicao:string):string;
begin
    result := '0';
    qry.Close;
    qry.Sql.Clear;
    qry.Sql.Add(' SELECT OP.IDCONTRIBUICAO, OP.NUMOPCAO,    OP.IDCONTRIBCOP, '+
                '        OP.NUMOPCAOCOP,    CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3 '+
                ' FROM   OPCAOCONTRIB OP,   CONTRIBPREVPARTP CPP '+
                ' WHERE  OP.IDCONTRIBUICAO = '+sIdContribuicao +
                ' AND    CPP.IDPESSOA      = '+sIdPessoa +
                ' AND    CPP.IDPLANOPREV   = '+sIdPlanoPrev +
                ' AND    CPP.IDPESSJUR     = '+sIdPessJur +
                ' AND    CPP.SEQPROPOSTA   = '+sSeqProposta +
                ' AND    OP.IDCONTRIBCOP   = CPP.IDCONTRIBUICAO '+
                ' ORDER  BY OP.NUMOPCAO   ');
    qry.Open;
    if not qry.IsEmpty then
       result := OraNumero(qry.FieldByName('VALORBASE1').AsString);
    qry.Close;
end;

function VoltaSituacoesParticipante( qry, qryAux : TwwQuery;
                                     piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta,
                                     piIdEventoEncerrado : longint;
                                     var piIdEventoAnterior,
                                         piIdSitPart : longint;
                                     var psFlgIntSitPart,
                                         sMsgErro : string;
                                     pbPedeEvento : boolean) : boolean;
var bOk : boolean;
    iIdSitFunc,  iIdSitPart,
    iIdSitPlano, iIdEvento : longint;
begin
    Result := False;
    piIdEventoAnterior := -1;
    with qry do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT E.IDEVENTOSPREV,  E.IDSITPLANOATUAL,  '+
               '        E.IDSITPARTATUAL, E.IDSITFUNCATUAL    '+
               ' FROM   EVENTOSPREV E                         '+
               ' WHERE  E.IDEVENTOSPREV IN '+  
               '        ( SELECT MAX(IDEVENTOSPREV) '+
               '          FROM EVENTOSPREV          '+
               '          WHERE IDPESSOA     = '+IntToStr(piIdPessoa)+
               '          AND   IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
               '          AND   IDPESSJUR    = '+IntToStr(piIdPessJur)+
               '          AND   IDEVENTOGERADOR = '+IntToStr(piIdEventoEncerrado)+  
               '          AND   DATAREGISTRO = ( SELECT MAX(DATAREGISTRO) FROM EVENTOSPREV  '+
               '                                 WHERE IDPESSOA     = '+IntToStr(piIdPessoa)+
               '                                 AND   IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
               '                                 AND   IDPESSJUR    = '+IntToStr(piIdPessJur)+') '+
               '                                 AND   IDEVENTOGERADOR = '+IntToStr(piIdEventoEncerrado)+ 
               '        )' );
       Open;
       if IsEmpty
       then begin
          // Se nao encontrou o evento que gerou o beneficio,
          // pedir para o usuario informar as situacoes para as quais
          // o participante irá retornar
          bOk := PedeSituacoesAoRetorno(iIdSitFunc, iIdSitPart, iIdSitPlano,
                                        iIdEvento,pbPedeEvento);
          if not bOk
          then begin
             sMsgErro := 'Evento não encontrado. O sistema não poderá retornar as situações do participante.';
             Exit;
          end
          else begin
             piIdEventoAnterior := iIdEvento;
             Close;
             SQL.Clear;
             
             SQL.Add(' SELECT '+IntToStr(iIdSitFunc) +' AS IDSITFUNCATUAL, '+
                     '        '+IntToStr(iIdSitPart) +' AS IDSITPARTATUAL, '+
                     '        '+IntToStr(iIdSitPlano)+' AS IDSITPLANOATUAL '+
                     ' FROM DUAL ');
             Open;
          end;
       end;
       piIdSitPart := iIdSitPart;

       First;
       while not Eof do
       begin
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' UPDATE PARTPREVPLAN SET IDSITPART = '+FieldByName('IDSITPARTATUAL').AsString+','+
                         '                         IDSITPLANOPREV = '+FieldByName('IDSITPLANOATUAL').AsString+
                         ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)+
                         ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                         ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)+
                         ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta));
          try
             qryAux.ExecSQL;
          except
             sMsgErro := 'Erro na atualização da situação do participante.';
             Exit;
          end;

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' UPDATE ELEGPATRO SET IDSITFUNC = '+FieldByName('IDSITFUNCATUAL').AsString+
                         ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)+
                         ' AND    IDPESSOA    = '+IntToStr(piIdPessoa));
          try
             qryAux.ExecSQL;
          except
             sMsgErro := 'Erro na atualização da situação do participante.';
             Exit;
          end;

          Next;
       end; // while
    end;

    // Retornar evento anterior
    if piIdEventoAnterior <= 0
    then begin
       with qryAux do
       begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT E.IDEVENTOGERADOR '+
                  '        FROM EVENTOSPREV E '+
                  ' WHERE  E.IDEVENTOSPREV IN '+
                  '        ( SELECT MAX(IDEVENTOSPREV) '+
                  '          FROM EVENTOSPREV '+
                  '          WHERE IDPESSOA     = '+IntToStr(piIdPessoa)+
                  '          AND   IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                  '          AND   IDPESSJUR    = '+IntToStr(piIdPessJur)+
                  '          AND   DATAREGISTRO = ( SELECT MAX(DATAREGISTRO) FROM EVENTOSPREV '+
                  '                                 WHERE IDPESSOA     = '+IntToStr(piIdPessoa)+
                  '                                 AND   IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
                  '                                 AND   IDPESSJUR    = '+IntToStr(piIdPessJur)+
                  '                                 AND   IDEVENTOSPREV < '+qry.FieldByName('IdEventosPrev').AsString+')' +
                  '          AND   E.IDEVENTOSPREV < '+qry.FieldByName('IdEventosPrev').AsString+')' );
          Open;
          if not IsEmpty
          then piIdEventoAnterior := FieldByName('IdEventoGerador').AsInteger
          else piIdEventoAnterior := -1;
       end;
    end;
    // Retornar flgInterno da situacao na fundacao
    with qryAux do
    begin
       Close;
       SQL.Clear;
       SQL.Add('SELECT FLGINTERNO FROM SITPART WHERE IDSITPART = '+IntToStr(piIdSitPart));
       Open;
       if not IsEmpty
       then psFlgIntSitPart := FieldByName('FlgINterno').AsString
       else psFlgIntSitPart := 'AT';
    end;

    qry.Close;
    qryAux.Close;
    Result := True;
end;

function GeraSalarioVoltaEvento ( qryAux : TwwQuery;
                                     piIdPessJur, piIdPlanoPrev, piIdPessoa,
                                     piSeqProposta,
                                     piIdEvento          : longint;
                                     psDataVoltaEvento   : string;
                                     piIdSitPart     : longint;
                                     psFlgSitPart    : string;
                                     var sMsgErro        : string) : boolean;
var // sFlgInterno,
    sNomeRubrica,
    sFlgSRB,
    sMes            : string;
begin
   Result := False;

   // Se o participante voltou para a situação "Ativo"  Entao fazer :
   // 1. Calcular o salário de ativo baseado no último salário existente
   //    antes da ocorrencia do evento, levando em consideração os reajustes ocorridos
   //    no período e o pró-rata relativo a data da volta do evento.
   // 2. Gerar salário calculado na HISTRUBSAL
   if (psFlgSitPart = 'MA')
   then begin
      sNomeRubrica := 'IDRUBSALMANUT';
      sFlgSRB      := '1';
   end
   else if (psFlgSitPart = 'MP')
        then begin
           sNomeRubrica := 'IDRUBSALMANUTPARC';
           sFlgSRB      := '5';
        end
        else begin
           sNomeRubrica := 'IDRUBSALPARTICIP';
           sFlgSRB      := '1';
        end;

   // Buscar salario na histrubsal
   sMes := Copy(psDataVoltaEvento,7,4)+'/'+Copy(psDataVoltaEvento,4,2);
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT HT.MES,HT.VALORPROVENTO,  RP.CODPROVDESC, P.FLGCOMPOEREMTOTAL, '+
              '        P.FLGCOMPOESALBENEF, P.FLGCOMPOESALPART, P.FLGIRRF,            '+
              '        RP.IDRUBRICA                                                   '+
              ' FROM   HISTRUBSAL HT, RUBRICAXPESS RP, PATRO PT , PROVDESC P          '+
              ' WHERE  (HT.IDPESSJUR = '+IntToStr(piIdPessJur)+')'+
              ' AND    (HT.IDPESSOA  = '+IntToStr(piIdPessoa)+')'+
              ' AND    (HT.IDRUBRICA = RP.IDRUBRICA)  '+
              ' AND    (HT.IDPESSJUR = RP.IDPESSOA)   '+
              ' AND    (HT.IDRUBRICA = P.IDPROVENTO)  '+
              ' AND    (HT.IDPESSJUR = PT.IDPESSOA)   '+
              ' AND    (HT.IDRUBRICA = PT.'+sNomeRubrica+')'+
              ' AND    (HT.MES       <= '''+sMes+''') '+
              ' ORDER BY HT.MES DESC  ');
      Open;
      if IsEmpty
      then begin
         sMsgErro := 'Salário do participante antes do evento não encontrado.';
         Exit;
      end
      else begin
         First;
      end;

      dtmAPrev.qry.Close;
      dtmAPrev.qry.SQL.Clear;
      dtmAPrev.qry.SQL.Add(' INSERT INTO HISTRUBSAL ( CODPROVDESC, FLGCOMPOEREMTOTAL, FLGCOMPOESALBENEF, FLGCOMPOESALPART, '+
          '                          FLGIRRF, FLGPREVIA, FLGSRB, IDMOTIVO, IDPATRO, IDPESSJUR, IDPESSOA,  '+
          '                          IDRUBRICA, MES, MESCOBRANCA, REFERENCIA, SEQRUBRICA, VALORPROVENTO)  '+
          ' VALUES ( '''+FieldByName('CodProvDesc').AsString+''', '+
                         IntToStr(FieldByName('FlgCompoeRemTotal').AsInteger)+', '+
                         IntToStr(FieldByName('FlgCompoeSalBenef').AsInteger)+', '+
                         IntToStr(FieldByName('FlgCompoeSalPart').AsInteger) +', '+
                         IntToStr(FieldByName('FlgIRRF').AsInteger) +', '+
                         '0 , '+
                         sFlgSRB           +', '+
                         IntToStr(prmIdMotivoContrib)+', '+
                         IntToStr(piIdPessJur)+', '+
                         IntToStr(piIdPessJur)+', '+
                         IntToStr(piIdPessoa) +', '+
                         IntToStr(FieldByName('IdRubrica').AsInteger) +', '+
                    ''''+sMes+''', '+
                    ''''+sMes+''', '+
                    ''' *** '', '+
                    '1 ,'+
                    OraNumero(FloatToStr(FieldByName('ValorProvento').AsFloat))+')');
      try
         dtmAPrev.qry.ExecSQL;
      except
         sMsgErro := 'Erro na inserção do salário para o mês : '+sMes;
         Exit;
      end;

   end;
   Result := True;
end; // GeraSalarioVoltaEvento

function DesassociaContribuicoesParticipante( qry, qryAux : TwwQuery;
                                     piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta,
                                     piIdEventoEncerrado : longint;
                                     var sMsgErro : string) : boolean;
begin
   Result := False;
   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDCONTRIBUICAO FROM CONTPREVEVENTO '+
              ' WHERE  IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)+
              ' AND    IDEVENTOGERADOR = '+IntToStr(piIdEventoEncerrado));
      Open;
      if IsEmpty
      then begin
         Result := True;
         Exit;
      end;
      First;
      while not Eof do
      begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQl.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0 '+
                        ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)+
                        ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                        ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)+
                        ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta)+
                        ' AND    IDCONTRIBUICAO = '+FieldByName('IdContribuicao').AsString);
         try
            qryAux.ExecSQL;
         except
            sMsgErro := 'Erro na desassociação das contribuições .';
            Exit;
         end;
         Next;
      end;
   end;
   qry.Close;
   qryAux.Close;
   Result := True;
end;

function ReassociaContribuicoesParticipante( qry,
                                             qryAux               : TwwQuery;
                                             piIdPessJur,
                                             piIdPlanoPrev,
                                             piIdPessoa,
                                             piSeqProposta,
                                             piIdEventoAnterior,              // evento antes da concessao de beneficio
                                             piIdEventoAtual      : longint;  // evento da concessao de beneficio que está sendo encerrado agora
                                             var sMsgErro         : string) : boolean;
begin
   Result := False;
   // Se o evento nao for encontrado, subentender que é uma Inscricao de participante
   if piIdEventoAnterior <= 0
   then begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT IDEVENTOGERADOR FROM EVENTOGERADOR '+
                     ' WHERE FLGINTERNO = ''IP'' ');
      qryAux.Open;
      if qryAux.IsEmpty
      then begin
         sMsgErro := 'Evento anterior não encontrado. Verifique. ';
         Exit;
      end;
      piIdEventoAnterior := qryAux.FieldByName('IdEventoGerador').AsInteger;
   end;

   with qry do
   begin
      Close;
      SQL.Clear;
      
      SQL.Add(' SELECT HST.IDCONTRIBUICAOF AS IDCONTRIBUICAO, HST.DATAINICIO, HST.DATAFINAL '+
              ' FROM   EVENTOSPREV EV, HSTCONTEVENTOSPR HST                   '+
              ' WHERE  EV.IDPESSJUR       = '+IntToStr(piIdPessJur)            +
              ' AND    EV.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)          +
              ' AND    EV.IDPESSOA        = '+IntToStr(piIdPessoa)             +
              ' AND    EV.SEQPROPOSTA     = '+IntToStr(piSeqProposta)          +
              ' AND    EV.IDEVENTOGERADOR = '+IntToStr(piIdEventoAtual)        +
              ' AND    HST.IDEVENTOSPREV  = EV.IDEVENTOSPREV                  '+
              ' AND    HST.FLGASSOCIADA   = 0                                 ' );
      Open;
      if IsEmpty
      then begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT IDCONTRIBUICAO, '+
                 QuotedStr('          ')+' AS DATAINICIO, '+  
                 QuotedStr('          ')+' AS DATAFINAL '+    
                 ' FROM   CONTPREVEVENTO '+
                 ' WHERE  IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)+
                 ' AND    IDEVENTOGERADOR = '+IntToStr(piIdEventoAnterior));
         Open;
         if IsEmpty
         then begin
            Result := True;
            Exit;
         end;
      end;
      First;
      while not Eof do
      begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQl.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1 ');
         
         if FindField('DATAINICIO') <> nil
         
         then qryAux.SQL.Add(', DATAINICIO = TO_DATE('''+FieldByName('DATAINICIO').AsString+''',''DD/MM/YYYY'')');

         if FindField('DATAFINAL') <> nil
         
         then qryAux.SQL.Add(', DATAFINAL = TO_DATE('''+FieldByName('DATAFINAL').AsString+''',''DD/MM/YYYY'')');
         


         qryAux.SQL.Add(' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)+
                        ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                        ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)+
                        ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta)+
                        ' AND    IDCONTRIBUICAO = '+FieldByName('IdContribuicao').AsString);
         try
            qryAux.ExecSQL;
         except
            sMsgErro := 'Erro na associação das contribuições .';
            Exit;
         end;
         Next;
      end;
   end;
   qry.Close;
   qryAux.Close;
   Result := True;
end;

function PedeSituacoesAoRetorno(var piIdSitFunc,
                                    piIdSitPart,
                                    piIdSitPlano,
                                    piIdEvento : longint;
                                    pbPedeEvento : boolean) : boolean;
var mrSituacoes : TModalResult;
begin
   Result       := False;
   piIdSitFunc  := -1;
   piIdSitPart  := -1;
   piIdSitPlano := -1;
   piIdEvento   := -1;

   frmPedeSituacoesAnt := TfrmPedeSituacoesAnt.Create(Application);
   mrSituacoes         := frmPedeSituacoesAnt.ShowModal;

   if mrSituacoes = mrOk
   then begin
      with frmPedeSituacoesAnt do
      begin
         grpEvento.Visible := pbPedeEvento;
         piIdSitFunc  := qrySitFunc.FieldByName('IdSitFunc').AsInteger;
         piIdSitPart  := qrySitPart.FieldByName('IdSitPart').AsInteger;
         piIdSitPlano := qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsInteger;
         piIdEvento   := qryEvento.FieldByName('IdEventoGerador').AsInteger;
         Result := True;
      end;
   end;
   frmPedeSituacoesAnt.Free;
end;

function AbateSalario (piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                       psDataReferencia : string;
                       var sMsgErro : string ) : boolean;
var sSalario, sSalario13,
    sIdRubrica,
    sIdRubrica13,
    sMesReferencia  : string;
    bAlgumEnviaValor : boolean;
begin
   Result := False;

   
   if Trim(psDataReferencia) = '' then psDataReferencia := FormatDateTime('dd/mm/yyyy', date); 

   if Copy(psDataReferencia,1,2) = '01'
   then sMesReferencia  := Copy(psDataReferencia, 7,4)+'/'+Copy(psDataReferencia,4,2)
   else begin
      Result := True;
      Exit;
   end;

   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT CPL.FLGTPVLR, PT.IDRUBSALPARTICIP '+
              ' FROM   PLANPREVPATRO PL, PATRO PT, CONTPLANPATRO CPL  '+
              ' WHERE  PL.IDPESSJUR    = '+IntToStr(piIdPessJur)+
              ' AND    PL.IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
              ' AND    PT.IDPESSOA     = PL.IDPESSJUR        '+
              ' AND    CPL.IDPESSJUR   = PL.IDPESSJUR '+
              ' AND    CPL.IDPLANOPREV = PL.IDPLANOPREV ');
      Open;

      if (IsEmpty)
      then begin
         Result := True;
         Exit;
      end;

      bAlgumEnviaValor := False;
      First;
      while not Eof do
      begin
         if FieldByName('FLGTPVLR').AsString = 'V'
         then bAlgumEnviaValor := True;
         Next;
      end;

      if not bAlgumEnviaValor
      then begin
         Result := True;
         Exit;
      end;

      if Trim(FieldByName('IDRUBSALPARTICIP').AsString) <> ''
      then sIdRubrica     := FieldByName('IDRUBSALPARTICIP').AsString
      else sIdRubrica     := '0';

      sIdRubrica13   := '0';

   end;

   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT SALPARTICIPACAO '+
              ' FROM   PARTPREVPLAN    '+
              ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
              ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)+
              ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta));
      Open;
      if IsEmpty
      then begin
         sMsgErro := 'Participante não encontrado.';
         Exit;
      end;
      sSalario := FieldByName('SalParticipacao').AsString;

      if Trim(sIdRubrica13) = ''
      then sSalario13 := '0'
      else begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT VALORPROVENTO  '+
                 ' FROM   HISTRUBSAL '+
                 ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)+
                 ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)+
                 ' AND    IDRUBRICA   = '+sIdRubrica13+
                 ' AND    MES         = '''+sMesReferencia+'''' );
         Open;
         if IsEmpty
         then sSalario13 := '0'
         else sSalario13 := FieldByName('ValorProvento').AsString;
      end;
   end;

   // Diminuir no mes de referencia
   sMesReferencia := Copy(psDataReferencia,7,4)+'/'+Copy(psDataReferencia,4,2);
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE HSTRUBRICAXPESS SET VALORACUMULADO = VALORACUMULADO - '+OraNumero(sSalario)+
              ' WHERE  IDPESSOA      = '+ IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV   = '+ IntToStr(piIdPlanoPrev)+
              ' AND    MESREFERENCIA = '''+sMesReferencia+''''+
              ' AND    IDRUBRICA     = '+sIdRubrica);
      try
         ExecSQL;
      except
         sMsgErro := 'Erro ao atualizar total de salário.';
         Exit;
      end;
   end;

   // Diminuir do 13o.
   sMesReferencia := Copy(psDataReferencia,7,4)+'/13';
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE HSTRUBRICAXPESS SET VALORACUMULADO = VALORACUMULADO - '+OraNumero(sSalario13)+
              ' WHERE  IDPESSOA      = '+ IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV   = '+ IntToStr(piIdPlanoPrev)+
              ' AND    MESREFERENCIA = '''+sMesReferencia+''''+
              ' AND    IDRUBRICA     = '+sIdRubrica13);
      try
         ExecSQL;
      except
         sMsgErro := 'Erro ao atualizar total de 13º salário.';
         Exit;
      end;
   end;

   Result := True;
end;

function ExecutaRegraAssociaContribuicao (piIdPessJur          : longint;
                                          piIdPlanoPrev        : longint;
                                          piIdPessoa           : longint;
                                          piSeqProposta        : longint;
                                          piIdContribuicao     : longint;
                                          piIdRegraValidacao   : longint;
                                          psDataEvento         : string;
                                          psPartReinsc         : string;
                                          psPartResgPoupanca   : string;
                                          psUltMesPreparo      : string;
                                          psSalPart            : string;
                                          psDataInscFund       : string;
                                          psIdEventoGerador    : string;     
                                          pdValorBase1         : double = 0; 
                                          pdValorBase2         : double = 0; 
                                          pdValorBase3         : double = 0  ): boolean; 

var sAssoc1Op1, sAssoc2Op1, sAssoc3Op1,
    sAssoc1Op2, sAssoc2Op2, sAssoc3Op2,
    sAssoc1Op3, sAssoc2Op3, sAssoc3Op3,
    sValorBaseOrigem,
    psFlgInternoAntes ,
    psFlgInternoAtual ,

    psIdSitPartAntes ,
    psIdSitPlanAntes ,
    psIdSitFuncAntes ,

    psIdSitPartAtual ,
    psIdSitPlanAtual ,
    psIdSitFuncAtual ,
    sNumeroProcesso , 
    sSQL  : string;
    bErro : boolean;
    sNomeContrib : String; 
begin
   Result := False;

   if piIdRegraValidacao <= 0
   then begin
      Result := True;
      Exit;
   end;
   
   sSql := 'SELECT NOME '+
           'FROM CONTRIBUICAO '+
           'WHERE (IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+') ';

   dtmAPrev.qry.Close;
   dtmAPrev.qry.Sql.Clear;
   dtmAPrev.qry.Sql.Add(sSql);
   dtmAPrev.qry.Open;

   sNomeContrib := dtmAPrev.qry.FieldByName('NOME').AsString;
   

   
   sSql := 'SELECT NUMEROPROCESSO '+
           'FROM BENEFBFCIARIO '+
           'WHERE (IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+') '+
           'AND (IDPESSJUR = '+IntToStr(piIdPessJur)+') '+
           'AND (IDTITULAR = '+IntToStr(piIdPessoa)+') '+
           'AND (IDSITBENEFICIO = 1) '+
           'AND (SEQPROPOSTA = 1)';

   dtmAPrev.qry.Close;
   dtmAPrev.qry.Sql.Clear;
   dtmAPrev.qry.Sql.Add(sSql);
   dtmAPrev.qry.Open;

   sNumeroProcesso := dtmAPrev.qry.FieldByName('NUMEROPROCESSO').AsString;

   If trim(sNumeroProcesso) = ''
    Then sNumeroProcesso:='-1';
   

   // Executar Regra de Validação da Associação de Contribuição
   PreencheContribAssociada( piIdPessJur,
                             piIdPlanoPrev,
                             piIdPessoa,
                             piSeqProposta,
                             piIdContribuicao,
                             sAssoc1Op1, sAssoc2Op1, sAssoc3Op1,
                             sAssoc1Op2, sAssoc2Op2, sAssoc3Op2,
                             sAssoc1Op3, sAssoc2Op3, sAssoc3Op3,
                             dtmAPrev.qryAux);

   // Procura o valor base das contribuicoes de origem
   // em caso de copia de opcoes
   sValorBaseOrigem := BuscaOpcaoContOrigem(dtmAPrev.qryAux,
                                            IntToStr(piIdPessoa),
                                            IntToStr(piIdPlanoPrev),
                                            IntToStr(piIdPessjur),
                                            IntToStr(piSeqProposta),
                                            IntToStr(piIdContribuicao));

   sSQL := ' SELECT EV.IDEVENTOSPREV, EV.IDSITPLANOATUAL, EV.IDSITPLANONOVO, '+
           '        EV.IDSITPARTATUAL, EV.IDSITPARTNOVO, EV.IDSITFUNCATUAL, EV.IDSITFUNCNOVO, '+
           '        ST.FLGINTERNO,     STA.FLGINTERNO AS FLGINTERNOANT    '+
           ' FROM   EVENTOSPREV EV, SITPART ST,  SITPART STA  '+
           ' WHERE  EV.IDSITPARTATUAL = STA.IDSITPART         '+
           ' AND    EV.IDSITPARTNOVO  = ST.IDSITPART          '+
           ' AND    EV.IDEVENTOSPREV IN                       '+
           '        ( SELECT MAX(IDEVENTOSPREV) '+
           '          FROM EVENTOSPREV          '+
           '          WHERE IDPESSOA     = '+IntToStr(piIdPessoa)+
           '          AND   IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
           '          AND   IDPESSJUR    = '+IntToStr(piIdPessJur)+
           '          AND   DATAREGISTRO = ( SELECT MAX(DATAREGISTRO) FROM EVENTOSPREV '+
           '                                 WHERE IDPESSOA     = '+IntToStr(piIdPessoa)+
           '                                 AND   IDPLANOPREV  = '+IntToStr(piIdPlanoPrev)+
           '                                 AND   IDPESSJUR    = '+IntToStr(piIdPessJur)+') '+
           '        )' ;
   dtmAPrev.qry.Close;
   dtmAPrev.qry.Sql.Clear;
   dtmAPrev.qry.Sql.Add(sSql);
   dtmAPrev.qry.Open;

   if not dtmAPrev.qry.IsEmpty
   then begin
      psFlgInternoAntes := dtmAPrev.qry.FieldByName('flginternoant').AsString;
      psFlgInternoAtual := dtmAPrev.qry.FieldByName('flginterno').AsString;

      psIdSitPartAntes := dtmAPrev.qry.FieldByName('idsitpartatual').AsString;
      psIdSitPlanAntes := dtmAPrev.qry.FieldByName('idsitplanoatual').AsString;
      psIdSitFuncAntes := dtmAPrev.qry.FieldByName('idsitfuncatual').AsString;

      psIdSitPartAtual := dtmAPrev.qry.FieldByName('idsitpartnovo').AsString;
      psIdSitPlanAtual := dtmAPrev.qry.FieldByName('idsitplanonovo').AsString;
      psIdSitFuncAtual := dtmAPrev.qry.FieldByName('idsitfuncnovo').AsString;
   end
   else begin
      psFlgInternoAntes := 'XX';
      psFlgInternoAtual := 'XX';

      psIdSitPartAntes := '-1';
      psIdSitPlanAntes := '-1';
      psIdSitFuncAntes := '-1';

      psIdSitPartAtual := '-1';
      psIdSitPlanAtual := '-1';
      psIdSitFuncAtual := '-1';
   end;

   sSQL := ' SELECT PP.IDPESSOA,     PP.IDPESSJUR,      PP.IDPLANOPREV,  PP.SALPARTICIPACAO, PP.SALINSCRICAO,  '+
           '        PP.SEQPROPOSTA,  PP.INSCRICAODATA,  PP.DTINICIOINSC, PP.DATACANCELAMENTO,                  '+
           '        PP.IDSITPART,    PP.IDSITPLANOPREV, PP.FLGDEVEPREVIDENC,                                   '+
           '        EL.IDSITFUNC,    EL.CODCENTROCUSTO, EL.IDCARGOEXT,   EL.MATRICULA, EL.TEMPONAOCREDITADO,   '+
           '        EL.DATAADMISSAO, EL.DATADEMISSAO,   EL.SALTOTAL,     EL.PARTICIPPREVID, EL.PARTICIPASSIST, '+
           '        EL.NIVEL,        EL.TEMPOSERVANTERIOR, PF.DATANASC,  PF.SEXO, PF.DATAMORTE,                '+
           '        PF.ESTCIVIL,     P.NUMDOCUMENTO,                                                           '+
           '        PP.INSCRICAODATA AS DATAINICIO,                                                            '+
           '        PP.FLGFITESPECIAL ,                                                                        '+
           ''''+    sValorBaseOrigem  +''' AS VALORBASE,                                                       '+
           OraNumero(FloatToStr(pdValorBase1))+' AS VALORBASE1,                                                '+ 
           OraNumero(FloatToStr(pdValorBase2))+' AS VALORBASE2,                                                '+ 
           OraNumero(FloatToStr(pdValorBase3))+' AS VALORBASE3,                                                '+ 
           OraNumero(psIdEventoGerador)       +' AS IDEVENTOGERADOR,                                           '+ 
           ''''+ Trim(Copy(psDataEvento,7,4))+'/'+Trim(Copy(psDataEvento,4,2))+''' AS ANOMESREF,               '+ 
           ''''+    Trim(psDataEvento)+''' AS DATAREF,                                                         '+
                    psPartReinsc+' AS PARTREINSC,                                                              '+
                    psPartResgPoupanca +' AS RESGPOUPANCA,                                                     '+
           ''''+    psUltMesPreparo+''' AS ULTMESPREPARO,                                                      '+
                    OraNumero(psSalPart) +' AS VALORPROVENTO,                                                  '+
                    OraNumero(sAssoc1Op1)+' AS ASSOC1OP1,                                                      '+
                    OraNumero(sAssoc2Op1)+' AS ASSOC2OP1,                                                      '+
                    OraNumero(sAssoc3Op1)+' AS ASSOC3OP1,                                                      '+
                    OraNumero(sAssoc1Op2)+' AS ASSOC1OP2,                                                      '+
                    OraNumero(sAssoc2Op2)+' AS ASSOC2OP2,                                                      '+
                    OraNumero(sAssoc3Op2)+' AS ASSOC3OP3,                                                      '+
                    OraNumero(sAssoc1Op3)+' AS ASSOC1OP3,                                                      '+
                    OraNumero(sAssoc2Op3)+' AS ASSOC2OP3,                                                      '+
                    OraNumero(sAssoc3Op3)+' AS ASSOC3OP3,                                                      '+
        ''''+psFlgInternoAntes         +''' AS FLGINTERNOANT,                                                  '+
        ''''+psFlgInternoAtual         +''' AS FLGINTERNO,                                                     '+
        ''''+psIdSitPartAntes          +''' AS IDSITPARTATUAL,                                                 '+
        ''''+psIdSitPlanAntes          +''' AS IDSITPLANOATUAL,                                                '+
        ''''+psIdSitFuncAntes          +''' AS IDSITFUNCATUAL,                                                 '+
        ''''+psIdSitPartAtual          +''' AS IDSITPARTNOVO,                                                  '+
        ''''+psIdSitPlanAtual          +''' AS IDSITPLANONOVO,                                                 '+
        ''''+psIdSitFuncAtual          +''' AS IDSITFUNCNOVO,                                                  '+
                   ''''+psDataInscFund+'''  AS INSCRICAODATAFUND,                                              '+
                  ''''+sNumeroProcesso+'''  AS NUMEROPROCESSO,                                                 '+ 
                     ''''+sNomeContrib+'''  AS NOMECONTRIB                                                     '+ 
           ' FROM PARTPREVPLAN PP, ELEGPATRO EL, PESSOAFISICA PF, PESSOA P                                     '+
           ' WHERE PP.IDPESSOA    = ' + IntToStr(piIdPessoa )                                                   +
           ' AND   PP.IDPESSJUR   = ' + IntToStr(piIdPessJur )                                                  +
           ' AND   PP.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev)                                                 +
           ' AND   PP.SEQPROPOSTA = ' + IntToStr(piSeqProposta)                                                 +
           ' AND   EL.IDPESSOA    = PP.IDPESSOA                                                                '+
           ' AND   EL.IDPESSJUR   = PP.IDPESSJUR                                                               '+
           ' AND   PP.IDPESSOA    = PF.IDPESSOA                                                                '+
           ' AND   PP.IDPESSOA    = P.IDPESSOA                                                                 ';
   Result := RegraBooleana(IntToStr(piIdRegraValidacao), sSQL, bErro);
end;

function CalculaContribEXCLUSIVAEvento : boolean;
begin
   Result := False;


   Result := True;
end; // CalculaContribEXCLUSIVAEvento

function InsereNaPatrocinadoraNova ( qryAux, qryGrava : TwwQuery;
                                     piIdPessoa,
                                     piIdPessJurAntigo, piIdPessJurNovo,
                                     piIdPlanoPrevAntigo, piIdPlanoPrevNovo,
                                     piIdSitFuncNovo : longint;
                                     psMatriculaNova, psDataAdmissaoNova : string;
                                     piIdSitPartNovo, piIdSitPlanoNovo,
                                     piInscricaoNumeroNovo : longint;
                                     psDataInscricaoNova,
                                     psSalParticipacaoNovo   : string;
                                     piIdEventoGerador       : longint;
                                     psFlgIntEvento,
                                     psPartReinsc,
                                     psUltMesPreparo         : string;
                                     var sMsgErro            : string ) : boolean;
var
  sSalTotal,           sParticipAssist,       sTempoServAntReal,
  sTempoServAnterior,  sTempoNaoCreditado,    sTempoSitEspecial,
  sInscricaoData,      sInscricaoTipo,        sSalInscricao,
  sFlgDeveEmprestimo,  sFlgDeveAssistenc,     sFlgDevePrevidenc : string;

  bAssocia : boolean;
begin
  Result   := False;
  sMsgErro := '';

  // Buscar dados antigos para repetir na patrocinadora nova
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT SALTOTAL, PARTICIPASSIST, TEMPOSERVANTREAL, TEMPOSERVANTERIOR, ' +
                 '        TEMPONAOCREDITADO, TEMPOSITESPECIAL ' +
                 ' FROM   ELEGPATRO ' +
                 ' WHERE  IDPESSJUR = ' + IntToStr(piIdPessJurAntigo)  +
                 ' AND    IDPESSOA  = ' + IntToStr(piIdPessoa) );
  qryAux.Open;

  sSalTotal          := OraNumero(qryAux.FieldByName('SALTOTAL').AsString);
  sParticipAssist    := OraNumero(qryAux.FieldByName('PARTICIPASSIST').AsString);
  sTempoServAntReal  := OraNumero(qryAux.FieldByName('TEMPOSERVANTREAL').AsString);
  sTempoServAnterior := OraNumero(qryAux.FieldByName('TEMPOSERVANTERIOR').AsString);
  sTempoNaoCreditado := OraNumero(qryAux.FieldByName('TEMPONAOCREDITADO').AsString);
  sTempoSitEspecial  := OraNumero(qryAux.FieldByName('TEMPOSITESPECIAL').AsString);

  // Inserir participante na patrocinadora nova
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' INSERT INTO ELEGPATRO ' +
                   ' (IDPESSJUR, IDPESSOA, IDSITFUNC, MATRICULA, ' +
                   '  DATAADMISSAO, SALTOTAL, PARTICIPPREVID, PARTICIPASSIST, ' +
                   '  TEMPOSERVANTREAL, TEMPOSERVANTERIOR, TEMPONAOCREDITADO, TEMPOSITESPECIAL) ' +
                   ' VALUES ( '+
                    IntToStr(piIdPessJurNovo)        + ',' +
                    IntToStr(piIdPessoa)             + ',' +
                    IntToStr(piIdSitFuncNovo)        + ',' +
                     '''' + psMatriculaNova+ ''''    + ',' +
                    ' TO_DATE(''' +psDataAdmissaoNova+ ''',''dd/mm/yyyy'')' + ',' +
                    sSalTotal                        + ',' +
                    ' 1 '                            + ',' +
                    sParticipAssist                  + ',' +
                    sTempoServAntReal                + ',' +
                    sTempoServAnterior               + ',' +
                    sTempoNaoCreditado               + ',' +
                    sTempoSitEspecial                + ')');
  try
     qryAux.ExecSQL
  except
     sMsgErro := 'Erro ao inserir participante na patrocinadora nova. ';
     Exit;
  end;

  // Inserir participante no plano novo
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT REQUERIMENTODATA, INSCRICAONUMERO, INSCRICAODATA, INSCRICAOTIPO, ' +
                 '        SALINSCRICAO, SALPARTICIPACAO, FLGDEVEEMPRESTIMO, ' +
                 '        FLGDEVEASSISTENC, FLGDEVEPREVIDENC '+
                 ' FROM PARTPREVPLAN ' +
                 ' WHERE  IDPESSJUR   = ' + IntToStr(piIdPessJurAntigo)  +
                 ' AND    IDPLANOPREV = ' + IntToStr(piIdPlanoPrevAntigo)+
                 ' AND    IDPESSOA    = ' + IntToStr(piIdPessoa)+
                 ' AND    SEQPROPOSTA = 1 ' );
  qryAux.Open;

  sInscricaoData     := qryAux.FieldByName('INSCRICAODATA').AsString;
  sInscricaoTipo     := qryAux.FieldByName('INSCRICAOTIPO').AsString;
  sSalInscricao      := OraNumero(qryAux.FieldByName('SALINSCRICAO').AsString);
  sFlgDeveEmprestimo := OraNumero(qryAux.FieldByName('FLGDEVEEMPRESTIMO').AsString);
  sFlgDeveAssistenc  := OraNumero(qryAux.FieldByName('FLGDEVEASSISTENC').AsString);
  sFlgDevePrevidenc  := OraNumero(qryAux.FieldByName('FLGDEVEPREVIDENC').AsString);

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.SQL.Add(' INSERT INTO PARTPREVPLAN ' +
                 ' (IDPESSJUR, IDPESSOA, IDPLANOPREV, SEQPROPOSTA, IDSITPART, ' +
                 '  IDSITPLANOPREV, REQUERIMENTODATA, INSCRICAONUMERO, DTINICIOINSC, INSCRICAODATA, ' +
                 '  INSCRICAOTIPO,  SALINSCRICAO, SALPARTICIPACAO, FLGDEVEEMPRESTIMO, ' +
                 '  FLGDEVEASSISTENC, FLGDEVEPREVIDENC, FLGDESATIVADO) '+
                 '  VALUES ( ' +
                    IntToStr(piIdPessJurNovo)       + ',' +
                    IntToStr(piIdPessoa)            + ',' +
                    IntToStr(piIdPlanoPrevNovo)     + ',' +
                    '1 '                            + ',' +
                    IntToStr(piIdSitPartNovo)       + ',' +
                    IntToStr(piIdSitPlanoNovo)      + ',' +                 
                 '  TO_DATE(''' + FormatDateTime('dd/mm/yyyy', date)   + ''',''dd/mm/yyyy'')' + ',' + 
                    IntToStr(piInscricaoNumeroNovo) + ',' +
                 '  TO_DATE('''+Trim(sInscricaoData)+ ''',''dd/mm/yyyy'')' + ',' +
                 '  TO_DATE(''' + Trim(psDataInscricaoNova) + ''',''dd/mm/yyyy'')' + ',' +
                    '''' + sInscricaoTipo + ''''    + ',' +
                    OraNumero(sSalInscricao)        + ',' +
                    OraNumero(psSalParticipacaoNovo)+ ',' +
                    sFlgDeveEmprestimo              + ',' +
                    sFlgDeveAssistenc               + ',' +
                    sFlgDevePrevidenc               + ',' +
                    '0 )');
  try
     qryAux.ExecSQL
  except
     sMsgErro := 'Erro ao inserir participante na patrocinadora X plano novo. ';
     Exit;
  end;

  // Associa as Reservas da Patrocinadora antiga para a nova Patrocinadora do Participante
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' INSERT INTO RESERVAPART(IDPLANOPREV, IDTIPORESERVA, IDPESSOA, ' +
                   '             IDPARTICIPANTE, ' + 
                   '             IDPESSJUR, ' +
                   '             SEQPROPOSTA, DATAREFERENCIASA, VALORRESERVA, PERCENTUALSAQUE, ' +
                   '             FLGATIVO, DATADESATIV) ' +
                   ' SELECT IDPLANOPREV, IDTIPORESERVA, IDPESSOA, ' +
                           'IDPESSOA, ' + 
                            IntToStr(piIdPessJurNovo)+', '+
                   '        SEQPROPOSTA, DATAREFERENCIASA, VALORRESERVA, PERCENTUALSAQUE, ' +
                   '        FLGATIVO, DATADESATIV ' +
                   ' FROM RESERVAPART ' +
                   ' WHERE  IDPESSJUR   = ' + IntToStr(piIdPessJurAntigo)  +
                   ' AND    IDPLANOPREV = ' + IntToStr(piIdPlanoPrevAntigo)+
                   ' AND    IDPESSOA    = ' + IntToStr(piIdPessoa)+
                   ' AND    SEQPROPOSTA = 1 ' );
  try
     qryAux.ExecSQL
  except
     sMsgErro := 'Erro ao associar reservas ao participante na patrocinadora X plano novo. ';
     Exit;
  end;


  // Zera o valor das Reservas da Patrocinadora antiga.
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE RESERVAPART SET VALORRESERVA = NULL ' +
                 ' WHERE  IDPESSJUR   = ' + IntToStr(piIdPessJurAntigo)  +
                 ' AND    IDPLANOPREV = ' + IntToStr(piIdPlanoPrevAntigo)+
                 ' AND    IDPESSOA    = ' + IntToStr(piIdPessoa)+
                 ' AND    SEQPROPOSTA = 1 ' );
  try
     qryAux.ExecSQL
  except
     sMsgErro := 'Erro ao apagar reservas ao participante na patrocinadora X plano novo. ';
     Exit;
  end;


  // Associa as contribuições do plano na nova patrocinadora do participante
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT IDCONTRIBUICAO, IDREGRAVALIDAASS FROM CONTPREVEVENTO ' +
                 ' WHERE  IDPLANOPREV     = ' + IntToStr(piIdPlanoPrevNovo)+
                 ' AND    IDEVENTOGERADOR = ' + IntToStr(piIdEventoGerador) );
  qryAux.Open;

  if not qryAux.IsEmpty
  then begin
     strContribuicaoAAssociar := '';
     qryAux.First;
     while not qryAux.EOF do
     begin
       bAssocia := False;
       bAssocia := ExecutaRegraAssociaContribuicao (piIdPessJurNovo,
                                           piIdPlanoPrevNovo,
                                           piIdPessoa,
                                           1,
                                           qryAux.FieldByName('IdContribuicao').AsInteger,
                                           qryAux.FieldByName('IdRegraValidaAss').AsInteger,
                                           psDataInscricaoNova,
                                           psPartReinsc,
                                           '0',
                                           psUltMesPreparo,
                                           psSalParticipacaoNovo,
                                           sInscricaoData, IntToStr(piIdEventoGerador)); 
       if bAssocia
       then strContribuicaoAAssociar := strContribuicaoAAssociar + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ',';
       qryAux.Next;
     end;

     strContribuicaoAAssociar := Copy(strContribuicaoAAssociar, 1,Length(strContribuicaoAAssociar)-1);

     if not AssociaNovasContribuicoes(IntToStr(piIdPessJurNovo),
                                      IntToStr(piIdPlanoPrevNovo),
                                      IntToStr(piIdPessoa),
                                      '1',
                                      IntToStr(piIdEventoGerador),
                                      psDataInscricaoNova,
                                      '',
                                      psMatriculaNova,
                                      IntToStr(piIdSitPartNovo),
                                      '',
                                      False, True, False,
                                      qryAux, qryGrava,
                                      psFlgIntEvento, -1 , '')
     then begin
        MsgDlg('Erro na associação das novas contribuições.','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
     end;

  end;

  Result := True;
end; // InsereNaPatrocinadoraNova

function CancelaNaPatrocinadoraAntiga ( qryAux, qryGrava     : TwwQuery;
                                        piIdPessoa,
                                        piIdPessJurAntigo,
                                        piIdPlanoPrevAntigo,
                                        piIdSitPartAntiga,
                                        piIdEventoGerador    : longint;
                                        psFlgIntEvento,
                                        psDataVolta,
                                        psMatriculaAntiga    : string;
                                        var sMsgErro         : string;
                                        psDataFinal : String = '' ) : boolean;  //BRUNO AZEVEDO SOL 130119 KINTANA 789646

begin
  Result := False;

  frmAguarde.Mostra('Suspendendo contribuições ...');

  // Suspende as cobrança das contribuições da patrocinadora antiga do participante
  if not SuspendeContribuicoes( IntToStr(piIdPessJurAntigo),
                                IntToStr(piIdPlanoPrevAntigo),
                                IntToStr(piIdPessoa),
                                '1',
                                IntToStr(piIdEventoGerador),
                                psDataVolta,
                                '',
                                psMatriculaAntiga,
                                IntToStr(piIdSitPartAntiga),
                                qryAux,
                                qryGrava,
                                psFlgIntEvento, '', psDataFinal ) //BRUNO AZEVEDO SOL 130119 KINTANA 789646
  then begin
     frmAguarde.Apaga;
     sMsgErro := 'Erro ao suspender contribuições da patrocinadora X plano anterior.';
     Exit;
  end;

  frmAguarde.Apaga;
  Result := True;
end;

function ReativaParticipanteNaPatro ( qryAux, qryGrava     : TwwQuery;
                                      piIdPessoa,
                                      piIdPessJurNovo,
                                      piIdPlanoPrevNovo,
                                      piIdSitFuncNova,
                                      piIdSitPartNova,
                                      piIdSitPlanoNova,
                                      piIdEventosPrev,
                                      piIdEventoGerador    : longint;
                                      sFlgIntEvento,
                                      psNovaDataAdmissao,
                                      psNovaDataInscricao  : string;
                                      var sMsgErro         : string;
                                      psSalarioAtivo       : string = '0'; 
                                      psMatricula          : string = '' ;
                                      psDataVolta          : string = ''  ) : boolean; 
var sMatriculaAntes : string; 
    sNomePatro      : string; 
    iProximo        : integer;
begin
  Result := False;

  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.SQL.Add(' SELECT MAX(SEQHISTFUNC) AS PROXIMO '+
                   ' FROM   HISTFUNCPREV                '+
                   ' WHERE  IDPESSOA   = '+IntToStr(piIdPessoa));
  qryGrava.Open;
  if (not qryGrava.IsEmpty) and (qryGrava.FieldByName('PROXIMO').AsInteger > 0)
  then iProximo := qryGrava.FieldByName('PROXIMO').AsInteger+1
  else iProximo := 1;

  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.SQL.Add(' SELECT P.NOME AS PATROCINADORA, EL.MATRICULA     '+
                   ' FROM   PESSOA P, ELEGPATRO EL                    '+
                   ' WHERE  EL.IDPESSJUR  = '+IntToStr(piIdPessJurNovo)+
                   ' AND    EL.IDPESSOA   = '+IntToStr(piIdPessoa)     +
                   ' AND    P.IDPESSOA    = EL.IDPESSJUR              ');
  qryGrava.Open;

  sMatriculaAntes := qryGrava.FieldByName('MATRICULA').AsString;
  sNomePatro      := qryGrava.FieldByName('PATROCINADORA').AsString;

  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.SQL.Add(' INSERT INTO HISTFUNCPREV (DATAFINAL,        DATAINICIO,    EMPRESA,          '+
                   '                           FLGCONCOMITANTE,  FLGCONTATS,    FLGTEMPOMANUT,    '+
                   '                           IDPESSJUR,     IDPESSOA,         '+ 
                   '                           MATRICULA,        SEQHISTFUNC                    ) '+
                   ' VALUES (                                                                     '+
                   ' NULL,                                                                        '+
                   ' TO_DATE('''+psDataVolta+''',''DD/MM/YYYY'') ,                         '+
                   ''''+sNomePatro+''',                                                           '+
                   '1, 1, 0,                                                                      '+
                   ' '+IntToStr(piIdPessJurNovo)+','+IntToStr(piIdPessoa)+','                    +
                   ''''+sMatriculaAntes+''',                                                      '+
                   IntToStr(iProximo)                                                              +
                   ' )                                                                            ');

  try
     qryGrava.ExecSQL
  except
     sMsgErro := 'Erro ao gravar histórico funcional. ';
     Exit;
  end;

  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.SQL.Add(' UPDATE DEPENTIT SET MATRICULA = '''+psMatricula+''''+
                   ' WHERE IDTITULAR  = '+IntToStr(piIdPessoa)           +
                   ' AND   MATRICULA  = '''+sMatriculaAntes+'''         ');
  try
     qryGrava.ExecSQL
  except
     sMsgErro := 'Erro ao atualizar matricula na tabela de dependentes.';
     Exit;
  end;
  
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.SQL.Add(' UPDATE ELEGPATRO                                      '+
                   ' SET    IDSITFUNC       = '+IntToStr(piIdSitFuncNova)+',  '+
                   '        MATRICULA       = '''+psMatricula+''',            '+
                   '        DATAADMISSAO    = TO_DATE('''+Trim(psNovaDataAdmissao)+''',''DD/MM/YYYY''),'+
                   '        DATADEMISSAO    = NULL, '+
                   '        IDPESSJURCEDIDO = NULL  '+ 
                   ' WHERE  IDPESSJUR  = '+IntToStr(piIdPessJurNovo)+
                   ' AND    IDPESSOA   = '+IntToStr(piIdPessoa) );

  try
     qryGrava.ExecSQL
  except
     sMsgErro := 'Erro ao atualizar dados do participante na patrocinadora. ';
     Exit;
  end;



  // Altera na PartPrevPlan
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.SQL.Add( ' UPDATE PARTPREVPLAN '+
                    ' SET    IDSITPART        = '+IntToStr(piIdSitPartNova) +','+
                    '        IDSITPLANOPREV   = '+IntToStr(piIdSitPlanoNova) +','+
                    '        SALPARTICIPACAO  = '+OraNumero(psSalarioAtivo)  +','+ 
                    '        DATACANCELAMENTO = NULL '+
                    ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJurNovo)+
                    ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrevNovo)+
                    ' AND    IDPESSOA    = '+IntToStr(piIdPessoa)+
                    ' AND    SEQPROPOSTA = 1 ' );

  //SIG101481 - Taffarel - início
  //Início - William Santana - SOL 264614 - PPM 1157652
  if (piIdEventoGerador = 354) then
    qryGrava.SQL.Text := StringReplace(qryGrava.SQL.Text,',        DATACANCELAMENTO = NULL',
                                                         ' ',[rfReplaceAll, rfIgnoreCase]);
  //Término - William Santana - SOL 264614 - PPM 1157652
 //SIG101481 - Taffarel - fim                  

  try
     qryGrava.ExecSQL
  except
     sMsgErro := 'Erro ao atualizar dados do participante no plano. ';
     Exit;
  end;

  Result := True;
end; //ReativaParticipanteNaPatro

function VoltaContribuicoesAnteriores( qryAux, qryGrava : TwwQuery;
                                       piIdPessoa,
                                       piIdPessJurAntigo, piIdPessJurNovo,
                                       piIdPlanoPrevAntigo, piIdPlanoPrevNovo,
                                       piIdSitPartAntigo,
                                       piIdSitPartNova,
                                       piIdEventoGeradorNovo,
                                       piIdEventosPrevNovo       : longint;
                                       psFlgIntEvento,
                                       psMatriculaAntiga,
                                       psMatriculaNova,
                                       psDataVolta,
                                       psDataEvento,
                                       psPartReinsc,
                                       psUltMesPreparo,
                                       psSalParticipacaoNovo,
                                       psDtInicioInsc            : string;
                                       var sMsgErro              : string;
                                       psDataFinal : String = ''  ) : boolean; //BRUNO AZEVEDO SOL 130119 KINTANA 789646
var iIdEventosPrevAnterior : longint;
    bBuscaContribEvento    : boolean;
begin
   Result := False;

   frmAguarde.Mostra('Suspendendo contribuições ...');
   // Suspende as cobrança das contribuições da patrocinadora antiga do participante
   if not SuspendeContribuicoes( IntToStr(piIdPessJurAntigo),
                                 IntToStr(piIdPlanoPrevAntigo),
                                 IntToStr(piIdPessoa),
                                 '1',
                                 IntToStr(piIdEventoGeradorNovo),
                                 psDataVolta,
                                 '',
                                 psMatriculaAntiga,
                                 IntToStr(piIdSitPartAntigo),
                                 qryAux,
                                 qryGrava,
                                 psFlgIntEvento, '' , psDataFinal)   //BRUNO AZEVEDO SOL 130119 KINTANA 789646
   then begin
      frmAguarde.Apaga;
      sMsgErro := 'Erro ao suspender contribuições da patrocinadora X plano anterior.';
      Exit;
   end;

   frmAguarde.Mostra('Reassociando contribuições novas ...');
   Application.ProcessMessages;
   // Buscar contribuição SEMPRE da tabela de associação de CONTRIBUICOES POR EVENTO GERADOR, pois
   // o participante, ao voltar para a fundaçao, pode querer ou ter que pagar contribuições diferentes
   // das que pagava quando saiu.
   strContribuicaoAAssociar := '';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT IDCONTRIBUICAO, IDREGRAVALIDAASS FROM CONTPREVEVENTO ' +
                  ' WHERE  IDPLANOPREV     = ' + IntToStr(piIdPlanoPrevNovo)+
                  ' AND    IDEVENTOGERADOR = ' + IntToStr(piIdEventoGeradorNovo) );
   qryAux.Open;

   if not qryAux.IsEmpty
   then begin
      strContribuicaoAAssociar := '';
      qryAux.First;
      while not qryAux.EOF do
      begin
        if ExecutaRegraAssociaContribuicao (piIdPessJurNovo,
                                            piIdPlanoPrevNovo,
                                            piIdPessoa,
                                            1,
                                            qryAux.FieldByName('IdContribuicao').AsInteger,
                                            qryAux.FieldByName('IdRegraValidaAss').AsInteger,
                                            psDataEvento,
                                            psPartReinsc,
                                            '0',
                                            psUltMesPreparo,
                                            psSalParticipacaoNovo,
                                            psDtInicioInsc,IntToStr(piIdEventoGeradorNovo)) 
        then strContribuicaoAAssociar := strContribuicaoAAssociar + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ',';
        qryAux.Next;
      end;
   end;


   strContribuicaoAAssociar := Copy(strContribuicaoAAssociar, 1,Length(strContribuicaoAAssociar)-1);

   if Trim(strContribuicaoAAssociar) = ''
   then begin
      frmAguarde.Apaga;
      sMsgErro := '';
      Result   := True;
      Exit;
   end;

   if not AssociaNovasContribuicoes(IntToStr(piIdPessJurNovo),
                                    IntToStr(piIdPlanoPrevNovo),
                                    IntToStr(piIdPessoa),
                                    '1',
                                    IntToStr(piIdEventoGeradorNovo),
                                    psDataEvento,
                                    '',
                                    psMatriculaNova,
                                    IntToStr(piIdSitPartNova),
                                    psSalParticipacaoNovo,
                                    False,
                                    True,
                                    False, 
                                    qryAux,
                                    qryGrava,
                                    psFlgIntEvento,
                                    -1, 
                                    psUltMesPreparo )

   then begin
      frmAguarde.Apaga;
      sMsgErro := 'Erro ao reassociar contribuições. ';
      Exit;
   end;

   frmAguarde.Apaga;
   Result := True;
end;



function AssociaRubricasIndividuais(pIdPessJur,       pIdPlanoPrev,     pIdPessoa,
                                   pSeqProposta,     pIdEventoGerador, pDtEventoIni   : string;
                                   qryAux,           qryGrava                         : TwwQuery;
                                   var sMensErro : String ): boolean;
var qryloop : twwquery;
    sSql : String;
    bValid , bErro : Boolean;
begin

   result := false;

   try
      qryloop := twwquery.create(application);
      qryloop.databasename := qryaux.databasename;


      qryloop.close;
      qryloop.sql.clear;
      qryloop.sql.text := ' SELECT IDPLANOPREV, IDRUBRICA, IDEVENTOGERADOR, '+
                          ' IDREGRACALCULO, IDREGRAVALIDAASS, DESCRICAO '+
                          ' FROM RUBRICAINDIVEVENTO , PROVDESC '+
                          ' WHERE  IDPLANOPREV = '+pIdPlanoPrev+' '+
                          ' AND    IDEVENTOGERADOR = '+pIdEventoGerador+' '+
                          ' AND    IDPROVENTO = IDRUBRICA ';

      qryloop.open;



      while not qryloop.eof do
      begin

         if trim(qryloop.fieldbyname('IDREGRACALCULO').AsString) = '' then
         begin
            sMensErro := 'Rubrica: '+qryloop.fieldbyname('DESCRICAO').AsString+' - Regra de Cálculo não associada.';
            Exit;
         end;

         bValid := True;
         bErro := False;
         if trim(qryloop.fieldbyname('IDREGRAVALIDAASS').AsString) <> '' then
         begin
            sSql := ' SELECT VALORBASE1  VALORBASE2, VALORBASE3,  '+
                    ' VALORBASE4, VALORBASE5, VALORBASE6  FROM ELEGPATRO '+
                    ' WHERE IDPESSJUR = '+pIdPessJur+' AND IDPESSOA = '+pIdPessoa+' ';

            bValid := RegraBooleana(qryloop.fieldbyname('IDREGRAVALIDAASS').AsString, sSQL, bErro );

            if bErro then
            begin
               sMensErro := 'Rubrica: '+qryloop.fieldbyname('DESCRICAO').AsString+' - Erro na execução da regra de validação.';
               Exit;
            end;

            if not bValid then
            begin
               qryloop.next;
               continue;
            end;
         end;


         qrygrava.close;
         qrygrava.SQL.clear;
         qrygrava.sql.text := ' insert into RUBRICAINDIV '+
                              '(FLGUSAABONO, IDALIMENTADO, IDTITULAR, DATAINICIO, FLGBASEPA,IDPESSOA,'+
                              ' IDEMPRESA, IDRUBRICA, NUMOCORRENCIAS, SEQRUBRICAINDIV, IDFAVORECIDO,'+
                              ' IDREGRACALCULO, VALORRUBRICA, ANOMESINICIO, FLGPERMANENTE, PARCELAS,'+
                              ' FLGPERCENT, FLGTPRUBMANUT, FLGPENSAOALIM, RUBRICAPROVENTOPA,DATAFINAL,'+
                              ' ANOMESREF, CODPORTFORMA, ULTMESPREPARO)'+
                              ' SELECT  NULL, NULL, '+pIdPessoa+', TO_DATE('''+pDtEventoIni+''',''DD/MM/YYYY'') , NULL, '+pIdPessoa+','+
                              ' '+inttostr(iIdFundacao)+', '+qryloop.fieldbyname('IDRUBRICA').AsString+', 0, 1, '+pIdPessJur+' ,'+
                              ' '+qryloop.fieldbyname('IDREGRACALCULO').AsString+', 0, '''+Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2)+''', 1, 0,'+
                              ' NULL, NULL, NULL, NULL, NULL,'+
                              ' '''+Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2)+''', NULL, '''+Copy(pDtEventoIni,7,4)+'/'+Copy(pDtEventoIni,4,2)+''' '+
                              //anteriormente e a rubrica já está na rubricaindiv
                              ' FROM DUAL '+
                              ' WHERE NOT EXISTS (SELECT 1 FROM '+
                              ' RUBRICAINDIV WHERE IDTITULAR  = '+pIdPessoa+' AND '+
                              ' IDRUBRICA = '+qryloop.fieldbyname('IDRUBRICA').AsString+' ) ';
                              
         try
            qrygrava.execsql;
         except
         //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
          on e:Exception do
          begin
            TratarErro(e.Message);
            sMensErro := 'Rubrica: '+qryloop.fieldbyname('DESCRICAO').AsString+' - Erro na inserção.';
            Exit;
         end;
          //Brunno Mattos - KTN 767861 - SOL 132659 Fim
            
         end;


         qryloop.next;
      end;

   finally  qryloop.free; end;

   result := true;

end;

// Gerar cartas do evento
function CartaEvento(psIdPessoa, psIdPessjur, psIdPlanoPrev, psIdEventoGerador,
                     psSeqProposta : String) : Boolean;
Var
 qryAux      : TwwQuery;
sSql,
 sNomeArq    : String;
 fTemplate   : TStrings;
begin
 sNomeArq := Sistema.TempDir + 'evento.tcm';
 fTemplate := TStringList.Create;
 fTemplate.Clear;
 Result := True;

 // Cria componentes necessários para rotina
 qryAux                     := twwquery.create(application);
 qryAux.databasename        := 'BaseDados';

 // Escreve a query para alimentar a carta a ser gerada
 sSql := 'SELECT PE.NOME, PE.NUMDOCUMENTO AS CPF, EL.MATRICULA, PT.NOME AS PATRO, '+#13+#10+
         '       PV.NOME AS PLANO, '+#13+#10+
         '       EP.LOGRADOURO AS ENDERECO, EP.NUMERO, EP.COMPLEMENTO, '+#13+#10+
         '       EP.BAIRRO, CD.NOME AS CIDADE, CD.UF, '+#13+#10+
         '       PF.DATANASC, EG.NOME AS DESCRICAOEVENTO, '+#13+#10+
         '       EV.DATAEVENTO AS DATAEVENTO, '+#13+#10+
         '       SFA.DESCRICAO AS SITUACAOANTPATRO, '+#13+#10+
         '       SLA.DESCRICAO AS SITUACAOANTPLANO, '+#13+#10+
         '       SPA.DESCRICAO AS SITUACAOANTFUNDACAO, '+#13+#10+
         '       SFN.DESCRICAO AS SITUACAONOVAPATRO, '+#13+#10+
         '       SLN.DESCRICAO AS SITUACAONOVAPLANO, '+#13+#10+
         '       SPN.DESCRICAO AS SITUACAONOVAFUNDACAO, '+#13+#10+
         '       EG.TEMPLATE '+#13+#10+
         'FROM PESSOA PE, PESSOA PT, PESSOAFISICA PF, ELEGPATRO EL, '+#13+#10+
         '     PARTPREVPLAN PP, PLANPREV PV, ENDPESS EP, CIDADES CD,'+#13+#10+
         '     EVENTOSPREV EV, EVENTOGERADOR EG,'+#13+#10+
         '     SITFUNC SFA, SITPLANOPREV SLA, SITPART SPA,'+#13+#10+
         '     SITFUNC SFN, SITPLANOPREV SLN, SITPART SPN'+#13+#10+
         'WHERE (EV.IDPESSOA        = '+psIdPessoa+')'+#13+#10+
         '  AND (EV.IDPESSJUR       = '+psIdPessjur+')'+#13+#10+
         '  AND (EV.IDPLANOPREV     = '+psIdPlanoPrev+')'+#13+#10+
         '  AND (EV.IDEVENTOGERADOR = '+psIdEventoGerador+')'+#13+#10+
         '  AND (EV.IDEVENTOSPREV = (SELECT MAX(EV1.IDEVENTOSPREV) '+#13+#10+
         '                           FROM EVENTOSPREV EV1'+#13+#10+
         '                           WHERE EV1.IDPESSOA        = EV.IDPESSOA'+#13+#10+
         '                            AND  EV1.IDPESSJUR       = EV.IDPESSJUR'+#13+#10+
         '                            AND  EV1.IDEVENTOGERADOR = EV.IDEVENTOGERADOR'+#13+#10+
         '                            AND  EV1.IDPLANOPREV     = EV.IDPLANOPREV))'+#13+#10+
         '  AND (EV.IDEVENTOGERADOR = EG.IDEVENTOGERADOR)'+#13+#10+
         '  AND (EL.IDPESSOA        = EV.IDPESSOA) '+#13+#10+
         '  AND (EL.IDPESSJUR       = EV.IDPESSJUR) '+#13+#10+
         '  AND (PE.IDPESSOA        = EL.IDPESSOA) '+#13+#10+
         '  AND (PT.IDPESSOA        = EL.IDPESSJUR) '+#13+#10+
         '  AND (PE.IDPESSOA        = PF.IDPESSOA) '+#13+#10+
         '  AND (PP.IDPESSOA        = EL.IDPESSOA) '+#13+#10+
         '  AND (PP.IDPESSJUR       = EL.IDPESSJUR) '+#13+#10+
         '  AND (PP.IDPLANOPREV     = EV.IDPLANOPREV) '+#13+#10+
         '  AND (PP.SEQPROPOSTA     = '+psSeqProposta+')'+#13+#10+
         '  AND (PP.IDPLANOPREV     = PV.IDPLANOPREV) '+#13+#10+
         '  AND (PE.IDENDCORRESP    = EP.IDENDERECO) '+#13+#10+
         '  AND (PE.IDPESSOA        = EP.IDPESSOA) '+#13+#10+
         '  AND (EP.IDCIDADES       = CD.IDCIDADES) '+#13+#10+
         '  AND (EV.IDSITFUNCATUAL  = SFA.IDSITFUNC)'+#13+#10+
         '  AND (EV.IDSITPLANOATUAL = SLA.IDSITPLANOPREV)'+#13+#10+
         '  AND (EV.IDSITPARTATUAL  = SPA.IDSITPART)'+#13+#10+
         '  AND (EV.IDSITFUNCNOVO   = SFN.IDSITFUNC)'+#13+#10+
         '  AND (EV.IDSITPLANONOVO  = SLN.IDSITPLANOPREV)'+#13+#10+
         '  AND (EV.IDSITPARTNOVO   = SPN.IDSITPART)';

 Try
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSql);

   qryAux.Open;

   If Not qryAux.FieldByName('TEMPLATE').IsNull
    Then Begin
       fTemplate.SaveToFile(sNomeArq);
       fTemplate.Add(qryAux.FieldByName('TEMPLATE').AsString);
       fTemplate.SaveToFile(sNomeArq);
    End;

   If Not qryAux.FieldByName('TEMPLATE').IsNull
    Then If MessageDlg('Este evento possui carta cadastrada.'+#13+#10+
                       'Deseja imprimir a carta ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes
          Then Begin
               With dtmRelatEspecificos do
                Begin
                  qryModCarta.Close;
                  qryModCarta.SQL.Clear;
                  qryModCarta.SQL.Add(sSql);

                  DsgnCM.Report.Template.FileName := sNomeArq;
                  DsgnCM.Report.Template.LoadFromFile;

                  DsgnCM.Report.Template.SaveTo   := stFile;
                  DsgnCM.Report.Template.Format   := ftASCII;
                  DsgnCM.Report.Device            := dvScreen;

                  TFrmPreview.CreateModalPreview(Application, DsgnCM.Report, 'Carta do Evento - '+qryAux.FieldByName('DESCRICAOEVENTO').AsString);
                End;
          End;
 Except
   ShowMessage('Erro na geração de Carta do Evento '+qryAux.FieldByName('DESCRICAOEVENTO').AsString+'!!');
   Result := False;
 End;

 // Libera os componentes criados pela rotina
 qryAux.Free;
 fTemplate.Free;

 If FileExists(sNomeArq) Then  DeleteFile(sNomeArq);
end;



Function EfetuaPareclamentoContribuicao(piIdPessJur, piIdPlanoPrev, piIdTitular,
                                        piIdPessoa, piSeqProposta : Integer ) : Boolean;
Var
  sSQL : String;
Begin
  Result := True;

  If MsgDlg('Deseja parcelar os acertos resultantes do evento ? ',
            'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
  Then Begin
     Result := True;
     Exit;
  End;


  bCompraCarencia  := False;
  bParcelaCarencia := False;
  bVeioDeEvento    := True;

  FrmParcelamento := TFrmParcelamento.Create(Application);

  bVeioDeEvento   := True;
  FrmParcelamento.FormStyle := FsNormal;
  FrmParcelamento.Visible   := False;

  FrmParcelamento.PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta);

  FrmParcelamento.ShowModal;

  FrmParcelamento.FormStyle := FsMdiChild;
  FrmParcelamento.Free;

End;



end.

