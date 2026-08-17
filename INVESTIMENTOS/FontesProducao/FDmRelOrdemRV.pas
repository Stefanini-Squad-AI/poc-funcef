unit FDmRelOrdemRV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelOrdemRV = class(TDmRelatoriosInv)
    pplOrdemRV: TppBDEPipeline;
    dsOrdemRV: TwwDataSource;
    qryOrdemRV: TwwQuery;
    rptOrdemRV: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBImage1: TppDBImage;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    qryOrdemRVNUMDOCMOVINV: TStringField;
    qryOrdemRVSGLCORRETVALORES: TStringField;
    qryOrdemRVDESCCARTINVEST: TStringField;
    qryOrdemRVDESCTIPOOPERACAO: TStringField;
    qryOrdemRVDESCINVESTIMENTO: TStringField;
    qryOrdemRVSGLBOLSAVALORES: TStringField;
    qryOrdemRVSGLCUSTODIANTE: TStringField;
    qryOrdemRVPUORDMOVINV: TFloatField;
    qryOrdemRVQTDEORDENADA: TFloatField;
    qryOrdemRVQTDEORDMOVINV: TFloatField;
    qryOrdemRVQTDELOTE: TFloatField;
    qryOrdemRVVALOR: TFloatField;
    ppDBText1: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    pplTipoOperacao: TppLine;
    ppDBText5: TppDBText;
    shpDetalhe: TppShape;
    shpCabecalho: TppShape;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppLabel11: TppLabel;
    ppDBText11: TppDBText;
    ppLabel12: TppLabel;
    ppDBText12: TppDBText;
    ppLabel13: TppLabel;
    procedure rptOrdemRVStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelOrdemRV: TDmRelOrdemRV;

implementation

{$R *.DFM}

procedure TDmRelOrdemRV.rptOrdemRVStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
   shpDetalhe.Brush.Color := clWhite;
end;

procedure TDmRelOrdemRV.shpDetalhePrint(Sender: TObject);
begin
   inherited;

   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra

end;

end.
