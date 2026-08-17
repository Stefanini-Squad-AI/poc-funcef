unit DDividaEP;

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA


// Alterações:
{
--------------------------------------------------------------------------------------------------
Pendência   : SOL 203884 KTN 1970110
Responsável : Otacilio Aquino
Data        : 06/05/2013
Descrição   : Buscar rubrica correta quando quitação for atraves do módulo
              BeneficioPrev.
--------------------------------------------------------------------------------
Pendência   : SOL 207860 KINTANA 2008711
Responsável : William Moreir da Silva
Data        : 14/06/2013
Descrição   : Estava sendo enviado a quitação duplicada para o Emprestimo
--------------------------------------------------------------------------------------------------
Pendência   : SOL 172398 
Responsável : Monica da Silva Gonzaga
Data        : 27/12/2011
Descrição   : Retirar a implementação do sol 164235.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 164235 Kintana 1409163
Responsável : Vinicius Ferreira
Data        : 27/12/2011
Descrição   : Implementar trava para impedir a concessão de portabilidade ou resgate
//Alteração retirada, através do SOL nº 172398 - Monica Gonzaga.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 154113 KTN 1199674
Responsável : Fernando Xavier
Data        : 30/03/2011
Descrição   : Evento de resgate marcando datas erradas quando há a quitação de empréstimo.
              Ex:efetivação para 24/02/2011,módulo de empréstimo aparece com 28/02/2011
--------------------------------------------------------------------------------------------------
Pendência   : SOL 147828 KINTANA 1029725
Responsável : Fernando Xavier
Data        : 22/11/2010
Descrição   : Erro ao quitar as prestações de resgate.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 137720 KINTANA 834500
Responsável : Ádler Souza
Data        : 26/06/2010
Descrição   : Correção na query de Atualização da histmovemptmo
Rotina      : EnviaAdmPrevFolha
--------------------------------------------------------------------------------------------------
Pendência   : SOL 138214 KINTANA 839827
Responsável : BRUNO AZEVEDO
Data        : 22/06/2010
Descrição   : Correção na query de Atualização da histmovemptmo
Rotina      : EnviaAdmPrevFolha
--------------------------------------------------------------------------------------------------
Pendência   : SOL 123602 KINTANA 619249
Responsável : BRUNO AZEVEDO
Data        : 25/05/2010
Descrição   : Atualização da histmovemptmo antes de inserir os lançamentos na tmpdesc
Rotina      : EnviaAdmPrevFolha
--------------------------------------------------------------------------------------------------
Rotina    : QuitaContratoEP
Data      : 18/05/2005
Autor     : André Pontes
Pendencia : 19236
Descrição : Se o tipo de quitação for por morte, estorna também itens enviados
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ContabilizaQuitacao
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19264
Descrição : '  AND NVL(ITC.FLGNAOCONTAB, 0)  = 0 '
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ContabilizaQuitacao
Data      : 17/05/2005
Autor     : André Pontes
Pendencia : 19249
Descrição : '   AND HME.HMESEQCOBRANCA       = 1 '
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : várias
Data      : 14/06/2004 a
Autor     : André Pontes
Pendencia : 16984
Descrição : - Passagem da data de falecimento para todas as funções de integração de quitação
            - Retirada da função específica para quitação por morte, pq pode ser necessário o envio
              mesmo nesses casos
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBTables, Db, Wwquery, 
   uCtrlContab, uCtrlPadroes,
   uTypesEmptmo;


type
   TdtmDividaEP = class(TDataModule)
      qryContratosTitular: TwwQuery;
      qryContratosTitularIDCONTRATOEMPTMO: TFloatField;
      qryContratosTitularIDPATRO: TFloatField;
      qryContratosDesfazer: TwwQuery;
      qryContratosDesfazerIDCONTRATOEMPTMO: TFloatField;
      qryContratosDesfazerIDPATRO: TFloatField;
      qryContratosMorteMutuario: TwwQuery;
      qryContratosMorteMutuarioIDCONTRATOEMPTMO: TFloatField;
      qryContratosMorteMutuarioIDPATRO: TFloatField;
      qryBuscaModulo: TwwQuery;

      qryDividasSIAFI: TwwQuery;
      qryDesfazQuitacaoSIAFI: TwwQuery;
      qryDividasSIAFISALDODEVQUIT: TFloatField;
      qryDividasSIAFIVLRPARCELA: TFloatField;
      qryDividasSIAFIMULTAQUIT: TFloatField;
      qryDividasSIAFIJUROSQUIT: TFloatField;
      qryDividasSIAFICORRECAOQUIT: TFloatField;
      qryDividasSIAFISEGUROQUIT: TFloatField;
      qryDividasSIAFIMULTASEGQUIT: TFloatField;
      qryDividasSIAFIJUROSSEGQUIT: TFloatField;
      qryDividasSIAFICORRECAOSEGQUIT: TFloatField;
      qryDividasSIAFIDESCONTOQUIT: TFloatField;
      qryQuitaDividaSIAFI: TwwQuery;
      qryBuscaModuloNOMEMODULO: TStringField;
      qryHistSIAFI: TwwQuery;
      qryQuitaResgateSIAFI: TwwQuery;
      qryHistSIAFICOBRANCA: TStringField;
      qryHistSIAFIVLRPARCELA: TFloatField;
      qryHistSIAFIMULTAQUIT: TFloatField;
      qryHistSIAFIJUROSQUIT: TFloatField;
      qryHistSIAFICORRECAOQUIT: TFloatField;
      qryHistSIAFISEGUROQUIT: TFloatField;
      qryHistSIAFIMULTASEGQUIT: TFloatField;
      qryHistSIAFIJUROSSEGQUIT: TFloatField;
      qryHistSIAFICORRECAOSEGQUIT: TFloatField;
      qryHistSIAFIDESCONTOQUIT: TFloatField;
      qryAmortizacaoMesmaData: TwwQuery;
      qryAmortizacaoPosterior: TwwQuery;
      qryAmortizacaoAnteriorEmAberto: TwwQuery;
      qryAmortizacaoAnteriorEmAbertoIDHISTMOVEMPTMO: TFloatField;
      qryAmortizacaoPosteriorIDHISTMOVEMPTMO: TFloatField;
      qryAmortizacaoMesmaDataIDHISTMOVEMPTMO: TFloatField;
    qryItemPosterior: TwwQuery;
    FloatField1: TFloatField;


   private  // Private declarations

      Contab   : TCtrlContab;


   public   // Public declarations

      bExisteDividaValor, bNExisteAtuDiaria : boolean;

      function ValorDevidoMutuario(const iMutuario          : Int64;
                                   const dDataDivida        : TDateTime;
                                   const dDataMorte         : TDateTime; // André Pontes - 14/06/2004 - pendência 16984
                                   const iOrigem            : Integer;
                                   var   fTotAtualizado     : Currency;
                                   var   fTotSaldoDev       : Currency;
                                   var   fTotParcelas       : Currency;
                                   const bMostraMsg         : Boolean;
                                   const bMostraProgresso   : Boolean
                                  ): Boolean;

      function ValorDevidoEP(const iContrato         : Extended;
                             const dDataDivida       : TDateTime;
                             const dDataMorte        : TDateTime; // André Pontes - 14/06/2004 - pendência 16984
                             const iOrigem           : Integer;
                             var   fSaldoAtualizado  : Currency;
                             var   fSaldoDevedor     : Currency;
                             var   fParcelasAberto   : Currency;
                             var   vLista            : TListaItem;
                             const bMostraMsg        : Boolean;
                             const bMostraProgresso  : Boolean
                            ): Boolean;

      function QuitaContratosMutuario(const iMutuario     : Int64;
                                      const dDataQuitacao : TDateTime;
                                      const dDataMorte    : TDateTime; // André Pontes - 14/06/2004 - pendência 16984
                                      const iOrigem       : Integer;
                                      const sTipoFolha    : String;
                                      //Pendência 19997 - 14/03/2007 - Alberto - Padrão 15
                                      var   iLote         : Integer;
                                      var   sMensErro     : String
                                     ): Boolean;
                                      //Fim Pendência 19997

      function QuitaContratoEP(const iContrato     : Extended;
                               const dDataQuitacao : TDateTime;
                               const dDataMorte    : TDateTime; // André Pontes - 14/06/2004 - pendência 16984
                               const iOrigem       : Integer;
                               const sTipoFolha    : String;
                               var   vLista        : TListaItem;
                               //Pendência 19997 - 14/03/2007 - Alberto - Padrão 15
                               var   sMensErro     : String;
                               const sArquivoQuit  : String = ''
                               //Fim Pendência 19997
                              ): Boolean;

      function ContabilizaQuitacao(const iContrato      : Extended;
                                   const dDataQuitacao  : TDateTime;
                                   var iPlanilhaResult  : Integer;
                                   var sResult, sErro   : TStringList
                                  ): Integer;

      function EnviaAdmPrevFolha(const iContrato   : Extended;
                                 const iPatro      : Int64;
                                 const sAnoCob     : String;
                                 const sMesCob     : String;
                                 var   iLote       : Integer
                                ): Boolean;


      function DesfazQuitacaoMutuario(const iMutuario     : Int64;
                                      const dDataQuitacao : TDateTime;
                                      const iOrigem       : Integer
                                     ): Integer;

      function DesfazQuitacaoContrato(const iContrato      : Extended;
                                      const iOrigem        : Integer;
                                      const dDataQuitacao  : TDateTime
                                     ): Integer;

      function CalculaDividaSIAFI(const iMutuario : Int64;
                                  var   fVlrParcela : Currency;
                                  var   fMulta      : Currency;
                                  var   fJuros      : Currency;
                                  var   fCorrecao   : Currency;
                                  var   fSeguro     : Currency;
                                  var   fMultaSeg   : Currency;
                                  var   fJurosSeg   : Currency;
                                  var   fCorrSeg    : Currency;
                                  var   fDesconto   : Currency
                                 ) : Currency;

      function QuitaDividaTotalSIAFI(iMutuario, iPlnCodigo : Int64; iIdModulo : Integer; dDataEfetiva : TDateTime; sIdDocumento : String; fValorResgate : Currency) : Boolean;

      function QuitaDividaSIAFI(iMutuario, iPlnCodigo : Int64; iIdModulo : Integer; dDataEfetiva : TDateTime; sIdDocumento, sReferencia : String) : Boolean;

      function DesfazQuitacaoSIAFI(iMutuario : Int64; sIdDocumento : String) : Boolean;


      // -------------------------------------------------------------------------------------------

      function ExisteAmortizacaoAnteriorEmAberto(const IDContrato : Extended;
                                                 const dData      : TDateTime
                                                ): Boolean;

      function ExisteAmortizacaoMesmaData(const IDContrato : Extended;
                                          const dData      : TDateTime
                                         ): Boolean;

      function ExisteAmortizacaoPosterior(const IDContrato : Extended;
                                          const dData      : TDateTime
                                         ): Boolean;

      function ExisteItemPosterior(const IDContrato : Extended;
                                   const dData      : TDateTime
                                  ): Boolean;

      // -------------------------------------------------------------------------------------------

   end;



var
  dtmDividaEP: TdtmDividaEP;



implementation
{$R *.DFM}
uses
   uMensErro, uFuncoesEmptmo, dEmptmo, FProgresso, uDiasUteis, uIntegraEmptmo,
   uCalcEmptmo, dCalcEmptmo, uSistema, dBaseDados, uDataBase, uLancContab,
   dAtualizacaoDiaria;




//--------------------------------------------------------------------------------------------------
//    ValorDevidoMutuario: Função que retorna os valores devidos (de Empréstimo) para um determinado
//                         mutuário
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       IDMutuario        : ID do mutuário (titular) do Contrato
//       dDataDivida       : data até a qual se deseja atualizar a dívida
//       iOrigem           : indica o "tipo" de quitação:
//                            3 = quitação antecipada
//                            8 = quitação por morte
//                           10 = quitação por desligamento (AdmPrev)
//
//       bMostraMsg        :  indica se devem ser exibidas mensagens
//       bMostraProgresso  :  indica se deve ser exibido o form com barra de progresso
//
//    Resultado (por referência)
//       fTotAtualizado    : valor atualizado da dívida (saldo devedor + parcelas em aberto + encargos)
//       fTotSaldoDev      : valor do Saldo devedor na data
//       fTotParcelas      : valor total das parcelas (e encargos) em aberto até a data
//
//--------------------------------------------------------------------------------------------------
function TdtmDividaEP.ValorDevidoMutuario(const iMutuario          : Int64;
                                          const dDataDivida        : TDateTime;
                                          const dDataMorte         : TDateTime; // André Pontes - 14/06/2004 - pendência 16984
                                          const iOrigem            : Integer;
                                          var   fTotAtualizado     : Currency;
                                          var   fTotSaldoDev       : Currency;
                                          var   fTotParcelas       : Currency;
                                          const bMostraMsg         : Boolean;
                                          const bMostraProgresso   : Boolean
                                         ): Boolean;
var
   vLista            : TListaItem;

   dData             : TDateTime;
   rSaldo            : TSaldoDevAnt;

   fSaldoAtualizado  : Currency;
   fSaldoDevedor     : Currency;
   fParcelasAberto   : Currency;
begin
   ParametrosSistema;

   fTotAtualizado    := 0;
   fTotSaldoDev      := 0;
   fTotParcelas      := 0;

   fSaldoAtualizado  := 0;
   fSaldoDevedor     := 0;
   fParcelasAberto   := 0;

   //Alteração retirada, através do SOL nº 172398 - Monica Gonzaga. Inicio 
   //bExisteDividaValor := False; // SOL 164235 Kintana 1409163 - Vinicius Ferreira
   //bNExisteAtuDiaria := False; // SOL 164235 Kintana 1409163 - Vinicius Ferreira
   //Alteração retirada, através do SOL nº 172398 - Monica Gonzaga. FIM 
   Result := True;

   try
      // qry que traz todos os contratos de um determinado titular
      with qryContratosTitular do
      begin
         LimpaParametros(qryContratosTitular);
         ParamByName('PIDPESSOA').AsInteger  := iMutuario;
         ParamByName('PIDBENEF').AsInteger   := iMutuario;
         Open;
      end;

      while not(qryContratosTitular.EOF) do
      begin
         if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
         begin
            if not(CalcEmptmo.PossuiAtualizacaoDiaria(qryContratosTitularIDCONTRATOEMPTMO.AsFloat, dDataDivida)) then
            begin
               dData  := CalcEmptmo.UltimaDataAtualizacao(qryContratosTitularIDCONTRATOEMPTMO.AsFloat);
               rSaldo := CalcEmptmo.SaldoDevAnt(qryContratosTitularIDCONTRATOEMPTMO.AsFloat, dData, -1, -1, False);

               if rSaldo.fSaldoDevAnt <> 0 then
               begin
                  Result := False;
                  MsgDlg('Não existe Atualização Diária para a data informada!', 'Empréstimo', mtWarning, [mbOk], 0);
				  //Alteração retirada, através do SOL nº 172398 - Monica Gonzaga.
                  //bNExisteAtuDiaria := True; // SOL 164235 Kintana 1409163 - Vinicius Ferreira
                  Exit;
               end;
            end;
         end;

         dtmEmptmo.Regra.IDCalculo  := 0;

         // traz os valores devidos, por Contrato
         if not(ValorDevidoEP(qryContratosTitularIDCONTRATOEMPTMO.AsFloat,
                              dDataDivida,
                              dDataMorte,
                              iOrigem,
                              fSaldoAtualizado,
                              fSaldoDevedor,
                              fParcelasAberto,
                              vLista,
                              bMostraMsg,
                              bMostraProgresso)
                             ) then
         begin
            Result := False;
            Exit;
         end
         else
         begin
            fTotAtualizado := fTotAtualizado + fSaldoAtualizado;
            fTotSaldoDev   := fTotSaldoDev   + fSaldoDevedor;
            fTotParcelas   := fTotParcelas   + fParcelasAberto;

            qryContratosTitular.Next;
         end;  // not(ValorDevidoEP(...

      end; (* while *)
//Alteração retirada, através do SOL nº 172398 - Monica Gonzaga. Inicio
      // SOL 164235 Kintana 1409163 - Vinicius Ferreira - Inicio
      //if Result then
        // if fTotSaldoDev > 0 then
           // bExisteDividaValor := true;
      // SOL 164235 Kintana 1409163 - Vinicius Ferreira - Fim
//Alteração retirada, através do SOL nº 172398 - Monica Gonzaga. FIM
   finally
      qryContratosTitular.Close;
      dtmCalcEmptmo.qrySaldoAnt.Close;
      dtmCalcEmptmo.qryParcelasEmAberto.Close;
   end;
end;



//--------------------------------------------------------------------------------------------------
//    ValorDevidoEP: Função que retorna os valores devidos (de Empréstimo) para um determinado
//                   Contrato de Empréstimo
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iContrato         : ID do Contrato de Empréstimo
//       dDataDivida       : data até a qual se deseja atualizar a dívida
//       iOrigem           : indica o "tipo" de quitação:
//                            3 = quitação antecipada
//                            8 = quitação por morte
//                           10 = quitação por desligamento (AdmPrev)
//
//       bMostraMsg        :  indica se devem ser exibidas mensagens
//       bMostraProgresso  :  indica se deve ser exibido o form com barra de progresso
//
//    Resultado (por referência)
//       fSaldoAtualizado  : valor atualizado da dívida (saldo devedor + parcelas em aberto + encargos)
//       fSaldoDevedor     : valor do Saldo devedor na data
//       fParcelasAberto   : valor total das parcelas (e encargos) em aberto até a data
//
//--------------------------------------------------------------------------------------------------
function TdtmDividaEP.ValorDevidoEP(const iContrato         : Extended;
                                    const dDataDivida       : TDateTime;
                                    const dDataMorte        : TDateTime;
                                    const iOrigem           : Integer;
                                    var   fSaldoAtualizado  : Currency;
                                    var   fSaldoDevedor     : Currency;
                                    var   fParcelasAberto   : Currency;
                                    var   vLista            : TListaItem;
                                    const bMostraMsg        : Boolean;
                                    const bMostraProgresso  : Boolean
                                   ): Boolean;
var
   dData       : TDateTime;
   rSaldo      : TSaldoDevAnt;

   iContador   : Integer;
   rContrato   : TDadosContrato;
begin
   fSaldoAtualizado := 0;
   fSaldoDevedor    := 0;
   fParcelasAberto  := 0;

   Result := True;

   try
      // -------------------------------------------------------------------------------------------
      if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
      begin
         // ----------------------------------------------------------------------------------------
         if not(CalcEmptmo.PossuiAtualizacaoDiaria(qryContratosTitularIDCONTRATOEMPTMO.AsFloat, dDataDivida)) then
         begin
            dData  := CalcEmptmo.UltimaDataAtualizacao(qryContratosTitularIDCONTRATOEMPTMO.AsFloat);
            rSaldo := CalcEmptmo.SaldoDevAnt(qryContratosTitularIDCONTRATOEMPTMO.AsFloat, dData, -1, -1, False);

            if rSaldo.fSaldoDevAnt <> 0 then
            begin
               Result := False;
               MsgDlg('Não existe Atualização Diária para a data informada!', 'Empréstimo', mtWarning, [mbOk], 0);
               Exit;
            end;
         end;
         // ----------------------------------------------------------------------------------------

         // Saldo Devedor --------------------------------------------------------------------------
         with dtmCalcEmptmo.qrySaldoAntAtuDia do
         begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAntAtuDia);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryContratosTitularIDCONTRATOEMPTMO.AsFloat;
            ParamByName('PHMEDATAATUALIZA').AsDateTime := dDataDivida;
            Open;

            if not(IsEmpty) then
            begin
               fSaldoDevedor := fSaldoDevedor + dtmCalcEmptmo.qrySaldoAntAtuDiaHMESALDODEV.AsCurrency;
            end;
         end;
         // Fim Saldo Devedor ----------------------------------------------------------------------
      end
      else  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1
      begin
         // Saldo Devedor --------------------------------------------------------------------------
         with dtmCalcEmptmo.qrySaldoAnt do
         begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryContratosTitularIDCONTRATOEMPTMO.AsFloat;
            ParamByName('PHMEDATAATUALIZA').AsDateTime := dDataDivida;
            Open;

            if not(IsEmpty) then
            begin
               fSaldoDevedor := fSaldoDevedor + dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency;
            end;
         end;
         // Fim Saldo Devedor ----------------------------------------------------------------------
      end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1


      // Parcelas em Aberto ------------------------------------------------------------------------
      with dtmCalcEmptmo.qryParcelasEmAberto do
      begin
         LimpaParametros(dtmCalcEmptmo.qryParcelasEmAberto);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryContratosTitularIDCONTRATOEMPTMO.AsFloat;
         ParamByName('PHMEDATAPREVISTA').AsDateTime := dDataDivida;
         Open;

         if not(IsEmpty) then
         begin
            fParcelasAberto := fParcelasAberto + dtmCalcEmptmo.qryParcelasEmAbertoVALOR_DEVIDO.AsFloat;
         end;
      end;
      // Fim Parcelas em Aberto --------------------------------------------------------------------


      // Valor atualizado (com cálculo atravé de Regras) -------------------------------------------
      LimpaParametros(dtmEmptmo.qryDadosContrato);
      dtmEmptmo.qryDadosContrato.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryContratosTitularIDCONTRATOEMPTMO.AsFloat;
      dtmEmptmo.qryDadosContrato.Open;

      if not(dtmEmptmo.qryDadosContrato.IsEmpty) then
      begin
         // Preenche o registro com os dados do Contrato
         PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato);

         // Executa as regras que calcula os itens de quitação --
         // Apenas calcula, não gravando nada
         if not(CalcEmptmo.CalculaItensQuitacaoNOVA(rContrato,
                                                    iOrigem,
                                                    dDataDivida,
                                                    dDataMorte,
                                                    0,
                                                    vLista,
                                                    True,
                                                    False
                                                   )) then
         begin
            Result := False;
            Exit;
         end;

         (* grava o valor do item centralizador *)
         for iContador := 0 to High(vLista) do
         begin
            if (vLista[iContador].FlgCentraliza = 1) or (vLista[iContador].FlgDestacado = 1) then
            begin
               fSaldoAtualizado := fSaldoAtualizado + vLista[iContador].Valor;
            end;
         end;
      end;
      // Fim Valor atualizado ----------------------------------------------------------------------

   finally
      dtmCalcEmptmo.qrySaldoAnt.Close;
      dtmCalcEmptmo.qryParcelasEmAberto.Close;
   end;
