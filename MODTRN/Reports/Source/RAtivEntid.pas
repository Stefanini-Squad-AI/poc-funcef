// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  02/07/2009
// Pendência   :  SOL 116915 KINTANA 559011
// Descricao   :  Alteração na Query conforme solicitação.
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  13/05/2009
// Pendência   :  SOL 116806 KINTANA 549481
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RAtivEntid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, ppBands, ppCache, ppClass, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  ppCtrls, ppPrnabl, ppVar, ppRegion, ppStrtch, ppSubRpt, uCtrlRegTrein,
  TXRB;

type
  TRptAtivEntid = class(TFrmCmReport)
    sqlAtivEntid: TCMSqlParams;
    CdsAtivEntid: TCMClientDataSet;
    dsAtivEntid: TwwDataSource;
    ppAtivEntid: TppBDEPipeline;
    rpAtivEntid: TppReport;
    rpAtivEntidDtlBnd: TppDetailBand;
    rpAtivEntidSmryBnd: TppSummaryBand;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppDBText3: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    ppLabel2: TppLabel;
    ppLabel7: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    rpAtivLblResultado: TppLabel;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel13: TppLabel;
    ppDBText4: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    ppResumoTrein: TppBDEPipeline;
    ppResumoTreinppField1: TppField;
    ppResumoTreinppField2: TppField;
    ppResumoTreinppField3: TppField;
    ppResumoTreinppField4: TppField;
    ppResumoTreinppField5: TppField;
    ppResumoTreinppField6: TppField;
    ppResumoTreinppField7: TppField;
    ppResumoTreinppField8: TppField;
    ppResumoTreinppField9: TppField;
    ppResumoTreinppField10: TppField;
    ppResumoTreinppField11: TppField;
    ppResumoTreinppField12: TppField;
    ppResumoTreinppField13: TppField;
    ppResumoTreinppField14: TppField;
    ppResumoTreinppField15: TppField;
    ppResumoTreinppField16: TppField;
    ppResumoTreinppField17: TppField;
    ppResumoTreinppField18: TppField;
    ppResumoTreinppField19: TppField;
    ppResumoTreinppField20: TppField;
    ppResumoTreinppField21: TppField;
    ppResumoTreinppField22: TppField;
    ppResumoTreinppField23: TppField;
    ppResumoTreinppField24: TppField;
    ppResumoTreinppField25: TppField;
    dsResumoTrein: TwwDataSource;
    CdsResumoTrein: TCMClientDataSet;
    sqlResumoTrein: TCMSqlParams;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine3: TppLine;
    rpResumoTreinLblPeriodo: TppLabel;
    rpResumoTreinDetalhe: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    rpResumoTreinRegDetalhe: TppRegion;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppLine2: TppLine;
    rpResumoTreinLinha1: TppLine;
    ppFooterBand1: TppFooterBand;
    rpResumoTreinSumario: TppSummaryBand;
    rpResumoTreinSomaQ1: TppDBCalc;
    rpResumoTreinSomaH1: TppDBCalc;
    rpResumoTreinSomaC1: TppDBCalc;
    rpResumoTreinSomaQ2: TppDBCalc;
    rpResumoTreinSomaH2: TppDBCalc;
    rpResumoTreinSomaC2: TppDBCalc;
    rpResumoTreinSomaQ3: TppDBCalc;
    rpResumoTreinSomaH3: TppDBCalc;
    rpResumoTreinSomaC3: TppDBCalc;
    rpResumoTreinSomaQ4: TppDBCalc;
    rpResumoTreinSomaH4: TppDBCalc;
    rpResumoTreinSomaC4: TppDBCalc;
    ppLabel34: TppLabel;
    rpResumoTreinRegSumario: TppRegion;
    ppShape3: TppShape;
    rpResumoTreinSomaQ5: TppDBCalc;
    rpResumoTreinSomaH5: TppDBCalc;
    rpResumoTreinSomaC5: TppDBCalc;
    rpResumoTreinPercQ2: TppLabel;
    rpResumoTreinPercH2: TppLabel;
    rpResumoTreinPercC2: TppLabel;
    rpResumoTreinPercQ3: TppLabel;
    rpResumoTreinPercH3: TppLabel;
    rpResumoTreinPercC3: TppLabel;
    rpResumoTreinPercQ4: TppLabel;
    rpResumoTreinPercH4: TppLabel;
    rpResumoTreinPercC4: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppDBText9: TppDBText;
    ppDBText38: TppDBText;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpAtivEntidDtlBndBeforePrint(Sender: TObject);
    procedure GravarQueryResumo;
    procedure rpResumoTreinSomaQ5Calc(Sender: TObject);
    procedure rpResumoTreinSomaH5Calc(Sender: TObject);
    procedure rpResumoTreinSomaC5Calc(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlRegTrein: TCtrlRegTrein;
    sAno1, sAno2: string;
  end;

var
  RptAtivEntid: TRptAtivEntid;

implementation

uses dCds, uSistema, uCtrlUsoGeralRH, uCtrlPadroes;

{$R *.DFM}

procedure TRptAtivEntid.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRegTrein := TCtrlRegTrein.Create(false, Sistema.UsaRAD, false, false, Sistema.IdEmpresa,
    Sistema.IdUsuario, Sistema.NomeUsuario, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRegTrein.InitializeAs(Padroes);
end;

procedure TRptAtivEntid.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlAtivEntid.SQL) do
  begin
    Clear;
    if CmpRptCM.ParamByName('Consolida').asInteger = 1 then // Normal: NÃO consolida
    begin
      Add('SELECT');
      Add('PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO,');

      if (not CmpRptCM.ParamByName('Candidatos').asBoolean) then
        Add('   CC.NOME AS CENTROCUSTO, F.MATRICULA,')
      else
        Add('   ''Candidato Externo'' AS CENTROCUSTO, TO_CHAR(PF.IDPESSOA) AS MATRICULA,');

//Ádler - CASE: TOTAL DE HORAS POR PERIODO - INÍCIO - SOL N°116915 KTN N°559011

      Add('   CU.DESCRICAO, CU.IDCURSO, ');
//      Add(' H.DUR_PRAT + H.DUR_TEOR AS DUR_TOT, NVL(H.VALOR,0) ');
//      if CmpRptCM.ParamByName('TipoCusto').asInteger = 0 then
//        Add('  + NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0) ');
//      Add('   AS CUSTO,');
      Add('CASE ');
      Add('  WHEN (TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataIni').asString) +',''DD/MM/YYYY'') = TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataFim').asString) +',''DD/MM/YYYY'')) THEN');
      Add('    ROUND(((H.DUR_PRAT + H.DUR_TEOR) / (H.DATREFIM - H.DATREINI + 1)) * 1,2)');

      Add('  WHEN (H.DATREINI <= TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataIni').asString) +',''DD/MM/YYYY'')) AND');
      Add('       (H.DATREFIM <= TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataFim').asString) +',''DD/MM/YYYY'')) THEN');
      Add('       ROUND(((H.DUR_PRAT + H.DUR_TEOR) / (H.DATREFIM - H.DATREINI + 1)) *');
      Add('       (H.DATREFIM - TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataIni').asString) +', ''DD/MM/YYYY'') + 1),2)');

      Add('  WHEN (H.DATREINI <= TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataIni').asString) +',''DD/MM/YYYY'')) AND');
      Add('       (H.DATREFIM >= TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataFim').asString) +',''DD/MM/YYYY'')) THEN');
      Add('       ROUND(((H.DUR_PRAT + H.DUR_TEOR) / (H.DATREFIM - H.DATREINI + 1)) *');
      Add('       (TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataFim').asString) +', ''DD/MM/YYYY'') - TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataIni').asString) +', ''DD/MM/YYYY'') + 1),2) ');

      Add('  WHEN (H.DATREINI >= TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataIni').asString) +',''DD/MM/YYYY'')) AND');
      Add('       (H.DATREFIM <= TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataFim').asString) +',''DD/MM/YYYY'')) THEN');
      Add('       ROUND(((H.DUR_PRAT + H.DUR_TEOR) / (H.DATREFIM - H.DATREINI + 1)) *');
      Add('       (H.DATREFIM - H.DATREINI + 1),2)');

      Add('  ELSE ROUND(((H.DUR_PRAT + H.DUR_TEOR) / (H.DATREFIM - H.DATREINI + 1)) *');
      Add('       (TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataFim').asString) +', ''DD/MM/YYYY'') - H.DATREINI + 1),2)');

      Add('END AS DUR_TOT,');
