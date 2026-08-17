unit UBeneficio;

interface

uses  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
      Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
      ComCtrls , UAdmPrev;
// *****************************************************************************
// ******************************** ROTINAS PARA BENEFICIOS DO PARTICIPANTE
// *****************************************************************************
// Rotina que executa a regra de calculo de um beneficio
// Parametros : piIdRegraCalculo = Regra de Calculo do Beneficio (BENEFPLANPREV.IDREGRACALCULO)
//              piIdRegraCalcReserva = Regra de Calculo da Reserva (BENEFPLANPREV.IDREGRAPAGAMENTO)
//              psDataEvento = data do evento (PROCESSOBENEF.DTEVENTO)
//              psDataInicio = data do inicio (BENEFBFCIARIO.DATAINICIOFUND)
//              psSQLBenefAssoc = string com valores dos beneficios associados
//                                com virgula na frente


function ExecutaRegraElegibilidade(qryAux : TwwQuery;
                                   piIDREGRAELEGIBILI,
                                   piIdPessJur,   piIdPlanoPrev, piIdTitular,
                                   piSeqProposta, piIdBeneficio : longint;
                                   prOpcao1,      prOpcao2,   prOpcao3           : double;
                                   psDataEvento, psDataInicio, psDataDemissao,
                                   psDataRequerimento,
                                   psFlgInternoAntes,
                                   psFlgInternoAtual,
                                   psIdSitPartAntes,
                                   psIdSitPlanAntes,
                                   psIdSitFuncAntes,
                                   psIdSitPartAtual,
                                   psIdSitPlanAtual,
                                   psIdSitFuncAtual    : string;
                                   piNumBenef          : integer;
                                   piFlgTipoINSS       : integer;
                                   var bErro : boolean;
                                   var sMsgErro : string) : boolean;






function ExecutaRegraElegibilidadeBfciario(qryAux : TwwQuery;
                                   piIDREGRAELEGIBILI,
                                   piIdPessJur, piIdPlanoPrev, piIdTitular,
                                   piIdPessoa,
                                   piSeqProposta, piIdBeneficio : longint;
                                   prOpcao1, prOpcao2, prOpcao3           : double;
                                   psDataEvento, psDataInicio, psDataDemissao  : string;
                                   var bErro : boolean;
                                   var sMsgErro : string;
                                   piFlgTipoINSS       : integer
                                   ) : boolean; // FUNCEF




function ValidaBeneficioAnterior ( qryBeneficioAnt : TwwQuery;
                                   piIdPessJur,
                                   piIdPlanoPrev,
                                   piIdTitular,
                                   piSeqProposta,
                                   piIdEvento      : longint;
                                   bObrigatorio    : boolean;
                                   sDataEvento     : string;
                                   var sMsgErro    : string ) : boolean;



function BuscaDadosBeneficioAnterior ( qry : TwwQuery;
                                       piIdPessJur, piIdPlanoPrev, piIdTitular,
                                       piIdBeneficioAtual,
                                       piFlgReferenciaAtual  : longint;
                                       psDataInicioAtual     : string;
                                       var psDataInicioAnt,
                                           psValorAnt,
                                           psNomeBenefAnt,
                                           psIdTpPagtoAnt,
                                           psUltMesReajAnt,
                                           psFlgBenefMinAnt,
                                           psDataEventoAnt,
                                           psCodBeneficioAnt,
                                           psValorBase1,
                                           psValorBase2,
                                           psValorBase3,
                                           psNumProcINSS        : string; // CAMILLE - FUNCEF . 20.03.2001
                                       pbAlteraDataInicioEValor : boolean ) : boolean;

function VerificaINSSConcedido ( qry : TwwQuery;
                                 piIdPessJur, piIdPlanoPrev, piIdTitular,
                                 piIdPessoa,
                                 piIdBeneficioAtual     : longint;
                                 var psCodBeneficioINSS : string ) : boolean;

  { Rotinas para executar regras }

   function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
   function CalcDataInscFund(iIdPessjur,iIdPlanoPrev,iIdPessoa,iSeqProposta : integer; qry : TwwQuery):string;

implementation

uses  DAPrev, UDatabase, FAguarde, UMensErro,
      UFuncoesUteis, USistema;




function ExecutaRegraElegibilidade(qryAux : TwwQuery;
                                   piIDREGRAELEGIBILI,
                                   piIdPessJur,   piIdPlanoPrev, piIdTitular,
                                   piSeqProposta, piIdBeneficio : longint;
                                   prOpcao1,      prOpcao2,   prOpcao3           : double;
                                   psDataEvento, psDataInicio, psDataDemissao,
                                   psDataRequerimento,
                                   psFlgInternoAntes,
                                   psFlgInternoAtual,
                                   psIdSitPartAntes,
                                   psIdSitPlanAntes,
                                   psIdSitFuncAntes,
                                   psIdSitPartAtual,
                                   psIdSitPlanAtual,
                                   psIdSitFuncAtual    : string;
                                   piNumBenef          : integer;
                                   piFlgTipoINSS       : integer;
                                   var bErro           : boolean;
                                   var sMsgErro        : string) : boolean;
