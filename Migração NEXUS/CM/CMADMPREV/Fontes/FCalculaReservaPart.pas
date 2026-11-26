// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
// Nº SIG.....: SIG TIBERO
// Data.......: 02/03/2018
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 12/04/2010
// Pendência   : SOL 127152 Kintana 671178
// Descricao   : Inclusão do PLNCODIGO no Log.
//------------------------------------------------------------------------------
//Pendência   : SOL 133772 KINTANA 788150
//Responsável : BRUNO AZEVEDO
//Data        : 29/04/2010
//Descrição   : Somente alimentar as reservas com FLGCALCRESERVA = 0.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 13/01/2010
// Pendência   : 708369 - 129365
// Rotina      : bbtnEnviarClick
// Descricao   : Travamento na Alimentação de Reservas.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 16/08/2007
// Pendência   : 19962
// Rotina      : Varias
// Descricao   : Troca do DateToStr para FormatDateTime.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 19/07/2007
// Pendência   : 25879
// Rotina      : Diversos
// Descricao   : Modificação da leitura do campo FLGRESERVAULTCOT como INTEGER
//               e não como STRING.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 24/04/2007
// Pendência   : 25159
// Rotina      : CalcVlReservaPorRegra
// Descricao   : Passar para a regra de calculo da Reserva um identificador da
//               contribuição.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 16/03/2007
// Pendência   : 24760
// Rotina      : CalcVlReservaPorRegra, GeraHistorico
// Descricao   : Passar para a regra de calculo da Reserva um identificador de primeiro
//               registro por pessoa
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 16/11/2006
// Pendência   : 23563
// Rotina      : *** qryUpd
// Descricao   : Inserção do campo IDPARTICIPANTE na query.
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 23/10/2006
// Pendência   : 23563
// Rotina      : CalculaColetiva
// Descricao   : Gravação do campo IDPARTICIPANTE na ReservaPart
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 20/02/2006
// Pendência   : 21600
// Rotina      : Varias
// Descricao   : Retirada do comando RULE das querys
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 13/02/2006  - 14/02/2006
// Rotina      : bbtnEnviarClick / bbtnDesfazerClick
// Pendencia   : 21531
// Alteração   : Modificações no processo para levar em consideração reservas coletivas
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 29/12/2005
// Rotina      : bbtnEnviarClick e VerificaDadosIntegracao
// Pendencia   : 19539
// Alteração   : Criação áquina e testar... esta POKda rotina de verificação de dados da Integração Contábil.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 06/09/2005
// Rotina      : ContabilizaAlimentacaoReserva
// Pendencia   : 20148
// Alteração   : mudança do somatório de valores pelo campo VLRCOTAS. Estava somando o VLRREAL que, por razões de arredondamento
//               fica com uma diferença no somatíório, comparando com o total de cotas.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 12/08/2005
// Rotina      : ContabilizaAlimentacaoReserva
// Pendencia   : 19966
// Alteração   : exclusão da cláucsula   AND    TO_CHAR(DATAMOV,''DD/MM/YYYY'')  = TO_CHAR(SYSDATE,''DD/MM/YYYY'') das
//               queries de filtro, possibilitando a integração tardia
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 14/06/2005
// Rotina      : dfm e bbtnEnviarClick
// Pendencia   : 19475
// Alteração   : separação da integração contábil e processo normal via seleção grpIntegraContab
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 13/06/2005
// Rotina      : ExecutaQuery
// Pendencia   : correção do acerto feito em 31052005 patra a pendência 19381
// Alteração   :
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 01/06/2005
// Rotina      : ContabilizaAlimentacaoReserva
// Pendencia   : 19382
// Alteração   : modificação da query principal da função por motivos de performance.
//               inclusão da cláusula  AND    TO_CHAR(HST.DATAALIMENTACAO, ''YYYY/MM'')  =  '''+sAnoMesCobrancaTela+'''
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 31/05/2005
// Rotina      : ExecutaQuery
// Pendencia   : 19381
// Alteração   : inclusão da soma de valores rateados para conribuições, processadas anteriormente, com
//               a mesma regra de rateio.
//               Acontece o caso de participantes PADV, contribuição 23, que
//               devem ser rateados junto com participantes ativos, contribuição 21, então,
//               caso a regra de rateio/idmotivo/mesreferencia já tenha sido processada, começar o acumulador deste valor.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 25/05/2005
// Rotina      : PreparaQryColetiva
// Pendencia   : 19323
// Alteração   : a montagem da consulta de contribuições para alimentação de reservas coletivas
//               não estava obedecendo a marcação de forma de cobrança, processando sempre todas 
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 24/05/2005
// Rotina      : GravaColetiva
// Pendencia   : 19311
// Alteração   : a função estava sempre somando o valor da movimentação com o saldo anterios, mesmo
//               nos casos de devolução
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 24/05/2005
// Rotina      : PreparaQryColetiva
// Pendencia   : 19311
// Alteração   : a montagem da consulta de contribuições para alimentação de reservas coletivas
//               estava sempre considerando todos os meses anteriores em aberto, não respeitando
//               a opção de tela ChBxProcessaAnteriores
//------------------------------------------------------------------------------
// Rotina      : TrazDadosParcela
// Autor(a)    : Leo
// Data        : 12/05/2005
// Descricao   : passagem do último parâmetro, salário atual
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 28/04/2005
// Rotina      : bbtnDesfazerClick
// Pendencia   : 18928
// Alteração   : A alimentação de reserva lê a HSTCONTRIBPREV utilizando a data
//               informada na tela para filtrar MESCOBRANCA. Já o desfazer usava
//               a mesma data informada para filtar o MESREFERENCIA mas na
//               HISTMOVRESERVA. A alteração filtra todas as contribuições
//               alimentadas pelo MESCOBRANCA (idêntico à alimentação) e iguala
//               o MESREFERÊNCIA da HSTCONTRIBPREV com a HISTMOVRESERVA.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 26/04/2005
// Pendência   : 19125
// Rotina      : CalculaColetiva / GravaColetiva
// Alteração   : tratar o flgdevolucao da Hstcontribprev abatendo do valor a ser
//               passado para o cálculo da reserva coletiva. 
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 25/04/2005
// Pendência   : 19114
// Rotina      : ExecutaQuery
// Alteração   : passei o IDMOTIVO para a regra de cálculo do valor para reserva (rateio)
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 20/04/2005
// Rotina      : CalculaColetiva
// Alteração   : retorna true caso seja apenas um erro de falta de cotação
//               caso retorne false, a contabilização não é gravada e todas as movimentações anteriores
//               de reservas são
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 20/04/2005
// Rotina      : ExecutaQuery
// Alteração   : testar flgcoletiva para passar FLGCALCRESERVA
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 20/04/2005
// Rotina      : ExecutaQuery
// Alteração   : passar o parâmetro de contribuição caso seja reserva coletiva
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 18/04/2005 - 19/04/2005
// Rotina      : ContabilizaAlimentacaoReserva
// Alteração   : verifica se a planilha ja foi criada, caso sim, usar seu código
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 18/04/2005 - 19/04/2005
// Rotina      : bbtnDesfazerClick
// Alteração   : modifiquei o processo para levar em consideração reservas coletivas
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 18/04/2005
// Rotina      : GravaReserva
// Alteração   : passei o idpessoa do participante como o HISTMOVRESERVA.IDPARTICIPANTE
//               para mesmo na alimentação de reservas coletivas, termos o registro de qual foi o participante
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 13/04/2005
// Rotina      : PreparaQryColetiva
// Alteração   : modifiquei o cálculo das reservas coletivas para que possibilitasse o cálculo
//               individual
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 13/04/2005
// Rotina      : PreparaQryColetiva
// Alteração   : acrescentei os campos '''' AS DTINICIOINSC, 0 AS SALPARTICIPACAO que são passados para regra de cálculo
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 06/04/2005
// Rotina      : ExecutaQuery
// Pendencia   : 18967
// Alteração   : Replicando a alteração anterior para considerar a FBRTPREV
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 01/02/2005
// Rotina      : PreparaQryColetiva
// Alteração   : correção da modificação feita no dia 01/02. o campo foi acrescentado sem uma vírgula após.....
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 01/03/2005
// Rotina      : ExecutaQuery
// Pendencia   : 18742
// Alteração   : Alterando os parâmetros da consulta principal apenas para Funcef
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 01/02/2005
// Rotina      : PreparaQry
// Pendencia   : 18596
// Alteração   : Colocada condição para leitura apenas de datas, excluindo-se as
//               horas que porventura venham a existir neste campo.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 24.01.2005
// Rotina      : bbtnEnviarClick
// Alteração   : acerto no rateio de reservas para só verificar quando houver regra de rateio
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 13.01.2005
// Rotina      : várias
// Alteração   : acerto na modificação que fiz em 21.12.2004
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 04/01/2005
// Rotina      : bbtnDesfazerClick
// Pendencia   : 18360
// Alteração   : Quando o componente grpDataAlimentacao estiver visivel a query
//               principal da rotina trabalha com o campo para utilizar como filtro,
//               quando não estiver trabalha com o campo DATAMOV.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 21.12.2004
// Rotina      : várias
// Alteração   : modificação para fazer o rateio de mais de uma contribuição ao mesmo tempo.
//               verifiac regra de rateio. se for a mesma, faz ao mesmo tempo.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 08.12.2004
// Rotina      : ExecutaQuery
// Alteração   : acrescentei o idcontribuicao na query para a regra de rateio
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.10.2004
// Rotina      : DESFAZER
// Pendencia   : 17760
// Alteração   : Acerto na query do DESFAZER
//------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Data        : 08.10.2004
// Pendência   : 17551
// Descricao   : Substituicao das units do back pelas de 3 camadas :
//                        U D o c u m e n t o    -> U C t r l D o c u m e n t o
//                        U L a n c C o n t a b  -> U C t r l L a n c a m e nt o
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 05.10.2004
// Rotina      : geral
// Alteração   : por definição contrária à anterior, do cliente funcef, desfiz as modificaçõpes
//               feitas no dia 07/07/2004
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.09.2004
// Rotina      : DESFAZER
// Pendencia   : 17752
// Alteração   : Acerto na query do DESFAZER
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 15.09.2004
// Rotina      : ----
// Pendencia   : 17685
// Alteração   : Opção de não pedir a data de alimentacao e usar como esta
//               a data de recebimento de contribuicoes
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 20.07.2004
// Rotina      : bbtnDesfazerClick
// Alteração   : acerto na colsulta principal do desfazimento
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 07.07.2004
// Alteração   : alteração geral para tratar paricipantes cedidos de um apatrocinadora x e
//               que devem ser alimentados em uma patrocinadora y
//------------------------------------------------------------------------------
// Rotina      : CalcVlReservaPorRegra
// Autor(a)    : Augusto
// Data        : 23/06/2004
// Alteração   : Inclusao do campo DATAPREVISAORECE na qry de entrada
// Data        : 30/06/2004
// Alteração   : Campo DATAPREVISAORECE, VALOROP1,2,3 na qry de entrada do calculo Coletivo.
// Data        : 01/07/2004 - 02/07/2004
// Alteração   : Alterações Leonardo.
//------------------------------------------------------------------------------
// Autor(a)    : Ricardo Vigorito
// Data        : 23.03.2004
// Pendencia   : 16288
// Alteração   : Foi incluido na qry QRYRESEVA os campos:
//              VALOROP1,VALOROP2 e VALOROP3.
//------------------------------------------------------------------------------
// Rotina      : TrazDadosParcela
// Autor(a)    : Camille
// Data        : 04.02.2004
// Pendencia   : ----
// Alteração   : Passagem dos 2 novos parametros sVlrPrestacao e sVlrSdoDevedor
//------------------------------------------------------------------------------
// Rotina      : MontaQueryReservaPlano
// Autor(a)    : Leo
// Data        : 15/12/2003
// Alteração   : acrescerntei os campos MESREFERENCIA  e IDMOTIVO, pois os cálculos do plano REB98
//               na Funcef deve ser feito separadamente desta forma, e a modificação afetará os demais clientes
//------------------------------------------------------------------------------
// Rotina      : ExecutaQuery
// Autor(a)    : Leo
// Data        : 14/12/2003
// Alteração   : alterei a chamada da busca do campo IDREGRAVLRRESERVA por razões de performance
//------------------------------------------------------------------------------
// Rotina      : ExecutaQuery
// Autor(a)    : Leo
// Data        : 14/12/2003
// Alteração   : acrescentei o campo FLGDEVOLUCAO na query para a regra de cálculo
//------------------------------------------------------------------------------
// Rotina      : CalculaColetiva
// Autor(a)    : Leo
// Data        : 08/12/2003
// Alteração   : comentei a chamada do cálculo das coletivas pois está com erros (PROVISÓRIO FUNCEF)
//------------------------------------------------------------------------------
// Rotina      : ExecutaQuery
// Autor(a)    : Leo
// Data        : 08/12/2003
// Alteração   : voltei crítica de reservas de controle serem processadas
//               com o flgcalcreservas com qq valor. Para isso, mudei a ordenação da
//               qryreservaxplano.
//------------------------------------------------------------------------------
// Rotina      : MontaQueryReservaPlano
// Autor(a)    : Leo
// Data        : 08/12/2003
// Alteração   : ordenei tb por flgcoletiva, para
//que as coletivas sejam feitas posteriormente, lendo o flgcalcreserva já atualizado
//------------------------------------------------------------------------------
// Rotina      : ExecutaQuery
// Autor(a)    : Camille
// Data        : 24/11/2003
// Alteração   : Alteração para tratamento de reserva coletiva. A rotina estava
//               só tratava a query de reserva individual, dando erro na hora de
//               alimentar reservas coletivas.
//------------------------------------------------------------------------------
// Rotina      : ValStr
// Autor(a)    : Leo
// Data        : 01/10/2003
// Alteração   : alterei os parämetros das chamadas de funçôes ValStr para 22,9
//------------------------------------------------------------------------------
// Rotina      : CalcVlReservaPorRegra
// Autor(a)    : Leo
// Data        : 25/09/2003
// Alteração   : coloquei os campos valorop1, 2 e 3
//------------------------------------------------------------------------------
// Rotina      : PreparaQry
// Autor(a)    : Leo
// Data        : 25/09/2003
// Alteração   : coloquei o valorbase1 , 2 e 3 caso o da HSTCONTRIBPREV esteja nulo
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 25/09/2003
// Alteração   : ajuste no incremento do pBar, logo após cada qryreservaxplano.next
//------------------------------------------------------------------------------
// Rotina      : MontaQueryReservaPlano
// Autor(a)    : Leo
// Data        : 24/09/2003
// Alteração   : refiz a query por questõs de performance
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 17/09/2003
// Alteração   : MontaSelect de participante agora pega os desativados (FLGDESATIVADO = 1 ou 0)
//               para que se possa mexer na reserva dos cancelados (FUNCEF-Dennys)
//------------------------------------------------------------------------------
// Rotina      : MontaQueryReservaPlano
// Autor(a)    : Leo
// Data        : 16/09/2003
// Alteração   : coloquei o RULE na query
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 19/08/2003
// Alteração   : exclusão de comando (Exit) em GeraHistorico, que estava abortando
//               o processamento no caso de um erro único
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 17/08/2003
// Alteração   : mudanças no processo de rateio
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 20/08/2003
// Pendencia   : 14486
// Alteração   : Acerto no controle de mensagens de critica de datas
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 31/07/2003
// Pendencia   : 14759
// Alteração   : Acerto na atualização das reservas processadas (usar MESCOBRANCA)
//------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 28/07/2003
// Alteração   : Acertando a qry que será utilizada na regra de valor máximo para
//               rateio, no caso de reserva coletiva.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 18.07.2003
// Pendencia   : 14615
// Alteração   : O sistema está considerando se a reserva está ativa ou não para
//               alimentar. Mas não deveria fazer isto pois se o participante
//               pagou a contribuicao, esteja a reserva ativa ou nao, a contribuicao
//               tem que alimentar a reserva.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 23.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      : bbtnEnviarClick / AtualizaReservasIndexadas / MontaQueryReservaPlano
// Autor(a)    : Augusto
// Data        : 05/06/2003
// Alteração   : Novo Tratamento no caso de não encontrar indice no mes do processo
// -----------------------------------------------------------------------------
// Rotina      : bbtnDesfazerClick
// Autor(a)    : Camille
// Data        : 21/05/2003
// Alteração   : Acertos no desfazer pois está apresentando problemas na REFER
// -----------------------------------------------------------------------------
// Rotina      : ContabilizaAlimentacaoReserva]
// Autor(a)    : Carlos Guedes
// Data        : 24/04/2003
// Alteração   : Implmentando Partida Dobrada. Pend.: 13328
// -----------------------------------------------------------------------------
// Rotina      : ContabilizaAlimentacaoReserva
// Autor(a)    : Augusto
// Data        : 14/04/2003
// Alteração   : Na Contabilização das reservas, estava buscando os dados pelo MESREFERENCIA
// -----------------------------------------------------------------------------
// Rotina      : bbtnDesfazerClick
// Autor(a)    : Gleyber
// Data        : 10/04/2003
// Alteração   : Refazendo o desfazer segundo orientações CBS (Antídia)
// -----------------------------------------------------------------------------
// Rotina      : CalcVlReservaPorRegra
// Autor(a)    : Camille
// Data        : 27/02/2003
// Alteração   : Tratar alimentacao por indice
// -----------------------------------------------------------------------------
// Rotina      : CalcVlReservaPorRegra
// Autor(a)    : Augusto
// Data        : 17/02/2003
// Alteração   : Retorno do campo VALORINDICE a query de entrada da Regra
// -----------------------------------------------------------------------------
// Rotina      : Alimentação de Reserva (Processar)
// Autor(a)    : Augusto
// Data        : 06/02/2003
// Alteração   : sai da Rotina caso não tenha Data no Calendario e não use data atual
// -----------------------------------------------------------------------------
// Rotina      : Alimentação de Reserva (Processar)
// Autor(a)    : Augusto
// Data        : 30/01/2003
// Alteração   : Opção para processar meses anteriores em aberto.
// -----------------------------------------------------------------------------
// Rotina      : Desfazer Alimentação
// Autor(a)    : Augusto
// Data        : 14/01/2003
// Alteração   : Utilização de Variaveis na atualização dos dados de cada participante,
//               pois ao final do loop do participante/reserva os dados já estão posicionados
//               no próximo registro.
// -----------------------------------------------------------------------------
// Rotina      : qryReservaXPlano e PreparaQryColetiva
// Autor(a)    : Gleyber
// Data        : 20/12/2002
// Alteração   : Otimização das queries
// -----------------------------------------------------------------------------
// Rotina      : CalcVlReservaPorRegra
// Autor(a)    : Augusto
// Data        : 04/12/2002
// Alteração   : Inlcusão do campo MESREFERENCIA na Query da Regra
// -----------------------------------------------------------------------------
// Rotina      : Geral
// Autor(a)    : Gleyber
// Data        : 03/10/2002
// Alteração   : Acerto na data gerada pelo Mês normal de cobrança de décimo terceiro
//               (rdgrpopindice) - Pendência 9492
// -----------------------------------------------------------------------------
// Rotina      : geral
// Autor(a)    : Leo
// Data        : 03.09.2002
// Alteração   : tratamento do parâmetro que diz se a alimentação do 13 é
//               pelo mês de cobrança ou pelo mês de referência (rdgrpopindice)
// -----------------------------------------------------------------------------
// Rotina      : GravaReserva
// Autor(a)    : Leo
// Data        : 03.09.2002
// Alteração   : alterei montagem da data do índice em caso de mês 13
// -----------------------------------------------------------------------------
// Rotina      : bbtnEnviarClick
// Autor(a)    : Leo
// Data        : 26.08.2002
// Alteração   : filtro para só atualizar registros da hstcontribprev,
//               em contribuições efetivamente alimentadas
// -----------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 26.08.2002
// Alteração   : acrescentei botão para desfazer selecção de participante
// -----------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 26.08.2002
// Alteração   : alteração no desfazer, possibilitando pegar a seleção de participante
// -----------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 16.04.2002
// Alteração   : Alterações para permitir que a alimentação de reserva seja
//               feita para uma única pessoa (participante)
// -----------------------------------------------------------------------------
unit FCalculaReservaPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar,  MAHlpBtn,
  Buttons, TB97, ComCtrls, checklst, Db, DBTables, Wwquery, URegra, Gauges,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, StdCtrls, Spin, ExtCtrls,
  MontaSelect, wwdbdatetimepicker, CMDateTimePicker, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, Menus, UCtrlLancamento;


