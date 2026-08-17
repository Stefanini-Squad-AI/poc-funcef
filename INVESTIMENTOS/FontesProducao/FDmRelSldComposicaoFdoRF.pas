//******************************************************************************
// Data      : 07/04/2006
// Código    : AL_1
// Motivo    : Implementado do relatório(impressão)
//******************************************************************************
                                                                
unit FDmRelSldComposicaoFdoRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppDB, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE;

type
  TDmRelSldComposicaoFdoRF = class(TDmRelatoriosInv)
    pplSldComposicaoFdoRF: TppBDEPipeline;
    dsSldComposicaoFdoRF: TwwDataSource;
    qrySldComposicaoFdoRF: TwwQuery;
    rpSldComposicaoFdoRF: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodoRef: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    qrySldComposicaoFdoRFDESCFUNDOINVEST: TStringField;
    qrySldComposicaoFdoRFIDHISTFUNDO: TFloatField;
    qrySldComposicaoFdoRFCODDOCUMENTO: TFloatField;
    qrySldComposicaoFdoRFPLNCODIGO: TFloatField;
    qrySldComposicaoFdoRFPLANO: TFloatField;
    qrySldComposicaoFdoRFIDTIPOINVEST: TFloatField;
    qrySldComposicaoFdoRFIDTIPOOPERACAO: TFloatField;
    qrySldComposicaoFdoRFIDCARTEIRAINVEST: TFloatField;
    qrySldComposicaoFdoRFIDFUNDOINVEST: TFloatField;
    qrySldComposicaoFdoRFDATAAPLICACAO: TDateTimeField;
    qrySldComposicaoFdoRFDATAMOVFUNDO: TDateTimeField;
    qrySldComposicaoFdoRFHISTMOVFUNDO: TStringField;
    qrySldComposicaoFdoRFNATURMOVFUNDO: TStringField;
    qrySldComposicaoFdoRFTIPMOVFUNDO: TStringField;
    qrySldComposicaoFdoRFVLRAPLICADO: TFloatField;
    qrySldComposicaoFdoRFVLRIRPROV: TFloatField;
    qrySldComposicaoFdoRFVLRIOFPROV: TFloatField;
    qrySldComposicaoFdoRFVLRVARIACAO: TFloatField;
    qrySldComposicaoFdoRFCOTASMOVFUNDO: TFloatField;
    qrySldComposicaoFdoRFVLRMOVFUNDO: TFloatField;
    qrySldComposicaoFdoRFFLGCALCSALDO: TStringField;
    qrySldComposicaoFdoRFSALDOQTDCOTAS: TFloatField;
    qrySldComposicaoFdoRFSALDOVLRFUNDO: TFloatField;
    qrySldComposicaoFdoRFVLRCOTAAPLICACAO: TFloatField;
    qrySldComposicaoFdoRFVLRCOTAATUAL: TFloatField;
    qrySldComposicaoFdoRFSALDOLIQUIDO: TFloatField;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    shpDetalhe: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLine1: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLine3: TppLine;
    ppShape2: TppShape;
    ppSummaryBand1: TppSummaryBand;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLine4: TppLine;
    procedure shpDetalhePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1AfterPrint(Sender: TObject);
    procedure rpSldComposicaoFdoRFBeforePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
    wCount    : Integer;        
  public
    { Public declarations }
  end;

var
  DmRelSldComposicaoFdoRF: TDmRelSldComposicaoFdoRF;

implementation

{$R *.DFM}

procedure TDmRelSldComposicaoFdoRF.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;                                                     

  (Sender as TppShape).Brush.Color := cCorZebra;
end;

procedure TDmRelSldComposicaoFdoRF.ppDetailBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
   wCount := wCount + 1;
end;

procedure TDmRelSldComposicaoFdoRF.ppGroupFooterBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  If wCount <= 1 Then
     ppGroupFooterBand1.Visible := False
  else
     ppGroupFooterBand1.Visible := True;
end;

procedure TDmRelSldComposicaoFdoRF.ppGroupFooterBand1AfterPrint(
  Sender: TObject);
begin
  inherited;
   wCount := 0;
end;

procedure TDmRelSldComposicaoFdoRF.rpSldComposicaoFdoRFBeforePrint(
  Sender: TObject);
begin
  inherited;
   wCount := 0;
   ppGroupFooterBand1.Visible := True;
end;

end.
