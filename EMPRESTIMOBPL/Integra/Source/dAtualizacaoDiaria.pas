{-------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Cunha
Data        : 25/10/2018
Descrição   : Alterar Owner da tabela CONTRATOAD
--------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jésica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------}
unit dAtualizacaoDiaria;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBTables, wwstorep, Db, Wwquery, uTypesEmptmo, StdCtrls;

type
   TdtmAtualizacaoDiaria = class(TDataModule)
      qryRetornaValor: TwwQuery;
      spAtualizaSaldo: TwwStoredProc;
      qryUpdateSaldo: TwwQuery;
      qryParcelasEstorno: TwwQuery;
      qryAtualizaSaldo: TwwQuery;
      qryAtualizaSaldoIDHISTMOVEMPTMO: TFloatField;
      qryAtualizaSaldoHMEVLRPREVISTO: TFloatField;
      qryAtualizaSaldoITCTRATASALDODEV: TFloatField;
      qryParcelasAberto: TwwQuery;
      qryParcelasAbertoTOTAL: TFloatField;
      qryParcelasNaoPagas: TwwQuery;
      qryParcelasNaoPagasHMEVLRPREVISTO: TFloatField;
      qryInsertHistMovEmptmo: TwwQuery;
      qryAux: TwwQuery;
      qryAuxIDHISTMOVEMPTMO: TFloatField;
      spUpdateEstornado: TwwStoredProc;
      qryBuscaItens: TwwQuery;
      qryBuscaItensIDITEMEMPTMO: TFloatField;
      qryBuscaItensFLGCENTRALIZA: TFloatField;
      qryBuscaItensITCRECPAG: TStringField;
      qryBuscaItensIDREGRACALC: TFloatField;
      qryBuscaItensITCPRIORIDADE: TFloatField;
      qryBuscaItensIDPROVENTON: TFloatField;
      qryBuscaItensITCEVENTO: TFloatField;
      qryBuscaItensITCSEQCALCULO: TFloatField;
      qryBuscaItensIDITEMCENTRALIZA: TFloatField;
      qryBuscaItensITEDESCRICAO: TStringField;
      qryBuscaItensITCTRATASALDODEV: TFloatField;
      qryBuscaItensFLGDESTACADO: TFloatField;
      qryBuscaItensFLGGRAVAZERO: TFloatField;
      qryDatasAtualiza: TwwQuery;
      qryDatasAtualizaDIAS: TFloatField;
      spAtualizaDiaria: TwwStoredProc;
      qryUltAtuDia: TwwQuery;
      qryUltAtuDiaHMEDATAATUALIZA: TDateTimeField;
      qryEstornaItensAtualizacao: TwwQuery;
    qryContratosGeracao: TwwQuery;
    qryContratosGeracaoIDCONTRATOEMPTMO: TFloatField;
    qryContratosGeracaoIDCONTRQUITACAO: TFloatField;
    qryContratosGeracaoIDTIPOEMPTMO: TFloatField;
    qryContratosGeracaoIDINSCRICAOEMPTMO: TFloatField;
    qryContratosGeracaoIDTIPOCONTREMPTMO: TFloatField;
    qryContratosGeracaoIDPATRO: TFloatField;
    qryContratosGeracaoIDPLANOPREV: TFloatField;
    qryContratosGeracaoIDVERBA: TFloatField;
    qryContratosGeracaoIDPESSOA: TFloatField;
    qryContratosGeracaoIDBENEF: TFloatField;
    qryContratosGeracaoFLGSITUACAO: TStringField;
    qryContratosGeracaoFLGFORMAREC: TStringField;
    qryContratosGeracaoFLGFORMAPAG: TStringField;
    qryContratosGeracaoCODFORMAPAG: TFloatField;
    qryContratosGeracaoPORTFORMAREC: TFloatField;
    qryContratosGeracaoPORTFORMAPAG: TFloatField;
    qryContratosGeracaoIDCBANCARIA: TFloatField;
    qryContratosGeracaoDATAASSINATURA: TDateTimeField;
    qryContratosGeracaoDATASITUACAO: TDateTimeField;
    qryContratosGeracaoDATACREDITO: TDateTimeField;
    qryContratosGeracaoDATAPRIMPARC: TDateTimeField;
    qryContratosGeracaoDATACANC: TDateTimeField;
    qryContratosGeracaoMOECODIGO: TFloatField;
    qryContratosGeracaoMOESIGLA: TStringField;
    qryContratosGeracaoVLRCONTRATO: TFloatField;
    qryContratosGeracaoVLRPARCELA: TFloatField;
    qryContratosGeracaoTXJUROS: TFloatField;
    qryContratosGeracaoNUMPARCELAS: TFloatField;
    qryContratosGeracaoIDREGRAJURCONC: TFloatField;
    qryContratosGeracaoIDREGRALIMITES: TFloatField;
    qryContratosGeracaoIDREGRASUSPCOBR: TFloatField;
    qryContratosGeracaoIDREGRASLDDIA: TFloatField;
    qryContratosGeracaoIDREGRAJURANTCONC: TFloatField;
    qryContratosGeracaoIDREGRAELEG: TFloatField;
    qryContratosGeracaoIDREGRARESERVA: TFloatField;
    qryContratosGeracaoIDREGRAMARGEM: TFloatField;
    qryContratosGeracaoIDREGRAPRAZOSCONC: TFloatField;
    spProvPerdas: TwwStoredProc;


   private  // Private declarations

      vIDPatro, vIDPlano   : array of Int64;
      rSaldoDevAnt         : TSaldoDevAnt;
      rSaldoDevAtualiza    : TSaldoDevAnt;
      rContrato            : TDadosContrato;
      rConcessao           : TDadosConcessao;
      vItens               : TListaItem;

      iPais                : Integer;
      sEstado              : String;
      iCidade              : Integer;

      fTxJuros             : Currency;
      iParcelaAtual        : Integer;
      iParcelaRestante     : Integer;
      rSitPart             : TSitPart;
      fSaldoAnt            : Currency;
      fSaldo20             : Currency;
      dData20              : TDateTime;

      iIDContratoEmptmo    : Extended;
      dDataAtualizacao     : TDateTime;


      function VerificaAtualizacaoDiaria(const iIDContratoEmptmo : Extended;
                                         const dDataAtualizacao : TDateTime
                                        ) : Boolean;

      function EstornaParcelas(const iIdContratoEmptmo : Extended;
                               const sDataInicial      : String;
                               const sDataFinal        : String
                              ): Boolean;

      function GeraItensAtu: Boolean;

      function GeraItensPeriodo(const dDataAtualizacao  : TDateTime;
                                const fValorProvisao    : Currency;
                                const fValorEmAbertoAnt : Currency;
                                const dVencimentoAnt    : TDateTime;
                                const dVencimento       : TDateTime;
                                const fVAlorEmAberto    : Currency
                               ): Boolean;

      function AtualizaPlanilha(const iPlanilha : Integer; sDataAtualiza, sDataFinal : String) : Boolean;

      function CalculaItens(const rContrato           : TDadosContrato;
                            const iEvento             : Integer;
                            const iOrigem             : Integer;
                            const iPais               : Integer;
                            const sEstado             : String;
                            const iCidade             : Integer;
                            const sFormaCobranca      : String;
                            const fTxJuros,
                                  fSaldoDev,
                                  fVlrMaxPermit       : Currency;
                            const dDataRef            : TDateTime;
                            const dDataAtualiza       : TDateTime;
                            const bInterrompe         : Boolean;
                            const bMostraMsg          : Boolean;
                            const bMostraProgresso    : Boolean;
                            var   vLista              : TListaItem;
                            const bAlteraSaldoDev     : Boolean = True;
                            const fVlrContratosAnt    : Currency = 0;
                            const fVlrDividas         : Currency = 0;
                            const dDataAtraso         : TDateTime = 0;
                            const fValorEmAberto      : Currency = 0;
                            const dDataAtrasoAnt      : TDateTime = 0;
                            const fValorEmAbertoAnt   : Currency = 0;
                            const fValorProvisao      : Currency = 0;
                            const fSaldo20            : Currency = 0;
                            const dData20             : TDateTime = -1
                           ): Boolean;


      function GravaMovEmptmo(const rContrato               : TDadosContrato;
                              vLista                        : TListaItem;
                              const iEvento                 : Integer;
                              const iParcela                : Integer;
                              const iAnoCompetencia         : Integer;
                              const iMesCompetencia         : Integer;
                              const iAnoCobranca            : Integer;
                              const iMesCobranca            : Integer;
                              const iParcelasRemanescentes  : Integer;
                              const dDataPrevista           : TDateTime;
                              const dDataUltAtualiza        : TDateTime;
                              const sFormaEnvio             : String;
                              const sTipoFolha              : String;
                              const bMostraProgresso        : Boolean
                             ): Boolean;


      function InsertMovEmptmo(const ItemContrato     : TItemRecDep;
                               const rContrato        : TDadosContrato
                              ): Boolean;



   public   // Public declarations

      function SelecionaContratosGeracao(const sDataAtualiza    : String;
                                         const sTipoEmptmo      : String;
                                         const sTipoContrEmptmo : String;
                                         const sPatro           : String;
                                         const sPlano           : String;
                                         const bInArquivo       : Boolean;
                                         const bNotInArquivo    : Boolean
                                        ): Boolean;

      function SelecionaContratosAtu(const sTipoEmptmo      : String;
                                     const sTipoContrEmptmo : String;
                                     const sPatro           : String;
                                     const sPlano           : String;
                                     const bInArquivo       : Boolean;
                                     const bNotInArquivo    : Boolean
                                    ): Boolean;

      function ProcessaContratoPeriodo(const IDContratoEmptmo : Extended;
                                       var   MemResult        : TMemo;
                                       var   MemErro          : TMemo;
                                       const bEstorna         : Boolean;
                                       const bAtualizaSaldo   : Boolean;
                                       const dDataConsiderada : TDateTime;
                                       const dDataInicial     : TDateTime;
                                       const dDataFinal       : TDateTime;
                                       var   iTotalDias       : Integer;
                                       const bCommit          : Boolean
                                      ) : boolean;

      function ProcessaContratos(var MemResult          : TMemo;
                                 var MemErro            : TMemo;
                                 const bEstorna         : Boolean;
                                 const dDataConsiderada : TDateTime) : boolean;

      function Contabiliza(const sDataAtualiza    : String;
                           const sTipoEmptmo      : String;
                           const sTipoContrEmptmo : String;
                           const sPatro           : String;
                           const sPlano           : String
                          ): Integer;

      function UltimaAtuDia(const IDContrato : Extended;
                            const dData      : TDateTime
                           ): TDateTime;

      procedure ExecutaAtuDia(const IDContrato      : Extended;
                              const IDModulo        : Integer;
                              const iTipoContr      : Integer;
                              const iTipoEmptmo     : Integer;
                              const iPatro          : Integer;
                              const iPlano          : Integer;
                              const iEstorna        : Integer;
                              const iProvPerda      : Integer;
                              const iAtuSaldo       : Integer;
                              const iInArquivo      : Integer;
                              const iNotInArquivo   : Integer;
                              const dDataIni        : TDateTime;
                              const dDataFim        : TDateTime;
                              const dDataConsidera  : TDateTime
                             );

      procedure ExecutaProvPerda(const IDContrato      : Extended;
                                 const IDModulo        : Integer;
                                 const iTipoContr      : Integer;
                                 const iTipoEmptmo     : Integer;
                                 const iPatro          : Integer;
                                 const iPlano          : Integer;
                                 const iEstorna        : Integer;
                                 const iProvPerda      : Integer;
                                 const iAtuSaldo       : Integer;
                                 const iInArquivo      : Integer;
                                 const iNotInArquivo   : Integer;
                                 const dDataIni        : TDateTime;
                                 const dDataFim        : TDateTime;
                                 const dDataConsidera  : TDateTime);


      procedure ExecutaAjusteSaldo(const IDContrato      : Extended;
                                   const dDataAtualiza   : TDateTime;
                                   const fSaldoDev       : Currency
                                  );

      property IDContratoEmptmo : Extended    read iIDContratoEmptmo  write iIDContratoEmptmo;
      property DataAtualizacao  : TDateTime   read dDataAtualizacao   write dDataAtualizacao;

   end;




