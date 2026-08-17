{--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Wylliam Leite da Silva
Data        : 04/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
-------------------------------------------------------------------------------- }
unit DDividaEP;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBTables, Db, Wwquery,

   uTypesEmptmo;


type
   TdtmDividaEP = class(TDataModule)
      qryContrato: TwwQuery;
      qryContratoINSCRICAO: TFloatField;
      qryContratoINSCRICAONUMERO: TFloatField;
      qryContratoDESCSITCONTRATO: TStringField;
      qryContratoIDSITPART: TFloatField;
      qryContratoSITUACAO: TStringField;
      qryContratoFLGINTERNO: TStringField;
      qryContratoPLANOPREV: TStringField;
      qryContratoPATRO: TStringField;
      qryContratoMATRICULA: TStringField;
      qryContratoTITULAR: TStringField;
      qryContratoBENEFICIARIO: TStringField;
      qryContratoDESCTIPOEMPTMO: TStringField;
      qryContratoDATAINSC: TDateTimeField;
      qryContratoBANCO: TStringField;
      qryContratoCONTACORRENTE: TStringField;
      qryContratoNUMAGENCIA: TStringField;
      qryContratoIDCONTRQUITACAO: TFloatField;
      qryContratoIDPESSOA: TFloatField;
      qryContratoIDPLANOPREV: TFloatField;
      qryContratoIDPATRO: TFloatField;
      qryContratoIDVERBA: TFloatField;
      qryContratoIDBENEF: TFloatField;
      qryContratoIDCBANCARIA: TFloatField;
      qryContratoCODFORMAPAG: TFloatField;
      qryContratoPORTFORMAPAG: TFloatField;
      qryContratoPORTFORMAREC: TFloatField;
      qryContratoNUMPARCELAS: TFloatField;
      qryContratoDATACREDITO: TDateTimeField;
      qryContratoDATASITUACAO: TDateTimeField;
      qryContratoDATAASSINATURA: TDateTimeField;
      qryContratoDATAPRIMPARC: TDateTimeField;
      qryContratoDATACANC: TDateTimeField;
      qryContratoVLRCONTRATO: TFloatField;
      qryContratoVLRPARCELA: TFloatField;
      qryContratoTXJUROS: TFloatField;
      qryContratoFLGSITUACAO: TStringField;
      qryContratoFLGFORMAREC: TStringField;
      qryContratoFLGFORMAPAG: TStringField;
      qryContratoIDTIPOEMPTMO: TFloatField;
      qryContratoTCEDESCRICAO: TStringField;
      qryContratoIDCONTRATOEMPTMO: TFloatField;
      qryContratoIDINSCRICAOEMPTMO: TFloatField;
      qryContratoIDTIPOCONTREMPTMO: TFloatField;
      qryContratoDATAULTATUALIZA: TDateTimeField;
      qryContratosTitular: TwwQuery;
      qryContratosTitularIDCONTRATOEMPTMO: TFloatField;
    qryContratosTitularIDPATRO: TFloatField;
    qryContratoMOESIGLA: TStringField;


   private { Private declarations }

   public { Public declarations }

      function ValorDevidoMutuario(const iMutuario         : Int64;
                                   const dDataDivida        : TDateTime;
                                   const iOrigem            : Integer;
                                   var   fTotAtualizado     : Currency;
                                   var   fTotSaldoDev       : Currency;
                                   var   fTotParcelas       : Currency;
                                   const bMostraMsg         : Boolean;
                                   const bMostraProgresso   : Boolean
                                   ): Boolean;

      function ValorDevidoEP(const iContrato         : Int64;
                             const dDataDivida       : TDateTime;
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
                                      const iOrigem       : Integer;
                                      const sTipoFolha    : String;
                                      var   iLote         : Integer
                                      ): Boolean;

      function QuitaContratoEP(const iContrato     : Int64;
                               const dDataQuitacao : TDateTime;
                               const iOrigem       : Integer;
                               const sTipoFolha    : String;
                               var   vLista        : TListaItem
                               ): Boolean;

      function ContabilizaQuitacao(const iContrato      : Int64;
                                   const dDataQuitacao  : TDateTime;
                                   var iPlanilhaResult  : Integer;
                                   var sResult, sErro   : TStringList
                                   ): Integer;

      function EnviaAdmPrevFolha(const iContrato          : Int64;
                                 const iPatro             : Int64;
                                 const sAnoCob            : String;
                                 const sMesCob            : String;
                                 var   iLote              : Integer
                                 ): Boolean;


      function DesfazQuitacaoMutuario(const iMutuario     : Int64;
                                      const dDataQuitacao : TDateTime;
                                      const iOrigem       : Integer
                                     ): Integer;

      function DesfazQuitacaoContrato(const iContrato     : Int64;
                                      const dDataQuitacao : TDateTime;
                                      const iOrigem       : Integer
                                     ): Integer;

  end;



