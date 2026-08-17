unit UFuncAlienacao;

// -----------------------------------------------------------------------------
//
//	   Funções do Módulo de Alienação
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  01/09/2001
//	Data de Término   :
//
//  FUNÇÕES PUBLICADAS:
//
//    BuscaCondPag      - Procura a Condição de Pagamento Vigente em uma Data ( ou a última )
//    CalcFimCondPag    - Calcula a Data Final de uma Condição de Pagamento
//    CalcValorPresente - Calcula o Valor Presente de uma parcela
//    CalcSaldoDevedor  - Calcula o Saldo Devedor TEÓRICO de um contrato / condição em uma determinada data
//    CorrigeParcelas   - Corrige um grupo de Parcelas em Atraso até uma determinada Data,
//                        atribuindo Juros, Multa e CM
//    TipoParcela       - Retorna a Descrição por Extenso de um Tipo de Parcela
//    TipoCalculo       - Retorna a Descrição por Extenso do tipo de calculo
//    GeraParcela       - Gera as Parcelas de uma condição de pagamento pelo método PRICE
//    BuscaUltMesGerado - Procura o Ultimo Mes com Parcela Gerada de uma Cond. de Pagamento
//    GravaEstorno      - Limpa Flag de Integração e Código de Documento no Estorno de Parcelas
//    TemRepacSuperior  - Verifica se existe Repactuação superior a data informada
//    TemParcIntegrada  - Verifica se existem Parcelas integradas após a data informada
//    RecalculaParcela  - Recalcula as parcelas de uma Condição de Pagamento
//    VerificaPagto     - Verifica se o Documento já foi pago no Contas a Receber, retornando a data do pagamento
//    ExcluiIntegracao  - Exclui a Integração de Parcela
//    BuscaAlteradores  - Carrega Alteradores por tipo de Imóvel
//
// -----------------------------------------------------------------------------


interface

uses
   sysUtils, math, forms, WwQuery, Dialogs, DB, DBTables, uCtrlContratoImovel,
   UComunsImobiliarioDB, uCMClientDataSet;

type
    TCondPag = Record
       fIDContratoImovel : Double;
       fIDCondPagImovel  : Double;
       fIDCondInicial    : Double;
       sTipoCondPag      : String;
       fSaldoDev         : Double;
       dDataVencimento   : TDateTime;
       dDataIniAmortiz   : TDateTime;
       fSaldoDevComposto : Double;
       dUltVenctoComposto: TDateTime;
       fCorrAcumComposto : Extended;
       fJurosAcumComposto: Extended;
       bJurosCarencia    : Boolean;
       iFormaCalculo     : Integer;
       iNumParcelas      : Integer;
       iPeriodo          : Integer;
       iPeriodoMeses     : Integer;
       sPrazo            : String;
       iIDIndCorr        : Integer;
       iIDIndProj        : Integer;
       fTaxaJuros        : Double;
       fTaxaJurosAjust   : Double;
       fTaxaJurosParc    : Double;
       fCorrecaoProj     : Double;
       sPeriodoTaxa      : String;
       sFlgReajMensal    : String;
       sFlgCMMensal      : String;
       iMesRefReajuste   : Integer;
       dDataIni          : TDateTime;
       dDataFim          : TDateTime;
       dDataAssinatura   : TDateTime;
    end;


type
   TFuncAlienacao = class(TObject)
   private
      // Marchetti - Pendencia 20265
      function  CalculaTipoCalculo14  (iCondPag:Double; dVenctoIni,dDataBase: TDateTime; qryParcTemp: TwwQuery): Double;
      // Fim - Marchetti - Pendencia 20265
      function  CalcAntecipacao       (const iFormaCalculo:Integer; const iCondPag: Double; const iParc: Integer; const dVencto, dVenctoAnt: TDateTime; const fSaldoDevedor, fVlrParcela, fVlrJurosAtual, fTaxaJuros:Extended; var bAntecipaProx: Boolean) : Extended;
      function  QtdeParcMesmoVencto   (const iCondPag: Double; const dVencto: TDateTime):Integer;
      function  VerifAmortiz          (const iCondPag,rSaldoAnt:Double; const mes,ano: Integer; Var rSaldo,rPerc: Double): Boolean;
      function  ApuraResiduoAcumulado (iCondPag:Double; iParcIni, iParcFim: Integer; fFator: Double; bIncorpora: Boolean;
                                       var qryParcTemp: TwwQuery) : Double;

   public
      function  BuscaCondPag     (const iCond:Double; const mes,ano: Double; const bCondFinal: Boolean; var TpCondPag:TCondPag; const bSaldoComposto: Boolean = False) : Boolean;
      function  BuscaSaldoComposto(const fContrato: Double; const dVencto: TDateTime; const iForma: integer; var dUltVencto: TDateTime; var fFatorAcum, fJurosAcum:Extended): Extended;
      function  CalcFimCondPag   (iIdRepactua, iIdCond: Double; iParc,iPeriodo: Integer; sPrazo: String;
                                  dtIni,dtVenc: TDateTime; var dtFim: TDateTime; bAtualiza: Boolean): Boolean;
      function  CalcValorPresente(const iIdParc: Integer; const dAntecipa: TDateTime): Extended;
      function  CalcSaldoDevedorAnt (const iContrato: Integer; const iCondPag: Integer = -1; const dData:TDateTime = -1): Extended;
      function  CalcSaldoDevedor (const iContrato: Integer; const iCondPag: Integer = -1; const dData:TDateTime = -1): Extended;
      function  CorrigeParcelas  (const iContrato, iComprador, iResponsavel,iAdministradora, iCondPag: Double; dDataBaixa: TDateTime): Boolean;
      function  TipoParcela      (const iFlgTipo, iFlgIntegra: Integer): String;
      function  TipoCalculo      (const iFlgTipo: Integer): String;
      function  GeraParcela      (iCondPag:Double; dVenctoIni,dDataBase: TDateTime; qryParcTemp: TwwQuery): Double;
      function  BuscaUltMesGerado(const iCondPag:Double): TDateTime;
      function  GravaEstorno     (const iParc: Integer): Boolean;
      function  TemRepacSuperior (const iCond, iRepac: Integer; const dDataIni: TDateTime): Boolean;
      function  TemParcIntegrada (const iCond: Integer; const dDataIni: TDateTime; var iQtde: Integer): Boolean;
      function  RecalculaParcela (const iIdCondInicial: Double; const dDataIni: TDateTime): Boolean;
      function  VerificaPagto    (const iDocumento: Integer; var dPagto : TDateTime): Boolean;
      function  ExcluiIntegracao (const iDocumento,iPlanilha,iParcela,iTipo: Integer; const dIntegra: TDateTime; const bProgresso: Boolean; var sMens: String ): Boolean;
      function  BuscaAlteradores (const iContrato,iParcela: Integer; var iAltMulta,iAltJuros,iAltCorr: Integer; var sAltMulta,sAltJuros,sAltCorr: String) : Boolean;
      function  InsereMsgBoleto  (const iDocumento: Int64; const vMensagem: array of string) : Boolean;
end;

var FuncAlienacao : TFuncAlienacao;

implementation

uses uComunsImobiliario, uFuncoesImob, uDataBase, uSistema, dFinanciamento, uDiasInUteis,
     uDiasUteis, fAguarde, uCalcDocumento, uMensErro, dBaseDados, uDocumento, dImobiliario,
     jclSysUtils;

{ TFuncAlienacao }

// *********** FUNCAO EM DESUSO ************
// *****************************************
//========================================================================================
// Função para Calcular o Valor Presente de Uma Parcela
// Data : 19/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       sImovel        : Nome do Imóvel
//       iImovelMestre  : id da Imóvel Mestre para o imóvel a ser criado
//       iImovelOrig    : id do Imóvel Original para migração
//
// Obs.: passar (-1) para o imóvel de origem, caso não deseje migrar os dados
//       passar (-1) para o imovel mestre, para criar como mestre
//
// Retorno : id do imóvel criado ou (-1) no caso de erros
//----------------------------------------------------------------------------------------
function TFuncAlienacao.CalcValorPresente(const iIdParc: Integer; const dAntecipa: TDateTime): Extended;
var CondPag               : TCondPag;
    sSql                  : String;
    mes,ano,iIdCondPagIni : Double;
    rTxMercado, rValPresente : Extended;
    fPrestacao, rNumPeriodos : Double;
    dVencto                  : TDateTime;
    rNumMeses : Extended;
begin
   Result := -1;

   // Procura a condição de pagamento original
   sSql := 'SELECT CP.IDCONDPAGIMOVEL, CP.IDCONTRATOIMOVEL,  ' +
           '       CI.PERCTXJURMERC, CI.PERITXJURMERC,       ' +
           '       PF.DATAVENCIMENTO, PF.VLRPRESTACAO        ' +
           '  FROM CONDPAGIMOVEL CP,                         ' +
           '       CONTRATOIMOVEL CI,                        ' +
           '       PARCFINANCIMOV PF                         ' +
           ' WHERE CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL ' +
           '   AND PF.IDCONDPAGIMOVEL  = CP.IDCONDPAGIMOVEL  ' +
           '   AND PF.IDPARCFINANCIMOV = ' + IntToStr(iIdParc);
   if not FazQuery(dtmFinanciamento.qryAux,sSql) then begin
      Result := -1;
      Exit;
   end else begin
      iIdCondPagIni := dtmFinanciamento.qryAux.FieldbyName('IDCONDPAGIMOVEL').AsFloat;
      fPrestacao    := dtmFinanciamento.qryAux.FieldbyName('VLRPRESTACAO').AsFloat;
      dVencto       := dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsDateTime;
   end;

   // Converte a taxa do mercado finaceiro definida na proposta/contrato para mes
   rTxMercado := dtmFinanciamento.qryAux.FieldByName('PERCTXJURMERC').AsFloat;
   if dtmFinanciamento.qryAux.FieldByName('PERITXJURMERC').AsString = 'D' then begin
      rTxMercado := Power(((rTxMercado/100) + 1),30);
      rTxMercado := (rTxMercado - 1) * 100;
   end;
   if dtmFinanciamento.qryAux.FieldByName('PERITXJURMERC').AsString = 'A' then begin
      rTxMercado := Power(((rTxMercado/100) + 1),(1/12));
      rTxMercado := (rTxMercado - 1) * 100;
   end;
   rTxMercado := 1 + (rTxMercado / 100);

   // Calcula a Taxa de Juros do Mercado da parcela
   rNumMeses     := (dVencto - dAntecipa)/30;
   if rNumMeses < 1 then begin
      rNumMeses  := rNumMeses + 1;
   end;
   rValPresente  := fPrestacao / Power(rTxMercado, rNumMeses);

   Result := rValPresente;
end;

//========================================================================================
// Função para Buscar a Condição de Pagamento efetiva ( inicio ou repactuacao )
// Data : 19/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCond          : id da Condição de Pagamento
//       mes            : mes efetivo de busca da condição    ( -1 se bCondFinal = True )
//       ano            : ano efetivo de busca da condição    ( -1 se bCondFinal = True )
//       bCondFinal     : True - Abre a última alteração da condição de pagamento
//       TpCondPag      : Retorna o registro com os dados da condição de pagamento
//       bSaldoComposto : Verifica o Saldo Inicial composto ( default = false )
//
// Retorno : True  - Caso exista alguma condição de pagamento
//           False - Caso não seja encontrada nenhuma condição de pagamento
//----------------------------------------------------------------------------------------
function TFuncAlienacao.BuscaCondPag(const iCond: Double;  const mes,ano: Double;
                                     const bCondFinal: Boolean; var TpCondPag: TCondPag; const bSaldoComposto: Boolean): Boolean;
begin
   Result := True;
   with dtmFinanciamento.qryAux do begin
      SQL.Clear;
      if bCondFinal = False then begin
         SQL.Add('  SELECT  CP.*, C.CONDATAASSINATURA, C.CONDATAINICIO, C.FLGTIPOCONTRATO ');
         SQL.Add('    FROM  CONDPAGIMOVEL CP, CONTRATOIMOVEL C ');
         SQL.Add('   WHERE ');
         SQL.Add('          CP.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ');
         SQL.Add('     AND  ( (CP.IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL) OR (CP.IDCONDINICIAL = :pIDCONDPAGIMOVEL) ) ');
         SQL.Add('     AND  ( :pDATA >= TO_CHAR(CP.DATAINI,' + QuotedStr('YYYYMM') + ') ) ');
         SQL.Add('     AND  ( :pDATA <= TO_CHAR(CP.DATAFIM,' + QuotedStr('YYYYMM') + ') ) ');
         Params[0].AsFloat  := iCond;
         Params[1].AsFloat  := iCond;
         Params[2].AsString := FormatFloat('0000',ano) + FormatFloat('00',mes);
         Params[3].AsString := FormatFloat('0000',ano) + FormatFloat('00',mes);
         Open;
      end else begin
         SQL.Add('  SELECT  CP.*, C.CONDATAASSINATURA, C.CONDATAINICIO, C.FLGTIPOCONTRATO ');
         SQL.Add('    FROM  CONDPAGIMOVEL CP, CONTRATOIMOVEL C ');
         SQL.Add('   WHERE ');
         SQL.Add('          CP.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ');
         SQL.Add('     AND  ( (CP.IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL) OR (CP.IDCONDINICIAL = :pIDCONDPAGIMOVEL) ) ');
         SQL.Add('ORDER BY CP.DATAINI');
         Params[0].AsFloat    := iCond;
         Params[1].AsFloat    := iCond;
         Open;
         Last;
      end;

      if not isEmpty then begin
         Result := True;
         TpCondPag.fIDContratoImovel := FieldByName('IDCONTRATOIMOVEL').AsFloat;
         TpCondPag.fIDCondPagImovel  := FieldByName('IDCONDPAGIMOVEL').AsFloat;
         TpCondPag.fIDCondInicial    := FieldByName('IDCONDINICIAL').AsFloat;
         TpCondPag.sTipoCondPag      := FieldByName('TIPOCONDPAG').AsString;
         TpCondPag.fSaldoDev         := FieldByName('VLRFINANC').AsFloat;
         TpCondPag.dDataVencimento   := FieldByName('DATAVENCIMENTO').AsDateTime;
         TpCondPag.iFormaCalculo     := FieldByName('FORMACALCULO').AsInteger;
         TpCondPag.iNumParcelas      := FieldByName('NUMPARCELAS').AsInteger;
         TpCondPag.iPeriodo          := FieldByName('PERIODO').AsInteger;
         TpCondPag.sPrazo            := FieldByName('PRAZO').AsString;
         TpCondPag.iIDIndCorr        := FieldByName('INDCORRECAO').AsInteger;
         TpCondPag.iIDIndProj        := FieldByName('IDINDCORRPROJ').AsInteger;
         TpCondPag.fTaxaJuros        := FieldByName('TAXAJUROS').AsFloat;
         TpCondPag.fCorrecaoProj     := FieldByName('PERINDPROJ').AsFloat / 100;
         TpCondPag.sPeriodoTaxa      := FieldByName('PERIODOTAXA').AsString;
         TpCondPag.sFlgReajMensal    := FieldByName('FLGREAJMENSAL').AsString;
         TpCondPag.sFlgCMMensal      := FieldByName('FLGCMMENSAL').AsString;
         TpCondPag.iMesRefReajuste   := FieldByName('MESREFREAJUSTE').AsInteger;
         TpCondPag.dDataIni          := FieldByName('DATAINI').AsDateTime;
         TpCondPag.dDataFim          := FieldByName('DATAFIM').AsDateTime;
         if not FieldByName('DATACARENCIA').IsNull then begin
            TpCondPag.dDataAssinatura := FieldByName('DATACARENCIA').AsDateTime;
         end else begin
            if FieldByName('FLGTIPOCONTRATO').AsString = 'P' then
                 TpCondPag.dDataAssinatura := FieldByName('CONDATAINICIO').AsDateTime
            else TpCondPag.dDataAssinatura := FieldByName('CONDATAASSINATURA').AsDateTime;

            // Repactuação que gerou novas condições de pagamento (desmembramento ou fusão)
            if (FieldByName('TIPOCONDPAG').AsString = 'R') and (FieldByName('IDREPACTUA').IsNull) then begin
               TpCondPag.dDataAssinatura := FieldByName('DATAINI').AsDateTime;
            end;
         end;

         if not FieldByName('DATAINIAMORTIZ').IsNull then
              TpCondPag.dDataIniAmortiz := FieldByName('DATAINIAMORTIZ').AsDateTime
         else TpCondPag.dDataIniAmortiz := FieldByName('DATAVENCIMENTO').AsDateTime;

         if FieldByName('FLGJURCARENCIA').AsString = 'S' then
              TpCondPag.bJurosCarencia := True
         else TpCondPag.bJurosCarencia := False;

         if FieldByName('FLGCMMENSAL').IsNull   then TpCondPag.sFlgCMMensal   := 'N';
         if FieldByName('FLGREAJMENSAL').IsNull then TpCondPag.sFlgReajMensal := 'N';

         // Calcula o Nr. de meses efetivos entre as parcelas
         if TpCondPag.sPrazo = 'M' then
              TpCondPag.iPeriodoMeses := TpCondPag.iPeriodo
         else TpCondPag.iPeriodoMeses := TpCondPag.iPeriodo * 12;

         // Calcula o indice de juros a ser aplicado sobre a parcela
         if TpCondPag.fTaxaJuros > 0 then begin
            if TpCondPag.sPeriodoTaxa = 'M' then begin
               TpCondPag.fTaxaJurosParc := TpCondPag.fTaxaJuros / 100;
            end else if TpCondPag.sPeriodoTaxa = 'A' then begin
               TpCondPag.fTaxaJurosParc := TpCondPag.fTaxaJuros / 12 / 100;
            end else if TpCondPag.sPeriodoTaxa = 'C' then begin
               TpCondPag.fTaxaJurosParc := (Power( (1 + (TpCondPag.fTaxaJuros/100)), (1/12) ) -1) / 100;
            end;
         end else begin
           TpCondPag.fTaxaJurosParc := 0;
         end;

         // Ajusta a taxa de juros conforme o período  ( Taxa mensal )
         if TpCondPag.sPeriodoTaxa = 'M' then begin
            if TpCondPag.sPrazo = 'M' then begin
               TpCondPag.fTaxaJurosAjust := Power((1 + (TpCondPag.fTaxaJuros/100)), TpCondPag.iPeriodo);
            end else begin
               TpCondPag.fTaxaJurosAjust := Power((1 + (TpCondPag.fTaxaJuros/100)),(TpCondPag.iPeriodo*12));
            end;
         end;
         if TpCondPag.sPeriodoTaxa = 'A' then begin  // ( Taxa anual simples )
            if TpCondPag.sPrazo = 'M' then begin
               TpCondPag.fTaxaJurosAjust := Power((1 + (TpCondPag.fTaxaJuros/12/100)), TpCondPag.iPeriodo);
            end else begin
               TpCondPag.fTaxaJurosAjust := Power((1 + (TpCondPag.fTaxaJuros/12/100)),(TpCondPag.iPeriodo*12));
            end;
         end;
         if TpCondPag.sPeriodoTaxa = 'C' then begin
            // Calcula a taxa mensal para Juros Composto REFER
            TpCondPag.fTaxaJurosAjust := Power( (1 + (TpCondPag.fTaxaJuros/100)), (1/12) );
            if TpCondPag.sPrazo <> 'M' then begin
               TpCondPag.fTaxaJurosAjust := TpCondPag.fTaxaJurosAjust - 1;
               TpCondPag.fTaxaJurosAjust := Power((1 + (TpCondPag.fTaxaJuros/12)),(TpCondPag.iPeriodo*12));
               TpCondPag.fTaxaJurosAjust := TpCondPag.fTaxaJurosAjust + 1;
            end;
         end;
         if TpCondPag.fTaxaJurosAjust <> 0 then
            TpCondPag.fTaxaJurosAjust := TpCondPag.fTaxaJurosAjust - 1;

      end else begin
         Result := False;
         TpCondPag.fIDContratoIMovel:= 0;
         TpCondPag.fIDCondPagImovel := 0;
         TpCondPag.fIDCondInicial   := 0;
         TpCondPag.sTipoCondPag     := '';
         TpCondPag.fSaldoDev        := 0;
         TpCondPag.fSaldoDevComposto:= 0;
         TpCondPag.iNumParcelas     := 0;
         TpCondPag.iPeriodo         := 0;
         TpCondPag.sPrazo           := '';
         TpCondPag.iIDIndCorr       := 0;
         TpCondPag.iIDIndProj       := 0;
         TpCondPag.fTaxaJuros       := 0;
         TpCondPag.fTaxaJurosParc   := 0;
         TpCondPag.fCorrecaoProj    := 0;
         TpCondPag.fTaxaJurosAjust  := 0;
         TpCondPag.sPeriodoTaxa     := '';
         TpCondPag.sFlgReajMensal   := 'N';
         TpCondPag.sFlgCMMensal     := 'N';
         TpCondPag.iMesRefReajuste  := 0;
      end;
   end;

   // Busca o Saldo Devedor Composto
   if (bSaldoComposto) and (TpCondPag.iFormaCalculo = 11) then begin
      TpCondPag.fSaldoDevComposto := BuscaSaldoComposto(TpCondPag.fIDContratoImovel,
                                                        TpCondPag.dDataVencimento,
                                                        TpCondPag.iFormaCalculo,
                                                        TpCondPag.dUltVenctoComposto,
                                                        TpCondPag.fCorrAcumComposto,
                                                        TpCondPag.fJurosAcumComposto);
   end else begin
      TpCondPag.fSaldoDevComposto  := 0;
      TpCondPag.dUltVenctoComposto := -1;
   end;