var sSQLDataDemissao,
    sDataInscFund,
    sDataInicio,
    sSQL,
    sDataRef : string;
    bConcedeBeneficio  : boolean;
    piFlgINSSConcedido : integer;

    // DADOS DO BENEFICIO ANTERIOR
    sDataInicioAnt,
    sValorAnt,
    sNomeBenefAnt,
    sIdTpPagtoAnt,
    sUltMesReajAnt,
    sFlgBenefMinAnt,
    sDataEventoAnt,
    sCodBeneficioAnt,
    sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
    sCodBeneficioINSS,
    sValorBase1Ant, sValorBase2Ant, sValorBase3Ant : string;

begin
  Result := False;
  if piIDREGRAELEGIBILI <= 0 then Exit;

  sDataInscFund := CalcDataInscFund(piIdPessJur,   piIdPlanoPrev, piIdTitular,
                                   piSeqProposta,qryAux);

  if Trim(psDataEvento) = '' then psDataEvento := DateToStr(date);
  if Trim(psDataInicio) = '' then psDataInicio := DateToStr(date);
  if Trim(psDataRequerimento) = '' then psDataRequerimento := DateToStr(date);

  sDataInicio := psDataInicio;
  sDataRef := psDataEvento;

   // Traz todas as situaçoes do participante
  if (Trim(psFlgInternoAntes) = '') or (Trim(psFlgInternoAtual) = '')
  then begin
      sSQL := 'select ev.ideventosprev, ev.idsitplanoatual, ev.idsitplanonovo, '+
            'ev.idsitpartatual, ev.idsitpartnovo, ev.idsitfuncatual, ev.idsitfuncnovo, '+
            'st.flginterno,     sta.flginterno as flginternoant    '+
            'from   eventosprev ev, sitpart st,  sitpart sta  '+
            'where  ev.idsitpartatual = sta.idsitpart         '+
            'and    ev.idsitpartnovo  = st.idsitpart          '+
            'and    ev.ideventosprev in (Select Max(ideventosPrev)     '+
                                                     'From eventosprev '+
                                                     'where '+
                                                          'idpessoa    = '+ IntToStr(piIdTitular)    + ' and '+
                                                          'idplanoprev = '+ IntToSTr(piIdPlanoPrev) + ' and '+
                                                          'idpessjur   = '+ IntToStr(piIdPessJur)   +')';
      dtmAPrev.qry.Close;
      dtmAPrev.qry.Sql.Clear;
      dtmAPrev.qry.Sql.Add(sSql);
      dtmAPrev.qry.Open;

      psFlgInternoAntes := dtmAPrev.qry.FieldByName('flginternoant').AsString;
      psFlgInternoAtual := dtmAPrev.qry.FieldByName('flginterno').AsString;

      psIdSitPartAntes := dtmAPrev.qry.FieldByName('idsitpartatual').AsString;
      psIdSitPlanAntes := dtmAPrev.qry.FieldByName('idsitplanoatual').AsString;
      psIdSitFuncAntes := dtmAPrev.qry.FieldByName('idsitfuncatual').AsString;

      psIdSitPartAtual := dtmAPrev.qry.FieldByName('idsitpartnovo').AsString;
      psIdSitPlanAtual := dtmAPrev.qry.FieldByName('idsitplanonovo').AsString;
      psIdSitFuncAtual := dtmAPrev.qry.FieldByName('idsitfuncnovo').AsString;
      // Fim guarda situaçoes
  end;

  // FUNCEF - 20.03.2001
  // Verificar se algum benefício do INSS está requerido
  if VerificaINSSConcedido ( qryAux,
                             piIdPessJur, piIdPlanoPrev, piIdTitular, piIdTitular,
                             piIdBeneficio, sCodBeneficioINSS )
  then piFlgINSSConcedido := 1
  else piFlgINSSConcedido := 0;

  BuscaDadosBeneficioAnterior ( qryAux,
                                piIdPessJur, piIdPlanoPrev, piIdTitular,
                                piIdBeneficio,
                                0,
                                psDataInicio,
                                sDataInicioAnt,
                                sValorAnt,
                                sNomeBenefAnt,
                                sIdTpPagtoAnt,
                                sUltMesReajAnt,
                                sFlgBenefMinAnt,
                                sDataEventoAnt,
                                sCodBeneficioAnt,
                                sValorBase1Ant, sValorBase2Ant, sValorBase3Ant,
                                sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
                                False);

  if   psDataDemissao = ''
  then sSQLDataDemissao := 'EL.DATADEMISSAO '
  else sSQLDataDemissao := ''''+Trim(psDataDemissao)+''' AS DATADEMISSAO ';

  sSQL := ' SELECT  PF.DATANASC,  PF.DATAMORTE, PF.SEXO, PF.ESTCIVIL, '+
          '         EL.TEMPONAOCREDITADO, EL.DATAADMISSAO, EL.IDSITFUNC, '+
          '         EL.TEMPOSERVTOTAL, '+
          '         EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
          '         EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL, DE.FLGBENEFICIARIO, ' +
          '         PP.FLGDEVEPREVIDENC, PP.FLGDEVEASSISTENC, PP.FLGDEVEEMPRESTIMO, '+
          '         PP.IDSITPART, PP.IDSITPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA, '+
          '         PP.IDPESSJUR,  PP.IDPLANOPREV,  PP.INSCRICAODATA, SP.FLGINTERNO, '+
          sSQLDataDemissao+','+
          IntToStr(piNumBenef)           + '   AS NUMBENEF,              '+
          IntToStr(piFlgINSSConcedido)   + '   AS FLGINSSCONCEDIDO,      '+
          ''''+sCodBeneficioINSS         + '''   AS CODBENEFICIOINSS,      '+
          '''' + Trim(sDataInicio)       + ''' AS DATAINICIO,              '+
          '''' + Trim(psDataRequerimento)+ ''' AS DATAREQUERIMENTO, '+
          '''' + Trim(psDataEvento)      + ''' AS DATAEVENTO,             '+
          '''' + Trim(psDataEvento)      + ''' AS DTEVENTO,               '+
          '''' + sDataInscFund           + ''' AS INSCRICAODATAFUND,       '+
          '''' + sDataRef                + ''' AS DATAREF,                 '+
          OraNumero(FloatToStr(prOpcao1))+ ' AS VALORBASE1,         '+
          OraNumero(FloatToStr(prOpcao2))+ ' AS VALORBASE2,         '+
          OraNumero(FloatToStr(prOpcao3))+ ' AS VALORBASE3,         '+
          IntToStr(piFlgTipoINSS)        + ' AS FLGTIPOINSS,               '+
          ''''+psFlgInternoAntes         +''' AS FLGINTERNOANT,   '+
          ''''+psFlgInternoAtual         +''' AS FLGINTERNO,      '+
          ''''+psIdSitPartAntes          +''' AS IDSITPARTATUAL,  '+
          ''''+psIdSitPlanAntes          +''' AS IDSITPLANOATUAL, '+
          ''''+psIdSitFuncAntes          +''' AS IDSITFUNCATUAL,  '+
          ''''+psIdSitPartAtual          +''' AS IDSITPARTNOVO,   '+
          ''''+psIdSitPlanAtual          +''' AS IDSITPLANONOVO,  '+
          ''''+psIdSitFuncAtual          +''' AS IDSITFUNCNOVO,   '+
          ''''+    sIdTpPagtoAnt           +''' AS IDTPPAGTOANT,     '+ // CAMILLE - FUNCEF - 20.03.2001
          ''''+    sUltMesReajAnt          +''' AS ULTMESREAJANT,    '+ // CAMILLE - FUNCEF - 20.03.2001
          ''''+    sFlgBenefMinAnt         +''' AS FLGBENEFMINANT,   '+ // CAMILLE - FUNCEF - 20.03.20011
          '''' +   Trim(sDataEventoAnt)    +''' AS DATAEVENTOANT,    '+ // CAMILLE - FUNCEF - 20.03.2001
          '''' +   Trim(sCodBeneficioAnt)  +''' AS CODBENEFICIOANT,   '+ // CAMILLE - FUNCEF - 20.03.2001
          '''' +   Trim(sDataInicioAnt)    +''' AS DATAINICIOANT,    '+ // CAMILLE - FUNCEF - 20.03.2001
          OraNumero(sValorAnt)             +' AS VLBENEFPGTO,        '+ // CAMILLE - FUNCEF - 20.03.2001
          OraNumero(sValorAnt)             +' AS VALORBENEFANT       '+ // CAMILLE - FUNCEF - 20.03.2001
          ' FROM  ELEGPATRO EL, DEPENTIT DE, PESSOAFISICA PF, '+
          '       PARTPREVPLAN PP, SITPART SP                '+
          ' WHERE PP.IDPESSOA    = ' + IntToStr(piIdTitular)  + ' AND ' +
          '       PP.SEQPROPOSTA = ' + IntToStr(piSeqProposta)+ ' AND ' +
          '       PP.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev) + ' AND ' +
          '       PP.IDPESSJUR   = ' + IntToStr(piIdPessJur)   + ' AND ' +
          '       EL.IDPESSOA  = PP.IDPESSOA  AND '+
          '       EL.IDPESSJUR = PP.IDPESSJUR AND '+
          '       SP.IDSITPART = PP.IDSITPART AND '+
          '       DE.IDTITULAR = EL.IDPESSOA  AND '+
          '       DE.IDPESSOA  = EL.IDPESSOA  AND '+
          '       EL.IDPESSOA  = PF.IDPESSOA(+) ';

  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     try
        Open;
     except
        Close;
        bErro := True;
        sMsgErro := ' Ocorreu um erro ao verificar dados para a Regra de Elegibilidade do Benefício (nº '+IntToStr(piIDREGRAELEGIBILI)+') ';
        Result  := False;
        Exit;
     end;

     if IsEmpty   // NÃO RETORNOU NADA DA QUERE
     then begin
        Close;
        bErro := True;
        sMsgErro := ' Não há dados para a execução da Regra de Elegibilidade do Benefício (nº '+IntToStr(piIDREGRAELEGIBILI)+') ';
        Result  := False;
        Exit;
     end;
  end;

  bConcedeBeneficio := RegraBooleana(IntToStr(piIDREGRAELEGIBILI) ,sSQL , bErro);

  if bErro
  then begin
     bErro := True;
     sMsgErro := ' Ocorreu um erro na Regra de Elegibilidade do Benefício (nº '+IntToStr(piIDREGRAELEGIBILI)+') ';
     Result  := False;
     Exit;
  end;

  sMsgErro := ' ';
  Result := bConcedeBeneficio;
