unit UTypesEmptmo;

{
------------------------------------------------------------------------------------------------------------
Nº                : WO18350
Data da Alteração : 22/01/2025
Responsável       : Luis Ferrari
Descrição         : Ajuste para parcelas e encargos manuais.
Rotina de calculo : CalculoAtualizacao
------------------------------------------------------------------------------------------------------------
}


interface

uses
   DBTables, Db, Wwquery;

type
   TSaldoDevAnt = Record
      fSaldoDevAnt   : Currency;
      fTxJurosAnt    : Currency;
      iParcelaAnt    : Integer;
      iParcRestaAnt  : Integer;
      dDataAtuAnt    : TDateTime;
   end;

   TSaldosAntPos = Record
      fSaldoDevAnt   : Currency;
      fTxJurosAnt    : Currency;
      iParcelaAnt    : Integer;
      iParcRestaAnt  : Integer;
      dDataAtuAnt    : TDateTime;
      fSaldoDevPos   : Currency;
      fTxJurosPos    : Currency;
      iParcelaPos    : Integer;
      iParcRestaPos  : Integer;
      dDataAtuPos    : TDateTime;
   end;

// -------------------------------------------------------------------------------------------------

   TItemRecDep = Record
      IdHistMovEmptmo   : Int64;
      CodigoItem        : Int64;
      Regra             : Int64;
      Rubrica           : Int64;
      iEvento           : Integer;
      FlgEnvio          : Integer;
      FlgBaixado        : Integer;
      Nome              : String;
      RecPag            : String;
      FormaCobranca     : String;
      Parcela           : Integer;
      Origem            : Integer;
      Prioridade        : Integer;
      SeqCalculo        : Integer;
      SeqCobranca       : Integer;
      FlgCentraliza     : Integer;
      FlgDivergPend     : Integer;
      IdItemCentraliza  : Integer;
      AnoCompetencia    : Integer;
      MesCompetencia    : Integer;
      AnoCobranca       : Integer;
      MesCobranca       : Integer;
      DataPrevista      : TDateTime;
      DataVencto        : TdateTime;        // WO18350 Ferrari
      DataEfetiva       : TDateTime;
      DataUltAtualiza   : TDateTime;
      Valor             : Currency;
      SaldoDevedor      : Currency;
      TxJuros           : Currency;
      TxJurosAnt        : Currency;
      ParcResta         : Integer;
      FlgDestacado      : Integer;
      ValorEfetivo      : Currency;
      FlgTipoDiverg     : Integer;
   end;

// -------------------------------------------------------------------------------------------------

   TListaItem = array of TItemRecDep;

// -------------------------------------------------------------------------------------------------

   TListadasListas = array of TListaItem;

// -------------------------------------------------------------------------------------------------

   TDadosContrato = Record
      IDContratoEmptmo  : Int64;
      IDContrQuitacao   : Int64;
      IDInscricaoEmptmo : Int64;

      IDTipoEmptmo      : Int64;
      IDTipoContrEmptmo : Int64;

      IDPessoa          : Int64;
      IDBenef           : Int64;
      IDSitPart         : Int64;
      IDPlanoPrev       : Int64;
      IDPatro           : Int64;

      NumParcelas       : Int64;

      fValMargem        : Currency;
      fValReserva       : Currency;

      fSalParticipacao  : Currency;
      fSalMantido       : Currency;
      fSalAuxDoenca     : Currency;
      fSalBenef         : Currency;

      VlrSalBase        : Currency;
      VlrMargem         : Currency;
      VlrMaxPermit      : Currency;

      DataInscricao     : TDateTime;
      DataAssinatura    : TDateTime;
      DataCredito       : TDateTime;
      DataPrimParc      : TDateTime;
      DataCanc          : TDateTime;
      DataValidade      : TDateTime;
      DataSaldoDev      : TDateTime;
      DataPendencia     : TDateTime;
      DataSituacao      : TDateTime;

      TxJuros           : Currency;
      VlrContrato       : Currency;
      VlrParcela        : Currency;
      VlrParcelaMes     : Currency;
      VlrParcelaAtraso  : Currency;
      VlrDebito         : Currency;
      VlrReserva        : Currency;
      VlrSaldoDev       : Currency;
      VlrPendencia      : Currency;

      IDVerba           : Int64;
      IDCBancaria       : Int64;

      CodFormaPag       : Int64;
      PortFormaPag      : Int64;
      PortFormaRec      : Int64;

      Indexador         : Int64;
      SiglaIndexador    : String;

      FlgFormaRec       : String;
      FlgFormaPag       : String;

      FlgSituacao       : String;
      FlgSuspensaoAuto  : Integer;

      IDTipoSuspEmptmo  : Int64;
      DataInicioSusp    : TDateTime;
      DataFimSusp       : TDateTime;
   end;

