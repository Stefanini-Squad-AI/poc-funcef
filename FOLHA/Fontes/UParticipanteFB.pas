// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Responsável : Everson Luiz Pereira da Cunha
// Data        : 23/02/2018
// Pendência   : SIG TIBERO
// Descricao   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//               Retirada de INDEX, +rule etc.
//               Melhoria realizada para adaptação ao TIBERO.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 20/09/2006
// Rotina      : Diversas
// Pendência   : 23361
// Descricao   : Retirar RULE de consultas.
//------------------------------------------------------------------------------

unit UParticipanteFB;


interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, UFuncoesUteisFB;

    // Calcula o valor total da soma das reservas do participante
    function CalcReservaPart(iIdPessJur,iIdPlanoPrev, iIdPessoa, iIdRegra, iSeqProposta : integer; sDataRef, sDataInicio,
                             sDataInicioPagto,
                             sDataRequerBenef,  iIdBeneficio : string; qry : TwwQuery):string;

    // Calcula o valor da rubrica Remuneracao Total do participante
    function CalcRemTotal(iIdPessJur, iIdPessoa : integer; sMesRef : string; qry : TwwQuery) : string;

    // Calcula o valor da rubrica Salario de Participacao do participante
    function CalcSALPART(iIdPessJur, iIdPessoa : integer; sMesRef : string; qry : TwwQuery) : string;

    // Calcula o valor da rubrica Salario de Manutencao Parcial do participante
    function CalcRUBPARCIAL(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer; sMesRef : string; qry : TwwQuery) : string;

    // Calcula o valor da rubrica Salario de Manutencao integral do participante
    function CalcRUBMANTIDO(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer; sMesRef : string; qry : TwwQuery) : string;

    // Calcula o valor do Beneficio INSS no histórico de benefícios
    function CalcBENEFICIOINSS(iIdPessJur,iIdPlanoPrev, iIdPessoa : integer; qry : TwwQuery):string;

    // Calcular o valor do beneficio INSS atual que o participante está recebendo
    function CalcBeneficioINSSAtual(
      iIdPessJur, iIdPlanoPrev,
      iIdPessoa                   : integer;
      sMesInicio, sMesRef         : string;
      var psIDTPPAGTOANT,
      psFlgBenefMinimo            : string;
      qry                         : TwwQuery;
      iINumProcesso               : Integer;
      psFlgCampoRetorno : String = 'T' 
    )  : string; 

    // Calcula a data mais antiga do participante nos planos e patrocinadores
    // em que ele está
    //function CalcDataInscFund(iIdPessoa : integer; qry : TwwQuery):string;
    // Calcula a data mais antiga do participante nos planos e patrocinadores
    // em que ele está
    function CalcDataInscFund(iIdPessjur,iIdPlanoPrev,iIdPessoa,iSeqProposta : integer; qry : TwwQuery):string;

    // Calcula a data mais antiga do participante nos planos e patrocinadores
    // em que ele está
    function CalcDataDemissao(iIdPessoa, iIdPessJur : integer; qry : TwwQuery):string;

    // Calcula o valor do último benefício de um participante anterior a uma
    // determinada data
    function CalcUltimoBeneficio( iIdPessJur,iIdPlanoPrev,iIdPessoa,iIdBeneficio : integer;
                                  psDataRef,
                                  psFlgDestBenef  : string;
                                  var psIDTPPAGTOANT,psFlgBenefMinimo : string; qry : TwwQuery):string;

    function PegaUltMesReajAnterior( qry : TwwQuery;
                                     iIdPessJur, iIdPlanoPrev,
                                     iIdPessoa,  iIdBeneficio : integer;
                                     psDataRef                : string ) :string;

    function PossuiFilhoDependente(qry:TwwQuery; pIdPessoa:string):Char;

    // Verifica se um participante é reinscrito ou não
    function PartReinscrito (iIdPessJur, iIdPlanoPRev, iIdPessoa : integer; qry : TwwQuery) : boolean;

    // Verifica se um
    function PartResgPoupanca(iIdPessjur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer;
                          qry : TwwQuery) : boolean;

    // Calcula o ultimo mes que o participante pagou contribuicao
    function CalcUltMesContribuicao(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer; sMesRef : string; qry : TwwQuery) : string;

    function ProximaSequenciaDependente(iIdPessoa : longint; qry : TwwQuery) : longint;

    // Busca salario na tabela de participante PARTPREVPLAN
    function BuscaSalarioAtual(piIdPessJur,piIdPlanoPrev,piIdPessoa : integer; qry : TwwQuery):string;

    // Buscar salario na HistRubSal
    function BuscaSalario(piIdPessJur, piIdPlanoPrev, piIdPessoa  : longint;
                          psAnoMes, psSitFundacao,
                          sSalario                 : string;
                          var sMsgErro             : string;
                          qryAux                   : TwwQuery ) : string;
    function BuscaSalarioPESSOA (qryAux : TwwQuery;
                                 piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                                 psFlgIntSitPartHOJE,
                                 psAnoMesBusca : string ) : string;
    function CalcSalVIRTUAL(iIdPessJur, iIdPessoa  : integer; sMesRef : string; qry : TwwQuery) : string;
    function BuscaSalarioPESSOAINTEGRAL(qryAux : TwwQuery;
                                        piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                                        psFlgIntSitPartHOJE,
                                        psAnoMesBusca : string ) : string;

   function BuscaUltimoEvento        ( qryAux                              : TwwQuery;
                                       piIdPessJur,   piIdPlanoPrev,
                                       piIdPessoa ,   piSeqProposta        : longint;
                                       psDataRef,
                                       psNomeCampoRetorno                  : string ) : string ;

    // Calcular o valor do beneficio atual que o participante está recebendo
    function CalcBeneficioAtual(  iIdPessJur,iIdPlanoPrev,iIdPessoa : integer;
                                  sMesInicio,
                                  sMesRef : string;
                              var psIDTPPAGTOANT,
                                  psFlgBenefMinimo : string;
                                  qry : TwwQuery):string;
    // Verificar se participante possui uma determinada rubrica, em um determinado
    // mês
    function VerificaRubricaMES( piIdPessJur,  piIdPessoa,
                                 piIdRubrica                 : longint;
                                 psAnoMes                    : string;
                                 pbProcuraPorMesCobranca     : boolean;                                 
                                 qryAux                      : TwwQuery ) : boolean;

   function ApagaRubricaMES( piIdPessJur,  piIdPessoa,
                             piIdRubrica                 : longint;
                             psAnoMesInicio,
                             psAnoMesFinal               : string;
                             pbProcuraPorMesCobranca     : boolean;
                             qryAux                      : TwwQuery ) : boolean;

   function DesfazEventoParticipante ( piIdPessJur, piIdPlanoPrev, piIdPessoa,
                                       piSeqProposta, piIdEventoGerador : longint;
                                       psDataEvento : string;
                                       var sMsgErro : string;
                                       qryEvento    : TwwQuery) : boolean;

implementation

uses
    DAPrev, UMensErro, uAdmPrevFB, uMovReservaFB;

function CalcBeneficioINSSAtual(
  iIdPessJur,
  iIdPlanoPrev,
  iIdPessoa            : longint;
  sMesInicio,
  sMesRef              : string;
  var psIDTPPAGTOANT,
      psFlgBenefMinimo : string;
  qry                  : TwwQuery;
  iINumProcesso        : Integer;
  psFlgCampoRetorno : String = 'T' 
)  : string;
var rValorTotal,
    rValorAUsar  : double;
    sAnoMesInicio,
    sAnoMesFinal,
    sAnoMesAtual : string;
    i            : word;

