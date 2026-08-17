unit UPCS;

interface

uses SysUtils, Db, DBTables, Wwquery, wwdbedit,
     DBCtrls, wwidlg, Wwdatsrc;


// Retorna o PCS válido em uma data para uma determinada patrocinadora
function PCSValido            ( piIdPessJur            : longint;
                                psData                 : string ) : integer;

// Busca o valor de um cargo em uma determinada data
function BuscaValorCARGO      ( piIdPessJur, piIdCargo : longint;
                                psDataVigencia,
                                psData                 : string   ) : double;

// Busca o valor de uma funcao em uma determinada data
function BuscaValorFUNCAO     ( piIdPessJur,
                                piIdFuncao             : longint;
                                psData                 : string   ) : double;

// Busca na Evolucao Funcional (EVOLFUNCPREV) o cargoxnivel que o participante estava em uma data
function BuscaCARGONaEpoca    ( piIdPessJur, piIdPessoa, piIdItemPCS : longint;
                                psData                  : string;
                                var psIdPessJurCG, psIdCargoExt, psDataVigencia : string   ) : boolean;

// Busca na Evolucao Funcional (EVOLFUNCPREV) a funcaoxgrupo que o participante estava em uma data
function BuscaFUNCAONaEpoca    ( piIdPessJur, piIdPessoa, piIdItemPCS : longint;
                                psData                  : string;
                                var psIdPessJurFG, psIdFuncao   : string   ) : boolean;

function ExecutaRegraValorATS  ( piIdPessJur,  piIdPessoa, piIdRegraValorRubrica : longint;
                                 psDataRefEvento,
                                 psDataInicio, psDataFinal, psAnoMesAtual        : string;
                                 pdPercentualATS                                 : double) : double;

function ExecutaRegraValorCARGO ( piIdPessJur,  piIdPessoa, piIdRegraValorRubrica : longint;
                                  psDataRefEvento,
                                  psDataInicio, psDataFinal, psAnoMesAtual        : string;
                                  pdValorCargo                                    : double) : double;
                                  
// Executa a regra de calculo do valor de uma rubrica correspondente a um ItemPCS
// Retorna -1 caso tenha ocorrido algum erro
function ExecutaRegraValorRubricaPCS ( piIdPessJur,  piIdPessoa, piIdRegraValorRubrica : longint;
                                       psDataInicio, psDataFinal, psAnoMesAtual        : string;
                                       piTipo : word ) : double;

function ExecutaRegraPercRubricaMesAMes ( piIdPessJur,  piIdPessoa, piIdRegraValorRubrica : longint;
                                          psDataInicio, psDataFinal, psAnoMesAtual        : string;
                                          piTipo : word ) : double;

function CalculaResumoFuncional ( piIdPessJur, piIdPessoa : longint;
                                  psDataEvento            : string;
                                  var sMsgErro            : string ) : boolean;

function CalculaTotalResumoFuncional ( piIdPessJur, piIdPessoa : longint;
                                       var pdTotalNoPBC        : double  ) : double;

// Rotina para atualizar a tabela de resumo funcional de um participante
// Se nao encontrar, a rotina irá inserir na tabela a linha correspondente
function AtualizaResumoFunc ( piIdPessJur,
                              piIdPessoa,
                              piIdItemPCS,
                              piIdPCS              : longint;
                              pdValorItem,
                              pdValorMedioItem,
                              pdPercentual         : double;
                              piNumOcorrencias     : word;
                              psIdPessJurFG,
                              psIdFuncao,
                              psIdPessJurCG,
                              psIdCargoExt,
                              psDataVigencia,
                              psDataEvento         : string;
                              pbAtualizaValorMedio : boolean ) : boolean;


implementation

uses UAdmPREVFB, DAPrev;

