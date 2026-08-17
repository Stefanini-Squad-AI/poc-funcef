//******************************************************************************
// Rotina     : IntegraCapCarRendaFixa
// SOL        : 123324
// Kintana    : 615338
// Data       : 19/08/2009
// Responsável: Thiago Passos
// Descrição  : Correção da inserção de dados no Contábil.
//********************************************************************************************************
// Data	     : 02/06/2008
// Codigo    : AL_42
// Pendência : 28020
// SOL       :
// Função    : Ajuste na seleção do Item na montagem do histórico contabil da
//               aplicação.
//********************************************************************************************************
// Data	     : 28/05/2008
// Codigo    : AL_41
// Pendência : 24716
// SOL       : 55534
// Função    : Out of Memory
//********************************************************************************************************
// Data	     : 10/10/2007
// Codigo    : AL_40
// Pendência : 26496
// Função    : Ajuste na contabilização em 3 camadas (Lançamento Financeiro)
//             Ajuste nos processos de lançamento de operação (Mensagens de erro)
//             Utilização do Objeto CtrlPInv nas rotinas contabeis
//********************************************************************************************************
//Data	     : 29/08/2007
//Codigo     : AL_39
//Pendência  : 26223
//SOL        : 67708
//Desc       : Tratamento DiminuiValor pois estava ocorrendo erro na comparação da expressao
//********************************************************************************************************
//Data	     : 14/08/2007
//Codigo     : AL_38
//Pendência  : 26012
//Desc       : Alteração para permitir IDTIPOINVEST NULL na qryCarteira
//********************************************************************************************************
//Data	     : 20/06/2007
//Codigo     : AL_37
//Pendência  : 25651
//Desc       : Erro no resgate : O investimento não possui saldo liberado para resgate em função de
//             Bloqueio para Penhora. para um Investimento com saldo.
//             Isto pq existia qdade menor que 1 e o retorno era asinteger ao inves de asfloat
//********************************************************************************************************
//Data	     : 04/06/2007
//Codigo     : AL_36
//Pendência  : 25309
//SOL        : 58642
//Desc       : Implementação de Flag para atualizar o Título no dia da Emissão.
//             Será desenvolvida a atualização no dia da compra - Verificar depois se compra decorrida tb.
//******************************************************************************
// Data      : 24/05/2007
// Código    : AL_35
// Desc      : Todos os recebimentos estavam indicando penhora com juridico, pq
//             o locate posicionava sempre no ultimo registro utilizando dados.
//             Coloquei um (If/then) no locate para somente se encontrar
//******************************************************************************
// Data      : 24/05/2007
// Código    : AL_34
// Pendencia : 25455
// Desc      : Ajuste no cálculo de Ágio de Deságio na data de emissão
//             Ajuste no número de casas decimais da taxa de juros
//             Ajuste no número de casas decimais do PU de Mercado (DFM)
//******************************************************************************
// Data      : 16/05/2007
// Código    : AL_33
// Pendencia : 25336
// SOL       : 60074
// Desc      : Acerto na Busca de Saldos de Operações de Renda Fixa para trazer
//              os diversos Planos / Patrocinadoras
//             Gravação do IDOPERRENFIXORIG nos Resgates
//******************************************************************************
// Data      : 11/05/2007
// Código    : AL_32
// Pendencia : 25336
// SOL       : 60074
// Desc      : Acerto na Busca de Saldos de Operações de Renda Fixa para trazer
//              os diversos Planos / Patrocinadoras
//******************************************************************************
// Data      : 16/03/2007
// Código    : AL_31
// Pendencia : 24773
// SOL       : 55877
// Desc      : Troca do FLGCONTABILIZA para o Especifico de Renda Fixa FLGINTCONTABRF
//******************************************************************************
// Data      : 23/03/2007
// Código    : AL_30
// Pendencia : 24774
// SOL       : 55877
// Desc      : Retirada do teste do flag FLGCONTABILIZA. Agora o flag
//               FLGINTCONTABRF é testado dentro do método TestaPeriodo
//******************************************************************************
// Data      : 16/02/2007
// Código    : AL_29
// Pendencia : 22779
// SOL       : 43633
// Desc      : Implementação de mais de um TRC entre Planos
//******************************************************************************
// Data      : 03/01/2007
// Código    : AL_28
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementacao de Penhora do Juridico na qryTipoOperacao
//******************************************************************************
// Data      : 12/01/2007
// Código    : AL_27
// Pendencia : 23674
// SOL       : 47946
// Desc      : Segregação de Recursos
//             Reformulação das mensagens de erro
//******************************************************************************
// Data      : 10/10/2006
// Código    : AL_26
// Pendencia : 23508
// SOL       : 43747
// Desc      : Acerto na data de Liquidação quando da troca da data da operação.
//******************************************************************************
// Data      : 14/09/2006
// Código    : AL_25
// Pendencia :
// SOL       :
// Desc      : Ajuste na BuscaTotResgPoup para buscar os totais de TRC
//******************************************************************************
// Data      : 17/08/2006
// Código    : AL_24
// Pendencia : 23008
// SOL       :
// Desc      : Tratamento na data da Operação Original para trata o FlgContaInvest
//             para aplicações que sofreram TRC de Plano
//******************************************************************************
// Data      : 03/07/2006
// Código    : AL_23
// Pendencia : 22658
// SOL       : 44185
// Desc      : Função para verificar a falta do Histórico quando do lançamento
//             de operações de Baixa.
//******************************************************************************
// Data      : 28/06/2006
// Código    : AL_22
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//********************************************************************************************************
//Data	     : 26/05/2006
//Codigo     : AL_21
//Pendência  : 22480
//SOL        : 43633
//Função     : Implementação da Funcionalidade de Transferência entre Planos
//********************************************************************************************************
//Data	     : 22/03/2006
//Codigo     : AL_20
//Pendência  : 21650
//SOL        : 40682
//Função     : Acerto na montagem da data de Liquidação na Aplicação
//********************************************************************************************************
//Data	     : 22/03/2006
//Codigo     : AL_19
//Pendência  :
//SOL        :
//Função     : Acerto no resgate total para não permitir quantidade maior que o saldo
//********************************************************************************************************
//Data	     : 15/03/2006
//Codigo     : AL_18
//Pendência  : 21650
//SOL        : 40682
//Função     : Implementação do Campo Data de Liquidação
//********************************************************************************************************
//Data	 :  25/01/2006
//Codigo :  AL_17
//Função :  Acerto na verificação do preenchimento da dbdDtaLeilao para verificar somente na aplicação
//********************************************************************************************************
//Data	 :  25/01/2006
//Codigo :  AL_16
//Função :  Desabilitar componentes no Resgate
//********************************************************************************************************
//Data	 :  16/01/2006
//Codigo :  AL_15
//Função :  Acerto na passagem de parâmetro CCI para Resgates
//********************************************************************************************************
//Data	 :  05/01/2006
//Codigo :  AL_14
//Função :  Busca Data de Emissão e PU de Emissão no cadastro de investimentos
//          Grava data de liquidação da operação
//********************************************************************************************************
//Data	 :  14/11/2005
//Codigo :  AL_13
//Função :  Passa a buscar o registro (último) na BuscaSaldo (Casos de Resgate no dia de um Pagamento de Juros
//********************************************************************************************************
//Data	 :  18/08/2005
//Codigo :  AL_12
//Função :  Criação da Orelha de Histórico de Repactuações e respectiva query (DFM)
//********************************************************************************************************
//Data	 :  24/05/2005
//Codigo :  AL_11
//Função :  Inclusão do parametro dDataAniv na função LancaHistResgateRenFix
//          Alteracao dos parametros de BuscaSaldos de Poupanca  e acerto na atribuição de focus
//********************************************************************************************************
//Data	    :  20/05/2005
//Codigo    :  AL_10
//Função    :  Novo teste de Periodo contábil em 3 camadas
//********************************************************************************************************
//Data	    :  23/04/2005
//Codigo    :  AL_9
//Função    :  Alterações para Calcular e Gravar o Vlr do Item e o Valor Acumulado do
//             Item na HISTRENFIXXITENS
//********************************************************************************************************
//Data	    :  13/04/2005
//          :  AL_8
//Função    :  Acerto na passagem do iPlanilha qdo a operação não gera Contábil (iPlanilha -2)
//********************************************************************************************************
//Data	    :  17/03/2005
//          :  AL_7
//Função    :  Passa a verificar os campos do treeview somente nas Aplicacoes na funcao VerificaCampos
//********************************************************************************************************
//Data	    :  16/03/2005
//          :  AL_6
//Função    :  Quando houverem mais de um resgate e forem no próprio dia do aniversário,
//             não traz o resgate anterior o saldo é o da própria BuscaSaldoPoup (Não precisa abater
//             os resgates no período)
//********************************************************************************************************
//Data	    :  23/02/2005
//          :  AL_5
//Função    :  Colocado parametro 'OPE' na BuscaTotResgPoup para acertar o somatório de resgates
//             conforme o momento do processamento (Atualização (<) ou Operação (<=)
//********************************************************************************************************
// Data     : 28/12/2004
// Código   : AL_4
// Motivo   : Possibilitar a alteração do campo PUMERCADO, e correção na alteração DATAEMISSAO e PUEMISSAO.
//            Foi adicionado o campo PUMERCADO na query qry e também no componente update.
//            Alterado DFM e PAS.
//********************************************************************************************************
// Data     : 11/11/2004
// Query    : qryAutorizacao
// Motivo   : Filtrando a consulta por FLGATIVO
//********************************************************************************************************
// Data     : 09/11/2004
// Código   : AL_3
// Motivo   : Possibilitar a alteração dos campos DATAEMISSAO e PUEMISSAO.
//********************************************************************************************************
// Data     : 28/09/2004
// Código   : AL_2
// Motivo   : Implementacao do paramentro FlgContaInvest (CPMF) na qryTipoOperacao
//            LancaHistResgateRenFix , qryExisteOperacoes
//********************************************************************************************************
// Data     : 04/08/2004
// Código   : AL_1
// Função   :
// Motivo   : Controle do processo de abertura
//********************************************************************************************************
// Data     : 17/05/2004
// Origem   : CM
// Função   : sbtnBoleta
// Motivo   : Implementaçào do Relatório de Boleta
//********************************************************************************************************
// Data     : 04/05/2004
// Origem   : CM
// Função   : qryInvestimento
// Motivo   : Para não trazer Investimento do Renda Fixa Antigo
//********************************************************************************************************
//Data	 	 :      28/04/2004
//Função	 :   *  Passa a não mais voltar a data nas aplicações anteriores ao
//                      fechamento, agora somente marca a aplicação para ser reprocessada
//                   *  Permite aplicação e resgate retroativos
//                   *  Permite Buscar saldos para resgate retroativo até 30 dias antes do último fechamento
//Motivo         :      Implementação do Reprocessamento
//*******************************************************************************
unit FCadOperRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, DBGrids, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, ComCtrls, FCadastroCS,
  fcLabel, wwriched, uCMTypes,DBCtrls, CMDBLookupCombo,
  faMensagem, Mask, wwdbedit, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, FPreview,
  uCtrlInvContab, Wwdbigrd, Wwdbgrid, uCtrlParamInvest;

