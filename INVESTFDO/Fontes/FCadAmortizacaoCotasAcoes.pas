//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 06/10/2005
// Código   : AL_15
// Motivo   : Melhorias e acerto na passager do IDPLANPREVCTBPATR
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 06/07/2005
// Código   : AL_14
// Motivo   : Implementação da qryPlanPrevCtbPatr
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 21/09/2005
// Código   : AL_14
// Motivo   : Implementação do custo e variação para contabilizar  
//******************************************************************************
// Autor    : Marco Turon
// Data     : 30/05/2005
// Código   : AL_13
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 06/06/2005
// Código   : 
// Motivo   : Inclusão do campo IDOPERACAOFUNDO na QryVerOperAmortizacao
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 01/06/2005
// Código   : Al_11
// Motivo   : Implementação do rollback, botão cancelar e exit
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 01/06/2005
// Código   : Al_10
// Motivo   : Retirada as query´s qryParamInvest, QryProximOperacoes e QryVendaAcoes,
//            devido a falta de utilização
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 01/06/2005
// Código   : Al_9
// Motivo   : Implementada a rotina que busca o codigo original da operação na HISTFUDO
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 01/06/2005
// Código   : Al_8
// Motivo   : Alteração da mensagem de erro para uma similar
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 31/05/2005
// Código   : AL_7
// Motivo   : Implementação da atualização dos campos QTDOPERACAO E VLRCOTA
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 31/05/2005
// Motivo   : Acerto no layout
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 02/12/2004
// AL_6
// Motivo   : Acerto na Exclusao de Planilha e Documento
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 30/11/2004
// Alt_5
// Motivo   : Busca o Saldo de Qtd do Fundo e PU e acerto na impressao do Relatório
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 30/11/2004
// Alt_4
// Motivo   : Update no Plano,CodDocumento e PlnCodigo na OPERACAOFUNDO
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 07/10/2004
// Linha(s) : Alt_3
// Motivo   : Inclusão do campo DTAINIPROC na QryFundoInvestOperacao e na funcao Reprocessamento
//           Acertado a crítica do exit a data da operacao para proximo dia util da data de liquidacao
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 17/09/2004
// Motivo   : Acerto no tabOrder do pnlControlesDet
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 15/09/2004
// Linha(s) : 
// Motivo   : Acerto na qryDetalhe para não trazer registro de Rec. Dividendos
//            Melhoria de Lay-out
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 02/09/2004
// Linha(s) : Alt_2
// Motivo   : Acerto de refresh da Abreqry e Gravacao da data de liquidacao
//******************************************************************************
// Autor    : Marco Turon
// Data     : 06/08/2004
// Linha(s) : Alt_1
// Motivo   : Incluido o Frame de Mensagens no rodapé do form (DFM) e
//             passando o frame na chamada do reprtocessamento
//******************************************************************************
// Autor    : RICARDO CRISTIANO
// Data     : 28/07/2004
// Origem   : FUNCEF
//******************************************************************************

unit FCadAmortizacaoCotasAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, Buttons, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, TREdit,
  ComCtrls, TabControlDetalhe, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, CmEventosCadastro, ImgList, Wwdatsrc, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, uOperacaoInvest, usistema, faMensagem, fcLabel, FPreview,
  uCtrlInvContab;

