//******************************************************************************
// Data      : 12/11/2007
// Código    : AL_3
// Pendencia : 26852
// Desc      : Implementação de Outras Despesas
//******************************************************************************
// Data      : 18/07/2006
// Código    : AL_2
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 12/07/2004
// AL_1
// Motivo   : Implementaçao dos tipos de operaçao -104 Reversao de Taxa de Registro
//******************************************************************************

unit FProcOperBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery,
  FCadastro,  Grids, Wwdbigrd, Wwdbgrid,DBCtrls, Mask, cmseldlg,wwidlg, Wwdatsrc,
  URegra, BDE, wwdbdatetimepicker, CMDateTimePicker,UOperacaoInvest,
  FOkCancelarInv, fcLabel;

type
  TfrmProcOperBMF = class(TfrmOkCancelarInv)
    edDataRef: TCMDateTimePicker;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    QryVerOrdAutorizadas: TwwQuery;
    QryBuscaOrdem: TwwQuery;
    QryInvestimento: TwwQuery;
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
    QryInvestimentoIDMOEDACONTAB: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    QryInvestimentoIDEMISSOR: TFloatField;
    QryTipoOper: TwwQuery;
    QryTipoOperIDTIPOINVEST: TFloatField;
    QryTipoOperIDTIPOOPERACAO: TFloatField;
    QryTipoOperIDMERCADO: TFloatField;
    QryTipoOperDESCTIPOOPERACAO: TStringField;
    QryTipoOperTIPOCUSTODIA: TStringField;
    QryTipoOperVENCIMENTO: TFloatField;
    QryTipoOperTIPCREDOR: TStringField;
    QryTipoOperNATUREZAOPERACAO: TStringField;
    QryTipoOperFLGTRANSF: TStringField;
    QryTipoOperFLGCORRET: TStringField;
    QryTipoOperFLGORDMOVINV: TStringField;
    QryTipoOperFLGTRATAIR: TStringField;
    QryBuscaOrdemIDORDMOVINV: TFloatField;
    QryInsertOperInvest: TwwQuery;
    QryAux: TwwQuery;
    QryBuscaBoletas: TwwQuery;
    QryBuscaBoletasDATAOPERACAO: TDateTimeField;
    qryBuscaOperacoes: TwwQuery;
    QryDespesasOperacao: TwwQuery;
    QryDespesasOperacaoIDDESPOPERINVEST: TFloatField;
    QryDespesasOperacaoEMPRESAPROP: TFloatField;
    QryDespesasOperacaoIDFORCLI: TFloatField;
    QryDespesasOperacaoIDOPERACAOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOOPERACAO: TFloatField;
    QryDespesasOperacaoVLRDESPOPER: TFloatField;
    QryDespesasOperacaoIDTIPODESPINVEST: TFloatField;
    QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField;
    QryDespesasOperacaoIDREGRACALCUSADA: TFloatField;
    QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField;
    QryDespesasOperacaoFLGCALCDIARIO: TFloatField;
    QryDespesasOperacaoDATAOPERACAO: TDateTimeField;
    QryBoleta: TwwQuery;
    QryBoletaIDBOLETA: TStringField;
    dsBuscaOrdem: TDataSource;
    updBuscaOrdem: TUpdateSQL;
    QryVerOrdAutorizadasIDORDMOVINV: TFloatField;
    QryDespInvest: TwwQuery;
    QryDespInvestIDTIPODESPINVEST: TFloatField;
    QryDespInvestDESCTIPODESPINV: TStringField;
    QryBuscaBoletasIDINVESTIMENTO: TFloatField;
    qryBuscaOperacoesIDOPERACAOINVEST: TFloatField;
    qryBuscaOperacoesIDCUSTODIANTE: TFloatField;
    qryBuscaOperacoesIDCORRETVALORES: TFloatField;
    qryBuscaOperacoesMOECODIGO: TFloatField;
    qryBuscaOperacoesIDMODULO: TFloatField;
    qryBuscaOperacoesEMPRESAPROP: TFloatField;
    qryBuscaOperacoesIDCARTEIRAINVEST: TFloatField;
    qryBuscaOperacoesIDINVESTIMENTO: TFloatField;
    qryBuscaOperacoesIDTIPOINVEST: TFloatField;
    qryBuscaOperacoesIDTIPOOPERACAO: TFloatField;
    qryBuscaOperacoesIDINSTFIN: TFloatField;
    qryBuscaOperacoesDATAOPERACAO: TDateTimeField;
    qryBuscaOperacoesNUMDOCUMENTO: TStringField;
    qryBuscaOperacoesQTDEOPERACAO: TFloatField;
    qryBuscaOperacoesPRECOUNITOPERACAO: TFloatField;
    qryBuscaOperacoesVLROPERACAO: TFloatField;
    qryBuscaOperacoesDATAVENCOPER: TDateTimeField;
    qryBuscaOperacoesIDFORCLI: TFloatField;
    qryBuscaOperacoesIDORDMOVINV: TFloatField;
    qryBuscaOperacoesIDLOTE: TStringField;
    qryBuscaOperacoesFLGSTATUSFECHBOL: TStringField;
    qryBuscaOperacoesFLGSTATUSORDMOV: TStringField;
    qryBuscaOperacoesDESCINVESTIMENTO: TStringField;
    qryBuscaOperacoesDESCTIPOOPERACAO: TStringField;
    qryBuscaOperacoesVENCIMENTO: TFloatField;
    qryBuscaOperacoesTIPCREDOR: TStringField;
    qryBuscaOperacoesNATUREZAOPERACAO: TStringField;
    qryBuscaOperacoesFLGTRATAIR: TStringField;
    qryBuscaOperacoesPESOCONTRATO: TFloatField;
    qryBuscaOperacoesVALORCONTRATO: TFloatField;
    qryBuscaOperacoesTOBN: TFloatField;
    qryBuscaOperacoesTOBD: TFloatField;
    qryBuscaOperacoesTXREGISTRO: TFloatField;
    qryBuscaOperacoesTXBOLSA: TFloatField;
    qryBuscaOperacoesTOBMINN: TFloatField;
    qryBuscaOperacoesTOBMIND: TFloatField;
    qryBuscaOperacoesVLRAJUSTED1: TFloatField;
    qryBuscaOperacoesDESCTIPOCTINVEST: TStringField;
    qryBuscaOperacoesIDTIPOCONTRINVEST: TFloatField;
    qryBuscaOperacoesDESCTPINVESTIDOR: TStringField;
    qryBuscaOperacoesDATAVIGENCIA: TDateTimeField;
    qryBuscaOperacoesPERCTOBN: TFloatField;
    qryBuscaOperacoesPERCTOBD: TFloatField;
    qryBuscaOperacoesPERCLIQ: TFloatField;
    qryBuscaOperacoesPERCTXREG: TFloatField;
    qryBuscaOperacoesPERCTXBOLSA: TFloatField;
    qryBuscaOperacoesPERCDEVN: TFloatField;
    qryBuscaOperacoesPERCDEVD: TFloatField;
    qryBuscaOperacoesDATA1: TDateTimeField;
    qryBuscaOperacoesDATA2: TDateTimeField;
    QryInsertDespInvest: TwwQuery;
    QryUpdOperacaoInvest: TwwQuery;
    QryBuscaCotacoes: TwwQuery;
    QryBuscaSaldoDiaAnt: TwwQuery;
    QryBuscaBoletasIDFORCLI: TFloatField;
    QryBuscaSaldoDiaAntQTDCOMPRADA: TFloatField;
    QryBuscaSaldoDiaAntQTDVENDIDA: TFloatField;
    QryBoletasCalculadas: TwwQuery;
    QryBoletasCalculadasNUMDOCUMENTO: TStringField;
    QryBoletasCalculadasDATAOPERACAO: TDateTimeField;
    QryBoletasCalculadasIDINVESTIMENTO: TFloatField;
    QryBoletasCalculadasFLGSTATUSFECHBOL: TStringField;
    QryBoletasCalculadasIDFORCLI: TFloatField;
    updOrdMovInv: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    DateTimeField2: TDateTimeField;
    FloatField13: TFloatField;
    StringField1: TStringField;
    FloatField14: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField15: TFloatField;
    QryDelHistcartInv: TwwQuery;
    FloatField46: TFloatField;
    FloatField47: TFloatField;
    FloatField48: TFloatField;
    FloatField49: TFloatField;
    FloatField50: TFloatField;
    FloatField51: TFloatField;
    FloatField52: TFloatField;
    FloatField53: TFloatField;
    FloatField54: TFloatField;
    DateTimeField7: TDateTimeField;
    FloatField55: TFloatField;
    FloatField56: TFloatField;
    FloatField57: TFloatField;
    DateTimeField8: TDateTimeField;
    FloatField58: TFloatField;
    StringField10: TStringField;
    FloatField59: TFloatField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField60: TFloatField;
    QryUpdOperInvest: TwwQuery;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    DateTimeField3: TDateTimeField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    DateTimeField4: TDateTimeField;
    FloatField28: TFloatField;
    StringField4: TStringField;
    FloatField29: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField30: TFloatField;
    QryPesoContrato: TwwQuery;
    QryPesoContratoPESOCONTRATO: TFloatField;
    Panel3: TPanel;
    Label10: TLabel;
    DkBtCancelaRubrica: TPanel;
    BtCancelaRubrica: TSpeedButton;
    OperacoesComSaldoDiaAnt: TwwQuery;
    OperacoesComSaldoDiaAntIDHISTCARTINV: TFloatField;
    OperacoesComSaldoDiaAntIDLOTE: TStringField;
    OperacoesComSaldoDiaAntIDINVESTIMENTO: TFloatField;
    QryBuscaPuAjuste: TwwQuery;
    QryBuscaPuAjusteVLRAJUSTE: TFloatField;
    QryPesoContratoVALORCONTRATO: TFloatField;
    OperacoesComSaldoDiaAntIDCARTEIRAINVEST: TFloatField;
    QryBuscaIdForCli: TwwQuery;
    QryBuscaIdForCliIDFORCLI: TFloatField;
    QryBuscaIdForCliIDCORRETVALORES: TFloatField;
    QryBuscaIdForCliIDCUSTODIANTE: TFloatField;
    QryBuscaIdForCliMOECODIGO: TFloatField;
    QryBuscaIdForCliNUMDOCUMENTO: TStringField;
    QryBuscaIdForCliIDCARTEIRAINVEST: TFloatField;
    QryBuscaIdOrdMovInv: TwwQuery;
    QryBuscaIdOrdMovInvIDORDMOVINV: TFloatField;
    qryBuscaOperacoesVLRAJUSTED0: TFloatField;
    QryDelOperInvest: TwwQuery;
    QrySelDespOper: TwwQuery;
    QrySelDespOperIDOPERACAOINVEST: TFloatField;
    QryDelDespOperInvest: TwwQuery;
    qryBuscaOperacoesDATAVENCIMENTO: TDateTimeField;
    qrySelAjusteDoDia: TwwQuery;
    qrySelAjusteDoDiaIDLOTE: TStringField;
    QryBuscaCotacoesVLRAJUSTEDO: TFloatField;
    QryBuscaCotacoesVLRAJUSTED1: TFloatField;
    QryBuscaCotacoesIDTIPOCONTRINVEST: TFloatField;
    QryBuscaCotacoesDATA1: TDateTimeField;
    QryBuscaCotacoesDATA2: TDateTimeField;
    QryBuscaCotacoesDESCINVESTIMENTO: TStringField;
    qryMercado: TwwQuery;
    qryMercadoIDMERCADO: TFloatField;
    qryCarteiraInvest: TwwQuery;
    qryCarteiraInvestIDPLANOPREV: TFloatField;
    qryCarteiraInvestIDPATROCINADORA: TFloatField;
    qryAcumulaAjustes: TwwQuery;
    qryAcumulaAjustesVLRAJUSTACUM: TFloatField;
    qryAcumulaAjustesVLRCPMFAPU: TFloatField;
    UpdHistCartInvCPMF: TwwQuery;
    QryBuscaBoletasDiaAnt: TwwQuery;
    BuscaCorretora: TwwQuery;
    BuscaCorretoraIDCORRETVALORES: TFloatField;
    QryInsOrdMovInv: TwwQuery;
    QryBuscaTpOperBMF: TwwQuery;
    QryBuscaOrdemVencto: TwwQuery;
    QryBuscaOrdemVenctoIDLOTE: TStringField;
    QryBuscaOrdemVenctoOBSAUTMOV: TStringField;
    QryBuscaOrdemOBSMOVINV: TStringField;
    QryBuscaBoletasDiaAntIDLOTE: TStringField;
    QryBuscaBoletasDiaAntIDINVESTIMENTO: TFloatField;
    QryBuscaBoletasDiaAntIDCARTEIRAINVEST: TFloatField;
    QryBuscaBoletasDiaAntDATAVENCIMENTO: TDateTimeField;
    QryBuscaOrdemIDCARTEIRAGERENC: TFloatField;
    qryBuscaOperacoesIDCARTEIRAGERENC: TFloatField;
    OperacoesComSaldoDiaAntIDCARTEIRAGERENC: TFloatField;
    QryBuscaOrdemIDPLANPREVCTBPATR: TFloatField;
    Label1: TLabel;
    QryBuscaBoletasIDLOTE: TStringField;
    qryUpdParamInvest: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    function LancaOperacoesVencendo:boolean;
    function LancaOperacoesBMF:boolean;
    function CalculaDespesasBMF:boolean;
    function VerificaOrdensNaoAutorizadas:boolean;
    function CalculaAjusteDoDia:Boolean;
    function BuscaPUAjuste(iIdInvestimento:integer;dDataRef:string):Double;

  public
    { Public declarations }
  end;