//Ádler - CASE: TOTAL DE HORAS POR PERIODO - FIM - SOL N°116915 KTN N°559011

//Ádler - CASE: TOTAL CUSTO POR PERIODO - INÍCIO - SOL N°116915 KTN N°559011
      Add('CASE ');
      Add('  WHEN (TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataIni').asString) +',''DD/MM/YYYY'') = TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataFim').asString) +',''DD/MM/YYYY'')) THEN');
         if CmpRptCM.ParamByName('TipoCusto').asInteger = 0 then
      Add('       ROUND(((NVL(H.VALOR, 0) + NVL(H.DESP_VIAG, 0) + NVL(H.DESP_ESTAD, 0) + NVL(H.DESP_OUTR, 0))')
        else
      Add('       ROUND((NVL(H.VALOR, 0)');
      Add('       /(H.DATREFIM - H.DATREINI + 1)) * 1,2)');

      Add('  WHEN (H.DATREINI <= TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataIni').asString) +',''DD/MM/YYYY'')) AND');
      Add('       (H.DATREFIM <= TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataFim').asString) +',''DD/MM/YYYY'')) THEN');
        if CmpRptCM.ParamByName('TipoCusto').asInteger = 0 then
      Add('        ROUND(((NVL(H.VALOR, 0) + NVL(H.DESP_VIAG, 0) + NVL(H.DESP_ESTAD, 0) + NVL(H.DESP_OUTR, 0))')
        else
      Add(' ROUND((NVL(H.VALOR, 0)');
      Add('/(H.DATREFIM - H.DATREINI + 1)) *');
      Add('       (H.DATREFIM - TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataIni').asString) +', ''DD/MM/YYYY'') + 1),2)');

      Add('  WHEN (H.DATREINI <= TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataIni').asString) +',''DD/MM/YYYY'')) AND');
      Add('       (H.DATREFIM >= TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataFim').asString) +',''DD/MM/YYYY'')) THEN');
        if CmpRptCM.ParamByName('TipoCusto').asInteger = 0 then
      Add('        ROUND(((NVL(H.VALOR, 0) + NVL(H.DESP_VIAG, 0) + NVL(H.DESP_ESTAD, 0) + NVL(H.DESP_OUTR, 0))')
        else
      Add('ROUND((NVL(H.VALOR, 0)');
      Add('/(H.DATREFIM - H.DATREINI + 1)) *');
      Add('       (TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataFim').asString) +', ''DD/MM/YYYY'') - TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataIni').asString) +', ''DD/MM/YYYY'') + 1),2) ');

      Add('  WHEN (H.DATREINI >= TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataIni').asString) +',''DD/MM/YYYY'')) AND');
      Add('       (H.DATREFIM <= TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataFim').asString) +',''DD/MM/YYYY'')) THEN');
        if CmpRptCM.ParamByName('TipoCusto').asInteger = 0 then
      Add('        ROUND(((NVL(H.VALOR, 0) + NVL(H.DESP_VIAG, 0) + NVL(H.DESP_ESTAD, 0) + NVL(H.DESP_OUTR, 0))')
        else
      Add('ROUND((NVL(H.VALOR, 0)');
      Add('/(H.DATREFIM - H.DATREINI + 1)) *');
      Add('       (H.DATREFIM - H.DATREINI + 1),2)');

      Add('  ELSE ');
              if CmpRptCM.ParamByName('TipoCusto').asInteger = 0 then
      Add('        ROUND(((NVL(H.VALOR, 0) + NVL(H.DESP_VIAG, 0) + NVL(H.DESP_ESTAD, 0) + NVL(H.DESP_OUTR, 0))')
        else
      Add('ROUND((NVL(H.VALOR, 0)');
      Add('/(H.DATREFIM - H.DATREINI + 1)) *');
      Add('       (TO_DATE('+ QuotedStr(CmpRptCM.ParamByName('DataFim').asString) +',''DD/MM/YYYY'') - H.DATREINI + 1),2)');

      Add('END AS CUSTO,');