end;



//--------------------------------------------------------------------------------------------------
//    QuitaContratosMutuario:  Função que executa a quitação para TODOS os Contratos do Mutuário
//                             em Questão
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iMutuario         : ID do Mutuário (Pessoa)
//       dDataQuitacao     : data da quitação
//       iOrigem           : indica o "tipo" de quitação:
//                            3 = quitação antecipada
//                            8 = quitação por morte
//                           10 = quitação por desligamento (AdmPrev)
//       sTipoFolha        : P = Patrocinadora
//                           B = Benefícios
//       iLote             : ID do lote de envio
//
//       bMostraMsg        :  indica se devem ser exibidas mensagens
//       bMostraProgresso  :  indica se deve ser exibido o form com barra de progresso
//
//    Resultado (por referência)
//       fSaldoAtualizado  : valor atualizado da dívida (saldo devedor + parcelas em aberto + encargos)
//       fSaldoDevedor     : valor do Saldo devedor na data
//       fParcelasAberto   : valor total das parcelas (e encargos) em aberto até a data
//
//--------------------------------------------------------------------------------------------------
function TdtmDividaEP.QuitaContratosMutuario(const iMutuario     : Int64;
                                             const dDataQuitacao : TDateTime;
                                             const dDataMorte    : TDateTime; // André Pontes - 14/06/2004 - pendência 16984
                                             const iOrigem       : Integer;
                                             const sTipoFolha    : String;
//Pendência 19997 - 14/03/2007 - Alberto - Padrão 15
                                             var   iLote         : Integer;
                                             var   sMensErro     : String
                                            ): Boolean;
