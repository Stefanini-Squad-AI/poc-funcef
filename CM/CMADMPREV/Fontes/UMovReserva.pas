unit UMovReserva;
{*******************************************************************************
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina     : RodaPadraoMovReserva
Nº WO......: 39107
Inicio dev : 25/05/2026
Responsável: Edilaine
Descrição..: Incluir reservas de recomposição no cálculo
------------------------------------------------------------------------------
Rotina     :  RodaPadraoMovReserva
Nº WO......: 25429
Inicio dev : 10/09/2025
Responsável: Edilaine
Descrição..: Marcar reservas de resgates anteriores
------------------------------------------------------------------------------
Rotina      : GeraHistMovReservaContribuicao
Solicitação : WO6161
Data        : 20/12/2023   (merge 05/06/2025)
Responsável : Paulo Nobre
Descrição   : Atualização do campo NUMRECEBIMENTO
------------------------------------------------------------------------------
Rotina     : RodaPadraoMovReserva
Nº WO......: 20723
Inicio dev : 25/04/2025
Responsável: Edilaine
Descrição..: Resgate de Beneficiários não apresenta Tipo de Resgate para cálculo do IR
------------------------------------------------------------------------------
Rotina.....: RodaPadraoMovReserva
Nº SIG.....: WO10872
Data       : 25/08/2023
Responsável: Edilaine
Descrição..: Calculo total de cotas resgatadas Plano REB Regressivo com retençao
--------------------------------------------------------------------------------
Rotina      : MoveReserva, RodaPadraoMovReserva, DesmarcaReservas
SIG         : 130377
Responsável : Edilaine
Data        : 10/11/2022
Descrição   : Na concessão de resgate ocorre erro de campo VLRABATIDO faltando
--------------------------------------------------------------------------------
Rotina      : MoveReserva
SIG         : 129320
Responsável : Luis Ferrari
Data        : 11/10/2022
Descrição   : Ajustado valores que estava null com a função NVL
--------------------------------------------------------------------------------
Alteração  : RodaPadraoMovReserva
Nº SIG.....: 20491
Data Merge : 24/06/2022
Data dev   : 27/02/2018
Responsável: Edilaine
Descrição..: Desenvolver na funcionalidade de Cálculo do IR Regressivo as regras
             de retenção de percentual das contribuições
--------------------------------------------------------------------------------
Pendência   : 84982
Responsável : Everson Cunha
Data        : 08/12/2021
Descrição   : Ajuste no insert da CM.HISTMOVRESERVA
--------------------------------------------------------------------------------
Rotina      : RodaPadraoMovReserva
Pendência   : 115771
Responsável : Edilaine
Data        : 11/05/2021
Descrição   : saida de reserva com saldo negativo
--------------------------------------------------------------------------------
Pendência   : SIG 84530
Responsável : Taffarel Sevaybriker / Darivaldo Alencar
Data        : 11/06/2019
Descrição   : excesso de update na tabela ReservaPart
--------------------------------------------------------------------------------
Pendência   : SIG 24360
Responsável : Edilaine
Data        : 18/06/2018
Descrição   : Atualização de saldo das reserva
--------------------------------------------------------------------------------
Nº SIG.....: SIG TIBERO
Data.......: 06/03/2018
Responsável: Everson Luiz Pereira da Cunha
Descrição..: Melhoria no Planus para adequação ao TIBERO.
             Inclusão de alias nas tabelas e campos.
             Retirar INDEX, +rule etc
--------------------------------------------------------------------------------
Pendência   : SIG 32846
Responsável : Peterson Victor
Data        : 27/01/2017
Descrição   : Correção do valor quando for resgate judicial
--------------------------------------------------------------------------------
Alteração  : RODAPADRAOMOVRESERVA
Nº SIG.....: 55933
Data.......: 02/10/2017
Responsável: Edilaine Ferraresi
Descrição..: Inclusão do perfil de investimento
--------------------------------------------------------------------------------
Pendência   : SIG 25771
Responsável : William Santana
Data        : 30/09/2016
Descrição   : as saídas das reservas em cotas não devem apresentar valores com apenas duas
              casas decimais.
--------------------------------------------------------------------------------
Pendência   : SOL 253577/17989  PPM 1198155
Responsável : Darivaldo Alencar
Data        : 08/04/2016
Descrição   : Correção de insert na tabela HISTMOVRESERVA inserindo valor zero
--------------------------------------------------------------------------------
Pendência   : SOL 257562 PPM 962596
Responsável : Fernando Xavier
Data        : 03/07/2015
Descrição   : O conceder o beneficio apresentou especificado no caso de teste nao
              permitindo prosseguir com a concessão.
--------------------------------------------------------------------------------
Pendência   : SOL 192897 KTN 1835724	
Responsável : Felipe Azevedo dos Santos	
Data        : 17/01/2013
Descrição   : Alteração na rotina GeraHistMovReservaContribuicao
--------------------------------------------------------------------------------
Pendência   : SOL 190227 Kintana 1799098
Responsável : Otacilio Aquino
Descrição   : Ajuste no valor dos campos IdPessoaOrigem e IdPessoaDestino.
--------------------------------------------------------------------------------
Pendência   : SOL 181743 Kintana 1706063
Responsável : Fernando Xavier
Descrição   : Correção na data do índice da reserva.
--------------------------------------------------------------------------------
Autor(a)  : Thiago Melo
Pendencia : SOL 180497 Kintana 1680040
Data      : 22/06/2012
Alteração : Acerto do histórico de alimentação de reservas
--------------------------------------------------------------------------------
Autor(a)  : Fernando Xavier
Pendencia : SOL 178720 Kintana 1649027
Data      : 02/05/2012
Alteração : inclusão dos campos: ALDOREALCONT, INDICECORRECAO,NUMRECEBIMENTO,
            DATARECEBIMENTO,DTALTERACAO,USERALTERACAO, DPESSOAORIGEM,IDPESSOADESTINO
----------------------------------------------------------------------------
Pendência   : SOL 132490 KINTANA
Responsável : BRUNO AZEVEDO
Data        : 23/04/2012
Descrição   : Criação da Funcionalidade "Transferência de Saldo de Cota".
--------------------------------------------------------------------------------
Autor(a)  : Monica Gonzaga
Pendencia : SOL 173480 Kintana 	1576207
Data      : 24/03/2012
Alteração : Correção no campo datalimentacao na histmovreserva.
----------------------------------------------------------------------------
Autor(a)  : Fernando Xavier
Pendencia : SOL 170679 Kintana 1534729
Data      : 06/01/2012
Alteração : Ao atualizar a reserva é gerado um valor muito alto e divergente
            Retirado a implementação do SOL 167888 Kintana 1489782
----------------------------------------------------------------------------
Autor(a)  : Otacilio aquino
Pendencia : SOL 167888 Kintana 1489782
Data      : 23/11/2011
Alteração : Ao efetivar a concessão o sistema inseri valor negativo
//--------------------------------------------------------------------------
Autor(a)  : Fernando Xavier
Pendencia : SOL 168363 Kintana 1484125
Data      : 10/10/2011
Alteração : Ao efetivar a concessão de resgate o sistema gera um erro
            "Falta Expressão" Matrícula de teste TST: 0125262
----------------------------------------------------------------------------
Autor(a)  : Fernando Xavier
Pendencia : SOL 166107 Kintana 1445200
Data      : 10/10/2011
Alteração : inserir os campos DATARECEBIMENTO E NUMRECEBIMENTO na
            tabela HISTMOVRESERVA.
----------------------------------------------------------------------------
Autor(a)  : Fernando Xavier
Pendencia : SOL 142663 Kintana 915068
Data      : 20/12/2010
Alteração : INSERIR CAMPO DATAALIMENTAÇÃO NA TELA DE ALIMENTAÇÃO DE RESERVA
            MANUAL DO PARTICIPANTE
----------------------------------------------------------------------------
//Pendência   : SOL 145995 Kintana 1023814
//Responsável : BRUNO AZEVEDO
//Data        : 18/11/2010
//Descrição   : Correção ao inserir campo datalimentacao na histmovreserva.
//--------------------------------------------------------------------------
//Pendência   : SOL 146119/2881 KINTANA 1015811
//Responsável : BRUNO AZEVEDO
//Data        : 18/11/2010
//Descrição   : Correção na movimentação de reservas.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 134801/2441 KINTANA 927927
//Responsável : FERNANDO XAVIER
//Data        : 22/09/2010
//Descrição   : Erro na contabilização da movimentação de reservas.
//--------------------------------------------------------------------------
//Pendência   : SOL 128400 KINTANA 898619
//Responsável : BRUNO AZEVEDO
//Data        : 23/08/2010
//Descrição   : Atualizar as reservas sempre que o histórico for alimentado.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 18/01/2010
// Rotina      : MoveReserva
// Pendência   : SOL 124089 Kintana 693423
// Descricao   : Identificamos que a data da alimentação das reservas, quando da concessão
// do resgate, é diferente da data de pagamento
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 18/11/2008
// Rotina      : RodaPadraoMovReserva / AlimentaHistorico
// Pendência   : 101075_448004
// Descricao   : Gravar DATAFINAL na DATAALIMENTACAO da tabela HISTMOVRESERVA
//--------------------------------------------------------------------------------------------------
Rotina..........: AcertaHistMovReserva
N. Sol..........: 93841
N. Kintana......: 403367
Data............: 21/08/2008
Responsável.....: Denise Arruda
Descrição.......: Para os campos IdRegraCalculo, IdEventoGerador, IdBeneficio, IdParticipante e PnlCodigo
                  caso esteja em branco, gravar null
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 26/10/2007
Rotina      : VoltaValorCotacao
Pendência   : 24359
Descricao   : Buscar ultima cotação antes da data de referencia
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Rotina      : Varias
Data        : 16/08/2007
Pendência   : 19962
Alteração   : Troca do DateToStr para FormatDateTime.
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 03/08/2007
Rotina      : RodaPadraoMovReserva
Pendência   : 26029
Descricao   : Filtrar reservas que serão procesadas pelo IDPLANOPREV do associado
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 28/06/2007
Rotina      : VerificaContaContabil
Pendencia   : 20949
Alteração   : Ajuste na rotina de verificação do plano contabil
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 20/07/2007
Rotina      : Varias
Pendência   : 24224
Descricao   : Passar IDCALCULO para as funções de beneficio
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 05/06/2007 a 07/06/2007
Rotina      : VerificaContaContabil(...) e VerificaCentroCusto(...) e RodaPadraoMovReserva
Pendencia   : 20949
Alteração   : Mensagens mais claras, indicando a conta contábil e o centro de custo
              Nova query para buscar a reserva, para também indicar na mensagem
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 11/01/2007
Rotina      : AcertaHistMovReserva
Pendencia   : 22679
Alteração   : Reorganização do código
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 10/01/2007
Rotina      : novas VerificaContaContabil(...) e VerificaCentroCusto(...), chamadas na
              RodaPadraoMovReserva
Pendencia   : 20949
Alteração   : Verificação das contas contábeis antes da contabilização
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 23/10/2006
Rotina      : MoveReserva e RodaPadraoMovReserva
Pendencia   : 23563
Alteração   : Gravação do campo IDPARTICIPANTE na ReservaPart
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 09/10/2006
Rotina      : RodaPadraoMovReserva
Pendencia   : 22892
Alteração   : Criação de um parâmetro default para passar data de contabilização específica
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 11/07/2006
Rotina      : RodaPadraoMovReserva
Pendencia   : 22868
Alteração   : 1) Passar nova coluna VALORRESERVAPART com a coluna VALORRESERVA da RESERVAPART
              2) Caso tenha ocorrido erro na contabilização exibir uma mensagem
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 10/03/2006
Rotina      : CalcPadraoMovReserva
Pendencia   : 19946
Alteração   : Criação da rotina que funcionará nos mesmos moldes da RodaPadraoMovReserva
              Seu objetivo é auxiliar a simulação de desligamento.
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 30/01/2006
Rotina      : AlimentaHistorico
Pendencia   : 21427
Alteração   : Retirar plics do insert na  HSTMOVRESERVA
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 24/01/2006
Rotina      : RodaPadraoMovReserva
Pendencia   : 21313 / 21360
Alteração   : Passar INDICEREAJUSTE da RESERVAXPLANO e DATADEMISSAO da ELEGPATRO para regra de calculo
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 23/12/2005
Rotina      : RodaPadraoMovReserva
Pendencia   : 21078
Alteração   : Correção de campo na query (antes: DATAEVENTO agora: DTEVENTO)
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 06/09/2005
Rotina      : AbateContribReserva
Pendencia   : 19569
Alteração   : Inserir um registro de estorno/devolução, a partir do próprio registro inserido na
              alimentação de reserva.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 22/06/2005
Rotina      : DesfazPadraoMovReserva
Pendencia   : 19537
Alteração   : Testar se o campo IdTipoReservaDest para saber se altera a movimentação.
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 04/05/2005
Rotina      : DESFAZPADRAOMOVRESERVA
Pendencia   : 19137
Alteração   : Excluir MOVRESERVATMP no desfazer movimentação
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 26/04/2005
Rotina      : RodaPadraoMovReserva
Pendencia   : 19115
Alteração   : Inclusão do campo IDSITPARTANTERIOR na query de movimentação
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 18/04/2005
Rotina      : RodaPadraoMovReserva
Pendencia   : 19065
Alteração   : Acerto na parametrização dos IDs por pessoa e patro para a regra de abate.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 15/04/2005
Rotina      : DESFAZPADRAOMOVRESERVA
Pendencia   : 18306
Alteração   : Acerto na desfazer movimentação de reserva.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 08/04/2005
Rotina      : RodaPadraoMovReserva
Pendencia   : 18306
Alteração   : Acerto na passagem de parâmetros para a consulta
----------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 24/03/2005
Rotina      : MoveReserva
Alteração   : Acerto no parametro VALINSS
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 29/12/2004
Rotina      : RodaPadraoMovReserva
Pendencia   : 18306
Alteração   : Caso o Parâmetro prmFLGRESNEGATIVA = 0 zera o valor negativo senão considera como
              negativo mesmo.
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 07.12.2004
Rotina      : RodaPadraoMovReserva
Pendencia   : ----
Alteração   : Atualizar flgmoveureserva da benefbfciario dentro da rotina
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 25.10.2004
Rotina      : DesfazPadraoMovReserva
Pendencia   : 17995
Alteração   : Acerto no desfazer padrao de movimentacao
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 22.10.2004
Rotina      : AtualizaReservaIndexada
Pendencia   : 17859
Alteração   : Rotina para, dado um periodo, atualizar uma reserva
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 21.10.2004
Rotina      : RodaPadraoMovReserva
Pendencia   : 17978
Alteração   : Passar idpessoa da partprevplan para poder usar nas regras pois nas reservas coletivas o
              idpessoa é o id da fundacao
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 20.10.2004
Rotina      : RodaPadraoMovReserva
Pendencia   : 17921
Alteração   : Acerto na query, para tratar reserva coletiva
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 07.10.2004
Rotina      : RodaPadraoMovReserva
Pendencia   : 17887
Alteração   : Passar os campos IDSITPARTATUAL, INSCRICAODATA e IDTITULAR para query da regra
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 01.10.2004
Rotina      : ----
Pendencia   : 17830
Alteração   : Quando o valor da reserva é negativo o 2o. lancamento não está tendo a inversão de
              débito e crédito
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 15.09.2004
Rotina      : ----
Pendencia   : 17685
Alteração   : Opção de não pedir a data de alimentacao e usar como esta a data de recebimento de
              contribuicoes
----------------------------------------------------------------------------------------------------
Rotina      : RODAPADRAOMOVRESREVA
Autor(a)    : Camille
Data        : 04.08.2004
Pendência   : 17220
Alteração   : Acerto na query de entrada para regra que não estava funcionando para beneficiarios
----------------------------------------------------------------------------------------------------
Rotina      : RodaPadraoMovReserva
Autor(a)    : Augusto
Data        : 03/08/2004
Descricao   : Acertos para os caso da reserva ser tranferida entre planos
----------------------------------------------------------------------------------------------------
Rotina      : Várias
Autor(a)    : Camille
Data        : 29.07.2004
Pendência   : 15136
Alteração   : Criar parametros para contabilizacao do movimento de reserva
              PLACONTACDEST E PLACONTADDEST
----------------------------------------------------------------------------------------------------
Rotina      : AbateContribReserva
Autor(a)    : Camille
Pendência   : ----
Data        : 22.07.2004
Descricao   : Tratamento para reservas sem indice
----------------------------------------------------------------------------------------------------
Rotina      : Diversas
Autor(a)    : Camille
Pendência   : 17220
Data        : 19.07.2004
Descricao   : Acerto no desfazer padrao de movimentacao de reservas para beneficiario
----------------------------------------------------------------------------------------------------
Rotina      : ----
Autor(a)    : Camille
Data        : 24.06.2004
Pendência   : ----
Alteração   : Gravação do DATAINDICE
----------------------------------------------------------------------------------------------------
Rotina      : OraNumero
Autor(a)    : Camille
Data        : 02.02.2004
Pendência   : ----
Alteração   : Retirada da rotina OraNumero que estava declarada como GLOBAL
              mas já existe na UAdmPrev
----------------------------------------------------------------------------------------------------
Rotina      : RodaPadraoMovReserva
Autor(a)    : Camille
Data        : 22.09.2003
Pendência   : 14814
Alteração   : Executar movimentação inversa ao da RodaPadraoMovReserva
----------------------------------------------------------------------------------------------------
Rotina      : RodaPadraoMovReserva
Autor(a)    : Gleyber
Data        : 18/09/2003
Pendência   : 14972
Descrição   : Alteração da query de movimentação para aceitar movimentações que não possuem destino
              cadastrado.
----------------------------------------------------------------------------------------------------
Rotina      : VoltaValorCotacao
Autor(a)    : Leo
Data        : 03/09/2003
Descrição   : alteração da busca pelo valor do índice
----------------------------------------------------------------------------------------------------
Rotina      : CalculaReservaMatematica
Autor(a)    : Leo
Data        : 01/09/2003
Descrição   : teste para verificar se o SQL foi preenchido
----------------------------------------------------------------------------------------------------
Rotina      : RodaPadraoMovReserva
Autor(a)    : Augusto
Data        : 22/05/2003
Alteração   : inclusão da função que calcula a data da Cotação - ExecutaRegraDataCota
----------------------------------------------------------------------------------------------------
Rotina      : DESFAZPADRAOMOVRESERVA
Autor(a)    : Augusto
Data        : 15/05/2003
Alteração   : Retirada da exclusão de planilhas contabeis.
----------------------------------------------------------------------------------------------------
Rotina      : RodaPadraoMovReserva
Autor(a)    : Gleyber
Data        : 23/04/2003
Alteração   : Utilização de parametrização na funcionalidade VoltaValorCotacao
----------------------------------------------------------------------------------------------------
Rotina      : RodaPadraoMovReserva
Autor(a)    : Augusto
Data        : 14/04/2003
Alteração   : Inclusao do Campo DATADIB nas querys da Regra de valor a movimentar
----------------------------------------------------------------------------------------------------
Rotina      : RodaPadraoMovReserva
Autor(a)    : P.RAMOS
Data        : 24.03.2003
Alteração   : Alteracao na rotina para abater reserva apos fazer movimentos
----------------------------------------------------------------------------------------------------
Rotina      : AbateContribReserva
Autor(a)    : Augusto
Data        : 09/12/2002
Alteração   : Função de arredondamento das cotas
----------------------------------------------------------------------------------------------------
Rotina      : RodaPadraoMovReserva
Autor(a)    : Camille
Data        : 21.11.2002
Alteração   : Acerto na rotina de movimentacao quando for de transferencia de plano
----------------------------------------------------------------------------------------------------
Rotina      : AbateContribReserva
Autor(a)    : Leo
Data        : 26/08/2002
Alteração   : tratei resíduo de arredondamento
---------------------------------------------------------------------------------------------------}

interface

uses
  Db, DBTables, Wwquery, Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, Machklb, Registry, checklst, stdctrls, UdataBase,
  uAutorizacao, uSistema, Math, UBeneficio, UmensErro, uParticipante, dBaseDados,
  URegra, UCtrlLancamento, uCmMath,
  uCtrlRequerBenef,               //edilaine - SIG20491
  wwstorep ;// Darivaldo ALencar SOL 253577/17989  PPM 1198155


function MoveReserva( sIdEvento,
                      sIdPessoa ,
                      sSeqPropostaOrig,
                      sNomeParticipante,
                      sIdBeneficio                              : string;
                      qryMov                                    : TwwQuery ;
                      Regra                                     : TRegra ;
                      var sMsgErro                              : string;
                      sIdPessjurOrig,
                      sIdPlanoOrig,
                      sIdTipoReservaOrig,
                      sIdPessjurDest,
                      sIdPlanoDest,
                      sIdTipoReservaDest   : string;
                      var bIntegraContab                        : boolean ;
                      sValorMov                                 : string ; // Valor a Mover em Cotas
                      DataRefMov                                : TDate ;
                      sSeqPropostadest,
                      sNumProcesso,
                      sTipoPrevidencia,
                      sDtDireito           : string;
                      iTotalBeneficiarios                       : integer;
                      rValorInfInss                             : Double;
                      DataRefIndice                             : TDate;
                      psValorReservaCotas                       : string;
                      psDtAlimentaReserva                       : string = '' // Renato Visoni SOL 124089 Kintana 693423
                      ) : integer;
                    { Result:
                      0 --> Não há cadastro de padrão de movimentaçào
                      1 --> Erro em alguns movimentos
                      2 --> Não deu erro
                      3 --> Todas erradas }

function RodaPadraoMovReserva( piIdPessJur,
                               piIdPlanoPrev,
                               piIdPessoa,
                               piSeqProposta,
                               piIdBeneficio,
                               piIdEventoGerador,
                               piIdPessJurDestino,
                               piIdPlanoPrevDestino : Longint;
                               psFlgIntEvento,
                               psDataCota         : string;
                               var sMsgErro         : string;
                               piNumeroProcesso     : Longint;
                               pcOrigem             : char; // C - Concessao, O - Outros
                               psDataFinalBenef     : string = '';
                               pbRodaInverso        : boolean = False;
                               psDataLancamento     : string = '';                               
                               psDtAlimentaReserva  : string = '';  // 101075
                               piIdPlanPrevContabAnt : LongInt = -1;             //edilaine - SIG55933
                               piIdPlanPrevContabAtu : LongInt = -1;             //edilaine - SIG55933
                               pbAtlzMovReserva      : boolean = True //SIG84530
                               ) : boolean;

function AlimentaHistorico( qryAux                              : TwwQuery;
                            sIdpessjur,       sIdplanoprev,
                            sIdtiporeserva,   sIdpessoa,
                            sSeqProposta,     sVlMovCotas,
                            sVlSaldoResCotas, sIdbeneficio,
                            sIdContribuicao,  sIdEvento,
                            sIdRegra,         sMesReferencia    : string;
                            iFlgEntrada                         : integer;
                            Data                                : Tdate ;
                            bExcedente                          : Boolean ;
                            DataRefIndice                       : TDate ;
                            sIdParticipante                     : string;
                            var piIdHistorico                   : Longint;
                            bAtualizaReserva: Boolean = True;             //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
                            iSeqResgate : integer = -1              //edilaine - SIG20491
                          ) : boolean;


//BRUNO AZEVEDO SOL 128400 KINTANA 898619
procedure AtualizaReservas(qryAux: TwwQuery; pIdPessoa, pIdPessJur, pIdPlanoPrev: String);
 
function VoltaValorCotacao(qryaux : Twwquery ; sIndiceReajuste,sIdPlanoPrev , sIdTipoReserva ,sDataMov : string) : Double;


function VoltaValorCotacaoComData( qryaux             : Twwquery ;
                                   sIndiceReajuste    : string;
                                   sIdPlanoPrev       : string;
                                   sIdTipoReserva     : string;
                                   var sDataUtilizada : string) : double;

function VoltaValorCotExato(qryaux : Twwquery ; sIndiceReajuste, sIdPlanoPrev , sIdTipoReserva, sDataMov : string ; var dValorCotacao : Double ; var DataCotacao : string) : Integer;


function VerificaCamposObrigContab( qryaux , qrycontab, qrycontabplano : Twwquery ;var sIncompl : string) : boolean;

//funções de auxílio a converção
function TruncaRound(f:string;n:integer):string;
function Truncar(f:Double;n:integer):string;
function ArredondaValor(Valor : string) : Extended;

//Busca o saldo por reserva para uma pessoa na "Reservapart"
function PegaValorReservaPessoa(sidPessjur,sidPlanoPrev,
                                sidPessoa, sidReserva : string; qry : twwquery):Double;
procedure CalcularReserva(var valorReserva,rValCota:Extended;idplanoprev,idtiporeserva,idpessoa,idpessjur,data_cota:string;qryaux:TwwQuery);

function CalcularReservaCota( reValReal, valorReserva, rValCota : extended;
                              opcao                             : integer; // opcao : 0 = Adicionar , 1 = Remover
                              percentual                        : extended )  : extended;

function AdicionarReserva (   mesreferencia, sidContribuicao,
                              sidPlanoPrev,  sidPessJur,
                              sseqProposta,  sidPessoa,
                              data_cota                         : string;
                              ValRealAdicionar                  : Extended;
                              qryAux, qryReserva                : TwwQuery;
                              opcao                             : integer ) : boolean; // opcao : 0 = Adicionar , 1 = Remover

function BuscaDataAlimentacao ( psMesReferencia, psIdContribuicao,
                                psIdPlanoPrev, psIdPessJur,
                                psSeqProposta,  psIdPessoa,
                                psValorAlimentadoEmReal     : string;
                                qryAux                      : TwwQuery ) : string;

function AbateContribReserva ( psMesReferencia, psIdContribuicao,
                               psIdPlanoPrev, psIdPessJur,
                               psSeqProposta,  psIdPessoa,
                               psValorAlimentadoEmReal,
                               psDataAlimentacao           : string;
                               qryReservas, qryAux         : TwwQuery ) : boolean;

function GeraHistMovReservaContribuicao ( qryAux                              : TwwQuery;
                                          piIdPessJur,       piIdPlanoPrev,
                                          piIdPessoa,        piSeqProposta,
                                          piIdTipoReserva,   piIdContribuicao,
                                          piIdEventoGerador, piIdRegra        : Longint;
                                          pdPercentual,
                                          pdValorMovCotas,   pdValorMovReal,
                                          pdValorSaldoResCotas,
                                          pdValorCota                          : double;
                                          psDataABuscarCota,
                                          psDataMovimento,
                                          psAnoMesReferencia                   : string;
                                          piFlgEntrada,
                                          piFlgProcedencia                     : word; // 0 - Alimentacao normal (evento, contribuicao ou beneficio)
                                                                                      // 1 - Alimentacao manual
                                          psDtAlimentaReserva : string = ''; // SOL 142663 Kintana 915068
                                          piIdPessoaOrigem: String = '';
                                          piIdPessoaDestino: String = '';
                                          psObservacao : string = '';
                                          dSALDOREALCONT :real = 0; //Darivaldo Alencar - SOL 253577/17989 -  PPM 1198155
                                          piNumRecebimento : Longint = -1     // Paulo Nobre - WO6161
                                          ) : boolean; //BRUNO AZEVEDO SOL KINTANA

function  SomaAlteradorAlimentaReserva (qryAux           : TwwQuery;
                                        psMesReferencia,
                                        psMesCobranca    : string;
                                        piNumRecebimento,
                                        piIdMotivo,
                                        piIdContribuicao : Longint ) : double;

function CalculaValorReserva ( qryAux             : TwwQuery;
                               psIdPlanoPrev, psIdTipoReserva : string;
                               piIdRegraCalculo   : Longint;
                               pdPercentual,      // sem dividir por 100
                               pdValorAAlimentar  : double;
                               piIndiceAAlimentar : integer;
                               psDataRecebimento,
                               psDataABuscarCota  : string;
                               var pdValorCota    : double; // passar 0 para a funçào retornar
                               var sMsgErro       : string ) : double;

function CalculaReservaMatematica ( var qryResMatematica : TwwQuery; // query com estrutura da HISTMOVRESERVA, em CachedUpdates, para ser inserida pela funcao
                                   qryBeneficios,                   // query com os benefícios envolvidos com os campos : IDBENEFICIO, VALORATUAL
                                   qryAux               : TwwQuery; // query auxiliar
                                   piIdPessJur,
                                   piIdPlanoPrev,
                                   piIdPessoa,
                                   piSeqProposta,
                                   piIdEventoGerador    : Longint;
                                   pdValorReserva       : Double;
                                   var sMsgErro         : string ) : boolean;


function DESFAZPADRAOMOVRESERVA( piIdPessJur,
                                 piIdPlanoPrev,
                                 piIdPessoa,
                                 piSeqProposta,
                                 piIdBeneficio,
                                 piIdEventoGerador    : Longint;
                                 psDataCota           : string;
                                 piNumeroProcesso     : Longint;
                                 Var psPlanilhasExcluir : string ) : boolean; 


function DesfazReservaMatematica (  qryAux               : TwwQuery; // query auxiliar
                                    piIdPessJur,
                                    piIdPlanoPrev,
                                    piIdPessoa,
                                    piSeqProposta        : Longint;
                                    psDataInicio,
                                    psDataFinal          : string ) : boolean;



//edilaine - SIG24360 - inicio
function AcertaHistMovReserva (  qryAux               : TwwQuery; // query auxiliar
                                 piIdPessJur,
                                 piIdPlanoPrev,
                                 piIdPessoa,
                                 piSeqProposta        : Longint;
                                 psMesRef             : string ) : boolean;    overload;

function AcertaHistMovReserva (  psMesRef             : string;
                                 piIdPessJur,
                                 piIdPlanoPrev,
                                 piIdPessoa,
                                 piSeqProposta        : Longint ) : boolean;  overload;
//edilaine - SIG24360 - fim

function ReajustaBeneficioInss(qryaux : twwquery ; sMesRef ,sDataInicioInss, sDataInicio,
                               sNomeParticip : string ; var sValor : string;
                               bRetro : Boolean) : Boolean;

function ProximoAnoMes13(iMes, iAno : integer) : string;

function TruncaRoundRetroativo(f:string;n:integer):string;


Function ExecutaRegraDataCota(sIdRegra, sSQLRegra : string; Var bErro : Boolean): string;


procedure VerifIndiceHist(qryaux : twwquery;  var sIndice : string ; sIdPlanoPrev, sIdTipoReserva : string ; sDataCota : string);


function AtualizaReservaIndexada ( qryIndices        : TwwQuery;
                                   piCodIndice       : Longint;
                                   psDataInicio      : string;
                                   psDataFinal       : string;
                               var pdValorAAtualizar : extended;
                               var psMaiorDataIndice : string;
                               var sMsgErro          : string ) : boolean;


function CalcPadraoMovReserva( piIdPessJur,
                               piIdPlanoPrev,
                               piIdPessoa,
                               piSeqProposta,
                               piIdEventoGerador,
                               piIdPessJurDestino,
                               piIdPlanoPrevDestino : Longint;
                               psFlgIntEvento,
                               psDataCota           : string;
                               var sMsgErro         : string;
                               piNumeroProcesso     : Longint;
                               qrySaldoReservas     : twwquery) : Double;


function VerificaContaContabil(const psConta      : string;
                               const psCusto      : string;
                               const piSubConta   : Integer;
                               const piPlanoConta : Integer;
                               var   psMsg        : string
                              ): Boolean;

function  VerificaCentroCusto(const psCusto    : string;
                              var   psRetorno  : string
                             ): Boolean;


function  NomeReservas(pIDPlanoOri        : Integer;
                       pIDPlanoDest       : Integer;
                       piTipoReservaOri   : Integer;
                       piTipoReservaDest  : Integer
                      ): string;

//edilaine - SIG20491 - inicio
Function GetSeqResgate(iIdPlanoPrev, iIdPessJur,
                       iIdPessoa, iSeqProposta : integer;
                       const bIncrementa : boolean = true) : Integer;    overload;

function GetSeqResgate(iNumeroProcesso : integer) : integer;             overload;


function DesmarcaReservas(iIdPlanoPrev, iIdPessJur,
                          iIdPessoa, iSeqProposta,
                          iSeqResgate : integer ) : boolean;
//edilaine - SIG20491 - fim



var
   IUnidnegoc           : Integer;
   sUnidnegoc           : string;
   sIndiceMoedaCorrente : string;
   sDataref             : string;


implementation
uses
  UAdmPrev, DAPrev, UIntegraBack, UFuncoesUteis;




//--------------------------verifica campos obrigatórios para contabilização---//
function VerificaCamposObrigContab( qryaux, qrycontab, qrycontabplano : Twwquery  ;var sIncompl : string) : boolean;
var sTipoDesc : string;
begin
   Result := False;
   sIncompl := '';

   if  inttostr(Sistema.IdEmpresa) = ''
   then begin
      if sIncompl = ''
      then sIncompl := 'Empresa Proprietária '
      else sIncompl := sIncompl +', Empresa Proprietária ';
   end;


   qryAux.Close;
   qryAux.SQL.clear;
   qryAux.SQL.add(' SELECT USACRESPON, CODCENTRORESPON,USAABC , UNIDNEGOC, MOEDACORRENTE FROM PARAMGLOBAL '+
                  ' WHERE IDPESSOA = '+inttostr(Sistema.IdEmpresa)+'  ');
   qryAux.open;

   sIndiceMoedaCorrente := qryAux.FieldByName('moedacorrente').AsString;


   if (qryAux.FieldByName('usaabc').AsString = 'S') and
   (Trim(qrycontab.FieldByName('UNIDNEGOC').AsString) = '') and
   (Trim(qrycontabplano.FieldByName('UNIDNEGOC').AsString) = '')
   then begin
      if sIncompl = ''
      then sIncompl := 'Unidade de Negócio'
      else sIncompl := sIncompl +', Unidade de Negócio';
   end
   else if (qryAux.FieldByName('usaabc').AsString = 'S') and
   (Trim(qrycontab.FieldByName('UNIDNEGOC').AsString) <> '') and
   (Trim(qrycontabplano.FieldByName('UNIDNEGOC').AsString) = '') then
   begin
      IUnidnegoc := qrycontab.FieldByName('UNIDNEGOC').AsInteger;
      sUnidnegoc := qrycontab.FieldByName('UNIDNEGOC').AsString;
   end
   else if (qryAux.FieldByName('usaabc').AsString = 'S') and
   (Trim(qrycontab.FieldByName('UNIDNEGOC').AsString) = '') and
   (Trim(qrycontabplano.FieldByName('UNIDNEGOC').AsString) <> '') then
   begin
      IUnidnegoc := qrycontabplano.FieldByName('UNIDNEGOC').AsInteger;
      sUnidnegoc := qrycontabplano.FieldByName('UNIDNEGOC').AsString;
   end
   else
   begin
      if qryAux.FieldByName('unidnegoc').AsString = '' then
      begin
         if sIncompl = ''
         then sIncompl := ' Parâmetro - Unidade de Negócio'
         else sIncompl := sIncompl +', Parâmtero - Unidade de Negócio';
      end
      else
      begin
        IUnidnegoc := qryAux.FieldByName('UNIDNEGOC').AsInteger;
        sUnidnegoc := qryAux.FieldByName('UNIDNEGOC').AsString;
      end;
   end;

   if (Trim(qrycontab.FieldByName('PLACONTAC').AsString) = '') and
      (Trim(qrycontabplano.FieldByName('PLACONTAC').AsString) = '')
   then begin
      if sIncompl = ''
      then sIncompl := 'Conta Contábil para Crédito'
      else sIncompl := sIncompl +', Conta Contábil para Crédito';
   end;

   if (Trim(qrycontab.FieldByName('PLACONTAD').AsString) = '') and
      (Trim(qrycontabplano.FieldByName('PLACONTAD').AsString) = '')
   then begin
      if sIncompl = ''
      then sIncompl := 'Conta Contábil para Débito'
      else sIncompl := sIncompl +', Conta Contábil para Débito';
   end;

   if (Trim(qrycontab.FieldByName('PLANO').AsString) = '') and
      (Trim(qrycontabplano.FieldByName('PLANO').AsString) = '')
   then begin
      if sIncompl = ''
      then sIncompl := 'Plano de Conta Contábil '
      else sIncompl := sIncompl +', Plano Conta Contábil ';
   end;

   if sIncompl <> ''
   then begin
      sTipoDesc := 'Informações incompletas para a Contabilização da Movimentação - ';
      sIncompl := sTipoDesc+sIncompl;
      Result := False;
   end
   else Result := True;
end; // VerificaCamposObrig




//--------------------------------------//-------------------------------------//
function VoltaValorCotacao(qryaux : Twwquery ; sIndiceReajuste, sIdPlanoPrev , sIdTipoReserva, sDataMov : string) : Double;
var cAux : char ;
    stipoMoeda : string;
begin
 Result := 0;
 if Trim(sIndiceReajuste) = '' then Exit;

 
 VerifIndiceHist(qryaux , sIndiceReajuste, sIdPlanoPrev , sIdTipoReserva ,sDataMov );

 //transformar o número de cotas da reserva em moeda
 qryAux.Close;
 qryAux.SQL.clear;
 qryAux.SQL.add('SELECT  MOEPERIODICIDADE '+
                ' FROM MOEDA '+
                ' WHERE MOECODIGO = '+sIndiceReajuste+' ');
 Try
   qryAux.Open;
 Except
   result := 0;
   exit;
 End;
 if qryAux.IsEmpty then begin
   result := 0;
   exit;
 end;


 sTipoMoeda := qryAux.FieldByName('MOEPERIODICIDADE').AsString;
 qryAux.Close;
 qryAux.SQL.clear;
 if sTipoMoeda = 'M' Then Begin

    qryAux.SQL.add('SELECT  COTVALOR '+
                   ' FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                   ' AND COTDATA IN '+
                   ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndicereajuste+' '+

                   
                   
                   ' AND (COTMESREF <= '''+copy(sDataMov,4,2)+copy(sDataMov,7,4)+ '''))'); 


  end
  else begin
    qryAux.SQL.add('SELECT  COTVALOR '+
                   ' FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                   ' AND COTDATA IN '+
                   ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndicereajuste+' '+
                   ' AND COTDATA <= last_day(add_months(TO_DATE(''' + sDataMov +''', ''DD/MM/YYYY''),-1)))'); // SOL 181743 Kintana 1706063
                   //' AND COTDATA <= TO_DATE(''' + sDataMov +''',''DD/MM/YYYY'')) '); // SOL 181743 Kintana 1706063 comentado


  end;
  try
    qryAux.Open;
  except
   result := 0;
   exit;
  end;
 if qryAux.IsEmpty then
 begin
   //erro - não encontrou cotacao para moeda
   result := 0;
   exit;
 end
 else
 begin
    cAux := DecimalSeparator;
    DecimalSeparator := '.';
    result := strtofloat(ClienteNumero(truncaround(qryAux.FieldByName('COTVALOR').AsString,8)));
    DecimalSeparator := cAux;
 end;

end;


function VoltaValorCotacaoComData( qryaux             : Twwquery ;
                                   sIndiceReajuste    : string;
                                   sIdPlanoPrev       : string;
                                   sIdTipoReserva     : string;
                                   var sDataUtilizada : string) : double;
var cAux : char ;
    stipoMoeda : string;
begin
 Result := 0;
 if Trim(sIndiceReajuste) = '' then Exit;


 VerifIndiceHist(qryaux , sIndiceReajuste, sIdPlanoPrev , sIdTipoReserva ,sDataUtilizada );

 //transformar o número de cotas da reserva em moeda
 qryAux.Close;
 qryAux.SQL.clear;
 qryAux.SQL.add(' SELECT  MOEPERIODICIDADE '+
                ' FROM   MOEDA '+
                ' WHERE  MOECODIGO = '+sIndiceReajuste+' ');
 Try
   qryAux.Open;
 Except
   result := 0;
   exit;
 End;
 if qryAux.IsEmpty then begin
   result := 0;
   exit;
 end;


 sTipoMoeda := qryAux.FieldByName('MOEPERIODICIDADE').AsString;
 qryAux.Close;
 qryAux.SQL.clear;
 if sTipoMoeda = 'M' Then Begin

    qryAux.SQL.add('SELECT  COTDATA, COTVALOR '+
                   ' FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                   ' AND COTDATA IN '+
                   ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                   '  WHERE MOECODIGO = '+sIndicereajuste+' '+


                   '  AND   (SUBSTR(COTMESREF,3,4)||SUBSTR(COTMESREF,1,2) <= '''+copy(sDataUtilizada,7,4)+copy(sDataUtilizada,4,2)+'''))');

  end
  else begin
    qryAux.SQL.add('SELECT  COTDATA, COTVALOR '+
                   ' FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                   ' AND COTDATA IN '+
                   ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndicereajuste+' '+
                   ' AND COTDATA <= TO_DATE(''' + sDataUtilizada +''',''DD/MM/YYYY'')) '); 


  end;
  try
    qryAux.Open;
  except
   result := 0;
   exit;
  end;
 if qryAux.IsEmpty then
 begin
   //erro - não encontrou cotacao para moeda
   result := 0;
   exit;
 end
 else
 begin
    cAux := DecimalSeparator;
    DecimalSeparator := '.';
    result := strtofloat(ClienteNumero(truncaround(qryAux.FieldByName('COTVALOR').AsString,8)));
    DecimalSeparator := cAux;
    sDataUtilizada := qryAux.FieldByName('COTDATA').AsString;
 end;

end;


//--------------------------------//-------------------------------------------//

function VoltaValorCotExato(qryaux : Twwquery ; sIndiceReajuste, sIdPlanoPrev , sIdTipoReserva,  sDataMov : string ; var dValorCotacao : Double ; var DataCotacao : string) : Integer;
var cAux : char ;
begin

 
 VerifIndiceHist(qryaux , sIndiceReajuste, sIdPlanoPrev , sIdTipoReserva ,sDataMov );


 //transformar o número de cotas da reserva em moeda
 qryAux.Close;
 qryAux.SQL.clear;
 qryAux.SQL.add('SELECT  COTVALOR, COTDATA '+
                ' FROM COTACAOMOEDA '+
                ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                ' AND COTDATA IN '+
                ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                ' WHERE MOECODIGO = '+sIndicereajuste+' '+
                
                //só deve haver uma cotação por mês
                ' AND (TO_DATE(TO_CHAR(COTDATA,''YYYY/MM''),''YYYY/MM'') '+
                ' <= TO_DATE('''+copy(sDataMov,7,4)+'/'+copy(sDataMov,4,2)+''',''YYYY/MM'') ) ) ');
 qryAux.Open;


 if qryAux.IsEmpty then
 begin
   //erro - não encontrou cotacao para moeda
   result := 0;
   DataCotacao := '';
   dValorCotacao := 0;
   exit;
 end
 else
 begin
    cAux := DecimalSeparator;
    DecimalSeparator := '.';
    DataCotacao := qryAux.FieldByName('COTDATA').AsString;

    if not (strtodate(sDataMov) = strtodate(DataCotacao)) then
    result := 1
    else result := 2;

    dValorCotacao := strtofloat(truncaround(qryAux.FieldByName('COTVALOR').AsString,8));
    DecimalSeparator := cAux;
 end;
end;

//-------------------------------------//--------------------------------------//
function AlimentaHistorico( qryAux                              : TwwQuery;
                            sIdpessjur,       sIdplanoprev,
                            sIdtiporeserva,   sIdpessoa,
                            sSeqProposta,     sVlMovCotas,
                            sVlSaldoResCotas, sIdbeneficio,
                            sIdContribuicao,  sIdEvento,
                            sIdRegra,         sMesReferencia    : string;
                            iFlgEntrada                         : integer;
                            Data                                : Tdate ;
                            bExcedente                          : Boolean ;
                            DataRefIndice                       : TDate ;
                            sIdParticipante                     : string;
                            var piIdHistorico                   : Longint;
                            bAtualizaReserva: Boolean = True;             //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
                            iSeqResgate : integer = -1                    //edilaine - SIG20491
                          ) : boolean;
var
   sIdHist : string;
   cAux : char;
   sPercentual,sValorIndice : string;
   sVlMovReal , sVlSaldoResAtual, sIndiceReajuste,sVlSaldoCont : string;
   iFlgModoAtualizacao : integer;
   sDataUtilizada : string;
   sAuxData: String; //BRUNO AZEVEDO SOL 145995 Kintana 1023814
   sDataReceb, sNumReceb: String;
   sSeqResgate : string;             //edilaine - SIG20491
begin
   Result := False;

   sSeqResgate := iff(iSeqResgate = -1, 'null', IntToStr(iSeqResgate) );     //edilaine - SIG20491

   if StrToFloat(ClienteNumero(sVlMovCotas)) = 0
   then begin
      Result := True;
      Exit;
   end;

   if (Trim(sIdbeneficio) <> '' ) and (StrToInt(sIdBeneficio) <= 0)
   then sIdBeneficio := '';

   if (Trim(sIdContribuicao) <> '' ) and (StrToInt(sIdContribuicao) <= 0)
   then sIdContribuicao := '';

   sIdHist       := inttostr(LeUltRegistro(qryaux,'HISTMOVRESERVA'));
   piIdHistorico := StrToInt(sIdHist);

   if sIdpessjur = ''       then exit;
   if sIdplanoprev = ''     then exit;
   if sIdtiporeserva = ''   then exit;
   if sVlMovCotas = ''      then exit;
   if sVlSaldoResCotas = '' then exit;
   if (iFlgEntrada <> 0) and (iFlgEntrada <> 1) then exit;

   qryAux.Close;
   if not (sIdContribuicao = '') then
   begin
      qryAux.Close;
      qryAux.SQL.clear;
      qryAux.SQL.add(' SELECT PERCENTUAL FROM RESERVAXCONTRIB  '+
                     ' WHERE  IDCONTRIBUICAO = '''+sIdContribuicao+''' '+
                     ' AND    IDTIPORESERVA = '''+sIdtiporeserva+''' '+
                     ' AND    IDPLANOPREV = '''+sIdplanoprev+''' ');
      try
         qryAux.open;
      except
         Exit;
      end;
   end;

   if qryAux.IsEmpty then
   sPercentual := ''
   else sPercentual := qryAux.FieldByName('Percentual').AsString;

   
   qryAux.Close;
   qryAux.SQL.clear;
   qryAux.SQL.add(' SELECT FLGMODATUALIZACAO, INDICECORRECAO, INDICEREAJUSTE '+
                  ' FROM   RESERVAXPLANO                                     '+
                  ' WHERE  IDTIPORESERVA = '''+sIdtiporeserva+'''            '+
                  ' AND    IDPLANOPREV = '''+sIdplanoprev+'''                ');
   try
      qryAux.open;
   except
      Exit;
   end;

   iFlgModoAtualizacao := qryAux.FieldByName('FLGMODATUALIZACAO').AsInteger;

   if qryAux.FieldByName('FLGMODATUALIZACAO').AsInteger = 0
   then sIndiceReajuste := qryAux.FieldByName('INDICEREAJUSTE').AsString
   else sIndiceReajuste := qryAux.FieldByName('INDICECORRECAO').AsString;

   
   
   VerifIndiceHist(qryaux , sIndiceReajuste, sIdplanoprev, sIdTipoReserva,FormatDateTime('dd/mm/yyyy', datarefindice) );

   cAux             := DecimalSeparator;
   DecimalSeparator := ',';

   

   sDataUtilizada   := FormatDateTime('dd/mm/yyyy', datarefindice);

   sValorIndice     := floattostr(VoltaValorCotacaoComData( qryAux,
                                                        sIndiceReajuste,
                                                        sIdplanoprev,
                                                        sIdTipoReserva,
                                                        sDataUtilizada));
   DecimalSeparator := cAux;


   if iFlgModoAtualizacao = 0
   then begin
      if pos(',',sVlMovCotas) > 0 then
      begin
         cAux := DecimalSeparator;
         DecimalSeparator := ',';
         sVlMovReal := floattostr(strtofloat(sVlMovCotas) *
         
         VoltaValorCotacao(qryaux,sIndiceReajuste,sIdplanoprev, sIdTipoReserva,FormatDateTime('dd/mm/yyyy', datarefindice)) ); 
         DecimalSeparator := cAux;
      end
      else //if pos('.',sVlMovCotas) > 0 then
      begin
         cAux := DecimalSeparator;
         DecimalSeparator := '.';
         sVlMovReal := floattostr(strtofloat(sVlMovCotas) *

         VoltaValorCotacao(qryaux, sIndiceReajuste,sIdplanoprev, sIdTipoReserva,FormatDateTime('dd/mm/yyyy', datarefindice)) );
         DecimalSeparator := cAux;
      end;

      if pos(',',sVlSaldoResCotas) > 0 then
      begin
         cAux := DecimalSeparator;
         DecimalSeparator := ',';
         sVlSaldoResAtual := floattostr(strtofloat(sVlSaldoResCotas) *

         VoltaValorCotacao(qryaux, sIndiceReajuste,sIdplanoprev, sIdTipoReserva,FormatDateTime('dd/mm/yyyy', datarefindice)) );
         DecimalSeparator := cAux;
      end
      else 
      begin
         cAux := DecimalSeparator;
         DecimalSeparator := '.';
         sVlSaldoResAtual := floattostr(strtofloat(sVlSaldoResCotas) *
         
         VoltaValorCotacao(qryaux,sIndiceReajuste,sIdplanoprev, sIdTipoReserva,FormatDateTime('dd/mm/yyyy', datarefindice)) );  
         DecimalSeparator := cAux;
      end;
   end
   else begin
      sVlMovReal       := sVlMovCotas;
      sVlSaldoResAtual := sVlSaldoResCotas;
   end;

   //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
   cAux := DecimalSeparator;
   try
      if DecimalSeparator = ',' then
      begin
         if pos(',',sVlMovReal) > 0 then
         sVlMovReal := FloatToStr(RoundCM(StrToFloat(sVlMovReal),2));
         if pos(',',sVlMovCotas) > 0 then
         sVlMovCotas := FloatToStr(RoundCM(StrToFloat(sVlMovCotas),8));
         if pos(',',sVlSaldoResAtual) > 0 then
         sVlSaldoResAtual := truncaround(sVlSaldoResAtual,8);
         if pos(',',sVlSaldoResCotas) > 0 then
         sVlSaldoResCotas := truncaround(sVlSaldoResCotas,2);
      end;
   finally

      DecimalSeparator := '.';
      if pos('.',sVlMovReal) > 0 then
      try //SOL 257562 PPM 962596
         sVlMovReal := FloatToStr(RoundCM(StrToFloat(sVlMovReal),2));
      except
         sVlMovReal := StringReplace(sVlMovReal, '.', '', [rfReplaceAll]); //SOL 257562 PPM 962596
         sVlMovReal := FloatToStr(RoundCM(StrToFloat(sVlMovReal),2));      //SOL 257562 PPM 962596
      end;
      if pos('.',sVlMovCotas) > 0 then
      try //SOL 257562 PPM 962596
         sVlMovCotas := FloatToStr(RoundCM(StrToFloat(sVlMovCotas),8));
      except
         sVlMovCotas := StringReplace(sVlMovCotas, '.', '', [rfReplaceAll]);  //SOL 257562 PPM 962596
         sVlMovCotas := FloatToStr(RoundCM(StrToFloat(sVlMovCotas),2));       //SOL 257562 PPM 962596
      end;
      if pos('.',sVlSaldoResAtual) > 0 then
      try //SOL 257562 PPM 962596
         sVlSaldoResAtual := truncaround(sVlSaldoResAtual,2);
      except
         sVlSaldoResAtual := StringReplace(sVlSaldoResAtual, '.', '', [rfReplaceAll]); //SOL 257562 PPM 962596
         sVlSaldoResAtual := FloatToStr(RoundCM(StrToFloat(sVlSaldoResAtual),2));      //SOL 257562 PPM 962596
      end;
      if pos('.',sVlSaldoResCotas) > 0 then
      try //SOL 257562 PPM 962596
         sVlSaldoResCotas := truncaround(sVlSaldoResCotas,8);
      except
         sVlSaldoResCotas := StringReplace(sVlSaldoResCotas, '.', '', [rfReplaceAll]); //SOL 257562 PPM 962596
         sVlSaldoResCotas := FloatToStr(RoundCM(StrToFloat(sVlSaldoResCotas),2));      //SOL 257562 PPM 962596
      end;
   end;
   DecimalSeparator := cAux;

   {cAux := DecimalSeparator;
   try
      if DecimalSeparator = ',' then
      begin
         if pos(',',sVlMovReal) > 0 then
         sVlMovReal := truncaround(sVlMovReal,2);
         if pos(',',sVlMovCotas) > 0 then
         sVlMovCotas := truncaround(sVlMovCotas,8);
         if pos(',',sVlSaldoResAtual) > 0 then
         sVlSaldoResAtual := truncaround(sVlSaldoResAtual,8);
         if pos(',',sVlSaldoResCotas) > 0 then
         sVlSaldoResCotas := truncaround(sVlSaldoResCotas,2);
      end;
   finally
      DecimalSeparator := '.';
      if pos('.',sVlMovReal) > 0 then
      sVlMovReal := truncaround(sVlMovReal,2);
      if pos('.',sVlMovCotas) > 0 then
      sVlMovCotas := truncaround(sVlMovCotas,8);
      if pos('.',sVlSaldoResAtual) > 0 then
      sVlSaldoResAtual := truncaround(sVlSaldoResAtual,2);
      if pos('.',sVlSaldoResCotas) > 0 then
      sVlSaldoResCotas := truncaround(sVlSaldoResCotas,8);
   end;
   DecimalSeparator := cAux;}
   //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
   
   //testa se é uma atualização monetária
   if (sIdBeneficio = '') and
      (sIdContribuicao = '') and
      (sIdEvento = '') and (not bExcedente) then sVlMovCotas := '0';

   qryAux.Close;
   qryAux.SQL.clear;
   qryAux.SQL.Add(' SELECT MAX(IDHISTRESERVA) , DATAMOV, SALDOREAL ,IDEVENTOGERADOR,IDBENEFICIO, '+
                  ' IDCONTRIBUICAO,VLRCOTAS,VLRREAL, SALDOREALCONT '+
                  ' FROM HISTMOVRESERVA '+
                  ' WHERE  (IDPESSJUR     = '+sidpessjur     +') '+
                  ' AND    (IDPLANOPREV   = '+sidplanoprev   +') '+
                  ' AND    (IDPESSOA      = '+sidpessoa      +') '+
                  ' AND    (SEQPROPOSTA   = '+sSeqProposta   +') '+
                  ' AND    (IDTIPORESERVA = '+sIdTipoReserva +') '+
                  ' GROUP BY DATAMOV, SALDOREAL,IDEVENTOGERADOR,IDBENEFICIO, '+
                  ' IDCONTRIBUICAO,VLRCOTAS,VLRREAL, SALDOREALCONT ');
   try
      qryAux.open;
   except
      Exit;
   end;

   if qryAux.isempty then
      sVlSaldoCont := sVlMovReal
   else
   begin
      qryAux.Last;

      if (qryAux.FieldByName('IDEVENTOGERADOR').AsString = '') and
         (qryAux.FieldByName('IDBENEFICIO').AsString = '') and
         (qryAux.FieldByName('IDCONTRIBUICAO').AsString = '') and
         (qryAux.FieldByName('VLRCOTAS').AsFloat <= 0) then //o último lançamento foi uma atualização monetária
      begin
         sVlSaldoCont := sVlMovReal;
      end
      else
      begin
         cAux := DecimalSeparator;
         DecimalSeparator := '.';
         case iFlgEntrada of
            0: sVlSaldoCont := floattostr(qryAux.FieldByName('SALDOREALCONT').AsFloat - StrToFloat( OraNumero( sVlMovReal ) ) );
            1: sVlSaldoCont := floattostr(strtofloat(sVlMovReal) + qryAux.FieldByName('SALDOREALCONT').AsFloat);
         end;
         DecimalSeparator := cAux;
      end;
   end;

   //BRUNO AZEVEDO SOL 145995 Kintana 1023814
   sAuxData := iif((DateToStr(Data) = '30/12/1899'), 'TO_DATE(SYSDATE,''DD/MM/YYYY'')', 'TO_DATE('''+ FormatDateTime('dd/mm/yyyy', DATA) + ''',''dd/mm/yyyy'')');

   // SOL 166107 Kintana 1445200
   if (sIdContribuicao <> '') and (sIdPessoa <> '') and (sIdPlanoPrev <> '') and  //SOL 168363 Kintana 1484125
      (sIdPessJur <> '') and (sMesReferencia <> '') then
   begin
      qryAux.Close;
      qryAux.SQL.clear;
      qryAux.SQL.add(' select DATARECEBIMENTO, NUMRECEBIMENTO from hstcontribprev '+
                     ' where idcontribuicao = '+sIdContribuicao+
                     ' and idpessoa         = '+sIdPessoa+
                     ' and IDPLANOPREV      = '+sIdPlanoPrev+
                     ' and IDPESSJUR        = '+sIdPessJur+
                     ' and mesreferencia    = '+QuotedStr(sMesReferencia));
      qryAux.open;
      if not(qryAux.isEmpty) then
      begin
         sDataReceb := qryAux.FieldByName('DATARECEBIMENTO').Asstring;
         sNumReceb  := qryAux.FieldByName('NUMRECEBIMENTO').Asstring;
      end;
   end
   else
   begin
      sDataReceb := '';
      sNumReceb  := '';
   end;

   // SOL 166107 Kintana 1445200
  // SOL 170679 Kintana 1534729
{   // SOL 167888 Kintana 1489782 -- Otacilio aquino ** Inicio **
   //if sIdtiporeserva = '100' then
  // begin
  if pos('-', sVlMovReal) > 0 then
  begin
     sVlMovReal := StringReplace(sVlMovReal, '-', '', [rfReplaceAll]);
  end;

  if pos('-', sVlMovCotas) > 0 then
  begin
     sVlMovCotas := StringReplace(sVlMovCotas, '-', '', [rfReplaceAll]);
  end;

  if pos('-', sVlSaldoCont) > 0 then
  begin
     sVlSaldoCont := StringReplace(sVlSaldoCont, '-', '', [rfReplaceAll]);
  end;

   // SOL 167888 Kintana 1489782 -- Otacilio aquino ** Fim **
 }  // SOL 170679 Kintana 1534729
   qryAux.Close;
   qryAux.SQL.clear;
   qryAux.SQL.add(' INSERT INTO HISTMOVRESERVA(IDHISTRESERVA,  IDTIPORESERVA,  DATAALIMENTACAO,          '+
                  '             VLRREAL,       VLRCOTAS,       IDBENEFICIO,    IDCONTRIBUICAO, IDEVENTOGERADOR,  '+
                  '             DATARECEBIMENTO, NUMRECEBIMENTO,                                                 '+ // SOL 166107 Kintana 1445200
                  '             SALDOREAL,     SALDOCOTAS,     IDPLANOPREV,    IDPESSOA,       IDPESSJUR,        '+
                  '             FLGENTRADA,    IDREGRACALCULO, PERCENTUAL,     SEQPROPOSTA,    IDPARTICIPANTE,   '+
                  '             SALDOREALCONT, VALORINDICE,    INDICECORRECAO, MESREFERENCIA,  DATAMOV,          '+
                  '             DATAINDICE, SEQRESGATE )      '+    //edilaine - SIG20491
                  ' VALUES('+sIdHist+','+sIdTipoReserva+ ',' +

                  sAuxData + ','); //BRUNO AZEVEDO SOL 145995 Kintana 1023814

   // SOL 170679 Kintana 1534729
   {   // SOL 167888 Kintana 1489782 -- Otacilio aquino ** Inicio **
   if pos('-', sVlMovReal) > 0 then
   begin
      sVlMovReal := StringReplace(sVlMovReal, '-', '', [rfReplaceAll]);
   end;

   if pos('-', sVlMovCotas) > 0 then
   begin
      sVlMovCotas := StringReplace(sVlMovCotas, '-', '', [rfReplaceAll]);
   end;

   if pos('-', sVlSaldoCont ) > 0 then
   begin
      sVlMovCotas := StringReplace(sVlMovCotas, '-', '', [rfReplaceAll]);
   end;

   // SOL 167888 Kintana 1489782 -- Otacilio aquino ** Fim **
}  // SOL 170679 Kintana 1534729
   if iFlgModoAtualizacao = 0
   then qryAux.SQL.Add( OraNumero( sVlMovReal ) +', '+ OraNumero( sVlMovCotas )+',')
   else qryAux.SQL.Add( OraNumero( sVlMovReal ) +', '+ OraNumero( sVlMovReal )+',');

   if sIdBeneficio = '' Then
     qryAux.SQL.add(' NULL, ')
   else
     qryAux.SQL.add(sIdBeneficio  + ',');

   if Trim(sIdContribuicao) = '' Then
     qryAux.SQL.Add(' NULL, ')
   else
     qryAux.SQL.add(sIdContribuicao+',');

   if sIdEvento = '' Then
     qryAux.SQL.add(' NULL, ')
   else
     qryAux.SQL.add(sIdEvento  + ',');

   // SOL 166107 Kintana 1445200
   if sDataReceb = '' Then
     qryAux.SQL.add(' NULL, ')
   else
     qryAux.SQL.add(QuotedStr(sDataReceb)  + ',');

   if sNumReceb = '' Then
     qryAux.SQL.add(' NULL, ')
   else
     qryAux.SQL.add(sNumReceb  + ',');
   // SOL 166107 Kintana 1445200

   if iFlgModoAtualizacao = 0
   then qryAux.SQL.add( OraNumero(sVlSaldoResAtual)+','+
                        OraNumero(sVlSaldoResCotas)+','+
                        sIdPlanoPrev+','+
                        sIdPessoa+','+
                        sIdPessJur+','+
                        IntToStr(iFlgEntrada)+','''+

                        {  Retirado os plics do  percentual }
                        sIdRegra+''','+ OraNumero(sPercentual)+','+

                        sSeqProposta+','+
                        sidParticipante+','+
                        OraNumero(sVlSaldoCont)+','+
                        OraNumero(sValorIndice)+ ' , '+
                        '1, '+
                        ''''+sMesReferencia + ''',SYSDATE, TO_DATE('''+sDataUtilizada+''',''DD/MM/YYYY''), '+sSeqResgate+' ) ')     //edilaine - SIG20491
   else qryAux.SQL.add( OraNumero(sVlSaldoResAtual)+','+
                        OraNumero(sVlSaldoResAtual)+','+ // saldocotas = saldoreal
                        sIdPlanoPrev+','+
                        sIdPessoa+','+
                        sIdPessJur+','+
                        IntToStr(iFlgEntrada)+','''+

                        { Retirado os plics do  percentual }
                        sIdRegra+''','+ OraNumero(sPercentual)+','+

                        sSeqProposta+','+
                        sidParticipante+','+
                        OraNumero(sVlSaldoCont)+','+
                        
                        
                        '1, '+                           
                        OraNumero(sValorIndice)+ ' ,' +
                        ''''+sMesReferencia + ''',SYSDATE, TO_DATE('''+sDataUtilizada+''',''DD/MM/YYYY''), '+sSeqResgate+' ) ');    //edilaine - SIG20491
   try
      qryAux.ExecSQL;
   except
      Exit;
   end;

   //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
   if (bAtualizaReserva)then begin
     //BRUNO AZEVEDO SOL 128400 KINTANA 898619
     AtualizaReservas(qryAux,sIdPessoa,sIdPessJur,sIdPlanoPrev);
   end;
   
   Result := True;
end;


//função principal-------------------------------------------------------------//
function MoveReserva( sIdEvento,
                      sIdPessoa ,
                      sSeqPropostaOrig,
                      sNomeParticipante,
                      sIdBeneficio                              : string;
                      qryMov                                    : TwwQuery ;
                      Regra                                     : TRegra ;
                      var sMsgErro                              : string;
                      sIdPessjurOrig,
                      sIdPlanoOrig,
                      sIdTipoReservaOrig,
                      sIdPessjurDest,
                      sIdPlanoDest,
                      sIdTipoReservaDest                        : string;
                      var bIntegraContab                        : boolean ;
                      sValorMov                                 : string ;
                      DataRefMov                                : TDate ;
                      sSeqPropostadest,
                      sNumProcesso,
                      sTipoPrevidencia,
                      sDtDireito                                : string;
                      iTotalBeneficiarios                       : integer;
                      rValorInfInss                             : Double;
                      DataRefIndice                             : TDate;
                      psValorReservaCotas                       : string;
                      psDtAlimentaReserva                       : string = '' // Renato Visoni SOL 124089 Kintana 693423
                      ) : integer;
var
   qryaux,            qryregrain,
   qryreserva,        qryauxcontab,
   qrytitular                                                   : TwwQuery;
   sIdpatroorig,      sIdpatrodest,        sIdplanoprevorig,
   sIdplanoprevdest,  sIdreservaorig,      sIdreservadest,
   sIdregra,          sIdregraValidacao ,  sValorReserva ,
   sValorResultado ,  sIndiceReajuste ,    sValorReservaDestino,
   sMesRef,           sidpess,
   sIndiceReajusteDestino                                       : string;
   Tipo : string[1];
   sValorMoedaCorrente,
   sValorRegraCotas,
   sValorReservaReal ,
   sValorRegracotasDestino ,
   sValorReservaRealDestino, sIncompl , sValorMovOriginal: string;
   bErro, bLista : boolean;
   Contador , ordem: Integer;
   cAux : char;
   sIdreservaaux : string;
   bAtualizaOrigem    : boolean;
   sDataAux : string;
   iTransCertas : Integer;

   //contabilidade
   plano,placontad ,placontac,
   unidnegoc, codcentrorespon,
   idempresaprop,idempresa,
   codsubconta,codcentrocustod,
   codcentrocustoc,
   matricula , inscricao,
   MesRef, mescobranca, dataref, sOpcoes : string ;
   valor : string;
   iIdHistorico,
   
   IdLote : Integer ;
   CodPortForm, sSeqProposta, sOpBenef : string;
   sDataAlimentaReserva : String; // Renato Visoni SOL 124089 Kintana 693423

//-------------------------------------//--------------------------------------//
   procedure PreencherQryIn(sValorReserva,sIndicereajuste,sValorReservaDestino,sIndiceReajusteDestino : string;Validacao: boolean);
   var cAux : char;
       sValorReal ,          sValorMovCotasOrigem,        sValorMovCotasDestino,
       sDataUltTransfOrig,   sDataUltResgateOrig,         sValorRealReservaDestino,
       sInscricaoDataOrig,   sDataUltTransfDest,
       sDataUltResgateDest,  sInscricaoDataDest,
       sSql,                 sFlgBenefMin,                sUltimoBeneficio,
       sSALPART,             sREMTOTAL,                   sIDTPPAGTOANT,
       sValorINSS,           sDataInscFund,               sValorReservaTot,
       sMesReferencia,       sValorInfInss,               sValor ,
       sSQLRegra,            sValorPrev,                  sDataInicioAnt
       : string;
   begin

   sDataUltTransfOrig := '';
   sDataUltResgateOrig := '';
   sInscricaoDataOrig := '';
   sDataUltTransfDest := '';
   sDataUltResgateDest := '';
   sInscricaoDataDest := '';
   sFlgBenefMin := '';

   //pega dados da origem para regra
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add(' SELECT INSCRICAODATA FROM PARTPREVPLAN '+
                  ' WHERE (IDPLANOPREV = '+sidplanoprevorig+') '+
                  ' AND (IDPESSOA = '+sidpessoa+') '+
                  ' AND (IDPESSJUR = '+sidpatroorig+') '+
                  ' AND (SEQPROPOSTA = '+sseqpropostaorig+') ');
   try
      qryAux.open;
      sInscricaoDataOrig := copy(qryAux.FieldByName('INSCRICAODATA').AsString,1,10);
   except
   end;


   //pega a data da última transferência de reserva
   qryAux.Close;
   qryAux.SQL.Clear;
//   qryAux.SQL.add(' SELECT MAX(DATAMOV) DATAMOV '+ //Everson TIBERO
   qryAux.SQL.add(' SELECT MAX(H.DATAMOV) DATAMOV '+ //Everson TIBERO
                  ' FROM HISTMOVRESERVA H, EVENTOGERADOR E '+
                  ' WHERE '+
                  ' (E.IDEVENTOGERADOR = H.IDEVENTOGERADOR) '+
                  ' AND (E.FLGINTERNO = ''TR'') '+
                  ' AND (H.IDPESSOA = '+sidpess+') '+
                  ' AND (H.IDPLANOPREV =  '+sidplanoprevorig+') '+
                  ' AND (H.IDPESSJUR = '+sidpatroorig+') '+
                  ' AND (H.SEQPROPOSTA = '+sseqpropostaorig+') ');
   try
      qryAux.open;
      sDataUltTransfOrig := copy(qryAux.FieldByName('DATAMOV').AsString,1,10);
   except
   end;


   //pega a data da última transferência de reserva
   qryAux.Close;
   qryAux.SQL.Clear;
//   qryAux.SQL.add(' SELECT MAX(DATAMOV) DATAMOV '+  //Everson TIBERO
   qryAux.SQL.add(' SELECT MAX(H.DATAMOV) DATAMOV '+  //Everson TIBERO
                  ' FROM HISTMOVRESERVA H, EVENTOGERADOR E '+
                  ' WHERE '+
                  ' (E.IDEVENTOGERADOR = H.IDEVENTOGERADOR) '+
                  ' AND (E.FLGINTERNO = ''RP'') '+
                  ' AND (H.IDPESSOA = '+sidpess+') '+
                  ' AND (H.IDPLANOPREV =  '+sidplanoprevorig+') '+
                  ' AND (H.IDPESSJUR = '+sidpatroorig+') '+
                  ' AND (H.SEQPROPOSTA = '+sseqpropostaorig+') ');
   try
      qryAux.open;
      sDataUltResgateOrig := copy(qryAux.FieldByName('DATAMOV').AsString,1,10);
   except
   end;


   //pega dados do destino para regra
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add(' SELECT INSCRICAODATA FROM PARTPREVPLAN '+
                  ' WHERE (IDPLANOPREV = '+sidplanoprevdest+') '+
                  ' AND (IDPESSOA = '+sidpessoa+') '+
                  ' AND (IDPESSJUR = '+sidpatrodest+')');
                  if sseqpropostadest <> '' then
                  qryAux.SQL.add(' AND (SEQPROPOSTA = '+sseqpropostadest+') ');
   try
      qryAux.open;
      sInscricaoDataDest := copy(qryAux.FieldByName('INSCRICAODATA').AsString,1,10);
   except
   end;


   //pega a data da última transferência de reserva
   qryAux.Close;
   qryAux.SQL.Clear;
//   qryAux.SQL.add(' SELECT MAX(DATAMOV) DATAMOV '+ //Everson TIBERO
   qryAux.SQL.add(' SELECT MAX(H.DATAMOV) DATAMOV '+ //Everson TIBERO
                  ' FROM HISTMOVRESERVA H, EVENTOGERADOR E '+
                  ' WHERE '+
                  ' (E.IDEVENTOGERADOR = H.IDEVENTOGERADOR) '+
                  ' AND (E.FLGINTERNO = ''TR'') '+
                  ' AND (H.IDPESSOA = '+sidpess+') '+
                  ' AND (H.IDPLANOPREV =  '+sidplanoprevdest+') '+
                  ' AND (H.IDPESSJUR = '+sidpatrodest+') ');
                  if sseqpropostadest <> '' then
//                  qryAux.SQL.add(' AND (SEQPROPOSTA = '+sseqpropostadest+') '); //Everson TIBERO
                  qryAux.SQL.add(' AND (H.SEQPROPOSTA = '+sseqpropostadest+') '); //Everson TIBERO
   try
      qryAux.open;
      sDataUltTransfDest := copy(qryAux.FieldByName('DATAMOV').AsString,1,10);
   except
   end;


   //pega a data do ultimo resgate
   qryAux.Close;
   qryAux.SQL.Clear;
//   qryAux.SQL.add(' SELECT MAX(DATAMOV) DATAMOV '+ //Everson TIBERO
   qryAux.SQL.add(' SELECT MAX(H.DATAMOV) DATAMOV '+ //Everson TIBERO
                  ' FROM HISTMOVRESERVA H, EVENTOGERADOR E '+
                  ' WHERE '+
                  ' (E.IDEVENTOGERADOR = H.IDEVENTOGERADOR) '+
                  ' AND (E.FLGINTERNO = ''RP'') '+
                  ' AND (H.IDPESSOA = '+sidpess+') '+
                  ' AND (H.IDPLANOPREV =  '+sidplanoprevdest+') '+
                  ' AND (H.IDPESSJUR = '+sidpatrodest+') ');
                  if sseqpropostadest <> '' then
//                  qryAux.SQL.add(' AND (SEQPROPOSTA = '+sseqpropostadest+') '); //Everson TIBERO
                  qryAux.SQL.add(' AND (H.SEQPROPOSTA = '+sseqpropostadest+') '); //Everson TIBERO
   try
      qryAux.open;
      sDataUltResgateDest := copy(qryAux.FieldByName('DATAMOV').AsString,1,10);
   except
   end;


   if sValorReserva = '' then
   sValorReserva := '0';

   if sIndiceReajuste = '' then
   sIndiceReajuste := '0';

   if sValorReservaDestino = ''
   then sValorReservaDestino := '0';

   if sIndiceReajusteDestino = ''
   then sIndiceReajusteDestino := '0';

   //testa se o valor veio nulo
   //só que  em um formato diferente : 0.00 , 0,00 , 0.0000 ...
   try
      sValorMov := OraNumero(sValorMov);
      cAux := DecimalSeparator;
      DecimalSeparator := '.';
      if strtofloat(sValorMov) = 0 then
      sValorMov := '0';
      DecimalSeparator := cAux;
   except
   end;

   if pos(',',sValorReservaDestino) > 0 then
   begin
      sValorReservaDestino := OraNumero(sValorReservaDestino);
   end;

   if pos(',',sValorReserva) > 0 then
   begin
      sValorReserva := OraNumero(sValorReserva);
   end;

   //verifica se a movimentação usa uma reserva de origem
   //diferente
   //se usa guarda o valor a transferir, que deve ser retirado da
   //origem, e marca o flg de atualizaçào
   //senão marca o flg para não atualizar e não atualiza o valor
   if sIdreservaOrig <> sIdreservaaux then
   begin
      sIdreservaaux := sIdreservaOrig;
      if (sValorMov <> '0')  then  
      else
      begin
          bAtualizaOrigem := False;
          //transforma o valor em cotas, foi passado em moeda
          sValorMov := trim(sValorMov);
          if pos(',',sValorMov) > 0 then
          begin
              sValorMov := OraNumero(sValorMov);
          end;

       end;
     end
     else
     begin
        
     end;

     cAux := DecimalSeparator;
     DecimalSeparator := '.';

     try
       
       
       
       

       sValorRealReservaDestino  := truncaround(floattostr(strtofloat(sValorReservaDestino)*VoltaValorCotacao(qryaux,sIndiceReajusteDestino,sidplanoprevdest, sidtiporeservadest,FormatDateTime('dd/mm/yyyy', DataRefIndice))),2);
       sValorMovCotasOrigem      := truncaround(floattostr(strtofloat(sValorMov)/VoltaValorCotacao(qryaux,sIndiceReajuste,sidplanoprevorig, sidtiporeservaorig,FormatDateTime('dd/mm/yyyy', DataRefIndice))),8);
       sValorMovCotasDestino     := truncaround(floattostr(strtofloat(sValorMov)/VoltaValorCotacao(qryaux,sIndiceReajusteDestino,sidplanoprevdest, sidtiporeservadest,FormatDateTime('dd/mm/yyyy', DataRefIndice))),8);
       
     except
     end;

     
     
     sValorReal := truncaround(floattostr(strtofloat(sValorReserva)*VoltaValorCotacao(qryaux,sIndiceReajuste,sidplanoprevorig, sidtiporeservaorig,FormatDateTime('dd/mm/yyyy', DataRefIndice))),2);
     

     DecimalSeparator := cAux;


     if sIdbeneficio = '' then//se não envolve um benefício
     begin

        if sValorMov = '' then sValorMov := '0';
        if sValorMovCotasOrigem = '' then sValorMovCotasOrigem := '0';
        if sValorMovCotasDestino = '' then sValorMovCotasDestino := '0';
        if sValorRealReservaDestino = '' then sValorRealReservaDestino := '0';

        qryregrain.Close;
        qryregrain.SQL.clear;
        qryregrain.SQL.add('SELECT '+sValorReserva+' VALORRESERVAORIGEM,'''+sDataUltResgateOrig+''' DATAULTRESGATEORIG, '+
                           ''''+sDataUltResgateDest+''' DATAULTRESGATEDEST, '''+sDataUltTransfOrig+''' DATAULTTRANSFORIG,'+
                           ''''+sDataUltTransfDest+''' DATAULTTRANSFDEST,'+
                           ''''+sInscricaoDataOrig+''' DATAINSCRICAOORIG,'''+sInscricaoDataDest+''' DATAINSCRICAODEST,'+
                           ''+sIndiceReajuste+' INDICEREAJUSTEORIGEM,'+
                           ''+sValorMov+' VALORMOV,'+sValorMovCotasOrigem+' VALORMOVCOTASORIGEM,'+sValorMovCotasDestino+' VALORMOVCOTASDESTINO ,'+
                           ''''+sDataRef+''' DATAREF, '+
                           ''+sValorReal+' VALORREALRESERVAORIGEM , '+sValorReservaDestino+' VALORRESERVADESTINO, '+
                           ''+sIndiceReajusteDestino+' INDICEREAJUSTEDESTINO ,'+sValorRealReservaDestino+' VALORREALRESERVADESTINO '+
                           ' FROM DUAL');
        qryregrain.open;
     end
     else//se envolve um benefício, então traz dados atuariais do benefício
     begin

        sMesReferencia   := Copy(sdataref,7,4)+'/'+Copy(sdataref,4,2);

        //monta dados para query de entrada da regra
        qrytitular.Close;
        qrytitular.SQL.clear;
        qrytitular.SQL.add('SELECT DISTINCT PESSOA.NOME AS TITULAR, PATRO.NOME AS PATRO, '+
                           '        PLANPREV.NOME AS PLANO, ELEGPATRO.MATRICULA, BENEFICIO.NOME AS BENEFICIO, BENEFICIO.FLGDESTBENEF, '+
                           '        BF.IDTITULAR, BF.IDPESSJUR, BF.IDPLANOPREV, BF.NUMEROPROCESSO, BF.IDBENEFICIO, '+
                           '        PP.VALORCALCINSS, PP.VALORINFINSS, PP.FLGDEVEEMPRESTIMO, PP.FLGDEVEASSISTENC, '+
                           '        PP.FLGDEVEPREVIDENC, PB.DTEVENTO, PB.DTDIREITO, '+
                           '        BF.IDTITULAR, BF.IDPESSOA , BF.IDPLANOPREV , BF.IDPESSJUR , '+
                           '        BF.NUMEROPROCESSO , BF.IDBENEFICIO , BF.SEQPROPOSTA, '+
                           '        EG.NOME AS EVENTOGERADOR, EG.FLGINTERNO, EG.IDEVENTOGERADOR, ELEGPATRO.TEMPOSERVANTREAL, '+
                           '        BP.IDREGRAPAGAMENTO, BP.IDREGRACALCULO, PP.SEQPROPOSTA, BF.VLRINFINSS, '+
                           '        BF.DATAINICIO , BF.DATAINICIOINSS, H.VLBENEFPGTO  '+
                           ' FROM  BENEFBFCIARIO BF, PESSOA, PESSOA PATRO, PLANPREV, '+
                           '       ELEGPATRO, BENEFICIO, PARTPREVPLAN PP, PROCESSOBENEF PB, '+
                           '       EVENTOGERADOR EG, BENEFPLANPREV BP, HSTBENEFBFCIARIO H '+
                           ' WHERE (H.NUMEROPROCESSO = '''+sNumProcesso+''') AND '+
                           '       (H.IDTITULAR = '''+sIdpessoa+''') AND '+
                           
                           '       (H.IDBENEFICIO = '''+sIdBeneficio+''') AND '+
                           '       (H.IDPLANOPREV = '''+sIdplanoprevorig+''') AND '+
                           '       (H.IDPESSJUR = '''+sIdPatroorig+''') AND '+
                           '       (H.SEQPROPOSTA = '''+sseqpropostaorig+''') AND '+
                           '       (BF.NUMEROPROCESSO = H.NUMEROPROCESSO) AND '+
                           '       (BF.IDTITULAR = H.IDTITULAR) AND '+
                           '       (BF.IDPESSOA = H.IDPESSOA ) AND '+
                           '       (BF.IDBENEFICIO = H.IDBENEFICIO) AND '+
                           '       (BF.IDPLANOPREV = H.IDPLANOPREV) AND '+
                           '       (BF.IDPESSJUR = H.IDPESSJUR) AND '+
                           '       (BF.SEQPROPOSTA = H.SEQPROPOSTA ) AND '+
                           '       (BF.IDSITBENEFICIO = 4) AND '+
                           '       (BF.IDTITULAR = PESSOA.IDPESSOA) AND '+
                           '       (BF.IDPESSJUR = PATRO.IDPESSOA) AND '+
                           '       (BF.IDPLANOPREV = PLANPREV.IDPLANOPREV) AND '+
                           '       (BF.IDPESSJUR = ELEGPATRO.IDPESSJUR) AND '+
                           '       (BF.IDTITULAR = ELEGPATRO.IDPESSOA) AND '+
                           '       (BF.IDBENEFICIO = BENEFICIO.IDBENEFICIO) AND '+
                           '       (BP.IDPLANOPREV = BF.IDPLANOPREV) AND '+
                           '       (BP.IDBENEFICIO = BF.IDBENEFICIO) AND '+
                           '       (BF.IDPESSJUR   = PP.IDPESSJUR)   AND '+
                           '       (BF.IDPLANOPREV = PP.IDPLANOPREV) AND '+
                           '       (BF.IDTITULAR   = PP.IDPESSOA) AND '+
                           '       (BF.NUMEROPROCESSO = PB.NUMEROPROCESSO) AND '+
                           '       (PB.IDEVENTOGERADOR = EG.IDEVENTOGERADOR) ');
        qrytitular.open;


        cAux := DecimalSeparator;
        DecimalSeparator := '.';

        sValorInfInss := qrytitular.FieldByName('VLRINFINSS').AsString;

        //se a data de inicio do benefício no inss é
        //diferente da data de inicio do benefício na refer
        //então reajusta o valor informado pelo inss
        if qrytitular.FieldByName('DATAINICIO').AsString <>
           qrytitular.FieldByName('DATAINICIOINSS').AsString then
        begin
           ReajustaBeneficioInss(qryaux, sMesReferencia ,
                             qrytitular.FieldByName('DATAINICIOINSS').AsString,
                             qrytitular.FieldByName('DATAINICIO').AsString,
                             qrytitular.FieldByName('TITULAR').AsString,
                             sValorinfinss, false);
        end;//if

        if qryTitular.FieldByName('IDREGRAPAGAMENTO').AsString <> '' then //Executa regra para calcular valor da Reserva do Particip.
           sValorReservaTot := OraNumero(CalcReservaPart(qryTitular.FieldByName('IDPESSJUR').AsInteger,
                                                      qryTitular.FieldByName('IDPLANOPREV').AsInteger,
                                                      qryTitular.FieldByName('IDTITULAR').AsInteger,
                                                      qryTitular.FieldByName('IDREGRAPAGAMENTO').AsInteger,
                                                      qryTitular.FieldByName('SEQPROPOSTA').AsInteger,
                                                      sDataRef,
                                                      sdataref,'','',
                                                      qryTitular.FieldByName('IDBENEFICIO').AsString,
                                                      qryAux))
        else //Calcula o valor total da soma das reservas do participante
           sValorReservaTot := OraNumero(CalcReservaPart(qryTitular.FieldByName('IDPESSJUR').AsInteger,
                                                      qryTitular.FieldByName('IDPLANOPREV').AsInteger,
                                                      qryTitular.FieldByName('IDTITULAR').AsInteger,
                                                      -1,
                                                      qryTitular.FieldByName('SEQPROPOSTA').AsInteger,
                                                      sDataRef,
                                                      sdataref,'','',
                                                      qryTitular.FieldByName('IDBENEFICIO').AsString,
                                                      qryAux));



        sUltimoBeneficio := OraNumero(CalcUltimoBeneficio(qryTitular.FieldByName('IdPessJur').AsInteger,
                                      qryTitular.FieldByName('IdPlanoPrev').AsInteger,
                                      qryTitular.FieldByName('IdTitular').AsInteger,
                                      qryTitular.FieldByName('IDBENEFICIO').AsInteger, 
                                      Sdataref, 
                                      'P',
                                      sIDTPPAGTOANT, 
                                      sFlgBenefMin,
                                      sDataInicioAnt, 
                                      qryAux));

        sSALPART  := OraNumero(CalcSalPart(qryTitular.FieldByName('IdPessJur').AsInteger,
                                           qryTitular.FieldByName('IdTitular').AsInteger,
                                           SAnoMesAnterior(sMesReferencia),
                                           qryAux));
        sREMTOTAL := OraNumero(CalcREMTOTAL(qryTitular.FieldByName('IdPessJur').AsInteger,
                                           qryTitular.FieldByName('IdTitular').AsInteger,
                                           SAnoMesAnterior(sMesReferencia),
                                           qryAux));


       {Verifica Quant de Benficiarios}
       

        sDataInscFund := CalcDataInscFund(qryTitular.FieldByName('IdPessJur').AsInteger,
                                      qryTitular.FieldByName('IdPlanoPrev').AsInteger,
                                      qryTitular.FieldByName('IdTitular').AsInteger,
                                      qryTitular.FieldByName('SEQPROPOSTA').AsInteger,
                                      qryAux);

        
        if Trim(sDataInscFund)    = '' Then sDataInscFund    := FormatDateTime('dd/mm/yyyy', Date); 

        if Trim(sValorINSS)       = '' Then sValorINSS       := '0';

        if Trim(sSalPart)         = '' Then sSalPart         := '0';

        if Trim(sRemTotal)        = '' Then sRemTotal        := '0';

        
        if Trim(sValorInfInss)    = '' Then sValorInfInss    := '0';

        if Trim(sValorReservaTot) = '' Then sValorReservaTot := '0';

        if Trim(sUltimoBeneficio) = '' Then sUltimoBeneficio := '0';

        if qrytitular.FieldByName('VLBENEFPGTO').AsString = '' Then
          sValor := '0'
        else
          sValor := qrytitular.FieldByName('VLBENEFPGTO').AsString;


        sDataInscFund := CalcDataInscFund(qryTitular.FieldByName('IdPessJur').AsInteger,
                                      qryTitular.FieldByName('IdPlanoPrev').AsInteger,
                                      qryTitular.FieldByName('IdTitular').AsInteger,
                                      qryTitular.FieldByName('SEQPROPOSTA').AsInteger,qryAux);

        sSQLRegra := ' SELECT PP.IDPESSOA, PP.IDPESSJUR,PP.IDPLANOPREV, PP.INSCRICAODATA,'+
                     ' '''+sDataInscFund+''' AS INSCRICAODATAFUND, PF.DATANASC,'+
                     '        EL.SALTOTAL, '+sValorInfInss+' AS VALINSS,EL.TEMPOSERVANTERIOR,'+
                     '        EL.TEMPONAOCREDITADO,'+sSALPART+' AS VALORPROVENTO, '+sREMTOTAL+' AS VALORREMTOTAL,'+
                     '        BPL.VALORBASE1,BPL.VALORBASE2,BPL.VALORBASE3,'+
                     '        SF.TIPOSIT,SF.IDSITFUNC, PP.IDSITPART, '+sValorReserva+' AS VALORRESERVA,'+
                     ' '''+sDataRef+''' AS DATAREF, '+IntToStr(iTotalBeneficiarios) + ' AS NUMBENEF,' +
                     '        '+sValor+' AS VLBENEFPGTO, PF.SEXO, '+
                     ' '+sValorPrev+' VALORPREV , '+sValorPrev+' VALORREFERENCIA, '+
                     ' BF.IDDEPENDENCIA,BF.IDSITBENEFICIO,BF.DATAFINAL,BF.VALORATUAL, '+
                     ' BF.DATAREQUERIMENTO,BF.DATAINICIO,'+
                     ' BF.FLGFORMAPAGTO,BF.VALORCALCULADO,BF.DATAULTREAJUSTE, '+
                     ' BF.ULTMESPREPARO,BF.VLRCALCINSS,'+sValorInfInss+' AS VLRINFINSS,    '+
                     ' BF.DATAINICIOINSS,BF.NUMPROCINSS,BF.DATAINICIOFUND,BF.FLGBENEFMIN, '+
                     ' BF.VALORCOTAS,BF.VALORTOTAL,BF.DATACONCESSAO,BF.DATAENCERRAMENTO,BF.FLGPROVISORIO, '+
//                     ' BF.PERCPROVISORIO,PRAZOPROVISORIO, NVL(EL.TEMPOSERVTOTAL,0) TEMPOSERVTOTAL, '+  //Everson TIBERO
                     ' BF.PERCPROVISORIO,BF.PRAZOPROVISORIO, NVL(EL.TEMPOSERVTOTAL,0) TEMPOSERVTOTAL, '+ //Everson TIBERO
                     '  NVL(EL.TEMPOSERVTOTMES,0) TEMPOSERVTOTMES, '+
                     '  NVL(EL.TEMPOSERVTOTDIA,0) TEMPOSERVTOTDIA, '+                     
                     ' BF.NUMEROPROCESSO , BF.IDBENEFICIO  '+
                     ' FROM   ELEGPATRO EL,PARTPREVPLAN PP,PESSOAFISICA PF,SITFUNC SF, '+
                     ' BENEFPLANOPART BPL, BENEFBFCIARIO BF'+
                     ' WHERE  (PP.IDPESSOA    = ' + qrytitular.FieldByName('IdTitular').AsString+') '+
                     ' AND    (PP.IDPESSJUR   = ' + qrytitular.FieldByName('IdPessJur').AsString+') '+
                     ' AND    (PP.IDPLANOPREV = ' + qrytitular.FieldByName('IdPlanoPrev').AsString+') '+
                     ' AND    (BF.IDBENEFICIO = '+ qrytitular.FieldByName('IdBeneficio').AsString+') '+
                     ' AND    (BF.IDPESSOA = '+qrytitular.FieldByName('IdPessoa').AsString+') '+
                     ' AND    (BF.NUMEROPROCESSO  = '+qrytitular.FieldByName('NumeroProcesso').AsString+')  '+
                     ' AND    (BF.SEQPROPOSTA = '+qrytitular.FieldByName('SeqProposta').AsString+' ) '+
                     ' AND    (BF.IDTITULAR = EL.IDPESSOA) '+
                     ' AND    (BF.IDPESSJUR = EL.IDPESSJUR )'+
                     ' AND    (BF.SEQPROPOSTA = PP.SEQPROPOSTA) '+
                     ' AND    (BF.IDPLANOPREV = PP.IDPLANOPREV) '+
                     ' AND    (EL.IDPESSOA    = PP.IDPESSOA)'+
                     ' AND    (EL.IDPESSJUR   = PP.IDPESSJUR)'+
                     ' AND    (PF.IDPESSOA(+)    = EL.IDPESSOA)'+
                     ' AND    (EL.IDSITFUNC   = SF.IDSITFUNC )'+
                     ' AND    (BF.IDBENEFICIO = BPL.IDBENEFICIO(+)) '+
                     ' AND    (BF.IDPESSOA  = BPL.IDPESSOA(+) )'+
                     ' AND    (BF.IDPESSJUR = BPL.IDPESSJUR(+) )'+
                     ' AND    (BF.IDPLANOPREV = BPL.IDPLANOPREV(+) )'+
                     ' AND    (BF.SEQPROPOSTA = BPL.SEQPROPOSTA(+))' ;

        qryregrain.Close;
        qryregrain.SQL.Clear;
        qryregrain.SQL.Add(sSQLRegra);
        DecimalSeparator := cAux;
        try
           qryregrain.Open;
        except
           DecimalSeparator := cAux;
           //erro
        end;

     end;
   end;

//-------------------------------------//--------------------------------------//
   function AtualizaReserva(sIdPatro,sIdreserva,sIdPlanoprev,sIdpessoa,sSeqProposta,
                            Tipo,sValorResultado, MesRef : string) : boolean;
   begin

      result := false;

      qryreserva.Close;
      qryreserva.SQL.clear;
      qryreserva.SQL.add(' UPDATE RESERVAPART SET VALORRESERVA = '+sValorResultado+'  ,'+
                     ' DATAREFERENCIASA = SYSDATE '+
                     ' WHERE (IDPLANOPREV = '''+sIdplanoprev+''') '+
                     ' AND (IDTIPORESERVA = '''+sIdreserva+''') '+
                     ' AND (IDPESSJUR = '''+sIdPatro+''') '+
                     ' AND (IDPESSOA = '''+sIdpessoa+''') '+
                     ' AND (SEQPROPOSTA = '''+sSeqProposta+''') ');
      try
         qryreserva.ExecSQL;
      except
         Exit;
      end;

      result := True;

   end;


//-------------------------------------//--------------------------------------//
   function EncontraReserva(sIdPatro,sIdreserva,sIdPlanoprev,sIdpessoa,sSeqProposta : string) : boolean;
   begin
      result := false;
      //pega reserva de origem
      qryAux.Close;
      qryAux.SQL.clear;
      qryAux.SQL.add(' SELECT P.DATAREFERENCIASA, P.PERCENTUALSAQUE , P.VALORRESERVA, ''P'' TIPO ,'+
//                     ' INDICEREAJUSTE, NOME, P.IDEMPRESAPROP, '+   //Everson TIBERO
                     ' R.INDICEREAJUSTE, R.NOME, P.IDEMPRESAPROP, '+ //Everson TIBERO
                     ' P.PLANO,P.PLACONTAD,P.PLACONTAC, '+
                     ' EL.MATRICULA, PV.INSCRICAONUMERO '+
                     ' FROM RESERVAPART P, RESERVAXPLANO R , MOEDA , ELEGPATRO EL, PARTPREVPLAN PV'+
                     ' WHERE (P.IDPLANOPREV   = '''+sIdplanoprev+''') '+
                     ' AND   (P.IDTIPORESERVA = '''+sIdreserva+''') '+
                     ' AND   (P.IDPESSJUR     = '''+sIdPatro+''') '+
                     ' AND   (P.IDPESSOA      = '''+sIdpessoa+''') '+
                     ' AND   (P.SEQPROPOSTA   = '''+sSeqProposta+''') '+
//                     ' AND   (FLGATIVO        = 1) '+ //Everson TIBERO
                     ' AND   (P.FLGATIVO        = 1) '+ //Everson TIBERO
                     ' AND   (R.IDPLANOPREV   = P.IDPLANOPREV)  '+
                     ' AND   (EL.IDPESSOA     =  P.IDPESSOA) '+
                     ' AND   (EL.IDPESSJUR    = P.IDPESSJUR) '+
                     ' AND   (PV.IDPESSOA     = P.IDPESSOA) '+
                     ' AND   (PV.IDPESSJUR    = P.IDPESSJUR) '+
                     ' AND   (PV.IDPLANOPREV  = P.IDPLANOPREV) '+
                     ' AND   (R.IDTIPORESERVA = P.IDTIPORESERVA) '+
//                     ' AND   (INDICEREAJUSTE  = MOEDA.MOECODIGO(+)) '+ //Everson TIBERO
                     ' AND   (R.INDICEREAJUSTE  = MOEDA.MOECODIGO(+)) '+ //Everson TIBERO
                     ' UNION  '+
                     ' SELECT P.DATAREFERENCIASA, P.PERCENTUALSAQUE , P.VALORRESERVA, ''C'' TIPO , '+
//                     ' INDICEREAJUSTE, NOME , '+   //Everson TIBERO
                     ' R.INDICEREAJUSTE, R.NOME , '+ //Everson TIBERO
                     ' P.IDEMPRESAPROP, '+
                     ' P.PLANO,P.PLACONTAD,P.PLACONTAC, '+
                     ' '''' MATRICULA, 0 INSCRICAONUMERO '+
                     ' FROM RESERVAPART P, RESERVAXPLANO R , MOEDA '+
                     ' WHERE (P.IDPLANOPREV = '''+sIdplanoprev+''') '+
                     ' AND (P.IDTIPORESERVA = '''+sIdreserva+''') '+
                     ' AND (P.IDPESSJUR     = '''+sIdPatro+''') '+
                     ' AND (P.SEQPROPOSTA   = '''+sSeqProposta+''') '+
                     ' AND (P.FLGATIVO      = 1) '+
                     ' AND (P.IDPESSJUR     = P.IDPESSOA) '+
                     ' AND (R.IDPLANOPREV   = P.IDPLANOPREV) '+
                     ' AND (R.IDTIPORESERVA = P.IDTIPORESERVA) '+
//                     ' AND (INDICEREAJUSTE  = MOEDA.MOECODIGO(+)) '); //Everson TIBERO
                     ' AND (R.INDICEREAJUSTE  = MOEDA.MOECODIGO(+)) '); //Everson TIBERO
      qryAux.open;

      if qryAux.IsEmpty
      then Exit
      else Result := True;
   end;
begin
//-------------------------------------//--------------------------------------//
//----------------------------INICIO DA FUNCAO MOVERESERVA---------------------//
//-------------------------------------//--------------------------------------//

   Result   := 0;
   bErro    := False;
   sMsgErro := '';


  // Renato Visoni SOL SOL 124089 Kintana 693423
  if psDtAlimentaReserva <> '' then begin
    sDataAlimentaReserva := psDtAlimentaReserva
  end else begin
    sDataAlimentaReserva := FormatDateTime('dd/mm/yyyy', Date);
  end;
  // Renato Visoni SOL 124089 Kintana 693423



   //testa se é um evento ligado a um benefício
   //e valida dados necessários
   if (sIdbeneficio <> '') then
   begin
     if (iTotalBeneficiarios  <=0) then
       sOpBenef := 'Número total de beneficiários';

     if (sNumProcesso = '') and (sOpBenef = '') then
       sOpBenef := 'Número do Processo'
     else
       if (sNumProcesso = '') and (sOpBenef <> '') then
         sOpBenef := sOpBenef+ ' ,Número do processo';

     if (sDtDireito = '') and (sOpBenef = '') then
       sOpBenef := 'Data de Direito do Benefício'
     else
       if (sDtDireito = '') and (sOpBenef <> '') then
         sOpBenef := sOpBenef +' ,Data de Direito do Benefício';

     if sOpBenef <> '' then
     begin
       sMsgErro := 'Parâmetros da movimentação de reserva não preenchidos ==> '+sOpBenef+'.';
       Exit;
     end;
   end;

   qryAux                    := Twwquery.Create(Application);
   qryAux.DatabaseName       := 'BaseDados';

   qryAuxContab              := Twwquery.Create(Application);
   qryAuxContab.DatabaseName := 'BaseDados';

   qryReserva                := Twwquery.Create(Application);
   qryReserva.DatabaseName   := 'BaseDados';

   qryRegraIn                := Twwquery.Create(Application);;
   qryRegraIn.DatabaseName   := 'BaseDados';

   qryTitular                := Twwquery.Create(Application);;
   qryTitular.DatabaseName   := 'BaseDados';

   
   Regra.QueryIn             := qryRegraIn;

   IdLote                    := LeUltRegistro (qryAux,'CTRLINTERFACE');

   sOpcoes := '';

   if sIdpessjurorig <> '' then
   begin
      sOpcoes := sOpcoes + ' AND (M.IDPATROORIG = '+sIdpessjurorig+') ';
   end;

   if sIdpessjurdest <> '' then
   begin
      sOpcoes := sOpcoes + ' AND (M.IDPATRODEST = '+sIdpessjurdest+') ';
   end;

   if sIdplanodest <> '' then
   begin
      sOpcoes := sOpcoes + ' AND (M.IDPLANOPREVDEST = '+sIdplanodest+') ';
   end;

   if sIdplanoorig <> '' then
   begin
      sOpcoes := sOpcoes + ' AND (M.IDPLANOPREVORIG = '+sIdplanoorig+') ';
   end;

   if sIdtiporeservaorig <> '' then
   begin
      sOpcoes := sOpcoes + ' AND (M.IDTIPORESERVAORIG = '+sIdtiporeservaorig+') ';
   end;

   if sIdtiporeservadest <> '' then
   begin
      sOpcoes := sOpcoes + ' AND (M.IDTIPORESERVADEST = '+sIdtiporeservadest+') ';
   end;

   if sIdBeneficio <> '' then
   begin
      sOpcoes := sOpcoes + ' AND (BENEFICIO.IDBENEFICIO = '+sIdBeneficio+') ';
   end;

   qryMov.Close;
   qryMov.SQL.clear;
   qryMov.SQL.add(' SELECT M.IDMOVIMENTO,M.IDEVENTOGERADOR, M.IDBENEFICIO , M.IDPATROORIG,'+
                  ' M.IDPATRODEST , M.IDPLANOPREVORIG, M.IDPLANOPREVDEST, M.IDTIPORESERVAORIG, '+
                  ' M.IDTIPORESERVADEST, M.IDREGRA, M.IDREGRAVALIDACAO, P.NOME RESERVAORIGEM, '+
                  ' C.NOME RESERVADESTINO, EV.NOME EVENTO , PORI.NOME PATROORIGEM , PDEST.NOME PATRODESTINO,'+
                  ' PLDEST.NOME PLANODESTINO , PLORI.NOME PLANOORIGEM , BENEFICIO.NOME BENEFICIO, REGRA.NOMEREGRA,'+
                  ' REGRAVAL.NOMEREGRA REGRAVAL, M.SEQMOV '+
                  ' FROM MOVRESERVA M, RESERVAXPLANO P , RESERVAXPLANO C, EVENTOGERADOR EV, '+
                  ' PESSOA PORI , PESSOA PDEST , PLANPREV PLORI , PLANPREV PLDEST, BENEFICIO , '+
                  ' REGRA , REGRA REGRAVAL '+
                  ' WHERE (M.IDEVENTOGERADOR = :idevento) '+
                  ' AND (M.IDEVENTOGERADOR = EV.IDEVENTOGERADOR) '+
                  ' AND (P.IDTIPORESERVA = M.IDTIPORESERVAORIG) '+
                  ' AND (P.IDPLANOPREV = M.IDPLANOPREVORIG )      '+
                  ' AND (C.IDTIPORESERVA = M.IDTIPORESERVADEST) '+
                  ' '+sOpcoes+' '+
                  ' AND (C.IDPLANOPREV = M.IDPLANOPREVDEST) '+
                  ' AND (BENEFICIO.IDBENEFICIO(+) = M.IDBENEFICIO) '+
                  ' AND (PLORI.IDPLANOPREV = M.IDPLANOPREVORIG) '+
                  ' AND (PLDEST.IDPLANOPREV = M.IDPLANOPREVDEST) '+
                  ' AND (PORI.IDPESSOA = M.IDPATROORIG) '+
                  ' AND (PDEST.IDPESSOA = M.IDPATRODEST) '+
                  ' AND (REGRA.IDREGRA = M.IDREGRA) '+
                  ' AND (REGRAVAL.IDREGRA(+) = M.IDREGRAVALIDACAO) '+
                  ' ORDER BY M.SEQMOV ');
   try
      qryMov.parambyname('idevento').AsString := sIdevento;
      qryMov.open;
   except
      raise;
   end;

   // Se tiver padrao de movimentacao de reserva, fazer o movimento pelo padrao
   // Senao Se for movimento de beneficio
   //       Entao fazer o movimento básico de reserva
   if qryMov.IsEmpty then // -> nao tem padrao de movimentacao
   begin
     if sIdBeneficio =  '' then
     begin
       Result := 0;
       sMsgErro := 'Não existem padrões de movimentação de reservas nos parâmetros informados.';
     end
     else
     begin
       // Buscar o valor da reserva em cotas
       if Trim(psValorReservaCotas) = '' then
       begin
         qryAux.Close;
         qryAux.SQL.Clear;
     //    qryAux.SQL.Add(' SELECT VALORRESERVA FROM RESERVAPART '+
     //    qryAux.SQL.Add(' SELECT NLV(VALORRESERVA,0) FROM RESERVAPART '+    // SIG 129320 Ferrari
         qryAux.SQL.Add(' SELECT NLV(VALORRESERVA,0) as VALORRESERVA FROM RESERVAPART '+    //edilaine - SIG 130377
                        ' WHERE  IDPESSJUR     = '+sIdPessJurOrig+
                        ' AND    IDPLANOPREV   = '+sIdPlanoOrig+
                        ' AND    IDPESSOA      = '+sIdPessoa+
                        ' AND    SEQPROPOSTA   = '+sSeqPropostaOrig+
                        ' AND    IDTIPORESERVA = '+sIdTipoReservaOrig);
         qryAux.Open;
         if not qryAux.IsEmpty
         then sValorReserva := ClienteNumero(qryAux.FieldByName('ValorReserva').AsString)
         else sValorReserva := '0';
         qryAux.Close;

         sValorReserva := OraNumero(FloatToStr(StrToFloat(sValorReserva) - StrToFloat(sValorMov) ) );
       end
       else
         sValorReserva := psValorReservaCotas;

       
       sMesRef := Copy(FormatDateTime('dd/mm/yyyy', DataRefMov),7,4) + '/' +             
                  Copy(FormatDateTime('dd/mm/yyyy', DataRefMov),4,2);                    

       if not AlimentaHistorico( qryMov,
                                 sIdPessJurOrig,         sIdPlanoOrig,
                                 sIdTipoReservaOrig,     sIdPessoa,
                                 sSeqPropostaOrig,       sValorMov,
                                 sValorReserva,          sIdBeneficio,
                                 '',
                                 sIdEvento,
                                 '',
                                 sMesRef,
                                 0,
                                 StrToDate(sDataAlimentaReserva), //Date,  // Renato Visoni SOL 124089 Kintana 693423
                                 False,                  // bExcedente
                                 DataRefIndice,          // DataRefIndice
                                 sIdPessoa,
                                 iIdHistorico) then      // IdParticipante
       begin
         Result := 0;
         sMsgErro := 'Erro na alimentação do histórico de reserva';
       end;
     end;

     Result := 2;
     Exit; // sair de qualquer forma, pois só é para continuar se tiver padrão de movimentação
   end;//if

   // Se o Valor a Movimentar (sValorMov) estiver ZERADO, e houver padrão de movimentação,
   // então movimentar 100% das reservas
   if Trim(sValorMov) = '' then sValorMov := '0';

   sValorMovOriginal := sValorMov;

   qrymov.first;
   Contador := 0;
   ordem := 0;
   iTransCertas := 0;

   
   sDataref := FormatDateTime('dd/mm/yyyy', datarefmov); 

   //testa par6ametro datarefindice
   try
     
     sDataAux := FormatDateTime('dd/mm/yyyy', datarefindice); 

     if sDataAux = '' then DataRefIndice := datarefmov;
   except
     DataRefIndice := datarefmov;
   end;

   bAtualizaOrigem := True;
   while not qryMov.EOF do
   begin
      inc(contador);
      blista := false;


      sIdpatroorig      := qrymov.FieldByName('IDPATROORIG').AsString;
      sIdpatrodest      := qrymov.FieldByName('IDPATRODEST').AsString;
      sIdplanoprevorig  := qrymov.FieldByName('IDPLANOPREVORIG').AsString;
      sIdplanoprevdest  := qrymov.FieldByName('IDPLANOPREVDEST').AsString;
      sIdreservaorig    := qrymov.FieldByName('IDTIPORESERVAORIG').AsString;
      sIdreservadest    := qrymov.FieldByName('IDTIPORESERVADEST').AsString;
      sIdregra          := qrymov.FieldByName('IDREGRA').AsString;
      sIdregraValidacao := qrymov.FieldByName('IDREGRAVALIDACAO').AsString;
      sseqpropostadest  := '1';
      sseqpropostaorig  := '1';

      // reserva origem
      if not EncontraReserva(sIdPatroorig,sIdreservaorig,sIdPlanoprevorig,sIdpessoa,sSeqPropostaorig) then
      begin
         // erro- não encountrou reserva
         sMsgErro := 'Reserva de Origem não encontrada ';
         bLista   := True;
         bErro    := True;
         qrymov.next;
         Continue;
      end;

      //procura campos de integração contábil
      //um nível acima da reservapart
      qryauxcontab.Close;
      qryauxcontab.SQL.clear;
      qryauxcontab.SQL.add(' SELECT  '+
                           ' PLANO,PLACONTAD,PLACONTAC '+
                           ' FROM RESERVAXPLANO  '+
                           ' WHERE IDPLANOPREV = '+sIdplanoprevOrig+' AND IDTIPORESERVA = '+sIdreservaOrig+' ');
      qryauxcontab.open;


      //verifica campos abrigatórios para contabilidade, se integrado
      if bIntegraContab then
      begin
         if not VerificaCamposObrigContab(qryreserva,qryaux,qryauxcontab,sIncompl) then
         begin
            sMsgErro := 'Reserva de origem - '+sIncompl;
            bLista := True;
            bErro := True;
            qrymov.next;
            Continue;
         end;
      end;

      
      dataref := FormatDateTime('dd/mm/yyyy', date); 

      mesref := copy(dataref,7,4)+'/'+copy(dataref,4,2);
      mescobranca := mesref;

      if qryAux.FieldByName('tipo').AsString = 'P' then
      begin
        matricula := qryAux.FieldByName('matricula').AsString;
        inscricao := qryAux.FieldByName('inscricaonumero').AsString;
      end
      else
      begin
        matricula := '';
        inscricao := '';
      end;

      codcentrorespon := qryAux.FieldByName('codcentrorespon').AsString;
      idempresaprop   := qryAux.FieldByName('idempresaprop').AsString;
      codcentrocustod := qryAux.FieldByName('codcentrocustod').AsString;
      codcentrocustoc := qryAux.FieldByName('codcentrocustoc').AsString;
      plano           := qryAux.FieldByName('plano').AsString;
      placontad       := qryAux.FieldByName('placontad').AsString;
      placontac       := qryAux.FieldByName('placontac').AsString;

      if not qryauxcontab.isempty then
      begin
        if idempresa = ''       then idempresa       :=  qryauxcontab.FieldByName('idempresa').AsString;
        if codcentrorespon = '' then codcentrorespon := qryauxcontab.FieldByName('codcentrorespon').AsString;
        if idempresaprop = ''   then idempresaprop   := qryauxcontab.FieldByName('idempresaprop').AsString;
        if codcentrocustod = '' then codcentrocustod := qryauxcontab.FieldByName('codcentrocustod').AsString;
        if codcentrocustoc = '' then codcentrocustoc := qryauxcontab.FieldByName('codcentrocustoc').AsString;
        if plano = ''           then plano           := qryauxcontab.FieldByName('plano').AsString;
        if placontad = ''       then placontad       := qryauxcontab.FieldByName('placontad').AsString;
        if placontac = ''       then placontac       := qryauxcontab.FieldByName('placontac').AsString;
      end;

      cAux := DecimalSeparator;
      DecimalSeparator := '.';

      if qryAux.FieldByName('valorreserva').AsString = ''
      then  sValorReserva := '0'
      else  sValorReserva := qryAux.FieldByName('valorreserva').AsString;

      sIndiceReajuste := qryAux.FieldByName('indicereajuste').AsString;
      if sIndiceReajuste = '' then
      begin
         sMsgErro := 'Indice de Reajuste da Reserva Origem não Cadastrado ';
         bLista   := True;
         bErro    := True;
         qrymov.next;
         DecimalSeparator := cAux;
         Continue;
      end;

      Tipo    := qryAux.FieldByName('tipo').AsString;
      sMesRef := '';

      if sIdreservaOrig <> sIdreservaaux
      then sValorMov := sValorMovOriginal;
      sValorMov := OraNumero(sValorMov);

      // Se o Valor a Movimentar (sValorMov) estiver ZERADO, e houver padrão de movimentação,
      // então movimentar 100% das reservas
      
      if StrToFloat(ClienteNumero(sValorMov)) <= 0 then
        
        sValorMov := truncaround(floattostr(strtofloat(sValorReserva) / VoltaValorCotacao(qryaux,sIndiceReajuste,sidplanoprevorig, sidtiporeservaorig,FormatDateTime('dd/mm/yyyy', DataRefIndice))),8);
      




      //valor da regra em cotas
      
      
      
      sValorRegraCotas := truncaround(floattostr(strtofloat(sValorMov) / VoltaValorCotacao(qryaux,sIndiceReajuste,sidplanoprevorig, sidtiporeservaorig,FormatDateTime('dd/mm/yyyy', DataRefIndice))),8);
      

      //atualiza reserva de origem, diminuindo o valor em cotas resultado da regra

      //valor resultante em cotas
      sValorResultado := truncaround(floattostr(strtofloat(sValorReserva) - strtofloat(sValorRegraCotas)),8);

      //valor resultante em moeda
      
      
      sValorReservaReal := truncaround(floattostr(strtofloat(sValorReserva) * VoltaValorCotacao(qryaux,sIndiceReajuste,sidplanoprevorig, sidtiporeservaorig,FormatDateTime('dd/mm/yyyy', DataRefIndice)) - strtofloat(sValorMov)),2);
      

      //caso seja um atransferência total
      //para evitar erros nos arredondamentos
      if trunc(strtofloat(sValorReservaReal)) <= 0  then
      begin
         sValorResultado := '0.000000000000';
         sValorRegraCotas := sValorReserva;
      end;

      //pega o result da regra de cálculo
      // que será em cotas na mesma noeda da reserva de origem
      // e passa para moeda corrente
      
      DecimalSeparator := cAux;



      //verifica se a reserva destino está relacionada ao participante
      //se não está, então relaciona
      if not EncontraReserva(sIdPatrodest,sIdreservadest,sIdPlanoprevdest,sIdpessoa,sSeqPropostadest) then
      begin

         //testa elegível
         qryAux.Close;
         qryAux.SQL.clear;
         qryAux.SQL.add(' SELECT IDPESSOA FROM ELEGPATRO WHERE IDPESSOA = '''+sidpessoa+''' AND IDPESSJUR = '''+sIdPatrodest+''' ');
         qryAux.open;

         if qryAux.isempty then
         begin
            sMsgErro := '      Pessoa não é elegível da Patrocinadora Destino ';
            bLista := True;
            bErro := True;
            qrymov.next;
            DecimalSeparator := cAux;
            Continue;
         end;

         //testa participante
         qryAux.Close;
         qryAux.SQL.clear;
         qryAux.SQL.add(' SELECT IDPESSOA FROM PARTPREVPLAN WHERE  '+
                        ' (IDPESSOA = '''+sidpessoa+''') AND (IDPESSJUR = '''+sIdPatrodest+''') AND '+
                        ' (IDPLANOPREV = '''+sidplanoprevdest+''') ');
                        if sseqpropostadest <> '' then
                        qryAux.SQL.add(' AND (SEQPROPOSTA = '+sseqpropostadest+') ');
         qryAux.open;

         if qryAux.isempty then
         begin
            sMsgErro := '      Pessoa não é Participante do Plano Destino ';
            bLista := True;
            bErro := True;
            qrymov.next;
            DecimalSeparator := cAux;
            Continue;
         end;

         //relaciona reserva destino ao participante
         if tipo = 'C' then
         sidpess := sidpatrodest
         else sidpess := sidpessoa;

         qryAux.Close;
         qryAux.SQL.clear;
         qryAux.SQL.add(' INSERT INTO RESERVAPART(IDPESSOA, ' +
                        'IDPARTICIPANTE, ' + 
                        'IDPESSJUR,IDPLANOPREV,IDTIPORESERVA,SEQPROPOSTA,FLGATIVO)  '+
                        ' VALUES('''+sidpess+''','''+
                        sidpess+''','''+ 
                        sIdPatrodest+''','+
                        ' '''+sidplanoprevdest+''','''+sIdreservadest+''','''+sseqpropostadest+''',1) ');
         try
            qryAux.ExecSQL;
         except
            sMsgErro := '      Erro na associação da Reserva Destino ao Participante ';
            bLista := True;
            bErro := True;
            qrymov.next;
            DecimalSeparator := cAux;
            Continue;
         end;
      end;//if encontra

      //reserva resultado
      if not EncontraReserva(sIdPatrodest,sIdreservadest,sIdPlanoprevdest,sIdpessoa,sSeqPropostadest) then
      begin
         //erro- não encountrou reserva
         sMsgErro := 'Reserva destino não foi encontrada ';
         bLista := True;
         bErro := True;
         qrymov.next;
         DecimalSeparator := cAux;
         Continue;
      end;

      //procura campos de integração contábil
      //um nível acima da reservapart
      qryauxcontab.Close;
      qryauxcontab.SQL.clear;
      qryauxcontab.SQL.add(' SELECT  '+
                           ' PLANO,PLACONTAD,PLACONTAC '+
                           ' FROM RESERVAXPLANO  '+
                           ' WHERE IDPLANOPREV = '+sIdplanoprevDest+' AND IDTIPORESERVA = '+sIdreservaDest+' ');
      qryauxcontab.open;

      //verifica campos abrigatórios para contabilidade destino,
      //se não estiverem ok, não atualiza a reserva origem
      //se integrado
      if bIntegraContab then
      begin
         if not VerificaCamposObrigContab(qryreserva,qryaux,qryauxcontab,sIncompl) then
         begin
            sMsgErro := 'Reserva Destino -  '+sIncompl;
            bLista := True;
            bErro := True;
            qrymov.next;
            Continue;
         end;
      end;

      inc(ordem);

      if bAtualizaOrigem then
      begin
        //se valor a ser retirado for maior que o valor da reserva origem, sai
        cAux := DecimalSeparator;
        DecimalSeparator := '.';

        
        if trunc(strtofloat(sValorReservaReal)) < 0 then
        begin
          
          
          sMsgErro   := '      Valor da tranferência é maior que o disponível na reserva de origem (Valor da Transferência:'+sValorMov+' - Valor Reserva:'+truncaround(floattostr(strtofloat(sValorReserva) * VoltaValorCotacao(qryaux,sIndiceReajuste,sidplanoprevorig, sidtiporeservaorig,FormatDateTime('dd/mm/yyyy', DataRefIndice))),2)+') ';
          

          bLista := True;
          bErro := True;
          qrymov.next;
          DecimalSeparator := cAux;
          Continue;
        end;

        DecimalSeparator := cAux;

        if tipo = 'C' then
          sidpess := sidpatroorig
        else
          sidpess := sidpessoa;

        //joga na tmpdesc origem
        qryreserva.Close;
        qryreserva.SQL.clear;
        qryreserva.SQL.add(' INSERT INTO TMPDESC(IDTITULAR,IDPESSJUR,IDPROVENTO,MESREFERENCIA, '           + #13 +
                           ' FLGTIPODESC,VALOR,IDPLANASS,IDDESCONTO, '                                     + #13 +
                           ' IDMOTIVO,MESCOBRANCA,IDPESSOA,IDPLANOPREV, '                                  + #13 +
                           ' MATRICULA,INSCRICAONUMERO,NUMPRIORIDADE,ORDEM,NUMDEPENDSEGURO, '              + #13 +
                           ' FLGDESCONTO,FLGDESCFOLHA,IDFUNDACAO,DATAREFERENCIA,SISTORIGEM, '              + #13 +
                           ' PLANO, PLACONTAD, PLACONTAC , IDEMPRESA , '                                   + #13 +
                           ' UNIDNEGOC, CODCENTRORESPON, IDEMPRESAPROP, CODSUBCONTA, '                     + #13 +
                           ' CODCENTROCUSTOD, CODCENTROCUSTOC,CODTIPDOC, RECPAG,CODTIPRECDES,NODOCUMENTO,' + #13 +
                           ' COMPLDOCUMENTO,IDLOTE,DATACOBRANCA,TIPCODIGO,SITENVIO,DESCRICAO,SEQPROPOSTA)' + #13 +
                           ' VALUES('+sidpess+','+sIdpatroorig+', '                                        + #13 +
                           ' :PROVENTO,'''+mesref+''',''O'','+sValorMov+', '                               + #13 +
                           ' '''','+sIdreservaorig+','''','''+mescobranca+''','+sIdpess+', '               + #13 +
                           ' '+sidplanoprevorig+','''+matricula+''',:inscricao, '                          + #13 +
                           ' ''0'','+inttostr(ordem)+',0,1,''O'','''',:DATAREF , '                         + #13 +
                           ' ''16'', '                                                                     + #13 +
                           ' :PLANO, :PLACONTAD, :PLACONTAC ,:IDEMPRESA, '                                 + #13 +
                           ' :UNIDNEGOC, :CODCENTRORESPON, :IDEMPRESAPROP, :CODSUBCONTA, '                 + #13 +
                           ' :CODCENTROCUSTOD, :CODCENTROCUSTOC, '                                         + #13 +
                           ' :CODTIPDOC, :RECPAG, :CODTIPRECDES, :NODOCUMENTO, '                           + #13 +
                           ' :COMPLDOCUMENTO,'+inttostr(idlote)+', :DATACOBRANCA , :TIPCODIGO,''0'', '     + #13 +
                           ' ''Transferência de Reservas'','''+sSeqPropostaorig+''' ) '                    + #13);

        try
          qryreserva.parambyname('INSCRICAO').AsString       := inscricao;
          qryreserva.parambyname('PROVENTO').AsString        := '';
          qryreserva.parambyname('PLANO').AsString           := plano;
          qryreserva.parambyname('PLACONTAD').AsString       := placontad;
          qryreserva.parambyname('PLACONTAC').AsString       := placontac;
          qryreserva.parambyname('IDEMPRESA').AsString       := idempresa;
          qryreserva.parambyname('UNIDNEGOC').AsString       := unidnegoc;
          qryreserva.parambyname('CODCENTRORESPON').AsString := codcentrorespon;
          qryreserva.parambyname('IDEMPRESAPROP').AsString   := idempresaprop;
          qryreserva.parambyname('CODSUBCONTA').AsString     :=codsubconta;
          qryreserva.parambyname('CODCENTROCUSTOD').AsString := codcentrocustod;
          qryreserva.parambyname('CODCENTROCUSTOC').AsString := codcentrocustoc;
          qryreserva.parambyname('CODTIPDOC').AsString       := '';
          qryreserva.parambyname('RECPAG').AsString          := 'P';
          qryreserva.parambyname('CODTIPRECDES').AsString    := '';
          qryreserva.parambyname('NODOCUMENTO').AsString     := '' ;
          qryreserva.parambyname('COMPLDOCUMENTO').AsString  := '';
          qryreserva.parambyname('TIPCODIGO').AsString       := '';
          
          
          qryreserva.parambyname('DATAREF').AsDate           := strtodate(dataref) ;
          qryreserva.parambyname('DATACOBRANCA').AsDate      := strtodate(dataref) ;
          qryreserva.ExecSQL;
        except
          sMsgErro := '      Erro no Envio da Contabilização da Reserva Origem ';
          bLista   := True;
          bErro    := True;
        end;

        //se encontrou a reserva desino então atualiza reserva origem
        if not AtualizaReserva(sIdPatroorig,sIdreservaorig,sIdPlanoprevorig,sIdpess,sSeqPropostaOrig,
                               Tipo,sValorResultado,sMesRef) then
        begin
          //erro
          sMsgErro := '      Erro na Atualização da reserva origem ';
          bLista   := True;
          bErro    := True;
        end;

        //alimenta o histórico de movimentações de reservas - origem
        if not AlimentaHistorico(qryreserva,sIdpatroorig,sIdplanoprevorig,sIdreservaorig, sIdpess,sSeqPropostaOrig,
               sValorRegracotas, sValorResultado,
               '','', sIdEvento,sIdregra,mesref,0,
               StrToDate(sDataAlimentaReserva), //Date,  // Renato Visoni SOL 124089 Kintana 693423
               false,DataRefIndice,sidpessoa, iIdHistorico) then

        begin
          //erro
          sMsgErro := '      Erro na Atualização do Histórico de Movimentação de Reservas - Origem ';
          bLista   := True;
          bErro    := True;
        end;
      end;//if atualiza

      cAux             := DecimalSeparator;
      DecimalSeparator := '.';

      if qryAux.FieldByName('valorreserva').AsString = '' then
        sValorReservaDestino := '0'
      else
        sValorReservaDestino := qryAux.FieldByName('valorreserva').AsString;

      sIndiceReajusteDestino := qryAux.FieldByName('indicereajuste').AsString;

      if sIndiceReajusteDestino = '' then
      begin
        sMsgErro := '      Indice de Reajuste da Reserva Destino não Cadastrado ';
        bLista   := True;
        bErro    := True;
        qrymov.next;
        DecimalSeparator := cAux;
        Continue;
      end;

      DecimalSeparator := cAux;
      Tipo             := qryAux.FieldByName('tipo').AsString;

      
      
      
      sMesRef          := '';


      if qryAux.FieldByName('tipo').AsString = 'P' then
      begin
        matricula := qryAux.FieldByName('matricula').AsString;
        inscricao := qryAux.FieldByName('inscricaonumero').AsString;
      end
      else
      begin
        matricula := '';
        inscricao := '';
      end;

      idempresa       :=  qryAux.FieldByName('idempresa').AsString;
      unidnegoc       :=  sunidnegoc; // já tratado na verificação de campos obrigatórios
      codcentrorespon := qryAux.FieldByName('codcentrorespon').AsString;
      idempresaprop   := qryAux.FieldByName('idempresaprop').AsString;
      codsubconta     := qryAux.FieldByName('codsubconta').AsString;
      codcentrocustod := qryAux.FieldByName('codcentrocustod').AsString;
      codcentrocustoc := qryAux.FieldByName('codcentrocustoc').AsString;
      plano           := qryAux.FieldByName('plano').AsString;
      placontad       := qryAux.FieldByName('placontad').AsString;
      placontac       := qryAux.FieldByName('placontac').AsString;

      if not qryauxcontab.isempty then
      begin
        if idempresa       = '' then idempresa       :=  qryauxcontab.FieldByName('idempresa').AsString;
        
        if codcentrorespon = '' then codcentrorespon := qryauxcontab.FieldByName('codcentrorespon').AsString;
        if idempresaprop   = '' then idempresaprop   := qryauxcontab.FieldByName('idempresaprop').AsString;
        if codsubconta     = '' then codsubconta     := qryauxcontab.FieldByName('codsubconta').AsString;
        if codcentrocustod = '' then codcentrocustod := qryauxcontab.FieldByName('codcentrocustod').AsString;
        if codcentrocustoc = '' then codcentrocustoc := qryauxcontab.FieldByName('codcentrocustoc').AsString;
        if plano           = '' then plano           := qryauxcontab.FieldByName('plano').AsString;
        if placontad       = '' then placontad       := qryauxcontab.FieldByName('placontad').AsString;
        if placontac       = '' then placontac       := qryauxcontab.FieldByName('placontac').AsString;
      end;

      //testa se a moeda das reservas é a mesma
      //if sIndiceReajuste = sIndiceReajusteDestino then
      //sValorResultado := formatfloat('#0.00',strtofloat(sValorMoedaCorrente) + strtofloat(sValorReservaDestino))
      //else


      //executa regras----------------------------------------------------------
      if sIdRegraValidacao <> '' then
      begin
         regra.RuleName := sIdRegraValidacao;
         try
         //preencher qryin
         PreencherQryIn(sValorReserva,sIndicereajuste,sValorReservaDestino,sIndiceReajusteDestino,True);
         Regra.Execute;
         except
            //erro na execução da regra
            sMsgErro := '      Erro na execução da regra de validação de Transferência de Reservas ';
            bLista := True;
            bErro := True;
         end;

         if not ((uppercase(Regra.Result) = 'FALSE') or
                (uppercase(regra.Result) = 'True')) then
         begin
           //erro no resulta do da regra de validação
           sMsgErro := '      Erro no resultado da regra de validação de Transferência de Reservas (Resultado:'+regra.result+') ';
           bLista := True;
           bErro := True;
         end;

         if uppercase(regra.Result) = 'FALSE' then
         begin
            //movimento não autorizado pela regra
            sMsgErro := '      Movimento não autorizado pela regra de validação de Transferência de Reservas ';
            bLista := True;
            bErro := True;
         end;

      end;

      regra.RuleName := sIdregra;
      try
         //preencher qryin
         PreencherQryIn(sValorReserva,sIndicereajuste,sValorReservaDestino,sIndiceReajusteDestino,False);
         Regra.Execute;
      except
         //erro na execução da regra
         sMsgErro := '      Erro na execução da regra de Cálculo de Transferência de Reservas ';
         bLista := True;
         bErro := True;
      end;

      if  (uppercase(Regra.Result) = 'FALSE') or
          (uppercase(regra.Result) = 'True') or
          (regra.Result = '') then
      begin
        //erro no resulta do da regra de validação
        sMsgErro := '      Erro no resultado da regra de Cálculo de Transferência de Reservas (Resultado:'+regra.result+') ';
        bLista := True;
        bErro := True;
      end
      else
      begin
         //fim execute regras------------------------------------------------------
         cAux := DecimalSeparator;
         DecimalSeparator := '.';

         //valor da regra(movimentação), que está em cotas
         sValorMoedaCorrente := regra.result ;

         if trunc(strtofloat(sValorMoedaCorrente)) <= 0  then
         begin
            sMsgErro := '     Erro no Valor ['+regra.result+'], resultado da regra de cálculo. É menor ou igual a zero.';
            bLista := True;
            bErro := True;
            qrymov.next;
            DecimalSeparator := cAux;
            Continue;
         end;

         //valor resulltante da reserva destino em cotas
         sValorResultado := truncaround(floattostr(strtofloat(sValorMoedaCorrente) + strtofloat(sValorReservaDestino) ),2);

         //valor da regra em moeda
         
         
         sValorReservaRealDestino   := truncaround(floattostr(strtofloat(sValorMoedaCorrente)*VoltaValorCotacao(qryaux,sIndiceReajusteDestino,sidplanoprevdest, sidtiporeservadest,FormatDateTime('dd/mm/yyyy', DataRefIndice))),2);
         

         
         //valor da movimentação em cotas
         
         

         
         DecimalSeparator := cAux;


         if tipo = 'C' then
         sidpess := sidpatrodest
         else sidpess := sidpessoa;

         inc(ordem);
         //joga na tmpdesc destino
         qryreserva.Close;
         qryreserva.SQL.clear;
         qryreserva.SQL.add(' INSERT INTO TMPDESC(idtitular,idpessjur,idprovento,mesreferencia, '+
                           ' flgtipodesc,valor,idplanass,iddesconto,'+
                           ' idmotivo,mescobranca,idpessoa,idplanoprev,'+
                           ' matricula,inscricaonumero,numprioridade,ordem,numdependseguro,'+
                           ' flgdesconto,flgdescfolha,idfundacao,datareferencia,sistorigem,'+
                           ' PLANO, PLACONTAD, PLACONTAC , IDEMPRESA ,'+
                           ' UNIDNEGOC, CODCENTRORESPON, IDEMPRESAPROP, CODSUBCONTA, '+
                           ' CODCENTROCUSTOD, CODCENTROCUSTOC,CODTIPDOC, RECPAG,CODTIPRECDES,NODOCUMENTO,'+
                           ' COMPLDOCUMENTO,IDLOTE,DATACOBRANCA,TIPCODIGO,SITENVIO, DESCRICAO, SEQPROPOSTA)'+
                           ' VALUES('+sidpess+','+sIdpatrodest+','+
                           ' :PROVENTO,'''+mesref+''',''O'','+sValorReservaRealDestino+','+
                           ' '''','+sIdreservadest+','''','''+mescobranca+''','+sIdpess+','+
                           ' '+sidplanoprevdest+','''+matricula+''',:inscricao,'+
                           ' ''0'','+inttostr(ordem)+',0,0,''O'','''',:DATAREF '+
                           ' ,''16'','+
                           ' :PLANO, :PLACONTAD, :PLACONTAC ,:IDEMPRESA,'+
                           ' :UNIDNEGOC, :CODCENTRORESPON, :IDEMPRESAPROP, :CODSUBCONTA, '+
                           ' :CODCENTROCUSTOD, :CODCENTROCUSTOC,'+
                           ' :CODTIPDOC, :RECPAG, :CODTIPRECDES,:NODOCUMENTO,'+
                           ' :COMPLDOCUMENTO,'+inttostr(idlote)+',:DATACOBRANCA , :TIPCODIGO,''0'','+
                           ' ''Transferência de Reservas'','''+sSeqPropostaDest+''' )');
         try

             qryreserva.parambyname('INSCRICAO').AsString := inscricao;
             qryreserva.parambyname('PROVENTO').AsString := '';
             qryreserva.parambyname('PLANO').AsString := plano;
             qryreserva.parambyname('PLACONTAD').AsString := placontad;
             qryreserva.parambyname('PLACONTAC').AsString := placontac;
             qryreserva.parambyname('IDEMPRESA').AsString := idempresa;
             qryreserva.parambyname('UNIDNEGOC').AsString := unidnegoc;
             qryreserva.parambyname('CODCENTRORESPON').AsString := codcentrorespon;
             qryreserva.parambyname('IDEMPRESAPROP').AsString := idempresaprop;
             qryreserva.parambyname('CODSUBCONTA').AsString :=codsubconta;
             qryreserva.parambyname('CODCENTROCUSTOD').AsString := codcentrocustod;
             qryreserva.parambyname('CODCENTROCUSTOC').AsString := codcentrocustoc;
             qryreserva.parambyname('CODTIPDOC').AsString := '';
             qryreserva.parambyname('RECPAG').AsString := 'R';
             qryreserva.parambyname('CODTIPRECDES').AsString := '';
             qryreserva.parambyname('NODOCUMENTO').AsString := '' ;
             qryreserva.parambyname('COMPLDOCUMENTO').AsString := '';
             qryreserva.parambyname('TIPCODIGO').AsString := '';
             
             qryreserva.parambyname('DATAREF').AsDate := strtodate(dataref) ;
             qryreserva.parambyname('DATACOBRANCA').AsDate := strtodate(dataref) ;
             qryreserva.ExecSQL;
         except
            sMsgErro := '      Erro no Envio da Contabilização Reserva Destino ';
            bLista := True;
            bErro := True;
         end;




         //atualiza reserva de destino
         if not AtualizaReserva(sIdPatrodest,sIdreservadest,sIdPlanoprevdest,sIdpess,sSeqPropostaDest,
                                Tipo,sValorResultado,sMesRef)
         then
         begin
            //erro
            sMsgErro := '      Erro na Atualização da reserva destino ';
            bLista := True;
            bErro := True;
         end;

         //atualiza histórico de movimentação de reservas - destino
         if not AlimentaHistorico(qryreserva,sIdpatrodest,sIdplanoprevdest,sIdreservadest, sIdpess,sSeqPropostaDest,
                sValorMoedaCorrente{valor da regra} , sValorResultado {valor em cotas do resultado},
                '','', sIdEvento,sIdregra,mesref,1,
                StrToDate(sDataAlimentaReserva), //Date,  // Renato Visoni SOL 124089 Kintana 693423
                false,DataRefIndice,sidpessoa, iIdHistorico)
         then
         begin
            //erro
            sMsgErro := '      Erro na Atualização do Histórico de Movimentação de Reservas - Destino ';
            bLista := True;
            bErro := True;
         end;
      end;//else erro regra


      if not bLista then
      begin
         sMsgErro := '      Sem Erros';
         iTransCertas := iTransCertas + 1;
      end;


      qrymov.next;
   end;//while

   qryAux.Close;
   qryreserva.Close;
   qryregrain.Close;
   qryauxContab.Close;
   qryAux.Free ;
   qryreserva.free;
   qryregrain.free ;
   qryauxContab.free;



   if (iTransCertas > 0) and (berro) then result := 1  //fez alguma certa, mas houve erros
   else if (iTransCertas > 0) and (not berro) then result := 2 //todas certas
   else if (iTransCertas = 0) then result := 3 ;  //não fez nenhuma certa
end;

function truncar(f:Double;n:integer):string;
var
 i:integer;
 Inteiro , Decimal : string;
begin
    Result:= floattostr(f);

    i:=pos(decimalseparator,result);
    if i <> 0 then
    begin
       Inteiro := copy(Result,1,i);
       Decimal := Copy(Result,i+1,n);
       Result := Inteiro+Decimal;
    end;
end;

function TruncaRound(f:string;n:integer):string;
var
 i,j:integer;


 rInteiro : Extended;
 cAux :Char;
begin
   cAux := DecimalSeparator;
   Result := (f);

   i:=pos(',',result);
   if i=0 then
   begin
      DecimalSeparator := '.';
      i:= pos('.',result);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   if (i <> 0) and (length(copy(result,i+1,length(result)))>n) then
   begin
       rInteiro := strtofloat(result);
       rInteiro := strtofloat(f)*power(10,n);
       j := pos(DecimalSeparator,floattostr(rinteiro));
       
       if j <> 0 then  rInteiro := ArredondaValor(floattostr(rinteiro));
       rInteiro := rInteiro/power(10,n);
       Result := copy(floattostr(rinteiro),1,i+n)
   end;
   DecimalSeparator := cAux;
end;

function ArredondaValor(Valor : string) : Extended;
var cAux : Char;
    i : Integer;
    sValorInt, sValorDec : string;
    dValorInt , dValorDec : Extended;
begin
   cAux := DecimalSeparator;

   if Valor = '' then
   begin
      Result := 0;
      exit;
   end;

   i:=pos(',',Valor);
   if i=0 then
   begin
      DecimalSeparator := '.';
      i:= pos('.',Valor);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   if i <> 0 then
   begin
      sValorInt := Copy(valor,0,i-1);
      sValorDec := Copy(valor,i+1,1);
      dValorInt := strtofloat(sValorInt);
      dValorDec := strtofloat(sValorDec);

      if dValorDec >= 5 then
      dValorInt := dValorInt + 1;
   end
   else dValorInt := StrToFloat(Valor);


   Result := dValorInt;
   DecimalSeparator := cAux;
end;


function PegaValorReservaPessoa(sidPessjur,sidPlanoPrev,
                                sidPessoa, sidReserva : string; qry : twwquery):Double;
begin
  with qry do
  begin
     close;
     SQL.Clear;
     SQL.Add('select NVL(ValorReserva,0) as VALORRESERVA from reservapart   '+        // SIG 129320 Ferrari
             'where  idpessjur     = '''+sidPessJur   +''''+
             'and    idplanoprev   = '''+sidPlanoprev +''''+
             'and    idpessoa      = '''+sidPessoa    +''''+
             'and    idtiporeserva = '''+sidReserva   +'''');
     open;
     result := qry.FieldByName('valorreserva').AsFloat;
     close;
  end;
end;

procedure CalcularReserva(var valorReserva,rValCota:extended;idplanoprev,idtiporeserva,idpessoa,idpessjur,data_cota:string;qryaux:TwwQuery);
var SQL,indice:string;
begin
     {Consulta o indice de reajuste de acordo com o plano e a reserva passados como
     parâmetro}
     SQL:='Select INDICEREAJUSTE  from RESERVAXPLANO where (IDPLANOPREV=' + idplanoprev + ')';
     SQL:=SQL + ' and (IDTIPORESERVA=' + idtiporeserva + ')';
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.add(SQL);
     qryAux.open;
     if qryAux.isempty then
     begin
          {Se reserva não foi encontrada retorna 0 para o valor da reserva
          e o valor da cota}
          valorReserva:=-1;
          rValcota:=-1;
     end
     else
     begin

          
          VerifIndiceHist(qryaux , indice, idplanoprev, idtiporeserva, data_cota );


          {Procura a cotação do índice da reserva encontrada para uma
          determinada data passada como parâmetro}
           indice:=qryAux.FieldByName('INDICEREAJUSTE').asstring;
           SQL:='SELECT COTDATA,COTVALOR ' +
                ' FROM   COTACAOMOEDA ' +
                ' WHERE  MOECODIGO = ' + indice + ' AND ' +
                '        COTDATA=TO_DATE(''' + data_cota + ''',''dd/mm/yyyy'')';
           qryAux.Close;
           qryAux.SQL.clear;
           qryAux.SQL.add(SQL);
           qryAux.open;

           if qryAux.isempty then
           begin
                // Se não existe valor para o índice procurado na data desejada
                // retorna valor 0 para a reserva e o valor cota
                valorReserva:=-1;
                rValCota:=-1;
           end
           else  begin

               {Busca o Valor da Reserva para uma determinada pessoa}
               {Retorna o Valor da cotação}
               rValCota := strtofloat(qryAux.FieldByName('COTVALOR').asstring);


               SQL:='SELECT NVL(VALORRESERVA,0) as VALORRESERVA FROM RESERVAPART WHERE IDPESSOA=';       // SIG 129320 Ferrari
               SQL:=SQL + idpessoa + ' AND IDPLANOPREV=' + idplanoprev;
               SQL:=SQL + ' AND IDTIPORESERVA=' + idtiporeserva;
               SQL:=SQL + ' AND IDPESSJUR=' + idpessjur;
               qryAux.Close;
               qryAux.SQL.clear;
               qryAux.SQL.add(SQL);
               qryAux.open;
               if qryAux.isempty then
                  {Se reserva não está associada a uma determinada pessoa}
                  valorReserva:=-1
               else
                   {Retorna o Valor da Reserva em Reais}
                   valorReserva:=strtofloat(qryAux.FieldByName('VALORRESERVA').asstring);
           end;
     end;

end;
function CalcularReservaCota(reValReal,valorReserva,rValCota:extended;opcao:integer;percentual:extended)
                   :Extended;
var rValAdicionarCotas:extended;
begin
    {Recebe como parâmetros o valor da reserva em reais,o valor a ser acrescido/diminuido,
     a opção que indica se será feito um acréscimo ou diminuição na reserva e
     o valor da cotação}

     rValAdicionarCotas := 0;  
     if (reValReal<0) or (valorReserva<0) or (rValcota<=0) then
                      result:=-1
     else  if (reValReal = 0) then
               result:=valorReserva/rValCota

  else begin
   { Calcula o novo Valor em Cotas para atualizar a RESERVAPART}

          if opcao = 0 then
          begin
             rValAdicionarCotas := ((reValReal * percentual) + valorReserva)
                                    / rValCota;
          end
          else
          begin
             rValAdicionarCotas := (valorReserva - (reValReal * percentual))
                                    / rValCota;

             if rValAdicionarCotas < 0 then
             begin
                MsgDlg('O valor a ser retirado deve ser menor ou igual ao valor da reserva.','Erro', mtError, [mbok],0);
                
                exit;
             end;

          end;
        { Transforma o Valor em Real para Valor em Cotas para Gravar:
          Soma o Valor em Real a adicionar + Valor atual da Reserva em Real e divide pelo valor da Cota}
          rValAdicionarCotas := StrToFloat(FormatFloat('#0.0000',rValAdicionarCotas));
   end;
   result:=rvalAdicionarCotas;
   //RETORNA O NOVO VALOR DA RESERVA EM COTAS
end;

function AdicionarReserva (   mesreferencia, sidContribuicao,
                              sidPlanoPrev,  sidPessJur,
                              sseqProposta,  sidPessoa,
                              data_cota                         : string;
                              ValRealAdicionar                  : Extended;
                              qryAux, qryReserva                : TwwQuery;
                              opcao                             : integer ) : boolean; // opcao : 0 = Adicionar , 1 = Remover
var SQL,sidtiporeserva,regra,strvalorReserva,strReValReal:string;
    qrytemp:TwwQuery;
    rValCota,valorReserva,reValcotasAdicionar:Extended;
    iIdHistorico : Longint; 

begin

  SQL:='Select IDTIPORESERVA,IDREGRACALCULORE,PERCENTUAL FROM RESERVAXCONTRIB WHERE ';
  SQL:=SQL + '(IDPLANOPREV=' + sidplanoprev + ') and (IDCONTRIBUICAO=';
  SQL:=SQL + sidcontribuicao + ')';
  qryreserva.Close;
  qryreserva.SQL.clear;
  qryreserva.SQL.Add(SQL);
  qryreserva.open;
  if qryreserva.IsEmpty then
  begin
     result:=false;
     exit;
  end;

  while not qryReserva.EOF do
  begin
     // Atualiza tabela RESERVAPART COM O NOVO VALOR DA RESERVA se o novo valor for positivo
     sIdTipoReserva := qryReserva.FieldByName('IDTIPORESERVA').AsString;
     Regra          := qryReserva.FieldByName('IDREGRACALCULORE').AsString;


     CalcularReserva( ValorReserva, rValCota, sidplanoprev, sidtiporeserva, sidpessoa, sidpessjur, data_cota, qryaux);

     revalCotasAdicionar := CalcularReservaCota ( ValRealAdicionar, ValorReserva * rValCota,
                                                  rValCota,         opcao,
                                                  qryreserva.FieldByName('Percentual').asfloat/100);
     ValorReserva        := reValCotasAdicionar;

     if (rValCota <= 0) 
     then begin
        MsgDlg('O valor da cota para alimentar reserva não foi encontrado. Verifique.',
               'Erro',mtError,[mbOk,mbHelp],0);
        Result := False;
        Exit;
     end;


       if (reValCotasAdicionar > 0) then 
       begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' UPDATE RESERVAPART SET VALORRESERVA = ' + OraNumero(FloatToStr(ValorReserva)) +
                 ' WHERE (IDTIPORESERVA = ' + sidTipoReserva + ') AND ' +
                 '       (IDPLANOPREV   = ' + sIdPlanoPrev + ') AND ' +
                 '       (IDPESSJUR     = ' + sIdPessJur   + ') AND ' +
                 '       (SEQPROPOSTA   = ' + sSeqProposta + ') AND ' +
                 '       (IDPESSOA      = ' + sIdPessoa + ')');
            try
               qryAux.ExecSQL;

            except
                   on E:EDBEngineError do
                   begin
                        MostrarErro(E);
                        result:=false;
                        Exit;
                   end;
            end;
            if qryAux.RowsAffected=0 then
            begin
                 result:=false;
                 exit;
            end;
            if sidpessoa<>sidpessjur then
            begin
              // Se reserva for individual atualiza hstcontribprev
               SQL:='Update HSTCONTRIBPREV SET FLGCALCRESERVA=1 WHERE ';
               SQL:=SQL + ' (IDPLANOPREV=' + sidplanoprev + ') and (IDPESSOA=' + sidpessoa;
               SQL:=SQL + ') and (IDPESSJUR=' + sidpessjur + ') and (SEQPROPOSTA=' + sseqproposta;
               SQL:=SQL + ') and (FLGCALCRESERVA=0) ';
               SQL:=SQL + ' and (MESREFERENCIA=''' + mesreferencia + ''') and (IDCONTRIBUICAO IN ';
               SQL:=SQL + ' (Select IDTIPORESERVA from RESERVAXCONTRIB where ';
               SQL:=SQL + ' (IDTIPORESERVA=' + sidtiporeserva + ')))';
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(SQL);
               try
                  qryAux.ExecSQL;
               except
                 on E:EDBEngineError do
                 begin
                  MostrarErro(E);
                  result:=false;
                  Exit;
                  end;
               end;
               
          end;
          strValorReserva:=floattostr(ValorReserva);
          strreValReal:=floattostr(revalCotasAdicionar * rValCota);

          // Insere registro no histórico de movimentação de reserva
          if not AlimentaHistorico(qryaux,
                  sidpessjur,
                  sidplanoprev,
                  sidtiporeserva,
                  sidpessoa,
                  sseqproposta,
                  strValorReserva,
                  strreValReal,
                  '',sidcontribuicao,'',
                  Trim(regra),mesreferencia,
                  1,strtodate('01/'+copy(mesreferencia,6,2)+'/'+copy(mesreferencia,1,4)),
                  false,StrtoDate(data_cota),sidpessoa, iIdHistorico)  then
              begin
                         result:=false;
                         exit;
               end;

       end
       else
       begin
           result:=false;
           exit;
       end;
       qryreserva.Next;
   end;
   // Refresh p/aparecer na tela o valor atualizado

  result:=True;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT 1 FROM DUAL ');
  qryAux.Open;
  qryAux.Close;
end;

function BuscaDataAlimentacao ( psMesReferencia, psIdContribuicao,
                                psIdPlanoPrev, psIdPessJur,
                                psSeqProposta,  psIdPessoa,
                                psValorAlimentadoEmReal     : string;
                                qryAux                      : TwwQuery ) : string;
begin
   Result := '';

   with qryAux do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT DATAALIMENTACAO FROM HISTMOVRESERVA ' +
             ' WHERE  IDPESSOA       = '   + psIdPessoa +
             '   AND  IDPESSJUR      = '   + psIdPessJur +
             '   AND  IDPLANOPREV    = '   + psIdPlanoPrev +
             '   AND  SEQPROPOSTA    = '   + psSeqProposta +
             '   AND  IDCONTRIBUICAO = '   + psIdContribuicao +
             '   AND  VLRREAL        = '   + OraNumero(FormatFloat('#0.00',StrToFloat(psValorAlimentadoEmReal))) +
             '   AND  MESREFERENCIA  = ''' + psMesReferencia+'''');
     Open;

     if not IsEmpty then
       Result := FieldByName('DataAlimentacao').AsString
     else
       
       Result   := FormatDateTime('dd/mm/yyyy', date); 

     Close;
   end;
end;

function AbateContribReserva ( psMesReferencia, psIdContribuicao,
                               psIdPlanoPrev, psIdPessJur,
                               psSeqProposta,  psIdPessoa,
                               psValorAlimentadoEmReal,
                               psDataAlimentacao     : string;
                               qryReservas, qryAux         : TwwQuery ) : boolean;
var sSQL : string;
    dValorCotasAtual,
    dSaldoReal, dSaldoCotas : double;
    rValorEmReal,
    rValorEmCota,
    rValorDaCota : double;
    qryAux1 : Twwquery;
    sAuxData: String; //BRUNO AZEVEDO SOL 145995 Kintana 1023814
begin
   qryAux1 := TwwQuery.Create(Application);
   qryAux1.DatabaseName := 'BaseDados';   

   Result := False;
   qryReservas.Close;
   qryReservas.SQL.Clear;
   qryReservas.SQL.Add(' SELECT RC.IDCONTRIBUICAO, RC.PERCENTUAL, RP.IDTIPORESERVA, RP.INDICEREAJUSTE '+
                       ' FROM   RESERVAXPLANO RP, RESERVAXCONTRIB RC'+
                       ' WHERE  RC.IDPLANOPREV    = '+psIdPlanoPrev+
                       ' AND    RC.IDCONTRIBUICAO = '+psIdContribuicao+
                       ' AND    RC.IDPLANOPREV    = RP.IDPLANOPREV   '+
                       ' AND    RC.IDTIPORESERVA  = RP.IDTIPORESERVA ');

   qryReservas.Open;
   while not qryReservas.EOF do
   begin
      rValorEmReal   := StrToFloat(ClienteNumero(psValorAlimentadoEmReal));
      
      // Verificar se a contribuicao alimentou essa reserva pela histmovreserva
      // pois ela pode estar com o flgcalcreserva = 1 porque alimentou uma
      // outra conta que náo esta que está sendo processada
      qryAux1.Close;
      qryAux1.SQL.Clear;
      
      qryAux1.SQL.Add(' SELECT * '+ 
                      ' FROM   HISTMOVRESERVA HM '+
                      ' WHERE  HM.IDPESSJUR      = '+psIdPessJur+
                      ' AND    HM.IDPLANOPREV    = '+psIdPlanoPrev +
                      ' AND    HM.IDPESSOA       = '+psIdPessoa+
                      ' AND    HM.SEQPROPOSTA    = '+psSeqProposta+
                      ' AND    HM.IDTIPORESERVA  = '+qryReservas.FieldByName('IdTipoReserva').AsString+
                      ' AND    HM.IDCONTRIBUICAO = '+psIdContribuicao+
                      ' AND    HM.FLGENTRADA     = 1 '+
                      ' AND    HM.MESREFERENCIA  = '''+psMesReferencia+'''');
      qryAux1.Open;
      if (qryAux1.IsEmpty) 
      then begin
         Result := True;
         Exit;
      end;


      

      
      While not qryAux1.EOF do
      Begin

        //BRUNO AZEVEDO SOL 145995 Kintana 1023814
        sAuxData := iif((trim(qryAux1.FieldByName('DATAALIMENTACAO').AsString) = ''),
                        'TO_DATE(''' + FormatDateTime('dd/mm/yyyy', date) + ''',''DD/MM/YYYY'')',
                        'TO_DATE('''+qryAux1.FieldByName('DATAALIMENTACAO').AsString+''',''DD/MM/YYYY'')');

        sSQL := ' INSERT INTO HISTMOVRESERVA( IDHISTRESERVA, IDTIPORESERVA,DATAALIMENTACAO,'+
                '                             VLRREAL,VLRCOTAS,IDBENEFICIO,IDCONTRIBUICAO,IDEVENTOGERADOR,'+
                '                             SALDOREAL, SALDOCOTAS, IDPLANOPREV, IDPESSOA, IDPESSJUR, '+
                '                             FLGENTRADA,IDREGRACALCULO,'+
                '                             PERCENTUAL, SEQPROPOSTA,IDPARTICIPANTE, '+
                '                             SALDOREALCONT,VALORINDICE,MESREFERENCIA,DATAMOV, DATAINDICE) '+
                ' VALUES(';

        sSQL := sSQL + IntToStr(LeUltRegistro(nil,'HISTMOVRESERVA'));
        sSQL := sSQL + ', ' + qryAux1.FieldByName('IDTIPORESERVA').AsString;
        sSQL := sSQL + ', ' + sAuxData; //BRUNO AZEVEDO SOL 145995 Kintana 1023814
        // SOL 167888 Kintana 1489782 -- Otacilio aquino ** Inicio **
        //if pos('-', qryAux1.FieldByName('VLRREAL').AsString) > 0 then // SOL 170679 Kintana 1534729
        //  sSQL := sSQL + ', ' + OraNumero(StringReplace(qryAux1.FieldByName('VLRREAL').AsString, '-', '', [rfReplaceAll])) // SOL 170679 Kintana 1534729
        //else // SOL 170679 Kintana 1534729
        sSQL := sSQL + ', '+OraNumero(qryAux1.FieldByName('VLRREAL').AsString);

        //if pos('-', qryAux1.FieldByName('VLRCOTAS').AsString) > 0 then // SOL 170679 Kintana 1534729
        //  sSQL := sSQL + ', ' + OraNumero(TruncaRound(StringReplace(qryAux1.FieldByName('VLRCOTAS').AsString, '-', '', [rfReplaceAll]),8)) // SOL 170679 Kintana 1534729
        //else // SOL 170679 Kintana 1534729
        sSQL := sSQL + ', '+OraNumero(TruncaRound(qryAux1.FieldByName('VLRCOTAS').AsString,8));
        // SOL 167888 Kintana 1489782 -- Otacilio aquino ** Fim **

        sSQL := sSQL + ', NULL ';
        sSQL := sSQL + ', '+qryAux1.FieldByName('IDCONTRIBUICAO').AsString;
        sSQL := sSQL + ', NULL ';
        sSQL := sSQL + ', '+OraNumero(qryAux1.FieldByName('SALDOREAL').AsString);
        sSQL := sSQL + ', '+OraNumero(TruncaRound(qryAux1.FieldByName('SALDOCOTAS').AsString,8));
        sSQL := sSQL + ', '+qryAux1.FieldByName('IDPLANOPREV').AsString;
        sSQL := sSQL + ', '+qryAux1.FieldByName('IDPESSOA').AsString;
        sSQL := sSQL + ', '+qryAux1.FieldByName('IDPESSJUR').AsString;
        sSQL := sSQL + ', 0';
        sSQL := sSQL + ', NULL';
        sSQL := sSQL + ', '+OraNumero(qryaux1.FieldByName('Percentual').AsString);
        sSQL := sSQL + ', '+qryaux1.FieldByName('SEQPROPOSTA').AsString;
        sSQL := sSQL + ', '+qryAux1.FieldByName('IDPESSOA').AsString;

        // SOL 167888 Kintana 1489782 -- Otacilio aquino ** Inicio **
        //if pos('-', qryAux1.FieldByName('SALDOREALCONT').AsString) > 0 then // SOL 170679 Kintana 1534729
        //  sSQL := sSQL + ', ' + OraNumero(StringReplace(qryAux1.FieldByName('SALDOREALCONT').AsString, '-', '', [rfReplaceAll])) // SOL 170679 Kintana 1534729
        ///else // SOL 170679 Kintana 1534729
        sSQL := sSQL + ', '+OraNumero(qryAux1.FieldByName('SALDOREALCONT').AsString);

        sSQL := sSQL + ', '+OraNumero(qryAux1.FieldByName('VALORINDICE').AsString);
        sSQL := sSQL + ', '''+qryAux1.FieldByName('MESREFERENCIA').AsString+'''';

        sSQL := sSQL + ', TO_DATE(''' + FormatDateTime('dd/mm/yyyy', date) + ''',''DD/MM/YYYY'')';
        sSQL := sSQL + ', TO_DATE(''' + qryAux1.FieldByName('DATAINDICE').AsString+''',''DD/MM/YYYY'')';
        sSQL := sSQL + ') ';

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSQL);
        try
           qryAux.ExecSQL;
        except
           exit;
        end;

  
        (*
        sSQL := ' UPDATE RESERVAPART SET VALORRESERVA = VALORRESERVA - '+OraNumero(FloatToStr(rValorEmCota))+
                ' WHERE  IDPESSOA       = '+psIdPessoa+
                ' AND    IDPESSJUR      = '+psIdPessJur+
                ' AND    IDPLANOPREV    = '+psIdPlanoPrev+
                ' AND    SEQPROPOSTA    = '+psSeqProposta+
                ' AND    IDTIPORESERVA  = '+qryReservas.FieldByName('IdTipoReserva').AsString;
        *)
        sSQL := ' UPDATE RESERVAPART SET VALORRESERVA = VALORRESERVA - '+OraNumero(qryAux1.FieldByName('VLRCOTAS').AsString)+
                ' WHERE  IDPESSOA       = '+qryAux1.FieldByName('IDPESSOA').AsString+
                ' AND    IDPESSJUR      = '+qryAux1.FieldByName('IDPESSJUR').AsString+
                ' AND    IDPLANOPREV    = '+qryAux1.FieldByName('IDPLANOPREV').AsString+
                ' AND    SEQPROPOSTA    = '+qryAux1.FieldByName('SEQPROPOSTA').AsString+
                ' AND    IDTIPORESERVA  = '+qryaux1.FieldByName('IDTIPORESERVA').AsString;

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSQL);
        try
           qryAux.ExecSQL;
        except
           exit;
        end;
        qryAux1.Next; 
      End;
      


      qryReservas.Next;
   end;
   qryReservas.Close;
   qryAux1.Free; 
   Result := True;
end;

function CalculaValorReserva ( qryAux             : TwwQuery;
                               psIdPlanoPrev, psIdTipoReserva : string;
                               piIdRegraCalculo   : Longint;
                               pdPercentual,      
                               pdValorAAlimentar  : double;
                               piIndiceAAlimentar : integer;
                               psDataRecebimento,
                               psDataABuscarCota  : string;
                               var pdValorCota    : double;
                               var sMsgErro       : string ) : double;
var
  dValorEmCota : double;
  sSQL,
  sValorRegra  : string;
  bErroRegra   : boolean;
begin
  Result       := 0;
  dValorEmCota := 0;
  sMsgErro     := '';

  
  
  

  if Trim(psDataRecebimento)   = '' then psDataRecebimento := FormatDateTime('dd/mm/yyyy', date);
  if Trim(psDataABuscarCota)   = '' then psDataABuscarCota := FormatDateTime('dd/mm/yyyy', date);
  

  pdValorCota := VoltaValorCotacao( qryAux,
                                    IntToStr(piIndiceAAlimentar),
                                    psIdPlanoPrev, psIdTipoReserva,
                                    psDataABuscarCota );

  if piIdRegraCalculo <= 0
  then begin          // ( valor em real  / valor cota )
     dValorEmCota :=  ( pdValorAAlimentar / pdValorCota )* pdPercentual / 100;
  end
  else begin
    sSQL := ' SELECT  '''+ PreparaStrRegra(psDataABuscarCota)+ ''' AS DATAREF,            '+
                           OraNumero(FloatToStr(pdValorAAlimentar))      +' AS VALORRECEBIDO,       '+
                           OraNumero(FloatToStr(pdPercentual))           +' AS PERCENTUAL,          '+
                       ''''+PreparaStrRegra(psDataRecebimento)                            + '''  AS DATARECEBIMENTO, '+
                           IntToStr(piIndiceAAlimentar)                  +' AS INDICEREAJUSTE       '+
            ' FROM DUAL ';

    sValorRegra := RegraNumerica(IntToStr(piIdRegraCalculo), sSQL ,bErroRegra, iIdCalculoGeral);

    if bErroRegra
    then begin
       sMsgErro := 'Erro na Execução da Regra de Alimentação de Reserva Nº '+IntToStr(piIdRegraCalculo);
       Exit;
    end;

    if (sValorRegra = '') or (sValorRegra = '0')
    then begin
       Result := 0;
       Exit;
    end;

    dValorEmCota := StrToFloat(ClienteNumero(sValorRegra));
  end;
  Result       := dValorEmCota;
end;

function  SomaAlteradorAlimentaReserva (qryAux           : TwwQuery;
                                        psMesReferencia,
                                        psMesCobranca    : string;
                                        piNumRecebimento,
                                        piIdMotivo,
                                        piIdContribuicao : Longint ) : double;
begin
   Result := 0;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT NVL(SUM(H.VALOR),0) VALOR                 '+
                  ' FROM   HSTATRASOCONTRIB H , ALTERADORXCONTRIB AL '+
                  ' WHERE  (H.MESREFERENCIA   =  '''+psMesReferencia          +''')  '+
                  ' AND    (H.MESCOBRANCA     =  '''+psMesCobranca            +''')  '+
                  ' AND    (H.NUMRECEBIMENTO  =  '+IntToStr(piNumRecebimento) +')    '+
                  ' AND    (H.IDMOTIVO        =  '+IntToStr(piIdMotivo)       +')    '+
                  ' AND    (AL.FLGATRASO      =  1)                                  '+
                  ' AND    (AL.IDCONTRIBUICAO =  '+IntToStr(piIdContribuicao) +')    '+
                  ' AND    (AL.CODALTERADOR   = H.CODALTERADOR)                      '+
                  ' AND    (AL.FLGCALCRESERVA = 1)                                   '+
//                  ' HAVING SUM(VALOR) IS NOT NULL                                    '); //Everson TIBERO
                  ' HAVING SUM(H.VALOR) IS NOT NULL                                    '); //Everson TIBERO
   qryAux.Open;

   if not qryAux.IsEmpty
   then Result := qryAux.FieldByName('Valor').AsFloat;
   qryAux.Close;
end;


(** valor q esta função trazia é o mesmo de dValorSaldoResReal
//Darivaldo Alencar - SOL 253577/17989 -  PPM 1198155 - inicio
function CalculaSALDOREALCONT
(idpessoa,idPessJur,idPlanoPrev,idTipoReserva: integer; dSALDOREALCONT:real):real;
var
   qry:TwwQuery;
begin
    qry:= TwwQuery.create(nil);
    qry.DatabaseName:= dtmBaseDados.dbBaseDados.DataBaseName;;
    qry.Close;
    qry.sql.Clear;
    qry.sql.add(' select SALDOREALCONT from HISTMOVRESERVA where IDHISTRESERVA ');
    qry.sql.add(' in (select max(IDHISTRESERVA) from HISTMOVRESERVA where '+
    ' idpessoa = '+IntToStr(idpessoa)+
    ' and IDTIPORESERVA='+IntToStr(idTipoReserva)+
    ' and IDPESSJUR='+ IntToStr(idPessJur)+
    ' and IDPLANOPREV='+ IntToStr(idPlanoPrev)+
     ')'
    );
    try
        qry.open;
        if not qry.IsEmpty then
           result :=  qry.Fields[0].AsCurrency + dSALDOREALCONT
        else
           result := dSALDOREALCONT;
    finally
        FreeAndNil(qry);
    end;
end;
//Darivaldo Alencar - SOL 253577/17989 -  PPM 1198155 - fim***)

function GeraHistMovReservaContribuicao ( qryAux                              : TwwQuery;
                                          piIdPessJur,       piIdPlanoPrev,
                                          piIdPessoa,        piSeqProposta,
                                          piIdTipoReserva,   piIdContribuicao,
                                          piIdEventoGerador, piIdRegra        : Longint;
                                          pdPercentual,
                                          pdValorMovCotas,   pdValorMovReal,
                                          pdValorSaldoResCotas,
                                          pdValorCota                          : double;
                                          psDataABuscarCota,
                                          psDataMovimento,
                                          psAnoMesReferencia                   : string;
                                          piFlgEntrada,
                                          piFlgProcedencia                     : word; // 0 - Alimentacao normal (evento, contribuicao ou beneficio)
                                                                                      // 1 - Alimentacao manual
                                          psDtAlimentaReserva : string = ''; // SOL 142663 Kintana 915068
                                          piIdPessoaOrigem: String = '';
                                          piIdPessoaDestino: String = '';
                                          psObservacao : string = '';
                                          dSALDOREALCONT :real = 0; //Darivaldo Alencar - SOL 253577/17989 -  PPM 1198155
                                          piNumRecebimento : Longint = -1     // Paulo Nobre - WO6161
                                          ) : boolean; //BRUNO AZEVEDO SOL KINTANA
var dValorSaldoResReal,
    dValorSaldoCont : double;

    iIdHistorico    : Longint;
    sSQL            : string;
    iFlgModoAtualizacao : integer;
    sAuxData: String; //BRUNO AZEVEDO SOL 145995 Kintana 1023814
    spAtlzS_PART: TwwStoredProc;//Darivaldo Alencar - SOL 253577/17989  PPM 1198155
begin
   Result := False;

   if pdValorMovCotas <= 0
   then begin
      Result := True;
      Exit;
   end;

   if (piFlgEntrada <> 0) and (piFlgEntrada <> 1) then exit;

   

   

   if Trim(psDataABuscarCota) = '' then psDataABuscarCota := FormatDateTime('dd/mm/yyyy', date);
   if Trim(psDataMovimento)   = '' then psDataMovimento   := FormatDateTime('dd/mm/yyyy', date);
   

   
   qryAux.Close;
   qryAux.SQL.clear;
   qryAux.SQL.add(' SELECT FLGMODATUALIZACAO, INDICECORRECAO, INDICEREAJUSTE '+
                  ' FROM   RESERVAXPLANO                                     '+
                  ' WHERE  IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)          +
                  ' AND    IDTIPORESERVA = '+IntToStr(piIdTipoReserva)        );
   try
      qryAux.open;
   except
      Exit;
   end;

   iFlgModoAtualizacao := qryAux.FieldByName('FLGMODATUALIZACAO').AsInteger;


   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT MAX(IDHISTRESERVA) , DATAMOV, SALDOREAL ,IDEVENTOGERADOR,IDBENEFICIO, '+
                  '        IDCONTRIBUICAO,VLRCOTAS,VLRREAL, SALDOREALCONT '+
                  ' FROM   HISTMOVRESERVA '+
                  ' WHERE  IDPESSJUR         = '+IntToStr(piIdPessJur)+
                  ' AND    IDPLANOPREV       = '+IntToStr(piIdPlanoPrev)+
                  ' AND    IDPESSOA          = '+IntToStr(piIdPessoa)+
                  ' AND    SEQPROPOSTA       = '+IntToStr(piSeqProposta)+
                  ' AND    IDTIPORESERVA     = '+IntToStr(piIdTipoReserva)+
                  ' GROUP BY DATAMOV, SALDOREAL,IDEVENTOGERADOR,IDBENEFICIO, '+
                  '        IDCONTRIBUICAO,VLRCOTAS,VLRREAL, SALDOREALCONT ');
   try
      qryAux.open;
   except
      Exit;
   end;

   if qryAux.isempty
   then dValorSaldoCont := pdValorMovReal
   else begin
      qryAux.Last;
      case piFlgEntrada of
            0: dValorSaldoCont := qryAux.FieldByName('SALDOREALCONT').AsFloat - pdValorMovReal;
            1: dValorSaldoCont := pdValorMovReal + qryAux.FieldByName('SALDOREALCONT').AsFloat;
      end;
   end;

   dValorSaldoResReal := pdValorSaldoResCotas * pdValorCota;

//BRUNO AZEVEDO SOL 145995 Kintana 1023814
//   sAuxData := iif((trim(psDataMovimento) = ''),
//                   'TO_DATE(SYSDATE, ''dd/mm/yyyy'')',
//                   'TO_DATE('''+psDataMovimento+ ''',''dd/mm/yyyy'')');


//Monica Gonzaga SOL 173480  inicio
         sAuxData := iif((trim(psDtAlimentaReserva) = ''),
                          //'TO_DATE(SYSDATE, ''dd/mm/yyyy'')', //Everson Cunha - SIG84982
                          'TRUNC(SYSDATE)',                     //Everson Cunha - SIG84982
                          'TO_DATE('''+psDtAlimentaReserva+''',''dd/mm/yyyy'')');
//Monica Gonzaga SOL 173480 fim

   iIdHistorico := LeUltRegistro(qryAux, 'HISTMOVRESERVA');
   sSQL := ' INSERT INTO HISTMOVRESERVA( '+
           '             IDHISTRESERVA,   IDTIPORESERVA,  DATAALIMENTACAO,      VLRREAL,         '+
           '             VLRCOTAS,        IDBENEFICIO,    IDCONTRIBUICAO,       IDEVENTOGERADOR, '+
           '             SALDOREAL,       SALDOCOTAS,     IDPLANOPREV,          IDPESSOA,        '+
           //'             IDPESSJUR,       FLGENTRADA,     IDREGRACALCULO,       PERCENTUAL,      '+             // Paulo Nobre - WO6161
           '             IDPESSJUR,       FLGENTRADA,     IDREGRACALCULO,       NUMRECEBIMENTO,  PERCENTUAL, '+   // Paulo Nobre - WO6161
           '             SEQPROPOSTA,     IDPARTICIPANTE, SALDOREALCONT,        VALORINDICE,     '+
           '             MESREFERENCIA,   DATAMOV,        DATAINDICE,           FLGPROCEDENCIA,  '+
           '             INDICECORRECAO,  IDPESSOAORIGEM, IDPESSOADESTINO,      OBSERVACAO )     '+
           ' VALUES ( ';                  //BRUNO AZEVEDO SOL KINTANA
   sSQL := sSQL + IntToStr(iIdHistorico);
   sSQL := sSQL +', '+IntToStr(piIdTipoReserva);


   sSQL := sSQL +', ' + sAuxData; //BRUNO AZEVEDO SOL 145995 Kintana 1023814

// SOL 170679 Kintana 1534729
{// SOL 167888 Kintana 1489782 -- Otacilio aquino ** Inicio **
   if pdValorMovReal < 0 then
   begin
     pdValorMovReal := pdValorMovReal * -1;
   end;

   if pdValorMovCotas < 0 then
   begin
     pdValorMovCotas := pdValorMovCotas * -1;
   end;
   // SOL 167888 Kintana 1489782 -- Otacilio aquino ** Fim **
} // SOL 170679 Kintana 1534729
   sSQL := sSQL +', '+OraNumero(FloatToStr(pdValorMovReal));
   sSQL := sSQL +', '+OraNumero(FloatToStr(pdValorMovCotas));
   sSQL := sSQL +', NULL ';

   if piIdContribuicao <= 0
   then sSQL := sSQL +', NULL '
   else sSQL := sSQL +', '+IntToStr(piIdContribuicao);

   if piIdEventoGerador <= 0
   then sSQL := sSQL +', NULL '
   else sSQL := sSQL +', '+IntToStr(piIdEventoGerador);

   sSQL := sSQL +', '+OraNumero(FloatToStr(dValorSaldoResReal));   // saldoreal = saldoemcotas * valorcota
   sSQL := sSQL +', '+OraNumero(FloatToStr(pdValorSaldoResCotas));

   if piIdPlanoPrev <= 0
   then sSQL := sSQL +', NULL '
   else sSQL := sSQL +', '+IntToStr(piIdPlanoPrev);

   if piIdPessoa  <= 0
   then sSQL := sSQL +', NULL '
   else sSQL := sSQL +', '+IntToStr(piIdPessoa);

   if piIdPessJur <= 0
   then sSQL := sSQL +', NULL '
   else sSQL := sSQL +', '+IntToStr(piIdPessJur);

   sSQL := sSQL +', '+IntToStr(piFlgEntrada);

   if piIdRegra        <= 0
   then sSQL := sSQL +', NULL '
   else sSQL := sSQL +', '+IntToStr(piIdRegra);

   // Paulo Nobre - WO6161 : inicio
   if piNumRecebimento <= 0
   then sSQL := sSQL +', NULL '
   else sSQL := sSQL +', '+IntToStr(piNumRecebimento);
   // Paulo Nobre - WO6161 : fim

   sSQL := sSQL +', '+OraNumero(FloatToStr(pdPercentual));

   if piSeqProposta <= 0
   then sSQL := sSQL +', NULL '
   else sSQL := sSQL +', '+IntToStr(piSeqProposta);

   if piIdPessoa  <= 0
   then sSQL := sSQL +', NULL '
   else sSQL := sSQL +', '+IntToStr(piIdPessoa);

   //Darivaldo Alencar SOL 253577/17989  PPM 1198155 --Inicio
   //sSQL := sSQL +', 0 '; // nao faz sentido -> gravar ZERO
   // sSQL := sSQL + ',' + StringReplace(FloatToStr(CalculaSALDOREALCONT(piIdPessoa,piIdPessJur,piIdPlanoPrev,piIdTipoReserva,dSALDOREALCONT)),',','.',[rfReplaceAll]);
   sSQL := sSQL + ',' + OraNumero(FloatToStr(dValorSaldoResReal));
   //Darivaldo Alencar SOL 253577/17989  PPM 1198155 --Fim

   if iFlgModoAtualizacao = 0
   then sSQL := sSQL +', '+OraNumero(FloatToStr(pdValorCota))
   else sSQL := sSQL +', 1 ';

   sSQL := sSQL +', '''+psAnoMesReferencia+'''';

   //sSQL := sSQL +', SYSDATE ';      //Everson Cunha - SIG84982
   sSQL := sSQL +', TRUNC(SYSDATE) '; //Everson Cunha - SIG84982
   sSQL := sSQL +', TO_DATE('''+psDataABuscarCota+ ''',''dd/mm/yyyy'') ';
   sSQL := sSQL +', 1  ';

   if iFlgModoAtualizacao = 1
   then sSQL := sSQL +', '+OraNumero(FloatToStr(pdValorCota))
   else sSQL := sSQL +', 1 ';

   // SOL 190227 KTN 1799098 Otacilio Aquino ** Inicio **
   //BRUNO AZEVEDO SOL KINTANA
   if Trim(piIdPessoaOrigem) = '' then
     sSQL := sSQL + ', NULL '
   else
     sSQL := sSQL +', ' + piIdPessoaOrigem;

   if Trim(piIdPessoaDestino) = '' then
     sSQL := sSQL + ', NULL '
   else
     sSQL := sSQL +', ' + piIdPessoaDestino;
   // SOL 190227 KTN 1799098 Otacilio Aquino ** Fim **

   // FELIPE SANTOS SOL 192897 KTN 1835724

   if Trim(psObservacao) = '' then
     sSQL := sSQL + ', NULL '
   else
     sSQL := sSQL +', ' + QuotedStr(psObservacao);

   // FELIPE SANTOS SOL 192897 KTN 1835724 FIM

   sSQL := sSQL + ')';

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);

   //Darivaldo Alencar - SOL 253577/17989  PPM 1198155 - Inicio
   spAtlzS_PART:= TwwStoredProc.Create(nil);
   spAtlzS_PART.DatabaseName:= dtmBaseDados.dbBaseDados.DataBaseName;
   spAtlzS_PART.StoredProcName:= 'CM.PCK_CTB_FUNCAO_RESERVA.PR_ATUALIZA_SALDO_PART';
   spAtlzS_PART.Params.CreateParam(ftInteger,'inIdPessoa'   , ptInput).asInteger := piIdPessoa;
   spAtlzS_PART.Params.CreateParam(ftInteger,'inIdPessJur'  , ptInput).asInteger := piIdPessJur;
   spAtlzS_PART.Params.CreateParam(ftInteger,'inIdPlanoPrev', ptInput).asInteger := piIdPlanoPrev;
   try
      qryAux.ExecSQL;
      spAtlzS_PART.prepare;
      spAtlzS_PART.ExecProc; 
   except
      Exit;
   end;
   spAtlzS_PART.UnPrepare;
   FreeAndNil(spAtlzS_PART);
   //Darivaldo Alencar SOL 253577/17989  PPM 1198155 - fim
   Result := True;
end;

// *****************************************************************************
// ************************* FUNCAO MOVRESERVANOVA - ***************************
// ************************* PARA PADRAO DE MOVIMENTACAO ***********************
// *****************************************************************************
// OBS : Se o codigo do beneficio for passado, entao a rotina será executada só
//       para este benefício
//       Se o código do beneficio não for passado, mas o número do processo for,
//       entao a rotina será executada para todos os benefícios do processo
function RodaPadraoMovReserva( piIdPessJur,
                               piIdPlanoPrev,
                               piIdPessoa,
                               piSeqProposta,
                               piIdBeneficio,
                               piIdEventoGerador,
                               piIdPessJurDestino,
                               piIdPlanoPrevDestino : Longint;
                               psFlgIntEvento,
                               psDataCota           : string;
                               var sMsgErro         : string;
                               piNumeroProcesso     : Longint;
                               pcOrigem             : char;  // C - Concessao, O - Outros
                               psDataFinalBenef     : string = '';
                               pbRodaInverso        : boolean = False;
                               psDataLancamento     : string = '';                               
                               psDtAlimentaReserva  : string = ''; // 101075
                               piIdPlanPrevContabAnt : LongInt = -1;             //edilaine - SIG55933
                               piIdPlanPrevContabAtu : LongInt = -1;             //edilaine - SIG55933
                               pbAtlzMovReserva      : boolean = True //SIG84530
                               ) : boolean;

var
  dValorReservaCotas,
  dValorMovimentoCotas,
  dSaldoEmCotasOrigem,
  dSaldoEmCotasDestino,
  dValorMovimentoReal,
  dValorDaCota,
  dTotalEmReal          : double;

  sSQLRegra,
  sSQLRegraData,
  sValorRegra           : string;

  bResgate, bErro       : boolean;

  iIdPessoaResOrig,
  iIdPessJurResOrig,
  iIdPessoaResDest,
  iIdPessJurResDest,
  iPlnCodigo            : Longint;

  sIdsBeneficios,
  sVlrOriginalTemp,
  sContaDebito,
  sContaCredito,
  sCCustoDebito,
  sIdRegraData,
  sCCustoCredito        : string;

  iIdHistoricoS,
  iIdHistoricoE           : Longint;

  sDataCotaPeloParametro  : string;
  dValorMovimentoRealOrig : double;
  CtrlLancamento          : TCtrlLancamento;
  CtrlRequerBenef         : TCtrlRequerBenef;        //edilaine - SIG20491
  lstListaReservas        : TStringList;             //edilaine - SIG20491
  sIdSitPartAnterior      : string;

  IDPlanoOri        : Integer;
  IDPlanoDest       : Integer;
  iTipoReservaOri   : Integer;
  iTipoReservaDest  : Integer;

  sReservas : string;
  sSQL      : string;

  // 101075
  sDataAlimentaReserva : String;

  dPercRetencao: Double; //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
  iIdTipoReservaOrigOld: Integer; //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
  bAtualizaReservaPart: Boolean; //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811

  //edilaine - SIG20491 : inicio
  dValorResgateReal    : double;
  dSaldoMovimentoCotas : double;
  piSeqResgate         : integer;
  piAuxResgate         : integer;
  //edilaine - SIG20491 : fim

  QryAuxiliar : Twwquery;

  QryBenef    : Twwquery;      //edilaine WO10872

//Taffarel - SIG84530 - início
  sMatriculas : TStringList;
  iCont       : Integer;

  lstIdHstRemover : TStringList;    //edilaine WO39107

procedure addReserva(sIds : string);
var
  iCont : Integer;
  bExiste: Boolean;
begin
   bExiste := false;

   for iCont := 0 to sMatriculas.count-1 do
   begin
     if (pos(sIds,sMatriculas[iCont]) = 1 ) then
        bExiste := true;
   end;

   if (not(bExiste)) then
      sMatriculas.add(sIds);
end;

procedure salvaReserva;
var
    sListaMatr  : TStringList;
    iCont : Integer;
begin
  try
    sListaMatr  := TStringList.Create;

    for iCont := 0 to sMatriculas.count-1 do
      begin
          ExtractStrings(['|'], [], pChar(sMatriculas[iCont]), sListaMatr);
          AtualizaReservas(dtmAPrev.qryAux, sListaMatr[0], sListaMatr[1], sListaMatr[2]);

          sListaMatr.clear;
      end;
  finally
      FreeAndNil(sListaMatr);
  end;
end;
//Taffarel - SIG84530 - fim

begin
  Result    := False;
  sMsgErro  := '';

  sMatriculas := TStringList.Create; //Taffarel - SIG84530

  lstListaReservas := TStringList.create;            //edilaine - SIG20491
  lstIdHstRemover  := TStringList.create;            //edilaine WO39107

  // 101075
  if psDtAlimentaReserva <> '' then
    sDataAlimentaReserva := psDtAlimentaReserva
  else
    sDataAlimentaReserva := FormatDateTime('dd/mm/yyyy', Date);
  // Fim

  sIdSitPartAnterior := QuotedStr(' ');

  If psDataLancamento = '' Then psDataLancamento := FormatDateTime('dd/mm/yyyy', Date);

  If pcOrigem = 'C' // Concessão
   Then
    With dtmAPrev.qryAux Do
     Begin
       Close;
       SQL.Clear;
       SQL.Add('SELECT IDSITPARTATUAL');
       SQL.Add('FROM EVENTOSPREV');
       SQL.Add('WHERE IDPESSOA    = '+IntToStr(piIdPessoa));
       SQL.Add('  AND IDPESSJUR   = '+IntToStr(piIdPessJur));
       SQL.Add('  AND SEQPROPOSTA = '+IntToStr(piSeqProposta));
       SQL.Add('  AND IDPLANOPREV = '+IntToStr(piIdPlanoPrev));

       SQL.Add('  AND DATAEVENTO  = (SELECT DTEVENTO'); 
       SQL.Add('                     FROM PROCESSOBENEF');
       SQL.Add('                     WHERE NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+')');
       Open;

       If Not IsEmpty
        Then sIdSitPartAnterior := QuotedStr(FieldByName('IDSITPARTATUAL').AsString);
     End;
  

  if (piIdBeneficio <= 0) and (piNumeroProcesso > 0)
  then begin
     with dtmAPrev.qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT IDBENEFICIO FROM BENEFBFCIARIO '+
                ' WHERE NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
                ' AND   IDTITULAR = '+IntToStr(piIdPessoa)); 

        Open;
        First;
        sIdsBeneficios := '';
        while not EOF do
        begin
           if Trim(sIdsBeneficios) = ''
           then sIdsBeneficios := FieldByName('IDBENEFICIO').AsString
           else sIdsBeneficios := sIdsBeneficios+','+FieldByName('IDBENEFICIO').AsString;
           Next;
        end;
        Close;
     end;
  end;

  // ----------------------------------------------------------------------------------------------
  // ----------------------------------------------------------------------------------------------

  if not(pbRodaInverso) then sSQL :=
  'SELECT '                                                               + #13 +
  '  M.IDMOVIMENTO,       M.IDTIPORESERVADEST,  M.IDPLANOPREVORIG, '      + #13 +
  '  M.IDTIPORESERVAORIG, M.IDPATROORIG,        M.IDPATRODEST, '          + #13 +
  '  M.IDREGRA,           M.IDEVENTOGERADOR,    M.IDBENEFICIO, '          + #13 +
  '  M.IDPLANOPREVDEST,   M.IDREGRAVALIDACAO,   M.SEQMOV, '               + #13 +
  '  M.CODCENTROCUSTOD,   M.IDEMPRESA,          M.CODCENTROCUSTOC, '      + #13 +
  '  M.CODSUBCONTA,       M.UNIDNEGOC,          M.PLACONTAD, '            + #13 +
  '  M.PLANO,             M.PLACONTAC,          M.IDREGRAZERAVALOR, '     + #13 +
  '  M.FLGCONTABILIZA, '                                                  + #13 +
  '  E.NOME '                                                             + #13
  else sSQL :=
  'SELECT '                                                               + #13 +
  '  M.IDMOVIMENTO, '                                                     + #13 +
  '  M.IDTIPORESERVAORIG  AS IDTIPORESERVADEST, '                         + #13 +
  '  M.IDTIPORESERVADEST  AS IDTIPORESERVAORIG, '                         + #13 +
  '  M.IDPLANOPREVORIG    AS IDPLANOPREVDEST , '                          + #13 +
  '  M.IDPLANOPREVDEST    AS IDPLANOPREVORIG, '                           + #13 +
  '  M.IDPATROORIG        AS IDPATRODEST, '                               + #13 +
  '  M.IDPATRODEST        AS IDPATROORIG, '                               + #13 +
  '  M.IDREGRARETORNO     AS IDREGRA, '                                   + #13 +
  '  M.IDEVENTOGERADOR,   M.IDBENEFICIO,        M.IDREGRAVALIDACAO, '     + #13 +
  '  M.SEQMOV,            M.PLANO, '                                      + #13 +
  '  M.PLACONTAD AS PLACONTAC, '                                          + #13 +
  '  M.PLACONTAC AS PLACONTAD, '                                          + #13 +
  '  M.CODCENTROCUSTOD AS CODCENTROCUSTOC , '                             + #13 +
  '  M.CODCENTROCUSTOC AS CODCENTROCUSTOD , '                             + #13 +
  '  M.IDEMPRESA,         M.CODSUBCONTA,        M.UNIDNEGOC, '            + #13 +
  '  M.IDREGRAZERAVALOR,  M.FLGCONTABILIZA, '                             + #13 +
  '  E.NOME '                                                             + #13;

  sSQL := sSQL +
  'FROM '                                                                 + #13 +
  '  EVENTOGERADOR E, '                                                   + #13 +
  '  MOVRESERVA    M  '                                                   + #13 +
  'WHERE '                                                                + #13 +
  '      M.IDEVENTOGERADOR  = ' + IntToStr(piIdEventoGerador)             + #13 +
  '  AND M.IDPLANOPREVORIG  = ' + IntToStr(piIdPlanoPrev)                 + #13 +
  '  AND M.IDPATROORIG      = ' + IntToStr(piIdPessJur)                   + #13 +

  '  AND (M.IDPLANOPREVDEST = ' + IntToStr(piIdPlanoPrevDestino) + ' OR M.IDPLANOPREVDEST IS NULL) '  + #13 +
  '  AND (M.IDPATRODEST     = ' + IntToStr(piIdPessJur)          + ' OR M.IDPATRODEST     IS NULL) '  + #13 +

  '  AND E.IDEVENTOGERADOR  = M.IDEVENTOGERADOR '                         + #13;

  if piIdBeneficio > 0 then sSQL := sSQL  +
  '  AND (M.IDBENEFICIO     = ' + IntToStr(piIdBeneficio) + ' OR M.IDBENEFICIO IS NULL) '
  else if Trim(sIdsBeneficios) <> '' then sSQL := sSQL  +
  '  AND (M.IDBENEFICIO     IN (' + sIdsBeneficios + ') OR M.IDBENEFICIO IS NULL ) ';

  // Verificar se existe padrao de movimentacao para o evento/beneficio indicados
  dtmAPrev.qryMovReserva.Close;
  dtmAPrev.qryMovReserva.SQL.Clear;
  dtmAPrev.qryMovReserva.SQL.Text := sSQL;
  dtmAPrev.qryMovReserva.Open;

  if dtmAPrev.qryMovReserva.IsEmpty then // nao tem padrao de movimentacao
  begin
    dtmAPrev.qryMovReserva.Close;
    Result := True;
    Exit;
  end
  else
  begin
    dtmAPrev.qryMovReserva.First;
    while not(dtmAPrev.qryMovReserva.EOF) do
    begin
       // -----------------------------------------------------------------------------------------


       IDPlanoOri        := dtmAPrev.qryMovReserva.FieldByName('IDPLANOPREVORIG').AsInteger;
       IDPlanoDest       := dtmAPrev.qryMovReserva.FieldByName('IDPLANOPREVDEST').AsInteger;
       iTipoReservaOri   := dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsInteger;
       iTipoReservaDest  := dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsInteger;

       
       if not(VerificaContaContabil(dtmAPrev.qryMovReserva.FieldByName('PLACONTAD').AsString,
                                    dtmAPrev.qryMovReserva.FieldByName('CODCENTROCUSTOD').AsString,
                                    dtmAPrev.qryMovReserva.FieldByName('CODSUBCONTA').AsInteger,
                                    IntegraBack.Plano,
                                    sMsgErro
                                   )) then
       begin
         sReservas := NomeReservas(IDPlanoOri, IDPlanoDest, iTipoReservaOri, iTipoReservaDest);

         MsgDlg(sReservas + sMsgErro, Sistema.NomeModulo, mtWarning, [mbOk], 0);
         Exit;
       end;

       if not(VerificaContaContabil(dtmAPrev.qryMovReserva.FieldByName('PLACONTAC').AsString,
                                    dtmAPrev.qryMovReserva.FieldByName('CODCENTROCUSTOC').AsString,
                                    dtmAPrev.qryMovReserva.FieldByName('CODSUBCONTA').AsInteger,
                                    IntegraBack.Plano,
                                    sMsgErro
                                   )) then
       begin
         sReservas := NomeReservas(IDPlanoOri, IDPlanoDest, iTipoReservaOri, iTipoReservaDest);

         MsgDlg(sReservas + sMsgErro, Sistema.NomeModulo, mtWarning, [mbOk], 0);
         Exit;
       end;
       
       // -----------------------------------------------------------------------------------------

       dtmAPrev.qryMovReserva.Next;
    end;
  end;

  // ----------------------------------------------------------------------------------------------
  // ----------------------------------------------------------------------------------------------

  if not(pbRodaInverso)
  then sSQL := 'SELECT '                                                              + #13 +
               '  M.IDTIPORESERVADEST, M.IDPLANOPREVORIG, '                           + #13 +
               '  M.IDTIPORESERVAORIG, M.IDPATROORIG,        M.IDPATRODEST, '         + #13 +
               '  M.IDREGRA,           M.IDEVENTOGERADOR,    M.IDBENEFICIO, '         + #13 +
               '  M.IDPLANOPREVDEST,   M.IDREGRAVALIDACAO,   M.SEQMOV, '              + #13 +
               '  M.CODCENTROCUSTOD,   M.IDEMPRESA,          M.CODCENTROCUSTOC, '     + #13 +
               '  M.CODSUBCONTA,       M.UNIDNEGOC,          M.PLACONTAD, '           + #13 +
               '  M.IDREGRAZERAVALOR, '                                               + #13 +
               '  M.PLANO,             M.PLACONTAC,          M.FLGCONTABILIZA, '      + #13 +
               '  PP.IDPESSOA,         PP.IDPESSJUR,         PP.INSCRICAONUMERO, '    + #13 +

               '  RORIG.FLGCOLETIVA AS FLGCOLETIVAORIG, RORIG.FLGTITULARCOLET AS FLGTITCOLETORIG, '   + #13 +
               '  RDEST.FLGCOLETIVA AS FLGCOLETIVADEST, RDEST.FLGTITULARCOLET AS FLGTITCOLETDEST, '   + #13 +

               '  RORIG.INDICEREAJUSTE, '                                                             + #13 +

               '  RORIG.FLGTIPORESERVA, RORIG.ANALITICOSINTETI, '                     + #13 +   //edilaine - SIG20491
               '  RORIG.CODHIERARQUIA,  NVL(RORIG.FLGCONTROLE,0) AS FLGCONTROLE, '    + #13 +   //edilaine - SIG20491

               '  M.PLACONTACDEST, M.PLACONTADDEST, '                                 + #13 +
               '  E.NOME '                                                            + #13
  else sSQL := 'SELECT '                                                              + #13 +
               '  M.IDTIPORESERVADEST AS IDTIPORESERVAORIG, '                         + #13 +
               '  M.IDTIPORESERVAORIG AS IDTIPORESERVADEST, '                         + #13 +
               '  M.IDPLANOPREVORIG   AS IDPLANOPREVDEST, '                           + #13 +
               '  M.IDPLANOPREVDEST   AS IDPLANOPREVORIG, '                           + #13 +
               '  M.IDPATROORIG       AS IDPATRODEST, '                               + #13 +
               '  M.IDPATRODEST       AS IDPATROORIG, '                               + #13 +
               '  M.IDREGRARETORNO AS IDREGRA, '                                      + #13 +
               '  M.IDEVENTOGERADOR, '                                                + #13 +
               '  M.IDBENEFICIO, '                                                    + #13 +
               '  M.IDREGRAVALIDACAO, '                                               + #13 +
               '  M.SEQMOV, '                                                         + #13 +
               '  M.PLANO, '                                                          + #13 +
               '  M.PLACONTAD AS PLACONTAC, '                                         + #13 +
               '  M.PLACONTAC AS PLACONTAD, '                                         + #13 +
               '  M.CODCENTROCUSTOD AS CODCENTROCUSTOC , '                            + #13 +
               '  M.CODCENTROCUSTOC AS CODCENTROCUSTOD , '                            + #13 +
               '  M.IDEMPRESA, '                                                      + #13 +
               '  M.CODSUBCONTA, '                                                    + #13 +
               '  M.UNIDNEGOC, '                                                      + #13 +
               '  M.IDREGRAZERAVALOR, '                                               + #13 +
               '  M.FLGCONTABILIZA, '                                                 + #13 +
               '  PP.IDPESSOA, '                                                      + #13 +
               '  PP.IDPESSJUR, '                                                     + #13 +
               '  PP.INSCRICAONUMERO, '                                               + #13 +
               '  RORIG.FLGTIPORESERVA, RORIG.ANALITICOSINTETI, '                     + #13 +   //edilaine - SIG20491
               '  RORIG.CODHIERARQUIA,  NVL(RORIG.FLGCONTROLE,0) AS FLGCONTROLE, '    + #13 +   //edilaine - SIG20491
               '  RORIG.FLGCOLETIVA AS FLGCOLETIVADEST, '                             + #13 +
               '  RORIG.FLGTITULARCOLET AS FLGTITCOLETDEST, '                         + #13 +
               '  RDEST.FLGCOLETIVA AS FLGCOLETIVAORIG, '                             + #13 +
               '  RDEST.FLGTITULARCOLET AS FLGTITCOLETORIG , '                        + #13 +
               '  RORIG.INDICEREAJUSTE, '                                             + #13 +
               '  M.PLACONTACDEST, '                                                  + #13 +
               '  M.PLACONTADDEST, '                                                  + #13 +
               '  E.NOME '                                                            + #13;

    sSQL := sSQL +
               'FROM '                                                                + #13 +
               '  EVENTOGERADOR E,      '                                             + #13 +
               '  MOVRESERVA    M,      '                                             + #13 +
               '  RESERVAXPLANO RDEST,  '                                             + #13 +
               '  RESERVAXPLANO RORIG,  '                                             + #13 +
               '  PARTPREVPLAN  PP      '                                             + #13 +

               'WHERE '                                                               + #13 +
               '      M.IDEVENTOGERADOR     = ' + IntToStr(piIdEventoGerador)         + #13 +
               '  AND M.IDPATROORIG         = ' + IntToStr(piIdPessJur)               + #13 +

               '  AND (M.IDPATRODEST        = ' + IntToStr(piIdPessJur) + ' OR M.IDPATRODEST IS NULL ) '  + #13;

               //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
              {if piIdBeneficio > 0 then sSQL := sSQL +
               '  AND (M.IDBENEFICIO        = ' + IntToStr(piIdBeneficio) + ' OR M.IDBENEFICIO IS NULL) ' + #13
               else if Trim(sIdsBeneficios) <> '' then sSQL := sSQL +
               '  AND (M.IDBENEFICIO        IN (' + sIdsBeneficios + ') OR M.IDBENEFICIO IS NULL ) '      + #13;}

               if piIdBeneficio > 0 then sSQL := sSQL +
               '  AND (M.IDBENEFICIO        = ' + IntToStr(piIdBeneficio) + ' ) ' + #13
               else if Trim(sIdsBeneficios) <> '' then sSQL := sSQL +
               '  AND (M.IDBENEFICIO        IN (' + sIdsBeneficios + ') ) '      + #13;
               //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
   
               if pbRodaInverso then sSQL := sSQL +
               '  AND M.IDREGRARETORNO      IS NOT NULL '                             + #13;

               sSQL := sSQL +
               '  AND PP.IDPESSJUR          = ' + IntToStr(piIdPessJur)               + #13 +
               '  AND PP.IDPLANOPREV        = ' + IntToStr(piIdPlanoPrev)             + #13 +
               '  AND PP.IDPESSOA           = ' + IntToStr(piIdPessoa)                + #13 +
               '  AND PP.SEQPROPOSTA        = ' + IntToStr(piSeqProposta)             + #13 +

               '  AND PP.IDPLANOPREV        = M.IDPLANOPREVORIG    '                  + #13 +

               '  AND M.IDPLANOPREVDEST     = RDEST.IDPLANOPREV(+) '                  + #13 +
               '  AND M.IDTIPORESERVADEST   = RDEST.IDTIPORESERVA(+) '                + #13 +
               '  AND RORIG.IDPLANOPREV     = M.IDPLANOPREVORIG '                     + #13 +
               '  AND RORIG.IDTIPORESERVA   = M.IDTIPORESERVAORIG '                   + #13 +
               '  AND E.IDEVENTOGERADOR     = M.IDEVENTOGERADOR '                     + #13 +

               'ORDER BY '                                                            + #13 +
               //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
               //'  M.SEQMOV ';
               '    M.IDTIPORESERVAORIG ';
               //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811

  dtmAPrev.qryMovReserva.Close;
  dtmAPrev.qryMovReserva.SQL.Clear;
  dtmAPrev.qryMovReserva.SQL.Text := sSQL;
  dtmAPrev.qryMovReserva.Open;

  if dtmAPrev.qryMovReserva.IsEmpty then // nao tem padrao de movimentacao
  begin
    dtmAPrev.qryMovReserva.Close;
    Result := True;
    Exit;
  end
  else
  begin
    dtmAPrev.qryMovReserva.First;
    while not(dtmAPrev.qryMovReserva.EOF) do
    begin
       // -----------------------------------------------------------------------------------------
       

       IDPlanoOri        := dtmAPrev.qryMovReserva.FieldByName('IDPLANOPREVORIG').AsInteger;
       IDPlanoDest       := dtmAPrev.qryMovReserva.FieldByName('IDPLANOPREVDEST').AsInteger;
       iTipoReservaOri   := dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsInteger;
       iTipoReservaDest  := dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsInteger;


        if not(VerificaContaContabil(dtmAPrev.qryMovReserva.FieldByName('PLACONTAD').AsString,
                                     dtmAPrev.qryMovReserva.FieldByName('CODCENTROCUSTOD').AsString,
                                     dtmAPrev.qryMovReserva.FieldByName('CODSUBCONTA').AsInteger,
                                     IntegraBack.Plano,
                                     sMsgErro
                                    )) then
        begin
          sReservas := NomeReservas(IDPlanoOri, IDPlanoDest, iTipoReservaOri, iTipoReservaDest);

          MsgDlg(sReservas + sMsgErro, Sistema.NomeModulo, mtError, [mbOk], 0);
          Exit;
        end;

        if not(VerificaContaContabil(dtmAPrev.qryMovReserva.FieldByName('PLACONTAC').AsString,
                                     dtmAPrev.qryMovReserva.FieldByName('CODCENTROCUSTOC').AsString,
                                     dtmAPrev.qryMovReserva.FieldByName('CODSUBCONTA').AsInteger,
                                     IntegraBack.Plano,
                                     sMsgErro
                                    )) then
        begin
          sReservas := NomeReservas(IDPlanoOri, IDPlanoDest, iTipoReservaOri, iTipoReservaDest);

          MsgDlg(sReservas + sMsgErro, Sistema.NomeModulo, mtError, [mbOk], 0);
          Exit;
        end;

        
        if not(VerificaContaContabil(dtmAPrev.qryMovReserva.FieldByName('PLACONTACDEST').AsString,
                                     dtmAPrev.qryMovReserva.FieldByName('CODCENTROCUSTOC').AsString,
                                     dtmAPrev.qryMovReserva.FieldByName('CODSUBCONTA').AsInteger,
                                     IntegraBack.Plano,
                                     sMsgErro
                                    )) then
        begin
          sReservas := NomeReservas(IDPlanoOri, IDPlanoDest, iTipoReservaOri, iTipoReservaDest);

          MsgDlg(sReservas + sMsgErro, Sistema.NomeModulo, mtError, [mbOk], 0);
          Exit;
        end;

        if not(VerificaContaContabil(dtmAPrev.qryMovReserva.FieldByName('PLACONTADDEST').AsString,
                                     dtmAPrev.qryMovReserva.FieldByName('CODCENTROCUSTOD').AsString,
                                     dtmAPrev.qryMovReserva.FieldByName('CODSUBCONTA').AsInteger,
                                     IntegraBack.Plano,
                                     sMsgErro
                                    )) then
        begin
          sReservas := NomeReservas(IDPlanoOri, IDPlanoDest, iTipoReservaOri, iTipoReservaDest);

          MsgDlg(sReservas + sMsgErro, Sistema.NomeModulo, mtError, [mbOk], 0);
          Exit;
        end;       
        

        
        // -------------------------------------------------------------------------------------------

        dtmAPrev.qryMovReserva.Next;
     end;
  end;

  // ----------------------------------------------------------------------------------------------
  // ----------------------------------------------------------------------------------------------


  
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
  


  dSaldoMovimentoCotas := 0;         //edilaine - SIG20491


  dtmAPrev.qryMovReserva.First;
  with dtmAPrev.qryMovReserva do
  begin
     if piIdPessJurDestino   <= 0 then piIdPessJurDestino   := FieldByName('IDPATRODEST').AsInteger;
     if piIdPlanoPrevDestino <= 0 then piIdPlanoPrevDestino := FieldByName('IDPLANOPREVDEST').AsInteger;

     if piIdPessJurDestino   <= 0 then piIdPessJurDestino   := piIdPessJur;
     if piIdPlanoPrevDestino <= 0 then piIdPlanoPrevDestino := piIdPlanoPrev;

     dTotalEmReal := 0;

     // ***********************************************************************
     // *************************** INICIO DO LOOP ****************************
     // ***********************************************************************
     while not EOF do
     begin
        
        { **** TRATAMENTO DE ORIGEM **** }
        if (FieldByName('FLGCOLETIVAORIG').AsInteger = 1) and
           (FieldByName('FLGTITCOLETORIG').AsString = 'F')  then begin
           iIdPessoaResOrig    := iIdFundacao;
           iIdPessJurResOrig   := iIdFundacao;
        end;

        if (FieldByName('FLGCOLETIVAORIG').AsInteger = 1) and
           (FieldByName('FLGTITCOLETORIG').AsString = 'P')  then begin
           iIdPessoaResOrig    := FieldByName('IDPESSJUR').AsInteger;
           iIdPessJurResOrig   := FieldByName('IDPESSJUR').AsInteger;
        end;

        if (FieldByName('FLGCOLETIVAORIG').AsInteger = 0) then begin
           iIdPessoaResOrig    := FieldByName('IDPESSOA').AsInteger;
           iIdPessJurResOrig   := FieldByName('IDPESSJUR').AsInteger;
        end;

        { **** TRATAMENTO DE DESTINO **** }
        if (FieldByName('FLGCOLETIVADEST').AsInteger = 1) and
           (FieldByName('FLGTITCOLETDEST').AsString = 'F')  then begin
           iIdPessoaResDest    := iIdFundacao;
           iIdPessJurResDest   := iIdFundacao;
        end;

        if (FieldByName('FLGCOLETIVADEST').AsInteger = 1) and
           (FieldByName('FLGTITCOLETDEST').AsString = 'P')  then begin
           iIdPessoaResDest     := FieldByName('IDPESSJUR').AsInteger;
           iIdPessJurResDest    := FieldByName('IDPESSJUR').AsInteger;
        end;

        if (FieldByName('FLGCOLETIVADEST').AsInteger = 0) then begin
           iIdPessoaResDest     := FieldByName('IDPESSOA').AsInteger;
           iIdPessJurResDest    := FieldByName('IDPESSJUR').AsInteger;
        end;

        

        // Buscar valor da reserva de origem
        with dtmAPrev.qryAux do
        begin
           Close;
           SQL.Clear;
           SQL.Add(' SELECT NVL(VALORRESERVA,0) as VALORRESERVA FROM RESERVAPART '+        // Sig 129320 Ferrari
                   ' WHERE  IDPESSJUR        = '+IntToStr(iIdPessJurResOrig)+
                   ' AND    IDPLANOPREV      = '+IntToStr(piIdPlanoPrev) +
                   ' AND    IDPESSOA         = '+IntToStr(iIdPessoaResOrig)+    
                   ' AND    SEQPROPOSTA      = '+IntToStr(piSeqProposta) +
                   ' AND    IDTIPORESERVA    = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString);
           Open;

           if not IsEmpty
           then dValorReservaCotas := FieldByName('VALORRESERVA').AsFloat
           else dValorReservaCotas := 0;
           Close;
        end;

        dValorMovimentoCotas := 0;   //edilaine SIG20491
        
        // Se for movimentacao de beneficio, verificar se está em processo de
        // concessao, para buscar valores da MOVRESERVATEMP
        if pcOrigem = 'C'
        then begin        
           with dtmAPrev.qryAux do
           begin
              Close;
              SQL.Clear;
//              SQL.Add(' SELECT DISTINCT NVL(VLRORIGINAL,0) AS VLRORIGINAL FROM MOVRESERVATEMP '+        // SIG 129320 Ferrari
              SQL.Add(' SELECT DISTINCT NVL(VLRORIGINAL,0) AS VLRORIGINAL, NVL(VLRABATIDO,0) AS VLRABATIDO FROM MOVRESERVATEMP '+  //edilaine SIG130377
                      ' WHERE  NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
                      ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)+
                      ' AND    IDTIPORESERVA  = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString);

              if piIdBeneficio > 0
              then SQL.Add(' AND ((IDBENEFICIO =  '+IntToStr(piIdBeneficio)+') OR (IDBENEFICIO IS NULL)) ')
              else if Trim(sIdsBeneficios) <> ''
                   then SQL.Add(' AND ((IDBENEFICIO IN ('+sIdsBeneficios+')) OR (IDBENEFICIO IS NULL) ) ');
              Open;

              if not IsEmpty
              then begin
                 //edilaine SIG20491 : inicio
                 if (piIdEventoGerador = 336) then
                 begin
//                   if dtmAPrev.qryAux.FieldByName('VLRORIGINAL').AsFloat <> dtmAPrev.qryAux.FieldByName('VLRABATIDO').AsFloat then
//                      dValorReservaCotas := FieldByName('VLRORIGINAL').AsFloat - FieldByName('VLRABATIDO').AsFloat
//                   else
                      dValorReservaCotas := FieldByName('VLRORIGINAL').AsFloat;

                   dValorMovimentoCotas := dtmAPrev.qryAux.FieldByName('VLRABATIDO').AsFloat;
                   sVlrOriginalTemp   := OraNumero(FloatToStr(dValorReservaCotas));
                 end
                 else
                 sVlrOriginalTemp := OraNumero(FieldByName('VLRORIGINAL').AsString);
                 //edilaine SIG20491 : fim
              end
              else begin
                sVlrOriginalTemp := 'RP.VALORRESERVA';
              end;
           end;
        end
        else begin
           sVlrOriginalTemp := 'RP.VALORRESERVA';
        end;

        // Se nao tiver regra, movimentar 100%, com a cota da data
        // Se tiver, chamar a regra. Esta regra deve retornar o valor
        // a movimentar em COTAS.
                
        dSaldoEmCotasOrigem := 0;
        if FieldByName('IDREGRA').AsInteger <= 0
        then begin
           if dValorMovimentoCotas = 0 then                             //edilaine SIG20491
              dValorMovimentoCotas := dValorReservaCotas;
           sDataCotaPeloParametro := psDatacota;


           //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
           with dtmAPrev.qryAux do
           begin
              Close;
              SQL.Clear;
              SQL.Add(' SELECT PERCRETENCAO FROM BENEFBFCIARIO '+
                      '  WHERE NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
                      '    AND IDTITULAR      = '+IntToStr(piIdPessoa));
              Open;

              dPercRetencao := 0;
              if not(IsEmpty) then begin
                dPercRetencao := FieldByName('PERCRETENCAO').AsFloat;
              end;

              Close;
           end;

           if (dPercRetencao > 0) then begin
            // dValorMovimentoCotas := StrToFloat(TruncaRound(FloatToStr((dValorMovimentoCotas - ((dValorMovimentoCotas * dPercRetencao) / 100))),2));  //William Santana - SIG 25771
             dValorMovimentoCotas := StrToFloat(FloatToStr((dValorMovimentoCotas - ((dValorMovimentoCotas * dPercRetencao) / 100))));    //William Santana - SIG 25771
           end;
           //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811

        end
        else begin
           if piNumeroProcesso <= 0
           then Begin
              sDataCotaPeloParametro :=  psDatacota;
              sSQLRegra := ' SELECT RP.IDPESSJUR,     RP.IDPLANOPREV,  PP.IDPESSOA,      '+
                           '        RP.SEQPROPOSTA,   RP.IDTIPORESERVA,                  '+
                           '        NVL(RP.VALORRESERVA,0) AS VALORRESERVAPART, '+          // SIG 129320 Ferrari
                           '        PP.IDSITPART,     PP.IDSITPART AS IDSITPARTATUAL,   '+
                           '        PP.INSCRICAODATA, PP.IDPESSOA AS IDTITULAR,        '+
                           '        EL.DATAADMISSAO,  PF.DATANASC,                     '+
                           '        RXP.INDICEREAJUSTE, EL.DATADEMISSAO, '+
                           ''''+psDataCota+'''                    AS DATAEVENTO,       '+
                           ''''+psDataCota+'''                    AS DATAINICIO,       '+
                           'NVL('+OraNumero(sVlrOriginalTemp)+',0)          AS VLRORIGINAL,      '+      // SIG 129320 Ferrari
                           'NVL('+OraNumero(sVlrOriginalTemp)+',0)          AS VALORRESERVA,     '+      // SIG 129320 Ferrari
                           sIdSitPartAnterior         +'          AS IDSITPARTANTERIOR, ' +
              //BRUNO AZEVEDO SOL 128400 KINTANA 898619
              'CASE ' +
//         'WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') <= 10 AND ' +   //Everson TIBERO
         'WHEN (SELECT TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') <= 10 AND ' +              //Everson TIBERO
             'DECODE(RP.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'',52,''Participante'',53,''Participante'',60,''Patrocinadora'',61, ' +
             '''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 95 '+

//         'WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') BETWEEN 11 AND 15 AND ' + //Everson TIBERO
         'WHEN (SELECT TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') BETWEEN 11 AND 15 AND ' +            //Everson TIBERO
             'DECODE(RP.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'',52,''Participante'',53,''Participante'',60,''Patrocinadora'',61, ' +
             '''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 90 ' +

//         'WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') BETWEEN 16 AND 20 AND ' + //Everson TIBERO
         'WHEN (SELECT TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') BETWEEN 16 AND 20 AND ' +            //Everson TIBERO
             'DECODE(RP.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'',52,''Participante'',53,''Participante'',60,''Patrocinadora'',61, ' +
             '''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 85 ' +

//         'WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') >= 21 AND ' +  //Everson TIBERO
         'WHEN (SELECT TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') >= 21 AND ' +    //Everson TIBERO
             'DECODE(RP.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'',52,''Participante'',53,''Participante'',60,''Patrocinadora'',61, ' +
             '''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 80 ' +
         'ELSE 100 ' +
       'END AS PERCENTUAL_RESGATE,';

              If psDataFinalBenef <> ''
              Then sSQLRegra := sSQLRegra + QuotedStr(psDataFinalBenef)+ ' AS DATAFINALBENEFICIO,';

              sSQLRegra := sSQLRegra +

                                OraNumero(FloatToStr(dTotalEmReal))+' AS TOTALMOVIMENTADO   '+
                                ' FROM   RESERVAPART RP, PARTPREVPLAN PP,                   '+
                                '        RESERVAXPLANO RXP, '+
                                '        ELEGPATRO EL,   PESSOAFISICA PF                    '+
                                ' WHERE  RP.IDPESSJUR     = '+IntToStr(iIdPessJurResOrig)    +
                                ' AND    RP.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)        +
                                ' AND    RP.IDPESSOA      = '+IntToStr(iIdPessoaResOrig)     +
                                ' AND    RP.SEQPROPOSTA   = '+IntToStr(piSeqProposta)        +
                                ' AND    RP.IDTIPORESERVA = '+FieldByName('IDTIPORESERVAORIG').AsString+
                                ' AND    PP.IDPESSJUR       = '+IntToStr(piIdPessJur)           +
                                ' AND    PP.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)         +
                                ' AND    PP.IDPESSOA        = '+IntToStr(piIdPessoa)            +
                                ' AND    PP.SEQPROPOSTA     = '+IntToStr(piSeqProposta)         +
                                ' AND    EL.IDPESSJUR       = PP.IDPESSJUR                     '+
                                ' AND    EL.IDPESSOA        = PP.IDPESSOA                      '+
                                ' AND    PF.IDPESSOA        = EL.IDPESSOA                      '+

                                ' AND    RP.IDPLANOPREV     = RXP.IDPLANOPREV                   '+
                                ' AND    RP.IDTIPORESERVA   = RXP.IDTIPORESERVA                 '
           End
           else begin
              sSQLRegra := ' SELECT DISTINCT RP.IDPESSJUR,   RP.IDPLANOPREV,  PP.IDPESSOA,  '+
                           '        RP.SEQPROPOSTA, RP.IDTIPORESERVA,                       '+
                           '        NVL(RP.VALORRESERVA,0) AS VALORRESERVAPART, '+         // SIG 129320 Ferrari
                           '        PP.IDSITPART,   PP.IDSITPART  AS IDSITPARTATUAL,        '+
                           '        PP.INSCRICAODATA, PP.IDPESSOA AS IDTITULAR,             '+
                           '        RXP.INDICEREAJUSTE, EL.DATADEMISSAO, '+
                             ''''+psDataCota+''' AS DATAEVENTO,                             '+
                             ''''+psDataCota+''' AS DATAINICIO,                             '+
                             ' BF.DATAINICIOFUND AS DATADIB,                                '+
                             OraNumero(FloatToStr(dTotalEmReal)) +' AS TOTALMOVIMENTADO,    '+
                             'NVL('+OraNumero(sVlrOriginalTemp)         +',0) AS VLRORIGINAL,         '+     // SIG 129320 Ferrari
                             'NVL('+sVlrOriginalTemp                    +',0) AS VALORRESERVA,        '+     // SIG 129320 Ferrari
                             sIdSitPartAnterior                  +' AS IDSITPARTANTERIOR,   '+
                         //BRUNO AZEVEDO SOL 128400 KINTANA 898619
                           'CASE ' +
//         'WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') <= 10 AND ' +     //Everson TIBERO
         'WHEN (SELECT TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') <= 10 AND ' +     //Everson TIBERO
             'DECODE(RP.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'',52,''Participante'',53,''Participante'',60,''Patrocinadora'',61, ' +
             '''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 95 '+

//         'WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') BETWEEN 11 AND 15 AND ' +   //Everson TIBERO
         'WHEN (SELECT TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') BETWEEN 11 AND 15 AND ' +   //Everson TIBERO
             'DECODE(RP.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'',52,''Participante'',53,''Participante'',60,''Patrocinadora'',61, ' +
             '''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 90 ' +

//         'WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') BETWEEN 16 AND 20 AND ' +   //Everson TIBERO
         'WHEN (SELECT TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') BETWEEN 16 AND 20 AND ' +   //Everson TIBERO
             'DECODE(RP.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'',52,''Participante'',53,''Participante'',60,''Patrocinadora'',61, ' +
             '''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 85 ' +

//         'WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') >= 21 AND ' +   //Everson TIBERO
         'WHEN (SELECT TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC WHERE  HC.IDPESSOA = RP.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') >= 21 AND ' +   //Everson TIBERO
             'DECODE(RP.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'',52,''Participante'',53,''Participante'',60,''Patrocinadora'',61, ' +
             '''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 80 ' +
         'ELSE 100 ' +
       'END AS PERCENTUAL_RESGATE,';


              If psDataFinalBenef <> ''
              Then sSQLRegra := sSQLRegra + QuotedStr(psDataFinalBenef)+ ' AS DATAFINALBENEFICIO,    ';

              sSQLRegra := sSQLRegra +

                                '        BF.VALORTOTAL,                                        '+
                                '        BP.VALORBASE1, BP.VALORBASE2, BP.VALORBASE3,          '+
                                '        BF.IDBENEFICIO, BF.DATAINICIOFUND,                    '+
                                '        EL.DATAADMISSAO,  PF.DATANASC                         '+
                                ' FROM   RESERVAPART RP, BENEFPLANOPART BP, BENEFBFCIARIO BF,  '+
                                '        RESERVAXPLANO RXP, '+
                                '        PARTPREVPLAN PP, ELEGPATRO EL, PESSOAFISICA PF        '+
                                ' WHERE  RP.IDPESSJUR       = '+IntToStr(iIdPessJurResOrig)     +
                                ' AND    RP.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)         +
                                ' AND    RP.IDPESSOA        = '+IntToStr(iIdPessoaResOrig)      +
                                ' AND    RP.SEQPROPOSTA     = '+IntToStr(piSeqProposta)         +
                                ' AND    RP.IDTIPORESERVA   = '+FieldByName('IDTIPORESERVAORIG').AsString+
                                ' AND    PP.IDPESSJUR       = '+IntToStr(piIdPessJur)           +
                                ' AND    PP.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)         +
                                ' AND    PP.IDPESSOA        = '+IntToStr(piIdPessoa)            +
                                ' AND    PP.SEQPROPOSTA     = '+IntToStr(piSeqProposta)         +
                                ' AND    EL.IDPESSJUR       = PP.IDPESSJUR                     '+
                                ' AND    EL.IDPESSOA        = PP.IDPESSOA                      '+
                                ' AND    PF.IDPESSOA        = EL.IDPESSOA                      '+
                                ' AND    BF.IDPESSJUR       = '+IntToStr(piIdPessJur)           +
                                ' AND    BF.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)         +

                                ' AND    BF.IDTITULAR        = '+IntToStr(piIdPessoa)           +
                                ' AND    BF.SEQPROPOSTA     = '+IntToStr(piSeqProposta)         +
                                ' AND    BF.IDPLANOPREV     = RP.IDPLANOPREV                   '+
                                ' AND    BF.SEQPROPOSTA     = RP.SEQPROPOSTA                   '+
                                ' AND    BF.NUMEROPROCESSO  = '+IntToStr(piNumeroProcesso);
              if FieldByName('IDBENEFICIO').AsInteger > 0
              then sSQLRegra := sSQLRegra + ' AND    BF.IDBENEFICIO     = '+FieldByName('IDBENEFICIO').AsString;

              sSQLRegra := sSQLRegra +    ' AND    BP.IDPESSJUR(+)    = BF.IDPESSJUR    '+
                                   ' AND    BP.IDPLANOPREV(+)  = BF.IDPLANOPREV '+

                                   ' AND    BP.IDPESSOA(+)     = BF.IDTITULAR    '+
                                   ' AND    BP.SEQPROPOSTA(+)  = BF.SEQPROPOSTA '+
                                   ' AND    BP.IDBENEFICIO(+)  = BF.IDBENEFICIO '+


                                   ' AND    RP.IDPLANOPREV     = RXP.IDPLANOPREV     '+
                                   ' AND    RP.IDTIPORESERVA   = RXP.IDTIPORESERVA   ';
           end;

           sValorRegra := RegraNumerica( FieldByName('IDREGRA').AsString, sSQLRegra, bErro, iIdCalculoGeral);

           if bErro
           then begin
              sMsgErro := 'Erro na regra de movimentação Nº '+FieldByName('IDREGRA').AsString;
              FreeAndNil(CtrlLancamento);
              Result   := False;
              Close;
              Exit;
           end;

           if (dValorMovimentoCotas = 0) then            //edilaine SIG20491
              dValorMovimentoCotas := StrToFloat(ClienteNumero(sValorRegra));

           //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
           with dtmAPrev.qryAux do
           begin
              Close;
              SQL.Clear;
              SQL.Add(' SELECT PERCRETENCAO FROM BENEFBFCIARIO '+
                      '  WHERE NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
                      '    AND IDTITULAR      = '+IntToStr(piIdPessoa));
              Open;

              dPercRetencao := 0;
              if not(IsEmpty) then begin
                dPercRetencao := FieldByName('PERCRETENCAO').AsFloat;
              end;

              Close;
           end;

           if (dPercRetencao > 0) then begin
            // dValorMovimentoCotas := StrToFloat(TruncaRound(FloatToStr((dValorMovimentoCotas - ((dValorMovimentoCotas * dPercRetencao) / 100))),2));  //William Santana - SIG 25771
             dValorMovimentoCotas := StrToFloat(FloatToStr((dValorMovimentoCotas - ((dValorMovimentoCotas * dPercRetencao) / 100))));    //William Santana - SIG 25771
           end;
           //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
           
            if sIdsBeneficios <> '' then   
                   begin
                
                
                
            dtmAPrev.qryAux2.Close;
            dtmAPrev.qryAux2.SQL.Clear;
            dtmAPrev.qryAux2.SQL.Add(' SELECT DISTINCT BP.FLGDATAINDICERES, BP.IDREGRADTINDRES, '+
                                     '        BF.DATAREQUERIMENTO, BF.DATAINICIOFUND         '+
                                     ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP             '+
                                     ' WHERE  BF.IDPLANOPREV    = '+ IntToStr(piIdPlanoPrev)  +
                                     ' AND    BF.IDBENEFICIO    IN ('+sIdsBeneficios+')      '+
                                     ' AND    BF.NUMEROPROCESSO = '+ IntToStr(piNumeroProcesso)+
                                     ' AND    BF.IDPESSJUR      = '+IntToStr(piIdPessjur)     +
                                     ' AND    BF.IDTITULAR      = '+IntToStr(piIdPessoa)      +
                                     ' AND    BF.IDPLANOORIGEM  = '+ IntToStr(piIdPlanoPrev)  +
                                     ' AND    BF.SEQPROPOSTA    = '+ IntToStr(piSeqProposta)  +
                                     ' AND    BP.IDPLANOPREV    = BF.IDPLANOPREV             '+
                                     ' AND    BP.IDBENEFICIO    = BF.IDBENEFICIO             ');
            dtmAPrev.qryAux2.Open;

            Case dtmAPrev.qryAux2.FieldByName('FLGDATAINDICERES').AsInteger of
             0 : // Início Benefício - Dib
             sDataCotaPeloParametro := dtmAPrev.qryAux2.FieldByName('DATAINICIOFUND').AsString;
             1 : // Efetivo Pagto do Benefício - Data do Lote
             sDataCotaPeloParametro := psDataCota;
             2 : // Requerimento do Beneficio - Data do Requerimento
             sDataCotaPeloParametro := dtmAPrev.qryAux2.FieldByName('DATAREQUERIMENTO').AsString;
             3 : Begin // Data da cota calculada por regra
                   { Monta SQL para regra }
                   sSQLRegraData := ' SELECT '+QuotedStr(dtmAPrev.qryAux2.FieldByName('DATAINICIOFUND').AsString)+' AS DATAINICIO, '+
                                    QuotedStr(psDataCota)+' AS DATAPAGAMENTO, '+
                                    QuotedStr(dtmAPrev.qryAux2.FieldByName('DATAREQUERIMENTO').AsString)+' AS DATAREQUERIMENTO '+
                                    'FROM DUAL ';
                   { Executa regra de Data do Indice }
                   sIdRegraData := dtmAPrev.qryAux2.FieldByName('IDREGRADTINDRES').AsString;
                   sDataCotaPeloParametro := ExecutaRegraDataCota( sIdRegraData, sSQLRegraData, bErro ); { Função Local }
                   if bErro then begin
                     sMsgErro := 'Erro na regra de data da Cota!!  ';
                     Result   := False;
                     dtmAPrev.qryMovReserva.Close;
                     FreeAndNil(CtrlLancamento); 
                     Exit;
                     end;
                   end;
                 End;
            End;
        end; // else-if FieldByName('IDREGRA').AsInteger <= 0

        // Calcular valor de COTAS em REAL
        // Se a reserva nao tiver indice, colocar como valor em real o mesmo valor em cota
        if FieldByName('INDICEREAJUSTE').AsString = ''
        then dValorMovimentoReal := dValorMovimentoCotas
        else begin

           dValorDaCota := VoltaValorCotacao(dtmAPREV.qryAux, FieldByName('INDICEREAJUSTE').AsString,
                            IntToStr(piIdPlanoPrev),dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsString ,
                            sDataCotaPeloParametro);

           if dValorDaCota <= 0
           then begin
              sMsgErro := 'Valor da Cota ['+FieldByName('INDICEREAJUSTE').AsString+'] não encontrado na data '+psDataCota+'.';
              Result   := False;
              Close;
              FreeAndNil(CtrlLancamento); 
              Exit;
           end;
           dValorMovimentoReal := dValorMovimentoCotas * dValorDaCota;
        end;

        dTotalEmReal        := dTotalEmReal       + dValorMovimentoReal;
        { Embromation para acertar eeo de arredondamento }
        dValorReservaCotas  := StrToFloat(FloatToStr(dValorReservaCotas));
        dValorMovimentoCotas:= StrToFloat(FloatToStr(dValorMovimentoCotas));
        {*}
        dSaldoEmCotasOrigem := dValorReservaCotas - dValorMovimentoCotas;


        if not((piIdEventoGerador = 336) and (piIdPlanoPrev = 74)) then  //William Santana - SIG 32846
        //if (piIdEventoGerador <> 336)  then // Peterson Victor - SIG32846
        begin
        // Se a reserva de destino for em branco, entao apenas abater da reserva de origem
        // Verificar se  a reserva já está associada ao participante na reserva destino
        with dtmAPrev.qryAux do 
        begin
           if dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsInteger > 0
           then begin
             Close;
             SQL.Clear;
             SQL.Add(' SELECT RP.VALORRESERVA, RP.IDPESSJUR,   RP.IDPESSOA,     '+
                     '        RP.IDPLANOPREV,  RP.SEQPROPOSTA, RP.IDTIPORESERVA '+
                     ' FROM   RESERVAPART RP                                    '+
                     ' WHERE  RP.IDPESSJUR     = '+IntToStr(iIdPessJurResDest)+
                     ' AND    RP.IDPLANOPREV   = '+IntToStr(dtmAPrev.qryMovReserva.FieldByName('IDPLANOPREVDEST').AsInteger) +
                     ' AND    RP.IDPESSOA      = '+IntToStr(iIdPessoaResDest)+
                     ' AND    RP.SEQPROPOSTA   = '+IntToStr(piSeqProposta) +
                     ' AND    RP.IDTIPORESERVA = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsString);
             Open;

             if IsEmpty
             then begin
                dSaldoEmCotasDestino := dValorMovimentoCotas;
                Close;
                SQL.Clear;
                SQL.Add(' INSERT INTO RESERVAPART( IDPESSOA,          '+
                        '                          IDPARTICIPANTE,    '+
                        '                          IDPESSJUR,         '+
                        '                          IDPLANOPREV,       '+
                        '                          IDTIPORESERVA,     '+
                        '                          SEQPROPOSTA,       '+
                        '                          FLGATIVO,          '+
                        '                          DATAREFERENCIASA,  '+
                        '                          FLGINCONSISTENCIA, '+
                        '                          VALORRESERVA)      '+
                        ' VALUES( '+ IntToStr(iIdPessoaResDest)     +','+
                                     IntToStr(iIdPessoaResDest)     +','+
                                     IntToStr(iIdPessJurResDest)    +','+
                                     IntToStr(dtmAPrev.qryMovReserva.FieldByName('IDPLANOPREVDEST').AsInteger) +','+
                                     IntToStr(dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsInteger)+','+
                                     IntToStr(piSeqProposta)+','+
                                     '1, '+

                                     'TO_DATE(''' + FormatDateTime('dd/mm/yyyy', date) + ''', ''DD/MM/YYYY''), '+
                                     '0, '+
                                     OraNumero(FloatToStr(dValorMovimentoCotas))+' ) ');

                try
                   ExecSQL;
                except
                   sMsgErro := 'Erro na associação da Reserva Destino ao Participante ';
                   Result   := False;
                   Close;
                   FreeAndNil(CtrlLancamento);
                   Exit;
                end;
             end
             else begin
                if (pbAtlzMovReserva) then begin //SIG84530
                  dSaldoEmCotasDestino := FieldByName('VALORRESERVA').AsFloat + dValorMovimentoCotas;
                  Close;
                  SQL.Clear;
                  SQL.Add(' UPDATE RESERVAPART                          '+

                          ' SET    DATAREFERENCIASA = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', date) + ''', ''DD/MM/YYYY''), '+
                          '        VALORRESERVA     = '+OraNumero(FloatToStr(dSaldoEmCotasDestino))+
                          ' WHERE  IDPLANOPREV      = '+IntToStr(dtmAPrev.qryMovReserva.FieldByName('IDPLANOPREVDEST').AsInteger)+
                          ' AND    IDPESSJUR        = '+IntToStr(iIdPessJurResDest)+
                          ' AND    IDTIPORESERVA    = '+IntToStr(dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsInteger) +
                          ' AND    IDPESSOA         = '+IntToStr(iIdPessoaResDest)+
                          ' AND    SEQPROPOSTA      = '+IntToStr(piSeqProposta));
                  try
                     ExecSQL;
                  except
                     sMsgErro := 'Erro na atualização da Reserva de Destino';
                     Result   := False;
                     Close;
                     FreeAndNil(CtrlLancamento);
                     Exit;
                  end;
                end; //SIG84530
             end;
           end;

           // Se a movimentcao da reserva vier de uma concessao de benefício, entao
           // verificar se o beneficio é de resgate
           // Se for, entao nao abater da reserva de origem, pois a concessao já abateu
           if (pcOrigem = 'C')
           then begin

              if dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString <> ''
              then begin
                 Close;
                 SQL.Clear;
                 SQL.Add(' SELECT FLGRESGATE FROM BENEFICIO WHERE IDBENEFICIO = '+OraNumero(dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString));
                 Open;

                 if (not IsEmpty) and (FieldByName('FLGRESGATE').AsInteger  = 1)
                 then bResgate := True
                 else bResgate := False;
              end
              else bResgate := False;
           end;


           //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
           bAtualizaReservaPart  := False;
           iIdTipoReservaOrigOld := dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsInteger;

           dtmAPrev.qryMovReserva.Next;
           if (dtmAPrev.qryMovReserva.eof) then begin
             bAtualizaReservaPart := True;
           end else begin
             bAtualizaReservaPart := (iIdTipoReservaOrigOld <> dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsInteger);
             dtmAPrev.qryMovReserva.Prior;
           end;
           //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811

           if (dtmAPrev.qryMovReserva.FieldByName('IDREGRAZERAVALOR').isnull) and (bAtualizaReservaPart) //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811
           then begin
              if (pbAtlzMovReserva) then begin //SIG84530
                Close;
                SQL.Clear;
                SQL.Add(' UPDATE RESERVAPART                          '+

                        ' SET    DATAREFERENCIASA = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', date) + ''', ''DD/MM/YYYY''), '+
                        '        VALORRESERVA     = '+OraNumero(FloatToStr(dSaldoEmCotasOrigem))+
                        ' WHERE  IDPLANOPREV      =   '+IntToStr(piIdPlanoPrev)+
                        ' AND    IDPESSJUR        =   '+IntToStr(iIdPessJurResOrig)+
                        ' AND    IDTIPORESERVA    =   '+IntToStr(dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsInteger) +
                        ' AND    IDPESSOA         =   '+IntToStr(iIdPessoaResOrig)+
                        ' AND    SEQPROPOSTA      =   '+IntToStr(piSeqProposta));
                try
                   ExecSQL;
                except
                   sMsgErro := 'Erro na atualização da Reserva de Origem ';
                   Result   := False;
                   Close;
                   FreeAndNil(CtrlLancamento);
                   Exit;
                end;
              end; //SIG84530

              Close;
              SQL.Clear;
              SQL.Add(' UPDATE MOVRESERVATEMP '+
                      ' SET    VLRORIGINAL    = '+OraNumero(FloatToStr(dSaldoEmCotasOrigem))+
                      ' WHERE  NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+

                      ' AND    IDTITULAR      = '+IntToStr(piIdPessoa)+
                      ' AND    IDTIPORESERVA  = '+IntToStr(dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsInteger) );
              if piIdBeneficio > 0
              then SQL.Add(' AND ((IDBENEFICIO =  '+IntToStr(piIdBeneficio)+') OR (IDBENEFICIO IS NULL)) ')
              else if Trim(sIdsBeneficios) <> ''
                   then SQL.Add(' AND ((IDBENEFICIO IN ('+sIdsBeneficios+')) OR (IDBENEFICIO IS NULL) ) ');

              try
                 ExecSQL;
              except
                 sMsgErro := 'Erro na atualização da Reserva de Origem na Tabela Temporária ';
                 Result   := False;
                 Close;
                 FreeAndNil(CtrlLancamento);
                 Exit;
              end;


              Close;
              SQL.Clear;
              SQL.Add(' UPDATE BENEFBFCIARIO SET FLGMOVEURESERVA = 1        '+
                      ' WHERE  NUMEROPROCESSO = '+IntToStr(piNumeroProcesso) +
                      ' AND    IDTITULAR      = '+IntToStr(piIdPessoa)       );

              if piIdBeneficio > 0
              then SQL.Add(' AND ((IDBENEFICIO =  '+IntToStr(piIdBeneficio)+') OR (IDBENEFICIO IS NULL)) ')
              else if Trim(sIdsBeneficios) <> ''
                   then SQL.Add(' AND ((IDBENEFICIO IN ('+sIdsBeneficios+')) OR (IDBENEFICIO IS NULL) ) ');

              try
                 ExecSQL;
              except
                 sMsgErro := 'Erro na atualização da Tabela de Benefícios ';
                 Result   := False;
                 Close;
                 FreeAndNil(CtrlLancamento);
                 Exit;
              end;

           end;
        end; // with qryAux
        end
        else  // Peterson Victor - SIG32846 Inicio
        begin

          QryAuxiliar := Twwquery.Create(Application);
          QryAuxiliar.databasename := 'basedados';
          QryAuxiliar.close;
          QryAuxiliar.SQL.clear;

          QryAuxiliar.SQL.Add(' SELECT DISTINCT VLRORIGINAL,VLRABATIDO FROM MOVRESERVATEMP ' +
                                ' WHERE  IDPESSJUR        = ' + IntToStr(piIdPessJur) +
                                ' AND    IDPLANOPREV      = ' + IntToStr(piIdPlanoPrev) +
                                ' AND    IDPESSOA         = ' + IntToStr(piIdPessoa) +
                                ' AND    SEQPROPOSTA      = ' + IntToStr(piSeqProposta) +
                                ' AND    IDTIPORESERVA    = ' + dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString +
                                ' AND    NUMEROPROCESSO   = ' + IntToStr(piNumeroProcesso) );
                    //            ' AND    IDBENEFICIO      = ' + IntToStr(piIdBeneficio)

          QryAuxiliar.Open;

          if not QryAuxiliar.IsEmpty then
          begin
             dSaldoEmCotasDestino := QryAuxiliar.FieldByName('VLRORIGINAL').AsFloat - QryAuxiliar.FieldByName('VLRABATIDO').AsFloat;
             dValorMovimentoCotas := QryAuxiliar.FieldByName('VLRABATIDO').AsFloat;
             dSaldoEmCotasOrigem  := QryAuxiliar.FieldByName('VLRORIGINAL').AsFloat - QryAuxiliar.FieldByName('VLRABATIDO').AsFloat;


            QryAuxiliar.close;
            FreeAndNil(QryAuxiliar);

            with dtmAPrev.qryAux do
            begin
                  Close;
                  SQL.Clear;
                  SQL.Add(' UPDATE RESERVAPART                          '+

                          ' SET    DATAREFERENCIASA = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', date) + ''', ''DD/MM/YYYY''), '+
                          '        VALORRESERVA     = '+OraNumero(FloatToStr(dSaldoEmCotasDestino))+
                          ' WHERE  IDPLANOPREV      = '+IntToStr(dtmAPrev.qryMovReserva.FieldByName('IDPLANOPREVDEST').AsInteger)+
                          ' AND    IDPESSJUR        = '+IntToStr(piIdPessJur)+
                          ' AND    IDTIPORESERVA    = '+ dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString +
                          ' AND    IDPESSOA         = '+IntToStr(piIdPessoa)+
                          ' AND    SEQPROPOSTA      = '+IntToStr(piSeqProposta));
                  try
                     ExecSQL;
                  except
                     sMsgErro := 'Erro na atualização da Reserva de Destino';
                     Result   := False;
                     Close;
                     FreeAndNil(CtrlLancamento);
                     Exit;
                  end;

            end;

          end;




        end;  // Peterson Victor - SIG32846 Fim


        // Gerar SAIDA no historico de movimento de reserva

        { Permitir lancamentos de saldos negativos }



        if dtmAPrev.qryMovReserva.FieldByName('IDREGRAZERAVALOR').isnull then begin


           If (Trim(FieldByName('IDTIPORESERVAORIG').AsString)<>'') And
             not AlimentaHistorico( dtmAPrev.qryAux,
                                     IntToStr(iIdPessJurResOrig),
                                     IntToStr(piIdPlanoPrev),
                                     FieldByName('IDTIPORESERVAORIG').AsString,
                                     IntToStr(iIdPessoaResOrig),
                                     IntToStr(piSeqProposta),
                                     //OraNumero(FloatToStr(dValorMovimentoCotas)),     //VALOR
                                     OraNumero(FloatToStr(Abs(dValorMovimentoCotas))),  //VALOR    //edilaine SIG115771
                                     OraNumero(FloatToStr(dSaldoEmCotasOrigem)),
                                     dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString,
                                     '',
                                     IntToStr(piIdEventoGerador),
                                     FieldByName('IDREGRA').AsString,
                                     Copy(psDataCota,7,4)+'/'+Copy(psDataCota,4,2),
                                     {0,} iff(dValorMovimentoCotas < 0, 1, 0)             //edilaine 115771
                                     StrToDate(sDataAlimentaReserva),   // 101075
                                     False,
                                     StrToDate(sDataCotaPeloParametro),
                                     IntToStr(piIdPessoa) ,
                                     iIdHistoricoS,
                                     //bAtualizaReservaPart) //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811 //Taffarel - SIG84530
                                     False) //Taffarel - SIG84530
           then begin
              sMsgErro := 'Erro ao gravar movimento de SAÍDA da reserva de origem no histórico de reserva.';
              Result   := False;
              Close;
              FreeAndNil(CtrlLancamento);
              Exit;
           end;
        end;

        // Gerar ENTRADA no historico de movimento de reserva

        // Só Alimentar histórico de entrada se houver destino
        If (Trim(FieldByName('IDTIPORESERVADEST').AsString)<>'') And
           (Not AlimentaHistorico( dtmAPrev.qryAux,
                                  IntToStr(iIdPessJurResDest),
                                  IntToStr(piIdPlanoPrevDestino),
                                  FieldByName('IDTIPORESERVADEST').AsString,
                                  IntToStr(iIdPessoaResDest),
                                  IntToStr(piSeqProposta),
                                  OraNumero(FloatToStr(dValorMovimentoCotas)),  //VALOR
                                  OraNumero(FloatToStr(dSaldoEmCotasDestino)),
                                  dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString,
                                  '',
                                  IntToStr(piIdEventoGerador),
                                  FieldByName('IDREGRA').AsString,
                                  Copy(psDataCota,7,4)+'/'+Copy(psDataCota,4,2),
                                  1,
                                  StrToDate(sDataAlimentaReserva),   // 101075
                                  False,
                                  StrToDate(sDataCotaPeloParametro),
                                  IntToStr(piIdPessoa) , iIdHistoricoE,
                                  //bAtualizaReservaPart)) //BRUNO AZEVEDO SOL 146119/2881 KINTANA 1015811  //Taffarel - SIG84530
                                  False)) //Taffarel - SIG84530
        then begin
           sMsgErro := 'Erro ao gravar movimento de ENTRADA da reserva de destino no histórico de reserva.';
           Result   := False;
           Close;
           FreeAndNil(CtrlLancamento);
           Exit;
        end;
        {-- CONTABILIZAÇÃO ---------------------------------------------------}
        dValorMovimentoRealOrig :=  dValorMovimentoReal;
        if prmIntegraContab and (FieldByName('FLGCONTABILIZA').AsInteger = 1)
        then begin
          if dValorMovimentoRealOrig >= 0
          then begin
             sContaDebito        := FieldByName('PLACONTAD').AsString;
             sContaCredito       := FieldByName('PLACONTAC').AsString;
             sCCustoDebito       := FieldByName('CODCENTROCUSTOD').AsString;
             sCCustoCredito      := FieldByName('CODCENTROCUSTOC').AsString;
          end
          else begin
             sContaDebito        := FieldByName('PLACONTAC').AsString;
             sContaCredito       := FieldByName('PLACONTAD').AsString;
             sCCustoDebito       := FieldByName('CODCENTROCUSTOC').AsString;
             sCCustoCredito      := FieldByName('CODCENTROCUSTOD').AsString;
             dValorMovimentoReal := -dValorMovimentoReal;
          end;

          // Crédito - Origem



          // SOL 134801/2441 KINTANA 927927 alterado parametrização de credito para partida dobrada
          If Not CtrlLancamento.InsereLancaContab ( '2',                                         // cTipoLanc 0 - Credito, 1 - Debito, 2 - Partida dobrada
                                              Sistema.IdEmpresa,                                // IdEmpresa
                                              Sistema.IdModulo,                                 // iModuloOrigem
                                              Sistema.IdUsuario,                                // liUsuario
                                              IntegraBack.Plano,                                // liCodPlano
                                              FieldByName('UNIDNEGOC').AsInteger,               // liUnidNegoc
                                              0,                                                // liSubContaDeb
                                              FieldByName('CODSUBCONTA').AsInteger,             // liSubContaCre                                              
                                              //edilaine - SIG55933 - inicio
                                              iff(piIdPlanPrevContabAnt > 0, piIdPlanPrevContabAnt, piIdPlanoPrev),
                                              //edilaine - SIG55933 - fim
                                              piIdPessJur,                                      // iPatro
                                              iPlnCodigo,                                       // liPlnCodigo
                                              0,                                                // iNumLan

                                              psDataLancamento,
                                              '',                                               // sNumDoc
                                              'Transferência de Reserva',                       // sHist1
                                              Copy(FieldByName('Nome').AsString,1,40),                  // sHist2
                                              '-Inscrição No.'+FieldByName('INSCRICAONUMERO').AsString, // sHist3
                                              '',                                               // sHist4
                                              '',                                               // sHist5
                                              prmTpOperReserva,                                 // sTipoOper
                                              sCCustoDebito,                                    // sCCustoD
                                              sContaDebito,                                     // sContaD
                                              sCCustoCredito,                                   // sCCustoC
                                              sContaCredito,                                    // sContaC
                                              '',                                               // sCodHist
                                              dValorMovimentoReal,                              // rValLanc
                                              True,                                             // bJunta
                                              Sistema.UsaPlanoPatro,                            // bUsaPlanoPatro
                                              -1,                                               // iIdSegregaCriter
                                              -1                                                // dDataSegregaCriter
                                                  ) Then
          Begin
            sMsgErro := CtrlLancamento.MessageInfo;
            Result   := False;
            dtmAPrev.qryMovReserva.Close;
            FreeAndNil(CtrlLancamento);
            Exit;
          End
          Else
           iPlnCodigo := Trunc(CtrlLancamento.RetornoPlnCodigo);



          // Débito - Origem



           // SOL 134801/2441 KINTANA 927927 comentado chamada da função
          {If Not CtrlLancamento.InsereLancaContab ( '0',                                              // cTipoLanc 0 - Credito, 1 - Debito, 2 - Partida dobrada
                                              Sistema.IdEmpresa,                                // IdEmpresa
                                              Sistema.IdModulo,                                 // iModuloOrigem
                                              Sistema.IdUsuario,                                // liUsuario
                                              IntegraBack.Plano,                                // liCodPlano
                                              FieldByName('UNIDNEGOC').AsInteger,               // liUnidNegoc
                                              0,                                                // liSubContaDeb
                                              FieldByName('CODSUBCONTA').AsInteger,             // liSubContaCre
                                              piIdPlanoPrev,                                    // iPlanoPrev
                                              piIdPessJur,                                      // iPatro
                                              iPlnCodigo,                                       // liPlnCodigo
                                              0,                                                // iNumLan
                                              //DatetoStr(date),                                  // sDataLanc
                                              psDataLancamento,                                 // sDataLanc
                                              '',                                               // sNumDoc
                                              'Transferência de Reserva',                       // sHist1
                                              Copy(FieldByName('Nome').AsString,1,40),                  // sHist2
                                              '-Inscrição No.'+FieldByName('INSCRICAONUMERO').AsString, // sHist3
                                              '',                                               // sHist4
                                              '',                                               // sHist5
                                              prmTpOperReserva,                                 // sTipoOper
                                              sCCustoDebito,                                    // sCCustoD
                                              sContaDebito,                                     // sContaD
                                              '',                                               // sCCustoC
                                              '',                                               // sContaC
                                              '',                                               // sCodHist
                                              dValorMovimentoReal,                              // rValLanc
                                              False,                                            // bJunta
                                              Sistema.UsaPlanoPatro,                            // bUsaPlanoPatro
                                              -1,                                               // iIdSegregaCriter
                                              -1                                                // dDataSegregaCriter
                                            ) Then
          Begin
            sMsgErro := CtrlLancamento.MessageInfo;
            Result   := False;
            dtmAPrev.qryMovReserva.Close;
            FreeAndNil(CtrlLancamento);
            Exit;
          End
          Else
           iPlnCodigo := Trunc(CtrlLancamento.RetornoPlnCodigo);  }


          // Se tiver contas credito e debito destino para contabilizar -> fazer lancamentos
          if (FieldByName('PLACONTADDEST').AsString <> '') and
             (FieldByName('PLACONTACDEST').AsString <> '')
          then begin
             if dValorMovimentoRealOrig >= 0
             then begin
                sContaDebito        := FieldByName('PLACONTADDEST').AsString;
                sContaCredito       := FieldByName('PLACONTACDEST').AsString;
                sCCustoDebito       := FieldByName('CODCENTROCUSTOD').AsString;
                sCCustoCredito      := FieldByName('CODCENTROCUSTOC').AsString;
             end
             else begin
                sContaDebito        := FieldByName('PLACONTACDEST').AsString;
                sContaCredito       := FieldByName('PLACONTADDEST').AsString;
                sCCustoDebito       := FieldByName('CODCENTROCUSTOC').AsString;
                sCCustoCredito      := FieldByName('CODCENTROCUSTOD').AsString;
                dValorMovimentoReal := -dValorMovimentoRealOrig;
             end;

             // Crédito - Destino



             // SOL 134801/2441 KINTANA 927927 alterado parametrização de credito para partida dobrada
             If Not CtrlLancamento.InsereLancaContab ( '2',                                              // cTipoLanc 0 - Credito, 1 - Debito, 2 - Partida dobrada
                                                Sistema.IdEmpresa,                                // IdEmpresa
                                                Sistema.IdModulo,                                 // iModuloOrigem
                                                Sistema.IdUsuario,                                // liUsuario
                                                IntegraBack.Plano,                                // liCodPlano
                                                FieldByName('UNIDNEGOC').AsInteger,               // liUnidNegoc
                                                0,                                                // liSubContaDeb
                                                FieldByName('CODSUBCONTA').AsInteger,             // liSubContaCre                                                
                                                //edilaine - SIG55933 - inicio                                                
                                                iff(piIdPlanPrevContabAtu > 0, piIdPlanPrevContabAtu, piIdPlanoPrev),
                                                //edilaine - SIG55933 - fim
                                                piIdPessJur,                                      // iPatro
                                                iPlnCodigo,                                       // liPlnCodigo
                                                0,                                                // iNumLan
                                                //DatetoStr(date),                                  // sDataLanc
                                                psDataLancamento,                                 // sDataLanc
                                                '',                                               // sNumDoc
                                                'Transferência de Reserva',                       // sHist1
                                                Copy(FieldByName('Nome').AsString,1,40),                  // sHist2
                                                '-Inscrição No.'+FieldByName('INSCRICAONUMERO').AsString, // sHist3
                                                '',                                               // sHist4
                                                '',                                               // sHist5
                                                prmTpOperReserva,                                 // sTipoOper
                                                sCCustoDebito,                                    // sCCustoD
                                                sContaDebito,                                     // sContaD
                                                sCCustoCredito,                                   // sCCustoC
                                                sContaCredito,                                    // sContaC
                                                '',                                               // sCodHist
                                                dValorMovimentoReal,                              // rValLanc
                                                True,                                             // bJunta
                                                Sistema.UsaPlanoPatro,                            // bUsaPlanoPatro
                                                -1,                                               // iIdSegregaCriter
                                                -1                                                // dDataSegregaCriter
                                                      ) Then


             Begin
               sMsgErro := CtrlLancamento.MessageInfo;
               Result   := False;
               dtmAPrev.qryMovReserva.Close;
               FreeAndNil(CtrlLancamento);
               Exit;
             End
             Else
             iPlnCodigo := Trunc(CtrlLancamento.RetornoPlnCodigo);

             // Débito - Destino


             // SOL 134801/2441 KINTANA 927927 comentado chamada da função
             {If Not CtrlLancamento.InsereLancaContab ( '0',                                              // cTipoLanc 0 - Credito, 1 - Debito, 2 - Partida dobrada
                                                 Sistema.IdEmpresa,                                // IdEmpresa
                                                 Sistema.IdModulo,                                 // iModuloOrigem
                                                 Sistema.IdUsuario,                                // liUsuario
                                                 IntegraBack.Plano,                                // liCodPlano
                                                 FieldByName('UNIDNEGOC').AsInteger,               // liUnidNegoc
                                                 0,                                                // liSubContaDeb
                                                 FieldByName('CODSUBCONTA').AsInteger,             // liSubContaCre
                                                 piIdPlanoPrev,                                    // iPlanoPrev
                                                 piIdPessJur,                                      // iPatro
                                                 iPlnCodigo,                                       // liPlnCodigo
                                                 0,                                                // iNumLan
                                                 //DatetoStr(date),                                  // sDataLanc
                                                 psDataLancamento,                                 // sDataLanc
                                                 '',                                               // sNumDoc
                                                 'Transferência de Reserva',                       // sHist1
                                                 Copy(FieldByName('Nome').AsString,1,40),                  // sHist2
                                                 '-Inscrição No.'+FieldByName('INSCRICAONUMERO').AsString, // sHist3
                                                 '',                                               // sHist4
                                                 '',                                               // sHist5
                                                 prmTpOperReserva,                                 // sTipoOper
                                                 sCCustoDebito,                                    // sCCustoD
                                                 sContaDebito,                                     // sContaD
                                                 '',                                               // sCCustoC
                                                 '',                                               // sContaC
                                                 '',                                               // sCodHist
                                                 dValorMovimentoReal,                              // rValLanc
                                                 False,                                            // bJunta
                                                 Sistema.UsaPlanoPatro,                            // bUsaPlanoPatro
                                                 -1,                                               // iIdSegregaCriter
                                                 -1                                                // dDataSegregaCriter
                                                     ) Then
             Begin
               sMsgErro := CtrlLancamento.MessageInfo;
               Result   := False;
               dtmAPrev.qryMovReserva.Close;
               FreeAndNil(CtrlLancamento);
               Exit;
             End
             Else
              iPlnCodigo := Trunc(CtrlLancamento.RetornoPlnCodigo);   }


          end;

          { Verificar antes de excluir }
          if iPlnCodigo > 0 then begin

           // Atualizar HISTMOVRESERVA com o PLNCODIGO
            with dtmAPrev.qryAux do begin
              Close;
              SQL.Clear;
              SQL.Add(' UPDATE HISTMOVRESERVA SET PLNCODIGO = '+IntToStr(iPlnCodigo)+
                      ' WHERE  IDHISTRESERVA  IN ('+IntToStr(iIdHistoricoS)+','+IntToStr(iIdHistoricoE)+')');
              try
                 ExecSQL;
              except
                 sMsgErro := 'Erro ao gravar código da planilha no histórico de reserva.';
                 Result   := False;
                 Close;
                FreeAndNil(CtrlLancamento);
                 Exit;
              end;

            end;

          end else if iPlnCodigo < 0 then begin { Caso não retorne nada não mostra erro }

             Close;
             FreeAndNil( CtrlLancamento );

             Result := False;
             Exit;

           end;


        end;

        //Taffarel - SIG84530 - início
        addReserva(InttoStr(iIdPessoaResOrig) + '|' + InttoStr(iIdPessJurResOrig) + '|' + InttoStr(piIdPlanoPrev));
        addReserva(InttoStr(iIdPessoaResDest) + '|' + InttoStr(iIdPessJurResDest) + '|' + InttoStr(piIdPlanoPrevDestino));
        //Taffarel - SIG84530 - fim

        //edilaine WO39107 : inicio
        if lstIdHstRemover.IndexOf(IntToStr(iIdHistoricoS)) < 0 then
           lstIdHstRemover.Add( IntToStr(iIdHistoricoS) );

        if lstIdHstRemover.IndexOf(IntToStr(iIdHistoricoE)) < 0 then
           lstIdHstRemover.Add( IntToStr(iIdHistoricoE) );
        //edilaine WO39107 :fim

        Next;

     end; // while

  end; // with qryMovReserva


  //edilaine - SIG20491 - inicio
  if (pcOrigem = 'C')
  then begin

     if dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString <> ''
     then begin
        dtmAPrev.qryAux.Close;
        dtmAPrev.qryAux.SQL.Clear;
        dtmAPrev.qryAux.SQL.Add(' SELECT FLGRESGATE FROM BENEFICIO WHERE IDBENEFICIO = '+OraNumero(dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString));
        dtmAPrev.qryAux.Open;

        if (not dtmAPrev.qryAux.IsEmpty) and (dtmAPrev.qryAux.FieldByName('FLGRESGATE').AsInteger  = 1)
        then bResgate := True
        else bResgate := False;
     end
     else bResgate := False;
  end;


  //se for concessao e beneficio de resgate, marcar as contribuicoes
  if (pcOrigem = 'C') and (bResgate)  //and (dPercRetencao > 0 )
  then begin
     //edilaine WO10872 : inicio
     CtrlRequerBenef := TCtrlRequerBenef.Create;

     QryBenef    := Twwquery.create(nil);
     QryBenef.databaseName := 'BaseDados';
     try
        // buscar todos os beneficios do processo e
        // desconsiderar os que são sem deducao de IR
        qryBenef.SQL.clear;
        //qryBenef.SQL.Add('SELECT BF.IDBENEFICIO, BF.PERCRETENCAO ') ;            //edilaine WO20723
        qryBenef.SQL.Add('SELECT DISTINCT BF.IDBENEFICIO, BF.PERCRETENCAO, ') ;    //edilaine WO20723
        qryBenef.SQL.Add('       B.ORDEM          ');                              //edilaine WO25429
        qryBenef.SQL.Add('  FROM BENEFBFCIARIO BF ') ;
        //edilaine WO25429 - inicio
        qryBenef.SQL.Add('  JOIN (SELECT BE.IDBENEFICIO,        ');
        qryBenef.SQL.Add('               DECODE(BE.IDBENEFICIO, 378, 1, 458, 1, 510, 1, 524, 1, 892, 2) AS ORDEM ');
        qryBenef.SQL.Add('          FROM BENEFICIO BE           ');
        qryBenef.SQL.Add('         WHERE BE.FLGRESGATE = 1      ');
        qryBenef.SQL.Add('       ) B                            ');
        qryBenef.SQL.Add('    ON B.IDBENEFICIO = BF.IDBENEFICIO ');
        //edilaine WO25429 - fim
        qryBenef.SQL.Add(' WHERE BF.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev) );
        qryBenef.SQL.Add('   AND BF.IDPESSJUR      = '+IntToStr(piIdPessJur)   );
        //qryBenef.SQL.Add('   AND IDPESSOA       = '+IntToStr(piIdPessoa)    );  //edilaine WO20723
        qryBenef.SQL.Add('   AND BF.SEQPROPOSTA    = '+IntToStr(piSeqProposta) );
        qryBenef.SQL.Add('   AND BF.NUMEROPROCESSO = '+IntToStr(piNumeroProcesso) );
        //qryBenef.SQL.Add('   AND IDBENEFICIO NOT IN (378, 458, 510, 524, 892)'  );                              //edilaine WO25429
        qryBenef.SQL.Add(' ORDER BY B.ORDEM DESC ');  //edilaine WO25429   marcar 1o o beneficio que recolhe IR   //edilaine WO25429
        qryBenef.Open;
        if not qryBenef.eof then
        begin
          try
             CtrlRequerBenef.Initialize( dtmBaseDados.dbBaseDados,
                                         True,
                                         Sistema.ConnectionType,
                                         Sistema.ConnectionSide,
                                         Sistema.AppRemoteServer,
                                         True
                                       );
          except
             MsgDlg('Erro ao criar Controle de Requisição de Benefício.','Erro',mtError,[mbOK],0);
             Result := False;
             Exit;
          end;

          CtrlRequerBenef.ListaHistRemover := lstIdHstRemover.CommaText;   //edilaine WO39107

          //edilaine WO25429 : inicio
          if not CtrlRequerBenef.MarcaReservasComplementares( piIdPlanoPrev,
                                                              piIdPessJur,
                                                              1,
                                                              piIdPessoa,
                                                              piNumeroProcesso
                                                            ) then
          begin
            MsgDlg('Erro ao marcar reservas complementares.','Erro',mtError,[mbOK],0);
            Exit;
          end;
          //edilaine WO25429 : fim


          while not qryBenef.eof do
          begin
            piSeqResgate := GetSeqResgate(piIdPlanoPrev, piIdPessJur, piIdPessoa, piSeqProposta);

            dSaldoMovimentoCotas := CtrlRequerBenef.GetTotalResgate(piIdPlanoPrev, piIdPessJur, piIdPessoa, piSeqProposta,
                                                                    piIdEventoGerador,
                                                                    psDatacota, //sDataCotaPeloParametro,           //edilaine WO10872
                                                                    dPercRetencao,
                                                                    piNumeroProcesso,
                                                                    qryBenef.FieldByName('IDBENEFICIO').AsInteger,  //edilaine WO10872
                                                                    lstListaReservas);


            {dValorDaCota         := CtrlRequerBenef.GetValorIndice(piIdPlanoPrev, piIdPessJur, piIdPessoa);
            dValorResgateReal    := CtrlRequerBenef.GetTotalResgate(piIdPlanoPrev, piIdPessJur, piIdPessoa, piNumeroProcesso);
            dSaldoMovimentoCotas := dValorResgateReal / dValorDaCota;  }

            if not CtrlRequerBenef.MarcaReservasResgatadas( piIdPlanoPrev,
                                                            piIdPessJur,
                                                            piSeqProposta,
                                                            piIdPessoa,
                                                            piNumeroProcesso,
                                                            piSeqResgate,
                                                            psDatacota, //sDataCotaPeloParametro,   //edilaine WO10872
                                                            dSaldoMovimentoCotas
                                                          ) then
            begin
               MsgDlg('Erro ao marcar reservas resgatadas.','Erro',mtError,[mbOK],0);
               Result := False;
               Exit;
            end;

            //atualiza movimento de saida
            CtrlRequerBenef.AtlzHISTMOVRESERVA(piSeqResgate, piNumeroProcesso, lstListaReservas.commatext);

            //atualiza sequencia do processo
            with dtmAPrev.qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' UPDATE PROCESSOBENEF SET SEQRESGATE = '+IntToStr(piSeqResgate)+
                       '  WHERE NUMEROPROCESSO = '+IntToStr(piNumeroProcesso) );
               ExecSql;
            end;
            qryBenef.next;
          end;
        end;
     finally
        CtrlRequerBenef.destroy;
        FreeAndNil(qryBenef);
     end;
     //edilaine WO10872 : fim
  end;
  //edilaine - SIG20491 - inicio


  // ***********************************************************************
  // **** INICIO DO LOOP PARA ABATER RESERVAS ORIGEM SE ********************
  // **** IDREGRAZERAVALOR PARAMETRIZADA ***********************************
  // ***********************************************************************
  dtmAPrev.qryMovReserva.first;
  while not dtmAPrev.qryMovReserva.EOF do
  begin

     if dtmAPrev.qryMovReserva.FieldByName('IDREGRAZERAVALOR').AsInteger <= 0 then
     begin
       dtmAPrev.qryMovReserva.next;
       continue;
     end;


     If (dtmAPrev.qryMovReserva.FieldByName('FLGCOLETIVAORIG').AsInteger = 1) And
        (dtmAPrev.qryMovReserva.FieldByName('FLGTITCOLETORIG').AsString = 'F')
      Then Begin
        iIdPessoaResOrig    := iIdFundacao;
        iIdPessJurResOrig   := iIdFundacao;
      End;

     If (dtmAPrev.qryMovReserva.FieldByName('FLGCOLETIVAORIG').AsInteger = 1) And
        (dtmAPrev.qryMovReserva.FieldByName('FLGTITCOLETORIG').AsString = 'P')
      Then Begin
        iIdPessoaResOrig    := dtmAPrev.qryMovReserva.FieldByName('IDPESSJUR').AsInteger;
        iIdPessJurResOrig   := dtmAPrev.qryMovReserva.FieldByName('IDPESSJUR').AsInteger;
      End;

     If (dtmAPrev.qryMovReserva.FieldByName('FLGCOLETIVAORIG').AsInteger = 0)
      Then Begin
        iIdPessoaResOrig    := dtmAPrev.qryMovReserva.FieldByName('IDPESSOA').AsInteger;
        iIdPessJurResOrig   := dtmAPrev.qryMovReserva.FieldByName('IDPESSJUR').AsInteger;
      End;


     // Buscar valor da reserva de origem
     dtmAPrev.qryAux.Close;
     dtmAPrev.qryAux.SQL.Clear;
     dtmAPrev.qryAux.SQL.Add(' SELECT NVL(VALORRESERVA,0) as VALORRESERVA FROM RESERVAPART '+      // SIG 129320 Ferrari
                ' WHERE  IDPESSJUR        = '+IntToStr(iIdPessJurResOrig)+
                ' AND    IDPLANOPREV      = '+IntToStr(piIdPlanoPrev) +
                ' AND    IDPESSOA         = '+IntToStr(iIdPessoaResOrig)+
                ' AND    SEQPROPOSTA      = '+IntToStr(piSeqProposta) +
                ' AND    IDTIPORESERVA    = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString);
     dtmAPrev.qryAux.Open;

     if not dtmAPrev.qryAux.IsEmpty
     then dValorReservaCotas := dtmAPrev.qryAux.FieldByName('VALORRESERVA').AsFloat
     else dValorReservaCotas := 0;
     dtmAPrev.qryAux.Close;

     // Se for movimentacao de beneficio, verificar se está em processo de
     // concessao, para buscar valores da MOVRESERVATEMP
     if pcOrigem = 'C'
     then begin
        dtmAPrev.qryAux.Close;
        dtmAPrev.qryAux.SQL.Clear;
        dtmAPrev.qryAux.SQL.Add(' SELECT DISTINCT VLRORIGINAL FROM MOVRESERVATEMP '+
                ' WHERE  NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
                ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)+
                ' AND    IDTIPORESERVA  = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString);

        if piIdBeneficio > 0
        then dtmAPrev.qryAux.SQL.Add(' AND ((IDBENEFICIO =  '+IntToStr(piIdBeneficio)+') OR (IDBENEFICIO IS NULL)) ')
        else if Trim(sIdsBeneficios) <> ''
             then dtmAPrev.qryAux.SQL.Add(' AND ((IDBENEFICIO IN ('+sIdsBeneficios+')) OR (IDBENEFICIO IS NULL) ) ');
        dtmAPrev.qryAux.Open;

        if not dtmAPrev.qryAux.IsEmpty
        then begin
           sVlrOriginalTemp := OraNumero(dtmAPrev.qryAux.FieldByName('VLRORIGINAL').AsString);
        end
        else begin
          sVlrOriginalTemp := 'RP.VALORRESERVA';
        end;
     end
     else begin
        sVlrOriginalTemp := 'RP.VALORRESERVA';
     end;

     // Se nao tiver regra, movimentar 100%, com a cota da data
     // Se tiver, chamar a regra. Esta regra deve retornar o valor
     // a movimentar em COTAS.
     if dtmAPrev.qryMovReserva.FieldByName('IDREGRAZERAVALOR').AsInteger > 0 then
     begin
        if piNumeroProcesso <= 0
        then sSQLRegra := ' SELECT RP.IDPESSJUR,   RP.IDPLANOPREV,  PP.IDPESSOA,      '+
                          '        RP.SEQPROPOSTA, RP.IDTIPORESERVA,                  '+
                           '       NVL(RP.VALORRESERVA,0) AS VALORRESERVAPART, '+      // SIG 129320 Ferrari
                          '        PP.IDSITPART,   PP.IDSITPART  AS IDSITPARTATUAL,   '+
                          '        PP.INSCRICAODATA, PP.IDPESSOA AS IDTITULAR,        '+
                          '        RXP.INDICEREAJUSTE, EL.DATADEMISSAO, '+
                          ''''+psDataCota+''' AS DATAEVENTO,                          '+
                          ''''+psDataCota+''' AS DATAINICIO,                          '+
                          'NVL('+OraNumero(sVlrOriginalTemp)         +',0) AS VLRORIGINAL,      '+      // SIG 129320 Ferrari
                          'NVL('+OraNumero(sVlrOriginalTemp)         +',0) AS VALORRESERVA,     '+      // SIG 129320 Ferrari
                          OraNumero(FloatToStr(dTotalEmReal))+' AS TOTALMOVIMENTADO,  '+
                          sIdSitPartAnterior         +'         AS IDSITPARTANTERIOR, '+
                          '        EL.DATAADMISSAO,  PF.DATANASC                      '+
                          ' FROM   RESERVAPART RP, PARTPREVPLAN PP,                   '+
                          '        RESERVAXPLANO RXP, '+
                          '        ELEGPATRO EL, PESSOAFISICA PF                      '+
                          ' WHERE  RP.IDPESSJUR     = '+IntToStr(iIdPessJurResOrig)    +
                          ' AND    RP.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)        +
                          ' AND    RP.IDPESSOA      = '+IntToStr(iIdPessoaResOrig)     +
                          ' AND    RP.SEQPROPOSTA   = '+IntToStr(piSeqProposta)        +
                          ' AND    RP.IDTIPORESERVA = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString+
                          ' AND    PP.IDPESSJUR       = '+IntToStr(piIdPessJur)           +
                          ' AND    PP.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)         +
                          ' AND    PP.IDPESSOA        = '+IntToStr(piIdPessoa)            +
                          ' AND    PP.SEQPROPOSTA     = '+IntToStr(piSeqProposta)         +
                          ' AND    EL.IDPESSJUR       = PP.IDPESSJUR                     '+
                          ' AND    EL.IDPESSOA        = PP.IDPESSOA                      '+
                          ' AND    PF.IDPESSOA        = EL.IDPESSOA                      '+

                          ' AND    RP.IDPLANOPREV     = RXP.IDPLANOPREV                   '+
                          ' AND    RP.IDTIPORESERVA   = RXP.IDTIPORESERVA                 '


        else begin
           sSQLRegra :=   ' SELECT RP.IDPESSJUR,   RP.IDPLANOPREV,  PP.IDPESSOA,      '+
                          '        RP.SEQPROPOSTA, RP.IDTIPORESERVA,                  '+
                          '        NVL(RP.VALORRESERVA,0) AS VALORRESERVAPART, '+       // SIG 129320 Ferrari
                          '        PP.IDSITPART,   PP.IDSITPART  AS IDSITPARTATUAL,   '+
                          '        PP.INSCRICAODATA, PP.IDPESSOA AS IDTITULAR,        '+
                          '        RXP.INDICEREAJUSTE, EL.DATADEMISSAO, '+
                          ''''+psDataCota+''' AS DATAEVENTO,                          '+
                          ''''+psDataCota+''' AS DATAINICIO,                          '+
                          ' BF.DATAINICIOFUND AS DATADIB,                             '+
                          OraNumero(FloatToStr(dTotalEmReal)) +' AS TOTALMOVIMENTADO, '+
                          'NVL('+OraNumero(sVlrOriginalTemp)         +',0) AS VLRORIGINAL,      '+   // SIG 129320 Ferrari
                          'NVL('+sVlrOriginalTemp                    +',0) AS VALORRESERVA,     '+   // SIG 129320 Ferrari
                          '        BF.VALORTOTAL,                                     '+
                          '        BP.VALORBASE1, BP.VALORBASE2, BP.VALORBASE3,       '+
                          '        BF.IDBENEFICIO, BF.DATAINICIOFUND,                 '+
                          sIdSitPartAnterior         +'         AS IDSITPARTANTERIOR, '+
                          '        EL.DATAADMISSAO,  PF.DATANASC                      '+
                          ' FROM   RESERVAPART RP, BENEFPLANOPART BP, BENEFBFCIARIO BF, '+
                          '        RESERVAXPLANO RXP, '+
                          '        PARTPREVPLAN PP, ELEGPATRO EL, PESSOAFISICA PF       '+
                          ' WHERE  RP.IDPESSJUR       = '+IntToStr(iIdPessJurResOrig)   +
                          ' AND    RP.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)       +
                          ' AND    RP.IDPESSOA        = '+IntToStr(iIdPessoaResOrig)    +
                          ' AND    RP.SEQPROPOSTA     = '+IntToStr(piSeqProposta)       +
                          ' AND    RP.IDTIPORESERVA   = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString+
                          ' AND    PP.IDPESSJUR       = BF.IDPESSJUR                   '+
                          ' AND    PP.IDPLANOPREV     = BF.IDPLANOPREV                 '+
                          ' AND    PP.IDPESSOA        = BF.IDTITULAR                   '+
                          ' AND    PP.SEQPROPOSTA     = BF.SEQPROPOSTA                 '+
                          ' AND    EL.IDPESSJUR       = PP.IDPESSJUR                   '+
                          ' AND    EL.IDPESSOA        = PP.IDPESSOA                    '+
                          ' AND    PF.IDPESSOA        = EL.IDPESSOA                    '+
                          ' AND    BF.IDPESSJUR       = '+IntToStr(piIdPessJur)         +
                          ' AND    BF.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)       +
                          ' AND    BF.IDTITULAR       = '+IntToStr(piIdPessoa)          +
                          ' AND    BF.SEQPROPOSTA     = '+IntToStr(piSeqProposta)       +
                          ' AND    BF.IDPLANOPREV     = RP.IDPLANOPREV                 '+
                          ' AND    BF.SEQPROPOSTA     = RP.SEQPROPOSTA                 '+
                          ' AND    BF.NUMEROPROCESSO  = '+IntToStr(piNumeroProcesso)    ;
           if dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsInteger > 0
           then sSQLRegra := sSQLRegra + ' AND    BF.IDBENEFICIO     = '+dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString;

           sSQLRegra := sSQLRegra +    ' AND    BP.IDPESSJUR(+)    = BF.IDPESSJUR    '+
                             ' AND    BP.IDPLANOPREV(+)  = BF.IDPLANOPREV '+
                             ' AND    BP.IDPESSOA(+)     = BF.IDTITULAR   '+
                             ' AND    BP.SEQPROPOSTA(+)  = BF.SEQPROPOSTA '+
                             ' AND    BP.IDBENEFICIO(+)  = BF.IDBENEFICIO '+

                             ' AND    RP.IDPLANOPREV     = RXP.IDPLANOPREV                   '+
                             ' AND    RP.IDTIPORESERVA   = RXP.IDTIPORESERVA                 ';
        end;

        sValorRegra := RegraNumerica(dtmAPrev.qryMovReserva.FieldByName('IDREGRAZERAVALOR').AsString, sSQLRegra, bErro, iIdCalculoGeral);

        if bErro
        then begin
           sMsgErro := 'Erro na regra do valor a abater na resvera origem da movimentação Nº '+
             dtmAPrev.qryMovReserva.FieldByName('IDREGRAZERAVALOR').AsString;
           Result   := False;
           dtmAPrev.qryMovReserva.Close;
           FreeAndNil(CtrlLancamento);
           Exit;
        end;

        dValorMovimentoCotas := StrToFloat(ClienteNumero(sValorRegra));
     end;

     // Calcular valor de COTAS em REAL
     // Se a reserva nao tiver indice, colocar como valor em real o mesmo valor em cota
     if dtmAPrev.qryMovReserva.FieldByName('INDICEREAJUSTE').AsString = ''
     then dValorMovimentoReal := dValorMovimentoCotas
     else begin
        dValorDaCota := VoltaValorCotacao(dtmAPREV.qryAux,
          dtmAPrev.qryMovReserva.FieldByName('INDICEREAJUSTE').AsString,
          IntToStr(piIdPlanoPrev),
          dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsString ,
          sDataCotaPeloParametro);
        if dValorDaCota <= 0
        then begin
           sMsgErro := 'Valor da Cota ['+
             dtmAPrev.qryMovReserva.FieldByName('INDICEREAJUSTE').AsString+
             '] não encontrado na data '+psDataCota+'.';
           Result   := False;
           dtmAPrev.qryMovReserva.Close;
           FreeAndNil(CtrlLancamento);
           Exit;
        end;
        dValorMovimentoReal := dValorMovimentoCotas * dValorDaCota;
     end;

     dTotalEmReal        := dTotalEmReal       + dValorMovimentoReal;
     //edilaine SIG115771 : inicio
     if FloatToStr(dValorReservaCotas) = FloatToStr(dValorMovimentoCotas) then
        dSaldoEmCotasOrigem := 0
     else
        dSaldoEmCotasOrigem := dValorReservaCotas - dValorMovimentoCotas;
     //edilaine SIG115771 : fim

     // Se a reserva de destino for em branco, entao apenas abater da reserva de origem
     // Verificar se  a reserva já está associada ao participante na reserva destino
     // Se a movimentcao da reserva vier de uma concessao de benefício, entao
     // verificar se o beneficio é de resgate
     // Se for, entao nao abater da reserva de origem, pois a concessao já abateu
     if (pcOrigem = 'C')
     then begin
        if dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString <> ''
        then begin
           dtmAPrev.qryAux.Close;
           dtmAPrev.qryAux.SQL.Clear;
           dtmAPrev.qryAux.SQL.Add(' SELECT FLGRESGATE FROM BENEFICIO WHERE IDBENEFICIO = '+
             OraNumero(dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString));
           dtmAPrev.qryAux.Open;

           if (not dtmAPrev.qryAux.IsEmpty) and (dtmAPrev.qryAux.FieldByName('FLGRESGATE').AsInteger  = 1)
           then bResgate := True
           else bResgate := False;
        end
        else bResgate := False;
     end;

     If prmFLGRESNEGATIVA = 0
      Then
          if dSaldoEmCotasOrigem <= 0 then dSaldoEmCotasOrigem := 0;

     if (pbAtlzMovReserva) then begin //SIG84530
         if {not bResgate and}
            not dtmAPrev.qryMovReserva.FieldByName('IDREGRAZERAVALOR').isnull then
         begin
            dtmAPrev.qryAux.Close;
            dtmAPrev.qryAux.SQL.Clear;
            dtmAPrev.qryAux.SQL.Add(' UPDATE RESERVAPART                          '+

                                    ' SET    DATAREFERENCIASA = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''', ''DD/MM/YYYY''), '+
                                    '        VALORRESERVA     = '+OraNumero(FloatToStr(dSaldoEmCotasOrigem))+
                                    ' WHERE  IDPLANOPREV      =   '+IntToStr(piIdPlanoPrev)+
                                    ' AND    IDPESSJUR        =   '+IntToStr(iIdPessJurResOrig)+
                                    ' AND    IDTIPORESERVA    =   '+IntToStr(dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsInteger) +
                                    ' AND    IDPESSOA         =   '+IntToStr(iIdPessoaResOrig)+
                                    ' AND    SEQPROPOSTA      =   '+IntToStr(piSeqProposta));
            try
               dtmAPrev.qryAux.ExecSQL;
            except
               sMsgErro := 'Erro na atualização da Reserva de Origem ';
               Result   := False;
               dtmAPrev.qryMovReserva.Close;
               FreeAndNil(CtrlLancamento);
               Exit;
            end;
         end;

     // Gerar SAIDA no historico de movimento de reserva
     end; //SIG84530


     if {not bResgate and}
        not dtmAPrev.qryMovReserva.FieldByName('IDREGRAZERAVALOR').isnull then
     begin

         //edilaine - SIG20491 : inicio
         piAuxResgate := -1;
         if lstListaReservas.IndexOf(dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString) > -1 then
            piAuxResgate := piSeqResgate;
         //edilaine - SIG20491 : fim

        if not AlimentaHistorico( dtmAPrev.qryAux,
                                  IntToStr(iIdPessJurResOrig),
                                  IntToStr(piIdPlanoPrev),
                                  dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString,
                                  IntToStr(iIdPessoaResOrig),
                                  IntToStr(piSeqProposta),
                                  OraNumero(FloatToStr(dValorMovimentoCotas)),
                                  OraNumero(FloatToStr(dSaldoEmCotasOrigem)),
                                  dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString,
                                  '',
                                  IntToStr(piIdEventoGerador),
                                  dtmAPrev.qryMovReserva.FieldByName('IDREGRA').AsString,
                                  Copy(psDataCota,7,4)+'/'+Copy(psDataCota,4,2),
                                  0,
                                  StrToDate(sDataAlimentaReserva),   // 101075
                                  False,
                                  StrToDate(sDataCotaPeloParametro),
                                  IntToStr(piIdPessoa) ,
                                  iIdHistoricoS,
                                  //bAtualizaReservaPart) //Taffarel - SIG84530
                                  False, //Taffarel - SIG84530
                                  piAuxResgate    //edilaine - SIG20491
                                )
        then begin
           sMsgErro := 'Erro ao gravar movimento de SAÍDA da reserva de origem no histórico de reserva.';
           Result   := False;
           dtmAPrev.qryMovReserva.Close;
           FreeAndNil(CtrlLancamento);
           Exit;
        end;
     end;

     //Taffarel - SIG84530 - início
     addReserva(InttoStr(iIdPessoaResOrig) + '|' + InttoStr(iIdPessJurResOrig) + '|' + InttoStr(piIdPlanoPrev));
     //Taffarel - SIG84530 - fim

     dtmAPrev.qryMovReserva.Next;
  end; // while

  salvaReserva; //Taffarel - SIG84530

  FreeAndNil (sMatriculas); //Taffarel - SIG84530
  FreeAndNil(CtrlLancamento);

  FreeAndNil(lstListaReservas);      //edilaine - SIG20491
  FreeandNil(lstIdHstRemover);       //edilaine WO39107
  
  sMsgErro := '';
  Result   := True;
end; // RodaPadraoMovReserva



function CalculaReservaMatematica ( var qryResMatematica : TwwQuery; // query com estrutura da HISTMOVRESERVA, em CachedUpdates, para ser inserida pela funcao
                                    qryBeneficios,                   // query com os benefícios envolvidos com os campos : IDBENEFICIO, VALORATUAL
                                    qryAux               : TwwQuery; // query auxiliar
                                    piIdPessJur,
                                    piIdPlanoPrev,
                                    piIdPessoa,
                                    piSeqProposta,
                                    piIdEventoGerador    : Longint;
                                    pdValorReserva       : Double;
                                    var sMsgErro         : string ) : boolean;
var sValorReserva,
    sSQL            : string;

    bReajustou,
    bErro           : boolean;
    dValorBeneficioIntegral,
    dValorBeneficioIntegralAposMinimo,
    dTotalBenef,
    dValorBeneficioNoMes,
    dReservaInicial,
    dReservaNoMesEmReal,
    dReservaNoMesCorrigida,
    dValorDaCota,
    dValorCorrecao,
    dValorAtual,
    dValorBenefRateado, 
    dValorPrevAntesMinimo          : double;

    iIdRegraPrimPagto,
    iIdRegraUltPagto,
    iIdTpPagtoBenefic       : Longint;
    iFlgCalcTodoMes         : word;
    sDataBuscaCota,
    sAnoMesInicio,
    sAnoMesFinal,
    sAnoMesAtual,
    sValorBase1,
    sValorBase2,
    sValorBase3,
    sUltMesReajuste             : string;
    dValorSRB                   : double;
begin
   Result := False;

   // Verificar se o plano tem RESERVA MATEMATICA
   with dtmAPrev.qryReserva do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDPLANOPREV, IDTIPORESERVA, INDICECORRECAO, INDICEREAJUSTE, IDREGRAPAGTORESE '+
              ' FROM   RESERVAXPLANO                                                                '+
              ' WHERE  IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
              ' AND    FLGTIPORESERVA = 1 ');
      Open;

      if IsEmpty
      then begin
         Close;
         Result := True;
         Exit;
      end;
   end;

   // Preparar query CACHED UPDATES com RESERVA MATEMATICA
   with qryResMatematica do
   begin
      if UpdateObject = nil
      then begin
         sMsgErro := 'Objeto para Atualização da Reserva Matemática não encontrado. Verifique.';
         dtmAPrev.qryReserva.Close;
         Exit;
      end;
      CachedUpdates := True;
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDHISTRESERVA,       IDREGRACALCULO,        IDPLANOPREV,    '+
              '        IDTIPORESERVA,       IDPESSOA,              SEQPROPOSTA,    '+
              '        IDEVENTOGERADOR,     IDCONTRIBUICAO,        IDBENEFICIO,    '+
              '        DATAMOV,             VLRREAL,               VLRCOTAS,       '+
              '        SALDOREAL,           SALDOCOTAS,            FLGENTRADA,     '+
              '        PERCENTUAL,          IDPARTICIPANTE,        SALDOREALCONT,  '+
              '        VALORINDICE,         DATAALIMENTACAO,       MESREFERENCIA,  '+
              '        IDPESSJUR,           FLGPROCEDENCIA,        SALDOCORRIGIDO, '+
              '        INDICECORRECAO                                              '+
              ' FROM   HISTMOVRESERVA                                              '+
              ' WHERE  IDHISTRESERVA = -1                                          ');
      Open;
   end;

   // Para cada RESERVA MATEMATICA ENCONTRADA fazer :
   //      1. Para cada BENEFICIO passado com parâmetro fazer :
   //           - verificar se o benefício está associado a reserva
   //           - se estiver, inclui-lo na query para a regra de calculo da reserva
   //      2. Chamar regra de calculo da reserva. Esta regra retornará o VALOR DA RESERVA MATEMÁTICA NA DIB
   //      3. Para cada mês, da DIB até hoje ou até a data final (se houver) fazer :
   //           - calcular novo saldo da reserva matematica, abatendo o valor dos beneficios a pagar no mês
   dtmAPrev.qryReserva.First;
   while not dtmAPrev.qryReserva.EOF do
   begin
      // Se nao tiver regra cadastrada, ir para a proxima reserva
      if dtmAPrev.qryReserva.FieldByName('IDREGRAPAGTORESE').AsInteger <= 0
      then begin
         dtmAPrev.qryReserva.Next;
         continue;
      end;

      // Zerar variáveis
      sSQL                   := '';
      dTotalBenef            := 0;
      dReservaInicial        := 0;
      dReservaNoMesEmReal    := 0;
      dReservaNoMesCorrigida := 0;
      dValorDaCota           := 0;
      dValorCorrecao         := 0;
      sValorBase1            := '0';
      sValorBase2            := '0';
      sValorBase3            := '0';

      qryBeneficios.First;
      while not qryBeneficios.EOF do
      begin
         // Verificar se o benefício está associado a reserva
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT BF.NUMORDEM, BP.IDREGRAPRIMPAGTO, BP.IDREGRAULTPAGTO, '+
                        '        B.IDTPPAGTOBENEFIC, BP.FLGCALCTODOMES                 '+
                        ' FROM   BENEFICIO B, BENEFPLANPREV BP, BENEFRESERVA BF        '+
                        ' WHERE  BF.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+
                        ' AND    BF.IDBENEFICIO   = '+IntToStr(qryBeneficios.FieldByName('IDBENEFICIO').AsInteger)+
                        ' AND    BF.IDTIPORESERVA = '+IntToStr(dtmAPrev.qryReserva.FieldByName('IDTIPORESERVA').AsInteger)+
                        ' AND    BP.IDPLANOPREV   = BF.IDPLANOPREV '+
                        ' AND    BP.IDBENEFICIO   = BF.IDBENEFICIO '+
                        ' AND    B.IDBENEFICIO    = BP.IDBENEFICIO ');
         qryAux.Open;

         if qryAux.IsEmpty
         then begin
            qryBeneficios.Next;
            continue;
         end;

         // Preencher dados do beneficio
         iIdRegraPrimPagto  := qryAux.FieldByName('IDREGRAPRIMPAGTO').AsInteger;
         iIdRegraUltPagto   := qryAux.FieldByName('IDREGRAULTPAGTO').AsInteger;
         iIdTpPagtoBenefic  := qryAux.FieldByName('IDTPPAGTOBENEFIC').AsInteger;
         iFlgCalcTodoMes    := qryAux.FieldByName('FLGCALCTODOMES').AsInteger;

         // Buscar opcoes do benfeficio
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT VALORBASE1, VALORBASE2, VALORBASE3                    '+
                        ' FROM   BENEFPLANOPART                                        '+
                        ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
                        ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+
                        ' AND    IDPESSOA      = '+IntToStr(piIdPessoa)+
                        ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
                        ' AND    IDBENEFICIO   = '+IntToStr(qryBeneficios.FieldByName('IDBENEFICIO').AsInteger));
         qryAux.Open;

         if not qryAux.IsEmpty
         then begin
            sValorBase1 := OraNumero(qryAux.FieldByName('VALORBASE1').AsString);
            sValorBase2 := OraNumero(qryAux.FieldByName('VALORBASE2').AsString);
            sValorBase3 := OraNumero(qryAux.FieldByName('VALORBASE3').AsString);
         end;

         // Incluir beneficio na query para regra de calculo
         if Trim(sSQL) <> '' then sSQL := sSQL + ' UNION ';
         sSQL := sSQL + ' SELECT '+IntToStr(qryBeneficios.FieldByName('IDBENEFICIO').AsInteger)+' AS IDBENEFICIO,    '+
                                   OraNumero(qryBeneficios.FieldByName('VALORATUAL').AsString) +' AS VALORATUAL,     '+
                                   OraNumero(qryBeneficios.FieldByName('VALORATUAL').AsString) +' AS VALORNADIB,     '+
                                   ''''+qryBeneficios.FieldByName('DATAINICIOFUND').AsString+'''  AS DATAINICIOFUND, '+
                                   
                                   IntToStr(piIdPessJur)+' IDPESSJUR ,'+
                                   IntToStr(piIdPlanoPrev)+' IDPLANOPREV ,'+
                                   IntToStr(piIdPessoa)+' IDPESSOA ,'+
                                   
                                   
                                   OraNumero(FloatToStr(pdValorReserva)) + ' VALORRESERVA, '+
                                   ' 1 SEQPROPOSTA, '+
                                   PreparaStrRegra(sValorBase1)       +' AS VALORBASE1,     '+
                                   PreparaStrRegra(sValorBase2)       +' AS VALORBASE2,     '+
                                   PreparaStrRegra(sValorBase3)       +' AS VALORBASE3      '+
                        ' FROM DUAL ';
         dTotalBenef := dTotalBenef +qryBeneficios.FieldByName('VALORATUAL').AsFloat;
         qryBeneficios.Next;
      end;

      // Chamar regra de cálculo da reserva
      try
         if trim(sSQL) = ''  then
         begin
            result := True;
            exit;
         end;

         sValorReserva := RegraNumerica(IntToStr(dtmAPrev.qryReserva.FieldByName('IDREGRAPAGTORESE').AsInteger), sSQL , bErro, iIdCalculoGeral);
      except
         bErro := True;
      end;

      if bErro
      then begin
         sMsgErro := 'Erro ao executar Regra de Cálculo de Reserva Matemática - Regra No. '+ IntToStr(dtmAPrev.qryReserva.FieldByName('IDREGRAPAGTORESE').AsInteger);
         Exit;
      end;

      dReservaInicial := StrToFloat(ClienteNumero(sValorReserva));

      // Calcular período de calculo da reserva
      sAnoMesInicio   := Copy(qryBeneficios.FieldByName('DATAINICIOFUND').AsString, 7,4)+'/'+
                         Copy(qryBeneficios.FieldByName('DATAINICIOFUND').AsString, 4,2);

      if Trim(qryBeneficios.FieldByName('DATAFINAL').AsString) <> '' then
        sAnoMesFinal := Copy(qryBeneficios.FieldByName('DATAFINAL').AsString, 7,4)+'/'+
                        Copy(qryBeneficios.FieldByName('DATAFINAL').AsString, 4,2)
      else
        
        sAnoMesFinal   := Copy(FormatDateTime('dd/mm/yyyy', Date), 7,4) + '/' +          
                          Copy(FormatDateTime('dd/mm/yyyy', Date), 4,2);                 

      sAnoMesAtual      := sAnoMesInicio;

      while sAnoMesAtual <= sAnoMesFinal do
      begin

         sDataBuscaCota       := IntToStr(TrazUltDiaMes(StrToInt(Copy(sAnoMesAtual,6,2)), StrToInt(Copy(sAnoMesAtual,1,4))))+'/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4);

         dValorDaCota         := VoltaValorCotacao(qryAux, dtmAPrev.qryReserva.FieldByName('INDICEREAJUSTE').AsString,IntToStr(piIdPlanoPrev),IntToStr(dtmAPrev.qryReserva.FieldByName('IDTIPORESERVA').AsInteger), sDataBuscaCota);
         dValorCorrecao       := VoltaValorCotacao(qryAux, dtmAPrev.qryReserva.FieldByName('INDICECORRECAO').AsString,IntToStr(piIdPlanoPrev),IntToStr(dtmAPrev.qryReserva.FieldByName('IDTIPORESERVA').AsInteger), sDataBuscaCota);
         dValorAtual          := qryBeneficios.FieldByName('ValorAtual').AsFloat;

         dValorBeneficioNoMes := CalculaBeneficioAPagarNoMes( qryAux,
                                                              sAnoMesAtual,
                                                              piIdPessoa,
                                                              piIdPessoa,
                                                              piSeqProposta,
                                                              piIdPessJur,
                                                              piIdPlanoPrev,
                                                              qryBeneficios.FieldByName('NUMEROPROCESSO').AsInteger,
                                                              qryBeneficios.FieldByName('IDBENEFICIO').AsInteger,
                                                              1,
                                                              iIdRegraPrimPagto,
                                                              iIdRegraUltPagto,
                                                              iIdTpPagtoBenefic,
                                                              qryBeneficios.FieldByName('DATAINICIO').AsString,
                                                              qryBeneficios.FieldByName('DATAFINAL').AsString,
                                                              sAnoMesFinal,
                                                              IntToStr(iFlgCalcTodoMes),
                                                              dValorAtual,
                                                              dValorAtual,
                                                              qryBeneficios.FieldByName('ValorCotas').AsFloat,
                                                              True,
                                                              qryBeneficios.FieldByName('DATAINICIO').AsString,
                                                              7,
                                                              qryBeneficios.FieldByName('FLGDATAPREVISTA').AsInteger,
                                                              bErro,
                                                              bReajustou,
                                                              sUltMesReajuste,
                                                              dValorBeneficioIntegral,
                                                              dValorBeneficioIntegralAposMinimo,
                                                              dValorPrevAntesMinimo,
                                                              dValorBenefRateado, 
                                                              dValorSRB, 
                                                              iIdCalculoGeral, 
                                                              sDataBuscaCota);

         if sAnoMesAtual = sAnoMesInicio
         then dReservaNoMesEmReal  := dReservaInicial
         else dReservaNoMesEmReal  := dReservaNoMesCorrigida; // a reserva do mes é igual a reserva corrigida do mes anterior

         dReservaNoMesCorrigida    := ( dReservaNoMesEmReal - dValorBeneficioNoMes ) * dValorCorrecao;

         // Gravar resultado na HISTMOVRESERVA
         with qryResMatematica do
         begin
            Insert;
            FieldByName('IDHISTRESERVA').AsInteger    := LeUltRegistro(nil, 'HISTMOVRESERVA');
            FieldByName('MESREFERENCIA').AsString     := sAnoMesAtual;
            FieldByName('IDPESSJUR').AsInteger        := piIdPessJur;
            FieldByName('IDPLANOPREV').AsInteger      := piIdPlanoPrev;
            FieldByName('IDPESSOA').AsInteger         := piIdPessoa;
            FieldByName('SEQPROPOSTA').AsInteger      := piSeqProposta;
            FieldByName('IDPARTICIPANTE').AsInteger   := piIdPessoa;
            FieldByName('IDEVENTOGERADOR').AsInteger  := piIdEventoGerador;
            FieldByName('IDTIPORESERVA').AsInteger    := dtmAPrev.qryReserva.FieldByName('IDTIPORESERVA').AsInteger;
            FieldByName('IDREGRACALCULO').AsInteger   := dtmAPrev.qryReserva.FieldByName('IDREGRAPAGTORESE').AsInteger;
            FieldByName('DATAMOV').AsDateTime         := date;
            FieldByName('DATAALIMENTACAO').AsDateTime := date;
            FieldByName('VLRREAL').AsFloat            := dValorBeneficioNoMes;
            FieldByName('VLRCOTAS').AsFloat           := dValorBeneficioNoMes   * dValorDaCota;
            FieldByName('SALDOREAL').AsFloat          := dReservaNoMesEmReal;
            FieldByName('SALDOCOTAS').AsFloat         := dReservaNoMesCorrigida * dValorDaCota;
            FieldByName('SALDOCORRIGIDO').AsFloat     := dReservaNoMesCorrigida;
            FieldByName('VALORINDICE').AsFloat        := dValorDaCota;
            FieldByName('INDICECORRECAO').AsFloat     := dValorCorrecao;
            FieldByName('FLGENTRADA').AsInteger       := 1;
            FieldByName('PERCENTUAL').AsFloat         := 0;
            FieldByName('SALDOREALCONT').AsFloat      := 0;
            FieldByName('FLGPROCEDENCIA').AsInteger   := 0;
            Post;
         end;

         // Atualizar RESERVAPART
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE RESERVAPART SET VALORRESERVA  = VALORRESERVA + '+OraNumero(FloatToStr(dValorBeneficioNoMes   * dValorDaCota))+
                        ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
                        ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+
                        ' AND    IDPESSOA      = '+IntToStr(piIdPessoa)+
                        ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
                        ' AND    IDTIPORESERVA = '+IntToStr(dtmAPrev.qryReserva.FieldByName('IDTIPORESERVA').AsInteger));
         qryAux.ExecSQL;

         sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
      end;
      dtmAPrev.qryReserva.Next;
   end;
   Result := True;
end;


function DesfazReservaMatematica (  qryAux               : TwwQuery; // query auxiliar
                                    piIdPessJur,
                                    piIdPlanoPrev,
                                    piIdPessoa,
                                    piSeqProposta        : Longint;
                                    psDataInicio,
                                    psDataFinal          : string ) : boolean;
var sSQL            : string;

    sAnoMesInicio,
    sAnoMesFinal    : string;

begin
   Result := False;

   // Calcular período de calculo da reserva
   sAnoMesInicio   := Copy(psDataInicio, 7,4)+'/'+Copy(psDataInicio, 4,2);

   if Trim(psDataFinal) <> '' then
     sAnoMesFinal := Copy(psDataFinal, 7,4)+'/'+Copy(psDataFinal, 4,2)
   else
     
     sAnoMesFinal   := Copy(FormatDateTime('dd/mm/yyyy', date), 7,4) + '/' +      
                       Copy(FormatDateTime('dd/mm/yyyy', date), 4,2);             

   // Verificar se o plano tem RESERVA MATEMATICA
   with dtmAPrev.qryReserva do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT RP.IDPLANOPREV, RP.IDTIPORESERVA, RP.INDICECORRECAO, RP.INDICEREAJUSTE, RP.IDREGRAPAGTORESE,  '+
              '        H.IDHISTRESERVA                                                                               '+
              ' FROM   RESERVAXPLANO RP, HISTMOVRESERVA H                                                            '+
              ' WHERE  RP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
              ' AND    RP.FLGTIPORESERVA = 1 '+
              ' AND    H.IDPESSJUR       = '+IntToStr(piIdPessJur)+
              ' AND    H.IDPLANOPREV     = RP.IDPLANOPREV '+
              ' AND    H.IDPESSOA        = '+IntToStr(piIdPessoa)+
              ' AND    H.SEQPROPOSTA     = '+IntToStr(piSeqProposta)+
              ' AND    H.IDTIPORESERVA   = RP.IDTIPORESERVA '+
              ' AND    H.MESREFERENCIA   >= '''+sAnoMesInicio+''''+
              ' AND    H.MESREFERENCIA   <= '''+sAnoMesFinal +'''');
      Open;

      if IsEmpty
      then begin
         Close;
         Result := True;
         Exit;
      end;
   end;

   // Para cada RESERVA MATEMATICA ENCONTRADA fazer :
   //      1. Para cada BENEFICIO passado com parâmetro fazer :
   //           - verificar se o benefício está associado a reserva
   //           - se estiver, inclui-lo na query para a regra de calculo da reserva
   //      2. Chamar regra de calculo da reserva. Esta regra retornará o VALOR DA RESERVA MATEMÁTICA NA DIB
   //      3. Para cada mês, da DIB até hoje ou até a data final (se houver) fazer :
   //           - calcular novo saldo da reserva matematica, abatendo o valor dos beneficios a pagar no mês
   dtmAPrev.qryReserva.First;
   while not dtmAPrev.qryReserva.EOF do
   begin
      // Se nao tiver regra cadastrada, ir para a proxima reserva
      if dtmAPrev.qryReserva.FieldByName('IDREGRAPAGTORESE').AsInteger <= 0
      then begin
         dtmAPrev.qryReserva.Next;
         continue;
      end;

      
      dtmAPrev.qryReserva.Next;
   end;
   Result := True;
end;

function DESFAZPADRAOMOVRESERVA( piIdPessJur,
                                 piIdPlanoPrev,
                                 piIdPessoa,
                                 piSeqProposta,
                                 piIdBeneficio,
                                 piIdEventoGerador    : Longint;
                                 psDataCota           : string;
                                 piNumeroProcesso     : Longint;
                                 Var psPlanilhasExcluir : string ) : boolean; 
var
    sIdsBeneficios,
    sPlanilhas,
    sAnoMesReferencia : string;

    cSinalOperacao    : char;

    dVlrCotas         : double;
    dValorAtual       : double; 

    iFlgEntrada       : integer;

    liEmpresa,
    iPlnCodigo        : Longint;
    i                 : word;
    sDataMov          : string; 
    iIdPessoaOrig     : Longint; 
    iIdPessoaDest     : Longint; 
begin
   Result    := False;
   liEmpresa := Sistema.IdEmpresa;

   sAnoMesReferencia := Copy(psDataCota,7,4)+'/'+Copy(psDataCota,4,2);

   if (piIdBeneficio <= 0) and (piNumeroProcesso > 0)
   then begin
      with dtmAPrev.qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT IDBENEFICIO FROM BENEFBFCIARIO '+
                 ' WHERE NUMEROPROCESSO = '+IntToStr(piNumeroProcesso)+
                 ' AND   IDPESSOA       = '+IntToStr(piIdPessoa));
         Open;
         First;
         sIdsBeneficios := '';
         while not EOF do
         begin
            if Trim(sIdsBeneficios) = ''
            then sIdsBeneficios := FieldByName('IDBENEFICIO').AsString
            else sIdsBeneficios := sIdsBeneficios+','+FieldByName('IDBENEFICIO').AsString;
            Next;
         end;
         Close;
      end;
   end;

   
   // Buscar dados da concessao
   with dtmAPrev.qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT M.IDMOVBENEF, M.DATAMOV , M.IDLOTEMOV,                  '+
              '        C.DATAPAGAMENTO                                         '+
              ' FROM   MOVBENEF M, CTRLINTERFACE C                             '+
              ' WHERE  M.IDMOVBENEF = (SELECT MAX(IDMOVBENEF)                  '+
              '                        FROM   MOVBENEF                         '+
              '                        WHERE  TIPOMOV    = 7                   '+
              '                        AND    IDDESFAZER IS NULL               '+
              '                        AND    IDTITULAR  = '+IntToStr(piIdPessoa) );
      if piNumeroProcesso > 0
      then SQL.Add('                   AND    NUMEROPROCESSO = '+IntToStr(piNumeroProcesso));

      if piIdBeneficio > 0
      then SQL.Add('                   AND    IDBENEFICIO    =  '+IntToStr(piIdBeneficio))
      else if Trim(sIdsBeneficios) <> ''
           then SQL.Add('              AND    IDBENEFICIO IN ('+sIdsBeneficios+') ');

      SQL.Add('                       )                                           ');
      SQL.Add(' AND    M.IDLOTEMOV = C.IDLOTE                                     ');
      Open;
      if not IsEmpty
      then begin
         sAnoMesReferencia := Copy(FieldByName('DATAPAGAMENTO').AsString,7,4)+'/'+Copy(FieldByName('DATAPAGAMENTO').AsString,4,2);
         sDataMov          := FieldByName('DATAMOV').AsString;
      end
      else sDataMov := '';
   end;
   
   
   // Verificar se existe padrao de movimentacao para o evento/beneficio indicados
   with dtmAPrev.qryMovReserva do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT M.IDMOVIMENTO, M.IDTIPORESERVADEST, M.IDPLANOPREVORIG,         '+
              '        M.IDTIPORESERVAORIG, M.IDPATROORIG, M.IDPATRODEST,             '+
              '        M.IDREGRA, M.IDEVENTOGERADOR, M.IDBENEFICIO,                   '+
              '        M.IDPLANOPREVDEST, M.IDREGRAVALIDACAO, M.SEQMOV,               '+
              '        M.CODCENTROCUSTOD, M.IDEMPRESA, M.CODCENTROCUSTOC,             '+
              '        M.CODSUBCONTA, M.UNIDNEGOC, M.PLACONTAD, M.PLANO, M.PLACONTAC, '+
              '        M.FLGCONTABILIZA, E.NOME,                                      '+
              '        RORIG.FLGCOLETIVA AS FLGCOLETIVAORIG,                          '+ 
              '        RDEST.FLGCOLETIVA AS FLGCOLETIVADEST                           '+ 
              ' FROM   EVENTOGERADOR E, MOVRESERVA M, RESERVAXPLANO RORIG,            '+ 
              '        RESERVAXPLANO RDEST                                            '+ 
              ' WHERE  M.IDEVENTOGERADOR       = '+IntToStr(piIdEventoGerador)         +
              ' AND    M.IDPLANOPREVORIG       = '+IntToStr(piIdPlanoPrev)             + 
              ' AND    M.IDPATROORIG           = '+IntToStr(piIdPessJur)               + 
              ' AND    E.IDEVENTOGERADOR       = M.IDEVENTOGERADOR                    '+ 
              ' AND    RORIG.IDPLANOPREV(+)    = M.IDPLANOPREVORIG                    '+ 
              ' AND    RORIG.IDTIPORESERVA(+)  = M.IDTIPORESERVAORIG                  '+ 
              ' AND    RDEST.IDPLANOPREV(+)    = M.IDPLANOPREVDEST                    '+ 
              ' AND    RDEST.IDTIPORESERVA(+)  = M.IDTIPORESERVADEST                  ');

      if piIdBeneficio > 0
      then SQL.Add(' AND ((M.IDBENEFICIO =  '+IntToStr(piIdBeneficio)+') OR (M.IDBENEFICIO IS NULL)) ')
      else if Trim(sIdsBeneficios) <> ''
           then SQL.Add(' AND ((M.IDBENEFICIO IN ('+sIdsBeneficios+')) OR (M.IDBENEFICIO IS NULL) ) ');

      Open;

      if IsEmpty // nao tem padrao de movimentacao
      then begin
         Close;
         Result := True;
         Exit;
      end;
   end;

   sPlanilhas := '';
   while not dtmAPrev.qryMovReserva.EOF do
   begin
      
      if dtmAPrev.qryMovReserva.FieldByName('FLGCOLETIVAORIG').AsInteger = 1
      then iIdPessoaOrig := piIdPessJur
      else iIdPessoaOrig := piIdPessoa;

      if dtmAPrev.qryMovReserva.FieldByName('FLGCOLETIVADEST').AsInteger = 1
      then iIdPessoaDest := piIdPessJur
      else iIdPessoaDest := piIdPessoa;
      


      // ACERTAR RESERVA DE DESTINO
      // Abrir histórico de movimentos para este movimento
      If Not dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').IsNull Then 
      Begin
        with dtmAPrev.qryReserva do
        begin
           Close;
           SQL.Clear;
           SQL.Add(' SELECT H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA, H.SEQPROPOSTA, H.FLGENTRADA, SUM(H.VLRCOTAS)  AS VLRCOTAS '+
                   ' FROM   HISTMOVRESERVA H                                                                                  '+
                   ' WHERE  H.IDPESSJUR     = '+IntToStr(piIdPessJur)+
                   ' AND    H.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+
                   ' AND    H.IDPESSOA      = '+IntToStr(iIdPessoaDest)+ 
                   ' AND    H.SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
                   ' AND    H.IDPARTICIPANTE = '+IntToStr(piIdPessoa)+  
                   ' AND    H.IDTIPORESERVA = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsString+
  
  
                   ' AND    ((H.MESREFERENCIA = '+quotedstr(sAnoMesReferencia)+') OR '+
                   '(RTRIM(LTRIM(H.MESREFERENCIA)) = ''/'') ) ' );
  

           if dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString <> ''
           then SQL.Add(' AND   H.IDBENEFICIO = '+dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString);

           if Trim(sDataMov) <> ''
           then SQL.Add(' AND   TO_CHAR(H.DATAMOV,''DD/MM/YYYY'') = '''+sDataMov+''' ');

           SQL.Add(' GROUP BY H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA, H.SEQPROPOSTA, H.FLGENTRADA ');
           Open;

           while not EOF do
           begin
              dVlrCotas   := FieldByName('VLRCOTAS').AsFloat;

              
              // BUSCAR O VALOR DA RESERVA E FAZER A CONTA NO DELPHI, POIS FAZER
              // DIRETO NO UPDATE ESTÁ DEIXANDO LIXO NA BASE.
              // EXEMPLO : 580.93 - 580.93 = 1-E98747383
              dtmAPrev.qryAux.Close;
              dtmAPrev.qryAux.SQL.Clear;
              dtmAPrev.qryAux.SQL.Add(' SELECT NVL(VALORRESERVA,0) as VALORRESERVA FROM RESERVAPART '+      // SIG 129320 Ferrari
                                      ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
                                      ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+
                                      ' AND    IDPESSOA      = '+IntToStr(iIdPessoaDest)+ 
                                      ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
                                      ' AND    IDTIPORESERVA = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsString);
              dtmAPrev.qryAux.Open;
              if not dtmAPrev.qryAux.IsEmpty
              then dValorAtual := dtmAPrev.qryAux.FieldByName('VALORRESERVA').AsFloat
              else dValorAtual := 0;

              if FieldByName('FLGENTRADA').AsInteger = 0
              then dValorAtual := dValorAtual + dVlrCotas
              else dValorAtual := dValorAtual - dVlrCotas;
              if dValorAtual < 0.001 then dValorAtual := 0;
              

              // Se o movimento foi de SAIDA, entao fazer uma ENTRADA na reserva
              // Se o movimento foi uma ENTRADA, entao fazer uma SAIDA na reserva
              if FieldByName('FLGENTRADA').AsInteger = 0
              then cSinalOperacao := '+'
              else cSinalOperacao := '-';


              dtmAPrev.qryAux.Close;
              dtmAPrev.qryAux.SQL.Clear;
              
              dtmAPrev.qryAux.SQL.Add(' UPDATE RESERVAPART SET VALORRESERVA = '+OraNumero(FloatToStr(dValorAtual))+ 
                                      ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
                                      ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+
                                      ' AND    IDPESSOA      = '+IntToStr(iIdPessoaDest)+
                                      ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
                                      ' AND    IDTIPORESERVA = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsString);
              try
                 dtmAPrev.qryAux.ExecSQL;
              except
                 Exit;
              end;

              dtmAPrev.qryAux.Close;
              dtmAPrev.qryAux.SQL.Clear;
              dtmAPrev.qryAux.SQL.Add(' DELETE FROM HISTMOVRESERVA '+
                                      ' WHERE  IDPESSJUR      = '+IntToStr(piIdPessJur)+
                                      ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                                      ' AND    IDPESSOA       = '+IntToStr(iIdPessoaDest)+
                                      ' AND    IDPARTICIPANTE = '+IntToStr(piIdPessoa)+  
                                      ' AND    SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
                                      ' AND    IDTIPORESERVA  = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsString+
                                      ' AND    MESREFERENCIA  = '''+sAnoMesReferencia+'''');
              if dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString <> ''
              then dtmAPrev.qryAux.SQL.Add(' AND   IDBENEFICIO = '+dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString);

              try
                 dtmAPrev.qryAux.ExecSQL;
              except
                 Exit;
              end;
              Next;
           end; // while not EOF
        end; // with dtmAPrev.qryReserva
      End; // If Not dtmAPrev.qryMovReserva...

      // ACERTAR RESERVA DE ORIGEM
      // Abrir histórico de movimentos para este movimento
      with dtmAPrev.qryReserva do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA, H.SEQPROPOSTA, H.FLGENTRADA, H.PLNCODIGO, SUM(H.VLRCOTAS)  AS VLRCOTAS '+
                 ' FROM   HISTMOVRESERVA H                                                                                  '+
                 ' WHERE  H.IDPESSJUR     = '+IntToStr(piIdPessJur)+
                 ' AND    H.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+
                 ' AND    H.IDPESSOA      = '+IntToStr(iIdPessoaOrig)+
                 ' AND    H.IDPARTICIPANTE= '+IntToStr(piIdPessoa)+  
                 ' AND    H.SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
                 ' AND    H.IDTIPORESERVA = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString+
                 ' AND    H.MESREFERENCIA = '''+sAnoMesReferencia+'''');

         if dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString <> ''
         then SQL.Add(' AND   H.IDBENEFICIO = '+dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString);

         if Trim(sDataMov) <> ''
         then SQL.Add(' AND   TO_CHAR(H.DATAMOV,''DD/MM/YYYY'') = '''+sDataMov+''' ');
         
         SQL.Add(' GROUP BY H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA, H.SEQPROPOSTA, H.FLGENTRADA, H.PLNCODIGO ');
         Open;

         while not EOF do
         begin
            dVlrCotas   := FieldByName('VLRCOTAS').AsFloat;

            
            // BUSCAR O VALOR DA RESERVA E FAZER A CONTA NO DELPHI, POIS FAZER
            // DIRETO NO UPDATE ESTÁ DEIXANDO LIXO NA BASE.
            // EXEMPLO : 580.93 - 580.93 = 1-E98747383
            dtmAPrev.qryAux.Close;
            dtmAPrev.qryAux.SQL.Clear;
            dtmAPrev.qryAux.SQL.Add(' SELECT NVL(VALORRESERVA,0) as VALORRESERVA FROM RESERVAPART '+            // SIG 129320 Ferrari
                                    ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
                                    ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+
                                    ' AND    IDPESSOA      = '+IntToStr(iIdPessoaOrig)+ 
                                    ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
                                    ' AND    IDTIPORESERVA = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString);
            dtmAPrev.qryAux.Open;
            if not dtmAPrev.qryAux.IsEmpty
            then dValorAtual := dtmAPrev.qryAux.FieldByName('VALORRESERVA').AsFloat
            else dValorAtual := 0;

            if FieldByName('FLGENTRADA').AsInteger = 0
            then dValorAtual := dValorAtual + dVlrCotas
            else dValorAtual := dValorAtual - dVlrCotas;
            
            
            

            

            if FieldByName('FLGENTRADA').AsInteger = 0
            then cSinalOperacao := '+'
            else cSinalOperacao := '-';

            dtmAPrev.qryAux.Close;
            dtmAPrev.qryAux.SQL.Clear;

            dtmAPrev.qryAux.SQL.Add(' UPDATE RESERVAPART SET VALORRESERVA = '+OraNumero(FloatToStr(dValorAtual))+ 
                                    ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
                                    ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)+
                                    ' AND    IDPESSOA      = '+IntToStr(iIdPessoaOrig)+ 
                                    ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
                                    ' AND    IDTIPORESERVA = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString);
            try
               dtmAPrev.qryAux.ExecSQL;
            except
               Exit;
            end;

            dtmAPrev.qryAux.Close;
            dtmAPrev.qryAux.SQL.Clear;
            dtmAPrev.qryAux.SQL.Add(' DELETE FROM HISTMOVRESERVA '+
                                    ' WHERE  IDPESSJUR      = '+IntToStr(piIdPessJur)+
                                    ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                                    ' AND    IDPESSOA       = '+IntToStr(iIdPessoaOrig)+ 
                                    ' AND    IDPARTICIPANTE = '+IntToStr(piIdPessoa)+    
                                    ' AND    SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
                                    ' AND    IDTIPORESERVA  = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString+
                                    ' AND    MESREFERENCIA  = '''+sAnoMesReferencia+'''');
            if dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString <> ''
            then dtmAPrev.qryAux.SQL.Add(' AND   IDBENEFICIO = '+dtmAPrev.qryMovReserva.FieldByName('IDBENEFICIO').AsString);

            try
               dtmAPrev.qryAux.ExecSQL;
            except
               Exit;
            end;

            if (FieldByName('PlnCodigo').AsInteger > 0) and (Pos(FieldByName('PlnCodigo').AsString, sPlanilhas) <= 0)
            then sPlanilhas := sPlanilhas + ','+FieldByName('PlnCodigo').AsString;

            Next;
         end; // while not EOF
      end; // with dtmAPrev.qryReserva
      dtmAPrev.qryMovReserva.Next;
   end;

   { Excluit MOVRESERVATMP }
   If Not ExecutarQuery(DtmAPrev.QryAux,'DELETE FROM MOVRESERVATEMP '+
                                        'WHERE NUMEROPROCESSO IN ('+IntToStr(piNumeroProcesso)+')')
   Then Begin
     Exit;
   End;
   
   { Guarda Planilhas que serão excluidas no final do processo }

   psPlanilhasExcluir := Copy(sPlanilhas, 2, Length(sPlanilhas));

   
   Result   := True;
end; // DESFAZPADRAOMOVRESERVA




//função que tem como objetivo por as alimentações de reservas referentes a
//uma pessoa em ordem quanto ao mês de referência a partir
//do mês de refereência passado
function AcertaHistMovReserva(qryAux         : TwwQuery; // query auxiliar
                              piIdPessJur    : Longint;
                              piIdPlanoPrev  : Longint;
                              piIdPessoa     : Longint;
                              piSeqProposta  : Longint;
                              psMesRef       : string
                             ): Boolean;
var
  sSQL              : WideString;
  sMesRefAux        : string;
  sIdTipoReservaAux : string;
  bAcerta           : Boolean;
  bPrimeiro         : Boolean;
  dSaldoAtu         : Double;
  dSaldoAtuCalc     : Double;
  dSaldoRealAtu     : Double;
  sAuxData: String; //BRUNO AZEVEDO SOL 145995 Kintana 1023814
  AnoMesAnterior    : String;  // THIAGO MELO SOL 180497 Kintana 1680040


  x : Integer;


  // THIAGO MELO SOL 180497 Kintana 1680040 Ini
  Function PegaMesAnterior (AnoMes : String) : String;
  var
    Mes : Integer;
    Ano : Integer;

  begin
    Ano := StrToInt(Copy(AnoMes,1,4));
    Mes := StrToInt(Copy(AnoMes,6,2));

    if Mes = 1 then begin
      Mes := 12;
      Dec(Ano);
    end
    else
      Dec(Mes);

    Result := IntToStr(Ano) + '/' + IntToStr(Mes);
  end;
  // THIAGO MELO SOL 180497 Kintana 1680040 Fim

begin
  Result := False;

  // Consulta do histórico
  // Comparando a ordem de inserção com a ordem desejada (mês de referência) (query)
  // Se o idhistreserva e mesreferencia forem diferentes entre as ordens então o histórico deve ser
  // refeito em vista da ordem por mês a partir da primeira ocorrência

  // A query principal guarda o formato original
  // Para cada ocorrência de diferença entre a ordem de inserção e a ordem por mêso processo apaga
  // o registro com o idhistreserva por ordem de inserção e insere um novo registro com os dados
  // pela ordem de mês alterando e guardando o saldo
  // Ao final do loop o histmovreserva está em ordem de mesreferencia e o saldo final é atualizado
  // na reservapart

  // -----------------------------------------------------------------------------------------------

  // A - ORDEM POR INSERÇÃO
  // B - ORDEM POR MÊS
  sSQL :=
  'SELECT '                                                                                + #13 +
  '  A.CONT, A.IDHISTRESERVA, A.MESREFERENCIA, A.SALDOCOTAS, A.SALDOREAL, '                + #13 +
  '  B.IDHISTRESERVA IDHISTRESERVAMES, B.MESREFERENCIA MESREFERENCIAMES, '                 + #13 +
  '  B.IDREGRACALCULO, B.IDTIPORESERVA, B.IDEVENTOGERADOR , '                              + #13 +
  '  B.IDCONTRIBUICAO, B.IDBENEFICIO, TO_CHAR(B.DATAMOV, ''DD/MM/YYYY'') DATAMOV, '        + #13 +
  '  B.VLRREAL, B.VLRCOTAS, B.FLGENTRADA, B.PERCENTUAL, B.IDPARTICIPANTE, '                + #13 +
  '  B.VALORINDICE, '                                                                      + #13 +
  '  TO_CHAR(B.TRGDTINCLUSAO, ''DD/MM/YYYY'') TRGDTINCLUSAO, B.TRGUSERINCLUSAO, '          + #13 +
  '  TO_CHAR(B.DATAALIMENTACAO,''DD/MM/YYYY'') DATAALIMENTACAO, '                          + #13 +
  '  B.FLGPROCEDENCIA, B.PLNCODIGO, TO_CHAR(B.DATAINDICE, ''DD/MM/YYYY'') DATAINDICE '     + #13 +
  ' ,B.SALDOREALCONT, B.INDICECORRECAO,B.NUMRECEBIMENTO, B.DATARECEBIMENTO,B.DTALTERACAO ' + #13 +// SOL 178720 Kintana 1649027
  ' ,B.USERALTERACAO, B.IDPESSOAORIGEM,B.IDPESSOADESTINO, '                                + #13 +// SOL 178720 Kintana 1649027

  // THIAGO MELO SOL 180497 Kintana 1680040 Ini

  '  SUBSTR(a.MESREFERENCIA, 6, 2) AS MESREF, '                                                                    + #13 +
  '  CASE '                                                                                                        + #13 +
  ' 	 WHEN SUBSTR(a.MESREFERENCIA, 6, 2) = ' + QuotedStr('13') + ' AND '                                        + #13 +
  ' 		  SUBSTR(TO_CHAR(a.MESREFERENCIA), 1, 4) = '                                                           + #13 +
  ' 		  SUBSTR(TO_CHAR(b.DATAALIMENTACAO, ' + QuotedStr('dd/mm/rrrr') + '), 7, 4) THEN '                     + #13 +
  ' 	  SUBSTR(TO_CHAR(b.DATAALIMENTACAO, ' + QuotedStr('dd/mm/rrrr') + '), 7, 4) || ' + QuotedStr('/') + ' || ' + #13 +
  '  	  SUBSTR(TO_CHAR(b.DATAALIMENTACAO, ' + QuotedStr('dd/mm/rrrr') + '), 4, 2) '                              + #13 +
  ' 	 ELSE  '                                                                                                   + #13 +
  ' 	  a.MESREFERENCIA   '                                                                                      + #13 +
  '  END AS DATATEST  '                                                                                            + #13 +
  // THIAGO MELO SOL 180497 Kintana 1680040 Fim

  'FROM '                                                                                 + #13 +
  '  ( '                                                                                  + #13 +
  '  SELECT '                                                                             + #13 +
  '    ROWNUM CONT, IDHISTRESERVA, IDREGRACALCULO, IDPLANOPREV, '                         + #13 +
  '    IDTIPORESERVA, IDPESSJUR, IDPESSOA, SEQPROPOSTA, IDEVENTOGERADOR , '               + #13 +
  '    IDCONTRIBUICAO, IDBENEFICIO, DATAMOV, VLRREAL, VLRCOTAS, SALDOREAL, '              + #13 +
  '    SALDOCOTAS, FLGENTRADA, PERCENTUAL, IDPARTICIPANTE, SALDOREALCONT, '               + #13 +
  '    VALORINDICE, TRGDTINCLUSAO, TRGUSERINCLUSAO, DATAALIMENTACAO, '                    + #13 +
  '    MESREFERENCIA, FLGPROCEDENCIA, PLNCODIGO, SALDOCORRIGIDO, '                        + #13 +
  '    INDICECORRECAO, DATAINDICE, IDPESSOAORIGEM,IDPESSOADESTINO '                       + #13 +
  '    ,DTALTERACAO ,USERALTERACAO, DATARECEBIMENTO, NUMRECEBIMENTO  '                    + #13 +
  '  FROM '                                                                               + #13 +
  '    ( '                                                                                + #13 +
  '    SELECT '                                                                           + #13 +
  '      H.IDHISTRESERVA, H.IDREGRACALCULO, H.IDPLANOPREV, H.IDTIPORESERVA, H.IDPESSJUR, '         + #13 +
  '      H.IDPESSOA, H.SEQPROPOSTA, H.IDEVENTOGERADOR, H.IDCONTRIBUICAO, H.IDBENEFICIO, '          + #13 +
  '      H.DATAMOV, H.VLRREAL, H.VLRCOTAS, H.SALDOREAL, H.SALDOCOTAS, H.FLGENTRADA, H.PERCENTUAL, '+ #13 +
  '      H.IDPARTICIPANTE, H.SALDOREALCONT, H.VALORINDICE, H.TRGDTINCLUSAO, H.TRGUSERINCLUSAO, '   + #13 +
  '      H.DATAALIMENTACAO, H.MESREFERENCIA, H.FLGPROCEDENCIA, H.PLNCODIGO, H.SALDOCORRIGIDO, '    + #13 +
  '      H.INDICECORRECAO, H.DATAINDICE, H.IDPESSOAORIGEM,H.IDPESSOADESTINO '                      + #13 +
  '    ,H.DTALTERACAO ,H.USERALTERACAO, H.DATARECEBIMENTO, H.NUMRECEBIMENTO  '                     + #13 +
  '    FROM '                                                                             + #13 +
  '      HISTMOVRESERVA H'                                             				      + #13 +
  '    WHERE '                                                                            + #13 +
  '          H.IDPESSJUR      = ' + IntToStr(piIdPessJur)                                 + #13 +
  '      AND H.IDPLANOPREV    = ' + IntToStr(piIdPlanoPrev)                               + #13 +
  '      AND H.IDPESSOA       = ' + IntToStr(piIdPessoa)                                  + #13 +
  '      AND H.SEQPROPOSTA    = ' + IntToStr(piSeqProposta)                               + #13 +
  '      AND H.MESREFERENCIA >= ''' + psMesRef + ''''                                     + #13 +
  '    ORDER BY '                                                                         + #13 +
  '      IDTIPORESERVA, IDHISTRESERVA '                                                   + #13 +
  '    ) '                                                                                + #13 +
  '  ) A, '                                                                               + #13 +

  '  ( '                                                                                  + #13 +
  '  SELECT '                                                                             + #13 +
  '    ROWNUM CONT, IDHISTRESERVA, IDREGRACALCULO, IDPLANOPREV, '                         + #13 +
  '    IDTIPORESERVA, IDPESSJUR, IDPESSOA, SEQPROPOSTA, IDEVENTOGERADOR, '                + #13 +
  '    IDCONTRIBUICAO, IDBENEFICIO, DATAMOV, VLRREAL, VLRCOTAS, SALDOREAL, '              + #13 +
  '    SALDOCOTAS, FLGENTRADA, PERCENTUAL, IDPARTICIPANTE, SALDOREALCONT, '               + #13 +
  '    VALORINDICE, TRGDTINCLUSAO, TRGUSERINCLUSAO, DATAALIMENTACAO, '                    + #13 +
  '    MESREFERENCIA, FLGPROCEDENCIA, PLNCODIGO, SALDOCORRIGIDO, '                        + #13 +
  '    INDICECORRECAO, DATAINDICE, IDPESSOAORIGEM,IDPESSOADESTINO '                       + #13 +
  '    ,DTALTERACAO ,USERALTERACAO, DATARECEBIMENTO, NUMRECEBIMENTO  '                    + #13 +
  '  FROM '                                                                               + #13 +
  '    ( '                                                                                + #13 +
  '    SELECT '                                                                           + #13 +
  '      H.IDHISTRESERVA, H.IDREGRACALCULO, H.IDPLANOPREV, H.IDTIPORESERVA, H.IDPESSJUR, '          + #13 +
  '      H.IDPESSOA, H.SEQPROPOSTA, H.IDEVENTOGERADOR, H.IDCONTRIBUICAO, H.IDBENEFICIO, '           + #13 +
  '      H.DATAMOV, H.VLRREAL, H.VLRCOTAS, H.SALDOREAL, H.SALDOCOTAS, H.FLGENTRADA, H.PERCENTUAL, ' + #13 +
  '      H.IDPARTICIPANTE, H.SALDOREALCONT, H.VALORINDICE, H.TRGDTINCLUSAO, H.TRGUSERINCLUSAO, '    + #13 +
  '      H.DATAALIMENTACAO, H.MESREFERENCIA, H.FLGPROCEDENCIA, H.PLNCODIGO, H.SALDOCORRIGIDO, '     + #13 +
  '      H.INDICECORRECAO, H.DATAINDICE, H.IDPESSOAORIGEM, H.IDPESSOADESTINO '                      + #13 +
  '    ,H.DTALTERACAO ,H.USERALTERACAO, H.DATARECEBIMENTO, H.NUMRECEBIMENTO  '                      + #13 +
  '    FROM '                                                                             + #13 +
  '      HISTMOVRESERVA H' 			   		                                              + #13 +
  '    WHERE '                                                                            + #13 +
  '          H.IDPESSJUR      = ' + IntToStr(piIdPessJur)                                 + #13 +
  '      AND H.IDPLANOPREV    = ' + IntToStr(piIdPlanoPrev)                               + #13 +
  '      AND H.IDPESSOA       = ' + IntToStr(piIdPessoa)                                  + #13 +
  '      AND H.SEQPROPOSTA    = ' + IntToStr(piSeqProposta)                               + #13 +
  '      AND H.MESREFERENCIA >= ''' + psMesRef + ''''                                     + #13 +
  '    ORDER BY '                                                                         + #13 +
  '      IDTIPORESERVA, MESREFERENCIA '                                                   + #13 +
  '    ) '                                                                                + #13 +
  '  ) B '                                                                                + #13 +

  'WHERE '                                                                                + #13 +
  '  A.CONT = B.CONT '                                                                    + #13 +
  // THIAGO MELO SOL 180497 Kintana 1680040 Ini
//  '  ORDER BY DATATEST, a.MESREFERENCIA, A.IDHISTRESERVA ';
  '  ORDER BY A.IDTIPORESERVA, DATATEST, a.MESREFERENCIA ';
  // THIAGO MELO SOL 180497 Kintana 1680040 Fim  

  dtmAPrev.qryReserva.Close;
  dtmAPrev.qryReserva.SQL.Clear;
  dtmAPrev.qryReserva.SQL.Text := sSQL;
  dtmAPrev.qryReserva.Open;

  if dtmAPrev.qryReserva.IsEmpty then
  begin
    dtmAPrev.qryReserva.Close;
    Result := True;
    Exit;
  end;

  // -----------------------------------------------------------------------------------------------

  dtmAPrev.qryReserva.First;
  while not(dtmAPrev.qryReserva.EOF) do
  begin
    sIdTipoReservaAux := dtmAPrev.qryReserva.FieldByName('IDTIPORESERVA').AsString;
    sMesRefAux        := dtmAPrev.qryReserva.FieldByName('MESREFERENCIA').AsString;
    bAcerta           := False;
    dSaldoAtu         := 0;
    dSaldoRealAtu     := 0;
    bPrimeiro         := True;

    // loop para a mesma reserva
    while not(dtmAPrev.qryReserva.EOF) and (sIdTipoReservaAux = dtmAPrev.qryReserva.FieldByName('IDTIPORESERVA').AsString ) do
    begin
      // procura um ocorrência de assincronismo no histórico
      // a partir da primeira refazer todos os demais registros
      if (dtmAPrev.qryReserva.FieldByName('IDHISTRESERVA').AsString <> dtmAPrev.qryReserva.FieldByName('IDHISTRESERVAMES').AsString) and
         (dtmAPrev.qryReserva.FieldByName('MESREFERENCIA').AsString <> dtmAPrev.qryReserva.FieldByName('MESREFERENCIAMES').AsString) then
        bAcerta := True;

      bAcerta := True;

{      if Trim(dtmAPrev.qryReserva.FieldByName('MESREFERENCIAMES').AsString) = '2012/05' then
        ShowMessage('');       }

      if bAcerta then
      begin
        //pega o saldo anterior
        if bPrimeiro then
        begin
          // THIAGO MELO SOL 180497 Kintana 1680040

{          sSQL :=
          'SELECT '                                                                                 + #13 +
          '  H.SALDOCOTAS, H.SALDOREAL '                                                            + #13 +
          'FROM '                                                                                   + #13 +
          '  HISTMOVRESERVA H '                                                                     + #13 +
          'WHERE '                                                                                  + #13 +
          '      H.IDPESSJUR      = ' + IntToStr(piIdPessJur)                                       + #13 +
          '  AND H.IDPLANOPREV    = ' + IntToStr(piIdPlanoPrev)                                     + #13 +
          '  AND H.IDPESSOA       = ' + IntToStr(piIdPessoa)                                        + #13 +
          '  AND H.SEQPROPOSTA    = ' + IntToStr(piSeqProposta)                                     + #13 +
          '  AND H.IDTIPORESERVA  = ' + dtmAPrev.qryReserva.FieldByName('IDTIPORESERVA').AsString   + #13 +
          '  AND HT.IDHISTRESERVA  < ' + dtmAPrev.qryReserva.FieldByName('IDHISTRESERVA').AsString   + #13 +

          '  AND H.IDHISTRESERVA  = ( '                                                             + #13 +
          '                         SELECT '                                                        + #13 +
          '                           MAX(HT.IDHISTRESERVA) '                                       + #13 +
          '                         FROM '                                                          + #13 +
          '                           HISTMOVRESERVA HT '                                           + #13 +
          '                         WHERE '                                                         + #13 +
          '                               HT.IDHISTRESERVA  < ' + dtmAPrev.qryReserva.FieldByName('IDHISTRESERVA').AsString   + #13 +
          '                           AND HT.IDPESSJUR      = H.IDPESSJUR '                                                   + #13 +
          '                           AND HT.IDPLANOPREV    = H.IDPLANOPREV '                                                 + #13 +
          '                           AND HT.IDPESSOA       = H.IDPESSOA '                                                    + #13 +
          '                           AND HT.SEQPROPOSTA    = H.SEQPROPOSTA '                                                 + #13 +
          '                           AND HT.IDTIPORESERVA = H.IDTIPORESERVA '                                                + #13 +
          '                         ) ';

          qryAux.Close;
          qryAux.SQL.Text := sSQL;
          qryAux.Open;       }

          // THIAGO MELO SOL 180497 Kintana 1680040

          // se foi a primeira alimentação


         // THIAGO MELO SOL 180497 Kintana 1680040 Ini
          sSQL := '';

          AnoMesAnterior := PegaMesAnterior(psMesRef);

          sSQL :=
          'SELECT '                                                                                + #13 +
          '  A.CONT, A.IDHISTRESERVA, A.MESREFERENCIA, A.SALDOCOTAS, A.SALDOREAL, '                + #13 +
          '  B.IDHISTRESERVA IDHISTRESERVAMES, B.MESREFERENCIA MESREFERENCIAMES, '                 + #13 +
          '  B.IDREGRACALCULO, B.IDTIPORESERVA, B.IDEVENTOGERADOR , '                              + #13 +
          '  B.IDCONTRIBUICAO, B.IDBENEFICIO, TO_CHAR(B.DATAMOV, ''DD/MM/YYYY'') DATAMOV, '        + #13 +
          '  B.VLRREAL, B.VLRCOTAS, B.FLGENTRADA, B.PERCENTUAL, B.IDPARTICIPANTE, '                + #13 +
          '  B.VALORINDICE, '                                                                      + #13 +
          '  TO_CHAR(B.TRGDTINCLUSAO, ''DD/MM/YYYY'') TRGDTINCLUSAO, B.TRGUSERINCLUSAO, '          + #13 +
          '  TO_CHAR(B.DATAALIMENTACAO,''DD/MM/YYYY'') DATAALIMENTACAO, '                          + #13 +
          '  B.FLGPROCEDENCIA, B.PLNCODIGO, TO_CHAR(B.DATAINDICE, ''DD/MM/YYYY'') DATAINDICE '     + #13 +
          ' ,B.SALDOREALCONT, B.INDICECORRECAO,B.NUMRECEBIMENTO, B.DATARECEBIMENTO,B.DTALTERACAO ' + #13 +// SOL 178720 Kintana 1649027
          ' ,B.USERALTERACAO, B.IDPESSOAORIGEM,B.IDPESSOADESTINO, '                                + #13 +// SOL 178720 Kintana 1649027


          '  SUBSTR(a.MESREFERENCIA, 6, 2) AS MESREF, '                                                                    + #13 +
          '  CASE '                                                                                                        + #13 +
          ' 	 WHEN SUBSTR(a.MESREFERENCIA, 6, 2) = ' + QuotedStr('13') + ' AND '                                        + #13 +
          ' 		  SUBSTR(TO_CHAR(a.MESREFERENCIA), 1, 4) = '                                                       + #13 +
          ' 		  SUBSTR(TO_CHAR(b.DATAALIMENTACAO, ' + QuotedStr('dd/mm/rrrr') + '), 7, 4) THEN '                 + #13 +
          ' 	  SUBSTR(TO_CHAR(b.DATAALIMENTACAO, ' + QuotedStr('dd/mm/rrrr') + '), 7, 4) || ' + QuotedStr('/') + ' || ' + #13 +
          '  	  SUBSTR(TO_CHAR(b.DATAALIMENTACAO, ' + QuotedStr('dd/mm/rrrr') + '), 4, 2) '                              + #13 +
          ' 	 ELSE  '                                                                                                   + #13 +
          ' 	  a.MESREFERENCIA   '                                                                                      + #13 +
          '  END AS DATATEST  '                                                                                            + #13 +

          'FROM '                                                                                 + #13 +
          '  ( '                                                                                  + #13 +
          '  SELECT '                                                                             + #13 +
          '    ROWNUM CONT, IDHISTRESERVA, IDREGRACALCULO, IDPLANOPREV, '                         + #13 +
          '    IDTIPORESERVA, IDPESSJUR, IDPESSOA, SEQPROPOSTA, IDEVENTOGERADOR , '               + #13 +
          '    IDCONTRIBUICAO, IDBENEFICIO, DATAMOV, VLRREAL, VLRCOTAS, SALDOREAL, '              + #13 +
          '    SALDOCOTAS, FLGENTRADA, PERCENTUAL, IDPARTICIPANTE, SALDOREALCONT, '               + #13 +
          '    VALORINDICE, TRGDTINCLUSAO, TRGUSERINCLUSAO, DATAALIMENTACAO, '                    + #13 +
          '    MESREFERENCIA, FLGPROCEDENCIA, PLNCODIGO, SALDOCORRIGIDO, '                        + #13 +
          '    INDICECORRECAO, DATAINDICE, IDPESSOAORIGEM,IDPESSOADESTINO '                       + #13 +
          '    ,DTALTERACAO ,USERALTERACAO, DATARECEBIMENTO, NUMRECEBIMENTO  '                    + #13 +
          '  FROM '                                                                               + #13 +
          '    ( '                                                                                + #13 +
          '    SELECT '                                                                           + #13 +
          '      H.IDHISTRESERVA, H.IDREGRACALCULO, H.IDPLANOPREV, H.IDTIPORESERVA, H.IDPESSJUR, '         + #13 +
          '      H.IDPESSOA, H.SEQPROPOSTA, H.IDEVENTOGERADOR, H.IDCONTRIBUICAO, H.IDBENEFICIO, '          + #13 +
          '      H.DATAMOV, H.VLRREAL, H.VLRCOTAS, H.SALDOREAL, H.SALDOCOTAS, H.FLGENTRADA, H.PERCENTUAL, '+ #13 +
          '      H.IDPARTICIPANTE, H.SALDOREALCONT, H.VALORINDICE, H.TRGDTINCLUSAO, H.TRGUSERINCLUSAO, '   + #13 +
          '      H.DATAALIMENTACAO, H.MESREFERENCIA, H.FLGPROCEDENCIA, H.PLNCODIGO, H.SALDOCORRIGIDO, '    + #13 +
          '      H.INDICECORRECAO, H.DATAINDICE, H.IDPESSOAORIGEM,H.IDPESSOADESTINO '                      + #13 +
          '    ,H.DTALTERACAO ,H.USERALTERACAO, H.DATARECEBIMENTO, H.NUMRECEBIMENTO  '                     + #13 +
          '    FROM '                                                                             + #13 +
          '      HISTMOVRESERVA H '                                             	          + #13 +
          '    WHERE '                                                                            + #13 +
          '          H.IDPESSJUR      = ' + IntToStr(piIdPessJur)                                 + #13 +
          '      AND H.IDPLANOPREV    = ' + IntToStr(piIdPlanoPrev)                               + #13 +
          '      AND H.IDPESSOA       = ' + IntToStr(piIdPessoa)                                  + #13 +
          '      AND H.SEQPROPOSTA    = ' + IntToStr(piSeqProposta)                               + #13 +
          '      AND H.MESREFERENCIA  = ' + QuotedStr(Copy(AnoMesAnterior,1,4)) + ' || ' + QuotedStr('/') + ' || TRIM(TO_CHAR('  + QuotedStr(Copy(AnoMesAnterior,6,2)) + ',' + QuotedStr('00') + '))'  + #13 +
          '      AND H.IDTIPORESERVA  = ' + dtmAPrev.qryReserva.FieldByName('IDTIPORESERVA').AsString + #13 +
          '    ORDER BY '                                                                         + #13 +
          '      IDTIPORESERVA, IDHISTRESERVA '                                                   + #13 +
          '    ) '                                                                                + #13 +
          '  ) A, '                                                                               + #13 +

          '  ( '                                                                                  + #13 +
          '  SELECT '                                                                             + #13 +
          '    ROWNUM CONT, IDHISTRESERVA, IDREGRACALCULO, IDPLANOPREV, '                         + #13 +
          '    IDTIPORESERVA, IDPESSJUR, IDPESSOA, SEQPROPOSTA, IDEVENTOGERADOR, '                + #13 +
          '    IDCONTRIBUICAO, IDBENEFICIO, DATAMOV, VLRREAL, VLRCOTAS, SALDOREAL, '              + #13 +
          '    SALDOCOTAS, FLGENTRADA, PERCENTUAL, IDPARTICIPANTE, SALDOREALCONT, '               + #13 +
          '    VALORINDICE, TRGDTINCLUSAO, TRGUSERINCLUSAO, DATAALIMENTACAO, '                    + #13 +
          '    MESREFERENCIA, FLGPROCEDENCIA, PLNCODIGO, SALDOCORRIGIDO, '                        + #13 +
          '    INDICECORRECAO, DATAINDICE, IDPESSOAORIGEM,IDPESSOADESTINO '                       + #13 +
          '    ,DTALTERACAO ,USERALTERACAO, DATARECEBIMENTO, NUMRECEBIMENTO  '                    + #13 +
          '  FROM '                                                                               + #13 +
          '    ( '                                                                                + #13 +
          '    SELECT '                                                                           + #13 +
          '      H.IDHISTRESERVA, H.IDREGRACALCULO, H.IDPLANOPREV, H.IDTIPORESERVA, H.IDPESSJUR, '          + #13 +
          '      H.IDPESSOA, H.SEQPROPOSTA, H.IDEVENTOGERADOR, H.IDCONTRIBUICAO, H.IDBENEFICIO, '           + #13 +
          '      H.DATAMOV, H.VLRREAL, H.VLRCOTAS, H.SALDOREAL, H.SALDOCOTAS, H.FLGENTRADA, H.PERCENTUAL, ' + #13 +
          '      H.IDPARTICIPANTE, H.SALDOREALCONT, H.VALORINDICE, H.TRGDTINCLUSAO, H.TRGUSERINCLUSAO, '    + #13 +
          '      H.DATAALIMENTACAO, H.MESREFERENCIA, H.FLGPROCEDENCIA, H.PLNCODIGO, H.SALDOCORRIGIDO, '     + #13 +
          '      H.INDICECORRECAO, H.DATAINDICE, H.IDPESSOAORIGEM, H.IDPESSOADESTINO '                      + #13 +
          '    ,H.DTALTERACAO ,H.USERALTERACAO, H.DATARECEBIMENTO, H.NUMRECEBIMENTO  '                      + #13 +
          '    FROM '                                                                             + #13 +
          '      HISTMOVRESERVA H ' 		   	                                                  + #13 +
          '    WHERE '                                                                            + #13 +
          '          H.IDPESSJUR      = ' + IntToStr(piIdPessJur)                                 + #13 +
          '      AND H.IDPLANOPREV    = ' + IntToStr(piIdPlanoPrev)                               + #13 +
          '      AND H.IDPESSOA       = ' + IntToStr(piIdPessoa)                                  + #13 +
          '      AND H.SEQPROPOSTA    = ' + IntToStr(piSeqProposta)                               + #13 +
          '      AND H.MESREFERENCIA  = ' + QuotedStr(Copy(AnoMesAnterior,1,4)) + ' || ' + QuotedStr('/') + ' || TRIM(TO_CHAR('  + QuotedStr(Copy(AnoMesAnterior,6,2)) + ',' + QuotedStr('00') + '))'  + #13 +
          '      AND H.IDTIPORESERVA  = ' + dtmAPrev.qryReserva.FieldByName('IDTIPORESERVA').AsString + #13 +
          '    ORDER BY '                                                                         + #13 +
          '      IDTIPORESERVA, MESREFERENCIA '                                                   + #13 +
          '    ) '                                                                                + #13 +
          '  ) B '                                                                                + #13 +

          'WHERE '                                                                                + #13 +
          '  A.CONT = B.CONT '                                                                    + #13 +
          '  AND ROWNUM = 1  '                                                                    + #13 +
          '  ORDER BY A.IDTIPORESERVA, DATATEST, a.MESREFERENCIA ';

          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.SQL.Text := sSQL;
          qryAux.Open;

          if not(qryAux.IsEmpty) then begin
            dSaldoAtu     := qryAux.FieldByName('SALDOCOTAS').AsFloat;
            dSaldoRealAtu := qryAux.FieldByName('SALDOREAL').AsFloat;
          end;
          bPrimeiro := false;
        end;
         // THIAGO MELO SOL 180497 Kintana 1680040 Fim

        // deleta o registro com IDHISTRESERVA de A
        qryAux.Close;
        qryAux.SQL.Text := 'DELETE FROM HISTMOVRESERVA WHERE IDHISTRESERVA = ' + dtmAPrev.qryReserva.FieldByName('IDHISTRESERVA').AsString;
        qryAux.ExecSQL;

        if dtmAPrev.qryReserva.FieldByName('FLGENTRADA').AsString = '1' then
        begin

           dSaldoAtu      := dSaldoAtu + abs(dtmAPrev.qryReserva.FieldByName('VLRCOTAS').AsFloat);
         // THIAGO MELO SOL 180497 Kintana 1680040
//           dSaldoRealAtu  := dSaldoRealAtu + abs(dtmAPrev.qryReserva.FieldByName('VLRREAL').AsFloat);
           dSaldoRealAtu  := dSaldoAtu * dtmAPrev.qryReserva.FieldByName('VALORINDICE').AsFloat;
         // THIAGO MELO SOL 180497 Kintana 1680040
        end
        else
        begin
           dSaldoAtu      := dSaldoAtu - abs(dtmAPrev.qryReserva.FieldByName('VLRCOTAS').AsFloat);
           dSaldoRealAtu  := dSaldoRealAtu - abs(dtmAPrev.qryReserva.FieldByName('VLRREAL').AsFloat);
        end;


        //BRUNO AZEVEDO SOL 145995 Kintana 1023814
        sAuxData := iif((trim(dtmAPrev.qryReserva.FieldByName('DATAALIMENTACAO').AsString) = ''),
                         'TO_DATE(''' + dtmAPrev.qryReserva.FieldByName('DATAMOV').AsString + ''', ''DD/MM/YYYY'')',
                         'TO_DATE(''' + dtmAPrev.qryReserva.FieldByName('DATAALIMENTACAO').AsString + ''', ''DD/MM/YYYY'')');

        // insere o registro com dados de B  aproveitando IDHISTRESERVA de A
        sSQL :=
        'INSERT INTO HISTMOVRESERVA '                                                         + #13 +
        '( '                                                                                  + #13 +
        'IDHISTRESERVA, IDREGRACALCULO, IDPLANOPREV, '                                        + #13 +
        'IDTIPORESERVA, IDPESSJUR, IDPESSOA, SEQPROPOSTA, IDEVENTOGERADOR, '                  + #13 +
        'IDCONTRIBUICAO,IDBENEFICIO, DATAMOV, VLRREAL, VLRCOTAS, SALDOREAL, '                 + #13 +
        'SALDOCOTAS, FLGENTRADA, PERCENTUAL, IDPARTICIPANTE, '                                + #13 +
        'VALORINDICE, TRGDTINCLUSAO, TRGUSERINCLUSAO, DATAALIMENTACAO, '                      + #13 +
        'MESREFERENCIA, FLGPROCEDENCIA, PLNCODIGO, DATAINDICE '                               + #13 +
        ',SALDOREALCONT, INDICECORRECAO,NUMRECEBIMENTO, DATARECEBIMENTO,DTALTERACAO '         + #13 + // SOL 178720 Kintana 1649027
        ',USERALTERACAO, IDPESSOAORIGEM,IDPESSOADESTINO '                                      + #13 + // SOL 178720 Kintana 1649027
        ') '                                                                                  + #13 +

        'VALUES '                                                                             + #13 +

        '( '                                                                                  + #13 +

        dtmAPrev.qryReserva.FieldByName('IDHISTRESERVA').AsString                             + ', ' + #13 +
        // Denise 21/08/2008 Sol: 93841 Kintana: 403367
        IIF(length(dtmAPrev.qryReserva.FieldByName('IDREGRACALCULO').AsString)>0,QuotedStr(dtmAPrev.qryReserva.FieldByName('IDREGRACALCULO').AsString),'NULL')+ ', ' + #13 +
        IntToStr(piIdPlanoPrev)                                                               + ', ' + #13 +
        dtmAPrev.qryReserva.FieldByName('IDTIPORESERVA').AsString                             + ', ' + #13 +
        IntToStr(piIdPessJur)                                                                 + ', ' + #13 +
        IntToStr(piIdPessoa)                                                                  + ', ' + #13 +
        IntToStr(piSeqProposta)                                                               + ', ' + #13 +
        // Denise 21/08/2008 Sol: 93841 Kintana: 403367
        IIF(length(dtmAPrev.qryReserva.FieldByName('IDEVENTOGERADOR').AsString)>0,QuotedStr(dtmAPrev.qryReserva.FieldByName('IDEVENTOGERADOR').AsString),'NULL')+ ', ' + #13 +
        QuotedStr(dtmAPrev.qryReserva.FieldByName('IDCONTRIBUICAO').AsString)                 + ', ' + #13 +
        // Denise 21/08/2008 Sol: 93841 Kintana: 403367
        IIF(length(dtmAPrev.qryReserva.FieldByName('IDBENEFICIO').AsString)>0,QuotedStr(dtmAPrev.qryReserva.FieldByName('IDBENEFICIO').AsString),'NULL')+ ', ' + #13 +

        'TO_DATE(''' + dtmAPrev.qryReserva.FieldByName('DATAMOV').AsString + ''', ''DD/MM/YYYY''), '          + #13 +
        // SOL 170679 Kintana 1534729
        OraNumero(dtmAPrev.qryReserva.FieldByName('VLRREAL').AsString)                        + ', ' + #13 +
        OraNumero(dtmAPrev.qryReserva.FieldByName('VLRCOTAS').AsString)                       + ', ' + #13 +
        // SOL 170679 Kintana 1534729
        // SOL 170679 Kintana 1534729 comentado o trecho abaixo
        // SOL 167888 Kintana 1489782 -- Otacilio aquino ** Inicio **
        {IIF(pos('-', dtmAPrev.qryReserva.FieldByName('VLRREAL').AsString) > 0,
                     OraNumero(StringReplace(dtmAPrev.qryReserva.FieldByName('VLRREAL').AsString, '-', '', [rfReplaceAll])),
                     OraNumero(dtmAPrev.qryReserva.FieldByName('VLRREAL').AsString)) + ', ' + #13 +

        IIF(pos('-', dtmAPrev.qryReserva.FieldByName('VLRCOTAS').AsString) > 0,
                     OraNumero(StringReplace(dtmAPrev.qryReserva.FieldByName('VLRCOTAS').AsString, '-', '', [rfReplaceAll])),
                     OraNumero(dtmAPrev.qryReserva.FieldByName('VLRCOTAS').AsString)) + ', ' + #13 +       }

        // SOL 167888 Kintana 1489782 -- Otacilio aquino ** Fim **

        OraNumero(FloatToStr(dSaldoRealAtu))                                                  + ', ' + #13 +
        OraNumero(FloatToStr(dSaldoAtu))                                                      + ', ' + #13 +

        dtmAPrev.qryReserva.FieldByName('FLGENTRADA').AsString                                + ', ' + #13 +
        OraNumero(dtmAPrev.qryReserva.FieldByName('PERCENTUAL').AsString)                     + ', ' + #13 +
        // Denise 21/08/2008 Sol: 93841 Kintana: 403367
        IIF(length(dtmAPrev.qryReserva.FieldByName('IDPARTICIPANTE').AsString)>0,dtmAPrev.qryReserva.FieldByName('IDPARTICIPANTE').AsString,'NULL')+ ', ' + #13 +
        OraNumero(dtmAPrev.qryReserva.FieldByName('VALORINDICE').AsString)                    + ', ' + #13 +

        'TO_DATE(''' + dtmAPrev.qryReserva.FieldByName('TRGDTINCLUSAO').AsString + ''', ''DD/MM/YYYY''), '    + #13 +

        QuotedStr(dtmAPrev.qryReserva.FieldByName('TRGUSERINCLUSAO').AsString)                + ', ' + #13 +

        sAuxData + ' , '  + #13 +  //BRUNO AZEVEDO SOL 145995 Kintana 1023814

        QuotedStr(dtmAPrev.qryReserva.FieldByName('MESREFERENCIAMES').AsString)               + ', ' + #13 +
        QuotedStr(dtmAPrev.qryReserva.FieldByName('FLGPROCEDENCIA').AsString)                 + ', ' + #13 +
        // Denise 21/08/2008 Sol: 93841 Kintana: 403367
        IIF(length(dtmAPrev.qryReserva.FieldByName('PLNCODIGO').AsString)>0,QuotedStr(dtmAPrev.qryReserva.FieldByName('PLNCODIGO').AsString),'NULL')+ ', ' + #13 +

        'TO_DATE(''' + dtmAPrev.qryReserva.FieldByName('DATAINDICE').AsString + ''', ''DD/MM/YYYY'') '        + #13 +

        ', '+QuotedStr(dtmAPrev.qryReserva.FieldByName('SALDOREALCONT').AsString)  + ', ' + #13 +// SOL 178720 Kintana 1649027
        QuotedStr(dtmAPrev.qryReserva.FieldByName('INDICECORRECAO').AsString) + ', ' + #13 +// SOL 178720 Kintana 1649027
        QuotedStr(dtmAPrev.qryReserva.FieldByName('NUMRECEBIMENTO').AsString) + ', ' + #13 +// SOL 178720 Kintana 1649027
        QuotedStr(dtmAPrev.qryReserva.FieldByName('DATARECEBIMENTO').AsString)+ ', ' + #13 +// SOL 178720 Kintana 1649027
        'TO_DATE(''' + dtmAPrev.qryReserva.FieldByName('DTALTERACAO').AsString + ''', ''DD/MM/YYYY hh24:mi:ss'') ,'        + #13 +
        //QuotedStr(dtmAPrev.qryReserva.FieldByName('DTALTERACAO').AsString)    + ', ' + #13 +// SOL 178720 Kintana 1649027
        QuotedStr(dtmAPrev.qryReserva.FieldByName('USERALTERACAO').AsString)  + ', ' + #13 +// SOL 178720 Kintana 1649027
        QuotedStr(dtmAPrev.qryReserva.FieldByName('IDPESSOAORIGEM').AsString)  + ', ' + #13 +// SOL 178720 Kintana 1649027
        QuotedStr(dtmAPrev.qryReserva.FieldByName('IDPESSOADESTINO').AsString)+ ' ' + #13 +// SOL 178720 Kintana 1649027
        ') ';

        qryAux.Close;
        qryAux.SQL.Text := sSQL;
        qryAux.ExecSQL;
      end;

      // update reservapart com o último saldo
      if dSaldoAtu > 0 then
      begin
        sSQL :=
        'UPDATE '                                                     + #13 +
        '  RESERVAPART '                                              + #13 +
        'SET '                                                        + #13 +
        '  VALORRESERVA       = ' + OraNumero(FloatToStr(dSaldoAtu))  + #13 +
        'WHERE '                                                      + #13 +
        '      IDPESSJUR      = ' + IntToStr(piIdPessJur)             + #13 +
        '  AND IDPLANOPREV    = ' + IntToStr(piIdPlanoPrev)           + #13 +
        '  AND IDPESSOA       = ' + IntToStr(piIdPessoa)              + #13 +
        '  AND SEQPROPOSTA    = ' + IntToStr(piSeqProposta)           + #13 +
        '  AND IDTIPORESERVA  = ' + dtmAPrev.qryReserva.FieldByName('IDTIPORESERVA').AsString;

        qryAux.Close;
        qryAux.SQL.Text := sSQL;
        qryAux.ExecSQL;
      end;

      dtmAPrev.qryReserva.Next;
    end; // loop mesma reserva

    // atualiza reservapart ao final do loop por reserva
    // sIdTipoReservaAux

   end; // while

   Result := True;
end;


//edilaine - SIG24360 - inicio
function AcertaHistMovReserva (psMesRef        : string;
                               piIdPessJur,
                               piIdPlanoPrev,
                               piIdPessoa,
                               piSeqProposta   : Longint ) : boolean;
var
  _Qry, _qryAux : TwwQuery;
  sSQL : TStringList;
begin
  _Qry    := TwwQuery.Create(nil);
  _qryAux := TwwQuery.Create(nil);
  sSQL    := TStringList.create;

  Result := true;

  try
     try
       _Qry.DatabaseName    := 'BaseDados';
       _qryAux.DatabaseName := 'BaseDados';

       _Qry.SQL.Add('SELECT R.* ');
       _Qry.SQL.Add('  FROM (   ');
       _Qry.SQL.Add('     SELECT H.IDHISTRESERVA, H.IDPESSOA, H.FLGENTRADA, H.VLRREAL, H.VLRCOTAS, ');
       _Qry.SQL.Add('            DECODE(LEAD(H.IDTIPORESERVA, 1) OVER (PARTITION BY H.IDTIPORESERVA ORDER BY h.MESREFERENCIA, H.DATARECEBIMENTO, H.IDHISTRESERVA), h.IDTIPORESERVA, '''', ''X'') AS TOT_RESERVA, ');
       _Qry.SQL.Add('            H.IDTIPORESERVA, H.MESREFERENCIA, ');
       _Qry.SQL.Add('            H.DATARECEBIMENTO, H.SALDOREAL, H.SALDOCOTAS, ');
       _Qry.SQL.Add('            SUM(DECODE(H.FLGENTRADA,1,H.VLRREAL,-H.VLRREAL))   OVER (PARTITION BY H.IDTIPORESERVA ORDER BY h.MESREFERENCIA, H.DATARECEBIMENTO, H.IDHISTRESERVA) TOT_VALOR, ');
       _Qry.SQL.Add('            SUM(DECODE(H.FLGENTRADA,1,H.VLRCOTAS,-H.VLRCOTAS)) OVER (PARTITION BY H.IDTIPORESERVA ORDER BY h.MESREFERENCIA, H.DATARECEBIMENTO, H.IDHISTRESERVA) TOT_COTAS  ');
       _Qry.SQL.Add('     FROM   HISTMOVRESERVA H  ');
       _Qry.SQL.Add('     WHERE  H.IDPLANOPREV   = '+ IntToStr(piIdPlanoPrev) );
       _Qry.SQL.Add('     AND    H.IDPESSJUR     = '+ IntToStr(piIdPessJur)   );
       _Qry.SQL.Add('     AND    H.SEQPROPOSTA   = '+ IntToStr(piSeqProposta) );
       _Qry.SQL.Add('     AND    H.IDPESSOA      = '+ IntToStr(piIdPessoa)    );
       _Qry.SQL.Add('     ORDER BY H.IDTIPORESERVA, H.IDPESSOA, H.MESREFERENCIA, H.DATARECEBIMENTO, H.IDHISTRESERVA ');
       _Qry.SQL.Add('  ) R ');
       _Qry.SQL.Add(' WHERE R.MESREFERENCIA >= '+QuotedStr(psMesRef));
       _Qry.Open;

       if not _Qry.eof then
       begin
          //atualizar saldos
          while not _Qry.eof do
          begin
             sSQL.Add('UPDATE HISTMOVRESERVA '+
                      '   SET SALDOREAL   =  '+ OraNumero(_Qry.FieldByName('TOT_VALOR').AsString) +
                      '       , SALDOCOTAS  =  '+ OraNumero(_Qry.FieldByName('TOT_COTAS').AsString) +
                      ' WHERE IDHISTRESERVA = '+_Qry.FieldByName('IDHISTRESERVA').AsString +'; ' );

             if sSQL.Count = 500 then
             begin
                _qryAux.SQL.Text := 'BEGIN ' + sSQL.Text + ' END;';
                _qryAux.ExecSQL;

                sSQL.clear;
             end;

            _Qry.next;
          end;
          if sSQL.Count > 0 then
          begin
             _qryAux.SQL.Text := 'BEGIN ' + sSQL.Text + ' END;';
             _qryAux.ExecSQL;
          end;

         // update reservapart com o último saldo
         _Qry.first;
         _Qry.filter   := 'TOT_RESERVA = ''X'' ';
         _Qry.Filtered := true;

         while not _Qry.eof do
         begin

           if _Qry.FieldByName('TOT_VALOR').AsFloat > 0 then
           begin
             sSQL.text :=
             'UPDATE '                                                     + #13 +
             '  RESERVAPART '                                              + #13 +
             'SET '                                                        + #13 +
             '  VALORRESERVA       = ' + OraNumero(FloatToStr(_Qry.FieldByName('TOT_VALOR').AsFloat)) + #13 +
             'WHERE '                                                      + #13 +
             '      IDPESSJUR      = ' + IntToStr(piIdPessJur)             + #13 +
             '  AND IDPLANOPREV    = ' + IntToStr(piIdPlanoPrev)           + #13 +
             '  AND IDPESSOA       = ' + IntToStr(piIdPessoa)              + #13 +
             '  AND SEQPROPOSTA    = ' + IntToStr(piSeqProposta)           + #13 +
             '  AND IDTIPORESERVA  = ' + _Qry.FieldByName('IDTIPORESERVA').AsString;

             _qryAux.Close;
             _qryAux.SQL.Text := sSQL.text;
             _qryAux.ExecSQL;
           end;
           _Qry.next;
         end;
       end;


     except
       Result := False;
     end;

  finally
     FreeAndNil(_Qry);
     FreeAndNil(_qryAux);
     FreeAndNil(sSQL);
  end;

end;
//edilaine - SIG24360 - fim


procedure VerifIndiceHist(qryaux : twwquery;  var sIndice : string ; sIdPLanoPrev, sIdTipoReserva: string ; sDataCota : string);
begin

   //verifica histórico de índices de reservas
   //para o mês informado
   //vai pegar a última moeda cadastrada
   qryAux.Close;
   qryAux.SQL.clear;
   qryAux.SQL.add(' SELECT  INDICEREAJUSTE '+
                  ' FROM HISTINDICERESERVA '+
                  ' WHERE '+
                  ' IDPLANOPREV = '''+sIdPLanoPrev+''' AND '+
                  ' IDTIPORESERVA = '''+sIdTipoReserva+''' AND '+
                  ' TO_DATE(TO_CHAR(DATAFIM,''DD/MM/YYYY''),''DD/MM/YYYY'')  '+
                  ' >= TO_DATE('''+sDataCota+''',''DD/MM/YYYY'') '+
                  ' ORDER BY DATAFIM DESC ');
   Try
     qryAux.Open;
   Except
     exit;
   End;
   //se houver algum registro, que dizer que já houve
   //miudança no cadastro de índice
   //então pego o primeiro registro e troco o id da função
   if not qryAux.isempty then
      sIndice := qryAux.FieldByName('INDICEREAJUSTE').AsString;

end;



//função que é alimentada com o mês de fererência
//que então lê da table reajinss
//para voltar o valor passado reajustado pela regra
//cadastrada, se for o caso
function ReajustaBeneficioInss(qryaux : twwquery ; sMesRef ,sDataInicioInss, sDataInicio,
                               sNomeParticip : string ; var sValor : string;
                               bRetro : Boolean) : Boolean;
var sSql, sValorAux, sDataAux, sDataAuxFund, sDataQry : string;
    bErro : Boolean;
    iIdCalculoGeral : Integer;
begin
   result:=false;
   bErro:=false;
   sDataAux:=copy(sDataInicioInss,7,4)+'/'+copy(sDataInicioInss,4,2);
   sDataAuxFund:=copy(sDataInicio,7,4)+'/'+copy(sDataInicio,4,2);
   //reajusta enquanto estiver entre a data de inicio no inss
   //e o m6es de referência
   //AND
   //o mês de referência for maior  que a data de inicio
   //do benefício na fundação
   while (sDataAux <=  sMesRef) and
         (sDataAuxFund > sDataAux) do
   begin

      qryAux.SQL.clear;
      qryAux.SQL.add(' SELECT IDRGREAJ '+
                     ' FROM REAJINSS '+
                     ' WHERE MESREAJ = '''+sDataAux+''' ');
      qryAux.Open;

      sDataQry:=sDataAux;
      sDataAux:=ProximoAnoMes13(strtoint(copy(sDataAux,6,2)),strtoint(copy(sDataAux,1,4)));

      if qryAux.isempty then
      begin
         result:=True;
         continue;
      end;


     if qryAux.FieldByName('IdRgReaj').AsString = '' then
      begin
         result:=True;
         continue;
      end;

      sSQL:=' SELECT '''+PreparaStrRegra(sDataQry)+''' AS ANOMESREF, '+
              ' '''+PreparaStrRegra(sDataQry)+''' AS MESREAJ, '+
              ' '''+PreparaStrRegra(sDataInicioInss)+''' AS DATAINICIOINSS, '+
              ' '''+PreparaStrRegra(sDataInicio)+''' AS DATAINICIO, '+
              ' '''+'01/'+copy(sDataQry,6,2)+'/'+copy(sDataQry,1,4)+''' AS DATAREF, '+
              PreparaStrRegra(sValor)+' AS VALORATUAL '+
              ' FROM DUAL ';

      try
         
         sValorAux:=RegraNumerica(qryAux.FieldByName('IdRgReaj').AsString,
                                   sSQL, bErro, iIdCalculoGeral );
         
         sValorAux:=TruncaRoundRetroativo(OraNumero(sValorAux),2);
         sValor:=sValorAux;
      except
         
         berro:=True;
      end;
   end;

   if berro then
   begin
      exit;
   end;

   result:=True;
end;

{ Rotinas para tratar meses e anos }
function ProximoAnoMes13(iMes, iAno : integer) : string;
var sAnoMes : string;
begin
  Result:='';
  if (iMes = 13)
  then begin
     sAnoMes:=IntToStr(iAno+1)+'/';
     sAnoMes:=sAnoMes+'01';
  end
  else begin
    sAnoMes:=IntToStr(iAno)+'/';
    iMes:=iMes + 1;
    if iMes <= 9
    then sAnoMes:=sAnoMes+'0'+IntToStr(iMes)
    else sAnoMes:=sAnoMes+IntToStr(iMes);
  end;
  Result:=sAnoMes;
end;//ProximoAnoMes


function TruncaRoundRetroativo(f:string;n:integer):string;
var
 i,j:integer;
 rInteiro : Extended;
 cAux :Char;
begin
   cAux := DecimalSeparator;
   Result := (f);

   i:=pos(',',result);
   if i=0 then
   begin
      DecimalSeparator := '.';
      i:= pos('.',result);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   if (i <> 0) and (length(copy(result,i+1,length(result)))>n) then
   begin
       rInteiro := strtofloat(result);
       rInteiro := strtofloat(f)*power(10,n);
       rInteiro := int(rInteiro)+round(frac(rInteiro));
       rInteiro := rInteiro/power(10,n);
       Result := copy(floattostr(rinteiro),1,i+n)
   end;
   DecimalSeparator := cAux;
end;

{------------------------------------------------------------------------------}
{ Executa regra de calculo da Data da Cotação para indexar a reserva           }
Function ExecutaRegraDataCota(sIdRegra, sSQLRegra : string; Var bErro : Boolean): string;
Var
  bErroLocal : Boolean;
  iIdCalculo : Longint;
Begin
  { Chama regra }
  bErroLocal := False;
  Result := RegraString(sIdRegra,sSQLRegra,bErroLocal,iIdCalculo);
  If bErroLocal = True Then bErro := True;
End;

function AtualizaReservaIndexada ( qryIndices        : TwwQuery;
                                   piCodIndice       : Longint;
                                   psDataInicio      : string;
                                   psDataFinal       : string;
                               var pdValorAAtualizar : extended;
                               var psMaiorDataIndice : string;
                               var sMsgErro          : string ) : boolean;
begin
   Result   := False;
   sMsgErro := '';
   with qryIndices do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT COTDATA, COTVALOR                                       '+
              ' FROM   COTACAOMOEDA                                            '+
              ' WHERE  MOECODIGO = '+IntToStr(piCodIndice)                      +
              ' AND    COTDATA >= TO_DATE('''+psDataInicio+''',''DD/MM/YYYY'') '+
              ' AND    COTDATA <= TO_DATE('''+psDataFinal +''',''DD/MM/YYYY'') '+
              ' ORDER BY COTDATA                                               ');
      Open;
   end;

   if qryIndices.IsEmpty
   then begin
      sMsgErro := 'Índice no período de '+psDataInicio+' a '+psDataFinal+' não encontrado';
      Exit;
   end;

   while not qryIndices.EOF do
   begin
      pdValorAAtualizar := pdValorAAtualizar * qryIndices.FieldByName('COTVALOR').AsFloat;
      psMaiorDataIndice := qryIndices.FieldByName('COTDATA').AsString;
      qryIndices.Next;
   end;

   Result := True;
end;



// *****************************************************************************
// ************************* FUNCAO CALCPADRAOMOVRESERVA ***********************
// *****************************************************************************
// *****************************************************************************
Function CalcPadraoMovReserva( piIdPessJur,
                               piIdPlanoPrev,
                               piIdPessoa,
                               piSeqProposta,
                               piIdEventoGerador,
                               piIdPessJurDestino,
                               piIdPlanoPrevDestino : Longint;
                               psFlgIntEvento,
                               psDataCota           : string;
                               var sMsgErro         : string;
                               piNumeroProcesso     : Longint;
                               qrySaldoReservas     : twwquery) : Double;
var
   dValorReservaCotas,
   dValorMovimentoCotas,
   dSaldoEmCotasOrigem,
   dSaldoEmCotasDestino,
   dValorMovimentoReal,
   dValorDaCota,
   dTotalEmReal          : double;

   sSQLRegra,
   sSQLRegraData,
   sValorRegra           : string;

   bResgate,
   bErro                 : boolean;

   iIdPessoaResOrig,
   iIdPessJurResOrig,
   iIdPessoaResDest,
   iIdPessJurResDest,
   iPlnCodigo            : Longint;
   sIdsBeneficios,
   sVlrOriginalTemp,
   sContaDebito,
   sContaCredito,
   sCCustoDebito,
   sIdRegraData,
   sCCustoCredito        : string;
   iIdHistoricoS,
   iIdHistoricoE           : Longint;
   sDataCotaPeloParametro  : string;
   dValorMovimentoRealOrig : double;
   sIdSitPartAnterior      : string;
begin
   sMsgErro  := '';

   sIdSitPartAnterior := QuotedStr(' ');

   // Verificar se existe padrao de movimentacao para o evento indicado
   with dtmAPrev.qryMovReserva do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT M.IDMOVIMENTO, M.IDTIPORESERVADEST, M.IDPLANOPREVORIG,     '+
              '        M.IDTIPORESERVAORIG, M.IDPATROORIG, M.IDPATRODEST,         '+
              '        M.IDREGRA, M.IDEVENTOGERADOR, M.IDBENEFICIO,               '+
              '        M.IDPLANOPREVDEST, M.IDREGRAVALIDACAO, M.SEQMOV,           '+
              '        M.CODCENTROCUSTOD, M.IDEMPRESA, M.CODCENTROCUSTOC,         '+
              '        M.CODSUBCONTA, M.UNIDNEGOC, M.PLACONTAD, M.PLANO, M.PLACONTAC, '+
              '        M.IDREGRAZERAVALOR, '+
              '        M.FLGCONTABILIZA, E.NOME                                   '+
              ' FROM   EVENTOGERADOR E, MOVRESERVA M                              '+
              ' WHERE  M.IDEVENTOGERADOR = '+IntToStr(piIdEventoGerador)+
              ' AND    M.IDPLANOPREVORIG =  '+IntToStr(piIdPlanoPrev)+'  '+
              ' AND    M.IDPATROORIG = '+IntToStr(piIdPessJur)+
              ' AND    (M.IDPLANOPREVDEST =  '+IntToStr(piIdPlanoPrevDestino)+'  OR M.IDPLANOPREVDEST IS NULL) '+
              ' AND    (M.IDPATRODEST = '+IntToStr(piIdPessJur)+' OR M.IDPATRODEST IS NULL) '+
              ' AND    E.IDEVENTOGERADOR = M.IDEVENTOGERADOR '+
              ' AND    M.IDBENEFICIO IS NULL ');
      Open;

      if IsEmpty // nao tem padrao de movimentacao
      then begin
         Close;
         Result := 0;
         Exit;
      end;
   end;

   // Abrir dados das reservas do participante
   with dtmAPrev.qryMovReserva do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT M.IDTIPORESERVADEST, M.IDPLANOPREVORIG,                         '+
              '        M.IDTIPORESERVAORIG, M.IDPATROORIG,      M.IDPATRODEST,         '+
              '        M.IDREGRA,           M.IDEVENTOGERADOR,  M.IDBENEFICIO,         '+
              '        M.IDPLANOPREVDEST,   M.IDREGRAVALIDACAO, M.SEQMOV,              '+
              '        M.CODCENTROCUSTOD,   M.IDEMPRESA,        M.CODCENTROCUSTOC,     '+
              '        M.CODSUBCONTA,       M.UNIDNEGOC,        M.PLACONTAD,           '+
              '        M.IDREGRAZERAVALOR, '+
              '        M.PLANO,             M.PLACONTAC,        M.FLGCONTABILIZA,      '+
              '        PP.IDPESSOA,         PP.IDPESSJUR,       PP.INSCRICAONUMERO,    '+
              '        RORIG.FLGCOLETIVA AS FLGCOLETIVAORIG, RORIG.FLGTITULARCOLET AS FLGTITCOLETORIG,'+
              '        RDEST.FLGCOLETIVA AS FLGCOLETIVADEST, RDEST.FLGTITULARCOLET AS FLGTITCOLETDEST,    '+
              '        RORIG.INDICEREAJUSTE,                                           '+
              '        M.PLACONTACDEST, M.PLACONTADDEST,                               '+
              '        E.NOME                                                          '+
              ' FROM   EVENTOGERADOR E,     MOVRESERVA M,                              '+
              '        RESERVAXPLANO RDEST, RESERVAXPLANO RORIG, PARTPREVPLAN PP       '+
              ' WHERE  M.IDEVENTOGERADOR = '+IntToStr(piIdEventoGerador)+
              ' AND    M.IDPATROORIG = '+IntToStr(piIdPessJur)+
              ' AND    (M.IDPATRODEST = '+IntToStr(piIdPessJur)+' OR M.IDPATRODEST IS NULL )'+
              ' AND    M.IDBENEFICIO IS NULL '+
              ' AND    PP.IDPESSJUR        = '+IntToStr(piIdPessJur)+
              ' AND    PP.IDPLANOPREV      = '+IntToStr(piIdPlanoPrev) +
              ' AND    PP.IDPESSOA         = '+IntToStr(piIdPessoa)+
              ' AND    PP.SEQPROPOSTA      = '+IntToStr(piSeqProposta) +
              ' AND    M.IDPLANOPREVDEST = RDEST.IDPLANOPREV(+)     '+
              ' AND    M.IDTIPORESERVADEST = RDEST.IDTIPORESERVA(+)   '+
              ' AND    RORIG.IDPLANOPREV   = M.IDPLANOPREVORIG        '+
              ' AND    RORIG.IDTIPORESERVA = M.IDTIPORESERVAORIG      '+
              ' AND    E.IDEVENTOGERADOR   = M.IDEVENTOGERADOR        '+
              ' ORDER BY M.SEQMOV ');
      Open;

      if IsEmpty // o participante nao possui os tipos de reserva a movimentar
      then begin
         Close;
         Result := 0;
         Exit;
      end;
   end;

   with dtmAPrev.qryMovReserva do
   begin
      if piIdPessJurDestino   <= 0 then piIdPessJurDestino   := FieldByName('IDPATRODEST').AsInteger;
      if piIdPlanoPrevDestino <= 0 then piIdPlanoPrevDestino := FieldByName('IDPLANOPREVDEST').AsInteger;

      if piIdPessJurDestino   <= 0 then piIdPessJurDestino   := piIdPessJur;
      if piIdPlanoPrevDestino <= 0 then piIdPlanoPrevDestino := piIdPlanoPrev;

      dTotalEmReal := 0;

      // ***********************************************************************
      // *************************** INICIO DO LOOP ****************************
      // ***********************************************************************
      while not(EOF) do
      begin
         { **** TRATAMENTO DE ORIGEM ****}
         if (FieldByName('FLGCOLETIVAORIG').AsInteger = 1) and
            (FieldByName('FLGTITCOLETORIG').AsString = 'F')  then begin
            iIdPessoaResOrig    := iIdFundacao;
            iIdPessJurResOrig   := iIdFundacao;
         end;

         if (FieldByName('FLGCOLETIVAORIG').AsInteger = 1) and
            (FieldByName('FLGTITCOLETORIG').AsString = 'P')  then begin
            iIdPessoaResOrig    := FieldByName('IDPESSJUR').AsInteger;
            iIdPessJurResOrig   := FieldByName('IDPESSJUR').AsInteger;
         end;

         if (FieldByName('FLGCOLETIVAORIG').AsInteger = 0) then begin
            iIdPessoaResOrig    := FieldByName('IDPESSOA').AsInteger;
            iIdPessJurResOrig   := FieldByName('IDPESSJUR').AsInteger;
         end;

         { **** TRATAMENTO DE DESTINO ****}
         if (FieldByName('FLGCOLETIVADEST').AsInteger = 1) and
            (FieldByName('FLGTITCOLETDEST').AsString = 'F')  then begin
            iIdPessoaResDest    := iIdFundacao;
            iIdPessJurResDest   := iIdFundacao;
         end;

         if (FieldByName('FLGCOLETIVADEST').AsInteger = 1) and
            (FieldByName('FLGTITCOLETDEST').AsString = 'P')  then begin
            iIdPessoaResDest     := FieldByName('IDPESSJUR').AsInteger;
            iIdPessJurResDest    := FieldByName('IDPESSJUR').AsInteger;
         end;

         if (FieldByName('FLGCOLETIVADEST').AsInteger = 0) then begin
            iIdPessoaResDest     := FieldByName('IDPESSOA').AsInteger;
            iIdPessJurResDest    := FieldByName('IDPESSJUR').AsInteger;
         end;

         // Buscar valor da reserva de origem
         with dtmAPrev.qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT NVL(VALORRESERVA,0) as VALORRESERVA FROM RESERVAPART '+      // SIG 129320 Ferrari
                    ' WHERE  IDPESSJUR        = '+IntToStr(iIdPessJurResOrig)+
                    ' AND    IDPLANOPREV      = '+IntToStr(piIdPlanoPrev) +
                    ' AND    IDPESSOA         = '+IntToStr(iIdPessoaResOrig)+
                    ' AND    SEQPROPOSTA      = '+IntToStr(piSeqProposta) +
                    ' AND    IDTIPORESERVA    = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVAORIG').AsString);
            Open;

            if not IsEmpty
            then dValorReservaCotas := FieldByName('VALORRESERVA').AsFloat
            else dValorReservaCotas := 0;
            Close;
         end;

         sVlrOriginalTemp := 'RP.VALORRESERVA';

         // Se nao tiver regra, movimentar 100%, com a cota da data
         // Se tiver, chamar a regra. Esta regra deve retornar o valor
         // a movimentar em COTAS.

         dSaldoEmCotasOrigem := 0;
         if FieldByName('IDREGRA').AsInteger <= 0
         then begin
            dValorMovimentoCotas := dValorReservaCotas;
            sDataCotaPeloParametro := psDatacota;
         end
         else begin
            sDataCotaPeloParametro :=  psDatacota;
            sSQLRegra := ' SELECT RP.IDPESSJUR,     RP.IDPLANOPREV,  PP.IDPESSOA,      '+
                         '        RP.SEQPROPOSTA,   RP.IDTIPORESERVA,                  '+
                         '        PP.IDSITPART,     PP.IDSITPART AS IDSITPARTATUAL,    '+
                         '        PP.INSCRICAODATA, PP.IDPESSOA AS IDTITULAR,          '+
                         '        EL.DATAADMISSAO,  PF.DATANASC,                       '+
                         '        RXP.INDICEREAJUSTE, EL.DATADEMISSAO,                 '+
                         ''''+psDataCota+'''                    AS DATAEVENTO,         '+
                         ''''+psDataCota+'''                    AS DATAINICIO,         '+
                         'NVL('+OraNumero(sVlrOriginalTemp)+',0)          AS VLRORIGINAL,        '+     // SIG 129320 Ferrari
                         'NVL('+OraNumero(sVlrOriginalTemp)+',0)          AS VALORRESERVA,       '+     // SIG 129320 Ferrari
                         sIdSitPartAnterior         +'          AS IDSITPARTANTERIOR,  '+
                         OraNumero(FloatToStr(dTotalEmReal))+' AS TOTALMOVIMENTADO     '+
                         ' FROM   RESERVAPART RP, PARTPREVPLAN PP,                     '+
                         '        RESERVAXPLANO RXP,                                   '+
                         '        ELEGPATRO EL,   PESSOAFISICA PF                      '+
                         ' WHERE  RP.IDPESSJUR     = '+IntToStr(iIdPessJurResOrig)      +
                         ' AND    RP.IDPLANOPREV   = '+IntToStr(piIdPlanoPrev)          +
                         ' AND    RP.IDPESSOA      = '+IntToStr(iIdPessoaResOrig)       +
                         ' AND    RP.SEQPROPOSTA   = '+IntToStr(piSeqProposta)          +
                         ' AND    RP.IDTIPORESERVA = '+FieldByName('IDTIPORESERVAORIG').AsString+
                         ' AND    PP.IDPESSJUR       = '+IntToStr(piIdPessJur)           +
                         ' AND    PP.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)         +
                         ' AND    PP.IDPESSOA        = '+IntToStr(piIdPessoa)            +
                         ' AND    PP.SEQPROPOSTA     = '+IntToStr(piSeqProposta)         +
                         ' AND    EL.IDPESSJUR       = PP.IDPESSJUR                     '+
                         ' AND    EL.IDPESSOA        = PP.IDPESSOA                      '+
                         ' AND    PF.IDPESSOA        = EL.IDPESSOA                      '+
                         ' AND    RP.IDPLANOPREV     = RXP.IDPLANOPREV                  '+
                         ' AND    RP.IDTIPORESERVA   = RXP.IDTIPORESERVA                ';

            sValorRegra := RegraNumerica( FieldByName('IDREGRA').AsString, sSQLRegra, bErro, iIdCalculoGeral);

            if bErro
            then begin
               sMsgErro := 'Erro na regra de movimentação Nº '+FieldByName('IDREGRA').AsString;
               Result   := 0;
               Close;
               Exit;
            end;

            dValorMovimentoCotas := StrToFloat(ClienteNumero(sValorRegra));
         end; // else-if FieldByName('IDREGRA').AsInteger <= 0

         // Calcular valor de COTAS em REAL
         // Se a reserva nao tiver indice, colocar como valor em real o mesmo valor em cota
         if FieldByName('INDICEREAJUSTE').AsString = ''
         then dValorMovimentoReal := dValorMovimentoCotas
         else begin

            dValorDaCota := VoltaValorCotacao(dtmAPREV.qryAux, FieldByName('INDICEREAJUSTE').AsString,
                             IntToStr(piIdPlanoPrev),dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsString ,
                             sDataCotaPeloParametro);

            if dValorDaCota <= 0
            then begin
               sMsgErro := 'Valor da Cota ['+FieldByName('INDICEREAJUSTE').AsString+'] não encontrado na data '+psDataCota+'.';
               Result   := 0;
               Close;
               Exit;
            end;
            dValorMovimentoReal := dValorMovimentoCotas * dValorDaCota;
         end;

         dTotalEmReal        := dTotalEmReal       + dValorMovimentoReal;
         { Embromation para acertar erro de arredondamento }
         dValorReservaCotas  := StrToFloat(FloatToStr(dValorReservaCotas));
         dValorMovimentoCotas:= StrToFloat(FloatToStr(dValorMovimentoCotas));
         {*}
         dSaldoEmCotasOrigem := dValorReservaCotas - dValorMovimentoCotas;

         // Se a reserva de destino for em branco, entao apenas abater da reserva de origem
         // Verificar se  a reserva já está associada ao participante na reserva destino
         with dtmAPrev.qryAux do
         begin
            if dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsInteger > 0
            then begin
              Close;
              SQL.Clear;
              SQL.Add(' SELECT RP.VALORRESERVA, RP.IDPESSJUR,   RP.IDPESSOA,     '+
                      '        RP.IDPLANOPREV,  RP.SEQPROPOSTA, RP.IDTIPORESERVA '+
                      ' FROM   RESERVAPART RP                                    '+
                      ' WHERE  RP.IDPESSJUR     = '+IntToStr(iIdPessJurResDest)+
                      ' AND    RP.IDPLANOPREV   = '+IntToStr(dtmAPrev.qryMovReserva.FieldByName('IDPLANOPREVDEST').AsInteger) + 
                      ' AND    RP.IDPESSOA      = '+IntToStr(iIdPessoaResDest)+
                      ' AND    RP.SEQPROPOSTA   = '+IntToStr(piSeqProposta) +
                      ' AND    RP.IDTIPORESERVA = '+dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsString);
              Open;

              if IsEmpty
              then dSaldoEmCotasDestino := dValorMovimentoCotas
              else dSaldoEmCotasDestino := FieldByName('VALORRESERVA').AsFloat + dValorMovimentoCotas;

              If dtmAPrev.qryMovReserva.FieldByName('FLGCOLETIVADEST').AsInteger = 0
               Then Begin
                 If Not qrySaldoReservas.Locate('IDTIPORESERVA',
                                                dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsString,[])
                  Then Begin // Não achou a reserva portanto insere o registro
                     qrySaldoReservas.Insert;
                     qrySaldoReservas.FieldByName('IDTIPORESERVA').AsInteger := dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsInteger;
                     qrySaldoReservas.FieldByName('QTDCOTAS').AsFloat        := dSaldoEmCotasDestino;
                     qrySaldoReservas.FieldByName('VALORCOTA').AsFloat       := dValorDaCota;
                     qrySaldoReservas.FieldByName('SALDORESERVA').AsFloat    := (dSaldoEmCotasDestino * dValorDaCota);
                     qrySaldoReservas.Post;
                  End
                  Else Begin // Achou a reserva portanto apenas edita o registro
                     qrySaldoReservas.edit;
                     qrySaldoReservas.FieldByName('IDTIPORESERVA').AsInteger := dtmAPrev.qryMovReserva.FieldByName('IDTIPORESERVADEST').AsInteger;
                     qrySaldoReservas.FieldByName('QTDCOTAS').AsFloat        := qrySaldoReservas.FieldByName('QTDCOTAS').AsFloat + dValorMovimentoCotas;
                     qrySaldoReservas.FieldByName('VALORCOTA').AsFloat       := dValorDaCota;
                     qrySaldoReservas.FieldByName('SALDORESERVA').AsFloat    := ((qrySaldoReservas.FieldByName('QTDCOTAS').AsFloat + dValorMovimentoCotas) * dValorDaCota);
                     qrySaldoReservas.Post;
                  End;

               End;
            end; // if IdTipoReserva > 0

         end; // with qryAux

         Next;
      end; // while
   end; // with qryMovReserva


   sMsgErro := '';
   Result   := dTotalEmReal;
end;







function VerificaContaContabil(const psConta      : string;
                               const psCusto      : string;
                               const piSubConta   : Integer;
                               const piPlanoConta : Integer;
                               var   psMsg        : string
                              ): Boolean;
var
  sSQL    : string;
  sMsgCC  : string;
  qryAux  : TwwQuery;
begin
  psMsg   := '';
  
  

  if length(trim(psConta)) > 0 then
  begin
    qryAux               := TwwQuery.Create(Application);
    qryAux.DatabaseName  := 'BASEDADOS';

    try
      sSQL :=
      'SELECT '                                         + #13 +
      '  PLAINATIVA, PLATIPO, PLASUBCONTA, PLACCUST '   + #13 +
      'FROM '                                           + #13 +
      '  PLANOCONTA '                                   + #13 +
      'WHERE '                                          + #13 +
      '      PLACONTA = ' + QuotedStr(psConta)          + #13 +
      '  AND PLANO    = ' + IntToStr(piPlanoConta);

      if FazQuery(qryAux, sSQL) then
      begin
        if qryAux.FieldByName('PLAINATIVA').AsString = 'I' Then
          psMsg := psMsg + '- Está INATIVA ' + #13;

        if qryAux.FieldByName('PLATIPO').AsString = 'S' Then
          psMsg := psMsg + '- É sintética, e não pode receber lançamentos ' + #13;

        if qryAux.FieldByName('PLASUBCONTA').AsString = 'S' then
          if piSubConta <= 0 then
            psMsg := psMsg + '- Obriga a indicação de uma Subconta ' + #13;

        if qryAux.FieldByName('PLACCUST').AsString = 'S' then
        begin
          if psCusto = '' then
          begin
            psMsg := psMsg + '- Obriga a indicação de um Centro de Custo ' + #13;
          end
          else
          begin
            if not(VerificaCentroCusto(psCusto, sMsgCC)) then psMsg := psMsg + sMsgCC;
          end;
        end;
      end
      else  
      begin
        psMsg := psMsg + '- Não consta no plano de contas vigente ' + #13;
      end;  

    finally
      qryAux.Free;
    end;
  end;  

  Result := psMsg = '';

  
  psMsg  := 'A Conta Contábil ' + psConta + ': ' + #13 + psMsg;
end;



function VerificaCentroCusto(const psCusto    : string;
                             var   psRetorno  : string
                            ): Boolean;
var
  sSQL    : string;
  qryAux  : TwwQuery;
begin
  psRetorno := '';

  sSQL :=
  'SELECT '                                                 + #13 +
  '  CODCENTROCUSTO, CODEXTERNO, NOME, ATIVO '              + #13 +
  'FROM '                                                   + #13 +
  '  CENTCUST '                                             + #13 +
  'WHERE '                                                  + #13 +
  '      CODCENTROCUSTO = ' + QuotedStr(psCusto)            + #13 +
  '  AND IDEMPRESA      = ' + IntToStr(Sistema.IDEmpresa);

  qryAux               := TwwQuery.Create(Application);
  qryAux.DatabaseName  := 'BASEDADOS';

  Result := False;

  try
    try
      FazQuery(qryAux, sSQL);

      if qryAux.IsEmpty then
      begin
        psRetorno := 'Não foi localizado Centro de Custo com o código ' + psCusto + ' parametrizado ';
        Exit;
      end
      else
      begin
        if qryAux.FieldByName('ATIVO').AsString <> 'S' then
        begin
          psRetorno := 'O Centro de Custo ' + qryAux.FieldByName('CODEXTERNO').AsString + ': "' +
                       qryAux.FieldByName('NOME').AsString + '"'  + ' está INATIVO ' + #13;
          Exit;
        end;
      end;

      Result := True;

    except
      psRetorno := 'Erro ao localizar Centro de Custo com o código (interno) ' + psCusto + ' parametrizado ';
    end;

  finally
    qryAux.Free;
  end;
end;



function NomeReservas(pIDPlanoOri        : Integer;
                      pIDPlanoDest       : Integer;
                      piTipoReservaOri   : Integer;
                      piTipoReservaDest  : Integer
                     ): string;
var
  sNomeReservas : string;
begin
  sNomeReservas := '';

  //------------------------------------------------------------------------------------------------

  // Origem
  with dtmAPrev.qryReservaXPlano do
  begin
    LimpaParametros(dtmAPrev.qryReservaXPlano);
    ParamByName('PIDPLANOPREV').AsInteger   := pIDPlanoOri;
    ParamByName('PIDTIPORESERVA').AsInteger := piTipoReservaOri;
    Open;

    if not(IsEmpty) then
    begin
      sNomeReservas := sNomeReservas + 'Reserva de origem: ' +
                      dtmAPrev.qryReservaXPlano.FieldByName('NOME').AsString + #13;
    end;

    Close;
  end;

  //------------------------------------------------------------------------------------------------

  // Destino
  with dtmAPrev.qryReservaXPlano do
  begin
    LimpaParametros(dtmAPrev.qryReservaXPlano);
    ParamByName('PIDPLANOPREV').AsInteger   := pIDPlanoDest;
    ParamByName('PIDTIPORESERVA').AsInteger := piTipoReservaDest;
    Open;

    if not(IsEmpty) then
    begin
      sNomeReservas := sNomeReservas + 'Reserva de destino: ' +
                      dtmAPrev.qryReservaXPlano.FieldByName('NOME').AsString + #13;
    end;

    Close;
  end;

  //------------------------------------------------------------------------------------------------

  Result := sNomeReservas + #13;

  //------------------------------------------------------------------------------------------------
end;    

//BRUNO AZEVEDO SOL 128400 KINTANA 898619
procedure AtualizaReservas(qryAux: TwwQuery; pIdPessoa, pIdPessJur, pIdPlanoPrev: String);
begin
  try
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' UPDATE RESERVAPART R '+
                  ' SET R.VALORRESERVA = (SELECT SUM(DECODE(FLGENTRADA, '+
                  '                                        0, '+
                  '                                        VLRCOTAS * -1, '+
                  '                                        VLRCOTAS)) '+
                  '                        FROM HISTMOVRESERVA H '+
                  '                       WHERE H.IDTIPORESERVA = R.IDTIPORESERVA '+
                  '                         AND H.IDPLANOPREV = R.IDPLANOPREV     '+
                  '                         AND H.IDPESSOA = R.IDPESSOA           '+
                  '                         AND H.IDPESSJUR = R.IDPESSJUR         '+
                  '                         AND H.SEQPROPOSTA = R.SEQPROPOSTA     '+
                  '                       GROUP BY IDPESSJUR,                     '+
                  '                                IDPESSOA,                      '+
                  '                                IDPLANOPREV,                   '+
                  '                                IDTIPORESERVA)                 '+
                  ' WHERE r.idpessoa IN ('+pIdPessoa+')'+
                  ' and idtiporeserva NOT IN                                      '+
                  '    (SELECT IDTIPORESERVA                                      '+
                  '       FROM RESERVAXPLANO                                      '+
                  '      WHERE NVL(FLGSALDAMENTO, 0) = 1)                         '+
                  ' AND R.IDPESSJUR ='+ pIdPessJur   +
                  ' AND R.IDPLANOPREV ='+ pIdPlanoPrev);
    qryAux.ExecSQL;
  except
  end;
end;


//edilaine - SIG20491 - inicio
function GetSeqResgate(iNumeroProcesso : integer) : integer;
var
  _qryAux : TwwQuery;
begin
  result:= 0;

  _qryAux := Twwquery.Create(Application);
  _qryAux.databasename := 'basedados';

  try

     _qryAux.SQL.Add(' SELECT COALESCE(P.SEQRESGATE,0) AS SEQRESGATE '+
                     '   FROM PROCESSOBENEF P  '+
                     '  WHERE P.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso) );

     try
        _qryAux.open;
        if not _qryAux.eof then
           result := _qryAux.Fields[0].AsInteger;

     except on e: exception do
      raise Exception.Create('Ocorreu um erro GetSeqResgate(): ' + #13#10 + e.message);
     end;
  finally
    FreeAndNil(_qryAux);
  end;

end;


function GetSeqResgate(iIdPlanoPrev, iIdPessJur, iIdPessoa, iSeqProposta : integer;
                       const bIncrementa : boolean) : Integer;
var
  _qryAux : TwwQuery;
begin
  result:= 0;

  _qryAux := Twwquery.Create(Application);
  _qryAux.databasename := 'basedados';

  try
    try
      _qryAux.SQL.Add('SELECT COALESCE(MAX(H.SEQRESGATE),0) AS SEQRESGATE '+
                     ' FROM   HISTMOVRESERVA H  '+
                     ' WHERE  H.IDPLANOPREV   = '+IntToStr(iIdPlanoPrev)+
                     ' AND    H.IDPESSJUR     = '+IntToStr(iIdPessJur)+
                     ' AND    H.SEQPROPOSTA   = '+IntToStr(iSeqProposta)+
                     ' AND    H.IDPESSOA      = '+IntToStr(iIdPessoa)+
                     ' AND    H.FLGENTRADA = 1');
      _qryAux.Open;

     result:= _qryAux.fieldbyname('SEQRESGATE').asInteger;
     if bIncrementa then
        result := result + 1;

    except on e: exception do
      raise Exception.Create('Ocorreu um erro GetSeqResgate(): ' + #13#10 + e.message);
    end;
  finally
    FreeAndNil(_qryAux);
  end;
end;


function DesmarcaReservas(iIdPlanoPrev, iIdPessJur,
                          iIdPessoa, iSeqProposta,
                          iSeqResgate : integer ) : boolean;
var
  _qryAux : TwwQuery;
  _qryBusca : TwwQuery;                //edilaine SIG130377
begin
  Result := false;

  _qryAux := Twwquery.Create(Application);
  _qryAux.databasename := 'basedados';

  //edilaine SIG130377 - inicio
  _qryBusca := Twwquery.Create(Application);
  _qryBusca.databasename := 'basedados';
  //edilaine SIG130377 - fim

  try
    try

      //edilaine SIG130377 : inicio
      //localiza movimento que foi dividido no resgate
      _qryBusca.close;
      _qryBusca.SQL.clear;
      _qryBusca.SQL.Add('SELECT HD.*             ');
      _qryBusca.SQL.Add('  FROM HISTMOVRESERVA HD');
      _qryBusca.SQL.Add(' WHERE HD.IDPLANOPREV = '+IntToStr(iIdPlanoPrev) );
      _qryBusca.SQL.Add('   AND HD.IDPESSJUR   = '+IntToStr(iIdPessJur)   );
      _qryBusca.SQL.Add('   AND HD.SEQPROPOSTA = '+IntToStr(iSeqProposta) );
      _qryBusca.SQL.Add('   AND HD.IDPESSOA    = '+IntToStr(iIdPessoa)    );
      _qryBusca.SQL.Add('   AND HD.IDHISTRESERVAORI IS NOT NULL          ');
      _qryBusca.SQL.Add('   AND EXISTS (SELECT 1                         ');
      _qryBusca.SQL.Add('                 FROM HISTMOVRESERVA H1         ');
      _qryBusca.SQL.Add('                WHERE H1.IDPLANOPREV = '+IntToStr(iIdPlanoPrev) );
      _qryBusca.SQL.Add('                  AND H1.IDPESSJUR   = '+IntToStr(iIdPessJur)   );
      _qryBusca.SQL.Add('                  AND H1.SEQPROPOSTA = '+IntToStr(iSeqProposta) );
      _qryBusca.SQL.Add('                  AND H1.IDPESSOA    = '+IntToStr(iIdPessoa)    );
      _qryBusca.SQL.Add('                  AND H1.SEQRESGATE  = '+IntToStr(iSeqResgate)  );
      _qryBusca.SQL.Add('                  AND H1.IDHISTRESERVA = HD.IDHISTRESERVAORI)  ');
      _qryBusca.open;
      if not _qryBusca.Eof then
      begin
        //recompõe valores divididos
         _qryAux.close;
        _qryAux.SQL.clear;
        _qryAux.SQL.Add('UPDATE HISTMOVRESERVA ');
        _qryAux.SQL.Add('   SET VLRREAL    = TRUNC(VLRREAL    + '+OraNumero(FloatToStr(_qryBusca.FieldByName('VLRREAL').AsFloat))   +',2),');
        _qryAux.SQL.Add('       VLRCOTAS   = TRUNC(VLRCOTAS   + '+OraNumero(FloatToStr(_qryBusca.FieldByName('VLRCOTAS').AsFloat))  +',8),');
        _qryAux.SQL.Add('       SALDOREAL  = TRUNC(SALDOREAL  + '+OraNumero(FloatToStr(_qryBusca.FieldByName('SALDOREAL').AsFloat)) +',2),');
        _qryAux.SQL.Add('       SALDOCOTAS = TRUNC(SALDOCOTAS + '+OraNumero(FloatToStr(_qryBusca.FieldByName('SALDOCOTAS').AsFloat))+',8),');
        _qryAux.SQL.Add('       SEQRESGATE = NULL ');
        _qryAux.SQL.Add(' WHERE IDHISTRESERVA = '+_qryBusca.FieldByName('IDHISTRESERVAORI').AsString );
        _qryAux.ExecSQL;

        //exclui linha criada
        _qryAux.close;
        _qryAux.SQL.clear;
        _qryAux.SQL.Add('DELETE FROM HISTMOVRESERVA ');
        _qryAux.SQL.Add(' WHERE IDPLANOPREV = '+IntToStr(iIdPlanoPrev) );
        _qryAux.SQL.Add('   AND IDPESSJUR   = '+IntToStr(iIdPessJur)   );
        _qryAux.SQL.Add('   AND SEQPROPOSTA = '+IntToStr(iSeqProposta) );
        _qryAux.SQL.Add('   AND IDPESSOA    = '+IntToStr(iIdPessoa)    );
        _qryAux.SQL.Add('   AND IDHISTRESERVA = '+_qryBusca.FieldByName('IDHISTRESERVA').AsString );
        _qryAux.ExecSql;
      end;
      //edilaine SIG130377 : fim

      _qryAux.close;
      _qryAux.SQL.clear;
      _qryAux.SQL.Add(' UPDATE HISTMOVRESERVA SET SEQRESGATE = null '+
                      ' WHERE  IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+
                      ' AND    IDPESSJUR   = '+IntToStr(iIdPessJur)+
                      ' AND    SEQPROPOSTA = '+IntToStr(iSeqProposta)+
                      ' AND    IDPESSOA    = '+IntToStr(iIdPessoa)+
                      ' AND    SEQRESGATE  = '+IntToStr(iSeqResgate)+
                      ' /*AND    FLGENTRADA  = 1*/');
      _qryAux.ExecSql;

      Result := true;

    except 
    end;
  finally
    FreeAndNil(_qryAux);
    FreeAndNil(_qryBusca);       //edilaine SIG130377
  end;

end;
//edilaine - SIG20491 - fim


end.
