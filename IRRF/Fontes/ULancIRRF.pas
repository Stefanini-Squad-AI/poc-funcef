unit ULancIRRF;

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, ComCtrls, ExtCtrls, MAHlpBtn, Buttons,
  ToolWin, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery,
  Wwdatsrc, DBCtrls;

type TLancIRRF = Class(TObject)

private

public

Procedure GravaIRRF(iCodDocumento,iEmpresaProp,iBenef:Double;sCodNatureza,
                    sDataLanc:String;rValBase,rValIRRF,rValINSS,rValPIS,rValRef,rPercIRRF:Real; qryInf:TwwQuery;
                     Var iCodLanc:Double; sContaContabil : String; iPlano : LongInt; sFlgFolha : String;
                     iIdPlanoPrev, iIdPatro, iIdPrograma : LongInt; var bPrimvez : Boolean; iIdModulo, iIdMotivo : LongInt; sCodCentroCusto : String;iIdVersaoFolha : LongInt; rValIOF : Real = 0);

Procedure GravaDarf(iCodDarf,iLancIRRF:Integer;sDataIni,sDataFim,sDataVenc,sFolha:String;qryCodigo:TwwQuery);

end;

var LancIRRF : TLancIRRF;

implementation

uses uMensErro,uDataBase, DBaseDados,uSistema,uFuncaoGeral;


Procedure TLancIRRF.GravaIRRF(iCodDocumento,iEmpresaProp,iBenef:Double;sCodNatureza,
                    sDataLanc:String;rValBase,rValIRRF,rValINSS,rValPIS,rValRef,rPercIRRF:Real;
                    qryInf:TwwQuery; Var iCodLanc:Double;
                    sContaContabil : String; iPlano : LongInt; sFlgFolha : String;
                    iIdPlanoPrev, iIdPatro, iIdPrograma : LongInt; var bPrimvez : Boolean; iIdModulo, iIdMotivo : LongInt; sCodCentroCusto : String;iIdVersaoFolha : LongInt; rValIOF : Real = 0);

var qry1,qry2:TwwQuery;
    sValInfSinal,sValInf,sNumDocChave,sValRef,sPercIRRF,sValIRRF,sValBase,sValINSS,sValPIS, sValIOF, sSql:String;
    bFez : Boolean;
    rFator : Double;