var
  dtmAtualizacaoDiaria: TdtmAtualizacaoDiaria;




implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, dBaseDados,
   dLookEmptmo, uFuncoesEmptmo, dMS, uDiasUteis, dEmptmo, uIntegraEmptmo, uCalcEmptmo,
   FProgresso, dCalcEmptmo, URegra, uCmFileUtils;




function TdtmAtualizacaoDiaria.SelecionaContratosAtu(const sTipoEmptmo      : String;
                                                     const sTipoContrEmptmo : String;
                                                     const sPatro           : String;
                                                     const sPlano           : String;
                                                     const bInArquivo       : Boolean;
                                                     const bNotInArquivo    : Boolean
                                                    ): Boolean;
var
   sSQL : String;
begin
   Result := False;

   sSQL :=
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   'SELECT '                                                                      + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '   C.IDCONTRATOEMPTMO, '                                                                 + #13 +

   '   C.IDCONTRQUITACAO, TC.IDTIPOEMPTMO, '                                                 + #13 +
   '   C.IDINSCRICAOEMPTMO, C.IDTIPOCONTREMPTMO, '                                           + #13 +

   '   C.IDPATRO, C.IDPLANOPREV, C.IDVERBA, '                                                + #13 +
   '   C.IDPESSOA, C.IDBENEF, '                                                              + #13 +

   '   C.FLGSITUACAO, C.FLGFORMAREC, C.FLGFORMAPAG, '                                        + #13 +
   '   C.CODFORMAPAG, C.PORTFORMAREC, C.PORTFORMAPAG, '                                      + #13 +
   '   C.IDCBANCARIA, '                                                                      + #13 +

   '   C.DATAASSINATURA, C.DATASITUACAO, '                                                   + #13 +
   '   C.DATACREDITO, C.DATAPRIMPARC, '                                                      + #13 +
   '   C.DATACANC, C.MOECODIGO, M.MOESIGLA, '                                                + #13 +

   '   C.VLRCONTRATO, C.VLRPARCELA, C.TXJUROS, '                                             + #13 +
   '   C.NUMPARCELAS, '                                                                      + #13 +

   '   TC.IDREGRAJURCONC, '                                                                  + #13 +
   '   TC.IDREGRALIMITES, '                                                                  + #13 +
   '   TC.IDREGRASUSPCOBR, '                                                                 + #13 +
   '   TC.IDREGRASLDDIA, '                                                                   + #13 +
   '   TC.IDREGRAJURANTCONC, '                                                               + #13 +
   '   TC.IDREGRAELEG, '                                                                     + #13 +
   '   TC.IDREGRARESERVA, '                                                                  + #13 +
   '   TC.IDREGRAMARGEM, '                                                                   + #13 +
   '   TC.IDREGRAPRAZOSCONC, '                                                               + #13 +

   '   SIT.IDSITPART, SIT.FLGINTERNO, '                                                       + #13 +
   '   I.DATAINSC '                                                                          + #13 +
   'FROM '                                                                                   + #13 +
   '   INSCRICAOEMPTMO I,   '                                                                + #13 +
   '   CONTRATOEMPTMO  C,   '                                                                + #13 +
   '   PARTPREVPLAN    PPP, '                                                                + #13 +
   '   MOEDA           M,   '                                                                + #13 +
   '   SITPART         SIT, '                                                                + #13 +
   '   TIPOCONTREMPTMO TC,  '                                                                + #13 +
   '   TIPOEMPTMO      TE   '                                                                + #13 +
   // ----------------------------------------------------------------------------------------------

   'WHERE ' + #13 +
   '       ( C.FLGSITUACAO IN (''A'', ''E'', ''J'') ) '                                      + #13;

   if iIDContratoEmptmo > 0 then sSQL := sSQL +
   '   AND ( C.IDCONTRATOEMPTMO  = ' + FloatToStr(iIDContratoEmptmo) + ' ) '                 + #13;

   if bInArquivo then sSQL := sSQL +
   '   AND ( C.IDCONTRATOEMPTMO  IN '                                                        + #13;

   if bNotInArquivo then sSQL := sSQL +
   '   AND ( C.IDCONTRATOEMPTMO  NOT IN '                                                    + #13;

   if (bInArquivo) or (bNotInArquivo) then sSQL := sSQL +
   '         ( '                                                                             + #13 +
   '         SELECT '                                                                        + #13 +
   '            IDCONTRATOEMPTMO '                                                           + #13 +
   '         FROM '                                                                          + #13 +
//   '            CARGA.CONTRATOAD '                                                           + #13 +  //Everson Luiz - TIBERO
   '            CM.CONTRATOAD '                                                              + #13 +    //Everson Luiz - TIBERO
   '         ) '                                                                             + #13 +
   '       ) '                                                                               + #13;

   if sTipoEmptmo <> '' then sSQL := sSQL +
   '   AND ( TC.IDTIPOEMPTMO     = ' + sTipoEmptmo + ' ) '                    + #13;

   if sTipoContrEmptmo <> '' then sSQL := sSQL +
   '   AND ( C.IDTIPOCONTREMPTMO = ' + sTipoContrEmptmo + ' ) '              + #13 +
   '   AND ( TC.IDTIPOCONTREMPTMO = ' + sTipoContrEmptmo + ' ) '             + #13;

   if sPatro <> '' then sSQL := sSQL +
   '   AND ( C.IDPATRO           IN ( ' + sPatro + ' ) ) '                                + #13;

   if sPlano <> '' then sSQL := sSQL +
   '   AND ( C.IDPLANOPREV       IN ( ' + sPlano + ' ) ) '                                + #13;

   sSQL := sSQL +
   '   AND ( TE.IDEMPRESAPROP    = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                   + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '                                  + #13 +
   '   AND ( TC.IDTIPOEMPTMO     = TE.IDTIPOEMPTMO ) '                                       + #13 +

   '   AND ( C.IDPATRO           = PPP.IDPESSJUR )'                                          + #13 +
   '   AND ( C.IDBENEF           = PPP.IDPESSOA )'                                           + #13 +
   '   AND ( PPP.SEQPROPOSTA     = 1 )'                                                      + #13 +

   '   AND ( PPP.FLGDESATIVADO   = 0 ) '                                                     + #13 +
   '   AND ( PPP.IDSITPART       = SIT.IDSITPART ) '                                         + #13 +

   '   AND ( C.IDINSCRICAOEMPTMO = I.IDINSCRICAOEMPTMO(+) ) '                                + #13 +
   '   AND ( C.MOECODIGO         = M.MOECODIGO(+) ) ';

   MostraEspera('Selecionando Contratos...');

end;



function TdtmAtualizacaoDiaria.SelecionaContratosGeracao(const sDataAtualiza    : String;
                                                         const sTipoEmptmo      : String;
                                                         const sTipoContrEmptmo : String;
                                                         const sPatro           : String;
                                                         const sPlano           : String;
                                                         const bInArquivo       : Boolean;
                                                         const bNotInArquivo    : Boolean
                                                        ): Boolean;
var
   sSQL : String;
