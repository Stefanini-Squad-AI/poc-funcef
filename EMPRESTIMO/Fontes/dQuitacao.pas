{------------------------Alteração----------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Wylliam Leite da Silva
Data        : 04/05/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
--------------------------------------------------------------------------------}
unit DQuitacao;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBTables, Db, Wwquery,

   (* Units que pertencem ao Empréstimo*)
   UCalcEmptmo,
   UIntegraEmptmo,
   UDocumento,
   uFuncoesEmptmo,
   uSistema,
   DLookEmptmo,
   dEmptmo,
   dMS;

type
   TdtmQuitacao = class(TDataModule)
      qryHistMovVirtual: TwwQuery;
      qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMESEQCOBRANCA: TFloatField;
      qryHistMovVirtualHMETIPOMOV: TFloatField;
      qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField;
      qryHistMovVirtualHMEVLRPREVISTO: TFloatField;
      qryHistMovVirtualHMESALDODEV: TFloatField;
      qryHistMovVirtualHMETXJUROS: TFloatField;
      qryHistMovVirtualHMEPARCELA: TFloatField;
      qryHistMovVirtualEVENTO: TStringField;
      qryHistMovVirtualANOMES: TStringField;
      qryHistMovVirtualITEDESCRICAO: TStringField;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      qryHistMovVirtualIDITEMEMPTMO: TFloatField;
      updHistMovVirtual: TUpdateSQL;

      qryHistMov: TwwQuery;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMESALDODEV: TFloatField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovEVENTO: TStringField;
      qryHistMovANOMES: TStringField;
      qryHistMovITEDESCRICAO: TStringField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;

      qry: TwwQuery;
      qryINSCRICAO: TFloatField;
      qryINSCRICAONUMERO: TFloatField;
      qryDESCSITCONTRATO: TStringField;
      qryIDSITPART: TFloatField;
      qrySITUACAO: TStringField;
      qryFLGINTERNO: TStringField;
      qryPLANOPREV: TStringField;
      qryPATRO: TStringField;
      qryMATRICULA: TStringField;
      qryTITULAR: TStringField;
      qryBENEFICIARIO: TStringField;
      qryDESCTIPOEMPTMO: TStringField;
      qryDATAINSC: TDateTimeField;
      qryBANCO: TStringField;
      qryCONTACORRENTE: TStringField;
      qryNUMAGENCIA: TStringField;
      qryIDCONTRQUITACAO: TFloatField;
      qryIDPESSOA: TFloatField;
      qryIDPLANOPREV: TFloatField;
      qryIDPATRO: TFloatField;
      qryIDVERBA: TFloatField;
      qryIDBENEF: TFloatField;
      qryIDCBANCARIA: TFloatField;
      qryIDMOTIVOCANC: TFloatField;
      qryCODFORMAPAG: TFloatField;
      qryPORTFORMAPAG: TFloatField;
      qryPORTFORMAREC: TFloatField;
      qryNUMPARCELAS: TFloatField;
      qryDATACREDITO: TDateTimeField;
      qryDATASITUACAO: TDateTimeField;
      qryDATAASSINATURA: TDateTimeField;
      qryDATAPRIMPARC: TDateTimeField;
      qryDATACANC: TDateTimeField;
      qryVLRCONTRATO: TFloatField;
      qryVLRPARCELA: TFloatField;
      qryTXJUROS: TFloatField;
      qryFLGSITUACAO: TStringField;
      qryFLGFORMAREC: TStringField;
      qryFLGFORMAPAG: TStringField;
      qryIDTIPOEMPTMO: TFloatField;
      qryTCEDESCRICAO: TStringField;
      qryIDCONTRATOEMPTMO: TFloatField;
      qryIDINSCRICAOEMPTMO: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryDATAULTATUALIZA: TDateTimeField;

      qryAtualizacoesPosteriores: TwwQuery;
      qryAtualizacoesPosterioresHMEDATAATUALIZA: TDateTimeField;

      qryContratos: TwwQuery;
      qryContratosIDCONTRATOEMPTMO: TFloatField;

      qrySaldoDev: TwwQuery;
      qrySaldoDevIDPESSOA: TFloatField;
      qrySaldoDevHMEDATAATUALIZA: TDateTimeField;
      qrySaldoDevHMESALDODEV: TFloatField;
      qrySaldoDevHMETXJUROS: TFloatField;
      qrySaldoDevHMEPARCELA: TFloatField;
      qrySaldoDevHMENUMPARCELAS: TFloatField;

      qryParcelasEmAberto: TwwQuery;
      qryParcelasEmAbertoVALOR: TFloatField;


  private { Private declarations }

    rDadosContrato  : TDadosContrato;
    vLista          : TListaItem;

    function PegaAnoMes(sMes, sAno : String) : String;


  public { Public declarations }

    procedure AbreQueriesDebito;

    procedure PreencheTabelaVirtual(iContrato : Int64;
                                    sMes, sAno : String);

    function VerificaBaixa(iContrato : Int64) : Boolean;

    function VerificaAtualizacaoPosterior(const iContrato      : Int64;
                                          const dDataQuitacao  : TDateTime
                                          ) : Boolean;

    function PreencheDadosContrato : TDadosContrato;

    function CalculaValoresItensQuitacao(const rContrato             : TDadosContrato;
                                         const iEvento, iOrigem      : Integer; (* iEvento = flgCobraLib *)
                                         const dDataRef, dDataQuit   : TDateTime;
                                         var   vLista                : TListaItem;
                                         const bMostraMsg            : Boolean;
                                         const bMostraProgresso      : Boolean
                                         ): Boolean;

    function GravaMovimento(const rContrato                          : TDadosContrato;
                            const vLista                             : TListaItem;
                            const iEvento, iParcela                  : Integer;
                            const iAnoCompetencia, iMesCompetencia   : Integer;
                            const iAnoCobranca, iMesCobranca         : Integer;
                            const iParcelasRemanescentes             : Integer;
                            const dDataPrevista, dDataUltAtualiza    : TDateTime;
                            const bMostraProgresso                   : Boolean
                            ): Boolean;

    function ContabilizaItensQuitacao(const iContrato: Int64;
                                      const dDataLanc : TDateTime;
                                      var   iPlanilhaResult: Integer;
                                      var   sResult, sErro : TStringList): Integer;

    function EnviaQuitacaoCAPCAR(const iContrato : Int64;
                                 const sFormaRecebimento : String;
                                 const dDataQuitacao : TDateTime;
                                 var   iPlanilha: Integer;
                                 var   sResult,sErro: TStringList): Integer;

    function ValorDevidoPart(const iIdPessoa        : Int64;
                             const dDataAtualiza    : TDateTime;
                             const iTipoMov         : Integer;
                             var   fSaldoAtualizado : Currency;
                             var   fSaldoDevedor    : Currency) : Boolean;

    function QuitaContratosPart(const iIdPessoa       : Int64;
                                const iTipoQuitacao   : Integer;
                                const dDataQuitacao   : TDateTime;
                                const iPortForma      : String;
                                const sTipoDebito     : String;
                                var   iPlanilha       : Integer;
                                var   iPlanilhaResult : Integer;
                                var   sResult         : TStringList;
                                var   sErro           : TStringList;
                                var   sMensagemErro   : String)  : boolean;

    function EnviaFolha(const iPatro,     iIdTipoEmptmo, iIdTipoContrEmptmo: Int64;
                        const sNomePatro, sAnoCob,       sMesCob : String) : boolean;

  end;

