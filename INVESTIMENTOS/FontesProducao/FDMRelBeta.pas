
unit FDMRelBeta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppViewr;


type
  TDmRelBeta = class(TdtmReports)
    rptBeta: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplCarteiras: TppBDEPipeline;
    pplCartItens: TppBDEPipeline;
    dsCarteiras: TwwDataSource;
    dsCartItens: TwwDataSource;
    qryCarteiras: TwwQuery;
    qryCartItens: TwwQuery;
    shpCabecalho: TppShape;
    srptBetaCartItens: TppSubReport;
    srptBetaCartItens2: TppChildReport;
    ppLabel11: TppLabel;
    dblCarteira: TppDBText;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppShape1: TppShape;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    shpTitCart: TppShape;
    shpDetCarteira: TppShape;
    bdtVlrItem: TppDBText;
    qryInvestimentos: TwwQuery;
    qryInvItens: TwwQuery;
    dsInvestimentos: TDataSource;
    dsInvItens: TDataSource;
    pplInvestimentos: TppBDEPipeline;
    pplInvItens: TppBDEPipeline;
    qryInvItensDATACOTACAO: TDateTimeField;
    qryInvItensNOMEPARAM: TStringField;
    qryInvItensVLRBETA: TFloatField;
    qryInvestimentosDESCINVESTIMENTO: TStringField;
    qryInvestimentosIDINVESTIMENTO: TFloatField;
    qryCarteirasCARTEIRA: TStringField;
    qryCarteirasIDCARTEIRAINVEST: TFloatField;
    qryCarteirasIDCARTEIRAGERENC: TFloatField;
    qryCartItensDATAHISTBETA: TDateTimeField;
    qryCartItensNOMEPARAM: TStringField;
    qryCartItensVLRBETA: TFloatField;
    ppSummaryBand2: TppSummaryBand;
    srptBetaInv: TppSubReport;
    srptBetaInvestimento: TppChildReport;
    ppDetailBand3: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppHeaderBand2: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppImage2: TppImage;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppShape2: TppShape;
    srptBetaInvItens: TppSubReport;
    srptBetaInvItens2: TppChildReport;
    ppDetailBand4: TppDetailBand;
    ppTitleBand2: TppTitleBand;
    ppSummaryBand3: TppSummaryBand;
    ppShape3: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    shpDetInvestimento: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    qryCartItensIDCARTEIRAINVEST: TFloatField;
    qryCartItensIDCARTEIRAGERENC: TFloatField;
    qryInvItensIDINVESTIMENTO: TFloatField;
    ppLabel10: TppLabel;
    ppDBText4: TppDBText;
    dblInvestimento: TppDBText;
    shpTitInvestimento: TppShape;
    ppDBText6: TppDBText;
    ppDBText3: TppDBText;
    ppLabel12: TppLabel;
    lblTitPeriodoCart: TppLabel;
    lblTitPeriodoInv: TppLabel;
    qryCarteirasIDPLANPREVCTBPATR: TFloatField;
    qryCarteirasPLANPRVCONTABPATRO: TStringField;
    dbiLogoEmpresa: TppDBImage;
    procedure rptBetaStartPage(Sender: TObject);
    procedure shpTitCartPrint(Sender: TObject);
    procedure shpDetCarteiraPrint(Sender: TObject);
    procedure qryInvestimentosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelBeta: TDmRelBeta;

implementation

{$R *.DFM}
procedure TDmRelBeta.rptBetaStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TDmRelBeta.shpTitCartPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra

end;

procedure TDmRelBeta.shpDetCarteiraPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra

end;

procedure TDmRelBeta.qryInvestimentosAfterScroll(DataSet: TDataSet);
begin
   inherited;
   qryInvItens.Filter := 'IDINVESTIMENTO = ' +
                         qryInvestimentosIDINVESTIMENTO.AsString;
end;

end.
