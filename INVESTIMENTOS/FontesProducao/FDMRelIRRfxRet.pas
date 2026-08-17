//******************************************************************************
//Data	          : 29/06/2004
//Origem	  : FUNCEF
//Query 	  : qryIRRfxRet
//Motivo(S)       : Passado o Active da qry para 'False'
//******************************************************************************

unit FDMRelIRRfxRet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDMRelIRRfxRet = class(TDmRelatoriosInv)
    qryIRRfxRet: TwwQuery;
    dsIRRfxRet: TwwDataSource;
    pplIRRfxRet: TppBDEPipeline;
    rptIRRfxRet: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplDtIni: TppLabel;
    pplDtFim: TppLabel;
    ppLabel4: TppLabel;
    qryIRRfxRetSALDOVLRINVCART: TFloatField;
    qryIRRfxRetSALDOQTDEINVCART: TFloatField;
    qryIRRfxRetDATAMOVCARTINV: TDateTimeField;
    qryIRRfxRetIDLOTE: TStringField;
    qryIRRfxRetRENDIMENTO: TFloatField;
    qryIRRfxRetVLRIR: TFloatField;
    qryIRRfxRetDESCINVESTIMENTO: TStringField;
    qryIRRfxRetDESCCARTINVEST: TStringField;
    qryIRRfxRetALIQUOTA: TFloatField;
    qryIRRfxRetINVESTXLOTE: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppDBText137: TppDBText;
    ppDBText2: TppDBText;
    qryIRRfxRetSIGLAEMISSOR: TStringField;
    qryIRRfxRetDATAEMTITRENFIX: TDateTimeField;
    qryIRRfxRetDATAVENCTITRENFIX: TDateTimeField;
    ppDBText4: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppShape2: TppShape;
    ppdbDemVdDescInvestimento: TppDBText;
    ppLabel6: TppLabel;
    ppDBText1: TppDBText;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppLabel287: TppLabel;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText8: TppDBText;
    ppLabel12: TppLabel;
    ppLine1: TppLine;
    ppLabel13: TppLabel;
    pplTotalIR: TppLabel;
    lblTotalIRInv: TppLabel;
    pplTotalIRInv: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLabel14: TppLabel;
    pplTotalRendInv: TppLabel;
    pplTotalRend: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    pplCarteira: TppLabel;
    ppDBImage1: TppDBImage;
    procedure pplTotalIRPrint(Sender: TObject);
    procedure ppDetailBand1AfterPrint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ppShape4Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRelIRRfxRet: TDMRelIRRfxRet;
  fTotalIR, fTotalIRInv,fTotalRend, fTotalRendInv: Double;
  bFirstPassagem : boolean;

implementation

{$R *.DFM}

procedure TDMRelIRRfxRet.pplTotalIRPrint(Sender: TObject);
begin
  inherited;
   pplTotalIR.Caption := FormatFloat('###,###,###,##0.00', fTotalIR);
   fTotalIRInv := 0;
   pplTotalRend.Caption := FormatFloat('###,###,###,##0.00', fTotalRend);
   fTotalRendInv := 0;
end;

procedure TDMRelIRRfxRet.FormShow(Sender: TObject);
begin
  inherited;
   fTotalIRInv := 0;
   fTotalRendInv := 0;
end;

procedure TDMRelIRRfxRet.ppShape4Print(Sender: TObject);
begin
  inherited;
  fTotalIRInv := 0;
  fTotalRendInv := 0;
end;

procedure TDMRelIRRfxRet.ppDetailBand1AfterPrint(Sender: TObject);
begin
  inherited;
   fTotalIRInv := fTotalIRInv + qryIRRfxRetVLRIR.AsFloat;
   pplTotalIRInv.Caption := FormatFloat('###,###,###,##0.00', fTotalIRInv);
   fTotalRendInv := fTotalRendInv + qryIRRfxRetRENDIMENTO.AsFloat;
   pplTotalRendInv.Caption := FormatFloat('###,###,###,##0.00', fTotalRendInv);
end;

end.
