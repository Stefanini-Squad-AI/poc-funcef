//******************************************************************************
// Data      : 28/05/2008
// Código    : AL_15
// Pendencia : 26357, 26456, 26577, 27100
// SOL       : 69119, 70156, 71040, 70122
// Desc      : Ajustes para o novo empréstimo MT
//******************************************************************************
// Data      : 17/04/2008
// Código    : AL_14
// Pendencia : 27767
// SOL       : 83267
// Desc      : Verificação de Out of Memory do Empréstimo de Ações
//******************************************************************************
// Data      : 22/01/2008
// Código    : AL_12
// Pendencia : 27275
// SOL       :
// Motivo    : Ajuste nas rotinas de exclusão de planilha contábil
//******************************************************************************
// Data      : 11/12/2007
// Código    : AL_11
// Pendencia : 26457
// SOL       : 70157
// Desc      : Ajuste na rotina: IntegraContabCapCar,
//                               ContabilizaEmpAcoes,
//                               IntegraCapCarEmpAcoes (financeiro)
//             permitindo passar o plano/patro informado ao invés do logado
//******************************************************************************
// Data      : 21/09/2007
// Código    : AL_10
// Pendencia : 26357
// SOL       : 69119
// Desc      : Ajuste para: Segregação Plano / Patro
//                          Reprocessamento
//                          Ajustes no funcionamento geral
//******************************************************************************
// Data      : 02/04/2007
// Código    : AL_9
// Pendencia : 24774
// SOL       : 55877
// Desc      : Liga/Desliga a integração contabil financeira para Empréstimo de Ações
//******************************************************************************
// Data      : 26/03/2007
// Código    : AL_8
// Pendencia : 24774
// SOL       : 55877
// Desc      : Acerto na rotina Liga/Desliga a integração contabil financeira por módulo
//******************************************************************************
// Data      : 20/03/2007
// Código    : AL_7
// Pendencia : 24774
// SOL       : 55877
// Desc      : Liga/Desliga a integração contabil financeira por módulo
//******************************************************************************
// Data      : 26/01/2007
// Código    : AL_6
// Pendencia : 23674
// SOL       : 45954
// Desc      : Segregação de Recursos
//******************************************************************************
// Data      : 20/10/2006
// Código    : AL_5
// Pendencia : 22982
// SOL       :
// Desc      : Implementacao Plano e Patro
//******************************************************************************
// Data     : 27/04/2006
// Código   : AL_4
// Desc     : Implementacao de Rotina de Reprocessamento
//******************************************************************************
// Data     : 27/04/2006
// Código   : AL_3
// Desc     : Retirada função AtualizaEmprestimoAcoes pois estava sem utilização e
//            a mesma é da FFechtoEmp
//********************************************************************************************************
//Data	    : 23/06/2005
//Código    : Al_2
//Motivo(S) : Ajuste nas mensagens
//********************************************************************************************************
//Data	    : 23/06/2005
//Código    : Al_1
//Motivo(S) : Implementação da flag do tipo de conta investimento - CCI
//********************************************************************************************************
unit uEmprestAcoes;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls,
  //AL_4
  uLancContab, uCtrlInvContab,
  //uCtrlPadroes,
  //AL_15
  uCtrlParamInvest;

Type
   TEmprestAcoes = Class(TObject)
   private
    //
   public
      function SumSaldosHistEmpAcoes(dDataRef:TDateTime;iPlanPrev, iIdInvestimento, iOperEmpAcoes:Integer; var fSldQtdHist: double):boolean;

      function SumSaldosEmpAcoes(dDataRef:TDateTime; iPlanPrev, iIdInvestimento: Integer; var fSldQtdHist: double): boolean;

      //AL_5
      function BuscaSaldosHist(dDataRef:TDateTime;iIdInvestimento,iIdOperEmpAcoes,iIdOperEmpSld, iPlanPrev :Integer;
                               var fSldHist,fSldQtdHist:double):boolean;

      //AL_4
      //AL_5
      function GravaHistEmpAcoes(iIdHistEmpAcoes,iCustodiante,iInvestimento,iTipoOperacao,iOperEmpAcoes,
                                 iOperEmpAcoesAp, iPlanPrev :integer;
                                 dDataOper:TDateTime;
                                 fVlrOper,fSldHist,fQtdOper,fSldQtdHist:Double;
                                 sNatOper : string;
                                 sFlgRecalc : string = ''):boolean;

      function GravaOperEmpAcoes(iIdOperEmpAcoes,   iIdCustodiante, iIdCarteiraInvest,
                                 iIdInvestimento,   iIdTipoInvest,  iIdTipoOperacao,
                                 iIdOperEmpAcoesAp, iCodDocumento,  iPlnCodigo,
                                 iPlano, iPlanPrev : Integer;
                                 dDataOperacao,     dDataVencOper   : TDateTime;
                                 fQtdOperacao,      fPuOperacao,
                                 fTaxaOperacao                      : Double;
                                 fVlrOperacao,      fVlrIr,         fVlrResgate,
                                 fVlrJuros                          : Currency;
                                 sFlgReversao,      sFlgPreco, sConf: String) : Boolean;

      //Al_1
      //AL_4
      function IntegraContabCapCar(iChave,iInvestimento,iTipoOperacao,iCarteiraInvest,
                                   iFlgGeraContab,iFlgGeraCapCar,iForCli,iTipoDoc,
                                   iTipoDespInvest:integer;
                                   sDescInvestimento, sHistorico : string;
                                   fValor, fEstornoJuros:Double;
                                   dDataProc,dDataVenc : TDateTime;
                                   var iPlanilha,iDocumento : integer;
                                   iFlgContaInvest : Integer = 0;
                                   //AL_11
                                   iPlanPrevPatr: Integer = -1) : boolean;

      //AL_4

      function ContabilizaEmpAcoes(fValor:Double;
                                   iPlano, iForCli,iUnidNegoc,iSubContaDeb, iSubContaCred :integer;
                                   sHistorico, sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,sTipoPer,sRecPagNao : string;
                                   dDataProc : TDateTime;
                                   var iPlanilha : integer;
                                   //AL_11
                                   iPlanPrevPatr: Integer = -1):boolean;

      //Al_1
      function IntegraCapCarEmpAcoes(fValor:Double;iForCli, iPlano, iTipoDoc,iUnidNegoc,iSubContaCred : integer;
                                     sRecPagNao,sTipoRecDes,sContaDeb, sContaCred,sCentroCustoCred,sDataLanc,sDataVenc,sCentroRespon,sHistCapCar : string;
                                     var iPlanilha, iDocumento : integer;
                                     bCapCar         : Boolean;
                                     var sMensErro: String; bMostraErro: Boolean = False;
                                     iFlgContaInvest : Integer = 0;
                                     //AL_11
                                     iPlanPrevPatr: Integer = -1): boolean;

      function GravaPLNCODIGOHISTEMPACOES(iIdHistEmpAcoes,iPlanilha,iDocumento, iPlano:integer):boolean;

      function GravaPLNCODIGOOPEREMPACOES(iIdOperEmpAcoes,iPlanilha,iDocumento, iPlano:integer):boolean;

      function ExcluiFinanceiroEmpAcoes(iDocumento : integer) :boolean;

      //AL_4
      function ExcluiContabEmpAcoes(iPlanilha, iPlano : integer):boolean;

      function ExcluiEmprestimoAcoes(iIdOperEmpAcoes:integer;dDataRef, sOper : string; bExclui : boolean) : boolean;

      function ExcluiOperEmpAcoes(iIdOperEmpAcoes, iIdOperEmpAcoesAP: Integer;
                                  dDataOper: TDateTime; sOper: String): boolean;

      //AL_5
      function ExcluiHistEmpAcoes(iIdOperEmpAp, iPlanPrev :integer;dDataExcl: TDateTime): boolean;

      function BuscaSaldosCustodia(IdPlanPrev, IdCarteira, IdInvestimento, IdCustodia,IdCustodiante, IdMotivoBloqueio: Integer;
               IdLote: String; DataReferencia:TDateTime;
               Var fSdoBloqueado, fSdoLiberado: Double): boolean;

      function VerificaTransfEmptmoAcoes(iPlanPrev, iCarteira, iCustodiante, iIdInvestimento: integer;
                                         fQtdTransf: Double; dDataRef: string;
                                         bMostraMens: Boolean = True): boolean;

      // AL_6
      function VerificaSaldoCustodia(dDataOper: TDateTime;
                                     iPlanPrev, iInvestimento, iCustodiante, iOperEmpAcoes: Integer;
                                     var fSaldoHist: Double;
                                     var fSaldoBloq: Double;
                                     var fSaldoLib:  Double;
                                     var fSaldoCalc: Double;
                                     iTipoOper: Integer = 0): boolean;

      function RefazOperacoes: String;

      //AL_10
      function VerExisteOperEmprestimo(dDataProc: TDateTime; iOperEmpAplic : Integer): boolean;
      //AL_4
      function MarcaFlgReproc(dDataRef : TDateTime; iIdOperEmpAp: Integer = -1; iIdInvestimento: Integer = -1; iPlanPrev: Integer = -1) : boolean;

      function DesmarcaFlgReproc(dDataRef : TDateTime; iIdOperEmpAp: Integer = -1; iIdInvestimento: Integer = -1; iPlanPrev: Integer = -1) : boolean;

      function VerSaldoOper(dDataSaldo: TDateTime; iOperAplic: Integer): Double;

      function BuscaSaldosAux(dDataRef:TDateTime;iIdInvestimento,iIdOperEmpAcoes,iIdOperEmpSld, iPlanPrev :Integer):boolean;
   end;