end;


//========================================================================================
// Função para Calcular a Data final da Condição de Pagamento
// Data : 19/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdRepactua : id da Repactuação ( -1 )
//       iIdCond     : id da Condição de Pagamento  ( -1 )
//       iParc       : id da Parcela
//       iPeriodo    : Intervalo entre as parcelas
//       sPrazo      : Tipo de Intervalo entre as parcelas Mensal ou Anual
//       dtIni       : Data inicial da Condição de Pagamento
//       dtVenc      : Data de Vencimento inicial da Condição de pagamento
//       dtFim       : Data final da condição de Pagamento
//       bAtualiza   : True - Atualiza as datas finais das condições de pagamento anteriores
//
// Retorno : True  - Efetuou o calculo
//           False - Não efetuou o calculo
//----------------------------------------------------------------------------------------
function TFuncAlienacao.CalcFimCondPag(iIdRepactua, iIdCond: Double; iParc,iPeriodo: Integer;
                                       sPrazo: String; dtIni,dtVenc: TDateTime;
                                       var dtFim: TDateTime; bAtualiza: Boolean): Boolean;
var iMeses   : Integer;
begin
   Result := True;
   iMeses := 0;
   // define data de validade final da condição
   if iParc > 1 then begin
      if sPrazo = 'M' then begin
         iMeses := (iParc * iPeriodo) - iPeriodo;
      end else begin
         iMeses := ((iParc - 1) * (12 * iPeriodo));
      end;
      if iMeses = 1 then iMeses := 0;
   end;
   dtFim := DiasInUteis.SomaMeses(dtVenc,iMeses);

   // Ajusta as datas finais dos periodos anteriores
   if bAtualiza = True then begin
      with dtmFinanciamento do begin
         qryAux.SQL.Clear;
         qryAux.SQL.Add('  SELECT  IDCONDPAGIMOVEL');
         qryAux.SQL.Add('    FROM  CONDPAGIMOVEL ');
         if iIdRepactua > 0 then begin
            qryAux.SQL.Add('   WHERE  (IDREPACTUA = :pIDREPACTUA)');
            qryAux.Params[0].AsFloat := iIdRepactua;
         end else begin
            qryAux.SQL.Add('   WHERE  (IDCONDINICIAL = :pIDCONDPAGIMOVEL)');
            qryAux.Params[0].AsFloat := iIdCond;
         end;

         qryAux.Open;

         if not qryAux.IsEmpty then begin
            qryAux.First;
            while not qryAux.eof do begin

               LimpaParametros(dtmFinanciamento.qryUpdCondPag);
               qryUpdCondPag.ParamByName('pIDCONDPAGIMOVEL').AsFloat := qryAux.FieldByName('IDCONDPAGIMOVEL').AsFloat;
               qryUpdCondPag.ParamByName('pDATAFIM').AsString        := DateToStr(dtIni - 1);
               qryUpdCondPag.ExecSQL;

               qryAux.Next;
            end;
         end;
      end;
   end;
end;


//========================================================================================
// Função para Calcular a Correção + multa + juros das Parcelas NÃO CONCILIADAS
//        até a data Informada
// Data : 20/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iContrato    : id do Contrato (-1)
//       iComprador   : id do Comprador ou (-1)
//       iResponsavel : id do Responsavel ou (-1)
//       iCondPag     : id da Condição de Pagamento ou (-1)
//       dDataBaixa   : Data limite de correção - até quando será corrigido ou (-1)
//
// Retorno : True  - Efetuou o calculo
//           False - Não efetuou o calculo
//----------------------------------------------------------------------------------------
function TFuncAlienacao.CorrigeParcelas(const iContrato,iComprador,iResponsavel,iAdministradora,iCondPag: Double;
                                        dDataBaixa: TDateTime) : Boolean;
var prg : Integer;
    fCM,fMulta,fJuros,fVlrCorrige,fVlrCorrPg : Double;
    dDataLimite, dDataInicio : TDateTime;
    bPago : Boolean;
    cdsTemp : TCMClientDataSet;
    ctrlContratoImovel : TCtrlContratoImovel;
    ComunsImobiliarioDB : TComunsImobiliarioDB;

begin
   inherited;

   try
        Result      := True;
        prg         := 0;
        fCM         := 0;
        fJuros      := 0;
        fMulta      := 0;
        fVlrCorrige := 0;
        fVlrCorrPg  := 0;

        // abre query com registros a atualizar
        LimpaParametros(dtmFinanciamento.qryCalcCorrecao);
        with dtmFinanciamento.qryCalcCorrecao do begin
          if iContrato > 0 then
             ParamByName('pIDCONTRATO').AsFloat := iContrato;
          if iCondPag > 0 then
             ParamByName('pIDCONDPAGIMOVEL').AsFloat := iCondPag;
          if iComprador > 0 then
             ParamByName('pIDPESSOA').AsFloat := iComprador;
          if iResponsavel > 0 then
             ParamByName('pIDRESPONSAVEL').AsFloat := iResponsavel;
          if iAdministradora > 0 then
             ParamByName('pIDADMINIMOVEL').AsFloat := iAdministradora;
          if dDataBaixa <> -1 then
             ParamByName('pDATAF').AsDate := dDataBaixa;

             if Sistema.TipoCliente = 19991 then ParamByName('pCPMF').AsFloat := 215;
             ParamByName('pIDEMPRESA').AsInteger := Sistema.IdEmpresa;
          Open;
        end;

        if dDataBaixa = -1 then begin
          dDataBaixa := Date();
        end;

        FrmAguarde.Mostra('Atualizando Parcelas em Atraso até ' +  DateToStr(dDataBaixa) + '...');
        FrmAguarde.Max := dtmFinanciamento.qryCalcCorrecao.RecordCount;
        Application.ProcessMessages;


        // Faz as devidas inicializações - 19/01/2004 - Marcio Motta - Pendência 15799
        ctrlContratoImovel := TCtrlContratoImovel.Create( Sistema.IdEmpresa,
                                                          Sistema.IdModulo,
                                                          Sistema.IdUsuario,
                                                          Sistema.IdEspAcesso,
                                                          Sistema.UsaPlanoPatro );

        ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, Sistema.UsaPlanoPatro);


        ctrlContratoImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                       Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                       ComunsImobiliario.MensErroMT);

        ComunsImobiliarioDB.InitializeAs(ctrlContratoImovel);

        // Cria um CDS temporário para receber os dados - 19/01/2004 - Marcio Motta - Pendência 15799
        cdsTemp := TCMClientDataSet.Create( nil );

        StartTransacao;
        with dtmFinanciamento do begin
          qryCalcCorrecao.First;
          try
             while not qryCalcCorrecao.Eof do begin
                prg := prg + 1;
                FrmAguarde.Pos := prg;
                Application.ProcessMessages;

                // Busca as condições de de correção das parcelas - 19/01/2004 - Marcio Motta - Pendência 15799
                cdsTemp.Data := ctrlContratoImovel.BuscaParamCMJurosMulta
                               (dtmFinanciamento.qryCalcCorrecaoIDCONTRATOIMOVEL.AsFloat,
                                dtmFinanciamento.qryCalcCorrecaoDATAVENCIMENTO.AsDateTime);

                // Quando a parcela já tiver sido paga, aplicar juros e correcao sobre a divergencia de pagamento,
                // senão, aplicar multa, juros e correcao sobre o valor total da parcela
                if qryCalcCorrecaoDATAPAGAMENTO.IsNull then begin
                   bPago       := False;
                   fVlrCorrige := qryCalcCorrecaoVLRPRESTACAO.AsFloat;
                   dDataInicio := qryCalcCorrecaoDATAVENCIMENTO.AsDateTime;
                end else begin
                   bPago       := True;
                   fVlrCorrige := qryCalcCorrecaoVLRCORRIGIDOATRASO.AsFloat + qryCalcCorrecaoVLRMULTAATRASO.AsFloat +
                                  qryCalcCorrecaoVLRMORAATRASO.AsFloat - qryCalcCorrecaoVLRPAGO.AsFloat;
                   dDataInicio := qryCalcCorrecaoDATAPAGAMENTO.AsDateTime;
                end;

                // Calcula data limite para inicio do calculo da correcao
                if not bPago then begin
                   dDataLimite := ComunsImobiliarioDB.DataLimite(dDataInicio,
                                                                  qryCalcCorrecaoIDCIDADES.AsInteger,
                                                                  qryCalcCorrecaoIDPAIS.AsInteger,
                                                                  cdsTemp.FieldByName('DIASTOLERANCIA').AsInteger,
                                                                  cdsTemp.FieldByName('DIASREPASSE').AsInteger,
                                                                  qryCalcCorrecaoCODESTADO.AsString,
                                                                  cdsTemp.FieldByName('FLGTIPODIATOLERA').AsString,
                                                                  cdsTemp.FieldByName('FLGTIPODIAREPASS').AsString,
                                                                  True, False, False);
                end else begin
                   dDataLimite := qryCalcCorrecaoDATAPAGAMENTO.AsDateTime;
                   // se a parcela já tiver sido paga, considerar correcao do valor divergente a partir da data do pagamento
                   dDataInicio := dDataLimite;
                end;

                // Zera as Variáveis
                fCM    := 0;
                fJuros := 0;
                fMulta := 0;

                // Calcula multa, juros e correção para pagamentos em atraso
                if dDataBaixa > dDataLimite then begin

                   fCM := Arredonda(
                          ComunsImobiliarioDB.CalcCM(fVlrCorrige,
                                                     cdsTemp.FieldByName('IDINDCORRECAO').AsInteger,
                                                     dDataInicio + 1,
                                                     dDataBaixa, True,
                                                     cdsTemp.FieldByName('MESREFCORRECAO').AsInteger), 2);

// Início ------- Data: 26/01/2004 ----- Marcio Motta ----- Pendência: 15799
// O Cálculo dos Juros está sendo aplicado também sobre a diferença apurada do valor devido e o valor pago
                   fJuros := Arredonda(
                             ComunsImobiliarioDB.CalcJuros(fVlrCorrige + fCM,
                                                           cdsTemp.FieldByName('VLRJUROS').AsFloat,
                                                           cdsTemp.FieldByName('PERCJUROS').AsFloat,
                                                           cdsTemp.FieldByName('MOEDAJUROS').AsInteger,
                                                           cdsTemp.FieldByName('PERIODOJUROS').AsString,
                                                           dDataInicio + 1,
                                                           dDataBaixa,
                                                           cdsTemp.FieldByName('FLGJUROSPROPORC').AsString = 'S'), 2);

                   if not bPago then begin

                      fMulta := Arredonda(
                                ComunsImobiliarioDB.CalcMulta(qryCalcCorrecaoCODDOCUMENTO.AsInteger,
                                                              fVlrCorrige,fCM,
                                                              cdsTemp.FieldByName('VLRMULTA').AsFloat,
                                                              cdsTemp.FieldByName('PERCMULTA').AsFloat,
                                                              cdsTemp.FieldByName('MOEDAMULTA').AsInteger,
                                                              dDataBaixa,
                                                              dDataBaixa,
                                                              dDataBaixa,
                                                              qryCalcCorrecaoIDPARCFINANCIMOV.AsInteger), 2);
                   end;
                end;

// Fim ------------------------ Marcio Motta -----------------------------------

                // Grava dados do recebimento na parcela
                LimpaParametros(qryUpdCorrecao);
                if not bPago then begin
                   qryUpdCorrecao.ParamByName('pIDPARCFINANCIMOV').AsFloat := qryCalcCorrecaoIDPARCFINANCIMOV.AsFloat;
                   qryUpdCorrecao.ParamByName('pDATALIMITE').AsDateTime    := dDataLimite;
                   qryUpdCorrecao.ParamByName('pCORRIGIDO').AsFloat        := Arredonda(fVlrCorrige + fCM, 2);
                   qryUpdCorrecao.ParamByName('pMULTA').AsFloat            := Arredonda(fMulta, 2);
                   qryUpdCorrecao.ParamByName('pMORA').AsFloat             := Arredonda(fJuros, 2);
                end else begin


                   // Código comentado devido a mudanças nos cáculos de Juros e CM sobre a diferença
                   // de pagamento - 27/01/2004 - Marcio Motta
                   // fMulta      := 0; //qryCalcCorrecaoVLRMULTAATRASO.AsFloat;
                   // fJuros      := qryCalcCorrecaoVLRMORAATRASO.AsFloat;


{ Vinicius - 21/03/2005 verificar o porque disto....
                   // Ajusta os valores caso o valor pago tenha sido maior que o valor da prestacao
                   fVlrCorrpg  := (fVlrCorrige - fMulta - fJuros);
                   if (fVlrCorrige > 0) and (fVlrCorrpg < 0) then begin  // Se após retirar os valores de Multa e Juros, o resultado for Negativo
                      fMulta     := fMulta - (fVlrCorrpg * -1);          // Subtrai de fMulta o Valor Negativo de fVlrCorrpg
                      fVlrCorrpg := 0;                                   // Zera a Variável
                      if fMulta < 0 then begin                           // Se fMulta ficar Negativo
                         fJuros := fJuros - (fMulta * -1);               // Subtrai de fJuros o Valor Negativo de fMulta
                         fMulta := 0;                                    // Zera a Variável
                      end;
                   end;
}

                   qryUpdCorrecao.ParamByName('pIDPARCFINANCIMOV').AsFloat := qryCalcCorrecaoIDPARCFINANCIMOV.AsFloat;
                   qryUpdCorrecao.ParamByName('pDATALIMITE').AsDateTime    := qryCalcCorrecaoDATALIMITE.AsDateTime;
                   qryUpdCorrecao.ParamByName('pCORRIGIDO').AsFloat        := Arredonda(fVlrCorrige + fCM, 2);   //Arredonda(fVlrCorrpg + fCM, 2); - Marcio Motta - 27/01/2004
                   qryUpdCorrecao.ParamByName('pMULTA').AsFloat            := Arredonda(fMulta, 2);
                   qryUpdCorrecao.ParamByName('pMORA').AsFloat             := Arredonda(fJuros, 2);
                end;
                qryUpdCorrecao.ExecSQL;

                qryCalcCorrecao.Next;
             end;
             CommitTransacao;
          except
             RollBackTransacao;
             Result := False;
             raise;
          end;
        end;
        frmAguarde.Apaga;

   finally
     FreeAndNil( cdsTemp );
     FreeAndNil(ctrlContratoImovel);
     FreeAndNil(ComunsImobiliarioDB);
   end;
end;



//========================================================================================
// Função para Retornar a Descrição do Tipo de Parcela
// Data : 22/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iFlgTipo     : Nr. do Tipo de Parcela
//       iFlgIntegra  : Nr. do Flag de Integração ou (-1)
//
// Retorno : Descrição do Tipo de Parcela
//----------------------------------------------------------------------------------------
function TFuncAlienacao.TipoParcela(const iFlgTipo, iFlgIntegra: Integer): String;
var sDesc : String;
begin
{
TIPOS - 1 -> Saldo Inicial            INTEGRAÇÃO - NULL -> Não Integrado
        2 -> Sinal                                    1 -> Integrado Parcial ( Projeção )
        3 -> Parcela Gerada                           2 -> Integrado Total
        4 -> Parcela Projetada                        3 -> Lançamento de Baixa Manual
        5 -> Amortização Extra                        4 -> Lançamento de Baixa Migrado
        6 -> Acerto Divergencias                      5 -> Repactuada Total
        7 -> Pagamento de Venda a Vista               6 -> Repactuada Parcial
        8 -> Caução                                   7 -> Associado ao Adminimob
        9 -> Parcela Antecipada
       10 -> Pagamento de Resíduo
}

   // situacao original sem integracao
   sDesc := '';
   case iFlgTipo of
      1 : sDesc := 'Saldo Inicial';
      2 : sDesc := 'Sinal';
      3 : sDesc := 'Parc. Gerada';
      4 : sDesc := 'Parc. Projetada';
      5 : sDesc := 'Amort. Extra';
      6 : sDesc := 'Acerto Divergência';
      7 : sDesc := 'Venda a Vista';
      8 : sDesc := 'Caução';
      9 : sDesc := 'Parc. Antecipada';
     10 : sDesc := 'Pagto Resíduo';
   end;

   // considerar integracao total das parcelas geradas ( -1 não considera a integração )
   if iFlgIntegra <> -1 then begin

      if iFlgIntegra = 1 then begin    // considerar apenas para as projetadas
         case iFlgTipo of
            4 : sDesc := 'Proj. Integrada';
         end;
      end;

      if iFlgIntegra = 2 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Integrado';
            3 : sDesc := 'Parc. Integrada';
            4 : sDesc := 'Proj. Integrada';
            5 : sDesc := 'Amort.Integrada';
            6 : sDesc := 'Acerto Integrado';
            7 : sDesc := 'A Vista Integrado';
            8 : sDesc := 'Caução Integrada';
            9 : sDesc := 'Antecip.Integrada';
           10 : sDesc := 'Pagto.Resíduo Integrado';
         end;
      end;
      if iFlgIntegra = 3 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Baix.Man';
            3 : sDesc := 'Parc. Baix.Man';
            4 : sDesc := 'Proj. Baix.Man';
            5 : sDesc := 'Amort.Baix.Man';
            6 : sDesc := 'Acerto Baix.Man';
            7 : sDesc := 'A Vista Baix.Man';
            8 : sDesc := 'Caução Baix.Man';
            9 : sDesc := 'Antecip.Baix.Man';
           10 : sDesc := 'Pagto.Resíduo Baix.Man';
         end;
      end;

      if iFlgIntegra = 4 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Baix.Mig';
            3 : sDesc := 'Parc. Baix.Mig';
            4 : sDesc := 'Proj. Baix.Mig';
            5 : sDesc := 'Amort.Baix.Mig';
            6 : sDesc := 'Acerto Baix.Mig';
            7 : sDesc := 'A Vista Baix.Mig';
            8 : sDesc := 'Caução Baix.Mig';
            9 : sDesc := 'Antecip.Baix.Mig';
           10 : sDesc := 'Pagto.Resíduo Baix.Mig';
         end;
      end;

      if iFlgIntegra = 5 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Repactuado';
            3 : sDesc := 'Parc. Repactuada';
            4 : sDesc := 'Proj. Repactuada';
            5 : sDesc := 'Amort.Repactuada';
            6 : sDesc := 'Acerto Repactuado';
            7 : sDesc := 'A Vista Repactuado';
            8 : sDesc := 'Caução Repactuada';
            9 : sDesc := 'Antecip.Repactuada';
           10 : sDesc := 'Pagto.Resíduo Repactuado';
         end;
      end;

      if iFlgIntegra = 6 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Repactuado';
            3 : sDesc := 'Parc. Repactuada';
            4 : sDesc := 'Proj. Repactuada';
            5 : sDesc := 'Amort.Repactuada';
            6 : sDesc := 'Acerto Repactuado';
            7 : sDesc := 'A Vista Repactuado';
            8 : sDesc := 'Caução Repactuada';
            9 : sDesc := 'Antecip.Repactuada';
           10 : sDesc := 'Pagto.Resíduo Repactuado';
         end;
      end;

      if iFlgIntegra = 7 then begin
         case iFlgTipo of
            2 : sDesc := 'Sinal Integ. Adm';
            3 : sDesc := 'Parc. Integ. Adm';
            4 : sDesc := 'Proj. Integ. Adm';
            5 : sDesc := 'Amort.Integ. Adm';
            6 : sDesc := 'Acerto Integ. Adm';
            7 : sDesc := 'A Vista Integ. Adm';
            8 : sDesc := 'Caução Integ. Adm';
            9 : sDesc := 'Antecip.Integ. Adm';
           10 : sDesc := 'Pagto.Resíduo Integ. Adm';
         end;
      end;

   end;
   Result := sDesc;