//Ádler - CASE: TOTAL CUSTO POR PERIODO - FIM - SOL N°116915 KTN N°559011

      Add('   H.VALOR, H.DESP_VIAG, H.DESP_ESTAD, H.DESP_OUTR, '); // Pend. 25534
      Add('   H.DATREINI, H.DATREFIM, H.AVALPRAT, H.AVALTEOR,');
      Add('   EN.NOME AS ENTIDADE, H.NUMSEQ, PF.IDPESSOA,');
      Add('''Período: '' || '+ QuotedStr(CmpRptCM.ParamByName('DataIni').asString) +' || '' a ''');
      Add('   || '+ QuotedStr(CmpRptCM.ParamByName('DataFim').asString) +' AS PERIODO,');
      Add('   DECODE(H.DATREINI,NULL,H.DATPLINI,H.DATREINI) AS DATAINI,');
      Add('   DECODE(H.DATREFIM,NULL,H.DATPLFIM,H.DATREFIM) AS DATAFIM,');
      Add('   H.DATPLFIM, H.FLGAVALTEOR, H.AVALTEOR, CU.AVALIACAO AS MINTEOR,');
      Add('               H.FLGAVALPRAT, H.AVALPRAT, CU.AVALPRAT AS MINPRAT,');
      Add('   DECODE(NVL(H.FLGAVALCURS,0), 0, ''NA'', TO_CHAR(H.AVALCURSO)) AS AVALCURSOREL,');
      Add('   CASE WHEN H.DATREFIM IS NOT NULL THEN ''Realizado''');
      Add('        WHEN H.DATREINI IS NOT NULL THEN ''Iniciado''');
      Add('        WHEN H.DATPLINI IS NOT NULL THEN ''Programado''');
      Add('        ELSE ''A Programar''');
      Add('   END AS STATUS,');
      Add('   DECODE(H.DATREINI, NULL, H.DATPLINI, H.DATREINI) AS DATREF, CU.IDTIPOCURSO,');

      if (not CmpRptCM.ParamByName('Candidatos').asBoolean) then
        Add('   F.CODCENTROCUSTO,')
      else
        Add('   '' '' AS CODCENTROCUSTO,');

      Add('   LP.PRESENCAS ');

      Add('FROM PESSOA PJ, PESSOA PF, PESSOA EN, HSTTRN H, CARGO C, CURSO CU,');

      if (not CmpRptCM.ParamByName('Candidatos').asBoolean) then
        Add('     FUNCIONARIO F, CENTCUST CC,')
      else
        Add('     CANDIDAT F,');

      Add('  (SELECT IDPESSOA, IDCURSO, NUMSEQ, COUNT(*) AS PRESENCAS FROM LISTAPRESENCA L ');
      Add('   WHERE ');
      Add('   L.DATAPRESENCA BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
      Add('   AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY'') ');
      Add('   GROUP BY IDPESSOA, IDCURSO, NUMSEQ) LP ');

      Add('WHERE   F.IDPESSOA = PF.IDPESSOA');

      if CmpRptCM.ParamByName('IncPorConta').asInteger = 1 then
        Add('AND     H.FLGCONTROLE = 1');

      if CmpRptCM.ParamByName('Origem').asInteger > 0 then
        if CmpRptCM.ParamByName('Origem').asInteger = 1 then
          Add('AND     H.IDMODULO = 72')
        else
        if CmpRptCM.ParamByName('Origem').asInteger = 2 then
          Add('AND     H.IDMODULO = 70')
        else
        if CmpRptCM.ParamByName('Origem').asInteger = 3 then
          Add('AND     H.IDMODULO = 73');

      if CmpRptCM.ParamByName('ListaCurso').asString <> '' then
        Add('AND     CU.IDCURSO IN (' +CmpRptCM.ParamByName('ListaCurso').asString+ ')');

      if CmpRptCM.ParamByName('ListaEntid').asString <> '' then
        Add('AND     H.IDENTIDINSTR IN (' +CmpRptCM.ParamByName('ListaEntid').asString+ ')');

      Add('AND     F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')');

      if (not CmpRptCM.ParamByName('Candidatos').asBoolean) then
        Add('AND     F.IDESTAB  = PJ.IDPESSOA')
      else
        Add('AND     PJ.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));


      Add('AND     (');

      if (CmpRptCM.ParamByName('SelCurso1').asBoolean) then
      begin
        //Ádler Teodoro de Souza - SOL N°116915 KTN N°559011 - INÍCIO
        //        Add('   (H.DATPLINI IS NOT NULL AND');
        Add('    ((H.DATREINI BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY''))');
        //Ádler Teodoro de Souza - SOL N°116915 KTN N°559011 - FIM
      end;

      if (CmpRptCM.ParamByName('SelCurso2').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('SelCurso1').asBoolean) then
        //Ádler Teodoro de Souza - SOL N°116915 KTN N°559011 - INÍCIO
          Add('    OR');

        //  Add('   (H.DATPLINI IS NULL AND');
        Add('    (H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY'')))');

        Add('OR (TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ', ''DD/MM/YYYY'') BETWEEN H.DATREINI AND H.DATREFIM)');
        Add('OR (TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ', ''DD/MM/YYYY'') BETWEEN H.DATREINI AND H.DATREFIM)');
        //Ádler Teodoro de Souza - SOL N°116915 KTN N°559011 - FIM
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
      Add('AND     F.IDCARGO    = C.IDCARGO');
      Add('AND     H.IDCURSO    = CU.IDCURSO');
      Add('AND     H.IDPESSOA   = F.IDPESSOA');
      if (not CmpRptCM.ParamByName('Candidatos').asBoolean) then
      begin
        Add('AND     F.IDEMPRESA  = CC.IDEMPRESA');
        Add('AND     F.CODCENTROCUSTO  = CC.CODCENTROCUSTO');
      end;
      Add('AND     H.IDENTIDINSTR    = EN.IDPESSOA');
      Add('AND     H.IDPESSOA        = LP.IDPESSOA(+)');
      Add('AND     H.IDCURSO         = LP.IDCURSO(+)');
      Add('AND     H.NUMSEQ          = LP.NUMSEQ(+)');
    end
    else
    begin
      Add('SELECT');
      Add('PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO,');

      if (not CmpRptCM.ParamByName('Candidatos').asBoolean) then
        Add('   CC.NOME AS CENTROCUSTO, F.MATRICULA,')
      else
        Add('   ''Candidato Externo'' AS CENTROCUSTO, TO_CHAR(PF.IDPESSOA) AS MATRICULA,');

      Add('   CU.DESCRICAO, CU.IDCURSO, H.DUR_TOT, H.CUSTO,');
      Add('   H.DATREINI, H.DATREFIM, 0 AS AVALPRAT, 0 AS AVALTEOR,');
      Add('   EN.NOME AS ENTIDADE, -1 AS NUMSEQ, PF.IDPESSOA,');
      Add('''Período: '' || ' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+' || '' a ''');
      Add('   || ' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ' AS PERIODO,');
      Add('   H.DATREINI AS DATAINI, H.DATREFIM AS DATAFIM,');
      Add('   H.DATREFIM AS DATPLFIM, 0 AS FLGAVALTEOR, 0 AS AVALTEOR, CU.AVALIACAO AS MINTEOR,');
      Add('               0 AS FLGAVALPRAT, 0 AS AVALPRAT, CU.AVALPRAT AS MINPRAT,');
      Add('   H.AVALCURSOREL,');
      Add('   ''NA'' AS STATUS,');
      Add('   H.DATREINI AS DATREF, CU.IDTIPOCURSO,');

      if (not CmpRptCM.ParamByName('Candidatos').asBoolean) then
        Add('   F.CODCENTROCUSTO,')
      else
        Add('   '' '' AS CODCENTROCUSTO,');

      Add('   LP.PRESENCAS ');

      Add('FROM PESSOA PJ, PESSOA PF, PESSOA EN, CARGO C, CURSO CU,');

      if (not CmpRptCM.ParamByName('Candidatos').asBoolean) then
        Add('     FUNCIONARIO F, CENTCUST CC,')
      else
        Add('     CANDIDAT F,');

      Add('  (SELECT IDPESSOA, IDCURSO, COUNT(*) AS PRESENCAS FROM LISTAPRESENCA L ');
      Add('   WHERE ');
      Add('   L.DATAPRESENCA BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
      Add('   AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY'') ');
      Add('   GROUP BY IDPESSOA, IDCURSO) LP, ');

      Add('     (SELECT IDPESSOA, IDCURSO, IDMODULO, IDENTIDINSTR,');
      Add('      SUM(H.DUR_PRAT + H.DUR_TEOR) AS DUR_TOT,');
      Add('      SUM(NVL(H.VALOR,0)');
      Add('      + NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0)) AS CUSTO,');
      Add('      SUM(NVL(H.VALOR,0)) AS VALOR, SUM(NVL(H.DESP_VIAG,0)) AS DESP_VIAG,'); // Pend. 25534
      Add('      SUM(NVL(H.DESP_ESTAD,0)) AS DESP_ESTAD, SUM(NVL(H.DESP_OUTR,0)) AS DESP_OUTR,'); // Pend. 25534
      Add('      LEAST(DECODE(MIN(DATPLINI),NULL,MIN(DATREINI),MIN(DATPLINI)),DECODE(MIN(DATREFIM),NULL,MIN(DATPLFIM),MIN(DATREFIM))) AS DATREINI,');
      Add('      GREATEST(DECODE(MAX(DATPLFIM),NULL,MAX(DATREFIM),MAX(DATPLFIM)),DECODE(MAX(DATREFIM),NULL,MAX(DATPLFIM),MAX(DATREFIM))) AS DATREFIM,');
      Add('      DECODE(SUM(NVL(H.FLGAVALCURS,0)), 0, ''NA'', TO_CHAR(AVG(NVL(H.AVALCURSO,0)))) AS AVALCURSOREL');
      Add('      FROM HSTTRN H');
      Add('      WHERE (');
      if (CmpRptCM.ParamByName('SelCurso1').asBoolean) then
      begin
        //Ádler Teodoro de Souza - SOL N°116915 KTN N°559011 - INÍCIO
        //        Add('   (H.DATPLINI IS NOT NULL AND');

        Add('    ((H.DATREINI BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY''))');
        //Ádler Teodoro de Souza - SOL N°116915 KTN N°559011 - FIM
      end;

      if (CmpRptCM.ParamByName('SelCurso2').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('SelCurso1').asBoolean) then
        //Ádler Teodoro de Souza - SOL N°116915 KTN N°559011 - INÍCIO
          Add('    OR');
        //  Add('   (H.DATPLINI IS NULL AND');
        Add('    (H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY'')))');

        Add('OR (TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ', ''DD/MM/YYYY'') BETWEEN H.DATREINI AND H.DATREFIM)');
        Add('OR (TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ', ''DD/MM/YYYY'') BETWEEN H.DATREINI AND H.DATREFIM)');
        //Ádler Teodoro de Souza - SOL N°116915 KTN N°559011 - FIM

      {
//        Add('   (H.DATPLINI IS NOT NULL AND');
        Add('    (H.DATREINI BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY''))');
      end;

      if (CmpRptCM.ParamByName('SelCurso2').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('SelCurso1').asBoolean) then
          Add(' OR');

//        Add('   (H.DATPLINI IS NULL AND');
        Add('    (H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY''))');
      end;

      if (CmpRptCM.ParamByName('SelCurso3').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('SelCurso1').asBoolean) or
           (CmpRptCM.ParamByName('SelCurso2').asBoolean) then
          Add(' OR');

//        Add('   (H.DATREFIM IS NULL AND');
        Add('    H.DATPLFIM BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
        Add('    AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY''))');
        }
      end;

      if (CmpRptCM.ParamByName('SelCurso4').asBoolean) then
      begin
        if (CmpRptCM.ParamByName('SelCurso1').asBoolean) or
           (CmpRptCM.ParamByName('SelCurso2').asBoolean) or
           (CmpRptCM.ParamByName('SelCurso3').asBoolean) then
          Add(' OR');

//        Add('   (H.DATREINI IS NULL AND H.DATPLINI IS NULL)');
      end;
      Add(' )');

      if CmpRptCM.ParamByName('IncPorConta').asInteger = 1 then
        Add('AND     H.FLGCONTROLE = 1');

      if CmpRptCM.ParamByName('ListaEntid').asString <> '' then
        Add('AND     H.IDENTIDINSTR IN (' +CmpRptCM.ParamByName('ListaEntid').asString+ ')');

      Add('      GROUP BY IDPESSOA, IDCURSO, IDMODULO, IDENTIDINSTR  ) H');
      Add('WHERE   F.IDPESSOA = PF.IDPESSOA');

      if CmpRptCM.ParamByName('ListaCurso').asString <> '' then
        Add('AND     CU.IDCURSO IN (' +CmpRptCM.ParamByName('ListaCurso').asString+ ')');

      if CmpRptCM.ParamByName('Origem').asInteger > 0 then
        if CmpRptCM.ParamByName('Origem').asInteger = 1 then
          Add('AND     H.IDMODULO = 72')
        else
        if CmpRptCM.ParamByName('Origem').asInteger = 2 then
          Add('AND     H.IDMODULO = 70')
        else
        if CmpRptCM.ParamByName('Origem').asInteger = 3 then
          Add('AND     H.IDMODULO = 73');

      Add('AND     F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')');
      Add('AND     F.IDCARGO    = C.IDCARGO');
      Add('AND     H.IDCURSO    = CU.IDCURSO');
      Add('AND     H.IDPESSOA   = F.IDPESSOA');

      if (not CmpRptCM.ParamByName('Candidatos').asBoolean) then
      begin
        Add('AND     F.IDESTAB  = PJ.IDPESSOA');
        Add('AND     F.IDEMPRESA  = CC.IDEMPRESA');
        Add('AND     F.CODCENTROCUSTO  = CC.CODCENTROCUSTO');
      end
      else
        Add('AND     PJ.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));

      Add('AND     H.IDENTIDINSTR    = EN.IDPESSOA');
      Add('AND     H.IDPESSOA        = LP.IDPESSOA(+)');
      Add('AND     H.IDCURSO         = LP.IDCURSO(+)');
    end;

    if CmpRptCM.ParamByName('SeqRelat').asInteger = 0 then
      Add('ORDER BY ENTIDADE, EMPREGADO, DATREF')
    else if CmpRptCM.ParamByName('SeqRelat').asInteger = 1 then
      Add('ORDER BY ENTIDADE, DATREF, EMPREGADO')
    else if CmpRptCM.ParamByName('SeqRelat').asInteger = 2 then
      Add('ORDER BY ENTIDADE, F.MATRICULA, DATREF')
    else if CmpRptCM.ParamByName('SeqRelat').asInteger = 3 then
      Add('ORDER BY ENTIDADE, DATREF, F.MATRICULA')
    else if CmpRptCM.ParamByName('SeqRelat').asInteger = 4 then
      Add('ORDER BY ENTIDADE, DESCRICAO, EMPREGADO, DATREF')
    else if CmpRptCM.ParamByName('SeqRelat').asInteger = 5 then
      Add('ORDER BY ENTIDADE, DESCRICAO, DATREF, EMPREGADO')
    else if CmpRptCM.ParamByName('SeqRelat').asInteger = 6 then
      Add('ORDER BY ENTIDADE, DESCRICAO, F.MATRICULA, DATREF')
    else
      Add('ORDER BY ENTIDADE, DESCRICAO, DATREF, F.MATRICULA');

//    SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlAtivEntid.Open;

  rpResumoTreinLblPeriodo.Caption := CdsAtivEntid.FieldByName('PERIODO').asString;

  GravarQueryResumo;
  CdsAtivEntid.First;
end;

procedure TRptAtivEntid.rpAtivEntidDtlBndBeforePrint(Sender: TObject);
begin
  inherited;
  rpAtivLblResultado.Caption := 'NA';
  if (not CmpRptCM.ParamByName('AvalAluno').asBoolean) then
  begin
    if (not CdsAtivEntid.FieldByName('DATREFIM').IsNull) and
       ((CdsAtivEntid.FieldByName('FLGAVALTEOR').asInteger = 1) or
        (CdsAtivEntid.FieldByName('FLGAVALPRAT').asInteger = 1)) then
    begin
      rpAtivLblResultado.Caption := 'Aprovado(a)';
      if ((CdsAtivEntid.FieldByName('FLGAVALTEOR').asInteger = 1) and
          (CdsAtivEntid.FieldByName('AVALTEOR').asInteger <
           CdsAtivEntid.FieldByName('MINTEOR').asInteger)) or
         ((CdsAtivEntid.FieldByName('FLGAVALPRAT').asInteger = 1) and
          (CdsAtivEntid.FieldByName('AVALPRAT').asInteger <
           CdsAtivEntid.FieldByName('MINPRAT').asInteger)) then
           rpAtivLblResultado.Caption := 'Reprovado(a)';
    end;
  end
  else
  begin
    if (not CdsAtivEntid.FieldByName('DATREFIM').IsNull) and
       (CdsAtivEntid.FieldByName('FLGAVALTEOR').asInteger = 1) then
    begin
      rpAtivLblResultado.Caption := 'Aprovado(a)';
      if ((CdsAtivEntid.FieldByName('FLGAVALTEOR').asInteger = 1) and
          (CtrlRegTrein.MediaAvaliacaoAlunoPorFatores(
           CdsAtivEntid.FieldByName('IDPESSOA').asFloat,
           CdsAtivEntid.FieldByName('IDCURSO').asFloat,
           CdsAtivEntid.FieldByName('NUMSEQ').asInteger) <
           CdsAtivEntid.FieldByName('MINTEOR').asInteger)) then
           rpAtivLblResultado.Caption := 'Reprovado(a)';
    end;

  end;

end;

procedure TRptAtivEntid.GravarQueryResumo;
begin
  sAno1 := copy(CmpRptCM.ParamByName('DataIni').AsString,7,4);
  sAno2 := copy(CmpRptCM.ParamByName('DataFim').AsString,7,4);

  if (sAno1 = sAno2) then
  with sqlResumoTrein.Sql do
  begin
    Clear;
    Add('SELECT COUNT(*) AS CONTA FROM ORCAMTREIN WHERE ANO = ' + sAno1);
    sqlResumoTrein.Open;
    if CdsResumoTrein.FieldByName('CONTA').AsInteger = 0 then
      sAno2 := 'XXXX';
  end;

  rpResumoTreinRegDetalhe.Visible := (sAno1 = sAno2);
  rpResumoTreinRegSumario.Visible := (sAno1 = sAno2);

  rpResumoTreinLinha1.Visible     := (sAno1 <> sAno2);

  with sqlResumoTrein.Sql do
  begin
    Clear;
    if (CmpRptCM.ParamByName('TipoResumo').AsInteger = 0) then
    begin
      Add('SELECT T.IDTIPOCURSO, T.DESCRICAO, ');
      Add('UPPER(T.DESCRICAO) AS DESCORDEM, ');
      Add('0 AS QT1, 0 AS HR1, 0 AS CT1, ');
      Add('0 AS QT2, 0 AS HR2, 0 AS CT2, ');
      Add('0 AS QT3, 0 AS HR3, 0 AS CT3, ');
      Add('0 AS QT4, 0 AS HR4, 0 AS CT4, ');
      Add('0 AS QT5, 0 AS HR5, 0 AS CT5, ');
      Add('''          '' AS QT6, ''          '' AS HR6, ''          '' AS CT6, ');
      Add('''          '' AS QT7, ''          '' AS HR7, ''          '' AS CT7, ');
      Add('''          '' AS QT8, ''          '' AS HR8, ''          '' AS CT8, ');

      if (sAno1 <> sAno2) then
        Add('0 AS TOTOCOR, 0 AS TOTHORAS, 0 AS TOTVALOR' )
      else
        Add('OC.TOTOCOR, OC.TOTHORAS, OC.TOTVALOR' );

      Add('FROM TIPCURSO T ');

      if (sAno1 = sAno2) then
      begin
        Add(', (SELECT C.IDTIPOCURSO, ');
        Add('        SUM(O.OCORRENCIAS) AS TOTOCOR, ');
        Add('        SUM(O.OCORRENCIAS*C.VALOR) AS TOTVALOR, ');
        Add('        SUM(C.DUR_PRAT + C.DUR_TEOR) AS TOTHORAS ');
        Add('  FROM ORCAMTREIN O, CURSO C ');
        Add('  WHERE O.IDCURSO = C.IDCURSO ');
        Add('  AND   O.ANO     = ' + sAno1);
        Add('  GROUP BY C.IDTIPOCURSO) OC ');
        Add('WHERE T.IDTIPOCURSO = OC.IDTIPOCURSO(+) ');
      end;
      Add('ORDER BY DESCORDEM');
    end
    else
    if (CmpRptCM.ParamByName('TipoResumo').AsInteger = 1) then
    begin
      Add('SELECT C.CODCENTROCUSTO, ' +
          'RTRIM(C.NOME) AS DESCRICAO, ' +
          'UPPER(RTRIM(C.NOME)) AS DESCORDEM, ' +
          '0 AS QT1, 0 AS HR1, 0 AS CT1, ' +
          '0 AS QT2, 0 AS HR2, 0 AS CT2, ' +
          '0 AS QT3, 0 AS HR3, 0 AS CT3, ' +
          '0 AS QT4, 0 AS HR4, 0 AS CT4, ' +
          '0 AS QT5, 0 AS HR5, 0 AS CT5, ' +
          '''          '' AS QT6, ''          '' AS HR6, ''          '' AS CT6, ' +
          '''          '' AS QT7, ''          '' AS HR7, ''          '' AS CT7, ' +
          '''          '' AS QT8, ''          '' AS HR8, ''          '' AS CT8, ');

      if (sAno1 <> sAno2) then
        Add('0 AS TOTOCOR, 0 AS TOTHORAS, 0 AS TOTVALOR' )
      else
        Add('OC.TOTOCOR, OC.TOTHORAS, OC.TOTVALOR' );

      Add('FROM CENTCUST C ');

      if (sAno1 = sAno2) then
        Add(', (SELECT O.CODCENTROCUSTO, ' +
            '        SUM(O.OCORRENCIAS) AS TOTOCOR, ' +
            '        SUM(O.OCORRENCIAS*C.VALOR) AS TOTVALOR, ' +
            '        SUM(C.DUR_PRAT + C.DUR_TEOR) AS TOTHORAS ' +
            '  FROM ORCAMTREIN O, CURSO C ' +
            '  WHERE O.IDCURSO = C.IDCURSO ' +
            '  AND   O.ANO     = ' + sAno1 +
            '  GROUP BY O.CODCENTROCUSTO) OC ' +
            'WHERE C.CODCENTROCUSTO = OC.CODCENTROCUSTO(+) ');
      Add('ORDER BY DESCORDEM');
    end
    else
    begin
      Add('SELECT U.IDTIPOCURSO, U.CODCENTROCUSTO, U.DESCRICAO, U.DESCORDEM,');
      Add('       SUM(U.QT1) AS QT1, SUM(U.HR1) AS HR1, SUM(U.CT1) AS CT1,');
      Add('       SUM(U.QT2) AS QT2, SUM(U.HR2) AS HR2, SUM(U.CT2) AS CT2,');
      Add('       SUM(U.QT3) AS QT3, SUM(U.HR3) AS HR3, SUM(U.CT3) AS CT3,');
      Add('       SUM(U.QT4) AS QT4, SUM(U.HR4) AS HR4, SUM(U.CT4) AS CT4,');
      Add('       SUM(U.QT5) AS QT5, SUM(U.HR5) AS HR5, SUM(U.CT5) AS CT5,');
      Add('       ''          '' AS QT6, ''          '' AS HR6, ''          '' AS CT6, ');
      Add('       ''          '' AS QT7, ''          '' AS HR7, ''          '' AS CT7, ');
      Add('       ''          '' AS QT8, ''          '' AS HR8, ''          '' AS CT8, ');
      Add('       SUM(U.TOTOCOR)  AS TOTOCOR,');
      Add('       SUM(U.TOTHORAS) AS TOTHORAS,');
      Add('       SUM(U.TOTVALOR) AS TOTVALOR');
      Add('FROM');
      Add('((');
      Add('SELECT T.IDTIPOCURSO, C.IDEMPRESA, C.CODCENTROCUSTO,');
      if (CmpRptCM.ParamByName('TipoResumo').AsInteger = 2) then
      begin
        Add('       RTRIM(T.DESCRICAO) || '' - '' || RTRIM(C.NOME) AS DESCRICAO,');
        Add('       UPPER(RTRIM(T.DESCRICAO) || '' - '' || RTRIM(C.NOME)) AS DESCORDEM,');
      end
      else
      begin
        Add('       RTRIM(C.NOME) || '' - '' || RTRIM(T.DESCRICAO) AS DESCRICAO,');
        Add('       UPPER(RTRIM(C.NOME) || '' - '' || RTRIM(T.DESCRICAO)) AS DESCORDEM,');
      end;
      Add('       0 AS QT1, 0 AS HR1, 0 AS CT1, 0 AS QT2, 0 AS HR2, 0 AS CT2,');
      Add('       0 AS QT3, 0 AS HR3, 0 AS CT3, 0 AS QT4, 0 AS HR4, 0 AS CT4,');
      Add('       0 AS QT5, 0 AS HR5, 0 AS CT5, ');
      Add('       0 AS TOTOCOR, 0 AS TOTHORAS, 0 AS TOTVALOR');
      Add('FROM TIPCURSO T, CENTCUST C )');
      if (sAno1 = sAno2) then
      begin
        Add('UNION');
        Add('(SELECT T.IDTIPOCURSO, C.IDEMPRESA, C.CODCENTROCUSTO,');
        if (CmpRptCM.ParamByName('TipoResumo').AsInteger = 2) then
        begin
          Add('       RTRIM(T.DESCRICAO) || '' - '' || RTRIM(C.NOME) AS DESCRICAO,');
          Add('       UPPER(RTRIM(T.DESCRICAO) || '' - '' || RTRIM(C.NOME)) AS DESCORDEM,');
        end
        else
        begin
          Add('       RTRIM(C.NOME) || '' - '' || RTRIM(T.DESCRICAO) AS DESCRICAO,');
          Add('       UPPER(RTRIM(C.NOME) || '' - '' || RTRIM(T.DESCRICAO)) AS DESCORDEM,');
        end;
        Add('       0 AS QT1, 0 AS HR1, 0 AS CT1, 0 AS QT2, 0 AS HR2, 0 AS CT2,');
        Add('       0 AS QT3, 0 AS HR3, 0 AS CT3, 0 AS QT4, 0 AS HR4, 0 AS CT4,');
        Add('       0 AS QT5, 0 AS HR5, 0 AS CT5, ');
        Add('       OC.TOTOCOR, OC.TOTHORAS, OC.TOTVALOR');
        Add(' FROM TIPCURSO T, CENTCUST C,');
        Add('     (SELECT C.IDTIPOCURSO,O.CODCENTROCUSTO, O.IDEMPRESA,');
        Add('             SUM(O.OCORRENCIAS) AS TOTOCOR,');
        Add('             SUM(O.OCORRENCIAS*C.VALOR) AS TOTVALOR,');
        Add('             SUM(C.DUR_PRAT + C.DUR_TEOR) AS TOTHORAS');
        Add('      FROM ORCAMTREIN O, CURSO C');
        Add('      WHERE O.IDCURSO = C.IDCURSO   AND   O.ANO = ' + sAno1);
        Add('      GROUP BY C.IDTIPOCURSO, O.CODCENTROCUSTO, O.IDEMPRESA) OC');
        Add('WHERE (T.IDTIPOCURSO    = OC.IDTIPOCURSO)');
        Add('  AND (C.CODCENTROCUSTO = OC.CODCENTROCUSTO)');
        Add('  AND (C.IDEMPRESA      = OC.IDEMPRESA) )');
      end;
      Add(' ) U');
      Add('GROUP BY U.IDTIPOCURSO, U.IDEMPRESA, U.CODCENTROCUSTO, U.DESCRICAO,');
      Add('         U.DESCORDEM');
      Add('ORDER BY DESCORDEM');
    end;

  end; // do with sqlResumoTrein.Sql

  sqlResumoTrein.Open;

  while not CdsAtivEntid.Eof do
  begin
    if (CmpRptCM.ParamByName('TipoResumo').AsInteger = 0) then
    begin
       if CdsResumoTrein.Locate('IDTIPOCURSO',CdsAtivEntid.FieldByName('IDTIPOCURSO').AsInteger,[]) then
       begin
          CdsResumoTrein.Edit;
          if (not CdsAtivEntid.FieldByName('DATREFIM').IsNull) and
             (not CdsAtivEntid.FieldByName('DATPLFIM').IsNull) then
          begin
            CdsResumoTrein.FieldByName('QT1').AsInteger := CdsResumoTrein.FieldByName('QT1').AsInteger + 1;
            CdsResumoTrein.FieldByName('HR1').AsInteger := CdsResumoTrein.FieldByName('HR1').AsInteger +
                                                           CdsAtivEntid.FieldByName('DUR_TOT').AsInteger;
            CdsResumoTrein.FieldByName('CT1').AsFloat := CdsResumoTrein.FieldByName('CT1').AsFloat +
                                                           CdsAtivEntid.FieldByName('CUSTO').AsFloat;
          end;
          if (not CdsAtivEntid.FieldByName('DATREFIM').IsNull) and
             (    CdsAtivEntid.FieldByName('DATPLFIM').IsNull) then
          begin
            CdsResumoTrein.FieldByName('QT2').AsInteger := CdsResumoTrein.FieldByName('QT2').AsInteger + 1;
            CdsResumoTrein.FieldByName('HR2').AsInteger := CdsResumoTrein.FieldByName('HR2').AsInteger +
                                                           CdsAtivEntid.FieldByName('DUR_TOT').AsInteger;
            CdsResumoTrein.FieldByName('CT2').AsFloat := CdsResumoTrein.FieldByName('CT2').AsFloat +
                                                           CdsAtivEntid.FieldByName('CUSTO').AsFloat;
          end;
          if (    CdsAtivEntid.FieldByName('DATREFIM').IsNull) and
             (not CdsAtivEntid.FieldByName('DATPLFIM').IsNull) then
          begin
            CdsResumoTrein.FieldByName('QT3').AsInteger := CdsResumoTrein.FieldByName('QT3').AsInteger + 1;
            CdsResumoTrein.FieldByName('HR3').AsInteger := CdsResumoTrein.FieldByName('HR3').AsInteger +
                                                           CdsAtivEntid.FieldByName('DUR_TOT').AsInteger;
            CdsResumoTrein.FieldByName('CT3').AsFloat := CdsResumoTrein.FieldByName('CT3').AsFloat +
                                                           CdsAtivEntid.FieldByName('CUSTO').AsFloat;
          end;
          if (CdsAtivEntid.FieldByName('DATREFIM').IsNull) and
             (CdsAtivEntid.FieldByName('DATPLFIM').IsNull) then
          begin
            CdsResumoTrein.FieldByName('QT4').AsInteger := CdsResumoTrein.FieldByName('QT4').AsInteger + 1;
            CdsResumoTrein.FieldByName('HR4').AsInteger := CdsResumoTrein.FieldByName('HR4').AsInteger +
                                                           CdsAtivEntid.FieldByName('DUR_TOT').AsInteger;
            CdsResumoTrein.FieldByName('CT4').AsFloat := CdsResumoTrein.FieldByName('CT4').AsFloat +
                                                           CdsAtivEntid.FieldByName('CUSTO').AsFloat;
          end;
          CdsResumoTrein.FieldByName('QT5').AsInteger := CdsResumoTrein.FieldByName('TOTOCOR').AsInteger;
          CdsResumoTrein.FieldByName('HR5').AsInteger := CdsResumoTrein.FieldByName('TOTHORAS').AsInteger;
          CdsResumoTrein.FieldByName('CT5').AsFloat := CdsResumoTrein.FieldByName('TOTVALOR').AsFloat;
          if (CdsResumoTrein.FieldByName('QT5').AsInteger > 0) then
          begin
            CdsResumoTrein.FieldByName('QT6').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('QT1').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT2').AsInteger) /
                                                            CdsResumoTrein.FieldByName('QT5').AsInteger * 100))+'%';
            CdsResumoTrein.FieldByName('QT7').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('QT1').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT2').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT3').AsInteger) /
                                                            CdsResumoTrein.FieldByName('QT5').AsInteger * 100))+'%';
            CdsResumoTrein.FieldByName('QT8').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('QT1').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT2').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT3').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT4').AsInteger) /
                                                            CdsResumoTrein.FieldByName('QT5').AsInteger * 100))+'%';

          end
          else
          begin
            CdsResumoTrein.FieldByName('QT6').AsString := '-  ';
            CdsResumoTrein.FieldByName('QT7').AsString := '-  ';
            CdsResumoTrein.FieldByName('QT8').AsString := '-  ';
          end;

          if (CdsResumoTrein.FieldByName('HR5').AsInteger > 0) then
          begin
            CdsResumoTrein.FieldByName('HR6').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('HR1').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR2').AsInteger) /
                                                            CdsResumoTrein.FieldByName('HR5').AsInteger * 100))+'%';
            CdsResumoTrein.FieldByName('HR7').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('HR1').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR2').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR3').AsInteger) /
                                                            CdsResumoTrein.FieldByName('HR5').AsInteger * 100))+'%';
            CdsResumoTrein.FieldByName('HR8').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('HR1').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR2').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR3').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR4').AsInteger) /
                                                            CdsResumoTrein.FieldByName('HR5').AsInteger * 100))+'%';

          end
          else
          begin
            CdsResumoTrein.FieldByName('HR6').AsString := '-  ';
            CdsResumoTrein.FieldByName('HR7').AsString := '-  ';
            CdsResumoTrein.FieldByName('HR8').AsString := '-  ';
          end;

          if (CdsResumoTrein.FieldByName('CT5').AsFloat > 0) then
          begin
            CdsResumoTrein.FieldByName('CT6').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('CT1').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT2').AsFloat) /
                                                            CdsResumoTrein.FieldByName('CT5').AsFloat * 100))+'%';
            CdsResumoTrein.FieldByName('CT7').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('CT1').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT2').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT3').AsFloat) /
                                                            CdsResumoTrein.FieldByName('CT5').AsFloat * 100))+'%';
            CdsResumoTrein.FieldByName('CT8').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('CT1').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT2').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT3').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT4').AsFloat) /
                                                            CdsResumoTrein.FieldByName('CT5').AsFloat * 100))+'%';

          end
          else
          begin
            CdsResumoTrein.FieldByName('CT6').AsString := '-  ';
            CdsResumoTrein.FieldByName('CT7').AsString := '-  ';
            CdsResumoTrein.FieldByName('CT8').AsString := '-  ';
          end;

          CdsResumoTrein.Post;
       end;
    end
    else
    if (CmpRptCM.ParamByName('TipoResumo').AsInteger = 1) then
    begin
       if CdsResumoTrein.Locate('CODCENTROCUSTO',CdsAtivEntid.FieldByName('CODCENTROCUSTO').AsString,[]) then
       begin
          CdsResumoTrein.Edit;
          if (not CdsAtivEntid.FieldByName('DATREFIM').IsNull) and
             (not CdsAtivEntid.FieldByName('DATPLFIM').IsNull) then
          begin
            CdsResumoTrein.FieldByName('QT1').AsInteger := CdsResumoTrein.FieldByName('QT1').AsInteger + 1;
            CdsResumoTrein.FieldByName('HR1').AsInteger := CdsResumoTrein.FieldByName('HR1').AsInteger +
                                                           CdsAtivEntid.FieldByName('DUR_TOT').AsInteger;
            CdsResumoTrein.FieldByName('CT1').AsFloat := CdsResumoTrein.FieldByName('CT1').AsFloat +
                                                           CdsAtivEntid.FieldByName('CUSTO').AsFloat;
          end;
          if (not CdsAtivEntid.FieldByName('DATREFIM').IsNull) and
             (    CdsAtivEntid.FieldByName('DATPLFIM').IsNull) then
          begin
            CdsResumoTrein.FieldByName('QT2').AsInteger := CdsResumoTrein.FieldByName('QT2').AsInteger + 1;
            CdsResumoTrein.FieldByName('HR2').AsInteger := CdsResumoTrein.FieldByName('HR2').AsInteger +
                                                           CdsAtivEntid.FieldByName('DUR_TOT').AsInteger;
            CdsResumoTrein.FieldByName('CT2').AsFloat := CdsResumoTrein.FieldByName('CT2').AsFloat +
                                                           CdsAtivEntid.FieldByName('CUSTO').AsFloat;
          end;
          if (    CdsAtivEntid.FieldByName('DATREFIM').IsNull) and
             (not CdsAtivEntid.FieldByName('DATPLFIM').IsNull) then
          begin
            CdsResumoTrein.FieldByName('QT3').AsInteger := CdsResumoTrein.FieldByName('QT3').AsInteger + 1;
            CdsResumoTrein.FieldByName('HR3').AsInteger := CdsResumoTrein.FieldByName('HR3').AsInteger +
                                                           CdsAtivEntid.FieldByName('DUR_TOT').AsInteger;
            CdsResumoTrein.FieldByName('CT3').AsFloat := CdsResumoTrein.FieldByName('CT3').AsFloat +
                                                           CdsAtivEntid.FieldByName('CUSTO').AsFloat;
          end;
          if (CdsAtivEntid.FieldByName('DATREFIM').IsNull) and
             (CdsAtivEntid.FieldByName('DATPLFIM').IsNull) then
          begin
            CdsResumoTrein.FieldByName('QT4').AsInteger := CdsResumoTrein.FieldByName('QT4').AsInteger + 1;
            CdsResumoTrein.FieldByName('HR4').AsInteger := CdsResumoTrein.FieldByName('HR4').AsInteger +
                                                           CdsAtivEntid.FieldByName('DUR_TOT').AsInteger;
            CdsResumoTrein.FieldByName('CT4').AsFloat := CdsResumoTrein.FieldByName('CT4').AsFloat +
                                                           CdsAtivEntid.FieldByName('CUSTO').AsFloat;
          end;
          CdsResumoTrein.FieldByName('QT5').AsInteger := CdsResumoTrein.FieldByName('TOTOCOR').AsInteger;
          CdsResumoTrein.FieldByName('HR5').AsInteger := CdsResumoTrein.FieldByName('TOTHORAS').AsInteger;
          CdsResumoTrein.FieldByName('CT5').AsFloat := CdsResumoTrein.FieldByName('TOTVALOR').AsFloat;
          if (CdsResumoTrein.FieldByName('QT5').AsInteger > 0) then
          begin
            CdsResumoTrein.FieldByName('QT6').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('QT1').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT2').AsInteger) /
                                                            CdsResumoTrein.FieldByName('QT5').AsInteger * 100))+'%';
            CdsResumoTrein.FieldByName('QT7').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('QT1').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT2').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT3').AsInteger) /
                                                            CdsResumoTrein.FieldByName('QT5').AsInteger * 100))+'%';
            CdsResumoTrein.FieldByName('QT8').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('QT1').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT2').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT3').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT4').AsInteger) /
                                                            CdsResumoTrein.FieldByName('QT5').AsInteger * 100))+'%';

          end
          else
          begin
            CdsResumoTrein.FieldByName('QT6').AsString := '-  ';
            CdsResumoTrein.FieldByName('QT7').AsString := '-  ';
            CdsResumoTrein.FieldByName('QT8').AsString := '-  ';
          end;

          if (CdsResumoTrein.FieldByName('HR5').AsInteger > 0) then
          begin
            CdsResumoTrein.FieldByName('HR6').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('HR1').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR2').AsInteger) /
                                                            CdsResumoTrein.FieldByName('HR5').AsInteger * 100))+'%';
            CdsResumoTrein.FieldByName('HR7').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('HR1').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR2').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR3').AsInteger) /
                                                            CdsResumoTrein.FieldByName('HR5').AsInteger * 100))+'%';
            CdsResumoTrein.FieldByName('HR8').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('HR1').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR2').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR3').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR4').AsInteger) /
                                                            CdsResumoTrein.FieldByName('HR5').AsInteger * 100))+'%';

          end
          else
          begin
            CdsResumoTrein.FieldByName('HR6').AsString := '-  ';
            CdsResumoTrein.FieldByName('HR7').AsString := '-  ';
            CdsResumoTrein.FieldByName('HR8').AsString := '-  ';
          end;

          if (CdsResumoTrein.FieldByName('CT5').AsFloat > 0) then
          begin
            CdsResumoTrein.FieldByName('CT6').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('CT1').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT2').AsFloat) /
                                                            CdsResumoTrein.FieldByName('CT5').AsFloat * 100))+'%';
            CdsResumoTrein.FieldByName('CT7').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('CT1').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT2').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT3').AsFloat) /
                                                            CdsResumoTrein.FieldByName('CT5').AsFloat * 100))+'%';
            CdsResumoTrein.FieldByName('CT8').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('CT1').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT2').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT3').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT4').AsFloat) /
                                                            CdsResumoTrein.FieldByName('CT5').AsFloat * 100))+'%';

          end
          else
          begin
            CdsResumoTrein.FieldByName('CT6').AsString := '-  ';
            CdsResumoTrein.FieldByName('CT7').AsString := '-  ';
            CdsResumoTrein.FieldByName('CT8').AsString := '-  ';
          end;

          CdsResumoTrein.Post;
       end;
    end
    else
    begin
       if CdsResumoTrein.Locate('IDTIPOCURSO;CODCENTROCUSTO',
            varArrayOf([CdsAtivEntid.FieldByName('IDTIPOCURSO').AsInteger,
                        CdsAtivEntid.FieldByName('CODCENTROCUSTO').AsString]),[]) then
       begin
          CdsResumoTrein.Edit;
          if (not CdsAtivEntid.FieldByName('DATREFIM').IsNull) and
             (not CdsAtivEntid.FieldByName('DATPLFIM').IsNull) then
          begin
            CdsResumoTrein.FieldByName('QT1').AsInteger := CdsResumoTrein.FieldByName('QT1').AsInteger + 1;
            CdsResumoTrein.FieldByName('HR1').AsInteger := CdsResumoTrein.FieldByName('HR1').AsInteger +
                                                           CdsAtivEntid.FieldByName('DUR_TOT').AsInteger;
            CdsResumoTrein.FieldByName('CT1').AsFloat := CdsResumoTrein.FieldByName('CT1').AsFloat +
                                                           CdsAtivEntid.FieldByName('CUSTO').AsFloat;
          end;
          if (not CdsAtivEntid.FieldByName('DATREFIM').IsNull) and
             (    CdsAtivEntid.FieldByName('DATPLFIM').IsNull) then
          begin
            CdsResumoTrein.FieldByName('QT2').AsInteger := CdsResumoTrein.FieldByName('QT2').AsInteger + 1;
            CdsResumoTrein.FieldByName('HR2').AsInteger := CdsResumoTrein.FieldByName('HR2').AsInteger +
                                                           CdsAtivEntid.FieldByName('DUR_TOT').AsInteger;
            CdsResumoTrein.FieldByName('CT2').AsFloat := CdsResumoTrein.FieldByName('CT2').AsFloat +
                                                           CdsAtivEntid.FieldByName('CUSTO').AsFloat;
          end;
          if (    CdsAtivEntid.FieldByName('DATREFIM').IsNull) and
             (not CdsAtivEntid.FieldByName('DATPLFIM').IsNull) then
          begin
            CdsResumoTrein.FieldByName('QT3').AsInteger := CdsResumoTrein.FieldByName('QT3').AsInteger + 1;
            CdsResumoTrein.FieldByName('HR3').AsInteger := CdsResumoTrein.FieldByName('HR3').AsInteger +
                                                           CdsAtivEntid.FieldByName('DUR_TOT').AsInteger;
            CdsResumoTrein.FieldByName('CT3').AsFloat := CdsResumoTrein.FieldByName('CT3').AsFloat +
                                                           CdsAtivEntid.FieldByName('CUSTO').AsFloat;
          end;
          if (CdsAtivEntid.FieldByName('DATREFIM').IsNull) and
             (CdsAtivEntid.FieldByName('DATPLFIM').IsNull) then
          begin
            CdsResumoTrein.FieldByName('QT4').AsInteger := CdsResumoTrein.FieldByName('QT4').AsInteger + 1;
            CdsResumoTrein.FieldByName('HR4').AsInteger := CdsResumoTrein.FieldByName('HR4').AsInteger +
                                                           CdsAtivEntid.FieldByName('DUR_TOT').AsInteger;
            CdsResumoTrein.FieldByName('CT4').AsFloat := CdsResumoTrein.FieldByName('CT4').AsFloat +
                                                           CdsAtivEntid.FieldByName('CUSTO').AsFloat;
          end;
          CdsResumoTrein.FieldByName('QT5').AsInteger := CdsResumoTrein.FieldByName('TOTOCOR').AsInteger;
          CdsResumoTrein.FieldByName('HR5').AsInteger := CdsResumoTrein.FieldByName('TOTHORAS').AsInteger;
          CdsResumoTrein.FieldByName('CT5').AsFloat := CdsResumoTrein.FieldByName('TOTVALOR').AsFloat;
          if (CdsResumoTrein.FieldByName('QT5').AsInteger > 0) then
          begin
            CdsResumoTrein.FieldByName('QT6').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('QT1').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT2').AsInteger) /
                                                            CdsResumoTrein.FieldByName('QT5').AsInteger * 100))+'%';
            CdsResumoTrein.FieldByName('QT7').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('QT1').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT2').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT3').AsInteger) /
                                                            CdsResumoTrein.FieldByName('QT5').AsInteger * 100))+'%';
            CdsResumoTrein.FieldByName('QT8').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('QT1').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT2').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT3').AsInteger +
                                                            CdsResumoTrein.FieldByName('QT4').AsInteger) /
                                                            CdsResumoTrein.FieldByName('QT5').AsInteger * 100))+'%';

          end
          else
          begin
            CdsResumoTrein.FieldByName('QT6').AsString := '-  ';
            CdsResumoTrein.FieldByName('QT7').AsString := '-  ';
            CdsResumoTrein.FieldByName('QT8').AsString := '-  ';
          end;

          if (CdsResumoTrein.FieldByName('HR5').AsInteger > 0) then
          begin
            CdsResumoTrein.FieldByName('HR6').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('HR1').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR2').AsInteger) /
                                                            CdsResumoTrein.FieldByName('HR5').AsInteger * 100))+'%';
            CdsResumoTrein.FieldByName('HR7').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('HR1').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR2').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR3').AsInteger) /
                                                            CdsResumoTrein.FieldByName('HR5').AsInteger * 100))+'%';
            CdsResumoTrein.FieldByName('HR8').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('HR1').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR2').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR3').AsInteger +
                                                            CdsResumoTrein.FieldByName('HR4').AsInteger) /
                                                            CdsResumoTrein.FieldByName('HR5').AsInteger * 100))+'%';

          end
          else
          begin
            CdsResumoTrein.FieldByName('HR6').AsString := '-  ';
            CdsResumoTrein.FieldByName('HR7').AsString := '-  ';
            CdsResumoTrein.FieldByName('HR8').AsString := '-  ';
          end;

          if (CdsResumoTrein.FieldByName('CT5').AsFloat > 0) then
          begin
            CdsResumoTrein.FieldByName('CT6').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('CT1').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT2').AsFloat) /
                                                            CdsResumoTrein.FieldByName('CT5').AsFloat * 100))+'%';
            CdsResumoTrein.FieldByName('CT7').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('CT1').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT2').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT3').AsFloat) /
                                                            CdsResumoTrein.FieldByName('CT5').AsFloat * 100))+'%';
            CdsResumoTrein.FieldByName('CT8').AsString := FloatToStr(Round((CdsResumoTrein.FieldByName('CT1').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT2').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT3').AsFloat +
                                                            CdsResumoTrein.FieldByName('CT4').AsFloat) /
                                                            CdsResumoTrein.FieldByName('CT5').AsFloat * 100))+'%';

          end
          else
          begin
            CdsResumoTrein.FieldByName('CT6').AsString := '-  ';
            CdsResumoTrein.FieldByName('CT7').AsString := '-  ';
            CdsResumoTrein.FieldByName('CT8').AsString := '-  ';
          end;

          CdsResumoTrein.Post;
       end;
    end;
    CdsAtivEntid.Next;
  end;

  CdsResumoTrein.Filtered := false;
  CdsResumoTrein.Filter   := 'QT1 + QT2 + QT3 + QT4 > 0';
  CdsResumoTrein.Filtered := true;
  CdsResumoTrein.IndexFieldNames := 'DESCORDEM';
  CdsResumoTrein.First;