var
  dtmDividaEP: TdtmDividaEP;



implementation
{$R *.DFM}
uses
   uMensErro, uFuncoesEmptmo, dEmptmo, FProgresso, uDiasUteis, uIntegraEmptmo,
   uCalcEmptmo, dCalcEmptmo;




//--------------------------------------------------------------------------------------------------
//    ValorDevidoPart: Função que retorna os valores devidos (de Empréstimo) para um determinado
//                     mutuário
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
function TdtmDividaEP.ValorDevidoMutuario(const iMutuario         : Int64;
                                          const dDataDivida        : TDateTime;
                                          const iOrigem            : Integer;
                                          var   fTotAtualizado     : Currency;
                                          var   fTotSaldoDev       : Currency;
                                          var   fTotParcelas       : Currency;
                                          const bMostraMsg         : Boolean;
                                          const bMostraProgresso   : Boolean
                                          ): Boolean;
var
   fSaldoAtualizado  : Currency;
   fSaldoDevedor     : Currency;
   fParcelasAberto   : Currency;

   vLista            : TListaItem;
begin
   fTotAtualizado    := 0;
   fTotSaldoDev      := 0;
   fTotParcelas      := 0;

   fSaldoAtualizado  := 0;
   fSaldoDevedor     := 0;
   fParcelasAberto   := 0;

   Result := True;

   try

      (* qry que traz todos os contratos de um determinado titular *)
      with qryContratosTitular do begin
         LimpaParametros(qryContratosTitular);
         ParamByName('PIDPESSOA').AsInteger := iMutuario;
         Open;
      end;

      while not(qryContratosTitular.EOF) do begin

         (* traz os valores devidos, por Contrato *)
         if not(ValorDevidoEP(qryContratosTitularIDCONTRATOEMPTMO.AsInteger, dDataDivida, iOrigem,
                              fSaldoAtualizado, fSaldoDevedor, fParcelasAberto, vLista,
                              bMostraMsg, bMostraProgresso)) then
         begin

            Result := False;

         end else begin

            fTotAtualizado := fTotAtualizado + fSaldoAtualizado;
            fTotSaldoDev   := fTotSaldoDev   + fSaldoDevedor;
            fTotParcelas   := fTotParcelas   + fParcelasAberto;

            qryContratosTitular.Next;

         end; (* if not Valor... *)

      end; (* while *)

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
function TdtmDividaEP.ValorDevidoEP(const iContrato         : Int64;
                                    const dDataDivida       : TDateTime;
                                    const iOrigem           : Integer;
                                    var   fSaldoAtualizado  : Currency;
                                    var   fSaldoDevedor     : Currency;
                                    var   fParcelasAberto   : Currency;
                                    var   vLista            : TListaItem;
                                    const bMostraMsg        : Boolean;
                                    const bMostraProgresso  : Boolean
                                    ): Boolean;
var
   iContador : Integer;
   rContrato : TDadosContrato;
