unit rRecMercSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppBands, ppClass, ppCtrls,
  ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TRptRecMercSint = class(TFrmCmReport)
    bdeRecMercSint: TppBDEPipeline;
    RptRecMercSint: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppLabel107: TppLabel;
    ppLine40: TppLine;
    LblEmpresa: TppLabel;
    RptRecMercSintLine1: TppLine;
    lbPer8: TppLabel;
    RptRecMercSintLabel2: TppLabel;
    RptRecMercSintLabel3: TppLabel;
    RptRecMercSintLabel4: TppLabel;
    RptRecMercSintLabel6: TppLabel;
    RptRecMercSintLabel8: TppLabel;
    RptRecMercSintLabel9: TppLabel;
    ppDetailBand16: TppDetailBand;
    RptRecMercSintDBText1: TppDBText;
    RptRecMercSintDBText2: TppDBText;
    RptRecMercSintDBText3: TppDBText;
    RptRecMercSintDBText5: TppDBText;
    RptRecMercSintDBText7: TppDBText;
    RptRecMercSintDBText8: TppDBText;
    ppFooterBand20: TppFooterBand;
    LblSistema: TppLabel;
    RptRecMercSintLine3: TppLine;
    ppCalc38: TppSystemVariable;
    ppCalc39: TppSystemVariable;
    RptRecMercSintSummaryBand1: TppSummaryBand;
    RptRecMercSintLabel1: TppLabel;
    RptRecMercSintDBCalc2: TppDBCalc;
    RptRecMercSintLine4: TppLine;
    RptRecMercSintGroup1: TppGroup;
    RptRecMercSintGroupHeaderBand1: TppGroupHeaderBand;
    RptRecMercSintLine2: TppLine;
    RptRecMercSintDBText4: TppDBText;
    RptRecMercSintLabel5: TppLabel;
    RptRecMercSintGroupFooterBand1: TppGroupFooterBand;
    RptRecMercSintLabel7: TppLabel;
    RptRecMercSintDBText6: TppDBText;
    RptRecMercSintDBCalc1: TppDBCalc;
    dsRecMercSint: TwwDataSource;
    SqlRecMercSint: TCMSqlParams;
    CdsRecMercSint: TCMClientDataSet;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
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
  RptRecMercSint: TRptRecMercSint;
  sNomeAlmox: String = '';

implementation

{$R *.DFM}

procedure TRptRecMercSint.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

procedure TRptRecMercSint.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  Case Index of
       2: sNomeAlmox := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptRecMercSint.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlRecMercSint Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT NF.DATAENTDEVOL, ');
       Sql.Add('       NF.DATAEMISNF, ');
       Sql.Add('       P.RAZAOSOCIAL, ');
       Sql.Add('       ( TO_CHAR( NF.NUMNF ) || ''/'' || NF.COMPLNF ) AS NOTANUM, ');
       Sql.Add('       NF.VLRNOTAFISCAL, ');
       Sql.Add('       NF.FLGTIPONOTA, ');
       Sql.Add('       D.DATAPROGRAMADA, ');
       Sql.Add('       TD.DESCRICAO AS TIPODOC ');
       Sql.Add('  FROM PESSOA P, ');
       Sql.Add('       NFRECEBDEVOL NF, ');
       Sql.Add('       DOCUMENTO D, ');
       Sql.Add('       TIPODOCRECPAG TD ');
       Sql.Add(' WHERE ( NF.FLGTIPONOTA <> ''D'' ) ');

       If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
          Sql.add('   AND EXISTS ( SELECT I.IDNFRECEBDEVOL FROM ITENSRECEBDEVOL I WHERE ( I.CODALMOXARIFADO = ' +
                  CmpRptCM.ParamValues[ 2 ].AsString + ' ) AND ( I.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL ) ) ');

       Sql.Add('   AND ( NF.DATAENTDEVOL >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('   AND ( NF.DATAENTDEVOL <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('   AND ( NF.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('   AND ( NF.IDFORCLI = P.IDPESSOA ) ');
       Sql.Add('   AND ( NF.CODDOCUMENTO = D.CODDOCUMENTO(+) ) ');
       Sql.Add('   AND ( D.CODTIPDOC     = TD.CODTIPDOC(+) ) ');

       Case CmpRptCM.ParamValues[ 3 ].AsInteger Of
            0: Sql.Add(' ORDER BY NF.DATAENTDEVOL, P.RAZAOSOCIAL, NF.NUMNF');
            1: Sql.Add(' ORDER BY NF.DATAENTDEVOL, NF.NUMNF, P.RAZAOSOCIAL');
            2: Sql.Add(' ORDER BY NF.DATAENTDEVOL, DATAPROGRAMADA, P.RAZAOSOCIAL, NF.NUMNF');
       End;

       Open;
  End;

  lbPer8.Caption := 'De ' + CmpRptCM.ParamValues[ 0 ].AsString + ' a ' + CmpRptCM.ParamValues[ 1 ].AsString;
end;

end.