var
  dtmQuitacao: TdtmQuitacao;

implementation

{$R *.DFM}



function TdtmQuitacao.PegaAnoMes(sMes, sAno : String) : String;
begin
   if length(sMes) = 1 then sMes := '0' + sMes;

   Result := FormatFloat('0000', StrToInt(sAno)) + sMes;
end;



procedure TdtmQuitacao.AbreQueriesDebito;
begin
   with dtmLookEmptmo.qryLookPortadorFormaR do begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;
end;



function TdtmQuitacao.PreencheDadosContrato : TDadosContrato;
begin

   CalcEmptmo.LimpaRegistroContrato(rDadosContrato);

   rDadosContrato.IDContratoEmptmo  := qryIDContratoEmptmo.AsInteger;
   (* É nulo na Concessão *)
   rDadosContrato.IDContrQuitacao   := -1;

   rDadosContrato.IdPessoa          := qryIDPESSOA.AsInteger;
   rDadosContrato.IDTipoContrEmptmo := qryIDTIPOCONTREMPTMO.AsInteger;
   rDadosContrato.IDTipoEmptmo      := qryIDTIPOEMPTMO.AsInteger;
   rDadosContrato.IdPlanoPrev       := qryIDPLANOPREV.AsInteger;
   rDadosContrato.IdPatro           := qryIDPATRO.AsInteger;

   (* Número da Inscrição *)
   rDadosContrato.IDInscricaoEmptmo := qryIDINSCRICAOEMPTMO.AsInteger;

   (* É nulo *)
   rDadosContrato.IDVerba := -1;

   (* Beneficiário do Contrato
      IDBENEF = IDPESSOA -> do Titular no caso de estar vivo
      e do Beneficiário no caso de Pensionista *)
   rDadosContrato.IdBenef := qryIDBENEF.AsInteger;

   if qryFLGFORMAPAG.AsString = 'C' then begin
      rDadosContrato.IDCBancaria := qryIDCBANCARIA.AsInteger;
   end else begin
      (* É nulo *)
      rDadosContrato.IDCBancaria := -1;
   end;

   (* É nulo *)
   rDadosContrato.IDMotivoCanc := -1;

   if qryCODFORMAPAG.AsString <> '' then begin
      rDadosContrato.CodFormaPag  := qryCODFORMAPAG.AsInteger;
   end else begin
      rDadosContrato.CodFormaPag  := -1;
   end;

   if qryPORTFORMAPAG.AsString <> '' then begin
      rDadosContrato.PortFormaPag := qryPORTFORMAPAG.AsInteger;
   end else begin
      rDadosContrato.PortFormaPag := -1;
   end;

   if qryPORTFORMAREC.AsString <> '' then begin
      rDadosContrato.PortFormaRec := qryPORTFORMAREC.AsInteger;
   end else begin
      rDadosContrato.PortFormaRec := -1;
   end;

   rDadosContrato.NumParcelas    := qryNUMPARCELAS.AsInteger;

   rDadosContrato.DataCredito    := qryDATACREDITO.AsDateTime;
   rDadosContrato.DataSituacao   := qryDATASITUACAO.AsDateTime;
   rDadosContrato.DataAssinatura := qryDATAASSINATURA.AsDateTime;
   rDadosContrato.DataPrimParc   := qryDATAPRIMPARC.AsDateTime;
   rDadosContrato.DataInscricao  := qryDATAINSC.AsDateTime;

   (* Data nula *)
   rDadosContrato.DataCanc :=  -1;

   rDadosContrato.VlrContrato := qryVLRCONTRATO.AsCurrency;
   rDadosContrato.VlrParcela  := qryVLRPARCELA.AsCurrency;
   rDadosContrato.Txjuros     := qryTXJUROS.AsFloat;
   rDadosContrato.FlgSituacao := qryFLGSITUACAO.AsString;

   (* FLGFORMAREC = C -> indicando que o Débito é pelo Contas a Receber
                    F -> indicando que o Débito é pela Folha *)
   rDadosContrato.flgFormaRec := qryFLGFORMAREC.AsString;

   (* FLGFORMAPAG = C -> indicando que o Crédito é pelo Contas a Pagar
                    F -> indicando que o Crédito é pela Folha *)
   rDadosContrato.flgFormaPag := qryFLGFORMAPAG.AsString;


   Result := rDadosContrato;
