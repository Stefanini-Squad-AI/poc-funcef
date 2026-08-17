// andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.
unit rTotFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppCtrls,
  ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Wwdatsrc,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport, TXRB;

type
  TRptTotFinanc = class(TFrmCmReport)
    bdeTotFinanc: TppBDEPipeline;
    dsTotFinanc: TwwDataSource;
    RptTotFinanc: TppReport;
    ppHeaderBand30: TppHeaderBand;
    ppLabel188: TppLabel;
    ppLine78: TppLine;
    LblEmpresa: TppLabel;
    LbPer16: TppLabel;
    LbDisplay: TppLabel;
    LbUnCusteio2: TppLabel;
    RptTotFinancLabel2: TppLabel;
    RptTotFinancLine1: TppLine;
    RptTotFinancLabel3: TppLabel;
    RptTotFinancLine2: TppLine;
    RptTotFinancLabel4: TppLabel;
    RptTotFinancLabel5: TppLabel;
    RptTotFinancLabel6: TppLabel;
    RptTotFinancLabel7: TppLabel;
    RptTotFinancLabel1: TppLabel;
    ppDetailBand24: TppDetailBand;
    RptTotFinancDBText1: TppDBText;
    RptTotFinancDBText2: TppDBText;
    RptTotFinancDBText4: TppDBText;
    RptTotFinancDBText5: TppDBText;
    RptTotFinancDBText6: TppDBText;
    RptTotFinancDBText3: TppDBText;
    ppFooterBand30: TppFooterBand;
    ppLine79: TppLine;
    LblSistema: TppLabel;
    ppCalc58: TppSystemVariable;
    ppCalc59: TppSystemVariable;
    RptTotFinancSummaryBand1: TppSummaryBand;
    RptTotFinancLabel8: TppLabel;
    RptTotFinancDBCalc1: TppDBCalc;
    RptTotFinancDBCalc2: TppDBCalc;
    RptTotFinancDBCalc3: TppDBCalc;
    RptTotFinancDBCalc4: TppDBCalc;
    RptTotFinancDBCalc5: TppDBCalc;
    SqlTotFinanc: TCMSqlParams;
    CdsTotFinanc: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptTotFinanc: TRptTotFinanc;
  sNomeAlmox: String = '';
  sNomeGrupo: String = '';

implementation

{$R *.DFM}

procedure TRptTotFinanc.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

