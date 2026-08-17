unit UParticipante;

{ Esta unit contém rotinas relativas ao Participante Previdenciário }

interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

    // Calcula o valor total da soma das reservas do participante
    function CalcReservaPart(iIdPessJur,iIdPlanoPrev, iIdPessoa, iIdRegra, iSeqProposta : integer; sDataRef, sDataInicio, iIdBeneficio : string; qry : TwwQuery):string;

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

    // Calcula a data mais antiga do participante nos planos e patrocinadores
    // em que ele está
    function CalcDataInscFund(iIdPessoa : integer; qry : TwwQuery):string;

    // Calcula a data mais antiga do participante nos planos e patrocinadores
    // em que ele está
    function CalcDataDemissao(iIdPessoa, iIdPessJur : integer; qry : TwwQuery):string;

    // Calcula o valor do último benefício de um participante anterior a uma
    // determinada data
    function CalcUltimoBeneficio( iIdPessJur,iIdPlanoPrev,iIdPessoa : integer;
                              sMesRef : string; var psIDTPPAGTOANT,psFlgBenefMinimo : string; qry : TwwQuery):string;

    function PossuiFilhoDependente(qry:TwwQuery; pIdPessoa:string):Char;

    // Verifica se um participante é reinscrito ou não
    function PartReinscrito (iIdPessJur, iIdPlanoPRev, iIdPessoa : integer; qry : TwwQuery) : boolean;

    // Verifica se um
    function PartResgPoupanca(iIdPessjur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer;
                          qry : TwwQuery) : boolean;

    // Calcula o ultimo mes que o participante pagou contribuicao
    function CalcUltMesContribuicao(iIdPessJur, iIdPlanoPrev, iIdPessoa, iSeqProposta : integer; sMesRef : string; qry : TwwQuery) : string;

    function ProximaSequenciaDependente(iIdPessoa : longint; qry : TwwQuery) : longint;

    function GerarHistoricoSalario(qryAux: TwwQuery; pIdPessJur, pIdPessoa,
                                  pMesRef,    sSituacao, sSalario, pIdMotivoContrib: string):Boolean; // rosana - serpros - 05/05/1999

    // Busca salario na tabela de participante PARTPREVPLAN
    function BuscaSalarioAtual(piIdPessJur,piIdPlanoPrev,piIdPessoa : integer; qry : TwwQuery):string;

    // Buscar salario na HistRubSal
    function BuscaSalario( piIdPessJur,  piIdPessoa    : longint;
                           psAnoMes,     psSitFundacao : string;
                           var sSalario, sMsgErro      : string;
                           qryAux : TwwQuery ) : string;

    // Funcao para trazer as situações anteriores as situaçoes atuais do ultimo evento gerador
    // para um participante - rosana - refer - 29/07/99
    function BuscaSituacaoAnterior(iIdPessoa,            iIdPessJur,       iIdPlanoPrev,   iSeqProposta : Integer;
                                   var sIdSitPartAntes,  sIdSitFuncAntes,  sIdSitPlanoPrevAntes : string;
                                   qry : TwwQuery) : boolean;

implementation

uses
    DAPrev, UMensErro, UAdmPrev, UMovReserva;

    