var
  EmprestAcoes : TEmprestAcoes;

implementation

uses
   DBaseDados,UDatabase,UAutorizacao,Math,UMensErro,uOperacaoInvest,dFuncoesInvest, UOperComum, dRendaFixa,
   USistema, UBibliotecaInvest, UImpostos, dOperComum,uDocumento, FAguardeInv,dEmprestAcoes,
   UDiasUteisInv;

//AL_5
function TEmprestAcoes.BuscaSaldosHist(dDataRef : TDateTime;
                                       iIdInvestimento, iIdOperEmpAcoes, iIdOperEmpSld, iPlanPrev :Integer;
                                       var fSldHist,fSldQtdHist:double):boolean;
begin
   Result := True;
   fSldHist    := 0;
   fSldQtdHist := 0;

   //AL_15 - Ini
    OperComum.LimpaParametros(DMEmprestAcoes.qryBuscaSaldoHist);
    if iIdOperEmpAcoes <> -1 then
      DMEmprestAcoes.qryBuscaSaldoHist.ParamByName('IDOPEREMPACOES').AsInteger := iIdOperEmpAcoes;
    if iIdInvestimento <> -1 then
      DMEmprestAcoes.qryBuscaSaldoHist.ParamByName('IDINVESTIMENTO').AsInteger := iIdInvestimento;
    if iIdOperEmpSld <> -1 then
      DMEmprestAcoes.qryBuscaSaldoHist.ParamByName('IDOPEREMPACSLD').AsInteger := iIdOperEmpSld;
    if iPlanPrev <> -1 then
      DMEmprestAcoes.qryBuscaSaldoHist.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;

   DMEmprestAcoes.qryBuscaSaldoHist.ParamByName('dDataRef').AsString  := DateToStr(dDataRef);
   DMEmprestAcoes.qryBuscaSaldoHist.Open;

   if not DMEmprestAcoes.qryBuscaSaldoHist.IsEmpty then
   begin
      fSldHist    := DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('SLDHISTEMPACOES').AsFloat;
      fSldQtdHist := DMEmprestAcoes.qryBuscaSaldoHist.FieldByName('SLDQTDHISTEMPACOE').AsFloat;
   end;
   //AL_15 - Fim
end;

//AL_4
//AL_5
function TEmprestAcoes.GravaHistEmpAcoes(iIdHistEmpAcoes,iCustodiante,iInvestimento,iTipoOperacao,iOperEmpAcoes,
                                         iOperEmpAcoesAp, iPlanPrev :integer;
                                         dDataOper:TDateTime;
                                         fVlrOper,fSldHist,fQtdOper,fSldQtdHist:Double;
                                         sNatOper : string;
                                         sFlgRecalc : string = '') : boolean;
begin
   //AL_15
   Result := False;
   //AL_4
   OperComum.LimpaParametros(DMEmprestAcoes.qryInsHistEmpAcoes);

   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('IDHISTEMPACOES').AsInteger    := iIdHistEmpAcoes;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('IDEMPRESAPROP').AsInteger     := Sistema.IdEmpresa;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('IDMODULO').AsInteger          := Sistema.IdModulo;
   //AL_5
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
   //AL_4
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('PLANO').Clear;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('PLNCODIGO').Clear;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('CODDOCUMENTO').Clear;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('IDCUSTODIANTE').AsInteger     := iCustodiante;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('IDCARTEIRAINVEST').AsInteger  := CtrlPInv.IdCartEmpAcoes;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('IDINVESTIMENTO').AsInteger    := iInvestimento;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('IDTIPOINVEST').AsInteger      := 2;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacao;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('IDOPEREMPACOES').AsInteger    := iOperEmpAcoes;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('DATAHISTEMPACOES').AsDateTime := dDataOper;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('VLRHISTEMPACOES').AsFloat     := fVlrOper;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('SLDHISTEMPACOES').AsFloat     := fSldHist;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('QTDHISTEMPACOES').AsFloat     := fQtdOper;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('NATURMOV').AsString           := sNatOper;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('SLDQTDHISTEMPACOE').AsFloat   := fSldQtdHist;
   DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('IDOPEREMPACOESAP').AsInteger  := iOperEmpAcoesAp;
   //AL_4
   if sFlgRecalc <> '' then
      DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('FLGRECALC').AsString  := sFlgRecalc
   else
      DMEmprestAcoes.qryInsHistEmpAcoes.ParamByName('FLGRECALC').Clear;

   DMEmprestAcoes.qryInsHistEmpAcoes.ExecSql;
   Result := True;
end;

//AL_5
function TEmprestAcoes.GravaOperEmpAcoes(iIdOperEmpAcoes,   iIdCustodiante, iIdCarteiraInvest,
                                         iIdInvestimento,   iIdTipoInvest,  iIdTipoOperacao,
                                         iIdOperEmpAcoesAp, iCodDocumento,  iPlnCodigo,
                                         iPlano,            iPlanPrev : Integer;
                                         dDataOperacao,     dDataVencOper   : TDateTime;
                                         fQtdOperacao,      fPuOperacao,
                                         fTaxaOperacao                      : Double;
                                         fVlrOperacao,      fVlrIr,         fVlrResgate,
                                         fVlrJuros                          : Currency;
                                         sFlgReversao,      sFlgPreco, sConf: String) : Boolean;

begin
   //AL_15
   Result := False;

   If iPlano         = 0 Then
      iPlano        := -1;
   If iPlnCodigo     = 0 Then
      iPlnCodigo    := -1;
   If iCodDocumento  = 0 Then
      iCodDocumento := -1; 

   OperComum.LimpaParametros(DMEmprestAcoes.QryInsOperEmpAcoes, True);
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('IDOPEREMPACOES').AsInteger   := iIdOperEmpAcoes;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('IDCUSTODIANTE').AsInteger    := iIdCustodiante;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('IDCARTEIRAINVEST').AsInteger := iIdCarteiraInvest;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('IDINVESTIMENTO').AsInteger   := iIdInvestimento;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('IDTIPOINVEST').AsInteger     := iIdTipoInvest;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('IDTIPOOPERACAO').AsInteger   := iIdTipoOperacao;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('IDOPEREMPACOESAP').AsInteger := iIdOperEmpAcoesAp;
   if iCodDocumento > 0 then
      DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('CODDOCUMENTO').AsInteger  := iCodDocumento;
   if iPlnCodigo > 0 then
      DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('PLNCODIGO').AsInteger     := iPlnCodigo;
   if iPlano > 0 then
      DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('PLANO').AsInteger         := iPlano;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('DATAOPERACAO').AsDateTime    := dDataOperacao;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('DATAVENCOPER').AsDateTime    := dDataVencOper;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('QTDOPERACAO').AsFloat        := fQtdOperacao;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('PUOPERACAO').AsFloat         := fPuOperacao;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('TAXAOPERACAO').AsFloat       := fTaxaOperacao;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('VLROPERACAO').AsFloat        := fVlrOperacao;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('VLRIR').AsFloat              := fVlrIr;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('VLRRESGATE').AsFloat         := fVlrResgate;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('VLRJUROS').AsFloat           := fVlrJuros;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('FLGREVERSAO').AsString       := sFlgReversao;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('FLGPRECO').AsString          := sFlgPreco;
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('TIPOCONFIRMADO').AsString    := sConf;
   //AL_5
   DMEmprestAcoes.QryInsOperEmpAcoes.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
   DMEmprestAcoes.QryInsOperEmpAcoes.ExecSql;
   Result := True;
