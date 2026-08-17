unit uCtrlPosadasExpBalancete;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils,uSistema, provider,
     uMidasUtil,uCMSqlParams{$IFNDEF VERSAO0505}, uCMTypes {$ENDIF};

Type
  TCtrlPosadasExpBalancete = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
  private

  public

      Constructor Create; Override;
      Destructor  Destroy;Override;
      Function ListaBalancete(iPlano,iPessoa :Double; iPernumero, iExercicio : Integer; bSoAnalitica, bSemEstatistica, bCorresp : Boolean) : OleVariant;
      Function ListaTNV(iPlano,iPessoa :Double; iPernumero, iExercicio : Integer; bSoAnalitica, bSemEstatistica, bCorresp: Boolean) : OleVariant;
      Function ListaTotLancamentos(iPlano,iPessoa :Double; iPernumero, iExercicio : Integer) : OleVariant;
      Function ListaLancamentos(iPlano,iPessoa :Double; iPernumero, iExercicio : Integer; bCorresp: Boolean) : OleVariant;
  end;

implementation


procedure TCtrlPosadasExpBalancete.DoChangeDataBase;
begin
  inherited;
  //
end;

constructor TCtrlPosadasExpBalancete.Create;
begin
  inherited;
  //
end;

destructor TCtrlPosadasExpBalancete.Destroy;
begin
  inherited;
  //
end;

function TCtrlPosadasExpBalancete.ListaBalancete(iPlano,iPessoa :Double; iPernumero, iExercicio : Integer; bSoAnalitica, bSemEstatistica, bCorresp: Boolean) : OleVariant;
var _sql : TCMSqlParams;
begin
   _sql := TCMSqlParams.Create(nil);
   _sql.ControlObject := Self;
   Try
      with _sql do begin
         SQL.Clear;
         SQL.Add('SELECT                          ');
         if bCorresp then
            SQL.Add('   C.PLACONCORRESP AS CONTA, ')
         else
            SQL.Add('   C.PLACONTA AS CONTA,      ');
         SQL.Add('   C.PLAGRAU, C.PLANATUREZA,    ');
         SQL.Add('   NVL(S.MOV,0) AS MOV,         ');
         SQL.Add('   NVL(S.MOVDEB,0) AS MOVDEB,   ');
         SQL.Add('   NVL(S.MOVCRED,0) AS MOVCRE,  ');
         SQL.Add('   NVL(SA.SALDOANT,0) AS SALDOANT,                                 ');
         SQL.Add('   DECODE(NVL(S.MOV,0), 0, '' '', DECODE(SIGN(S.MOV),              ');
         SQL.Add('   -1, ''a'', ''c'' )) AS MOVDC,                                   ');
         SQL.Add('   DECODE(NVL(SA.SALDOANT,0), 0, '' '', DECODE(SIGN(SA.SALDOANT),  ');
         SQL.Add('   -1, ''a'', ''c'' )) AS SALDOANTDC                               ');
         SQL.Add('FROM                                                               ');
         SQL.Add('    PLANOCONTA C,                                                  ');
         SQL.Add('   (SELECT PLACONTA,                                               ');
         SQL.Add('           SUM(NVL(PLSDEBITOCORRENTE,0)-NVL(PLSCREDITOCOR,0)) AS SALDOANT  ');
         SQL.Add('    FROM PLANOSALDO                                                ');
         SQL.Add('    WHERE                                                          ');
         if bSoAnalitica then
            SQL.Add('       (PLSTIPO =''A'') AND                                     ');
         SQL.Add('       (PEREXERCICIO =' + IntToStr(iExercicio) + ') AND            ');
         SQL.Add('       ((PERNUMERO <' + IntToStr(iPerNumero)+ ') OR (PERNUMERO IS NULL)) AND  ');
         SQL.Add('       (IDPESSOA =' + FloatToStr(iPessoa) + ') AND                 ');
         SQL.Add('          (PLANO =' + FloatToStr(iPlano) + ')                      ');
         SQL.Add('    GROUP BY PLACONTA ) SA,                                        ');
         SQL.Add('                                                                   ');
         SQL.Add('   (SELECT PLACONTA,                                               ');
         SQL.Add('           SUM(NVL(PLSDEBITOCORRENTE,0)-NVL(PLSCREDITOCOR,0)) AS MOV,       ');
         SQL.Add('           SUM(NVL(PLSCREDITOCOR,0)) AS MOVCRED,       ');
         SQL.Add('           SUM(NVL(PLSDEBITOCORRENTE,0)*-1) AS MOVDEB  ');
         SQL.Add('    FROM PLANOSALDO                                           ');
         SQL.Add('    WHERE                                                     ');
         if bSoAnalitica then
            SQL.Add('       (PLSTIPO =''A'') AND                                        ');
         SQL.Add('       (PEREXERCICIO =' +IntToStr(iExercicio)+ ') AND         ');
         SQL.Add('       (PERNUMERO = ' + IntToStr(iPerNumero)+ ') AND            ');
         SQL.Add('       (IDPESSOA =' + FloatToStr(iPessoa) + ') AND            ');
         SQL.Add('       (PLANO =' + FloatToStr(iPlano) + ')                    ');
         SQL.Add('    GROUP BY PLACONTA ) S                                     ');
         SQL.Add('                                                              ');
         SQL.Add('WHERE                                                         ');
         SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND                          ');
         SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                         ');
         if bSemEstatistica then begin
            SQL.Add(' (C.PLAGRUPO <> ''E'') AND                                ');
         end;
         SQL.Add('    (C.PLANO =' + FloatToStr(iPlano) + ')                    ');
         SQL.Add('GROUP BY                                                     ');
         if bCorresp then
            SQL.Add('   C.PLACONCORRESP, ')
         else
            SQL.Add('   C.PLACONTA,      ');
         SQL.Add('   C.PLAGRAU, C.PLANATUREZA,    ');
         SQL.Add('   S.MOV,                       ');
         SQL.Add('   SA.SALDOANT,                 ');
         SQL.Add('   S.MOVDEB,                    ');
         SQL.Add('   S.MOVCRED                    ');
         SQL.Add('HAVING (DECODE(NVL(S.MOVDEB,0),0,DECODE(NVL(S.MOVCRED,0),0,DECODE(NVL(SA.SALDOANT,0),0,''0'',''1''),''1''),''1'') = ''1'') ');
         SQL.Add('ORDER BY CONTA                                                   ');
      end;
      Result := _sql.Data;
   Finally
      _sql.Free;
   end;
