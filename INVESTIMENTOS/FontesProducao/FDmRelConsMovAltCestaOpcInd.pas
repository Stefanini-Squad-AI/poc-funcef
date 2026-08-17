unit FDmRelConsMovAltCestaOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelConsMovAltCestaOpcInd = class(TDmRelatoriosInv)
    ppRConsMovAltCestaOpcInd: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLabel9: TppLabel;
    ppDBImage2: TppDBImage;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppShape1: TppShape;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppDBText6: TppDBText;
    ppLDataMov: TppLabel;
    ppLabel27: TppLabel;
    ppLabel12: TppLabel;
    ppLabel19: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape2: TppShape;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText9: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine10: TppLine;
    ppLabel26: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    pplConsMovAltCestaOpcInd: TppBDEPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape3: TppShape;
    ppDBText1: TppDBText;
    ppRConsMovAltCestaOpcIndSintetico: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBImage1: TppDBImage;
    ppLDataMovSintetico: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppShape4: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    pplConsMovAltCestaOpcIndSintetico: TppBDEPipeline;
    DsConsMovAltCestaOpcIndSintetico: TwwDataSource;
    QryConsMovAltCestaOpcIndSintetico: TwwQuery;
    QryConsMovAltCestaOpcIndSinteticoDESCINVESTIMENTO: TStringField;
    QryConsMovAltCestaOpcIndSinteticoDESCCARTINVEST: TStringField;
    QryConsMovAltCestaOpcIndSinteticoQTDANT: TFloatField;
    QryConsMovAltCestaOpcIndSinteticoQTDATU: TFloatField;
    QryConsMovAltCestaOpcIndSinteticoDIF: TFloatField;
    QryConsMovAltCestaOpcIndSinteticoCUSTO: TFloatField;
    QryConsMovAltCestaOpcIndSinteticoVARIACAO: TFloatField;
    ppShape5: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLine11: TppLine;
    ppDBCalc2: TppDBCalc;
    ppLine12: TppLine;
    QryConsMovAltCestaOpcIndSinteticoCUSTONEG: TFloatField;
    QryConsMovAltCestaOpcIndSinteticoCUSTOPOS: TFloatField;
    QryConsMovAltCestaOpcIndSinteticoVARIACAONEG: TFloatField;
    QryConsMovAltCestaOpcIndSinteticoVARIACAOPOS: TFloatField;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel18: TppLabel;
    procedure ppShape2Print(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;    
  public
    { Public declarations }
  end;

var
  DmRelConsMovAltCestaOpcInd: TDmRelConsMovAltCestaOpcInd;

implementation

uses FConsMovAltCestaOpcInd;

{$R *.DFM}

procedure TDmRelConsMovAltCestaOpcInd.ppShape2Print(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra;

end;

end.
