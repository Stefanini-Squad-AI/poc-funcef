// Alterações
{
--------------------------------------------------------------------------------
Pendência   : WO19836
Responsável : Luis Ferrari
Data        : 07/05/2025
Descrição   : Inclusao da apropriação de pagamento parcial e nova funcinalidade
              ProcessaApropriacao para pagamento parcial da parcela.
--------------------------------------------------------------------------------
Rotina      : PreencheDadosContrato
Pendência   : 18356
Responsável : Edilaine
Data        : 23/01/2025
Descrição   : Tratamento para verificar se o campo CARENCIA foi passado
--------------------------------------------------------------------------------
Rotina      : PreencheDadosContrato
Pendência   : WO14072
Responsável : Helen V Bianchi
Data        : 24/10/2024
Descrição   : Criado um novo campo Carencia
--------------------------------------------------------------------------------
Rotina      : PreencheDadosContrato
Pendência   : SIG101022
Responsável : Edilaine
Data        : 03/05/2018
Descrição   : Eliminar registros negativos da TMPDESC abatendo de registros
              positivos.
-------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
-------------------------------------------------------------------------------
Pendência   : SOL 172525 KINTANA 1553886
Responsável : Monica Gonzaga
Data        : 09/04/2012
Descrição   : Criado um novo campo "PNUMPROTOCOLO", para gravar o valor no NUP.
-------------------------------------------------------------------------------
Pendência   : SOL176201 Kintana 1606793
Responsável : DOUGLAS DE SIQUEIRA
Data        : 21/03/2012
Descrição   : Criação de campo TXJUROSANT nas queries de entrada da regra de concessão
--------------------------------------------------------------------------------------------------
Pendência   : SOL 139313 Kintana 855071
Responsável : Fernando Xavier
Data        : 13/07/2010
Descrição   : variavel para pegar a proxima parcela.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 126520 Kintana 663633
Responsável : BRUNO AZEVEDO
Data        : 17/06/2010
Descrição   : Exibir os itens de prestação para contratos que possuem FGQC.
--------------------------------------------------------------------------------------------------
Pendência   : 108099 - Kintana: 487201
Responsável : Daniel Begnami
Data        : 19/04/2008
Descrição   : Criação de novas modalidades de emprestimo.s
----------------------------------------------------------------------------------------------------
Data      : 20/11/2008
Pendência : SOL 100478,100476,100479
Autor     : Renato Visoni
Descrição : Criado Campo tipo de recurso e Origem do Recurso
--------------------------------------------------------------------------------------------------
Rotina    : - (TTipoParametros)
Data      : 08/07/2004
Pendência : -
Autor     : André Pontes
Descrição : Criado novo tipo: ttTmpDesc, para regular a questão do IDPLANOPREV/IDPLANOORIGEM no
            envio
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 25/11/2002
Autor     : Marchetti
Descrição : Criado o record contendo o valor solicitado e a data de crédito do contrato. O mesmo é
            utilizado na query de entrada da função CalculaItens.
---------------------------------------------------------------------------------------------------}

unit UTypesEmptmo;

interface

uses
   DBTables, Db, Wwquery;

type
   // André Pontes - 08/07/2004
   TTipoParametros = (ttContabeis, ttFinanceiros, ttTmpDesc);
   // FIM André Pontes - 08/07/2004

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
//      FLGPERDAEFETIVA : Integer;

      FlgDivergPend     : Integer;
      FlgTipoDiverg     : Integer;
      FlgGravaZERO      : Boolean;

      Prioridade        : Integer;
      Observacao        : WideString;
      Centraliza        : String; //BRUNO AZEVEDO SOL 126520 KINTANA 663633
      proximaparcela    : real;   // Fernando Xavier  SOL 139313 Kintana 855071
      FlgSuspensao      : Integer;        //Ferrari WO19836
      idTipoSuspemptmo  : Integer;        //Ferrari WO19836
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

      CodFormaPag       : Int64;
      PortFormaPag      : Int64;
      PortFormaRec      : Int64;

      Indexador         : Int64;
      SiglaIndexador    : String;

      FlgFormaRec       : String;
      FlgFormaPag       : String;

      FlgSituacao       : String;
      sFlagPerdaEfetiva : Integer; //ALEX - VOTO DE EMPRESTIMO
      FlgSuspensaoAuto  : Integer;

      OrigemRecurso     : String;  //Renato Visoni SOL 100478,100476,100479
      TipoRecurso       : String;  //Renato Visoni SOL 100478,100476,100479

      IDTipoSuspEmptmo  : Int64;
      DataInicioSusp    : TDateTime;
      DataFimSusp       : TDateTime;
      AnoSuspensao      : Integer;
      MesSuspensao      : Integer;
      NumParcDesconto   : Integer;

      FlgExcepcional    : Integer;
      FlgFinanciamento  : Integer;

      FlgUsaMargemAlt   : Integer;

      IDPlanoCob        : Int64;     //Pendência 26775 - 26/12/2007   ]

      TSEMeses          : Integer;   // SOL:108099 Daniel Begnami

      sNumNup           : string;   // Monica - SOL172525
      Carencia          : Integer;  // Helen - WO14072

   end;