end;



function TdtmQuitacao.CalculaValoresItensQuitacao(const rContrato             : TDadosContrato;
                                         const iEvento, iOrigem      : Integer; (* iEvento = flgCobraLib *)
                                         const dDataRef, dDataQuit   : TDateTime;
                                         var   vLista                : TListaItem;
                                         const bMostraMsg            : Boolean;
                                         const bMostraProgresso      : Boolean
                                         ): Boolean;
begin
   Result := CalcEmptmo.CalculaItensQuitacao(rContrato,
                                             iEvento,
                                             iOrigem,
                                             dDataQuit,
                                             vLista,
                                             bMostraMsg,
                                             bMostraProgresso);
end;



function TdtmQuitacao.GravaMovimento(const rContrato                           : TDadosContrato;
                                     const vLista                              : TListaItem;
                                     const iEvento, iParcela,
                                           iAnoCompetencia, iMesCompetencia,
                                           iAnoCobranca, iMesCobranca          : Integer;
                                     const iParcelasRemanescentes              : Integer;
                                     const dDataPrevista, dDataUltAtualiza     : TDateTime;
                                     const bMostraProgresso                    : Boolean
                                    ): Boolean;
begin
   Result := CalcEmptmo.GravaMovEmptmo(rContrato,
                                       vLista,
                                       iEvento,
                                       iParcela,
                                       iAnoCompetencia,
                                       iMesCompetencia,
                                       iAnoCobranca,
                                       iMesCobranca,
                                       iParcelasRemanescentes,
                                       dDataPrevista,
                                       dDataUltAtualiza,
                                       bMostraProgresso
                                      );