function PCSValido            ( piIdPessJur : longint; psData : string ) : integer;
begin
  Result := -1;

  if Trim(psData) = '' then psData := DateToStr(date);

  with dtmAPrev.qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDPCS , MAX(INICIOVIGENCIA) FROM PCS '+
             ' WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+
             ' AND    INICIOVIGENCIA <= TO_DATE('''+psData+''', ''dd/mm/yyyy'') '+
             ' AND    ( (FINALVIGENCIA IS NULL) OR (FINALVIGENCIA >= TO_DATE('''+psData+''', ''dd/mm/yyyy'')) ) '+
             ' GROUP BY IDPCS '+
             ' ORDER BY MAX(INICIOVIGENCIA) DESC ');
     Open;
     if not IsEmpty
     then Result := FieldByName('IdPCS').AsInteger;
     Close;
  end;
end;

function BuscaValorCARGO      ( piIdPessJur, piIdCargo : longint;
                                psDataVigencia,
                                psData                 : string   ) : double;
begin
   Result := 0;
   with dtmAPrev.qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT FN.VALOR FROM FAIXANIVEL FN, CARGOXNIVEL C '+
              ' WHERE  C.IDPESSJUR    = '+IntToStr(piIdPessJur)+
              ' AND    C.IDCARGOEXT   = '+IntToStr(piIdCargo)+
              ' AND    C.DATAVIGENCIA = TO_DATE('''+psDataVigencia+''', ''DD/MM/YYYY'')  '+
              ' AND    FN.IDPESSJUR   = C.IDPESSJURNIVEL '+
              ' AND    FN.IDNIVEL     = C.IDNIVEL '+
              ' AND    FN.DATAEFETIVACAO = (SELECT MAX(FN.DATAEFETIVACAO) '+
              '                             FROM FAIXANIVEL FN, CARGOXNIVEL C       '+
              ' 	        	    WHERE  C.IDPESSJUR    = '+IntToStr(piIdPessJur)+
              '                             AND    C.IDCARGOEXT   = '+IntToStr(piIdCargo)+
              '                             AND    C.DATAVIGENCIA = TO_DATE('''+psDataVigencia+''', ''DD/MM/YYYY'')  '+
              '                             AND    FN.IDPESSJUR   = C.IDPESSJURNIVEL '+
              ' 			    AND    FN.IDNIVEL     = C.IDNIVEL '+
              ' 			    AND    FN.DATAEFETIVACAO <= TO_DATE('''+psData+''', ''DD/MM/YYYY'') ) ');
      Open;
      if not IsEmpty
      then Result := FieldByName('VALOR').AsFloat;
      Close;
   end;
end;

function BuscaValorFUNCAO     ( piIdPessJur,
                                piIdFuncao             : longint;
                                psData                 : string   ) : double;
var iIdGrupoFunc : longint;
begin
   Result := 0;

   // Buscar o grupo que a funcao estava na data indicada
   with dtmAPrev.qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDGRUPOFUNC FROM GRUPOCARGOEXT  '+
              ' WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
              ' AND    IDCARGOEXT     =  '+IntToStr(piIdFuncao)+
              ' AND    DATAVIGENCIA   = ( SELECT MAX(DATAVIGENCIA) '+
              '                           FROM GRUPOCARGOEXT       '+
              '                           WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
              '                           AND    IDCARGOEXT     =  '+IntToStr(piIdFuncao)+
              '                           AND    DATAVIGENCIA   <= TO_DATE('''+psData+''',''DD/MM/YYYY'')      '+
              '                           AND    ((DATAFIM      >= TO_DATE('''+psData+''',''DD/MM/YYYY'') ) OR '+
              '                                    (DATAFIM      IS NULL) ) ) ');
      Open;
      if not IsEmpty
      then begin
         iIdGrupoFunc := FieldByName('IDGRUPOFUNC').AsInteger;
         Close;
         SQL.Clear;
         SQL.Add(' SELECT VALOR FROM FAIXAGRUPO  '+
                 ' WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
                 ' AND    IDGRUPOFUNC    =  '+IntToStr(iIdGrupoFunc)+
                 ' AND    DATAEFETIVACAO = (SELECT MAX(DATAEFETIVACAO) '+
                 '                          FROM   FAIXAGRUPO            '+
                 ' 			 WHERE  IDPESSJUR      = '+IntToStr(piIdPessJur)+
                 '                          AND    IDGRUPOFUNC    =  '+IntToStr(iIdGrupoFunc)+
                 ' 			 AND    DATAEFETIVACAO <= TO_DATE('''+psData+''', ''DD/MM/YYYY'') ) ');
         Open;
         if not IsEmpty
         then Result := FieldByName('VALOR').AsFloat;
         Close;
      end
      else begin // Funcao não tem grupo. Verificar se ela tem valor na tabela de funcao sem grupo
         Close;
         SQL.Clear;
         SQL.Add(' SELECT VALOR FROM FAIXAFUNCAO  '+
                 ' WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
                 ' AND    IDCARGOEXT     =  '+IntToStr(piIdFuncao)+
                 ' AND    DATAEFETIVACAO = (SELECT MAX(DATAEFETIVACAO) '+
                 '                          FROM   FAIXAFUNCAO          '+
                 ' 			                 WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
                 '                          AND    IDCARGOEXT     =  '+IntToStr(piIdFuncao)+
                 ' 			                 AND    DATAEFETIVACAO <= TO_DATE('''+psData+''', ''DD/MM/YYYY'') ) ');
         Open;
         if not IsEmpty
         then Result := FieldByName('VALOR').AsFloat;
         Close;
      end;
   end;
end;

// Busca na Evolucao Funcional (EVOLFUNCPREV) o cargoxnivel que o participante estava em uma data
function BuscaCARGONaEpoca    ( piIdPessJur, piIdPessoa, piIdItemPCS : longint;
                                psData                  : string;
                                var psIdPessJurCG, psIdCargoExt, psDataVigencia : string   ) : boolean;
begin
   Result := False;
   psIdPessJurCG  := '';
   psIdCargoExt   := '';
   psDataVigencia := '';
   with dtmAPrev.qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDPESSJURCG, IDCARGOEXT, DATAVIGENCIA  '+
              ' FROM   EVOLFUNCPREV '+
              ' WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+
              ' AND    IDPESSOA  = '+IntToStr(piIdPessoa)+
              ' AND    DATAINICIO <= TO_DATE('''+psData+''', ''DD/MM/YYYY'') '+
              ' AND    ( (DATAFINAL >= TO_DATE('''+psData+''', ''DD/MM/YYYY'') ) OR (DATAFINAL IS NULL) )');
      if piIdItemPCS > 0
      then SQL.Add(' AND IDITEMPCS = '+IntToStr(piIdItemPCS) );
      Open;

      if not IsEmpty
      then begin
         psIdPessJurCG  := FieldByName('IDPESSJURCG').AsString;
         psIdCargoExt   := FieldByName('IDCARGOEXT').AsString;
         psDataVigencia := FieldByName('DATAVIGENCIA').AsString;
      end;
      Close;
   end;
   Result := True;
end; // BuscaCargoNaEpoca

// Busca na Evolucao Funcional (EVOLFUNCPREV) a funcaoxgrupo que o participante estava em uma data
function BuscaFUNCAONaEpoca    ( piIdPessJur, piIdPessoa, piIdItemPCS : longint;
                                psData                  : string;
                                var psIdPessJurFG, psIdFuncao : string   ) : boolean;
begin
   Result := False;
   psIdPessJurFG     := '';
   psIdFuncao        := '';
   with dtmAPrev.qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDPESSJURFG, IDFUNCAO  '+
              ' FROM   EVOLFUNCPREV '+
              ' WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+
              ' AND    IDPESSOA  = '+IntToStr(piIdPessoa)+
              ' AND    DATAINICIO <= TO_DATE('''+psData+''', ''DD/MM/YYYY'') '+
              ' AND    ( (DATAFINAL >= TO_DATE('''+psData+''', ''DD/MM/YYYY'') ) OR (DATAFINAL IS NULL) )');
      if piIdItemPCS > 0
      then SQL.Add(' AND IDITEMPCS = '+IntToStr(piIdItemPCS) );
      Open;

      if not IsEmpty
      then begin
         psIdPessJurFG     := FieldByName('IDPESSJURFG').AsString;
         psIdFuncao        := FieldByName('IDFUNCAO').AsString;

      end;
      Close;
   end;
   Result := True;
end; // BuscaFUNCAONaEpoca

function ExecutaRegraValorATS  ( piIdPessJur,  piIdPessoa, piIdRegraValorRubrica : longint;
                                 psDataRefEvento,
                                 psDataInicio, psDataFinal, psAnoMesAtual        : string;
                                 pdPercentualATS                                 : double) : double;
var sSQL, sValorRegra : string;
    bErro             : boolean;
    dValorCargo,
    dValorATS         : double;
    sIdPessJurCG,
    sIdCargoExt,
    sDataVigencia    : string;
begin
    Result := 0;
    // Se não tiver regra, fazer como valor do ATS o seguinte calculo
    // ATS = VALOR DO CARGO * PERCENTUAL / 100
    if piIdRegraValorRubrica <= 0
    then begin
       if not BuscaCARGONaEpoca( piIdPessJur, piIdPessoa,
                                 -1,
                                 psDataInicio,
                                 sIdPessJurCG, sIdCargoExt, sDataVigencia )
       then Exit;

       dValorCargo := BuscaValorCARGO( piIdPessJur, StrToInt(sIdCargoExt),
                                       sDataVigencia,
                                       psDataInicio);

       dValorATS := dValorCargo * pdPercentualATS / 100;
       Result    := dValorATS;
    end
    else begin
       Result := -1;
       if Trim(psDataInicio) = '' then psDataInicio := '01/01/0001';
       if Trim(psDataFinal)  = '' then psDataFinal  := '31/12/9999';
       if Trim(psAnoMesAtual) = '' then psAnoMesAtual := '0000/00';

       sSQL := ' SELECT '+IntToStr(piIdPessJur)+' AS IDPESSJUR,  '+
                          IntToStr(piIdPessoa) +' AS IDPESSOA,   '+
                          ''''+psDataRefEvento +'''  AS DATAINICIO, '+
                          ''''+psDataInicio    +'''  AS DATAINICIOATS, '+
                          ''''+psDataFinal     +'''  AS DATAFINALATS,  '+
                          OraNumero(FloatToStr(pdPercentualATS))+' AS PERCENTUAL, '+
                          ''''+psAnoMesAtual   +'''  AS ANOMESREF   '+
               ' FROM DUAL ';

       sValorRegra := RegraNumerica(IntToStr(piIdRegraValorRubrica),sSQL, bErro, iIdCalculoGeral);

       if bErro
       then Exit;

       Result := StrToFloat(ClienteNumero(sValorRegra));
    end;