var

   i                    : Integer;
//Fim Pendência 19997
   sMesCob, sAnoCob     : String;
   sArquivoQuit         : String;
   sResult, sErro       : TStringList;

   bTransacaoAnterior   : Boolean;

   vLista               : TListaItem;
   iPlanilhaResult      : Integer;
begin
   ParametrosSistema;

   Result               := True;
   bTransacaoAnterior   := True;
   sArquivoQuit         := 'QuitacaoAdmPrev' + '-' + FormatDateTime('yyyymmdd-hhnnss', Now) + '-' +
                           'IDPessoa' + FormatFloat('#0', iMutuario) + '.log';

   LogToFile(' ', sArquivoQuit);
   LogToFile(' ', sArquivoQuit, True, False);
   LogBPL(sArquivoQuit);
   LogToFile(' ', sArquivoQuit, True, False);

   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      LogToFile('StartTransaction', sArquivoQuit);
      StartTransacao;
      bTransacaoAnterior := False;
   end
   else
   begin
      LogToFile('NÃO StartTransacao', sArquivoQuit);
   end;


   iPlanilhaResult := 0;

   sAnoCob := IntToStr(DiasUteis.ExtraiAno(dDataQuitacao));
   sMesCob := IntToStr(DiasUteis.ExtraiMes(dDataQuitacao));
   if length(sMesCob) = 1 then sMesCob := '0' + sMesCob;

   try

      try
         LimpaParametros(qryContratosTitular);
         qryContratosTitular.ParamByName('PIDPESSOA').AsInteger   := iMutuario;
         qryContratosTitular.ParamByName('PIDBENEF').AsInteger    := iMutuario;
         qryContratosTitular.Open;

         while not(qryContratosTitular.EOF) do
         begin
            // André Pontes - 12/08/2005
            // Limpa o IDCalculo para que não ocorra erro em uma nova iteração das regras
            dtmEmptmo.Regra.IDCalculo  := 0;
            // FIM André Pontes - 12/08/2005

            LogToFile('AntesQuitaContratoEP ' + FormatFloat('#0', qryContratosTitularIDCONTRATOEMPTMO.AsFloat), sArquivoQuit);

            if not(QuitaContratoEP(qryContratosTitularIDCONTRATOEMPTMO.AsFloat,
                                   dDataQuitacao,
                                   dDataMorte,
                                   iOrigem,
                                   sTipoFolha,
                                   vLista,
                                   //Pendência 19997 - 14/03/2007 - Alberto - Padrão 15
                                   sMensErro,
                                   sArquivoQuit
                                   //Fim Pendência 19997
                                  )) then
            begin
               Result := False;
               qryContratosTitular.Next;
            end
            else
            begin
               LogToFile('Antes ContabilizaQuitacao ' + FormatFloat('#0', qryContratosTitularIDCONTRATOEMPTMO.AsFloat), sArquivoQuit);
               if ContabilizaQuitacao(qryContratosTitularIDCONTRATOEMPTMO.AsFloat,
                                      dDataQuitacao,
                                      iPlanilhaResult,
                                      sResult,
                                      sErro
                                     ) <> 0 then
               begin
                  LogToFile('ERRO ContabilizaQuitacao ' + FormatFloat('#0', qryContratosTitularIDCONTRATOEMPTMO.AsFloat), sArquivoQuit);
                  //Pendência 19997 - 14/03/2007 - Alberto - Padrão 15
                  for i := 0 to sErro.Count-1 do
                     sMensErro := sMensErro + sErro.Strings[i] + #13;
                  sMensErro := 'Erro ao gerar contabilização.';
                  //Fim Pendência 19997
                  Result      := False;

                  qryContratosTitular.Next;
               end
               else
               begin
                  LogToFile('Após ContabilizaQuitacao ' + FormatFloat('#0', qryContratosTitularIDCONTRATOEMPTMO.AsFloat), sArquivoQuit);

                  LogToFile('Antes EnviaAdmPrevFolha ' + FormatFloat('#0', qryContratosTitularIDCONTRATOEMPTMO.AsFloat), sArquivoQuit);
                  if not(EnviaAdmPrevFolha(qryContratosTitularIDCONTRATOEMPTMO.AsFloat,
                         qryContratosTitularIDPATRO.AsInteger,
                         sAnoCob,
                         sMesCob,
                         iLote
                        )) then
                  begin
                     LogToFile('ERRO EnviaAdmPrevFolha ' + FormatFloat('#0', qryContratosTitularIDCONTRATOEMPTMO.AsFloat), sArquivoQuit);
                     sMensErro   := 'Erro ao gerar envio FOLHA.';
                     Result      := False;

                     qryContratosTitular.Next;
                  end
                  else
                  begin
                     LogToFile('Após EnviaAdmPrevFolha ' + FormatFloat('#0', qryContratosTitularIDCONTRATOEMPTMO.AsFloat), sArquivoQuit);
                     qryContratosTitular.Next;
                  end;
               end;
            end;

         end; // while not qryContratosTitular.EOF

         // Só "commita" se não houver transacao anterior
         if ( (dtmBaseDados.dbBaseDados.InTransaction) and not(bTransacaoAnterior) ) then
         begin
            LogToFile('Commit Transaction', sArquivoQuit);
            CommitTransacao;
         end
         else
         begin
            LogToFile('NÃO Commit Transaction', sArquivoQuit);
         end;

      except
         LogToFile('Rollback Transaction', sArquivoQuit);
         RollbackTransacao;

         Result := False;
      end;

   finally
      if ( not(Result) and (dtmBaseDados.dbBaseDados.InTransaction) ) then
      begin
         LogToFile('Rollback Transaction', sArquivoQuit);
         RollbackTransacao;
      end;

      qryContratosTitular.Close;
      dtmEmptmo.qryDadosContrato.Close;
      dtmEmptmo.qryHistoricoMov.Close;
   end;
