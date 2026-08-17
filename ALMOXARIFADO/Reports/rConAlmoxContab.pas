//andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.
unit rConAlmoxContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppCtrls,
  ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Wwdatsrc,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport, TXRB;

type
  TRptConAlmoxContab = class(TFrmCmReport)
    bdeConAlmoxContab: TppBDEPipeline;
    dsConAlmoxContab: TwwDataSource;
    RptConAlmoxContab: TppReport;
    ppHeaderBand26: TppHeaderBand;
    ppLabel155: TppLabel;
    ppLine70: TppLine;
    LblEmpresa: TppLabel;
    RptConAlmoxContabLine1: TppLine;
    RptConAlmoxContabLine2: TppLine;
    RptConAlmoxContabLine3: TppLine;
    RptConAlmoxContabLine4: TppLine;
    RptConAlmoxContabLabel1: TppLabel;
    RptConAlmoxContabLabel2: TppLabel;
    RptConAlmoxContabLabel3: TppLabel;
    LbPer13: TppLabel;
    RptConAlmoxContabLabel5: TppLabel;
    RptConAlmoxContabLabel6: TppLabel;
    RptConAlmoxContabLabel7: TppLabel;
    RptConAlmoxContabLabel8: TppLabel;
    RptConAlmoxContabLabel9: TppLabel;
    RptConAlmoxContabLabel10: TppLabel;
    RptConAlmoxContabLabel11: TppLabel;
    LbConta: TppLabel;
    RptConAlmoxContabLabel4: TppLabel;
    RptConAlmoxContabLabel12: TppLabel;
    LbDif: TppLabel;
    LbInteg: TppLabel;
    ppDetailBand20: TppDetailBand;
    RptConAlmoxContabDBText1: TppDBText;
    RptConAlmoxContabDBText2: TppDBText;
    RptConAlmoxContabDBText3: TppDBText;
    RptConAlmoxContabDBText4: TppDBText;
    RptConAlmoxContabDBText5: TppDBText;
    RptConAlmoxContabDBText6: TppDBText;
    RptConAlmoxContabDBText7: TppDBText;
    ppFooterBand26: TppFooterBand;
    ppLine71: TppLine;
    LblSistema: TppLabel;
    ppCalc50: TppSystemVariable;
    ppCalc51: TppSystemVariable;
    RptConAlmoxContabSummaryBand1: TppSummaryBand;
    RptConAlmoxContabLabel13: TppLabel;
    RptConAlmoxContabDBCalc1: TppDBCalc;
    RptConAlmoxContabDBCalc2: TppDBCalc;
    RptConAlmoxContabDBCalc3: TppDBCalc;
    RptConAlmoxContabDBCalc4: TppDBCalc;
    RptConAlmoxContabDBCalc5: TppDBCalc;
    RptConAlmoxContabDBCalc6: TppDBCalc;
    SqlConAlmoxContab: TCMSqlParams;
    CdsConAlmoxContab: TCMClientDataSet;
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
  RptConAlmoxContab: TRptConAlmoxContab;
  sNomeConta: String = '';

implementation

{$R *.DFM}

