//******************************************************************************
// Data      : 04/05/2007
// Código    : AL_10
// Pendencia : 26386
// Desc      : Atulizando a chamada CtrlInvContab.BuscaPadrLanc.Executa
//             incluindo o Plano/Patro
//******************************************************************************
// Data      : 20/03/2007
// Código    : AL_9
// Pendencia : 24774
// SOL       : 55877
// Desc      : Liga/Desliga a integração contabil financeira por módulo
//******************************************************************************
// Data      : 06/12/2006
// Código    : AL_8
// Pendencia : 23674
// SOL       : 45954
// Desc      : Segregação de Recursos
//******************************************************************************
// Data      : 29/01/2007
// Código    : AL_7
// Pendencia : 23674
// SOL       : 45954
// Desc      : Segregação de Recursos
//             Migrada a parte contabil com resalvas: Não existe segregação de planos
//******************************************************************************
// Data      : 06/12/2006
// Código    : AL_6
// Pendencia : 23674
// SOL       : 45954
// Desc      : Exclusão contábil em 3 camadas
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_5
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 24/05/2005
// Código   : AL_4
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 29/06/2004
// Código   : AL_3
// Motivo   : Inclusão de Não Exercicio automático no vencimento
//******************************************************************************
// Data     : 24/06/2004
// Código   : AL_2
// Motivo   : Acerto na exclusão de Boletas  na funcao 'ExcluiOperOpcInd'
//********************************************************************************************************
//Data	 	:      Alt_1 : 16/06/2004
//Objetivo	:      Criado a função GeraNumDocRev
//********************************************************************************************************
//Data	 	:      30/04/2004
//Objetivo	:   *  Gravar o Saldo de Ajuste na Trava correspondente, de acordo
//                     com a flutuação da Cesta e não mais na Trava da Cesta.
//                     Definição alterada por Roseli(GESIS) e Alessandr(GECOR) a pedido
//                     da Funcef
//*******************************************************************************

unit UOpcaoIndice;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls, ComCtrls, uRegra, faMensagem,
  FAguardeInv, uCtrlInvContab;

Type
   TOpcaoIndice = Class(TObject)
   private

   public
      function VerificaBoletaAberta(dDataIni, dDataFim: TDateTime): Boolean;

      function BuscaValorCesta(iCesta: Integer; dVigencia: TDateTime): Double;

      function BuscaOpcao(iInvestimento: Integer = -1; iOpcao: Integer = -1): Boolean;

      function BuscaVlrAtuCesta(iCesta: Integer; dDataAtual: TDateTime): Double;

      function ValidaDiferencaCesta(sLote: String; sModo: String = 'T'): boolean;

      function GravaOrdemOpcInd(iIdOrdemOpcInd,iIdCorretValores,iIdInvestimento,iIdTipoInvest,
                                  iIdTipoOperacao,iIdUsuario,iIdPlanPrevCtbPatr,iIdCarteiraGerenc,
                                  iIdCestaOpcInd:Integer;
                                  dDataOper:TDateTime;
                                  fQuantidade,fVlrPremio,fVlrValor:Double;
                                  sIdLote,sIdBoleta,sObservacao,sStatus,sStaConfirma,sStaAutoriza:String): Boolean;

      function GravaOperOpcInd(iIdOperOpcInd,iIdInvestimento,iIdCarteiraInvest,iIdTipoOperacao,
                                 iIdTipoInvest,iIdPlanPrevCtbPatr,iIdCarteiraGerenc,iIdCorretValores:Integer;
                                 sIdLote,sIdBoleta:String;
                                 dDataOper:TDateTime;
                                 fQuantidade,fVlrPremio,fVlrValor:Double): Boolean;


      function GravaHistOpcInd(iIdHistOpcInd,iIdOperOpcInd,iIdInvestimento,iIdCarteiraInvest,iIdTipoOperacao,
                               iIdTipoInvest,iIdPlanPrevCtbPatr,iIdCarteiraGerenc,iPlnCodigo:Integer;
                               sIdLote,sIdBoleta,sHistorico,sTipMovto,sFlgCalcula:String;
                               dDataHist:TDateTime;
                               fVlrHist,fSldVlrHist,fQtdHist,fSldQtdHist:Double): Boolean;

      function GravaHistOpcIndXItens(iIdHistOpcInd,iIdItemOpcInd,iIdRegra:Integer;
                                     fVlrHist,fSldVlrHist:Double): Boolean;

      function GravaItemOpcInd(iIdItemOpcInd,iIdRegra:Integer;
                               sDesItemOpcInd:String): Boolean;

      function GeraNumDoc(dDataOper: TDateTime; iCorretora: Integer;
                          sBoleta: String = ''): String;
      //Alt_1
      function GeraNumDocRev(dDataOper: TDateTime; iCorretora: Integer;
                             sBoleta: String = ''): String;
                          
      function BuscaCotacaoLoteAcao(iInvestimento: integer; dDataRef: TDateTime;
                                    bUsalote: boolean; var fLote: double): double;

      function BuscaValorMaxCesta(iOrdem: Integer): double;

      function GravaDespOpcInd(iIdDespOpcInd,iIdTipoOper,iIdTipoDesp,iIdOperOpcInd,iIdRegra:Integer;
                               sIdBoleta:String;
                               fVlrDespesa:Double): Boolean;

      function GravaBoletaOpcInd(sIdBoleta,sStatus:String;
                                 dDataBoleta:TDateTime;
                                 iForCli,iPlano, iPlanilha, iDocumento:Integer;
                                 sTpMovBoleta:String): Boolean;

      function UpdStatusOrdemOpcInd(sIdBoleta,sStatus:string): Boolean;

      function UpdStatusBoleta(sIdBoleta,sStatus,iTipoMov:String;
                               iCorretValores,iPlano,iPlanilha,iDocumento:Integer): Boolean;

      procedure BuscaSaldoOpcInd(dDataRef:TDateTime;
                                 iIDBoleta: String = ''; iIDLote: String = '';
                                 iIdInvestimento: Integer = -1);

      function VerificaReversao(iIdInvestimento:Integer;iIdBoleta,dDataRef:String):boolean;

      function ExcluiOperOpcInd(sIdBoleta,sIdBoletaTRC,dDataRef:String; prbProgresso: TProgressBar = nil):boolean;

      function ExcluiAtuOpcInd(iIdInvestimento:Integer;dDataRef,iIdBoleta:String;
                               fraMsg: TfraMensagem = nil):boolean;

      function DeleteHistOpcIndXItens(iIdHistOpcInd:Integer):boolean;

      function DeleteHistOpcInd(iIdHistOpcInd:Integer):boolean;

      function DeleteOperOpcInd(iIdOperOpcInd:Integer):boolean;

      function DeleteBoletaOpcInd(sIdBoleta:String):boolean;

      function AlteraStatusOpcInd(sIdBoleta,sStatus:String):boolean;

      function MontaHistorico(sNatOper,sDescOper,sDescInv: String): String;

      function GravaItensHistOpcInd(iIdHistOpcInd :Integer;
                                    fQtd,fSldQtd,
                                    fVlrCompra, fSldCompra,
                                    fVlrVencto, fSldVencto,
                                    fVlrCesta, fSldCesta,
                                    fVlrAtual, fSldAtual,
                                    fVlrMercado, fSldMercado,
                                    fVlrAjusteDia, fSldAjusteDia,
                                    fVlrAjusteCesta, fSldAjusteCesta: Double):boolean;

      function AtualizaAjusteOpcInd(iHistAlta, iHistBaixa, iHistCesta, iItem: Integer;
                                    fVlrAjusteCesta: Double;
                                    iIdBoleta,iIdLote,dDataRef:String): Boolean;

      function AtualizaSaldosOpcInd(dDataRef:TDateTime;
                                    sIdBoleta: String = '';
                                    sIdLote:String = '';
                                    fraMsg: TfraMensagem = nil): Boolean;

      function VerificaCestaInv(iCesta, iCarteira, iCustodiante, iInvestimento: Integer;
                                dDataVigencia: TDateTime; iCarteiraGerenc: Integer = -1): Boolean;

      function DeleteDespesaOpcInd(iIdBoleta:String):boolean;

      function AtualizaTransferencia(dDataRef : TDateTime) : boolean;

      function ReprocessaHistOpcInd(dDataIni, dDataFim: TDateTime;
                                    fraMsg: TfraMensagem = nil;
                                    sIdBoleta: String = '';
                                    sIdLote:String = ''): Boolean;

      function RelancaHistOper(dDataProc: TDateTime;
                               sIdBoleta: String = '';
                               sIdLote:String = '';
                               fraMsg: TfraMensagem = nil): Boolean;

//    -------------------- Rotinas Contabeis e Financeiras ---------------------------------------------------------
      // Não precisa alterar, recebe os parametros e usa a opercomum.lancamentocontabil
      function ContabilizaOpcInd(fValor:Double;
                                 iPlano, iForCli,iUnidNegoc,iSubContaDeb, iSubContaCred,iPlanoPatro :integer;
                                 sHistorico, sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,sTipoPer,
                                 sRecPagNao : string;
                                 dDataProc : TDateTime;
                                 var iPlanilha : integer;
                                 iUsuarioOrigem: Integer = -1):boolean;

      // Migrada com resalvas - Plano Patro Default - iPlanPrevCtbPatr
      function IntegraCapCarOpcInd(fValor:Double;iForCli, iPlano, iTipoDoc,iUnidNegoc,iSubContaCred,iPlanilha : integer;
                                   sRecPagNao,sTipoRecDes,sContaDeb, sContaCred,sCentroCustoCred,
                                   sDataLanc,sDataVenc,sCentroRespon,sHistorico : string;
                                   var iDocumento : integer; iUsuarioOrigem: Integer = -1): boolean;

      function ContabilizaTranfCesta(sBoleta: String): Boolean;

      function DeleteFinanceiro(iDocumento:Integer):boolean;

      function DeleteContabil(iPlanilha:Integer):boolean;
//    -------------------- Rotinas Contabeis e Financeiras - Fim  --------------------------------------------------

   end;

var
  OpcaoIndice : TOpcaoIndice;
  iIdOperacaoInvest : Integer;

implementation

uses UOperComum, dOpcoesIndice, dOpcoes, DBaseDados, UDatabase, USistema, UBibliotecaInvest,
     UMensErro, UOperacaoInvest, uDocumento, dOperComum, UDiasUteisInv, uLancContab;

function TOpcaoIndice.BuscaValorCesta(iCesta: Integer; dVigencia: TDateTime): Double;
begin
   Result := 0;
   with DMOpcoesIndice, qryBuscaValorCesta do
   begin
      try
         OperComum.LimpaParametros(qryBuscaValorCesta);
         ParamByName('IDCESTAOPCIND').AsInteger := iCesta;
         ParamByName('DATAVIGENCIA').AsString := DateToStr(dVigencia);
         Open;
         if Eof then
            MsgDlg('Não foi encontrada uma Cesta com esta Vigência','Mensagem do Sistema ', mtInformation, [mbOK], 0)
         else
            Result := qryBuscaValorCestaVALORTOTAL.AsFloat;
      finally
         Close;
      end;
   end;
end;

function TOpcaoIndice.BuscaVlrAtuCesta(iCesta: Integer; dDataAtual: TDateTime): Double;
begin
   Result := 0;
   with DMOpcoesIndice, DMOpcoesIndice.qryBuscaVlrAtuCesta do
   begin
      try
         OperComum.LimpaParametros(qryBuscaVlrAtuCesta);
         ParamByName('IDCESTAOPCIND').AsInteger := iCesta;
         ParamByName('DATAATU').AsString := DateToStr(dDataAtual);
         Open;
         if Eof then
            MsgDlg('Não foi encontrada uma Cesta com esta Vigência','Mensagem do Sistema ', mtInformation, [mbOK], 0)
         else
            Result := qryBuscaVlrAtuCestaSALDOCESTA.AsFloat;
      finally
         Close;
      end;
   end;

end;

// Verifica o valor da cesta se está de acordo com o total possível
//  sModo: T - Total, verifica todos os limites, mínimo e máximo
//         P - Parcial, verifica somente o valor máximo
function TOpcaoIndice.ValidaDiferencaCesta(sLote: String; sModo: String = 'T'): boolean;
var
   fVlrMaior, fVlrMenor,fVlrCesta,fValor : Double;
   bFirst : boolean;
begin
   with DMOpcoesIndice, DMOpcoesIndice.qryBuscaOrdemLote do
   begin
      try
         Result    := False;
         fVlrMaior := 0;
         fVlrMenor := 0;
         bFirst := True;

         OperComum.LimpaParametros(qryBuscaOrdemLote);
         ParamByName('IDLOTE').AsString := sLote;
         Open;
         if IsEmpty then
            MsgDlg('Não Foram Encontradas Ordens para o Lote ' + sLote,
                   'Mensagem do Sistema', MtWarning,[MbOk],0);

         First;
         while not Eof do
         begin
            if not qryBuscaOrdemLoteIDCESTAOPCIND.IsNull then
               fVlrCesta := OpcaoIndice.BuscaValorCesta(qryBuscaOrdemLoteIDCESTAOPCIND.AsInteger, qryBuscaOrdemLoteDATAORDEM.AsDateTime);

            fValor := OpcaoIndice.BuscaValorMaxCesta(qryBuscaOrdemLoteIDORDEMOPCIND.AsInteger);
            if bFirst then
            begin
                fVlrMaior := fValor;
                fVlrMenor := fValor;
                bFirst    := False;
            end
            else
            begin
               if fValor > fVlrMaior then
                  fVlrMaior := fValor;
               if fValor < fVlrMenor then
                  fVlrMenor := fValor;
            end;
            qryBuscaOrdemLote.Next;
         end;

         if fVlrCesta > (fVlrMaior + pRPI.DIFMAXOPCIND) then
            MsgDlg('O Valor da Cesta: ' + FloatToStr(fVlrCesta) + ' é Superior ao ' + #13 +
                   'Valor da Maior Operação mais o Limite Permitido: ' + FloatToStr((fVlrMaior + pRPI.DIFMAXOPCIND)),
                   'Mensagem do Sistema', MtWarning,[MbOk],0);

         if (fVlrCesta < (fVlrMenor - pRPI.DIFMAXOPCIND)) and
            (sModo = 'T') then
            MsgDlg('O Valor da Cesta: ' + FloatToStr(fVlrCesta) + ' é Inferior ao ' + #13 +
                   'Valor da Menor Operação menos o Limite Permitido: ' + FloatToStr((fVlrMenor - pRPI.DIFMAXOPCIND)),
                   'Mensagem do Sistema', MtWarning,[MbOk],0);

         // Se passou em todos os testes retorna True
         Result := True;
      finally
         OperComum.LimpaParametros(qryBuscaOrdemLote);
      end;
   end;
end;

