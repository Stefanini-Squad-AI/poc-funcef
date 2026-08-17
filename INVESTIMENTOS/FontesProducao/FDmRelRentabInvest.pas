//******************************************************************************
// Data      : 01/08/2007
// Código    : AL_4
// Pendencia : 25761
// SOL       : 63520 / 63519
// Desc      : Implementação para buscar o IOF pago como despesa
//******************************************************************************
// Data      : 30/07/2007
// Código    : AL_3
// Pendencia : 25682
// Motivo    : Implementação do grafico de rentabilidade da cota
//             Implementação do gráfico paralelo do indexador
//******************************************************************************
// Data      : 02/07/2007
// Código    : AL_2
// Pendencia : 25594
// SOL       : 56257
// Motivo    : Implementação da coluna de DESPESAS, devido a taxa de ingresso e saída
//             referentes aos fundos FIA, FIDC e Participações
//******************************************************************************
// Data      : 26/09/2006
// Código    : AL_1
// Pendencia : 22968
// Desc      : Segregação de Planp/Patrocinadora
//******************************************************************************
unit FDmRelRentabInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosRendaFixa, ppBands, ppClass, ppCtrls, ppReport, ppStrtch,
  ppSubRpt, DBTables, Db, ppVar, ppPrnabl, ppCache, ppProd, Wwquery,
  Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppViewr,
  FDMRelatoriosInv, ppChrt, ppChrtDP;

type
  TDmRelRentabInvest = class(TDmRelatoriosInv)
    QryMovRentabilidade: TwwQuery;
    QryMovRentabilidadeDATA: TDateTimeField;
    QryMovRentabilidadeQUANTIDADE: TFloatField;
    QryMovRentabilidadeVLRCOTA: TFloatField;
    QryMovRentabilidadeSALDO: TFloatField;
    QryMovRentabilidadeVLRAPLICACAO: TFloatField;
    QryMovRentabilidadeVLRRESGATE: TFloatField;
    QryMovRentabilidadeIDRELATORIO: TFloatField;
    QryMovRentabilidadeSALDOCOT: TFloatField;
    dsMovRentabilidade: TwwDataSource;
    UpdMovRentabilidade: TUpdateSQL;
    DsRelatorio: TwwDataSource;
    QryRelatorio: TwwQuery;
    ppRConsRentabilidade: TppReport;
    ppHeaderBand24: TppHeaderBand;
    ppShape33: TppShape;
    ppShape35: TppShape;
    lblTitPersInd: TppLabel;
    ppLabel260: TppLabel;
    ppShape37: TppShape;
    ppLabel218: TppLabel;
    lblIndicador: TppLabel;
    lblValorizacao: TppLabel;
    lblPerIndicador: TppLabel;
    lblPerSind: TppLabel;
    ppLine125: TppLine;
    ppShape32: TppShape;
    ppLabel261: TppLabel;
    ppDetailBand24: TppDetailBand;
    ppSCenario: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand27: TppDetailBand;
    ppLine105: TppLine;
    ppLine112: TppLine;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppShape22: TppShape;
    ppLabel217: TppLabel;
    ppShape30: TppShape;
    ppLabel219: TppLabel;
    ppGroupFooterBand7: TppGroupFooterBand;
    //AL_2
    ppSMovimento: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand28: TppDetailBand;
    shpDetMovimento: TppShape;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppDBText117: TppDBText;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppLine117: TppLine;
    ppLine119: TppLine;
    ppLine120: TppLine;
    ppLine132: TppLine;
    ppLine133: TppLine;
    ppLine136: TppLine;
    ppLine138: TppLine;
    ppLine140: TppLine;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppShape31: TppShape;
    ppLabel226: TppLabel;
    ppShape24: TppShape;
    ppLine98: TppLine;
    ppLabel220: TppLabel;
    ppLabel221: TppLabel;
    ppLabel222: TppLabel;
    ppLabel223: TppLabel;
    ppLabel224: TppLabel;
    ppLabel225: TppLabel;
    ppLine116: TppLine;
    ppLine131: TppLine;
    ppLine134: TppLine;
    ppLine135: TppLine;
    ppLine137: TppLine;
    ppLine139: TppLine;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppFooterBand23: TppFooterBand;
    ppLine56: TppLine;
    ppLabel252: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppSystemVariable13: TppSystemVariable;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppBdeConsRentabilidade: TppBDEPipeline;
    ppBdeCenario: TppBDEPipeline;
    ppBdeRelatorio: TppBDEPipeline;
    dsPortfolio: TDataSource;
    qryPortfolio: TQuery;
    ppLabel2: TppLabel;
    shpDetPortfolio: TppShape;
    ppDBText113: TppDBText;
    ppDBText1: TppDBText;
    updPortfolio: TUpdateSQL;
    qryPortfolioTIPO: TStringField;
    qryPortfolioINVESTIMENTO: TStringField;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLine2: TppLine;
    qryPortfolioIDRELATORIO: TFloatField;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppLabel1: TppLabel;
    lblTxJuros: TppLabel;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLine3: TppLine;
    ppLCarteira: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    lblPlano: TppLabel;
    lblPeriodo: TppLabel;
    ppDBImage1: TppDBImage;
    //AL_2
    QryMovRentabilidadeVLRDESPESAS: TFloatField;
    ppLabel5: TppLabel;
    ppLine5: TppLine;
    ppDBText2: TppDBText;
    ppLine4: TppLine;
    ppSGrafico: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape8: TppShape;
    ppLabel6: TppLabel;
    ppShape9: TppShape;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine22: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel7: TppLabel;
    tchGrafico: TppDPTeeChart;
    QryMovRentabilidadeVLRCOTAIND: TFloatField;
    QryMovRentabilidadeVLRTAXAS: TFloatField;
    procedure ppRConsRentabilidadeStartPage(Sender: TObject);
    procedure shpDetPortfolioPrint(Sender: TObject);
    procedure shpDetMovimentoPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelRentabInvest: TDmRelRentabInvest;

implementation

{$R *.DFM}

Uses UBibliotecaInvest;

procedure TDmRelRentabInvest.ppRConsRentabilidadeStartPage(
  Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpDetPortfolio.Brush.Color := clWhite;
   shpDetMovimento.Brush.Color := clWhite;
end;

procedure TDmRelRentabInvest.shpDetPortfolioPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelRentabInvest.shpDetMovimentoPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

end.
