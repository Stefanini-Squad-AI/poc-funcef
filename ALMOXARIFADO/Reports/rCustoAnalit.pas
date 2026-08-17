// andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.
unit rCustoAnalit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands,
  ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, Db, Wwdatsrc, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, DBClient, uCMClientDataSet,
  uCmSqlParams, TXRB;

type
  TRptCustoAnalit = class(TFrmCmReport)
    bdeCustoAnalit: TppBDEPipeline;
    bdeCustAnalippField1: TppField;
    bdeCustAnalippField2: TppField;
    bdeCustAnalippField3: TppField;
    bdeCustAnalippField4: TppField;
    bdeCustAnalippField5: TppField;
    bdeCustAnalippField6: TppField;
    bdeCustAnalippField7: TppField;
    bdeCustAnalippField8: TppField;
    bdeCustAnalippField9: TppField;
    bdeCustAnalippField10: TppField;
    bdeCustAnalippField11: TppField;
    bdeCustAnalippField12: TppField;
    bdeCustAnalippField13: TppField;
    dsCustoAnalit: TwwDataSource;
    RptCustoAnalit: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel25: TppLabel;
    LblEmpresa: TppLabel;
    LbPer5: TppLabel;
    RptCustAnaliLabel2: TppLabel;
    LbGrp: TppLabel;
    ppDetailBand7: TppDetailBand;
    RptCustAnaliDBText1: TppDBText;
    RptCustAnaliDBText2: TppDBText;
    RptCustAnaliDBText3: TppDBText;
    RptCustAnaliDBText5: TppDBText;
    RptCustAnaliDBText6: TppDBText;
    RptCustAnaliDBText7: TppDBText;
    ppFooterBand7: TppFooterBand;
    LblSistema: TppLabel;
    ppLine9: TppLine;
    ppCalc12: TppSystemVariable;
    ppCalc13: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppShape1: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    RptCustAnaliDBText4: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText6: TppDBText;
    ppShape2: TppShape;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    RptCustAnaliLabel1: TppLabel;
    ppDBText118: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel34: TppLabel;
    ppDBText7: TppDBText;
    RptCustAnaliDBCalc6: TppDBCalc;
    SqlCustoAnalit: TCMSqlParams;
    CdsCustoAnalit: TCMClientDataSet;
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
  RptCustoAnalit: TRptCustoAnalit;
  sNomeGrupo: String = '';

implementation

{$R *.DFM}

