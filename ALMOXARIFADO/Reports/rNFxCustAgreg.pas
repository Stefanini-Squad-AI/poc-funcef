unit rNFxCustAgreg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppBands,
  ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptNFxCustAgreg = class(TFrmCmReport)
    dsNFxCustAgreg: TwwDataSource;
    bdeNFxCustAgreg: TppBDEPipeline;
    bdeNFxCustAgregppField1: TppField;
    bdeNFxCustAgregppField2: TppField;
    bdeNFxCustAgregppField3: TppField;
    bdeNFxCustAgregppField4: TppField;
    bdeNFxCustAgregppField5: TppField;
    bdeNFxCustAgregppField6: TppField;
    bdeNFxCustAgregppField7: TppField;
    bdeNFxCustAgregppField8: TppField;
    bdeNFxCustAgregppField9: TppField;
    bdeNFxCustAgregppField10: TppField;
    bdeNFxCustAgregppField11: TppField;
    bdeNFxCustAgregppField12: TppField;
    RptNFxCustAgreg: TppReport;
    ppHeaderBand24: TppHeaderBand;
    ppLabel129: TppLabel;
    ppLine60: TppLine;
    LblEmpresa: TppLabel;
    LbPer11: TppLabel;
    RptNFxCustAgregLabel1: TppLabel;
    RptNFxCustAgregLabel2: TppLabel;
    RptNFxCustAgregLabel3: TppLabel;
    RptNFxCustAgregLabel4: TppLabel;
    RptNFxCustAgregLabel5: TppLabel;
    RptNFxCustAgregLabel6: TppLabel;
    RptNFxCustAgregLine1: TppLine;
    DetNFxCustAgreg: TppDetailBand;
    RptNFxCustAgregDBText1: TppDBText;
    RptNFxCustAgregDBText3: TppDBText;
    RptNFxCustAgregDBText4: TppDBText;
    RptNFxCustAgregDBText2: TppDBText;
    RptNFxCustAgregDBText5: TppDBText;
    RptNFxCustAgregDBText6: TppDBText;
    ppFooterBand24: TppFooterBand;
    LblSistema: TppLabel;
    ppLine62: TppLine;
    ppCalc46: TppSystemVariable;
    ppCalc47: TppSystemVariable;
    ppSummaryBand7: TppSummaryBand;
    ppLabel223: TppLabel;
    ppLine98: TppLine;
    ppDBCalc21: TppDBCalc;
    ppGroup10: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppDBText60: TppDBText;
    ppLabel154: TppLabel;
    ppLine61: TppLine;
    ppGroupFooterBand8: TppGroupFooterBand;
    RptNFxCustAgregGroup1: TppGroup;
    RptNFxCustAgregGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText48: TppDBText;
    ppDBText50: TppDBText;
    ppDBText57: TppDBText;
    ppDBText59: TppDBText;
    ppLabel145: TppLabel;
    ppLabel147: TppLabel;
    ppLabel149: TppLabel;
    ppLabel151: TppLabel;
    RptNFxCustAgregGroupFooterBand1: TppGroupFooterBand;
    SqlNFxCustAgreg: TCMSqlParams;
    CdsNFxCustAgreg: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure DetNFxCustAgregBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptNFxCustAgreg: TRptNFxCustAgreg;

implementation

{$R *.DFM}