function CalcReservaPart( iIdPessJur, iIdPlanoPrev, iIdPessoa, iIdRegra, iSeqProposta : integer;
                          sDataRef, sDataInicio, iIdBeneficio : string; qry : TwwQuery):string;
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
        if sTipoPrevidencia = 'F'
        then begin
           qry.SQL.Add(' SELECT RP.VALORRESERVA, R.INDICEREAJUSTE '+
                       ' FROM RESERVAPART RP, RESERVAXPLANO R '+
                       ' WHERE RP.IDPESSJUR     = '+IntToStr(iIdPessJur)+' AND '+
                       '       RP.IDPLANOPREV   = '+IntToStr(iIdPlanoPrev)+' AND '+
                       '       RP.IDPESSOA      = '+ IntToStr(iIdPessoa)+' AND '+
                       '       RP.FLGATIVO      = 1 AND ' +
                       '       RP.IDTIPORESERVA = R.IDTIPORESERVA AND '+
                       '       RP.IDPLANOPREV   = R.IDPLANOPREV AND '+
                       '       R.ANALITICOSINTETI = ''A'' ');
        end
        else begin
            qry.SQL.Add(' SELECT RP.VALORRESERVA, R.INDICEREAJUSTE  '+
                        ' FROM   RESERVAPART RP, RESERVAXPLANO R, RESERVAXCONTRIB RXC, CONTRIBPREVPARTP CT '+
                        ' WHERE  RP.IDPESSJUR       = '+IntToStr(iIdPessJur)       +'   AND '+
                        '        RP.IDPLANOPREV     = '+IntToStr(iIdPlanoPrev)     +'   AND '+
                        '        RP.IDPESSOA        = '+IntToStr(iIdPessoa)        +'   AND '+
                        '        RP.SEQPROPOSTA     = '+IntToStr(iSeqProposta)     +'   AND ');

            if iIdBeneficio <> ''
            then qry.SQL.Add('     CT.IDBENEFICIO  = '''+iIdBeneficio+''' AND ');
            qry.SQL.Add(' RP.FLGATIVO        = 1                 AND '+
                        ' CT.IDPESSJUR       = RP.IDPESSJUR      AND '+
                        ' CT.IDPLANOPREV     = RP.IDPLANOPREV    AND '+
                        ' CT.IDPESSOA        = RP.IDPESSOA       AND '+
                        ' CT.SEQPROPOSTA     = RP.SEQPROPOSTA    AND '+
                        ' RXC.IDPLANOPREV    = CT.IDPLANOPREV    AND '+
                        ' RXC.IDCONTRIBUICAO = CT.IDCONTRIBUICAO AND '+
                        ' RP.IDTIPORESERVA   = RXC.IDTIPORESERVA AND '+
                        ' RP.IDTIPORESERVA   = R.IDTIPORESERVA   AND '+
                        ' RP.IDPLANOPREV     = R.IDPLANOPREV     AND '+
                        ' R.ANALITICOSINTETI = ''A'' ');
        end;
        qry.Open;

        qryauxreserva := TwwQuery.Create(Application);
        qryauxreserva.DatabaseName := 'BaseDados';

        qry.first;
        cAux := DecimalSeparator;
        DecimalSeparator := '.';
        while not qry.eof do
        begin
           if not (qry.FieldByName('VALORRESERVA').AsInteger = 0) then
           eAcumulador := eAcumulador + (qry.FieldByName('VALORRESERVA').AsFloat *
                          VoltaValorCotacao(qryauxreserva,qry.fieldbyname('INDICEREAJUSTE').AsString,
                          sDataRef));
           qry.next;
        end;//while

        Result := Floattostr(eAcumulador);
        DecimalSeparator := cAux;


        //Result := qry.FieldByName('VALORRESERVA').AsString;
        qry.Close;
     end
     else begin
        if sDataRef = ''    then sDataRef := DateToStr(date);
        if sDataInicio = '' then sDataInicio := DateToStr(date);
        sMesRef := Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2);


        sValorProvento :=   CalcSALPART(iIdPessJur,iIdPessoa,sMesRef,qry);
        if Trim(sValorProvento) = '' then sValorProvento := '0';


        if sTipoPrevidencia = 'F'
        then sSQL := ' SELECT RP.IDTIPORESERVA,        RP.IDPLANOPREV,   RP.IDPESSJUR, RP.IDPESSOA, ' +
                     '        RP.DATAREFERENCIASA,  RP.VALORRESERVA,  RP.PERCENTUALSAQUE, ' +
                     '        R.NOME, R.CODHIERARQUIA, R.INDICEREAJUSTE, R.IDBENEFICIO, M.MOESIGLA, ' +
                     '        PF.DATANASC, EL.DATAADMISSAO,'+
                     ''''+sDataInicio+''' AS DATAINICIO, '+
                     ''''+sDataRef+''' AS DATAREF,      '+
                     OraNumero(sValorProvento)+ ' AS VALORPROVENTO '+
                     ' FROM  RESERVAPART RP, RESERVAXPLANO R, MOEDA M, PESSOAFISICA PF, ELEGPATRO EL '  +
                     ' WHERE RP.IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND ' +
                     '       RP.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND ' +
                     '       RP.IDPESSOA    = ' + IntToStr(iIdPessoa)    + ' AND ' +
                     '       PF.IDPESSOA    = RP.IDPESSOA AND '+
                     '       EL.IDPESSOA    = RP.IDPESSOA AND '+
                     '       EL.IDPESSJUR   = RP.IDPESSJUR AND '+
                     '       RP.FLGATIVO    = 1 AND '+
                     '       RP.IDTIPORESERVA = R.IDTIPORESERVA AND '+
                     '       RP.IDPLANOPREV   = R.IDPLANOPREV AND '+
                     '       R.ANALITICOSINTETI = ''A'' AND '+
                     '       R.INDICEREAJUSTE = M.MOECODIGO(+) '
        else begin
           sSQL := ' SELECT RP.IDTIPORESERVA,        RP.IDPLANOPREV,   RP.IDPESSJUR, RP.IDPESSOA, ' +
                   '        RP.DATAREFERENCIASA,  RP.VALORRESERVA,  RP.PERCENTUALSAQUE, ' +
                   '        R.NOME, R.CODHIERARQUIA, R.INDICEREAJUSTE, R.IDBENEFICIO, ' +
                   ''''+sDataRef+''' AS DATAREF,     M.MOESIGLA '+
                   ' FROM   RESERVAPART RP, RESERVAXPLANO R, RESERVAXCONTRIB RXC, '+
                   '        CONTRIBPREVPARTP CT, MOEDA M                 '+
                   ' WHERE  RP.IDPESSJUR       = '+IntToStr(iIdPessJur)      +'   AND '+
                   '        RP.IDPLANOPREV     = '+IntToStr(iIdPlanoPrev)    +'   AND '+
                   '        RP.IDPESSOA        = '+IntToStr(iIdPessoa)       +'   AND '+
                   '        RP.SEQPROPOSTA     = '+IntToStr(iSeqProposta)    +'   AND ';

           if iIdBeneficio <> ''
           then sSQL := sSql + '     CT.IDBENEFICIO  = '''+iIdBeneficio+''' AND ';

           sSQL := sSQL + '        RP.FLGATIVO        = 1                 AND '+
                          '        CT.IDPESSJUR       = RP.IDPESSJUR      AND '+
                          '        CT.IDPLANOPREV     = RP.IDPLANOPREV    AND '+
                          '        CT.IDPESSOA        = RP.IDPESSOA       AND '+
                          '        CT.SEQPROPOSTA     = RP.SEQPROPOSTA    AND '+
                          '        RXC.IDPLANOPREV    = CT.IDPLANOPREV    AND '+
                          '        RXC.IDCONTRIBUICAO = CT.IDCONTRIBUICAO AND '+
                          '        RP.IDTIPORESERVA   = RXC.IDTIPORESERVA AND '+
                          '        RP.IDTIPORESERVA   = R.IDTIPORESERVA   AND '+
                          '        RP.IDPLANOPREV     = R.IDPLANOPREV     AND '+
                          '        R.ANALITICOSINTETI = ''A'' ';
        end;

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
                      qryauxreserva.free; // CAMILLE - REFER - 24.06.1999
                   except
                   end;
                   Exit;
              end;
        end;

        if dtmAPrev.qryRegra.IsEmpty then exit;

        dtmAPrev.regraAPrev.RuleName := IntToStr(iIdRegra);
        ExibeQueryRegra(dtmAPrev.qryRegra.SQL.Text, dtmAPrev.regraAPrev.RuleName);
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
    sMesAux    : string;
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

     sMesAux := sMesRef;
     bAchou  := False;
     iTentativas := 0;

     // CAMILLE - REFER - 02.07.1999
     while (not bAchou) and (iTentativas <= 36) do
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
        if not IsEmpty
        then begin
           Result := FieldByName('ValorProvento').AsString;
           bAchou := True;
           break;
        end;
        sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
        inc(iTentativas);
     end;
     if not bAchou then Result := '0';
     if Trim(Result) = '' then Result := '0';
  end; // with qryAux;

  if Trim(Result) = '' then Result := '0';
end;

function CalcSalPart(iIdPessJur, iIdPessoa : integer; sMesRef : string; qry : TwwQuery) : string;
var iIdRubrica,
    iTentativas : integer;
    bAchou     : boolean;
    sMesAux    : string;
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

     sMesAux := sMesRef;
     bAchou  := False;
     iTentativas := 0;

     // CAMILLE - REFER - 02.07.1999
     while (not bAchou) and (iTentativas <= 36) do
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
        if not IsEmpty
        then begin
           Result := FieldByName('ValorProvento').AsString;
           bAchou := True;
           break;
        end;
        sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
        inc(iTentativas);
     end;
     if not bAchou then Result := '0';
     if Trim(Result) = '' then Result := '0';

{ // AINDA COM PROBLEMA DE PERFORMANCE

     Close;
     SQL.Clear;
     SQL.Add(' SELECT H1.MES, H1.VALORPROVENTO     '+ // CAMILLE - REFER - 25.06.1999
             ' from   HISTRUBSAL H1, HISTRUBSAL H2 '+
             ' WHERE  (H1.IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
             ' AND    (H1.IDPESSOA  = '+IntToStr(iIdPessoa) +') '+
             ' AND    (H1.IDPESSJUR = '+IntToStr(iIdPessJur)+') '+
             ' AND    (H1.IDPESSOA  = H2.IDPESSOA )'+
             ' AND    (H1.MES      <= H2.MES )'+
             ' GROUP BY H1.MES, H1.VALORPROVENTO '+
             ' HAVING COUNT (H2.MES) <= 36 ');
     Open;
     if IsEmpty
     then begin
        Result := '0';
        Close;
        Exit;
     end;

     bAchou  := False;
     iTentativas := 0;
     sMesAux := sMesRef;
     while (not bAchou) and (iTentativas <= 36) do
     begin
        bAchou := Locate('Mes',sMesAux,[loCaseInsensitive]);
        if bAchou
        then begin
           Result := FieldByName('ValorProvento').AsString;
           bAchou := True;
           break;
        end;
        sMesAux := AnoMesAnterior(StrToInt(Copy(sMesAux,6,2)),StrToInt(Copy(sMesAux,1,4)));
        inc(iTentativas);
     end; // while

     if not bAchou then Result := '0';
     if Trim(Result) = '' then Result := '0';
}
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


{
// CALCSALPART COM PROBLEMA DE PERFORMANCE

 function CalcSalPart(iIdPessJur, iIdPessoa : integer; sMesRef : string; qry : TwwQuery) : string;
var iIdRubrica : integer;
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
     Close;
     SQL.Clear;
     SQL.Add(' SELECT VALORPROVENTO '+
             ' FROM   HISTRUBSAL '+
             ' WHERE (IDPESSOA = '+ IntToStr(iIdPessoa)+') '+
             ' AND   (MES <= '''+sMesRef+''') '+
             ' AND   (IDRUBRICA = '+IntToStr(iIdRubrica)+') '+
             ' AND   (IDPESSJUR = '+IntToStr(iIdPessJur)+') '+
             ' ORDER BY MES '); // CAMILLE - REFER - 24.06.1999
     Open;

     if IsEmpty
     then Result := '0'
     else begin
        // First; // CAMILLE - REFER - 24.06.1999
        Last;     // CAMILLE - REFER - 24.06.1999
        Result := FieldByName('VALORPROVENTO').ASSTRING;
     end;
     Close;
  end;//with
  if Trim(Result) = '' then Result := '0';


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

}

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

// ROSANA - SERPROS
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
   qry.SQL.Add(' SELECT VALORPREV '+
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

function CalcDataInscFund(iIdPessoa : integer; qry : TwwQuery):string;
begin
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT INSCRICAODATA         '+
               ' FROM   PARTPREVPLAN          '+
               ' WHERE  IDPESSOA = '+IntToStr(iIdPessoa)+
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

function CalcUltimoBeneficio(     iIdPessJur,iIdPlanoPrev,iIdPessoa : integer;
                                  sMesRef : string;
                              var psIDTPPAGTOANT,
                                  psFlgBenefMinimo : string;
                                  qry : TwwQuery):string;
var sDataRef    : string;
    rValorTotal : double;
begin
   Result := '0';
   psIdTpPagtoAnt := '';
   psFlgBenefMinimo := '0';

   sDataRef := '01/'+Copy(sMesRef,6,2)+'/'+Copy(sMesRef,1,4);
   // Verificar todos os beneficios que o participante estava recebendo
   // na data do evento
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT IDBENEFICIO,VALORATUAL,IDTPPAGTOBENEFIC,FLGBENEFMIN '+
               ' FROM BENEFBFCIARIO '+
               ' WHERE  (IDPESSJUR   = '+IntToStr(iIdPessJur)+')'+
               ' AND    (IDPLANOPREV = '+IntToStr(iIdPLANOPREV)+')'+
               ' AND    (IDPESSOA    = '+IntToStr(iIdPESSOA)+')'+
               ' AND    (IDTITULAR   = '+IntToStr(iIdPESSOA)+')'+
               ' AND    (DATAINICIO  <= TO_DATE('''+sDataRef+''',''dd/mm/yyyy'')) '+
               ' AND    ((DATAFINAL IS NULL) OR '+
               '         (DATAFINAL  >= TO_DATE('''+sDataRef+''',''dd/mm/yyyy''))) ');
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
       dtmAPrev.qryAux.SQL.Add(' SELECT VLBENEFPGTO '+
               ' FROM   HSTBENEFBFCIARIO '+
               ' WHERE  (IDPESSJUR   = '+IntToStr(iIdPessJur)+')'+
               ' AND    (IDPLANOPREV = '+IntToStr(iIdPLANOPREV)+')'+
               ' AND    (IDPESSOA    = '+IntToStr(iIdPESSOA)+')'+
               ' AND    (IDBENEFICIO = '+qry.FieldbyName('IdBeneficio').AsString+')'+
               ' AND    (MESREFERENCIA < '''+sMesRef+''' '+')'+
               ' AND    (VLBENEFPGTO IS NOT NULL '+')'+
               ' ORDER BY MESREFERENCIA DESC ');
       dtmAPrev.qryAux.Open;
       if dtmAPrev.qryAux.IsEmpty
       then rValorTotal := rValorTotal + qry.FieldByName('ValorAtual').AsFloat
       else rValorTotal := rValorTotal + dtmAPrev.qryAux.FieldByName('VlBenefPgto').AsFloat;
       qry.Next;
   end;
   qry.Close;
   dtmAPrev.qryAux.Close;
   Result := OraNumero(FloatToStr(rValorTotal));
   if Trim(Result) = '' then Result := '0';
end;//CalcUltimoBeneficio


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

{   qry.SQL.Add(' SELECT P.IDPLANOPREV '+
               ' FROM PARTPREVPLAN P, EVENTOSPREV E, SITPART S, SITPLANOPREV SP '+
               ' WHERE  (P.IDPESSJUR = '+IntToStr(iIdPessJur)+')'+
               ' AND    (P.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)+')'+
               ' AND    (P.IDPESSOA = '+IntToStr(iIdPessoa)+')'+
               ' AND    (P.FLGDESATIVADO = 1 '+')'+
               ' AND    (E.IDPESSOA = P.IDPESSOA '+')'+
               ' AND    (E.IDPESSJUR = P.IDPESSJUR '+')'+
               ' AND    (E.IDPLANOPREV = P.IDPLANOPREV '+')'+
               ' AND    (E.IDSITPARTNOVO = S.IDSITPART '+')'+
               ' AND    (E.IDSITPLANONOVO = SP.IDSITPLANOPREV '+')'+
               ' AND    ( (S.FLGINTERNO = ''CA'') OR '+
               '          (SP.FLGINTERNO IN (''CA'',''SU'',''DE'') ) '+')');
}
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
   qry.sql.add(' SELECT MAX(DATAMOV) DATAMOV '+
               ' FROM HISTMOVRESERVA H, EVENTOGERADOR E '+
               ' WHERE '+
               ' E.IDEVENTOGERADOR = H.IDEVENTOGERADOR '+
               ' AND E.FLGINTERNO = ''RP'' '+
               ' AND H.IDPESSOA = '+IntToStr(iIdPessoa)+
               ' AND H.IDPLANOPREV =  '+IntToStr(iIdPlanoPrev)+
               ' AND H.IDPESSJUR = '+IntToStr(iIdPessJur)+
               ' AND SEQPROPOSTA = '+IntToStr(iSeqProposta));
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
   Result := '0000/00'; // CAMILLE - REFER - 12.05.1999

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
 //  Result := 1;
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

function GerarHistoricoSalario(qryAux: TwwQuery;
                               pIdPessJur, pIdPessoa,
                               pMesRef,     sSituacao, sSalario, pIdMotivoContrib: string):Boolean;
var
   sFlgSrb, sCodProvDesc, sIdRubrica, sCampoRubrica : string;
begin
   // Gera salario historico de salario "virtual" para mantidos, com o salario calculado no preparo

   result := False;
   if (sSituacao = 'MA') then
      begin
          sCampoRubrica := 'IDRUBSALMANUT';
          sFlgSrb       := '5';           // a regra vai somar com salario particip  -  rosana - serpros - 27/05/1999
      end
   else
      begin
          sCampoRubrica := 'IDRUBSALMANUTPARC';
          sFlgSrb       := '4';           // a regra vai substituir
      end;

   with qryAux do
   begin
     Close;
     SQL.Clear;     // Busca Rubrica
     SQL.Add(' SELECT '+sCampoRubrica+' AS IDRUBRICA FROM PATRO WHERE IDPESSOA = '+pIdPessJur);
     Open;
     if (not IsEmpty) and (FieldbyName('IDRUBRICA').AsInteger > 0)
     then begin
        sIdRubrica := FieldByName('IDRUBRICA').AsString;

        SQL.Clear;  // Busca codprovdesc
        SQL.Add(' SELECT CODPROVDESC FROM RUBRICAXPESS WHERE IDPESSOA  = '+pIdPessJur +
                '                                      AND   IDRUBRICA = '+sIdRubrica);
        Open;
        if (IsEmpty) or (FieldByName('CODPROVDESC').AsString = '') then
        begin
            MsgDlg('A Rubrica do salário de manutenção, não está associada a patrocinadora','Erro',mtError,[mbOk,mbHelp],0);
            Close;
            Exit;
        end;
        sCodProvDesc := FieldByName('CODPROVDESC').AsString;

        SQL.Clear;  // Insere no historico
        SQL.Add(' SELECT VALORPROVENTO '+
                ' FROM   HISTRUBSAL    '+
                ' WHERE (IDPESSOA  = '+pIdPessoa +')  AND '+
                '       (IDPESSJUR = '+pIdPessJur+')  AND '+
                '       (IDRUBRICA = '+sIdRubrica+')  AND '+
                '       (MES       = '''+pMesRef+''')');
        Open;
        if IsEmpty then
        begin
           Sql.Clear;
           Sql.Add('INSERT INTO HISTRUBSAL (IDPESSOA,      IDPESSJUR,   IDRUBRICA, MES, '+
                   '                        VALORPROVENTO, REFERENCIA,  IDMOTIVO,  CODPROVDESC, '+
                   '                        SEQRUBRICA,    FLGSRB,      MESCOBRANCA ) '+
                   'VALUES ( '+pIdPessoa    +', '+
                               pIdPessJur   +', '+
                               sIdRubrica   +', '+
                          ''''+pMesRef    +''', '+
                               OraNumero(sSalario)+', '+''''+'***'+''', '+
                               pIdMotivoContrib   +', '+
                          ''''+sCodProvDesc     +''', '+
                               '1'                +', '+
                               sFlgSrb            +', '+   //FLGSRB  rosana - serpros - 25/05/99
                          ''''+pMesRef          +''') ');
           try
              ExecSql;
           except
              Close;
              Exit;
           end;
        end;
     end;
     Close;
  end;   // with
  result := True;
