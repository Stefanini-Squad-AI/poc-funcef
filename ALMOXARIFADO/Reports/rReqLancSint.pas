unit rReqLancSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, uCmRptManager,
  TXComp, CmParamReport, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl,
  ppCache, ppProd, ppReport, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE;

type
  TRptReqLancSint = class(TFrmCmReport)
    SqlReqLancSint: TCMSqlParams;
    CdsReqLancSint: TCMClientDataSet;
    bdeReqLancSint: TppBDEPipeline;
    bdeReqLancSintppField1: TppField;
    bdeReqLancSintppField2: TppField;
    bdeReqLancSintppField3: TppField;
    bdeReqLancSintppField4: TppField;
    bdeReqLancSintppField5: TppField;
    bdeReqLancSintppField6: TppField;
    bdeReqLancSintppField7: TppField;
    bdeReqLancSintppField8: TppField;
    dsReqLancSint: TwwDataSource;
    RptReqLancSint: TppReport;
    ppHeaderBand35: TppHeaderBand;
    ppLabel215: TppLabel;
    lblEmpresa: TppLabel;
    ppLine93: TppLine;
    ppLabel218: TppLabel;
    ppLabel219: TppLabel;
    rpRequisicaoLabel13: TppLabel;
    LbTipo: TppLabel;
    rpExtratoContaLabel10: TppLabel;
    lbData: TppLabel;
    rpRequisicaoLabel10: TppLabel;
    lbAlmox13: TppLabel;
    ppLine94: TppLine;
    ppDetailBand30: TppDetailBand;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppFooterBand36: TppFooterBand;
    ppLine92: TppLine;
    LblSistema: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand6: TppSummaryBand;
    ppLine95: TppLine;
    ppLabel222: TppLabel;
    ppDBCalc19: TppDBCalc;
    ppGroup13: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppLine97: TppLine;
    ppDBText93: TppDBText;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppDBCalc20: TppDBCalc;
    ppLine96: TppLine;
    ppLabel221: TppLabel;
    ppGroup14: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppLine91: TppLine;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText90: TppDBText;
    ppLabel220: TppLabel;
    ppGroupFooterBand11: TppGroupFooterBand;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDetailBand30BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptReqLancSint: TRptReqLancSint;
  sNomeAlmox:  String = '';
  sNomeCCusto: String = '';

implementation

{$R *.DFM}

procedure TRptReqLancSint.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY DESCALMOX';
  CmpRptCM.ParamByName( 'CCusto' ).LookupSettings.SQL.Text := 'SELECT CODCENTROCUSTO, NOME FROM CENTCUST ' +
                        'WHERE IDEMPRESA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY NOME';
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

procedure TRptReqLancSint.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       2: sNomeAlmox  := Sender.CtrlLookup.Text;
       3: sNomeCCusto := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptReqLancSint.CrmRptCMBeforePrint(Sender: TObject);
Var
  x: Integer;