var
   frmProcOperBMF: TfrmProcOperBMF;
   wIdNovaOperacao,iIdForCli,iIdInvestimento,iIdCarteiraInvest,iIdDespOperInvest : Integer;
   wDataVenc,wDataAnt :TDateTime;
   fPUAjusteD0,fPUAjusteD1,fDespesaInvest,fPesoContrato,fVlrContrato : Double;
   fQtdInvestOperacao,wVlrOperacao,wVlrIR,wVlrIRProv,fVlrCPMFProv,fVlrCPMFApu : Double;
   fQtdSaldoDiaAnt,fQtdRecompra : Double;
   wPlano, wPlanilha, wDocumento,iIdHistCartInv  : integer;
   sIdLote  : String;
   bComprado : boolean;
   fVlrRendimento : Double;

implementation

{$R *.DFM}

uses UBibliotecaInvest,UMensErro,DBaseDados,UDataBase,UDiasUteisInv,
     USistema,UDocumento, UOperComum, UImpostos, UBMF,
     //AL_1
     uCtrlInvContab;

procedure TfrmProcOperBMF.FormShow(Sender: TObject);
begin
  inherited;
   edDataRef.Date := DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECHBMF,-1,1,'',True,False,False);
end;

procedure TfrmProcOperBMF.bbtnConfirmarClick(Sender: TObject);
var
   dDataAnt : TDateTime;