end;

//========================================================================================
// Função para Retornar a Descrição da forma de Calculo da condição de pagamento
// Data : 30/01/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iFlgTipo     : Nr. do Tipo de Calculo
//
// Retorno : Descrição do Tipo de Calculo
//----------------------------------------------------------------------------------------
function TFuncAlienacao.TipoCalculo(const iFlgTipo: Integer): String;
begin
  Result := '';
  case iFlgTipo of
    1 : Result := 'PRICE - Corrige Saldo Dev. anual, incorpora resíduo, recalculo anual da Parcela';
    2 : Result := 'PRICE - Corrige Saldo Dev. mensal, recalculo anual da Parcela';
    3 : Result := 'PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção na Parcela';
    4 : Result := 'PRICE - Corrige Saldo Dev. anual, não incorpora resíduo, recalculo anual da parcela';
    5 : Result := 'JUROS MENSAL - Sobre Saldo Dev., com correção e recalculo anual';
    6 : Result := 'JUROS MENSAL - Sobre Saldo Dev. e Parcela, com correção e recalculo anual';
    7 : Result := 'JUROS MENSAL - Sobre Saldo Dev., resíduo cobrado na parcela';
    8 : Result := 'SAC - Corrige Saldo Dev. anual, Calcula Juros sobre a Parcela, recalculo anual da Parcela';
    9 : Result := 'FIXA - Sem juros e sem correção';
   10 : Result := 'PRICE - Corrige Saldo Dev. mensal, parcela fixa com indice projetado';
   11 : Result := 'JUROS MENSAL - Corrige Saldo COMPOSTO e Parcela mensal, Juros sobre Saldo COMPOSTO e Parcela';
   12 : Result := 'SAC - Corrige Saldo Dev. anual, Calcula Juros sobre o Saldo Devedor, recalculo anual da Parcela';
   13 : Result := 'SAC - Calcula Juros e Correção mensal sobre a Parcela';
   14 : Result := 'PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção anual da Parcela';
  end;
end;


//========================================================================================
// Função para Calculo das Parcelas de uma Condição de Pagamento
// Data : 30/01/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCondPag    - Nr. da Condição de Pagamento que será calculada
//       dVenctoIni  - Data do Primeiro Vencimento
//       dDataBase   - Data limite para calculo de juros pelo fator real e projetado
//       qryParcTemp - Query das Parcelas que será utilizada
//
// Retorno : Soma Total das Parcelas Calculadas
//----------------------------------------------------------------------------------------
function TFuncAlienacao.GeraParcela(iCondPag:Double; dVenctoIni,dDataBase: TDateTime; qryParcTemp: TwwQuery) : Double;

{=====================================================================
  FORMULAS DOS CÁCULOS UTILIZADOS
 =====================================================================
  * Aux            = Power(1 + (Taxa de Juros/100), nº de Parcelas )
  * SaldoAux       = (Saldo Devedor * Fator) + SUM(Residuo atualizado do periodo anterior)
  * Prestação      = SaldoAux *(((Taxa de Juros/100) * Aux )/( Aux - 1 ));

  * Juros          = % sobre o SaldoDevedor do periodo Anterior - Prestação Paga
  * Amortização    = Prestação - Juros
  * Saldo Devedor  = Saldo Devedor Anterior - Amortização

  TIPOS DE LANCAMENTO - 1 -> Saldo Inicial
                        2 -> Sinal
                        3 -> Parcela Gerada
                        4 -> Parcela Projetada
                        5 -> Amortização Extra   (não é lançado aqui)
                        6 -> Valores Extras      (não é lançado aqui)
                        7 -> Venda a Vista
                        8 -> Caução
                        9 -> Parcela Antecipada }

var
   bCondPagNova  : Boolean;        // Indica se encontrou uma repactuação nova
   TpCondPag     : TCondPag;       // Dados da Condição de Pagamento
   TpCondPagAnt  : TCondPag;       // Dados da Condição de Pagamento antes de checar repactuação
   iParc         : Integer;        // Número da Parcela
   iParcRestante : Integer;        // Número de Parcelas Restantes
   iParcCarencia : Integer;        // Parcelas de Juros cobradas durante a carencia
   fSaldoDev     : Double;         // Valor do Saldo devedor
   fPrestacao    : Double;         // Valor da Prestação
   fNominal      : Double;         // Valor Nominal da Prestação
   fFator        : Double;         // Fator de Correção das parcelas ( real * projetado )
   fFatorMes     : Double;         // Fator de Correção do Mes da Parcela
   dIniFator     : TDateTime;      // Data de início para busca do Fator de Correção
   dFimFator     : TDateTime;      // Data de Término para busca do Fator de Correção
   iMesHoje      : Integer;        // Mes Atual para verificar o tipo de parcela
   iMesVenc      : Integer;        // Mes de Vencimento para verificar o tipo de parcela
   bTemAmortiz   : Boolean;        // Indica se houve Amortização Extra
   rSaldoAmortiz : Double;         // Saldo Após a Amortização Extra
   rPercAmortiz  : Double;         // Percentual de Amortização Extra
   fResiduoAcum  : Double;         // Resíduo Acumulado para acréscimo no saldo devedor
   Aux           : Double;         // Auxiliar para calculo da prestacao
   dVencto       : TDateTime;      // Data de Vencimento da Parcela
   dVenctoVira   : TDateTime;      // Data de Vencimento na virada do período
   dVenctoAnt    : TDateTime;      // Data de Vencimento da ultima parcela antes da proxima antecipação
   dVenctoOrig   : TDateTime;      // Data de Vencimento da ultima parcela antes da antecipação
   dDataBusca    : TDateTime;      // Data auxiliar para busca da nova condição
   dIniJuros     : TDateTime;
   dReajAnual    : TDateTime;
   ano,mes,dia   : Word;           // Aux para verificar amortização extra
   bViraAno      : Boolean;        // Indica se completou 12 parcelas para virada do ano
   iParcIni      : Integer;        // Parcela inicial para calculo do residuo acumulado
   iParcFim      : Integer;        // Parcela final para calculo do resíduo acumulado
   bAntecipa     : Boolean;        // Se a Parcela anterior foi Antecipada e a Proxima também será antecipada
   bAntecipaProx : Boolean;        // Se a Próxima parcela tanbém foi antecipada
   bAntecipaAnt  : Boolean;        // Se a Parcela anterior foi Antecipada
   prg           : Integer;        // Somente indicador da progress bar
   fVlrJurosAntec: Extended;
   fSaldoDevAntec: Extended;
   fTaxaJuros    : Extended;
   fTaxaJurosAcum: Extended;
   iDiaVencto    : Integer;
   iMesVencto    : Integer;
   iDiaNovo      : Word;
   iMesNovo      : Word;
   iAnoNovo      : Word;
   iMeses        : Integer;
   iMesCorrAnt   : String;        // Mes de correção da parcela anterior para verificar se busca novo fator
   iMesCorrAtu   : String;
   fAmortizacao  : Extended;
   fCorrecaoSld  : Extended;      // Correção Monetária do Saldo Devedor
   fCorrecaoParc : Extended;
   bExisteCotacaoMes : Boolean;   // Existe cotação cadastrada para o mes de competencia
   sSql : String;
   iParcExtra    : Integer;
   iParcEncerra  : Integer;
   ComunsImobiliarioDB : TComunsImobiliarioDB;

