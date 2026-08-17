//******************************************************************************
// Data     : 10/05/2005
// Motivo   : Implementação do campo FLGOPDIREITO para identificar oper. de direitos
//            na query qryDemoOpCustoRet
//******************************************************************************

unit FDmRelDemOpCustoRet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelDemOpCustoRet = class(TDmRelatoriosInv)
    pplDemoOpCustoRet: TppBDEPipeline;
    dsDemoOpCustoRet: TwwDataSource;
    qryDemoOpCustoRet: TwwQuery;
    qryDemoOpCustoRetDESCINVESTIMENTO: TStringField;
    qryDemoOpCustoRetDATAMOVCARTINV: TDateTimeField;
    qryDemoOpCustoRetQTDEMOVINVCART: TFloatField;
    qryDemoOpCustoRetVLRMOVCARTINV: TFloatField;
    qryDemoOpCustoRetVALCUSTO: TFloatField;
    qryDemoOpCustoRetTOTALDESPESAS: TFloatField;
    qryDemoOpCustoRetRESULTADO: TFloatField;
    qryDemoOpCustoRetVLRIR: TFloatField;
    qryDemoOpCustoRetCONTADOR: TFloatField;
    qryDemoOpCustoRetIDINVESTIMENTO: TFloatField;
    qryDemoOpCustoRetIDTIPOOPERACAO: TFloatField;
    qryDemoOpCustoRetIDMERCADO: TFloatField;
    qryDemoOpCustoRetFLGTRATAIR: TStringField;
    qryDemoOpCustoRetIDCARTEIRAINVEST: TFloatField;
    qryDemoOpCustoRetDATAVENCOPER: TDateTimeField;
    rptDemoOpCustoRet: TppReport;
    ppHeaderBand28: TppHeaderBand;
    ppLabel280: TppLabel;
    ppLabel281: TppLabel;
    ppLabel286: TppLabel;
    ppShape38: TppShape;
    ppLabel287: TppLabel;
    ppLabel289: TppLabel;
    ppLabel290: TppLabel;
    ppLabel291: TppLabel;
    ppLabel292: TppLabel;
    ppLabel293: TppLabel;
    ppLabel302: TppLabel;
    ppDataIni: TppLabel;
    ppDataFim: TppLabel;
    ppCarteira: TppLabel;
    ppDetailBand30: TppDetailBand;
    shpDet: TppShape;
    ppDBText138: TppDBText;
    ppDBText139: TppDBText;
    ppDBText142: TppDBText;
    ppDBText144: TppDBText;
    ppDBText140: TppDBText;
    ppDBText141: TppDBText;
    ppDBText137: TppDBText;
    ppFooterBand27: TppFooterBand;
    ppSystemVariable22: TppSystemVariable;
    ppLine147: TppLine;
    ppLabel297: TppLabel;
    ppSystemVariable23: TppSystemVariable;
    ppSummaryBand7: TppSummaryBand;
    ppLabel298: TppLabel;
    ppDBCalc41: TppDBCalc;
    ppGroup13: TppGroup;
    grpcInvestimento: TppGroupHeaderBand;
    ppdbDemVdDescInvestimento: TppDBText;
    ppLabel288: TppLabel;
    grpfInvestimento: TppGroupFooterBand;
    shpTotAcao: TppShape;
    ppDBCalc40: TppDBCalc;
    ppLabel294: TppLabel;
    ppDBCalc32: TppDBCalc;
    ppDBCalc33: TppDBCalc;
    ppDBCalc34: TppDBCalc;
    ppLabel296: TppLabel;
    linTotData: TppLine;
    updDemoOpCustoRet: TUpdateSQL;
    qryDemoOpCustoRetDESCTIPOOPERACAO: TStringField;
    qryDemoOpCustoRetNATUREZAOPERACAO: TStringField;
    qryDemoOpCustoRetCUSTO_RET: TFloatField;
    qryDemoOpCustoRetSALDOQTDEINVCART: TFloatField;
    qryDemoOpCustoRetIDLOTE: TStringField;
    qryDemoOpCustoRetIDHISTCARTINV: TFloatField;
    qryDemoOpCustoRetSLDCUSTO: TFloatField;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    shpResumo: TppShape;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    qryDemoOpCustoRetALIQUOTA: TFloatField;
    ppDBText4: TppDBText;
    ppDBCalc39: TppDBCalc;
    qryDemoOpCustoRetMES: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    qryDemoOpCustoRetCODMES: TStringField;
    ppShape1: TppShape;
    ppDBText5: TppDBText;
    lblTotValOper: TppLabel;
    lblTotQtdOper: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppShape2: TppShape;
    ppDBImage2: TppDBImage;
    procedure rptDemoOpCustoRetBeforePrint(Sender: TObject);
    procedure ppdbDemVdDescInvestimentoPrint(Sender: TObject);
    procedure shpDetPrint(Sender: TObject);
    procedure lblTotValOperPrint(Sender: TObject);
    procedure lblTotQtdOperPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
    OperRendaVarQtdDatas : Integer; { Operação Renda Variável }
    fTotValorOper, fTotQtdOper, fTotGerQtdOper, fTotGerValOper: Double;
  public
    { Public declarations }
  end;

var
  DmRelDemOpCustoRet: TDmRelDemOpCustoRet;

implementation

{$R *.DFM}

procedure TDmRelDemOpCustoRet.rptDemoOpCustoRetBeforePrint(Sender: TObject);
begin
   inherited;
   OperRendaVarQtdDatas := 0;
end;

procedure TDmRelDemOpCustoRet.ppdbDemVdDescInvestimentoPrint(
  Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3;
end;

procedure TDmRelDemOpCustoRet.shpDetPrint(Sender: TObject);
begin
   inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;

   if qryDemoOpCustoRetNATUREZAOPERACAO.AsString = 'A' then
   begin
      // Compra
      fTotValorOper := fTotValorOper + qryDemoOpCustoRetVLRMOVCARTINV.AsFloat;
      fTotQtdOper := fTotQtdOper + qryDemoOpCustoRetQTDEMOVINVCART.AsFloat;
   end
   else if qryDemoOpCustoRetNATUREZAOPERACAO.AsString = 'D' then
   begin
      // Venda
      fTotValorOper := fTotValorOper - qryDemoOpCustoRetVLRMOVCARTINV.AsFloat;
      fTotQtdOper := fTotQtdOper - qryDemoOpCustoRetQTDEMOVINVCART.AsFloat;
   end
   else
   begin
      // Outras
      fTotValorOper := fTotValorOper;
      fTotQtdOper := fTotQtdOper;
   end;
end;

procedure TDmRelDemOpCustoRet.lblTotValOperPrint(Sender: TObject);
begin
  inherited;
  lblTotValOper.Caption := FormatFloat('###,###,###,##0.00', fTotValorOper);
  fTotValorOper := 0
end;

procedure TDmRelDemOpCustoRet.lblTotQtdOperPrint(Sender: TObject);
begin
  inherited;
  lblTotQtdOper.Caption := FormatFloat('###,###,###,###,##0', fTotQtdOper);
  fTotQtdOper := 0
end;

end.