begin
   fSaldoAtualizado := 0;
   fSaldoDevedor    := 0;
   fParcelasAberto  := 0;

   Result := True;

   try

      // Saldo Devedor -----------------------------------------------------------------------------
      with dtmCalcEmptmo.qrySaldoAnt do begin
         LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
         ParamByName('PIDCONTRATOEMPTMO').AsInteger   := qryContratosTitularIDCONTRATOEMPTMO.AsInteger;
         ParamByName('PHMEDATAATUALIZA').AsDateTime   := dDataDivida;
         Open;

         if not(IsEmpty) then begin
            fSaldoDevedor := fSaldoDevedor + dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency;
         end;
      end;
      // Fim Saldo Devedor -------------------------------------------------------------------------


      // Parcelas em Aberto ------------------------------------------------------------------------
      with dtmCalcEmptmo.qryParcelasEmAberto do begin
         LimpaParametros(dtmCalcEmptmo.qryParcelasEmAberto);
         ParamByName('PIDCONTRATOEMPTMO').AsInteger   := qryContratosTitularIDCONTRATOEMPTMO.AsInteger;
         ParamByName('PHMEDATAPREVISTA').AsDateTime   := dDataDivida;
         Open;

         if not(IsEmpty) then begin
            fParcelasAberto := fParcelasAberto + dtmCalcEmptmo.qryParcelasEmAbertoVALOR_DEVIDO.AsFloat;
         end;
      end;
      // Fim Parcelas em Aberto --------------------------------------------------------------------


      // Valor atualizado (com cálculo atravé de Regras) -------------------------------------------
      LimpaParametros(qryContrato);
      qryContrato.paramByName('PIDCONTRATOEMPTMO').AsInteger := qryContratosTitularIDCONTRATOEMPTMO.AsInteger;
      qryContrato.Open;

      if not(qryContrato.IsEmpty) then begin

         (* Preenche o registro com os dados do Contrato *)
         PreencheDadosContrato(qryContrato, rContrato);

         (* Executa as regras que calcula os itens de quitação -- Apenas calcula, não gravando nada *)
         if not(CalcEmptmo.CalculaItensQuitacao(rContrato, iOrigem, dDataDivida, vLista, True, False)) then
         begin
            Result := False;
            Exit;
         end;

         (* grava o valor do item centralizador *)
         for iContador := 0 to High(vLista) do begin

            if (vLista[iContador].FlgCentraliza = 1) or (vLista[iContador].FlgDestacado = 1) then begin
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
                                             const iOrigem       : Integer;
                                             const sTipoFolha    : String;
                                             var   iLote         : Integer
                                             ): Boolean;
var
   sMensErro         : String;
   sMesCob, sAnoCob  : String;
   sResult, sErro    : TStringList;

   vLista            : TListaItem;
   iPlanilhaResult   : Integer;
begin

   Result := True;

   sAnoCob := IntToStr(DiasUteis.ExtraiAno(dDataQuitacao));
   sMesCob := IntToStr(DiasUteis.ExtraiMes(dDataQuitacao));
   if length(sMesCob) = 1 then sMesCob := '0' + sMesCob;

   try
      LimpaParametros(qryContratosTitular);
      qryContratosTitular.ParamByName('PIDPESSOA').AsInteger := iMutuario;
      qryContratosTitular.Open;

      while not(qryContratosTitular.EOF) do begin

         if not(QuitaContratoEP(qryContratosTitularIDCONTRATOEMPTMO.AsInteger, dDataQuitacao,
                                iOrigem, sTipoFolha, vLista)) then begin

            Result := False;
            qryContratosTitular.Next;

         end else if ContabilizaQuitacao(qryContratosTitularIDCONTRATOEMPTMO.AsInteger,
                                         dDataQuitacao,
                                         iPlanilhaResult,
                                         sResult,
                                         sErro) <> 0 then begin
                     sMensErro := 'Erro ao gerar contabilização.';
                     Result := False;
                     qryContratosTitular.Next;

         end else if not EnviaAdmPrevFolha(qryContratosTitularIDCONTRATOEMPTMO.AsInteger,
                                           qryContratosTitularIDPATRO.AsInteger,
                                           sAnoCob,
                                           sMesCob,
                                           iLote) then begin
                     sMensErro := 'Erro ao gerar envio FOLHA.';
                     Result := False;
                     qryContratosTitular.Next;
                     
         end else begin

            qryContratosTitular.Next;

         end;

      end; (* while not qryContratosTitular.Eof *)


      qryContratosTitular.Close;

   except
      Result := False;
   end;
