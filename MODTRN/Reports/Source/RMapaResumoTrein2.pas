// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  13/05/2009
// Pendência   : SOL 116806 KINTANA 549481
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RMapaResumoTrein2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, ppBands, ppCache, ppClass, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  ppCtrls, ppPrnabl, ppVar, ppStrtch, ppSubRpt, ppRegion, ppMemo, TXRB;

type
  TRptMapaResumoTrein2 = class(TFrmCmReport)
    sqlMapaResumoTrein: TCMSqlParams;
    CdsMapaResumoTrein: TCMClientDataSet;
    dsMapaResumoTrein: TwwDataSource;
    ppMapaResumoTrein: TppBDEPipeline;
    rpMapaResumoTrein: TppReport;
    rpAtivPessDtlBnd: TppDetailBand;
    rpAtivPessSmryBnd: TppSummaryBand;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    lu1: TppLabel;
    s3c1: TppDBCalc;
    s3u1: TppDBCalc;
    ppLabel9: TppLabel;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    lc1: TppLabel;
    dc1: TppDBText;
    du1: TppDBText;
    ppLabel12: TppLabel;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    ppDBText3: TppDBText;
    lp1: TppLabel;
    dp1: TppDBText;
    s3p1: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterTipo: TppGroupFooterBand;
    s1c1: TppDBCalc;
    s1u1: TppDBCalc;
    ppLabel3: TppLabel;
    s1p1: TppDBCalc;
    lin1: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterEmpresa: TppGroupFooterBand;
    ppDBText5: TppDBText;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    s2p1: TppDBCalc;
    s2u1: TppDBCalc;
    s2c1: TppDBCalc;
    CdsGrupo: TCMClientDataSet;
    sqlGrupo: TCMSqlParams;
    ppDBText2: TppDBText;
    ppDBText6: TppDBText;
    dg1: TppDBText;
    lp2: TppLabel;
    lc2: TppLabel;
    lu2: TppLabel;
    dg2: TppDBText;
    dc2: TppDBText;
    du2: TppDBText;
    dp2: TppDBText;
    s1c2: TppDBCalc;
    s1u2: TppDBCalc;
    s1p2: TppDBCalc;
    s2p2: TppDBCalc;
    s2u2: TppDBCalc;
    lin2: TppLine;
    s2c2: TppDBCalc;
    s3c2: TppDBCalc;
    s3u2: TppDBCalc;
    s3p2: TppDBCalc;
    lin3: TppLine;
    lp3: TppLabel;
    lc3: TppLabel;
    lu3: TppLabel;
    dg3: TppDBText;
    dc3: TppDBText;
    du3: TppDBText;
    dp3: TppDBText;
    s1p3: TppDBCalc;
    s1c3: TppDBCalc;
    s1u3: TppDBCalc;
    s2p3: TppDBCalc;
    s2c3: TppDBCalc;
    s2u3: TppDBCalc;
    s3c3: TppDBCalc;
    s3u3: TppDBCalc;
    s3p3: TppDBCalc;
    lp4: TppLabel;
    lc4: TppLabel;
    lu4: TppLabel;
    dg4: TppDBText;
    dc4: TppDBText;
    du4: TppDBText;
    dp4: TppDBText;
    s1p4: TppDBCalc;
    s1c4: TppDBCalc;
    s1u4: TppDBCalc;
    s2p4: TppDBCalc;
    s2c4: TppDBCalc;
    s2u4: TppDBCalc;
    s3c4: TppDBCalc;
    s3u4: TppDBCalc;
    s3p4: TppDBCalc;
    lp5: TppLabel;
    lc5: TppLabel;
    lu5: TppLabel;
    dg5: TppDBText;
    dc5: TppDBText;
    du5: TppDBText;
    dp5: TppDBText;
    s1p5: TppDBCalc;
    s1c5: TppDBCalc;
    s1u5: TppDBCalc;
    s2p5: TppDBCalc;
    s2c5: TppDBCalc;
    s2u5: TppDBCalc;
    s3c5: TppDBCalc;
    s3u5: TppDBCalc;
    s3p5: TppDBCalc;
    lp6: TppLabel;
    lc6: TppLabel;
    lu6: TppLabel;
    dg6: TppDBText;
    dc6: TppDBText;
    du6: TppDBText;
    dp6: TppDBText;
    s1p6: TppDBCalc;
    s1c6: TppDBCalc;
    s1u6: TppDBCalc;
    s2p6: TppDBCalc;
    s2c6: TppDBCalc;
    s2u6: TppDBCalc;
    s3c6: TppDBCalc;
    s3u6: TppDBCalc;
    s3p6: TppDBCalc;
    lp7: TppLabel;
    lc7: TppLabel;
    lu7: TppLabel;
    dg7: TppDBText;
    dc7: TppDBText;
    du7: TppDBText;
    dp7: TppDBText;
    s1p7: TppDBCalc;
    s1c7: TppDBCalc;
    s1u7: TppDBCalc;
    s2p7: TppDBCalc;
    s2c7: TppDBCalc;
    s2u7: TppDBCalc;
    s3c7: TppDBCalc;
    s3u7: TppDBCalc;
    s3p7: TppDBCalc;
    lp8: TppLabel;
    lc8: TppLabel;
    lu8: TppLabel;
    dg8: TppDBText;
    dc8: TppDBText;
    du8: TppDBText;
    dp8: TppDBText;
    s1p8: TppDBCalc;
    s1c8: TppDBCalc;
    s1u8: TppDBCalc;
    s2p8: TppDBCalc;
    s2c8: TppDBCalc;
    s2u8: TppDBCalc;
    s3c8: TppDBCalc;
    s3u8: TppDBCalc;
    s3p8: TppDBCalc;
    lp9: TppLabel;
    lc9: TppLabel;
    lu9: TppLabel;
    dg9: TppDBText;
    dc9: TppDBText;
    du9: TppDBText;
    dp9: TppDBText;
    s1p9: TppDBCalc;
    s1c9: TppDBCalc;
    s1u9: TppDBCalc;
    s2p9: TppDBCalc;
    s2c9: TppDBCalc;
    s2u9: TppDBCalc;
    s3c9: TppDBCalc;
    s3u9: TppDBCalc;
    s3p9: TppDBCalc;
    lp10: TppLabel;
    lc10: TppLabel;
    lu10: TppLabel;
    dg10: TppDBText;
    dc10: TppDBText;
    du10: TppDBText;
    dp10: TppDBText;
    s1p10: TppDBCalc;
    s1c10: TppDBCalc;
    s1u10: TppDBCalc;
    s2p10: TppDBCalc;
    s2c10: TppDBCalc;
    s2u10: TppDBCalc;
    s3c10: TppDBCalc;
    s3u10: TppDBCalc;
    s3p10: TppDBCalc;
    lp11: TppLabel;
    lc11: TppLabel;
    lu11: TppLabel;
    dg11: TppDBText;
    dc11: TppDBText;
    du11: TppDBText;
    dp11: TppDBText;
    s1p11: TppDBCalc;
    s1c11: TppDBCalc;
    s1u11: TppDBCalc;
    s2p11: TppDBCalc;
    s2c11: TppDBCalc;
    s2u11: TppDBCalc;
    s3c11: TppDBCalc;
    s3u11: TppDBCalc;
    s3p11: TppDBCalc;
    lp12: TppLabel;
    lc12: TppLabel;
    lu12: TppLabel;
    dg12: TppDBText;
    dc12: TppDBText;
    du12: TppDBText;
    dp12: TppDBText;
    s1p12: TppDBCalc;
    s1c12: TppDBCalc;
    s1u12: TppDBCalc;
    s2p12: TppDBCalc;
    s2c12: TppDBCalc;
    s2u12: TppDBCalc;
    s3c12: TppDBCalc;
    s3u12: TppDBCalc;
    s3p12: TppDBCalc;
    lpTot: TppLabel;
    lcTot: TppLabel;
    luTot: TppLabel;
    dcTot: TppDBText;
    duTot: TppDBText;
    dpTot: TppDBText;
    s1pTot: TppDBCalc;
    s1cTot: TppDBCalc;
    s1uTot: TppDBCalc;
    s2pTot: TppDBCalc;
    s2cTot: TppDBCalc;
    s2uTot: TppDBCalc;
    s3cTot: TppDBCalc;
    s3uTot: TppDBCalc;
    s3pTot: TppDBCalc;
    lTot: TppLabel;
    lin0: TppLine;
    L11: TppLine;
    L21: TppLine;
    L31: TppLine;
    L41: TppLine;
    L51: TppLine;
    L12: TppLine;
    L22: TppLine;
    L32: TppLine;
    L42: TppLine;
    L52: TppLine;
    L13: TppLine;
    L23: TppLine;
    L33: TppLine;
    L43: TppLine;
    L53: TppLine;
    L14: TppLine;
    L24: TppLine;
    L34: TppLine;
    L44: TppLine;
    L54: TppLine;
    L15: TppLine;
    L25: TppLine;
    L35: TppLine;
    L45: TppLine;
    L55: TppLine;
    L16: TppLine;
    L26: TppLine;
    L36: TppLine;
    L46: TppLine;
    L56: TppLine;
    L17: TppLine;
    L27: TppLine;
    L37: TppLine;
    L47: TppLine;
    L57: TppLine;
    L18: TppLine;
    L28: TppLine;
    L38: TppLine;
    L48: TppLine;
    L58: TppLine;
    L19: TppLine;
    L29: TppLine;
    L39: TppLine;
    L49: TppLine;
    L59: TppLine;
    L110: TppLine;
    L210: TppLine;
    L310: TppLine;
    L410: TppLine;
    L510: TppLine;
    L111: TppLine;
    L211: TppLine;
    L311: TppLine;
    L411: TppLine;
    L511: TppLine;
    L112: TppLine;
    L212: TppLine;
    L312: TppLine;
    L412: TppLine;
    L512: TppLine;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure GravaDadosQuery;
  private

  end;