end; // ExecutaRegraValorATS

function ExecutaRegraValorCARGO ( piIdPessJur,  piIdPessoa, piIdRegraValorRubrica : longint;
                                  psDataRefEvento,
                                  psDataInicio, psDataFinal, psAnoMesAtual        : string;
                                  pdValorCargo                                    : double) : double;
var sSQL, sValorRegra : string;
    bErro             : boolean;
begin
    Result := 0;
    if piIdRegraValorRubrica <= 0 then Exit;

    Result := -1;

    if Trim(psDataInicio)  = '' then psDataInicio := '01/01/0001';
    if Trim(psDataFinal)   = '' then psDataFinal  := '31/12/9999';
    if Trim(psAnoMesAtual) = '' then psAnoMesAtual := '0000/00';

    sSQL := ' SELECT '+IntToStr(piIdPessJur)+' AS IDPESSJUR,           '+
                       IntToStr(piIdPessoa) +' AS IDPESSOA,            '+
                       ''''+psDataRefEvento +'''  AS DATAINICIO,       '+
                       ''''+psDataInicio+'''   AS DATAINICIOCARGO,     '+
                       ''''+psDataFinal +'''   AS DATAFINALCARGO,      '+
                       OraNumero(FloatToStr(pdValorCargo))+' AS VALOR, '+
                       ''''+psAnoMesAtual+'''  AS ANOMESREF            '+
            ' FROM DUAL ';

    sValorRegra := RegraNumerica(IntToStr(piIdRegraValorRubrica),sSQL, bErro, iIdCalculoGeral);

    if bErro
    then Exit;

    Result := StrToFloat(ClienteNumero(sValorRegra));