end;

procedure TRptAtivEntid.rpResumoTreinSomaQ5Calc(Sender: TObject);
begin
  if (sAno1 = sAno2) and (rpResumoTreinSomaQ5.Value > 0) then
  begin
    rpResumoTreinPercQ2.Caption :=
     FloatToStr(Round((rpResumoTreinSomaQ1.Value +
     rpResumoTreinSomaQ2.Value) /
     rpResumoTreinSomaQ5.Value * 100)) + '%';
    rpResumoTreinPercQ3.Caption :=
     FloatToStr(Round((rpResumoTreinSomaQ1.Value +
     rpResumoTreinSomaQ2.Value +
     rpResumoTreinSomaQ3.Value) /
     rpResumoTreinSomaQ5.Value * 100)) + '%';
    rpResumoTreinPercQ4.Caption :=
     FloatToStr(Round((rpResumoTreinSomaQ1.Value +
     rpResumoTreinSomaQ2.Value +
     rpResumoTreinSomaQ3.Value +
     rpResumoTreinSomaQ4.Value) /
     rpResumoTreinSomaQ5.Value * 100)) + '%';
    end
  else
  begin
    rpResumoTreinPercQ2.Caption := '-';
    rpResumoTreinPercQ3.Caption := '-';
    rpResumoTreinPercQ4.Caption := '-';
  end;