type
  TFrmCadAmortizacaoCotasAcoes = class(TfrmCadastroCS)
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
    QryOperacao: TwwQuery;
    DsOperacao: TwwDataSource;
    UpdOperacao: TUpdateSQL;
    QryTipoFundo: TwwQuery;
    qryAux: TwwQuery;
    QryVerOperAmortizacao: TwwQuery;
    QryDeletaOperacoes: TwwQuery;
    DsTotalDetalhe: TwwDataSource;
    QryTotalDetalhe: TwwQuery;
    //Al_10 - Ricardo - 01/06/2005
    QryTipoFundoInvest: TwwQuery;
    sbtnImprimir: TToolbarButton97;
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
    QryDetalheIDFUNDOINVEST_1: TFloatField;
    QryDetalheDATAULTPGTOIR: TDateTimeField;
    QryDetalheDESCFUNDOINVEST: TStringField;
    QryDetalheVLRMOVFUNDO: TFloatField;
    QryDetalheVLRIRPROV: TFloatField;
    QryDetalheVLRIOFPROV: TFloatField;
    QryDetalheCOTASMOVFUNDO: TFloatField;
    QryDetalheSALDOQTDCOTAS: TFloatField;
    QryDetalheCOTAAPLICACAO: TFloatField;
    QryDetalheCODDOCUMENTO: TFloatField;
    QryDetalhePLNCODIGO: TFloatField;
    QryDetalhePLANO: TFloatField;
    //Al_10 - Ricardo - 01/06/2005
    QryDetalheIDTIPOINVEST: TFloatField;
    QryAux1: TwwQuery;
    QryValorAmortizado: TwwQuery;
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
    fraMensIntCotFdo: TfraMensagem;
    QryOperacaoIDOPERACAOFUNDO: TFloatField;
    QryOperacaoIDCARTEIRAINVEST: TFloatField;
    QryOperacaoIDPEDIDOFUNDO: TFloatField;
    QryOperacaoIDTIPOINVEST: TFloatField;
    QryOperacaoIDTIPOOPERACAO: TFloatField;
    QryOperacaoIDFUNDOINVEST: TFloatField;
    QryOperacaoDATAOPERACAO: TDateTimeField;
    QryOperacaoDATALIQUIDACAO: TDateTimeField;
    QryOperacaoQTDOPERACAO: TFloatField;
    QryOperacaoVLROPERACAO: TFloatField;
    QryOperacaoVLRCOTA: TFloatField;
    QryOperacaoVLRIR: TFloatField;
    QryOperacaoVLRIOF: TFloatField;
    QryOperacaoVLRRENDIMENTO: TFloatField;
    QryOperacaoSTACONFIRMA: TStringField;
    QryOperacaoIDOPERACAOORIGEM: TFloatField;
    QryOperacaoIDPLANPREVCTBPATR: TFloatField;
    QryOperacaoDATACOTIZACAO: TDateTimeField;
    QryOperacaoVLRDESCONTO: TFloatField;
    QryOperacaoIDCOMPOSICAOFUNDO: TFloatField;
    QryOperacaoSTAESPECIFICADO: TStringField;
    QryOperacaoVLRCOLOCACAO: TFloatField;
    QryOperacaoVLRTAXAS: TFloatField;
    QryOperacaoVLRCORRETAGEM: TFloatField;
    QryOperacaoTRGDTINCLUSAO: TDateTimeField;
    QryOperacaoTRGUSERINCLUSAO: TStringField;
    QryOperacaoOBSERVACAO: TMemoField;
    QryOperacaoPLANO: TFloatField;
    QryOperacaoPLNCODIGO: TFloatField;
    QryOperacaoCODDOCUMENTO: TFloatField;
    QryOperacaoIDOPERACAODIREITO: TFloatField;
    QryOperacaoQTDUSUFRUTO: TFloatField;
    QryOperacaoIDTIPOCOTA: TFloatField;
    QryOperacaoIDCOTAINTEGRALIZA: TFloatField;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    Panel2: TPanel;
    pnlMestre: TPanel;
    Label14: TLabel;
    Label2: TLabel;
    DblFundosInvest: TwwDBLookupCombo;
    DtEdDataReferenciaGeral: TCMDateTimePicker;
    tbcDetalhe: TTabControlDetalhe;
    pgctrlDetalhe: TPageControl;
    tbsDet: TTabSheet;
    dbgrdDet: TwwDBGrid;
    pnlControlesDet: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblDtLiquidacao: TLabel;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    DbValorCustoNovo: TDBRealEdit;
    dbrVlrCustoTotal: TDBRealEdit;
    dbrVlrSaldoAtual: TDBRealEdit;
    DtEdDataOperacao: TCMDateTimePicker;
    dbrVlrRendTotal: TDBRealEdit;
    DtEdDataLiquidacao: TCMDateTimePicker;
    Dock973: TDock97;
    lblDescVlrAmortizado: TLabel;
    lblVlrAmortizado: TLabel;
    Toolbar974: TToolbar97;
    BtAltAplic: TSpeedButton;
    BtExcAplic: TSpeedButton;
    BtIncAplic: TSpeedButton;
    Panel1: TPanel;
    pnlTotais: TPanel;
    DbQtdTotCotas: TDBRealEdit;
    DbVlrTotCustoAtual: TDBRealEdit;
    DbSldTotAtual: TDBRealEdit;
    DbVlrTotCustoOrg: TDBRealEdit;
    Panel9: TPanel;
    QryFundoInvestOperacaoDTAINIPROC: TDateTimeField;
    lblPU: TLabel;
    dbPU: TRealEdit;
    dbQtdCotas: TRealEdit;
    lblQtd: TLabel;
    QryOperFundo: TwwQuery;
    QryVerOperAmortizacaoIDHISTFUNDO: TFloatField;
    QryVerOperAmortizacaoIDOPERACAOFUNDO: TFloatField;
    qryPlanPrevCtbPatr: TwwQuery;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField;
    dblkPlanPatro: TwwDBLookupCombo;
    lblPlanPatro: TLabel;
    QryTotalDetalheVLRTOTAPL: TFloatField;
    QryTotalDetalheVLRTOTCUST: TFloatField;
    QryTotalDetalheVLRTOTREND: TFloatField;
    QryTotalDetalheSLDTOTFUNDO: TFloatField;
    //AL_16 - Ricardo - 01/11/2005
    QryDetalheSALDOQTDCOTASBLQ: TFloatField;
    qrylancAmortFutura: TQuery;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure BtIncAplicClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure DbValorCustoNovoExit(Sender: TObject);
    procedure DblFundosInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DtEdDataReferenciaGeralExit(Sender: TObject);
    procedure DblFundosInvestExit(Sender: TObject);
    procedure DtEdDataOperacaoExit(Sender: TObject);
    procedure dbPUExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkPlanPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkPlanPatroExit(Sender: TObject);
    //AL_15
    procedure dbQtdCotasExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function  GravaOperacao               : Boolean;
    //Al_9 - Ricardo - 01/06/2005
    function  VerificaOperacaoAmortizacao(Var iOperOrigem : Integer) : Boolean;

    procedure AbreQry;
    procedure TrataTela;

  public
    { Public declarations }
  end;

var
  FrmCadAmortizacaoCotasAcoes: TFrmCadAmortizacaoCotasAcoes;
  iIdForCli, iPlanilha, iDocumento, iPlano : Integer;
  sRecPag  : String;
  fValorAplicado, fValorOperacao, fValorAmortizado   : Currency;
  //AL_5
  fSdoQtdCotas : Double;
  //AL_14
  fPU : Double;
implementation

