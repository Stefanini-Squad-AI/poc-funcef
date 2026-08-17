//******************************************************************************
// Rotina     : BtProcessarClick
// SOL        : 173552
// Kintana    : 1565594
// Data       : 17/02/2012
// Responsável: Otacilio Aquino
// Descrição  : Implementação para corrigir os fechamentos diários quando existir
//              boleta de compra/venda registrado
//******************************************************************************
// Rotina     : BtProcessarClick
// SOL        : 172801
// Kintana    : 1557138
// Data       : 26/01/2012
// Responsável: Ricardo Cristiano
// Descrição  : Ao final de cada dia do reprocessamento verifica se todos os ativos,
//              selecionados para reprocessamento foram marcados, do contrário,
//              os mesmo serão marcados.
//******************************************************************************
// Rotina     : BtProcessarClick
// SOL        : 170047.7581
// Kintana    : 1544308
// Data       : 13/01/2012
// Responsável: Otacilio Aquino
// Descrição  : Implementado para o sistema não voltar a data de fechamento.
//******************************************************************************
// Rotina     : BtProcessarClick
// SOL        : 170047.7461
// Kintana    : 1533918
// Data       : 13/01/2012
// Responsável: Otacilio Aquino
// Descrição  : Gravar boletas fechadas e sem registros na HstCartinv
//******************************************************************************
// Rotina     : BtProcessarClick
// SOL        : 119590
// Kintana    : 569490
// Data       : 10/06/2009
// Responsável: William M. Santos
// Descrição  : Chamamos o método "GravaEmAbertura" antes das chamadas do método "Exit"
//              para que o usuário possa ser liberado.
//******************************************************************************
// Rotina     : CalcCotacaoInvest
// SOL        : 92822
// Kintana    : 389089
// Data       : 11/08/2008
// Responsável: Ricardo Cristiano
// Descrição  : Instrução CGPC 025 que altera a precificação dos ativos de mercado a vista.
//******************************************************************************
// Rotina     : bbtnConfirmar/bbtnCancelar/BtProcessarClick
// SOL        : 93417
// Kintana    : 406468
// Data       : 08/09/2008
// Responsável: Ricardo Cristiano
// Descrição  : Implementacao para tratar os constantes travamentos entre os
//               processos do módulo de Investimentos(propriedade visible = false,
//               para os botões bbtnConfirmar/bbtnCancelar).
//******************************************************************************
// Rotina     : MontaAtuSldInvRV/BuscaDataAntBloqContab/MarcarFlagReproc/RemarcaFlgReproc/AtualizaSaldoInvestRV
// SOL        : 92857
// Kintana    : 396741
// Data       : 07/08/2008
// Responsável: Ricardo Cristiano
// Descrição  : Implementação de ajustes para otimização do reprocessamento
//******************************************************************************
// Data      : 18/12/2007
// Código    : AL_59
// Pendencia : 27113
// Desc      : Desvinculação da crítica de boletas de BM&F não fechadas no
//               módulo de Renda Variável
//             Alterada a qryBuscaOper (DFM)
//******************************************************************************
// Data      : 21/06/2007
// Código    : AL_58
// Pendencia : 25660
// Desc      : Acerto erro: Não foi possivel preparar a base para reprocessamento
//           :              Não foi possivel excluir um lancamento contábil
//                          Quando só era informado a data e o sistema tentava apagar
//                          um plncodigo null
//******************************************************************************
// Data      : 20/03/2007
// Código    : AL_57
// Pendencia : 24774
// SOL       : 55877
// Desc      : Liga/Desliga a integração contabil financeira por módulo
//******************************************************************************
// Data      : 12/03/2007
// Código    : AL_56
// Pendencia : 24712
// SOL       : 55525
// Desc      : Implementação na verificação das Operações de Direito que não
//             foram fechadas no determinado período e plano.
//******************************************************************************
// Data      : 31/01/2007
// Código    : AL_55
// Pendencia : 23280
// Desc      : Implantação do Flag para Conciliação de Saldos
//               das Carteiras Próprias com suas respectivas carteiras gerenciais
//******************************************************************************
// Data      : 04/01/2007
// Código    : AL_54
// Pendencia : 24122
// Desc      : Ajustar a para quando ocorrer um erro no reprocessamento, seja
//               possível reiniciar o processo sem sair da tela
//******************************************************************************
// Data      : 06/12/2006
// Código    : AL_53
// Pendencia : 23674
// SOL       : 45954
// Desc      : Segregação de Recursos
//******************************************************************************
// Data      : 05/10/2006
// Código    : AL_52
// Pendencia : 22961
// Desc      : Segregação de Planos atualização dos parametros da QryRegAtualizacao
//******************************************************************************
// Data      : 03/10/2006
// Código    : AL_51
// Pendencia : 22961
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_50
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_49
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_48
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 05/06/2006
// Código   : AL_47
// Pendencia: 22527
// SOL      : 43810
// Desc     : Melhoria na crítica de boletas calculadas e não fechadas no período.
//******************************************************************************
// Data     : 16/05/2006
// Código   : AL_46
// Desc     : Retirada a chamazda da rotina MarcaOpeSemHist pois é necessário
//             adaptar as boletas DTB para gravar o IDOPERACAOINVEST no histórico
//******************************************************************************
// Data     : 27/04/2006
// Código   : AL_45
// Desc     : Retirada função AtualizaEmprestimoAcoes pois estava sem utilização e
//            a mesma é da FFechtoEmp
//******************************************************************************
// Data     : 24/04/2006
// Código   : AL_44
// Desc     : Ajuste na exclusão do flag de contabilização no final do
//            reprocessamento do dia
//******************************************************************************
// Data     : 17/04/2006
// Código   : AL_43
// Desc     : Ajuste no reprocessamento para marcar investimentos de operações
//               sem histórico no dia do reprocessamento
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_42
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//********************************************************************************************************
//Data	    : 30/03/2006
//Código    : Al_41
//Motivo(S) : Reprocessamento comitando por dia
//            Contabilização da boleta por dia commitado
//            Remarca o investimento a ser reprocessado para o dia comitado
//********************************************************************************************************
//Data	    : 20/03/2006
//Código    : Al_40
//Motivo(S) : Ajuste no reprocessamento da compensação do Recebimento/Pagamento das boletas
//********************************************************************************************************
//Data	    : 06/03/2006
//Código    : Al_39
//Motivo(S) : Reengenharia do reprocessamento - Reprocessamento linear
//              passa a se basear nas datas e não nos investimentos a serem reprocessados
//********************************************************************************************************
//Data	    : 06/02/2006
//Código    : Al_38
//Motivo(S) : Ajuste no processo de fechamento - Volta a utilizar o ProgressBar
//********************************************************************************************************
//Data	    : 01/02/2006
//Código    : Al_37
//Motivo(S) : Ajuste no reprocessamento de transferencia
//********************************************************************************************************
//Data	    : 01/08/2005
//Código    : Al_36
//Motivo(S) : Remoção do método para a URendaVariavel
//            com Ajuste nas rotinas de Vencimento de Subscrição
//                Arranjo na declaração de variáveis
//                Criação de bloco try para controle de destruição de objetos criados em runtime
//                Acerto nas queries de exclusão e busca de vencimentos
//                Ampliação do bloco Try-Except
//********************************************************************************************************
//Data	    : 28/09/2005
//Código    : Al_35
//Motivo(S) : Soma de Despesas de Venda no Total a Receber das Venda para zeragem
//            das contas transitórias (IF Funcef) verificar depois se se adequa na REFER
//********************************************************************************************************
//Data	    : 09/08/2005
//Código    : Al_34
//Motivo(S) : Ajuste na gravação da planilha no documento durante o reprocessamento
//********************************************************************************************************
//Data	    : 28/07/2005
//Código    : Al_33
//Motivo(S) : Ajuste nas rotinas de Vencimento de Subscrição
//********************************************************************************************************
//Data	    : 25/07/2005
//Código    : Al_32
//Motivo(S) : Acerto na buscar de Investimento de Destino no Vencimento de Subscrição 'D' ao invés de 'O'
//********************************************************************************************************
//Data	    : 20/07/2005
//Código    : Al_31
//Motivo(S) : Unificação da Rotina de Atualização de RV pela da URendaVarivel(AtualizaSaldoInvestRV)
//********************************************************************************************************
//Data	    : 06/07/2005
//Código    : Al_30
//Motivo(S) : Simplificado a critica para gravar carteira gerencial
//********************************************************************************************************
//Data	    : 06/07/2005
//Código    : Al_29
//Motivo(S) : So grava a custodiante na operacaoinvest qdo nao for carteira gerencial
//********************************************************************************************************
//Data	    : 28/06/2005
//Código    : Al_28
//Motivo(S) : Acerto na mensagem do sistema, retirando o erro e corrigindo o anunciado
//********************************************************************************************************
//Data	    : 21/06/2005
//Código    : Al_27
//Motivo(S) : Implentação da msg de confirma para os direitos a receber, onde ele pode proceguir o fechto sem receber os direitos
//********************************************************************************************************
//Data	    : 21/06/2005
//Código    : Al_26
//Motivo(S) : Implentação para pegar saldo zerado ou cotação menor que 0,000000001
//************************************************************************************
//Data	    : 23/05/2005
//Código    : Al_25
//Motivo(S) : Implementação do teste de período contabil em 3 camadas
//************************************************************************************
//Data	    : 11/04/2005
//Código    : Al_24
//Motivo(S) : Ajuste para as cotações com valores 0,00000000, quando utiliza a func "trunca" continua
//            existindo o valor, para isso será feito o teste com a func "round".
//************************************************************************************
//Data	    : 23/03/2005
//Código    : Al_23
//Motivo(S) : Retirado a rotina "ExcluiOperacoesRV" por não estar sendo utilizado no sistema
//*************************************************************************************
// Data     : 28/02/2005
// Código   : AL_22
// Descrição: Passagem de parâmetro bMenu para o form frmConsConciliacaoCustodia
//*************************************************************************************
// Data     : 23/02/2005
// Código   : AL_21
// Descrição: Acerto na qryLocal da função AtualizaSaldoInvest para tirar o Cartesiano
//            com a TipoOperacao e retirada de joins com o Renda Fixa Antigo
//******************************************************************************
// Data     : 22/02/2005
// Código   : AL_20
// Motivo   : Rotina que apura operações que inicializa o saldo de um investimento, caso esse não exista na Carteira
//*************************************************************************************
// Data     : 21/02/2005
// Código   : AL_19
// Descrição: Alterada a para a DATAVENCIMENTO, a data de referência no Vencimento de Subscrição.
//*************************************************************************************
// Data     : 11/02/2005
// Código   : AL_18
// Descrição: Ajuste na gravação do tipo de operação para ATU = 0
//*************************************************************************************
// Data     : 24/01/2005
// Código   : AL_17
// Descrição: Acerto na gravação do tipooperacao qdo atu = 0 -> passa o mesmo do saldo anterior
//******************************************************************************
// Data     : 19/01/2005
// Código   : AL_15
// Motivo   : Critica de importação de cotação antecipada no processo
//******************************************************************************
// Data     : 19/01/2005
// Código   : AL_14
// Motivo   : Retirada critica, pois acima já havia uma igual
//******************************************************************************
// Data     : 19/01/2005
// Código   : AL_13
// Motivo   : Implementado a continuidade do processo mesmo com boletas em aberto
//*******************************************************************************
// Data     : 14/12/2004
// Código   : AL_10
// Motivo   : Inclusão da rotina AtualizaSubscricaoVencida.
//******************************************************************************
// Data     : 08/12/2004
// Código   : AL_9
// Motivo   : Implementação do tratamento para só reprocessar o dia alterado
//*******************************************************************************
// Data     : 29/11/2004
// Código   : AL_8
// Motivo   : Não permite Reprocessamento por Investimento se tiver compensa'~ao
//            entre contas de Variação (REFER)
//******************************************************************************
// Data     : 24/11/2004
// Código   : AL_7
// Motivo   : Implementação do tratamento da Carteira Gerencial para não contabilizar
//******************************************************************************
// Data     : 19/10/2004
// Código   : AL_6
// Motivo   : Replica saldos diariamente
//******************************************************************************
// Data     : 06/10/2004
// Código   : AL_5
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_4
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************
// Data	    : 18/06/2004
// Código   : AL_3
// Motivo(S): Testar variaveis iPlano, iplanilha, iDocumento
//******************************************************************************
// Data	    : 04/06/2004
// Código   : AL_2
// Motivo(S): Passa duas vezes pelo relançamento para fazer a transferencia de 1º
//            Registro na carteira
//******************************************************************************
// Data	    : 31/05/2004
// Código   : AL_1
// Motivo(S): Melhora na metodologia e performance no reprocessamento
//******************************************************************************
// Data	    :28/05/2004
// Código   : AL_2
// Motivo(S):Atualização do saldo conforme cotação do dia
//******************************************************************************
// Data	    :26/05/2004
// Origem   :FUNCEF
// Função   :Botão OK
// LINHA(S) :
// Motivo(S): Ajustes no Reprocessamento de Carteiras Próprias e Gerenciais
//******************************************************************************
unit FFechtoRenVar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwQuery, UBibliotecaInvest, UOperacaoInvest, UOperComum,
  dOperComum, URegra, Db, Wwdatsrc, DBTables, Grids, DBGrids, FOkCancelar,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbigrd, Wwdbgrid, wwdblook, FAguarde,
  fcLabel, uCtrlInvContab, uCtrlCarteiraGerenc, uCtrlParamInvest, uCtrlPadroes, URendaVariavel,
  //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
  uCtrlParamCotacaoRV;

