unit dRelRetroRegional;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
  ppSubRpt, ppVar, ppRelatv, ppDBPipe;

type
  TdtmRelRetroRegional = class(TdtmReports)
    dsRegContribPart: TwwDataSource;
    qryRegContribPart: TwwQuery;
    ppbdeRegContribPart: TppBDEPipeline;
    qryRegContribPatroInd: TwwQuery;
    dsRegContribPatroInd: TwwDataSource;
    ppbdeRegContribPatroInd: TppBDEPipeline;
    dsTotContribPart: TwwDataSource;
    qryTotContribPart: TwwQuery;
    ppbdeTotContribPart: TppBDEPipeline;
    qryTotContribPatroInd: TwwQuery;
    dsTotContribPatroInd: TwwDataSource;
    ppbdeTotContribPatroInd: TppBDEPipeline;
    qryRegContribPatroCol: TwwQuery;
    dsRegContribPatroCol: TwwDataSource;
    ppbdeRegContribPatroCol: TppBDEPipeline;
    qryTotContribPatroCol: TwwQuery;
    dsTotContribPatroCol: TwwDataSource;
    ppbdeTotContribPatroCol: TppBDEPipeline;
    srepTotal: TppSubReport;
    rpExemploChildReport2DetailBand1: TppDetailBand;
    rpExemploChildReport2SummaryBand1: TppSummaryBand;
    srepContribPartTotal: TppSubReport;
    rpExemploChildReport2ChildReport1: TppChildReport;
    rpExemploChildReport2TitleBand2: TppTitleBand;
    rpExemploChildReport2DetailBand2: TppDetailBand;
    ppdbtNomeContribPartTot: TppDBText;
    ppdbtValorContribPartTot: TppDBText;
    rpExemploChildReport2SummaryBand2: TppSummaryBand;
    rpExemploChildReport2Label3: TppLabel;
    rpExemploChildReport2Label4: TppLabel;
    rpExemploSummaryBand1: TppSummaryBand;
    pplRegional: TppLabel;
    ppdbtRegional: TppDBText;
    srepContribPartRegional: TppSubReport;
    rpExemploChildReport3: TppChildReport;
    rpExemploChildReport3TitleBand1: TppTitleBand;
    rpExemploChildReport3DetailBand1: TppDetailBand;
    ppdbtNomeContribPartReg: TppDBText;
    ppdbtValorContribPartReg: TppDBText;
    rpExemploChildReport3SummaryBand1: TppSummaryBand;
    pplGrupoContrib: TppLabel;
    srepContribPatroRegional: TppSubReport;
    rpExemploChildReport1TitleBand1: TppTitleBand;
    rpExemploChildReport1DetailBand1: TppDetailBand;
    rpExemploChildReport1SummaryBand1: TppSummaryBand;
    rpExemploChildReport1Label1: TppLabel;
    srepContribPatroIndRegional: TppSubReport;
    rpExemploChildReport4: TppChildReport;
    rpExemploChildReport4TitleBand1: TppTitleBand;
    rpExemploChildReport4DetailBand1: TppDetailBand;
    ppdbtNomeContribPatroIndReg: TppDBText;
    ppdbtValorContribPatroIndReg: TppDBText;
    rpExemploChildReport4SummaryBand1: TppSummaryBand;
    srepContribPatroColRegional: TppSubReport;
    rpExemploChildReport5: TppChildReport;
    rpExemploChildReport5TitleBand1: TppTitleBand;
    rpExemploChildReport5DetailBand1: TppDetailBand;
    ppdbtNomeContribPatroColReg: TppDBText;
    ppdbtValorContribPatroColReg: TppDBText;
    rpExemploChildReport5SummaryBand1: TppSummaryBand;
    rpExemploChildReport3Line1: TppLine;
    rpExemploChildReport2Label1: TppLabel;
    srepContribPatroTotal: TppSubReport;
    rpExemploChildReport6TitleBand1: TppTitleBand;
    rpExemploChildReport6DetailBand1: TppDetailBand;
    rpExemploChildReport6SummaryBand1: TppSummaryBand;
    srepContribPatroIndTotal: TppSubReport;
    rpExemploChildReport2ChildReport2: TppChildReport;
    rpExemploChildReport2TitleBand3: TppTitleBand;
    rpExemploChildReport2DetailBand3: TppDetailBand;
    ppdbtNomeContribPatroIndTot: TppDBText;
    ppdbtValorContribPatroIndTot: TppDBText;
    rpExemploChildReport2SummaryBand3: TppSummaryBand;
    rpExemploChildReport2Label2: TppLabel;
    srepContribPatroColTotal: TppSubReport;
    rpExemploChildReport2ChildReport3: TppChildReport;
    rpExemploChildReport2TitleBand4: TppTitleBand;
    rpExemploChildReport2DetailBand4: TppDetailBand;
    ppdbtNomeContribPatroColTot: TppDBText;
    ppdbtValorContribPatroColTot: TppDBText;
    rpExemploChildReport2SummaryBand4: TppSummaryBand;
    rpExemploChildReport2FooterBand1: TppFooterBand;
    rpExemploChildReport2Line1: TppLine;
    rpExemploChildReport2HeaderBand1: TppHeaderBand;
    LblEmpresa2: TppLabel;
    lbltitulo2: TppLabel;
    pplValorTotal: TppLabel;
    rpExemploChildReport2Label5: TppLabel;
    rpExemploChildReport2Line3: TppLine;
    pplTotalPartRegional: TppLabel;
    ppdbcTotalPartReg: TppDBCalc;
    rpExemploChildReport3Line2: TppLine;
    rpExemploChildReport1Line1: TppLine;
    rpExemploChildReport1Label2: TppLabel;
    pplTotalRegPatro: TppLabel;
    ppdbcTotalRegPatroInd: TppDBCalc;
    ppdbcTotalRegPatroCol: TppDBCalc;
    rpExemploChildReport2ChildReport1Line1: TppLine;
    rpExemploChildReport2ChildReport1Label1: TppLabel;
    rpExemploChildReport2ChildReport1DBCalc1: TppDBCalc;
    rpExemploChildReport2ChildReport1Line2: TppLine;
    pplTotalPatro: TppLabel;
    rpExemploChildReport6Line1: TppLine;
    rpExemploChildReport6Label2: TppLabel;
    ppdbcTotalPatroCol: TppDBCalc;
    ppdbcTotalPatroInd: TppDBCalc;
    rpExemploLabel11: TppLabel;
    ppdbDataRetro: TppDBText;
    rpExemploLabel10: TppLabel;
    ppdbDataCob: TppDBText;
    rpExemploLabel8: TppLabel;
    ppdbMesIni: TppDBText;
    rpExemploLabel9: TppLabel;
    ppdbMesFim: TppDBText;
    rpExemploLine1: TppLine;
    rpExemploChildReport2Label6: TppLabel;
    rpExemploChildReport2DBText1: TppDBText;
    rpExemploChildReport2Label7: TppLabel;
    rpExemploChildReport2DBText2: TppDBText;
    rpExemploChildReport2Label8: TppLabel;
    rpExemploChildReport2DBText3: TppDBText;
    rpExemploChildReport2Label9: TppLabel;
    rpExemploChildReport2DBText4: TppDBText;
    rpExemploChildReport2Line4: TppLine;
    rpExemploChildReport2Line5: TppLine;
    pplTipoRetroReg: TppLabel;
    pplTipoRetroResumo: TppLabel;
    rpExemploLine2: TppLine;
    rpExemploLabel1: TppLabel;
    pplTotalRegional: TppLabel;
    rpExemploLine3: TppLine;
    rpExemploChildReport2Line2: TppLine;
    rpExemploChildReport2Calc1: TppSystemVariable;
    rpExemploChildReport2Calc2: TppSystemVariable;
    procedure DetailBand1AfterPrint(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TObject);
    procedure pplTotalRegPatroPrint(Sender: TObject);
    procedure pplTotalPatroPrint(Sender: TObject);
    procedure HeaderBand1BeforePrint(Sender: TObject);
    procedure rpExemploChildReport2HeaderBand1BeforePrint(Sender: TObject);
    procedure pplTotalRegionalPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nregional : integer;
  end;