// -------------------------------------------------------------------------------------------------

   TParamIntegra = Record
      iHistorico           : Int64;       (*                      |     HistMovEmptmo *)
      iContrato            : Int64;       (*                      |     ContratoEmptmo *)
      iTipoContrato        : Int64;       (*                      |     ContratoEmptmo *)
      iPlanoPrev           : Int64;       (*                      |     ContratoEmptmo *)
      iPatro               : Int64;       (*                      |     ContratoEmptmo *)
      iPessoa              : Int64;       (*                      |     ContratoEmptmo *)

      iCodPortForma        : Int64;       (* PortadorForma        |     ContratoEmptmo *)
      iCodForma            : Int64;       (* FormaRecPag          |     ContratoEmptmo
                                              usado na concessão                       *)

      iItem                : Int64;       (* item em questão      |     ItemXTipoContr *)

      iPlanPrevContab      : Int64;       (* Entidade contábil    |     ver lógica de busca *)

      iPlano               : Int64;       (* Plano de Contas      |     PlanoData *)
      sAnoMesCompetencia   : String;      (*                      |     HistMovEmptmo *)


      sContaDFolha         : String;      (*                      |     ParamIntegraEP *)
      sCentroCustoDFolha   : String;      (*                      |     ParamIntegraEP *)
      iSubContaDFolha      : Int64;       (*                      |     ParamIntegraEP *)
      sContaCFolha         : String;      (*                      |     ParamIntegraEP *)
      iSubContaCFolha      : Int64;       (*                      |     ParamIntegraEP *)
      sCentroCustoCFolha   : String;      (*                      |     ParamIntegraEP *)
      sContaDFinan         : String;      (*                      |     ParamIntegraEP *)
      sCentroCustoDFinan   : String;      (*                      |     ParamIntegraEP *)
      iSubContaDFinan      : Int64;       (*                      |     ParamIntegraEP *)
      sContaCFinan         : String;      (*                      |     ParamIntegraEP *)
      iSubContaCFinan      : Int64;       (*                      |     ParamIntegraEP *)
      sCentroCustoCFinan   : String;      (*                      |     ParamIntegraEP *)

      sContaContab         : String;      (* p/ LancaContab       |                    *)
      sCentroCustoContab   : String;      (* p/ LancaContab       |                    *)
      iSubContaContab      : Int64;       (* p/ LancaContab       |                    *)
      iExercicio           : Integer;     (* p/ LancaContab       |                    *)
      iPeriodo             : Integer;     (* p/ LancaContab       |                    *)

      sTipoPer             : String;      (* Grupo de Lançamento  |     ItemXTipoContr *)
      iTipoDoc             : Int64;       (* Tipo de Documento    |     ItemXTipoContr *)
      sRecPag              : String;      (*                      |     ItemXTipoContr *)
      sCCBaixa             : String;      (* Conta de baixa       |     ItemXTipoContr, flgCentraliza = 1 *)

      sTipoRecDesFolha     : String;      (*                      |     ParamIntegraEP *)
      sRecPagFolha         : String;      (*                      |     ParamIntegraEP *)
      sTipoRecDesFinan     : String;      (*                      |     ParamIntegraEP *)
      sRecPagFinan         : String;      (*                      |     ParamIntegraEP *)
      sFormaEnvio          : String;      (* C=CaP/CaR, F=Folha   |     HistMovEmptmo *)

      iUnidNegoc           : Int64;
      IDCBancaria          : Int64;

      sCentroRespon        : String;      (*                      |     ParamIntegraEP *)
      sDescricao           : String;      (* Descrição do Item    |           -        *)

      iMoeda               : Int64;       (* no momento, sempre moeda corrente *)
      fVlrLanc             : Currency;    (* valor do item *)

      dDataLanc            : TDateTime;   (* data do lançamento contábil *)
      dDataVenc            : TDateTime;   (* data de vencimento (data prevista) *)

      iPlanilha            : Int64;       (* resultado *)
      iDocumento           : Int64;       (* resultado *)
      iRateioDocum         : Extended;    (* resultado *)
      iLanctoDocum         : Int64;       (* resultado *)

      bEmisBloq            : Boolean;
      sDebCre              : String;      (* Débito ou Crédito *)
      fNumDocumento        : Extended;    (* nº do documento *)
   end;