begin
   Result := False;

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '   C.IDCONTRATOEMPTMO, '                                                                 + #13 +

   '   C.IDCONTRQUITACAO, TC.IDTIPOEMPTMO, '                                                 + #13 +
   '   C.IDINSCRICAOEMPTMO, C.IDTIPOCONTREMPTMO, '                                           + #13 +

   '   C.IDPATRO, C.IDPLANOPREV, C.IDVERBA, '                                                + #13 +
   '   C.IDPESSOA, C.IDBENEF, '                                                              + #13 +

   '   C.FLGSITUACAO, C.FLGFORMAREC, C.FLGFORMAPAG, '                                        + #13 +
   '   C.CODFORMAPAG, C.PORTFORMAREC, C.PORTFORMAPAG, '                                      + #13 +
   '   C.IDCBANCARIA, '                                                                      + #13 +

   '   C.DATAASSINATURA, C.DATASITUACAO, '                                                   + #13 +
   '   C.DATACREDITO, C.DATAPRIMPARC, '                                                      + #13 +
   '   C.DATACANC, C.MOECODIGO, M.MOESIGLA, '                                                + #13 +

   '   C.VLRCONTRATO, C.VLRPARCELA, C.TXJUROS, '                                             + #13 +
   '   C.NUMPARCELAS, '                                                                      + #13 +

   '   TC.IDREGRAJURCONC, '                                                                  + #13 +
   '   TC.IDREGRALIMITES, '                                                                  + #13 +
   '   TC.IDREGRASUSPCOBR, '                                                                 + #13 +
   '   TC.IDREGRASLDDIA, '                                                                   + #13 +
   '   TC.IDREGRAJURANTCONC, '                                                               + #13 +
   '   TC.IDREGRAELEG, '                                                                     + #13 +
   '   TC.IDREGRARESERVA, '                                                                  + #13 +
   '   TC.IDREGRAMARGEM, '                                                                   + #13 +
   '   TC.IDREGRAPRAZOSCONC '                                                                + #13 +

   'FROM '                                                                                   + #13 +
   '   CONTRATOEMPTMO  C,   '                                                                + #13 +
   '   MOEDA           M,   '                                                                + #13 +
   '   TIPOCONTREMPTMO TC,  '                                                                + #13 +
   '   TIPOEMPTMO      TE   '                                                                + #13 +
   // ----------------------------------------------------------------------------------------------

   'WHERE ' + #13 +
   '   ( C.FLGSITUACAO IN (''A'', ''E'', ''J'') ) '                                          + #13;

   if iIDContratoEmptmo > 0 then sSQL := sSQL +
   '   AND ( C.IDCONTRATOEMPTMO  = ' + FloatToStr(iIDContratoEmptmo) + ' ) '                 + #13;

   if bInArquivo then sSQL := sSQL +
   '   AND ( C.IDCONTRATOEMPTMO  IN '                                                        + #13;

   if bNotInArquivo then sSQL := sSQL +
   '   AND ( C.IDCONTRATOEMPTMO  NOT IN '                                                    + #13;

   if (bInArquivo) or (bNotInArquivo) then sSQL := sSQL +
   '         ( '                                                                             + #13 +
   '         SELECT '                                                                        + #13 +
   '            IDCONTRATOEMPTMO '                                                           + #13 +
   '         FROM '                                                                          + #13 +
