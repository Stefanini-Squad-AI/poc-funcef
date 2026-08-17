//******************************************************************************
// Data     : 14/01/2008
// Código   : AL_22
// Pendencia: 27227
// Motivo   : Acertando a crítica nos filtros da tela
//******************************************************************************
// Data     : 09/11/2007
// Código   : AL_21
// Pendencia: 22386
// Motivo   : Atulizando a chamada  GravaIRAmort passando idfundoinvest
//******************************************************************************
// Data      : 30/05/2007
// Código    : AL_20
// Motivo    : Implementação de otimização da tela
//******************************************************************************
// Data      : 13/03/2007
// Código    : AL_19
// Motivo    : Ajuste na mensagem de reprocessamento
//******************************************************************************
// Código    : AL_18
// Pendencia : 20453
// SOL       : 33866
// Motivo    : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 30/03/2006
// Código    : AL_17
// Motivo    : Ajuste na busca da rentabilidade e na busca da data de liquidação
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_16
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 07/02/2006
// Código   : AL_15
// Motivo   : Ajuste na inserção, para desabilitar o botão "Procurar"
//******************************************************************************
// Data     : 22/11/2005
// Código   : AL_14
// Motivo   : Implementação referente ao lançamento de "n" operações para diferentes datas de liquidações;
//            Melhora na perfomace das query´s QryDetalhe e QryTotalDetalhe
//******************************************************************************
// Data     : 14/11/2005
// Código   : AL_14
// Motivo   : Passagem de Parâmetro IDOPERACAOFUNDO para posicionar corretamente
//            na qry qdo vier do Procurar
//******************************************************************************
// Data     : 31/10/2005
// Código   : AL_13
// Motivo   : Implementação do campo SALDOQTDCOTASBLQ na query QryDetalhe, onde esse e tratado na passagem
//            para a função GravaAmortCustoAtual
//******************************************************************************
// Data     : 24/10/2005
// Código   : AL_12
// Motivo   : Implementação do tipo de operação(-143 - Amortização de Cotas a Receber)
//******************************************************************************
// Data     : 22/09/2005
// Código   : AL_11
// Motivo   : Implementação do custo e variação para contabilizar
//******************************************************************************
// Data     : 11/07/2005
// Código   : AL_10
// Motivo   : Implementação para o TipoFundoInvest = 14 (FIP) e combo para selecão do
//            Tipo de Fundo
//******************************************************************************
// Data     : 30/05/2005
// Código   : AL_9
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 01/06/2005
// Código   : Al_8
// Motivo   : Retirada as query´s qryParamInvest, QryProximOperacoes e QryVendaAcoes,
//            devido a falta de utilização
//******************************************************************************
// Data     : 01/06/2005
// Código   : Al_7
// Motivo   : Implementação do rollback, botão cancelar e exit
//******************************************************************************
// Data     : 01/06/2005
// Código   : Al_6
// Motivo   : Alteração da mensagem de erro para uma similar
//******************************************************************************
// Data     : 31/05/2005
// Código   : AL_5
// Motivo   : Implementada a rotina que busca o codigo original da operação na HISTFUDO
//******************************************************************************
// Data     : 30/05/2005
// Código   : AL_4
// Motivo   : Acerto na data de gravação da operacaofundo, passa a gravar a mesma
//            que será contabilizada. E passa a gravar DATALIQUIDACAO
//******************************************************************************
// Data     : 02/12/2004
// AL_3
// Motivo   : Acerto na Exclusao de Planilha e Documento
//******************************************************************************
// Data     : 30/11/2004
// AL_2
// Motivo   : Update no Plano,CodDocumento e PlnCodigo na OPERACAOFUNDO
//******************************************************************************
// Data     : 06/10/2004
// Linha(s) : Alt_1
// Motivo   : Inclusão do campo DTAINIPROC na QryFundoInvestOperacao e na funcao Reprocessamento
//******************************************************************************
// Data     : 13/04/2004
// Origem   : FUNCEF
// Função   : GravaAmortCustoAtual, GravaIRAmort, GravaValorAmortContabil
// Linha(s) :456,474,492
// Motivo   : Essas rotinas estão na UFundoComum para serem incluídas no Reprocessamento
//******************************************************************************

unit FCadAmortizacaoCotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, Buttons, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, TREdit,
  ComCtrls, TabControlDetalhe, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, CmEventosCadastro, ImgList, Wwdatsrc, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, uOperacaoInvest, usistema, uCtrlInvContab, fcLabel,
  //AL_20
  FPreview, Mask, DBCtrls;