// -------------------------------------------------------------------------------------------------
   TDadosConcessao = Record
      IDContratoEmptmo  : Extended;
      ValorSolic        : Currency;
      DataCredito       : TDateTime;
      Prazo             : Integer;
      SaldoQuitacao     : Currency;
      Taxa              : Currency;//Douglas.Siqueira SOL176201 Kintana 1606793
   end;

// -------------------------------------------------------------------------------------------------

   TParamIntegra = Record
      iHistorico           : Extended;    //                      |     HistMovEmptmo 
      iContrato            : Extended;    //                      |     ContratoEmptmo
      iTipoContrato        : Int64;       //                      |     ContratoEmptmo

      iPlanoPrev           : Int64;       //                      |     ContratoEmptmo
      iPlanPrevContab      : Int64;       // Entidade contábil    |     ver lógica de busca

      iPatro               : Int64;       //                      |     ContratoEmptmo
      iPessoa              : Int64;       //                      |     ContratoEmptmo

      iCodPortForma        : Int64;       // PortadorForma        |     ContratoEmptmo
      iCodForma            : Int64;       // FormaRecPag          |     ContratoEmptmo
                                          //    usado na concessão

      iItem                : Int64;       // ID do item           |     ItemXTipoContr
      sItem                : String;      // Nome do item         |     ItemEmptmo

      iPlano               : Int64;       // Plano de Contas      |     PlanoData
      sAnoMesCompetencia   : String;      //                      |     HistMovEmptmo

      sContaDFolha         : String;      //                      |     ParamIntegraEP 
      sCentroCustoDFolha   : String;      //                      |     ParamIntegraEP 
      iSubContaDFolha      : Int64;       //                      |     ParamIntegraEP 
      sContaCFolha         : String;      //                      |     ParamIntegraEP 
      iSubContaCFolha      : Int64;       //                      |     ParamIntegraEP 
      sCentroCustoCFolha   : String;      //                      |     ParamIntegraEP 
      sContaDFinan         : String;      //                      |     ParamIntegraEP 
      sCentroCustoDFinan   : String;      //                      |     ParamIntegraEP
      iSubContaDFinan      : Int64;       //                      |     ParamIntegraEP 
      sContaCFinan         : String;      //                      |     ParamIntegraEP 
      iSubContaCFinan      : Int64;       //                      |     ParamIntegraEP 
      sCentroCustoCFinan   : String;      //                      |     ParamIntegraEP 

      sContaContab         : String;      // p/ LancaContab       |                    
      sCentroCustoContab   : String;      // p/ LancaContab       |                    
      iSubContaContab      : Int64;       // p/ LancaContab       |                    

      sContaContabDEB      : String;      // p/ LancaContab       |                    
      sCentroCustoContabDEB: String;      // p/ LancaContab       |                    
      iSubContaContabDEB   : Int64;       // p/ LancaContab       |                    
      sContaContabCRE      : String;      // p/ LancaContab       |                    
      sCentroCustoContabCRE: String;      // p/ LancaContab       |                    
      iSubContaContabCRE   : Int64;       // p/ LancaContab       |                    

      iExercicio           : Integer;     // p/ LancaContab       |
      iPeriodo             : Integer;     // p/ LancaContab       |

      iParcela             : Integer;     //                      |     HistMovEmptmo

      sTipoPer             : String;      // Grupo de Lançamento  |     ItemXTipoContr 
      iTipoDoc             : Int64;       // Tipo de Documento    |     ItemXTipoContr 
      sRecPag              : String;      //                      |     ItemXTipoContr 
      sCCBaixa             : String;      // Conta de baixa       |     ItemXTipoContr, flgCentraliza = 1 

      sTipoRecDesFolha     : String;      //                      |     ParamIntegraEP 
      sRecPagFolha         : String;      //                      |     ParamIntegraEP 
      sTipoRecDesFinan     : String;      //                      |     ParamIntegraEP 
      sRecPagFinan         : String;      //                      |     ParamIntegraEP 
      sFormaEnvio          : String;      // C=CaP/CaR, F=Folha   |     HistMovEmptmo

      iUnidNegoc           : Int64;
      IDCBancaria          : Int64;

      sCentroRespon        : String;      //                      |     ParamIntegraEP 
      sDescricao           : String;      // Descrição do Item    |           -        

      iMoeda               : Int64;       // no momento, sempre moeda corrente 
      fVlrLanc             : Currency;    // valor do item 

      dDataLanc            : TDateTime;   // data do lançamento contábil
      dDataVenc            : TDateTime;   // data de vencimento (data prevista) 

      iPlanilha            : Int64;       // resultado 
      iDocumento           : Int64;       // resultado 
      iRateioDocum         : Int64;       // resultado 
      iLanctoDocum         : Int64;       // resultado 

      bEmisBloq            : Boolean;
      sDebCre              : String;      // Débito ou Crédito 
      fNumDocumento        : Extended;    // nº do documento 
   end;

