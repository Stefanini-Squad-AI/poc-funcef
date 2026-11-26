// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
// Nº SIG.....: SIG TIBERO
// Data.......: 06/03/2018
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
// -----------------------------------------------------------------------------
//Nº SIG.....: SIG50008
//Data.......: 06/07/2017
//Responsável: Fernando Xavier
//Descrição..: Erro no Calculo de abono para regreplan saldado.
//-------------------------------------------------------------------------------
//Alteração  : CalcBeneficioINSSAtual
//SIG        : 44344
//Data       : 17/04/2016
//Responsável: André Imakawa
//Descrição  : Alteração do SIG 29976, só deveria ser feita para origem = 6 (Revisão)
//--------------------------------------------------------------------------------
//Alteração  : CalculaBeneficioAPagarNoMes
//SIG        : 29976
//Data       : 23/09/2016
//Responsável: William Santana
//Descrição  : correção da rotina de revisão, pois a mesma está alterando indevidamente (várias vezes)
//             o campo VALORTOTAL da estrutura BENEFBFCIARIO
//--------------------------------------------------------------------------------
//Pendência   : SOL 264095 PPM 1175477
//Responsável : Fernando Xavier
//Data        : 26/11/2015
//Descrição   : Ao efetuar revisão em benefício vinculado ao REG/REPLAN, identificamos
//              que para o período anterior a janeiro/2015, o benefício de suplementação
//              esta sendo recalculado utilizando os valores INSS de 2015.
//--------------------------------------------------------------------------------
//Pendência   : Manutenção Técnica
//Responsável : Michelle Mota
//Data        : 12/11/2015
//Descrição   : Try/Finally na linha 1979 para destruir componente criado em tempo
//              de execução.
//--------------------------------------------------------------------------------
//Pendência   : SOL 260957 - PPM 1052006
//Responsável : William Moreira da Silva
//Data        : 02/09/2015
//Descrição   : O valor do beneficio de resgate não estava sendo calculado.
//--------------------------------------------------------------------------------
//Pendência   : SOL 261016 PPM 1052103
//Responsável : Fernando Xavier
//Data        : 02/09/2015
//Descrição   : Favor ajustar e verificar o que acarretou o problema. Segue tela abaixo,
//              que mostra o retorno do valor como zero de uma aposentadoria.
//--------------------------------------------------------------------------------
//Pendência   : SOL 260358 - KTN 1034699
//Responsável : William Moreira da Silva
//Data        : 25/08/2015
//Descrição   : O valor do beneficio do INSS era calculado dobrado
//--------------------------------------------------------------------------------
//Pendência   : SOL 205075 - KTN 1983581
//Responsável : Fernando Xavier
//Data        : 16/04/2013
//Descrição   : Permitir mais de um Benefício INSS correção do SOL 181948
//------------------------------------------------------------------------------
// Pendência : SOL 181948 - KINTANA 1724239
// Autor(a)  : TADEU PASSOS
// Data      : 10/03/2013
// Descrição : Alteração para permitir mais de um benefício
//------------------------------------------------------------------------------
//Pendência   : SOL 158720 KINTANA 1291021
//Responsável : BRUNO AZEVEDO
//Data        : 26/05/2011
//Descrição   : Ajuste na consulta do valor integral.
//--------------------------------------------------------------------------------
//Pendência   : SOL 144099 KINTANA 943944
//Responsável : BRUNO AZEVEDO
//Data        : 17/09/2010
//Descrição   : Adicionado o campo Valor do Pagamento na query de entrada da regra 2521.
//------------------------------------------------------------------------------
//Pendência   : SOL 133047 KINTANA 772418
//Responsável : BRUNO AZEVEDO
//Data        : 29/03/2010
//Descrição   : Carregar o salário de manutenção da tabela PARTPREVPLAN.
//--------------------------------------------------------------------------------
// Autor(a)    : Jéssica Lana
// Rotina      : EventoAfastSemRemun
// Data        : 15/05/2009
// Pendência   : Sol 111791 Kintana 549075
// Descricao   : Alteração na SQL da QryAux. A critica da tela é apresentada pelo
//               fato da SQL retornar não só registros de contribuições para 13º.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Rotina      : CalcReservaPart
// Data        : 11/10/2007
// Pendência   :
// Descricao   : Passar numero be beneficiários para regra
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Rotina      : CalcBeneficioINSSAtual
// Data        : 15/06/2007
// Pendência   : 25524
// Descricao   : Usar QryAux3 pois a passada por parametro já e a QryAux do DtmAprev
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 13/04/2007
// Pendência   : 23993
// Rotina      : CalcBeneficioDoMovimento / CalcBeneficioNoMes                  
// Descricao   : 1) Limpeza dos comentários desnecessários na rotina
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Rotina      : CalcBeneficioINSSAtual
// Data        : 05/12/2006
// Pendência   : 23930
// Descricao   : Novo parametro para Identificação do titular
// Data        : 07/07/2006
// Pendência   : 22799
// Descricao   : 1) No caso de concessões de beneficios, verificar se o beneficios
//                 existia desde a DIB na BENEFBFCIARIO e não a DIP
//               2) Limpeza dos comentários desnecessários na rotina
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 20/02/2006
// Pendência   : 21600
// Rotina      : Varias
// Descricao   : Retirada do comando RULE das querys
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 16/01/2006
// Pendência   : 21249
// Rotina      : CalcBeneficioNoMes
// Descricao   : Acerto no tratamento do paratro idLote
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 19/12/2005
// Pendência   : 19233
// Rotina      : BuscaSalarioPessoa / CalcsalPart / BuscaSalario
// Descricao   : CalcSalPart - Criação de parãmetros opcionais para indicar se é
//               abono e qual o motivo para buscar salário de participação na
//               HistRubSal.
//
//               BuscaSalarioPessoa - Testa se é mês de referência de abono e
//               passa o motivo caso esteja parametrizado.
//
//               BuscaSalario - Criação de parãmetros opcionais para indicar se é
//               abono e qual o motivo para buscar salário de participação na
//               HistRubSal.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 14/11/2005
// Pendência   : 19541
// Rotina      : BuscaSalarioIntegral,BuscaSalarioPESSOAINTEGRAL e BuscaSalario
// Descricao   : Alteração nas rotinas para buscar a patrocinadora do participante
//               nos campos IDPESSJUR ou IDPATRO na tabela HISTRUBSAL
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 04/10/2005
// Pendência   : 20357
// Rotina      : JaPossuiBeneficio
// Descricao   : Inlcusão de filtro para beneficios vitalicios
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 12/05/2005
// Rotina      : CalcBeneficioINSSAtual
// Pendência   : 19221
// Descricao   : Nas consultas que obtém os valores pela Benefbfciario coloquei
//               o order by para pegar o registro mais recente, pois estava
//               pegando um registro aleatório.
//------------------------------------------------------------------------------
// Autor(a)    : Léo (FUNCEF)
// Data        : 03/03/2005
// Rotina      : CalcBeneficioINSSAtual
// Descricao   : retirei a atribuição do valor 0(zero) para a variável psFlgBenefMinimo, passada por REFEERÊNCIA
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 21/02/2005
// Rotina      : CalcBeneficioINSSAtual
// Pendência   : 18691
// Descricao   : Pegar somente o valor do inss do benefício que está sendo concedido
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 14/02/2005
// Rotina      : CalcBeneficioDoMovimento
// Pendência   : 18645
// Descricao   : Acrescentada uma clausula na query para que, quando o lote for
//               nulo, procure também pelo IDMOTIVO de não identificado.
//------------------------------------------------------------------------------
// Autor      : Leo
// Rotina     : CalcBeneficioNoMes
// Data       : 25/01/2005
// Descrição  : alterei a função para pegar o somatório do último acerto ou mês pago por que
//              para o caso de pessoas que tiveram uma revisão, o pagamento do Mês e, posteriormente, outra
//              revisão, o valor resgatado pela função era a soma do pagamento do mês e o da primeira revisão,
//              praticamente dobrando o valor integral.
//              ex:
//              valor pago em 2004/09 - 100
//              valor pago pela revisão 1 em 2004/09 - 110
//              valor pago pela revisão 2 em 2004/09 - 0, por que o valor do benefício foi o mesmo 110
//              valor integral do benefício que era resgatado pela função para cálculo de contribuição -> 210
//              valor integral do benefício que deveria ser resgatado - 110, que é o último valor calculado
//------------------------------------------------------------------------------
// Autor      : Augusto
// Rotina     : Varias
// Data       : 24/01/2005
// Descrição  : Alteração do piOrigem de 10 para 6 (Revisão)
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 04.11.2004
// Rotina      : BuscaSalario
// Pendência   : ----
// Descricao   : Testar origem para que quando for retroativo, não usar o campo
//               VLRANTRETROATIVO
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 04.11.2004
// Rotina      : BuscaSalarioIntegral
// Pendência   : ----
// Descricao   : Acerto para não tentar buscar quando não houver rubrica
//               parametrizada
//------------------------------------------------------------------------------
// Rotina      : JaPossuiBeneficio 
// Autor(a)    : Augusto
// Data        : 13/10/2004
// Descricao   : Nova função para verificar caso a pessoa já possui um beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 17/06/2004
// Rotina      : CalcRUBMANTIDO
// Pendência   : 17034
// Descrição   : O select da query foi alterado para passar como conteúdo do campo
//               VALORPROVENTO o valor do campo VALORINTEGRAL, na falta deste passa-se
//               o próprio campo VALORPROVENTO. Se estes não possuírem valor o campo
//               recebe o valor SALMANTIDO. Com esta alteração o rotina assemelha-se
//               a rotina CalcSalPart.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 11/05/2004
// Rotina      : PossuiMigracao
// Descrição   : Criação da Rotina
// Data        : 24/05/2004
// Rotina      : CalcBeneficioINSSAtual
// Descrição   : Buscar sempre o ultimo registro cadastrado.
// Data        : 08/06/2004
// Rotina      : CalcBeneficioINSSAtual
// Descrição   : Retornar valor da BENEFBFCIARIO de acordo com parametro 
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 29/04/2004
// Rotina      : CalcBeneficioNoMes
// Descrição   : Campo VALORCALCULADO retornado, para casos de Revisão
//------------------------------------------------------------------------------
// Autor(a)    : LeoFuncef
// Data        : 08.02.2004
// Rotina      : BuscaSalario
// Pendência   : ---
// Descrição   : verificação do sal. de 13 para mantidos
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 26.01.2004
// Rotina      : InsereHistFuncPrev
// Pendência   : ---
// Descrição   : Retirada da virgula no final da query
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 16/01/2003
// Rotina      : AtualizaHistFuncPrev e InsereHistFuncPrev
// Pendência   : 15939
// Descrição   : Atualização do campo FLGTEMPOMANUT na HISTFUNCPREV
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 12/01/2003
// Rotina      : CalcBeneficioNoMes
// Descrição   : Valor liquido do beneficio no mes
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 18/12/2003
// Rotina      : CalcBeneficioDoMovimento
// Pendência   : 15831
// Descrição   : Caso o benefício em questão seja INSS retorna o campo VALORPREV
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 03/12/2003
// Rotina      : CalcSALPART
// Pendência   : 15749
// Descrição   : Alterado para buscar além da rubrica do salário de participação,
//               buscar também a rubrica de salário virtual (para casos onde o
//               participante sai do benefício e logo depois retorna ao benefício.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 11/11/2003
// Rotina      : CalcSALPART
// Pendência   : 15054
// Descrição   : Alteração da query para considerar no campo VALORINTEGRAL
//               para valores nulos ou zerados o campo VALORPROVENTO,
//               caso contrário usa-se VALORINTEGRAL
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 27.10.2003
// Rotina      : CalcBeneficioDoMovimento
// Descrição   : Somar valores de renda antecipada
//------------------------------------------------------------------------------
// Autor(a)    : Augusto - 24/10/2003
// Rotina      : CalcBeneficioINSSAtual - Retirada do NUMEROPROCESSO na consulta
//------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 16.10.2003
// Pendencia   : 15053
// Rotina      : AtualizaHistFuncPrev
// Descrição   : Incluindo o parametro sIdEventoGerador
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 09.10.2003
// Pendencia   :
// Rotina      : BuscaSalarioAtual
// Descrição   : Buscar salario de mantido
//------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 30/09/2003
// Pendencia   : 15053
// Rotina      : AtualizaHistFuncPrev, InsereHistFuncPrev
// Descrição   : Foi criado um Flag no eventogerador para saber se grava uma linha
//  na tabela HISTFUNCPREV. Caso afirmativo, o sistema de considera-lo no momento
//  de cancelar o evento.
//------------------------------------------------------------------------------
// Rotina      : CalcUltimoBeneficio
// Autor(a)    : Augusto
// Data        : 26/09/2003
// Descricao   : Acerti no SQL (QuotedStr)
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 10/09/2003
// Alteração   : CALCSALPART
// Pendência   : 15007 - Desfeita a alteração da pendência 14832, pois causou
//               vários erros no salário virtual na CBS.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 15/08/2003
// Alteração   : CALCSALPART
// Pendência   : 14832 - Alterar a ordem de procura para pegar primeiro o sal.
//               na PARTPREVPLAN e depois na HISTRUBSALl.
//------------------------------------------------------------------------------
// Rotina      : GeraHistoricoSalarial
// Autor(a)    : Augusto
// Data        : 28/07/2003
// Descricao   : Inclusão do campo IDPATRO no insert HISTRUBSAL
//------------------------------------------------------------------------------
// Rotina      : BuscaSalarioIntegral
// Autor(a)    : Carlos Guedes
// Data        : 21/07/2003
// Pendência   : 14621
//------------------------------------------------------------------------------
// Rotina      : CalculaEnquadramento
// Autor(a)    : Leo
// Data        : 15.04.2003
// Alteração   : inclusão do parâmetro IDTITULAR, para casos de
//               cálculo do enquadramento do pensionista
//------------------------------------------------------------------------------
// Rotina      : CalcUltSalPart
// Autor(a)    : Augusto
// Data        : 14/04/2003
// Alteração   : Nova função para retornar o ultimo salario de participacao independente
//               da situação do participante.
//------------------------------------------------------------------------------
// Rotina      : CalcBeneficioINSSPAGO
// Autor(a)    : Camille
// Data        : 23.012003
// Alteração   : Nova rotina para retornar o valor do inss realmente pago
//------------------------------------------------------------------------------
// Rotina      : CalcBeneficioINSSAtual
// Autor(a)    : Gleyber
// Data        : 19/12/2002
// Alteração   : Acrescentado o NUMEROPROCESSO a query
//------------------------------------------------------------------------------
// Rotina      : CalcBeneficioINSSAtual
// Autor(a)    : Gleyber
// Data        : 20/11/2002
// Alteração   : Critica sobre o flginterno do evento para nao somar
//------------------------------------------------------------------------------
// Rotina      : CalcBeneficioAtual
// Autor(a)    : Leo
// Data        : 08.10.2002
// Alteração   : acrescentei o parâmetro psValorSrb e seu tratamento
//------------------------------------------------------------------------------
// Rotina      : BuscaSalarioPESSOAINTEGRAL
// Autor(a)    : Carlos Guedes
// Data        : 13.08.2002
// Alteração   : Mudança no tratamento de manutenido
//------------------------------------------------------------------------------
// Rotina      : CalcBeneficioAtual
// Autor(a)    : Carlos Guedes
// Data        : 31.07.2002
// Alteração   : Não permitir que um benef. do INSS seja calculado indevidamente
//------------------------------------------------------------------------------
// Rotina      : BuscaSalario
// Autor(a)    : Augusto
// Data        : 02.07.2002
// Alteração   : tratamento para paramsal13
//------------------------------------------------------------------------------
// Rotina      : CalcBeneficioAtual
// Autor(a)    : Leo
// Data        : 29.05.2002
// Alteração   : Acrescentei o parâmetro inumprocesso e tratamento para pegar
//               só os benefícios de um determinado processo
//------------------------------------------------------------------------------
// Rotina      : BuscaSalarioPessoa
// Autor(a)    : Carlos Guedes
// Data        : 31.05.2002
// Alteração   : Removendo campo IDRUBDECTER da patro (removido do modelo)
//------------------------------------------------------------------------------

unit UParticipante;

{ Esta unit contém rotinas relativas ao Participante Previdenciário }

interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;
Type
  TRegSalMes = Record
                 Valor  : String;
                 MesRef : String;
               End;

    // Calcula o valor total da soma das reservas do participante
    function CalcReservaPart(iIdPessJur,iIdPlanoPrev, iIdPessoa,
                             iIdRegra,  iSeqProposta : integer;

                             sDataRef,          sDataInicio,
                             sDataInicioPagto,  sDataRequerBenef,  iIdBeneficio : string;
                             qry : TwwQuery;
                             iNumBenef : Integer = 0):string;

    // Calcula o valor da rubrica Remuneracao Total do participante
    function CalcRemTotal(iIdPessJur, iIdPessoa : integer; sMesRef : string; qry : TwwQuery) : string;

    // Retorna o Ultimo salario de participacao
    function CalcUltSalPart(iIdPessJur, iIdPessoa : integer; sMesRef, sFlgInterno : string; qry : TwwQuery) : TRegSalMes;
    // Calcula o valor da rubrica Salario de Participacao do participante
    function CalcSALPART(iIdPessJur, iIdPessoa : integer; sMesRef : string; qry : TwwQuery; pIdMotivoAbono: integer = 0; pbEAbono : Boolean = False) : string;

    function CalcSalVIRTUAL(iIdPessJur, iIdPessoa  : integer; sMesRef : string; qry : TwwQuery) : string;

    // Calcula o valor da rubrica Salario de Manutencao Parcial do participante
    function CalcRUBPARCIAL(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer; sMesRef : string; qry : TwwQuery) : string;

    // Calcula o valor da rubrica Salario de Manutencao integral do participante
    function CalcRUBMANTIDO(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer; sMesRef : string; qry : TwwQuery) : string;

    // Calcula o valor do Beneficio INSS no histórico de benefícios
    function CalcBENEFICIOINSS(iIdPessJur,iIdPlanoPrev, iIdPessoa : integer; qry : TwwQuery):string;

    // Calcula a data mais antiga do participante nos planos e patrocinadores
    // em que ele está
    function CalcDataInscFund(iIdPessjur,iIdPlanoPrev,iIdPessoa,iSeqProposta : integer; qry : TwwQuery):string;

    // Calcula a data mais antiga do participante nos planos e patrocinadores
    // em que ele está
    function CalcDataDemissao(iIdPessoa, iIdPessJur : integer; qry : TwwQuery):string;

    // Calcula o valor do último benefício de um participante anterior a uma
    // determinada data
    function CalcUltimoBeneficio(     iIdPessJur, iIdPlanoPrev,
                                      iIdPessoa,  iIdBeneficio : integer;
                                      psDataRef ,
                                      psFlgDestBenef   : string;
                                  var psIDTPPAGTOANT,
                                      psFlgBenefMinimo,
                                      psDataInicio      : string;
                                      qry : TwwQuery   ):string;

    function PossuiFilhoDependente(qry:TwwQuery; pIdPessoa:string):Char;

    // Verifica se um participante é reinscrito ou não
    function PartReinscrito (iIdPessJur, iIdPlanoPRev, iIdPessoa : integer; qry : TwwQuery) : boolean;

    // Verifica se um
    function PartResgPoupanca(iIdPessjur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer;
                          qry : TwwQuery) : boolean;

    // Calcula o ultimo mes que o participante pagou contribuicao
    function CalcUltMesContribuicao(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta , iIdContribuicao: integer; sMesRef : string; qry : TwwQuery) : string;

    function ProximaSequenciaDependente(iIdPessoa : longint; qry : TwwQuery) : longint;

    function GerarHistoricoSalario(qryAux: TwwQuery; pIdPessJur, pIdPessoa,
                                  pMesRef,    sSituacao, sSalario, pIdMotivoContrib: string):Boolean; 

    // Busca salario na tabela de participante PARTPREVPLAN
    function BuscaSalarioAtual(piIdPessJur,piIdPlanoPrev,piIdPessoa : integer; qry : TwwQuery;
                               psFlgInterno : string = 'AT'):string; 

    // Busca salario na tabela de participante PARTPREVPLAN
    function BuscaSalarioSituacao( piIdPessJur,piIdPlanoPrev,piIdPessoa : integer;
                                   qry : TwwQuery;
                                   psNomeRubrica : string):string;

    // Buscar salario na HistRubSal
    function BuscaSalario(piIdPessJur, piIdPlanoPrev, piIdPessoa  : longint;
                          psAnoMes, psSitFundacao,
                          sSalario                 : string;
                          var sMsgErro             : string;
                          qryAux                   : TwwQuery;
                          piOrigem                 : integer = 0;  
                          pIdMotivoAbono           : Integer = 0;
                          pbEAbono                 : Boolean = False) : string;


    // Calcular o valor do beneficio atual que o participante está recebendo
    function CalcBeneficioAtual(       iIdPessJur, iIdPlanoPrev,
                                       iIdPessoa                   : integer;
                                       sMesInicio, sMesRef         : string;
                                       var psIDTPPAGTOANT,
                                       psFlgBenefMinimo,
                                       psValorSrb            : string;
                                       qry : TwwQuery;
                                       piNumProcesso : LongInt )  : string;

    // Calcular o valor do beneficio INSS atual que o participante está recebendo
    function CalcBeneficioINSSAtual(   iIdPessJur, iIdPlanoPrev, piIdTitular,
                                       iIdPessoa                   : integer;
                                       sMesInicio, sMesRef         : string;
                                       var psIDTPPAGTOANT,
                                       psFlgBenefMinimo            : string;
                                       qry                         : TwwQuery;
                                       iINumProcesso               : Integer;
                                       psFlgCampoRetorno : String = 'I';      // I - VALORINTEGRAL
                                                                              // T - VALORTOTAL
                                                                              // C - VALORCALCULADO
                                       piOrigem : Integer = -1)  : string; 
    function CalcBeneficioINSSPAGO( iIdPessJur, 
                                       iIdPlanoPrev, 
                                       iIdPessoa            : longint;
                                       sMesInicio,
                                       sMesRef              : string;
                                       var psIDTPPAGTOANT,
                                           psFlgBenefMinimo : string;
                                       qry                  : TwwQuery;
                                       iINumProcesso        : Integer)  : string; 

    // Verificar se participante possui uma determinada rubrica, em um determinado
    // mês
    function VerificaRubricaMES(       piIdPessJur,  piIdPessoa,
                                       piIdRubrica                 : longint;
                                       psAnoMes                    : string;
                                       pbProcuraPorMesCobranca     : boolean;
                                       qryAux                      : TwwQuery ) : boolean;

    function BuscaRubricaMES(          piIdPessJur,  piIdPessoa,
                                       piIdRubrica                 : longint;
                                       psAnoMes                    : string;
                                       pbProcuraPorMesCobranca     : boolean;
                                       qryAux                      : TwwQuery ) : string;

    function ApagaRubricaMES(           piIdPessJur,  piIdPessoa,
                                       piIdRubrica                 : longint;
                                       psAnoMesInicio,
                                       psAnoMesFinal               : string;
                                       pbProcuraPorMesCobranca     : boolean;
                                       qryAux                      : TwwQuery ) : boolean;

   function DesfazEventoParticipante ( piIdPessJur, piIdPlanoPrev,
                                       piIdPessoa,  piSeqProposta,
                                       piIdEventoGerador           : longint;
                                       psDataEvento                : string;
                                       var sMsgErro                : string;
                                       qryEvento                   : TwwQuery ) : boolean;

   function AtualizaDividaEmprestimo( qryAux                       : TwwQuery;
                                      piIdPessJur,  piIdPlanoPrev,
                                      piIdPessoa ,  piSeqProposta  : longint;
                                      psDataDivida                 : string )    : boolean;

   function AtualizaDividaAssistencial( qryAux                     : TwwQuery;
                                      piIdPessJur,  piIdPlanoPrev,
                                      piIdPessoa ,  piSeqProposta  : longint;
                                      psDataDivida                 : string )    : boolean;

   // Retorna o valor (em real ) que o participante possui de divida previdenciaria
   // e a query passada como qryDivida com os dados descriminados mes a mes, com as
   // contribuicoes devidas
   function DividaPrevidenciaria ( var qryDivida                   : TwwQuery;
                                       piIdPessJur, piIdPlanoPrev,
                                       piIdPessoa,  piSeqProposta  : longint;
                                       psMesDivida                 : string )   : double;

   // Rotina para baixar (colocar como Recebida Ok) no historico de contribuicao uma
   // determinada contribuicao
   function BaixaDividaPrevidenciaria( qryAux                             : TwwQuery;
                                       piIdPessJur,      piIdPlanoPrev,
                                       piIdPessoa,       piSeqProposta,
                                       piIdContribuicao                   : longint;
                                       psMesReferencia                    : string  ) : boolean;

   // Rotina para atualizar a situacao de divida previdenciaria do participante
   // (flgDevePrevidenciario) de acordo com a sua situacao no historico
   function AtualizaSituacaoDividaPrevidenciaria ( qryAux                  : TwwQuery;
                                        piIdPessJur,      piIdPlanoPrev,
                                        piIdPessoa,       piSeqProposta    : longint ) : boolean;


   function BuscaUltimoEvento        ( qryAux                              : TwwQuery;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta        : longint;
                                       psDataRef,
                                       psNomeCampoRetorno                  : string ) : string ;

   
   // Rotina para buscar em que situacao na fundacao um participante estava em um determinado mes
   function BuscaSituacaoParticipante( qryAux                              : TwwQuery;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta        : longint;
                                       psAnoMes                            : string ) : string;

   function AtualizaFlgDesativado    ( qryAux                        : TwwQuery;
                                       piIdPessJurAtual,
                                       piIdPlanoPrevAtual,
                                       piIdPessoa , piSeqProposta    : longint ) : boolean;

   function AtualizaReservaParticipante ( qryReserva,    qryAux               : TwwQuery;
                                          piIdPessJur,   piIdPlanoPrev,
                                          piIdPessoa ,   piSeqProposta,
                                          piIdEventoGerador                   : longint;
                                          psDataLimite                        : string;
                                          var sMsgErro                        : string ) : boolean;
   // Funcao   : BuscaSalarioPESSOA
   // Objetivo : Esta funcao tem por objetivo buscar o salario de um participante
   //            em um determinado mes, sem que para isto seja necessário passar a
   //            situação do participante naquele mês.
   // Rotina   : A funcao verifica a situacao e patrocinadora que o participante estava no mês em questão.
   //            Uma vez encontrada esta situacao, ela busca o salario do participante naquele
   //            mes de acordo com a rubrica correspondente.
   // Restrição : Esta rotina se baseia na tabela de eventos. Logo, caso esta tabela não
   //             tenha sido preenchida, será buscada qual das rubricas o participante tinha
   //             no mes determinado, para a patrocinadora que ele está hoje

   function BuscaSalarioPESSOA (qryAux : TwwQuery;
                                piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                                psFlgIntSitPartHOJE,
                                psAnoMesBusca : string ) : string;

   function BuscaSalarioPESSOAINTEGRAL  (qryAux : TwwQuery;
                                        piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                                        psFlgIntSitPartHOJE,
                                        psAnoMesBusca : string ) : string;

   function ExistemContribuicoesPeriodo ( qryAux : TwwQuery;
                                          piIdPessJur,   piIdPlanoPrev,
                                          piIdPessoa ,   piSeqProposta : longint;
                                          psDataInicio,  psDataFinal   : string ) : boolean;

   function PossuiEmprestimoAberto ( qryAux : TwwQuery;
                                     piIdPessJur,   piIdPlanoPrev,
                                     piIdPessoa ,   piSeqProposta : longint ) : boolean;


   function AtualizaFLGPossuiEmprestimo ( qryAux : TwwQuery;
                                          piIdPessJur,   piIdPlanoPrev,
                                          piIdPessoa ,   piSeqProposta : longint ) : boolean;

   function CalculaEnquadramento        ( qryAux : TwwQuery;
                                          piIdPessJur,   piIdPlanoPrev,
                                          piIdPessoa ,  piIdTitular,
                                          piSeqProposta : longint;
                                          psDataRef : string = '' ) : double; 

   function InsereHistFuncPrev          ( qryAux : TwwQuery;
                                          piIdPessJur, piIdPessoa : longint;
                                          psMatricula, psDataInicio, psDataFinal,
                                          sIdEventoGerador:  string;
                                          psFlgInterno : string = ''): boolean; 

   function AtualizaHistFuncPrev ( qryAux : TwwQuery; piIdPessJur, piIdPessoa : longint;
                                   psDataInicio, psDataFinal, { opcional - se nao passar, a rotina busca da elegpatro }
                                 sIdEventoGerador : string) : boolean;

    // Calcular o valor de um determinado movimento ( concessao,renovacao,etc)
    function CalcBeneficioDoMovimento( qryAux                      : TwwQuery;
                                       piNumProcesso               : longint;
                                       piIdPessJur                 : longint;
                                       piIdPlanoPrev               : longint;
                                       piIdTitular                 : longint;
                                       piIdPessoa                  : integer;
                                       psAnoMesRef                 : string;
                                       piIdLote                    : longint;
                                       pcSuplOuINSS                : char;
                                       pcValorIntegralOuReal       : char ) : double;
    { Retorna o valor liquido do beneficio no mês }
    function CalcBeneficioNoMes( qryAux                      : TwwQuery;
                                 piNumProcesso               : longint;
                                 piIdPessJur                 : longint;
                                 piIdPlanoPrev               : longint;
                                 piIdTitular                 : longint;
                                 piIdPessoa                  : integer;
                                 psAnoMesRef                 : string;
                                 piIdLote                    : longint;
                                 pcSuplOuINSS                : char;
                                 pcValorIntegralOuReal       : char;
                                 pIdBeneficio: Integer = 0 ) : double;

    
    Function BuscaSalarioIntegral(qryAux: TwwQuery; psAnoMesBusca, psFlgIntSitPartHOJE: String;
                        piIdPessoa, piSeqProposta, piIdPessJur,
                        piIdPlanoprev: Integer): String;

    { Indica se a pessoa possui migração de plano }
    Function PossuiMigracao(piIdPessoa, piIdPlanoPrev : Integer;
                            psDataRef : String = ''): Boolean;

    { Verifica se a pessoa possui beneficio }
    Function JaPossuiBeneficio(piIdPessJur, piIdTitular, piIdPessoa, piIdPlanoPrev,
                               piIdbeneficio, piSeqProposta : Integer;
                               pbFiltraVitalicios : Boolean = False;
                               pIdEventoGerador : String = '') : Boolean;


implementation

uses
    DAPrev, UMensErro, UAdmPrev, UMovReserva, UDividaAssist, UFuncoesUteis, uDataBase;

Function BuscaSalarioIntegral(qryAux: TwwQuery; psAnoMesBusca ,psFlgIntSitPartHOJE: String;
                    piIdPessoa, piSeqProposta, piIdPessJur,
                    piIdPlanoprev: Integer): String;
var
  iUltDiaMes,
  iIdRubrica,
  iTentativas           : Integer;

  bAchou                : Boolean;
  sUltDiaMes,
  sSituacaoNaEpoca,
  sIdPessJurNaEpoca,
  sIdPlanoNaEpoca,
  sMesAux,

  sSalarioNaEpoca,
  sSalarioIntegral      : String;
