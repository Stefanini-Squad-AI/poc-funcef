// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Gleyber
// Data        : 26/08/2006
// Pendência   : 22087
// Rotina      : CmpRptCMParamControlExit
// Descricao   : Acerto para mostrar os planos previdenciários em um ListBox
//------------------------------------------------------------------------------
// andre tavares - 10/09/2004 - pendência 17080 - criação do filtro que
// possibilita que o usuário escolha se exibe ou não os documentos com saldo zerado.

unit rAtosGestPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, DBClient, Provider, ppDB, ppDBPipe, ppBands, ppClass, ppCtrls,
  ppVar, ppMemo, ppRegion, ppStrtch, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, Db, Wwdatsrc, DBTables, Wwquery, uCmRptManager, TXComp,
  CmParamReport, uCmSqlParams, uCMClientDataSet, uCtrlParamIntegra, TXRB;

type
  TRptAtosGestPag = class(TFrmCmReport)
    DsDemGestPag: TwwDataSource;
    pprDemap: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel14: TppLabel;
    MemTitulo: TppMemo;
    pprDemapRegion1: TppRegion;
    ppLine11: TppLine;
    RptDemGestPagLabel9: TppLabel;
    RptDemGestPagLabel10: TppLabel;
    RptDemGestPagLabel11: TppLabel;
    RptDemGestPagLabel12: TppLabel;
    pprDemapLabel1: TppLabel;
    pprDemapLine1: TppLine;
    pprDemapLabel2: TppLabel;
    ppDetailBand6: TppDetailBand;
    RptDemGestPagDBText3: TppDBText;
    ShpDetalheDoc: TppShape;
    EdtDDDataLancto: TppDBText;
    EdtDdNumAp: TppDBText;
    EdtDdValor: TppDBText;
    EdtDdObs: TppDBMemo;
    LblValCPMF: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine12: TppLine;
    ppLabel22: TppLabel;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    RptDemGestPagSummaryBand1: TppSummaryBand;
    RptDemGestPagLabel8: TppLabel;
    pprDemapDBCalc2: TppDBCalc;
    pprDemapLabel4: TppLabel;
    pprDemapDBCalc3: TppDBCalc;
    pprDemapLabel5: TppLabel;
    pprDemapDBCalc4: TppDBCalc;
    pprDemapLabel6: TppLabel;
    pprDemapLabel7: TppLabel;
    pprDemapDBCalc5: TppDBCalc;
    pprDemapLine2: TppLine;
    pprDemapLine3: TppLine;
    RptDemGestPagGroup1: TppGroup;
    RptDemGestPagGroupHeaderBand1: TppGroupHeaderBand;
    FBandAtosGestao: TppGroupFooterBand;
    RptDemGestPagShape1: TppShape;
    RptDemGestPagDBCalc1: TppDBCalc;
    RptDemGestPagDBText8: TppDBText;
    RptDemGestPagLabel2: TppLabel;
    RptDemGestPagLabel3: TppLabel;
    RptDemGestPagDBCalc2: TppDBCalc;
    RptDemGestPagLabel4: TppLabel;
    RptDemGestPagDBCalc3: TppDBCalc;
    RptDemGestPagLabel1: TppLabel;
    pprDemapLabel3: TppLabel;
    pprDemapDBCalc1: TppDBCalc;
    PplDemGestPag: TppDBPipeline;
    CdsGestAp: TClientDataSet;
    CdsGestApCODDOCUMENTO: TFloatField;
    CdsGestApNUMAPGR: TFloatField;
    CdsGestApCODTIPRECDES: TStringField;
    CdsGestApANASINT: TStringField;
    CdsGestApDESCRICAO: TStringField;
    CdsGestApDATAVENCTO: TDateTimeField;
    CdsGestApVRLANCTO: TFloatField;
    CdsGestApVRBAIXA: TFloatField;
    CdsGestApOBS: TMemoField;
    CdsGestApVRSUBTOTAL: TFloatField;
    CdsGestApCODCENTRORESPON: TStringField;
    CdsGestApVALCPMF: TFloatField;
    CdsGestApIDPLANOPREV: TFloatField;
    SqlGestAp: TCMSqlParams;
    SqlCentRespon: TCMSqlParams;
    CdsCentRespon: TCMClientDataSet;
    SqlSaldoDoc: TCMSqlParams;
    CdsSaldoDoc: TCMClientDataSet;
    qryAux: TwwQuery;
    qryAuxNOMEPLANOPATRO: TStringField;
    qryAuxSALDOANT: TFloatField;
    qryAuxRECEBIMENTOS: TFloatField;
    qryAuxDESEMBOLSOS: TFloatField;
    qryAuxSALDODIA: TFloatField;
    qryAuxIDPATRO: TFloatField;
    qryAuxNOMEPLANO: TStringField;
    qryAuxNOMEPATRO: TStringField;
    qryAuxDIF: TFloatField;
    qryAuxIDPLANO: TFloatField;
    CdsTipoDesemb: TCMClientDataSet;
    SqlTipoDesemb: TCMSqlParams;
    CdsPlanPrev: TCMClientDataSet;
    SqlPlanPrev: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    sNomePlano,
    sIdPlanPrev : String;  // Gleyber - 26/08/2006 - Pendência 22087
  public
    { Public declarations }
  end;

