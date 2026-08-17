unit rInventFFData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppBands, ppClass, ppCtrls, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TRptInventFFData = class(TFrmCmReport)
    dsInventFFData: TwwDataSource;
    SqlInventFFData: TCMSqlParams;
    CdsInventFFData: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    bdeInventFFData: TppBDEPipeline;
    RptInventFFData: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel47: TppLabel;
    ppLine19: TppLine;
    LblEmpresa: TppLabel;
    lbAlmox4: TppLabel;
    ppLine20: TppLine;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    lbPer4: TppLabel;
    RptInventFFDataLabel1: TppLabel;
    LbFiltro: TppLabel;
    DetInventDt: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine21: TppLine;
    LblSistema: TppLabel;
    ppCalc18: TppSystemVariable;
    ppCalc19: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLabel58: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppGroup4: TppGroup;
    CabecInventDt: TppGroupHeaderBand;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    LinInventDt: TppLine;
    lblTotInventDt: TppDBText;
    RodapeInventDt: TppGroupFooterBand;
    ppDBCalc4: TppDBCalc;
    ppLabel60: TppLabel;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CabecInventDtBeforePrint(Sender: TObject);
    procedure DetInventDtBeforePrint(Sender: TObject);
    procedure RodapeInventDtBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptInventFFData: TRptInventFFData;
  sNomeAlmox: String = '';
  sNomeGrupo: String = '';

implementation

{$R *.DFM}

procedure TRptInventFFData.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CodAlmoxarifado, DescAlmox FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';

  SqlAux.Sql.Text := 'SELECT DATAREPRESA FROM PARALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa );
  SqlAux.Open;
  CmpRptCM.ParamByName( 'DataLimite' ).TextDefault := DateToStr( CdsAux.FieldByName( 'DATAREPRESA' ).AsDateTime );
  CdsAux.Close;
end;

procedure TRptInventFFData.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
       1: sNomeGrupo := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptInventFFData.CrmRptCMBeforePrint(Sender: TObject);
var
  ipos: Integer;
Begin
  inherited;
  CdsAux.Close;
  SqlAux.SQL.text := 'SELECT MASCGRUPOPROD FROM PARALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa );
  SqlAux.Open;
  ipos := Pos( '.', CdsAux.FieldByName( 'MASCGRUPOPROD' ).AsString ) - 1;
  CdsAux.Close;