end; // ExecutaRegraValorCARGO

function ExecutaRegraValorRubricaPCS ( piIdPessJur,  piIdPessoa, piIdRegraValorRubrica : longint;
                                       psDataInicio, psDataFinal, psAnoMesAtual        : string;
                                       piTipo : word ) : double;
var sSQL, sValorRegra : string;
    bErro : boolean;
begin
    Result := 0;
    if piIdRegraValorRubrica <= 0 then Exit;
    Result := -1;
    if Trim(psDataInicio) = '' then psDataInicio := '01/01/0001';
    if Trim(psDataFinal)  = '' then psDataFinal  := '31/12/9999';
    if Trim(psAnoMesAtual) = '' then psAnoMesAtual := '0000/00';

    sSQL := ' SELECT '+IntToStr(piIdPessJur)+' AS IDPESSJUR,  '+
                       IntToStr(piIdPessoa) +' AS IDPESSOA,   '+
                       ''''+psDataInicio+'''   AS DATAINICIO, '+
                       ''''+psDataFinal +'''   AS DATAFINAL,  '+
                       ''''+psAnoMesAtual+'''  AS ANOMESREF   '+
            ' FROM DUAL ';

    sValorRegra := RegraNumerica(IntToStr(piIdRegraValorRubrica),sSQL, bErro, iIdCalculoGeral);

    if bErro
    then Exit;

    Result := StrToFloat(ClienteNumero(sValorRegra));
