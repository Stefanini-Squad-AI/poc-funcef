// andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.
unit rResFinanCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppBands, ppClass, ppCtrls, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, uCtrlParamGlobal, TXRB;

type
  TRptResFinanCC = class(TFrmCmReport)
    dbeResFinanCC: TppBDEPipeline;
    dsResFinanCC: TwwDataSource;
    rptResFinanCC: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel7: TppLabel;
    LblEmpresa: TppLabel;
    lbPer2: TppLabel;
    ppDetailBand3: TppDetailBand;
    rptResFinanCCDBText2: TppDBText;
    rptResFinanCCDBText4: TppDBText;
    rptResFinanCCDBText5: TppDBText;
    ppFooterBand3: TppFooterBand;
    LblSistema: TppLabel;
    ppLine6: TppLine;
    ppCalc5: TppSystemVariable;
    rptResFinanCCCalc1: TppSystemVariable;
    rptResFinanCCSummaryBand1: TppSummaryBand;
    rptResFinanCCShape2: TppShape;
    rptResFinanCCLabel1: TppLabel;
    rptResFinanCCLabel6: TppLabel;
    rptResFinanCCDBText7: TppDBText;
    rptResFinanCCGroup1: TppGroup;
    rptResFinanCCGroupHeaderBand1: TppGroupHeaderBand;
    rptResFinanCCDBText1: TppDBText;
    rptResFinanCCShape1: TppShape;
    rptResFinanCCLabel2: TppLabel;
    rptResFinanCCLabel3: TppLabel;
    rptResFinanCCLabel5: TppLabel;
    rptResFinanCCDBText8: TppDBText;
    rptResFinanCCGroupFooterBand1: TppGroupFooterBand;
    rptResFinanCCLabel4: TppLabel;
    rptResFinanCCDBText3: TppDBText;
    rptResFinanCCDBText6: TppDBText;
    SqlResFinanCC: TCMSqlParams;
    CdsResFinanCC: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptResFinanCC: TRptResFinanCC;
  ParamGlobal: TCtrlParamGlobal;
  sMascaraCC, sMascaraGrupo: String;

implementation

{$R *.DFM}

Uses dbasedados, uSistema, uFuncaoGeral;

procedure TRptResFinanCC.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  ParamGlobal := TCtrlParamGlobal.Create;
  ParamGlobal.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  CdsAux.Data := ParamGlobal.ListaParamGlobal( CrmRptCM.IdEmpresa );
  sMascaraCC  := CdsAux.FieldByname( 'MASCARACC' ).AsString;
  ParamGlobal.Free;
  CdsAux.Close;

  SqlAux.Sql.Text := 'SELECT MASCGRUPOPROD FROM PARALMOX WHERE ( IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' )';
  SqlAux.Open;
  sMascaraGrupo   := CdsAux.FieldByName( 'MASCGRUPOPROD' ).AsString;
  CdsAux.Close;

  CmpRptCM.ParamByName( 'GrauCentro' ).SpinEditSettings.MaxValue := FuncaoGeral.CalcGrauMax( sMascaraCC );
  CmpRptCM.ParamByName( 'GrauCentro' ).SpinEditSettings.Value    := CmpRptCM.ParamByName( 'GrauCentro' ).SpinEditSettings.MaxValue;

  CmpRptCM.ParamByName( 'GrauGrupo' ).SpinEditSettings.MaxValue := FuncaoGeral.CalcGrauMax( sMascaraGrupo );
  CmpRptCM.ParamByName( 'GrauGrupo' ).SpinEditSettings.Value    := CmpRptCM.ParamByName( 'GrauGrupo' ).SpinEditSettings.MaxValue;

  CmpRptCM.ParamByName( 'Grupo' ).LookupSettings.SQL.Text := 'SELECT CODGRUPOPROD, DESCGRUPOPROD FROM GRUPPROD ' +
                        'WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY DESCGRUPOPROD';
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

procedure TRptResFinanCC.CrmRptCMBeforePrint(Sender: TObject);
var
  sNumElemCC, sNumElemGr: String;
