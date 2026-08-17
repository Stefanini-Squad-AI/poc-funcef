unit RSaldoNegativoAnual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, Provider,
  DBTables, Wwquery, Db, DBClient, ppDB, ppDBPipe, ppDBBDE, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppBands, ppCache, ppCtrls, ppPrnabl,
  JclStrings,
  Grids, DBGrids, ppVar;

type
  TRptSaldoNegativoAnual = class(TFrmCmReport)
    Report: TppReport;
    DataSource: TDataSource;
    ClientDataSet: TClientDataSet;
    Query: TwwQuery;
    Provider: TDataSetProvider;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine34: TppLine;
    ppDBText1: TppDBText;
    Pipeline: TppBDEPipeline;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine1: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLabelSistema: TppLabel;
    ppCalc39: TppSystemVariable;
    ppCalc40: TppSystemVariable;
    ppLabel7: TppLabel;
    ClientDataSetNOME: TStringField;
    ClientDataSetIDPESSOA: TFloatField;
    ClientDataSetNUMDOCUMENTO: TStringField;
    ClientDataSetVALOR: TFloatField;
    PipelineppField1: TppField;
    PipelineppField2: TppField;
    PipelineppField3: TppField;
    PipelineppField4: TppField;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  RptSaldoNegativoAnual: TRptSaldoNegativoAnual;

implementation

{$R *.DFM}

procedure TRptSaldoNegativoAnual.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSQL, sSQLFiltro  : String;
begin
  inherited;

  sSQL := 'SELECT '+
          '  P.NOME, '+
          '  P.IDPESSOA, '+
          '  P.NUMDOCUMENTO, '+
          '  G.VALOR '+

          'FROM '+
          '  (  '+
                'SELECT '+
                   ' L1.IDBENEFIRRF, '+
                   ' SUM(VLRLANC)*1 AS VALOR '+
                ' FROM '+
                   ' LANCIRRF L1, '+
                   ' LANCXINFORME LX1 '+
                ' WHERE '+
                   ' L1.IDLANCIRRF = LX1.IDLANCIRRF ';



  sSQLFiltro := '';

  If ( Trim( CmpRptCM.ParamValues[0].AsString ) <> '-1' )
  Then sSQLFiltro := sSQLFiltro + ' AND TO_CHAR( L1.DATAPAGAMENTO, ''YYYY'' ) =  ' + QuotedStr( Trim( CmpRptCM.ParamValues[0].AsString ))  +
                ' GROUP BY L1.IDBENEFIRRF '+
                  ' HAVING SUM(VLRLANC) < 0) G, PESSOA P '+
          'WHERE P.IDPESSOA = G.IDBENEFIRRF '+
            ' ORDER BY G.VALOR DESC ';


  sSQL := sSQL + sSQLFiltro;

  ClientDataSet.Close;

  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add( sSQL );

  ClientDataSet.Open;


end;

end.