procedure TRptConAlmoxContab.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  LbInteg.Caption := ' NÃO ';
  LbDif.Caption   := ' NÃO ';

  With SqlConAlmoxContab Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT UN.DATA, ');
       Sql.Add('       UN.CONTA, ');
       Sql.Add('       SUM( UN.ALMOXCREDITO ) AS ALMOXCREDITO, ');
       Sql.Add('       SUM( UN.ALMOXDEBITO ) AS ALMOXDEBITO, ');
       Sql.Add('       SUM( UN.CONTABCREDITO ) AS CONTABCREDITO, ');
       Sql.Add('       SUM( UN.CONTABDEBITO ) AS CONTABDEBITO, ');
       Sql.Add('       SUM( ( UN.ALMOXCREDITO - UN.CONTABCREDITO ) ) AS DIFCREDITO, ');
       Sql.Add('       SUM( ( UN.ALMOXDEBITO - UN.CONTABDEBITO ) ) AS DIFDEBITO ');
       Sql.Add('  FROM ( SELECT M.DATAMOV AS DATA, ');
       Sql.Add('                DECODE( ART.CONTA, NULL, GRP.CONTA, ART.CONTA ) AS CONTA, ');
       Sql.Add('                SUM( DECODE( M.CODTIPOMOV, ''A'', 0, DECODE( SIGN( round(M.VALORMOV, 2) ), -1, round(M.VALORMOV, 2) * -1, 0 ) ) ) AS  ALMOXCREDITO, ');
       Sql.Add('                SUM( DECODE( M.CODTIPOMOV, ''A'', round(M.VALORMOV, 2), DECODE( SIGN( round(M.VALORMOV, 2) ), 1, round(M.VALORMOV, 2), 0 ) ) ) AS ALMOXDEBITO,          ');
       Sql.Add('                ( 0 ) AS CONTABCREDITO, ');
       Sql.Add('                ( 0 ) AS CONTABDEBITO ');
       Sql.Add('           FROM MOVIMENT M, ');
       Sql.Add('                PRODUTO P, ');
       Sql.Add('                ALMOX A, ');
       Sql.Add('                ALMOX T, ');
       Sql.Add('                ( SELECT CODARTIGO, ');
       Sql.Add('                         CONTAENTRADA AS CONTA ');
       Sql.Add('                    FROM ARTXCONTAXCC ');
       Sql.Add('                   GROUP BY CODARTIGO, CONTAENTRADA ');
       Sql.Add('                ) ART, ');
       Sql.Add('                ( SELECT CODGRUPOPROD, ');
       Sql.Add('                         CONTAENTRADA AS CONTA ');
       Sql.Add('                    FROM ARTXCONTAXCC ');
       Sql.Add('                   GROUP BY CODGRUPOPROD, CONTAENTRADA ');
       Sql.Add('                ) GRP ');
       Sql.Add('          WHERE ( M.DATAMOV >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       Sql.Add('            AND ( M.DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 2 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       Sql.Add('            AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('            AND ( A.CONTABIL = ''T'' ) AND ( M.CODTIPOMOV <> ''Z'' ) ');
       Sql.Add('            AND ( M.CODALMOXARIFADO = A.CODALMOXARIFADO ) ');
       Sql.Add('            AND ( M.CODALMOXTRANSF = T.CODALMOXARIFADO(+) ) ');
       Sql.Add('            AND ( ( M.CODALMOXTRANSF IS NULL ) OR ');
       Sql.Add('                  ( ( M.CODALMOXTRANSF IS NOT NULL ) AND ( A.CODCUSTEIO <> T.CODCUSTEIO ) AND ');
       Sql.Add('                    ( ( T.CONTABIL <> ''T'' ) OR ( T.CONTABIL IS NULL ) ) ) ) ');
       Sql.Add('            AND ( SUBSTR( M.CODARTIGO, 1, 6 ) = P.CODPRODUTO ) ');
       Sql.Add('            AND ( M.CODARTIGO = ART.CODARTIGO(+) ) ');
       Sql.Add('            AND ( P.CODGRUPOPROD = GRP.CODGRUPOPROD(+) ) ');
       Sql.Add('          GROUP BY M.DATAMOV, ');
       Sql.Add('                   DECODE( ART.CONTA, NULL, GRP.CONTA, ART.CONTA ), ');
       Sql.Add('                   DECODE( ART.CONTA, NULL, ''G'', ''A'' ) ');
       Sql.Add('         UNION ALL ');
       Sql.Add('         SELECT PLN.PLNDATDIA AS DATA, ');
       Sql.Add('                LAC.PLACONTA AS CONTA, ');
       Sql.Add('                ( 0 ) AS ALMOXCREDITO, ');
       Sql.Add('                ( 0 ) AS ALMOXDEBITO, ');
       Sql.Add('                SUM( DECODE( LAC.LACDEBCRE, ''C'', LAC.LACVALOR, 0 ) ) AS CONTABCREDITO, ');
       Sql.Add('                SUM( DECODE( LAC.LACDEBCRE, ''D'', LAC.LACVALOR, 0 ) ) AS CONTABDEBITO ');
       Sql.Add('           FROM LANCAMENTO LAC, ');
       Sql.Add('                PLANILHA PLN ');
       Sql.Add('          WHERE ( PLN.PLNDATDIA >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       Sql.Add('            AND ( PLN.PLNDATDIA <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 2 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');

       If CmpRptCM.ParamValues[ 4 ].AsBoolean Then Begin
          LbInteg.Caption := ' SIM ';
          Sql.Add('            AND ( PLN.PLNEFETIVADO = ''S'' ) ');
       End;

       Sql.Add('            AND ( PLN.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('            AND ( PLN.PLNCODIGO = LAC.PLNCODIGO ) ');
       Sql.Add('          GROUP BY PLN.PLNDATDIA, LAC.PLACONTA ');
       Sql.Add('       ) UN ');
       Sql.Add(' WHERE ( RTRIM( UN.CONTA ) = ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ' ) ');
       Sql.Add(' GROUP BY UN.DATA, ');
       Sql.Add('          UN.CONTA ');

       If CmpRptCM.ParamValues[ 3 ].AsBoolean Then Begin
          LbDif.Caption := ' SIM ';
          Sql.Add(' HAVING ( SUM( ( UN.ALMOXCREDITO - UN.CONTABCREDITO ) ) <> 0 ) OR ');
          Sql.Add('        ( SUM( ( UN.ALMOXDEBITO - UN.CONTABDEBITO ) ) <> 0 ) ');
       End;

       Sql.Add(' ORDER BY UN.DATA, UN.CONTA ');
       Open;
  End;

  LbConta.Caption := sNomeConta;
  LbPer13.Caption := 'De ' + CmpRptCM.ParamValues[ 1 ].AsString + ' a ' + CmpRptCM.ParamValues[ 2 ].AsString;
end;

procedure TRptConAlmoxContab.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeConta := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptConAlmoxContab.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

end.
