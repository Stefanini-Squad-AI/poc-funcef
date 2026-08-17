//******************************************************************************
// Rotina     : BuscaCotacaoRV
// SOL        : 92822
// Kintana    : 389089
// Data       : 11/08/2008 
// Responsável: Ricardo Cristiano
// Descrição  : Instrução CGPC 025 que altera a precificação dos ativos de mercado a vista.
//******************************************************************************
// Data      : 10/01/2008
// Código    : AL_11
// Pendencia : 26743
// SOL       :
// Desc      : Verificar se existem transferências entre Planos posteriores a
//             transferência entre planos em lote -107
//******************************************************************************
// Data     : 22/08/2007
// Código   : AL_10
// Pendencia:
// SOL      :
// Motivo   : Implementações na BuscaSaldoFundo( devido a criação de campo
//            saldobloqueado(Pendência 25706)
//******************************************************************************
// Data      : 27/03/2007
// Código    : AL_9
// Pendencia :
// SOL       :
// Motivo    : Implementação de ajustes para funcionar a operação
//******************************************************************************
// Data      : 13/03/2007
// Código    : AL_8
// Pendencia :
// SOL       :
// Motivo    : Ajuste na mensagem de reprocessamento
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_7
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 03/10/2006
// Código    : AL_6
// Pendencia : 22965
// SOL       :
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_5
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_4
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 30/05/2005
// Linha(s) : Al_3
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 29/04/2005
// Linha(s) : Al_2
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Data     : 20/09/2004
// Linha(s) : Alt_1
// Motivo   : Inclusão da nova concepção para apuração de CPMF sobre as operações de
//            resgate
//******************************************************************************

unit FCadLanctoVdFundoCpAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Mask, DBCtrls, Buttons, wwdblook, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,UOperacaoInvest,
  CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, TREdit, FPreview, uCtrlInvContab, faMensagem;

type
  TfrmCadLanctoVdFundoCpAcoes = class(TfrmCadastroCS)
    QryFundos: TwwQuery;
    QryFundosDESCFUNDOINVEST: TStringField;
    QryFundosIDFUNDOINVEST: TFloatField;
    QryFundosIDGESTORCARTEIRA: TFloatField;
    QryFundosQTDDECQTD: TFloatField;
    QryFundosQTDDECVALOR: TFloatField;
    QryFundosPZOLIQAPLIC: TFloatField;
    QryFundosIDTIPOFUNDOINVEST: TFloatField;
    QryFundosIDCARTEIRAINVEST: TFloatField;
    QryTipoOperFD: TwwQuery;
    QryGestor: TwwQuery;
    QryGestorNOME: TStringField;
    QryCotaFundo: TwwQuery;
    QryCotaFundoVLRCOTA: TFloatField;
    dsCotaFundo: TwwDataSource;
    updCotaFundo: TUpdateSQL;
    QryInsOperacaoFundo: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    //AL_9
    updDetalhe: TUpdateSQL;
    dsDetalhe: TwwDataSource;
    QryDetalhe: TwwQuery;
    QryDetalheDESCCARTINVEST: TStringField;
    QryDetalheSGLCUSTODIANTE: TStringField;
    //AL_9
    QryDetalheDATAOPERACAO: TDateTimeField;
    QryDetalheQTDEOPERACAO: TFloatField;
    QryDetalhePRECOUNITOPERACAO: TFloatField;
    QryDetalheVLROPERACAO: TFloatField;
    QryDetalheDATAVENCOPER: TDateTimeField;
    QryDetalheIDOPERACAOINVEST: TFloatField;
    QryDetalheIDINVESTIMENTO: TFloatField;
    QryDetalheIDCARTEIRAINVEST: TFloatField;
    QryDetalheIDCUSTODIANTE: TFloatField;
    updAuxFD: TUpdateSQL;
    dsAuxFD: TwwDataSource;
    QryAuxFD: TwwQuery;
    QryAuxFDVLRCOTA: TFloatField;
    QryAuxFDDATAOPERACAO: TDateTimeField;
    QryAuxFDDATALIQUIDACAO: TDateTimeField;
    QryAux: TwwQuery;
    QryResgateFundos: TwwQuery;
    QryCompraAcao: TwwQuery;
    QryCompraAcaoIDHISTCARTINV: TFloatField;
    QryCompraAcaoCODDOCUMENTO: TFloatField;
    QryCompraAcaoPLNCODIGO: TFloatField;
    QryCompraAcaoPLANO: TFloatField;
    QryCompraAcaoIDOPERACAOINVEST: TFloatField;
    QryCompraAcaoIDTIPOOPERACAO: TFloatField;
    QryCompraAcaoIDCARTEIRAINVEST: TFloatField;
    QryCompraAcaoDATAMOVCARTINV: TDateTimeField;
    QryCompraAcaoIDTIPOINVEST: TFloatField;
    QryCompraAcaoVLRMOVCARTINV: TFloatField;
    QryCompraAcaoNATURMOVCARTINV: TStringField;
    QryCompraAcaoTIPMOVCARTINV: TStringField;
    QryCompraAcaoIDPLANPREVCTBPATR: TFloatField;
    QryCompraAcaoIDINVESTIMENTO: TFloatField;
    QryCompraAcaoQTDEMOVINVCART: TFloatField;
    QryCompraAcaoDATAVENCOPER: TDateTimeField;
    QryCompraAcaoDESCCARTINVEST: TStringField;
    QryCompraAcaoSGLCUSTODIANTE: TStringField;
    QryCompraAcaoDESCINVESTIMENTO: TStringField;
    QryCompraAcaoIDCUSTODIANTE: TFloatField;
    QryCompraAcaoPRECOUNITOPERACAO: TFloatField;
    QryTipoOperRV: TwwQuery;
    QryCotacaoInvest: TwwQuery;
    QryCotacaoInvestQTDTITLOTE: TFloatField;
    QryInvestimento: TwwQuery;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoIDEMISSOR: TFloatField;
    QryInvestimentoCODTIPOACAO: TStringField;
    QryAcao: TwwQuery;
    QryAcaoCODTIPOACAO: TStringField;
    QryInsPedidoFundo: TwwQuery;
    QryInsOperInvXOperFdo: TwwQuery;
    QryCustodiante: TwwQuery;
    QryCustodianteSGLCUSTODIANTE: TStringField;
    QryCustodianteIDCUSTODIANTE: TFloatField;
    QryCarteiraRV: TwwQuery;
    QryCarteiraRVDESCCARTINVEST: TStringField;
    QryCarteiraRVIDCARTEIRAINVEST: TFloatField;
    Panel2: TPanel;
    pnlFundos: TPanel;
    lblGestorFundo: TLabel;
    lblFundos: TLabel;
    lblSaldoFundo1: TLabel;
    lblSaldoFundo: TLabel;
    pnlParaFundos: TPanel;
    dblFundo: TwwDBLookupCombo;
    pnlDetalheFD: TPanel;
    lblVlrFD: TLabel;
    Label2: TLabel;
    lblCota: TLabel;
    lblQtdFD: TLabel;
    lblDataLiqFD: TLabel;
    dbDtaCotaFD: TCMDateTimePicker;
    dbDtaLiqFD: TCMDateTimePicker;
    pnlRV: TPanel;
    Panel3: TPanel;
    pgcDetalheRV: TPageControl;
    TabSheet1: TTabSheet;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtIncDet: TSpeedButton;
    BtAltDet: TSpeedButton;
    BtDelDet: TSpeedButton;
    pnlDeAcoes: TPanel;
    pnlData: TPanel;
    lblDataTransf: TLabel;
    dbDtaTransf: TCMDateTimePicker;
    QryBuscaOperacaoFundo: TwwQuery;
    QryBuscaOperacaoFundoIDOPERACAOFUNDO: TFloatField;
    QryInsOperacaoinvest: TwwQuery;
    QryBuscaAplicFundo: TwwQuery;
    lblGestorFundo1: TLabel;
    QryResgateFundosIDHISTFUNDO: TFloatField;
    QryResgateFundosCODDOCUMENTO: TFloatField;
    QryResgateFundosPLNCODIGO: TFloatField;
    QryResgateFundosPLANO: TFloatField;
    QryResgateFundosIDTIPOOPERACAO: TFloatField;
    QryResgateFundosIDCARTEIRAINVEST: TFloatField;
    QryResgateFundosDATAAPLICACAO: TDateTimeField;
    QryResgateFundosIDTIPOINVEST: TFloatField;
    QryResgateFundosVLRAPLICADO: TFloatField;
    QryResgateFundosNATURMOVFUNDO: TStringField;
    QryResgateFundosTIPMOVFUNDO: TStringField;
    QryResgateFundosIDFUNDOINVEST: TFloatField;
    QryResgateFundosDATAMOVFUNDO: TDateTimeField;
    QryResgateFundosCOTASMOVFUNDO: TFloatField;
    QryResgateFundosCOTAAPLICACAO: TFloatField;
    QryResgateFundosIDOPERACAOFUNDO: TFloatField;
    QryResgateFundosDATALIQUIDACAO: TDateTimeField;
    QryResgateFundosVLRCOTA: TFloatField;
    QryResgateFundosDESCCARTINVEST: TStringField;
    QryResgateFundosDESCFUNDOINVEST: TStringField;
    QryResgateFundosNOME: TStringField;
    QryResgateFundosVLRMOVFUNDO: TFloatField;
    QryResgateFundosIDPEDIDOFUNDO: TFloatField;
    //Ricardo Cristiano - 11/08/2008 - N. Sol 92822 -  N. Kintana 389089
    dbeCotaFD: TDBRealEdit;
    sbtnImprimir: TToolbarButton97;
    QryAuxFDVLROPERACAO: TFloatField;
    dbeVlrFD: TDBEdit;
    dbeQtdFD: TDBRealEdit;
    QryAuxFDQTDOPERACAO: TFloatField;
    QryDetalheIDTIPOINVEST: TFloatField;
    QryFundosIDTIPOINVEST: TFloatField;
    QryBuscaOperacaoFundoIDOPERACAOORIGEM: TFloatField;
    dbgOperacao: TwwDBGrid;
    QryCarteiraRVID: TStringField;
    QryCarteiraRVIDCARTEIRAGERENC: TFloatField;
    QryDetalheIDCARTEIRAGERENC: TFloatField;
    QryDetalheNUMDOCUMENTO: TStringField;
    QryDetalheIDTIPOOPERACAO: TFloatField;
    QryDetalheID: TStringField;
    pnlOperacoes: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Dock978: TDock97;
    Toolbar975: TToolbar97;
    BtOkDet: TBitBtn;
    BtCancDet: TBitBtn;
    BtVoltaDet: TBitBtn;
    dblCustodiante: TwwDBLookupCombo;
    dblAcao: TwwDBLookupCombo;
    dbDataOperRV: TCMDateTimePicker;
    dbeCotacaoRV: TDBRealEdit;
    dbeQuantidadeRV: TDBRealEdit;
    dbDataLiqRV: TCMDateTimePicker;
    dblCarteiraRV: TwwDBLookupCombo;
    dbeVlrOperRV: TDBRealEdit;
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
    //AL_9
    QryBuscaResgate: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbDtaTransfExit(Sender: TObject);
    procedure dblFundoExit(Sender: TObject);
    procedure dbDtaCotaFDExit(Sender: TObject);
    procedure dbeCotaFDExit(Sender: TObject);
    procedure dbeVlrFDExit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BtIncDetClick(Sender: TObject);
    procedure BtAltDetClick(Sender: TObject);
    procedure BtDelDetClick(Sender: TObject);
    procedure BtCancDetClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure BtVoltaDetClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure BtOkDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dblAcaoExit(Sender: TObject);
    procedure dbeCotacaoRVExit(Sender: TObject);
    procedure dbDataOperRVExit(Sender: TObject);
    procedure dbeVlrOperRVExit(Sender: TObject);
    procedure dblCarteiraRVExit(Sender: TObject);
  private
    { Private declarations }

    sBoleta : String;    

    procedure BuscaSaldosCustodia;
    procedure HabilitapnlDetalheFD;
    procedure DesabilitaGridDetalhe;
    procedure LimpaCampos;
    procedure DesabilitaIncAltExcDetalhe;
    procedure HabilitaIncAltExcDetalhe;
    procedure DesabilitaBotoesDetalhe;
    procedure HabilitaBotoesDetalhe;
    procedure BuscaCotacaoRV;

    function VerificaDadosFundo     : Boolean;
    function VerificaDadosRV        : Boolean;
    function OperInvesXOperFundo    : Boolean;
    function ResgateFundos          : Boolean;
    function CompraAcoes            : Boolean;
    function CalculaQtdFD           : Double;
    function VerificaValorResgatar  : Double;

    function ExcluiVendaFundo(iCodDocumento, iPlnCodigo, iPlano, iTipoInvest,
                              iIdHistFundo, iIdPedidoFundo : integer;
                              dDtaAplic      : TDateTime)  : boolean;

    function GravaCompraAcoes(iIdCarteiraInvest, iIdCarteiraGerenc, iIdInvestimento,
                              iIdMercado, iIdGestor,iIdCustodiante : Integer;
                              dDataTrasf                  : TDateTime;
                              fQtdOper, fVlrOper, fPUOper : Double;
                              sFlagIR,sDescTipoOper,sDescInvestimento, sNatuOper, sCodTipoAcao : string) : boolean;

    function VerificaSaldoLiberadoRV : Boolean;

  public
    { Public declarations }
  end;