var
  RptAtosGestPag: TRptAtosGestPag;

implementation

{$R *.DFM}

procedure TRptAtosGestPag.CrmRptCMBeforePrint(Sender: TObject);
var
  sAddSql: string;
  iCont : integer;
begin
  inherited;
  sIdPlanPrev := CmpRptCM.ParamValues[6].asString;
  sNomePlano  := CmpRptCM.ParamValues[9].asString;

  MemTitulo.Lines.Clear;
  MemTitulo.Lines.Add('Relatório Demonstrativo de Atos de Gestão');


  with SqlGestAp do
  begin
    SQL.Clear;

    SQL.Add('SELECT  CODDOCUMENTO, NUMAPGR, CODTIPRECDES, ANASINT, DESCRICAO,  DATAVENCTO, OBS,  ');
    SQL.Add('        CODCENTRORESPON, IDPLANOPREV,                                               ');
    SQL.Add('        SUM(ROUND(VRLANCTO,2)) AS VRLANCTO,                                         ');
    SQL.Add('        SUM(ROUND(VRBAIXA,2)) AS VRBAIXA,                                           ');
    SQL.Add('        SUM((ROUND(DECODE(VRLANCTO,NULL,0,VRLANCTO),2)  -                           ');
    SQL.Add('             ROUND(DECODE(VRBAIXA,NULL,0,VRBAIXA),2))) AS VRSUBTOTAL,               ');
    SQL.Add('        SUM(ROUND((ROUND(VRLANCTO,2) * :PERCCPFM / 100),2)) AS VALCPMF              ');
    SQL.Add('FROM                                                                                ');
    SQL.Add('  (                                                                                 ');
    SQL.Add('--BUSCA OS TIPOS DE DESENBOLSO SINTÉTICOS PARA COMPOR O RELATÓRIO                   ');
    SQL.Add('  SELECT                                                                            ');
    SQL.Add('     (0) AS CODDOCUMENTO, (0) AS NUMAPGR, T.CODTIPRECDES,         ');
    SQL.Add('     T.ANASINT, T.DESCRICAO, (SYSDATE) AS DATAVENCTO, ('''') AS OBS,');
    SQL.Add('     (''         '') AS CODCENTRORESPON, (0) AS IDPLANOPREV,      ');
    SQL.Add('     (0) AS VRLANCTO, (0) AS VRBAIXA                              ');
    SQL.Add('  FROM                                                            ');
    SQL.Add('     TIPORECEBDESEMB T                                            ');
    SQL.Add('  WHERE                                                           ');
    SQL.Add('     T.ANASINT = ''S'' AND                                        ');
    SQL.Add('     T.RECPAG = :RECPAG AND T.IDPESSOA = :IDPESSOA                ');
    SQL.Add('UNION                                                             ');
    SQL.Add('  SELECT D.CODDOCUMENTO,                                          ');
    SQL.Add('         D.NUMAPGR,                                               ');
    SQL.Add('         T.CODTIPRECDES,                                          ');
    SQL.Add('         T.ANASINT,                                               ');
    SQL.Add('         T.DESCRICAO,                                             ');
    SQL.Add('         D.DATAVENCTO,                                            ');
    SQL.Add('         D.OBS,                                                   ');
    SQL.Add('         R.CODCENTRORESPON,                                       ');
    SQL.Add('         R.IDPLANOPREV,                                           ');
    SQL.Add('         (R.VALOR) AS VRLANCTO,                                   ');
    SQL.Add('         (VWBAIXAEFETIVOS.VALORBAIXA * R.VALOR / L.VALOR) AS VRBAIXA  ');
    SQL.Add('    FROM DOCUMENTO D,                                             ');
    SQL.Add('         LANCTODOCUM L,                                           ');
    SQL.Add('         RATEIODOCUM R,                                           ');

    //David Ayrolla - Pendência 27910
    SQL.Add('         CENTRESPON C,                                            ');
    SQL.Add('         PLANCENTRESPON  P,                                       ');

    SQL.Add('         TIPORECEBDESEMB T,                                       ');
    SQL.Add('         VWBAIXAEFETIVOS                                          ');
    SQL.Add('   WHERE D.RECPAG = :RECPAG  AND D.IDPESSOA = :IDPESSOA           ');
    SQL.Add('-- #ADF1                                                          ');


    //David Ayrolla - Pendência 27910
    SQL.Add('     AND ( R.CODCENTRORESPON = C.CODCENTRORESPON )                ');
    SQL.Add('     AND ( C.IDPESSOA = :IDPESSOA )                               ');
    SQL.Add('     AND ( C.IDPLANCRESPON   = P.IDPLANCRESPON )                  ');
    SQL.Add('     AND ( P.IDPLANCRESPON   = :IDPLANCRESPON )                   ');

    sAddSql := '';

    //David Ayrolla - Pendência 27910
    //Início
    SqlCentRespon.Prepare;
    SqlCentRespon.ParamByName('IDPLANCRESPON').AsString := CmpRptCM.ParamValues[0].AsString;
    SqlCentRespon.ParamByName('IDPESSOA').AsString := FloatToStr(CrmRptCM.IdEmpresa);
    if not CmpRptCM.ParamValues[1].IsNull then
    begin
      SqlCentRespon.ParamByName('CODEXTERNO').AsString := CmpRptCM.ParamValues[1].AsString;

      SqlCentRespon.open;

      if CdsCentRespon.FieldByName('ANALITICOSINTET').AsString = 'S' then
      begin
        SQL.Add('       AND (R.CODCENTRORESPON LIKE  ''' + Trim(CdsCentRespon.FieldByName('CODCENTRORESPON').AsString) + '%'')');
        MemTitulo.Lines.Add('Centro de Responsabilidade - ' + CdsCentRespon.FieldByName('CODEXTERNO').AsString + ' - ' +
          CdsCentRespon.FieldByName('NOME').AsString + ' + Analíticos');
      end
      else
      begin
        SQL.Add('       AND (RTRIM(R.CODCENTRORESPON) =  ''' + CdsCentRespon.FieldByName('CODCENTRORESPON').AsString + ''')');
        MemTitulo.Lines.Add('Centro de Responsabilidade - ' + CdsCentRespon.FieldByName('CODEXTERNO').AsString + ' - ' +
          CdsCentRespon.FieldByName('NOME').AsString);
      end;
    end
    else
    begin
      SqlCentRespon.open;
      MemTitulo.Lines.Add('Plano de Centro de Responsabilidade - ' + CdsCentRespon.FieldByName('DESCPLANCRESPON').AsString);
    end;
    //David Ayrolla - Pendência 27910
    //Fim



    if (trim(sIdPlanPrev) <> '') then // Plano
    begin
      SQL.Add('  AND (R.IDPLANOPREV IN   (' + sIdPlanPrev + ') )');  // Gleyber - 26/08/2006 - Pendência 22087
    end;

    if (not CmpRptCM.ParamValues[2].IsNull) then // Venc Ini
    begin
      SQL.Add('  AND (D.DATAVENCTO >=  TO_DATE(''' + CmpRptCM.ParamValues[2].AsString + ''',''DD/MM/YYYY''))');
      if (CmpRptCM.ParamValues[3].IsNull) then // Venc Fim
        MemTitulo.Lines.Add('Data de Vencimento a Partir de ' + CmpRptCM.ParamValues[2].AsString);
    end;
    if (not CmpRptCM.ParamValues[3].IsNull) then // Venc fim
    begin
      SQL.Add('  AND (D.DATAVENCTO <=  TO_DATE(''' + CmpRptCM.ParamValues[3].AsString + ''',''DD/MM/YYYY''))');
      if (not CmpRptCM.ParamValues[2].IsNull) then
        MemTitulo.Lines.Add('Data de Vencimento a Partir de ' + CmpRptCM.ParamValues[2].AsString + ' até ' +
          CmpRptCM.ParamValues[3].AsString)
      else
        MemTitulo.Lines.Add('Data de Vencimento até ' + CmpRptCM.ParamValues[3].AsString);
    end;

    SQL.Add('     AND D.NUMFATURA IS NULL                                      ');
    SQL.Add('     AND L.ESTORNO IS NULL                                        ');
    SQL.Add('     AND D.NUMAPGR IS NOT NULL                                    ');
    SQL.Add('     AND D.CODDOCUMENTO = L.CODDOCUMENTO                          ');
    SQL.Add('     AND D.OPERACAO = L.OPERACAO                                  ');
    SQL.Add('     AND D.CODDOCUMENTO = VWBAIXAEFETIVOS.CODDOCUMENTO (+)        ');
    SQL.Add('     AND D.RECPAG = VWBAIXAEFETIVOS.RECPAG(+)                     ');
    SQL.Add('     AND D.IDPESSOA = VWBAIXAEFETIVOS.IDPESSOA(+)                 ');
    SQL.Add('     AND R.CODDOCUMENTO = D.CODDOCUMENTO                          ');
    SQL.Add('	   AND R.RECPAG = D.RECPAG                                      ');
    SQL.Add('	   AND R.IDPESSOA = D.IDPESSOA                                  ');
    SQL.Add('     AND R.CODTIPRECDES = T.CODTIPRECDES                          ');
    SQL.Add('     AND R.IDPESSOA = T.IDPESSOA                                  ');
    SQL.Add('     AND R.RECPAG = T.RECPAG                                      ');
    SQL.Add('UNION                                                             ');
    SQL.Add('  SELECT VWLANCPARCELADOS.CODDOCUMENTO,                           ');
    SQL.Add('       VWLANCPARCELADOS.NUMAPGR,                                  ');
    SQL.Add('       VWRATEIOORIGEMPARCELAS.CODTIPRECDES,                       ');
    SQL.Add('       VWRATEIOORIGEMPARCELAS.ANASINT,                            ');
    SQL.Add('       VWRATEIOORIGEMPARCELAS.DESCTDR,                            ');
    SQL.Add('       VWLANCPARCELADOS.DATAVENCTO,                               ');
    SQL.Add('       VWLANCPARCELADOS.OBS,                                      ');
    SQL.Add('       VWRATEIOORIGEMPARCELAS.CODCENTRORESPON,                    ');
    SQL.Add('       VWRATEIOORIGEMPARCELAS.IDPLANOPREV,                        ');
    SQL.Add('       (VWLANCPARCELADOS.VALOR * VWRATEIOORIGEMPARCELAS.VALOR) /  ');
    SQL.Add('            VWLANCORIGEMPARCELAS.VALOR AS VRLANCTO,               ');
    SQL.Add('       (((VWLANCPARCELADOS.VALOR * VWRATEIOORIGEMPARCELAS.VALOR) /');
    SQL.Add('            VWLANCORIGEMPARCELAS.VALOR) * VWLANCPARCELADOS.VALORBAIXA) / ');
    SQL.Add('               VWLANCPARCELADOS.VALOR AS VRBAIXA                   ');
    SQL.Add('  FROM VWLANCPARCELADOS,VWRATEIOORIGEMPARCELAS,VWLANCORIGEMPARCELAS');


    //David Ayrolla - Pendência 27910
    SQL.Add('  ,      CENTRESPON C,                                             ');
    SQL.Add('         PLANCENTRESPON  P                                         ');


    SQL.Add('  WHERE VWLANCPARCELADOS.RECPAG = :RECPAG                          ');
    SQL.Add('    AND VWLANCPARCELADOS.IDPESSOA = :IDPESSOA                      ');


    //David Ayrolla - Pendência 27910
    SQL.Add('     AND ( VWRATEIOORIGEMPARCELAS.CODCENTRORESPON = C.CODCENTRORESPON ) ');
    SQL.Add('     AND ( C.IDPESSOA = :IDPESSOA )                               ');
    SQL.Add('     AND ( C.IDPLANCRESPON   = P.IDPLANCRESPON )                  ');
    SQL.Add('     AND ( P.IDPLANCRESPON   = :IDPLANCRESPON )                   ');


    SQL.Add('    AND VWLANCPARCELADOS.NUMAPGR IS NOT NULL                       ');
    SQL.Add('-- #ADF2                                                           ');
    if not CmpRptCM.ParamValues[1].IsNull then
    begin
      if CdsCentRespon.FieldByName('ANALITICOSINTET').AsString = 'S' then
        SQL.Add('AND (VWRATEIOORIGEMPARCELAS.CODCENTRORESPON LIKE ''' + Trim(CdsCentRespon.FieldByName('CODCENTRORESPON').AsString) +
          '%'')')
      else
      begin
        SQL.Add(' AND (RTRIM(VWRATEIOORIGEMPARCELAS.CODCENTRORESPON) =  ''' + CdsCentRespon.FieldByName('CODCENTRORESPON').AsString +
          ''')');
      end;
    end;
//    if (not CmpRptCM.ParamValues[6].IsNull) then // Plano
    if (trim(sIdPlanPrev) <> '') then // Plano
    begin
      SQL.Add('   AND (VWRATEIOORIGEMPARCELAS.IDPLANOPREV IN   (' + sIdPlanPrev + ') )');
      MemTitulo.Lines.Add('Plano(s) Previdenciário(s) - ' + sNomePlano);
    end;

    if (not CmpRptCM.ParamValues[2].IsNull) then // Venc Ini
    begin
      SQL.Add('   AND (VWLANCPARCELADOS.DATAVENCTO >=  TO_DATE(''' + CmpRptCM.ParamValues[2].AsString + ''',''DD/MM/YYYY''))');
    end;

    if (not CmpRptCM.ParamValues[3].IsNull) then // Venc fim
    begin
      SQL.Add('   AND (VWLANCPARCELADOS.DATAVENCTO <=  TO_DATE(''' + CmpRptCM.ParamValues[3].AsString + ''',''DD/MM/YYYY''))');
    end;
    SQL.Add('    AND VWLANCPARCELADOS.NUMFATURA = VWRATEIOORIGEMPARCELAS.NUMFATURA ');
    SQL.Add('    AND VWLANCPARCELADOS.NUMFATURA = VWLANCORIGEMPARCELAS.NUMFATURA ');
    SQL.Add('    AND VWLANCPARCELADOS.RECPAG = VWRATEIOORIGEMPARCELAS.RECPAG     ');
    SQL.Add('    AND VWLANCPARCELADOS.RECPAG = VWLANCORIGEMPARCELAS.RECPAG       ');
    SQL.Add('    AND VWLANCPARCELADOS.IDPESSOA = VWRATEIOORIGEMPARCELAS.IDPESSOA ');
    SQL.Add('    AND VWLANCPARCELADOS.IDPESSOA = VWLANCORIGEMPARCELAS.IDPESSOA) vvvv ');

    if not CmpRptCM.ParamValues[4].AsBoolean then
      SQL.Add(' WHERE (ANASINT = ''A'') ');

     if (not CmpRptCM.ParamValues[8].IsNull) then
       SQL.Add('    AND CODTIPRECDES = ' + CmpRptCM.ParamValues[8].AsString);

    SQL.Add(' GROUP BY CODDOCUMENTO, NUMAPGR, CODTIPRECDES, ANASINT, DESCRICAO,  DATAVENCTO, OBS, CODCENTRORESPON, IDPLANOPREV ORDER BY CODTIPRECDES, DESCRICAO, NUMAPGR ');

    Prepare;
    ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
    ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
    ParamByName('PERCCPFM').AsFloat := CmpRptCM.ParamValues[5].AsFloat;
    ParamByName('IDPLANCRESPON').AsFloat := StrToInt( CmpRptCM.ParamValues[0].AsString );
    Open;

      qryAux.SQL.Clear;
      qryAux.SQL.add(SqlGestAp.sql.text);
  end;
  while not CdsGestAp.eof do
  begin
    with SqlSaldoDoc do
    begin
      Close;
      Prepare;
      ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
      ParamByName('CODDOCUMENTO').AsFloat := CdsGestAp.FieldByName('CODDOCUMENTO').AsFloat;
      Open;
    end;
    if CdsSaldoDoc.FieldByName('VALORBRUTO').AsFloat <> 0 then
    begin
      CdsGestAp.Edit;
      CdsGestAp.FieldByName('VRLANCTO').AsFloat := (CdsSaldoDoc.FieldByName('VALORLIQUIDO').AsFloat *
        CdsGestAp.FieldByName('VRLANCTO').AsFloat / CdsSaldoDoc.FieldByName('VALORBRUTO').AsFloat);
      CdsGestAp.FieldByName('VRSUBTOTAL').AsFloat := CdsGestAp.FieldByName('VRLANCTO').AsFloat - CdsGestAp.FieldByName('VRBAIXA').AsFloat;
      CdsGestAp.FieldByName('VALCPMF').AsFloat := ((CdsGestAp.FieldByName('VRLANCTO').AsFloat * CmpRptCM.ParamValues[5].AsFloat) / 100);
      CdsGestAp.Post;
      if (CmpRptCM.ParamValues[7].asBoolean = false) and (formatFloat('0', CdsGestAp.FieldByName('VRLANCTO').AsFloat) = '0') then
        CdsGestAp.Delete;
    end;
    CdsGestAp.Next;
  end;
  CdsSaldoDoc.Close;
  CdsGestAp.First;
end;

end.