end;



function TdtmQuitacao.ContabilizaItensQuitacao(const iContrato: Int64;
                                               const dDataLanc : TDateTime;
                                               var   iPlanilhaResult: Integer;
                                               var   sResult, sErro : TStringList): Integer;
var
   sSql, sMensagem: String;
begin

   sSql :=
   'SELECT ' +
   '  HME.IDHISTMOVEMPTMO  , HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, ' +
   '  HME.HMEFORMACOBRANCA , HME.HMEVLRPREVISTO  , ' +
   '  CNT.IDTIPOCONTREMPTMO, CNT.IDPLANOPREV     , CNT.IDPATRO, ' +
   '  ITC.TIPCODIGO ' +
   'FROM '  +
   '  HISTMOVEMPTMO   HME, ' +
   '  CONTRATOEMPTMO  CNT, ' +
   '  ITEMXTIPOCONTR  ITC, ' +
   '  TIPOCONTREMPTMO TIP, ' +
   '  TIPOEMPTMO      TEM '  +
   'WHERE ' +
   '      ( HME.IDCONTRATOEMPTMO  = '+ IntToStr(iContrato) + ' ) ' +
   '  AND ( TEM.IDEMPRESAPROP     = 1 ) ' +
   '  AND ( HME.HMETIPOMOV        = 3 ) ' +
   '  AND ( ( HME.HMECENTRALIZA   = 0 ) OR ( HME.HMECENTRALIZA IS NULL ) ) ' +
   '  AND ( HME.IDCONTRATOEMPTMO  = CNT.IDCONTRATOEMPTMO  ) ' +
   '  AND ( CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ) ' +
   '  AND ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) ' +
   '  AND ( CNT.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) ' +
   '  AND ( HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO ) ' +
   '  AND ( ITC.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO )';

   sMensagem := 'Quitação - Contrato nº ' + IntToStr(iContrato);

   Result := IntegraEmptmo.ContabilizaItens('C',
                                            'N',
                                            sSql,
                                            sMensagem,
                                            dDataLanc,
                                            sResult,
                                            sErro,
                                            iPlanilhaResult);

end;



function TdtmQuitacao.VerificaBaixa(iContrato : Int64) : Boolean;
var
   sSql              : String;
   qryAux            : TwwQuery;
   fSaldo            : Real;
   fSaldoOutraMoeda  : Real;
begin
   (* Cria a Query Auxiliar *)
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sSql :=
   'SELECT '                            + #13 +
   '  HMEDATAEFETIVA, CODDOCUMENTO '    + #13 +
   'FROM '                              + #13 +
   '  HISTMOVEMPTMO '                   + #13 +
   'WHERE '                             + #13 +
   '      ( IDCONTRATOEMPTMO = ' + IntToStr(iContrato) + ' ) ' + #13 +
   '  AND ( HMETIPOMOV       = 0 ) '    + #13 +
   '  AND ( HMECENTRALIZA    = 1 )';

   qryAux.SQL.Text := sSql;

   try

      qryAux.Open;

      Result := False;

      if not(qryAux.FieldByName('HMEDATAEFETIVA').IsNull) then begin

         (* Participante já recebeu o Crédito do EP, logo pode quitar o EP *)
         Result := True;

      end else begin

         if not(qryAux.FieldByName('CODDOCUMENTO').IsNull) then begin

            (* Participante NÃO recebeu o Crédito do EP *)
            Documento.Saldo.GetSaldoDoc(qryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                        '',  (* Data do Saldo - Saldo Atual *)
                                        'P', (* RecPag *)
                                        fSaldo,
                                        fSaldoOutraMoeda);

            if fSaldo = 0 then begin

               (* Crédito já pago pelo contas a Pagar, logo o participante pode quitar o EP *)
               Result := True;

            end else begin

               (* Crédito ainda NÃO foi pago pelo contas a Pagar, logo o participante
                  não poderá quitar o EP *)
               Result := False;

            end; (* if fSaldo = 0 *)

         end; (* if not Documento *)

      end; (* if not DataEfetiva *)

   finally
      qryAux.Free;
   end;