end; // ExecutaRegraElegibilidade





// *****************************************************************************
// ******************************** ROTINAS PARA BENEFICIOS DOS BENEFICIARIOS
// *****************************************************************************



function ExecutaRegraElegibilidadeBfciario(qryAux : TwwQuery;
                                   piIDREGRAELEGIBILI,
                                   piIdPessJur, piIdPlanoPrev, piIdTitular,
                                   piIdPessoa,
                                   piSeqProposta, piIdBeneficio : longint;
                                   prOpcao1, prOpcao2, prOpcao3           : double;
                                   psDataEvento, psDataInicio, psDataDemissao  : string;
                                   var bErro : boolean;
                                   var sMsgErro : string;
                                   piFlgTipoINSS       : integer) : boolean; // FUNCEF
var sSQLDataDemissao,
    sDataInscFund,
    sDataInicio,
    sSQL,
    sDataRef : string;
    bConcedeBeneficio : boolean;

    // DADOS DO BENEFICIO ANTERIOR
    sDataInicioAnt,
    sValorAnt,
    sNomeBenefAnt,
    sIdTpPagtoAnt,
    sUltMesReajAnt,
    sFlgBenefMinAnt,
    sDataEventoAnt,
    sCodBeneficioAnt,
    sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
    sCodBeneficioINSS,
    sValorBase1Ant, sValorBase2Ant, sValorBase3Ant : string;
    piFlgINSSConcedido : word;