//   '            CARGA.CONTRATOAD '                                                           + #13 +  //Everson Luiz - TIBERO
   '            CM.CONTRATOAD '                                                              + #13 +    //Everson Luiz - TIBERO
   '         ) '                                                                             + #13 +
   '       ) '                                                                               + #13;

   if sTipoEmptmo <> '' then sSQL := sSQL +
   '   AND ( TC.IDTIPOEMPTMO     = ' + sTipoEmptmo + ' ) '                    + #13;

   if sTipoContrEmptmo <> '' then sSQL := sSQL +
   '   AND ( C.IDTIPOCONTREMPTMO = ' + sTipoContrEmptmo + ' ) '              + #13 +
   '   AND ( TC.IDTIPOCONTREMPTMO = ' + sTipoContrEmptmo + ' ) '             + #13;

   if sPatro <> '' then sSQL := sSQL +
   '   AND ( C.IDPATRO           IN ( ' + sPatro + ' ) ) '                                + #13;

   if sPlano <> '' then sSQL := sSQL +
   '   AND ( C.IDPLANOPREV       IN ( ' + sPlano + ' ) ) '                                + #13;

   sSQL := sSQL +
   '   AND ( TE.IDEMPRESAPROP    = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                   + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '                                  + #13 +
   '   AND ( TC.IDTIPOEMPTMO     = TE.IDTIPOEMPTMO ) '                                       + #13 +

   '   AND ( C.MOECODIGO         = M.MOECODIGO(+) ) ';

   try
      MostraEspera('Selecionando Contratos para atualização - ' + sDataAtualiza + '...');

      with qryContratosGeracao do
      begin
         Close;
         SQL.Clear;
         SQL.Text := sSQL;
         //Jéssica Lana SOL 114575 24/04/2009
         //SQL.SaveToFile(Sistema.TempDir + 'EP-ContratosAtuDia.txt');
           SQL.SaveToFile(ftempregra + '\' + 'EP-ContratosAtuDia.txt');

         Open;

         if not(isEmpty) then Result := True;
      end;

   finally
      EscondeEspera;
   end;
end;



function TdtmAtualizacaoDiaria.ProcessaContratos(var MemResult          : TMemo;
                                                 var MemErro            : TMemo;
                                                 const bEstorna         : Boolean;
                                                 const dDataConsiderada : TDateTime
                                                ): Boolean;
var
   i                 : Integer;
   sMsg              : String;
   bGerou            : Boolean;
   bTransacao        : Boolean;
   iRegraTxJuros     : Int64;
   iIdContratoEmptmo : Extended;
   iContador         : Integer;
   bPossuiAtualizacao: Boolean;
   bEstornouParcela  : Boolean;
   iDia, iMes, iAno  : word;
begin

   i                 := 0;
   bGerou            := False;
   Result            := True;
   iIdContratoEmptmo := -1;
   bestornouParcela  := False;

   DecodeDate(dDataConsiderada, iAno, iMes, iDia);
   try
      with qryContratosGeracao do
      begin
         First;

         EscondeEspera;
         MostraFormProgresso('Processando Contratos...', 0, RecordCount, True, True);

         bTransacao := False;
         if not(dtmBaseDados.dbBaseDados.InTransaction) then
         begin
            StartTransacao;
            bTransacao := True;
         end;
         iContador := 0;

         while not(EOF) do
         begin
            Inc(iContador);
            inc(i);
            AndaFormProgresso(i);
            Application.ProcessMessages;

            if frmProgresso.Cancelou then
            begin
               sMsg := 'Processo interrompido pelo usuário.' + #13;
               if bGerou then
               begin
                  sMsg := sMsg + 'Entretanto, pelo menos um contrato foi atualizado.';
               end
               else
               begin
                  sMsg := sMsg + 'Não foi atualizado nenhum contrato.';
               end;

               MsgDlg(sMsg, 'Empréstimo', mtInformation, [mbOk], 0);
               Application.ProcessMessages;

               Result := False;
               Break;
            end;

            if qryContratosGeracaoDATACREDITO.AsDateTime = dDataAtualizacao then
            begin
               memErro.Lines.Add(FormatDateTime('dd/mm/yyyy', dDataAtualizacao) + ' - Contrato ' +
                                                qryContratosGeracaoIDCONTRATOEMPTMO.AsString +
                                               ' concedido em '+ qryContratosGeracaoDATACREDITO.AsString +
                                               '. Não sofrerá atualização nesta data.');
            end
            else
            begin
               bPossuiAtualizacao := VerificaAtualizacaoDiaria(qryContratosGeracaoIDCONTRATOEMPTMO.AsFloat, dDataAtualizacao);

               if (bPossuiAtualizacao) and not(bEstorna) then Continue;

               if bPossuiAtualizacao then
               begin
                  if not(bEstornouParcela) or
                     ( (bEstornouParcela) and (iIdContratoEmptmo > 0) ) then
                  begin
                     bEstornouParcela := EstornaParcelas(qryContratosGeracaoIDCONTRATOEMPTMO.AsFloat, DateToStr(dDataAtualizacao), DateToStr(dDataAtualizacao));
                  end;

                  LimpaParametros(qryParcelasEstorno);
                  qryParcelasEstorno.ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryContratosGeracaoIDCONTRATOEMPTMO.AsFloat;
                  qryParcelasEstorno.ParamByName('PHMEDATAATUALIZA').AsDateTime := dDataAtualizacao;
                  qryParcelasEstorno.ExecSql;

               end;

               iParcelaAtual    := 0;
               iParcelaRestante := 0;
               rSaldoDevAnt   := CalcEmptmo.SaldoDevAnt(qryContratosGeracaoIDContratoEmptmo.AsFloat,
                                                        dDataAtualizacao,
                                                        iAno,
                                                        iMes);

               fSaldo20        := rSaldoDevAnt.fSaldoDevAnt;
               dData20         := rSaldoDevAnt.dDataAtuAnt;
               iParcelaAtual     := rSaldoDevAnt.iParcelaAnt;
               iParcelaRestante  := rSaldoDevAnt.iParcRestaAnt;

               fSaldoAnt       := rSaldoDevAnt.fSaldoDevAnt;

               LimpaRegistroContrato(rContrato);
               LimpaRegistroConcessao(rConcessao);

               rContrato.IDContratoEmptmo  := qryContratosGeracaoIDContratoEmptmo.AsFloat;
               rContrato.IDPessoa          := qryContratosGeracaoIDPESSOA.AsInteger;
               rContrato.IDTipoContrEmptmo := qryContratosGeracaoIDTipoContrEmptmo.AsInteger;
               rContrato.IDTipoEmptmo      := qryContratosGeracaoIDTIPOEMPTMO.AsInteger;
               rContrato.IDPlanoPrev       := qryContratosGeracaoIDPLANOPREV.AsInteger;
               rContrato.IDPatro           := qryContratosGeracaoIDPATRO.AsInteger;
               rContrato.IDBenef           := qryContratosGeracaoIDBENEF.AsInteger;

               rContrato.NumParcelas       := qryContratosGeracaoNUMPARCELAS.AsInteger;

               rContrato.DataCredito       := qryContratosGeracaoDATACREDITO.AsDateTime;
               rContrato.DataSituacao      := qryContratosGeracaoDATASITUACAO.AsDateTime;
               rContrato.DataAssinatura    := qryContratosGeracaoDATAASSINATURA.AsDateTime;
               rContrato.DataPrimParc      := qryContratosGeracaoDATAPRIMPARC.AsDateTime;
               rContrato.DataCanc          := qryContratosGeracaoDATACANC.AsDateTime;
               rContrato.VlrContrato       := qryContratosGeracaoVLRCONTRATO.AsCurrency;
               rContrato.VlrParcela        := qryContratosGeracaoVLRPARCELA.AsCurrency;
               rContrato.Txjuros           := qryContratosGeracaoTXJUROS.AsCurrency;
               rContrato.FlgFormaRec       := qryContratosGeracaoFLGFORMAREC.AsString;
               rContrato.FlgFormaPag       := qryContratosGeracaoFLGFORMAPAG.AsString;

               rContrato.Indexador         := qryContratosGeracaoMOECODIGO.AsInteger;
               rContrato.SiglaIndexador    := qryContratosGeracaoMOESIGLA.AsString;

               iRegraTxJuros               := qryContratosGeracaoIDREGRAJURCONC.AsInteger;

               fTxJuros                    := rSaldoDevAnt.fTxJurosAnt;

               LimpaParametros(qryParcelasAberto);
               qryParcelasAberto.ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryContratosGeracaoIDCONTRATOEMPTMO.AsFloat;
               qryParcelasAberto.ParamByName('PHMEDATAPREVISTA').AsDateTime := dDataAtualizacao;
               qryParcelasAberto.Open;

               if GeraItensAtu then
               begin
                  if (i mod 500) = 0 then
                  begin
                     if (dtmBaseDados.dbBaseDados.InTransaction) and (bTransacao) then
                     begin
                        CommitTransacao;
                        StartTransacao;
                     end;
                  end;

                  bGerou := True;
               end
               else
               begin
                  RollBackTransacao;
               end;

               qryParcelasAberto.Close;

            end; {DataAtualiza = dia anterior}

            Next;
         end;
         memResult.Lines.Add('Nº de registros processados no filtro informado: ' + IntToStr(iContador));
      end;

   finally
      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
      EscondeFormProgresso;
   end;

end;




function TdtmAtualizacaoDiaria.VerificaAtualizacaoDiaria(const iIDContratoEmptmo : Extended; const dDataAtualizacao : TDateTime) : Boolean;
begin
   LimpaParametros(qryAux);
   qryAux.ParamByName('PIDCONTRATOEMPTMO').AsFloat   := iIDContratoEmptmo;
   qryAux.ParamByName('PHMEDATAPREVISTA').AsDateTime := dDataAtualizacao;
   qryAux.Open;

   Result := not(qryAux.IsEmpty);
end;



function TdtmAtualizacaoDiaria.EstornaParcelas(const iIdContratoEmptmo : Extended;
                                               const sDataInicial      : String;
                                               const sDataFinal        : String
                                              ): Boolean;
var
   sSQL              : String;
   sHistoricoContab  : String;
   sResult, sErro    : TStringList;
   iPlanilhaResult   : Integer;
   sMensagem         : String;
begin
   Result := True;

   sSQL :=
   'SELECT '                                                                                    + #13 +
   '  H.IDHISTMOVEMPTMO, H.IDCONTRATOEMPTMO, H.IDITEMEMPTMO, ITE.ITEDESCRICAO, '                + #13 +
   '  H.HMETIPOMOV, H.PLNCODIGO, '                                                              + #13 +
   '  H.HMEANOCOMPETENCIA, H.HMEMESCOMPETENCIA, '                                               + #13 +
   '  H.HMEDATAPREVISTA, H.HMEDATAEFETIVA, '                                                    + #13 +
   '  H.HMEANOCOBRANCA, H.HMEMESCOBRANCA, '                                                     + #13 +
   '  H.HMEVLRPREVISTO, H.HMEVLREFETIVO, '                                                      + #13 +
   '  H.HMESEQCOBRANCA, '                                                                       + #13 +
   '  H.HMEPARCELA, H.HMESALDODEV, H.HMETXJUROS, H.HMEFORMACOBRANCA,'                           + #13 +
   '  H.FLGESTORNADO, '                                                                         + #13 +
   '  TC.IDTIPOCONTREMPTMO, '                                                                   + #13 +
   '  C.IDPLANOPREV, '                                                                          + #13 +
   '  C.IDPATRO, '                                                                              + #13 +
   '  ITC.TIPCODIGO '                                                                           + #13 +
   'FROM '                                                                                      + #13 +
   '  HISTMOVEMPTMO   H,   '                                                                    + #13 +
   '  CONTRATOEMPTMO  C,   '                                                                    + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                    + #13 +
   '  ITEMEMPTMO      ITE, '                                                                    + #13 +
   '  TIPOCONTREMPTMO TC,  '                                                                    + #13 +
   '  TIPOEMPTMO      TE   '                                                                    + #13 +
   'WHERE '                                                                                     + #13 +
   '      ( H.HMETIPOMOV            = 5 ) '                                                     + #13 +
   '  AND ( NVL(HMECENTRALIZA, 0)   = 0 ) '                                                     + #13 +
   '  AND ( NVL(FLGESTORNADO, 0)    = 0 ) '                                                     + #13 +
   '  AND ( H.PLNCODIGOESTORNO      IS NULL ) '                                                 + #13 +
   '  AND ( H.PLNCODIGO             IS NOT NULL ) '                                             + #13;

   if iIdContratoEmptmo > 0 then sSql := sSql +
   '  AND ( C.IDCONTRATOEMPTMO      = ' + FloatToStr(iIdContratoEmptmo) + ' ) '                 + #13;

   sSql := sSql +
   '  AND ( H.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO ) '                                    + #13 +
   '  AND ( C.IDTIPOCONTREMPTMO     = TC.IDTIPOCONTREMPTMO ) '                                  + #13 +
   '  AND ( H.HMEDATAVENCTO        >= TO_DATE('+QuotedStr(sDataInicial)+',''dd/mm/yyyy'') )'    + #13 +
   '  AND ( H.HMEDATAVENCTO        <= TO_DATE('+QuotedStr(sDataFinal)+',''dd/mm/yyyy'') )'      + #13 +
   '  AND ( ITC.IDITEMEMPTMO        = H.IDITEMEMPTMO ) '                                        + #13 +
   '  AND ( ITE.IDITEMEMPTMO        = H.IDITEMEMPTMO ) '                                        + #13 +
   '  AND ( ITE.IDITEMEMPTMO        = ITC.IDITEMEMPTMO ) '                                      + #13 +
   '  AND ( ITC.IDTIPOCONTREMPTMO   = C.IDTIPOCONTREMPTMO ) '                                   + #13 +
   '  AND ( TC.IDTIPOEMPTMO         = TE.IDTIPOEMPTMO ) '                                       + #13;

   if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
   begin
       qryRetornaValor.Sql.Text := sSql;
       qryRetornaValor.Open;

       while not(qryRetornaValor.EOF) do
       begin
          if IntegraEmptmo.ExcluiContabil(qryRetornaValor.FieldByName('PLNCODIGO').AsInteger,sMensagem) <> 0 then
          begin
             sHistoricoContab := 'EMPRESTIMOS DE PARTICIPANTES - Estorno de Atualizacao de Saldo - Referencia ' + sDataInicial + ' - ' + sDataFinal ;

             if IntegraEmptmo.ContabilizaItens('C',
                                               'E',
                                               sSQL,
                                               sHistoricoContab,
                                               SysDate,
                                               sResult,
                                               sErro,
                                               iPlanilhaResult
                                              ) < 0 then
             begin
                Result := False;
                MsgDlg('Erro no estorno Contábil.', 'Empréstimo', mtInformation, [mbOK], 0);
                Application.ProcessMessages;
             end
             else
             begin

             end;
          end;
          qryRetornaValor.Next;
       end;
       qryRetornaValor.Close;
   end;
end;



function TdtmAtualizacaoDiaria.GeraItensAtu: Boolean;
var
   sCompetencia      : String;
   sAno              : String;
   sMes              : String;
   iIdHistMovEmptmo  : Extended;
   i                 : Integer;
   dVencimento       : TDateTime;
   dVencimentoAnt    : TDateTime;
   fValorEmAberto    : Currency;
   fValorEmAbertoAnt : Currency;
   fValorProvisao    : Currency;
   rSitPart          : TSitPart;
begin
   Result := True;

   try
      try

         sAno := IntToStr(DiasUteis.ExtraiAno(dDataAtualizacao));
         sMes := IntToStr(DiasUteis.ExtraiMes(dDataAtualizacao));

         if Length(sMes) = 1 then sMes := '0' + sMes;

         sCompetencia := sAno + sMes;

         dVencimento       := dDataAtualizacao;
         fValorEmAberto    := 0;
         dVencimentoAnt    := dDataAtualizacao;
         fValorEmAbertoAnt := 0;
         fValorProvisao    := 0;

         // Pega os dados das parcelas do dia anterior a data em processamento
         LimpaParametros(dtmCalcEmptmo.qryParcelasEmAberto);
         dtmCalcEmptmo.qryParcelasEmAberto.ParamByname('PIDCONTRATOEMPTMO').AsFloat   := rContrato.IDContratoEmptmo;
         dtmCalcEmptmo.qryParcelasEmAberto.ParamByname('PHMEDATAPREVISTA').AsDateTime := dDataAtualizacao - 1;
         dtmCalcEmptmo.qryParcelasEmAberto.Open;

         fValorEmAbertoAnt := dtmCalcEmptmo.qryParcelasEmAbertoVALOR_DEVIDO.AsCurrency;
         dtmCalcEmptmo.qryParcelasEmAberto.Close;

         LimpaParametros(dtmCalcEmptmo.qryParcelasAtrasadas);
         dtmCalcEmptmo.qryParcelasAtrasadas.ParamByname('PIDCONTRATOEMPTMO').AsFloat   := rContrato.IDContratoEmptmo;
         dtmCalcEmptmo.qryParcelasAtrasadas.ParamByname('PHMEDATAPREVISTA').AsDateTime := dDataAtualizacao - 1;
         dtmCalcEmptmo.qryParcelasAtrasadas.Open;

         dVencimentoAnt    := dtmCalcEmptmo.qryParcelasAtrasadasHMEDATAPREVISTA.AsDateTime;
         dtmCalcEmptmo.qryParcelasAtrasadas.Close;

         // Pega os dados das parcelas do dia em processamento
         LimpaParametros(dtmCalcEmptmo.qryParcelasNaoPagas);
         dtmCalcEmptmo.qryParcelasNaoPagas.ParamByname('PIDCONTRATOEMPTMO').AsFloat   := rContrato.IDContratoEmptmo;
         dtmCalcEmptmo.qryParcelasNaoPagas.Open;

         dVencimento    := dtmCalcEmptmo.qryParcelasNaoPagasHMEDATAPREVISTA.AsDateTime;
         dtmCalcEmptmo.qryParcelasNaoPagas.Close;

         LimpaParametros(qryParcelasNaoPagas);
         qryParcelasNaoPagas.ParamByname('PIDCONTRATOEMPTMO').AsFloat   := rContrato.IDContratoEmptmo;
         qryParcelasNaoPagas.Open;
         fValorEmAberto := dtmCalcEmptmo.qryParcelasNaoPagasHMEVLRPREVISTO.AsCurrency;
         qryParcelasNaoPagas.Close;

         rSitPart := FuncoesEmptmo.BuscaSitPart(rContrato.IDPessoa);


         CalcEmptmo.CalculaItens(rContrato, rConcessao,
                      5, // Evento = atualização
                      5, // Origem = atualização
                      iPais,
                      sEstado,
                      iCidade, iParcelaAtual, rSitPart.IDSitPart,
                      rContrato.FlgFormaRec,
                      fTxJuros, fSaldoAnt,
                      0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                      0, 0, 0,
                      dDataAtualizacao, dDataAtualizacao,
                      FormatDateTime('YYYYMM', dDataAtualizacao),
                      True, False,
                      False,
                      vItens,  0, 0, 0,
                      True,
                      0,
                      0 , -1,
                      False,
                      fValorEmAberto,
                      dVencimentoAnt,
                      fValorEmAbertoAnt,
                      fValorProvisao,
                      fSaldo20,
                      True);


         CalcEmptmo.GravaMovEmptmo(rContrato,
                        vItens,
                        5(* = atualização *),
                        iParcelaAtual,
                        DiasUteis.ExtraiAno(dDataAtualizacao),
                        DiasUteis.ExtraiMes(dDataAtualizacao),
                        DiasUteis.ExtraiAno(dDataAtualizacao),
                        DiasUteis.ExtraiMes(dDataAtualizacao),
                        iParcelaRestante, 
                        dDataAtualizacao, dDataAtualizacao,
                        '',
                        '',
                        False);


      except
         Raise;
         Application.ProcessMessages;
         Result := False;
      end;

   finally
      (* Limpa o registro com os dados do Contrato *)
      LimpaRegistroContrato(rContrato);
      LimpaRegistroConcessao(rConcessao);
   end;

end;



function TdtmAtualizacaoDiaria.Contabiliza(const sDataAtualiza    : String;
                                           const sTipoEmptmo      : String;
                                           const sTipoContrEmptmo : String;
                                           const sPatro           : String;
                                           const sPlano           : String
                                          ): Integer;
var
   sResult     : TStringList;
   sErro       : TStringList;
   sSQL        : String;
   sHistorico  : String;
   iPlanilha   : Integer;
begin
   // monta o select que será passado para para a função de contabilização
   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   H.IDHISTMOVEMPTMO, '                                                                        + #13 +
   '   H.IDCONTRATOEMPTMO, TC.IDTIPOCONTREMPTMO, '                                                 + #13 +
   '   DECODE(C.IDPLANOORIGEM,NULL,C.IDPLANOPREV,C.IDPLANOORIGEM) AS IDPLANOPREV, '                + #13 +
   '   C.IDPATRO, '                                                                                + #13 +
   '   H.IDITEMEMPTMO, ITE.ITEDESCRICAO, H.IDITEMCENTRALIZA, '                                     + #13 +
   '   ( TO_CHAR(H.HMEDATAATUALIZA, ''YYYYMM'' ) '   {Anteriormente era passada a competencia}     + #13 +
   '   ) AS ANOMES, '                                                                              + #13 +
   '   H.HMEFORMACOBRANCA, '                                                                       + #13 +
   '   H.HMEVLRPREVISTO, H.HMEVLREFETIVO, '                                                        + #13 +
   '   ITC.TIPCODIGO '                                                                             + #13 +

   'FROM '                                                                                         + #13 +
   '   HISTMOVEMPTMO   H,   '                                                                      + #13 +
   '   CONTRATOEMPTMO  C,   '                                                                      + #13 +
   '   ITEMXTIPOCONTR  ITC, '                                                                      + #13 +
   '   ITEMEMPTMO      ITE, '                                                                      + #13 +
   '   TIPOCONTREMPTMO TC,  '                                                                      + #13 +
   '   TIPOEMPTMO      TE   '                                                                      + #13 +

   'WHERE '                                                                                        + #13 +
   '       ( C.FLGSITUACAO          IN (''A'', ''J'')) '                                           + #13 +
   '   AND ( (H.HMECENTRALIZA       = 0) OR (H.HMECENTRALIZA IS NULL) ) '                          + #13 +
   '   AND ( H.HMETIPOMOV           = 5 ) '                                                        + #13 +
   '   AND ( H.HMEORIGEM            = 5 ) '                                                        + #13 +
   '   AND ( H.HMEDATAATUALIZA      = TO_DATE(' + QuotedStr(sDataAtualiza) + ',''DD/MM/YYYY'') )'  + #13 +
   '   AND ( H.PLNCODIGO            IS NULL ) '                                                    + #13 +
   '   AND ( H.PLNCODIGOESTORNO     IS NULL) '                                                     + #13 +
   '   AND ( H.FLGESTORNADO         IS NULL ) '                                                    + #13;

   if iIDContratoEmptmo > 0 then sSQL := sSQL +
   '   AND ( C.IDCONTRATOEMPTMO     = ' + FloatToStr(iIDContratoEmptmo) + ' ) '                    + #13;

   if sTipoEmptmo <> '' then sSQL := sSQL +
   '   AND ( TC.IDTIPOEMPTMO        = ' + sTipoEmptmo + ' ) '                                      + #13;

   if sTipoContrEmptmo <> '' then sSQL := sSQL +
   '   AND ( C.IDTIPOCONTREMPTMO    = ' + sTipoContrEmptmo + ' ) '                                 + #13 +
   '   AND ( TC.IDTIPOCONTREMPTMO   = ' + sTipoContrEmptmo + ' ) '                                 + #13;

   if sPatro <> '' then sSQL := sSQL +
   '   AND ( C.IDPATRO              IN (' + sPatro + ') ) '                                                  + #13;

   if sPlano <> '' then sSQL := sSQL +
   '   AND ( C.IDPLANOPREV          IN (' + sPlano + ') ) '                                        + #13;


   sSQL := sSQL +
   '   AND ( TE.IDEMPRESAPROP       = ' + IntToStr (Sistema.IDEmpresa) + ' ) '                     + #13 +
   '   AND ( H.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO ) '                                       + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO ) '                                     + #13 +
   '   AND ( TC.IDTIPOEMPTMO        = TE.IDTIPOEMPTMO ) '                                          + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO ) '                                    + #13 +
   '   AND ( H.IDITEMEMPTMO         = ITC.IDITEMEMPTMO ) '                                         + #13 +
   '   AND ( H.IDITEMEMPTMO         = ITE.IDITEMEMPTMO ) '                                         + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                         + #13 +

   'ORDER BY '                                                                                     + #13 +
   '   H.HMEDATAATUALIZA, H.IDCONTRATOEMPTMO ';


   // prepara o Histórico-padrão que será passado adiante
   sHistorico  := 'EMPRESTIMOS DE PARTICIPANTES - Atualizacao de Saldo, ref: ' +
                  IntToStr(DiasUteis.ExtraiMes(dDataAtualizacao)) + '/' +
                  IntToStr(DiasUteis.ExtraiAno(dDataAtualizacao));

   if sTipoContrEmptmo <> '' then  sHistorico := sHistorico + ', para contratos do tipo ' + sTipoContrEmptmo + '.';

   // ----------------------------------------------------------------------------------------------

   // chama a função de contabilização passando o SQL acima
   Result := IntegraEmptmo.ContabilizaItens('C',
                                            'N',
                                            sSQL,
                                            sHistorico,
                                            dDataAtualizacao,
                                            sResult,
                                            sErro,
                                            iPlanilha
                                           );

   // ----------------------------------------------------------------------------------------------