begin
   Result := '0';
   psIdTpPagtoAnt := '';
   psFlgBenefMinimo := '0';

   if Trim(sMesInicio) = '' then sMesInicio := sMesRef;
   // NAO CONSIDERAR BENEFICIO DE PAGAMENTO UNICO
   // Verificar todos os beneficios que o participante estava recebendo
   // na data do evento
   // Esta query supoe que o beneficio anterior é o beneficio cuja data
   // de inicio é anterior a data parametrizada e cuja data final
   // nao é nula, ou seja, ele foi encerrado
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT BF.IDBENEFICIO,BF.VALORATUAL,BF.IDTPPAGTOBENEFIC,BF.FLGBENEFMIN, '+
               'BF.VALORTOTAL, '+ //PEGAR O VALOR TOTAL DA BENEFBFCIARIO
               'BF.VALORCALCULADO, '+ 
               ' EV.FLGINTERNO, BF.IDSITBENEFICIO '+
               ' FROM   TPPAGTOBENEFICIO T, BENEFICIO B, BENEFPLANPREV BP, BENEFBFCIARIO BF, '+
               ' EVENTOGERADOR EV '+
               ' WHERE  (BF.IDPESSJUR       = '+IntToStr(iIdPessJur)   +')'+
               ' AND    (BF.IDPLANOPREV     = '+IntToStr(iIdPLANOPREV) +')'+
               ' AND    (BF.IDPESSOA        = '+IntToStr(iIdPESSOA)    +')'+
               ' AND    (TO_CHAR(BF.DATAINICIO,''YYYY/MM'') <= '''+sMesInicio+''') ');
   if Copy(sMesRef,6,2) <> '13'
   then qry.SQL.Add(' AND    ( (BF.DATAFINAL IS NULL) OR (TO_CHAR(BF.DATAFINAL,''YYYY/MM'') >= '''+sMesRef+''') ) ');
   qry.SQL.Add(' AND    (BF.IDPLANOPREV     = BP.IDPLANOPREV) '+
               ' AND    (BF.IDBENEFICIO     = BP.IDBENEFICIO) '+
               ' AND    (BP.FLGREFERENCIA   = 1) '+
               ' AND    (BF.FLGPOSSUIACOMPINSS = 0) '+ 
               ' AND    (BP.IDBENEFICIO     = B.IDBENEFICIO) '+
               ' AND    (B.IDTPPAGTOBENEFIC = T.IDTPPAGTOBENEFIC)'+
               ' AND    (T.FLGFREQUENCIA    <> ''U'')'+
               ' AND    (B.IDEVENTOGERADOR  = EV.IDEVENTOGERADOR)');

   qry.Open;
   qry.First;
   if qry.IsEmpty
   then Exit;// Participante nao estava em beneficio nesta epoca

   // Procurar beneficios no historico e somar seus valores
   // Caso nao os encontre no historico, somar valores da benefbfciario
   rValorTotal := 0;
   qry.First;
   while not qry.Eof do
   begin
       psIdTpPagtoAnt    := qry.FieldByName('IdTpPagtoBenefic').AsString;
       if not ((psFlgBenefMinimo = '1') and (qry.FieldByName('FlgBenefMin').AsString = '0'))
       then psFlgBenefMinimo := qry.FieldByName('FlgBenefMin').AsString;

       sAnoMesFinal  := sMesRef;
       sAnoMesInicio := sMesInicio;
       sAnoMesAtual := sAnoMesInicio;
       rValorAUsar  := 0;

       if psFlgCampoRetorno = 'C' then
         rValorAUsar:=qry.FieldByName('VALORCALCULADO').AsFloat
       else
         rValorAUsar:=qry.FieldByName('VALORTOTAL').AsFloat;

       If Copy(sMesRef,6,2) <> '13'
        Then If (Trim(qry.FieldByName('FLGINTERNO').AsString) = 'IN') or
                (Trim(qry.FieldByName('FLGINTERNO').AsString) = 'AC')
              Then rValorTotal := rValorAUsar
              Else rValorTotal := rValorTotal + rValorAUsar
        Else rValorTotal := rValorTotal + rValorAUsar;

       qry.Next;
   end;
   qry.Close;
   dtmAPrev.qryAux.Close;
   Result := OraNumero(FloatToStr(rValorTotal));
   if Trim(Result) = '' then Result := '0';
end;//CalcBeneficioINSSAtual

function CalcReservaPart( iIdPessJur, iIdPlanoPrev, iIdPessoa, iIdRegra, iSeqProposta : integer;
                          sDataRef, sDataInicio, sDataInicioPagto,
                          sDataRequerBenef, iIdBeneficio : string;
                          qry : TwwQuery):string;
var
   sSQL, sMesRef, sValorProvento : string;
   eAcumulador : extended;
   cAux : char;
   qryauxreserva : twwquery;
begin

   try
     Result := '0';
     eAcumulador := 0;

     if iIdRegra <= 0
     then begin
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add(' SELECT RP.IDTIPORESERVA, RP.VALORRESERVA, R.INDICEREAJUSTE '+
                    ' FROM   RESERVAPART RP, RESERVAXPLANO R '+
                    ' WHERE  RP.IDPLANOPREV   = '+IntToStr(iIdPlanoPrev)+' AND '+
                    '        RP.IDPESSJUR     = '+IntToStr(iIdPessJur)+' AND '+
                    '        RP.IDTIPORESERVA = R.IDTIPORESERVA AND '+
                    '        RP.IDPESSOA      = '+ IntToStr(iIdPessoa)+' AND '+
                    '        RP.SEQPROPOSTA   = '+ IntToStr(iSeqProposta)+' AND '+
                    '        RP.FLGATIVO      = 1 AND ' +
                    '        R.FLGCONTROLE    = 0 AND '+ 
                    '        RP.IDPLANOPREV   = R.IDPLANOPREV AND '+
                    '        R.ANALITICOSINTETI = ''A'' ');
        qry.Open;

        qryAuxReserva := TwwQuery.Create(Application);
        qryAuxReserva.DatabaseName := 'BaseDados';

        qry.first;
        cAux             := DecimalSeparator;
        DecimalSeparator := '.';
        while not qry.eof do
        begin
           if not (qry.FieldByName('VALORRESERVA').AsInteger = 0) then
           eAcumulador := eAcumulador + (qry.FieldByName('VALORRESERVA').AsFloat *
                          VoltaValorCotacao(qryauxreserva,qry.fieldbyname('INDICEREAJUSTE').AsString,
                          IntToStr(iIdPlanoPrev),qry.fieldbyname('IDTIPORESERVA').AsString,
                          sDataRef));
           qry.next;
        end;//while

        Result := Floattostr(eAcumulador);
        DecimalSeparator := cAux;
        qry.Close;
     end
     else begin  // executar regra de calculo
        if sDataRef = ''    then sDataRef := DateToStr(date);
        if sDataInicio = '' then sDataInicio := DateToStr(date);
        sMesRef := Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2);

        sValorProvento :=   CalcSALPART(iIdPessJur,iIdPessoa,sMesRef,qry);
        if Trim(sValorProvento)   = '' then sValorProvento   := '0';
        if Trim(sDataInicioPagto) = '' then sDataInicioPagto := Trim(sDataInicio);
        if Trim(sDataRequerBenef) = '' then sDataRequerBenef := Trim(sDataInicio);

        sSQL := ' SELECT RP.IDTIPORESERVA,     RP.IDPLANOPREV,       RP.IDPESSJUR,    '+
                '        RP.IDPESSOA,          RP.DATAREFERENCIASA,  RP.VALORRESERVA, '+
                '        RP.PERCENTUALSAQUE,   R.NOME,               R.CODHIERARQUIA, '+
                '        R.INDICEREAJUSTE,     R.IDBENEFICIO,        M.MOESIGLA,      '+
                '        PF.DATANASC,          EL.DATAADMISSAO,      PP.INSCRICAODATA,'+
                '        PP.SEQPROPOSTA,       PP.DATACANCELAMENTO,  EL.IDSITFUNC,    '+
                '        PP.IDSITPART,         PP.IDPLANOPREV,                        '+
                ''''+sDataInicio+'''       AS DATAINICIO,                             '+
                ''''+sDataInicioPagto+'''  AS DATAINICIOPAGTO,                        '+
                ''''+sDataRequerBenef+'''  AS DATAREQUERIMENTO,                       '+
                ''''+sDataRef+'''          AS DATAREF,                                '+
                OraNumero(sValorProvento)+ ' AS VALORPROVENTO,                        '+
                ' 1 AS CONTRESERVA, 1 AS ULTRESERVA, 0 VALORBASE1, 0 VALORBASE2, 0 VALORBASE3      '+
                ' FROM  PESSOAFISICA PF, ELEGPATRO EL,    PARTPREVPLAN PP,            '+
                '       RESERVAPART RP,  RESERVAXPLANO R, MOEDA M                     '+
                ' WHERE RP.IDPLANOPREV      = ' + IntToStr(iIdPlanoPrev)+
                ' AND   RP.IDPESSJUR        = ' + IntToStr(iIdPessJur)+
                ' AND   RP.IDTIPORESERVA    = R.IDTIPORESERVA '+
                ' AND   RP.IDPESSOA         = ' + IntToStr(iIdPessoa)+
                ' AND   RP.SEQPROPOSTA      = ' + IntToStr(iSeqProposta)+
                ' AND   RP.IDPESSJUR        = PP.IDPESSJUR   '+
                ' AND   RP.IDPLANOPREV      = PP.IDPLANOPREV '+
                ' AND   RP.IDPESSOA         = PP.IDPESSOA    '+
                ' AND   RP.SEQPROPOSTA      = PP.SEQPROPOSTA '+
                ' AND   PF.IDPESSOA         = RP.IDPESSOA    '+
                ' AND   EL.IDPESSOA         = RP.IDPESSOA    '+
                ' AND   EL.IDPESSJUR        = RP.IDPESSJUR   '+
                ' AND   RP.FLGATIVO         = 1              '+
                ' AND   RP.IDPLANOPREV      = R.IDPLANOPREV  '+
                ' AND   R.ANALITICOSINTETI  = ''A''          '+
                ' AND   R.INDICEREAJUSTE    = M.MOECODIGO(+) ';

        dtmAPrev.qryRegra.Close;
        dtmAPrev.qryRegra.Sql.Clear;
        dtmAPrev.qryRegra.Sql.Add(sSQL);
        try
           dtmAPrev.qryRegra.Open;
        except
           on E:EDBEngineError do
           begin
                   MostrarErro(E);
                   try
                      qryauxreserva.free; 
                   except
                   end;
                   Exit;
              end;
        end;

        if dtmAPrev.qryRegra.IsEmpty then exit;

        dtmAPrev.regraAPrev.RuleName := IntToStr(iIdRegra);
        dtmAPrev.regraAPrev.Execute;

        Result := dtmAPrev.regraAPrev.Result;
     end;


     if Trim(Result) = ''  then
     Result := '0'
     else Result := TruncaRound(result,2);

  finally
     try
        qryauxreserva.free;
     except
     end;
  end;