end;

//Al_1
//AL_4
function TEmprestAcoes.IntegraContabCapCar(iChave,iInvestimento,iTipoOperacao,iCarteiraInvest,
                                           iFlgGeraContab,iFlgGeraCapCar,iForCli,iTipoDoc,
                                           iTipoDespInvest :integer;
                                           sDescInvestimento, sHistorico : string;
                                           fValor, fEstornoJuros :Double;
                                           dDataProc, dDataVenc : TDateTime;
                                           var iPlanilha,iDocumento : integer;
                                           iFlgContaInvest : Integer = 0;
                                           //AL_11
                                           iPlanPrevPatr: Integer = -1):boolean;
var
    iPlano, iSubContaDeb,iSubContaCred, iUnidNegoc,iIdPlano: integer;
    sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred, sCentroRespon, sTipoRecDes, sTipoPer, sHistoricoOper,
    sRecPagNao, sMensErro: string;

begin
   Result := True;

   //AL_8
   if CtrlInvContab.IntegraCtbFinModulo then
   begin
      // al_6
      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
      if not CtrlInvContab.BuscaPadrLanc.ExecutaEmp(OperComum.RetornaSegmentacaoRV(iInvestimento), iPlanPrevPatr, 2, iTipoOperacao,
                                                    iInvestimento, iCarteiraInvest, iTipoDespInvest, 'OPE', fValor, dDataProc) then
      begin
         MsgDlg('Não foi encontrada parametrização contábil para ' + sHistorico,'Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
         Exit;
      end;

      if (iFlgGeraContab = 1) and (fValor <> 0) then
      begin
         //AL_6
         if not EmprestAcoes.ContabilizaEmpAcoes(fValor,
                                                 CtrlInvContab.BuscaPadrLanc.Plano, iForCli,
                                                 CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                 CtrlInvContab.BuscaPadrLanc.SubContaDeb,
                                                 CtrlInvContab.BuscaPadrLanc.SubContaCre,
                                                 CtrlInvContab.BuscaPadrLanc.Historico,
                                                 CtrlInvContab.BuscaPadrLanc.ContaDeb,
                                                 CtrlInvContab.BuscaPadrLanc.ContaCre,
                                                 CtrlInvContab.BuscaPadrLanc.CentroCustoDeb,
                                                 CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                 CtrlInvContab.BuscaPadrLanc.TipoPer,
                                                 CtrlInvContab.BuscaPadrLanc.RecPagNao,
                                                 dDataProc, iPlanilha,
                                                 //AL_11
                                                 iPlanPrevPatr)  then
         begin
            MsgDlg('Atenção : Não foi possível efetuar a contabilização do item.','Mensagem do Sistema ',mtWarning,[mbOK],0);
            Result := False;
            Exit;
         end;
      end;

      // Integra Financeiro ( Testar pelo tipo de operacao = OPE)
      if ((iFlgGeraCapCar = 1) and (sRecPagNao <> 'N')) Or
         ((iFlgGeraContab = 1) and (fValor <> 0))          then
      begin
         //Al_1
         //AL_6
         if not EmprestAcoes.IntegraCapCarEmpAcoes(fValor,iForCli,
                                                   CtrlInvContab.BuscaPadrLanc.Plano, iTipoDoc,
                                                   CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                   CtrlInvContab.BuscaPadrLanc.SubContaCre,
                                                   CtrlInvContab.BuscaPadrLanc.RecPagNao,
                                                   CtrlInvContab.BuscaPadrLanc.TipoRecDes,
                                                   CtrlInvContab.BuscaPadrLanc.ContaDeb,
                                                   CtrlInvContab.BuscaPadrLanc.ContaCre,
                                                   CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                   DateToStr(dDataProc),DateToStr(dDataVenc),
                                                   CtrlInvContab.BuscaPadrLanc.CentroRespon,
                                                   CtrlInvContab.BuscaPadrLanc.Historico,
                                                   iPlanilha, iDocumento, (iFlgGeraCapCar = 1),
                                                   sMensErro, False, iFlgContaInvest,
                                                   //AL_11
                                                   iPlanPrevPatr) then
         begin
            MsgDlg('Atenção : Não foi possível fazer a integração financeira do item.','Mensagem do Sistema ',mtWarning,[mbOK],0);
            Result := False;
            Exit;
         end;
      end;
 
      //AL_4 Ini
      if fEstornoJuros <> 0 then
      begin
         //AL_6
         //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
         if not CtrlInvContab.BuscaPadrLanc.ExecutaEmp(OperComum.RetornaSegmentacaoRV(iInvestimento), iPlanPrevPatr,2, iTipoOperacao,
                                                       iInvestimento, iCarteiraInvest, -6, 'DOP', fEstornoJuros, dDataProc) then
         begin
            MsgDlg('Não foi encontrada parametrização contábil para Estorno de Juros do ' + sHistorico,'Mensagem do Sistema ',mtWarning,[mbOK],0);
            Result := False;
            Exit;
         end
         else
         begin
            //AL_6
            if not EmprestAcoes.ContabilizaEmpAcoes(fEstornoJuros,
                                                    CtrlInvContab.BuscaPadrLanc.Plano, iForCli,
                                                    CtrlInvContab.BuscaPadrLanc.UnidNegoc,
                                                    CtrlInvContab.BuscaPadrLanc.SubContaDeb,
                                                    CtrlInvContab.BuscaPadrLanc.SubContaCre,
                                                    CtrlInvContab.BuscaPadrLanc.Historico,
                                                    CtrlInvContab.BuscaPadrLanc.ContaDeb,
                                                    CtrlInvContab.BuscaPadrLanc.ContaCre,
                                                    CtrlInvContab.BuscaPadrLanc.CentroCustoDeb,
                                                    CtrlInvContab.BuscaPadrLanc.CentroCustoCred,
                                                    CtrlInvContab.BuscaPadrLanc.TipoPer,
                                                    CtrlInvContab.BuscaPadrLanc.RecPagNao, dDataProc, iPlanilha,
                                                    //AL_11
                                                    iPlanPrevPatr)  then
            begin
               MsgDlg('Atenção : Não foi possível efetuar a contabilização do Estorno de Juros ' + #13 +
                      'do Empréstimo de Ações.','Mensagem do Sistema ',mtWarning,[mbOK],0);
               Result := False;
               Exit;
            end;
         end;
      end;
      //AL_4 Fim

      // Atualiza o HistRenFix
      if (iPlanilha <> -1) or (iDocumento <> -1) then
      begin
         if iTipoOperacao = -54 then
         begin
            //AL_6
            // Se for Operação de Atualização, Grava no Histórico
            if not EmprestAcoes.GravaPLNCODIGOHISTEMPACOES(iChave,iPlanilha,iDocumento,CtrlInvContab.BuscaPadrLanc.Plano) then
            begin
               MsgDlg('Atenção : Não foi Possível Atualizar o Histórico com o'#13+
                      'Código da Planilha e/ou Documento.','Mensagem do Sistema ',mtWarning,[mbOK],0);
               Result := False;
               Exit;
            end;
         end
         else
         begin
            //AL_6
            // Se for Operação de Aplicação ou Resgate Grava na Operação
            if not EmprestAcoes.GravaPLNCODIGOOPEREMPACOES(iChave,iPlanilha,iDocumento,CtrlInvContab.BuscaPadrLanc.Plano) then
            begin
               MsgDlg('Atenção : Não foi Possível Atualizar a Operação com o'#13+
                      'Código da Planilha e/ou Documento.','Mensagem do Sistema ',mtWarning,[mbOK],0);
               Result := False;
               Exit;
            end;
         end;
      end;
   end;
end;

function TEmprestAcoes.ContabilizaEmpAcoes(fValor:Double;
                                           iPlano, iForCli,iUnidNegoc,iSubContaDeb, iSubContaCred :integer;
                                           sHistorico, sContaDeb, sContaCred, sCentroCustoDeb, sCentroCustoCred,
                                           sTipoPer, sRecPagNao : string;
                                           dDataProc : TDateTime;
                                           var iPlanilha : integer;
                                           //AL_11
                                           iPlanPrevPatr: integer ):boolean;
var
   sMensErro  : string;
   bMostraMsg : boolean;
   //AL_11
   iPlanoPrev,iPatro: integer;
   qry: TwwQuery;
begin
   //AL_15
   try
      Result := False;

      //AL_11- Busca o PlanoPrev e o Patro
      qry := TwwQuery.Create(Application);
      qry.DatabaseName := 'BaseDados';

      if iPlanPrevPatr = -1 then
         iPlanPrevPatr := iPlanPrevCtbPatro;
      qry.Close;
      qry.Sql.Clear;
      qry.Sql.Add('SELECT PLANPRVCONTABPATRO AS NOME, IDPATRO, IDPLANOPREV ');
      qry.Sql.Add('FROM VWPLANPREVCTBPATR ');
      qry.Sql.Add('WHERE IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevPatr));
      qry.Open;
      iPlanoPrev := qry.FieldByName('IDPLANOPREV').AsInteger;
      iPatro     := qry.FieldByName('IDPATRO').AsInteger;
      sHistorico := sHistorico +' - '+TRIM(qry.FieldByName('NOME').AsString);
      // Fim AL_11

      // AL_6 - Inicio
      bMostraMsg := False;

      if iPlanilha = -1 then
         iPlanilha := 0;

      //AL_11
      if not OperComum.LancamentoContabil(Sistema.IdEmpresa, Sistema.IdModulo, iPlano, iSubContaDeb,
                                          iSubContaCred, iUnidNegoc, iForCli,
                                          iPlanoPrev, iPatro,
                                          sContaDeb, sContaCred, sCentroCustoDeb,
                                          sCentroCustoCred, sHistorico, sTipoPer, sRecPagNao, dDataProc, ABS(fValor),
                                          bMostraMsg, iPlanilha, sMensErro)  then
      begin
         if sMensErro = '' then
            MsgDlg('Não foi possível efetuar o lançamento contábil.',
                   'Mensagem do Sistema ',mtWarning,[mbOK],0)
         else
            MsgDlg(sMensErro , 'Mensagem do Sistema', mtWarning, [mbOK],0);
         Exit;
      end;
      Result := True;
      // AL_6 - Fim
   finally
      //AL_11
      qry.close;
      FreeAndNil(qry);
   end;
end;

//Al_1 
// AL_6
function TEmprestAcoes.IntegraCapCarEmpAcoes(fValor:Double;iForCli, iPlano, iTipoDoc,iUnidNegoc,iSubContaCred : integer;
                                             sRecPagNao,sTipoRecDes,sContaDeb, sContaCred,sCentroCustoCred,
                                             sDataLanc,sDataVenc,sCentroRespon, sHistCapCar : string;
                                             var iPlanilha, iDocumento : integer;
                                             bCapCar         : Boolean;
                                             var sMensErro: String; bMostraErro: Boolean = False;
                                             iFlgContaInvest : Integer = 0;
                                             //AL_11
                                             iPlanPrevPatr: Integer = -1): boolean;
var
   // AL_6
   sDebCre, sComplemento, sStatus, sOperacao, sContaDoc : string;
   iPortador,iNumFatura : integer;
   fNoDocumento         : Double;
   //AL_11
   iPlanoPrev,iPatro: integer;
   qry: TwwQuery;
begin
   //AL_6 - Inicio
   //AL_15 - Inicio
   try
      try
         Result := False;

         //AL_11- Busca o PlanoPrev e o Patro
         qry := TwwQuery.Create(Application);
         qry.DatabaseName := 'BaseDados';

         if iPlanPrevPatr = -1 then
            iPlanPrevPatr := iPlanPrevCtbPatro;
         qry.Close;
         qry.Sql.Clear;
         qry.Sql.Add('SELECT PLANPRVCONTABPATRO AS NOME, IDPATRO, IDPLANOPREV ');
         qry.Sql.Add('FROM VWPLANPREVCTBPATR ');
         qry.Sql.Add('WHERE IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevPatr));
         qry.Open;
         iPlanoPrev := qry.FieldByName('IDPLANOPREV').AsInteger;
         iPatro     := qry.FieldByName('IDPATRO').AsInteger;
         // Fim AL_11

         fValor := abs(fValor);
         iPortador := -1;

         // Prepara um novo documento
         CtrlInvContab.Documento.Prepare;

         CtrlInvContab.Documento.GetNoDocumento;
         fNoDocumento := CtrlInvContab.Documento.NoDocumento;

         sComplemento      := '79';
         sStatus           := '';
         iNumFatura        := 0;
         sOperacao         := '2';
         if sRecPagNao[1]   = 'P' then
         begin
            sContaDoc := sContaCred;
            sDebCre   := 'C';
         end
         else
         begin
            sContaDoc := sContaDeb;
            sDebCre   := 'D';
         end;

         If bCapCar Then
         begin
            // gera o identificador incremental da tabela DOCUMENTO
            if CtrlInvContab.Documento.GetDocSequence then
               iDocumento := CtrlInvContab.Documento.CodDocumento;

            if Trim(sRecPagNao) = '' then
               Raise Exception.Create('Tipo de Recebimento/Desembolso não especificado.');
            if Trim(sTipoRecDes) = '' then
               Raise Exception.Create('Tipo de Recebimento/Desembolso não especificado.');

            // Parametros para a Segregação // Verificar
            CtrlInvContab.Plano := iPlano;
            //AL_11
            CtrlInvContab.Patro := iPatro;
            CtrlInvContab.PlanPrev := iPlanoPrev; // Fim AL_11
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
                                                     Sistema.IdUsuario, Sistema.idEmpresa, 1{liFlgnaoconciliado}, 0{liControleremessa},
                                                     iSubContaCred, iPortador, 0{liCodgrupocnab}, 0{liCodgeradorinss}, -1{liCodforma},
                                                     StrToDate(sDataVenc) {dDataDisp},
                                                     CtrlInvContab.CriterioSegregacao {iIdSegregaCriter: integer = -1}) then
               Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

            if iFlgContaInvest > 0 then
               CtrlInvContab.Documento.ContaInvest := iFlgContaInvest;

            if sRecPagNao <> 'N' then
            begin
               // Cria Rateio
               if not CtrlInvContab.Documento.RateioDocumSetValues(
                                    fValor, 0{rValorOM}, 0{rVlrresorcamen},
                                    0{liIdrateiodocum}, Sistema.idEmpresa {liIdpessoa},
                                    iDocumento, iUnidNegoc, 0{liMoecodigo}, Sistema.IdUsuario,
                                    0{liIdreservaorcamen},
                                    iPlano,
                                    //AL_11
                                    //iPlanoPrevContab,
                                    iPlanoPrev,
                                    //iPatrocinadora,
                                    iPatro,
                                    pRPI.IDPROGRAMA, // dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger,
                                    0{liIdprocesso}, Sistema.idEmpresa,
                                    sTipoRecDes, sRecPagNao[1], sCentroRespon,
                                    sCentroCustoCred, ''{sNumimovel}) then
                  Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
            end;

            // Cria LanctoDocum em 3 camadas
            if not CtrlInvContab.Documento.LancoDocumSetValues(
                                 StrToDate(sDataLanc), iDocumento, 0 {iNumLancamento},
                                 fValor, 0{rValorOM}, fValor,
                                 iUnidNegoc, CtrlInvContab.Planilha, 0{liNumlotemanual},
                                 Sistema.idUsuario, Sistema.idEmpresa,
                                 0{liIdnflivro}, 0{liEstorno}, iTipoDoc, 0{liCoddocinss}, 0{liCodalterador},
                                 sOperacao,  ''{sNumrecibo}, ''{sNumnf}, ''{sNumfatura},
                                 sHistCapCar, ''{sFlgtipofatura}, ''{sFlgrecebeunf}, ''{sFlgfatemitida},
                                 sDebCre, Sistema.IdModulo, iPlano,
                                 Sistema.UsaPlanoPatro) then
               Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);

            // Finaliza o Documento e gera o CodDocumento
            if CtrlInvContab.Documento.DocumentoPendente then
            begin
               if not CtrlInvContab.Documento.Insert then
                  Raise Exception.Create(CtrlInvContab.Documento.MessageInfo);
            end;

         end;
         Result := True;
      except
         on E: Exception do
         begin
            Result := False;
            if bMostraErro then
               MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOK], 0)
            else
               sMensErro := E.Message;
         end;
      end;
      // AL_6 - Fim
   finally
      qry.close;
      FreeAndNil(qry);
   end;
   //AL_15 - Fim
