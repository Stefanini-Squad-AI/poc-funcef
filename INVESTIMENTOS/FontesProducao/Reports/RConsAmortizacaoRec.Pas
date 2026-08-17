//******************************************************************************
// Data      : 17/01/2007
// Pendencia : 22229
// Motivo    : Implementação
//******************************************************************************

unit RConsAmortizacaoRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppVar, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, uCmSqlParams, Db, DBClient, uCMClientDataSet;

type
  TRelConsAmortizacaoRec = class(TFrmCmReport)
    pplAmortizacaoRec: TppBDEPipeline;
    rptAmortizacaoRec: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblTituloRelatorio: TppLabel;
    lblEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    lblSistema: TppLabel;
    ppLine2: TppLine;
    ppShape1: TppShape;
    shpCustodiante: TppShape;
    ppLabel2: TppLabel;
    shpDetalhe: TppShape;
    dsAmortizacaoRec: TDataSource;
    cdsAmortizacaoRec: TCMClientDataSet;
    sprAmortizacaoRec: TCMSqlParams;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText29: TppDBText;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine1: TppLine;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLine3: TppLine;
    ppDBCalc1: TppDBCalc;
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptAmortizacaoRecBeforePrint(Sender: TObject);
    procedure rptAmortizacaoRecStartPage(Sender: TObject);
    procedure ppGroupFooterBand3AfterGenerate(Sender: TObject);
    procedure ppGroupFooterBand3BeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }

    cCorZebra : TColor;
    wCount    : Integer;
  public
    { Public declarations }
  end;

var
  RelConsAmortizacaoRec: TRelConsAmortizacaoRec;

implementation

{$R *.DFM}

procedure TRelConsAmortizacaoRec.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra

end;

procedure TRelConsAmortizacaoRec.rptAmortizacaoRecBeforePrint(
  Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TRelConsAmortizacaoRec.rptAmortizacaoRecStartPage(
  Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TRelConsAmortizacaoRec.ppGroupFooterBand3AfterGenerate(
  Sender: TObject);
begin
  inherited;
   wCount    := 0;
end;

procedure TRelConsAmortizacaoRec.ppGroupFooterBand3BeforePrint(
  Sender: TObject);
begin
  inherited;
   ppGroupFooterBand3.Visible := (wCount > 1);
   wCount   := 0;
end;

procedure TRelConsAmortizacaoRec.ppDetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
   wCount   := wCount + 1;
end;

end.
