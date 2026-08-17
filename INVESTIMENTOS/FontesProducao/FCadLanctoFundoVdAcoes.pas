//******************************************************************************
// Rotina     : BuscaCotacaoRV
// SOL        : 92822
// Kintana    : 389089 
// Data       : 11/08/2008
// Responsável: Ricardo Cristiano
// Descrição  : Instrução CGPC 025 que altera a precificação dos ativos de mercado a vista.
//******************************************************************************
// Data      : 10/01/2008
// Código    : AL_32
// Pendencia : 26743
// SOL       :       
// Desc      : Retirar a crítica de transferências entre Planos posteriores ao resgate
//******************************************************************************
// Data      : 10/01/2008
// Código    : AL_31
// Pendencia : 26743
// SOL       :       
// Desc      : Verificar se existem transferências entre Planos posteriores ao resgate
//******************************************************************************
// Data      : 09/11/2007
// Código    : AL_30
// Pendencia : 26636
// SOL       : 71212
// Motivo    : Implementaçao de ajustes de exclusao, relançamento e tratamentos
//             de datas.
//******************************************************************************
// Data      : 23/10/2007
// Código    : AL_29
// Pendencia : 26636
// SOL       : 71212
// Motivo    : Implementação de ajuste para relaizar a operação de lançamento e
//             para imprimir o relatório
//******************************************************************************
// Data      : 28/03/2007
// Código    : AL_28
// Motivo    : Implementação de atualizações para funcionar a operação
//******************************************************************************
// Data      : 13/03/2007
// Código    : AL_27
// Motivo    : Ajuste na mensagem de reprocessamento
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_26
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 03/10/2006
// Código    : AL_25
// Pendencia : 22965
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_24
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_23
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_22
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_21
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_20
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 30/05/2005
// Linha(s) : Al_19
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 29/04/2005
// Linha(s) : Al_18
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Data     : 17/03/2005
// Linha(s) : AL_17
// Motivo   : Criação da variável bRelanca para só relançar as vendas se estas forem excluidas
//******************************************************************************
// Data     : 16/03/2005
// Linha(s) : AL_16
// Motivo   : Ajuste nas rotinas de criação da vendas para certar o registro de lucro
//               para acertar o rateio das despesas da operação
//            Ajuste no lay-out da tela (DFM)
//******************************************************************************
// Data     : 11/03/2005
// Linha(s) : AL_15
// Motivo   : Remodelação nas rotinas de alteração e exclusão para excluir sempre
//               todas as operações e relançá-las como se fosse na inclusão
//            Ajuste nas rotinas de contabilização das Vendas
//******************************************************************************
// Data     : 09/03/2005
// Linha(s) : AL_14
// Motivo   : Alteração na rotina de seleção e exclusão das operações para
//               excluir as operações tanto de fundos quanto de RV independentemente
//               uma da outra.
//******************************************************************************
// Data     : 07/03/2005
// Linha(s) : AL_13
// Motivo   : Ajuste para capturar as boletas já utilizadas nas operações existentes
//******************************************************************************
// Data     : 04/03/2005
// Linha(s) : AL_12
// Motivo   : Nova Rotina para excluir as vendas, o financeiro e o contábil
//              no caso de alteração de uma das operações
//******************************************************************************
// Data     : 02/03/2005
// Linha(s) : AL_11
// Motivo   : Ajuste para mandar a descrição da operação correta para o contabil
//            Também no DFM- qryBuscaOper
//******************************************************************************
// Data     : 23/02/2005
// Linha(s) : AL_10
// Motivo   : Incluída a Data da Cotização.
//******************************************************************************
// Data     : 23/02/2005
// Linha(s) : AL_9
// Motivo   : Alterada a Rotina de gravação de 2 aplicações no mesmo dia p/ gravar cota no histórico,
//******************************************************************************
// Data     : 22/02/2005
// Linha(s) : AL_8
// Motivo   : Reformulação da rotina bbtnConfirmarClick para obedecer ao
//            controle de transação
//            Acerto nas mensagens de erro
//            Acerto na contabilização das vendas de ações
//******************************************************************************
// Data     : 18/02/2005
// Linha(s) : AL_7
// Motivo   : Inclusão de rotina de Reprocessamento.
//******************************************************************************
// Data     : 18/02/2005
// Linha(s) : AL_6
// Motivo   : Inclusão de rotina para excluir/gerar registro ATU, quando for exluir uma aplicação
//            que houver mais de uma para o mesmo dia. (QryPesqHistFundoDel,QyDelHistFundoATU)
//******************************************************************************
// Data     : 15/02/2005
// Código   : AL_5
// Motivo   : Adaptação para Reprocessamento e legislação CCI
//******************************************************************************
// Data     : 25/01/2005
// Código   : AL_4
// Motivo   : Com o valor sendo passado negativo, esse era somado no saldo e dobrava o saldo final.
//******************************************************************************
// Data     : 06/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************

unit FCadLanctoFundoVdAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdbdatetimepicker,UOperacaoInvest,
  CMDateTimePicker, Mask, DBCtrls, wwdblook, TREdit, Wwdbigrd, Wwdbgrid,
  Grids, DBGrids, ComCtrls, FPreview, faMensagem, uCtrlInvContab, fcLabel;

type
  TfrmCadLanctoFundoVdAcoes = class(TfrmCadastroCS)
    pnlData: TPanel;
    dbDtaTransf: TCMDateTimePicker;
    lblDataTransf: TLabel;
    QryTipoOperRV: TwwQuery;
    QryCustodiante: TwwQuery;
    QryTipoOperFD: TwwQuery;
    QryTipoOperRVIDTIPOOPERACAO: TFloatField;
    QryTipoOperRVDESCTIPOOPERACAO: TStringField;
    QryTipoOperRVNATUREZAOPERACAO: TStringField;
    QryTipoOperFDIDTIPOOPERACAO: TFloatField;
    QryTipoOperFDDESCTIPOOPERACAO: TStringField;
    QryTipoOperFDNATUREZAOPERACAO: TStringField;
    QryCarteiraRV: TwwQuery;
    QryCarteiraRVIDCARTEIRAINVEST: TFloatField;
    QryCarteiraRVDESCCARTINVEST: TStringField;
    QryCustodianteIDCUSTODIANTE: TFloatField;
    QryCustodianteSGLCUSTODIANTE: TStringField;
    QryInvestimento: TwwQuery;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoIDEMISSOR: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    QryFundos: TwwQuery;
    QryFundosIDFUNDOINVEST: TFloatField;
    QryFundosDESCFUNDOINVEST: TStringField;
    QryFundosIDGESTORCARTEIRA: TFloatField;
    QryFundosQTDDECQTD: TFloatField;
    QryFundosQTDDECVALOR: TFloatField;
    QryFundosPZOLIQAPLIC: TFloatField;
    Panel2: TPanel;
    pnlRV: TPanel;
    pnlDeAcoes: TPanel;
    QryCotacaoInvest: TwwQuery;
    QryCotacaoInvestQTDTITLOTE: TFloatField;
    QryVendaAcao: TwwQuery;
    QryGestor: TwwQuery;
    QryGestorNOME: TStringField;
    QryAuxFD: TwwQuery;
    dsAuxFD: TwwDataSource;
    updAuxFD: TUpdateSQL;
    QryAuxFDQTDOPERACAO: TFloatField;
    QryAuxFDVLROPERACAO: TFloatField;
    QryCotaFundo: TwwQuery;
    dsCotaFundo: TwwDataSource;
    QryCotaFundoVLRCOTA: TFloatField;
    QryTipoOperRVFLGTRATAIR: TStringField;
    QryTipoOperRVIDMERCADO: TFloatField;
    QryInsOperacaoinvest: TwwQuery;
    qryBuscaOper: TwwQuery;
    QryAcao: TwwQuery;
    QryAcaoCODTIPOACAO: TStringField;
    QryInsOperacaoFundo: TwwQuery;
    QryFundosIDTIPOFUNDOINVEST: TFloatField;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtIncDet: TSpeedButton;
    BtAltDet: TSpeedButton;
    BtDelDet: TSpeedButton;
    QryInsOperInvXOperFdo: TwwQuery;
    QryAuxFDVLRCOTA: TFloatField;
    QryAuxFDDATAOPERACAO: TDateTimeField;
    QryAuxFDDATALIQUIDACAO: TDateTimeField;
    QryDetalhe: TwwQuery;
    QryDetalheDATAOPERACAO: TDateTimeField;
    QryDetalheQTDEOPERACAO: TFloatField;
    QryDetalhePRECOUNITOPERACAO: TFloatField;
    QryDetalheDATAVENCOPER: TDateTimeField;
    QryDetalheVLROPERACAO: TFloatField;
    QryDetalheIDOPERACAOINVEST: TFloatField;
    QryDetalheIDINVESTIMENTO: TFloatField;
    QryDetalheIDCARTEIRAINVEST: TFloatField;
    QryDetalheIDCUSTODIANTE: TFloatField;
    QryDetalheSGLCUSTODIANTE: TStringField;
    QryDetalheDESCINVESTIMENTO: TStringField;
    QryDetalheDESCCARTINVEST: TStringField;
    dsDetalhe: TwwDataSource;
    updDetalhe: TUpdateSQL;
    QryInvestimentoCODTIPOACAO: TStringField;
    QryFundosIDCARTEIRAINVEST: TFloatField;
    qryIDOPERACAOINVEST: TFloatField;
    qryIDOPERACAOFUNDO: TFloatField;
    QryCompraFundos: TwwQuery;
    QryCompraFundosIDHISTFUNDO: TFloatField;
    QryCompraFundosCODDOCUMENTO: TFloatField;
    QryCompraFundosPLNCODIGO: TFloatField;
    QryCompraFundosPLANO: TFloatField;
    QryCompraFundosIDTIPOOPERACAO: TFloatField;
    QryCompraFundosIDCARTEIRAINVEST: TFloatField;
    QryCompraFundosDATAAPLICACAO: TDateTimeField;
    QryCompraFundosIDTIPOINVEST: TFloatField;
    QryCompraFundosVLRAPLICADO: TFloatField;
    QryCompraFundosNATURMOVFUNDO: TStringField;
    QryCompraFundosTIPMOVFUNDO: TStringField;
    QryCompraFundosIDFUNDOINVEST: TFloatField;
    QryCompraFundosDATALIQUIDACAO: TDateTimeField;
    QryCompraFundosCOTASMOVFUNDO: TFloatField;
    QryCompraFundosCOTAAPLICACAO: TFloatField;
    QryCompraFundosIDOPERACAOFUNDO: TFloatField;
    QryCompraFundosDESCCARTINVEST: TStringField;
    QryCompraFundosDESCFUNDOINVEST: TStringField;
    QryCompraFundosNOME: TStringField;
    QryCompraFundosVLRCOTA: TFloatField;
    updCotaFundo: TUpdateSQL;
    pnlFundos: TPanel;
    lblGestorFundo: TLabel;
    lblFundos: TLabel;
    pnlParaFundos: TPanel;
    dblFundo: TwwDBLookupCombo;
    pnlDetalheFD: TPanel;
    lblVlrFD: TLabel;
    Label2: TLabel;
    lblCota: TLabel;
    lblQtdFD: TLabel;
    lblDataLiqFD: TLabel;
    dbeVlrFD: TDBEdit;
    dbDtaCotaFD: TCMDateTimePicker;
    dbDtaLiqFD: TCMDateTimePicker;
    QryBuscaAplicFundo: TwwQuery;
    QryCompraFundosDATAMOVFUNDO: TDateTimeField;
    //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
    QryCompraFundosVLRMOVFUNDO: TFloatField;
    dbeQtdFD: TDBRealEdit;
    dbeCotaFD: TDBRealEdit;
    sbtnImprimir: TToolbarButton97;
    lblGestorFundo1: TLabel;
    QryDetalheIDTIPOINVEST: TFloatField;
    QryFundosIDTIPOINVEST: TFloatField;
    qryBuscaVlrLiquido: TwwQuery;
    QryDetalheNUMDOCUMENTO: TStringField;
    QryDetalheIDTIPOOPERACAO: TFloatField;
    QryDetalheDESCTIPOOPERACAO: TStringField;
    QryPesqHistFundoDel: TwwQuery;
    QyDelHistFundoATU: TwwQuery;
    QryDelHistFundo: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    QryTipoOperRVFLGCONTAINVEST: TFloatField;
    qryBoleta: TwwQuery;
    qryBoletaPLANO: TFloatField;
    qryBoletaPLNCODIGO: TFloatField;
    qryBoletaCODDOCUMENTO: TFloatField;
    QryCarteiraRVID: TStringField;
    QryCarteiraRVIDCARTEIRAGERENC: TFloatField;
    QryDetalheIDCARTEIRAGERENC: TFloatField;
    pnlOperacoes: TPanel;
    dblCarteiraRV: TwwDBLookupCombo;
    dblAcao: TwwDBLookupCombo;
    dblCustodiante: TwwDBLookupCombo;
    Dock978: TDock97;
    Toolbar975: TToolbar97;
    BtOkDet: TBitBtn;
    BtCancDet: TBitBtn;
    BtVoltaDet: TBitBtn;
    dblTipoOperRV: TwwDBLookupCombo;
    dbgOperacao: TwwDBGrid;
    dbdDataOperacao: TCMDateTimePicker;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    dbrQtdProv: TDBRealEdit;
    Label8: TLabel;
    dbrVlrProv: TDBRealEdit;
    Label9: TLabel;
    dbeDivPorAcao: TDBRealEdit;
    Label13: TLabel;
    qryAux: TwwQuery;
    Label10: TLabel;
    dbDtaCotizaFD: TCMDateTimePicker;
    QryCompraFundosDATACOTIZACAO: TDateTimeField;
    qryBuscaOperNUMDOCUMENTO: TStringField;
    qryBuscaOperIDOPERACAOINVEST: TFloatField;
    qryBuscaOperIDINVESTIMENTO: TFloatField;
    qryBuscaOperIDCARTEIRAINVEST: TFloatField;
    qryBuscaOperIDCARTEIRAGERENC: TFloatField;
    qryBuscaOperIDTIPOOPERACAO: TFloatField;
    qryBuscaOperDESCINVESTIMENTO: TStringField;
    qryBuscaOperDATAOPERACAO: TDateTimeField;
    qryBuscaOperCODTIPOACAO: TStringField;
    qryBuscaVlrLiquidoVALORLIQUIDO: TFloatField;
    qryBuscaOperVLROPERACAO: TFloatField;
    qryBuscaOperDESCTIPOOPERACAO: TStringField;
    QryTipoOperFDFLGCONTAINVEST: TFloatField;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    QryDetalheID: TStringField;
    QryTipoOperFDVENCIMENTO: TFloatField;
    QryTipoOperRVVENCIMENTO: TFloatField;
    fraMens: TfraMensagem;
    QryFundosTRGDTINCLUSAO: TDateTimeField;
    QryFundosTRGUSERINCLUSAO: TStringField;
    QryFundosMOECODIGO: TFloatField;
    QryFundosCNPJFUNDO: TStringField;
    QryFundosSTAEXCLUSIVO: TStringField;
    QryFundosPZOCARENCIA: TFloatField;
    QryFundosPZOANIVERSARIO: TFloatField;
    QryFundosPZOLIQRESG: TFloatField;
    QryFundosSTAFUNDO: TStringField;
    QryFundosPZOAMORTIZACAO: TFloatField;
    QryFundosPERCTXPERFORM: TFloatField;
    QryFundosPERCTXADM: TFloatField;
    QryFundosCODFUNCETIP: TStringField;
    QryFundosSTAPROVISIONAIR: TStringField;
    QryFundosSTAPROVISIONAIOF: TStringField;
    QryFundosCONTRCETIP: TStringField;
    QryFundosDATAINICIOFUNDO: TDateTimeField;
    QryFundosPZOCOTAPLIC: TFloatField;
    QryFundosDTAINIPROC: TDateTimeField;
    //AL_30
    QryCompraFundosDATAOPERACAO: TDateTimeField;
    QryCompraFundosIDPLANPREVCTBPATR: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblFundoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HabilitapnlDetalheFD;
    procedure BuscaSaldosCustodia;
    function CalculaValorRV:Double;
    procedure bbtnConfirmarClick(Sender: TObject);
    function VerificaSaldoLiberadoRV:boolean;
    procedure dbeCotaFDExit(Sender: TObject);
    procedure dbeVlrFDExit(Sender: TObject);
    function CalculaQtdFD:Double;
    function VendaAcoes:boolean;
    function CompraFundos:boolean;
    function VerificaDadosFundo:boolean;
    procedure sbtnInserirClick(Sender: TObject);
    procedure LimpaCampos;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure HabilitaIncAltExcDetalhe;
    procedure DesabilitaIncAltExcDetalhe;
    procedure HabilitaBotoesDetalhe;
    procedure DesabilitaBotoesDetalhe;
    procedure BtIncDetClick(Sender: TObject);
    procedure BtAltDetClick(Sender: TObject);
    procedure BtDelDetClick(Sender: TObject);
    procedure HabilitaGridDetalhe;
    procedure BtCancDetClick(Sender: TObject);
    procedure BuscaCotacaoRV;
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure BtOkDetClick(Sender: TObject);
    function VerificaDadosRV:boolean;
    procedure BtVoltaDetClick(Sender: TObject);
    function OperInvesXOperFundo:boolean;
    procedure bbtnSairClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dbdDataOperacaoExit(Sender: TObject);
    procedure dblAcaoExit(Sender: TObject);
    procedure dbrQtdProvExit(Sender: TObject);
    procedure dbeDivPorAcaoExit(Sender: TObject);
    procedure dbrVlrProvExit(Sender: TObject);
    procedure dbDtaCotizaFDExit(Sender: TObject);
    procedure dbDtaTransfExit(Sender: TObject);
    procedure dbDtaCotaFDExit(Sender: TObject);

  private
    { Private declarations }
    sBoleta, sBoletaCCI: String;
         
    function ExcluiCompraFundo(iCodDocumento, iPlnCodigo, iPlano, iTipoInvest,
                               iIdHistFundo, iIdOperacaoFundo : integer;
                               dDtaAplic : TDateTime) : boolean;
     //AL_28
    function GravaVendaAcoes(iIdCarteiraInvest,iIdCarteiraGerenc, iIdInvestimento,
                             iIdMercado, iIdGestor, iIdCustodiante, iIdTipoOper : Integer;
                             dDataTrasf                  : TDateTime;
                             fQtdOper, fVlrOper, fPUOper : Double;
                             sFlagIR, sDescTipoOper, sDescInvestimento, sNatuOper, sCodTipoAcao : string;
                             var sMensagem : String) : boolean;

     function  AbreCompras(sParam: String): Boolean;

     // AL_12 - 04/03/2005
     function ExcluiVenda: Boolean;

  public
    { Public declarations }
  end;