type
  TFrmCadAmortizacaoCotas = class(TfrmCadastroCS)
    pnlMestre: TPanel;
    tbcDetalhe: TTabControlDetalhe;
    pgctrlDetalhe: TPageControl;
    tbsDet: TTabSheet;
    pnlControlesDet: TPanel;
    //AL_20
    Dock974: TDock97;
    //AL_20
    dbgrdDet: TwwDBGrid;
    Dock973: TDock97;
    //AL_20
    pnlTotais: TPanel;
    DbQtdTotCotas: TDBRealEdit;
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
    QryOperacao: TwwQuery;
    DsOperacao: TwwDataSource;
    UpdOperacao: TUpdateSQL;
    QryTipoFundo: TwwQuery;
    qryAux: TwwQuery;
    QryVerOperAmortizacao: TwwQuery;
    DsTotalDetalhe: TwwDataSource;
    QryTotalDetalhe: TwwQuery;
    //Al_8
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
    //AL_20
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
    //Al_8
    QryDetalheIDTIPOINVEST: TFloatField;
    QryValorAmortizado: TwwQuery;
    Label7: TLabel;
    Label8: TLabel;
    QryFundoInvestOperacaoDTAINIPROC: TDateTimeField;
    QryOperFundo: TwwQuery;
    QryTipoFundoIDTIPOFUNDOINVEST: TFloatField;
    QryTipoFundoIDTIPOINVEST: TFloatField;
    QryTipoFundoDESCTIPOFUNDOINV: TStringField;
    QryTipoFundoDATAULTFECH: TDateTimeField;
    Panel2: TPanel;
    DtEdDataReferenciaGeral: TCMDateTimePicker;
    lblDataMovto: TLabel;
    dblkTipoFundo: TwwDBLookupCombo;
    lblTipoFundo: TLabel;
    DblFundosInvest: TwwDBLookupCombo;
    Label14: TLabel;
    //AL_20
    //AL_12
    Label2: TLabel;
    DblTipoOper: TwwDBLookupCombo;
    QryDetalheSALDOQTDCOTASBLQ: TFloatField;
    //AL_14
    QryVerLiquidacaoOper: TwwQuery;    
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    //AL_20
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    dbrVlrCustoTotal: TDBRealEdit;
    Label6: TLabel;
    dbrVlrRendTotal: TDBRealEdit;
    Label4: TLabel;
    dbrVlrSaldoAtual: TDBRealEdit;
    Label5: TLabel;
    DtEdDataOperacao: TCMDateTimePicker;
    lblDtLiquidacao: TLabel;
    DtEdDataLiquidacao: TCMDateTimePicker;
    Label1: TLabel;
    DbValorCustoNovo: TDBRealEdit;
    DBEVlrTaxa: TDBRealEdit;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure DtEdDataOperacaoExit(Sender: TObject);
    procedure BtIncAplicClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure DbValorCustoNovoExit(Sender: TObject);
    procedure DblFundosInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkTipoFundoExit(Sender: TObject);
    //AL_12
    procedure DblTipoOperCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DblTipoOperExit(Sender: TObject);
    procedure DblFundosInvestExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //AL_20
    procedure DtEdDataReferenciaGeralExit(Sender: TObject);
    procedure dblkTipoFundoEnter(Sender: TObject);
    procedure DblFundosInvestEnter(Sender: TObject);
    procedure DblTipoOperEnter(Sender: TObject);
  private
    { Private declarations }
    //AL_20
    bModif    : Boolean;
    sVarAnt : string;
    // AL_22
    sVarAntTipo,sVarAntFundo,sVarAntOpe: string;
    function  GravaOperacao               : Boolean;    
    //Al_5
    //AL_14
    //AL_14
    function  VerificaOperacaoAmortizacao(iOperFundo : Integer = -1) : Boolean;
    function  ValidaDados : Boolean;
    //AL_14
    procedure AbreQry(iOperFundo : Integer = -1);
    //AL_14
    //AL_14
    procedure TrataTela(iOperFundo : Integer = -1);

  public
    { Public declarations }
  end;

var
  FrmCadAmortizacaoCotas: TFrmCadAmortizacaoCotas;
  iIdForCli, iPlanilha, iDocumento, iPlano : Integer;
  sRecPag  : String;
  fValorAplicado, fValorOperacao, fValorAmortizado   : Currency;  
  //AL_14
  iOperOrigem, iQtdOper : Integer;

implementation

uses UFundoComum, dFundoComum, UDataBase, dBaseDados, UOperComum,
     UBibliotecaInvest, UmensErro, UDiasUteisInv, UImpostos, fAguarde,
     FDmRelatoriosFundos, FCadLanctoVdFundoCpAcoes, FPrincipal;

{$R *.DFM}

procedure TFrmCadAmortizacaoCotas.FormShow(Sender: TObject);
begin
  inherited;
  
  dbgrdDet.BringToFront;

  //AL_20
  OperComum.LimpaParametros(QryOperacao);
  QryOperacao.Open;
  
  OperComum.LimpaParametros(QryTipoFundo);
  QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger     :=iTipoInvestUsu;
  QryTipoFundo.Open;

  //AL_12
  OperComum.LimpaParametros(QryBuscaTipoOper);
  QryBuscaTipoOper.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryBuscaTipoOper.Open;

  //AL_10
  OperComum.LimpaParametros(QryFundoInvestOperacao);
  QryFundoInvestOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryFundoInvestOperacao.Open;

  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu));

  //AL_20
  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro));

end;

procedure TFrmCadAmortizacaoCotas.FormActivate(Sender: TObject);
begin
  inherited;
   PnlFundo.Enabled := True;
   //AL_20
end;

procedure TFrmCadAmortizacaoCotas.sbtnApagarClick(Sender: TObject);
Var
   wStr        : String;
   bProcesso   : Boolean;
   //Al_5
   //AL_14
