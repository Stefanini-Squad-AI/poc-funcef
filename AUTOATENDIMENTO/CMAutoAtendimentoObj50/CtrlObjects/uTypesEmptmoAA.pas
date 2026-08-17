unit uTypesEmptmoAA;

interface

uses
   DBTables, Db, Wwquery, uCMClientDataSet;

type

   TDadosConcessao = Record
      IDContratoEmptmo  : Extended;
      ValorSolic        : Currency;
      DataCredito       : TDateTime;
      Prazo             : Integer;
      SaldoQuitacao     : Currency;
   end;

   TSaldoDevAnt = Record
      fSaldoDevAnt   : Currency;
      fTxJurosAnt    : Currency;
      iParcelaAnt    : Integer;
      iParcelaAltAnt : Integer;
      iParcRestaAnt  : Integer;
      dDataAtuAnt    : TDateTime;
   end;

   TSaldosAntPos = Record
      fSaldoDevAnt   : Currency;
      fTxJurosAnt    : Currency;
      iParcelaAnt    : Integer;
      iParcelaAltAnt : Integer;
      iParcRestaAnt  : Integer;
      dDataAtuAnt    : TDateTime;
      fSaldoDevPos   : Currency;
      fTxJurosPos    : Currency;
      iParcelaPos    : Integer;
      iParcelaAltPos : Integer;
      iParcRestaPos  : Integer;
      dDataAtuPos    : TDateTime;
   end;

// -------------------------------------------------------------------------------------------------

   TItemRecDep = Record
      IDHistMovEmptmo   : Extended;
      CodigoItem        : Int64;
      Nome              : String;

      FlgCentraliza     : Integer;
      FlgDestacado      : Integer;
      IDItemCentraliza  : Integer;

      iEvento           : Integer;
      SeqCalculo        : Integer;
      Origem            : Integer;
      SeqCobranca       : Integer;

      ParcelaAlt        : Integer;
      Parcela           : Integer;
      ParcResta         : Integer;

      Valor             : Currency;
      ValorEfetivo      : Currency;
      SaldoDevedor      : Currency;
      TxJuros           : Currency;
      TxJurosAnt        : Currency;
      ValorBase         : Currency;

      DataPrevista      : TDateTime;
      DataVencto        : TDateTime;
      DataEfetiva       : TDateTime;
      DataUltAtualiza   : TDateTime;
      DataReceb         : TDateTime;

      AnoCompetencia    : Integer;
      MesCompetencia    : Integer;
      AnoCobranca       : Integer;
      MesCobranca       : Integer;

      Regra             : Int64;

      RecPag            : String;
      FormaCobranca     : String;
      TipoFolha         : String;
      Rubrica           : Int64;

      FlgEnvio          : Integer;
      FlgBaixado        : Integer;

      FlgDivergPend     : Integer;
      FlgTipoDiverg     : Integer;
      FlgGravaZERO      : Boolean;

      Prioridade        : Integer;
   end;

// -------------------------------------------------------------------------------------------------

   TListaItem = array of TItemRecDep;

// -------------------------------------------------------------------------------------------------

   TListadasListas = array of TListaItem;

// -------------------------------------------------------------------------------------------------

   TDadosContrato = Record
      IDContratoEmptmo  : Extended;
      IDContrQuitacao   : Extended;
      IDInscricaoEmptmo : Extended;
      IDCodAutoEmp      : Extended;

      IDTipoEmptmo      : Int64;
      IDTipoContrEmptmo : Int64;

      IDPessoa          : Int64;
      IDBenef           : Int64;
      IDSitPart         : Int64;
      IDPlanoPrev       : Int64;
      IDPlanoOrigem     : Int64;
      IDPatro           : Int64;
      IDResponsavel     : Int64;

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
      IDCBancariaDeb    : Int64;
      IDFornCred        : Int64;

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
      AnoSuspensao      : Integer;
      MesSuspensao      : Integer;
      NumParcDesconto   : Integer;

      FlgExcepcional    : Integer;
      FlgFinanciamento  : Integer;

      IDPlanoCob        : Int64; //Pendência 26775 - 26/12/2007
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
      iRateioDocum         : Int64;       (* resultado *)
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

   TLogTotalPrev = Record
      IDLogTotalPrev : Int64;
      IDModulo       : Int64;
      IDContrato     : Extended;
      IDHistMov      : Extended;
      Origem         : Integer;
      IDUsuario      : Int64;
      Data           : TDateTime;
      DataIni        : TDateTime;
      DataFim        : TDateTime;
      Versao         : String;
      Operacao       : String
   end;