end;



function TdtmQuitacao.VerificaAtualizacaoPosterior(const iContrato      : Int64;
                                                   const dDataQuitacao  : TDateTime
                                                  ) : Boolean;
begin
   Result := True;

   try

      with qryAtualizacoesPosteriores do begin
         LimpaParametros(qryAtualizacoesPosteriores);
         ParamByName('PIDCONTRATOEMPTMO').AsInteger   := iContrato;
         ParamByName('PHMEDATAATUALIZA').AsDateTime   := dDataQuitacao;
         Open;

         if ( not(IsEmpty) and (RecordCount > 1) ) then Result := False;
      end;

   finally
      qryAtualizacoesPosteriores.Close;
   end
end;



procedure TdtmQuitacao.PreencheTabelaVirtual(iContrato : Int64;
                                             sMes, sAno : String);
var
   i : Integer;
begin
   qryHistMovVirtual.Close;
   qryHistMovVirtual.Open;

   (* Laço que varre o vetor Lista inserindo na tabela virtual TODOS os itens calculados *)
   for i := 0 to High(vLista) do begin

      qryHistMovVirtual.Insert;

      qryHistMovVirtualITEDESCRICAO.AsString       := vLista[i].Nome;
      qryHistMovVirtualANOMES.AsString             := sMes + '/' + sAno;
      qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger := vLista[i].AnoCompetencia;
      qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger := vLista[i].MesCompetencia;
      qryHistMovVirtualHMESEQCOBRANCA.AsInteger    := vLista[i].SeqCobranca;
      qryHistMovVirtualHMETIPOMOV.AsInteger        := vLista[i].FlgCobralib;

      case vLista[i].FlgCobralib of
         0: qryHistMovVirtualEVENTO.AsString := 'Concessão';
         1: qryHistMovVirtualEVENTO.AsString := 'Parcela';
         2: qryHistMovVirtualEVENTO.AsString := 'Amortização';
         3: qryHistMovVirtualEVENTO.AsString := 'Quitação';
         4: qryHistMovVirtualEVENTO.AsString := 'Atualização Débito';
      end;

      qryHistMovVirtualIDCONTRATOEMPTMO.AsInteger  := iContrato;
      qryHistMovVirtualIDITEMEMPTMO.AsInteger      := vLista[i].CodigoItem;
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := vLista[i].DataPrevista;
      qryHistMovVirtualHMEVLRPREVISTO.AsCurrency   := vLista[i].Valor;
      qryHistMovVirtualHMESALDODEV.AsCurrency      := vLista[i].SaldoDevedor;
      qryHistMovVirtualHMETXJUROS.AsCurrency       := vLista[i].TxJuros;
      qryHistMovVirtualHMEPARCELA.AsInteger        := vLista[i].Parcela;

      qryHistMovVirtual.Post;

   end;(* for *)
end;



function TdtmQuitacao.EnviaQuitacaoCAPCAR(const iContrato : Int64;
                                          const sFormaRecebimento : String;
                                          const dDataQuitacao : TDateTime;
                                          var   iPlanilha: Integer;
                                          var   sResult,sErro: TStringList): Integer;
var
	sSql: String;