// -------------------------------------------------------------------------------------------------

   // Status do envio.  especifica se o mesmo ja foi processado, baixado, esta com erro, .... 
   TStatusEnvio = (sDocCobrEmit, sDocParcReceb, sDocError, sFolhaProc, sFolhaError);

   // A Forma de envio, Documento ou Folha 
   TFormaEnvio  = (fCapCar, fFolha);

// -------------------------------------------------------------------------------------------------

   TDadosTmpDesc = Record
      IDTMPDESC         : Extended;
      IDPessoa          : Int64;
      IDTitular         : Int64;
      IDPessjur         : Int64;
      IDPlanoprev       : Int64;
      IDPlanoprevContab : Int64;
      IDLote            : Int64;
      IDProvento        : Int64;
      IDDesconto        : Extended;
      IDEmpresa         : Int64;
      IDEmpresaProp     : Int64;
      IDMotivo          : Int64;
      CodAlterador      : Integer;
      CodPortForma      : Integer;
      CodTipDoc         : Integer;
      Exercicio         : Integer;
      NoDocumento       : Extended;
      NumPrioridade     : Integer;
      Ordem             : Extended;
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
      HmeTipoMov        : Integer;
      
      // Marchetti - Pendencia 22641
      IDTipoContrEmptmo : Integer;
      // Fim Marchetti - Pendencia 22641
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
      IDInscricaoEmptmo : Extended;
      IDBenefSeguro     : Int64;
      PercIndenizacao   : Real;
   end;

   TListaContratoXBenefSeg = array of TContratoXBenefSeg;

// -------------------------------------------------------------------------------------------------

   TLogTotalPrev = Record
      IDLogTotalPrev : Int64;
      IDModulo       : Int64;
      IDContrato     : Extended;
      IDHistMov      : Extended;
      CodPlanDoc     : Extended;
      Origem         : Integer;
      IDUsuario      : Int64;
      Data           : TDateTime;
      DataIni        : TDateTime;
      DataFim        : TDateTime;
      Versao         : String;
      Operacao       : String
   end;

// -------------------------------------------------------------------------------------------------

   procedure LimpaRegistro(var Registro: TItemRecDep);
   procedure LimpaRegistroContratoXBenefSeg(var Registro: TContratoXBenefSeg);

   procedure LimpaRegistroContrato(var Registro: TDadosContrato);
   procedure PreencheDadosContrato(const qryContrato      : TwwQuery;
                                   var   rDadosContrato   : TDadosContrato;
                                   bOrigemRecurso  : Boolean = False ); //Renato Visoni SOL 100478,100476,100479

   procedure LimpaRegistroConcessao(var Registro : TDadosConcessao);

   procedure LimpaRegistroLog(var Registro: TLogTotalPrev);

// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------

const
   CRLF = #13+#10;

implementation


procedure LimpaRegistroContratoXBenefSeg(var Registro: TContratoXBenefSeg);
begin
   with Registro do
   begin
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
      ValorBase         := 0;

      FlgDivergPend     := -1;
      FlgTipoDiverg     := -1;
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

      TipoRecurso       :=''; //Renato Visoni SOL 100478,100476,100479
      OrigemRecurso     :=''; //Renato Visoni SOL 100478,100476,100479

      FlgUsaMargemAlt   := 0;

      TSEMEses          := 0; // SOL:108099 Daniel Begnami

   end;  // with Registro
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