Begin
  qry1:=TwwQuery.Create(Application);
  qry1.DatabaseName := 'BASEDADOS';
  qry2:=TwwQuery.Create(Application);
  qry2.DatabaseName := 'BASEDADOS';
  try
     sValIRRF :=FuncaoGeral.OraNumero((rValIRRF));
     sValBase :=FuncaoGeral.OraNumero((rValBase));
     sValINSS :=FuncaoGeral.OraNumero((rValINSS));
     sValPIS  :=FuncaoGeral.OraNumero((rValPIS));
     sValIOF  :=FuncaoGeral.OraNumero((rValIOF));
     sValRef  :=FuncaoGeral.OraNumero((rValRef));
     sPercIRRF:=FuncaoGeral.OraNumero((rPercIRRF));
     //
     qry1.Close;
     qry1.SQL.Clear;
     qry1.SQL.text := 'SELECT NUMDOCUMENTO FROM '+Sistema.PrefixoServidor+'PESSOA WHERE IDPESSOA = '+ IntToStr(Sistema.idEmpresa);
     qry1.Open;
     sNumDocChave:=qry1.FieldByName('NUMDOCUMENTO').AsString;
     //
     if iCodDocumento <> 0 then begin
        qry1.Close;
        qry1.SQL.Clear;
        qry1.SQL.text := 'SELECT CODDOCUMENTO FROM LANCIRRF WHERE CODDOCUMENTO = '+FloattoStr(iCodDocumento);
        qry1.Open;
        //
        bFez := False;
        If (qry1.IsEmpty) or (not bPrimvez) then begin
           if (iCodLanc <> 0) then begin
              bFez := True;
              with qry1 do begin
                 Close;
                 sSql :=       'UPDATE LANCIRRF ';
                 sSql :=sSql + 'SET CODDOCUMENTO =    '+FloattoStr(iCodDocumento);
                 sSql :=sSql + '    ,IDPESSOA =       '+FloatToStr(iEmpresaProp);
                 sSql :=sSql + '    ,IDBENEFIRRF =    '+FloatToStr(iBenef);
                 sSql :=sSql + '    ,CODNATUREZA =    '''+sCodNatureza+'''';
                 sSql :=sSql + '    ,DATALANCAMENTO = TO_DATE('''+sDataLanc+''',''dd/mm/yyyy'')';
                 sSql :=sSql + '    ,VLRBASE =        '+sValBase;
                 sSql :=sSql + '    ,VLRIRRF =        '+sValIRRF;
                 sSql :=sSql + '    ,VLRINSS =        '+sValINSS;
                 sSql :=sSql + '    ,VLRPIS  =        '+sValPIS;
                 sSql :=sSql + '    ,VLRIOF  =        '+sValIOF;
                 sSql :=sSql + '    ,NUMDOCUMENTO =   '''+sNumDocChave+'''';
                 sSql :=sSql + '    ,VLRREFERENCIA =  '+sValRef;
                 sSql :=sSql + '    ,PERCIRRF =       '+sPercIRRF;
                 sSql :=sSql + '    ,FLGDARF  =  ''N''';
                 if (iPlano <= 0) or (sContaContabil = '') then begin
                    sSql :=sSql + '    ,PLACONTA =  NULL ';
                    sSql :=sSql + '    ,PLANO = NULL  ';
                 end else begin
                    sSql :=sSql + '    ,PLACONTA = '''+sContaContabil+'''';
                    sSql :=sSql + '    ,PLANO =    '+IntToStr(iPlano);
                 end;
                 if Sistema.UsaPlanoPatro then begin
                    sSql :=sSql + '    ,IDPLANOPREV =    '+IntToStr(iIdPlanoPrev);
                    sSql :=sSql + '    ,IDPATRO =        '+IntToStr(iIdPatro);
                    if iIdPrograma > 0 then begin
                       sSql :=sSql + '    ,IDPROGRAMA =     '+IntToStr(iIdPrograma);
                    end else begin
                       sSql :=sSql + '    ,IDPROGRAMA =  NULL ';
                    end;
                    if trim(sCodCentroCusto) <> '' then begin
                       sSql :=sSql + '    ,CODCENTROCUSTO = '''+sCodCentroCusto+'''';
                       sSql :=sSql + '    ,IDEMPRESA =     '+IntToStr(Sistema.idEmpresa);
                    end else begin
                       sSql :=sSql + '    ,CODCENTROCUSTO = NULL';
                       sSql :=sSql + '    ,IDEMPRESA = NULL     ';
                    end;
                 end else begin
                    sSql :=sSql + '    ,IDPLANOPREV =  NULL ';
                    sSql :=sSql + '    ,IDPATRO =  NULL ';
                    sSql :=sSql + '    ,IDPROGRAMA =  NULL ';
                    sSql :=sSql + '    ,CODCENTROCUSTO = NULL';
                    sSql :=sSql + '    ,IDEMPRESA = NULL     ';
                 end;
                 sSql :=sSql + '    ,FLGFOLHA =       '''+sFlgFolha+'''';
                 sSql :=sSql + '    ,IDMODULO =       '+IntToStr(iIdModulo);
                 if iIdMotivo > 0 then
                    sSql :=sSql + '    ,IDMOTIVO =       '+IntToStr(iIdMotivo)
                 else
                    sSql :=sSql + '    ,IDMOTIVO = NULL  ';
                 if iIdVersaoFolha > 0 then
                    sSql :=sSql + '    ,IDHSTFOLHABENEF  =       '+IntToStr(iIdVersaoFolha)
                 else
                    sSql :=sSql + '    ,IDHSTFOLHABENEF  = NULL  ';
                 sSql :=sSql + ' WHERE (IDLANCIRRF = '+FloatToStr(iCodLanc)+')';
                 Sql.Clear;
                 Sql.Add(sSql);
                 ExecSQL;
              end;
           end else begin
              bFez := True;
              iCodLanc := LeUltRegistro(nil,'LANCIRRF');
              with qry1 do begin
                 Close;
                 sSql :='INSERT INTO LANCIRRF(IDLANCIRRF,CODDOCUMENTO,IDPESSOA,'+
                        'IDBENEFIRRF,CODNATUREZA,DATALANCAMENTO,VLRBASE,VLRIRRF,'+
                        'VLRINSS,VLRPIS,NUMDOCUMENTO,VLRREFERENCIA,PERCIRRF,PLACONTA,PLANO,'+
                        'IDPLANOPREV,IDPATRO,IDPROGRAMA,CODCENTROCUSTO,IDEMPRESA,FLGFOLHA,IDMODULO,FLGDARF,IDMOTIVO,IDHSTFOLHABENEF, VLRIOF) VALUES(';
                 sSql :=sSql+FloatToStr(iCodLanc)+','+FloattoStr(iCodDocumento)+','+FloatToStr(iEmpresaProp)+',';
                 sSql :=sSql+FloatToStr(iBenef)+','''+sCodNatureza+''',';
                 sSql :=sSql+'TO_DATE('''+sDataLanc+''',''dd/mm/yyyy''),';
                 sSql :=sSql+sValBase+','+sValIRRF+','+sValINSS+','+sValPIS+',';
                 sSql :=sSql+''''+sNumDocChave+''','+sValRef+','+sPercIRRF+',';
                 if (iPlano <= 0) or (sContaContabil = '') then begin
                    sSql :=sSql+' NULL, NULL,';
                 end else begin
                    sSql :=sSql+''''+sContaContabil+''','+IntToStr(iPlano)+',';
                 end;
                 if Sistema.UsaPlanoPatro then begin
                    sSql :=sSql+IntToStr(iIdPlanoPrev)+','+IntToStr(iIdPatro)+',';
                    if iIdPrograma > 0 then begin
                       sSql :=sSql+IntToStr(iIdPrograma)+',';
                    end else begin
                       sSql :=sSql+' NULL,';
                    end;
                    if trim(sCodCentroCusto) <> '' then begin
                       sSql :=sSql + ''''+sCodCentroCusto+''',';
                       sSql :=sSql +IntToStr(Sistema.idEmpresa)+',';
                    end else begin
                       sSql :=sSql + 'NULL, ';
                       sSql :=sSql + 'NULL, ';
                    end;
                 end else begin
                    sSql:=sSql+' NULL, NULL, NULL, NULL, NULL, ';
                 end;
                 sSql := sSql + ''''+sFlgFolha+''','+IntToStr(iIdModulo)+',''N'''+',';
                 if iIdMotivo > 0 then
                    sSql := sSql + IntToStr(iIdMotivo)+','
                 else
                    sSql := sSql + 'NULL,';
                 if iIdVersaoFolha > 0 then
                    sSql := sSql + IntToStr(iIdVersaoFolha)+','
                 else
                    sSql := sSql + 'NULL,';

                 if rValIOF = 0 then
                    sSql := sSql + 'NULL)'
                 else
                    sSql := sSql +  sValIOF+')';

                 Sql.Clear;
                 Sql.Add(sSql);
                 ExecSQL;
              end;
           end;
        end else begin
           if (iCodLanc <> 0) then begin
              bFez := True;
              with qry1 do begin
                 Close;
                 sSql :=       'UPDATE LANCIRRF ';
                 sSql :=sSql + 'SET CODDOCUMENTO =    '+FloattoStr(iCodDocumento);
                 sSql :=sSql + '    ,IDPESSOA =       '+FloatToStr(iEmpresaProp);
                 sSql :=sSql + '    ,IDBENEFIRRF =    '+FloatToStr(iBenef);
                 sSql :=sSql + '    ,CODNATUREZA =    '''+sCodNatureza+'''';
                 sSql :=sSql + '    ,DATALANCAMENTO = TO_DATE('''+sDataLanc+''',''dd/mm/yyyy'')';
                 sSql :=sSql + '    ,VLRBASE =        '+sValBase;
                 sSql :=sSql + '    ,VLRIRRF =        '+sValIRRF;
                 sSql :=sSql + '    ,VLRINSS =        '+sValINSS;
                 sSql :=sSql + '    ,VLRPIS  =        '+sValPIS;
                 sSql :=sSql + '    ,VLRIOF  =        '+sValIOF;
                 sSql :=sSql + '    ,NUMDOCUMENTO =   '''+sNumDocChave+'''';
                 sSql :=sSql + '    ,VLRREFERENCIA =  '+sValRef;
                 sSql :=sSql + '    ,PERCIRRF =       '+sPercIRRF;
                 sSql :=sSql + '    ,FLGDARF  =  ''N''';
                 if (iPlano <= 0) or (sContaContabil = '') then begin
                    sSql :=sSql + '    ,PLACONTA =  NULL ';
                    sSql :=sSql + '    ,PLANO = NULL  ';
                 end else begin
                    sSql :=sSql + '    ,PLACONTA = '''+sContaContabil+'''';
                    sSql :=sSql + '    ,PLANO =    '+IntToStr(iPlano);
                 end;
                 if Sistema.UsaPlanoPatro then begin
                    sSql :=sSql + '    ,IDPLANOPREV =    '+IntToStr(iIdPlanoPrev);
                    sSql :=sSql + '    ,IDPATRO =        '+IntToStr(iIdPatro);
                    if iIdPrograma > 0 then begin
                       sSql :=sSql + '    ,IDPROGRAMA =     '+IntToStr(iIdPrograma);
                    end else begin
                       sSql :=sSql + '    ,IDPROGRAMA =  NULL ';
                    end;
                    if trim(sCodCentroCusto) <> '' then begin
                       sSql :=sSql + '    ,CODCENTROCUSTO = '''+sCodCentroCusto+'''';
                       sSql :=sSql + '    ,IDEMPRESA =     '+IntToStr(Sistema.idEmpresa);
                    end else begin
                       sSql :=sSql + '    ,CODCENTROCUSTO = NULL';
                       sSql :=sSql + '    ,IDEMPRESA = NULL     ';
                    end;
                 end else begin
                    sSql :=sSql + '    ,IDPLANOPREV =  NULL ';
                    sSql :=sSql + '    ,IDPATRO =  NULL ';
                    sSql :=sSql + '    ,IDPROGRAMA =  NULL ';
                    sSql :=sSql + '    ,CODCENTROCUSTO = NULL';
                    sSql :=sSql + '    ,IDEMPRESA = NULL     ';
                 end;
                 sSql :=sSql + '    ,FLGFOLHA =       '''+sFlgFolha+'''';
                 sSql :=sSql + '    ,IDMODULO =       '+IntToStr(iIdModulo);
                 if iIdMotivo > 0 then
                    sSql :=sSql + '    ,IDMOTIVO =       '+IntToStr(iIdMotivo)
                 else
                    sSql :=sSql + '    ,IDMOTIVO = NULL  ';
                 if iIdVersaoFolha > 0 then
                    sSql :=sSql + '    ,IDHSTFOLHABENEF  = '+IntToStr(iIdVersaoFolha)
                 else
                    sSql :=sSql + '    ,IDHSTFOLHABENEF  = NULL';
                 sSql :=sSql + ' WHERE (IDLANCIRRF = '+FloatToStr(iCodLanc)+')';
                 Sql.Clear;
                 Sql.Add(sSql);
                 ExecSQL;
              end;
           end;
        end;
        if not bFez and bPrimvez then
           bPrimvez := true
        else
           bPrimvez := false;
     end else begin
        if (iCodLanc <> 0) then begin
           with qry1 do begin
              Close;
              sSql :=       'UPDATE LANCIRRF ';
              sSql :=sSql + 'SET CODDOCUMENTO = NULL  ';
              sSql :=sSql + '    ,IDPESSOA =       '+FloatToStr(iEmpresaProp);
              sSql :=sSql + '    ,IDBENEFIRRF =    '+FloatToStr(iBenef);
              sSql :=sSql + '    ,CODNATUREZA =    '''+sCodNatureza+'''';
              sSql :=sSql + '    ,DATALANCAMENTO = TO_DATE('''+sDataLanc+''',''dd/mm/yyyy'')';
              sSql :=sSql + '    ,VLRBASE =        '+sValBase;
              sSql :=sSql + '    ,VLRIRRF =        '+sValIRRF;
              sSql :=sSql + '    ,VLRINSS =        '+sValINSS;
              sSql :=sSql + '    ,VLRPIS  =        '+sValPIS;
              sSql :=sSql + '    ,VLRIOF  =        '+sValIOF;
              sSql :=sSql + '    ,NUMDOCUMENTO =   '''+sNumDocChave+'''';
              sSql :=sSql + '    ,VLRREFERENCIA =  '+sValRef;
              sSql :=sSql + '    ,PERCIRRF =       '+sPercIRRF;
              sSql :=sSql + '    ,FLGDARF  =  ''N''';
              if (iPlano <= 0) or (sContaContabil = '') then begin
                 sSql :=sSql + '    ,PLACONTA =  NULL ';
                 sSql :=sSql + '    ,PLANO = NULL  ';
              end else begin
                 sSql :=sSql + '    ,PLACONTA = '''+sContaContabil+'''';
                 sSql :=sSql + '    ,PLANO =    '+IntToStr(iPlano);
              end;
              if Sistema.UsaPlanoPatro then begin
                 sSql :=sSql + '    ,IDPLANOPREV =    '+IntToStr(iIdPlanoPrev);
                 sSql :=sSql + '    ,IDPATRO =        '+IntToStr(iIdPatro);
                 if iIdPrograma > 0 then begin
                    sSql :=sSql + '    ,IDPROGRAMA =     '+IntToStr(iIdPrograma);
                 end else begin
                    sSql :=sSql + '    ,IDPROGRAMA =  NULL ';
                 end;
                 if trim(sCodCentroCusto) <> '' then begin
                    sSql :=sSql + '    ,CODCENTROCUSTO = '''+sCodCentroCusto+'''';
                    sSql :=sSql + '    ,IDEMPRESA =     '+IntToStr(Sistema.idEmpresa);
                 end else begin
                    sSql :=sSql + '    ,CODCENTROCUSTO = NULL';
                    sSql :=sSql + '    ,IDEMPRESA = NULL     ';
                 end;
              end else begin
                 sSql :=sSql + '    ,IDPLANOPREV =  NULL ';
                 sSql :=sSql + '    ,IDPATRO =  NULL ';
                 sSql :=sSql + '    ,IDPROGRAMA =  NULL ';
                 sSql :=sSql + '    ,CODCENTROCUSTO = NULL';
                 sSql :=sSql + '    ,IDEMPRESA = NULL     ';
              end;
              sSql :=sSql + '    ,FLGFOLHA =       '''+sFlgFolha+'''';
              sSql :=sSql + '    ,IDMODULO =       '+IntToStr(iIdModulo);
              if iIdMotivo > 0 then
                 sSql :=sSql + '    ,IDMOTIVO =       '+IntToStr(iIdMotivo)
              else
                 sSql :=sSql + '    ,IDMOTIVO = NULL';
              if iIdVersaoFolha > 0 then
                 sSql :=sSql + '    ,IDHSTFOLHABENEF  = '+IntToStr(iIdVersaoFolha)
              else
                 sSql :=sSql + '    ,IDHSTFOLHABENEF  = NULL ';
              sSql :=sSql + ' WHERE (IDLANCIRRF = '+FloatToStr(iCodLanc)+')';
              Sql.Clear;
              Sql.Add(sSql);
              ExecSQL;
           end;
        end else begin
           iCodLanc := LeUltRegistro(nil,'LANCIRRF');
           with qry1 do begin
              Close;
              sSql :='INSERT INTO LANCIRRF(IDLANCIRRF,IDPESSOA,'+
                     'IDBENEFIRRF,CODNATUREZA,DATALANCAMENTO,VLRBASE,VLRIRRF,'+
                     'VLRINSS,VLRPIS,NUMDOCUMENTO,VLRREFERENCIA,PERCIRRF,PLACONTA,PLANO,'+
                     'IDPLANOPREV,IDPATRO,IDPROGRAMA,CODCENTROCUSTO,IDEMPRESA,FLGFOLHA,IDMODULO,FLGDARF,IDMOTIVO,IDHSTFOLHABENEF, VLRIOF) VALUES(';
              sSql :=sSql+FloattoStr(iCodLanc)+','+FloatToStr(iEmpresaProp)+',';
              sSql :=sSql+FloatToStr(iBenef)+','''+sCodNatureza+''',';
              sSql :=sSql+'TO_DATE('''+sDataLanc+''',''dd/mm/yyyy''),';
              sSql :=sSql+sValBase+','+sValIRRF+','+sValINSS+','+sValPIS+',';
              sSql :=sSql+''''+sNumDocChave+''','+sValRef+','+sPercIRRF+',';
              if (iPlano <= 0) or (sContaContabil = '') then begin
                 sSql :=sSql+' NULL, NULL,';
              end else begin
                 sSql :=sSql+''''+sContaContabil+''','+IntToStr(iPlano)+',';
              end;
              if Sistema.UsaPlanoPatro then begin
                 sSql :=sSql+IntToStr(iIdPlanoPrev)+','+IntToStr(iIdPatro)+',';
                 if iIdPrograma > 0 then begin
                    sSql :=sSql+IntToStr(iIdPrograma)+',';
                 end else begin
                    sSql :=sSql+' NULL,';
                 end;
                 if trim(sCodCentroCusto) <> '' then begin
                    sSql :=sSql + ''''+sCodCentroCusto+''',';
                    sSql :=sSql +IntToStr(Sistema.idEmpresa)+',';
                 end else begin
                    sSql :=sSql + 'NULL, ';
                    sSql :=sSql + 'NULL, ';
                 end;
              end else begin
                 sSql:=sSql+' NULL, NULL, NULL, NULL, NULL, ';
              end;
              sSql := sSql + ''''+sFlgFolha+''','+IntToStr(iIdModulo)+',''N'''+',';
              if iIdMotivo > 0 then
                 sSql := sSql + IntToStr(iIdMotivo)+','
              else
                 sSql := sSql + 'NULL,';
              if iIdVersaoFolha > 0 then
                 sSql := sSql + IntToStr(iIdVersaoFolha)+','
              else
                 sSql := sSql + 'NULL,';

              if rValIOF = 0 then
                 sSql := sSql + 'NULL)'
              else
                 sSql := sSql +  sValIOF+')';

              Sql.Clear;
              Sql.Add(sSql);
              ExecSQL;
           end;
        end;
     end;
     if iCodLanc > 0 then begin
        if qryInf.IsEmpty then begin
           if rValBase <> 0 then begin
              //
              qry2.Close;
              qry2.SQL.Text:='SELECT IDINFORME, CODINFORME FROM INFORME WHERE FLGBASE = ''S'' ORDER BY CODINFORME';
              qry2.Open;
              //
              sSql :='INSERT INTO LANCXINFORME(IDLANCIRRF,IDINFORME,'+
                     'VLRLANC) VALUES(';
              sSql :=sSql+FloattoStr(iCodLanc)+','+IntToStr(qry2.FieldByName('IDINFORME').AsInteger)+',';
              sSql :=sSql+sValBase+')';
              //
              ExecutarQuery(qry1,sSql);
              if qry1.RowsAffected = 0 then begin
                 sSql :='UPDATE LANCXINFORME SET VLRLANC = VLRLANC + '+sValBase+' WHERE '+
                        ' (IDLANCIRRF = '+FloattoStr(iCodLanc)+') AND '+
                        ' (IDINFORME  = '+IntToStr(qry2.FieldByName('IDINFORME').AsInteger)+')';
                 with qry1 do begin
                    Close;
                    Sql.Clear;
                    Sql.Add(sSql);
                    ExecSQL;
                 end;
              end;
           end;
           if rValIRRF <> 0 then begin
              //
              qry2.Close;
              qry2.SQL.Text:='SELECT IDINFORME FROM INFORME WHERE FLGIRRF = ''S'' ';
              qry2.Open;
              //
              sSql :='INSERT INTO LANCXINFORME(IDLANCIRRF,IDINFORME,'+
                     'PERCLANC,VLRLANC) VALUES(';
              sSql :=sSql+FloattoStr(iCodLanc)+','+IntToStr(qry2.FieldByName('IDINFORME').AsInteger)+',';
              sSql :=sSql+sPercIRRF+',';
              sSql :=sSql+sValIRRF+')';
              ExecutarQuery(qry1,sSql);
              if qry1.RowsAffected = 0 then begin
                 sSql :='UPDATE LANCXINFORME SET VLRLANC = VLRLANC + '+sValIRRF+' WHERE '+
                        ' (IDLANCIRRF = '+FloattoStr(iCodLanc)+') AND '+
                        ' (IDINFORME  = '+IntToStr(qry2.FieldByName('IDINFORME').AsInteger)+')';
                 with qry1 do begin
                    Close;
                    Sql.Clear;
                    Sql.Add(sSql);
                    ExecSQL;
                 end;
              end;
           end;
           //
           if rValINSS <> 0 then begin
              qry2.Close;
              qry2.SQL.Text:='SELECT IDINFORME FROM INFORME WHERE CODDIRF = 4 ';
              qry2.Open;
              //
              sSql :='INSERT INTO LANCXINFORME(IDLANCIRRF,IDINFORME,'+
                     'VLRLANC) VALUES(';
              sSql :=sSql+FloattoStr(iCodLanc)+','+IntToStr(qry2.FieldByName('IDINFORME').AsInteger)+',';
              sSql :=sSql+sValINSS+')';
              ExecutarQuery(qry1,sSql);
              if qry1.RowsAffected = 0 then begin
                 sSql :='UPDATE LANCXINFORME SET VLRLANC = VLRLANC + '+sValINSS+' WHERE '+
                        ' (IDLANCIRRF = '+FloattoStr(iCodLanc)+') AND '+
                        ' (IDINFORME  = '+IntToStr(qry2.FieldByName('IDINFORME').AsInteger)+')';
                 with qry1 do begin
                    Close;
                    Sql.Clear;
                    Sql.Add(sSql);
                    ExecSQL;
                 end;
              end;
           end;
        end else begin
           qryInf.First;
           While not qryInf.EOF do begin
              qry2.Close;
              qry2.SQL.Text:='SELECT FLGNATUREZA,CODDIRF FROM INFORME WHERE IDINFORME = '+IntToStr(qryInf.FieldByName('IDINFORME').AsInteger);
              qry2.Open;
              if qry2.FieldByName('FLGNATUREZA').isNull then begin
                 if qry2.FieldByName('CODDIRF').AsInteger in [1,2,5] then
                    rFator := 1
                 else
                    rFator := -1;
              end else begin
                 if qry2.FieldByName('FLGNATUREZA').AsString = 'P' then
                    rFator := 1
                 else
                    rFator := -1;
              end;
              sValInf     :=FuncaoGeral.OraNumero(qryInf.FieldByName('VLRLANC').AsFloat);
              sValInfSinal:=FuncaoGeral.OraNumero(qryInf.FieldByName('VLRLANCSINAL').AsFloat*rFator);
              sSql :='INSERT INTO LANCXINFORME(IDLANCIRRF,IDINFORME,'+
                     'VLRLANC) VALUES(';
              sSql :=sSql+FloattoStr(iCodLanc)+','+IntToStr(qryInf.FieldByName('IDINFORME').AsInteger)+',';
              sSql :=sSql+sValInfSinal+')';
              ExecutarQuery(qry1,sSql);
              if qry1.RowsAffected = 0 then begin
                 sSql :='UPDATE LANCXINFORME SET VLRLANC = VLRLANC + '+sValInfSinal+' WHERE '+
                        ' (IDLANCIRRF = '+FloattoStr(iCodLanc)+') AND '+
                        ' (IDINFORME  = '+IntToStr(qryInf.FieldByName('IDINFORME').AsInteger)+')';
                 with qry1 do begin
                    Close;
                    Sql.Clear;
                    Sql.Add(sSql);
                    ExecSQL;
                 end;
              end;
              qryInf.Next;
           end;
        end;
     end;
     //
  Finally
     qry1.Close;
     qry1.Free;
     qry2.Close;
     qry2.Free;
  end;
end;

Procedure TLancIRRF.GravaDarf(iCodDarf,iLancIRRF:Integer;sDataIni,sDataFim,sDataVenc,sFolha:String;qryCodigo:TwwQuery);
var qry3,qry2,qry1:TwwQuery;
    sValTotal,sNumDocumento,sPercIRRF,sValIRRF,sValBase,sSql:String;
    rValIRRFx, rValBasex, rPercIRRFx, rValTotalx : Double;
Begin
  qry1:=TwwQuery.Create(Application);
  qry2:=TwwQuery.Create(Application);
  qry3:=TwwQuery.Create(Application);
  qry1.DatabaseName := 'BASEDADOS';
  qry2.DatabaseName := 'BASEDADOS';
  qry3.DatabaseName := 'BASEDADOS';
  //
  qry1.Close;
  qry1.SQL.Clear;
  qry1.SQL.text := 'SELECT NUMDOCUMENTO FROM '+Sistema.PrefixoServidor+'PESSOA WHERE IDPESSOA = '+ IntToStr(Sistema.idEmpresa);
  qry1.Open;
  sNumDocumento:=qry1.FieldByName('NUMDOCUMENTO').AsString;
  //
  if sFolha = 'S' then begin
     rValIRRFx := 0;
     rValBasex := 0;
     rPercIRRFx:= 0;
     rValTotalx:= 0;
     qryCodigo.First;
     while not qryCodigo.EOF do begin
        if iLancIRRF = qryCodigo.FieldByName('IDLANCREF').AsInteger then begin
           qry1.Close;
           qry1.SQL.Clear;
           qry1.SQL.text := 'SELECT * FROM '+Sistema.PrefixoServidor+'LANCIRRF WHERE IDLANCIRRF = '+InttoStr(qryCodigo.FieldByName('IDLANCIRRF').AsInteger);
           qry1.Open;
           //
           if (qry1.FieldByName('VLRPIS').AsFloat = 0) or (qry1.FieldByName('VLRPIS').isNull) then
              if (qry1.FieldByName('VLRIOF').AsFloat = 0) or (qry1.FieldByName('VLRIOF').isNull) then
                 rValIRRFx := rValIRRFx + qry1.FieldByName('VLRIRRF').AsFloat
              else
                 rValIRRFx := rValIRRFx + qry1.FieldByName('VLRIOF').AsFloat
           else
              rValIRRFx := rValIRRFx + qry1.FieldByName('VLRPIS').AsFloat;

           rValBasex := rValBasex + qry1.FieldByName('VLRBASE').AsFloat;
           rPercIRRFx:= qry1.FieldByName('PERCIRRF').AsFloat;
           if (qry1.FieldByName('VLRPIS').AsFloat = 0) or (qry1.FieldByName('VLRPIS').isNull) then
              if (qry1.FieldByName('VLRIOF').AsFloat = 0) or (qry1.FieldByName('VLRIOF').isNull) then
                 rValTotalx := rValTotalx + qry1.FieldByName('VLRIRRF').AsFloat
              else
                 rValTotalx := rValTotalx + qry1.FieldByName('VLRIOF').AsFloat
           else
              rValTotalx := rValTotalx + qry1.FieldByName('VLRPIS').AsFloat;
        end;
        qryCodigo.Next;
     end;
     sValIRRF :=FuncaoGeral.OraNumero(rValIRRFx);
     sValBase :=FuncaoGeral.OraNumero(rValBasex);
     sPercIRRF:=FuncaoGeral.OraNumero(rPercIRRFx);
     sValTotal:=FuncaoGeral.OraNumero(rValTotalx);
  end else begin
     qry1.Close;
     qry1.SQL.Clear;
     qry1.SQL.text := 'SELECT * FROM '+Sistema.PrefixoServidor+'LANCIRRF WHERE IDLANCIRRF = '+InttoStr(iLancIRRF);
     qry1.Open;
     //
     if (qry1.FieldByName('VLRPIS').AsFloat = 0) or (qry1.FieldByName('VLRPIS').isNull) then
        if (qry1.FieldByName('VLRIOF').AsFloat = 0) or (qry1.FieldByName('VLRIOF').isNull) then
           sValIRRF :=FuncaoGeral.OraNumero((qry1.FieldByName('VLRIRRF').AsFloat))
        else
           sValIRRF :=FuncaoGeral.OraNumero((qry1.FieldByName('VLRIOF').AsFloat))
     else
        sValIRRF :=FuncaoGeral.OraNumero((qry1.FieldByName('VLRPIS').AsFloat));
     sValBase :=FuncaoGeral.OraNumero((qry1.FieldByName('VLRBASE').AsFloat));
     sPercIRRF:=FuncaoGeral.OraNumero((qry1.FieldByName('PERCIRRF').AsFloat));
     if (qry1.FieldByName('VLRPIS').AsFloat = 0) or (qry1.FieldByName('VLRPIS').isNull) then
        if (qry1.FieldByName('VLRIOF').AsFloat = 0) or (qry1.FieldByName('VLRIOF').isNull) then
           sValTotal :=FuncaoGeral.OraNumero((qry1.FieldByName('VLRIRRF').AsFloat))
        else
           sValTotal :=FuncaoGeral.OraNumero((qry1.FieldByName('VLRIOF').AsFloat))
     else
        sValTotal :=FuncaoGeral.OraNumero((qry1.FieldByName('VLRPIS').AsFloat));
     //
  end;
  //
  qry2.Close;
  qry2.SQL.Clear;
  qry2.SQL.text := 'SELECT IDDARF,VLRIRRF,VLRTOTAL,VLRBASECALCULO '+
                   'FROM '+Sistema.PrefixoServidor+'DARF WHERE IDDARF = '+IntToStr(iCodDarf);
  qry2.Open;
  //
  if qry2.IsEmpty then
  Begin
     with qry3 do
     begin
        Close;
        sSql :='INSERT INTO DARF(IDDARF,IDPESSOA,CODNATUREZA,NUMDOCUMENTO,'+
               'DATAINIAPURACAO,DATAFINALAPURACAO,DATAVENCDARF,DATAEMISDARF,VLRBASECALCULO,'+
               'PERCIRRF,VLRIRRF,VLRTOTAL) VALUES(';
        sSql :=sSql+InttoStr(iCodDarf)+','+IntToStr(Sistema.IdEmpresa);
        sSql :=sSql+','''+qry1.FieldByName('CODNATUREZA').AsString+''','''+sNumDocumento+''',';
        sSql :=sSql+'TO_DATE('''+sDataIni+''',''dd/mm/yyyy''),';
        sSql :=sSql+'TO_DATE('''+sDataFim+''',''dd/mm/yyyy''),';
        sSql :=sSql+'TO_DATE('''+sDataVenc+''',''dd/mm/yyyy''),';
        sSql :=sSql+'TO_DATE('''+sDataFim+''',''dd/mm/yyyy''),';
        sSql :=sSql+sValBase+','+sPercIRRF+','+sValIRRF+','+sValTotal+')';
        Sql.Clear;
        Sql.Add(sSql);
        ExecSQL;
     end;
  end
  else
  Begin
     //
     with qry3 do
     begin
        Close;
        sSql :='UPDATE DARF SET VLRIRRF = VLRIRRF + '+sValIRRF+', VLRBASECALCULO = VLRBASECALCULO + '+sValBase;
        sSql :=sSql+', VLRTOTAL = VLRTOTAL + '+sValTotal+' WHERE IDDARF = '+IntToStr(iCodDarf);
        Sql.Clear;
        Sql.Add(sSql);
        ExecSQL;
     end;
  end;
  //
  if sFolha = 'S' then begin
     qryCodigo.First;
     while not qryCodigo.EOF do begin
        if iLancIRRF = qryCodigo.FieldByName('IDLANCREF').AsInteger then begin
           with qry3 do begin
              Close;
              sSql :='UPDATE LANCIRRF SET FLGDARF = ''S'', IDDARF = '+IntToStr(iCodDarf)+' WHERE IDLANCIRRF = '+IntToStr(qryCodigo.FieldByName('IDLANCIRRF').AsInteger);
              Sql.Clear;
              Sql.Add(sSql);
              ExecSQL;
           end;
        end;
        qryCodigo.Next;
     end;
  end else begin
     with qry3 do begin
        Close;
        sSql :='UPDATE LANCIRRF SET FLGDARF = ''S'', IDDARF = '+IntToStr(iCodDarf)+' WHERE IDLANCIRRF = '+IntToStr(iLancIRRF);
        Sql.Clear;
        Sql.Add(sSql);
        ExecSQL;
     end;
  end;
  //
  qry1.Free;
  qry2.Free;
  qry3.Free;
end;

end.