Begin
  if Copy(psAnoMesBusca,6,2) = '13' then
    psAnoMesBusca := Copy(psAnoMesBusca,1,4)+'/12';

  iUltDiaMes := TrazUltDiaMes( StrToInt(Copy(psAnoMesBusca,6,2)),
                               StrToInt(Copy(psAnoMesBusca,1,4)) );
  if iUltDiaMes <= 9 then
    sUltDiaMes := '0'+IntToStr(iUltDiaMes)
  else sUltDiaMes := IntToStr(iUltDiaMes);

  with qryAux do
  begin
    Close;
    SQL.Clear;
    
    SQL.Add(' SELECT EV.IDPESSJUR, EV.IDPLANOPREV, SP.FLGINTERNO, PT.IDRUBSALAUXDOENCA, '+
            '        PT.IDRUBSALMANUT, PT.IDRUBSALMANUTPARC, PT.IDRUBSALPARTICIP '+
            ' FROM   PATRO PT, SITPART SP, EVENTOSPREV EV '+
            ' WHERE  EV.IDPESSOA      = '+IntToStr(piIdPessoa)+
            ' AND    EV.SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
            ' AND    EV.DATAEVENTO    = TO_DATE('''+sUltDiaMes+'/'+Copy(psAnoMesBusca,6,2)+'/'+Copy(psAnoMesBusca,1,4)+''', ''DD/MM/YYYY'') '+
            ' AND    EV.IDPESSJUR     = PT.IDPESSOA '+
            ' AND    EV.IDSITPARTNOVO = SP.IDSITPART '+
            ' ORDER BY EV.DATAEVENTO DESC ');
    Open;

    if not IsEmpty then
    begin
      sSituacaoNaEpoca  := FieldByName('FlgInterno').AsString;
      sIdPessJurNaEpoca := FieldByName('IdPessJur').AsString;
      sIdPlanoNaEpoca   := FieldByName('IdPlanoPrev').AsString;
    end else
    begin
      sSituacaoNaEpoca  := psFlgIntSitPartHOJE;
      sIdPessJurNaEpoca := IntToSTr(piIdPessJur);
      sIdPlanoNaEpoca   := IntToSTr(piIdPlanoPrev);
    end;

    Close;
    SQL.Clear;
    SQL.Add(' SELECT PT.IDRUBSALAUXDOENCA, PT.IDRUBSALMANUT '+
            ' FROM   PATRO PT  '+
            ' WHERE  (PT.IDPESSOA     = '+sIdPessJurNaEpoca+')');
    Open;
    if IsEmpty then Exit;

    If sSituacaoNaEpoca = 'AS' Then
      iIdRubrica := FieldByName('IDRUBSALAUXDOENCA').AsInteger
    Else iIdRubrica := FieldByName('IDRUBSALMANUT').AsInteger;

    
    if iIdRubrica <= 0
    then begin
      Result := '0';
      Exit;
    end;

    sMesAux := psAnoMesBusca;
    bAchou  := False;
    iTentativas := 0;
    while (not bAchou) and (iTentativas <= prmNumTentativasSalario)do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT H.VALORINTEGRAL '+ 
              ' from   HISTRUBSAL H    '+
              ' WHERE  (H.IDPESSOA  = '+IntToStr(piIdPessoa) +') '+
              ' AND    (H.MES       = '''+sMesAux+''' )         '+
              ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
              
              ' AND   ((H.IDPESSJUR = '+sIdPessJurNaEpoca+') OR (H.IDPATRO = '+sIdPessJurNaEpoca+'))');
      Open;
      if not IsEmpty then
      begin
        if Trim(FieldByName('VALORINTEGRAL').AsString) = '' then
          sSalarioIntegral := '0'
        else sSalarioIntegral := FieldByName('VALORINTEGRAL').AsString;

        bAchou := True;
        break;
      end;
      sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
      inc(iTentativas);
    end;
    if not bAchou then Result := '0';
    if Trim(Result) = '' then Result := '0';
  end;

  if sSalarioIntegral = '' then sSalarioIntegral := sSalarioNaEpoca;

  Result := OraNumero(sSalarioIntegral);
End;


function CalcReservaPart( iIdPessJur, iIdPlanoPrev, iIdPessoa, iIdRegra, iSeqProposta : integer;
                          sDataRef, sDataInicio, sDataInicioPagto,
                          sDataRequerBenef, iIdBeneficio : string;
                          qry : TwwQuery;
                          iNumBenef : Integer = 0):string;
var
   sSQL, sMesRef, sValorProvento : string;
   eAcumulador : extended;
   cAux : char;
   qryauxreserva : twwquery;
begin

   try
     Result := '0';
     eAcumulador := 0;

     if iIdRegra <= 0
     then begin
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add(' SELECT RP.IDTIPORESERVA, RP.VALORRESERVA, R.INDICEREAJUSTE '+
                    ' FROM   RESERVAPART RP, RESERVAXPLANO R '+
                    ' WHERE  RP.IDPLANOPREV   = '+IntToStr(iIdPlanoPrev)+' AND '+
                    '        RP.IDPESSJUR     = '+IntToStr(iIdPessJur)+' AND '+
                    '        RP.IDTIPORESERVA = R.IDTIPORESERVA AND '+
                    '        RP.IDPESSOA      = '+ IntToStr(iIdPessoa)+' AND '+
                    '        RP.SEQPROPOSTA   = '+ IntToStr(iSeqProposta)+' AND '+
                    '        RP.FLGATIVO      = 1 AND ' +
                    '        R.FLGCONTROLE    = 0 AND '+ 
                    '        RP.IDPLANOPREV   = R.IDPLANOPREV AND '+
                    '        R.ANALITICOSINTETI = ''A'' ');
        qry.Open;

        qryAuxReserva := TwwQuery.Create(Application);
        qryAuxReserva.DatabaseName := 'BaseDados';

        qry.first;
        cAux             := DecimalSeparator;
        DecimalSeparator := '.';
        while not qry.eof do
        begin
           if not (qry.FieldByName('VALORRESERVA').AsInteger = 0) then
           eAcumulador := eAcumulador + (qry.FieldByName('VALORRESERVA').AsFloat *
                          VoltaValorCotacao(qryauxreserva,qry.fieldbyname('INDICEREAJUSTE').AsString,
                          IntToStr(iIdPlanoPrev),qry.fieldbyname('IDTIPORESERVA').AsString,
                          sDataRef));
           qry.next;
        end;//while

        Result := Floattostr(eAcumulador);
        DecimalSeparator := cAux;
        qry.Close;
     end
     else
     begin  // executar regra de calculo

        if sDataRef    = '' then sDataRef    := FormatDateTime('dd/mm/yyyy', date);
        if sDataInicio = '' then sDataInicio := FormatDateTime('dd/mm/yyyy', date);

        sMesRef        := Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2);

        sValorProvento :=   CalcSALPART(iIdPessJur,iIdPessoa,sMesRef,qry);

        if Trim(sValorProvento)   = '' then sValorProvento   := '0';
        if Trim(sDataInicioPagto) = '' then sDataInicioPagto := Trim(sDataInicio);
        if Trim(sDataRequerBenef) = '' then sDataRequerBenef := Trim(sDataInicio);

        sSQL := ' SELECT RP.IDTIPORESERVA,     RP.IDPLANOPREV,       RP.IDPESSJUR,    '+
                '        RP.IDPESSOA,          RP.DATAREFERENCIASA,  RP.VALORRESERVA, '+
                '        RP.PERCENTUALSAQUE,   R.NOME,               R.CODHIERARQUIA, '+
                '        R.INDICEREAJUSTE,     R.IDBENEFICIO,        M.MOESIGLA,      '+
                '        PF.DATANASC,          EL.DATAADMISSAO,      PP.INSCRICAODATA,'+
                '        PP.SEQPROPOSTA,       PP.DATACANCELAMENTO,  EL.IDSITFUNC,    '+
                '        PP.IDSITPART,         PP.IDPLANOPREV,                        '+
                ''''+sDataInicio+'''       AS DATAINICIO,                             '+
                ''''+sDataInicioPagto+'''  AS DATAINICIOPAGTO,                        '+
                ''''+sDataRequerBenef+'''  AS DATAREQUERIMENTO,                       '+
                ''''+sDataRef+'''          AS DATAREF,                                '+
                OraNumero(sValorProvento)+ ' AS VALORPROVENTO,                        '+
                ' 1 AS CONTRESERVA, 1 AS ULTRESERVA, '+
                ' 0 VALORBASE1, 0 VALORBASE2, 0 VALORBASE3, '+
                IntToStr(iNumBenef) +' AS NUMBENEF '+ 
                ' FROM  PESSOAFISICA PF, ELEGPATRO EL,    PARTPREVPLAN PP,            '+
                '       RESERVAPART RP,  RESERVAXPLANO R, MOEDA M                     '+
                ' WHERE RP.IDPLANOPREV      = ' + IntToStr(iIdPlanoPrev)+
                ' AND   RP.IDPESSJUR        = ' + IntToStr(iIdPessJur)+
                ' AND   RP.IDTIPORESERVA    = R.IDTIPORESERVA '+
                ' AND   RP.IDPESSOA         = ' + IntToStr(iIdPessoa)+
                ' AND   RP.SEQPROPOSTA      = ' + IntToStr(iSeqProposta)+
                ' AND   RP.IDPESSJUR        = PP.IDPESSJUR   '+
                ' AND   RP.IDPLANOPREV      = PP.IDPLANOPREV '+
                ' AND   RP.IDPESSOA         = PP.IDPESSOA    '+
                ' AND   RP.SEQPROPOSTA      = PP.SEQPROPOSTA '+
                ' AND   PF.IDPESSOA         = RP.IDPESSOA    '+
                ' AND   EL.IDPESSOA         = RP.IDPESSOA    '+
                ' AND   EL.IDPESSJUR        = RP.IDPESSJUR   '+
                ' AND   RP.FLGATIVO         = 1              '+
                ' AND   RP.IDPLANOPREV      = R.IDPLANOPREV  '+
                ' AND   R.ANALITICOSINTETI  = ''A''          '+
                ' AND   R.INDICEREAJUSTE    = M.MOECODIGO(+) ';

        dtmAPrev.qryRegra.Close;
        dtmAPrev.qryRegra.Sql.Clear;
        dtmAPrev.qryRegra.Sql.Add(sSQL);
        try
           dtmAPrev.qryRegra.Open;
        except
           on E:EDBEngineError do
           begin
                   MostrarErro(E);
                   try
                      qryauxreserva.free; 
                   except
                   end;
                   Exit;
              end;
        end;

        if dtmAPrev.qryRegra.IsEmpty then exit;

        dtmAPrev.regraAPrev.RuleName := IntToStr(iIdRegra);
        dtmAPrev.regraAPrev.Execute;

        Result := dtmAPrev.regraAPrev.Result;
     end;


     if Trim(Result) = ''  then
     Result := '0'
     else Result := TruncaRound(result,2);

  finally
     try
        qryauxreserva.free;
     except
     end;
  end;
end;

function CalcUltSalPart(iIdPessJur, iIdPessoa  : integer; sMesRef, sFlgInterno : string; qry : TwwQuery) : TRegSalMes;
var
  iIdRubricaSalPart, iIdRubricaSalAuxDoenca, iIdRubricaRetorno,
  iTentativas : integer;
  bVerificarSituacao, bAchou      : boolean;
  sMesAux     : string;

begin
  Result.Valor  := '0';
  Result.MesRef := sMesRef;

  //BRUNO AZEVEDO SOL 133047 KINTANA 772418
  //COMENTADO

  {with qry do  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT PT.IDRUBSALPARTICIP, PT.IDRUBSALAUXDOENCA  '+
             ' FROM   PATRO PT  '+
             ' WHERE  (PT.IDPESSOA     = '+IntToStr(iIdPessJur)+')');
     Open;

     if IsEmpty then Exit;
     iIdRubricaSalPart      := FieldByName('IDRUBSALPARTICIP').AsInteger;
     iIdRubricaSalAuxDoenca := FieldByName('IDRUBSALAUXDOENCA').AsInteger;

     sMesAux := sMesRef;
     bVerificarSituacao := False;
     bAchou  := False;
     iTentativas := 0;

     while (not bAchou) and (iTentativas <= prmNumTentativasSalario) do begin
        Close;
        SQL.Clear;

        SQL.Add('SELECT SALPARTICIPACAO, PARTPREVPLAN.* FROM PARTPREVPLAN
WHERE  IDPESSJUR   = 1 AND    IDPLANOPREV = 66 AND    IDPESSOA    = 1001462

        SQL.Add(' SELECT H.VALORPROVENTO, IDRUBRICA  '+
                ' FROM   HISTRUBSAL H    '+
                ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
                ' AND    (H.MES       = '''+sMesAux+''' )         '+
                ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubricaSalPart)+ ' OR '+
                '         H.IDRUBRICA = '+IntToStr(iIdRubricaSalAuxDoenca)+') '+
                ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
        Open;
        if not (IsEmpty) then begin
           If RecordCount = 1 Then
             Result.Valor := FieldByName('VALORPROVENTO').AsString
           Else
             bVerificarSituacao := True;
           bAchou := True;
           break;
        end;
        sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
        Result.MesRef := sMesAux;
        inc(iTentativas);
     end;
     if not bAchou then Result.Valor := '0';
     if Trim(Result.Valor) = '' then Result.Valor := '0';
  end;

  If bVerificarSituacao = True Then Begin

    If sFlgInterno = 'AT' Then Begin
      iIdRubricaRetorno := iIdRubricaSalPart;
    End Else Begin
      iIdRubricaRetorno := iIdRubricaSalAuxDoenca;
    End;

    Qry.First;
    While Not Qry.Eof Do Begin
      If (iIdRubricaRetorno = Qry.FieldByName('IDRUBRICA').AsInteger) Then Begin
        Result.Valor := Qry.FieldByName('VALORPROVENTO').AsString;
      End;

      Qry.Next;
    End;

  End;

  // Se nao achar o salario no historico de rubrica tentar usar o valor
  // da tabela de participante   }

  //BRUNO AZEVEDO SOL 133047 KINTANA 772418
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(' SELECT P.SALPARTICIPACAO, S.FLGINTERNO FROM PARTPREVPLAN P, SITPART S'+
              ' WHERE (P.IDPESSOA  = '+IntToStr(iIdPessoa)+')'+
              ' AND   (P.IDPESSJUR = '+IntToStr(iIdPessJur)+')'+
              ' AND   (P.FLGDESATIVADO = 0) AND P.IDSITPART = S.IDSITPART ');
  qry.Open;
  if qry.IsEmpty then Exit;
  Result.Valor := qry.FieldByName('SALPARTICIPACAO').AsString;
end;

function CalcRemTotal(iIdPessJur, iIdPessoa : integer; sMesRef : string;qry : TwwQuery) : string;
var iIdRubrica,
    iTentativas : integer;
    bAchou     : boolean;
    sMesAux    : string;
begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDRUBREMTOTAL AS IDRUBRICA FROM PATRO WHERE IDPESSOA = '+IntToStr(iIDPessJur));
     Open;
     if IsEmpty then Exit;
     iIdRubrica := FieldByName('IdRubrica').AsInteger;

     sMesAux := sMesRef;
     bAchou  := False;
     iTentativas := 0;

     while (not bAchou) and (iTentativas <= prmNumTentativasSalario) do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT H.VALORPROVENTO '+ 
                ' from   HISTRUBSAL H    '+
                ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
                ' AND    (H.MES       = '''+sMesAux+''' )         '+
                ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
                ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
        Open;
        if not IsEmpty
        then begin
           Result := FieldByName('ValorProvento').AsString;
           bAchou := True;
           break;
        end;
        sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
        inc(iTentativas);
     end;
     if not bAchou then Result := '0';
     if Trim(Result) = '' then Result := '0';
  end; // with qryAux;

  if Trim(Result) = '' then Result := '0';
end;


function CalcSalPart(iIdPessJur, iIdPessoa  : integer; sMesRef : string; qry : TwwQuery; pIdMotivoAbono: integer = 0; pbEAbono : Boolean = False) : string;
var iIdRubrica,
    iIdRubAuxDoe,
    iTentativas : integer;
    bAchou      : boolean;
    sMesAux     : string;
begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     // Alteração solicitada pelo usuário Menezes para que passe a pegar
     // além da rubrica de salário de participação, pegue também a rubrica
     // de salário virtual
     SQL.Add(' SELECT PT.IDRUBSALPARTICIP, PT.IDRUBSALAUXDOENCA  '+
             ' FROM   PATRO PT  '+
             ' WHERE  (PT.IDPESSOA     = '+IntToStr(iIdPessJur)+')');
     Open;
     if IsEmpty then Exit;

     // comentada crítica que fazia referência ao campo IDRUBDECTERC (PATRO)
     // Pela lógica o resultado final deve ser assim: iIdRubrica := FieldByName('IdRubSalParticip').AsInteger;
     iIdRubrica   := FieldByName('IDRUBSALPARTICIP').AsInteger;
     iIdRubAuxDoe := FieldByName('IDRUBSALAUXDOENCA').AsInteger; 


     sMesAux := sMesRef;

     bAchou  := False;
     iTentativas := 0;
     while (not bAchou) and (iTentativas <= prmNumTentativasSalario)do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT DECODE(H.VALORINTEGRAL, '+ 
                ' NULL, H.VALORPROVENTO, '+
                '    0, H.VALORPROVENTO, H.VALORINTEGRAL) AS VALORPROVENTO '+
                ' FROM   HISTRUBSAL H    '+
                ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
                ' AND    (H.MES       = '''+sMesAux+''' )         '+
                ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+' OR H.IDRUBRICA = '+
                IntToStr(iIdRubAuxDoe)+') '+ 
                ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');

        
        if pIdMotivoAbono > 0 Then
          If pbEAbono Then
            Sql.Add(' AND H.IDMOTIVO = '+IntToStr(pIdMotivoAbono))
          Else
            Sql.Add(' AND H.IDMOTIVO <> '+IntToStr(pIdMotivoAbono));
        

        Open;
        if not IsEmpty
        then begin
           Result := FieldByName('ValorProvento').AsString;
           bAchou := True;
           break;
        end;
        sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
        inc(iTentativas);
     end;
     if not bAchou then Result := '0';
     if Trim(Result) = '' then Result := '0';
  end; // with qryAux;

  // Se nao achar o salario no historico de rubrica tentar usar o valor
  // da tabela de participante
  if StrToFloat(ClienteNumero(Result)) <= 0
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT SALPARTICIPACAO FROM PARTPREVPLAN '+
                    ' WHERE (IDPESSOA  = '+IntToStr(iIdPessoa)+')'+
                    ' AND   (IDPESSJUR = '+IntToStr(iIdPessJur)+')'+
                    ' AND   (FLGDESATIVADO = 0) ');
     qry.Open;
     If Not qry.IsEmpty
      Then Begin
       Result := qry.FieldByName('SALPARTICIPACAO').AsString;
       bAchou := True;
      End;
  end;
end;

function CalcSalVIRTUAL(iIdPessJur, iIdPessoa  : integer; sMesRef : string; qry : TwwQuery) : string;
var iIdRubrica  : longint;
    iTentativas : integer;
    bAchou      : boolean;
    sMesAux     : string;
begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT PT.IDRUBSALAUXDOENCA '+
             ' FROM   PATRO PT  '+
             ' WHERE  (PT.IDPESSOA     = '+IntToStr(iIdPessJur)+')');
     Open;
     if IsEmpty then Exit;

     iIdRubrica := FieldByName('IdRubSalAuxDoenca').AsInteger;
     sMesAux := sMesRef;
     bAchou  := False;
     iTentativas := 0;
     while (not bAchou) and (iTentativas <= prmNumTentativasSalario)do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT H.VALORPROVENTO '+ 
                ' from   HISTRUBSAL H    '+
                ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
                ' AND    (H.MES       = '''+sMesAux+''' )         '+
                ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
                ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
        Open;
        if not IsEmpty
        then begin
           Result := FieldByName('ValorProvento').AsString;
           bAchou := True;
           break;
        end;
        sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
        inc(iTentativas);
     end;
     if not bAchou then Result := '0';
     if Trim(Result) = '' then Result := '0';
  end; // with qryAux;

  // Se nao achar o salario no historico de rubrica tentar usar o valor
  // da tabela de participante
  if StrToFloat(ClienteNumero(Result)) <= 0
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT SALAUXDOENCA FROM PARTPREVPLAN '+
                    ' WHERE (IDPESSOA  = '+IntToStr(iIdPessoa)+')'+
                    ' AND   (IDPESSJUR = '+IntToStr(iIdPessJur)+')'+
                    ' AND   (FLGDESATIVADO = 0) ');
     qry.Open;
     if qry.IsEmpty then Exit;
     Result := qry.FieldByName('SALAUXDOENCA').AsString;
  end;
end;

function CalcRUBPARCIAL(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer; sMesRef : string; qry : TwwQuery) : string;
var iIdRubrica : integer;
    iTentativas : integer;
    bAchou      : boolean;
    sMesAux     : string;

begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDRUBSALMANUTPARC AS IDRUBRICA FROM PATRO WHERE IDPESSOA = '+IntToStr(iIDPessJur));
     Open;
     if IsEmpty then Exit;
     iIdRubrica := FieldByName('IdRubrica').AsInteger;

     sMesAux := sMesRef;

     bAchou  := False;
     iTentativas := 0;

     while (not bAchou) and (iTentativas <= prmNumTentativasSalario)do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT H.VALORPROVENTO '+ 
                ' from   HISTRUBSAL H    '+
                ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
                ' AND    (H.MES       = '''+sMesAux+''' )         '+
                ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
                ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
        Open;
        if not IsEmpty
        then begin
           Result := FieldByName('ValorProvento').AsString;
           bAchou := True;
           break;
        end;
        sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
        inc(iTentativas);
     end;
     if not bAchou then Result := '0';
     if Trim(Result) = '' then Result := '0';
  end; // with qryAux;

  if Trim(Result) = ''
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT SALMANTIDO FROM PARTPREVPLAN '+
                 ' WHERE IDPESSJUR = '+IntToStr(iIdPessJur)+' AND '+
                 '       IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+' AND '+
                 '       IDPESSOA = '+IntToStr(iIdPessoa)+' AND '+
                 '       SEQPROPOSTA = '+IntToSTr(iSeqProposta));
     qry.Open;
     if qry.IsEmpty
     then Result := '0'
     else if qry.FieldByName('SalMantido').AsSTring <> ''
          then Result := qry.FieldByName('SalMantido').AsString
          else Result := '0';
  end;
end;

// Funcao   : BuscaSalarioPESSOA
// Objetivo : Esta funcao tem por objetivo buscar o salario de um participante
//            em um determinado mes, sem que para isto seja necessário passar a
//            situação do participante naquele mês.
// Rotina   : A funcao verifica a situacao e patrocinadora que o participante estava no mês em questão.
//            Uma vez encontrada esta situacao, ela busca o salario do participante naquele
//            mes de acordo com a rubrica correspondente.
// Restrição : Esta rotina se baseia na tabela de eventos. Logo, caso esta tabela não
//             tenha sido preenchida, será buscada qual das rubricas o participante tinha
//             no mes determinado, para a patrocinadora que ele está hoje
function BuscaSalarioPESSOA (qryAux : TwwQuery;
                             piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                             psFlgIntSitPartHOJE,
                             psAnoMesBusca : string ) : string;
var sSituacaoNaEpoca,
    sIdPessJurNaEpoca,
    sIdPlanoNaEpoca,
    sIdEventosPrevDaEpoca,
    sSalarioNaEpoca,
    sUltDiaMes              : string;
    lidMotivoAbono,         
    iUltDiaMes              : integer;
    lbEAbono                : Boolean;
begin
    Result := '0';

    if Copy(psAnoMesBusca,6,2) = '13' then
    Begin
      psAnoMesBusca  := Copy(psAnoMesBusca,1,4)+'/12';

    
      lbEAbono := True;
    End
    Else
      lbEAbono := False;

    If (prmIdMotAbnFolhaFund > 0) Then
      lidMotivoAbono := prmIdMotAbnFolhaFund
    Else
      lidMotivoAbono := 0;
    

    iUltDiaMes := TrazUltDiaMes( StrToInt(Copy(psAnoMesBusca,6,2)),
                                 StrToInt(Copy(psAnoMesBusca,1,4)) );
    if iUltDiaMes <= 9
    then sUltDiaMes := '0'+IntToStr(iUltDiaMes)
    else sUltDiaMes := IntToStr(iUltDiaMes);

    with qryAux do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT EV.IDPESSJUR, EV.IDPLANOPREV, SP.FLGINTERNO,  PT.IDRUBSALAUXDOENCA, '+
               '        PT.IDRUBSALMANUT, PT.IDRUBSALMANUTPARC, PT.IDRUBSALPARTICIP '+
               ' FROM   PATRO PT, SITPART SP, EVENTOSPREV EV '+
               ' WHERE  EV.IDPESSOA      = '+IntToStr(piIdPessoa)+
               ' AND    EV.SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
               ' AND    EV.DATAEVENTO    = TO_DATE('''+sUltDiaMes+'/'+Copy(psAnoMesBusca,6,2)+'/'+Copy(psAnoMesBusca,1,4)+''', ''DD/MM/YYYY'') '+
               ' AND    EV.IDPESSJUR     = PT.IDPESSOA '+
               ' AND    EV.IDSITPARTNOVO = SP.IDSITPART '+
               ' ORDER BY EV.DATAEVENTO DESC ');
       Open;

       if not IsEmpty
       then begin
          sSituacaoNaEpoca  := FieldByName('FlgInterno').AsString;
          sIdPessJurNaEpoca := FieldByName('IdPessJur').AsString;
          sIdPlanoNaEpoca   := FieldByName('IdPlanoPrev').AsString;
       end
       else begin
          sSituacaoNaEpoca  := psFlgIntSitPartHOJE;
          sIdPessJurNaEpoca := IntToSTr(piIdPessJur);
          sIdPlanoNaEpoca   := IntToSTr(piIdPlanoPrev);
       end;
       if sSituacaoNaEpoca = 'AT'
       then sSalarioNaEpoca := CalcSALPART( StrToInt(sIdPessJurNaEpoca),
                                          piIdPessoa,
                                          psAnoMesBusca,
                                          qryAux,
                                          lidMotivoAbono,
                                          lbEAbono) 
       else if sSituacaoNaEpoca = 'MA'
            then sSalarioNaEpoca := CalcRUBMANTIDO( StrToInt(sIdPessJurNaEpoca),
                                          StrToInt(sIdPlanoNaEpoca),
                                          piIdPessoa,
                                          piSeqProposta,
                                          psAnoMesBusca,
                                          qryAux )
            else if sSituacaoNaEpoca = 'MP'
                 then sSalarioNaEpoca := CalcRUBPARCIAL( StrToInt(sIdPessJurNaEpoca),
                                          StrToInt(sIdPlanoNaEpoca),
                                          piIdPessoa,
                                          piSeqProposta,
                                          psAnoMesBusca,
                                          qryAux )
                 else sSalarioNaEpoca := CalcSALVIRTUAL( StrToInt(sIdPessJurNaEpoca),
                                          piIdPessoa,
                                          psAnoMesBusca,
                                          qryAux );
    end;
    Result := OraNumero(sSalarioNaEpoca);
end;

function BuscaSalarioPESSOAINTEGRAL (qryAux : TwwQuery;
                                     piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                                     psFlgIntSitPartHOJE,
                                     psAnoMesBusca : string ) : string;
var sSituacaoNaEpoca,
    sIdPessJurNaEpoca,
    sIdPlanoNaEpoca,
    sIdEventosPrevDaEpoca,
    sSalarioNaEpoca,
    sSalarioIntegral,
    sSQL,
    sMsgErro,
    sUltDiaMes              : string;
    iUltDiaMes              : integer;
    bErro                   : boolean;
    iIdRubrica              : longint;
    sMesAux                 : string;
    bAchou                  : boolean;
    iTentativas             : integer;
begin
    Result := '0';
    sSalarioIntegral := '';

    if Copy(psAnoMesBusca,6,2) = '13'
    then psAnoMesBusca := Copy(psAnoMesBusca,1,4)+'/12';

    iUltDiaMes := TrazUltDiaMes( StrToInt(Copy(psAnoMesBusca,6,2)),
                                 StrToInt(Copy(psAnoMesBusca,1,4)) );
    if iUltDiaMes <= 9
    then sUltDiaMes := '0'+IntToStr(iUltDiaMes)
    else sUltDiaMes := IntToStr(iUltDiaMes);

    with qryAux do
    begin


       Close;
       SQL.Clear;
       
       SQL.Add(' SELECT EV.IDPESSJUR, EV.IDPLANOPREV, SP.FLGINTERNO, PT.IDRUBSALAUXDOENCA, '+
               '        PT.IDRUBSALMANUT, PT.IDRUBSALMANUTPARC, PT.IDRUBSALPARTICIP '+
               ' FROM   PATRO PT, SITPART SP, EVENTOSPREV EV '+
               ' WHERE  EV.IDPESSOA      = '+IntToStr(piIdPessoa)+
               ' AND    EV.SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
               ' AND    EV.DATAEVENTO    = TO_DATE('''+sUltDiaMes+'/'+Copy(psAnoMesBusca,6,2)+'/'+Copy(psAnoMesBusca,1,4)+''', ''DD/MM/YYYY'') '+
               ' AND    EV.IDPESSJUR     = PT.IDPESSOA '+
               ' AND    EV.IDSITPARTNOVO = SP.IDSITPART '+
               ' ORDER BY EV.DATAEVENTO DESC ');
       Open;

       if not IsEmpty
       then begin
          sSituacaoNaEpoca  := FieldByName('FlgInterno').AsString;
          sIdPessJurNaEpoca := FieldByName('IdPessJur').AsString;
          sIdPlanoNaEpoca   := FieldByName('IdPlanoPrev').AsString;
       end
       else begin
          sSituacaoNaEpoca  := psFlgIntSitPartHOJE;
          sIdPessJurNaEpoca := IntToSTr(piIdPessJur);
          sIdPlanoNaEpoca   := IntToSTr(piIdPlanoPrev);
       end;

       if sSituacaoNaEpoca = 'AT'
       then sSalarioNaEpoca := CalcSALPART( StrToInt(sIdPessJurNaEpoca),
                                          piIdPessoa,
                                          psAnoMesBusca,
                                          qryAux )

       else if sSituacaoNaEpoca = 'MP'
       then sSalarioNaEpoca := CalcRUBPARCIAL( StrToInt(sIdPessJurNaEpoca),
                                          StrToInt(sIdPlanoNaEpoca),
                                          piIdPessoa,
                                          piSeqProposta,
                                          psAnoMesBusca,
                                          qryAux )

       else if (sSituacaoNaEpoca = 'AS') Or (sSituacaoNaEpoca = 'MA') Then
       begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT PT.IDRUBSALAUXDOENCA, PT.IDRUBSALMANUT '+
                  ' FROM   PATRO PT  '+
                  ' WHERE  (PT.IDPESSOA     = '+sIdPessJurNaEpoca+')');
          Open;
          if IsEmpty then Exit;

          If sSituacaoNaEpoca = 'AS' Then
            iIdRubrica := FieldByName('IDRUBSALAUXDOENCA').AsInteger
          Else iIdRubrica := FieldByName('IDRUBSALMANUT').AsInteger;

          sMesAux := psAnoMesBusca;
          bAchou  := False;
          iTentativas := 0;
          while (not bAchou) and (iTentativas <= prmNumTentativasSalario)do
          begin
             Close;
             SQL.Clear;
             SQL.Add(' SELECT H.VALORINTEGRAL, H.VALORPROVENTO '+ 
                     ' from   HISTRUBSAL H    '+
                     ' WHERE  (H.IDPESSOA  = '+IntToStr(piIdPessoa) +') '+
                     ' AND    (H.MES       = '''+sMesAux+''' )         '+
                     ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
                     
                     ' AND   ((H.IDPESSJUR = '+sIdPessJurNaEpoca+') OR (H.IDPATRO = '+sIdPessJurNaEpoca+'))');

             Open;
             if not IsEmpty
             then begin
                if Trim(FieldByName('VALORINTEGRAL').AsString) = ''
                then sSalarioIntegral := FieldByName('VALORPROVENTO').AsString
                else sSalarioIntegral := FieldByName('VALORINTEGRAL').AsString;
                bAchou := True;
                break;
             end;
             sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
             inc(iTentativas);
          end;
          if not bAchou then Result := '0';
          if Trim(Result) = '' then Result := '0';

       end;
    end;

    if sSalarioIntegral = '' then sSalarioIntegral := sSalarioNaEpoca;

    Result := OraNumero(sSalarioIntegral);
end; // BuscaSalarioPESSOAINTEGRAL

function BuscaSalarioAtual(piIdPessJur,piIdPlanoPrev,piIdPessoa : integer; qry : TwwQuery;
                           psFlgInterno : string = 'AT'):string; 
begin
   with qry do
   begin
       Close;
       Sql.Clear;
       Sql.Add(' SELECT SALPARTICIPACAO, SALMANTIDO FROM PARTPREVPLAN       '+ 
               ' WHERE  IDPESSJUR   = '+ IntToStr(piIdPessJur)   +
               ' AND    IDPLANOPREV = '+ IntToStr(piIdPlanoPrev) +
               ' AND    IDPESSOA    = '+ IntToStr(piIdPessoa));
       Open;

       if psFlgInterno <> 'MA'
       then result := FieldByName('SALPARTICIPACAO').AsString
       else result := FieldByName('SALMANTIDO').AsString;
       if result = '' then result := '0';
       Close;
   end;
end;

// Busca salario na tabela de participante PARTPREVPLAN
function BuscaSalarioSituacao( piIdPessJur,piIdPlanoPrev,piIdPessoa : integer;
                               qry : TwwQuery;
                               psNomeRubrica : string):string;
begin
   with qry do
   begin
       Close;
       Sql.Clear;
       Sql.Add(' SELECT '+psNomeRubrica+' FROM PARTPREVPLAN       '+
               ' WHERE  IDPESSJUR   = '+ IntToStr(piIdPessJur)   +
               ' AND    IDPLANOPREV = '+ IntToStr(piIdPlanoPrev) +
               ' AND    IDPESSOA    = '+ IntToStr(piIdPessoa)+
               ' AND    SEQPROPOSTA = 1 ');
       Open;
       result := FieldByName(psNomeRubrica).AsString;
       if result = '' then result := '0';
       Close;
   end;
end;

function CalcRUBMANTIDO(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer; sMesRef : string; qry : TwwQuery) : string;
var iIdRubrica : integer;
    iTentativas : integer;
    bAchou      : boolean;
    sMesAux     : string;

begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDRUBSALMANUT AS IDRUBRICA FROM PATRO WHERE IDPESSOA = '+IntToStr(iIDPessJur));
     Open;
     if IsEmpty then Exit;
     iIdRubrica := FieldByName('IdRubrica').AsInteger;

     sMesAux := sMesRef;

     bAchou  := False;
     iTentativas := 0;

     while (not bAchou) and (iTentativas <= prmNumTentativasSalario)do
     begin
        Close;
        SQL.Clear;
        
        SQL.Add(' SELECT DECODE(H.VALORINTEGRAL, '+ 
                ' NULL, H.VALORPROVENTO, '+
                '    0, H.VALORPROVENTO, H.VALORINTEGRAL) AS VALORPROVENTO '+
                ' from   HISTRUBSAL H    '+
                ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
                ' AND    (H.MES       = '''+sMesAux+''' )         '+
                ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
                ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
        Open;
        if not IsEmpty
        then begin
           Result := FieldByName('ValorProvento').AsString;
           bAchou := True;
           break;
        end;
        sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
        inc(iTentativas);
     end;
     if not bAchou then Result := '0';
     if Trim(Result) = '' then Result := '0';
  end; // with qryAux;

  if Trim(Result) = ''
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT SALMANTIDO FROM PARTPREVPLAN '+
                 ' WHERE IDPESSJUR = '+IntToStr(iIdPessJur)+' AND '+
                 '       IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+' AND '+
                 '       IDPESSOA = '+IntToStr(iIdPessoa)+' AND '+
                 '       SEQPROPOSTA = '+IntToSTr(iSeqProposta));
     qry.Open;
     if qry.IsEmpty
     then Result := '0'
     else if qry.FieldByName('SalMantido').AsSTring <> ''
          then Result := qry.FieldByName('SalMantido').AsString
          else Result := '0';
  end;
end;

function CalcBENEFICIOINSS(iIdPessJur,iIdPlanoPrev, iIdPessoa : integer; qry : TwwQuery):string;
begin
   Result := '0';
   qry.Close;
   qry.SQL.Clear;
//   qry.SQL.Add(' SELECT VALORPREV '+   //Everson TIBERO
   qry.SQL.Add(' SELECT HST.VALORPREV '+ //Everson TIBERO
               ' FROM   HSTBENEFBFCIARIO HST, BENEFPLANPREV BP '+
               ' WHERE  HST.IDPESSJUR = '+IntToStr(iIdPessJur)+' AND '+
               '        HST.IDPLANOPREV = '+IntToStr(iIdPLANOPREV)+' AND '+
               '        HST.IDPESSOA = '+IntToStr(iIdPESSOA)+' AND '+
               '        BP.IDBENEFICIO = HST.IDBENEFICIO AND '+
               '        BP.IDPLANOPREV = HST.IDPLANOPREV AND '+
               '        BP.FLGREFERENCIA = 1 ');

   qry.Open;
   if qry.IsEmpty then Exit;
   Result := qry.FieldByName('VALORPREV').AsSTRING;
   qry.Close;
   if Trim(Result) = ''
   then Result := '0';
end;

function CalcDataInscFund(iIdPessjur,iIdPlanoPrev,iIdPessoa,iSeqProposta : integer; qry : TwwQuery):string;
begin
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT INSCRICAODATA         '+
               ' FROM   PARTPREVPLAN          '+
               ' WHERE  IDPESSJUR   = '+ IntToStr(iIdPessjur)+
               ' AND    IDPLANOPREV = '+ IntToStr(iIdPlanoPrev)+
               ' AND    IDPESSOA    = '+ IntToStr(iIdPessoa)+
               ' AND    SEQPROPOSTA = '+ IntToStr(iSeqProposta)+
               ' ORDER BY INSCRICAODATA ');
   qry.Open;
   if qry.IsEmpty
   then Result := ''
   else Result := qry.FieldByName('InscricaoData').AsString;
end;

function CalcDataDemissao(iIdPessoa, iIdPessJur : integer; qry : TwwQuery):string;
begin
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT DATADEMISSAO         '+
               ' FROM   ELEGPATRO           '+
               ' WHERE  IDPESSOA = '+IntToStr(iIdPessoa)+
               ' AND    IDPESSJUR = '+IntToStr(iIdPessJur));
   qry.Open;
   if qry.IsEmpty
   then Result := ''
   else Result := qry.FieldByName('DataDemissao').AsString;
end;

function CalcUltimoBeneficio(     iIdPessJur, iIdPlanoPrev,
                                  iIdPessoa,  iIdBeneficio : integer;
                                  psDataRef ,
                                  psFlgDestBenef   : string;
                              var psIDTPPAGTOANT,
                                  psFlgBenefMinimo,
                                  psDataInicio      : string;
                                  qry : TwwQuery   ):string;
var rValorTotal, rValorTotalHST  : double;
    sDataFinal  : string;
begin
   Result := '0';
   psIdTpPagtoAnt := '';
   psFlgBenefMinimo := '0';

   if Trim(psDataRef)   = '' then psDataRef := FormatDateTime('dd/mm/yyyy', date);

   // Tratar caso do parametro ter sido passado com ano/mes
   if Length(Trim(psDataRef)) = 7 then psDataRef := '01/'+Copy(psDataRef,6,2)+'/'+Copy(psDataRef,1,4);

   if psFlgDestBenef <> 'B' then
     sDataFinal := FormatDateTime('dd/mm/yyyy', StrToDate(psDataRef) - 1) 
   else
     sDataFinal := psDataRef;

   psDataInicio := '';

   // Verificar todos os beneficios que o participante estava recebendo
   // na data do evento
   // Esta query supoe que o beneficio anterior é o beneficio cuja data
   // de inicio é anterior a data parametrizada e cuja data final
   // nao é nula, ou seja, ele foi encerrado

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT BF.IDBENEFICIO,BF.VALORATUAL,BF.IDTPPAGTOBENEFIC,BF.FLGBENEFMIN, BF.DATAINICIOFUND '+ 
               ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP '                               +
               ' WHERE  (BF.IDPESSJUR     = '+IntToStr(iIdPessJur)   +')'                  +
               '   AND  (BF.IDPLANOPREV   = '+IntToStr(iIdPLANOPREV) +')'                  +
               '   AND  (BF.IDPESSOA      = '+IntToStr(iIdPESSOA)    +')'                  +
               '   AND  (BF.IDTITULAR     = '+IntToStr(iIdPESSOA)    +')'                  +
               '   AND  (BF.IDBENEFICIO   <> '+IntToStr(iIdBeneficio)+')'                  +
               '   AND  (BF.DATAINICIO    <= TO_DATE('''+psDataRef+''',''DD/MM/YYYY'') ) ' +
               '   AND  (BF.DATAFINAL     = TO_DATE('''+sDataFinal+''',''DD/MM/YYYY'') ) ' +
               '   AND  (BF.IDPLANOPREV   = BP.IDPLANOPREV) '                              +
               '   AND  (BF.IDBENEFICIO   = BP.IDBENEFICIO) '                              +
               '   AND  (BP.FLGREFERENCIA = 0) ');
   qry.Open;
   qry.First;
   if qry.IsEmpty
   then Exit;// Participante nao estava em beneficio nesta epoca


   // Procurar beneficios no historico e somar seus valores
   // Caso nao os encontre no historico, somar valores da benefbfciario
   psDataInicio   := qry.FieldByName('DataInicioFund').AsString; 
   rValorTotal    := 0;
   rValorTotalHST := 0;
   qry.First;
   while not qry.Eof do
   begin
      psIdTpPagtoAnt    := qry.FieldByName('IdTpPagtoBenefic').AsString;
      if not ((psFlgBenefMinimo = '1') and (qry.FieldByName('FlgBenefMin').AsString = '0'))
      then psFlgBenefMinimo := qry.FieldByName('FlgBenefMin').AsString;
      rValorTotal := rValorTotal + qry.FieldByName('ValorAtual').AsFloat;
      qry.Next;
   end;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT BF.IDBENEFICIO,BF.VLBENEFPGTO, BF.MES '+
               ' FROM   HSTBENEFBFCIARIO BF, BENEFPLANPREV BP '+
               ' WHERE  (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)   +')'+
               ' AND    (BF.IDPLANOPREV = '+IntToStr(iIdPLANOPREV) +')'+
               ' AND    (BF.IDPESSOA    = '+IntToStr(iIdPESSOA)    +')'+
               ' AND    (BF.IDTITULAR   = '+IntToStr(iIdPESSOA)    +')'+
               ' AND    (BF.IDBENEFICIO <> '+IntToStr(iIdBeneficio)+')'+
               
               ' AND    (BF.MESREFERENCIA  = '+QuotedStr(Copy(psDataRef,7,4)+Copy(psDataRef,3,3))+')'+
               ' AND    (BF.IDPLANOPREV = BP.IDPLANOPREV) '+
               ' AND    (BF.IDBENEFICIO = BP.IDBENEFICIO) '+
               ' AND    (BP.FLGREFERENCIA = 0) ORDER BY MES DESC');
   qry.Open;
   qry.First;
   if not qry.IsEmpty Then Begin
      while (not qry.Eof) do
      begin
         rValorTotalHST := rValorTotalHST + qry.FieldByName('VLBENEFPGTO').AsFloat;
         qry.Next;
      end;
   end;
   if rValorTotalHST = 0 Then
      Result := OraNumero(FloatToStr(rValorTotal))
   else
      Result := OraNumero(FloatToStr(rValorTotalHST));
   if Trim(Result) = '' then Result := '0';
end;//CalcUltimoBeneficio


function CalcBeneficioAtual( iIdPessJur,iIdPlanoPrev, iIdPessoa : integer;
                             sMesInicio,
                             sMesRef : string;
                             var psIDTPPAGTOANT,
                                 psFlgBenefMinimo ,
                                 psValorSrb : string;
                             qry : TwwQuery;
                             pinumprocesso : longint //leocbs - 29052002
                              ):string;
var rValorTotal,
    rValorAUsar  : double;
    sAnoMesInicio,
    sAnoMesFinal,
    sAnoMesAtual : string;
    i            : word;

begin
   Result := '0';
   psIdTpPagtoAnt := '';
   psFlgBenefMinimo := '0';
   psValorSrb := '0';

   if Trim(sMesInicio) = '' then sMesInicio := sMesRef;
   // NAO CONSIDERAR BENEFICIO DE PAGAMENTO UNICO
   // Verificar todos os beneficios que o participante estava recebendo
   // na data do evento
   // Esta query supoe que o beneficio anterior é o beneficio cuja data
   // de inicio é anterior a data parametrizada e cuja data final
   // nao é nula, ou seja, ele foi encerrado
   qry.Close;
   qry.SQL.Clear;

   qry.SQL.Add(' SELECT BF.IDBENEFICIO,BF.VALORATUAL,BF.IDTPPAGTOBENEFIC,BF.FLGBENEFMIN , '+
               ' NVL(BP.FLGPAGAINSS,0) FLGPAGAINSS, BP.FLGREFERENCIA '+
//               ' ,NVL(VALORSRB ,0) VALORSRB  '+  //leocm - 08102002  //Everson TIBERO
               ' ,NVL(BF.VALORSRB ,0) VALORSRB  '+  //leocm - 08102002 //Everson TIBERO
               ' FROM   TPPAGTOBENEFICIO T, BENEFICIO B, BENEFPLANPREV BP, BENEFBFCIARIO BF  '+
               ' WHERE  (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)   +')'+
               ' AND    (BF.IDPLANOPREV = '+IntToStr(iIdPLANOPREV) +')'+
               ' AND    (BF.IDPESSOA    = '+IntToStr(iIdPESSOA)    +')'+
               ' AND    (BF.IDTITULAR   = '+IntToStr(iIdPESSOA)    +')'+
               ' AND    (TO_CHAR(BF.DATAINICIO,''YYYY/MM'') <= '''+sMesInicio+''') ');


   if piNumProcesso > 0 then
   begin
//      qry.SQL.Add(' AND  NUMEROPROCESSO = '''+IntToStr(piNumProcesso)+''' ');  //Everson TIBERO
      qry.SQL.Add(' AND  BF.NUMEROPROCESSO = '''+IntToStr(piNumProcesso)+''' '); //Everson TIBERO
   end;

   if Copy(sMesRef,6,2) <> '13'
   then qry.SQL.Add(' AND    ( (BF.DATAFINAL IS NULL) OR (TO_CHAR(BF.DATAFINAL,''YYYY/MM'') >= '''+sMesRef+''') ) ')
   else qry.SQL.Add(' AND    ( (BF.DATAINICIO IN (SELECT MAX(DATAINICIO) '+
                    '                             FROM   BENEFBFCIARIO   '+
                    '                             WHERE  IDPESSJUR   = '+IntToStr(iIdPessJur)   +
                    '                             AND    IDPLANOPREV = '+IntToStr(iIdPLANOPREV) +
                    '                             AND    IDPESSOA    = '+IntToStr(iIdPESSOA)    +
                    '                             AND    IDTITULAR   = '+IntToStr(iIdPESSOA)    +
                    '                             AND    TO_CHAR(DATAINICIO,''YYYY/MM'') <= '''+sMesRef+''')) )  '+
                    ' AND    ( (BF.DATAFINAL IS NULL) OR                                                         '+
                    '          (BF.DATAFINAL IN (SELECT MAX(DATAFINAL) '+
                    '                             FROM   BENEFBFCIARIO   '+
                    '                             WHERE  IDPESSJUR   = '+IntToStr(iIdPessJur)   +
                    '                             AND    IDPLANOPREV = '+IntToStr(iIdPLANOPREV) +
                    '                             AND    IDPESSOA    = '+IntToStr(iIdPESSOA)    +
                    '                             AND    IDTITULAR   = '+IntToStr(iIdPESSOA)    +' ))) ');


   qry.SQL.Add(' AND    (BF.IDPLANOPREV = BP.IDPLANOPREV) '+
               ' AND    (BF.IDBENEFICIO = BP.IDBENEFICIO) '+
               ' AND    (BP.FLGREFERENCIA = 0) '+
               ' AND    (BP.IDBENEFICIO = B.IDBENEFICIO) '+
               ' AND    (B.IDTPPAGTOBENEFIC = T.IDTPPAGTOBENEFIC)'+
               ' AND    (T.FLGFREQUENCIA  <> ''U'')' +
               ' ORDER BY BF.DATAFINAL DESC ');
   qry.Open;
   qry.First;
   if qry.IsEmpty
   then Exit;// Participante nao estava em beneficio nesta epoca

   // Procurar beneficios no historico e somar seus valores
   // Caso nao os encontre no historico, somar valores da benefbfciario

   psValorSrb := qry.FieldByname('VALORSRB').AsString;

   rValorTotal := 0;
   qry.First;
   while not qry.Eof do
   begin
       if qry.recordcount > 1 then
       begin
       end;

       // se for benef. INNS e não paga então não executa.
       If qry.FieldByname('FLGREFERENCIA').AsInteger = 1 Then
         If qry.FieldByName('FLGPAGAINSS').AsInteger = 0 Then
         Begin
           qry.Next;
           Continue;
         End;

       psIdTpPagtoAnt    := qry.FieldByName('IdTpPagtoBenefic').AsString;
       if not ((psFlgBenefMinimo = '1') and (qry.FieldByName('FlgBenefMin').AsString = '0'))
       then psFlgBenefMinimo := qry.FieldByName('FlgBenefMin').AsString;

       sAnoMesFinal  := sMesRef;
       sAnoMesInicio := sMesInicio;
       sAnoMesAtual := sAnoMesInicio;
       rValorAUsar  := 0;

       while sAnoMesAtual <= sAnoMesFinal do
       begin
          dtmAPrev.qryAux.Close;
          dtmAPrev.qryAux.SQL.Clear;
          dtmAPrev.qryAux.SQL.Add(' SELECT VLBENEFPGTO, VALORPREV, FLGDEVOLUCAO '+
                                  ' FROM   HSTBENEFBFCIARIO '+
                                  ' WHERE  (IDPESSOA      = '+IntToStr(iIdPESSOA)+')'+
                                  ' AND    (MESREFERENCIA = '''+sAnoMesAtual+''' '+')'+
                                  ' AND    (IDBENEFICIO   = '+qry.FieldbyName('IdBeneficio').AsString+')'+
                                  ' AND    (NUMEROPROCESSO = '+IntToStr(piNumProcesso)+')'); 

          dtmAPrev.qryAux.Open;

          if not dtmAPrev.qryAux.IsEmpty
          then begin
             dtmAPrev.qryAux.First;
             while not dtmAPrev.qryAux.Eof do
             begin
                if dtmAPrev.qryAux.FieldByName('VlBenefPgto').AsFloat <= 0
                then begin
                   if dtmAPrev.qryAux.FieldByName('FLGDEVOLUCAO').AsInteger = 0
                   then rValorAUsar := rValorAUsar + dtmAPrev.qryAux.FieldByName('ValorPrev').AsFloat
                   else rValorAUsar := rValorAUsar - dtmAPrev.qryAux.FieldByName('ValorPrev').AsFloat
                end
                else begin
                   if dtmAPrev.qryAux.FieldByName('FLGDEVOLUCAO').AsInteger = 0
                   then rValorAUsar := rValorAUsar + dtmAPrev.qryAux.FieldByName('VlBenefPgto').AsFloat
                   else rValorAUsar := rValorAUsar - dtmAPrev.qryAux.FieldByName('VlBenefPgto').AsFloat;
                end;
                dtmAPrev.qryAux.Next;
             end;
             break;
          end;

          sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
       end;
       if rValorAUsar <= 0 then rValorAUsar := qry.FieldByName('VALORATUAL').AsFloat;
       
       rValorTotal := rValorTotal + rValorAUsar;
       qry.Next;
   end;
   qry.Close;
   dtmAPrev.qryAux.Close;
   Result := OraNumero(FloatToStr(rValorTotal));
   if Trim(Result) = '' then Result := '0';
end;//CalcBeneficioAtual

function CalcBeneficioINSSAtual( iIdPessJur, iIdPlanoPrev, piIdTitular, iIdPessoa : LongInt;
                                 sMesInicio, sMesRef : String;
                                 var psIDTPPAGTOANT,
                                     psFlgBenefMinimo : string;

                                 Qry               : TwwQuery;
                                 iINumProcesso     : Integer;
                                 psFlgCampoRetorno : String = 'I';
                                 piOrigem : Integer = - 1 )  : String;
var
  rValorTotal, rValorAUsar  : double;
  sAnoMesInicio, sAnoMesFinal, sSQL, sAnoMesAtual,
  sIdBeneficio : string;
  I : word;
  qryAux: TwwQuery;//William Moreira da Silva - SOL 260358 - KTN 1034699
  iIdPlanoPrevContab : integer;
begin
   Result         := '0';
   psIdTpPagtoAnt := '';
   iIdPlanoPrevContab := 0;

   if Trim(sMesInicio) = '' then sMesInicio := sMesRef;

   { NAO CONSIDERAR BENEFICIO DE PAGAMENTO UNICO                                               }
   { Verificar todos os beneficios que o participante estava recebendo na data do evento.      }
   { Esta query supoe que o beneficio anterior é o beneficio cuja data de inicio               }
   { é anterior a data parametrizada e cuja data final nao é nula, ou seja, ele foi encerrado. }


   if (piOrigem = 6) then  // SOL 261016 PPM 1052103
   begin
       //William Moreira da Silva - SOL 260358 - KTN 1034699
       qryAux := TwwQuery.Create(Application);
       qryAux.DatabaseName :=  'BaseDados';

       // Início - Michelle Mota - Manutenção Técnica
       Try
         with qryAux do begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT BF.NUMEROPROCESSO' + #13#10 +
                      '          FROM PROCESSOBENEF  P,' + #13#10 +
                      '         BENEFPLANOPART BPP,' + #13#10 +
                      '         BENEFBFCIARIO  BF,' + #13#10 +
                      '         BENEFPLANPREV  BP,' + #13#10 +
                      '         BENEFICIO      B' + #13#10 +
                      '         WHERE (BF.IDPESSJUR =  '+IntToStr(iIdPessJur)     +')'+ #13#10 +
                      '           AND (BF.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)    +')'+ #13#10 +
                      '           AND (BF.IDPESSOA = '+IntToStr(iIdPessoa)          +')'+ #13#10 +
                      '           AND (BF.IDTITULAR = '+IntToStr(piIdTitular)       +')'+ #13#10 +
                      '           AND (BF.IDBENEFICIO <> 149)' + #13#10 +
                      '           AND (BF.DATAINICIOFUND <= TO_DATE(''30/04/2013'', ''DD/MM/YYYY''))' + #13#10 +
                      '           AND (BF.IDSITBENEFICIO IN (1, 2, 4))' + #13#10 +
                      '           AND (BF.IDPLANOPREV = BP.IDPLANOPREV)' + #13#10 +
                      '           AND (BF.IDBENEFICIO = BP.IDBENEFICIO)' + #13#10 +
                      '           AND (BF.NUMEROPROCESSO = P.NUMEROPROCESSO)' + #13#10 +
                      '           AND (BP.FLGREFERENCIA = 1)' + #13#10 +
                      '           AND (BP.IDBENEFICIO = B.IDBENEFICIO)' + #13#10 +
                      '           AND (BPP.IDPESSJUR(+) = BF.IDPESSJUR)' + #13#10 +
                      '           AND (BPP.IDPLANOPREV(+) = BF.IDPLANOPREV)' + #13#10 +
                      '           AND (BPP.IDPESSOA(+) = BF.IDPESSOA)' + #13#10 +
                      '           AND (BPP.SEQPROPOSTA(+) = BF.SEQPROPOSTA)' + #13#10 +
                      '           AND (BPP.IDBENEFICIO(+) = BF.IDBENEFICIO)' + #13#10 +
                      '         ORDER BY BF.DATAINICIO DESC');

              Open;
            //William Moreira da Silva - SOL 260957 PPM 1052006
            iINumProcesso := 0;
            if not isEmpty then
            begin
                 iINumProcesso := FieldByName('NUMEROPROCESSO').AsInteger;
            end;
            //William Moreira da Silva - SOL 260957 PPM 1052006
            Close; // Michelle Mota - Manutenção Técnica
         end;
         //William Moreira da Silva - SOL 260358 - KTN 1034699

       finally
         FreeAndNil(qryAux);
       end;
       // Término - Michelle Mota - Manutenção Técnica
   end;   // SOL 261016 PPM 1052103


   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT BF.IDBENEFICIO,BF.VALORATUAL,BF.IDTPPAGTOBENEFIC,BF.FLGBENEFMIN, '+
               '        EV.FLGINTERNO, BF.IDSITBENEFICIO, BF.VALORTOTAL, BF.VALORCALCULADO '+

               ' FROM TPPAGTOBENEFICIO T, BENEFICIO B, BENEFPLANPREV BP, BENEFBFCIARIO BF, '+
               '      EVENTOGERADOR EV '+

               ' WHERE  (BF.IDPESSJUR       = '+IntToStr(iIdPessJur)   +')'+
               '   AND  (BF.IDPLANOPREV     = '+IntToStr(iIdPLANOPREV) +')'+
               '   AND  (BF.IDTITULAR       = '+IntToStr(piIdTitular)  +')'+
               '   AND  (BF.IDPESSOA        = '+IntToStr(iIdPESSOA)    +')');

   If piOrigem = 2 Then
     qry.SQL.Add('   AND  (BF.IDSITBENEFICIO IN (1,2,4,7,6)) ')
   Else
     qry.SQL.Add('   AND  (BF.IDSITBENEFICIO IN (1,2,3,4,7,6))  ');

   qry.SQL.Add('   AND  ( NVL( BF.FLGPOSSUIACOMPINSS, 0 ) = 0 )');

   { Desde essa data o admPrev sempre esta gerando o historico INSS }
   { desde a DIB, por isso as concessões estão pesquisando com a DIB e não a DIP.               }
   If ( piOrigem = 2 ) Then
     qry.SQL.Add( ' AND    (TO_CHAR(BF.DATAINICIOFUND,''YYYY/MM'') <= '''+sMesInicio+''') ')
   Else
     qry.SQL.Add( ' AND    (TO_CHAR(BF.DATAINICIO,''YYYY/MM'') <= '''+sMesInicio+''') ');
   

   if Copy(sMesRef,6,2) <> '13'
   then qry.SQL.Add(' AND    ( (BF.DATAFINAL IS NULL) OR (TO_CHAR(BF.DATAFINAL,''YYYY/MM'') >= '''+sMesRef+''') ) ');

   //William Moreira da Silva - SOL 260358 - KTN 1034699
   if ((iINumProcesso > 0) and (piOrigem = 6) ) then    // SOL 261016 PPM 1052103
   qry.SQL.Add(' AND (BF.NUMEROPROCESSO ='+inttostr(iINumProcesso)+')' );
   //William Moreira da Silva - SOL 260358 - KTN 1034699

   qry.SQL.Add('   AND  (BF.IDPLANOPREV     = BP.IDPLANOPREV) '+
               '   AND  (BF.IDBENEFICIO     = BP.IDBENEFICIO) '+
               '   AND  (BP.FLGREFERENCIA   = 1) '+
               '   AND  (BP.IDBENEFICIO     = B.IDBENEFICIO) '+
               '   AND  (B.IDTPPAGTOBENEFIC = T.IDTPPAGTOBENEFIC)'+
               '   AND  (T.FLGFREQUENCIA    <> ''U'')'+
               '   AND  (B.IDEVENTOGERADOR  = EV.IDEVENTOGERADOR)'+
               ' ORDER BY BF.DATAINICIO DESC ' );
   qry.Open;
   qry.First;

   { caso não encontre INSS na época, retonar os valor informado da Suplmentação }
   If qry.IsEmpty then Begin

     sSQL := ' SELECT BF.VLRCALCINSS, BF.VLRINFINSS, BF.VALORCALCULADO '+
             ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP '+
             ' WHERE  (BF.IDPESSJUR       = '+IntToStr(iIdPessJur)   +')'+
             '   AND  (BF.IDPLANOPREV     = '+IntToStr(iIdPlanoPrev) +')'+
             '   AND  (BF.IDTITULAR       = '+IntToStr(piIdTitular)  +')'+
             '   AND  (BF.IDPESSOA        = '+IntToStr(iIdPessoa)    +')'+
             '   AND  (BF.IDSITBENEFICIO IN (1,2,3,4,7,6)) '+
             '   AND  (BP.FLGREFERENCIA   = 0) '+
             '   AND  (BF.IDPLANOPREV     = BP.IDPLANOPREV) '+
             '   AND  (BF.IDBENEFICIO     = BP.IDBENEFICIO) '+
             '   ORDER BY BF.DATAINICIO DESC ';

     If FazQuery(Qry, sSQL) Then Begin

       rValorTotal := Qry.FieldByName('VLRINFINSS').AsFloat;
       Result := OraNumero(FloatToStr(rValorTotal));

       If psFlgCampoRetorno = 'C' then begin
         rValorTotal := Qry.FieldByName('VLRCALCINSS').AsFloat;
         Result := OraNumero(FloatToStr(rValorTotal));
       end;

       if Trim(Result) = '' then Result := '0';

     End;

     Exit;

   End; 

   { Procurar beneficios no historico e somar seus valores. Caso nao os encontre }
   { no historico, somar valores da BENEFBFCIARIO.                                }
   rValorTotal := 0;
   qry.First;

   while not qry.Eof do begin

       psIdTpPagtoAnt    := qry.FieldByName('IDTPPAGTOBENEFIC').AsString;

       if not ((psFlgBenefMinimo = '1') and (qry.FieldByName('FLGBENEFMIN').AsString = '0'))
       then psFlgBenefMinimo := qry.FieldByName('FLGBENEFMIN').AsString;

       sAnoMesFinal  := sMesRef;
       sAnoMesInicio := sMesInicio;
       sAnoMesAtual  := sAnoMesInicio;
       rValorAUsar   := 0;

       dtmAPrev.qryAux3.Close;
       dtmAPrev.qryAux3.SQL.Clear;
       //BRUNO AZEVEDO SOL 144099 KINTANA 943944
       //Início - William Santana - SIG 29976
      // dtmAPrev.qryAux3.SQL.Add(' SELECT VALORINTEGRAL, VALORTOTAL, VALORCALCULADO, ' +
//                                ' (SELECT SUM(hb.vlbenefpgto) '+
//                                ' FROM hstbenefbfciario hb ' +
//                                '   WHERE hb.idtitular = h.idtitular AND hb.idpessoa = h.idpessoa ' +
//                                '     AND hb.idbeneficio = h.idbeneficio AND hb.idplanoprev = h.idplanoprev ' +
//                                '     AND hb.mesreferencia = h.mesreferencia) VALORPAGO '+
//                                  ' FROM   HSTBENEFBFCIARIO h                         '+
//                                  ' WHERE  (IDPESSOA      = '+IntToStr(iIdPESSOA)    +')'+
//                                  '   AND  (IDTITULAR  = '+IntToStr(piIdTitular)  +')'+
//                                  '   AND  (MESREFERENCIA = '''+sAnoMesAtual+''' '   +')'+
//                                  '   AND  (IDBENEFICIO   = '+ Qry.FieldbyName('IDBENEFICIO').AsString +') '+
//                                  ' ORDER BY MES DESC ');

        dtmAPrev.qryAux3.SQL.Add('SELECT DISTINCT' +
                                 ' (SELECT SUM(decode(hb.FLGDEVOLUCAO,0,hb.VALORINTEGRAL,-hb.VALORINTEGRAL))  ' +
                                 ' FROM hstbenefbfciario hb   ' +
                                 ' WHERE hb.idtitular = h.idtitular  ' );
        if (piIdTitular = iIdPESSOA ) then
        dtmAPrev.qryAux3.SQL.Add('  AND hb.idpessoa = h.idpessoa    '  );

        dtmAPrev.qryAux3.SQL.Add('  AND hb.idbeneficio = h.idbeneficio ' +
                                 '  AND hb.idplanoprev = h.idplanoprev  ' +
                                 '  AND hb.mesreferencia = h.mesreferencia) VALORINTEGRAL, ' +
                                 '  VALORTOTAL, VALORCALCULADO, ' +
                                 '  (SELECT SUM(decode(hb.FLGDEVOLUCAO,0,hb.vlbenefpgto,-hb.VLBENEFPGTO))' +
                                 '     FROM hstbenefbfciario hb' +
                                 '    WHERE hb.idtitular = h.idtitular' );
        if (piIdTitular = iIdPESSOA ) then
        dtmAPrev.qryAux3.SQL.Add('      AND hb.idpessoa = h.idpessoa'  );
        
        dtmAPrev.qryAux3.SQL.Add('      AND hb.idbeneficio = h.idbeneficio' +
                                 '      AND hb.idplanoprev = h.idplanoprev' +
                                 '      AND hb.mesreferencia = h.mesreferencia) VALORPAGO,' +
                                 '      MES ' +
                                 ' FROM   HSTBENEFBFCIARIO h     '+
                                 ' WHERE  (IDTITULAR    = '+IntToStr(piIdTitular)    +')' );

        if (piIdTitular = iIdPESSOA ) then
         dtmAPrev.qryAux3.SQL.Add('   AND  (IDPESSOA  = '+IntToStr(iIdPESSOA)  +')' )
        else
         dtmAPrev.qryAux3.SQL.Add('   AND  (IDPESSOA  <> IDTITULAR )' );

        dtmAPrev.qryAux3.SQL.Add('   AND  (MESREFERENCIA = '''+sAnoMesAtual+''' '   +')'+
                                 '   AND  (IDBENEFICIO   = '+ Qry.FieldbyName('IDBENEFICIO').AsString +') '+
                                 '   AND (NVL(VALORPREV,0) > 0) '+ //SIG50008
                                 ' ORDER BY MES DESC ');
       //Término - William Santana - SIG 29976
       //BRUNO AZEVEDO SOL 144099 KINTANA 943944

       dtmAPrev.qryAux3.Open;

       try
          qryAux := TwwQuery.Create(Application);
          qryAux.DatabaseName :=  'BaseDados';
          //SOL 264095 PPM 1175477
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add('  SELECT B.IDPLANPREVCONTAB FROM   BENEFBFCIARIO B                         '+
                         ' WHERE  (B.IDPESSOA      = '+IntToStr(iIdPESSOA)    +')'+
                         '   AND  (B.IDTITULAR  = '+IntToStr(piIdTitular)  +')'+
                         '   AND  (B.IDBENEFICIO   = '+ Qry.FieldbyName('IDBENEFICIO').AsString +') ');
          qryAux.open;
          iIdPlanoPrevContab := qryAux.FieldbyName('IDPLANPREVCONTAB').AsInteger;
       finally
          qryAux.Close;
          FreeAndNil(qryAux);
       end;
       //SOL 264095 PPM 1175477

       if not dtmAPrev.qryAux3.IsEmpty then
         if psFlgCampoRetorno = 'I' then
         begin //SOL 264095 PPM 1175477
            if (piOrigem = 6) and (iIdPlanoPrevContab = 2) then//SOL 264095 PPM 1175477
               rValorAUsar := dtmAPrev.qryAux3.FieldByName('VALORTOTAL').AsFloat//SOL 264095 PPM 1175477
            // Andre Imakawa - SIG 44344 - Inicio
            // Andre Imakawa - SIG 44344 - Alteração do SIG 29976, só deveria ser feita para origem = 6 (Revisão)
            else if (piOrigem <> 6) then//SOL 264095 PPM 1175477
              rValorAUsar := dtmAPrev.qryAux3.FieldByName('VALORINTEGRAL').AsFloat//SOL 264095 PPM 1175477
            else
            // Andre Imakawa - SIG 44344 - Fim
            //Início - William Santana - SIG 29976
              begin
                 rValorAUsar := dtmAPrev.qryAux3.FieldByName('VALORPAGO').AsFloat;

                 if (rValorAUsar <= 0) and (piIdTitular <> iIdPESSOA) then
                 rValorAUsar := dtmAPrev.qryAux3.FieldByName('VALORINTEGRAL').AsFloat;
              end;
            //Término - William Santana - SIG 29976
         end
         Else If psFlgCampoRetorno = 'T' then
           rValorAUsar := dtmAPrev.qryAux3.FieldByName('VALORTOTAL').AsFloat
         Else If psFlgCampoRetorno = 'C' then
           rValorAUsar := dtmAPrev.qryAux3.FieldByName('VALORCALCULADO').AsFloat
         //BRUNO AZEVEDO SOL 144099 KINTANA 943944
         Else If psFlgCampoRetorno = 'P' then
           rValorAUsar := dtmAPrev.qryAux3.FieldByName('VALORPAGO').AsFloat;

       If rValorAUsar <= 0 then Begin
         if psFlgCampoRetorno = 'I' then
           rValorAUsar := qry.FieldByName('VALORATUAL').AsFloat
         Else If psFlgCampoRetorno = 'T' then
           rValorAUsar := qry.FieldByName('VALORTOTAL').AsFloat
         Else If psFlgCampoRetorno = 'C' then
           rValorAUsar := qry.FieldByName('VALORCALCULADO').AsFloat;
       End;

       If Copy(sMesRef,6,2) <> '13'
        Then If (Trim(qry.FieldByName('FLGINTERNO').AsString) = 'IN') or
                (Trim(qry.FieldByName('FLGINTERNO').AsString) = 'AC')
              Then rValorTotal := rValorAUsar
              Else rValorTotal := rValorTotal + rValorAUsar
        Else rValorTotal := rValorTotal + rValorAUsar;

       qry.Next;

   end; { while not qry.Eof do begin }

   qry.Close;
   dtmAPrev.qryAux3.Close;

   Result := OraNumero(FloatToStr(rValorTotal));
   if Trim(Result) = '' then Result := '0';

end; { CalcBeneficioINSSAtual }

function PossuiFilhoDependente(qry:TwwQuery; pIdPessoa:string):Char;
begin
  
  result   := 'N';
  qry.Close;
  qry.Sql.Clear;
  qry.Sql.Add('SELECT IDDEPENDENCIA FROM DEPENTIT  ');
  qry.Sql.Add('WHERE  IDTITULAR = '''+pIdPessoa+'''');
  qry.Sql.Add('AND    IDDEPENDENCIA = ''FIL''      ');
  qry.Open;
  if (not qry.Isempty) then
     result:= 'S';
  qry.Close;
end;// PossuiFilhoDependente

function PartReinscrito (iIdPessJur, iIdPlanoPrev, iIdPessoa : integer; qry : TwwQuery) : boolean;
begin
   Result := False;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT P.INSCRICAODATA, P.DTINICIOINSC  '+
               ' FROM PARTPREVPLAN  P '+
               ' WHERE  (P.IDPESSJUR = '+IntToStr(iIdPessJur)+')'+
               ' AND    (P.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+')'+
               ' AND    (P.IDPESSOA = '+IntToStr(iIdPessoa)+')'+
               ' AND    (P.FLGDESATIVADO = 0 )');


   try
     qry.Open;
   except
   end;
   if (not qry.IsEmpty) and
      (qry.FieldByName('InscricaoData').AsString <>
       qry.FieldByName('DtInicioInsc').AsString)
   then Result := True;
   qry.Close;
end; //PartReinscrito

function PartResgPoupanca(iIdPessjur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer;
                          qry : TwwQuery) : boolean;
begin
   Result := False;
   qry.close;
   qry.sql.Clear;
   qry.sql.add(' SELECT BF.NUMEROPROCESSO      '+
               ' FROM   BENEFICIO B, BENEFBFCIARIO BF '+
               ' WHERE  B.TIPOBENEFICIO = 6           '+
               ' AND    B.FLGRESGATE    = 1           '+
               ' AND    BF.IDBENEFICIO  = B.IDBENEFICIO '+
               ' AND    BF.IDPESSJUR    = '+IntToStr(iIdPessJur)+
               ' AND    BF.IDPESSOA     = '+IntToStr(iIdPessoa)+
               ' AND    BF.IDPLANOPREV  = '+IntToStr(iIdPlanoPrev)+
               ' AND    BF.IDTITULAR    = '+IntToStr(iIdPessoa)+
               ' AND    BF.SEQPROPOSTA  = '+IntToStr(iSeqProposta));

   try
      qry.open;
   except
   end;

   if (not qry.IsEmpty) and (qry.FieldByName('NumeroProcesso').AsInteger > 0)
   then Result := True;
   qry.Close;
end;

function CalcUltMesContribuicao(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta, iIdContribuicao : integer;
         sMesRef : string; qry : TwwQuery) : string;
begin
   Result := '0000/00'; 

   if Trim(sMesRef) = '' then 
    
    sMesRef := Copy(FormatDateTime('dd/mm/yyyy', date),7,4) + '/' +       
               Copy(FormatDateTime('dd/mm/yyyy', date),4,2);              

   qry.close;
   qry.sql.Clear;
   
   
   qry.sql.add(' SELECT MAX(MESREFERENCIA) AS ULTMESPREPARO  '+
               ' FROM   HSTCONTRIBPREV '+
               ' WHERE  (IDPESSJUR        = '+IntToStr(iIdPessJur)        +')'+
               ' AND    (IDPLANOPREV      = '+IntToStr(iIdPlanoPrev)      +')'+
               ' AND    (IDPESSOA         = '+IntToStr(iIdPessoa)         +')'+
               ' AND    (SEQPROPOSTA      = '+IntToStr(iSeqProposta)      +')');
   if iIdContribuicao <> -1
   then qry.SQL.Add(' AND    (IDCONTRIBUICAO   = '+IntToStr(iIdContribuicao)+')');

   qry.SQL.Add(' AND    (MESREFERENCIA    <= '''+sMesRef                  +''') '+
               ' AND    (IDMOTIVO         = '+IntToStr(prmIdMotivoContrib)+') '+
               ' AND    (FLGDEVOLUCAO     = 0 ) '  );


   try
      qry.open;
   except
   end;

   if (not qry.IsEmpty) and (Trim(qry.FieldByName('UltMesPreparo').AsString) <> '')
   then Result := qry.FieldByName('UltMesPreparo').AsString;
   qry.Close;

end; // CalcUltMesContribuicao

function ProximaSequenciaDependente(iIdPessoa : longint; qry : TwwQuery) : longint;
begin
   Result := 1;
   qry.close;
   qry.sql.clear;
   qry.sql.add(' SELECT MAX(NUMSEQUENCIA) + 1 PROXIMODEPEN FROM DEPENTIT '+
               ' WHERE  IDTITULAR = '+IntToStr(iIdPessoa)+'');
   qry.open;
   if qry.IsEmpty
   then Result := 1
   else if qry.FieldbyName('ProximoDepen').AsString = ''
        then Result := 1
        else Result := qry.FieldByName('ProximoDepen').AsInteger;
end;

function GerarHistoricoSalario(qryAux: TwwQuery;
                               pIdPessJur, pIdPessoa,
                               pMesRef,     sSituacao, sSalario, pIdMotivoContrib: string):Boolean;
var
   sFlgSrb, sCodProvDesc, sIdRubrica, sCampoRubrica : string;
begin
   // Gera salario historico de salario "virtual" para mantidos, com o salario calculado no preparo

   result := False;
   if (sSituacao = 'MA') then
      begin
          sCampoRubrica := 'IDRUBSALMANUT';
          sFlgSrb       := '5';           
      end
   else
      begin
          sCampoRubrica := 'IDRUBSALMANUTPARC';
          sFlgSrb       := '4';           
      end;

   with qryAux do
   begin
     Close;
     SQL.Clear;     // Busca Rubrica
     SQL.Add(' SELECT '+sCampoRubrica+' AS IDRUBRICA FROM PATRO WHERE IDPESSOA = '+pIdPessJur);
     Open;
     if (not IsEmpty) and (FieldbyName('IDRUBRICA').AsInteger > 0)
     then begin
        sIdRubrica := FieldByName('IDRUBRICA').AsString;

        SQL.Clear;  // Busca codprovdesc
        SQL.Add(' SELECT CODPROVDESC FROM RUBRICAXPESS WHERE IDPESSOA  = '+pIdPessJur +
                '                                      AND   IDRUBRICA = '+sIdRubrica);
        Open;
        if (IsEmpty) or (FieldByName('CODPROVDESC').AsString = '') then
        begin
            MsgDlg('A Rubrica do salário de manutenção, não está associada a patrocinadora','Erro',mtError,[mbOk,mbHelp],0);
            Close;
            Exit;
        end;
        sCodProvDesc := FieldByName('CODPROVDESC').AsString;

        SQL.Clear;  // Insere no historico
        SQL.Add(' SELECT VALORPROVENTO '+ 
                ' FROM   HISTRUBSAL    '+
                ' WHERE (IDPESSOA  = '+pIdPessoa +')  AND '+
                '       (MES       = '''+pMesRef +''')  AND '+
                '       (IDRUBRICA = '+sIdRubrica+')  AND '+
                '       (IDPESSJUR = '+pIdPessJur+')   ');


        Open;
        if IsEmpty then
        begin
           Sql.Clear;
           Sql.Add('INSERT INTO HISTRUBSAL (IDPESSOA, IDPESSJUR, IDPATRO, IDRUBRICA, MES, '+ 
                   '                        VALORPROVENTO, REFERENCIA,  IDMOTIVO,  CODPROVDESC, '+
                   '                        SEQRUBRICA,    FLGSRB,      MESCOBRANCA ) '+
                   'VALUES ( '+pIdPessoa    +', '+
                               pIdPessJur   +', '+
                               pIdPessJur   +', '+
                               sIdRubrica   +', '+
                          ''''+pMesRef    +''', '+
                               OraNumero(sSalario)+', '+''''+'***'+''', '+
                               pIdMotivoContrib   +', '+
                          ''''+sCodProvDesc     +''', '+
                               '1'                +', '+
                               sFlgSrb            +', '+   
                          ''''+pMesRef          +''') ');
           try
              ExecSql;
           except
              Close;
              Exit;
           end;
        end;
     end;
     Close;
  end;   // with
  result := True;
end;

function BuscaSalario(piIdPessJur, piIdPlanoPrev, piIdPessoa  : longint;
                      psAnoMes, psSitFundacao,
                      sSalario                 : string;
                      var sMsgErro             : string;
                      qryAux                   : TwwQuery;
                      piOrigem                 : integer = 0;
                      pIdMotivoAbono           : Integer = 0;
                      pbEAbono                 : Boolean = False) : string;
var sNovoSalario,
    sNomeRubrica,
    sIdRubrica,
    sDescRubrica  : string;
begin
   Result := sSalario;

   sNovoSalario := '';

   // Preencher dados da rubrica de salario de participacao
   if psSitFundacao = 'MA' // Mantido
   then begin
      sDescRubrica := 'Salário de Manutenção Integral';
      sNomeRubrica := 'IDRUBSALMANUT';
   end
   else begin
      if psSitFundacao = 'MP' // Mantido Parcial
      then begin
         sDescRubrica := 'Salário de Manutenção Parcial';
         sNomeRubrica := 'IDRUBSALMANUTPARC';
      end
      else begin // Outras situacoes (Ativo, etc)
         if Copy(psAnoMes,6,2) = '13'
         then begin
            sDescRubrica := 'Décimo Terceiro Salário ';


            
            with qryAux do
            begin
              // Busca Identificados da Rubrica na PARAMSAL13
              Close;
              SQL.Clear;
              SQL.Add(' SELECT PAR.IDPESSJUR, PAR.EXERCICIO,                 '+
                      '        PAR.MESREFERENCIA, PAR.IDREGRA, PAR.IDRUBRICA '+
                      ' FROM PARAMSAL13 PAR '+
                      ' WHERE (PAR.IDPESSJUR = '+IntToStr(piIdPessJur)+')  AND '+
                      '       (SUBSTR(PAR.MESREFERENCIA,1,4) = '''+Copy(psAnoMes,1,4)+''') ');

              Open;
              // Guarda identificador caso encontre
              if not IsEmpty
              then sIdRubrica := FieldByName('IDRUBRICA').AsString
              else begin
                 SQL.Clear;
                 SQL.Add(' SELECT PT.IDRUBSALPARTICIP AS IDRUBRICA,   RP.CODPROVDESC,  '+
                         '        PV.FLGCOMPOEREMTOTAL,  PV.FLGCOMPOESALBENEF, '+
                         '        PV.FLGCOMPOESALPART,   PV.FLGIRRF '+
                         ' FROM   PATRO PT, RUBRICAXPESS RP, PROVDESC PV  '+
                         ' WHERE  PT.IDPESSOA  = '+IntToStr(piIdPessJur)+
                         ' AND    RP.IDPESSOA  = PT.IDPESSOA '+
                         ' AND    RP.IDRUBRICA = PT.IDRUBSALPARTICIP '+
                         ' AND    RP.IDRUBRICA = PV.IDPROVENTO ');
                 Open;
                 if not IsEmpty
                 then sIdRubrica := FieldByName('IDRUBRICA').AsString
                 else begin
                    sMsgErro := 'A Rubrica de '+sDescRubrica+' não foi encontrada no cadastro. Verifique.';
                    Exit;
                 end;
              end;
            end;
              
         end
         else begin
            sDescRubrica := 'Salário de Participação';
            sNomeRubrica := 'IDRUBSALPARTICIP';
         end;
      end;
   end;


   { Caso seja Rubrica da 13º, pesquisa já foi feita }
   if (Copy(psAnoMes,6,2) <> '13' ) 
      or ((psSitFundacao = 'MP') OR (psSitFundacao = 'MA')) then begin 
     with qryAux do
     begin
        SQL.Clear;
        SQL.Add(' SELECT PT.'+sNomeRubrica+' AS IDRUBRICA,   RP.CODPROVDESC,  '+
                '        PV.FLGCOMPOEREMTOTAL,  PV.FLGCOMPOESALBENEF, '+
                '        PV.FLGCOMPOESALPART,   PV.FLGIRRF '+
                ' FROM   PATRO PT, RUBRICAXPESS RP, PROVDESC PV  '+
                ' WHERE  PT.IDPESSOA  = '+IntToStr(piIdPessJur)+
                ' AND    RP.IDPESSOA  = PT.IDPESSOA '+
                ' AND    RP.IDRUBRICA = PT.'+sNomeRubrica+
                ' AND    RP.IDRUBRICA = PV.IDPROVENTO ');
        Open;
        if not IsEmpty
        then sIdRubrica := FieldByName('IDRUBRICA').AsString
        else begin
           sMsgErro := 'A Rubrica de '+sDescRubrica+' não foi encontrada no cadastro. Verifique.';
           Exit;
        end;
     end; // with
   end;


   if trim(sIdRubrica) = '' then
   begin
      qryaux.close;
      qryaux.SQL.Clear;
      qryaux.SQL.Add(' SELECT PT.IDRUBSALPARTICIP AS IDRUBRICA,   RP.CODPROVDESC,  '+
              '        PV.FLGCOMPOEREMTOTAL,  PV.FLGCOMPOESALBENEF, '+
              '        PV.FLGCOMPOESALPART,   PV.FLGIRRF '+
              ' FROM   PATRO PT, RUBRICAXPESS RP, PROVDESC PV  '+
              ' WHERE  PT.IDPESSOA  = '+IntToStr(piIdPessJur)+
              ' AND    RP.IDPESSOA  = PT.IDPESSOA '+
              ' AND    RP.IDRUBRICA = PT.IDRUBSALPARTICIP '+
              ' AND    RP.IDRUBRICA = PV.IDPROVENTO ');
      qryaux.Open;
      if not qryaux.IsEmpty
      then sIdRubrica := qryaux.FieldByName('IDRUBRICA').AsString
      else begin
         sMsgErro := 'A Rubrica de '+sDescRubrica+' não foi encontrada no cadastro. Verifique.';
         Exit;
      end;
   end;

   with qryAux
   do begin
      // Verificar se salário já existe neste mes
      Close;
      SQL.Clear;
      
      if piOrigem = 6 
      then SQL.Add(' SELECT NVL(VALORPROVENTO , 0) AS VALORPROVENTO ')   
      else SQL.Add(' SELECT DECODE(VLRANTRETROATIVO, NULL, VALORPROVENTO , VLRANTRETROATIVO) AS VALORPROVENTO '); 

      SQL.Add(' FROM HISTRUBSAL '+
              ' WHERE (IDPESSOA  = '+IntToStr(piIdPessoa) +')  AND '+
              '       (MES       = '''+psAnoMes           +''')  AND '+
              '       (IDRUBRICA = '''+sIdRubrica         +''')  AND '+
              
              '       ((IDPESSJUR = '+IntToStr(piIdPessJur)+') OR (IDPATRO = '+IntToStr(piIdPessJur)+'))');

      
      If pIdMotivoAbono > 0 Then
        If pbEAbono Then
          Sql.Add(' AND IDMOTIVO = '+IntToStr(pIdMotivoAbono))
        Else
          Sql.Add(' AND IDMOTIVO <> '+IntToStr(pIdMotivoAbono));
      

      Open;
      if not IsEmpty
      then sNovoSalario := FieldByName('ValorProvento').AsString
      else sNovoSalario := sSalario;
   end;
   qryAux.Close;

   if StrToFloat(ClienteNumero(sNovoSalario)) <= 0
   then begin
      sNovoSalario := BuscaSalarioPESSOA (qryAux,
                                          piIdPessJur, piIdPlanoPrev, piIdPessoa, 1,
                                          psSitFundacao,
                                          psAnoMes );
   end;

   Result := sNovoSalario;
end; // BuscaSalario


function VerificaRubricaMES( piIdPessJur,  piIdPessoa,
                             piIdRubrica                 : longint;
                             psAnoMes                    : string;
                             pbProcuraPorMesCobranca     : boolean;
                             qryAux                      : TwwQuery ) : boolean;
var sNomeCampo : string;
begin
   Result   := False;

   if pbProcuraPorMesCobranca
   then sNomeCampo := 'MESCOBRANCA'
   else sNomeCampo := 'MES';

   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT VALORPROVENTO '+ 
              ' FROM   HISTRUBSAL    '+
              ' WHERE  (IDPESSJUR = '+IntToStr(piIdPessJur) +')'+
              ' AND    (IDPESSOA  = '+IntToStr(piIdPessoa)  +')'+
              ' AND    (IDRUBRICA = '+IntToStr(piIdRubrica) +')'+
              ' AND    ('+sNomeCampo+' = '''+psAnoMes+''')');

      Open;
      if (not IsEmpty) and (FieldByName('ValorProvento').AsFloat > 0)
      then Result := True;
      Close;
   end;
end;

function BuscaRubricaMES( piIdPessJur,  piIdPessoa,
                          piIdRubrica                 : longint;
                          psAnoMes                    : string;
                          pbProcuraPorMesCobranca     : boolean;
                          qryAux                      : TwwQuery ) : string;
var sNomeCampo : string;
begin
   Result   := '0';

   if pbProcuraPorMesCobranca
   then sNomeCampo := 'MESCOBRANCA'
   else sNomeCampo := 'MES';

   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT VALORPROVENTO '+ 
              ' FROM   HISTRUBSAL    '+
              ' WHERE  (IDPESSJUR = '+IntToStr(piIdPessJur) +')'+
              ' AND    (IDPESSOA  = '+IntToStr(piIdPessoa)  +')'+
              ' AND    (IDRUBRICA = '+IntToStr(piIdRubrica) +')'+
              ' AND    ('+sNomeCampo+' = '''+psAnoMes+''')');

      Open;
      if (not IsEmpty) and (FieldByName('ValorProvento').AsFloat > 0)
      then Result := FieldByName('ValorProvento').AsString;
      Close;
   end;
end;

function ApagaRubricaMES( piIdPessJur,  piIdPessoa,
                          piIdRubrica                 : longint;
                          psAnoMesInicio,
                          psAnoMesFinal               : string;
                          pbProcuraPorMesCobranca     : boolean;
                          qryAux                      : TwwQuery ) : boolean;
var sNomeCampo : string;
begin
   Result   := False;

   if pbProcuraPorMesCobranca
   then sNomeCampo := 'MESCOBRANCA'
   else sNomeCampo := 'MES';

   // Se o mes final for 12, transformar para 13 para apagar o 13o. tambem
   if Copy(psAnoMesFinal,6,2) = '12'
   then psAnoMesFinal := Copy(psAnoMesFinal,1,5)+'13';
   
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' DELETE FROM HISTRUBSAL    '+
              ' WHERE  (IDPESSJUR = '+IntToStr(piIdPessJur) +')'+
              ' AND    (IDPESSOA  = '+IntToStr(piIdPessoa)  +')'+
              ' AND    (IDRUBRICA = '+IntToStr(piIdRubrica) +')'+
              ' AND    ('+sNomeCampo+' >= '''+psAnoMesInicio+''')'+
              ' AND    ('+sNomeCampo+' <= '''+psAnoMesFinal +''')');
      try
         ExecSQL;
      except
         Exit;
      end;
   end;
   Result := True;
end;

// Função para desfazer um evento registrado para um participante.
// Esta rotina :
// 1. Volta as situacoes dos participantes para as anteriores ao evento
// 2. Volta a cobrar as contribuicoes que cobrava antes do evento
function DesfazEventoParticipante ( piIdPessJur, piIdPlanoPrev, piIdPessoa,
                                    piSeqProposta, piIdEventoGerador : longint;
                                    psDataEvento : string;
                                    var sMsgErro : string;
                                    qryEvento    : TwwQuery) : boolean;
var sSQL : string;
begin

   Result   := False;
   sMsgErro := '';

   // Procurar evento na EventosPrev
   with qryEvento do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT EP.IDEVENTOSPREV,   EP.IDEVENTOGERADOR,   EP.IDPESSOA,         '+
              '        EP.IDPESSJUR,       EP.IDPLANOPREV,       EP.IDSITPLANOATUAL,  '+
              '        EP.IDSITPARTATUAL,  EP.IDSITFUNCATUAL,    EP.IDSITPLANONOVO,   '+
              '        EP.IDSITPARTNOVO,   EP.IDSITFUNCNOVO,     EP.DATAEVENTO,       '+
              '        EG.FLGINTERNO,      HS.IDCONTRIBUICAOF                         '+
              ' FROM   EVENTOSPREV EP,     EVENTOGERADOR EG, HSTCONTEVENTOSPR HS  '+
              ' WHERE  EP.IDEVENTOGERADOR = '+IntToStr(piIdEventoGerador)+
              ' AND    EP.IDPESSJUR       = '+IntToStr(piIdPessJur)+
              ' AND    EP.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)+
              ' AND    EP.IDPESSOA        = '+IntToStr(piIdPessoa)+
              ' AND    EP.SEQPROPOSTA     = '+IntToStr(piSeqProposta)+
              ' AND    EP.DATAEVENTO      = TO_DATE('''+psDataEvento+''',''dd/mm/yyyy'') '+
              ' AND    EP.IDEVENTOGERADOR = EG.IDEVENTOGERADOR '+
              ' AND    EP.IDEVENTOSPREV   = HS.IDEVENTOSPREV(+) '+
              ' AND    0                  = HS.FLGASSOCIADA(+) ');
      Open;
      if IsEmpty
      then begin
         Result := True;
         Exit;
      end;
   end;

   // Atualizar situacao na patrocinadora
   sSQL := ' UPDATE ELEGPATRO '+
           ' SET    IDSITFUNC   = '+qryEvento.FieldByName('IdSitFuncAtual').AsString+
           ' WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+
           ' AND    IDPESSOA  = '+IntToStr(piIdPessoa);

   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);

      try
         ExecSQL;
      except
         sMsgErro := 'Erro ao atualizar situação do participante na patrocinadora.';
         Exit;
      end;
   end;

   // Atualizar situacao do participante no plano e na fundacao
   sSQL := ' UPDATE PARTPREVPLAN  '+
           ' SET    IDSITPART      = '+qryEvento.FieldByName('IdSitPartAtual').AsString+','+
           '        IDSITPLANOPREV = '+qryEvento.FieldByName('IdSitPlanoAtual').AsString+
           ' WHERE  IDPESSJUR      = '+IntToStr(piIdPessJur)+
           ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
           ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)+
           ' AND    SEQPROPOSTA    = '+IntToStr(piSeqProposta);
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);

      try
         ExecSQL;
      except
         sMsgErro := 'Erro ao atualizar situação do participante no plano/fundação.';
         Exit;
      end;
   end;

   // Colocar todos os flgCobra da tabela de Contribuicoes como ZERO, e depois
   // colocar como UM apenas os das contribuicoes da situacao anterior ao evento
   sSQL := ' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0'+
           ' WHERE  IDPESSJUR      = '+IntToStr(piIdPessJur)+
           ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
           ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)+
           ' AND    SEQPROPOSTA    = '+IntToStr(piSeqProposta);
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);

      try
         ExecSQL;
      except
         sMsgErro := 'Erro ao desassociar contribuições do participantes.';
         Exit;
      end;
   end;

   qryEvento.First;
   while not qryEvento.Eof do
   begin
      sSQL := ' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1 '+
              ' WHERE  IDPESSJUR      = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
              ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)+
              ' AND    SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
              ' AND    IDCONTRIBUICAO = '+IntToStr(qryEvento.FieldByName('IDCONTRIBUICAOF').AsInteger);
      with dtmAPrev.qry do
      begin
         Close;
         SQL.Clear;
         SQL.Add(sSQL);

         try
            ExecSQL;
         except
            sMsgErro := 'Erro ao desassociar contribuições do participantes.';
            Exit;
         end;
      end;
      qryEvento.Next;
   end; // while

   Result := True;
end; // DesfazEventoParticipante

function AtualizaDividaEmprestimo( qryAux                       : TwwQuery;
                                   piIdPessJur,  piIdPlanoPrev,
                                   piIdPessoa ,  piSeqProposta  : longint;
                                   psDataDivida                 : string )    : boolean;
var dValorDivida : double;
    dValor       : double;
    sSQL : string;
begin
   Result := False;

   Result := True;
end; // AtualizaDividaEmprestimo

function AtualizaDividaAssistencial( qryAux                     : TwwQuery;
                                      piIdPessJur,  piIdPlanoPrev,
                                      piIdPessoa ,  piSeqProposta  : longint;
                                      psDataDivida                 : string )    : boolean;
var dValorDivida : extended;
    sSQL         : string;
begin
   Result := False;
   if Trim(psDataDivida)   = '' then psDataDivida := FormatDateTime('dd/mm/yyyy', date); 

   ConsultaDividaAssist ( piIdPessoa, dValorDivida, sSQL );

   if dValorDivida <= 0
   then begin
      Result := True;
      Exit;
   end;
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE PARTPREVPLAN SET FLGDEVEASSISTENC = 1 '+
              ' WHERE  (IDPESSJUR   = '+IntToStr(piIdPessJur)   +')'+
              ' AND    (IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+')'+
              ' AND    (IDPESSOA    = '+IntToStr(piIdPessoa)    +')'+
              ' AND    (SEQPROPOSTA = '+IntToStr(piSeqProposta) +')');
      try
         ExecSQL;
      except
         Exit;
      end;
   end;//with
   Result := True;
end; // AtualizaDividaAssistencial

function DividaPrevidenciaria (     var qryDivida               : TwwQuery;
                                    piIdPessJur, piIdPlanoPrev,
                                    piIdPessoa,  piSeqProposta  : longint;
                                    psMesDivida                 : string )   : double;
var dValorDivida : double;
    iIdMotivoDiverg : longint;
begin
   Result := 0;
   with qryDivida do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDMOTIVODIVERG FROM PARAMAPREV ');
      Open;
      if IsEmpty or (FieldByName('IdMotivoDiverg').AsInteger <= 0 )
      then iIdMotivoDiverg := 0
      else iIdMotivoDiverg := FieldByName('IdMotivoDiverg').AsInteger; 

      Close;
      SQL.Clear;
      SQL.Add( ' SELECT 1 AS FLGPARCELA,                                               '+
               '        HST.IDCONTRIBUICAO,  HST.IDPESSOA,       HST.IDPESSJUR,        '+
               '        HST.IDPLANOPREV,     HST.SEQPROPOSTA,    HST.IDMOTIVO,         '+
               '        HST.VALORESPERADO,   HST.VALORRECEBIDO,                        '+
               '        DECODE(SUM(DIVERGPAGA.VALORRECEBIDO), NULL, 0, SUM(DIVERGPAGA.VALORRECEBIDO))  AS VALORDIVERGPAGO, '+
               '        (  HST.VALORESPERADO                                           '+
               '         - DECODE(HST.VALORRECEBIDO, NULL,0, HST.VALORRECEBIDO)        '+
               '         - DECODE(SUM(DIVERGPAGA.VALORRECEBIDO), NULL, 0, SUM(DIVERGPAGA.VALORRECEBIDO)  ) '+
               '        ) AS DIVIDA,                                                   '+
               '        HST.NUMRECEBIMENTO, HST.MESREFERENCIA, HST.MESCOBRANCA,        '+
               '        C.NOME                                                         '+
               ' FROM   HSTCONTRIBPREV HST, CONTRIBUICAO C, CONTPREV CP, PARTPREVPLAN PP, '+
               '        PESSOAFISICA PF,    PATRO PT, PLANPREVPATRO PLP, HSTCONTRIBPREV DIVERGPAGA, '+
               '        PARAMAPREV PARAM '+
               ' WHERE  (HST.IDPESSOA       = '+IntToStr(piIdPessoa)+' )' +
               ' AND    (HST.IDPESSJUR      = '+IntToStr(piIdPessJur)+' )' +
               ' AND    (HST.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+' )' +
               ' AND    (HST.SEQPROPOSTA    = '+IntToStr(piSeqProposta)+' )' +
               ' AND    (HST.MESREFERENCIA <= '''+psMesDivida+''') '+
               ' AND    (HST.IDMOTIVO       = PARAM.IDMOTIVOCONTRIBP )' +
               ' AND    (HST.FLGDEVOLUCAO   = 0)                                       '+
               ' AND    (HST.SITRECEBIMENTO > ''0'')  '+
               ' AND    (HST.VALORESPERADO  > 0)                                       '+
               ' AND    ( (HST.VALORRECEBIDO IS NULL) OR (HST.VALORRECEBIDO <= 0) OR (HST.VALORRECEBIDO < HST.VALORESPERADO) ) '+
               ' AND    (CP.FLGPAGADOR      = ''C'' )                                  '+
               ' AND    (HST.IDCONTRIBUICAO = CP.IDCONTRIBUICAO)                       '+
               ' AND    (HST.IDPLANOPREV    = CP.IDPLANOPREV)                          '+
               ' AND    (HST.IDPESSJUR      = PT.IDPESSOA)                             '+
               ' AND    (HST.IDPESSJUR      = PLP.IDPESSJUR)                           '+
               ' AND    (HST.IDPLANOPREV    = PLP.IDPLANOPREV)                         '+
               ' AND    (CP.IDCONTRIBUICAO  = C.IDCONTRIBUICAO)                        '+
               ' AND    (HST.IDPESSJUR      = PP.IDPESSJUR)                            '+
               ' AND    (HST.IDPLANOPREV    = PP.IDPLANOPREV)                          '+
               ' AND    (HST.IDPESSOA       = PP.IDPESSOA)                             '+
               ' AND    (HST.SEQPROPOSTA    = PP.SEQPROPOSTA)                          '+
               ' AND    (PP.IDPESSOA        = PF.IDPESSOA)                             '+
               ' AND    (HST.IDCONTRIBUICAO NOT IN ( SELECT IDCONTRIBUICAO FROM PARAMDOTACAO '+
               '                                     WHERE   IDPESSJUR   = '+IntToStr(piIdPessJur)+
               '                                     AND     IDPLANOPREV = '+IntToStr(piIdPlanoPREV)+' ))' +
               ' AND    (DIVERGPAGA.IDPESSOA(+)       = '+IntToStr(piIdPessoa)    +' )' +
               ' AND    (DIVERGPAGA.IDPESSJUR(+)      = '+IntToStr(piIdPessJur)   +' )' +
               ' AND    (DIVERGPAGA.IDPLANOPREV(+)    = '+IntToStr(piIdPlanoPrev) +' )' +
               ' AND    (DIVERGPAGA.SEQPROPOSTA(+)    = '+IntToStr(piSeqProposta) +' )' +
               ' AND    (DIVERGPAGA.IDMOTIVO(+)       = '+IntToStr(iIdMotivoDiverg) +' )' +
               ' AND    (DIVERGPAGA.FLGDEVOLUCAO(+)   = 0)                            ' +
               ' AND    (DIVERGPAGA.IDCONTRIBUICAO(+) = HST.IDCONTRIBUICAO)           ' +
               ' AND    (DIVERGPAGA.MESREFERENCIA(+)  = HST.MESREFERENCIA)            ' +
               ' GROUP BY HST.IDCONTRIBUICAO,  HST.IDPESSOA,       HST.IDPESSJUR,     ' +
               '          HST.IDPLANOPREV,     HST.SEQPROPOSTA,    HST.IDMOTIVO,      ' +
               '          HST.VALORESPERADO,   HST.VALORRECEBIDO,                     ' +
               '          HST.NUMRECEBIMENTO, HST.MESREFERENCIA, HST.MESCOBRANCA,     ' +
               '          C.NOME                                                      ' +
               ' ORDER BY HST.MESREFERENCIA ');
      Open;

      First;
      dValorDivida := 0;
      while not Eof do
      begin
         dValorDivida := dValorDivida + FieldbyName('Divida').AsFloat;
         Next;
      end;
   end;
   Result := dValorDivida;
end; // DividaPrevidenciaria

function BaixaDividaPrevidenciaria (qryAux                             : TwwQuery;
                                    piIdPessJur,      piIdPlanoPrev,
                                    piIdPessoa,       piSeqProposta,
                                    piIdContribuicao                   : longint;
                                    psMesReferencia                    : string  ) : boolean;
begin
   Result := False;
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE HSTCONTRIBPREV SET VALORRECEBIDO  = VALORESPERADO, '+
              '                           SITRECEBIMENTO = ''2'''+
              ' WHERE  MESREFERENCIA  = '''+psMesReferencia+ ''''+
              ' AND    IDPESSJUR      = '+IntToStr(piIdPessJur)  +
              ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
              ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)   +
              ' AND    SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
              ' AND    IDCONTRIBUICAO = '+IntToStr(piIdContribuicao));
      try
        ExecSQL;
      except
        Exit;
      end;
   end;
   Result := True;
end; // BaixaDividaPrevidenciaria

// Rotina para atualizar a situacao de divida previdenciaria do participante
// (flgDevePrevidenciario) de acordo com a sua situacao no historico
function AtualizaSituacaoDividaPrevidenciaria ( qryAux                  : TwwQuery;
                                                piIdPessJur,      piIdPlanoPrev,
                                                piIdPessoa,       piSeqProposta    : longint ) : boolean;
var dValorDivida : double;
begin
    Result := False;
    // Verificar se participante ainda possui alguma divida
    dValorDivida := DividaPrevidenciaria (qryAux,
                                         piIdPessJur, piIdPlanoPrev,
                                         piIdPessoa,  piSeqProposta,
                                         Copy(FormatDateTime('dd/mm/yyyy', date),7,4) + '/' +        
                                         Copy(FormatDateTime('dd/mm/yyyy', date),4,2));              
    if dValorDivida > 0
    then begin
       MsgDlg('Participante ainda possui R$ '+FormatFloat('0.00',dValorDivida)+
              ' de dívida previdenciária. Verifique. ','Erro',mtError,[mbOk,mbHelp],0);
       Exit;
    end;
    with qryAux do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' UPDATE PARTPREVPLAN SET FLGDEVEPREVIDENC = 0    '+
               ' WHERE  (IDPESSJUR   = '+IntToStr(piIdPessJur)   +')'+
               ' AND    (IDPLANOPREV = '+IntToStr(piIdPlanoPrev) +')'+
               ' AND    (IDPESSOA    = '+IntToStr(piIdPessoa)    +')'+
               ' AND    (SEQPROPOSTA = '+IntToStr(piSeqProposta) +')');
       try
          ExecSQL;
       except
          Exit;
       end;
    end;
    Result := True;
end; // AtualizaSituacaoDividaPrevidenciaria

function BuscaUltimoEvento         ( qryAux                              : TwwQuery;
                                     piIdPessJur,   piIdPlanoPrev,
                                     piIdPessoa ,   piSeqProposta        : longint;
                                     psDataRef,
                                     psNomeCampoRetorno                  : string ) : string ;
begin
   Result := '';

   if Trim(psNomeCampoRetorno) = '' then psNomeCampoRetorno := 'IDEVENTOSPREV';

   if Trim(psDataRef) = ''   then psDataRef := FormatDateTime('dd/mm/yyyy', date); 

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT IDEVENTOSPREV, IDSITPLANOATUAL, IDPESSOA, IDSITFUNCATUAL, '+
                  '        IDEVENTOGERADOR, IDPESSJUR, IDSITPARTATUAL, IDPLANOPREV,  '+
                  '        IDSITPLANONOVO, IDSITPARTNOVO, DATAREGISTRO, DATAEVENTO,  '+
                  '        FLGEFETIVADO, DATAEFETIVADO, DATAALTERADO, DATAVOLTA,     '+
                  '        FLGSITFUNCIMED, IDSITFUNCNOVO, FLGSITPARTIMED, FLGSITPLANOIMED, '+
                  '        SEQPROPOSTA, IDBENEFICIO, FLGTPDEMISSAO, IDREGRACALCBENEF,      '+
                  '        IDREGRARESGATE, FLGCOBROUPATRO, SALPARTICIPACAO  '+
                  ' FROM   EVENTOSPREV '+
                  ' WHERE  (IDPESSJUR   = '+IntToStr(piIdPessJur )   +') '+
                  ' AND    (IDPLANOPREV = '+IntToStr(piIdPlanoPrev )   +') '+
                  ' AND    (IDPESSOA    = '+IntToStr(piIdPessoa )   +') '+
                  ' AND    (SEQPROPOSTA = '+IntToStr(piSeqProposta) +') '+
                  ' AND    (DATAEVENTO  < TO_DATE('''+psDataRef+''',''DD/MM/YYYY'')) '+
                  ' ORDER BY DATAEVENTO DESC ');
   qryAux.Open;
   if qryAux.IsEmpty
   then Exit;

   qryAux.First;
   try
      Result := qryAux.FieldbyName(psNomeCampoRetorno).AsString
   except
      Result := '';
      MsgDlg('Campo '+psNomeCampoRetorno+' não existe no Registro de Eventos.','Erro',mtError,[mbOk,mbHelp],0);
   end;
   qryAux.Close;
end; // BuscaUltimoEvento

function BuscaSituacaoParticipante( qryAux                              : TwwQuery;
                                    piIdPessJur,   piIdPlanoPrev,
                                    piIdPessoa ,   piSeqProposta        : longint;
                                    psAnoMes                            : string ) : string;
begin
   Result := '';

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT E.DATAEVENTO, SP.FLGINTERNO '+
                  ' FROM   EVENTOSPREV E, SITPART SP '+
                  ' WHERE  (E.IDPESSJUR   = '+IntToStr(piIdPessJur)   +') '+
                  ' AND    (E.IDPLANOPREV = '+IntToStr(piIdPlanoPrev) +') '+
                  ' AND    (E.IDPESSOA    = '+IntToStr(piIdPessoa )   +') '+
                  ' AND    (E.SEQPROPOSTA = '+IntToStr(piSeqProposta) +') '+
                  ' AND    (TO_CHAR(E.DATAEVENTO,''YYYY/MM'')  <=  '''+psAnoMes+''')'+
                  ' AND    ( (TO_CHAR(E.DATAVOLTA,''YYYY/MM'') >= '''+psAnoMes+''') OR (E.DATAVOLTA IS NULL) ) '+
                  ' AND    (E.IDSITPARTNOVO = SP.IDSITPART) '+
                  ' ORDER BY E.DATAEVENTO DESC ' );
   qryAux.Open;
   // Se nao encontrar, buscar da partprevplan
   if not qryAux.IsEmpty
   then Result := qryAux.FieldByName('FlgInterno').AsString
   else begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT SP.FLGINTERNO '+
                     ' FROM   PARTPREVPLAN PP, SITPART SP '+
                     ' WHERE  (PP.IDPESSJUR   = '+IntToStr(piIdPessJur)   +') '+
                     ' AND    (PP.IDPLANOPREV = '+IntToStr(piIdPlanoPrev) +') '+
                     ' AND    (PP.IDPESSOA    = '+IntToStr(piIdPessoa )   +') '+
                     ' AND    (PP.SEQPROPOSTA = '+IntToStr(piSeqProposta) +') '+
                     ' AND    (PP.IDSITPART = SP.IDSITPART) ');
      qryAux.Open;
      if not qryAux.IsEmpty
      then Result := qryAux.FieldByName('FlgInterno').AsString
   end;
   qryAux.Close;
end;

function AtualizaFlgDesativado    ( qryAux                        : TwwQuery;
                                    piIdPessJurAtual,
                                    piIdPlanoPrevAtual,
                                    piIdPessoa , piSeqProposta    : longint ) : boolean;
begin
   Result := False;
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add('  UPDATE PARTPREVPLAN SET FLGDESATIVADO = 1               '+
              '  WHERE  IDPESSOA     = '+IntToStr(piIdPessoa)             +
              '  AND    SEQPROPOSTA  = '+IntToStr(piSeqProposta)          +
              '  AND    ( (IDPLANOPREV  <> '+IntToStr(piIdPlanoPrevAtual) +') OR ' +
              '           (IDPESSJUR    <> '+IntToStr(piIdPessJurAtual)   +') )  ' );
      try
         ExecSQL;
      except
         Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add('  UPDATE PARTPREVPLAN SET FLGDESATIVADO = 0          '+
              '  WHERE  IDPESSOA     = '+IntToStr(piIdPessoa)        +
              '  AND    SEQPROPOSTA  = '+IntToStr(piSeqProposta)     +
              '  AND    IDPLANOPREV  = '+IntToStr(piIdPlanoPrevAtual)+
              '  AND    IDPESSJUR    = '+IntToStr(piIdPessJurAtual)  );
      try
         ExecSQL;
      except
         Exit;
      end;
   end;
   Result := True;
end; // AtualizaFlgDesativado

function AtualizaReservaParticipante ( qryReserva,    qryAux               : TwwQuery;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta,
                                       piIdEventoGerador                   : longint;
                                       psDataLimite                        : string;
                                       var sMsgErro                        : string ) : boolean;
var sSQL,
    sDataABuscarCota        : string;
    dValorCota,
    dValorSaldoResCotas,
    dValorAAlimentarEmReal,
    dValorAAlimentarEmCotas : double;
begin
   Result   := False;

   Result   := True;
end;

// FUNCEF
function ExistemContribuicoesPeriodo ( qryAux : TwwQuery;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta : longint;
                                       psDataInicio,  psDataFinal   : string ) : boolean;
begin
   Result := False;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT COUNT(NUMRECEBIMENTO) AS NUMCONTRIB '+
                  ' FROM   HSTCONTRIBPREV        '+
                  ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)+
                  ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev)+
                  ' AND    IDPESSOA    = '+IntToStr(piIdPESSOA)+
                  ' AND    SEQPROPOSTA = '+IntToStr(piSeqProposta)+
                  ' AND    VALORESPERADO IS NOT NULL '+
                  ' AND    VALORESPERADO > 0         '+
                  ' AND    VALORRECEBIDO IS NOT NULL '+
                  ' AND    VALORRECEBIDO > 0         '+
                  ' AND DECODE(SUBSTR(MESREFERENCIA,6,2),''13'',FLGDEVOLUCAO,0) = 0'+
                  ' AND DECODE(SUBSTR(MESREFERENCIA,6,2),''13'',MESCOBRANCA,MESREFERENCIA) >= '+ '''' +Copy(psDataInicio,7,4)+'/'+Copy(psDataInicio,4,2)+''''+
                  ' AND DECODE(SUBSTR(MESREFERENCIA,6,2),''13'',MESCOBRANCA,MESREFERENCIA) <= '+ '''' +Copy(psDataFinal,7,4)+'/'+Copy(psDataFinal,4,2)+'''');

                 // Jéssica Lana Sol 111791 Kintana 549075
                 // ' AND    MESREFERENCIA >= '   ''+Copy(psDataInicio,7,4)+'/'+Copy(psDataInicio,4,2)+''''+
                 // ' AND    MESREFERENCIA <= '   ''+Copy(psDataFinal,7,4)+'/'+Copy(psDataFinal,4,2)+'''');


   qryAux.Open;
   if (not qryAux.IsEmpty) and (qryAux.FieldByName('NumContrib').AsInteger > 0)
   then Result := True;
   qryAux.Close;

end;

function PossuiEmprestimoAberto ( qryAux : TwwQuery;
                                  piIdPessJur,   piIdPlanoPrev,
                                  piIdPessoa ,   piSeqProposta : longint ) : boolean;
begin
   Result := False;
  
   Result := True;
end;

function AtualizaFLGPossuiEmprestimo ( qryAux : TwwQuery;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta : longint ) : boolean;
var iFlgDeveEmprestimo : longint;
begin
   Result := False;


   Result := True;
end;

function CalculaEnquadramento        ( qryAux : TwwQuery;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa, piIdTitular ,
                                       piSeqProposta : longint;
                                       psDataRef : string = '' ) : double; 
var dValorEnquadramento : double;
    sValorRegra, sSQL   : string;
    bErro               : boolean;
begin
   Result := 0;

   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDRGENQUADRAMENTO FROM PLANPREVPATRO '+
              ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev));
      Open;

      if (IsEmpty) or (FieldByName('IDRGENQUADRAMENTO').AsString = '')
      then Exit;

      if Trim(psDataRef)   = '' then psDataRef := FormatDateTime('dd/mm/yyyy', date); 

      sSQL := ' SELECT DISTINCT '+IntToStr(piIdPessoa)+' AS IDPESSOA,    '+
              '                 PP.IDPESSOA AS IDTITULAR, '+
              '                 PP.IDPESSJUR,                        '+
              '                 PP.IDPLANOPREV,                      '+
              '                 PP.INSCRICAODATA,                    '+
              '                 PP.INSCRICAOTIPO,                    '+
              '                 EL.IDSITFUNC,                        '+
              '                 PP.IDSITPLANOPREV,                   '+
              '                 PP.IDSITPART,                        '+
              '                 PF.DATANASC,                         '+
              '                 PF.SEXO,                             '+
              '                 PF.DATAMORTE,                        '+
              '                 SP.FLGINTERNO,                       '+
              '                 EL.SALTOTAL,                         '+
              '                 EL.DATAADMISSAO,                     '+
              '                 EL.TEMPOSERVANTERIOR,                '+
              '                 EL.TEMPONAOCREDITADO,                '+
              '                 EL.TEMPOSERVTOTAL,                   '+
              '                 EL.DATADEMISSAO,                     '+
              '                 EL.TEMPOSERVTOTMES,                  '+
              '                 EL.TEMPOSERVTOTDIA,                  '+
              '                 EL.FLGDIRETOR,                       '+
              '                 PP.INSCRICAODATA,                    '+
              '                 PP.IDPESSOA       AS IDTITULAR,      '+
              '                 EL.IDSITFUNC,                        '+
              '                 EL.IDSITFUNC      AS IDSITFUNATUAL,  '+
              '                 EL.IDSITFUNC      AS IDSITFUNCNOVO,  '+
              '                 PP.IDSITPLANOPREV AS IDSITPLANONOVO, '+
              '                 PP.IDSITPART      AS IDSITPARTNOVO,  '+
              ''''+psDataRef+'''                  AS DATAREF         '+ 
              ' FROM  PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP, SITPART SP '+
              ' WHERE PP.IDPESSJUR      = '+IntToStr(piIdPessJur)+
              ' AND   PP.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
              ' AND   PP.IDPESSOA       = '+IntToStr(piIdTitular)+
              ' AND   PP.SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
              ' AND   EL.IDPESSJUR      = PP.IDPESSJUR     '+
              ' AND   EL.IDPESSOA       = PP.IDPESSOA      '+
              ' AND   PF.IDPESSOA       = EL.IDPESSOA      '+
              ' AND   SP.IDSITPART      = PP.IDSITPART     ';

      try
         sValorRegra := RegraNumerica(FieldByName('IDRGENQUADRAMENTO').AsString,sSQL, bErro, iIdCalculoGeral);

         dValorEnquadramento := StrToFloat(ClienteNumero(sValorRegra));
      except
         MsgDlg('Erro ao executar regra de cálculo do enquadramento No. '+FieldByName('IDRGENQUADRAMENTO').AsString,'Erro',mtError,[mbOk],0);
         Exit;
      end;
   end;

   Result := dValorEnquadramento;
end;

function InsereHistFuncPrev          ( qryAux : TwwQuery;
                                       piIdPessJur, piIdPessoa : longint;
                                       psMatricula, psDataInicio, psDataFinal,
                                       sIdEventoGerador:  string;
                                       psFlgInterno : string = ''): boolean; 
var sSeqHistFunc,
    sSQL : string;
    sEventoGerador: String;
begin
   Result := False;
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' SELECT MAX(SEQHISTFUNC) + 1 AS PROXIMOSEQHISTFUNC FROM HISTFUNCPREV ' +
                  ' WHERE IDPESSOA = ' + IntToStr(piIdPessoa));
   qryAux.Open;

   if (qryAux.FieldByName('PROXIMOSEQHISTFUNC').AsString = '') or
      (qryAux.FieldByName('PROXIMOSEQHISTFUNC').AsString = '0')
   then sSeqHistFunc := '1'
   else sSeqHistFunc := qryAux.FieldByName('PROXIMOSEQHISTFUNC').AsString;

   
   If sIdEventoGerador <> '' Then
   Begin
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT NOME FROM EVENTOGERADOR '+
                    ' WHERE IDEVENTOGERADOR = ' + sIdEventoGerador );
     qryAux.Open;
     sEventoGerador := qryAux.FieldByName('NOME').AsString;
   End Else sEventoGerador := 'NULL';

   sSQL := ' INSERT INTO HISTFUNCPREV ( IDPESSOA,  IDPESSJUR, SEQHISTFUNC, DATAINICIO,         '+
           '                            DATAFINAL, FLGCONTATS, FLGCONCOMITANTE, DATAPROCESSO,  '+
           '                            MATRICULA, IDDOCUMENTO, CODTPINSALUBRI, CARGO,         '+
           '                            FUNCAO, TEMPOCALCINSALUB, EMPRESA, VALORCARGO,         '+
           '                            NUMDOCUMENTO, VINCEMPREG, TEMPOCALC, FLGTEMPOMANUT)    '+    
           ' VALUES ( '+IntToStr(piIdPessoa)+', '+IntToStr(piIdPessJur)+', '+sSeqHistFunc+',    ';

   if Trim(psDataInicio) <> ''
   then sSQL := sSQL + ' TO_DATE('''+psDataInicio+''', ''DD/MM/YYYY'') , '
   else sSQL := sSQL + ' NULL, ';

   if Trim(psDataFinal) <> ''
   then sSQL := sSQL + ' TO_DATE('''+psDataFinal+''', ''DD/MM/YYYY'') , '
   else sSQL := sSQL + ' NULL, ';

   sSQL := sSQL + ' 0, 0, NULL, NULL, NULL, NULL, NULL,                '+
                  ' NULL, NULL, '+
                   QuotedStr(sEventoGerador) + ',' + 
                   ' NULL,NULL, NULL, NULL '; 

   
   If psFlgInterno = 'DM'
    Then sSql := sSql + ', 1) '
    Else sSql := sSql + ', 0) ';
   

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   try
      qryAux.ExecSQL;
   except
      Exit;
   end;
   Result := True;
end;

function AtualizaHistFuncPrev ( qryAux : TwwQuery;
                                piIdPessJur, piIdPessoa : longint;
                                psDataInicio, psDataFinal, sIdEventoGerador : string { opcional }  ) : boolean;
var sSeqHistFunc,
    sSQL,
    sDataFinal,
    sDataInicio,
    sMatricula          : string;
    iFlgIncluiHistFunc  : Integer;
    sFlgInterno         : String;  
    iFlgContaTs         : Integer; 
begin
   Result := False;

   // armazena o FLGINLCUIHISTFUNC
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' SELECT FLGINTERNO, FLGINCLUIHISTFUNC FROM EVENTOGERADOR ' +  
                  ' WHERE IDEVENTOGERADOR = ' + sIdEventoGerador);
   qryAux.Open;
   iFlgIncluiHistFunc := qryAux.FieldByName('FLGINCLUIHISTFUNC').AsInteger;
   sFlgInterno := qryAux.FieldByName('FLGINTERNO').AsString;     

   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' SELECT MAX(SEQHISTFUNC) AS SEQHISTFUNC FROM HISTFUNCPREV ' +
                  ' WHERE IDPESSJUR = '+ IntToStr(piIdPessJur)+
                  ' AND   IDPESSOA = ' + IntToStr(piIdPessoa));
   qryAux.Open;

   if (qryAux.IsEmpty) or (qryAux.FieldByName('SEQHISTFUNC').AsString = '' ) Or
      (iFlgIncluiHistFunc = 1) then
   begin
      
      If qryAux.FieldByName('SEQHISTFUNC').AsString <> '' Then
        sSeqHistFunc := qryAux.FieldByName('SEQHISTFUNC').AsString;

      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' SELECT MATRICULA, DATAADMISSAO,  DATADEMISSAO  FROM ELEGPATRO ' +
                     ' WHERE IDPESSJUR = '+ IntToStr(piIdPessJur)+
                     ' AND   IDPESSOA = ' + IntToStr(piIdPessoa));
      qryAux.Open;

      if Trim(psDataInicio) = ''
      then sDataInicio := qryAux.FieldByName('DATAADMISSAO').AsString
      else sDataInicio := psDataInicio;

      if Trim(psDataFinal) = ''
      then sDataFinal  := qryAux.FieldByName('DATADEMISSAO').AsString
      else sDataFinal  := psDataFinal;

      if not InsereHistFuncPrev ( qryAux, piIdPessJur, piIdPessoa,
                                  qryAux.FieldByName('MATRICULA').AsString,
                                  sDataInicio,
                                  '', sIdEventoGerador,
                                  sFlgInterno) 
      then Exit;

      // Atualiza a data final do registro anterior.
      If sSeqHistFunc <> '' Then
      Begin
        sSQL := ' UPDATE HISTFUNCPREV SET DATAFINAL = TO_DATE('''+ psDataFinal +''', ''DD/MM/YYYY'') '+
                ' WHERE  IDPESSJUR   = '+ IntToStr(piIdPessJur)+
                ' AND    IDPESSOA    = '+ IntToStr(piIdPessoa)+
                ' AND    SEQHISTFUNC = '+ sSeqHistFunc;
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSQL);
        try
          qryAux.ExecSQL;
        except
          Exit;
        end;
      End;
      
   end
   else begin
       sSeqHistFunc := qryAux.FieldByName('SEQHISTFUNC').AsString;
       qryAux.Close;

       qryAux.Sql.Clear;
       qryAux.Sql.Add(' SELECT MATRICULA, DATAINICIO, DATAFINAL, FLGCONTATS FROM HISTFUNCPREV ' + 
                      ' WHERE  IDPESSJUR   = '+ IntToStr(piIdPessJur)+
                      ' AND    IDPESSOA    = ' + IntToStr(piIdPessoa)+
                      ' AND    SEQHISTFUNC = '+sSeqHistFunc);
       qryAux.Open;

      sMatricula  := qryAux.FieldByName('MATRICULA').AsString;
      sDataInicio := qryAux.FieldByName('DATAINICIO').AsString;
      sDataFinal  := qryAux.FieldByName('DATAFINAL').AsString;
      iFlgContaTs := qryAux.FieldByName('FLGCONTATS').AsInteger; 

      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' SELECT MATRICULA, DATAADMISSAO,  DATADEMISSAO FROM ELEGPATRO ' +
                     ' WHERE IDPESSJUR = '+ IntToStr(piIdPessJur)+
                     ' AND   IDPESSOA = ' + IntToStr(piIdPessoa));
      qryAux.Open;

      // Se o registro já existe, ou é um registro com a admissao gravada e a demissao em branco
      // ou é um registro antigo
      if (sDataInicio = qryAux.FieldByName('DATAADMISSAO').AsString) and
         (qryAux.FieldByName('DATADEMISSAO').AsString <> '')         and
         (sDataFinal  = '' )
      then begin
         sSQL := ' UPDATE HISTFUNCPREV '+
                 '  SET DATAFINAL = TO_DATE('''+qryAux.FieldByName('DATADEMISSAO').AsString+''', ''DD/MM/YYYY''), ';
         If iFlgContaTs = 1
          Then sSql := sSql + 'FLGTEMPOMANUT = 1 '
          Else sSql := sSql + 'FLGTEMPOMANUT = 0 ';
         sSql := sSql +
                 ' WHERE  IDPESSJUR   = '+ IntToStr(piIdPessJur)+
                 ' AND    IDPESSOA    = '+ IntToStr(piIdPessoa)+
                 ' AND    SEQHISTFUNC = '+ sSeqHistFunc;
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(sSQL);
         try
            qryAux.ExecSQL;
         except
            Exit;
         end;
      end;
   end;
   Result := True;
end;

function CalcBeneficioINSSPAGO( iIdPessJur,
                                 iIdPlanoPrev,
                                 iIdPessoa            : longint;
                                 sMesInicio,
                                 sMesRef              : string;
                                 var psIDTPPAGTOANT,
                                     psFlgBenefMinimo : string;
                                 qry                  : TwwQuery;
                                 iINumProcesso        : Integer)  : string; 
var rValorTotal,
    rValorAUsar  : double;
    sAnoMesInicio,
    sAnoMesFinal,
    sAnoMesAtual : string;
    i            : word;

begin
   Result := '0';
   psIdTpPagtoAnt := '';
   psFlgBenefMinimo := '0';

   if Trim(sMesInicio) = '' then sMesInicio := sMesRef;
   // NAO CONSIDERAR BENEFICIO DE PAGAMENTO UNICO
   // Verificar todos os beneficios que o participante estava recebendo
   // na data do evento
   // Esta query supoe que o beneficio anterior é o beneficio cuja data
   // de inicio é anterior a data parametrizada e cuja data final
   // nao é nula, ou seja, ele foi encerrado
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT BF.IDBENEFICIO,BF.VALORATUAL,BF.IDTPPAGTOBENEFIC,BF.FLGBENEFMIN, '+
               ' EV.FLGINTERNO, BF.IDSITBENEFICIO '+
               ' FROM   TPPAGTOBENEFICIO T, BENEFICIO B, BENEFPLANPREV BP, BENEFBFCIARIO BF, '+
               ' EVENTOGERADOR EV '+
               ' WHERE  (BF.IDPESSJUR       = '+IntToStr(iIdPessJur)   +')'+
               ' AND    (BF.IDPLANOPREV     = '+IntToStr(iIdPLANOPREV) +')'+
               ' AND    (BF.IDPESSOA        = '+IntToStr(iIdPESSOA)    +')'+
               ' AND    (BF.IDTITULAR       = '+IntToStr(iIdPESSOA)    +')'+
               ' AND    (BF.NUMEROPROCESSO  = '+IntToStr(iINumProcesso)+')'+
               ' AND    (TO_CHAR(BF.DATAINICIO,''YYYY/MM'') <= '''+sMesInicio+''') ');
   if Copy(sMesRef,6,2) <> '13'
   then qry.SQL.Add(' AND    ( (BF.DATAFINAL IS NULL) OR (TO_CHAR(BF.DATAFINAL,''YYYY/MM'') >= '''+sMesRef+''') ) ');
   qry.SQL.Add(' AND    (BF.IDPLANOPREV     = BP.IDPLANOPREV) '+
               ' AND    (BF.IDBENEFICIO     = BP.IDBENEFICIO) '+
               ' AND    (BP.FLGREFERENCIA   = 1) '+
               ' AND    (BP.IDBENEFICIO     = B.IDBENEFICIO) '+
               ' AND    (B.IDTPPAGTOBENEFIC = T.IDTPPAGTOBENEFIC)'+
               ' AND    (T.FLGFREQUENCIA    <> ''U'')'+
   
               ' AND    (B.IDEVENTOGERADOR  = EV.IDEVENTOGERADOR)');

   
   qry.Open;
   qry.First;
   if qry.IsEmpty
   then Exit;// Participante nao estava em beneficio nesta epoca

   // Procurar beneficios no historico e somar seus valores
   // Caso nao os encontre no historico, somar valores da benefbfciario
   rValorTotal := 0;
   qry.First;
   while not qry.Eof do
   begin
       psIdTpPagtoAnt    := qry.FieldByName('IdTpPagtoBenefic').AsString;
       if not ((psFlgBenefMinimo = '1') and (qry.FieldByName('FlgBenefMin').AsString = '0'))
       then psFlgBenefMinimo := qry.FieldByName('FlgBenefMin').AsString;

       sAnoMesFinal  := sMesRef;
       sAnoMesInicio := sMesInicio;
       sAnoMesAtual := sAnoMesInicio;
       rValorAUsar  := 0;

       
       dtmAPrev.qryAux.Close;
       dtmAPrev.qryAux.SQL.Clear;
       dtmAPrev.qryAux.SQL.Add(' SELECT VLBENEFPGTO                            '+
                               ' FROM   HSTBENEFBFCIARIO                         '+
                               ' WHERE  (IDPESSOA      = '+IntToStr(iIdPESSOA)   +')'+
                               ' AND    (MESREFERENCIA = '''+sAnoMesAtual+''' '  +')'+
                               ' AND    (IDBENEFICIO   = '+qry.FieldbyName('IdBeneficio').AsString+')');

       dtmAPrev.qryAux.Open;
       if not dtmAPrev.qryAux.IsEmpty
       then rValorAUsar := dtmAPrev.qryAux.FieldByName('VLBENEFPGTO').AsFloat;

       if rValorAUsar <= 0 then rValorAUsar := qry.FieldByName('VALORATUAL').AsFloat;

       
       If Copy(sMesRef,6,2) <> '13'
        Then If (Trim(qry.FieldByName('FLGINTERNO').AsString) = 'IN') or
                (Trim(qry.FieldByName('FLGINTERNO').AsString) = 'AC')
              Then rValorTotal := rValorAUsar
              Else rValorTotal := rValorTotal + rValorAUsar
        Else rValorTotal := rValorTotal + rValorAUsar;
       
       qry.Next;
   end;
   qry.Close;
   dtmAPrev.qryAux.Close;
   Result := OraNumero(FloatToStr(rValorTotal));
   if Trim(Result) = '' then Result := '0';
end;//CalcBeneficioINSSPAGO

{------------------------------------------------------------------------------}
{ Calcular o valor de um determinado movimento ( concessao,renovacao,etc )     }
Function CalcBeneficioDoMovimento( qryAux               : TwwQuery;
                                  piNumProcesso, piIdPessJur,
                                  piIdPlanoPrev, piIdTitular,
                                  piIdPessoa            : Integer;
                                  psAnoMesRef           : String;
                                  piIdLote              : LongInt;
                                  pcSuplOuINSS          : Char;
                                  pcValorIntegralOuReal : Char ) : double;
Var

  rValorTotal,   rValorAUsar  : Double;

  sSQL,
  sAnoMesInicio, sAnoMesFinal, sAnoMesAtual : String;

  I : Word;

Begin

  { Limpeza dos comentários desnecessários e e reorganização do código }

  Result := 0;;

  If ( ( pcValorIntegralOuReal = 'I' ) and ( pcSuplOuINSS <> 'S' ) ) Then
  Begin
    sSQL := ' SELECT HBF.VALORINTEGRAL ';
  End
  Else
  Begin
    sSQL := 'SELECT SUM( DECODE(HBF.FLGDEVOLUCAO, 1, -HBF.VALORPREV, HBF.VALORPREV) ) AS VALORPREV ';
  End;

  sSQL := sSQL +
          ' FROM   HSTBENEFBFCIARIO HBF, TPPAGTOBENEFICIO TPB, BENEFPLANPREV BFP, BENEFICIO BEN '+
          ' WHERE  (HBF.IDPESSJUR        = '+IntToStr(piIdPessJur)   +')   '+
          ' AND    (HBF.IDPLANOPREV      = '+IntToStr(piIdPLANOPREV) +')   '+
          ' AND    (HBF.IDPESSOA         = '+IntToStr(piIdPESSOA)    +')   '+
          ' AND    (HBF.IDTITULAR        = '+IntToStr(piIdTitular)   +')   '+
          ' AND    (HBF.MESREFERENCIA    = '''+psAnoMesRef           +''') '+
          ' AND    (BFP.IDPLANOPREV      = HBF.IDPLANOPREV)                '+
          ' AND    (BFP.IDBENEFICIO      = HBF.IDBENEFICIO)                '+
          ' AND    (BEN.IDBENEFICIO      = BFP.IDBENEFICIO)                '+
          ' AND    (BEN.IDTPPAGTOBENEFIC = TPB.IDTPPAGTOBENEFIC)           '+
          ' AND    (NVL(BEN.FLGPECULIO,0)  = 0  )                          ';

  If ( piNumProcesso > 0 ) Then
    sSQL := sSQL + ' AND  HBF.NUMEROPROCESSO = '''+IntToStr(piNumProcesso)+''' ';

  If ( piIdLote > 0 ) Then
    sSQL := sSQL + ' AND ((HBF.IDLOTE         = '''+IntToStr(piIdLote)+''') OR '+
                   '(HBF.IDLOTE IS NULL AND HBF.IDMOTIVO = '+IntToStr(prmIdMotDevolNaoIden)+'))';

  If pcSuplOuINSS = 'S' Then
    sSQL := sSQL + ' AND BFP.FLGREFERENCIA = 0 '
  Else
    sSQL := sSQL + ' AND BFP.FLGREFERENCIA = 1 ';

  If FazQuery( QryAux, sSQL ) Then
  Begin

    If ( ( pcValorIntegralOuReal = 'I' ) and ( pcSuplOuINSS <> 'S' ) ) Then
      Result := Abs( qryAux.FieldByName('VALORINTEGRAL').AsFloat )
    Else
      Result := Abs( qryAux.FieldByName('VALORPREV').AsFloat );

  End;

  QryAux.Close;

End; { CalcBeneficioDoMovimento }

{------------------------------------------------------------------------------}
{ Calcular o valor de um determinado movimento ( concessao,renovacao,etc )     }
Function CalcBeneficioNoMes( QryAux     : TwwQuery;
                             piNumProcesso,  piIdPessJur,
                             piIdPlanoPrev,  piIdTitular,
                             piIdPessoa : Integer;

                             psAnoMesRef  : String;
                             piIdLote     : LongInt;
                             pcSuplOuINSS : Char;
                             pcValorIntegralOuReal : Char;
                             pIdBeneficio: Integer = 0 ) : Double;
Var
  rValorTotal,   rValorAUsar  : Double;

  sSQL,
  sAnoMesInicio, sAnoMesFinal, sAnoMesAtual : String;

  I : Word;

Begin

  { Limpeza dos comentários desnecessários e e reorganização do código }

  Result := 0;;

  If ( pcValorIntegralOuReal <> 'I' ) Then
  Begin
    sSQL := ' SELECT SUM( DECODE( HBF.FLGDEVOLUCAO, 1, -HBF.VALORPREV,      HBF.VALORPREV ) )      AS VALORPREV,     '+
            '        SUM( DECODE( HBF.FLGDEVOLUCAO, 1, -HBF.VALORCALCULADO, HBF.VALORCALCULADO ) ) AS VALORCALCULADO ';
  End
  Else
  Begin
    sSQL := ' SELECT HBF.VALORINTEGRAL AS VALORINTEGRAL '; { SUM é obrigatório para o caso de estar filtrando por }
                                                                  { lote tbm  nos outros casos não tem valor prático.    }
  End;

  //If piIdLote > 0 Then
  //  sSQL := sSQL + ', HBF.IDLOTE ';

  sSQL := sSQL + ' FROM   HSTBENEFBFCIARIO HBF, TPPAGTOBENEFICIO TPB, BENEFPLANPREV BFP, BENEFICIO BEN '+
                 ' WHERE  (HBF.IDPESSJUR         = '+IntToStr(piIdPessJur)   +') '+
                 ' AND    (HBF.IDPLANOPREV       = '+IntToStr(piIdPLANOPREV) +') '+
                 ' AND    (HBF.IDPESSOA          = '+IntToStr(piIdPESSOA)    +') '+
                 ' AND    (HBF.IDTITULAR         = '+IntToStr(piIdTitular)   +') '+
                 ' AND    (HBF.MESREFERENCIA     = '''+psAnoMesRef         +''') '+

                 ' AND    (BFP.IDPLANOPREV       = HBF.IDPLANOPREV)              '+
                 ' AND    (BFP.IDBENEFICIO       = HBF.IDBENEFICIO)              '+

                 ' AND    (BFP.IDBENEFICIO       = BEN.IDBENEFICIO)              '+

                 ' AND    (BEN.IDTPPAGTOBENEFIC  = TPB.IDTPPAGTOBENEFIC)         '+
                 ' AND    (NVL(BEN.FLGPECULIO,0) = 0  )                          ';

  If ( pcValorIntegralOuReal = 'I' ) Then
  Begin
    //BRUNO AZEVEDO SOL 158720 KINTANA 1291021
    sSQL := sSQL + ' AND (HBF.mes,hbf.trgdtinclusao) =  '+
                   '                (SELECT MAX(hbf1.mes), MAX(hbf1.trgdtinclusao) '+
                   '                   FROM HSTBENEFBFCIARIO HBF1  '+
                   '                            WHERE                  '+
                   '                                  ( HBF1.IDPESSJUR     = '+ IntToStr( piIdPessJur )  +' ) '+
                   '                              AND ( HBF1.IDPLANOPREV   = '+ IntToStr( piIdPlanoPrev )+' ) '+
                   '                              AND ( HBF1.IDPESSOA      = '+ IntToStr( piIdPessoa )   +' ) '+
                   '                              AND ( HBF1.IDTITULAR     = '+ IntToStr( piIdTitular )  +' ) '+
                   '                              AND ( HBF1.MESREFERENCIA = '+ QuotedStr( psAnoMesRef ) +' ) ';
                   If piNumProcesso > 0 Then
                      sSQL := sSQL + ' AND  HBF1.NUMEROPROCESSO = '''+IntToStr(piNumProcesso)+''' ';

                   if pIdBeneficio > 0 then
                      sSQL := sSQL + ' AND  HBF1.IDBENEFICIO = '''+IntToStr(pIdBeneficio)+''' ';

                      sSQL := sSQL + ' ) ';
    //BRUNO AZEVEDO SOL 158720 KINTANA 1291021
  End;

  If piNumProcesso > 0 Then
    sSQL := sSQL + ' AND  HBF.NUMEROPROCESSO = '''+IntToStr(piNumProcesso)+''' ';

  //if piIdLote > 0 then
  //  sSQL := sSQL + ' AND  HBF.IDLOTE = '''+IntToStr(piIdLote)+''' ';

  if pIdBeneficio > 0 then
    sSQL := sSQL + ' AND  HBF.IDBENEFICIO = '''+IntToStr(pIdBeneficio)+''' ';

  if pcSuplOuINSS = 'S' then
    sSQL := sSQL + ' AND BFP.FLGREFERENCIA = 0 '
  else
    sSQL := sSQL + ' AND BFP.FLGREFERENCIA = 1 ';

  //If piIdLote > 0 Then
  //  sSQL := sSQL + //'GROUP BY HBF.IDLOTE '+
  //                 'ORDER BY HBF.IDLOTE DESC ';

  If FazQuery( QryAux, sSQL ) Then
  Begin

    If (pcValorIntegralOuReal = 'I') Then
      Result := Abs(qryAux.FieldByName('VALORINTEGRAL').AsFloat)
    Else If (pcValorIntegralOuReal = 'C') Then
      Result := Abs(qryAux.FieldByName('VALORCALCULADO').AsFloat)
    Else
      Result := Abs(qryAux.FieldByName('VALORPREV').AsFloat);

  End;

  QryAux.Close;

end; { CalcBeneficioNoMes }

{ Indica se a pessoa possui migração de plano }
Function PossuiMigracao(piIdPessoa, piIdPlanoPrev : Integer;
                        psDataRef : String = ''): Boolean;
Var
  sSQL : String;
Begin
  Result := False;

  sSQL := 'SELECT IDPLANOPREV FROM PARTPREVPLAN WHERE IDPESSOA = '+IntToStr(piIdPessoa)+' AND '+
          'IDPLANOPREV <> '+IntToStr(piIdPlanoPrev);
  If FazQuery(DtmAPrev.QryAux,sSQL) Then Begin
    Result := True;
  End;

End;

Function JaPossuiBeneficio(piIdPessJur, piIdTitular, piIdPessoa, piIdPlanoPrev,
                           piIdbeneficio, piSeqProposta : Integer;
                           pbFiltraVitalicios : Boolean = False;
                           pIdEventoGerador : String = '') : Boolean;
Var
  sSQL : String;
Begin

  Result := False;

  sSQL := 'SELECT BF.NUMEROPROCESSO, B.FLGBENEFTEMP   '+
          'FROM BENEFBFCIARIO BF, BENEFICIO B         '+
          'WHERE BF.IDPESSJUR     = '+ IntToStr(piIdPessJur) +
          '  AND BF.IDTITULAR     = '+ IntToStr(piIdTitular) +
          '  AND BF.IDPESSOA      = '+ IntToStr(piIdPessoa)  +
          '  AND BF.IDPLANOORIGEM = '+ IntToStr(piIdPlanoPrev);

  If piIdBeneficio > 0 Then Begin
    sSQL := sSQL + '  AND BF.IDBENEFICIO   = '+ IntToStr(piIdBeneficio);
  End;

  { Filtra os beneficios temporários }
  If pbFiltraVitalicios = True Then Begin
    sSQL := sSQL + '  AND B.FLGBENEFTEMP = 0 ';
  End;
 //Inicio - Tadeu SOL 181948 - KINTANA 1724239
  if (pIdEventoGerador <> '') and (pIdEventoGerador = '130')then begin
      sSQL := sSQL + '    AND BF.IDSITBENEFICIO <> 3 '+
                     '    AND BF.FONTEPAGADORA = 2   ' ;  // SOL 205075 - KTN 1983581
  end;
  //Fim - Tadeu SOL 181948 - KINTANA 1724239
  sSQL := sSQL + '  AND BF.SEQPROPOSTA =   '+ IntToStr(piSeqProposta)+
                 '  AND BF.IDBENEFICIO = B.IDBENEFICIO ';

  If FazQuery(DtmAPrev.QryAux, sSQL) Then begin
    Result := True;
  End;

End;

end.