end;

//AL_4
function TEmprestAcoes.GravaPLNCODIGOHISTEMPACOES(iIdHistEmpAcoes,iPlanilha,iDocumento,iPlano:integer):boolean;
begin
   //AL_15
   Result := False;
   try
      OperComum.LimpaParametros(DMEmprestAcoes.qryUpdHistEmpAcoes, True);
      DMEmprestAcoes.qryUpdHistEmpAcoes.ParamByName('IDHISTEMPACOES').AsInteger  := iIdHistEmpAcoes;
      if iPlanilha <> -1 then
         DMEmprestAcoes.qryUpdHistEmpAcoes.ParamByName('PLNCODIGO').AsInteger       := iPlanilha;
      if iDocumento <> -1 then
         DMEmprestAcoes.qryUpdHistEmpAcoes.ParamByName('CODDOCUMENTO').AsInteger    := iDocumento;
         if iPlano <> -1 then
         DMEmprestAcoes.qryUpdHistEmpAcoes.ParamByName('PLANO').AsInteger        := iPlano;
      DMEmprestAcoes.qryUpdHistEmpAcoes.ExecSql;

      Result := True;
   Finally
      DMRendaFixa.qryUpdHistRenFix.Close;
   end;
end;

function TEmprestAcoes.GravaPLNCODIGOOPEREMPACOES(iIdOperEmpAcoes, iPlanilha, iDocumento, iPlano: integer): boolean;
begin
   //AL_15
   Result := False;

   Try
      OperComum.LimpaParametros(DMEmprestAcoes.qryUpdOperEmpAcoes, True);
      DMEmprestAcoes.qryUpdOperEmpAcoes.ParamByName('IDOPEREMPACOES').AsInteger  := iIdOperEmpAcoes;
      if iPlanilha <> -1 then
         DMEmprestAcoes.qryUpdOperEmpAcoes.ParamByName('PLNCODIGO').AsInteger    := iPlanilha;
      if iDocumento <> -1 then
         DMEmprestAcoes.qryUpdOperEmpAcoes.ParamByName('CODDOCUMENTO').AsInteger := iDocumento;
      if iPlano <> -1 then
         DMEmprestAcoes.qryUpdOperEmpAcoes.ParamByName('PLANO').AsInteger        := iPlano;
      DMEmprestAcoes.qryUpdOperEmpAcoes.ExecSql;
      Result := True;
   finally
      DMEmprestAcoes.qryUpdOperEmpAcoes.Close;
   end;