end;



function TdtmDividaEP.QuitaContratoEP(const iContrato     : Extended;
                                      const dDataQuitacao : TDateTime;
                                      const dDataMorte    : TDateTime; // André Pontes - 14/06/2004 - pendência 16984
                                      const iOrigem       : Integer;
                                      const sTipoFolha    : String;
                                      var   vLista        : TListaItem;
                                      //Pendência 19997 - 14/03/2007 - Alberto - Padrão 15
                                      var   sMensErro     : String;
                                      const sArquivoQuit  : String = ''
                                     ): Boolean;
var
   i                 : Integer;
   rContrato         : TDadosContrato;
   rSaldosAntPos     : TSaldosAntPos;
begin
TRY
   ParametrosSistema;

   Result := True;

   try
      LimpaParametros(dtmEmptmo.qryDadosContrato);
      dtmEmptmo.qryDadosContrato.ParamByName('PIDCONTRATOEMPTMO').AsFloat := iContrato;
      dtmEmptmo.qryDadosContrato.Open;

      if not(dtmEmptmo.qryDadosContrato.IsEmpty) then
      begin
         LogToFile('PreencheDadosContrato ' + FormatFloat('#0', rContrato.IDContratoEmptmo), sArquivoQuit);

         // Preenche o registro com os dados do Contrato
         PreencheDadosContrato(dtmEmptmo.qryDadosContrato, rContrato);

         // ----------------------------------------------------------------------------------------
         // Procura a última data de atualização após a data de quitação do contrato
         // para ser passada como data de atualização dos  registros de quitação
         rSaldosAntPos := CalcEmptmo.BuscaSaldosAntPos(iContrato,
                                                       dDataQuitacao,
                                                      );
         // ----------------------------------------------------------------------------------------


         // Cálculo --------------------------------------------------------------------------------
         LogToFile('Antes CalculaItensQuitacao ' + FormatFloat('#0', rContrato.IDContratoEmptmo), sArquivoQuit);
         if not(CalcEmptmo.CalculaItensQuitacaoNOVA(rContrato,
                                                    iOrigem,
                                                    dDataQuitacao,
                                                    dDataMorte,
                                                    0,
                                                    vLista,
                                                    True,
                                                    False,
                                                    False,
                                                    sArquivoQuit
                                                   )) then
         begin
            LogToFile('ERRO CalculaItensQuitacao ' + FormatFloat('#0', rContrato.IDContratoEmptmo), sArquivoQuit);
            Result := False;
            //Pendência 19997 - 14/03/2007 - Alberto - Padrão 15
            sMensErro := 'Erro ao calcular itens de quitação de empréstimo. Contrato: ' + qryContratosTitularIDCONTRATOEMPTMO.AsString;
            //Fim Pendência 19997
            Exit;
         end;
         // ----------------------------------------------------------------------------------------

         // Ajuste dos itens centralizadores (se por morte) ----------------------------------------
         if iOrigem = 8 then
         begin
            for i := 0 to High(vLista) do
            begin
               if ((vLista[i].FlgCentraliza = 1) or (vLista[i].FlgDestacado = 1)) and
                  (vLista[i].Valor = 0) then
               begin
                  vLista[i].ValorEfetivo  := 0;
                  vLista[i].DataEfetiva   := vLista[i].DataVencto;
                  vLista[i].FlgBaixado    := -1;
                  vLista[i].FlgEnvio      := -1;
                  vLista[i].FormaCobranca := '';
               end;
            end;
         end;
         // ----------------------------------------------------------------------------------------

         LogToFile('Antes GravaMovEmptmo ' + FormatFloat('#0', rContrato.IDContratoEmptmo), sArquivoQuit);

         // Gravação da Quitação -------------------------------------------------------------------
         if not(CalcEmptmo.GravaMovEmptmo(rContrato,
                                          vLista,
                                          3,                                     // Evento 3 - Quitação
                                          -1,                                    // Parcela
                                          DiasUteis.ExtraiAno(dDataQuitacao),    // Ano Competência - Ano do Item
                                          DiasUteis.ExtraiMes(dDataQuitacao),    // Mês Competência - Mês do Item
                                          DiasUteis.ExtraiAno(dDataQuitacao),    // Ano Cobrança - Ano da Data de Quitação
                                          DiasUteis.ExtraiMes(dDataQuitacao),    // Mês Cobranca - Mês da Data de Quitação
                                          0,                                     // Parcelas Remanescentes
                                          dDataQuitacao,                         // DataPrevista -> Data de Quitação
                                          rSaldosAntPos.dDataAtuPos,
                                          'F',                                   // Forma de Envio
                                          sTipoFolha,
                                          False                                  // Mostra o Form de Progresso
                                         )) then
         begin
            LogToFile('Erro GravaMovEmptmo ' + FormatFloat('#0', rContrato.IDContratoEmptmo), sArquivoQuit);

            Result := False;
            //Pendência 19997 - 14/03/2007 - Alberto - Padrão 15
            sMensErro := 'Erro ao gravar itens de quitação de empréstimo. Contrato: ' + qryContratosTitularIDCONTRATOEMPTMO.AsString;
            //Fim Pendência 19997
            Exit;
         end;
         // ----------------------------------------------------------------------------------------

         LogToFile('Após GravaMovEmptmo ' + FormatFloat('#0', rContrato.IDContratoEmptmo), sArquivoQuit);

         // ----------------------------------------------------------------------------------------
         // Estorna os itens posteriores à data da quitação
         // ----------------------------------------------------------------------------------------
         if dtmEmptmo.qryParamEmptmoFLGESTORNOPOSQUIT.AsInteger = 1 then
         begin
            LogToFile('Antes EstornoPosQuit ' + FormatFloat('#0', iContrato), sArquivoQuit);

            with dtmEmptmo.qryUpdateFlgEstorno do
            begin
               LimpaParametros(dtmEmptmo.qryUpdateFlgEstorno);

               ParamByName('PHMEDATAESTORNO').AsDateTime       := dDataQuitacao;
               ParamByName('PIDUSUARIOESTORNO').AsInteger      := Sistema.IDUsuario;
               ParamByName('PHMEOBSERVACAO').AsString          := 'Estorno de item posterior a quitacao';
               ParamByName('PIDCONTRATOEMPTMO').AsFloat        := iContrato;
               ParamByName('PHMETIPOMOV').AsInteger            := 1;

               if iOrigem <> 8 then // André Pontes - 18/05/2005 - pendência 19236
               begin
               ParamByName('PNAOENVIADO').AsInteger            := 1;
               end;

               ParamByName('PFILTROPORDATAPREVISTA').AsInteger := 1;
               ParamByName('PHMEDATAPREVISTAINI').AsDateTime   := dDataQuitacao + 1;
               ParamByName('PHMEDATAPREVISTAFIM').AsDateTime   := DiasUteis.SomaAnos(dDataQuitacao, 10);

               ExecSQL;
            end;  // with dtmEmptmo.qryUpdateFlgEstorno
            LogToFile('Após EstornoPosQuit ' + FormatFloat('#0', iContrato), sArquivoQuit);
         end;  // if dtmEmptmo.qryParamEmptmoFLGESTORNOPOSQUIT.AsInteger = 1
         // ----------------------------------------------------------------------------------------
         LogToFile('Antes MarcaItensQuitados ' + FormatFloat('#0', qryContratosTitularIDCONTRATOEMPTMO.AsFloat), sArquivoQuit);

         // Marca parcelas em aberto anteriores à quitação com o flgQuitado = 1 --------------------
         if CalcEmptmo.MarcaItensQuitados(qryContratosTitularIDCONTRATOEMPTMO.AsFloat,
                                          dDataQuitacao,
                                          iOrigem
                                         ) = -2 then
         begin
            LogToFile('ERRO MarcaItensQuitados ' + FormatFloat('#0', qryContratosTitularIDCONTRATOEMPTMO.AsFloat), sArquivoQuit);

            // Atualização da Situação do Contrato com Erro
            //Pendência 19997 - 14/03/2007 - Alberto - Padrão 15
            sMensErro := 'Erro ao marcar itens quitados de empréstimo. Contrato: ' + qryContratosTitularIDCONTRATOEMPTMO.AsString;
            //Fim Pendência 19997

            Result := False;
            Exit;
         end;  // if CalcEmptmo.MarcaItensQuitados
         // -------------------------------------------------------------------------------------

         LogToFile('Após MarcaItensQuitados ' + FormatFloat('#0', qryContratosTitularIDCONTRATOEMPTMO.AsFloat), sArquivoQuit);

         // ----------------------------------------------------------------------------------------

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            LogToFile('Antes Estorno Atualização Diária posterior' + FormatFloat('#0', rContrato.IDContratoEmptmo), sArquivoQuit);

            if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
            begin
               with dtmAtualizacaoDiaria.spUpdateEstornado do
               begin
                  ParamByName('IIDCONTRATOEMPTMO').AsFloat  := rContrato.IDContratoEmptmo;
                  ParamByName('DDATAINI').AsDateTime        := dDataQuitacao + 1;
                  ParamByName('DDATAFIM').AsDateTime        := dDataQuitacao + 180;
                  ParamByName('IHMETIPOMOV').AsFloat        := 5;
                  if not(Prepared) then Prepare;
                  ExecProc;
               end;
            end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1

            LogToFile('Após Estorno Atualização Diária posterior' + FormatFloat('#0', rContrato.IDContratoEmptmo), sArquivoQuit);
            LogToFile('Antes ExecutaAjusteSaldo' + FormatFloat('#0', rContrato.IDContratoEmptmo), sArquivoQuit);

            dtmAtualizacaoDiaria.ExecutaAjusteSaldo(rContrato.IDContratoEmptmo,
                                                    dDataQuitacao - 1,
                                                    -1 // O saldo deve ser buscado
                                                   );
            LogToFile('Após ExecutaAjusteSaldo' + FormatFloat('#0', rContrato.IDContratoEmptmo), sArquivoQuit);
         end;

         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         //    Acerto da situação do Contrato
         // ----------------------------------------------------------------------------------------
         LogToFile('Antes AcertaSituacaoContratual' + FormatFloat('#0', qryContratosTitularIDCONTRATOEMPTMO.AsFloat), sArquivoQuit);
         CalcEmptmo.AcertaSituacaoContratual(qryContratosTitularIDCONTRATOEMPTMO.AsFloat);
         LogToFile('Após AcertaSituacaoContratual' + FormatFloat('#0', qryContratosTitularIDCONTRATOEMPTMO.AsFloat), sArquivoQuit);
         // -------------------------------------------------------------------------------------------
         //    FIM Acerto da situação do Contrato
         // -------------------------------------------------------------------------------------------
      end;   // not qry.IsEmpty

   except
      LogToFile('ERRO (except)', sArquivoQuit);

      Result := False;
   end;