procedure LimpaRegistroLog(var Registro: TLogTotalPrev);
begin
   with Registro do
   begin
      IDLogTotalPrev := -1;
      IDModulo       := -1;
      IDContrato     := -1;
      IDHistMov      := -1;
      CodPlanDoc     := -1;
      Origem         := -1;
      IDUsuario      := -1;
      Data           := 0;
      DataIni        := 0;
      DataFim        := 0;
      Versao         := '';
      Operacao       := '';
   end;
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
procedure PreencheDadosContrato(const qryContrato       : TwwQuery;
                                var   rDadosContrato    : TDadosContrato;
                                bOrigemRecurso  : Boolean = False ); //Renato Visoni SOL 100478,100476,100479
begin
   LimpaRegistroContrato(rDadosContrato);

   rDadosContrato.IDContratoEmptmo  := qryContrato.FieldByName('IDCONTRATOEMPTMO').AsFloat;
   // É nulo na Concessão
   rDadosContrato.IDContrQuitacao   := -1;

   rDadosContrato.IDPessoa          := qryContrato.FieldByName('IDPESSOA').AsInteger;
   rDadosContrato.IDTipoContrEmptmo := qryContrato.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
   rDadosContrato.IDTipoEmptmo      := qryContrato.FieldByName('IDTIPOEMPTMO').AsInteger;
   rDadosContrato.IDPlanoPrev       := qryContrato.FieldByName('IDPLANOPREV').AsInteger;
   rDadosContrato.IDPlanoOrigem     := qryContrato.FieldByName('IDPLANOORIGEM').AsInteger;
   rDadosContrato.IDPatro           := qryContrato.FieldByName('IDPATRO').AsInteger;

   rDadosContrato.IDSitPart         := qryContrato.FieldByName('IDSITPART').AsInteger;

   // Número da Inscrição
   rDadosContrato.IDInscricaoEmptmo := qryContrato.FieldByName('IDINSCRICAOEMPTMO').AsFloat;

   // É nulo
   rDadosContrato.IDVerba := -1;

   // Beneficiário do Contrato
   //   IDBENEF = IDPESSOA -> do Titular no caso de estar vivo e do Beneficiário no caso de Pensionista
   rDadosContrato.IDBenef := qryContrato.FieldByName('IDBENEF').AsInteger;

   if qryContrato.FieldByName('FLGFORMAPAG').AsString = 'C' then
   begin
      rDadosContrato.IDCBancaria := qryContrato.FieldByName('IDCBANCARIA').AsInteger;

      if not(qryContrato.FieldByName('IDCBANCARIADEB').IsNull) then
         rDadosContrato.IDCBancariaDeb := qryContrato.FieldByName('IDCBANCARIADEB').AsInteger
      else
         rDadosContrato.IDCBancariaDeb := qryContrato.FieldByName('IDCBANCARIA').AsInteger;
   end
   else
   begin
      // É nulo
      rDadosContrato.IDCBancaria := -1;
      rDadosContrato.IDCBancariaDeb := -1;
   end;

   if qryContrato.FieldByName('CODFORMAPAG').AsString <> '' then begin
      rDadosContrato.CodFormaPag  := qryContrato.FieldByName('CODFORMAPAG').AsInteger;
   end else begin
      rDadosContrato.CodFormaPag  := -1;
   end;

   if qryContrato.FieldByName('PORTFORMAPAG').AsString <> '' then
   begin
      rDadosContrato.PortFormaPag := qryContrato.FieldByName('PORTFORMAPAG').AsInteger;
   end
   else
   begin
      rDadosContrato.PortFormaPag := -1;
   end;

   if qryContrato.FieldByName('PORTFORMAREC').AsString <> '' then
   begin
      rDadosContrato.PortFormaRec := qryContrato.FieldByName('PORTFORMAREC').AsInteger;
   end
   else
   begin
      rDadosContrato.PortFormaRec := -1;
   end;

   rDadosContrato.Indexador      := qryContrato.FieldByName('MOECODIGO').AsInteger;
   rDadosContrato.SiglaIndexador := qryContrato.FieldByName('MOESIGLA').AsString;
   
   //Renato Visoni SOL 100478,100476,100479
   if (bOrigemRecurso) then begin
     rDadosContrato.OrigemRecurso    := qryContrato.FieldByName('ORIGEMRECURSO').asString;
     rDadosContrato.TipoRecurso      := qryContrato.FieldByName('IDTIPORECURSO').asString;
   end else begin
     rDadosContrato.OrigemRecurso    := '';
     rDadosContrato.TipoRecurso      := '';
   end;
   //Renato Visoni SOL 100478,100476,100479
   
   rDadosContrato.NumParcelas    := qryContrato.FieldByName('NUMPARCELAS').AsInteger;
   rDadosContrato.DataCredito    := qryContrato.FieldByName('DATACREDITO').AsDateTime;
   rDadosContrato.DataSituacao   := qryContrato.FieldByName('DATASITUACAO').AsDateTime;
   rDadosContrato.DataAssinatura := qryContrato.FieldByName('DATAASSINATURA').AsDateTime;
   rDadosContrato.DataPrimParc   := qryContrato.FieldByName('DATAPRIMPARC').AsDateTime;
   rDadosContrato.DataInscricao  := qryContrato.FieldByName('DATAINSC').AsDateTime;

   // Data nula 
   rDadosContrato.DataCanc :=  -1;

   rDadosContrato.VlrContrato := qryContrato.FieldByName('VLRCONTRATO').AsCurrency;
   rDadosContrato.VlrParcela  := qryContrato.FieldByName('VLRPARCELA').AsCurrency;
   rDadosContrato.Txjuros     := qryContrato.FieldByName('TXJUROS').AsFloat;
   rDadosContrato.FlgSituacao := qryContrato.FieldByName('FLGSITUACAO').AsString;

   if qryContrato.FieldByName('VLRSALBASE').AsString <> '' then
   begin
      rDadosContrato.VlrSalBase := qryContrato.FieldByName('VLRSALBASE').AsCurrency;
   end
   else
   begin
      rDadosContrato.VlrSalBase := 0;
   end;

   if qryContrato.FieldByName('VLRMARGEM').AsString <> '' then
   begin
      rDadosContrato.VlrMargem := qryContrato.FieldByName('VLRMARGEM').AsCurrency;
   end
   else
   begin
      rDadosContrato.VlrMargem := 0;
   end;

   if qryContrato.FieldByName('VLRMAXPERMIT').AsString <> '' then
   begin
      rDadosContrato.VlrMaxPermit := qryContrato.FieldByName('VLRMAXPERMIT').AsCurrency;
   end
   else
   begin
      rDadosContrato.VlrMaxPermit := 0;
   end;

   // FLGFORMAREC = C -> indicando que o Débito é pelo Contas a Receber
   //               F -> indicando que o Débito é pela Folha 
   rDadosContrato.flgFormaRec := qryContrato.FieldByName('FLGFORMAREC').AsString;

   // FLGFORMAPAG = C -> indicando que o Crédito é pelo Contas a Pagar
   //               F -> indicando que o Crédito é pela Folha
   rDadosContrato.flgFormaPag := qryContrato.FieldByName('FLGFORMAPAG').AsString;

   rDadosContrato.IDTipoSuspEmptmo  := qryContrato.FieldByName('IDTIPOSUSPEMPTMO').AsInteger;
   rDadosContrato.DataInicioSusp    := qryContrato.FieldByName('DATAINICIOSUSP').AsDateTime;
   rDadosContrato.DataFimSusp       := qryContrato.FieldByName('DATAFIMSUSP').AsDateTime;
   rDadosContrato.AnoSuspensao      := qryContrato.FieldByName('ANOSUSPENSAO').AsInteger;
   rDadosContrato.MesSuspensao      := qryContrato.FieldByName('MESSUSPENSAO').AsInteger;

   //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
   if (qryContrato.FindField('FLGPERDAEFETIVA') <> nil) and      //edilaine SIG101022
      (not qryContrato.FieldByName('FLGPERDAEFETIVA').IsNull) then begin
     rDadosContrato.sFlagPerdaEfetiva := qryContrato.FieldByName('FLGPERDAEFETIVA').AsInteger;
   end else begin
     rDadosContrato.sFlagPerdaEfetiva := 0;
   end;
   //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO

   if qryContrato.FindField('CARENCIA') <> nil then   //edilaine WO18356
      rDadosContrato.Carencia := qryContrato.FieldByName('CARENCIA').AsInteger; // WO14072 - Helen
end;



end.