begin
   // inicializa variaveis
   Result        := 0;
   prg           := 0;
   iParc         := 0;
   iParcRestante := 0;
   iParcEncerra  := 0;
   iParcCarencia := 0;
   iParcExtra    := 0;
   fSaldoDev     := 0;
   fPrestacao    := 0;
   fNominal      := 0;
   fFator        := 1;
   fFatorMes     := 1;
   dIniFator     := Date;
   dFimFator     := Date;
   fResiduoAcum  := 0;
   Aux           := 0;
   dVencto       := Date;
   dVenctoAnt    := Date;
   dVenctoVira   := Date;
   bViraAno      := False;
   iParcIni      := 1;
   iParcFim      := 0;
   bAntecipa     := False;
   bAntecipaProx := False;
   bAntecipaAnt  := False;
   iDiaVencto    := 0;
   iMesVencto    := 0;
   iDiaNovo      := 0;
   iMesNovo      := 0;
   iAnoNovo      := 0;
   iMeses        := 0;
   iMesCorrAtu   := '';
   iMesCorrAnt   := '';
   fVlrJurosAntec:= 0;
   fSaldoDevAntec:= 0;
   fTaxaJuros    := 0;
   fTaxaJurosAcum:= 0;
   fAmortizacao  := 0;
   fCorrecaoSld  := 0;
   fCorrecaoParc := 0;
   bExisteCotacaoMes := True;

   // Verifica a condição de pagamento no Vencimento inicial
   DecodeDate(dVenctoIni, ano, mes, dia);
   if not FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag, True) then begin
      MsgDlg('Erro na busca das condições de pagamento','Erro ',mtError,[mbOK],0);
      Abort;
   end;

   if TpCondPag.iFormaCalculo in [14] then
   begin
      Result := CalculaTipoCalculo14(iCondPag,dVenctoIni,dDataBase,qryParcTemp);
      Exit;
   end;



   // Faz as devidas inicializações
   ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, Sistema.UsaPlanoPatro);
   ComunsImobiliarioDB.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                   Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                   ComunsImobiliario.MensErroMT);

   FrmAguarde.Min := 0;
   FrmAguarde.Max := TpCondPag.iNumParcelas;
   FrmAguarde.Pos := Prg;
   FrmAguarde.Mostra('Aguarde, Gerando Parcelas...');
   Application.ProcessMessages;

   // Se a query das parcelas estiver aberta, mantém aberta para somente alterar os valores
   // que possivelmente forem recalculados, senão, abre para incluir as parcelas novas.
   if qryParcTemp.Active = False then qryParcTemp.Active := True;


   // Apaga os Registros de Saldo Inicial
   with qryParcTemp do begin
      First;
      while not eof do begin
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 1) and
            (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag) then
              Delete
         else Next;
      end;
      First;
   end;

   // define saldo devedor e vencto da primeira parcela
   if TpCondPag.iFormaCalculo in[11] then begin
      fSaldoDev   := TpCondPag.fSaldoDevComposto;
      if TpCondPag.dUltVenctoComposto > 0 then
           dVenctoAnt := TpCondPag.dUltVenctoComposto
      else dVenctoAnt := TpCondPag.dDataVencimento;
   end else begin
      fSaldoDev   := TpCondPag.fSaldoDev;
      dVenctoAnt  := TpCondPag.dDataVencimento;
   end;
   dVencto        := TpCondPag.dDataVencimento;
   dFimFator      := TpCondPag.dDataAssinatura;
   dReajAnual     := TpCondPag.dDataAssinatura;
   iDiaVencto     := DiasUteis.ExtraiDia(dVencto);
   iMesVencto     := DiasUteis.ExtraiMes(dVencto);
   bCondPagNova   := False;
   TpCondPagAnt   := TpCondPag;

   qryParcTemp.DisableControls;
   try
      while iParc < (TpCondPag.iNumParcelas + iParcCarencia + iParcExtra) do begin
         iParc := iParc + 1;

         fCorrecaoSld := 0;

         // Busca as codições de pagamento para a próxima parcela
         if iParc > 1 then begin
            // Guarda a condição anterior para verificar alterações
            TpCondPagAnt := TpCondPag;

            // busca a condição de pagamento vigente no próximo mes de vencimento
            if TpCondPag.sPrazo = 'M' then
                 DecodeDate(DiasInUteis.SomaMeses(dVencto,TpCondPag.iPeriodo), ano, mes, dia)
            else DecodeDate(DiasInUteis.SomaMeses(dVencto,TpCondPag.iPeriodo*12), ano, mes, dia);

            if not FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag) then
               TpCondPag := TpCondPagAnt;

            if TpCondPagAnt.fIDCondPagImovel <> TpCondPag.fIDCondPagImovel then begin
               bCondPagNova := True;
            end else begin
               bCondPagNova := False;
            end;
         end;

         // Se houve repactuação com alteração de juros, num. parcelas, tipo de reajuste,
         // correção, saldo devedor.
         // Força a Virada de ano, para recalculo das parcelas.
         if (bCondPagNova = True) then begin
            if (TpCondPagAnt.iNumParcelas   <> TpCondPag.iNumParcelas)   or
               (TpCondPagAnt.iPeriodo       <> TpCondPag.iPeriodo)       or
               (TpCondPagAnt.sPrazo         <> TpCondPag.sPrazo)         or
               (TpCondPagAnt.fTaxaJuros     <> TpCondPag.fTaxaJuros)     or
               (TpCondPagAnt.sPeriodoTaxa   <> TpCondPag.sPeriodoTaxa)   or
               (TpCondPagAnt.iFormaCalculo  <> TpCondPag.iFormaCalculo)  or
               (TpCondPag.fSaldoDev > 0) then begin
               bViraAno := True;
               iParcFim := iParc - 1;
            end;
         end;

         // busca saldo da correção até o mês da virada.
         if (bViraAno) and (Sistema.TipoCliente = 20041) then begin
            if TpCondPag.iIDIndCorr > 0 then begin
               dIniFator := dReajAnual;
               dFimFator := DiasUteis.SomaMeses(dIniFator,12) - 1;
               fFator    := ComunsImobiliarioDB.FatorCorrecao(TpCondPag.iIDIndCorr,
                                                              dIniFator, dFimFator,
                                                              False, TpCondPag.iMesRefReajuste, True);
               dReajAnual := dFimFator + 1;
            end;
         end;

         // apura o resíduo acumulado do ano anterior das parcelas incorporando ao saldo
         if (TpCondPag.iFormaCalculo in[1,5,6]) and (bViraAno = True) then begin
             fResiduoAcum := ApuraResiduoAcumulado(iCondPag,iParcIni,iParcFim,fFator,True,qryParcTemp);
         end;

         // apura o resíduo acumulado do ano anterior das parcelas SEM incorporar ao saldo
         if ((TpCondPag.iFormaCalculo in[4]) and (bViraAno = True)) or
            ((bViraAno = True) and (TpCondPagAnt.iFormaCalculo <> TpCondPag.iFormaCalculo) and
             (TpCondPagAnt.iFormaCalculo in[4])) then begin
             fResiduoAcum := ApuraResiduoAcumulado(iCondPag,iParcIni,iParcFim,fFator,False,qryParcTemp);
         end;

         // Define o Saldo Devedor na Virada do Ano, incorporando o resíduo
         if (TpCondPag.iFormaCalculo in[1,5,6]) or
            ((TpCondPagAnt.iFormaCalculo <> TpCondPag.iFormaCalculo) and
             (TpCondPagAnt.iFormaCalculo in[1,5,6])) then begin
            if (bViraAno = True) or (iParc = 1) then begin
               if (bCondPagNova = True) and (TpCondPag.fSaldoDev > 0) then begin
                  fSaldoDev := TpCondPag.fSaldoDev;
               end else if iParc > 1 then begin
                  fCorrecaoSld := (fSaldoDev * fFator) - fSaldoDev;
                  fSaldoDev    := (fSaldoDev * fFator) + fResiduoAcum;
               end;
               fFator   := 1;
               iParcIni := iParc;
            end;
         end;

         // Apenas Corrige o Saldo devedor pelo fator acumulado no periodo anterior
         // e grava como Correção anual do Saldo Devedor para contabilização
         // VINICIUS 07/06/2004 - FUNCEF - EXCETO AGENCIA MAGNÓLIA - IMPLEMENTAR OPÇÃO NA REPACTUAÇÃO.. AGUARDANDO 3S
         if (iCondPag <> 1864) or ((iCondPag = 1864) and (iParc < 16)) then begin
            if (TpCondPag.iFormaCalculo in[4,8,12]) or
               ((TpCondPagAnt.iFormaCalculo <> TpCondPag.iFormaCalculo) and
                (TpCondPagAnt.iFormaCalculo in[4,8,12])) then begin
               if bViraAno then begin
                  if (bCondPagNova = True) and (TpCondPag.fSaldoDev > 0) then begin
                     fSaldoDev := TpCondPag.fSaldoDev;
                  end else if iParc > 1 then begin
                     fCorrecaoSld := (fSaldoDev * fFator) - fSaldoDev;
                     fSaldoDev    := (fSaldoDev * fFator);
                  end;
                  fFator   := 1;
                  iParcIni := iParc;
               end;
            end;
         end;   

         // Grava a Correção do Saldo devedor no ultimo mes do ciclo, para contabilização
         if fCorrecaoSld > 0 then begin
            qryParcTemp.Edit;
            qryParcTemp.FieldByName('VLRCORRSALDO').asFloat := fCorrecaoSld;
            qryParcTemp.Post;
            fCorrecaoSld := 0;
         end;

         // Calcula Valor da Prestação
         if (bViraAno = True) or (iParc = 1) then begin
            iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-iParcCarencia-1));

            if TpCondPag.iFormaCalculo in[1,3,4] then begin    // Tabela Price
               if (TpCondPag.fTaxaJuros <> 0) then begin
                  Aux        := Power((1 + TpCondPag.fTaxaJurosAjust), (iParcRestante) );
                  fPrestacao := fSaldoDev * ((TpCondPag.fTaxaJurosAjust * Aux)/(Aux -1));
               end else begin
                  fPrestacao := fSaldoDev / (iParcRestante);
               end;
            end else if TpCondPag.iFormaCalculo in[2] then begin // Tabela Price - APENAS NO PRIMEIRO CICLO OU SE REPACTUAR MUDANDO O SALDO
               if (iParc = 1) or                                 //                Os demais serão calculados após a correção
                  ((bCondPagNova = True) and (TpCondPag.fSaldoDev > 0)) then begin

                  // Atualiza o Saldo pelo repactuado
                  if (bCondPagNova = True) and (TpCondPag.fSaldoDev > 0) then
                     fSaldoDev := TpCondPag.fSaldoDev;

                  if (TpCondPag.fTaxaJuros <> 0) then begin
                     Aux        := Power((1 + TpCondPag.fTaxaJurosAjust), (iParcRestante) );
                     fPrestacao := fSaldoDev * ((TpCondPag.fTaxaJurosAjust * Aux)/(Aux -1));
                  end else begin
                     fPrestacao := fSaldoDev / (iParcRestante);
                  end;
               end;
            end else if TpCondPag.iFormaCalculo in[8,12,13] then begin   // Tabela SAC - Amortização Constante
               // Quando não gera Parcelas de Juros no período de carência,
               // Capitaliza o juros no período de carência para incorporar ao saldo devedor
               // antes de calcular o valor da parcela
               if (iParc = 1) or (bCondPagNova = True) then begin
                  if iParc = 1 then
                       dIniJuros := TpCondPag.dDataAssinatura
                  else dIniJuros := dVencto;
                  fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                          dIniJuros,
                                                          DiasUteis.SomaMeses(TpCondPag.dDataVencimento, -1),
                                                          TpCondPag.iPeriodoMeses);

                  if (not TpCondPag.bJurosCarencia) and (fTaxaJuros > 0) then begin
                     fSaldoDev := fSaldoDev * (fTaxaJuros + 1);
                  end;
               end;

               fFator       := 1;
               iParcIni     := iParc;
               if iParcRestante > 0 then
                    fPrestacao := fSaldoDev / iParcRestante
               else fPrestacao := 0;
               fAmortizacao := fPrestacao;

            end else if TpCondPag.iFormaCalculo in[10] then begin  // Tabela Price - CM Projetada
               fFatorMes := ((1 + TpCondPag.fTaxaJurosAjust) * (1 + TpCondPag.fCorrecaoProj)) - 1;
               if fFatorMes <> 0 then begin
                  Aux        := Power((1 + fFatorMes), iParcRestante );
                  fPrestacao := fSaldoDev * ((fFatorMes * Aux)/(Aux -1));
               end else begin
                  fPrestacao := fSaldoDev / iParcRestante;
               end;
            end else if TpCondPag.iFormaCalculo in[11] then begin  // Juros Mensal COMPOSTO
               fPrestacao := TpCondPag.fSaldoDev / iParcRestante;
               if TpCondPag.fCorrAcumComposto > 1 then
                  fPrestacao := fPrestacao * TpCondPag.fCorrAcumComposto;
               if TpCondPag.fJurosAcumComposto > 1 then
                  fPrestacao := fPrestacao * TpCondPag.fJurosAcumComposto;
            end else begin                                         // Juros Mensal
               fPrestacao := fSaldoDev / iParcRestante;
            end;
            fNominal := fPrestacao;
         end;

         // Efetua todas as gravações apenas se o valor da prestação for > 0
         if fPrestacao > 0 then begin

            // Verifica a data de Vencimento, buscando na repactuação
            if Sistema.TipoCliente = 20041 then begin
               dIniFator  := dFimFator + 1;
            end else begin
               dIniFator  := DiasUteis.SomaMeses(dVencto, 1);
            end;
            if bCondPagNova = True then begin
               dVenctoAnt  := dVencto;
               dVencto     := TpCondPag.dDataVencimento;
               iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
               iMesVencto  := DiasUteis.ExtraiMes(dVencto);
               if bViraAno then dVenctoVira := dVencto;
            end else begin
               if iParc = 1 then begin
                  dVencto     := TpCondPag.dDataVencimento;
                  dVenctoAnt  := TpCondPag.dDataAssinatura;
                  iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
                  iMesVencto  := DiasUteis.ExtraiMes(dVencto);
                  dVenctoVira := TpCondPag.dDataAssinatura;

                  // Considera a mesma data de vencto como inicio do fator para calcular pro-rata
                  // da CM para calculos com CORREÇÃO MENSAL, pois o indice do mes será pro-rateado
                  if (TpCondPag.iFormaCalculo in[2,3,6,10,11]) and (TpCondPag.iPeriodoMeses = 1) then begin  // Atualiza saldo mensal
                     if TpCondPag.dUltVenctoComposto > 0 then
                          dIniFator := DiasUteis.SomaMeses(TpCondPag.dUltVenctoComposto,1)
                     else dIniFator := dVencto;
                   end else begin
                     dIniFator := TpCondPag.dDataAssinatura;
                  end;

               end else begin

                  // Se não houve antecipação de parcelas, altera a data do prox. vencimento
                  if not bAntecipa then begin
                     dVenctoAnt := dVencto;

                     // Ajusta o dia do vencimento para o estipulado no contrato, pois o ultimo
                     // vencimento pode ter sido alterado na antecipação
                     DecodeDate(dVencto, iAnoNovo,iMesNovo,iDiaNovo);
                     if iDiaNovo <> iDiaVencto then begin
                        try
                           dVencto := EncodeDate(iAnoNovo,iMesNovo,iDiaVencto);
                        except
                           dVencto := DiasUteis.UltDiaMes(iAnoNovo,iMesNovo);
                        end;
                     end;

                     // Este IF é baca para ajuste de contrato antecipado na FUNCEF
                     if (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat <> 3095) or
                        ((iParc <> 22) and (iParc <> 24)) then begin
                        if TpCondPag.sPrazo = 'M' then
                             dVencto := DiasUteis.SomaMeses( dVencto, TpCondPag.iPeriodo)
                        else dVencto := DiasUteis.SomaMeses( dVencto,(TpCondPag.iPeriodo * 12) );
                     end;

                     // Ajusta data do próximo vencimento para condições semestrais e anuais cuja
                     // data do próximo vencimento devido a antecipação da parcela anterior, esteja
                     // inferior ao previsto no contrato ( FUNCEF - contrato 000250 )
                     if (bAntecipaAnt = True) then begin
                        if ((TpCondPag.sPrazo =  'M') and (TpCondPag.iPeriodo > 1)) or (TpCondPag.sPrazo <> 'M') then begin
                           dIniFator  := DiasUteis.SomaMeses(dVenctoOrig, 1);                        
                           if TpCondPag.sPrazo = 'M' then
                                dVenctoOrig := DiasUteis.SomaMeses( dVenctoOrig, TpCondPag.iPeriodo)
                           else dVenctoOrig := DiasUteis.SomaMeses( dVenctoOrig,(TpCondPag.iPeriodo * 12) );
                           if dVencto < dVenctoOrig then dVencto := dVenctoOrig;
                        end;
                     end;

                     // Ajusta ultimo dia do mes
                     iDiaNovo := DiasUteis.ExtraiDia(dVencto);
                     iMesNovo := DiasUteis.ExtraiMes(dVencto);
                     if iDiaNovo < iDiaVencto then begin
                        while iDiaNovo < iDiaVencto do begin
                           dVencto := DiasUteis.SomaDias(dVencto, 1);
                           if iMesNovo <> DiasUteis.ExtraiMes(dVencto) then begin
                              dVencto := DiasUteis.SomaDias(dVencto, -1);
                              Break;
                           end;
                           iDiaNovo := DiasUteis.ExtraiDia(dVencto);
                        end;
                     end;
                  end;
               end;
            end;
            if bViraAno then dVenctoVira := dVencto;

            // Grava Registro de Saldo Inicial antes de fazer a Amortização
            if (bViraAno = True) or (iParc = 1) then begin
               if not qryParcTemp.Locate('IDCONDPAGIMOVEL;FLGTIPOLANC;DATAVENCIMENTO',VarArrayOf([iCondPag,1,dVencto]),[]) then begin
                  qryParcTemp.Insert;
                  qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat  := LeUltRegistro(nil,'PARCFINANCIMOV');
                  qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat  := TpCondPag.fIDContratoImovel;
                  qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat   := TpCondPag.fIDCondInicial;
                  qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     := 1;
                  qryParcTemp.FieldByName('NUMPARCELA').AsInteger      := 0;
                  qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := 1;
               end else begin
                  qryParcTemp.Edit;
               end;
               if iParc = 1 then begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := TpCondPag.dDataAssinatura;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := TpCondPag.fSaldoDev;
               end else begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := fSaldoDev;
               end;

               qryParcTemp.Post;
            end;

            // Verifica se a Parcela já existe. Se não existir, cria uma.
            if not qryParcTemp.Locate('IDCONDPAGIMOVEL;NUMPARCELA',VarArrayOf([iCondPag,iParc]),[]) then begin
               qryParcTemp.Append;
               qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat := LeUltRegistro(nil,'PARCFINANCIMOV');
               qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat := TpCondPag.fIDContratoImovel;
               qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat  := TpCondPag.fIDCondInicial;
               qryParcTemp.FieldByName('NUMPARCELA').asFloat := iParc;
               qryParcTemp.FieldByName('FLGLANCINTEGRA').asInteger := 0;
               qryParcTemp.FieldByName('CODDOCUMENTO').Clear;
               qryParcTemp.FieldByName('PLNCODIGO').Clear;
               qryParcTemp.FieldByName('FLGCONCILIADO').Clear;
            end else begin
               qryParcTemp.Edit;
            end;
            // Zera valores que serão recalculados
            if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
                qryParcTemp.FieldByName('VLRCORRSALDO').Clear;
                qryParcTemp.FieldByName('VLRPRESTATUALIZADA').Clear;
                qryParcTemp.FieldByName('VLRRESIDUOATUALI').Clear;
            end;

            // Se o calculo for projetado na origem, utiliza o informado no contrato, senão...
            // Calculo do Fator de Correção até a data base pelo real e depois pelo projetado
            // se o mes de vencto da parcela for o mesmo da anterior, mantém o fator da parcela
            // anterior, pois ambas pertencem ao mesmo mês, e não calcula pro-rata.
            fFatorMes := 1;
            bExisteCotacaoMes := True;
            if TpCondPag.iFormaCalculo in[10] then begin
               fFatorMes := 1 + TpCondPag.fCorrecaoProj;
            end else begin
               iMesCorrAtu := FormatDateTime('MM',dVencto) + FormatDateTime('YYYY',dVencto);
               if iMesCorrAtu <> iMesCorrAnt then begin
                  if dIniFator > dVencto then dIniFator := dVencto;

                  // Verifica se a cotação do mes já foi cadastrada
                  if TpCondPag.iMesRefReajuste = 0 then begin
                     DecodeDate( dVencto, Ano, Mes, Dia );
                  end else begin
                     DecodeDate( DiasUteis.SomaMeses(dVencto, (TpCondPag.iMesRefReajuste * -1) ), Ano, Mes, Dia );
                  end;
                  with dtmImobiliario.qryCotacoesIntervalo do begin
                     LimpaParametros(dtmimobiliario.qryCotacoesIntervalo);
                     ParamByName('INDICE').AsInteger   := TpCondPag.iIDIndCorr;
                     ParamByName('ANOMESINI').AsString := IntToStrZeroPad(Ano, 4) + IntToStrZeroPad(Mes, 2);
                     Open;
                     bExisteCotacaoMes := not dtmImobiliario.qryCotacoesIntervalo.IsEmpty;
                  end;

                  // Teste para a VALIA - O Fator anterior não buscava pro-rata
                  if Sistema.TipoCliente = 20041 then begin

                     if TpCondPag.iFormaCalculo in[13] then begin
                        dFimFator := dVencto - 1;
                     end else begin
                        DecodeDate(dVencto, ano, mes, dia);
                        dFimFator := DiasUteis.UltDiaMes(ano, mes);
                     end;

                     if (TpCondPag.dDataVencimento <= dDatabase) and (bExisteCotacaoMes) then begin
                        if TpCondPag.iIDIndCorr > 0 then begin
                           fFatorMes := ComunsImobiliarioDB.FatorCorrecao(TpCondPag.iIDIndCorr,
                                                                          dIniFator, dFimFator,
                                                                          False, TpCondPag.iMesRefReajuste, True);
                        end;
                     end else begin
                        if TpCondPag.iIDIndProj > 0 then begin
                           fFatorMes := ComunsImobiliarioDB.FatorCorrecao(TpCondPag.iIDIndProj,
                                                                          dIniFator, dFimFator,
                                                                          False, TpCondPag.iMesRefReajuste, True);
                        end else if TpCondPag.fCorrecaoProj > 0 then begin
                           fFatorMes := 1 + TpCondPag.fCorrecaoProj;
                        end;
                     end;

                  end else begin

                     if (TpCondPag.dDataVencimento <= dDatabase) and (bExisteCotacaoMes) then begin
                        if TpCondPag.iIDIndCorr > 0 then begin
                           if TpCondPag.iMesRefReajuste = 0 then
                                fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                                   dIniFator, dVencto, True)
                           else fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                              DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                              DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True);
                        end;
                     end else begin
                        if TpCondPag.iIDIndProj > 0 then begin
                           if TpCondPag.iMesRefReajuste = 0 then
                                fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                                   dIniFator, dVencto, True)
                           else fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                              DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                              DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True);
                        end else if TpCondPag.fCorrecaoProj > 0 then begin
                           fFatorMes := 1 + TpCondPag.fCorrecaoProj;
                        end;
                     end;

                  end;

                  fFator := fFator * fFatorMes;
                  iMesCorrAnt := iMesCorrAtu;
               end;
            end;

            // verifica o tipo de parcela ( 2 - Sinal, 3 - Parc Gerada, 4 - Parc Projetada
            //                              7 - Venda a Vista, 8 - Caução )
            if TpCondPag.sTipoCondPag = 'S' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 2;
            end;
            if TpCondPag.sTipoCondPag = 'V' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 7;
            end;
            if TpCondPag.sTipoCondPag = 'C' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 8;
            end;

            // Altera o Tipo de Parcela Projetada ou Gerada, apenas se a mesma não foi antecipada
            // e o indice de reajuste já foi cadastrado no global
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger <> 9 then begin
               if (TpCondPag.sTipoCondPag = 'P') or
                  (TpCondPag.sTipoCondPag = 'R') then begin
                  if (TpCondPag.iIDIndCorr = 0) and
                     (TpCondPag.iIDIndProj = 0) then begin
                      qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3;
                  end else begin
                     iMesHoje := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dDataBase)) + FormatFloat('00',DiasInUteis.ExtraiMes(dDataBase)));
                     iMesVenc := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dVencto))   + FormatFloat('00',DiasInUteis.ExtraiMes(dVencto)));

                     // Só muda o status se existir a cotação do mes de processamento
                     if (iMesVenc <= iMesHoje) and (bExisteCotacaoMes) then begin
                        qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3;
                     end else begin
                        qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 4;
                     end;
                  end;
               end;
            end;

            // Grava o default para o Saldo devedor atual
            if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
               qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat := fSaldoDev;
            end;

            // Altera o saldo devedor atual antes de calcular a parc. para os com correção mensal
            if TpCondPag.iFormaCalculo in[2,3,10,11] then begin

               // Efetua o prorata na correção da assinatura para o 1 vencto
               if iParc = 1 then begin
                  if TpCondPag.dUltVenctoComposto > 0 then begin
                     if TpCondPag.dUltVenctoComposto <> TpCondPag.dDataVencimento then
                        fFatorMes := ComunsImobiliario.ProRata((fFatorMes-1), TpCondPag.dUltVenctoComposto, TpCondPag.dDataVencimento) + 1;
                  end else begin
                     if TpCondPag.dDataAssinatura <> TpCondPag.dDataVencimento then
                        fFatorMes := ComunsImobiliario.ProRata((fFatorMes-1), TpCondPag.dDataAssinatura, TpCondPag.dDataVencimento) + 1;
                  end;
               end;
               fResiduoAcum := (fSaldoDev * fFatorMes) - fSaldoDev;
               fSaldoDev    := (fSaldoDev * fFatorMes);

               // Calcula o residuo da CM projetada fixa
               if TpCondPag.iFormaCalculo in[10] then fResiduoAcum := fSaldoDev * TpCondPag.fCorrecaoProj;

               // Recalcula o Valor da Prestação após correção do Saldo Devedor
               if (TpCondPag.iFormaCalculo in[2]) and (bViraAno = True) and (iParc > 1) then begin
                  if (TpCondPag.fTaxaJuros <> 0) then begin                  // Tabela Price
                     iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-1));
                     Aux           := Power((1 + TpCondPag.fTaxaJurosAjust), (iParcRestante) );
                     fPrestacao    := fSaldoDev * ((TpCondPag.fTaxaJurosAjust * Aux)/(Aux -1));
                  end else begin
                     fPrestacao := fSaldoDev / (iParcRestante);
                  end;
               end;

               // Recalcula a Prestação, calculando a Correção Monetária sobre a parcela
               if TpCondPag.iFormaCalculo in[3,11] then begin
                  fCorrecaoParc := (fPrestacao * fFatorMes) - fPrestacao;
                  fPrestacao    := (fPrestacao * fFatorMes);
               end;

               if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
                  qryParcTemp.FieldByName('FATORCORRECAO').AsFloat := fFatorMes;
                  qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat := fSaldoDev;
                  qryParcTemp.FieldByName('VLRRESIDUO').asFloat    := fCorrecaoParc;
                  qryParcTemp.FieldByName('VLRCORRSALDO').asFloat  := fResiduoAcum;
               end;
            end;

            // Define a taxa de juros a ser aplicada, APENAS SE A PRÓXIMA PARCELA NÃO FOR ANTECIPADA
            if bAntecipaProx then begin
               fTaxaJuros := 0;
            end else begin
               // Calcula a Taxa de Juros Pro-Rata para a primeira parcela, exceto
               // para SAC - que já foi calculado na definição da parcela quando
               // incorporado ao saldo devedor
               if (iParc = 1) and
                  (DiasUteis.ExtraiDia(TpCondPag.dDataAssinatura) <> DiasUteis.ExtraiDia(TpCondPag.dDataVencimento)) and
                  ( (TpCondPag.bJurosCarencia) or ((TpCondPag.iFormaCalculo <> 8) and (TpCondPag.iFormaCalculo <> 12)) ) then begin
                  fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                          TpCondPag.dDataAssinatura,
                                                          TpCondPag.dDataVencimento,
                                                          TpCondPag.iPeriodoMeses);
               end else begin
                  fTaxaJuros := TpCondPag.fTaxaJurosAjust;
               end;

               // Calcula a Taxa de Juros Pro-Rata para parcelas antecipadas e
               //   proxima parcela pós antecipação
               if ((qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and
                   (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime <> dVenctoAnt)) or
                   (bAntecipaAnt) then begin
                   if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then begin
                      fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                              dVenctoAnt,
                                                              qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                              TpCondPag.iPeriodoMeses);
                   end else begin
                      fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                              dVenctoAnt,
                                                              dVencto,
                                                              TpCondPag.iPeriodoMeses);
                   end;
               end;

               fTaxaJurosAcum := ((fTaxaJurosAcum + 1) * (fTaxaJuros + 1)) -1;

               // VINICIUS - ACERTO FUNCEF - CONTRATO MAGNOLIA
               if (TpCondPag.iNumParcelas <> TpCondPagAnt.iNumParcelas) and
                  (iCondPag = 1864) and (iParc > 16) then fTaxaJurosAcum := 0;

            end;

            // Calcula o Juros sobre o saldo devedor INCORPORANDO NO MESMO
            if TpCondPag.iFormaCalculo in[6] then begin
               fSaldoDev  := fSaldoDev * (fTaxaJuros + 1);
               if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
                  qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat := fSaldoDev;
                  qryParcTemp.FieldByName('FATORCORRECAO').AsFloat := fFator;
               end;
            end;

            // Grava os valores da parcela (valor, vencto, juros, amortizacao e saldo devedor)
            // SOMENTE PARA AS PARCELAS AINDA NAO INTEGRADAS
            if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
               if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then begin
                  // Se a anterior também foi antecipada, mantem o saldo devedor da anterior
                  //    para efeito de calculo do juros por antecipação
                  if not bAntecipaProx then fSaldoDevAntec := fSaldoDev;

                  // Calcula o juros pró-rata por antecipação
                  fVlrJurosAntec := CalcAntecipacao(TpCondPag.iFormaCalculo,iCondPag,iParc,
                                                    qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime, dVenctoAnt,
                                                    fSaldoDevAntec, fPrestacao, (fSaldoDev * TpCondPag.fTaxaJurosAjust),
                                                    fTaxaJuros, bAntecipaProx);

                  dVenctoOrig := dVencto;
                  dVencto     := qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime;
               end else begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
               end;

               // Registra o valor do juros sobre parcela e saldo devedor
               if TpCondPag.iFormaCalculo in[5,7] then begin
                  qryParcTemp.FieldByName('VLRJUROS').asFloat := ComunsImobiliario.Arredonda( ((fSaldoDev - fPrestacao) * TpCondPag.fTaxaJurosAjust),2 );
               end else if TpCondPag.iFormaCalculo in[6,11] then begin
                  qryParcTemp.FieldByName('VLRJUROS').asFloat := ComunsImobiliario.Arredonda((fSaldoDev * fTaxaJuros),2);
                  if TpCondPag.iPeriodoMeses = 1 then
                       qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := ComunsImobiliario.Arredonda((fPrestacao * fTaxaJuros),2)
                  else qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := ComunsImobiliario.Arredonda((fPrestacao * TpCondPag.fTaxaJurosParc),2);
               end else if TpCondPag.iFormaCalculo in[8] then begin
                  qryParcTemp.FieldByName('VLRJUROSPARC').asFloat := ComunsImobiliario.Arredonda((fNominal * fTaxaJurosAcum),2);
                  qryParcTemp.FieldByName('VLRJUROS').Clear;
               end else if TpCondPag.iFormaCalculo in[12] then begin
                  qryParcTemp.FieldByName('VLRJUROSPARC').Clear;
                  qryParcTemp.FieldByName('VLRJUROS').asFloat := ComunsImobiliario.Arredonda((fSaldoDev * fTaxaJuros),2);
               end else qryParcTemp.FieldByName('VLRJUROS').asFloat := ComunsImobiliario.Arredonda((fSaldoDev * TpCondPag.fTaxaJurosAjust),2);

               // Registra o valor da prestação, amortização e saldo devedor amortizado
               if TpCondPag.iFormaCalculo in[3] then begin
