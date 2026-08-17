//******************************************************************************
// Rotina     : sbtnProcurarClick
// SOL        : 105342
// Kintana    : 471275
// Data       : 06/01/2009
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para utilizar o investimento selecionado no
//               procurar do montaselect.
//******************************************************************************
// Data	     : 28/05/2008
// Codigo    : AL_16
// Pendência : 24716
// SOL       : 55534
// Função    : Out of Memory - Retirada dos TField Persistentes
//                             Substituição por FieldByName
//******************************************************************************
// Data      : 01/03/2007
// Código    : AL_15
// Desc      : Calcular Poupança pelo Valor
//******************************************************************************
// Data      : 16/02/2007
// Código    : AL_14
// Pendencia : 22779
// SOL       : 43633
// Desc      : Implementação de mais de um TRC entre Planos
//             Conforme o Alano, retirar a critica de trc lancadas no dia e utili
//             zar sempre o saldo do dia anterior
//******************************************************************************
// Data      : 06/12/2006
// Código    : AL_13
// Pendencia : 23952
// Desc      : Alterado o Filtro do MontaSelect para trazer as Operações de Origem
//             e Destino, permitindo a exclusão da Transferência tanto pelo Plano de
//             Origem quanto o de Destino.
//******************************************************************************
// Data      : 27/11/2006
// Código    : AL_12
// Pendencia : 23861
// SOL       : 43516
// Desc      : Ajustes no Calculo de Valores e arredondamentos para titulos que não
//             usam a quantidade
//******************************************************************************
// Data      : 11/08/2006
// Código    : AL_11
// Pendencia : 23528
// SOL       : 47194
// Desc      : Acerto na exclusão das operações (retirada do IDOPERRENFIXAPLIC) POIS,
//             não excluia a ponta de destino (ficando lixo)
//******************************************************************************
// Data      : 14/09/2006
// Código    : AL_10
// Desc      : Ajustes no Calculo de Valores e arredondamentos
//******************************************************************************
// Data      : 07/08/2006
// Código    : AL_9
// Pendencia : 23008
// Desc      : Alteração para gerar a Transf com o saldo do dia anterior
//********************************************************************************************************
// Data      : 18/07/2006
// Código    : AL_8
// Pendencia : 22779
// Desc      : Passa a utilizar as rotinas de Lançamento e Exclusão de Transferência de Títulos
//             IncluiTransferencia
//             ExcluiTransferencia
//********************************************************************************************************
// Data      : 03/07/2006
// Código    : AL_7
// Pendencia : 22658
// SOL       : 44185
// Desc      : Função para verificar a falta do Histórico quando do lançamento
//             de operações de Baixa.
//********************************************************************************************************
// Data      : 03/07/2006
// Código    : AL_6
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//********************************************************************************************************
//Data	     : 26/05/2006
//Codigo     : AL_5
//Pendência  : 22480
//SOL        : 43633
//Função     : Melhorias na Funcionalidade de Transferência entre Planos
//********************************************************************************************************
//Data	     : 15/03/2006
//Codigo     : AL_4
// Pendência : 21650
// SOL       : 40682
//Função     : Implementação do Campo Data de Liquidação para substituicao do VENCOPERACAO
//********************************************************************************************************
//Data	     : 15/03/2006
//Codigo     : AL_4
// Pendência : 21650
// SOL       : 40682
//Função     : Implementação do Campo Data de Liquidação para substituicao do VENCOPERACAO
//********************************************************************************************************
// Data   : 20/05/2005
// Código : AL_3
// Função : Alterações para Calcular e Gravar o Vlr do Item e o Valor Acumulado do
//             Item na HISTRENFIXXITENS
//********************************************************************************************************
// Data   : 23/03/2005
// Código : AL_2
// Função : Alterações para Calcular e Gravar o Vlr do Item e o Valor Acumulado do
//             Item na HISTRENFIXXITENS
//********************************************************************************************************
// Data   : 04/08/2004
// Código : AL_1
// Função : Controle do processo de abertura
//********************************************************************************************************
// Data	  : 28/04/2004
// Função : Marca o investimento para reprocessamento caso Exclusão retroativa
//             Permite transferência Retroativa (Saldo em várias datas)
//             Passa data de fechamento como data default para o filtro do montaselect
// Motivo : Implementação do Reprocessamento
//*******************************************************************************
unit FCadTransfRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, wwdblook, TREdit,
  wwdbdatetimepicker, CMDateTimePicker,{$IFNDEF VERSAO0505} uCMTypes,
  //AL_10
  ComCtrls, wwriched, faMensagem{$ENDIF}, uCtrlInvContab, uCMMath, DBClient;

