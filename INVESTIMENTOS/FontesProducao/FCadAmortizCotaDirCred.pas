//******************************************************************************
// Data      : 14/06/2010
// Kintana   : 829671
// SOL       : 137379
// Motivo    : Alteração da Label de AMORTIZAÇÃO DE FUNDOS DE PARTICIPAÇÕES
//             para  AMORTIZAÇÃO DE FUNDOS
//Responsavel: Adilson Filho
//******************************************************************************
// Data      : 11/09/2007
// Código    : AL_25
// Pendencia : 25594
// SOL       : 56257
// Motivo    : Implementação na queryDetalhe e QryTotalDetalhe de ajuste para trazer a taxa na grid
//******************************************************************************
// Data      : 10/09/2007
// Código    : AL_24
// Pendência : 25641
// SOL       : 62560
// Motivo    : Implementações para ser utilizado pelo tipo de fundo de Participações
//******************************************************************************
// Data      : 26/06/2007
// Código    : AL_23
// Pendência :
// SOL       :
// Motivo    : Ajuste na rotina de amortização de saldo do custo
//******************************************************************************
// Data      : 26/06/2007
// Código    : AL_22
// Pendência : 25539
// SOL       : 61493
// Motivo    : Implementação do filtro por tipo de fundo na tela de Integralização de
//              Cotas para os Fundos de Participações e FIDC.
//******************************************************************************
// Data      : 26/06/2007
// Código    : AL_21
// Pendencia : 25594
// SOL       : 56257
// Motivo    : Implementação da taxa de ingresso conforme especificação
//******************************************************************************
// Data      : 30/05/2007
// Código    : AL_20
// Motivo    : Implementação de segregação de planos e otimização de query´s
//******************************************************************************
// Data      : 18/08/2006
// Código    : AL_19
// Motivo    : Implementação para buscar também os Fundos de FIC de FIDC(QryFundoInvestOperacao)
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_18
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 12/04/2006
// Código    : AL_17
// Motivo    : Implementação da contabilização da conta invest(CC ou CCI)
//******************************************************************************
// Data      : 30/03/2006
// Código    : AL_16
// Motivo    : Ajuste na busca da rentabilidade e na busca da data de liquidação
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_15
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 07/02/2006
// Código   : AL_14
// Motivo   : Ajuste na inserção, para desabilitar o botão "Procurar"
//******************************************************************************
// Data     : 22/09/2005
// Código   : AL_13
// Motivo   : Implementação do tipo de investimento no montaselec
//******************************************************************************
// Data     : 22/09/2005
// Código   : AL_12
// Motivo   : Implementação do custo e variação para contabilizar
//******************************************************************************
// Data     : 30/06/2005
// Código   : Al_11
// Motivo   : Acerto na query QryVerOperAmortizacao e no layout da tela.
//******************************************************************************
// Data     : 01/06/2005
// Código   : Al_10
// Motivo   : Padronização com begin e end
//******************************************************************************
// Data     : 01/06/2005
// Código   : Al_9
// Motivo   : Implementação da critica da data da operação
//******************************************************************************
// Data     : 01/06/2005
// Código   : Al_8
// Motivo   : Implementação do rollback, botão cancelar e exit
//******************************************************************************
// Data     : 01/06/2005
// Código   : Al_7
// Motivo   : Retirada as query´s qryParamInvest, QryProximOperacoes e QryVendaAcoes,
//            devido a falta de utilização
//******************************************************************************
// Data     : 01/06/2005
// Código   : AL_6
// Motivo   : Implementada a rotina que busca o codigo original da operação na HISTFUDO
//******************************************************************************
// Data     : 01/06/2005
// Código   : Al_5
// Motivo   : Alteração da mensagem de erro para uma similar
//******************************************************************************
// Data     : 30/05/2005
// Código   : AL_4
// Motivo   : Acerto na data de gravação da operacaofundo, passa a gravar a mesma q será contabilizada.
//******************************************************************************
// Data     : 31/05/2005
// Código   : AL_3
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 02/12/2004
// Código   : AL_2
// Motivo   : Acerto na Exclusao de Planilha e Documento
//            Acerto na gravação da Planilha e Coddocumento
//******************************************************************************
// Data     : 06/10/2004
// Código   : AL_1
// Motivo   : Inclusão do campo DTAINIPROC na QryFundoInvestOperacao e na funcao Reprocessamento
//*******************************************************************************
//Data	    : 06/04/2004
//Função    : Amortização de Cotas para Fundos de Direito Creditórios
//*******************************************************************************

unit FCadAmortizCotaDirCred;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, Buttons, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, TREdit,
  ComCtrls, TabControlDetalhe, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, CmEventosCadastro, ImgList, Wwdatsrc, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, uOperacaoInvest, usistema, fcLabel, uCtrlInvContab, 
  //AL_21
  FPreview, Mask, DBCtrls;

