//******************************************************************************
// Data      : 11/12/2007
// Código    : AL_18
// Pendencia : 26455
// SOL       : 70155
// Desc      : Ajuste na rotina: Permitindo que a Reversão não seja contabilizado
//             pelo plano/patro passado e não logado
//******************************************************************************
// Data      : 03/10/2007
// Código    : AL_17
// Pendencia : 26504
// SOL       : 70533
// Desc      : Retirada a critica para acertar a diferença de valores no dia do vencimento
//             As revers?es antes do vencimento causaram divergência.
//******************************************************************************
// Data      : 21/09/2007
// Código    : AL_16
// Pendencia : 26357
// SOL       : 69119
// Desc      : Ajuste para: Segragação Plano / Patro
//             Ajuste na Busca Saldos: Aumento do prazo dos saldos para 120 dias
//                                     Inclusão dos campos:
//                                                    Qtd. Original (Emprestada)
//                                                    Qtd. Atual (Saldo de Qtd)
//******************************************************************************
// Data      : 26/01/2007
// Código    : AL_15
// Pendencia : 23674
// SOL       : 45954
// Desc      : Segregação de Recursos
//******************************************************************************
// Data      : 20/10/2006
// Código    : AL_14
// Pendencia : 22982
// SOL       :
// Desc      : Implementacao Plano e Patro
//******************************************************************************
// Data      : 25/09/2006
// Código    : AL_13
// Pendencia : 20453
// SOL       : 33866
// Desc      : Acerto na Trava Contábil para testar o TipoInvest=2 após o Mercado
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_12
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//*****************************************************************************
//Data	    : 26/06/2006
//Código    : Al_11
//Motivo(S) : Acerto na passagem do valor que estava dando Erro de not a Float Values
//*****************************************************************************
//Data	    : 09/03/2006
//Código    : Al_10
//Motivo(S) : Estorno Contabil de Atulização quando a Reversaõ for diferente
//            do Saldo Acumulado
//            Implementação de Rotina de Reprocessamento
//*****************************************************************************
//Data	    : 09/03/2006
//Código    : Al_9
//Pendencia : 21265
//SOL       : 39855
//Motivo(S) : Acerto no retorno do Procurar e Inclusão de Operações de
//              Empréstimo de Ações
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_8
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//******************************************************************************
// Data     : 31/10/2005
// Código   : AL_7
// Motivo   : Calcula IR somente se for fato gerador pelo Tipo de Operacao
//******************************************************************************
// Data     : 31/08/2005
// Código   : AL_6
// Motivo   : Ajuste geral no form e nas rotinas - Pendencias da Funcef
//******************************************************************************
// Data     : 29/06/2005
// Código   : AL_5
// Motivo   : Recalculo do valor qdo alterado a quantidade
//******************************************************************************
// Data     : 28/06/2005
// Código   : AL_4
// Motivo   : Implementação da critica para existência de saldo na cart. de emprestimo e
//            recalculo do valor qdo alterado a quantidade
//******************************************************************************
// Data     : 23/06/2005
// Código   : AL_3
// Motivo   : Implementação do tipo de conta para a operação de reversão
//******************************************************************************
// Data     : 17/06/2005
// Código   : AL_2
// Motivo   : Implementação do reprocesso de empréstimo
//******************************************************************************
// Data     : 24/05/2005
// Código   : AL_1
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 17/05/2004
// Origem   : Refer
// Função   : sbtnBuscaSaldosClick
// Motivo   : Liberação do campo dtVencimento para operação de Reversao
//******************************************************************************

unit FCadOperEmpRevAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, TREdit, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  DBCtrls, URegra, FPreview, uCtrlInvContab, uCtrlParamInvest, uCMMath;

type
  TTipoOper = set of (Aplicacao,Resgate,Consulta);

  TfrmCadOperEmpRevAcoes = class(TfrmCadastroCSInv)
    Label8: TLabel;
    qryTipoOperacao: TwwQuery;
    qryCustodiante: TwwQuery;
    qryInvestimento: TwwQuery;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryTipoOperacaoNATUREZAOPERACAO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryCustodianteIDCUSTODIANTE: TFloatField;
    qryCustodianteSGLCUSTODIANTE: TStringField;
    qryIDOPEREMPACOES: TFloatField;
    qryIDCUSTODIANTE: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryDATAVENCOPER: TDateTimeField;
    qryVLROPERACAO: TFloatField;
    qryQTDOPERACAO: TFloatField;
    qryPUOPERACAO: TFloatField;
    qryTAXAOPERACAO: TFloatField;
    qryVLRIR: TFloatField;
    qryFLGREVERSAO: TStringField;
    qryFLGPRECO: TStringField;
    qryIDOPEREMPACOESAP: TFloatField;
    qrySaldoCustodia: TwwQuery;
    sbtnBuscaSaldos: TToolbarButton97;
    qryAux: TwwQuery;
    QryBuscaCotacao: TwwQuery;
    QryBuscaCotacaoDATACOTAACAO: TDateTimeField;
    QryBuscaCotacaoVLRMEDIA: TFloatField;
    QryBuscaCotacaoQTDELOTE: TFloatField;
    qryVLRRESGATE: TFloatField;
    MSBuscaSaldos: TMontaSelect;
    sbtnCarteira: TToolbarButton97;
    qryTipoOperacaoFLGGERACONTAB: TFloatField;
    qryTipoOperacaoFLGGERACAPCAR: TFloatField;
    qryTipoOperacaoCODTIPDOC: TFloatField;
    Label3: TLabel;
    qryVLRJUROS: TFloatField;
    qryVLRRESGATEATU: TFloatField;
    qryTipoOperacaoVENCIMENTO: TFloatField;
    qryVALOREMPRESTIMO: TFloatField;
    sbtnImprimir: TToolbarButton97;
    qryDESCINVESTIMENTO: TStringField;
    qrySGLCUSTODIANTE: TStringField;
    qryDESCTIPOOPERACAO: TStringField;
    qryPLNCODIGO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryTIPOCONFIRMADO: TStringField;
    //Al_3
    qryTipoConta: TwwQuery;
    qryTipoContaDESCRICAO: TStringField;
    qryTipoContaIDTIPOCONTA: TFloatField;
    lblUltimoFechamento: TfcLabel;
    qryTipoOperacaoIDMERCADO: TFloatField;
    qryTipoOperacaoFLGTRATAIR: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    lblDataOper: TLabel;
    dtOperacao: TCMDateTimePicker;
    lblTipoOperacao: TLabel;
    dblcTipoOperacao: TwwDBLookupCombo;
    dblCustodiante: TwwDBLookupCombo;
    lblCustodiante: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    PnlGeral: TPanel;
    lblVencimento: TLabel;
    lblFlgPreco: TLabel;
    lblPreco: TLabel;
    lblQuantidade: TLabel;
    lblValor: TLabel;
    lblTaxa: TLabel;
    lblVlrMaxResgate: TLabel;
    lblVlrJuros: TLabel;
    lblIR: TLabel;
    lblVlrResgate: TLabel;
    lblVlrEmprestimo: TLabel;
    LblTipoConta: TLabel;
    dtVencimento: TCMDateTimePicker;
    dbcFlgPreco: TwwDBComboBox;
    dbrePreco: TDBRealEdit;
    dbreQuantidade: TDBRealEdit;
    dbreValor: TDBRealEdit;
    dbreTaxa: TDBRealEdit;
    dbreVlrMaxResgate: TDBRealEdit;
    dbreVlrJuros: TDBRealEdit;
    dbreIR: TDBRealEdit;
    dbcFlgEmpAcoes: TDBCheckBox;
    dbreVlrResgate: TDBRealEdit;
    dbreVlrEmprestimo: TDBRealEdit;
    dblTipoConta: TwwDBLookupCombo;
    PnlSaldoEmp: TPanel;
    lbPlanPrev: TLabel;
    dblkPlanPrev: TwwDBLookupCombo;
    qryPlanPrev: TwwQuery;
    qryPlanPrevIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevIDPLANOPREV: TFloatField;
    qryPlanPrevIDPATRO: TFloatField;
    qryPlanPrevPLANPRVCONTABPATRO: TStringField;
    qryIDPLANPREVCTBPATR: TFloatField;
    //Al_3 - Fim
    procedure dblcTipoOperacaoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    //AL_15
    procedure FormShow(Sender: TObject);
    //AL_15
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    //AL_15
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //AL_15
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnBuscaSaldosClick(Sender: TObject);
    procedure BuscaCotacaoEmpAcoes(dDataRef:TDateTime);
    procedure dbrePrecoExit(Sender: TObject);
    procedure dbreQuantidadeExit(Sender: TObject);
    //AL_15
    procedure dbcFlgPrecoExit(Sender: TObject);
    procedure dbreTaxaExit(Sender: TObject);
    procedure sbtnCarteiraClick(Sender: TObject);
    procedure dbreValorExit(Sender: TObject);
    //AL_15
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);
    //AL_15
    procedure dsStateChange(Sender: TObject);
    procedure dblCustodianteExit(Sender: TObject);

  private
    { Private declarations }
    //AL_15
    // AL_6
    procedure Sel(iChave: Integer);
    procedure StatusForm(tTipoOper: TTipoOper);
    //AL_15
    procedure HabilitaComponentes;
    procedure HabDesabOperReversao;
    procedure HabDesabOperEmprestimo;
    procedure CalculaValor;

    function IntegraContabCapCar: Boolean;
    function VerificaSaldoCustodia(var fSaldo:Double): Boolean;
    function VerificaCampos: boolean;

  public
    { Public declarations }
  end;