var
  frmCadLanctoVdFundoCpAcoes : TfrmCadLanctoVdFundoCpAcoes;

  fCotacao,fTotalQtdRV,fVlrResgateFdo,fVlrIR, fVlrIRProv, fValorOperacao, fSaldoBloq,
  fSaldoLib,fVlrOperacao,wSaldoQtd, wSaldoVlr, wSaldoAqui, wSaldoIRApu, wSaldoInutil,
  fSdoAplicado,fSdoIrProv, fSdoIofProv, fSdoVariacao, fSdoCotasMovFundo, fSdoMovFundo,
  fSdoVlrFundo, fSdoQtdCotas, fSdoMercado, fSdoQtdCotasBloq : double;

  sDataLiq, sDataOpe, wTipoRecDesBol, wMensErro, sIdOperacaoInvest, wStr : string;

  bAlteracao, bAlteracaoInc, bAlteracaoAlt,
  bAlteracaoExc, bCriaLancto, bAlteraDetalhe : Boolean;

  iIdPedidoFundo,iPlanilha, iPlano, iDocumento,iIdCarteira,iIdCustodiante,iIdHistCartInv,
  iIdOperacaoInvest, iIdOperacaoFundo, iIdForCli, iIdTipoInvest : integer;

implementation

uses UDatabase, DBaseDados, UMensErro, USistema,UOperComum, UImpostos, UBibliotecaInvest, UFundoComum,
     fAguarde, FDmRelatoriosFundos, URendaVariavel, FPrincipal, dRendaVariavel,
  UDiasUteisInv;

{$R *.DFM}