begin
  Result := False;
  if piIDREGRAELEGIBILI <= 0
  then begin
     Result := True;
     Exit;
  end;
  sDataInscFund := CalcDataInscFund(piIdPessJur, piIdPlanoPrev, piIdTitular, piSeqProposta,qryAux);

  if Trim(psDataEvento) = '' then psDataEvento := DateToStr(date);
  if Trim(psDataInicio) = '' then psDataInicio := DateToStr(date);
  sDataInicio := psDataInicio;
  sDataRef := psDataEvento;

  // FUNCEF - 21.03.2001
  // Verificar se algum benefício do INSS está requerido
  if VerificaINSSConcedido ( qryAux,
                             piIdPessJur, piIdPlanoPrev, piIdTitular, piIdPessoa,
                             piIdBeneficio,sCodBeneficioINSS )
  then piFlgINSSConcedido := 1
  else piFlgINSSConcedido := 0;


  if   psDataDemissao = ''
  then sSQLDataDemissao := 'EL.DATADEMISSAO '
  else sSQLDataDemissao := ''''+Trim(psDataDemissao)+''' AS DATADEMISSAO ';

  BuscaDadosBeneficioAnterior ( qryAux,
                                piIdPessJur, piIdPlanoPrev, piIdTitular,
                                piIdBeneficio,
                                0,
                                psDataInicio,
                                sDataInicioAnt,
                                sValorAnt,
                                sNomeBenefAnt,
                                sIdTpPagtoAnt,
                                sUltMesReajAnt,
                                sFlgBenefMinAnt,
                                sDataEventoAnt,
                                sCodBeneficioAnt,
                                sValorBase1Ant, sValorBase2Ant, sValorBase3Ant,
                                sNumProcINSS, // CAMILLE - FUNCEF - 20.03.2001
                                False);

  sSQL := ' SELECT  PF.DATANASC,  PF.DATAMORTE, PF.SEXO, PF.ESTCIVIL,               '+
          '         EL.TEMPONAOCREDITADO, EL.DATAADMISSAO, EL.IDSITFUNC,            '+
          '         EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL, DE.FLGBENEFICIARIO,  '+
          '         EL.TEMPOSERVTOTAL,                                              '+
          '         EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA,                         '+
          '         PP.FLGDEVEPREVIDENC, PP.FLGDEVEASSISTENC, PP.FLGDEVEEMPRESTIMO, '+
          '         PP.IDSITPART, PP.IDSITPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,   '+
          '         PP.IDPESSJUR,  PP.IDPLANOPREV,  PP.INSCRICAODATA,SP.FLGINTERNO, '+
          '         BF.IDDEPENRESPON, BF.IDRESPONSAVEL, BF.PERCENTUAL,              '+
          '         BF.PRIORIDADE, D.FLGDESIGNADO,                                  '+
          '         DE.IDDEPENDENCIA, D.IDSITDEPENDENTE, DE.IDTITULAR,              '+
          sSQLDataDemissao+','+
          '''' + Trim(sDataInicio)    + ''' AS DATAINICIO,             '+
          '''' + Trim(psDataEvento)   + ''' AS DATAEVENTO,             '+
          '''' + Trim(psDataEvento)   + ''' AS DTEVENTO,               '+
          '''' + sDataInscFund        + ''' AS INSCRICAODATAFUND,      '+
          '''' + sDataRef             + ''' AS DATAREF,                '+
          IntToStr(piFlgTipoINSS)     + ' AS FLGTIPOINSS,              '+
          IntToStr(piFlgINSSConcedido)+ ' AS FLGINSSCONCEDIDO,         '+
          ''''+sCodBeneficioINSS         + '''   AS CODBENEFICIOINSS,    '+
          OraNumero(FloatToStr(prOpcao1))+ ' AS VALORBASE1,            '+
          OraNumero(FloatToStr(prOpcao2))+ ' AS VALORBASE2,            '+
          OraNumero(FloatToStr(prOpcao3))+ ' AS VALORBASE3,            '+
          ''''+    sIdTpPagtoAnt           +''' AS IDTPPAGTOANT,       '+ // CAMILLE - FUNCEF - 20.03.2001
          ''''+    sUltMesReajAnt          +''' AS ULTMESREAJANT,      '+ // CAMILLE - FUNCEF - 20.03.2001
          ''''+    sFlgBenefMinAnt         +''' AS FLGBENEFMINANT,     '+ // CAMILLE - FUNCEF - 20.03.20011
          '''' +   Trim(sDataEventoAnt)    +''' AS DATAEVENTOANT,      '+ // CAMILLE - FUNCEF - 20.03.2001
          '''' +   Trim(sCodBeneficioAnt)  +''' AS CODBENEFICIOANT,     '+ // CAMILLE - FUNCEF - 20.03.2001
          '''' +   Trim(sDataInicioAnt)   +''' AS DATAINICIOANT,      '+ // CAMILLE - FUNCEF - 20.03.2001
          OraNumero(sValorAnt)       +' AS VLBENEFPGTO,          '+ // CAMILLE - FUNCEF - 20.03.2001
          OraNumero(sValorAnt)       +' AS VALORBENEFANT         '+ // CAMILLE - FUNCEF - 20.03.2001
          ' FROM  ELEGPATRO EL, DEPENTIT DE, PESSOAFISICA PF,          '+
          '       PARTPREVPLAN PP, SITPART SP, BFCIARIOTITPLAN BF,     '+
          '       DEPENDENTE D                                         '+
          ' WHERE PP.IDPESSOA    = ' + IntToStr(piIdTitular)   + ' AND '+
          '       PP.SEQPROPOSTA = ' + IntToStr(piSeqProposta) + ' AND '+
          '       PP.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev) + ' AND '+
          '       PP.IDPESSJUR   = ' + IntToStr(piIdPessJur)   + ' AND '+
          '       DE.IDPESSOA    = ' + IntToStr(piIdPessoa )   + ' AND '+
          '       BF.IDBENEFICIO = ' + IntToStr(piIdBeneficio) + ' AND '+
          '       DE.IDPESSOA    = D.IDPESSOA AND                      '+
          '       EL.IDPESSOA  = PP.IDPESSOA  AND                      '+
          '       EL.IDPESSJUR = PP.IDPESSJUR AND                      '+
          '       SP.IDSITPART = PP.IDSITPART AND                      '+
          '       DE.IDTITULAR = EL.IDPESSOA  AND                      '+
          '       DE.IDPESSOA  = PF.IDPESSOA(+) AND                    '+
          '       BF.IDPESSOA  = DE.IDPESSOA AND                       '+
          '       BF.IDTITULAR = DE.IDTITULAR AND                      '+
          '       BF.IDPLANOORIGEM = PP.IDPLANOPREV AND                '+
          '       BF.IDPESSJUR  = PP.IDPESSJUR                         ';

  bConcedeBeneficio := RegraBooleana(IntToStr(piIDREGRAELEGIBILI) ,sSQL , bErro);

  if bErro
  then begin
     bErro := True;
     sMsgErro := ' Ocorreu um erro na Regra de Elegibilidade do Benefício (nº '+IntToStr(piIDREGRAELEGIBILI)+') ';
     Result  := False;
     Exit;
  end;

  sMsgErro := ' ';
  Result := bConcedeBeneficio;