end;



function TdtmAtualizacaoDiaria.AtualizaPlanilha(const iPlanilha : Integer; sDataAtualiza, sDataFinal : String) : Boolean;
var
   sSQL              : String;
begin
   Result := True;
end;



function TdtmAtualizacaoDiaria.CalculaItens(const rContrato           : TDadosContrato;
                                            const iEvento             : Integer;
                                            const iOrigem             : Integer;
                                            const iPais               : Integer;
                                            const sEstado             : String;
                                            const iCidade             : Integer;
                                            const sFormaCobranca      : String;
                                            const fTxJuros,
                                                  fSaldoDev,
                                                  fVlrMaxPermit       : Currency;
                                            const dDataRef            : TDateTime;
                                            const dDataAtualiza       : TDateTime;
                                            const bInterrompe         : Boolean;
                                            const bMostraMsg          : Boolean;
                                            const bMostraProgresso    : Boolean;
                                            var   vLista              : TListaItem;
                                            const bAlteraSaldoDev     : Boolean = True;
                                            const fVlrContratosAnt    : Currency = 0;
                                            const fVlrDividas         : Currency = 0;
                                            const dDataAtraso         : TDateTime = 0;
                                            const fValorEmAberto      : Currency = 0;
                                            const dDataAtrasoAnt      : TDateTime = 0;
                                            const fValorEmAbertoAnt   : Currency = 0;
                                            const fValorProvisao      : Currency = 0;
                                            const fSaldo20            : Currency = 0;
                                            const dData20             : TDateTime = -1
                                           ): Boolean;