var
  frmCadOperEmpRevAcoes: TfrmCadOperEmpRevAcoes;
  fSldHist,fSldQtdHist,fSdoLiberado,fSdoBloqueado : Double;
  iPlanilha,iDocumento : integer;
  sTipoOper : TTipoOper;
  fSaldo,fSaldoJuros,fVlrIr,fVlrJuros:Double;
  //Al_3
  iTipoConta, iOperEmpAcoes, iIdHistEmpAcoes, iForCli : integer;
  sHistorico  : string;
  //AL_10
  fEstornoJuros : Double;

implementation

uses UMensErro,dBaseDados, UDataBase, USistema, UBibliotecaInvest, UOperacaoInvest,
  dOperacaoInvest,UOperComum,UDiasUteisInv, dEmprestAcoes,uEmprestAcoes,uImpostos,FTelaAut,
  FCadTransfCarteira, FDmRelBoletaEmpAcoes, URendaVariavel;

{$R *.DFM}

procedure TfrmCadOperEmpRevAcoes.dblcTipoOperacaoExit(Sender: TObject);
begin
   inherited;
   //AL_16
   if (qryTipoOperacaoIDTIPOOPERACAO.AsInteger = -52) or
      (qryTipoOperacaoIDTIPOOPERACAO.AsInteger = -10052) then // Empréstimo
      HabDesabOperEmprestimo
   else if (qryTipoOperacaoIDTIPOOPERACAO.AsInteger = -53) or
           (qryTipoOperacaoIDTIPOOPERACAO.AsInteger = -10053) then // Reversão
      HabDesabOperReversao;
end;

procedure TfrmCadOperEmpRevAcoes.HabDesabOperReversao;
begin
   lblIR.Enabled          := True;
   dbreIR.Enabled         := True;
   dbcFlgEmpAcoes.Enabled := False;
   dbreTaxa.Enabled       := False;
end;

procedure TfrmCadOperEmpRevAcoes.HabDesabOperEmprestimo;
begin
   lblIR.Enabled          := False;
   dbreIR.Enabled         := False;
   dbcFlgEmpAcoes.Enabled := True;
   dbreTaxa.Enabled       := True;
end;

//Al_3
procedure TfrmCadOperEmpRevAcoes.bbtnConfirmarClick(Sender: TObject);
var
   DataProxFech : TDateTime;
   //AL_10
   sFlgRecalc : String;
   fJurosTotal : Double;