//                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fNominal,2);
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fPrestacao,2);
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := ComunsImobiliario.Arredonda(fPrestacao - qryParcTemp.FieldByName('VLRJUROS').asFloat,2);
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := ComunsImobiliario.Arredonda(fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat,2);
                  if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then   // antecipação
                       qryParcTemp.FieldByName('VLRPRESTACAO').asFloat  := qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat
                  else qryParcTemp.FieldByName('VLRPRESTACAO').asFloat  := ComunsImobiliario.Arredonda(fPrestacao,2);
               end else if TpCondPag.iFormaCalculo in[6] then begin
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fPrestacao,2);
                  if TpCondPag.iPeriodoMeses = 1 then
                       qryParcTemp.FieldByName('VLRPRESTACAO').asFloat:= ComunsImobiliario.Arredonda((fPrestacao * (1 + fTaxaJuros)),2)
                  else qryParcTemp.FieldByName('VLRPRESTACAO').asFloat:= ComunsImobiliario.Arredonda((fPrestacao * (1 + TpCondPag.fTaxaJurosParc)),2);
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := fPrestacao;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat;
               end else if TpCondPag.iFormaCalculo in[8] then begin
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fNominal,2);
                  qryParcTemp.FieldByName('VLRPRESTACAO').asFloat     := ComunsImobiliario.Arredonda(fAmortizacao + qryParcTemp.FieldByName('VLRJUROSPARC').asFloat,2);
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := fAmortizacao;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := fSaldoDev - fAmortizacao;
               end else if TpCondPag.iFormaCalculo in[13] then begin
                  qryParcTemp.FieldByName('VLRJUROS').Clear;
                  qryParcTemp.FieldByName('FATORCORRECAO').AsFloat    := fFatorMes;
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fNominal,2);
                  qryParcTemp.FieldByName('VLRRESIDUO').asFloat       := ComunsImobiliario.Arredonda(fNominal * (fFator-1),2);
                  qryParcTemp.FieldByName('VLRJUROSPARC').asFloat     := ComunsImobiliario.Arredonda(fNominal * fFator * fTaxaJuros,2);
                  qryParcTemp.FieldByName('VLRPRESTACAO').asFloat     := ComunsImobiliario.Arredonda(fAmortizacao + qryParcTemp.FieldByName('VLRJUROSPARC').asFloat + qryParcTemp.FieldByName('VLRRESIDUO').asFloat,2);
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := fAmortizacao;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := fSaldoDev - fAmortizacao;
               end else if TpCondPag.iFormaCalculo in[12] then begin
                  if (not TpCondPag.bJurosCarencia) or (dVencto >= TpCondPag.dDataIniAmortiz) then begin
                     qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fNominal,2);
                     qryParcTemp.FieldByName('VLRPRESTACAO').asFloat     := ComunsImobiliario.Arredonda(fAmortizacao + qryParcTemp.FieldByName('VLRJUROS').asFloat,2);
                     qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := fAmortizacao;
                     qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := fSaldoDev - fAmortizacao;
                  end else begin
                     qryParcTemp.FieldByName('VLRAMORTIZACAO').Clear;
                     qryParcTemp.FieldByName('VLRNOMINAL').Clear;
                     qryParcTemp.FieldByName('VLRPRESTACAO').asFloat     := ComunsImobiliario.Arredonda(qryParcTemp.FieldByName('VLRJUROS').asFloat,2);
                     qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := fSaldoDev;
                  end;
               end else if TpCondPag.iFormaCalculo in[10] then begin
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fPrestacao,2);
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := fPrestacao - qryParcTemp.FieldByName('VLRJUROS').asFloat - qryParcTemp.FieldByName('VLRRESIDUO').asFloat;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat - qryParcTemp.FieldByName('VLRRESIDUO').asFloat;
                  if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then   // antecipação
                       qryParcTemp.FieldByName('VLRPRESTACAO').asFloat  := qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat
                  else qryParcTemp.FieldByName('VLRPRESTACAO').asFloat  := ComunsImobiliario.Arredonda(fPrestacao,2);
               end else if TpCondPag.iFormaCalculo in[11] then begin
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fPrestacao,2);
                  if TpCondPag.iPeriodoMeses = 1 then
                       qryParcTemp.FieldByName('VLRPRESTACAO').asFloat:= ComunsImobiliario.Arredonda((fPrestacao * (1 + fTaxaJuros)),2)
                  else qryParcTemp.FieldByName('VLRPRESTACAO').asFloat:= ComunsImobiliario.Arredonda((fPrestacao * (1 + TpCondPag.fTaxaJurosParc)),2);
                  qryParcTemp.FieldByName('VLRPRESTACAO').asFloat     := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat + qryParcTemp.FieldByName('VLRJUROS').asFloat;
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := fPrestacao;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat;
               end else begin
                  qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fPrestacao,2);
                  qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := fPrestacao - qryParcTemp.FieldByName('VLRJUROS').asFloat;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat;
                  if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then   // antecipação
                       qryParcTemp.FieldByName('VLRPRESTACAO').asFloat  := qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat
                  else qryParcTemp.FieldByName('VLRPRESTACAO').asFloat  := ComunsImobiliario.Arredonda(fPrestacao,2);
               end;

               // Ajusta o saldo devedor final
               if qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat < 0.5 then begin
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat := 0;
               end;

            end;

            // Grava o Fator acumulado para o recalculo anual
            if TpCondPag.iFormaCalculo in[8,12] then begin
               qryParcTemp.FieldByName('FATORCORRECAO').AsFloat := fFator;
            end;

            // Grava o fator acumulado utilizado para a correção anual
            if TpCondPag.iFormaCalculo in[1,4,5] then begin
               qryParcTemp.FieldByName('FATORCORRECAO').AsFloat    := fFator;
               qryParcTemp.FieldByName('VLRRESIDUOATUALI').asFloat := 0;
            end;

            // Calcula (ou recalcula) o Resíduo pelo novo fator para os atualizados anualmente
            if TpCondPag.iFormaCalculo in[1,4,5,6] then begin
               qryParcTemp.FieldByName('VLRPRESTATUALIZADA').asFloat := ComunsImobiliario.Arredonda((qryParcTemp.FieldByName('VLRPRESTACAO').asFloat * fFator),2);
               qryParcTemp.FieldByName('VLRRESIDUO').asFloat         := qryParcTemp.FieldByName('VLRPRESTATUALIZADA').asFloat -
                                                                        qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;
               qryParcTemp.FieldByName('VLRCORRSALDO').Clear;
            end;

            // Se a CM for cobrada na parcela, incorpora a mesma no valor da prestação
            if TpCondPag.iFormaCalculo in[7] then begin
               qryParcTemp.FieldByName('VLRPRESTACAO').AsFloat := qryParcTemp.FieldByName('VLRPRESTACAO').asFloat + qryParcTemp.FieldByName('VLRRESIDUO').asFloat;
            end;

            // grava o ID do indice de correção na parcela
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger in [3,9] then begin
               if TpCondPag.iIDIndCorr = 0 then begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').Clear;
               end else begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').AsInteger := TpCondPag.iIDIndCorr;
               end;
            end else begin
               if TpCondPag.iIDIndProj = 0 then begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').Clear;
               end else begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').AsInteger := TpCondPag.iIDIndProj;
               end;
            end;

            fSaldoDev := qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat;
            Result    := Result + qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;

            qryParcTemp.Post;

         end;

         // Incrementa a parcela de juros cobrada no período de Carencia
         if (TpCondPag.bJurosCarencia) and (dVencto < TpCondPag.dDataIniAmortiz) then
            Inc(iParcCarencia);

         // Verifica se houve AMORTIZAÇÃO EXTRA
         DecodeDate(dVencto,ano,mes,dia);
         bTemAmortiz := VerifAmortiz(iCondPag, fSaldoDev, mes, ano, rSaldoAmortiz, rPercAmortiz);

         // Se teve amortização extra, ajustar aqui o fPrestação
         if bTemAmortiz then begin
            fSaldoDev    := rSaldoAmortiz;
            if TpCondPag.iFormaCalculo in[8,12] then begin
               fPrestacao   := fAmortizacao * rPercAmortiz;
            end else begin
               fPrestacao   := fPrestacao * rPercAmortiz;
            end;
            fAmortizacao := fPrestacao;
            fNominal     := fPrestacao;
         end;

         // Se o reajuste for mensal, aplica a taxa de juros (pode ter sido pro-rata na antecipação)
         if TpCondPag.iFormaCalculo in[5,6,7,11] then begin
            if TpCondPag.iPeriodoMeses = 1 then
                 fPrestacao := ComunsImobiliario.Arredonda(fPrestacao * (1 + fTaxaJuros),2)
            else fPrestacao := ComunsImobiliario.Arredonda(fPrestacao * (1 + TpCondPag.fTaxaJurosParc),2);
         end;

         FrmAguarde.Pos := prg;
         Application.ProcessMessages;
         Inc(Prg);

         // Testa se a parcela corrente foi Antecipada e a proxima será antecipada para ajuste do prox. vencto.
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and (bAntecipaProx) then
              bAntecipa := True
         else bAntecipa := False;

         // Testa se a parcela corrente foi Antecipada
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) then
              bAntecipaAnt := True
         else bAntecipaAnt := False;


         // Testa Virada do Ano para os tipos com recalculo anual ( EM MESES )
         if TpCondPag.iFormaCalculo in[1,2,4,5,6,7,8,12] then begin
           iMeses := DiasUteis.IntervaloMeses(dVenctoVira,dVencto);
           if (iMeses >= 11) or (TpCondPag.sPrazo = 'A') or
              ( (TpCondPag.iPeriodo > 1) and (iMeses + TpCondPag.iPeriodo > 11) ) then begin
              bViraAno := True;
              iParcFim := iParc;
           end else begin
              bViraAno := False;
           end;
         end;

         // Atualiza e Grava o Resíduo Final da Condição de Pagamento
         if TpCondPag.iFormaCalculo in[1,4,5,6] then begin  // incorpora residuo anualmente
           if iParc = TpCondPag.iNumParcelas  then begin
              ApuraResiduoAcumulado(iCondPag,iParcIni,iParc,fFator,False,qryParcTemp);
           end;
         end;

         // Inicia nova condição repactuada após o término das parcelas da cond. inicial
         if iParc = (TpCondPag.iNumParcelas + iParcCarencia + iParcExtra) then begin
            with dtmFinanciamento do begin
               sSql := 'SELECT *  '+#13+
                       '  FROM CONDPAGIMOVEL  '+#13+
                       ' WHERE IDCONDINICIAL = ' + FloatToStr(TpCondPag.fIDCondInicial) +#13+
                       '   AND TIPOCONDPAG = ''R''  '+#13+
                       '   AND DATAINI > TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY',dVencto))+',''DD/MM/YYYY'') ' +#13+
                       ' ORDER BY DATAINI ';
               if FazQuery(qryAux, sSql) then begin
                  if not qryAux.IsEmpty then begin
                     // Determina o nr. de parcelas extras e a nova data de vencimento
                     if TpCondPag.sPrazo = 'M' then
                          dVencto := DiasInUteis.SomaMeses(qryAux.FieldByName('DATAVENCIMENTO').AsDateTime,TpCondPag.iPeriodo *  -1)
                     else dVencto := DiasInUteis.SomaMeses(qryAux.FieldByName('DATAVENCIMENTO').AsDateTime,TpCondPag.iPeriodo * -12);

                     // Verifica o novo saldo devedor
                     if qryAux.FieldByName('VLRFINANC').AsInteger > 0 then
                        fSaldoDev := qryAux.FieldByName('VLRFINANC').AsFloat;

                     iParcExtra   := iParcExtra + qryAux.FieldByName('NUMPARCELAS').AsInteger;
                     iParcEncerra := iParcEncerra + TpCondPag.iNumParcelas;
                  end;
               end;
            end;
         end;

      end;
   finally;
      qryParcTemp.EnableControls;
      FrmAguarde.Apaga;
   end;
   qryParcTemp.First;
end;



//========================================================================================
// Função INTERNA para Apuração da Antecipação de Parcelas
// Data : 08/01/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCondPag    - id da Condição de Pagamento que será calculada
//       iParcIni    - Nr. da Parcela Inicial
//       iParcFim    - Nr. da Parcela Final
//       fFator      - Fator de Correção na Parcela Final
//       bIncorpora  - Se o Resíduo estará sendo incorporado ao saldo devedor ou não
//       qryParcTemp - Query das Parcelas que será utilizada
//
// Retorno : Resíduo Acumulado das parcelas entre iParcIni e iParcFim
//----------------------------------------------------------------------------------------
function TFuncAlienacao.CalcAntecipacao(const iFormaCalculo: Integer; const iCondPag: Double; const iParc: Integer;
                                        const dVencto, dVenctoAnt: TDateTime; const fSaldoDevedor, fVlrParcela, fVlrJurosAtual, fTaxaJuros: Extended;
                                        var bAntecipaProx: Boolean): Extended;
var fVlrJuros: Extended;
    iAntecipa, iNumDias : Integer;
begin
  Result        := -1;
  bAntecipaProx := False;
  // Calcula a antecipação quando o juros é calculado na parcela
  if iFormaCalculo in[5,6,7,8] then begin
    iAntecipa    := 0;
    fVlrJuros    := 0;
    try
      // Busca as parcelas antecipadas para a mesma data
      with dtmFinanciamento do begin
        qryAux.Close;
        qryAux.Sql.Clear;
        qryAux.Sql.Text := 'SELECT NUMPARCELA     ' +#13+
                           '  FROM PARCFINANCIMOV ' +#13+
                           ' WHERE IDCONDPAGIMOVEL = ' + FloatToStr(iCondPag) +#13+
                           '   AND FLGTIPOLANC > 1 ' +#13+
                           '   AND DATAVENCIMENTO = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dVencto)) + ',''DD/MM/YYYY'') ' +#13+
                           'ORDER BY NUMPARCELA ';
        qryAux.Open;
        if not qryAux.isEmpty then begin
           // Verifica quantas parcelas foram antecipadas para o mesmo vencimento
           while not qryAux.Eof do begin
             inc(iAntecipa);
             if qryAux.FieldByName('NUMPARCELA').AsInteger > iParc then bAntecipaProx := True;
             qryAux.Next;
           end;
           // Calcula o juros sobre o saldo devedor, rateando pelo nr. de parcelas antecipadas
           fVlrJuros  := ((fSaldoDevedor - (fVlrParcela * iAntecipa)) * fTaxaJuros) / iAntecipa;
        end;
      end;
    except
      raise;
    end;
  end else begin
    // Desconto do juros embutido na tabela price
    iNumDias  := DiasUteis.IntervaloDias(dVenctoAnt, dVencto);
    fVlrJuros := fVlrJurosAtual - ((fVlrJurosAtual/30) * iNumDias);
  end;
  Result := fVlrJuros;
end;


function TFuncAlienacao.QtdeParcMesmoVencto(const iCondPag: Double; const dVencto: TDateTime): Integer;
begin
  Result := 0;
  with dtmFinanciamento do begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Text := 'SELECT COUNT(NUMPARCELA) AS QTDE ' +#13+
                       '  FROM PARCFINANCIMOV ' +#13+
                       ' WHERE IDCONDPAGIMOVEL = ' + FloatToStr(iCondPag) +#13+
                       '   AND DATAVENCIMENTO = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dVencto)) + ',''DD/MM/YYYY'') ' +#13+
                       'ORDER BY NUMPARCELA ';
    qryAux.Open;
    Result := qryAux.FieldByName('QTDE').AsInteger;
  end;
end;


//========================================================================================
// Função INTERNA para Apuração do Resíduo Acumulado para incorporação ao Saldo Devedor
// Data : 22/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCondPag    - id da Condição de Pagamento que será calculada
//       iParcIni    - Nr. da Parcela Inicial
//       iParcFim    - Nr. da Parcela Final
//       fFator      - Fator de Correção na Parcela Final
//       bIncorpora  - Se o Resíduo estará sendo incorporado ao saldo devedor ou não
//       qryParcTemp - Query das Parcelas que será utilizada
//
// Retorno : Resíduo Acumulado das parcelas entre iParcIni e iParcFim
//----------------------------------------------------------------------------------------
function TFuncAlienacao.ApuraResiduoAcumulado(iCondPag:Double; iParcIni,iParcFim:Integer; fFator:Double; bIncorpora : Boolean;
                                              var qryParcTemp: TwwQuery) : Double;
var  fResAcum, fResNovo, fResDif : Double;
     iRecno : TBookmark;
begin
   Result   := 0;
   fResAcum := 0;
   fResNovo := 0;
   fResDif  := 0;
   iRecno := qryParcTemp.GetBookmark;
   qryParcTemp.First;
   while not qryParcTemp.Eof do begin
      if qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsFloat = iCondPag then begin
         if (qryParcTemp.FieldByName('NUMPARCELA').asInteger >= iParcIni) and
            (qryParcTemp.FieldByName('NUMPARCELA').asInteger <= iParcFim) then begin

            qryParcTemp.Edit;
            qryParcTemp.FieldByName('VLRRESIDUOATUALI').asFloat := 0;

            fResNovo := qryParcTemp.FieldByName('VLRRESIDUO').asFloat / qryParcTemp.FieldByName('FATORCORRECAO').AsFloat * fFator;
            fResDif  := fResDif + (fResNovo - qryParcTemp.FieldByName('VLRRESIDUO').asFloat);
            fResAcum := fResAcum + fResNovo;

            // Soma a diferença total no resíduo da última prestação para contabilização
            if qryParcTemp.FieldByName('NUMPARCELA').asInteger = iParcFim then begin
               qryParcTemp.FieldByName('VLRRESIDUO').asFloat := qryParcTemp.FieldByName('VLRRESIDUO').asFloat + fResDif;
            end;

            // Se o resíduo não foi cobrado através de parcela extra
            if qryParcTemp.FieldByName('FLGRESIDUOINCORP').AsString <> 'C' then begin
               if bIncorpora = True then
                    qryParcTemp.FieldByName('FLGRESIDUOINCORP').AsString := 'S'
               else qryParcTemp.FieldByName('FLGRESIDUOINCORP').AsString := 'N';
               qryParcTemp.FieldByName('VLRRESIDUOATUALI').asFloat := fResNovo;
            end;

            qryParcTemp.Post;
         end;
      end;
      qryParcTemp.Next;
   end;
   qryParcTemp.GotoBookmark(iRecno);
   Result := fResAcum;
end;



//========================================================================================
// Função INTERNA para Apurar Amortizações Extras no Período da Parcela
// Data : 22/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCondPag  - id da Condição de Pagamento que será calculada
//       rSaldoAnt - Saldo Devedor Anterior a Amortização
//       mes       - Nr. da Parcela Inicial
//       ano       - Nr. da Parcela Final
//       rSaldo    - Retorna o Saldo Devedor após a Amortização Extra
//       rPerc     - Retorna o Percentual Amortizado na Amortização Extra
//
// Retorno : True  - Existe Amortização Extra no mês informado
//           False - Não Existe Amortização Extra no mês informado
//----------------------------------------------------------------------------------------
function TFuncAlienacao.VerifAmortiz(const iCondPag,rSaldoAnt:Double; const mes,ano:Integer;
                                     var rSaldo,rPerc:Double): Boolean;
Var sMes : string;
    iSaldoProRata, iSaldoPosAmort, iSaldoDescapit, iProporcao : Double;
begin
   if Length(IntToStr(mes)) = 1 then begin
      sMes := '0'+IntToStr(mes);
   end else begin
      sMes := IntToStr(mes);
   end;

   with dtmFinanciamento do begin
      LimpaParametros(dtmFinanciamento.qryVerifAmortiz);
      qryVerifAmortiz.ParamByName('pCONDPAG').AsFloat   := iCondPag;
      qryVerifAmortiz.ParamByName('MES').AsString       := sMes;
      qryVerifAmortiz.ParamByName('ANO').AsString       := IntToStr(ano);
      qryVerifAmortiz.Open;
      if not qryVerifAmortiz.IsEmpty then begin

         iSaldoProRata  := rSaldoAnt * qryVerifAmortizFATORCORRECAO.asFloat;
         iSaldoPosAmort := iSaldoProRata - qryVerifAmortizVLRPRESTACAO.asFloat;
         iSaldoDescapit := iSaldoPosAmort / qryVerifAmortizFATORCORRECAO.asFloat;
         iProporcao     := iSaldoDescapit / rSaldoAnt;

         rSaldo := iSaldoDescapit;
         rPerc  := iProporcao;
         Result := True;
      end else begin
         rSaldo := 0;
         rPerc  := 0;
         Result := False;
      end;
   end;
end;


//========================================================================================
// Função para Procurar o Mes da Ultima Parcela de uma condição de Pagamento
//        Gerada (competência)
// Data : 22/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCondPag  - id da Condição de Pagamento
//
// Retorno : Ultimo dia do mes da ultima geração, ou a data do sistema se não existir
//           parcela gerada
//----------------------------------------------------------------------------------------
function TFuncAlienacao.BuscaUltMesGerado(const iCondPag:Double): TDateTime;
var sData : String;
begin
   with dtmFinanciamento.qryAux do begin
      Sql.Clear;
      Sql.Add('SELECT MAX(DATAVENCIMENTO) AS DATA ');
      Sql.Add('FROM   PARCFINANCIMOV ');
      Sql.Add('WHERE  FLGTIPOLANC IN(2,3) ');
      Sql.Add('  AND  IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL ');
      Params[0].AsFloat := iCondPag;
      Open;
      if FieldByName('DATA').AsDateTime > 0 then begin
         sData := FormatDateTime('DD/MM/YYYY',FieldByName('DATA').AsDateTime);
      end else begin
         sData := FormatDateTime('DD/MM/YYYY',Date());
      end;
   end;
   Result := DiasInUteis.UltDiaMes(Word(StrToInt(Copy(sData,7,4))), StrToInt(Copy(sData,4,2)));