type
  TfrmCadTransfRenFix = class(TfrmCadastroCSInv)
    sbtnBuscaSaldos: TToolbarButton97;
    qryPatroPlanPrevContabO: TwwQuery;
    qryPatroPlanPrevContabOIDPLANPREVCTBPATR: TFloatField;
    qryPatroPlanPrevContabOIDPLANOPREV: TFloatField;
    qryPatroPlanPrevContabOIDPATRO: TFloatField;
    qryPatroPlanPrevContabOPLANPRVCONTABPATRO: TStringField;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryPatroPlanPrevContabD: TwwQuery;
    msBuscaSaldos: TMontaSelect;
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
    qryDATAEMISSAO: TDateTimeField;
    qryPUEMISSAO: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryQTDEOPERACAO: TFloatField;
    qryVENCOPERACAO: TDateTimeField;
    qryOBSERVACAO: TStringField;
    qryIDUSUARIO: TFloatField;
    qryIDOPERRENFIXAPLIC: TFloatField;
    qryFLGOPERIMPLANT: TStringField;
    qryDATALEILAO: TDateTimeField;
    qryTXBOLSA: TFloatField;
    qryTXOPERACIONAL: TFloatField;
    qryFLGNEGOCIACAO: TStringField;
    qryFLGCARTHIPO: TStringField;
    qryQTDCARTHIPO: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryIDCLASSRISCORENFIX: TFloatField;
    qryFLGRECALC: TStringField;
    qryBOLETA: TStringField;
    qryAux: TwwQuery;
    qryTipoOperacao: TwwQuery;
    qryIDTIPOINVEST: TFloatField;
    qryPUMERCADO: TFloatField;
    qryPatroPlanPrevContabDIDPLANPREVCTBPATR: TFloatField;
    qryPatroPlanPrevContabDIDPLANOPREV: TFloatField;
    qryPatroPlanPrevContabDIDPATRO: TFloatField;
    qryPatroPlanPrevContabDPLANPRVCONTABPATRO: TStringField;
    qryBuscaPlanoDest: TwwQuery;
    qryBuscaPlanoDestIDPLANPREVCTBPATR: TFloatField;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryTipoOperacaoNATUREZAOPERACAO: TStringField;
    qryTipoOperacaoFLGGERACONTAB: TFloatField;
    qryTipoOperacaoFLGGERACAPCAR: TFloatField;
    qryTipoOperacaoRECPAG: TStringField;
    qryTipoOperacaoTIPCREDOR: TStringField;
    qryTipoOperacaoFLGTRATAIR: TStringField;
    qryTipoOperacaoSIGLATIPOOPER: TStringField;
    qryTipoOperacaoCODTIPDOC: TFloatField;
    pnlDados: TPanel;
    pnlOrigem: TPanel;
    lblPlanoPatroOrigem: TLabel;
    lblInvestimento: TLabel;
    lblQtdOrigem: TLabel;
    lblVlrOrigem: TLabel;
    dblkPlanPatroO: TwwDBLookupCombo;
    dblkInvestimento: TwwDBLookupCombo;
    pnlCaptionOrigem: TPanel;
    pnlVlrOrigem: TPanel;
    pnlQtdOrigem: TPanel;
    pnlDestino: TPanel;
    lblPlanoPatroDestino: TLabel;
    lblVlrDestino: TLabel;
    lblQtdDestino: TLabel;
    lblPercentual: TLabel;
    dblkPlanPatroD: TwwDBLookupCombo;
    pnlCaptionDestino: TPanel;
    redtPercentual: TRealEdit;
    redtQtdDestino: TRealEdit;
    redtVlrDestino: TRealEdit;
    pnlObs: TPanel;
    dbRtObs: TwwDBRichEdit;
    Panel1: TPanel;
    fraMensTRC: TfraMensagem;
    qryBuscaOpeExclusao_Old: TwwQuery;
    qryBuscaOpeExclusao_OldDATAOPERACAO: TDateTimeField;
    qryBuscaOpeExclusao_OldIDOPERRENFIXAPLIC: TFloatField;
    qryBuscaOpeExclusao_OldIDINVESTIMENTO: TFloatField;
    qryBuscaOpeExclusao_OldIDTIPOOPERACAO: TFloatField;
    qryBuscaOpeExclusao_OldDESCTIPOOPERACAO: TStringField;
    qryBuscaOpeExclusao_OldDESCPLANOPREV: TStringField;
    qryDATALIQUIDACAO: TDateTimeField;
    qryBuscaOpeExclusao_OldPLNCODIGO: TFloatField;
    qryBuscaOpeExclusao_OldCODDOCUMENTO: TFloatField;
    qryBuscaOpeExclusao_OldIDOPERRENFIX: TFloatField;
    lblDtOperacao: TLabel;
    dbDtaOperacao: TCMDateTimePicker;
    //AL_10
    qryInvestimentoIDCLASSETIT: TFloatField;
    qryInvestimentoFLGUSAQTD: TStringField;
    ClientDataSet1: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure sbtnBuscaSaldosClick(Sender: TObject);
    procedure redtPercentualExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure redtQtdDestinoExit(Sender: TObject);
    procedure redtVlrDestinoExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure msBuscaSaldosBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure redtVlrDestinoEnter(Sender: TObject);
    procedure redtQtdDestinoEnter(Sender: TObject);
  private
    { Private declarations }
    //AL_9
    sData : String;
    fVlrAnt, fQtdAnt: Double;

    function ValidaCampos:boolean;
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

  procedure AtualizaProg(sMsg: String = ''; iMax: Integer = -1);