function TOpcaoIndice.GravaOrdemOpcInd(iIdOrdemOpcInd,iIdCorretValores,iIdInvestimento,iIdTipoInvest,
                                          iIdTipoOperacao,iIdUsuario,iIdPlanPrevCtbPatr,iIdCarteiraGerenc,
                                          iIdCestaOpcInd:Integer;
                                          dDataOper:TDateTime;
                                          fQuantidade,fVlrPremio,fVlrValor:Double;
                                          sIdLote,sIdBoleta,sObservacao,sStatus,sStaConfirma,sStaAutoriza:String): Boolean;
begin
   Result := True;
   Try
      with DMOpcoesIndice.qryInsOrdemOpcInd do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryInsOrdemOpcInd);

         ParamByName('IDORDEMOPCIND').AsInteger     := iIdOrdemOpcInd;
         ParamByName('DATAORDEM').AsDateTime        := dDataOper;
         ParamByName('IDCORRETVALORES').AsInteger   := iIdCorretValores;
         ParamByName('IDBOLETA').AsString           := sIdBoleta;
         ParamByName('IDINVESTIMENTO').AsInteger    := iIdInvestimento;
         ParamByName('IDTIPOOPERACAO').AsInteger    := iIdTipoOperacao;
         ParamByName('IDTIPOINVEST').AsInteger      := iIdTipoInvest;
         ParamByName('QUANTIDADE').AsFloat          := fQuantidade;
         ParamByName('PREMIO').AsFloat              := fVlrPremio;
         ParamByName('VALOR').AsFloat               := fVlrValor;
         ParamByName('OBSERVACAO').AsString         := sObservacao;
         ParamByName('STATUS').AsString             := sStatus;
         ParamByName('IDUSUARIO').AsInteger         := iIdUsuario;
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanPrevCtbPatr;
         ParamByName('STACONFIRMA').AsString        := sStaConfirma;
         ParamByName('STAAUTORIZA').AsString        := sStaAutoriza;
         ParamByName('IDCESTAOPCIND').AsInteger     := iIdCestaOpcInd;
         ParamByName('IDCARTEIRAGERENC').AsInteger  := iIdCarteiraGerenc;
         ParamByName('IDBOLETA').AsString           := sIdLote;
         ExecSql;
      end;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Gravação das Ordens.'+''#13+
                E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
      end;
   end;
end;

function TOpcaoIndice.GravaOperOpcInd(iIdOperOpcInd,iIdInvestimento,iIdCarteiraInvest,iIdTipoOperacao,
                                          iIdTipoInvest,iIdPlanPrevCtbPatr,iIdCarteiraGerenc,iIdCorretValores:Integer;
                                          sIdLote,sIdBoleta:String;
                                          dDataOper:TDateTime;
                                          fQuantidade,fVlrPremio,fVlrValor:Double): Boolean;
begin
   Result := True;
   Try
      with DMOpcoesIndice.qryInsOperOpcInd do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryInsOperOpcInd);

         ParamByName('IDOPEROPCIND').AsInteger      := iIdOperOpcInd;
         ParamByName('IDINVESTIMENTO').AsInteger    := iIdInvestimento;
         ParamByName('DATAOPERACAO').AsDateTime     := dDataOper;
         ParamByName('QUANTIDADE').AsFloat          := fQuantidade;
         ParamByName('PREMIO').AsFloat              := fVlrPremio;
         ParamByName('VALOR').AsFloat               := fVlrValor;
         ParamByName('IDCORRETVALORES').AsInteger   := iIdCorretValores;
         ParamByName('IDCARTEIRAINVEST').AsInteger  := iIdCarteiraInvest;
         ParamByName('IDBOLETA').AsString           := sIdBoleta;
         ParamByName('IDTIPOOPERACAO').AsInteger    := iIdTipoOperacao;
         ParamByName('IDTIPOINVEST').AsInteger      := iIdTipoInvest;
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanPrevCtbPatr;
         if iIdCarteiraGerenc > 0 then
            ParamByName('IDCARTEIRAGERENC').AsInteger  := iIdCarteiraGerenc;
         ParamByName('IDLOTE').AsString             := sIdLote;
         ExecSql;
      end;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Gravação da Operação.'+''#13+
                E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
end;

function TOpcaoIndice.GravaHistOpcInd(iIdHistOpcInd,iIdOperOpcInd,iIdInvestimento,iIdCarteiraInvest,iIdTipoOperacao,
                                       iIdTipoInvest,iIdPlanPrevCtbPatr,iIdCarteiraGerenc,iPlnCodigo:Integer;
                                       sIdLote,sIdBoleta,sHistorico,sTipMovto,sFlgCalcula:String;
                                       dDataHist:TDateTime;
                                       fVlrHist,fSldVlrHist,fQtdHist,fSldQtdHist:Double): Boolean;
begin
   Result := True;
   Try
      with DMOpcoesIndice.qryInsHistOpcInd do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryInsHistOpcInd);

         ParamByName('IDHISTOPCIND').AsInteger      := iIdHistOpcInd;
         ParamByName('IDBOLETA').AsString           := sIdBoleta;
         ParamByName('IDOPEROPCIND').AsInteger      := iIdOperOpcInd;
         ParamByName('IDINVESTIMENTO').AsInteger    := iIdInvestimento;
         ParamByName('IDCARTEIRAINVEST').AsInteger  := iIdCarteiraInvest;
         ParamByName('IDTIPOOPERACAO').AsInteger    := iIdTipoOperacao;
         ParamByName('IDTIPOINVEST').AsInteger      := iIdTipoInvest;
         ParamByName('DATAHISTOPCIND').AsDateTime   := dDataHist;
         ParamByName('HISTORICO').AsString          := sHistorico;
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanPrevCtbPatr;
         ParamByName('PLNCODIGO').AsInteger         := iPlnCodigo;
         if iPlnCodigo    = -1   then
            ParamByName('PLNCODIGO').Clear;
         ParamByName('VLRHISTOPCIND').AsFloat       := fVlrHist;
         ParamByName('SLDVLRHISTOPCIND').AsFloat    := fSldVlrHist;
         ParamByName('QTDHISTOPCIND').AsFloat       := fQtdHist;
         ParamByName('SLDQTDHISTOPCIND').AsFloat    := fSldQtdHist;
         ParamByName('TIPMOVHISTOPCIND').AsString   := sTipMovto;
         ParamByName('IDLOTE').AsString             := sIdLote;
         if iIdCarteiraGerenc > 0 then
            ParamByName('IDCARTEIRAGERENC').AsInteger  := iIdCarteiraGerenc;
         ParamByName('FLGCALCULA').AsString         := sFlgCalcula;
         ExecSql;
      end;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Gravação dos Históricos.'+''#13+
                E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
end;

function TOpcaoIndice.GravaHistOpcIndXItens(iIdHistOpcInd,iIdItemOpcInd,iIdRegra:Integer;
                                             fVlrHist,fSldVlrHist:Double): Boolean;
begin
   Result := True;
   Try
      with DMOpcoesIndice.qryInsHistOpcIndXItens do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryInsHistOpcIndXItens);

         ParamByName('IDHISTOPCIND').AsInteger := iIdHistOpcInd;
         ParamByName('IDITEMOPCIND').AsInteger := iIdItemOpcInd;
         ParamByName('VLRHISTOPCIND').AsFloat  := fVlrHist;
         ParamByName('SLDHISTOPCIND').AsFloat  := fSldVlrHist;
         if iIdRegra <> -1 then
            ParamByName('IDREGRAUSADA').AsInteger := iIdRegra;
         ExecSql;
      end;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Gravação dos Itens do Histórico.'+''#13+
                E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
end;

function TOpcaoIndice.GravaItemOpcInd(iIdItemOpcInd,iIdRegra:Integer;
                                      sDesItemOpcInd:String): Boolean;
begin
   Result := True;
   Try
      with DMOpcoesIndice.qryInsItemOpcInd do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryInsItemOpcInd);

         ParamByName('IDITEMOPCIND').AsInteger := iIdItemOpcInd;
         ParamByName('DESITEMOPCIND').AsString := sDesItemOpcInd;
         ParamByName('IDREGRA').AsInteger      := iIdRegra;
         ExecSql;
      end;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Gravação dos Itens.'+''#13+
                E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
end;

function TOpcaoIndice.GravaDespOpcInd(iIdDespOpcInd,iIdTipoOper,iIdTipoDesp,iIdOperOpcInd,iIdRegra:Integer;
                                      sIdBoleta:String;
                                      fVlrDespesa:Double): Boolean;
begin
   Result := True;
   Try
      with DMOpcoesIndice.qryInsDespOpcInd do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryInsDespOpcInd);

         ParamByName('IDDESPOPEROPCIND').AsInteger    := iIdDespOpcInd;
         if iIdTipoOper <> -1 then
            ParamByName('IDTIPOOPERACAO').AsInteger   := iIdTipoOper;
         ParamByName('IDTIPODESPINVEST').AsInteger    := iIdTipoDesp;
         if iIdOperOpcInd <> -1 then
            ParamByName('IDOPEROPCIND').AsInteger     := iIdOperOpcInd;
         ParamByName('VLRDESPESA').AsFloat            := fVlrDespesa;
         if iIdRegra <> -1 then
            ParamByName('IDREGRA').AsInteger          := iIdRegra;
         ParamByName('IDBOLETA').AsString             := sIdBoleta;
         ExecSql;
      end;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Gravação das Despesas.'+''#13+
                E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
end;

function TOpcaoIndice.GeraNumDoc(dDataOper: TDateTime; iCorretora: Integer;
                                 sBoleta: String = ''): String;
begin
   Result := '';
   if (dDataoper > 0) and (iCorretora > 0) then
   begin
      with DMOpcoesIndice, DMOpcoesIndice.qryNumDocumento do
      begin
         Try
            OperComum.LimpaParametros(qryNumDocumento);
            ParamByName('DATAORDEM').AsString := DateToStr(dDataOper);
            ParamByName('IDCORRETVALORES').AsInteger := iCorretora;
            Open;
            if not IsEmpty then
               Result := FieldByName('IDBOLETA').AsString
            else
            begin
               if sBoleta = '' then
                  Result := 'OI-' + Copy(DateToStr(dDataoper),9,2) + '/' +
                            FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' + Copy(DateToStr(dDataoper),9,2)))
               else
                  Result := sBoleta;
            end;
         finally
            Close;
         end;
      end;
   end;
end;

// Alt_1
function TOpcaoIndice.GeraNumDocRev(dDataOper: TDateTime; iCorretora: Integer;
                                   sBoleta: String = ''): String;
begin
   Result := '';
   if (dDataoper > 0) and (iCorretora > 0) then
   begin
      with DMOpcoesIndice, DMOpcoesIndice.qryNumDocumento do
      begin
         Try
            OperComum.LimpaParametros(qryNumDocumento);
            ParamByName('DATAORDEM').AsString := DateToStr(dDataOper);
            ParamByName('IDCORRETVALORES').AsInteger := iCorretora;
            Open;
            if not IsEmpty then
               Result := FieldByName('IDBOLETA').AsString
            else
            begin
               if sBoleta = '' then
                  Result := 'OI-' + Copy(DateToStr(dDataoper),9,2) + '/' +
                            FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' + Copy(DateToStr(dDataoper),9,2)))
               else
                  Result := sBoleta;
            end;
         finally
            Close;
         end;
      end;
   end;
end;

function TOpcaoIndice.BuscaCotacaoLoteAcao(iInvestimento: integer;
                                           dDataRef: TDateTime;
                                           bUsalote: boolean; var fLote: double): double;
begin
    Result := 0;
    fLote  := 0;
    with OperComum, dtmOperComum, dtmOperComum.QryBuscaCotacaoInvest do
    begin
       LimpaParametros(QryBuscaCotacaoInvest);
       ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
       ParamByName('DATACOTACAO').AsDateTime   := dDataRef;
       Open;

       fLote := FieldByName('QTDTITLOTE').AsFloat;

       if (bUsaLote) and (fLote <> 0)then
          Result := FieldByName('VLRCONTABIL').AsFloat / fLote
       else
          Result := FieldByName('VLRCONTABIL').AsFloat;

       Close;
    end;
end;

function TOpcaoIndice.BuscaValorMaxCesta(iOrdem: Integer): double;
begin
   Result := 0;
   with DMOpcoesIndice, DMOpcoesIndice.qryVlrMaxCesta do
   begin
      try
         OperComum.LimpaParametros(qryVlrMaxCesta);
         qryVlrMaxCesta.ParamByName('IDORDEMOPCIND').AsInteger := iOrdem;
         qryVlrMaxCesta.Open;
         if not qryVlrMaxCesta.IsEmpty then
            Result := qryVlrMaxCestaVALMAX.AsFloat;
      finally
         Close;
      end;
   end;
end;

function TOpcaoIndice.GravaBoletaOpcInd(sIdBoleta,sStatus:String;
                                        dDataBoleta:TDateTime;
                                        iForCli, iPlano, iPlanilha, iDocumento:Integer;
                                        sTpMovBoleta:String): Boolean;
begin
   Result := True;
   Try
      with DMOpcoesIndice.qryInsBoletaOpcInd do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryInsDespOpcInd);

         ParamByName('IDBOLETA').AsString          := sIdBoleta;
         ParamByName('STATUS').AsString            := sStatus;
         ParamByName('DATABOLETA').AsDateTime      := dDataBoleta;
         ParamByName('IDFORCLI').AsInteger         := iForCli;
         if iPlano <> -1 then
            ParamByName('PLANO').AsInteger         := iPlano;
         if iPlanilha <> -1 then
            ParamByName('PLNCODIGO').AsInteger     := iPlanilha;
         if iDocumento <> -1 then
            ParamByName('CODDOCUMENTO').AsInteger  := iDocumento;
         ParamByName('TIPMOVBOLETA').AsString      := sTpMovBoleta;

         ExecSql;
      end;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Gravação da Boleta.'+''#13+
                E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
end;

function TOpcaoIndice.UpdStatusOrdemOpcInd(sIdBoleta,sStatus:String): Boolean;
begin
   Result := True;
   Try
      with DMOpcoesIndice.qryUpdStatusOpcInd do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryUpdStatusOpcInd);
         ParamByName('IDBOLETA').AsString  := sIdBoleta;
         ParamByName('STATUS').AsString    := sStatus;
         ExecSql;
      end;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Alteração do Status da Ordem.'+''#13+
                E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
end;

function TOpcaoIndice.UpdStatusBoleta(sIdBoleta,sStatus,iTipoMov:String;
                                      iCorretValores,iPlano,iPlanilha,iDocumento:Integer):boolean;
begin
   Result := True;
   Try
      with DMOpcoesIndice.qryUpdStatusBoleta do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryUpdStatusBoleta);
         ParamByName('IDBOLETA').AsString         := sIdBoleta;
         ParamByName('STATUS').AsString           := sStatus;
         ParamByName('TIPMOVBOLETA').AsString     := iTipoMov;
         if iPlano <> -1 then
            ParamByName('PLANO').AsInteger        := iPlano;
         if iPlanilha <> -1 then
            ParamByName('PLNCODIGO').AsInteger    := iPlanilha;
         if iDocumento <> -1 then
            ParamByName('CODDOCUMENTO').AsInteger := iDocumento;
         ExecSql;
      end;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Alteração do Status da Boleta.'+''#13+
                E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