begin

   sSql :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO  , HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO     , '                  + #13 +
   '  HME.HMEFORMACOBRANCA , HME.IDITEMCENTRALIZA, HME.HMEVLRPREVISTO   , '                  + #13 +
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                               + #13 +

   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || ' +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +
   '  ITC.CONTABAIXA      , ITC.TIPCODIGO        , '                                         + #13 +
   '  CNT.IDPLANOPREV      , CNT.IDPATRO         , CNT.IDPESSOA         , '                  + #13 +
   '  CNT.CODFORMAPAG      , CNT.PORTFORMAPAG    , TIP.IDTIPOCONTREMPTMO, '                  + #13 +
   '  IRC.ITEDESCRICAO, SIT.FLGINTERNO, ';

   sSql := sSql + QuotedStr(sFormaRecebimento) + ' AS PORTFORMAREC '                                    + #13;

   sSql := sSql                                                                              + #13 +
   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +
   '  CONTRATOEMPTMO  CNT, '                                                                 + #13 +
   '  PARTPREVPLAN    PPP, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  ITEMEMPTMO      IRC, '                                                                  + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM, '                                                                 + #13 +
   '  SITPART         SIT '                                                                  + #13 +

   'WHERE '                                                                                  + #13 +
   '      ( HME.IDCONTRATOEMPTMO  = ' + IntToStr(iContrato) + ' ) '                          + #13 +
   '  AND ( TEM.IDEMPRESAPROP     = 1 ) '                                                    + #13 +
   '  AND ( HME.HMECENTRALIZA     = 1 ) '                                                    + #13 +
   '  AND ( HME.HMETIPOMOV        = 3 ) '                                                    + #13 +
   '  AND ( HME.IDCONTRATOEMPTMO  = CNT.IDCONTRATOEMPTMO  ) '                                + #13 +
   '  AND ( CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) '                                     + #13 +
   '  AND ( CNT.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO ) '                                     + #13 +
   '  AND ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO ) '                                     + #13 +
   '  AND ( CNT.IDPESSOA          = PPP.IDPESSOA ) '                                         + #13 +
   '  AND ( CNT.IDPATRO           = PPP.IDPESSJUR ) '                                        + #13 +
   '  AND ( CNT.IDPLANOPREV       = PPP.IDPLANOPREV ) '                                      + #13 +
   '  AND ( PPP.IDSITPART         = SIT.IDSITPART ) '                                        + #13;

   Result := IntegraEmptmo.EnviaCAPCAR(sSql, 'Quitação de EP - ' +
                                       IntToStr(iContrato), '', (* Patrocinadora *)
                                       dDataQuitacao,
                                       iPlanilha,
                                       sResult,
                                       sErro);
end;



function TdtmQuitacao.ValorDevidoPart(const iIdPessoa        : Int64;
                                      const dDataAtualiza    : TDateTime;
                                      const iTipoMov         : Integer;
                                      var   fSaldoAtualizado : Currency;
                                      var   fSaldoDevedor    : Currency) : Boolean;
var
   Contador : Integer;
begin
   fSaldoAtualizado := 0;
   fSaldoDevedor    := 0;

   Result := True;

   try
      LimpaParametros(qrySaldoDev);
      qrySaldoDev.ParamByName('PIDPESSOA').AsInteger       := iIdPessoa;
      qrySaldoDev.ParamByName('PHMEDATAATUALIZA').AsString := DateToStr(dDataAtualiza);
      qrySaldoDev.Open;

      if not qrySaldoDev.IsEmpty then
         fSaldoDevedor := fSaldoDevedor + qrySaldoDevHMESALDODEV.AsFloat;

      LimpaParametros(qryParcelasEmAberto);
      qryParcelasEmAberto.ParamByName('PIDPESSOA').AsInteger := iIdPessoa;
      qryParcelasEmAberto.Open;

      if not qryParcelasEmAberto.IsEmpty then
         fSaldoDevedor := fSaldoDevedor + qryParcelasEmAbertoVALOR.AsFloat;

      LimpaParametros(qryContratos);
      qryContratos.ParamByName('PIDPESSOA').AsInteger := iIdPessoa;
      qryContratos.Open;

      while not qryContratos.Eof do begin
         LimpaParametros(qry);
         qry.paramByName('PIDCONTRATOEMPTMO').AsInteger := qryContratosIDCONTRATOEMPTMO.AsInteger;
         qry.Open;

         if not qry.IsEmpty then begin

            PreencheDadosContrato;

            if not CalculaValoresItensQuitacao(rDadosContrato,
                                               3,
                                               iTipoMov,
                                               dDataAtualiza,
                                               dDataAtualiza,
                                               vLista,
                                               False,
                                               False) then begin
               Result := False;
               qryContratos.Close;
               qry.Close;
               qrySaldoDev.Close;
               qryParcelasEmAberto.Close;
               Exit;
            end;

            for Contador := 0 to High(vLista) do begin

               if (vLista[Contador].FlgCentraliza = 1) or (vLista[Contador].FlgDestacado = 1) then
                  fSaldoAtualizado := fSaldoAtualizado + vLista[Contador].Valor;

            end;
         end;

         qryContratos.Next;
      end;
   finally
      qryContratos.Close;
      qry.Close;
      qrySaldoDev.Close;
      qryParcelasEmAberto.Close;
   end;
end;



function TdtmQuitacao.QuitaContratosPart(const iIdPessoa       : Int64;
                                         const iTipoQuitacao   : Integer;     (* 3 - Quitação / 8 - Morte *)
                                         const dDataQuitacao   : TDateTime;
                                         const iPortForma      : String;
                                         const sTipoDebito     : String;      (* C - CaP/CaR / F - Folha *)
                                         var   iPlanilha       : Integer;
                                         var   iPlanilhaResult : Integer;
                                         var   sResult         : TStringList;
                                         var   sErro           : TStringList;
                                         var   sMensagemErro   : String) : boolean;