end;



//========================================================================================
// Função para Limpar o Flag de Integração e Código de Documento no Estorno de Parcelas
// Data : 25/02/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iParc  - id da Parcela
//
// Retorno : True  - Atualizou a Parcela
//           False - Não Atualizou a Parcela
//----------------------------------------------------------------------------------------
function TFuncAlienacao.GravaEstorno(const iParc: Integer): Boolean;
Var sSql : String;
begin
   Result := True;
   sSql := ' UPDATE PARCFINANCIMOV SET '+
           ' CODDOCUMENTO    = NULL, ' +
           ' PLNCODIGO       = NULL, ' +
           ' FLGLANCINTEGRA  = 0,    ' +
           ' FLGCONCILIADO   = NULL, ' +
           ' DATALANCINTEGRA = TO_DATE(''' + DateToStr(Date()) + ''',''DD/MM/YYYY'')' +
           ' WHERE (IDPARCFINANCIMOV = '+IntToStr(iParc)+')';
   if not ExecutarQuery(dtmFinanciamento.qryAux,sSql) then Result := False;
end;



//========================================================================================
// Função para Verificar se Existe alguma Repactuação com início Superior ao Informado
// Data : 12/03/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCond    - id da Condição de Pagamento inicial
//       iRepac   - id da Repactuação                     ( -1 )
//       dDataIni - Data base para verificação
//
// Retorno : True  - Existe Repactuação com início superior
//           False - Não Existe Repactuação com início superior
//----------------------------------------------------------------------------------------
function TFuncAlienacao.TemRepacSuperior(const iCond, iRepac: Integer; const dDataIni: TDateTime): Boolean;
var dVenctoParc : TDateTime;
    iCondPag    : Integer;
begin
   Result := False;
   with dtmFinanciamento.qryAux do begin
      SQL.Clear;
      SQL.Add('  SELECT  IDCONDPAGIMOVEL, DATAINI ');
      SQL.Add('    FROM  CONDPAGIMOVEL ');
      SQL.Add('   WHERE  (IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL)');
      SQL.Add('      OR  (IDCONDINICIAL = :pIDCONDPAGIMOVEL)');
      SQL.Add('ORDER BY  DATAINI ');
      Params[0].AsInteger := iCond;
      Open;

      if not IsEmpty then begin
         Last;
         dVenctoParc := FieldByName('DATAINI').AsDateTime;
         iCondPag    := FieldByName('IDCONDPAGIMOVEL').AsInteger;
         if iRepac = -1 then begin
            if (dVenctoParc >= dDataIni) and (iCondPag <> iCond) then begin
               Result := True;
            end;
         end else begin
            if (FieldByName('DATAINI').AsDateTime >= dDataIni) and
               (FieldByName('IDCONDPAGIMOVEL').AsInteger <> iCond) and
               (FieldByName('IDCONDPAGIMOVEL').AsInteger <> iRepac) then begin
               Result := True;
            end;
         end;
      end;
   end;
end;



//========================================================================================
// Função para Verificar se Existe parcelas integradas após a data informada
// Data : 12/03/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCond    - id da Condição de Pagamento inicial
//       dDataIni - Data base para verificação
//       iQtde    - Quantidade de Parcelas Integradas     ( Retorno )
//
// Retorno : True  - Existem Parcelas Integradas
//           False - Não Existem Parcelas Integradas
//----------------------------------------------------------------------------------------
function TFuncAlienacao.TemParcIntegrada(const iCond: Integer; const dDataIni: TDateTime;
                                         var iQtde: Integer): Boolean;
var dia, mes, ano: Word;
begin
   Result := False;
   iQtde  := 0;
   DecodeDate(dDataIni, ano, mes, dia);
   with dtmFinanciamento.qryAux do begin
      SQL.Clear;
      SQL.Add('  SELECT  COUNT(*) AS QTDE ');
      SQL.Add('    FROM  PARCFINANCIMOV ');
      SQL.Add('   WHERE  FLGLANCINTEGRA > 0 ');
      SQL.Add('     AND  FLGTIPOLANC <> 6 ');        // Acertos de Divergencias
      SQL.Add('     AND  (IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL) ');
      SQL.Add('     AND  (TO_CHAR(DATAVENCIMENTO,' + QuotedStr('YYYYMM') + ') >= :pDATA) ');
      Params[0].AsInteger := iCond;
      Params[1].AsString  := FormatFloat('0000',ano) + FormatFloat('00',mes);
      Open;

      if FieldByName('QTDE').AsInteger > 0 then begin
         Result := True;
         iQtde  := FieldByName('QTDE').AsInteger;
      end;
   end;
end;



//========================================================================================
// Função para Recalcular as parcelas de uma Condição de Pagamento
// Data : 12/03/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iCond    - id da Condição de Pagamento inicial
//       dDataIni - Data do Primeiro Vencimento
//
// Retorno : True  - Recalculo com sucesso
//           False - Falha do Recalculo
//----------------------------------------------------------------------------------------
function TFuncAlienacao.RecalculaParcela(const iIdCondInicial: Double; const dDataIni: TDateTime): Boolean;
var dDataBase : TDateTime;
begin
   Result    := True;
   dDataBase := FuncAlienacao.BuscaUltMesGerado(iIdCondInicial);
   with dtmFinanciamento do begin
      LimpaParametros(qryParc);
      qryParc.ParamByName('IDCONDPAGIMOVEL').AsFloat := iIdCondInicial;
      qryParc.Open;
      try
         FuncAlienacao.GeraParcela(iIdCondInicial, dDataIni, dDataBase, DtmFinanciamento.qryParc);
         qryParc.ApplyUpdates;
         qryParc.CommitUpdates;
      except
         Result := False;
      end;
   end;
end;


//========================================================================================
// Função para Verificar se o Documento já foi pago no Contas a Receber
// Data : 29/05/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iDocumento - Nr. do Documento
//       dPagto     - Variável para retorno da Data do Pagamento
//
// Retorno : True  - Documento Pago
//           False - Documento em Aberto
//----------------------------------------------------------------------------------------
function TFuncAlienacao.VerificaPagto(const iDocumento: Integer; var dPagto: TDateTime): Boolean;
var sSql : String;
begin
   Result := False;
   sSql := 'SELECT MAX(L.DATALANCTO) AS DATAPAG ' +
           '  FROM LANCTODOCUM L, ' +
           '       DOCUMENTO D ' +
           ' WHERE D.CODDOCUMENTO = ' + IntToStr(iDocumento) +
           '  AND  D.STATUS = ' + QuotedStr('2') +
           '  AND  L.OPERACAO = ' + QuotedStr('5') +
           '  AND  L.ESTORNO IS NULL ' +
           '  AND  L.CODDOCUMENTO = D.CODDOCUMENTO ';

   with dtmFinanciamento do begin
      if FazQuery(qryAux, sSql) then begin
         if not qryAux.IsEmpty then begin
            if not qryAux.FieldByName('DATAPAG').IsNull then begin
               Result := True;
               dPagto := qryAux.FieldByName('DATAPAG').AsDateTime;
            end;
         end;
      end else begin
         Result := True;
      end;
   end;
end;


//========================================================================================
// Função para Excluir Integração de Parcelas
// Data : 29/05/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iDocumento - Nr. do Documento
//       iPlanilha  - Nr. da Planilha
//       iParcela   - Id da Parcela excluída
//       dIntegra   - Data da Integração
//       bProgresso - Exibe form de Progresso
//       sMens      - Retorna a Mensagem de Erro
//
// Retorno : True  - Documento Excluído
//           False - Erros na Exclusão
//----------------------------------------------------------------------------------------
function TFuncAlienacao.ExcluiIntegracao(const iDocumento,iPlanilha,iParcela,iTipo: Integer;
                                         const dIntegra: TDateTime;
                                         const bProgresso: Boolean; var sMens: String): Boolean;
var bTransacao, bIntegrado: Boolean;
    dInt : TDateTime;
    sSql : String;
begin
   Result     := True;
   bTransacao := False;
   bIntegrado := True;
   sMens      := '';
   // define a data que foi feita a integração anterior para verificar se é possível estornar
   if dIntegra > 0 then
        dInt := dIntegra
   else dInt := Date();

   if bProgresso then begin
      if (iDocumento > 0) or (iPlanilha > 0) then begin
         FrmAguarde.Min := 0;
         FrmAguarde.Max := 0;
         FrmAguarde.Pos := 0;
         FrmAguarde.Mostra('Excluindo Doc. ' + IntToStr(iDocumento) + '...');
         Application.ProcessMessages;
      end;
   end;

   try
      try
         if not dtmBaseDados.dbBaseDados.InTransaction then begin
            StartTransacao;
            bTransacao := True;
         end;

         // exclui pagamentos extras da tabela PARCFINANCIMOV
         if iTipo = 6 then begin
            // Limpa o ID da parcela extra da parcela com divergencia
            sSQL := ' UPDATE PARCFINANCIMOV '+
                    '    SET FLGCONCILIADO = NULL '  +
                    '  WHERE IDPARCFINANCIMOV IN ( SELECT IDPARCFINANCIMOV ' +
                    '                                FROM CONCILIADOC ' +
                    '                               WHERE IDDOCDIVERGE = ' + IntToStr(iDocumento) + ' )';
            if not ExecutarQuery(dtmFinanciamento.qryAux,sSQL) then
               raise Exception.Create('Erro ao atualizar divergencias cobradas em PARCFINANCIMOV');
         end;

         // exclui o acerto do resíduo na tabela PARCEXTRAIMOV
         if iTipo = 10 then begin
            // Retorna a situação de Incorporação do Resíduo para <N>ão
            sSql := 'UPDATE PARCFINANCIMOV ' +#13+
                    '   SET FLGRESIDUOINCORP = ''N'' '+#13+
                    ' WHERE IDPARCFINANCIMOV IN( SELECT IDPARCCOBRADA ' +#13+
                    '                              FROM PARCEXTRAIMOV ' +#13+
                    '                             WHERE IDPARCCOBRANCA = ' + IntToStr(iParcela) + ')';
            if not ExecutarQuery(dtmFinanciamento.qryAux,sSQL) then
               raise Exception.Create('Erro ao atualizar cobrança de resíduo em PARCFINANCIMOV');

            // Exclui o lancamento em PARCEXTRAIMOV
            sSQL := ' DELETE FROM PARCEXTRAIMOV '+
                    '  WHERE IDPARCCOBRANCA = ' + IntToStr(iParcela);
            if not ExecutarQuery(dtmFinanciamento.qryAux,sSQL) then
               raise Exception.Create('Erro ao excluir a parcela de cobrança do resíduo em PARCEXTRAIMOV');
         end;

         // exclui a parcela extra gerada na tabela PARCFINANCIMOV
         if (iTipo in[6,10]) and (Result = True) then begin
            sSQL := ' DELETE FROM PARCFINANCIMOV '+
                    ' WHERE (IDPARCFINANCIMOV = '+IntToStr(iParcela)+')';
            if not ExecutarQuery(dtmFinanciamento.qryAux,sSQL) then
               raise Exception.Create('Erro ao excluir a parcela gerada em PARCFINANCIMOV');
         end;

         // Grava o Flag de conciliação e limpa o cod. do documento nas parcelas
         if not GravaEstorno(iParcela) then
            raise Exception.Create('Erro ao atualizar PARCFINANCIMOV');

         // Exclui o lançamento
         if (iDocumento > 0) or (iPlanilha > 0) then
              bIntegrado := True
         else bIntegrado := False;

         if FuncoesImob.ExcluiLancImovel(iDocumento,
                                         iPlanilha,
                                         dInt,
                                         (iDocumento > 0),
                                         (iPlanilha > 0),
                                         sMens) <> 0 then
            raise Exception.Create(sMens);

         if bTransacao then CommitTransacao;
      except
         on E: Exception do begin
            Result := False;
            if bTransacao then RollBackTransacao;
            MsgDlg(E.Message, 'Aviso', mtWarning, [mbOk],0);
         end;
      end;
   finally
      if bProgresso then FrmAguarde.Apaga;
   end;
end;


//========================================================================================
// Função para Procurar os Alteradores referentes ao Tipo de Imóvel do Contrato / Parcela
// Data : 04/06/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iTipoImovel - Id. do Tipo de Imóvel   ( -1 )
//       iContrato   - Id. do Contrato         ( -1 )
//       iParcela    - Id. da Parcela          ( -1 )
//       iAltMulta   - Retorna o Alterador para Multa
//       iAltJuros   - Retorna o Alterador para Juros
//       iAltCorr    - Retorna o Alterador para Correção Monetária
//       sAltMulta   - Retorna a Descrição do Alterador para Multa
//       sAltJuros   - Retorna a Descrição do Alterador para Juros
//       sAltCorr    - Retorna a Descrição do Alterador para Correção Monetária
//
// Retorno : True  - Encontrou os Alteradores
//           False - Não Encontrou os Alteradores
//----------------------------------------------------------------------------------------
function TFuncAlienacao.BuscaAlteradores(const iContrato,iParcela: Integer;
                                         var iAltMulta, iAltJuros, iAltCorr: Integer;
                                         var sAltMulta, sAltJuros, sAltCorr: String): Boolean;
var sSql, sParam, sTipo : String;
begin
   Result    := True;
   iAltMulta := -1;
   iAltJuros := -1;
   iAltCorr  := -1;
   sAltMulta := '';
   sAltJuros := '';
   sAltCorr  := '';
   // Procura o tipo de imóvel do contrato
   sParam := '';
   if iContrato > 0 then sParam := ' AND CP.IDCONTRATOIMOVEL = ' + IntToStr(iContrato);
   if iParcela  > 0 then sParam := sParam + ' AND PF.IDPARCFINANCIMOV = ' + IntToStr(iParcela);

   sSql   := 'SELECT DISTINCT IM.CODTIPIMOVEL '+
             '  FROM IMOVEL IM, '+
             '       CONTRATOXIMOVEL CXI, '+
             '       CONDPAGIMOVEL CP, '+
             '       PARCFINANCIMOV PF '+
             ' WHERE PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL '+
             '   AND CP.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL '+
             '   AND CXI.IDIMOVEL = IM.IDIMOVEL '+ sParam;
   if FazQuery(dtmFinanciamento.qryAux, sSql) then begin
      sTipo  := dtmFinanciamento.qryAux.FieldByName('CODTIPIMOVEL').AsString;
   end else begin
      Result := False;
   end;

   // Busca os Alteradores do Tipo de Imóvel
   if Result then begin
      sSql := 'SELECT TI.CODALTMTAL, TI.CODALTJRAL, TI.CODALTCMAL, '+
              '   TAM.DESCRICAO AS ALTERADOR_MULTA, '+
              '   TAJ.DESCRICAO AS ALTERADOR_JUROS, '+
              '   TAR.DESCRICAO AS ALTERADOR_CORRECAO '+
              'FROM '+
              '   TIPOIMOVEL TI, TIPOALTERADOR TAM, TIPOALTERADOR TAJ, TIPOALTERADOR TAR '+
              'WHERE TI.CODALTMTAL = TAM.CODALTERADOR(+) '+
              '  AND TI.CODALTJRAL = TAJ.CODALTERADOR(+) '+
              '  AND TI.CODALTCMAL = TAR.CODALTERADOR(+) '+
              '  AND TI.CODTIPIMOVEL = ' + QuotedStr(sTipo);
      if FazQuery(dtmFinanciamento.qryAux, sSql) then begin
         with dtmFinanciamento do begin
            if not qryAux.FieldByName('CODALTMTAL').IsNull then begin
               iAltMulta := qryAux.FieldByName('CODALTMTAL').AsInteger;
               sAltMulta := qryAux.FieldByName('ALTERADOR_MULTA').AsString;
            end;
            if not qryAux.FieldByName('CODALTJRAL').IsNull then begin
               iAltJuros := qryAux.FieldByName('CODALTJRAL').AsInteger;
               sAltJuros := qryAux.FieldByName('ALTERADOR_JUROS').AsString;
            end;
            if not qryAux.FieldByName('CODALTCMAL').IsNull then begin
               iAltCorr  := qryAux.FieldByName('CODALTCMAL').AsInteger;
               sAltCorr  := qryAux.FieldByName('ALTERADOR_CORRECAO').AsString;
            end;
         end;
      end else begin
         Result := False;
      end;
   end;
end;



function TFuncAlienacao.BuscaSaldoComposto(const fContrato: Double; const dVencto: TDateTime; const iForma: integer; var dUltVencto: TDateTime; var fFatorAcum,fJurosAcum:Extended): Extended;
var iCondPagAnt : Integer;
begin
   Result     := 0;
   fFatorAcum := 1;
   fJurosAcum := 1;
   dUltVencto := -1;

   // Verifica o saldo da condição inicial, sem repactuações
   with dtmFinanciamento.qryAux do begin
      SQL.Clear;
      SQL.Add('SELECT  SUM(CP.VLRFINANC) AS VLRTOTAL, MIN(CP.DATAVENCIMENTO) AS PRIMEIRA');
      SQL.Add('  FROM  CONDPAGIMOVEL CP ');
      SQL.Add(' WHERE  CP.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL ');
      SQL.Add('   AND  CP.FORMACALCULO = :PFORMACALCULO ');
      SQL.Add('   AND  CP.IDCONDPAGIMOVEL = CP.IDCONDINICIAL');
      Params[0].AsFloat   := fContrato;
      Params[1].AsInteger := iForma;
      Open;

      // Se for a primeira condição
      if FieldByName('PRIMEIRA').AsDateTime = dVencto then begin
         Result := FieldByName('VLRTOTAL').AsFloat;
      end else begin

         // Busca a condição de pagamento imediatamente anterior
         SQL.Clear;
         SQL.Add('SELECT  CP.IDCONDPAGIMOVEL, CP.DATAVENCIMENTO');
         SQL.Add('  FROM  CONDPAGIMOVEL CP ');
         SQL.Add(' WHERE  CP.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL ');
         SQL.Add('   AND  CP.FORMACALCULO     = :PFORMACALCULO ');
         SQL.Add('   AND  CP.IDCONDPAGIMOVEL  = CP.IDCONDINICIAL');
         SQL.Add('ORDER BY CP.DATAVENCIMENTO' );
         Params[0].AsFloat   := fContrato;
         Params[1].AsInteger := iForma;
         Open;

         while not eof do begin
            iCondPagAnt := FieldByName('IDCONDPAGIMOVEL').AsInteger;
            Next;
            if FieldByName('DATAVENCIMENTO').AsDateTime = dVencto then break;
         end;

         // busca o saldo devedor após a amortização da ultima parcela da cond. anterior
         SQL.Clear;
         SQL.Add('SELECT  NUMPARCELA, VLRSALDODEVEDOR, DATAVENCIMENTO, FATORCORRECAO, ');
         SQL.Add('        VLRSALDOATUAL, VLRJUROS ');
         SQL.Add('  FROM  PARCFINANCIMOV ');
         SQL.Add(' WHERE  IDCONDPAGIMOVEL = :PIDCONDPAGIMOVEL ');
         SQL.Add('ORDER BY NUMPARCELA' );
         Params[0].AsInteger := iCondPagAnt;
         Open;

         // Acumula Fator de Correção e Juros
         while not eof do begin
            fFatorAcum := fFatorAcum * FieldByName('FATORCORRECAO').AsFloat;
            if (FieldByName('VLRJUROS').AsFloat > 0) and (FieldByName('VLRSALDOATUAL').AsFloat > 0) then begin
               fJurosAcum := fJurosAcum * ((FieldByName('VLRJUROS').AsFloat  / FieldByName('VLRSALDOATUAL').AsFloat) + 1);
            end;
            Next;
         end;

         Last;
         dUltVencto := FieldByName('DATAVENCIMENTO').AsDateTime;
         Result     := FieldByName('VLRSALDODEVEDOR').AsFloat;
      end;
   end;
end;

function TFuncAlienacao.InsereMsgBoleto(const iDocumento: Int64;  const vMensagem: array of string): Boolean;
begin
   FuncoesImob.InsertMsgLanc(iDocumento, '', '', -1, vMensagem);
   Documento.IntBanco.SetaMensagensCNAB(iDocumento, -1, vMensagem);

   // COLOCAR EMISBLOQ = N E CONTROLEREMESSA = NULL
   LimpaParametros(dtmFinanciamento.qryUpdateDocumento);
   dtmFinanciamento.qryUpdateDocumento.ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
   dtmFinanciamento.qryUpdateDocumento.ExecSQL;
end;


// FUNÇÃO PARA BUSCAR O SALDO DEVEDOR VINCENDO DE UM CONTRATO
function TFuncAlienacao.CalcSaldoDevedorAnt(const iContrato, iCondPag: Integer;
                                            const dData: TDateTime): Extended;
var sSql      : String;
    dLimite   : TDateTime;
    fSaldo    : Extended;
    qryCond   : TwwQuery;
    updCond   : TUpdateSQL;
begin
  Result := 0;
  if dData = -1 then
       dLimite := Date
  else dLimite := dData;

  try
     // Busca o Saldo Teórico Corrigido antes de ser amortizado das condições ainda vigentes
     sSql := 'SELECT IDCONDPAGIMOVEL, DATAVENCIMENTO, VLRSALDOATUAL '+#13+
             '  FROM PARCFINANCIMOV     '+#13+
             ' WHERE NUMPARCELA > 0     '+#13+
             '   AND FLGTIPOLANC <> 6   '+#13+
             '   AND DATAVENCIMENTO >= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') '+#13+
             '   AND IDCONDPAGIMOVEL IN ( SELECT IDCONDINICIAL FROM CONDPAGIMOVEL '+#13+
             '                             WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13;

     if iCondPag > 0 then
       sSql := sSql + '                      AND IDCONDINICIAL = ' + IntToStr(iCondPag) +#13;

     sSql := sSql + '                    ) '+#13;

     if dData = -1  then
       sSql := sSql + '   AND NVL(VLRPAGO,0) = 0 '+#13;

     sSql := sSql + ' ORDER BY IDCONDPAGIMOVEL, DATAVENCIMENTO ';
     FazQuery( dtmFinanciamento.qryAux, sSql );

     qryCond  := TwwQuery.Create( nil );
     updCond  := TUpdateSQL.Create( nil );
     qryCond.DatabaseName  := dtmFinanciamento.qryAux.DatabaseName;
     qryCond.UpdateObject  := updCond;
     qryCond.CachedUpdates := True;
     FazQuery( qryCond, 'SELECT 0 AS IDCONDPAGIMOVEL FROM CONDPAGIMOVEL WHERE 1=2');

     fSaldo := 0;
     with dtmFinanciamento do begin
        while not qryAux.Eof do begin
           if not qryCond.Locate('IDCONDPAGIMOVEL',qryAux.FieldByName('IDCONDPAGIMOVEL').AsInteger,[]) then begin
              fSaldo := fSaldo + ComunsImobiliario.Arredonda(qryAux.FieldByName('VLRSALDOATUAL').AsFloat, 2);
              qryCond.Insert;
              qryCond.FieldByName('IDCONDPAGIMOVEL').AsInteger := qryAux.FieldByName('IDCONDPAGIMOVEL').AsInteger;
              qryCond.Post;
           end;
           qryAux.Next
        end;
     end;

     // Verifica as condições já encerradas que não tiveram o saldo teórico quitado
     sSql := 'SELECT P.IDPARCFINANCIMOV, P.IDCONDPAGIMOVEL, P.DATAVENCIMENTO, '+#13+
             '       ROUND(P.VLRSALDODEVEDOR, 2) AS VLRSALDODEVEDOR '+#13+
             '  FROM PARCFINANCIMOV P, '+#13+
             '       ( SELECT P.IDCONDPAGIMOVEL, '+#13+
             '                MAX(P.DATAVENCIMENTO)  AS DATAVENCIMENTO, '+#13+
             '                MAX(P.NUMPARCELA)      AS ULTPARC '+#13+
             '           FROM PARCFINANCIMOV P, CONDPAGIMOVEL C '+#13+
             '          WHERE C.IDCONDINICIAL = P.IDCONDPAGIMOVEL '+#13+
             '            AND C.IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13+
             '            AND P.NUMPARCELA > 0 '+#13+
             '            AND C.IDREPACTUA IS NULL '+#13+
             '          GROUP BY P.IDCONDPAGIMOVEL  ) UP '+#13+
             ' WHERE P.IDCONDPAGIMOVEL = UP.IDCONDPAGIMOVEL '+#13+
             '   AND P.DATAVENCIMENTO  = UP.DATAVENCIMENTO  '+#13+
             '   AND P.NUMPARCELA      = UP.ULTPARC         '+#13+
             '   AND P.VLRSALDODEVEDOR > 0 '+#13+
             '   AND P.NUMPARCELA > 0 ';
     if iCondPag > 0 then
       sSql := sSql + ' AND P.IDCONDPAGIMOVEL = ' + IntToStr(iCondPag);

     FazQuery( dtmFinanciamento.qryAux, sSql );
     with dtmFinanciamento do begin
        while not qryAux.Eof do begin
           if not qryCond.Locate('IDCONDPAGIMOVEL',qryAux.FieldByName('IDCONDPAGIMOVEL').AsInteger,[]) then begin
              fSaldo := fSaldo + ComunsImobiliario.Arredonda(qryAux.FieldByName('VLRSALDODEVEDOR').AsFloat, 2);
              qryCond.Insert;
              qryCond.FieldByName('IDCONDPAGIMOVEL').AsInteger := qryAux.FieldByName('IDCONDPAGIMOVEL').AsInteger;
              qryCond.Post;
           end;
           qryAux.Next
        end;
     end;

  finally
     FreeAndNil( updCond );
     FreeAndNil( qryCond );
     Result := fSaldo;
  end;
end;


function TFuncAlienacao.CalcSaldoDevedor(const iContrato, iCondPag: Integer; const dData: TDateTime): Extended;
var sSql      : String;
    dLimite   : TDateTime;
    fSaldo    : Extended;
    qryCond   : TwwQuery;
    updCond   : TUpdateSQL;
begin
  Result := 0;
  if dData = -1 then
       dLimite := Date
  else dLimite := dData;

  // Ajustar para FUNCEF contrato 000444 não funciona para a nova função
  if (Sistema.TipoCliente = 19991) and (iContrato = 2720) then begin
     Result := CalcSaldoDevedorAnt(iContrato, iCondPag, dData);
     Exit;
  end;

  try
     // Busca o Saldo Teórico Corrigido antes de ser amortizado das condições ainda vigentes
     sSql := 'SELECT P.IDCONDPAGIMOVEL, P.DATAVENCIMENTO, '+#13+
             '       ROUND((P.VLRSALDOATUAL - P.VLRAMORTIZACAO),2)  AS SALDOATUAL '+#13+
             '  FROM PARCFINANCIMOV P, '+#13+
             '       ( SELECT P2.IDCONDPAGIMOVEL, MAX(P2.DATAVENCIMENTO) AS DATAVENCIMENTO '+#13+
             '           FROM PARCFINANCIMOV P2, CONDPAGIMOVEL C2 '+#13+
             '          WHERE P2.IDCONDPAGIMOVEL = C2.IDCONDINICIAL '+#13+
             '            AND P2.NUMPARCELA > 0     '+#13+
             '            AND P2.FLGTIPOLANC <> 6   '+#13+
             '            AND C2.IDREPACTUA IS NULL '+#13+
             '            AND P2.DATAVENCIMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') '+#13+
             '            AND P2.IDCONDPAGIMOVEL IN ( SELECT IDCONDINICIAL FROM CONDPAGIMOVEL '+#13+
             '                                         WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13;

     if iCondPag > 0 then
       sSql := sSql + '                      AND IDCONDINICIAL = ' + IntToStr(iCondPag) +#13;

     sSql := sSql + '                    ) '+#13+

             '          GROUP BY P2.IDCONDPAGIMOVEL ) ULT    '+#13+
             ' WHERE P.IDCONDPAGIMOVEL = ULT.IDCONDPAGIMOVEL '+#13+
             '   AND P.DATAVENCIMENTO  = ULT.DATAVENCIMENTO  '+#13+
             '   AND FLGTIPOLANC <> 6 '+#13+
             '   AND NUMPARCELA > 0 '+#13+
             '   AND (P.VLRSALDOATUAL - P.VLRAMORTIZACAO) > 0 '+#13+

             'UNION '+#13+

             'SELECT IDCONDPAGIMOVEL, DATAVENCIMENTO, '+#13+
             '       VLRFINANC  AS SALDOATUAL '+#13+
             '  FROM CONDPAGIMOVEL '+#13+
             ' WHERE IDREPACTUA IS NULL '+#13+
             '   AND DATAVENCIMENTO > TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dLimite)) + ',''DD/MM/YYYY'') '+#13+
             '   AND IDCONDPAGIMOVEL IN ( SELECT IDCONDINICIAL FROM CONDPAGIMOVEL '+#13+
             '                             WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13;

     if iCondPag > 0 then
       sSql := sSql + '                      AND IDCONDINICIAL = ' + IntToStr(iCondPag) +#13;

     sSql := sSql + '                    ) ';
     FazQuery( dtmFinanciamento.qryAux, sSql );

     qryCond  := TwwQuery.Create( nil );
     updCond  := TUpdateSQL.Create( nil );
     qryCond.DatabaseName  := dtmFinanciamento.qryAux.DatabaseName;
     qryCond.UpdateObject  := updCond;
     qryCond.CachedUpdates := True;
     FazQuery( qryCond, 'SELECT 0 AS IDCONDPAGIMOVEL FROM CONDPAGIMOVEL WHERE 1=2');

     fSaldo := 0;
     with dtmFinanciamento do begin
        while not qryAux.Eof do begin
           if not qryCond.Locate('IDCONDPAGIMOVEL',qryAux.FieldByName('IDCONDPAGIMOVEL').AsInteger,[]) then begin
              fSaldo := fSaldo + ComunsImobiliario.Arredonda(qryAux.FieldByName('SALDOATUAL').AsFloat, 2);
              qryCond.Insert;
              qryCond.FieldByName('IDCONDPAGIMOVEL').AsInteger := qryAux.FieldByName('IDCONDPAGIMOVEL').AsInteger;
              qryCond.Post;
           end;
           qryAux.Next
        end;
     end;

  finally
     FreeAndNil( updCond );
     FreeAndNil( qryCond );
     Result := fSaldo;
  end;
end;



function TFuncAlienacao.CalculaTipoCalculo14(iCondPag: Double; dVenctoIni, dDataBase: TDateTime; qryParcTemp: TwwQuery): Double;
var
   bCondPagNova  : Boolean;        // Indica se encontrou uma repactuação nova
   TpCondPag     : TCondPag;       // Dados da Condição de Pagamento
   TpCondPagAnt  : TCondPag;       // Dados da Condição de Pagamento antes de checar repactuação
   iParc         : Integer;        // Número da Parcela
   iParcRestante : Integer;        // Número de Parcelas Restantes
   iParcCarencia : Integer;        // Parcelas de Juros cobradas durante a carencia
   fSaldoDev     : Double;         // Valor do Saldo devedor
   fPrestacao    : Double;         // Valor da Prestação
   fNominal      : Double;         // Valor Nominal da Prestação
   fFator        : Double;         // Fator de Correção das parcelas ( real * projetado )
   fFatorMes     : Double;         // Fator de Correção do Mes da Parcela
   dIniFator     : TDateTime;      // Data de início para busca do Fator de Correção
   dFimFator     : TDateTime;      // Data de Término para busca do Fator de Correção
   iMesHoje      : Integer;        // Mes Atual para verificar o tipo de parcela
   iMesVenc      : Integer;        // Mes de Vencimento para verificar o tipo de parcela
   bTemAmortiz   : Boolean;        // Indica se houve Amortização Extra
   rSaldoAmortiz : Double;         // Saldo Após a Amortização Extra
   rPercAmortiz  : Double;         // Percentual de Amortização Extra
   fResiduoAcum  : Double;         // Resíduo Acumulado para acréscimo no saldo devedor
   Aux           : Double;         // Auxiliar para calculo da prestacao
   dVencto       : TDateTime;      // Data de Vencimento da Parcela
   dVenctoVira   : TDateTime;      // Data de Vencimento na virada do período
   dVenctoAnt    : TDateTime;      // Data de Vencimento da ultima parcela antes da antecipação
   dDataBusca    : TDateTime;      // Data auxiliar para busca da nova condição
   dIniJuros     : TDateTime;
   dReajAnual    : TDateTime;
   ano,mes,dia   : Word;           // Aux para verificar amortização extra
   bViraAno      : Boolean;        // Indica se completou 12 parcelas para virada do ano
   iParcIni      : Integer;        // Parcela inicial para calculo do residuo acumulado
   iParcFim      : Integer;        // Parcela final para calculo do resíduo acumulado
   bAntecipa     : Boolean;        // Se a Parcela anterior foi Antecipada e a Proxima também será antecipada
   bAntecipaProx : Boolean;        // Se a Próxima parcela tanbém foi antecipada
   bAntecipaAnt  : Boolean;        // Se a Parcela anterior foi Antecipada
   prg           : Integer;        // Somente indicador da progress bar
   fVlrJurosAntec: Extended;
   fSaldoDevAntec: Extended;
   fTaxaJuros    : Extended;
   fTaxaJurosAcum: Extended;
   iDiaVencto    : Integer;
   iMesVencto    : Integer;
   iDiaNovo      : Word;
   iMesNovo      : Word;
   iAnoNovo      : Word;
   iMeses        : Integer;
   iMesCorrAnt   : String;        // Mes de correção da parcela anterior para verificar se busca novo fator
   iMesCorrAtu   : String;
   fAmortizacao  : Extended;
   fCorrecaoSld  : Extended;      // Correção Monetária do Saldo Devedor
   fCorrecaoParc : Extended;
   bExisteCotacaoMes : Boolean;   // Existe cotação cadastrada para o mes de competencia
   sSql : String;
   iParcExtra    : Integer;
   iParcEncerra  : Integer;
   ComunsImobiliarioDB : TComunsImobiliarioDB;

begin
   // inicializa variaveis
   Result        := 0;
   prg           := 0;
   iParc         := 0;
   iParcRestante := 0;
   iParcEncerra  := 0;
   iParcCarencia := 0;
   iParcExtra    := 0;
   fSaldoDev     := 0;
   fPrestacao    := 0;
   fNominal      := 0;
   fFator        := 1;
   fFatorMes     := 1;
   dIniFator     := Date;
   dFimFator     := Date;
   fResiduoAcum  := 0;
   Aux           := 0;
   dVencto       := Date;
   dVenctoAnt    := Date;
   dVenctoVira   := Date;
   bViraAno      := False;
   iParcIni      := 1;
   iParcFim      := 0;
   bAntecipa     := False;
   bAntecipaProx := False;
   bAntecipaAnt  := False;
   iDiaVencto    := 0;
   iMesVencto    := 0;
   iDiaNovo      := 0;
   iMesNovo      := 0;
   iAnoNovo      := 0;
   iMeses        := 0;
   iMesCorrAtu   := '';
   iMesCorrAnt   := '';
   fVlrJurosAntec:= 0;
   fSaldoDevAntec:= 0;
   fTaxaJuros    := 0;
   fTaxaJurosAcum:= 0;
   fAmortizacao  := 0;
   fCorrecaoSld  := 0;
   fCorrecaoParc := 0;
   bExisteCotacaoMes := True;

   // Verifica a condição de pagamento no Vencimento inicial
   DecodeDate(dVenctoIni, ano, mes, dia);
   FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag, True);

   // Faz as devidas inicializações
   ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, Sistema.UsaPlanoPatro);
   ComunsImobiliarioDB.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                   Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                   ComunsImobiliario.MensErroMT);

   FrmAguarde.Min := 0;
   FrmAguarde.Max := TpCondPag.iNumParcelas;
   FrmAguarde.Pos := Prg;
   FrmAguarde.Mostra('Aguarde, Gerando Parcelas...');
   Application.ProcessMessages;

   // Se a query das parcelas estiver aberta, mantém aberta para somente alterar os valores
   // que possivelmente forem recalculados, senão, abre para incluir as parcelas novas.
   if qryParcTemp.Active = False then qryParcTemp.Active := True;


   // Apaga os Registros de Saldo Inicial
   with qryParcTemp do begin
      First;
      while not eof do begin
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 1) and
            (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPag) then
              Delete
         else Next;
      end;
      First;
   end;

   // define saldo devedor e vencto da primeira parcela
   fSaldoDev   := TpCondPag.fSaldoDev;
   dVenctoAnt  := TpCondPag.dDataVencimento;

   dVencto        := TpCondPag.dDataVencimento;
   dFimFator      := TpCondPag.dDataAssinatura;
   dReajAnual     := TpCondPag.dDataAssinatura;
   iDiaVencto     := DiasUteis.ExtraiDia(dVencto);
   iMesVencto     := DiasUteis.ExtraiMes(dVencto);
   bCondPagNova   := False;
   TpCondPagAnt   := TpCondPag;

   qryParcTemp.DisableControls;
   try
      while iParc < (TpCondPag.iNumParcelas + iParcCarencia + iParcExtra) do begin
         iParc := iParc + 1;

         fCorrecaoSld := 0;

         // Busca as codições de pagamento para a próxima parcela
         if iParc > 1 then begin
            // Guarda a condição anterior para verificar alterações
            TpCondPagAnt := TpCondPag;

            // busca a condição de pagamento vigente no próximo mes de vencimento
            if TpCondPag.sPrazo = 'M' then
                 DecodeDate(DiasInUteis.SomaMeses(dVencto,TpCondPag.iPeriodo), ano, mes, dia)
            else DecodeDate(DiasInUteis.SomaMeses(dVencto,TpCondPag.iPeriodo*12), ano, mes, dia);

            if not FuncAlienacao.BuscaCondPag(iCondPag, mes, ano, False, TpCondPag) then
               TpCondPag := TpCondPagAnt;

            if TpCondPagAnt.fIDCondPagImovel <> TpCondPag.fIDCondPagImovel then begin
               bCondPagNova := True;
            end else begin
               bCondPagNova := False;
            end;
         end;

         // Se houve repactuação com alteração de juros, num. parcelas, tipo de reajuste,
         // correção, saldo devedor.
         // Força a Virada de ano, para recalculo das parcelas.
         if (bCondPagNova = True) then begin
            if (TpCondPagAnt.iNumParcelas   <> TpCondPag.iNumParcelas)   or
               (TpCondPagAnt.iPeriodo       <> TpCondPag.iPeriodo)       or
               (TpCondPagAnt.sPrazo         <> TpCondPag.sPrazo)         or
               (TpCondPagAnt.fTaxaJuros     <> TpCondPag.fTaxaJuros)     or
               (TpCondPagAnt.sPeriodoTaxa   <> TpCondPag.sPeriodoTaxa)   or
               (TpCondPagAnt.iFormaCalculo  <> TpCondPag.iFormaCalculo)  or
               (TpCondPag.fSaldoDev > 0) then begin
               bViraAno := True;
               iParcFim := iParc - 1;
            end;
         end;

         // busca saldo da correção até o mês da virada.
         if (bViraAno) and (Sistema.TipoCliente = 20041) then begin
            if TpCondPag.iIDIndCorr > 0 then begin
               dIniFator := dReajAnual;
               dFimFator := DiasUteis.SomaMeses(dIniFator,12) - 1;
               fFator    := ComunsImobiliarioDB.FatorCorrecao(TpCondPag.iIDIndCorr,
                                                              dIniFator, dFimFator,
                                                              False, TpCondPag.iMesRefReajuste, True);
               dReajAnual := dFimFator + 1;
            end;
         end;

         // Grava a Correção do Saldo devedor no ultimo mes do ciclo, para contabilização
         if fCorrecaoSld > 0 then begin
            qryParcTemp.Edit;
            qryParcTemp.FieldByName('VLRCORRSALDO').asFloat := fCorrecaoSld;
            qryParcTemp.Post;
            fCorrecaoSld := 0;
         end;

         // Calcula Valor da Prestação
         if (bViraAno = True) or (iParc = 1) then begin
            iParcRestante := (TpCondPag.iNumParcelas + iParcEncerra - (iParc-iParcCarencia-1));

            if bViraAno then
            begin
               fPrestacao := fPrestacao * fFator;
            end
            else
            if (TpCondPag.fTaxaJuros <> 0) then begin
               Aux        := Power((1 + TpCondPag.fTaxaJurosAjust), (iParcRestante) );
               fPrestacao := fSaldoDev * ((TpCondPag.fTaxaJurosAjust * Aux)/(Aux -1));
            end else begin
               fPrestacao := fSaldoDev / (iParcRestante);
            end;
            fNominal := fPrestacao;
         end;

         // Efetua todas as gravações apenas se o valor da prestação for > 0
         if fPrestacao > 0 then begin

            // Verifica a data de Vencimento, buscando na repactuação
            if Sistema.TipoCliente = 20041 then begin
               dIniFator  := dFimFator + 1;
            end else begin
               dIniFator  := DiasUteis.SomaMeses(dVencto, 1);
            end;
            if bCondPagNova = True then begin
               dVenctoAnt  := dVencto;
               dVencto     := TpCondPag.dDataVencimento;
               iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
               iMesVencto  := DiasUteis.ExtraiMes(dVencto);
               if bViraAno then dVenctoVira := dVencto;
            end else begin
               if iParc = 1 then begin
                  dVencto     := TpCondPag.dDataVencimento;
                  dVenctoAnt  := TpCondPag.dDataAssinatura;
                  iDiaVencto  := DiasUteis.ExtraiDia(dVencto);
                  iMesVencto  := DiasUteis.ExtraiMes(dVencto);
                  dVenctoVira := TpCondPag.dDataAssinatura;

                  // Considera a mesma data de vencto como inicio do fator para calcular pro-rata
                  // da CM para calculos com CORREÇÃO MENSAL, pois o indice do mes será pro-rateado
                  if TpCondPag.dUltVenctoComposto > 0 then
                       dIniFator := DiasUteis.SomaMeses(TpCondPag.dUltVenctoComposto,1)
                  else dIniFator := dVencto;

               end else begin

                  // Se não houve antecipação de parcelas, altera a data do prox. vencimento
                  if not bAntecipa then begin
                     dVenctoAnt := dVencto;

                     // Ajusta o dia do vencimento para o estipulado no contrato, pois o ultimo
                     // vencimento pode ter sido alterado na antecipação
                     DecodeDate(dVencto, iAnoNovo,iMesNovo,iDiaNovo);
                     if iDiaNovo <> iDiaVencto then begin
                        try
                           dVencto := EncodeDate(iAnoNovo,iMesNovo,iDiaVencto);
                        except
                           dVencto := DiasUteis.UltDiaMes(iAnoNovo,iMesNovo);
                        end;
                     end;

                     // Este IF é baca para ajuste de contrato antecipado na FUNCEF
                     if (qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat <> 3095) or
                        ((iParc <> 22) and (iParc <> 24)) then begin
                        if TpCondPag.sPrazo = 'M' then
                             dVencto := DiasUteis.SomaMeses( dVencto, TpCondPag.iPeriodo)
                        else dVencto := DiasUteis.SomaMeses( dVencto,(TpCondPag.iPeriodo * 12) );
                     end;

                     // Ajusta ultimo dia do mes
                     iDiaNovo := DiasUteis.ExtraiDia(dVencto);
                     iMesNovo := DiasUteis.ExtraiMes(dVencto);
                     if iDiaNovo < iDiaVencto then begin
                        while iDiaNovo < iDiaVencto do begin
                           dVencto := DiasUteis.SomaDias(dVencto, 1);
                           if iMesNovo <> DiasUteis.ExtraiMes(dVencto) then begin
                              dVencto := DiasUteis.SomaDias(dVencto, -1);
                              Break;
                           end;
                           iDiaNovo := DiasUteis.ExtraiDia(dVencto);
                        end;
                     end;
                  end;
               end;
            end;
            if bViraAno then dVenctoVira := dVencto;

            // Grava Registro de Saldo Inicial antes de fazer a Amortização
            if (bViraAno = True) or (iParc = 1) then begin
               if not qryParcTemp.Locate('IDCONDPAGIMOVEL;FLGTIPOLANC;DATAVENCIMENTO',VarArrayOf([iCondPag,1,dVencto]),[]) then begin
                  qryParcTemp.Insert;
                  qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat  := LeUltRegistro(nil,'PARCFINANCIMOV');
                  qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat  := TpCondPag.fIDContratoImovel;
                  qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat   := TpCondPag.fIDCondInicial;
                  qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger     := 1;
                  qryParcTemp.FieldByName('NUMPARCELA').AsInteger      := 0;
                  qryParcTemp.FieldByName('FATORCORRECAO').AsFloat     := 1;
               end else begin
                  qryParcTemp.Edit;
               end;
               if iParc = 1 then begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := TpCondPag.dDataAssinatura;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := TpCondPag.fSaldoDev;
               end else begin
                  qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
                  qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat   := fSaldoDev;
               end;

               qryParcTemp.Post;
            end;

            // Verifica se a Parcela já existe. Se não existir, cria uma.
            if not qryParcTemp.Locate('IDCONDPAGIMOVEL;NUMPARCELA',VarArrayOf([iCondPag,iParc]),[]) then begin
               qryParcTemp.Append;
               qryParcTemp.FieldByName('IDPARCFINANCIMOV').asFloat := LeUltRegistro(nil,'PARCFINANCIMOV');
               qryParcTemp.FieldByName('IDCONTRATOIMOVEL').asFloat := TpCondPag.fIDContratoImovel;
               qryParcTemp.FieldByName('IDCONDPAGIMOVEL').asFloat  := TpCondPag.fIDCondInicial;
               qryParcTemp.FieldByName('NUMPARCELA').asFloat := iParc;
               qryParcTemp.FieldByName('FLGLANCINTEGRA').asInteger := 0;
               qryParcTemp.FieldByName('CODDOCUMENTO').Clear;
               qryParcTemp.FieldByName('PLNCODIGO').Clear;
               qryParcTemp.FieldByName('FLGCONCILIADO').Clear;
            end else begin
               qryParcTemp.Edit;
            end;
            // Zera valores que serão recalculados
            if qryParcTemp.FieldByName('CODDOCUMENTO').IsNull then begin
                qryParcTemp.FieldByName('VLRCORRSALDO').Clear;
                qryParcTemp.FieldByName('VLRPRESTATUALIZADA').Clear;
                qryParcTemp.FieldByName('VLRRESIDUOATUALI').Clear;
            end;

            // Se o calculo for projetado na origem, utiliza o informado no contrato, senão...
            // Calculo do Fator de Correção até a data base pelo real e depois pelo projetado
            // se o mes de vencto da parcela for o mesmo da anterior, mantém o fator da parcela
            // anterior, pois ambas pertencem ao mesmo mês, e não calcula pro-rata.
            fFatorMes := 1;
            bExisteCotacaoMes := True;
            
            iMesCorrAtu := FormatDateTime('MM',dVencto) + FormatDateTime('YYYY',dVencto);
            if iMesCorrAtu <> iMesCorrAnt then begin
               if dIniFator > dVencto then dIniFator := dVencto;

               // Verifica se a cotação do mes já foi cadastrada
               if TpCondPag.iMesRefReajuste = 0 then begin
                  DecodeDate( dVencto, Ano, Mes, Dia );
               end else begin
                  DecodeDate( DiasUteis.SomaMeses(dVencto, (TpCondPag.iMesRefReajuste * -1) ), Ano, Mes, Dia );
               end;
               with dtmImobiliario.qryCotacoesIntervalo do begin
                  LimpaParametros(dtmimobiliario.qryCotacoesIntervalo);
                  ParamByName('INDICE').AsInteger   := TpCondPag.iIDIndCorr;
                  ParamByName('ANOMESINI').AsString := IntToStrZeroPad(Ano, 4) + IntToStrZeroPad(Mes, 2);
                  Open;
                  bExisteCotacaoMes := not dtmImobiliario.qryCotacoesIntervalo.IsEmpty;
               end;

               // Teste para a VALIA - O Fator anterior não buscava pro-rata
               if Sistema.TipoCliente = 20041 then begin

                  DecodeDate(dVencto, ano, mes, dia);
                  dFimFator := DiasUteis.UltDiaMes(ano, mes);

                  if (TpCondPag.dDataVencimento <= dDatabase) and (bExisteCotacaoMes) then begin
                     if TpCondPag.iIDIndCorr > 0 then begin
                        fFatorMes := ComunsImobiliarioDB.FatorCorrecao(TpCondPag.iIDIndCorr,
                                                                       dIniFator, dFimFator,
                                                                       False, TpCondPag.iMesRefReajuste, True);
                     end;
                  end else begin
                     if TpCondPag.iIDIndProj > 0 then begin
                        fFatorMes := ComunsImobiliarioDB.FatorCorrecao(TpCondPag.iIDIndProj,
                                                                       dIniFator, dFimFator,
                                                                       False, TpCondPag.iMesRefReajuste, True);
                     end else if TpCondPag.fCorrecaoProj > 0 then begin
                        fFatorMes := 1 + TpCondPag.fCorrecaoProj;
                     end;
                  end;

               end else begin

                  if (TpCondPag.dDataVencimento <= dDatabase) and (bExisteCotacaoMes) then begin
                     if TpCondPag.iIDIndCorr > 0 then begin
                        if TpCondPag.iMesRefReajuste = 0 then
                             fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                                dIniFator, dVencto, True)
                        else fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndCorr,
                                                                           DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                           DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True);
                     end;
                  end else begin
                     if TpCondPag.iIDIndProj > 0 then begin
                        if TpCondPag.iMesRefReajuste = 0 then
                             fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                                dIniFator, dVencto, True)
                        else fFatorMes := dtmFinanciamento.CalculaFatorCorrecao(TpCondPag.iIDIndProj,
                                                                           DiasUteis.SomaMeses(dIniFator, (TpCondPag.iMesRefReajuste * -1) ),
                                                                           DiasUteis.SomaMeses(dVencto,   (TpCondPag.iMesRefReajuste * -1) ), True);
                     end else if TpCondPag.fCorrecaoProj > 0 then begin
                        fFatorMes := 1 + TpCondPag.fCorrecaoProj;
                     end;
                  end;

               end;

               fFator := fFator * fFatorMes;
               iMesCorrAnt := iMesCorrAtu;
            end;

            // verifica o tipo de parcela ( 2 - Sinal, 3 - Parc Gerada, 4 - Parc Projetada
            //                              7 - Venda a Vista, 8 - Caução )
            if TpCondPag.sTipoCondPag = 'S' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 2;
            end;
            if TpCondPag.sTipoCondPag = 'V' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 7;
            end;
            if TpCondPag.sTipoCondPag = 'C' then begin
               qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 8;
            end;

            // Altera o Tipo de Parcela Projetada ou Gerada, apenas se a mesma não foi antecipada
            // e o indice de reajuste já foi cadastrado no global
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger <> 9 then begin
               if (TpCondPag.sTipoCondPag = 'P') or
                  (TpCondPag.sTipoCondPag = 'R') then begin
                  if (TpCondPag.iIDIndCorr = 0) and
                     (TpCondPag.iIDIndProj = 0) then begin
                      qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3;
                  end else begin
                     iMesHoje := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dDataBase)) + FormatFloat('00',DiasInUteis.ExtraiMes(dDataBase)));
                     iMesVenc := StrToInt(IntToStr(DiasInUteis.ExtraiAno(dVencto))   + FormatFloat('00',DiasInUteis.ExtraiMes(dVencto)));

                     // Só muda o status se existir a cotação do mes de processamento
                     if (iMesVenc <= iMesHoje) and (bExisteCotacaoMes) then begin
                        qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 3;
                     end else begin
                        qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger := 4;
                     end;
                  end;
               end;
            end;

            // Grava o default para o Saldo devedor atual
            qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat := fSaldoDev;

            // Altera o saldo devedor atual antes de calcular a parc. para os com correção mensal

            // Efetua o prorata na correção da assinatura para o 1 vencto
            if iParc = 1 then begin
               if TpCondPag.dUltVenctoComposto > 0 then begin
                  if TpCondPag.dUltVenctoComposto <> TpCondPag.dDataVencimento then
                     fFatorMes := ComunsImobiliario.ProRata((fFatorMes-1), TpCondPag.dUltVenctoComposto, TpCondPag.dDataVencimento) + 1;
               end else begin
                  if TpCondPag.dDataAssinatura <> TpCondPag.dDataVencimento then
                     fFatorMes := ComunsImobiliario.ProRata((fFatorMes-1), TpCondPag.dDataAssinatura, TpCondPag.dDataVencimento) + 1;
               end;
            end;
            fResiduoAcum := (fSaldoDev * fFatorMes) - fSaldoDev;
            fSaldoDev    := (fSaldoDev * fFatorMes);

            fCorrecaoParc := (fPrestacao * fFatorMes) - fPrestacao;

            qryParcTemp.FieldByName('FATORCORRECAO').AsFloat := fFatorMes;
            qryParcTemp.FieldByName('VLRRESIDUO').Clear;
            qryParcTemp.FieldByName('VLRCORRSALDO').asFloat  := fResiduoAcum;

            // Define a taxa de juros a ser aplicada, APENAS SE A PRÓXIMA PARCELA NÃO FOR ANTECIPADA
            if bAntecipaProx then begin
               fTaxaJuros := 0;
            end else begin
               // Calcula a Taxa de Juros Pro-Rata para a primeira parcela
               if (iParc = 1) and
                  (DiasUteis.ExtraiDia(TpCondPag.dDataAssinatura) <> DiasUteis.ExtraiDia(TpCondPag.dDataVencimento)) and
                  ( (TpCondPag.bJurosCarencia) or ((TpCondPag.iFormaCalculo <> 8) and (TpCondPag.iFormaCalculo <> 12)) ) then begin
                  fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                          TpCondPag.dDataAssinatura,
                                                          TpCondPag.dDataVencimento,
                                                          TpCondPag.iPeriodoMeses);
               end else begin
                  fTaxaJuros := TpCondPag.fTaxaJurosAjust;
               end;

               // Calcula a Taxa de Juros Pro-Rata para parcelas antecipadas e
               //   proxima parcela pós antecipação
               if ((qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and
                   (qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime <> dVenctoAnt)) or
                   (bAntecipaAnt) then begin
                   if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then begin
                      fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                              dVenctoAnt,
                                                              qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                              TpCondPag.iPeriodoMeses);
                   end else begin
                      fTaxaJuros := ComunsImobiliario.ProRata(TpCondPag.fTaxaJurosAjust,
                                                              dVenctoAnt,
                                                              dVencto,
                                                              TpCondPag.iPeriodoMeses);
                   end;
               end;

               fTaxaJurosAcum := ((fTaxaJurosAcum + 1) * (fTaxaJuros + 1)) -1;

               // VINICIUS - ACERTO FUNCEF - CONTRATO MAGNOLIA
               if (TpCondPag.iNumParcelas <> TpCondPagAnt.iNumParcelas) and
                  (iCondPag = 1864) and (iParc > 16) then fTaxaJurosAcum := 0;

            end;

            // Grava os valores da parcela (valor, vencto, juros, amortizacao e saldo devedor)
            // SOMENTE PARA AS PARCELAS AINDA NAO INTEGRADAS
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then begin
               // Se a anterior também foi antecipada, mantem o saldo devedor da anterior
               //    para efeito de calculo do juros por antecipação
               if not bAntecipaProx then fSaldoDevAntec := fSaldoDev;

               // Calcula o juros pró-rata por antecipação
               fVlrJurosAntec := CalcAntecipacao(TpCondPag.iFormaCalculo,iCondPag,iParc,
                                                 qryParcTemp.FieldByName('DATAVENCIMENTO').AsDateTime, dVenctoAnt,
                                                 fSaldoDevAntec, fPrestacao, (fSaldoDev * TpCondPag.fTaxaJurosAjust),
                                                 fTaxaJuros, bAntecipaProx);

               dVencto := qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime;
            end else begin
               qryParcTemp.FieldByName('DATAVENCIMENTO').asDateTime := dVencto;
            end;

            qryParcTemp.FieldByName('VLRJUROS').asFloat := ComunsImobiliario.Arredonda((fSaldoDev * TpCondPag.fTaxaJurosAjust),2);

            // Registra o valor da prestação, amortização e saldo devedor amortizado
            qryParcTemp.FieldByName('VLRNOMINAL').asFloat       := ComunsImobiliario.Arredonda(fPrestacao,2);
            qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat   := ComunsImobiliario.Arredonda(fPrestacao - qryParcTemp.FieldByName('VLRJUROS').asFloat,2);
            qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat  := ComunsImobiliario.Arredonda(fSaldoDev - qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat,2);
            qryParcTemp.FieldByName('VLRSALDOATUAL').AsFloat := fSaldoDev;
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9 then   // antecipação
                 qryParcTemp.FieldByName('VLRPRESTACAO').asFloat  := qryParcTemp.FieldByName('VLRAMORTIZACAO').asFloat
            else qryParcTemp.FieldByName('VLRPRESTACAO').asFloat  := ComunsImobiliario.Arredonda(fPrestacao,2);

            // Ajusta o saldo devedor final
            if qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat < 0.5 then begin
               qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat := 0;
            end;

            qryParcTemp.FieldByName('FATORCORRECAO').AsFloat := fFatorMes;

            // grava o ID do indice de correção na parcela
            if qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger in [3,9] then begin
               if TpCondPag.iIDIndCorr = 0 then begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').Clear;
               end else begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').AsInteger := TpCondPag.iIDIndCorr;
               end;
            end else begin
               if TpCondPag.iIDIndProj = 0 then begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').Clear;
               end else begin
                  qryParcTemp.FieldByName('IDINDCORRECAO').AsInteger := TpCondPag.iIDIndProj;
               end;
            end;

            fSaldoDev := qryParcTemp.FieldByName('VLRSALDODEVEDOR').asFloat;
            Result    := Result + qryParcTemp.FieldByName('VLRPRESTACAO').asFloat;

            qryParcTemp.Post;

         end;

         // Incrementa a parcela de juros cobrada no período de Carencia
         if (TpCondPag.bJurosCarencia) and (dVencto < TpCondPag.dDataIniAmortiz) then
            Inc(iParcCarencia);

         // Verifica se houve AMORTIZAÇÃO EXTRA
         DecodeDate(dVencto,ano,mes,dia);
         bTemAmortiz := VerifAmortiz(iCondPag, fSaldoDev, mes, ano, rSaldoAmortiz, rPercAmortiz);

         // Se teve amortização extra, ajustar aqui o fPrestação
         if bTemAmortiz then begin
            fSaldoDev    := rSaldoAmortiz;
            fPrestacao   := fPrestacao * rPercAmortiz;
            fAmortizacao := fPrestacao;
            fNominal     := fPrestacao;
         end;

         FrmAguarde.Pos := prg;
         Application.ProcessMessages;
         Inc(Prg);

         // Testa se a parcela corrente foi Antecipada e a proxima será antecipada para ajuste do prox. vencto.
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) and (bAntecipaProx) then
              bAntecipa := True
         else bAntecipa := False;

         // Testa se a parcela corrente foi Antecipada
         if (qryParcTemp.FieldByName('FLGTIPOLANC').AsInteger = 9) then
              bAntecipaAnt := True
         else bAntecipaAnt := False;


         iMeses := DiasUteis.IntervaloMeses(dVenctoVira,dVencto);
         if (iMeses >= 11) or (TpCondPag.sPrazo = 'A') or
            ( (TpCondPag.iPeriodo > 1) and (iMeses + TpCondPag.iPeriodo > 11) ) then begin
            bViraAno := True;
            iParcFim := iParc;
         end else begin
            bViraAno := False;
         end;

         // Inicia nova condição repactuada após o término das parcelas da cond. inicial
         if iParc = (TpCondPag.iNumParcelas + iParcCarencia + iParcExtra) then begin
            with dtmFinanciamento do begin
               sSql := 'SELECT *  '+#13+
                       '  FROM CONDPAGIMOVEL  '+#13+
                       ' WHERE IDCONDINICIAL = ' + FloatToStr(TpCondPag.fIDCondInicial) +#13+
                       '   AND TIPOCONDPAG = ''R''  '+#13+
                       '   AND DATAINI > TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY',dVencto))+',''DD/MM/YYYY'') ' +#13+
                       ' ORDER BY DATAINI ';
               if FazQuery(qryAux, sSql) then begin
                  if not qryAux.IsEmpty then begin
                     // Determina o nr. de parcelas extras e a nova data de vencimento
                     if TpCondPag.sPrazo = 'M' then
                          dVencto := DiasInUteis.SomaMeses(qryAux.FieldByName('DATAVENCIMENTO').AsDateTime,TpCondPag.iPeriodo *  -1)
                     else dVencto := DiasInUteis.SomaMeses(qryAux.FieldByName('DATAVENCIMENTO').AsDateTime,TpCondPag.iPeriodo * -12);

                     // Verifica o novo saldo devedor
                     if qryAux.FieldByName('VLRFINANC').AsInteger > 0 then
                        fSaldoDev := qryAux.FieldByName('VLRFINANC').AsFloat;

                     iParcExtra   := iParcExtra + qryAux.FieldByName('NUMPARCELAS').AsInteger;
                     iParcEncerra := iParcEncerra + TpCondPag.iNumParcelas;
                  end;
               end;
            end;
         end;

      end;
   finally;
      qryParcTemp.EnableControls;
      FrmAguarde.Apaga;
   end;
   qryParcTemp.First;
end;

end.