procedure TRptNFxCustAgreg.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlNFxCustAgreg Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT NF.DATAENTDEVOL, ');
       Sql.Add('       NF.DATAEMISNF, ');
       Sql.Add('       P.RAZAOSOCIAL, ');
       Sql.Add('       ( TO_CHAR( NF.NUMNF ) || ''/'' || NF.COMPLNF ) AS NOTANUM, ');
       Sql.Add('       NF.VLRNOTAFISCAL, ');
       Sql.Add('       NF.FLGTIPONOTA, ');
       Sql.Add('       SUB.ALIQUOTA AS ALIQUOTA, ');
       Sql.Add('       SUB.BASE  AS BASE, ');
       Sql.Add('       SUB.VALOR AS VALOR, ');
       Sql.Add('       SUB.RECUP AS RECUP, ');
       Sql.Add('       SUB.DESCCUSTAGREG AS DESCRICAO, ');
       Sql.Add('       DECODE( SUB.TIPO, ''T'', ''NOTA'', DECODE( SUB.TIPO, ''I'', ''ITEM'', '''' ) ) AS TIPO ');
       Sql.Add('  FROM NFRECEBDEVOL NF, ');
       Sql.Add('       ( SELECT NF.IDNFRECEBDEVOL, ');
       Sql.Add('                AIT.CODTIPOCUSTAGREG, ');
       Sql.Add('                AIT.ALIQUOTA, ');
       Sql.Add('                TA.DESCCUSTAGREG, ');
       Sql.Add('                ( ''I'' ) AS TIPO, ');
       Sql.Add('                SUM( AIT.BASECALCULO ) AS BASE, ');
       Sql.Add('                SUM( AIT.VLRAGREGADO ) AS VALOR, ');
       Sql.Add('                SUM( AIT.VLRRECUPERADO )AS RECUP ');
       Sql.Add('           FROM NFRECEBDEVOL NF, ');
       Sql.Add('                ITENSRECEBDEVOL IT, ');
       Sql.Add('                AGRITENSRECDEV AIT, ');
       Sql.Add('                TIPOAGRE TA ');
       Sql.Add('          WHERE ');

       Case CmpRptCM.ParamValues[ 3 ].AsInteger Of
            0: Sql.Add('                ( NF.FLGTIPONOTA <> ''D'' ) ');
            1: Sql.Add('                ( NF.FLGTIPONOTA = ''D'' ) ');
       End;

       Sql.Add('            AND ( TA.TOTALITEM = ''I'' ) ');
       Sql.Add('            AND ( NF.DATAENTDEVOL >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('            AND ( NF.DATAENTDEVOL <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('            AND ( NF.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');

       If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
          Sql.Add('            AND ( AIT.CODTIPOCUSTAGREG = ' + CmpRptCM.ParamValues[ 2 ].AsString + ' ) ');

       Sql.Add('            AND ( NF.IDNFRECEBDEVOL    = IT.IDNFRECEBDEVOL ) ');
       Sql.Add('            AND ( AIT.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG ) ');
       sql.Add('            AND ( AIT.IDITENSRECDEV    = IT.IDITENSRECDEV ) ');
       Sql.Add('          GROUP BY NF.IDNFRECEBDEVOL, ');
       Sql.Add('                   AIT.CODTIPOCUSTAGREG, ');
       Sql.Add('                   AIT.ALIQUOTA, ');
       Sql.Add('                   TA.DESCCUSTAGREG ');
       Sql.Add('         UNION ');
       Sql.Add('         SELECT NF.IDNFRECEBDEVOL, ');
       Sql.Add('                ANF.CODTIPOCUSTAGREG, ');
       Sql.Add('                ANF.ALIQUOTA, ');
       Sql.Add('                TA.DESCCUSTAGREG, ');
       Sql.Add('                ( ''T'' ) AS TIPO, ');
       Sql.Add('                SUM( ANF.BASECALCULO ) AS BASE, ');
       Sql.Add('                SUM( ANF.VLRAGREGADO ) AS VALOR, ');
       Sql.Add('                SUM( ANF.VLRRECUPERADO ) AS RECUP ');
       Sql.Add('           FROM NFRECEBDEVOL NF, ');
       Sql.Add('                AGRNFRECDEV ANF, ');
       Sql.Add('                TIPOAGRE TA ');
       Sql.Add('          WHERE ');

       Case CmpRptCM.ParamValues[ 3 ].AsInteger Of
            0: Sql.Add('                ( NF.FLGTIPONOTA <> ''D'' ) ');
            1: Sql.Add('                ( NF.FLGTIPONOTA = ''D'' ) ');
       End;

       Sql.Add('            AND ( TA.TOTALITEM = ''T'' ) ');
       Sql.Add('            AND ( ANF.IDNFCOMPLEMENTAR IS NULL ) ');
       Sql.Add('            AND ( NF.DATAENTDEVOL >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('            AND ( NF.DATAENTDEVOL <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('            AND ( NF.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');

       If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
          Sql.Add('            AND ( ANF.CODTIPOCUSTAGREG = ' + CmpRptCM.ParamValues[ 2 ].AsString + ' ) ');

       Sql.Add('            AND ( ANF.IDNFRECEBDEVOL   = NF.IDNFRECEBDEVOL ) ');
       Sql.Add('            AND ( ANF.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG ) ');
       Sql.Add('          GROUP BY NF.IDNFRECEBDEVOL, ');
       Sql.Add('                   ANF.CODTIPOCUSTAGREG, ');
       Sql.Add('                   ANF.ALIQUOTA, ');
       Sql.Add('                   TA.DESCCUSTAGREG ');
       Sql.Add('       ) SUB, ');
       Sql.Add('       PESSOA P ');
       Sql.Add(' WHERE ');

       Case CmpRptCM.ParamValues[ 3 ].AsInteger Of
            0: Sql.Add('       ( NF.FLGTIPONOTA <> ''D'' ) ');
            1: Sql.Add('       ( NF.FLGTIPONOTA = ''D'' ) ');
       End;

       Sql.Add('   AND ( NF.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('   AND ( NF.DATAENTDEVOL >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('   AND ( NF.DATAENTDEVOL <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('   AND ( NF.IDFORCLI = P.IDPESSOA ) ');

       If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
          Sql.Add('   AND ( NF.IDNFRECEBDEVOL = SUB.IDNFRECEBDEVOL ) ')
       Else
          Sql.Add('   AND ( NF.IDNFRECEBDEVOL = SUB.IDNFRECEBDEVOL ) ');

       Sql.Add(' ORDER BY NF.DATAENTDEVOL, P.RAZAOSOCIAL,NOTANUM ');

       Open;
  End;

  lbPer11.Caption := 'De ' + CmpRptCM.ParamValues[ 0 ].AsString + ' a ' + CmpRptCM.ParamValues[ 1 ].AsString;
end;

procedure TRptNFxCustAgreg.DetNFxCustAgregBeforePrint(Sender: TObject);
begin
  inherited;
  DetNFxCustAgreg.Visible := ( Not CdsNFxCustAgreg.FieldByName('TIPO').IsNull );
end;

procedure TRptNFxCustAgreg.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

end.