begin
  inherited;
   Label10.Caption := '';
   // Testa se data é valida
   if (trim(edDataRef.Text) = '') then
   begin
     MsgDlg('Preencher Data de Referência.','Erro',mtError,[mbOK],0);
     Exit;
   end;

   //AL_2
   if not CtrlInvContab.TestaPeriodo(edDataRef.Text, 8) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
      Exit;
   end;

   // 1ª Etapa : Grava na ORDMOVINV as operações que estão vencendo
   if not LancaOperacoesVencendo then
   begin
      if edDataRef.CanFocus then
         edDataRef.SetFocus;
      Label10.Caption := '';
      ProgressBar1.Position := 0;;
      Exit;
   end;
   // 2ª Etapa : Grava na OPERACAOINVEST e HISTCARTINV as operações da ORDMOVINV e
   //           altera o status da ORDMOVINV para 'L' (lançado)
   if not LancaOperacoesBMF then
   begin
      if edDataRef.CanFocus then
         edDataRef.SetFocus;
      Label10.Caption := '';
      ProgressBar1.Position := 0;;
      Exit;
   end;
   // 3ª Etapa : Calcula o Ajuste do Dia das corretoras com posição no dia anterior
   if not CalculaAjusteDoDia then
   begin
      if edDataRef.CanFocus then
         edDataRef.SetFocus;
      Label10.Caption := '';
      ProgressBar1.Position := 0;;
      Exit;
   end;
   // 4ª Etapa : Operações já lançadas ('L') -> Efetua o cálculo das despesas
   if not CalculaDespesasBMF then
   begin
      if edDataRef.CanFocus then
         edDataRef.SetFocus;
      Label10.Caption := '';
      ProgressBar1.Position := 0;;
      Exit;
   end;

   // Atualiza a data de último fechamento
   Try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      dDataAnt := DiasUteisInv.UltDiaUtilAnterior(StrToDate(edDataRef.Text),-1,1,'',True,False,False);

      qryUpdParamInvest.Close;
      qryUpdParamInvest.ParamByName('DATAULTFECHBMF').AsString := DateToStr(dDataAnt);
      qryUpdParamInvest.ExecSql;
      OperacaoInvest.RetParamInvest1(pRPI, 'BaseDados');

      DtmBaseDados.dbBaseDados.Commit;
   except
      on E: Exception do
      begin
         MsgDlg(E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         DtmBaseDados.dbBaseDados.Rollback;
         Exit;
      end;
   end;
   // Fim do processamento
   MsgDlg('Processamento concluído.','Mensagem do Sistema ',mtInformation,[mbOK],0);
   Label10.Caption := '';
   ProgressBar1.Position := 0;;
   QryAux.Close;
   QryBoleta.Close;
   QryBuscaBoletas.Close;
   QryBuscaCotacoes.Close;
   QryBuscaIdForCli.Close;
   QryBuscaIdOrdMovInv.Close;
   qryBuscaOperacoes.Close;
   QryBuscaOrdem.Close;
   QryBuscaPuAjuste.Close;
   QryBuscaSaldoDiaAnt.Close;
   QryDespesasOperacao.Close;
   QryDespInvest.Close;
   QryInvestimento.Close;
   QryPesoContrato.Close;
   qrySelAjusteDoDia.Close;
   QrySelDespOper.Close;
   QryTipoOper.Close;
   QryVerOrdAutorizadas.Close;
end;

function TfrmProcOperBMF.VerificaOrdensNaoAutorizadas : boolean;
begin
   with QryVerOrdAutorizadas do
   begin
      Close;
      ParamByName('STRDATA').AsString := edDataRef.Text;
      Open;
      Result := True;      
      if not isEmpty then
         Result := False;
   end;
end;

function TfrmProcOperBMF.LancaOperacoesBMF:boolean;
begin
   Result := True;
   // Verifica se STATMOVINV está em branco (ordem não autorizada)
   if not VerificaOrdensNaoAutorizadas then
   begin
      Result := False;
      MsgDlg('Atenção : Existem ordens de movimentação '+#13+
             'não autorizadas para esse dia !'+#13+
             'Processo interrompido !','Mensagem do Sistema ',mtWarning , [mbOk], 0);
      Exit;
   end;
   // Traz somente Ordens autorizadas para gerar Operação (STATMOVINV = 'A')
   with qryBuscaOrdem do
   begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('STRDATA').asString            := edDataRef.Text;
      ParamByName('IDPLANPREVCTBPATR').asInteger := iPlanPrevCtbPatro;
      Open;
      if qryBuscaOrdem.isEmpty then
      begin
         //Result := False;
         //MsgDlg('Não existem ordens para processamento. Processo concluído !','Mensagem do Sistema ',mtConfirmation,[mbOK],0);
         Label10.Caption := '';
         ProgressBar1.Position := 0;;
         Exit;
      end;
   end;
   // Se existem ordens então : Inicia processamento .....
   Label10.Caption  :='Aguarde Processando ...';
   while not qryBuscaOrdem.EOF do
   begin
      ProgressBar1.Max  := qryBuscaOrdem.RecordCount;
      ProgressBar1.Stepit;
      QryBuscaOrdem.Edit;
      wIdNovaOperacao := LeUltRegistro(nil,'OPERACAOINVEST');  // Gera Novo Id de Operacao
      with QryPesoContrato do
      begin
         Close;
         ParamByName('iInvestimento').asInteger := QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger;
         Open;
         if IsEmpty then
         begin
            MsgDlg( 'O Peso do Contrato não foi encontrado. ','Mensagem do Sistema ', MtError,[MbOk],0);
            Label10.Caption := '';
            ProgressBar1.Position := 0;
            Result := False;
            Exit;
         end;
      end;

      with QryInvestimento do
      begin
         Close;
         ParamByName('IDINVESTIMENTO').asInteger := QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger;
         Open;
         if IsEmpty then
         begin
            MsgDlg( 'Investimento não foi encontrado. ','Mensagem do Sistema ', MtError,[MbOk],0);
            Label10.Caption := '';
            ProgressBar1.Position := 0;
            Result := False;
            Exit;
         end;
      end;
      with QryTipoOper do
      begin
         Close;
         ParamByName('IDTIPOOPERACAO').asInteger := QryBuscaOrdem.FieldByName('IDTIPOOPERACAO').AsInteger;
         Open;
         // Verifica o Fornecedor
         if QryTipoOper.FieldByName('TIPCREDOR').AsString = 'CO' then
            iIdForCli := QryBuscaOrdem.FieldByName('IDCORRETVALORES').AsInteger
         else
            iIdForCli := OperComum.BuscaForCli(8,QryInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                               QryBuscaOrdem.FieldByName('IDTIPOOPERACAO').AsInteger,
                                               pRPI.IDTIPOCLIENTECOR);
      end;
      wDataVenc := StrToDate(edDataRef.Text) + QryTipoOper.FieldByName('VENCIMENTO').AsInteger;
      while not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) do
         wDataVenc  := wDataVenc+1;   // Achar o próximo dia útil

      wVlrOperacao := QryBuscaOrdem.FieldByName('QTDEORDENADA').AsFloat *
                      QryBuscaOrdem.FieldByName('PUORDMOVINV').AsFloat *
                      QryPesoContrato.FieldByName('PESOCONTRATO').AsFloat;
      fQtdInvestOperacao := QryBuscaOrdem.FieldByName('QTDEORDENADA').AsFloat;

      if QryTipoOper.FieldByName('NATUREZAOPERACAO').AsString = 'D' then // Venda
      begin
         wVlrOperacao := wVlrOperacao * -1;
         fQtdInvestOperacao := fQtdInvestOperacao * -1;
      end;

      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      try
         // Inclui Dados na Tabela de Operacao, OPERACAOINVEST
         with QryInsertOperInvest do
         begin
            Close;
            ParamByName('IDOPERACAOINVEST').AsInteger  := wIdNovaOperacao;
            ParamByName('IDCORRETVALORES').AsInteger   := QryBuscaOrdem.FieldByName('IDCORRETVALORES').AsInteger;
            ParamByName('MOECODIGO').AsInteger         := QryInvestimento.FieldByName('IDMOEDACONTAB').AsInteger;
            ParamByName('IDMODULO').AsInteger          := Sistema.IdModulo;
            ParamByName('EMPRESAPROP').AsInteger       := Sistema.IdEmpresa;
            ParamByName('IDINVESTIMENTO').AsInteger    := QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger;
            ParamByName('IDCARTEIRAINVEST').AsInteger  := QryBuscaOrdem.FieldByName('IDCARTEIRAINVEST').AsInteger;
            ParamByName('IDTIPOINVEST').AsInteger      := 8;
            ParamByName('IDTIPOOPERACAO').AsInteger    := QryBuscaOrdem.FieldByName('IDTIPOOPERACAO').AsInteger;
            ParamByName('DATAOPERACAO').AsDateTime     := StrToDate(edDataRef.Text);
            ParamByName('NUMDOCUMENTO').AsString       := QryBuscaOrdem.FieldByName('NUMDOCMOVINV').AsString;
            ParamByName('QTDEOPERACAO').AsFloat        := QryBuscaOrdem.FieldByName('QTDEORDENADA').AsFloat;
            ParamByName('PRECOUNITOPERACAO').AsFloat   := QryBuscaOrdem.FieldByName('PUORDMOVINV').AsFloat;
            ParamByName('VLROPERACAO').AsFloat         := wVlrOperacao;
            ParamByName('DATAVENCOPER').AsDateTime     := wDataVenc;
            ParamByName('IDFORCLI').AsInteger          := iIdForCli;
            ParamByName('IDLOTE').AsString             := QryBuscaOrdem.FieldByName('IDLOTE').AsString;
            ParamByName('IDCUSTODIANTE').AsInteger     := QryBuscaOrdem.FieldByName('IDCUSTODIANTE').AsInteger;
            ParamByName('VLRIR').AsFloat               := 0;
            ParamByName('FLGSTATUSFECHBOL').AsString   := 'L';
            ParamByName('FLGSTATUSORDMOV').AsString    := 'L';
            ParamByName('IDORDMOVINV').AsInteger       := QryBuscaOrdem.FieldByName('IDORDMOVINV').AsInteger;
            ParamByName('IDPLANPREVCTBPATR').AsInteger := QryBuscaOrdem.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            ParamByName('IDCARTEIRAGERENC').AsInteger  := QryBuscaOrdem.FieldByName('IDCARTEIRAGERENC').AsInteger;
            If QryBuscaOrdem.FieldByName('IDCARTEIRAGERENC').AsInteger = 0 Then
               ParamByName('IDCARTEIRAGERENC').Clear;
            ExecSQL;
            Close;
         end;
         // Alimenta Carteira
         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,79,QryBuscaOrdem.FieldByName('IDINVESTIMENTO').AsInteger,
                                           8,wIdNovaOperacao,-1,QryBuscaOrdem.FieldByName('IDTIPOOPERACAO').AsInteger,
                                           QryBuscaOrdem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           QryBuscaOrdem.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                           -1, -1, -1, -1, -1,StrToDate(edDataRef.Text),wVlrOperacao,
                                           fQtdInvestOperacao,pRPI.VLRCOTAINICART,0 , 0, 0, 0, 0, 0, 0,0,0,
                                           QryTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                                           QryTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                           QryBuscaOrdem.FieldByName('IDLOTE').AsString,
                                           QryTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                           QryBuscaOrdem.FieldByName('DESCINVESTIMENTO').AsString,'OPE', '0', '', True,
                                           QryBuscaOrdem.FieldByName('IDCORRETVALORES').AsInteger,
                                           QryBuscaOrdem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                           iIdHistCartInv) Then
         begin
            MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            DtmBaseDados.dbBaseDados.Rollback;
            ProgressBar1.Position := 0;
            Label10.Caption  := '';
            Result := False;
            Exit;
         end;
         Label10.Caption  := 'Atualizando Saldos ...        ';
         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                   'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
            ProgressBar1.Position := 0;
            Label10.Caption  := '';
            Result := False;
            Exit;
         end;
         // Altera Status da Ordem para Lançado ('L')
         QryBuscaOrdem.FieldByName('STATMOVINV').AsString := 'L';
         QryBuscaOrdem.Post;
         QryBuscaOrdem.ApplyUpdates;
         //VOLTAR
         dtmBaseDados.dbBaseDados.Commit;
      except
         on E: Exception do
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu problema ao atualizar as operações lançadas ...'+
                   #13+E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
            ProgressBar1.Position := 0;
            Label10.Caption  := '';
            Result := False;
            Exit;
         end;
      end;
      QryBuscaOrdem.Next;
   end;
   Label10.Caption  := '';
   ProgressBar1.Position := 0;
end;

function TfrmProcOperBMF.CalculaDespesasBMF:boolean;
var
   bIdForCli,bRecompra : Boolean;
   fSaldo : Double;
   iOperacaoInvest : Integer;