end;

function ExecutaRegraPercRubricaMesAMes ( piIdPessJur,  piIdPessoa, piIdRegraValorRubrica : longint;
                                          psDataInicio, psDataFinal, psAnoMesAtual        : string;
                                          piTipo : word ) : double;
var sSQL, sValorRegra : string;
    bErro : boolean;
begin
    Result := 0;
    if piIdRegraValorRubrica <= 0 then Exit;
    Result := -1;
    if Trim(psDataInicio) = '' then psDataInicio := '01/01/0001';
    if Trim(psDataFinal)  = '' then psDataFinal  := '31/12/9999';
    if Trim(psAnoMesAtual) = '' then psAnoMesAtual := '0000/00';

    sSQL := ' SELECT '+IntToStr(piIdPessJur)+' AS IDPESSJUR,  '+
                       IntToStr(piIdPessoa) +' AS IDPESSOA,   '+
                       ''''+psDataInicio+'''   AS DATAINICIO, '+
                       ''''+psDataFinal +'''   AS DATAFINAL,  '+
                       ''''+psAnoMesAtual+'''  AS ANOMESREF   '+
            ' FROM DUAL ';

    sValorRegra := RegraNumerica(IntToStr(piIdRegraValorRubrica),sSQL, bErro, iIdCalculoGeral);

    if bErro
    then Exit;

    Result := StrToFloat(ClienteNumero(sValorRegra));
end;

function CalculaResumoFuncional ( piIdPessJur, piIdPessoa : longint;
                                  psDataEvento            : string;
                                  var sMsgErro            : string ) : boolean;
var
    sSQL,
    sAnoMesInicio,
    sAnoMesFinal,
    sValorRegra       : string;
    bErro             : boolean;
    dValorItem,
    dValorMedioItem,
    dPercentual       : double;
    iIdPCSValido,
    iPrazoPBC,
    iNumOcorrencias   : longint;
    sIdPessJurFG,
    sIdFuncao,
    sIdPessJurCG,
    sIdCargoExt,
    sDataVigencia    : string;
    i                : word;