end;

//AL_4
function TEmprestAcoes.ExcluiContabEmpAcoes(iPlanilha, iPlano : integer):boolean;
begin
   //AL_15
   Result := False;
   if iPlanilha <> 0 then
   begin
      //AL_4
      //AL_6 - Passa a valer a exclusão em 3 camadas
      //AL_7
      //AL_12
      if not CtrlInvContab.InvExcluiLanc(iPlanilha, 0, Sistema.UsaPlanoPatro, False) then
         Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' + IntToStr(iPlanilha));
   end;
   Result := True;
end;

function TEmprestAcoes.ExcluiFinanceiroEmpAcoes(iDocumento : integer) :boolean;
begin
   //AL_15
   Result := False;
   if iDocumento <> 0 then
   begin
      if not CtrlInvContab.Documento.Delete(iDocumento) then
         Raise Exception.Create('Ocorreu um problema na exclusão dos lançamentos Financeiros' + #13 +
                                'Mensagem: ' + CtrlInvContab.Documento.MessageInfo);
   end;
   Result := True;                                                    

end;

//AL_10
function TEmprestAcoes.SumSaldosEmpAcoes(dDataRef: TDateTime; iPlanPrev, iIdInvestimento: Integer; var fSldQtdHist: double): boolean;
begin
   //AL_15
   try
      Result := False;
      fSldQtdHist := 0;
      OperComum.LimpaParametros(DMEmprestAcoes.qrySumSaldoEmpAcoes);
      if iPlanPrev > 0 then
         DMEmprestAcoes.qrySumSaldoEmpAcoes.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
      if iIdInvestimento > 0 then
         DMEmprestAcoes.qrySumSaldoEmpAcoes.ParamByName('IDINVESTIMENTO').AsInteger := iIdInvestimento;
      DMEmprestAcoes.qrySumSaldoEmpAcoes.ParamByName('DATAVENCOPER').AsString       := DateToStr(dDataRef);
      DMEmprestAcoes.qrySumSaldoEmpAcoes.Open;
      if not DMEmprestAcoes.qrySumSaldoEmpAcoes.IsEmpty then
      begin
         fSldQtdHist := DMEmprestAcoes.qrySumSaldoEmpAcoes.FieldByName('SLDQTDHIST').AsFloat;
         Result := True;
      end;
   finally
      DMEmprestAcoes.qrySumSaldoEmpAcoes.Close;
   end;
end;

//AL_10
function TEmprestAcoes.SumSaldosHistEmpAcoes(dDataRef:TDateTime; iPlanPrev, iIdInvestimento, iOperEmpAcoes:Integer; var fSldQtdHist: double):boolean;
begin
   //AL_14
   //AL_15
   try
      Result := False;
      fSldQtdHist := 0;
      OperComum.LimpaParametros(DMEmprestAcoes.qrySumSaldoHistEmpAcoes);
      if iPlanPrev > 0 then
         DMEmprestAcoes.qrySumSaldoHistEmpAcoes.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
      if iIdInvestimento > 0 then
         DMEmprestAcoes.qrySumSaldoHistEmpAcoes.ParamByName('IDINVESTIMENTO').AsInteger := iIdInvestimento;
      if iOperEmpAcoes > 0 then
         DMEmprestAcoes.qrySumSaldoHistEmpAcoes.ParamByName('IDOPEREMPACOES').AsInteger := iOperEmpAcoes;
      DMEmprestAcoes.qrySumSaldoHistEmpAcoes.ParamByName('dDataRef').AsString  := DateToStr(dDataRef);
      DMEmprestAcoes.qrySumSaldoHistEmpAcoes.Open;
      if not DMEmprestAcoes.qrySumSaldoHistEmpAcoes.IsEmpty then
      begin
         fSldQtdHist := DMEmprestAcoes.qrySumSaldoHistEmpAcoes.FieldByName('SLDQTDHIST').AsFloat;
         Result := True;
      end;
   finally
      DMEmprestAcoes.qrySumSaldoHistEmpAcoes.Close;
   end;
end;

function TEmprestAcoes.ExcluiEmprestimoAcoes(iIdOperEmpAcoes:integer;dDataRef,sOper:string; bExclui : boolean) : boolean;
var
   sSql : string;