type
  TFrmCadAmortizCotaDirCred = class(TfrmCadastroCS)
    pnlMestre: TPanel;
    Label14: TLabel;
    Label2: TLabel;
    DblFundosInvest: TwwDBLookupCombo;
    DtEdDataReferenciaGeral: TCMDateTimePicker;
    tbcDetalhe: TTabControlDetalhe;
    pgctrlDetalhe: TPageControl;
    tbsDet: TTabSheet;
    pnlControlesDet: TPanel;
    //AL_21
    Dock974: TDock97;
    //AL_21
    dbgrdDet: TwwDBGrid;
    Dock973: TDock97;
    Panel1: TPanel;
    pnlTotais: TPanel;
    //AL_21
    DbVlrTotRend: TDBRealEdit;
    DbVlrTotCustoAtual: TDBRealEdit;
    DbSldTotAtual: TDBRealEdit;
    DbVlrTotCustoOrg: TDBRealEdit;
    Panel9: TPanel;
    UpdDetalhe: TUpdateSQL;
    QryDetalhe: TwwQuery;
    DsDetalhe: TwwDataSource;
    QryFundoInvestOperacao: TwwQuery;
    QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField;
    QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestOperacaoTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestOperacaoTRGUSERINCLUSAO: TStringField;
    QryFundoInvestOperacaoMOECODIGO: TFloatField;
    QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoCNPJFUNDO: TStringField;
    QryFundoInvestOperacaoSTAEXCLUSIVO: TStringField;
    QryFundoInvestOperacaoPZOCARENCIA: TFloatField;
    QryFundoInvestOperacaoPZOANIVERSARIO: TFloatField;
    QryFundoInvestOperacaoPZOLIQAPLIC: TFloatField;
    QryFundoInvestOperacaoPZOLIQRESG: TFloatField;
    QryFundoInvestOperacaoQTDDECQTD: TFloatField;
    QryFundoInvestOperacaoQTDDECVALOR: TFloatField;
    QryFundoInvestOperacaoSTAFUNDO: TStringField;
    QryFundoInvestOperacaoPZOAMORTIZACAO: TFloatField;
    QryFundoInvestOperacaoPERCTXPERFORM: TFloatField;
    QryFundoInvestOperacaoPERCTXADM: TFloatField;
    QryFundoInvestOperacaoCODFUNCETIP: TStringField;
    QryFundoInvestOperacaoSTAPROVISIONAIR: TStringField;
    QryFundoInvestOperacaoSTAPROVISIONAIOF: TStringField;
    QryFundoInvestOperacaoCONTRCETIP: TStringField;
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
    //Al_15
    QryBuscaTipoOperFLGCONTAINVEST: TFloatField;    
    QryOperacao: TwwQuery;
    DsOperacao: TwwDataSource;
    UpdOperacao: TUpdateSQL;
    QryTipoFundo: TwwQuery;
    qryAux: TwwQuery;
    QryVerOperAmortizacao: TwwQuery;
    DsTotalDetalhe: TwwDataSource;
    QryTotalDetalhe: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    Toolbar974: TToolbar97;
    BtAltAplic: TSpeedButton;
    BtExcAplic: TSpeedButton;
    BtIncAplic: TSpeedButton;
    sbtnImprimir: TToolbarButton97;
    //AL_21
    QryDetalheDATAAPLICACAO: TDateTimeField;
    QryDetalheDATAMOVFUNDO: TDateTimeField;
    QryDetalheVLRAPLICADO: TFloatField;
    QryDetalheVLRCUSTOATUAL: TFloatField;
    QryDetalheVLRRENDIMENTO: TFloatField;
    QryDetalheSALDOVLRFUNDO: TFloatField;
    QryDetalheIDFUNDOINVEST: TFloatField;
    QryDetalheIDHISTFUNDO: TFloatField;
    QryDetalheIDTIPOOPERACAO: TFloatField;
    QryDetalheIDCARTEIRAINVEST: TFloatField;
    QryDetalheIDOPERACAOFUNDO: TFloatField;
    //AL_20
    QryDetalheDATAULTPGTOIR: TDateTimeField;
    //AL_20
    QryDetalheVLRMOVFUNDO: TFloatField;
    QryDetalheVLRIRPROV: TFloatField;
    QryDetalheVLRIOFPROV: TFloatField;
    QryDetalheCOTASMOVFUNDO: TFloatField;
    QryDetalheSALDOQTDCOTAS: TFloatField;
    QryDetalheCOTAAPLICACAO: TFloatField;
    QryDetalheCODDOCUMENTO: TFloatField;
    QryDetalhePLNCODIGO: TFloatField;
    QryDetalhePLANO: TFloatField;
    //Al_7
    QryDetalheIDTIPOINVEST: TFloatField;
    //Al_7
    QryValorAmortizado: TwwQuery;
    QryUpdIrLitigio: TwwQuery;
    Label7: TLabel;
    Label8: TLabel;
    QryTipoCota: TwwQuery;
    Label9: TLabel;
    dblTipoCota: TwwDBLookupCombo;
    QryDetalheIDTIPOCOTA: TFloatField;
    //AL_20
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    QryFundoInvestOperacaoDTAINIPROC: TDateTimeField;
    QryOperFundo: TwwQuery;
    //AL_21
    dblTipoFundo: TwwDBLookupCombo;
    TipoFundo: TLabel;
    pgcOperacao: TPageControl;
    tbsOper: TTabSheet;
    tbsTaxa: TTabSheet;
    Label3: TLabel;
    dbrVlrCustoTotal: TDBRealEdit;
    Label6: TLabel;
    dbrVlrRendTotal: TDBRealEdit;
    Label4: TLabel;
    dbrVlrSaldoAtual: TDBRealEdit;
    Label5: TLabel;
    DtEdDataOperacao: TCMDateTimePicker;
    DtEdDataLiquidacao: TCMDateTimePicker;
    lblDtLiquidacao: TLabel;
    //AL_21
    Label1: TLabel;
    DbValorCustoNovo: TDBRealEdit;
    Label10: TLabel;
    DBEVlrTaxa: TDBRealEdit;
    dbeTipoOperTx: TDBEdit;
    Label11: TLabel;
    qryTipoOperTx: TwwQuery;
    dsTipoOperTx: TwwDataSource;
    qryAux1: TwwQuery;
    QryDetalheVLRTAXAS: TFloatField;
    DbVlrTotTaxas: TDBRealEdit;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure DtEdDataOperacaoExit(Sender: TObject);
    procedure BtIncAplicClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure DbValorCustoNovoExit(Sender: TObject);
    procedure DblFundosInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DtEdDataReferenciaGeralExit(Sender: TObject);
    //AL_21
    procedure FormCreate(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dblTipoCotaExit(Sender: TObject);
    //AL_20
    procedure DblFundosInvestEnter(Sender: TObject);
    procedure DblFundosInvestExit(Sender: TObject);
    //AL_22
    procedure dblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoFundoEnter(Sender: TObject);
    procedure dblTipoFundoExit(Sender: TObject);
    procedure dblTipoCotaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoCotaEnter(Sender: TObject);
    //AL_21
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    //AL_20
    bModif  : Boolean;
    sVarAnt : string;

    function  GravaOperacao               : Boolean;
    function  GravaAmortizaCustoAtual     : Boolean;
    function  GravaIRAmortizacao          : Boolean;
    // AL_3
    function  GravaValorContabil          : Boolean;
    // AL_3 - fim
    //Al_6
    function  VerificaOperacaoAmortizacao(Var iOperOrigem : Integer) : Boolean;

    procedure AbreQry;
    procedure TrataTela;

  public
    { Public declarations }
  end;

var
  FrmCadAmortizCotaDirCred: TFrmCadAmortizCotaDirCred;
  iIdForCli, iPlanilha, iDocumento, iPlano : Integer;
  sRecPag  : String;
  fValorAplicado, fValorOperacao, fValorAmortizado, fVlrIR   : Double;
  fVlrRendimento : Double;

implementation

uses UFundoComum, dFundoComum, UDataBase, dBaseDados, UOperComum,
     UBibliotecaInvest, UmensErro, UDiasUteisInv, UImpostos, fAguarde,
     FDmRelatoriosFundos, FCadLanctoVdFundoCpAcoes, FPrincipal;

{$R *.DFM}

procedure TFrmCadAmortizCotaDirCred.FormShow(Sender: TObject);
begin
  inherited;
   dbgrdDet.BringToFront;
   //AL_21
   OperComum.LimpaParametros(QryOperacao);
   QryOperacao.Open;

   //AL_22
   OperComum.LimpaParametros(QryTipoFundo);
   QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTipoFundo.Open;
   if QryTipoFundo.RecordCount = 1 then
   begin
      dblTipoFundo.LookupValue := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString;
      dblTipoFundo.PerFormSearch;

      DtEdDataReferenciaGeral.Date := QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime;
   end;

   //AL_21
   OperComum.LimpaParametros(QryTipoCota);
   QryTipoCota.Open;

   //AL_21
   OperComum.LimpaParametros(QryFundoInvestOperacao);
   QryFundoInvestOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   if Trim(dblTipoFundo.Text) <> '' then
      QryFundoInvestOperacao.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
   if DtEdDataReferenciaGeral.Text <> '' then
      QryFundoInvestOperacao.ParamByName('DATAMOVFUNDO').AsString  := DtEdDataReferenciaGeral.Text;
   QryFundoInvestOperacao.Open;

   //AL_21
   OperComum.LimpaParametros(qryTipoOperTx);
   qryTipoOperTx.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   qryTipoOperTx.Open;   
   
   //AL_13
   MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu));
   //AL_20
   MontaSelect.Filtro.Add('OPERACAOFUNDO.IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro));
end;

procedure TFrmCadAmortizCotaDirCred.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
   //AL_21
end;

procedure TFrmCadAmortizCotaDirCred.sbtnImprimirClick(Sender: TObject);
begin
  inherited;
   //AL_21
   DmRelatoriosFundo.ppBDEPConsAmortizacaoCotas.DataSource := FrmCadAmortizCotaDirCred.DsDetalhe;
   DmRelatoriosFundo.pplFundo.Caption            := Trim(DblFundosInvest.Text);
   DmRelatoriosFundo.ppLValorAmortizado.Caption  := FloatToStrF(fValorAmortizado,ffNumber,18,2);
   DmRelatoriosFundo.LblPlanoAmort.Caption       := sPlanPrevCtbPatro;

   TFrmPreview.CreateModalPreview(Application,
                                  DmRelatoriosFundo.ppRConsAmortizacaoCotas,
                                  DmRelatoriosFundo.ppRConsAmortizacaoCotas.PrinterSetup.DocumentName);
   sbtnImprimir.Down := False;
end;

procedure TFrmCadAmortizCotaDirCred.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
  Begin
     //AL_22
     QryTipoFundo.Locate('IDTIPOFUNDOINVEST',MontaSelect.ValoresChave[3],[]);
     dblTipoFundo.Text         := QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString;
     dblTipoFundo.LookupValue  := MontaSelect.ValoresChave[3];

     DtEdDataReferenciaGeral.DateTime := StrToDate(MontaSelect.ValoresChave[1]);

     //AL_20
     OperComum.LimpaParametros(QryFundoInvestOperacao);
     QryFundoInvestOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     if Trim(dblTipoFundo.Text) <> '' then
        QryFundoInvestOperacao.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
     if DtEdDataReferenciaGeral.Text <> '' then
        QryFundoInvestOperacao.ParamByName('DATAMOVFUNDO').AsString  := DtEdDataReferenciaGeral.Text;
     QryFundoInvestOperacao.Open;

     QryFundoInvestOperacao.Locate('IDFUNDOINVEST',MontaSelect.ValoresChave[0],[]);
     DblFundosInvest.Text         := QryFundoInvestOperacao.FieldByName('DESCFUNDOINVEST').AsString;
     DblFundosInvest.LookupValue  := MontaSelect.ValoresChave[0];

     QryTipoCota.Locate('IDTIPOCOTA',MontaSelect.ValoresChave[2],[]);
     dblTipoCota.Text             := QryTipoCota.FieldByName('DESCTIPOCOTA').AsString;
     dblTipoCota.LookupValue      := MontaSelect.ValoresChave[2];
     AbreQry;
     TrataTela;
  End;
  PnlFundo.Enabled  := True;
  //AL_21
  sbtnProcurar.Down := False;
end;

procedure TFrmCadAmortizCotaDirCred.DtEdDataOperacaoExit(Sender: TObject);
begin
  inherited;
  While not DiasUteisInv.DiaUtil(DtEdDataOperacao.DateTime,-1,1,'',True,False,False) Do
      DtEdDataOperacao.DateTime := DtEdDataOperacao.DateTime + 1;
end;

procedure TFrmCadAmortizCotaDirCred.BtIncAplicClick(Sender: TObject);
begin
   //Al_17
   OperComum.LimpaParametros(QryBuscaTipoOper);
   QryBuscaTipoOper.ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvestUsu;
   QryBuscaTipoOper.ParamByName('IDTIPOOPERACAO').AsInteger := -43;
   QryBuscaTipoOper.Open;

   If QryBuscaTipoOper.IsEmpty Then
   begin
      //AL_21
      MsgDlg('Parametrizar a operação de Amortização de Cotas para o Investimento.',
             'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;

  inherited;

   BtIncAplic.Enabled        := False;
   BtExcAplic.Enabled        := False;
   //Al_14
   sbtnProcurar.Enabled      := False;
   pnlMestre.Enabled         := False;
   pnlTotais.Visible         := False;

   pnlControlesDet.BringToFront;

   //AL_21
   pgcOperacao.ActivePage  := tbsOper;   
   tbsOper.Enabled         := True;
   tbsTaxa.Enabled         := True;   

   QryOperacao.Close;
   QryOperacao.Open;
   QryOperacao.Append;

   DtEdDataOperacao.DateTime := DtEdDataReferenciaGeral.DateTime;

   //AL_16
   QryOperacao.FieldByName('DATALIQUIDACAO').AsDateTime    := DiasUteisInv.SomaDiasUteis(DtEdDataReferenciaGeral.DateTime,
                                                                      QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger,
                                                                      -1,1,'',True,False,False);

   if QryOperacao.FieldByName('DATALIQUIDACAO').AsDateTime  = 0 then
      QryOperacao.FieldByName('DATALIQUIDACAO').AsDateTime := DtEdDataReferenciaGeral.DateTime;

   if DtEdDataOperacao.Canfocus then
      DtEdDataOperacao.SetFocus;
end;

procedure TFrmCadAmortizCotaDirCred.bbtnOkDetClick(Sender: TObject);
//AL_21
var
  dDataOper, dDataLiq : TDateTime;
  iOperacaoFundo : Integer;
  fVlrTaxas : Currency;
begin
   //Al_9
   If Trim(DtEdDataOperacao.Text) = '' Then
   Begin
      MsgDlg('A Data da Operação não pode em branco.', 'Atenção.',mtWarning, [mbOk], 0);
      if DtEdDataOperacao.Canfocus then
         DtEdDataOperacao.SetFocus;
      Exit;
   End;
   //Al_9 - Fim

   // Testa período contabil
   //AL_18
   if not CtrlInvContab.TestaPeriodo(DtEdDataOperacao.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if DtEdDataOperacao.Canfocus then
         DtEdDataOperacao.SetFocus;
      Exit;
   end;

   //AL_15
   if VerEmAbertura(QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   If DtEdDataOperacao.DateTime > QryTipoFundo.FieldByName('DATAULTFECH').AsdateTime Then
   Begin
      MsgDlg('Data do Movimento maior que a data do Último Fechamento!','Mensagem do Sistema',mtInformation ,[mbOk],0);
      if DtEdDataOperacao.Canfocus then
         DtEdDataOperacao.SetFocus;
      Exit;
   End;

   If DtEdDataLiquidacao.DateTime < DtEdDataOperacao.DateTime Then
   Begin
      MsgDlg('Data de Liquidação menor que a data do Movimento!','Mensagem do Sistema',mtInformation ,[mbOk],0);
      if DtEdDataLiquidacao.Canfocus then
         DtEdDataLiquidacao.SetFocus;
      Exit;
   End;

   // AL_3 - Inicio
   If DbValorCustoNovo.Value > DbSldTotAtual.Value Then
   Begin
      MsgDlg('Valor da Operação não pode ser maior que o Saldo Atual.', 'Atenção.',mtWarning, [mbOk], 0);
      if DbValorCustoNovo.Canfocus then
         DbValorCustoNovo.SetFocus;
      Exit;
   End;

   If DbValorCustoNovo.Value <= 0 Then
   Begin
      MsgDlg('Valor de Custo Atual não pode ser igual ou menor que zero.', 'Atenção',mtWarning, [mbOk], 0);
      if DbValorCustoNovo.Canfocus then
         DbValorCustoNovo.SetFocus;
      Exit;
   End;

   //AL_21
   if DBEVlrTaxa.Value <> 0 then
   begin
      if qryTipoOperTx.IsEmpty then
      begin
         MsgDlg('Não foi cadastrado o tipo de operação -175 da Taxa de Saída.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         if DBEVlrTaxa.CanFocus then
            DBEVlrTaxa.SetFocus;
         Exit;
      end;
   end;   

   Try
      // Inicia Transação
      If not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      //AL_21
      dDataOper := DtEdDataOperacao.Date;
      fVlrTaxas := DBEVlrTaxa.Value;

      QryOperacao.FieldByName('VLRTAXAS').clear;

      //Grava na tabela OperacaoFundo o total da operacao
      If Not GravaOperacao Then
      //Al_8
      begin
         //AL_21
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;
         OperComum.LimpaParametros(QryOperacao);
         bbtnCancelarDetClick(Sender);
         Exit;
      end;
      //Al_8 - Fim

      iPlanilha  := -1;
      iDocumento := -1;
      iPlano     := -1;

      //AL_20
      iIdForCli := OperComum.BuscaForCli(iTipoInvestUsu,
                                         QryFundoInvestOperacao.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                         QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                         pRPI.IDTIPOCLIENTEEMI);

      fValorOperacao := DbValorCustoNovo.Value;

      //Inicia a amortizacao do custo atual
      If Not GravaAmortizaCustoAtual Then
      //Al_8
      begin
         //AL_21
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;
         OperComum.LimpaParametros(QryOperacao);
         bbtnCancelarDetClick(Sender);
         Exit;
      end;
      //Al_8 - Fim

      // Se o custo atual foi todo resgatado, a difrenca deve ser resgatada do saldo atual e
      // cobrada a aliquota do IR
      fValorOperacao := DbValorCustoNovo.Value - dbrVlrCustoTotal.Value;

      //Al_10
      If fValorOperacao > 0 Then
      begin
         //Calcula o IR do valor que exceder o valor de custo e contabiliza
         If Not GravaIRAmortizacao Then
         //Al_8
         begin
            //AL_21
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            OperComum.LimpaParametros(QryOperacao);
            bbtnCancelarDetClick(Sender);
            Exit;
         end;
         //Al_8 - Fim
      end;
      //Al_10 - Fim

      //AL_17
      //Al_12
      If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                      QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                      iTipoInvestUsu,
                                      QryFundoInvestOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                      QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                      iIdForCli,
                                      QryOperacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                      QryOperacao.FieldByName('DATAOPERACAO').AsDateTime,
                                      QryOperacao.FieldByName('DATALIQUIDACAO').AsDateTime,
                                      'OPE',
                                      QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString,
                                      DblFundosInvest.Text+' / '+sPlanPrevCtbPatro,
                                      True, DbValorCustoNovo.Value,
                                      0, 0, 0, 0,
                                      DbValorCustoNovo.Value, DbValorCustoNovo.Value,
                                     -1, 0, 0, 0,
                                     QryBuscaTipoOper.FieldByName('FLGCONTAINVEST').AsInteger) Then
      begin
         //Al_7
         //AL_21
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;
         bbtnCancelarDetClick(Sender);
         exit;
         //Al_7 - Fim
      end;

      //Al_2
      With DmFundoComum.QryUpdOpeFinCtb Do
      Begin
         Opercomum.LimpaParametros(DmFundoComum.QryUpdOpeFinCtb);
         ParamByName('IDOPERACAOFUNDO').AsInteger   := QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger;
         ParamByName('PLANO').AsInteger             := iPlano;
         ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
         ParamByName('CODDOCUMENTO').AsInteger      := iDocumento;
         ExecSQL;
      End;      

      //AL_20
      if fVlrTaxas <> 0 then
      begin
         dDataLiq := DiasUteisInv.SomaDiasUteis(dDataOper,
                                                qryTipoOperTx.FieldByName('VENCIMENTO').AsInteger,
                                                -1, 1, '', True, False, False);
         iOperacaoFundo := QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger;

         QryOperacao.Insert;
         QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger   := LeUltRegistro(Nil,'OPERACAOFUNDO');
         QryOperacao.FieldByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
         QryOperacao.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
         QryOperacao.FieldByName('IDTIPOOPERACAO').AsInteger    := qryTipoOperTx.FieldByName('IDTIPOOPERACAO').AsInteger;
         QryOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger  := QryFundoInvestOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger;
         QryOperacao.FieldByName('IDFUNDOINVEST').AsInteger     := QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
         QryOperacao.FieldByName('IDTIPOCOTA').AsInteger        := QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger;

         QryOperacao.FieldByName('IDOPERACAOORIGEM').AsInteger  := iOperacaoFundo;

         QryOperacao.FieldByName('DATAOPERACAO').AsDateTime     := dDataOper;
         QryOperacao.FieldByName('DATALIQUIDACAO').AsDateTime   := dDataLiq;

         QryOperacao.FieldByName('VLRTAXAS').AsFloat            := fVlrTaxas;
         
         DBEVlrTaxa.Value := fVlrTaxas;

         iPlano     := -1;
         iPlanilha  := -1;
         iDocumento := -1;

         iIdForCli := OperComum.BuscaForCli(iTipoInvestUsu,
                                            QryFundoInvestOperacao.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                            qryTipoOperTx.FieldByName('IDTIPOOPERACAO').AsInteger,
                                            pRPI.IDTIPOCLIENTEEMI);

         if Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                         qryTipoOperTx.FieldByName('IDTIPOOPERACAO').AsInteger,
                                         iTipoInvestUsu,
                                         QryFundoInvestOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger
                                         iIdForCli,
                                         QryOperacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                         QryOperacao.FieldByName('DATAOPERACAO').AsDateTime,
                                         QryOperacao.FieldByName('DATALIQUIDACAO').AsDateTime,
                                         qryTipoOperTx.FieldByName('TIPOMOVTO').AsString,
                                         qryTipoOperTx.FieldByName('NATUREZAOPERACAO').AsString,
                                         QryFundoInvestOperacao.FieldbyName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                         True,
                                         QryOperacao.FieldByName('VLRTAXAS').AsFloat,
                                         0, 0, 0, 0, 0, 0,
                                         StrToInt(dblTipoCota.lookupvalue),
                                         0, 0, 0,
                                         qryTipoOperTx.FieldByName('FLGCONTAINVEST').AsInteger) Then
         begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            bbtnCancelarDetClick(Sender);
            exit;
         end;

         QryOperacao.Post;
         QryOperacao.CommitUpdates;         

         With DmFundoComum.QryUpdOpeFinCtb Do
         Begin
            Opercomum.LimpaParametros(DmFundoComum.QryUpdOpeFinCtb);
            ParamByName('IDOPERACAOFUNDO').AsInteger   := QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger;
            ParamByName('PLANO').AsInteger             := iPlano;
            ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
            ParamByName('CODDOCUMENTO').AsInteger      := iDocumento;
            ExecSQL;
         End;
      end;

      // Confirma Transação
      dtmBaseDados.dbBaseDados.Commit;

      //AL_21
      Opercomum.LimpaParametros(QryTipoFundoInvest);
      QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger := QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryTipoFundoInvest.Open;

      If StrToDate(DtEdDataReferenciaGeral.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
      begin
         //Alt_1
         If Not Reprocessamento(iTipoInvestUsu,
                                QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                iPlanPrevCtbPatro,
                                StrToDate(DtEdDataReferenciaGeral.Text),
                                QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                QryFundoInvestOperacao.FieldByName('DTAINIPROC').AsDateTime,
                                True,
                                QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger) Then
            MsgDlg('Atenção : A Operação foi concluída com sucesso!'+#13+
                   'Mas o Reprocessamento foi cancelado!'+#13+
                   'Faça o Reprocessamento para esse Fundo, a partir desse dia!',
                   'Mensagem do Sistema', MtInformation,[MbOk],0);
      end;

      //AL_21
      QryTipoFundoInvest.Close;      

      AbreQry;

   Except
      On E:Exception Do Begin
         //Al_5
         MsgDlg('Não foi possível Incluir Amortização de Cotas:'+#13+
                E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);         
         //Al_5 - Fim
         //AL_21
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;
         OperComum.LimpaParametros(QryOperacao);                
      End;
   End;

   //AL_21
   QryAux.Close;   

   BtIncAplic.Enabled      := True;
   BtExcAplic.Enabled      := True;
   //Al_14
   sbtnProcurar.Enabled    := True;
   pnlMestre.Enabled       := True;
   BtIncAplic.Down         := False;
   pnlTotais.Visible       := True;
   dbgrdDet.BringToFront;
   TrataTela;
   if DtEdDataReferenciaGeral.Canfocus then
      DtEdDataReferenciaGeral.SetFocus;
   // AL_3 - Fim
end;

procedure TFrmCadAmortizCotaDirCred.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
   BtIncAplic.Enabled      := True;
   BtExcAplic.Enabled      := False;
   //Al_14
   sbtnProcurar.Enabled    := True;   
   pnlMestre.Enabled       := True;
   BtIncAplic.Down         := False;
   pnlTotais.Visible       := True;

   //AL_21
   pgcOperacao.ActivePage  := tbsOper;   
   tbsOper.Enabled         := True;
   tbsTaxa.Enabled         := True;   
                                           
   dbgrdDet.BringToFront;
end;

procedure TFrmCadAmortizCotaDirCred.DbValorCustoNovoExit(Sender: TObject);
begin
  inherited;
   If DbValorCustoNovo.Value > (DbSldTotAtual.Value) Then
   Begin
      MsgDlg('O Valor da Operação é maior que o Saldo Atual!', 'Atenção.',mtWarning, [mbOk], 0);
      if DbValorCustoNovo.Canfocus then
         DbValorCustoNovo.SetFocus;
   End;
end;

function TFrmCadAmortizCotaDirCred.GravaOperacao : Boolean;
Begin
   Try
      QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger   := LeUltRegistro(Nil,'OPERACAOFUNDO');

      //AL_21
      QryOperacao.FieldByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryOperacao.FieldByName('IDTIPOOPERACAO').AsInteger    := QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger;
      QryOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger  := QryFundoInvestOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger;
      //Al_4
      QryOperacao.FieldByName('DATAOPERACAO').AsDateTime     := DtEdDataOperacao.DateTime;
      QryOperacao.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryOperacao.FieldByName('IDFUNDOINVEST').AsInteger     := StrToInt(DblFundosInvest.LookupValue);
      QryOperacao.FieldByName('IDTIPOCOTA').AsInteger        := QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger;
      QryOperacao.Post;
      QryOperacao.CommitUpdates;
      Result := True;
   Except
      //Al_5
      MsgDlg('Não foi possível gravar a Operação!','Mensagem do Sistema.',mtWarning ,[mbOk],0);
      Result := False;
   End;
End;

function TFrmCadAmortizCotaDirCred.GravaAmortizaCustoAtual : Boolean;
Var
   //AL_23
   fValorGravar, fValorAcertoSaldo, fValorAtualCusto : Double;
Begin
   Try
      fValorAcertoSaldo := 0;
      fValorGravar      := fValorOperacao;
      fValorOperacao    := DbValorCustoNovo.Value;
      QryDetalhe.First;
      While Not QryDetalhe.Eof Do
      Begin
         If (fValorGravar > 0) Then
         Begin
            fValorAcertoSaldo := fValorGravar;
            //AL_23
            fValorAplicado    := QryDetalhe.FieldByName('VLRAPLICADO').AsFloat - fValorGravar;
            fValorGravar      := fValorGravar - QryDetalhe.FieldByName('VLRAPLICADO').AsFloat;

            If fValorAplicado <  0 Then
               fValorAplicado := 0;

            If fValorGravar   < 0 Then
               fValorGravar   := 0;
         End
         Else
            fValorGravar      := QryDetalhe.FieldByName('VLRAPLICADO').AsFloat;

         //AL_23
         If fValorOperacao > 0 Then
         Begin
            If ((QryDetalhe.FieldByName('SALDOVLRFUNDO').AsFloat-fValorAplicado) >= fValorOperacao) Then
               fValorOperacao   := 0;
         End;

         If (fValorAplicado > QryDetalhe.FieldByName('VLRCUSTOATUAL').AsFloat) Then
             fValorAtualCusto   := QryDetalhe.FieldByName('VLRAPLICADO').AsFloat
         Else
             fValorAtualCusto   := QryDetalhe.FieldByName('VLRCUSTOATUAL').AsFloat;

         //AL_21
         If Not GravaAplicacaoResgate(iTipoInvestUsu,
                                      QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                      QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                      QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                      QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                      QryDetalhe.FieldByName('DATAAPLICACAO').AsDateTime,
                                      DtEdDataOperacao.DateTime,
                                      QryDetalhe.FieldByName('DATAULTPGTOIR').AsDateTime,
                                      Trim(QryBuscaTipoOperDESCTIPOOPERACAO.AsString)+' / '+
                                      QryFundoInvestOperacao.FieldByName('DESCFUNDOINVEST').AsString,
                                      '', 'OPE',
                                      fValorAplicado,
                                      QryDetalhe.FieldByName('VLRMOVFUNDO').AsFloat,
                                      QryDetalhe.FieldByName('VLRIRPROV').AsFloat,
                                      QryDetalhe.FieldByName('VLRIOFPROV').AsFloat, 0,
                                      QryDetalhe.FieldByName('COTASMOVFUNDO').AsFloat,
                                      QryDetalhe.FieldByName('SALDOQTDCOTAS').AsFloat,
                                      QryDetalhe.FieldByName('SALDOVLRFUNDO').AsFloat,
                                      QryDetalhe.FieldByName('COTAAPLICACAO').AsFloat,
                                      fValorAtualCusto{Valor anterior},
                                      iPlanPrevCtbPatro, -1, -1,
                                      QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger) Then
            Raise Exception.Create('Ocorreu um problema ao Amortizar o Valor de Custo da operação.');

         //AL_23
         If ((fValorGravar = 0) or (fValorOperacao <= 0)) Then
            QryDetalhe.Last;

         QryDetalhe.Next;
      End;
      Result := True;
   Except
      //AL_21
      On E:Exception Do
      begin
         MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         Result := False;
      end;
   End;
End;

function TFrmCadAmortizCotaDirCred.GravaIRAmortizacao : Boolean;
Begin
   Try
      fVlrRendimento := 0;
      //AL_21
      fVlrIR  := Impostos.CalculaIR(iTipoInvestUsu,
                    0{Investiment}, 0{Carteira}, 0{CARTEIRAGERENC}, 0{TipoOperacao}, 0{Mercad}, ''{Lote},
                    DtEdDataOperacao.DateTime, DtEdDataOperacao.DateTime,
                    0,
                    fValorOperacao, 0{Valor Iof},
                    QryFundoInvestOperacao.FieldByName('STAPROVISIONAIR').AsString,
                    'G',fVlrRendimento);
      If fVlrIR > 0 Then
      Begin
         OperComum.LimpaParametros(QryUpdIrLitigio);
         QryUpdIrLitigio.ParamByName('IDOPERACAOFUNDO').AsInteger :=
                                QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger;
         QryUpdIrLitigio.ParamByName('VLRIR').AsFloat             := fVlrIR;
         QryUpdIrLitigio.ExecSql;

         //AL_21
         if not Impostos.GravaIrLitigio(iTipoInvestUsu,
                         DtEdDataOperacao.DateTime,
                         -1,
                        'IR DA AMORTIZAÇÃO - '+QryFundoInvestOperacao.FieldByName('DESCFUNDOINVEST').AsString,
                         -1, iPlanoPrevContab, iPatrocinadora, fVlrIR,
                         fVlrRendimento,-1,QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger) then
            //Al_5
            Raise Exception.Create('Não foi possivel gravar o IR Litígio.');

         //AL_21
         If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo,
                                      iTipoInvestUsu,
                                      -30,
                                      QryFundoInvestOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                      QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                      iIdForCli, 0,
                                      iPlano, iPlanilha, iDocumento,
                                      fVlrIR,
                                      DtEdDataOperacao.DateTime, DtEdDataOperacao.DateTime,
                                      QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString, 'OPE',
                                      QryFundoInvestOperacao.FieldByName('DESCFUNDOINVEST').AsString) Then
            Raise Exception.Create('Ocorreu um problema na contabilização do IR Litígio.');
      End;
      Result := True;
   Except
      //Al_5
      On E:Exception Do
      Begin
         MsgDlg('A operação será Cancelada:'+#13+
                 E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         Result := False;
      end;
      //Al_5
   End;
End;

function TFrmCadAmortizCotaDirCred.GravaValorContabil : Boolean;
var
   I         : Integer;
   wDataVenc : TDateTime;
Begin
   Try
      I :=1;
       wDataVenc := DtEdDataOperacao.DateTime;

      While I<= QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger Do
      Begin
         wDataVenc := wDataVenc+1;
         While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
           wDataVenc := wDataVenc+1;   // Achar o próximo dia útil
         I:=I+1;
      End;

      //AL_21
      If Not ContabilizaOperFundos(Sistema.IdEmpresa, Sistema.IdModulo,
                                   iTipoInvestUsu,
                                   QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                   QryFundoInvestOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                   QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                   iIdForCli, 0,
                                   iPlano, iPlanilha, iDocumento,
                                   DbValorCustoNovo.Value,
                                   DtEdDataOperacao.DateTime, wDataVenc,
                                   QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString, 'OPE',
                                   QryFundoInvestOperacao.FieldByName('DESCFUNDOINVEST').AsString) Then
         Raise Exception.Create('Ocorreu um problema na contabilização da operação.');

      With dmFundoComum.QryVerificaTipoOper Do
      Begin
         //AL_21
         OperComum.LimpaParametros(dmFundoComum.QryVerificaTipoOper);
         ParamByName('IDTIPOOPERACAO').AsInteger := -43;
         Open;
         sRecPag := FieldByName('RECPAG').AsString;
         Close;
      End;

      If Not CriarLanctoDocumentoOpe(DbValorCustoNovo.Value,
                  DtEdDataOperacao.DateTime,
                  QryOperacao.FieldByName('IDFUNDOINVEST').AsInteger,
                  QryOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                  iPlano, iPlanilha, iDocumento,
                  Trim(QryBuscaTipoOperDESCTIPOOPERACAO.AsString)+' / '+
                  QryFundoInvestOperacao.FieldByName('DESCFUNDOINVEST').AsString,
                  sRecPag, True) Then
         //Al_5
         Raise Exception.Create('Não foi possivel criar o lançamento do documento na Contabilidade.');

       //Al_2 Ini
       // Update no Plano,CodDocumento e PlnCodigo na OPERACAOFUNDO
       With DmFundoComum.QryUpdOpeFinCtb Do
       Begin
         Opercomum.LimpaParametros(DmFundoComum.QryUpdOpeFinCtb);
         ParamByName('IDOPERACAOFUNDO').AsInteger   := qryDetalheIDOPERACAOFUNDO.AsInteger;
         ParamByName('PLANO').AsInteger             := iPlano;
         ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
         ParamByName('CODDOCUMENTO').AsInteger      := iDocumento;
         ExecSQL;
       End;
       //Al_2 Fim

      Result := True;
   Except
      //Al_5
      On E:Exception Do
      Begin
         MsgDlg('A operação será Cancelada!:'+#13+
                 E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         Result := False;
      end;
      //Al_5
   End;
End;

Procedure TFrmCadAmortizCotaDirCred.AbreQry;
Begin
   //AL_21
   OperComum.LimpaParametros(QryDetalhe);
   QryDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger     :=
              QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
   QryDetalhe.ParamByName('IDTIPOCOTA').AsInteger        :=
              QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger;
   QryDetalhe.ParamByName('DATAMOVFUNDO').AsDateTime     := DtEdDataReferenciaGeral.DateTime;
   QryDetalhe.Open;

   //AL_21
   OperComum.LimpaParametros(QryTotalDetalhe);
   QryTotalDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QryTotalDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryTotalDetalhe.ParamByName('IDFUNDOINVEST').AsInteger     :=
                   QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
   QryTotalDetalhe.ParamByName('IDTIPOCOTA').AsInteger        :=
                   QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger;
   QryTotalDetalhe.ParamByName('DATAMOVFUNDO').AsDateTime     := DtEdDataReferenciaGeral.DateTime;
   QryTotalDetalhe.Open;

   //AL_21
   OperComum.LimpaParametros(QryValorAmortizado);
   QryValorAmortizado.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QryValorAmortizado.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryValorAmortizado.ParamByName('IDFUNDOINVEST').AsInteger     :=
                      QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
   QryValorAmortizado.ParamByName('IDTIPOCOTA').AsInteger        :=
                      QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger;
   QryValorAmortizado.ParamByName('DATAOPERACAO').AsDateTime     := DtEdDataReferenciaGeral.DateTime;
   //AL_20
   QryValorAmortizado.ParamByName('IDTIPOOPERACAO').AsInteger    := -43;
   QryValorAmortizado.Open;
   fValorAmortizado  := QryValorAmortizado.FieldByName('VLROPERACAO').AsFloat;
   QryValorAmortizado.Close;

   If QryDetalhe.IsEmpty Then
   Begin
      BtIncAplic.Enabled := False;
      BtExcAplic.Enabled := False;
      sbtnApagar.Enabled := False;
   End
   Else
   Begin
      BtIncAplic.Enabled := True;
      BtExcAplic.Enabled := True;

      if (not QryValorAmortizado.IsEmpty) and (QryValorAmortizado.RecordCount = 1) then
       // Tratar melhor   se tiver dois registros nâo pode excluir
         sbtnApagar.Enabled := True;
   End;
End;

//Al_6
function  TFrmCadAmortizCotaDirCred.VerificaOperacaoAmortizacao(Var iOperOrigem : Integer) : Boolean;
begin
   //AL_20
   if ((Trim(DblFundosInvest.Text) <> '') and (Trim(dblTipoCota.Text) <> '') and
       (Trim(DtEdDataReferenciaGeral.Text) <> '')) then
   begin
      With QryVerOperAmortizacao Do
      Begin
         //AL_21
         OperComum.LimpaParametros(QryVerOperAmortizacao);
         ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
         ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(DblFundosInvest.LookupValue);
         ParamByName('IDTIPOCOTA').AsInteger        := StrToInt(dblTipoCota.LookupValue);
         ParamByName('DATAMOVFUNDO').AsDateTime     := DtEdDataReferenciaGeral.DateTime;
         Open;
         If IsEmpty Then
            Result := False
         Else
            Result := True;
         iOperOrigem := FieldByName('IDOPERACAOFUNDO').AsInteger;
         Close;
      End;
   end;
end;
//Al_6 - Fim

//Al_6
Procedure TFrmCadAmortizCotaDirCred.TrataTela;
var
   iOperOrigem : Integer;
Begin
   If VerificaOperacaoAmortizacao(iOperOrigem) Then  //Se existir registros de amortizacao, so podera exluir
   Begin
      sbtnApagar.Enabled       := True;   
      sbtnImprimir.Enabled     := True;
      BtIncAplic.Enabled       := False;
      BtExcAplic.Enabled       := True;
      BtExcAplic.Down          := False;
      dbgrdDet.Color           := clSilver;
      DbVlrTotCustoOrg.Color   := clSilver;
      DbVlrTotCustoAtual.Color := clSilver;
      //AL_21
      DbVlrTotRend.Color       := clSilver;
      DbSldTotAtual.Color      := clSilver;
      DbVlrTotTaxas.Color      := clSilver;
      Label7.Visible           := True;
      Label8.Visible           := True;
      FazQuery(QryAux,'SELECT * FROM OPERACAOFUNDO WHERE IDOPERACAOFUNDO = '+IntToStr(iOperOrigem));
      Label8.Caption           := FloatToStrF(QryAux.FieldByName('VLROPERACAO').AsFloat, ffNumber, 18,2);
   End
   Else
   Begin
      sbtnApagar.Enabled       := False;
      sbtnImprimir.Enabled     := False;
      //AL_20
      BtIncAplic.Enabled       := (Not QryDetalhe.IsEmpty);
      BtExcAplic.Enabled       := False;
      dbgrdDet.Color           := clWhite;
      DbVlrTotCustoOrg.Color   := clWhite;
      DbVlrTotCustoAtual.Color := clWhite;
      //AL_21
      DbVlrTotRend.Color       := clWhite;
      DbSldTotAtual.Color      := clWhite;
      DbVlrTotTaxas.Color      := clWhite;      
      Label7.Visible           := False;
      Label8.Visible           := False;
   End;
End;
//Al_6 - Fim

procedure TFrmCadAmortizCotaDirCred.DblFundosInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //AL_21
  bModif := modified;
  If ((modified) and 
      (Trim(dblTipoFundo.Text) <> '') and 
      (Trim(DtEdDataReferenciaGeral.Text) <> '') and
      (Trim(DblFundosInvest.Text) <> '') and (Trim(dblTipoCota.Text) <> '')) Then
     AbreQry
  else if Trim(DblFundosInvest.Text) = '' then
  begin
     QryDetalhe.Close;
     QryTotalDetalhe.Close;
     DbVlrTotCustoOrg.Text   := '0,00';
     DbVlrTotCustoAtual.Text := '0,00';
     DbVlrTotRend.Text       := '0,00';
     DbSldTotAtual.Text      := '0,00';
     DbVlrTotTaxas.Text      := '0,00';
  end;
  TrataTela;  
end;

procedure TFrmCadAmortizCotaDirCred.DtEdDataReferenciaGeralExit(
  Sender: TObject);
begin
  inherited;
   //AL_21
   OperComum.LimpaParametros(QryFundoInvestOperacao);
   QryFundoInvestOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   if Trim(dblTipoFundo.Text) <> '' then
      QryFundoInvestOperacao.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
   if DtEdDataReferenciaGeral.Text <> '' then
      QryFundoInvestOperacao.ParamByName('DATAMOVFUNDO').AsString  := DtEdDataReferenciaGeral.Text;
   QryFundoInvestOperacao.Open;

   QryDetalhe.Close;
   QryTotalDetalhe.Close;
   DblFundosInvest.Clear;
   dblTipoCota.Clear;   
   
   DbVlrTotCustoOrg.Text   := '0,00';
   DbVlrTotCustoAtual.Text := '0,00';
   DbVlrTotRend.Text       := '0,00';
   DbSldTotAtual.Text      := '0,00';
   DbVlrTotTaxas.Text      := '0,00';   

   TrataTela;
end;

//AL_21

procedure TFrmCadAmortizCotaDirCred.FormCreate(Sender: TObject);
begin
  inherited;
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

   //AL_24   
   if iTipoInvestUsu = 10 then
      lbNomItem.Caption   := 'Amortização de Fundos'
   else
      lbNomItem.Caption   := 'Amortização de Fundos de Direitos Creditórios';
end;

procedure TFrmCadAmortizCotaDirCred.sbtnApagarClick(Sender: TObject);
Var
   wStr        : String;
   bProcesso   : Boolean;
   //Al_6
   iOperOrigem : Integer;
begin
  inherited;
  bProcesso := False;

  If DtEdDataReferenciaGeral.DateTime = 0 then
  Begin
     MsgDlg('Data está em branco!','Mensagem do Sistema',mtWarning ,[mbOk],0);
     if DtEdDataReferenciaGeral.Canfocus then
        DtEdDataReferenciaGeral.SetFocus;
     sbtnApagar.Down := False;
     Exit;
  End;

  // AL_3
  //AL_18
  if not CtrlInvContab.TestaPeriodo(DtEdDataReferenciaGeral.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if DtEdDataReferenciaGeral.Canfocus then
        DtEdDataReferenciaGeral.SetFocus;
     sbtnApagar.Down := False;
     Exit;
  end;

  //AL_15
  if VerEmAbertura(QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  If Length(Trim(DblFundosInvest.Text)) = 0 then
  Begin
     MsgDlg('Selecione um Fundo de Investimento!','Mensagem do Sistema',mtWarning ,[mbOk],0);
     if DblFundosInvest.Canfocus then
        DblFundosInvest.SetFocus;
     sbtnApagar.Down := False;
     Exit;
  End;

  If MsgDlg('Confirma Exclusão ?','Mensagem ',mtConfirmation,
            [mbYes, mbNo],0) = mrYes  Then
  Begin
     //Al_6
     If Not VerificaOperacaoAmortizacao(iOperOrigem) Then
     Begin
        MsgDlg('Essas operações não foram Amortizadas nessa data. '#13+
               'Não poderá excluir essas Operações!','Mensagem do Sistema',mtWarning ,[mbOk],0);
        sbtnApagar.Down := False;
        Exit;
     End;
     //Al_6 - Fim

     Try
        If not dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.StartTransaction;

        //AL_2 Ini
        OperComum.LimpaParametros(QryOperFundo);
        //Al_6
        QryOperFundo.ParamByName('IDOPERACAOFUNDO').AsInteger := iOperOrigem;
        QryOperFundo.Open;
        If Not QryOperFundo.IsEmpty Then
        begin
           If Not ProcExcluiFundo(QryOperFundo.FieldByName('CODDOCUMENTO').AsInteger,
                                  QryOperFundo.FieldByName('PLNCODIGO').AsInteger,
                                  QryOperFundo.FieldByName('PLANO').AsInteger,
                                  QryOperFundo.FieldByName('IDTIPOINVEST').AsInteger,
                                  QryOperFundo.FieldByName('DATAOPERACAO').AsDateTime, True) Then
              Raise Exception.Create('Não foi possível excluir o Contábil/Financeiro.');

           QryOperFundo.Close;
        end;
        //AL_2 Fim

       //AL_20
       wStr :='DELETE FROM IRLITIGIO WHERE DATAFATOGERADOR = TO_DATE('''+
                  QryDetalhe.FieldByName('DATAMOVFUNDO').AsString+''',''DD/MM/YYYY'') AND '+
              '   IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO '+
              '   WHERE IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+'   AND '+
              '         IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
              '         IDFUNDOINVEST     = '+QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsString+' AND '+
              '         DATAOPERACAO      = TO_DATE('''+QryDetalhe.FieldByName('DATAMOVFUNDO').AsString+''',''DD/MM/YYYY'') AND '+
              '         IDTIPOCOTA        = '+QryTipoCota.FieldByName('IDTIPOCOTA').AsString+' AND '+
              '         IDTIPOOPERACAO    = -43)';

        // AL_5
       If Not ExecutaQuery(QryAux,wStr) Then
           Raise Exception.Create('Não foi possivel excluir o IR Litígio do Fundo.');

       //AL_20
       wStr :='DELETE FROM HISTFUNDO     '+
              'WHERE IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+'    AND '+
              '      IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
              '      IDFUNDOINVEST     = '+QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsString+' AND '+
              '      DATAMOVFUNDO      = TO_DATE('+QuotedStr(QryDetalhe.FieldByName('DATAMOVFUNDO').AsString)+',''DD/MM/YYYY'') AND '+
              '      IDTIPOCOTA        = '+QryTipoCota.FieldByName('IDTIPOCOTA').AsString+'               AND '+
              '      IDTIPOOPERACAO    = -43';

       // AL_5
       If Not ExecutaQuery(QryAux,wStr) Then
           Raise Exception.Create('Não foi possivel excluir o Histórico do Fundo.');

       //AL_21
       if FazQuery(qryAux, 'SELECT PLANO, PLNCODIGO, CODDOCUMENTO FROM OPERACAOFUNDO WHERE '+
                           'IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+'    AND '+       
                           'IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                           'IDFUNDOINVEST     = '+QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsString+' AND '+
                           'DATAOPERACAO      = TO_DATE('+QuotedStr(QryDetalhe.FieldByName('DATAMOVFUNDO').AsString)+',''DD/MM/YYYY'') AND '+
                           'IDTIPOOPERACAO    = -175 AND '+
                           'IDTIPOCOTA        = '+QryTipoCota.FieldByName('IDTIPOCOTA').AsString+' AND '+                           
                           'IDOPERACAOORIGEM  = '+qryDetalheIDOPERACAOFUNDO.AsString) then
       begin
          if Not ExecutaQuery(qryAux1, 'DELETE FROM OPERACAOFUNDO WHERE '+
                                       'IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+'    AND '+
                                       'IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                                       'IDFUNDOINVEST     = '+QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsString+' AND '+
                                       'DATAOPERACAO      = TO_DATE('+QuotedStr(QryDetalhe.FieldByName('DATAMOVFUNDO').AsString)+',''DD/MM/YYYY'') AND '+
                                       'IDTIPOOPERACAO    = -175 AND '+
                                       'IDTIPOCOTA        = '+QryTipoCota.FieldByName('IDTIPOCOTA').AsString+' AND '+                           
                                       'IDOPERACAOORIGEM  = '+qryDetalheIDOPERACAOFUNDO.AsString) then
             Raise Exception.Create('Ocorreu um problema na exclusão da taxa de saída da operação.');

          if Not ProcExcluiFundo(qryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                 qryAux.FieldByName('PLNCODIGO').AsInteger,
                                 qryAux.FieldByName('PLANO').AsInteger,
                                 iTipoInvestUsu, QryDetalhe.FieldByName('DATAMOVFUNDO').AsDateTime, True) Then
             Raise Exception.Create('Ocorreu um problema na exclusão do resgistro contábil da taxa de saída.');
       end;

       //AL_20
       wStr :='DELETE FROM OPERACAOFUNDO  '+
              'WHERE  IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+'    AND '+
              '       IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
              '       IDFUNDOINVEST     = '+QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsString+' AND '+
              '       DATAOPERACAO      = TO_DATE('+QuotedStr(QryDetalhe.FieldByName('DATAMOVFUNDO').AsString)+',''DD/MM/YYYY'') AND '+
              '       IDTIPOCOTA        = '+QryTipoCota.FieldByName('IDTIPOCOTA').AsString+'               AND '+
              '       IDTIPOOPERACAO    = -43';

       // AL_5
       If Not ExecutaQuery(QryAux,wStr) Then
           Raise Exception.Create('Não foi possivel excluir a Operação do Fundo.');

       If DtEdDataOperacao.DateTime  = 0 Then
          DtEdDataOperacao.DateTime := DtEdDataReferenciaGeral.DateTime;

       //AL_20
       QryOperFundo.Close;       
       QryAux.Close;          

       // Confirma Transação
       dtmBaseDados.dbBaseDados.Commit;

       OperComum.LimpaParametros(QryTipoFundoInvest);
       QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                                QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
       QryTipoFundoInvest.Open;

       If StrToDate(DtEdDataReferenciaGeral.Text) <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
       begin
          //Alt_1
          If Not Reprocessamento(iTipoInvestUsu,
                                 QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                 QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                 iPlanPrevCtbPatro,
                                 StrToDate(DtEdDataReferenciaGeral.Text),
                                 QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                 QryFundoInvestOperacao.FieldByName('DTAINIPROC').AsDateTime,
                                 True,
                                 QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger) Then
             MsgDlg('Atenção : A Operação foi concluída com sucesso!'+#13+
                    'Mas o Reprocessamento foi cancelado!'+#13+
                    'Faça o Reprocessamento para esse Fundo, a partir desse dia!',
                    'Mensagem do Sistema', MtInformation,[MbOk],0);
       end;

       bProcesso := True;

     Except
        On E:Exception Do Begin
           // AL_5
           MsgDlg('A operação será Cancelada:'+#13+
                  E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
           // Cancela Transação
           //AL_20
           If dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.Rollback;
        End;
     End;

     //AL_20
     QryAux.Close;
     QryTipoFundoInvest.Close;

     QryDetalhe.Close;
     QryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger :=
                QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
     QryDetalhe.ParamByName('IDTIPOCOTA').AsInteger    :=
                QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger;
     QryDetalhe.ParamByName('DATAMOVFUNDO').AsDateTime := DtEdDataReferenciaGeral.Date;
     QryDetalhe.Open;

     QryTotalDetalhe.Close;
     QryTotalDetalhe.ParamByName('IDFUNDOINVEST').AsInteger :=
                     QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
     QryTotalDetalhe.ParamByName('IDTIPOCOTA').AsInteger    :=
                     QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger;
     QryTotalDetalhe.ParamByName('DATAMOVFUNDO').AsDateTime := DtEdDataReferenciaGeral.Date;
     QryTotalDetalhe.Open;

     //AL_20
     TrataTela;

     if bProcesso then
        MsgDlg('Processo concluído com sucesso.','Mensagem do Sistema',mtInformation ,[mbOk],0);
        
  end;

end;

//AL_20
procedure TFrmCadAmortizCotaDirCred.dblTipoCotaExit(Sender: TObject);
begin
  inherited;
  //AL_21
  if ((Not bModif) and (Trim(DtEdDataReferenciaGeral.Text) <> '') and (Trim(DblFundosInvest.Text) <> '') and
      (Trim(dblTipoFundo.Text) <> '') and (Trim(dblTipoCota.Text) <> '') and (sVarAnt <> dblTipoCota.LookupValue)) then
     AbreQry
  else if Trim(dblTipoCota.Text) = '' then
  begin
     QryDetalhe.Close;
     QryTotalDetalhe.Close;
     DbVlrTotCustoOrg.Text   := '0,00';
     DbVlrTotCustoAtual.Text := '0,00';
     DbVlrTotRend.Text       := '0,00';
     DbSldTotAtual.Text      := '0,00';
     DbVlrTotTaxas.Text      := '0,00';     
  end;
  TrataTela;  
  bModif := false;
end;

//AL_20
procedure TFrmCadAmortizCotaDirCred.DblFundosInvestEnter(Sender: TObject);
begin
  inherited;
   sVarAnt := DblFundosInvest.LookupValue;
end;

//AL_20
procedure TFrmCadAmortizCotaDirCred.DblFundosInvestExit(Sender: TObject);
begin
  inherited;
  //AL_21
  if ((Not bModif) and (Trim(dblTipoFundo.Text) <> '') and
      (Trim(DtEdDataReferenciaGeral.Text) <> '') and (Trim(DblFundosInvest.Text) <> '') and
      (sVarAnt <> DblFundosInvest.LookupValue) and (Trim(dblTipoCota.Text) <> '')) then
     AbreQry
  else if Trim(DblFundosInvest.Text) = '' then
  begin
     QryDetalhe.Close;
     QryTotalDetalhe.Close;
     DbVlrTotCustoOrg.Text   := '0,00';
     DbVlrTotCustoAtual.Text := '0,00';
     DbVlrTotRend.Text       := '0,00';
     DbSldTotAtual.Text      := '0,00';
     DbVlrTotTaxas.Text      := '0,00';     
  end;
  TrataTela;  
  bModif := false;
end;

//AL_22
procedure TFrmCadAmortizCotaDirCred.dblTipoFundoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  bModif := modified;
  If (modified) Then
  begin
     DtEdDataReferenciaGeral.Date := QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime;

     //AL_21
     OperComum.LimpaParametros(QryFundoInvestOperacao);
     QryFundoInvestOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     if Trim(dblTipoFundo.Text) <> '' then
        QryFundoInvestOperacao.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
     if DtEdDataReferenciaGeral.Text <> '' then
        QryFundoInvestOperacao.ParamByName('DATAMOVFUNDO').AsString  := DtEdDataReferenciaGeral.Text;
     QryFundoInvestOperacao.Open;

     QryDetalhe.Close;
     QryTotalDetalhe.Close;
     DbVlrTotCustoOrg.Text   := '0,00';
     DbVlrTotCustoAtual.Text := '0,00';
     DbVlrTotRend.Text       := '0,00';
     DbSldTotAtual.Text      := '0,00';
     DbVlrTotTaxas.Text      := '0,00';     
  end;
  TrataTela;  
end;

//AL_22
procedure TFrmCadAmortizCotaDirCred.dblTipoFundoEnter(Sender: TObject);
begin
  inherited;
   sVarAnt := dblTipoFundo.LookupValue;
end;

//AL_22
procedure TFrmCadAmortizCotaDirCred.dblTipoFundoExit(Sender: TObject);
begin
  inherited;
  if ((Not bModif) and (sVarAnt <> dblTipoFundo.LookupValue) and (Trim(dblTipoFundo.Text) <> '')) then
  begin
     DtEdDataReferenciaGeral.Date := QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime;
     QryDetalhe.Close;
     QryTotalDetalhe.Close;
     DbVlrTotCustoOrg.Text   := '0,00';
     DbVlrTotCustoAtual.Text := '0,00';
     DbVlrTotRend.Text       := '0,00';
     DbSldTotAtual.Text      := '0,00';
     DbVlrTotTaxas.Text      := '0,00';     
  end;
  TrataTela;
  bModif := false;  
end;

//AL_20
procedure TFrmCadAmortizCotaDirCred.dblTipoCotaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //AL_21
  bModif := modified;
  If ((modified) and (Trim(dblTipoFundo.Text) <> '') and (Trim(DtEdDataReferenciaGeral.Text) <> '') and
      (Trim(DblFundosInvest.Text) <> '') and (Trim(dblTipoCota.Text) <> '')) Then
     AbreQry
  else if Trim(dblTipoCota.Text) = '' then
  begin
     QryDetalhe.Close;
     QryTotalDetalhe.Close;
     DbVlrTotCustoOrg.Text   := '0,00';
     DbVlrTotCustoAtual.Text := '0,00';
     DbVlrTotRend.Text       := '0,00';
     DbSldTotAtual.Text      := '0,00';
     DbVlrTotTaxas.Text      := '0,00';
  end;
  TrataTela;
end;

//AL_20
procedure TFrmCadAmortizCotaDirCred.dblTipoCotaEnter(Sender: TObject);
begin
  inherited;
   sVarAnt := dblTipoCota.LookupValue;
end;

//AL_21
procedure TFrmCadAmortizCotaDirCred.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   OperComum.LimpaParametros(QryDetalhe);
   OperComum.LimpaParametros(QryOperacao);
   OperComum.LimpaParametros(QryTotalDetalhe);
   OperComum.LimpaParametros(qryTipoOperTx);
   OperComum.LimpaParametros(QryTipoCota);
   OperComum.LimpaParametros(QryFundoInvestOperacao);
   OperComum.LimpaParametros(QryTipoFundo);
   OperComum.LimpaParametros(QryValorAmortizado);
   OperComum.LimpaParametros(qryAux);
   OperComum.LimpaParametros(qryAux1);
   OperComum.LimpaParametros(QryOperFundo);
   OperComum.LimpaParametros(QryBuscaTipoOper);
   OperComum.LimpaParametros(QryVerOperAmortizacao);
   OperComum.LimpaParametros(QryUpdIrLitigio);
   OperComum.LimpaParametros(QryTipoFundoInvest);
end;

end.