var
  RptMapaResumoTrein2: TRptMapaResumoTrein2;

implementation

uses uCtrlFuncoesRH, uSistema, dCds;

{$R *.DFM}

procedure TRptMapaResumoTrein2.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  ppGroupFooterEmpresa.Visible := CmpRptCM.ParamByName('Consolida').asInteger = 1;

//  with (sqlMapaResumoTrein.SQL) do
  // Monta Query Auxiliar
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT EMPRESA, DESCRICAO, MESORDEM,');
    Add('    DECODE(TIPO,NULL,''Tipo Não Identificado'',TIPO) AS TIPO,');
    Add('    DECODE(GRUPO2,NULL,''Outros ou Não Identificado'',GRUPO2) AS GRUPO2,');
    Add('    DECODE(GRUPO,NULL,''Grupo Curso Não Identificado'',GRUPO) AS GRUPO, PERIODO, MES,');
    Add('       SUM(DUR_TOT) AS DUR_TOT, SUM(CUSTO) AS CUSTO, COUNT(*) AS PARTICIPANTES');
    Add('FROM');
    Add('(');

    if CmpRptCM.ParamByName('TipoPessoa').asInteger <> 1 then
    begin
      Add('SELECT');

      if CmpRptCM.ParamByName('Consolida').asInteger = 0 then
         Add(QuotedStr(CmpRptCM.ParamByName('NomeEmpre').asString)+' AS EMPRESA,')
      else
         Add('PJ.RAZAOSOCIAL AS EMPRESA,');

      Add('   TP.DESCRICAO AS TIPO, G.DESCGRPTREIN AS GRUPO, G2.DESCGRPTREIN AS GRUPO2,');
      Add('   H.IDPESSOA, CU.DESCRICAO, (H.DUR_PRAT + H.DUR_TEOR) AS DUR_TOT,');
      Add('   (NVL(H.VALOR,0) ');
      if CmpRptCM.ParamByName('TipoCusto').asInteger = 0 then
        Add('  + NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0) ');
      Add('   ) AS CUSTO,');
      Add('''Período: '' || ' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+' || '' a ''');
      Add('   || ' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ' AS PERIODO,');
      Add('   TO_CHAR(DECODE(DATREFIM,NULL,DATPLFIM,DATREFIM),''YYYYMM'') AS MESORDEM,');
      Add('   DECODE(TO_CHAR(DECODE(DATREFIM,NULL,DATPLFIM,DATREFIM),''MM''),');
      Add('   ''01'',''Jan'',''02'',''Fev'',''03'',''Mar'',''04'',''Abr'',');
      Add('   ''05'',''Mai'',''06'',''Jun'',''07'',''Jul'',''08'',''Ago'',');
      Add('   ''09'',''Set'',''10'',''Out'',''11'',''Nov'',''Dez'') || ');
      Add('   TO_CHAR(DECODE(DATREFIM,NULL,DATPLFIM,DATREFIM),''/YYYY'') AS MES');

      Add('FROM PESSOA PJ, PESSOA PF, HSTTRN H, FUNCIONARIO F, CURSO CU, CARGO CG,');
      Add('     GRPTREIN G, GRPTREIN G2, TIPCURSO TP');

      Add('WHERE   F.IDPESSOA = PF.IDPESSOA');

      Add('AND     H.FLGCONTROLE = 1');

      if CmpRptCM.ParamByName('ListaCurso').asString <> '' then
        Add('AND     CU.IDCURSO IN (' +CmpRptCM.ParamByName('ListaCurso').asString+ ')');

      if CmpRptCM.ParamByName('ListaEntid').asString <> '' then
        Add('AND     H.IDENTIDINSTR IN (' +CmpRptCM.ParamByName('ListaEntid').asString+ ')');

      if CmpRptCM.ParamByName('ListaEmpre').asString <> '' then
        Add('AND     F.IDEMPRESA IN (' +CmpRptCM.ParamByName('ListaEmpre').asString+ ')');
      Add('AND     F.IDEMPRESA = PJ.IDPESSOA');

      Add('AND     (');

      if (CmpRptCM.ParamByName('SelCurso1').asBoolean) then
      begin
        Add('   (H.DATPLINI IS NOT NULL AND');
        Add('    H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY''))');
      end;

      if (CmpRptCM.ParamByName('SelCurso2').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('SelCurso1').asBoolean) then
          Add(' OR');

        Add('   (H.DATPLINI IS NULL AND');
        Add('    H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY''))');
      end;

      if (CmpRptCM.ParamByName('SelCurso3').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('SelCurso1').asBoolean) or
           (CmpRptCM.ParamByName('SelCurso2').asBoolean) then
          Add(' OR');

        Add('   (H.DATREFIM IS NULL AND');
        Add('    H.DATPLFIM BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY''))');
      end;

      if (CmpRptCM.ParamByName('SelCurso4').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('SelCurso1').asBoolean) or
           (CmpRptCM.ParamByName('SelCurso2').asBoolean) or
           (CmpRptCM.ParamByName('SelCurso3').asBoolean) then
          Add(' OR');

        Add('   (H.DATREINI IS NULL AND H.DATPLINI IS NULL)');
      end;

      Add(' )');
      Add('AND     H.IDCURSO    = CU.IDCURSO');
      Add('AND     H.IDPESSOA   = F.IDPESSOA');
      Add('AND     F.IDCARGO       = CG.IDCARGO');
      Add('AND     CG.CODGRPTREIN  = G2.CODGRPTREIN(+)');
      Add('AND     G.CODGRPTREIN   = CU.CODGRPTREIN(+)');
      Add('AND     CU.IDTIPOCURSO  = TP.IDTIPOCURSO(+)');
    end;

    if CmpRptCM.ParamByName('TipoPessoa').asInteger = 2 then
      Add('UNION ALL');

    if CmpRptCM.ParamByName('TipoPessoa').asInteger <> 0 then
    begin
      Add('SELECT');

      if CmpRptCM.ParamByName('Consolida').asInteger = 0 then
         Add(QuotedStr(CmpRptCM.ParamByName('NomeEmpre').asString)+' AS EMPRESA,')
      else
         Add(QuotedStr(Sistema.RazaoSocial) + ' AS EMPRESA,');

      Add('   TP.DESCRICAO AS TIPO, G.DESCGRPTREIN AS GRUPO, ');
      Add('   '+QuotedStr(CmpRptCM.ParamByName('DescGrupoCand').asString)+ ' AS GRUPO2,');
      Add('   H.IDPESSOA, CU.DESCRICAO, (H.DUR_PRAT + H.DUR_TEOR) AS DUR_TOT,');
      Add('   (NVL(H.VALOR,0) ');
      if CmpRptCM.ParamByName('TipoCusto').asInteger = 0 then
        Add('  + NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0) ');
      Add('   ) AS CUSTO,');
      Add('''Período: '' || ' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+' || '' a ''');
      Add('   || ' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ' AS PERIODO,');
      Add('   TO_CHAR(DECODE(DATREFIM,NULL,DATPLFIM,DATREFIM),''YYYYMM'') AS MESORDEM,');
      Add('   DECODE(TO_CHAR(DECODE(DATREFIM,NULL,DATPLFIM,DATREFIM),''MM''),');
      Add('   ''01'',''Jan'',''02'',''Fev'',''03'',''Mar'',''04'',''Abr'',');
      Add('   ''05'',''Mai'',''06'',''Jun'',''07'',''Jul'',''08'',''Ago'',');
      Add('   ''09'',''Set'',''10'',''Out'',''11'',''Nov'',''Dez'') || ');
      Add('   TO_CHAR(DECODE(DATREFIM,NULL,DATPLFIM,DATREFIM),''/YYYY'') AS MES');

      Add('FROM PESSOA PF, HSTTRN H, CANDIDAT F, CURSO CU,');
      Add('     GRPTREIN G, TIPCURSO TP');


      Add('WHERE   F.IDPESSOA = PF.IDPESSOA');

      Add('AND     H.FLGCONTROLE = 1');

      if CmpRptCM.ParamByName('ListaCurso').asString <> '' then
        Add('AND     CU.IDCURSO IN (' +CmpRptCM.ParamByName('ListaCurso').asString+ ')');

      if CmpRptCM.ParamByName('ListaEntid').asString <> '' then
        Add('AND     H.IDENTIDINSTR IN (' +CmpRptCM.ParamByName('ListaEntid').asString+ ')');

      Add('AND     (');

      if (CmpRptCM.ParamByName('SelCurso1').asBoolean) then
      begin
        Add('   (H.DATPLINI IS NOT NULL AND');
        Add('    H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY''))');
      end;

      if (CmpRptCM.ParamByName('SelCurso2').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('SelCurso1').asBoolean) then
          Add(' OR');

        Add('   (H.DATPLINI IS NULL AND');
        Add('    H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY''))');
      end;

      if (CmpRptCM.ParamByName('SelCurso3').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('SelCurso1').asBoolean) or
           (CmpRptCM.ParamByName('SelCurso2').asBoolean) then
          Add(' OR');

        Add('   (H.DATREFIM IS NULL AND');
        Add('    H.DATPLFIM BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY''))');
      end;

      if (CmpRptCM.ParamByName('SelCurso4').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('SelCurso1').asBoolean) or
           (CmpRptCM.ParamByName('SelCurso2').asBoolean) or
           (CmpRptCM.ParamByName('SelCurso3').asBoolean) then
          Add(' OR');

        Add('   (H.DATREINI IS NULL AND H.DATPLINI IS NULL)');
      end;

      Add(' )');
      Add('AND     H.IDCURSO       = CU.IDCURSO');
      Add('AND     H.IDPESSOA      = F.IDPESSOA');
      Add('AND     G.CODGRPTREIN   = CU.CODGRPTREIN(+)');
      Add('AND     CU.IDTIPOCURSO  = TP.IDTIPOCURSO(+)');
    end;

    Add(' )');

    Add('GROUP BY EMPRESA, DESCRICAO, MESORDEM, GRUPO2, GRUPO, TIPO, PERIODO, MES');
    Add('ORDER BY 1 DESC, 4 DESC, 6 DESC, 3 DESC, 2 DESC, 5 DESC');
    //ORDER BY EMPRESA, TIPO, GRUPO, MESORDEM, GRUPO2, DESCRICAO
    //1.EMPRESA, 2.DESCRICAO, 3.MESORDEM, 4.TIPO, 5.GRUPO2(CARGO), 6.GRUPO(CURSO)
    //7.PERIODO, 8.MES, 9.CUSTO, 10.PARTICIPANTES