end;

procedure TOpcaoIndice.BuscaSaldoOpcInd(dDataRef:TDateTime;
                                        iIDBoleta: String = ''; iIDLote: String = '';
                                        iIdInvestimento: Integer = -1);
begin
    with DMOpcoesIndice.qryBuscaSaldoHistOpcInd do
    begin
        OperComum.LimpaParametros(DMOpcoesIndice.qryBuscaSaldoHistOpcInd);
        ParamByName('DATAREF').AsString := DateToStr(dDataRef);
        if iIdInvestimento <> -1 then
           ParamByName('IDINVESTIMENTO').AsInteger := iIdInvestimento;
        if iIDBoleta <> '' then
           ParamByName('IDBOLETA').AsString := iIdBoleta;
        if iIDLote <> '' then
           ParamByName('IDLOTE').AsString := iIDLote;
        Open;
    end;
end;

function TOpcaoIndice.VerificaReversao(iIdInvestimento:Integer;iIdBoleta,dDataRef:String):boolean;
begin
   Result := False;
   OpcaoIndice.BuscaSaldoOpcInd(StrToDate(dDataRef),'','',iIdInvestimento);
   if not DMOpcoesIndice.qryBuscaSaldoHistOpcInd.IsEmpty then
      Result := True;
end;

function TOpcaoIndice.ExcluiOperOpcInd(sIdBoleta,sIdBoletaTRC,dDataRef:String;
                                       prbProgresso: TProgressBar = nil):boolean;
var sBoletaOrig: String;
begin
   Result := False;

   with DMOpcoesIndice do
   begin

      // Exclui as Transferências da Cesta Original
      OperComum.LimpaParametros(qryBuscaTRCCesta);
      //AL_2
      qryBuscaTRCCesta.ParamByName('IDBOLETA').AsString := sIdBoletaTRC;
      qryBuscaTRCCesta.Open;
      if prbProgresso <> nil then
      begin
         prbProgresso.Max := qryBuscaTRCCesta.RecordCount;
         prbProgresso.Position := 0;
      end;
      while not qryBuscaTRCCesta.EOF do
      begin
         if not OperComum.ProcExcluiCustodia(qryBuscaTRCCesta.FieldByName('IDOPERCUSTODIA').AsInteger,
                                             qryBuscaTRCCesta.FieldByName('IDHISTCARTINVORIG').AsInteger,
                                             qryBuscaTRCCesta.FieldByName('IDHISTCARTINVDEST').AsInteger,
                                             StrToDate(dDataRef)) then
            Raise Exception.Create('Erro ao Excluir as Transferências');
         qryBuscaTRCCesta.Next;
         if prbProgresso <> nil then
            prbProgresso.StepIt;
         Application.ProcessMessages;
      end;
      qryBuscaTRCCesta.Close;

      // MARCAR O FLGCALCULA NO REGISTRO ANTERIOR PARA REPROCESSAMENTO

      // EXCLUI HISTOPCIND
      // AL_3 - 29/06/2004
      // Busca a Boleta da operação Original para achar os históricos no caso de Reversão
      qryAuxiliar.Close;
      qryAuxiliar.Sql.Clear;
      qryAuxiliar.Sql.Add('SELECT DISTINCT H.IDBOLETA ');
      qryAuxiliar.Sql.Add('FROM OPERACAOOPCIND O, HISTOPCIND H ');
      qryAuxiliar.Sql.Add('WHERE O.IDBOLETA = '+QuotedStr(sIdBoleta));
      qryAuxiliar.Sql.Add('  AND H.IDOPEROPCIND = O.IDOPEROPCIND');
      qryAuxiliar.Open;

      sBoletaOrig := qryAuxiliar.FieldByName('IDBOLETA').AsString;

      if Trim(sBoletaOrig) = '' then
         sBoletaOrig := sIdBoleta;

      OperComum.LimpaParametros(qrySelHistExclusao);
      qrySelHistExclusao.ParamByName('IDBOLETA').AsString := sIdBoleta;
      qrySelHistExclusao.Open;

      if prbProgresso <> nil then
      begin
         prbProgresso.Max := qrySelHistExclusao.RecordCount;
         prbProgresso.Position := 0;
      end;

      while not qrySelHistExclusao.EOF do
      begin
         // Exclui Atualizações Posteriores                                        
         if not OpcaoIndice.ExcluiAtuOpcInd(qrySelHistExclusaoIDINVESTIMENTO.AsInteger,
                                            dDataRef, sBoletaOrig) then
            Raise Exception.Create('Erro ao Excluir as Atualizações Posteriores');

         // Exclui Operações do Investimento
         OperComum.LimpaParametros(qrySelOperExclusao);
         qrySelOperExclusao.ParamByName('IDINVESTIMENTO').AsInteger := qrySelHistExclusaoIDINVESTIMENTO.AsInteger;
         qrySelOperExclusao.ParamByName('DATAREF').AsString         := dDataRef;
         qrySelOperExclusao.ParamByName('IDBOLETA').AsString := sBoletaOrig;
         qrySelOperExclusao.Open;
         while not qrySelOperExclusao.EOF do
         begin
            if not DeleteHistOpcIndXItens(qrySelOperExclusaoIDHISTOPCIND.AsInteger) then
               Exit;

            if not DeleteHistOpcInd(qrySelOperExclusaoIDHISTOPCIND.AsInteger) then
               Exit;

            if not DeleteOperOpcInd(qrySelOperExclusaoIDOPEROPCIND.AsInteger) then
               Exit;

            if not DeleteDespesaOpcInd(sIdBoleta) then
               Exit;

            qrySelOperExclusao.Next;
         end;

         // Update com NULL na Cesta da Vigência
         qryAuxiliar.Close;
         qryAuxiliar.SQL.Clear;
         qryAuxiliar.SQL.Text := 'UPDATE CESTAOPCIND SET IDBOLETA = NULL WHERE IDBOLETA = ' + QuotedStr(qrySelHistExclusaoIDBOLETA.AsString + '');
         qryAuxiliar.ExecSQL;
         qryAuxiliar.Close;

         if not DeleteBoletaOpcInd(qrySelHistExclusaoIDBOLETA.AsString) then
            Exit;

         if not DeleteFinanceiro(qrySelHistExclusaoCODDOCUMENTO.AsInteger) then
            Exit;

         if not DeleteContabil(qrySelHistExclusaoPLNCODIGO.AsInteger) then
            Exit;

         qrySelHistExclusao.Next;

         if prbProgresso <> nil then
            prbProgresso.StepIt;

         Application.ProcessMessages;
      end;

      // Altera o Status da Ordem para Aberto (A)
      if not AlteraStatusOpcInd(sIdBoleta,'A') then
         Exit;

      qrySelHistExclusao.Close;
      qrySelOperExclusao.Close;
   end;

   Result := True;
end;

function TOpcaoIndice.ExcluiAtuOpcInd(iIdInvestimento:Integer;dDataRef,iIdBoleta:String;
                                      fraMsg: TfraMensagem = nil):boolean;
var iPlanilha: Integer;
begin
   Result := False;
   with DMOpcoesIndice, DMOpcoesIndice.qrySelAtuExclusao do
   begin
      try
         OperComum.LimpaParametros(qrySelAtuExclusao);
         ParamByName('IDINVESTIMENTO').AsInteger := iIdInvestimento;
         ParamByName('DATAREF').AsString         := dDataRef;
         ParamByName('IDBOLETA').AsString        := iIdBoleta;
         Open;
         if fraMsg <> nil then
         begin
            fraMsg.Max := RecordCount;
            fraMsg.Pos := 0;
            fraMsg.Mostra;
         end;

         while not EOF do
         begin
            if fraMsg <> nil then
               fraMsg.Mes := 'Excluindo dia ' + qrySelAtuExclusaoDATAHISTOPCIND.AsString;

            if not qrySelAtuExclusaoPLNCODIGO.IsNull then
            begin
               DMOpcoesIndice.qryAux.SQL.Clear;
               DMOpcoesIndice.qryAux.SQL.Add('UPDATE HISTOPCIND SET PLNCODIGO = NULL ');
               DMOpcoesIndice.qryAux.SQL.Add('WHERE PLNCODIGO = ' + DMOpcoesIndice.qrySelAtuExclusaoPLNCODIGO.AsString);
               DMOpcoesIndice.qryAux.ExecSQL;
            end;

            if not DeleteHistOpcIndXItens(DMOpcoesIndice.qrySelAtuExclusaoIDHISTOPCIND.AsInteger) then
               Exit;

            if not DeleteHistOpcInd(DMOpcoesIndice.qrySelAtuExclusaoIDHISTOPCIND.AsInteger) then
               Exit;

            if not DeleteContabil(DMOpcoesIndice.qrySelAtuExclusaoPLNCODIGO.AsInteger) then
               Exit;

            Next;
            if fraMsg <> nil then
               fraMsg.Incrementa;
         end;
         Result := True;
      finally
         Close;
         if fraMsg <> nil then
            fraMsg.Mostra;
      end;
   end;
end;

// Exclui a HISTOPCINDXITENS
function TOpcaoIndice.DeleteHistOpcIndXItens(iIdHistOpcInd:Integer):boolean;
begin
   Result := True;
   Try
      with DMOpcoesIndice.qryDelHistOpcIndXItens do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryDelHistOpcIndXItens);
         ParamByName('IDHISTOPCIND').AsInteger := iIdHistOpcInd;
         ExecSql;
      end;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Exclusão do Item do Histórico.'+''#13+
                E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
end;

// Exclui a HISTOPCIND
function TOpcaoIndice.DeleteHistOpcInd(iIdHistOpcInd:Integer):boolean;
begin
   Result := True;
   Try
      with DMOpcoesIndice.qryDelHistOpcInd do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryDelHistOpcInd);
         ParamByName('IDHISTOPCIND').AsInteger := iIdHistOpcInd;
         ExecSql;
      end;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Exclusão do Histórico.'+''#13+
                E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
end;

// Exclui a OPERACAOOPCIND
function TOpcaoIndice.DeleteOperOpcInd(iIdOperOpcInd:Integer):boolean;
begin
   Result := True;
   Try
      with DMOpcoesIndice.qryDelOperOpcInd do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryDelOperOpcInd);
         ParamByName('IDOPEROPCIND').AsInteger := iIdOperOpcInd;
         ExecSql;
      end;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Exclusão da Operação.'+''#13+
                E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
end;

function TOpcaoIndice.DeleteDespesaOpcInd(iIdBoleta:String):boolean;
begin
   Result := True;
   Try
      with DMOpcoesIndice.qryDelDespesOpcInd do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryDelDespesOpcInd);
         ParamByName('IDBOLETA').AsString := iIdBoleta;
         ExecSql;
      end;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Exclusão da Despesa da Operac.'+''#13+
                E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
end;

// ALTERA O STATUS DE ORDEM FECHADA
function TOpcaoIndice.AlteraStatusOpcInd(sIdBoleta,sStatus:String):boolean;
begin
   Result := True;
   Try
      with DMOpcoesIndice.qryUpdStatusOpcInd do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryUpdStatusOpcInd);
         ParamByName('IDBOLETA').AsString := sIdBoleta;
         ParamByName('STATUS').AsString   := sStatus;
         ExecSql;
      end;
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Alteração do Status da Ordem.'+''#13+
                E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
end;

// EXCLUI A BOLETA
function TOpcaoIndice.DeleteBoletaOpcInd(sIdBoleta:String):boolean;
begin
   Try
      with DMOpcoesIndice.qryDelBoletaHistOpcInd do
      begin
         OperComum.LimpaParametros(DMOpcoesIndice.qryDelBoletaHistOpcInd);
         ParamByName('IDBOLETA').AsString := sIdBoleta;
         ExecSql;
      end;
      Result := True;      
   except on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na Exclusão da Boleta.'+''#13+
                E.Message,'Mensagem do Sistema ', mtWarning,[mbOK],0);
      end;
   end;
end;

function TOpcaoIndice.MontaHistorico(sNatOper,sDescOper,sDescInv: String): String;
begin
   if sNatOper = 'N' then  // Atualização
      Result := Copy('ATUALIZAÇÃO - ' + Trim(sDescInv),1,60)
   else                    // Operação
      Result := Copy(Trim(sDescOper) + ' / ' + Trim(sDescInv),1,60);

end;

function TOpcaoIndice.ContabilizaOpcInd(fValor:Double;
                                        iPlano, iForCli,iUnidNegoc,iSubContaDeb, iSubContaCred,iPlanoPatro :integer;
                                        sHistorico, sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,sTipoPer,
                                        sRecPagNao : string;
                                        dDataProc : TDateTime;
                                        var iPlanilha : integer;
                                        iUsuarioOrigem: Integer = -1):boolean;
var
   sMensErro,sSql : string;
   bMostraMsg : boolean;
