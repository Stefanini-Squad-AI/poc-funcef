//******************************************************************************
// Data      : 12/11/2007
// Código    : AL_3
// Pendencia : 26852
// Desc      : Implementação de Outras Despesas
//******************************************************************************
// Data      : 16/03/2007
// Código    : AL_2
// Pendencia : 24774
// SOL       : 55877
// Desc      : Troca do FLGCONTABILIZA para o Especifico de Renda Fixa FLGINTCONTABRF
//******************************************************************************
// Data      : 18/07/2006
// Código    : AL_1
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 12/07/2004
// AL_1
// Motivo   : Implementaçao dos tipos de operaçao -104 Reversao de Taxa de Registro
//******************************************************************************

unit FFechaBoletaBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MontaSelect, Menus, Db, DBTables, Wwquery, Wwdatsrc,
  StdCtrls, Buttons, ComCtrls, Grids, DBGrids, Mask, DBCtrls, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker,UOperacaoInvest, TB97Ctls,
  FPreview;

type
  TFrmFechaBoletaBMF = class(TfrmSairAjuda)
    Panel1: TPanel;
    pnlCaption: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbeLote: TDBEdit;
    Panel3: TPanel;
    dbgOperacoes: TDBGrid;
    Panel6: TPanel;
    Panel4: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    PnlTotLiquido: TPanel;
    PnlTotalTaxas: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    PgCt: TPageControl;
    tbDet: TTabSheet;
    PnlDadosDespesa: TPanel;
    Label10: TLabel;
    dbeVlrDespesa: TDBEdit;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    GridDespesas: TDBGrid;
    TbConsolidado: TTabSheet;
    grdConsolidado: TDBGrid;
    TbObs: TTabSheet;
    mmoObs: TMemo;
    IvExtendedTranslator1: TIvExtendedTranslator;
    dbDtaOperacao: TCMDateTimePicker;
    dblCorretora: TwwDBLookupCombo;
    dbDataLiquidacao: TCMDateTimePicker;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    QryCorretValores: TwwQuery;
    dsCorretValores: TwwDataSource;
    ToolbarSep973: TToolbarSep97;
    QryCorretValoresIDLOTE: TStringField;
    QryCorretValoresIDCORRETVALORES: TFloatField;
    QryCorretValoresSGLCORRETVALORES: TStringField;
    QryCorretValoresDATAMOVCARTINV: TDateTimeField;
    QryCorretValoresDATAVENCOPER: TDateTimeField;
    QryCorretValoresIDINVESTIMENTO: TFloatField;
    dsConsolidado: TwwDataSource;
    QryConsolidado: TwwQuery;
    QryConsolidadoDESCTIPODESPINV: TStringField;
    QryConsolidadoVLRDESPOPER: TFloatField;
    QryDespesasOperacao: TwwQuery;
    DsDespesasOperacao: TwwDataSource;
    QryDespesasOperacaoIDDESPOPERINVEST: TFloatField;
    QryDespesasOperacaoIDFORCLI: TFloatField;
    QryDespesasOperacaoIDOPERACAOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOOPERACAO: TFloatField;
    QryDespesasOperacaoVLRDESPOPER: TFloatField;
    QryDespesasOperacaoDATAOPERACAO: TDateTimeField;
    QryDespesasOperacaoIDTIPODESPINVEST: TFloatField;
    QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField;
    QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField;
    QryDespesasOperacaoNUMDOCUMENTO: TStringField;
    QryDespesasOperacaoIDINVESTIMENTO: TFloatField;
    QryDespesasOperacaoIDCARTEIRAINVEST: TFloatField;
    QryDespesasOperacaoVLROPERACAO: TFloatField;
    QryDespesasOperacaoQTDEOPERACAO: TFloatField;
    QryDespesasOperacaoMOECODIGO: TFloatField;
    QryDespesasOperacaoIDLOTE: TStringField;
    QryDespesasOperacaoDESCTIPOOPERACAO: TStringField;
    QryDespesasOperacaoDESCINVESTIMENTO: TStringField;
    QryDespesasOperacaoNATUREZAOPERACAO: TStringField;
    QryDespesasOperacaoDESCTIPODESPINV: TStringField;
    QryConsolidadoIDTIPODESPINVEST: TFloatField;
    Label11: TLabel;
    PnlAjustePosicao: TPanel;
    Label12: TLabel;
    PnlPUAjuste: TPanel;
    QrySumDespBoleta: TwwQuery;
    QrySumDespBoletaVLRDESPOPER: TFloatField;
    QrySumAjusteNormal: TwwQuery;
    QrySumAjusteNormalVLRDESPOPER: TFloatField;
    QrySumAjustePosicao: TwwQuery;
    QrySumAjustePosicaoVLRMOVCARTINV: TFloatField;
    QryBuscaPuAjusteD0: TwwQuery;
    QryBuscaPuAjusteD0VLRAJUSTEDO: TFloatField;
    QrySumAjustePosicaoIDTIPOOPERACAO: TFloatField;
    UpdBuscaOperacoes: TUpdateSQL;
    UpdDespesasOperacao: TUpdateSQL;
    UpdHistCartInvOPE: TwwQuery;
    QryUpdOperacaoInvest: TwwQuery;
    UpdHistCartInvDOP: TwwQuery;
    btnImprimir: TBitBtn;
    lblBoletaAF: TLabel;
    Label13: TLabel;
    pnlIR: TPanel;
    Label14: TLabel;
    pnlCPMF: TPanel;
    QrySumIR: TwwQuery;
    QrySumCPMF: TwwQuery;
    QrySumCPMFVLRCPMF: TFloatField;
    QrySumIRVLRIR: TFloatField;
    UpdHistCartInvCPMF: TwwQuery;
    qryUpdDataFech: TwwQuery;
    qryFlgContabil: TwwQuery;
    qryFlgContabilFLGGERACONTAB: TFloatField;
    Label15: TLabel;
    QryUpdNumDoc: TwwQuery;
    edtNumDoc: TEdit;
    PopDespesas: TPopupMenu;
    Alterar1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure MontaQryCorretValores(dbDtaOperacao:string);
    procedure dbDtaOperacaoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblCorretoraExit(Sender: TObject);
    procedure dbgOperacoesCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure UpdateDespesas(Sender : TObject);
    procedure sbtnMovimentocaoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure BuscaFlgContab(iTipoOper:Integer);
    procedure Alterar1Click(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);

  private
    { Private declarations }
    function AtualizaDataFech(sDataFech: String): Boolean;
  public
    { Public declarations }
  end;