procedure TRptCustoAnalit.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  If CmpRptCM.ParamValues[ 3 ].IsNull Then
     LbGrp.Caption := 'TODOS'
  Else
     LbGrp.Caption := sNomeGrupo;

  With SqlCustoAnalit Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT M.CODARTIGO, ');
       Sql.Add('       ( P.DESCPROD || '' '' || AR.CODCOR || '' '' || AR.CODTAMANHO ) AS DESCRICAO, ');
       Sql.Add('       G.CODGRUPOPROD, ');
       Sql.Add('       G.DESCGRUPOPROD, ');
       Sql.Add('       M.CODCENTROCUSTO, ');
       Sql.Add('       C.NOME, ');
       Sql.Add('       SUM( round(M.VALORMOV, 2) * -1 ) AS VALORMOV, ');
       Sql.Add('       SUM( M.QTDEMOV * -1 ) AS QTDEMOV, ');
       Sql.Add('       P.CODMEDCUSTO, ');
       Sql.Add('       DECODE( TOTGRP.TOTCC, 0, 0, ( ( SUM( round(M.VALORMOV, 2) * -1 ) ) / TOTGRP.TOTCC * 100 ) ) AS PERCGRP, ');
       Sql.Add('       DECODE( TOT.TOTAL, 0, 0, ( TOTGRP.TOTCC / TOT.TOTAL * 100 ) ) AS PERCCC, ');
       Sql.Add('       TOTGRP.TOTCC, ');
       Sql.Add('       TOT.TOTAL ');
       Sql.Add('  FROM MOVIMENT M, ');
       Sql.Add('       ALMOX A, ');
       Sql.Add('       PRODUTO P, ');
       Sql.Add('       ALMOX T, ');
       Sql.Add('       GRUPPROD G, ');
       Sql.Add('       CENTCUST C, ');
       Sql.Add('       ARTIGO AR, ');
       Sql.Add('       ( SELECT M.CODCENTROCUSTO, ');
       Sql.Add('                SUM( round(M.VALORMOV, 2) * -1 ) AS TOTCC ');
       Sql.Add('           FROM MOVIMENT M, ');
       Sql.Add('                ALMOX A, ');
       Sql.Add('                PRODUTO P, ');
       Sql.Add('                ALMOX T ');
       Sql.Add('          WHERE ( M.CODTIPOMOV <> ''A'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''K'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''Z'' ) ');
       Sql.Add('            AND ( M.DATAMOV BETWEEN TO_DATE(' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr( CmpRptCM.ParamValues[ 2 ].AsString ) + ', ''DD/MM/YYYY'' ) )');
       Sql.Add('            AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('            AND ( A.CONTABIL = ''T'' ) ');

       If Not CmpRptCM.ParamValues[ 0 ].IsNull Then
          Sql.Add('            AND ( RTRIM( M.CODCENTROCUSTO ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 0 ].AsString ) ) + ' ) ')
       Else Begin
          If Not CmpRptCM.ParamValues[ 4 ].IsNull Then
             Sql.Add('            AND ( RTRIM( M.CODCENTROCUSTO ) >= ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 4 ].AsString ) ) + ' ) ');

          If Not CmpRptCM.ParamValues[ 5 ].IsNull Then
             Sql.Add('            AND ( RTRIM( M.CODCENTROCUSTO ) <= ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 5 ].AsString ) ) + ' ) ');
       End;

       If Not CmpRptCM.ParamValues[ 3 ].IsNull Then
          Sql.Add('            AND ( RTRIM( P.CODGRUPOPROD ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 3 ].AsString ) ) + ' ) ');

       Sql.Add('            AND ( M.CODALMOXARIFADO = A.CODALMOXARIFADO ) ');
       Sql.Add('            AND ( M.CODALMOXTRANSF = T.CODALMOXARIFADO(+) ) ');
       Sql.Add('            AND ( ( M.CODALMOXTRANSF IS NULL ) OR ');
       Sql.Add('                  ( ( M.CODALMOXTRANSF IS NOT NULL ) AND ( A.CODCUSTEIO <> T.CODCUSTEIO ) AND ');
       Sql.Add('                    ( ( T.CONTABIL <> ''T'' ) OR ( T.CONTABIL IS NULL ) ) ) ) ');
       Sql.Add('            AND ( SUBSTR( M.CODARTIGO, 1, 6 ) = P.CODPRODUTO ) ');
       Sql.Add('          GROUP BY M.CODCENTROCUSTO ');
       Sql.Add('       ) TOTGRP, ');
       Sql.Add('       ( SELECT SUM( round(M.VALORMOV, 2) * -1 ) AS TOTAL ');
       Sql.Add('           FROM MOVIMENT M, ');
       Sql.Add('                ALMOX A, ');
       Sql.Add('                PRODUTO P, ');
       Sql.Add('                ALMOX T ');
       Sql.Add('          WHERE ( M.CODTIPOMOV <> ''A'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''K'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''Z'' ) ');
       Sql.Add('            AND ( M.DATAMOV BETWEEN TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) AND TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 2 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       Sql.Add('            AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('            AND ( A.CONTABIL = ''T'' ) ');

       If Not CmpRptCM.ParamValues[ 0 ].IsNull Then
          Sql.Add('            AND ( RTRIM( M.CODCENTROCUSTO ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 0 ].AsString ) ) + ' ) ')
       Else Begin
          If Not CmpRptCM.ParamValues[ 4 ].IsNull Then
             Sql.Add('            AND ( RTRIM( M.CODCENTROCUSTO ) >= ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 4 ].AsString ) ) + ' ) ');

          If Not CmpRptCM.ParamValues[ 5 ].IsNull Then
             Sql.Add('            AND ( RTRIM( M.CODCENTROCUSTO ) <= ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 5 ].AsString ) ) + ' ) ');
       End;

       If Not CmpRptCM.ParamValues[ 3 ].IsNull Then
          Sql.Add('            AND ( RTRIM( P.CODGRUPOPROD ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 3 ].AsString ) ) + ' ) ');

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
       Sql.Add('   AND ( M.DATAMOV BETWEEN TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) AND TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       Sql.Add('   AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('   AND ( A.CONTABIL = ''T'' ) ');

       If Not CmpRptCM.ParamValues[ 6 ].AsBoolean Then
          Sql.Add('   AND ( VALORMOV <> 0 ) ' );

       If Not CmpRptCM.ParamValues[ 0 ].IsNull Then
          Sql.Add('   AND ( RTRIM( M.CODCENTROCUSTO ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 0 ].AsString ) ) + ' ) ')
       Else Begin
          If Not CmpRptCM.ParamValues[ 4 ].IsNull Then
             Sql.Add('   AND ( RTRIM( M.CODCENTROCUSTO ) >= ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 4 ].AsString ) ) + ' ) ');

          If Not CmpRptCM.ParamValues[ 5 ].IsNull Then
             Sql.Add('   AND ( RTRIM( M.CODCENTROCUSTO ) <= ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 5 ].AsString ) ) + ' ) ');
       End;

       If Not CmpRptCM.ParamValues[ 3 ].IsNull Then
          Sql.Add('   AND ( RTRIM( P.CODGRUPOPROD ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 3 ].AsString ) ) + ' ) ');

       Sql.Add('   AND ( M.CODALMOXARIFADO = A.CODALMOXARIFADO ) ');
       Sql.Add('   AND ( M.CODALMOXTRANSF = T.CODALMOXARIFADO(+) ) ');
       Sql.Add('   AND ( ( M.CODALMOXTRANSF IS NULL ) OR ');
       Sql.Add('         ( ( M.CODALMOXTRANSF IS NOT NULL ) AND ( A.CODCUSTEIO <> T.CODCUSTEIO ) AND ');
       Sql.Add('           ( ( T.CONTABIL <> ''T'' ) OR ( T.CONTABIL IS NULL ) ) ) ) ');
       Sql.Add('   AND ( M.CODARTIGO = AR.CODARTIGO ) ');
       Sql.Add('   AND ( AR.CODPRODUTO = P.CODPRODUTO ) ');
       Sql.Add('   AND ( P.CODGRUPOPROD = G.CODGRUPOPROD ) ');
       Sql.Add('   AND ( M.CODCENTROCUSTO = C.CODCENTROCUSTO ) ');
       Sql.Add('   AND ( M.IDEMPRESA = C.IDEMPRESA ) ');
       Sql.Add('   AND ( M.CODCENTROCUSTO = TOTGRP.CODCENTROCUSTO ) ');
       Sql.Add(' GROUP BY M.CODARTIGO, ');
       Sql.Add('       ( P.DESCPROD || '' '' || AR.CODCOR || '' '' || AR.CODTAMANHO ), ');
       Sql.Add('       G.CODGRUPOPROD, ');
       Sql.Add('       G.DESCGRUPOPROD, ');
       Sql.Add('       M.CODCENTROCUSTO, ');
       Sql.Add('       C.NOME, ');
       Sql.Add('       P.CODMEDCUSTO, ');
       Sql.Add('       TOTGRP.TOTCC, ');
       Sql.Add('       TOT.TOTAL ');
       Sql.Add(' ORDER BY C.NOME, DESCRICAO ');
       Open;
  End;

  lbPer5.Caption := 'De ' + CmpRptCM.ParamValues[ 1 ].AsString + ' a ' + CmpRptCM.ParamValues[ 2 ].AsString;
end;

procedure TRptCustoAnalit.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  Case Index Of
       3: sNomeGrupo := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptCustoAnalit.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

end.
