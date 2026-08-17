// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  13/05/2009
// Pendência   : SOL 116806 KINTANA 549481
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RMapaResumoTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, ppBands, ppCache, ppClass, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  ppCtrls, ppPrnabl, ppVar, ppStrtch, ppSubRpt, ppRegion, ppMemo, TXRB;

type
  TRptMapaResumoTrein = class(TFrmCmReport)
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
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel9: TppLabel;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel2: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel12: TppLabel;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    ppDBText38: TppDBText;
    ppLine2: TppLine;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppDBCalc5: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterTipo: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel3: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel5: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLine5: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterEmpresa: TppGroupFooterBand;
    ppDBText5: TppDBText;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppLine6: TppLine;
    ppDBCalc12: TppDBCalc;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  end;

var
  RptMapaResumoTrein: TRptMapaResumoTrein;

implementation

uses uCtrlFuncoesRH, uSistema;

{$R *.DFM}

procedure TRptMapaResumoTrein.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  ppGroupFooterEmpresa.Visible := CmpRptCM.ParamByName('Consolida').asInteger = 1;

  with (sqlMapaResumoTrein.SQL) do
  begin
    Clear;
    Add('SELECT EMPRESA, DESCRICAO, MESORDEM,');
    Add('    DECODE(TIPO,NULL,''Tipo Não Identificado'',TIPO) AS TIPO,');
    Add('    DECODE(GRUPO,NULL,''Grupo Não Identificado'',GRUPO) AS GRUPO, PERIODO, MES,');
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

      Add('   TP.DESCRICAO AS TIPO, G.DESCGRPTREIN AS GRUPO, H.IDPESSOA,');
      Add('   CU.DESCRICAO, (H.DUR_PRAT + H.DUR_TEOR) AS DUR_TOT,');
      Add('   (NVL(H.VALOR,0) ');
      if CmpRptCM.ParamByName('TipoCusto').asInteger = 0 then
        Add('  + NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0) ');
      Add('   ) AS CUSTO,');
      Add('''Período: '' || ' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+' || '' a ''');
      Add('   || ' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ' AS PERIODO,');
      Add('   CU.DESCRICAO || TO_CHAR(DECODE(DATREFIM,NULL,DATPLFIM,DATREFIM),''YYYYMM'') AS MESORDEM,');
      Add('   DECODE(TO_CHAR(DECODE(DATREFIM,NULL,DATPLFIM,DATREFIM),''MM''),');
      Add('   ''01'',''Jan'',''02'',''Fev'',''03'',''Mar'',''04'',''Abr'',');
      Add('   ''05'',''Mai'',''06'',''Jun'',''07'',''Jul'',''08'',''Ago'',');
      Add('   ''09'',''Set'',''10'',''Out'',''11'',''Nov'',''Dez'') || ');
      Add('   TO_CHAR(DECODE(DATREFIM,NULL,DATPLFIM,DATREFIM),''/YYYY'') AS MES');

      Add('FROM PESSOA PJ, PESSOA PF, HSTTRN H, FUNCIONARIO F, CURSO CU, GRPTREIN G, TIPCURSO TP');

      if CmpRptCM.ParamByName('TipoGrupo').asInteger = 1 then
         Add(', CARGO CG');

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

      if CmpRptCM.ParamByName('TipoGrupo').asInteger = 1 then
      begin
         Add('AND     F.IDCARGO       = CG.IDCARGO');
         Add('AND     CG.CODGRPTREIN  = G.CODGRPTREIN(+)');
      end
      else
         Add('AND     CU.CODGRPTREIN  = G.CODGRPTREIN(+)');

      Add('AND     CU.IDTIPOCURSO    = TP.IDTIPOCURSO(+)');
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

      Add('   TP.DESCRICAO AS TIPO, G.DESCGRPTREIN AS GRUPO, H.IDPESSOA,');
      Add('   CU.DESCRICAO, (H.DUR_PRAT + H.DUR_TEOR) AS DUR_TOT,');
      Add('   (NVL(H.VALOR,0) ');
      if CmpRptCM.ParamByName('TipoCusto').asInteger = 0 then
        Add('  + NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0) ');
      Add('   ) AS CUSTO,');
      Add('''Período: '' || ' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+' || '' a ''');
      Add('   || ' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ' AS PERIODO,');
      Add('   CU.DESCRICAO || TO_CHAR(DECODE(DATREFIM,NULL,DATPLFIM,DATREFIM),''YYYYMM'') AS MESORDEM,');
      Add('   DECODE(TO_CHAR(DECODE(DATREFIM,NULL,DATPLFIM,DATREFIM),''MM''),');
      Add('   ''01'',''Jan'',''02'',''Fev'',''03'',''Mar'',''04'',''Abr'',');
      Add('   ''05'',''Mai'',''06'',''Jun'',''07'',''Jul'',''08'',''Ago'',');
      Add('   ''09'',''Set'',''10'',''Out'',''11'',''Nov'',''Dez'') || ');
      Add('   TO_CHAR(DECODE(DATREFIM,NULL,DATPLFIM,DATREFIM),''/YYYY'') AS MES');

      Add('FROM PESSOA PF, HSTTRN H, CANDIDAT F, CURSO CU, GRPTREIN G, TIPCURSO TP');

      if CmpRptCM.ParamByName('TipoGrupo').asInteger = 1 then
         Add(', CARGO CG');

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
      Add('AND     H.IDCURSO    = CU.IDCURSO');
      Add('AND     H.IDPESSOA   = F.IDPESSOA');

      if CmpRptCM.ParamByName('TipoGrupo').asInteger = 1 then
      begin
         Add('AND     F.IDCARGO       = CG.IDCARGO');
         Add('AND     CG.CODGRPTREIN  = G.CODGRPTREIN(+)');
      end
      else
         Add('AND     CU.CODGRPTREIN  = G.CODGRPTREIN(+)');

      Add('AND     CU.IDTIPOCURSO    = TP.IDTIPOCURSO(+)');
    end;

    Add(' )');

    Add('GROUP BY EMPRESA, DESCRICAO, MESORDEM, GRUPO, TIPO, PERIODO, MES');
    Add('ORDER BY 1, 4, 3, 5');
    //ORDER BY EMPRESA, TIPO, MESORDEM, GRUPO

//    SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlMapaResumoTrein.Open;

  CdsMapaResumoTrein.First;
end;

end.