//  SqlAux.SQL.text := 'SELECT CODCUSTEIO FROM ALMOX WHERE CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString;
//  SqlAux.Open;

  With SqlInventFFData Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT UN.CODGRUPOPROD, ');
       Sql.Add('       UN.DESCGRUPOPROD, ');
       Sql.Add('       UN.STATUSGRUPO, ');
       Sql.Add('       UN.CODARTIGO, ');
       Sql.Add('       UN.DESCPROD, ');
       Sql.Add('       UN.CODMEDCUSTO, ');
       Sql.Add('       UN.QTDE, ');
       Sql.Add('       UN.VALORUN, ');
       Sql.Add('       UN.VALOR, ');
       Sql.Add('       UN.TOTAL ');
       Sql.Add('  FROM ( SELECT P.CODGRUPOPROD, ');
       Sql.Add('                G.DESCGRUPOPROD,');
       Sql.Add('                G.STATUSGRUPO,');
       Sql.Add('                MOV.CODARTIGO,');
       Sql.Add('                P.DESCPROD, ');
       Sql.Add('                P.CODMEDCUSTO,  ');
       Sql.Add('                MOV.SALDOQTDEMOV AS QTDE,');
       Sql.Add('                MOV.CUSTOMEDIOMOV AS VALORUN, ');
       Sql.Add('                ( MOV.SALDOQTDEMOV * MOV.CUSTOMEDIOMOV ) AS VALOR, ');
       Sql.Add('                ( 0 ) AS TOTAL ');
       Sql.Add('           FROM PRODUTO P, ');
       Sql.Add('                GRUPPROD G, ');
       Sql.Add('                ( SELECT M.IDMOV, ');
       Sql.Add('                         M.CODARTIGO, ');
       Sql.Add('                         M.SALDOQTDEMOV, ');
       Sql.Add('                         M.CUSTOMEDIOMOV, ');
       Sql.Add('                         M.CODALMOXARIFADO, ');
       Sql.Add('                         M.IDPESSOA ');
       Sql.Add('                    FROM MOVIMENT M, ');
       Sql.Add('                         ( SELECT M.CODARTIGO, ');
       Sql.Add('                                  MAX( M.IDMOV ) AS IDMOV ');
       Sql.Add('                             FROM MOVIMENT M, ');
       Sql.Add('                                  ( SELECT CODARTIGO, ');
       Sql.Add('                                           MAX( DATAMOV ) AS MAXDATAMOV ');
       Sql.Add('                                      FROM MOVIMENT ');
       Sql.Add('                                     WHERE ( DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 3 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       Sql.Add('                                       AND ( CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('                                     GROUP BY CODARTIGO ');
       Sql.Add('                                  ) SUB ');
       Sql.Add('                            Where ( M.CODARTIGO = SUB.CODARTIGO ) ');
       Sql.Add('                              AND ( M.DATAMOV = SUB.MAXDATAMOV ) ');
       Sql.Add('                              AND ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('                            GROUP BY M.CODARTIGO ');
       Sql.Add('                         ) AUX ');
       Sql.Add('                   WHERE ( M.CODARTIGO = AUX.CODARTIGO ) ');
       Sql.Add('                     AND ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('                     AND ( M.IDMOV = AUX.IDMOV ) ');
       Sql.Add('                ) MOV ');
       Sql.Add('          WHERE ( MOV.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('            AND ( MOV.IDPESSOA = '+ FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');

       If Not CmpRptCM.ParamValues[ 2 ].AsBoolean Then
          Sql.Add('            AND ( MOV.SALDOQTDEMOV <> 0 )');

       sql.Add('            AND ( SUBSTR( MOV.CODARTIGO, 1, 6 ) = P.CODPRODUTO ) ');
       Sql.Add('            AND ( G.CODGRUPOPROD = P.CODGRUPOPROD ) ');
       Sql.Add('          UNION ');
       Sql.Add('         SELECT G.CODGRUPOPROD, ');
       Sql.Add('                G.DESCGRUPOPROD, ');
       Sql.Add('                G.STATUSGRUPO, ');
       Sql.Add('                ( '''' ) AS CODARTIGO, ');
       Sql.Add('                ( '''' ) AS DESCPROD, ');
       Sql.Add('                ( '''' ) AS CODMEDCUSTO, ');
       Sql.Add('                ( 0 ) AS QTDE, ');
       Sql.Add('                ( 0 ) AS VALORUN, ');
       Sql.Add('                ( 0 ) AS VALOR, ');
       Sql.Add('                SUM( MOV.SALDOQTDEMOV * MOV.CUSTOMEDIOMOV ) AS TOTAL ');
       Sql.Add('           FROM PRODUTO P, ');
       Sql.Add('                GRUPPROD G, ');
       Sql.Add('                ( SELECT M.IDMOV, ');
       Sql.Add('                         M.CODARTIGO, ');
       Sql.Add('                         M.SALDOQTDEMOV, ');
       Sql.Add('                         M.CUSTOMEDIOMOV, ');
       Sql.Add('                         M.CODALMOXARIFADO, ');
       Sql.Add('                         M.IDPESSOA ');
       Sql.Add('                    FROM MOVIMENT M, ');
       Sql.Add('                         ( SELECT M.CODARTIGO, ');
       Sql.Add('                                  MAX( M.IDMOV ) AS IDMOV ');
       Sql.Add('                             FROM MOVIMENT M, ');
       Sql.Add('                                  ( SELECT CODARTIGO, ');
       Sql.Add('                                           MAX( DATAMOV ) AS MAXDATAMOV ');
       Sql.Add('                                      FROM MOVIMENT ');
       Sql.Add('                                     WHERE ( DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 3 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       Sql.Add('                                       AND ( CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('                                     GROUP BY CODARTIGO ');
       Sql.Add('                                  ) SUB ');
       Sql.Add('                            Where ( M.CODARTIGO = SUB.CODARTIGO ) ');
       Sql.Add('                              AND ( M.DATAMOV = SUB.MAXDATAMOV ) ');
       Sql.Add('                              AND ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('                            GROUP BY M.CODARTIGO ');
       Sql.Add('                         ) AUX ');
       Sql.Add('                   WHERE ( M.CODARTIGO = AUX.CODARTIGO ) ');
       Sql.Add('                     AND ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('                     AND ( M.IDMOV = AUX.IDMOV ) ');
       Sql.Add('                ) MOV ');
       Sql.Add('          WHERE ( MOV.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('            And ( MOV.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');

       If Not CmpRptCM.ParamValues[ 2 ].AsBoolean Then
          Sql.Add('            AND ( MOV.SALDOQTDEMOV <> 0 ) ');

       Sql.Add('            And ( SUBSTR( MOV.CODARTIGO, 1, 6 ) = P.CODPRODUTO ) ');
       Sql.Add('            AND ( G.CODGRUPOPROD LIKE SUBSTR( RTRIM( P.CODGRUPOPROD ), 1, ' + IntToStr( ipos ) + ') || ''%'' ) ');
       Sql.Add('            AND ( LENGTH( RTRIM( G.CODGRUPOPROD ) ) <= '+ IntToStr( ipos ) + ' ) ');
       Sql.Add('            And ( G.STATUSGRUPO = ''S'' ) ');
       Sql.Add('          GROUP BY G.CODGRUPOPROD, ');
       Sql.Add('                   G.DESCGRUPOPROD, ');
       Sql.Add('                   G.STATUSGRUPO ');
       Sql.Add('       ) UN ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then Begin
          Sql.Add(' WHERE ( RTRIM( UN.CODGRUPOPROD ) LIKE ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 1 ].AsString ) + '%' ) + ' ) ');
          lbFiltro.Caption := CmpRptCM.ParamValues[ 1 ].AsString + ' - ' + sNomeGrupo;
       End;

       Case CmpRptCM.ParamValues[ 4 ].AsInteger Of
            0: Sql.Add(' ORDER BY UN.CODGRUPOPROD, UN.DESCPROD');
            1: Sql.Add(' ORDER BY UN.CODGRUPOPROD, UN.CODARTIGO');
       End;

       CdsAux.Close;
       Open;
  End;

  lbAlmox4.Caption := sNomeAlmox;
  lbPer4.Caption   := 'em ' + CmpRptCM.ParamValues[ 3 ].AsString;
end;

procedure TRptInventFFData.CabecInventDtBeforePrint(Sender: TObject);
begin
  inherited;
  lblTotInventDt.Visible := ( CdsInventFFData.FieldByName( 'StatusGrupo' ).asString <> 'S' );
end;

procedure TRptInventFFData.DetInventDtBeforePrint(Sender: TObject);
begin
  inherited;
  If CdsInventFFData.FieldByName( 'StatusGrupo' ).asString = 'S' Then
     DetInventDt.Visible := Not CdsInventFFData.FieldByName('CodArtigo').isNull
  Else
     DetInventDt.Visible := True;
end;

procedure TRptInventFFData.RodapeInventDtBeforePrint(Sender: TObject);
begin
  inherited;
  If CdsInventFFData.FieldByName( 'StatusGrupo' ).asString = 'S' Then
     RodapeInventDt.Visible := Not CdsInventFFData.FieldByName('CodArtigo').isNull
  Else
     RodapeInventDt.Visible := True;
end;

end.
