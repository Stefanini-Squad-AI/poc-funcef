//******************************************************************************
// Autor     : Marco Turon
// Data      : 07/12/2007
// Código    : AL_1
// Pendencia : 27000
// SOL       :
// Desc      : Ajuste na forma de cálculo de NTN solicitada pelo cliente
//******************************************************************************
unit RCalcMKTNTN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, uCmSqlParams,
  DBClient, uCMClientDataSet, uCmRptManager, TXComp, TXRB, CmParamReport,
  uCtrlCalculoMKT, uCtrlPadroes;

type
  TRelCalcMKTNTN = class(TFrmCmReport)
    cdsCalcMKTNTN: TCMClientDataSet;
    sprCalcMKTNTN: TCMSqlParams;
    dsCalcMKTNTN: TDataSource;
    pplCalcMKTNTN: TppBDEPipeline;
    rptCalcMKTNTN: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblTituloRelatorio: TppLabel;
    lblEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    linCabecalho: TppLine;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
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
    ppLabel6: TppLabel;
    lblCabMoedaInf: TppLabel;
    lblInvestimento: TppLabel;
    lblDtAplicacao: TppLabel;
    lblDtVencimento: TppLabel;
    lblTxEmissao: TppLabel;
    lblDatPUPar: TppLabel;
    lblPUPar: TppLabel;
    lblTXJuros: TppLabel;
    lblMoedaInf: TppLabel;
    ppShape1: TppShape;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    sumCupomCompra: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    lblPUMercado: TppLabel;
    ppLabel23: TppLabel;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    lblPUParFinal: TppLabel;
    ppLabel9: TppLabel;
    ppShape4: TppShape;
    ppLabel10: TppLabel;
    lblCuponCompra: TppLabel;
    procedure rptCalcMKTNTNStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
    procedure lblPUParFinalGetText(Sender: TObject; var Text: String);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  RelCalcMKTNTN: TRelCalcMKTNTN;

implementation

{$R *.DFM}

procedure TRelCalcMKTNTN.rptCalcMKTNTNStartPage(Sender: TObject);
begin
   lblTituloRelatorio.Caption := rptCalcMKTNTN.PrinterSetup.DocumentName;

   inherited;
   cCorZebra := $00E3E3E3
end;

procedure TRelCalcMKTNTN.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TRelCalcMKTNTN.lblPUParFinalGetText(Sender: TObject; var Text: String);
begin
  inherited;
  Text := lblPUPar.Caption;

end;

end.