type
  TfrmCalculaReservaPart = class(TfrmOkCancelar)
    Panel2: TPanel;
    StaticText1: TStaticText;
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    bbtnEnviar: TBitBtn;
    pnlControle: TPanel;
    pnlOpcoes: TPanel;
    StaticText2: TStaticText;
    chkResult: TCheckBox;
    bbtnVerResultado: TBitBtn;
    pnlResult: TPanel;
    bbtnVoltar: TBitBtn;
    bbtnSalvar: TBitBtn;
    SaveDlg: TSaveDialog;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    qryReservaXPlano: TwwQuery;
    qryGrava: TwwQuery;
    qryAux: TwwQuery;
    qryUpdReservaPart: TwwQuery;
    pnlProgresso: TPanel;
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    btncancelaprogress: TBitBtn;
    qryUpd: TwwQuery;
    updRes: TUpdateSQL;
    qrySituacao: TwwQuery;
    qrydata: TwwQuery;
    bbtnDesfazer: TBitBtn;
    memResult: TMemo;
    StaticText3: TStaticText;
    lblSubTitulo2: TLabel;
    rgrpTipoCobranca: TRadioGroup;
    pgctrlReserva: TPageControl;
    tbsPrincipal: TTabSheet;
    lbPatro: TLabel;
    Label7: TLabel;
    chklstPatro: TCheckListBox;
    chklstPlano: TCheckListBox;
    tbshtpart: TTabSheet;
    MontaSelectPart: TMontaSelect;
    qryReservasACalcular: TwwQuery;
    qryReserva: TwwQuery;
    tbshtdecterc: TTabSheet;
    rdgrpopindice: TRadioGroup;
    ChBxProcessaAnteriores: TCheckBox;
    qryPlanilhasExcluir: TwwQuery;
    updPlanilhasExcluir: TUpdateSQL;
    grpDataAlimentacao: TGroupBox;
    dtAlimentacao: TCMDateTimePicker;
    qryParamContabil: TwwQuery;
    pBarDocs: TProgressBar;
    GroupBox2: TGroupBox;
    lblParticip: TLabel;
    edNome: TEdit;
    Label3: TLabel;
    edPlano: TEdit;
    lblPatro: TLabel;
    edPatro: TEdit;
    lblMatricula: TLabel;
    edMatricula: TEdit;
    bbtnProcurar: TBitBtn;
    btndesfazselec: TBitBtn;
    GroupBox3: TGroupBox;
    updContribuicao: TUpdateSQL;
    qryContribuicao: TwwQuery;
    dbgrdContribuicao: TwwDBGrid;
    dsContribuicao: TwwDataSource;
    pmnu: TPopupMenu;
    DesmarcarTodas1: TMenuItem;
    MarcarTodas1: TMenuItem;
    qryDatasIndice: TwwQuery;
    updDatasIndice: TUpdateSQL;
    grpIntegraContab: TGroupBox;
    lblIntegraContab: TLabel;
    chkIntegra: TCheckBox;
    chkIntegraLocal: TCheckBox;
    qryReservaAlimenta: TwwQuery;
    pBarGeral: TGauge;
    pBarAlimenta: TProgressBar;
    pBarWhile1: TProgressBar;
    procedure chklstPatroClick(Sender: TObject);
    procedure bbtnEnviarClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btncancelaprogressClick(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure btndesfazselecClick(Sender: TObject);
    procedure DesmarcarTodas1Click(Sender: TObject);
    procedure MarcarTodas1Click(Sender: TObject);
    procedure chklstPlanoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkIntegraLocalClick(Sender: TObject);

  private
    { Private declarations }
    CtrlLancamento : TCtrlLancamento;
    bcancelaenvio : Boolean;
    bMostraMensagem : boolean;

    gUsaCRespon,
    gCodCentroRespon,
    gUsaAbc:string;
    gUnidNegoc,
    gMoedaCorrente:Integer;

    bFlgIntContab,
    bErro , bGravou: boolean;

    strPatro, strPlano : string;
    sAnoMesCobrancaTela : string;

    sIdEmpresa, sUnidNegoc, sCodCentroRespon,
    sIdEmpresaProp, sCodSubConta, sCodCentroCustoD,
    sCodCentroCustoC, sPlano ,   splacontad ,
    splacontac : string;

    dUltIndice1:double;
    sUltDataCodigoMoeda1:string;   // Normalmente será a data do recebimento que varia muito
    dUltIndice2:double;
    sUltDataCodigoMoeda2:string;   // Normalmente será a data do reajuste que não varia

    iIdHistorico : longint; 

    dTotValorParaReserva             : Double; 
    sDescSituacao                     : string; 
    bExibeLogMatricula                : boolean;
    bUtilizaDataDeAtivo               : boolean;

    strContribuicao                   : string; 
    data_cota                         : string; 
    data_cota_correcao                : string; 
    iContadorCommit                   : Integer; 

    bIntegraContab : boolean;

    procedure PreparaQry( psAnoMesReferencia, psAnoMesCobranca : string;
                          pbProcessaAnteriores : Boolean ); 
    procedure PreparaQryColetiva( psAnoMesReferencia, psAnoMesCobranca : string );

    function  ExecutaQuery( aQuery : TwwQuery ;
                            iIdReserva,
                            iIdPlanoPrev,
                            iIdContribuicao, 
                            iFlgControle, iIdMotivo  : integer;
                            sMesReferencia : String):boolean; 

    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
    function  OpcoesOK : boolean;
    function  GeraHistorico (sNomeReserva,sNomePlano : string) : boolean;

    function  CalculaColetiva(sNomeReserva, sNomePlano: string):boolean;
    function  GravaColetiva(sOp : string; sValReserva: string) : boolean;


    function  CalcVlReserva(aQuery:twwQuery):string;
    function  CalcVlReservaPorRegra(aQuery:twwQuery;sIdRegra:string;var sValorReserva:string;
                                                      psPrimeiroRegistro:String):boolean;
    function  ValorEmReal(dValor:double;iMoeda:Integer;sDataRef:string):double;
    function  AchaAlteradorAtraso(qryaux,qrydados : twwquery ; var sValorAlt : String) : Boolean;
    function  GravaReserva(qryReservasACalcular : twwquery ; sValor : string) : boolean;


    //rotinas de contabilização
    function  ContabilizaAlimentacaoReserva( qryAux        : TwwQuery;
                                             piIdPessJur,
                                             piIdPlanoPrev : longint;
                                             sNomePatro, sNomePlano : String ) : boolean;

    function  EstornaContab( qryAux : TwwQuery;
                           psAnoMesReferencia, sPlnCodigo, sDataLancto : string;
                           var sMsgErro : string) : boolean;
    //fim - rotinas de contabilização

    
    Function MontaQueryReservaPlano( piIdPessJur, piIdPlanoPrev : Integer;
                                     psMesCobranca : String;
                                     pbProcessaAnteriores : Boolean): String;

    function AtualizaReservasIndexadas : boolean;

    function CriticaDataCobrancaSitParaAlimentacao( qry              : TwwQuery;
                                                    sIdPessJur       : string;
                                                    sIdPlanoPrev     : string;
                                                    sSitFundacao     : string;
                                                    sTipoData        : char;
                                                    sMesReferencia   : string;
                                                    sAnoReferencia   : string) : string;

    
    function VerificaDadosIntegracao(qryAux: twwquery;
                                     sAnoMesCobrancaTela: String;
                                     iIdPessjur: Integer): Boolean;
    

  public
      bCalculouAlguem : boolean;
     { Public declarations }
     ordem, idlote: integer;
     sIdMotivoNormal : String;
     function PegaIndice(qryaux:TwwQuery;pCodMoeda : integer; pDataRef : string; var pIndice : double) : boolean;
     function ValorEmCotas(qryaux:TwwQuery;dValor:double;iMoeda:Integer;sDataRef:string):extended;

  end;

var
  frmCalculaReservaPart: TfrmCalculaReservaPart;

const
  NumMaxRegSemCommit = 500;

implementation

uses UDataBase, UMensErro, UAdmPrev, DBaseDados, UMovReserva,  USistema,
     UFuncoesUteis, UIntegraBack, fAguarde, DAPrev,
  FParcelamento, uSincronismo;

{$R *.DFM}

//  ************************* RESPOSTA A EVENTOS GERAIS ********************


procedure TfrmCalculaReservaPart.FormCreate(Sender: TObject);
begin
  inherited;
  //Henrique Massão
  saveDlg.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  qryUpdReservaPart.Prepare;

  qryreservaxplano.Prepare;
  qrysituacao.Prepare;
  qryaux.close;
  qryaux.sql.clear;
  qryaux.sql.add(' SELECT USACRESPON, CODCENTRORESPON,USAABC , UNIDNEGOC, MOEDACORRENTE FROM PARAMGLOBAL '+
                 ' WHERE IDPESSOA = '+inttostr(Sistema.IdEmpresa)+'  ');
  qryaux.open;
  if qryaux.IsEmpty then
  begin
    qryaux.Close;
    Exit;
  end;
  gUsaCRespon     := qryAux.FieldByName('UsaCRespon').AsString;
  gCodCentroRespon:= qryAux.FieldByName('CodCentroRespon').AsString;
  gUsaAbc         := qryAux.FieldByName('UsaAbc').AsString;
  gUnidNegoc      := qryAux.FieldByName('UnidNegoc').AsInteger;
  gMoedaCorrente  := qryAux.FieldByName('MoedaCorrente').AsInteger;

   
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


procedure TfrmCalculaReservaPart.FormDestroy(Sender: TObject);
begin

  qryUpdReservaPart.Close;
  qryUpdReservaPart.UnPrepare;

  inherited;
end;

procedure TfrmCalculaReservaPart.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
  bPedeData : boolean;
begin
  inherited;
  pgctrlReserva.ActivePage := tbsPrincipal;

  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12)
  then begin
     cmbMesRef.ItemIndex := AMonth - 1;
     cmbMesRef.Text := cmbMesRef.Items[cmbMesRef.ItemIndex];
     spedAnoRef.Text := IntToStr(AYear);
  end;

  bFlgIntContab := (IntegraBack.Contabilidade = 'S');


  bIntegraContab := prmIntegraContab;

  if bIntegraContab
  then lblIntegraContab.Caption := 'Integrar com Contabilidade ? Sim '
  else lblIntegraContab.Caption := 'Integrar com Contabilidade ? Não ';


  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
  // Preencher chkList da Patrocinadora
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPatro.Open;
  CriaLista(chkLstPatro, qryPatro);

  // Preenche ChkList dos Planos
  qryPlano.Close;
  qryPlano.Sql.Clear;
  qryPlano.Sql.Add(' SELECT * FROM PLANPREV '+
                   ' WHERE IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO PLP, PATRO P '+
                   '                       WHERE   P.IDFUNDACAO = '+IntToStr(iIdFundacao)          +
                   '                       AND     PLP.IDPESSJUR = P.IDPESSOA )                   '+
                   ' ORDER  BY NOME                                                               ');
  qryPlano.Open;
  CriaLista(chklstPlano, qryPlano);


  
  bPedeData := False;
  qryPlano.First;
  while not qryPlano.Eof do
  begin
     if qryPlano.FieldByName('FLGDTALIMRESERVA').AsInteger = 0
     then bPedeData := True;
     qryPlano.Next;
  end;

  if bPedeData
  then grpDataAlimentacao.Visible := True
  else grpDataAlimentacao.Visible := False;

  qryContribuicao.Close;
  qryContribuicao.Open;
  
  // Configurar painéis
  pnlResult.SendToBack;
  pnlOpcoes.BringToFront;

  
  bbtnVerResultado.visible := False;
  chkResult.Checked := True;

  bbtnConfirmar.Visible := False;
  bbtnCancelar.Visible  := False;

  
  lblTitulo.Caption     := '';
  lblSubTitulo.Caption  := '';
  lblSubTitulo2.Caption := '';

end;

procedure TfrmCalculaReservaPart.bbtnVoltarClick(Sender: TObject);
begin
  inherited;
  pnlResult.SendToBack;
  pnlOpcoes.BringToFront;
  bbtnVerResultado.visible := True;
end;

procedure TfrmCalculaReservaPart.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then
     memResult.Lines.SaveToFile(savedlg.filename);
end;

procedure TfrmCalculaReservaPart.bbtnVerResultadoClick(Sender: TObject);
begin
  inherited;
  pnlResult.BringToFront;
  pnlOpcoes.SendToBack;
end;

procedure TfrmCalculaReservaPart.chklstPatroClick(Sender: TObject);
var
   i : integer;
   bPedeData : boolean; 
begin
 {Preenche ChkList dos Planos da Patrocinadora Selecionada}
  qryPlano.Close;
  qryPlano.SQL.Clear;
  strPatro := ' ';

  for i := 0 to chklstPatro.Items.Count - 1 do
     if chklstPatro.checked[i] then
       begin
           if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive, loPartialKey]) then
              strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
       end;

  if Trim(strPatro) <> '' then
     begin
          strPatro := Copy(strPatro, 1, Length(strPatro) - 2);
          qryPlano.SQL.Add(' SELECT DISTINCT PP.IDPLANOPREV,   PP.NOME ,PP.FLGDTALIMRESERVA '+ 
                           ' FROM   PLANPREV PP, PLANPREVPATRO PPP     '+
                           ' WHERE  PP.IDPLANOPREV = PPP.IDPLANOPREV   '+
                           ' AND    PPP.IDPESSJUR  IN ( '+strPatro+')  '+
                           ' ORDER BY PP.NOME ');
     end
  else
     begin
          qryPlano.SQL.Add(' SELECT NOME, IDPLANOPREV, FLGDTALIMRESERVA  FROM PLANPREV '); 
          qryPlano.SQL.Add(' ORDER BY NOME ');
     end;
  qryPlano.Open;
  CriaLista(chklstPlano,qryPlano);

  
  bPedeData := False;
  qryPlano.First;
  while not qryPlano.Eof do
  begin
     if qryPlano.FieldByName('FLGDTALIMRESERVA').AsInteger = 0
     then bPedeData := True;
     qryPlano.Next;
  end;

  if bPedeData
  then grpDataAlimentacao.Visible := True
  else grpDataAlimentacao.Visible := False;

end;


// *************         PROCESSAMENTOS AUXILIARES         *************


procedure TfrmCalculaReservaPart.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
begin
  chkListX.Items.Clear;
  with qryLista do
  begin
     while not eof do
     begin
        chkListX.Items.Add(FieldByName('Nome').AsString);
        Next;
     end;
  end;
end;

function TfrmCalculaReservaPart.OpcoesOK : boolean;
var
   i : integer;
