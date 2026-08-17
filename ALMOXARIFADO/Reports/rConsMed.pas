unit rConsMed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptConsMed = class(TFrmCmReport)
    dsConsMed: TwwDataSource;
    bdeConsMed: TppBDEPipeline;
    RptConsMed: TppReport;
    ppHeaderBand21: TppHeaderBand;
    ppLabel111: TppLabel;
    LblEmpresa: TppLabel;
    ppLabel117: TppLabel;
    LbFiltro3: TppLabel;
    ppLine45: TppLine;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLine46: TppLine;
    ppLabel123: TppLabel;
    LbAlmox10: TppLabel;
    LbPer9: TppLabel;
    RptConsMedLabel6: TppLabel;
    RptConsMedLabel11: TppLabel;
    RptConsMedLabel7: TppLabel;
    RptConsMedLabel1: TppLabel;
    RptConsMedLabel2: TppLabel;
    RptConsMedLabel3: TppLabel;
    RptConsMedLabel4: TppLabel;
    ppDetailBand17: TppDetailBand;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    RptConsMedDBText1: TppDBText;
    RptConsMedDBText2: TppDBText;
    RptConsMedDBText3: TppDBText;
    RptConsMedDBText4: TppDBText;
    RptConsMedDBText5: TppDBText;
    RptConsMedDBText6: TppDBText;
    RptConsMedDBText7: TppDBText;
    ppFooterBand21: TppFooterBand;
    ppLine48: TppLine;
    LblSistema: TppLabel;
    ppCalc40: TppSystemVariable;
    ppCalc41: TppSystemVariable;
    ppGroup6: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppLine49: TppLine;
    ppGroupFooterBand4: TppGroupFooterBand;
    SqlConsMed: TCMSqlParams;
    CdsConsMed: TCMClientDataSet;
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
  RptConsMed: TRptConsMed;
  sNomeAlmox: String = '';
  sNomeGrupo: String = '';

implementation

{$R *.DFM}

procedure TRptConsMed.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

procedure TRptConsMed.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
       1: sNomeGrupo := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptConsMed.CrmRptCMBeforePrint(Sender: TObject);
Var
  sDias: String;