end;

procedure TRptAtivEntid.rpResumoTreinSomaH5Calc(Sender: TObject);
begin
  if (sAno1 = sAno2) and (rpResumoTreinSomaH5.Value > 0) then
  begin
    rpResumoTreinPercH2.Caption :=
     FloatToStr(Round((rpResumoTreinSomaH1.Value +
     rpResumoTreinSomaH2.Value) /
     rpResumoTreinSomaH5.Value * 100)) + '%';
    rpResumoTreinPercH3.Caption :=
     FloatToStr(Round((rpResumoTreinSomaH1.Value +
     rpResumoTreinSomaH2.Value +
     rpResumoTreinSomaH3.Value) /
     rpResumoTreinSomaH5.Value * 100)) + '%';
    rpResumoTreinPercH4.Caption :=
     FloatToStr(Round((rpResumoTreinSomaH1.Value +
     rpResumoTreinSomaH2.Value +
     rpResumoTreinSomaH3.Value +
     rpResumoTreinSomaH4.Value) /
     rpResumoTreinSomaH5.Value * 100)) + '%';
    end
  else
  begin
    rpResumoTreinPercH2.Caption := '-';
    rpResumoTreinPercH3.Caption := '-';
    rpResumoTreinPercH4.Caption := '-';
  end;