// -------------------------------------------------------------------------------------------------

   TContratoXBenefSeg = Record
      IDInscricaoEmptmo : extended;
      IDBenefSeguro     : Int64;
      PercIndenizacao   : Real;
   end;

   TListaContratoXBenefSeg = array of TContratoXBenefSeg;

// -------------------------------------------------------------------------------------------------

   procedure LimpaRegistro(var Registro: TItemRecDep);
   procedure LimpaRegistroContratoXBenefSeg(var Registro: TContratoXBenefSeg);

   procedure LimpaRegistroContrato(var Registro: TDadosContrato);
   procedure PreencheDadosContrato(const cdsContrato      : TCMClientDataSet;
                                   var   rDadosContrato   : TDadosContrato);

   procedure LimpaRegistroConcessao(var Registro : TDadosConcessao);

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
   with Registro do
   begin
      CodigoItem        := -1;
      Nome              := '';

      FlgCentraliza     := -1;
      FlgDestacado      := -1;
      IDItemCentraliza  := -1;

      iEvento           := -1;
      SeqCalculo        := -1;
      Origem            := -1;
      SeqCobranca       := -1;

      ParcelaAlt        := -1;
      Parcela           := -1;
      ParcResta         := -1;

      RecPag            := '';
      FormaCobranca     := '';
      Regra             := -1;
      Rubrica           := -1;
      FlgEnvio          := -1;
      Prioridade        := -1;
      AnoCompetencia    := -1;
      MesCompetencia    := -1;
      AnoCobranca       := -1;
      MesCobranca       := -1;
      Valor             := 0;
      SaldoDevedor      := 0;
      TxJuros           := 0;
      DataPrevista      := 0;
      DataVencto        := 0;
      DataUltAtualiza   := 0;
      DataEfetiva       := 0;
      ValorEfetivo      := 0;

   end;  // with
end;



procedure LimpaRegistroContrato(var Registro: TDadosContrato);
begin
   with Registro do
   begin
      IDContratoEmptmo  := -1;
      IDContrQuitacao   := -1;
      IDPessoa          := -1;
      IDTipoContrEmptmo := -1;
      IDPlanoPrev       := -1;
      IDPlanoOrigem     := -1;
      IDPatro           := -1;
      IDResponsavel     := -1;
      IDInscricaoEmptmo := -1;
      IDVerba           := -1;
      IDBenef           := -1;
      IDCBancaria       := -1;
      IDCBancariaDeb    := -1;
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
      AnoSuspensao      := 0;
      MesSuspensao      := 0;
      NumParcDesconto   := 0;

      FlgExcepcional    := 0;
      FlgFinanciamento  := 0;

      fValMargem        := 0;
      fValReserva       := 0;

   end;  // with Registro
end;


//--------------------------------------------------------------------------------------------------
//    PreencheDadosContrato: procedimento que preenche um registro com os dados relevantes de um
//                           Contrato de Empréstimo
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       cdsContrato    : cds cujos campos devem ser usados
//       rDadosContrato : registro que precisa ser preenchido
//
//--------------------------------------------------------------------------------------------------
procedure PreencheDadosContrato( const cdsContrato      : TCMClientDataSet;
                                 var   rDadosContrato   : TDadosContrato );
