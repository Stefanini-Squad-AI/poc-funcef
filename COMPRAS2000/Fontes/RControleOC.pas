unit RControleOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppStrtch, ppMemo,
  ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables,
  Wwquery, TXRB;

type
  TRptControleOC = class(TFrmCmReport)
    qryControleOC: TwwQuery;
    qryControleOCFORNECEDOR: TStringField;
    qryControleOCNUMOC: TFloatField;
    qryControleOCDATAOC: TDateTimeField;
    qryControleOCOCATENDIDA: TStringField;
    qryControleOCIIMPRESSA: TStringField;
    qryControleOCOBSOC: TStringField;
    qryControleOCCODARTIGO: TStringField;
    qryControleOCCODMEDIDA: TStringField;
    qryControleOCDESCRICAO: TStringField;
    qryControleOCVALORUN: TFloatField;
    qryControleOCQTDEENTREGA: TFloatField;
    qryControleOCDATAENTREGA: TDateTimeField;
    qryControleOCTOTIMP: TFloatField;
    qryControleOCTOTIPI: TFloatField;
    qryControleOCTOTITEM: TFloatField;
    qryControleOCVALTOTAL: TFloatField;
    qryControleOCTOTOC: TFloatField;
    qryControleOCOBSITEMOC: TStringField;
    qryControleOCNUMNF: TFloatField;
    qryControleOCDATAENTDEVOL: TDateTimeField;
    qryControleOCQTDERECEBIDA: TFloatField;
    dsControleOC: TwwDataSource;
    bdeControleOC: TppBDEPipeline;
    ppControleOC: TppReport;
    ppHeaderBand4: TppHeaderBand;
    rpControleOCLine1: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    LbItem: TppLabel;
    rpOrdemCompraLabel3: TppLabel;
    LbOrdem: TppLabel;
    rpOrdemCompraLabel12: TppLabel;
    ppLabel11: TppLabel;
    rpControleOCLabel1: TppLabel;
    rpControleOCLine2: TppLine;
    rpControleOCLine3: TppLine;
    rpOrdemCompraLabel13: TppLabel;
    rpControleOCLine4: TppLine;
    rpOrdemCompraLabel2: TppLabel;
    rpOrdemCompraLabel7: TppLabel;
    rpControleOCLabel2: TppLabel;
    rpControleOCLine5: TppLine;
    rpOrdemCompraLabel22: TppLabel;
    rpOrdemCompraLabel20: TppLabel;
    rpControleOCLine6: TppLine;
    rpOrdemCompraLabel17: TppLabel;
    rpOrdemCompraLabel6: TppLabel;
    rpOrdemCompraLabel15: TppLabel;
    rpControleOCLabel4: TppLabel;
    rpControleOCLabel5: TppLabel;
    rpControleOCLabel6: TppLabel;
    rpOrdemCompraLabel21: TppLabel;
    rpControleOCLabel3: TppLabel;
    rpControleOCLabel8: TppLabel;
    ppDetailBand6: TppDetailBand;
    rpControleOCDBText1: TppDBText;
    rpControleOCDBText2: TppDBText;
    rpControleOCDBText3: TppDBText;
    rpControleOCDBText5: TppDBText;
    rpControleOCDBText6: TppDBText;
    rpControleOCDBText7: TppDBText;
    rpControleOCDBText8: TppDBText;
    rpControleOCDBText9: TppDBText;
    rpControleOCDBText10: TppDBText;
    rpControleOCDBText11: TppDBText;
    rpControleOCDBText12: TppDBText;
    rpControleOCDBText14: TppDBText;
    ppFooterBand6: TppFooterBand;
    rpOrdemCompraLabel5: TppLabel;
    rpOrdemCompraLine3: TppLine;
    rpOrdemCompraCalc1: TppSystemVariable;
    rpOrdemCompraCalc2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel10: TppLabel;
    ppDBText5: TppDBText;
    rpOrdemCompraLine2: TppLine;
    rpControleOCDBText15: TppDBText;
    rpControleOCDBText4: TppDBText;
    rpControleOCLabel7: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    rpOrdemCompraLabel14: TppLabel;
    rpOrdemCompraLabel9: TppLabel;
    rpOrdemCompraLabel19: TppLabel;
    rpControleOCDBText13: TppDBText;
    rpControleOCDBMemo1: TppDBMemo;
    rpControleOCDBText16: TppDBText;
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptControleOC: TRptControleOC;

implementation

{$R *.DFM}