end; // ExecutaRegraElegibilidadeBfciario




function ValidaBeneficioAnterior ( qryBeneficioAnt : TwwQuery;
                                   piIdPessJur,
                                   piIdPlanoPrev,
                                   piIdTitular,
                                   piSeqProposta,
                                   piIdEvento      : longint;
                                   bObrigatorio    : boolean;
                                   sDataEvento     : string;
                                   var sMsgErro    : string ) : boolean;
var bEncerrouBenefAnt,
    bEncerra          : boolean;
    sFlgInterno       : string;
begin
   Result   := False;

   if not bObrigatorio
   then begin
     qryBeneficioAnt.Close;
     qryBeneficioAnt.Sql.Clear;
     qryBeneficioAnt.Sql.Add(' SELECT FLGENCERRABENEFI FROM EVENTOGERADOR ' +
                             ' WHERE  IDEVENTOGERADOR = ' +IntToStr(piIdEvento) );
     qryBeneficioAnt.Open;
     bEncerra := (qryBeneficioAnt.FieldByName('FLGENCERRABENEFI').AsInteger = 1);
   end
   else bEncerra := True;

   qryBeneficioAnt.Close;
   qryBeneficioAnt.Sql.Clear;
   qryBeneficioAnt.Sql.Add(' SELECT FLGINTERNO FROM EVENTOGERADOR ' +
                           ' WHERE  IDEVENTOGERADOR = ' +IntToStr(piIdEvento) );
   qryBeneficioAnt.Open;
   if qryBeneficioAnt.IsEmpty
   then begin
      sMsgErro := 'Parâmetros do evento não encontrados.';
      qryBeneficioAnt.Close;
      Exit;
   end;

   sFlgInterno := qryBeneficioAnt.FieldByName('FlgInterno').AsString;

   if Trim(sDataEvento) = '' then sDataEvento := DateToStr(date);
   
   with qryBeneficioAnt do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DISTINCT B.NOME,         BF.IDBENEFICIO, BF.IDTITULAR,     '+
              '                 BF.IDPLANOPREV, BF.IDPESSJUR,   BF.IDSITBENEFICIO,'+
              '                 BF.NUMEROPROCESSO, BF.DATAREQUERIMENTO,           '+
              '                 BF.FLGPROVISORIO                                  '+
              ' FROM   BENEFICIO B, BENEFBFCIARIO BF '+
              ' WHERE  (BF.IDPESSJUR      = '+IntToStr(piIdPessJur)  +') AND '+
              '        (BF.IDPLANOORIGEM    = '+IntToStr(piIdPlanoPrev)+') AND '+
              '        (BF.IDTITULAR      = '+IntToStr(piIdTitular)  +') AND '+
              '        (BF.IDPESSOA       = '+IntToStr(piIdTitular)  +') AND '+
              '        (BF.IDBENEFICIO    =  B.IDBENEFICIO) AND '+
              '        (BF.SEQPROPOSTA    = '+IntToStr(piSeqProposta)+') AND '+
              '        (BF.IDSITBENEFICIO IN (1,4)) ');         

      Open;
      // Se nao estiver vazia, entao o participante possui algum beneficio
      //    em aberto (normal ou nao concedido(pendente)
      if IsEmpty
      then begin
         Result := True;
         Close;
         Exit;
      end;

      // Se o beneficiario estiver concedido e for provisorio,
      // entao nao pode requerer outro beneficio
      if (FieldByName('IdSitBeneficio').AsInteger = 1) and (FieldByName('FlgProvisorio').AsInteger = 1)
      then begin
         sMsgErro := 'O benefício "'+FieldByName('Nome').AsString+'" requerido em '+
                     FieldByName('DataRequerimento').AsString+' é um "Benefício Provisório" '+#13+
                     'e deverá ser encerrado para haver um novo requerimento.'+#13+
                     'Verifique o Processo Nº '+FieldByName('NumeroProcesso').AsString+'.';
         Close;
         Exit;
      end;

      if not bEncerra
      then begin
         Result := True;
         Close;
         Exit;
      end;
   end;//with
   Result := True;
