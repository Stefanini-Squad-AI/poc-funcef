//******************************************************************************
// Rotina     : QrySaldoTotalAmort.sql
// SOL        : 137379
// Kintana    : 829671
// Data       : 14/06/2010
// Responsável: Adilson Filho
// Motivo     : Inserção de um filtro na QrySaldoTotalAmort.sql para correção
//               na gravação do idtipocota
//******************************************************************************
// Rotina     : QryAtuHistCotaInteg
// SOL        : 131393
// Kintana    : 772597
// Data       : 29/03/2010
// Responsável: Ricardo Cristiano
// Motivo     : Implementação para tratar a seleção de todos os Fundos de Investimentos
//               com saldo. 
//******************************************************************************
// Rotina     : QryDetalheAplAmortizacao
// SOL        : 131393
// Kintana    : 747826
// Data       : 24/02/2010
// Responsável: Ricardo Cristiano
// Motivo     : Alterada o tipo de parâmetro da data para string, onde é feita a
//               busca da aplicação armortizada
//******************************************************************************
// Rotina     : QryCotizaAplicacao/QryCotizaResgate/QryConfirmacao/QryOperAjusteCert
//              QryAmortizacaoFundoRetr/ QryDetalheAplAmortizacao/ QryAplicacaoRetr
//              QryCancelamentoSubsCotasRetr/QryRecebimentosRetr/QryBuscaRegCotaIntegraliza
//              QryIntegralizacaoCotasRetr/QrySubscricaoCotasIntegRetr/QryBloqueioCotasRetr
// SOL        : 129463
// Kintana    : 709981
// Data       : 11/01/2010
// Responsável: Ricardo Cristiano
// Motivo     : Implementação no módulo de Fundo de Investimentos para utilizar em todas as
//               rotinas do reprocessamento cadatro histórico dos Fundos.
//******************************************************************************
// Rotina     : QryCotizaAplicacao / QryCotizaResgate
// SOL        : 129265
// Kintana    : 707133
// Data       : 06/01/2010
// Responsável: Ricardo Cristiano
// Motivo     : Retirado o parâmetro ":IDTIPOFUNDOINVEST", pelo fato de ser passado o
//              ID do fundo e a busca ser realizada na tabela FUNDOINVEST
//******************************************************************************
// Rotina     : QryConfirmacao
// SOL        : 122942
// Kintana    : 608900
// Data       : 10/08/2009
// Responsável: Ricardo Cristiano
// Motivo     : APÓS RESGATE E VERIFICAÇÃO DO SALDO DO FUNDO, CONSTATARAM A
//              DIFERENÇA DE QUANTIDADE DE COTAS OCORRIDA APÓS A OPERAÇÃO.
//******************************************************************************
// Rotina     : QryCotizaResgate
// SOL        : 122539
// Kintana    : 602388
// Data       : 29/07/2009
// Responsável: Ricardo Cristiano
// Motivo     : O resgate com cotização D -1 estava realizando a operação no dia
//               da cotização, o correto é realizar no dia da operação com base
//               na cota do dia da cotização.
//******************************************************************************
// Rotina     : QryCotasIntegraliza
// SOL        : 104377
// Kintana    : 466532
// Data       : 19/12/2008
// Responsável: Ricardo Cristiano
// Motivo     : Ajuste no sql para buscar a última atualização de saldo a integralizar
//******************************************************************************
// Rotina     : QryInsertOperacaoFundo 
// SOL        : 100716
// Kintana    : 447117
// Data       : 09/12/2008
// Responsável: Ricardo Cristiano
// Motivo     : Implementação para gravar o campo DATAVENCIMENTO com a data de
//              aplicação do certificado que sofreu transferência
//******************************************************************************
// Rotina     : QryDelHistFundoRetr / QryAtualizaTransfPlanos / QryAjustaAplicTransf
// SOL        : 100716
// Kintana    : 447117        
// Data       : 04/12/2008
// Responsável: Ricardo Cristiano
// Motivo     : Implementação para para excluir os registros da operação
//               de transferência entre planos(TRP).
//******************************************************************************
// Rotina     : QryAjustaAplicIntegr
// SOL        : 102784
// Kintana    : 457223
// Data       : 02/12/2008
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para buscar apenas o último registro atualizado.
//******************************************************************************
// Rotina     : QryAjustaAplicIntegr / QryBuscaSaldoCotaIntegr / QryBuscaTransfCotaIntegr
// SOL        : 99876
// Kintana    : 441255  
// Data       : 28/11/2008  
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para unificar as subscrições quando ocorrer a operação 
//              de transferência entre planos
//******************************************************************************
// Rotina     : QryBuscaTransfTipoFundo
// SOL        : 99367
// Kintana    : 435730  
// Data       : 28/10/2008  
// Responsável: Ricardo Cristiano
// Descrição  : Implementação da busca dos registros de transferência entre tipo de fundos.
//               Para contemplar a necessidade criar os registros "ATU" e em seguida
//               os "TRT".
//******************************************************************************
// Rotina     : QryAjustaAplicTransf
// SOL        : 98279
// Kintana    : 428095
// Data       : 13/10/2008  
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para não trazer os registros gerados ao somar "n"
//               transferências
//******************************************************************************
// Data      : 10/01/2008
// Código    : AL_147
// Pendencia : 26562
// SOL       : 70938
// Motivo    : Implementação do tipo de cota no filtro da QryVerTransfPlanosLote
//******************************************************************************
// Data      : 02/01/2008
// Código    : AL_146
// Pendencia : 26743
// Motivo    : Criação das query´s QryVerTransfPlanosLote, QryAtualizaTransfPlanos e 
//             QryAjustaAplicTransf
//******************************************************************************
// Data      : 19/12/2007
// Código    : AL_145
// Pendencia : 25413
// Motivo    : Criação da QryVerificaHaTransf e QryBuscaTransfFundo
//******************************************************************************
// Data      : 06/12/2007
// Código    : AL_144
// Desc      : Implementação do "TRUNC" an query´s que fazem join com a tabela de
//             cadastro de fundo(HISTFUNDOINVEST). Essa inclusão trata a busca
//             independente da hora.
//******************************************************************************
// Data      : 06/11/2007
// Código    : AL_142
// Pendencia : 26636
// SOL       : 71212 
// Desc      : Implementação da condição de tipo de operação > 0 ou igual a -34(QryCotizaAplicacao)
//******************************************************************************
// Data      : 23/08/2007
// Código    : AL_142
// Desc      : Retirada a query "QryVariacaoFundosRendaVar", por motivo de não ser mais
//             utilizada no sistema.
//******************************************************************************
// Data      : 09/08/2007
// Código    : AL_141
// Pendencia : 25761
// SOL       : 63520 / 63519
// Desc      : Implementação na QryResgateFACFIF dos campos "STAPROVISIONAIR" e "STAPROVISIONAIOF"
//******************************************************************************
// Data      : 01/08/2007
// Código    : AL_140
// Pendencia : 25761
// SOL       : 63520 / 63519
// Desc      : Implementação na QryPedidoFundosRetr e QryResgateFACFIF
//******************************************************************************
// Data      : 12/07/2007
// Código    : AL_139
// Pendencia : 25671
// SOL       : 61747
// Motivo    : Implementado a view do planprevctbpatr na query QryCotizaResgate
//******************************************************************************
// Data      : 29/06/2007
// Código    : AL_138
// Pendencia : 25594
// SOL       : 56257
// Motivo    : Implementação de ajuste na query QryDelResgOperCotizarRetr e
//             QryDelResgOperFundoRetr devido a taxa de saída(-177).
//******************************************************************************
// Data      : 08/06/2007
// Código    : AL_137
// Pendencia : 24957
// SOL       : 56201
// Motivo    : Implementação da QryMontaMascaraDecQtdHist para pegar dados da
//             HistFundoInves
//******************************************************************************
// Data      : 28/05/2007
// Código    : AL_136
// Motivo    : Implementação da exclusão(QryDelOperInvXoperFdo) das operações de resgate da
//             OPERINVXOPERFDO(Resgate de Fundos de Investimento com Compra de Ações)
//******************************************************************************
// Data     : 28/05/2007
// Código   : AL_135
// Motivo   : Implementação de otimização da query QryAtuAplicacoes para melhorar a performance.
//******************************************************************************
// Data      : 25/05/2007
// Código    : AL_134
// Motivo    : Implementação de ajustes nas query´s QryVariacaoFundos, QryVerPrimeiraMov e
//             QryVariacaoFundosRendaVar para melhorar a performance.
//******************************************************************************
// Data      : 15/05/2007
// Código    : AL_133
// Motivo    : Alterada a query "QryPedidoFundosRetr" para não trazer os registros
//             de resgate a cotizar
//******************************************************************************
// Data      : 15/05/2007
// Código    : AL_132
// Motivo    : Alterada a query "QryAplicacaoRetr" para não trazer os registros
//             de aplicação a cotizar
//******************************************************************************
// Data      : 18/04/2007
// Código    : AL_131
// Motivo    : Implementação de ajuste na QryCotizaAplicacao
//******************************************************************************
// Data      : 18/04/2007
// Código    : AL_130
// Motivo    : Retirada da query QryPesqAplicMesmoDia o TIPMOVFUNDO como parametro
//             deixando o tratamento do "ATU", para buscar todo tipo de aplicação.
//******************************************************************************
// Data      : 11/04/2007
// Código    : AL_129
// Pendencia : 25014
// SOL       : 57363
// Motivo    : Implementação na QryAtuHistCotaInteg para trazer as aplicações por
//             idoperacaofundo, devido a alteração na subscrição para permitir
//             aceitar "n" subscrições com a mesma data de subscrição.
//******************************************************************************
// Data      : 10/04/2007
// Código    : AL_128
// Motivo    : Implementação de ajuste para buscar variação por tipos de cotas
//             na query QryVariacaoFundos
//******************************************************************************
// Data      : 03/04/2007
// Código    : AL_127
// Motivo    : Retirada a QryVerOperacao por náo ser usada
//******************************************************************************
// Data      : 27/03/2007
// Código    : AL_126
// Motivo    : Ajuste na QryCotizaResgate(rotian CotizaResgate) para não ocorrer
//             dupliciadade de operação na rotina de ResgateRepr.
//******************************************************************************
// Data      : 19/03/2007
// Código    : Al_125
// Motivo    : Implementação na query QryDelResgOperFundoRetr dos filtro de
//             indexação da tabela OPERACAOFUNDO
//******************************************************************************
// Data      : 22/03/2007
// Código    : AL_124
// Pendencia : 24843
// Motivo    : Implementação das rotinas de aplicação e resgate a cotizar no
//             reprocessamento(QryDelResgOperCotizarRetr).
//******************************************************************************
// Data      : 07/03/2007
// Código    : Al_123
// Pendencia : 24658
// SOL       : 55067
// Motivo    : Implementação do filtro "TIPMOVCOTAINTEGR <> 'TRP'" nas query´s
//             QryHistCotaIntegRetr e QryDelHistCtIntRetr
//******************************************************************************
// Data      : 17/01/2007
// Código    : AL_122
// Pendencia : 22229
// Motivo    : Implementação do desbloqueio de cotas(QryBloqueioCotasRetr)
//******************************************************************************
// Data      : 04/01/2006
// Código    : AL_121
// Pendencia : 23857
// Motivo    : Implementação de ajustes na query "QryAtuHistCotaInteg" para atualizar
//             "n" subscrições com a mesma data de subscrição
//******************************************************************************
// Data      : 19/12/2006
// Código    : Al_120
// Motivo    : Retirado o filtro de recebimento da query QryAtuAplicacoes, devido
//             ao travamento por conta de consultar a tabela TIPOOPERACAO
//******************************************************************************
// Data      : 14/12/2006
// Código    : AL_119
// Pendencia : 23977
// Motivo    : Desprezar os recebimento de dividendos e juros da query de busca saldo.
//             Parametro que se encontra na tabela de tipo de operacao.(QryAtuAplicacoes)
//******************************************************************************
// Data      : 12/12/2006
// Código    : AL_118
// Pendencia : 23977
// Motivo    : Implementação de ajustes na QryAtuAplicacoes busca das,  para
//             desprezar os recebimento de dividendos e juros da query de busca saldo.
//             Parametro que se encontra na tabela de tipo de operacao.
//******************************************************************************
// Data      : 12/12/2006
// Código    : AL_117
// Pendencia : 23954
// Motivo    : Implementação IDTIPOCOTA na query QryBuscaAplOrigem, para identificar
//             aplicações com data de aplicação iguais e tipo de cotas diferentes
//******************************************************************************
// Data      : 11/12/2006
// Código    : AL_116
// Pendencia : 23954
// Motivo    : Implementação nas query's QryVariacaoFundos e QryVariacaoFundosRendaVar
//             da busca da descri;áo do fundo na HISTFUNDOINVEST
//******************************************************************************
// Data      : 01/12/2006
// Código    : AL_115
// Pendencia : 23349
// Motivo    : Implementação da rotina de unificação das transferência entre planos,
//             para o momento do reprocessamento.
//******************************************************************************
// Data      : 03/11/2006
// Código    : AL_114
// Pendencia : 22781
// Motivo    : Implementação para transferência entre plano funcionar para
//             "n" planos(QryBuscaAplOrigem)
//******************************************************************************
// Data      : 24/10/2006
// Código    : AL_113
// Motivo    : Implementação do join de carteirainvest na query QryAplicacaoRetr
//******************************************************************************
// Data      : 15/09/2006
// Código    : AL_112
// Motivo    : Implementação do campo IDTIPOCOTA no group by  da query QryAtuHistCotaInteg
//******************************************************************************
// Data      : 30/08/2006
// Código    : AL_111
// Pendencia : 22781
// Motivo    : Retirado a query QryDelHistTRCPlanos, não será mais feito o reprocessamnto
//             das operações de transferência entre planos
//******************************************************************************
// Data      : 30/08/2006
// Código    : AL_110
// Motivo    : Implementação da gravação do lote na GravaOperacaoFundo - QryInsertOperacaoFundo
//******************************************************************************
// Data      : 24/07/2006
// Código    : AL_109
// Motivo    : Implementação das query's "QryUpdOperacaoFundoContab" e
//             "QryUpdOperacaoFundoFinanc" e retirada a QryUpdOperacaoFundoFinContb.
//             O motivo foi devido ao tratamento de nulo para os campos PLNCODIGO e
//             CODDOCUMENTO.
//******************************************************************************
// Data      : 19/06/2006
// Código    : Al_108
// Pendencia : 22589
// SOL       : 44014
// Motivo    : Implementação na QryTransfPlanosRetr do campo VLRIOF e VLRIR
//******************************************************************************
// Data      : 30/05/2006
// Código    : Al_107
// Motivo    : Implementação na QryTransfPlanosRetr do campo DATACOTIZACAO
//******************************************************************************
// Data      : 30/05/2006
// Código    : Al_106
// Motivo    : Retirada da QryVerDelResgate os filtros de PLNCODIGO e CODDOCUMENTO,
//             para trazer o registro mesmo q esses não tenha integralização
//******************************************************************************
// Data      : 30/05/2006
// Código    : Al_105
// Motivo    : Implementação na QryBuscaAplOrigem do campo IDOPERACAOFUNDO,
//             para identificar a aplicação origem corretamente
//******************************************************************************
// Data      : 26/05/2006
// Código    : Al_104
// Motivo    : Implementação para desconsiderar os tipos de operações "-43,-100,-105,-108,-119,-143"
//             na query QryAplFundosRetr
//******************************************************************************
// Data      : 10/05/2006
// Código    : Al_103
// Motivo    : Otimização da query "QryHistFundoRetr", para não trazer registros duplicados
//******************************************************************************
// Data      : 18/04/2006
// Código    : AL_102
// Motivo    : Ajuste no reprocessamento do acerto de certificado retroativo, para buscar a
//             a aplicação correta(QryOperAjusteCert e QryHistAtuAjusteCert)
//******************************************************************************
// Data      : 26/04/2006
// Código    : Al_101
// Motivo    : Melhora de performance das querys
//******************************************************************************
// Data      : 18/04/2006
// Código    : AL_100
// Motivo    : Ajuste no reprocessamento do acerto de certificado retroativo, para buscar a
//             a aplicação correta(QryOperAjusteCert e QryHistAtuAjusteCert)
//******************************************************************************
// Data      : 05/04/2006
// Código    : AL_99
// Motivo    : Implementação na query QryAplicacaoRetr do campo IDTIPOOPERACAO,
//             tratar o valor NULL
//******************************************************************************
// Data      : 21/03/2006
// Código    : AL_98
// Motivo    : Implementação do campo "DATAINICIOFUNDO" na query "QryAtuHistCotaInteg"
//******************************************************************************
// Data     : 12/12/2005
// Código   : AL_97
// Motivo   : Ajuste na query de atualização dos Fundos QryAtuAplicacoes, rodar pelos index´s
//            Implementação do tratamento de saldo sintetico conforme a susbcrição
//              QryAtuAplicacoes, QryInsHistCotaIntegraliza, QryAtuHistCotaInteg,
//              QryBuscaRegCotaIntegraliza, QryBuscaRegHistCotaInteg, QrySubscricaoCotasIntegRetr
//******************************************************************************
// Data     : 25/11/2005
// Função   : QrySubscricaoCotasIntegRetr
// Linha(s) : Al_96
// Motivo   : Implementação para atualizar o saldo a integralizar independente da data do fluxo de cotas
//******************************************************************************
// Data     : 18/11/2005
// Função   : QryOperAjusteCert
// Linha(s) : Al_36
// Motivo   : Alterado o tipo de operação de -67(esse está sendo utilizado como transf. no Renda Var.)
//            para o então criado -144
//******************************************************************************
// Data     : 07/11/2005
// Função   : QrySubscricaoCotasIntegRetr
// Linha(s) : Al_35
// Motivo   : Implementação da busca por altera;áo do fluxo
//******************************************************************************
// Data     : 24/10/2005
// Função   : QryAmortizacaoFundoRetr
// Linha(s) : Al_34
// Motivo   : Implementado o tipo de operação -143(amortização de cotas a receber)
//******************************************************************************
// Data     : 24/10/2005
// Função   : QryBloqueioCotasRetr
// Linha(s) : Al_33
// Motivo   : Implementado o bloqueio de cotas
//******************************************************************************
// Data     : 24/10/2005
// Função   : QryPedidoFundosRetr
// Linha(s) : Al_32
// Motivo   : Implementado o tratamento das operações sem bloqueio para regate na pedidofundo
//******************************************************************************
// Data     : 21/09/2005
// Função   : QryAmortizacaoFundoRetr
// Linha(s) : Al_31
// Motivo   : Implementado Plano
//******************************************************************************
// Data     : 12/08/2005
// Linha(s) : Al_30
// Motivo   : Implementação das Query´s e filtros para a nova funcionalidades de Subscrição de Cotas e
//            Integralização de Cotas :
//            QryHistCotaIntegRetr, QryUpdHistCtIntRetr, QryDelHistCtIntRetr,
//            QryBuscaRegCotaIntegraliza, QryBuscaRegHistCotaInteg, QryCotasIntegraliza,
//            QrySubscricaoCotasIntegRetr, qryCotaIntegrFundo
//******************************************************************************
// Data     : 09/08/2005
// Origem   : FUNCEF
// Função   : QrySubscricaoCotasRetr, DsSubscricaoCotasRetr, DsCancelamentoSubsCotasRetr, QryBuscaCotaIntegr
// Linha(s) : Al_29
// Motivo   : Retirada
//******************************************************************************
// Data     : 27/07/2005
// Linha(s) : Al_28
// Motivo   : Criada a query QryInsHistCotaIntegraliza, QryAtuHistCotaInteg e QryBuscaCotaIntegr
//******************************************************************************
// Data     : 06/07/2005
// Código   : AL_27
// Motivo   : Acerto na qrySaldoFundo para não trazer registros de NATUREZAOPERACAO = 'R'
//******************************************************************************
// Data     : 15/06/2005
// Código   : AL_26
// Motivo   : Acerto na QryUpdOpeFinCtb que não estava passando o parametro PLNCODIGO
//******************************************************************************
// Data     : 15/06/2005
// Motivo   : Implementado o parametro IDPEDIDOFUNDO na query "qryConfirmação" e
//            ordernada para buscar conforme o index
//******************************************************************************
// Data     : 08/06/2005
// Motivo   : Ajuste na query QryUpdOpeFinCtb para quando não contabiliza
//******************************************************************************
// Data     : 18/05/2005
// Motivo   : Implementação da QryDespOper
//******************************************************************************
// Data     : 11/04/2005
// Motivo   : Iclusão do campo CODDOCUMENTO e PLNCODIGO na qryRecebimentosRetr
//******************************************************************************
// Data     : 23/02/2005
// Motivo   : Criação do Campo DATACOTIZA query QryAtuAplicacoes
//******************************************************************************
// Data     : 16/02/2005
// Motivo   : Alteração na Query QryAplFundosRetr, para não trazer mais de um
//            registro para a mesma operação no mesmo dia.
//******************************************************************************
// Data     : 15/02/2005
// Motivo   : Implementação da QryPesqAplicMesmoDia
//******************************************************************************
// Data     : 30/11/2004
// Motivo   : Implementação da QryUpdOpeFinCtb
//******************************************************************************
// Data     : 01/11/2004
// Motivo   : Acerto na QryBuscaAplOrigem para poder passar a data da aplicação nula
//            e qryTransfPlanosRetr
//******************************************************************************
// Data     : 26/10/2004
// Motivo   : Acerto na QryBuscaAplOrigem para passar a data da aplicação
//******************************************************************************
// Data     : 25/10/2004
// Motivo   : Acerto na QryDetalheAplAmortizacao para Reprocessamento de Amortizações
//******************************************************************************
// Data     : 20/10/2004
// Motivo   : Implementação da qryTransfPlanosRetr
//            Acerto na qryRecebimentosRetr
//            Criação campo VLRCUSTOATUAL na qrySaldoFundo
//            Acerto na QryAplFundosRetr para não trazer as Amortizações
//******************************************************************************
// Data     : 21/10/2004
// Motivo   : Alteração do nome da query QryDelOperacaoFundo para QryUpdOperacaoFundoFinContb
//            Alteração do nome da query QryHistFundo para QryDelHistFundo
//            Alteração do nome da query QryIrLitigio para QryDelIrLitigio
//******************************************************************************
// Data     : 04/10/2004
// Motivo   : Acerto na qry qryDelHistTRCPlanos para busca de registros
//******************************************************************************
// Data     : 29/09/2004
// Motivo   : Alterado A QryVerDelResgate
//****************************************************F**************************
// Data     : 29/09/2004
// Código   : Alt_2
// Motivo   : Alterado a QryAtuAplicacoes para não trazer IDTIPOOPERACAO -43 (AMORTIZACAO)
//******************************************************************************
// Data     : 27/09/2004
// Motivo   : Incluido a qryDelHistTRCPlanos para Reprocessamento de TRC Planos (-108)
//******************************************************************************
// Data     : 24/09/2004
// Motivo   : Incluido tratamento na QryAtuAplicacoes para não trazer operacoes
//            com Natureza da Operacao do Tipo de Operacao = 'R' Recebimentos
//******************************************************************************
// Data     : 20/09/2004
// Código   : Alt_1
// Motivo   : qrySaldoFundo, QryResgateFACFIF
//******************************************************************************
// Data     : 14/09/2004
// Motivo   : Incluido o parâmetro IDPLANPREVCTBPATR na QryBuscaAplOrigem
//******************************************************************************
// Data     : 25/08/2004
// Função   : QryCancelamentoSubsCotasRetr
// Motivo   : Foi feita a implementações da query de Subscrição de Cotas
//            para ser utilizada no Reprocessamento
//******************************************************************************
// Data     : 18/08/2004
// Função   : QrySubscricaoCotasRetr
// Motivo   : Foi feita a implementações da query de Subscrição de Cotas
//            para ser utilizada no Reprocessamento
//******************************************************************************
// Data     : 13/04/2004
// Função   : QryAmortizacaoFundoRetr, QryUpdOperFundoIrLitigio
// Motivo   : Foi feita a implementações dessas querys de Amortização
//            para ser utilizada no Reprocessamento
//******************************************************************************
// Data     : 07/04/2004
// Função   : QryResgateFACFIF e QryConfirmacao
// Motivo   : Essas foram ajustadas conforme a inclusão do Fundo de Investimento
//            em Direito Creditórios.
//******************************************************************************
// Data     : 06/04/2004
// Função   : QryUpdOperacaoFundo
// Motivo   : Gravar os codigos de Tesouraria e Contabilidade
//******************************************************************************
// Respons. : Emerson
// Data     : 12/06/2009
// NUM      : KT 492521 SOL 108531
// Função   : QryPedidoFundosRetr
// Motivo   : Implementado mais duas Colunas VW.PLANPRVCONTABPATRO,
//                                           VW.IDPLANPREVCTBPATR
//******************************************************************************