var
  frmCadLanctoFundoVdAcoes : TfrmCadLanctoFundoVdAcoes;

  fVlrIR, fVlrIRProv, fCotacao, fSaldoBloq, fSaldoLib, fTotalOperacao, fVlrOperacao,
  wSaldoQtd, wSaldoCPMF, wSaldoVlr, wSaldoAqui, wSaldoIRApu, wSaldoInutil, fVlrRendimento : Double;
  
  sDataLiq,sDataOpe,wTipoRecDesBol, wMensErro, sIdOperacaoInvest : string;

  bAlteracaoInc,bAlteracaoAlt,bAlteracaoExc, bCriaLancto,
  bAlteraDetalhe, bAlteracao, bRelanca                           : boolean;

  iPlanilha, iPlano, iDocumento,iIdCarteira,iIdCustodiante, iIdOperacaoInvest,
  iIdOperacaoFundo, iIdForCli, iIdTipoInvest, iIdHistCartInv, iLinhaOriginal : integer;

  wStr, sLinhaOriginal : string;

implementation

uses UDatabase, DBaseDados,UMensErro,USistema, UOperComum, UImpostos, UBibliotecaInvest, UFundoComum,
     fAguarde, FDmRelatoriosFundos, dRendaVariavel, URendaVariavel,
     //AL_6
     DFundoComum, FPrincipal, UDiasUteisInv;

{$R *.DFM}