var
   i                       : Integer;
   sSQL, sValor            : String;
   fNovoSaldoDev           : Currency;
begin
   Result := True;

   fNovoSaldoDev := fSaldoDev;

   try
      try
         with dtmCalcEmptmo.qryBuscaItens do
         begin
            LimpaParametros(dtmCalcEmptmo.qryBuscaItens);
            ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := rContrato.IDTipoContrEmptmo;
            ParamByName('PEVENTO').AsInteger             := iEvento;
            Open;

            First;
         end;

         sValor   := '0';
         sSQL     := '';
         i        := 0;

         if bMostraProgresso then MostraFormProgresso('Calculando Itens...', 0, dtmCalcEmptmo.qryBuscaItens.RecordCount, True, True);

         // Laço que calcula todos os itens
         while not(dtmCalcEmptmo.qryBuscaItens.EOF) do
         begin
            if bMostraProgresso then
            begin
               AndaFormProgresso(i);
               if frmProgresso.Cancelou then Exit;
            end;
            sSQL :=
            'SELECT ' + #13 +
            '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                       + ' AS IDCONTRATOEMPTMO, ' + #13 +
            '  ' + IntToStr(dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger)                  + ' AS IDPAIS, '           + #13 +
            '  ' + QuotedStr(dtmEmptmo.qryParamEmptmoCODESTADO.AsString)               + ' AS CODESTADO, '        + #13 +
            '  ' + IntToStr(dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger)               + ' AS IDCIDADES, '        + #13 +
            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger)         + ' AS IDITEMEMPTMO, '     + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataRef))                   + ' AS DATAREF, '          + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito))      + ' AS DATACREDITO, '      + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtualiza))              + ' AS DATAULTATUALIZA, '  + #13 +
            '  ' + NumeroIngles(fTxJuros)                                              + ' AS TXJUROS, '          + #13 +
            '  ' + NumeroIngles(fNovoSaldoDev)                                         + ' AS SALDODEV, '         + #13 +
            '  ' + NumeroIngles(fVlrMaxPermit)                                         + ' AS VLRMAXPERMIT, '     + #13 +
            '  ' + IntToStr(dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger)         + ' AS IDITEMEMPTMO, '     + #13 +
            '  ' + NumeroIngles(fSaldoDev)                                             + ' AS SALDODEVANT, '      + #13 +
            '  ' + NumeroIngles(fValorProvisao)                                        + ' AS VALORPROVISAO, '    + #13 +
            '  ' + NumeroIngles(fSaldo20)                                              + ' AS SALDO20, '          + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataAtraso))                 + ' AS DATAATRASO, '       + #13 +
            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',dData20))                     + ' AS DATA20, '           + #13 +
            '  ' + NumeroIngles(fValorEmAbertoAnt)                                     + ' AS VALOREMABERTOANT '  + #13 +
            'FROM '                                                                                   + #13 +
            '  DUAL '                                                                                 + #13;

            if not(UtilizaRegraValor(dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsInteger,
                                     sSQL,
                                     'e ' + dtmCalcEmptmo.qryBuscaItensITEDESCRICAO.AsString,
                                     sValor,
                                     True,
                                     False,
                                     True
                                    )) then
            begin
               Result := False;
               if bInterrompe then Exit;
            end;

            if (sValor = 'NULO') then
            begin
               dtmCalcEmptmo.qryBuscaItens.Next;

               inc(i);

               if bMostraProgresso then AndaFormProgresso(i);
               Continue;
            end
            else
            begin
               SetLength(vLista, i + 1);

               vLista[i].CodigoItem       := dtmCalcEmptmo.qryBuscaItensIDITEMEMPTMO.AsInteger;
               vLista[i].Nome             := dtmCalcEmptmo.qryBuscaItensITEDESCRICAO.AsString;
               vLista[i].iEvento          := dtmCalcEmptmo.qryBuscaItensITCEVENTO.AsInteger;
               vLista[i].Origem           := iOrigem;

               vLista[i].SeqCalculo       := dtmCalcEmptmo.qryBuscaItensITCSEQCALCULO.AsInteger;
               vLista[i].SeqCobranca      := 1;
               vLista[i].Prioridade       := dtmCalcEmptmo.qryBuscaItensITCPRIORIDADE.AsInteger;

               vLista[i].FlgCentraliza    := dtmCalcEmptmo.qryBuscaItensFLGCENTRALIZA.AsInteger;
               vLista[i].FlgDestacado     := dtmCalcEmptmo.qryBuscaItensFLGDESTACADO.AsInteger;
               vLista[i].IdItemCentraliza := dtmCalcEmptmo.qryBuscaItensIDITEMCENTRALIZA.AsInteger;

               vLista[i].RecPag           := dtmCalcEmptmo.qryBuscaItensITCRECPAG.AsString;

               vLista[i].Regra            := dtmCalcEmptmo.qryBuscaItensIDREGRACALC.AsInteger;
               vLista[i].FlgGravaZERO     := (dtmCalcEmptmo.qryBuscaItensFLGGRAVAZERO.AsInteger = 1);

               if (sValor <> 'NULO') then
               begin
                  vLista[i].Valor    := StrToFloat(ConverteVirg(sValor))
               end
               else
               begin
                  vLista[i].Valor    := 0;
               end;
            end;

            // calcula o novo saldo devedor
            case dtmCalcEmptmo.qryBuscaItensITCTRATASALDODEV.AsInteger of
               0: begin (* Não Tratar *) end;
               1: fNovoSaldoDev := fNovoSaldoDev - vLista[i].Valor; (* Abater *)
               2: fNovoSaldoDev := fNovoSaldoDev + vLista[i].Valor; (* Incorporar *)
            end;

            if bAlteraSaldoDev then
            begin
               vLista[i].SaldoDevedor     := fNovoSaldoDev;
            end
            else
            begin
               vLista[i].SaldoDevedor     := fSaldoDev;
            end;

            vLista[i].TxJuros          := fTxJuros;

            vLista[i].FormaCobranca    := sFormaCobranca;

            vLista[i].FlgEnvio         := -1;
            vLista[i].FlgBaixado       := -1;
            vLista[i].FlgDivergPend    := -1;

            if not(dtmCalcEmptmo.qryBuscaItensIDPROVENTON.IsNull) then
               vLista[i].Rubrica          := dtmCalcEmptmo.qryBuscaItensIDPROVENTON.AsInteger
            else
               vLista[i].Rubrica          := -1;

            inc(i);

            dtmCalcEmptmo.qryBuscaItens.Next;
         end; (* while *)

      except
         if bMostraMsg then
         begin
            Raise;
            MsgDlg('Ocorreu um erro na Busca de Valores de um Item', 'Empréstimo', mtError, [mbOk], 0);
         end;
         dtmCalcEmptmo.qryBuscaItens.Close;
         Result := False;
      end;
   finally
      dtmCalcEmptmo.qryBuscaItens.Close;
      if bMostraProgresso then EscondeFormProgresso;
   end;
end;



function TdtmAtualizacaoDiaria.GravaMovEmptmo(const rContrato               : TDadosContrato;
                                              vLista                        : TListaItem;
                                              const iEvento                 : Integer;
                                              const iParcela                : Integer;
                                              const iAnoCompetencia         : Integer;
                                              const iMesCompetencia         : Integer;
                                              const iAnoCobranca            : Integer;
                                              const iMesCobranca            : Integer;
                                              const iParcelasRemanescentes  : Integer;
                                              const dDataPrevista           : TDateTime;
                                              const dDataUltAtualiza        : TDateTime;
                                              const sFormaEnvio             : String;
                                              const sTipoFolha              : String;
                                              const bMostraProgresso        : Boolean
                                             ): Boolean;
var
   i        : Integer;