begin
   iTipoConta   := 0;

   CmeCadastro.RepetirInsert := False;
   // AL_16
   //Al_3
   if (qryTipoOperacaoIDTIPOOPERACAO.AsInteger = -53) or
      (qryTipoOperacaoIDTIPOOPERACAO.AsInteger = -10053) then // Reversão
   begin

      If Trim(dblTipoConta.Text) = '' Then
      begin
         MsgDlg('Selecione o Tipo de Conta.','Mensagem do Sistema',mtWarning,[mbOk],0);
         if dblTipoConta.CanFocus then
            dblTipoConta.SetFocus;
         Exit;
      end
      Else
         iTipoConta := qryTipoConta.FieldByName('IDTIPOCONTA').AsInteger;

      if qryTipoConta.FieldByName('IDTIPOCONTA').AsInteger = 1 then
      begin
         qryTipoOperacao.Close;
         qryTipoOperacao.ParamByName('IDTIPOOPERACAO').AsInteger := -10053;
         qryTipoOperacao.Open;
         if qryTipoOperacao.eof then
         begin
            MsgDlg('O Tipo de Operação para a Reversão não foi cadastrada!',
                   'Mensagem do Sistema',mtWarning,[mbOk],0);
            qryTipoOperacao.Close;
            qryTipoOperacao.ParamByName('IDTIPOOPERACAO').AsInteger := qryIDTIPOOPERACAO.AsInteger;
            qryTipoOperacao.Open;
            exit;
         end;
         qryIDTIPOOPERACAO.AsInteger := -10053;
      end;

   end;
   //Al_3 - Fim

   if not VerificaCampos then
      Exit;

   PnlSaldoEmp.Caption := '';
   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

      // AL_1
      //AL_12
      if not CtrlInvContab.TestaPeriodo(qryDATAOPERACAO.AsString, 2, 5) then
         Raise Exception.Create(CtrlInvContab.MessageInfo)
      //AL_13
      else if not CtrlInvContab.TestaPeriodo(qryDATAOPERACAO.AsString, 2) then
         Raise Exception.Create(CtrlInvContab.MessageInfo);

      qryIDOPEREMPACOES.AsInteger := LeUltRegistro(nil, 'OPEREMPACOES');
      if (qryTipoOperacaoIDTIPOOPERACAO.AsInteger = -52) or
         (qryTipoOperacaoIDTIPOOPERACAO.AsInteger = -10052) then // Empréstimo
      begin
         sTipoOper   := [Aplicacao];
         fSldHist    := qryVLROPERACAO.AsFloat;
         fSldQtdHist := qryQTDOPERACAO.AsFloat;
         qryIDOPEREMPACOESAP.AsInteger := qryIDOPEREMPACOES.AsInteger;
         qryVLRIR.AsFloat    := 0;
         qryVLRJUROS.AsFloat := 0;
      end
      //Al_3
      else if ((qryTipoOperacaoIDTIPOOPERACAO.AsInteger = -53)  or
               (qryTipoOperacaoIDTIPOOPERACAO.AsInteger = -10053)) then // Reversão
      begin
         sTipoOper   := [Resgate];
         // AL_2  - Acerta o saldo financeiro final após o resgate (total)
         fSldHist    := DMEmprestAcoes.qryBuscaSaldoHistSLDHISTEMPACOES.AsFloat - qryVLRRESGATEATU.AsFloat;
         fSldQtdHist := DMEmprestAcoes.qryBuscaSaldoHistSLDQTDHISTEMPACOE.AsFloat - qryQTDOPERACAO.AsFloat;
         qryIDOPEREMPACOESAP.AsInteger := DMEmprestAcoes.qryBuscaSaldoHistIDOPEREMPACOESAP.AsInteger;
         //AL_11
         fSaldoJuros := qryVLRJUROS.AsFloat;
         //AL_10 Ini
         fEstornoJuros := 0;
         fJurosTotal := fVlrJuros;
         if fJurosTotal <> fSaldoJuros then // Estorno de Juros
            fEstornoJuros := fJurosTotal - fSaldoJuros;
         //AL_10 Fim
      end;

      //AL_16
      if qryDATAOPERACAO.AsDateTime < CtrlPInv.DataUltFechEmp then
      begin
         if MsgDlg('A data da operação é anterior ao último fechamento. Continua ?',
                   'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            Raise Exception.Create('Operação cancelada pelo usuário');

         if not EmprestAcoes.MarcaFlgReproc(qryDATAOPERACAO.AsDateTime, qryIDOPEREMPACOESAP.AsInteger, qryIDINVESTIMENTO.AsInteger, qryIDPLANPREVCTBPATR.AsInteger) then
            Raise Exception.Create('Não foi possível marcar o investimento para reprocessamento');
      end;

      qry.Post;
      qry.ApplyUpdates;
      qry.CommitUpdates;

      // Grava Histórico
      iIdHistEmpAcoes := LeUltRegistro(nil, 'HISTEMPACOES');
      // AL_2
      //AL_10
      if qryDATAOPERACAO.AsDateTime < pRPI.DATAULTFECHEMP then
         sFlgRecalc := 'S';
      //AL_10 Fim

      if not EmprestAcoes.GravaHistEmpAcoes(iIdHistEmpAcoes,
                                            qryCustodianteIDCUSTODIANTE.AsInteger,
                                            qryInvestimentoIDINVESTIMENTO.AsInteger,
                                            qryIDTIPOOPERACAO.AsInteger,
                                            qryIDOPEREMPACOES.AsInteger,
                                            qryIDOPEREMPACOESAP.AsInteger,
                                            //AL_14
                                            qryIDPLANPREVCTBPATR.AsInteger,
                                            qryDATAOPERACAO.AsDateTime,
                                            qryVLRRESGATEATU.AsFloat,
                                            fSldHist,
                                            qryQTDOPERACAO.AsFloat,
                                            fSldQtdHist,
                                            qryTipoOperacaoNATUREZAOPERACAO.AsString,
                                            //AL_10
                                            ''{sFlgRecalc}) then
         Raise Exception.Create('Não foi possível incluir o histórico desta operação.');

      // Integra Contabiliza / Financeiro
      sHistorico := qryTipoOperacaoDESCTIPOOPERACAO.AsString;
      //Al_3
      if ((qryTipoOperacaoIDTIPOOPERACAO.AsInteger = -53)  or
          (qryTipoOperacaoIDTIPOOPERACAO.AsInteger = -10053)) then // Reversão
      begin
         if not IntegraContabCapCar then
            Raise Exception.Create('Não foi possível integrar com o contábil/financeiro.');
      end;

      DtmBaseDados.dbBaseDados.Commit;
      MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema',mtConfirmation,[mbOk],0);
      Sel(-1);
   except
      on E:Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
      end;
   end;

   //AL_16 - Alterada a "coisa de genio" (A tela ia para status de Insert, mas a query fica em dsBrowse)
   StatusForm([Consulta]);
end;

function TfrmCadOperEmpRevAcoes.VerificaSaldoCustodia(var fSaldo:Double):boolean;
var
   fSaldoHist, fSaldoBloq, fSaldoLib: Double;
begin

   Result := True;

   if (Trim(dtOperacao.Text) <> '') and (Trim(dblInvestimento.Text) <> '') and
      (Trim(dblCustodiante.Text) <> '') then
   begin
      //AL_16
      EmprestAcoes.VerificaSaldoCustodia(qryDATAOPERACAO.AsDateTime,
                                         qryPlanPrevIDPLANPREVCTBPATR.AsInteger,
                                         qryInvestimentoIDINVESTIMENTO.AsInteger,
                                         qryCustodianteIDCUSTODIANTE.AsInteger,
                                         -1,
                                         fSaldoHist, fSaldoBloq, fSaldoLib, fSaldo,
                                         //AL_10
                                         qryIDTIPOOPERACAO.AsInteger);
      if sTipoOper = [Aplicacao] then
      begin
         fSaldo := fSaldoBloq - fSaldoHist;
         PnlSaldoEmp.Caption := '   Saldo para Empréstimo: ' + FormatFloat('###,###,###,##0',fSaldo);
         //Al_4
         if fSaldo <= 0 then
         begin
            MsgDlg('Não foi encontrado o saldo para o Empréstimo de Ações.','Mensagem do Sistema',mtWarning,[MbOk],0);
            bbtnCancelar.Click;
         end;
      end
      else
      //AL_15
      begin
         fSaldo := fSaldoHist;
         PnlSaldoEmp.Caption := '   Saldo para Resgate: ' + FormatFloat('###,###,###,##0',fSaldo);
      end;

   end
   else
      fSaldo := 0;
end;

function TfrmCadOperEmpRevAcoes.VerificaCampos: boolean;
begin
   Result := False;

   if (sTipoOper = [Resgate]) and (qryVLROPERACAO.AsFloat > qryVLRRESGATE.AsFloat) then
   begin
      if qryQTDOPERACAO.AsFloat = DMEmprestAcoes.qryBuscaSaldoHistSLDQTDHISTEMPACOE.AsFloat then // Resgate Total - Ajusta diferença de Arredondamento
      begin
         qryVLROPERACAO.AsFloat := qryVLRRESGATE.AsFloat;
      end;
   end;

   if Trim(dblcTipoOperacao.Text) = '' then
   begin
      MsgDlg('Tipo de operação não selecionado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblcTipoOperacao.CanFocus then
         dblcTipoOperacao.SetFocus;
      Exit;
   end;


   if (sTipoOper = [Aplicacao]) then
   begin
      //Al_4
      if VerificaSaldoCustodia(fSaldo) then
      begin
         if qryQTDOPERACAO.AsFloat > fSaldo then
         begin
            MsgDlg('O Investimento não possui saldo bloqueado em custódia para a operação.'+#13+
                   'Efetue o bloqueio na Custódia','Mensagem do Sistema',mtWarning,[MbOk],0);
            if dbreQuantidade.CanFocus then
               dbreQuantidade.SetFocus;
            Exit;
         end;
      end;
   end;

   if Trim(dblInvestimento.Text) = '' then
   begin
      MsgDlg('Investimento não selecionado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblInvestimento.CanFocus then
         dblInvestimento.SetFocus;
      Exit;
   end;
   //AL_14
   if Trim(dblkPlanPrev.Text) = '' then
   begin
      MsgDlg('Plano / Patrocinadora não selecionada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkPlanPrev.CanFocus then
         dblkPlanPrev.SetFocus;
      Exit;
   end;

   if Trim(dblCustodiante.Text) = '' then
   begin
      MsgDlg('Custodiante não selecionado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblCustodiante.CanFocus then
         dblCustodiante.SetFocus;
      Exit;
   end;

   if Trim(dbcFlgPreco.Text) = '' then
   begin
      MsgDlg('Tipo de data do preço não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbcFlgPreco.CanFocus then
         dbcFlgPreco.SetFocus;
      Exit;
   end;

   if dbreVlrMaxResgate.Value = 0 then
   begin
      MsgDlg('Valor de resgate não informado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreVlrResgate.CanFocus then
         dbreVlrResgate.SetFocus;
      Exit;
   end;

   if dbrePreco.Value = 0 then
   begin
      MsgDlg('Cotação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbrePreco.CanFocus then
         dbrePreco.SetFocus;
      Exit;
   end;

   if Trim(dtOperacao.Text) = '' then
   begin
      MsgDlg('Data da Operação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtOperacao.CanFocus then
         dtOperacao.SetFocus;
      Exit;
   end;

   if Trim(dtVencimento.Text) = '' then
   begin
      MsgDlg('Data de vencimento não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtVencimento.CanFocus then
         dtVencimento.SetFocus;
      Exit;
   end;

   if dbreQuantidade.Value = 0 then
   begin
      MsgDlg('Quantidade da operação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreQuantidade.CanFocus then
         dbreQuantidade.SetFocus;
      Exit;
   end;

   if dbreValor.Value = 0 then
   begin
      MsgDlg('Valor da operação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreValor.CanFocus then
         dbreValor.SetFocus;
      Exit;
   end;

   if dbreTaxa.Value = 0 then
   begin
      MsgDlg('Taxa da operação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreTaxa.CanFocus then
         dbreTaxa.SetFocus;
      Exit;
   end;


   if (sTipoOper = [Resgate]) and (Trim(dbreIR.Text) = '')  then
   begin
      MsgDlg('I.R. da operação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreIR.CanFocus then
         dbreIR.SetFocus;
      Exit;
   end;

   if (sTipoOper = [Aplicacao]) and (dtVencimento.Date <= dtOperacao.Date) then
   begin
      MsgDlg('Data de vencimento não pode menor ou igual à data de operação.','Mensagem do Sistema',mtWarning,[MbOk],0);
      Exit;
   end;

   Result := True;
end;

procedure TfrmCadOperEmpRevAcoes.FormShow(Sender: TObject);
begin
   inherited;
   // Monta Registro do Parâmetro
   Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');
   // AL_6
   lblUltimoFechamento.Caption := 'Último Fechamento: ' + DateToStr(pRPI.DATAULTFECHEMP);
   StatusForm([Consulta]);
   Sel(-1);
   if pRPI.FLGEMPACOES = 'N' then
   begin
      MsgDlg('As operações de empréstimo de ações, não estão autorizadas.','Mensagem do Sistema',mtWarning,[MbOk],0);
      Exit;
   end
   else
   begin
      //AL_14
      msBuscaSaldos.Filtro.Add('HISTEMPACOES.IDHISTEMPACOES IN (SELECT MAX(IDHISTEMPACOES)'+
                               '                                FROM HISTEMPACOES'+
                               '                                GROUP BY DATAHISTEMPACOES,IDOPEREMPACOESAP)');
      qryInvestimento.Open;
      qryCustodiante.Open;
      //AL_14
      qryPlanPrev.Open;
   end;
end;

procedure TfrmCadOperEmpRevAcoes.sbtnInserirClick(Sender: TObject);
var
   iTipoOper : integer;
   fVlrOper  : Currency;
   fPuOper   : Double;
   dDataOper : TDateTime;
begin
   // AL_6 - Inicio
   fVlrOper  := qryVLROPERACAO.AsFloat;
   fPuOper   := qryPUOPERACAO.AsFloat;

   inherited;
   //AL_16
   CmeCadastro.RepetirInsert := False;

   // AL_8 - Controle Trava de fechamento
   if qry.State <> dsInsert then
   begin
      sbtnInserir.Down := False;
      Exit;
   end;

   fSaldo := 0;
   sbtnInserir.Enabled := False;

   //AL_9
   if ((sTipoOper = [Resgate]) and (MSBuscaSaldos.RetornouValor)) then
   begin
      iTipoOper := -53;
      qryIDTIPOOPERACAO.AsInteger := iTipoOper;
      dDataOper                   := StrToDate(MSBuscaSaldos.ValoresChave[2]);

      qryDATAOPERACAO.AsDateTime  := dDataOper;

      //AL_16 - Ini - Não pegar o valor da operação original, mas o saldo no dia
      qryVLROPERACAO.AsFloat   := DMEmprestAcoes.qryBuscaSaldoHistSLDHISTEMPACOES.AsFloat;

      //AL_10
      qryQTDOPERACAO.AsFloat      := DMEmprestAcoes.qryBuscaSaldoHistSLDQTDHISTEMPACOE.AsFloat;
      dbreQuantidade.Text         := FormatFloat('###,###,###,##0',DMEmprestAcoes.qryBuscaSaldoHistSLDQTDHISTEMPACOE.AsFloat);

         qryPUOPERACAO.AsFloat    := OperComum.DivValorZero(DMEmprestAcoes.qryBuscaSaldoHistSLDHISTEMPACOES.AsFloat,
                                                            DMEmprestAcoes.qryBuscaSaldoHistSLDQTDHISTEMPACOE.AsFloat);
      //AL_16 - Fim

      qryVLRRESGATEATU.AsFloat    := DMEmprestAcoes.qryBuscaSaldoHistSLDHISTEMPACOES.AsFloat;

      qryDATAVENCOPER.AsDateTime  := DMEmprestAcoes.qryBuscaSaldoHistDATAVENCOPER.AsDateTime;
      qryFLGPRECO.AsString        := DMEmprestAcoes.qryBuscaSaldoHistFLGPRECO.AsString;
      qryFLGREVERSAO.AsString     := DMEmprestAcoes.qryBuscaSaldoHistFLGREVERSAO.AsString;
      qryTAXAOPERACAO.AsFloat     := DMEmprestAcoes.qryBuscaSaldoHistTAXAOPERACAO.AsFloat;
      qryVLRRESGATE.AsFloat       := DMEmprestAcoes.qryBuscaSaldoHistSLDVLRRESGATE.AsFloat;

      qryCustodiante.Locate('IDCUSTODIANTE', DMEmprestAcoes.qryBuscaSaldoHistIDCUSTODIANTE.AsInteger, []);
      dblCustodiante.Text         := qryCustodiante.FieldByName('SGLCUSTODIANTE').AsString;
      qryIDCUSTODIANTE.AsInteger  := qryCustodianteIDCUSTODIANTE.AsInteger;
      qryInvestimento.Locate('IDINVESTIMENTO', DMEmprestAcoes.qryBuscaSaldoHistIDINVESTIMENTO.AsInteger, []);
      dblInvestimento.Text        := qryInvestimento.FieldByName('DESCINVESTIMENTO').AsString;
      qryIDINVESTIMENTO.AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
      if dbreQuantidade.CanFocus then
         dbreQuantidade.SetFocus;
   end
   else
   begin
      StatusForm([Aplicacao]);
      iTipoOper   := -52;
      dDataOper   := pRPI.DATAULTFECHEMP + 1;
      while not DiasUteisInv.DiaUtil(dDataOper,-1,1,'',True,False,False) Do
        dDataOper := dDataOper + 1;   // Achar o proximo dia útil

      qryDATAOPERACAO.AsDateTime := dDataOper;
      qryFLGREVERSAO.AsString := 'N';
      //AL_15
      dblkPlanPrev.SetFocus;
   end;

   qryTIPOCONFIRMADO.AsString    := 'N';
   qryIDCARTEIRAINVEST.AsInteger := pRPI.IDCARTEMPACOES;
   qryIDTIPOINVEST.AsInteger     := 2;
   PnlSaldoEmp.Caption           := '';
   qryTipoOperacao.Close;
   qryTipoOperacao.ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOper;
   qryTipoOperacao.Open;
   dblcTipoOperacao.Text       := qryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;
   qryIDTIPOOPERACAO.AsInteger := qryTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;
   // AL_6 - Fim
end;

procedure TfrmCadOperEmpRevAcoes.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      PnlSaldoEmp.Caption := '  Saldo para Empréstimo';
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
      qryTipoOperacao.Close;
      qryTipoOperacao.ParamByName('IDTIPOOPERACAO').AsInteger := qryIDTIPOOPERACAO.AsInteger;
      qryTipoOperacao.Open;
      dblcTipoOperacao.Text := qryTipoOperacaoDESCTIPOOPERACAO.AsString;
      PnlSaldoEmp.Caption := '';

      sbtnApagar.Enabled := True;
      StatusForm([Consulta]);

      if qryTipoOperacaoNATUREZAOPERACAO.AsString = 'A' then
         sTipoOper := [Aplicacao]
      else
         sTipoOper := [Resgate];
   end;
end;

procedure TfrmCadOperEmpRevAcoes.Sel(iChave: Integer);
begin
   qry.Close;
   qry.ParamByName('IDOPEREMPACOES').AsInteger := iChave;
   qry.Open;
end;

procedure TfrmCadOperEmpRevAcoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryTipoOperacao.Close;
   qryInvestimento.Close;
   qryCustodiante.Close;
   //AL_14
   qryPlanPrev.Close;
end;

procedure TfrmCadOperEmpRevAcoes.sbtnApagarClick(Sender: TObject);
var
   sOper    : string;
   dDataAnt : TDateTime;
begin
   // AL_8 - Controle Trava de fechamento
   if RendaVariavel.VerEmAbertura then
   begin
      sbtnApagar.Down := False;
      Exit;
   end;

   // AL_6 - Inicio
   if qry.IsEmpty then
   begin
      MsgDlg('É Necessário Selecionar pelo Menos Uma Operação.',
             'Mensagem do Sistema', mtWarning, [mbOk], 0);
      sbtnApagar.Down := False;
      Exit;
   end;

   //AL_12
   if not CtrlInvContab.TestaPeriodo(qryDATAOPERACAO.AsString, 2, 5) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', mtWarning, [mbOk], 0);
      sbtnApagar.Down := False;
      Exit;
   end
   //AL_13
   else if not CtrlInvContab.TestaPeriodo(qryDATAOPERACAO.AsString, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', mtWarning, [mbOk], 0);
      sbtnApagar.Down := False;
      Exit;
   end;

   if (MsgDlg('Confirma a Exclusão ?', 'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
   begin
      sbtnApagar.Down := False;
      Exit;
   end;

   try // Finally
      Try // Except
         if not dtmBaseDados.dbBaseDados.InTransaction then
             dtmBaseDados.dbBaseDados.StartTransaction;

         if sTipoOper = [Aplicacao] then
            sOper := 'APL'
         else if sTipoOper = [Resgate] then
            sOper := 'RES';

         //AL_16
         if EmprestAcoes.VerExisteOperEmprestimo(qryDATAOPERACAO.AsDateTime, qryIDOPEREMPACOESAP.AsInteger) then
            Raise Exception.Create('Existem operações posteriores para este empréstimo');

         if not EmprestAcoes.ExcluiOperEmpAcoes(qryIDOPEREMPACOES.AsInteger,
                                                qryIDOPEREMPACOESAP.AsInteger,
                                                qryDATAOPERACAO.AsDateTime, sOper) then
            Raise Exception.Create(' ');

         // AL_2 
         // Exclui Registros posteriores
         //AL_10
         //AL_14
         if not EmprestAcoes.ExcluiHistEmpAcoes(qryIDOPEREMPACOESAP.AsInteger,
                                                qryIDPLANPREVCTBPATR.AsInteger,
                                                qryDATAOPERACAO.AsDateTime) then
            Raise Exception.Create('Existem atualizações posteriores que não puderam ser excluidas');

         //AL_10
         //AL_16
         if not EmprestAcoes.MarcaFlgReproc(qryDATAOPERACAO.AsDateTime,
                                            qryIDOPEREMPACOESAP.AsInteger,
                                            qryIDINVESTIMENTO.AsInteger,
                                            qryIDPLANPREVCTBPATR.AsInteger) then
            Raise Exception.Create('Não foi possível marcar o empréstimo para reprocessamento');


         DtmBaseDados.dbBaseDados.Commit;
         MsgDlg('Operação Concluída com Sucesso.','Mensagem do Sistema',mtInformation,[mbOk],0);
         Sel(-1);
      except
         on E:Exception do
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Não foi Possível Excluir a Operação.' + #13 +
                    E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            bbtnCancelar.Click;
         end;
      end;
   finally
      CmeCadastro.AtualizaBotoes(Self);
      sbtnApagar.Down := False;
      StatusForm([Consulta]);
   end;
   // AL_6 - Fim
end;

procedure TfrmCadOperEmpRevAcoes.sbtnBuscaSaldosClick(Sender: TObject);
Var
  fVlrResgate : Currency;
begin
   // AL_14 - Controle Trava de fechamento
   if RendaVariavel.VerEmAbertura then
      Exit;

   inherited;

   try
      msBuscaSaldos.Executar;
      if MSBuscaSaldos.RetornouValor then
      begin
         Try
            Sel(StrToInt(MSBuscaSaldos.ValoresChave[1]));

            fVlrResgate := qryVLRRESGATE.AsFloat;

            // AL_6
            StatusForm([Resgate]);

            // Busca o saldo de Empréstimos de Ações não Vencidos
            //AL_14
            //AL_12
            if not EmprestAcoes.BuscaSaldosHist(StrToDate(MSBuscaSaldos.ValoresChave[2]),
                                                qryInvestimentoIDINVESTIMENTO.AsInteger,
                                                StrToInt(MSBuscaSaldos.ValoresChave[1]),
                                                StrToInt(MSBuscaSaldos.ValoresChave[3]),
                                                //AL_14
                                                StrToInt(MSBuscaSaldos.ValoresChave[4]),
                                                fSldHist,fSldQtdHist) then
               Raise Exception.Create('Não foi encontrado o saldo do empréstimo de ações.');

            //AL_12
            if DMEmprestAcoes.qryBuscaSaldoHistSLDQTDHISTEMPACOE.AsFloat = 0 then
               Raise Exception.Create('Não foi encontrado o saldo do empréstimo de ações.');
            sbtnInserirClick(self);

            fSaldo := DMEmprestAcoes.qryBuscaSaldoHistSLDQTDHISTEMPACOE.AsFloat;


            PnlSaldoEmp.Caption := '   Saldo para Resgate : '+ FormatFloat('###,###,###,##0',fSaldo);
                fSaldoJuros := OperComum.Round(DMEmprestAcoes.qryBuscaSaldoHistSLDHISTEMPACOES.AsFloat -
                             ((DMEmprestAcoes.qryBuscaSaldoHistSLDQTDHISTEMPACOE.AsFloat /
                               DMEmprestAcoes.qryBuscaSaldoHistQTDOPERACAOAPLIC.AsFloat ) *
                               DMEmprestAcoes.qryBuscaSaldoHistVLROPERACAO.AsFloat )-0.0049,2);

            qryVLRJUROS.AsFloat := fSaldoJuros;

            QryVALOREMPRESTIMO.AsFloat := QryVLRRESGATE.AsFloat-QryVLROPERACAO.AsFloat;

            dbreQuantidadeExit(Sender);

            QryVLRRESGATE.AsFloat   := fVlrResgate;

            //AL_14
            qryIDPLANPREVCTBPATR.AsInteger := DMEmprestAcoes.qryBuscaSaldoHistIDPLANPREVCTBPATR.AsInteger;
            
         //AL_12
         except
            on E:Exception do
            begin
               MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
               bbtnCancelar.Click;
            end;
         end;
      end;
   finally
      sbtnBuscaSaldos.Down := False;
   end;
end;

procedure TfrmCadOperEmpRevAcoes.BuscaCotacaoEmpAcoes(dDataRef:TDateTime);
begin
  inherited;
   if (qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger <> 0) then
   begin
      with QryBuscaCotacao do
      begin
         Close;
         ParamByName('iIdAcao').AsInteger := qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
         ParamByName('dDataRef').AsString := DateToStr(dDataRef);
         Open;
         if not IsEmpty then
            qry.FieldByName('PUOPERACAO').AsFloat := OperComum.DivValorZero(FieldByName('VLRMEDIA').AsFloat,FieldByName('QTDELOTE').AsFloat)
         else
         begin
            qry.FieldByName('PUOPERACAO').AsFloat := 0;
            MsgDlg('Cotação não encontrada para esta data : '+DateToStr(dDataRef)+'.','Mensagem do Sistema',mtWarning,[MbOk],0)
         end;
      end;
   end;
end;

procedure TfrmCadOperEmpRevAcoes.CalculaValor;
var
   fAliquota : Double;
begin
   if ds.State in ([dsInsert]) then
   begin
      if (qry.FieldByName('PUOPERACAO').AsFloat <> 0) and
         (qry.FieldByName('QTDOPERACAO').AsFloat <> 0) then
      begin
         if sTipoOper = [Aplicacao] then
            qryVLROPERACAO.AsFloat := qry.FieldByName('PUOPERACAO').AsFloat *
                                      qry.FieldByName('QTDOPERACAO').AsFloat;

         if sTipoOper = [Resgate] then
         begin
            // Calcula Juros
            fVlrJuros := OperComum.Round(((fSaldoJuros * qryQTDOPERACAO.AsFloat) /
                                           DMEmprestAcoes.qryBuscaSaldoHistSLDQTDHISTEMPACOE.AsFloat),2);
            qryVLRJUROS.AsFloat := fVlrJuros;
            // Calcula IR

            // AL_7 - Inicio
            if qryTipoOperacaoFLGTRATAIR.AsString = 'S' then
            begin
               fAliquota := Impostos.BuscaAliquotaIR(2,-53,-1,qryDATAOPERACAO.AsDateTime);
               fVlrIr := OperComum.Round((qryVLRJUROS.AsFloat * OperComum.DivValorZero(fAliquota,100)),2);
               qryVlrIr.AsFloat := fVlrIr;
            end
            else
               qryVlrIr.AsFloat := 0;
            // AL_7 - Fim

            // Calcula o Valor do Resgate proporcional a Quantidade Resgatada
            //AL_10
            qryVLROPERACAO.AsFloat := OperComum.Round(((qryVLROPERACAO.AsFloat * qryQTDOPERACAO.AsFloat) /
                                                        DMEmprestAcoes.qryBuscaSaldoHistSLDQTDHISTEMPACOE.AsFloat) ,2);

            qryVLRRESGATEATU.AsFloat := OperComum.Round(((DMEmprestAcoes.qryBuscaSaldoHistSLDHISTEMPACOES.AsFloat *
                                                          qryQTDOPERACAO.AsFloat) /
                                                        DMEmprestAcoes.qryBuscaSaldoHistSLDQTDHISTEMPACOE.AsFloat) ,2);

            qryVLRRESGATE.AsFloat := OperComum.Round(((DMEmprestAcoes.qryBuscaSaldoHistSLDVLRRESGATE.AsFloat *
                                                       qryQTDOPERACAO.AsFloat) /
                                                       DMEmprestAcoes.qryBuscaSaldoHistQTDOPERACAOAPLIC.AsFloat) ,2);

         end;
      end;
   end;
end;

procedure TfrmCadOperEmpRevAcoes.dbrePrecoExit(Sender: TObject);
begin
  inherited;
   CalculaValor;
end;

procedure TfrmCadOperEmpRevAcoes.dbreQuantidadeExit(Sender: TObject);
begin
   inherited;
   CalculaValor;
   if (sTipoOper = [Aplicacao]) then
   begin
      //Al_4
      if qryQTDOPERACAO.AsFloat > fSaldo then
      begin
         MsgDlg('A quantidade é maior que o Saldo Liberado para Empréstimo.','Mensagem do Sistema',mtWarning,[MbOk],0);
         qryQTDOPERACAO.AsFloat := fSaldo;
         //Al_5
         CalculaValor;
      end;
   end;

   if (sTipoOper = [Resgate]) then
   begin
      if qryQTDOPERACAO.AsFloat > fSaldo then
      begin
         MsgDlg('A quantidade é maior que o Saldo de Quantidade da operação.','Mensagem do Sistema',mtWarning,[MbOk],0);
         qryQTDOPERACAO.AsFloat := fSaldo;
         //Al_5
         CalculaValor;
      end;
   end;

end;

procedure TfrmCadOperEmpRevAcoes.dbcFlgPrecoExit(Sender: TObject);
var
   dDataRef:TDateTime;
begin
  inherited;
   if ds.State in ([dsInsert, dsEdit]) then
   begin
      qryFLGPRECO.AsString := dbcFlgPreco.Value;
      if Trim(qryFLGPRECO.AsString) = '' then
         MsgDlg('Dia do Preço não definido.','Mensagem do Sistema',mtWarning,[MbOk],0)
      else
      begin
         if ((qryFLGPRECO.AsString = 'O') or (qryFLGPRECO.AsString = 'H')) then
         begin
            if (Trim(dtOperacao.Text) = '') then
               MsgDlg('Data da operação não definida.','Mensagem do Sistema',mtWarning,[MbOk],0)
            else
            begin
               dDataRef := dtOperacao.Date;
               if qryFLGPRECO.AsString = 'O' then
               begin
                  dDataRef := dDataRef - 1;
                  while not DiasUteisInv.DiaUtil(dDataRef,-1,1,'',True,False,False) Do
                     dDataRef  := dDataRef - 1;   // Achar o dia útil anterior
               end;
               BuscaCotacaoEmpAcoes(dDataRef);
            end;
         end
         else if (qryFLGPRECO.AsString = 'V') then
         begin
            if (Trim(dtVencimento.Text)= '') then
               MsgDlg('Data de Vencimento não definida.','Mensagem do Sistema',mtWarning,[MbOk],0)
            else
               BuscaCotacaoEmpAcoes(dtVencimento.Date);
         end;
      end;
   end;
end;

procedure TfrmCadOperEmpRevAcoes.dbreTaxaExit(Sender: TObject);
var
   a:string;
   Regra : TRegra;
begin

   Regra                 := TRegra.Create(Application);
   Regra.DatabaseName    := 'BaseDados';
   Regra.TipoCliente     := tcFundacao;

  inherited;
   if Trim(dtOperacao.Text) = '' then
   begin
      MsgDlg('A Data da Operação não foi informada'+#13+
             'para o cálculo do Valor de Resgate.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtOperacao.CanFocus then
         dtOperacao.SetFocus;
      Regra.Free;
      Exit;
   end
   else if Trim(dtVencimento.Text) = '' then
   begin
      MsgDlg('A Data de Vencimento não foi informada'+#13+
             'para o cálculo do Valor de Resgate.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtVencimento.CanFocus then
         dtVencimento.SetFocus;
      Regra.Free;
      Exit;
   end
   else if dbreValor.Value = 0 then
   begin
      MsgDlg('O Valor da operação não foi informado'+#13+
             'para o cálculo do Valor de Resgate.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbreValor.CanFocus then
         dbreValor.SetFocus;
      Regra.Free;
      Exit;
   end;
   begin
      // Montar SQL
      DMEmprestAcoes.qryAux.SQL.Clear;
      DMEmprestAcoes.qryAux.SQL.Add('SELECT ');
      DMEmprestAcoes.qryAux.SQL.Add(QuotedStr(FormatDateTime('dd/mm/yyyy',dtOperacao.Date))   + ' AS DATAEMISSAO,');
      DMEmprestAcoes.qryAux.SQL.Add(QuotedStr(FormatDateTime('dd/mm/yyyy',dtVencimento.Date)) + ' AS DATAATUAL,');
      DMEmprestAcoes.qryAux.SQL.Add(QuotedStr(qryTipoOperacaoNATUREZAOPERACAO.AsString)       + ' AS NATUREZAOPER,');
      DMEmprestAcoes.qryAux.SQL.Add(TrocaVirgulaPonto(FormatFloat('0.##',dbreValor.Value))    + ' AS VLRPRINCIPAL,');
      DMEmprestAcoes.qryAux.SQL.Add(TrocaVirgulaPonto(FormatFloat('0.##',dbreTaxa.Value))     + ' AS TAXA,');
      DMEmprestAcoes.qryAux.SQL.Add('1 AS IDPAIS,');
      DMEmprestAcoes.qryAux.SQL.Add('-1 AS IDCIDADES,');
      DMEmprestAcoes.qryAux.SQL.Add('-1 AS CODESTADO');
      DMEmprestAcoes.qryAux.SQL.Add('FROM DUAL');
      DMEmprestAcoes.qryAux.Open;
      if pRPI.IDREGRAEMPACOES = 0 then
      begin
         qryVLRRESGATE.AsFloat := 0;
         MsgDlg('Regra de Empréstimo de Ações não definida no Parâmetro do Sistema.','Mensagem do Sistema', MtWarning,[MbOk],0);
         Regra.Free;
         Exit;
      end;

      Regra.RuleName := IntToStr(pRPI.IDREGRAEMPACOES);
      Regra.QueryIn  := DMEmprestAcoes.qryAux;
      try
         Regra.Execute;
      except
         on E:Exception do
         begin
            MsgDlg('Não foi possível calcular o Valor de Resgate.'+#13+E.Message,
                  'Mensagem do Sistema', mtWarning,[MbOk],0);
            Regra.Free;
            Exit;
         end;
      end;
      qryVLRRESGATE.AsFloat      := StrToFloat(TrocaPontoVirgula(Regra.Result));
      qryVALOREMPRESTIMO.AsFloat := StrToFloat(TrocaPontoVirgula(Regra.Result))- qryVLROPERACAO.AsFloat;
   end;
   Regra.Free;
end;

procedure TfrmCadOperEmpRevAcoes.sbtnCarteiraClick(Sender: TObject);
begin
   inherited;
   // AL_8 - Controle de trava de fechamento
   try
      if not RendaVariavel.VerEmAbertura then
      begin
         AbrirForm(FrmCadTransfCarteira, TFrmCadTransfCarteira,False);
         if Trim(dtOperacao.Text) <> '' then
            FrmCadTransfCarteira.DataRef := dtOperacao.DateTime;
      end;
   finally
      sbtnCarteira.Down := False;
   end;
end;

procedure TfrmCadOperEmpRevAcoes.dbreValorExit(Sender: TObject);
begin
  inherited;
   if (qryQTDOPERACAO.AsFloat = 0) or (qryPUOPERACAO.AsFloat = 0) then
       qryVLROPERACAO.AsFloat := 0;
end;

function TfrmCadOperEmpRevAcoes.IntegraContabCapCar:boolean;
var
   iTipoDespInvest, I, iChave : Integer;
   dDataVenc          : TDateTime;
   fValorJurosContab  : Currency;
begin
   Result := True;
   iPlanilha := -1;
   iDocumento := -1;
   I :=1;
   dDataVenc := qryDATAOPERACAO.AsDateTime;
   While I   <= qryTipoOperacao.FieldByName('VENCIMENTO').AsInteger Do
   Begin
      dDataVenc := dDataVenc+1;
      While not DiasUteisInv.DiaUtil(dDataVenc,-1,1,'',True,False,False) Do
        dDataVenc := dDataVenc+1;   // Achar o próximo dia útil
      I := I+1;
   End;

   sHistorico  := sHistorico + ' / JUROS - '+qryInvestimentoDESCINVESTIMENTO.AsString;

   if qryIDTIPOOPERACAO.AsInteger = -54 then
      iChave := iIdHistEmpAcoes
   else
      iChave := qryIDOPEREMPACOES.AsInteger;

   //Al_3
   if not EmprestAcoes.IntegraContabCapCar(iChave,
                                           qryInvestimentoIDINVESTIMENTO.AsInteger,
                                           qryIDTIPOOPERACAO.AsInteger,
                                           pRPI.IDCARTEMPACOES,
                                           qryTipoOperacaoFLGGERACONTAB.AsInteger,
                                           qryTipoOperacaoFLGGERACAPCAR.AsInteger,
                                           qryIDCUSTODIANTE.AsInteger,
                                           qryTipoOperacaoCODTIPDOC.AsInteger,
                                           -1{iTipoDespInvest},
                                           qryInvestimentoDESCINVESTIMENTO.AsString,
                                           sHistorico,
                                           fSaldoJuros,
                                           //AL_10
                                           fEstornoJuros,
                                           qryDATAOPERACAO.AsDateTime, dDataVenc,
                                           iPlanilha, iDocumento,
                                           iTipoConta,
                                           //AL_18
                                           qryPlanPrevIDPLANPREVCTBPATR.AsInteger) then
      Result := False;
end;

procedure TfrmCadOperEmpRevAcoes.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   Sel(-1);
   PnlSaldoEmp.Caption := '';
   // AL_6
   StatusForm([Consulta]);
end;

procedure TfrmCadOperEmpRevAcoes.bbtnSairClick(Sender: TObject);
begin
   bbtnCancelarClick(Sender);
  inherited;
end;

procedure TfrmCadOperEmpRevAcoes.sbtnImprimirClick(Sender: TObject);
begin
   inherited;
   try
      HabilitaComponentes;
      TfrmPreview.CreateModalPreview(Application,
                                     DMRelBoletaEmpAcoes.rptBoletaEmpAcoes,
                                     DMRelBoletaEmpAcoes.rptBoletaEmpAcoes.PrinterSetup.DocumentName);
   finally
      sbtnImprimir.Down := False;
   end;
end;

procedure TfrmCadOperEmpRevAcoes.HabilitaComponentes;
begin
   if sTipoOper = [Resgate] then
   begin
      DMRelBoletaEmpAcoes.dbeDataVencto.Visible    := True;
      DMRelBoletaEmpAcoes.lblDataVencto.Visible    := True;
      DMRelBoletaEmpAcoes.lblVlrIR.Visible         := True;
      DMRelBoletaEmpAcoes.dbeVlrIr.Visible         := True;
      DMRelBoletaEmpAcoes.lblVlrResgDia.Visible    := True;
      DMRelBoletaEmpAcoes.dbeVlrResgDia.Visible    := True;
      DMRelBoletaEmpAcoes.lblVlrJuros.Visible      := True;
      DMRelBoletaEmpAcoes.dbeVlrJuros.Visible      := True;
      DMRelBoletaEmpAcoes.lblFlgReversao.Visible   := False;
   end
   else
   begin
      DMRelBoletaEmpAcoes.dbeDataVencto.Visible    := False;
      DMRelBoletaEmpAcoes.lblDataVencto.Visible    := False;
      DMRelBoletaEmpAcoes.lblVlrIR.Visible         := False;
      DMRelBoletaEmpAcoes.dbeVlrIr.Visible         := False;
      DMRelBoletaEmpAcoes.lblVlrResgDia.Visible    := False;
      DMRelBoletaEmpAcoes.dbeVlrResgDia.Visible    := False;
      DMRelBoletaEmpAcoes.lblVlrJuros.Visible      := False;
      DMRelBoletaEmpAcoes.dbeVlrJuros.Visible      := False;
      DMRelBoletaEmpAcoes.lblFlgReversao.Visible   := True;
   end;
   if qryFLGPRECO.AsString = 'O' then
      DMRelBoletaEmpAcoes.lblDiaPreco.Caption := 'Ontém'
   else
      DMRelBoletaEmpAcoes.lblDiaPreco.Caption := 'Hoje';

   if qryFLGREVERSAO.AsString = 'S' then
      DMRelBoletaEmpAcoes.lblFlgReversao.Caption   := 'Permite reversão no vencimento.'
   else
      DMRelBoletaEmpAcoes.lblFlgReversao.Caption   := 'Permite reversão no vencimento.';

end;

procedure TfrmCadOperEmpRevAcoes.dsStateChange(Sender: TObject);
begin
  inherited;
  if (ds.State = dsBrowse) and (not qry.IsEmpty) then
  begin
     sbtnImprimir.Enabled := True;
     sbtnApagar.Enabled := True;
  end
  else
  begin
     sbtnImprimir.Enabled := False;
     sbtnApagar.Enabled := False;
  end;

end;

procedure TfrmCadOperEmpRevAcoes.dblCustodianteExit(Sender: TObject);
begin
   inherited;
    VerificaSaldoCustodia(fSaldo);
end;

// AL_6
procedure TfrmCadOperEmpRevAcoes.StatusForm(tTipoOper: TTipoOper);
begin
   lblTipoOperacao.Enabled   := False;
   dblcTipoOperacao.Enabled  := False;

   if tTipoOper = [Aplicacao] then
   begin
      sTipoOper := [Aplicacao];

      lblDataOper.Enabled       := True;
      dtOperacao.Enabled        := True;
      lblInvestimento.Enabled   := True;
      dblInvestimento.Enabled   := True;
      lblCustodiante.Enabled    := True;
      dblCustodiante.Enabled    := True;
      //AL_14
      lbPlanPrev.Enabled        := True;
      dblkPlanPrev.Enabled      := True;
      lblVencimento.Enabled     := True;
      dtVencimento.Enabled      := True;
      lblFlgPreco.Enabled       := True;
      dbcFlgPreco.Enabled       := True;
      lblPreco.Enabled          := True;
      dbrePreco.Enabled         := True;
      LblTipoConta.Enabled      := False;
      dblTipoConta.Enabled      := False;

      lblQuantidade.Enabled     := True;
      dbreQuantidade.Enabled    := True;
      lblValor.Enabled          := True;
      dbreValor.Enabled         := True;
      lblTaxa.Enabled           := True;
      dbreTaxa.Enabled          := True;
      lblVlrEmprestimo.Enabled  := False;
      dbreVlrEmprestimo.Enabled := False;

      lblVlrMaxResgate.Enabled  := False;
      dbreVlrMaxResgate.Enabled := False;
      //AL_10 Ini
      lblVlrResgate.Enabled     := False;
      dbreVlrResgate.Enabled    := False;
      //AL_10 Fim
      lblVlrJuros.Enabled       := False;
      dbreVlrJuros.Enabled      := False;
      lblIR.Enabled             := False;
      dbreIR.Enabled            := False;

      pnlFundo.Enabled          := True;
      dbcFlgEmpAcoes.Enabled    := True;
      dbcFlgEmpAcoes.Visible    := True;

      bbtnConfirmar.Enabled     := True;
      bbtnCancelar.Enabled      := True;
   end
   else if tTipoOper = [Resgate] then
   begin
      sTipoOper := [Resgate];

      lblDataOper.Enabled       := False;
      dtOperacao.Enabled        := False;
      lblInvestimento.Enabled   := False;
      dblInvestimento.Enabled   := False;
      lblCustodiante.Enabled    := False;
      dblCustodiante.Enabled    := False;
      //AL_14
      lbPlanPrev.Enabled        := False;
      dblkPlanPrev.Enabled      := False;

      lblVencimento.Enabled     := False;
      dtVencimento.Enabled      := False;
      lblFlgPreco.Enabled       := False;
      dbcFlgPreco.Enabled       := False;
      lblPreco.Enabled          := False;
      dbrePreco.Enabled         := False;
      LblTipoConta.Enabled      := True;
      dblTipoConta.Enabled      := True;

      lblQuantidade.Enabled     := True;
      dbreQuantidade.Enabled    := True;
      lblValor.Enabled          := False;
      dbreValor.Enabled         := False;
      lblTaxa.Enabled           := False;
      dbreTaxa.Enabled          := False;
      lblVlrEmprestimo.Enabled  := False;
      dbreVlrEmprestimo.Enabled := False;

      lblVlrMaxResgate.Enabled  := False;
      dbreVlrMaxResgate.Enabled := False;
      //AL_10 Ini
      lblVlrResgate.Enabled     := True;
      dbreVlrResgate.Enabled    := True;
      //AL_10 Fim
      lblVlrJuros.Enabled       := True;
      dbreVlrJuros.Enabled      := True;
      lblIR.Enabled             := True;
      dbreIR.Enabled            := True;

      pnlFundo.Enabled          := True;
      dbcFlgEmpAcoes.Enabled    := False;
      dbcFlgEmpAcoes.Visible    := False;

      bbtnConfirmar.Enabled     := True;
      bbtnCancelar.Enabled      := True;
   end
   else if tTipoOper = [Consulta] then
   begin
      sTipoOper := [Consulta];

      lblDataOper.Enabled       := False;
      dtOperacao.Enabled        := False;
      //AL_15
      lbPlanPrev.Enabled        := False;
      dblkPlanPrev.Enabled      := False;
      lblInvestimento.Enabled   := False;
      dblInvestimento.Enabled   := False;
      lblCustodiante.Enabled    := False;
      dblCustodiante.Enabled    := False;

      lblVencimento.Enabled     := False;
      dtVencimento.Enabled      := False;
      lblFlgPreco.Enabled       := False;
      dbcFlgPreco.Enabled       := False;
      lblPreco.Enabled          := False;
      dbrePreco.Enabled         := False;
      LblTipoConta.Enabled      := False;
      dblTipoConta.Enabled      := False;

      lblQuantidade.Enabled     := False;
      dbreQuantidade.Enabled    := False;
      lblValor.Enabled          := False;
      dbreValor.Enabled         := False;
      lblTaxa.Enabled           := False;
      dbreTaxa.Enabled          := False;
      lblVlrEmprestimo.Enabled  := False;
      dbreVlrEmprestimo.Enabled := False;

      lblVlrMaxResgate.Enabled  := False;
      dbreVlrMaxResgate.Enabled := False;
      lblVlrResgate.Enabled     := False;
      dbreVlrResgate.Enabled    := False;
      lblVlrJuros.Enabled       := False;
      dbreVlrJuros.Enabled      := False;
      lblIR.Enabled             := False;
      dbreIR.Enabled            := False;

      pnlFundo.Enabled          := False;
      dbcFlgEmpAcoes.Enabled    := False;
      dbcFlgEmpAcoes.Visible    := True;

      bbtnConfirmar.Enabled     := False;
      bbtnCancelar.Enabled      := False;
   end;
end;

end.
