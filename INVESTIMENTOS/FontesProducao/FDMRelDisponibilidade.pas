unit FDmRelDisponibilidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, Db, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  ppChrtDP, ppChrt, ppBands, ppCtrls, ppDB, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE;

type
  TDmRelDisponibilidade = class(TDmRelatoriosInv)
    pplSintetica: TppBDEPipeline;
    pplAnalitica: TppBDEPipeline;
    rptDispSintetica: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpDispConDetalhe: TppShape;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    rptDispAnalitica: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    lblDispAnaEmpresa: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine4: TppLine;
    lblDispAnaSistema: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    rptDispGrafico: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLine5: TppLine;
    ppLabel8: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppLine6: TppLine;
    ppLabel9: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDPTeeChart1: TppDPTeeChart;
    ppDPTeeChartControl1: TppDPTeeChartControl;
    qrySintetica: TwwQuery;
    qrySinteticaNOMEPLANOPATRO: TStringField;
    qrySinteticaSALDOANT: TFloatField;
    qrySinteticaRECEBIMENTOS: TFloatField;
    qrySinteticaDESEMBOLSOS: TFloatField;
    qrySinteticaSALDODIA: TFloatField;
    qrySinteticaNOMEPLANO: TStringField;
    qrySinteticaNOMEPATRO: TStringField;
    qrySinteticaIDPLANOPREV: TFloatField;
    qrySinteticaIDPATRO: TFloatField;
    qryAnalitica: TwwQuery;
    qryAnaliticaNODOCUMENTO: TStringField;
    qryAnaliticaNOMEFORCLI: TStringField;
    qryAnaliticaVALORARECEBER: TFloatField;
    qryAnaliticaVALORAPAGAR: TFloatField;
    qryAnaliticaIDPLANOPREV: TFloatField;
    qryAnaliticaIDPATRO: TFloatField;
    qryAnaliticaTIPOREG: TFloatField;
    dsSintetica: TwwDataSource;
    dsAnalitica: TwwDataSource;
    shpDispConCabecalho: TppShape;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    shpDispAnaDetalhe: TppShape;
    shpDispAnaCabecalho: TppShape;
    ppLabel5: TppLabel;
    ppDBText7: TppDBText;
    ppLabel6: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    procedure shpDispConDetalhePrint(Sender: TObject);
    procedure rptDispSinteticaStartPage(Sender: TObject);
    procedure shpDispAnaDetalhePrint(Sender: TObject);
    procedure rptDispAnaliticaStartPage(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelDisponibilidade: TDmRelDisponibilidade;

implementation

{$R *.DFM}

procedure TDmRelDisponibilidade.rptDispSinteticaStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpDispConDetalhe.Brush.Color := clWhite;
end;

procedure TDmRelDisponibilidade.shpDispConDetalhePrint(Sender: TObject);
begin
   inherited;
   if qrySinteticaIDPATRO.AsInteger = -1 then
   begin
      cCorZebra := clSilver;
      TppShape(Sender).Pen.Style := psSolid;
   end
   else
   begin
      if cCorZebra = ClWhite then
         cCorZebra := $00E3E3E3
      else
         cCorZebra := ClWhite;
      TppShape(Sender).Pen.Style := psClear;
   end;
   TppShape(Sender).Brush.Color := cCorZebra;
end;


procedure TDmRelDisponibilidade.rptDispAnaliticaStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpDispAnaDetalhe.Brush.Color := clWhite;
end;

procedure TDmRelDisponibilidade.shpDispAnaDetalhePrint(Sender: TObject);
begin
   inherited;
   if (qryAnaliticaTIPOREG.AsInteger = 1) or (qryAnaliticaTIPOREG.AsInteger = 4) then
   begin
      cCorZebra := clSilver;
      TppShape(Sender).Pen.Style := psSolid;
   end
   else
   begin
      if cCorZebra = ClWhite then
         cCorZebra := $00E3E3E3
      else
         cCorZebra := ClWhite;
      TppShape(Sender).Pen.Style := psClear;
   end;
   TppShape(Sender).Brush.Color := cCorZebra;
end;

end.