var
  FrmFechaBoletaBMF: TFrmFechaBoletaBMF;
  wDataAnt : TDateTime;
  wTotalAjuste,wTotalDespesa,wTotalLiquido,wTotalAjusteNormal,wIRApu,wCPMFApu : Double;
  wPUAjuste : Double;
  iEmissor : integer;
  wTipoRecDesBol:String;
  bCriaLancto: boolean;


implementation


uses UBibliotecaInvest,UMensErro,DBaseDados,UDataBase,UDiasUteisInv,dOperComum,uOperComum,
     uSistema,FTelaAut, FConsMovBMF, FDmRelatorio, UImpostos, UCaixaComum,
     FDmRelBoletaBMF,
     //AL_1
     uCtrlInvContab;

{$R *.DFM}

procedure TFrmFechaBoletaBMF.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TFrmFechaBoletaBMF.FormShow(Sender: TObject);
begin
  inherited;
   dbDtaOperacao.Text := DateToStr(DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECHBMF,-1,1,'',True,False,False));
   MontaQryCorretValores(dbDtaOperacao.Text);
   lblBoletaAF.Caption := '';
end;

procedure TFrmFechaBoletaBMF.dbDtaOperacaoExit(Sender: TObject);
begin
  inherited;
   QryCorretValores.Close;
   DmRelBoletaBMF.qryBuscaOperacoes.Close;
   QryConsolidado.Close;
   QryDespesasOperacao.Close;
   QrySumDespBoleta.Close;
   QrySumAjusteNormal.Close;
   QryBuscaPuAjusteD0.Close;
   QrySumAjustePosicao.Close;

   If Trim(dbDtaOperacao.Text) <> '' Then
      MontaQryCorretValores(dbDtaOperacao.Text);
   PnlTotalTaxas.Caption    := '';
   PnlTotLiquido.Caption    := '';
   PnlAjustePosicao.Caption := '';
   PnlPUAjuste.Caption      := '';
   PnlIR.Caption            := '';
   PnlCPMF.Caption          := '';
   lblBoletaAF.Caption      := '';
end;

procedure TFrmFechaBoletaBMF.MontaQryCorretValores(dbDtaOperacao:string);
begin
   With QryCorretValores Do
   Begin
      Close;
      ParamByName('dDataAtu').AsString := dbDtaOperacao;
      Open;
   end;