procedure TRptTotFinanc.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       2: sNomeAlmox := Sender.CtrlLookup.Text;
       3: sNomeGrupo := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptTotFinanc.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  lbPer16.Caption  := 'De ' + CmpRptCM.ParamValues[ 0 ].AsString + ' a ' + CmpRptCM.ParamValues[ 1 ].AsString;

  With SqlTotFinanc Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT A.CODALMOXARIFADO, ');
       Sql.Add('       A.DESCALMOX, ');
       Sql.Add('       DECODE( VALANT.VALANT, NULL, 0,VALANT.VALANT ) AS VALANT, ');
       Sql.Add('       DECODE( VALCOMPRA.VALCOMPRA, NULL, 0, VALCOMPRA.VALCOMPRA ) AS VALCOMPRA, ');
       Sql.Add('       DECODE( VALREQ.VALREQ, NULL, 0, VALREQ.VALREQ ) AS VALREQ, ');
       Sql.Add('       ( DECODE( VALANT.VALANT, NULL, 0, VALANT.VALANT ) + ');
       Sql.Add('         DECODE( VALCOMPRA.VALCOMPRA, NULL, 0, VALCOMPRA.VALCOMPRA ) - ');
       Sql.Add('         DECODE( VALREQ.VALREQ, NULL, 0, VALREQ.VALREQ ) - ');
       Sql.Add('         DECODE( VALATU.VALATUAL, NULL, 0, VALATU.VALATUAL ) ) AS AJUSTE, ');
       Sql.Add('       DECODE( VALATU.VALATUAL, NULL, 0, VALATU.VALATUAL ) AS VALATUAL ');
       Sql.Add('  FROM ALMOX A, ');
       Sql.Add('       ( SELECT VA.CODALMOXARIFADO, ');
       Sql.Add('                SUM( VA.VALOR ) AS VALANT ');
       Sql.Add('           FROM ( SELECT M.CODALMOXARIFADO, ');
       Sql.Add('                         M.CODARTIGO, ');
       Sql.Add('                         ( M.SALDOQTDEMOV * M.CUSTOMEDIOMOV ) AS VALOR ');
       Sql.Add('                    FROM MOVIMENT M, ');
       Sql.Add('                         ( SELECT M.CODALMOXARIFADO, ');
       Sql.Add('                                  M.CODARTIGO, ');
       Sql.Add('                                  MAX( M.IDMOV ) AS IDMOV ');
       Sql.Add('                             FROM MOVIMENT M, ');
       Sql.Add('                                  ( SELECT M.CODALMOXARIFADO, ');
       Sql.Add('                                           M.CODARTIGO, ');
       Sql.Add('                                           MAX( M.DATAMOV ) AS DATAMOV ');
       Sql.Add('                                      FROM MOVIMENT M, ARTIGO A, PRODUTO P ');
       Sql.Add('                                     WHERE ( M.DATAMOV < TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');

       If CmpRptCM.ParamValues[ 4 ].AsBoolean Then
          Sql.Add('                                       AND ( P.ITEMESTOCAVEL = ''S'' ) ');

       Sql.Add('                                       AND ( M.CODARTIGO = A.CODARTIGO ) ');
       Sql.Add('                                       AND ( P.CODPRODUTO = A.CODPRODUTO ) ');
       Sql.Add('                                     GROUP BY M.CODALMOXARIFADO, M.CODARTIGO ');
       Sql.Add('                                  ) SUB1 ');
       Sql.Add('                            WHERE ( M.CODARTIGO = SUB1.CODARTIGO ) ');
       Sql.Add('                              AND ( M.CODALMOXARIFADO = SUB1.CODALMOXARIFADO ) ');
       Sql.Add('                              AND ( M.DATAMOV = SUB1.DATAMOV ) ');
       Sql.Add('                            GROUP BY M.CODALMOXARIFADO, M.CODARTIGO ');
       Sql.Add('                         ) AUX ');
       Sql.Add('                   WHERE ( M.CODARTIGO = AUX.CODARTIGO ) ');
       Sql.Add('                     AND ( M.CODALMOXARIFADO = AUX.CODALMOXARIFADO ) ');
       Sql.Add('                     AND ( M.IDMOV = AUX.IDMOV ) ');
       Sql.Add('                ) VA                                                                          ');
       Sql.Add('          GROUP BY VA.CODALMOXARIFADO ' );
       Sql.Add('       ) VALANT, ');
       Sql.Add('       ( SELECT VA.CODALMOXARIFADO, ');
       Sql.Add('                SUM( VA.VALOR ) AS VALATUAL ');
       Sql.Add('           FROM ( SELECT M.CODALMOXARIFADO, ');
       Sql.Add('                         M.CODARTIGO, ');
       Sql.Add('                         ( M.SALDOQTDEMOV * M.CUSTOMEDIOMOV ) AS VALOR ');
       Sql.Add('                    FROM MOVIMENT M, ');
       Sql.Add('                         ( SELECT M.CODALMOXARIFADO, ');
       Sql.Add('                                  M.CODARTIGO, ');
       Sql.Add('                                  MAX( M.IDMOV ) AS IDMOV ');
       Sql.Add('                             FROM MOVIMENT M, ');
       Sql.Add('                                  ( SELECT M.CODALMOXARIFADO, ');
       Sql.Add('                                           M.CODARTIGO, ');
       Sql.Add('                                           MAX( M.DATAMOV ) AS DATAMOV ');
       Sql.Add('                                      FROM MOVIMENT M, ARTIGO A, PRODUTO P ');
       Sql.Add('                                     WHERE ( M.DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');

       If CmpRptCM.ParamValues[ 4 ].AsBoolean Then
          Sql.Add('                                       AND ( P.ITEMESTOCAVEL = ''S'' ) ');

       Sql.Add('                                       AND ( M.CODARTIGO = A.CODARTIGO ) ');
       Sql.Add('                                       AND ( P.CODPRODUTO = A.CODPRODUTO ) ');
       Sql.Add('                                     GROUP BY M.CODALMOXARIFADO, M.CODARTIGO ');
       Sql.Add('                                  ) SUB1 ');
       Sql.Add('                            WHERE ( M.CODARTIGO = SUB1.CODARTIGO ) ');
       Sql.Add('                              AND ( M.CODALMOXARIFADO = SUB1.CODALMOXARIFADO ) ');
       Sql.Add('                              AND ( M.DATAMOV = SUB1.DATAMOV ) ');
       Sql.Add('                            GROUP BY M.CODALMOXARIFADO, M.CODARTIGO ');
       Sql.Add('                         ) AUX ');
       Sql.Add('                   WHERE ( M.CODARTIGO = AUX.CODARTIGO ) ');
       Sql.Add('                     AND ( M.CODALMOXARIFADO = AUX.CODALMOXARIFADO ) ');
       Sql.Add('                     AND ( M.IDMOV = AUX.IDMOV ) ');
       Sql.Add('                ) VA ');
       Sql.Add('          GROUP BY VA.CODALMOXARIFADO ' );
       SQl.Add('       ) VALATU, ');
       Sql.Add('       ( SELECT M.CODALMOXARIFADO, ');
       Sql.Add('                SUM( round(M.VALORMOV, 2) ) AS VALCOMPRA ');
       Sql.Add('           FROM MOVIMENT M, ARTIGO A, PRODUTO P ');
       Sql.Add('          WHERE ( M.DATAMOV >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       Sql.Add('            AND ( M.DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');

       If CmpRptCM.ParamValues[ 4 ].AsBoolean Then
          Sql.Add('            AND ( P.ITEMESTOCAVEL = ''S'' ) ');

       Sql.Add('            AND ( M.CODARTIGO = A.CODARTIGO ) ');
       Sql.Add('            AND ( P.CODPRODUTO = A.CODPRODUTO ) ');
       Sql.Add('            AND ( ( M.CODTIPOMOV = ''K'' ) OR ( M.CODTIPOMOV = ''A'' ) OR ( M.CODTIPOMOV = ''B'' ) OR ( M.CODTIPOMOV = ''Z'' ) ) ');
       Sql.Add('          GROUP BY M.CODALMOXARIFADO ');
       Sql.Add('       ) VALCOMPRA, ');
       Sql.Add('       ( SELECT M.CODALMOXARIFADO, ');
       Sql.Add('                SUM( round(M.VALORMOV, 2) ) * -1 AS VALREQ ');
       Sql.Add('           FROM MOVIMENT M, ARTIGO A, PRODUTO P ');
       Sql.Add('          WHERE ( M.DATAMOV >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       Sql.Add('            AND ( M.DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');

       If CmpRptCM.ParamValues[ 4 ].AsBoolean Then
          Sql.Add('            AND ( P.ITEMESTOCAVEL = ''S'' ) ');

       Sql.Add('            AND ( M.CODARTIGO = A.CODARTIGO ) ');
       Sql.Add('            AND ( P.CODPRODUTO = A.CODPRODUTO ) ');
       Sql.Add('            AND ( ( M.CODTIPOMOV <> ''K'' ) AND ( M.CODTIPOMOV <> ''A'' ) AND ( M.CODTIPOMOV <> ''Z'' ) AND ( M.CODTIPOMOV <> ''B'' ) ) ');
       Sql.Add('          GROUP BY M.CODALMOXARIFADO ');
       Sql.Add('       ) VALREQ ');
       Sql.Add(' WHERE ');

       If Not CmpRptCM.ParamValues[ 3 ].IsNull Then Begin
          lbDisplay.Caption    := '      Almoxarifado:';
          lbUnCusteio2.Caption := sNomeAlmox;
          Sql.Add('       ( A.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 3 ].AsString + ' ) ')
       End Else Begin
          lbDisplay.Caption    := 'Unidade de Custeio:';
          lbUnCusteio2.Caption := sNomeGrupo;
          Sql.Add('       ( A.CODCUSTEIO = ' + CmpRptCM.ParamValues[ 2 ].AsString + ' ) ')
       End;

       Sql.Add('   AND ( A.CODALMOXARIFADO = VALANT.CODALMOXARIFADO ) ');
       Sql.Add('   AND ( A.CODALMOXARIFADO = VALATU.CODALMOXARIFADO ) ');
       Sql.Add('   AND ( A.CODALMOXARIFADO = VALCOMPRA.CODALMOXARIFADO(+) ) ');
       Sql.Add('   AND ( A.CODALMOXARIFADO = VALREQ.CODALMOXARIFADO(+) ) ');
       Sql.Add(' ORDER BY A.DESCALMOX');
       Open;
  End;
end;

end.
