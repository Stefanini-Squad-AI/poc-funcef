unit FDmRelHistCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelHistCaixa = class(TDmRelatoriosInv)
    RptHistoricoCaixa: TppReport;
    ppHeaderBand23: TppHeaderBand;
    ppShape3: TppShape;
    ppLine50: TppLine;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel116: TppLabel;
    ppLabel124: TppLabel;
    ppLDataCxa: TppLabel;
    ppDBImage5: TppDBImage;
    ppDetailBand24: TppDetailBand;
    ppsHistCaixa: TppShape;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppFooterBand22: TppFooterBand;
    ppLine52: TppLine;
    ppLabel123: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    BdeHitoricoCaixa: TppBDEPipeline;
    DsHitoricoCaixa: TwwDataSource;
    pdbCartGerenc: TppDBText;
    pdbPlano: TppDBText;
    QryHistCaixa: TwwQuery;
    QryHistCaixaIDHISTCAIXA: TFloatField;
    QryHistCaixaIDPLANPREVCTBPATR: TFloatField;
    QryHistCaixaIDCARTEIRAGERENC: TFloatField;
    QryHistCaixaDATAHISTCAIXA: TDateTimeField;
    QryHistCaixaDESCCARTGERENC: TStringField;
    QryHistCaixaDESCINVESTIMENTO: TStringField;
    QryHistCaixaSIGLAACAOBOLSA: TStringField;
    QryHistCaixaDESCCAIXACOTA: TStringField;
    QryHistCaixaVLRHISTCAIXA: TFloatField;
    QryHistCaixaSLDHISTCAIXA: TFloatField;
    QryHistCaixaPLANPRVCONTABPATRO: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    procedure ppsHistCaixaPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelHistCaixa: TDmRelHistCaixa;

implementation

{$R *.DFM}

procedure TDmRelHistCaixa.ppsHistCaixaPrint(Sender: TObject);
begin
  inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;
end;

end.
