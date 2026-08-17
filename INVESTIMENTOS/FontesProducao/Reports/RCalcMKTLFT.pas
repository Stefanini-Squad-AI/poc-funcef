unit RCalcMKTLFT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, uCmSqlParams,
  DBClient, uCMClientDataSet, uCmRptManager, TXComp, TXRB, CmParamReport,
  uCtrlCalculoMKT, uCtrlPadroes;

type
  TRelCalcMKTLFT = class(TFrmCmReport)
    cdsCalcMKTLFT: TCMClientDataSet;
    sprCalcMKTLFT: TCMSqlParams;
    dsCalcMKTLFT: TDataSource;
    pplCalcMKTLFT: TppBDEPipeline;
    rptCalcMKTLFT: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblTituloRelatorio: TppLabel;
    lblEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    linCabecalho: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    shpCustodiante: TppShape;
    lblCapInvestimento: TppLabel;
    lblTipoCalculo: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    lblCapMoedaInd: TppLabel;
    lblCabMoedaInf: TppLabel;
    lblInvestimento: TppLabel;
    lblDtAplicacao: TppLabel;
    lblDtVencimento: TppLabel;
    lblTxEmissao: TppLabel;
    lblDatPUPar: TppLabel;
    lblPUPar: TppLabel;
    lblTXIndicativa: TppLabel;
    lblDU: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    lblPUMercado: TppLabel;
    ppLabel23: TppLabel;
    ppShape2: TppShape;
    procedure rptCalcMKTLFTStartPage(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelCalcMKTLFT: TRelCalcMKTLFT;

implementation

{$R *.DFM}

procedure TRelCalcMKTLFT.rptCalcMKTLFTStartPage(Sender: TObject);
begin
   lblTituloRelatorio.Caption := rptCalcMKTLFT.PrinterSetup.DocumentName;
   inherited;
end;

end.