end;

function CalcRemTotal(iIdPessJur, iIdPessoa : integer; sMesRef : string;qry : TwwQuery) : string;
var iIdRubrica,
    iTentativas : integer;
    bAchou     : boolean;
    sdtref, sdtmax, sMesAux: string;
begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDRUBREMTOTAL AS IDRUBRICA FROM PATRO WHERE IDPESSOA = '+IntToStr(iIDPessJur));
     Open;
     if IsEmpty then Exit;
     iIdRubrica := FieldByName('IdRubrica').AsInteger;

     sdtref:='01/'+copy(smesref,6,2)+'/'+copy(smesref,1,4);

     sMesAux := sMesRef;
     bAchou  := False;
     iTentativas := 0;

     Close;
     SQL.Clear;
     SQL.Add(' SELECT MAX(H.MES) AS MAXMES '+
             ' from   HISTRUBSAL H    '+
             ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
             ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
             ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
     Open;

     if not FieldByName('MAXMES').isnull then
     begin
       sMesAux:=FieldByName('MAXMES').asstring;
       sdtmax:='01/'+copy(smesaux,6,2)+'/'+copy(smesaux,1,4);

       if DiferencaMeses(sdtref, sdtmax, qry) <= 36 then
       begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT H.VALORPROVENTO '+
                 ' from   HISTRUBSAL H    '+
                 ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
                 ' AND    (H.MES       = '''+sMesAux+''' )         '+
                 ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
                 ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
         Open;
         if not IsEmpty then
           Result := FieldByName('ValorProvento').AsString
         else
           Result := '0';
       end
       else
         Result := '0';
     end;
  end; // with qryAux;

  if Trim(Result) = '' then Result := '0';
end;

function CalcSalPart(iIdPessJur, iIdPessoa : integer; sMesRef : string; qry : TwwQuery) : string;
var iIdRubrica,
    iTentativas : integer;
    bAchou     : boolean;
    sdtref, sdtmax, sMesAux: string;
begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDRUBSALPARTICIP AS IDRUBRICA FROM PATRO WHERE IDPESSOA = '+IntToStr(iIDPessJur));
     Open;
     if IsEmpty then Exit;
     iIdRubrica := FieldByName('IdRubrica').AsInteger;

     sdtref:='01/'+copy(smesref,6,2)+'/'+copy(smesref,1,4);

     sMesAux := sMesRef;
     bAchou  := False;
     iTentativas := 0;

     Close;
     SQL.Clear;
     SQL.Add(' SELECT MAX(H.MES) AS MAXMES '+
             ' from   HISTRUBSAL H    '+
             ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
             ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
             ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
     Open;

     if not FieldByName('MAXMES').isnull then
     begin
       sMesAux:=FieldByName('MAXMES').asstring;
       sdtmax:='01/'+copy(smesaux,6,2)+'/'+copy(smesaux,1,4);

       if DiferencaMeses(sdtref, sdtmax, qry) <= 36 then
       begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT H.VALORPROVENTO '+
                 ' from   HISTRUBSAL H    '+
                 ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
                 ' AND    (H.MES       = '''+sMesAux+''' )         '+
                 ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
                 ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
         Open;
         if not IsEmpty then
           Result := FieldByName('ValorProvento').AsString
         else
           Result := '0';
       end
       else
         Result := '0';
     end;    
  end; // with qryAux;

  // Se nao achar o salario no historico de rubrica tentar usar o valor
  // da tabela de participante
  if StrToFloat(ClienteNumero(Result)) <= 0
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT SALPARTICIPACAO FROM PARTPREVPLAN '+
                    ' WHERE (IDPESSOA  = '+IntToStr(iIdPessoa)+')'+
                    ' AND   (IDPESSJUR = '+IntToStr(iIdPessJur)+')'+
                    ' AND   (FLGDESATIVADO = 0) ');
     qry.Open;
     if qry.IsEmpty then Exit;
     Result := qry.FieldByName('SALPARTICIPACAO').AsString;
  end;
end;

function CalcRUBPARCIAL(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer; sMesRef : string; qry : TwwQuery) : string;
var iIdRubrica : integer;

begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDRUBSALMANUTPARC AS IDRUBRICA FROM PATRO WHERE IDPESSOA = '+IntToStr(iIDPessJur));
     Open;
     if IsEmpty then Exit;
     iIdRubrica := FieldByName('IdRubrica').AsInteger;
     Close;
     SQL.Clear;
     SQL.Add(' SELECT VALORPROVENTO '+
             ' FROM HISTRUBSAL '+
             ' WHERE (IDPESSOA = '+ IntToStr(iIdPessoa)+') AND '+
             '       (IDPESSJUR = '+IntToStr(iIdPessJur)+') AND '+
             '       (IDRUBRICA = '+IntToStr(iIdRubrica)+') AND '+
             '       (MES <= '''+sMesRef+''')'+
             ' ORDER BY MES DESC ');
     Open;
     if IsEmpty then Exit;
     First;
     Result := FieldByName('VALORPROVENTO').ASSTRING;
     Close;
  end;//with

  if Trim(Result) = ''
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT SALMANTIDO FROM PARTPREVPLAN '+
                 ' WHERE IDPESSJUR = '+IntToStr(iIdPessJur)+' AND '+
                 '       IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+' AND '+
                 '       IDPESSOA = '+IntToStr(iIdPessoa)+' AND '+
                 '       SEQPROPOSTA = '+IntToSTr(iSeqProposta));
     qry.Open;
     if qry.IsEmpty
     then Result := '0'
     else if qry.FieldByName('SalMantido').AsSTring <> ''
          then Result := qry.FieldByName('SalMantido').AsString
          else Result := '0';
  end;

end;

function BuscaSalarioAtual(piIdPessJur,piIdPlanoPrev,piIdPessoa : integer; qry : TwwQuery):string;
begin
   with qry do
   begin
       Close;
       Sql.Clear;
       Sql.Add(' SELECT SALPARTICIPACAO FROM PARTPREVPLAN       '+
               ' WHERE  IDPESSJUR   = '+ IntToStr(piIdPessJur)   +
               ' AND    IDPLANOPREV = '+ IntToStr(piIdPlanoPrev) +
               ' AND    IDPESSOA    = '+ IntToStr(piIdPessoa));
       Open;
       result := FieldByName('SALPARTICIPACAO').AsString;
       if result = '' then result := '0';
       Close;
   end;
end;

function CalcRUBMANTIDO(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer; sMesRef : string; qry : TwwQuery) : string;
var iIdRubrica : integer;

begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDRUBSALMANUT AS IDRUBRICA FROM PATRO WHERE IDPESSOA = '+IntToStr(iIDPessJur));
     Open;
     if (not IsEmpty) and (FieldbyName('IdRubrica').AsInteger > 0)
     then begin
        iIdRubrica := FieldByName('IdRubrica').AsInteger;
        Close;
        SQL.Clear;
     SQL.Add(' SELECT VALORPROVENTO '+
             ' FROM HISTRUBSAL '+
             ' WHERE (IDPESSOA = '+ IntToStr(iIdPessoa)+') AND '+
             '       (IDPESSJUR = '+IntToStr(iIdPessJur)+') AND '+
             '       (IDRUBRICA = '+IntToStr(iIdRubrica)+') AND '+
             '       (MES <= '''+sMesRef+''')'+
             ' ORDER BY MES DESC ');
        Open;
        if not IsEmpty
        then begin
           First;
           Result := FieldByName('VALORPROVENTO').ASSTRING;
           Close;
        end;
     end;
  end;//with

  if Trim(Result) = ''
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT SALMANTIDO FROM PARTPREVPLAN '+
                 ' WHERE IDPESSJUR = '+IntToStr(iIdPessJur)+' AND '+
                 '       IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+' AND '+
                 '       IDPESSOA = '+IntToStr(iIdPessoa)+' AND '+
                 '       SEQPROPOSTA = '+IntToSTr(iSeqProposta));
     qry.Open;
     if qry.IsEmpty
     then Result := '0'
     else if qry.FieldByName('SalMantido').AsSTring <> ''
          then Result := qry.FieldByName('SalMantido').AsString
          else Result := '0';
  end;
end;

function CalcBENEFICIOINSS(iIdPessJur,iIdPlanoPrev, iIdPessoa : integer; qry : TwwQuery):string;
begin
   Result := '0';
   qry.Close;
   qry.SQL.Clear;
//   qry.SQL.Add(' SELECT VALORPREV '+   //Everson TIBERO
   qry.SQL.Add(' SELECT HST.VALORPREV '+ //Everson TIBERO
               ' FROM   HSTBENEFBFCIARIO HST, BENEFPLANPREV BP '+
               ' WHERE  HST.IDPESSJUR = '+IntToStr(iIdPessJur)+' AND '+
               '        HST.IDPLANOPREV = '+IntToStr(iIdPLANOPREV)+' AND '+
               '        HST.IDPESSOA = '+IntToStr(iIdPESSOA)+' AND '+
               '        BP.IDBENEFICIO = HST.IDBENEFICIO AND '+
               '        BP.IDPLANOPREV = HST.IDPLANOPREV AND '+
               '        BP.FLGREFERENCIA = 1 ');

   qry.Open;
   if qry.IsEmpty then Exit;
   Result := qry.FieldByName('VALORPREV').AsSTRING;
   qry.Close;
   if Trim(Result) = ''
   then Result := '0';
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

function CalcDataDemissao(iIdPessoa, iIdPessJur : integer; qry : TwwQuery):string;
begin
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT DATADEMISSAO         '+
               ' FROM   ELEGPATRO           '+
               ' WHERE  IDPESSOA = '+IntToStr(iIdPessoa)+
               ' AND    IDPESSJUR = '+IntToStr(iIdPessJur));
   qry.Open;
   if qry.IsEmpty
   then Result := ''
   else Result := qry.FieldByName('DataDemissao').AsString;
end;

function CalcUltimoBeneficio(     iIdPessJur, iIdPlanoPrev,
                                  iIdPessoa,  iIdBeneficio : integer;
                                  psDataRef ,
                                  psFlgDestBenef   : string;
                              var psIDTPPAGTOANT,
                                  psFlgBenefMinimo         : string;
                                  qry : TwwQuery   ):string;
var rValorTotal : double;
    sDataFinal  : string;
begin
   Result := '0';
   psIdTpPagtoAnt := '';
   psFlgBenefMinimo := '0';
   if Trim(psDataRef) = '' then psDataRef := DateToStr(date);
   // Tratar caso do parametro ter sido passado com ano/mes
   if Length(Trim(psDataRef)) = 7 then psDataRef := '01/'+Copy(psDataRef,6,2)+'/'+Copy(psDataRef,1,4);

   if psFlgDestBenef <> 'B'
   then sDataFinal := DateToStr(StrToDate(psDataRef) - 1)
   else sDataFinal := psDataRef;

   // Verificar todos os beneficios que o participante estava recebendo
   // na data do evento
   // Esta query supoe que o beneficio anterior é o beneficio cuja data
   // de inicio é anterior a data parametrizada e cuja data final
   // nao é nula, ou seja, ele foi encerrado
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT BF.IDBENEFICIO,BF.VALORATUAL,BF.IDTPPAGTOBENEFIC,BF.FLGBENEFMIN '+
               ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP '+
               ' WHERE  (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)   +')'+
               ' AND    (BF.IDPLANOPREV = '+IntToStr(iIdPLANOPREV) +')'+
               ' AND    (BF.IDPESSOA    = '+IntToStr(iIdPESSOA)    +')'+
               ' AND    (BF.IDTITULAR   = '+IntToStr(iIdPESSOA)    +')'+
               ' AND    (BF.IDBENEFICIO <> '+IntToStr(iIdBeneficio)+')'+
               ' AND    (BF.DATAINICIO  <= TO_DATE('''+psDataRef+''',''DD/MM/YYYY'') ) '+
               ' AND    (BF.DATAFINAL   = TO_DATE('''+sDataFinal+''',''DD/MM/YYYY'') ) '+
               ' AND    (BF.IDPLANOPREV = BP.IDPLANOPREV) '+
               ' AND    (BF.IDBENEFICIO = BP.IDBENEFICIO) '+
               ' AND    (BP.FLGREFERENCIA = 0) ');
   qry.Open;
   qry.First;
   if qry.IsEmpty
   then Exit;// Participante nao estava em beneficio nesta epoca

   // Procurar beneficios no historico e somar seus valores
   // Caso nao os encontre no historico, somar valores da benefbfciario
   rValorTotal := 0;
   qry.First;
   while not qry.Eof do
   begin
      psIdTpPagtoAnt    := qry.FieldByName('IdTpPagtoBenefic').AsString;
      if not ((psFlgBenefMinimo = '1') and (qry.FieldByName('FlgBenefMin').AsString = '0'))
      then psFlgBenefMinimo := qry.FieldByName('FlgBenefMin').AsString;
      rValorTotal := rValorTotal + qry.FieldByName('ValorAtual').AsFloat;
      qry.Next;
   end;
   qry.Close;
   Result := OraNumero(FloatToStr(rValorTotal));
   if Trim(Result) = '' then Result := '0';
end;//CalcUltimoBeneficio

function PegaUltMesReajAnterior( qry : TwwQuery;
                                  iIdPessJur, iIdPlanoPrev,
                                  iIdPessoa,  iIdBeneficio : integer;
                                  psDataRef                : string ) :string;
var sDataFinal : string;
begin
   sDataFinal := DateToStr(StrToDate(psDataRef) - 1);
   Result  := '';

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT BF.ULTMESREAJUSTE, BF.DATAINICIOFUND '+
               ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP '+
               ' WHERE  (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)   +')'+
               ' AND    (BF.IDPLANOPREV = '+IntToStr(iIdPLANOPREV) +')'+
               ' AND    (BF.IDPESSOA    = '+IntToStr(iIdPESSOA)    +')'+
               ' AND    (BF.IDTITULAR   = '+IntToStr(iIdPESSOA)    +')'+
               ' AND    (BF.IDBENEFICIO <> '+IntToStr(iIdBeneficio)+')'+
               ' AND    (BF.DATAINICIO  <= TO_DATE('''+psDataRef+''',''DD/MM/YYYY'') ) '+
               ' AND    (BF.DATAFINAL   = TO_DATE('''+sDataFinal+''',''DD/MM/YYYY'') ) '+
               ' AND    (BF.IDPLANOPREV = BP.IDPLANOPREV) '+
               ' AND    (BF.IDBENEFICIO = BP.IDBENEFICIO) '+
               ' AND    (BP.FLGREFERENCIA = 0) ');
   qry.Open;
   qry.First;
   if qry.IsEmpty
   then Exit;// Participante nao estava em beneficio nesta epoca
   qry.First;
   if Trim(qry.FieldByName('ULTMESREAJUSTE').AsString) <> ''
   then Result := qry.FieldByName('ULTMESREAJUSTE').AsString
   else Result := Copy(qry.FieldByName('DataInicioFund').AsString,7,4)+'/'+
                  Copy(qry.FieldByName('DataInicioFund').AsString,4,2);

   qry.Close;
end; // PegaUltMesReajAnterior

function CalcBeneficioAtual( iIdPessJur,iIdPlanoPrev,iIdPessoa : integer;
                             sMesInicio,
                             sMesRef : string;
                             var psIDTPPAGTOANT,
                                 psFlgBenefMinimo : string;
                             qry : TwwQuery):string;
var rValorTotal : double;
begin
   Result := '0';
   psIdTpPagtoAnt := '';
   psFlgBenefMinimo := '0';

   // Verificar todos os beneficios que o participante estava recebendo
   // na data do evento
   // Esta query supoe que o beneficio anterior é o beneficio cuja data
   // de inicio é anterior a data parametrizada e cuja data final
   // nao é nula, ou seja, ele foi encerrado
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT BF.IDBENEFICIO,BF.VALORATUAL,BF.IDTPPAGTOBENEFIC,BF.FLGBENEFMIN '+
               ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP '+
               ' WHERE  (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)+')'+
               ' AND    (BF.IDPLANOPREV = '+IntToStr(iIdPLANOPREV)+')'+
               ' AND    (BF.IDPESSOA    = '+IntToStr(iIdPESSOA)+')'+
               ' AND    (BF.IDTITULAR   = '+IntToStr(iIdPESSOA)+')'+
               ' AND    (TO_CHAR(BF.DATAINICIO,''YYYY/MM'') <= '''+sMesInicio+''') '+
               ' AND    ( (BF.DATAFINAL IS NULL) OR (TO_CHAR(BF.DATAFINAL,''YYYY/MM'') >= '''+sMesRef+''') ) '+
               ' AND     (BF.IDPLANOPREV = BP.IDPLANOPREV) '+
               ' AND     (BF.IDBENEFICIO = BP.IDBENEFICIO) '+
               ' AND     (BP.FLGREFERENCIA = 0) ');
   qry.Open;
   qry.First;
   if qry.IsEmpty
   then Exit;// Participante nao estava em beneficio nesta epoca

   // Procurar beneficios no historico e somar seus valores
   // Caso nao os encontre no historico, somar valores da benefbfciario
   rValorTotal := 0;
   qry.First;
   while not qry.Eof do
   begin
       psIdTpPagtoAnt    := qry.FieldByName('IdTpPagtoBenefic').AsString;
       if not ((psFlgBenefMinimo = '1') and (qry.FieldByName('FlgBenefMin').AsString = '0'))
       then psFlgBenefMinimo := qry.FieldByName('FlgBenefMin').AsString;
       dtmAPrev.qryAux.Close;
       dtmAPrev.qryAux.SQL.Clear;

       dtmAPrev.qryAux.SQL.Add(' SELECT VLBENEFPGTO, VALORPREV '+
               ' FROM   HSTBENEFBFCIARIO '+
               ' WHERE  (IDPESSJUR   = '+IntToStr(iIdPessJur)+')'+
               ' AND    (IDPLANOPREV = '+IntToStr(iIdPLANOPREV)+')'+
               ' AND    (IDPESSOA    = '+IntToStr(iIdPESSOA)+')'+
               ' AND    (IDBENEFICIO = '+qry.FieldbyName('IdBeneficio').AsString+')'+
               ' AND    (MESREFERENCIA <= '''+sMesRef+''' '+')'+
               ' ORDER BY MESREFERENCIA DESC ');
       dtmAPrev.qryAux.Open;
       if dtmAPrev.qryAux.IsEmpty
       then rValorTotal := rValorTotal + qry.FieldByName('ValorAtual').AsFloat
       else if Trim(dtmAPrev.qryAux.FieldByName('VlBenefPgto').AsString) = ''
            then rValorTotal := rValorTotal + dtmAPrev.qryAux.FieldByName('ValorPrev').AsFloat
            else rValorTotal := rValorTotal + dtmAPrev.qryAux.FieldByName('VlBenefPgto').AsFloat;
       qry.Next;
   end;
   qry.Close;
   dtmAPrev.qryAux.Close;
   Result := OraNumero(FloatToStr(rValorTotal));
   if Trim(Result) = '' then Result := '0';
end;//CalcBeneficioAtual


function PossuiFilhoDependente(qry:TwwQuery; pIdPessoa:string):Char;
begin
  {== Retorna se o Participante possui algum dependete = FIL}
  result   := 'N';
  qry.Close;
  qry.Sql.Clear;
  qry.Sql.Add('SELECT IDDEPENDENCIA FROM DEPENTIT  ');
  qry.Sql.Add('WHERE  IDTITULAR = '''+pIdPessoa+'''');
  qry.Sql.Add('AND    IDDEPENDENCIA = ''FIL''      ');
  qry.Open;
  if (not qry.Isempty) then
     result:= 'S';
  qry.Close;
end;// PossuiFilhoDependente

function PartReinscrito (iIdPessJur, iIdPlanoPrev, iIdPessoa : integer; qry : TwwQuery) : boolean;
begin
   Result := False;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT P.INSCRICAODATA, P.DTINICIOINSC  '+
               ' FROM PARTPREVPLAN  P '+
               ' WHERE  (P.IDPESSJUR = '+IntToStr(iIdPessJur)+')'+
               ' AND    (P.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+')'+
               ' AND    (P.IDPESSOA = '+IntToStr(iIdPessoa)+')'+
               ' AND    (P.FLGDESATIVADO = 0 )');

   try
     qry.Open;
   except
   end;
   if (not qry.IsEmpty) and
      (qry.FieldByName('InscricaoData').AsString <>
       qry.FieldByName('DtInicioInsc').AsString)
   then Result := True;
   qry.Close;
end; //PartReinscrito

function PartResgPoupanca(iIdPessjur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer;
                          qry : TwwQuery) : boolean;
begin
   Result := False;
   qry.close;
   qry.sql.Clear;
//   qry.sql.add(' SELECT MAX(DATAMOV) DATAMOV '+ //Everson TIBERO
   qry.sql.add(' SELECT MAX(H.DATAMOV) DATAMOV '+ //Everson TIBERO
               ' FROM HISTMOVRESERVA H, EVENTOGERADOR E '+
               ' WHERE '+
               ' E.IDEVENTOGERADOR = H.IDEVENTOGERADOR '+
               ' AND E.FLGINTERNO = ''RP'' '+
               ' AND H.IDPESSOA = '+IntToStr(iIdPessoa)+
               ' AND H.IDPLANOPREV =  '+IntToStr(iIdPlanoPrev)+
               ' AND H.IDPESSJUR = '+IntToStr(iIdPessJur)+
//               ' AND SEQPROPOSTA = '+IntToStr(iSeqProposta));  //Everson TIBERO
               ' AND H.SEQPROPOSTA = '+IntToStr(iSeqProposta));  //Everson TIBERO
   try
      qry.open;
   except
   end;

   if (not qry.IsEmpty) and (Trim(qry.FieldByName('DataMov').AsString) <> '')
   then Result := True;
   qry.Close;
end;

function CalcUltMesContribuicao(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer;
         sMesRef : string; qry : TwwQuery) : string;
begin
   Result := '0000/00'; 

   if Trim(sMesRef) = ''
   then sMesRef := Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2);
   
   qry.close;
   qry.sql.Clear;
   qry.sql.add(' SELECT MAX(ULTMESPREPARO) AS ULTMESPREPARO  '+
               ' FROM   CONTRIBPREVPARTP '+
               ' WHERE  (IDPESSOA = '+IntToStr(iIdPessoa)+')'+
               ' AND    (IDPLANOPREV =  '+IntToStr(iIdPlanoPrev)+')'+
               ' AND    (IDPESSJUR = '+IntToStr(iIdPessJur)+')'+
               ' AND    (SEQPROPOSTA = '+IntToStr(iSeqProposta)+')'+
               ' AND    (ULTMESPREPARO <= '''+sMesRef+''') '); 
   try
      qry.open;
   except
   end;

   if (not qry.IsEmpty) and (Trim(qry.FieldByName('UltMesPreparo').AsString) <> '')
   then Result := qry.FieldByName('UltMesPreparo').AsString;
   qry.Close;

end; // CalcUltMesContribuicao

function ProximaSequenciaDependente(iIdPessoa : longint; qry : TwwQuery) : longint;
begin
   Result := 1;
   qry.close;
   qry.sql.clear;
   qry.sql.add(' SELECT MAX(NUMSEQUENCIA) + 1 PROXIMODEPEN FROM DEPENTIT '+
               ' WHERE  IDTITULAR = '+IntToStr(iIdPessoa)+'');
   qry.open;
   if qry.IsEmpty
   then Result := 1
   else if qry.FieldbyName('ProximoDepen').AsString = ''
        then Result := 1
        else Result := qry.FieldByName('ProximoDepen').AsInteger;
end;

function BuscaSalario(piIdPessJur, piIdPlanoPrev, piIdPessoa  : longint;
                      psAnoMes, psSitFundacao,
                      sSalario                 : string;
                      var sMsgErro             : string;
                      qryAux                   : TwwQuery ) : string;
var sNovoSalario,
    sNomeRubrica,
    sIdRubrica,
    sDescRubrica  : string;
begin
   Result := sSalario;

   sNovoSalario := '';

   // Preencher dados da rubrica de salario de participacao
   if psSitFundacao = 'MA' // Mantido
   then begin
      sDescRubrica := 'Salário de Manutenção Integral';
      sNomeRubrica := 'IDRUBSALMANUT';
   end
   else begin
      if psSitFundacao = 'MP' // Mantido Parcial
      then begin
         sDescRubrica := 'Salário de Manutenção Parcial';
         sNomeRubrica := 'IDRUBSALMANUTPARC';
      end
      else begin // Outras situacoes (Ativo, etc)
         if Copy(psAnoMes,6,2) = '13'
         then begin
            sDescRubrica := 'Décimo Terceiro Salário ';

            with qryAux do
            begin
              // Busca Identificados da Rubrica na PARAMSAL13
              Close;
              SQL.Clear;
              SQL.Add(' SELECT PAR.IDPESSJUR, PAR.EXERCICIO,                 '+
                      '        PAR.MESREFERENCIA, PAR.IDREGRA, PAR.IDRUBRICA '+
                      ' FROM PARAMSAL13 PAR '+
                      ' WHERE (PAR.IDPESSJUR = '+IntToStr(piIdPessJur)+')  AND '+
                      '       (SUBSTR(PAR.MESREFERENCIA,1,4) = '''+Copy(psAnoMes,1,4)+''') ');

              Open;
              // Guarda identificador caso encontre
              if not IsEmpty
              then sIdRubrica := FieldByName('IDRUBRICA').AsString
              else begin
                 SQL.Clear;
                 SQL.Add(' SELECT PT.IDRUBSALPARTICIP AS IDRUBRICA,   RP.CODPROVDESC,  '+
                         '        PV.FLGCOMPOEREMTOTAL,  PV.FLGCOMPOESALBENEF, '+
                         '        PV.FLGCOMPOESALPART,   PV.FLGIRRF '+
                         ' FROM   PATRO PT, RUBRICAXPESS RP, PROVDESC PV  '+
                         ' WHERE  PT.IDPESSOA  = '+IntToStr(piIdPessJur)+
                         ' AND    RP.IDPESSOA  = PT.IDPESSOA '+
                         ' AND    RP.IDRUBRICA = PT.IDRUBSALPARTICIP '+
                         ' AND    RP.IDRUBRICA = PV.IDPROVENTO ');
                 Open;
                 if not IsEmpty
                 then sIdRubrica := FieldByName('IDRUBRICA').AsString
                 else begin
                    sMsgErro := 'A Rubrica de '+sDescRubrica+' não foi encontrada no cadastro. Verifique.';
                    Exit;
                 end;
              end;
            end;
         end
         else begin
            sDescRubrica := 'Salário de Participação';
            sNomeRubrica := 'IDRUBSALPARTICIP';
         end;
      end;
   end;


   { Caso seja Rubrica da 13º, pesquisa já foi feita }
   if Copy(psAnoMes,6,2) <> '13' then begin 
     with qryAux do
     begin
        SQL.Clear;
        SQL.Add(' SELECT PT.'+sNomeRubrica+' AS IDRUBRICA,   RP.CODPROVDESC,  '+
                '        PV.FLGCOMPOEREMTOTAL,  PV.FLGCOMPOESALBENEF, '+
                '        PV.FLGCOMPOESALPART,   PV.FLGIRRF '+
                ' FROM   PATRO PT, RUBRICAXPESS RP, PROVDESC PV  '+
                ' WHERE  PT.IDPESSOA  = '+IntToStr(piIdPessJur)+
                ' AND    RP.IDPESSOA  = PT.IDPESSOA '+
                ' AND    RP.IDRUBRICA = PT.'+sNomeRubrica+
                ' AND    RP.IDRUBRICA = PV.IDPROVENTO ');
        Open;
        if not IsEmpty
        then sIdRubrica := FieldByName('IDRUBRICA').AsString
        else begin
           sMsgErro := 'A Rubrica de '+sDescRubrica+' não foi encontrada no cadastro. Verifique.';
           Exit;
        end;
     end; // with
   end;


   if trim(sIdRubrica) = '' then
   begin
      qryaux.close;
      qryaux.SQL.Clear;
      qryaux.SQL.Add(' SELECT PT.IDRUBSALPARTICIP AS IDRUBRICA,   RP.CODPROVDESC,  '+
              '        PV.FLGCOMPOEREMTOTAL,  PV.FLGCOMPOESALBENEF, '+
              '        PV.FLGCOMPOESALPART,   PV.FLGIRRF '+
              ' FROM   PATRO PT, RUBRICAXPESS RP, PROVDESC PV  '+
              ' WHERE  PT.IDPESSOA  = '+IntToStr(piIdPessJur)+
              ' AND    RP.IDPESSOA  = PT.IDPESSOA '+
              ' AND    RP.IDRUBRICA = PT.IDRUBSALPARTICIP '+
              ' AND    RP.IDRUBRICA = PV.IDPROVENTO ');
      qryaux.Open;
      if not qryaux.IsEmpty
      then sIdRubrica := qryaux.FieldByName('IDRUBRICA').AsString
      else begin
         sMsgErro := 'A Rubrica de '+sDescRubrica+' não foi encontrada no cadastro. Verifique.';
         Exit;
      end;
   end;

   with qryAux
   do begin
      // Verificar se salário já existe neste mes
      Close;
      SQL.Clear;
      SQL.Add(' SELECT DECODE(VLRANTRETROATIVO, NULL, VALORPROVENTO , VLRANTRETROATIVO) AS VALORPROVENTO '+
              ' FROM HISTRUBSAL '+
              ' WHERE (IDPESSOA  = '+IntToStr(piIdPessoa) +')  AND '+
              '       (MES       = '''+psAnoMes           +''')  AND '+
              '       (IDRUBRICA = '''+sIdRubrica         +''')  AND '+
              '       (IDPESSJUR = '+IntToStr(piIdPessJur)+')  ');


      Open;
      if not IsEmpty
      then sNovoSalario := FieldByName('ValorProvento').AsString
      else sNovoSalario := sSalario;
   end;
   qryAux.Close;

   if StrToFloat(ClienteNumero(sNovoSalario)) <= 0
   then begin
      sNovoSalario := BuscaSalarioPESSOA (qryAux,
                                          piIdPessJur, piIdPlanoPrev, piIdPessoa, 1,
                                          psSitFundacao,
                                          psAnoMes );
   end;

   Result := sNovoSalario;
end; // BuscaSalario

function VerificaRubricaMES( piIdPessJur,  piIdPessoa,
                             piIdRubrica                 : longint;
                             psAnoMes                    : string;
                             pbProcuraPorMesCobranca     : boolean;
                             qryAux                      : TwwQuery ) : boolean;
var sNomeCampo : string;
begin
   Result   := False;

   if pbProcuraPorMesCobranca
   then sNomeCampo := 'MESCOBRANCA'
   else sNomeCampo := 'MES';

   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT VALORPROVENTO '+
              ' FROM   HISTRUBSAL    '+
              ' WHERE  (IDPESSJUR = '+IntToStr(piIdPessJur) +')'+
              ' AND    (IDPESSOA  = '+IntToStr(piIdPessoa)  +')'+
              ' AND    (IDRUBRICA = '+IntToStr(piIdRubrica) +')'+
              ' AND    ('+sNomeCampo+' = '''+psAnoMes+''')');

      Open;
      if (not IsEmpty) and (FieldByName('ValorProvento').AsFloat > 0)
      then Result := True;
      Close;
   end;
end;

function ApagaRubricaMES( piIdPessJur,  piIdPessoa,
                          piIdRubrica                 : longint;
                          psAnoMesInicio,
                          psAnoMesFinal               : string;
                          pbProcuraPorMesCobranca     : boolean;
                          qryAux                      : TwwQuery ) : boolean;
var sNomeCampo : string;
begin
   Result   := False;

   if pbProcuraPorMesCobranca
   then sNomeCampo := 'MESCOBRANCA'
   else sNomeCampo := 'MES';

   // Se o mes final for 12, transformar para 13 para apagar o 13o. tambem
   if Copy(psAnoMesFinal,6,2) = '12'
   then psAnoMesFinal := Copy(psAnoMesFinal,1,5)+'13';
   
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' DELETE HISTRUBSAL    '+
              ' WHERE  (IDPESSJUR = '+IntToStr(piIdPessJur) +')'+
              ' AND    (IDPESSOA  = '+IntToStr(piIdPessoa)  +')'+
              ' AND    (IDRUBRICA = '+IntToStr(piIdRubrica) +')'+
              ' AND    ('+sNomeCampo+' >= '''+psAnoMesInicio+''')'+
              ' AND    ('+sNomeCampo+' <= '''+psAnoMesFinal +''')');
      try
         ExecSQL;
      except
         Exit;
      end;
   end;
   Result := True;
end;

// Função para desfazer um evento registrado para um participante.
// Esta rotina :
// 1. Volta as situacoes dos participantes para as anteriores ao evento
// 2. Volta a cobrar as contribuicoes que cobrava antes do evento
function DesfazEventoParticipante ( piIdPessJur, piIdPlanoPrev, piIdPessoa,
                                    piSeqProposta, piIdEventoGerador : longint;
                                    psDataEvento : string;
                                    var sMsgErro : string;
                                    qryEvento    : TwwQuery) : boolean;
var sSQL : string;
begin

   Result   := False;
   sMsgErro := '';

   // Procurar evento na EventosPrev
   with qryEvento do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT EP.IDEVENTOSPREV,   EP.IDEVENTOGERADOR,   EP.IDPESSOA,         '+
              '        EP.IDPESSJUR,       EP.IDPLANOPREV,       EP.IDSITPLANOATUAL,  '+
              '        EP.IDSITPARTATUAL,  EP.IDSITFUNCATUAL,    EP.IDSITPLANONOVO,   '+
              '        EP.IDSITPARTNOVO,   EP.IDSITFUNCNOVO,     EP.DATAEVENTO,       '+
              '        EG.FLGINTERNO,      HS.IDCONTRIBUICAOF                         '+
              ' FROM   EVENTOSPREV EP,     EVENTOGERADOR EG, HSTCONTEVENTOSPR HS  '+
              ' WHERE  EP.IDEVENTOGERADOR = '+IntToStr(piIdEventoGerador)+
              ' AND    EP.IDPESSJUR       = '+IntToStr(piIdPessJur)+
              ' AND    EP.IDPLANOPREV     = '+IntToStr(piIdPlanoPrev)+
              ' AND    EP.IDPESSOA        = '+IntToStr(piIdPessoa)+
              ' AND    EP.SEQPROPOSTA     = '+IntToStr(piSeqProposta)+
              ' AND    EP.DATAEVENTO      = TO_DATE('''+psDataEvento+''',''dd/mm/yyyy'') '+
              ' AND    EP.IDEVENTOGERADOR = EG.IDEVENTOGERADOR '+
              ' AND    EP.IDEVENTOSPREV   = HS.IDEVENTOSPREV(+) '+
              ' AND    0                  = HS.FLGASSOCIADA(+) ');
      Open;
      if IsEmpty
      then begin
         Result := True;
         Exit;
      end;
   end;

   // Atualizar situacao na patrocinadora
   sSQL := ' UPDATE ELEGPATRO '+
           ' SET    IDSITFUNC   = '+qryEvento.FieldByName('IdSitFuncAtual').AsString+
           ' WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+
           ' AND    IDPESSOA  = '+IntToStr(piIdPessoa);

   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);

      try
         ExecSQL;
      except
         sMsgErro := 'Erro ao atualizar situação do participante na patrocinadora.';
         Exit;
      end;
   end;

   // Atualizar situacao do participante no plano e na fundacao
   sSQL := ' UPDATE PARTPREVPLAN  '+
           ' SET    IDSITPART      = '+qryEvento.FieldByName('IdSitPartAtual').AsString+','+
           '        IDSITPLANOPREV = '+qryEvento.FieldByName('IdSitPlanoAtual').AsString+
           ' WHERE  IDPESSJUR      = '+IntToStr(piIdPessJur)+
           ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
           ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)+
           ' AND    SEQPROPOSTA    = '+IntToStr(piSeqProposta);
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);

      try
         ExecSQL;
      except
         sMsgErro := 'Erro ao atualizar situação do participante no plano/fundação.';
         Exit;
      end;
   end;

   // Colocar todos os flgCobra da tabela de Contribuicoes como ZERO, e depois
   // colocar como UM apenas os das contribuicoes da situacao anterior ao evento
   sSQL := ' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0'+
           ' WHERE  IDPESSJUR      = '+IntToStr(piIdPessJur)+
           ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
           ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)+
           ' AND    SEQPROPOSTA    = '+IntToStr(piSeqProposta);
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);

      try
         ExecSQL;
      except
         sMsgErro := 'Erro ao desassociar contribuições do participantes.';
         Exit;
      end;
   end;

   qryEvento.First;
   while not qryEvento.Eof do
   begin
      sSQL := ' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1 '+
              ' WHERE  IDPESSJUR      = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
              ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)+
              ' AND    SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
              ' AND    IDCONTRIBUICAO = '+IntToStr(qryEvento.FieldByName('IDCONTRIBUICAOF').AsInteger);
      with dtmAPrev.qry do
      begin
         Close;
         SQL.Clear;
         SQL.Add(sSQL);

         try
            ExecSQL;
         except
            sMsgErro := 'Erro ao desassociar contribuições do participantes.';
            Exit;
         end;
      end;
      qryEvento.Next;
   end; // while

   Result := True;
end; // DesfazEventoParticipante

// Funcao   : BuscaSalarioPESSOA
// Objetivo : Esta funcao tem por objetivo buscar o salario de um participante
//            em um determinado mes, sem que para isto seja necessário passar a
//            situação do participante naquele mês.
// Rotina   : A funcao verifica a situacao e patrocinadora que o participante estava no mês em questão.
//            Uma vez encontrada esta situacao, ela busca o salario do participante naquele
//            mes de acordo com a rubrica correspondente.
// Restrição : Esta rotina se baseia na tabela de eventos. Logo, caso esta tabela não
//             tenha sido preenchida, será buscada qual das rubricas o participante tinha
//             no mes determinado, para a patrocinadora que ele está hoje
function BuscaSalarioPESSOA (qryAux : TwwQuery;
                             piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                             psFlgIntSitPartHOJE,
                             psAnoMesBusca : string ) : string;
var sSituacaoNaEpoca,
    sIdPessJurNaEpoca,
    sIdPlanoNaEpoca,
    sIdEventosPrevDaEpoca,
    sSalarioNaEpoca,
    sUltDiaMes              : string;
    iUltDiaMes              : integer;
begin
    Result := '0';

    if Copy(psAnoMesBusca,6,2) = '13'
    then psAnoMesBusca := Copy(psAnoMesBusca,1,4)+'/12';

    iUltDiaMes := TrazUltDiaMes( StrToInt(Copy(psAnoMesBusca,6,2)),
                                 StrToInt(Copy(psAnoMesBusca,1,4)) );
    if iUltDiaMes <= 9
    then sUltDiaMes := '0'+IntToStr(iUltDiaMes)
    else sUltDiaMes := IntToStr(iUltDiaMes);

    with qryAux do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT EV.IDPESSJUR, EV.IDPLANOPREV, SP.FLGINTERNO,  PT.IDRUBSALAUXDOENCA, '+
               '        PT.IDRUBSALMANUT, PT.IDRUBSALMANUTPARC, PT.IDRUBSALPARTICIP '+
               ' FROM   PATRO PT, SITPART SP, EVENTOSPREV EV '+
               ' WHERE  EV.IDPESSOA      = '+IntToStr(piIdPessoa)+
               ' AND    EV.SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
               ' AND    EV.DATAEVENTO    = TO_DATE('''+sUltDiaMes+'/'+Copy(psAnoMesBusca,6,2)+'/'+Copy(psAnoMesBusca,1,4)+''', ''DD/MM/YYYY'') '+
               ' AND    EV.IDPESSJUR     = PT.IDPESSOA '+
               ' AND    EV.IDSITPARTNOVO = SP.IDSITPART '+
               ' ORDER BY EV.DATAEVENTO DESC ');
       Open;

       if not IsEmpty
       then begin
          sSituacaoNaEpoca  := FieldByName('FlgInterno').AsString;
          sIdPessJurNaEpoca := FieldByName('IdPessJur').AsString;
          sIdPlanoNaEpoca   := FieldByName('IdPlanoPrev').AsString;
       end
       else begin
          sSituacaoNaEpoca  := psFlgIntSitPartHOJE;
          sIdPessJurNaEpoca := IntToSTr(piIdPessJur);
          sIdPlanoNaEpoca   := IntToSTr(piIdPlanoPrev);
       end;
       if sSituacaoNaEpoca = 'AT'
       then sSalarioNaEpoca := CalcSALPART( StrToInt(sIdPessJurNaEpoca),
                                          piIdPessoa,
                                          psAnoMesBusca,
                                          qryAux )
       else if sSituacaoNaEpoca = 'MA'
            then sSalarioNaEpoca := CalcRUBMANTIDO( StrToInt(sIdPessJurNaEpoca),
                                          StrToInt(sIdPlanoNaEpoca),
                                          piIdPessoa,
                                          piSeqProposta,
                                          psAnoMesBusca,
                                          qryAux )
            else if sSituacaoNaEpoca = 'MP'
                 then sSalarioNaEpoca := CalcRUBPARCIAL( StrToInt(sIdPessJurNaEpoca),
                                          StrToInt(sIdPlanoNaEpoca),
                                          piIdPessoa,
                                          piSeqProposta,
                                          psAnoMesBusca,
                                          qryAux )
                 else sSalarioNaEpoca := CalcSALVIRTUAL( StrToInt(sIdPessJurNaEpoca),
                                          piIdPessoa,
                                          psAnoMesBusca,
                                          qryAux );
    end;
    Result := OraNumero(sSalarioNaEpoca);
end;

function CalcSalVIRTUAL(iIdPessJur, iIdPessoa  : integer; sMesRef : string; qry : TwwQuery) : string;
var iIdRubrica  : longint;
    bAchou      : boolean;
    sMesAux     : string;
begin
  Result := '0';
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT PT.IDRUBSALAUXDOENCA '+
             ' FROM   PATRO PT  '+
             ' WHERE  (PT.IDPESSOA     = '+IntToStr(iIdPessJur)+')');
     Open;
     if IsEmpty then Exit;

     iIdRubrica := FieldByName('IdRubSalAuxDoenca').AsInteger;
     sMesAux := sMesRef;
     bAchou  := False;

     Close;
     SQL.Clear;
     SQL.Add(' SELECT MAX(H.MES) MES '+
             ' FROM   HISTRUBSAL H    '+
             ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
             ' AND    (H.MES       = '''+sMesAux+''' )         '+
             ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
             ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
     Open;
     if (not IsEmpty) and (not FieldByName('MES').isnull) and
        (trim(FieldByName('MES').asstring) <> '') then
     begin
       sMesAux:=FieldByName('MES').asstring;

       Close;
       SQL.Clear;
       SQL.Add(' SELECT H.VALORPROVENTO '+
               ' from   HISTRUBSAL H    '+
               ' WHERE  (H.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
               ' AND    (H.MES       = '''+sMesAux+''' )         '+
               ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
               ' AND    (H.IDPESSJUR = '+IntToStr(iIdPessJur)+') ');
       Open;
       if not IsEmpty
       then begin
          Result := FieldByName('ValorProvento').AsString;
          bAchou := True;
       end;
     end;

     if not bAchou then Result := '0';
     if Trim(Result) = '' then Result := '0';
  end; // with qryAux;

  // Se nao achar o salario no historico de rubrica tentar usar o valor
  // da tabela de participante
  if StrToFloat(ClienteNumero(Result)) <= 0
  then begin
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add(' SELECT SALAUXDOENCA FROM PARTPREVPLAN '+
                    ' WHERE (IDPESSOA  = '+IntToStr(iIdPessoa)+')'+
                    ' AND   (IDPESSJUR = '+IntToStr(iIdPessJur)+')'+
                    ' AND   (FLGDESATIVADO = 0) ');
     qry.Open;
     if qry.IsEmpty then Exit;
     Result := qry.FieldByName('SALAUXDOENCA').AsString;
  end;
end;

function BuscaSalarioPESSOAINTEGRAL (qryAux : TwwQuery;
                                     piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                                     psFlgIntSitPartHOJE,
                                     psAnoMesBusca : string ) : string;
var sSituacaoNaEpoca,
    sIdPessJurNaEpoca,
    sIdPlanoNaEpoca,
    sIdEventosPrevDaEpoca,
    sSalarioNaEpoca,
    sSalarioIntegral,
    sSQL,
    sMsgErro,
    sUltDiaMes              : string;
    iUltDiaMes              : integer;
    bErro                   : boolean;
    iIdRubrica              : longint;
    sMesAux                 : string;
    bAchou                  : boolean;
begin
    Result := '0';
    sSalarioIntegral := '';

    if Copy(psAnoMesBusca,6,2) = '13'
    then psAnoMesBusca := Copy(psAnoMesBusca,1,4)+'/12';

    iUltDiaMes := TrazUltDiaMes( StrToInt(Copy(psAnoMesBusca,6,2)),
                                 StrToInt(Copy(psAnoMesBusca,1,4)) );
    if iUltDiaMes <= 9
    then sUltDiaMes := '0'+IntToStr(iUltDiaMes)
    else sUltDiaMes := IntToStr(iUltDiaMes);

    with qryAux do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT EV.IDPESSJUR, EV.IDPLANOPREV, SP.FLGINTERNO, PT.IDRUBSALAUXDOENCA, '+
               '        PT.IDRUBSALMANUT, PT.IDRUBSALMANUTPARC, PT.IDRUBSALPARTICIP '+
               ' FROM   PATRO PT, SITPART SP, EVENTOSPREV EV '+
               ' WHERE  EV.IDPESSOA      = '+IntToStr(piIdPessoa)+
               ' AND    EV.SEQPROPOSTA   = '+IntToStr(piSeqProposta)+
               ' AND    EV.DATAEVENTO    = TO_DATE('''+sUltDiaMes+'/'+Copy(psAnoMesBusca,6,2)+'/'+Copy(psAnoMesBusca,1,4)+''', ''DD/MM/YYYY'') '+
               ' AND    EV.IDPESSJUR     = PT.IDPESSOA '+
               ' AND    EV.IDSITPARTNOVO = SP.IDSITPART '+
               ' ORDER BY EV.DATAEVENTO DESC ');
       Open;

       if not IsEmpty
       then begin
          sSituacaoNaEpoca  := FieldByName('FlgInterno').AsString;
          sIdPessJurNaEpoca := FieldByName('IdPessJur').AsString;
          sIdPlanoNaEpoca   := FieldByName('IdPlanoPrev').AsString;
       end
       else begin
          sSituacaoNaEpoca  := psFlgIntSitPartHOJE;
          sIdPessJurNaEpoca := IntToSTr(piIdPessJur);
          sIdPlanoNaEpoca   := IntToSTr(piIdPlanoPrev);
       end;

       if sSituacaoNaEpoca = 'AT'
       then sSalarioNaEpoca := CalcSALPART( StrToInt(sIdPessJurNaEpoca),
                                          piIdPessoa,
                                          psAnoMesBusca,
                                          qryAux )

       else if sSituacaoNaEpoca = 'MP'
       then sSalarioNaEpoca := CalcRUBPARCIAL( StrToInt(sIdPessJurNaEpoca),
                                          StrToInt(sIdPlanoNaEpoca),
                                          piIdPessoa,
                                          piSeqProposta,
                                          psAnoMesBusca,
                                          qryAux )

       else if (sSituacaoNaEpoca = 'AS') Or (sSituacaoNaEpoca = 'MA') Then
       begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT PT.IDRUBSALAUXDOENCA, PT.IDRUBSALMANUT '+
                  ' FROM   PATRO PT  '+
                  ' WHERE  (PT.IDPESSOA     = '+sIdPessJurNaEpoca+')');
          Open;
          if IsEmpty then Exit;

          If sSituacaoNaEpoca = 'AS' Then
            iIdRubrica := FieldByName('IDRUBSALAUXDOENCA').AsInteger
          Else iIdRubrica := FieldByName('IDRUBSALMANUT').AsInteger;

          sMesAux := psAnoMesBusca;

          bAchou  := False;

          Close;
          SQL.Clear;
          SQL.Add(' SELECT MAX(H.MES) MES '+
                  ' FROM   HISTRUBSAL H    '+
                  ' WHERE  (H.IDPESSOA  = '+IntToStr(piIdPessoa) +') '+
                  ' AND    (H.MES       = '''+sMesAux+''' )         '+
                  ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
                  ' AND    (H.IDPESSJUR = '+sIdPessJurNaEpoca+') ');
          Open;
          if (not IsEmpty) and (not FieldByName('MES').isnull) and
             (trim(FieldByName('MES').asstring) <> '') then
          begin
            sMesAux:=FieldByName('MES').asstring;

            Close;
            SQL.Clear;
            SQL.Add(' SELECT H.VALORINTEGRAL, H.VALORPROVENTO '+
                    ' FROM   HISTRUBSAL H    '+
                    ' WHERE  (H.IDPESSOA  = '+IntToStr(piIdPessoa) +') '+
                    ' AND    (H.MES       = '''+sMesAux+''' )         '+
                    ' AND    (H.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
                    ' AND    (H.IDPESSJUR = '+sIdPessJurNaEpoca+') ');
            Open;
            if not IsEmpty then
            begin
               if Trim(FieldByName('VALORINTEGRAL').AsString) = ''
               then sSalarioIntegral := FieldByName('VALORPROVENTO').AsString
               else sSalarioIntegral := FieldByName('VALORINTEGRAL').AsString;
               bAchou := True;
            end;
          end;

          if not bAchou then Result := '0';
          if Trim(Result) = '' then Result := '0';

       end;
    end;

    if sSalarioIntegral = '' then sSalarioIntegral := sSalarioNaEpoca;

    Result := OraNumero(sSalarioIntegral);
end; // BuscaSalarioPESSOAINTEGRAL

function BuscaUltimoEvento         ( qryAux                              : TwwQuery;
                                     piIdPessJur,   piIdPlanoPrev,
                                     piIdPessoa ,   piSeqProposta        : longint;
                                     psDataRef,
                                     psNomeCampoRetorno                  : string ) : string ;
begin
   Result := '';

   if Trim(psNomeCampoRetorno) = '' then psNomeCampoRetorno := 'IDEVENTOSPREV';
   if Trim(psDataRef) = ''          then psDataRef          := DateToStr(date);
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT IDEVENTOSPREV, IDSITPLANOATUAL, IDPESSOA, IDSITFUNCATUAL, '+
                  '        IDEVENTOGERADOR, IDPESSJUR, IDSITPARTATUAL, IDPLANOPREV,  '+
                  '        IDSITPLANONOVO, IDSITPARTNOVO, DATAREGISTRO, DATAEVENTO,  '+
                  '        FLGEFETIVADO, DATAEFETIVADO, DATAALTERADO, DATAVOLTA,     '+
                  '        FLGSITFUNCIMED, IDSITFUNCNOVO, FLGSITPARTIMED, FLGSITPLANOIMED, '+
                  '        SEQPROPOSTA, IDBENEFICIO, FLGTPDEMISSAO, IDREGRACALCBENEF,      '+
                  '        IDREGRARESGATE, FLGCOBROUPATRO, SALPARTICIPACAO  '+
                  ' FROM   EVENTOSPREV '+
                  ' WHERE  (IDPESSJUR   = '+IntToStr(piIdPessJur )   +') '+
                  ' AND    (IDPLANOPREV = '+IntToStr(piIdPlanoPrev )   +') '+
                  ' AND    (IDPESSOA    = '+IntToStr(piIdPessoa )   +') '+
                  ' AND    (SEQPROPOSTA = '+IntToStr(piSeqProposta) +') '+
                  ' AND    (DATAEVENTO  < TO_DATE('''+psDataRef+''',''DD/MM/YYYY'')) '+
                  ' ORDER BY DATAEVENTO DESC ');
   qryAux.Open;
   if qryAux.IsEmpty
   then Exit;

   qryAux.First;
   try
      Result := qryAux.FieldbyName(psNomeCampoRetorno).AsString
   except
      Result := '';
      MsgDlg('Campo '+psNomeCampoRetorno+' não existe no Registro de Eventos.','Erro',mtError,[mbOk,mbHelp],0);
   end;
   qryAux.Close;
end; // BuscaUltimoEvento

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2003 A 24/06/2003                         |
| PENDÊNCIA: 14347                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06H                                              |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - PASSAR OS CAMPOS VLRCALCINSS E VLRINFINSS DO HISTÓRICO DE BENEFÍCIOS PARA  |
| A CONSULTA DE REAJUSTE DE INSS.                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2005 A 24/06/2005                         |
| PENDÊNCIA: 19341                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.05.05b                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Colocar na query da function CalcBeneficioINSSAtual o filtro               |
|   b.flgpossuiacompinss = 0.                                                  |
|                                                                              |
|------------------------------------------------------------------------------}
