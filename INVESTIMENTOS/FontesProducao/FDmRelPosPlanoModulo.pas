unit FDmRelPosPlanoModulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  ppChrtDP, ppChrt;

type
  TDmRelPosPlanoModulo = class(TDmRelatoriosInv)
    pplPosicao: TppBDEPipeline;
    dsPosicao: TwwDataSource;
    qryPosicao: TwwQuery;
    rptPosPlanoModulo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBImage1: TppDBImage;
    lblDataRef: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    qryPosicaoPLANPRVCONTABPATRO: TStringField;
    qryPosicaoDESCINVESTIMENTO: TStringField;
    qryPosicaoSLDINV: TFloatField;
    qryPosicaoSLDPLANO: TFloatField;
    qryPosicaoPERCPLANO: TFloatField;
    qryPosicaoSLDTPINVEST: TFloatField;
    qryPosicaoPERCTPINV: TFloatField;
    qryPosicaoDESCTIPOINVEST: TStringField;
    qryPercPlano: TwwQuery;
    qryPercPlanoPLANPRVCONTABPATRO: TStringField;
    qryPercPlanoSALDO: TFloatField;
    qryPercCarteira: TwwQuery;
    qryPercCarteiraDESCTIPOINVEST: TStringField;
    qryPercCarteiraSALDO: TFloatField;
    ppDBText1: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    shpDetalhe: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppShape1: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel12: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel13: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDPTeeChart1: TppDPTeeChart;
    ppDPTeeChart2: TppDPTeeChart;
    dsPercPlano: TwwDataSource;
    pplPercPlano: TppBDEPipeline;
    dsPercCarteira: TwwDataSource;
    pplPercCarteira: TppBDEPipeline;
    procedure rptPosPlanoModuloStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelPosPlanoModulo: TDmRelPosPlanoModulo;

implementation

{$R *.DFM}

procedure TDmRelPosPlanoModulo.rptPosPlanoModuloStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3
end;

procedure TDmRelPosPlanoModulo.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

end.