procedure TRptControleOC.CrmRptCMChangeDataBaseName(Sender: TObject;
  sDataBaseName: String);
begin
  inherited;
  If qryControleOC.Active Then
     qryControleOC.Close;
  qryControleOC.DataBaseName := sDataBaseName;

end;


procedure TRptControleOC.CrmRptCMBeforePrint(Sender: TObject);
Begin
    Inherited;
    lbItem.caption  := CmpRptCM.ParamValues[2].RadioGroupSettings.Items.Strings[CmpRptCM.ParamValues[2].AsInteger];
    lbOrdem.caption := CmpRptCM.ParamValues[3].RadioGroupSettings.Items.Strings[CmpRptCM.ParamValues[3].AsInteger];
    With qryControleOC Do
       Begin
          Close;
          Sql.Clear;
          Sql.Add(' SELECT                                                                                       ');
          Sql.Add('      P.NOME AS FORNECEDOR,                                                                   ');
          Sql.Add('      O.NUMOC,                                                                                ');
          Sql.Add('      O.DATAOC,                                                                               ');
          Sql.Add('      O.OCATENDIDA,                                                                           ');
          Sql.Add('      DECODE(O.FLGIMPRESSA,''T'',''O.C. JÁ IMPRESSA'',''O.C. NÃO IMPRESSA'') AS IIMPRESSA,    ');
          Sql.Add('      O.OBSOC,                                                                                ');
          Sql.Add('      I.CODARTIGO,                                                                            ');
          Sql.Add('      I.CODMEDIDA,                                                                            ');
          Sql.Add('      DECODE(I.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI) AS DESCRICAO,                     ');
          Sql.Add('      I.VALORUN,                                                                              ');
          Sql.Add('      PE.QTDEENTREGA,                                                                         ');
          Sql.Add('      PE.DATAENTREGA,                                                                         ');
          Sql.Add('      NF.NUMNF,                                                                               ');
          Sql.Add('      NF.DATAENTDEVOL,                                                                        ');
          Sql.Add('      DECODE(INF.QTDERECEBDEVOL,NULL,0,INF.QTDERECEBDEVOL) AS QTDERECEBIDA,                   ');
          Sql.Add('      DECODE(IMP.TOTIMP,NULL,0,IMP.TOTIMP)AS TOTIMP,                                          ');
          Sql.Add('      DECODE(IPI.TOTIPI,NULL,0,IPI.TOTIPI) AS TOTIPI,                                         ');
          Sql.Add('      TOT.TOTITEM,                                                                            ');
          Sql.Add('      (I.VALORUN*PE.QTDEENTREGA) AS VALTOTAL,                                                 ');
          Sql.Add('      (DECODE(IPI.TOTIPI,NULL,0,IPI.TOTIPI)+DECODE(IMP.TOTIMP,NULL,0,IMP.TOTIMP)+TOT.TOTITEM) AS TOTOC, ');
          Sql.Add('      I.OBSITEMOC                                                                             ');
          Sql.Add(' FROM                                                                                         ');
          Sql.Add('      PESSOA P,                                                                               ');
          Sql.Add('      ITEMOC I,                                                                               ');
          Sql.Add('      OC O,                                                                                   ');
          Sql.Add('      ARTIGO A,                                                                               ');
          Sql.Add('      PRODUTO PR,                                                                             ');
          Sql.Add('      PRODVARI PV,                                                                            ');
          Sql.Add('      PRAZOENTREGAOC PE,                                                                      ');
          Sql.Add('      ITENSRECEBDEVOL INF,                                                                    ');
          Sql.Add('      NFRECEBDEVOL NF,                                                                        ');
          Sql.Add('      (SELECT I.NUMOC, SUM(I.VALORUN*PE.QTDEENTREGA) AS TOTITEM                               ');
          Sql.Add('       FROM ITEMOC I, PRAZOENTREGAOC PE                                                       ');
          Sql.Add('       WHERE (1=1)                                                                            ');
                 Case CmpRptCM.ParamValues[3].AsInteger Of
                    1 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') OR (I.FLGITEMATENDIDO = ''T''))');
                    2 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') AND (I.FLGITEMATENDIDO IS NOT NULL)) ');
                    3 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''T'') AND (I.FLGITEMATENDIDO IS NOT NULL))');
                 End;
          Sql.Add('             AND (I.IDITEMOC = PE.IDITEMOC)                                                       ');
          Sql.Add('       GROUP BY I.NUMOC) TOT,                                                                 ');
          Sql.Add('      ((SELECT AOC.NUMOC,                                                                     ');
          Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AOC.VLRAGREGTOT*-1),AOC.VLRAGREGTOT)) AS TOTIMP ');
          Sql.Add('        FROM  AGREGTOTOC AOC,                                                                 ');
          Sql.Add('              TIPOAGRE T                                                                      ');
          Sql.Add('        WHERE                                                                                 ');
          Sql.Add('               (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6''))                ');
          Sql.Add('           AND (UPPER(T.DESCCUSTAGREG) NOT LIKE ''IPI''||''%'')                               ');
          Sql.Add('           AND (AOC.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                                    ');
          Sql.Add('        GROUP BY AOC.NUMOC)                                                                   ');
          Sql.Add('        UNION                                                                                 ');
          Sql.Add('       (SELECT I.NUMOC,                                                                       ');
          Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AI.VLRAGREGITEM*-1),AI.VLRAGREGITEM)) AS TOTIMP ');
          Sql.Add('        FROM  AGREGITEMOC AI,                                                                 ');
          Sql.Add('              TIPOAGRE T,                                                                     ');
          Sql.Add('              ITEMOC I                                                                        ');
          Sql.Add('        WHERE                                                                                 ');
          Sql.Add('               (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6''))                 ');
              Case CmpRptCM.ParamValues[3].AsInteger Of
                 1 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') OR (I.FLGITEMATENDIDO = ''T''))');
                 2 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') AND (I.FLGITEMATENDIDO IS NOT NULL)) ');
                 3 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''T'') AND (I.FLGITEMATENDIDO IS NOT NULL))');
              End;
          Sql.Add('           AND (UPPER(T.DESCCUSTAGREG) NOT LIKE ''IPI''||''%'')                               ');
          Sql.Add('           AND (I.IDITEMOC = AI.IDITEMOC)                                                     ');
          Sql.Add('           AND (AI.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                                     ');
          Sql.Add('        GROUP BY I.NUMOC)) IMP,                                                               ');
          Sql.Add('      ((SELECT AOC.NUMOC,                                                                     ');
          Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AOC.VLRAGREGTOT*-1),AOC.VLRAGREGTOT)) AS TOTIPI ');
          Sql.Add('        FROM  AGREGTOTOC AOC,                                                                 ');
          Sql.Add('              TIPOAGRE T                                                                      ');
          Sql.Add('        WHERE                                                                                 ');
          Sql.Add('               (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6''))                ');
          Sql.Add('           AND (UPPER(T.DESCCUSTAGREG) LIKE ''IPI''||''%'')                                   ');
          Sql.Add('           AND (AOC.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                                    ');
          Sql.Add('        GROUP BY AOC.NUMOC)                                                                   ');
          Sql.Add('        UNION                                                                                 ');
          Sql.Add('       (SELECT I.NUMOC,                                                                       ');
          Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AI.VLRAGREGITEM*-1),AI.VLRAGREGITEM)) AS TOTIPI ');
          Sql.Add('        FROM  AGREGITEMOC AI,                                                                 ');
          Sql.Add('              TIPOAGRE T,                                                                     ');
          Sql.Add('              ITEMOC I                                                                        ');
          Sql.Add('        WHERE                                                                                 ');
          Sql.Add('              (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6''))                 ');
          Sql.Add('          AND (UPPER(T.DESCCUSTAGREG) LIKE ''IPI''||''%'')                                    ');
             Case CmpRptCM.ParamValues[3].AsInteger Of
                1 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') OR (I.FLGITEMATENDIDO = ''T''))      ');
                2 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') AND (I.FLGITEMATENDIDO IS NOT NULL)) ');
                3 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''T'') AND (I.FLGITEMATENDIDO IS NOT NULL)) ');
             End;
          Sql.Add('          AND (I.IDITEMOC = AI.IDITEMOC)                                                      ');
          Sql.Add('          AND (AI.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                                      ');
          Sql.Add('        GROUP BY I.NUMOC)) IPI                                                                ');
          Sql.Add(' WHERE (NF.FLGTIPONOTA(+) = ''R'')                               ');
          Sql.Add('   AND (O.IDPESSOA = '+FloatToStr(CrmRptCM.idEmpresa)+')            ');
          If Not CmpRptCM.ParamValues[0].IsNull Then
              Sql.Add('  AND (O.NUMOC = '+CmpRptCM.ParamValues[0].asString+')')
          Else
             Begin
                 If Not CmpRptCM.ParamValues[1].IsNull Then
                    Sql.Add(' AND (NF.IDFORCLI = '+CmpRptCM.ParamValues[1].LookupSettings.Chave+') ');
                Case CmpRptCM.ParamValues[3].AsInteger Of
                    1 : Sql.Add(' AND (NF.DATAENTDEVOL(+) IS NOT NULL) ');
                    2 : Sql.Add(' AND (NF.DATAENTDEVOL(+) IS NULL) AND (PE.DATAENTREGA >= SYSDATE) ');
                    3 : Sql.Add(' AND (NF.DATAENTDEVOL(+) IS NULL) AND (PE.DATAENTREGA < SYSDATE) ');
                 End;
                Case CmpRptCM.ParamValues[2].AsInteger Of
                    1 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') OR  (I.FLGITEMATENDIDO = ''T'')) AND (NF.DATAENTDEVOL(+) IS NOT NULL)');
                    2 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''F'') AND (NF.DATAENTDEVOL(+) IS NOT NULL))');
                    3 : Sql.Add('AND ((I.FLGITEMATENDIDO = ''T'') AND (NF.DATAENTDEVOL(+) IS NOT NULL))');
                    4 : Sql.Add('AND (NF.DATAENTDEVOL(+) IS NULL)');
                 End;
                 If Not CmpRptCM.ParamValues[4].IsNull then
                    Sql.add(' AND (O.DATAOC >= TO_DATE('''+CmpRptCM.ParamValues[4].asString+''',''DD/MM/YYYY''))');
                 If Not CmpRptCM.ParamValues[5].IsNull then
                    Sql.add(' AND (O.DATAOC <= TO_DATE('''+CmpRptCM.ParamValues[5].asString+''',''DD/MM/YYYY''))');
                 If Not CmpRptCM.ParamValues[6].IsNull then
                    Sql.add(' AND (PE.DATAENTREGA >= TO_DATE('''+CmpRptCM.ParamValues[6].asString+''',''DD/MM/YYYY''))');
                 If Not CmpRptCM.ParamValues[7].IsNull then
                    Sql.add(' AND (PE.DATAENTREGA <= TO_DATE('''+CmpRptCM.ParamValues[7].asString+''',''DD/MM/YYYY''))');
                 If Not CmpRptCM.ParamValues[8].IsNull then
                    Sql.add(' AND (NF.DATAENTDEVOL >= TO_DATE('''+CmpRptCM.ParamValues[8].asString+''',''DD/MM/YYYY''))');
                 If Not CmpRptCM.ParamValues[9].IsNull then
                    Sql.add(' AND (NF.DATAENTDEVOL <= TO_DATE('''+CmpRptCM.ParamValues[9].asString+''',''DD/MM/YYYY''))');
             End;
          Sql.Add('  AND (O.NUMOC = I.NUMOC)                           ');
          Sql.Add('  AND (I.IDITEMOC = INF.IDITEMOC(+))                ');
          Sql.Add('  AND (INF.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL(+))   ');
          Sql.Add('  AND (P.IDPESSOA = O.IDFORCLI)                     ');
          Sql.Add('  AND (I.CODARTIGO = A.CODARTIGO)                   ');
          Sql.Add('  AND (A.CODPRODUTO = PR.CODPRODUTO)                ');
          Sql.Add('  AND (I.IDPRODVARI = PV.IDPRODVARI(+))             ');
          Sql.Add('  AND (PE.IDITEMOC = I.IDITEMOC)                    ');
          Sql.Add('  AND (IMP.NUMOC(+) = O.NUMOC)                      ');
          Sql.Add('  AND (IPI.NUMOC(+) = O.NUMOC)                      ');
          Sql.Add('  AND (TOT.NUMOC = O.NUMOC)                         ');
          Sql.Add(' ORDER BY O.NUMOC, I.IDITEMOC                       ');
          Open;
       End;


end;

procedure TRptControleOC.CmpRptCMBeforeExecute(var CanExecute: Boolean);
Var
   SQL : String;
begin
  inherited;
  SQL := ' SELECT P.RAZAOSOCIAL, P.IDPESSOA '+
         ' FROM PESSOA P, EMPRESAFORN E '+
         ' WHERE (P.IDPESSOA ='+FloatToStr(CrmRptCM.idEmpresa)+') '+
         '   AND (P.IDPESSOA = E.IDFORCLI) '+
         ' ORDER BY 1 ';
  CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := SQL;
end;

end.


