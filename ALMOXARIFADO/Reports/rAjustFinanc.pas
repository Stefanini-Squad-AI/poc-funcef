// andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.
unit rAjustFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppBands, ppClass, ppCtrls, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, TXRB;

type
  TRptAjustFinanc = class(TFrmCmReport)
    bdeAjustFinanc: TppBDEPipeline;
    bdeAjustFinancppField1: TppField;
    bdeAjustFinancppField2: TppField;
    bdeAjustFinancppField3: TppField;
    bdeAjustFinancppField4: TppField;
    bdeAjustFinancppField5: TppField;
    bdeAjustFinancppField6: TppField;
    bdeAjustFinancppField7: TppField;
    bdeAjustFinancppField8: TppField;
    bdeAjustFinancppField9: TppField;
    dsAjustFinanc: TwwDataSource;
    RptAjustFinanc: TppReport;
    ppHeaderBand37: TppHeaderBand;
    ppLabel242: TppLabel;
    ppLine105: TppLine;
    LblEmpresa: TppLabel;
    ppLabel245: TppLabel;
    ppLabel246: TppLabel;
    ppLine108: TppLine;
    ppLabel247: TppLabel;
    ppLabel248: TppLabel;
    ppLabel249: TppLabel;
    ppLabel250: TppLabel;
    LbPer: TppLabel;
    ppLabel253: TppLabel;
    LbUnidCust: TppLabel;
    ppDetailBand33: TppDetailBand;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppDBText117: TppDBText;
    ppFooterBand38: TppFooterBand;
    ppLine106: TppLine;
    LblSistema: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSummaryBand8: TppSummaryBand;
    ppLine110: TppLine;
    ppLabel251: TppLabel;
    ppDBCalc36: TppDBCalc;
    ppDBCalc37: TppDBCalc;
    ppDBCalc38: TppDBCalc;
    ppDBCalc39: TppDBCalc;
    ppDBCalc40: TppDBCalc;
    ppGroup15: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppLine107: TppLine;
    ppDBText110: TppDBText;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppLine109: TppLine;
    ppDBCalc31: TppDBCalc;
    ppDBCalc32: TppDBCalc;
    ppDBCalc33: TppDBCalc;
    ppDBCalc34: TppDBCalc;
    ppDBCalc35: TppDBCalc;
    SqlAjustFinanc: TCMSqlParams;
    CdsAjustFinanc: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptAjustFinanc: TRptAjustFinanc;
  sNomeCusteio: String = '';

implementation

{$R *.DFM}

