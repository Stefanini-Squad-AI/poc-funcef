unit FDmRelExtratoInvRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, QRExport;

type
  TDmRelExtratoInvRF = class(TdtmReports)
    rptHistInvRenFix: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    shpCabecalho: TppShape;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplMovimento: TppBDEPipeline;
    dsMovimento: TwwDataSource;
    qryMovimento: TwwQuery;
    QRTextFilter1: TQRTextFilter;
    ppGroup1: TppGroup;
    grpCabInvestimento: TppGroupHeaderBand;
    grpRodInvestimento: TppGroupFooterBand;
    ppGroup2: TppGroup;
    grpCabDataAplic: TppGroupHeaderBand;
    grpRodDataAplic: TppGroupFooterBand;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppShape1: TppShape;
    ppLabel12: TppLabel;
    ppDBText2: TppDBText;
    ppShape2: TppShape;
    qryMovimentoDESCINVESTIMENTO: TStringField;
    qryMovimentoHISTMOVRENFIX: TStringField;
    qryMovimentoDATAHISTORICO: TDateTimeField;
    qryMovimentoDATAPLICACAO: TDateTimeField;
    qryMovimentoQUANTIDADE: TStringField;
    qryMovimentoVALOR: TFloatField;
    qryMovimentoSALDOQTD: TStringField;
    qryMovimentoSALDOVALOR: TFloatField;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    shpDetalhe: TppShape;
    lblTotSaldoQtdInvest: TppLabel;
    lblTotSaldoVlrInvest: TppLabel;
    qryMovimentoNATURMOVHISTRENFI: TStringField;
    qryGrafico: TwwQuery;
    dsGrafico: TwwDataSource;
    qryMovimentoIDINVESTIMENTO: TFloatField;
    qryGraficoINVESTIMENTO: TStringField;
    qryGraficoDATAHISTRENFIX: TDateTimeField;
    qryGraficoSALDO: TFloatField;
    qryGraficoIDINVESTIMENTO: TFloatField;
    qryGraficoDATAOPERACAO: TStringField;
    dbiLogoEmpresa: TppDBImage;
    procedure rptHistInvRenFixStartPage(Sender: TObject);
    procedure shpCabInestimentoPrint(Sender: TObject);
    procedure grpCabInvestimentoBeforePrint(Sender: TObject);
    procedure grpRodInvestimentoBeforePrint(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
    procedure grpRodDataAplicAfterPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
    fTotQtd, fTotVal: Double;
  public
    { Public declarations }
  end;

var
  DmRelExtratoInvRF: TDmRelExtratoInvRF;

implementation

{$R *.DFM}

procedure TDmRelExtratoInvRF.rptHistInvRenFixStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TDmRelExtratoInvRF.shpCabInestimentoPrint(Sender: TObject);
begin
  inherited;
  cCorZebra := ClWhite;
end;

procedure TDmRelExtratoInvRF.grpCabInvestimentoBeforePrint(
  Sender: TObject);
begin
  inherited;
  fTotQtd := 0;
  fTotVal := 0;
end;

procedure TDmRelExtratoInvRF.grpRodInvestimentoBeforePrint(
  Sender: TObject);
begin
  if fTotQtd <> 0 then
     lblTotSaldoQtdInvest.Caption := FormatFloat('###,###,###,###,##0',fTotQtd)
  else
     lblTotSaldoQtdInvest.Caption := '';

  lblTotSaldoVlrInvest.Caption := FormatFloat('###,###,###,###,##0.00',fTotVal);
  inherited;
end;

procedure TDmRelExtratoInvRF.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra;
end;

procedure TDmRelExtratoInvRF.grpRodDataAplicAfterPrint(Sender: TObject);
begin
  inherited;
  if not qryMovimentoSALDOQTD.IsNull then
     fTotQtd := fTotQtd + qryMovimentoSALDOQTD.AsFloat;
  fTotVal := fTotVal + qryMovimentoSALDOVALOR.AsFloat;
end;

end.

