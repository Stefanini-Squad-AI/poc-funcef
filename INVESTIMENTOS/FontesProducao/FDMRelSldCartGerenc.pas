unit FDMRelSldCartGerenc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppDB, ppCtrls, ppBands, ppClass, ppReport, ppStrtch, ppSubRpt,
  ppVar, ppPrnabl, ppCache, ppProd, Db, DBTables, Wwquery, Wwdatsrc,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, ppViewr;

type
  TDMRelSldCartGerenc = class(TdtmReports)
    rptSldCartGerenc: TppReport;
    ppHeaderBand1: TppHeaderBand;
    shpCabecalho: TppShape;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel6: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpSldCartGerencSaldo: TppShape;
    dbValorOperacao: TppDBText;
    srptSldCaixaGerenc: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppShape1: TppShape;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel9: TppLabel;
    ppDetailBand2: TppDetailBand;
    shpSldCartGerencMovimento: TppShape;
    ppDBText3: TppDBText;
    dbtValorItem: TppDBText;
    ppDBText7: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppdbCarteira: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppShape4: TppShape;
    ppLabel7: TppLabel;
    ppDBCalc2: TppDBCalc;
    pplSaldo: TppBDEPipeline;
    pplMovimento: TppBDEPipeline;
    ppLCarteira: TppLabel;
    ppLPeriodo: TppLabel;
    ppDbLogo: TppDBImage;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel12: TppLabel;
    ppDBImage1: TppDBImage;
    procedure rptSldCartGerencStartPage(Sender: TObject);
    procedure shpSldCartGerencSaldoPrint(Sender: TObject);
    procedure shpSldCartGerencMovimentoPrint(Sender: TObject);
    procedure srptSldCaixaGerencPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DMRelSldCartGerenc: TDMRelSldCartGerenc;

implementation

uses FCadOpeVirtual;

{$R *.DFM}

procedure TDMRelSldCartGerenc.rptSldCartGerencStartPage(Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3;
  shpSldCartGerencSaldo.Brush.Color := clWhite;
  shpSldCartGerencMovimento.Brush.Color := clWhite;
end;

procedure TDMRelSldCartGerenc.shpSldCartGerencSaldoPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra

end;

procedure TDMRelSldCartGerenc.shpSldCartGerencMovimentoPrint(
  Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDMRelSldCartGerenc.srptSldCaixaGerencPrint(Sender: TObject);
var x: Integer;
begin
  frmCadOpeVirtual.qrySaldoCaixaDet.Filter := 'IDCARTEIRAINVEST = ' +
                                              frmCadOpeVirtual.qrySaldoCaixasIDCARTEIRAINVEST.AsString + ' AND ' +
                                              'IDCARTEIRAGERENC = ' +
                                              frmCadOpeVirtual.qrySaldoCaixasIDCARTEIRAGERENC.AsString;
  inherited;

end;

end.