end;



function TdtmDividaEP.QuitaContratoEP(const iContrato     : Int64;
                                      const dDataQuitacao : TDateTime;
                                      const iOrigem       : Integer;
                                      const sTipoFolha    : String;
                                      var   vLista        : TListaItem
                                      ): Boolean;
var
   sMensErro : String;
   rContrato : TDadosContrato;
   iIdHistMovEmptmo : Int64;
begin

   Result := True;

   try
      LimpaParametros(qryContrato);
      qryContrato.paramByName('PIDCONTRATOEMPTMO').AsInteger := qryContratosTitularIDCONTRATOEMPTMO.AsInteger;
      qryContrato.Open;

      if not(qryContrato.IsEmpty) then begin

         (* Preenche o registro com os dados do Contrato *)
         PreencheDadosContrato(qryContrato, rContrato);

         // Cálculo -----------------------------------------------------------------------------
         if not(CalcEmptmo.CalculaItensQuitacao(rContrato, iOrigem, dDataQuitacao, vLista, True, False)) then
         begin
            Result := False;
            Exit;
         end;
         // -------------------------------------------------------------------------------------


         // Gravação da Quitação ----------------------------------------------------------------
         if not(CalcEmptmo.GravaMovEmptmo(rContrato,
                                          vLista,
                                          3,                                     (* Evento 3 - Quitação *)
                                          -1,                                    (* Parcela *)
                                          DiasUteis.ExtraiAno(dDataQuitacao),    (* Ano Competência - Ano do Item *)
                                          DiasUteis.ExtraiMes(dDataQuitacao),    (* Mês Competência - Mês do Item *)
                                          DiasUteis.ExtraiAno(dDataQuitacao),    (* Ano Cobrança - Ano da Data de Quitação *)
                                          DiasUteis.ExtraiMes(dDataQuitacao),    (* Mês Cobranca - Mês da Data de Quitação *)
                                          0,                                     (* Parcelas Remanescentes *)
                                          dDataQuitacao,                         (* DataPrevista -> Data de Quitação *)
                                          dDataQuitacao,                         (* dDataUltAtualiza -> Data de Quitação *)
                                          'F',                                   (* Forma de Envio *)
                                          False,                                 (* Mostra o Form de Progresso *)
                                          iIdHistMovEmptmo)) then
         begin
            Result := False;
            sMensErro := 'Erro ao gravar movimento. Contrato: ' + qryContratosTitularIDCONTRATOEMPTMO.AsString;
            Exit;
         end; (* GravaMovimento *)
         // -------------------------------------------------------------------------------------


{
         // Atualiza forma de envio -------------------------------------------------------------
         if not(AtualizaFormaEnvioAdmPrev(sTipoFolha))) then
         begin
            sMensErro := 'Erro ao gerar envio FOLHA. Contrato: ' + qryContratosTitularIDCONTRATOEMPTMO.AsString;
            Result := False;
            Exit;
         end; (* not EnviaFolha *)
         // -------------------------------------------------------------------------------------

}

         // Marca parcelas em aberto anteriores à quitação com o flgQuitado = 1 -----------------
         if CalcEmptmo.MarcaItensQuitados(qryContratosTitularIDCONTRATOEMPTMO.AsInteger,
                                          dDataQuitacao) = -2 then
         begin
            (* Atualização da Situação do Contrato com Erro *)
            sMensErro := '[ Atualização dos itens quitados ]' + #13 + sMensErro;
            Result := False;
            Exit;
         end;
         // -------------------------------------------------------------------------------------


         // Situação do Contrato ----------------------------------------------------------------
         if not(CalcEmptmo.AtualizaFlgSituacao(qryContratosTitularIDCONTRATOEMPTMO.AsInteger,
                                               'CONTRATOEMPTMO', 'K', sMensErro)) then
         begin
            sMensErro := 'Erro ao atualizar situação. Contrato: ' + qryContratosTitularIDCONTRATOEMPTMO.AsString;
            Result := False;
            Exit;
         end; (* AtualizaFlgSituacao *)
         // -------------------------------------------------------------------------------------

      end; (* not qry.IsEmpty *)


   except
      Result := False;
   end;