var
   sMensErro, sMes, sAno, sMesCob, sAnoCob : String;
begin
   Result := True;

   try
      sMes := FormatDateTime('MM',   dDataQuitacao);
      sAno := FormatDateTime('YYYY', dDataQuitacao);

      LimpaParametros(qryContratos);
      qryContratos.ParamByName('PIDPESSOA').AsInteger := iIdPessoa;
      qryContratos.Open;

      while not qryContratos.Eof do begin

         LimpaParametros(qry);
         qry.paramByName('PIDCONTRATOEMPTMO').AsInteger := qryContratosIDCONTRATOEMPTMO.AsInteger;
         qry.Open;

         if not qry.IsEmpty then begin

            PreencheDadosContrato;

            if VerificaBaixa(rDadosContrato.IDCONTRATOEMPTMO) then begin

               if VerificaAtualizacaoPosterior(rDadosContrato.IDCONTRATOEMPTMO,
                                               dDataQuitacao) then begin

                  if CalculaValoresItensQuitacao(rDadosContrato,
                                                 3,
                                                 iTipoQuitacao,
                                                 dDataQuitacao,
                                                 dDataQuitacao,
                                                 vLista,
                                                 False,
                                                 False) then begin

                     PreencheTabelaVirtual(rDadosContrato.IDCONTRATOEMPTMO,
                                           sMes,
                                           sAno);

                     if not GravaMovimento(rDadosContrato,
                                           vLista,
                                           3,                                              (* Evento 3 - Quitação *)
                                           qryHistMovVirtualHMEPARCELA.AsInteger,          (* Parcela *)
                                           qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger,   (* Ano Competência - Ano do Item *)
                                           qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger,   (* Mês Competência - Mês do Item *)
                                           StrToInt(sAno),                                 (* Ano Cobrança - Ano da Data de Quitação *)
                                           StrToInt(sMes),                                 (* Mês Cobranca - Mês da Data de Quitação *)
                                           0,                                              (* Parcelas Remanescentes *)
                                           dDataQuitacao,                                  (* DataPrevista -> Data de Quitação *)
                                           dDataQuitacao,                                  (* dDataUltAtualiza -> Data de Quitação *)
                                           False                                            (* Mostra o Form de Progresso *)
                                          ) then begin
                        Result := False;
                        sMensagemErro := 'Erro ao gravar movimento. Contrato: ' + qryIDCONTRATOEMPTMO.AsString;
                        Exit;
                     end; (* GravaMovimento *)

                     if ContabilizaItensQuitacao(rDadosContrato.IDContratoEmptmo,
                                                 dDataQuitacao,
                                                 iPlanilhaResult,
                                                 sResult,
                                                 sErro) <> 0 then begin
                        sMensagemErro := 'Erro ao gerar contabilização. Contrato: ' + qryIDCONTRATOEMPTMO.AsString;
                        Result := False;
                        Exit;
                     end; (* ContabilizaItensQuitacao *)

                     if sTipoDebito = 'C' then begin
                        if EnviaQuitacaoCAPCAR(rDadosContrato.IDCONTRATOEMPTMO,
                                               iPortForma,
                                               dDataQuitacao,
                                               iPlanilha,
                                               sResult,
                                               sErro) <> 0 then begin
                           sMensagemErro := 'Erro ao gerar envio CAP/CAR. Contrato: ' + qryIDCONTRATOEMPTMO.AsString;
                           Result := False;
                           Exit;
                        end; (* EnviaQuitacaoCAPCAR *)
                     end; (* sTipoDebito *)

                     if (sTipoDebito = 'F') and (iTipoQuitacao = 8) then begin

                        if not EnviaFolha(rDadosContrato.IDPatro,
                                          rDadosContrato.IDTipoEmptmo,
                                          rDadosContrato.IDTipoContrEmptmo,
                                          qryPATRO.AsString,
                                          sAno,
                                          sMes) then begin

                           sMensagemErro := 'Erro ao gerar envio FOLHA. Contrato: ' + qryIDCONTRATOEMPTMO.AsString;
                           Result := False;
                           Exit;
                        end; (* not EnviaFolha *)

                     end; (* (sTipoDebito = 'F') and (iTipoQuitacao = 8) *)

                     if not CalcEmptmo.AtualizaFlgSituacao(rDadosContrato.IDInscricaoEmptmo,
                                                           'CONTRATOEMPTMO',
                                                           'K',
                                                           sMensErro) then begin

                        sMensagemErro := 'Erro ao atualizar situação. Contrato: ' + qryIDCONTRATOEMPTMO.AsString;
                        Result := False;
                        Exit;
                     end; (* AtualizaFlgSituacao *)

                  end; (* CalculaValoresItensQuitacao *)
               end; (* VerificaAtualizacaoPosterior *)
            end; (* VerificaBaixa *)
         end; (* not qry.IsEmpty *)

         qryContratos.Next;
      end; (* while not qryContratos.Eof *)

      qryContratos.Close;
   except
      Result := False;
   end;

