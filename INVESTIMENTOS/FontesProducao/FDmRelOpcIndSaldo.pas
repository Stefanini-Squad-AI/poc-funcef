unit FDmRelOpcIndSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppCtrls, ppBands, ppClass, ppReport, ppStrtch,
  ppSubRpt, Db, ppDB, ppVar, ppPrnabl, ppCache, ppProd, DBTables, Wwquery,
  Wwdatsrc, ppComm, ppRelatv, ppDBPipe, ppDBBDE;

type
  TDmRelOpcIndSaldo = class(TDmRelatoriosInv)
    pplHistOpcInd: TppBDEPipeline;
    pplItemOpcInd: TppBDEPipeline;
    dsHistOpcInd: TwwDataSource;
    dsItenOpcInd: TwwDataSource;
    rptOpcIndSaldo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    shpCabecalho: TppShape;
    rptRenFixSaldoTitulo: TppLabel;
    ppLabel16: TppLabel;
    ppLabel1: TppLabel;
    ppDBImage1: TppDBImage;
    ppLabel19: TppLabel;
    ppLabel22: TppLabel;
    ppbBandaDetalhe: TppDetailBand;
    shpRenFixSaldoDetPai: TppShape;
    dbtDescInvestimento: TppDBText;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppShape4: TppShape;
    ppLabel7: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    rdpPlano: TppGroupFooterBand;
    shpTotalPlano: TppShape;
    ppLabel18: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLine7: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    shpTitData: TppShape;
    dbDataOper: TppDBText;
    ppLabel5: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    qryItensOpcInd: TwwQuery;
    qryHistOpcInd: TwwQuery;
    qryHistOpcIndPLANPRVCONTABPATRO: TStringField;
    qryHistOpcIndDESCCARTINVEST: TStringField;
    qryHistOpcIndDESCINVESTIMENTO: TStringField;
    qryHistOpcIndDATAHISTOPCIND: TDateTimeField;
    qryHistOpcIndIDBOLETA: TStringField;
    qryHistOpcIndIDLOTE: TStringField;
    qryHistOpcIndSLDVLRHISTOPCIND: TFloatField;
    qryHistOpcIndSLDQTDHISTOPCIND: TFloatField;
    qryItensOpcIndDESITEMOPCIND: TStringField;
    qryItensOpcIndNOMEREGRA: TStringField;
    qryItensOpcIndVLRHISTOPCIND: TFloatField;
    qryItensOpcIndSLDHISTOPCIND: TFloatField;
    qryItensOpcIndIDHISTOPCIND: TFloatField;
    qryItensOpcIndIDITEMOPCIND: TFloatField;
    qryItensOpcIndIDREGRAUSADA: TFloatField;
    srptOpcIndSaldo: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppShape1: TppShape;
    ppLabel13: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    shpRenFixSaldoDetFilho: TppShape;
    ppDBText3: TppDBText;
    dbtValorItem: TppDBText;
    ppDBText7: TppDBText;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    qryHistOpcIndAJUSTE: TFloatField;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBText5: TppDBText;
    ppLabel9: TppLabel;
    qryHistOpcIndCESTA: TFloatField;
    qryHistOpcIndANTIGA: TwwQuery;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    procedure shpRenFixSaldoDetFilhoPrint(Sender: TObject);
    procedure rptOpcIndSaldoStartPage(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;    
  public
    { Public declarations }
  end;

var
  DmRelOpcIndSaldo: TDmRelOpcIndSaldo;

implementation

{$R *.DFM}

procedure TDmRelOpcIndSaldo.shpRenFixSaldoDetFilhoPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra;
end;

procedure TDmRelOpcIndSaldo.rptOpcIndSaldoStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
end;

end.