begin
  inherited;
  sNumElemCC := IntToStr( FuncaoGeral.CalcNumEleGrau( sMascaraCC, CmpRptCM.ParamValues[ 4 ].AsInteger ) );
  sNumElemGr := IntToStr( FuncaoGeral.CalcNumEleGrau( sMascaraGrupo, CmpRptCM.ParamValues[ 5 ].AsInteger ) );

  With SqlResFinanCC Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT SUBSTR( P.CODGRUPOPROD, 1, ' + sNumElemGr + ' ) AS CODGRUPOPROD, ');
       Sql.Add('       SUBSTR( M.CODCENTROCUSTO, 1, ' + sNumElemCC + ' ) AS CODCENTROCUSTO, ');
       Sql.Add('       G.DESCGRUPOPROD, ');
       Sql.Add('       C.NOME, ');
       Sql.Add('       SUM( round(M.VALORMOV, 2) ) * -1 AS VALORMOV, ');
       Sql.Add('       DECODE( TOTGRP.TOTCC, 0, 0, ( ( SUM( M.VALORMOV ) * -1 ) / TOTGRP.TOTCC * 100 ) ) AS PERCGRP, ');
       Sql.Add('       DECODE( TOT.TOTAL, 0, 0, ( TOTGRP.TOTCC / TOT.TOTAL * 100 ) ) AS PERCCC, ');
       Sql.Add('       TOTGRP.TOTCC, ');
       Sql.Add('       TOT.TOTAL ');
       Sql.Add('  FROM MOVIMENT M, ');
       Sql.Add('       ALMOX A, ');
       Sql.Add('       PRODUTO P, ');
       Sql.Add('       ALMOX T, ');
       Sql.Add('       GRUPPROD G, ');
       Sql.Add('       CENTCUST C, ');
       Sql.Add('       ( SELECT SUBSTR( M.CODCENTROCUSTO, 1, ' + sNumElemCC + ' ) AS CODCENTROCUSTO, ');
       Sql.Add('                SUM( round(M.VALORMOV, 2) ) * -1 AS TOTCC ');
       Sql.Add('           FROM MOVIMENT M, ');
       Sql.Add('                ALMOX A, ');
       Sql.Add('                PRODUTO P, ');
       Sql.Add('                ALMOX T ');
       Sql.Add('          WHERE ( M.CODTIPOMOV <> ''A'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''K'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''Z'' ) ');
       Sql.Add('            AND ( M.DATAMOV BETWEEN TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 2 ].AsString ) + ', ''DD/MM/YYYY'' ) AND TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 3 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       Sql.Add('            AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('            AND ( A.CONTABIL = ''T'' ) ');

       If Not CmpRptCM.ParamValues[ 0 ].IsNull Then
          Sql.Add('            AND ( RTRIM( M.CODCENTROCUSTO ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 0 ].AsString ) ) + ' ) ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then
          Sql.Add('            AND ( P.CODGRUPOPROD LIKE ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 1 ].AsString ) + '%' ) + ' ) ');

       Sql.Add('            AND ( M.CODALMOXARIFADO = A.CODALMOXARIFADO ) ');
       Sql.Add('            AND ( M.CODALMOXTRANSF = T.CODALMOXARIFADO(+) ) ');
       Sql.Add('            AND ( ( M.CODALMOXTRANSF IS NULL ) OR ');
       Sql.Add('                  ( ( M.CODALMOXTRANSF IS NOT NULL ) AND ( A.CODCUSTEIO <> T.CODCUSTEIO ) AND ');
       Sql.Add('                    ( ( T.CONTABIL <> ''T'' ) OR ( T.CONTABIL IS NULL ) ) ) ) ');
       Sql.Add('            AND ( SUBSTR(M.CODARTIGO, 1, 6 ) = P.CODPRODUTO ) ');
       Sql.Add('          GROUP BY SUBSTR( M.CODCENTROCUSTO, 1, ' + sNumElemCC + ' ) ');
       Sql.Add('       ) TOTGRP, ');
       Sql.Add('       ( SELECT SUM( round(M.VALORMOV, 2) ) * -1 AS TOTAL ');
       Sql.Add('           FROM MOVIMENT M, ');
       Sql.Add('                ALMOX A, ');
       Sql.Add('                PRODUTO P, ');
       Sql.Add('                ALMOX T ');
       Sql.Add('          WHERE ( M.CODTIPOMOV <> ''A'' )                                                  ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''K'' )                                                  ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''Z'' )                                                  ');
       Sql.Add('            AND ( M.DATAMOV BETWEEN TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 2 ].AsString ) + ', ''DD/MM/YYYY'' ) AND TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 3 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       Sql.Add('            AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('            AND ( A.CONTABIL = ''T'' ) ');

       If Not CmpRptCM.ParamValues[ 0 ].IsNull Then
          Sql.Add('            AND ( RTRIM( M.CODCENTROCUSTO ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 0 ].AsString ) ) + ' ) ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then
          Sql.Add('            AND ( P.CODGRUPOPROD LIKE ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 1 ].AsString ) + '%' ) + ' ) ');

       Sql.Add('            AND ( M.CODALMOXARIFADO = A.CODALMOXARIFADO ) ');
       Sql.Add('            AND ( M.CODALMOXTRANSF = T.CODALMOXARIFADO(+) ) ');
       Sql.Add('            AND ( ( M.CODALMOXTRANSF IS NULL ) OR ');
       Sql.Add('                  ( ( M.CODALMOXTRANSF IS NOT NULL ) AND ( A.CODCUSTEIO <> T.CODCUSTEIO ) AND ');
       Sql.Add('                    ( ( T.CONTABIL <> ''T'' ) OR ( T.CONTABIL IS NULL ) ) ) ) ');
       Sql.Add('            AND ( SUBSTR( M.CODARTIGO, 1, 6 ) = P.CODPRODUTO ) ');
       Sql.Add('       ) TOT ');
       Sql.Add(' WHERE ( M.CODTIPOMOV <> ''A'' ) ');
       Sql.Add('   AND ( M.CODTIPOMOV <> ''K'' ) ');
       Sql.Add('   AND ( M.CODTIPOMOV <> ''Z'' ) ');
       Sql.Add('   AND ( M.DATAMOV BETWEEN TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 2 ].AsString ) + ', ''DD/MM/YYYY'' ) AND TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 3 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       Sql.Add('   AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('   AND ( A.CONTABIL = ''T'' ) ');

       If Not CmpRptCM.ParamValues[ 6 ].AsBoolean Then
          Sql.Add('   AND ( VALORMOV <> 0 ) ');

       If Not CmpRptCM.ParamValues[ 0 ].IsNull Then
          Sql.Add('   AND ( RTRIM( M.CODCENTROCUSTO ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 0 ].AsString ) ) + ' ) ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then
          Sql.Add('   AND ( P.CODGRUPOPROD LIKE ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 1 ].AsString ) + '%' ) + ' ) ');

       Sql.Add('   AND ( M.CODALMOXARIFADO = A.CODALMOXARIFADO ) ');
       Sql.Add('   AND ( M.CODALMOXTRANSF = T.CODALMOXARIFADO(+) ) ');
       Sql.Add('   AND ( ( M.CODALMOXTRANSF IS NULL ) OR ');
       Sql.Add('       ( ( M.CODALMOXTRANSF IS NOT NULL ) AND ( A.CODCUSTEIO <> T.CODCUSTEIO ) AND ');
       Sql.Add('         ( ( T.CONTABIL <> ''T'' ) OR ( T.CONTABIL IS NULL ) ) ) ) ');
       Sql.Add('   AND ( SUBSTR(M.CODARTIGO, 1, 6 ) = P.CODPRODUTO ) ');

       If CmpRptCM.ParamValues[ 1 ].IsNull Then
          Sql.Add('   AND ( RTRIM( SUBSTR( P.CODGRUPOPROD, 1, ' + sNumElemGr + ' ) ) = RTRIM( G.CODGRUPOPROD ) ) ')
       Else
          Sql.Add('   AND ( P.CODGRUPOPROD = G.CODGRUPOPROD ) ');

       Sql.Add('   AND ( RTRIM( SUBSTR( M.CODCENTROCUSTO, 1, ' + sNumElemCC + ' ) ) = RTRIM( C.CODCENTROCUSTO(+) ) ) ');
       Sql.Add('   AND ( M.IDEMPRESA = C.IDEMPRESA(+) ) ');
       Sql.Add('   AND ( SUBSTR( M.CODCENTROCUSTO, 1, ' + sNumElemCC + ' ) = TOTGRP.CODCENTROCUSTO(+) ) ');
       Sql.Add(' GROUP BY SUBSTR( P.CODGRUPOPROD, 1, ' + sNumElemGr + ' ), ');
       Sql.Add('          SUBSTR( M.CODCENTROCUSTO, 1, ' + sNumElemCC + ' ), ');
       Sql.Add('          G.DESCGRUPOPROD, ');
       Sql.Add('          C.NOME, ');
       Sql.Add('          TOTGRP.TOTCC, ');
       Sql.Add('          TOT.TOTAL ');
       Sql.Add(' ORDER BY C.NOME, ');
       Sql.Add('          G.DESCGRUPOPROD ');
       Open;
  End;

  lbPer2.Caption := 'De ' + CmpRptCM.ParamValues[ 2 ].AsString + ' a ' + CmpRptCM.ParamValues[ 3 ].AsString;
end;

end.
