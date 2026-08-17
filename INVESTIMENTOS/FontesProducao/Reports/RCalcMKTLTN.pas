unit RCalcMKTLTN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, uCmSqlParams,
  DBClient, uCMClientDataSet, uCmRptManager, TXComp, TXRB, CmParamReport,
  uCtrlCalculoMKT, uCtrlPadroes;

type
  TRelCalcMKTLTN = class(TFrmCmReport)
    cdsCalcMKTLTN: TCMClientDataSet;
    sprCalcMKTLTN: TCMSqlParams;
    dsCalcMKTLTN: TDataSource;
    pplCalcMKTLTN: TppBDEPipeline;
    rptCalcMKTLTN: TppReport;
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
    ppSystemVariable2: TppSystemVariable;
    shpCustodiante: TppShape;
    lblCapInvestimento: TppLabel;
    lblTipoCalculo: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    lblCapMoedaInd: TppLabel;
    lblInvestimento: TppLabel;
    lblDtAplicacao: TppLabel;
    lblDtVencimento: TppLabel;
    lblTxEmissao: TppLabel;
    lblTXIndicativa: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    lblPUMercado: TppLabel;
    ppLabel23: TppLabel;
    ppShape2: TppShape;
    ppLine2: TppLine;
    lblCabMoedaInf: TppLabel;
    lblDU: TppLabel;
    procedure rptCalcMKTLTNStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  RelCalcMKTLTN: TRelCalcMKTLTN;

implementation

{$R *.DFM}

procedure TRelCalcMKTLTN.rptCalcMKTLTNStartPage(Sender: TObject);
begin
   lblTituloRelatorio.Caption := rptCalcMKTLTN.PrinterSetup.DocumentName;

   inherited;
   cCorZebra := $00E3E3E3
end;

procedure TRelCalcMKTLTN.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

end.