uses UFundoComum, dFundoComum, UDataBase, dBaseDados, UOperComum,
     UBibliotecaInvest, UmensErro, UDiasUteisInv, UImpostos, fAguarde,
     FDmRelatoriosFundos, FCadLanctoVdFundoCpAcoes, Fprincipal;

{$R *.DFM}

procedure TFrmCadAmortizacaoCotasAcoes.FormShow(Sender: TObject);
begin
  inherited;
  // Alt_1 - Turon - 06/08/2004
  fraMensIntCotFdo.Apaga;
  dbgrdDet.BringToFront;

  QryOperacao.Open;
  QryTipoFundo.Open;
  QryFundoInvestOperacao.Open;
  //AL_14
  qryPlanPrevCtbPatr.Open;

  DtEdDataReferenciaGeral.Date := QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime;

  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu));
end;

procedure TFrmCadAmortizacaoCotasAcoes.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
  //Alt_2
  if DtEdDataReferenciaGeral.Canfocus then
     DtEdDataReferenciaGeral.SetFocus;
end;

procedure TFrmCadAmortizacaoCotasAcoes.sbtnApagarClick(Sender: TObject);
Var
   wStr      : String;
   bProcesso : Boolean;
   //Al_9 - Ricardo - 01/06/2005
   iOperOrigem : Integer;
