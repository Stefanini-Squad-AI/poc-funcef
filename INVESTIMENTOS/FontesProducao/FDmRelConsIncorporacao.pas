unit FDmRelConsIncorporacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppCtrls, ppDB, ppVar, ppBands, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt;

type
  TDmRelConsIncorporacao = class(TDmRelatoriosInv)
    ppLConsIncorporacao: TppBDEPipeline;
    DsConsIncorporacao: TwwDataSource;
    QryConsIncorporacao: TwwQuery;
    rpConsIncorporacao: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBImage1: TppDBImage;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine3: TppLine;
    ppShape8: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel135: TppLabel;
    ppLabel9: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppDBText18: TppDBText;
    srptMovResgate: TppSubReport;
    ppChildReport4: TppChildReport;
    ppDetailBand7: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    DsConsIncorporacaoResgDet: TwwDataSource;
    QryConsIncorporacaoResgDet: TwwQuery;
    ppLConsIncorporacaoResgDet: TppBDEPipeline;
    ppTitleBand1: TppTitleBand;
    DsConsIncorporacaoAplDet: TwwDataSource;
    QryConsIncorporacaoAplDet: TwwQuery;
    ppLConsIncorporacaoAplDet: TppBDEPipeline;
    srptMovAplicacao: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText2: TppDBText;
    ppLine5: TppLine;
    ppDBText4: TppDBText;
    ppLine4: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    procedure rpConsIncorporacaoBeforePrint(Sender: TObject);
    procedure ppDetailBand7AfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmRelConsIncorporacao: TDmRelConsIncorporacao;

implementation

Uses uBibliotecaInvest;

{$R *.DFM}

procedure TDmRelConsIncorporacao.rpConsIncorporacaoBeforePrint(
  Sender: TObject);
begin
  inherited;
    ppLabel3.Caption := sPlanPrevCtbPatro;
end;

procedure TDmRelConsIncorporacao.ppDetailBand7AfterPrint(Sender: TObject);
begin
  inherited;
   If QryConsIncorporacaoResgDet.RecordCount = 1 then
      ppSummaryBand5.Visible := False
   Else
      ppSummaryBand5.Visible := True;
end;

end.