begin
  inherited;
  CdsReqLancSint.Close;
  SqlReqLancSint.SQL.Text := 'SELECT MASCGRUPOPROD FROM PARALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa );
  SqlReqLancSint.Open;
  x := Pos( '.', CdsReqLancSint.FieldByName( 'MASCGRUPOPROD' ).AsString ) - 1;
  CdsReqLancSint.Close;

  LbTipo.Caption := CmpRptCM.ParamByName( 'Tipo' ).RadioGroupSettings.Items[ CmpRptCM.ParamValues[ 4 ].AsInteger ];
  lbData.caption := CmpRptCM.ParamValues[ 0 ].AsString + ' a ' + CmpRptCM.ParamValues[ 1 ].AsString;

  If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
     lbAlmox13.caption := sNomeAlmox;

  With SqlReqLancSint Do Begin
       Sql.Clear;
       Sql.add('SELECT M.CODCENTROCUSTO, ');
       Sql.add('       MIN( C.NOME ) AS DESCC, ');
       Sql.add('       G.STATUSGRUPO, ');
       Sql.add('       P.CODGRUPOPROD AS GRUPO, ');
       Sql.add('       MAX( SUBSTR( P.CODGRUPOPROD, 1, ' + IntToStr( x ) + ' ) ) AS QUEBRA, ');
       Sql.add('       G.DESCGRUPOPROD, ');
       Sql.add('       SUM( ( M.VALORMOV * ( -1 ) ) ) AS VALORMOV, ');
       Sql.add('       ( 0 ) AS TOTAL ');
       Sql.add('  FROM MOVIMENT M, ');
       Sql.add('       PRODUTO P, ');
       Sql.add('       ARTIGO A, ');
       Sql.add('       GRUPPROD G, ');
       Sql.add('       CENTCUST C ');
       Sql.add(' WHERE ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.add('   AND ( M.DATAMOV >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       Sql.add('   AND ( M.DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');

       Case CmpRptCM.ParamValues[ 4 ].AsInteger Of
            0: Sql.add('   AND ( M.CODTIPOMOV <> ''Z'' ) AND ( M.CODTIPOMOV <> ''A'' ) AND ( M.CODTIPOMOV <> ''K'' ) AND ( M.CODTIPOMOV <> ''B'' ) ');
            1: Sql.add('   AND ( ( M.CODTIPOMOV = ''E'' ) OR ( M.CODTIPOMOV = ''P'' ) ) ');
            2: Sql.add('   AND ( M.CODTIPOMOV = ''I'' ) ');
            3: Sql.add('   AND ( M.CODTIPOMOV IN ( ''F'', ''T'', ''G'', ''U'', ''R'', ''S'' ) ) ');
       End;

       If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
           Sql.add('   AND ( M.CODALMOXARIFADO = ' + Trim( CmpRptCM.ParamValues[ 2 ].AsString )+ ' ) ' );

       If Not CmpRptCM.ParamValues[ 3 ].IsNull Then
           Sql.add('   AND ( RTRIM( M.CODCENTROCUSTO ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 3 ].AsString ) ) + ' )' );

       Sql.add('   AND ( M.IDPESSOA = C.IDEMPRESA ) ');
       Sql.add('   AND ( M.CODCENTROCUSTO = C.CODCENTROCUSTO ) ');
       Sql.add('   AND ( A.CODARTIGO = M.CODARTIGO ) ');
       Sql.add('   AND ( A.CODPRODUTO   = P.CODPRODUTO ) ');
       Sql.add('   AND ( P.CODGRUPOPROD = G.CODGRUPOPROD ) ');
       Sql.add(' GROUP BY M.CODCENTROCUSTO, ');
       Sql.add('          G.STATUSGRUPO, ');
       Sql.add('          P.CODGRUPOPROD, ');
       Sql.add('          G.DESCGRUPOPROD ');
       Sql.add('UNION ALL ');
       Sql.add('SELECT M.CODCENTROCUSTO, ');
       Sql.add('       MIN( C.NOME ) AS DESCC, ');
       Sql.add('       G.STATUSGRUPO, ');
       Sql.add('       G.CODGRUPOPROD AS GRUPO, ');
       Sql.add('       MAX( SUBSTR( P.CODGRUPOPROD, 1, ' + IntToStr( x ) + ' ) ) AS QUEBRA, ');
       Sql.add('       G.DESCGRUPOPROD, ');
       Sql.add('       ( 0 ) AS VALORMOV, ');
       Sql.add('       SUM( ( M.VALORMOV * ( -1 ) ) ) AS TOTAL ');
       Sql.add('  FROM MOVIMENT M, ');
       Sql.add('       PRODUTO P, ');
       Sql.add('       ARTIGO A, ');
       Sql.add('       GRUPPROD G, ');
       Sql.add('       CENTCUST C ');
       Sql.add(' WHERE ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.add('   AND ( M.DATAMOV >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       Sql.add('   AND ( M.DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');

       Case CmpRptCM.ParamValues[ 4 ].AsInteger Of
            0: Sql.add('   AND ( M.CODTIPOMOV <> ''Z'' ) AND ( M.CODTIPOMOV <> ''A'' ) AND ( M.CODTIPOMOV <> ''K'' ) AND ( M.CODTIPOMOV <> ''B'' ) ');
            1: Sql.add('   AND ( ( M.CODTIPOMOV = ''E'' ) OR ( M.CODTIPOMOV = ''P'' ) ) ');
            2: Sql.add('   AND ( M.CODTIPOMOV = ''I'' ) ');
            3: Sql.add('   AND ( M.CODTIPOMOV IN ( ''F'', ''T'', ''G'', ''U'', ''R'', ''S'' ) ) ');
       End;

       If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
           Sql.add('   AND ( M.CODALMOXARIFADO = ' + Trim( CmpRptCM.ParamValues[ 2 ].AsString )+ ' ) ' );

       If Not CmpRptCM.ParamValues[ 3 ].IsNull Then
           Sql.add('   AND ( RTRIM( M.CODCENTROCUSTO ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 3 ].AsString ) ) + ' )' );

       Sql.add('   AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.add('   AND ( M.IDPESSOA = C.IDEMPRESA ) ');
       Sql.add('   AND ( M.CODCENTROCUSTO = C.CODCENTROCUSTO ) ');
       Sql.add('   AND ( G.STATUSGRUPO = ''S'' ) ');
       Sql.add('   AND ( G.CODGRUPOPROD LIKE SUBSTR( RTRIM( P.CODGRUPOPROD ), 1, ' + IntToStr( x ) + ' ) || ''%'' ) ');
       Sql.add('   AND ( A.CODARTIGO = M.CODARTIGO ) ');
       Sql.add('   AND ( A.CODPRODUTO = P.CODPRODUTO ) ');
       Sql.add(' GROUP BY M.CODCENTROCUSTO, ');
       Sql.add('          G.STATUSGRUPO, ');
       Sql.add('          G.CODGRUPOPROD, ');
       Sql.add('          G.DESCGRUPOPROD ');
       Sql.add(' ORDER BY CODCENTROCUSTO, GRUPO ');
       Open;
  End;
end;

procedure TRptReqLancSint.ppDetailBand30BeforePrint(Sender: TObject);
begin
  inherited;
  ppDetailBand30.Visible := ( CdsReqlancSint.FieldByName( 'STATUSGRUPO' ).AsString <> 'S' );
end;

end.
