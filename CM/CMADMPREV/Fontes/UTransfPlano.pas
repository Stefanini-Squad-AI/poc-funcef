// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 20/07/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Data        : 08.10.2004
// Pendência   : 17551
// Descricao   : Substituicao das units do back pelas de 3 camadas :
//                        U D o c u m e n t o    -> U C t r l D o c u m e n t o
//                        U L a n c C o n t a b  -> U C t r l L a n c a m e nt o
//------------------------------------------------------------------------------

unit UTransfPlano;

interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, UCtrlLancamento;

function AcertaBeneficioTransfPlano ( qry               : TwwQuery;
                                      qryGrava          : TwwQuery;
                                      piIdEventoGerador : longint;
                                      piIdPessJur       : longint;
                                      piIdPlanoPrev     : longint;
                                      piIdTitular       : longint;
                                      piIdPessoa        : longint;
                                      piSeqProposta     : longint;
                                      psDataEvento      : string;
                                      piIdLote          : longint ) : boolean;

function PreparaBeneficiosTransfPlano( piIdPessJur       : longint;
                                       piIdPlanoOrigem   : longint;
                                       piIdPlanoDestino  : longint;
                                       piIdTitular       : longint;
                                       piIdPessoa        : longint;
                                       piSeqProposta     : longint;
                                       var iIdLote       : longint ) : boolean;

function BuscaNumeroBeneficiarios (   piNumeroprocesso  : longint;
                                      piIdPessjur       : longint;
                                      piIdPlanoPrev     : longint;
                                      piIdTitular       : longint;
                                      piIdBeneficio     : longint ) : integer;

implementation

uses UAdmPrev, UBeneficio, UContribuicaoPrev, DAPrev, UParticipante, FSelecionaLote,
     UMovReserva, USistema, UIntegraBack, DBaseDados, UMensErro;

function BuscaNumeroBeneficiarios (   piNumeroprocesso  : longint;
                                      piIdPessjur       : longint;
                                      piIdPlanoPrev     : longint;
                                      piIdTitular       : longint;
                                      piIdBeneficio     : longint ) : integer;
begin
   Result := 0;
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT COUNT(DISTINCT IDPESSOA) AS NUMBENEF           '+
              ' FROM   BENEFBFCIARIO                                  '+
              ' WHERE  NUMEROPROCESSO = '+IntTosTr(piNumeroProcesso)   +
              ' AND    IDPESSJUR      = '+IntTosTr(piIdPessJur)        +
              ' AND    IDPLANOPREV    = '+IntTosTr(piIdPlanoPrev)      +
              ' AND    IDTITULAR      = '+IntTosTr(piIdTitular)        +
              ' AND    IDBENEFICIO    = '+IntToStr(piIdBeneficio)      );
      Open;
      if (not IsEmpty) and (FieldByName('NUMBENEF').AsInteger > 0)
      then Result := FieldByName('NUMBENEF').AsInteger;
   end;
end;

function AcertaBeneficioTransfPlano ( qry               : TwwQuery;
                                      qryGrava          : TwwQuery;
                                      piIdEventoGerador : longint;
                                      piIdPessJur       : longint;
                                      piIdPlanoPrev     : longint;
                                      piIdTitular       : longint;
                                      piIdPessoa        : longint;
                                      piSeqProposta     : longint;
                                      psDataEvento      : string;
                                      piIdLote          : longint ) : boolean;
var sAnoMesLote      : string;
    dValorPago       : double;
    dValorAPagar     : double;
    dValorCobrado    : double;
    dValorACobrar    : double;
    dDiferenca       : double;
    iFlgDevolucao    : word;
    sMsgErro         : string;
    iIdLote          : longint;
    sDataFolha       : string;