var
  dtmRelRetroRegional: TdtmRelRetroRegional;

implementation

{$R *.DFM}

procedure TdtmRelRetroRegional.DetailBand1AfterPrint(Sender: TObject);
begin
  inherited;
  if not odd(nregional) then
    rpExemplo.groups[0].newpage:=true;
end;

procedure TdtmRelRetroRegional.DetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
  inc(nregional);
  rpExemplo.groups[0].newpage:=false;
end;

procedure TdtmRelRetroRegional.pplTotalRegPatroPrint(
  Sender: TObject);
begin
  inherited;
  //somar os valores da parte individual e coletiva
  pplTotalRegPatro.caption:=formatfloat('R$ #,##0.00', ppdbcTotalRegPatroInd.value+ppdbcTotalRegPatroCol.value);
end;

procedure TdtmRelRetroRegional.pplTotalRegionalPrint(Sender: TObject);
begin
  inherited;
  pplTotalRegional.caption:=formatfloat('R$ #,##0.00', ppdbcTotalPartReg.value+
                       ppdbcTotalRegPatroInd.value+ppdbcTotalRegPatroCol.value);
end;

procedure TdtmRelRetroRegional.pplTotalPatroPrint(
  Sender: TObject);
begin
  inherited;
  //somar os valores da parte individual e coletiva
  pplTotalPatro.caption:=formatfloat('R$ #,##0.00', ppdbcTotalPatroInd.value+ppdbcTotalPatroCol.value);
end;

procedure TdtmRelRetroRegional.HeaderBand1BeforePrint(Sender: TObject);
begin
  inherited;
  pplTipoRetroReg.caption := 'Tipo do Retroativo: '+qryexemplo.fieldbyname('FLGTPRETROATIVO').AsString;
  nregional:=0;
end;

procedure TdtmRelRetroRegional.rpExemploChildReport2HeaderBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  pplTipoRetroResumo.caption := pplTipoRetroReg.caption;
end;

end.