FINALLY
  Result :=  Result;
END;
end;



function TdtmDividaEP.ContabilizaQuitacao(const iContrato      : Extended;
                                          const dDataQuitacao  : TDateTime;
                                          var iPlanilhaResult  : Integer;
                                          var sResult, sErro   : TStringList
                                          ): Integer;
var
   sSql        : String;
   sHistorico  : String;
   sData       : String;
begin
   Result   := 0;

   sData    := FormatDateTime('dd/mm/yyyy', dDataQuitacao);

   sSql :=
   'SELECT '                                                                                 + #13 +
   '   HME.IDHISTMOVEMPTMO, '                                                                + #13 +
   '   HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, ITE.ITEDESCRICAO, '                           + #13 +
   '   HME.HMEVLRPREVISTO, HME.HMEVLREFETIVO, HME.HMEFORMACOBRANCA, '                        + #13 +
   '   CON.IDTIPOCONTREMPTMO, '                                                              + #13 +
   '   CON.IDPLANOORIGEM, '                                                                  + #13 +
   '   DECODE(CON.IDPLANOORIGEM,NULL,CON.IDPLANOPREV,CON.IDPLANOORIGEM) AS IDPLANOPREV, '    + #13 +
   '   CON.IDPATRO, '                                                                        + #13 +
   '   ITC.TIPCODIGO '                                                                       + #13 +
   'FROM '                                                                                   + #13 +
   '   HISTMOVEMPTMO   HME, '                                                                + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                + #13 +
   '   ITEMXTIPOCONTR  ITC, '                                                                + #13 +
   '   ITEMEMPTMO      ITE, '                                                                + #13 +
   '   TIPOCONTREMPTMO TIP, '                                                                + #13 +
   '   TIPOEMPTMO      TEM  '                                                                + #13 +
   'WHERE '                                                                                  + #13;

   if iContrato <> -1 then sSQL := sSQL +
   '       ( HME.IDCONTRATOEMPTMO = ' + FormatFloat('#0',iContrato)  + ' ) AND '             + #13;

   sSQL := sSQL +
   '       ( HME.HMETIPOMOV         = 3 ) '                                                  + #13 +
   '   AND ( HME.HMEORIGEM          IN (8, 10) ) '                                           + #13 +

   // André Pontes - 17/05/2005 - pendência 19249
   '   AND HME.HMESEQCOBRANCA       = 1 '                                                    + #13 +
   '   AND HME.HMEVLRPREVISTO      <> 0 '                                                    + #13 +
   // FIM André Pontes - 17/05/2005 - pendência 19249

   // André Pontes - 17/05/2005 - pendência 19264
   '  AND NVL(ITC.FLGNAOCONTAB, 0)  = 0 '                                                    + #13 +
   // FIM André Pontes - 17/05/2005 - pendência 19264

   '   AND ( ( HME.HMECENTRALIZA   = 0 ) OR ( HME.HMECENTRALIZA IS NULL ) ) '                + #13 +
	'   AND ( HME.HMEDATAPREVISTA   = TO_DATE(' + QuotedStr(sData) + ',''DD/MM/YYYY'' )) '    + #13 +

	'   AND NVL(HME.FLGQUITADO, 0)  = 0 '                                                     + #13 +
	'   AND NVL(HME.FLGABONADO, 0)  = 0 '                                                     + #13 +
	'   AND NVL(HME.FLGESTORNADO, 0)= 0 '                                                     + #13 +

   '   AND ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO  ) '                               + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ) '                               + #13 +
   '   AND ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) '                                    + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                               + #13 +
   '   AND ( HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO ) '                                    + #13 +
   '   AND ( HME.IDITEMEMPTMO      = ITE.IDITEMEMPTMO ) '                                    + #13 +
   '   AND ( ITC.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO )';

   sHistorico := 'Quitacao - Contrato nº ' + FormatFloat('#0',iContrato);

   // ----------------------------------------------------------------------------------------------

   if (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) and
      (dtmEmptmo.qryParamEmptmoFLGINTEGRAQUITA.AsInteger <> 1) then
   begin
      Result := IntegraEmptmo.ContabilizaItens('C',
                                               'N',
                                               sSql,
                                               sHistorico,
                                               dDataQuitacao,
                                               sResult,
                                               sErro,
                                               iPlanilhaResult
                                              );
   end;

   // ----------------------------------------------------------------------------------------------