begin
   Result        := False;

   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DATAPREPARO, MESREFERENCIA, FROM CTRLINTERFACE '+
              ' WHERE  IDLOTE = '+IntToStr(piIdLote));
      Open;
      if not IsEmpty
      then begin
         sAnoMesLote := FieldByName('MESREFERENCIA').AsString;
         sDataFolha  := FieldByName('DATAPREPARO').AsString;
      end
      else begin
         sAnoMesLote := Copy(psDataEvento,7,4)+'/'+Copy(psDataEvento,4,2);
         sDataFolha  := psDataEvento;
      end;
   end;
   iIdLote := piIdLote;

   // **************************************************************************
   // ****************************  BENEFICIOS *********************************
   // **************************************************************************
   // Abrir query com novos beneficios, preparados pelo evento de transferencia
   // de plano
   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT H.MES, H.MESREFERENCIA, H.IDBENEFICIO, H.VALORPREV, H.VALORINTEGRAL, '+
              '        BT.IDBENEFORIGEM, BT.IDBENEFORIGEM                                   '+
              ' FROM   BENEFBFCIARIO BF, HSTBENEFBFCIARIO H, BENEFTRANSFPLANO BT            '+
              ' WHERE  BT.IDPLANODEST     = '+IntToStr(piIdPlanoPrev)                        +
              ' AND    BT.IDEVENTOGERADOR = '+IntToStr(piIdEventoGerador)                    +
              ' AND    BF.IDPESSJUR       = '+IntToStr(piIdPessJur)                          +
              ' AND    BF.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)                        +
              ' AND    BF.IDTITULAR       = '+IntToStr(piIdTitular)                          +
              ' AND    BF.IDPESSOA        = '+IntToStr(piIdPessoa)                           +
              ' AND    BF.SEQPROPOSTA     = '+IntToStr(piSeqProposta)                        +
              ' AND    BF.IDBENEFICIO     = BT.IDBENEFDEST                                  '+
              ' AND    H.IDPLANOPREV      = BF.IDPLANOPREV                                  '+
              ' AND    H.IDBENEFICIO      = BF.IDBENEFICIO                                  '+
              ' AND    H.NUMEROPROCESSO   = BF.NUMEROPROCESSO                               '+
              ' AND    H.IDPESSJUR        = BF.IDPESSJUR                                    '+
              ' AND    H.IDTITULAR        = BF.IDTITULAR                                    '+
              ' AND    H.IDPLANOORIGEM    = BF.IDPLANOORIGEM                                '+
              ' AND    H.IDPESSOA         = BF.IDPESSOA                                     '+
              ' AND    H.SEQPROPOSTA      = BF.SEQPROPOSTA                                  '+
              ' AND    H.MESREFERENCIA    >= '''+Copy(psDataEvento,7,4)+'/'+Copy(psDataEvento,4,2)+''''+
              ' ORDER BY H.MES, H.MESREFERENCIA                                             ');
      Open;
   end;

   // Para cada linha encontrada, verificar se o beneficio associado no DE-PARA teve
   // valor calculado diferente
   while not qry.Eof do
   begin
      qryGrava.Close;
      qryGrava.SQL.Clear;
      qryGrava.SQL.Add(' SELECT NUMEROPROCESSO, IDPESSJUR, IDPLANOPREV, IDBENEFICIO,                        '+
                       '        MAX(VALORTOTAL) AS VALORTOTAL,                                              '+
                       '        SUM(DECODE(FLGDEVOLUCAO, 1, -VALORPREV,     VALORPREV)     AS VALORPREV,    '+
                       '        SUM(DECODE(FLGDEVOLUCAO, 1, -VLBENEFPGTO,   VLBENEFPGTO)   AS VLBENEFPGTO,  '+
                       '        SUM(DECODE(FLGDEVOLUCAO, 1, -VALORINTEGRAL, VALORINTEGRAL) AS VALORINTEGRAL '+
                       ' FROM   HSTBENEFBFCIARIO H                                                          '+
                       ' WHERE  H.IDBENEFICIO      = '+qry.FieldByName('IDBENEFORIGEM').AsString             +
                       ' AND    H.IDTITULAR        = '+IntToStr(piIdTitular)                                 +
                       ' AND    H.IDPESSOA         = '+IntToStr(piIdPessoa)                                  +
                       ' AND    H.MESREFERENCIA    = '''+qry.FieldByName('MESREFERENCIA').AsString+''''      +
                       ' AND    H.IDPLANOPREV      <> '+IntToStr(piIdPlanoPrev)                              +
                       ' GROUP BY NUMEROPROCESSO,IDPESSJUR, IDPLANOPREV, IDBENEFICIO                                       ');
      qryGrava.Open;

      if qryGrava.IsEmpty
      then begin
         qry.Next;
         continue;
      end;

      dValorPago   := qryGrava.FieldByName('VLBENEFPGTO').AsFloat;
      dValorAPagar := qry.FieldbyName('VALORPREV').AsFloat;
      if dValorPago > dValorAPagar
      then begin
         iFlgDevolucao := 1;
         dDiferenca    := dValorPago - dValorAPagar;
      end
      else begin
         iFlgDevolucao := 0;
         dDiferenca    := dValorAPagar - dValorPago;
      end;

      if dDiferenca <= 0.01
      then begin
         qry.Next;
         continue;
      end;

      if not InsereHstBenefBfciario ( qryGrava,
                                      2,
                                      qryGrava.FieldByName('NUMEROPROCESSO').AsInteger,
                                      qryGrava.FieldByName('IDBENEFICIO').AsInteger,
                                      qryGrava.FieldByName('IDPESSJUR').AsInteger,
                                      qryGrava.FieldByName('IDPLANOPREV').AsInteger,
                                      piIdTitular,
                                      piSeqProposta,
                                      piIdPessoa,
                                      -1,
                                      prmIDMOTIVOFOLHABEN,
                                      -1, 
                                      qry.FieldByName('MESREFERENCIA').AsString,
                                      sAnoMesLote,
                                      '','','', // matricula, inscricao, lote
                                      dDiferenca,
                                      dDiferenca,
                                      qryGrava.FieldByName('VALORINTEGRAL').AsFloat,
                                      0, // valorpago
                                      0, // piFlgEnviado
                                      1, // piFlgConcessao
                                      iFlgDevolucao,
                                      iIdLote,
                                      sMsgErro,
                                      sDataFolha // datapagamento
                                      )

      then Exit;
      qry.Next;
   end;


   // **************************************************************************
   // ****************************  CONTRIBUICOES ******************************
   // **************************************************************************
   // Abrir query com novas contribuicoes, preparadas pelo evento de transferencia
   // de plano somando as contribuicoes por pagador, já que não existe de-para de
   // contribuicoes
   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT H.MESCOBRANCA, H.MESREFERENCIA, H.IDPESSOA, CP.FLGPAGADOR,                      '+
              '        MAX(H.IDCONTRIBUICAO) AS IDCONTRIBUICAO,                                        '+
              '        SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORESPERADO,H.VALORESPERADO)) AS VALORESPERADO,'+
              '        SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORRECEBIDO,H.VALORRECEBIDO)) AS VALORRECEBIDO '+
              ' FROM   CONTPREV CP, HSTCONTRIBPREV H                                                   '+
              ' WHERE  H.IDPESSJUR       = '+IntToStr(piIdPessJur)                                      +
              ' AND    H.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)                                    +
              ' AND    H.MESREFERENCIA    >= '''+Copy(psDataEvento,7,4)+'/'+Copy(psDataEvento,4,2)+''' '+
              ' AND    EXISTS ( SELECT 1                                                               '+
              '                 FROM   BFCIARIOTITPLAN BTIT, NUCLEOFAMILIAR N, CONTRIBPREVNUCLEO CN    '+
              '                 WHERE  BTIT.IDPESSJUR       = '+IntToStr(piIdPessJur)                   +
              '                 AND    BTIT.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)                 +
              '                 AND    BTIT.IDTITULAR       = '+IntToStr(piIdTitular)                   +
              '                 AND    BTIT.IDPESSOA        = '+IntToStr(piIdPessoa)                    +
              '                 AND    BTIT.SEQPROPOSTA     = '+IntToStr(piSeqProposta)                 +
              '                 AND    N.IDNUCLEOFAMILIAR   = BTIT.IDNUCLEOFAMILIAR                    '+
              '                 AND    CN.IDNUCLEOFAMILIAR  = N.IDNUCLEOFAMILIAR                       '+
              '                 AND    H.IDPESSOA           = N.IDRESPNUCLEO                           '+
              '                 AND    H.IDCONTRIBUICAO     = CN.IDCONTRIBUICAO )                      '+
              ' AND   CP.IDPLANOPREV    = H.IDPLANOPREV                                                '+
              ' AND   CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO                                             '+
              ' GROUP BY H.MESCOBRANCA, H.MESREFERENCIA, H.IDPESSOA, CP.FLGPAGADOR                     '+
              ' ORDER BY H.MESCOBRANCA, H.MESREFERENCIA                                                ');
      Open;
   end;

   // Para cada linha encontrada, verificar se o beneficio associado no DE-PARA teve
   // valor calculado diferente
   while not qry.Eof do
   begin
      qryGrava.Close;
      qryGrava.SQL.Clear;
      qryGrava.SQL.Add(' SELECT H.IDPESSJUR, H.IDPLANOPREV,                                                     '+
                       '        SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORESPERADO,H.VALORESPERADO)) AS VALORESPERADO,'+
                       '        SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORRECEBIDO,H.VALORRECEBIDO)) AS VALORRECEBIDO '+
                       ' FROM   CONTPREV CP, HSTCONTRIBPREV H                                                   '+
                       ' WHERE  H.IDPESSJUR       = '+IntToStr(piIdPessJur)                                      +
                       ' AND    H.IDPLANOPREV     <> '+IntToStr(piIdPlanoPrev)                                   +
                       ' AND    H.IDPESSOA        = '+qry.FieldByName('IDPESSOA').AsString                       +
                       ' AND    H.MESREFERENCIA    '''+qry.FieldByName('MESREFERENCIA').AsString           +''' '+
                       ' AND    CP.IDPLANOPREV    = H.IDPLANOPREV                                               '+
                       ' AND    CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO                                            '+
                       ' AND    CP.FLGPAGADOR     = '''+qry.FieldByName('FLGPAGADOR').AsString+'''              '+
                       ' GROUP BY H.IDPESSJUR, H.IDPLANOPREV                                                    ');
      qryGrava.Open;

      if qryGrava.IsEmpty
      then begin
         qry.Next;
         continue;
      end;

      dValorCobrado:= qryGrava.FieldByName('VALORRECEBIDO').AsFloat;
      dValorACobrar:= qry.FieldbyName('VALORESPERADO').AsFloat;
      if dValorCobrado > dValorACobrar
      then begin
         iFlgDevolucao := 1;
         dDiferenca    := dValorCobrado - dValorACobrar;
      end
      else begin
         iFlgDevolucao := 0;
         dDiferenca    := dValorACobrar - dValorCobrado;
      end;

      if dDiferenca <= 0.01
      then begin
         qry.Next;
         continue;
      end;

      if InsereHstContribPREV( qryGrava,
                               qry.FieldByName('IDPESSOA').AsInteger,
                               piSeqProposta,
                               qryGrava.FieldByName('IDPESSJUR').AsInteger,
                               qryGrava.FieldByName('IDPLANOPREV').AsInteger,
                               qry.FieldByName('IDCONTRIBUICAO').AsInteger,
                               prmIDMOTIVOFOLHABEN,
                               qry.FieldByName('MESREFERENCIA').AsString,
                               sAnoMesLote,
                               -1,
                               sDataFolha,
                               '',                   // psDataRecebimento
                               dDiferenca,
                               dDiferenca,
                               0,                    // pdValorRecebido
                               -1,                   // piIdRegraCalculo
                               1,                    // piFlgDescFolha
                               0,                   // pdValorBase1,
                               0,                   // pdValorBase2,
                               0,                   // pdValorBase3
                               '',                  // psDataInicio
                               '',                  // psDataFinal
                               'AS',
                               0,                   // sitrecebimento
                               0,                   // parcela
                               piIdLote,
                               'F',
                               0,                   // piFlgCalcReserva
                               iFlgDevolucao,
                               1,                   // piFlgConcessao
                               1 ) < 0              // piFlgEvento
      then Exit;

      qry.Next;
   end;

   Result        := True;
end;


function PreparaBeneficiosTransfPlano( piIdPessJur       : longint;
                                       piIdPlanoOrigem   : longint;
                                       piIdPlanoDestino  : longint;
                                       piIdTitular       : longint;
                                       piIdPessoa        : longint;
                                       piSeqProposta     : longint;
                                       var iIdLote       : longint ) : boolean;
var iNumBenef               : integer;
    dValorAtualizadoRateado : double;
    dValorAtualizadoTotal   : double;
    dValorSRB               : double;
    sUltMesReajuste         : string;
    sMsgErro                : string;
    bErro                   : boolean;
    bPreparaContrib13       : boolean;
    iNumeroProcesso         : longint;
    sSQL                    : string;
    sAnoMesInicio           : string;
    sSalPart                : string;
    sDataInicio             : string;
    sAnoMesPagamento        : string;
    iFlgIncluiMesConc       : integer;     
begin
   Result  := False;
   iIdLote := -1;
   // **************************************************************************
   // *********************** PREPARAR BENEFICIOS ******************************
   // **************************************************************************
   with dtmAPrev.qryBenefNucleo do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT BF.* , BP.IDREGRACALCULO, BP.IDREGRAPRIMPAGTO,     '+
              '        BP.IDREGRAULTPAGTO, BP.FLGCALCTODOMES              '+
              ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP                 '+
              ' WHERE  BF.IDPESSJUR   = '+IntToStr(piIdPessJur)            +
              ' AND    BF.IDPLANOPREV = '+IntToStr(piIdPlanoDestino)       +
              ' AND    BF.IDTITULAR   = '+IntToStr(piIdTitular)            +
              ' AND    BF.IDPESSOA    = '+IntToStr(piIdPessoa)             +
              ' AND    BF.SEQPROPOSTA = '+IntToStr(piSeqProposta)          +
              ' AND    BP.IDPLANOPREV = BF.IDPLANOPREV                    '+
              ' AND    BP.IDBENEFICIO = BF.IDBENEFICIO                    ');
      Open;

      if IsEmpty
      then begin
         Result := True;
         Exit;
      end;

      iIdLote := SelecionaLoteBeneficioAberto(sAnoMesPagamento, iFlgIncluiMesConc );

      while not Eof do
      begin
         iNumBenef       := BuscaNumeroBeneficiarios ( FieldByName('NUMEROPROCESSO').AsInteger,
                                                       piIdPessjur,
                                                       piIdPlanoDestino,
                                                       piIdTitular,
                                                       FieldByName('IDBENEFICIO').AsInteger);

         // Preencher Parametros para Passar para Rotinas de Preparo
         iNumeroProcesso := FieldByName('NUMEROPROCESSO').AsInteger;
         dValorSRB       := FieldByName('VALORSRB').AsFloat;
         sAnoMesInicio   := Copy(FieldByName('DATAINICIO').AsString,7,4)+'/'+Copy(FieldByName('DATAINICIO').AsString,4,2);
         sDataInicio     := FieldByName('DATAINICIO').AsString;

         if not PreparaBeneficioConcedido( dtmAPrev.qry,
                                           piIdTitular,
                                           piIdPessoa,
                                           piSeqProposta,
                                           piIdPessJur,
                                           piIdPlanoDestino,
                                           FieldByName('NUMEROPROCESSO').AsInteger,
                                           FieldByName('IDBENEFICIO').AsInteger,
                                           prmIDMOTIVOFOLHABEN,
                                           iNumBenef,
                                           FieldByName('IDREGRACALCULO').AsInteger,
                                           -1, // piIdRegraReajuste
                                           FieldByName('IDREGRAPRIMPAGTO').AsInteger,
                                           FieldByName('IDREGRAULTPAGTO').AsInteger,
                                           FieldByName('IDTPPAGTOBENEFIC').AsInteger,
                                           FieldByName('CODPORTFORMA').AsInteger,
                                           '', // psNomeBeneficio
                                           '', // psNomePatro
                                           '', // psNomePlano
                                           '', // psMatriculaTitular
                                           FieldByName('DATAINICIO').AsString,
                                           FieldByName('DATAFINAL').AsString,
                                           FieldByName('FLGCALCTODOMES').AsString,
                                           FieldByName('VALORATUAL').AsFloat,
                                           FieldByName('VALORCOTAS').AsFloat,
                                           FieldByName('VALORTOTAL').AsFloat,
                                           True,
                                           dValorAtualizadoRateado,
                                           dValorAtualizadoTotal,
                                           sUltMesReajuste,
                                           bErro,
                                           bPreparaContrib13,
                                           sMsgErro,
                                           iIdLote,
                                           FieldByName('DATAINICIO').AsString,
                                           7,
                                           FieldByName('FLGDATAPREVISTA').AsInteger,
                                           dValorSRB,
                                           iIdCalculoGeral
                                            )
         then Exit;

         Next;
      end; // while
   end; // with

   // **************************************************************************
   // *********************** PREPARAR CONTRIBUICOES ***************************
   // **************************************************************************
   if piIdTitular = piIdPessoa
   then begin // preparar contribuicoes para participante
      sSQL := ' SELECT CP.IDCONTRIBUICAO, CP.SEQPROPOSTA, CP.IDCONTRIBUICAO, CP.IDPESSOA,    '+
              '        CP.CODPORTFORMA, CP.FLGDESCFOLHA, CP.VALORBASE1, CP.VALORBASE2,       '+
              '        CP.VALORBASE3, CP.DATAINICIO, CP.DATAFINAL, C.NOME, PP.INSCRICAODATA, '+
              '        PF.DATANASC, CT.ORDEMCALCULO, PP.IDSITPART                            '+
              ' FROM  CONTRIBUICAO C, CONTPREV CT,  PARTPREVPLAN PP, CONTRIBPREVPARTP CP,    '+
              '       PESSOAFISICA PF                                                        '+
              ' WHERE CP.IDPESSJUR      = ' + IntToStr(piIdPessJur)                           +
              ' AND   CP.IDPLANOPREV    = ' + IntToStr(piIdPlanoDestino)                      +
              ' AND   CP.IDPESSOA       = ' + IntToStr(piIdTitular)                           +
              ' AND   CP.SEQPROPOSTA    = ' + IntToStr(piSeqProposta)                         +
              ' AND   CP.FLGCOBRA       = 1                                                  '+
              ' AND   CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO                                   '+
              ' AND   PP.IDPESSJUR      = CP.IDPESSJUR                                       '+
              ' AND   PP.IDPLANOPREV    = CP.IDPLANOPREV                                     '+
              ' AND   PP.IDPESSOA       = CP.IDPESSOA                                        '+
              ' AND   PP.SEQPROPOSTA    = CP.SEQPROPOSTA                                     '+
              ' AND   PF.IDPESSOA       = CP.IDPESSOA                                        '+
              ' AND   CT.IDPLANOPREV    = CP.IDPLANOPREV                                     '+
              ' AND   CT.IDCONTRIBUICAO = CP.IDCONTRIBUICAO                                  '+
              ' ORDER BY CT.ORDEMCALCULO                                                     ';

      with dtmAPrev.qryContribNucleo do
      begin
         Close;
         SQL.Clear;
         SQL.Add(sSQL);
         Open;

         if IsEmpty
         then begin
            Result := True;
            Exit;
         end;
      end;

      sSalPart := ORANUMERO(CalcSalPart( piIdPessJur, piIdTitular, sAnoMesInicio, dtmAPrev.qryAux));

      if not PreparaContribuicaoASSISTIDO(
                             piIdPessJur,
                             piIdPlanoDestino,
                             prmIDMOTIVOFOLHABEN,
                             0,
                             dtmAPrev.qryTransfPlano,
                             dtmAPrev.qryAux,
                             sSQL,
                             '',   // sSQLRegra
                             '',   // sWhereSQLRegra
                             '',   // sAliasSQLRegra
                             'AS', // sSitFundacao
                             '',   // sDescPreparo
                             'R',  // sAtrasoDevol
                             '1', // sFlgVeioDoEvento
                             False, // bValorQry
                             False, // bParaCobranca
                             sMsgErro,
                             iIdLote,
                             sSalPart,
                             dtmAPrev.qryContribNucleo.FieldByName('IDSITPART').AsString,
                             'TP',
                             True,
                             False,
                             '',
                             False,
                             StrToInt(sIdEventoGerador),
                             sDataInicio,
                             '',
                             2, // piOrigem,
                             0,
                             '',
                             iNumeroProcesso)
      then Exit;
   end // then
   else begin // preparar contribuicoes para beneficiario
      if not GeraContribBenef( dtmAPrev.qryTransfPlano,
                               dtmAPrev.qryContribNucleo,
                               dtmAPrev.qryAux,
                               IntToStr(piIdPessoa)+',',
                               iNumeroProcesso,
                               -1, 
                               sAnoMesPagamento,
                               sDataInicio,
                               sAnoMesInicio,
                               IntToStr(prmIDMOTIVOFOLHABEN),
                               iIdLote) 
      then Exit;

   end;

   Result := True;
end;

function DesfazTransfPlano( piIdPessJur       : longint;
                            piIdPlanoOrigem   : longint;
                            piIdPlanoDestino  : longint;
                            piIdTitular       : longint;
                            piIdPessoa        : longint;
                            piSeqProposta     : longint ) : boolean;
var sPlanilhasExcluir : string;
    iIdEventosPrev    : longint;
    iIdEventoGerador  : longint;
    sDataEvento       : string;
    i                 : integer;
    iPlnCodigo        : longint;
    sNumerosProcesso  : string;
    iIdSitPlanoPrev   : longint;
    CtrlLancamento    : TCtrlLancamento;
begin
   Result := False;

   // Buscar ultimo evento de transferencia de plano da pessoa
   with dtmAPrev.qryTransfPlano do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT EP.IDEVENTOGERADOR, EP.IDSITPLANOATUAL,                                   '+
              '        MAX(EP.IDEVENTOSPREV) AS IDEVENTOSPREV,                                   '+
              '        MAX(EP.DATAEFETIVADO) AS DATAEFETIVADO                                    '+
              ' FROM   EVENTOSPREV EP, EVENTOGERADOR EG                                          '+
              ' WHERE  EP.IDPLANOPREV    = '+IntToStr(piIdPlanoOrigem)                            +
              ' AND    EP.IDPESSOA       = '+IntToSTr(piIdTitular)                                +
              ' AND    EP.IDPESSJUR      = '+IntToStr(piIdPessJur)                                +
              ' AND    EP.DATAREGISTRO IN ( SELECT MAX(DATAREGISTRO)                             '+
              '                             FROM EVENTOSPREV E, , EVENTOGERADOR EG               '+
              '                             WHERE  E.IDPLANOPREV    = '+IntToStr(piIdPlanoOrigem) +
              '                             AND    E.IDPESSOA       = '+IntToSTr(piIdTitular)     +
              '                             AND    E.IDPESSJUR      = '+IntToStr(piIdPessJur)     +
              '                             AND    EG.IDEVENTOGERADOR = E.IDEVENTOGERADOR        '+
              '                             AND    EG.FLGINTERNO      = ''TP''                  )'+
              ' AND    EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR                                   '+
              ' AND    EG.FLGINTERNO      = ''TP''                                               '+
              ' GROUP BY EP.IDEVENTOGERADOR , EP.IDSITPLANOATUAL                                 '+
              ' ORDER BY EP.IDEVENTOSPREV DESC                                                   ');
      Open;
      if (not IsEmpty) and (FieldByName('IDEVENTOSPREV').AsInteger > 0)
      then begin
         iIdEventosPrev   := FieldByName('IDEVENTOSPREV').AsInteger;
         iIdEventoGerador := FieldByName('IDEVENTOGERADOR').AsInteger;
         iIdSitPlanoPrev  := FieldByName('IDSITPLANOATUAL').AsInteger;
         sDataEvento      := FieldByName('DATAEFETIVADO').AsString;
      end
      else begin
         iIdEventosPrev   := -1;
         iIdEventoGerador := -1;
         sDataEvento      := FormatDateTime('dd/mm/yyyy', date); 
         iIdSitPlanoPrev  := -1;
      end;
   end;

   // Operacoes do FAZER TRANSFERENCIA DE PLANO
   // 0. Desativa e atualiza sit. no pl. origem - PARTPREVPLAN
   // 1. Insere participante no plano destino   - PARTPREVPLAN
   // 2. Insere evento no plano destino         - EVENTOSPREV
   // 3. Associa reservas no plano destino      - RESERVAPART
   // 4. Se for participante, associa contrib.  - CONTRIBPREVPARTP
   // 5. Se for assistido, insere beneficios    - BFCIARIOTITPLAN, PROCESSOBENEF, BENEFBFCIARIO
   // 6. Prepara contribuicoes e beneficios     - HSTBENEFBFCIARIO, HSTCONTRIBPREV
   // 7. Executa padrao de movimet. de reserva  - RESERVAPART, HISTMOVRESERVA

   // *******************************************************************************
   // Para desfazer a transferencia de plano, excluir lançamentos de traz para frente
   // *******************************************************************************
   // 7. DESFAZER - Executa padrao de movimet. de reserva - RESERVAPART, HISTMOVRESERVA
   if not DESFAZPADRAOMOVRESERVA( piIdPessJur,
                                  piIdPlanoDestino,
                                  piIdPessoa,
                                  piSeqProposta,
                                  -1,
                                  iIdEventoGerador,
                                  sDataEvento,
                                  -1,
                                  sPlanilhasExcluir )
   then Exit;

   // Exclui Lancamentos Contabeis da movimentacao de reservas
   // Caso existam planilhas a excluir
   if Trim(sPlanilhasExcluir) <> ''
   then begin
     try
        CtrlLancamento := TCtrlLancamento.Create;
        CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                                  True,
                                  Sistema.ConnectionType,
                                  Sistema.ConnectionSide,
                                  Sistema.AppRemoteServer,
                                  True
                                 );
     except
        Exit;
     end;

     sPlanilhasExcluir := Copy(sPlanilhasExcluir, 1, (Length(sPlanilhasExcluir)-1));

     i := Pos(',', sPlanilhasExcluir);
     if i <= 0
     then i := Length(sPlanilhasExcluir)
     else i := (i-1);

     Repeat
       iPlnCodigo := StrToInt(OraNumero(Copy(sPlanilhasExcluir, 1, I)));

       Try
         if not CtrlLancamento.ExcluiLancaContab( Sistema.IdUsuario,                      // iUsuario
                                                  iPlnCodigo,                             // iPlnCodigo
                                                  Sistema.IdModulo,                       // iModuloOrigem
                                                  0,                                      // iNumLan
                                                  Sistema.UsaPlanoPatro,                  // bUsaPlanoPatro
                                                  True                                    // bExcluiPlanilha
                                                 )
         then begin
            FreeAndNil( CtrlLancamento ); 
            Exit;
         end;

       Except
         FreeAndNil( CtrlLancamento );  
         Exit;
       End;

       // Atualiza string das planilhas
       sPlanilhasExcluir := Copy(sPlanilhasExcluir, i+1, Length(sPlanilhasExcluir));
       i := Pos(',', sPlanilhasExcluir);
       if i <= 0
       Then i := Length(sPlanilhasExcluir);

     Until Trim(sPlanilhasExcluir) = '';
     FreeAndNil( CtrlLancamento );  
   End; // if sPlanilhasExcluir <> ''

   // 6. DESFAZER - Prepara contribuicoes e beneficios     - HSTBENEFBFCIARIO, HSTCONTRIBPREV
   with dtmAPrev.qryTransfPlano do
   begin
      sNumerosProcesso := '';
      Close;
      SQL.Clear;
      SQL.Add(' SELECT P.NUMEROPROCESSO, BF.IDBENEFICIO, B.NOME, BF.IDTPPAGTOBENEFIC     '+
              ' FROM   PROCESSOBENEF P,  BENEFBFCIARIO BF, BENEFICIO B                   '+
              ' WHERE  P.NUMEROPROCESSO  = BF.NUMEROPROCESSO                             '+
              ' AND    P.DTREGISTRO      >= TO_DATE('''+sDataEvento+''',''DD/MM/YYYY'')  '+
              ' AND    BF.IDTITULAR      = '+IntToStr(piIdTitular)                        +
              ' AND    BF.IDPESSOA       = '+IntToStr(piIdPessoa)                         +
              ' AND    BF.IDPESSJUR      = '+IntToStr(piIdPessJur)                        +
              ' AND    BF.IDPLANOPREV    = '+IntToStr(piIdPlanoDestino)                   +
              ' AND    BF.IDBENEFICIO    = B.IDBENEFICIO                                 ');
      Open;

      if not IsEmpty
      then begin
         First;
         while not Eof do
         begin
            sNumerosProcesso := sNumerosProcesso+','+FieldByName('NUMEROPROCESSO').AsString;
            Next;
         end;

         sNumerosProcesso := Copy(sNumerosProcesso,2,length(sNumerosProcesso)-1);
      end;

      if Trim(sNumerosProcesso) <> ''
      then begin
         Close;
         SQL.Clear;
         SQL.Add(' DELETE FROM HSTATRASOBENEF                          '+
                 ' WHERE  NUMEROPROCESSO IN ('+sNumerosProcesso +')    '+
                 ' AND    IDPESSJUR     = '+IntToStr(piIdPessJur)       +
                 ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoDestino)  +
                 ' AND    IDTITULAR     = '+IntToStr(piIdTitular)       +
                 ' AND    IDPESSOA      = '+IntToStr(piIdPessoa)        +
                 ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta)     );
         try
            ExecSQL;
         except
            Exit;
         end;

         Close;
         SQL.Clear;
         SQL.Add(' DELETE FROM HSTBENEFBFCIARIO                        '+
                 ' WHERE  NUMEROPROCESSO IN ('+sNumerosProcesso +')    '+
                 ' AND    IDPESSJUR     = '+IntToStr(piIdPessJur)       +
                 ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoDestino)  +
                 ' AND    IDTITULAR     = '+IntToStr(piIdTitular)       +
                 ' AND    IDPESSOA      = '+IntToStr(piIdPessoa)        +
                 ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta)     );
         try
            ExecSQL;
         except
         //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
          on e:Exception do
          begin
            TratarErro(e.Message);
            Exit;
         end;
          //Brunno Mattos - KTN 767861 - SOL 132659 Fim
            
         end;
      end;
      // --
      Close;
      SQL.Clear;
      if piIdTitular = piIdPessoa
      then begin
         SQL.Add(' DELETE FROM HSTATRASOCONTRIB HA                                        '+
                 ' WHERE  EXISTS  ( SELECT 1                                              '+
                 '                  FROM   HSTCONTRIBPREV H                               '+
                 '                  WHERE  H.IDPESSJUR     = '+IntToStr(piIdPessJur)       +
                 '                  AND    H.IDPLANOPREV   = '+IntToStr(piIdPlanoDestino)  +
                 '                  AND    H.IDPESSOA      = '+IntToStr(piIdTitular)       +
                 '                  AND    HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO           '+
                 '                  AND    HA.MESREFERENCIA  = H.MESREFERENCIA            '+
                 '                  AND    HA.MESCOBRANCA    = H.MESCOBRANCA             )');
      end
      else begin
         SQL.Add(' DELETE FROM HSTATRASOCONTRIB HA                                        '+
                 ' WHERE  EXISTS  ( SELECT 1                                              '+
                 '                  FROM   HSTCONTRIBPREV H                               '+
                 '                  WHERE  H.IDPESSJUR     = '+IntToStr(piIdPessJur)       +
                 '                  AND    H.IDPLANOPREV   = '+IntToStr(piIdPlanoDestino)  +
                 '                  AND    EXISTS ( SELECT 1                                                               '+
                 '                                  FROM   BFCIARIOTITPLAN BTIT, NUCLEOFAMILIAR N, CONTRIBPREVNUCLEO CN    '+
                 '                                  WHERE  BTIT.IDPESSJUR       = '+IntToStr(piIdPessJur)                   +
                 '                                  AND    BTIT.IDPLANOPREV     = '+IntToStr(piIdPlanoDestino)              +
                 '                                  AND    BTIT.IDTITULAR       = '+IntToStr(piIdTitular)                   +
                 '                                  AND    BTIT.IDPESSOA        = '+IntToStr(piIdPessoa)                    +
                 '                                  AND    BTIT.SEQPROPOSTA     = '+IntToStr(piSeqProposta)                 +
                 '                                  AND    N.IDNUCLEOFAMILIAR   = BTIT.IDNUCLEOFAMILIAR                    '+
                 '                                  AND    CN.IDNUCLEOFAMILIAR  = N.IDNUCLEOFAMILIAR                       '+
                 '                                  AND    H.IDPESSOA           = N.IDRESPNUCLEO                           '+
                 '                                  AND    H.IDCONTRIBUICAO     = CN.IDCONTRIBUICAO )                      '+
                 '                  AND    HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO           '+
                 '                  AND    HA.MESREFERENCIA  = H.MESREFERENCIA            '+
                 '                  AND    HA.MESCOBRANCA    = H.MESCOBRANCA             )');
      end;

      try
         ExecSQL;
      except
         Exit;
      end;

      // --
      Close;
      SQL.Clear;
      if piIdTitular = piIdPessoa
      then begin
         SQL.Add(' DELETE FROM HSTCONTRIBPREV                          '+
                 ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)       +
                 ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoDestino)  +
                 ' AND    IDPESSOA      = '+IntToStr(piIdTitular));

      end
      else begin
         SQL.Add(' DELETE FROM HSTCONTRIBPREV H                        '+
                 ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)       +
                 ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoDestino)  +
                 ' AND    EXISTS ( SELECT 1                                                               '+
                 '                 FROM   BFCIARIOTITPLAN BTIT, NUCLEOFAMILIAR N, CONTRIBPREVNUCLEO CN    '+
                 '                 WHERE  BTIT.IDPESSJUR       = '+IntToStr(piIdPessJur)                   +
                 '                 AND    BTIT.IDPLANOPREV     = '+IntToStr(piIdPlanoDestino)              +
                 '                 AND    BTIT.IDTITULAR       = '+IntToStr(piIdTitular)                   +
                 '                 AND    BTIT.IDPESSOA        = '+IntToStr(piIdPessoa)                    +
                 '                 AND    BTIT.SEQPROPOSTA     = '+IntToStr(piSeqProposta)                 +
                 '                 AND    N.IDNUCLEOFAMILIAR   = BTIT.IDNUCLEOFAMILIAR                    '+
                 '                 AND    CN.IDNUCLEOFAMILIAR  = N.IDNUCLEOFAMILIAR                       '+
                 '                 AND    H.IDPESSOA           = N.IDRESPNUCLEO                           '+
                 '                 AND    H.IDCONTRIBUICAO     = CN.IDCONTRIBUICAO )                      ');
      end;

      try
         ExecSQL;
      except
         Exit;
      end;
   end; // 6. Fim-Desfazer


   // 5. Se for assistido, insere beneficios    - BFCIARIOTITPLAN, PROCESSOBENEF, BENEFBFCIARIO
   with dtmAPrev.qryTransfPlano do
   begin
      if not DesfazRequerimentos(dtmAPrev.qryTransfPlano,sNumerosProcesso)
      then Exit;

      // Apagar bfciariotitplan no plano destino
      Close;
      SQL.Clear;
      SQL.Add(' DELETE FROM BFCIARIOTITPLAN  '+
              ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoDestino)+
              ' AND    IDTITULAR     = '+IntToStr(piIdTitular)+
              ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

      try
         ExecSQL;
      except
         Exit;
      end;


      // Reativar beneficios do plano de origem
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE PROCESSOBENEF P SET IDSITPROCESSO = 1                                       '+
              ' WHERE  EXISTS ( SELECT 1 FROM BENEFBFCIARIO BF                                     '+
              '                 WHERE  BF.IDPESSJUR     = '+IntToStr(piIdPessJur)                   +
              '                 AND    BF.IDPLANOPREV   = '+IntToStr(piIdPlanoOrigem)               +
              '                 AND    BF.IDTITULAR     = '+IntToStr(piIdTitular)                   +
              '                 AND    BF.IDPESSOA      = '+IntToStr(piIdPessoa)                    +
              '                 AND    BF.SEQPROPOSTA   = '+IntToStr(piSeqProposta)                 +
              '                 AND    BF.IDSITBENEFICIO = 3                                       '+
              '                 AND    TO_CHAR(BF.DATAFINAL,''DD/MM/YYYY'') = '''+sDataEvento+'''  '+
              '                 AND    P.NUMEROPROCESSO = BF.NUMEROPROCESSO                       )');

      try
         ExecSQL;
      except
         Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add(' UPDATE BENEFBFCIARIO SET IDSITBENEFICIO = 1, DATAFINAL = NULL '+
              ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoOrigem)+
              ' AND    IDTITULAR     = '+IntToStr(piIdTitular)+
              ' AND    IDPESSOA      = '+IntToStr(piIdPessoa)+
              ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

      try
         ExecSQL;
      except
         Exit;
      end;
   end;

   // 4. Se for participante, associa contrib.  - CONTRIBPREVPARTP
   if piIdTitular = piIdPessoa
   then begin
      with dtmAPrev.qryTransfPlano do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' DELETE FROM CONTRIBPREVPARTP '+
                 ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
                 ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoDestino)+
                 ' AND    IDPESSOA      = '+IntToStr(piIdTitular)+
                 ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

         try
            ExecSQL;
         except
            Exit;
         end;

         Close;
         SQL.Clear;
         SQL.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1, DATAFINAL = NULL '+
                 ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)              +
                 ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoOrigem)          +
                 ' AND    IDPESSOA      = '+IntToStr(piIdTitular)              +
                 ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta)            +
                 ' AND    FLGCOBRA      = 0                                   '+
                 ' AND    TO_CHAR(DATAFINAL,''DD/MM/YYYY'') = ''' + FormatDateTime('dd/mm/yyyy', StrToDate(sDataEvento)-1) + ''''); 
         try
            ExecSQL;
         except
            Exit;
         end;
      end;
   end;

   // 3. Associa reservas no plano destino      - RESERVAPART
   with dtmAPrev.qryTransfPlano do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' DELETE FROM RESERVAPART '+
              ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoDestino)+
              ' AND    IDPESSOA      = '+IntToStr(piIdTitular)+
              ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

      try
         ExecSQL;
      except
         Exit;
      end;
   end;

   // 2. Insere evento no plano destino         - EVENTOSPREV
   with dtmAPrev.qryTransfPlano do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' DELETE FROM HSTCONTEVENTOSPR '+
              ' WHERE  IDEVENTOSPREV = '+IntToStr(iIdEventosPrev) );

      try
         ExecSQL;
      except
         Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add(' DELETE FROM EVENTOSPREV  '+
              ' WHERE  IDEVENTOSPREV = '+IntToStr(iIdEventosPrev) );

      try
         ExecSQL;
      except
         Exit;
      end;
   end;

   // 1. Insere participante no plano destino   - PARTPREVPLAN
   with dtmAPrev.qryTransfPlano do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' DELETE FROM PARTPREVPLAN '+
              ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoDestino)+
              ' AND    IDPESSOA      = '+IntToStr(piIdTitular)+
              ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

      try
         ExecSQL;
      except
         Exit;
      end;
   end;

  // 0. Desativa e atualiza sit. no pl. origem - PARTPREVPLAN
   with dtmAPrev.qryTransfPlano do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE PARTPREVPLAN SET FLGDESATIVADO = 0, DATACANCELAMENTO = NULL, IDSITPLANOPREV = '+IntToStr(iIdSitPlanoPrev)+
              ' WHERE  IDPESSJUR     = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV   = '+IntToStr(piIdPlanoDestino)+
              ' AND    IDPESSOA      = '+IntToStr(piIdTitular)+
              ' AND    SEQPROPOSTA   = '+IntToStr(piSeqProposta));

      try
         ExecSQL;
      except
         Exit;
      end;
   end;

   Result := True;
end;

end.