end;//ValidaBeneficioAnterior



function BuscaDadosBeneficioAnterior ( qry : TwwQuery;
                                       piIdPessJur, piIdPlanoPrev, piIdTitular,
                                       piIdBeneficioAtual,
                                       piFlgReferenciaAtual  : longint;
                                       psDataInicioAtual    : string;
                                       var psDataInicioAnt,
                                           psValorAnt,
                                           psNomeBenefAnt,
                                           psIdTpPagtoAnt,
                                           psUltMesReajAnt,
                                           psFlgBenefMinAnt,
                                           psDataEventoAnt,
                                           psCodBeneficioAnt,
                                           psValorBase1,
                                           psValorBase2,
                                           psValorBase3,
                                           psNumProcINSS        : string;
                                           pbAlteraDataInicioEValor : boolean ) : boolean;
var iNumeroProcessoEncontrado : longint;
    dValorTotal               : double;
begin
  Result := False;
  with qry do
  begin
     // CAMILLE - REFER - 02.03.2001
     Close;
     SQL.Clear;
     SQL.Add(' SELECT P.DTEVENTO,          P.NUMEROPROCESSO, BP.FLGREFERENCIA,    '+
             '        BF.IDBENEFICIO,      BF.DATAINICIO,                         '+
             '        BF.NUMPROCINSS,                                             '+
             '        BF.IDTPPAGTOBENEFIC, BF.FLGBENEFMIN,   BF.ULTMESREAJUSTE,   '+
             '        BF.VALORATUAL,       B.NOME,                                '+
             '        BPP.VALORBASE1,      BPP.VALORBASE2,     BPP.VALORBASE3     '+
             ' FROM   PROCESSOBENEF P,     BENEFPLANOPART BPP, BENEFBFCIARIO BF,  '+
             '        BENEFPLANPREV BP,    BENEFICIO B                            '+
             ' WHERE  (BF.IDPESSJUR       = '+IntToStr(piIdPessJur)    +')'+
             ' AND    (BF.IDPLANOORIGEM   = '+IntToStr(piIdPLANOPREV)  +')'+
             ' AND    (BF.IDPESSOA        = '+IntToStr(piIdTitular)    +')'+
             ' AND    (BF.IDTITULAR       = '+IntToStr(piIdTitular)    +')'+
             ' AND    (BF.IDBENEFICIO     <> '+IntToStr(piIdBeneficioAtual)+')'+
             ' AND    (BF.DATAINICIO      <= TO_DATE('''+psDataInicioAtual+''',''DD/MM/YYYY'') ) '+
             ' AND    (BF.IDPLANOPREV     = BP.IDPLANOPREV)   '+
             ' AND    (BF.IDBENEFICIO     = BP.IDBENEFICIO)   '+
             ' AND    (BF.NUMEROPROCESSO  = P.NUMEROPROCESSO) '+
             ' AND    (BP.FLGREFERENCIA   = '+IntToStr(piFlgReferenciaAtual)+')'+
             ' AND    (BP.IDBENEFICIO     = B.IDBENEFICIO)  '+
             ' AND    (BPP.IDPESSJUR(+)   = BF.IDPESSJUR)   '+
             ' AND    (BPP.IDPLANOPREV(+) = BF.IDPLANOPREV) '+
             ' AND    (BPP.IDPESSOA(+)    = BF.IDPESSOA)    '+
             ' AND    (BPP.SEQPROPOSTA(+) = BF.SEQPROPOSTA) '+
             ' AND    (BPP.IDBENEFICIO(+) = BF.IDBENEFICIO) '+
             ' ORDER BY BF.DATAINICIO DESC ' );
     Open;

     qry.First;
     if not qry.IsEmpty
     then begin
        if pbAlteraDataInicioEValor
        then begin
           psDataInicioAnt := qry.FieldByName('DATAINICIO').asString;
           psDataEventoAnt := qry.FieldbyName('DTEVENTO').AsString;
           psValorAnt      := OraNumero(qry.FieldByName('VALORATUAL').asString);
           dValorTotal     := qry.FieldByName('VALORATUAL').AsFloat;
        end;

        psNomeBenefAnt     := qry.FieldbyName('NOME').AsString;
        psIdTpPagtoAnt     := qry.FieldbyName('IDTPPAGTOBENEFIC').AsString;
        psUltMesReajAnt    := qry.FieldbyName('ULTMESREAJUSTE').AsString;
        psFlgBenefMinAnt   := qry.FieldbyName('FLGBENEFMIN').AsString;
        psCodBeneficioAnt  := qry.FieldbyName('IDBENEFICIO').AsString;
        psValorBase1       := qry.FieldbyName('VALORBASE1').AsString;
        psValorBase2       := qry.FieldbyName('VALORBASE2').AsString;
        psValorBase3       := qry.FieldbyName('VALORBASE3').AsString;
        psNumProcINSS      := qry.FieldbyName('NUMPROCINSS').AsString;

        if pbAlteraDataInicioEValor
        then begin
           iNumeroProcessoEncontrado := qry.FieldbyName('NUMEROPROCESSO').AsInteger;
           qry.Next;
           while not qry.Eof do
           begin
              if (qry.FieldbyName('NumeroProcesso').AsInteger = iNumeroProcessoEncontrado) and
                 (qry.FieldbyName('FLGREFERENCIA').AsInteger  = piFlgReferenciaAtual)
              then dValorTotal     := dValorTotal + qry.FieldByName('VALORATUAL').AsFloat;
              qry.Next;
           end;
           psValorAnt      := OraNumero(FloatToStr(dValorTotal));
        end;
     end
     else begin
        if pbAlteraDataInicioEValor
        then begin
           psDataInicioAnt := '';
           psValorAnt      := '0';
           psDataEventoAnt := '';
        end;
        psNomeBenefAnt     := '';
        psIdTpPagtoAnt     := '';
        psUltMesReajAnt    := '';
        psFlgBenefMinAnt   := '';

        psCodBeneficioAnt  := '';
        psValorBase1       := '0';
        psValorBase2       := '0';
        psValorBase3       := '0';
        psNumProcINSS      := '';
     end;
     Close;
  end;
  Result := True;
end;



function VerificaINSSConcedido ( qry : TwwQuery;
                                 piIdPessJur, piIdPlanoPrev, piIdTitular,
                                 piIdPessoa,
                                 piIdBeneficioAtual  : longint;
                                 var psCodBeneficioINSS : string ) : boolean;
begin
   Result := False;
   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT B.CODBENEFICIO, BF.DATAINICIO,BF.IDBENEFICIO,BF.VALORATUAL,BF.IDTPPAGTOBENEFIC,BF.FLGBENEFMIN, '+
              '        BF.VALORATUAL, B.NOME '+
              ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP, BENEFICIO B '+
              ' WHERE  (BF.IDPESSJUR      = '+IntToStr(piIdPessJur)     +')'+
              ' AND    (BF.IDPLANOORIGEM  = '+IntToStr(piIdPLANOPREV)   +')'+
              ' AND    (BF.IDPESSOA       = '+IntToStr(piIdPessoa)      +')'+
              ' AND    (BF.IDTITULAR      = '+IntToStr(piIdTitular)     +')'+
              ' AND    (BF.IDBENEFICIO    <> '+IntToStr(piIdBeneficioAtual)+')'+
              ' AND    (BF.IDSITBENEFICIO IN(1,4) )             '+
              ' AND    (BF.IDPLANOPREV    = BP.IDPLANOPREV) '+
              ' AND    (BF.IDBENEFICIO    = BP.IDBENEFICIO) '+
              ' AND    (BP.FLGREFERENCIA  = 1)              '+
              ' AND    (BP.IDBENEFICIO    = B.IDBENEFICIO)  ');
      Open;
      psCodBeneficioINSS := '';
      if not IsEmpty
      then Result := True;

      psCodBeneficioINSS := FieldByName('CODBENEFICIO').AsString;
      Close;
   end;
end; // VerificaINSSConcedido
{ FUNCOES RELACIONADAS AO SISTEMA DE  REGRA DE NEGOCIO }

function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
var sResult : string;
begin
   Result := True;
   bErro  := False;

   if Trim(sNumRegra) = '' then Exit;

   Result := False;
   with dtmAPrev do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      if qryRegra.IsEmpty
      then begin
         qryRegra.Close;
         tirasql(qryRegra);
         Exit;
      end;
      regraAPrev.QueryIn := dtmAPrev.qryRegra;
      regraAPrev.Execute;
      if not regraAPrev.Error
      then begin
         sResult     := Trim(UpperCase(regraAPrev.Result));
         if sResult  = 'FALSE'
         then Result := False
         else Result := True;
      end
      else bErro     := True;
      qryRegra.Close;
   end;
end;

 function CalcDataInscFund(iIdPessjur,iIdPlanoPrev,iIdPessoa,iSeqProposta : integer; qry : TwwQuery):string;
begin
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT INSCRICAODATA         '+
               ' FROM   PARTPREVPLAN          '+
               ' WHERE  IDPESSJUR   = '+ IntToStr(iIdPessjur)+
               ' AND    IDPLANOPREV = '+ IntToStr(iIdPlanoPrev)+
               ' AND    IDPESSOA    = '+ IntToStr(iIdPessoa)+
               ' AND    SEQPROPOSTA = '+ IntToStr(iSeqProposta)+
               ' ORDER BY INSCRICAODATA ');
   qry.Open;
   if qry.IsEmpty
   then Result := ''
   else Result := qry.FieldByName('InscricaoData').AsString;
end;



end.