end;

procedure TFrmFechaBoletaBMF.dblCorretoraExit(Sender: TObject);
var
  wTotalAjustePosicao,wAjustePosicao:Double;
begin
  inherited;
   // Busca Dados da Corretora
   PnlTotalTaxas.Caption    := '';
   PnlTotLiquido.Caption    := '';
   PnlAjustePosicao.Caption := '';
   PnlPUAjuste.Caption      := '';
   PnlIR.Caption            := '';
   PnlCPMF.Caption          := '';
   wTotalAjustePosicao      := 0;
   PgCt.ActivePage          := TbConsolidado;

   DmRelBoletaBMF.QryBuscaOperacoes.Close;
   QryConsolidado.Close;
   QryBuscaPuAjusteD0.Close;
   QrySumDespBoleta.Close;
   QryDespesasOperacao.Close;
   QrySumAjusteNormal.Close;
   QrySumAjustePosicao.Close;
   btnImprimir.Enabled := False;

   if Trim(dblCorretora.Text) <> '' then
   begin
      with DmRelBoletaBMF.QryBuscaOperacoes do
      begin
         OperComum.LimpaParametros(DmRelBoletaBMF.QryBuscaOperacoes);
         if Trim(dblCorretora.Text) <> '' then
            ParamByName('sBOLETA').asString    := QryCorretValores.FieldByName('IDLOTE').AsString;
         ParamByName('dDataAtu').AsString := dbDtaOperacao.Text;
         Open;
         if not IsEmpty then
         begin
            First;
            btnImprimir.Enabled := True;
            // Verifica se já esta Contabilizado / Financeiro
            if DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('PLNCODIGO').IsNull then // Não Contabilizado
            begin
               bbtnConfirmar.Enabled := True;
               lblBoletaAF.Caption   := 'Boleta em Aberto';
            end
            else
            begin
               bbtnConfirmar.Enabled := False;
               lblBoletaAF.Caption   := 'Boleta Fechada';
            end;

            with QryConsolidado do
            begin
               Close;
               ParamByName('sBoleta').AsString := QryCorretValores.FieldByName('IDLOTE').AsString;
               ParamByName('dDataAtu').AsString := dbDtaOperacao.Text;
               Open;
            end;
            with QryBuscaPuAjusteD0 do
            begin
               Close;
               ParamByName('iIdInvestimento').AsInteger := DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDINVESTIMENTO').AsInteger;
               ParamByName('dDataAtu').AsString := dbDtaOperacao.Text;
               Open;
               wPUAjuste := QryBuscaPuAjusteD0.FieldByName('VLRAJUSTEDO').AsFloat;
               Close;
            end;
            with QryDespesasOperacao do
            begin
               Close;
               ParamByName('iIdOperacaoInvest').asInteger := DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDOPERACAOINVEST').AsInteger;
               Open;
            end;
            with QrySumDespBoleta do
            begin
               Close;
               ParamByName('sBOLETA').asString  := QryCorretValores.FieldByName('IDLOTE').AsString;
               ParamByName('dDataAtu').AsString := dbDtaOperacao.Text;
               Open;
               wTotalDespesa := ABS(QrySumDespBoleta.FieldByName('VLRDESPOPER').AsFloat);
               Close;
            end;
            with QrySumAjusteNormal do
            begin
               Close;
               ParamByName('sBOLETA').asString  := QryCorretValores.FieldByName('IDLOTE').AsString;
               ParamByName('dDataAtu').AsString := dbDtaOperacao.Text;
               Open;
               wTotalAjusteNormal := QrySumAjusteNormal.FieldByName('VLRDESPOPER').AsFloat;
               Close;
            end;
            with QrySumAjustePosicao do
            begin
               Close;
               ParamByName('sBOLETA').asString  := QryCorretValores.FieldByName('IDLOTE').AsString;
               ParamByName('dDataAtu').AsString := dbDtaOperacao.Text;
               Open;
               while not EOF do
               begin
                  wAjustePosicao := QrySumAjustePosicao.FieldByName('VLRMOVCARTINV').AsFloat;
                  if QrySumAjustePosicao.FieldByName('IDTIPOOPERACAO').AsInteger = -11 then  // Ajuste Negativo
                      wAjustePosicao :=  wAjustePosicao * -1;

                  wTotalAjustePosicao := wTotalAjustePosicao +  wAjustePosicao;
                  Next;
               end;
               Close;
            end;
            // Calcula Ajuste
            wTotalAjuste := wTotalAjustePosicao + wTotalAjusteNormal;
            // Calcula Resultado Liquido
            wTotalLiquido := wTotalAjuste - wTotalDespesa;
            // Altera Descricao do Total
            if (wTotalLiquido < 0) then
               Label6.Caption :='Líquido a Pagar'
            else
               Label6.Caption :='Líquido a Receber';
            // IR
            with QrySumIR do
            begin
               Close;
               ParamByName('sBOLETA').asString  := QryCorretValores.FieldByName('IDLOTE').AsString;
               ParamByName('dDataAtu').AsString := dbDtaOperacao.Text;
               Open;
               wIRApu := QrySumIR.FieldByName('VLRIR').AsFloat;
               Close;
            end;
            // CPMF
            with QrySumCPMF do
            begin
               Close;
               ParamByName('sBOLETA').asString  := QryCorretValores.FieldByName('IDLOTE').AsString;
               ParamByName('dDataAtu').AsString := dbDtaOperacao.Text;
               Open;
               wCPMFApu := QrySumCPMF.FieldByName('VLRCPMF').AsFloat;
               Close;
            end;
            // Preenche componntes com os Resultados
            PnlTotalTaxas.Caption    := FormatFloat('###,###,##0.00',wTotalDespesa)+' ';
            PnlTotLiquido.Caption    := FormatFloat('###,###,##0.00',Abs(wTotalLiquido))+' ';
            PnlAjustePosicao.Caption := FormatFloat('###,###,##0.00',Abs(wTotalAjuste))+' ';
            PnlPUAjuste.Caption      := FormatFloat('###,###,##0',Abs(wPUAjuste))+' ';
            PnlIR.Caption := FormatFloat('###,###,##0.00',wIRApu)+' ';
            PnlCPMF.Caption := FormatFloat('###,###,##0.00',wCPMFApu)+' ';
         end;
      end;
   end;