begin
   Result := False;

   try

      if bMostraProgresso then MostraFormProgresso('Gravando Itens...', 0, High(vLista), False, False);

      // -------------------------------------------------------------------------------------------

      for i := 0 to High(vLista) do
      begin
         if bMostraProgresso then
         begin
            AndaFormProgresso(i + 1);           // Atualizando a Barra de Progresso
            if frmProgresso.Cancelou then Exit; // Verifica se o usuário Cancelou a Operação
         end;

         // Verifica qual tipo de item para decidir se grava ou não
         if ( vLista[i].iEvento = iEvento ) then
         begin
            if iParcela > -1        then vLista[i].Parcela          := iParcela;
            if iAnoCompetencia > -1 then vLista[i].AnoCompetencia   := iAnoCompetencia;
            if iMesCompetencia > -1 then vLista[i].MesCompetencia   := iMesCompetencia;

            vLista[i].AnoCobranca      := iAnoCobranca;
            vLista[i].MesCobranca      := iMesCobranca;
            vLista[i].DataPrevista     := dDataPrevista;
            vLista[i].DataUltAtualiza  := dDataUltAtualiza;

            vLista[i].FlgEnvio         := -1;
            // -------------------------------------------------------------------------------------
            if sFormaEnvio <> '' then vLista[i].FormaCobranca := sFormaEnvio;

            if vLista[i].FormaCobranca = 'F' then
            begin
               if sTipoFolha <> '' then
               begin
                  vLista[i].TipoFolha := sTipoFolha;
               end
               else
               begin
                  vLista[i].TipoFolha := 'P';
               end;

               if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then vLista[i].TipoFolha := '';
            end;
            // -------------------------------------------------------------------------------------

            if iParcelasRemanescentes > -1 then vLista[i].ParcResta  := iParcelasRemanescentes;

            (* função que grava as informações pertinentes a um contrato no histórico de movimento
               de Empréstimo (tabela HISTMOVEMPTMO), tendo como saída True se a operação foi
               bem sucedida e False caso negativo *)
            if not(InsertMovEmptmo(vLista[i], rContrato)) then Exit;

         end; (* if FlgCobralib *)

      end; (* for *)

      (* se for inserção, incluir o Fiário *)
   finally
      if bMostraProgresso then EscondeFormProgresso;
   end;
end;



function TdtmAtualizacaoDiaria.InsertMovEmptmo(const ItemContrato     : TItemRecDep;
                                               const rContrato        : TDadosContrato
                                               ): Boolean;
var
   sMsgErro : String;
begin

   // André Pontes - 12/09/2003

   // ----------------------------------------------------------------------------------------------
   //    Verificação de inserção de valor ZERO
   //
   //    Se o valor PREVISTO for = ZERO, verifica se o item deve ser gravado:
   //       - se o valor EFETIVO for <> ZERO, grava sempre
   //       - senão, verifica a parametrização do item para saber se deve gravar
   // ----------------------------------------------------------------------------------------------

   if (ItemContrato.Valor = 0) and
      (ItemContrato.ValorEfetivo = 0) and
      not(ItemContrato.FlgGravaZERO) then
   begin
      Result := True;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------
   //    FIM Verificação de inserção de valor ZERO
   // ----------------------------------------------------------------------------------------------

   // FIM André Pontes - 12/09/2003

   with qryInsertHistMovEmptmo do
   begin
      LimpaParametros(qryInsertHistMovEmptmo);

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      if rContrato.IDContratoEmptmo > 0      then ParamByName('PIDCONTRATOEMPTMO').AsFloat      := rContrato.IDContratoEmptmo;
      // -------------------------------------------------------------------------------------------
      if ItemContrato.Parcela > -1           then ParamByName('PHMEPARCELA').AsInteger          := ItemContrato.Parcela;
      if ItemContrato.ParcResta > -1         then ParamByName('PHMENUMPARCELAS').AsInteger      := ItemContrato.ParcResta;
      // -------------------------------------------------------------------------------------------
      if ItemContrato.iEvento > -1           then ParamByName('PHMETIPOMOV').AsInteger          := ItemContrato.iEvento;
      if ItemContrato.Origem > -1            then ParamByName('PHMEORIGEM').AsInteger           := ItemContrato.Origem;
      // -------------------------------------------------------------------------------------------
      if ItemContrato.CodigoItem <> -1       then ParamByName('PIDITEMEMPTMO').AsInteger        := ItemContrato.CodigoItem;
      if ItemContrato.RecPag <> ''           then ParamByName('PHMERECPAG').AsString            := ItemContrato.RecPag;
      // -------------------------------------------------------------------------------------------
      if ItemContrato.FormaCobranca <> ''    then ParamByName('PHMEFORMACOBRANCA').AsString     := ItemContrato.FormaCobranca;

      // só grava HMETIPOFOLHA se a forma de cobrança for Folha
      if ItemContrato.FormaCobranca = 'F' then
         if ItemContrato.TipoFolha     <> '' then ParamByName('PHMETIPOFOLHA').AsString         := ItemContrato.TipoFolha;
      // -------------------------------------------------------------------------------------------
      if ItemContrato.FlgCentraliza > -1     then ParamByName('PHMECENTRALIZA').AsInteger       := ItemContrato.FlgCentraliza;
      if ItemContrato.FlgDestacado > -1      then ParamByName('PHMEDESTACADO').AsInteger        := ItemContrato.FlgDestacado;
      if ItemContrato.IdItemCentraliza > 0   then ParamByName('PIDITEMCENTRALIZA').AsInteger    := ItemContrato.IdItemCentraliza;
      // -------------------------------------------------------------------------------------------
      // Nesse momento, grava tanto na HmeDataPrevista quanto na HmeDataVencto
      if ItemContrato.DataPrevista <> 0      then
      begin
                                                  ParamByName('PHMEDATAPREVISTA').AsDateTime    := ItemContrato.DataPrevista;
                                                  ParamByName('PHMEDATAVENCTO').AsDateTime      := ItemContrato.DataPrevista;
      end;

      // Porém, se a data de vencimento estiver preenchida, é a que vale
      if ItemContrato.DataVencto    > 0      then ParamByName('PHMEDATAVENCTO').AsDateTime      := ItemContrato.DataVencto;
      if ItemContrato.DataEfetiva  > 0       then ParamByName('PHMEDATAEFETIVA').AsDateTime     := ItemContrato.DataEfetiva;
      if ItemContrato.DataReceb  > 0         then ParamByName('PHMEDATARECEB').AsDateTime       := ItemContrato.DataReceb;
      // -------------------------------------------------------------------------------------------
      if ItemContrato.DataUltAtualiza  > 0   then ParamByName('PHMEDATAATUALIZA').AsDateTime    := ItemContrato.DataUltAtualiza;
      // -------------------------------------------------------------------------------------------
      if ItemContrato.AnoCompetencia > -1     then ParamByName('PHMEANOCOMPETENCIA').AsInteger   := ItemContrato.AnoCompetencia;
      if ItemContrato.MesCompetencia > -1     then ParamByName('PHMEMESCOMPETENCIA').AsInteger   := ItemContrato.MesCompetencia;
      if ItemContrato.AnoCobranca > -1        then ParamByName('PHMEANOCOBRANCA').AsInteger      := ItemContrato.AnoCobranca;
      if ItemContrato.MesCobranca > -1        then ParamByName('PHMEMESCOBRANCA').AsInteger      := ItemContrato.MesCobranca;
      // -------------------------------------------------------------------------------------------
   (* if ItemContrato.SaldoDevedor <> 0 then *)   ParamByName('PHMESALDODEV').AsCurrency        := ItemContrato.SaldoDevedor;
   (* if ItemContrato.TxJuros <> 0      then *)   ParamByName('PHMETXJUROS').AsCurrency         := ItemContrato.TxJuros;
      // -------------------------------------------------------------------------------------------
   (* if ItemContrato.Valor <> 0        then *)   ParamByName('PHMEVLRPREVISTO').AsCurrency     := ItemContrato.Valor;
      if ItemContrato.ValorEfetivo <> 0      then ParamByName('PHMEVLREFETIVO').AsCurrency      := ItemContrato.ValorEfetivo;

      // grava valor efetivo ZERO apenas se o valor previsto também for ZERO
      if (ItemContrato.ValorEfetivo = 0) and (ItemContrato.Valor = 0) then
      begin
                                                  ParamByName('PHMEVLREFETIVO').AsCurrency      := 0;
      end;
      // -------------------------------------------------------------------------------------------
      if ItemContrato.Regra > 0              then ParamByName('PIDREGRA').AsInteger             := ItemContrato.Regra
      else                                        ParamByName('PIDREGRA').Clear;

      // IDRUBRICA -> Será o IDProvento NORMAL do Item a ser gravado
      if ItemContrato.Rubrica > 0            then ParamByName('PIDRUBRICA').AsInteger           := ItemContrato.Rubrica
      else                                        ParamByName('PIDRUBRICA').Clear;

      if ItemContrato.SeqCobranca > -1       then ParamByName('PHMESEQCOBRANCA').AsInteger      := ItemContrato.SeqCobranca;

      if ItemContrato.FlgEnvio > -1          then ParamByName('PFLGENVIO').AsInteger            := ItemContrato.FlgEnvio;
      if ItemContrato.FlgBaixado > -1        then ParamByName('PFLGBAIXADO').AsInteger          := ItemContrato.FlgBaixado;
      if ItemContrato.FlgDivergPend > -1     then ParamByName('PFLGDIVERGPEND').AsInteger       := ItemContrato.FlgDivergPend;

      if ItemContrato.Prioridade > -1        then ParamByName('PHMEPRIORIDADE').AsInteger       := ItemContrato.Prioridade;

      if ItemContrato.FlgTipoDiverg > -1     then ParamByName('PFLGTIPODIVERG').AsInteger       := ItemContrato.FlgTipoDiverg;
      // -------------------------------------------------------------------------------------------
                                                  ParamByName('PVERSAO').AsString               := Sistema.Versao;
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      try
         ExecSQL;
         Result := True;
      except
         on E:Exception do
         begin
            Result := False;
            sMsgErro := 'Ocorreu um erro na Gravação do Histórico: ' + E.Message;
            MsgDlg(sMsgErro, 'Empréstimo', mtError, [mbOk], 0);
         end;
      end;

   end; // with dtmEmptmo.qryInsertHistMovEmptmo