procedure TRptAjustFinanc.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
   lbPer.Caption      := 'De ' + CmpRptCM.ParamValues[ 0 ].AsString + ' a ' + CmpRptCM.ParamValues[ 1 ].AsString;
   LbUnidCust.Caption := sNomeCusteio;

   With SqlAjustFinanc Do Begin
        Close;
        Sql.Clear;
        Sql.Append('SELECT A.CODALMOXARIFADO, ');
        Sql.Append('       A.DESCALMOX, ');
        Sql.Append('       AR.CODARTIGO, ');
        Sql.Append('       P.DESCPROD, ');
        Sql.Append('       SUM( NVL( U.VALANT, 0 ) )    AS VALANT, ');
        Sql.Append('       SUM( NVL( U.VALCOMPRA, 0 ) ) AS VALCOMPRA, ');
        Sql.Append('       SUM( NVL( U.VALREQ, 0 ) )    AS VALREQ, ');
        Sql.Append('       SUM( NVL( U.VALATUAL, 0 ) )  AS VALATUAL, ');
        Sql.Append('       ( SUM( NVL( U.VALANT, 0 ) ) + SUM( NVL( U.VALCOMPRA, 0 ) ) - ');
        Sql.Append('         SUM( NVL( U.VALREQ, 0 ) ) - SUM( NVL( U.VALATUAL,  0 ) ) ) AS AJUSTE ');
        Sql.Append('  FROM ALMOX A, ARTIGO AR, PRODUTO P, ');
        Sql.Append('       ( ( SELECT VA.CODALMOXARIFADO, VA.CODARTIGO, ');
        Sql.Append('                  SUM( VA.VALOR ) AS VALANT, ');
        Sql.Append('                  0 AS VALATUAL, ');
        Sql.Append('                  0 AS VALREQ, ');
        Sql.Append('                  0 AS VALCOMPRA ');
        Sql.Append('             FROM ( SELECT M.CODALMOXARIFADO, ');
        Sql.Append('                           M.CODARTIGO, ');
        Sql.Append('                           ( M.SALDOQTDEMOV * M.CUSTOMEDIOMOV ) AS VALOR ');
        Sql.Append('                      FROM MOVIMENT M, ');
        Sql.Append('                           ( SELECT M.CODALMOXARIFADO, ');
        Sql.Append('                                    M.CODARTIGO, ');
        Sql.Append('                                    MAX( M.IDMOV ) AS IDMOV ');
        Sql.Append('                               FROM MOVIMENT M, ');
        Sql.Append('                                    ( SELECT CODALMOXARIFADO, ');
        Sql.Append('                                             CODARTIGO, ');
        Sql.Append('                                             MAX( DATAMOV ) AS DATAMOV ');
        Sql.Append('                                        FROM MOVIMENT ');
        Sql.Append('                                       WHERE ( DATAMOV < TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
        Sql.Append('                                       GROUP BY CODALMOXARIFADO, CODARTIGO ');
        Sql.Append('                                    ) SUB1 ');
        Sql.Append('                              WHERE ( M.CODARTIGO = SUB1.CODARTIGO ) ');
        Sql.Append('                                AND ( M.CODALMOXARIFADO = SUB1.CODALMOXARIFADO ) ');
        Sql.Append('                                AND ( M.DATAMOV = SUB1.DATAMOV ) ');
        Sql.Append('                              GROUP BY M.CODALMOXARIFADO, M.CODARTIGO ');
        Sql.Append('                           ) AUX ');
        Sql.Append('                     WHERE ( M.CODARTIGO = AUX.CODARTIGO ) ');
        Sql.Append('                       AND ( M.CODALMOXARIFADO = AUX.CODALMOXARIFADO ) ');
        Sql.Append('                       AND ( M.IDMOV = AUX.IDMOV ) ');
        Sql.Append('                  ) VA ');
        Sql.Append('            GROUP BY VA.CODALMOXARIFADO, VA.CODARTIGO');
        Sql.Append('         ) ');
        Sql.Append('         UNION ALL ');
        Sql.Append('         ( SELECT VA.CODALMOXARIFADO, ');
        Sql.Append('                  VA.CODARTIGO, ');
        Sql.Append('                  0 AS VALANT, ');
        Sql.Append('                  SUM( VA.VALOR ) AS VALATUAL, ');
        Sql.Append('                  0 AS VALREQ, ');
        Sql.Append('                  0 AS VALCOMPRA ');
        Sql.Append('             FROM ( SELECT M.CODALMOXARIFADO, ');
        Sql.Append('                           M.CODARTIGO, ');
        Sql.Append('                           ( M.SALDOQTDEMOV * M.CUSTOMEDIOMOV ) AS VALOR ');
        Sql.Append('                      FROM MOVIMENT M, ');
        Sql.Append('                           ( SELECT M.CODALMOXARIFADO, ');
        Sql.Append('                                    M.CODARTIGO, ');
        Sql.Append('                                    MAX( M.IDMOV ) AS IDMOV ');
        Sql.Append('                               FROM MOVIMENT M, ');
        Sql.Append('                                    ( SELECT CODALMOXARIFADO, ');
        Sql.Append('                                             CODARTIGO, ');
        Sql.Append('                                             MAX( DATAMOV ) AS DATAMOV ');
        Sql.Append('                                        FROM MOVIMENT ');
        Sql.Append('                                       WHERE ( DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
        Sql.Append('                                       GROUP BY CODALMOXARIFADO, CODARTIGO ');
        Sql.Append('                                    ) SUB1 ');
        Sql.Append('                              WHERE ( M.CODARTIGO = SUB1.CODARTIGO ) ');
        Sql.Append('                                AND ( M.CODALMOXARIFADO = SUB1.CODALMOXARIFADO ) ');
        Sql.Append('                                AND ( M.DATAMOV = SUB1.DATAMOV ) ');
        Sql.Append('                              GROUP BY M.CODALMOXARIFADO, M.CODARTIGO ');
        Sql.Append('                           ) AUX ');
        Sql.Append('                     WHERE ( M.CODARTIGO = AUX.CODARTIGO ) ');
        Sql.Append('                       AND ( M.CODALMOXARIFADO = AUX.CODALMOXARIFADO ) ');
        Sql.Append('                       AND ( M.IDMOV = AUX.IDMOV ) ');
        Sql.Append('                  ) VA ');
        Sql.Append('            GROUP BY VA.CODALMOXARIFADO, VA.CODARTIGO ');
        Sql.Append('         ) ');
        Sql.Append('         UNION ALL ');
        Sql.Append('         ( SELECT CODALMOXARIFADO, ');
        Sql.Append('                  CODARTIGO, ');
        Sql.Append('                  0 AS VALANT, ');
        Sql.Append('                  0 AS VALATUAL, ');
        Sql.Append('                  0 AS VALREQ, ');
        Sql.Append('                  SUM( round(VALORMOV, 2) ) AS VALCOMPRA ');
        Sql.Append('             FROM MOVIMENT ');
        Sql.Append('            WHERE ( DATAMOV >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
        Sql.Append('              AND ( DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
        Sql.Append('              AND ( ( CODTIPOMOV = ''K'' ) OR ( CODTIPOMOV = ''A'' ) OR ( CODTIPOMOV = ''B'' ) OR ( CODTIPOMOV = ''Z'' ) ) ');
        Sql.Append('            GROUP BY CODALMOXARIFADO, CODARTIGO ');
        Sql.Append('         ) UNION ALL ');
        Sql.Append('         ( SELECT CODALMOXARIFADO, ');
        Sql.Append('                  CODARTIGO, ');
        Sql.Append('                  0 AS VALANT, ');
        Sql.Append('                  0 AS VALATUAL, ');
        Sql.Append('                  SUM( round(VALORMOV, 2) )* -1 AS VALREQ, ');
        Sql.Append('                  0 AS VALCOMPRA ');
        Sql.Append('             FROM MOVIMENT ');
        Sql.Append('            WHERE ( DATAMOV >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
        Sql.Append('              AND ( DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
        Sql.Append('              AND ( ( CODTIPOMOV <> ''K'' ) AND ( CODTIPOMOV <> ''A'' ) AND ( CODTIPOMOV <> ''Z'' ) AND ( CODTIPOMOV <> ''B'' ) ) ');
        Sql.Append('            GROUP BY CODALMOXARIFADO, CODARTIGO ');
        Sql.Append('         ) ');
        Sql.Append('       ) U ');
        Sql.Append(' WHERE ( A.CODCUSTEIO = ' + CmpRptCM.ParamValues[ 2 ].AsString + ' ) ');
        Sql.Append('   AND ( A.CODALMOXARIFADO = U.CODALMOXARIFADO ) ');
        Sql.Append('   AND ( AR.CODARTIGO = U.CODARTIGO ) ');
        Sql.Append('   AND ( AR.CODPRODUTO = P.CODPRODUTO ) ');
        Sql.Append(' GROUP BY A.CODALMOXARIFADO, ');
        Sql.Append('          A.DESCALMOX, ');
        Sql.Append('          AR.CODARTIGO, ');
        Sql.Append('          P.DESCPROD ');
        Sql.Append('HAVING ( ( SUM( NVL( U.VALANT, 0 ) ) + SUM( NVL( U.VALCOMPRA, 0 ) ) - ');
        Sql.Append('           SUM( NVL( U.VALREQ, 0 ) ) - SUM( NVL( U.VALATUAL,  0 ) ) ) > 1 ) OR ');
        Sql.Append('       ( ( SUM( NVL( U.VALANT, 0 ) ) + SUM( NVL( U.VALCOMPRA, 0 ) ) - ');
        Sql.Append('           SUM( NVL( U.VALREQ, 0 ) ) - SUM( NVL( U.VALATUAL,  0 ) ) ) < -1 ) ');
        Sql.Append(' ORDER BY A.DESCALMOX, P.DESCPROD');
        Open;
   End;
end;

procedure TRptAjustFinanc.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  Case Index of
       2: sNomeCusteio := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptAjustFinanc.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault := DateToStr( Date );
end;

end.