type
  TFrmFechtoRenVar = class(TfrmOkCancelar)
    Inutil_QryBuscaDespesa: TwwQuery;
    Inutil_QryBuscaDespesaIDTIPODESPINVEST: TFloatField;
    Inutil_QryBuscaDespesaMOECODIGO: TFloatField;
    Inutil_QryBuscaDespesaDESCTIPODESPINV: TStringField;
    Inutil_QryBuscaDespesaNATUREZAOPERACAO: TStringField;
    Inutil_QryBuscaCredor: TwwQuery;
    Inutil_QryBuscaCredorIDPESSOA: TFloatField;
    Inutil_QryBuscaCredorRAZAOSOCIAL: TStringField;
    Inutil_DsDespesasOperacao: TwwDataSource;
    Inutil_QryDespesasOperacao: TwwQuery;
    Inutil_QryDespesasOperacaoIDDESPOPERINVEST: TFloatField;
    Inutil_QryDespesasOperacaoIDOPERACAOINVEST: TFloatField;
    Inutil_QryDespesasOperacaoIDTIPOINVEST: TFloatField;
    Inutil_QryDespesasOperacaoIDTIPOOPERACAO: TFloatField;
    Inutil_QryDespesasOperacaoIDTIPODESPINVEST: TFloatField;
    Inutil_QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField;
    Inutil_QryDespesasOperacaoIDREGRACALCUSADA: TFloatField;
    Inutil_QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField;
    Inutil_QryDespesasOperacaoDESCDESP2: TStringField;
    Inutil_QryDespesasOperacaoDESCCRED2: TStringField;
    Inutil_QryDespesasOperacaoIDFORCLI: TFloatField;
    Inutil_QryDespesasOperacaoVLRDESPOPER: TFloatField;
    Inutil_QryDespesasOperacaoNUMDOCUMENTO: TStringField;
    Inutil_QryDespesasOperacaoFLGCALCDIARIO: TStringField;
    Inutil_QryDespesasOperacaoIDINVESTIMENTO: TFloatField;
    Inutil_QryDespesasOperacaoIDCARTEIRAINVEST: TFloatField;
    Inutil_QryDespesasOperacaoVLROPERACAO: TFloatField;
    Inutil_QryDespesasOperacaoQTDEOPERACAO: TFloatField;
    Inutil_QryDespesasOperacaoDESCTIPOOPERACAO: TStringField;
    Inutil_QryDespesasOperacaoDESCINVESTIMENTO: TStringField;
    Inutil_QryDespesasOperacaoNATUREZAOPERACAO: TStringField;
    Inutil_QryDespesasOperacaoDATAOPERACAO: TDateTimeField;
    Inutil_QryDespesasOperacaoMOECODIGO: TFloatField;
    Inutil_QryDespesasOperacaoTIPOTITULO: TStringField;
    Inutil_QryDespesasOperacaoNATOPERDESP: TStringField;
    Inutil_UpdDespesas: TUpdateSQL;
    Inutil_DsImpostosOperacao: TwwDataSource;
    Inutil_QryImpostosOperacao: TwwQuery;
    Inutil_UpdImpostos: TUpdateSQL;
    Inutil_QryImpostosOperacaoIDIMPOSTOINVEST: TFloatField;
    Inutil_QryImpostosOperacaoIDPESSOA: TFloatField;
    Inutil_QryImpostosOperacaoIDOPERACAOINVEST: TFloatField;
    Inutil_QryImpostosOperacaoIDTIPOINVEST: TFloatField;
    Inutil_QryImpostosOperacaoIDTIPOOPERACAO: TFloatField;
    Inutil_QryImpostosOperacaoVLRIMPOSTOOPER: TFloatField;
    Inutil_QryImpostosOperacaoDATAVENCIMPINVEST: TDateTimeField;
    Inutil_QryImpostosOperacaoIDREGRACALCUSADA: TFloatField;
    Inutil_QryImpostosOperacaoIDREGRAVENCUSADA: TFloatField;
    Inutil_QryImpostosOperacaoFLGCALCDIARIO: TFloatField;
    Inutil_QryImpostosOperacaoDESCCRED: TStringField;
    Inutil_QryImpostosOperacaoDESCIMP: TStringField;
    Inutil_QryBuscaImposto: TwwQuery;
    QryAux: TwwQuery;
    Inutil_qryTestaFechBoleta: TwwQuery;
    Inutil_QryConsulta: TwwQuery;
    Inutil_QryConsultaSGLBOLSAVALORES: TStringField;
    Inutil_QryConsultaDATAOPERACAO: TDateTimeField;
    Inutil_QryConsultaDATAVENCOPER: TDateTimeField;
    Inutil_QryConsultaQTDEOPERACAO: TFloatField;
    Inutil_QryConsultaIDOPERACAOINVEST: TFloatField;
    Inutil_QryConsultaPRECOUNITOPERACAO: TFloatField;
    Inutil_QryConsultaVLROPERACAO: TFloatField;
    Inutil_QryConsultaDESCMERCADO: TStringField;
    Inutil_QryConsultaNOME: TStringField;
    Inutil_QryConsultaDESCINVESTIMENTO: TStringField;
    Inutil_QryConsultaDESCTIPOOPERACAO: TStringField;
    Inutil_QryConsultaNUMDOCUMENTO: TStringField;
    Inutil_QryConsultaNATUREZAOPERACAO: TStringField;
    Inutil_QryConsultaIDTIPOOPERACAO: TFloatField;
    Inutil_QryConsultaIDTIPOINVEST: TFloatField;
    Inutil_QryConsultaIDTIPOOPERACAO_1: TFloatField;
    Inutil_QryConsultaIDFORCLI: TFloatField;
    Inutil_QryConsultaIDCARTEIRAINVEST: TFloatField;
    Inutil_QryConsultaCODTIPOACAO: TStringField;
    Inutil_QryConsultaMOECODIGO: TFloatField;
    Inutil_QryConsultaIDINVESTIMENTO: TFloatField;
    Inutil_QryConsultaIDLOTE: TStringField;
    Inutil_QryConsultaRECPAG: TStringField;
    QryRegAtualizacao: TwwQuery;
    Inutil_qryExcluiOperacoesCustodia: TwwQuery;
    Inutil_qryVencEmpAcoes: TwwQuery;
    Inutil_qryRevEmpAcoes: TwwQuery;
    QryBuscaOrdem: TwwQuery;
    QryBuscaOrdemIDCORRETVALORES: TFloatField;
    QryBuscaOrdemIDINVESTIMENTO: TFloatField;
    QryBuscaOrdemPUORDMOVINV: TFloatField;
    QryBuscaOrdemQTDEORDMOVINV: TFloatField;
    QryBuscaOrdemQTDEORDENADA: TFloatField;
    QryBuscaOrdemNUMDOCMOVINV: TStringField;
    QryBuscaOrdemSTATMOVINV: TStringField;
    QryBuscaOrdemIDTIPOINVEST: TFloatField;
    QryBuscaOrdemIDTIPOOPERACAO: TFloatField;
    QryBuscaOrdemIDCARTEIRAINVEST: TFloatField;
    QryBuscaOrdemIDLOTE: TStringField;
    QryBuscaOrdemIDBOLSAVALORES: TFloatField;
    QryBuscaOrdemIDCUSTODIANTE: TFloatField;
    QryBuscaOrdemDESCINVESTIMENTO: TStringField;
    QryBuscaOrdemIDCARTEIRAGERENC: TFloatField;
    QryBuscaOrdemIDPLANPREVCTBPATR: TFloatField;
    BtProcessar: TBitBtn;
    pnlTitulo: TPanel;
    lbNomDescricao: TfcLabel;
    bevFundo: TBevel;
    qryCarteira: TwwQuery;
    qryInvestimento: TwwQuery;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraDATAULTFECH: TDateTimeField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    Inutil_qryBuscaTRCeOPE: TwwQuery;
    qryCarteiraFLGCARTTERC: TStringField;
    ToolbarSep972: TToolbarSep97;
    pnlDados: TPanel;
    Label4: TLabel;
    Label1: TLabel;
    lblCarteira: TLabel;
    lblInvestimento: TLabel;
    dteDataInicio: TCMDateTimePicker;
    dteDataFinal: TCMDateTimePicker;
    dblkInvestimento: TwwDBLookupCombo;
    grbRendaVariavel: TGroupBox;
    pnlMensagens: TPanel;
    QryBuscaDireitos: TwwQuery;
    QryBuscaOperDireitos: TwwQuery;
    //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
    prbReproc: TProgressBar;
    chkCalculaOpcInd: TCheckBox;
    lblMensagem: TfcLabel;
    pnlEspacador: TPanel;
    chkCustodia: TCheckBox;
    qryBuscaOper: TwwQuery;
    Inurtil_QryInsOperacaoInvest: TwwQuery;
    chkAtualizaRV: TCheckBox;
    lblPlanoPatro: TLabel;
    qryPlanoPatro: TwwQuery;
    qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroIDPLANOPREV: TFloatField;
    qryPlanoPatroIDPATRO: TFloatField;
    dblkCarteira: TwwDBLookupCombo;
    dblPlanoPatro: TwwDBLookupCombo;
    chkCartGer: TCheckBox;
    //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
    prbReprocDia: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468
    procedure BtProcessarClick(Sender: TObject);
    procedure dteDataInicioExit(Sender: TObject);
    procedure dteDataFinalExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468
    procedure dblPlanoPatroExit(Sender: TObject);
    //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468
    procedure dblkCarteiraExit(Sender: TObject);
    //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468
    procedure dblkInvestimentoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    bPrivProcessado: Boolean;
    //AL_55
    CtrlCartGer: TCtrlCarteiraGerenc;
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
    Rv : TCustodia; //URendaVariavel
    //AL_51
    function  ExcluiRegAtualizacao(iInv: Integer = -1;
                                   iCarteira : Integer = -1;
                                   iPlanPrev: Integer = -1): Boolean;
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
    Procedure ConciliaSaldoCustodiaXCarteira(iPlanoPatro, iCarteira, iCarteiraGerenc,
                                iInvestimento, iCustodiante: Integer;
                                sLote: String; dData: TDateTime);
  public
    { Public declarations }
    Function  CalcCotacaoInvest(DataProc        : TDateTime;
                                iIdInvestimento : Integer) : Boolean;


    function  PodeReprocessar(iPlanPrev, iCarteira, iInvestimento: Integer;
                              DataRef: TDateTime): Boolean;


  end;

  // AL_38
  procedure AtualizaProg(sMsg: String = ''; iMax: Integer = -1);


var
  FrmFechtoRenVar: TFrmFechtoRenVar;
  DataProxFech, DataUltFech : TDate;
  wTipoRecDesBol, sDataProcesso:String;
  bCriaLancto, bReprocessa: boolean;
  //AL_51
  iIdHistCartInv, iInvProc, iCartProc, iPlanProc : Integer;
  fVlrRendimento : Double;

implementation

uses dOperacaoInvest, dBaseDados, UMensErro, USistema, UDataBase, UDiasUteis,UImpostos,
     ULancContab, UFuncoesRendaFixa,UDiasUteisInv,URendaFixa,
     UFundoComum, FPrincipal, dEmprestAcoes,uEmprestAcoes, UCotaComum,
     UOpcoes, UOpcaoIndice, dRendaVariavel, FTelaAut,
     FConsConciliacaoCustodia, FDmRelatorio,
     //Ricardo Cristiano - 06/07/2011 SOL 160922 - KINTANA 1354090
     uCtrlRendaVariavel;

Var  wTotalLiquido : Double;
     wDocumento    : String;

{$R *.DFM}

//-------------------------------------------------------------------
// Calcula Cotacao dos Investimento
function TFrmFechtoRenVar.CalcCotacaoInvest(DataProc : TDateTime;
                                            iIdInvestimento : Integer) : Boolean;
Var
  QryLocal, QryLocalAux :TwwQuery;
  wQtdLote, wVolNegociado, wVlrMedia : Double;
  wDec:Char;
  wSInvest : String;
  //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
  CtrlParamCotacaoRV : TCtrlParamCotacaoRV;
  wCampo, wTipo : String;

