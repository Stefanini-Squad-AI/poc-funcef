unit rRecMercDesemb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppCtrls,
  ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Wwdatsrc,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptRecMercDesemb = class(TFrmCmReport)
    bdeRecMercDesemb: TppBDEPipeline;
    dsRecMercDesemb: TwwDataSource;
    RptRecMercDesemb: TppReport;
    ppHeaderBand34: TppHeaderBand;
    ppLabel209: TppLabel;
    ppLine88: TppLine;
    LblEmpresa: TppLabel;
    ppLabel212: TppLabel;
    ppLabel213: TppLabel;
    lbPer18: TppLabel;
    ppDetailBand29: TppDetailBand;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppFooterBand35: TppFooterBand;
    ppLine89: TppLine;
    LblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand5: TppSummaryBand;
    ppLine90: TppLine;
    ppLabel214: TppLabel;
    ppDBCalc2: TppDBCalc;
    SqlRecMercDesemb: TCMSqlParams;
    CdsRecMercDesemb: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptRecMercDesemb: TRptRecMercDesemb;

implementation

Uses uString;

{$R *.DFM}

procedure TRptRecMercDesemb.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Tipo' ).LookupSettings.SQL.Text := 'SELECT CODTIPRECDES, DESCRICAO ' +
                        'FROM TIPORECEBDESEMB WHERE ( IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ' +
                        'AND ( RECPAG = ''P'' ) AND ( ANASINT = ''A'' ) Order By DESCRICAO';
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

procedure TRptRecMercDesemb.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  lbPer18.Caption := 'De ' + CmpRptCM.ParamValues[ 0 ].AsString + ' a ' + CmpRptCM.ParamValues[ 1 ].AsString;

  With SqlRecMercDesemb Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT IT.CODTIPRECDES, ');
       Sql.Add('       TD.DESCRICAO, ');
       Sql.Add('       SUM( NF.VLRNOTAFISCAL ) ');
       Sql.Add('  FROM ITENSRECEBDEVOL IT, ');
       Sql.Add('       NFRECEBDEVOL NF, ');
       Sql.Add('       TIPORECEBDESEMB TD ');
       Sql.Add(' WHERE ( NF.DATAENTDEVOL >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       sql.Add('   AND ( NF.DATAENTDEVOL <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');

       If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
         Sql.Add('   AND ( IT.CODTIPRECDES = ' + QuotedStr( Espaco( CmpRptCM.ParamValues[ 2 ].AsString, 15 ) ) + ' ) ');

       Sql.Add('   AND ( IT.RECPAG = ''P'' ) ');
       Sql.Add('   AND ( IT.IDPESSOA = '+ FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('   AND ( IT.CODTIPRECDES = TD.CODTIPRECDES ) ');
       Sql.Add('   AND ( IT.RECPAG = TD.RECPAG ) ');
       Sql.Add('   AND ( IT.IDPESSOA = TD.IDPESSOA ) ');
       Sql.Add('   AND ( IT.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL ) ');
       Sql.Add(' GROUP BY IT.CODTIPRECDES, ');
       Sql.Add('          TD.DESCRICAO ');
       Sql.Add(' ORDER BY TD.DESCRICAO');
       Open;
  End;
end;

end.
