unit rDemisSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBTables, 
  uCmSqlParams, DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe,
  ppDBBDE, ppBands, ppClass, ppCtrls, ppVar, ppMemo, ppStrtch, ppRegion,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, uCtrlParamIntegra,
  uCtrlParamCap, TXRB;

type
  TRptDemisSint = class(TFrmCmReport)
    Rptdemsintgest: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel47: TppLabel;
    ppLine24: TppLine;
    ppLabel48: TppLabel;
    rptdemsintgestRegion1: TppRegion;
    rptdemsintgestMemo1: TppMemo;
    ppDetailBand13: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText17: TppDBText;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    rptdemsintgestLine2: TppLine;
    rptdemsintgestLine1: TppLine;
    ppFooterBand9: TppFooterBand;
    ppLine26: TppLine;
    ppLabel78: TppLabel;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    rptdemsintgestShape3: TppShape;
    ppLabel79: TppLabel;
    ppDBCalc3: TppDBCalc;
    rptdemsintgestDBCalc3: TppDBCalc;
    rptdemsintgestGroup1: TppGroup;
    rptdemsintgestGroupHeaderBand1: TppGroupHeaderBand;
    rptdemsintgestShape1: TppShape;
    rptdemsintgestDBText1: TppDBText;
    rptdemsintgestLabel2: TppLabel;
    rptdemsintgestLabel3: TppLabel;
    rptdemsintgestGroupFooterBand1: TppGroupFooterBand;
    rptdemsintgestShape2: TppShape;
    rptdemsintgestDBCalc1: TppDBCalc;
    rptdemsintgestDBCalc2: TppDBCalc;
    rptdemsintgestLabel4: TppLabel;
    PpDemsintgest: TppBDEPipeline;
    Dsdemsintgest: TwwDataSource;
    CdsAuxDemSintGest: TCMClientDataSet;
    SqlAuxDemSintGest: TCMSqlParams;
    CdsDemSintGest: TCMClientDataSet;
    SqlDemSintGest: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    function UltDiaMes(FDate: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

var
  RptDemisSint: TRptDemisSint;

implementation

uses dbasedados;

{$R *.DFM}

procedure TRptDemisSint.CrmRptCMBeforePrint(Sender: TObject);
var
  dDataFin: TdateTime;
  sCampodata, sDescData, sStatus, descricao, quebra: string;
begin
  inherited;

  case StrToInt(CmpRptCM.ParamValues[2].AsString) of
    0:
      begin
        sCampodata := 'TRGDTINCLUSAO ';
        sDescData := ' - Data de Inclusão ';
      end;
    1:
      begin
        sCampodata := 'DATAEMISSAO ';
        sDescData := ' - Data de Emissão ';
      end;
    2:
      begin
        sCampodata := 'DATAPROGRAMADA ';
        sDescData := ' - Data Programada ';
      end;
  end;

  case StrToInt(CmpRptCM.ParamValues[3].AsString) of
    0: sStatus := '0';
    1: sStatus := '2';
    2: sStatus := '';
  end;

  rptdemsintgestMemo1.Lines.Clear;

  if not CmpRptCM.ParamValues[7].IsNull then
  begin
    rptdemsintgestMemo1.lines.add('Centro(s) de Responsabilidade selecionado(s): ' + CmpRptCM.ParamValues[7].AsString);
    rptdemsintgestMemo1.lines.add('');
  end;

  if ParamIntegra.RecPag = 'P' then
  begin
    ppLabel47.caption := 'Demonstrativo Sintético de Gestão  no período: ' +
      CmpRptCM.ParamValues[5].AsString + ' - ' + CmpRptCM.ParamValues[6].AsString + ' (Contas a Pagar) ';
    rptdemsintgestMemo1.lines.add('Despesas/Pagamentos');
  end
  else
  begin
    ppLabel47.caption := 'Demonstrativo Sintético de Gestão no período: ' + CmpRptCM.ParamValues[5].AsString + ' - ' +
      CmpRptCM.ParamValues[6].AsString + ' (Contas a Receber) ';
    rptdemsintgestMemo1.lines.add('Receitas/Recebimentos');
  end;

  rptdemsintgestMemo1.lines.add('');

  if sStatus <> '' then
    rptdemsintgestMemo1.lines.add(' Listagem de Documentos ' + CmpRptCM.ParamValues[8].AsString);

  with SqlDemSintGest do
  begin
    SQL.Clear;
    SQL.Add('SELECT TMP.CODTIPRECDES, ( SELECT DESCRICAO FROM TIPORECEBDESEMB T WHERE ROWNUM = 1 AND  T.CODTIPRECDES = TMP.CODTIPRECDES) AS DESCRICAO,SUM(VALORATU) AS VALORATU,       ');
    SQL.Add('    SUM(VALORANT) AS VALORANT,TMP.ANASINT                               ');
    SQL.Add('FROM                                                                           ');
    SQL.Add('  (SELECT                                                                      ');
    SQL.Add('      NVL(T.CODTIPRECDESNOVO,T.CODTIPRECDES) CODTIPRECDES, (0) AS VALORATU, (0) AS VALORANT,           ');
    SQL.Add('      T.ANASINT                                                                ');
    SQL.Add('   FROM                                                                        ');
    SQL.Add('      TIPORECEBDESEMB T                                                        ');
    SQL.Add('   WHERE                                                                       ');
    SQL.Add('      T.ANASINT = ''S'' AND  T.RECPAG=:PRECPAG AND T.IDPESSOA=:PIDPESSOA       ');
    SQL.Add('   UNION                                                                       ');


    SQL.Add('   SELECT                                                                      ');
    SQL.Add('      NVL(T.CODTIPRECDESNOVO,T.CODTIPRECDES),                                             ');
    SQL.Add('      SUM(DECODE(T.RECPAG,''P'',DECODE(L.DEBCRE,''C'',R.VALOR,R.VALOR * -1),   ');
    SQL.Add('      DECODE(L.DEBCRE,''D'',R.VALOR,R.VALOR * -1))) AS VALORATU ,            ');
    SQL.Add('      (0) AS VALORANT, T.ANASINT                                               ');
    SQL.Add('   FROM                                                                        ');
    SQL.Add('      RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, TIPORECEBDESEMB T             ');
    SQL.Add('   WHERE                                                                       ');
//    if not CmpRptCM.ParamValues[0].IsNull then
//      SQL.Add('   R.CODCENTRORESPON IN (' + CmpRptCM.ParamValues[0].AsString + ') AND ');
//    SQL.Add('     TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 +
//      CmpRptCM.ParamValues[5].AsString + #39 + ',''DD/MM/YYYY'') AND ');
//    SQL.Add('     TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 +
//      CmpRptCM.ParamValues[6].AsString + #39 + ',''DD/MM/YYYY'') AND ');
    case StrToInt(CmpRptCM.ParamValues[4].AsString) of
      0: SQL.Add(' (D.NUMAPGR IS NOT NULL) AND ');
      1: SQL.Add(' (D.NUMAPGR IS  NULL) AND ');
    end;
    if not CmpRptCM.ParamValues[1].AsBoolean then
      SQL.Add(' (D.codtipdoc <> ' + CmpRptCM.ParamValues[9].AsString + ') AND ');

    if sStatus = '0' then
      SQL.Add(' (RTRIM(D.STATUS) = ''0'' OR D.STATUS IS NULL) AND ')
    else if sStatus = '2' then
      SQL.Add(' (RTRIM(D.STATUS) = ''2'') AND ');

//    SQL.Add('      T.RECPAG = :PRECPAG                                                    ');
    SQL.Add('      ((d.numfatura is null and rtrim(d.operacao) in (''1'',''11'') ) or  ');
    SQL.Add('       rtrim(d.operacao) not in (''1'',''11''))                              ');
//    SQL.Add('     AND D.RECPAG = :PRECPAG                                                   ');
//    SQL.Add('     AND T.IDPESSOA = :PIDPESSOA                                               ');
//    SQL.Add('     AND L.ESTORNO IS NULL                                                     ');
    SQL.Add('     AND T.CODTIPRECDES  = R.CODTIPRECDES                                      ');
    SQL.Add('     AND T.IDPESSOA = R.IDPESSOA                                               ');
    SQL.Add('     AND T.RECPAG = R.RECPAG                                                   ');
    SQL.Add('     AND T.IDPESSOA = :PIDPESSOA                                               ');
    SQL.Add('     AND T.RECPAG = :PRECPAG                                                    ');
    SQL.Add('     AND D.CODDOCUMENTO = R.CODDOCUMENTO                                       ');
    SQL.Add('     AND D.CODDOCUMENTO = L.CODDOCUMENTO                                       ');
    SQL.Add('     AND D.OPERACAO = L.OPERACAO                                               ');
    if not CmpRptCM.ParamValues[0].IsNull then
      SQL.Add('  AND R.CODCENTRORESPON IN (' + CmpRptCM.ParamValues[0].AsString + ') AND ');
    SQL.Add('     TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 +
      CmpRptCM.ParamValues[5].AsString + #39 + ',''DD/MM/YYYY'')  ');
    SQL.Add('    AND TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 +
      CmpRptCM.ParamValues[6].AsString + #39 + ',''DD/MM/YYYY'')  ');
    SQL.Add('    AND  D.RECPAG = :PRECPAG                                                   ');
    SQL.Add('     AND L.ESTORNO IS NULL                                                     ');
    SQL.Add('   GROUP BY                                                                    ');
    SQL.Add('      NVL(T.CODTIPRECDESNOVO,T.CODTIPRECDES),  T.ANASINT, L.DEBCRE, T.RECPAG               ');
    SQL.Add('   UNION                                                                       ');



    SQL.Add('   SELECT                                                                      ');
    SQL.Add('      NVL(T.CODTIPRECDESNOVO,T.CODTIPRECDES),  (0) AS VALORATU,                            ');
    SQL.Add('      DECODE(T.RECPAG,''P'',DECODE(L.DEBCRE,''C'',SUM(R.VALOR),SUM(R.VALOR) * -1), ');
    SQL.Add('      DECODE(L.DEBCRE,''D'',SUM(R.VALOR),SUM(R.VALOR) * -1)) AS VALORANT ,     ');
    SQL.Add('      T.ANASINT                                                                ');
    SQL.Add('   FROM                                                                        ');
    SQL.Add('      RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, CENTRESPON CR,                ');
    SQL.Add('      TIPORECEBDESEMB T                                                        ');
    SQL.Add('   WHERE                                                                       ');
//    if trim(CmpRptCM.ParamValues[0].AsString) <> '' then
//      SQL.Add(' R.CODCENTRORESPON IN (' + CmpRptCM.ParamValues[0].AsString + ') AND ');


//    dDataFin := IncMonth(StrToDate(CmpRptCM.ParamValues[6].AsString), -1);
//    if UltDiaMes(dDataFin) <> dDataFin then
//      dDataFin := UltDiaMes(IncMonth(StrToDate(CmpRptCM.ParamValues[6].AsString), -1));
//    SQL.Add('  TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 +
//      DateToStr(IncMonth(StrToDate(CmpRptCM.ParamValues[5].ASstring), -1)) + #39 + ',''DD/MM/YYYY'') AND ');
//    SQL.Add('  TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 +
//      DateToStr(dDataFin) + #39 + ',''DD/MM/YYYY'') AND ');

    if sStatus = '0' then
      SQL.Add(' (RTRIM(D.STATUS) = ''0'' OR D.STATUS IS NULL) AND ')
    else if sStatus = '2' then
      SQL.Add(' (RTRIM(D.STATUS) = ''2'') AND ');

//    SQL.Add('      T.RECPAG = :PRECPAG AND                                                  ');
//    SQL.Add('      ((d.numfatura is null and rtrim(d.operacao) in (''1'',''11'') ) or   ');
//    SQL.Add('        rtrim(d.operacao) not in (''1'',''11''))    and                    ');
//    SQL.Add('      D.RECPAG = :PRECPAG AND                                                  ');
//    SQL.Add('      T.IDPESSOA = :PIDPESSOA AND                                              ');
//    SQL.Add('      L.ESTORNO IS NULL AND                                                    ');
    SQL.Add('      T.CODTIPRECDES = R.CODTIPRECDES AND                                      ');
    SQL.Add('      T.IDPESSOA = R.IDPESSOA AND                                              ');
    SQL.Add('      T.RECPAG = R.RECPAG AND                                                  ');
    SQL.Add('      D.CODDOCUMENTO = R.CODDOCUMENTO AND                                      ');
    SQL.Add('      T.RECPAG = :PRECPAG AND                                                  ');    
    SQL.Add('      T.IDPESSOA = :PIDPESSOA AND                                              ');

    if trim(CmpRptCM.ParamValues[0].AsString) <> '' then
      SQL.Add(' R.CODCENTRORESPON IN (' + CmpRptCM.ParamValues[0].AsString + ') AND ');    

    SQL.Add('      D.CODDOCUMENTO = L.CODDOCUMENTO AND                                      ');
    SQL.Add('      D.OPERACAO = L.OPERACAO AND                                              ');
    SQL.Add('      CR.IDPESSOA = R.IDPESSOA(+) AND                                          ');
    SQL.Add('      CR.CODCENTRORESPON = R.CODCENTRORESPON(+)                                ');
    case StrToInt(CmpRptCM.ParamValues[4].AsString) of
      0: SQL.Add(' AND (D.NUMAPGR IS NOT NULL)  ');
      1: SQL.Add(' AND (D.NUMAPGR IS  NULL)  ');
    end;
    if not CmpRptCM.ParamValues[1].AsBoolean then
      SQL.Add(' AND (D.codtipdoc <> ' + CmpRptCM.ParamValues[9].AsString + ')  ');

    dDataFin := IncMonth(StrToDate(CmpRptCM.ParamValues[6].AsString), -1);

    if UltDiaMes(dDataFin) <> dDataFin then
      dDataFin := UltDiaMes(IncMonth(StrToDate(CmpRptCM.ParamValues[6].AsString), -1));

    SQL.Add('  AND TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 + DateToStr(IncMonth(StrToDate(CmpRptCM.ParamValues[5].ASstring), -1)) + #39 + ',''DD/MM/YYYY'')  ');
    SQL.Add('  AND TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 + DateToStr(dDataFin) + #39 + ',''DD/MM/YYYY'')  ');

    SQL.Add('     AND ((d.numfatura is null and rtrim(d.operacao) in (''1'',''11'') ) or   ');
    SQL.Add('        rtrim(d.operacao) not in (''1'',''11''))                        ');

    SQL.Add('      AND D.RECPAG = :PRECPAG                                                   ');
    SQL.Add('      AND L.ESTORNO IS NULL                                                    ');
    SQL.Add('   GROUP BY                                                                    ');
    SQL.Add('      NVL(T.CODTIPRECDESNOVO,T.CODTIPRECDES),  T.ANASINT, L.DEBCRE, T.RECPAG               ');
    SQL.Add('   UNION                                                                       ');



    SQL.Add('   SELECT                                                                      ');
    SQL.Add('      NVL(T.CODTIPRECDESNOVO,T.CODTIPRECDES),                                              ');
    SQL.Add('      SUM(DECODE(T.RECPAG,''P'',DECODE(L.DEBCRE,''C'',R.VALOR,R.VALOR * -1),   ');
    SQL.Add('      DECODE(L.DEBCRE,''D'',R.VALOR,R.VALOR * -1))  *                        ');
    SQL.Add('            parcela.valor/valorlanc.valor) AS VALORATU ,(0) AS VALORANT,       ');
    SQL.Add('      T.ANASINT                                                                ');
    SQL.Add('   FROM                                                                        ');
    SQL.Add('      RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, TIPORECEBDESEMB T  ,          ');
    SQL.Add('      (select d.numfatura,                                                     ');
    SQL.Add('        SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',l.VALOR,l.VALOR * -1), ');
    SQL.Add('        DECODE(L.DEBCRE,''D'',l.VALOR,l.VALOR * -1)))  AS VALOR              ');
    SQL.Add('       from                                                                    ');
    SQL.Add('        lanctodocum l , documento d                                            ');
    SQL.Add('       where d.coddocumento=l.coddocumento                                     ');
    SQL.Add('         and   d.recpag=:PRECPAG and d.idpessoa=:PIDPESSOA                     ');
    SQL.Add('         and rtrim(d.operacao)in (''1'',''11'')   and l.estorno is null    ');
    SQL.Add('         and d.numfatura is not null group by d.numfatura) valorlanc,          ');
    SQL.Add('      (select  d.numfatura,                                                    ');
    SQL.Add('        SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',l.VALOR,l.VALOR * -1), ');
    SQL.Add('        DECODE(L.DEBCRE,''D'',l.VALOR,l.VALOR * -1))) AS VALOR from          ');
    SQL.Add('        lanctodocum l , documento d                                            ');
    SQL.Add('         where                                                                 ');
//    SQL.Add('TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 + CmpRptCM.ParamValues[5].AsString + #39 + ',''DD/MM/YYYY'') AND ');
//    SQL.Add('TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 + CmpRptCM.ParamValues[6].AsString + #39 + ',''DD/MM/YYYY'') AND ');
//    case StrToInt(CmpRptCM.ParamValues[4].AsString) of
//      0: SQL.Add(' (D.NUMAPGR IS NOT NULL) AND ');
//      1: SQL.Add(' (D.NUMAPGR IS  NULL) AND ');
//    end;
//    if not CmpRptCM.ParamValues[1].AsBoolean then
//      SQL.Add(' (D.codtipdoc <> ' + CmpRptCM.ParamValues[9].AsString + ') AND ');
//    if sStatus = '0' then
//      SQL.Add(' (RTRIM(D.STATUS) = ''0'' OR D.STATUS IS NULL) AND ')
//    else if sStatus = '2' then
//      SQL.Add(' (RTRIM(D.STATUS) = ''2'') AND ');

    SQL.Add('         d.coddocumento=l.coddocumento   and d.operacao=l.operacao  and      ');
    SQL.Add('TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 + CmpRptCM.ParamValues[5].AsString + #39 + ',''DD/MM/YYYY'') AND ');
    SQL.Add('TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 + CmpRptCM.ParamValues[6].AsString + #39 + ',''DD/MM/YYYY'') AND ');
    case StrToInt(CmpRptCM.ParamValues[4].AsString) of
      0: SQL.Add(' (D.NUMAPGR IS NOT NULL) AND ');
      1: SQL.Add(' (D.NUMAPGR IS  NULL) AND ');
    end;
    if not CmpRptCM.ParamValues[1].AsBoolean then
      SQL.Add(' (D.codtipdoc <> ' + CmpRptCM.ParamValues[9].AsString + ') AND ');
    if sStatus = '0' then
      SQL.Add(' (RTRIM(D.STATUS) = ''0'' OR D.STATUS IS NULL) AND ')
    else if sStatus = '2' then
      SQL.Add(' (RTRIM(D.STATUS) = ''2'') AND ');
    SQL.Add('           d.idpessoa=:PIDPESSOA and rtrim(d.operacao)in (''3'',''13'')  ');
    SQL.Add('        and d.recpag=:PRECPAG  AND  d.numfatura is not null            ');
    SQL.Add('          and l.estorno is null group by d.numfatura) parcela               ');
    SQL.Add('   WHERE                                                                    ');
//    if trim(CmpRptCM.ParamValues[0].AsString) <> '' then
//      SQL.Add(' R.CODCENTRORESPON IN (' + CmpRptCM.ParamValues[0].AsString + ') AND ');
    SQL.Add('      d.numfatura=parcela.numfatura and                                        ');
    SQL.Add('      parcela.numfatura=valorlanc.numfatura and                                ');
    SQL.Add('      valorlanc.valor<> 0 and                                                  ');
//    SQL.Add('      T.RECPAG = :PRECPAG     AND ( rtrim(d.operacao) in (''1'',''11'')) and   ');
//    SQL.Add('      d.numfatura is not null and                                              ');
//    SQL.Add('      D.RECPAG = :PRECPAG AND                                                  ');
//    SQL.Add('      T.IDPESSOA = :PIDPESSOA AND                                              ');
//    SQL.Add('      L.ESTORNO IS NULL AND                                                    ');
    SQL.Add('      T.CODTIPRECDES  = R.CODTIPRECDES AND                                     ');
    SQL.Add('      T.IDPESSOA = R.IDPESSOA AND                                              ');
    SQL.Add('      T.RECPAG = R.RECPAG AND                                                  ');

    if trim(CmpRptCM.ParamValues[0].AsString) <> '' then
      SQL.Add(' R.CODCENTRORESPON IN (' + CmpRptCM.ParamValues[0].AsString + ') AND ');
      
    SQL.Add('      T.RECPAG = :PRECPAG     AND ( rtrim(d.operacao) in (''1'',''11'')) and   ');
    SQL.Add('      T.IDPESSOA = :PIDPESSOA AND                                              ');
    SQL.Add('      D.CODDOCUMENTO = R.CODDOCUMENTO AND                                      ');
    SQL.Add('      D.CODDOCUMENTO = L.CODDOCUMENTO AND                                      ');
    SQL.Add('      D.OPERACAO = L.OPERACAO AND                                              ');
    SQL.Add('      d.numfatura is not null and                                              ');
    SQL.Add('      D.RECPAG = :PRECPAG AND                                                  ');
    SQL.Add('      L.ESTORNO IS NULL                                                     ');
    SQL.Add('   GROUP BY                                                                    ');
    SQL.Add('      NVL(T.CODTIPRECDESNOVO,T.CODTIPRECDES),  T.ANASINT, L.DEBCRE, T.RECPAG               ');
    SQL.Add('   UNION                                                                       ');



    SQL.Add('   SELECT                                                                      ');
    SQL.Add('      NVL(T.CODTIPRECDESNOVO,T.CODTIPRECDES),   (0) AS VALORATU   ,                        ');
    SQL.Add('      SUM(DECODE(T.RECPAG,''P'',DECODE(L.DEBCRE,''C'',R.VALOR,R.VALOR * -1),   ');
    SQL.Add('      DECODE(L.DEBCRE,''D'',R.VALOR,R.VALOR * -1)) *                           ');
    SQL.Add('         parcela.valor/valorlanc.valor) AS VALORANT ,                          ');
    SQL.Add('      T.ANASINT                                                                ');
    SQL.Add('   FROM                                                                        ');
    SQL.Add('      RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, TIPORECEBDESEMB T  ,          ');
    SQL.Add('      (select d.numfatura,                                                     ');
    SQL.Add('        SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',l.VALOR,l.VALOR * -1), ');
    SQL.Add('        DECODE(L.DEBCRE,''D'',l.VALOR,l.VALOR * -1)))  AS VALOR from           ');
    SQL.Add('        lanctodocum l , documento d                                            ');
    SQL.Add('         where d.coddocumento=l.coddocumento                                   ');
    SQL.Add('         and   d.recpag=:PRECPAG and d.idpessoa=:PIDPESSOA                     ');
    SQL.Add('         and rtrim(d.operacao)in (''1'',''11'')   and l.estorno is null        ');
    SQL.Add('         and d.numfatura is not null group by d.numfatura) valorlanc,          ');
    SQL.Add('      (select d.numfatura,                                                     ');
    SQL.Add('        SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',l.VALOR,l.VALOR * -1), ');
    SQL.Add('        DECODE(L.DEBCRE,''D'',l.VALOR,l.VALOR * -1))) AS VALOR from            ');
    SQL.Add('        lanctodocum l , documento d                                            ');
    SQL.Add('         where                                                                 ');
    case StrToInt(CmpRptCM.ParamValues[4].AsString) of
      0: SQL.Add(' (D.NUMAPGR IS NOT NULL) AND ');
      1: SQL.Add(' (D.NUMAPGR IS  NULL) AND ');
    end;
    if not CmpRptCM.ParamValues[1].AsBoolean then
      SQL.Add(' (D.codtipdoc <> ' + CmpRptCM.ParamValues[9].AsString + ') AND ');
    SQL.Add(' TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE(' + #39 +
      DateToStr(IncMonth(StrToDate(CmpRptCM.ParamValues[5].AsString), -1)) + #39 + ',''DD/MM/YYYY'') AND ');
    SQL.Add(' TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE(' + #39 +
      DateToStr(dDataFin) + #39 + ',''DD/MM/YYYY'') AND ');

    if sStatus = '0' then
      SQL.Add(' (RTRIM(D.STATUS) = ''0'' OR D.STATUS IS NULL) AND ')
    else if sStatus = '2' then
      SQL.Add(' (RTRIM(D.STATUS) = ''2'') AND ');

    SQL.Add('         d.coddocumento=l.coddocumento    and l.estorno is null                ');
    SQL.Add('         and   d.recpag=:PRECPAG and d.idpessoa=:PIDPESSOA                     ');
    SQL.Add('         and rtrim(d.operacao)in (''3'',''13'') and d.operacao=l.operacao      ');
    SQL.Add('         and d.numfatura is not null group by d.numfatura) parcela             ');
    SQL.Add('   WHERE                                                                       ');
//    if trim(CmpRptCM.ParamValues[0].AsString) <> '' then
//      SQL.Add(' R.CODCENTRORESPON IN (' + CmpRptCM.ParamValues[0].AsString + ') AND ');

    SQL.Add('      valorlanc.valor <> 0 and                                                 ');
    SQL.Add('      d.numfatura=parcela.numfatura and                                        ');
    SQL.Add('      parcela.numfatura=valorlanc.numfatura and                                ');
//    SQL.Add('      T.RECPAG = :PRECPAG AND ( rtrim(d.operacao) in (''1'',''11'')  ) and     ');
//    SQL.Add('      d.numfatura is not null and                                              ');
//    SQL.Add('      D.RECPAG = :PRECPAG AND                                                  ');
//    SQL.Add('      T.IDPESSOA = :PIDPESSOA AND                                              ');
//    SQL.Add('      L.ESTORNO IS NULL AND                                                    ');
    SQL.Add('      T.CODTIPRECDES  = R.CODTIPRECDES AND                                     ');
    SQL.Add('      T.IDPESSOA = R.IDPESSOA AND                                              ');
    SQL.Add('      T.RECPAG = R.RECPAG AND                                                  ');

    if trim(CmpRptCM.ParamValues[0].AsString) <> '' then
      SQL.Add(' R.CODCENTRORESPON IN (' + CmpRptCM.ParamValues[0].AsString + ') AND ');
          
    SQL.Add('      T.RECPAG = :PRECPAG AND ( rtrim(d.operacao) in (''1'',''11'')  ) and     ');    
    SQL.Add('      T.IDPESSOA = :PIDPESSOA AND                                              ');
    SQL.Add('      D.CODDOCUMENTO = R.CODDOCUMENTO AND                                      ');
    SQL.Add('      D.CODDOCUMENTO = L.CODDOCUMENTO AND                                      ');
    SQL.Add('      D.OPERACAO = L.OPERACAO AND                                              ');
    SQL.Add('      d.numfatura is not null and                                              ');
    SQL.Add('      D.RECPAG = :PRECPAG AND                                                  ');    
    SQL.Add('      L.ESTORNO IS NULL                                                     ');
    SQL.Add('   GROUP BY                                                                    ');
    SQL.Add('      NVL(T.CODTIPRECDESNOVO,T.CODTIPRECDES),  T.ANASINT, L.DEBCRE, T.RECPAG               ');
    SQL.Add('      ) TMP                                                                    ');
    SQL.Add('GROUP BY                                                                       ');
    SQL.Add('   CODTIPRECDES, ANASINT                                            ');
    SQL.Add('ORDER BY                                                                       ');
    SQL.Add('   CODTIPRECDES                                                                ');
  end;
    //Brunno Mattos - SOL 156867/4581 - KTN 1246405 - Inclui no group by das qrys o  NVL(T.CODTIPRECDESNOVO,T.CODTIPRECDES)

  with Sqldemsintgest do
  begin
    Prepare;
    parambyname('precpag').asstring := ParamIntegra.RecPag;
    parambyname('pidpessoa').AsFloat := CrmRptCM.IdEmpresa;
    open;
  end;
  SqlAuxDemSintGest.open;
  CdsDemSintGest.first;
  while not CdsDemSintGest.eof do
  begin
    if CdsDemSintGest.FieldByName('anasint').asstring = 'S' then
    begin
      descricao := CdsDemSintGest.FieldByName('DESCRICAO').AsString;
      quebra := CdsDemSintGest.FieldByName('codtiprecdes').AsString;
    end
    else
    begin
      CdsAuxDemSintGest.append;
      CdsAuxDemSintGest.FieldByName('codtiprecdes').asstring := CdsDemSintGest.FieldByName('codtiprecdes').asstring;
      CdsAuxDemSintGest.FieldByName('descricao').asstring := CdsDemSintGest.FieldByName('DESCRICAO').asstring;
      CdsAuxDemSintGest.FieldByName('valoratu').asstring := CdsDemSintGest.FieldByName('VALORATU').asstring;
      CdsAuxDemSintGest.FieldByName('valorant').asstring := CdsDemSintGest.FieldByName('VALORANT').asstring;
      CdsAuxDemSintGest.FieldByName('quebra').asstring := quebra;
      CdsAuxDemSintGest.FieldByName('descr').asstring := descricao;
      CdsAuxDemSintGest.post;
    end;
    CdsDemSintGest.next;
  end;
  CdsDemSintGest.close;
  CdsAuxDemSintGest.first;
end;

function TRptDemisSint.UltDiaMes(FDate: TDateTime): TDateTime;
const
  DaysPerMonth: array[1..12] of Integer =
  (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
var
  Ano, Mes, Dia, iUltDia: Word;

  function IsLeapYear(Year: Word): Boolean;
  begin
    Result := (Year mod 4 = 0)
      and ((Year mod 100 <> 0)
      or (Year mod 400 = 0));
  end;
begin
  DecodeDate(FDate, Ano, Mes, Dia);

  iUltDia := DaysPerMonth[Mes];
  if (Mes = 2) and IsLeapYear(Ano) then
    Inc(iUltDia);

  Result := EncodeDate(Ano, Mes, iUltDia);
end;

end.