begin
   LimpaRegistroContrato(rDadosContrato);

   rDadosContrato.IDContratoEmptmo  := cdsContrato.FieldByName('IDCONTRATOEMPTMO').AsFloat;
   (* É nulo na Concessão *)
   rDadosContrato.IDContrQuitacao   := -1;

   rDadosContrato.IdPessoa          := cdsContrato.FieldByName('IDPESSOA').AsInteger;
   rDadosContrato.IDTipoContrEmptmo := cdsContrato.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
   rDadosContrato.IDTipoEmptmo      := cdsContrato.FieldByName('IDTIPOEMPTMO').AsInteger;
   rDadosContrato.IdPlanoPrev       := cdsContrato.FieldByName('IDPLANOPREV').AsInteger;
   rDadosContrato.IdPatro           := cdsContrato.FieldByName('IDPATRO').AsInteger;

   (* Número da Inscrição *)
   rDadosContrato.IDInscricaoEmptmo := cdsContrato.FieldByName('IDINSCRICAOEMPTMO').AsFloat;

   (* É nulo *)
   rDadosContrato.IDVerba := -1;

   (* Beneficiário do Contrato
      IDBENEF = IDPESSOA -> do Titular no caso de estar vivo e do Beneficiário no caso de Pensionista *)
   rDadosContrato.IdBenef := cdsContrato.FieldByName('IDBENEF').AsInteger;

   if cdsContrato.FieldByName('FLGFORMAPAG').AsString = 'C' then begin
      rDadosContrato.IDCBancaria := cdsContrato.FieldByName('IDCBANCARIA').AsInteger;
   end else begin
      (* É nulo *)
      rDadosContrato.IDCBancaria := -1;
   end;

   if cdsContrato.FieldByName('CODFORMAPAG').AsString <> '' then begin
      rDadosContrato.CodFormaPag  := cdsContrato.FieldByName('CODFORMAPAG').AsInteger;
   end else begin
      rDadosContrato.CodFormaPag  := -1;
   end;

   if cdsContrato.FieldByName('PORTFORMAPAG').AsString <> '' then begin
      rDadosContrato.PortFormaPag := cdsContrato.FieldByName('PORTFORMAPAG').AsInteger;
   end else begin
      rDadosContrato.PortFormaPag := -1;
   end;

   if cdsContrato.FieldByName('PORTFORMAREC').AsString <> '' then begin
      rDadosContrato.PortFormaRec := cdsContrato.FieldByName('PORTFORMAREC').AsInteger;
   end else begin
      rDadosContrato.PortFormaRec := -1;
   end;

   rDadosContrato.Indexador      := cdsContrato.FieldByName('MOECODIGO').AsInteger;
   rDadosContrato.SiglaIndexador := cdsContrato.FieldByName('MOESIGLA').AsString;

   rDadosContrato.NumParcelas    := cdsContrato.FieldByName('NUMPARCELAS').AsInteger;
   rDadosContrato.DataCredito    := cdsContrato.FieldByName('DATACREDITO').AsDateTime;
   rDadosContrato.DataSituacao   := cdsContrato.FieldByName('DATASITUACAO').AsDateTime;
   rDadosContrato.DataAssinatura := cdsContrato.FieldByName('DATAASSINATURA').AsDateTime;
   rDadosContrato.DataPrimParc   := cdsContrato.FieldByName('DATAPRIMPARC').AsDateTime;
   rDadosContrato.DataInscricao  := cdsContrato.FieldByName('DATAINSC').AsDateTime;

   (* Data nula *)
   rDadosContrato.DataCanc :=  -1;

   rDadosContrato.VlrContrato := cdsContrato.FieldByName('VLRCONTRATO').AsCurrency;
   rDadosContrato.VlrParcela  := cdsContrato.FieldByName('VLRPARCELA').AsCurrency;
   rDadosContrato.Txjuros     := cdsContrato.FieldByName('TXJUROS').AsFloat;
   rDadosContrato.FlgSituacao := cdsContrato.FieldByName('FLGSITUACAO').AsString;

   if cdsContrato.FieldByName('VLRSALBASE').AsString <> '' then begin
      rDadosContrato.VlrSalBase := cdsContrato.FieldByName('VLRSALBASE').AsCurrency;
   end else begin
      rDadosContrato.VlrSalBase := 0;
   end;

   if cdsContrato.FieldByName('VLRMARGEM').AsString <> '' then begin
      rDadosContrato.VlrMargem := cdsContrato.FieldByName('VLRMARGEM').AsCurrency;
   end else begin
      rDadosContrato.VlrMargem := 0;
   end;

   if cdsContrato.FieldByName('VLRMAXPERMIT').AsString <> '' then begin
      rDadosContrato.VlrMaxPermit := cdsContrato.FieldByName('VLRMAXPERMIT').AsCurrency;
   end else begin
      rDadosContrato.VlrMaxPermit := 0;
   end;

   (* FLGFORMAREC = C -> indicando que o Débito é pelo Contas a Receber
                    F -> indicando que o Débito é pela Folha *)
   rDadosContrato.flgFormaRec := cdsContrato.FieldByName('FLGFORMAREC').AsString;

   (* FLGFORMAPAG = C -> indicando que o Crédito é pelo Contas a Pagar
                    F -> indicando que o Crédito é pela Folha *)
   rDadosContrato.flgFormaPag := cdsContrato.FieldByName('FLGFORMAPAG').AsString;
end;

procedure LimpaRegistroConcessao(var Registro : TDadosConcessao);
begin
   with Registro do
   begin
      IDContratoEmptmo  := -1;
      ValorSolic        := 0;
      DataCredito       := -1;
      Prazo             := 0;
      SaldoQuitacao     := 0;
   end;
end;

end.