begin
   Result := True;

   //AL_9
   if pRPI.FLGINTCONTABRV = 'N' then Exit;

   // AL_4
   //AL_5
   if not CtrlInvContab.TestaPeriodo(DateToStr(dDataProc), 2, 8) then
   begin
      Result := False;
      Raise Exception.Create(CtrlInvContab.MessageInfo);
      Exit;
   end;

   if iPlanilha < 0 then
      iPlanilha := 0;

   // Monta o Histórico contábil com o plano e patrocinadora
   DMOpcoesIndice.qryAux.Close;
   DMOpcoesIndice.qryAux.SQL.Clear;
   sSql := 'SELECT PL.NOME AS PLANO,PE.NOME AS PATRO, PA.IDPATRO, PA.IDPLANOPREV ';
   sSql := sSql + 'FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL WHERE';
   sSql := sSql + '(PA.IDPLANPREVCTBPATR = '''+IntToStr(iPlanoPatro)+''') AND';
   sSql := sSql + '(PA.IDPATRO = PE.IDPESSOA)  AND';
   sSql := sSql + '(PA.IDPLANOPREV = PL.IDPLANOPREV)';
   DMOpcoesIndice.qryAux.SQL.Add(sSQL);
   DMOpcoesIndice.qryAux.Open;

   sHistorico := sHistorico +' '+DMOpcoesIndice.qryAux.FieldByName('PLANO').AsString+' - '+
                 DMOpcoesIndice.qryAux.FieldByName('PATRO').AsString;

   if not(OperComum.LancamentoContabil(Sistema.IdEmpresa, Sistema.IdModulo, iPlano, iSubContaDeb,
          iSubContaCred, iUnidNegoc, iForCli,
          DMOpcoesIndice.qryAux.FieldByName('IDPLANOPREV').AsInteger,
          DMOpcoesIndice.qryAux.FieldByName('IDPATRO').AsInteger,
          sContaDeb, sContaCred, sCentroCustoDeb,
          sCentroCustoCred, sHistorico, sTipoPer, sRecPagNao, dDataProc, ABS(fValor),
          bMostraMsg, iPlanilha, sMensErro, iUsuarioOrigem) ) then
   begin
      Result := False;
      Exit;
   end;
   DMOpcoesIndice.qryAux.Close;
end;

function TOpcaoIndice.IntegraCapCarOpcInd(fValor:Double;iForCli, iPlano, iTipoDoc,iUnidNegoc,iSubContaCred,iPlanilha : integer;
                                          sRecPagNao,sTipoRecDes,sContaDeb, sContaCred,sCentroCustoCred,
                                          sDataLanc,sDataVenc,sCentroRespon,sHistorico : string;
                                          var iDocumento : integer; iUsuarioOrigem: Integer = -1): boolean;
var
   sMensErro,sComplemento,sStatus,sOperacao,sContaDoc,sIdEmpresa,sDebCre : string;
   iPortador,iNumFatura,iNumLancamento : integer;
   fNoDocumento : Double;
begin

   if iUsuarioOrigem = -1 then
      iUsuarioOrigem := Sistema.IdUsuario;

   Result := True;

   fValor := abs(fValor);

   if Trim(sRecPagNao) = '' then
   begin
      sMensErro := 'Tipo de Recebimento/Desembolso não especificado.';
      Result := False;
      Exit;
   end;

   // O Item não tem lançamento Financeiro - Alteração para poupança bloqueada 29/05/2003
   if Trim(sRecPagNao) = 'N' then
      Exit;

   if Trim(sTipoRecDes) = '' then
   begin
      sMensErro := 'Tipo de Recebimento/Desembolso não especificado.';
      Result := False;
      Exit;
   end;

   if iDocumento = -1 then
   begin

      // Prepara um novo documento
      CtrlInvContab.Documento.Prepare;

      // Gera o identificador incremental da tabela DOCUMENTO
      if CtrlInvContab.Documento.GetDocSequence then
         iDocumento := CtrlInvContab.Documento.CodDocumento;

      // Gera Número de Documento
      CtrlInvContab.Documento.GetNoDocumento;
      fNoDocumento := CtrlInvContab.Documento.NoDocumento;

      iPortador         := -1;
      sComplemento      := '79';
      sStatus           := '';
      iNumFatura        := 0;
      sOperacao         := '2';
      if sRecPagNao[1] = 'P' then
         sContaDoc := sContaCred
      else
         sContaDoc := sContaDeb;

      // Parametros para a Segregação // Verificar
      CtrlInvContab.Plano := iPlano;
      // Busca PlanoPrev e Patrocinadora
      CtrlInvContab.GetPlanoPatro(iPlanPrevCtbPatro);

      // Cria Documento
      if not CtrlInvContab.Documento.SetValues(iDocumento,
                                               fNoDocumento, sComplemento, sStatus,
                                               sRecPagNao[1], sOperacao,
                                               '' {sNumslip}, ''{sNumleitcodbarras},
                                               sContaDoc, sCentroCustoCred,
                                               ''{sNossonumero}, ''{sNumdigcodbarras}, ''{sGrupodoc}, ''{sFlgemitelancbaix},
                                               ''{sFlgconfirmarecpag}, ''{sEmisbloq}, ''{sReferencia}, ''{sObs},
                                               StrToDate(sDataVenc) {dDatavencto}, StrToDate(sDataLanc) {dDataemissao},
                                               StrToDate(sDataVenc) {dDataprogramada}, 0{dDataremessa}, 0{dDatalimite}, 0{dDatacorrecao},
                                               0{rVlrmulta}, 0{rValorjuros}, 0{rValordesconto}, 0{rPercjurossimples}, 0{rPercjurosatuarial},
                                               iTipoDoc, Sistema.IdEmpresa, Sistema.IdModulo, iForCli, iNumFatura,
                                               0{liIdcbancaria}, iUnidNegoc, iPlano, 0{liNumcpbaixa}, 0{liNumapgr},
                                               pRPI.MOECODIGO, 0{liLotetransmissao}, -1{liIndicecorrecao},
                                               iUsuarioOrigem, Sistema.idEmpresa, 1{liFlgnaoconciliado}, 0{liControleremessa},
                                               iSubContaCred, iPortador, 0{liCodgrupocnab}, 0{liCodgeradorinss}, -1{liCodforma},
                                               StrToDate(sDataVenc) {dDataDisp},
                                               CtrlInvContab.CriterioSegregacao {iIdSegregaCriter: integer = -1}) then
         Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);


      if sRecPagNao <> 'N' then
      begin
         // Cria Rateio
         if not CtrlInvContab.Documento.RateioDocumSetValues(
                              fValor, 0{rValorOM}, 0{rVlrresorcamen},
                              0{liIdrateiodocum}, Sistema.idEmpresa {liIdpessoa},
                              iDocumento, iUnidNegoc, 0{liMoecodigo}, iUsuarioOrigem,
                              0{liIdreservaorcamen},
                              iPlano, iPlanoPrevContab, iPatrocinadora, pRPI.IDPROGRAMA,
                              0{liIdprocesso}, Sistema.idEmpresa,
                              sTipoRecDes, sRecPagNao[1], sCentroRespon,
                              sCentroCustoCred, ''{sNumimovel}) then
            Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
      end;

      if ((iDocumento <> -1) and (fValor <> 0)) then
      begin
         if sRecPagNao[1] = 'P' then
            sDebCre := 'C'
         else
            sDebCre := 'D';
         // Cria LanctoDocum em 3 camadas
         if not CtrlInvContab.Documento.LancoDocumSetValues(
                              StrToDate(sDataLanc), iDocumento, 0 {iNumLancamento},
                              fValor, 0{rValorOM}, fValor,
                              iUnidNegoc, CtrlInvContab.Planilha, 0{liNumlotemanual},
                              iUsuarioOrigem, Sistema.IdEmpresa,
                              0{liIdnflivro}, 0{liEstorno}, iTipoDoc, 0{liCoddocinss}, 0{liCodalterador},
                              sOperacao,  ''{sNumrecibo}, ''{sNumnf}, ''{sNumfatura},
                              sHistorico, ''{sFlgtipofatura}, ''{sFlgrecebeunf}, ''{sFlgfatemitida},
                              sDebCre, Sistema.IdModulo, iPlano,
                              Sistema.UsaPlanoPatro) then
            Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
         // Finaliza o Documento e gera o CodDocumento
         if CtrlInvContab.Documento.DocumentoPendente then
         begin
            if not CtrlInvContab.Documento.Insert then
               Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
         end;
         // gera o identificador incremental da tabela LANCAMENTO
      end;

   end;
end;

function TOpcaoIndice.DeleteFinanceiro(iDocumento:Integer):boolean;
begin
   //AL_7 - Ini
   Try
      if not CtrlInvContab.Documento.Delete(iDocumento) then
         Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
      Result := True;
   except
      on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na exclusão de lançamentos financeiros' + #13 +
                'Código interno do documento: ' + IntToStr(iDocumento) + #13 +
                'Mensagem: ' + E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
   //AL_7 - Fim
end;

function TOpcaoIndice.DeleteContabil(iPlanilha:Integer):boolean;
begin
   //AL_7 - Ini
   Try
      // Exclui Lançamentos Contábeis da Planilha sem excluir a Planilha
      //AL_6 - Passa a valer a exclusão em 3 camadas
      if not CtrlInvContab.InvExcluiLanc(iPlanilha, 0, Sistema.UsaPlanoPatro, False) then
         Raise Exception.Create(CtrlInvContab.MessageInfo);

      Result := True;
   except
      on E: Exception do
      begin
         Result := False;
         MsgDlg('Ocorreu problema na exclusão de lançamentos contábeis.'+''#13+
                'Código interno da planilha: ' + IntToStr(iPlanilha) + #13 +
                'Mensagem: ' + E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
      end;
   end;
   //AL_7 - Fim
end;

function TOpcaoIndice.GravaItensHistOpcInd(iIdHistOpcInd :Integer;
                                           fQtd,fSldQtd,
                                           fVlrCompra, fSldCompra,
                                           fVlrVencto, fSldVencto,
                                           fVlrCesta, fSldCesta,
                                           fVlrAtual, fSldAtual,
                                           fVlrMercado, fSldMercado,
                                           fVlrAjusteDia, fSldAjusteDia,
                                           fVlrAjusteCesta, fSldAjusteCesta: Double):boolean;
begin
   Result := True;
   Try
      // -1 = Quantidade
      if not OpcaoIndice.GravaHistOpcIndXItens(iIdHistOpcInd,-1,-1,fQtd,fSldQtd) then
         Abort;
      // -2 = Valor na Compra
      if not OpcaoIndice.GravaHistOpcIndXItens(iIdHistOpcInd,-2,-1,fVlrCompra,fSldCompra)then
         Abort;
      // -3 = Valor no Vencimento
      if not OpcaoIndice.GravaHistOpcIndXItens(iIdHistOpcInd,-3,-1,fVlrVencto,fSldVencto)then
         Abort;
      // -4 = Ajuste do Dia
      if not OpcaoIndice.GravaHistOpcIndXItens(iIdHistOpcInd,-4,-1,fVlrAjusteDia,fSldAjusteDia)then
         Abort;
      // -5 = Valor Atual
      if not OpcaoIndice.GravaHistOpcIndXItens(iIdHistOpcInd,-5,-1,fVlrAtual,fSldAtual)then
         Abort;
      // -6 = Valor Mercado
      if not OpcaoIndice.GravaHistOpcIndXItens(iIdHistOpcInd,-6,-1,fVlrMercado,fSldMercado)then
         Abort;
      // -7 = Valor da Cesta
      if not OpcaoIndice.GravaHistOpcIndXItens(iIdHistOpcInd,-7,-1,fVlrCesta,fSldCesta)then
         Abort;
      // -8 = Ajuste da Cesta
      if not OpcaoIndice.GravaHistOpcIndXItens(iIdHistOpcInd,-8,-1,fVlrAjusteCesta,fSldAjusteCesta)then
         Abort;
   except on E: Exception do
      begin
         Result := False;
      end;
   end;
end;

function TOpcaoIndice.AtualizaAjusteOpcInd(iHistAlta, iHistBaixa, iHistCesta, iItem: Integer;
                                           fVlrAjusteCesta: Double;
                                           iIdBoleta,iIdLote,dDataRef:String): Boolean;
//AL_7
var fSldAjuste, fVlrAjuste{, fVlrAjusteAlta, fVlrAjusteBaixa}: Double;
    iPlano, iPlanilha, iTipoDesp : Integer;
begin
   Result := True;
   try
      // Atualiza o ajuste
      with DMOpcoesIndice, DMOpcoesIndice.qryUpdHistOpcIndXItens do
      begin

         // Alterado por definição da Funcef (Roseli(GESIS) e Alessandro(GECOR)
         // Passa a utilizar a trava de alta ou a de baixa conforme a posição da cesta
         // Procura Saldo de Ajuste na Trava de Baixa
         OperComum.LimpaParametros(qryBuscaSaldoAjuste);
         qryBuscaSaldoAjuste.ParamByName('IDHISTOPCIND').AsInteger := iHistBaixa;
         qryBuscaSaldoAjuste.Open;
         fSldAjuste := qryBuscaSaldoAjusteSALDOAJUSTE.AsFloat;
         qryBuscaSaldoAjuste.Close;
         if fSldAjuste = 0 then
         begin
            OperComum.LimpaParametros(qryBuscaSaldoAjuste);
            qryBuscaSaldoAjuste.ParamByName('IDHISTOPCIND').AsInteger := iHistAlta;
            qryBuscaSaldoAjuste.Open;
            fSldAjuste := qryBuscaSaldoAjusteSALDOAJUSTE.AsFloat;
            qryBuscaSaldoAjuste.Close;
         end;

         // Ajuste Positivo
         if iItem = -9 then
         begin
            if fSldAjuste > 0 then
               fVlrAjuste := fVlrAjusteCesta - fSldAjuste
            else if fSldAjuste < 0 then
               // Está compensando o valor do ajuste para a mesma perna
               fVlrAjuste := (fSldAjuste * -1) + fVlrAjusteCesta
            else
               fVlrAjuste := fVlrAjusteCesta;

            if fVlrAjuste < 0 then
               iItem := -10;
         end
         else
         // Ajuste Negativo
         if iItem = -10 then
         begin
            if fSldAjuste > 0 then
               fVlrAjuste := (fSldAjuste * -1) + fVlrAjusteCesta
            else if fSldAjuste < 0 then
               fVlrAjuste := fVlrAjusteCesta - fSldAjuste
            else
               fVlrAjuste := fVlrAjusteCesta;

            if fVlrAjuste > 0 then
               iItem := -9;
         end
         else
         // Ajuste de Saldo
         begin
            fVlrAjuste := fSldAjuste * -1;
            if fVlrAjuste > 0 then
               iItem := -9
            else if fVlrAjuste < 0 then
               iItem := -10
            else iItem := 0;
         end;

         fVlrAjuste := OperComum.Trunca(fVlrAjuste,2);

         if fVlrAjuste <> 0 then
         begin
            iPlanilha  := -1;

            if fVlrAjusteCesta > 0 then
            begin
               // Zera o saldo de ajuste na Trava de Alta
               OperComum.LimpaParametros(qryBuscaSaldoAjuste);
               qryBuscaSaldoAjuste.ParamByName('IDHISTOPCIND').AsInteger := iHistAlta;
               qryBuscaSaldoAjuste.Open;

               OperComum.LimpaParametros(qryUpdHistOpcIndXItens);
               ParamByName('IDHISTOPCIND').AsInteger := iHistAlta;
               ParamByName('IDITEMOPCIND').AsInteger := -8;
               ParamByName('VLRHISTOPCIND').AsFloat  := (qryBuscaSaldoAjusteSALDOAJUSTE.AsFloat * -1);
               ParamByName('SLDHISTOPCIND').AsFloat  := 0;
               ParamByName('IDREGRAUSADA').Clear;
               ExecSql;
               qryBuscaSaldoAjuste.Close;

               // Grava Ajuste na trava de Baixa
               qryBuscaSaldoHistOpcInd.Locate('IDHISTOPCIND', iHistBaixa, []);
               OperComum.LimpaParametros(qryUpdHistOpcIndXItens);
               ParamByName('IDHISTOPCIND').AsInteger := qryBuscaSaldoHistOpcIndIDHISTOPCIND.AsInteger;
               ParamByName('IDITEMOPCIND').AsInteger := -8;
               ParamByName('VLRHISTOPCIND').AsFloat  := fVlrAjuste;
               ParamByName('SLDHISTOPCIND').AsFloat  := fSldAjuste + fVlrAjuste;
               ParamByName('IDREGRAUSADA').Clear;
               ExecSql;
            end
            else if fVlrAjusteCesta < 0 then
            begin
               // Zera o saldo de ajuste na Trava de Baixa
               OperComum.LimpaParametros(qryBuscaSaldoAjuste);
               qryBuscaSaldoAjuste.ParamByName('IDHISTOPCIND').AsInteger := iHistBaixa;
               qryBuscaSaldoAjuste.Open;
               OperComum.LimpaParametros(qryUpdHistOpcIndXItens);
               ParamByName('IDHISTOPCIND').AsInteger := iHistBaixa;
               ParamByName('IDITEMOPCIND').AsInteger := -8;
               ParamByName('VLRHISTOPCIND').AsFloat  := (qryBuscaSaldoAjusteSALDOAJUSTE.AsFloat * -1);
               ParamByName('SLDHISTOPCIND').AsFloat  := 0;
               ParamByName('IDREGRAUSADA').Clear;
               ExecSql;
               qryBuscaSaldoAjuste.Close;

               // Grava Ajuste na trava de Alta
               qryBuscaSaldoHistOpcInd.Locate('IDHISTOPCIND', iHistAlta, []);
               OperComum.LimpaParametros(qryUpdHistOpcIndXItens);
               ParamByName('IDHISTOPCIND').AsInteger := qryBuscaSaldoHistOpcIndIDHISTOPCIND.AsInteger;
               ParamByName('IDITEMOPCIND').AsInteger := -8;
               ParamByName('VLRHISTOPCIND').AsFloat  := fVlrAjuste;
               ParamByName('SLDHISTOPCIND').AsFloat  := fSldAjuste + fVlrAjuste;
               ParamByName('IDREGRAUSADA').Clear;
               ExecSql;
            end;

            // Contabiliza a Operação
            if iITem = -9 then
               iTipoDesp := -29
            else if iItem = -10 then
               iTipoDesp := -30;

            //AL_7
            // AL_10
            if CtrlInvContab.BuscaPadrLanc.Executa(-1, //Renan CGPC
                                                   0, 2, -92, iTipoDesp, -1,
                                                   qryBuscaSaldoHistOpcIndIDCARTEIRAINVEST.AsInteger,
                                                   qryBuscaSaldoHistOpcIndIDPLANPREVCTBPATR.AsInteger,
                                                   Abs(fVlrAjuste), '', 'DOP') = 0 then
            begin
               //AL_7
               if not OpcaoIndice.ContabilizaOpcInd(Abs(fVlrAjuste),
                                                    CtrlInvContab.BuscaPadrLanc.Plano,
                                                    qryBuscaSaldoHistOpcIndIDCORRETVALORES.AsInteger,
                                                    CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                    CtrlInvContab.BuscaPadrLanc.SubContaDeb,
                                                    CtrlInvContab.BuscaPadrLanc.SubContaCre,
                                                    qryBuscaSaldoHistOpcIndIDPLANPREVCTBPATR.AsInteger,
                                                    CtrlInvContab.BuscaPadrLanc.Historico,
                                                    CtrlInvContab.BuscaPadrLanc.ContaDeb,
                                                    CtrlInvContab.BuscaPadrLanc.ContaCre,
                                                    CtrlInvContab.BuscaPadrLanc.CentroCustoDeb,
                                                    CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                    CtrlInvContab.BuscaPadrLanc.TipoPer,
                                                    CtrlInvContab.BuscaPadrLanc.RecPagNao,
                                                    StrToDate(dDataRef),iPlanilha,-1) then
                  Abort;
            end
            else
            begin
               if iItem = -9 then
                  Raise Exception.Create('Falta Parametrização Contábil para Ajuste Positivo da Cesta')
               else if iItem = -10 then
                  Raise Exception.Create('Falta Parametrização Contábil para Ajuste Negativo da Cesta')
               else Abort;
            end;
            // Gravar Planilha
            OperComum.LimpaParametros(qryUpdPlanilhaHist, True);
            qryUpdPlanilhaHist.ParamByName('PLNCODIGO').AsInteger       := iPlanilha;
            qryUpdPlanilhaHist.ParamByName('IDBOLETA').AsString         := iIdBoleta;
            qryUpdPlanilhaHist.ParamByName('IDLOTE').AsString           := iIdLote;
            qryUpdPlanilhaHist.ParamByName('DATAHISTOPCIND').AsString   := dDataRef;
            qryUpdPlanilhaHist.ExecSQL;
         end;
      end;
   except
      Result := False;
   end;
end;

function TOpcaoIndice.AtualizaSaldosOpcInd(dDataRef:TDateTime;
                                           sIdBoleta: String = '';
                                           sIdLote: String = '';
                                           fraMsg: TfraMensagem = nil): Boolean;
var
   sLote,sBoleta, sMes : String;
   iItem, iHistAlta, iHistBaixa, iCartAlta, iCartBaixa, iHist, iHistCesta: Integer;
   fValor, fVlrCesta, fVlrMaior, fVlrMenor, fVlrAjuste: Double;
   bFirst, bEof : boolean;
   bmReg: TBookmark;
   fQtd, fVlrCompra,fVlrVencto,fVlrAtual : Double;
   fVlrMercado,fVlrAjusteDia,fVlrAjusteCesta : Double;
   fSldQtd,fSldCompra,fSldVencto,fSldAtual : Double;
   fSldMercado,fSldAjusteDia,fSldCesta,fSldAjusteCesta : Double;
   iIdHistOpcInd, iMax, iPos, iTipoOper : Integer;
   RegraAtuOpcInc: TRegra;
begin
   try
      RegraAtuOpcInc              := TRegra.Create(Application);
      RegraAtuOpcInc.DatabaseName := 'BaseDados';
      RegraAtuOpcInc.TipoCliente  := tcFundacao;

      Result := True;
      with DMOpcoesIndice do
      begin
         try
            // Capta a posição do ProgressBar
            if fraMsg <> nil then
            begin
               iMax := fraMsg.Max;
               iPos := fraMsg.Pos;
               sMes := fraMsg.Mes;
            end;

            // Busca os Saldos na data
            OpcaoIndice.BuscaSaldoOpcInd(dDataRef, sIdBoleta, sIdLote);
            qryBuscaSaldoHistOpcInd.First;
            while not qryBuscaSaldoHistOpcInd.EOF do
            begin
               // Exclui Atualizações Posteriores
               if not OpcaoIndice.ExcluiAtuOpcInd(qryBuscaSaldoHistOpcIndIDINVESTIMENTO.AsInteger,
                                                  DateToStr(dDataRef),
                                                  qryBuscaSaldoHistOpcIndIDBOLETA.AsString,
                                                  fraMsg) then
                   Abort;
               qryBuscaSaldoHistOpcInd.Next;
            end;
            // Volta a posição que estava antes da rotina acima
            if fraMsg <> nil then
            begin
               fraMsg.Max := iMax;
               fraMsg.Pos := iPos;
               fraMsg.Mes := sMes;
            end;

            // Busca Saldos do Investimento Já com as Atualizações deletadas
            OpcaoIndice.BuscaSaldoOpcInd(dDataRef, sIdBoleta, sIdLote);
            qryBuscaSaldoHistOpcInd.First;
            while not qryBuscaSaldoHistOpcInd.EOF do
            begin
               // AL_3 - Faz Não Exercício automático
               if ((qryBuscaSaldoHistOpcIndDTAVENCTO.AsDateTime = dDataRef) and
                   (qryBuscaSaldoHistOpcIndSLDQTDHISTOPCIND.AsFloat > 0)) then
               begin

                  qryAuxiliar.Close;
                  qryAuxiliar.Sql.Clear;
                  qryAuxiliar.Sql.Add('SELECT IDTIPOOPERACAO ');
                  qryAuxiliar.Sql.Add('FROM OPERACAOOPCIND ');
                  qryAuxiliar.Sql.Add('WHERE IDBOLETA = '+QuotedStr(qryBuscaSaldoHistOpcIndIDBOLETA.AsString));
                  qryAuxiliar.Sql.Add('  AND IDINVESTIMENTO = '+qryBuscaSaldoHistOpcIndIDINVESTIMENTO.AsString);
                  qryAuxiliar.Open;

                  // VENDA DE OPÇÕES DE COMPRA (INDICE)
                  if qryAuxiliar.FieldByName('IDTIPOOPERACAO').AsInteger = -86 then
                     iTipoOper := -85
                  // COMPRA DE OPÇÕES DE VENDA (INDICE)
                  else if qryAuxiliar.FieldByName('IDTIPOOPERACAO').AsInteger = -88 then
                     iTipoOper := -89
                  else
                     iTipoOper := qryAuxiliar.FieldByName('IDTIPOOPERACAO').AsInteger;

                  qryAuxiliar.Close;

                  // Capta Novo ID de Histórico
                  iIdHistOpcInd := LeUltRegistro(nil, 'HISTOPCIND');
                  //Grava HistOpcInd
                  if not OpcaoIndice.GravaHistOpcInd(iIdHistOpcInd,
                                                     qryBuscaSaldoHistOpcIndIDOPEROPCIND.AsInteger,
                                                     qryBuscaSaldoHistOpcIndIDINVESTIMENTO.AsInteger,
                                                     qryBuscaSaldoHistOpcIndIDCARTEIRAINVEST.AsInteger,
                                                     iTipoOper,
                                                     qryBuscaSaldoHistOpcIndIDTIPOINVEST.AsInteger,
                                                     qryBuscaSaldoHistOpcIndIDPLANPREVCTBPATR.AsInteger,
                                                     qryBuscaSaldoHistOpcIndIDCARTEIRAGERENC.AsInteger,
                                                     -1,
                                                     qryBuscaSaldoHistOpcIndIDLOTE.AsString,
                                                     qryBuscaSaldoHistOpcIndIDBOLETA.AsString,
                                                     'Não Exercício de ' + qryBuscaSaldoHistOpcIndDESCINVESTIMENTO.AsString,
                                                     'OPE',
                                                     '',
                                                     dDataRef,
                                                     0, 0, 0, 0) then
                     Abort;

                  // Gravar os Itens do Historico
                  fQtd             := qryBuscaSaldoHistOpcIndSLDQTDHISTOPCIND.AsFloat;
                  fSldQtd          := 0;
                  if qryBuscaSaldoHistXItens.Locate('IDITEMOPCIND', -2, []) then
                  begin
                     fVlrCompra    := qryBuscaSaldoHistOpcIndVLRCOMPRA.AsFloat;
                     fSldCompra    := 0;
                  end;

                  if qryBuscaSaldoHistXItens.Locate('IDITEMOPCIND', -3, []) then
                  begin
                     fVlrVencto    := qryBuscaSaldoHistOpcIndVLRVENCTO.AsFloat;
                     fSldVencto    := 0;
                  end;

                  if qryBuscaSaldoHistXItens.Locate('IDITEMOPCIND', -4, []) then
                  begin
                     fVlrAjusteDia := qryBuscaSaldoHistOpcIndAJUSTEDIA.AsFloat;
                     fSldAjusteDia := 0;
                  end;

                  if qryBuscaSaldoHistXItens.Locate('IDITEMOPCIND', -5, []) then
                  begin
                     fVlrAtual     := qryBuscaSaldoHistOpcIndVLRATEHOJE.AsFloat;
                     fSldAtual     := 0;
                  end;

                  if qryBuscaSaldoHistXItens.Locate('IDITEMOPCIND', -6, []) then
                  begin
                     fVlrMercado   := qryBuscaSaldoHistXItensSLDHISTOPCIND.AsFloat;
                     fSldMercado   := 0;
                  end;

                  if qryBuscaSaldoHistXItens.Locate('IDITEMOPCIND', -7, []) then
                  begin
                     fVlrCesta     := OperComum.Trunca(OpcaoIndice.BuscaVlrAtuCesta(qryBuscaSaldoHistOpcIndIDCESTAOPCIND.AsInteger, dDataRef),2);
                     fSldCesta     := 0;
                  end;

                  if qryBuscaSaldoHistXItens.Locate('IDITEMOPCIND', -8, []) then
                  begin
                     fVlrAjusteCesta := qryBuscaSaldoHistXItensSLDHISTOPCIND.AsFloat;
                     fSldAjusteCesta := 0;
                  end;

                  if not OpcaoIndice.GravaItensHistOpcInd(iIdHistOpcInd,
                                                          fQtd, fSldQtd,
                                                          fVlrCompra, fSldCompra,
                                                          fVlrVencto, fSldVencto,
                                                          fVlrCesta, fSldCesta,
                                                          fVlrAtual, fSldAtual,
                                                          fVlrMercado, fSldMercado,
                                                          fVlrAjusteDia, fSldAjusteDia,
                                                          fVlrAjusteCesta, fSldAjusteCesta) then
                     Abort;

                  // Atualiza o próximo investimento
                  qryBuscaSaldoHistOpcInd.Next;
                  Continue;
               end;
               // AL_3 - Fim

               // Capta Novo ID de Histórico
               iIdHistOpcInd := LeUltRegistro(nil, 'HISTOPCIND');
               //Grava HistOpcInd
               if not OpcaoIndice.GravaHistOpcInd(iIdHistOpcInd,
                                                  qryBuscaSaldoHistOpcIndIDOPEROPCIND.AsInteger,
                                                  qryBuscaSaldoHistOpcIndIDINVESTIMENTO.AsInteger,
                                                  qryBuscaSaldoHistOpcIndIDCARTEIRAINVEST.AsInteger,
                                                  -92,
                                                  qryBuscaSaldoHistOpcIndIDTIPOINVEST.AsInteger,
                                                  qryBuscaSaldoHistOpcIndIDPLANPREVCTBPATR.AsInteger,
                                                  qryBuscaSaldoHistOpcIndIDCARTEIRAGERENC.AsInteger,
                                                  -1,
                                                  qryBuscaSaldoHistOpcIndIDLOTE.AsString,
                                                  qryBuscaSaldoHistOpcIndIDBOLETA.AsString,
                                                  'Atualização ' + qryBuscaSaldoHistOpcIndDESCINVESTIMENTO.AsString,
                                                  'ATU',
                                                  '',
                                                  dDataRef,
                                                  qryBuscaSaldoHistOpcIndAJUSTEDIA.AsFloat,
                                                  qryBuscaSaldoHistOpcIndVLRATEHOJE.AsFloat,
                                                  0,
                                                  qryBuscaSaldoHistOpcIndSLDQTDHISTOPCIND.AsFloat) then
                  Abort;

               // Busca Dados do Investimento
               BuscaOpcao(qryBuscaSaldoHistOpcIndIDINVESTIMENTO.AsInteger);

               // Monta query de entrada para a regra
               DMOpcoesIndice.qryAux.SQL.Clear;
               DMOpcoesIndice.qryAux.SQL.Add('SELECT ');
               DMOpcoesIndice.qryAux.SQL.Add( 'TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ',''DD/MM/YYYY'') AS DATAATUAL, ');
               DMOpcoesIndice.qryAux.SQL.Add( qryBuscaSaldoHistOpcIndSLDQTDHISTOPCIND.AsString + ' AS QUANTIDADE, ');
               DMOpcoesIndice.qryAux.SQL.Add( qryBuscaOpcaoVLRPONTO.AsString + ' AS VLRPONTO, ');
               DMOpcoesIndice.qryAux.SQL.Add('-1 AS IDCIDADES, ');
               DMOpcoesIndice.qryAux.SQL.Add(' 1 AS IDPAIS, ');
               DMOpcoesIndice.qryAux.SQL.Add(''' '' AS CODESTADO');
               DMOpcoesIndice.qryAux.SQL.Add('FROM DUAL ');
               DMOpcoesIndice.qryAux.Open;

               // Busca o ID da Regra no cadastro do Item
               OperComum.LimpaParametros(DMOpcoesIndice.qryItensOpcInd);
               DMOpcoesIndice.qryItensOpcInd.ParamByName('IDITEMOPCIND').AsInteger := -6;
               DMOpcoesIndice.qryItensOpcInd.Open;

               RegraAtuOpcInc.RuleName := DMOpcoesIndice.qryItensOpcIndIDREGRA.AsString;
               RegraAtuOpcInc.QueryIn  := DMOpcoesIndice.qryAux;
               try
                  //RegraAtuOpcInc.PassoaPasso;
                  RegraAtuOpcInc.Execute;
               except
                  on E:Exception do
                  begin
                     MsgDlg('Erro ao calcular a Regra de Valor de Mercado.' + #13 +
                            'Regra: ' + DMOpcoesIndice.qryItensOpcIndIDREGRA.AsString + #13 +
                            'Mensagem: ' + E.Message,
                            'Mensagem do Sistema', mtWarning, [MbOk],0);
                     Abort;
                  end;
               end;

               // Gravar os Itens do Historico
               fQtd             := 0;
               fSldQtd          := qryBuscaSaldoHistOpcIndSLDQTDHISTOPCIND.AsFloat;
               if qryBuscaSaldoHistXItens.Locate('IDITEMOPCIND', -2, []) then
               begin
                  fVlrCompra    := qryBuscaSaldoHistOpcIndVLRCOMPRA.AsFloat - qryBuscaSaldoHistXItensSLDHISTOPCIND.AsFloat;
                  fSldCompra    := qryBuscaSaldoHistOpcIndVLRCOMPRA.AsFloat;
               end;

               if qryBuscaSaldoHistXItens.Locate('IDITEMOPCIND', -3, []) then
               begin
                  fVlrVencto    := qryBuscaSaldoHistOpcIndVLRVENCTO.AsFloat - qryBuscaSaldoHistXItensSLDHISTOPCIND.AsFloat;
                  fSldVencto    := qryBuscaSaldoHistOpcIndVLRVENCTO.AsFloat;
               end;

               if qryBuscaSaldoHistXItens.Locate('IDITEMOPCIND', -4, []) then
               begin
                  fVlrAjusteDia := qryBuscaSaldoHistOpcIndAJUSTEDIA.AsFloat - qryBuscaSaldoHistXItensSLDHISTOPCIND.AsFloat;
                  fSldAjusteDia := qryBuscaSaldoHistOpcIndAJUSTEDIA.AsFloat;
               end;

               if qryBuscaSaldoHistXItens.Locate('IDITEMOPCIND', -5, []) then
               begin
                  fVlrAtual     := qryBuscaSaldoHistOpcIndVLRATEHOJE.AsFloat - qryBuscaSaldoHistXItensSLDHISTOPCIND.AsFloat;
                  fSldAtual     := qryBuscaSaldoHistOpcIndVLRATEHOJE.AsFloat;
               end;

               if qryBuscaSaldoHistXItens.Locate('IDITEMOPCIND', -6, []) then
               begin
                  fVlrMercado   := OperComum.Trunca(StrToFloat(TrocaPontoVirgula(RegraAtuOpcInc.Result)),2) - qryBuscaSaldoHistXItensSLDHISTOPCIND.AsFloat;
                  fSldMercado   := OperComum.Trunca(StrToFloat(TrocaPontoVirgula(RegraAtuOpcInc.Result)),2);
               end;

               if qryBuscaSaldoHistXItens.Locate('IDITEMOPCIND', -7, []) then
               begin
                  fVlrCesta     := OperComum.Trunca(OpcaoIndice.BuscaVlrAtuCesta(qryBuscaSaldoHistOpcIndIDCESTAOPCIND.AsInteger, dDataRef),2) - qryBuscaSaldoHistXItensSLDHISTOPCIND.AsFloat;
                  fSldCesta     := OpcaoIndice.BuscaVlrAtuCesta(qryBuscaSaldoHistOpcIndIDCESTAOPCIND.AsInteger, dDataRef);
               end;

               if qryBuscaSaldoHistXItens.Locate('IDITEMOPCIND', -8, []) then
               begin
                  fVlrAjusteCesta := 0;
                  fSldAjusteCesta := qryBuscaSaldoHistXItensSLDHISTOPCIND.AsFloat;
               end;

               if not OpcaoIndice.GravaItensHistOpcInd(iIdHistOpcInd,
                                                       fQtd, fSldQtd,
                                                       fVlrCompra, fSldCompra,
                                                       fVlrVencto, fSldVencto,
                                                       fVlrCesta, fSldCesta,
                                                       fVlrAtual, fSldAtual,
                                                       fVlrMercado, fSldMercado,
                                                       fVlrAjusteDia, fSldAjusteDia,
                                                       fVlrAjusteCesta, fSldAjusteCesta) then
                  Abort;

               qryBuscaSaldoHistOpcInd.Next;
            end;

            bFirst := True;
            fVlrMaior := 0;
            fVlrMenor := 0;
            fVlrCesta := 0;

            OpcaoIndice.BuscaSaldoOpcInd(dDataRef, sIdBoleta, sIdLote);

            // Calcula Ajuste e Contabiliza
            qryBuscaSaldoHistOpcInd.First;
            while not qryBuscaSaldoHistOpcInd.EOF do
            begin
               // Pula as operações (Sem Lote)
               if qryBuscaSaldoHistOpcIndIDLOTE.IsNull then
               begin
                  qryBuscaSaldoHistOpcInd.Next;
                  Continue;
                  Inc(iPos);
               end;

               // Capta o Lote e Boleta
               sLote := qryBuscaSaldoHistOpcIndIDLOTE.AsString;
               sBoleta := qryBuscaSaldoHistOpcIndIDBOLETA.AsString;
               bFirst := True;
               // Efetua Loop neste Lote
               while (not qryBuscaSaldoHistOpcInd.EOF) and
                     (sLote = qryBuscaSaldoHistOpcIndIDLOTE.AsString) and
                     (sBoleta = qryBuscaSaldoHistOpcIndIDBOLETA.AsString) do
               begin
                  // Capta o Saldo Atual da Cesta
                  if not qryBuscaSaldoHistOpcIndIDCESTAOPCIND.IsNull then
                  begin
                     iHistCesta := qryBuscaSaldoHistOpcIndIDHISTOPCIND.AsInteger;
                     fVlrCesta := OpcaoIndice.BuscaVlrAtuCesta(qryBuscaSaldoHistOpcIndIDCESTAOPCIND.AsInteger, dDataRef);
                  end;

                  fValor := qryBuscaSaldoHistOpcIndVLRATEHOJE.AsFloat;

                  if bFirst then
                  begin
                     fVlrMaior := fValor;
                     fVlrMenor := fValor;
                     bFirst    := False;
                     iHistBaixa := qryBuscaSaldoHistOpcIndIDHISTOPCIND.AsInteger;
                     iHistAlta  := qryBuscaSaldoHistOpcIndIDHISTOPCIND.AsInteger;
                     iCartAlta  := qryBuscaSaldoHistOpcIndIDCARTEIRAINVEST.AsInteger;
                     iCartBaixa := qryBuscaSaldoHistOpcIndIDCARTEIRAINVEST.AsInteger;
                  end
                  else
                  begin
                     if fValor > fVlrMaior then
                     begin
                        fVlrMaior := fValor;
                        iHistAlta  := qryBuscaSaldoHistOpcIndIDHISTOPCIND.AsInteger;
                        iCartAlta  := qryBuscaSaldoHistOpcIndIDCARTEIRAINVEST.AsInteger;
                     end;
                     if fValor < fVlrMenor then
                     begin
                        fVlrMenor := fValor;
                        iHistBaixa := qryBuscaSaldoHistOpcIndIDHISTOPCIND.AsInteger;
                        iCartBaixa := qryBuscaSaldoHistOpcIndIDCARTEIRAINVEST.AsInteger;
                     end;
                  end;
                  qryBuscaSaldoHistOpcInd.Next;
               end;

               // A principio não faz nenhum ajuste
               iItem := 0;
               fVlrAjuste := 0;

               // Verifica a necessidade de Ajustes
               if fVlrCesta > fVlrMaior then // Estorna à Variação
               begin
                  iItem := -10;
                  fVlrAjuste := fVlrMaior - fVlrCesta;
               end
               else
               if fVlrCesta < fVlrMenor then // Acrescenta à Variação
               begin
                  iItem := -9;
                  fVlrAjuste := fVlrMenor - fVlrCesta;
               end;

               // Capta Registro atual na tabela
               if not qryBuscaSaldoHistOpcInd.Eof then
               begin
                  bEof := False;
                  bmReg := qryBuscaSaldoHistOpcInd.GetBookmark
               end
               else
                  bEof := True;

               // Faz os Ajustes necessários
               AtualizaAjusteOpcInd(iHistAlta, iHistBaixa, iHistCesta, iItem, fVlrAjuste,sBoleta,sLote,DateToStr(dDataRef));

               // Volta para a Registro anterior
               if not bEof then
               begin
                  qryBuscaSaldoHistOpcInd.GotoBookmark(bmReg);
                  qryBuscaSaldoHistOpcInd.FreeBookmark(bmReg);
               end
               else
                  qryBuscaSaldoHistOpcInd.Last;
             end;

         except on E: Exception do
            begin
               Result := False;
               MsgDlg('Ocorreu problema na Gravação da Atualização.'+''#13+
                      E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
            end;
         end;
      end;
   finally
      DMOpcoesIndice.qryBuscaSaldoHistOpcInd.Close;
      DMOpcoesIndice.qryBuscaSaldoHistXItens.Close;
      RegraAtuOpcInc.Free;
   end;
end;

function TOpcaoIndice.VerificaCestaInv(iCesta, iCarteira, iCustodiante, iInvestimento: Integer;
                                       dDataVigencia: TDateTime;
                                       iCarteiraGerenc: Integer = -1): Boolean;
begin
   Result := False;
   with DMOpcoesIndice, DMOpcoesIndice.qryVerificaCestaInv do
   begin
      try
         OperComum.LimpaParametros(qryVerificaCestaInv);
         ParamByName('IDCESTAOPCIND').AsInteger := iCesta;
         ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteira;
         if iCarteiraGerenc = -1 then
            ParamByName('IDCARTEIRAGERENC').AsInteger := iCarteiraGerenc;
         ParamByName('IDCUSTODIANTE').AsInteger := iCustodiante;
         ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         ParamByName('DATAVIGENCIA').AsString := DateToStr(dDataVigencia);
         Open;
         if not IsEmpty then
            Result := True;
      finally
         OperComum.LimpaParametros(qryVerificaCestaInv);
      end;
   end;
end;

function TOpcaoIndice.VerificaBoletaAberta(dDataIni, dDataFim: TDateTime): Boolean;
var sListaBoleta: String;
begin
   Result := False;
   with DMOpcoesIndice, DMOpcoesIndice.qryBuscaBoletaAberta do
   begin
      try
         OperComum.LimpaParametros(qryBuscaBoletaAberta);
         ParamByName('DATAINI').AsString := DateToStr(dDataIni);
         ParamByName('DATAFIM').AsString := DateToStr(dDataFim);
         Open;
         if not IsEmpty then
         begin
            while not Eof do
            begin
               if qryBuscaBoletaAbertaIDBOLETA.IsNull then
                  sListaBoleta := sListaBoleta + qryBuscaBoletaAbertaDATA.AsString + #13
               else
                  sListaBoleta := sListaBoleta + qryBuscaBoletaAbertaIDBOLETA.AsString + #13;
               Next;
            end;
            MsgDlg('Existem Boletas de Opções de Índice Abertas no Período:' + #13 + sListaBoleta,
                   'Mensagem do Sistema ', mtWarning,[mbOK],0);
         end
         else
            Result := True;
         Close;
      Except
         Close;
         MsgDlg('Ocorreu um Problema na Verificação de Boletas Abertas','Mensagem do Sistema ', mtWarning, [mbOK], 0);
      end;
   end;
end;

function TOpcaoIndice.AtualizaTransferencia(dDataRef : TDateTime) : boolean;
var
   iIdHistCartInvDest,iCarteiraOrig,iCarteiraDest,iMotBloqOrig,iMotBloqDest,
   iMercadoOrig,iMercadoDest : Integer;
   fQtdTransf  : Double;
begin
   Result := True;
   With DMOpcoesIndice Do
   begin
      Try
        OperComum.LimpaParametros(QryCestaOpcDia);
        QryCestaOpcDia.ParamByName('DATAVIGENCIA').AsString := DateToStr(dDataRef);
        QryCestaOpcDia.Open;
        QryCestaOpcDia.First;
        While Not QryCestaOpcDia.Eof Do
        begin
           OperComum.LimpaParametros(QryCestaOpcDiaAnterior);
           QryCestaOpcDiaAnterior.ParamByName('IDINVESTIMENTO').AsInteger :=
                                  QryCestaOpcDia.FieldByName('IDINVESTIMENTO').AsInteger;
           QryCestaOpcDiaAnterior.ParamByName('IDCESTAOPCIND').AsInteger  :=
                                  QryCestaOpcDia.FieldByName('IDCESTAOPCIND').AsInteger;
           QryCestaOpcDiaAnterior.ParamByName('DATAVIGENCIA').AsString    := DateToStr(dDataRef);
           QryCestaOpcDiaAnterior.Open;

           fQtdTransf := (QryCestaOpcDia.FieldByName('QUANTIDADE').AsFloat -
                                  QryCestaOpcDiaAnterior.FieldByName('QUANTIDADE').AsFloat);

           // Transferencia entre carteira
           If (Not QryCestaOpcDiaAnterior.IsEmpty) And (fQtdTransf < 0) Then //Já exite na cesta com Data de vigencia menor que a do dia do Fechto
           begin
              // Devolve para a Carteira a Vista
              iCarteiraOrig := pRPI.IDCARTOPCIND;
              iCarteiraDest := pRPI.IDCARTAVISTA;
              iMotBloqOrig  := pRPI.IDMOTBLOQOPC;
              iMotBloqDest  := -1;
              iMercadoOrig  := 3;
              iMercadoDest  := 1;
           end
           Else
           begin
              // Transfere para a Carteira de Opcoes
              iCarteiraOrig := QryCestaOpcDia.FieldByName('IDCARTEIRAINVEST').AsInteger;
              iCarteiraDest := pRPI.IDCARTOPCIND;
              iMotBloqOrig  := -1;
              iMotBloqDest  := pRPI.IDMOTBLOQOPC;
              iMercadoOrig  := 1;
              iMercadoDest  := 3;
           end;

           If fQtdTransf <> 0 Then
           begin
              if not OperComum.TransfEntreCarteiras(QryCestaOpcDia.FieldByName('IDEMISSOR').AsInteger,
                                                    iCarteiraOrig,iCarteiraDest,
                                                    QryCestaOpcDia.FieldByName('IDINVESTIMENTO').AsInteger,
                                                    QryCestaOpcDia.FieldByName('IDCUSTODIANTE').AsInteger,
                                                    QryCestaOpcDia.FieldByName('IDCUSTODIANTE').AsInteger,
                                                    iMotBloqOrig,iMotBloqDest,iMercadoOrig,iMercadoDest,
                                                    QryCestaOpcDia.FieldByName('IDEMISSOR').AsInteger,
                                                    Abs(fQtdTransf),
                                                    Abs(fQtdTransf),
                                                    dDataRef,
                                                    False,'',
                                                    QryCestaOpcDia.FieldByName('IDBOLETA').AsString,
                                                    iIdHistCartInvDest) then
                 Abort;
           end;
           QryCestaOpcDia.Next;
        end;
        QryCestaOpcDia.Close;
        QryCestaOpcDiaAnterior.Close;

        OperComum.LimpaParametros(QryCestaDeletadas);
        QryCestaDeletadas.ParamByName('DATAVIGENCIA').AsString := DateToStr(dDataRef);
        QryCestaDeletadas.Open;
        QryCestaDeletadas.First;
        While Not QryCestaDeletadas.Eof Do
        begin
           // Transferencia entre carteira
           // Devolve para a Carteira a Vista
           iCarteiraOrig := pRPI.IDCARTOPCIND;
           iCarteiraDest := pRPI.IDCARTAVISTA;
           iMotBloqOrig  := pRPI.IDMOTBLOQOPC;
           iMotBloqDest  := -1;
           iMercadoOrig  := 3;
           iMercadoDest  := 1;

           if not OperComum.TransfEntreCarteiras(QryCestaDeletadas.FieldByName('IDEMISSOR').AsInteger,
                                                 iCarteiraOrig, iCarteiraDest,
                                                 QryCestaDeletadas.FieldByName('IDINVESTIMENTO').AsInteger,
                                                 QryCestaDeletadas.FieldByName('IDCUSTODIANTE').AsInteger,
                                                 QryCestaDeletadas.FieldByName('IDCUSTODIANTE').AsInteger,
                                                 iMotBloqOrig,iMotBloqDest,iMercadoOrig,iMercadoDest,
                                                 QryCestaDeletadas.FieldByName('IDEMISSOR').AsInteger,
                                                 QryCestaDeletadas.FieldByName('QUANTIDADE').AsFloat,
                                                 QryCestaDeletadas.FieldByName('QUANTIDADE').AsFloat,
                                                 dDataRef,
                                                 False,'',
                                                 QryCestaDeletadas.FieldByName('IDBOLETA').AsString,
                                                 iIdHistCartInvDest) then
              Abort;

           QryCestaDeletadas.Next;
        end;

        QryCestaDeletadas.Close;

     except on E: Exception do
         begin
            Result := False;
            MsgDlg('Ocorreu problema na Gravação da Atualização da Transferência.'+''#13+
                   E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
            QryCestaOpcDia.Close;
            QryCestaDeletadas.Close;
            QryCestaOpcDiaAnterior.Close;
         end;
      end;
   end;
end;


function TOpcaoIndice.BuscaOpcao(iInvestimento: Integer = -1; iOpcao: Integer = -1): Boolean;
begin
   Result := False;

   if (iInvestimento = -1) and (iOpcao = -1) then
      Exit;

   with DMOpcoesIndice, DMOpcoesIndice.qryBuscaOpcao do
   begin
      try
         OperComum.LimpaParametros(qryBuscaOpcao);
         if iInvestimento <> -1 then
            ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
         if iOpcao <> -1 then
            ParamByName('IDOPCAO').AsInteger := iOpcao;
         Open;
         if not IsEmpty then
            Result := True;
      except
         Result := False;
      end;
   end;
end;


function TOpcaoIndice.ReprocessaHistOpcInd(dDataIni, dDataFim: TDateTime;
                                           fraMsg: TfraMensagem = nil;
                                           sIdBoleta: String = '';
                                           sIdLote:String = ''): Boolean;
var dDataProc: TDateTime;
    iPos, iMax: Integer;
    sMes: String;
    bLocalTrans: Boolean;
begin
   try
      try
         dDataProc := dDataIni;
         iPos := 0;
         sMes := 'Processando dia : ';
         if fraMsg = nil then
         begin
            frmAguardeInv.Pos := iPos;
            frmAguardeInv.Max := DiasUteisInv.IntervaloDiasUteis(dDataIni, dDataFim,-1,1,'',True,False,False);
            iMax := frmAguardeInv.Max;
         end
         else
         begin
            fraMsg.Mostra;
            fraMsg.Pos := iPos;
            fraMsg.Max := DiasUteisInv.IntervaloDiasUteis(dDataIni, dDataFim,-1,1,'',True,False,False);
            iMax := fraMsg.Max;
         end;

         while dDataProc <= dDataFim do
         begin
            if not DtmBaseDados.dbBaseDados.InTransaction then
            begin
               DtmBaseDados.dbBaseDados.StartTransaction;
               bLocalTrans := True;
            end;

            if fraMsg = nil then
               frmAguardeInv.Mostra(sMes + DateToStr(dDataProc))
            else
               fraMsg.Mes := sMes + DateToStr(dDataProc);

            // Refaz o Histórico da operações
            if not RelancaHistOper(dDataProc, sIdBoleta, sIdLote, fraMsg) then
               Abort;

            if fraMsg = nil then
            begin
               frmAguardeInv.Max := iMax;
               frmAguardeInv.Pos := iPos;
               frmAguardeInv.Mostra(sMes + DateToStr(dDataProc))
            end else
            begin
               fraMsg.Max := iMax;
               fraMsg.Pos := iPos;
               fraMsg.Mes := sMes + DateToStr(dDataProc);
            end;

            // Atualiza opções de índice
            if not AtualizaSaldosOpcInd(dDataProc, sIdBoleta, sIdLote, fraMsg) then
               Abort;

            if fraMsg = nil then
            begin
               frmAguardeInv.Max := iMax;
               frmAguardeInv.Pos := iPos;
               frmAguardeInv.Mostra(sMes + DateToStr(dDataProc))
            end else
            begin
               fraMsg.Max := iMax;
               fraMsg.Pos := iPos;
               fraMsg.Mes := sMes + DateToStr(dDataProc);
            end;

            // Avança um dia útil
            dDataProc := DiasUteisInv.PrimeiroDiaUtilPosterior(dDataProc,-1,1,'',True,False,False);

            if bLocalTrans then
            begin
               if DtmBaseDados.dbBaseDados.InTransaction then
                  DtmBaseDados.dbBaseDados.Commit;
            end;

            Inc(iPos);
            if fraMsg = nil then
            begin
               frmAguardeInv.Max := iMax;
               frmAguardeInv.Pos := iPos;
            end else
            begin
               fraMsg.Max := iMax;
               fraMsg.Pos := iPos;
            end;
         end;

         Result := True;
         if fraMsg <> nil then
            fraMsg.Mes := 'Processamento Concluído com Sucesso';

      except on E: Exception do
         begin
            if bLocalTrans then
            begin
               if DtmBaseDados.dbBaseDados.InTransaction Then
                  DtmBaseDados.dbBaseDados.Rollback;
            end;

            Result := False;
            fraMsg.Mes := 'Ocorreu um problema no Reprocessamento das Opções de Índice';
            MsgDlg('Ocorreu um problema no Reprocessamento das Opções de Índice '+ #13 +
                   E.Message,'Mensagem do Sistema ', mtWarning, [mbOK],0);
         end;
      end;;
   finally
      if fraMsg = nil then
         frmAguardeInv.Apaga;
   end;
end;

function TOpcaoIndice.RelancaHistOper(dDataProc: TDateTime;
                                      sIdBoleta: String = '';
                                      sIdLote:String = '';
                                      fraMsg: TfraMensagem = nil): Boolean;
var
   iIdHistOpcInd: Integer;
   fValor,fQtd,fSldValor,fSldQtd, fTotalLiquido: Double;
   sHistorico, sBoleta : String;
   bReversao, bLocalTrans : Boolean;
   fVlrCompra,fVlrVencto,fVlrCesta,fVlrAtual,fVlrMercado,fVlrAjusteDia,fVlrAjusteCesta : Double;
   RegraRelanca: TRegra;
   iAchouPadrao : Boolean;
   iPlano,iPlanilha,iDocumento,iTipoOperacao,iSubContaDeb,iSubContaCred,iUnidNegoc: Integer;
   sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,sCentroRespon, sTipoRecDes : String;
   sTipoPer, sHistoricoOper, sRecPagNao: String;

begin
{    Atenção  --  Esta rotina recria os históricos das operações com os valores corretos
                  porém não refaz os lançamentos contábeis das operações, e nem os
                  Lançamentos financeiros.
                  Destina-se somente a recriar os históricos
}
   Result := False;
   bLocalTrans := False;
   try
      with DMOpcoesIndice, DMOpcoesIndice.qryBuscaOperacoes do
      begin
         RegraRelanca              := TRegra.Create(Application);
         RegraRelanca.DatabaseName := 'BaseDados';
         RegraRelanca.TipoCliente  := tcFundacao;

         if not DtmBaseDados.dbBaseDados.InTransaction then
         begin
            bLocalTrans := True;
            DtmBaseDados.dbBaseDados.StartTransaction;
         end;

         OperComum.LimpaParametros(qryBuscaOperacoes);
         ParamByName('DATAORDEM').AsString := DateToStr(dDataProc);
         if sIdBoleta <> '' then
            ParamByName('IDBOLETA').AsString := sIdBoleta;
         if sIdLote <> '' then
            ParamByName('IDLOTE').AsString := sIdLote;
         Open;
         First;
         if fraMsg <> nil then
         begin
            fraMsg.Mostra;
            fraMsg.Max := RecordCount;
            fraMsg.Pos := 0;
         end;
         while not EOF do
         begin
            // Loop por Boleta para Lançar o Total Financeiro de Despesas no Contábil
            sBoleta := DMOpcoesIndice.qryBuscaOperacoesIDBOLETA.AsString;
            if fraMsg <> nil then
               fraMsg.Mes := 'Relançando Boleta ' + sBoleta;

            // Busca as Despesas
            OperComum.LimpaParametros(DMOpcoesIndice.qryBuscaBoletaOper);
            DMOpcoesIndice.qryBuscaBoletaOper.ParamByName('IDBOLETA').AsString := sBoleta;
            DMOpcoesIndice.qryBuscaBoletaOper.Open;

            fTotalLiquido := DMOpcoesIndice.qryBuscaOperacoesTOTALORDEM.AsFloat - DMOpcoesIndice.qryBuscaBoletaOperVLRDESPESA.AsFloat;

            OperComum.LimpaParametros(DMOpcoesIndice.qryBuscaBoletaOper);

            iPlano := -1;
            iPlanilha := -1;
            if DMOpcoesIndice.qryBuscaOperacoesPLNCODIGO.AsInteger <> 0 then
               iPlanilha := DMOpcoesIndice.qryBuscaOperacoesPLNCODIGO.AsInteger;
            if DMOpcoesIndice.qryBuscaOperacoesPLANO.AsInteger <> 0 then
               iPlano := DMOpcoesIndice.qryBuscaOperacoesPLANO.AsInteger;

            // Exclui Lançamentos Contábeis da Planilha sem excluir a Planilha
            //AL_6 - Passa a valer a exclusão em 3 camadas
            if not CtrlInvContab.InvExcluiLanc(iPlanilha, 0, Sistema.UsaPlanoPatro, False) then
               Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' + DMOpcoesIndice.qryBuscaOperacoesPLNCODIGO.AsString);

            // Loop Nas Operações da Boleta
            while ((sBoleta = DMOpcoesIndice.qryBuscaOperacoesIDBOLETA.AsString) and
                   (not EOF)) do
            begin
               if fraMsg <> nil then
                  fraMsg.Mes := 'Excluindo Históricos Antigos';
               // Exclui o Histórico antigo (Se houver)
               qryAux.SQL.Clear;
               qryAux.SQL.Add('DELETE FROM HISTOPCINDXITENS WHERE IDHISTOPCIND IN ( ');
               qryAux.SQL.Add('SELECT IDHISTOPCIND FROM HISTOPCIND ');
               qryAux.SQL.Add('WHERE IDBOLETA = ' + QuotedStr(qryBuscaOperacoesIDBOLETA.AsString) + ' AND ');
               qryAux.SQL.Add('      DATAHISTOPCIND = TO_DATE(' + QuotedStr(qryBuscaOperacoesDATAORDEM.AsString) + ',''DD/MM/YYYY'') AND ');
               qryAux.SQL.Add('      TIPMOVHISTOPCIND = ''OPE'' AND ');
               qryAux.SQL.Add('      IDINVESTIMENTO = ' + qryBuscaOperacoesIDINVESTIMENTO.AsString + ')');
               qryAux.ExecSQL;

               qryAux.SQL.Clear;
               qryAux.SQL.Add('DELETE FROM HISTOPCIND ');
               qryAux.SQL.Add('WHERE IDBOLETA = ' + QuotedStr(qryBuscaOperacoesIDBOLETA.AsString) + ' AND ');
               qryAux.SQL.Add('      DATAHISTOPCIND = TO_DATE(' + QuotedStr(qryBuscaOperacoesDATAORDEM.AsString) + ',''DD/MM/YYYY'') AND ');
               qryAux.SQL.Add('      TIPMOVHISTOPCIND = ''OPE'' AND ');
               qryAux.SQL.Add('      IDINVESTIMENTO = ' + qryBuscaOperacoesIDINVESTIMENTO.AsString);
               qryAux.ExecSQL;

               fQtd      := qryBuscaOperacoesQUANTIDADE.AsFloat;
               fSldQtd   := fQtd;
               fValor    := fQtd * qryBuscaOperacoesVLRPONTO.AsFloat * qryBuscaOperacoesVLRSTRIKEPUT.AsFloat;
               fSldValor := fValor;

               // Verifica sé é Reversão
               bReversao := False;
               if OpcaoIndice.VerificaReversao(qryBuscaOperacoesIDINVESTIMENTO.AsInteger,
                                               qryBuscaOperacoesIDBOLETA.AsString,
                                               DateToStr(qryBuscaOperacoesDATAORDEM.AsDateTime)) then
               begin
                  fSldValor := qryBuscaSaldoHistOpcIndSLDVLRHISTOPCIND.AsFloat - fValor;
                  fSldQtd   := qryBuscaSaldoHistOpcIndSLDQTDHISTOPCIND.AsFloat - fQtd;
                  fValor    := fValor * -1;
                  fQtd      := fQtd * -1;
                  bReversao := True;
               end;

               sHistorico := OpcaoIndice.MontaHistorico(qryBuscaOperacoesNATUREZAOPERACAO.AsString,
                                                        qryBuscaOperacoesDESCTIPOOPERACAO.AsString,
                                                        qryBuscaOperacoesDESCINVESTIMENTO.AsString);

               //Grava HistOpcInd
               if fraMsg <> nil then
                  fraMsg.Mes := 'Gravando Histórico da Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString;
               iIdHistOpcInd := LeUltRegistro(nil, 'HISTOPCIND');
               if not OpcaoIndice.GravaHistOpcInd(iIdHistOpcInd,
                                                  qryBuscaOperacoesIDOPEROPCIND.AsInteger,
                                                  qryBuscaOperacoesIDINVESTIMENTO.AsInteger,
                                                  qryBuscaOperacoesIDCARTEIRAINVEST.AsInteger,
                                                  qryBuscaOperacoesIDTIPOOPERACAO.AsInteger,
                                                  qryBuscaOperacoesIDTIPOINVEST.AsInteger,
                                                  qryBuscaOperacoesIDPLANPREVCTBPATR.AsInteger,
                                                  qryBuscaOperacoesIDCARTEIRAGERENC.AsInteger,
                                                  -1,
                                                  qryBuscaOperacoesIDLOTE.AsString,
                                                  qryBuscaOperacoesIDBOLETA.AsString,
                                                  sHistorico,
                                                  'OPE',
                                                  '',
                                                  qryBuscaOperacoesDATAORDEM.AsDateTime,
                                                  fValor,
                                                  fSldValor,
                                                  fQtd,
                                                  fSldQtd) then
                  Raise Exception.Create('Erro na Gravação do Histórico da Operação de Opções');

               // Gravar os Itens
               if fraMsg <> nil then
                  fraMsg.Mes := 'Calculando Itens de Histórico da Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString;

               // Monta query de entrada para a regra de Valor de Mercado
               qryAux.SQL.Clear;
               qryAux.SQL.Add('SELECT ');
               qryAux.SQL.Add( 'TO_DATE(' + QuotedStr(qryBuscaOperacoesDATAORDEM.AsString) + ',''DD/MM/YYYY'') AS DATAATUAL, ');
               qryAux.SQL.Add( FloatToStr(fSldQtd) + ' AS QUANTIDADE, ');
               qryAux.SQL.Add( qryBuscaOperacoesVLRPONTO.AsString + ' AS VLRPONTO, ');
               qryAux.SQL.Add('-1 AS IDCIDADES, ');
               qryAux.SQL.Add(' 1 AS IDPAIS, ');
               qryAux.SQL.Add(''' '' AS CODESTADO');
               qryAux.SQL.Add('FROM DUAL ');
               qryAux.Open;

               // Busca o ID da Regra no cadastro do Item
               OperComum.LimpaParametros(qryItensOpcInd);
               qryItensOpcInd.ParamByName('IDITEMOPCIND').AsInteger := -6;
               qryItensOpcInd.Open;

               RegraRelanca.RuleName := qryItensOpcIndIDREGRA.AsString;
               RegraRelanca.QueryIn  := qryAux;
               try
                  RegraRelanca.Execute;
                  //RegraRelanca.PassoaPasso;
               except
                  on E:Exception do
                  begin
                     MsgDlg('Ocorreu um problema ao calcular a Regra de Valor de Mercado.' + #13 +
                            'Regra: ' + DMOpcoesIndice.qryItensOpcIndIDREGRA.AsString + #13 +
                            'Mensagem: ' + E.Message,
                            'Mensagem do Sistema', mtWarning, [MbOk],0);
                     Exit;
                  end;
               end;

               fVlrCompra      := fQtd * qryBuscaOperacoesVLRPONTO.AsFloat * qryBuscaOperacoesVLRSTRIKEPUT.AsFloat;
               fVlrVencto      := fQtd * qryBuscaOperacoesVLRPONTO.AsFloat * qryBuscaOperacoesVLRPRECOEX.AsFloat;
               fVlrCesta       := OpcaoIndice.BuscaValorCesta(qryBuscaOperacoesIDCESTAOPCIND.AsInteger,qryBuscaOperacoesDATAORDEM.AsDateTime);
               fVlrAtual       := fVlrCompra;
               fVlrMercado     := StrToFloat(TrocaPontoVirgula(RegraRelanca.Result));
               fVlrAjusteDia   := 0;
               fVlrAjusteCesta := 0;

               if fraMsg <> nil then
                  fraMsg.Mes := 'Gravando Itens de Histórico da Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString;
               if not OpcaoIndice.GravaItensHistOpcInd(iIdHistOpcInd,
                                                       fQtd,fSldQtd,
                                                       fVlrCompra,fVlrCompra,
                                                       fVlrVencto,fVlrVencto,
                                                       fVlrCesta,fVlrCesta,
                                                       fVlrAtual,fVlrAtual,
                                                       fVlrMercado,fVlrMercado,
                                                       fVlrAjusteDia,fVlrAjusteDia,
                                                       fVlrAjusteCesta, fVlrAjusteCesta) then
                  Raise Exception.Create('Erro na Gravação dos Items do Histórico da Operação de Opções');

               //AL_7
               //AL_10
               if CtrlInvContab.BuscaPadrLanc.Executa(-1, //Renan CGPC
                                                      dDataProc,2, qryBuscaOperacoesIDTIPOOPERACAO.AsInteger, 0, -1,
                                                      qryBuscaOperacoesIDCARTEIRAINVEST.AsInteger,
                                                      qryBuscaOperacoesIDPLANPREVCTBPATR.AsInteger,
                                                      qryBuscaOperacoesVALOR.AsFloat, '', 'OPE') = 0 then
               begin
                  if fraMsg <> nil then
                     fraMsg.Mes := 'Contabilizando Item da Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString;
                  //AL_7
                  if not OpcaoIndice.ContabilizaOpcInd(qryBuscaOperacoesVALOR.AsFloat,
                                                       CtrlInvContab.BuscaPadrLanc.Plano,
                                                       qryBuscaOperacoesIDCORRETVALORES.AsInteger,
                                                       CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                       CtrlInvContab.BuscaPadrLanc.SubContaDeb,
                                                       CtrlInvContab.BuscaPadrLanc.SubContaCre,
                                                       qryBuscaOperacoesIDPLANPREVCTBPATR.AsInteger,
                                                       CtrlInvContab.BuscaPadrLanc.Historico,
                                                       CtrlInvContab.BuscaPadrLanc.ContaDeb,
                                                       CtrlInvContab.BuscaPadrLanc.ContaCre,
                                                       CtrlInvContab.BuscaPadrLanc.CentroCustoDeb,
                                                       CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                       CtrlInvContab.BuscaPadrLanc.TipoPer,
                                                       CtrlInvContab.BuscaPadrLanc.RecPagNao,
                                                       qryBuscaOperacoesDATAORDEM.AsDateTime,iPlanilha,-1) then
                     Raise Exception.Create('Erro na Contabilização da Operação de Opções');
               end
               else
                  Raise Exception.Create('Não foi Encontrada a Parametrização Contábil para a Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString);

               Next;
               if fraMsg <> nil then
                  fraMsg.Incrementa;
            end;

            // Contabiliza o Valor Financeiro da Boleta
            if fTotalLiquido <> 0 then
            begin
               if fTotalLiquido < 0 then
                  iTipoOperacao := -88  // Compra (à Pagar)
               else
                  iTipoOperacao := -86; // Venda (à Receber)

               //AL_7
               //AL_10
               if CtrlInvContab.BuscaPadrLanc.Executa(-1, //Renan CGPC
                                                      dDataProc,2, iTipoOperacao, -28, -1,
                                                      qryBuscaOperacoesIDCARTEIRAINVEST.AsInteger,
                                                      qryBuscaOperacoesIDPLANPREVCTBPATR.AsInteger,
                                                      fTotalLiquido, '', 'DOP') = 0 then
               begin
                  if fraMsg <> nil then
                     fraMsg.Mes := 'Contabilizando o Financeiro da Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString;
                  //AL_7
                  if not OpcaoIndice.ContabilizaOpcInd(fTotalLiquido,
                                                       CtrlInvContab.BuscaPadrLanc.Plano,
                                                       qryBuscaOperacoesIDCORRETVALORES.AsInteger,
                                                       CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                       CtrlInvContab.BuscaPadrLanc.SubContaDeb,
                                                       CtrlInvContab.BuscaPadrLanc.SubContaCre,
                                                       qryBuscaOperacoesIDPLANPREVCTBPATR.AsInteger,
                                                       CtrlInvContab.BuscaPadrLanc.Historico,
                                                       CtrlInvContab.BuscaPadrLanc.ContaDeb,
                                                       CtrlInvContab.BuscaPadrLanc.ContaCre,
                                                       CtrlInvContab.BuscaPadrLanc.CentroCustoDeb,
                                                       CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                       CtrlInvContab.BuscaPadrLanc.TipoPer,
                                                       CtrlInvContab.BuscaPadrLanc.RecPagNao,
                                                       qryBuscaOperacoesDATAORDEM.AsDateTime,iPlanilha,-1) then
                     Raise Exception.Create('Erro na Contabilização das Despesas da Operação de Opções');
               end
               else
                  Raise Exception.Create('Não foi Encontrada a Parametrização Contábil para as Despesas na Operação de ' + qryBuscaOperacoesDESCTIPOOPERACAO.AsString);
            end;

         end;
         Result := True;
         if bLocalTrans then
            DtmBaseDados.dbBaseDados.Commit;
      end;
   finally
      if not Result then
      begin
         if bLocalTrans then
            DtmBaseDados.dbBaseDados.Rollback;
      end;

      RegraRelanca.Free;
      if fraMsg <> nil then
         fraMsg.Mostra;
   end;
end;

function TOpcaoIndice.ContabilizaTranfCesta(sBoleta: String): Boolean;
var iPlano, iPlanilha, iDocumento: Integer;
    bLocalTrans, bCriaLancto: Boolean;
    wTipoRecDesBol: String;
    sMensErro: string;
begin
   With DMOpcoesIndice, qryBuscaTransf, OperComum do
   begin
      try
         try
            LimpaParametros(qryBuscaTransf);
            ParamByName('IDBOLETA').AsString := sBoleta;
            Open;

            iDocumento := -1;
            // Captar e Limpar, se houver, a planilha da boleta, se não houver - Nova Planilha
            if qryBuscaTransfPLNCODIGO.IsNull then
            begin
               iPlano := -1;
               iPlanilha := -1;
            end
            else
            begin
               iPlano := qryBuscaTransfPLANO.AsInteger;
               iPlanilha := qryBuscaTransfPLNCODIGO.AsInteger;

               // Exclui Lançamentos Contábeis da Planilha sem excluir a Planilha
               //AL_6 - Passa a valer a exclusão em 3 camadas
               if not CtrlInvContab.InvExcluiLanc(iPlanilha, 0, Sistema.UsaPlanoPatro, False) then
                  Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' + IntToStr(iPlanilha));

            end;

            if not DtmBaseDados.dbBaseDados.InTransaction then
            begin
               bLocalTrans := True;
               DtmBaseDados.dbBaseDados.StartTransaction;
            end;

            while not Eof do
            begin
               // Primeiro passo: Excluir contabilizações eventualmente feitas
               //   da forma antiga, e gravando na HistCartInv
               if not qryBuscaTransfPLANILHAHIST.IsNull then
               begin
                  // Exclui Lançamentos Contábeis da Planilha sem excluir a Planilha
                  //  Compatibilidade com o Fechamento antigo.
                  //AL_6 - Passa a valer a exclusão em 3 camadas
                  if not CtrlInvContab.InvExcluiLanc(qryBuscaTransfPLANILHAHIST.AsInteger, 0, Sistema.UsaPlanoPatro, False) then
                     Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' + qryBuscaTransfPLANILHAHIST.AsString);
               end;

               if qryBuscaTransfIDTIPOOPERACAO.AsInteger = -68 then
               begin
                  // Segundo passo: Contabilizar a trnasferencia - Somente o Crédito
                  // Custo
                  wTipoRecDesBol := '';
                  OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                          qryBuscaTransfIDINVESTIMENTO.AsInteger,
                                          qryBuscaTransfIDTIPOOPERACAO.AsInteger,
                                          -1,
                                          qryBuscaTransfIDEMISSOR.AsInteger,
                                          qryBuscaTransfIDCARTEIRAINVEST.AsInteger,
                                          pRPI.MOECODIGO, '','','','','',
                                          wTipoRecDesBol, bCriaLancto, 0,
                                          qryBuscaTransfMOVIMAQUI.AsFloat,
                                          qryBuscaTransfDATAMOVCARTINV.AsDateTime,
                                          qryBuscaTransfDATAMOVCARTINV.AsDateTime,
                                          iPlano, iPlanilha, iDocumento, sMensErro,'N',False,False);
                  if Trim(sMensErro) <> '' then
                  begin
                     MsgDlg('Atenção: Ocorreu um erro na contabilização da operação ',
                            'Mensagem do Sistema', MtWarning, [MbOk], 0);
                     Result := False;
                     Exit;
                  end;

                  // Variacao
                  wTipoRecDesBol := '';
                  OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                          qryBuscaTransfIDINVESTIMENTO.AsInteger,
                                          qryBuscaTransfIDTIPOOPERACAO.AsInteger,
                                          -1,
                                          qryBuscaTransfIDEMISSOR.AsInteger,
                                          qryBuscaTransfIDCARTEIRAINVEST.AsInteger,
                                          pRPI.MOECODIGO, '','','','','',
                                          wTipoRecDesBol, bCriaLancto, 0,
                                          qryBuscaTransfVLRVARIACAO.AsFloat,
                                          qryBuscaTransfDATAMOVCARTINV.AsDateTime,
                                          qryBuscaTransfDATAMOVCARTINV.AsDateTime,
                                          iPlano, iPlanilha, iDocumento, sMensErro,'N',False,False);
                  if Trim(sMensErro) <> '' then
                  begin
                     MsgDlg('Atenção: Ocorreu um erro na contabilização da operação ',
                            'Mensagem do Sistema', MtWarning, [MbOk], 0);
                     Result := False;
                     Exit;
                  end;
               end;

               Next;

               // Atualiza a Boleta com a Planilha
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add('UPDATE BOLETA SET ');
               if iPlano <> -1 then
                  qryAux.SQL.Add(' PLANO     = ' + QuotedStr(IntToStr(iPlano))    + ', ')
               else
                  qryAux.SQL.Add(' PLANO     = '''' ,');
               if iPlanilha <> -1 then
                  qryAux.SQL.Add(' PLNCODIGO = ' + QuotedStr(IntToStr(iPlanilha)) + ' ')
               else
                  qryAux.SQL.Add(' PLNCODIGO = '''' ');
               qryAux.SQL.Add('WHERE IDBOLETA = ' + QuotedStr(sBoleta) + ' ');
               qryAux.ExecSQL;

            end;

            if bLocalTrans then
               DtmBaseDados.dbBaseDados.Commit;

         except
            if bLocalTrans then
               DtmBaseDados.dbBaseDados.Rollback;

         end;
      finally
         qryAux.SQL.Clear;
      end;
   end;
end;

end.