procedure TfrmCadLanctoVdFundoCpAcoes.FormCreate(Sender: TObject);
begin

   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
      
  inherited;

   MontaSelect.Filtro.Add('HISTCARTINV.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro));
end;

procedure TfrmCadLanctoVdFundoCpAcoes.FormShow(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled := True;
   pnlRV.Enabled := False;
   pnlFundos.Enabled := False;
   pnlData.Enabled := False;

   dbDtaTransf.Date := pRPI.DATAULTFECH;
   if dbDtaTransf.CanFocus then
      dbDtaTransf.SetFocus;

   qry.Close;
   qry.ParamByName('IDOPERACAOINVEST').Clear;
   qry.ParamByName('IDOPERACAOFUNDO').Clear;
   qry.Open;

   qryDetalhe.Open;   
   
   QryAuxFD.Open;
   QryAuxFD.Edit;

   QryCotaFundo.Open;

   QryTipoOperRV.Open;

   QryTipoOperFD.Open;

   QryCarteiraRV.Open;

   QryCustodiante.Open;

   QryInvestimento.Open;

   QryFundos.Close;
   QryFundos.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvestUsu;
   QryFundos.ParamByName('DATAMOVFUNDO').AsString   := DateToStr(pRPI.DATAULTFECHFDO);
   QryFundos.Open;

   lblSaldoFundo.Visible  := Visible;
   lblSaldoFundo1.Visible := Visible;
   lblSaldoFundo.Caption  := FormatFloat('###,###,##0.00',0)+' ';

   DesabilitaIncAltExcDetalhe;

   DesabilitaBotoesDetalhe;

   dbgOperacao.BringToFront;

   fraMens.Apaga;

end;

procedure TfrmCadLanctoVdFundoCpAcoes.FormClose(Sender: TObject;
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
    QryResgateFundos.Close;
    QryCompraAcao.Close;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.dbDtaTransfExit(Sender: TObject);
//AL_9
var i : integer;
begin
  inherited;
   dbDtaTransf.Text := FormatDateTime('DD/MM/YYYY', dbDtaTransf.Date);

   dbDtaLiqFD.Text := dbDtaTransf.Text;
   i :=1;
   While i <= QryTipoOperFD.FieldByName('VENCIMENTO').AsInteger Do
   begin
      dbDtaLiqFD.Date := dbDtaLiqFD.Date + 1;
      While not DiasUteisInv.DiaUtil(dbDtaLiqFD.Date,-1,1,'',True,False,False) Do
         dbDtaLiqFD.Date := dbDtaLiqFD.Date + 1;
      i:=i+1;
   end;

   HabilitapnlDetalheFD;

   QryFundos.Close;
   QryFundos.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvestUsu;
   QryFundos.ParamByName('DATAMOVFUNDO').AsString   := dbDtaTransf.Text;
   QryFundos.Open;

   if dblFundo.CanFocus then
      dblFundo.SetFocus;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.dblFundoExit(Sender: TObject);
Var
   sDescFundo : String;
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
      
      //AL_10
      BuscaSaldoFundo(qryFundos.FieldByName('IDFUNDOINVEST').AsInteger,iPlanPrevCtbPatro, -1,
                      dbDtaTransf.Date, fSdoAplicado,
                      fSdoIrProv, fSdoIofProv, fSdoVariacao, fSdoCotasMovFundo, fSdoMovFundo,
                      fSdoVlrFundo, fSdoQtdCotas,fSdoMercado,fSdoQtdCotasBloq,sDescFundo);

      lblSaldoFundo.Caption := FormatFloat('###,###,##0.00',fSdoVlrFundo)+' ';

      dbeQtdFD.DecDigits  := QryFundos.FieldByName('QTDDECQTD').AsInteger;
      dbeCotaFD.DecDigits := QryFundos.FieldByName('QTDDECVALOR').AsInteger;

      QryAuxFD.FieldByName('DATAOPERACAO').AsString  := FormatDateTime('DD/MM/YYYY', dbDtaCotaFD.Date);

      with QryCotaFundo do
      begin
         QryCotaFundo.Close;
         QryCotaFundo.ParamByName('dbDtaCotaFD').AsString     := dbDtaCotaFD.Text;
         QryCotaFundo.ParamByName('iIdFundoInvest').AsInteger := QryFundos.FieldByName('IDFUNDOINVEST').AsInteger;
         QryCotaFundo.Open;
         if isEmpty then
         begin
            MsgDlg('Cotação não encontrada para esta data : '+dbDtaCotaFD.Text+#13+
            ' Fundo : '+QryFundos.FieldByName('DESCFUNDOINVEST').AsString+'','Mensagem do Sistema',MtWarning,[MbOk],0);
         end
         else
         begin
            QryAuxFD.FieldByName('VLRCOTA').AsFloat  := QryCotaFundo.FieldByName('VLRCOTA').AsFloat;
         end;
      end;

      if Trim(dbeCotaFD.Text) <> '' then
         QryAuxFD.FieldByName('QTDOPERACAO').AsFloat := CalculaQtdFD;

      if qryAuxFD.FieldByName('VLROPERACAO').AsFloat > fSdoVlrFundo-fSdoIrProv then
      begin
         MsgDlg('O valor de resgate é maior que saldo disponível.','Mensagem do Sistema',MtWarning,[MbOk],0);
         qryAuxFD.FieldByName('VLROPERACAO').AsFloat := fSdoVlrFundo-fSdoIrProv;
      end;

      if Trim(dbeCotaFD.Text) <> '' then
         QryAuxFD.FieldByName('QTDOPERACAO').AsFloat := CalculaQtdFD;
   end;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.DesabilitaGridDetalhe;
begin
   dbgOperacao.Options := dbgOperacao.Options - [TwwDBgridOption(dgEditing)];
end;

procedure TfrmCadLanctoVdFundoCpAcoes.HabilitapnlDetalheFD;
begin
   QryAuxFD.FieldByName('DATAOPERACAO').AsString   := dbDtaTransf.Text;
   QryAuxFD.FieldByName('DATALIQUIDACAO').AsString := dbDtaTransf.Text;

   lblGestorFundo.Caption := '';

   if (Trim(dblFundo.Text) <> '') then
      pnlDetalheFD.Enabled := True
   else
      pnlDetalheFD.Enabled := False;

   if dbDtaCotaFD.CanFocus then
      dbDtaCotaFD.SetFocus
end;

procedure TfrmCadLanctoVdFundoCpAcoes.dbDtaCotaFDExit(Sender: TObject);
Var
   sDescFundo : String;
begin
  inherited;
  If (Trim(dbDtaCotaFD.Text) <> '') And (Trim(dblFundo.Text) <> '') Then
  Begin
     //AL_10
     BuscaSaldoFundo(qryFundos.FieldByName('IDFUNDOINVEST').AsInteger,iPlanPrevCtbPatro, -1,
                     dbDtaTransf.Date,fSdoAplicado,
                     fSdoIrProv, fSdoIofProv, fSdoVariacao, fSdoCotasMovFundo, fSdoMovFundo,
                     fSdoVlrFundo, fSdoQtdCotas,fSdoMercado,fSdoQtdCotasBloq,sDescFundo);

     lblSaldoFundo.Caption := FormatFloat('###,###,##0.00',fSdoVlrFundo)+' ';

     QryAuxFD.FieldByName('DATAOPERACAO').AsString     := FormatDateTime('DD/MM/YYYY', dbDtaCotaFD.Date);

     with QryCotaFundo do
     begin
        QryCotaFundo.Close;
        QryCotaFundo.ParamByName('dbDtaCotaFD').AsString     := dbDtaCotaFD.Text;
        QryCotaFundo.ParamByName('iIdFundoInvest').AsInteger := QryFundos.FieldByName('IDFUNDOINVEST').AsInteger;
        QryCotaFundo.Open;
        if isEmpty then
        begin
           MsgDlg('Cotação não encontrada para esta data : '+dbDtaCotaFD.Text+#13+
           ' Fundo : '+QryFundos.FieldByName('DESCFUNDOINVEST').AsString+'','Mensagem do Sistema',MtWarning,[MbOk],0);
        end
        else
           QryAuxFD.FieldByName('VLRCOTA').AsFloat  := QryCotaFundo.FieldByName('VLRCOTA').AsFloat;
     end;
  End;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.dbeCotaFDExit(Sender: TObject);
begin
  inherited;
   if Trim(dbeCotaFD.Text) <> '' then
      QryAuxFD.FieldByName('QTDOPERACAO').AsFloat := CalculaQtdFD;
end;

function TfrmCadLanctoVdFundoCpAcoes.CalculaQtdFD : Double;
var
   iQtdDec : integer;
begin
   iQtdDec := QryFundos.FieldByName('QTDDECQTD').AsInteger;
   Result  := OperComum.DivValorZero(QryAuxFD.FieldByName('VLROPERACAO').AsFloat,
                                     QryAuxFD.FieldByName('VLRCOTA').AsFloat);
   Result  := OperComum.Trunca(Result,iQtdDec);
end;


procedure TfrmCadLanctoVdFundoCpAcoes.dbeVlrFDExit(Sender: TObject);
begin
  inherited;

   if qryAuxFD.FieldByName('VLROPERACAO').AsFloat > fSdoVlrFundo-fSdoIrProv then
   begin
      MsgDlg('O valor de resgate é maior que saldo disponível.','Mensagem do Sistema',MtWarning,[MbOk],0);
      qryAuxFD.FieldByName('VLROPERACAO').AsFloat := fSdoVlrFundo-fSdoIrProv;
   end;

   if (Trim(dbeCotaFD.Text) <> '') or (StrToFloat(dbeCotaFD.Text) <> 0) then
      QryAuxFD.FieldByName('QTDOPERACAO').AsFloat := CalculaQtdFD;

   fVlrResgateFdo := qryAuxFd.FieldByName('VLROPERACAO').AsFloat;      
end;

function TfrmCadLanctoVdFundoCpAcoes.VerificaDadosRV:boolean;
begin
   Result := True;
   if qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger = 0 then
   begin
      MsgDlg('Carteiria de Ações não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
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
      MsgDlg('Data da opreração de ações não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
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

function TfrmCadLanctoVdFundoCpAcoes.VerificaDadosFundo:boolean;
begin
   Result := True;
   // Verifica se já existe aplicação para o Fundo na data
   with QryBuscaAplicFundo do
   begin
      Close;
      ParamByName('IDCARTEIRAINVEST').AsInteger := QryFundos.FieldByName('IDCARTEIRAINVEST').AsInteger;
      ParamByName('IDFUNDOINVEST').AsInteger    := QryFundos.FieldByName('IDFUNDOINVEST').AsInteger;
      ParamByName('dDataRef').AsString          := DateToStr(dbDtaTransf.Date);
      Open;
      if not IsEmpty then
      begin
         MsgDlg('Já existe resgate no fundo para esta data.','Mensagem do Sistema',MtWarning,[MbOk],0);
         Result := False;
         Exit;
      end;
   end;
   // Valida entrada de dados
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
   if Trim(dbDtaCotaFD.Text) = '' then
   begin
      MsgDlg('Data da operação de Fundo não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   //AL_9
   QryAuxFDVLRCOTA.DisplayFormat      := '';
   QryAuxFDVLROPERACAO.DisplayFormat      := '';
   QryAuxFDQTDOPERACAO.DisplayFormat  := '';

   if QryAuxFD.FieldByName('VLROPERACAO').AsFloat = 0 then
   begin
      MsgDlg('Valor da operação de Fundo não informado.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   //AL_9
   if QryAuxFDVLRCOTA.AsFloat = 0 then
   begin
      MsgDlg('Cota do Fundo não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   //AL_9
   if QryAuxFD.FieldByName('QTDOPERACAO').AsFloat = 0 then
   begin
      MsgDlg('Quantidade da operação de Fundo não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   //AL_9
   QryAuxFDVLRCOTA.DisplayFormat     := '###,###,###,##0.000000000';
   QryAuxFDQTDOPERACAO.DisplayFormat      := '###,###,###,###';
   QryAuxFDVLROPERACAO.DisplayFormat := '###,###,###,##0.00';

   if Trim(dbDtaLiqFD.Text) = '' then
   begin
      MsgDlg('Data da liquidação operação de Fundo não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;

end;

procedure TfrmCadLanctoVdFundoCpAcoes.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   sbtnImprimir.Enabled   := False;
   sbtnInserir.Enabled    := False;
   sbtnProcurar.Enabled   := False;
   lblSaldoFundo.Visible  := Visible;
   lblSaldoFundo1.Visible := Visible;
   lblSaldoFundo.Caption  := FormatFloat('###,###,##0.00',0)+' ';

   HabilitaIncAltExcDetalhe;

   LimpaCampos;

   QryAuxFD.Open;
   QryAuxFD.Edit;
   QryDetalhe.Open;

   dbgOperacao.BringToFront;   

   dbgOperacao.Enabled   := True;

   bbtnConfirmar.Enabled := False;   

   pnlRV.Enabled     := True;
   pnlFundos.Enabled := True;
   pnlData.Enabled   := True;

   fTotalQtdRV       := 0;
   fValorOperacao    := 0;

   dbDtaTransf.Date  := pRPI.DATAULTFECH;

   if dbDtaTransf.CanFocus then
      dbDtaTransf.SetFocus;

   bAlteracao := False;
      
end;

procedure TfrmCadLanctoVdFundoCpAcoes.LimpaCampos;
begin
   dblCarteiraRV.Text := '';
   dblCustodiante.Text := '';
   dblAcao.Text := '';
   dblFundo.Text := '';
   dbeQtdFD.Text := '';
   lblGestorFundo.Caption := '';
   dbeCotaFD.Text := '';
   dbDtaTransf.Date := Date;
   QryDetalhe.Close;
   QryAuxFD.Cancel;
   QryAuxFD.Close;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   DesabilitaIncAltExcDetalhe;
   DesabilitaBotoesDetalhe;
   LimpaCampos;
   sbtnAlterar.Enabled  := False;
   sbtnApagar.Enabled   := False;
   sbtnImprimir.Enabled := False;
   qryDetalhe.Close;
   sbtnProcurar.Down := False;
   frmAguarde.Apaga;
   QryAux.Close;
   lblSaldoFundo.Caption := FormatFloat('###,###,##0.00',0)+' ';
   fVlrOperacao := 0;
   if dtmBaseDados.dbBaseDados.InTransaction then
      DtmBaseDados.dbBaseDados.Rollback;
   dbgOperacao.BringToFront;      
end;

procedure TfrmCadLanctoVdFundoCpAcoes.HabilitaIncAltExcDetalhe;
Begin
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
End;

procedure TfrmCadLanctoVdFundoCpAcoes.DesabilitaIncAltExcDetalhe;
begin
   BtAltDet.Enabled   := False;
   BtDelDet.Enabled   := False;
   BtIncDet.Enabled   := False;
   BtAltDet.Down      := True;
   BtDelDet.Down      := True;
   BtIncDet.Down      := True;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.HabilitaBotoesDetalhe;
Begin
   BtOkDet.Enabled      := True;
   BtCancDet.Enabled    := True;
   BtVoltaDet.Enabled   := True;
End;

procedure TfrmCadLanctoVdFundoCpAcoes.DesabilitaBotoesDetalhe;
begin
   BtOkDet.Enabled      := False;
   BtCancDet.Enabled    := False;
   BtVoltaDet.Enabled   := False;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.BtIncDetClick(Sender: TObject);
begin
  inherited;

   DesabilitaIncAltExcDetalhe;

   if bAlteracao then
      bAlteracaoInc := True;

   sbtnImprimir.Enabled := False;

   HabilitaBotoesDetalhe;

   sDataOpe       := QryDetalhe.FieldByName('DATAOPERACAO').AsString;
   sDataLiq       := QryDetalhe.FieldByName('DATAVENCOPER').AsString;
   iIdCarteira    := QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger;
   iIdCustodiante := QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger;

   fValorOperacao := VerificaValorResgatar;

   pnlOperacoes.BringToFront;

   try
      QryDetalhe.Append;
   except
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

   qryDetalhe.FieldByName('VLROPERACAO').AsFloat   := fVlrResgateFdo - fValorOperacao;

   bbtnConfirmar.Enabled := False;

end;

procedure TfrmCadLanctoVdFundoCpAcoes.BtAltDetClick(Sender: TObject);
begin
  inherited;
   if bAlteracao then
   begin
      bAlteracaoAlt := True;
      iIdOperacaoInvest := QryDetalhe.FieldByName('IDOPERACAOINVEST').AsInteger;
   end;

   sbtnImprimir.Enabled := False;

   bbtnConfirmar.Enabled := False;

   pnlOperacoes.BringToFront;      

   HabilitaBotoesDetalhe;

   QryDetalhe.Edit;

   bAlteraDetalhe := True;
   
   fVlrOperacao   := 0;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.BtDelDetClick(Sender: TObject);
begin
  inherited;
   if MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,[mbYes, mbNo],0) = mrYes then
   begin
      //AL_3
      //AL_5
      if CtrlInvContab.TestaPeriodo(QryDetalheDATAOPERACAO.AsString, 2) then
      begin
         HabilitaBotoesDetalhe;

         if bAlteracao then
            bAlteracaoExc := True;
         Try
            if (QryDetalheDATAOPERACAO.AsDateTime <= pRPI.DATAULTFECH) then
               RendaVariavel.MarcarFlagReproc(QryDetalheIDINVESTIMENTO.AsInteger,
                                           -1, -1, QryDetalheDATAOPERACAO.AsDateTime);

            iIdOperacaoInvest := QryDetalhe.FieldByName('IDOPERACAOINVEST').AsInteger;
            fVlrOperacao      := fVlrOperacao-QryDetalhe.FieldByName('VLROPERACAO').AsFloat;
            QryDetalhe.Delete;
            BtDelDet.Down := False;
            if bAlteracaoExc then
            begin
               // Exclui Compras
               if not ExecutaQuery(QryAux,'DELETE FROM OPERINVXOPERFDO WHERE '+
                                          'IDOPERACAOFUNDO = '+
                                           qry.FieldByName('IDOPERACAOFUNDO').AsString) then
               begin
                  MsgDlg('Não foi possível excluir a operação.','Mensagem do Sistema',mtWarning,[mbOk],0);
                  //AL_9
                  if dtmBaseDados.dbBaseDados.InTransaction then
                     DtmBaseDados.dbBaseDados.Rollback;
                  Abort;
               end;
               QryAux.Close;

               //AL_9
               if not OperComum.EstornaOper('', QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger,
                                            iIdOperacaoInvest,
                                            QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger,                                            
                                            dbDtaTransf.Date,
                                            pRPI.VLRCOTAINICART,'X', true) then
               begin
                  MsgDlg('Não é possível fazer a exclusão dessa operação.',
                         'Mensagem do Sistema',mtWarning,[MbOk],0);
                  //AL_9
                  if dtmBaseDados.dbBaseDados.InTransaction then
                     DtmBaseDados.dbBaseDados.RollBack;
                  Exit;
               end;
            end;

            bbtnConfirmar.Enabled := False;
            if qryDetalhe.RecordCount > 0 then
               bbtnConfirmar.Enabled := True;

         except
           MsgDlg('Não foi possível excluir a Operação.',
                  'Mensagem do Sistema ',mtWarning,[mbOK],0);
           QryDetalhe.Cancel;
           fVlrOperacao      := fVlrOperacao+QryDetalhe.FieldByName('VLROPERACAO').AsFloat;           
            if qryDetalhe.RecordCount > 0 then
               bbtnConfirmar.Enabled := True;
           Exit;
         end;

         if qryDetalhe.IsEmpty then
         begin
            BtDelDet.Enabled := False;
            BtAltDet.Enabled := False;
            bbtnConfirmar.Enabled := False;
         end;
      end
      else
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
   end;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.BtCancDetClick(Sender: TObject);
begin
  inherited;
   if not  bAlteraDetalhe then
   Begin
      If fValorOperacao > 0 Then
         fValorOperacao := fValorOperacao-QryDetalhe.FieldByName('VLROPERACAO').AsFloat;
   End
   Else
   Begin
      If (QryDetalhe.FieldByName('VLROPERACAO').AsFloat-
          QryDetalhe.FieldByName('VLROPERACAO').OldValue) > 0 Then
         fValorOperacao := fValorOperacao-
                                ABS(QryDetalhe.FieldByName('VLROPERACAO').NewValue-
                                    QryDetalhe.FieldByName('VLROPERACAO').OldValue)
      Else
         fValorOperacao := fValorOperacao+
                                ABS(QryDetalhe.FieldByName('VLROPERACAO').NewValue-
                                    QryDetalhe.FieldByName('VLROPERACAO').OldValue);
   End;

   qryDetalhe.Cancel;

   HabilitaIncAltExcDetalhe;
   
   DesabilitaBotoesDetalhe;

   dbgOperacao.BringToFront;

   if qryDetalhe.RecordCount > 0 then
      bbtnConfirmar.Enabled := True;   

end;

procedure TfrmCadLanctoVdFundoCpAcoes.BuscaCotacaoRV;
begin
  inherited;
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

procedure TfrmCadLanctoVdFundoCpAcoes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      
     SelectNext(ActiveControl,True,True);
end;

procedure TfrmCadLanctoVdFundoCpAcoes.BtVoltaDetClick(Sender: TObject);
begin
  inherited;
   qryDetalhe.Cancel;
   HabilitaIncAltExcDetalhe;
   DesabilitaBotoesDetalhe;
   DesabilitaGridDetalhe;
   dbgOperacao.BringToFront;

   if qryDetalhe.RecordCount > 0 then
      bbtnConfirmar.Enabled := True;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.sbtnProcurarClick(Sender: TObject);
var
   sSql : string;
   i,iIdOperacaoFundo : integer;
begin
  inherited;

  lblSaldoFundo.Visible     := False;
  lblSaldoFundo1.Visible    := False;
  LimpaCampos;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
     with qry do
     begin
        Close;
        ParamByName('IDOPERACAOINVEST').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
        ParamByName('IDOPERACAOFUNDO').Clear;
        Open;
        if qry.isEmpty then
           Exit
        else
        begin
           iIdOperacaoFundo := qry.FieldByName('IDOPERACAOFUNDO').AsInteger;
           Close;
           ParamByName('IDOPERACAOINVEST').Clear;
           ParamByName('IDOPERACAOFUNDO').AsInteger := iIdOperacaoFundo;
           Open;
        end;
        if qry.isEmpty then
           Exit
        else
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
              Next;
           end;
        end;
     end;

     with QryCompraAcao do
     begin
        QryCompraAcao.Close;
        QryCompraAcao.SQL.Clear;
        sSql := 'SELECT '+
                '    HI.IDHISTCARTINV,HI.CODDOCUMENTO,HI.PLNCODIGO,HI.PLANO,HI.IDOPERACAOINVEST,  '+
                '    HI.IDTIPOOPERACAO,HI.IDCARTEIRAINVEST,HI.DATAMOVCARTINV,HI.IDTIPOINVEST,     '+
                '    HI.VLRMOVCARTINV,HI.NATURMOVCARTINV,HI.TIPMOVCARTINV,HI.IDPLANPREVCTBPATR,   '+
                '    HI.IDINVESTIMENTO,HI.QTDEMOVINVCART,OP.DATAVENCOPER,OP.IDCUSTODIANTE,        '+
                '    OP.PRECOUNITOPERACAO,CA.DESCCARTINVEST,CU.SGLCUSTODIANTE,IV.DESCINVESTIMENTO '+
                'FROM                                                                             '+
                '    HISTCARTINV HI, OPERACAOINVEST OP, CARTEIRAINVEST CA, CUSTODIANTE CU,        '+
                '    INVESTIMENTO IV                                                              '+
                'WHERE                                                                            '+
                '    (HI.IDOPERACAOINVEST IN ('+ sIdOperacaoInvest +')) AND                         '+
                '    (HI.IDTIPOOPERACAO = -44) AND                                                '+
                '    (HI.IDTIPOINVEST = 2) AND                                                    '+
                '    (HI.TIPMOVCARTINV = ''OPE'') AND                                               '+
                '    (HI.IDOPERACAOINVEST = OP.IDOPERACAOINVEST) AND                              '+
                '    (HI.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) AND                              '+
                '    (OP.IDCUSTODIANTE = CU.IDCUSTODIANTE) AND                                    '+
                '    (HI.IDINVESTIMENTO = IV.IDINVESTIMENTO)                                      ';
        QryCompraAcao.SQL.Add(sSQL);
        QryCompraAcao.Open;

        if QryCompraAcao.IsEmpty then
           Exit;
        QryDetalhe.Close;
        QryDetalhe.Open;
        QryDetalhe.DisableControls;
        while not QryCompraAcao.EOF do
        begin
           QryDetalhe.Append;
           dbgOperacao.SelectedIndex := 1;
           dbgOperacao.Options       := dbgOperacao.Options + [TwwDBgridOption(dgEditing)];
           dbgOperacao.Font.Color    := clBlack;
           QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger   := QryCompraAcao.FieldByName('IDINVESTIMENTO').AsInteger;
           QryDetalhe.FieldByName('DATAOPERACAO').AsDateTime    := QryCompraAcao.FieldByName('DATAMOVCARTINV').AsDateTime;
           QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat       := QryCompraAcao.FieldByName('QTDEMOVINVCART').AsFloat;
           QryDetalhe.FieldByName('PRECOUNITOPERACAO').AsFloat  := QryCompraAcao.FieldByName('PRECOUNITOPERACAO').AsFloat;
           QryDetalhe.FieldByName('DATAVENCOPER').AsDateTime    := QryCompraAcao.FieldByName('DATAVENCOPER').AsDateTime;
           QryDetalhe.FieldByName('VLROPERACAO').AsFloat        := QryCompraAcao.FieldByName('VLRMOVCARTINV').AsFloat;
           QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger := QryCompraAcao.FieldByName('IDCARTEIRAINVEST').AsInteger;
           QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger    := QryCompraAcao.FieldByName('IDCUSTODIANTE').AsInteger;
           QryDetalhe.FieldByName('IDOPERACAOINVEST').AsInteger := QryCompraAcao.FieldByName('IDOPERACAOINVEST').AsInteger;
           QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger     := QryCompraAcao.FieldByName('IDTIPOINVEST').AsInteger;           
           QryDetalhe.Post;
           QryCompraAcao.Next;
        end;
        QryDetalhe.EnableControls;
     end;

     //AL_9
     QryBuscaResgate.Close;
     QryBuscaResgate.ParamByName('IDOPERACAOFUNDO').AsInteger := iIdOperacaoFundo;
     QryBuscaResgate.Open;
     if QryBuscaResgate.IsEmpty then
        begin
           QryBuscaResgate.Close;
           LimpaCampos;
           Exit;
        end;

     QryResgateFundos.Close;
     QryResgateFundos.ParamByName('IDOPERACAOFUNDO').AsInteger := QryBuscaResgate.FieldByName('IDOPERACAOORIGEM').AsInteger;
     QryResgateFundos.Open;
     if QryResgateFundos.IsEmpty then
     begin
        QryBuscaResgate.Close;
        QryResgateFundos.Close;
        LimpaCampos;
        Exit;
     end;
     QryBuscaResgate.Close;

     iIdPedidoFundo         := QryResgateFundos.FieldByName('IDPEDIDOFUNDO').AsInteger;
     dbDtaTransf.Date       := QryResgateFundos.FieldByName('DATAMOVFUNDO').AsDateTime;
     dblFundo.Text          := QryResgateFundos.FieldByName('DESCFUNDOINVEST').AsString;
     lblGestorFundo.Caption := QryResgateFundos.FieldByName('NOME').AsString;
     QryAuxFD.Open;
     QryAuxFD.Edit;
     QryAuxFD.FieldByName('VLROPERACAO').AsFloat     := QryResgateFundos.FieldByName('VLRMOVFUNDO').AsFloat;
     QryAuxFD.FieldByName('QTDOPERACAO').AsFloat     := QryResgateFundos.FieldByName('COTASMOVFUNDO').AsFloat;
     QryAuxFD.FieldByName('DATAOPERACAO').AsString   := QryResgateFundos.FieldByName('DATAMOVFUNDO').AsString;
     QryAuxFD.FieldByName('DATALIQUIDACAO').AsString := QryResgateFundos.FieldByName('DATALIQUIDACAO').AsString;
     QryAuxFD.FieldByName('VLRCOTA').AsFloat         := QryResgateFundos.FieldByName('VLRCOTA').AsFloat;

     //AL_9

     fVlrResgateFdo := QryAuxFD.FieldByName('VLROPERACAO').AsFloat;

     fValorOperacao := VerificaValorResgatar;     

     with QryTipoFundoInvest do
     begin
        Close;
        ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
        Open;
        iIdTipoInvest := QryTipoFundoInvest.FieldByName('IDTIPOINVEST').AsInteger;
        Close;
     end;

     sbtnInserir.Enabled  := False;
     sbtnAlterar.Enabled  := True;
     sbtnApagar.Enabled   := True;
     bbtnCancelar.Enabled := True;
     pnlFundo.Enabled     := True;
     dbgOperacao.Enabled  := True;
     pnlFundos.Enabled    := False;
     sbtnImprimir.Enabled := True;
     
     dbgOperacao.Options  := dbgOperacao.Options - [TwwDBgridOption(dgEditing)];
  end
  Else If (QryDetalhe.IsEmpty) Then
  Begin
     sbtnInserir.Enabled  := True;
     sbtnProcurar.Enabled := True;
     sbtnAlterar.Enabled  := False;
     sbtnApagar.Enabled   := False;
     sbtnImprimir.Enabled := False;
  End;
end;

Function TfrmCadLanctoVdFundoCpAcoes.VerificaValorResgatar : Double;
begin
   Result := 0;
   with QryDetalhe do
   begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         Result := Result + QryDetalhe.FieldByName('VLROPERACAO').AsFloat;

         Next;
      End;
      First;
      EnableControls;
   End;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.BtOkDetClick(Sender: TObject);
var wBol : String;
begin
  inherited;
   if (bAlteracao) and (bAlteracaoExc) and (QryDetalhe.IsEmpty) then // Não permite excluir o último registro do detalhe >> Tem que excluir a operação toda
   begin
      MsgDlg('A operação não pode ser excluida.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      bbtnConfirmar.Enabled := False;
   end;

   //AL_3
   //AL_5
   if not CtrlInvContab.TestaPeriodo(QryDetalheDATAOPERACAO.AsString, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      bbtnConfirmar.Enabled := False;
      Exit;
   end;

   //AL_5
   if not CtrlInvContab.TestaPeriodo(QryAuxFDDATAOPERACAO.AsString, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      bbtnConfirmar.Enabled := False;
      Exit;
   end;

    // Al_11
    // Verifica se existem Transferência entre planos posterior a data a ser transferida
    If ufundocomum.VerificaTranferenciaPlanos( iTipoInvestUsu,
                                               QryFundos.FieldByName('IDFUNDOINVEST').AsInteger,
                                               iPlanPrevCtbPatro,
                                               dbDtaTransf.DateTime) then
    Begin
        MsgDlg('Já há Lançamentos de Transferências entre planos para o Fundo com data superior a data de operação'+'.'#13+
               'A operação não será efetuada!','Mensagem do Sistema',mtWarning,[mbOk],0);
        bbtnCancelarClick(Sender);
        Exit;
    End; // Fim AL_11

   if (QryDetalhe.State = DsInsert) or (QryDetalhe.State = DsEdit) then
   begin
      if (QryDetalhe.State = DsEdit) then
          fVlrOperacao := fValorOperacao - QryDetalhe.FieldByName('VLROPERACAO').OldValue;

      fVlrOperacao := fVlrOperacao + QryDetalhe.FieldByName('VLROPERACAO').AsFloat;
      If fVlrOperacao > fVlrResgateFdo Then
      begin
         DesabilitaIncAltExcDetalhe;
         MsgDlg('O somatório das operações e maior que o valor de resgate do Fundo.','Mensagem do Sistema ',mtWarning,[mbOK],0);
         fVlrOperacao := fVlrOperacao - QryDetalhe.FieldByName('VLROPERACAO').AsFloat;
         Exit;
      end;
   end;

   if (QryDetalhe.State = DsInsert) or (QryDetalhe.State = DsEdit) then
   begin

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
            fVlrOperacao  := fVlrOperacao - QryDetalhe.FieldByName('VLROPERACAO').AsFloat;
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
         fVlrOperacao  := fVlrOperacao - QryDetalhe.FieldByName('VLROPERACAO').AsFloat;
         Exit;
      end;
      
      Try

         QryDetalhe.Post;

         if (bAlteracao) and ((bAlteracaoAlt) or (bAlteracaoInc)) then
         begin
            if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;
            try

               if bAlteracaoAlt then // Exclui a Operacao Antiga
               Begin
                  if not ExecutaQuery(QryAux,'DELETE FROM OPERINVXOPERFDO WHERE '+
                                             'IDOPERACAOFUNDO = '+
                                              qry.FieldByName('IDOPERACAOFUNDO').AsString) then
                  begin
                     MsgDlg('Não foi possível excluir a operação.','Mensagem do Sistema',mtWarning,[mbOk],0);
                     QryDetalhe.Cancel;                     
                     //AL_9
                     if dtmBaseDados.dbBaseDados.InTransaction then
                        DtmBaseDados.dbBaseDados.Rollback;
                     exit;
                  end;
                  QryAux.Close;

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
               End;

               if not GravaCompraAcoes(QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger,               
                                       QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger,
                                       QryTipoOperRV.FieldByName('IDMERCADO').AsInteger,
                                       QryFundos.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                       QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger,
                                       dbDtaTransf.Date,
                                       QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat,
                                       QryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                                       QryDetalhe.FieldByName('PRECOUNITOPERACAO').AsFloat,
                                       QryTipoOperRV.FieldByName('FLGTRATAIR').AsString,
                                       QryTipoOperRV.FieldByName('DESCTIPOOPERACAO').AsString,
                                       QryDetalhe.FieldByName('DESCINVESTIMENTO').AsString,
                                       QryTipoOperRV.FieldByName('NATUREZAOPERACAO').AsString,
                                       QryInvestimento.FieldByName('CODTIPOACAO').AsString) then
               begin
                  QryDetalhe.Cancel;               
                  //AL_9   
                  if dtmBaseDados.dbBaseDados.InTransaction then
                     DtmBaseDados.dbBaseDados.Rollback;
                  frmAguarde.Apaga;
               end;
            except
               on E: Exception do
               begin
                  QryDetalhe.Cancel;
                  //AL_9
                  if dtmBaseDados.dbBaseDados.InTransaction then
                     DtmBaseDados.dbBaseDados.Rollback;
                  MsgDlg('Ocorreu problema na operação ...'+
                         #13+E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
               end;
            end;

         end;

         fValorOperacao := VerificaValorResgatar;

         HabilitaIncAltExcDetalhe;

         bAlteraDetalhe := False;

         bbtnConfirmar.Enabled := True;         

      except
        MsgDlg('Não foi possível realizar a Operação.', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
        QryDetalhe.Cancel;
        if dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.Rollback;
      end;
   end;

   dbgOperacao.BringToFront;

end;

procedure TfrmCadLanctoVdFundoCpAcoes.bbtnConfirmarClick(Sender: TObject);
begin
    if not VerificaDadosFundo then
       Exit;

    //AL_3
    //AL_5
    if not CtrlInvContab.TestaPeriodo(QryDetalheDATAOPERACAO.AsString, 2) then
    begin
       MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
       Exit;
    end;

    //AL_5
    if not CtrlInvContab.TestaPeriodo(QryAuxFDDATAOPERACAO.AsString, iTipoInvestUsu) then
    begin
       MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
       Exit;
    end;

    //AL_4
    if VerEmAbertura(QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
       Exit;

    if (QryDetalhe.State = DsInsert) or (QryDetalhe.State = DsEdit) then
    begin
       MsgDlg('Uma operação não foi confirmada.','Mensagem do Sistema',mtConfirmation,[MbOk],0);
       Exit;
    end;

    If fValorOperacao < fVlrResgateFdo Then
    begin
       MsgDlg('O valor de resgate do Fundo é maior que o valor de compra de Ações','Mensagem do Sistema',mtConfirmation,[MbOk],0);
       Exit;
    end;

    try
       if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       if bAlteracao then // Exclui fundo
       begin
          wStr := 'DELETE FROM OPERINVXOPERFDO WHERE '+
                  'IDOPERACAOFUNDO = '+ IntToStr(QryResgateFundos.FieldByName('IDOPERACAOFUNDO').AsInteger);
          if not ExecutaQuery(QryAux,wStr) then
          begin
             MsgDlg('Não foi possível excluir a operação.','Mensagem do Sistema',mtInformation,[mbOk],0);
             //AL_9
             if dtmBaseDados.dbBaseDados.InTransaction then
                DtmBaseDados.dbBaseDados.Rollback;
             bbtnConfirmar.Enabled := False;
             Exit;
          end;
          QryAux.Close;

          if not ExcluiVendaFundo(QryResgateFundos.FieldByName('CODDOCUMENTO').AsInteger,
                                  QryResgateFundos.FieldByName('PLNCODIGO').AsInteger,
                                  QryResgateFundos.FieldByName('PLANO').AsInteger,
                                  QryResgateFundos.FieldByName('IDTIPOINVEST').AsInteger,
                                  QryResgateFundos.FieldByName('IDHISTFUNDO').AsInteger,
                                  QryResgateFundos.FieldByName('IDPEDIDOFUNDO').AsInteger,
                                  QryResgateFundos.FieldByName('DATAAPLICACAO').AsDateTime) Then
          begin
             //AL_9
             if dtmBaseDados.dbBaseDados.InTransaction then
                DtmBaseDados.dbBaseDados.Rollback;
             bbtnConfirmar.Enabled := False;
             frmAguarde.Apaga;             
             exit;
          end;
       end;

       if not bAlteracao then // Se for inclusao -> executa
       begin
          if not CompraAcoes then
          begin
             //AL_9
             if dtmBaseDados.dbBaseDados.InTransaction then
                DtmBaseDados.dbBaseDados.Rollback;
             frmAguarde.Apaga;
             exit;
          end;
       end;

       if not ResgateFundos then
       begin
          //AL_9
          if dtmBaseDados.dbBaseDados.InTransaction then
             DtmBaseDados.dbBaseDados.Rollback;
          frmAguarde.Apaga;
          exit;
       end;

       if not OperInvesXOperFundo then
       begin
          //AL_9
          if dtmBaseDados.dbBaseDados.InTransaction then
             DtmBaseDados.dbBaseDados.Rollback;
          frmAguarde.Apaga;
          exit;
       end;

       dtmBaseDados.dbBaseDados.Commit;

       frmAguarde.Apaga;

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
             //AL_8
             MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                    'Mensagem do Sistema', MtInformation,[MbOk],0);
       end;

       MsgDlg('Processo concluído com sucesso.','Mensagem do Sistema',mtInformation,[MbOk],0);
    except
       on E: Exception do
       begin
          //AL_9
          if dtmBaseDados.dbBaseDados.InTransaction then
             DtmBaseDados.dbBaseDados.Rollback;
          MsgDlg('Ocorreu um problema na operação.'+
                 #13+E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
       end;
    end;
    
   // No Final, cancela a edição das qry's para descartar os valores
   QryAuxFD.FieldByName('VLROPERACAO').AsFloat  := 0;
   QryAuxFD.FieldByName('QTDOPERACAO').AsFloat  := 0;
   QryAuxFD.FieldByName('VLRCOTA').AsFloat      := 0;

   QryCotacaoInvest.Cancel;

   QryAuxFD.Cancel;

   bbtnCancelarClick(Sender);

   LimpaCampos;

   dbgOperacao.Enabled := True;
end;

function TfrmCadLanctoVdFundoCpAcoes.ResgateFundos:boolean;
Var
   iIdOperacaoFundoOrigem       : Integer;
   fVlrCustoAcoes, fVlrVarAcoes : Currency;
   //AL_7
   sMens: String;
begin
   if QryFundos.FieldByName('IDCARTEIRAINVEST').AsInteger <= 0 then
   begin
      MsgDlg('Não foi cadastrado a Carteira para esse Fundo de Investimentos.' + #13 +
             'Verifique o cadastro de fundo e a data de vigência.',
             'Mensagem do Sistema', mtInformation, [MbOk],0);
      exit;
   end;

   Result := True;
   iPlano     := -1;
   iPlanilha  := -1;
   iDocumento := -1;
   Try
      iIdForCli := OperComum.BuscaForCli(2,QryFundos.FieldByName('IDGESTORCARTEIRA').AsInteger,-35, pRPI.IDTIPOCLIENTEEMI);
      if iIdForCli = 0 then
      begin
         Result := False;
         Exit;
      end;

      with QryInsPedidoFundo do
      begin
         Close;
         iIdPedidoFundo := LeUltRegistro(Nil,'PEDIDOFUNDO');
         ParamByName('IDPEDIDOFUNDO').AsInteger     := iIdPedidoFundo;
         ParamByName('IDTIPOINVEST').AsInteger      := iIdTipoInvest;
         ParamByName('IDTIPOOPERACAO').AsInteger    := -45;
         ParamByName('IDFUNDOINVEST').AsInteger     := QryFundos.FieldByName('IDFUNDOINVEST').AsInteger;
         ParamByName('DATAPEDIDO').AsDateTime       := dbDtaTransf.Date;
         ParamByName('DATALIQUIDACAO').AsDateTime   := QryDetalhe.FieldByName('DATAVENCOPER').AsDateTime;
         ParamByName('VLRPEDIDO').AsFloat           := QryAuxFD.FieldByName('VLROPERACAO').AsFloat;
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
         ExecSQL;
         Close;
      end;

      //Alt_1
      if not ResgateFACFIF(iIdTipoInvest,
                           iIdPedidoFundo,-45,
                           QryFundos.FieldByName('IDCARTEIRAINVEST').AsInteger,
                           QryFundos.FieldByName('IDFUNDOINVEST').AsInteger, -1,
                           iPlanPrevCtbPatro,
                           dbDtaTransf.Date,
                           dbDtaTransf.Date,
                           QryAuxFD.FieldByName('DATALIQUIDACAO').AsDateTime, 0,
                           QryAuxFD.FieldByName('VLROPERACAO').AsFloat,0,
                           fVlrCustoAcoes, fVlrVarAcoes) Then
       begin
          MsgDlg('Ocorreu um problema no resgate do Fundo : '+#13+
                 QryFundos.FieldByName('DESCFUNDOINVEST').AsString,'Mensagem do Sistema', mtWarning,[MbOk],0);
          Result := False;
          Exit;
       end;

       with QryBuscaOperacaoFundo do
       begin
          Close;
          ParamByName('IDPEDIDOFUNDO').AsInteger := iIdPedidoFundo;
          Open;
          iIdOperacaoFundo       := FieldByName('IDOPERACAOFUNDO').AsInteger;
          iIdOperacaoFundoOrigem := FieldByName('IDOPERACAOORIGEM').AsInteger;
          if IsEmpty then
          begin
             MsgDlg('Não foi encontrado pedido de resgate para a operação','Mensagem do Sistema',mtWarning,[MbOk],0);
             Result := False;
             Exit;
          end;
       end;

       //AL_7
       if not AlimentaFundo(iIdTipoInvest,
                            -45,
                            QryFundos.FieldByName('IDCARTEIRAINVEST').AsInteger,
                            QryFundos.FieldByName('IDFUNDOINVEST').AsInteger,
                            iPlanoPrevContab,iPatrocinadora,
                            iIdOperacaoFundo,iIdOperacaoFundoOrigem,
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
                            iPlanPrevCtbPatro,-1, -1, 0 {Rendimento}, sMens) Then
       begin
          //AL_7
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

       //Al_2
       If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
            -45,
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
            0, 0, 0, 0, fVlrCustoAcoes, fVlrVarAcoes) Then
       Begin
          Result := False;
          Exit;
       End;

       if (iPlanilha > 0) or (iDocumento > 0) then
       begin
          wStr := 'UPDATE PEDIDOFUNDO ' + #13;
          if iPlanilha > 0 then
          begin
             wStr := wStr + 'SET PLANO = ' + IntToStr(iPlano) + ', ' + #13;
             wStr := wStr + '    PLNCODIGO = ' + IntToStr(iPlanilha) + #13;
          end;
          if (iDocumento > 0) and (iPlanilha > 0) then
             wStr := wStr + ',   CODDOCUMENTO = ' + IntToStr(iDocumento) + #13
          else if iDocumento > 0 then
             wStr := wStr + 'SET CODDOCUMENTO = ' + IntToStr(iDocumento) + #13;

          wStr := wStr + 'WHERE IDPEDIDOFUNDO = '+ IntToStr(iIdPedidoFundo);

          if not ExecutaQuery(QryAux,wStr) then
             Abort;
       end;
   Except
      begin
         Result := False;
         MsgDlg('Ocorreu um problema na gravação da Operação dos Fundos.','Mensagem do Sistema',mtWarning,[MbOk],0);
      end;
   end;
end;

function TfrmCadLanctoVdFundoCpAcoes.GravaCompraAcoes(iIdCarteiraInvest, iIdCarteiraGerenc,
                                                      iIdInvestimento, iIdMercado, iIdGestor, iIdCustodiante : Integer;
                                                      dDataTrasf                  : TDateTime;
                                                      fQtdOper, fVlrOper, fPUOper : Double;
                                                      sFlagIR, sDescTipoOper, sDescInvestimento,
                                                      sNatuOper, sCodTipoAcao     : string) : boolean;
var
    wPlano, wPlanilha, wDocumento  : Integer;
begin
   Result := True;
   Try
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

      iIdForCli := OperComum.BuscaForCli(2,QryFundos.FieldByName('IDGESTORCARTEIRA').AsInteger,-35, pRPI.IDTIPOCLIENTEEMI);
      if iIdForCli = 0 then
      begin
         Result := False;
         Exit;
      end;

      with QryInsOperacaoinvest do
      begin
         Close;
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
         ParamByName('IDTIPOOPERACAO').AsInteger    := -44;
         ParamByName('DATAOPERACAO').AsDateTime     := dDataTrasf;
         ParamByName('NUMDOCUMENTO').AsString       := sBoleta;
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
      QryDetalhe.FieldByName('NUMDOCUMENTO').AsString      := sBoleta;
      QryDetalhe.Post;

      if (sNatuOper = 'D') then
         fVlrOper := fVlrOper * -1;

      //AL_9
      if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo, iIdInvestimento, 2{idtipoinvest(renda variável)},
                                        iIdOperacaoInvest, -1, -44{tipo de operação(compra de ações)},
                                        iIdCarteiraInvest, iIdCarteiraGerenc,
                                        -1, -1, -1, -1, -1, dDataTrasf,
                                        fVlrOper, fQtdOper, pRPI.VLRCOTAINICART, 0 , 0, fVlrIRProv,
                                        fVlrIR, 0, 0, 0, 0, 0,
                                        sNatuOper, sNatuOper,
                                        '',sDescTipoOper+' / '+ sDescInvestimento,'OPE',
                                        '1', '', True,-1, iPlanPrevCtbPatro, iIdHistCartInv) then
      begin
         MsgDlg('Problema ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                'Mensagem do Sistema', mtInformation,[MbOk],0);
         Result := False;
         Exit;
      end;

      if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
      begin
         MsgDlg('Problema ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                'esta Operação não poderá ser confirmada ','Mensagem do Sistema',mtInformation,[MbOk],0);
         Result := False;
         Exit;
      end;

      if iIdCarteiraGerenc <= 0 then
      begin
         if not OperacaoInvest.CadastraCustodia(iIdOperacaoInvest) then
         begin
            MsgDlg('Problema ao Atualizar Custodia, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema', mtInformation,[MbOk],0);
            Result := False;
            Exit;
         end;

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

   except
      Result := False;
   end;
end;

function TfrmCadLanctoVdFundoCpAcoes.CompraAcoes:boolean;
begin
   Result := True;

   bCriaLancto := True;
   frmAguarde.Pos := 0;
   frmAguarde.Max := qryDetalhe.RecordCount;
   frmAguarde.Mostra('Aguarde, Processando ...');
   qryDetalhe.First;
   while not qryDetalhe.EOF do
   begin
      if not GravaCompraAcoes(QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
                              QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger,
                              QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger,
                              QryTipoOperRV.FieldByName('IDMERCADO').AsInteger,
                              QryFundos.FieldByName('IDGESTORCARTEIRA').AsInteger,
                              QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger,
                              dbDtaTransf.Date,
                              QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat,
                              QryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                              QryDetalhe.FieldByName('PRECOUNITOPERACAO').AsFloat,
                              QryTipoOperRV.FieldByName('FLGTRATAIR').AsString,
                              QryTipoOperRV.FieldByName('DESCTIPOOPERACAO').AsString,
                              QryDetalhe.FieldByName('DESCINVESTIMENTO').AsString,
                              QryTipoOperRV.FieldByName('NATUREZAOPERACAO').AsString,
                              QryInvestimento.FieldByName('CODTIPOACAO').AsString) then
      begin
         //AL_9
         if dtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Rollback;
         frmAguarde.Apaga;
         Result := False;         
         Exit;
      end;

      if (QryDetalheDATAOPERACAO.AsDateTime <= pRPI.DATAULTFECH) then
         RendaVariavel.MarcarFlagReproc(QryDetalheIDINVESTIMENTO.AsInteger,
                                     -1, -1, QryDetalheDATAOPERACAO.AsDateTime);
      QryDetalhe.Next;
      frmAguarde.Pos := frmAguarde.Pos + 1;
   end;
end;

function TfrmCadLanctoVdFundoCpAcoes.OperInvesXOperFundo:boolean;
begin
   Result := True;
   frmAguarde.Pos := 0;
   frmAguarde.Max := qryDetalhe.RecordCount;
   frmAguarde.Mostra('Aguarde, Processando...');
   QryDetalhe.First;
   while not QryDetalhe.EOF do
   begin
      try
         with QryInsOperInvXOperFdo do
         begin
            Close;
            ParamByName('IDOPERACAOINVEST').AsInteger  := QryDetalhe.FieldByName('IDOPERACAOINVEST').AsInteger;
            ParamByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundo;
            ParamByName('DATAOPERACAO').AsDateTime     := StrToDate(dbDtaTransf.Text);
            ExecSQL;
            Close;
         end;
         QryDetalhe.Next;
         frmAguarde.Pos := frmAguarde.Pos + 1;
      except
         begin
            Result := False;
            MsgDlg('Ocorreu um problema na gravação da Operação.','Mensagem do Sistema',mtWarning,[MbOk],0);
         end;
      end;
   end;
end;

function TfrmCadLanctoVdFundoCpAcoes.ExcluiVendaFundo(iCodDocumento,iPlnCodigo,iPlano,
                                                     iTipoInvest,iIdHistFundo,iIdPedidoFundo:integer;
                                                     dDtaAplic:TDateTime):boolean;
begin
   Result := True;

   if not ProcExcluiFundo(QryResgateFundos.FieldByName('CODDOCUMENTO').AsInteger,
                          QryResgateFundos.FieldByName('PLNCODIGO').AsInteger,
                          QryResgateFundos.FieldByName('PLANO').AsInteger,
                          QryResgateFundos.FieldByName('IDTIPOINVEST').AsInteger,
                          QryResgateFundos.FieldByName('DATAAPLICACAO').AsDateTime, True) Then
   begin
      MsgDlg('Não foi possível excluir a integração Contábil e Financeira.','Mensagem do Sistema',mtWarning,[mbOk],0);
      //AL_9
      if dtmBaseDados.dbBaseDados.InTransaction then
         DtmBaseDados.dbBaseDados.Rollback;
      Exit;
   end;

   wStr := 'DELETE FROM HISTFUNDO WHERE IDHISTFUNDO = '+ IntToStr(QryResgateFundos.FieldByName('IDHISTFUNDO').AsInteger);
   if not ExecutaQuery(QryAux,wStr) then
   begin
      MsgDlg('Não foi possível excluir o Histórico da operação.','Mensagem do Sistema',mtWarning,[mbOk],0);
      //AL_9
      if dtmBaseDados.dbBaseDados.InTransaction then
         DtmBaseDados.dbBaseDados.Rollback;
      Exit;
   end;
   QryAux.Close;

   wStr := 'DELETE FROM OPERACAOFUNDO WHERE IDPEDIDOFUNDO = '+IntToStr(iIdPedidoFundo);

   if not ExecutaQuery(QryAux,wStr) then
   begin
      MsgDlg('Não foi possível excluir a Operação.','Mensagem do Sistema',mtWarning,[mbOk],0);
      //AL_9
      if dtmBaseDados.dbBaseDados.InTransaction then
         DtmBaseDados.dbBaseDados.Rollback;
      Exit;
   end;
   QryAux.Close;

   wStr := 'DELETE FROM PEDIDOFUNDO WHERE IDPEDIDOFUNDO = ' + IntToStr(iIdPedidoFundo);

   if not ExecutaQuery(QryAux,wStr) then
   begin
      MsgDlg('Não foi possível excluir o Pedido.','Mensagem do Sistema',mtWarning,[mbOk],0);
      //AL_9
      if dtmBaseDados.dbBaseDados.InTransaction then
         DtmBaseDados.dbBaseDados.Rollback;
      Exit;
   end;
   QryAux.Close;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.sbtnApagarClick(Sender: TObject);
var
  wStr : string;
begin
   if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
   begin
      //AL_3
      //AL_5
      if CtrlInvContab.TestaPeriodo(DateToStr(dbDtaTransf.Date), iTipoInvestUsu) then
      begin
         //AL_4
         if VerEmAbertura(QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
            Exit;

         if qry.FieldByName('IDOPERACAOINVEST').AsInteger > 0 then
         begin
            Try
               if not VerificaFechamentoOperacao(DateToStr(dbDtaTransf.Date)) then
                  Exit;

               if not dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               if not ExecutaQuery(QryAux,'DELETE FROM OPERINVXOPERFDO WHERE '+
                                          'IDOPERACAOFUNDO = '+
                                           qry.FieldByName('IDOPERACAOFUNDO').AsString) then
               begin
                  MsgDlg('Não foi possível excluir a operação.','Mensagem do Sistema',mtWarning,[mbOk],0);
                  //AL_9
                  if dtmBaseDados.dbBaseDados.InTransaction then
                     DtmBaseDados.dbBaseDados.Rollback;
                  Abort;
               end;
               QryAux.Close;

               //AL_9
               if not OperComum.EstornaOper('', QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger,
                                   qry.FieldByName('IDOPERACAOINVEST').AsInteger,
                                   QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger,
                                   dbDtaTransf.Date, pRPI.VLRCOTAINICART,'X', true) then
               begin
                  MsgDlg('Não é possível fazer a exclusão dessa operação.',
                         'Mensagem do Sistema',mtWarning,[MbOk],0);
                  //AL_9
                  if dtmBaseDados.dbBaseDados.InTransaction then
                     DtmBaseDados.dbBaseDados.RollBack;
                  Abort;
               end;

               ExcluiVendaFundo(QryResgateFundos.FieldByName('CODDOCUMENTO').AsInteger,
                                QryResgateFundos.FieldByName('PLNCODIGO').AsInteger,
                                QryResgateFundos.FieldByName('PLANO').AsInteger,
                                QryResgateFundos.FieldByName('IDTIPOINVEST').AsInteger,
                                QryResgateFundos.FieldByName('IDHISTFUNDO').AsInteger,
                                QryResgateFundos.FieldByName('IDPEDIDOFUNDO').AsInteger,
                                QryResgateFundos.FieldByName('DATAAPLICACAO').AsDateTime);

               DtmBaseDados.dbBaseDados.Commit;

               QryTipoFundoInvest.Close;
               QryTipoFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
               QryTipoFundoInvest.Open;

               If StrToDate(dbDtaCotaFD.Text) <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
               begin
                  If Not Reprocessamento(iTipoInvestUsu,
                                         QryFundos.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                         QryFundos.FieldByName('IDFUNDOINVEST').AsInteger,
                                         iPlanPrevCtbPatro,
                                         StrToDate(dbDtaCotaFD.Text),
                                         QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                         QryFundos.FieldByName('DTAINIPROC').AsDateTime,
                                         True) Then
                     //AL_8                    
                     MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                            'Mensagem do Sistema', MtInformation,[MbOk],0);
               end;

               MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema', MtWarning,[MbOk],0);

            Except
               Raise;
                  //AL_9
                  MsgDlg('Não foi possível Excluir essa Boleta.','Mensagem do Sistema ',MtWarning,[mbOK],0);
                  if dtmBaseDados.dbBaseDados.InTransaction then
                     DtmBaseDados.dbBaseDados.Rollback;
            end;
         end;
         sbtnInserir.Enabled  := True;
         sbtnProcurar.Enabled := True;
         sbtnAlterar.Enabled  := False;
         sbtnApagar.Enabled   := False;
         sbtnImprimir.Enabled := False;
         LimpaCampos;
      end
      else
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
   end;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.bbtnSairClick(Sender: TObject);
begin
  inherited;
   frmAguarde.Apaga;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.sbtnImprimirClick(Sender: TObject);
var
   fQtdTotal, fVlrTotal : Double;
begin
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

   DmRelatoriosFundo.rptVdFundosCpAcoeslblFundo.Caption         := dblFundo.Text;
   DmRelatoriosFundo.rptVdFundosCpAcoeslblCota.Caption          := FormatFloat('###,###,##0.000000000',QryAuxFD.FieldByName('VLRCOTA').AsFloat)+' ';
   DmRelatoriosFundo.rptVdFundosCpAcoeslblDataCota.Caption      := QryAuxFD.FieldByName('DATAOPERACAO').AsString;
   DmRelatoriosFundo.rptVdFundosCpAcoeslblVlrResgate.Caption    := FormatFloat('###,###,##0.00',QryAuxFD.FieldByName('VLROPERACAO').AsFloat)+' ';
   DmRelatoriosFundo.rptVdFundosCpAcoeslblQuantidade.Caption    := FormatFloat('###,###,##0.000000000',QryAuxFD.FieldByName('QTDOPERACAO').AsFloat)+' ';
   DmRelatoriosFundo.rptVdFundosCpAcoeslblGestor.Caption        := lblGestorFundo.Caption;
   DmRelatoriosFundo.rptVdFundosCpAcoeslblSumVlr.Caption        := FormatFloat('###,###,##0.00',fVlrTotal)+' ';

   TfrmPreview.CreateModalPreview(Application,
                                  DmRelatoriosFundo.rptVdFundosCpAcoes,
                                  DmRelatoriosFundo.rptVdFundosCpAcoes.PrinterSetup.DocumentName);

end;

procedure TfrmCadLanctoVdFundoCpAcoes.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;
    bAlteracao := True;
    sbtnImprimir.Enabled := False;
    dbgOperacao.Enabled  := True;
    pnlFundos.Enabled    := True;
    pnlRV.Enabled        := True;
    
    HabilitaIncAltExcDetalhe;

    sbtnAlterar.Enabled := False;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.BuscaSaldosCustodia;
begin
   fSaldoBloq := 0;
   fSaldoLib  := 0;
   if (QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger <> 0) and
      (QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger <> 0) and
      (QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger <> 0) and
      (dbDtaTransf.Text <> '') then
   begin
      //AL_6
      OperacaoInvest.BuscaSaldosCustodia(iPlanPrevCtbPatro,
                        QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger,
                        9999999,
                        QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger,
                        -1,'',dbDtaTransf.Date,fSaldoBloq, fSaldoLib);
   end;
end;

function TfrmCadLanctoVdFundoCpAcoes.VerificaSaldoLiberadoRV:boolean;
begin
   Result := True;
   if QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat > fSaldoLib then
   begin
      MsgDlg('Quantidade operada maior que saldo liberado.'+#13+
             'Saldo Liberado :'+FormatFloat('###,###,##0',fSaldoLib)+'','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
   end;
end;

procedure TfrmCadLanctoVdFundoCpAcoes.dblAcaoExit(Sender: TObject);
begin
  inherited;
   BuscaCotacaoRV;
   if ((dbeVlrOperRV.Value <> 0) and (dbeCotacaoRV.Value <> 0)) then
      QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat :=
         OperComum.Round((dbeVlrOperRV.Value / dbeCotacaoRV.Value),0);
end;

procedure TfrmCadLanctoVdFundoCpAcoes.dbDataOperRVExit(Sender: TObject);
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

procedure TfrmCadLanctoVdFundoCpAcoes.dbeCotacaoRVExit(Sender: TObject);
begin
  inherited;
   if ((dbeVlrOperRV.Value <> 0) and (QryDetalhe.FieldByName('PRECOUNITOPERACAO').Value <> 0)) then
      QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat :=
         OperComum.Round((dbeVlrOperRV.Value / dbeCotacaoRV.Value),0);         
end;

procedure TfrmCadLanctoVdFundoCpAcoes.dbeVlrOperRVExit(Sender: TObject);
begin
  inherited;
   if ((dbeVlrOperRV.Value <> 0) and (QryDetalhe.FieldByName('PRECOUNITOPERACAO').Value <> 0)) then
      QryDetalhe.FieldByName('QTDEOPERACAO').AsFloat :=
         OperComum.Round((dbeVlrOperRV.Value / dbeCotacaoRV.Value),0);
end;

procedure TfrmCadLanctoVdFundoCpAcoes.dblCarteiraRVExit(Sender: TObject);
begin
  inherited;
   if Trim(sDataOpe) <> '' then
      qryDetalhe.FieldByName('DATAOPERACAO').AsString := sDataOpe
   else
      qryDetalhe.FieldByName('DATAOPERACAO').AsString := dbDtaTransf.Text;

   if Trim(sDataLiq) <> '' then
      qryDetalhe.FieldByName('DATAVENCOPER').AsString := sDataLiq
   else
      qryDetalhe.FieldByName('DATAVENCOPER').AsString := dbDtaTransf.Text;
end;

end.