Begin
  Result := False;
  //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
  Try
     // Cria Objetos Locais
     QryLocal              := TwwQuery.Create(Application);
     QryLocal.DatabaseName := 'BaseDados';

     QryLocalAux              := TwwQuery.Create(Application);
     QryLocalAux.DatabaseName := 'BaseDados';
     //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
     CtrlParamCotacaoRV := TCtrlParamCotacaoRV.Create;
     CtrlParamCotacaoRV.InitializeAs(Padroes);

     wCampo := CtrlParamCotacaoRV.RetornaCotacaoVigente(DataProc,wTipo);

     Try
        If iIdInvestimento <> -1 Then
           wSInvest := ' AND (IV.IDINVESTIMENTO = '+IntToStr(iIdInvestimento)+')'
        Else
           wSInvest := '';
        // Busca Dados dos Investimentos
        FazQuery(QryLocal,'SELECT DISTINCT CI.IDACAO AS IDINVESTIMENTO, IV.DESCINVESTIMENTO '+
                          'FROM COTACAOACAO CI, INVESTIMENTO IV '+
                          'WHERE  (CI.IDACAO = IV.IDINVESTIMENTO) AND '+
                          '       (IV.IDTIPOINVEST = 2) '+wSInvest);

        While Not QryLocal.Eof Do
        Begin
           //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
           //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
           // Busca Volume Negociado do Investimento na maior Bolsa
           FazQuery(QryLocalAux,
                    'SELECT COTACAOACAO.VOLNEGOCIADO, COTACAOACAO.'+wCampo+' AS VLRMEDIA, COTACAOACAO.QTDELOTE ' +
                    'FROM COTACAOACAO '+
                    'WHERE 	(COTACAOACAO.IDACAO = '''+
                      QryLocal.FieldByName('IDINVESTIMENTO').AsString+''') AND '+
                    '      	(COTACAOACAO.DATACOTAACAO = TO_DATE( '''+DateToStr(DataProc)+''',''DD/MM/YYYY'')) '+
                    'ORDER BY COTACAOACAO.VOLNEGOCIADO DESC ');
           wVolNegociado:= QryLocalAux.FieldByName('VOLNEGOCIADO').AsFloat;
           wVlrMedia    := QryLocalAux.FieldByName('VLRMEDIA').AsFloat;
           wQtdLote     := QryLocalAux.FieldByName('QTDELOTE').AsFloat;

           If (QryLocalAux.IsEmpty) Or (wVolNegociado < 0 ) Then
           Begin
             QryLocal.Next;
             Continue;
           End;

           // Caso Já Exista Cotacao no Dia Altera se não Insere
           wDec := DecimalSeparator;
           DecimalSeparator := '.';
           //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
           If FazQuery(QryLocalAux,
                'SELECT COTACAOINVEST.IDINVESTIMENTO '+
                'FROM COTACAOINVEST '+
                'WHERE 	(COTACAOINVEST.IDINVESTIMENTO = '''+QryLocal.FieldByName('IDINVESTIMENTO').AsString+''') AND '+
                '      	(COTACAOINVEST.DATACOTACAO    = TO_DATE( '''+DateToStr(DataProc)+''',''DD/MM/YYYY''))') Then
           Begin
              // Atualiza Registro de Cotacao
              If Not ExecutaQuery(QryLocalAux,
                       'UPDATE COTACAOINVEST SET '+
                       '  DATACOTACAO      = TO_DATE( '''+DateToStr(DataProc)+''',''DD/MM/YYYY''),'+
                       '  IDINVESTIMENTO   = '''+QryLocal.FieldByName('IDINVESTIMENTO').AsString+''', '+
                       '  VLRCONTABIL      = '+FloatToStr(wVlrMedia)+','+
                       '  VLRGERENCIAL     = '+FloatToStr(wVlrMedia)+','+
                       '  QTDTITLOTE       = '+FloatToStr(wQtdLote) +' '+
                       'WHERE  (IDINVESTIMENTO = '''+QryLocal.FieldByName('IDINVESTIMENTO').AsString+''') AND '+
                       '       (DATACOTACAO    = TO_DATE('''+DateToStr(DataProc)+''',''DD/MM/YYYY'''+'))') Then
                 Raise Exception.Create('Atualizar Cotação de ' + QryLocal.FieldByName('DESCINVESTIMENTO').AsString );
           End Else Begin
              // Inclui Registro de Cotacao
              if not ExecutaQuery(QryLocalAux,
                       'INSERT INTO COTACAOINVEST '+
                       '(DATACOTACAO, IDINVESTIMENTO, VLRCONTABIL, VLRGERENCIAL, QTDTITLOTE ) '+
                       'VALUES (TO_DATE( '''+DateToStr(DataProc)+''',''DD/MM/YYYY''),'+
                       ''''+ QryLocal.FieldByName('IDINVESTIMENTO').AsString +''','+
                       FloatToStr(wVlrMedia) +','+
                       FloatToStr(wVlrMedia) +','+
                       FloatToStr(wQtdLote)  +')') then
                 Raise Exception.Create('Incluir Cotação de ' + QryLocal.FieldByName('DESCINVESTIMENTO').AsString );
           End;
           DecimalSeparator := wDec;
           QryLocal.Next;
        End;
        Result := True;
     Except
        on E:Exception do
        begin
           MsgDlg('Não foi possível atualizar a Cotação das Ações. '+ #13 +
                  E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
           Result := False;
        end;
     end;
  finally
     // Libera Objetos Locais
     QryLocal.Free;
     QryLocalAux.Free;
     //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
     FreeAndNil(CtrlParamCotacaoRV);
     Application.ProcessMessages;
  end;
End;

//------------------------------------------------------------------------------
// Fecha Formulario
procedure TFrmFechtoRenVar.FormClose(Sender: TObject;
var Action: TCloseAction);
begin


   // Caso o Banco esteja em Transacao Cancela
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
   RendaVariavel.GravaEmAbertura('N');  //William M. Santos SOL 119590 Nº KINTANA 569490
   inherited;
end;

//------------------------------------------------------------------------------
// Mostra Formulario
procedure TFrmFechtoRenVar.FormShow(Sender: TObject);
Var  TipoInvest:String;
begin
   inherited;

   Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');
   bReprocessa := False;
   bCriaLancto := true;
   wTipoRecDesBol := '';
   BtProcessar.Enabled :=True;

   if pRPI.DATAULTFECH <> 0 then
   begin
      dteDataInicio.Date    := pRPI.DATAULTFECH + 1;
      While not DiasUteisInv.DiaUtil(dteDataInicio.Date,-1,1,'',True,False,False) Do
         dteDataInicio.Date := dteDataInicio.Date +1;

      dteDataFinal.Date      := dteDataInicio.Date;
   end
   else
   begin
      dteDataInicio.Date     := Date;
      dteDataFinal.Date      := Date;
   end;

   chkAtualizaRV.Checked     := True;

   OperComum.LimpaParametros(qryCarteira);
   qryCarteira.Open;

   //AL_51
   qryPlanoPatro.Open;

   OperComum.LimpaParametros(qryInvestimento);
   qryInvestimento.Open;

   if CtrlPInv.FlgCompVarRV = 'S' then
      dblkInvestimento.Enabled := False;

   if CtrlPInv.FlgCartGerenc <> 'S' then
   begin
      chkCartGer.Checked := False;
      chkCartGer.Enabled := False;
   end;
   //AL_55 - Fim
   //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
   chkCustodia.Checked := True;
end;

//------------------------------------------------------------------------------
procedure TFrmFechtoRenVar.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if not dtmBaseDados.dbBaseDados.InTransaction then
   begin
      //Al_28
      MsgDlg('Problemas no Controle de Transações. Transação já Comitada', 'Mensagem do Sistema', mtInformation,[MbOk],0);
      DtmBaseDados.dbBaseDados.StartTransaction;
   end;
   // Guarda a Data do Ultimo Fechamento
   If (DataProxFech <> 0) Then
   begin
      If ((Trim(dblkCarteira.Text) <> '') And (qryCarteira.FieldByName('FLGCARTTERC').AsString <> 'S')) or
         (Trim(dblkCarteira.Text) = '') Then
         ExecutaQuery(QryAux,'UPDATE PARAMINVEST SET DATAULTFECH = TO_DATE('''+
                      DateToStr(DataProxFech)+''',''DD/MM/YYYY'')');
   end;

   // Caso o Banco esteja em Transacao Commita
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Commit;

   //AL_39
   RendaVariavel.GravaEmAbertura('N');

   // Monta Registro do Parâmetro
   Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');

   // Inabilita Botao
   bbtnCancelar.Enabled  := False;
   bbtnConfirmar.Enabled := False;
   BtProcessar.Enabled   := True;
   // Preenche Datas com o ultimo fechamento + 1
   If FazQuery(QryAux,'SELECT DATAULTFECH FROM PARAMINVEST') Then
   Begin
      // Caso Nao exista ultimo fechamento Cria com a primeira operacao feita
      If QryAux.FieldByName('DATAULTFECH').AsDateTime = 0 Then
      Begin
         // A Desenvolver
      End;
      lblMensagem.Caption   := 'Último Fechamento .: '+DateToStr(QryAux.FieldByName('DATAULTFECH').AsDateTime);
      dteDataInicio.Date    := QryAux.FieldByName('DATAULTFECH').AsDateTime+1;
      While not DiasUteisInv.DiaUtil(dteDataInicio.Date,-1,1,'',True,False,False) Do
         dteDataInicio.Date := dteDataInicio.Date + 1;   // Achar o próximo dia útil

      dteDataFinal.Date     := dteDataInicio.Date;
   End Else Begin
     lblMensagem.Caption    := 'Último Fechamento .: '+DateToStr(Date);
   End;

   Application.ProcessMessages;
   dteDataInicio.Enabled    := True;
   dteDataFinal.Enabled     := True;

   dblkCarteira.Clear;
   dblkInvestimento.Clear;

   dblkCarteira.Enabled     := False;
   dblkInvestimento.Enabled := False;

   chkCustodia.Checked       := True;
   chkCalculaOpcInd.Checked  := True;
   chkAtualizaRV.Checked     := True;

   //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
   //chkCalculaOpcInd.Checked  := True;
   chkAtualizaRV.Checked     := True;

   // Click no Cancelar
   bbtnCancelar.Click;
   lblMensagem.Caption  := '';
end;

//------------------------------------------------------------------------------
procedure TFrmFechtoRenVar.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   // Cancela Despesas
   // Caso o Banco esteja em Transacao Rollbacka
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;

   //AL_39
   RendaVariavel.GravaEmAbertura('N');

   // Inabilita Botao
   //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468
   BtProcessar.Enabled   := True;

   // Zera barra de tarefas
   prbReproc.Max := 0;
   prbReproc.StepIt;

   // Preenche Datas com o ultimo fechamento + 1
   If FazQuery(QryAux,'SELECT DATAULTFECH FROM PARAMINVEST') Then
   Begin
      // Caso Nao exista ultimo fechamento Cria com a primeira operacao feita
      If QryAux.FieldByName('DATAULTFECH').AsDateTime = 0 Then Begin

      End;
      lblMensagem.Caption  := 'Último Fechamento .: '+DateToStr(QryAux.FieldByName('DATAULTFECH').AsDateTime);
      dteDataInicio.Text := DateToStr(QryAux.FieldByName('DATAULTFECH').AsDateTime+1);
      While not DiasUteisInv.DiaUtil(StrToDate(dteDataInicio.Text),-1,1,'',True,False,False) Do
         dteDataInicio.Text  := DateToStr(StrToDate(dteDataInicio.Text) + 1);   // Achar o próximo dia útil
   End Else Begin
      lblMensagem.Caption  := 'Último Fechamento .: '+DateToStr(Date);
   End;

   Application.ProcessMessages;
end;

//Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468

//AL_51
function  TFrmFechtoRenVar.ExcluiRegAtualizacao(iInv: Integer = -1;
                                                iCarteira : Integer = -1;
                                                iPlanPrev: Integer = -1): Boolean;
begin
   Try
      Result := False;
      OperComum.LimpaParametros(QryRegAtualizacao);

      if bReprocessa then
         QryRegAtualizacao.ParamByName('DATAMOVCARTINV').AsDateTime := pRPI.DATAULTFECH
      else
         QryRegAtualizacao.ParamByName('DATAMOVCARTINV').AsDateTime := StrToDate(dteDataInicio.Text);
      QryRegAtualizacao.ParamByName('IDTIPOINVEST').AsInteger := 2;
      if iPlanPrev <> -1 then
         QryRegAtualizacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
      if iInv <> -1 then
         QryRegAtualizacao.ParamByName('IDINVESTIMENTO').AsInteger := iInv;
      if iCarteira <> -1 then
         QryRegAtualizacao.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteira;
      QryRegAtualizacao.Open;

      If QryRegAtualizacao.RecordCount > 0 Then
      Begin
         frmAguarde.Pos := 0;
         frmAguarde.Max := QryRegAtualizacao.RecordCount;
         frmAguarde.Mostra('Limpando Base - Atualizações');
      End;

      While Not QryRegAtualizacao.Eof Do
      Begin
          with dtmOperComum.qryAuxiliar do
          begin
             if QryRegAtualizacao.FieldByName('PLNCODIGO').IsNull then
             begin
                Close;
                SQL.Clear;
                SQL.Text := 'DELETE FROM HISTCARTINV WHERE IDHISTCARTINV = '+IntToStr(QryRegAtualizacao.FieldByName('IDHISTCARTINV').AsInteger);
                ExecSQL;
                Close;
             end
             else
             begin
                Close;
                SQL.Clear;
                SQL.Text := 'DELETE FROM HISTCARTINV WHERE PLNCODIGO = '+IntToStr(QryRegAtualizacao.FieldByName('PLNCODIGO').AsInteger);
                ExecSQL;
                Close;
             end;
          end;

          // Exclui Lançamentos Contábeis da Planilha
          //    zerando os valores
          //AL_53 - Passa a valer a exclusão em 3 camadas
          //AL_57
          //AL_58
          if Not(QryRegAtualizacao.FieldByName('PLNCODIGO').IsNull) then
          begin   // Fim AL_58
             if not CtrlInvContab.InvExcluiLanc(QryRegAtualizacao.FieldByName('PLNCODIGO').AsInteger, 0, Sistema.UsaPlanoPatro, False) then
                Raise Exception.Create('Não foi Possível Excluir um Lançamento Contábil em ' + QryRegAtualizacao.FieldByName('DATAMOVCARTINV').AsString);
          end;

         QryRegAtualizacao.Next;
         frmAguarde.Pos := frmAguarde.Pos + 1;
      End;

      Result := True;

   Finally
      If QryRegAtualizacao.RecordCount > 0 Then
         frmAguarde.Apaga;
      QryRegAtualizacao.Close;
   End;
end;


procedure TFrmFechtoRenVar.BtProcessarClick(Sender: TObject);
Var
  //Ricardo Cristiano - 01/06/2011 - N. Sol 158890.5101 -  N. Kintana 1299398
  dDataHist,
  // AL_39 - Limpeza nas variaveis criadas
  dDataProc, dtIni, dtFim: TDateTime;
  //Ricardo Cristiano - 01/06/2011 - N. Sol 158890.5101 -  N. Kintana 1299398
  idHist,
  iDocumento, iPlano, iPlanilha, N, iNumCart: Integer;
  sTipoRecDesBol, sBoleta, sRecPagBol, sMensErro, sBolAbt: String;
  fTotalContab, fVlrRecPag : Double;
  //Ricardo Cristiano - 01/06/2011 - N. Sol 158890.5101 -  N. Kintana 1299398
  bSeqRepro,
  //AL_51
  bAcertoRecPag, bMostraMens: Boolean;

  // Kintana 1565594 SOL173552 Otacilio Aquino ** Inicio **
  sIDTIPOOPERACAO  , sIDINVESTIMENTO , sIDPLANPREVCTBPATR,
  sIDCARTEIRAINVEST, sIDCORRETVALORES: string;
  dDATAMOVCARTINV: TDateTime;
begin
   inherited;
   // Força a saída do componente atual para acionar o OnExit deste componente
   //    no caso de teclar enter e o botão for default
   SelectNext(ActiveControl,True,True);

   // AL_39
   if RendaVariavel.VerEmAbertura then
      Exit;

   try // Finally
      try// Except William M. Santos
      //AL_51 - ini
         bMostraMens := True;
         BtProcessar.Enabled := False;
         bbtnSair.Enabled := False;
         iInvProc := -1;
         iCartProc := -1;
         iPlanProc := -1;

         if Trim(dblPlanoPatro.Text) <> '' then
            iPlanProc := StrToInt(dblPlanoPatro.LookupValue);

         if Trim(dblkCarteira.Text) <> '' then
            iCartProc := StrToInt(dblkCarteira.LookupValue);

         if Trim(dblkInvestimento.Text) <> '' then
            iInvProc    := StrToInt(dblkInvestimento.LookupValue);

         if (dteDataInicio.Text = '') or (dteDataFinal.Text = '') then
         begin
            MsgDlg('As Datas Inicial e Final devem ser Preenchidas!',
                   'Mensagem do Sistema', MtInformation,[MbOk],0);
            if dteDataInicio.CanFocus then
               dteDataInicio.SetFocus;
            Exit;
         end;

         // Caso o usuário tente processar ou reprocessar mais de 30 dias
         if dteDataFinal.DateTime - dteDataInicio.DateTime > 30 then
         begin
            if MsgDlg('Deseja Realmente Processar mais de 30 dias!',
                      'Mensagem do Sistema', MtConfirmation,[MbYes, MbNo],0) = MrNo then
            begin
               if dteDataInicio.CanFocus then
                  dteDataInicio.SetFocus;
               Exit;
            end;
         end;

         // AL_25 - Novo Teste de Periodo contábil
         //AL_50
         if not CtrlInvContab.TestaPeriodo(dteDataInicio.Text, 2) then
         begin
            MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtInformation, [mbOk], 0);
            if dteDataInicio.CanFocus then
               dteDataInicio.SetFocus;
            Exit;
         end;

         // AL_39
         RendaVariavel.GravaEmAbertura;

         //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
         if (not bReprocessa) then
         begin
            // Abre a query para verificar necessidade de reprocessar invesimentos já marcados
            OperComum.LimpaParametros(DMRendaVariavel.qryBuscaFlgReproc);
            DMRendaVariavel.qryBuscaFlgReproc.Open;
         end;

         if (bReprocessa) or (not DMRendaVariavel.qryBuscaFlgReproc.IsEmpty) then
         begin

            //chkCustodia.Checked := False; //Renan 17/08/2010 - Sol. 127135 - Kintana 694808

            try
               // AL_1 - 31/05/2004 - Melhora de performance - Inicio
               if bReprocessa then
               begin
                  // Reprocessamento selecionado na tela
                  lblMensagem.Caption  := 'Selecionando Investimentos para Reprocessamento' + #13 + ' ';
                  Application.ProcessMessages;

                  If Not DtmBaseDados.dbBaseDados.InTransaction Then
                     DtmBaseDados.dbBaseDados.StartTransaction;

                  // Reprocessar o investimento selecionado
                  if not RendaVariavel.MarcarFlagReproc(iInvProc,iCartProc,iPlanProc,dteDataInicio.Date, False) then
                     Raise Exception.Create('Marcar os Investimentos para Reprocessamento.');

                  // Passa a comitar a marcação
                  If DtmBaseDados.dbBaseDados.InTransaction Then
                     DtmBaseDados.dbBaseDados.Commit;
               end;

               prbReproc.Position := 0;
               prbReproc.Max := 100;
               //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
               prbReprocDia.Position := 0;
               prbReprocDia.Max := 100;
               // AL_1 - 31/05/2004 - Melhora de performance - Fim

               // AL_39 - Inicio do novo reprocessamento
               // Reabre a query para pegar tb os registros marcados acima
               OperComum.LimpaParametros(DMRendaVariavel.qryBuscaFlgReproc, True);
               DMRendaVariavel.qryBuscaFlgReproc.Open;

               // Exclui Registros Posteriores de  ATU,TRC e Dtos
               // Somente na primeira passagem
               // AL_41 - Seleciona somente carteiras que tenham
               //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
               qryAux.SQL.Clear;
               qryAux.SQL.Add('SELECT CARTEIRAINVEST.IDCARTEIRAINVEST, CARTEIRAINVEST.DESCCARTINVEST ');
               qryAux.SQL.Add('FROM CARTEIRAINVEST ');
               qryAux.SQL.Add('WHERE CARTEIRAINVEST.IDCARTEIRAINVEST IN ');
               qryAux.SQL.Add('     (SELECT DISTINCT HISTCARTINV.IDCARTEIRAINVEST ');
               qryAux.SQL.Add('      FROM HISTCARTINV ');
               qryAux.SQL.Add('      WHERE HISTCARTINV.FLGCALCSALDO IS NOT NULL)');
               qryAux.Open;

               iNumCart := 1;

               // Assinala a rotina AtualizaProg ao evento AtualizaProcFech da unit RendaVariavel
               uRendaVariavel.AtualizaProcFech := AtualizaProg;
               while not qryAux.Eof do
               begin
                  If Not DtmBaseDados.dbBaseDados.InTransaction Then
                     DtmBaseDados.dbBaseDados.StartTransaction;

                  if not RendaVariavel.ExcluiHistRV(-1 {PlanoPatro},
                                                    qryAux.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                    -1{iInvProc},
                                                    dteDataInicio.DateTime, -1,
                                                    'Excluindo Históricos' + #13 + 'Carteira: ' + qryAux.FieldByName('DESCCARTINVEST').AsString +
                                                    ' (' + IntToStr(iNumCart) + ' de ' + IntToStr(qryAux.RecordCount) + ')' ) then
                     Raise Exception.Create('Excluir Históricos Posteriores.');

                  //Passa a comitar a exclusão por registro
                  If DtmBaseDados.dbBaseDados.InTransaction Then
                     DtmBaseDados.dbBaseDados.Commit;

                  qryAux.Next;

                  Inc(iNumCart);
               end;
               qryAux.Close;

               // Limpa o evento AtualizaProcFech da unit RendaVariavel
               uRendaVariavel.AtualizaProcFech := nil;
               //AL_51
               AtualizaProg('', -2);

               // Reprocesso os Investimentos com FLG=5 até a data de ult fech
               // da carteira independentes de estar em reprocesso ou não
               // Para cada Investimento marcado para reprocessar

               DMRendaVariavel.qryBuscaFlgReproc.First;
               // Capta a menor data a ser reprocessada e processa todos os dias até o último fechamento
               // AL_41 - Não reprocessa o dia que está marcado, só o dia seguinte
               if DMRendaVariavel.qryBuscaFlgReproc.FieldByName('DATAMOVCARTINV').IsNull then
               begin
                  dtIni := dteDataInicio.Date;
                  dDataProc := dtIni;
               end
               else
               begin
                  dtIni := DMRendaVariavel.qryBuscaFlgReproc.FieldByName('DATAMOVCARTINV').AsDateTime;
                  dDataProc := DiasUteisInv.PrimeiroDiaUtilPosterior(dtIni,-1,1,'',True,False,False);
               end;
               //Ricardo Cristiano SOL 124440/1481 / KTN 800170 - 03/05/2010
               // Capta data final - Data do último fechamento
               if ((not DMRendaVariavel.qryBuscaFlgReproc.IsEmpty) and (not bReprocessa)) then
                  dtFim := dteDataFinal.Date
               else
                  dtFim := pRPI.DATAULTFECH;

               // AL_25 - Novo Teste de Periodo contábil
               //AL_50
               if not CtrlInvContab.TestaPeriodo(DateToStr(dDataProc), 2) then
               begin
                  MsgDlg(CtrlInvContab.MessageInfo + #13 +
                         'Não é possível reprocessar o dia ' + DateToStr(dDataProc), 'Mensagem do Sistema', mtInformation, [mbOk], 0);
                  bbtnCancelar.Click;
                  Exit;
               end;

               //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
               // Prepara o progressbar
               prbReprocDia.Position := 0;
               prbReprocDia.Max      := DiasUteisInv.IntervaloDiasUteis(dtIni, dtFim, -1, 1, '', True, False, False) ;
               Application.ProcessMessages;

               // Processa até a data do fechamento atual
               while dDataProc <= dtFim do
               begin
                  //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
                  prbReprocDia.StepIt;
                  Application.ProcessMessages;

                  // AL_41 - Abre uma transação por dia
                  If Not DtmBaseDados.dbBaseDados.InTransaction Then
                     DtmBaseDados.dbBaseDados.StartTransaction;

                  // AL_46 - Retirada da Função

                  // Capta novamente os investimentos marcados, para o caso de ter sido
                  //   lançado uma nova posição (Inicial ou TRC) em algum investimento
                  OperComum.LimpaParametros(DMRendaVariavel.qryBuscaFlgReproc);
                  DMRendaVariavel.qryBuscaFlgReproc.Open;
                  //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
                  AtualizaProg('Relançando dia ' + DateToStr(dDataProc) + #13 +
                               'Plano/Patroc.  ' + DMRendaVariavel.qryBuscaFlgReproc.FieldByName('PLANPRVCONTABPATRO').AsString + #13 +
                               'Carteira       ' + DMRendaVariavel.qryBuscaFlgReproc.FieldByName('DESCCARTINVEST').AsString + #13 +
                               'Investimento   ' + DMRendaVariavel.qryBuscaFlgReproc.FieldByName('DESCINVESTIMENTO').AsString,
                               DMRendaVariavel.qryBuscaFlgReproc.RecordCount);

                  DMRendaVariavel.qryBuscaFlgReproc.First;
                  while not DMRendaVariavel.qryBuscaFlgReproc.Eof do
                  begin
                     //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
                     AtualizaProg('Relançando dia ' + DateToStr(dDataProc) + #13 +
                                  'Plano/Patroc.  ' + DMRendaVariavel.qryBuscaFlgReproc.FieldByName('PLANPRVCONTABPATRO').AsString + #13 +
                                  'Carteira       ' + DMRendaVariavel.qryBuscaFlgReproc.FieldByName('DESCCARTINVEST').AsString + #13 +
                                  'Investimento   ' + DMRendaVariavel.qryBuscaFlgReproc.FieldByName('DESCINVESTIMENTO').AsString);

                     // Caso o Investimento esteja marcado em data maior ou igual a data atual, não processa
                     if DMRendaVariavel.qryBuscaFlgReproc.FieldByName('DATAMOVCARTINV').AsDateTime >= dDataProc then
                     begin
                        DMRendaVariavel.qryBuscaFlgReproc.Next;
                        Continue;
                     end;

                     //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509

                     if not CalcCotacaoInvest(dDataProc, DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDINVESTIMENTO').AsInteger) then
                        raise Exception.Create('Atualizar as Cotações.');

                     //Ricardo Cristiano - 01/06/2011 - N. Sol 158890.5101 -  N. Kintana 1299398
                     bSeqRepro := False;

                     //Ricardo Cristiano - 25/07/2011 - N. Sol 156970 -  N. Kintana 1360831
                     //Ricardo Cristiano - 01/06/2011 - N. Sol 158890.5101 -  N. Kintana 1299398
                     //Verifica se há TRC de Empréstimo com Reversão Total - Posicionar para fazer esse.
                     if FazQuery(QryAux, ' SELECT OE.IDOPEREMPACOESIMPORTA FROM OPEREMPACOESIMPORTA OE '+
                                         //Ricardo Cristiano - 11/08/2011 SOL 163042 - KINTANA 1388966                     
                                         '  WHERE OE.TIPOMOVIMENTO IN (''2'',''3'')' +
                                         '    AND OE.FLGSITUACAOIMPORT = ''2''' +
                                         '    AND OE.IDINVESTIMENTO = '+
                                                  DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDINVESTIMENTO').AsString +
                                         '    AND OE.IDPLANPREVCTBPATR = '+
                                                  DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDPLANPREVCTBPATR').AsString +
                                         '    AND OE.DATAOPERACAO  = TO_DATE('+QuotedStr(DateToStr(dDataProc))+','+QuotedStr('DD/MM/YYYY')+')') then
                     begin
                        idHist    := DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDHISTCARTINV').AsInteger;
                        dDataHist := DMRendaVariavel.qryBuscaFlgReproc.FieldByName('DATAMOVCARTINV').AsDateTime;

                        if not DMRendaVariavel.qryBuscaFlgReproc.Locate('IDINVESTIMENTO;IDCARTEIRAINVEST;IDPLANPREVCTBPATR;DATAMOVCARTINV',
                                            VarArrayOf([DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDINVESTIMENTO').AsInteger,
                                                        pRPI.IDCARTEMPACOES,
                                                        DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                        dDataHist]),[]) then
                           //Ricardo Cristiano - 11/08/2011 SOL 163042 - KINTANA 1388966 - Não encontrado retorna ao registro inicial
                           DMRendaVariavel.qryBuscaFlgReproc.Locate('IDHISTCARTINV',idHist,[])
                        else
                           bSeqRepro := True;
                     end;

                     // Reprocessa todas as boletas do dia e depois atualiza o investimento
                     //AL_51 - O Erro já é gerado dentro da rotina
                     bMostraMens := False;
                     if not RendaVariavel.IncluiRegistros(DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDINVESTIMENTO').AsInteger,
                                                          DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                          DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                          dDataProc) then
                        raise Exception.Create('Lançamento de operações e atualização de saldo.');

                     // Atualização do dia (ATU)
                     if not RendaVariavel.AtualizaSaldoInvestRV(DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                                dDataProc) then
                        Raise Exception.Create('Não foi possível efetuar a Atualização Diária de ' + DateToStr(dDataProc) + ', '#13 +
                                               'o processo será cancelado.');

                     //Ricardo Cristiano - 17/04/2011 - N. Sol 157990.4821 -  N. Kintana 1273974
                     //Se for carteira de empréstimo, verificar se há transferência e atualizar a posição de destino
                     if not RendaVariavel.AtualizaCarteiraDestino(DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                  DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                  DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                                  dDataProc) then
                        Raise Exception.Create('Não foi possível efetuar a Atualização Diária de ' + DateToStr(dDataProc) + ', '#13 +
                                               'o processo será cancelado.');

                     bMostraMens := True;

                     //Ricardo Cristiano - 06/11/2010 - N. Sol 147252 -  N. Kintana 1014147
                     Application.ProcessMessages;

                     If Not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) Then
                        //Al_77 - 21/06/2005
                        Raise Exception.Create('Não foi possível Atualizar o Saldo do dia '+ DateToStr(dDataProc) +', '#13 +
                                               'o processo será cancelado.');

                     //Ricardo Cristiano - 14/07/2011 SOL 161488 - KINTANA 1361915 - Alterado o lugar para atualizar custódia, efetivar logo após as operações.
                     //Renan 17/08/2010 - Sol. 127135 - Kintana 694808 Inicio.
                     if (chkCustodia.Checked) then
                     begin
                        //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
                        AtualizaProg('Conciliação de Custódia do dia ' + DateToStr(dDataProc) + #13 +
                                     'Plano/Patroc.  ' + DMRendaVariavel.qryBuscaFlgReproc.FieldByName('PLANPRVCONTABPATRO').AsString + #13 +
                                     'Carteira       ' + DMRendaVariavel.qryBuscaFlgReproc.FieldByName('DESCCARTINVEST').AsString + #13 +
                                     'Investimento   ' + DMRendaVariavel.qryBuscaFlgReproc.FieldByName('DESCINVESTIMENTO').AsString);

                        //Verifica o saldo da Carteira e Custodia no dia.
                        //Caso estejam diferentes, arruma o saldo da cusdtodia com base na carteira.
                        ConciliaSaldoCustodiaXCarteira(DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                       DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                       DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                       DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDINVESTIMENTO').AsInteger,
                                                       10, //Custodiante (BRADESCO)
                                                       '', //Lote
                                                       dDataProc);
                     end;
                     //Renan 17/08/2010 - Sol. 127135 - Kintana 694808 Fim


                     //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
                     //Ricardo Cristiano - 06/11/2010 - N. Sol 147252 -  N. Kintana 1014147
                     AtualizaProg('Remarcando dia ' + DateToStr(dDataProc) + #13 +
                                  'Plano/Patroc.  ' + DMRendaVariavel.qryBuscaFlgReproc.FieldByName('PLANPRVCONTABPATRO').AsString + #13 +
                                  'Carteira       ' + DMRendaVariavel.qryBuscaFlgReproc.FieldByName('DESCCARTINVEST').AsString + #13 +
                                  'Investimento   ' + DMRendaVariavel.qryBuscaFlgReproc.FieldByName('DESCINVESTIMENTO').AsString);

                     // AL_41 - Remarca o investimento para este dia
                     if not RendaVariavel.RemarcaFlgReproc(DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDINVESTIMENTO').AsInteger,
                                                           DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                           DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                           DMRendaVariavel.qryBuscaFlgReproc.FieldByName('DATAMOVCARTINV').AsDateTime,
                                                           (dDataProc + 1)) then
                        Raise Exception.Create('Remarcar o Investimento do dia ' +
                                               DMRendaVariavel.qryBuscaFlgReproc.FieldByName('DATAMOVCARTINV').AsString +
                                               ' para o dia ' + DateToStr((dDataProc + 1)));

                     //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
                     // Remarca para o dia seguinte
                     if not RendaVariavel.MarcarFlagReproc(DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDINVESTIMENTO').AsInteger,
                                                           DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                           DMRendaVariavel.qryBuscaFlgReproc.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                           (dDataProc + 1), False, False, True, True) then
                        Raise Exception.Create('O Investimento não pode ser remarcado para o dia ' + DateToStr((dDataProc + 1)));

                     // Próximo Investimento marcado
                     DMRendaVariavel.qryBuscaFlgReproc.Next;

                     //Ricardo Cristiano - 01/06/2011 - N. Sol 158890.5101 -  N. Kintana 1299398
                     if bSeqRepro then
                     begin
                        OperComum.LimpaParametros(DMRendaVariavel.qryBuscaFlgReproc);
                        DMRendaVariavel.qryBuscaFlgReproc.Open;
                        DMRendaVariavel.qryBuscaFlgReproc.First;
                        //Ricardo Cristiano - 11/08/2011 SOL 163042 - KINTANA 1388966 - Retorna ao registro inicial
                        DMRendaVariavel.qryBuscaFlgReproc.Locate('IDHISTCARTINV', idHist,[])
                     end;
                  end;

                  //Ricardo Cristiano - 14/07/2011 SOL 161488 - KINTANA 1361915 - Alterado o lugar para atualizar custódia, efetivar logo após as operações.
                  
                  //Ricardo Cristiano - 06/11/2010 - N. Sol 147252 -  N. Kintana 1014147
                  // AL_41 - Contabiliza o Dia - Ini
                  // Contabiliza o Reprocessamento das OPE e DTO marcadas com FLG = 6
                  iDocumento     :=-1;
                  bCriaLancto    := True;
                  sTipoRecDesBol := '';

                  DMRendaVariavel.qryBuscaFlgContab.Open;

                  //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
                  AtualizaProg('Verificando - Contabilizar o dia  ' + DateToStr(dDataProc)+'.',
                               DMRendaVariavel.qryBuscaFlgContab.RecordCount);

                  while not DMRendaVariavel.qryBuscaFlgContab.EOF do
                  begin
                     sBoleta    := DMRendaVariavel.qryBuscaFlgContab.FieldByName('IDBOLETA').AsString;
                     iPlano     := DMRendaVariavel.qryBuscaFlgContab.FieldByName('PLANO').AsInteger;
                     iPlanilha  := DMRendaVariavel.qryBuscaFlgContab.FieldByName('PLNCODIGO').AsInteger;
                     iDocumento := DMRendaVariavel.qryBuscaFlgContab.FieldByName('CODDOCUMENTO').AsInteger;

                     //AL_35
                     bAcertoRecPag := False;
                     while not (DMRendaVariavel.qryBuscaFlgContab.EOF) and
                               (sBoleta = DMRendaVariavel.qryBuscaFlgContab.FieldByName('IDBOLETA').AsString) do
                     begin
                        // Al_33

                        //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
                        AtualizaProg('Contabilizando a Boleta ' + sBoleta + #13 +
                                     'Operação      : '+DMRendaVariavel.qryBuscaFlgContab.FieldByName('DESCTIPOOPERACAO').AsString + #13 +
                                     'Investimentos : '+DMRendaVariavel.qryBuscaFlgContab.FieldByName('DESCINVESTIMENTO').AsString);

                        if (DMRendaVariavel.qryBuscaFlgContab.FieldByName('VLRTOTLIQUIDAR').AsFloat < 0) then
                           sRecPagBol := 'R'
                        else
                           sRecPagBol := 'P';

                        // Ver como testar a PLACONTA se alterou
                        // AL_25
                        //AL_51 - Contabiliza por plano/patro
                        if OperComum.LancaOperRFRV(Sistema.IdEmpresa, 79,2,
                                                   DMRendaVariavel.qryBuscaFlgContab.FieldByName('IDINVESTIMENTO').AsInteger,
                                                   DMRendaVariavel.qryBuscaFlgContab.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                   DMRendaVariavel.qryBuscaFlgContab.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                   DMRendaVariavel.qryBuscaFlgContab.FieldByName('IDFORCLI').AsInteger,
                                                   DMRendaVariavel.qryBuscaFlgContab.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                   DMRendaVariavel.qryBuscaFlgContab.FieldByName('MOECODIGO').AsInteger,
                                                   DMRendaVariavel.qryBuscaFlgContab.FieldByName('CODTIPOACAO').AsString,
                                                   DMRendaVariavel.qryBuscaFlgContab.FieldByName('IDLOTE').AsString,'',
                                                   DMRendaVariavel.qryBuscaFlgContab.FieldByName('NUMDOCUMENTO').AsString,
                                                   sRecPagBol, sTipoRecDesBol, bCriaLancto, fTotalContab,
                                                   DMRendaVariavel.qryBuscaFlgContab.FieldByName('VLRMOVCARTINV').AsFloat,
                                                   DMRendaVariavel.qryBuscaFlgContab.FieldByName('DATAMOVCARTINV').AsDateTime,
                                                   DMRendaVariavel.qryBuscaFlgContab.FieldByName('DATAVENCOPER').AsDateTime,
                                                   iPlano, iPlanilha, iDocumento, sMensErro, 'N',False, False, 0, True,
                                                   DMRendaVariavel.qryBuscaFlgContab.FieldByName('IDPLANPREVCTBPATR').AsInteger) <> 0 then
                        begin
                           bbtnCancelar.Click;
                           Exit;
                        end;

                        //AL_35 Ini
                        if (pRPI.FLGRECPAGRV = 'S') and (not bAcertoRecPag) then
                        begin
                           // AL_40
                           fVlrRecPag := 0;
                           FazQuery(QryAux,'SELECT BOLETA.VLRTOTAPAG, BOLETA.VLRTOTAREC FROM BOLETA WHERE IDBOLETA = ' + QuotedStr(sBoleta));
                           if QryAux.FieldByName('VLRTOTAPAG').AsFloat <> 0 then
                              fVlrRecPag := QryAux.FieldByName('VLRTOTAPAG').AsFloat
                           else if QryAux.FieldByName('VLRTOTAREC').AsFloat <> 0 then
                              fVlrRecPag := QryAux.FieldByName('VLRTOTAREC').AsFloat;

                           if (not qryAux.IsEmpty) and (fVlrRecPag <> 0) then
                           begin
                              //AL_51 - Contabiliza por Plano/Patro
                              if OperComum.LancaOperRFRV(Sistema.IdEmpresa, 79,2,
                                                         -1,
                                                         -109,
                                                         DMRendaVariavel.qryBuscaFlgContab.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                         DMRendaVariavel.qryBuscaFlgContab.FieldByName('IDFORCLI').AsInteger,
                                                         -1,
                                                         DMRendaVariavel.qryBuscaFlgContab.FieldByName('MOECODIGO').AsInteger,
                                                         '',
                                                         '',
                                                         '',
                                                         DMRendaVariavel.qryBuscaFlgContab.FieldByName('NUMDOCUMENTO').AsString,
                                                         sRecPagBol, sTipoRecDesBol, bCriaLancto, fTotalContab,
                                                         fVlrRecPag,
                                                         DMRendaVariavel.qryBuscaFlgContab.FieldByName('DATAMOVCARTINV').AsDateTime,
                                                         DMRendaVariavel.qryBuscaFlgContab.FieldByName('DATAVENCOPER').AsDateTime,
                                                         iPlano, iPlanilha, iDocumento, sMensErro, 'N',False, False, 0, True,
                                                         DMRendaVariavel.qryBuscaFlgContab.FieldByName('IDPLANPREVCTBPATR').AsInteger) <> 0 then
                              begin
                                 bbtnCancelar.Click;
                                 Exit;
                              end;
                              bAcertoRecPag := True;
                           end;
                        end;

                        // Atualiza Plano e PlnCodigo da IRLITIGIO
                        if DMRendaVariavel.qryBuscaFlgContab.FieldByName('TIPMOVCARTINV').AsString <> 'TRC' then
                        begin
                           //AL_3
                           if (not DMRendaVariavel.qryBuscaFlgContab.FieldByName('IDOPERACAOINVEST').IsNull) And
                              (iPlanilha > 0) And (iPlano > 0) then
                           begin
                              ExecutaQuery(qryAux,'UPDATE IRLITIGIO ' +
                                                  'SET IRLITIGIO.PLNCODIGO = ' + IntToStr(iPlanilha)+ ', IRLITIGIO.PLANO = ' + IntToStr(iPlano)+ ' ' +
                                                  'WHERE (IRLITIGIO.IDOPERACAOINVEST = ' + DMRendaVariavel.qryBuscaFlgContab.FieldByName('IDOPERACAOINVEST').AsString+')');
                              qryAux.Close;                    
                           end;
                        end;

                        DMRendaVariavel.qryBuscaFlgContab.Next;
                     end;
                     //AL_35
                     bAcertoRecPag := False;

                     //AL_3
                     // Atualiza a tabela LanctoDocum com a nova Planilha
                     if (iDocumento > 0) And (iPlanilha > 0) then
                     begin
                        ExecutaQuery(qryAux,
                        // AL_34 - 09/08/2005
                           ' UPDATE LANCTODOCUM SET LANCTODOCUM.PLNCODIGO = '+IntToStr(iPlanilha) +
                           ' WHERE  LANCTODOCUM.NUMLANCTO IN (SELECT L.NUMLANCTO ' +
                           '                                  FROM DOCUMENTO D, LANCTODOCUM L ' +
                           '                                  WHERE D.CODDOCUMENTO = ' + IntToStr(iDocumento) +
                           '                                    AND D.CODDOCUMENTO = L.CODDOCUMENTO ' +
                           '                                    AND D.OPERACAO     = L.OPERACAO)');
                        qryAux.Close;   
                        // AL_34 - Fim
                     end;
                  end;

                  OperComum.LimpaParametros(DMRendaVariavel.qryBuscaFlgContab);
                  // AL_41 - Contabiliza o Dia - Fim

                  // AL_41 - limpa a base para o Dia seguinta
                  // Exclui o registro temporário de reprocessamento de novas Posições já reprocessados
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add('DECLARE ');
                  qryAux.SQL.Add('BEGIN   ');
                  qryAux.SQL.Add('DELETE FROM HISTCARTINV WHERE TIPMOVCARTINV = ''REP'' ');
                  qryAux.SQL.Add('  AND DATAMOVCARTINV < TO_DATE(' + QuotedStr(DateToStr(dDataProc)) + ', ' + QuotedStr('dd/mm/yyyy') + '); ');
                  // AL_44 - Limpa o flag do dia atual para não dobrar a contabilização (<=)
                  // Desmarca os Flags de Contabilização
                  qryAux.SQL.Add('UPDATE HISTCARTINV SET HISTCARTINV.FLGCALCSALDO = NULL ');
                  qryAux.SQL.Add('WHERE HISTCARTINV.FLGCALCSALDO = ''6''  ');
                  qryAux.SQL.Add('  AND HISTCARTINV.DATAMOVCARTINV <= TO_DATE(' + QuotedStr(DateToStr(dDataProc)) + ', ' + QuotedStr('dd/mm/yyyy') + '); ');
                  qryAux.SQL.Add(' END; ');                    
                  qryAux.ExecSQL;

                  //Otacilio - 01/07/2011 - N. Sol 160365 -  N. Kintana 1345364
                  //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
                  {if not RendaVariavel.LancaCancelamentoDireitos(dDataProc) then
                     raise Exception.Create('Lançando de Cancelamento de Recebimentos por Venda.');}

                  // AL_41 - Passa a comitar por dia
                  If DtmBaseDados.dbBaseDados.InTransaction Then
                     DtmBaseDados.dbBaseDados.Commit;

                  // Próxima Data
                  dDataProc := DiasUteisInv.PrimeiroDiaUtilPosterior(dDataProc,-1,1,'',True,False,False);
                  //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509

                  //Ricardo Cristiano - 26/01/2012 - N. Sol 172801 -  N. Kintana 1557138 - Inicio
                  If Not DtmBaseDados.dbBaseDados.InTransaction Then
                     DtmBaseDados.dbBaseDados.StartTransaction;

                  // Reprocessar o investimento selecionado
                  if not RendaVariavel.MarcarFlagReproc(iInvProc,iCartProc,iPlanProc,dDataProc, False) then
                     Raise Exception.Create('Marcar os Investimentos para Reprocessamento.');

                  // Passa a comitar a marcação
                  If DtmBaseDados.dbBaseDados.InTransaction Then
                     DtmBaseDados.dbBaseDados.Commit;
                  //Ricardo Cristiano - 26/01/2012 - N. Sol 172801 -  N. Kintana 1557138 - Fim                                       
               end;
               // Fim

               // AL_2 - 04/06/2004 - Fim

               OperComum.LimpaParametros(DMRendaVariavel.qryBuscaFlgReproc);

               // AL_41 - Abre uma transação após comitar o último dia
               If Not DtmBaseDados.dbBaseDados.InTransaction Then
                  DtmBaseDados.dbBaseDados.StartTransaction;

               lblMensagem.Caption  := '';
               prbReproc.Position := 0;
               prbReproc.Max := 100;

               //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509               
               prbReprocDia.Position := 0;
               prbReprocDia.Max := 100;

               // Reprocessa Opções de Índice
               if bReprocessa then
               begin
                  if chkCalculaOpcInd.Checked then
                  begin
                     lblMensagem.Caption  := 'Reprocessando Opções de Índice';
                     Application.ProcessMessages;
                     if not OpcaoIndice.ReprocessaHistOpcInd(dteDataInicio.DateTime,
                                                             dteDataFinal.DateTime,nil,'','') then
                     begin
                        bbtnCancelar.Click;
                        Exit;
                     end;
                     lblMensagem.Caption  := '';
                     Application.ProcessMessages;
                  end;
               end;

               // AL_37
               // Exclui o registro temporário de reprocessamento de novas Posições
               ExecutaQuery(qryAux, 'DELETE FROM HISTCARTINV WHERE TIPMOVCARTINV = ''REP''');
               QryAux.Close;

               // Desmarca os FLGCALCSALDO
               ExecutaQuery(qryAux, 'UPDATE HISTCARTINV SET HISTCARTINV.FLGCALCSALDO = NULL WHERE HISTCARTINV.FLGCALCSALDO IN (''6'',''5'')');
               QryAux.Close;

               prbReproc.Position := 0;
               prbReproc.Max := 100;

               //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
               prbReprocDia.Position := 0;
               prbReprocDia.Max := 100;

               lblMensagem.Caption  := '';
               Application.ProcessMessages;

               // AL_41 - Passa a comitar sempre
               if bReprocessa then
                  bbtnConfirmarClick(Self)
               else
               begin
                  If DtmBaseDados.dbBaseDados.InTransaction Then
                     DtmBaseDados.dbBaseDados.Commit;
               end;
            except
               on E:Exception do
               begin
                 //Al_28 - 28/06/2005
                  //AL_51
                  if bMostraMens then
                     MsgDlg('Não foi possível efetuar o Relançamento das Operações : '+ #13 +
                            'Ocorreu um problema ao ' + E.Message,
                            'Mensagem do Sistema',mtWarning, [mbOk],0)
                  else
                     MsgDlg(E.Message,'Mensagem do Sistema',mtWarning, [mbOk],0);

                  //AL_54 - Prepara o ambiante novamente
                  bbtnCancelar.Click;
                  Exit;
               end;
            end;
         end;

         //Ricardo Cristiano - 25/07/2011 - N. Sol 156970 -  N. Kintana 1360831
         //Renan Cristiano Sol 143018 | Kintana 922141

         // Executa os testes somente se for Fechar o Dia
         // Testa se existe Operação não Fechada no Período para RV.
         if ((chkAtualizaRV.Checked) and (not bReprocessa)) then
         begin
            dDataProc := StrToDate(dteDataInicio.Text); //Renan Cristiano Sol 143018 | Kintana 922141.
              //AL_15 - 19/01/2005
            If  (pRPI.DATAULTIMPCOT = 0) Or
                (pRPI.DATAULTIMPCOT < StrToDateTime(dteDataInicio.Text))  Or
               ((pRPI.DATAULTIMPCOT > StrToDateTime(dteDataInicio.Text))  And
                (pRPI.DATAULTIMPCOT < StrToDateTime(dteDataFinal.Text ))) Then
            Begin
               MsgDlg('Não foram importadas as cotações para esse período.',
                      'Mensagem do Sistema', mtInformation,[MbOk],0);
               If DtmBaseDados.dbBaseDados.InTransaction Then
                  DtmBaseDados.dbBaseDados.RollBack;
               RendaVariavel.GravaEmAbertura('N'); //William M. Santos SOL 119590 Nº KINTANA 569490
               Exit;
            End;

            OperComum.LimpaParametros(QryBuscaDireitos);
            QryBuscaDireitos.ParamByName('DATAINI').asString := dteDataInicio.Text;
            QryBuscaDireitos.ParamByName('DATAFIM').asString := dteDataFinal.Text;
            QryBuscaDireitos.Open;

            If Not QryBuscaDireitos.IsEmpty Then
            begin
               OperComum.LimpaParametros(QryBuscaOperDireitos);
               QryBuscaOperDireitos.ParamByName('DATAINI').asString := dteDataInicio.Text;
               QryBuscaOperDireitos.ParamByName('DATAFIM').asString := dteDataFinal.Text;
               //AL_51
               if Trim(dblkCarteira.Text) <> '' then
                  QryBuscaOperDireitos.ParamByName('IDCARTEIRAINVEST').AsInteger  := iCartProc;
               //AL_56
               //AL_51
               if ((pRPI.FLGPLANPREVCTBPAT = 'S') and (iPlanProc > 0)) then
                  QryBuscaOperDireitos.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanProc;
               QryBuscaOperDireitos.Open;
               //Al_27 - 21/06/2005
               If QryBuscaOperDireitos.IsEmpty Then
               begin
                  If (MsgDlg('Existem Operações de Direito que não foram fechadas nesse período! '+ #13 +
                          'Continua o processo de Fechamento?',
                          'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
                  begin
                     QryBuscaDireitos.Close;
                     QryBuscaOperDireitos.Close;

                     if dteDataFinal.Canfocus then
                        dteDataFinal.SetFocus;

                     If DtmBaseDados.dbBaseDados.InTransaction Then
                        DtmBaseDados.dbBaseDados.RollBack;
                        
                     RendaVariavel.GravaEmAbertura('N'); //William M. Santos  SOL 119590 Nº KINTANA 569490
                     Exit;
                  end;
               end;
               QryBuscaOperDireitos.Close;
            end;
            QryBuscaDireitos.Close;

            //AL_13 - 19/01/2005
            //Verifica se há ordens lançadas no período. Podendo continuar o processo ou não
            OperComum.LimpaParametros(qryBuscaOrdem);
            qryBuscaOrdem.ParamByName('DATAINI').asString := dteDataInicio.Text;
            qryBuscaOrdem.ParamByName('DATAFIM').asString := dteDataFinal.Text;
            //AL_51
            if Trim(dblkCarteira.Text) <> '' then
               qryBuscaOrdem.ParamByName('IDCARTEIRAINVEST').AsInteger := iCartProc;
            //AL_56
            //AL_51
            if ((pRPI.FLGPLANPREVCTBPAT = 'S') and (iPlanProc > 0)) then
               qryBuscaOrdem.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanProc;
            qryBuscaOrdem.Open;

            If Not qryBuscaOrdem.IsEmpty Then
            begin
               If (MsgDlg('Existem Ordens não calculadas para esse Período! '+ #13 +
                          'Continua o processo de Fechamento?',
                          'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
               begin
                  if dteDataFinal.Canfocus then
                     dteDataFinal.SetFocus;
                  qryBuscaOrdem.Close;

                  If DtmBaseDados.dbBaseDados.InTransaction Then
                    DtmBaseDados.dbBaseDados.RollBack;
                  RendaVariavel.GravaEmAbertura('N'); //William M. Santos SOL 119590 Nº KINTANA 569490
                  Exit;
               end;
            end;
            qryBuscaOrdem.Close;

            //Al_13 - 19/01/2005
            //Se as despesas da boleta foram calculadas, essa deverá ser FECHADA
            OperComum.LimpaParametros(qryBuscaOper);
            qryBuscaOper.ParamByName('DATAINI').asString := dteDataInicio.Text;
            qryBuscaOper.ParamByName('DATAFIM').asString := dteDataFinal.Text;
            //AL_51
            if Trim(dblkCarteira.Text) <> '' then
               qryBuscaOper.ParamByName('IDCARTEIRAINVEST').AsInteger := iCartProc;
            //AL_56
            //AL_51
            if ((pRPI.FLGPLANPREVCTBPAT = 'S') and (iPlanProc > 0)) then
               qryBuscaOper.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanProc;
            qryBuscaOper.Open;

            If Not qryBuscaOper.IsEmpty Then
            begin
               // AL_47 - Ini
               sBolAbt := '';
               while not qryBuscaOper.Eof do
               begin
                  sBolAbt := sBolAbt + qryBuscaOper.FieldByName('NUMDOCUMENTO').AsString + ', ';
                  qryBuscaOper.Next;
               end;
               sBolAbt := Copy(sBolAbt, 1, (Length(sBolAbt) - 2));
               MsgDlg('Existe(m) Boleta(s) calculada(s) e não fechada(s) nesse Período.' + #13 +
                      sBolAbt, 'Mensagem do Sistema', MtInformation,[MbOk],0);
               // AL_47 - Fim

               if dteDataFinal.Canfocus then
                  dteDataFinal.SetFocus;
               qryBuscaOper.Close;

               If DtmBaseDados.dbBaseDados.InTransaction Then
                  DtmBaseDados.dbBaseDados.RollBack;
               RendaVariavel.GravaEmAbertura('N'); //William M. Santos SOL 119590 Nº KINTANA 569490
               Exit;
            end;
            qryBuscaOper.Close;

            if not OpcaoIndice.VerificaBoletaAberta(StrToDate(dteDataInicio.Text),
                                                    StrToDate(dteDataFinal.Text)) then
            begin
               //Al_14  - 19/01/2005
               If (MsgDlg('Continua o processo de Fechamento?',
                          'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
               begin
                  dteDataFinal.SetFocus;

                  If DtmBaseDados.dbBaseDados.InTransaction Then
                    DtmBaseDados.dbBaseDados.RollBack;
                  RendaVariavel.GravaEmAbertura('N'); //William M. Santos SOL 119590 Nº KINTANA 569490
                  Exit;
               end;
            end;

            //AL_55 - Faz a verificação de Saldos das Carteias Próprias e suas Carteiras Gerenciais
            if (chkCartGer.Checked) and (CtrlPInv.FlgCartGerenc = 'S') then
            begin
               try
                  CtrlCartGer := TCtrlCarteiraGerenc.Create;
                  CtrlCartGer.InitializeAs(Padroes);

                  if not CtrlCartGer.ListDifCarteiras(dteDataFinal.DateTime) then
                  begin
                     if OperComum.InvMsgBox(CtrlCartGer.MessageInfo, mtConfirmation, 'Mensagem do Sistema',
                                            [mbYes, mbCancel], 'Continua;Interrompe') = mrCancel then
                     begin
                        dteDataFinal.SetFocus;
                        
                        If DtmBaseDados.dbBaseDados.InTransaction Then
                           DtmBaseDados.dbBaseDados.RollBack;
                        RendaVariavel.GravaEmAbertura('N'); //William M. Santos SOL 119590 Nº KINTANA 569490
                        Exit;
                     end;
                  end;
               finally
                  FreeAndNil(CtrlCartGer);
               end;
            end;

            // Kintana 1565594 SOL173552 Otacilio Aquino ** Inicio **
            QryAux.Close;
            QryAux.SQL.Clear;
            QryAux.SQL.Text := 'SELECT * FROM HISTCARTINV H WHERE H.DATAMOVCARTINV = ''19/01/2012'' '+
                               'AND IDINVESTIMENTO = 9797 AND IDPLANPREVCTBPATR = 1  ' +
                               'AND (TIPMOVCARTINV = ''OPE'' OR TIPMOVCARTINV = ''TRC'' )';
            QryAux.Open;

            if not QryAux.IsEmpty then
            begin
              sIDTIPOOPERACAO    := QryAux.FieldByName('IDTIPOOPERACAO').AsString;
              sIDINVESTIMENTO    := QryAux.FieldByName('IDINVESTIMENTO').AsString;
              sIDPLANPREVCTBPATR := QryAux.FieldByName('IDPLANPREVCTBPATR').AsString;
              sIDCARTEIRAINVEST  := QryAux.FieldByName('IDCARTEIRAINVEST').AsString;
              sIDCORRETVALORES   := QryAux.FieldByName('IDCORRETVALORES').AsString;
              dDATAMOVCARTINV    := QryAux.FieldByName('DATAMOVCARTINV').AsDateTime;
              QryAux.Close;
              QryAux.SQL.Clear;
              QryAux.SQL.Text := 'DELETE FROM HISTCARTINV ' +
                                 'WHERE IDTIPOOPERACAO =  ' + sIDTIPOOPERACAO +
                                 ' AND IDINVESTIMENTO =    ' + sIDINVESTIMENTO +
                                 ' AND IDPLANPREVCTBPATR = ' + sIDPLANPREVCTBPATR +
                                 ' AND IDCARTEIRAINVEST =  ' + sIDCARTEIRAINVEST +
                                 ' AND IDCORRETVALORES =   ' + sIDCORRETVALORES +
                                 ' AND DATAMOVCARTINV = TO_DATE(' + QuotedStr(DateTimeToStr(dDATAMOVCARTINV)) + ')';
              QryAux.ExecSQL;
            end;

            // Kintana 1565594 SOL173552 Otacilio Aquino ** Fim **




            // Kintana 1533918 SOL 170047.7461 Otacilio Aquino ** Inicio **
            //IDENTIFICAR BOLETAS FECHADAS E SEM REGISTROS NA HISTCARTINV
            QryAux.Close;
            QryAux.SQL.Clear;
            QryAux.SQL.Text := 'SELECT O.IDINVESTIMENTO, O.IDCARTEIRAINVEST, O.IDPLANPREVCTBPATR FROM OPERACAOINVEST O ' +
                               'WHERE  O.DATAOPERACAO = TO_DATE('+ QuotedStr(dteDataInicio.text) + ' , ''DD/MM/YYYY'') ' +
                               'AND O.FLGSTATUSFECHBOL = ''F'' AND NOT EXISTS (SELECT 1 FROM HISTCARTINV H             ' +
                               'WHERE O.IDOPERACAOINVEST = H.IDOPERACAOINVEST ' +
                               'AND H.DATAMOVCARTINV = TO_DATE('+ QuotedStr(dteDataInicio.text) + ' , ''DD/MM/YYYY'')) ' +
                               'UNION ' +
                               'SELECT O.IDINVESTIMENTO, O.IDCARTEIRAORIG  IDCARTEIRAINVEST, O.IDPLANPREVCTBPATR FROM OPERCUSTODIA O ' +
                               'WHERE O.DATAMOVCUSTOD = TO_DATE('+ QuotedStr(dteDataInicio.text) + ' , ''DD/MM/YYYY'') ' +
                               'AND NOT EXISTS (SELECT 1 FROM HISTCARTINV H ' +
                               'WHERE H.IDHISTCARTINV IN (O.IDHISTCARTINVORIG, O.IDHISTCARTINVDEST) ' +
                               'AND H.DATAMOVCARTINV =  TO_DATE('+ QuotedStr(dteDataInicio.text) + ' , ''DD/MM/YYYY''))';
            QryAux.Open;
            QryAux.First;
            while not QryAux.eof do
            begin
              OperComum.LimpaParametros(DMRendaVariavel.qryBuscaBoletas);
              DMRendaVariavel.qryBuscaBoletas.ParamByName('dDataRef').AsString           := dteDataInicio.Text;
              DMRendaVariavel.qryBuscaBoletas.ParamByName('IDINVESTIMENTO').AsInteger    := qryAux.FieldByName('IDINVESTIMENTO').AsInteger;
              DMRendaVariavel.qryBuscaBoletas.ParamByName('IDCARTEIRAINVEST').AsInteger  := qryAux.FieldByName('IDCARTEIRAINVEST').AsInteger;
              DMRendaVariavel.qryBuscaBoletas.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryAux.FieldByName('IDPLANPREVCTBPATR').AsInteger;
              DMRendaVariavel.qryBuscaBoletas.Open;
              while not DMRendaVariavel.qryBuscaBoletas.EOF do
              begin
                sBoleta := DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString;
                while not (DMRendaVariavel.qryBuscaBoletas.EOF) and (sBoleta = DMRendaVariavel.qryBuscaBoletasIDBOLETA.AsString) do
                begin
                   try
                      sMensErro := '';
                      If Not DtmBaseDados.dbBaseDados.InTransaction Then
                         DtmBaseDados.dbBaseDados.StartTransaction;
                      if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'OPE') or
                         (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'AJC')  then
                      begin
                          if not RendaVariavel.LancaBoletaOPE(dteDataInicio.Date,
                                                              qryAux.FieldByName('IDINVESTIMENTO').AsInteger,
                                                              qryAux.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                              qryAux.FieldByName('IDPLANPREVCTBPATR').AsInteger) then
                             Raise Exception.Create('Problemas ao gravar Historico da operação de compra/venda.');
                          // Atualiza o Valor Total a Liquidar da Boleta
                          RendaVariavel.AtualizaTotLiqBoleta(sBoleta, dteDataInicio.Date, sMensErro);
                      end
                      else if (DMRendaVariavel.qryBuscaBoletas.FieldByName('TIPMOVBOLETA').AsString = 'TRC') then
                      begin
                         if not RendaVariavel.LancaBoletaTRC(dteDataInicio.Date,
                                                             qryAux.FieldByName('IDINVESTIMENTO').AsInteger,
                                                             qryAux.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                             qryAux.FieldByName('IDPLANPREVCTBPATR').AsInteger) then
                            Raise Exception.Create('Problemas ao gravar Historico da operação de Transferência.');
                      end;
                      DtmBaseDados.dbBaseDados.Commit;
                   except
                     on E:Exception do
                     begin
                       MsgDlg('Não foi possível regerar as operações de compra/venda e transferência entre carteiras.'+ #13 +
                               E.Message+' - '+sMensErro,'Mensagem do Sistema',mtWarning, [mbOk],0);
                       DtmBaseDados.dbBaseDados.RollBack;
                       Exit;
                     end;
                   end;

                   DMRendaVariavel.qryBuscaBoletas.Next;
                end;
              end;
              QryAux.Next;
            end;
            // Kintana 1533918 SOL 170047.7461 Otacilio Aquino ** Fim **

            try
              // Limpa a Base das Atualizações do dia a ser fechado

              // Abre Transação para Limpeza da base
              If Not DtmBaseDados.dbBaseDados.InTransaction Then
                 DtmBaseDados.dbBaseDados.StartTransaction;

              //AL_51
              if not ExcluiRegAtualizacao(iInvProc,iCartProc, iPlanProc) then
                 Raise Exception.Create('Excluir Atualizações Posteriores');

              // Atualiza os Saldos das Carteiras
              if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                 Raise Exception.Create('Atualizar os Saldos das Carteiras');

              // Atualiza Registro do Parametro
              OperacaoInvest.RetParamInvest1(pRPI, 'BaseDados');

              // Comita as Exclusões (Limpeza da Base)
              DtmBaseDados.dbBaseDados.Commit;
            except
               on E:Exception do
               begin
                 //Al_28 - 28/06/2005
                  MsgDlg('Não foi possível preparar a Base para o Reprocessamento : '+ #13 +
                         E.Message,'Mensagem do Sistema',mtWarning, [mbOk],0);
                  DtmBaseDados.dbBaseDados.RollBack;
                  RendaVariavel.GravaEmAbertura('N'); //William M. Santos SOL 119590 Nº KINTANA 569490
                  Exit;
               end;
            end;
         end;

         if not bReprocessa then
         begin
            // Abre uma única transação para o fechamento
            //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
            {if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;}

            // AL_38
            // Assinala a rotina AtualizaProg ao evento AtualizaProcFech da unit RendaVariavel
            uRendaVariavel.AtualizaProcFech := AtualizaProg;

            // Faz da Ultima data de Fechamento até a Data Final
            while dDataProc <= StrToDate(dteDataFinal.Text) do
            begin

               //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
               // Abre uma única transação para o fechamento
               if not dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               // AL_38 - Atualiza a variavel para a nova rotina de progresso
               sDataProcesso := DateToStr(dDataProc);

               //Otacilio - 01/07/2011 - N. Sol 160365 -  N. Kintana 1345364
               //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
               {lblMensagem.Caption  := 'Lançando de Cancelamento de Recebimentos por Venda.';
               if not RendaVariavel.LancaCancelamentoDireitos(dDataProc) then
               begin
                  bbtnCancelar.Click;
                  Exit;
               end;}

               // Al_36 - Passa a chamar a rotina somente na data de processamento
               // AL_10
               lblMensagem.Caption  := 'Lançando Vencimento de Subscrições';
               RendaVariavel.AtualizaSubscricaoVencida(dDataProc);

               lblMensagem.Caption  := 'Processando Dia : ' + DateToStr(dDataProc);
               Application.ProcessMessages;

               // Atualiza os Investimentos Renda Variavel
               if chkAtualizaRV.Checked then
               begin
                  // AL_39
                  If Not CalcCotacaoInvest(dDataProc, -1) Then
                  Begin
                     bbtnCancelar.Click;
                     Exit;
                  End;
                  grbRendaVariavel.Repaint;

                  //AL_31
                  if not RendaVariavel.AtualizaSaldoInvestRV(-1, -1, -1, dDataProc) then
                  begin
                     bbtnCancelar.Click;
                     Exit;
                  end;

                  If Not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) Then
                  begin
                     bbtnCancelar.Click;
                     Exit;
                  end;

                  // Verificar se no reprocessamento pode chamar estas rotinas
                  //   encaixar as opções na rotina de InsereRegistros do Reprocessamento
                  // Baixa Automatica de Opções no Vencimento
                  //AL_51
                  if not Opcoes.GeraReversaoOpcoes(dDataProc,iInvProc,iCartProc,-1,-1,0,False,'') then
                  begin
                     bbtnCancelar.Click;
                     Exit;
                  end;
               end;

               //Renan Cristiano Sol 143018 | Kintana 922141 inicio.
               if not(bReprocessa) and (chkCustodia.Checked) then begin
                 With DtmRelatorio Do begin
                   OperComum.LimpaParametros(QryConciliacaoCustodiaFechto);
                   QryConciliacaoCustodiaFechto.ParamByName('DATAMOV').AsString := DateToStr(dDataProc);
                   QryConciliacaoCustodiaFechto.ParamByName('IDCUSTODIANTE').AsInteger := 10; //Bradesco
                   QryConciliacaoCustodiaFechto.Open;
                   If Not QryConciliacaoCustodiaFechto.IsEmpty Then begin
                     while not QryConciliacaoCustodiaFechto.Eof do begin
                       ConciliaSaldoCustodiaXCarteira(QryConciliacaoCustodiaFechto.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                      QryConciliacaoCustodiaFechto.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                      0, //Carteira Gerencial
                                                      QryConciliacaoCustodiaFechto.FieldByName('IDINVESTIMENTO').AsInteger,
                                                      10, //Custodiante (BRADESCO)
                                                      '', //Lote
                                                      dDataProc);

                       QryConciliacaoCustodiaFechto.Next;
                     end;
                   end;
                   QryConciliacaoCustodiaFechto.Close;
                 end;
               end;
               //Renan Cristiano Sol 143018 | Kintana 922141 Fim.

               // Atualiza Opções de Indice
               if chkCalculaOpcInd.Checked then
               begin
                  if not OpcaoIndice.AtualizaSaldosOpcInd(dDataProc) then
                  begin
                     bbtnCancelar.Click;
                     Exit;
                  end;
               end;

               //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
               // Caso o Banco esteja em Transacao Commita
               If DtmBaseDados.dbBaseDados.InTransaction Then
                  DtmBaseDados.dbBaseDados.Commit;

               // Incrementa data de Processamento
               dDataProc := DiasUteisInv.PrimeiroDiaUtilPosterior(dDataProc,-1,1,'',True,False,False);

            end;

         end;

         //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468

         // Achar o dia útil anterior
         if bReprocessa then
            DataProxFech := pRPI.DATAULTFECH
         else
         begin
            DataProxFech := dDataProc - 1;
            While not DiasUteisInv.DiaUtil(DataProxFech,-1,1,'',True,False,False) Do
               DataProxFech  := DataProxFech - 1;
         end;

         //Implementação RICARDO CRISTIANO - 09/12/2011
         // Kintana 1544308 SOL 170047.7581 ** INICIO **
         if not bReprocessa then
         begin
            if DataProxFech < pRPI.DATAULTFECH then
            begin
               DataProxFech := pRPI.DATAULTFECH + 1;
               While not DiasUteisInv.DiaUtil(DataProxFech,-1,1,'',True,False,False) Do
                  DataProxFech  := DataProxFech + 1;
            end;
         end;
         // Kintana 1544308 SOL 170047/7581 ** FIM **

         //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468
         try
            if not dtmBaseDados.dbBaseDados.InTransaction then
               DtmBaseDados.dbBaseDados.StartTransaction;

            // Guarda a Data do Ultimo Fechamento
            If (DataProxFech <> 0) Then
            begin
               If ((Trim(dblkCarteira.Text) <> '') And (qryCarteira.FieldByName('FLGCARTTERC').AsString <> 'S')) or
                   (Trim(dblkCarteira.Text) = '') Then
                  ExecutaQuery(QryAux,'UPDATE PARAMINVEST SET PARAMINVEST.DATAULTFECH = TO_DATE('''+
                               DateToStr(DataProxFech)+''',''DD/MM/YYYY'')');
            end;

            // Caso o Banco esteja em Transacao Commita
            If DtmBaseDados.dbBaseDados.InTransaction Then
               DtmBaseDados.dbBaseDados.Commit;

            // Preenche Datas com o ultimo fechamento + 1
            If FazQuery(QryAux,'SELECT PARAMINVEST.DATAULTFECH FROM PARAMINVEST') Then
            Begin
               // Caso Nao exista ultimo fechamento Cria com a primeira operacao feita
               If QryAux.FieldByName('DATAULTFECH').AsDateTime = 0 Then
                  dteDataInicio.Date    := Date
               else
                  dteDataInicio.Date    := QryAux.FieldByName('DATAULTFECH').AsDateTime+1;
               While not DiasUteisInv.DiaUtil(dteDataInicio.Date,-1,1,'',True,False,False) Do
                  dteDataInicio.Date := dteDataInicio.Date + 1;   // Achar o próximo dia útil

               dteDataFinal.Date     := dteDataInicio.Date;
            End;
            QryAux.Close;

            //Implementação RICARDO CRISTIANO - 09/12/2011
            bReprocessa := False;

            // Atualiza Progressbars
            prbReproc.Position    := 0;
            lblMensagem.Caption   := 'Processamento Ok.';
         except
            If DtmBaseDados.dbBaseDados.InTransaction Then
               DtmBaseDados.dbBaseDados.Rollback;
            RendaVariavel.GravaEmAbertura('N');
         end;
         //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468

      except   //William M. Santos SOL 119590 Nº KINTANA 569490
        on E:Exception do
        begin
          if DtmBaseDados.dbBaseDados.InTransaction then
             DtmBaseDados.dbBaseDados.Rollback;
          MsgDlg('Não foi possível efetuar o Processamento.'+ #13 +
                  E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
          RendaVariavel.GravaEmAbertura('N');  //Libera o usuário.
        end;
      end;

   finally
      // AL_38
      OperComum.LimpaParametros(DMRendaVariavel.qryBuscaFlgReproc);
      uRendaVariavel.AtualizaProcFech := nil;
      // AL_41
      RendaVariavel.GravaEmAbertura('N');
      Application.ProcessMessages;
      bbtnSair.Enabled := True;

      //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468
      // Monta Registro do Parâmetro
      Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');

      BtProcessar.Enabled      := True;

      dteDataInicio.Enabled    := True;
      dteDataFinal.Enabled     := True;

      dblkCarteira.Clear;
      dblkInvestimento.Clear;

      dblkCarteira.Enabled     := False;
      dblkInvestimento.Enabled := False;

      chkCustodia.Checked       := True;
      //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
      //chkCalculaOpcInd.Checked  := True;

      chkAtualizaRV.Checked     := True;
      //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468
   end;
end;

procedure TFrmFechtoRenVar.dteDataInicioExit(Sender: TObject);
begin
   inherited;
   //Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468
   lblMensagem.Caption   := '';

   // AL_39 - Primeiro dia do processamento tem que ser dia útil
   if not DiasUteisInv.DiaUtil(dteDataInicio.Date, -1, 1, '', True, False, False) then
      dteDataInicio.Date := DiasUteisInv.PrimeiroDiaUtilPosterior(dteDataInicio.Date,-1,1,'',True,False,False);

   if dteDataInicio.Date <= pRPI.DATAULTFECH then
   begin
      bReprocessa               := True;
      dteDataFinal.Enabled      := False;
      dteDataFinal.Date         := pRPI.DATAULTFECH;
      OperComum.LimpaParametros(qryCarteira);
      qryCarteira.Open;
      //AL_51
      dblPlanoPatro.Enabled     := True;
      if dblPlanoPatro.CanFocus then
         dblPlanoPatro.SetFocus;
      //Al_8
      if pRPI.FLGCOMPVARRV = 'S' then
         dblkInvestimento.Enabled := False
      else
         dblkInvestimento.Enabled  := True;
      dblkCarteira.Enabled      := True;
      chkCalculaOpcInd.Caption  := 'Recalcular Opções de Índice';
     //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     //chkAtualizaRV.Checked     := False;

      chkCalculaOpcInd.Checked  := False;
   end
   else
   begin
      bReprocessa               := False;
      dteDataFinal.Enabled      := True;
      dteDataInicio.Date        := DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECH,-1,1,'',True,False,False);
      dteDataFinal.Date         := DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECH,-1,1,'',True,False,False);
      //AL_51
      dblPlanoPatro.Enabled     := False;
      OperComum.LimpaParametros(qryCarteira);
      qryCarteira.Open;
      OperComum.LimpaParametros(qryInvestimento);
      qryInvestimento.Open;
      dblkInvestimento.Enabled  := False;
      dblkCarteira.Enabled      := False;
      chkCalculaOpcInd.Caption  := 'Calcular Opções de Índice';
      //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
      //chkCalculaOpcInd.Checked  := True;
      chkAtualizaRV.Checked     := True;
   end;
end;

procedure TFrmFechtoRenVar.dteDataFinalExit(Sender: TObject);
begin
  inherited;
  if dteDataFinal.Date > DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECH,-1,1,'',True,False,False) then
     dteDataFinal.Date := DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECH,-1,1,'',True,False,False);
end;

function TFrmFechtoRenVar.PodeReprocessar(iPlanPrev, iCarteira, iInvestimento: Integer;
                                          DataRef: TDateTime): Boolean;
begin
   with DMRendaVariavel, OperComum do
   begin
      try
         try
            Result := False;
            // Verifica se mudou a cotação no período
            LimpaParametros(qryVerCotacaoPeriodo);
            qryVerCotacaoPeriodo.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
            qryVerCotacaoPeriodo.ParamByName('DATACOTACAO').AsString := DateToStr(DataRef);
            qryVerCotacaoPeriodo.Open;
            while not qryVerCotacaoPeriodo.Eof do
            begin
               if qryVerCotacaoPeriodoPRIMCOT.AsFloat <> qryVerCotacaoPeriodoCOTACAO.AsFloat then
               begin
                  Result := True;
                  Break;
               end;
               qryVerCotacaoPeriodo.Next;
            end;
            LimpaParametros(qryVerCotacaoPeriodo);

            LimpaParametros(qryVerOperPeriodo);
            qryVerOperPeriodo.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
            qryVerOperPeriodo.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteira;
            qryVerOperPeriodo.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
            qryVerOperPeriodo.ParamByName('DATAREF').AsString := DateToStr(DataRef);
            qryVerOperPeriodo.Open;
            if not qryVerOperPeriodo.IsEmpty then
               Result := True;
            LimpaParametros(qryVerOperPeriodo);
         except
            // Se houver algum problema, reprocessa por garantia
            Result := True;
         end;
      finally
         LimpaParametros(qryVerOperPeriodo);
         LimpaParametros(qryVerCotacaoPeriodo);
      end;
   end;
end;

procedure AtualizaProg(sMsg: String = ''; iMax: Integer = -1);
begin
   with FrmFechtoRenVar do
   begin
      if sMsg <> '' then
         lblMensagem.Caption := sMsg;
      if iMax > 0 then
      begin
         prbReproc.Max := iMax;
         prbReproc.Min := 0;
         prbReproc.Position := 0;
      end
      else
      if iMax = -2 then
      begin
         lblMensagem.Caption := '';
         prbReproc.Max := 100;
         prbReproc.Min := 0;
         prbReproc.Position := 0;
      end
      else
      if iMax = -1 then
         prbReproc.StepIt
      else
      begin
         prbReproc.Max := 100;
         prbReproc.Min := 0;
         prbReproc.Position := 0;
      end;
      Application.ProcessMessages;
   end;
end;

procedure TFrmFechtoRenVar.FormCreate(Sender: TObject);
begin
  inherited;
  //Renan 17/08/2010 - Sol. 127135 - Kintana 694808 Inicio.
  TCustodia.Create;
  Rv := TCustodia.Create;
  //Renan 17/08/2010 - Sol. 127135 - Kintana 694808 FIm;
end;

procedure TFrmFechtoRenVar.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then     //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TFrmFechtoRenVar.FormCloseQuery(Sender: TObject;  var CanClose: Boolean);
var i: Word;
begin
   //AL_51 - Fecha todas as queries
   for i := 0 to TForm(Sender).ComponentCount -1 do
   begin
      if TForm(Sender).Components[i] is TwwQuery then
      begin
         if TwwQuery(TForm(Sender).Components[i]).State <> dsInactive then
            TwwQuery(TForm(Sender).Components[i]).Close;
      end;
      if TForm(Sender).Components[i] is TQuery then
      begin
         if TQuery(TForm(Sender).Components[i]).State <> dsInactive then
            TQuery(TForm(Sender).Components[i]).Close;
      end;
   end;
   inherited;
end;

//Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468
procedure TFrmFechtoRenVar.dblPlanoPatroExit(Sender: TObject);
begin
  inherited;
   lblMensagem.Caption   := '';
end;

//Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468
procedure TFrmFechtoRenVar.dblkCarteiraExit(Sender: TObject);
begin
  inherited;
   lblMensagem.Caption   := '';
end;

//Ricardo Cristiano - 08/09/2008 - N. Sol 93417 -  N. Kintana 406468
procedure TFrmFechtoRenVar.dblkInvestimentoExit(Sender: TObject);
begin
  inherited;
   lblMensagem.Caption   := '';
end;

procedure TFrmFechtoRenVar.ConciliaSaldoCustodiaXCarteira(iPlanoPatro,
  iCarteira, iCarteiraGerenc, iInvestimento, iCustodiante: Integer;
  sLote: String; dData: TDateTime);
var
   //Ricardo Cristiano - 06/07/2011 SOL 160922 - KINTANA 1354090
  fSaldoQtdCart, fSaldoQtd, SLiberado, SBloqueado : Double;
  CtrlRV : TCtrlRendaVariavel;
begin

   CtrlRV := TCtrlRendaVariavel.Create;
   CtrlRV.InitializeAs(Padroes);

   Rv.ConciliaCustodia(iPlanoPatro, iCarteira, iCarteiraGerenc,
   //Ricardo Cristiano - 06/07/2011 SOL 160922 - KINTANA 1354090 - agora totaliza a custodia para comparar com o saldo da carteira
//                       iInvestimento, iCustodiante, sLote, dData);
                       iInvestimento, -1, sLote, dData);

   fSaldoQtd  := Rv.FSaldoQtdCustodia;
   SLiberado  := Rv.FSldLibCustodia;
   SBloqueado := Rv.FSaldoBloqueado;

   //Ricardo Cristiano - 06/07/2011 SOL 160922 - KINTANA 1354090 - agora totaliza a custodia para comparar com o saldo da carteira
   CtrlRV.BuscaSaldoRV.Executa(dData, iPlanoPatro, iInvestimento, iCarteira, 0, High(Integer));
   fSaldoQtdCart := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;

   //Ricardo Cristiano - 14/07/2011 SOL 161488 - KINTANA 1361915 - implementação para verificar as quantidades bloqueadas e liberadas   
   //Ricardo Cristiano - 06/07/2011 SOL 160922 - KINTANA 1354090 - agora totaliza a custodia para comparar com o saldo da carteira
   if ((fSaldoQtdCart <> fSaldoQtd) or (fSaldoQtdCart <> (SBloqueado + SLiberado))) then
   begin
       if (fSaldoQtd >= 0) and ((SBloqueado + SLiberado) >= 0) then begin
          if fSaldoQtdCart <> (SBloqueado + SLiberado) then begin
             Rv.GravaLogCartXCust(iPlanoPatro, iCarteira, iCarteiraGerenc,
                                  iInvestimento, iCustodiante, sLote, dData,
                                  fSaldoQtdCart, SLiberado, SBloqueado);

             //Ricardo Cristiano - 14/07/2011 SOL 161488 - KINTANA 1361915 - Implementação para diferenciar a carteira de empréstimo                                  
             FazQuery(QryAux,'SELECT C.IDMERCADO FROM CARTEIRAINVEST C WHERE C.IDCARTEIRAINVEST = '+IntToStr(iCarteira));
             if (QryAux.FieldByName('IDMERCADO').AsInteger = 5) then
                Rv.ArrumaCustodia(iPlanoPatro, iCarteira, iCarteiraGerenc,
                                  iInvestimento, iCustodiante, sLote, dData,
                                  SLiberado,
                                  fSaldoQtdCart - SBloqueado)
             else
                Rv.ArrumaCustodia(iPlanoPatro, iCarteira, iCarteiraGerenc,
                                  iInvestimento, iCustodiante, sLote, dData,
                                  fSaldoQtdCart - SLiberado,
                                  SBloqueado);
          end;
       end;
   end;
   FreeAndNil(CtrlRV);
end;

end.