begin
  inherited;
  sDias := FloatToStr( ( CmpRptCM.ParamValues[ 3 ].AsDateTime - CmpRptCM.ParamValues[ 2 ].AsDateTime ) + 1 );

  With SqlConsMed Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT G.CODGRUPOPROD, ');
       Sql.Add('       G.DESCGRUPOPROD, ');
       Sql.Add('       A.CODARTIGO, ');
       Sql.Add('       P.CODMEDCUSTO, ');
       Sql.Add('       ( P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO ) AS DESCRICAO, ');
       Sql.Add('       CM.CONSMED, ');
       Sql.Add('       CM.CONSTOT, ');
       Sql.Add('       SAT.SALDOATU, ');
       Sql.Add('       SAN.SALDOANT, ');
       Sql.Add('       DECODE( CM.CONSMED, 0, 0, ( SAT.SALDOATU / CM.CONSMED ) ) AS COBERTURA, ');
       Sql.Add('       DECODE( CM.CONSTOT, 0, 0, ( ' + sDias + ' * ( ( ( SAT.SALDOATU + SAN.SALDOANT ) / 2 ) / CM.CONSTOT ) ) ) AS GIRO ');
       Sql.Add('  FROM ARTIGO A, ');
       Sql.Add('       PRODUTO P, ');
       Sql.Add('       GRUPPROD G, ');
       Sql.Add('       ( SELECT M.CODARTIGO, ');
       Sql.Add('                ( ( SUM( M.QTDEMOV ) * -1 ) / ' + sDias + ' ) AS CONSMED, ');
       Sql.Add('                ( SUM( QTDEMOV ) * -1 ) AS CONSTOT ');
       Sql.Add('           FROM MOVIMENT M ');
       Sql.Add('          WHERE ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''A'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''K'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''Z'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''B'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''S'' ) ');
       Sql.Add('            AND ( M.DATAMOV >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 2 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('            AND ( M.DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 3 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('          GROUP BY M.CODARTIGO ');
       Sql.Add('       ) CM, ');
       Sql.Add('       ( SELECT M.CODARTIGO, ');
       Sql.Add('                M.SALDOQTDEMOV AS SALDOATU ');
       Sql.Add('           FROM MOVIMENT M, ');
       Sql.Add('                ( SELECT M.CODARTIGO, ');
       Sql.Add('                         MAX( M.IDMOV ) AS IDMOV ');
       Sql.Add('                    FROM MOVIMENT M, ');
       Sql.Add('                         ( SELECT CODARTIGO, ');
       Sql.Add('                                  MAX( DATAMOV ) AS DATAMOV ');
       Sql.Add('                             FROM MOVIMENT ');
       Sql.Add('                            WHERE ( DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 3 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('                              AND ( CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('                            GROUP BY CODARTIGO ');
       Sql.Add('                         ) AUX');
       Sql.Add('                   WHERE ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('                     AND ( M.CODARTIGO = AUX.CODARTIGO ) ');
       Sql.Add('                     AND ( M.DATAMOV = AUX.DATAMOV ) ');
       Sql.Add('                   GROUP BY M.CODARTIGO ');
       Sql.Add('                ) AUX1 ');
       Sql.Add('          WHERE ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('            AND ( M.IDMOV = AUX1.IDMOV ) ');
       Sql.Add('            AND ( M.CODARTIGO = AUX1.CODARTIGO ) ');
       Sql.Add('       ) SAT, ');
       Sql.Add('       ( SELECT M.CODARTIGO, ');
       Sql.Add('                M.SALDOQTDEMOV AS SALDOANT ');
       Sql.Add('           FROM MOVIMENT M, ');
       Sql.Add('                ( SELECT M.CODARTIGO, ');
       Sql.Add('                         MAX( M.IDMOV ) AS IDMOV ');
       Sql.Add('                    FROM MOVIMENT M, ');
       Sql.Add('                         ( SELECT CODARTIGO, ');
       Sql.Add('                                  MAX( DATAMOV ) AS DATAMOV ');
       Sql.Add('                             FROM MOVIMENT ');
       Sql.Add('                            WHERE ( DATAMOV < TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 2 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('                              AND ( CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('                            GROUP BY CODARTIGO ');
       Sql.Add('                         ) AUX');
       Sql.Add('                   WHERE ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('                     AND ( M.CODARTIGO = AUX.CODARTIGO ) ');
       Sql.Add('                     AND ( M.DATAMOV = AUX.DATAMOV ) ');
       Sql.Add('                   GROUP BY M.CODARTIGO ');
       Sql.Add('                ) AUX1');
       Sql.Add('          WHERE ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('            AND ( M.IDMOV = AUX1.IDMOV ) ');
       Sql.Add('            AND ( M.CODARTIGO = AUX1.CODARTIGO ) ');
       Sql.Add('       ) SAN ');
       Sql.Add(' WHERE ( A.CODPRODUTO = P.CODPRODUTO ) ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then Begin
          Sql.Add('   AND ( RTRIM( G.CODGRUPOPROD ) LIKE ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 1 ].AsString ) + '%' ) + ' ) ');
          lbFiltro3.Caption := Trim( CmpRptCM.ParamValues[ 1 ].AsString ) + ' - ' + sNomeGrupo;
       End;

       If CmpRptCM.ParamValues[ 4 ].AsBoolean Then
          Sql.Add('   AND ( CM.CONSMED >= 0 ) ');

       Sql.Add('   AND ( P.CODGRUPOPROD = G.CODGRUPOPROD ) ');
       Sql.Add('   AND ( A.CODARTIGO = CM.CODARTIGO ) ');
       Sql.Add('   AND ( A.CODARTIGO = SAN.CODARTIGO(+) ) ');
       Sql.Add('   AND ( A.CODARTIGO = SAT.CODARTIGO(+) ) ');

       Case CmpRptCM.ParamValues[ 5 ].AsInteger Of
            0: Sql.Add('ORDER BY G.CODGRUPOPROD, DESCRICAO');
            1: Sql.Add('ORDER BY G.CODGRUPOPROD, A.CODARTIGO');
            2: Sql.Add('ORDER BY G.CODGRUPOPROD, CM.CONSMED');
       End;

       Open;
  End;

  lbAlmox10.Caption := sNomeAlmox;
  lbPer9.Caption := 'De ' + CmpRptCM.ParamValues[ 2 ].AsString + ' a ' + CmpRptCM.ParamValues[ 3 ].AsString;
end;

end.