end;

procedure TFrmFechaBoletaBMF.dbgOperacoesCellClick(Column: TColumn);
begin
  inherited;
   with QryDespesasOperacao do
   begin
      Close;
      ParamByName('iIdOperacaoInvest').asInteger := DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDOPERACAOINVEST').AsInteger;
      Open;
   end;
end;

procedure TFrmFechaBoletaBMF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   QryCorretValores.Close;
   DmRelBoletaBMF.qryBuscaOperacoes.Close;
   QryConsolidado.Close;
   QryDespesasOperacao.Close;
   QrySumAjusteNormal.Close;
   QrySumAjustePosicao.Close;
   QrySumDespBoleta.Close;
   QryBuscaPuAjusteD0.Close;
   qryFlgContabil.Close;
end;

procedure TFrmFechaBoletaBMF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TFrmFechaBoletaBMF.bbtnConfirmarClick(Sender: TObject);
var
   fTotalVlrContratos,fQtdContratos,fQtdContratosDia : Double;
   wPlanilha,wPlano,wDocumento,iCarteira,iCarteiraGerenc,iForCli,iTipoOperacao : integer;
   wMensErro,sHistorico : string;
   fSaldoCaixa          : Currency;
   bReversao : boolean;
begin
  inherited;
   Screen.Cursor := crHourGlass;

   //AL_1
   if not CtrlInvContab.TestaPeriodo(dbDtaOperacao.Text, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
      Exit;
   end;

   bCriaLancto := False;
   dbDataLiquidacao.Text := FormatDateTime('DD/MM/YYYY', dbDataLiquidacao.Date);
   if DmRelBoletaBMF.dsBuscaOperacoes.State in [dsInsert, dsEdit] then
   begin
      DmRelBoletaBMF.qryBuscaOperacoes.ApplyUpdates;
      DmRelBoletaBMF.qryBuscaOperacoes.CommitUpdates;
   end;
   if dsDespesasOperacao.State in [dsInsert, dsEdit] then
   begin
      QryDespesasOperacao.ApplyUpdates;
      QryDespesasOperacao.CommitUpdates;
   end;

   // Inicia processo de Contabilizacao / Financeiro
   Try
      if not DtmBaseDados.dbBaseDados.InTransaction then
         DtmBaseDados.dbBaseDados.StartTransaction;

      // Soma os valores dos contratos (Registro dos Contratos)
      with DmRelBoletaBMF.qryBuscaOperacoes do
      begin
         DisableControls;
         First;
         fTotalVlrContratos := 0;                                              

         fQtdContratos := 0;
         fQtdContratosDia := 0;
         bReversao := False;
         while not EOF do
         begin
            //AL_1
            if ((DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger > 0)     or
                (DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger = -102)  or
                (DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger = -103)) then // Operacao de Compra ou Venda ou Reversao
            begin
               fQtdContratos := fQtdContratos + ABS(DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('QTDEMOVINVCART').AsFloat);
               fTotalVlrContratos := fTotalVlrContratos + ABS(DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('VLRMOVCARTINV').AsFloat);
               fQtdContratosDia := fQtdContratosDia + ABS(DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('QTDEMOVINVCART').AsFloat);
            end;
            //AL_1
            if ((DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger = -102)  or
                (DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger = -103)) then // Operacao de Reversao
               bReversao := True;
            Next;
         end;
         EnableControls;
      end;
      wPlanilha := -1;
      wPlano    := -1;
      wDocumento:= -1;
      iCarteira := DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDCARTEIRAINVEST').AsInteger;
      iCarteiraGerenc := DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDCARTEIRAGERENC').AsInteger;
      iForCli := qryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;

      //VOLTAR
      // Contabiliza Atualizacao Contratos
      if wTotalAjuste <> 0 then // Contabiliza
      begin
         //VOLTAR
         if wTotalAjuste > 0 then // Atualizacao Positiva de Contratos BM&F
         begin
            iTipoOperacao := -20;
            BuscaFlgContab(iTipoOperacao);
         end
         else
         begin
            iTipoOperacao := -65;   // Atualizacao Negativa de Contratos BM&F
            BuscaFlgContab(iTipoOperacao);
         end;
         wTipoRecDesBol := '';
         //AL_2
         if pRPI.FLGINTCONTABBMF <> 'N' then
         begin
            if (qryFlgContabilFLGGERACONTAB.AsInteger = 1) then //and (pRPI.FLGCONTABILIZA = 'S') then
            begin
               OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,8,-1,iTipoOperacao,-1,
                                       iForCli,iCarteira,pRPI.MOECODIGO, 'IBOVE','',dbeLote.Text,'','',
                                       wTipoRecDesBol,bCriaLancto, 0,wTotalAjuste,
                                       StrToDate(dbDtaOperacao.Text),StrToDate(dbDtaOperacao.Text),
                                       wPlano, wPlanilha, wDocumento, wMensErro);
               if Trim(wMensErro) <> '' then
               begin
                  MsgDlg('Atenção: Ocorreu um erro na contabilização da operação ',
                         'Mensagem do Sistema', MtWarning, [MbOk], 0);
                  Exit;
               end;
            end;
         end;
      end;
      // Contabiliza Registro Contratos
      if wTotalAjusteNormal <> 0 then // Contabiliza pois houve operação no dia
      begin
         //AL_1
         if bReversao then
            iTipoOperacao := -104
         else
            iTipoOperacao := -21;
         BuscaFlgContab(iTipoOperacao);
         wTipoRecDesBol := '';
         //AL_2
         if pRPI.FLGINTCONTABBMF <> 'N' then
         begin
            if (qryFlgContabilFLGGERACONTAB.AsInteger = 1) then //and (pRPI.FLGCONTABILIZA = 'S') then
            begin
               OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,8,-1,iTipoOperacao,-1,
                                       iForCli,iCarteira,pRPI.MOECODIGO, 'IBOVE','',dbeLote.Text,'','',
                                       wTipoRecDesBol,bCriaLancto, 0,fTotalVlrContratos,
                                       StrToDate(dbDtaOperacao.Text),StrToDate(dbDtaOperacao.Text),
                                       wPlano, wPlanilha, wDocumento, wMensErro);
               if Trim(wMensErro) <> '' then
               begin
                  MsgDlg('Atenção: Ocorreu um erro na contabilização da operação ',
                         'Mensagem do Sistema', MtWarning, [MbOk], 0);
                  Exit;
               end;
            end;
         end;
      end;

      // Contabiliza IR Apurado (se necessário, pegar o bloco no final da unit)

      // Contabiliza Variação
      if wTotalLiquido <> 0 then // Contabiliza
      begin
         bCriaLancto := True;
         if wTotalLiquido > 0 then
            iTipoOperacao := -10   // Total Líquido a Receber
         else
            iTipoOperacao := -11;  // Total Líquido a Pagar
         sHistorico := ' Ajuste : '+dbeLote.Text;
         BuscaFlgContab(iTipoOperacao);
         wTipoRecDesBol := '';
         //AL_2
         if pRPI.FLGINTCONTABBMF <> 'N' then
         begin
            if (qryFlgContabilFLGGERACONTAB.AsInteger = 1) then //and (pRPI.FLGCONTABILIZA = 'S') then
            begin
               OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,8,-1,iTipoOperacao,-1,
                                       iForCli,iCarteira,pRPI.MOECODIGO, 'IBOVE','',dbeLote.Text,sHistorico,'',
                                       wTipoRecDesBol,bCriaLancto, ABS(wTotalLiquido),ABS(wTotalAjuste){ABS(wTotalLiquido)},
                                       StrToDate(dbDtaOperacao.Text),StrToDate(dbDataLiquidacao.Text),
                                       wPlano, wPlanilha, wDocumento, wMensErro);
               if Trim(wMensErro) <> '' then
               begin
                  MsgDlg('Atenção: Ocorreu um erro na contabilização da operação ',
                         'Mensagem do Sistema', MtWarning, [MbOk], 0);
                  Exit;
               end;
            end;
         end;
         // Grava HistCaixa
         if pRPI.FLGCARTGERENC = 'S' then
         begin

            fSaldoCaixa    := CaixaComum.BuscaSaldoCaixa(StrToDate(dbDataLiquidacao.Text),
                                                         iCarteira,iCarteiraGerenc,
                                                         -1{iPlanoPrev}, 'OPE');

            if not CaixaComum.GravaEventosCaixa(StrToDate(dbDataLiquidacao.Text),
                                                -1{Plano}, iTipoOperacao,
                                                0 {Tipo de Despesa},iCarteira,iCarteiraGerenc,
                                                0, -1,
                                                sHistorico,
                                                wTotalAjuste, fSaldoCaixa) Then
            begin
               MsgDlg('Atenção: Não foi possível gravar o evento de Caixa.',
                      'Mensagem do Sistema', MtWarning, [MbOk], 0);
               Exit;
            end;
         end;

      end;
      if (wPlanilha <> -1) and (wDocumento <> -1) then
      begin
         with UpdHistCartInvOPE do
         begin
             Close;
             ParamByName('PLNCODIGO').AsInteger    := wPlanilha;
             ParamByName('CODDOCUMENTO').AsInteger := wDocumento;
             ParamByName('PLANO').AsInteger        := wPlano;
             ParamByName('sBoleta').AsString       := DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDLOTE').AsString;
             ParamByName('dDataAtu').AsString      := dbDtaOperacao.Text;
             ExecSql;
             Close;
         end;
      end;

      // Contabiliza Despesas
      if wTotalDespesa <> 0 then
      begin
         bCriaLancto := True;
         wDocumento := -1;
         wPlanilha  := -1;
         sHistorico := ' Despesas : '+dbeLote.Text;
         BuscaFlgContab(-22);
         wTipoRecDesBol := '';
         //AL_2
         if pRPI.FLGINTCONTABBMF <> 'N' then
         begin
            if (qryFlgContabilFLGGERACONTAB.AsInteger = 1) then
            begin
               OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,8,-1,-22,-1,
                                       iForCli,iCarteira,pRPI.MOECODIGO, 'IBOVE','',dbeLote.Text,sHistorico,'',
                                       wTipoRecDesBol,bCriaLancto, 0,abs(wTotalDespesa),
                                       StrToDate(dbDtaOperacao.Text),StrToDate(dbDataLiquidacao.Text),
                                       wPlano, wPlanilha,wDocumento,wMensErro);
               if Trim(wMensErro) <> '' then
               begin
                  MsgDlg('Atenção: Ocorreu um erro na contabilização da operação ',
                         'Mensagem do Sistema', MtError, [MbOk], 0);
                  Exit;
               end;
               // Update HISTCARTINV com o código da Documento das Despesas
               if (wPlanilha <> -1) and (wDocumento <> -1) then
               begin
                  with UpdHistCartInvDOP do
                  begin
                      Close;
                      ParamByName('PLNCODIGO').AsInteger    := wPlanilha;
                      ParamByName('CODDOCUMENTO').AsInteger := wDocumento;
                      ParamByName('PLANO').AsInteger        := wPlano;
                      ParamByName('sBoleta').AsString       := DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDLOTE').AsString;
                      ParamByName('dDataAtu').AsString      := dbDtaOperacao.Text;
                      ExecSql;
                      Close;
                  end;
               end;
            end;
         end;
      end;

      // Contabiliza / Financeiro CPMF Apurada
      if wCPMFApu <> 0 then
      begin
         // Busca a data de vencimento do CPMF
         dbDataLiquidacao.Text := DateToStr(Impostos.CalculaDataLiqCPMF(StrToDate(dbDtaOperacao.Text)));

         bCriaLancto := True;
         wDocumento := -1;
         sHistorico := ' CPMF s/Recompra : '+dbeLote.Text;
         BuscaFlgContab(-22);
         wTipoRecDesBol := '';
         //AL_2
         if pRPI.FLGINTCONTABBMF <> 'N' then
         begin
            if (qryFlgContabilFLGGERACONTAB.AsInteger = 1) then
            begin
               OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,8,-1,-23,-1,
                                       iForCli,iCarteira,pRPI.MOECODIGO, 'IBOVE','',dbeLote.Text,sHistorico,'',
                                       wTipoRecDesBol,bCriaLancto, 0,wCPMFApu,
                                       StrToDate(dbDtaOperacao.Text),StrToDate(dbDataLiquidacao.Text),
                                       wPlano, wPlanilha, wDocumento, wMensErro);
               if Trim(wMensErro) <> '' then
               begin
                  MsgDlg('Atenção: Ocorreu um erro na contabilização da operação ',
                         'Mensagem do Sistema', MtWarning, [MbOk], 0);
                  Exit;
               end;

               // Update HISTCARTINV com o código da Documento do CPMF
               if (wPlanilha <> -1) and (wDocumento <> -1) then
               begin
                  with UpdHistCartInvCPMF do
                  begin
                      Close;
                      ParamByName('PLNCODIGO').AsInteger    := wPlanilha;
                      ParamByName('CODDOCUMENTO').AsInteger := wDocumento;
                      ParamByName('PLANO').AsInteger        := wPlano;
                      ParamByName('sBoleta').AsString       := DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDLOTE').AsString;
                      ParamByName('dDataAtu').AsString      := dbDtaOperacao.Text;
                      ExecSql;
                      Close;
                  end;
               end;
            end;
         end;
      end;

      // Atualiza o Número do Documento
      with QryUpdNumDoc do
      begin
         Close;
         ParamByName('sBoleta').AsString       := DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDLOTE').AsString;
         ParamByName('dDataAtu').AsString      := dbDtaOperacao.Text;
         ParamByName('NUMDOCUMENTO').AsString  := edtNumDoc.Text;
         ExecSql;
         Close;
      end;

      // Atualiza o Status de Fecha Boleta na OPERACAOINVEST  = F (Fechada)
      with QryUpdOperacaoInvest do
      begin
         Close;
         ParamByName('sBoleta').AsString  := DmRelBoletaBMF.qryBuscaOperacoes.FieldByName('IDLOTE').AsString;
         ParamByName('dDataAtu').AsString := dbDtaOperacao.Text;
         ParamByName('pFLGSTATUSFECHBOL').AsString  := 'F';
         ExecSql;
         Close;
      end;

      AtualizaDataFech(dbDtaOperacao.Text);

      MsgDlg('Processamento concluído.','Mensagem do Sistema ',mtInformation,[mbOK],0);

      dtmBaseDados.dbBaseDados.Commit;
      
      bbtnConfirmar.Enabled := False;
      lblBoletaAF.Caption   := 'Boleta Fechada';
   except
      on E: Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu problema ao confirma a Boleta ...',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         Exit;
      end;
   end;
