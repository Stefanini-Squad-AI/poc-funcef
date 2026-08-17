//******************************************************************************
// Data      : 30/07/2007
// Código    : AL_4
// Pendencia : 25682
// SOL       :
// Motivo    : Implementação do grafico de rentabilidade da cota
//******************************************************************************
// Data      : 02/07/2007
// Código    : AL_3
// Pendencia : 25594
// SOL       : 56257
// Motivo    : Implementação da coluna de DESPESAS, devido a taxa de ingresso e saída
//             referentes aos fundos FIA, FIDC e Participações
//******************************************************************************
// Data      : 26/09/2006
// Código    : AL_2
// Pendencia : 22969
// Desc      : Segregação de Planp/Patrocinadora
//******************************************************************************
// Data     : 22/02/2006
// Código   : AL_1
// Motivo   : Acerto no Caption do Relatório que estava faltando o "SPC"
//******************************************************************************
unit FDmRelRentabSPC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt,
  ppViewr, ppChrt, ppChrtDP;

type
  TDmRelRentabSPC = class(TDmRelatoriosInv)
    ppRConsRentabSPC: TppReport;
    ppHeaderBand24: TppHeaderBand;
    ppShape6: TppShape;
    ppShape5: TppShape;
    ppShape4: TppShape;
    ppShape2: TppShape;
    ppShape32: TppShape;
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
    ppLabel261: TppLabel;
    ppShape3: TppShape;
    ppLabel1: TppLabel;
    lblTxJuros: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    lblPlano: TppLabel;
    lblPeriodo: TppLabel;
    ppDBImage1: TppDBImage;
    ppDetailBand24: TppDetailBand;
    ppSCenario: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand27: TppDetailBand;
    shpDetPortfolio: TppShape;
    ppLine105: TppLine;
    ppLine112: TppLine;
    ppDBText113: TppDBText;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppShape22: TppShape;
    ppLabel217: TppLabel;
    ppShape30: TppShape;
    ppLabel219: TppLabel;
    ppLabel2: TppLabel;
    ppGroupFooterBand7: TppGroupFooterBand;
    //AL_3
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
    ppLine3: TppLine;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppFooterBand23: TppFooterBand;
    ppLine56: TppLine;
    ppLabel252: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppSystemVariable13: TppSystemVariable;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppBdeConsRentabSPC: TppBDEPipeline;
    dsMovRentabSPC: TwwDataSource;
    QryMovRentabSPC: TwwQuery;
    QryMovRentabSPCDATA: TDateTimeField;
    QryMovRentabSPCQUANTIDADE: TFloatField;
    QryMovRentabSPCVLRCOTA: TFloatField;
    QryMovRentabSPCSALDO: TFloatField;
    QryMovRentabSPCVLRAPLICACAO: TFloatField;
    QryMovRentabSPCVLRRESGATE: TFloatField;
    QryMovRentabSPCSALDOCOT: TFloatField;
    QryMovRentabSPCIDRELATORIO: TFloatField;
    UpdMovRentabSPC: TUpdateSQL;
    QryRelatorio: TwwQuery;
    DsRelatorio: TwwDataSource;
    ppBdeRelatorio: TppBDEPipeline;
    ppBdeCenario: TppBDEPipeline;
    dsPortfolio: TDataSource;
    qryPortfolio: TQuery;
    qryPortfolioTIPO: TStringField;
    qryPortfolioINVESTIMENTO: TStringField;
    qryPortfolioIDRELATORIO: TFloatField;
    updPortfolio: TUpdateSQL;
    //AL_3    
    QryMovRentabSPCVLRDESPESAS: TFloatField;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
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
    ppLabel7: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    tchGrafico: TppDPTeeChart;
    QryMovRentabSPCVLRCOTAIND: TFloatField;
    QryMovRentabSPCVLRTAXAS: TFloatField;
    procedure ppRConsRentabSPCStartPage(Sender: TObject);
    procedure shpDetPortfolioPrint(Sender: TObject);
    procedure shpDetMovimentoPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelRentabSPC: TDmRelRentabSPC;

implementation

{$R *.DFM}

procedure TDmRelRentabSPC.ppRConsRentabSPCStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpDetPortfolio.Brush.Color := clWhite;
   shpDetMovimento.Brush.Color := clWhite;
end;

procedure TDmRelRentabSPC.shpDetPortfolioPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelRentabSPC.shpDetMovimentoPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

end.