end;



function TCtrlPosadasExpBalancete.ListaTNV(iPlano,iPessoa :Double; iPernumero, iExercicio : Integer; bSoAnalitica, bSemEstatistica, bCorresp: Boolean) : OleVariant;
var _sql : TCMSqlParams;
begin
   _sql := TCMSqlParams.Create(nil);
   _sql.ControlObject := Self;
   Try
      with _sql do begin
         SQL.Clear;
         SQL.Add('SELECT                              ');
         if bCorresp then
            SQL.Add('   C.PLACONCORRESP AS CONTA,     ')
         else
            SQL.Add('   C.PLACONTA AS CONTA,          ');
         SQL.Add('   SUM(NVL(S.MOV,0)) AS MOV         ');
         SQL.Add('FROM                                                                 ');
         SQL.Add('    PLANOCONTA C,                                                    ');
         SQL.Add('   (SELECT PLACONTA,                                                 ');
         SQL.Add('           SUM(NVL(PLSCREDITOCOR,0)-NVL(PLSDEBITOCORRENTE,0)) AS MOV ');
         SQL.Add('    FROM PLANOSALDO                                              ');
         SQL.Add('    WHERE                                                        ');
         if bSoAnalitica then
            SQL.Add('       (PLSTIPO =''A'') AND                                   ');
         SQL.Add('       (PEREXERCICIO =' +IntToStr(iExercicio)+ ') AND         ');
         SQL.Add('       (PERNUMERO = ' + IntToStr(iPerNumero)+ ') AND            ');
         SQL.Add('       (IDPESSOA =' + FloatToStr(iPessoa) + ') AND            ');
         SQL.Add('       (PLANO =' + FloatToStr(iPlano) + ')                    ');
         SQL.Add('    GROUP BY PLACONTA ) S                                     ');
         SQL.Add('                                                              ');
         SQL.Add('WHERE                                                         ');
         SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND                          ');
         SQL.Add('    (C.PLAIMPRELATEVOL = ''S'') AND                           ');
         if bSemEstatistica then begin
            SQL.Add(' (C.PLAGRUPO <> ''E'') AND                                ');
         end;
         SQL.Add('    (C.PLANO =' + FloatToStr(iPlano) + ')                    ');
         SQL.Add('GROUP BY                                                     ');
         if bCorresp then
            SQL.Add('   C.PLACONCORRESP ')
         else
            SQL.Add('   C.PLACONTA      ');
         SQL.Add('HAVING SUM(NVL(S.MOV,0)) <> 0   ');
         SQL.Add('ORDER BY CONTA                                                   ');
      end;
      Result := _sql.Data;
   Finally
      _sql.Free;
   end;