begin
   //AL_15
   try
      Result := False;
      // Seleciona registros para exclusão da Contabilidade / Financeiro
      DMEmprestAcoes.qryAux1.Close;
      DMEmprestAcoes.qryAux1.Sql.Clear;
      sSql := 'SELECT DISTINCT PLNCODIGO, PLANO, CODDOCUMENTO FROM HISTEMPACOES WHERE ';
      if iIdOperEmpAcoes <> -1 then
         sSql := sSql + 'IDOPEREMPACOESAP =  '+IntToStr(iIdOperEmpAcoes)+' AND ';
      If Not bExclui Then
         sSql := sSql + 'IDTIPOOPERACAO   = -54 AND ';
      sSql := sSql + 'DATAHISTEMPACOES   >= TO_DATE('''+dDataRef+''',''DD/MM/YYYY'')';
      DMEmprestAcoes.qryAux1.Sql.Add(sSQL);
      DMEmprestAcoes.qryAux1.Open;

      // Exclui a operacao do dia
      If bExclui Then
      begin
         DMEmprestAcoes.qryAux.Close;
         DMEmprestAcoes.qryAux.Sql.Clear;
         sSql := 'DELETE FROM HISTEMPACOES WHERE ';
         if iIdOperEmpAcoes <> -1 then
            sSql := sSql + 'IDOPEREMPACOESAP =  '+IntToStr(iIdOperEmpAcoes)+' AND ';
         sSql := sSql + 'DATAHISTEMPACOES >= TO_DATE('''+dDataRef+''',''DD/MM/YYYY'')';
         DMEmprestAcoes.qryAux.Sql.Add(sSQL);
         DMEmprestAcoes.qryAux.ExecSql;
      end
      else
      begin
        // Exclui lançamentos futuros
         DMEmprestAcoes.qryAux.Close;
         DMEmprestAcoes.qryAux.Sql.Clear;
         sSql := 'DELETE FROM HISTEMPACOES WHERE ';
         if iIdOperEmpAcoes <> -1 then
            sSql := sSql + 'IDOPEREMPACOESAP =  '+IntToStr(iIdOperEmpAcoes)+' AND ';
         if iIdOperEmpAcoes = -1 then
            sSql := sSql + 'IDTIPOOPERACAO      = -54 AND ';
         sSql := sSql + 'DATAHISTEMPACOES   >= TO_DATE('''+dDataRef+''',''DD/MM/YYYY'')';
         DMEmprestAcoes.qryAux.Sql.Add(sSQL);
         DMEmprestAcoes.qryAux.ExecSql;
      end;
      // Exclui operacao
      If bExclui Then
      begin
         DMEmprestAcoes.qryAux.Close;
         DMEmprestAcoes.qryAux.sql.Clear;
         sSql := 'DELETE FROM OPEREMPACOES WHERE ';
         if iIdOperEmpAcoes <> -1 then
            sSql := sSql + 'IDOPEREMPACOESAP =  '+IntToStr(iIdOperEmpAcoes)+' AND ';
         sSql := sSql + 'DATAOPERACAO    >= TO_DATE('''+dDataRef+''',''DD/MM/YYYY'')';
         DMEmprestAcoes.qryAux.Sql.Add(sSQL);
         DMEmprestAcoes.qryAux.ExecSql;
      end;

      // Exclui da contabilidade / Financeiro
      if not DMEmprestAcoes.qryAux1.IsEmpty then
      begin
         while not (DMEmprestAcoes.qryAux1.Eof) do
         begin
            If DMEmprestAcoes.qryAux1.FieldByName('CODDOCUMENTO').AsInteger <> 0 Then
            begin
               if not EmprestAcoes.ExcluiFinanceiroEmpAcoes(DMEmprestAcoes.qryAux1.FieldByName('CODDOCUMENTO').AsInteger) then
                  Exit;
            end;

            If DMEmprestAcoes.qryAux1.FieldByName('PLNCODIGO').AsInteger <> 0 Then
            begin
               //AL_4
               if not EmprestAcoes.ExcluiContabEmpAcoes(DMEmprestAcoes.qryAux1.FieldByName('PLNCODIGO').AsInteger,
                                                        DMEmprestAcoes.qryAux1.FieldByName('PLANO').AsInteger) then
                  Exit;
            end;

            DMEmprestAcoes.qryAux1.Next;
         end;
      end;
      Result := True;
   finally
      DMEmprestAcoes.qryAux1.Close;
   end;
end;

function TEmprestAcoes.ExcluiOperEmpAcoes(iIdOperEmpAcoes, iIdOperEmpAcoesAP: Integer;
                                          dDataOper: TDateTime; sOper: String): boolean;
begin
   //AL_14
   //AL_15
   try
      Result := False;

      // Seleciona registros de Histórico para exclusão da Contabilidade / Financeiro
      OperComum.LimpaParametros(DMEmprestAcoes.qrySelHist, True);
      DMEmprestAcoes.qrySelHist.ParamByName('IDOPEREMPACOES').AsInteger   := iIdOperEmpAcoes;
      DMEmprestAcoes.qrySelHist.ParamByName('IDOPEREMPACOESAP').AsInteger := iIdOperEmpAcoesAP;
      DMEmprestAcoes.qrySelHist.ParamByName('DATAHISTEMPACOES').AsString  := DateToStr(dDataOper);
      DMEmprestAcoes.qrySelHist.Open;

      while not DMEmprestAcoes.qrySelHist.Eof do
      begin
         // Exclui o Histórico
         OperComum.LimpaParametros(DMEmprestAcoes.qryExclHist,True);
         DMEmprestAcoes.qryExclHist.ParamByName('IDHISTEMPACOES').AsInteger := DMEmprestAcoes.qrySelHist.FieldByName('IDHISTEMPACOES').AsInteger;
         DMEmprestAcoes.qryExclHist.ExecSQL;

         // Exclui o Contábil e Financeiro para manter compatibilidade.
         if DMEmprestAcoes.qrySelHist.FieldByName('CODDOCUMENTO').AsInteger <> 0 Then
         begin
            if not EmprestAcoes.ExcluiFinanceiroEmpAcoes(DMEmprestAcoes.qrySelHist.FieldByName('CODDOCUMENTO').AsInteger) then
               Exit;
         end;

         if DMEmprestAcoes.qrySelHist.FieldByName('PLNCODIGO').AsInteger <> 0 Then
         begin
            //al_4
            if not EmprestAcoes.ExcluiContabEmpAcoes(DMEmprestAcoes.qrySelHist.FieldByName('PLNCODIGO').AsInteger,
                                                     DMEmprestAcoes.qrySelHist.FieldByName('PLANO').AsInteger) then
               Exit;
         end;

         DMEmprestAcoes.qrySelHist.Next;
      end;

      //Seleciona operação
      OperComum.LimpaParametros(DMEmprestAcoes.qrySelOper,True);
      DMEmprestAcoes.qrySelOper.ParamByName('IDOPEREMPACOES').AsInteger := iIdOperEmpAcoes;//qrySelHistIDOPEREMPACOES.AsInteger;
      DMEmprestAcoes.qrySelOper.Open;

      // Exclui a operação
      OperComum.LimpaParametros(DMEmprestAcoes.qryExclOper,True);
      DMEmprestAcoes.qryExclOper.ParamByName('IDOPEREMPACOES').AsInteger := iIdOperEmpAcoes;//qrySelHistIDOPEREMPACOES.AsInteger;
      DMEmprestAcoes.qryExclOper.ExecSQL;

      // Exclui o Contábil e Financeiro para manter compatibilidade.
      if DMEmprestAcoes.qrySelOper.FieldByName('CODDOCUMENTO').AsInteger <> 0 Then
      begin
         if not EmprestAcoes.ExcluiFinanceiroEmpAcoes(DMEmprestAcoes.qrySelOper.FieldByName('CODDOCUMENTO').AsInteger) then
            Exit;
      end;

      if DMEmprestAcoes.qrySelOper.FieldByName('PLNCODIGO').AsInteger <> 0 Then
      begin
         //AL_4
         if not EmprestAcoes.ExcluiContabEmpAcoes(DMEmprestAcoes.qrySelOper.FieldByName('PLNCODIGO').AsInteger, DMEmprestAcoes.qrySelOper.FieldByName('PLANO').AsInteger) then
            Exit;
      end;

      Result := True;

   finally
      DMEmprestAcoes.qrySelHist.Close;
      DMEmprestAcoes.qrySelOper.Close;
   end;
end;

//AL_5
function TEmprestAcoes.ExcluiHistEmpAcoes(iIdOperEmpAp, iPlanPrev : integer; dDataExcl: TDateTime): boolean;
begin
   //AL_15
   //AL_14
   try
      Result := False;
      //AL_10 - Ini
      // Seleciona registros de Histórico para exclusão da Contabilidade / Financeiro
      OperComum.LimpaParametros(DMEmprestAcoes.qrySelHist, True);
      DMEmprestAcoes.qrySelHist.ParamByName('DATAHISTEMPACOES').AsString := DateToStr(dDataExcl);
      if (iIdOperEmpAp <> -1) And (iIdOperEmpAp <> 0)  then
         DMEmprestAcoes.qrySelHist.ParamByName('IDOPEREMPACOESAP').AsInteger := iIdOperEmpAp;
      //AL_5
      //Ajuste no nome do parâmetro - Turon
      if (iPlanPrev <> -1)  then
         DMEmprestAcoes.qrySelHist.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
      DMEmprestAcoes.qrySelHist.Open;

      frmAguardeInv.Pos := 0;
      frmAguardeInv.Max := DMEmprestAcoes.qrySelHist.RecordCount;

      while not DMEmprestAcoes.qrySelHist.Eof do
      begin
         frmAguardeInv.Mostra('Excluindo Históricos do Dia ' + DMEmprestAcoes.qrySelHist.FieldByName('DATAHISTEMPACOES').AsString);
         //AL_10 - Exclui inclusive os resgates
         // Exclui o Histórico
         OperComum.LimpaParametros(DMEmprestAcoes.qryExclHist,True);
         DMEmprestAcoes.qryExclHist.ParamByName('IDHISTEMPACOES').AsInteger := DMEmprestAcoes.qrySelHist.FieldByName('IDHISTEMPACOES').AsInteger;
         DMEmprestAcoes.qryExclHist.ExecSQL;

         // Exclui o Contábil e Financeiro para manter compatibilidade.
         // AL_9
         if CtrlInvContab.IntegraCtbFinModulo then
         begin
            if (DMEmprestAcoes.qrySelHist.FieldByName('CODDOCUMENTO').AsInteger <> 0) Then
            begin
               if not EmprestAcoes.ExcluiFinanceiroEmpAcoes(DMEmprestAcoes.qrySelHist.FieldByName('CODDOCUMENTO').AsInteger) then
                  Exit;
            end;

            if DMEmprestAcoes.qrySelHist.FieldByName('PLNCODIGO').AsInteger <> 0 Then
            begin
               //AL_4
               if not EmprestAcoes.ExcluiContabEmpAcoes(DMEmprestAcoes.qrySelHist.FieldByName('PLNCODIGO').AsInteger,
                                                        DMEmprestAcoes.qrySelHist.FieldByName('PLANO').AsInteger) then
                  Exit;
            end;
         end;
         frmAguardeInv.Incrementa;
         DMEmprestAcoes.qrySelHist.Next;
      end;
      Result := True;
      //AL_10 - Fim
   finally
      DMEmprestAcoes.qrySelHist.Close;
      frmAguardeInv.Apaga;
   end;
end;

//AL_10
function TEmprestAcoes.BuscaSaldosCustodia(IdPlanPrev, IdCarteira, IdInvestimento, IdCustodia,
                                           IdCustodiante, IdMotivoBloqueio: Integer;
                                           IdLote: String; DataReferencia:TDateTime;
                                           Var fSdoBloqueado, fSdoLiberado: Double): boolean;
var
  fCotacao : Double;
begin
   //AL_14
   try
      Result := False;
      fSdoLiberado  := 0;
      fSdoBloqueado := 0;

      OperComum.LimpaParametros(DMEmprestAcoes.QrySaldoCustodia);
      //AL_10
      DMEmprestAcoes.QrySaldoCustodia.ParamByName('IDPLANPREVCTBPATR').AsInteger := IdPlanPrev;
      DMEmprestAcoes.QrySaldoCustodia.ParamByName('IDCARTEIRAINVEST').AsInteger  := IdCarteira;
      DMEmprestAcoes.QrySaldoCustodia.ParamByName('IDINVESTIMENTO').AsInteger    := IdInvestimento;
      DMEmprestAcoes.QrySaldoCustodia.ParamByName('IDCUSTODIA').AsInteger        := IdCustodia;
      DMEmprestAcoes.QrySaldoCustodia.ParamByName('DATAMOV').AsString            := DateToStr(DataReferencia);
      DMEmprestAcoes.QrySaldoCustodia.ParamByName('IDLOTE').AsString             := IdLote;
      DMEmprestAcoes.QrySaldoCustodia.ParamByName('IDCUSTODIANTE').AsInteger     := IdCustodiante;
      DMEmprestAcoes.QrySaldoCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger  := IdMotivoBloqueio;
      DMEmprestAcoes.QrySaldoCustodia.Open;

      // Gera Retorno caso tenha encontrado Registro
      if not DMEmprestAcoes.QrySaldoCustodia.IsEmpty then
      begin
         Result := True;
         fSdoLiberado  := DMEmprestAcoes.QrySaldoCustodia.FieldByName('SALDOLIBERADO').asFloat;
         fSdoBloqueado := DMEmprestAcoes.QrySaldoCustodia.FieldByName('SALDOBLOQUEADO').asFloat;
      end;
   finally
       DMEmprestAcoes.QrySaldoCustodia.Close;
   end;
end;

//AL_10
function TEmprestAcoes.VerificaTransfEmptmoAcoes(iPlanPrev, iCarteira, iCustodiante, iIdInvestimento: integer;
                                                 fQtdTransf: Double; dDataRef: string;
                                                 bMostraMens: Boolean = True): boolean;
var
   fSldQtdHist,fSdoBloqueado, fSdoLiberado : Double;
begin

   Result := True;

   //AL_15
   if CtrlPInv.IdCartEmpAcoes = iCarteira then
   begin
      // Busca o saldo bloqueado para Empréstimo de Ações
      //AL_10
      EmprestAcoes.BuscaSaldosCustodia(iPlanPrev, CtrlPInv.IdCartEmpAcoes, iIdInvestimento,9999999,iCustodiante,
                                       CtrlPInv.IdMotBloqEmpAC,'',StrToDate(dDataRef),fSdoBloqueado, fSdoLiberado);

      // Busca o saldo de Empréstimos de Ações não Vencidos
      //AL_10
      EmprestAcoes.SumSaldosEmpAcoes(StrToDate(dDataRef), iPlanPrev, iIdInvestimento, fSldQtdHist);

      if fSldQtdHist > 0 then
      begin
         if fQtdTransf > (fSdoBloqueado - fSldQtdHist) then
         begin
            if bMostraMens then
               MsgDlg('Operação não permitida. Existe saldo em garantia'+#13+
                      'para Empréstimo de Ações.','Mensagem do Sistema',mtWarning,[MbOk],0);
            Result := False;
         end;
      end;
   end;
end;

// AL_10
function TEmprestAcoes.VerificaSaldoCustodia(dDataOper: TDateTime;
                                             iPlanPrev, iInvestimento, iCustodiante, iOperEmpAcoes: Integer;
                                             var fSaldoHist: Double;
                                             var fSaldoBloq: Double;
                                             var fSaldoLib:  Double;
                                             var fSaldoCalc: Double;
                                             iTipoOper: Integer = 0): boolean;
var wSdoQtdCPMF, wSaldoQtd, wSaldoInutil: Double;
begin
   Result := False;
   try
      //Busca o saldo bloqueado para Empréstimo de Ações
      //AL_10
      //AL_15
      if not EmprestAcoes.BuscaSaldosCustodia(iPlanPrev, CtrlPInv.IdCartEmpAcoes, iInvestimento,
                                              9999999, iCustodiante, CtrlPInv.IdMotBloqEmpAC, '',
                                              dDataOper, fSaldoBloq, fSaldoLib) then
         Raise Exception.Create('Não Encontrado Saldo de Custódia para este Investimento/Custodiante.');

      //AL_10
      // Busca o saldo de Empréstimos de Ações não Vencidos
      EmprestAcoes.SumSaldosHistEmpAcoes(dDataOper, iPlanPrev, iInvestimento, iOperEmpAcoes, fSaldoHist);

      //AL_10
      Case iTipoOper of
         -52, -10052: fSaldoCalc := fSaldoBloq - fSaldoHist;
         -53, -10053: fSaldoCalc := fSaldoHist;
         -54, -10054: fSaldoCalc := fSaldoBloq - fSaldoHist;
         else fSaldoCalc := 0;
      end;

      Result := True;
   except
      Result := False;
   end;

end;

function TEmprestAcoes.RefazOperacoes: String;
var fSldHist, fSldQtdHist: Double;
    iIdHistEmpAcoes: Integer;
begin

   Result      := '';
   fSldHist    := 0;
   fSldQtdHist := 0;

   try
      //AL_15
      BuscaSaldosAux(DMEmprestAcoes.qryExisteOperacoes.FieldByName('DATAOPERACAO').AsDateTime,
                     DMEmprestAcoes.qryExisteOperacoes.FieldByName('IDINVESTIMENTO').AsInteger,
                     DMEmprestAcoes.qryExisteOperacoes.FieldByName('IDOPEREMPACOESAP').AsInteger, -1,
                     DMEmprestAcoes.qryExisteOperacoes.FieldByName('IDPLANPREVCTBPATR').AsInteger);

      try
         // Busca Saldos Anteriores
         //AL_10 - Ini
         Case DMEmprestAcoes.qryExisteOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger of
         -52, -10052: // Aplicação
           begin
              fSldHist    := DMEmprestAcoes.qryExisteOperacoes.FieldByName('VLROPERACAO').AsFloat;
              fSldQtdHist := DMEmprestAcoes.qryExisteOperacoes.FieldByName('QTDOPERACAO').AsFloat;
           end;
         -53, -10053: // Resgate
           begin
              fSldHist    := DMEmprestAcoes.qryBuscaSaldosAux.FieldByName('SLDHISTEMPACOES').AsFloat - DMEmprestAcoes.qryExisteOperacoes.FieldByName('VLROPERACAO').AsFloat;
              fSldQtdHist := DMEmprestAcoes.qryBuscaSaldosAux.FieldByName('SLDQTDHISTEMPACOE').AsFloat - DMEmprestAcoes.qryExisteOperacoes.FieldByName('QTDOPERACAO').AsFloat;
           end;
         end;
         //AL_10 - Fim

         // Grava Histórico
         iIdHistEmpAcoes := LeUltRegistro(nil, 'HISTEMPACOES');
         if not EmprestAcoes.GravaHistEmpAcoes(iIdHistEmpAcoes,
                                               DMEmprestAcoes.qryExisteOperacoes.FieldByName('IDCUSTODIANTE').AsInteger,
                                               DMEmprestAcoes.qryExisteOperacoes.FieldByName('IDINVESTIMENTO').AsInteger,
                                               DMEmprestAcoes.qryExisteOperacoes.FieldByName('IDTIPOOPERACAO').AsInteger,
                                               DMEmprestAcoes.qryExisteOperacoes.FieldByName('IDOPEREMPACOES').AsInteger,
                                               DMEmprestAcoes.qryExisteOperacoes.FieldByName('IDOPEREMPACOESAP').AsInteger,
                                               //AL_5
                                               DMEmprestAcoes.qryExisteOperacoes.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               DMEmprestAcoes.qryExisteOperacoes.FieldByName('DATAOPERACAO').AsDateTime,
                                               DMEmprestAcoes.qryExisteOperacoes.FieldByName('VLROPERACAO').AsFloat,
                                               fSldHist,
                                               DMEmprestAcoes.qryExisteOperacoes.FieldByName('QTDOPERACAO').AsFloat,
                                               fSldQtdHist,
                                               DMEmprestAcoes.qryExisteOperacoes.FieldByName('NATUREZAOPERACAO').AsString) then
            Raise Exception.Create('Não foi possível incluir o histórico desta operação.');

      except
         on E: Exception do
         begin
            Result := E.Message;
            Exit;
         end;
      end;
   finally
      DMEmprestAcoes.qryBuscaSaldosAux.Close;
   end;
end;


//AL_10
function TEmprestAcoes.VerExisteOperEmprestimo(dDataProc: TDateTime; iOperEmpAplic: Integer): boolean;
begin
   try
      OperComum.LimpaParametros(DMEmprestAcoes.QryVerExisteOperEmprestimo);
      DMEmprestAcoes.QryVerExisteOperEmprestimo.ParamByName('DATAOPERACAO').AsString      := DateToStr(dDataProc);
      DMEmprestAcoes.QryVerExisteOperEmprestimo.ParamByName('IDOPEREMPACOESAP').AsInteger := iOperEmpAplic;
      DMEmprestAcoes.QryVerExisteOperEmprestimo.Open;
      Result := (not DMEmprestAcoes.QryVerExisteOperEmprestimo.IsEmpty);
   finally
      DMEmprestAcoes.QryVerExisteOperEmprestimo.Close;
   end;
end;

//AL_4
//AL_10
function TEmprestAcoes.MarcaFlgReproc(dDataRef : TDateTime; iIdOperEmpAp: Integer = -1; iIdInvestimento: Integer = -1; iPlanPrev: Integer = -1) : boolean;
begin
   //AL_15
   Result := False;
   OperComum.LimpaParametros(DMEmprestAcoes.qryMarcaFlgReproc);
   DMEmprestAcoes.qryMarcaFlgReproc.ParamByName('DATAHISTEMPACOES').AsString      := DateToStr(dDataRef);
   if iIdOperEmpAp > 0 then
      DMEmprestAcoes.qryMarcaFlgReproc.ParamByName('IDOPEREMPACOESAP').AsInteger  := iIdOperEmpAp;
   if iIdInvestimento > 0 then
      DMEmprestAcoes.qryMarcaFlgReproc.ParamByName('IDINVESTIMENTO').AsInteger    := iIdInvestimento;
   if iPlanPrev > 0 then
      DMEmprestAcoes.qryMarcaFlgReproc.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
   DMEmprestAcoes.qryMarcaFlgReproc.ParamByName('FLAG').AsString := 'S';
   DMEmprestAcoes.qryMarcaFlgReproc.ExecSql;
   Result := True;
end;

//AL_4
//AL_10
function TEmprestAcoes.DesmarcaFlgReproc(dDataRef : TDateTime; iIdOperEmpAp: Integer = -1; iIdInvestimento: Integer = -1; iPlanPrev: Integer = -1) : boolean;
begin
   //AL_15
   Result := False;
   OperComum.LimpaParametros(DMEmprestAcoes.qryMarcaFlgReproc);
   DMEmprestAcoes.qryMarcaFlgReproc.ParamByName('DATAHISTEMPACOES').AsString      := DateToStr(dDataRef);
   if iIdOperEmpAp > 0 then
      DMEmprestAcoes.qryMarcaFlgReproc.ParamByName('IDOPEREMPACOESAP').AsInteger  := iIdOperEmpAp;
   if iIdInvestimento > 0 then
      DMEmprestAcoes.qryMarcaFlgReproc.ParamByName('IDINVESTIMENTO').AsInteger    := iIdInvestimento;
   if iPlanPrev > 0 then
      DMEmprestAcoes.qryMarcaFlgReproc.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
   DMEmprestAcoes.qryMarcaFlgReproc.ExecSql;
   Result := True;
end;

//AL_10
function TEmprestAcoes.VerSaldoOper(dDataSaldo: TDateTime; iOperAplic: Integer): Double;
var qryAux: TwwQuery;
begin
   //AL_15
   try
      Result := 0;
      qryAux := TwwQuery.Create(Application);
      qryAux.DatabaseName := 'BaseDados';

      qryAux.SQL.Add('SELECT SLDQTDHISTEMPACOE ');
      qryAux.SQL.Add('FROM HISTEMPACOES HS ');
      qryAux.SQL.Add('WHERE HS.IDHISTEMPACOES IN ');
      qryAux.SQL.Add('         (SELECT MAX(H.IDHISTEMPACOES) ');
      qryAux.SQL.Add('          FROM HISTEMPACOES H ');
      qryAux.SQL.Add('          WHERE (H.DATAHISTEMPACOES <= TO_DATE(' + QuotedStr(DateToStr(dDataSaldo)) + ', ' + QuotedStr('dd/mm/yyyy') + ')) ');
      qryAux.SQL.Add('            AND (H.IDOPEREMPACOESAP = ' + IntToStr(iOperAplic) + '))');
      qryAux.SQL.Add('  AND (SLDQTDHISTEMPACOE > 0)');
      qryAux.Open;
      Result := qryAux.FieldByName('SLDQTDHISTEMPACOE').AsFloat;
   finally
      qryAux.Close;
      FreeAndNil(qryAux);
   end;
end;

function TEmprestAcoes.BuscaSaldosAux(dDataRef : TDateTime;
                                      iIdInvestimento, iIdOperEmpAcoes, iIdOperEmpSld, iPlanPrev :Integer):boolean;
begin
   Result := False;
   OperComum.LimpaParametros(DMEmprestAcoes.qryBuscaSaldosAux);
   if iIdOperEmpAcoes <> -1 then
      DMEmprestAcoes.qryBuscaSaldosAux.ParamByName('IDOPEREMPACOES').AsInteger := iIdOperEmpAcoes;
   if iIdInvestimento <> -1 then
      DMEmprestAcoes.qryBuscaSaldosAux.ParamByName('IDINVESTIMENTO').AsInteger := iIdInvestimento;
   if iIdOperEmpSld <> -1 then
      DMEmprestAcoes.qryBuscaSaldosAux.ParamByName('IDOPEREMPACSLD').AsInteger := iIdOperEmpSld;
   if iPlanPrev <> -1 then
      DMEmprestAcoes.qryBuscaSaldosAux.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
   DMEmprestAcoes.qryBuscaSaldosAux.ParamByName('dDataRef').AsString  := DateToStr(dDataRef);
   DMEmprestAcoes.qryBuscaSaldosAux.Open;
   Result := not DMEmprestAcoes.qryBuscaSaldosAux.IsEmpty;
end;

end.
