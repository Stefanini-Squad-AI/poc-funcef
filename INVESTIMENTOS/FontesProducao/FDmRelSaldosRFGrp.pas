unit FDmRelSaldosRFGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, mxtables, mxstore, mxDB, ppStrtch, ppSubRpt,
  TeEngine, Series, ExtCtrls, TeeProcs, Chart, ppChrtDP, ppChrt, ppRegion,
  TXComp, TXRB;

type
  TDmRelSaldosRFGrp = class(TDmRelatoriosInv)
    dsPlano: TwwDataSource;
    desPlano: TDecisionSource;
    decPlano: TDecisionCube;
    deqPlano: TDecisionQuery;
    qryPlano: TwwQuery;
    qryPlanoGRUPO: TStringField;
    qryPlanoSALDOVLR: TFloatField;
    dsClasse: TwwDataSource;
    desClasse: TDecisionSource;
    decClasse: TDecisionCube;
    deqClasse: TDecisionQuery;
    qryClasse: TwwQuery;
    qryClasseGRUPO: TStringField;
    qryClasseSALDOVLR: TFloatField;
    dsRisco: TwwDataSource;
    desRisco: TDecisionSource;
    decRisco: TDecisionCube;
    deqRisco: TDecisionQuery;
    qryRisco: TwwQuery;
    qryRiscoGRUPO: TStringField;
    qryRiscoSALDOVLR: TFloatField;
    dsEmissor: TwwDataSource;
    desEmissor: TDecisionSource;
    decEmissor: TDecisionCube;
    deqEmissor: TDecisionQuery;
    qryEmissor: TwwQuery;
    qryEmissorGRUPO: TStringField;
    qryEmissorSALDO: TFloatField;
    rptSaldosRFGrupo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    lblCarteira: TppLabel;
    ppDBImage1: TppDBImage;
    lblDataRef: TppLabel;
    ppbDetalhe: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplSaldosRFGrpPlano: TppBDEPipeline;
    pplSaldosRFGrpClasse: TppBDEPipeline;
    pplSaldosRFGrpRisco: TppBDEPipeline;
    pplSaldosRFGrpEmissor: TppBDEPipeline;
    qryGrupos: TwwQuery;
    pplSaldosRFGrupos: TppBDEPipeline;
    dsGrupos: TwwDataSource;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    srptPlanoPatro: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDBText1: TppDBText;
    shpCabGrupo: TppShape;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppHeaderBand2: TppHeaderBand;
    ppRegion1: TppRegion;
    ppRegion2: TppRegion;
    ppgGrafPlanoBarra: TppDPTeeChart;
    ExtraOptions1: TExtraOptions;
    ppgGrafPlanoPizza: TppDPTeeChart;
    srptClasseTit: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppHeaderBand3: TppHeaderBand;
    ppLabel10: TppLabel;
    ppRegion3: TppRegion;
    ppRegion4: TppRegion;
    srptClasseRisco: TppSubReport;
    subReport1: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppHeaderBand4: TppHeaderBand;
    ppRegion5: TppRegion;
    ppRegion6: TppRegion;
    srptEmissor: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppHeaderBand5: TppHeaderBand;
    ppRegion7: TppRegion;
    ppRegion8: TppRegion;
    ppgGrafClasseBarra: TppDPTeeChart;
    ppgGrafClassePizza: TppDPTeeChart;
    ppgGrafRiscoBarra: TppDPTeeChart;
    ppgGrafRiscoPizza: TppDPTeeChart;
    ppgGrafEmissorBarra: TppDPTeeChart;
    ppgGrafEmissorPizza: TppDPTeeChart;
    qryGruposORDEM: TFloatField;
    qryGruposGRUPO: TStringField;
    qrySaldosRFGrupo: TwwQuery;
    dsSaldosRFGrupo: TwwDataSource;
    pplSaldosRFGrupo: TppBDEPipeline;
    qrySaldosRFGrupoIDGRUPO: TFloatField;
    qrySaldosRFGrupoNOMEGRUPO: TStringField;
    qrySaldosRFGrupoGRUPO: TStringField;
    qrySaldosRFGrupoSALDOVLR: TFloatField;
    shpDetalhe: TppShape;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    procedure rptSaldosRFGrupoStartPage(Sender: TObject);
    procedure rptSaldosRFGrupoBeforePrint(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelSaldosRFGrp: TDmRelSaldosRFGrp;

implementation

uses dOperComum;

{$R *.DFM}

procedure TDmRelSaldosRFGrp.rptSaldosRFGrupoStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
   shpDetalhe.Brush.Color := clWhite;
end;

procedure TDmRelSaldosRFGrp.rptSaldosRFGrupoBeforePrint(Sender: TObject);
begin
   inherited;
   dtmOperComum.qryEmpresa.Open;
end;

procedure TDmRelSaldosRFGrp.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelSaldosRFGrp.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
  inherited;
  case qrySaldosRFGrupoIDGRUPO.AsInteger of
  1: begin
        srptPlanoPatro.Visible  := True;
        srptClasseTit.Visible   := False;
        srptClasseRisco.Visible := False;
        srptEmissor.Visible     := False;
     end;
  2: begin
        srptPlanoPatro.Visible  := False;
        srptClasseTit.Visible   := True;
        srptClasseRisco.Visible := False;
        srptEmissor.Visible     := False;
     end;
  3: begin
        srptPlanoPatro.Visible  := False;
        srptClasseTit.Visible   := False;
        srptClasseRisco.Visible := True;
        srptEmissor.Visible     := False;
     end;
  4: begin
        srptPlanoPatro.Visible  := False;
        srptClasseTit.Visible   := False;
        srptClasseRisco.Visible := False;
        srptEmissor.Visible     := True;
     end;
  end;
end;

end.