procedure TfrmCadLanctoFundoVdAcoes.FormCreate(Sender: TObject);
begin
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

  inherited;

   //AL_30
   MontaSelect.Filtro.Add('OPERACAOFUNDO.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro));
end;

procedure TfrmCadLanctoFundoVdAcoes.FormShow(Sender: TObject);
begin
  inherited;
   sLinhaOriginal := '';
   iLinhaOriginal := -1;
   bAlteraDetalhe := False;
   // AL_17
   bRelanca := False;

   dbDtaTransf.Date := pRPI.DATAULTFECH;
   if dbDtaTransf.CanFocus then
      dbDtaTransf.SetFocus;

   qry.Close;
   qry.ParamByName('IDOPERACAOINVEST').Clear;
   qry.ParamByName('IDOPERACAOFUNDO').Clear;
   qry.Open;

   QryDetalhe.Open;

   QryAuxFD.Open;
   QryAuxFD.Edit;

   QryCotaFundo.Open;

   QryTipoOperRV.Open;

   QryTipoOperFD.Open;

   QryCarteiraRV.Open;

   QryCustodiante.Open;

   QryInvestimento.Open;

   QryFundos.Close;
   QryFundos.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryFundos.ParamByName('DATAMOVFUNDO').AsString  := DateToStr(pRPI.DATAULTFECH);
   QryFundos.Open;   

   DesabilitaIncAltExcDetalhe;

   DesabilitaBotoesDetalhe;

   dbgOperacao.BringToFront;

   fraMens.Apaga;
end;

procedure TfrmCadLanctoFundoVdAcoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    Qry.Close;
    QryAuxFD.Close;
    QryTipoOperRV.Close;
    QryTipoOperFD.Close;
    QryCarteiraRV.Close;
    QryInvestimento.Close;
    QryFundos.Close;
    QryCustodiante.Close;
    QryCotaFundo.Close;
    QryCompraFundos.Close;
    QryVendaAcao.Close;
end;

procedure TfrmCadLanctoFundoVdAcoes.HabilitaGridDetalhe;
begin
   dbgOperacao.Enabled := True;

   if dbgOperacao.CanFocus then
      dbgOperacao.SetFocus
end;

procedure TfrmCadLanctoFundoVdAcoes.HabilitapnlDetalheFD;
begin
   // AL_10
   QryAuxFD.FieldByName('DATACOTIZACAO').AsString  := dbDtaTransf.Text; 
   QryAuxFD.FieldByName('DATAOPERACAO').AsString   := dbDtaTransf.Text;
   QryAuxFD.FieldByName('DATALIQUIDACAO').AsString := dbDtaTransf.Text;

   lblGestorFundo.Caption := '';

   if (Trim(dblFundo.Text) <> '') then
      pnlDetalheFD.Enabled := True
   else
      pnlDetalheFD.Enabled := False;
end;

procedure TfrmCadLanctoFundoVdAcoes.dblFundoExit(Sender: TObject);
begin
  inherited;

   HabilitapnlDetalheFD;

   if Trim(dblFundo.Text) <> '' then
   begin
      with QryGestor do
      begin
          Close;
          ParamByName('iIdGestor').AsInteger := QryFundos.FieldByName('IDGESTORCARTEIRA').AsInteger;
          Open;
          lblGestorFundo.Caption := QryGestor.FieldByName('NOME').AsString;
          Close;
      end;

      with QryTipoFundoInvest do
      begin
          Close;
          ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
          Open;
          iIdTipoInvest := QryTipoFundoInvest.FieldByName('IDTIPOINVEST').AsInteger;;
          Close;
      end;

      with QryCotaFundo do
      begin
         QryCotaFundo.Close;
         // AL_10
         QryCotaFundo.ParamByName('dbDtaCotaFD').AsString     := dbDtaCotizaFD.Text;
         QryCotaFundo.ParamByName('iIdFundoInvest').AsInteger := QryFundos.FieldByName('IDFUNDOINVEST').AsInteger;
         QryCotaFundo.Open;

         if isEmpty then
         begin
            MsgDlg('Cotação não encontrada para esta data : '+dbDtaCotizaFD.Text+#13+
            ' Fundo : '+QryFundos.FieldByName('DESCFUNDOINVEST').AsString+'','Mensagem do Sistema',MtWarning,[MbOk],0);
         end
         else
         begin
            QryAuxFD.FieldByName('VLRCOTA').AsFloat  := QryCotaFundo.FieldByName('VLRCOTA').AsFloat;
         end;
         //AL_10 - Fim
      end;
   end;

   QryAuxFD.FieldByName('DATAOPERACAO').AsString     := FormatDateTime('DD/MM/YYYY', dbDtaCotaFD.Date);
   // AL_10
   QryAuxFD.FieldByName('DATACOTIZACAO').AsString    := dbDtaCotizaFD.Text; 

   dbeQtdFD.DecDigits  := QryFundos.FieldByName('QTDDECQTD').AsInteger;
   dbeCotaFD.DecDigits := QryFundos.FieldByName('QTDDECVALOR').AsInteger;

   if Trim(dbeCotaFD.Text) <> '' then
      QryAuxFD.FieldByName('QTDOPERACAO').AsFloat := CalculaQtdFD;

end;

procedure TfrmCadLanctoFundoVdAcoes.BuscaSaldosCustodia;
Var
   dDataSaldo : TDateTime;
begin
   dDataSaldo := dbDtaTransf.Date;
   If (QryDetalhe.State = DsEdit) Then
      dDataSaldo := dbDtaTransf.Date - 1;
   fSaldoBloq := 0;
   fSaldoLib  := 0;
   if (QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger <> 0) and
      (QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger <> 0) and
      (QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger <> 0) and
      (dbDtaTransf.Text <> '') then
   begin
      //AL_25
      OperacaoInvest.BuscaSaldosCustodia(iPlanPrevCtbPatro, 
                        QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger,
                        9999999,
                        QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger,
                        -1,'',dDataSaldo,fSaldoBloq, fSaldoLib);
   end;
end;

procedure TfrmCadLanctoFundoVdAcoes.bbtnConfirmarClick(Sender: TObject);
var wPlano, wPlanilha, wDocumento  : Integer;
    sDoc: String;
begin
   //AL_30
      if not VerificaDadosFundo then
         Exit;
   // AL_8
   try
      //AL_30
      // AL_19
      //AL_24
      // Verifica dada de RV
      if not CtrlInvContab.TestaPeriodo(QryDetalheDATAOPERACAO.AsString, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Exit;
      end;

      //AL_24
      // Verifica data do Fundo      
      if not CtrlInvContab.TestaPeriodo(QryAuxFDDATAOPERACAO.AsString, iTipoInvestUsu) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Exit;
      end;
      // AL_19 - Fim

      //AL_20
      if VerEmAbertura(QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
         Exit;

      if (QryDetalhe.State = DsInsert) or (QryDetalhe.State = DsEdit) then
      begin
         MsgDlg('Uma operação não foi confirmada.','Mensagem do Sistema',mtConfirmation,[MbOk],0);
         Exit;
      end;

      try
         // Inicia processo
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;
         //AL_30
         if not ExcluiVenda then
            Raise Exception.Create('Nao foi possível excluir a operaçao.');

            if not ExcluiCompraFundo(QryCompraFundos.FieldByName('CODDOCUMENTO').AsInteger,
                                     QryCompraFundos.FieldByName('PLNCODIGO').AsInteger,
                                     QryCompraFundos.FieldByName('PLANO').AsInteger,
                                     QryCompraFundos.FieldByName('IDTIPOINVEST').AsInteger,
                                     QryCompraFundos.FieldByName('IDHISTFUNDO').AsInteger,
                                     QryCompraFundos.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                     QryCompraFundos.FieldByName('DATAAPLICACAO').AsDateTime) then
            Raise Exception.Create('Não foi possível excluir a Aplicaçao do Fundo de Investimento.');

         // AL_15

         //AL_28
         if not VendaAcoes then
            Raise Exception.Create('Não foi possível realizar a operação de Venda de Ações.');

         if not CompraFundos then
            Raise Exception.Create('Não foi possível realizar a operação de Aplicação de Fundos.');

         QryDetalhe.DisableControls;

         iIdForCli := OperComum.BuscaForCli(2,
                                        QryFundos.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                        -35, pRPI.IDTIPOCLIENTEEMI);
         fraMens.Mostra;
         fraMens.Max := QryDetalhe.RecordCount * 2;
         fraMens.Pos := 0;
         sDoc := '';
         QryDetalhe.First;
         while not QryDetalhe.Eof do
         begin
            if Pos(QryDetalheNUMDOCUMENTO.AsString, sDoc) = 0 then
            begin
               // Contabiliza Vendas
               wTipoRecDesBol := '';
               wMensErro      := '';
               bCriaLancto    := True;
               OperComum.LimpaParametros(qryBuscaOper);
               qryBuscaOper.ParamByName('IDBOLETA').AsString := QryDetalheNUMDOCUMENTO.AsString;
               qryBuscaOper.Open;
               qryBuscaOper.First;
               While Not qryBuscaOper.EOF Do
               begin
                  fraMens.Mes := 'Contabilizando Vendas ' + #13 +
                                 qryBuscaOper.FieldByName('DESCINVESTIMENTO').AsString;

                  OperComum.LimpaParametros(qryBoleta);
                  qryBoleta.ParamByName('IDBOLETA').AsString := qryBuscaOper.FieldByName('NUMDOCUMENTO').AsString;
                  qryBoleta.Open;

                  wPlano         := OperComum.IIF(qryBoletaPLANO.AsInteger = 0, -1, qryBoletaPLANO.AsInteger);
                  wPlanilha      := OperComum.IIF(qryBoletaPLNCODIGO.AsInteger = 0, -1, qryBoletaPLNCODIGO.AsInteger);
                  wDocumento     := OperComum.IIF(qryBoletaCODDOCUMENTO.AsInteger = 0, -1, qryBoletaCODDOCUMENTO.AsInteger);

                  OperComum.LimpaParametros(qryBuscaVlrLiquido);
                  qryBuscaVlrLiquido.ParamByName('IDBOLETA').AsString := QryDetalheNUMDOCUMENTO.AsString;
                  qryBuscaVlrLiquido.Open;

                  if qryBuscaOper.FieldByName('IDCARTEIRAGERENC').IsNull then
                  begin
                     OperComum.LancaOperRFRV(Sistema.IdEmpresa,
                                             79, 2,
                                             qryBuscaOper.FieldByName('IDINVESTIMENTO').AsInteger,
                                             qryBuscaOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                             qryBuscaOper.FieldByName('IDOPERACAOINVEST').AsInteger,
                                             iIdForCli,
                                             qryBuscaOper.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             pRPI.MOECODIGO,
                                             qryBuscaOper.FieldByName('CODTIPOACAO').AsString,'', '',
                                             // AL_11
                                             qryBuscaOper.FieldByName('DESCTIPOOPERACAO').AsString,
                                             '', wTipoRecDesBol, bCriaLancto,
                                             qryBuscaVlrLiquido.FieldByName('VALORLIQUIDO').AsFloat {Liquido ba boleta},
                                             qryBuscaOper.FieldByName('VLROPERACAO').AsFloat {Valor da operação atual},
                                             dbDtaTransf.Date,
                                             dbDtaTransf.Date,
                                             wPlano, wPlanilha, wDocumento, wMensErro, '', False);

                     if Trim(wMensErro) <> '' then
                        Raise Exception.Create('Ocorreu um problema na contabilização da operação ');

                     // Atualiza Plano e Planilha
                     if ((wPlano <> -1) and (wPlanilha <> -1)) or (wDocumento <> -1) then
                     begin
                        //AL_30
                        if ((wPlano <> -1) and (wPlanilha <> -1)) then
                           ExecutaQuery(qryAux,'UPDATE IRLITIGIO SET PLNCODIGO = '+IntToStr(wPlanilha)+
                                               ' ,PLANO = '+IntToStr(wPlano)+
                                               ' WHERE (IDOPERACAOINVEST = '+ qryBuscaOper.FieldByName('IDOPERACAOINVEST').AsString + ')');
                        // AL_5 
                        // Atualiza a Planilha na Boleta
                        fraMens.Mes := 'Atualizando a Boleta ' + qryBuscaOper.FieldByName('NUMDOCUMENTO').AsString;
                        with DMRendaVariavel do
                        begin
                           OperComum.LimpaParametros(qryUpdBoleta);
                           //AL_29
                           qryUpdBoleta.ParamByName('STATUS').AsString := 'F';
                           qryUpdBoleta.ParamByName('IDBOLETA').AsString := qryBuscaOper.FieldByName('NUMDOCUMENTO').AsString;
                           if (wPlano <> -1) and (wPlanilha <> -1) then
                           begin
                              qryUpdBoleta.ParamByName('PLANO').AsInteger    := wPlano;
                              qryUpdBoleta.ParamByName('PLNCODIGO').AsInteger := wPlanilha;
                           end;
                           if wDocumento <> -1 then
                              qryUpdBoleta.ParamByName('CODDOCUMENTO').AsInteger := wDocumento;
                           qryUpdBoleta.ExecSQL;
                        end;
                        //AL_5 - Fim
                     end;
                  end;

                  with QryInsOperInvXOperFdo do
                  begin
                     Close;
                     ParamByName('IDOPERACAOINVEST').AsInteger  := qryBuscaOper.FieldByName('IDOPERACAOINVEST').AsInteger;
                     ParamByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundo;
                     ParamByName('DATAOPERACAO').AsDateTime     := qryBuscaOper.FieldByName('DATAOPERACAO').AsDateTime;
                     ExecSQL;
                     Close;
                  end;
                  qryBuscaOper.Next;
                  fraMens.Incrementa;
               end;
               sDoc := sDoc + '|' + QryDetalheNUMDOCUMENTO.AsString;
            end;
            QryDetalhe.Next;
         end;
         OperComum.LimpaParametros(qryBuscaVlrLiquido);

         fraMens.Apaga;
         //AL_30
         if DtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;
         frmAguarde.Apaga;
         HabilitaIncAltExcDetalhe;
         QryDetalhe.Close;
         QryDetalhe.EnableControls;
         sbtnInserir.Down := False;
         sbtnAlterar.Down := False;

         // AL_7
         with QryTipoFundoInvest do
         begin
             Close;
             ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
             Open;
         end;

         If StrToDate(dbDtaCotaFD.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
         begin
            If Not Reprocessamento(iTipoInvestUsu,
                                   QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                   QryFundos.FieldByName('IDFUNDOINVEST').AsInteger,
                                   iPlanPrevCtbPatro,
                                   StrToDate(dbDtaCotaFD.Text),
                                   QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                   QryFundos.FieldByName('DTAINIPROC').AsDateTime,
                                   True) Then
               //AL_27
               MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                      'Mensagem do Sistema', MtInformation,[MbOk],0);
         end;
         
         MsgDlg('Processo concluído com sucesso.','Mensagem do Sistema',mtConfirmation,[MbOk],0);
         // AL_7
      except
         on E: Exception do
         begin
            if DtmBaseDados.dbBaseDados.InTransaction then
               DtmBaseDados.dbBaseDados.Rollback;
            //AL_28
            MsgDlg(E.Message, 'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   finally
      frmAguarde.Apaga;
      bbtnConfirmar.Enabled := False;
      sbtnInserir.Down := False;
      sbtnAlterar.Down := False;
      QryDetalhe.Close;
      QryDetalhe.EnableControls;
      // No Final cancela a edição das qry's para descartar os valores
      QryAuxFD.FieldByName('VLROPERACAO').AsFloat  := 0;
      QryAuxFD.FieldByName('QTDOPERACAO').AsFloat  := 0;
      QryAuxFD.FieldByName('VLRCOTA').AsFloat      := 0;
      QryCotacaoInvest.Cancel;
      QryAuxFD.Cancel;
      bbtnCancelarClick(Sender);
      LimpaCampos;
      dbgOperacao.Enabled := True;
      bAlteraDetalhe := False;
   end;
// AL_8 - Fim
end;

function TfrmCadLanctoFundoVdAcoes.VerificaSaldoLiberadoRV:boolean;
begin
   Result := True;
   if QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat > fSaldoLib then
   begin
      MsgDlg('Quantidade operada maior que saldo liberado.'+#13+
      'Saldo Liberado :'+FormatFloat('###,###,##0',fSaldoLib)+'','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
   end;
end;

procedure TfrmCadLanctoFundoVdAcoes.dbeCotaFDExit(Sender: TObject);
begin
  inherited;
   if Trim(dbeCotaFD.Text) <> '' then
      QryAuxFD.FieldByName('QTDOPERACAO').AsFloat := CalculaQtdFD;
end;

procedure TfrmCadLanctoFundoVdAcoes.dbeVlrFDExit(Sender: TObject);
begin
  inherited;
   if Trim(dbeCotaFD.Text) <> '' then
   Begin
      if (QryAuxFD.State = DsInsert) or (QryAuxFD.State = DsEdit) then
          QryAuxFD.FieldByName('QTDOPERACAO').AsFloat := CalculaQtdFD;
   End;
end;

function TfrmCadLanctoFundoVdAcoes.CalculaQtdFD:Double;
var
   iQtdDec : integer;
begin
   iQtdDec := QryFundos.FieldByName('QTDDECQTD').AsInteger;
   Result  := OperComum.DivValorZero(QryAuxFD.FieldByName('VLROPERACAO').AsFloat,
                                     QryAuxFD.FieldByName('VLRCOTA').AsFloat);
   Result  := OperComum.Trunca(Result,iQtdDec);
end;

function TfrmCadLanctoFundoVdAcoes.VerificaDadosRV:boolean;
begin
   Result := True;
   if qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger = 0 then
   begin
      MsgDlg('Carteria de Ações não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if (qryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger = 0) And
      (qryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger = 0) then
   begin
      MsgDlg('Custodiante não informado.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if qryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger = 0 then
   begin
      MsgDlg('Ação não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if Trim(qryDetalhe.FieldByName('DATAOPERACAO').AsString) = '' then
   begin
      MsgDlg('Data da operação de açoes não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   //AL_30
   if qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime <> dbDtaTransf.Date then
   begin
      MsgDlg('Data da operaçao de açoes diferente da Data de Transferência.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if qryDetalhe.FieldByName('PRECOUNITOPERACAO').AsFloat = 0 then
   begin
      MsgDlg('Cotação da ação não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if qryDetalhe.FieldByName('QTDEOPERACAO').AsFloat = 0 then
   begin
      MsgDlg('Quantidade de ações não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if qryDetalhe.FieldByName('VLROPERACAO').AsFloat = 0 then
   begin
      MsgDlg('Valor da operação não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if Trim(qryDetalhe.FieldByName('DATAVENCOPER').AsString) = '' then
   begin
      MsgDlg('Data de liquidação da ação não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
end;

function TfrmCadLanctoFundoVdAcoes.VerificaDadosFundo:boolean;
begin
   Result := True;
   // Valida entrada dados
   if Trim(dbDtaTransf.Text) = '' then
   begin
      MsgDlg('Data da tranferência não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if Trim(dblFundo.Text) = '' then
   begin
      MsgDlg('Fundo de Investimento não informado.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if Trim(dbDtaCotaFD.Text) = ''then
   begin
      MsgDlg('Data da operação de Fundo não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   // AL_10
   if Trim(dbDtaCotizaFD.Text) = ''then 
   begin
      MsgDlg('Data da Cotização de Fundo não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;

   //AL_30
   if Trim(dbDtaLiqFD.Text) = '' then
   begin
      MsgDlg('Data da liquidação operaçao de Fundo nao informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;

   //AL_30
   if dbDtaCotaFD.Date < dbDtaTransf.Date then
   begin
      MsgDlg('Data da Operação de Fundo não pode ser menor que a Data de Transferência.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;

   //AL_30
   if dbDtaCotizaFD.Date < dbDtaCotaFD.Date then
   begin
      MsgDlg('Data da Cotização de Fundo não pode ser menor que a Data da Operaçao.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;

   //AL_30
   if dbDtaLiqFD.Date < dbDtaCotaFD.Date then
   begin
      MsgDlg('Data de liquidaçao de Fundo nao pode ser menor que a Data da Operaçao.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;

   if (Trim(dbeVlrFD.Text) = '') or (QryAuxFdVLROPERACAO.AsFloat = 0) Then
   begin
      MsgDlg('Valor da operação de Fundo não informado.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if (Trim(dbeCotaFD.Text) = '') or (QryAuxFdVLRCOTA.AsFloat = 0) then
   begin
      MsgDlg('Cota do Fundo não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if (Trim(dbeQtdFD.Text) = '') or (QryAuxFdQTDOPERACAO.AsFloat = 0) then
   begin
      MsgDlg('Quantidade da operação de Fundo não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   //AL_30
end;

function TfrmCadLanctoFundoVdAcoes.CompraFundos:boolean;
Var
   fVlrCustoAcoes, fVlrVarAcoes : Currency;
   //AL_26
   wStr, sMens: String;
begin
   if QryFundos.FieldByName('IDCARTEIRAINVEST').AsInteger <= 0 then
   begin
      MsgDlg('Não foi cadastrado a Carteira para esse Fundo de Investimentos.' + #13 +
             'Verifique o cadastro de fundo e a data de vigência.',
             'Mensagem do Sistema', mtInformation, [MbOk],0);
      exit;
   end;
   
   Result     := True;
   iPlano     := -1;
   iPlanilha  := -1;
   iDocumento := -1;
   fVlrCustoAcoes := 0;
   fVlrVarAcoes   := 0;
   Try

     iIdForCli := OperComum.BuscaForCli(iIdTipoInvest,
                     QryFundos.FieldByName('IDGESTORCARTEIRA').AsInteger,
                     -34, pRPI.IDTIPOCLIENTEEMI);

      // Grava na OPERACAOFUNDO
      with QryInsOperacaoFundo do
      begin
         Close;
         iIdOperacaoFundo := LeUltRegistro(nil,'OPERACAOFUNDO');
         ParamByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundo;
         ParamByName('IDCARTEIRAINVEST').AsInteger  := QryFundos.FieldByName('IDCARTEIRAINVEST').AsInteger;
         ParamByName('IDTIPOINVEST').AsInteger      := iIdTipoInvest;
         ParamByName('IDTIPOOPERACAO').AsInteger    := -34;
         ParamByName('IDFUNDOINVEST').AsInteger     := QryFundos.FieldByName('IDFUNDOINVEST').AsInteger;
         ParamByName('DATAOPERACAO').AsDateTime     := StrToDate(dbDtaCotaFD.Text);
         ParamByName('DATALIQUIDACAO').AsDateTime   := StrToDate(dbDtaLiqFD.Text);
         // AL_10
         ParamByName('DATACOTIZACAO').AsDateTime    := StrToDate(dbDtaCotizaFD.Text);
         ParamByName('QTDOPERACAO').AsFloat         := QryAuxFD.FieldByName('QTDOPERACAO').AsFloat;
         ParamByName('VLROPERACAO').AsFloat         := QryAuxFD.FieldByName('VLROPERACAO').AsFloat;
         ParamByName('VLRCOTA').AsFloat             := QryAuxFD.FieldByName('VLRCOTA').AsFloat;
         ParamByName('STACONFIRMA').AsString        := 'S';
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
         ExecSQL;
         Close;
      end;

      //AL_26
      If Not AlimentaFundo(iIdTipoInvest, -34,
           QryFundos.FieldByName('IDCARTEIRAINVEST').AsInteger,
           QryFundos.FieldByName('IDFUNDOINVEST').AsInteger,
           iPlanoPrevContab,
           iPatrocinadora,
           iIdOperacaoFundo,iIdOperacaoFundo,
           QryFundos.FieldByName('QTDDECVALOR').AsInteger,
           QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
           iIdForCli,
           StrToDate(dbDtaCotaFD.Text),
           StrToDate(dbDtaCotaFD.Text),
           StrToDate(dbDtaLiqFD.Text),
           QryAuxFD.FieldByName('QTDOPERACAO').AsFloat,
           QryAuxFD.FieldByName('VLRCOTA').AsFloat,
           QryAuxFD.FieldByName('VLROPERACAO').AsFloat,
           0, 0, QryTipoOperFD.FieldByName('NATUREZAOPERACAO').AsString,
           Trim(QryTipoOperFD.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                QryFundos.FieldByName('DESCFUNDOINVEST').AsString,
           'OPE', True,
           iPlanPrevCtbPatro,-1,-1,0{Rendimento}, sMens) Then
       Begin
           //AL_26
           if sMens <> '' then
              MsgDlg('Não foi possível confirmar a Operação' + #13 +
                     'Mensagem: ' + sMens,
                     'Mensagem do Sistema', mtInformation, [MbOk],0)
           else
              MsgDlg('Não foi possível efetuar esta Operação' + #13 +
                     'Ocorreu um problema durante o processo de gravação' + #13 +
                     'Refaça a operação',
                     'Mensagem do Sistema', mtInformation,[MbOk],0);

           Result := False;
           Exit;
       End;

       //Al_18
       If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
            -34,
            QryFundos.FieldByName('IDTIPOINVEST').AsInteger,
            QryFundos.FieldByName('IDCARTEIRAINVEST').AsInteger,
            QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
            iIdForCli,
            QryFundos.FieldByName('IDFUNDOINVEST').AsInteger,
            StrToDate(dbDtaCotaFD.Text),
            StrToDate(dbDtaLiqFD.Text),
            'OPE', QryTipoOperFD.FieldByName('NATUREZAOPERACAO').AsString,
            QryFundos.FieldByName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
            True,
            QryAuxFD.FieldByName('VLROPERACAO').AsFloat,
            0, 0, 0, 0, fVlrCustoAcoes, fVlrVarAcoes, -1,0,0,0,
            QryTipoOperFD.FieldByName('FLGCONTAINVEST').AsInteger) Then
       Begin
          Result := False;
          Exit;
       End;

       // Passa agravar a planilha em algum lugar
       if (iPlanilha > 0) or (iDocumento > 0) then
       begin
          wStr := 'UPDATE OPERACAOFUNDO ' + #13;
          if iPlanilha > 0 then
          begin
             wStr := wStr + 'SET PLANO = ' + IntToStr(iPlano) + ', ' + #13;
             wStr := wStr + '    PLNCODIGO = ' + IntToStr(iPlanilha) + #13;
          end;
          if (iDocumento > 0) and (iPlanilha > 0) then
             wStr := wStr + ',   CODDOCUMENTO = ' + IntToStr(iDocumento) + #13
          else if iDocumento > 0 then
             wStr := wStr + 'SET CODDOCUMENTO = ' + IntToStr(iDocumento) + #13;

          wStr := wStr + 'WHERE IDOPERACAOFUNDO = '+ IntToStr(iIdOperacaoFundo);

          if not ExecutaQuery(QryAux,wStr) then
             Abort;
       end;

   Except
      begin
         MsgDlg('Problema na gravação da Operação dos Fundos.','Mensagem do Sistema',mtInformation,[MbOk],0);
         Result := False;         
      end;
   end;
end;

function TfrmCadLanctoFundoVdAcoes.VendaAcoes:boolean;
//AL_28
Var sMensagem : String;
begin
   Result := True;

   // AL_17
   if not bRelanca then Exit;

   try
      try
         fraMens.Mostra;
         fraMens.Max := qryDetalhe.RecordCount;

         qryDetalhe.First;
         while not qryDetalhe.EOF do
         begin
            fraMens.Mes := 'Aguarde, Efetuando Vendas ' + #13 +
                           QryDetalhe.FieldByName('DESCINVESTIMENTO').AsString;
            //AL_28
            if not GravaVendaAcoes(QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                   QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                   QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger,
                                   QryTipoOperRV.FieldByName('IDMERCADO').AsInteger,
                                   QryFundos.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                   QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger,
                                   QryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger,
                                   dbDtaTransf.Date,
                                   QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat,
                                   QryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                                   QryDetalhe.FieldByName('PRECOUNITOPERACAO').AsFloat,
                                   QryTipoOperRV.FieldByName('FLGTRATAIR').AsString,
                                   QryTipoOperRV.FieldByName('DESCTIPOOPERACAO').AsString,
                                   QryDetalhe.FieldByName('DESCINVESTIMENTO').AsString,
                                   QryTipoOperRV.FieldByName('NATUREZAOPERACAO').AsString,
                                   QryInvestimento.FieldByName('CODTIPOACAO').AsString,sMensagem) then
               Raise Exception.Create(sMensagem);
            qryDetalhe.Next;
            fraMens.Incrementa;
         end;
      except on E: Exception do
         begin
            dtmBaseDados.dbBaseDados.Rollback;
            Result := False;
            MsgDlg('Ocorreu um problema na gravação das operações'+ #13 +
                   E.Message,'Mensagem do Sistema ',mtInformation,[mbOK],0);
         end;
      end;
   finally
      fraMens.Apaga;
   end;
end;

procedure TfrmCadLanctoFundoVdAcoes.sbtnInserirClick(Sender: TObject);
begin
   inherited;

   sbtnImprimir.Enabled  := False;

   bbtnConfirmar.Enabled := False;

   HabilitaIncAltExcDetalhe;

   LimpaCampos;

   if dbDtaTransf.CanFocus then
      dbDtaTransf.SetFocus
   else
   if dblTipoOperRV.CanFocus then
      dblTipoOperRV.SetFocus;

   QryAuxFD.Open;
   QryAuxFD.Edit;

   QryDetalhe.Open;
   
   pnlRV.Enabled     := True;
   pnlFundos.Enabled := True;

   fTotalOperacao := 0;
   bAlteracao     := False;

   sBoleta    := '';
   sBoletaCCI := '';
end;

procedure TfrmCadLanctoFundoVdAcoes.LimpaCampos;
begin
   dblCarteiraRV.Text := '';
   dblCustodiante.Text := '';
   dblAcao.Text := '';
   dblFundo.Text := '';
   lblGestorFundo.Caption := '';
   dbeCotaFD.Text := '';
   dbeQtdFD.Text := '';
   dbDtaTransf.Date := pRPI.DATAULTFECH;
   QryDetalhe.Close;
   QryAuxFD.Close;
end;

procedure TfrmCadLanctoFundoVdAcoes.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   bAlteraDetalhe := False;
   DesabilitaIncAltExcDetalhe;
   DesabilitaBotoesDetalhe;
   LimpaCampos;
   sbtnAlterar.Enabled  := False;
   sbtnApagar.Enabled   := False;
   sbtnImprimir.Enabled := False;
   sbtnInserir.Down := False;
   sbtnAlterar.Down := False;
   qryDetalhe.Close;
   sbtnProcurar.Down := False;
   frmAguarde.Apaga;
   QryAux.Close;
   sBoleta := '';
   sBoletaCCI := '';

   pnlOperacoes.SendToBack;   

   if dtmBaseDados.dbBaseDados.InTransaction then
      DtmBaseDados.dbBaseDados.Rollback;
end;

procedure TfrmCadLanctoFundoVdAcoes.sbtnApagarClick(Sender: TObject);
var
   wBol: String;

   //AL_6
   ftotvlraplicado,
   ftotcotasmovfundo,
   ftotvlrmovfundo,
   ftotsaldoqtdcotas,
   ftotsaldovlrfundo,
   ftotvlrcustoatual  : Extended;

   iIdTipoInvestAtu      : Integer;
   iIdTipoOperacaoAtu    : Integer;
   iIdCarteiraInvestAtu  : Integer;
   iIdFundoInvestAtu     : Integer;
   dDataAplicacaoAtu     : TDateTime;
   dDataMovFundoAtu      : TDateTime;
   sNaturMovFundoAtu     : String;
   sTipMovFundoAtu       : String;
   iIdPlanPrevCtbPatrAtu : Integer;

begin
   // AL_19
   // Verifica dada de RV
   if QryDetalheDATAOPERACAO.AsString <> '' then
   begin
      //AL_24
      if not CtrlInvContab.TestaPeriodo(QryDetalheDATAOPERACAO.AsString, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Exit;
      end;
   end;
   // Verifica data do Fundo
   if QryAuxFDDATAOPERACAO.AsString <> '' then
   begin
      //AL_24
      if not CtrlInvContab.TestaPeriodo(QryAuxFDDATAOPERACAO.AsString, iTipoInvestUsu) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Exit;
      end;
   end;

   //AL_20
   if VerEmAbertura(QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   if qry.FieldByName('IDOPERACAOINVEST').AsInteger <> 0 then
   begin
      if not VerificaFechamentoOperacao(DateToStr(dbDtaTransf.Date)) then
         Exit;
   end;

   // AL_14
   Try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      if qry.FieldByName('IDOPERACAOINVEST').AsInteger <> 0 then
      begin
         // Exclui Vendas de Ações
         if not ExecutaQuery(QryAux,'DELETE FROM OPERINVXOPERFDO WHERE '+
                                    'IDOPERACAOFUNDO = '+qry.FieldByName('IDOPERACAOFUNDO').AsString) then
            Raise Exception.Create('Não foi possível excluir a operação.');

         QryAux.Close;

         if QryDetalhe.Active then
         begin
            QryDetalhe.First;
            wBol := '';
            While Not QryDetalhe.Eof Do
            begin
               if wBol <> QryDetalhe.FieldByName('NUMDOCUMENTO').AsString then
               begin
                  wBol := QryDetalhe.FieldByName('NUMDOCUMENTO').AsString;
                  //AL_30
                  if not RendaVariavel.ExcluiBoleta(wBol, True, True, fraMens) then
                     Raise Exception.Create('Não é possível excluir operação de Venda de Ações. Boleta : '+wBol);
               end;
               QryDetalhe.Next;
            end;
         end;
      end;

      if not QryCompraFundos.FieldByName('IDOPERACAOFUNDO').IsNull then
      begin
         //AL_30
         iIdTipoInvestAtu      := QryCompraFundos.FieldByName('IDTIPOINVEST').AsInteger;
         iIdTipoOperacaoAtu    := QryCompraFundos.FieldByName('IDTIPOOPERACAO').AsInteger;
         iIdCarteiraInvestAtu  := QryCompraFundos.FieldByName('IDCARTEIRAINVEST').AsInteger;
         iIdFundoInvestAtu     := QryCompraFundos.FieldByName('IDFUNDOINVEST').AsInteger;
         dDataAplicacaoAtu     := QryCompraFundos.FieldByName('DATAAPLICACAO').AsDateTime;
         dDataMovFundoAtu      := QryCompraFundos.FieldByName('DATAMOVFUNDO').AsDateTime;
         sNaturMovFundoAtu     := QryCompraFundos.FieldByName('NATURMOVFUNDO').AsString;
         iIdPlanPrevCtbPatrAtu := QryCompraFundos.FieldByName('IDPLANPREVCTBPATR').AsInteger;

         //AL_30
         // Exclui Compra de Fundos
         if not ExcluiCompraFundo(QryCompraFundos.FieldByName('CODDOCUMENTO').AsInteger,
                                  QryCompraFundos.FieldByName('PLNCODIGO').AsInteger,
                                  QryCompraFundos.FieldByName('PLANO').AsInteger,
                                  QryCompraFundos.FieldByName('IDTIPOINVEST').AsInteger,
                                  QryCompraFundos.FieldByName('IDHISTFUNDO').AsInteger,
                                  QryCompraFundos.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                  QryCompraFundos.FieldByName('DATAAPLICACAO').AsDateTime) then
            Raise Exception.Create('Não foi possível excluir a Aplicação do Fundo de Investimento.');

         //AL_6
         {*** INSERE REGISTRO ATU ***}
         DmFundoComum.QryPesqAplicMesmoDia.Close;
         DmFundoComum.QryPesqAplicMesmoDia.ParamByName('IDTIPOINVEST').AsInteger      := iIdTipoInvestAtu;
         DmFundoComum.QryPesqAplicMesmoDia.ParamByName('IDCARTEIRAINVEST').AsInteger  := iIdCarteiraInvestAtu;
         DmFundoComum.QryPesqAplicMesmoDia.ParamByName('IDFUNDOINVEST').AsInteger     := iIdFundoInvestAtu;
         DmFundoComum.QryPesqAplicMesmoDia.ParamByName('DATAAPLICACAO').AsDateTime    := dDataAplicacaoAtu;
         DmFundoComum.QryPesqAplicMesmoDia.ParamByName('DATAMOVFUNDO').AsDateTime     := dDataMovFundoAtu;
         DmFundoComum.QryPesqAplicMesmoDia.ParamByName('NATURMOVFUNDO').AsString      := sNaturMovFundoAtu;
         //AL_29
         DmFundoComum.QryPesqAplicMesmoDia.ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanPrevCtbPatrAtu;
         DmFundoComum.QryPesqAplicMesmoDia.Open;
         DmFundoComum.QryPesqAplicMesmoDia.First;

         if DmFundoComum.QryPesqAplicMesmoDia.RecordCount > 1 then
         begin
            fTotVlrAplicado   := 0;
            fTotCotasMovFundo := 0;
            fTotVlrMovFundo   := 0;
            fTotSaldoQtdCotas := 0;
            fTotSaldoVlrFundo := 0;
            fTotVlrCustoAtual := 0;

            while not (DmFundoComum.QryPesqAplicMesmoDia.Eof) do
            begin
               fTotVlrAplicado   := fTotVlrAplicado   + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('VLRAPLICADO').AsFloat;
               fTotCotasMovFundo := fTotCotasMovFundo + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('COTASMOVFUNDO').AsFloat;
               fTotVlrMovFundo   := fTotVlrMovFundo   + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('VLRMOVFUNDO').AsFloat;
               fTotSaldoQtdCotas := fTotSaldoQtdCotas + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('SALDOQTDCOTAS').AsFloat;
               fTotSaldoVlrFundo := fTotSaldoVlrFundo + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('SALDOVLRFUNDO').AsFloat;
               fTotVlrCustoAtual := fTotVlrCustoAtual + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('VLRCUSTOATUAL').AsFloat;

               DmFundoComum.QryPesqAplicMesmoDia.Next;
            end;

            //AL_30
            // CASO EXISTA MAIS DE UM REGISTRO, FAZ A SOMA DOS DEMAIS E GRAVA NA HISTFUNDO.
            // AL_9
            if not UFundoComum.GravaAplicacaoResgate(DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDTIPOINVEST').AsInteger,
                                                     DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                     DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                     DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                                     DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDFUNDOINVEST').AsInteger,
                                                     DmFundoComum.QryPesqAplicMesmoDia.FieldByName('DATAAPLICACAO').AsDateTime,
                                                     DmFundoComum.QryPesqAplicMesmoDia.FieldByName('DATAMOVFUNDO').AsDateTime,
                                                     DmFundoComum.QryPesqAplicMesmoDia.FieldByName('DATAULTPGTOIR').AsDateTime,
                                                     DmFundoComum.QryPesqAplicMesmoDia.FieldByName('HISTMOVFUNDO').AsString,
                                                     DmFundoComum.QryPesqAplicMesmoDia.FieldByName('NATURMOVFUNDO').AsString,
                                                     'ATU',
                                                     fTotVlrAplicado,
                                                     fTotVlrMovFundo,
                                                     0,
                                                     0,
                                                     0,
                                                     fTotCotasMovFundo,
                                                     fTotSaldoQtdCotas,
                                                     fTotSaldoVlrFundo,
                                                     (fTotSaldoVlrFundo / fTotSaldoQtdCotas),
                                                     fTotVlrCustoAtual,
                                                     DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                     -1,
                                                     DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDCOMPOSICAOFUNDO').AsInteger,
                                                     DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDTIPOCOTA').AsInteger) then
               Raise Exception.Create('Não foi possível Atualizar o registro ATU para essa Operação do Fundo de Investimento.');
         end;

         DmFundoComum.QryPesqAplicMesmoDia.Close;
         //AL_6
      end;

      GravaEmAbertura(QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger,'N');

      //AL_30
      if DtmBaseDados.dbBaseDados.InTransaction then
         DtmBaseDados.dbBaseDados.Commit;

      // AL_7
      QryTipoFundoInvest.Close;
      QryTipoFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryTipoFundoInvest.Open;

      If StrToDate(dbDtaCotaFD.Text) <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
      begin
         //AL_30
         If Not Reprocessamento(iTipoInvestUsu,
                                QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                QryFundos.FieldByName('IDFUNDOINVEST').AsInteger,
                                iPlanPrevCtbPatro,
                                StrToDate(dbDtaCotaFD.Text),
                                QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                QryFundos.FieldByName('DTAINIPROC').AsDateTime,
                                True) Then
            Raise Exception.Create('Atenção : Nao foi possível efetuar o Reprocessamento para esse Fundo de Investimento.');
      end;

      MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema', MtWarning,[MbOk],0);
      // AL_7

   Except
      //AL_30
      on E: Exception do
      begin
         if DtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg(E.Message, 'Mensagem do Sistema ',mtWarning,[mbOK],0);
      end;
   end;
   // AL_14 - Fim

   sbtnInserir.Enabled  := True;
   sbtnProcurar.Enabled := True;
   sbtnAlterar.Enabled  := False;
   sbtnApagar.Enabled   := False;
   sbtnImprimir.Enabled := False;
   
   LimpaCampos;

   sbtnApagar.Down      := False;
end;

procedure TfrmCadLanctoFundoVdAcoes.sbtnProcurarClick(Sender: TObject);
var
   sSql : string;
   i,iIdOperacaoFundo : integer;
begin
   try
      inherited;
      LimpaCampos;
      if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
      begin
         iIdOperacaoFundo := StrToInt(MontaSelect.ValoresChave[0]);
         qry.Close;
         qry.ParamByName('IDOPERACAOINVEST').Clear;
         qry.ParamByName('IDOPERACAOFUNDO').AsInteger := iIdOperacaoFundo;
         qry.Open;
         // AL_14
         if not qry.isEmpty then
         begin
            sIdOperacaoInvest := '';
            i := 0;
            while not qry.EOF do
            begin
               sIdOperacaoInvest := sIdOperacaoInvest + IntToStr(qry.FieldByName('IDOPERACAOINVEST').AsInteger);
               i := i + 1;
               if i <> qry.RecordCount then
               begin
                  sIdOperacaoInvest := sIdOperacaoInvest +',';
               end;
               qry.Next;
            end;

            AbreCompras(sIdOperacaoInvest);

            if not QryVendaAcao.IsEmpty then
            begin
               QryDetalhe.Close;
               QryDetalhe.Open;
               while not QryVendaAcao.EOF do
               begin
                  //AL_13
                  // Capta as boletas existentes (CCI e Normal)
                  if QryVendaAcao.FieldByName('FLGCONTAINVEST').AsInteger = 0 then
                     sBoleta := QryVendaAcao.FieldByName('NUMDOCUMENTO').AsString
                  else
                     sBoletaCCI := QryVendaAcao.FieldByName('NUMDOCUMENTO').AsString;

                  QryDetalhe.Append;
                  QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger   := QryVendaAcao.FieldByName('IDINVESTIMENTO').AsInteger;
                  QryDetalhe.FieldByName('DATAOPERACAO').AsDateTime    := QryVendaAcao.FieldByName('DATAOPERACAO').AsDateTime;
                  QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat       := QryVendaAcao.FieldByName('QTDEOPERACAO').AsFloat;
                  QryDetalhe.FieldByName('PRECOUNITOPERACAO').AsFloat  := QryVendaAcao.FieldByName('PRECOUNITOPERACAO').AsFloat;
                  QryDetalhe.FieldByName('DATAVENCOPER').AsDateTime    := QryVendaAcao.FieldByName('DATAVENCOPER').AsDateTime;
                  QryDetalhe.FieldByName('VLROPERACAO').AsFloat        := QryVendaAcao.FieldByName('VLROPERACAO').AsFloat;
                  QryDetalhe.FieldByName('NUMDOCUMENTO').AsString      := QryVendaAcao.FieldByName('NUMDOCUMENTO').AsString;
                  QryDetalhe.FieldByName('DESCTIPOOPERACAO').AsString  := QryVendaAcao.FieldByName('DESCTIPOOPERACAO').AsString;
                  QryDetalhe.FieldByName('ID').AsString                := QryVendaAcao.FieldByName('ID').AsString;
                  QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger := QryVendaAcao.FieldByName('IDCARTEIRAINVEST').AsInteger;
                  QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger := QryVendaAcao.FieldByName('IDCARTEIRAGERENC').AsInteger;
                  QryDetalhe.FieldByName('DESCCARTINVEST').AsString    := QryVendaAcao.FieldByName('DESCCARTINVEST').AsString;
                  QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger    := QryVendaAcao.FieldByName('IDCUSTODIANTE').AsInteger;
                  QryDetalhe.FieldByName('IDOPERACAOINVEST').AsInteger := QryVendaAcao.FieldByName('IDOPERACAOINVEST').AsInteger;
                  QryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger   := QryVendaAcao.FieldByName('IDTIPOOPERACAO').AsInteger;
                  QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger     := QryVendaAcao.FieldByName('IDTIPOINVEST').AsInteger;
                  QryDetalhe.Post;
                  QryVendaAcao.Next;
               end;
               QryDetalhe.First;
            end;

            pnlOperacoes.SendToBack;

         end;
         // AL_14 - Fim

         with QryCompraFundos do
         begin
            Close;
            ParamByName('IDOPERACAOFUNDO').AsInteger := iIdOperacaoFundo;
            Open;
            if IsEmpty then
            begin
               LimpaCampos;
               Exit;
            end;
         end;
         //AL_30
         dbDtaTransf.Date       := QryCompraFundos.FieldByName('DATAOPERACAO').AsDateTime;
         dblFundo.Text          := QryCompraFundos.FieldByName('DESCFUNDOINVEST').AsString;
         lblGestorFundo.Caption := QryCompraFundos.FieldByName('NOME').AsString;
         QryAuxFD.Open;
         QryAuxFD.Edit;
         QryAuxFD.FieldByName('VLROPERACAO').AsFloat     := QryCompraFundos.FieldByName('VLRMOVFUNDO').AsFloat;
         QryAuxFD.FieldByName('QTDOPERACAO').AsFloat     := QryCompraFundos.FieldByName('COTASMOVFUNDO').AsFloat;
         //AL_30
         QryAuxFD.FieldByName('DATAOPERACAO').AsString   := QryCompraFundos.FieldByName('DATAOPERACAO').AsString;
         QryAuxFD.FieldByName('DATALIQUIDACAO').AsString := QryCompraFundos.FieldByName('DATALIQUIDACAO').AsString;
         // AL_10
         QryAuxFD.FieldByName('DATACOTIZACAO').AsString  := QryCompraFundos.FieldByName('DATACOTIZACAO').AsString;
         QryAuxFD.FieldByName('VLRCOTA').AsFloat         := QryCompraFundos.FieldByName('VLRCOTA').AsFloat;

         dblFundo.LookupValue := QryCompraFundos.FieldByName('IDFUNDOINVEST').AsString;

         with QryTipoFundoInvest do
         begin
            Close;
            ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
            Open;
            iIdTipoInvest := QryTipoFundoInvest.FieldByName('IDTIPOINVEST').AsInteger;;
            Close;
         end;

         sbtnInserir.Enabled  := False;
         sbtnAlterar.Enabled  := True;
         sbtnApagar.Enabled   := True;
         bbtnCancelar.Enabled := True;
         //AL_29
         dbgOperacao.Enabled  := False;
         pnlFundos.Enabled    := False;
         sbtnImprimir.Enabled := True;
      end
      Else If QryDetalhe.IsEmpty Then
      Begin
         sbtnInserir.Enabled  := True;
         sbtnProcurar.Enabled := True;
         sbtnAlterar.Enabled  := False;
         sbtnApagar.Enabled   := False;
         sbtnImprimir.Enabled := False;
      End;
   finally
      sbtnProcurar.Down := False;
   end;
end;

procedure TfrmCadLanctoFundoVdAcoes.HabilitaIncAltExcDetalhe;
begin
   BtIncDet.Enabled    := True;
   BtIncDet.Down       := False;
   if qryDetalhe.IsEmpty then
   begin
      BtAltDet.Enabled    := False;
      BtAltDet.Down       := True;
      BtDelDet.Enabled    := False;
      BtDelDet.Down       := True;
   end
   else
   begin
      BtAltDet.Enabled    := True;
      BtAltDet.Down       := False;
      BtDelDet.Enabled    := True;
      BtDelDet.Down       := False;
   end;
end;

procedure TfrmCadLanctoFundoVdAcoes.DesabilitaIncAltExcDetalhe;
begin
   BtAltDet.Enabled   := False;
   BtDelDet.Enabled   := False;
   BtIncDet.Enabled   := False;
   BtAltDet.Down      := True;
   BtDelDet.Down      := True;
   BtIncDet.Down      := True;
end;

procedure TfrmCadLanctoFundoVdAcoes.HabilitaBotoesDetalhe;
Begin
   BtOkDet.Enabled      := True;
   BtCancDet.Enabled    := True;
   BtVoltaDet.Enabled   := True;
End;

procedure TfrmCadLanctoFundoVdAcoes.DesabilitaBotoesDetalhe;
begin
   BtOkDet.Enabled      := False;
   BtCancDet.Enabled    := False;
   BtVoltaDet.Enabled   := False;
end;

procedure TfrmCadLanctoFundoVdAcoes.BtIncDetClick(Sender: TObject);
begin
  inherited;
   DesabilitaIncAltExcDetalhe;
   if bAlteracao then
      bAlteracaoInc := True;

   sbtnImprimir.Enabled  := False;
   bbtnConfirmar.Enabled := False;

   HabilitaBotoesDetalhe;
   HabilitaGridDetalhe;

   sDataOpe       := QryDetalhe.FieldByName('DATAOPERACAO').AsString;
   sDataLiq       := QryDetalhe.FieldByName('DATAVENCOPER').AsString;
   iIdCarteira    := QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger;
   iIdCustodiante := QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger;

   pnlOperacoes.BringToFront;

   pnlFundos.Enabled := False;   

   try
      QryDetalhe.Append;
   except
      on E: Exception do
         MsgDlg(E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
   end;

   if iIdCarteira <> 0 then
   begin
      QryCarteiraRV.Locate('IDCARTEIRAINVEST',iIdCarteira,[]);
      qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger := iIdCarteira;
      dblCarteiraRV.LookupValue := QryCarteiraRV.FieldByName('IDCARTEIRAINVEST').AsString;
   end;
   if iIdCustodiante <> 0 then
   begin
      QryCustodiante.Locate('IDCUSTODIANTE',iIdCustodiante,[]);
      qryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger := iIdCustodiante;
      dblCustodiante.LookupValue := QryCustodiante.FieldByName('IDCUSTODIANTE').AsString;
   end;
   if Trim(sDataOpe) <> '' then
      qryDetalhe.FieldByName('DATAOPERACAO').AsString := sDataOpe
   else
      qryDetalhe.FieldByName('DATAOPERACAO').AsString := dbDtaTransf.Text;

   if Trim(sDataLiq) <> '' then
      qryDetalhe.FieldByName('DATAVENCOPER').AsString := sDataLiq
   else
      qryDetalhe.FieldByName('DATAVENCOPER').AsString := dbDtaTransf.Text;

   if dblCarteiraRV.CanFocus then
      dblCarteiraRV.SetFocus;

end;

procedure TfrmCadLanctoFundoVdAcoes.BtAltDetClick(Sender: TObject);
begin
  inherited;
   if bAlteracao then
   begin
      bAlteracaoAlt := True;
      iIdOperacaoInvest := QryDetalhe.FieldByName('IDOPERACAOINVEST').AsInteger;
   end;
   sbtnImprimir.Enabled := False;

   HabilitaBotoesDetalhe;
   HabilitaGridDetalhe;
   QryDetalhe.Edit;
   pnlOperacoes.BringToFront;
   bAlteraDetalhe := True;
   fVlrOperacao   := qryDetalhe.FieldByName('VLROPERACAO').AsFloat;
end;

procedure TfrmCadLanctoFundoVdAcoes.BtDelDetClick(Sender: TObject);
begin
  inherited;
   if MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,[mbYes, mbNo],0) = mrYes then
   begin
      HabilitaBotoesDetalhe;
      if bAlteracao then
         bAlteracaoExc := True;
      // AL_19 - Inicio
      Try
         //AL_24
         if not CtrlInvContab.TestaPeriodo(QryDetalheDATAOPERACAO.AsString, 2) then
            Raise Exception.Create(CtrlInvContab.MessageInfo);

         ExcluiVenda;
         
         fTotalOperacao := fTotalOperacao - qryDetalhe.FieldByName('VLROPERACAO').AsFloat;
         QryAuxFD.FieldByName('VLROPERACAO').AsFloat := fTotalOperacao;

         iIdOperacaoInvest := QryDetalhe.FieldByName('IDOPERACAOINVEST').AsInteger;

         QryDetalhe.Delete;
         
         BtDelDet.Down := False;

         bbtnConfirmar.Enabled := False;
         if qryDetalhe.RecordCount > 0 then
            bbtnConfirmar.Enabled := True;

      except
         on E: Exception do
         begin
            MsgDlg('Não foi possível excluir a Operação:' + #13 +
                   E.Message, 'Mensagem do Sistema ', mtInformation, [mbOK], 0);

           QryDetalhe.Cancel;
                              
            bbtnConfirmar.Enabled := False;
            if qryDetalhe.RecordCount > 0 then
               bbtnConfirmar.Enabled := True;

            Exit;
         end;
      end;
      // AL_19 - Fim
      if qryDetalhe.IsEmpty then
      begin
         BtDelDet.Enabled := False;
         BtAltDet.Enabled := False;
      end;
   end;
end;

procedure TfrmCadLanctoFundoVdAcoes.BtCancDetClick(Sender: TObject);
begin
   qryDetalhe.Cancel;
  inherited;
   HabilitaIncAltExcDetalhe;
   DesabilitaBotoesDetalhe;
   pnlOperacoes.SendToBack;
   if qryDetalhe.RecordCount > 0 then
   begin
      bbtnConfirmar.Enabled := True;
      pnlFundos.Enabled     := True;
   end;             
end;

function TfrmCadLanctoFundoVdAcoes.CalculaValorRV:Double;
begin
   Result := 0;
   with qryDetalhe do
   begin
      if (FieldByName('QTDEOPERACAO').AsFloat <> 0) and
         (FieldByName('PRECOUNITOPERACAO').AsFloat <> 0) then
      begin
         Result := (FieldByName('QTDEOPERACAO').AsFloat * FieldByName('PRECOUNITOPERACAO').AsFloat);
         FieldByName('VLROPERACAO').AsFloat := Result;
      end;
   end;
end;

procedure TfrmCadLanctoFundoVdAcoes.BuscaCotacaoRV;
begin
   inherited;
   if qryDetalhe.FieldByName('PRECOUNITOPERACAO').AsFloat = 0 then
   begin
      //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
      QryCotacaoInvest.Close;
      QryCotacaoInvest.ParamByName('iIdInvestimento').AsInteger := QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
      QryCotacaoInvest.Open;
         
      if (qryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger <>  0) and
         (Trim(qryDetalhe.FieldByName('DATAOPERACAO').AsString) <> '') then
         qryDetalhe.FieldByName('PRECOUNITOPERACAO').AsFloat :=
                    OperComum.BuscaCotacaoAcao(qryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger,
                                               qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime, True);
   end;
end;

procedure TfrmCadLanctoFundoVdAcoes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadLanctoFundoVdAcoes.BtOkDetClick(Sender: TObject);
begin
  inherited;

   if (bAlteracao) and (bAlteracaoExc) and (QryDetalhe.IsEmpty) then // Não permite excluir o último registro do detalhe >> Tem que excluir a operação toda
   begin
      MsgDlg('A operação não pode ser excluida.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      bbtnConfirmar.Enabled := False;
      Exit;
   end;

   // AL_19
   // Verifica dada de RV
   //AL_24
   if not CtrlInvContab.TestaPeriodo(QryDetalheDATAOPERACAO.AsString, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      bbtnConfirmar.Enabled := False;
      Exit;
   end;

   // AL_32
   // AL_31
   // Verifica se existem Transferência entre planos posterior a data a ser transferida
   {If ufundocomum.VerificaTranferenciaPlanos( iTipoInvestUsu,
                                              QryInvestimento.FieldByName('IDFUNDOINVEST').AsInteger,
                                              iPlanPrevCtbPatro,
                                              dbDDataOperacao.Date) then
   Begin
      MsgDlg('Já há Lançamentos de Transferências entre planos para o Fundo com data superior a data de operação'+'.'#13+
             'A operação não será efetuada!','Mensagem do Sistema',mtWarning,[mbOk],0);

      Exit;
   End; // Fim AL_31 }

   if (QryDetalhe.State = DsInsert) or (QryDetalhe.State = DsEdit) then
   begin
      QryDetalhe.FieldByName('ID').AsString := QryCarteiraRVID.AsString;
      QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger := QryCarteiraRVIDCARTEIRAINVEST.AsInteger;
      QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger := QryCarteiraRVIDCARTEIRAGERENC.AsInteger;
      QryDetalhe.FieldByName('DESCCARTINVEST').AsString    := QryCarteiraRVDESCCARTINVEST.AsString;

      if QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger <= 0 then
      begin
         BuscaSaldosCustodia;

         if not VerificaSaldoLiberadoRV then
         begin
            BtIncDet.Down := False;
            bAlteracaoInc := False;
            bAlteracaoAlt := False;
            bAlteracaoExc := False;
            Exit;
         end;
      end;
      // Verifica os campos da principal e da detalhe
      if not VerificaDadosRV then
      begin
         BtIncDet.Down := False;
         bAlteracaoInc := False;
         bAlteracaoAlt := False;
         bAlteracaoExc := False;
         Exit;
      end;
      Try
         if QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger <= 0 then
         begin
            if QryDetalhe.State = DsInsert then
            begin
               fTotalOperacao := fTotalOperacao + qryDetalhe.FieldByName('VLROPERACAO').AsFloat;
               QryAuxFD.FieldByName('VLROPERACAO').AsFloat := fTotalOperacao;
            end;
            if QryDetalhe.State = DsEdit then
            begin
               fTotalOperacao := fTotalOperacao - fVlrOperacao + qryDetalhe.FieldByName('VLROPERACAO').AsFloat;
               QryAuxFD.FieldByName('VLROPERACAO').AsFloat := fTotalOperacao;
               pnlOperacoes.SendToBack;
               DesabilitaBotoesDetalhe;
            end;
         end;

         QryDetalhe.Post;

         if (bAlteracao) and ((bAlteracaoAlt) or (bAlteracaoInc)) then
         begin
            if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;
            try
               // AL_12
               // AL_15
               // A rotina ExcluiVenda passa a excluir todas as operações e o relançamento
               // será feito sempre como se fosse inclusão
               if bAlteracaoAlt then
                  ExcluiVenda;

            except
               on E: Exception do
               begin
                  DtmBaseDados.dbBaseDados.Rollback;
                  MsgDlg('Ocorreu problema na operação ...'+
                         #13+E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
               end;
            end;
         end
         else
            // AL_19 - Sempre lança no OK final na Inclusão
            bRelanca := True;

         HabilitaIncAltExcDetalhe;

         bbtnConfirmar.Enabled := True;

         pnlFundos.Enabled     := True;

      except
        QryDetalhe.Cancel;
        LimpaCampos;
        bAlteracaoInc := False;
        bAlteracaoAlt := False;
        bAlteracaoExc := False;
        bAlteraDetalhe:= True;

        if qryDetalhe.RecordCount > 0 then
        begin
           bbtnConfirmar.Enabled := True;
           pnlFundos.Enabled     := True;
        end;   
      end;
   end;

   pnlOperacoes.SendToBack;

   bAlteracaoInc := False;
   bAlteracaoAlt := False;
   bAlteracaoExc := False;

end;

procedure TfrmCadLanctoFundoVdAcoes.BtVoltaDetClick(Sender: TObject);
begin
  inherited;
   qryDetalhe.Cancel;
   HabilitaIncAltExcDetalhe;
   DesabilitaBotoesDetalhe;
   pnlOperacoes.SendToBack;

   if qryDetalhe.RecordCount > 0 then
   begin
      bbtnConfirmar.Enabled := True;
      pnlFundos.Enabled     := True;
   end;

end;

function TfrmCadLanctoFundoVdAcoes.OperInvesXOperFundo : boolean;
begin
   Result         := True;
   fraMens.Mostra;
   fraMens.Pos := 0;
   fraMens.Max := qryDetalhe.RecordCount;
   fraMens.Mes := 'Aguarde, Processando...';
   try
      Try
         qryDetalhe.First;
         while not qryDetalhe.EOF do
         begin
            with QryInsOperInvXOperFdo do
            begin
               Close;
               ParamByName('IDOPERACAOINVEST').AsInteger  := qryDetalhe.FieldByName('IDOPERACAOINVEST').AsInteger;
               ParamByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundo;
               ParamByName('DATAOPERACAO').AsDateTime     := StrToDate(dbDtaTransf.Text);
               ExecSQL;
               Close;
            end;
            qryDetalhe.Next;
            fraMens.Incrementa;
         end;
      except
         on E: Exception do
         begin
            Result := False;
            MsgDlg('Ocorreu problema na operação ...'+
                   #13+E.Message,'Mensagem do Sistema ',mtInformation,[mbOK],0);
         end;
      end;
   finally
      fraMens.Apaga;
   end;
end;

procedure TfrmCadLanctoFundoVdAcoes.bbtnSairClick(Sender: TObject);
begin
  inherited;
    frmAguarde.Apaga;
end;

procedure TfrmCadLanctoFundoVdAcoes.sbtnAlterarClick(Sender: TObject);
begin
  inherited;

    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;
    bAlteracao := True;
    sbtnImprimir.Enabled := False;
    dbgOperacao.Enabled  := True;
    pnlFundos.Enabled    := True;
    HabilitaIncAltExcDetalhe;
    pnlOperacoes.SendToBack;
    fTotalOperacao       := QryAuxFD.FieldByName('VLROPERACAO').AsFloat;
    sbtnAlterar.Enabled  := False;
    // AL_19
    if QryDetalhe.State = dsInactive then
       QryDetalhe.Open;

    QryDetalhe.Open;
end;

procedure TfrmCadLanctoFundoVdAcoes.sbtnImprimirClick(Sender: TObject);
var
   fQtdTotal, fVlrTotal : Double;
begin
   try
      inherited;
      with QryDetalhe do
      begin
         DisableControls;
         fQtdTotal := 0;
         fVlrTotal := 0;
         First;
         while not EOF do
         begin
            fVlrTotal := fVlrTotal + QryDetalhe.FieldByName('VLROPERACAO').AsFloat;
            Next;
         end;
         First;
         EnableControls;
      end;

      DmRelatoriosFundo.rptVdAcoesCpFundoslblFundo.Caption         := dblFundo.Text;
      DmRelatoriosFundo.rptVdAcoesCpFundoslblCota.Caption          := FormatFloat('###,###,##0.000000000',QryAuxFD.FieldByName('VLRCOTA').AsFloat)+' ';
      DmRelatoriosFundo.rptVdAcoesCpFundoslblDtaCota.Caption       := QryAuxFD.FieldByName('DATAOPERACAO').AsString;
      DmRelatoriosFundo.rptVdAcoesCpFundoslblVlrAplicado.Caption   := FormatFloat('###,###,##0.00',QryAuxFD.FieldByName('VLROPERACAO').AsFloat)+' ';
      DmRelatoriosFundo.rptVdAcoesCpFundoslblQuantidade.Caption    := FormatFloat('###,###,###0.000000000',QryAuxFD.FieldByName('QTDOPERACAO').AsFloat)+' ';
      DmRelatoriosFundo.rptVdAcoesCpFundoslblGestor.Caption        := lblGestorFundo.Caption;
      DmRelatoriosFundo.rptVdAcoesCpFundoslblSumVlrOperado.Caption := FormatFloat('###,###,##0.00',fVlrTotal)+' ';

      //AL_29
      DmRelatoriosFundo.ppBDEVdAcoesCpFundos.datasource := frmCadLanctoFundoVdAcoes.dsDetalhe;

      QryDetalhe.DisableControls;

      TfrmPreview.CreateModalPreview(Application,
                                     DmRelatoriosFundo.rptVdAcoesCpFundos,
                                     DmRelatoriosFundo.rptVdAcoesCpFundos.PrinterSetup.DocumentName);

      QryDetalhe.EnableControls;
   finally
      sbtnImprimir.Down := False;
   end;
end;

function TfrmCadLanctoFundoVdAcoes.ExcluiCompraFundo(iCodDocumento,iPlnCodigo,iPlano,
                                                     iTipoInvest,iIdHistFundo,iIdOperacaoFundo:integer;
                                                     dDtaAplic:TDateTime):boolean;
begin
    Result := True;
   //AL_30
   if iIdHistFundo > 0 then
   begin
      wStr :='DELETE FROM HISTFUNDO WHERE IDHISTFUNDO = '+ IntToStr(iIdHistFundo);

      if not ExecutaQuery(QryAux,wStr) then
      begin
         MsgDlg('Não foi possível excluir o Histórico da operação do Fundo de Investimento.','Mensagem do Sitema',mtInformation,[mbOk],0);
         Result := False;
         Exit;
      end;
      QryAux.Close;
   end;

   //AL_30
   if iIdOperacaoFundo > 0 then
   begin
      wStr := 'SELECT IDOPERACAOORIGEM FROM OPERACAOFUNDO WHERE IDOPERACAOORIGEM = ' + IntToStr(iIdOperacaoFundo);
      if FazQuery(QryAux,wStr) then
      begin
         MsgDlg('Existe operação lançada para essa aplicação no Fundo de Investimento.'+#13+
                'Não é possível efetuar a exclusão para relançar a operação.','Mensagem do Sistema',mtInformation,[mbOk],0);
         Result := False;
         Exit;
      end;
      QryAux.Close;

      wStr := 'DELETE FROM OPERACAOFUNDO WHERE IDOPERACAOFUNDO = ' + IntToStr(iIdOperacaoFundo);
      if not ExecutaQuery(QryAux,wStr) then
      begin
         MsgDlg('Não foi possível excluir a Operação do Fundo de Investimento.','Mensagem do Sistema',mtInformation,[mbOk],0);
         Result := False;
         Exit;
      end;
      QryAux.Close;
   end;

   //AL_30
   if not ProcExcluiFundo(iCodDocumento,iPlnCodigo,iPlano,iTipoInvest,dDtaAplic,True) Then
   begin
      MsgDlg('Não foi possível excluir a integração Contábil e Financeira.','Mensagem do Sistema',mtInformation,[mbOk],0);
      Result := False;
   end;

end;

//AL_28
function TfrmCadLanctoFundoVdAcoes.GravaVendaAcoes(iIdCarteiraInvest,iIdCarteiraGerenc,
                                                   iIdInvestimento,iIdMercado,iIdGestor,
                                                   iIdCustodiante, iIdTipoOper: Integer;
                                                   dDataTrasf:TDateTime;
                                                   fQtdOper,fVlrOper,fPUOper:Double;
                                                   sFlagIR,sDescTipoOper,sDescInvestimento,
                                                   sNatuOper,sCodTipoAcao : string;
                                                   var sMensagem : String) : boolean;
begin
   Result := True;

   Try
      // AL_5
      // Gera numero da boleta de Renda Variável
      if not QryTipoOperRV.Locate('IDTIPOOPERACAO', iIdTipoOper, []) then
         Raise Exception.Create('Não foi possível encontrar o Tipo de operação correto');

      if (QryTipoOperRVFLGCONTAINVEST.AsInteger = 0) and (sBoleta = '') then
      begin
         sBoleta := 'RV-'+Copy(DateToStr(dDataTrasf),9,2)+'/'+FormatFloat('0000',
                          LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(DateToStr(dDataTrasf),9,2)));

         with dmRendaVariavel.qryInsBoleta  do
         begin
            OperComum.LimpaParametros(dmRendaVariavel.qryInsBoleta, True);
            ParamByName('IDBOLETA').AsString     := sBoleta;
            ParamByName('STATUS').AsString       := 'F';
            ParamByName('DATABOLETA').AsDateTime := dDataTrasf;
            ParamByName('TIPMOVBOLETA').AsString := 'OPE';
            ExecSQL;
         end;
      end
      else
      if (QryTipoOperRVFLGCONTAINVEST.AsInteger = 1) and (sBoletaCCI = '') then
      begin
         sBoletaCCI := 'RV-'+Copy(DateToStr(dDataTrasf),9,2)+'/'+FormatFloat('0000',
                             LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(DateToStr(dDataTrasf),9,2)));

         with dmRendaVariavel.qryInsBoleta  do
         begin
            OperComum.LimpaParametros(dmRendaVariavel.qryInsBoleta, True);
            ParamByName('IDBOLETA').AsString     := sBoletaCCI;
            ParamByName('STATUS').AsString       := 'F';
            ParamByName('DATABOLETA').AsDateTime := dDataTrasf;
            ParamByName('TIPMOVBOLETA').AsString := 'OPE';
            ExecSQL;
         end;
      end;
      // AL_5 - Fim

      //AL_1
      //AL_2
      //AL_21
      //AL_22
      //AL_23
      // Busca Saldos do Investimento      
      OperComum.BuscaTodosSaldosInvestLote(
         iIdCarteiraInvest,
         iIdCarteiraGerenc,
         iIdInvestimento,
         9999999, -1,
         '',
         DateToStr(dDataTrasf), -1,
         wSaldoQtd,         wSaldoVlr,    wSaldoInutil, wSaldoInutil, wSaldoAqui,
         wSaldoInutil,      wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
         wSaldoIRApu,       wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
         wSaldoInutil,      wSaldoInutil, wSaldoCPMF  , wSaldoInutil);

      //AL_21
      //AL_23
      // Capta o Saldo CCI ou Normal      
      if QryTipoOperRVFLGCONTAINVEST.AsInteger = 0 then
         wSaldoQtd := wSaldoCPMF
      else
         wSaldoQtd := wSaldoQtd - wSaldoCPMF;

      // Calcula IR da Operação
      fVlrRendimento := 0;
      fVlrIR :=  Impostos.CalculaIr(2,iIdInvestimento,iIdCarteiraInvest,iIdCarteiraGerenc,-35,iIdMercado,
                       '',dDataTrasf, dDataTrasf,fQtdOper,fVlrOper,0,'S',sFlagIR,
                       fVlrRendimento);

      // Verifica se existe provisionamento de IR
      if Impostos.BuscaProvisaoIR(2,iIdInvestimento) then
         fVlrIRProv := (OperComum.DivValorZero(wSaldoIRApu,wSaldoQtd)* fQtdOper)* -1;

      // Busca o Fornecedor / Cliente
      iIdForCli := OperComum.BuscaForCli(2,iIdGestor,-35, pRPI.IDTIPOCLIENTEEMI);
      //AL_28
      if iIdForCli = 0 then
         Raise Exception.Create('Não foi encontrado o Fornecedor / Cliente para o Investimento.');

      // Grava na OPERACAOINVEST
      with QryInsOperacaoinvest do
      begin
         OperComum.LimpaParametros(QryInsOperacaoinvest, True);
         iIdOperacaoInvest := LeUltRegistro(nil,'OPERACAOINVEST');
         ParamByName('IDOPERACAOINVEST').AsInteger  := iIdOperacaoInvest;
         ParamByName('IDCORRETVALORES').Clear;
         ParamByName('MOECODIGO').AsInteger         := pRPI.MOECODIGO;
         ParamByName('IDMODULO').AsInteger          := Sistema.IdModulo;
         ParamByName('EMPRESAPROP').AsInteger       := Sistema.IdEmpresa;
         ParamByName('IDINVESTIMENTO').AsInteger    := iIdInvestimento;
         ParamByName('IDCARTEIRAINVEST').AsInteger  := iIdCarteiraInvest;
         if iIdCarteiraGerenc > 0 then
            ParamByName('IDCARTEIRAGERENC').AsInteger  := iIdCarteiraGerenc;
         ParamByName('IDTIPOINVEST').AsInteger      := 2;
         ParamByName('IDTIPOOPERACAO').AsInteger    := iIdTipoOper;
         ParamByName('DATAOPERACAO').AsDateTime     := dDataTrasf;
         // AL_5
         ParamByName('NUMDOCUMENTO').AsString       := OperComum.IIF(QryTipoOperRVFLGCONTAINVEST.AsInteger = 0, sBoleta, sBoletaCCI);
         ParamByName('QTDEOPERACAO').AsFloat        := fQtdOper;
         ParamByName('PRECOUNITOPERACAO').AsFloat   := fPUOper;
         ParamByName('VLROPERACAO').AsFloat         := fVlrOper;
         ParamByName('DATAVENCOPER').AsDateTime     := dDataTrasf;
         ParamByName('IDFORCLI').AsInteger          := iIdForCli;
         ParamByName('IDLOTE').AsString             := '';
         ParamByName('IDCUSTODIANTE').AsInteger     := iIdCustodiante;
         ParamByName('VLRIR').AsFloat               := fVlrIr;
         ParamByName('FLGSTATUSFECHBOL').AsString   := 'F';
         ParamByName('FLGSTATUSORDMOV').AsString    := 'L';
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
         ExecSQL;
         Close;
      end;

      QryDetalhe.Edit;
      QryDetalhe.FieldByName('IDOPERACAOINVEST').AsInteger := iIdOperacaoInvest;
      QryDetalhe.FieldByName('NUMDOCUMENTO').AsString := OperComum.IIF(QryTipoOperRVFLGCONTAINVEST.AsInteger = 0, sBoleta, sBoletaCCI);
      QryDetalhe.Post;

      //AL_28
      // Grava o IR Litigio
      if not Impostos.GravaIrLitigio(2,
                     StrToDate(dbDtaTransf.Text), iIdOperacaoInvest,
                     sDescTipoOper+' / '+sDescInvestimento,
                     iIdInvestimento,iPlanoPrevContab,iPatrocinadora,fVlrIR,
                     fVlrRendimento) then
         Raise Exception.Create('Problema na gravação do Ir Litigio.');

      //AL_28

      // Grava Operação 'OPE'
      fVlrOperacao := fVlrOper;

      //Al_04

      //AL_28
      if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo, iIdInvestimento, 2,
                                        iIdOperacaoInvest, -1, iIdTipoOper,
                                        iIdCarteiraInvest, iIdCarteiraGerenc,
                                        -1, -1, -1, -1, -1, StrToDate(dbDtaTransf.Text),
                                        fVlrOperacao, fQtdOper, pRPI.VLRCOTAINICART, 0 , 0, fVlrIRProv,
                                        fVlrIR, 0, 0, 0, 0, 0,
                                        sNatuOper,sNatuOper,
                                        '',sDescTipoOper+' / '+sDescInvestimento,'OPE',
                                        '1', '', True,-1, iPlanPrevCtbPatro, iIdHistCartInv) then
         Raise Exception.Create('Problema ao Alimentar Carteira, os dados desta operação serão perdidos.');

      //AL_28
      // Atualiza Saldos 'OPE'
      if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         Raise Exception.Create('Problema ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                                'esta Operação não poderá ser confirmada.'#13+
                                'Verificar o Saldo!');
      // AL_16 - Fim

      if iIdCarteiraGerenc <= 0 then  // pode ser 0 ou -1
      begin
         //AL_28
         // Grava Custodia
         if not OperacaoInvest.CadastraCustodia(iIdOperacaoInvest) then
            Raise Exception.Create('Problema ao Atualizar Custodia, os dados desta operação serão perdidos.');

         ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                              ' FlgCustodia         = NULL '+
                              ' Where IdHistCartInv = '+IntToStr(iIdHistCartInv));
      end;

      if StrToDate(dbDtaTransf.Text) <= pRPI.DATAULTFECH then
      begin
         if not RendaVariavel.MarcarFlagReproc(iIdInvestimento,
                                               -1{IDCARTEIRAINVEST}, -1 {IDPLANPREVCTBPATR},
                                               StrToDate(dbDtaTransf.Text)) then
            Raise Exception.Create('Não Foi Possível Marcar o Investimento para Reprocessamento.');
      end;

   Except
      //AL_28
      on E: Exception do
      begin
         sMensagem := E.Message;
         Result := False;
      end;
   end;
end;

procedure TfrmCadLanctoFundoVdAcoes.FormResize(Sender: TObject);
begin
   inherited;
   fraMens.Width := (TForm(Sender).Width - 344);
   if fraMens.Width <= 350 then
      fraMens.pnlProgressoMensagem.Width := fraMens.Width - 70
   else if Trunc((fraMens.Width / 3) * 2) > 350 then
      fraMens.pnlProgressoMensagem.Width := Trunc((fraMens.Width / 3) * 2)
   else
      fraMens.pnlProgressoMensagem.Width := 340;
end;

procedure TfrmCadLanctoFundoVdAcoes.dbdDataOperacaoExit(Sender: TObject);
var i : integer;
begin
   inherited;
   
   if Trim(sDataLiq) <> '' then
      qryDetalhe.FieldByName('DATAVENCOPER').AsString := sDataLiq
   else
   begin
      qryDetalhe.FieldByName('DATAVENCOPER').AsString := qryDetalhe.FieldByName('DATAOPERACAO').AsString;
      i :=1;
      While i <= QryTipoOperRV.FieldByName('VENCIMENTO').AsInteger Do
      begin
         qryDetalhe.FieldByName('DATAVENCOPER').AsDateTime :=
                    qryDetalhe.FieldByName('DATAVENCOPER').AsDateTime + 1;
         While not DiasUteisInv.DiaUtil(qryDetalhe.FieldByName('DATAVENCOPER').AsDateTime,-1,1,'',True,False,False) Do
            qryDetalhe.FieldByName('DATAVENCOPER').AsDateTime :=
                       qryDetalhe.FieldByName('DATAVENCOPER').AsDateTime + 1;
         i:=i+1;
      end;

   end;
end;

procedure TfrmCadLanctoFundoVdAcoes.dblAcaoExit(Sender: TObject);
begin
   inherited;
   BuscaCotacaoRV;
   CalculaValorRV;
end;

procedure TfrmCadLanctoFundoVdAcoes.dbrQtdProvExit(Sender: TObject);
begin
   inherited;
   BuscaCotacaoRV;
   CalculaValorRV;
end;

procedure TfrmCadLanctoFundoVdAcoes.dbeDivPorAcaoExit(Sender: TObject);
begin
   inherited;
   CalculaValorRV;
end;

procedure TfrmCadLanctoFundoVdAcoes.dbrVlrProvExit(Sender: TObject);
begin
   inherited;
   if qryDetalhe.FieldByName('VLROPERACAO').AsFloat = 0 then
      CalculaValorRV;
end;

// AL_10
procedure TfrmCadLanctoFundoVdAcoes.dbDtaCotizaFDExit(Sender: TObject);
begin
  inherited;

   QryAuxFD.FieldByName('DATAOPERACAO').AsString   := FormatDateTime('DD/MM/YYYY', dbDtaCotaFD.Date);
   QryAuxFD.FieldByName('DATACOTIZACAO').AsString  := FormatDateTime('DD/MM/YYYY', dbDtaCotizaFD.Date);

   with QryCotaFundo do
   begin
      // AL_10   
      QryCotaFundo.Close;
      QryCotaFundo.ParamByName('dbDtaCotaFD').AsString     := dbDtaCotizaFD.Text;
      QryCotaFundo.ParamByName('iIdFundoInvest').AsInteger := QryFundos.FieldByName('IDFUNDOINVEST').AsInteger;
      QryCotaFundo.Open;
      if isEmpty then
      begin
         MsgDlg('Cotação não encontrada para esta data : '+dbDtaCotizaFD.Text+#13+
         ' Fundo : '+QryFundos.FieldByName('DESCFUNDOINVEST').AsString+'','Mensagem do Sistema',MtWarning,[MbOk],0);
      end
      else
      begin
         QryAuxFD.FieldByName('VLRCOTA').AsFloat  := QryCotaFundo.FieldByName('VLRCOTA').AsFloat;
      end;
   end;
end;

function TfrmCadLanctoFundoVdAcoes.AbreCompras(sParam: String): Boolean;
var I: Integer;
begin
   // AL_14
   try
      Result := True;

      if Trim(sParam) = '' then
         sParam := '0';

      QryVendaAcao.Close;

      if sLinhaOriginal <> '' then
         QryVendaAcao.SQL.Strings[iLinhaOriginal] := sLinhaOriginal;

      for I := 0 to QryVendaAcao.SQL.Count - 1 do
      begin
         if Pos(':X',QryVendaAcao.SQL.Strings[I]) > 0 then
         begin
            sLinhaOriginal := QryVendaAcao.SQL.Strings[I];
            iLinhaOriginal := I;
            QryVendaAcao.SQL.Strings[I] := StrTran(QryVendaAcao.SQL.Strings[I], ':X', sParam);
         end;
      end;

      QryVendaAcao.Open;

      if QryVendaAcao.IsEmpty then
         Result := False;
   except
      Result := False;
   end;
   // AL_14 - Fim
end;

// AL_12
function TfrmCadLanctoFundoVdAcoes.ExcluiVenda: Boolean;
var wBol: String;
begin
   // AL_15
   try
      Result := False;
      if qry.FieldByName('IDOPERACAOINVEST').AsInteger <> 0 then
      begin
         if not ExecutaQuery(QryAux,'DELETE FROM OPERINVXOPERFDO WHERE '+
                                 'IDOPERACAOFUNDO = ' + qry.FieldByName('IDOPERACAOFUNDO').AsString) then
            Raise Exception.Create('Não foi possível excluir a operação de ligação.');
      end;
      
      iTipoInvestUsu := 2;

      QryDetalhe.First;
      wBol := '';
      while not QryDetalhe.Eof do
      begin
         if wBol <> QryDetalhe.FieldByName('NUMDOCUMENTO').AsString then
         begin
            wBol := QryDetalhe.FieldByName('NUMDOCUMENTO').AsString;
            if not RendaVariavel.ExcluiBoleta(wBol, True, True, fraMens) then
               Raise Exception.Create('Não foi possível excluir as Boletas desta operações.');
         end;
         QryDetalhe.Next;
      end;

      sBoleta := '';
      sBoletaCCI := '';

      Result := True;

      // AL_17
      bRelanca := True;

   finally
      iTipoInvestUsu := 6;   
      OperComum.LimpaParametros(qryBoleta);
   end;
end;

procedure TfrmCadLanctoFundoVdAcoes.dbDtaTransfExit(Sender: TObject);
begin
  inherited;
   dbDtaTransf.Text := FormatDateTime('DD/MM/YYYY', dbDtaTransf.Date);

   HabilitapnlDetalheFD;

   QryFundos.Close;
   QryFundos.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryFundos.ParamByName('DATAMOVFUNDO').AsString  := dbDtaTransf.Text;
   QryFundos.Open;

   if dblCarteiraRV.CanFocus then
      dblCarteiraRV.SetFocus;   

end;

procedure TfrmCadLanctoFundoVdAcoes.dbDtaCotaFDExit(Sender: TObject);
begin
  inherited;
   dbDtaLiqFD.Text := dbDtaCotaFD.Text;
   i :=1;
   While i <= QryTipoOperFD.FieldByName('VENCIMENTO').AsInteger Do
   begin
      dbDtaLiqFD.Date := dbDtaLiqFD.Date + 1;
      While not DiasUteisInv.DiaUtil(dbDtaLiqFD.Date,-1,1,'',True,False,False) Do
         dbDtaLiqFD.Date := dbDtaLiqFD.Date + 1;
      i:=i+1;
   end;
end;

end.
