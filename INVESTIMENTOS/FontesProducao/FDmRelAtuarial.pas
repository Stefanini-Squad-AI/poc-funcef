unit FDmRelAtuarial;
                                                                
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelAtuarial = class(TDmRelatoriosInv)
    pplAtuarial: TppBDEPipeline;
    dsAtuarial: TwwDataSource;
    qryAtuarial: TwwQuery;
    pprAtuarial: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    qryAtuarialDATAMOVCARTINV: TDateTimeField;
    qryAtuarialVLRMOV: TFloatField;
    qryAtuarialHISTMOVCARTINV: TStringField;
    qryAtuarialVLRINDICE: TFloatField;
    qryAtuarialFATORINDICE: TFloatField;
    qryAtuarialDIFDIAS: TFloatField;
    qryAtuarialDIFDIASACU: TFloatField;
    qryAtuarialRENTPERIODO: TFloatField;
    qryAtuarialRENTACU: TFloatField;
    qryAtuarialFATORTOTAL: TFloatField;
    qryAtuarialQTDCOTAS: TFloatField;
    qryAtuarialVALORCORRIGIDO: TFloatField;
    qryAtuarialTIPMOVCARTINV: TStringField;
    qryAtuarialIDCARTEIRAGERENC: TFloatField;
    qryAtuarialIDINVESTIMENTO: TFloatField;
    updAtuarial: TUpdateSQL;
    qryAtuarialFATORJUROS: TFloatField;
    ppDBText1: TppDBText;
    shpCabecalho: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    shpDetalhe: TppShape;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    qryAtuarialQTD: TFloatField;
    ppSummaryBand1: TppSummaryBand;
    qryAtuarialNATUREZAOPERACAO: TStringField;
    qryAtuarialDESCINVESTIMENTO: TStringField;
    qryAtuarialPU: TFloatField;
    qryAtuarialFLGOPDIREITO: TStringField;
    shpResumo: TppShape;
    lblValor: TppLabel;
    lblQtdAtual: TppLabel;
    lblPU: TppLabel;
    ppLine1: TppLine;
    ppLine3: TppLine;
    wwQuery1: TwwQuery;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    StringField2: TStringField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField15: TFloatField;
    StringField5: TStringField;
    qryAtuarialQTDMOV: TFloatField;
    ppDBText13: TppDBText;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel6: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDBImage1: TppDBImage;
    ppLabel26: TppLabel;
    ppPeriodo: TppLabel;
    procedure pprAtuarialStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelAtuarial: TDmRelAtuarial;

implementation

uses dOperComum;

{$R *.DFM}

procedure TDmRelAtuarial.pprAtuarialStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
   shpDetalhe.Brush.Color := clWhite;
end;

procedure TDmRelAtuarial.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;
   TppShape(Sender).Brush.Color := cCorZebra;
end;

end.