// -------------------------------------------------------------------------------------------------

   (* Status do envio.  especifica se o mesmo ja foi processado, baixado, esta com erro, .... *)
   TStatusEnvio = (sDocCobrEmit, sDocParcReceb, sDocError, sFolhaProc, sFolhaError);

   (* A Forma de envio, Documento ou Folha *)
   TFormaEnvio  = (fCapCar, fFolha);

// -------------------------------------------------------------------------------------------------

   TDadosTmpDesc = Record
      IdPessoa          : Int64;
      IdTitular         : Int64;
      IdPessjur         : Int64;
      IdPlanoprev       : Int64;
      IdLote            : Int64;
      IdProvento        : Int64;
      IdDesconto        : Int64;
      IdEmpresa         : Int64;
      IdEmpresaProp     : Int64;
      IdMotivo          : Int64;
      CodAlterador      : Integer;
      CodPortForma      : Integer;
      CodTipDoc         : Integer;
      Exercicio         : Integer;
      NoDocumento       : Integer;
      NumPrioridade     : Integer;
      Ordem             : Integer;
      Periodo           : Integer;
      Plano             : Integer;
      PlnCodigoPrev     : Integer;
      UnidNegoc         : Integer;
      FlgDesconto       : Integer;
      InscricaoNumero   : Integer;
      FlgAtrasoDevol    : String;
      FlgDescFolha      : String;
      FlgTipoDesc       : String;
      RecPag            : String;
      SitEnvio          : String;
      CodCentroCustoC   : String;
      CodCentroCustoD   : String;
      CodCentroRespon   : String;
      Matricula         : String;
      CodTipRecDes      : String;
      PlaContaD         : String;
      PlaContaC         : String;
      TipCodigo         : String;
      ComplDocumento    : String;
      MesCobranca       : String;
      MesReferencia     : String;
      Referencia        : String;
      CodProvDesc       : String;
      Descricao         : String;
      DataReferencia    : TDateTime;
      DataCobranca      : TDateTime;
      Valor             : Currency;
      ValorInfo         : Currency;
      Parcela           : Integer;
      NumParcelas       : Integer;
   end;

// -------------------------------------------------------------------------------------------------

   TPatro = record
      IDPatro     : Int64;
      NomePatro   : String;
      FlgMarcado  : Boolean;
   end;

   TPlano = record
      IDPlano     : Int64;
      NomePlano   : String;
      FlgMarcado  : Boolean;
   end;

// -------------------------------------------------------------------------------------------------

   TResultFunction = Record
      Resultado : Boolean;
      Mensagem  : String;
      Valor     : Double;
   end;

   TSitPart = Record
      IDSitPart   : Int64;
      flgInterno  : String;
   end;

// -------------------------------------------------------------------------------------------------

   TContratoXBenefSeg = Record
      IDInscricaoEmptmo : Int64;
      IDBenefSeguro     : Int64;
      PercIndenizacao   : Real;
   end;

   TListaContratoXBenefSeg = array of TContratoXBenefSeg;

// -------------------------------------------------------------------------------------------------

   procedure LimpaRegistro(var Registro: TItemRecDep);
   procedure LimpaRegistroContratoXBenefSeg(var Registro: TContratoXBenefSeg);

   procedure LimpaRegistroContrato(var Registro: TDadosContrato);
   procedure PreencheDadosContrato(const qryContrato      : TwwQuery;
                                   var   rDadosContrato   : TDadosContrato);

// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------

const
   CRLF = #13+#10;

implementation


procedure LimpaRegistroContratoXBenefSeg(var Registro: TContratoXBenefSeg);
begin
   with Registro do begin
      IDInscricaoEmptmo := -1;
      IDBenefSeguro     := -1;
      PercIndenizacao   := 0;
   end;
end;