begin

  inherited;

  bProcesso := False;

  If DtEdDataReferenciaGeral.DateTime = 0 then
  Begin
     MsgDlg('Data está em branco!','Mensagem do Sistema',mtInformation ,[mbOk],0);
     if DtEdDataReferenciaGeral.Canfocus then
        DtEdDataReferenciaGeral.SetFocus;
     sbtnApagar.Down := False;
     Exit;
  End;

  If Length(Trim(DblFundosInvest.Text)) = 0 then
  Begin
     MsgDlg('Selecione um Fundo de Investimento!','Mensagem do Sistema',mtInformation ,[mbOk],0);
     if DblFundosInvest.Canfocus then
        DblFundosInvest.SetFocus;
     sbtnApagar.Down := False;
     Exit;
  End;

  If Trim(dblkPlanPatro.Text) = '' then
  Begin
     MsgDlg('Selecione o Plano/Patro!','Mensagem do Sistema',mtInformation ,[mbOk],0);
     if dblkPlanPatro.Canfocus then
        dblkPlanPatro.SetFocus;
     sbtnApagar.Down := False;
     Exit;
  End;

  // AL_13
  if not CtrlInvContab.TestaPeriodo(DtEdDataReferenciaGeral.Text) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     sbtnApagar.Down := False;
     if DtEdDataReferenciaGeral.CanFocus then
        DtEdDataReferenciaGeral.SetFocus;
     Exit;
  end;

  //AL_19 - Ricardo - 20/02/2006
  if VerEmAbertura(QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
  begin
     sbtnApagar.Down := False;
     Exit;
  end;

  //Al_9 - Ricardo - 01/06/2005
  If Not VerificaOperacaoAmortizacao(iOperOrigem) Then
  Begin
     //Al_18 - Ricardo - 07/02/2006
     MsgDlg('Essa operação não foi Amortizada nessa data. '#13+
            'Não poderá excluir essa Operação!','Mensagem do Sistema',mtInformation ,[mbOk],0);
     sbtnApagar.Down := False;
     Exit;
  End;
  //Al_9 - Fim
  
  If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes  Then
  Begin
      Try

       If not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

        //AL_6 Ini
        OperComum.LimpaParametros(QryOperFundo);
        //Al_9 - Ricardo - 01/06/2005
        QryOperFundo.ParamByName('IDOPERACAOFUNDO').AsInteger := iOperOrigem;
        QryOperFundo.Open;
        If Not QryOperFundo.IsEmpty Then
        begin
           If Not ProcExcluiFundo(QryOperFundo.FieldByName('CODDOCUMENTO').AsInteger,
                                  QryOperFundo.FieldByName('PLNCODIGO').AsInteger,
                                  QryOperFundo.FieldByName('PLANO').AsInteger,
                                  QryOperFundo.FieldByName('IDTIPOINVEST').AsInteger,
                                  QryOperFundo.FieldByName('DATAOPERACAO').AsDateTime, True) Then
              //Al_8 - Ricardo - 01/06/2005
              Raise Exception.Create('Não foi possivel excluir o Contábil/Financeiro da operação.');

           QryOperFundo.Close;
        end;
       //AL_6 Fim

       wStr :=
        'DELETE FROM IRLITIGIO             '+
        'WHERE DATAFATOGERADOR = TO_DATE('''+
            QryDetalhe.FieldByName('DATAMOVFUNDO').AsString+''',''DD/MM/YYYY'') AND '+
        '   IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO '+
        '   WHERE IDFUNDOINVEST  = '+DblFundosInvest.LookupValue+' AND    '+
        '         IDTIPOOPERACAO = -43 AND   '+
        '         DATAOPERACAO   = TO_DATE('''+
            QryDetalhe.FieldByName('DATAMOVFUNDO').AsString+''',''DD/MM/YYYY'')) ';

       //Al_8 - Ricardo - 01/06/2005
       If Not ExecutaQuery(QryAux,wStr) Then
           Raise Exception.Create('Não foi possivel excluir o IR Litígio do Fundo.');

       wStr :=
        'DELETE FROM HISTFUNDO   '+
        'WHERE DATAMOVFUNDO   = TO_DATE('+
                  QuotedStr(QryDetalhe.FieldByName('DATAMOVFUNDO').AsString)+',''DD/MM/YYYY'') AND '+
        '      IDFUNDOINVEST  = '+QryDetalhe.FieldByName('IDFUNDOINVEST').AsString+' AND '+
        '      IDTIPOOPERACAO = -43';

       //Al_8 - Ricardo - 01/06/2005
       If Not ExecutaQuery(QryAux,wStr) Then
           Raise Exception.Create('Não foi possivel excluir o Histórico do Fundo.');

       wStr :=
        'DELETE FROM OPERACAOFUNDO      '+
        'WHERE IDTIPOOPERACAO = -43 AND '+
        '      IDFUNDOINVEST  = '+QryDetalhe.FieldByName('IDFUNDOINVEST').AsString+' AND '+
        '      DATAOPERACAO   = TO_DATE('+
                  QuotedStr(QryDetalhe.FieldByName('DATAMOVFUNDO').AsString)+',''DD/MM/YYYY'') ';

       //Al_8 - Ricardo - 01/06/2005
       If Not ExecutaQuery(QryAux,wStr) Then
           Raise Exception.Create('Não foi possivel excluir a Operação do Fundo.');

       If DtEdDataOperacao.DateTime  = 0 Then
          DtEdDataOperacao.DateTime := DtEdDataReferenciaGeral.DateTime;

       QryAux.Close;

       // Confirma Transação
       dtmBaseDados.dbBaseDados.Commit;

       QryTipoFundoInvest.Close;
       QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                          QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
       QryTipoFundoInvest.Open;

       If StrToDate(DtEdDataReferenciaGeral.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
       begin
          //Alt_3
          If Not Reprocessamento(iTipoInvestUsu,
                                 QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                 QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                 iPlanPrevCtbPatro,
                                 StrToDate(DtEdDataReferenciaGeral.Text),                                    
                                 QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                 QryFundoInvestOperacao.FieldByName('DTAINIPROC').AsDateTime,
                                 True) Then
             MsgDlg('O Reprocessamento foi cancelado! Faça o fechamento para esse dia até a data desejada!',
                    'Mensagem do Sistema', MtInformation,[MbOk],0);
       end;

       bProcesso := True;

     Except
        On E:Exception Do Begin
           //Al_8 - Ricardo - 01/06/2005
           MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
           // Cancela Transação
           dtmBaseDados.dbBaseDados.Rollback;
           QryAux.Close;
        End;
     End;

     QryDetalhe.Close;
     QryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger :=
              QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
     QryDetalhe.Open;

     QryTotalDetalhe.Close;
     QryTotalDetalhe.ParamByName('IDFUNDOINVEST').AsInteger :=
             QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
     QryTotalDetalhe.Open;

     QryTipoFundo.Close;
     QryTipoFundo.Open;

     DtEdDataReferenciaGeral.Date := QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime;

     TrataTela;

     If bProcesso Then
        MsgDlg('Processo concluído com sucesso.','Mensagem do Sistema',mtInformation ,[mbOk],0);
  End;
end;

procedure TFrmCadAmortizacaoCotasAcoes.sbtnImprimirClick(Sender: TObject);
begin
  inherited;
   DmRelatoriosFundo.ppBDEPConsAmortizacaoCotas.DataSource := FrmCadAmortizacaoCotasAcoes.DsDetalhe;

   DmRelatoriosFundo.ppLValorAmortizado.Caption  :=
                     FloatToStrF(fValorAmortizado,ffNumber,18,2);

   DmRelatoriosFundo.ppDBText5.DisplayFormat := MontaMascaraDecQtd(
                        StrToInt(FrmCadAmortizacaoCotasAcoes.DblFundosInvest.LookupValue));

   DmRelatoriosFundo.ppDBCalc3.DisplayFormat := DmRelatoriosFundo.ppDBText5.DisplayFormat;

   //AL_14
   DmRelatoriosFundo.LblPlanoAmort.Caption   := qryPlanPrevCtbPatrPLANPRVCONTABPATRO.AsString;

   // Alt_5
   TFrmPreview.CreateModalPreview(Application,
                                  DmRelatoriosFundo.ppRConsAmortizacaoCotas,
                                  DmRelatoriosFundo.ppRConsAmortizacaoCotas.PrinterSetup.DocumentName);


   sbtnImprimir.Down := False;
end;

procedure TFrmCadAmortizacaoCotasAcoes.sbtnProcurarClick(Sender: TObject);
begin
  
  inherited;
  If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
  Begin
     DtEdDataReferenciaGeral.DateTime := StrToDate(MontaSelect.ValoresChave[1]);
     QryFundoInvestOperacao.Locate('IDFUNDOINVEST',MontaSelect.ValoresChave[0],[]);
     DblFundosInvest.Text             := QryFundoInvestOperacao.FieldByName('DESCFUNDOINVEST').AsString;
     DblFundosInvest.LookupValue      := MontaSelect.ValoresChave[0];
     //AL_14
     qryPlanPrevCtbPatr.Locate('IDPLANPREVCTBPATR',MontaSelect.ValoresChave[2],[]);
     dblkPlanPatro.Text             := qryPlanPrevCtbPatrPLANPRVCONTABPATRO.AsString;
     dblkPlanPatro.LookupValue      := MontaSelect.ValoresChave[2];

     AbreQry;
     TrataTela;
  End
  Else
     WindowState   := wsMaximized;
  PnlFundo.Enabled := True;
end;

procedure TFrmCadAmortizacaoCotasAcoes.BtIncAplicClick(Sender: TObject);
//AL_5
var fNull, fSdoQtdCotas : Double;
    sDescFundo  : String;
begin
   QryBuscaTipoOper.Close;
   QryBuscaTipoOper.ParamByName('TIPOOPERACAO').AsInteger := -43;
   QryBuscaTipoOper.ParamByName('TIPOINVEST').AsInteger   := iTipoInvestUsu;
   QryBuscaTipoOper.Open;

   If QryBuscaTipoOper.IsEmpty Then
   begin
      MsgDlg('Parametrizar a operação de Amortização de Cotas para o Investimento.', 'Erro',
        mtWarning, [mbOk], 0);
      Exit;
   end;

  inherited;
   BtIncAplic.Enabled        := False;
   BtExcAplic.Enabled        := False;
   pnlMestre.Enabled         := False;
   pnlTotais.Visible         := False;
   pnlControlesDet.BringToFront;

   //Al_18 - Ricardo - 07/02/2006
   sbtnProcurar.Enabled      := False;
   QryOperacao.Append;

//   AL_17
//   DtEdDataOperacao.Enabled := False;
//   FIM

   //AL_21
   QryOperacaoDATAOPERACAO.AsDateTime := DtEdDataReferenciaGeral.DateTime;

   QryOperacaoDATALIQUIDACAO.AsDateTime := DiasUteisInv.SomaDiasUteis(DtEdDataReferenciaGeral.DateTime,
                                                                      QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger,
                                                                      -1,1,'',True,False,False);

   if QryOperacaoDATALIQUIDACAO.AsDateTime  = 0 then
      QryOperacaoDATALIQUIDACAO.AsDateTime := DtEdDataReferenciaGeral.DateTime;

   if DtEdDataLiquidacao.Canfocus then
      DtEdDataLiquidacao.SetFocus;

   //AL_5
   //AL_14
   BuscaSaldoFundo(QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger,
                   qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger, -1, DtEdDataOperacao.Date,
                   fNull, fNull, fNull, fNull,
                   fNull, fNull, fNull, fSdoQtdCotas,
                   fNull, sDescFundo);
   dbQtdCotas.Value := fSdoQtdCotas;

   //AL_20 - Ricardo - 06/03/2006   
   if Trim(DblFundosInvest.Text) = '' then
   begin
      MsgDlg('Selecione o Fundo de Investimento.','Mensagem do Sistema',mtInformation ,[mbOk],0);
      bbtnCancelarDetClick(Sender);
   end;

   //AL_14
   if Trim(FloatToStr(fPU)) <> '' then
      dbPU.Value := fPU;

end;

procedure TFrmCadAmortizacaoCotasAcoes.bbtnOkDetClick(Sender: TObject);
var iDiasVenc : Integer;
begin
  // AL_13
  if not CtrlInvContab.TestaPeriodo(DtEdDataOperacao.Text) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if DtEdDataOperacao.CanFocus then
        DtEdDataOperacao.SetFocus;
     Exit;
  end;

  //AL_19 - Ricardo - 20/02/2006
  if VerEmAbertura(QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  // AL_17
  If DtEdDataOperacao.DateTime > QryTipoFundo.FieldByName('DATAULTFECH').AsdateTime Then
  Begin
//     MsgDlg('Data do Movimento maior que a data do Último Fechamento!','Mensagem do Sistema',mtInformation ,[mbOk],0);
//     if DtEdDataOperacao.Canfocus then
//        DtEdDataOperacao.SetFocus;
//     Exit;
     qryLancAmortFutura.Close;
     qrylancAmortFutura.ParamByName('IDTIPOOPERACAO').AsInteger := -43;
     qrylancAmortFutura.ParamByName('IDFUNDOINVEST').AsInteger :=
                            QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
     qryLancAmortFutura.ParamByName('DATAMOVFUNDO').AsDateTime :=DtEdDataOperacao.DateTime;
     qryLancAmortFutura.Open;

     If not qryLancAmortFutura.IsEmpty Then
     begin
        MsgDlg('Já existe operação de amortização maior que a data do lançamento atual. Favor excluír.', 'Mensagem do Sistema',
            mtWarning, [mbOk], 0);
     Exit;
     end;
  End;
  // FIM AL_17

  //AL_2
  If DtEdDataLiquidacao.DateTime < DtEdDataOperacao.DateTime Then
  Begin
     MsgDlg('Data de Liquidação menor que a data do Movimento!','Mensagem do Sistema',mtInformation ,[mbOk],0);
     if DtEdDataLiquidacao.Canfocus then
        DtEdDataLiquidacao.SetFocus;
     Exit;
  End;

  If DbValorCustoNovo.Value > DbSldTotAtual.Value Then
  Begin
     MsgDlg('Valor da Operação não pode ser maior que o Saldo Atual.', 'Erro',
          mtWarning, [mbOk], 0);
     if DbValorCustoNovo.Canfocus then
        DbValorCustoNovo.SetFocus;
     Exit;
  End;

  If DbValorCustoNovo.Value <= 0 Then
  Begin
     MsgDlg('Valor de Custo Atual não pode ser igual ou menor que zero.', 'Erro',
          mtWarning, [mbOk], 0);
     if DbValorCustoNovo.Canfocus then
        DbValorCustoNovo.SetFocus;
     Exit;
  End

  //AL_15 Ini
  else If Trim(dblkPlanPatro.Text) = '' Then
  Begin
     MsgDlg('O Plano / Patro não foi informado.', 'Erro',
          mtWarning, [mbOk], 0);
     if dblkPlanPatro.Canfocus then
        dblkPlanPatro.SetFocus;
     Exit;
  End
  //AL_15 Fim
  Else
  Begin
     Try
       // Inicia Transação
       If not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       //Grava na tabela OperacaoFundo o total da operacao
       If Not GravaOperacao Then
       //Al_11- Ricardo - 01/06/2005
       begin
          dtmBaseDados.dbBaseDados.Rollback;
          bbtnCancelarDetClick(Sender);
          Exit;
       end;
       //Al_11 - Fim

       iPlanilha  := -1;
       iDocumento := -1;
       iPlano     := -1;

       iIdForCli  := OperComum.BuscaForCli(iTipoInvestUsu,
                                           QryFundoInvestOperacao.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                           -43,
                                           pRPI.IDTIPOCLIENTEEMI);

       fValorOperacao := DbValorCustoNovo.Value;

       //Inicia a amortizacao do custo atual
       If Not GravaAmortCustoAtual(QryDetalhe,
                                   DtEdDataOperacao.DateTime,
                                   Trim(QryBuscaTipoOperDESCTIPOOPERACAO.AsString),
                                   QryFundoInvestOperacao.FieldByName('DESCFUNDOINVEST').AsString,
                                   iTipoInvestUsu,
                                   //AL_15
                                   qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger,
                                   QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                   -43,
                                   DbValorCustoNovo.Value,
                                   dbrVlrCustoTotal.Value,
                                   fValorOperacao) Then
       //Al_11 - Ricardo - 01/06/2005
       begin
          dtmBaseDados.dbBaseDados.Rollback;
          bbtnCancelarDetClick(Sender);
          Exit;
       end;
       //Al_11 - Fim

       // Se o custo atual foi todo resgatado, a difrenca deve ser resgatada do saldo atual e
       // cobrada a aliquota do IR
       fValorOperacao := DbValorCustoNovo.Value - dbrVlrCustoTotal.Value;

       If fValorOperacao > 0 Then
       Begin
          //Calcula o IR do valor que exceder o valor de custo e contabiliza
          If Not GravaIRAmort(DtEdDataOperacao.DateTime,
                              fValorOperacao,
                              QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger,
                              QryFundoInvestOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                              QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                              iTipoInvestUsu,
                              iIdForCli,
                              QryFundoInvestOperacao.FieldByName('STAPROVISIONAIR').AsString,
                              QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString,
                              'IR DA AMORTIZAÇÃO',
                              QryFundoInvestOperacao.FieldByName('DESCFUNDOINVEST').AsString,
                              iPlano, iPlanilha, iDocumento) Then
          //Al_11 - Ricardo - 01/06/2005
          begin
             dtmBaseDados.dbBaseDados.Rollback;
             bbtnCancelarDetClick(Sender);
             Exit;
          end;
          //Al_11 - Fim
       End;

       //Al_14 - Ricardo - 21/09/2005
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
                                       //AL_15
                                       DblFundosInvest.Text+' / '+ qryPlanPrevCtbPatrPLANPRVCONTABPATRO.AsString, //sPlanPrevCtbPatro,
                                       True, DbValorCustoNovo.Value,
                                       0, 0, 0, 0,
                                       DbValorCustoNovo.Value, DbValorCustoNovo.Value,
                                      -1, 0, 0, 0) Then       
       //Al_11 - Ricardo - 01/06/2005
       begin
          dtmBaseDados.dbBaseDados.Rollback;
          bbtnCancelarDetClick(Sender);
          Exit;
       end;
       //Al_11 - Fim

       //Alt_4
       // Update no Plano,CodDocumento e PlnCodigo na OPERACAOFUNDO
       With DmFundoComum.QryUpdOpeFinCtb Do
       Begin
         Opercomum.LimpaParametros(DmFundoComum.QryUpdOpeFinCtb);
         ParamByName('IDOPERACAOFUNDO').AsInteger   := QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger;
         ParamByName('PLANO').AsInteger             := iPlano;
         ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
         ParamByName('CODDOCUMENTO').AsInteger      := iDocumento;
         ExecSQL;
       End;

       //AL_11 Ini
       if Trim(dbPU.Text) <> '' then // Para segurar o conteúdo das variáveis.
          fPU := dbPU.Value;
       //AL_11 Fim

       // Confirma Transação
       dtmBaseDados.dbBaseDados.Commit;

       QryTipoFundoInvest.Close;
       QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                          QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
       QryTipoFundoInvest.Open;
       //AL_2
       //If StrToDate(DtEdDataReferenciaGeral.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
       If StrToDate(DtEdDataOperacao.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
       begin
          // Alt_1 - Turon - 06/08/2004
          //Alt_3
          If Not Reprocessamento(iTipoInvestUsu,
                                 QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                 QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                 //AL_15
                                 qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger,
                                 //AL_2
                                 //StrToDate(DtEdDataReferenciaGeral.Text),
                                 StrToDate(DtEdDataOperacao.Text),
                                 QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                 QryFundoInvestOperacao.FieldByName('DTAINIPROC').AsDateTime,
                                 True, -1, fraMensIntCotFdo) Then
             MsgDlg('O Reprocessamento foi cancelado! Faça o fechamento para esse dia até a data desejada!',
                    'Mensagem do Sistema', MtInformation,[MbOk],0);
       end;

       AbreQry;

     Except
       On E:Exception Do Begin
         //Al_8 - Ricardo - 01/06/2005
         MsgDlg('Não foi possível efetuar a Amortização de Cotas:'+#13+
                E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         // Cancela Transação
         dtmBaseDados.dbBaseDados.Rollback;
       End;
     End;
     BtIncAplic.Enabled      := True;
     BtExcAplic.Enabled      := True;

     //Al_18 - Ricardo - 07/02/2006
     sbtnProcurar.Enabled    := True;

     pnlMestre.Enabled       := True;
     BtIncAplic.Down         := False;
     pnlTotais.Visible       := True;
     dbgrdDet.BringToFront;
     TrataTela;
     if DtEdDataReferenciaGeral.Canfocus then
        DtEdDataReferenciaGeral.SetFocus;
  End;
end;

procedure TFrmCadAmortizacaoCotasAcoes.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
   BtIncAplic.Enabled      := True;
   BtExcAplic.Enabled      := True;

   //Al_18 - Ricardo - 07/02/2006
   sbtnProcurar.Enabled    := True;

   pnlMestre.Enabled       := True;
   BtIncAplic.Down         := False;
   pnlTotais.Visible       := True;

   dbgrdDet.BringToFront;

   //AL_20 - Ricardo - 06/03/2006   
   OperComum.LimpaParametros(QryDetalhe);
   OperComum.LimpaParametros(QryTotalDetalhe);
   if ((Trim(DblFundosInvest.Text) <> '') and (Trim(DtEdDataReferenciaGeral.Text) <> '')) then
   begin
      AbreQry;
      TrataTela;
   end
   else
   begin
      QryDetalhe.Open;
      QryTotalDetalhe.Open;
   end;   
end;

procedure TFrmCadAmortizacaoCotasAcoes.DbValorCustoNovoExit(Sender: TObject);
begin
  inherited;
   If DbValorCustoNovo.Value > (DbSldTotAtual.Value) Then
   Begin
      MsgDlg('O Valor da Operação é maior que o Saldo Atual!', 'Erro',
           mtError, [mbOk], 0);
      DbValorCustoNovo.Value := 0;
      if DbValorCustoNovo.CanFocus then
         DbValorCustoNovo.SetFocus;
   End;
end;

function TFrmCadAmortizacaoCotasAcoes.GravaOperacao : Boolean;
Begin
   Try
      QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger   := LeUltRegistro(Nil,'OPERACAOFUNDO');

      QryOperacao.FieldByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

      QryOperacao.FieldByName('IDTIPOOPERACAO').AsInteger    :=
                             QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger;
      QryOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger  :=
                             QryFundoInvestOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger;
//      QryOperacao.FieldByName('DATAOPERACAO').AsDateTime     := DtEdDataOperacao.DateTime;
      //AL_2
//      QryOperacao.FieldByName('DATALIQUIDACAO').AsDateTime   := DtEdDataLiquidacao.DateTime;
      //AL_14
      QryOperacao.FieldByName('IDPLANPREVCTBPATR').AsInteger := qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
      QryOperacao.FieldByName('IDFUNDOINVEST').AsInteger     := StrToInt(DblFundosInvest.LookupValue);
      //Al_7 - Ricardo - 31/05/2005
      QryOperacao.FieldByName('QTDOPERACAO').AsFloat         := dbQtdCotas.Value;
      QryOperacao.FieldByName('VLRCOTA').AsFloat             := dbPU.Value;
      //Al_7 - Fim
      QryOperacao.Post;
      //AL_20 - Ricardo - 06/03/2006      
      QryOperacao.ApplyUpdates;
      QryOperacao.CommitUpdates;
      Result := True;
   Except
      MsgDlg('Não foi possível gravar a Operação!','Mensagem do Sistema',mtInformation ,[mbOk],0);
      Result := False;
   End;
End;

Procedure TFrmCadAmortizacaoCotasAcoes.AbreQry;
Begin
   //AL_14
   QryDetalhe.Close;
   QryTotalDetalhe.Close;
   DbVlrTotCustoOrg.Text := '';
   DbVlrTotCustoAtual.Text := '';
   DbQtdTotCotas.Text := '';
   DbSldTotAtual.Text := '';

   if ((Trim(DblFundosInvest.Text) <> '') and
       (Trim(DtEdDataReferenciaGeral.Text) <> '') and
       (Trim(dblkPlanPatro.Text) <> '')) then
   begin
      //AL_14
      OperComum.LimpaParametros(QryDetalhe);
      if Trim(dblkPlanPatro.Text) <> '' then
         QryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
      QryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger     :=
                QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
      QryDetalhe.ParamByName('DATAMOVFUNDO').AsDateTime     := DtEdDataReferenciaGeral.DateTime;
      QryDetalhe.Open;

      //AL_14
      OperComum.LimpaParametros(QryTotalDetalhe);
      if Trim(dblkPlanPatro.Text) <> '' then
         QryTotalDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
      QryTotalDetalhe.ParamByName('IDFUNDOINVEST').AsInteger     :=
                QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
      QryTotalDetalhe.ParamByName('DATAMOVFUNDO').AsDateTime     :=
                                             DtEdDataReferenciaGeral.DateTime;
      QryTotalDetalhe.Open;

      //AL_14
      OperComum.LimpaParametros(QryValorAmortizado);
      if Trim(dblkPlanPatro.Text) <> '' then
         QryValorAmortizado.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
      QryValorAmortizado.ParamByName('IDFUNDOINVEST').AsInteger     :=
                QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
      QryValorAmortizado.ParamByName('DATAOPERACAO').AsDateTime     := DtEdDataReferenciaGeral.DateTime;
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
         sbtnApagar.Enabled := True;
      End;
   end;
End;

//Al_9 - Ricardo - 01/06/2005
function  TFrmCadAmortizacaoCotasAcoes.VerificaOperacaoAmortizacao(Var iOperOrigem : Integer) : Boolean;
begin
   //AL_14
   if not qryDetalhe.IsEmpty then
   begin
      With QryVerOperAmortizacao Do
      Begin
         //AL_14
         OperComum.LimpaParametros(QryVerOperAmortizacao);
         if Trim(dblkPlanPatro.Text) <> '' then
            ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
         ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(DblFundosInvest.LookupValue);
         ParamByName('DATAMOVFUNDO').AsDateTime     := DtEdDataReferenciaGeral.DateTime;
         Open;
         If IsEmpty Then
            Result := False
         Else
            Result := True;
         iOperOrigem := FieldByName('IDOPERACAOFUNDO').AsInteger;
         Close;
      end;
   end;
end;
//Al_9 - Fim

//Al_9 - Ricardo - 01/06/2005
Procedure TFrmCadAmortizacaoCotasAcoes.TrataTela;
var
   iOperOrigem : Integer;
Begin
   If VerificaOperacaoAmortizacao(iOperOrigem) Then  //Se existir registros de amortizacao, so podera exluir
   Begin
      sbtnImprimir.Enabled         := True;
      sbtnApagar.Enabled           := True;
      BtIncAplic.Enabled           := False;
      dbgrdDet.Color               := clSilver;
      DbVlrTotCustoOrg.Color       := clSilver;
      DbVlrTotCustoAtual.Color     := clSilver;
      DbQtdTotCotas.Color          := clSilver;
      DbSldTotAtual.Color          := clSilver;
      lblDescVlrAmortizado.Visible := True;
      lblVlrAmortizado.Visible     := True;
      FazQuery(QryAux1,'SELECT * FROM OPERACAOFUNDO WHERE IDOPERACAOFUNDO = '+ IntToStr(iOperOrigem));
      lblVlrAmortizado.Caption     := FloatToStrF(QryAux1.FieldByName('VLROPERACAO').AsFloat, ffNumber, 18,2);
      QryAux1.Close;
   End
   Else
   Begin
      sbtnImprimir.Enabled         := False;
      sbtnApagar.Enabled           := False;
      BtIncAplic.Enabled           := True;
      dbgrdDet.Color               := clWhite;
      DbVlrTotCustoOrg.Color       := clWhite;
      DbVlrTotCustoAtual.Color     := clWhite;
      DbQtdTotCotas.Color          := clWhite;
      DbSldTotAtual.Color          := clWhite;
      lblDescVlrAmortizado.Visible := False;
      lblVlrAmortizado.Visible     := False;
   End;
End;

procedure TFrmCadAmortizacaoCotasAcoes.DblFundosInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   //AL_14 Ini
   AbreQry;
   TrataTela;
   //AL_14 Fim   
end;

procedure TFrmCadAmortizacaoCotasAcoes.DtEdDataReferenciaGeralExit(
  Sender: TObject);
begin
  inherited;
  //Alt_3
  DblFundosInvest.Clear;
  dblkPlanPatro.Clear;
  qryDetalhe.Close;
  dbgrdDet.BringToFront;
end;

procedure TFrmCadAmortizacaoCotasAcoes.DblFundosInvestExit(
  Sender: TObject);
begin
  inherited;
   //AL_14 Ini
   AbreQry;
   TrataTela;
   //AL_14 Fim
end;

procedure TFrmCadAmortizacaoCotasAcoes.DtEdDataOperacaoExit(
  Sender: TObject);
begin
  inherited;
   //Alt_3
   DtEdDataLiquidacao.DateTime := DtEdDataOperacao.DateTime;
   if not DiasUteis.DiaUtil(DtEdDataLiquidacao.DateTime,-1,1,'',True,True,False) then
      QryOperacaoDATALIQUIDACAO.AsDateTime := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,DtEdDataLiquidacao.DateTime,True,True,False);
end;

procedure TFrmCadAmortizacaoCotasAcoes.dbPUExit(Sender: TObject);
begin
  inherited;
   DbValorCustoNovo.Value := dbPU.Value * dbQtdCotas.Value;
end;

procedure TFrmCadAmortizacaoCotasAcoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //AL_14 Ini
  qryPlanPrevCtbPatr.Close;
  QryOperacao.Close;
  QryTipoFundo.Close;
  QryFundoInvestOperacao.Close;
  qryDetalhe.Close;
  QryTotalDetalhe.Close;
  //AL_14 Fim
end;

procedure TFrmCadAmortizacaoCotasAcoes.dblkPlanPatroCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   //AL14 Ini
   AbreQry;
   TrataTela;
   //AL14 Fim
end;

procedure TFrmCadAmortizacaoCotasAcoes.dblkPlanPatroExit(Sender: TObject);
begin
  inherited;
  //AL14 Ini
   AbreQry;
   TrataTela;
  //AL14 Fim
end;

//AL_15
procedure TFrmCadAmortizacaoCotasAcoes.dbQtdCotasExit(Sender: TObject);
begin
  inherited;
   DbValorCustoNovo.Value := dbPU.Value * dbQtdCotas.Value;
end;

//AL_20 - Ricardo - 06/03/2006
procedure TFrmCadAmortizacaoCotasAcoes.FormCreate(Sender: TObject);
begin
  inherited;
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

end.