//    SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  dmCds.SQL.Open;

  // Monta Query Principal
  GravaDadosQuery;
  CdsMapaResumoTrein.First;
end;

procedure TRptMapaResumoTrein2.GravaDadosQuery;
var
  c, c2, i: integer;
  s1, s2, s3, s4, s5: string;
  sNome: variant;
begin
  if (CmpRptCM.ParamByName('TipoPessoa').asInteger <> 0) then
  begin
    sqlGrupo.SQL.Clear;
    sqlGrupo.SQL.Add(
      'SELECT DISTINCT'+CR_LF+
      '  G.DESCGRPTREIN'+CR_LF+
      'FROM'+CR_LF+
      '  CARGO C, GRPTREIN G'+CR_LF+
      'WHERE'+CR_LF+
      '  (C.CODGRPTREIN = G.CODGRPTREIN)'+CR_LF+
      'UNION SELECT'+CR_LF+
      QuotedStr(CmpRptCM.ParamByName('DescGrupoCand').asString)+ ' AS DESCGRPTREIN FROM DUAL'+CR_LF+
      'ORDER BY 1');
  end;
  sqlGrupo.Open;
  CdsGrupo.First;
  c2 := CdsGrupo.RecordCount;
  if (c2 > 11) then // para limitar a 12 colunas, prevendo os "Não Identificados"
    c2 := 11;

  // Prepara o array de nomes dos grupos
  sNome := VarArrayCreate([1, c2+1], varVariant);

  c := 0;
  CdsGrupo.First;
  while not CdsGrupo.Eof do
  begin
    inc(c);
    sNome[c] := CdsGrupo.FieldByName('DESCGRPTREIN').AsString;
    if c = 11 then
      break;
    CdsGrupo.Next;
  end;
  CdsGrupo.First;
  sNome[c+1] := 'Outros ou Não Identificado';

  if c2+1 < 12 then
  begin
    for i := c2+2 to 12 do
    begin
      TppDBText(Self.FindComponent('dg'+IntToStr(i))).Visible := False;

      TppLabel(Self.FindComponent('lp'+IntToStr(i))).Visible := False;
      TppLabel(Self.FindComponent('lc'+IntToStr(i))).Visible := False;
      TppLabel(Self.FindComponent('lu'+IntToStr(i))).Visible := False;

      TppDBText(Self.FindComponent('dp'+IntToStr(i))).Visible := False;
      TppDBText(Self.FindComponent('dc'+IntToStr(i))).Visible := False;
      TppDBText(Self.FindComponent('du'+IntToStr(i))).Visible := False;

      TppDBCalc(Self.FindComponent('s1p'+IntToStr(i))).Visible := False;
      TppDBCalc(Self.FindComponent('s2p'+IntToStr(i))).Visible := False;
      TppDBCalc(Self.FindComponent('s3p'+IntToStr(i))).Visible := False;
      TppDBCalc(Self.FindComponent('s1c'+IntToStr(i))).Visible := False;
      TppDBCalc(Self.FindComponent('s2c'+IntToStr(i))).Visible := False;
      TppDBCalc(Self.FindComponent('s3c'+IntToStr(i))).Visible := False;
      TppDBCalc(Self.FindComponent('s1u'+IntToStr(i))).Visible := False;
      TppDBCalc(Self.FindComponent('s2u'+IntToStr(i))).Visible := False;
      TppDBCalc(Self.FindComponent('s3u'+IntToStr(i))).Visible := False;

      TppLine(Self.FindComponent('L1'+IntToStr(i))).Visible := False;
      TppLine(Self.FindComponent('L2'+IntToStr(i))).Visible := False;
      TppLine(Self.FindComponent('L3'+IntToStr(i))).Visible := False;
      TppLine(Self.FindComponent('L4'+IntToStr(i))).Visible := False;
      TppLine(Self.FindComponent('L5'+IntToStr(i))).Visible := False;
    end;
    lTot.Left := lTot.Left - (12 - c2 - 1) * (1074-808);

    lpTot.Left := lpTot.Left - (12 - c2 - 1) * (1074-808);
    lcTot.Left := lcTot.Left - (12 - c2 - 1) * (1074-808);
    luTot.Left := luTot.Left - (12 - c2 - 1) * (1074-808);

    dpTot.Left := dpTot.Left - (12 - c2 - 1) * (1074-808);
    dcTot.Left := dcTot.Left - (12 - c2 - 1) * (1074-808);
    duTot.Left := duTot.Left - (12 - c2 - 1) * (1074-808);

    s1pTot.Left := s1pTot.Left - (12 - c2 - 1) * (1074-808);
    s2pTot.Left := s2pTot.Left - (12 - c2 - 1) * (1074-808);
    s3pTot.Left := s3pTot.Left - (12 - c2 - 1) * (1074-808);
    s1cTot.Left := s1cTot.Left - (12 - c2 - 1) * (1074-808);
    s2cTot.Left := s2cTot.Left - (12 - c2 - 1) * (1074-808);
    s3cTot.Left := s3cTot.Left - (12 - c2 - 1) * (1074-808);
    s1uTot.Left := s1uTot.Left - (12 - c2 - 1) * (1074-808);
    s2uTot.Left := s2uTot.Left - (12 - c2 - 1) * (1074-808);
    s3uTot.Left := s3uTot.Left - (12 - c2 - 1) * (1074-808);
    rpMapaResumoTrein.PrinterSetup.PaperWidth := 4110 - (12 - c2 - 1) * (1074-808);
    lin0.Width := lin0.Width - (12 - c2 - 1) * (1074-808);
    lin1.Width := lin1.Width - (12 - c2 - 1) * (1074-808);
    lin2.Width := lin2.Width - (12 - c2 - 1) * (1074-808);
    lin3.Width := lin3.Width - (12 - c2 - 1) * (1074-808);
  end;


  sqlMapaResumoTrein.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    // LOOP para todas as linhas
    repeat
      CdsMapaResumoTrein.Insert;
      CdsMapaResumoTrein.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
      CdsMapaResumoTrein.FieldByName('DESCRICAO').asString := dmCds.Cds.FieldByName('DESCRICAO').asString;
      CdsMapaResumoTrein.FieldByName('PERIODO').asString := dmCds.Cds.FieldByName('PERIODO').asString;
      CdsMapaResumoTrein.FieldByName('MES').asString := dmCds.Cds.FieldByName('MES').asString;
      CdsMapaResumoTrein.FieldByName('TIPO').asString := dmCds.Cds.FieldByName('TIPO').asString;
      CdsMapaResumoTrein.FieldByName('GRUPO').asString := dmCds.Cds.FieldByName('GRUPO').asString;

      CdsMapaResumoTrein.FieldByName('PART_TOT').asInteger := 0;
      CdsMapaResumoTrein.FieldByName('CARGA_TOT').asFloat := 0;
      CdsMapaResumoTrein.FieldByName('CUSTO_TOT').asFloat := 0;

      s1 := dmCds.Cds.FieldByName('EMPRESA').asString;
      s2 := dmCds.Cds.FieldByName('DESCRICAO').asString;
      s3 := dmCds.Cds.FieldByName('MES').asString;
      s4 := dmCds.Cds.FieldByName('TIPO').asString;
      s5 := dmCds.Cds.FieldByName('GRUPO').asString;

      // Preencho os nomes do cabeçalho
      for c:=1 to c2+1 do
        CdsMapaResumoTrein.FieldByName('NOME_'+IntToStr(c)).asString := sNome[c];

      // Preencho UMA Linha
      repeat
        for c:=1 to c2+1 do
          if (sNome[c] = dmCds.Cds.FieldByName('GRUPO2').asString) then
            break;

        if c > c2+1 then
          c := c2+1;

        CdsMapaResumoTrein.FieldByName('PART_'+IntToStr(c)).asInteger :=
                                        dmCds.Cds.FieldByName('PARTICIPANTES').asInteger;
        CdsMapaResumoTrein.FieldByName('CARGA_'+IntToStr(c)).asFloat :=
                                        dmCds.Cds.FieldByName('DUR_TOT').asFloat;
        CdsMapaResumoTrein.FieldByName('CUSTO_'+IntToStr(c)).asFloat :=
                                        dmCds.Cds.FieldByName('CUSTO').asFloat;
        CdsMapaResumoTrein.FieldByName('PART_TOT').asInteger :=
                     CdsMapaResumoTrein.FieldByName('PART_TOT').asInteger +
                                        dmCds.Cds.FieldByName('PARTICIPANTES').asInteger;
        CdsMapaResumoTrein.FieldByName('CARGA_TOT').asFloat :=
                     CdsMapaResumoTrein.FieldByName('CARGA_TOT').asFloat +
                                        dmCds.Cds.FieldByName('DUR_TOT').asFloat;
        CdsMapaResumoTrein.FieldByName('CUSTO_TOT').asFloat :=
                     CdsMapaResumoTrein.FieldByName('CUSTO_TOT').asFloat +
                                        dmCds.Cds.FieldByName('CUSTO').asFloat;
        dmCds.Cds.Next;
      until (s1 <> dmCds.Cds.FieldByName('EMPRESA').asString) or
            (s2 <> dmCds.Cds.FieldByName('DESCRICAO').asString) or
            (s3 <> dmCds.Cds.FieldByName('MES').asString) or
            (s4 <> dmCds.Cds.FieldByName('TIPO').asString) or
            (s5 <> dmCds.Cds.FieldByName('GRUPO').asString) or
            (dmCds.Cds.EOF);

      CdsMapaResumoTrein.Post;
    until (dmCds.Cds.EOF);
  end
  else
  begin
    CdsMapaResumoTrein.Insert;
    CdsMapaResumoTrein.Post;
  end;
  CdsMapaResumoTrein.First;
end;

end.