var
  frmCadTransfRenFix: TfrmCadTransfRenFix;
  iIdOperRenFix : Integer;
  sHistorico : String;
  fVlrOperacao, fQtdOperacao, fPUTransf : Double;


implementation

uses UBibliotecaInvest, UMensErro, UOperComum, URendaFixa, dRendaFixa,
     UDataBase, dBaseDados, USistema, ULancContab,
     //AL_9
     UDiasUteisInv;
{$R *.DFM}

procedure TfrmCadTransfRenFix.FormShow(Sender: TObject);
begin
  inherited;
  fraMensTRC.Apaga;
  qryPatroPlanPrevContabO.Open;
  qryInvestimento.Open;
  qryTipoOperacao.Open;
  msBuscaSaldos.Filtro.Add('HISTRENFIX.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro));
  MontaSelect.Filtro.Add('OPERRENFIX.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro));
end;

procedure TfrmCadTransfRenFix.sbtnBuscaSaldosClick(Sender: TObject);
var
   dDataAniv : TDateTime;
begin
   inherited;
   msBuscaSaldos.Executar;
   if msBuscaSaldos.RetornouValor then
   begin
      // AL_1 - Controle do processo de abertura de renda fixa
      // Não faz se estiver em Abertura
      if RendaFixa.VerEmAbertura then
      begin
         sbtnBuscaSaldos.Down := False;
         Exit;
      end;

      // Simula o Padrão
      CmeCadastro.Cancel(Self); // Limpa o CachedUpdates
      CmeCadastro.Operacao := opInserir;
      CmeCadastro.RepetirInsert := True;
      CmeCadastro.Insert(Self);
      CmeCadastro.AtualizaBotoes(Self);
      sbtnInserir.Down := True;

      RendaFixa.BuscaSaldos(StrToDate(msBuscaSaldos.ValoresChave[5]),
                            -1,
                            StrToInt(msBuscaSaldos.ValoresChave[1]),
                            StrToInt(msBuscaSaldos.ValoresChave[11]));

      //AL_7 Ini
      // Não permite resgate de títulos marcados para reprocessamento
      if RendaFixa.MarcadoReproc(StrToInt(msBuscaSaldos.ValoresChave[1]),
                                 StrToInt(msBuscaSaldos.ValoresChave[11])) then
      begin
         MsgDlg('Não é possível Transferir um Investimento ' + #13 +
                'marcado para Reprocessamento.'+#13+
                'Execute primeiramente o Reprocessamento do Investimento!','Mensagem do Sistema',mtWarning,[mbOk],0);
         sbtnBuscaSaldos.Down := False;
         Exit;
      end;

      if not RendaFixa.BuscaHistOperNoDia(StrToDate(msBuscaSaldos.ValoresChave[5]),
                                          StrToInt(msBuscaSaldos.ValoresChave[1]),
                                          StrToInt(msBuscaSaldos.ValoresChave[11])) then
      begin
         MsgDlg('Existem Operações deste Investimento sem Histórico no dia.'+#13+
                'Execute o Reprocessamento do Investimento!','Mensagem do Sistema',mtWarning,[mbOk],0);
         sbtnBuscaSaldos.Down := False;
         Exit;
      end;
      //AL_7 Fim

      //AL_9
      //AL_14
      dbDtaOperacao.Date := StrToDate(sData);
      fVlrOperacao := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOVLRHISTRENFI').AsFloat;
      fQtdOperacao := DMRendaFixa.qryBuscaSaldosHist.FieldByName('SALDOQTDHISTRENFI').AsFloat;

      pnlQtdOrigem.Caption := FormatFloat('###,###,###,###,##0.000000000',fQtdOperacao);
      pnlVlrOrigem.Caption := FormatFloat('###,###,###,###,##0.00',fVlrOperacao);

      redtVlrDestino.Text := FormatFloat('###,###,###,###,##0.00',fVlrOperacao);
      redtQtdDestino.Text := FormatFloat('###,###,###,###,##0.00000000',fQtdOperacao);

      // Seleciona o Investimento
      dblkInvestimento.LookupValue := IntToStr(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger);
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT DESCINVESTIMENTO FROM INVESTIMENTO WHERE IDINVESTIMENTO = ' + IntToStr(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger));
      qryAux.Open;
      dblkInvestimento.Text := qryAux.FieldByName('DESCINVESTIMENTO').AsString;
      OperComum.PosicionaWWLookUpQry(dblkInvestimento, qryInvestimento);

      // Seleciona o Plano / Patro Origem
      dblkPlanPatroO.LookupValue     := IntToStr(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger);
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT (PL.NOME ||'' - ''|| PE.NOME) AS PLANPRVCONTABPATRO');
      qryAux.SQL.Add('FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL');
      qryAux.SQL.Add('WHERE (PA.IDPLANPREVCTBPATR = ' + IntToStr(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger) +') AND');
      qryAux.SQL.Add('(PA.IDPATRO = PE.IDPESSOA(+)) AND');
      qryAux.SQL.Add('(PA.IDPLANOPREV = PL.IDPLANOPREV)');
      qryAux.Open;
      dblkPlanPatroO.Text := qryAux.FieldByName('PLANPRVCONTABPATRO').AsString;
      OperComum.PosicionaWWLookUpQry(dblkPlanPatroO, QryPatroPlanPrevContabO);

      OperComum.LimpaParametros(QryPatroPlanPrevContabD);
      QryPatroPlanPrevContabD.ParamByName('IDPLANPREVCTBPATR').AsInteger := DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      QryPatroPlanPrevContabD.Open;

      if dblkPlanPatroD.CanFocus then
         dblkPlanPatroD.SetFocus;
   end
   else
      CmeCadastro.AtualizaBotoes(Self);
end;

procedure TfrmCadTransfRenFix.redtPercentualExit(Sender: TObject);
begin
  inherited;
   if redtPercentual.Value > 100 then
   begin
      MsgDlg('O percentual não pode ser superior a 100%.','Mensagem do Sistema',mtWarning,[MbOk],0);
      redtPercentual.Text := '100,00';
      if redtPercentual.CanFocus then
         redtPercentual.SetFocus;
   end
   else if redtPercentual.Value = 100 then
   begin
      redtQtdDestino.Value := fQtdOperacao;
      redtVlrDestino.Value := fVlrOperacao
   end
   else
   begin
      //AL_10 - Se a classe for poupança, não arredonda a quantidade
      //AL_12
      //AL_15
      if (qryInvestimentoIDCLASSETIT.AsInteger = pRPI.IDCLASSEPOUP) or
         (qryInvestimentoIDCLASSETIT.AsInteger = pRPI.IDCLASSPOUPBLOQ) or
         (qryInvestimentoFLGUSAQTD.AsString = 'N') then
      begin
         redtVlrDestino.Value := RoundCM(OperComum.DivValorZero((redtPercentual.Value * fVlrOperacao),100),2);
         redtQtdDestino.Value := RoundCM(OperComum.DivValorZero((redtVlrDestino.Value * fQtdOperacao),fVlrOperacao),9);
      end
      else
      begin
         redtQtdDestino.Value := RoundCM(OperComum.DivValorZero((redtPercentual.Value * fQtdOperacao),100),0);
         //AL_10 - Recalcula o Valor em relação a nova quantidade (Pelo PU de Curva)
         redtVlrDestino.Value := RoundCM(redtQTDDestino.Value * OperComum.DivValorZero(fVlrOperacao, fQtdOperacao),2);
      end;
   end;
end;

procedure TfrmCadTransfRenFix.redtQtdDestinoExit(Sender: TObject);
begin
  inherited;
   if redtQtdDestino.Value > fQtdOperacao then
   begin
      MsgDlg('Quantidade maior que o Saldo do Investimento.','Mensagem do Sistema',mtWarning,[MbOk],0);
      redtQtdDestino.Value := fQtdOperacao;
      if redtQtdDestino.CanFocus then
         redtQtdDestino.SetFocus;
   end
   else if redtQtdDestino.Value = fQtdOperacao then
   begin
      redtPercentual.Text := '100,00';
      redtQtdDestino.Value := fQtdOperacao;
      redtVlrDestino.Value := fVlrOperacao;
   end
   else if redtQtdDestino.Value <> fQtdOperacao then
   begin
      // AL_9 - Evita a distorção do arredondamento
      //        Só faz se o valor foi alterado manualmente
      if fQtdAnt <> redtQtdDestino.Value then
      begin
         //AL_10 - Recalcula o Valor em relação a nova quantidade (Pelo PU de Curva)
         redtVlrDestino.Value := RoundCM(redtQTDDestino.Value * OperComum.DivValorZero(fVlrOperacao, fQtdOperacao),2);
         redtPercentual.Text  := FloatToStr(RoundCM(OperComum.DivValorZero((redtQTDDestino.Value * 100),fQtdOperacao),9));
      end;
   end;
end;

procedure TfrmCadTransfRenFix.redtVlrDestinoExit(Sender: TObject);
begin
   inherited;
   if redtVlrDestino.Value > fVlrOperacao then
   begin
      MsgDlg('Valor maior que o Saldo do Investimento.','Mensagem do Sistema',mtWarning,[MbOk],0);
      redtVlrDestino.Value := fVlrOperacao;
      if redtVlrDestino.CanFocus then
         redtVlrDestino.SetFocus;
   end
   else if redtVlrDestino.Value = fVlrOperacao then
   begin
      redtPercentual.Text := '100,00';
      redtQtdDestino.Value := fQtdOperacao;
      redtVlrDestino.Value := fVlrOperacao;
   end
   else if redtVlrDestino.Value <> fVlrOperacao then
   begin
      // AL_9 - Evita a distorção do arredondamento do valor para duas casas decimais
      //        Só faz se o valor foi alterado manualmente
      if fVlrAnt <> redtVlrDestino.Value then
      begin
         //AL_10 - Se a classe for poupança, não arredonda a quantidade
         //AL_12
         if (qryInvestimentoIDCLASSETIT.AsInteger = pRPI.IDCLASSEPOUP) or
            (qryInvestimentoIDCLASSETIT.AsInteger = pRPI.IDCLASSPOUPBLOQ)  or
            (qryInvestimentoFLGUSAQTD.AsString = 'N') then
            redtQTDDestino.Value := RoundCM(OperComum.DivValorZero((redtVlrDestino.Value * fQtdOperacao),fVlrOperacao),9)
         else
            redtQTDDestino.Value := RoundCM(OperComum.DivValorZero((redtVlrDestino.Value * fQtdOperacao),fVlrOperacao),9);

         //AL_10 - Recalcula o Valor em relação a nova quantidade (Pelo PU de Curva)
         redtVlrDestino.Value := RoundCM(redtQTDDestino.Value *  OperComum.DivValorZero(fVlrOperacao, fQtdOperacao),2);
      end;
   end;
end;

function TfrmCadTransfRenFix.ValidaCampos:boolean;
begin
   Result := True;
   if redtVlrDestino.Value > fVlrOperacao then
   begin
      MsgDlg('Valor maior que o Saldo do Investimento.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if redtVlrDestino.CanFocus then
         redtVlrDestino.SetFocus;
      Result := False;
      Exit;
   end
   else if redtQtdDestino.Value > fQtdOperacao then
   begin
      MsgDlg('Quantidade maior que o Saldo do Investimento.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if redtQtdDestino.CanFocus then
         redtQtdDestino.SetFocus;
      Result := False;
      Exit;         
   end
   else if redtPercentual.Value > 100 then
   begin
      MsgDlg('O percentual não pode ser superior a 100%.','Mensagem do Sistema',mtWarning,[MbOk],0);
      redtPercentual.Text := '100,00';
      if redtPercentual.CanFocus then
         redtPercentual.SetFocus;
      Result := False;
      Exit;
   end
   else if redtPercentual.Value <= 0 then
   begin
      MsgDlg('O percentual não pode ser menor ou igual 0%.','Mensagem do Sistema',mtWarning,[MbOk],0);
      redtPercentual.Text := '100,00';
      if redtPercentual.CanFocus then
         redtPercentual.SetFocus;
      Result := False;
      Exit;
   end
   else if redtQtdDestino.Value <= 0 then
   begin
      MsgDlg('A quantidade não pode ser menor ou igual 0.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if redtQtdDestino.CanFocus then
         redtQtdDestino.SetFocus;
      Result := False;
      Exit;
   end
   else if redtVlrDestino.Value <= 0 then
   begin
      MsgDlg('O Valor não pode ser menor ou igual 0,00.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if redtVlrDestino.CanFocus then
         redtVlrDestino.SetFocus;
      Result := False;
      Exit;
   end
   else if Trim(dblkPlanPatroD.Text) = '' then
   begin
      MsgDlg('O Plano de Destino não foi informado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkPlanPatroD.CanFocus then
         dblkPlanPatroD.SetFocus;
      Result := False;
      Exit;
   end
   //AL_5
   else if RendaFixa.SomaResgatesFuturos(dbDtaOperacao.DateTime,
                                         qryInvestimentoIDINVESTIMENTO.AsInteger, 9999999,
                                         DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDOPERRENFIXAPLIC').AsInteger) > (fQtdOperacao - redtQtdDestino.Value) then
   begin
      MsgDlg('Existem resgates futuros nesta aplicação que não permitem transferir este total','Mensagem do Sistema',mtWarning,[MbOk],0);
      if redtQtdDestino.CanFocus then
         redtQtdDestino.SetFocus;
      Result := False;
      Exit;
   end;
end;

procedure TfrmCadTransfRenFix.bbtnConfirmarClick(Sender: TObject);
var
   iIdOperRenFix, iIdHistRenfix, iPlanilha,iDocumento : Integer;
   sBoleta : String;
   fVlrItem,fPUItem,fPUAcuItem : Double;
   // AL_3
   sMens : String;
   bVoltaData: Boolean;
   //AL_2
   fVlrAcuItem : Double;
   //AL_5
   iIdOperRenFixOrig : Integer;
begin
   // Força a saída do componente atual para acionar o OnExit deste componente
   //    no caso de teclar enter e o botão for default
   SelectNext(ActiveControl,True,True);

   if not ValidaCampos then
      Exit;

   CmeCadastro.Cancel(self);
   CmeCadastro.RepetirInsert := False;
   inherited;
   //AL_8 - Inicio
   try
      if dbDtaOperacao.DateTime < pRPI.DATAULTFECHRF then
      begin
         if (MsgDlg('Esta Operação Implica no Reprocessamento Automático deste Título ' + #13 +
                    'Confirma a Transferência?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) then
            Exit;
      end;

      Try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         uRendaFixa.AtualizaProcFech := AtualizaProg;

         if not RendaFixa.IncluiTransferencia(qryPatroPlanPrevContabOIDPLANPREVCTBPATR.AsInteger,
                                              qryPatroPlanPrevContabDIDPLANPREVCTBPATR.AsInteger,
                                              redtPercentual.Value, redtQtdDestino.Value, redtVlrDestino.Value,
                                              //AL_9
                                              DMRendaFixa.qryBuscaSaldosOper.FieldByName('PUOPERACAO').AsFloat,
                                              dbRtObs.Text,
                                              //AL_9
                                              dbDtaOperacao.Date) then
            Raise Exception.Create('');

         uRendaFixa.AtualizaProcFech := nil;

         DtmBaseDados.dbBaseDados.Commit;
         MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema',mtConfirmation,[mbOk],0);
      except
         on E:Exception do
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Não foi Possível Efetuar esta Transferência' + #13 +
                   E.Message,'Mensagem do Sistema',mtError,[mbOk],0);
         end;
      end;
   finally
      CmeCadastro.AtualizaBotoes(Self);
      LimpaCampos;
      fraMensTRC.Apaga;
   end;
   //AL_8 - Fim
end;

procedure TfrmCadTransfRenFix.LimpaCampos;
begin
   redtPercentual.Text := '100,00';
   redtQtdDestino.Text := '0,000000000';
   redtVlrDestino.Text := '0,00';
   dblkPlanPatroO.Clear;
   dblkInvestimento.Clear;
   dbDtaOperacao.Clear;
   pnlQtdOrigem.Caption := '';
   pnlVlrOrigem.Caption := '';
   dbRtObs.Lines.Clear;
   OperComum.LimpaParametros(QryPatroPlanPrevContabD);
   QryPatroPlanPrevContabD.ParamByName('IDPLANPREVCTBPATR').AsInteger := -1;
   QryPatroPlanPrevContabD.Open;
end;

procedure TfrmCadTransfRenFix.bbtnCancelarClick(Sender: TObject);
begin
   LimpaCampos;
   inherited;
end;

procedure TfrmCadTransfRenFix.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      sbtnApagar.Enabled := True;

      // Monta os Dados da Origem
      dbDtaOperacao.Date   := StrToDate(MontaSelect.ValoresChave[2]);
      pnlQtdOrigem.Caption := FormatFloat('###,###,###,###,##0.000000000',StrToFloat(MontaSelect.ValoresChave[6]));
      pnlVlrOrigem.Caption := FormatFloat('###,###,###,###,##0.00',StrToFloat(MontaSelect.ValoresChave[5]));
      redtQtdDestino.Text  := FormatFloat('###,###,###,###,##0.000000000',StrToFloat(MontaSelect.ValoresChave[6]));
      redtVlrDestino.Text  := FormatFloat('###,###,###,###,##0.00',StrToFloat(MontaSelect.ValoresChave[5]));
      redtPercentual.Text  := FormatFloat('###,###,###,###,##0.00',StrToFloat(MontaSelect.ValoresChave[7]));
      dbRtObs.Text         := MontaSelect.ValoresChave[8];

      // Seleciona o Investimento
//Ricardo Cristiano - 06/01/2009 - N. Sol 105342 -  N. Kintana 471275
//      dblkInvestimento.LookupValue := IntToStr(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDINVESTIMENTO').AsInteger);
      dblkInvestimento.LookupValue := MontaSelect.ValoresChave[1]; // Id do Investimento
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT DESCINVESTIMENTO FROM INVESTIMENTO WHERE IDINVESTIMENTO = ' + MontaSelect.ValoresChave[1]);
      qryAux.Open;
      dblkInvestimento.Text := qryAux.FieldByName('DESCINVESTIMENTO').AsString;
      OperComum.PosicionaWWLookUpQry(dblkInvestimento, qryInvestimento);
      // Seleciona o Plano / Patro Origem
//Ricardo Cristiano - 06/01/2009 - N. Sol 105342 -  N. Kintana 471275      
//      dblkPlanPatroO.LookupValue     := IntToStr(DMRendaFixa.qryBuscaSaldosHist.FieldByName('IDPLANPREVCTBPATR').AsInteger);
      dblkPlanPatroO.LookupValue     := MontaSelect.ValoresChave[0]; // Id do Plano/Patro

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT (PL.NOME ||'' - ''|| PE.NOME) AS PLANPRVCONTABPATRO');
      qryAux.SQL.Add('FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL');
      qryAux.SQL.Add('WHERE (PA.IDPLANPREVCTBPATR = ' + MontaSelect.ValoresChave[0] +') AND');
      qryAux.SQL.Add('(PA.IDPATRO = PE.IDPESSOA(+)) AND');
      qryAux.SQL.Add('(PA.IDPLANOPREV = PL.IDPLANOPREV)');
      qryAux.Open;

      dblkPlanPatroO.Text := qryAux.FieldByName('PLANPRVCONTABPATRO').AsString;
      OperComum.PosicionaWWLookUpQry(dblkPlanPatroO, QryPatroPlanPrevContabO);

      // Monta os Dados do Destino
      OperComum.LimpaParametros(qryBuscaPlanoDest);
      qryBuscaPlanoDest.ParamByName('BOLETA').AsString := MontaSelect.ValoresChave[4];
      qryBuscaPlanoDest.Open;

      OperComum.LimpaParametros(QryPatroPlanPrevContabD);
      QryPatroPlanPrevContabD.Open;
      dblkPlanPatroD.LookupValue := IntToStr(qryBuscaPlanoDestIDPLANPREVCTBPATR.AsInteger);
      dblkPlanPatroD.Text := QryPatroPlanPrevContabD.FieldByName('PLANPRVCONTABPATRO').AsString;
      OperComum.PosicionaWWLookUpQry(dblkPlanPatroD, QryPatroPlanPrevContabD);
   end;
end;

procedure TfrmCadTransfRenFix.sbtnApagarClick(Sender: TObject);
begin
   // AL_1 - Controle do processo de abertura de renda fixa
   // Não faz se estiver em Abertura
   if RendaFixa.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;

   //AL_8 - Inicio
   try
      if StrToDate(MontaSelect.ValoresChave[2]) >= pRPI.DATAULTFECHRF then
      begin
         if (MsgDlg('A Exclusão desta Operação Implica na Exclusão de TODAS as Transferências deste Título nesta Data' + #13 +
                    'Confirma a Exclusão?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) then
            Exit;
      end
      else
      begin
         if (MsgDlg('A Exclusão desta Operação Implica na Exclusão de TODAS as Transferências ' + #13 +
                    'posteriores deste Título e no Reprocessamento Automático destes Títulos ' + #13 +
                    'a Partir do Dia ' + MontaSelect.ValoresChave[2] + #13 +
                    'Confirma a Exclusão?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) then
            Exit;
      end;

      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         uRendaFixa.AtualizaProcFech := AtualizaProg;

         //AL_9
         //AL_11
         if not RendaFixa.ExcluiTransferencia(MontaSelect.ValoresChave[4]) then
            Raise Exception.Create('Não foi possível excluir esta transferência');

         uRendaFixa.AtualizaProcFech := nil;

         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;

      except
      on E: Exception do
         begin
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
         end;
      end;
   finally
      fraMensTRC.Apaga;
      LimpaCampos;
      CmeCadastro.AtualizaBotoes(Self);
      //AL_5
      sbtnApagar.Down := False;
   end;
   //AL_8 - Fim
end;

procedure AtualizaProg(sMsg: String = ''; iMax: Integer = -1);
begin
   if iMax = -2 then
      frmCadTransfRenFix.fraMensTRC.Apaga
   else if iMax > 0 then
      frmCadTransfRenFix.fraMensTRC.Mostra;

   if sMsg <> '' then
      frmCadTransfRenFix.fraMensTRC.Mes := sMsg;

   if iMax > 0 then
   begin
      frmCadTransfRenFix.fraMensTRC.Max := iMax;
      frmCadTransfRenFix.fraMensTRC.Min := 0;
      frmCadTransfRenFix.fraMensTRC.Pos := 0;
   end
   else
   if iMax = -1 then
      frmCadTransfRenFix.fraMensTRC.Incrementa;

   Application.ProcessMessages;
end;

//AL_9
procedure TfrmCadTransfRenFix.msBuscaSaldosBeforeOpenCds(var sqlText: String; strListParams: TStringList);
var
   sDataSaldo : string;
   i : Integer;
   sDataAux : TDateTime;
begin
  inherited;
   sData := '';
    // Busca Posição da Substring a ser substituida
   if strListParams.Count > 0 then
   begin
      sData := Copy(strListParams[0],36,10);
      try
         sDataAux := StrToDate(sData);
      except
         begin
            MsgDlg('Informe uma data para Buscar o Saldo dos Ativos.','Mensagem do Sistema',mtWarning,[mbOk],0);
            Exit;
         end;
      end;
      sDataSaldo := DateToStr(StrToDate(sData) -1);
      sqlText := uBibliotecaInvest.StrTran(sqlText, '01/01/1899', sDataSaldo);
      sqlText := uBibliotecaInvest.StrTran(sqlText, sData, sDataSaldo);
   end
   else
   begin
      MsgDlg('Informe uma data para Buscar o Saldo dos Ativos.','Mensagem do Sistema',mtWarning,[mbOk],0);
   end;
end;

procedure TfrmCadTransfRenFix.redtVlrDestinoEnter(Sender: TObject);
begin
  inherited;
  fVlrAnt := redtVlrDestino.Value;
end;

procedure TfrmCadTransfRenFix.redtQtdDestinoEnter(Sender: TObject);
begin
  inherited;
  fQtdAnt := redtQtdDestino.Value;
end;

end.