begin
   Result := True;
   fQtdRecompra    := 0;
   iOperacaoInvest := 0;
   // Testa se existem Operações com Status de Boleta(L) não Fechada
   with QryBuscaBoletas do
   begin
      Close;
      ParamByName('DATAREF').AsString := edDataRef.Text;
      Open;
      if isEmpty then // Sai do processamento
      begin
         Label10.Caption := '';
         ProgressBar1.Position := 0;;
         Exit;
      end
      else // Inicia o processamento .....
      begin
         Label10.Caption  :='Calculando despesas ...';
         ProgressBar1.Max  := QryBuscaBoletas.RecordCount;
         ProgressBar1.Stepit;
         // Busca o Mercado de BM&F
         qryMercado.Close;
         qryMercado.Open;
         with qryBuscaCotacoes do
         begin
            Close;
            ParamByName('iIDINVESTIMENTO').asInteger := qryBuscaBoletas.FieldByName('IDINVESTIMENTO').AsInteger;
            ParamByName('iIDTIPOINVESTIDOR').AsInteger := pRPI.IDTIPOINVESTIDOR;
            ParamByName('dDataAtu').asString := edDataRef.Text;
            wDataAnt := StrToDate(edDataRef.Text)-1;
            while not DiasUteisInv.DiaUtil(wDataAnt,-1,1,'',True,False,False) do
               wDataAnt := wDataAnt-1;
            ParamByName('dDataAnt').asString := DateToStr(wDataAnt);
            Open;
            if IsEmpty then    // Sai do processamento
            begin
               if QryBuscaOperacoes.FieldByName('VLRAJUSTED1').IsNull then
                  MsgDlg('Falta informar os PU de Ajuste em : '+DateToStr(wDataAnt)+''+#13+
                  FieldByName('DESCINVESTIMENTO').AsString+'','Mensagem do Sistema',MtWarning,[MbOk],0);
               if QryBuscaOperacoes.FieldByName('VLRAJUSTED0').IsNull then
                  MsgDlg('Falta informar os PU de Ajuste em : '+edDataRef.Text+''+#13+
                  FieldByName('DESCINVESTIMENTO').AsString+'','Mensagem do Sistema',MtWarning,[MbOk],0);
               Result := False;
               Exit;
            end
         end;

         while not qryBuscaBoletas.EOF do
         begin
            with QryBuscaOperacoes do
            begin
               Close;
               ParamByName('sBOLETA').asString := qryBuscaBoletas.FieldByName('IDLOTE').AsString;
               ParamByName('iIDINVESTIMENTO').asInteger := qryBuscaBoletas.FieldByName('IDINVESTIMENTO').AsInteger;
               ParamByName('iIDTIPOINVESTIDOR').AsInteger := pRPI.IDTIPOINVESTIDOR;
               ParamByName('dDataAtu').asString := edDataRef.Text;
               ParamByName('dDataAnt').asString := DateToStr(wDataAnt);
               Open;
               if IsEmpty then    // Sai do processamento
               begin
                  // melhorar msg de erro
                  MsgDlg('Ocorreu um problema no cálculo das despesas','Mensagem do Sistema ',mtWarning,[mbOK],0);
                  Result := False;
                  Exit;
               end
               else
               begin
                  sIdLote           := QryBuscaOperacoes.FieldByName('IDLOTE').AsString;
                  iIdInvestimento   := QryBuscaOperacoes.FieldByName('IDINVESTIMENTO').AsInteger;
                  iIdCarteiraInvest := QryBuscaOperacoes.FieldByName('IDCARTEIRAINVEST').AsInteger;
                  fPUAjusteD0       := QryBuscaOperacoes.FieldByName('VLRAJUSTED0').AsFloat;
                  fPUAjusteD1       := QryBuscaOperacoes.FieldByName('VLRAJUSTED1').AsFloat;
                  fPesoContrato     := QryBuscaOperacoes.FieldByName('PESOCONTRATO').AsFloat;
                  fVlrContrato      := QryBuscaOperacoes.FieldByName('VALORCONTRATO').AsFloat;
                  // Busca IDPLANO e IDPATRO
                  qryCarteiraInvest.Close;
                  qryCarteiraInvest.ParamByName('IDCARTEIRAINVEST').AsInteger := iIdCarteiraInvest;
                  qryCarteiraInvest.Open;

                  with QryTipoOper do
                  begin
                     Close;
                     ParamByName('IDTIPOOPERACAO').asInteger := QryBuscaOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger;
                     Open;
                  end;
                  if not dtmBaseDados.dbBaseDados.InTransaction then
                     dtmBaseDados.dbBaseDados.StartTransaction;
                  Try
                     bIdForCli := False;
                     while not QryBuscaOperacoes.EOF do
                     begin
                        if bIdForCli = False then // Faz somente 1 vez para cada boleta
                        begin
                           iIdForCli := OperComum.BuscaForCli(8,QryBuscaOperacoes.FieldByName('IDFORCLI').AsInteger,
                                                              QryBuscaOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                              pRPI.IDTIPOCLIENTECOR);
                           bIdForCli := True;
                        end;
                        with QryDespInvest do
                        begin
                           Close;
                           if not(Prepared) then Prepare;
                           ParamByName('pIDTIPOOPERACAO').asInteger := QryBuscaOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger;
                           Open;
                        end;
                        if IsEmpty then // Sai do processamento
                        begin
                            Result := False;
                            MsgDlg('Não existem tipos de despesas cadastradas '+#13+
                                   'para o cálculo das ordens ! Processo interrompido.','Mensagem do Sistema ',mtWarning , [mbOk], 0);
                            Exit;
                        end
                        else // Inicia o processamento
                        begin
                           while not QryDespInvest.EOF do
                           begin
                              fDespesaInvest := 0;
                              case QryDespInvestIDTIPODESPINVEST.AsInteger of
                                 -14: // Taxa Operacional Basica Normal
                                 begin
                                    if StrToDate(edDataRef.Text) <> QryBuscaOperacoesDATAVENCIMENTO.AsDateTime then
                                    begin
                                       fDespesaInvest := OperComum.Trunca(
                                                         QryBuscaOperacoesVLRAJUSTED1.Value *
                                                         QryBuscaOperacoesPESOCONTRATO.AsFloat *
                                                         OperComum.DivValorZero(QryBuscaOperacoesTOBN.AsFloat,100),2);
                                       fDespesaInvest := OperComum.Trunca(
                                                         fDespesaInvest *
                                                         OperComum.DivValorZero((100 - QryBuscaOperacoesPERCDEVN.AsFloat),100),2);
                                       fDespesaInvest := fDespesaInvest *
                                                         QryBuscaOperacoesQTDEOPERACAO.AsFloat;
                                       if fDespesaInvest < QryBuscaOperacoesTOBMINN.AsFloat then
                                          fDespesaInvest := QryBuscaOperacoesTOBMINN.AsFloat;
                                    end;
                                 end;
                                 -16: // Taxa da Bolsa (BM&F)
                                 begin
                                    if StrToDate(edDataRef.Text) = QryBuscaOperacoesDATAVENCIMENTO.AsDateTime then // Data de liquidação
                                       fDespesaInvest := OperComum.Trunca(
                                                         QryBuscaOperacoesVLRAJUSTED0.Value *
                                                         QryBuscaOperacoesPESOCONTRATO.AsFloat *
                                                         OperComum.DivValorZero(QryBuscaOperacoesTOBN.AsFloat,100),2)
                                    else
                                       fDespesaInvest := OperComum.Trunca(
                                                        (qryBuscaOperacoesVLRAJUSTED1.Value *
                                                         QryBuscaOperacoesPESOCONTRATO.AsFloat *
                                                         (OperComum.DivValorZero(QryBuscaOperacoesTOBN.AsFloat,100))
                                                         ),2);
                                    fDespesaInvest := OperComum.Trunca(fDespesaInvest *
                                                      OperComum.DivValorZero(QryBuscaOperacoesPERCTXBOLSA.AsFloat,100),2);
                                    fDespesaInvest := OperComum.Trunca(fDespesaInvest *
                                                      OperComum.DivValorZero(QryBuscaOperacoesTXBOLSA.AsFloat,100),2);
                                    fDespesaInvest := fDespesaInvest * QryBuscaOperacoesQTDEOPERACAO.AsFloat;
                                 end;
                                 -17: // Taxa de Registro (BM&F)
                                 begin
                                    fDespesaInvest := OperComum.Trunca(
                                                       QryBuscaOperacoesTXREGISTRO.AsFloat *
                                                      (OperComum.DivValorZero(QryBuscaOperacoesPERCTXREG.AsFloat,100)),2);
                                    fDespesaInvest := fDespesaInvest * QryBuscaOperacoesQTDEOPERACAO.AsFloat;
                                 end;
                                 -18: // Taxa de Liquidacao (BM&F)
                                 begin
                                    if StrToDate(edDataRef.Text) = QryBuscaOperacoesDATAVENCIMENTO.AsDateTime then
                                    begin
                                       fDespesaInvest := OperComum.Trunca(
                                                         QryBuscaOperacoesVLRAJUSTED0.Value *
                                                         QryBuscaOperacoesPESOCONTRATO.AsFloat *
                                                         OperComum.DivValorZero(QryBuscaOperacoesTOBN.AsFloat,100),2);
                                       fDespesaInvest := OperComum.Trunca(
                                                         fDespesaInvest *
                                                         OperComum.DivValorZero((100 - QryBuscaOperacoesPERCDEVN.AsFloat),100),2);
                                       fDespesaInvest := fDespesaInvest *
                                                         QryBuscaOperacoesQTDEOPERACAO.AsFloat;
                                       if fDespesaInvest < QryBuscaOperacoesTOBMINN.AsFloat then
                                          fDespesaInvest := QryBuscaOperacoesTOBMINN.AsFloat;

                                    end;
                                 end;
                                 -20: // Ajuste Normal Positivo (BM&F)
                                 begin
                                    fDespesaInvest := (qryBuscaOperacoesVLRAJUSTED0.AsFloat - QryBuscaOperacoesPRECOUNITOPERACAO.AsFloat) *
                                                      QryBuscaOperacoesPESOCONTRATO.AsFloat *
                                                      QryBuscaOperacoesQTDEOPERACAO.AsFloat;
                                    if ((fDespesaInvest >= 0) and
                                        (QryBuscaOperacoes.FieldByName('NATUREZAOPERACAO').AsString = 'D')) or
                                       ((fDespesaInvest < 0) and
                                        (QryBuscaOperacoes.FieldByName('NATUREZAOPERACAO').AsString = 'A')) then
                                       fDespesaInvest := 0 // é Ajuste Negativo
                                    else  // é Ajuste Positivo
                                       fDespesaInvest := ABS(fDespesaInvest); // O vlr deve ser gravado "Positivo"
                                 end;
                                 -21: // Ajuste Normal Negativo (BM&F)
                                 begin
                                    fDespesaInvest := (qryBuscaOperacoesVLRAJUSTED0.AsFloat - QryBuscaOperacoesPRECOUNITOPERACAO.AsFloat) *
                                                       QryBuscaOperacoesPESOCONTRATO.AsFloat *
                                                       QryBuscaOperacoesQTDEOPERACAO.AsFloat;
                                    if ((fDespesaInvest >= 0) and
                                        (QryBuscaOperacoes.FieldByName('NATUREZAOPERACAO').AsString = 'A')) or
                                       ((fDespesaInvest < 0) and
                                        (QryBuscaOperacoes.FieldByName('NATUREZAOPERACAO').AsString = 'D')) then
                                       fDespesaInvest := 0 // é Ajuste Positivo
                                    else
                                       fDespesaInvest := ABS(fDespesaInvest) * -1; // O vlr deve ser gravado "Negativo"
                                 end;
                                 //AL_3
                                 -34: // Outras Despesas
                                 begin
                                    fDespesaInvest := 0;
                                 end;
                              end;
                              // Insere as Despesas na DESPOOPERINVEST
                              //AL_3
                              if (fDespesaInvest <> 0) or (QryDespInvestIDTIPODESPINVEST.AsInteger = -31)
                                  or (QryDespInvestIDTIPODESPINVEST.AsInteger = -34)then
                              begin
                                 with QryInsertDespInvest do
                                 begin
                                    Close;
                                    iIdDespOperInvest := LeUltRegistro(Nil,'DESPOPERINVEST');
                                    ParamByName('pIDDESPOPERINVEST').AsInteger  := iIdDespOperInvest;
                                    ParamByName('pIDFORCLI').AsInteger          := QryBuscaOperacoes.FieldByName('IDFORCLI').AsInteger;
                                    ParamByName('pIDOPERACAOINVEST').AsInteger  := QryBuscaOperacoes.FieldByName('IDOPERACAOINVEST').AsInteger;
                                    ParamByName('pEMPRESAPROP').AsInteger       := Sistema.IdEmpresa;
                                    ParamByName('pIDTIPOINVEST').AsInteger      := 8;
                                    ParamByName('pIDTIPOOPERACAO').AsInteger    := QryBuscaOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger;
                                    ParamByName('pVLRDESPOPER').AsFloat         := fDespesaInvest;
                                    ParamByName('pIDTIPODESPINVEST').AsInteger  := QryDespInvestIDTIPODESPINVEST.AsInteger;
                                    ParamByName('pDATAVENCDESPOPER').AsDateTime := QryBuscaOperacoes.FieldByName('DATAVENCOPER').AsDateTime;
                                    ParamByName('pFLGCALCDIARIO').AsInteger     := 1;
                                    ParamByName('pDATAOPERACAO').AsDateTime     := QryBuscaOperacoes.FieldByName('DATAOPERACAO').AsDateTime;
                                    ExecSql;
                                    Close;
                                 end;
                                 // Atualiza o Status de Fecha Boleta na OPERACAOINVEST  = P (Pendente de Fechamebnto)
                                 with QryUpdOperacaoInvest do
                                 begin
                                    Close;
                                    ParamByName('pIDOPERACAOINVEST').AsInteger := QryBuscaOperacoes.FieldByName('IDOPERACAOINVEST').AsInteger;
                                    ParamByName('pFLGSTATUSFECHBOL').AsString  := 'P';
                                    ExecSql;
                                    Close;
                                 end;
                                 if QryBuscaOperacoes.FieldByName('NATUREZAOPERACAO').AsString = 'D' then //Venda
                                    fQtdInvestOperacao := QryBuscaOperacoesQTDEOPERACAO.AsFloat * -1
                                 else
                                    fQtdInvestOperacao := QryBuscaOperacoesQTDEOPERACAO.AsFloat;
                                 // Calcula IR sobre Ajuste Normal Positivo e Negativo
                                 if (QryDespInvestIDTIPODESPINVEST.AsInteger = -20) or
                                    (QryDespInvestIDTIPODESPINVEST.AsInteger = -21) then
                                 begin
                                    Label10.Caption  :='Calculando IR ...        ';
                                    wVlrIR     := 0;
                                    wVlrIRProv := 0;
                                    fVlrRendimento := 0;
                                    wVlrIR := Impostos.CalculaIr(8,QryBuscaOperacoes.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 0{CARTEIRAGERENC},
                                                 QryBuscaOperacoes.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                 QryBuscaOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                 QryMercado.FieldByName('IDMERCADO').AsInteger,
                                                 QryBuscaOperacoes.FieldByName('IDLOTE').AsString,
                                                 StrToDate(edDataRef.Text), StrToDate(edDataRef.Text),
                                                 0,fDespesaInvest, 0, 'S',
                                                 QryTipoOper.FieldByName('FLGTRATAIR').AsString,
                                                 fVlrRendimento);
                                    // Verifica se existe provisionamento de IR
                                    if Impostos.BuscaProvisaoIR(8,QryBuscaOperacoes.FieldByName('IDINVESTIMENTO').AsInteger) then
                                       wVlrIRProv := wVlrIR * -1;
                                    // Grava o IRLITIGIO
                                    if not Impostos.GravaIrLitigio(3,StrToDate(edDataRef.Text),
                                                   QryBuscaOperacoes.FieldByName('IDOPERACAOINVEST').AsInteger,
                                                   QryDespInvest.FieldByName('DESCTIPODESPINV').AsString+' / '+
                                                     QryBuscaOperacoes.FieldByName('DESCINVESTIMENTO').AsString+'/ '+
                                                     QryBuscaOperacoes.FieldByName('IDLOTE').AsString,
                                                   QryBuscaOperacoes.FieldByName('IDINVESTIMENTO').AsInteger,
                                                   iPlanoPrevContab,
                                                   iPatrocinadora,
                                                   wVlrIR,
                                                   fVlrRendimento) then
                                       Exit;
                                 end;
                                 // Alimenta Carteira
                                 if QryBuscaOperacoes.FieldByName('NATUREZAOPERACAO').AsString <> 'N' then
                                 begin
                                    if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,iIdInvestimento,8,
                                        QryBuscaOperacoes.FieldByName('IDOPERACAOINVEST').AsInteger,-1,
                                        QryBuscaOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger,
                                        iIdCarteiraInvest, QryBuscaOperacoes.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                        iIDDESPOPERINVEST, -1,-1, -1, -1,
                                        QryBuscaOperacoes.FieldByName('DATAOPERACAO').AsDateTime,
                                        fDespesaInvest,fQtdInvestOperacao,
                                        pRPI.VLRCOTAINICART, 0, 0,wVlrIRProv,wVlrIR, 0, 0, 0, 0, 0,
                                        'E',QryBuscaOperacoes.FieldByName('NATUREZAOPERACAO').AsString,
                                        sIdLote,
                                        QryDespInvest.FieldByName('DESCTIPODESPINV').AsString+' / '+
                                          QryBuscaOperacoes.FieldByName('DESCINVESTIMENTO').AsString,
                                        'DOP','', '', True,
                                        QryBuscaOperacoes.FieldByName('IDCORRETVALORES').AsInteger,
                                        iPlanPrevCtbPatro,iIdHistCartInv) Then
                                    begin
                                       DtmBaseDados.dbBaseDados.Rollback;
                                       MsgDlg('Não foi possivel calcular o ajuste do dia.','Mensagem do Sistema ',mtWarning,[mbOK],0);
                                       Result := False;
                                       Exit;
                                    end;
                                    Label10.Caption  := 'Atualizando Saldos ...        ';
                                    if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                                    begin
                                       DtmBaseDados.dbBaseDados.Rollback;
                                       MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                                              'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
                                       ProgressBar1.Position := 0;
                                       Label10.Caption  := '';
                                       Result := False;
                                       Exit;
                                    end;
                                 end;

                              end;
                              QryDespInvest.Next;
                           end;
                        end;
                        bIdForCli := False;
                        QryBuscaOperacoes.Next;
                     end;
                     //VOLTAR
                     DtmBaseDados.dbBaseDados.Commit;
                  except
                     on E: Exception do
                     begin
                        DtmBaseDados.dbBaseDados.Rollback;
                        // Melhorar Msg de Erro
                        MsgDlg('Ocorreu problema ao atualizar as despesas das operações ...'+
                               #13+E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
                        ProgressBar1.Position := 0;
                        Label10.Caption  := '';
                        Result := False;
                        Exit;
                     end;
                  end;
               end;
               // Calcula CPMF se for Recompra ou Revenda para os Ajuste Normais
               fVlrCPMFProv := 0;
               fVlrCPMFApu :=0;
               bRecompra := False;
               with QryBuscaSaldoDiaAnt do
               begin
                  Close;
                  ParamByName('IdLote').asString          := QryBuscaOperacoes.FieldByName('IDLOTE').AsString;
                  ParamByName('IdInvestimento').asInteger := QryBuscaOperacoes.FieldByName('IDINVESTIMENTO').AsInteger;
                  ParamByName('dDataAtu').asString        := edDataRef.Text;
                  Open;
                  fSaldo := QryBuscaSaldoDiaAnt.FieldByName('QTDCOMPRADA').AsFloat -
                            QryBuscaSaldoDiaAnt.FieldByName('QTDVENDIDA').AsFloat;
                  // Verifica se existe Saldo (Posição em D-1)
                  if fSaldo <> 0 then
                  begin
                     QryBuscaOperacoes.First;
                     while not QryBuscaOperacoes.EOF do
                     begin
                        // Verifica se existe operação de Recompra ou Revenda
                        // Se Posição Comprada então NaturezaOperacao = 'A'
                        // Se a Natureza da operacao for Inversa à Posição do dia Anterior (então é uma Recompra ou Revenda)
                        bComprado := QryBuscaSaldoDiaAnt.FieldByName('QTDCOMPRADA').AsFloat >
                                     QryBuscaSaldoDiaAnt.FieldByName('QTDVENDIDA').AsFloat;
                        if ((bComprado) and (QryBuscaOperacoes.FieldByName('NATUREZAOPERACAO').AsString = 'D')) or
                           ((not bComprado) and (QryBuscaOperacoes.FieldByName('NATUREZAOPERACAO').AsString = 'A')) then
                        begin
                           bRecompra := True;
                           iOperacaoInvest := QryBuscaOperacoes.FieldByName('IDOPERACAOINVEST').AsInteger;
                           fQtdRecompra := fQtdRecompra + QryBuscaOperacoes.FieldByName('QTDEOPERACAO').AsInteger;
                        end;
                        QryBuscaOperacoes.Next;
                     end;
                     if bRecompra then // Existe operação de Recompra/Revenda

                     begin
                        with qryAcumulaAjustes do
                        begin
                           Close;
                           ParamByName('IDLOTE').AsString   := sIdLote;
                           ParamByName('dDataRef').AsString := edDataRef.Text;
                           Open;
                           if (not IsEmpty) and
                              (qryAcumulaAjustes.FieldByName('VLRAJUSTACUM').AsFloat < 0 ) then // Acumulado à Pagar
                           begin
                              fVlrCPMFProv := ABS(qryAcumulaAjustes.FieldByName('VLRAJUSTACUM').AsFloat);
                              fVlrCPMFProv := (fVlrCPMFProv * OperComum.DivValorZero(Impostos.BuscaAliquotaCPMF(edDataRef.Text),100)) -
                                               qryAcumulaAjustes.FieldByName('VLRCPMFAPU').AsFloat;
                              fVlrCPMFProv := StrToFloat(FormatFloat('##############0.00',fVlrCPMFProv));
                              fVlrCPMFApu := ((ABS(qryAcumulaAjustes.FieldByName('VLRAJUSTACUM').AsFloat) * fQtdRecompra ) / ABS(fSaldo)); // Proporcional à qtd Recomprada
                              fVlrCPMFApu := (fVlrCPMFApu * OperComum.DivValorZero(Impostos.BuscaAliquotaCPMF(edDataRef.Text),100)) -
                                              qryAcumulaAjustes.FieldByName('VLRCPMFAPU').AsFloat;
                              fVlrCPMFApu := StrToFloat(FormatFloat('##############0.00',fVlrCPMFApu));

                              // Update Histcartinv com VlrCPMFProv e VlrCPMFAtu
                              if not dtmBaseDados.dbBaseDados.InTransaction then
                                 dtmBaseDados.dbBaseDados.StartTransaction;
                              Try
                                 with UpdHistCartInvCPMF do
                                 begin
                                    Close;
                                    ParamByName('IdOperacaoInvest').asInteger := iOperacaoInvest;
                                    ParamByName('dDataRef').asString          := edDataRef.Text;
                                    ParamByName('VLRCPMFPROV').AsFloat := ABS(fVlrCPMFProv);
                                    ParamByName('VLRCPMFAPU').AsFloat  := ABS(fVlrCPMFApu);
                                    ExecSql;
                                    Close;
                                 end;
                                 DtmBaseDados.dbBaseDados.Commit;
                              except
                                 on E: Exception do
                                 begin
                                       DtmBaseDados.dbBaseDados.Rollback;
                                       // Melhorar Msg de Erro
                                       MsgDlg('Ocorreu problema ao calcular a CPMF ...'+
                                              #13+E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
                                       ProgressBar1.Position := 0;
                                       Label10.Caption  := '';
                                       Result := False;
                                       Exit;
                                 end;
                              end;
                           end;
                        end;
                     end;
                  end;
               end;
            end;
            qryBuscaBoletas.Next;
         end;
      end;
   end;
   Label10.Caption  :='';
   QryBuscaBoletas.Close;
   QryBuscaOperacoes.Close;
   QryTipoOper.Close;
   QryDespInvest.Close;
   QryMercado.Close;
   qryCarteiraInvest.Close;

end;


function TfrmProcOperBMF.CalculaAjusteDoDia:Boolean;
var
   fQtdPontosAjute,fValorAjuste,fQtdSaldoDiaAnt,fVlrAjusteD0,fVlrAjusteD1 : Double;
   fVlrAjusteAcum,fVlrCPMFApu : Double;
   iTipoOperacao : integer;
   wDataVenc : TDateTime;
begin
   Result := True;
   iTipoOperacao := 0;
   wDataAnt      := StrToDate(edDataRef.Text)-1;
   while not DiasUteisInv.DiaUtil(wDataAnt,-1,1,'',True,False,False) do
      wDataAnt := wDataAnt - 1;
   wDataVenc := StrToDate(edDataRef.Text) + 1;
   while not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) do
      wDataVenc := wDataVenc + 1;
   // Calcula Ajuste
   with OperacoesComSaldoDiaAnt do
   begin
      Close;
      ParamByName('dDataAnt').asString        := DateToStr(wDataAnt);
      Open;
      if not IsEmpty then
      begin
         // Inicia o processamento .....
         Label10.Caption  :='Calculando Ajustes ...';
         ProgressBar1.Max  := OperacoesComSaldoDiaAnt.RecordCount;
         ProgressBar1.Stepit;
      end;
      while not OperacoesComSaldoDiaAnt.EOF do
      begin
         // Verifica se já existe Ajuste do Dia calculado
         with qrySelAjusteDoDia do
         begin
            Close;
            ParamByName('IdLote').asString          := OperacoesComSaldoDiaAnt.FieldByName('IDLOTE').asString;
            ParamByName('IdInvestimento').asInteger := OperacoesComSaldoDiaAnt.FieldByName('IDINVESTIMENTO').asInteger;
            ParamByName('dDataRef').asString        := edDataRef.Text;
            Open;
            //if not IsEmpty then  // Não recalcula os Ajustes do Dia
            //   OperacoesComSaldoDiaAnt.Next
            //else
            if IsEmpty then  // Somente calcula se não houver Ajustes do Dia Lançados
            begin
               fQtdPontosAjute := 0;
               // Busca o saldo do dia anterior
               with QryBuscaSaldoDiaAnt do
               begin
                  Close;
                  ParamByName('IdLote').asString          := OperacoesComSaldoDiaAnt.FieldByName('IDLOTE').asString;
                  ParamByName('IdInvestimento').asInteger := OperacoesComSaldoDiaAnt.FieldByName('IDINVESTIMENTO').asInteger;
                  ParamByName('dDataAtu').asString        := edDataRef.Text;
                  Open;
                  if not IsEmpty then
                  begin
                     fVlrAjusteD0 := BuscaPUAjuste(OperacoesComSaldoDiaAnt.FieldByName('IDINVESTIMENTO').asInteger,edDataRef.Text);
                     fVlrAjusteD1 := BuscaPUAjuste(OperacoesComSaldoDiaAnt.FieldByName('IDINVESTIMENTO').asInteger,DateToStr(wDataAnt));
                     if (fVlrAjusteD0 = 0) or (fVlrAjusteD1 = 0) then
                     begin
                        if (fVlrAjusteD0 = 0)  then
                           MsgDlg('Falta informar os PU de Ajuste em : '+edDataRef.Text+'','Mensagem do Sistema',MtWarning,[MbOk],0);
                        if (fVlrAjusteD1 = 0) then
                           MsgDlg('Falta informar os PU de Ajuste em : '+DateToStr(wDataAnt)+'','Mensagem do Sistema',MtWarning,[MbOk],0);
                        ProgressBar1.Position := 0;
                        Label10.Caption  := '';
                        Result := False;
                        Exit;
                     end;
                     fQtdSaldoDiaAnt := ABS(QryBuscaSaldoDiaAnt.FieldByName('QTDCOMPRADA').AsFloat -
                                            QryBuscaSaldoDiaAnt.FieldByName('QTDVENDIDA').AsFloat);

                     if fQtdSaldoDiaAnt <> 0 then // Se possui posição
                     begin
                        fQtdPontosAjute := fVlrAjusteD0 - fVlrAjusteD1;

                        with QryPesoContrato do
                        begin
                           Close;
                           ParamByName('iInvestimento').asInteger := OperacoesComSaldoDiaAnt.FieldByName('IDINVESTIMENTO').asInteger;
                           Open;
                           if IsEmpty then
                           begin
                              MsgDlg( 'O Peso do Contrato não foi encontrado. ','Mensagem do Sistema ', MtError,[MbOk],0);
                              Label10.Caption := '';
                              ProgressBar1.Position := 0;
                              Result := False;
                              Exit;
                           end;
                        end;

                        fValorAjuste := fQtdPontosAjute *
                                        QryPesoContrato.FieldByName('PESOCONTRATO').asFloat *
                                        fQtdSaldoDiaAnt *
                                        QryPesoContrato.FieldByName('VALORCONTRATO').asFloat;

                        // Se Posição Comprada
                        bComprado := QryBuscaSaldoDiaAnt.FieldByName('QTDCOMPRADA').AsFloat >
                                     QryBuscaSaldoDiaAnt.FieldByName('QTDVENDIDA').AsFloat;
                        // Monta tipo de operação conforme Posição e o Mercado
                        if ( (bComprado) and (fQtdPontosAjute >= 0 ) or              // Comprado e Mercado Subiu
                             (not bComprado) and (fQtdPontosAjute < 0 ) ) then       // Vendido  e Mercado Caiu
                        begin
                           iTipoOperacao := -10; // -> Ajuste Positivo
                           if fValorAjuste < 0 then
                              fValorAjuste := fValorAjuste * - 1;
                        end
                        else if ( (bComprado) and (fQtdPontosAjute < 0 ) or          // Comprado e Mercado Caiu
                                  (not bComprado) and (fQtdPontosAjute >= 0 ) ) then // Vendido  e Mercado Subiu
                        begin
                           iTipoOperacao := -11; // -> Ajuste Negativo
                           if fValorAjuste > 0 then
                              fValorAjuste := fValorAjuste * - 1;
                        end;
                        // Busca o Mercado de BM&F
                        qryMercado.Close;
                        qryMercado.Open;
                        // Busca IDPLANO e IDPATRO
                        qryCarteiraInvest.Close;
                        qryCarteiraInvest.ParamByName('IDCARTEIRAINVEST').AsInteger :=
                           OperacoesComSaldoDiaAnt.FieldByName('IDCARTEIRAINVEST').asInteger;
                        qryCarteiraInvest.Open;
                        // Busca TipoOperacao
                        with QryTipoOper do
                        begin
                           Close;
                           ParamByName('IDTIPOOPERACAO').asInteger := iTipoOperacao;
                           Open;
                        end;
                        // Busca o IDFORCLI
                        with QryBuscaIdForCli do
                        begin
                           Close;
                           ParamByName('sIdLote').asString := OperacoesComSaldoDiaAnt.FieldByName('IDLOTE').asString;
                           Open;
                        end;
                        // Busca o IDORDMOVINV
                        with QryBuscaIdOrdMovInv do
                        begin
                           Close;
                           ParamByName('sIdLote').asString  := OperacoesComSaldoDiaAnt.FieldByName('IDLOTE').asString;
                           ParamByName('dDataRef').asString := edDataRef.Text;
                           Open;
                        end;
                        // Grava registros
                        if not dtmBaseDados.dbBaseDados.InTransaction then
                           dtmBaseDados.dbBaseDados.StartTransaction;
                        Try
                           // Grava OperacaoInvest
                           if fValorAjuste <> 0 then
                           begin
                              with QryInsertOperInvest do
                              begin
                                 Close;
                                 wIdNovaOperacao := LeUltRegistro(nil,'OPERACAOINVEST');  // Gera Novo Id de Operacao

                                 ParamByName('IDOPERACAOINVEST').AsInteger  := wIdNovaOperacao;
                                 ParamByName('IDCORRETVALORES').AsInteger   := QryBuscaIdForCli.FieldByName('IDCORRETVALORES').AsInteger;
                                 ParamByName('MOECODIGO').AsInteger         := QryBuscaIdForCli.FieldByName('MOECODIGO').AsInteger;
                                 ParamByName('IDMODULO').AsInteger          := Sistema.IdModulo;
                                 ParamByName('EMPRESAPROP').AsInteger       := Sistema.IdEmpresa;
                                 ParamByName('IDINVESTIMENTO').AsInteger    := OperacoesComSaldoDiaAnt.FieldByName('IDINVESTIMENTO').asInteger;
                                 ParamByName('IDCARTEIRAINVEST').AsInteger  := OperacoesComSaldoDiaAnt.FieldByName('IDCARTEIRAINVEST').asInteger;
                                 ParamByName('IDTIPOINVEST').AsInteger      := 8;
                                 ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacao;
                                 ParamByName('DATAOPERACAO').AsDateTime     := StrToDate(edDataRef.Text);
                                 ParamByName('NUMDOCUMENTO').AsString       := QryBuscaIdForCli.FieldByName('NUMDOCUMENTO').AsString;
                                 ParamByName('QTDEOPERACAO').AsFloat        := fQtdSaldoDiaAnt;
                                 ParamByName('PRECOUNITOPERACAO').AsFloat   := fVlrAjusteD0;
                                 ParamByName('VLROPERACAO').AsFloat         := fValorAjuste;
                                 ParamByName('DATAVENCOPER').AsDateTime     := wDataVenc;
                                 ParamByName('IDFORCLI').AsInteger          := QryBuscaIdForCli.FieldByName('IDFORCLI').AsInteger;
                                 ParamByName('IDLOTE').AsString             := OperacoesComSaldoDiaAnt.FieldByName('IDLOTE').asString;
                                 ParamByName('IDCUSTODIANTE').AsInteger     := QryBuscaIdForCli.FieldByName('IDCUSTODIANTE').AsInteger;
                                 ParamByName('VLRIR').AsFloat               := 0;
                                 ParamByName('FLGSTATUSFECHBOL').AsString   := 'P';
                                 ParamByName('FLGSTATUSORDMOV').AsString    := 'P';
                                 ParamByName('IDORDMOVINV').AsInteger       := QryBuscaIdOrdMovInv.FieldByName('IDORDMOVINV').AsInteger;;
                                 ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
                                 ExecSQL;
                                 Close;
                              end;
                              // Calcula IR sobre Ajuste Normal
                              Label10.Caption  :='Calculando IR ...        ';
                              wVlrIR     := 0;
                              wVlrIRProv := 0;
                              fVlrRendimento := 0;
                              wVlrIR := Impostos.CalculaIr(8,OperacoesComSaldoDiaAnt.FieldByName('IDINVESTIMENTO').asInteger,
                                           0{IDCARTEIRAGERENC},
                                           OperacoesComSaldoDiaAnt.FieldByName('IDCARTEIRAINVEST').asInteger,
                                           QryTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                           QryMercado.FieldByName('IDMERCADO').AsInteger,
                                           OperacoesComSaldoDiaAnt.FieldByName('IDLOTE').asString,
                                           StrToDate(edDataRef.Text), StrToDate(edDataRef.Text),
                                           0,fValorAjuste, 0, 'S',
                                           QryTipoOper.FieldByName('FLGTRATAIR').AsString,
                                           fVlrRendimento);
                              // Verifica se existe provisionamento de IR
                              if Impostos.BuscaProvisaoIR(8,OperacoesComSaldoDiaAnt.FieldByName('IDINVESTIMENTO').asInteger) then
                                 wVlrIRProv := wVlrIR * -1;
                              // Grava o IRLITIGIO
                              if not Impostos.GravaIrLitigio(3,StrToDate(edDataRef.Text),wIdNovaOperacao,
                                             QryTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                               QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString+'/ '+
                                               OperacoesComSaldoDiaAnt.FieldByName('IDLOTE').asString,
                                             OperacoesComSaldoDiaAnt.FieldByName('IDINVESTIMENTO').asInteger,
                                             iPlanoPrevContab,
                                             iPatrocinadora,
                                             wVlrIR,
                                             fVlrRendimento) then
                                 Exit;
                              // Calcula Provisao CPMF para os Ajustes de Posicao
                              fVlrCPMFProv := 0;
                              with qryAcumulaAjustes do
                              begin
                                 Close;
                                 ParamByName('IDLOTE').AsString   := OperacoesComSaldoDiaAnt.FieldByName('IDLOTE').asString;
                                 ParamByName('dDataRef').AsString := edDataRef.Text;
                                 Open;
                                 fVlrAjusteAcum := qryAcumulaAjustes.FieldByName('VLRAJUSTACUM').AsFloat;
                                 fVlrCPMFApu    := qryAcumulaAjustes.FieldByName('VLRCPMFAPU').AsFloat;
                                 if (not IsEmpty) and
                                    ((fVlrAjusteAcum + fValorAjuste) < 0) then  // Acumulado à Pagar
                                 begin
                                    fVlrCPMFProv := (fVlrAjusteAcum + fValorAjuste);
                                    fVlrCPMFProv := (fVlrCPMFProv * OperComum.DivValorZero(Impostos.BuscaAliquotaCPMF(edDataRef.Text),100));
                                    fVlrCPMFProv := (fVlrCPMFProv - fVlrCPMFApu)- 0.0049;
                                    fVlrCPMFProv := StrToFloat(FormatFloat('##############0.00',fVlrCPMFProv));
                                 end;
                              end;
                              // Alimenta Carteira
                              if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,79,
                                                                OperacoesComSaldoDiaAnt.FieldByName('IDINVESTIMENTO').asInteger,
                                                                8,wIdNovaOperacao,-1,iTipoOperacao,
                                                                OperacoesComSaldoDiaAnt.FieldByName('IDCARTEIRAINVEST').asInteger,
                                                                OperacoesComSaldoDiaAnt.FieldByName('IDCARTEIRAGERENC').asInteger,
                                                                -1, -1, -1, -1, -1,StrToDate(edDataRef.Text),ABS(fValorAjuste),
                                                                fQtdSaldoDiaAnt,pRPI.VLRCOTAINICART,0 , 0, wVlrIRProv,wVlrIR, 0, 0, 0,
                                                                ABS(fVlrCPMFProv),0,
                                                                QryTipoOper.FieldByName('NATUREZAOPERACAO').AsString,
                                                                QryTipoOper.FieldByName('NATUREZAOPERACAO').AsString,
                                                                OperacoesComSaldoDiaAnt.FieldByName('IDLOTE').asString,
                                                                QryTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                                                QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString,
                                                                'OPE', '0', '', True,
                                                                QryBuscaIdForCli.FieldByName('IDCORRETVALORES').AsInteger,
                                                                iPlanPrevCtbPatro,iIdHistCartInv) Then
                              begin
                                 MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                                        'Mensagem do Sistema',MtError,[MbOk],0);
                                 DtmBaseDados.dbBaseDados.Rollback;
                                 ProgressBar1.Position := 0;
                                 Label10.Caption  := '';
                                 Result := False;
                                 Exit;
                              end;
                              Label10.Caption  := 'Atualizando Saldos ...        ';
                              if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                              begin
                                 DtmBaseDados.dbBaseDados.Rollback;
                                 MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                                        'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
                                 ProgressBar1.Position := 0;
                                 Label10.Caption  := '';
                                 Result := False;
                                 Exit;
                              end;
                           end;
                           DtmBaseDados.dbBaseDados.Commit;
                        except
                           on E: Exception do
                           begin
                              DtmBaseDados.dbBaseDados.Rollback;
                              // Melhorar Msg de Erro
                              MsgDlg('Ocorreu problema ao calcular ajustes de posição ...'+
                                     #13+E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
                              ProgressBar1.Position := 0;
                              Label10.Caption  := '';
                              Result := False;
                              Exit;
                           end;
                        end;
                     end;
                  end;
               end;
            end;
         end;
         Next;
      end;
   end;
   qryMercado.Close;
   qryCarteiraInvest.Close;
end;

function TfrmProcOperBMF.BuscaPUAjuste(iIdInvestimento:integer;dDataRef:string): Double;
begin
   Result := 0;
   with QryBuscaPuAjuste do
   begin
      Close;
      ParamByName('iIdInvestimento').asInteger := iIdInvestimento;
      ParamByName('dDataRef').asString        := dDataRef;
      Open;
      if not IsEmpty then
         Result := QryBuscaPuAjuste.FieldByName('VLRAJUSTE').asFloat;
   end;
end;

procedure TfrmProcOperBMF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

function TfrmProcOperBMF.LancaOperacoesVencendo:boolean;
var
  sNaturOper : string;
  fVlrAjusteD0 : Double;
  iTipoOperacao : Integer;
begin
   Result := True;
   Label10.Caption  :='Aguarde Processando ...';

   wDataAnt := StrToDate(edDataRef.Text)-1;
   while not DiasUteisInv.DiaUtil(wDataAnt,-1,1,'',True,False,False) do
      wDataAnt := wDataAnt-1;
   // Busca Boletas do dia anterior
   with QryBuscaBoletasDiaAnt do
   begin
      Close;
      ParamByName('dDataAnt').asString := DateToStr(wDataAnt);
      Open;
      First;
      ProgressBar1.Max  := QryBuscaBoletasDiaAnt.RecordCount;
      ProgressBar1.Stepit;
      while not QryBuscaBoletasDiaAnt.EOF do
      begin
         // Verifica se a Ordem já foi lançada
         with QryBuscaOrdemVencto do
         begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('STRDATA').asString := edDataRef.Text;
            ParamByName('IdLote').asString := QryBuscaBoletasDiaAnt.FieldByName('IDLOTE').AsString;
            Open;
         end;
         if (QryBuscaOrdemVencto.isEmpty) and  // Ainda não foi lançado e é dia de vencto
            (StrToDate(edDataRef.Text) = QryBuscaBoletasDiaAnt.FieldByName('DATAVENCIMENTO').AsDateTime) then
         begin
            // Busca a Corretora
            with BuscaCorretora do
            begin
               Close;
               ParamByName('IdLote').asString   := QryBuscaBoletasDiaAnt.FieldByName('IDLOTE').AsString;
               ParamByName('dDataRef').asString := DateToStr(wDataAnt);
               Open;
            end;
            // Verifica a Natureza Operação para gerar operação inversa
            with QryBuscaSaldoDiaAnt do
            begin
               Close;
               ParamByName('IdLote').asString          := QryBuscaBoletasDiaAnt.FieldByName('IDLOTE').AsString;
               ParamByName('IdInvestimento').asInteger := QryBuscaBoletasDiaAnt.FieldByName('IDINVESTIMENTO').AsInteger;
               ParamByName('dDataAtu').asString        := edDataRef.Text;
               Open;
               fQtdSaldoDiaAnt := ABS(QryBuscaSaldoDiaAnt.FieldByName('QTDCOMPRADA').AsFloat -
                                      QryBuscaSaldoDiaAnt.FieldByName('QTDVENDIDA').AsFloat);
               if QryBuscaSaldoDiaAnt.FieldByName('QTDCOMPRADA').AsFloat >
                  QryBuscaSaldoDiaAnt.FieldByName('QTDVENDIDA').AsFloat then // Posição Comprada
               begin
                  //AL_1
                  sNaturOper := 'D';
                  iTipoOperacao := -103;
               end
               else
               begin
                  sNaturOper := 'A';
                  iTipoOperacao := -102;
               end;
            end;
            // Busca a Operação
            with QryBuscaTpOperBMF do
            begin
               Close;
               ParamByName('NATUREZAOPERACAO').AsString := sNaturOper;
               Open;
            end;
            fVlrAjusteD0 := BuscaPUAjuste(QryBuscaBoletasDiaAnt.FieldByName('IDINVESTIMENTO').asInteger,edDataRef.Text);
            if fVlrAjusteD0 = 0 then
            begin
               MsgDlg('Falta informar os PU de Ajuste em : '+edDataRef.Text+'','Mensagem do Sistema',MtWarning,[MbOk],0);
               Result := False;
               Exit;
            end;
            // Grava ORDMOVINV
            if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;
            try
               with QryInsOrdMovInv do
               begin
                  Close;
                  ParamByName('IDORDMOVINV').AsInteger       := LeUltRegistro(nil,'OPERACAOINVEST');  // Gera Novo Id de Operacao
                  ParamByName('IDCORRETVALORES').AsInteger   := BuscaCorretora.FieldByName('IDCORRETVALORES').AsInteger;
                  ParamByName('IDTIPOINVEST').AsInteger      := 8;
                  ParamByName('IDINVESTIMENTO').AsInteger    := QryBuscaBoletasDiaAnt.FieldByName('IDINVESTIMENTO').AsInteger;
                  //AL_1
                  ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacao;//QryBuscaTpOperBMF.FieldByName('IDTIPOOPERACAO').AsInteger;
                  ParamByName('PUORDMOVINV').AsFloat         := fVlrAjusteD0;
                  ParamByName('OBSMOVINV').AsString          := 'Vencimento do Contrato';
                  ParamByName('DATAORDMOVINV').AsDateTime    := StrToDate(edDataRef.Text);
                  ParamByName('QTDEORDMOVINV').AsFloat       := 0;
                  ParamByName('NUMDOCMOVINV').AsString       := QryBuscaBoletasDiaAnt.FieldByName('IDLOTE').AsString;
                  ParamByName('STATMOVINV').AsString         := 'A';
                  ParamByName('IDUSUARIO').AsInteger         := Sistema.IdUsuario;
                  ParamByName('OBSAUTMOV').AsString          := 'Vencimento do Contrato';
                  ParamByName('IDCARTEIRAINVEST').AsInteger  := QryBuscaBoletasDiaAnt.FieldByName('IDCARTEIRAINVEST').AsInteger;
                  ParamByName('IDLOTE').AsString             := QryBuscaBoletasDiaAnt.FieldByName('IDLOTE').AsString;
                  ParamByName('QTDEORDENADA').AsFloat        := fQtdSaldoDiaAnt;
                  ParamByName('DATAAUTORIZACAO').AsDateTime  := StrToDate(edDataRef.Text);
                  ParamByName('IDBOLSAVALORES').AsInteger    := pRPI.IDBMF;
                  ParamByName('IDCUSTODIANTE').AsInteger     := pRPI.IDBMF;
                  ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
                  ExecSql;
                  Close;
               end;
               DtmBaseDados.dbBaseDados.Commit;
            except
               on E: Exception do
               begin
                  DtmBaseDados.dbBaseDados.Rollback;
                  MsgDlg('Ocorreu problema ao liquidar contratos.'+
                         #13+E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
                  ProgressBar1.Position := 0;
                  Label10.Caption  := '';
                  Result := False;
                  Exit;
               end;
            end;
            QryBuscaBoletasDiaAnt.Next;
         end
         else
            QryBuscaBoletasDiaAnt.Next;
      end;
   end;
end;

end.