end;

procedure TFrmFechaBoletaBMF.UpdateDespesas(Sender : TObject);
begin
   Try
      QryDespesasOperacao.ApplyUpdates;
      QryDespesasOperacao.CommitUpdates;
      dblCorretoraExit(Sender);
    Except
      Raise;
    End;
end;

procedure TFrmFechaBoletaBMF.sbtnMovimentocaoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmConsMovBMF, TfrmConsMovBMF, False);
end;

procedure TFrmFechaBoletaBMF.btnImprimirClick(Sender: TObject);
var fTaxaOper,fTaxaBolsa,fTaxaRegistro : Double;
begin
   fTaxaOper     := 0;
   fTaxaBolsa    := 0;
   fTaxaRegistro := 0;
  inherited;
   DmRelBoletaBMF.qryBuscaOperacoes.DisableControls;
   qryConsolidado.DisableControls;
   QryConsolidado.First;
   while not QryConsolidado.EOF do
   begin
      if (QryConsolidado.FieldByName('IDTIPODESPINVEST').AsInteger = -14) or
         (QryConsolidado.FieldByName('IDTIPODESPINVEST').AsInteger = -18) then        // TAXA OPERACIONAL  OU DE LIQUIDAÇÃO
         fTaxaOper := QryConsolidado.FieldByName('VLRDESPOPER').AsFloat
      else if QryConsolidado.FieldByName('IDTIPODESPINVEST').AsInteger = -16 then   // TAXA DA BOLSA
         fTaxaBolsa := QryConsolidado.FieldByName('VLRDESPOPER').AsFloat
      else if QryConsolidado.FieldByName('IDTIPODESPINVEST').AsInteger = -17  then // TAXA DE REGISTRO
         fTaxaRegistro := QryConsolidado.FieldByName('VLRDESPOPER').AsFloat;
      QryConsolidado.Next;
   end;
   QryConsolidado.First;

   DmRelBoletaBMF.pplVlrNegocios.Caption   := 'R$ ' + FormatFloat('###,###,###,###,##0.00',wTotalAjuste);
   DmRelBoletaBMF.pplAjustePosicao.Caption := 'R$ ' + FormatFloat('###,###,###,###,##0.00',wTotalAjuste);
   DmRelBoletaBMF.pplVlrLiqNota.Caption    := 'R$ ' + FormatFloat('###,###,###,###,##0.00',wTotalLiquido);
   DmRelBoletaBMF.pplPUAjuste.Caption      := 'R$ ' + FormatFloat('###,###,###,###,##0.00',wPUAjuste);

   DmRelBoletaBMF.pplTxOper.Caption        := 'R$ ' + FormatFloat('###,###,###,###,##0.00',fTaxaOper);
   DmRelBoletaBMF.pplTxReg.Caption         := 'R$ ' + FormatFloat('###,###,###,###,##0.00',fTaxaRegistro);
   DmRelBoletaBMF.pplTxBolsa.Caption       := 'R$ ' + FormatFloat('###,###,###,###,##0.00',fTaxaBolsa);
   DmRelBoletaBMF.pplTtDesp.Caption        := 'R$ ' + FormatFloat('###,###,###,###,##0.00',wTotalDespesa);
   DmRelBoletaBMF.pplDtOper.Caption        := DatetoStr(dbDtaOperacao.Date);
   DmRelBoletaBMF.pplDtLiquid.Caption      := DatetoStr(dbDataLiquidacao.Date);
   DmRelBoletaBMF.pplNumDocumento.Caption  := edtNumDoc.Text;

   DmRelBoletaBMF.qryBuscaOperacoes.EnableControls;
   qryConsolidado.EnableControls;

   TfrmPreview.CreateModalPreview(Application,
                                  DmRelBoletaBMF.RpBoletaBMF,
                                  DmRelBoletaBMF.RpBoletaBMF.PrinterSetup.DocumentName);