end;



function TdtmDividaEP.ContabilizaQuitacao(const iContrato      : Int64;
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
   '  HME.IDHISTMOVEMPTMO  , HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                       + #13 +
   '  HME.HMEFORMACOBRANCA , HME.HMEVLRPREVISTO  , '                                         + #13 +
   '  CNT.IDTIPOCONTREMPTMO, CNT.IDPLANOPREV     , CNT.IDPATRO, '                            + #13 +
   '  ITC.TIPCODIGO '                                                                        + #13 +
   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +
   '  CONTRATOEMPTMO  CNT, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM '                                                                  + #13 +
   'WHERE '                                                                                  + #13;

   if iContrato <> -1 then begin
      sSQL := sSQL +
      '  ( HME.IDCONTRATOEMPTMO = ' + IntToStr(iContrato)  + ' ) AND '                       + #13;
   end;

   sSQL := sSQL +
   '      ( HME.HMETIPOMOV        = 3 ) '                                                    + #13 +
   '  AND ( HME.HMEORIGEM         = 10 ) '                                                   + #13 +
   '  AND ( ( HME.HMECENTRALIZA   = 0 ) OR ( HME.HMECENTRALIZA IS NULL ) ) '                 + #13 +
	'  AND ( HME.HMEDATAPREVISTA   = TO_DATE(' + QuotedStr(sData) + ',''DD/MM/YYYY'' )) '     + #13 +
	'  AND ( HME.FLGQUITADO        IS NULL ) '                                                + #13 +
	'  AND ( HME.FLGABONADO        IS NULL ) '                                                + #13 +
   '  AND ( HME.IDCONTRATOEMPTMO  = CNT.IDCONTRATOEMPTMO  ) '                                + #13 +
   '  AND ( CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) '                                     + #13 +
   '  AND ( CNT.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO ) '                                     + #13 +
   '  AND ( ITC.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO )';

   sHistorico := 'Quitação - Contrato nº ' + IntToStr(iContrato);

   Result := IntegraEmptmo.ContabilizaItens('C', 'N', sSql, sHistorico,	(* Histórico *)
                                            dDataQuitacao,              (* Data do Lançamento *)
                                            sResult                     (* Acertos *),
                                            sErro                       (* Erros *),
                                            iPlanilhaResult); 				(* Planilha *)
end;



function TdtmDividaEP.EnviaAdmPrevFolha(const iContrato          : Int64;
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
begin

   sSQL :=
   'SELECT '                                                                  + #13 +
   '   HME.IDCONTRATOEMPTMO, HME.IDHISTMOVEMPTMO , HME.HMEPARCELA, '                         + #13 +
   '   HME.HMEVLRPREVISTO, HME.HMERECPAG , '                                                 + #13 +
   '   HME.HMEFORMACOBRANCA, HME.HMETIPOFOLHA, '                                             + #13 +
   '   HME.IDRUBRICA, HME.IDITEMEMPTMO    , '                                                + #13 +

   '   (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000'')))) '                                + #13 +
   '   || '                                                                                  + #13 +
   '   (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) AS ANOMESCOMPETENCIA, '            + #13 +

   '   TEM.IDEMPRESAPROP, TIP.IDTIPOCONTREMPTMO, '                                           + #13 +
   '   CNT.IDPESSOA, CNT.IDBENEF, CNT.IDPATRO, CNT.IDPLANOPREV, '                            + #13 +
   '   ITC.ITCPRIORIDADE, ITC.TIPCODIGO, ITC.PLANO, '                                        + #13 +
   '   PPP.INSCRICAONUMERO, ELP.MATRICULA, SIT.FLGINTERNO '                                  + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +
   '  CONTRATOEMPTMO  CNT, '                                                                 + #13 +
   '  ELEGPATRO       ELP, '                                                                 + #13 +
   '  PARTPREVPLAN    PPP, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM, '                                                                 + #13 +
   '  SITPART         SIT '                                                                  + #13 +

   'WHERE '                                                                                  + #13;

   (* O Filtro abaixo também é utilizado como filtro na Function AtualizaRubricas *)

   if iContrato <> -1 then begin
      sSQL := sSQL +
      '  ( HME.IDCONTRATOEMPTMO = ' + IntToStr(iContrato)  + ' ) AND '                      + #13;
   end;

   sSQL := sSQL +
   '   ( HME.HMEFORMACOBRANCA = ''F'' ) '                                                  + #13 +
   '  AND ( HME.FLGENVIO         = 0 ) '                                                   + #13 +
   '  AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO  = 1) ) '                       + #13 +
   '  AND ( HME.HMEANOCOBRANCA   = ' + sAnoCob + ' ) '                                     + #13 +
   '  AND ( HME.HMEMESCOBRANCA   = ' + sMesCob + ' ) '                                     + #13 +
   '  AND ( (HME.FLGDIVERGPEND   = 0) OR (HME.FLGDIVERGPEND IS NULL) ) '                   + #13 +
   '  AND ( HME.FLGSUSPENSAO     IS NULL ) '                                               + #13 +
   '  AND ( HME.IDRUBRICA        IS NOT NULL ) '                                           + #13;

   sSQL := sSQL +
   '  AND ( HME.IDCONTRATOEMPTMO  = CNT.IDCONTRATOEMPTMO ) '                                 + #13 +
   '  AND ( CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) '                                     + #13 +
   '  AND ( CNT.IDPESSOA          = PPP.IDPESSOA ) '                                         + #13 +
   '  AND ( CNT.IDPLANOPREV       = PPP.IDPLANOPREV ) '                                      + #13 +
   '  AND ( CNT.IDPATRO           = PPP.IDPESSJUR ) '                                        + #13 +
   '  AND ( CNT.IDPESSOA          = ELP.IDPESSOA ) '                                         + #13 +
   '  AND ( CNT.IDPATRO           = ELP.IDPESSJUR ) '                                        + #13 +
   '  AND ( ELP.IDPESSJUR         = PPP.IDPESSJUR ) '                                        + #13 +
   '  AND ( ELP.IDPESSOA          = PPP.IDPESSOA ) '                                         + #13 +
   '  AND ( CNT.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO ) '                                     + #13 +
   '  AND ( PPP.IDSITPART         = SIT.IDSITPART ) '                                        + #13;

   (* prepara a Descrição que será inserida na TMPDESC (40 posições)
                  (........10........20........30........40) *)
   sDescricao  := 'Empréstimo - Envio ref: ' + sMesCob + '/' + sAnoCob;

   try
      sResult := TStringList.Create;
      sErro   := TStringList.Create;

      (***************************************************
       |                                                 |
       | chama a função que prepara o Insert na TMPDESC  |
       |           passando o SQL acima                  |
       |                                                 |
       ***************************************************)
      if IntegraEmptmo.EnviaTMPDESC(sSQL,
                                    '',
                                    '',
                                    sAnoCob+sMesCob,                      (* Ano e Mês Cobrança *)
                                    SysDate,                         (* Data Lançamento *)
                                    sResult,                         (* Lista de Resultados que será apresentado no memResult *)
                                    sErro,                           (* Lista de Erros que será apresentado no memErro *)
                                    iPatro,                          (* Patrocinadora *)
                                    iLote,                           (* Lote *)
                                    iTotalReg,                       (* Total de Registros enviado pela patrocinadora *)
                                    fTotalPatro                      (* Valor Total enviado pela patrocinadora *)
                                    ) <> 0 then begin

         Result := False;

      end else begin
         (* Todos os registros da patrocinadora foram inseridos com sucesso *)
         Result := True;
      end; (* if ResultadoPrepara *)

   finally
      (* Se estiver ainda em transação, desfaz... *)
      sResult.Free;
      sErro.Free;
   end;

end;



function TdtmDividaEP.DesfazQuitacaoMutuario(const iMutuario     : Int64;
                                             const dDataQuitacao : TDateTime;
                                             const iOrigem       : Integer
                                            ): Integer;
begin
   try
      LimpaParametros(qryContratosTitular);
      qryContratosTitular.ParamByName('PIDPESSOA').AsInteger := iMutuario;
      qryContratosTitular.Open;

      while not(qryContratosTitular.EOF) do begin

         Result := DesfazQuitacaoContrato(qryContratosTitularIDCONTRATOEMPTMO.AsInteger,
                                          dDataQuitacao, iOrigem);
         if Result <> 0 then Exit;

         qryContratosTitular.Next;
      end;
      qryContratosTitular.Close;

   except
      Result := -1 (* Erro ao obter contratos do Mutuário *) ;
   end;

end;



function TdtmDividaEP.DesfazQuitacaoContrato(const iContrato : Int64;
                                             const dDataQuitacao : TDateTime;
                                             const iOrigem : Integer) : Integer;
var
   sMsg        : String;
   sIdHistCont : String;
   iPlanilha   : Int64;
   iDocumento  : Int64;
   Status      : TStatusEnvio;
begin

   Result      := 0;
   sIdHistCont := '';

   (* Verifica se existe algum contrato no momento*)

   (* Pega o contrato no historico de contrato e verifica se ta vazio *)
   if not(dtmEmptmo.AbreHistMovent(iContrato, iOrigem, dDataQuitacao)) then begin
      Result := -1; (*Não foi encontrado registro de Quitação.' *)
      Exit;
   end;

   (* Rotina para verificar contabilidade , CaP/CaR e Folha *)
   dtmEmptmo.qryHistoricoMov.First;

   while not(dtmEmptmo.qryHistoricoMov.EOF) do begin

      (* Verica so historico ja foi enviado contas p/r ou folha *)
      if dtmEmptmo.qryHistoricoMovFLGENVIO.IsNull then begin

         (* Verica so historico ja foi enviado contas p/r ou folha *)
         case dtmEmptmo.qryHistoricoMovHMEFORMACOBRANCA.AsString[1] of
            'C': begin
                   (* Verifica se documento ja foi baixado *)
                    if dtmEmptmo.qryHistoricoMovSTATUS.AsString = '2' then begin
                       Result := -2; (* Não é possível cancelar a Quitação: o montante da Quitação já foi recebido. *)
                       Exit;
                    end;
                 end;

            'F': begin
                    (* Verifica se foi para folha *)
                    if not(IntegraEmptmo.ValidaFolha(dtmEmptmo.qryHistoricoMovIDCONTRATOEMPTMO.AsInteger,
                                                     dtmEmptmo.qryHistoricoMovHMEMESCOBRANCA.AsInteger,
                                                     dtmEmptmo.qryHistoricoMovHMEANOCOBRANCA.AsInteger,
                                                     Status, False)) then begin
                       Result := -3;  (* Erro na validação da Folha *)
                       Exit;
                    end;
                 end;
         end;

      end; (* if FLGENVIO.IsNULL *)

      Concatena(dtmEmptmo.qryHistoricoMovIDHISTMOVEMPTMO.AsInteger, sIdHistCont);
      dtmEmptmo.qryHistoricoMov.Next;

   end; (* while *)

   (* todos os registro de quitação estão em uma única planilha *)
   iPlanilha  := dtmEmptmo.qryHistoricoMovPLNCODIGO.AsInteger;
   iDocumento := dtmEmptmo.qryHistoricoMovCODDOCUMENTO.AsInteger;


   try

      (* Deleta Historico | 3 = Quitação *)
      dtmEmptmo.ExcHistContrato(iContrato, iOrigem, dDataQuitacao);

      {* Exclui CaP/CaR se necessario*}
      IntegraEmptmo.ExcluiFinanceiro(iDocumento,sMsg);
      (* Exclui Folha se necessario *)
      dtmEmptmo.ExcFolha;

      (* Exclui Contabilidade *)
      IntegraEmptmo.ExcluiContabil(iPlanilha,sMsg);

      (* Atualiza Contrato*)
      if not(CalcEmptmo.AtualizaFlgSituacao(iContrato,
                                            'CONTRATOEMPTMO', 'A', sMsg)) then begin
         Result := -4; (* Erro ao atualizar situação. *)
         Exit;
      end; (* AtualizaFlgSituacao *)

   except
      Result := -5; (* Não foi possível cancelar a Quitação. *)
   end;
end;



end.