unit dFundoComum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, Wwdatsrc;

type
  TDmFundoComum = class(TDataModule)
    QryMontaMascaraDecQtd: TwwQuery;
    QryMontaMascaraDecQtdQTDDECQTD: TFloatField;
    QryMontaMascaraDecQtdQTDDECVALOR: TFloatField;        
    QrySaldoFundo: TwwQuery;
    QryVlrCota: TwwQuery;
    QryVlrCotaVLRCOTA: TFloatField;
    QryInsertHistFundo: TwwQuery;
    QryResgateFACFIF: TwwQuery;
    QryAux: TwwQuery;
    QryInsertOperacaoFundo: TwwQuery;
    QryBuscaAplOrigem: TwwQuery;
    QryVerificaTipoOper: TwwQuery;
    QryUpdHistFundo: TwwQuery;
    QryUpdIrLitigio: TwwQuery;
    QryVariacaoFundos: TwwQuery;
    QryProvIOF: TwwQuery;
    QryTipoFundos: TwwQuery;
    QryProvIRRF: TwwQuery;
    QryUpdHistFundoAtu: TwwQuery;
    QryPgtoIrLitigio: TwwQuery;
    QryPlanoPrevContabil: TwwQuery;
    QryBuscaIofAnterior: TwwQuery;
    QryTotalIRLitigioMes: TwwQuery;
    QryTotalIOFLitigioMes: TwwQuery;
    QryCotizaAplicacao: TwwQuery;
    QryUpdOperFundoQtCot: TwwQuery;
    QryUpdHistFundoQtCot: TwwQuery;
    QryCotizaResgate: TwwQuery;
    QryBuscaTipoOper: TwwQuery;
    QryBuscaTipoOperIDTIPOINVEST: TFloatField;
    QryBuscaTipoOperIDTIPOOPERACAO: TFloatField;
    QryBuscaTipoOperIDMERCADO: TFloatField;
    QryBuscaTipoOperDESCTIPOOPERACAO: TStringField;
    QryBuscaTipoOperNATUREZAOPERACAO: TStringField;
    QryBuscaTipoOperTIPOCUSTODIA: TStringField;
    QryBuscaTipoOperVENCIMENTO: TFloatField;
    QryBuscaTipoOperTIPCREDOR: TStringField;
    QryBuscaTipoOperFLGTRANSF: TStringField;
    QryBuscaTipoOperFLGCORRET: TStringField;
    QryBuscaTipoOperFLGORDMOVINV: TStringField;
    QryBuscaTipoOperFLGTRATAIR: TStringField;
    QryConfirmacao: TwwQuery;
    QryConfirmacaoDESCFUNDOINVEST: TStringField;
    QryConfirmacaoDESCTIPOOPERACAO: TStringField;
    QryConfirmacaoSTACONFIRMA: TStringField;
    QryConfirmacaoIDBOLETA: TFloatField;
    QryConfirmacaoDATALIQUIDACAO: TDateTimeField;
    QryConfirmacaoVLRCOTA: TFloatField;
    QryConfirmacaoVLRLIQUIDO: TFloatField;
    QryConfirmacaoQTDOPERACAO: TFloatField;
    QryConfirmacaoVLRIR: TFloatField;
    QryConfirmacaoVLRIOF: TFloatField;
    QryConfirmacaoDATAOPERACAO: TDateTimeField;
    QryConfirmacaoVLROPERACAO: TFloatField;
    QryConfirmacaoIDOPERACAOFUNDO: TFloatField;
    QryConfirmacaoIDCARTEIRAINVEST: TFloatField;
    QryConfirmacaoIDPEDIDOFUNDO: TFloatField;
    QryConfirmacaoIDTIPOINVEST: TFloatField;
    QryConfirmacaoIDTIPOOPERACAO: TFloatField;
    QryConfirmacaoIDFUNDOINVEST: TFloatField;
    QryConfirmacaoVLRRENDIMENTO: TFloatField;
    QryConfirmacaoIDFUNDOINVEST_1: TFloatField;
    QryConfirmacaoIDGESTORCARTEIRA: TFloatField;
    QryConfirmacaoTRGDTINCLUSAO: TDateTimeField;
    QryConfirmacaoTRGUSERINCLUSAO: TStringField;
    QryConfirmacaoMOECODIGO: TFloatField;
    QryConfirmacaoIDCARTEIRAINVEST_1: TFloatField;
    QryConfirmacaoIDTIPOFUNDOINVEST: TFloatField;
    QryConfirmacaoCNPJFUNDO: TStringField;
    QryConfirmacaoSTAEXCLUSIVO: TStringField;
    QryConfirmacaoPZOCARENCIA: TFloatField;
    QryConfirmacaoPZOANIVERSARIO: TFloatField;
    QryConfirmacaoPZOLIQAPLIC: TFloatField;
    QryConfirmacaoPZOLIQRESG: TFloatField;
    QryConfirmacaoQTDDECQTD: TFloatField;
    QryConfirmacaoQTDDECVALOR: TFloatField;
    QryConfirmacaoSTAFUNDO: TStringField;
    QryConfirmacaoPZOAMORTIZACAO: TFloatField;
    QryConfirmacaoPERCTXPERFORM: TFloatField;
    QryConfirmacaoPERCTXADM: TFloatField;
    QryConfirmacaoCODFUNCETIP: TStringField;
    QryConfirmacaoSTAPROVISIONAIR: TStringField;
    QryConfirmacaoSTAPROVISIONAIOF: TStringField;
    QryConfirmacaoCONTRCETIP: TStringField;
    QryConfirmacaoIDOPERACAOORIGEM: TFloatField;
    QryConfirmacaoIDPLANOPREV: TFloatField;
    QryConfirmacaoIDPATROCINADORA: TFloatField;
    QryConfirmacaoDATACOTIZACAO: TDateTimeField;
    QryPlnCodigoHistFundo: TwwQuery;
    QryAuxiliar: TwwQuery;
    QryDelIrLitigio: TwwQuery;
    QryPatroPlanPrevContab: TwwQuery;
    QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField;
    QryPatroPlanPrevContabIDPLANOPREV: TFloatField;
    QryPatroPlanPrevContabIDPATRO: TFloatField;
    QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField;
    QryConfirmacaoIDCOMPOSICAOFUNDO: TFloatField;
    QryCotaIntegrFundo: TwwQuery;
    QryCotaIntegrFundoVLRCOTA: TFloatField;
    QryCotaIntegrFundoDESCFUNDOINVEST: TStringField;
    QryCotaIntegrFundoMOESIGLA: TStringField;
    QryCotaIntegrFundoIDREGRA: TFloatField;
    //Al_30
    QryCotaIntegrFundoIDTIPOCOTA: TFloatField;
    QryAplPgtoIR: TwwQuery;
    QryUpdHistFundoRetr: TwwQuery;
    QryDelHistFundoRetr: TwwQuery;
    QryDelIrLitigioRetr: TwwQuery;
    QryDelResgOperFundoRetr: TwwQuery;
    QryAplFundosRetr: TwwQuery;
    QryConfirmacaoNATUREZAOPERACAO: TStringField;
    QryUpdOperacaoFundoContab: TwwQuery;
    QryUpdTipoFundoInvest: TwwQuery;
    QryUpdParaminvest: TwwQuery;
    StringField1: TStringField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    DateTimeField1: TDateTimeField;
    StringField2: TStringField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    StringField5: TStringField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    QryOperAjusteCert: TwwQuery;
    QryHistAtuAjusteCert: TwwQuery;
    QryVlrCotaAux: TwwQuery;
    QryConfirmacaoRECPAG: TStringField;
    DsAplicacaoRetr: TwwDataSource;
    UpdAplicacaoRetr: TUpdateSQL;
    QryDelIncorporacaoFundo: TwwQuery;
    QryConfirmacaoIDPLANPREVCTBPATR: TFloatField;
    QryAtuAplicacoes: TwwQuery;
    QryConfirmacaoIDTIPOCOTA: TFloatField;
    QryConfirmacaoDESCTIPOCOTA: TStringField;
    QryVerDelResgate: TwwQuery;
    QryUpdPedidoFundo: TwwQuery;
    QryDelIrLitigioPedido: TwwQuery;
    QryDelHistFundoResg: TwwQuery;
    QryDelOperacaoFundoResg: TwwQuery;
    QryDelPedidoFundoResg: TwwQuery;
    QryUpdOperacaoFundoResg: TwwQuery;
    QryAmortizacaoFundoRetr: TwwQuery;
    QryUpdOperFundoIrLitigio: TwwQuery;
    QrySaldoTotalAmort: TwwQuery;
    QryDetalheAplAmortizacao: TwwQuery;
    QryIntegralizacaoCotasRetr: TwwQuery;
    QryHistFundoRetr: TwwQuery;
    QryAplicacaoRetr: TwwQuery;
    QryConfirmacaoPLANPRVCONTABPATRO: TStringField;
    //Al_29
    QryCancelamentoSubsCotasRetr: TwwQuery;
    //Al_29
    //AL_111
    QryRecebimentosRetr: TwwQuery;
    QryTransfPlanosRetr: TwwQuery;
    QryUpdOpeFinCtb: TwwQuery;
    QryDespOper: TwwQuery;
    FloatField48: TFloatField;
    FloatField49: TFloatField;
    FloatField50: TFloatField;
    StringField10: TStringField;
    FloatField51: TFloatField;
    QryInsHistCotaIntegraliza: TwwQuery;
    QryAtuHistCotaInteg: TwwQuery;
    //Al_29
    //Al_30
    QryHistCotaIntegRetr: TwwQuery;
    QryUpdHistCtIntRetr: TwwQuery;
    QryDelHistCtIntRetr: TwwQuery;
    QryBuscaRegCotaIntegraliza: TwwQuery;
    QryBuscaRegHistCotaInteg: TwwQuery;
    QryCotasIntegraliza: TwwQuery;
    QrySubscricaoCotasIntegRetr: TwwQuery;
    //Al_33
    QryBloqueioCotasRetr: TwwQuery;
    QryVerPrimeiraMov: TwwQuery;
    QryVerPrimeiraMovIDHISTFUNDO: TFloatField;
    QryVerPrimeiraMovDATAMOVFUNDO: TDateTimeField;
    QryVerPrimeiraMovIDCARTEIRAINVEST: TFloatField;
    QryVerPrimeiraMovSALDOQTDCOTAS: TFloatField;
    QryVerPrimeiraMovSALDOVLRFUNDO: TFloatField;
    QryDelHistFundo: TwwQuery;
    QryPedidoFundosRetr: TwwQuery;
    QryPesqAplicMesmoDia: TwwQuery;
    QryUpdOperacaoFundoFinanc: TwwQuery;
    //AL_115
    QryBuscaTransfUnif: TwwQuery;
    //AL_124
    QryDelResgOperCotizarRetr: TwwQuery;
    //AL_136
    QryDelOperInvXoperFdo: TwwQuery;
    //AL_137
    QryMontaMascaraDecQtdHist: TwwQuery;
    QryMontaMascaraDecQtdHistIDFUNDOINVEST: TFloatField;
    QryMontaMascaraDecQtdHistQTDDECQTD: TFloatField;
    QryMontaMascaraDecQtdHistQTDDECVALOR: TFloatField;
    //AL_145
    QryBuscaTransfFundo: TwwQuery;
    QryVerificaHaTransf: TwwQuery;
    //AL_146
    QryVerTransfPlanosLote: TwwQuery;
    //Ricardo Cristiano - 04/12/2008 - N. Sol 100716 -  N. Kintana 447117
    //Ricardo Cristiano - 28/10/2008 - N. Sol 99367 -  N. Kintana 435730
    QryBuscaTransfTipoFundo: TwwQuery;
    //Ricardo Cristiano - 28/11/2008 - N. Sol 99876 -  N. Kintana 441255
    QryAjustaAplicIntegr: TwwQuery;
    QryBuscaSaldoCotaIntegr: TwwQuery;
    QryBuscaTransfCotaIntegr: TwwQuery;
    //Al_30 - Fim
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmFundoComum: TDmFundoComum;

implementation

{$R *.DFM}

end.