end;



function TdtmQuitacao.EnviaFolha(const iPatro,     iIdTipoEmptmo, iIdTipoContrEmptmo: Int64;
                                 const sNomePatro, sAnoCob,       sMesCob : String) : boolean;
var
	sSQL, sDescricao	: String;
   sResult, sErro    : TStringList;
   fTotalPatro 		: Currency;
   iLote, iTotalReg 	: Integer;
begin
   sSQL :=
   'SELECT  '                                                                  + #13 +
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

   'WHERE '                                                                                  + #13 +

   (* O Filtro abaixo também é utilizado como filtro na Function AtualizaRubricas *)

   '      ( HME.HMEFORMACOBRANCA = ''F'' ) '                                                 + #13 +
   '  AND ( HME.FLGENVIO           = 0 ) '                                                   + #13 +
   '  AND ( (HME.HMECENTRALIZA     = 1) OR (HME.HMEDESTACADO  = 1) ) '                       + #13 +
   '  AND ( HME.HMEANOCOBRANCA     = ' + sAnoCob + ' ) '                                     + #13 +
   '  AND ( HME.HMEMESCOBRANCA     = ' + sMesCob + ' ) '                                     + #13 +
   '  AND ( (HME.FLGDIVERGPEND     = 0) OR (HME.FLGDIVERGPEND IS NULL) ) '                   + #13 +
   '  AND ( CNT.IDPATRO           = ' + IntToStr(iPatro) + ' ) '                             + #13 +
   '  AND ( TEM.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                  + #13 +
   '  AND ( CNT.FLGSITUACAO        IN (''A'', ''E'', ''K'') ) '                              + #13 +
   '  AND ( HME.FLGSUSPENSAO       IS NULL ) '                                               + #13 +
   '  AND ( HME.IDRUBRICA          IS NOT NULL ) '                                           + #13;

   if iIdTipoEmptmo <> -1 then begin
   sSQL := sSQL +
   '  AND ( TIP.IDTIPOEMPTMO      = ' + IntToStr(iIdTipoEmptmo) + ' ) '                      + #13;
   end;

   if iIdTipoContrEmptmo <> -1 then begin
   sSQL := sSQL +
   '  AND ( CNT.IDTIPOCONTREMPTMO = ' + IntToStr(iIdTipoContrEmptmo) + ' ) '                + #13 +
   '  AND ( TIP.IDTIPOCONTREMPTMO = ' + IntToStr(iIdTipoContrEmptmo) + ' ) '                + #13;
   end;

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
   sDescricao  := 'Empréstimo - Envio ref: ' + PegaAnoMes(sMesCob,
                                                          sAnoCob);

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
                                    sDescricao,
                                    sNomePatro,
                                    PegaAnoMes(sMesCob, sAnoCob),    (* Ano e Mês Cobrança *)
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

         (* Todos os registros da patrocinadora foram inseridos
            com sucesso *)

         (* Insert na TABELA CLTRINTERFACE *)
         if not IntegraEmptmo.InsertCtrlInterface(iLote,
                                                  iTotalReg,
                                                  iPatro,
                                                  PegaAnoMes(sMesCob, sAnoCob),
                                                  fTotalPatro) then begin
            Result := False;
         end else begin
            (* Não Houve erro *)
            Result := True;
         end;(* if InsertCtrlInterface *)

      end;(* if ResultadoPrepara *)

   finally
      (* Se estiver ainda em transação, desfaz... *)
      sResult.Free;
      sErro.Free;
   end;
end;



end.