end;

procedure TRptAtivEntid.rpResumoTreinSomaC5Calc(Sender: TObject);
begin
  if (sAno1 = sAno2) and (rpResumoTreinSomaC5.Value > 0) then
  begin
    rpResumoTreinPercc2.Caption :=
     FloatToStr(Round((rpResumoTreinSomaC1.Value +
     rpResumoTreinSomaC2.Value) /
     rpResumoTreinSomaC5.Value * 100)) + '%';
    rpResumoTreinPercC3.Caption :=
     FloatToStr(Round((rpResumoTreinSomaC1.Value +
     rpResumoTreinSomaC2.Value +
     rpResumoTreinSomaC3.Value) /
     rpResumoTreinSomaC5.Value * 100)) + '%';
    rpResumoTreinPercC4.Caption :=
     FloatToStr(Round((rpResumoTreinSomaC1.Value +
     rpResumoTreinSomaC2.Value +
     rpResumoTreinSomaC3.Value +
     rpResumoTreinSomaC4.Value) /
     rpResumoTreinSomaC5.Value * 100)) + '%';
    end
  else
  begin
    rpResumoTreinPercC2.Caption := '-';
    rpResumoTreinPercC3.Caption := '-';
    rpResumoTreinPercC4.Caption := '-';
  end;
end;

procedure TRptAtivEntid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlRegTrein);
end;

end.