type
  TTipoOper = set of (Aplicacao,Resgate,Alteracao);

  TfrmCadOperRenFix = class(TfrmCadastroCSInv)
    pnlFundoCurvas: TPanel;
    pnlCurvasFundo: TPanel;
    pnlCurvasDet: TPanel;
    lblPercentual: TLabel;
    dbrPercentual: TDBRealEdit;
    pnlTituloCurvas: TPanel;
    trvCurvas: TTreeView;
    imgCurvas: TImageList;
    qryEmissor: TwwQuery;
    qryInvestimento: TwwQuery;
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryTipoOperacaoNATUREZAOPERACAO: TStringField;
    qryTipoOperacaoFLGGERACONTAB: TFloatField;
    qryTipoOperacaoFLGGERACAPCAR: TFloatField;
    qryTipoOperacaoRECPAG: TStringField;
    qryTipoOperacaoTIPCREDOR: TStringField;
    qryTipoOperacaoFLGTRATAIR: TStringField;
    qryTipoOperacaoSIGLATIPOOPER: TStringField;
    qryEmissorIDEMISSOR: TFloatField;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoCODISIN: TStringField;
    qryInvestimentoIDCLASSETIT: TFloatField;
    qryCarteira: TwwQuery;
    qryCustodiante: TwwQuery;
    pnlMoeda: TPanel;
    Label1: TLabel;
    dblkMoeda: TwwDBLookupCombo;
    Bevel1: TBevel;
    qryMoeda: TwwQuery;
    qryMoedaMOECODIGO: TFloatField;
    qryMoedaMOEDESC: TStringField;
    qryMoedaMOESIGLA: TStringField;
    qryIDOPERRENFIX: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDCUSTODIANTE: TFloatField;
    qryIDFORCLI: TFloatField;
    qryMOECODIGO: TFloatField;
    qryIDPLANPREVCTBPATR: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryPUOPERACAO: TFloatField;
    qryPUEMISSAO: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryQTDEOPERACAO: TFloatField;
    qryVENCOPERACAO: TDateTimeField;
    qryOBSERVACAO: TStringField;
    pnlMestre: TPanel;
    pgMestre: TPageControl;
    tbCombos: TTabSheet;
    tbObs: TTabSheet;
    pnlValores: TPanel;
    pnlCombos: TPanel;
    lblInvestimento: TLabel;
    lblEmissor: TLabel;
    lblOperacao: TLabel;
    lblCarteira: TLabel;
    lblCustodiante: TLabel;
    lblForCli: TLabel;
    dblkOperacao: TwwDBLookupCombo;
    dblkInvestimento: TwwDBLookupCombo;
    dblkEmissor: TwwDBLookupCombo;
    dblkCustodiante: TwwDBLookupCombo;
    dblkCarteira: TwwDBLookupCombo;
    pnlObsBt: TPanel;
    qryDATAEMISSAO: TDateTimeField;
    qryAux: TwwQuery;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCustodianteIDCUSTODIANTE: TFloatField;
    qryCustodianteSGLCUSTODIANTE: TStringField;
    sbtnBuscaSaldos: TToolbarButton97;
    msBuscaSaldos: TMontaSelect;
    lblSaldos: TLabel;
    lblSldQtdTit: TLabel;
    lblSldVlrTit: TLabel;
    lblSldQtd: TLabel;
    lblSldVlr: TLabel;
    qryTipoOperacaoCODTIPDOC: TFloatField;
    Label9: TLabel;
    dblkAutorizacao: TwwDBLookupCombo;
    qryAutorizacao: TwwQuery;
    qryAutorizacaoIDUSUARIO: TFloatField;
    qryAutorizacaoNOMEUSUARIO: TStringField;
    pnlObs: TPanel;
    dbRtObs: TwwDBRichEdit;
    qryIDUSUARIO: TFloatField;
    lblPercItem: TLabel;
    pnlDataOperacao: TPanel;
    Label2: TLabel;
    dbdDataOperacao: TCMDateTimePicker;
    pnlPUEmissao: TPanel;
    pnlDataEmissao: TPanel;
    pnlPUOperacao: TPanel;
    pnlQuantidade: TPanel;
    pnlValor: TPanel;
    pnlDataVencimento: TPanel;
    Label4: TLabel;
    dbdDtaVencimento: TCMDateTimePicker;
    Label16: TLabel;
    dbrVlrOperacao: TDBRealEdit;
    Label5: TLabel;
    dbrQtdeOperacao: TDBRealEdit;
    Label17: TLabel;
    dbePuOperacao: TDBRealEdit;
    Label8: TLabel;
    dbdDtaEmissao: TCMDateTimePicker;
    Label7: TLabel;
    dbePUEmissao: TDBRealEdit;
    qryIDOPERRENFIXAPLIC: TFloatField;
    qrySaldoTotalPoup: TwwQuery;
    qryBuscaPagtoJuros: TwwQuery;
    qryBuscaPagtoJurosVLROPERACAO: TFloatField;
    qryFLGOPERIMPLANT: TStringField;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    bbtnOkDet: TSpeedButton;
    pnlChkMoeda: TPanel;
    chkMoeda: TCheckBox;
    pnlDetObs: TPanel;
    lblDtLeilao: TLabel;
    dbdDtaLeilao: TCMDateTimePicker;
    qryDATALEILAO: TDateTimeField;
    qryFLGNEGOCIACAO: TStringField;
    chkFlgCartHipo: TDBCheckBox;
    chkFlgNegociacao: TDBCheckBox;
    dbreCorretagem: TDBRealEdit;
    lblCorretagem: TLabel;
    dbreEmolumentos: TDBRealEdit;
    lblEmolumento: TLabel;
    qryTXBOLSA: TFloatField;
    qryTXOPERACIONAL: TFloatField;
    qryBuscaTaxas: TwwQuery;
    qryBuscaTaxasIDITEMRENFIX: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryCarteiraIDGESTORCARTEIRA: TFloatField;
    qryInvestimentoIDEMISSOR: TFloatField;
    Label3: TLabel;
    dblkClasseRisco: TwwDBLookupCombo;
    qryIDCLASSRISCORENFIX: TFloatField;
    qryCasseRisco: TwwQuery;
    qryCasseRiscoIDCLASSRISCORENFIX: TFloatField;
    qryCasseRiscoNOMECLASSRISCO: TStringField;
    qryCasseRiscoCORCLASSRISCO: TFloatField;
    pnlVlrTv: TPanel;
    lblVlrItem: TLabel;
    dbrValor: TDBRealEdit;
    pnlQtdHipo: TPanel;
    Label6: TLabel;
    dbrQtdCartHipo: TDBRealEdit;
    qryFLGCARTHIPO: TStringField;
    qryQTDCARTHIPO: TFloatField;
    qryExcluiCotacoes: TwwQuery;
    fraMensOper: TfraMensagem;
    qryContraParte: TwwQuery;
    qryContraParteIDPESSOA: TFloatField;
    qryContraParteNOME: TStringField;
    dblkForCli: TwwDBLookupCombo;
    qryExisteOperacoes: TwwQuery;
    qryExisteOperacoesIDOPERRENFIX: TFloatField;
    qryExisteOperacoesFLGGERACONTAB: TFloatField;
    qryFLGRECALC: TStringField;
    lblBoleta: TLabel;
    qryBOLETA: TStringField;
    dbeBoleta: TwwDBEdit;
    dbrePuMercado: TDBRealEdit;
    lblPuMercado: TLabel;
    bbtnImprimir: TBitBtn;
    rptBoletaRenFix: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape4: TppShape;
    ppShape3: TppShape;
    ppShape2: TppShape;
    ppShape1: TppShape;
    rptRenFixSaldoTitulo: TppLabel;
    lblNomeEmpresa: TppLabel;
    ppLPeriodo: TppLabel;
    ppDbLogo: TppDBImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel17: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    rptlblPrazo: TppLabel;
    rptdbeBoleta: TppDBText;
    rptdbeDtaOper: TppDBText;
    rptlblDtaLiquidacao: TppLabel;
    rptlblOperacao: TppLabel;
    rptlblInvestimento: TppLabel;
    rptlblCustodiante: TppLabel;
    rptlblContraParte: TppLabel;
    rptlblEmissor: TppLabel;
    ppDBText5: TppDBText;
    ppLine1: TppLine;
    ppbBandaDetalhe: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    pplBoletaRenFix: TppBDEPipeline;
    qryTipoOperacaoFLGCONTAINVEST: TFloatField;
    qryExisteOperacoesFLGCONTAINVEST: TFloatField;
    qryPUMERCADO: TFloatField;
    tbsHistorico: TTabSheet;
    dbgHistorico: TwwDBGrid;
    qryHistorico: TwwQuery;
    qryHistoricoDATAVIGENCIA: TDateTimeField;
    qryHistoricoDATAVENCTOANT: TDateTimeField;
    qryHistoricoDATAVENCTOATU: TDateTimeField;
    dsHistorico: TwwDataSource;
    qryInvestimentoFLGREPACTUA: TStringField;
    qryInvestimentoDATAEMISSAO: TDateTimeField;
    qryInvestimentoPUEMISSAO: TFloatField;
    qryDATALIQUIDACAO: TDateTimeField;
    qryTipoOperacaoVENCIMENTO: TFloatField;
    lblDtLiquidacao: TLabel;
    dtLiquidacao: TCMDateTimePicker;
    qryIDOPERRENFIXORIG: TFloatField;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure dblkEmissorCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
    procedure dblkInvestimentoCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure trvCurvasChange(Sender: TObject; Node: TTreeNode);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnBuscaSaldosClick(Sender: TObject);
    procedure dbrVlrOperacaoExit(Sender: TObject);
    procedure dbrQtdeOperacaoExit(Sender: TObject);
    procedure dbePuOperacaoExit(Sender: TObject);
    procedure dbdDtaEmissaoExit(Sender: TObject);
    procedure dblkEmissorExit(Sender: TObject);
    procedure chkMoedaClick(Sender: TObject);
    procedure BtIncDetClick(Sender: TObject);
    procedure dbrPercentualKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chkFlgCartHipoClick(Sender: TObject);
    procedure dblkClasseRiscoExit(Sender: TObject);
    procedure dbdDataOperacaoExit(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dtLiquidacaoExit(Sender: TObject);
  private
    { Private declarations }
    bConsulta, bProvPerda: Boolean;
    fPrincipal,fIOF,fPUAtu,fValResgPoup,fQtdResgPoup,fPercProv, fLucro, fPreju: Double;
    procedure EncheTreeView(iChave: Integer = -1);
    procedure Sel(iChave: Integer);
    procedure StatusTrvCurvas(bVisivel: Boolean; bColapsa: Boolean = false;
                              bLimpa: Boolean = false);
    procedure StatusConsulta;
    procedure StatusOperacao(bAplicacao:boolean; bAltera: Boolean = False);
    procedure CalculaValores(Sender: TObject);
    procedure MostraSaldos(bVisivel: Boolean);
    procedure HabilitaComponentes;
    procedure MontaMoeda;
    procedure ColoreComboRisco;

    function VerificaCampos: Boolean;
    function VerificaValores: Boolean;
    function VerificaIOF:boolean;
    function VerificaFlgNegociacao:boolean;
    function PreencheDadosPoupanca: Boolean;
    //AL_18
    function GravaItemsNegativos(iOper:integer;dDataProc, dDataLiq:TDateTime;
                                 sNatOper, sHistorico: String;
                                 var iPlanilha,iDocumento: Integer;
                                 iIdHistRenFix: Integer = -1;
                                 sOper : string = ''; iCurvaRenfix : Integer = -1):boolean;
    function BuscaPagtoJuros(dDataOper:string;iOperRenFixAplic,iPlanPrev:integer):Double;
    function BuscaFlgNegociavel(iOperAplic: Integer): String;
    function BuscaSldCartHipo(iOperAplic: Integer): Double;
    function RecalculaResgates(dDataProc: TDateTime;
                               iInvestimento, iOperAplic: Integer): Boolean;
    //AL_36 - Verifica se o Item será exibido no TreeView
    function ExibeItem(iCurva, iItem: Integer; sItem: String): String;

  public
    { Public declarations }
  end;

  pItem = ^TItem;
  TItem = record
     IDItem:          Integer;
     IDCurva:         Integer;
     FLGContabil:     String;
     FLGCOTRENFIX:    String;
     FLGMoeda:        String;
     FLGCentralizado: String;
     FLGDestacado:    String;
     IDRegra:         Integer;
     SeqCalculo:      Integer;
     IDMoeda:         Integer;
     VlrCurva:        Double;
     PercCurva:       Double;
     TipoItem:        String;
  end;

var
  frmCadOperRenFix: TfrmCadOperRenFix;
  iContraParte,iIdForCli,iIdOperRenFix,iIdHistRenFix : Integer;
  sTipoOper : TTipoOper;
  flgNegociacao, sObs, sFlgRecalc : String;
  bCotRenFix : boolean;
  //AL_11
  dDataAniv : TDateTime;
  //AL_28
  fQtdBloqPenhora : Double;

implementation

uses UBibliotecaInvest, UMensErro, dBaseDados, URendaFixa, UDataBase,USistema,
     dRendaFixa,UOperComum,ULancContab, UImpostos, UDiasUteisInv;

{$R *.DFM}

procedure TfrmCadOperRenFix.EncheTreeView(iChave: Integer = -1);
var wItem: pItem;
    iCurva, iItem: Integer;
    sItem : String;
    nTreeNode1, nTreeNode2: TTreeNode;
begin

   trvCurvas.Items.Clear;
   bProvPerda := False;

   if (Trim(dblkInvestimento.Text) = '') then
      Exit;

   // Preenche a query
   RendaFixa.SelItemXOpeXInv(StrToInt(dblkInvestimento.LookupValue));

   // Preenche o TreeView
   with trvCurvas.Items do
   begin
      Clear;
      DMRendaFixa.qrySelItemXOpeXInv.First;
      nTreeNode1 := nil;
      while not DMRendaFixa.qrySelItemXOpeXInv.Eof do
      begin
         // Cria e Carrega o Ponteiro (Objeto) com os dados da Curva
         iCurva := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger;
         New(wItem);
         wItem.IDCurva := iCurva;
         wItem.FLGContabil := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('FLGCURVACONTABIL').AsString;
         wItem.FLGCOTRENFIX := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('FLGCOTRENFIX').AsString;
         wItem.IDItem := 0;
         wItem.FLGMoeda := '';
         wItem.IDRegra := 0;
         wItem.FLGCentralizado := '';
         wItem.FLGDestacado := '';
         wItem.SeqCalculo := 0;
         wItem.IDMoeda := 0;
         wItem.PercCurva := 0;
         wItem.VlrCurva := 0;
         wItem.TipoItem := '';

         // Inclui o TreNode da Curva
         sItem := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCCURVARENFIX').AsString;
         nTreeNode1 := AddObject(nTreeNode1,sItem,wItem);
         nTreeNode1.ImageIndex := 1;
         nTreeNode1.SelectedIndex := 0;

         while (not DMRendaFixa.qrySelItemXOpeXInv.Eof) and
               (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger = iCurva) do
         begin
            // Cria e Carrega o Ponteiro (Objeto) com os dados do Item da Curva
            iItem := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger;

            // Itens Positivos
            if iItem >= 0 and iItem then
            begin
               New(wItem);
               wItem.IDItem          := iItem;
               wItem.IDCurva         := iCurva;
               wItem.FLGContabil     := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('FLGCURVACONTABIL').AsString;
               wItem.FLGCOTRENFIX := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('FLGCOTRENFIX').AsString;
               wItem.FLGMoeda        := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('FLGMOEDA').AsString;
               wItem.IDRegra         := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDREGRA').AsInteger;
               wItem.FLGCentralizado := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('FLGCENTRALIZADO').AsString;
               wItem.FLGDestacado    := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('FLGDESTACADO').AsString;
               wItem.SeqCalculo      := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('SEQCALCULO').AsInteger;
               wItem.TipoItem        := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('TIPOITEM').AsString;

               // Procura Valores de Itens da Operação iChave
               if iChave = -1 then
               begin
                  wItem.IDMoeda := 0;
                  wItem.VlrCurva := 0;
                  wItem.PercCurva := 100;
                  // Item Correção quando Poupança  -> sugere o Indice Default do Parâmetro
                  if (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCLASSETIT').AsInteger in [CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq]) and
                     (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('FLGMOEDA').AsString = 'Y') then
                     wItem.IDMoeda := CtrlPInv.IdIndexPoupanca;

                  // Item Juros quando Poupança  -> sugere o Juros Default do Parâmetro
                  // Alteração para pegar somente o tipo T(Taxa) no preenchimento do Juros
                  if (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCLASSETIT').AsInteger in [CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq]) and
                     (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('FLGMOEDA').AsString = 'N') and
                     (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('TIPOITEM').AsString = 'T') then
                     wItem.VlrCurva := CtrlPInv.JurosPoupanca;

                  // Items Depósito Judicial e Ações Judiciais para POUPANÇA BLOQUEADA
                  // Recebe o valor da operação
                  if (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCLASSETIT').AsInteger in [CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq]) and
                     (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('FLGMOEDA').AsString = 'N') and
                     (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('TIPOITEM').AsString = 'V') then
                     wItem.VlrCurva := dbrVlrOperacao.Value;
               end
               else
               begin
                  RendaFixa.SelItemDaOperacao(iChave, iCurva, iItem);
                  if DMRendaFixa.qrySelOperRenFixXCurvas.Eof then
                  begin
                     wItem.IDMoeda := 0;
                     wItem.PercCurva := 100;
                     wItem.VlrCurva := 0;
                  end
                  else
                  begin
                     wItem.PercCurva := DMRendaFixa.qrySelOperRenFixXCurvas.FieldByName('PERCCURVA').AsFloat;
                     wItem.VlrCurva := DMRendaFixa.qrySelOperRenFixXCurvas.FieldByName('VLRCURVA').AsFloat;
                     if DMRendaFixa.qrySelOperRenFixXCurvas.FieldByName('MOECODIGO').IsNull then
                        wItem.IDMoeda := -1
                     else
                        wItem.IDMoeda := DMRendaFixa.qrySelOperRenFixXCurvas.FieldByName('MOECODIGO').AsInteger;
                  end;
               end;

               // Incluir o TreeNode dos Items da Curva
               sItem := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString;
               nTreeNode2 := AddChildObject(nTreeNode1, sItem, wItem);
               nTreeNode2.ImageIndex := 2;
               nTreeNode2.SelectedIndex := 3;
            end;

            DMRendaFixa.qrySelItemXOpeXInv.Next;
         end;
      end;
   end;
   trvCurvas.FullExpand;
end;

procedure TfrmCadOperRenFix.Sel(iChave: Integer);
begin
   // AL_12 - Ini
   OperComum.LimpaParametros(qryInvestimento);
   qryInvestimento.Open;

   OperComum.LimpaParametros(qry);
   qry.ParamByName('IDOPERRENFIX').AsInteger := iChave;
   qry.Open;

   OperComum.LimpaParametros(qryHistorico);
   qryHistorico.ParamByName('IDOPERRENFIX').AsInteger := iChave;
   qryHistorico.Open;
   // AL_12 - Fim
   ColoreComboRisco;
   EncheTreeView(iChave);
   pgMestre.ActivePage := tbCombos;
end;

procedure TfrmCadOperRenFix.StatusTrvCurvas(bVisivel: Boolean; bColapsa: Boolean = false;
                              bLimpa: Boolean = false);
begin
  pnlCurvasDet.Visible := bVisivel;
  if bColapsa then trvCurvas.FullCollapse;
  if bLimpa   then trvCurvas.Items.Clear;
end;

procedure TfrmCadOperRenFix.StatusConsulta;
begin
   pnlFundo.Enabled := True;
   tbCombos.Enabled := False;
   tbObs.Enabled := False;
   trvCurvas.FullExpand;
   bConsulta := True;
   sbtnBuscaSaldos.Enabled := True;
   MostraSaldos(False);
end;

procedure TfrmCadOperRenFix.StatusOperacao(bAplicacao:boolean; bAltera: Boolean = False);
begin
   pnlFundo.Enabled := True;
   tbCombos.Enabled := True;
   tbObs.Enabled := True;
   bConsulta := False;
   dbdDtaVencimento.Enabled := True;
   dbdDtaEmissao.Enabled := True;
   sbtnBuscaSaldos.Enabled := False;

   if bAplicacao then                  // Aplicacao
   begin
      pnlCurvasDet.Enabled := True;
      // Habilita combos
      dblkEmissor.Enabled := True;
      dblkOperacao.Enabled := True;
      dblkForCli.Enabled := True;
      dblkInvestimento.Enabled := True;
      dblkCarteira.Enabled := True;
      dblkCustodiante.Enabled := True;
      dblkAutorizacao.Enabled := True;
      dblkClasseRisco.Enabled := True;
      // Habilita Campo
      dbdDataOperacao.Enabled := True;
      chkFlgNegociacao.Enabled := True;
      dbrVlrOperacao.Enabled   := True;
      dbrQtdeOperacao.Enabled  := True;
      dbePuOperacao.Enabled    := True;
   end
   else
   begin
      pnlCurvasDet.Enabled     := False;
      dblkEmissor.Enabled      := False;
      dblkInvestimento.Enabled := False;
      dblkCarteira.Enabled     := False;
      dblkCustodiante.Enabled  := False;
      dblkClasseRisco.Enabled  := False;
      chkFlgNegociacao.Enabled := False;

      if not bAltera then
      begin
         // Desabilita combos
         bConsulta                := True;
         dblkOperacao.Enabled     := True;
         dblkForCli.Enabled       := True;
         dblkAutorizacao.Enabled  := True;
         //AL_40
         dbrVlrOperacao.Enabled   := True;
         dbrQtdeOperacao.Enabled  := True;
         dbePuOperacao.Enabled    := True;
         dtLiquidacao.Enabled     := True;
         dbreCorretagem.Enabled   := True;
         dbreEmolumentos.Enabled  := True;
         dbeBoleta.Enabled        := True;
      end
      else
      begin
           // AL_3
           dbdDataOperacao.Enabled  := False;
           dbdDtaVencimento.Enabled := False;
           dbrVlrOperacao.Enabled   := False;
           dbrQtdeOperacao.Enabled  := False;
           dbePuOperacao.Enabled    := False;
           dbdDtaEmissao.Enabled    := False;
           dbePUEmissao.Enabled     := False;
           dblkOperacao.Enabled     := False;
           dblkForCli.Enabled       := False;
           dblkAutorizacao.Enabled  := False;

           pnlDataEmissao.Enabled  := True;
           dbdDtaEmissao.Enabled   := True;
           pnlPUEmissao.Enabled    := True;
           dbePUEmissao.Enabled    := True;
           dblkClasseRisco.Enabled := True;
           dbRtObs.Enabled         := True;
      end;
   end;

   MostraSaldos(False);
end;

procedure TfrmCadOperRenFix.CalculaValores(Sender: TObject);
begin
   if (qryVLROPERACAO.AsFloat <> 0) and (qryQTDEOPERACAO.AsFloat <> 0) and (qryPUOPERACAO.AsFloat <> 0) and
      (not (qryVLROPERACAO.AsFloat = OperComum.Round(qryQTDEOPERACAO.AsFloat * qryPUOPERACAO.AsFloat,2))) then
   begin
      if (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCLASSETIT').AsInteger in [CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq]) then
         dbrQtdeOperacao.Value :=  OperComum.Round(dbrVlrOperacao.Value / dbePuOperacao.Value, dbrQtdeOperacao.DecDigits)
      else
      if MsgDlg('O Valor da Operação apresenta Divergência. Deseja ajustar ?','Mensagem do Sistema ',
         mtConfirmation ,[MbYes, MbNo],0) = MrYes Then
      begin

         case TDBRealEdit(Sender).Tag of
         -1: begin       // Alterado o Valor
                if (dbrVlrOperacao.Value > 0) and (dbePuOperacao.Value > 0) then
                   dbrQtdeOperacao.Value :=  OperComum.Round(dbrVlrOperacao.Value / dbePuOperacao.Value, dbrQtdeOperacao.DecDigits);
             end;
         -2,-4: begin    // Alterado a Qtd ou PU
                if (dbrQtdeOperacao.Value > 0) and (dbePuOperacao.Value > 0) then
                   dbrVlrOperacao.Value := OperComum.Round(dbrQtdeOperacao.Value * dbePuOperacao.Value,2);
                end;
         end;
      end;
   end;

   // AL_14
   // Se a data da emissão for igual a data da operação o PU de emissão é o PU de Operação
   if (qryTipoOperacaoNATUREZAOPERACAO.AsString = 'A') and
      (dbdDataOperacao.Date = dbdDtaEmissao.Date) and
      (Trim(dbePUEmissao.Text) = '') then
         dbePUEmissao.Value := dbePuOperacao.Value;

   VerificaValores;

end;

procedure TfrmCadOperRenFix.MostraSaldos(bVisivel: Boolean);
begin
   lblSaldos.Visible := bVisivel;
   if (qryInvestimentoIDCLASSETIT.AsInteger = CtrlPInv.IdClassePoup) or
      (qryInvestimentoIDCLASSETIT.AsInteger = CtrlPInv.IdClassPoupBloq) then
   begin
      lblSldQtdTit.Visible := False;
      lblSldQtd.Visible := False;
   end else begin
      lblSldQtdTit.Visible := bVisivel;
      lblSldQtd.Visible := bVisivel;
   end;
   lblSldVlrTit.Visible := bVisivel;
   lblSldVlr.Visible := bVisivel;
end;

procedure TfrmCadOperRenFix.HabilitaComponentes;
begin
   if (Trim(dblkInvestimento.Text) <> '') and
      ((qryInvestimentoIDCLASSETIT.AsInteger = CtrlPInv.IdClassePoup) or
       (qryInvestimentoIDCLASSETIT.AsInteger = CtrlPInv.IdClassPoupBloq)) then
   begin
      pnlDataVencimento.Visible := False;
      pnlQuantidade.Visible := False;
      pnlPUOperacao.Visible := False;
      pnlDataEmissao.Visible := False;
      pnlPUEmissao.Visible := False;
   end else begin
      pnlValor.Visible := False;
      pnlDataVencimento.Left := pnlDataOperacao.Left + pnlDataOperacao.Width;
      pnlDataVencimento.Visible := True;
      pnlValor.Left := pnlDataVencimento.Left + pnlDataVencimento.Width;
      pnlValor.Visible := True;
      pnlQuantidade.Left := pnlValor.Left + pnlValor.Width;
      pnlQuantidade.Visible := True;
      pnlPUOperacao.Left := pnlQuantidade.Left + pnlQuantidade.Width;
      pnlPUOperacao.Visible := True;
      pnlDataEmissao.Left := pnlPUOperacao.Left + pnlPUOperacao.Width;
      pnlDataEmissao.Visible := True;
      pnlPUEmissao.Left := pnlDataEmissao.Left + pnlDataEmissao.Width;
      pnlPUEmissao.Visible := True;
   end;
   // AL_12
   if (qryInvestimentoFLGREPACTUA.AsString = 'S') and
      (qry.RecordCount > 0) then
      tbsHistorico.TabVisible := True
   else
      tbsHistorico.TabVisible := False;

end;

procedure TfrmCadOperRenFix.MontaMoeda;
begin
   qryMoeda.Close;
   qryMoeda.SQL.Clear;
   if chkMoeda.checked then
      qryMoeda.SQL.Add('SELECT MOECODIGO, MOEDESC, MOESIGLA ' +
                       'FROM MOEDA ' +
                       'WHERE MOESIGLA LIKE ''INV_%'' '+
                       'ORDER BY MOESIGLA')
   else
      qryMoeda.SQL.Add('SELECT MOECODIGO, MOEDESC, MOESIGLA ' +
                       'FROM MOEDA ' +
                       'ORDER BY MOESIGLA');
   qryMoeda.Open;
end;

procedure TfrmCadOperRenFix.ColoreComboRisco;
begin
  if Trim(dblkClasseRisco.Text) = '' then
     dblkClasseRisco.Font.Color := clBlack
  else dblkClasseRisco.Font.Color := qryCasseRiscoCORCLASSRISCO.AsInteger;
end;

function TfrmCadOperRenFix.VerificaCampos: Boolean;
var
   nTreeNode : TTreeNode;
begin
   Result := False;

   //Se a Curva Possuir Taxa na Operacao
   with qryBuscaTaxas do
   begin
      OperComum.LimpaParametros(qryBuscaTaxas);
      ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
      Open;
      Close;
   end;

   // Se for Classe NTN-C
   if ((Trim(dbdDtaLeilao.Text) = '') and (qryInvestimentoIDCLASSETIT.AsInteger = CtrlPInv.IdClassNTN)
   // AL_17
   and (qryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'A')) then
   begin
      MsgDlg('Data do Leilão não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbdDtaLeilao.CanFocus then
         dbdDtaLeilao.SetFocus;
      Exit;
   end;

   if Trim(dblkAutorizacao.Text) = '' then
   begin
      MsgDlg('Autorização não Selecionada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkAutorizacao.CanFocus then
         dblkAutorizacao.SetFocus;
      Exit;
   end;

   if Trim(dblkInvestimento.Text) = '' then
   begin
      MsgDlg('Investimento não Selecionado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkInvestimento.CanFocus then
         dblkInvestimento.SetFocus;
      Exit;
   end;

   if Trim(dblkOperacao.Text) = '' then
   begin
      MsgDlg('Tipo de Operação não Selecionado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkOperacao.CanFocus then
         dblkOperacao.SetFocus;
      Exit;
   end;

   if Trim(dblkCarteira.Text) = '' then
   begin
      MsgDlg('Carteira não Selecionada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkCarteira.CanFocus then
         dblkCarteira.SetFocus;
      Exit;
   end;

   if Trim(dblkForCli.Text) = '' then
   begin
      MsgDlg('Contra Parte não Selecionada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkForCli.CanFocus then
         dblkForCli.SetFocus;
      Exit;
   end;

   if Trim(dblkCustodiante.Text) = '' then
   begin
      MsgDlg('Custodiante não Selecionado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkCustodiante.CanFocus then
         dblkCustodiante.SetFocus;
      Exit;
   end;

   if Trim(dbdDataOperacao.Text) = '' then
   begin
      MsgDlg('Data da Operação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbdDataOperacao.CanFocus then
         dbdDataOperacao.SetFocus;
      Exit;
   end;

   //AL_18 Ini
   if Trim(dtLiquidacao.Text) = '' then
   begin
      pgMestre.ActivePage := tbObs;
      MsgDlg('Data de Liquidação Financeira não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtLiquidacao.CanFocus then
         dtLiquidacao.SetFocus;
      Exit;
   end;
   //AL_18 Fim

   if (sTipoOper = [Resgate]) then
   begin
      if dbdDataOperacao.Date = DiasUteisInv.PrimeiroDiaUtilPosterior(StrToDate(msBuscaSaldos.ValoresChave[5]),-1, 1,'',True,False,False) then
      sFlgRecalc := 'S';
      qryFLGRECALC.AsString := 'S';
   end
   else
      sFlgRecalc := '';

   if (sTipoOper = [Resgate]) and (bCotRenFix) then // Investimento com Cotação de Renda Fixa
   begin
      if dbdDataOperacao.Date < StrToDate(msBuscaSaldos.ValoresChave[5]) then
      begin
         MsgDlg('Data da Operação não pode ser anterior à Data do Saldo.','Mensagem do Sistema',mtWarning,[MbOk],0);
         qryDATAOPERACAO.AsDateTime := StrToDate(msBuscaSaldos.ValoresChave[5]);
         if dbdDataOperacao.CanFocus then
            dbdDataOperacao.SetFocus;
         Exit;
      end
      else if dbdDataOperacao.Date > DiasUteisInv.PrimeiroDiaUtilPosterior(StrToDate(msBuscaSaldos.ValoresChave[5]),-1, 1,'',True,False,False) then
      begin
         MsgDlg('Data da Operação não pode ser maior que o próximo dia útil à Data do Saldo.','Mensagem do Sistema',mtWarning,[MbOk],0);
         qryDATAOPERACAO.AsDateTime := StrToDate(msBuscaSaldos.ValoresChave[5]);
         if dbdDataOperacao.CanFocus then
            dbdDataOperacao.SetFocus;
         Exit;
      end;
   end;

   if dbrVlrOperacao.Value = 0 then
   begin
      MsgDlg('Valor da Operação não Informado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbrVlrOperacao.CanFocus then
         dbrVlrOperacao.SetFocus;
      Exit;
   end;

   if (qryInvestimentoIDCLASSETIT.AsInteger <> CtrlPInv.IdClassePoup) and
      (qryInvestimentoIDCLASSETIT.AsInteger <> CtrlPInv.IdClassPoupBloq) then
   begin
      if Trim(dbdDtaVencimento.Text) = '' then
      begin
         MsgDlg('Data de Vencimento não Selecionada.','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dbdDtaVencimento.CanFocus then
            dbdDtaVencimento.SetFocus;
         Exit;
      end;

      if sTipoOper = [Aplicacao] then
      begin
         if dbdDtaVencimento.Date <= dbdDataOperacao.Date then
         begin
            MsgDlg('Data de vencimento menor ou igual a data de operação.','Mensagem do Sistema',mtWarning,[MbOk],0);
            if dbdDtaVencimento.CanFocus then
               dbdDtaVencimento.SetFocus;
            Exit;
         end;
      end;

      if dbdDataOperacao.Date < dbdDtaEmissao.Date then
      begin
         MsgDlg('Data da operação menor que data de emissão.','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dbdDataOperacao.CanFocus then
            dbdDataOperacao.SetFocus;
         Exit;
      end;

      if dbrQtdeOperacao.Value = 0 then
      begin
         MsgDlg('Quantidade da Operação não Informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dbrQtdeOperacao.CanFocus then
            dbrQtdeOperacao.SetFocus;
         Exit;
      end;

      if dbePuOperacao.Value = 0 then
      begin
         MsgDlg('Preço Unitário da Operação não Informado.','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dbePuOperacao.CanFocus then
            dbePuOperacao.SetFocus;
         Exit;
      end;

      if dbePUEmissao.Value = 0 then
      begin
         MsgDlg('Preço Unitário de Emissão não Informado.','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dbePUEmissao.CanFocus then
            dbePUEmissao.SetFocus;
         Exit;
      end;

      if Trim(dbdDtaEmissao.Text) = '' then
      begin
         MsgDlg('Data de Emissão não Informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dbdDtaEmissao.CanFocus then
            dbdDtaEmissao.SetFocus;
         Exit;
      end;
   end
   else
   begin
      if sTipoOper = [Aplicacao] then
      begin
      qryQTDEOPERACAO.AsFloat := (dbrVlrOperacao.Value / 1000);
      qryPUOPERACAO.AsFloat := 1000;
      qryPUEMISSAO.AsFloat := 1000;
      qryDATAEMISSAO.AsDateTime := dbdDataOperacao.DateTime;
      end else
      begin
         qryQTDEOPERACAO.AsFloat := dbrQtdeOperacao.Value;
         qryPUOPERACAO.AsFloat := (dbrVlrOperacao.Value / dbrQtdeOperacao.Value);
         qryPUEMISSAO.AsFloat := dbePUEmissao.Value;
         qryDATAEMISSAO.AsDateTime := dbdDtaEmissao.DateTime;
      end;
   end;

   // Verifica Items do trvCurvas
   If trvCurvas.Selected = Nil Then
      //AL_48
      if trvCurvas.CanFocus then
         trvCurvas.SetFocus;

   //AL_7
   if sTipoOper = [Aplicacao] then
   begin
      nTreeNode := trvCurvas.Items.GetFirstNode;
      while nTreeNode <> nil do
      begin
         if pItem(nTreeNode.Data).IDItem > 0 then    // Somente Itens
         begin
            if pItem(nTreeNode.Data).PercCurva <= 0 then
            begin
               MsgDlg('Existe Percentual de Item Menor ou Igual a Zero.','Mensagem do Sistema',mtWarning,[mbOk],0);
               if dbrPercentual.CanFocus then
                  dbrPercentual.SetFocus;
               Exit;
            end;
            if (pItem(nTreeNode.Data).TipoItem = 'T') or
               (pItem(nTreeNode.Data).TipoItem = 'V') or
               (pItem(nTreeNode.Data).TipoItem = 'P') then
            begin
               if (pItem(nTreeNode.Data).VlrCurva = 0) then
               begin
                  if (pItem(nTreeNode.Data).IDItem = CtrlPInv.IdOperaMortPrinc) or    // Fluxos aceita 0(zero) no valor
                     (pItem(nTreeNode.Data).IDItem = CtrlPInv.IdOperIncJuros)   or
                     (pItem(nTreeNode.Data).IDItem = CtrlPInv.IdOperPagtoJuros) or
                     (pItem(nTreeNode.Data).TipoItem = 'N') or
                     //AL_36 - Caso o Item não seja exibido, aceita 0(zero) no valor
                     //AL_42 - Capta os dados pelo Nó, e não pelo TreeView, que estará desponteirado já na 2ª interação
                     (ExibeItem(pItem(nTreeNode.Data).IDCurva,
                                pItem(nTreeNode.Data).IDItem,
                                nTreeNode.Text) = 'N' ) then
                  begin
                      nTreeNode := nTreeNode.GetNext;
                      Continue;
                  end
                  else
                  begin
                     MsgDlg('Existe Valor/Taxa/PU de Item Igual a Zero.','Mensagem do Sistema',mtWarning,[mbOk],0);
                     if dbrValor.CanFocus then
                        dbrValor.SetFocus;
                     Exit;
                  end;
               end;
            end
            else if pItem(nTreeNode.Data).TipoItem = 'M' then
            begin
               //AL_10
               if (pItem(nTreeNode.Data).IDMoeda = 0) and (pItem(nTreeNode.Data).FLGCOTRENFIX <> 'Y') then  // Moeda da Tabela MOEDA e não COTACAORENFIX
               begin
                  MsgDlg('Existe Moeda de Item não Identificada.','Mensagem do Sistema',mtWarning,[mbOk],0);
                  if dblkMoeda.CanFocus then
                     dblkMoeda.SetFocus;
                  Exit;
               end;
            end;
         end;
         nTreeNode := nTreeNode.GetNext;
      end;
   end;

   Result := True;
end;

function TfrmCadOperRenFix.VerificaValores: Boolean;
var sQtd: String;
begin
   Result := True;
   if (qryVLROPERACAO.AsFloat <> 0) and (qryQTDEOPERACAO.AsFloat <> 0) and (qryPUOPERACAO.AsFloat <> 0) and
      (qryVLROPERACAO.AsFloat <> OperComum.Round(qryQTDEOPERACAO.AsFloat * qryPUOPERACAO.AsFloat,2)) then
   begin
      MsgDlg('O Valor da Operação está diferente do produto'+#13 +
             'da Quantidade pelo Pu de Operação. ' + #13 +
             'As atualizações diárias deste investimento levarão em conta este PU.','Mensagem do Sistema ',mtWarning,[mbOK],0);
   end;

   if qryTipoOperacaoNATUREZAOPERACAO.AsString = 'D' then
   begin
      if (msBuscaSaldos.ValoresChave[13] = IntToStr(CtrlPInv.IdClassePoup)) or
         (msBuscaSaldos.ValoresChave[13] = IntToStr(CtrlPInv.IdClassPoupBloq)) then
      begin
         sQtd := StrTran(lblSldQtd.Caption, '.');
         if OperComum.Trunca(dbrQtdeOperacao.Value,0) > OperComum.Trunca(StrToFloat(sQtd),0) then
         begin
            MsgDlg('A Valor Operado Não poder ser Maior que o do Saldo.','Mensagem do Sistema ',mtWarning,[mbOK],0);
            if (frmCadOperRenFix.ActiveControl <> bbtnSair) and
               (frmCadOperRenFix.ActiveControl <> bbtnCancelar) then
               //AL_48
               if dbrQtdeOperacao.CanFocus then
                  dbrQtdeOperacao.SetFocus;
            Result := False;
         end;
      end else
      begin
         if dbrQtdeOperacao.Value > DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat then
         begin
            MsgDlg('A Quantidade Operada Não poder ser Maior que a do Saldo.','Mensagem do Sistema ',mtWarning,[mbOK],0);
            if (frmCadOperRenFix.ActiveControl <> bbtnSair) and
               (frmCadOperRenFix.ActiveControl <> bbtnCancelar) then
            //AL_48
            if dbrQtdeOperacao.CanFocus then
               dbrQtdeOperacao.SetFocus;
            Result := False;
         end;
      end;
   end;
end;

function TfrmCadOperRenFix.VerificaIOF:boolean;
begin
   Result := True;
   if (fIOF > 0) and (sTipoOper = [Resgate])  then
   begin
      fIOF := (dbrQtdeOperacao.Value * fIOF)/
               DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat;
      if MsgDlg('O resgate apresenta IOF de R$ '
                + FormatFloat('###,###,###,###,##0.00',fIOF)+', Deseja continuar ?','Mensagem do Sistema ',
                MtWarning,[MbOk, MbCancel],0) = MrCancel Then
         Result := False;
   end;
end;

function TfrmCadOperRenFix.VerificaFlgNegociacao:boolean;
begin
   Result := True;
   if (sTipoOper = [Resgate])  and (qryFLGNEGOCIACAO.AsString = 'N') then
   begin
      if MsgDlg('O título está marcado como Não Negociavel! Deseja continuar ?','Mensagem do Sistema ',
                MtWarning,[MbOk, MbCancel],0) = MrCancel Then
         Result := False;
   end;
end;

function TfrmCadOperRenFix.PreencheDadosPoupanca: Boolean;
var nTreeNode: TTreeNode;
begin
   Result := True;
   if qryInvestimentoIDCLASSETIT.AsInteger = CtrlPInv.IdClassPoupBloq then
   begin
      try
         nTreeNode := trvCurvas.Items.GetFirstNode;
         while nTreeNode <> nil do
         begin
            if (pItem(nTreeNode.Data).IDItem > 0) and (pItem(nTreeNode.Data).TipoItem = 'V') then
               pItem(nTreeNode.Data).VlrCurva := dbrVlrOperacao.Value;

            nTreeNode := nTreeNode.GetNext;
         end;
      except
         Result := False;
      end;
   end;
end;

//AL_18
function TfrmCadOperRenFix.GravaItemsNegativos(iOper:integer;
                                               dDataProc, dDataLiq:TDateTime;
                                               sNatOper, sHistorico: String;
                                               var iPlanilha,iDocumento: Integer;
                                               iIdHistRenFix: Integer = -1;
                                               sOper : string = ''; iCurvaRenfix : Integer = -1):boolean;
var bAchou: Boolean;
    I, iTipo: Integer;
    sRecTot, sRecAtu: String;
    fValor, fIR,fPUMercCP : Double;
begin
   Result := True;
   fValor := 0;
   fLucro := 0;
   fPreju := 0;

   // Grava Items Negativos
   DMRendaFixa.qrySelItemXOpeXInv.Filtered := True;
   DMRendaFixa.qrySelItemXOpeXInv.Filter := 'IDITEMRENFIX < 0';
   DMRendaFixa.qrySelItemXOpeXInv.FindFirst;
   sRecTot := '';

   if DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger > -10 then
   begin
      sRecAtu := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsString +
                 '-0' + IntToStr(Abs(DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger));
   end else begin
      sRecAtu := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsString +
                 DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsString;
   end;

   fIR  := 0;
   fIOF := 0;

   try
      // Faça enquanto sRecAtu não for encontrado em sRecTot
      while Pos(sRecAtu,sRecTot) = 0 do
      begin
         fraMensOper.Mes := 'Gravando ' + DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString;
         sRecTot := sRecTot + sRecAtu;
         if (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -21) or
            (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -13) or
            (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -12) or
            (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -6) or
            (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -5) or
            (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -4) or
            (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -3) or
            (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -2) or
            (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -1) then
         begin
            for I := 0 to frmCadOperRenFix.ComponentCount -1 do
            begin
               if (frmCadOperRenFix.Components[I].Tag =
                   DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger) or
                  ((DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -5) and
                   (frmCadOperRenFix.Components[I].Tag = -1)) or
                  ((DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -6) and
                   (frmCadOperRenFix.Components[I].Tag = -1)) then
               begin
                  if (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -1) or
                     (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -5) or
                     (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -6)  then
                  begin
                     // -1: Principal  /  -5: Valor Liquido  /  -6: Valor Bruto
                     fValor := TDBRealEdit(frmCadOperRenFix.Components[I]).Value;

                     if (sNatOper = 'D') then
                     begin
                        if (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -1) then
                        begin
                           if not (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCLASSETIT').AsInteger in [CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq]) then
                           fValor := (dbrQtdeOperacao.Value * fPrincipal)/
                                     DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat
                        end
                        else if (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -5) then
                           fValor := TDBRealEdit(frmCadOperRenFix.Components[I]).Value - fIR;
                     end;

                     //AL_27
                     if not RendaFixa.GravaOperRenFixXCurvas(iOper,
                                      DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                      DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger,
                                      -1, fValor, 100) then
                        Raise Exception.Create('Não foi possível gravar um Item da Operação:' + #13 +
                                               DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);

                     if iIdHistRenFix <> -1 then // Aplicação
                     begin
                        // Passa a gravar o fValor ao invés do valor do componente.
                        //  Alteração efetuada para o item provisão de perda
                        //AL_9
                        //AL_27
                        if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger,
                                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDREGRA').AsInteger,
                                         fValor,
                                         fValor,
                                         fValor,
                                         fValor) then
                           Raise Exception.Create('Não foi possível gravar um Item do Histórico da Operação:' + #13 +
                                                  DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
                     end;
                  end;
                  if DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -2 then
                  begin
                     fValor := TDBRealEdit(frmCadOperRenFix.Components[I]).Value;
                     //AL_27
                     if not RendaFixa.GravaOperRenFixXCurvas(iOper,
                                      DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                      -2, -1, TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                      100) then
                        Raise Exception.Create('Não foi possível gravar um Item da Operação:' + #13 +
                                               DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
                     if iIdHistRenFix <> -1 then
                     begin
                        //AL_9
                        //AL_27
                        if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                         -2, DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDREGRA').AsInteger,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value) then
                           Raise Exception.Create('Não foi possível gravar um Item do Histórico da Operação:' + #13 +
                                                  DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
                     end;
                  end;
                  if DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -3 then
                  begin
                     fValor := TDBRealEdit(frmCadOperRenFix.Components[I]).Value;
                     //AL_27
                     if not RendaFixa.GravaOperRenFixXCurvas(iOper,
                                      DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                      -3, -1, TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                      100) then
                        Raise Exception.Create('Não foi possível gravar um Item da Operação:' + #13 +
                                               DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
                     if iIdHistRenFix <> -1 then begin
                        //AL_9
                        //AL_27
                        if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                         -3, DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDREGRA').AsInteger,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value) then
                           Raise Exception.Create('Não foi possível gravar um Item do Histórico da Operação:' + #13 +
                                                  DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
                     end;
                  end;
                  if DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -4 then
                  begin
                     fValor  := TDBRealEdit(frmCadOperRenFix.Components[I]).Value;
                     //AL_27
                     if not RendaFixa.GravaOperRenFixXCurvas(iOper,
                                      DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                      -4, -1, TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                      100) then
                        Raise Exception.Create('Não foi possível gravar um Item da Operação:' + #13 +
                                               DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
                     if iIdHistRenFix <> -1 then begin
                        //AL_9
                        //AL_27
                        if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                         -4, DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDREGRA').AsInteger,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value) then
                           Raise Exception.Create('Não foi possível gravar um Item do Histórico da Operação:' + #13 +
                                                  DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
                     end;
                  end;
                  if DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -12 then
                  begin
                     fValor := TDBRealEdit(frmCadOperRenFix.Components[I]).Value;
                     //AL_27
                     if not RendaFixa.GravaOperRenFixXCurvas(iOper,
                                      DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                      -12, -1, TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                      100) then
                        Raise Exception.Create('Não foi possível gravar um Item da Operação:' + #13 +
                                               DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
                     if iIdHistRenFix <> -1 then begin
                        //AL_9
                        //AL_27
                        if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                         -12, DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDREGRA').AsInteger,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value) then
                           Raise Exception.Create('Não foi possível gravar um Item do Histórico da Operação:' + #13 +
                                                  DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
                     end;
                  end;
                  if DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -13 then
                  begin
                     fValor := TDBRealEdit(frmCadOperRenFix.Components[I]).Value;
                     //AL_27
                     if not RendaFixa.GravaOperRenFixXCurvas(iOper,
                                      DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                      -13, -1, TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                      100) then
                        Raise Exception.Create('Não foi possível gravar um Item da Operação:' + #13 +
                                               DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
                     if iIdHistRenFix <> -1 then begin
                        //AL_9
                        //AL_27
                        if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                         -13, DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDREGRA').AsInteger,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value) then
                           Raise Exception.Create('Não foi possível gravar um Item do Histórico da Operação:' + #13 +
                                                  DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
                     end;
                  end;
                  if DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -21 then // PU Mercado na Compra
                  begin
                     fValor := TDBRealEdit(frmCadOperRenFix.Components[I]).Value;
                     fPUMercCP := TDBRealEdit(frmCadOperRenFix.Components[I]).Value;
                     //AL_27
                     if not RendaFixa.GravaOperRenFixXCurvas(iOper,
                                      DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                      -21, -1, TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                      100) then
                        Raise Exception.Create('Não foi possível gravar um Item da Operação:' + #13 +
                                               DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
                     if iIdHistRenFix <> -1 then begin
                        //AL_9
                        //AL_27
                        if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                         -21, DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDREGRA').AsInteger,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value,
                                         TDBRealEdit(frmCadOperRenFix.Components[I]).Value) then
                           Raise Exception.Create('Não foi possível gravar um Item do Histórico da Operação:' + #13 +
                                                  DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
                     end;
                  end;
               end;
            end;
         end
         else
         // Grava Items Negativos Não associados à Componentes
         begin
            // Valor Default dos Itens
            fValor := 0;
            if (sNatOper = 'D') then
            begin
               if (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -7) then
               begin
                  // IR
                  DMRendaFixa.qryBuscaSaldosItems.First;
                  while not DMRendaFixa.qryBuscaSaldosItems.Eof do
                  begin
                     if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger =
                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger) and
                        (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger =
                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger) then
                     begin
                         fIR := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;
                         Break;
                     end;
                     DMRendaFixa.qryBuscaSaldosItems.Next;
                  end;
                  if (sNatOper = 'A') then
                     fIR := (dbrQtdeOperacao.Value * fIR)/
                             DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat
                  else
                     fIR := 0;
                  fValor := fIR
               end
               else if (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -8) then
               begin
                  // IOF
                  DMRendaFixa.qryBuscaSaldosItems.First;
                  while not DMRendaFixa.qryBuscaSaldosItems.Eof do
                  begin
                     if (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger =
                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger) and
                        (DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger =
                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger) then
                     begin
                         fIOF := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;
                         Break;
                     end;
                     DMRendaFixa.qryBuscaSaldosItems.Next;
                  end;
                  if (sNatOper = 'A') then
                     fIOF := (dbrQtdeOperacao.Value * fIOF)/
                              DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat
                  else
                     fIOF := 0;
                  fValor := fIOF
               end
               else if (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -9) then
               begin
                  // Lucro
                  fValor := dbrVlrOperacao.Value - (fPUAtu * dbrQtdeOperacao.Value);
                  if fValor <= 0 then
                     fValor := 0;
                  fLucro := fValor;
               end
               else if (DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -10) then
               begin
                  // Prejuizo
                  fValor := dbrVlrOperacao.Value - (fPUAtu * dbrQtdeOperacao.Value);
                  if fValor >= 0 then
                     fValor := 0;
                  fPreju := fValor;
               end;
            end;
            if DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -15 then
            begin
               // Grava a Provisão de perda na Operação com 0% - Na operação não tem
               //AL_27
               if not RendaFixa.GravaOperRenFixXCurvas(iOper,
                                DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger,
                                -1, fValor, 0) then
                  Raise Exception.Create('Não foi possível gravar um Item da Operação:' + #13 +
                                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
            end
            else if DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -19 then // Agio
            begin
               //AL_34 - Na emissão calcula o Ágio pelo PU de Emissão
               if (dbdDataOperacao.DateTime = dbdDtaEmissao.DateTime) and (dbrePuMercado.Value = 0) then
               begin
                  if dbePuOperacao.Value > dbePUEmissao.Value then
                     fValor := (dbePuOperacao.Value - dbePUEmissao.Value) * dbrQtdeOperacao.Value
                  else
                     fValor := 0;
               end
               else
               begin
                  if dbrePuMercado.Value <> 0 then
                  begin
                     if dbePuOperacao.Value > dbrePuMercado.Value then
                        fValor := (dbePuOperacao.Value - dbrePuMercado.Value) * dbrQtdeOperacao.Value
                     else
                        fValor := 0;
                  end;
               end;
               //AL_27
               if not RendaFixa.GravaOperRenFixXCurvas(iOper,
                                DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger,
                                -1, fValor, 0) then
                  Raise Exception.Create('Não foi possível gravar um Item da Operação:' + #13 +
                                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
            end
            else if DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -20 then // Desagio
            begin
               //AL_34 - Na emissão calcula o Deságio pelo PU de Emissão
               if (dbdDataOperacao.DateTime = dbdDtaEmissao.DateTime) and (dbrePuMercado.Value = 0) then
               begin
                  if dbePuOperacao.Value < dbePUEmissao.Value then
                     fValor := (dbePuOperacao.Value - dbePUEmissao.Value) * dbrQtdeOperacao.Value
                  else
                     fValor := 0;
               end
               else
               begin
                  if dbrePuMercado.Value <> 0 then
                  begin
                     if dbePuOperacao.Value < dbrePuMercado.Value then
                     fValor := (dbePuOperacao.Value - dbrePuMercado.Value) * dbrQtdeOperacao.Value
                  else
                     fValor := 0;
                  end;
               end;
               //AL_27
               if not RendaFixa.GravaOperRenFixXCurvas(iOper,
                                DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger,
                                -1, fValor, 0) then
                  Raise Exception.Create('Não foi possível gravar um Item da Operação:' + #13 +
                                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
            end
            else
            begin
               //AL_27
               if not RendaFixa.GravaOperRenFixXCurvas(iOper,
                                DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger,
                                -1, fValor, 100) then
                  Raise Exception.Create('Não foi possível gravar um Item da Operação:' + #13 +
                                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
            end;
            if iIdHistRenFix <> -1 then begin
               //AL_9
               //AL_27
               if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,
                                DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger,
                                DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDREGRA').AsInteger,
                                0, 0, 0, 0) then
                  Raise Exception.Create('Não foi possível gravar um Item do Histórico da Operação:' + #13 +
                                         DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString);
            end;
         end;
         // Contabiliza itens negativos somente se Aplicacao
         if (sNatOper = 'A') then
         begin

            iIdForCli := OperComum.BuscaForCli(1,
                                               qryContraParteIDPESSOA.AsInteger,
                                               qryTipoOperacaoIDTIPOOPERACAO.AsInteger,
                                               CtrlPInv.IdTipoClienteEMI);

            RendaFixa.IntegraContabCapCar(iIdHistRenFix,
                                          qryInvestimentoIDINVESTIMENTO.AsInteger,
                                          qryTipoOperacaoIDTIPOOPERACAO.AsInteger,
                                          qryCarteiraIDCARTEIRAINVEST.AsInteger,
                                          qryInvestimentoIDCLASSETIT.AsInteger,
                                          DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger,
                                          qryTipoOperacaoFLGGERACONTAB.AsInteger,
                                          qryTipoOperacaoFLGGERACAPCAR.AsInteger,
                                          qryContraParteIDPESSOA.AsInteger,
                                          qryTipoOperacaoCODTIPDOC.AsInteger,
                                          iPlanPrevCtbPatro,
                                          DMRendaFixa.qrySelItemXOpeXInv.FieldByName('FLGCURVACONTABIL').AsString,
                                          qryInvestimentoDESCINVESTIMENTO.AsString,
                                          sHistorico + ' ' + DMRendaFixa.qrySelItemXOpeXInv.FieldByName('DESCITEMRENFIX').AsString,
                                          fValor,
                                          dbreEmolumentos.Value,
                                          dbreCorretagem.Value,
                                          dDataProc,dDataProc,
                                          //AL_18
                                          dDataLiq,
                                          iPlanilha,iDocumento,-1,
                                          'Aplicacao',
                                          DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                          OperComum.IIF(dbdDataOperacao.DateTime >= CtrlPInv.DtMudaCPMF, 1, 0),true); //Thiago Passos SOL 123324 Kintana 615338 19/08/2009
         end;
         DMRendaFixa.qrySelItemXOpeXInv.FindNext;
         fraMensOper.Incrementa;
         // Pega Curva + Item - Para permitir fazer mais de uma curva
         if DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger > -10 then
         begin
            sRecAtu := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsString +
                       '-0' + IntToStr(Abs(DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger));
         end else begin
            sRecAtu := DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDCURVARENFIX').AsString +
                       DMRendaFixa.qrySelItemXOpeXInv.FieldByName('IDITEMRENFIX').AsString;
         end;
      end;
   finally
      DMRendaFixa.qrySelItemXOpeXInv.Filter := '';
      DMRendaFixa.qrySelItemXOpeXInv.Filtered := False;
   end;
end;

function TfrmCadOperRenFix.BuscaPagtoJuros(dDataOper:string;iOperRenFixAplic,iPlanPrev:integer):Double;
begin
   Result := 0;
   with qryBuscaPagtoJuros do
   begin
      OperComum.LimpaParametros(qryBuscaPagtoJuros);
      ParamByName('DATAOPERACAO').AsString       := dDataOper;
      ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperRenFixAplic;
      ParamByName('IDPLANPREVCTBPATR').AsInteger :=  iPlanPrev;
      Open;
      if not IsEmpty then
         Result := qryBuscaPagtoJurosVLROPERACAO.AsFloat;
   end;
end;

procedure TfrmCadOperRenFix.bbtnConfirmarClick(Sender: TObject);
var I, iOper,iPlanilha,iDocumento, iOperAplic: Integer;
    dDataReproc: TDateTime;
    nTreeNode: TTreeNode;
    sHistorico, sMens: String;
    flgContaInvest : integer;
    qryAltOpe : TwwQuery;

begin
//   inherited;

   // Força a saída do componente atual para acionar o OnExit deste componente
   //    no caso de teclar enter e o botão for default
   SelectNext(ActiveControl,True,True);

   iOper := 0;
   if sTipoOper <> [Alteracao] then
   begin
      if not VerificaCampos then
         Exit;
      if not VerificaValores then
         Exit;
      if not VerificaIOF then
         Exit;
   end
   //AL_20 Ini
   else
   begin
      if Trim(dtLiquidacao.Text) = '' then
      begin
         pgMestre.ActivePage := tbObs;
         MsgDlg('Data de Liquidação Financeira não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dtLiquidacao.CanFocus then
            dtLiquidacao.SetFocus;
         Exit;
      end;
   end;
   //AL_20 Fim

   // AL_10
   //AL_22
   if not CtrlInvContab.TestaPeriodo(DateToStr(qryDATAOPERACAO.AsDateTime),
                                     1, -1,
                                     qryInvestimentoIDCLASSETIT.AsInteger) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', mtWarning,[mbOk],0);
      Exit;
   end;

   //AL_28
   if sTipoOper = [Resgate] then
   begin
      If DMRendaFixa.qryBuscaSaldosItems.Locate('IDHISTRENFIX;IDITEMRENFIX',
                                              VarArrayOf([DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDHISTRENFIX').AsInteger, -23]), []) then

      fQtdBloqPenhora := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;

      //AL_37
      //AL_39
      if (dbrQtdeOperacao.Value > RendaFixa.DiminuiValores(DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat, fQtdBloqPenhora)) then
      begin
         MsgDlg('O investimento não possui saldo liberado para resgate em ' + #13 +
                 'função de Bloqueio para Penhora.','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dbrQtdeOperacao.CanFocus then
            dbrQtdeOperacao.SetFocus;
         Exit;
      end;
   end;

   iPlanilha := -1;
   iDocumento := -1;
   try  //Finally
      try  //Except
         if not dtmBaseDados.dbBaseDados.InTransaction then
             dtmBaseDados.dbBaseDados.StartTransaction;

         fraMensOper.Visible := True;
         if sTipoOper = [Aplicacao] then
            fraMensOper.Mes := 'Gravando Aplicação'
         else if sTipoOper = [Resgate] then
            fraMensOper.Mes := 'Gravando Resgate'
         else
            fraMensOper.Mes := 'Alterando Operação';


         if sTipoOper <> [Alteracao] then
         begin
            iIdOperRenFix  := LeUltRegistro(nil, 'OPERRENFIX');
            iIdHistRenFix  := LeUltRegistro(nil, 'HISTRENFIX');
            qryIDOPERRENFIX.AsInteger := iIdOperRenFix;
            qryIDPLANPREVCTBPATR.AsInteger := iPlanPrevCtbPatro;
            qryMOECODIGO.AsInteger := CtrlPInv.MoeCodigo;
            qryFLGOPERIMPLANT.Clear;

            if sTipoOper = [Aplicacao] then
               qryIDOPERRENFIXAPLIC.AsInteger := iIdOperRenFix
            else
            begin
               qryIDOPERRENFIXAPLIC.AsInteger := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
               if qryOBSERVACAO.AsString = '' then
                  qryOBSERVACAO.AsString := sObs
               else
                  qryOBSERVACAO.AsString := qryOBSERVACAO.AsString + #13 + sObs;
            end;
         end;

         qry.Post;
         qry.ApplyUpdates;
         qry.CommitUpdates;

         if sTipoOper = [Alteracao] then
         begin
            // AL_3
            dDataReproc := dbdDataOperacao.DateTime;
            iOperAplic  := qryIDOPERRENFIX.AsInteger;

            qryAltOpe := TwwQuery.Create(Application);
            qryAltOpe.DatabaseName := 'BaseDados';

            qryAltOpe.Sql.Clear;
            qryAltOpe.Sql.Add('UPDATE OPERRENFIXXCURVAS');
            qryAltOpe.Sql.Add('   SET VLRCURVA      = :PUEMISSAO'); //AL_4 - Passando com parâmetros pois estava dando erro.
            qryAltOpe.Sql.Add(' WHERE IDOPERRENFIX  = ' + qryIDOPERRENFIX.AsString);
            qryAltOpe.Sql.Add('   AND IDITEMRENFIX  = -3');
            qryAltOpe.ParamByName('PUEMISSAO').AsFloat := qryPUEMISSAO.AsFloat;
            qryAltOpe.ExecSql;

            qryAltOpe.Sql.Clear;
            qryAltOpe.Sql.Add('UPDATE HISTRENFIXXITENS');
            qryAltOpe.Sql.Add('  SET PUACUITEM = :PUEMISSAO,'); //AL_4 - Passando com parâmetros pois estava dando erro.
            qryAltOpe.Sql.Add('      PUITEM    = :PUEMISSAO' );
            qryAltOpe.Sql.Add('WHERE IDHISTRENFIX = (SELECT IDHISTRENFIX');
            qryAltOpe.Sql.Add('                        FROM HISTRENFIX');
            qryAltOpe.Sql.Add('                       WHERE IDOPERRENFIX = ' + qryIDOPERRENFIX.AsString);
            qryAltOpe.Sql.Add('                         AND TIPMOVHISRENFIX = ' + QuotedStr('OPE') + ')');
            qryAltOpe.Sql.Add('  AND IDITEMRENFIX = -3');
            qryAltOpe.ParamByName('PUEMISSAO').AsFloat := qryPUEMISSAO.AsFloat;
            qryAltOpe.ExecSql;
         end
         else
         begin
            iOper := qryIDOPERRENFIX.AsInteger;

            sHistorico := RendaFixa.MontaHistorico(qryTipoOperacaoNATUREZAOPERACAO.AsString,
                                                   qryTipoOperacaoSIGLATIPOOPER.AsString,
                                                   qryTipoOperacaoDESCTIPOOPERACAO.AsString,
                                                   qryInvestimentoDESCINVESTIMENTO.AsString);

            fraMensOper.Min := 0;
            fraMensOper.Max := DMRendaFixa.qrySelItemXOpeXInv.RecordCount;
            fraMensOper.Pos := 0;

            // Aplicação
            if qryTipoOperacaoNATUREZAOPERACAO.AsString = 'A' then
            begin
               // Capta Operação de Aplicação para marcar Reprocessamento
               iOperAplic := iIdOperRenFix;
               dDataReproc := dbdDataOperacao.DateTime;

               fraMensOper.Mes := 'Gravando Histórico da Aplicação';
               // Grava Histórico Aplicação
               if not RendaFixa.GravaHistRenfix(iIdHistRenFix,qryInvestimentoIDINVESTIMENTO.AsInteger,
                                iIdOperRenFix,iIdOperRenFix,qryCarteiraIDCARTEIRAINVEST.AsInteger,
                                qryTipoOperacaoIDTIPOOPERACAO.AsInteger, iPlanPrevCtbPatro,
                                -1,-1,dbdDataOperacao.Date,dbrQtdeOperacao.Value,
                                dbrQtdeOperacao.Value,dbrVlrOperacao.Value,
                                dbrVlrOperacao.Value,'OPE',qryTipoOperacaoNATUREZAOPERACAO.AsString,
                                sHistorico) then
               begin
                  Raise Exception.Create('Não foi Possível Incluir um Histórico para esta Operação');
               end;
               // Grava Items do trvCurvas
               nTreeNode := trvCurvas.Items.GetFirstNode;
               while nTreeNode <> nil do
               begin
                  if pItem(nTreeNode.Data).IDItem <> 0 then
                  begin
                     fraMensOper.Mes := 'Gravando ' + nTreeNode.Text;
                     //AL_27
                     if not RendaFixa.GravaOperRenFixXCurvas(iOper,
                                      pItem(nTreeNode.Data).IDCurva,
                                      pItem(nTreeNode.Data).IDItem,
                                      pItem(nTreeNode.Data).IDMoeda,
                                      pItem(nTreeNode.Data).VlrCurva,
                                      pItem(nTreeNode.Data).PercCurva) then
                        Raise Exception.Create('Não foi possível gravar um Item da operação');

                     if pItem(nTreeNode.Data).TipoItem = 'M' then
                     // PU de Correcao
                     begin
                     //AL_9
                     if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,pItem(nTreeNode.Data).IDCurva,
                                      pItem(nTreeNode.Data).IDItem,
                                      pItem(nTreeNode.Data).IDRegra,
                                      dbePUEmissao.Value {PUItem},
                                      dbePUEmissao.Value {PUAcuItem},
                                      dbePUEmissao.Value,
                                      dbePUEmissao.Value) then
                        Raise Exception.Create('Não foi possível gravar um Item de Histórico da operação');
                     end
                     else if pItem(nTreeNode.Data).TipoItem = 'V' then
                     // Tipo Valor
                     begin
                     //AL_9
                     if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,pItem(nTreeNode.Data).IDCurva,
                                      pItem(nTreeNode.Data).IDItem,
                                      pItem(nTreeNode.Data).IDRegra,
                                      pItem(nTreeNode.Data).VlrCurva,
                                      pItem(nTreeNode.Data).VlrCurva,
                                      pItem(nTreeNode.Data).VlrCurva,
                                      pItem(nTreeNode.Data).VlrCurva) then
                        Raise Exception.Create('Não foi possível gravar um Item de Histórico da operação');
                     end
                     else
                     // Demais itens
                     begin
                     //AL_9
                     if not RendaFixa.GravaHistRenFixXItens(iIdHistRenFix,pItem(nTreeNode.Data).IDCurva,
                                      pItem(nTreeNode.Data).IDItem,
                                      pItem(nTreeNode.Data).IDRegra,
                                      0 {PUItem},
                                      0 {PUAcuItem},
                                      0,
                                      0) then
                        Raise Exception.Create('Não foi possível gravar um Item de Histórico da operação');
                     end;

                     //AL_27

                     iIdForCli := OperComum.BuscaForCli(1,
                                                        qryContraParteIDPESSOA.AsInteger,
                                                        qryTipoOperacaoIDTIPOOPERACAO.AsInteger,
                                                        CtrlPInv.IdTipoClienteEMI);

                     fraMensOper.Mes := 'Contabilizando ' + nTreeNode.Text;
                     // Contabiliza itens
                     //AL_42 - Correção na descrição do item a ser contabilizado
                     RendaFixa.IntegraContabCapCar(iIdHistRenFix,
                                                   qryInvestimentoIDINVESTIMENTO.AsInteger,
                                                   qryTipoOperacaoIDTIPOOPERACAO.AsInteger,
                                                   qryCarteiraIDCARTEIRAINVEST.AsInteger,
                                                   qryInvestimentoIDCLASSETIT.AsInteger,
                                                   pItem(nTreeNode.Data).IDItem,
                                                   qryTipoOperacaoFLGGERACONTAB.AsInteger,
                                                   qryTipoOperacaoFLGGERACAPCAR.AsInteger,
                                                   qryContraParteIDPESSOA.AsInteger,
                                                   qryTipoOperacaoCODTIPDOC.AsInteger,
                                                   iPlanPrevCtbPatro,
                                                   pItem(nTreeNode.Data).FLGContabil,
                                                   qryInvestimentoDESCINVESTIMENTO.AsString,
                                                   sHistorico + ' ' + nTreeNode.Text,
                                                   pItem(nTreeNode.Data).VlrCurva,
                                                   dbreEmolumentos.Value,
                                                   dbreCorretagem.Value,
                                                   dbdDataOperacao.Date,
                                                   dbdDataOperacao.Date,
                                                   //AL_18
                                                   dtLiquidacao.Date,
                                                   iPlanilha,iDocumento,-1,
                                                   'Aplicacao',
                                                   pItem(nTreeNode.Data).IDCurva,
                                                   OperComum.IIF(dbdDataOperacao.DateTime >= CtrlPInv.DtMudaCPMF, 1, 0),true);//Thiago Passos SOL 123324 Kintana 615338 19/08/2009
                     fraMensOper.Incrementa;
                  end;
                  nTreeNode := nTreeNode.GetNext;
               end;
               //AL_18
               //AL_27
               GravaItemsNegativos(iOper,dbdDataOperacao.Date, dtLiquidacao.Date, 'A',
                                   sHistorico,iPlanilha,iDocumento,iIdHistRenFix, 'Aplicacao', -1);
            end
            else
            // Grava Resgate
            begin
               // Capta Operação de Aplicação para marcar Reprocessamento
               iOperAplic := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger;
               dDataReproc := DMRendaFixa.qryBuscaSaldosHist.FieldByName('DATAHISTRENFIX').AsDateTime;

               // Grava Items do trvCurvas
               nTreeNode := trvCurvas.Items.GetFirstNode;
               while nTreeNode <> nil do
               begin
                  if pItem(nTreeNode.Data).IDItem <> 0 then
                  begin
                     fraMensOper.Mes := 'Gravando ' + nTreeNode.Text;
                     if not RendaFixa.GravaOperRenFixXCurvas(iOper,
                                      pItem(nTreeNode.Data).IDCurva,
                                      pItem(nTreeNode.Data).IDItem,
                                      pItem(nTreeNode.Data).IDMoeda,
                                      pItem(nTreeNode.Data).VlrCurva,
                                      pItem(nTreeNode.Data).PercCurva) then
                        Raise Exception.Create('Erro ao Atualizar um Item da Operação');
                     fraMensOper.Incrementa;
                  end;
                  nTreeNode := nTreeNode.GetNext;
               end;

               //al_18
               //AL_27
               GravaItemsNegativos(iOper,dbdDataOperacao.Date, dtLiquidacao.Date, 'D',
                                   sHistorico,iPlanilha,iDocumento, -1,'',-1);

               // Faz o Lançamento dos Registros de Historico e Items de Histórico
               iIdForCli := OperComum.BuscaForCli(1,
                                                  qryIDFORCLI.AsInteger,
                                                  qryIDTIPOOPERACAO.AsInteger,
                                                  CtrlPInv.IdTipoClienteEMI);

               //AL_2
               //AL_11
               if not RendaFixa.LancaHistResgateRenFix(iOper,
                                                       qryTipoOperacaoFLGGERACONTAB.AsInteger,
                                                       qryTipoOperacaoFLGGERACAPCAR.AsInteger,
                                                       qryTipoOperacaoCODTIPDOC.AsInteger,
                                                       iIdHistRenFix,
                                                       qryIDFORCLI.AsInteger,
                                                       qryTipoOperacaoDESCTIPOOPERACAO.AsString,
                                                       sHistorico,
                                                       dbdDataOperacao.Date,
                                                       dDataAniv,
                                                       //AL_18
                                                       dtLiquidacao.Date,
                                                       dbreEmolumentos.Value,
                                                       dbreCorretagem.Value,
                                                       dbrVlrOperacao.Value,
                                                       iPlanilha,iDocumento,
                                                       fPUAtu,(fLucro + fPreju), -1, fraMensOper,
                                                       sFlgRecalc,
                                                       OperComum.IIF(DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAOPERACAOORIG').AsDateTime >= CtrlPInv.DtMudaCPMF,1, 0)) then
                  Raise Exception.Create('Ocorreu um erro no Lançamento dos Históricos.');

               if CtrlPInv.DataUltFechRF > dbdDataOperacao.DateTime then
               begin
                  // Deletar Históricos e Cadastro de Operações
                  //AL_29
                  //AL_42
                  if not RendaFixa.ExcluiHistRenFix(dbdDataOperacao.DateTime, False, -1,
                                                    DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger, -1,
                                                    qryInvestimentoIDINVESTIMENTO.AsInteger,
                                                    False,False, fraMensOper,False) then
//                                                    False,False,nil,nil,fraMensOper,False) then
                     Raise Exception.Create('Não foi possível excluir Movimentação Posterior');
               end;

            end;

            fraMensOper.Mes := 'Atualizando Planilhas Contábeis e Documentos Financeiros';
            // Verifica se foi gerado contabilização E Atualiza o HistRenFix
            //AL_31
            if ((CtrlPInv.IntFinContabRF = 'S') and (CtrlPInv.FlgImplantaRF = 'N')) then
            begin
               //AL_40
               if CtrlInvContab.Documento.DocumentoPendente then
                  iDocumento := RendaFixa.FinalizaCapCar;

               if iPlanilha > -1 then
               begin
                  if not RendaFixa.GravaPlanDoc('OPE', iOper, iIdHistRenFix,
                                                iPlanilha, iDocumento, sMens, False) then
                     Raise Exception.Create(sMens);
               end
               //AL_8
               else if iPlanilha = -1 then
                  //AL_34
                  Raise Exception.Create('A Operação não foi Contabilizada');
            end;
         end;

         if CtrlPInv.DataUltFechRF > dbdDataOperacao.DateTime then
         begin
            // Não volta a data do sistema - Marca o Título para ser Reprocessado
            if RendaFixa.MarcaInvRep(dDataReproc, qryInvestimentoIDINVESTIMENTO.AsInteger,
                                         iOperAplic, iPlanPrevCtbPatro) = -1 then
               Raise Exception.Create('Não foi Possível Marcar este Título para Reprocessamento.' + #13 +
                                      'o Título ' + DMRendaFixa.qryBuscaSaldosHist.FieldByName('DESCINVESTIMENTO').AsString +
                                      ' deve ser Reprocessado desde o Dia ' + DateToStr(dDataReproc));
         end;
         // AL_12 - Ini
         // Inclui o Primeiro Histórico de Vencimento da Aplicação
         //AL_21
         RendaFixa.IncPriHistVenc(iOperAplic, 0,fraMensOper);
         fraMensOper.Mes := 'Operação concluida com sucesso';
         fraMensOper.Pos := fraMensOper.Max;
         DtmBaseDados.dbBaseDados.Commit;
         MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema',mtConfirmation,[mbOk],0);
         // AL_12 - Fim
      except
         on E:Exception do
         begin
            fraMensOper.Pos := 0;
            fraMensOper.Max := 4;

            // AL_12
            if DtmBaseDados.dbBaseDados.InTransaction then
               DtmBaseDados.dbBaseDados.Rollback;

            // Deleta registros quando acontece erro onde diferente de Alteração.
            if sTipoOper <> [Alteracao] then
            begin
               fraMensOper.Mes := 'Excluindo Itens de Histórico';
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add('DELETE FROM HISTRENFIXXITENS ' +
                              'WHERE IDHISTRENFIX = ' + IntToStr(iIdHistRenFix));
               qryAux.Prepare;
               qryAux.ExecSQL;
               fraMensOper.Incrementa;

               fraMensOper.Mes := 'Excluindo Histórico';
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add('DELETE FROM HISTRENFIX ' +
                              'WHERE IDHISTRENFIX = ' + IntToStr(iIdHistRenFix));
               qryAux.Prepare;
               qryAux.ExecSQL;
               fraMensOper.Incrementa;

               fraMensOper.Mes := 'Excluindo Itens de Operação';
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add('DELETE FROM OPERRENFIXXCURVAS ' +
                              'WHERE IDOPERRENFIX = ' + IntToStr(iOper));
               qryAux.Prepare;
               qryAux.ExecSQL;
               fraMensOper.Incrementa;

               fraMensOper.Mes := 'Excluindo Operação';
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add('DELETE FROM OPERRENFIX ' +
                              'WHERE IDOPERRENFIX = ' + IntToStr(iOper));
               qryAux.Prepare;
               qryAux.ExecSQL;
               fraMensOper.Incrementa;
            end;

            MsgDlg('Não foi Possível Efetuar Esta Operação de Renda Fixa. ' + #13 +
                    E.Message,'Mensagem do Sistema',mtError,[mbOk],0);
            fraMensOper.Apaga;
         end;
      end;
   finally
      // AL_12
      fraMensOper.Apaga;
      qryAltOpe.Free;
   end;

   pgMestre.ActivePage := tbCombos;
   bbtnCancelar.Click;
   CmeCadastro.AtualizaBotoes(Self);
   StatusTrvCurvas(False,True);
   StatusConsulta;
   //AL_28
   OperComum.LimpaParametros(qryTipoOperacao);
   qryTipoOperacao.ParamByName('IDTIPOPENHORA').AsInteger := 0;
   qryTipoOperacao.Open;

   dbdDtaEmissao.Enabled := True;
   dbePUEmissao.Enabled := True;
   fraMensOper.Apaga;
end;

procedure TfrmCadOperRenFix.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   // AL_1 - Controle do processo de abertura
   // Pode não retornar em insersão, se o sistema estiver em abertura
   if qry.State = dsInsert then
   begin
      // Valores default
      chkFlgNegociacao.Checked := True;
      if qryFLGNEGOCIACAO.isNull then qryFLGNEGOCIACAO.AsString := 'S';
      chkFlgCartHipo.Checked := False;
      pnlQtdHipo.Visible := False;
      if qryFLGCARTHIPO.isNull then qryFLGCARTHIPO.AsString := 'N';

      sTipoOper := [Aplicacao];

      OperComum.LimpaParametros(qryTipoOperacao);
      qryTipoOperacao.ParamByName('NATUREZAOPERACAO').AsString := 'A';
      qryTipoOperacao.ParamByName('IDTIPOPENHORA').AsInteger := 0;
      qryTipoOperacao.Open;

      qryIDTIPOOPERACAO.AsInteger := qryTipoOperacaoIDTIPOOPERACAO.AsInteger;
      dblkOperacao.LookupValue := IntToStr(qryTipoOperacaoIDTIPOOPERACAO.AsInteger);
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT DESCTIPOOPERACAO FROM TIPOOPERACAO WHERE IDTIPOOPERACAO = ' + IntToStr(qryTipoOperacaoIDTIPOOPERACAO.AsInteger));
      qryAux.Open;
      dblkOperacao.Text := qryAux.FieldByName('DESCTIPOOPERACAO').AsString;
      qryAux.Close;

      qryIDCUSTODIANTE.AsInteger := CtrlPInv.IdCustoDiaRenFix;
      dblkCustodiante.LookupValue := IntToStr(CtrlPInv.IdCustoDiaRenFix);
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT SGLCUSTODIANTE FROM CUSTODIANTE WHERE IDCUSTODIANTE = ' + IntToStr(CtrlPInv.IdCustoDiaRenFix));
      qryAux.Open;
      dblkCustodiante.Text := qryAux.FieldByName('SGLCUSTODIANTE').AsString;
      qryAux.Close;

      qryIDUSUARIO.AsInteger := CtrlPInv.IdAutorizaOrdem;
      dblkAutorizacao.LookupValue := IntToStr(CtrlPInv.IdAutorizaOrdem);
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT NOMEUSUARIO FROM AUTORIZAOPERACAO WHERE IDUSUARIO = ' + IntToStr(CtrlPInv.IdAutorizaOrdem));
      qryAux.Open;
      dblkAutorizacao.Text := qryAux.FieldByName('NOMEUSUARIO').AsString;
      qryAux.Close;

      if CtrlPInv.IdContraparteRF <> 0 then
      begin
         qryIDFORCLI.AsInteger := CtrlPInv.IdContraparteRF;
         dblkForCli.LookupValue := IntToStr(CtrlPInv.IdContraparteRF);
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT DISTINCT PE.IDPESSOA, PE.NOME FROM PESSOA PE                       '+
                        'WHERE                                                                     '+
                        '   PE.IDPESSOA IN  (SELECT EM.IDEMISSOR FROM EMISSOR EM                   '+
                        '                    UNION                                                 '+
                        '                    SELECT CU.IDCUSTODIANTE FROM CUSTODIANTE CU           '+
                        '                    UNION                                                 '+
                        '                    SELECT BV.IDBOLSAVALORES FROM BOLSAVALORES BV         '+
                        '                    UNION                                                 '+
                        '                    SELECT CT.IDCORRETVALORES FROM CORRETVALORES CT ) AND '+
                        '( ( ('+IntToStr(CtrlPInv.IdContraparteRF)+' IS NOT NULL) AND (PE.IDPESSOA  = '+IntToStr(CtrlPInv.IdContraparteRF)+') ) OR ('+IntToStr(CtrlPInv.IdContraparteRF)+' IS NULL) ) '+
                        'ORDER BY PE.NOME');
         qryAux.Open;
         dblkForCli.Text := qryAux.FieldByName('NOME').AsString;
         OperComum.PosicionaWWLookUpQry(dblkForCli, qryContraParte);
      end;

      trvCurvas.Items.Clear;
      bConsulta := False;
      StatusOperacao(True);
      StatusTrvCurvas(False);
      bbtnImprimir.Enabled := False;
      qryDATAOPERACAO.AsDateTime := CtrlPInv.DataUltFechRF;
      //AL_20
      //AL_18 Ini
      qryDATALIQUIDACAO.AsDateTime :=  qryDATAOPERACAO.AsDateTime + qryTipoOperacaoVENCIMENTO.AsFloat;
      dtLiquidacao.Text := qryDATALIQUIDACAO.AsString;
      //AL_18 Fim
            
      if dblkEmissor.CanFocus then
         dblkEmissor.SetFocus;
   end;
end;

procedure TfrmCadOperRenFix.dblkEmissorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
     // AL_12 - Ini
     OperComum.LimpaParametros(qryInvestimento);
     if Trim(dblkEmissor.Text) <> '' then
        qryInvestimento.ParamByName('IDEMISSOR').AsString := dblkEmissor.LookupValue;
     qryInvestimento.Open;
     // AL_12 - Fim
  end;
end;

procedure TfrmCadOperRenFix.dblkInvestimentoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
     EncheTreeView;
     HabilitaComponentes;
     // AL_14 - Ini
     if not qryInvestimentoDATAEMISSAO.IsNull then
     begin
        qryDATAEMISSAO.AsDateTime := qryInvestimentoDATAEMISSAO.AsDateTime;
        dbdDtaEmissao.Text := qryInvestimentoDATAEMISSAO.AsString;
     end;
     if not qryInvestimentoPUEMISSAO.IsNull then
     begin
        qryPUEMISSAO.AsFloat := qryInvestimentoPUEMISSAO.AsFloat;
        dbePUEmissao.Text := qryInvestimentoPUEMISSAO.AsString;
        dbePUEmissao.Value := qryInvestimentoPUEMISSAO.AsFloat;
     end;
     // AL_14 - Fim
  end;
end;

procedure TfrmCadOperRenFix.FormShow(Sender: TObject);
begin
  inherited;
  qryEmissor.Open;
  qryInvestimento.Open;

  OperComum.LimpaParametros(qryTipoOperacao);
  qryTipoOperacao.ParamByName('IDTIPOPENHORA').AsInteger := 0;
  qryTipoOperacao.Open;

  qryCarteira.Open;
  qryContraParte.Open;
  qryCustodiante.Open;
  MontaMoeda;
  qryAutorizacao.Open;
  trvCurvas.Items.Clear;
  StatusConsulta;
  msBuscaSaldos.Filtro.Add('HISTRENFIX.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro));
  MontaSelect.Filtro.Add('OPERRENFIX.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro));
  Sel(-1);
  // AL_12
  tbsHistorico.TabVisible := False;
end;

procedure TfrmCadOperRenFix.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryEmissor.Close;
  qryInvestimento.Close;
  qryTipoOperacao.Close;
  qryCarteira.Close;
  qryContraParte.Close;
  qryCustodiante.Close;
  qryMoeda.Close;
  qryAutorizacao.Close;
end;

procedure TfrmCadOperRenFix.trvCurvasChange(Sender: TObject; Node: TTreeNode);
var bVisible: Boolean;
begin
   inherited;
   bVisible := True;
   lblPercentual.Visible := True;
   dbrPercentual.Visible := True;

   if pItem(trvCurvas.Selected.Data).IDItem = 0 then
   begin
      pnlCurvasDet.Enabled := False;
      bbtnOkDet.Enabled := False;
      StatusTrvCurvas(False, False, False);
   end
   else
   begin
      if pItem(trvCurvas.Selected.Data).FLGMoeda = 'Y' then
      begin
         pnlMoeda.Visible := True;
         pnlMoeda.Enabled := True;
         chkMoeda.Visible := True;
         pnlVlrTv.Visible := False;
         pnlVlrTv.Enabled := False;
      end else begin
         pnlMoeda.Visible := False;
         pnlMoeda.Enabled := False;
         chkMoeda.Visible := False;
         pnlVlrTv.Visible := True;
         pnlVlrTv.Enabled := True;
      end;

      if pItem(trvCurvas.Selected.Data).TipoItem = 'T' then // Taxa de Juro
      begin
         lblPercItem.Visible := True;
         lblVlrItem.Caption := 'Taxa';
         //AL_34
         dbrValor.DecDigits := 9;
      end
      else if (pItem(trvCurvas.Selected.Data).TipoItem = 'V') or
              (pItem(trvCurvas.Selected.Data).TipoItem = 'N') then // Valor ou Numero
      begin
         lblPercItem.Visible := False;
         lblVlrItem.Caption := 'Valor';
         //AL_34
         dbrValor.DecDigits := 2;
         // Itens Positivos e Valor
         if pItem(trvCurvas.Selected.Data).IDItem > 0 then
         begin
            lblPercentual.Visible := False;
            dbrPercentual.Visible := False;
         end;
      end
      else if pItem(trvCurvas.Selected.Data).TipoItem = 'P' then // PU
      begin
         lblPercItem.Visible := False;
         lblVlrItem.Caption := 'PU';
         //AL_34
         dbrValor.DecDigits := 9;
      end
      else if pItem(trvCurvas.Selected.Data).TipoItem = 'M' then // Moeda
      begin
         lblPercItem.Visible := True;
         lblVlrItem.Caption := 'Moeda';
      end;

      dblkMoeda.LookupValue := IntToStr(pItem(trvCurvas.Selected.Data).IDMoeda);
      dbrValor.Value := pItem(trvCurvas.Selected.Data).VlrCurva;
      dbrPercentual.Value := pItem(trvCurvas.Selected.Data).PercCurva;

      //AL_36 - Se o Item não vai ser exibido, não precisa testar.
      if ExibeItem(pItem(trvCurvas.Selected.Data).IDCurva,
                   pItem(trvCurvas.Selected.Data).IDItem,
                   Node.Text) = 'N' then
         bVisible := False
      else
      begin
         if bConsulta then
         begin
            pnlCurvasDet.Enabled := False;
            bbtnOkDet.Enabled := False;
         end
         else
         begin
            //Itens de Pagto de Juros, Incorp. de Juros e Amortizacao de Principal
            if (pItem(trvCurvas.Selected.Data).IDItem = CtrlPInv.IdOperaMortPrinc) or
               (pItem(trvCurvas.Selected.Data).IDItem = CtrlPInv.IdOperIncJuros) or
               (pItem(trvCurvas.Selected.Data).IDItem = CtrlPInv.IdOperPagtoJuros) or
               (pItem(trvCurvas.Selected.Data).TipoItem = 'N') then
            begin
               pnlCurvasDet.Enabled  := False;
               bbtnOkDet.Enabled     := False;
               dbrPercentual.Enabled := False;
               dbrValor.Enabled      := False;
               bVisible              := False;
            end
            else if (pItem(trvCurvas.Selected.Data).FLGCOTRENFIX = 'Y') and  // Moeda na Tabela de COTACAORENFIX
                    (pItem(trvCurvas.Selected.Data).TipoItem = 'M') then // Moeda
            begin
               pnlCurvasDet.Enabled  := False;
               bbtnOkDet.Enabled     := False;
               dbrPercentual.Enabled := False;
               dbrValor.Enabled      := False;
            end
            else
            begin
               pnlCurvasDet.Enabled  := True;
               bbtnOkDet.Enabled     := True;
               dbrPercentual.Enabled := True;
               dbrValor.Enabled      := True;
            end;
         end;

         //Itens de Pagto de Juros, Incorp. de Juros e Amortizacao de Principal
         if (pItem(trvCurvas.Selected.Data).IDItem = CtrlPInv.IdOperaMortPrinc) or
            (pItem(trvCurvas.Selected.Data).IDItem = CtrlPInv.IdOperIncJuros) or
            (pItem(trvCurvas.Selected.Data).IDItem = CtrlPInv.IdOperPagtoJuros) then
         begin
             pnlCurvasDet.Enabled := False;
             bVisible             := False;
         end
         else if ((pItem(trvCurvas.Selected.Data).FLGCOTRENFIX = 'Y') and  // Moeda na Tabela de COTACAORENFIX
                 (pItem(trvCurvas.Selected.Data).TipoItem = 'M')) or       // Moeda
                 (pItem(trvCurvas.Selected.Data).TipoItem = 'P') then     // PU - Ágio
         begin
             pnlCurvasDet.Enabled := False;
             bVisible             := False;
         end
         else
             pnlCurvasDet.Enabled := True;
      end;

      StatusTrvCurvas(bVisible, False, False);
   end;
end;

procedure TfrmCadOperRenFix.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   pgMestre.ActivePage := tbCombos;
   Sel(-1);
   CmeCadastro.AtualizaBotoes(Self);
   StatusConsulta;
   //AL_28
   OperComum.LimpaParametros(qryTipoOperacao);
   qryTipoOperacao.ParamByName('IDTIPOPENHORA').AsInteger := 0;
   qryTipoOperacao.Open;

   dbdDtaEmissao.Enabled := True;
   dbePUEmissao.Enabled := True;
   HabilitaComponentes;
end;

procedure TfrmCadOperRenFix.sbtnProcurarClick(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
      dblkEmissor.LookupValue := MontaSelect.ValoresChave[1];
      pgMestre.ActivePage := tbCombos;
      StatusTrvCurvas(False,True);
      HabilitaComponentes;
      StatusConsulta;
      if qry.IsEmpty then
      begin
         sbtnApagar.Enabled := False;
         sbtnAlterar.Enabled := False;
      end
      else
      begin
         sbtnApagar.Enabled := True;

         //AL_28
         OperComum.LimpaParametros(qryTipoOperacao);
         qryTipoOperacao.ParamByName('IDTIPOPENHORA').AsInteger := 1;
         qryTipoOperacao.Open;

         if MontaSelect.ValoresChave[2] <> 'D' then
             sbtnAlterar.Enabled := True
         else
             sbtnAlterar.Enabled := False;
      end;

      bbtnImprimir.Enabled := True;
   end;

end;

procedure TfrmCadOperRenFix.sbtnBuscaSaldosClick(Sender: TObject);
var
   // AL_11
   dDataCPMF: TDateTime;
   //AL_25
   fVlrPagtoJuros, fVlrResgPoup, fQtdResgPoup, fSaldoInutil: Double;
   i: Byte;
begin
   dDataAniv := Date;

   msBuscaSaldos.Executar;
   if msBuscaSaldos.RetornouValor then
   begin

      // AL_1 - Controle do processo de abertura
      // Não faz se estiver em abertura
      if RendaFixa.VerEmAbertura then
      begin
         sbtnBuscaSaldos.Down := False;
         Exit;
      end;

      // Só permite resgatar títulos negociaveis.
      if BuscaFlgNegociavel(StrToInt(msBuscaSaldos.ValoresChave[11])) = 'N' then
      begin
         if MsgDlg('O título está marcado como Não Negociavel! Deseja continuar ?','Mensagem do Sistema ',
                   MtWarning,[MbYes, MbNo],0) = MrNo Then
         begin
            sbtnBuscaSaldos.Down := False;
            Exit;
         end else begin
            flgNegociacao := 'N';
            sObs := 'Título resgatado por ' + Sistema.NomeUsuario;
         end;
      end
      else
         flgNegociacao := 'S';

      // Não permite resgate na data da aplicação
      if msBuscaSaldos.ValoresChave[14] = msBuscaSaldos.ValoresChave[5] then
      begin
         MsgDlg('Não é possível resgate na mesma data da aplicação.'+#13+
                'Execute a exclusão da aplicação!','Mensagem do Sistema',mtWarning,[mbOk],0);
         sbtnBuscaSaldos.Down := False;
         Exit;
      end;

      // Não permite resgate de títulos marcados para reprocessamento
      if RendaFixa.MarcadoReproc(StrToInt(msBuscaSaldos.ValoresChave[1]),
                                 StrToInt(msBuscaSaldos.ValoresChave[11])) then
      begin
         MsgDlg('Não é possível Resgatar um Investimento Marcado para Reprocessamento.'+#13+
                'Execute o Reprocessamento do Investimento!','Mensagem do Sistema',mtWarning,[mbOk],0);
         sbtnBuscaSaldos.Down := False;
         Exit;
      end;

      //AL_23 - Não permitir se estiver faldando histórico das operacoes
      if not RendaFixa.BuscaHistOperNoDia(StrToDate(msBuscaSaldos.ValoresChave[5]),
                                          StrToInt(msBuscaSaldos.ValoresChave[1]),
                                          StrToInt(msBuscaSaldos.ValoresChave[11])) then
      begin
         MsgDlg('Existem Operações deste Investimento sem Histórico no dia.'+#13+
                'Execute o Reprocessamento do Investimento!','Mensagem do Sistema',mtWarning,[mbOk],0);
         sbtnBuscaSaldos.Down := False;
         Exit;
      end;

      fVlrPagtoJuros := 0;
      sTipoOper := [Resgate];

      // Simula o Padrão
      CmeCadastro.Cancel(Self);
      CmeCadastro.Operacao := opInserir;
      CmeCadastro.RepetirInsert := True;
      CmeCadastro.Insert(Self);
      CmeCadastro.AtualizaBotoes(Self);
      sbtnInserir.Down := True;

      bConsulta := True;
      //AL_40 - Para acertar após uma alteração
      StatusOperacao(True);
      StatusOperacao(False);

      qryFLGNEGOCIACAO.AsString := flgNegociacao;

      if (msBuscaSaldos.ValoresChave[13] = IntToStr(CtrlPInv.IdClassePoup)) or
         (msBuscaSaldos.ValoresChave[13] = IntToStr(CtrlPInv.IdClassPoupBloq)) then
      begin
         // Busca o Último Aniversário desta Poupança
         dDataAniv := RendaFixa.BuscaUltimoAnivPoupanca(StrToDate(msBuscaSaldos.ValoresChave[14]),
                                                        StrToInt(msBuscaSaldos.ValoresChave[15]),
                                                        StrToDate(msBuscaSaldos.ValoresChave[5]),
                                                        True);

         //AL_11
         //Busca Saldos da Poupança no Dia do Último Saldo
         //AL_29
         RendaFixa.BuscaSaldos(StrToDate(msBuscaSaldos.ValoresChave[5]),
                               -1,
                               StrToInt(msBuscaSaldos.ValoresChave[1]),
                               StrToInt(msBuscaSaldos.ValoresChave[11]));

         dDataAniv := RendaFixa.BuscaUltimoAnivPoupanca(StrToDate(msBuscaSaldos.ValoresChave[14]),
                                                        StrToInt(msBuscaSaldos.ValoresChave[15]),
                                                        StrToDate(msBuscaSaldos.ValoresChave[5]),
                                                        True);

         //AL_33
         //AL_37
         if  not DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').IsNull then
            qryIDOPERRENFIXORIG.AsInteger := DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').AsInteger;

         // Busca Saldos da Poupança no Dia do Último Aniversário
         //AL_33 - A data de aniv tem que ser buscada após o reposicionamento da BuscaSaldos
         //Se a dDataAniv for anterior a data da TRC, traz a data da TRC
         if (not DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').IsNull) and
            (dDataAniv < StrToDate(msBuscaSaldos.ValoresChave[14])) then
         begin
            RendaFixa.BuscaSaldosPoup(StrToDate(msBuscaSaldos.ValoresChave[14]),
                                      StrToInt(msBuscaSaldos.ValoresChave[1]),
                                      StrToInt(msBuscaSaldos.ValoresChave[11]),
                                      CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq);
         end
         else
         begin
            RendaFixa.BuscaSaldosPoup(dDataAniv,
                                      StrToInt(msBuscaSaldos.ValoresChave[1]),
                                      StrToInt(msBuscaSaldos.ValoresChave[11]),
                                      CtrlPInv.IdClassePoup, CtrlPInv.IdClassPoupBloq);
         end;
      end
      else
      begin
         //Traz os Saldos de: - Data, Investimento, Aplicação Selecionados
         //AL_29
         RendaFixa.BuscaSaldos(StrToDate(msBuscaSaldos.ValoresChave[5]),
                               -1,
                               StrToInt(msBuscaSaldos.ValoresChave[1]),
                               StrToInt(msBuscaSaldos.ValoresChave[11]),
                               //AL_13
                               -1,1,True);
      end;

      if DMRendaFixa.qryBuscaSaldosHist.IsEmpty then
      begin
         MsgDlg('Esta Aplicação Não Possui Saldo para ser Resgatado','Mensagem do Sistema',mtWarning,[mbOk],0);
         sbtnBuscaSaldos.Down := False;
         bbtnCancelar.Click;
         Exit;
      end;

      // Identifica a Operação de Aplicação deste Resgate
      qryIDOPERRENFIXAPLIC.AsInteger := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger;

      // Seleciona o Emissor
      dblkEmissor.LookupValue := msBuscaSaldos.ValoresChave[0];
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT NOME FROM PESSOA WHERE IDPESSOA = ' + msBuscaSaldos.ValoresChave[0]);
      qryAux.Open;
      dblkEmissor.Text := qryAux.FieldByName('NOME').AsString;
      OperComum.PosicionaWWLookUpQry(dblkEmissor, qryEmissor);

      // Seleciona o Investimento
      qryIDINVESTIMENTO.AsInteger := StrToInt(msBuscaSaldos.ValoresChave[1]);
      dblkInvestimento.LookupValue := msBuscaSaldos.ValoresChave[1];
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT DESCINVESTIMENTO FROM INVESTIMENTO WHERE IDINVESTIMENTO = ' + msBuscaSaldos.ValoresChave[1]);
      qryAux.Open;
      dblkInvestimento.Text := qryAux.FieldByName('DESCINVESTIMENTO').AsString;
      OperComum.PosicionaWWLookUpQry(dblkInvestimento, qryInvestimento);

      // Seleciona o Autorizador de Ordens
      qryIDUSUARIO.AsInteger := CtrlPInv.IdAutorizaOrdem;
      dblkAutorizacao.LookupValue := IntToStr(CtrlPInv.IdAutorizaOrdem);
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT NOMEUSUARIO FROM AUTORIZAOPERACAO WHERE IDUSUARIO = ' + IntToStr(CtrlPInv.IdAutorizaOrdem));
      qryAux.Open;
      dblkAutorizacao.Text := qryAux.FieldByName('NOMEUSUARIO').AsString;
      qryAux.Close;
      OperComum.PosicionaWWLookUpQry(dblkAutorizacao, qryAutorizacao);

      // Seleciona o Tipo de Operação
      qryTipoOperacao.Close;
      qryTipoOperacao.ParamByName('NATUREZAOPERACAO').AsString := 'D';
      qryTipoOperacao.ParamByName('IDTIPOPENHORA').AsInteger := 0;
      qryTipoOperacao.Open;
      qryTipoOperacao.First;
      // AL_2
      dDataCPMF := CtrlPInv.DtMudaCPMF;
      if StrToDate(msBuscaSaldos.ValoresChave[14]) >= dDataCPMF  then
      begin
         if qryTipoOperacao.Locate('FLGCONTAINVEST', 1, []) then
         begin
            qryIDTIPOOPERACAO.AsInteger := qryTipoOperacaoIDTIPOOPERACAO.AsInteger;
            dblkOperacao.LookupValue    := qryTipoOperacaoIDTIPOOPERACAO.AsString;
            dblkOperacao.Text           := qryTipoOperacaoDESCTIPOOPERACAO.AsString;
            dblkOperacao.PerformSearch;
         end;
      end
      else
      begin
         qryIDTIPOOPERACAO.AsInteger := qryTipoOperacaoIDTIPOOPERACAO.AsInteger;
         dblkOperacao.LookupValue    := qryTipoOperacaoIDTIPOOPERACAO.AsString;
         dblkOperacao.Text           := qryTipoOperacaoDESCTIPOOPERACAO.AsString;
      end;

      // Seleciona a Carteira
      qryIDCARTEIRAINVEST.AsInteger := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsInteger;
      dblkCarteira.LookupValue := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsString;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT DESCCARTINVEST FROM CARTEIRAINVEST WHERE IDCARTEIRAINVEST = ' +
                     DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDCARTEIRAINVEST').AsString );
      qryAux.Open;
      dblkCarteira.Text := qryAux.FieldByName('DESCCARTINVEST').AsString;
      OperComum.PosicionaWWLookUpQry(dblkCarteira, qryCarteira);

      // Seleciona a ContraParte
      qryIDFORCLI.AsInteger := DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsInteger;
      dblkForCli.LookupValue := DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsString;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT NOME FROM PESSOA WHERE IDPESSOA = ' + DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDFORCLI').AsString);
      qryAux.Open;
      dblkForCli.Text := qryAux.FieldByName('NOME').AsString;
      OperComum.PosicionaWWLookUpQry(dblkForCli, qryContraParte);

      // Seleciona o Custodiante
      qryIDCUSTODIANTE.AsInteger := DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDCUSTODIANTE').AsInteger;
      dblkCustodiante.LookupValue := DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDCUSTODIANTE').AsString;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT SGLCUSTODIANTE FROM CUSTODIANTE WHERE IDCUSTODIANTE = ' + DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDCUSTODIANTE').AsString );
      qryAux.Open;
      dblkCustodiante.Text := qryAux.FieldByName('SGLCUSTODIANTE').AsString;
      OperComum.PosicionaWWLookUpQry(dblkCustodiante, qryCustodiante);

      // Seleciona a Classe de Risco
      if StrToInt(msBuscaSaldos.ValoresChave[16]) <> 0 then
      begin
         qryIDCLASSRISCORENFIX.AsInteger := StrToInt(msBuscaSaldos.ValoresChave[16]);
         dblkClasseRisco.LookupValue := msBuscaSaldos.ValoresChave[16];
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT NOMECLASSRISCO FROM CLASSRISCORENFIX WHERE IDCLASSRISCORENFIX = ' + msBuscaSaldos.ValoresChave[16] );
         qryAux.Open;
         dblkClasseRisco.Text := qryAux.FieldByName('NOMECLASSRISCO').AsString;
         dblkClasseRisco.PerformSearch;
         ColoreComboRisco;
      end;

      // Seleciona se possui e a Quantidade na Carteira Hipotecária
      qryFLGCARTHIPO.AsString := msBuscaSaldos.ValoresChave[17];
      qryFLGCARTHIPO.AsString := msBuscaSaldos.ValoresChave[17];
      if msBuscaSaldos.ValoresChave[17] = 'S' then
      begin
         chkFlgCartHipo.Checked := True;
         pnlQtdHipo.Visible := True;
         qryQTDCARTHIPO.AsFloat := BuscaSldCartHipo(StrToInt(msBuscaSaldos.ValoresChave[11]));
         dbrQtdCartHipo.Value := BuscaSldCartHipo(StrToInt(msBuscaSaldos.ValoresChave[11]));
      end
      else
      begin
         chkFlgCartHipo.Checked := False;
         pnlQtdHipo.Visible := False;
         qryQTDCARTHIPO.AsFloat := 0;
         dbrQtdCartHipo.Value := 0;
      end;

      // Seleciona a data da operação
      if (msBuscaSaldos.ValoresChave[13] = IntToStr(CtrlPInv.IdClassePoup)) or
         (msBuscaSaldos.ValoresChave[13] = IntToStr(CtrlPInv.IdClassPoupBloq)) then
         qryDATAOPERACAO.AsDateTime := StrToDate(msBuscaSaldos.ValoresChave[5])
      else
         qryDATAOPERACAO.AsDateTime := DMRendaFixa.qryBuscaSaldosHist.FieldByName('DATAHISTRENFIX').AsDateTime;

      //AL_18 Ini
      qryDATALIQUIDACAO.AsDateTime :=  qryDATAOPERACAO.AsDateTime + qryTipoOperacaoVENCIMENTO.AsFloat;
      dtLiquidacao.Text := qryDATALIQUIDACAO.AsString;
      //AL_18 Fim

      if RendaFixa.CotaRenfix(StrToInt(msBuscaSaldos.ValoresChave[1]),
                               DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDCURVARENFIX').AsInteger) then
      begin
         dbdDataOperacao.Enabled := True;
         bCotRenFix := True;
      end
      else
      begin
         dbdDataOperacao.Enabled := False;
         bCotRenFix := False;
      end;

      // Seleciona a data de vencimento da operação
      qryVENCOPERACAO.AsDateTime := DMRendaFixa.qryBuscaSaldosOper.FieldByName('VENCOPERACAO').AsDateTime;
      dbdDtaVencimento.Enabled := False;

      // Inicio da seleção dos valores da operação
      fVlrPagtoJuros := BuscaPagtoJuros(msBuscaSaldos.ValoresChave[5],StrToInt(msBuscaSaldos.ValoresChave[11]),iPlanPrevCtbPatro);

      if (msBuscaSaldos.ValoresChave[13] = IntToStr(CtrlPInv.IdClassePoup)) or
         (msBuscaSaldos.ValoresChave[13] = IntToStr(CtrlPInv.IdClassPoupBloq)) then
      begin
         // Buscar o total dos resgates no período
         // AL_5
         // AL_6
         //AL_25
         //AL_33 - A data de aniv tem que ser buscada após o reposicionamento da BuscaSaldos
         //Se a dDataAniv for anterior a data da TRC, traz a data da TRC
         if (not DMRendaFixa.qryBuscaSaldosOper.FieldByName('IDOPERRENFIXORIG').IsNull) and
            (dDataAniv < StrToDate(msBuscaSaldos.ValoresChave[14])) then
         begin
            RendaFixa.BuscaTotResgPoup(StrToDate(msBuscaSaldos.ValoresChave[14]),
                                       qryDATAOPERACAO.AsDateTime,
                                       fVlrResgPoup, fQtdResgPoup, fSaldoInutil, fSaldoInutil,
                                       DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                       OperComum.IIF(dDataAniv = qryDATAOPERACAO.AsDateTime, 'ATU','OPE'),
                                       DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
         end
         else
         begin
            RendaFixa.BuscaTotResgPoup(dDataAniv, qryDATAOPERACAO.AsDateTime,
                                       fVlrResgPoup, fQtdResgPoup, fSaldoInutil, fSaldoInutil,
                                       DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger,
                                       OperComum.IIF(dDataAniv = qryDATAOPERACAO.AsDateTime, 'ATU','OPE'),
                                       DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
         end;

         //AL_11
         // Os saldos para Poupança são: Saldos no Último Aniversário menos os Resgates
         dbrVlrOperacao.Value  := DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('SALDOVLRHISTRENFI').AsFloat - fVlrResgPoup;
         dbrQtdeOperacao.Value := DMRendaFixa.qryBuscaSaldosHistPoup.FieldByName('SALDOQTDHISTRENFI').AsFloat - fQtdResgPoup;
         //AL_37
         if dbrQtdeOperacao.Value > DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat then
            dbrQtdeOperacao.Value := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat;
      end
      else
      begin
         dbrVlrOperacao.Value := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOVLRHISTRENFI').AsFloat;
         dbrQtdeOperacao.Value := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat;
      end;

      dbrVlrOperacao.Text := FloatToStr(dbrVlrOperacao.Value);
      lblSldVlr.Caption := FormatFloat('###,###,###,###,##0.00',dbrVlrOperacao.Value);

      lblSldQtd.Caption := FormatFloat('###,###,###,##0.########', dbrQtdeOperacao.Value);

      fPUAtu := dbrVlrOperacao.Value / dbrQtdeOperacao.Value;
      dbePuOperacao.Value := fPUAtu;
      dbePuOperacao.Text := FloatToStr(fPUAtu);

      qryDATAEMISSAO.AsDateTime := DMRendaFixa.qryBuscaSaldosOper.FieldByName('DATAEMISSAO').AsDateTime;
      dbdDtaEmissao.Enabled := False;

      dbePUEmissao.Value := DMRendaFixa.qryBuscaSaldosOper.FieldByName('PUEMISSAO').AsFloat;
      dbePUEmissao.Text := DMRendaFixa.qryBuscaSaldosOper.FieldByName('PUEMISSAO').AsString;

      // Preencher os Items
      EncheTreeView(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
      pnlCurvasDet.Enabled := False;
      bbtnOkDet.Enabled := False;

      MostraSaldos(True);
      HabilitaComponentes;

      // Pega Valores de itens fixos
      DMRendaFixa.qryBuscaSaldosItems.First;
      while not DMRendaFixa.qryBuscaSaldosItems.Eof do
      begin
         if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -1 then  // Valor do Principal Atual
            fPrincipal := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;
         if DMRendaFixa.qryBuscaSaldosItems.FieldByName('IDITEMRENFIX').AsInteger = -8 then  // Valor do IOF
            fIOF := DMRendaFixa.qryBuscaSaldosItems.FieldByName('PUACUITEM').AsFloat;
         DMRendaFixa.qryBuscaSaldosItems.Next;
      end;

      dbdDtaEmissao.Enabled := False;
      dbePUEmissao.Enabled := False;
      //AL_16 Ini
      dbrePuMercado.Enabled := False;
      chkFlgCartHipo.Enabled := False;
      dbdDtaLeilao.Enabled := False;
      pnlCurvasFundo.Enabled := False;
      //AL_16 Fim

      if dbrVlrOperacao.CanFocus then
         dbrVlrOperacao.SetFocus;

      qryAux.Close;
      qryAux.SQL.Clear;

   end;
   sbtnBuscaSaldos.Down := False;
   bbtnImprimir.Enabled := False;
end;

procedure TfrmCadOperRenFix.sbtnApagarClick(Sender: TObject);
var
   iOpe,iExercicio,iPeriodo,iEmpresa,iOperAplic: Integer;
   sIdHist,wMensContab: String;
   bExclui,bVoltaData,bResgate: Boolean;
   dDataReproc: TDateTime;
begin
//  inherited;

   try
      // AL_1 - Controle do processo de abertura
      // Não faz se estiver em Abertura
      if RendaFixa.VerEmAbertura then Exit;

      iOpe := qryIDOPERRENFIX.AsInteger;
      bExclui := False;
      bVoltaData := False;

      Try
         if (qryDATAOPERACAO.AsDateTime >= CtrlPInv.DataUltFechRF) or
            (qryTipoOperacaoNATUREZAOPERACAO.AsString = 'A') then
         begin
            if (MsgDlg('Deseja realmente excluir esta Operação?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
               bExclui := True
            else
               bExclui := False;
         end
         else
         begin
            if qryTipoOperacaoNATUREZAOPERACAO.AsString = 'D' then
            begin
               if (MsgDlg('O Sistema Reprocessará Automáticamente este Título a Partir do Dia ' + qryDATAOPERACAO.AsString + #13 +
                       'Deseja realmente excluir esta Operação?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
               begin
                  bExclui := True;
                  bVoltaData := True;
               end
               else
                  bExclui := False;
            end;
         end;

         if bExclui then
         begin
            // Testa se Periodo Contabil está Fechado para exclusao
            //AL_31
            if CtrlPInv.IntFinContabRF <> 'N' then
            begin
               // AL_10
               //AL_22
               if not CtrlInvContab.TestaPeriodo(DateToStr(qryDATAOPERACAO.AsDateTime),
                                                 1, -1,
                                                 qryInvestimentoIDCLASSETIT.AsInteger) then
                  Raise Exception.Create(CtrlInvContab.MessageInfo);
            end;

            // Testa se pode ser excluído do financeiro
            if not RendaFixa.TestaFinanceiro(qryDATAOPERACAO.AsDateTime,
                                             qryIDOPERRENFIX.AsInteger) then
               Exit;

            // Inicia o processo de exclusão
            fraMensOper.Mostra;
            Invalidate;
            Application.ProcessMessages;

            if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;

            // Exclui os somente os históricos das operações e atualizações posteriores
            if qryTipoOperacaoNATUREZAOPERACAO.AsString = 'D' then
            begin
               bResgate := True;
               dDataReproc := qryDATAOPERACAO.AsDateTime;
               iOperAplic := qryIDOPERRENFIXAPLIC.AsInteger;
               //AL_29
               //AL_41
               if not RendaFixa.ExcluiHistRenFix(qryDATAOPERACAO.AsDateTime,
                                                 True,-1,
                                                 qryIDOPERRENFIXAPLIC.AsInteger,
                                                 -1, -1, False, bResgate,
                                                 fraMensOper,
                                                 False) then
                  Abort;
            end
            else
            begin
               bResgate := False;
               dDataReproc := qryDATAOPERACAO.AsDateTime;
               iOperAplic := qryIDOPERRENFIXAPLIC.AsInteger;
               //AL_29
               //AL_41
               if not RendaFixa.ExcluiHistRenFix(qryDATAOPERACAO.AsDateTime,
                                                 True,-1,
                                                 qryIDOPERRENFIXAPLIC.AsInteger,
                                                 -1, -1, True, bResgate,
                                                 fraMensOper,
                                                 False) then
                  Abort;
            end;

            // Exclui a operação
            fraMensOper.Mostra;
            // AL_12
            fraMensOper.Max := 6;
            fraMensOper.Pos := 0;
            fraMensOper.Mes := 'Excluindo IR Litigio';
            with DMRendaFixa.qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM IRLITIGIO WHERE IDOPERRENFIX = ' +
                           qryIDOPERRENFIX.AsString;
               ExecSQL;
               Close;
            end;
            fraMensOper.Incrementa;
            fraMensOper.Mes := 'Excluindo Items da Operação';
            with DMRendaFixa.qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM OPERRENFIXXCURVAS WHERE IDOPERRENFIX = ' +
                           qryIDOPERRENFIX.AsString;
               ExecSQL;
               Close;
            end;
            fraMensOper.Incrementa;
            // AL_12 - INI
            fraMensOper.Mes := 'Excluindo Histórico de Repactuação';
            with DMRendaFixa.qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM HISTOPERRENFIX WHERE IDOPERRENFIX = ' +
                           qryIDOPERRENFIX.AsString;
               ExecSQL;
               Close;
            end;
            fraMensOper.Incrementa;
            // AL_12 - Fim
            fraMensOper.Mes := 'Excluindo Operação';
            with DMRendaFixa.qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Text := 'DELETE FROM OPERRENFIX WHERE IDOPERRENFIX = ' +
                           qryIDOPERRENFIX.AsString;
               ExecSQL;
               Close;
            end;
            fraMensOper.Incrementa;

            // Exclusão dos lançamentos Contábeis e Financeiros que agora ficam na tabela
            //   de Operações.
            if qryPLNCODIGO.AsInteger <> 0 then
            begin
               fraMensOper.Mes := 'Excluindo Lançamentos Contábeis';
               if not RendaFixa.ExcluiContabilidadeRenFix(qryPLNCODIGO.AsInteger) then
                  Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis ');
            end;
            fraMensOper.Incrementa;

            if qryCODDOCUMENTO.AsInteger <> 0 then
            begin
               fraMensOper.Mes := 'Excluindo Lançamentos Financeiros';
               if not RendaFixa.ExcluiFinanceiroRenFix(qryCODDOCUMENTO.AsInteger) then
                  Raise Exception.Create('Não foi Possível Excluir os Lançamentos Financeiros ');
            end;
            fraMensOper.Incrementa;

            // Recalcula os demais resgates da mesma aplicação no mesmo dia
            if not RecalculaResgates(qryDATAOPERACAO.AsDateTime,
                                     qryIDINVESTIMENTO.AsInteger,
                                     qryIDOPERRENFIXAPLIC.AsInteger) then
               Abort;

            // Atualizar a tabela de parametros e o pRPI
            if bVoltaData then
            begin
               // Não Volta mais a data do sistema
               if RendaFixa.MarcaInvRep(dDataReproc, qryIDINVESTIMENTO.AsInteger,
                                            iOperAplic, iPlanPrevCtbPatro) = -1 then
                  Raise Exception.Create('Não foi Possível Marcar este Título para Reprocessamento.' + #13 +
                                         'o Título ' + qryInvestimentoDESCINVESTIMENTO.AsString +
                                         ' deve ser Reprocessado desde o Dia ' + DateToStr(dDataReproc));
            end;

            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Commit;

            Sel(-1);
         end
         else
         begin
            // Posiciona no mesmo registro
            Sel(iOpe);
         end;
      except on E: Exception do
         begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu um problema ao excluir a Operação '+ #13 +
                   E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
            Sel(iOpe);  // Posiciona no mesmo registro
         end;
      end;
   finally
      fraMensOper.Apaga(True);

      //AL_28
      OperComum.LimpaParametros(qryTipoOperacao);
      qryTipoOperacao.ParamByName('IDTIPOPENHORA').AsInteger := 0;
      qryTipoOperacao.Open;

      CmeCadastro.AtualizaBotoes(Self);
      sbtnApagar.Down := False;
      StatusConsulta;
   end;
end;

procedure TfrmCadOperRenFix.dbrVlrOperacaoExit(Sender: TObject);
begin
  inherited;
  CalculaValores(Sender);
  PreencheDadosPoupanca;
end;

procedure TfrmCadOperRenFix.dbrQtdeOperacaoExit(Sender: TObject);
begin
  inherited;
  CalculaValores(Sender);
end;

procedure TfrmCadOperRenFix.dbePuOperacaoExit(Sender: TObject);
begin
  inherited;
  CalculaValores(Sender);
end;

procedure TfrmCadOperRenFix.dbdDtaEmissaoExit(Sender: TObject);
begin
   inherited;
   if (dbdDataOperacao.Date = dbdDtaEmissao.Date) and
      (Trim(dbePUEmissao.Text) = '') then
   begin
      qryPUEMISSAO.AsFloat := dbePuOperacao.Value;
      dbePUEmissao.Value := dbePuOperacao.Value;
   end;
end;

procedure TfrmCadOperRenFix.dblkEmissorExit(Sender: TObject);
var idChave: Integer;
begin
   inherited;
   qryInvestimento.Close;
   if Trim(dblkEmissor.Text) = '' then
      qryInvestimento.ParamByName('IDEMISSOR').Clear
   else
      qryInvestimento.ParamByName('IDEMISSOR').AsString := dblkEmissor.LookupValue;
   qryInvestimento.Open;

   if (Trim(dblkForCli.Text) = '') and (Trim(dblkEmissor.Text) <> '') then
   begin
      idChave := StrToInt(dblkEmissor.LookupValue);
      if qryContraParte.Locate('IDPESSOA', idChave, []) then
      begin
         qryIDFORCLI.AsInteger := qryContraParteIDPESSOA.AsInteger;
         dblkForCli.LookupValue := qryContraParteIDPESSOA.AsString;
         dblkForCli.Text := qryContraParteNOME.AsString;
         dblkForCli.PerformSearch;
      end;
   end;
end;

procedure TfrmCadOperRenFix.chkMoedaClick(Sender: TObject);
begin
  inherited;
   MontaMoeda;
end;

procedure TfrmCadOperRenFix.BtIncDetClick(Sender: TObject);
var iMoeda: Integer;
    fCurva: Double;
begin
  inherited;
  fCurva := 0;
  iMoeda := -1;
  if pItem(trvCurvas.Selected.Data).FLGMoeda = 'Y' then
     iMoeda := StrToInt(dblkMoeda.LookupValue)
  else
     fCurva := dbrValor.Value;

  pItem(trvCurvas.Selected.Data).IDMoeda := iMoeda;
  pItem(trvCurvas.Selected.Data).VlrCurva := fCurva;
  pItem(trvCurvas.Selected.Data).PercCurva := dbrPercentual.Value;

  // Muda o Icone do Item Preenchido ou Volta o Icone Original se estiver em branco
  if (fCurva = 0) and (iMoeda <= 0) then
  begin
     trvCurvas.Selected.ImageIndex := 2;
     trvCurvas.Selected.SelectedIndex := 3;
  end else begin
     trvCurvas.Selected.ImageIndex := 4;
     trvCurvas.Selected.SelectedIndex := 5;
  end;

  if trvCurvas.CanFocus then
     trvCurvas.SetFocus;

  bbtnOkDet.Down := False;
end;

procedure TfrmCadOperRenFix.dbrPercentualKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then     //Enter - Troca de Campo
     bbtnOkDet.Click;
end;

procedure TfrmCadOperRenFix.chkFlgCartHipoClick(Sender: TObject);
begin
  inherited;
  if chkFlgCartHipo.Checked then
     pnlQtdHipo.Visible := True
  else
  begin
     pnlQtdHipo.Visible := False;
     dbrQtdCartHipo.Value := 0;
  end;
end;

procedure TfrmCadOperRenFix.dblkClasseRiscoExit(Sender: TObject);
begin
   inherited;
   ColoreComboRisco;
end;

function TfrmCadOperRenFix.BuscaFlgNegociavel(iOperAplic: Integer): String;
begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT FLGNEGOCIACAO FROM OPERRENFIX WHERE IDOPERRENFIX = ' + IntToStr(iOperAplic));
   qryAux.Open;

   if qryAux.IsEmpty then
   begin
      MsgDlg('Não foi possível encontrar esta Operação de Aplicação.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := 'N';
      Exit;
   end;

   if qryAux.FieldByName('FLGNEGOCIACAO').IsNull then
      Result := 'S'
   else
      Result := qryAux.FieldByName('FLGNEGOCIACAO').AsString;

   qryAux.Close;
   qryAux.SQL.Clear;

end;

function TfrmCadOperRenFix.BuscaSldCartHipo(iOperAplic: Integer): Double;
begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT QTDCARTHIPO ');
   qryAux.SQL.Add('FROM OPERRENFIX ');
   qryAux.SQL.Add('WHERE IDOPERRENFIXAPLIC = ' + IntToStr(iOperAplic) + ' ');
   qryAux.SQL.Add('ORDER BY DATAOPERACAO DESC, IDOPERRENFIX DESC ');
   qryAux.Open;

   if qryAux.IsEmpty then
   begin
      MsgDlg('Não foi possível encontrar esta Operação de Aplicação.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := 0;
      Exit;
   end;

   qryAux.First;
   Result := qryAux.FieldByName('QTDCARTHIPO').AsFloat;
   qryAux.Close;
   qryAux.SQL.Clear;

end;

function TfrmCadOperRenFix.RecalculaResgates(dDataProc: TDateTime;
                                             iInvestimento, iOperAplic: Integer): Boolean;
var sErro: String;
    iPlanilha, iDocumento: Integer;
begin
   // Testa de existem Operações para refazer o Histórico das Operações do dia
   Result := True;
   fraMensOper.Mostra;
   fraMensOper.Mes := 'Recalculando Demais Resgates do Dia...';
   With qryExisteOperacoes do
   begin
      OperComum.LimpaParametros(qryExisteOperacoes);
      ParamByName('dDataProc').AsString := DateToStr(dDataProc);
      if iInvestimento <> 0 then
         ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
      if iOperAplic <> 0 then
         ParamByName('IDOPERRENFIXAPLIC').AsInteger := iOperAplic;
      ParamByName('REPROCESSO').AsInteger := 1;
      Open;
      fraMensOper.Max := RecordCount;
      while not Eof do
      begin
         sErro := RendaFixa.RefazOperacoes(qryExisteOperacoesFLGGERACONTAB.AsInteger,
                                           qryExisteOperacoesIDOPERRENFIX.AsInteger,
                                           0, 0, 0, iPlanilha, iDocumento,
                                           qryExisteOperacoesFLGCONTAINVEST.AsInteger);
         if Trim(sErro) <> '' then
         begin
            Result := False;
            MsgDlg('Ocorreu um erro ao Recalcular uma Operação: '+ #13 +
                    sErro,'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
         fraMensOper.Incrementa;
         Next;
      end;
      Close;
   end;
end;

procedure TfrmCadOperRenFix.dbdDataOperacaoExit(Sender: TObject);
begin
  inherited;
   if (sTipoOper = [Resgate]) then
   begin
      if not DiasUteisInv.DiaUtil(dbdDataOperacao.Date,-1,1,'',True,False,False) then
      begin
         MsgDlg('Data da Operação não é um dia útil.','Mensagem do Sistema',mtWarning,[MbOk],0);
         qryDATAOPERACAO.AsDateTime := DiasUteisInv.PrimeiroDiaUtilPosterior(StrToDate(msBuscaSaldos.ValoresChave[5]),-1, 1,'',True,False,False);
         if dbdDataOperacao.CanFocus then
            dbdDataOperacao.SetFocus;
      end;
   end;
   //AL_26
   if Trim(dbdDataOperacao.Text) <> '' then
      qryDATALIQUIDACAO.AsDateTime := qryDATAOPERACAO.AsDateTime;   
end;

procedure TfrmCadOperRenFix.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
   rptlblContraParte.Caption   := dblkForCli.Text;
   rptlblCustodiante.Caption   := dblkCustodiante.Text;
   rptlblEmissor.Caption       := dblkEmissor.Text;
   rptlblInvestimento.Caption  := dblkInvestimento.Text;
   rptlblDtaLiquidacao.Caption := dbdDataOperacao.Text;
   rptlblPrazo.Caption         := IntToStr(DiasUteisInv.IntervaloDias(qryDATAOPERACAO.AsDateTime,qryVENCOPERACAO.AsDateTime));
   lblNomeEmpresa.Caption      := Sistema.NomeEmpresa;

   TfrmPreview.CreateModalPreview(Application,
                                  rptBoletaRenFix,
                                  rptBoletaRenFix.PrinterSetup.DocumentName);

end;

procedure TfrmCadOperRenFix.FormCreate(Sender: TObject);
var i, Pos: Byte;
begin
   inherited;
   msBuscaSaldos.ItemsBusca.Clear;
   for i := 0 to msBuscaSaldos.Colunas.Count - 1 do
   begin
      if msBuscaSaldos.Colunas[i] = 'HISTRENFIX.DATAHISTRENFIX' then
         msBuscaSaldos.ItemsBusca.add(FormatDateTime('DD/MM/YYYY', CtrlPInv.DataUltFechRF))
      else
         msBuscaSaldos.ItemsBusca.add('');
   end;
end;

procedure TfrmCadOperRenFix.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  // AL_3

  StatusOperacao(False,True);
  sTipoOper := [Alteracao];

end;

//AL_26
procedure TfrmCadOperRenFix.dtLiquidacaoExit(Sender: TObject);
begin
  inherited;
   if (dtLiquidacao.Date < dbdDataOperacao.Date) and (Trim(dbdDataOperacao.Text) <> '') then
   begin
      MsgDlg('A data de liquidação não pode ser menor que a de Operação !','Mensagem do Sistema',mtWarning,[MbOk],0);
      qryDATALIQUIDACAO.AsDateTime := qryDATAOPERACAO.AsDateTime;
      if dtLiquidacao.CanFocus then
         dtLiquidacao.SetFocus;
   end;
end;

//AL_36 - Verifica se o Item será exibido no TreeView
function TfrmCadOperRenFix.ExibeItem(iCurva, iItem: Integer; sItem: String): String;
var qryExibeItem: TwwQuery;
begin
  try
     qryExibeItem := TwwQuery.Create(Application);
     qryExibeItem.DatabaseName := 'BaseDados';

     qryExibeItem.SQL.Add('SELECT FLGEXIBENAOPER ');
     qryExibeItem.SQL.Add('FROM CURVASXITEMRENFIX ');
     qryExibeItem.SQL.Add('WHERE IDCURVARENFIX = ' + IntToStr(iCurva));
     qryExibeItem.SQL.Add('  AND IDITEMRENFIX = ' + IntToStr(iItem));
     qryExibeItem.Open;

     if qryExibeItem.IsEmpty then
        Raise Exception.Create('Não foi possível encontrar o Item ' + Trim(sItem) + 'neste Perfil');
     if qryExibeItem.FieldByName('FLGEXIBENAOPER').IsNull then
        Result := 'T'
     else
        Result := qryExibeItem.FieldByName('FLGEXIBENAOPER').AsString;

  finally
     qryExibeItem.Close;
     FreeAndNil(qryExibeItem);
  end;

end;

end.