begin
  Result := False;

 {Preencher string com Id's das patrocinadoras selecionadas}
  strPatro := '';
  for i := 0 to chklstPatro.Items.Count - 1 do
      if chklstPatro.checked[i] then
         begin
             if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive, loPartialKey]) then
                strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
         end;

  if Trim(strPatro) <> '' then
     strPatro := Copy(strPatro, 1, Length(strPatro) - 2);


 {Preencher string com Id's dos planos selecionados}
  strPlano := '';
  for i := 0 to chklstPlano.Items.Count - 1 do
      if chklstPlano.checked[i] then
         begin
             if qryPlano.Locate('Nome',chklstPlano.Items[i],[loCaseInsensitive, loPartialKey]) then
                strPlano := strPlano + qryPlano.FieldByName('IdPlanoPrev').AsString+ ', ';
         end;

  if Trim(strPlano) <> '' then
     strPlano := Copy(strPlano, 1, Length(strPlano) - 2);


  Result := True;
end; //opcoesOK



function TfrmCalculaReservaPart.PegaIndice(qryaux:TwwQuery;pCodMoeda : integer; pDataRef : string; var pIndice : double) : boolean;
var
  bOk : boolean;
  aData,stipoMoeda,scodMoeda:string;
begin

 bOk := True;
 scodMoeda:=inttostr(pcodMoeda);

 qryaux.Close;
 qryaux.sql.clear;
 qryaux.SQL.add('SELECT  MOEPERIODICIDADE '+
                ' FROM MOEDA '+
                ' WHERE MOECODIGO = '+ scodMoeda +' ');
 Try
   qryaux.Open;
 Except
   result := False;
   Exit;
 End;
 if qryaux.IsEmpty then begin
   result := False;
   Exit;
 end;

 sTipoMoeda := qryAux.FieldByName('MOEPERIODICIDADE').AsString;


 
 VerifIndiceHist(qryaux , scodMoeda,
                 qryReservaxPlano.FieldbyName('IdPlanoPrev').AsString,
                 qryReservaxPlano.FieldbyName('IdTipoReserva').AsString,pDataRef );


 qryaux.Close;
 qryaux.sql.clear;
 if sTipoMoeda = 'M'
 Then Begin

    qryaux.SQL.add('SELECT  COTVALOR '+
                   ' FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+scodMoeda+' '+
                   ' AND (COTMESREF = '''+copy(pDataRef,4,2)+copy(pdataRef,7,4)+ ''')');
  end
  else begin
    qryaux.SQL.add('SELECT  COTVALOR, COTDATA '+
                   ' FROM   COTACAOMOEDA      '+
                   ' WHERE  MOECODIGO = '+ sCodMoeda +' '+
                   ' AND    COTDATA   <= TO_DATE(''' + pDataRef +''',''DD/MM/YYYY'') '+
                   ' ORDER  BY COTDATA DESC ' );

  end;

  try
    qryaux.Open;
  except
   result := False;
   Exit;
  end;

  if qryaux.IsEmpty
  then
     bok:=False
  else begin
      if sTipoMoeda <> 'D' 
      then begin
         qryAux.First;
         pindice:=qryaux.fieldbyname('COTVALOR').asfloat;
         bok:=True;
      end
      else begin
         qryAux.First;
         if (qryaux.fieldbyname('COTDATA').AsString = pDataRef) OR
            (qryReservaxPlano.FieldByName('FLGTIPOBUSCACOTA').AsInteger <> 2) 
         then begin
            pindice:=qryaux.fieldbyname('COTVALOR').asfloat;
            bok:=True;
         end
      end;
  end;
  Result := bOk;
end;

function TfrmCalculaReservaPart.ValorEmCotas(qryaux:TwwQuery;dValor:double;iMoeda:Integer;sDataRef:string):extended;
var
  sDataCodigoMoeda:string;
  dIndice:Double;
begin
      if not PegaIndice(qryaux,iMoeda,sDataRef,dIndice) then
        dIndice:=0;
  if dIndice>0.0000001 then
    result := dValor/dIndice
  else
    result := 0;
end;


function TfrmCalculaReservaPart.ValorEmReal(dValor:double;iMoeda:Integer;sDataRef:string):double;
var
  sDataCodigoMoeda:string;
  dIndice:Double;
begin
  sDataCodigoMoeda:=sDataRef+IntCod(iMoeda,3);
  if sUltDataCodigoMoeda2=sDataCodigoMoeda then
    dIndice:=dUltIndice2
  else
    begin
      if not PegaIndice(qryaux,iMoeda,sDataRef,dIndice) then
        dIndice:=0;
      sUltDataCodigoMoeda2:=sDataCodigoMoeda;       // para evitar acesso desnecessário se já tiver a cotacao do mes.
      dUltIndice2:=dIndice;
    end;
  if dIndice>0.0000001 then
    result := dValor*dIndice
  else
    result := 0;
end;



//  **************************************************************************
//                         PROCESSAMENTO INTERNO
//  **************************************************************************
function TfrmCalculaReservaPart.CalcVlReserva(aQuery:twwQuery):string;
var
  DataRecebimento,sValorAlt:String;
  IndiceReajuste:Integer;
  PercProd,
  HstValorRec,
  dValor,aux_indice:double;
  cAux : char;
    varFields    : Variant; 
begin
   varFields := VarArrayCreate([0,1],varVariant); 
   
// 20 Atribuir à  op o valor de (PERCPROD / 100)
// 30 Atribuir à  Resultado o valor de (HSTVALORREC * OP)
// 40 Atribuir à  valref o valor de (Cotação IGPM + 6%)
// 45 Se valref = 0 então execute o passo 47 senão,execute o passo 50
// 47 Atribuir à  Resultado o valor de 0
// 48 Parar execução da regra
// 50 Atribuir à  Resultado o valor de (RESULTADO / VALREF)
// 55 Atribuir à  Resultado o valor de (ARREDONDA RESULTADO 6 Decimais)
// 60 Parar execução da regra
  cAux := decimalseparator;
  decimalseparator := '.';

  PercProd:=aQuery.FieldByName('PERCENTUAL').AsFloat/100;


  HstValorRec:=aQuery.FieldByName('VALORRECEBIDO').AsFloat;
 

  IndiceReajuste:=aQuery.FieldByName('INDICEREAJUSTE').AsInteger;
  DataRecebimento:=aQuery.FieldByName('DATARECEBIMENTO').AsString;

  if aQuery.FieldByName('FLGMODATUALIZACAO').AsInteger = 0
  then begin    // ANDRE GOMES : INDICA QUE A RESERVA É POR COTAS 28/02/2003
     //se as reservas dos meses anteriores ao mês de
     //referência passado na tela forem atualizados
     //pelo mesmo valor da cota então...
     //senão atualiza pela cota de cada mês de referência

     case aQuery.FieldByName('FLGRESERVAULTCOT').AsInteger of
        1 :  dValor := ValorEmCotas(qryaux,HstValorRec,IndiceReajuste,data_cota)*PercProd;
        0 :  dValor := ValorEmCotas(qryaux,HstValorRec,IndiceReajuste,data_cota)*PercProd;
        2 :  dValor := ValorEmCotas(qryaux,HstValorRec,IndiceReajuste,data_cota)*PercProd;
     end;
 end
  else begin        
   // PREENCHER O CAMPO DATA_COTA COM A DATA DO INDICE DE ATUALIZACAO
   varFields[0] := qryReservaxPlano.FieldbyName('IDPLANOPREV').AsInteger;
   varFields[1] := qryReservaxPlano.FieldbyName('IDTIPORESERVA').AsInteger;
   if qryDatasIndice.Active and (qryDatasIndice.Locate('IDPLANOPREV;IDTIPORESERVA',varFields,[loCaseInsensitive]))
   then data_cota := qryDatasIndice.FieldByName('DATAINDICECORRECAO').AsString;
   
   dValor := HstValorRec * PercProd;
  end;

  Result:=ValStr(dValor,22,9,False,'');

  decimalseparator := caux;
end;


function TfrmCalculaReservaPart.CalcVlReservaPorRegra(aQuery:twwQuery;sIdRegra:string;
                                                      var sValorReserva:string;
                                                      psPrimeiroRegistro:String):boolean;
var
  sSql,
  sValorRegra,
  sValorAlimenta,
  sValorAlt, sValIndice      : string;
  sIndiceReajuste            : string; 
  piIdCalculo    : integer;
  bErro          : boolean;
  cAux           : char;

  bContribParcelamento : Boolean;
  sIdParcelamento,sPercentual,sVlrDividaPart,sVlrDividaPatro : String;
  sVlrPrestacao, sVlrSdoDevedor : string; 

  sSalBaseAtual : String;

  iNumProxParc : Integer;
begin
  Result        := False;
  sValorReserva := '';
  sValorAlt     := '0';

  caux          := decimalseparator;
  decimalseparator := '.';


  
  bContribParcelamento := (qryreservaxplano.FieldByName('FLGPARCELAMENTO').AsInteger = 1);


  sIdParcelamento := '';
  sPercentual := '0';
  sVlrDividaPart := '0';
  sVlrDividaPatro := '0';

  //verifica se o participante te parcelamento ativo
  if bContribParcelamento then
  begin
     frmparcelamento.TrazDadosParcela(qryaux,aQuery.Fieldbyname('IDPESSJUR').AsString ,
                                      aQuery.Fieldbyname('IDPLANOPREV').AsString ,
                                      aQuery.Fieldbyname('IDPESSOA').AsString ,
                                      sIdParcelamento,sPercentual,sVlrDividaPart,
                                      sVlrDividaPatro,
                                      sVlrPrestacao,
                                      sVlrSdoDevedor,
                                      sSalBaseAtual,
                                      iNumProxParc);
  end;
  


  with aQuery do
  begin
    sValorAlimenta := OraNumero(Fieldbyname('VALORRECEBIDO').AsString);
    sValIndice     := FloatToStr( VoltaValorCotacaoComData( qryaux, 
                                                            Fieldbyname('INDICEREAJUSTE').AsString,
                                                            Fieldbyname('IDPLANOPREV').AsString,
                                                            Fieldbyname('IDTIPORESERVA').AsString,
                                                            data_cota));

        
    if sValIndice = '0' then
      sIndiceReajuste := ''''+''' INDICEREAJUSTE  '
    else
      sIndiceReajuste := Fieldbyname('INDICEREAJUSTE').AsString       +' INDICEREAJUSTE   ';  
    

    // 3ª regra - Acrescentar novos campos
    // totValorParaReserva => SOMAVALORPARARATEIO
    // ValorMaximoParaRateio => VALORMAXIMORATEIO
    // Valor individual na hstcontribprev => VALORPARARATEIO

    sSQL := ' SELECT '#39+ Fieldbyname('DATARECEBIMENTO').AsString+#39  +' DATAREF,         '+
                           OraNumero(sValorAlimenta)                    +' VALORRECEBIDO,   '+
                           Fieldbyname('IDPESSOA').AsString             +' IDPESSOA,   '+
                           Fieldbyname('IDPESSJUR').AsString            +' IDPESSJUR,   '+
                           Fieldbyname('IDPLANOPREV').AsString          +' IDPLANOPREV,   '+
                           QuotedStr(Fieldbyname('MESREFERENCIA').AsString)+' MESREFERENCIA,     '+ 
                           OraNumero(Fieldbyname('PERCENTUAL').AsString)+' PERCENTUAL,      '+
                           #39+data_cota+#39                            +' DATARECEBIMENTO, '+
                           sIndiceReajuste +   
                           ','+sValIndice+' AS VALORINDICE '+ 
                           ' , '''+sIdParcelamento+''' IDPARCELAMENTO, ' +
                           sPercentual+' PERCENTUALPARCELA , '+
                           sVlrDividaPart+' VLRDIVIDAPART,'+
                           sVlrDividaPatro+' VLRDIVIDAPATRO,  '+ 
                           OraNumero(FloatToStr(dTotValorParaReserva))   +' SOMAVALORPARARATEIO, '+
                           FieldByName('IDCONTRIBUICAO').AsString +' IDCONTRIBUICAO, '+  
                           OraNumero(FieldByName('VALORMAXIMORATEIO').AsString) +' VALORMAXIMORATEIO, '+
                           OraNumero(FieldByName('VALORPARARESERVA').AsString) +' VALORPARARATEIO '+
            ' , '''+sIdParcelamento+''' IDPARCELAMENTO, '+sPercentual+' PERCENTUALPARCELA  '+
            ' , '+sVlrDividaPart+' VLRDIVIDAPART,'+sVlrDividaPatro+' VLRDIVIDAPATRO '+ 
            ' , '+OraNumero(FieldByName('SALPARTICIPACAO').AsString) +' SALPARTICIPACAO  '+  
            ' , '+OraNumero(FieldByName('IDMOTIVO').AsString) +' IDMOTIVO,  '+  
            '   '+QuotedStr(FieldByName('DATAPREVISAORECE').AsString) +' DATAPREVISAORECE, '+  

            psPrimeiroRegistro + ' AS PRIMREGGRUPO, '+ 

            
            OraNumero(FieldByName('VALOROP1').AsString)        + ' AS VALOROP1, '+
            OraNumero(FieldByName('VALOROP2').AsString)        + ' AS VALOROP2, '+
            OraNumero(FieldByName('VALOROP3').AsString)        + ' AS VALOROP3  '+
            ' FROM DUAL ';

    sValorRegra := RegraNumerica(sIdRegra,sSQL,bErro,piIdCalculo);

    if bErro then
    begin
      memResult.Lines.Add('Erro[Execução da Regra] - > '+Fieldbyname('IDREGRACALCULORE').AsString+
                          ' [N° de Recebimento] - ' + FieldByName('NUMRECEBIMENTO').AsString);
      memResult.Lines.Add('');
      Exit;
    end;

    if (sValorRegra = '') 
    then
    begin
      memResult.Lines.Add('Erro[Valor Calculado = BRANCO] - Reserva : ' + Copy(qryreservaxplano.fieldbyname('nome').AsString,1,60)+
                          ' - Nº de Recebimento = '+ FieldByName('NUMRECEBIMENTO').AsString+
                          ' - Índice(código) = '+FieldByName('INDICEREAJUSTE').AsString+
                          ' - Data = '+data_cota  );
      memResult.Lines.Add('');
      Exit;
    end;

    sValorReserva:=sValorRegra;
  end;

  decimalseparator := caux;
  Result:=True;
end;


//  ROTINAS PARA CALCULO DA RESERVA COLETIVA
function TfrmCalculaReservaPart.CalculaColetiva(sNomeReserva, sNomePlano: string):boolean;
var
  sValorReserva,
  sIdRegra:string;
  EstaOk:boolean;
  cAux : char;
  rValorContribRec, rValorContribEsp : Real;

  mes , ano , sitpart : String; 
begin
  Result := False;

  bErro := False;    {passar a somar as reservas coletivas num único registro - QryUpd}
  QryUpd.Close;
  QryUpd.Open;
  rValorContribRec := 0;
  rValorContribEsp := 0;

  while not qryReserva.Eof do begin
    
    if qryReserva.FieldByName('FLGDEVOLUCAO').asinteger = 0 then
    begin
      rValorContribRec   := rValorContribRec + qryReserva.FieldByName('VALORRECEBIDO').AsFloat;
      rValorContribEsp   := rValorContribEsp + qryReserva.FieldByName('VALORESPERADO').AsFloat;
    end
    else
    begin
      rValorContribRec   := rValorContribRec - qryReserva.FieldByName('VALORRECEBIDO').AsFloat;
      rValorContribEsp   := rValorContribEsp - qryReserva.FieldByName('VALORESPERADO').AsFloat;
    end;
    
    pnlProgresso.Update;
    qryReserva.Next;
  end;

  qryReserva.First;
  QryUpd.Insert;
  
  if rValorContribRec >= 0 then
  begin
    qryUpd.FieldByName('FLGENTRADA').asinteger      := 1;
    qryUpd.FieldByName('ValorRecebido').AsFloat     := rValorContribRec;
    qryUpd.Fieldbyname('VALORESPERADO').AsFloat     := rValorContribEsp;
  end
  else
  begin
    qryUpd.FieldByName('FLGENTRADA').asinteger      := 0;
    qryUpd.FieldByName('ValorRecebido').AsFloat     := -rValorContribRec;
    qryUpd.Fieldbyname('VALORESPERADO').AsFloat     := -rValorContribEsp;
  end;
  
  qryUpd.FieldByName('ValorReserva').AsFloat      := qryReserva.FieldByName('ValorReserva').AsFloat;
  
  qryUpd.FieldByName('IdPessJur').AsInteger       := qryReserva.FieldByName('idpessjur').AsInteger; 
  qryUpd.FieldByName('idpessoa').AsInteger        := iIdFundacaoAtual;

  qryUpd.FieldByName('idparticipante').AsInteger  := iIdFundacaoAtual;  

  qryUpd.FieldByName('idplanoprev').AsInteger     := qryReserva.FieldByName('idplanoprev').AsInteger;
  qryUpd.FieldByName('idtiporeserva').AsInteger   := qryReserva.FieldByName('idtiporeserva').AsInteger;
  qryUpd.FieldByName('seqproposta').AsString      := qryReserva.FieldByName('seqproposta').AsString;
  qryUpd.FieldByName('idcontribuicao').AsInteger  := qryReserva.FieldByName('idcontribuicao').AsInteger;
  qryUpd.FieldByName('DATALANCTO').AsString       := data_cota;
  qryUpd.FieldByName('NUMRECEBIMENTO').AsString   := qryReserva.FieldByName('NUMRECEBIMENTO').AsString;
  qryUpd.FieldByName('MESREFERENCIA').AsString    := qryReserva.FieldByName('MESREFERENCIA').AsString;
  qryUpd.FieldByName('MESCOBRANCA').AsString      := qryReserva.FieldByName('MESCOBRANCA').AsString;
  qryUpd.FieldByName('IDMOTIVO').AsString         := qryReserva.FieldByName('IDMOTIVO').AsString;
  qryUpd.Fieldbyname('IDREGRACALCULORE').AsString := qryReserva.Fieldbyname('IDREGRACALCULORE').AsString;
  qryUpd.FieldByName('FLGRESERVAULTCOT').AsString := qryreserva.FieldByName('FLGRESERVAULTCOT').AsString;
  qryUpd.Fieldbyname('DATARECEBIMENTO').AsString  := qryReserva.Fieldbyname('DATARECEBIMENTO').AsString;
  qryUpd.Fieldbyname('INDICEREAJUSTE').AsString   := qryReserva.Fieldbyname('INDICEREAJUSTE').AsString;
  qryUpd.FieldByName('PERCENTUAL').AsFloat        := qryReserva.FieldByName('PERCENTUAL').AsFloat;
  qryUpd.FieldByName('FLGMODATUALIZACAO').AsFloat := qryReserva.FieldByName('FLGMODATUALIZACAO').AsFloat;
  qryUpd.Fieldbyname('DATAPREVISAORECE').AsString := qryReserva.Fieldbyname('DATAPREVISAORECE').AsString;
  qryUpd.Fieldbyname('VALOROP1').AsString         := qryReserva.Fieldbyname('VALOROP1').AsString;
  qryUpd.Fieldbyname('VALOROP2').AsString         := qryReserva.Fieldbyname('VALOROP2').AsString;
  qryUpd.Fieldbyname('VALOROP3').AsString         := qryReserva.Fieldbyname('VALOROP3').AsString;
  
  qryUpd.FieldByName('VALORMAXIMORATEIO').AsFloat:=
  qryReserva.Fieldbyname('VALORMAXIMORATEIO').asfloat;
  qryUpd.FieldByName('VALORPARARESERVA').AsFloat:=dTotValorParaReserva;

  qryUpd.FieldByName('SALPARTICIPACAO').AsFloat := 0; 
  inc(ordem);

  Application.ProcessMessages;
  frmCalculaReservaPart.update;
  if bCancelaenvio then
  begin
     memResult.Lines.Add('***********************************');
     memResult.Lines.Add('Processo interrompido pelo usuário.');
     memResult.Lines.Add('***********************************');
     Exit;
  end;


  
  if qryreservaxplano.fieldbyname('FLGRESERVAULTCOT').AsInteger = 1 
  then data_cota:=qryreserva.fieldbyname('DATALANCTO').ASSTRING
  else if qryreservaxplano.fieldbyname('FLGRESERVAULTCOT').AsInteger = 2 
  then data_cota:=qryreserva.fieldbyname('DATARECEBIMENTO').ASSTRING
  else begin
     sitpart:='PT';

     mes:=copy(qryreserva.fieldbyname('MESREFERENCIA').asstring,6,2);
     ano:=copy(qryreserva.fieldbyname('MESREFERENCIA').asstring,1,4);


     if mes = '13'
     then
     begin
        
        if rdgrpopindice.itemindex = 0 then
           data_cota := qryreserva.fieldbyname('DATAPREVISAORECE').asstring
        else data_cota:=CriticaDataCobrancaSitParaAlimentacao(qrydata,qryreserva.fieldbyname('IdPessJur').asstring,
          qryplano.fieldbyname('IdPlanoPrev').asstring,
          sitpart,'N',
          mes,ano);
        
     end
     else data_cota:=CriticaDataCobrancaSitParaAlimentacao(qrydata,qryreserva.fieldbyname('IdPessJur').asstring,
          qryplano.fieldbyname('IdPlanoPrev').asstring,
          sitpart,'N',
          mes,ano);


     
     if bExibeLogMatricula
     then begin
        memResult.Lines.Add('Reserva Coletiva - Situação : '+sDescSituacao+'. Data para Alimentação não encontrada no calendário. ');
        memResult.Lines.Add('');
     end;

     If (Data_Cota = '') And (not bUtilizaDataDeAtivo)
     then begin
        bErro := True;
        Exit;
     end;


     if data_cota='' then  Begin   
        if MsgDlg('Não encontrou a data correta para alimentação '+#13+
                  'Deseja efetivar a operação com a data de hoje? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes
        then
           
           data_cota := FormatDateTime('dd/mm/yyyy', Date) 
        else begin
          berro := True;
          Exit; 
        end;
     end;
  end;
  
  EstaOk:=True;
  sIdRegra:=Trim(qryUpd.Fieldbyname('IDREGRACALCULORE').AsString);
  if sIdRegra = '' then
    sValorReserva:=CalcVlReserva(qryUpd)
  else
    EstaOk:=CalcVlReservaPorRegra(qryUpd,sIdRegra,sValorReserva, '0');

  if EstaOk then
  begin

     cAux := DecimalSeparator;
     DecimalSeparator := '.';
     if strtofloat(ClienteNumero(sValorReserva)) > 0 then
     begin

        if not GravaColetiva('ALTERAR', sValorReserva) then
        bErro := True;
        
        if bErro then
        begin
          memResult.Lines.Add('Erro[Gravação do Reajuste] - Reserva : ' + Copy(qryReserva.FieldByName('RESERVA').AsString,1,60));
          memResult.Lines.Add('');
        end;
     end
     else
     begin
         memResult.Lines.Add('Não foi encontrada cotação para o índice da reserva ' + snomeReserva + ' do plano ' + sNomePlano);
         Result := true; 
         Exit;
     end;
     DecimalSeparator := cAux;
  end
  else
  begin
      memResult.Lines.Add('Não foi encontrada cotação para o índice da reserva ' + snomeReserva + ' do plano ' + sNomePlano);
      Result := true; 
      Exit
  end;

  pnlProgresso.Update;
  Application.ProcessMessages;
  frmCalculaReservaPart.update;
  if bCancelaenvio then
  begin
     memResult.Lines.Add('***********************************');
     memResult.Lines.Add('Processo interrompido pelo usuário.');
     memResult.Lines.Add('***********************************');
     Exit;
  end;
  Result := True;
end;

function TfrmCalculaReservaPart.GravaColetiva(sOp : string; sValReserva: string) : boolean;
var
   Fator : Double;
   rValorReserva ,
   rValorContrib : Double;
   sQuantCotas , sidcontribuicao, sidpessjur , sseqproposta,
   sidpessoa, sidreserva, sValorContrib, sValorReserva, sincompl,
   smesrefaux : string;
   sDataAlimentacao : string; 
begin
   Result := False;

   rValorReserva   := qryUpd.FieldByName('ValorReserva').AsFloat;
   rValorContrib   := String2Float(sValReserva);

   if qryUpd.fieldbyname('FLGENTRADA').asinteger = 1 then
   rValorReserva   := rValorReserva + rValorContrib
   else rValorReserva   := rValorReserva - rValorContrib;


   //truncaround(floattostr(rValorContrib),6); --> Está com erro p/ valores grandes
   sQuantCotas     := ValStr(rValorContrib,22,9,False,'.');            //está na UFuncoesUteis
   sidpessjur      := qryUpd.FieldByName('idpessjur').AsString;
   sidplanoprev    := qryUpd.FieldByName('idplanoprev').AsString;
   sidreserva      := qryUpd.FieldByName('idtiporeserva').AsString;
   sidpessoa       := qryUpd.FieldByName('idpessoa').AsString;
   sseqproposta    := qryUpd.FieldByName('seqproposta').AsString;
   sidcontribuicao := qryUpd.FieldByName('idcontribuicao').AsString;
   sValorContrib   := ValStr(rValorContrib,22,9,False,'.');
   sValorReserva   := ValStr(rValorReserva,22,9,False,'.');

   qryUpdReservaPart.Close;
   qryUpdReservaPart.ParamByName('VALORRESERVA').Value   := ArredondaValor(rValorReserva,8);
   qryUpdReservaPart.ParamByName('IDPESSJUR').Value      := StrToInt(sIdPessJur);
   qryUpdReservaPart.ParamByName('IDPLANOPREV').Value    := StrToInt(sIdPlanoPrev);
   qryUpdReservaPart.ParamByName('IDPESSOA').Value       := StrToInt(sIdPessoa);
   qryUpdReservaPart.ParamByName('SEQPROPOSTA').Value    := StrToInt(sSeqProposta);
   qryUpdReservaPart.ParamByName('IDTIPORESERVA').Value  := StrToInt(sIdReserva);
   qryUpdReservaPart.ParamByName('DATA').AsDate         := date; // a data de referencia do saldo na reservapart é
                                                                 // sempre a data em que foi feita a alimentacao
   try
     qryUpdReservaPart.ExecSQL;
   except
     Exit;
   end;

   //se as reservas dos meses anteriores ao mês de
   //referência passado na tela forem atualizados
   //pelo mesmo valor da cota então...
   //senão atualiza pela cota de cada mês de referência
   if qryUpd.FieldByName('FLGRESERVAULTCOT').AsInteger <> 0 
   then sMesRefAux := sAnoMesCobrancaTela
   else sMesRefAux := qryUpd.FieldByName('MESREFERENCIA').AsString;

   // APAGUEI O CODIGO QUE TINHA PARA PREENCHIMENTO DO SDATAAUX, QUE DEPOIS NAO
   // ERA USADO PARA NADA

   if qryPlano.FieldByName('FLGDTALIMRESERVA').AsInteger = 0
   then sDataAlimentacao := dtAlimentacao.Text
   else begin
      sDataAlimentacao := qryReserva.FieldByName('DATARECEBIMENTO').AsString;
      if Trim(sDataAlimentacao) = ''
      then begin
          memResult.Lines.Add('Erro[Dt. Recebimento] - Plano : '+sIdPlanoPrev+' - Reserva : '+sIdReserva+' - Mês : '+qryReserva.FieldByName('MesReferencia').AsString+' - Data de Recebimento em branco.');
          memResult.Lines.Add('');
          Exit;
      end;
   end;

   if not AlimentaHistorico(qrygrava,
                  sidpessjur,
                  sidplanoprev,
                  sidreserva,
                  sidpessoa,
                  sseqproposta,
                  sValorContrib,
                  sValorReserva,
                  '',sidcontribuicao,'',
                  Trim(qryUpd.Fieldbyname('IDREGRACALCULORE').AsString),
                  qryReserva.FieldByName('MesReferencia').AsString,
                  qryUpd.fieldbyname('FLGENTRADA').asinteger,
                  // strtodate(dtAlimentacao.Text),
                  strtodate(sDataAlimentacao),
                  False,
                  StrtoDate(data_cota),

                  { Voltar a alimentar no historico o    }
                  { campo IDPARTICIPANTE com ID do participante que alimentou }
                  { a reserva.                                                }
                  qryReserva.FieldByName('IDPART').AsString,

                  iIdHistorico)

   then begin
      Exit;
   end;

   inc(ordem);       // ValStr está na UFuncoesUteis, truncaround está com erro p/ valores grandes

   bGravou := True;
   Result  := True;
end;

//  ROTINAS PARA CALCULO DA RESERVA INDIVIDUAL

function TfrmCalculaReservaPart.GeraHistorico(sNomeReserva,sNomePlano : string ):boolean;
var
  sIdRegra,
  sSql,
  sValorRegra,
  sValorReserva   : string;
  piIdCalculo     : integer;
  EstaOk          : boolean;
  cAux            : char;
  percentual      : double;

  mes , ano , sitpart : String; 
  iIdPessoa : Integer;
  sPrimeiroRegistro : String;
begin
  Result        := False;

  bErro         := False;
  with qryReservasACalcular do
  begin

    // Enquanto houver contribuicao para alimentar fazer :
    //  1.  Enquanto for a mesma contribuicao fazer :
    //      1.1 Calcular valor da reserva
    //      1.2 Atualizar reservapart
    //      1.3 Gerar Historico de Movimentacao de Reserva
    //  2. Atualizar historico de contribuicao com flgCalcReserva = 1 para esta contribuicao
    First;
    iIdPessoa := 0; 
    while not EOF do
    begin

      { Controle do promeiro registro do grupo PESSOAXCONTRIB }
      sPrimeiroRegistro := '0';
      If ( qryReservasACalcular.FieldByName('IDPESSOA').AsInteger <> iIdPessoa ) Then Begin
        sPrimeiroRegistro := '1';
        iIdPessoa := qryReservasACalcular.FieldByName('IDPESSOA').AsInteger;
      End;

      if icontadorcommit > NumMaxRegSemCommit then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
         if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;
         iContadorCommit := 0;
      end;

      Inc(iContadorCommit);

      pnlProgresso.Update;
      Application.ProcessMessages;
      frmCalculaReservaPart.update;
      if bCancelaenvio then
      begin
         memResult.Lines.Add('***********************************');
         memResult.Lines.Add('Processo interrompido pelo usuário.');
         memResult.Lines.Add('***********************************');
         Exit;
      end;


      if qryreservaxplano.fieldbyname('FLGRESERVAULTCOT').AsInteger = 1 
      then data_cota := qryreservasACalcular.fieldbyname('DATALANCTO').ASSTRING
      else if qryreservaxplano.fieldbyname('FLGRESERVAULTCOT').AsInteger = 2 
      then data_cota := qryreservasACalcular.fieldbyname('DATARECEBIMENTO').ASSTRING
      else begin

         
         if trim(qryReservasACalcular.fieldbyname('FLGSITFUNDACAO').asstring) = '' then
         begin
            qrysituacao.Close;
            qrysituacao.ParamByName('IdPessoa').value:=qryReservasACalcular.fieldbyname('IdPessoa').asinteger;
            qrysituacao.open;
            sitpart:=qrysituacao.fieldbyname('FlgInterno').asstring;
         end
         else  sitpart:= qryReservasACalcular.fieldbyname('FLGSITFUNDACAO').asstring;
         

         mes:=copy(qryreservasACalcular.fieldbyname('MESREFERENCIA').asstring,6,2);
         ano:=copy(qryreservasACalcular.fieldbyname('MESREFERENCIA').asstring,1,4);



         if mes = '13'
         then
         begin
            
            if rdgrpopindice.itemindex = 0 then
               data_cota := qryReservasACalcular.fieldbyname('DATAPREVISAORECE').asstring
            else  data_cota:=CriticaDataCobrancaSitParaAlimentacao(qrydata,qryReservasACalcular.fieldbyname('IdPessJur').asstring,
              qryplano.fieldbyname('IdPlanoPrev').asstring,
              sitpart,'N',
              mes,ano);
             
         end
         else data_cota:=CriticaDataCobrancaSitParaAlimentacao(qrydata,qryReservasACalcular.fieldbyname('IdPessJur').asstring,
              qryplano.fieldbyname('IdPlanoPrev').asstring,
              sitpart,'N',
              mes,ano);

         if bExibeLogMatricula
         then begin
            memResult.Lines.Add('Matrícula '+FieldByName('MATRICULA').AsString+' - Situação : '+sDescSituacao+'. Data para Alimentação não encontrada no calendário. ');
            memResult.Lines.Add('');
         end;

         If (Data_Cota = '') And (not bUtilizaDataDeAtivo)
         then begin
            bErro := True;
            Exit;
         end;


         if data_cota = ''
         then begin   
            if MsgDlg('Não encontrou a data correta para alimentação '+#13+
                      'Deseja efetivar a operação com a data de hoje? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes
            then
               
               data_cota := FormatDateTime('dd/mm/yyyy', Date) 
            else begin
               berro := True;
               Exit; 
            end;
         end;
      end;
      
      EstaOk   :=True;
      sIdRegra :=Trim(Fieldbyname('IDREGRACALCULORE').AsString);
      if sIdRegra = ''
      then sValorReserva := CalcVlReserva(qryReservasACalcular)
      else EstaOk        := CalcVlReservaPorRegra(qryReservasACalcular,sIdRegra,sValorReserva, sPrimeiroRegistro);

      if EstaOk
      then begin
         cAux := DecimalSeparator;
         DecimalSeparator := '.';

         if (UpperCase(Trim(sValorReserva)) = 'False') or (Trim(sValorReserva) = '')
         then sValorReserva := '0';

         if sValorReserva <> '0'
         then begin
            if not GravaReserva(qryReservasACalcular, sValorReserva)
            then begin
               memResult.Lines.Add('Erro[Gravação] - N° de Recebimento : ' + FieldByName('NUMRECEBIMENTO').AsString + '  - Valor : ' + sValorReserva);
               memResult.Lines.Add('');
            end;
         end;
         DecimalSeparator := cAux;
      end
      else begin
         memresult.Lines.Add('Erro ao calcular valor a alimentar para a reserva "' + sNomeReserva + '" do plano "' + sNomePlano+'".');
         
      end;

      Next;
    end;
  end;

  pnlProgresso.Update;
  Application.ProcessMessages;
  frmCalculaReservaPart.update;
  if bCancelaenvio then
  begin
     memResult.Lines.Add('***********************************');
     memResult.Lines.Add('Processo interrompido pelo usuário.');
     memResult.Lines.Add('***********************************');
     Exit;
  end;
  Result := True;
end;{procedure}


function TfrmCalculaReservaPart.GravaReserva(qryReservasACalcular : twwquery ; sValor : string) : boolean;
var
  rValorContrib,
  rValorReserva,Fator : Double;
  sQuantCotas ,  sidcontribuicao, sidpessjur ,
  sseqproposta,  sidpessoa, sidreserva , sValorContrib,
  sValorReserva, sincompl, smesrefaux: string;
  iEntrada : Integer;
  dValIndice :double;
  sDataAlimentacao : string; 
begin
   Result := False;
   sValor := OraNumero(sValor);
   rValorContrib   := String2Float(sValor);

   sidpessjur      := qryReservasACalcular.FieldByName('idpessjur').AsString;
   sidplanoprev    := qryReservasACalcular.FieldByName('idplanoprev').AsString;
   sidreserva      := qryReservasACalcular.FieldByName('idtiporeserva').AsString;
   sidpessoa       := qryReservasACalcular.FieldByName('idpessoa').AsString;

   // TRATAR ATUALIZACAO POR INDICE
   if qryReservaxPlano.FieldbyName('FLGMODATUALIZACAO').AsInteger = 0
   then begin
      // **************************** TRATAR DEVOLUCAO **************************************
      if qryReservasACalcular.FieldByName('FLGDEVOLUCAO').AsInteger = 0
      then begin
         rValorReserva := PegaValorReservaPessoa(sidPessjur,sidPlanoPrev, sidPessoa, sidReserva, qryAux) + rValorContrib;
         iEntrada      := 1;
      end
      else begin
         rValorReserva := PegaValorReservaPessoa(sidPessjur,sidPlanoPrev, sidPessoa, sidReserva, qryAux) - rValorContrib;
         iEntrada      := 0;
      end;
      // **************************** TRATAR DEVOLUCAO **************************************
   end
   else begin
      if qryReservasACalcular.FieldByName('FLGDEVOLUCAO').AsInteger = 0
      then begin
         dValIndice := VoltaValorCotacaoComData( qryAux, 
                                          qryReservaxPlano.Fieldbyname('INDICECORRECAO').AsString,
                                          qryReservaxPlano.Fieldbyname('IDPLANOPREV').AsString,
                                          qryReservaxPlano.Fieldbyname('IDTIPORESERVA').AsString,
                                          data_cota); 

         rValorReserva := PegaValorReservaPessoa(sidPessjur,sidPlanoPrev, sidPessoa, sidReserva, qryAux) + rValorContrib;
         iEntrada      := 1;
      end
      else begin
         rValorReserva := PegaValorReservaPessoa(sidPessjur,sidPlanoPrev, sidPessoa, sidReserva, qryAux) - rValorContrib;
         iEntrada      := 0;
      end;
   end;

   sseqproposta    := qryReservasACalcular.FieldByName('seqproposta').AsString;
   sidcontribuicao := qryReservasACalcular.FieldByName('idcontribuicao').AsString;
   sValorContrib   := ValStr(rValorContrib,22,9,False,'.');
   sValorReserva   := ValStr(rValorReserva,22,9,False,'.');

   qryUpdReservaPart.Close;
   qryUpdReservaPart.ParamByName('VALORRESERVA').Value  := ArredondaValor(rValorReserva,8);
   qryUpdReservaPart.ParamByName('IDPESSJUR').Value     := StrToInt(sIdPessJur);
   qryUpdReservaPart.ParamByName('IDPLANOPREV').Value   := StrToInt(sIdPlanoPrev);
   qryUpdReservaPart.ParamByName('IDPESSOA').Value      := StrToInt(sIdPessoa);
   qryUpdReservaPart.ParamByName('SEQPROPOSTA').Value   := StrToInt(sSeqProposta);
   qryUpdReservaPart.ParamByName('IDTIPORESERVA').Value := StrToInt(sIdReserva);
   qryUpdReservaPart.ParamByName('DATA').AsDate         := date; 
                                                                 // sempre a data em que foi feita a alimentacao

   try
     qryUpdReservaPart.ExecSQL;
   except
     Exit;
   end;

   //se as reservas dos meses anteriores ao mês de
   //referência passado na tela forem atualizados
   //pelo mesmo valor da cota então...
   //senão atualiza pela cota de cada mês de referência
   if qryReservasACalcular.FieldByName('FLGRESERVAULTCOT').AsInteger <> 0 
   then sMesRefAux := sAnoMesCobrancaTela
   else sMesRefAux := qryReservasACalcular.FieldByName('MESREFERENCIA').AsString;

   // APAGUEI O CODIGO QUE TINHA PARA PREENCHIMENTO DO SDATAAUX, QUE DEPOIS NAO
   // ERA USADO PARA NADA

   if qryPlano.FieldByName('FLGDTALIMRESERVA').AsInteger = 0
   then sDataAlimentacao := dtAlimentacao.Text
   else begin
      sDataAlimentacao := qryReservasACalcular.FieldByName('DATARECEBIMENTO').AsString;
      if Trim(sDataAlimentacao) = ''
      then begin
          memResult.Lines.Add('Erro[Dt. Recebimento] - Plano : '+sIdPlanoPrev+' - Reserva : '+sIdReserva+' - Mês : '+qryReservasACalcular.FieldByName('MesReferencia').AsString+' - Data de Recebimento em branco.');
          memResult.Lines.Add('');
          Exit;
      end;
   end;

   if not AlimentaHistorico( qrygrava,
                             sidpessjur,
                             sidplanoprev,
                             sidreserva,
                             sidpessoa,
                             sseqproposta,
                             sValorContrib,
                             sValorReserva,
                             '',sidcontribuicao,'',
                             Trim(qryReservasACalcular.Fieldbyname('IDREGRACALCULORE').AsString),
                             qryReservasACalcular.FieldByName('MESREFERENCIA').AsString,
                             iEntrada, 
                             strtodate(sDataAlimentacao), 
                             False,
                             StrtoDate(data_cota),
                             { Voltar a alimentar no historico o    }
                             { campo IDPARTICIPANTE com ID do participante que alimentou }
                             { a reserva.                                                }
                             qryReservasACalcular.FieldByName('IDPART').AsString, 
                             iIdHistorico)

   then Exit;
   inc(ordem);
   Result := True;
end;

procedure TfrmCalculaReservaPart.PreparaQryColetiva ( psAnoMesReferencia, psAnoMesCobranca : string );
var
  sSQL,data_aux:string;
begin
  sSQL := ' SELECT HST.NUMRECEBIMENTO,HST.VALORRECEBIDO,HST.VALORESPERADO, HST.MESREFERENCIA,       '+
          '        NVL(HST.FLGDEVOLUCAO,0) FLGDEVOLUCAO,                                            '+
          '        HST.IDMOTIVO,HST.IDCONTRIBUICAO,  '+
          '        TO_DATE(TO_CHAR(HST.DATARECEBIMENTO, '+QuotedStr('DD/MM/YYYY')+')) DATARECEBIMENTO,  '+ 
          '        HST.DATAPREVISAORECE,  '+
          '        HST.MESCOBRANCA, HST.IDPESSOA IDPART,HST.IDPESSJUR,HST.IDPLANOPREV, REP.IDPESSOA, '+
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

          

          if (qryreservaxplano.FieldByName('FLGRESERVAULTCOT').AsInteger = 1) 
          then begin
             if IntToStr(iIdFundacao) = strPatro              
             Then sSQL := sSQL + ', TO_DATE(TO_CHAR(HST.DATARECEBIMENTO, '+QuotedStr('DD/MM/YYYY')+')) AS DATALANCTO  '
             else sSQL := sSQL + ', L.DATALANCTO ';
          end
          else if (qryreservaxplano.FieldByName('FLGRESERVAULTCOT').AsInteger = 2) 
          then begin
              sSQL := sSQL + ', TO_DATE(TO_CHAR(HST.DATARECEBIMENTO, '+QuotedStr('DD/MM/YYYY')+')) AS DATALANCTO  '
          end
          else begin
             data_aux   := FormatDateTime('dd/mm/yyyy', Date); 
             sSQL     := sSQL + ',''' + data_aux + ''' DATALANCTO ';
          end;

          sSQL := sSQL + ' FROM   HSTCONTRIBPREV HST, RESERVAXPLANO RXP , PLANPREV PL, RESERVAXCONTRIB RXC,      '+
                         '        RESERVAPART REP  ';

          if (qryreservaxplano.FieldByName('FLGRESERVAULTCOT').AsInteger = 1) and 
             (IntToStr(iIdFundacao) <> strPatro )
          then sSQL := sSQL +  ', LANCTODOCUM L, DOCUMENTO DOC ';


          sSql:=sSql + ' WHERE ';

          If ChBxProcessaAnteriores.checked = True Then Begin
            sSQL := sSQL +' (HST.MESCOBRANCA   <= ''' + psAnoMesCobranca   + ''') ';
          End Else Begin
            sSQL := sSQL + '(HST.MESCOBRANCA    = ''' + psAnoMesCobranca   + ''') ';
          End;

          sSql:=sSql + ' AND   (HST.MESREFERENCIA = HST.MESREFERENCIA ) '+
                       ' AND ( (HST.FLGCALCRESERVA = :FLGCALCRESERVA1) OR     '+
                       '       (HST.FLGCALCRESERVA = :FLGCALCRESERVA2) )      '+
          ' AND    (NVL(HST.VALORRECEBIDO,0) > 0 )                                  '+
          ' AND    (RXP.ANALITICOSINTETI = ''A'')                             '+
          ' AND    (HST.IDPLANOPREV      = :IDPLANOPREV )                     '+
          ' AND    (RXC.IDTIPORESERVA    = :IDTIPORESERVA)                    '+
          ' AND    (HST.MESREFERENCIA    = :MESREFERENCIA)                    '+
          ' AND    (HST.IDMOTIVO    = :IDMOTIVO)                    '+
          ' AND    (RXC.IDCONTRIBUICAO   = :IDCONTRIBUICAO)                   ';


          if rgrpTipoCobranca.ItemIndex = 0
          then sSQL := sSQL +' AND (HST.FLGDESCFOLHA = 1 )  '
          else if rgrpTipoCobranca.ItemIndex = 1
          then sSQL := sSQL +' AND (HST.FLGDESCFOLHA = 0 )  ';
          
          if Trim(strPatro) <> ''
          then sSQL := sSQL + 'AND (HST.IDPESSJUR = '+ strPatro + ')';

          if Trim(edNome.Text) <> ''
          then sSQL := sSQL + ' AND (HST.IDPESSOA = '+OraNumero(MontaSelectPart.ValoresChave[0])+')';


          if (qryreservaxplano.FieldByName('FLGRESERVAULTCOT').AsInteger = 1) and  
             (IntToStr(iIdFundacao) <> strPatro )
          then begin
             sSql:=sSql + ' AND (TO_NUMBER(L.OPERACAO) IN (5,10) )';
             sSql:=sSql + ' AND (L.CODDOCUMENTO = HST.CODDOCUMENTOPREV ) ';
             sSql:=sSql + ' AND (L.CODDOCUMENTO=DOC.CODDOCUMENTO) ';
             sSql:=sSql + ' AND (DOC.STATUS=TO_CHAR(2)) ';
             sSql:=sSql + ' AND (L.ESTORNO IS NULL) ';
          end;

          sSQL := sSQL + ' AND    (RXC.IDPLANOPREV   = HST.IDPLANOPREV)      '+
          ' AND    (RXP.IDPLANOPREV   = HST.IDPLANOPREV )                    '+
          ' AND    (RXP.IDTIPORESERVA = RXC.IDTIPORESERVA)                   '+
          ' AND    (RXP.FLGCOLETIVA = 1 )                                    '+
          ' AND    (REP.IDPLANOPREV = HST.IDPLANOPREV )                      '+
          ' AND    (RXC.IDCONTRIBUICAO= HST.IDCONTRIBUICAO)                  ';

           if Trim(strPatro) <> '' then
           sSQL := sSQL + ' AND (REP.IDPESSJUR IN (' + strPatro + ') ) ';
           sSQL := sSQL + ' AND    (REP.IDTIPORESERVA= RXC.IDTIPORESERVA)                    '+
          ' AND    (REP.IDPESSOA    = '+ InttoStr(iIdFundacaoAtual) + ')     '+                                                                                 
          ' AND    (REP.SEQPROPOSTA = HST.SEQPROPOSTA)                       '+
          ' AND    (PL.IDPLANOPREV = REP.IDPLANOPREV )                       ';
  sSQL := sSQL + ' ORDER BY HST.MESREFERENCIA, HST.IDCONTRIBUICAO                           ';

  qryReserva.Close;
  qryReserva.Sql.Clear;
  qryReserva.Sql.Add(sSQL);
end;

procedure TfrmCalculaReservaPart.PreparaQry( psAnoMesReferencia, psAnoMesCobranca : string;
                                             pbProcessaAnteriores : Boolean ); 
var
  sSQL,data_aux : string;
begin
  // adicionaei algunas campos na qry abaixo, pois serão utilizados
  // para passagem para regra de valor para rateio.

   // Filtra todas as Reservas a serem calculadas com as opções especificadas
   // Estas reservas são : não coletivas E analiticas E valor recebido no historico
   //                      de contribuicoes não nulo E valor recebido no historico
   //                      nao calculado (flgcalcreserva = 0)
   sSQL := ' SELECT  HST.NUMRECEBIMENTO,HST.FLGCALCRESERVA,HST.IDCONTRIBUICAO, NVL(HST.FLGDEVOLUCAO,0) FLGDEVOLUCAO ,       '+ 
           '        HST.VALORRECEBIDO,HST.VALORESPERADO , HST.DATARECEBIMENTO,HST.DATAPREVISAORECE,    '+
           '        HST.MESREFERENCIA,HST.MESCOBRANCA,HST.IDPESSOA IDPART ,HST.IDMOTIVO,HST.IDPESSJUR,  '+
           '        HST.IDPLANOPREV,HST.IDPESSOA,HST.SEQPROPOSTA, HST.FLGSITFUNDACAO, RXC.IDTIPORESERVA,'+
           '        RXC.IDREGRACALCULORE,RXC.PERCENTUAL,RXP.INDICEREAJUSTE,        '+
           '        RXP.INDICECORRECAO,RXP.FLGMODATUALIZACAO, ' +  
           '        RXP.FLGCOLETIVA,PPP.INSCRICAONUMERO,ELP.MATRICULA,             '+
           '        RXP.NOME RESERVA, HST.VALORPARARESERVA,                        '+
           '        REP.VALORRESERVA, REP.DATAREFERENCIASA,                        '+
           '        PPP.SALPARTICIPACAO , PPP.DTINICIOINSC, RXC.VALORMAXIMORATEIO, '+
           '        PL.FLGRESERVAULTCOT, NVL(HST.VALOROP1, CP.VALORBASE1) VALOROP1,  '+
           '        NVL(HST.VALOROP2, CP.VALORBASE2) VALOROP2 ,'+
           '        NVL(HST.VALOROP3, CP.VALORBASE3) VALOROP3  ';

           if qryreservaxplano.FieldByName('FLGRESERVAULTCOT').AsInteger = 1 
           then begin
              if IntToStr(iIdFundacao) = strPatro
              then sSQL := sSQL + ', HST.DATARECEBIMENTO AS DATALANCTO '
              else sSQL := sSQL + ', L.DATALANCTO ';
           end
           else if qryreservaxplano.FieldByName('FLGRESERVAULTCOT').AsInteger = 2 
           then begin
              sSQL := sSQL + ', HST.DATARECEBIMENTO AS DATALANCTO ';
           end
           else begin
               data_aux := FormatDateTime('dd/mm/yyyy', Date); 
               sSql:= sSql + ',''' + data_aux + ''' DATALANCTO ';
           end;

           sSql := sSql + ' FROM  HSTCONTRIBPREV HST, RESERVAPART REP, '+
                          ' CONTRIBPREVPARTP CP,  PARTPREVPLAN PPP,  ELEGPATRO ELP ';

           {Se flag for 2 busca campo DATALANCTO NA tabela LANCTODOCUM}
           if (qryreservaxplano.FieldByName('FLGRESERVAULTCOT').AsInteger = 1) and 
              (IntToStr(iIdFundacao) <> strPatro )
           then sSql:=sSql + ' ,LANCTODOCUM L , DOCUMENTO DOC ';

           sSql := sSql + ' ,RESERVAXCONTRIB RXC, RESERVAXPLANO RXP , PLANPREV PL ';

          { Possibilidade de escolher se deseja processar meses anteriores ou não }
          sSql:=sSql + ' WHERE ' ;


          { Caso processe os anteriores altera o filtro da query }
          If pbProcessaAnteriores = True Then Begin
            sSQL := sSQL +' (HST.MESCOBRANCA   <= ''' + psAnoMesCobranca   + ''') ';
          End Else Begin
            sSQL := sSQL + '(HST.MESCOBRANCA    = ''' + psAnoMesCobranca   + ''') ';
          End;

          sSql:=sSql + ' AND   (HST.MESREFERENCIA = HST.MESREFERENCIA ) ';

          if Trim(edNome.Text) <> ''
          then sSQL := sSQL + ' AND (HST.IDPESSOA = '+OraNumero(MontaSelectPart.ValoresChave[0])+')';

          sSql:=sSql + ' AND ( ( HST.FLGCALCRESERVA = :FLGCALCRESERVA1) OR ' + 
                       '       ( HST.FLGCALCRESERVA = :FLGCALCRESERVA2) )  ' + 
                       ' AND    ( NVL(HST.VALORRECEBIDO,0) > 0)    ';


          if Trim(strPatro) <> '' then
          sSQL := sSQL + ' AND    (HST.IDPESSJUR = '+strPatro+' ) ';


          sSQL := sSQL + ' AND    (HST.IDPLANOPREV    = :IDPLANOPREV)  '+
                         ' AND    (HST.IDPESSOA = HST.IDPESSOA)  '+
                         ' AND    (HST.SEQPROPOSTA = HST.SEQPROPOSTA) '+
                         ' AND    (HST.MESREFERENCIA    = :MESREFERENCIA)                    '+
                         ' AND    (HST.IDMOTIVO    = :IDMOTIVO)                    ';


          if qryReservaxPlano.FieldByName('IDRGVLRMAXRATEIO').AsString <> '' then
          sSQL := sSQL + ' AND    (RXC.IDRGVLRMAXRATEIO = '+qryReservaxPlano.FieldByName('IDRGVLRMAXRATEIO').AsString+' ) '
          else  sSQL := sSQL +  ' AND    (HST.IDCONTRIBUICAO = :IDCONTRIBUICAO ) ';


          if rgrpTipoCobranca.ItemIndex = 0
          then sSQL := sSQL +' AND (HST.FLGDESCFOLHA = 1 )  '
          else if rgrpTipoCobranca.ItemIndex = 1
          then sSQL := sSQL +' AND (HST.FLGDESCFOLHA = 0 )  ';


          //CONTRIBPREVPARTP
          sSql:=sSql + ' AND    (CP.IDPESSJUR   = HST.IDPESSJUR )     '+
           ' AND    (CP.IDPLANOPREV = HST.IDPLANOPREV )         '+
           ' AND    (CP.IDCONTRIBUICAO    = HST.IDCONTRIBUICAO )  '+
           ' AND    (CP.IDPESSOA    = HST.IDPESSOA )            '+
           ' AND    (CP.SEQPROPOSTA = HST.SEQPROPOSTA )            ';


          //RESERVAPART
          sSql:=sSql +' AND    (REP.IDTIPORESERVA= :IDTIPORESERVA )   '+
           ' AND    (REP.IDPLANOPREV = HST.IDPLANOPREV )         '+
           ' AND    (REP.IDPESSOA    = HST.IDPESSOA )            '+
           ' AND    (REP.IDPESSJUR   = HST.IDPESSJUR )             '+
           ' AND    (REP.SEQPROPOSTA = HST.SEQPROPOSTA )            ';

          //PARTPREVPLAN
          sSql:=sSql +' AND    (PPP.IDPESSJUR   = HST.IDPESSJUR )               '+
           ' AND    (PPP.IDPESSOA    = HST.IDPESSOA )                          '+
           ' AND    (PPP.IDPLANOPREV = HST.IDPLANOPREV )                       '+
           ' AND    (PPP.SEQPROPOSTA = HST.SEQPROPOSTA)                        ';

          //ELEGPATRO
          sSql:=sSql +' AND    (ELP.IDPESSJUR   = HST.IDPESSJUR )      '+
           ' AND    (ELP.IDPESSOA    = HST.IDPESSOA  )           ';

          //CAP-CAR
           if (qryreservaxplano.FieldByName('FLGRESERVAULTCOT').AsInteger = 1) and 
              (IntToStr(iIdFundacao) <> strPatro )
           then begin
              sSql:=sSql + ' AND (L.CODDOCUMENTO = HST.CODDOCUMENTOPREV )';
              sSql:=sSql + ' AND (L.NUMLANCTO = L.NUMLANCTO ) ';
              sSql:=sSql + ' AND (L.OPERACAO IN (''5'',''10'') )';
              sSql:=sSql + ' AND (L.ESTORNO IS NULL) ';
              sSql:=sSql + ' AND (DOC.CODDOCUMENTO = L.CODDOCUMENTO )';
              sSql:=sSql + ' AND (DOC.STATUS= ''2'' ) ';
           end;

          //RESERVAXCONTRIB
          sSQL := sSQL + ' AND    (RXC.IDTIPORESERVA  = REP.IDTIPORESERVA)     '+
           ' AND    (RXC.IDPLANOPREV    = HST.IDPLANOPREV)                        '+
           ' AND    (RXC.IDCONTRIBUICAO   = HST.IDCONTRIBUICAO)                   ';

          //RESERVAXPLANO
          sSQL := sSQL +' AND    (RXP.IDPLANOPREV    = REP.IDPLANOPREV)          '+
           ' AND    (RXP.IDTIPORESERVA  = REP.IDTIPORESERVA)                      '+
           ' AND    (RXP.ANALITICOSINTETI = ''A'' )                            ';

          //PLANPREV
          sSql:=sSql + ' AND    (PL.IDPLANOPREV = HST.IDPLANOPREV )                        ';


   sSQL := sSQL + ' ORDER BY HST.MESREFERENCIA, HST.IDCONTRIBUICAO, HST.IDPESSJUR, HST.IDPESSOA  ';
   qryReservasACalcular.Close;
   qryReservasACalcular.SQL.Clear;
   qryReservasACalcular.SQL.Add(sSQL);
   
end;


function TfrmCalculaReservaPart.ExecutaQuery( aQuery : TwwQuery ;
                                              iIdReserva, iIdPlanoPrev,
                                              iIdContribuicao,
                                              iFlgControle, iIdMotivo  : integer;
                                              sMesReferencia  : String ):boolean; 
var
  sIdRegraValorReserva,
  sSqlRegra,
  sValorParaReserva              : string;
  sValorMaximoRateio,
  sIdRegraVlrMaxRateio, sValorTotReceb              : string;

  iIdPessoa : Integer;
  sPrimeiroRegistro : String;
begin
  Result := False;

  with aQuery do
  begin

     Close;
     ParamByName('IDPLANOPREV').Value    := iIdplanoprev;
     ParamByName('IDTIPORESERVA').Value  := iIdReserva;

     if (qryReservaxPlano.FieldByName('IDRGVLRMAXRATEIO').AsString = '')
        or (qryreservaxplano.FieldByName('FLGCOLETIVA').asString = '1') 
     then  ParamByName('IDCONTRIBUICAO').Value := iIdContribuicao;      

     ParamByName('MESREFERENCIA').Value := sMesReferencia;
     ParamByName('IDMOTIVO').Value := iIdMotivo;

     //BRUNO AZEVEDO SOL 133772 KINTANA 788150
     {if ((iFlgControle = 1) or
        (qryreservaxplano.FieldByName('FLGCOLETIVA').asString = '1')) And
        ((Sistema.TipoCliente = 19991) Or
         (Sistema.TipoCliente = 20011))
     then begin
         ParamByName('FLGCALCRESERVA1').Value := 0;
         ParamByName('FLGCALCRESERVA2').Value := 1;
     end
     else begin
         ParamByName('FLGCALCRESERVA1').Value := 0;
         ParamByName('FLGCALCRESERVA2').Value := 0;
     end;}

     //SOMENTE ALIMENTAR AS RESERVAS COM FLGCALCRESERVA = 0
     ParamByName('FLGCALCRESERVA1').Value := 0;
     ParamByName('FLGCALCRESERVA2').Value := 0;
     //BRUNO AZEVEDO SOL 133772 KINTANA 788150


     try
       Open;
     except
       on E:EDBEngineError do
       begin
          MostrarErro(E);
          Exit;
       end;
     end;//try

     if IsEmpty
     then begin
         Close;
         Exit;
     end
     else bCalculouAlguem := True;
     Result := True;

     // QUANDO A RESERVA É COLETIVA A QUERY UTILIZADA É QRYRESERVA E NÃO QRYRESERVASACALCULAR
     // ASSIM, DENTRO DESTA ROTINA (EXECUTAQUERY) DEVEMOS USAR O PARAMETRO AQUERY
     // qryReservasACalcular.open;


     // 3º Passo: a qryReservasACalcular contém todos os participante
     // que serão passados para regra de Valor de Reserva
     // e grava-lo no campo VALORMAXIMORESERVA
     // INICÍO - 3º Passo


     if (trim(qryReservaxPlano.FieldbyName('IDREGRAVLRRESERVA').AsString) <> '') and
        (trim(qryReservaxPlano.FieldByName('IDRGVLRMAXRATEIO').AsString) <> '') then
     begin

        sIdRegraValorReserva := qryReservaxPlano.FieldbyName('IDREGRAVLRRESERVA').AsString;

        if trim(qryReservaxPlano.FieldByName('IDRGVLRMAXRATEIO').AsString) = '' Then
           // Não existe regra associada.
           // valor máximo de rateio é zero
           sValorMaximoRateio := '0'
        else
        begin
           // A regra está associada.
           sIdRegraVlrMaxRateio := qryReservaxPlano.FieldByName('IDRGVLRMAXRATEIO').AsString;


           qryAux.Sql.Clear;
           
           qryAux.Sql.Add(' SELECT ABS(SUM(DECODE(FLGDEVOLUCAO,1,VALORRECEBIDO*-1, VALORRECEBIDO))) VALOR '+
                          ' FROM HSTCONTRIBPREV '+
                          ' WHERE (IDPESSJUR = '+qryPatro.FieldbyName('IDPESSOA').AsString+') '+
                          ' AND IDPLANOPREV = '+qryReservaxPlano.FieldbyName('IdPlanoPrev').AsString+' '+
                          ' AND MESCOBRANCA = '''+sAnoMesCobrancaTela+''' '+
                          ' AND   (IDCONTRIBUICAO IN (SELECT IDCONTRIBUICAO '+
                          '        FROM RESERVAXCONTRIB '+
                          '        WHERE IDPLANOPREV = HSTCONTRIBPREV.IDPLANOPREV '+
                          '        AND  IDRGVLRMAXRATEIO = '+qryReservaxPlano.FieldByName('IDRGVLRMAXRATEIO').AsString+')) '+
                          ' AND MESREFERENCIA = '''+qryReservaxPlano.FieldByName('MesReferencia').AsString+''' '+
                          ' AND IDMOTIVO = '+qryReservaxPlano.FieldByName('IdMotivo').AsString+'  ');
           qryAux.open;

           sValorTotReceb := qryAux.FieldByName('VALOR').AsString;

           sSqlRegra :=
                   'SELECT '+
                   qryReservaxPlano.FieldbyName('IdPlanoPrev').AsString + ' AS IDPLANOPREV, '+
                   strPatro + ' AS IDPESSJUR, '+
                   ''''+sAnoMesCobrancaTela+ ''' AS MESREFERENCIA,  '+
                   oranumero(sValorTotReceb)+' VALORTOTRECEB, '+ 
                   qryReservaxPlano.FieldByName('IdMotivo').AsString+' AS IDMOTIVO, '+
                   qryReservaxPlano.FieldByName('IdContribuicao').AsString+' AS IDCONTRIBUICAO '+ 
                   ' FROM DUAL ';

           sValorMaximoRateio := RegraNumerica(sIdRegraVlrMaxRateio,sSqlRegra,bErro,iIdcalculo);



           qryAux.Sql.Clear;
           qryAux.Sql.Add(' UPDATE RESERVAXCONTRIB  ' +
                          ' SET VALORMAXIMORATEIO = ' + OraNumero(sValorMaximoRateio) +
                          ' WHERE '+
                          ' (IDCONTRIBUICAO IN (SELECT IDCONTRIBUICAO '+
                          '        FROM RESERVAXCONTRIB '+
                          '        WHERE IDPLANOPREV = RESERVAXCONTRIB.IDPLANOPREV '+
                          '        AND  IDRGVLRMAXRATEIO = '+qryReservaxPlano.FieldByName('IDRGVLRMAXRATEIO').AsString+')) '+
                          ' AND   IDPLANOPREV     = '+qryReservaxPlano.FieldbyName('IdPlanoPrev').AsString);
           try
             qryAux.ExecSQL;
           except
           end;

           dTotValorParaReserva := 0; 
        End;


        First;
        iIdPessoa := 0;
        While Not Eof Do
        Begin

           { Controle do promeiro registro do grupo PESSOAXCONTRIB }
           sPrimeiroRegistro := '0';
           If ( aQuery.FieldByName('IDPESSOA').AsInteger <> iIdPessoa ) Then Begin
             sPrimeiroRegistro := '1';
             iIdPessoa := aQuery.FieldByName('IDPESSOA').AsInteger;
           End;

           // montar qry da regra.
           sSqlRegra := ' SELECT ' +
              aQuery.FieldByName('IDPESSOA').AsString                   + ' AS IDPESSOA, '+
              aQuery.FieldByName('IDPLANOPREV').AsString                + ' AS IDPLANOPREV, '+
              aQuery.FieldByName('IDPESSJUR').AsString                  + ' AS IDPESSJUR, '+
              '''' + aQuery.FieldByName('DTINICIOINSC').AsString        + ''' AS DTINICIOINSC, '+
              '''' + aQuery.FieldByName('DATARECEBIMENTO').AsString     + ''' AS DATARECEBIMENTO, '+
              '''' + aQuery.FieldByName('MESREFERENCIA').AsString       + ''' AS MESREFERENCIA, '+
              '''' + aQuery.FieldByName('MESREFERENCIA').AsString       + ''' AS MESREF, '+  
              OraNumero(aQuery.FieldByName('SALPARTICIPACAO').AsString) + ' AS SALPARTICIPACAO, '+
              OraNumero(aQuery.FieldByName('VALORRECEBIDO').AsString)   + ' AS VALORRECEBIDO, '+
              OraNumero(aQuery.FieldByName('VALOROP1').AsString)        + ' AS VALOROP1, '+
              OraNumero(aQuery.FieldByName('VALOROP2').AsString)        + ' AS VALOROP2, '+
              OraNumero(aQuery.FieldByName('VALOROP3').AsString)        + ' AS VALOROP3,  '+
              OraNumero(sValorMaximoRateio) + ' AS VALORMAXIMORATEIO,  '+

              sPrimeiroRegistro + ' AS PRIMREGGRUPO, '+ 

              ''''+aQuery.FieldByName('FLGDEVOLUCAO').AsString+ ''' AS FLGDEVOLUCAO, '+ 
              ''''+qryReservaxPlano.FieldByName('IdMotivo').AsString+''' AS IDMOTIVO '+ 
              ' FROM DUAL ';

           sValorParaReserva := FloatToStr(abs(StrToFloat(Clientenumero(RegraNumerica(sIdRegraValorReserva,sSqlRegra,bErro,iIdCalculo)))));

           dTotValorParaReserva := dTotValorParaReserva + StrToFloat(ClienteNumero(sValorParaReserva));


           qryAux.Sql.Clear;
           qryAux.Sql.Add(' UPDATE HSTCONTRIBPREV  '+
                         ' SET VALORPARARESERVA  = TRUNC('+OraNumero(sValorParaReserva)+' ,2) '+ 
                         ' WHERE NUMRECEBIMENTO  = '    + FieldByName('NUMRECEBIMENTO').AsString +
                         ' AND MESREFERENCIA     = '''  + FieldByName('MESREFERENCIA').AsString  +''''+
                         ' AND MESCOBRANCA       = '''  + FieldByName('MESCOBRANCA').AsString    +''''+
                         ' AND IDMOTIVO          = '    + FieldByName('IDMOTIVO').AsString );
           try
              qryAux.ExecSQL;
           except
           end;

           Next;
        End; // while

        //caso tenha regra de rateio, os valores foram atualizados.
        //A consulta deve ser refeita.
        close;
        open;

     End; //if trim(sIdRegraValorReserva) <> ''
     // FIM - 3º Passo

  end;
  Result := True;
end;

//  ############        RESPOSTA AO EVENTO PRINCIPAL        ############
procedure TfrmCalculaReservaPart.bbtnEnviarClick(Sender: TObject);
var

  bErro,                  
  bPossuiPercentual      : boolean;
  strReserva,  sSQLReservaPlano,
  sSQL,mes,ano, sitpart  : string;

  i,j,cont,
  iIdcalculo,            
  pessoa                 : integer;

  iIdContribAtual        : longint;
  dPercentual            : double;

  strPatroLog,
  strPlanoLog,
  sSqlRegra,
  bProcessa13            : boolean;
  bPedeData              : boolean; 

  sIdRegraMotivoMes    : String;

  iIdRegraRateioAtual : Longint;

  sLogTotalPrev : String;

  // SOL129365 - Daniel Begnami
  sSQLReservaAlimenta : String;
  iComitaReservaAlimenta : integer;

begin
  inherited;

  
  bPedeData := False;
  for j := 0 to chklstPlano.Items.Count - 1 do
  begin
     if (not chklstPlano.checked[j]) then continue;

     if not qryPlano.Locate('Nome',Trim(chklstPlano.items[J]),[locaseinsensitive, loPartialKey]) then
     begin
        memResult.Lines.Add('');
        memResult.Lines.Add('[Plano] - '+chklstPlano.items[j]+'- Plano não encontrado');
        memResult.Lines.Add('');
        continue;
     end;

     if qryPlano.FieldByName('FLGDTALIMRESERVA').AsInteger = 0
     then bPedeData := True;
  end;

  if (bPedeData) and (Trim(dtAlimentacao.Text) = '')
  then begin
     grpDataAlimentacao.Visible := True;
     dtAlimentacao.SetFocus;
     MsgDlg('O(s) plano(s) selecionado(s) existe o preenchimento da data de alimentação.'+
            'Favor preencher o campo.','Erro',mtError,[mbOK],0);
     Exit;
  end;
  

  qryDatasIndice.Close;
  qryDatasIndice.Open;

  bCalculouAlguem     := False;
  cont                := 0;
  pnlFundo.enabled    := False;
  bCancelaenvio       := False;
  iContadorCommit     := 0;
  bMostraMensagem     := True;
  bUtilizaDataDeAtivo := False; 

  pnlProgresso.Update;
  Application.ProcessMessages;
  frmCalculaReservaPart.update;

  if bCancelaenvio
  then begin
     memResult.Lines.Add('***********************************');
     memResult.Lines.Add('Processo interrompido pelo usuário.');
     memResult.Lines.Add('***********************************');
     Exit;
  end;

  if Trim(cmbMesRef.Text) = ''
  then begin
     MsgDlg('Mês de Cobrança do Cálculo não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     cmbMesRef.SetFocus;
     Exit;
  end;

  if Trim(spedAnoRef.Text) = ''
  then begin
     MsgDlg('Ano de Cobrança do Cálculo não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     spedAnoRef.SetFocus;
     Exit;
  end;

  sAnoMesCobrancaTela := Trim(spedAnoRef.Text)+'/';
  if cmbMesRef.ItemIndex <= 8
  then sAnoMesCobrancaTela := sAnoMesCobrancaTela + '0' + IntToStr(cmbMesRef.ItemIndex+1)
  else sAnoMesCobrancaTela := sAnoMesCobrancaTela + IntToStr(cmbMesRef.ItemIndex+1);


  // Testar se existem dados na tabelas com as opcoes preenchidas
  // Se OpcoesOK retornar True, a qryReservasACalcular estará preenchida com os registros a calcular
  // Senao, a qryReservasACalcular estará fechada
  if not OpcoesOK then Exit;

  if chkResult.Checked
  then begin
    memResult.Font.Color := clWindowText;
    memResult.Lines.Clear;

    memResult.Lines.Add('Cálculo de Reservas dos Participantes/ ' + lbPatro.Caption + ' - Data : ' + FormatDateTime('dd/mm/yyyy', Date) + '    LISTA DE EXCEÇÕES ');

    memResult.Lines.Add('');
    memResult.Lines.Add('Mês de Cobrança : '+Trim(sAnoMesCobrancaTela));
    memResult.Lines.Add('---------------------------------------------');
  end;

  pnlProgresso.Visible := True;
  pnlProgresso.BringToFront;


  IdLote := LeUltRegistro (nil,'CTRLINTERFACE');

  strContribuicao := '';
  qryContribuicao.First;
  while not qryContribuicao.Eof do
  begin
     if qryContribuicao.FieldByName('FLGALIMENTA').AsInteger = 1
     then begin
       if Trim(strContribuicao) = ''
       then strContribuicao := qryContribuicao.FieldByName('IDCONTRIBUICAO').AsString
       else strContribuicao := strContribuicao +','+qryContribuicao.FieldByName('IDCONTRIBUICAO').AsString;
     end;
     qryContribuicao.Next;
  end;


  dtmBaseDados.dbBaseDados.StartTransaction;


  if chkIntegra.Checked then
     sLogTotalPrev := 'Alimentação de Reserva [Apenas Integração] - Mês '+sAnoMesCobrancaTela+ '[Patros.: '+strPatro+'-Planos:'+strPlano+'-Contrib:'+strContribuicao+'] - Opção Décimo Terceiro:'+inttostr(rdgrpopindice.itemindex + 1)+''
  else
  begin
     if bIntegraContab then
     sLogTotalPrev := 'Alimentação de Reserva  - Mês '+sAnoMesCobrancaTela+ '[Patros.: '+strPatro+'-Planos:'+strPlano+'-Contrib:'+strContribuicao+'] - Opção Décimo Terceiro:'+inttostr(rdgrpopindice.itemindex + 1)+''
     else sLogTotalPrev := 'Alimentação de Reserva [Não Integrado]  - Mês '+sAnoMesCobrancaTela+ '[Patros.: '+strPatro+'-Planos:'+strPlano+'-Contrib:'+strContribuicao+'] - Opção Décimo Terceiro:'+inttostr(rdgrpopindice.itemindex + 1)+'';
  end;


  if not (1=1) 
  then begin
     memResult.Lines.Add(' Erro na Gravação do Log.');
     if dtmBaseDados.dbBaseDados.InTransaction then     dtmBaseDados.dbBaseDados.RollBack;
     if chkResult.checked
     then begin
        pnlOpcoes.SendToBack;
        pnlResult.BringToFront;
     end;
     MsgDlg('Operação Interrompida com Erros.','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  for i := 0 to chklstPatro.Items.Count - 1 do
  begin
     if (not chklstPatro.checked[i])
     then continue;

     
     If (chkIntegra.Checked) And (Not VerificaDadosIntegracao(qryAux, sAnoMesCobrancaTela, qryPatro.FieldByName('IdPessoa').AsInteger))
      Then Begin
        If dtmBaseDados.dbBaseDados.InTransaction
         Then dtmBaseDados.dbBaseDados.RollBack;
        frmAguarde.Apaga;
        pnlProgresso.Visible := False;
        pnlProgresso.SendToBack;
        pnlResult.BringToFront;
        MsgDlg('****'+#13+#10+''+#13+#10+
               'Foram encontrados problemas na parametrização contábil/financeira '+#13+#10+
               'necessária ao processamento de Alimentação Mensal de Reservas.'+#13+#10+''+#13+#10+
               'O processo não pode continuar até que estes problemas sejam '+#13+#10+
               'resolvidos.'+#13+#10+''+#13+#10+
               'Verifique as mensagens de erro apresentadas no LOG de resultado.'+#13+#10+
               'Para as contribuições relacionadas entre com as informações ausentes '+#13+#10+
               'no menu Cadastros / Integração com Financeiro / Cadastro Geral.'+
               #13+#10+''+#13+#10+'****'+#13#10#13#10,
               'Alerta', mtWarning, [mbOk, mbHelp], 0);
        Exit;
      End;
     

     if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive, loPartialKey])
     then strPatro := qryPatro.FieldByName('IdPessoa').AsString;

     lblTitulo.Caption   := 'Patrocinadora : '+qryPatro.FieldbyName('NOME').AsString;
     lblSubTitulo.Caption := '';
     lblSubTitulo2.Caption := '';
     Application.ProcessMessages;

     // Verificar se o mes/ano de cobranca indicado na tela é o ano/mes de cobranca de 13o.
     // para a patrocinadora corrente
     for j := 0 to chklstPlano.Items.Count - 1 do
     begin
        if (not chklstPlano.checked[J])
        then continue;

        if not qryPlano.Locate('Nome',Trim(chklstPlano.items[J]),[locaseinsensitive, loPartialKey]) then
        begin
           memResult.Lines.Add('');
           memResult.Lines.Add('[Plano] - '+chklstPlano.items[j]+'- Plano não encontrado');
           memResult.Lines.Add('');
           continue;
        end;

        
        if (Trim(edNome.Text) <> '') and
           (( qryPatro.FieldbyName('IDPESSOA').AsString    <> MontaSelectPart.ValoresChave[1]    ) or
            ( qryPlano.FieldbyName('IDPLANOPREV').AsString <> MontaSelectPart.ValoresChave[5] ) )
        then continue;

        // Verifica para todos os planos selecionados quais as suas respectivas reservas
        qryreservaxplano.close;

        

        if not chkIntegra.Checked then
        begin

           { Alterado para poder escolher se deseja processar todos os meses anteriores }
           { em aberto ou não, melhorando a performance do processo.                    }
           lblTitulo.Caption    := 'Patrocinadora : '+qryPatro.FieldbyName('NOME').AsString+' - '+'Plano : '+chklstPlano.Items[j];
           lblSubTitulo.Caption := 'Verificando Associação de Contribuições ... ';
           lblSubTitulo2.Caption := '';

           Application.ProcessMessages;

           sSQLReservaPlano := MontaQueryReservaPlano(QryPatro.FieldByName('IDPESSOA').AsInteger,
                                                      QryPlano.FieldByName('IDPLANOPREV').AsInteger,
                                                      sAnoMesCobrancaTela,
                                                      ChBxProcessaAnteriores.Checked);
           QryReservaxPlano.SQL.Clear;
           QryReservaxPlano.SQL.Add(sSQLReservaPlano);
           QryReservaxPlano.Open;
           


           // Se não existe nenhuma reserva para o plano corrente
           if qryReservaxPlano.IsEmpty then  bErro := True;

           pnlProgresso.Update;
           frmCalculaReservaPart.Update;
           Application.ProcessMessages;

           if bCancelaenvio
           then begin
                memResult.Lines.Add('***********************************');
                memResult.Lines.Add('Processo interrompido pelo usuário.');
                memResult.Lines.Add('***********************************');
                Exit;
           end;

           lblSubTitulo.Caption := 'Atualizando Reservas Indexadas ... ';
           lblSubTitulo2.Caption := '';
           if not AtualizaReservasIndexadas then begin
             bErro := True;
             { Caso tenha ocorrido problemas com a Atualização das reservas Cancela }
             btncancelaprogressClick(Sender);
             Exit;
           end;


           // INICIO - SOL129365 - Daniel Begnami
           pBarWhile1.Min      := 0;
           pBarWhile1.Position := 0;
           pBarWhile1.Step     := 1;
           pBarWhile1.Max      := qryReservaxPlano.RecordCount;

           pBarGeral.MinValue  := 0;
           pBarGeral.Progress  := 0;
           pBarGeral.MaxValue  := 4;

           sIdRegraMotivoMes := '';

           pBarGeral.Progress := 1;
           // FIM - SOL129365 - Daniel Begnami

           qryReservaxPlano.First;
           while not qryReservaxPlano.Eof do
           begin
                lblSubTitulo.Caption := 'Processando Contribuição No. '+qryReservaxPlano.FieldByName('IdContribuicao').AsString+
                                        '('+qryReservaXPlano.FieldByName('NomeContribuicao').AsString+') ...';
                lblSubTitulo2.Caption := '';

                iIdContribAtual    := qryReservaxPlano.FieldByName('IdContribuicao').AsInteger;
                iIdRegraRateioAtual := qryReservaxPlano.FieldByName('IDRGVLRMAXRATEIO').AsInteger;


                if iIdRegraRateioAtual  > 0 then
                begin

                   if pos(qryReservaxPlano.FieldByName('IDRGVLRMAXRATEIO').AsString+
                       qryReservaxPlano.FieldByName('IDMOTIVO').AsString+
                       qryReservaxPlano.FieldByName('MESREFERENCIA').AsString,
                       sIdRegraMotivoMes)>0 then
                   begin
                      qryReservaxPlano.Next;
                      pBarWhile1.position         := pBarWhile1.position + 1;
                      continue;
                   end
                   else
                   begin
                      sIdRegraMotivoMes := sIdRegraMotivoMes + ','+qryReservaxPlano.FieldByName('IDRGVLRMAXRATEIO').AsString+
                              qryReservaxPlano.FieldByName('IDMOTIVO').AsString+
                              qryReservaxPlano.FieldByName('MESREFERENCIA').AsString;
                   end;
                end;

                dPercentual        := 0;
                strReserva         := '';
                bErro              := False;
                bPossuiPercentual  := False;
                cont               := cont + 1;

                while (iIdContribAtual = qryReservaxPlano.FieldByName('IdContribuicao').AsInteger) and
                      (not qryReservaxPlano.Eof) do
                begin

                   lblSubTitulo2.Caption := 'Alimentando a Reserva : '+ qryReservaXPlano.FieldByName('Nome').AsString +' ...' ;
                   pnlProgresso.Update;
                   Application.ProcessMessages;
                   frmCalculaReservaPart.update;
                   if bCancelaenvio then
                   begin
                        memResult.Lines.Add('***********************************');
                        memResult.Lines.Add('Processo interrompido pelo usuário.');
                        memResult.Lines.Add('***********************************');
                        Exit;
                   end;

                   if (qryreservaxplano.FieldByName('FLGCOLETIVA').asString = '0')
                   then begin //se reserva é individual
                      PreparaQry ('', sAnoMesCobrancaTela, ChBxProcessaAnteriores.Checked );
                      if ExecutaQuery(qryReservasACalcular,
                                      qryReservaxPlano.FieldbyName('IdTipoReserva').AsInteger,
                                      qryPlano.FieldbyName('IdPlanoPrev').AsInteger,
                                      qryReservaxPlano.FieldbyName('IdContribuicao').AsInteger,
                                      qryReservaxPlano.FieldbyName('FlgControle').AsInteger,
                                      qryReservaxPlano.FieldbyName('IdMotivo').AsInteger,
                                      qryReservaxPlano.FieldbyName('MesReferencia').AsString)
                      then begin

                          if not GeraHistorico(qryReservaXPlano.FieldByName('Nome').AsString,chklstPlano.Items[j])
                          then bErro := True
                          else begin
                             strReserva   := qryreservaxplano.fieldbyname('idtiporeserva').AsString;
                             // Verificar se a contribuicao é processada por percentual para alguma reserva
                             if (qryReservaxPlano.FieldByName('Percentual').AsString <> '0')
                             then begin
                                bPossuiPercentual := True;
                                dPercentual       := dPercentual + qryReservaxPlano.FieldByName('Percentual').AsFloat;
                             end;
                          end;
                      end;
                   end
                   else begin // Se reserva é coletiva


                      PreparaQryColetiva ('', sAnoMesCobrancaTela );

                      if ExecutaQuery( qryReserva,
                                       qryReservaxPlano.FieldbyName('IdTipoReserva').AsInteger,
                                       qryPlano.FieldbyName('Idplanoprev').AsInteger,
                                       qryReservaxPlano.FieldbyName('IdContribuicao').AsInteger,
                                       qryReservaxPlano.FieldbyName('FlgControle').AsInteger,
                                       qryReservaxPlano.FieldbyName('IdMotivo').AsInteger,
                                       qryReservaxPlano.FieldbyName('MesReferencia').AsString)
                      then begin

                         if not CalculaColetiva(qryReservaXPlano.FieldByName('Nome').AsString,chklstPlano.Items[j])
                         then bErro := True
                         else begin
                            // Verificar se a contribuicao é processada por percentual para alguma reserva
                            if (qryReservaxPlano.FieldByName('Percentual').AsString <> '0')
                            then begin
                               bPossuiPercentual := True;
                               dPercentual       := dPercentual + qryReservaxPlano.FieldByName('Percentual').AsFloat;
                            end;
                            strReserva := qryReservaxPlano.fieldbyname('IdTipoReserva').AsString;
                         end;
                      end;
                   end;
                   qryReservaxPlano.Next;
                   pBarWhile1.position         := pBarWhile1.position + 1;
                end; // enquanto for a mesma contribuicao

                if (strReserva <> '') and (not bErro)
                    and ( (dPercentual >= 100) or (not bPossuiPercentual) )
                then begin

                   // Atualizar flag no histórico dizendo que reserva já foi calculada
                   if (qryreservaxplano.FieldByName('FLGRESERVAULTCOT').AsInteger = 1) and
                      (IntToStr(iIdFundacao) <> strPatro )
                   then begin

                      qryAux.Close;
                      qryAux.SQL.Clear;

                      sSql:=       ' UPDATE HSTCONTRIBPREV SET FLGCALCRESERVA = 1 ';

                      { Caso processe os anteriores altera o filtro da query }
                      If ChBxProcessaAnteriores.Checked = True Then Begin
                        sSql:=sSql + ' WHERE  (MESCOBRANCA    <= '''+sAnoMesCobrancaTela+''') ';
                      End Else Begin
                        sSql:=sSql + ' WHERE  (MESCOBRANCA     = '''+sAnoMesCobrancaTela+''') ';
                      End;


                      if Trim(edNome.Text) <> ''
                      then sSql:=sSql +  ' AND (IDPESSOA = '+OraNumero(MontaSelectPart.ValoresChave[0])+') ';

		      sSql:=sSql + ' AND    (IDPESSJUR      = '+strPatro+ ') ';

                      sSql:=sSql + ' AND    (IDPLANOPREV    = ' +qryReservaxPlano.FieldByName('IdPlanoPrev').AsString+ ')';


                      if iIdRegraRateioAtual > 0 then
                      sSQL:=sSQL + ' AND   (IDCONTRIBUICAO IN (SELECT IDCONTRIBUICAO '+
                                   ' FROM RESERVAXCONTRIB '+
                                   ' WHERE IDPLANOPREV = HSTCONTRIBPREV.IDPLANOPREV '+
                                   ' AND  IDRGVLRMAXRATEIO = '+inttostr(iIdRegraRateioAtual)+') '
                      else sSQL:=sSQL + ' AND    (IDCONTRIBUICAO = '+IntToStr(iIdContribAtual)+') ';

                      sSql:=sSql + ' AND    (FLGCALCRESERVA = 0 ) ';
                      sSql:=sSql + ' AND    (VALORRECEBIDO  > 0 ) ';
                      sSql:=sSql + ' AND    (VALORRECEBIDO  IS NOT NULL ) ';

                      if rgrpTipoCobranca.ItemIndex = 0
                      then sSQL := sSQL +' AND (FLGDESCFOLHA = 1 )  '
                      else if rgrpTipoCobranca.ItemIndex = 1
                      then sSQL := sSQL +' AND (FLGDESCFOLHA = 0 )  ';

                      sSql:=sSql + ' AND (EXISTS  ( SELECT 1 '+
                                   '                FROM HISTMOVRESERVA '+
                                   '                WHERE MESREFERENCIA = HSTCONTRIBPREV.MESREFERENCIA '+
                                   '                AND IDPESSJUR = HSTCONTRIBPREV.IDPESSJUR '+
                                   '                AND IDPLANOPREV = HSTCONTRIBPREV.IDPLANOPREV '+
                                   '                AND IDPARTICIPANTE  = HSTCONTRIBPREV.IDPESSOA '+
                                   '                AND IDCONTRIBUICAO = HSTCONTRIBPREV.IDCONTRIBUICAO ))';


                      sSql:=sSql + ' AND (EXISTS  ( SELECT L.CODDOCUMENTO ';
                      sSql:=sSql + '                FROM   DOCUMENTO DOC, LANCTODOCUM L ' ;
                      sSql:=sSql + '                WHERE  L.CODDOCUMENTO = DOC.CODDOCUMENTO ';
                      sSql:=sSql + '                AND    L.CODDOCUMENTO = HSTCONTRIBPREV.CODDOCUMENTOPREV  ';
                      sSql:=sSql + '                AND    L.OPERACAO     IN (5,10)  ';
                      sSql:=ssql + '                AND    DOC.STATUS     = ''2''  )) ';


                     // INICIO - SOL129365 - Daniel Begnami

                      qryaux.sql.Add(sSql);
                     try
                       qryAux.ExecSQL;
                     except
                       memResult.Lines.Add('');
                       memResult.Lines.Add('[Plano] - '+chklstPlano.items[j]+'- Atualização do Histórico de Contribuições ');
                       memResult.Lines.Add('');
                       if dtmBaseDados.dbBaseDados.InTransaction then   rollbacktransacao;
                     end;
                     // FIM - SOL129365 - Daniel Begnami


                   end else begin

                      // INICIO - SOL129365 - Daniel Begnami
                      sSQLReservaAlimenta := 'SELECT IDPESSOA, ROWID FROM HSTCONTRIBPREV  ';

                      { Caso processe os anteriores altera o filtro da query }
                      If ChBxProcessaAnteriores.Checked = True Then Begin
                        sSQLReservaAlimenta:=sSQLReservaAlimenta + ' WHERE  (MESCOBRANCA    <= '''+sAnoMesCobrancaTela+''') ';
                      End Else Begin
                        sSQLReservaAlimenta:=sSQLReservaAlimenta + ' WHERE  (MESCOBRANCA     = '''+sAnoMesCobrancaTela+''') ';
                      End;


                      if Trim(edNome.Text) <> ''
                      then sSQLReservaAlimenta:=sSQLReservaAlimenta + ' AND (IDPESSOA = '+OraNumero(MontaSelectPart.ValoresChave[0])+') ';

                      sSQLReservaAlimenta:=sSQLReservaAlimenta + ' AND    (IDPESSJUR      = '  + strPatro + ') ';

                      sSQLReservaAlimenta:=sSQLReservaAlimenta + ' AND    (IDPLANOPREV    = '  +qryReservaxPlano.FieldByName('IdPlanoPrev').AsString+ ')';
                      sSQLReservaAlimenta:=sSQLReservaAlimenta + ' AND    (VALORRECEBIDO  > 0)    ';
                      sSQLReservaAlimenta:=sSQLReservaAlimenta + ' AND    (VALORRECEBIDO  IS NOT NULL)    ';
                      sSQLReservaAlimenta:=sSQLReservaAlimenta + ' AND    (FLGCALCRESERVA = 0) ';

                      if rgrpTipoCobranca.ItemIndex = 0
                      then sSQLReservaAlimenta := sSQLReservaAlimenta +' AND (FLGDESCFOLHA = 1 )  '
                      else if rgrpTipoCobranca.ItemIndex = 1
                      then sSQLReservaAlimenta := sSQLReservaAlimenta +' AND (FLGDESCFOLHA = 0 )  ';

                      sSQLReservaAlimenta:=sSQLReservaAlimenta + ' AND (EXISTS  ( SELECT 1 '+
                                   '                FROM HISTMOVRESERVA '+
                                   '                WHERE MESREFERENCIA = HSTCONTRIBPREV.MESREFERENCIA '+
                                   '                AND IDPESSJUR       = HSTCONTRIBPREV.IDPESSJUR '+
                                   '                AND IDPLANOPREV     = HSTCONTRIBPREV.IDPLANOPREV '+
                                   '                AND IDPARTICIPANTE  = HSTCONTRIBPREV.IDPESSOA '+
                                   '                AND IDCONTRIBUICAO  = HSTCONTRIBPREV.IDCONTRIBUICAO ))';

                      sSQLReservaAlimenta:=sSQLReservaAlimenta + ' AND    (EXISTS ( SELECT PPP.IDPESSOA  ' ;
                      sSQLReservaAlimenta:=sSQLReservaAlimenta + '                  FROM   RESERVAXPLANO R ,RESERVAXCONTRIB RXC, PARTPREVPLAN PPP,   '+
                                   '                         RESERVAPART REP, HSTCONTRIBPREV HST                       ';
                      sSQLReservaAlimenta:=sSQLReservaAlimenta + '                  WHERE  HST.MESREFERENCIA         = HSTCONTRIBPREV.MESREFERENCIA  '+
                                   '                  AND    HST.MESCOBRANCA           = HSTCONTRIBPREV.MESCOBRANCA    '+
                                   '                  AND    HST.IDPESSJUR             = HSTCONTRIBPREV.IDPESSJUR      '+
                                   '                  AND    HST.IDPLANOPREV           = HSTCONTRIBPREV.IDPLANOPREV    '+
                                   '                  AND    HST.IDPESSOA              = HSTCONTRIBPREV.IDPESSOA       '+
                                   '                  AND    HST.IDCONTRIBUICAO        = HSTCONTRIBPREV.IDCONTRIBUICAO '+
                                   '                  AND    (NVL(HST.VALORRECEBIDO,0) > 0)                            ';
                       sSQLReservaAlimenta:=sSQLReservaAlimenta + '                 AND    (R.IDPLANOPREV            = HST.IDPLANOPREV)              ';
                       sSQLReservaAlimenta:=sSQLReservaAlimenta + '                 AND    (RXC.IDTIPORESERVA        = R.IDTIPORESERVA)              ';
                       sSQLReservaAlimenta:=sSQLReservaAlimenta + '                 AND    (PPP.IDPLANOPREV          = HST.IDPLANOPREV)              ';
                       sSQLReservaAlimenta:=sSQLReservaAlimenta + '                 AND    (PPP.IDPESSJUR            = HST.IDPESSJUR)                ';
                       sSQLReservaAlimenta:=sSQLReservaAlimenta + '                 AND    (PPP.IDPESSOA             = HST.IDPESSOA)                 ';
                       sSQLReservaAlimenta:=sSQLReservaAlimenta + '                 AND    (PPP.SEQPROPOSTA          = HST.SEQPROPOSTA)              ';
                       sSQLReservaAlimenta:=sSQLReservaAlimenta + '                 AND    (REP.IDPLANOPREV          = HST.IDPLANOPREV)              ';
                       sSQLReservaAlimenta:=sSQLReservaAlimenta + '                 AND    (REP.IDPESSJUR            = HST.IDPESSJUR)                ';
                       sSQLReservaAlimenta:=sSQLReservaAlimenta + '                 AND    (REP.IDTIPORESERVA        = RXC.IDTIPORESERVA)            ';

                       sSQLReservaAlimenta:=sSQLReservaAlimenta + '                 AND    (REP.IDPESSOA = HST.IDPESSOA OR REP.IDPESSOA = HST.IDPESSJUR)  ';

                       sSQLReservaAlimenta:=sSQLReservaAlimenta + '                 AND    (REP.SEQPROPOSTA          = HST.SEQPROPOSTA )             ';
                       sSQLReservaAlimenta:=sSQLReservaAlimenta + '                 AND    (R.ANALITICOSINTETI       = ''A'' )                       ';
                       sSQLReservaAlimenta:=sSQLReservaAlimenta + '                 AND    (RXC.IDCONTRIBUICAO       = HST.IDCONTRIBUICAO )          ';

                       if iIdRegraRateioAtual > 0 then
                       sSQLReservaAlimenta:=sSQLReservaAlimenta + ' AND  RXC.IDPLANOPREV = HSTCONTRIBPREV.IDPLANOPREV '+
                                    ' AND  RXC.IDRGVLRMAXRATEIO = '+inttostr(iIdRegraRateioAtual)+' )) '
                       else sSQLReservaAlimenta:=sSQLReservaAlimenta + ' AND    (RXC.IDCONTRIBUICAO = '+IntToStr(iIdContribAtual)+') )) ';

                      sSQLReservaAlimenta := sSQLReservaAlimenta + ' ORDER BY IDPESSOA ';

                      qryReservaAlimenta.close;
                      qryReservaAlimenta.SQL.Clear;
                      qryReservaAlimenta.SQL.Add(sSQLReservaAlimenta);

                      pBarGeral.Progress := 2;

                      qryReservaAlimenta.open;

                      pBarAlimenta.Min      := 0;
                      pBarAlimenta.Position := 0;
                      pBarAlimenta.Step     := 1;
                      pBarAlimenta.Max      := qryReservaAlimenta.RecordCount;

                      iComitaReservaAlimenta := 1;

                      while not qryReservaAlimenta.Eof do
                      begin

                        qryAux.Close;
                        qryAux.SQL.Clear;
                        sSql:=       ' UPDATE HSTCONTRIBPREV SET FLGCALCRESERVA = 1 WHERE ROWID = ' + QuotedStr(qryReservaAlimenta.FieldByName('ROWID').AsString);

                        qryaux.sql.Add(sSql);
                        qryAux.ExecSQL;

                        if iComitaReservaAlimenta mod 1000 = 0 then
                        begin
                          try
                            if dtmBaseDados.dbBaseDados.InTransaction then
                              dtmBaseDados.dbBaseDados.Commit;
                          except
                            memResult.Lines.Add('');
                            memResult.Lines.Add('[Plano] - '+chklstPlano.items[j]+'- Atualização do Histórico de Contribuições ');
                            memResult.Lines.Add('');
                            if dtmBaseDados.dbBaseDados.InTransaction then
                              rollbacktransacao;
                          end;
                          if not dtmBaseDados.dbBaseDados.InTransaction then
                            dtmBaseDados.dbBaseDados.StartTransaction;
                        end;

                        qryReservaAlimenta.Next;
                        inc(iComitaReservaAlimenta);
                        pBarAlimenta.Position := pBarAlimenta.Position + 1;

                      end;

                      try
                        if dtmBaseDados.dbBaseDados.InTransaction then
                          dtmBaseDados.dbBaseDados.Commit;
                      except
                        memResult.Lines.Add('');
                        memResult.Lines.Add('[Plano] - '+chklstPlano.items[j]+'- Atualização do Histórico de Contribuições ');
                        memResult.Lines.Add('');
                        if dtmBaseDados.dbBaseDados.InTransaction then
                          rollbacktransacao;
                      end;

                      // FIM - SOL129365 - Daniel Begnami

                   end;

                end;

                // Dar commit dentro do loop para não estourar a área de rollback
                if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;
                dtmBaseDados.dbBaseDados.StartTransaction;
                iContadorCommit := 0;

           end; // while nas contribuicoes

        end; //if not chkIntegra.Checked

        pBarGeral.Progress := 3;  // SOL129365 - Daniel Begnami

        if bIntegraContab then 
        begin
           lblTitulo.Caption    := 'Patrocinadora : '+qryPatro.FieldbyName('NOME').AsString+' - '+'Plano : '+chklstPlano.Items[j];
           lblSubTitulo.Caption := 'Contabilizando...';
           lblSubTitulo2.Caption := '';

           if not ContabilizaAlimentacaoReserva( qryAux,
                                                 StrToInt(strPatro),
                                                 qryPlano.FieldByName('IdPlanoPrev').AsInteger,
                                                 chklstPatro.Items[i],chklstPlano.Items[j])
           then begin
              memResult.Lines.Add('');
              memResult.Lines.Add('[Patro] - '+chklstPatro.Items[i]+'[Plano] - '+chklstPlano.items[j]+'- Erro na Contabilização da Reserva');
              memResult.Lines.Add('');
              RollBackTransacao;
           end;
        end;

     end;//for na lista de planos

     pBarGeral.Progress := 4;  // SOL129365 - Daniel Begnami

     strPatro := '';
  end; // for na lista de patros

    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;


  memResult.Lines.Add('Operação realizada com sucesso');

  pnlProgresso.Visible := False;
  pnlfundo.enabled     := True;
  pnlProgresso.Sendtoback ;


  if not(bErro)
  then begin
    qryReservasACalcular.Close;
    if dtmBaseDados.dbBaseDados.InTransaction then   dtmBaseDados.dbBaseDados.Commit;
  end
  else begin
    qryReservasACalcular.Close;
    if dtmBaseDados.dbBaseDados.InTransaction then    dtmBaseDados.dbBaseDados.RollBack;
  end;
  qryReservasACalcular.UnPrepare;

  if chkResult.checked
  then begin
     pnlOpcoes.SendToBack;
     pnlResult.BringToFront;
  end;

  TiraQuery(qryAux);
end;


procedure TfrmCalculaReservaPart.btncancelaprogressClick(Sender: TObject);
begin
  pnlfundo.enabled:=True;
  pnlprogresso.visible:=False;
  bcancelaenvio := True;

  if dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.RollBack;
  with qryAux do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT 1 FROM DUAL');
    Open;
    Close;
 end;

 Application.ProcessMessages;
 frmCalculaReservaPart.update;
  inherited;
end;


//função que para cada registro do histórico
function  TfrmCalculaReservaPart.AchaAlteradorAtraso(qryaux,qrydados : twwquery ; var sValorAlt : String) : Boolean;
begin
   result := False;
   sValorAlt := '0';

   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add(' SELECT NVL(SUM(H.VALOR),0) VALOR '+
                  ' FROM HSTATRASOCONTRIB H , ALTERADORXCONTRIB AL '+
                  ' WHERE '+
                  ' (H.MESREFERENCIA =   '''+qrydados.fieldbyname('MESREFERENCIA').AsString+''')  '+
                  ' AND (H.NUMRECEBIMENTO =  '+qrydados.fieldbyname('NUMRECEBIMENTO').AsString+') '+
                  ' AND (H.MESCOBRANCA =  '''+qrydados.fieldbyname('MESCOBRANCA').AsString+''') '+
                  ' AND (H.IDMOTIVO = '+qrydados.fieldbyname('IDMOTIVO').AsString+') '+
                  ' AND (AL.FLGATRASO =  1) '+
                  ' AND (AL.IDCONTRIBUICAO =  '+qrydados.fieldbyname('IDCONTRIBUICAO').AsString+') '+
                  ' AND (AL.CODALTERADOR = H.CODALTERADOR) '+
                  ' AND (AL.FLGCALCRESERVA = 1) '+
//                  ' HAVING SUM(VALOR) IS NOT NULL '); //Everson TIBERO
                  ' HAVING SUM(H.VALOR) IS NOT NULL '); //Everson TIBERO
   qryaux.open;

   if qryaux.isempty
   then result := False
   else
   begin
      sValorAlt := qryaux.fieldbyname('VALOR').AsString;
      result := True;
   end;
end;


procedure TfrmCalculaReservaPart.btnokClick(Sender: TObject);
begin
  inherited;
  pnlresult.visible:=False;

end;

procedure TfrmCalculaReservaPart.bbtnDesfazerClick(Sender: TObject);
var strPatro,
    strPlano,
    sAnoMesReferencia,
    sSQL, sMsgErro               : string;
    i                  : integer;
    iIdPessoaAtual,
    iIdReservaAtual,
    
    iIdPessJurAtual,
    iIdPlanoPrevAtual : longint;

    dTotalReserva      : double;

    bDesfaz13          : Boolean;
    sDataDesfazer      : string; 
    sCampoData         : String; 
begin
  inherited;
  strPlano       := ' ';
  strPatro       := ' ';

  // ***** Preencher ano/mes indicado na tela
  if Trim(cmbMesRef.Text) = ''
  then begin
     MsgDlg('Mês de Cobrança do Cálculo não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     cmbMesRef.SetFocus;
     Exit;
  end;

  if Trim(spedAnoRef.Text) = ''
  then begin
     MsgDlg('Ano de Cobrança do Cálculo não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     spedAnoRef.SetFocus;
     Exit;
  end;

  PedeInfAux( 'Data da Alimentação',
              'Informe a data da alimentação a desfazer (branco para todas do mês)',
              '', 2,
              sDataDesfazer);
  if Trim(sDataDesfazer) <> ''
  then begin
     if MsgDlg('O "Desfazer Alimentação" só desfará as alimentações feitas no dia '+sDataDesfazer+'.'+
               'Deseja continuar o "Desfazer Alimentação" ? ' ,'Confirmação',mtConfirmation,[mbYes, mbNo,mbHelp],0) = mrNo
     then begin
        Exit;
     end;
  end;

  If grpDataAlimentacao.Visible
   Then sCampoData := 'HM.DATAALIMENTACAO'
   Else sCampoData := 'HM.DATAMOV';


  sAnoMesReferencia := Trim(spedAnoRef.Text)+'/';
  if cmbMesRef.ItemIndex <= 8
  then sAnoMesReferencia := sAnoMesReferencia + '0' + IntToStr(cmbMesRef.ItemIndex+1)
  else sAnoMesReferencia := sAnoMesReferencia + IntToStr(cmbMesRef.ItemIndex+1);

  sAnoMesCobrancaTela := Trim(spedAnoRef.Text)+'/';
  if cmbMesRef.ItemIndex <= 8
  then sAnoMesCobrancaTela := sAnoMesCobrancaTela + '0' + IntToStr(cmbMesRef.ItemIndex+1)
  else sAnoMesCobrancaTela := sAnoMesCobrancaTela + IntToStr(cmbMesRef.ItemIndex+1);

  // ***** Preencher string com patrocinadoras selecionadas
  for i := 0 to chklstPatro.Items.Count - 1 do
  begin
     if not qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive,loPartialKey])
     then continue;

     if not chklstPatro.checked[i] then continue;

     // Adicionar string da patrocinadora
     strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', '
  end;  //for

  // Se existem patrocinadoras ja enviadas e nao existe nenhuma
  // patrocinadora na string de patrocinadoras a string de
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

  // ***** Preencher string com planos selecionados
  for i := 0 to chklstPlano.Items.Count - 1 do
  begin
     if qryPlano.Locate('Nome',chklstPlano.Items[i],[loCaseInsensitive,loPartialKey])
     then begin
       if chklstPlano.checked[i] // Adicionar plano a string de planos
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

  strContribuicao := '';
  qryContribuicao.First;
  while not qryContribuicao.Eof do
  begin
     if qryContribuicao.FieldByName('FLGALIMENTA').AsInteger = 1
     then begin
       if Trim(strContribuicao) = ''
       then strContribuicao := qryContribuicao.FieldByName('IDCONTRIBUICAO').AsString
       else strContribuicao := strContribuicao +','+qryContribuicao.FieldByName('IDCONTRIBUICAO').AsString;
     end;
     qryContribuicao.Next;
  end;

  // ***** Filtrar do Historico de Movimento de Reserva todas as reservas com as
  //       condições da tela
  sSQL := ' SELECT DISTINCT HM.DATAALIMENTACAO, HM.IDCONTRIBUICAO, HM.IDPESSJUR,     '+
          '        HM.IDPESSOA,        HM.IDPLANOPREV,    HM.IDTIPORESERVA,          '+
          '        HM.MESREFERENCIA ,   HM.SEQPROPOSTA,    HM.VLRCOTAS,              '+
          '        HM.IDHISTRESERVA,   RP.FLGCOLETIVA, HM.FLGENTRADA, HM.PLNCODIGO,   '+
          '        HM.IDPARTICIPANTE '+
          ' FROM   HSTCONTRIBPREV H, RESERVAXPLANO RP, HISTMOVRESERVA HM             ';


  if Trim(edNome.Text) <> ''
  then sSQL := sSQL + ' WHERE (H.IDPESSOA = '+OraNumero(MontaSelectPart.ValoresChave[0])+') ' 
  else sSQL := sSQL + ' WHERE  (                                                                           '+
                      '              (HM.IDPESSJUR   IN ( '+strPatro+' ) )                                 '+
                      '           OR (                                                                     '+
                      '                (HM.IDPESSJUR NOT IN ( '+strPatro+' ) )                             '+
                      '                 AND                                                                '+
                      '                (HM.IDPESSOA      IN (  SELECT  DISTINCT IDPESSOA                   '+
                      '                                        FROM    ELEGPATRO                           '+
                      '                                        WHERE   IDPESSJUR NOT IN ( '+strPatro+'   ) '+
                      '                                        AND     IDPESSJURCEDIDO IN ( '+strPatro+' ) '+
                      '                                      )                                             '+
                      '                )                                                                   '+
                      '              )                                                                     '+
                      '          )                                                                         ';


  sSQL := sSQL +' AND    (HM.IDPLANOPREV IN ('+ strPlano +') )                                             '+

  // A alimentação de reserva lê a HSTCONTRIBPREV utilizando a data informada
  // na tela para filtrar MESCOBRANCA. Já o desfazer usava a mesma data informada
  // para filtar o MESREFERENCIA mas na HISTMOVRESERVA. A mudança abaixo filtra todas
  // as contribuições alimentadas pelo MESCOBRANCA (idêntico à alimentação) e iguala
  // o MESREFERÊNCIA da HSTCONTRIBPREV com a HISTMOVRESERVA.
                ' AND    (H.MESCOBRANCA    = '''+ sAnoMesReferencia +'''  )                                '+
                ' AND    (H.MESREFERENCIA  = HM.MESREFERENCIA  )                                           ';

  if Trim(sDataDesfazer) <> ''
  then sSQL := sSQL + ' AND    (TO_CHAR('+sCampoData+',''DD/MM/YYYY'') = '+QuotedStr(sDataDesfazer)+')         ';

  if rgrpTipoCobranca.ItemIndex = 0
  then sSql := sSql + ' AND (H.FLGDESCFOLHA(+) = 1 )                                                       '
  else if rgrpTipoCobranca.ItemIndex = 1
  then sSql := sSql + ' AND (H.FLGDESCFOLHA(+) = 0 )                                                       ';

  sSQL := sSQL + ' AND    (HM.IDCONTRIBUICAO IN ('+strContribuicao+') )                                    '+ 
                 ' AND    (HM.IDPESSJUR      = H.IDPESSJUR(+) )                                            '+
                 ' AND    (HM.IDPLANOPREV    = H.IDPLANOPREV(+) )                                          '+
                 ' AND    (HM.MESREFERENCIA  = H.MESREFERENCIA(+)  )                                       '+

                 ' AND    ((HM.IDPESSOA       = H.IDPESSOA ) OR            '+
                 '        (HM.IDPESSOA   = '+IntToStr(iIdFundacao)+') )   '+ 

                 ' AND    (HM.IDCONTRIBUICAO = H.IDCONTRIBUICAO(+) )                                       '+
                 ' AND    (HM.IDPLANOPREV    = RP.IDPLANOPREV )                                            '+
                 ' AND    (HM.IDTIPORESERVA  = RP.IDTIPORESERVA)                                           '+
                 ' AND    NVL(RP.FLGTRANSFERENCIA,0) = 0                                                   '+ 
                 ' ORDER BY HM.IDPESSOA, HM.IDTIPORESERVA, HM.IDCONTRIBUICAO                               '; 

  with qryReservasACalcular do
  begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     try
        Open;
     except
        MsgDlg(' Erro ao buscar reservas para desfazer alimentação.','Erro',mtError,[mbOk, mbHelp],0);
        Exit;
     end;

     dtmBaseDados.dbBaseDados.StartTransaction;

     if not (1=1) 
     then begin
        memResult.Lines.Add(' Erro na Gravação do Log.');
        if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
        if chkResult.checked
        then begin
           pnlOpcoes.SendToBack;
           pnlResult.BringToFront;
        end;
        MsgDlg('Operação Interrompida com Erros.','Erro',mtError,[mbOk, mbHelp],0);
        Exit;
     end;


     if qryPlanilhasExcluir.Active and qryPlanilhasExcluir.UpdatesPending
     then qryPlanilhasExcluir.CancelUpdates;
     qryPlanilhasExcluir.Close;
     qryPlanilhasExcluir.Open;

     memResult.Lines.Add('Desfazer Alimentação de Reserva ... ');

     First;
     // Enquanto houver reserva para desalimentar faça :
     // 1. Enquanto a contribuicao for da mesma reserva fazer
     //    1.1. TotalReserva := TotalReserva + valor desta contribuicao
     //    1.2. Atualizar historico desta contribuicao como nao alimentada
     //    1.3. Apagar historico de reserva
     // 2. Atualizar reserva com TotalReserva

     i := 0;
     while not Eof do
     begin
        iIdPessoaAtual := FieldByName('IDPESSOA').AsInteger;
        
        iIdPessJurAtual   := FieldByName('IDPESSJUR').AsInteger;
        iIdPlanoPrevAtual := FieldByName('IDPLANOPREV').AsInteger;
        

        while (iIdPessoaAtual = FieldByName('IdPessoa').AsInteger) and (not Eof) do
        begin
           iIdReservaAtual := FieldByName('IdTipoReserva').AsInteger;
           dTotalReserva   := 0;


           
           while (iIdReservaAtual = FieldByName('IdTipoReserva').AsInteger) and (not Eof) and
                 (iIdPessoaAtual = FieldByName('IdPessoa').AsInteger)  do
           
           begin
              inc(i);
              frmAguarde.Mostra('Desfazendo Alimentação - Registros : '+IntToStr(i));
              Application.ProcessMessages;

              
              if  FieldByName('FLGENTRADA').AsInteger = 1 then
                 dTotalReserva := dTotalReserva + FieldByName('VlrCotas').AsFloat
              else
                 dTotalReserva := dTotalReserva - FieldByName('VlrCotas').AsFloat;
              

              qryAux.Close;
              qryAux.SQL.Clear;

              
              if FieldByName('FlgColetiva').AsInteger = 0
              then
              begin
                 qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV SET FLGCALCRESERVA = 0, VALORPARARESERVA = 0 '+ 
                             ' WHERE  MESREFERENCIA  = '''+FieldbyName('MesReferencia').AsString+''''+
                             ' AND    MESCOBRANCA    = '''+sAnoMesCobrancaTela+''' ');
                                                          

                 
                 if Trim(edNome.Text) <> ''
                 then qryAux.SQL.Add(' AND (IDPESSOA = '+OraNumero(MontaSelectPart.ValoresChave[0])+') ');

                 qryAux.SQL.Add(' AND    IDPESSJUR      = '''+FieldbyName('IdPessJur').AsString+''' '+
                             ' AND    IDPLANOPREV    = '''+FieldbyName('IdPlanoPrev').AsString+''' '+
                             ' AND    IDPESSOA       = '''+FieldbyName('IdPessoa').AsString+''' '+
                             ' AND    SEQPROPOSTA    = '''+FieldbyName('SeqProposta').AsString+''' '+
                             ' AND    IDCONTRIBUICAO = '''+FieldbyName('IdContribuicao').AsString+''' ');
              end
              else qryAux.SQL.Add(' UPDATE HSTCONTRIBPREV SET FLGCALCRESERVA = 0, VALORPARARESERVA = 0 '+ 
                             ' WHERE  MESREFERENCIA  = '''+FieldbyName('MesReferencia').AsString+''''+
                             ' AND    MESCOBRANCA    = '''+sAnoMesCobrancaTela+''' '+
                             ' AND    IDPESSJUR      = '''+FieldbyName('IdPessJur').AsString+''' '+
                             ' AND    IDPLANOPREV    = '''+FieldbyName('IdPlanoPrev').AsString+''' '+
                             ' AND    IDCONTRIBUICAO = '''+FieldbyName('IdContribuicao').AsString+''' '+
                             ' AND    IDPESSOA = '+ qryReservasACalcular.fieldbyname('IDPARTICIPANTE').AsString +' '); 


              
              if rgrpTipoCobranca.ItemIndex = 0 then
                qryaux.sql.add(' AND (FLGDESCFOLHA = 1 )  ')
              else
                if rgrpTipoCobranca.ItemIndex = 1 then
                  qryaux.sql.add(' AND (FLGDESCFOLHA = 0 )  ');
              

              
              try
                 qryAux.ExecSQL;
              except
                 frmAguarde.Apaga;
                 if dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.RollBack;
                 MsgDlg('Erro ao atualizar histórico de contribuições.','Erro',mtError,[mbOk, mbHelp],0);
                 Exit;
              end;

              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add(' DELETE FROM HISTMOVRESERVA '+
                             ' WHERE  IDHISTRESERVA = '+FieldbyName('IdHistReserva').AsString+
                             ' AND    IDPESSJUR      = '+FieldbyName('IdPessJur').AsString+
                             ' AND    IDPLANOPREV    = '+FieldbyName('IdPlanoPrev').AsString+
                             ' AND    IDPESSOA       = '+FieldbyName('IdPessoa').AsString+
                             ' AND    SEQPROPOSTA    = '+FieldbyName('SeqProposta').AsString+
                             ' AND    IDTIPORESERVA  = '+IntToStr(iIdReservaAtual) );
              try
                 qryAux.ExecSQL;
              except
                 frmAguarde.Apaga;
                 if dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.RollBack;
                 MsgDlg('Erro ao apagar movimento de reserva.','Erro',mtError,[mbOk, mbHelp],0);
                 Exit;
              end;

              Next;
           end; // while a mesma reserva da mesma pessoa


           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(' UPDATE RESERVAPART SET VALORRESERVA = VALORRESERVA - '+OraNumero(FloatToStr(dTotalReserva))+
                          ' WHERE  '+
                          { Utiliza as variaveis previamente preenchidas }
                          '        IDPESSJUR      = '+ IntToStr(iIdPessJurAtual)   +
                          ' AND    IDPLANOPREV    = '+ IntToStr(iIdPlanoPrevAtual) +
                          ' AND    IDPESSOA       = '+ IntToStr(iIdPessoaAtual)    +

                          ' AND    SEQPROPOSTA    = '+FieldbyName('SeqProposta').AsString+
                          ' AND    IDTIPORESERVA  = '+IntToStr(iIdReservaAtual) );
           try
              qryAux.ExecSQL;
           except
              frmAguarde.Apaga;
              if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
              MsgDlg('Erro ao atualizar valor da reserva.','Erro',mtError,[mbOk, mbHelp],0);
              Exit;
           end;


           
           // O ESTORNO NAO PODE SER NESTE PONTO PORQUE PODEM TER OUTRAS RESERVAS COM
           // A MESMA PLANILHA
           if (qryReservasACalcular.fieldbyname('PLNCODIGO').AsInteger > 0) and
              (not qryPlanilhasExcluir.Locate('PLNCODIGO',qryReservasACalcular.fieldbyname('PLNCODIGO').AsInteger,[]))
           then begin
              qryPlanilhasExcluir.Insert;
              qryPlanilhasExcluir.Fieldbyname('PLNCODIGO').AsInteger      := qryReservasACalcular.Fieldbyname('PLNCODIGO').AsInteger;
              qryPlanilhasExcluir.Fieldbyname('MESREFERENCIA').AsString   := qryReservasACalcular.Fieldbyname('MESREFERENCIA').AsString;
              qryPlanilhasExcluir.Fieldbyname('DATAALIMENTACAO').AsString := qryReservasACalcular.Fieldbyname('DATAALIMENTACAO').AsString;
              qryPlanilhasExcluir.Post;
           end;


        end; // while a mesma pessoa
     end; // while not Eof
  end; // with

  memResult.Lines.Add(' - Movimentos de Reserva desfeitos [OK] ');

  // ESTORNAR PLANILHAS CONTABEIS

  memResult.Lines.Add(' - Verificando Integração Contábil ...');
  qryPlanilhasExcluir.First;
  while not qryPlanilhasExcluir.Eof do
  begin
     if qryPlanilhasExcluir.fieldbyname('PLNCODIGO').AsInteger <= 0
     then begin
        qryPlanilhasExcluir.Next;
        Continue;
     end;
     if not EstornaContab(qryaux,
                          qryPlanilhasExcluir.fieldbyname('MESREFERENCIA').AsString,
                          qryPlanilhasExcluir.fieldbyname('PLNCODIGO').AsString,
                          qryPlanilhasExcluir.fieldbyname('DATAALIMENTACAO').AsString,
                          sMsgErro)
     then begin
        frmAguarde.Apaga;
        if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Erro ao estornar contabilização.'+sMsgErro+'','Erro',mtError,[mbOk, mbHelp],0);
        Exit;
     end;
     memResult.Lines.Add('   Planilha '+qryPlanilhasExcluir.fieldbyname('PLNCODIGO').AsString+' excluída com sucesso. ');
     qryPlanilhasExcluir.Next;
  end;

  memResult.Lines.Add(' - Integração Contábil desfeita [OK] ');
  frmAguarde.Apaga;

  if MsgDlg('Desfazer Alimentação do Mês '+sAnoMesReferencia+' finalizado com sucesso. '+#13+
            'Deseja efetivar a operação ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes then
  begin
    try
      if dtmBaseDados.dbBaseDados.InTransaction then     dtmBaseDados.dbBaseDados.Commit;
    except
      MsgDlg('Erro ao efetivar a operação.','Erro',mtError,[mbOk, mbHelp],0);
      Exit;
    end;
  end
  else
  begin
    try
      if dtmBaseDados.dbBaseDados.InTransaction then   dtmBaseDados.dbBaseDados.Rollback;
    except
      MsgDlg('Erro ao cancelar a operação.','Erro',mtError,[mbOk, mbHelp],0);
      Exit;
    end;
  end;

  MsgDlg('Processo finalizado com sucesso.','Informação',mtInformation,[mbOk, mbHelp],0);
end;


function TfrmCalculaReservaPart.ContabilizaAlimentacaoReserva( qryAux        : TwwQuery;
                                                               piIdPessJur,
                                                               piIdPlanoPrev : longint;
                                                               sNomePatro, sNomePlano : String ) : boolean;
var
   iPlnCodigo            : longint;

   sMsgErro,
   sContaDebito,
   sContaCredito,
   sCCustoDebito,
   sCCustoCredito, sSql        : string;
   bPartidaDobrada,        
   bInverteDebCre        : boolean;

   dValorMovimentoReal   : double;
   iUltimoPlnCodigo      : longint; //Renato Visoni SOL 127152 Kintana 671178
begin
   Result := False;

   iPlnCodigo := 0;
   iUltimoPlnCodigo :=0;//Renato Visoni SOL 127152 Kintana 671178

   // Total líquido alimentado agrupado por patro e plano
   with qryAux do
   begin
      Close;
      SQL.Clear;
      sSql := '  SELECT P.IDPESSJUR, P.IDPLANOPREV, P.IDTIPORESERVA, P.PLACONTAD, P.PLANO, '+
         'P.PLACONTAC, P.UNIDNEGOC, P.IDPESSOA, P.CODSUBCONTA,                             '+
         'P.CODCENTROCUSTOD, P.IDEMPRESA, P.CODCENTROCUSTOC, RP.NOME,                      '+
         'RP.FLGCOLETIVA,                                                                  '+
         'TO_CHAR(HST.DATAALIMENTACAO, ''DD/MM/YYYY'') AS DATAALIMENTACAO,                 '+

         //Everson TIBERO - Início
         {' ROUND(ABS(ABS(SUM(DECODE(FLGENTRADA,1,VLRCOTAS*VALORINDICE,0))) -              '+
         'ABS(SUM(DECODE(FLGENTRADA,0,VLRCOTAS*VALORINDICE,0)))) ,2)  AS TOTALALIMENTADO   '+}
         ' ROUND(ABS(ABS(SUM(DECODE(HST.FLGENTRADA, 1, HST.VLRCOTAS*HST.VALORINDICE,0))) - '+
         'ABS(SUM(DECODE(HST.FLGENTRADA,0,HST.VLRCOTAS*HST.VALORINDICE,0)))) ,2)  AS TOTALALIMENTADO   '+
         //Everson TIBERO - Fim

         'FROM   HISTMOVRESERVA HST, PARAMCONTABRESERVA P, RESERVAXPLANO RP                '+
         'WHERE  HST.IDHISTRESERVA = HST.IDHISTRESERVA                                     '+
         'AND    HST.IDPESSJUR     = '+ IntToStr(piIdPessJur)                               +
         'AND    HST.IDPLANOPREV   =  '+ IntToStr(piIdPlanoPrev)                            +
         'AND    HST.IDCONTRIBUICAO IN ('+  strContribuicao +')                            '+ 
         'AND    TO_CHAR(HST.DATAALIMENTACAO, ''YYYY/MM'')  =  '''+sAnoMesCobrancaTela+''' '+ 
         'AND    HST.IDTIPORESERVA = P.IDTIPORESERVA                                       '+
         'AND    HST.PLNCODIGO     IS NULL                                                 '+
         'AND    P.IDPESSJUR       = HST.IDPESSJUR                                         '+
         'AND    P.IDPLANOPREV     = HST.IDPLANOPREV                                       '+
         'AND    RP.IDPLANOPREV    = HST.IDPLANOPREV                                       '+
         'AND    RP.IDTIPORESERVA  = HST.IDTIPORESERVA                                     '+
         'GROUP BY P.IDPESSJUR, P.IDPLANOPREV, P.IDTIPORESERVA, P.PLACONTAD, P.PLANO,      '+
         '      P.PLACONTAC, P.UNIDNEGOC, P.IDPESSOA, P.CODSUBCONTA,                       '+
         '      P.CODCENTROCUSTOD, P.IDEMPRESA, P.CODCENTROCUSTOC, RP.NOME,                '+
         '      RP.FLGCOLETIVA ,TO_CHAR(HST.DATAALIMENTACAO, ''DD/MM/YYYY'')               ';
      SQL.Add(sSql);
      Open;

      if IsEmpty
      then begin
         Result := True;
         Exit;
      end;

      // INICIO - SOL129365 - Daniel Begnami
      pBarDocs.Min      := 0;
      pBarDocs.Position := 0;
      pBarDocs.Step     := 1;
      pBarDocs.Max      := qryAux.RecordCount;
      // FIM - SOL129365 - Daniel Begnami      

      while not Eof do
      begin

         sContaDebito        := FieldByName('PLACONTAD').AsString;
         sContaCredito       := FieldByName('PLACONTAC').AsString;
         sCCustoDebito       := FieldByName('CODCENTROCUSTOD').AsString;
         sCCustoCredito      := FieldByName('CODCENTROCUSTOC').AsString;

         dValorMovimentoReal := FieldByName('TOTALALIMENTADO').AsFloat;

         // Adicionando opção de Partida-Dobrada.

         If FazQuery(qryParamContabil,
            'SELECT PACDOBRADA FROM PARAMCONTAB') Then
           If qryParamContabil.FieldByName('PACDOBRADA').AsString = 'N' Then
             bPartidaDobrada := False
           Else bPartidaDobrada := True
         Else bPartidaDobrada := False;

         If bPartidaDobrada Then
         Begin
            CtrlLancamento.InsereLancaContab ( '2',                                              // cTipoLanc 0 - Credito, 1 - Debito, 2 - Partida dobrada
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
                                               FormatDatetime('DD/MM/YYYY',StrToDate(FieldByName('DATAALIMENTACAO').AsString)),    // sDataLanc
                                               '',                                               // sNumDoc
                                               'Alimentação de Reserva',                         // sHist1
                                               Copy(sNomePatro,1,40),                            // sHist2
                                               Copy(sNomePlano,1,40),                            // sHist3
                                               Copy(FieldByName('Nome').AsString,1,40),          // sHist4
                                               '- Data : '+FieldByName('DATAALIMENTACAO').AsString,// sHist5
                                               prmTpOperReserva,                                 // sTipoOper
                                               sCCustoDebito,                                    // sCCustoD
                                               sContaDebito,                                     // sContaD
                                               sCCustoCredito,                                   // sCCustoC
                                               sContaCredito,                                    // sContaC
                                               '',                                               // sCodHist
                                               dValorMovimentoReal,                              // rValLanc
                                               False,                                            // bJunta
                                               Sistema.UsaPlanoPatro,                            // bUsaPlanoPatro
                                               -1,                                               // iIdSegregaCriter
                                               -1                                                // dDataSegregaCriter
                                             );


            if iPlnCodigo <=0 then iPlnCodigo := Trunc(CtrlLancamento.RetornoPlnCodigo);


         End Else
         Begin
            // Crédito
            CtrlLancamento.InsereLancaContab ( '1',                                              // cTipoLanc 0 - Credito, 1 - Debito, 2 - Partida dobrada
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
                                               FormatDatetime('DD/MM/YYYY',StrToDate(FieldByName('DATAALIMENTACAO').AsString)),    // sDataLanc
                                               '',                                               // sNumDoc
                                               'Alimentação de Reserva',                         // sHist1
                                               Copy(sNomePatro,1,40),                            // sHist2
                                               Copy(sNomePlano,1,40),                            // sHist3
                                               Copy(FieldByName('Nome').AsString,1,40),          // sHist4
                                               '- Data : '+FieldByName('DATAALIMENTACAO').AsString,// sHist5
                                               prmTpOperReserva,                                 // sTipoOper
                                               '',                                               // sCCustoD
                                               '',                                               // sContaD
                                               sCCustoCredito,                                   // sCCustoC
                                               sContaCredito,                                    // sContaC
                                               '',                                               // sCodHist
                                               dValorMovimentoReal,                              // rValLanc
                                               False,                                            // bJunta
                                               Sistema.UsaPlanoPatro,                            // bUsaPlanoPatro
                                               -1,                                               // iIdSegregaCriter
                                               -1                                                // dDataSegregaCriter
                                             );
            if iPlnCodigo <=0 then iPlnCodigo := Trunc(CtrlLancamento.RetornoPlnCodigo);


           // Débito
           CtrlLancamento.InsereLancaContab ( '0',                                              // cTipoLanc 0 - Credito, 1 - Debito, 2 - Partida dobrada
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
                                               FormatDatetime('DD/MM/YYYY',StrToDate(FieldByName('DATAALIMENTACAO').AsString)),    // sDataLanc
                                               '',                                               // sNumDoc
                                               'Alimentação de Reserva',                         // sHist1
                                               Copy(sNomePatro,1,40),                            // sHist2
                                               Copy(sNomePlano,1,40),                            // sHist3
                                               Copy(FieldByName('Nome').AsString,1,40),          // sHist4
                                               '- Data : '+FieldByName('DATAALIMENTACAO').AsString,// sHist5
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
                                             );
            if iPlnCodigo <=0 then  iPlnCodigo := Trunc(CtrlLancamento.RetornoPlnCodigo); 


           End; // Else - If bPartidaDobrada Then



         if iPlnCodigo <=0 then   memResult.Lines.Add('[ERRO] - '+CtrlLancamento.MessageInfo); 

         //Renato Visoni SOL 127152 Kintana 671178
          if ((iPlnCodigo > 0) and (iUltimoPlnCodigo <> iPlnCodigo))
          or ((iPlnCodigo > 0) and (pBarDocs.Position=1))
          then begin
            memResult.Lines.Add('PlnCodigo : '+ intTostr(iPlnCodigo));
            iUltimoPlnCodigo := iPlnCodigo;
          end;
         //Renato Visoni SOL 127152 Kintana 671178



         if iPlnCodigo > 0
         then begin
             // Atualizar HISTMOVRESERVA com o PLNCODIGO
             with qryGrava do
             begin
                Close;
                SQL.Clear;
                SQL.Add(' UPDATE HISTMOVRESERVA SET PLNCODIGO = '+IntToStr(iPlnCodigo)+
                        ' WHERE  IDPESSJUR       = '+ IntToStr(piIdPessJur) +
                        ' AND    IDPLANOPREV     = '+ IntToStr(piIdPlanoPrev)+
                        ' AND    IDTIPORESERVA   = '+ qryaux.FieldByName('IDTIPORESERVA').AsString+
                        ' AND    TO_CHAR(DATAALIMENTACAO,''DD/MM/YYYY'') = '''+qryaux.FieldByName('DATAALIMENTACAO').AsString+'''  '+
                        ' AND    PLNCODIGO IS NULL   ');

                try
                   ExecSQL;
                except
                   Result   := False;
                   Close;
                   Exit;
                end;
             end;
         end;

         qryAux.Next;
         pBarDocs.Position := pBarDocs.Position + 1; // SOL129365 - Daniel Begnami


      end;
   end; // with

   Result := True;
end;



function TfrmCalculaReservaPart.EstornaContab   ( qryAux : TwwQuery;
                           psAnoMesReferencia, sPlnCodigo, sDataLancto : string;
                           var sMsgErro : string) : boolean;
var
    
    bPodeExcluir : boolean;
    sData : string;
begin
   Result := False;


   if trim(sPlnCodigo) = '' then
   begin
      result := True;
      Exit;
   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT P.PLNEFETIVADO'+
                  ' FROM   PLANILHA P '+
                  ' WHERE  P.PLNCODIGO = '''+sPlnCodigo+''' ');
   qryAux.Open;
   if qryAux.IsEmpty
   then begin
     sMsgErro := ' Planilha '+sPlnCodigo+' não encontrada. ';
     Exit;
   end;
   
   bPodeExcluir := (qryAux.FieldByName('PLNEFETIVADO').AsString = 'N');
   qryAux.Close;

   
   // Verificar se existe ainda algum lançamento na histmovreserva com a planilha
   // a ser excluida. Se existir, deve ser feito um estorno com o valor apenas
   // dos registros que foram excluidos
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT ABS(SUM(DECODE(FLGENTRADA,0,VLRREAL,0)))  AS TOTALALIMENTADO '+
                  ' FROM   HISTMOVRESERVA                                                 '+
                  ' WHERE  PLNCODIGO = '+sPlnCodigo                                        );
   qryAux.Open;



   // Verificar parametro contabil de estorno/exclusao
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT PACESTORNA FROM PARAMCONTAB '+
                  ' WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   qryAux.Open;
   if qryAux.IsEmpty
   then begin
     sMsgErro := ' Parâmetros contábeis necessários ao estorno não encontrados. ';
     Exit;
   end;
   bPodeExcluir := (qryAux.FieldByName('PACESTORNA').AsString <> 'S');
   qryaux.Close;


   if (bPodeExcluir) or
      (IntegraBack.Contabilidade = 'N')
   then begin
      try
         if not CtrlLancamento.ExcluiLancaContab( Sistema.IdUsuario,                      // iUsuario
                                                  StrToInt(sPlnCodigo),                   // iPlnCodigo
                                                  Sistema.IdModulo,                       // iModuloOrigem
                                                  0,                                      // iNumLan
                                                  Sistema.UsaPlanoPatro,                  // bUsaPlanoPatro
                                                  True                                    // bExcluiPlanilha
                                                 )
         then begin
            sMsgErro := ' Erro na exclusão do lançamento.';
            Exit;
         end;
      except
        sMsgErro := ' Erro na exclusão do lançamento.';
        Exit;
      end;
   end
   else begin
      try
         if not CtrlLancamento.EstornaLancaContab( Sistema.IdUsuario,                      // iUsuario
                                                   StrToInt(sPlnCodigo),                   // iPlnCodigo
                                                   Sistema.IdModulo,                       // iModuloOrigem
                                                   Sistema.IdEmpresa,                      // iEmpresa
                                                   Sistema.UsaPlanoPatro,                  // bUsaPlanoPatro
                                                   sDataLancto                             // sDataEstorno
                                                  )
         then begin
            sMsgErro := ' Erro no estorno do lançamento.';
            Exit;
         end;

      except
        sMsgErro := ' Erro no estorno do lançamento.';
        Exit;
      end;
   end;

   Result := True;
end; //EstornaContribuicaoBANCO

procedure TfrmCalculaReservaPart.bbtnProcurarClick(Sender: TObject);
begin
  inherited;

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     edNome.Text      := MontaSelectPart.ValoresChave[2];
     edMatricula.Text := MontaSelectPart.ValoresChave[3];
     edPatro.Text     := MontaSelectPart.ValoresChave[4];
     edPlano.Text     := MontaSelectPart.ValoresChave[6];
  end;

end;

procedure TfrmCalculaReservaPart.btndesfazselecClick(Sender: TObject);
begin
  inherited;
  edNome.Text      := '';
  edMatricula.Text := '';
  edPatro.Text     := '';
  edPlano.Text     := '';
end;

{------------------------------------------------------------------------------}
{ Monta Query de Plano, podendo ou não processar messes anteriores em aberto   }
function TfrmCalculaReservaPart.MontaQueryReservaPlano(piIdPessJur, piIdPlanoPrev : Integer;
                                                       psMesCobranca : String;
                                                       pbProcessaAnteriores: Boolean): String;
begin
  Result := 'SELECT DISTINCT RP.FLGMODATUALIZACAO,    ' + 
            '  RP.IDTIPORESERVA,   RP.NOME ,  RP.FLGCONTROLE,   RP.FLGCOLETIVA, ' +
            '  PL.IDPLANOPREV,  PL.NOME NOMEPLANO,  PL.FLGRESERVAULTCOT,        ' +
            '  RC.IDCONTRIBUICAO,  RC.PERCENTUAL, RP.INDICEREAJUSTE,  RP.INDICECORRECAO,          ' +  
            '  C.NOME AS NOMECONTRIBUICAO,                                      ' +
            '  CT.FLGPARCELAMENTO, M.MOESIGLA , H.MESREFERENCIA, H.IDMOTIVO, '+
            '  RC.IDRGVLRMAXRATEIO, CT.IDREGRAVLRRESERVA,   ' + 
            '  PL.FLGTIPOBUSCACOTA, ''          '' AS DATAINDICECORRECAO  '+ 
            'FROM                                                               ' +
            '  PLANPREV PL,    CONTPREV CT,        RESERVAXPLANO RP,            ' +
            '  CONTRIBUICAO C, RESERVAXCONTRIB RC, HSTCONTRIBPREV H, MOEDA M    ' +
            'WHERE (H.IDPESSJUR         = '+ IntToStr(piIdPessjur)   +')       ' +
            '  AND (H.IDPLANOPREV       = '+ IntToStr(piIdPlanoPrev) +')        ' ;

  if Trim(edNome.Text) <> ''
  then Result := Result + ' AND (H.IDPESSOA = '+OraNumero(MontaSelectPart.ValoresChave[0])+') ';

  { Caso processe os anteriores antera o fintro da query }
  If pbProcessaAnteriores = True Then Begin
    Result := Result +
              '  AND (H.MESCOBRANCA      <= '+ QuotedStr(psMesCobranca)+') ' ;
  End Else Begin
    Result := Result +
              '  AND (H.MESCOBRANCA      =  '+ QuotedStr(psMesCobranca)+') ' ;
  End;

  Result := Result +' AND (RC.IDCONTRIBUICAO IN ('+strContribuicao +')) '+
            ' AND (NVL(H.VALORRECEBIDO,0) > 0) '+
            ' AND (NVL(H.FLGCALCRESERVA,0) = 0) '+
            ' AND (H.MESREFERENCIA = H.MESREFERENCIA) '+
            ' AND (H.SEQPROPOSTA = 1) '+
            ' AND (H.IDMOTIVO = H.IDMOTIVO) '+
            ' AND (H.IDPESSOA = H.IDPESSOA) '+
            ' AND (H.IDCONTRIBUICAO = H.IDCONTRIBUICAO) '+
            ' AND (CT.IDPLANOPREV      = H.IDPLANOPREV) '+
            ' AND (CT.IDCONTRIBUICAO   = H.IDCONTRIBUICAO) '+
            ' AND (RC.IDPLANOPREV      = H.IDPLANOPREV) '+
            ' AND (RC.IDCONTRIBUICAO   = H.IDCONTRIBUICAO) '+
            ' AND (RP.IDPLANOPREV      = H.IDPLANOPREV) '+
            ' AND (RP.IDTIPORESERVA    = RC.IDTIPORESERVA) '+
            ' AND (RP.ANALITICOSINTETI = ''A'') '+
            ' AND (PL.IDPLANOPREV       = H.IDPLANOPREV) '+
            ' AND (C.IDCONTRIBUICAO = H.IDCONTRIBUICAO) '+
            ' AND (RP.INDICECORRECAO   = M.MOECODIGO(+))  ' +
            ' ORDER BY RC.IDCONTRIBUICAO, H.MESREFERENCIA, H.IDMOTIVO, RP.FLGCOLETIVA,  RP.NOME ' ; 
                                                                       


end; { MontaQueryReservaPlano }

function TfrmCalculaReservaPart.AtualizaReservasIndexadas : boolean;
var sSQL         : string;
    sDataIndice  : string;
    dValorIndice : double;
    sAtualizadas : string;
    varFields    : Variant; 
begin
   Result := False;
   varFields := VarArrayCreate([0,1],varVariant); 

   // ATUALIZAR TODAS AS RESERVAS QUE NÃO SÃO EM COTAS, OU SEJA, SÃO INDEXADAS
   // PARA DENTRO DA ROTINA DE ALIMENTACAO APENAS JOGAR AS CONTRIBUICOES
   // POIS SE UMA RESERVA TIVER MAIS DE UMA CONTRIBUICAO E A ATUALIZACAO
   // FOR FEITA DENTRO DO LOOP DE CONTRIBUICOES, IRÁ ATUALIZAR MAIS DE UMA VEZ
   sAtualizadas := '';
   qryReservaxPlano.First;
   while not qryReservaxPlano.Eof do
   begin
      if qryReservaxPlano.FieldByName('FLGMODATUALIZACAO').AsInteger = 0
      then begin
         qryReservaxPlano.Next;
         pBarWhile1.position         := pBarWhile1.position + 1;
         continue;
      end;

      if Pos( qryReservaxPlano.FieldByName('IDTIPORESERVA').AsString, sAtualizadas) > 0
      then begin
         qryReservaxPlano.Next;
         pBarWhile1.position         := pBarWhile1.position + 1;
         continue;
      end;
      sAtualizadas := sAtualizadas +','+qryReservaxPlano.FieldByName('IDTIPORESERVA').AsString;

      // Filtrar todos os participantes que terão reservas atualizadas
      sSQL := ' SELECT DISTINCT PPP.IDPESSJUR, PPP.IDPESSOA, PPP.IDPLANOPREV, PPP.SEQPROPOSTA, SP.FLGINTERNO, PL.FLGTIPOBUSCACOTA '+
              ' FROM  HSTCONTRIBPREV HST, RESERVAPART REP, PARTPREVPLAN PPP,  ELEGPATRO ELP, SITPART SP, '+
              '       RESERVAXCONTRIB RXC, RESERVAXPLANO RXP , PLANPREV PL                               ';
      //  Possibilidade de escolher se deseja processar meses anteriores ou não
      sSql:=sSql + ' WHERE ' ;

      // Caso processe os anteriores altera o filtro da query
      If ChBxProcessaAnteriores.Checked
      Then sSQL := sSQL +' (HST.MESCOBRANCA   <= ''' + sAnoMesCobrancaTela   + ''') '
      Else sSQL := sSQL + '(HST.MESCOBRANCA    = ''' + sAnoMesCobrancaTela   + ''') ';
      sSql:=sSql + ' AND   (HST.MESREFERENCIA = HST.MESREFERENCIA ) ';

      if Trim(edNome.Text) <> ''
      then sSQL := sSQL + ' AND (HST.IDPESSOA = '+OraNumero(MontaSelectPart.ValoresChave[0])+')';
      sSql:=sSql + ' AND ( ( HST.FLGCALCRESERVA = 0) OR ' + 
                   '       ( HST.FLGCALCRESERVA = 0) )  ' + 
                   ' AND    ( NVL(HST.VALORRECEBIDO,0) > 0)                                   ';

      
      if Trim(strPatro) <> '' then
      sSQL := sSQL + ' AND    (HST.IDPESSJUR = '+strPatro+ ' ) ';

      sSQL := sSQL + ' AND    (HST.IDPLANOPREV    = '+qryReservaxPlano.FieldbyName('IDPLANOPREV').AsString+')  '+
                     ' AND    (HST.IDPESSOA = HST.IDPESSOA)  '+
                     ' AND    (HST.SEQPROPOSTA = HST.SEQPROPOSTA) ';


      if rgrpTipoCobranca.ItemIndex = 0
      then sSQL := sSQL +' AND (HST.FLGDESCFOLHA = 1 )  '
      else if rgrpTipoCobranca.ItemIndex = 1
      then sSQL := sSQL +' AND (HST.FLGDESCFOLHA = 0 )  ';

      //RESERVAPART
      sSql:=sSql +' AND    (REP.IDTIPORESERVA= '+qryReservaxPlano.FieldbyName('IDTIPORESERVA').AsString+')  '+
       ' AND    (REP.IDPLANOPREV = HST.IDPLANOPREV )                          '+
       ' AND    (REP.IDPESSOA    = HST.IDPESSOA )                             '+
       ' AND    (REP.IDPESSJUR   = HST.IDPESSJUR )                            '+
       ' AND    (REP.SEQPROPOSTA = HST.SEQPROPOSTA )                          ';


      //PARTPREVPLAN
      sSql:=sSql +' AND    (PPP.IDPESSJUR   = HST.IDPESSJUR )                 '+
       ' AND    (PPP.IDPESSOA    = HST.IDPESSOA )                             '+
       ' AND    (PPP.IDPLANOPREV = HST.IDPLANOPREV )                          '+
       ' AND    (PPP.SEQPROPOSTA = HST.SEQPROPOSTA)                           ';

      //ELEGPATRO
      sSql:=sSql +' AND    (ELP.IDPESSJUR   = HST.IDPESSJUR )                 '+
       ' AND    (ELP.IDPESSOA    = HST.IDPESSOA  )                            ';

      //RESERVAXCONTRIB
      sSQL := sSQL + ' AND    (RXC.IDTIPORESERVA  = REP.IDTIPORESERVA)        '+
       ' AND    (RXC.IDPLANOPREV    = HST.IDPLANOPREV)                        '+
       ' AND    (RXC.IDCONTRIBUICAO   = HST.IDCONTRIBUICAO)                   ';

      //RESERVAXPLANO
      sSQL := sSQL +' AND    (RXP.IDPLANOPREV    = REP.IDPLANOPREV)           '+
       ' AND    (RXP.IDTIPORESERVA  = REP.IDTIPORESERVA)                      '+
       ' AND    (RXP.ANALITICOSINTETI = ''A'' )                               ';

      //PLANPREV
      sSql:=sSql + ' AND    (PL.IDPLANOPREV = HST.IDPLANOPREV )               ';

      sSql:=sSql + ' AND    (SP.IDSITPART = PPP.IDSITPART )                    ';

      sSQL := sSQL + ' ORDER BY PPP.IDPESSJUR, PPP.IDPLANOPREV, PPP.IDPESSOA, PPP.SEQPROPOSTA ';

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSQL);
      qryAux.Open;

      if qryAux.IsEmpty
      then begin
         qryReservaxPlano.Next;
         pBarWhile1.position         := pBarWhile1.position + 1;         
         continue;
      end;

      while not qryAux.Eof do
      begin
         sDataIndice := CriticaDataCobrancaSitParaAlimentacao( qrydata,
                                                qryAux.FieldByName('IDPESSJUR').AsString,
                                                qryAux.FieldByName('IDPLANOPREV').AsString,
                                                qryAux.FieldByName('FLGINTERNO').AsString,
                                                'N',
                                                Copy(sAnoMesCobrancaTela,6,2),
                                                Copy(sAnoMesCobrancaTela,1,4) );

         // Busca exatamente na data solicitada
         dValorIndice := VoltaValorCotacao( qryGrava,
                                            qryReservaxPlano.Fieldbyname('INDICECORRECAO').AsString,     
                                            qryReservaxPlano.Fieldbyname('IDPLANOPREV').AsString,
                                            qryReservaxPlano.Fieldbyname('IDTIPORESERVA').AsString,
                                            sDataIndice);

         if dValorIndice <= 0
         then begin
            { Tratamento para o caso de não encontrar Indice na Data processada }
            If QryAux.FieldByName('FLGTIPOBUSCACOTA').AsInteger = 1
            Then Begin
              If MsgDlg('Valor do Índice "'+qryReservaxPlano.Fieldbyname('MOESIGLA').AsString+'" '+
                        'não encontrado para data '+sDataIndice+#13+
                        'Deseja buscar o índice na última data existente ?' , 
                        'Informação',mtInformation,[mbYes,mbNo],0) = mrNo     
              Then Begin
                 Result := False;
                 Exit;
              End
              else begin 
                 dValorIndice := VoltaValorCotacaoCOMDATA( qryGrava,
                                                           qryReservaxPlano.Fieldbyname('INDICECORRECAO').AsString,     
                                                           qryReservaxPlano.Fieldbyname('IDPLANOPREV').AsString,
                                                           qryReservaxPlano.Fieldbyname('IDTIPORESERVA').AsString,
                                                           sDataIndice);
                 if dValorIndice <= 0
                 then begin
                    MsgDlg('Valor do Índice "'+qryReservaxPlano.Fieldbyname('MOESIGLA').AsString+'" '+
                           'não encontrado em nenhuma data. Verifique tabela de Moedas no sistema GlobalCM.',
                           'Erro',mtError,[mbOk],0);
                    Result := False;
                    Exit;
                 end;
              end;
            End
            Else If QryAux.FieldByName('FLGTIPOBUSCACOTA').AsInteger = 2
                 Then Begin
                   MsgDlg('Valor do Índice "'+qryReservaxPlano.Fieldbyname('MOESIGLA').AsString+'" '+
                          'não encontrado para data '+sDataIndice,
                          'Erro',mtError,[mbOk],0);
                   Result := False;
                   Exit;
                 End
                 else begin 
                    dValorIndice := VoltaValorCotacaoCOMDATA( qryGrava,
                                                              qryReservaxPlano.Fieldbyname('INDICECORRECAO').AsString,     
                                                              qryReservaxPlano.Fieldbyname('IDPLANOPREV').AsString,
                                                              qryReservaxPlano.Fieldbyname('IDTIPORESERVA').AsString,
                                                              sDataIndice);
                    if dValorIndice <= 0
                    then begin
                       MsgDlg('Valor do Índice "'+qryReservaxPlano.Fieldbyname('MOESIGLA').AsString+'" '+
                              'não encontrado em nenhuma data. Verifique tabela de Moedas no sistema GlobalCM.',
                              'Erro',mtError,[mbOk],0);
                       Result := False;
                       Exit;
                    end;
                 end;
         end;

         qryGrava.Close;
         qryGrava.SQL.Clear;
         qryGrava.SQL.Add(' UPDATE RESERVAPART SET VALORRESERVA    = VALORRESERVA * '+OraNumero(FloatToStr(dValorIndice))+',           '+
                          '                        DATAULTATUALIZA = TO_DATE('''+sDataIndice+''',''DD/MM/YYYY'')'+
                          ' WHERE  IDPESSJUR     = '+qryAux.FieldbyName('IDPESSJUR').AsString+
                          ' AND    IDPLANOPREV   = '+qryAux.FieldbyName('IDPLANOPREV').AsString+
                          ' AND    IDPESSOA      = '+qryAux.FieldbyName('IDPESSOA').AsString+
                          ' AND    SEQPROPOSTA   = '+qryAux.FieldbyName('SEQPROPOSTA').AsString+
                          ' AND    IDTIPORESERVA = '+qryReservaxPlano.FieldbyName('IDTIPORESERVA').AsString);
         try
            qryGrava.ExecSQL;
         except
            Exit;
         end;

         qryAux.Next;
      end;
      
      varFields[0] := qryReservaxPlano.FieldbyName('IDPLANOPREV').AsInteger;
      varFields[1] := qryReservaxPlano.FieldbyName('IDTIPORESERVA').AsInteger;
      if not qryDatasIndice.Locate('IDPLANOPREV;IDTIPORESERVA',varFields,[loCaseInsensitive])
      then begin
         qryDatasIndice.Insert;
         qryDatasIndice.FieldByName('IDPLANOPREV').AsInteger       := qryReservaxPlano.FieldbyName('IDPLANOPREV').AsInteger;
         qryDatasIndice.FieldByName('IDTIPORESERVA').AsInteger     := qryReservaxPlano.FieldbyName('IDTIPORESERVA').AsInteger;
         qryDatasIndice.FieldByName('DATAINDICECORRECAO').AsString := sDataIndice;
         qryDatasIndice.Post;
      end;
      

      qryReservaxPlano.Next;
      pBarWhile1.position         := pBarWhile1.position + 1;

   end;
   Result := True;
end;

function TfrmCalculaReservaPart.CriticaDataCobrancaSitParaAlimentacao( qry              : TwwQuery;
                                                                       sIdPessJur       : string;
                                                                       sIdPlanoPrev     : string;
                                                                       sSitFundacao     : string;
                                                                       sTipoData        : char;
                                                                       sMesReferencia   : string;
                                                                       sAnoReferencia   : string) : string;

var
  sSql, sAux,
  sTabela,
  sFiltro,
  sAnoMesCiclo,
  sData           : string;
  iIdModulo       : longint;
  bEncontrouCicloAberto,
  bCicloEncerrado : boolean;
  cTipoEnvPrev    : char;

begin
  Result := '';
  // SINCRONISMO : Se o ciclo do mes/ano passados como parametros estiver encerrado,
  //               ir para o próximo.
  //               Esta função só poderá retornar uma data de um ciclo em aberto.

  bEncontrouCicloAberto := False;
  bExibeLogMatricula    := False;
  sAnoMesCiclo          := sAnoReferencia+'/'+sMesReferencia;
  while not bEncontrouCicloAberto do
  begin
     case sTipoData of
       'N' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM; // Cobranca Normal
       'A' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM; // Cobrança Atrasada
       'D' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM;// Pagamento de Devolução
       'P' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Beneficio
       'B' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Abono
       'T' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Antecipacao de Beneficio
       'O' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Antecipacao de Abono
     end;

     if sSitFundacao = 'PT'
     then bCicloEncerrado := False
     else bCicloEncerrado := VerificaFechamento( StrToInt(sIdPessJur),
                                                 iIdModulo,
                                                 sAnoMesCiclo,
                                                 'E' ,cTipoEnvPrev);
     if bCicloEncerrado
     then begin
        bEncontrouCicloAberto := False;
        sAnoMesCiclo := ProximoAnoMes(StrToInt(Copy(sAnoMesCiclo,6,2)), StrToInt(Copy(sAnoMesCiclo,1,4)));
     end
     else bEncontrouCicloAberto := True;
  end;

  sMesReferencia := Copy(sAnoMesCiclo,6,2);
  sAnoReferencia := Copy(sAnoMesCiclo,1,4);

  if sSitFundacao = 'MS' then sSitFundacao := 'AT';

  if sMesReferencia = '13'
  then sMesReferencia := '12';

  if sSitFundacao = 'AS'
  then begin
         sTabela := 'FUNDACAO';
         sFiltro := ' AND (T.IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ')'; 
         sAux := 'Fundação';
       end
  else begin
         sTabela := 'PLANPREVPATRO';
         sFiltro := ' AND (T.IDPESSJUR = ' + sIdPessJur + ')' +
                    ' AND (T.IDPLANOPREV = ' + sIdPlanoPrev + ')';
         sAux := 'Patrocinadora';
       end;

  sSQL := ' SELECT CD.IDCALENDARIO, CD.FLGINTERNO,      CD.ANOMESREF, '+
          ' TO_CHAR(CD.DATACOBNORMAL,''DD/MM/YYYY'') DATACOBNORMAL, '+
          ' TO_CHAR(CD.DATACOBATRASO,''DD/MM/YYYY'') DATACOBATRASO,'+
          ' TO_CHAR(CD.DATACOBDEVOLUCAO,''DD/MM/YYYY'') DATACOBDEVOLUCAO, '+
          ' TO_CHAR(CD.DATAPAGBENEF,''DD/MM/YYYY'') DATAPAGBENEF, '+
          ' TO_CHAR(CD.DATAPAGABONO,''DD/MM/YYYY'') DATAPAGABONO, '+
          ' TO_CHAR(CD.DATAPAGANTBENEF,''DD/MM/YYYY'') DATAPAGANTBENEF, '+
          ' TO_CHAR(CD.DATAPAGANTABONO,''DD/MM/YYYY'') DATAPAGANTABONO '+
          ' FROM   CALENDDATAS CD, ' + sTabela + ' T' +
          ' WHERE  (CD.FLGINTERNO = ''' + sSitfundacao +''')' +
          ' AND    (CD.ANOMESREF = ''' + sAnoReferencia + '/' + sMesReferencia + ''')' +
          sFiltro +
          ' AND    (T.IDCALENDARIO = CD.IDCALENDARIO)';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
           MostrarErro(E);
           qry.Close;
           Exit;
      end;
  end;

  if qry.IsEmpty then

  if qry.IsEmpty
  then begin
     bExibeLogMatricula    := True;

     if bMostraMensagem
     then begin
        if      sSitFundacao = 'AT' then sDescSituacao := 'ATIVO'
        else if sSitFundacao = 'MP' then sDescSituacao := 'MANTIDO PARCIAL'
        else if sSitFundacao = 'MA' then sDescSituacao := 'MANTIDO'
        else if sSitFundacao = 'AS' then sDescSituacao := 'ASSISTIDO'
        else if sSitFundacao = 'CA' then sDescSituacao := 'CANCELADO';

        if MsgDlg('A data para alimentação para a situação '+sDescSituacao+' não foi encontrada. '+#13+
                  'Deseja utilizar a data para alimentação do calendário de ATIVOS ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes
        then begin
           if MsgDlg('Esta operação será repetida para todas as matrículas encontradas na mesma situação. '+#13+
                     'Confirma ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
           then begin
              qry.Close;
              Exit;
           end;
           bMostraMensagem     := False;
           bUtilizaDataDeAtivo := True;
        end;
     end;

     if bUtilizaDataDeAtivo
     then begin
        sSitFundacao := 'AT';
        sSQL := ' SELECT CD.IDCALENDARIO, CD.FLGINTERNO,      CD.ANOMESREF,      '+
                ' TO_CHAR(CD.DATACOBNORMAL,''DD/MM/YYYY'') DATACOBNORMAL,        '+
                ' TO_CHAR(CD.DATACOBATRASO,''DD/MM/YYYY'') DATACOBATRASO,        '+
                ' TO_CHAR(CD.DATACOBDEVOLUCAO,''DD/MM/YYYY'') DATACOBDEVOLUCAO,  '+
                ' TO_CHAR(CD.DATAPAGBENEF,''DD/MM/YYYY'') DATAPAGBENEF,          '+
                ' TO_CHAR(CD.DATAPAGABONO,''DD/MM/YYYY'') DATAPAGABONO,          '+
                ' TO_CHAR(CD.DATAPAGANTBENEF,''DD/MM/YYYY'') DATAPAGANTBENEF,    '+
                ' TO_CHAR(CD.DATAPAGANTABONO,''DD/MM/YYYY'') DATAPAGANTABONO     '+
                ' FROM   CALENDDATAS CD, ' + sTabela + ' T' +
                ' WHERE  (CD.FLGINTERNO = ''' + sSitfundacao +''')' +
                ' AND    (CD.ANOMESREF = ''' + sAnoReferencia + '/' + sMesReferencia + ''')' +
                sFiltro +
                ' AND    (T.IDCALENDARIO = CD.IDCALENDARIO)';

        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add(sSql);
        qry.Open;

        if qry.IsEmpty
        then begin
           qry.Close;
           Exit;
        end;
     end
     else begin
        qry.Close;
        Exit;
     end;
  end;

  // Verifica Tipo de Cobrança
  case sTipoData of
    'N' : sData := qry.FieldByName('DATACOBNORMAL').AsString;    // Cobrança Normal
    'A' : sData := qry.FieldByName('DATACOBATRASO').AsString;    // Cobrança Atrasada
    'D' : sData := qry.FieldByName('DATACOBDEVOLUCAO').AsString; // Pagamento de Devolução
    'P' : sData := qry.FieldByName('DATAPAGBENEF').AsString;     // Pagamento de Beneficio
    'B' : sData := qry.FieldByName('DATAPAGABONO').AsString;     //  Pagamento de Abono
    'T' : sData := qry.FieldByName('DATAPAGANTBENEF').AsString;  // Pagamento de Antecipacao de Beneficio
    'O' : sData := qry.FieldByName('DATAPAGANTABONO').AsString;  // Pagamento de Antecipacao de Abono
  end;
 Result := sData;
end;//CriticaDataCobrancaSitParaAlimentacao

procedure TfrmCalculaReservaPart.DesmarcarTodas1Click(Sender: TObject);
begin
  inherited;
  qryContribuicao.First;
  while not qryContribuicao.Eof do
  begin
     qryContribuicao.Edit;
     qryContribuicao.FieldByName('FLGALIMENTA').AsInteger := 0;
     qryContribuicao.Post;
     qryContribuicao.Next;
  end;
end;

procedure TfrmCalculaReservaPart.MarcarTodas1Click(Sender: TObject);
begin
  inherited;
  qryContribuicao.First;
  while not qryContribuicao.Eof do
  begin
     qryContribuicao.Edit;
     qryContribuicao.FieldByName('FLGALIMENTA').AsInteger := 1;
     qryContribuicao.Post;
     qryContribuicao.Next;
  end;

end;

procedure TfrmCalculaReservaPart.chklstPlanoClick(Sender: TObject);
var j : integer;
    bPedeData : boolean;
begin
  inherited;
  
  bPedeData := False;
  for j := 0 to chklstPlano.Items.Count - 1 do
  begin
     if not qryPlano.Locate('Nome',Trim(chklstPlano.items[J]),[locaseinsensitive, loPartialKey]) then
     begin
        memResult.Lines.Add('');
        memResult.Lines.Add('[Plano] - '+chklstPlano.items[j]+'- Plano não encontrado');
        memResult.Lines.Add('');
        continue;
     end;

     if qryPlano.FieldByName('FLGDTALIMRESERVA').AsInteger = 0
     then bPedeData := True;
  end;

  if bPedeData
  then grpDataAlimentacao.Visible := True
  else grpDataAlimentacao.Visible := False;
end;

procedure TfrmCalculaReservaPart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( CtrlLancamento );  

  inherited;

end;

procedure TfrmCalculaReservaPart.chkIntegraLocalClick(Sender: TObject);
begin
  inherited;
  bIntegraContab := not bIntegraContab;

  if bIntegraContab
  then lblIntegraContab.Caption := 'Integrar com Contabilidade ? Sim '
  else lblIntegraContab.Caption := 'Integrar com Contabilidade ? Não ';

  chkIntegra.Enabled :=  bIntegraContab;
end;


function TfrmCalculaReservaPart.VerificaDadosIntegracao(qryAux: twwquery; sAnoMesCobrancaTela: String; iIdPessjur: Integer): Boolean;
Var
 bErro : Boolean;
begin
  Result := False;
  bErro  := False;

  memResult.Lines.Add(' ');
  memResult.Lines.Add('Verificação de Parâmetros Contábeis e Financeiros Básicos');
  memResult.Lines.Add('---------------------------------------------------------');

  // Verfica período contábil
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT PERBLOQUE, PERBLOINT ');
  qryAux.SQL.Add('FROM PERIODO ');
  qryAux.SQL.Add('WHERE PEREXERCICIO = TO_NUMBER(SUBSTR('+quotedstr(sAnoMesCobrancaTela)+',1,4)) ');
  qryAux.SQL.Add('  AND PERNUMERO    = TO_NUMBER(SUBSTR('+quotedstr(sAnoMesCobrancaTela)+',6,2)) ');
  qryAux.Open;

  If qryAux.IsEmpty Then
  Begin
    memResult.Lines.Add('O período contábil não foi cadastrado.');
    bErro := True;
  End
  else
  Begin
    If (trim(qryAux.FieldByName('PERBLOINT').AsString) = 'S') or
       (trim(qryAux.FieldByName('PERBLOQUE').AsString) = 'S') Then
    Begin
      memResult.Lines.Add('Período contábil bloqueado - '''+sAnoMesCobrancaTela+'''');
      memResult.Lines.Add('');
      bErro := True;
    End;
  End;

  // Verifica parâmetros gerais
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT F.IDPESSOA, P.NOME AS FUNDACAO, ');
  qryAux.SQL.Add('       PARAM.TIPOPERCOBRANCA,  PARAM.TPDOCRRECPATRO,  ');
  qryAux.SQL.Add('       PARAM.TPDOCPENVIOPATRO,     ');
  qryAux.SQL.Add('       PARAM.TIPOCLIPATRO,  PARAM.TIPOFAVPATRO ');
  qryAux.SQL.Add('FROM   PESSOA P, FUNDACAO F, PARAMAPREV PARAM ');
  qryAux.SQL.Add('WHERE P.IDPESSOA       = F.IDPESSOA ');
  qryAux.SQL.Add('  AND F.IDPESSOA       = '+IntToStr(iIdFundacao));
  qryAux.SQL.Add('  AND PARAM.IDFUNDACAO = F.IDPESSOA ');
  qryAux.SQL.Add('ORDER BY P.NOME ');
  qryAux.Open;

  If qryAux.IsEmpty Then
  Begin
    memResult.Lines.Add('[Não parametrizado] - Parâmetros Gerais.');
    bErro := True;
  End
  else
  Begin
    If (trim(qryAux.FieldByName('TIPOPERCOBRANCA').AsString) = '') Then
    Begin
      memResult.Lines.Add('[Não parametrizado] - Parâmetro Geral');
      memResult.Lines.Add('Tipo de Operação - Recebimento de Contribuições Previdenciárias.');
      memResult.Lines.Add('');
      bErro := True;
    End;
    If (trim(qryAux.FieldByName('TPDOCRRECPATRO').AsString) = '') Then
    Begin
      memResult.Lines.Add('[Não parametrizado] - Parâmetro Geral');
      memResult.Lines.Add('Tipo de Documento - Contas a receber/via recebimento Patrocinadora.');
      memResult.Lines.Add('');
      bErro := true;
    End;
    If (trim(qryAux.FieldByName('TIPOCLIPATRO').AsString) = '') Then
    Begin
      memResult.Lines.Add('[Não parametrizado] - Parâmetro Geral');
      memResult.Lines.Add('Tipo de Cliente para a Patrocinadora.');
      memResult.Lines.Add('');
      bErro := true;
    End;
    If (trim(qryAux.FieldByName('TIPOFAVPATRO').AsString) = '') Then
    Begin
      memResult.Lines.Add('[Não parametrizado] - Parâmetro Geral');
      memResult.Lines.Add('Tipo de Favorecido para a Patrocinadora.');
      memResult.Lines.Add('');
      bErro := true;
    End;
  End;

  If Not bErro
   Then memResult.Lines.Add('Parametrização básica OK.');

  memResult.Lines.Add('-------------------------------------------------');

  result := not bErro;
end;


end.