procedure LimpaRegistro(var Registro: TItemRecDep);
begin
   with Registro do begin
      Nome              := '';
      RecPag            := '';
      FormaCobranca     := '';
      CodigoItem        := -1;
      Regra             := -1;
      Rubrica           := -1;
      iEvento           := -1;
      FlgEnvio          := -1;
      Parcela           := -1;
      Origem            := -1;
      Prioridade        := -1;
      SeqCobranca       := -1;
      FlgCentraliza     := -1;
      IdItemCentraliza  := -1;
      AnoCompetencia    := -1;
      MesCompetencia    := -1;
      AnoCobranca       := -1;
      MesCobranca       := -1;
      Valor             := 0;
      SaldoDevedor      := 0;
      TxJuros           := 0;
      DataPrevista      := 0;
      DataVencto        := 0;                   // WO18350 Ferrari
      DataUltAtualiza   := 0;
      DataEfetiva       := 0;
      ValorEfetivo      := 0;
   end;(* with *)
end;



procedure LimpaRegistroContrato(var Registro: TDadosContrato);
begin
   with Registro do begin
      IDContratoEmptmo  := -1;
      IDContrQuitacao   := -1;
      IDPessoa          := -1;
      IDTipoContrEmptmo := -1;
      IDPlanoPrev       := -1;
      IDPatro           := -1;
      IDInscricaoEmptmo := -1;
      IDVerba           := -1;
      IDBenef           := -1;
      IDCBancaria       := -1;
      CodFormaPag       := -1;
      PortFormaPag      := -1;
      PortFormaRec      := -1;
      NumParcelas       := -1;
      DataCredito       := -1;
      DataInscricao     := -1;
      DataSituacao      := -1;
      DataAssinatura    := -1;
      DataValidade      := -1;
      DataPrimParc      := -1;
      DataCanc          := -1;
      Indexador         := -1;
      VlrContrato       := 0;
      VlrParcela        := 0;
      TxJuros           := 0;
      VlrSalBase        := 0;
      VlrMargem         := 0;
      VlrMaxPermit      := 0;

      FlgSituacao       := '';
      FlgFormaRec       := '';
      FlgFormaPag       := '';
      FlgSuspensaoAuto  := 0;

      IDTipoSuspEmptmo  := -1;
      DataInicioSusp    := 0;
      DataFimSusp       := 0;
   end; (* with *)
end;



//--------------------------------------------------------------------------------------------------
//    PreencheDadosContrato: procedimento que preenche um registro com os dados relevantes de um
//                           Contrato de Empréstimo
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       qryContrato    : qry cujos campos devem ser usados
//       rDadosContrato : registro que precisa ser preenchido
//
//--------------------------------------------------------------------------------------------------
procedure PreencheDadosContrato(const qryContrato      : TwwQuery;
                                var   rDadosContrato   : TDadosContrato);