end;


procedure TCtrlPosadasExpBalancete.OnCreateAppServer;
begin
  inherited;
  //
end;

function TCtrlPosadasExpBalancete.ListaTotLancamentos(iPlano,
  iPessoa: Double; iPernumero, iExercicio: Integer): OleVariant;
var _sql : TCMSqlParams;
begin
   _sql := TCMSqlParams.Create(nil);
   _sql.ControlObject := Self;
   Try
      with _sql do begin
         SQL.Clear;
         SQL.Add('SELECT COUNT(*) AS TOTLANC ');
         SQL.Add('FROM PLANILHA P, LANCAMENTO L         ');
         SQL.Add('WHERE (P.PLNCODIGO = L.PLNCODIGO) AND ');
         SQL.Add('      (P.PEREXERCICIO =' +IntToStr(iExercicio)+ ') AND         ');
         SQL.Add('      (P.PERNUMERO = ' + IntToStr(iPerNumero)+ ') AND          ');
         SQL.Add('      (P.IDPESSOA =' + FloatToStr(iPessoa) + ') AND            ');
         SQL.Add('      (L.PLANO =' + FloatToStr(iPlano) + ')                    ');
      end;
      Result := _sql.Data;
   Finally
      _sql.Free;
   end;
end;

function TCtrlPosadasExpBalancete.ListaLancamentos(iPlano,
  iPessoa: Double; iPernumero, iExercicio: Integer;
  bCorresp: Boolean): OleVariant;
var _sql : TCMSqlParams;
begin
   _sql := TCMSqlParams.Create(nil);
   _sql.ControlObject := Self;
   Try
      with _sql do begin
         SQL.Clear;
         SQL.Add('SELECT  ');
         if bCorresp then
            SQL.Add('   C.PLACONCORRESP AS CONTA,     ')
         else
            SQL.Add('   C.PLACONTA AS CONTA,                       ');
         SQL.Add('   L.LACHIST1, P.PLNCODIGO, P.PLNDATDIA,         ');
         SQL.Add('   P.PLNPLANIL, T.TIPDESCRICAO, T.TIPCODIGO,     ');
         SQL.Add('   TO_CHAR(P.PLNDATDIA,''YYMMDD'') AS DATALANC, ');
         SQL.Add('   DECODE(L.LACDEBCRE,''D'', ''c'', ''a'') AS MOVDC,');
         SQL.Add('   DECODE(L.LACDEBCRE,''D'', LACVALOR,LACVALOR*-1) AS VALORLANC');
         SQL.Add('FROM PLANILHA P, LANCAMENTO L, PLANOCONTA C, TIPOPER T  ');
         SQL.Add('WHERE (P.PLNCODIGO = L.PLNCODIGO) AND ');
         SQL.Add('      (P.TIPCODIGO = T.TIPCODIGO(+)) AND ');
         SQL.Add('      (L.PLACONTA = C.PLACONTA) AND ');
         SQL.Add('      (L.PLANO = C.PLANO) AND ');
         SQL.Add('      (P.PEREXERCICIO =' +IntToStr(iExercicio)+ ') AND         ');
         SQL.Add('      (P.PERNUMERO = ' + IntToStr(iPerNumero)+ ') AND          ');
         SQL.Add('      (P.IDPESSOA =' + FloatToStr(iPessoa) + ') AND            ');
         SQL.Add('      (L.PLANO =' + FloatToStr(iPlano) + ')                    ');
         SQL.Add('ORDER BY PLNDATDIA, PLNPLANIL, PLNCODIGO ');
      end;
      Result := _sql.Data;
   Finally
      _sql.Free;
   end;
end;

end.