begin
  Result := False;

  // Apagar o resumo funcional pois o mesmo pode sofrer diversas alteracoes
  // com a alteracao de um cargo ou de uma funcao ou da exclusao de um item
  with dtmAPrev.qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' DELETE FROM RESUMOFUNC '+
             ' WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+
             ' AND    IDPESSOA  = '+IntToStr(piIdPessoa));
     try
        ExecSQL;
     except
        sMsgErro := ' Erro ao tentar apagar o resumo anterior.';
        Exit;
     end;
  end;


  // Verificar o PCS valido na data do evento
  iIdPCSValido := PCSValido ( piIdPessJur, psDataEvento);

  // Abrir query com todos os itens de PCS do PCS válido na data do evento
  with dtmAPrev.qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT I.IDITEMPCS, I.CODITEMPCS, I.TIPO, I.PRAZOAPUR, I.ORDEMCALC, '+
             '        I.IDRUBRICA, I.IDREGRACALCITEM, I.IDREGRACALCPERCENT, I.FLGOBRIGATORIO,  '+
             '        P.PRAZOPBC '+
             ' FROM   PCS P, ITEMPCS I '+
             ' WHERE  I.IDPESSJUR = '+IntToStr(piIdPessJur)+
             ' AND    I.IDPCS     = '+IntToStr(iIdPCSValido)+
             ' AND    P.IDPESSJUR = I.IDPESSJUR '+
             ' AND    P.IDPCS     = I.IDPCS     ');

     Open;
     if IsEmpty
     then begin
        sMsgErro := 'Nenhum item de cálculo encontrado para o PCS válido em '+psDataEvento;
        Result := True;
        Exit;
     end;

     iPrazoPBC := FieldByName('PrazoPBC').AsInteger;

     sAnoMesFinal := Copy(psDataEvento,7,4)+'/'+Copy(psDataEvento,4,2);
     sAnoMesInicio := sAnoMesFinal;
     for i := 1 to iPrazoPBC - 1 do
         sAnoMesInicio := SAnoMesAnterior(sAnoMesInicio);

     // Para cada item do PCS valido fazer :
     First;
     while not Eof do
     begin
        // Zerar variaveis
        dValorItem        := 0;
        dPercentual       := 0;
        iNumOcorrencias   := 0;

        sSQL := ' SELECT '+IntToStr(piIdPessJur)+' AS IDPESSJUR,  '+
                           IntToStr(piIdPessoa) +' AS IDPESSOA,   '+
                           ''''+psDataEvento+'''   AS DATAEVENTO, '+
                           ''''+psDataEvento+'''   AS DATAINICIO,  '+
                           ''''+FieldByName('CodItemPCS').AsString+''' AS CODITEMPCS '+

                ' FROM DUAL ';

        try
            if FieldByName('IdRegraCalcItem').AsInteger > 0
            then sValorRegra := RegraNumerica(FieldByName('IdRegraCalcItem').AsString,sSQL, bErro, iIdCalculoGeral)
            else sValorRegra := '0';
        except
            sMsgErro := ' Erro na Regra de Cálculo do Item  - Regra Nº '+FieldByName('IdRegraCalcItem').AsString;
            Exit;
        end;

        try
           dValorItem := StrToFloat(ClienteNumero(sValorRegra));
        except
           sMsgErro := ' A Regra de Cálculo do Item Nº '+FieldByName('IdRegraCalcItem').AsString+' retornou um valor inválido . ';
           Exit;
        end;

        try
            if FieldByName('IdRegraCalcPercent').AsInteger > 0
            then sValorRegra := RegraNumerica(FieldByName('IdRegraCalcPercent').AsString,sSQL, bErro, iIdCalculoGeral)
            else sValorRegra := '0';
        except
            sMsgErro := ' Erro na Regra de Cálculo do Percentual do Item  - Regra Nº '+FieldByName('IdRegraCalcPercent').AsString;
            Exit;
        end;

        try
           dPercentual := StrToFloat(ClienteNumero(sValorRegra));
        except
           sMsgErro := ' A Regra de Cálculo do Item Nº '+FieldByName('IdRegraCalcPercent').AsString+' retornou um valor inválido . ';
           Exit;
        end;

        if FieldByName('Tipo').AsInteger = 3 // Cargo
        then begin
           sIdPessJurFG      := ' NULL ';
           sIdFuncao         := ' NULL ';

           if not BuscaCARGONaEpoca ( piIdPessJur, piIdPessoa,
                                      FieldByName('IdItemPCS').AsInteger,
                                      psDataEvento,
                                      sIdPessJurCG, sIdCargoExt, sDataVigencia)
           then begin
              sMsgErro := ' Erro ao buscar cargo do participante na Evolução Funcional.';
              Exit;
           end;

           if (Trim(sIdPessJurCG) = '') or (Trim(sIdCargoExt) = '')  or (Trim(sDataVigencia) = '')
           then begin
                sIdPessJurCG      := ' NULL ';
                sIdCargoExt       := ' NULL ';
                sDataVigencia     := '';
           end;

        end
        else if FieldByName('Tipo').AsInteger = 4 // Funcao
             then begin
                sIdPessJurCG      := ' NULL ';
                sIdCargoExt       := ' NULL ';
                sDataVigencia     := '';

                if not BuscaFUNCAONaEpoca ( piIdPessJur, piIdPessoa,
                                           FieldByName('IdItemPCS').AsInteger,
                                           psDataEvento,
                                           sIdPessJurFG, sIdFuncao)
                then begin
                   sMsgErro := ' Erro ao buscar função do participante na Evolução Funcional.';
                   Exit;
                end;

                if (Trim(sIdPessJurFG) = '') or (Trim(sIdFuncao) = '')  
                then begin
                   sIdPessJurFG      := ' NULL ';
                   sIdFuncao         := ' NULL ';
                end;

             end
             else begin
                sIdPessJurFG      := ' NULL ';
                sIdFuncao         := ' NULL ';
                sIdPessJurCG      := ' NULL ';
                sIdCargoExt       := ' NULL ';
                sDataVigencia     := '';
             end;

        // Contar o numero de ocorrencias da rubrica na histrubsal
        dtmAPrev.qryAux.Close;
        dtmAPrev.qryAux.SQL.Clear;
        dtmAPrev.qryAux.SQL.Add(' SELECT COUNT(*) AS NUMOCORRENCIAS FROM HISTRUBSAL '+
                                ' WHERE  IDPESSJUR = '+IntToStr(piIdPessJur)+
                                ' AND    IDPESSOA  = '+IntToStr(piIdPessoa)+
                                ' AND    IDRUBRICA = '+FieldByName('IdRubrica').AsString+
                                ' AND    MES       >= '''+sAnoMesInicio+''''+
                                ' AND    MES       <= '''+sAnoMesFinal+'''');
        dtmAPrev.qryAux.Open;


        if (dtmAPrev.qryAux.IsEmpty) or (Trim(dtmAPrev.qryAux.FieldByName('NumOcorrencias').AsString) = '')
        then iNumOcorrencias := 0
        else iNumOcorrencias := dtmAPrev.qryAux.FieldByName('NumOcorrencias').AsInteger;

        // Calcular o valor médio do item
        sSQL := ' SELECT SUM(H.VALORPROVENTO) AS TOTALITEM '+
                ' FROM   HISTRUBSAL H                      '+
                ' WHERE  H.IDPESSJUR   = '+IntToStr(piIdPessJur)+
                ' AND    H.IDPESSOA    = '+IntToStr(piIdPessoa)+
                ' AND    H.IDRUBRICA   = '+FieldByName('IdRubrica').AsString+
                ' AND    H.TIPOITEMPCS = '+FieldByName('TIPO').AsString+
                ' AND    H.FLGEQUIPARACAO = 1 ';

        dtmAPrev.qryAux.Close;
        dtmAPrev.qryAux.SQL.Clear;
        dtmAPrev.qryAux.SQL.Add(sSQL);
        dtmAPrev.qryAux.Open;

        dValorMedioItem := dtmAPrev.qryAux.FieldByName('TOTALITEM').AsFloat / iPrazoPBC;

        // Atualizar resumo funcional
        if not AtualizaResumoFunc ( piIdPessJur,
                              piIdPessoa,
                              FieldByName('IdItemPCS').AsInteger,
                              iIdPCSValido,
                              dValorItem,
                              dValorMedioItem,
                              dPercentual,
                              iNumOcorrencias,
                              sIdPessJurFG,
                              sIdFuncao,
                              sIdPessJurCG,
                              sIdCargoExt,
                              sDataVigencia,
                              psDataEvento,
                              False )
        then begin
           sMsgErro := ' Erro ao gravar item '+FieldByName('CodItemPCS').AsString+' na evolução funcional.';
           Exit;
        end;
        Next;
     end; // while not qryItens.Eof
  end;

  Result := True;
end;

function CalculaTotalResumoFuncional( piIdPessJur, piIdPessoa : longint;
                                      var pdTotalNoPBC        : double  ) : double;
begin
   Result       := 0;
   pdTotalNoPBC := 0;
end;

function AtualizaResumoFunc ( piIdPessJur,
                              piIdPessoa,
                              piIdItemPCS,
                              piIdPCS              : longint;
                              pdValorItem,
                              pdValorMedioItem,
                              pdPercentual         : double;
                              piNumOcorrencias     : word;
                              psIdPessJurFG,
                              psIdFuncao,
                              psIdPessJurCG,
                              psIdCargoExt,
                              psDataVigencia,
                              psDataEvento         : string;
                              pbAtualizaValorMedio : boolean ) : boolean;

begin
   Result := False;

   if Trim( psIdPessJurFG ) = ''    then psIdPessJurFG      := ' NULL ';
   if Trim( psIdFuncao ) = ''       then psIdFuncao         := ' NULL ';
   if Trim( psIdPessJurCG) = ''     then psIdPessJurCG      := ' NULL ';
   if Trim(psIdCargoExt ) = ''      then psIdCargoExt       := ' NULL ';
   if Trim(psDataVigencia ) = ''
   then psDataVigencia     := 'TO_DATE('''+DateToStr(date)+''',''DD/MM/YYYY'')'
   else psDataVigencia     := 'TO_DATE('''+psDataVigencia+''',''DD/MM/YYYY'')';

   if Trim(psDataEvento ) = ''      then psDataEvento       := DateToStr(date);

   // Tenta atualizar, se nao conseguir, insere
   with dtmAPrev.qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE RESUMOFUNC         ');
      SQL.Add(' SET    VALORITEM       =  '+OraNumero(FormatFloat('#0.00',pdValorItem))      +',');

      if pbAtualizaValorMedio
      then SQL.Add('   VALORMEDIOITEM  =  '+OraNumero(FormatFloat('#0.00',pdValorMedioItem)) +',');

      SQL.Add('        PERCENTUAL      =  '+OraNumero(FormatFloat('#0.00',pdPercentual))     +',');
      SQL.Add('        NUMOCORRENCIAS  =  '+IntToStr(piNumOcorrencias)              +',');
      SQL.Add('        DATAEVENTO      =  TO_DATE('''+psDataEvento  +''',''DD/MM/YYYY'')');
      SQL.Add(' WHERE  IDPESSJUR       =  '+IntToStr(piIdPessJur));
      SQL.Add(' AND    IDPESSOA        =  '+IntToStr(piIdPessoa));
      SQL.Add(' AND    IDITEMPCS       =  '+IntToStr(piIdItemPCS));
      SQL.Add(' AND    IDPCS           =  '+IntToStr(piIdPCS));

      try
         ExecSQL;
      except
         Exit;
      end;

      if RowsAffected > 0
      then begin
         Result := True;
         Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add(' INSERT INTO RESUMOFUNC (IDPESSJUR, IDPESSOA, IDITEMPCS, IDPCS,  '+
              '             VALORITEM, VALORMEDIOITEM, PERCENTUAL, NUMOCORRENCIAS, '+
              '             IDPESSJURCG, IDCARGOEXT, '+
              '             DATAVIGENCIA, DATAEVENTO ) '+
              ' VALUES ( '+IntToStr(piIdPessJur)                   +', '+
                           IntToStr(piIdPessoa)                    +', '+
                           IntToStr(piIdItemPCS)                   +', '+
                           IntToStr(piIdPCS    )                   +', '+
                           OraNumero(FormatFloat('#0.00',pdValorItem))      +', '+
                           OraNumero(FormatFloat('#0.00',pdValorMedioItem)) +', '+
                           OraNumero(FormatFloat('#0.00',pdPercentual))     +', '+
                           IntToStr(piNumOcorrencias)              +', '+
                           psIdPessJurCG                           +', '+
                           psIdCargoExt                            +', '+
                           psDataVigencia                          +', '+
                           'TO_DATE('''+psDataEvento+''', ''DD/MM/YYYY'') ) ');
      try
         ExecSQL;
      except
         Exit;
      end;
   end;

   Result := True;
end; // AtualizaResumoFunc

end.