end;



function TdtmAtualizacaoDiaria.ProcessaContratoPeriodo(const IDContratoEmptmo : Extended;
                                                       var   MemResult        : TMemo;
                                                       var   MemErro          : TMemo;
                                                       const bEstorna         : Boolean;
                                                       const bAtualizaSaldo   : Boolean;
                                                       const dDataConsiderada : TDateTime;
                                                       const dDataInicial     : TDateTime;
                                                       const dDataFinal       : TDateTime;
                                                       var   iTotalDias       : Integer;
                                                       const bCommit          : Boolean
                                                      ): boolean;
var
   i                    : Integer;
   iLista               : Integer;
   sMsg                 : String;
   bGerou               : Boolean;
   iRegraTxJuros        : Int64;
   iIdContratoEmptmo    : Extended;
   iContador            : Integer;
   bPossuiAtualizacao   : Boolean;
   bEstornouParcela     : Boolean;
   dVencimento          : TDateTime;
   dVencimentoAnt       : TDateTime;
   dDataAjuste          : TDateTime;
   fValorEmAberto       : Currency;
   fValorEmAbertoAnt    : Currency;
   fValorProvisao       : Currency;
begin
   iTotalDias        := 0;
   i                 := 0;
   bGerou            := False;  // nenhuma parcela gerada ainda
   Result            := True;
   bestornouParcela  := False;
end;



function TdtmAtualizacaoDiaria.GeraItensPeriodo(const dDataAtualizacao  : TDateTime;
                                                const fValorProvisao    : Currency;
                                                const fValorEmAbertoAnt : Currency;
                                                const dVencimentoAnt    : TDateTime;
                                                const dVencimento       : TDateTime;
                                                const fVAlorEmAberto    : Currency
                                                ): Boolean;
var
   sCompetencia      : String;
   sAno              : String;
   sMes              : String;
   iIdHistMovEmptmo  : Extended;
   i                 : Integer;
begin
   Result := True;

   try
      try

         sAno := IntToStr(DiasUteis.ExtraiAno(dDataAtualizacao));
         sMes := IntToStr(DiasUteis.ExtraiMes(dDataAtualizacao));

         if Length(sMes) = 1 then sMes := '0' + sMes;

         sCompetencia := sAno + sMes;

         CalculaItens(rContrato,
                      5, // Evento = atualização
                      5, // Origem = atualização
                      iPais,
                      sEstado,
                      iCidade,
                      rContrato.FlgFormaRec,
                      fTxJuros,
                      fSaldoAnt,
                      qryParcelasAbertoTOTAL.AsCurrency, (* Coloca o total de débitos no campo de Vlr Max Permit *)
                      dDataAtualizacao,
                      dDataAtualizacao,
                      True (* interrompe *),
                      False (* mostra msg *),
                      False (* mostra progresso *),
                      vItens,
                      True,
                      0,
                      0 ,
                      dVencimento,
                      fValorEmAberto,
                      dVencimentoAnt,
                      fValorEmAbertoAnt,
                      fValorProvisao,
                      fSaldo20,
                      dData20);


         GravaMovEmptmo(rContrato,
                        vItens,
                        5(* = atualização *),
                        iParcelaAtual,
                        DiasUteis.ExtraiAno(dDataAtualizacao),
                        DiasUteis.ExtraiMes(dDataAtualizacao),
                        DiasUteis.ExtraiAno(dDataAtualizacao),
                        DiasUteis.ExtraiMes(dDataAtualizacao),
                        rContrato.NumParcelas, (* nº de parcelas remanescentes *)
                        dDataAtualizacao,
                        dDataAtualizacao,
                        '',
                        '',
                        False
                       );

      except
         Raise;
         Application.ProcessMessages;
         Result := False;
      end;

   finally
   end;
end;




function TdtmAtualizacaoDiaria.UltimaAtuDia(const IDContrato : Extended;
                                            const dData      : TDateTime
                                           ): TDateTime;
begin
   with qryUltAtuDia do
   begin
      LimpaParametros(qryUltAtuDia);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat        := IDContrato;

      if dData > 0 then
      begin
         ParamByName('PHMEDATAATUALIZA').AsDateTime   := dData;
      end;

      Open;

      Result := qryUltAtuDiaHMEDATAATUALIZA.AsDateTime;

      Close;
   end;
end;



procedure TdtmAtualizacaoDiaria.ExecutaAtuDia(const IDContrato      : Extended;
                                              const IDModulo        : Integer;
                                              const iTipoContr      : Integer;
                                              const iTipoEmptmo     : Integer;
                                              const iPatro          : Integer;
                                              const iPlano          : Integer;
                                              const iEstorna        : Integer;
                                              const iProvPerda      : Integer;
                                              const iAtuSaldo       : Integer;
                                              const iInArquivo      : Integer;
                                              const iNotInArquivo   : Integer;
                                              const dDataIni        : TDateTime;
                                              const dDataFim        : TDateTime;
                                              const dDataConsidera  : TDateTime
                                             );
begin
   with dtmAtualizacaoDiaria.spAtualizaDiaria do
   begin
      ParamByName('iContrato').AsFloat          := IDContrato;
      ParamByName('iModulo').AsFloat            := IDModulo;
      ParamByName('iTipoEmptmo').AsFloat        := iTipoEmptmo;
      ParamByName('iTipoContrato').AsFloat      := iTipoContr;
      ParamByName('iPatro').AsFloat             := iPatro;
      ParamByName('iPlano').AsFloat             := iPlano;
      ParamByName('bEstorna').AsFloat           := iEstorna;
      ParamByName('iCalculaProv').AsFloat       := iProvPerda;
      ParamByName('bAtualizaSaldo').AsFloat     := iAtuSaldo;

      ParamByName('bInArquivo').AsFloat         := iInArquivo;
      ParamByName('bNotInArquivo').AsFloat      := iNotInArquivo;

      ParamByName('dDataInicial').AsDate        := dDataIni;
      ParamByName('dDataFinal').AsDate          := dDataFim;
      ParamByName('dDataConsidera').AsDate      := dDataConsidera;

      ParamByName('iEmpresa').AsFloat           := Sistema.IDEmpresa;

      if not(Prepared) then Prepare;
      ExecProc;
   end;  // with dtmAtualizacaoDiaria.spAtualizaDiaria
end;



procedure TdtmAtualizacaoDiaria.ExecutaAjusteSaldo(const IDContrato      : Extended;
                                                   const dDataAtualiza   : TDateTime;
                                                   const fSaldoDev       : Currency
                                                  );
var
   rSaldoDev         : TSaldoDevAnt;
   fSaldoConsiderado : Currency;
begin
   // Verifica se o saldo devedor anterior já foi passado
   // Se não foi, busca o saldo devedor na data anterior

   fSaldoConsiderado := fSaldoDev;

   if fSaldoDev = -1 then
   begin
      rSaldoDev := CalcEmptmo.SaldoDevAnt(IDContrato,
                                          dDataAtualiza - 1,
                                          -1,
                                          -1
                                         );

      fSaldoConsiderado := rSaldoDev.fSaldoDevAnt;
   end;

   with dtmAtualizacaoDiaria.spAtualizaSaldo do
   begin
      ParamByName('IIDCONTRATOEMPTMO').AsFloat   := IDContrato;
      ParamByName('DDATAATUALIZA').AsDateTime    := dDataAtualiza;
      ParamByName('FSALDODEV').AsCurrency        := fSaldoConsiderado;
      if not(Prepared) then Prepare;
      ExecProc;
   end;
end;

procedure TdtmAtualizacaoDiaria.ExecutaProvPerda(const IDContrato     : Extended;
                                                 const IDModulo       : Integer;
                                                 const iTipoContr     : Integer;
                                                 const iTipoEmptmo    : Integer;
                                                 const iPatro         : Integer;
                                                 const iPlano         : Integer;
                                                 const iEstorna       : Integer;
                                                 const iProvPerda     : Integer;
                                                 const iAtuSaldo      : Integer;
                                                 const iInArquivo     : Integer;
                                                 const iNotInArquivo  : Integer;
                                                 const dDataIni       : TDateTime;
                                                 const dDataFim       : TDateTime;
                                                 const dDataConsidera : TDateTime);
begin
   with dtmAtualizacaoDiaria.spProvPerdas do
   begin
      ParamByName('iContrato').AsFloat          := IDContrato;
      ParamByName('iModulo').AsFloat            := IDModulo;
      ParamByName('iTipoEmptmo').AsFloat        := iTipoEmptmo;
      ParamByName('iTipoContrato').AsFloat      := iTipoContr;
      ParamByName('iPatro').AsFloat             := iPatro;
      ParamByName('iPlano').AsFloat             := iPlano;
      ParamByName('bEstorna').AsFloat           := iEstorna;
      ParamByName('iCalculaProv').AsFloat       := iProvPerda;
      ParamByName('bAtualizaSaldo').AsFloat     := iAtuSaldo;
      ParamByName('bInArquivo').AsFloat         := iInArquivo;
      ParamByName('bNotInArquivo').AsFloat      := iNotInArquivo;
      ParamByName('dDataInicial').AsDate        := dDataIni;
      ParamByName('dDataFinal').AsDate          := dDataFim;
      ParamByName('dDataConsidera').AsDate      := dDataConsidera;
      ParamByName('iEmpresa').AsFloat           := Sistema.IDEmpresa;

      if not(Prepared) then Prepare;

      ExecProc;
   end;  // with dtmAtualizacaoDiaria.spProvPerda
end;




end.