begin
   LimpaRegistroContrato(rDadosContrato);

   rDadosContrato.IDContratoEmptmo  := qryContrato.FieldByName('IDCONTRATOEMPTMO').AsInteger;
   (* É nulo na Concessão *)
   rDadosContrato.IDContrQuitacao   := -1;

   rDadosContrato.IdPessoa          := qryContrato.FieldByName('IDPESSOA').AsInteger;
   rDadosContrato.IDTipoContrEmptmo := qryContrato.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
   rDadosContrato.IDTipoEmptmo      := qryContrato.FieldByName('IDTIPOEMPTMO').AsInteger;
   rDadosContrato.IdPlanoPrev       := qryContrato.FieldByName('IDPLANOPREV').AsInteger;
   rDadosContrato.IdPatro           := qryContrato.FieldByName('IDPATRO').AsInteger;

   (* Número da Inscrição *)
   rDadosContrato.IDInscricaoEmptmo := qryContrato.FieldByName('IDINSCRICAOEMPTMO').AsInteger;

   (* É nulo *)
   rDadosContrato.IDVerba := -1;

   (* Beneficiário do Contrato
      IDBENEF = IDPESSOA -> do Titular no caso de estar vivo e do Beneficiário no caso de Pensionista *)
   rDadosContrato.IdBenef := qryContrato.FieldByName('IDBENEF').AsInteger;

   if qryContrato.FieldByName('FLGFORMAPAG').AsString = 'C' then begin
      rDadosContrato.IDCBancaria := qryContrato.FieldByName('IDCBANCARIA').AsInteger;
   end else begin
      (* É nulo *)
      rDadosContrato.IDCBancaria := -1;
   end;

   if qryContrato.FieldByName('CODFORMAPAG').AsString <> '' then begin
      rDadosContrato.CodFormaPag  := qryContrato.FieldByName('CODFORMAPAG').AsInteger;
   end else begin
      rDadosContrato.CodFormaPag  := -1;
   end;

   if qryContrato.FieldByName('PORTFORMAPAG').AsString <> '' then begin
      rDadosContrato.PortFormaPag := qryContrato.FieldByName('PORTFORMAPAG').AsInteger;
   end else begin
      rDadosContrato.PortFormaPag := -1;
   end;

   if qryContrato.FieldByName('PORTFORMAREC').AsString <> '' then begin
      rDadosContrato.PortFormaRec := qryContrato.FieldByName('PORTFORMAREC').AsInteger;
   end else begin
      rDadosContrato.PortFormaRec := -1;
   end;

   rDadosContrato.Indexador      := qryContrato.FieldByName('MOECODIGO').AsInteger;
   rDadosContrato.SiglaIndexador := qryContrato.FieldByName('MOESIGLA').AsString;

   rDadosContrato.NumParcelas    := qryContrato.FieldByName('NUMPARCELAS').AsInteger;
   rDadosContrato.DataCredito    := qryContrato.FieldByName('DATACREDITO').AsDateTime;
   rDadosContrato.DataSituacao   := qryContrato.FieldByName('DATASITUACAO').AsDateTime;
   rDadosContrato.DataAssinatura := qryContrato.FieldByName('DATAASSINATURA').AsDateTime;
   rDadosContrato.DataPrimParc   := qryContrato.FieldByName('DATAPRIMPARC').AsDateTime;
   rDadosContrato.DataInscricao  := qryContrato.FieldByName('DATAINSC').AsDateTime;

   (* Data nula *)
   rDadosContrato.DataCanc :=  -1;

   rDadosContrato.VlrContrato := qryContrato.FieldByName('VLRCONTRATO').AsCurrency;
   rDadosContrato.VlrParcela  := qryContrato.FieldByName('VLRPARCELA').AsCurrency;
   rDadosContrato.Txjuros     := qryContrato.FieldByName('TXJUROS').AsFloat;
   rDadosContrato.FlgSituacao := qryContrato.FieldByName('FLGSITUACAO').AsString;

   if qryContrato.FieldByName('VLRSALBASE').AsString <> '' then begin
      rDadosContrato.VlrSalBase := qryContrato.FieldByName('VLRSALBASE').AsCurrency;
   end else begin
      rDadosContrato.VlrSalBase := 0;
   end;

   if qryContrato.FieldByName('VLRMARGEM').AsString <> '' then begin
      rDadosContrato.VlrMargem := qryContrato.FieldByName('VLRMARGEM').AsCurrency;
   end else begin
      rDadosContrato.VlrMargem := 0;
   end;

   if qryContrato.FieldByName('VLRMAXPERMIT').AsString <> '' then begin
      rDadosContrato.VlrMaxPermit := qryContrato.FieldByName('VLRMAXPERMIT').AsCurrency;
   end else begin
      rDadosContrato.VlrMaxPermit := 0;
   end;

   (* FLGFORMAREC = C -> indicando que o Débito é pelo Contas a Receber
                    F -> indicando que o Débito é pela Folha *)
   rDadosContrato.flgFormaRec := qryContrato.FieldByName('FLGFORMAREC').AsString;

   (* FLGFORMAPAG = C -> indicando que o Crédito é pelo Contas a Pagar
                    F -> indicando que o Crédito é pela Folha *)
   rDadosContrato.flgFormaPag := qryContrato.FieldByName('FLGFORMAPAG').AsString;

   rDadosContrato.IDTipoSuspEmptmo  := qryContrato.FieldByName('IDTIPOSUSPEMPTMO').AsInteger;
   rDadosContrato.DataInicioSusp    := qryContrato.FieldByName('DATAINICIOSUSP').AsDateTime;
   rDadosContrato.DataFimSusp       := qryContrato.FieldByName('DATAFIMSUSP').AsDateTime;

end;



end.