end;

function BuscaSalario(piIdPessJur, piIdPessoa : longint;
                      psAnoMes, psSitFundacao : string;
                      var sSalario, sMsgErro : string;
                      qryAux : TwwQuery ) : string;
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
         sDescRubrica := 'Salário de Participação';
         sNomeRubrica := 'IDRUBSALPARTICIP';
      end;
   end;

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

   with qryAux do
   begin
      // Verificar se salário já existe neste mes
      Close;
      SQL.Clear;
      SQL.Add(' SELECT VALORPROVENTO FROM HISTRUBSAL '+
                     ' WHERE (IDPESSOA  = '+IntToStr(piIdPessoa) +')  AND '+
                     '       (IDPESSJUR = '+IntToStr(piIdPessJur)+')  AND '+
                     '       (IDRUBRICA = '+sIdRubrica           +')  AND '+
                     '       (MES       = '''+psAnoMes+''')');
      Open;
      if not IsEmpty
      then sNovoSalario := FieldByName('ValorProvento').AsString
      else sNovoSalario := sSalario;
   end;
   qryAux.Close;
   Result := sNovoSalario;
end; // BuscaSalario

// rosana - refer - 29/07/99
function BuscaSituacaoAnterior(iIdPessoa,  iIdPessJur,  iIdPlanoPrev, iSeqProposta : Integer;
                               var sIdSitPartAntes,  sIdSitFuncAntes, sIdSitPlanoPrevAntes : string;
                               qry : TwwQuery) : boolean;
begin
     sIdSitPartAntes      := '';
     sIdSitFuncAntes      := '';
     sIdSitPlanoPrevAntes := '';

     qry.Close;
     qry.Sql.Clear;
//   EV.IDSITFUNCATUAL, EV.IDSITPARTATUAL, EV.IDSITPLANOATUAL '+

     qry.Sql.Add(' SELECT MAX(EV.IDEVENTOSPREV)  AS IDEVENTOSPREV, EV.IDPESSOA, EV.IDPESSJUR, '+
                 '        EV.IDPLANOPREV, EV.SEQPROPOSTA, EV.IDSITPARTATUAL, EV.IDSITPLANOATUAL, EV.IDSITFUNCATUAL '+
                 ' FROM   EVENTOSPREV EV  '+
                 ' WHERE  EV.IDPESSOA     = '+IntToStr(iIdPessoa)    +
                 ' AND    EV.IDPESSJUR    = '+IntToStr(iIdPessJur)   +
                 ' AND    EV.IDPLANOPREV  = '+IntToStr(iIdPlanoPrev) +
                 ' AND    EV.SEQPROPOSTA  = '+IntToStr(iSeqProposta) +
                 ' GROUP  BY EV.IDPESSOA, EV.IDPESSJUR, EV.IDPLANOPREV, EV.SEQPROPOSTA, '+
                 '           EV.IDSITPARTATUAL, EV.IDSITPLANOATUAL, EV.IDSITFUNCATUAL   ');
     qry.Open;
     if not qry.IsEmpty then
     begin
        sIdSitPartAntes      := qry.FieldByName('IDSITPARTATUAL').AsString;
        sIdSitPlanoPrevAntes := qry.FieldByName('IDSITPLANOATUAL').AsString;
        sIdSitFuncAntes      := qry.FieldByName('IDSITFUNCATUAL').AsString;
     end;
     qry.Close;
   {}Result:= Not qry.IsEmpty;
end;


end.