end;

function TFrmFechaBoletaBMF.AtualizaDataFech(sDataFech: String): Boolean;
begin
   Result := True;
   try
      with qryUpdDataFech do
      begin
         Close;
         ParamByName('DATAULTFECHBMF').AsString := sDataFech;
         ExecSql;
         Close;
         OperacaoInvest.RetParamInvest1(pRPI, 'BaseDados');
      end;
   except
      Result := False;
   end;
end;

procedure TFrmFechaBoletaBMF.BuscaFlgContab(iTipoOper:Integer);
begin
   OperComum.LimpaParametros(qryFlgContabil);
   with qryFlgContabil do
   begin
      ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOper;
      Open;
   end;
end;

procedure TFrmFechaBoletaBMF.Alterar1Click(Sender: TObject);
begin
  inherited;
   GridDespesas.Visible    := False;
   PnlDadosDespesa.Visible := True;
   QryDespesasOperacao.Edit;
   if bbtnOkDet.CanFocus then
      bbtnOkDet.SetFocus;
end;

procedure TFrmFechaBoletaBMF.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
   UpdateDespesas(Sender);
   //AL_1
   PnlDadosDespesa.Visible := False;
   GridDespesas.Visible    := True;
end;

procedure TFrmFechaBoletaBMF.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
   QryDespesasOperacao.Cancel;
   QryDespesasOperacao.CancelUpdates;
   PnlDadosDespesa.Visible := False;
   GridDespesas.Visible    := True;
end;

end.