end;



function TdtmDividaEP.EnviaAdmPrevFolha(const iContrato          : Extended;
                                        const iPatro             : Int64;
                                        const sAnoCob            : String;
                                        const sMesCob            : String;
                                        var   iLote              : Integer
                                        ): Boolean;
var
	sSQL, sDescricao	: String;
   sResult, sErro    : TStringList;
   fTotalPatro 		: Currency;
   iTotalReg 	      : Integer;
   iAgrupa           : Integer;
   //BRUNO AZEVEDO SOL 123602 KINTANA 619249
   xQryUpd: TwwQuery;
   // SOL 203884 KTN 1970110
   sRubrica : string;
begin
   ParametrosSistema;
   iAgrupa := 0;

   // SOL 203884 KTN 1970110
   sRubrica := '';

   //BRUNO AZEVEDO SOL 123602 KINTANA 619249
   try
     xQryUpd := TwwQuery.Create(Nil);
          with xQryUpd do
     begin
       DataBaseName := 'BaseDados';

       // SOL 203884 KTN 1970110 - Otacilio ** Inicio **
       // Pegar a Rubrica referente ao contrato que esta sendo quitado na concessao.
       Close;
       Sql.Clear;
       SQL.Add('SELECT IDPROVENTON FROM ITEMXTIPOCONTR I WHERE I.IDITEMEMPTMO = 17 ');
       SQL.Add('AND I.IDTIPOCONTREMPTMO IN ');
       SQL.Add('( SELECT C.IDTIPOCONTREMPTMO FROM CONTRATOEMPTMO C WHERE C.IDCONTRATOEMPTMO = ' + FloatToStr(iContrato) + ' )');
       Open;
       sRubrica := FieldByName('IDPROVENTON').AsString;
       // SOL 203884 KTN 1970110 - Otacilio ** Fim **

       Close;
       Sql.Clear;
       Sql.Add('UPDATE histmovemptmo HME');
       // SOL 203884 KTN 1970110 - Otacilio ** Inicio **
       //Sql.Add('   SET idrubrica = 34457 ,');
       Sql.Add('       SET idrubrica =  ' + sRubrica + ',' );
       // SOL 203884 KTN 1970110 - Otacilio ** Fim **
       Sql.Add('       HMEFORMACOBRANCA = ''F'' ,');
       // xavier SOL 154113 KTN 1199674
       //Sql.Add('       hmedatavencto = '+QuotedStr(DateToStr(DiasUteis.UltDiaMes(StrToInt(sAnoCob),StrToInt(sMesCob))))+','); //BRUNO AZEVEDO SOL 138214 KINTANA 839827
       Sql.Add('       HMEMESCOBRANCA = '+sMesCob+' ,');
       Sql.Add('       HMEANOCOBRANCA = '+sAnoCob);
       Sql.Add(' WHERE IDCONTRATOEMPTMO = '+FloatToStr(iContrato));
       Sql.Add('   AND ( HME.FLGENVIO         = 0 )');
       Sql.Add('   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO  = 1) )');
       Sql.Add('   AND ( (HME.FLGDIVERGPEND   = 0) OR (HME.FLGDIVERGPEND IS NULL) )');
       Sql.Add('   AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) )');
       Sql.Add('   AND ( HME.IDITEMEMPTMO     > 0  )');
       Sql.Add('   AND ( HME.HMERECPAG = ''R'')');
       Sql.Add('   AND ( HME.HMETIPOMOV       NOT IN (5, 8) )');
       Sql.Add('   AND ( HME.FLGABONADO       IS NULL OR HME.FLGABONADO = 0)');
       Sql.Add('   AND ( HME.FLGBAIXADO       = 0 )');
       Sql.Add('   AND ( HME.HMEVLREFETIVO    IS NULL)');
       Sql.Add('   AND ( HME.FLGQUITADO       IS NULL OR HME.FLGQUITADO = 0)');
       Sql.Add('   AND ( NVL(HME.FLGSUSPENSAO,0)= 0 OR 1 = (SELECT T.FLGENVIA FROM TIPOSUSPEMPTMO T');
       Sql.Add('                                          WHERE  T.IDTIPOSUSPEMPTMO = HME.IDTIPOSUSPEMPTMO) )');
       ExecSql();
     end;
   finally
     FreeAndNil(xQryUpd);
   end;
   //BRUNO AZEVEDO SOL 123602 KINTANA 619249
   
   if (dtmEmptmo.qryparamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
   begin
      sSQL :=
   'SELECT DISTINCT '                                                                        + #13 + //SOL 147828 KINTANA 1029725
   '   NVL(HME.HMEPARCELAALT, HME.HMEPARCELA) AS HMEPARCELA, '                               + #13;
   end
   else
   begin
      sSQL :=
   'SELECT DISTINCT '                                                                        + #13 +//SOL 147828 KINTANA 1029725
   '   HME.HMEPARCELA, '                                                                     + #13; 
   end;

   sSQL := sSQL +
   '   HME.IDCONTRATOEMPTMO, HME.IDHISTMOVEMPTMO, HME.HMEPARCELAALT, '' '' AS ITEDESCRICAO, '' '' AS FLGTIPODESC, ' + #13 + //SOL 147828 KINTANA 1029725
   '   HME.HMEVLRPREVISTO, HME.HMERECPAG , HME.HMENUMPARCELAS, HME.HMETIPOMOV, '             + #13 +
   '   HME.HMEFORMACOBRANCA, HME.HMETIPOFOLHA, '                                             + #13 +
   '   HME.IDRUBRICA, HME.IDITEMEMPTMO, HME.HMESALDODEV, '                                   + #13 +

   '   (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000'')))) '                                + #13 +
   '   || '                                                                                  + #13 +
   '   (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) AS ANOMESCOMPETENCIA, '            + #13 +

   '   TEM.IDEMPRESAPROP, TIP.IDTIPOCONTREMPTMO, '                                           + #13 +
   '   CON.IDPESSOA, CON.IDBENEF, CON.IDPATRO, CON.IDPLANOPREV, CON.IDPLANOORIGEM, '         + #13 +
   '   ITC.ITCPRIORIDADE, ITC.TIPCODIGO, ITC.PLANO, '                                        + #13 +
   '   PPP.INSCRICAONUMERO, ELP.MATRICULA, SIT.FLGINTERNO, '                                 + #13 +
   '   0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO  '                + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +
   '  CONTRATOEMPTMO  CON, '                                                                 + #13 +
   '  ELEGPATRO       ELP, '                                                                 + #13 +
   '  PARTPREVPLAN    PPP, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM, '                                                                 + #13 +
   '  SITPART         SIT  '                                                                 + #13 +

   'WHERE '                                                                                  + #13;

   // O Filtro abaixo também é utilizado como filtro na Function AtualizaRubricas

   if iContrato <> -1 then sSQL := sSQL +
      '  ( HME.IDCONTRATOEMPTMO = ' + FloatToStr(iContrato)  + ' ) AND '                       + #13;

   sSQL := sSQL +
   //BRUNO AZEVEDO SOL 123602 KINTANA 619249
   //'      ( HME.HMEFORMACOBRANCA = ''F'' ) '                                                 + #13 +
   '      ( HME.FLGENVIO         = 0 ) '                                                     + #13 +
   '  AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO  = 1) ) '                         + #13 +
   //BRUNO AZEVEDO SOL 123602 KINTANA 619249
   //'  AND ( HME.HMEANOCOBRANCA   = ' + sAnoCob + ' ) '                                       + #13 +
   //'  AND ( HME.HMEMESCOBRANCA   = ' + sMesCob + ' ) '                                       + #13 +

   '  AND ( (HME.FLGDIVERGPEND   = 0) OR (HME.FLGDIVERGPEND IS NULL) ) '                     + #13 +
   '  AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) '                      + #13 +
   '  AND ( HME.IDITEMEMPTMO     > 0  ) '                                                    + #13 +
   '  AND ( HME.HMETIPOMOV       NOT IN (5, 8) ) '                                           + #13 +
   '  AND ( HME.FLGABONADO       IS NULL OR HME.FLGABONADO = 0) '                            + #13 +
   '  AND ( HME.FLGBAIXADO       = 0 ) '                                                     + #13 +
   '  AND ( HME.HMEVLREFETIVO    IS NULL) '                                                  + #13 +
   '  AND ( HME.FLGQUITADO       IS NULL OR HME.FLGQUITADO = 0) '                            + #13 +

   '  AND ( HME.FLGSUSPENSAO     IS NULL ) '                                                 + #13;
   //BRUNO AZEVEDO SOL 123602 KINTANA 619249
   //'  AND ( HME.IDRUBRICA        IS NOT NULL ) '                                             + #13;

   sSQL := sSQL +
   '  AND ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO ) '                                 + #13 +
   '  AND ( CON.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) '                                     + #13 +
   '  AND ( CON.IDPESSOA          = PPP.IDPESSOA ) '                                         + #13 +
   '  AND ( CON.IDPATRO           = PPP.IDPESSJUR ) '                                        + #13 +
   '  AND ( CON.IDPESSOA          = ELP.IDPESSOA ) '                                         + #13 +
   '  AND ( CON.IDPATRO           = ELP.IDPESSJUR ) '                                        + #13 +
   '  AND ( ELP.IDPESSJUR         = PPP.IDPESSJUR ) '                                        + #13 +
   '  AND ( ELP.IDPESSOA          = PPP.IDPESSOA ) '                                         + #13 +
   '  AND ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO ) '                                     + #13 +
   '  AND ( PPP.IDSITPART         = SIT.IDSITPART ) '                                        + #13 +
   //William Moreira da Silva SOL 207860 KINTANA 2008711
   '  AND (PPP.IDPLANOPREV =                                                                 '+ #13 +
   '    (SELECT MAX(PPP2.IDPLANOPREV)                                                        '+ #13 +
   '        FROM PARTPREVPLAN PPP2                                                           '+ #13 +
   '       WHERE PPP2.FLGDESATIVADO = 0                                                      '+ #13 +
   '         AND PPP2.IDPESSOA = PPP.IDPESSOA) OR                                            '+ #13 +
   '    (PPP.FLGDESATIVADO = 1 AND NOT EXISTS                                                '+ #13 +
   '     (SELECT 1                                                                           '+ #13 +
   '         FROM PARTPREVPLAN PPP1                                                          '+ #13 +
   '        WHERE PPP1.IDPESSOA = PPP.IDPESSOA                                               '+ #13 +
   '          AND PPP1.FLGDESATIVADO = 0) AND                                                '+ #13 +
   '     (PPP.IDSITPLANOPREV = 25 OR                                                         '+ #13 +
   '     (PPP.IDPLANOPREV =                                                                  '+ #13 +
   '     (SELECT MAX(PPP1.IDPLANOPREV)                                                       '+ #13 +
   '           FROM PARTPREVPLAN PPP1                                                        '+ #13 +
   '          WHERE PPP1.IDPESSOA = PPP.IDPESSOA                                             '+ #13 +
   '            AND NVL(PPP1.DATACANCELAMENTO, TRIM(SYSDATE)) =                              '+ #13 +
   '                (SELECT NVL(MAX(PPP2.DATACANCELAMENTO), TRIM(SYSDATE))                   '+ #13 +
   '                   FROM PARTPREVPLAN PPP2                                                '+ #13 +
   '                  WHERE PPP2.IDPESSOA = PPP1.IDPESSOA)                                   '+ #13 +
   '            AND NOT EXISTS (SELECT 1                                                     '+ #13 +
   '                   FROM PARTPREVPLAN PPP2                                                '+ #13 +
   '                 WHERE PPP2.IDPESSOA = PPP1.IDPESSOA                                     '+ #13 +
   '                    AND PPP2.IDSITPLANOPREV = 25))))))                                   '+ #13;
   //William Moreira da Silva SOL 207860 KINTANA 2008711
//Ádler Souza - SOL 137720 KINTANA 834500
//   '  AND PPP.FLGDESATIVADO       = 0 '                                                      + #13;

   // prepara a Descrição que será inserida na TMPDESC (40 posições)
   //             (........10........20........30........40)
   sDescricao  := 'Empréstimo - Envio ref: ' + sMesCob + '/' + sAnoCob;

   try
      sResult := TStringList.Create;
      sErro   := TStringList.Create;

      // -------------------------------------------------------------------------------------------
      //    Chama a função que prepara o Insert na TMPDESC passando o SQL acima
      // -------------------------------------------------------------------------------------------
      if IntegraEmptmo.EnviaTMPDESC                                                                 (sSQL,
                                    '',
                                    '',
                                    sAnoCob+sMesCob,                 // Ano e Mês Cobrança
                                    SysDate,                         // Data Lançamento
                                    sResult,                         // Lista de Resultados que será apresentado no memResult
                                    sErro,                           // Lista de Erros que será apresentado no memErro
                                    iPatro,                          // Patrocinadora
                                    iLote,                           // Lote
                                    iTotalReg,                       // Total de Registros enviado pela patrocinadora
                                    fTotalPatro,                     // Valor Total enviado pela patrocinadora
                                    iAgrupa
                                   ) <> 0 then
      begin
         Result := False;
      end
      else
      begin
         // Todos os registros da patrocinadora foram inseridos com sucesso
         Result := True;
      end;  // if ResultadoPrepara

   finally
      // Se estiver ainda em transação, desfaz...
      sResult.Free;
      sErro.Free;
   end;
end;



function TdtmDividaEP.DesfazQuitacaoMutuario(const iMutuario     : Int64;
                                             const dDataQuitacao : TDateTime;
                                             const iOrigem       : Integer
                                            ): Integer;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   // ----------------------------------------------------------------------------------------------
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;
   // ----------------------------------------------------------------------------------------------

   try
      try
         LimpaParametros(qryContratosDesfazer);
         qryContratosDesfazer.ParamByName('PIDPESSOA').AsInteger  := iMutuario;
         qryContratosDesfazer.ParamByName('PIDBENEF').AsInteger   := iMutuario;
         qryContratosDesfazer.ParamByName('PHMEORIGEM').AsInteger := iOrigem;
         qryContratosDesfazer.Open;

         ParametrosSistema;

         // ----------------------------------------------------------------------------------------
         // André Pontes - 16/11/2005

         if not(qryContratosDesfazer.IsEmpty) then
         begin
            if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
            begin
               // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
               // estorno na data de cancelamento indicada
               sDataLanc   := FormatDateTime('dd/mm/yyyy', dDataQuitacao);
               iEmpresa    := Sistema.IDEmpresa;
               sMsgContab  := '';

               if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
               begin
                  Result := -3;
                  Exit;
               end;

               if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
               begin
                  Result := -3;
                  Exit;
               end;
            end;
         end;

         // FIM André Pontes - 16/11/2005
         // ----------------------------------------------------------------------------------------

         while not(qryContratosDesfazer.EOF) do
         begin
            Result := DesfazQuitacaoContrato(qryContratosDesfazerIDCONTRATOEMPTMO.AsFloat,
                                             iOrigem,
                                             dDataQuitacao
                                            );

            if Result <> 0 then Exit;

            qryContratosDesfazer.Next;
         end;

      except
         Result := -1 (* Erro ao obter contratos do Mutuário *) ;
      end;

   finally
      qryContratosDesfazer.Close;
      dtmEmptmo.qryDadosContrato.Close;
      dtmEmptmo.qryHistoricoMov.Close;

      Contab.Free;
   end;
end;



function TdtmDividaEP.DesfazQuitacaoContrato(const iContrato      : Extended;
                                             const iOrigem        : Integer;
                                             const dDataQuitacao  : TDateTime
                                            ): Integer;
var
   sMsg        : String;
   sIdHistCont : String;
   iPlanilha   : Int64;
   iDocumento  : Int64;
   Status      : TStatusEnvio;
   iResult     : Integer;
begin
   Result      := 0;

   // Verifica se existe algum contrato no momento

   // Pega o contrato no historico de contrato e verifica se ta vazio
   if not(dtmEmptmo.AbreHistMov(iContrato, 3, iOrigem, dDataQuitacao)) then
   begin
      Result := -1; // Não foi encontrado registro de Quitação.
      Exit;
   end;

   if IntegraEmptmo.EventoBaixado(iContrato, 3, dDataQuitacao) then
   begin
      Result := -2;
      Exit;
   end;

   // Rotina para verificar contabilidade , CaP/CaR e Folha
   iResult := CalcEmptmo.CancelaQuitacao(iContrato,
                                         dDataQuitacao,
                                         dDataQuitacao,
                                         iOrigem,
                                        );


   Result := iResult;
end;



function TdtmDividaEP.CalculaDividaSIAFI(const iMutuario : Int64;
                                         var   fVlrParcela : Currency;
                                         var   fMulta      : Currency;
                                         var   fJuros      : Currency;
                                         var   fCorrecao   : Currency;
                                         var   fSeguro     : Currency;
                                         var   fMultaSeg   : Currency;
                                         var   fJurosSeg   : Currency;
                                         var   fCorrSeg    : Currency;
                                         var   fDesconto   : Currency) : Currency;

begin
   fVlrParcela := 0;
   fMulta      := 0;
   fJuros      := 0;
   fCorrecao   := 0;
   fSeguro     := 0;
   fMultaSeg   := 0;
   fJurosSeg   := 0;
   fCorrSeg    := 0;
   fDesconto   := 0;

   Result := 0;
   // Retorna o saldo devedor para a quitação
   with qryDividasSIAFI do
   begin
      LimpaParametros(qryDividasSIAFI);
      ParamByName('PIDPESSOA').AsInteger := iMutuario;
      Open;
      Result      := qryDividasSIAFISALDODEVQUIT.AsCurrency;

      while not eof do
      begin
         fVlrParcela := fVlrParcela + qryDividasSIAFIVLRPARCELA.AsCurrency;
         fMulta      := fMulta      + qryDividasSIAFIMULTAQUIT.AsCurrency;
         fJuros      := fJuros      + qryDividasSIAFIJUROSQUIT.AsCurrency;
         fCorrecao   := fCorrecao   + qryDividasSIAFICORRECAOQUIT.AsCurrency;
         fSeguro     := fSeguro     + qryDividasSIAFISEGUROQUIT.AsCurrency;
         fMultaSeg   := fMultaSeg   + qryDividasSIAFIMULTASEGQUIT.AsCurrency;
         fJurosSeg   := fJurosSeg   + qryDividasSIAFIJUROSSEGQUIT.AsCurrency;
         fCorrSeg    := fCorrSeg    + qryDividasSIAFICORRECAOSEGQUIT.AsCurrency;
         fDesconto   := fDesconto   + qryDividasSIAFIDESCONTOQUIT.AsCurrency;

         next;

      end;
      Close;
   end;

end;



function TdtmDividaEP.QuitaDividaTotalSIAFI(iMutuario, iPlnCodigo : Int64; iIdModulo : Integer; dDataEfetiva : TDateTime; sIdDocumento : String; fValorResgate : Currency) : Boolean;
var
    fVlrUtilizado : Currency;
    fVlrCalculado : Currency;
begin
   Result := True;

   fVlrUtilizado := fValorResgate;
   fVlrCalculado := 0;

   try
      LimpaParametros(qryBuscaModulo);
      qryBuscaModulo.ParamByName('PIDMODULO').AsInteger := iIdModulo;
      qryBuscaModulo.Open;

      with qryHistSIAFI do
      begin
         LimpaParametros(qryHistSIAFI);
         ParamByName('PIDPESSOA').AsInteger := iMutuario;
         Open;

         while not eof do
         begin

            fVlrCalculado := (qryHistSIAFIVLRPARCELA.AsCurrency + qryHistSIAFIMULTAQUIT.AsCurrency +
                              qryHistSIAFIJUROSQUIT.AsCurrency  + qryHistSIAFICORRECAOQUIT.AsCurrency +
                              qryHistSIAFISEGUROQUIT.AsCurrency + qryHistSIAFIMULTASEGQUIT.AsCurrency +
                              qryHistSIAFIJUROSSEGQUIT.AsCurrency + qryHistSIAFICORRECAOSEGQUIT.AsCurrency -
                              qryHistSIAFIDESCONTOQUIT.AsCurrency);

            if fVlrCalculado <= fVlrUtilizado then
            begin

               with qryQuitaResgateSIAFI do
               begin
                  LimpaParametros(qryQuitaResgateSIAFI);
                  ParamByName('PIDPESSOA').AsInteger     := iMutuario;
                  ParamByName('PDATAEFETIVA').AsDateTime := dDataEfetiva;
                  ParamByName('PIDMODULO').AsInteger     := iIdModulo;
                  if iPlnCodigo <> 0 then ParamByName('PPLNCODIGO').AsInteger   := iPlnCodigo;
                  ParamByName('PIDDOCUMENTO').AsString   := sIdDocumento;
                  ParamByName('PNOMEMODULO').AsString    := qryBuscaModuloNOMEMODULO.AsString;
                  ExecSql;
               end;

               fVlrUtilizado := fVlrUtilizado - fVlrCalculado;
               
            end else
            begin
               Exit;
            end;

            next;
         end;
      end;


   except
      Result := False;
   end;
end;



function TdtmDividaEP.QuitaDividaSIAFI(iMutuario, iPlnCodigo : Int64; iIdModulo : Integer; dDataEfetiva : TDateTime; sIdDocumento, sReferencia : String) : Boolean;
begin
   Result := True;

   try

      LimpaParametros(qryBuscaModulo);
      qryBuscaModulo.ParamByName('PIDMODULO').AsInteger := iIdModulo;
      qryBuscaModulo.Open;

      with qryQuitaDividaSIAFI do
      begin
         LimpaParametros(qryQuitaDividaSIAFI);
         ParamByName('PIDPESSOA').AsInteger     := iMutuario;
         ParamByName('PDATAEFETIVA').AsDateTime := dDataEfetiva;
         ParamByName('PIDMODULO').AsInteger     := iIdModulo;
         if iPlnCodigo <> 0 then ParamByName('PPLNCODIGO').AsInteger   := iPlnCodigo;
         ParamByName('PIDDOCUMENTO').AsString   := sIdDocumento;
         if sReferencia <> '' then ParamByName('PREFERENCIA').AsString := sReferencia;
         ParamByName('PNOMEMODULO').AsString    := qryBuscaModuloNOMEMODULO.AsString;
         ExecSql;
      end;
   except
      Result := False;
   end;
end;



function TdtmDividaEP.DesfazQuitacaoSIAFI(iMutuario : Int64; sIdDocumento : String) : Boolean;
begin
   Result := True;
   try
      with qryDesfazQuitacaoSIAFI do
      begin
         LimpaParametros(qryDesfazQuitacaoSIAFI);
         ParamByName('PIDPESSOA').AsInteger     := iMutuario;
         ParamByName('PIDDOCUMENTO').AsString   := sIdDocumento;
         ExecSql;
      end;
   except
      Result := False;
   end;
end;



function TdtmDividaEP.ExisteAmortizacaoMesmaData(const IDContrato : Extended;
                                                 const dData      : TDateTime
                                                ): Boolean;
begin
   Result := False;

   try
      with qryAmortizacaoMesmaData do
      begin
         LimpaParametros(qryAmortizacaoMesmaData);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := IDContrato;
         ParamByName('PHMEDATAPREVISTA').AsDateTime   := dData;
         Open;

         if not(IsEmpty) then Result := True;
      end;

   finally
      qryAmortizacaoMesmaData.Close;
   end
end;



function TdtmDividaEP.ExisteAmortizacaoPosterior(const IDContrato : Extended;
                                                 const dData      : TDateTime
                                                ): Boolean;
begin
   Result := False;

   try
      with qryAmortizacaoPosterior do
      begin
         LimpaParametros(qryAmortizacaoPosterior);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := IDContrato;
         ParamByName('PHMEDATAPREVISTA').AsDateTime   := dData;
         Open;

         if not(IsEmpty) then Result := True;
      end;

   finally
      qryAmortizacaoPosterior.Close;
   end
end;



function TdtmDividaEP.ExisteItemPosterior(const IDContrato : Extended;
                                          const dData      : TDateTime
                                         ): Boolean;
begin
   Result := False;

   try
      with qryItemPosterior do
      begin
         LimpaParametros(qryItemPosterior);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := IDContrato;
         ParamByName('PHMEDATAPREVISTA').AsDateTime   := dData;
         Open;

         if not(IsEmpty) then Result := True;
      end;

   finally
      qryItemPosterior.Close;
   end
end;



function TdtmDividaEP.ExisteAmortizacaoAnteriorEmAberto(const IDContrato : Extended;
                                                        const dData      : TDateTime
                                                       ): Boolean;
begin
   Result := False;

   try
      with qryAmortizacaoAnteriorEmAberto do
      begin
         LimpaParametros(qryAmortizacaoAnteriorEmAberto);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := IDContrato;
         ParamByName('PHMEDATAPREVISTA').AsDateTime   := dData;
         Open;

         if not(IsEmpty) then Result := True;
      end;

   finally
      qryAmortizacaoAnteriorEmAberto.Close;
   end
end;



end.