begin

  inherited;

  bProcesso := False;

  If DtEdDataReferenciaGeral.DateTime = 0 then
  Begin
     MsgDlg('Data está em branco!','Mensagem do Sistema',mtInformation ,[mbOk],0);
     DtEdDataReferenciaGeral.SetFocus;
     sbtnApagar.Down := False;
     Exit;
  End;

  If Length(Trim(DblFundosInvest.Text)) = 0 then
  Begin
     MsgDlg('Selecione um Fundo de Investimento!','Mensagem do Sistema',mtInformation ,[mbOk],0);
     // AL_9
     if DblFundosInvest.CanFocus then
        DblFundosInvest.SetFocus;
     sbtnApagar.Down := False;
     Exit;
  End;

  // AL_9
  //AL_18
  if not CtrlInvContab.TestaPeriodo(DtEdDataReferenciaGeral.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if DtEdDataReferenciaGeral.CanFocus then
        DtEdDataReferenciaGeral.SetFocus;
     sbtnApagar.Down := False;
     Exit;
  end;

  //AL_16
  if VerEmAbertura(QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes  Then
  Begin
     //Al_5
     //AL_14
     //AL_14
     If Not VerificaOperacaoAmortizacao(iOperOrigem) Then
     Begin
        MsgDlg('Essas operações não foram Amortizadas nessa data. '#13+
               'Não poderá excluir essas Operações!','Mensagem do Sistema', mtInformation, [mbOk],0);
        sbtnApagar.Down := False;
        Exit;
     End;
    //Al_5 - Fim

     Try

        If not dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.StartTransaction;

        //AL_3 Ini
        OperComum.LimpaParametros(QryOperFundo);
        //Al_5
        QryOperFundo.ParamByName('IDOPERACAOFUNDO').AsInteger := iOperOrigem;
        QryOperFundo.Open;
        If Not QryOperFundo.IsEmpty Then
        begin
           If Not ProcExcluiFundo(QryOperFundo.FieldByName('CODDOCUMENTO').AsInteger,
                                  QryOperFundo.FieldByName('PLNCODIGO').AsInteger,
                                  QryOperFundo.FieldByName('PLANO').AsInteger,
                                  QryOperFundo.FieldByName('IDTIPOINVEST').AsInteger,
                                  QryOperFundo.FieldByName('DATAOPERACAO').AsDateTime, True,
                                  //AL_14
                                  iOperOrigem) Then
              //Al_6
              Raise Exception.Create('Não foi possivel excluir o Contábil/Financeiro da operação.');
        end;

        //AL_12
        //AL_3 Fim
        //AL_14
        //AL_20
        wStr := 'DELETE FROM IRLITIGIO WHERE DATAFATOGERADOR = TO_DATE('''+
             QryOperFundo.FieldByName('DATAOPERACAO').AsString + ''',''DD/MM/YYYY'') AND '+
             '   IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO '+
             '                       WHERE IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+' AND '+
             '                       IDPLANPREVCTBPATR  = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
             '                       IDFUNDOINVEST      = '+DblFundosInvest.LookupValue+' AND '+
             '                       DATAOPERACAO       = TO_DATE('''+ QryOperFundo.FieldByName('DATAOPERACAO').AsString +''',''DD/MM/YYYY'') AND '+
             '                       IDTIPOOPERACAO     = '+DblTipoOper.LookupValue;
         //AL_14
         //AL_20
         if iOperOrigem <> -1 then
            wStr := wStr + ' AND                   IDOPERACAOFUNDO = ' + IntToStr(iOperOrigem)  + ' ) '
         else
            wStr := wStr + ') ';

        //Al_6
        If Not ExecutaQuery(QryAux,wStr) Then
           Raise Exception.Create('Não foi possivel excluir o IR Litígio do Fundo.');

        //AL_12
        //AL_14
        //AL_20
        wStr := 'DELETE FROM HISTFUNDO WHERE IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+' AND '+
                '                      IDPLANPREVCTBPATR  = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                '                      IDFUNDOINVEST      = '+QryOperFundo.FieldByName('IDFUNDOINVEST').AsString +' AND '+
                '                      DATAMOVFUNDO       = TO_DATE('+QuotedStr(QryOperFundo.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'') AND '+
                '                      IDTIPOOPERACAO     = '+DblTipoOper.LookupValue;
         //AL_14
         if iOperOrigem <> -1 then
            wStr := wStr + ' AND IDOPERACAOFUNDO = ' + IntToStr(iOperOrigem);

        //Al_6
        If Not ExecutaQuery(QryAux,wStr) Then
           Raise Exception.Create('Não foi possivel excluir o Histórico do Fundo.');

        //AL_12
        //AL_14
        //AL_20
        wStr := 'DELETE FROM OPERACAOFUNDO WHERE IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+' AND '+
                '                          IDPLANPREVCTBPATR  = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                '                          IDFUNDOINVEST      = '+QryOperFundo.FieldByName('IDFUNDOINVEST').AsString+' AND '+
                '                          DATAOPERACAO       = TO_DATE('+QuotedStr(QryOperFundo.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'') AND '+
                '                          IDTIPOOPERACAO     = '+DblTipoOper.LookupValue;
         //AL_14
         if iOperOrigem <> -1 then
            wStr := wStr + ' AND IDOPERACAOFUNDO = ' + IntToStr(iOperOrigem);

        //Al_6
        If Not ExecutaQuery(QryAux,wStr) Then
           Raise Exception.Create('Não foi possivel excluir a Operação do Fundo.');

        If DtEdDataOperacao.DateTime  = 0 Then
           DtEdDataOperacao.DateTime := DtEdDataReferenciaGeral.DateTime;

        //AL_14
        QryOperFundo.Close;
        QryAux.Close;

        // Confirma Transação
        dtmBaseDados.dbBaseDados.Commit;

        QryTipoFundoInvest.Close;
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
                                  True) Then
              //AL_19                                  
              MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                     'Mensagem do Sistema', MtInformation,[MbOk],0);
        end;

        bProcesso := True;

     Except
        On E:Exception Do Begin
           //Al_6
           MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
           // Cancela Transação
           If dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.Rollback;
           //Al_6 - Fim
           //AL_20
        End;
     End;

     //AL_20
     QryOperFundo.Close;
     QryAux.Close;

     //AL_14
     AbreQry;
     //AL_20
     TrataTela;

     If bProcesso Then
        MsgDlg('Processo concluído com sucesso.','Mensagem do Sistema',mtInformation ,[mbOk],0);
  end;
end;

procedure TFrmCadAmortizacaoCotas.sbtnImprimirClick(Sender: TObject);
begin
  inherited;
   DmRelatoriosFundo.ppBDEPConsAmortizacaoCotas.DataSource := FrmCadAmortizacaoCotas.DsDetalhe;
   //AL_20
   DmRelatoriosFundo.pplFundo.Caption := Trim(DblFundosInvest.Text);
   DmRelatoriosFundo.ppBDEPConsAmortizacaoCotas.DataSource := FrmCadAmortizacaoCotas.DsDetalhe;
   DmRelatoriosFundo.ppLValorAmortizado.Caption  := FloatToStrF(fValorAmortizado,ffNumber,18,2);
   DmRelatoriosFundo.ppDBText5.DisplayFormat := MontaMascaraDecQtd(StrToInt(FrmCadAmortizacaoCotas.DblFundosInvest.LookupValue));
   DmRelatoriosFundo.ppDBCalc3.DisplayFormat := DmRelatoriosFundo.ppDBText5.DisplayFormat;
   DmRelatoriosFundo.LblPlanoAmort.Caption   := sPlanPrevCtbPatro;
   TFrmPreview.CreateModalPreview(Application,
                                  DmRelatoriosFundo.ppRConsAmortizacaoCotas,
                                  DmRelatoriosFundo.ppRConsAmortizacaoCotas.PrinterSetup.DocumentName);
   sbtnImprimir.Down := False;
end;

procedure TFrmCadAmortizacaoCotas.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
  Begin
     DtEdDataReferenciaGeral.DateTime := StrToDate(MontaSelect.ValoresChave[1]);

     QryTipoFundo.Locate('IDTIPOFUNDOINVEST',MontaSelect.ValoresChave[3],[]);
     dblkTipoFundo.Text               := QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString;
     dblkTipoFundo.LookupValue        := MontaSelect.ValoresChave[3];
     dblkTipoFundo.PerformSearch;

     //AL_20
     OperComum.LimpaParametros(QryFundoInvestOperacao);
     QryFundoInvestOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     QryFundoInvestOperacao.ParamByName('DATAMOVFUNDO').AsString  := MontaSelect.ValoresChave[1];
     QryFundoInvestOperacao.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(MontaSelect.ValoresChave[3]);
     QryFundoInvestOperacao.Open;

     QryFundoInvestOperacao.Locate('IDFUNDOINVEST',MontaSelect.ValoresChave[0],[]);
     DblFundosInvest.Text             := QryFundoInvestOperacao.FieldByName('DESCFUNDOINVEST').AsString;
     DblFundosInvest.LookupValue      := MontaSelect.ValoresChave[0];
     DblFundosInvest.PerformSearch;

     //AL_12
     QryBuscaTipoOper.Locate('IDTIPOOPERACAO',MontaSelect.ValoresChave[2],[]);
     DblTipoOper.Text                 := QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString;
     DblTipoOper.LookupValue          := MontaSelect.ValoresChave[2];
     DblTipoOper.PerformSearch;

     //AL_14 Ini
     //AL_14
     iOperOrigem  := StrToInt(MontaSelect.ValoresChave[4]);
     AbreQry;
     sbtnApagar.Enabled    := True;
     TrataTela(iOperOrigem);
     //AL_14 Fim
  End;

  PnlFundo.Enabled := True;
end;

procedure TFrmCadAmortizacaoCotas.DtEdDataOperacaoExit(Sender: TObject);
begin
  inherited;
  While not DiasUteisInv.DiaUtil(DtEdDataOperacao.DateTime,-1,1,'',True,False,False) Do
      DtEdDataOperacao.DateTime := DtEdDataOperacao.DateTime + 1;
end;

procedure TFrmCadAmortizacaoCotas.BtIncAplicClick(Sender: TObject);
begin
  inherited;
  // AL_22
  If (DtEdDataReferenciaGeral.text <> '' ) and
     (dblkTipoFundo.text <> '') and
     (DblFundosInvest.text <> '' ) and
     (DblTipoOper.text <> '') then
  begin
   BtIncAplic.Enabled        := False;
   BtExcAplic.Enabled        := False;

   //Al_15
   sbtnApagar.Enabled        := False;
   sbtnImprimir.Enabled      := False;
   sbtnProcurar.Enabled      := False;

   pnlMestre.Enabled         := False;
   pnlTotais.Visible         := False;
   pnlControlesDet.BringToFront;

   QryOperacao.Close;
   QryOperacao.Open;
   QryOperacao.Append;

   DtEdDataOperacao.DateTime := DtEdDataReferenciaGeral.DateTime;
   //AL_14
   DtEdDataOperacao.Enabled := False;

   //AL_17
   QryOperacao.FieldByName('DATALIQUIDACAO').AsDateTime := DiasUteisInv.SomaDiasUteis(DtEdDataReferenciaGeral.DateTime,
                                                             QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger,
                                                             -1,1,'',True,False,False);

   if QryOperacao.FieldByName('DATALIQUIDACAO').AsDateTime  = 0 then
      QryOperacao.FieldByName('DATALIQUIDACAO').AsDateTime := DtEdDataReferenciaGeral.DateTime;

   if DtEdDataLiquidacao.CanFocus then
      DtEdDataLiquidacao.SetFocus;
   end
   else
   begin
      // Vou devolver o foco para quem está vazio
      If not (CsDestroying in FrmCadAmortizacaoCotas.ComponentState) then
      begin
          QryDetalhe.Close;
          QryTotalDetalhe.Close;
          DbVlrTotCustoOrg.Text   := '0,00';
          DbVlrTotCustoAtual.Text := '0,00';
          DbQtdTotCotas.Text      := '0,00';
          DbSldTotAtual.Text      := '0,00';
          If DtEdDataReferenciaGeral.DateTime = 0 then
          Begin
             MsgDlg('A Data está em branco!','Mensagem do Sistema',mtWarning,[mbOk],0);
             DtEdDataReferenciaGeral.SetFocus;
             Exit;
          End
          else If Length(Trim(dblkTipoFundo.Text)) = 0 then
          Begin
             MsgDlg('Selecione um Tipo de Fundo de Investimento!','Mensagem do Sistema',mtWarning,[mbOk],0);
             if dblkTipoFundo.CanFocus then
                dblkTipoFundo.SetFocus;
             Exit;
          End
          else If Length(Trim(DblFundosInvest.Text)) = 0 then
          Begin
             MsgDlg('Selecione um Fundo de Investimento!','Mensagem do Sistema',mtWarning,[mbOk],0);
             if DblFundosInvest.CanFocus then
                DblFundosInvest.SetFocus;
             Exit;
           End
           Else If Length(Trim(DblTipoOper.Text)) = 0 then
           Begin
              MsgDlg('Selecione uma Operação!','Mensagem do Sistema',mtWarning,[mbOk],0);
              if DblTipoOper.CanFocus then
                 DblTipoOper.SetFocus;
              Exit;
           End;
     end;
   end;
end;

procedure TFrmCadAmortizacaoCotas.bbtnOkDetClick(Sender: TObject);
begin
  //AL_14
  if Not ValidaDados then
     Exit;

  // AL_9
  //AL_18
  if not CtrlInvContab.TestaPeriodo(DtEdDataOperacao.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     Exit;
  end;

  //AL_16
  if VerEmAbertura(QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  Try
    //AL_12
    // Inicia Transação
    If not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

    //Grava na tabela OperacaoFundo o total da operacao
    If Not GravaOperacao Then
    begin
        //Al_7
       dtmBaseDados.dbBaseDados.Rollback;
       bbtnCancelarDetClick(Sender);
       exit;
        //Al_7 - Fim
    end;

    iPlanilha  := -1;
    iDocumento := -1;
    iPlano     := -1;
    //AL_12
    iIdForCli  := OperComum.BuscaForCli(iTipoInvestUsu,
                                        QryFundoInvestOperacao.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                        StrToInt(DblTipoOper.LookupValue),
                                        pRPI.IDTIPOCLIENTEEMI);

    fValorOperacao := DbValorCustoNovo.Value;
    //AL_12
    //Inicia a amortizacao do custo atual
    If Not GravaAmortCustoAtual(QryDetalhe,
                                DtEdDataOperacao.DateTime,
                                Trim(QryBuscaTipoOperDESCTIPOOPERACAO.AsString),
                                QryFundoInvestOperacao.FieldByName('DESCFUNDOINVEST').AsString,
                                iTipoInvestUsu, iPlanPrevCtbPatro,
                                QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                DbValorCustoNovo.Value,
                                dbrVlrCustoTotal.Value,
                                fValorOperacao) Then
    begin
       //Al_7
       dtmBaseDados.dbBaseDados.Rollback;
       bbtnCancelarDetClick(Sender);
       exit;
       //Al_7 - Fim
    end;

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
       begin
          //Al_7
          dtmBaseDados.dbBaseDados.Rollback;
          bbtnCancelarDetClick(Sender);
          exit;
          //Al_7 - Fim
       end;
    End;

    //Al_11
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
                                   -1, 0, 0, 0) Then
    begin
       //Al_7
       dtmBaseDados.dbBaseDados.Rollback;
       bbtnCancelarDetClick(Sender);
       exit;
       //Al_7 - Fim
    end;

    //Al_2
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

    iOperOrigem  := QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger;

    // Confirma Transação
    dtmBaseDados.dbBaseDados.Commit;

    QryTipoFundoInvest.Close;
    QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                       QryFundoInvestOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
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
                              True) Then
          //AL_19                              
          MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                 'Mensagem do Sistema', MtInformation,[MbOk],0);
    end;

    AbreQry;

  Except
    On E:Exception Do Begin
      //Al_6
      MsgDlg('Não foi possível efetuar a Amortização de Cotas.:' + #13 +
             E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
      //Al_6 - Fim
      // Cancela Transação
      dtmBaseDados.dbBaseDados.Rollback;
    End;
  End;

  AplicaAlteracoes([qryDetalhe]);

  BtIncAplic.Enabled      := True;
  BtExcAplic.Enabled      := True;
  pnlMestre.Enabled       := True;
  BtIncAplic.Down         := False;
  pnlTotais.Visible       := True;
  dbgrdDet.BringToFront;

  //Al_15
  //AL_14
  sbtnApagar.Enabled      := True;
  sbtnImprimir.Enabled    := True;
  sbtnProcurar.Enabled    := True;
  TrataTela;
  DtEdDataReferenciaGeral.SetFocus;
end;

procedure TFrmCadAmortizacaoCotas.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
   //AL_20   
   BtIncAplic.Enabled      := True;
   BtExcAplic.Enabled      := True;
   //AL_20 
   //Al_15
   sbtnProcurar.Enabled    := True;

   pnlMestre.Enabled       := True;
   BtIncAplic.Down         := False;
   pnlTotais.Visible       := True;

   dbgrdDet.BringToFront;
   //AL_20 
   OperComum.LimpaParametros(QryDetalhe);
   OperComum.LimpaParametros(QryTotalDetalhe);

   if ((Trim(DtEdDataReferenciaGeral.Text) <> '') and (Trim(dblkTipoFundo.Text) <> '') and
       (Trim(DblFundosInvest.Text) <> '') and (Trim(DblTipoOper.Text) <> '')) then
      AbreQry
   else
   begin
      QryDetalhe.Open;
      QryTotalDetalhe.Open;
   end;

   TrataTela;   

end;

procedure TFrmCadAmortizacaoCotas.DbValorCustoNovoExit(Sender: TObject);
begin
  inherited;
   If DbValorCustoNovo.Value > (DbSldTotAtual.Value) Then
   Begin
      MsgDlg('O Valor da Operação é maior que o Saldo Atual!', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      DbValorCustoNovo.SetFocus;
   End;
end;

function TFrmCadAmortizacaoCotas.GravaOperacao : Boolean;
Begin
   Try
      QryOperacao.FieldByName('IDOPERACAOFUNDO').AsInteger   := LeUltRegistro(Nil,'OPERACAOFUNDO');

      QryOperacao.FieldByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

      QryOperacao.FieldByName('IDTIPOOPERACAO').AsInteger    :=
                             QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger;
      QryOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger  :=
                             QryFundoInvestOperacao.FieldByName('IDCARTEIRAINVEST').AsInteger;
      //Al_4
      QryOperacao.FieldByName('DATAOPERACAO').AsDateTime     := DtEdDataOperacao.DateTime;
      //AL_14
      QryOperacao.FieldByName('DATALIQUIDACAO').AsDateTime   := DtEdDataLiquidacao.DateTime;      
      //Al_4 - Fim
      QryOperacao.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryOperacao.FieldByName('IDFUNDOINVEST').AsInteger     := StrToInt(DblFundosInvest.LookupValue);

      QryOperacao.Post;
      QryOperacao.CommitUpdates;
      Result := True;
   Except
      MsgDlg('Não foi possível gravar a Operação!','Mensagem do Sistema',mtInformation ,[mbOk],0);
      Result := False;
   End;
End;

//AL_14
Procedure TFrmCadAmortizacaoCotas.AbreQry(iOperFundo : Integer = -1);
Begin
   //AL_10
   QryDetalhe.Close;
   QryTotalDetalhe.Close;
   DbVlrTotCustoOrg.Text := '';
   DbVlrTotCustoAtual.Text := '';
   DbQtdTotCotas.Text := '';
   DbSldTotAtual.Text := '';

   if ((Trim(DblFundosInvest.Text) <> '') and
       (Trim(DtEdDataReferenciaGeral.Text) <> '') and
       (Trim(DblTipoOper.Text) <> '')) then
   begin
      //AL_12
      OperComum.LimpaParametros(QryDetalhe);
      QryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger     :=
                QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
      QryDetalhe.ParamByName('DATAMOVFUNDO').AsString       := DateToStr(DtEdDataReferenciaGeral.DateTime);
      //AL_14
      //AL_14
      if iOperFundo > 0 then
         QryDetalhe.ParamByName('IDOPERACAOFUNDO').AsInteger := iOperFundo;

      QryDetalhe.Open;

      //AL_12
      OperComum.LimpaParametros(QryTotalDetalhe);
      QryTotalDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryTotalDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryTotalDetalhe.ParamByName('IDFUNDOINVEST').AsInteger     :=
                QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
      //AL_14 Ini
      QryTotalDetalhe.ParamByName('DATAMOVFUNDO').AsString      := DateToStr(DtEdDataReferenciaGeral.DateTime);
      //AL_14
      if iOperFundo > 0 then
         QryTotalDetalhe.ParamByName('IDOPERACAOFUNDO').AsInteger := iOperFundo;
      QryTotalDetalhe.Open;

      fValorAmortizado := 0;
       //AL_14 Fim
      //AL_12
      OperComum.LimpaParametros(QryValorAmortizado);
      QryValorAmortizado.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      if trim(DblTipoOper.LookupValue) <> '' then
         QryValorAmortizado.ParamByName('IDTIPOOPERACAO').AsInteger := StrToInt(DblTipoOper.LookupValue);
      QryValorAmortizado.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryValorAmortizado.ParamByName('IDFUNDOINVEST').AsInteger     :=
                QryFundoInvestOperacao.FieldByName('IDFUNDOINVEST').AsInteger;
      //AL_14
      QryValorAmortizado.ParamByName('DATAOPERACAO').AsString     := DateToStr(DtEdDataReferenciaGeral.DateTime);
      //AL_14
      if iOperFundo > 0 then
         QryValorAmortizado.ParamByName('IDOPERACAOFUNDO').AsInteger := iOperFundo;

      QryValorAmortizado.Open;
      fValorAmortizado  := QryValorAmortizado.FieldByName('VLROPERACAO').AsFloat;
      iOperOrigem       := QryValorAmortizado.FieldByName('IDOPERACAOFUNDO').AsInteger;

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
         //AL_14
         if (not QryValorAmortizado.IsEmpty) and (QryValorAmortizado.RecordCount = 1) then
            sbtnApagar.Enabled := True;
      End;
      //AL_14
      QryValorAmortizado.Close;
   end;
End;

//Al_5
//AL_14
//AL_14
function  TFrmCadAmortizacaoCotas.VerificaOperacaoAmortizacao(iOperFundo : Integer = -1) : Boolean;
begin
   //AL_10
   if not qryDetalhe.IsEmpty then
   begin
      With QryVerOperAmortizacao Do
      Begin
         //AL_14
         OperComum.LimpaParametros(QryVerOperAmortizacao);
         ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;         
         //AL_12
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
         if trim(DblFundosInvest.LookupValue) <> '' then
            ParamByName('IDFUNDOINVEST').AsInteger  := StrToInt(DblFundosInvest.LookupValue);
         //AL_14
         ParamByName('DATAOPERACAO').AsString       := DateToStr(DtEdDataReferenciaGeral.DateTime);
         if (iOperFundo > 0) then
            ParamByName('IDOPERACAOFUNDO').AsInteger:= iOperFundo;
         if trim(DblTipoOper.LookupValue) <> '' then
            ParamByName('IDTIPOOPERACAO').AsInteger := StrToInt(DblTipoOper.LookupValue);
         Open;
         //AL_14 Ini
         If IsEmpty Then
         begin
            iQtdOper := 0;
            Result := False;
         end
         else
         begin
            iQtdOper := QryVerOperAmortizacao.RecordCount;
            Result := True;
         end;
      End;
   end;
end;
//Al_5 - Fim

//Al_5
//AL_14
//AL_14
Procedure TFrmCadAmortizacaoCotas.TrataTela(iOperFundo : Integer = -1);
Begin
   BtIncAplic.Enabled  := True;
   If VerificaOperacaoAmortizacao(iOperFundo) Then  //Se existir registros de amortizacao, so podera exluir
   Begin
      sbtnImprimir.Enabled  := True;
      //Al_15
      sbtnApagar.Enabled    := True;
      //AL_20 
      BtIncAplic.Enabled       := False;
      dbgrdDet.Color           := clSilver;
      DbVlrTotCustoOrg.Color   := clSilver;
      DbVlrTotCustoAtual.Color := clSilver;
      DbQtdTotCotas.Color      := clSilver;
      DbSldTotAtual.Color      := clSilver;
      Label7.Visible        := True;
      Label8.Visible        := True;
      Label8.Caption        := FloatToStrF(fValorAmortizado, ffNumber, 18,2);
   End
   Else
   Begin
      sbtnImprimir.Enabled  := False;
      sbtnApagar.Enabled    := False;
      //AL_20 
      BtIncAplic.Enabled       := (Not QryDetalhe.IsEmpty);
      dbgrdDet.Color           := clWhite;
      DbVlrTotCustoOrg.Color   := clWhite;
      DbVlrTotCustoAtual.Color := clWhite;
      DbQtdTotCotas.Color      := clWhite;
      DbSldTotAtual.Color      := clWhite;
      Label7.Visible           := False;
      Label8.Visible           := False;
   End;
End;
//Al_5 - Fim

procedure TFrmCadAmortizacaoCotas.DblFundosInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //AL_12
  //AL_20
  bModif := modified; 
  if ((modified) and (Trim(dblkTipoFundo.Text) <> '') and (Trim(DtEdDataReferenciaGeral.Text) <> '') and
      (Trim(DblFundosInvest.Text) <> '') and (Trim(DblTipoOper.Text) <> '')) then
      AbreQry
  else
  begin
     QryDetalhe.Close;
     QryTotalDetalhe.Close;
     DbVlrTotCustoOrg.Text   := '0,00';
     DbVlrTotCustoAtual.Text := '0,00';
     DbQtdTotCotas.Text      := '0,00';
     DbSldTotAtual.Text      := '0,00';
  end;

  //AL_14
  sbtnApagar.Enabled := False;
  
  TrataTela;
  
end;

procedure TFrmCadAmortizacaoCotas.dblkTipoFundoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //AL_10 Ini
  //AL_20
  bModif := modified;
  if ((modified) and (Trim(dblkTipoFundo.Text) <> '')) then
  begin
     DtEdDataReferenciaGeral.Text := QryTipoFundoDATAULTFECH.AsString;
     OperComum.LimpaParametros(QryFundoInvestOperacao);
     QryFundoInvestOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     QryFundoInvestOperacao.ParamByName('DATAMOVFUNDO').AsString  := QryTipoFundoDATAULTFECH.AsString;
     QryFundoInvestOperacao.ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundoIDTIPOFUNDOINVEST.AsInteger;
     QryFundoInvestOperacao.Open;
  end;

  QryDetalhe.Close;
  QryTotalDetalhe.Close;

  DbVlrTotCustoOrg.Text   := '0,00';
  DbVlrTotCustoAtual.Text := '0,00';
  DbQtdTotCotas.Text      := '0,00';
  DbSldTotAtual.Text      := '0,00';

  //AL_14
  sbtnApagar.Enabled := False;

  TrataTela;
  //AL_10 Ini
end;

procedure TFrmCadAmortizacaoCotas.dblkTipoFundoExit(Sender: TObject);
begin
  inherited;
  //AL_10 Ini
  //AL_20
  if ((Not bModif) and (Trim(dblkTipoFundo.Text) <> '')) then
  begin
     OperComum.LimpaParametros(QryFundoInvestOperacao);
     QryFundoInvestOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     QryFundoInvestOperacao.ParamByName('DATAMOVFUNDO').AsString  := QryTipoFundoDATAULTFECH.AsString;
     QryFundoInvestOperacao.ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundoIDTIPOFUNDOINVEST.AsInteger;
     QryFundoInvestOperacao.Open;
  end;

  QryDetalhe.Close;
  QryTotalDetalhe.Close;

  DbVlrTotCustoOrg.Text   := '0,00';
  DbVlrTotCustoAtual.Text := '0,00';
  DbQtdTotCotas.Text      := '0,00';
  DbSldTotAtual.Text      := '0,00';

  //AL_14
  sbtnApagar.Enabled := False;
  
  TrataTela;
  //AL_20 - Fim 
  bModif := false;

  //AL_10 Ini
end;

//AL_12
procedure TFrmCadAmortizacaoCotas.DblTipoOperCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //AL_20
  bModif := modified;
  if ((modified) and (Trim(dblkTipoFundo.Text) <> '') and (Trim(DtEdDataReferenciaGeral.Text) <> '') and 
      (Trim(DblFundosInvest.Text) <> '') and (Trim(DblTipoOper.Text) <> '')) then
     AbreQry
  else
  begin
     QryDetalhe.Close;
     QryTotalDetalhe.Close;
     
     DbVlrTotCustoOrg.Text   := '0,00';
     DbVlrTotCustoAtual.Text := '0,00';
     DbQtdTotCotas.Text      := '0,00';
     DbSldTotAtual.Text      := '0,00';
  end;

  //AL_14
  sbtnApagar.Enabled := False;

  TrataTela;
end;

procedure TFrmCadAmortizacaoCotas.DblTipoOperExit(Sender: TObject);
begin
  inherited;
  //AL_22
  //AL_20
  if ((not bModif) and (Trim(dblkTipoFundo.Text) <> '') and (Trim(DtEdDataReferenciaGeral.Text) <> '') and 
      (Trim(DblFundosInvest.Text) <> '') and (Trim(DblTipoOper.Text) <> '') and
      (sVarAntOpe <> DblTipoOper.LookupValue)) then
     AbreQry;
 { else
  begin
     QryDetalhe.Close;
     QryTotalDetalhe.Close;
     
     DbVlrTotCustoOrg.Text   := '0,00';
     DbVlrTotCustoAtual.Text := '0,00';
     DbQtdTotCotas.Text      := '0,00';
     DbSldTotAtual.Text      := '0,00';
  end;}

  //AL_14
  sbtnApagar.Enabled := False;

  TrataTela;
  //AL_20 
  bModif := false;  

end;

procedure TFrmCadAmortizacaoCotas.DblFundosInvestExit(Sender: TObject);
begin
  inherited;
  //AL_22
   //AL_12
   //AL_20
   if ((Not bModif) and (Trim(dblkTipoFundo.Text) <> '') and (Trim(DtEdDataReferenciaGeral.Text) <> '') and
       (Trim(DblFundosInvest.Text) <> '') and (sVarAntFundo <> DblFundosInvest.LookupValue) and
       (Trim(DblTipoOper.Text) <> '')) then
      //AL_10
      AbreQry;
  {else
  begin
     QryDetalhe.Close;
     QryTotalDetalhe.Close;
     
     DbVlrTotCustoOrg.Text   := '0,00';
     DbVlrTotCustoAtual.Text := '0,00';
     DbQtdTotCotas.Text      := '0,00';
     DbSldTotAtual.Text      := '0,00';
  end;}

  //AL_14
  sbtnApagar.Enabled := False;
  
  TrataTela;
  
  //AL_20 
  bModif := false;    

end;

//AL_14
function TFrmCadAmortizacaoCotas.ValidaDados : Boolean;
begin
  //AL_12
  if Trim(DblFundosInvest.Text) = '' then
  begin
     MsgDlg('Fundo de Investimento não foi selecionado.', 'Atenção', mtInformation, [mbOk], 0);
     if DblFundosInvest.CanFocus then
        DblFundosInvest.SetFocus;
     Result := False;
     Exit;
  end;

  if Trim(DblTipoOper.Text) = '' then
  begin
     MsgDlg('Tipo de operação não preenchida.', 'Atenção', mtInformation, [mbOk], 0);
     if DblTipoOper.CanFocus then
        DblTipoOper.SetFocus;
     Result := False;
     Exit;
  end;

  if Trim(DtEdDataOperacao.Text) = '' then
  begin
     MsgDlg('Data da operação não preenchida.', 'Atenção', mtInformation, [mbOk], 0);
     if DtEdDataOperacao.CanFocus then
        DtEdDataOperacao.SetFocus;
     Result := False;
     Exit;
  end;

  If DtEdDataOperacao.DateTime > QryTipoFundo.FieldByName('DATAULTFECH').AsdateTime Then
  Begin
     MsgDlg('Data do Movimento maior que a data do Último Fechamento!','Mensagem do Sistema', mtInformation, [mbOk],0);
     if DtEdDataOperacao.Canfocus then
        DtEdDataOperacao.SetFocus;
     Result := False;
     Exit;
  End;

  If DtEdDataLiquidacao.DateTime < DtEdDataOperacao.DateTime Then
  Begin
     MsgDlg('Data de Liquidação menor que a data do Movimento!','Mensagem do Sistema', mtInformation, [mbOk],0);
     if DtEdDataLiquidacao.Canfocus then
        DtEdDataLiquidacao.SetFocus;
     Result := False;
     Exit;
  End;

  If DbValorCustoNovo.Value > DbSldTotAtual.Value Then
  Begin
     MsgDlg('Valor da Operação não pode ser maior que o Saldo Atual.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
     if DbValorCustoNovo.Canfocus then
        DbValorCustoNovo.SetFocus;
     Result := False;
     Exit;
  End;

  If DbValorCustoNovo.Value <= 0 Then
  Begin
     MsgDlg('Valor de Custo Atual não pode ser igual ou menor que zero.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
     if DbValorCustoNovo.Canfocus then
        DbValorCustoNovo.SetFocus;
     Result := False;
     Exit;
  End;

  OperComum.LimpaParametros(QryVerLiquidacaoOper);
  QryVerLiquidacaoOper.ParamByName('IDTIPOOPERACAO').AsInteger    := StrToInt(DblTipoOper.LookupValue);
  QryVerLiquidacaoOper.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
  QryVerLiquidacaoOper.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
  QryVerLiquidacaoOper.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(DblFundosInvest.LookupValue);
  QryVerLiquidacaoOper.ParamByName('DATAOPERACAO').AsString       := DateToStr(DtEdDataReferenciaGeral.DateTime);
  QryVerLiquidacaoOper.ParamByName('DATALIQUIDACAO').AsString     := DateToStr(DtEdDataLiquidacao.DateTime);
  QryVerLiquidacaoOper.Open;

  If Not QryVerLiquidacaoOper.IsEmpty then
  begin
     MsgDlg('Já existe Amortização nesse dia com a mesma Data de Liquidação.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
     if DtEdDataLiquidacao.Canfocus then
        DtEdDataLiquidacao.SetFocus;
     QryVerLiquidacaoOper.Close;
     Result := False;
     Exit;
  end;

  QryVerLiquidacaoOper.Close;

  Result := True;
end;

procedure TFrmCadAmortizacaoCotas.FormCreate(Sender: TObject);
begin
  inherited;
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;      
end;

  //AL_20 
procedure TFrmCadAmortizacaoCotas.DtEdDataReferenciaGeralExit(
  Sender: TObject);
begin
  inherited;
  //AL_20
  if ((Trim(dblkTipoFundo.Text) <> '') and (Trim(DtEdDataReferenciaGeral.Text) <> '')) then
  begin
     OperComum.LimpaParametros(QryFundoInvestOperacao);
     QryFundoInvestOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     QryFundoInvestOperacao.ParamByName('DATAMOVFUNDO').AsString  := DtEdDataReferenciaGeral.Text;
     QryFundoInvestOperacao.ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundoIDTIPOFUNDOINVEST.AsInteger;
     QryFundoInvestOperacao.Open;
  end;

  QryDetalhe.Close;
  QryTotalDetalhe.Close;

  DbVlrTotCustoOrg.Text   := '0,00';
  DbVlrTotCustoAtual.Text := '0,00';
  DbQtdTotCotas.Text      := '0,00';
  DbSldTotAtual.Text      := '0,00';

  TrataTela;

end;

//AL_20 
procedure TFrmCadAmortizacaoCotas.dblkTipoFundoEnter(Sender: TObject);
begin
  inherited;
  // AL_22
  sVarAntTipo := dblkTipoFundo.LookupValue;
end;

//AL_20 
procedure TFrmCadAmortizacaoCotas.DblFundosInvestEnter(Sender: TObject);
begin
  inherited;
  // AL_22
  sVarAntFundo := DblFundosInvest.LookupValue;
end;

//AL_20 
procedure TFrmCadAmortizacaoCotas.DblTipoOperEnter(Sender: TObject);
begin
  inherited;
  // AL_22
  sVarAntOpe := DblTipoOper.LookupValue;
end;

end.
