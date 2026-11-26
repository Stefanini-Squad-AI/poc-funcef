unit UDotacao;

interface

uses SysUtils, Db, DBTables, Wwquery, wwdblook;

function GeraDotacaoParticipante(piIdPessJur, piIdPlanoPrev, piIdPessoa,
                                 piSeqProposta, piIdContribuicao : longint;
                                 pdValor : double) : boolean;

function ApagaDotacao (piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                       psDataReferencia : string;
                       var sMsgErro : string ) : boolean;

implementation

uses UMensErro, UDataBase, UAdmPrev, DBaseDados, DAPrev;

function GeraDotacaoParticipante(piIdPessJur, piIdPlanoPrev, piIdPessoa,
                                 piSeqProposta, piIdContribuicao : longint;
                                 pdValor : double) : boolean;
var  sSQL,
     sDataInicio,
     sDataFinal,
     sAnoMesInicio,
     sAnoMesFinal,
     sAnoMesAtual,
     sIdRegraCalculo,
     sIdTpPeriodicidade : string;


     iNumRecebimento   : longint;
     iQuantOcorrencia,
     i                 : word;
     bInclui13         : boolean;

begin
  Result := False;

  with dtmAPrev.qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT DOT.DATAINICIO, DOT.QUANTOCORRENCIA, DOT.FLGINCLUI13, '+
             '        C.IDTPPERIODICIDADE, CP.IDREGRACALCULO               '+
             ' FROM   PARAMDOTACAO DOT, CONTPREV CP, CONTRIBUICAO C         '+
             ' WHERE  (DOT.IDPESSJUR      = '+IntToStr(piIdPessJur)+')'+
             ' AND    (DOT.IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+')'+
             ' AND    (DOT.IDCONTRIBUICAO = '+IntToStr(piIdContribuicao)+')'+
             ' AND    (DOT.IDPLANOPREV    = CP.IDPLANOPREV) '+
             ' AND    (DOT.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '+
             ' AND    (CP.IDCONTRIBUICAO  = C.IDCONTRIBUICAO) ');
     Open;
     if IsEmpty then Exit;
     sDataInicio        := FieldByName('DataInicio').AsString;
     iQuantOcorrencia   := FieldByName('QuantOcorrencia').AsInteger;
     if FieldByName('IdTpPeriodicidade').AsInteger > 0
     then sIdTpPeriodicidade := FieldByName('IdTpPeriodicidade').AsString
     else sIdTpPeriodicidade := 'NULL';

     if FieldByName('IdRegraCalculo').AsInteger > 0
     then sIdRegraCalculo    := FieldByName('IdRegraCalculo').AsString
     else sIdRegraCalculo    := 'NULL';
     bInclui13               := (FieldByName('FlgInclui13').AsInteger = 1);
     Close;
  end;
  sAnoMesInicio := Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2);
  sAnoMesAtual     := sAnoMesInicio;
  sAnoMesFinal     := sAnoMesInicio;

  // Dado o número de ocorrencias, calcular o mes final a partir do mes inicial
  // O for é de 1 até (QuantOcorrencia - 1) porque o mes de inicio conta.
  // Exemplo : inicio = 01/10/1999 + 12 meses = 30/09/1999
  for i := 1 to (iQuantOcorrencia - 1) do sAnoMesFinal := ProximoAnoMes(StrToInt(Copy(sAnoMesFinal,6,2)),
                                                                  StrToInt(Copy(sAnoMesFinal,1,4)));

  sDataFinal := Copy(sDataInicio,1,2)+'/'+
                Copy(sAnoMesFinal,6,2)+'/'+Copy(sAnoMesFinal,1,4);

  // Preencher Historico de Contribuicao para todos os elegiveis que já ingressaram
  // no plano,ou seja, viraram participantes

  // Tentar inserir na contribprevpartp. Se já existir, está correto. É só inserir
  // no historico
  sSQL := ' INSERT INTO CONTRIBPREVPARTP (IDPESSJUR,IDPLANOPREV,     '+
          '             IDPESSOA,SEQPROPOSTA,IDTPPERIODICIDADE,IDCONTRIBUICAO,               '+
          '             FLGDESCFOLHA,FLGCOBRA,  '+
          '             FLGRECALCULA,FLGRETROATIVO,DATAINICIO,DATAFINAL,ULTMESPREPARO) '+
          ' VALUES ('+ IntToStr(piIdPessJur)+','+
                       IntToStr(piIdPlanoPrev)+','+
                       IntToStr(piIdPessoa)+','+
                       IntToStr(piSeqProposta)+','+
                       sIdTpPeriodicidade+','+
                       IntToStr(piIdContribuicao)+','+
                       '1, 0, 0, 0, '+
                       'TO_DATE('''+sDataInicio+''',''dd/mm/yyyy''), '+
                       'TO_DATE('''+sDataFinal+''',''dd/mm/yyyy''), '+
                       ''''+sAnoMesFinal+''')';
  with dtmAPrev.qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     try
        ExecSQL;
     except
     end;
  end;

  while sAnoMesAtual <= sAnoMesFinal do
  begin
     iNumRecebimento := LeUltRegistro(dtmAPrev.qry,'HSTCONTRIBPREV');

     sSQL := ' INSERT INTO HSTCONTRIBPREV(NUMRECEBIMENTO,IDMOTIVO,MESREFERENCIA, '+
             '             MESCOBRANCA,IDPESSJUR,IDPLANOPREV,IDPESSOA,SEQPROPOSTA,'+
             '             IDCONTRIBUICAO,FLGDEVOLUCAO,              '+
             '             FLGDIVERGENTE,FLGCONCESSAO,FLGEVENTO,FLGCALCRESERVA,  '+
             '             FLGDESCFOLHA,FLGSITFUNDACAO,FLGAPORTE,VALORESPERADO,  '+
             '             VALORRECEBIDO,VALORCALCULADO,DATAPREVISAORECE,        '+
             '             DATARECEBIMENTO,DATAINICIO,DATAFINAL,                 '+
             '             IDREGRACALCULO,SITRECEBIMENTO,TIPO)                   '+
             ' VALUES ('+IntToStr(iNumRecebimento)+','+ IntToStr(prmIdMotivoContrib) +','+
                    ''''+sAnoMesAtual+''', '''+sAnoMesAtual+''', '+
                    IntToStr(piIdPessJur)+','+ IntToStr(piIdPlanoPrev)+','+
                    IntToStr(piIdPessoa)+',1,'+IntToStr(piIdContribuicao)+','+
                    '0,0,0,0,0,1,''AT'',0,'+OraNumero(FloatToStr(pdValor))+','+
                    OraNumero(FloatToStr(pdValor))+','+OraNumero(FloatToStr(pdValor))+','+
                    'TO_DATE('''+sDataInicio+''',''dd/mm/yyyy''), '+
                    'TO_DATE('''+sDataInicio+''',''dd/mm/yyyy''), '+
                    'TO_DATE('''+sDataInicio+''',''dd/mm/yyyy''), '+
                    'TO_DATE('''+sDataFinal+''',''dd/mm/yyyy''), '+
                    sIdRegraCalculo+',2, ''F'')';

     with dtmAPrev.qry do
     begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        try
           ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;
     end;

     // Incluir contribuicao sobre 13o.
     if (Copy(sAnoMesAtual,6,2) = '12') and (bInclui13)
     then begin
        iNumRecebimento := LeUltRegistro(dtmAPrev.qry,'HSTCONTRIBPREV');

        sSQL := ' INSERT INTO HSTCONTRIBPREV(NUMRECEBIMENTO,IDMOTIVO,MESREFERENCIA, '+
                '             MESCOBRANCA,IDPESSJUR,IDPLANOPREV,IDPESSOA,SEQPROPOSTA,'+
                '             IDCONTRIBUICAO,FLGDEVOLUCAO,              '+
                '             FLGDIVERGENTE,FLGCONCESSAO,FLGEVENTO,FLGCALCRESERVA,  '+
                '             FLGDESCFOLHA,FLGSITFUNDACAO,FLGAPORTE,VALORESPERADO,  '+
                '             VALORRECEBIDO,VALORCALCULADO,DATAPREVISAORECE,        '+
                '             DATARECEBIMENTO,DATAINICIO,DATAFINAL,                 '+
                '             IDREGRACALCULO,SITRECEBIMENTO,TIPO)                   '+
                ' VALUES ('+IntToStr(iNumRecebimento)+','+ IntToStr(prmIdMotivoContrib) +','+
                       ''''+Copy(sAnoMesAtual,1,5)+'13'+''', '''+sAnoMesAtual+''', '+
                       IntToStr(piIdPessJur)+','+ IntToStr(piIdPlanoPrev)+','+
                       IntToStr(piIdPessoa)+',1,'+IntToStr(piIdContribuicao)+','+
                       '0,0,0,0,0,1,''AT'',0,'+OraNumero(FloatToStr(pdValor))+','+
                       OraNumero(FloatToStr(pdValor))+','+OraNumero(FloatToStr(pdValor))+','+
                       'TO_DATE('''+sDataInicio+''',''dd/mm/yyyy''), '+
                       'TO_DATE('''+sDataInicio+''',''dd/mm/yyyy''), '+
                       'TO_DATE('''+sDataInicio+''',''dd/mm/yyyy''), '+
                       'TO_DATE('''+sDataFinal+''',''dd/mm/yyyy''), '+
                       sIdRegraCalculo+',2, ''F'')';

        with dtmAPrev.qry do
        begin
           Close;
           SQL.Clear;
           SQL.Add(sSQL);
           try
              ExecSQL;
           except
              on E:EDBEngineError do
              begin
                 MostrarErro(E);
                 Exit;
              end;
           end;
        end;

     end;

     sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
  end; // while sAnoMesAtual < sAnoMesFinal

  Result := True;
end; // GeraDotacaoParticipante

function ApagaDotacao (piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint;
                       psDataReferencia : string;
                       var sMsgErro : string ) : boolean;
var sMesReferencia : string;
begin
   Result := False;

   // Se a referencia for dia 1o., apagar inclusive do mes
   // Senao Apagar dotacoes do mes seguinte a data de referencia
   
   if Trim(psDataReferencia) = '' then psDataReferencia := FormatDateTime('dd/mm/yyyy', Date); 

   if Copy(psDataReferencia,1,2) = '01'
   then sMesReferencia  := Copy(psDataReferencia, 7,4)+'/'+Copy(psDataReferencia,4,2)
   else begin
      
      psDataReferencia := FormatDateTime('dd/mm/yyyy', StrToDate(psDataReferencia)+31); 
      
      sMesReferencia  := Copy(psDataReferencia, 7,4)+'/'+Copy(psDataReferencia,4,2);
   end;

   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDCONTRIBUICAO FROM PARAMDOTACAO '+
              ' WHERE  IDPESSJUR   = '+IntToStr(piIdPessJur)+
              ' AND    IDPLANOPREV = '+IntToStr(piIdPlanoPrev));
      Open;
      if IsEmpty
      then begin
         Result := True;
         Exit;
      end;
      while not Eof do
      begin
         with dtmAPrev.qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' DELETE FROM HSTCONTRIBPREV '+
                ' WHERE  MESREFERENCIA  >= '''+sMesReferencia+''''+
                ' AND    IDPESSJUR      = '+IntToStr(piIdPessJur)+
                ' AND    IDPLANOPREV    = '+IntToStr(piIdPlanoPrev)+
                ' AND    IDPESSOA       = '+IntToStr(piIdPessoa)+
                ' AND    SEQPROPOSTA    = '+IntToStr(piSeqProposta)+
                ' AND    IDCONTRIBUICAO = '+dtmAPrev.qry.FieldByName('IdContribuicao').AsString);
            try
               ExecSQL;
            except
               sMsgErro := 'Erro ao apagar a dotação.';
               Exit;
            end;
         end;
         Next;
      end; // while
   end; // with
   Result := True;
end; // ApagaDotacao

end.
