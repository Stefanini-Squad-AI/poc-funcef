//******************************************************************************
// Data      : 14/05/2008
// Código    : AL_6
// Pendencia : 26319
// SOL       : 68708
// Motivo    : Implementação de ajuste na buscar do histórico do Fundo
//******************************************************************************
// Data      : 06/03/2007
// Código    : AL_5
// Pendência : 24640
// Motivo    : Implementado o nome do Plano selecionado no relatório
//******************************************************************************
// Data      : 06/11/2006
// Código    : AL_4
// Pendencia : 22360
// SOL       : 43224
// Motivo    : Implementação da Data no Relatório.
//******************************************************************************
// Data      : 13/01/2006
// Código    : AL_1
// Motivo    : Implementado o filtro por tipo de investimento.
//******************************************************************************

unit FDmRelCarteiraFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosRendaFixa, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, TeEngine, Series,
  ExtCtrls, TeeProcs, Chart, ppChrtDP, ppChrt, ppViewr;

type
  TDmRelCarteiraFundos = class(TDmRelatoriosRendaFixa)
    rptCarteiraFundos: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    srptOperCompr: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    cabOperCompr: TppHeaderBand;
    ppLine4: TppLine;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText6: TppDBText;
    ppLabel10: TppLabel;
    ppDBText7: TppDBText;
    qryCarteiraFundoDet: TwwQuery;
    qryCarteiraFundoDetCODTIPREL: TFloatField;
    qryCarteiraFundoDetTIPOREL: TStringField;
    qryCarteiraFundoDetDESCFUNDOINVEST: TStringField;
    qryCarteiraFundoDetDESCCONTRAPARTE: TStringField;
    qryCarteiraFundoDetCODIGO: TStringField;
    qryCarteiraFundoDetLASTRO: TStringField;
    qryCarteiraFundoDetDATAOPER: TDateTimeField;
    qryCarteiraFundoDetDATACOMPRA: TDateTimeField;
    qryCarteiraFundoDetDATAEMISSAO: TDateTimeField;
    qryCarteiraFundoDetDATAVENCIMENTO: TDateTimeField;
    qryCarteiraFundoDetSTAATIVPASS: TStringField;
    qryCarteiraFundoDetVLRPRINCIPAL: TFloatField;
    qryCarteiraFundoDetQUANTIDADE: TFloatField;
    qryCarteiraFundoDetTAXA: TFloatField;
    qryCarteiraFundoDetINDEXADOR: TStringField;
    qryCarteiraFundoDetPUCOMPRA: TFloatField;
    qryCarteiraFundoDetPUVENCIMENTO: TFloatField;
    qryCarteiraFundoDetVLRFINANCEIRO: TFloatField;
    qryCarteiraFundoDetCUPOMTAXA: TFloatField;
    qryCarteiraFundoDetCODSNDDEBENTURE: TStringField;
    qryCarteiraFundoDetQTDDEBENTURES: TFloatField;
    qryCarteiraFundoDetSTAGARANTIA: TStringField;
    qryCarteiraFundoDetDESCCTRPAROPER: TStringField;
    qryCarteiraFundoDetINDEXADORCTRPAR: TStringField;
    qryCarteiraFundoDetPERCTRPAROPER: TFloatField;
    qryCarteiraFundoDetTAXACTRPAROPER: TFloatField;
    qryCarteiraFundoDetDATARELOPER: TDateTimeField;
    qryCarteiraFundoDetDATAREVEROPER: TDateTimeField;
    qryCarteiraFundoDetDATAMOV: TDateTimeField;
    qryCarteiraFundoDetVLRAJUSTE: TFloatField;
    qryCarteiraFundoDetINDEXADORPASS: TStringField;
    qryCarteiraFundoDetTAXAPASSIVO: TFloatField;
    qryCarteiraFundoDetVLRFINANCPASS: TFloatField;
    qryCarteiraFundoDetINDEXADORATIVO: TStringField;
    qryCarteiraFundoDetTAXAATIVO: TFloatField;
    qryCarteiraFundoDetVLRFINANCATIVO: TFloatField;
    qryCarteiraFundoDetTAXAPASSIVOPRE: TFloatField;
    qryCarteiraFundoDetTAXAATIVOPRE: TFloatField;
    qryCarteiraFundoDetEMISSOR: TStringField;
    qryCarteiraFundoDetDESCCORRETORA: TStringField;
    qryCarteiraFundoDetTIPOCORRETORA: TStringField;
    qryCarteiraFundoDetCNPJCORRETORA: TStringField;
    qryCarteiraFundoDetNUMOPERACAO: TFloatField;
    qryCarteiraFundoDetVLRTABBOVESPA: TFloatField;
    qryCarteiraFundoDetVLRDEVBOVESPA: TFloatField;
    qryCarteiraFundoDetVLREFEPGBOVESPA: TFloatField;
    qryCarteiraFundoDetVLRTABBMF: TFloatField;
    qryCarteiraFundoDetVLRDEVBMF: TFloatField;
    qryCarteiraFundoDetVLREFEPGBMF: TFloatField;
    qryCarteiraFundoDetVLRTABBOLSA: TFloatField;
    qryCarteiraFundoDetVLRDEVBOLSA: TFloatField;
    qryCarteiraFundoDetVLREFEPGBOLSA: TFloatField;
    qryCarteiraFundoDetDESCOUTRASCONTAS: TStringField;
    qryCarteiraFundoDetVLRCONTAS: TFloatField;
    qryCarteiraFundo: TwwQuery;
    qryCarteiraFundoCODTIPREL: TFloatField;
    qryCarteiraFundoTIPOREL: TStringField;
    qryCarteiraFundoTOTAL: TFloatField;
    pplCarteiraFundo: TppBDEPipeline;
    pplCarteiraFundoDet: TppBDEPipeline;
    dsCarteiraFundo: TwwDataSource;
    dsCarteiraFundoDet: TwwDataSource;
    ppGroup2: TppGroup;
    grpTipoRel: TppGroupHeaderBand;
    RodapePrincipal: TppGroupFooterBand;
    shpCarteiraFundoTit: TppShape;
    ppDBText8: TppDBText;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    srptTitulosPrivados: TppSubReport;
    ppChildReport2: TppChildReport;
    cabTitulosPrivados: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLine3: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText17: TppDBText;
    ppLabel19: TppLabel;
    ppDBText18: TppDBText;
    ppLabel20: TppLabel;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLabel21: TppLabel;
    ppDBText21: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText22: TppDBText;
    ppLabel24: TppLabel;
    ppDBText23: TppDBText;
    ppLabel25: TppLabel;
    ppDBText24: TppDBText;
    ppLabel26: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppDBText27: TppDBText;
    ppLabel29: TppLabel;
    ppDBText28: TppDBText;
    ppLabel30: TppLabel;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppDBText31: TppDBText;
    ppLabel33: TppLabel;
    ppDBText32: TppDBText;
    ppLabel34: TppLabel;
    ppDBText33: TppDBText;
    ppLabel35: TppLabel;
    ppDBText34: TppDBText;
    shpOperComprDet: TppShape;
    shpTitulosPrivadosDet: TppShape;
    srptTitulosPublicos: TppSubReport;
    ppChildReport3: TppChildReport;
    cabTitulosPublicos: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    shpTitulosPublicosDet: TppShape;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLine5: TppLine;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel48: TppLabel;
    ppDBText45: TppDBText;
    srptBolsas: TppSubReport;
    ppChildReport4: TppChildReport;
    cabBolsas: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    shpBolsasDet: TppShape;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppLine6: TppLine;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    qryCarteiraFundoDetDESCINVESTIMENTO: TStringField;
    srptSwap: TppSubReport;
    ppChildReport5: TppChildReport;
    cabSwap: TppHeaderBand;
    ppDetailBand6: TppDetailBand;
    shpSwapDet: TppShape;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText55: TppDBText;
    ppDBText58: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppLine7: TppLine;
    ppLabel55: TppLabel;
    ppLabel58: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel63: TppLabel;
    ppDBText59: TppDBText;
    ppDBText68: TppDBText;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppLabel73: TppLabel;
    srptDespesaCorretagem: TppSubReport;
    ppChildReport6: TppChildReport;
    cabDespesaCorretagem: TppHeaderBand;
    ppDetailBand7: TppDetailBand;
    shpDespesaCorretagemDet: TppShape;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText80: TppDBText;
    ppSummaryBand6: TppSummaryBand;
    ppLine8: TppLine;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel83: TppLabel;
    ppLabel79: TppLabel;
    ppDBText76: TppDBText;
    ppLabel80: TppLabel;
    ppDBText77: TppDBText;
    ppLabel81: TppLabel;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppLabel82: TppLabel;
    ppLabel84: TppLabel;
    ppDBText81: TppDBText;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    srptOutrasContas: TppSubReport;
    ppChildReport7: TppChildReport;
    cabOutrasContas: TppHeaderBand;
    ppDetailBand8: TppDetailBand;
    shpOutrasContasDet: TppShape;
    ppDBText86: TppDBText;
    ppDBText91: TppDBText;
    ppSummaryBand7: TppSummaryBand;
    ppLine9: TppLine;
    ppLabel89: TppLabel;
    ppLabel94: TppLabel;
    qryCarteiraFundoDESCFUNDOINVEST: TStringField;
    ppGroup9: TppGroup;
    cabGrpTipoRel: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppDBText16: TppDBText;
    srptGrafico: TppSubReport;
    ppChildReport8: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand9: TppDetailBand;
    ppSummaryBand8: TppSummaryBand;
    ppDPTeeChart1: TppDPTeeChart;
    ppShape2: TppShape;
    ppLabel36: TppLabel;
    ppLabel5: TppLabel;
    ppLabel37: TppLabel;
    pplData: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText1: TppDBText;
    qryCarteiraFundoDetIDFUNDOINVEST: TFloatField;
    qryCarteiraFundoDetPLANPRVCONTABPATRO: TStringField;
    procedure bndSumarioBeforePrint(Sender: TObject);
    procedure rptCarteiraFundosStartPage(Sender: TObject);
    procedure shpOperComprDetPrint(Sender: TObject);
    procedure shpTitulosPrivadosDetPrint(Sender: TObject);
    procedure shpTitulosPublicosDetPrint(Sender: TObject);
    procedure shpBolsasDetPrint(Sender: TObject);
    procedure shpSwapDetPrint(Sender: TObject);
    procedure shpDespesaCorretagemDetPrint(Sender: TObject);
    procedure shpOutrasContasDetPrint(Sender: TObject);
    procedure RodapePrincipalBeforePrint(Sender: TObject);
    procedure RodapePrincipalAfterPrint(Sender: TObject);
    procedure cabGrpTipoRelAfterPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelCarteiraFundos: TDmRelCarteiraFundos;

implementation

{$R *.DFM}

procedure TDmRelCarteiraFundos.cabGrpTipoRelAfterPrint(Sender: TObject);
var sFiltro: String;
begin
  inherited;
  // Filtrar a query e Relatório
  sFiltro := 'DESCFUNDOINVEST = ''' + qryCarteiraFundoDESCFUNDOINVEST.AsString + ''' AND CODTIPREL = ' + qryCarteiraFundoCODTIPREL.AsString;
  qryCarteiraFundoDet.Filter    := sFiltro;
  Case qryCarteiraFundoCODTIPREL.AsInteger of
     1: begin
        srptOperCompr.Visible         := True;
        cabOperCompr.Visible          := True;
        srptTitulosPrivados.Visible   := False;
        srptTitulosPublicos.Visible   := False;
        srptBolsas.Visible            := False;
        srptSwap.Visible              := False;
        srptDespesaCorretagem.Visible := False;
        srptOutrasContas.Visible      := False;
        end;
     2: begin
        srptOperCompr.Visible         := False;
        srptTitulosPrivados.Visible   := True;
        cabTitulosPrivados.Visible    := True;
        srptTitulosPublicos.Visible   := False;
        srptBolsas.Visible            := False;
        srptSwap.Visible              := False;
        srptDespesaCorretagem.Visible := False;
        srptOutrasContas.Visible      := False;
        end;
     3: begin
        srptOperCompr.Visible         := False;
        srptTitulosPrivados.Visible   := False;
        srptTitulosPublicos.Visible   := True;
        cabTitulosPublicos.Visible    := True;
        srptBolsas.Visible            := False;
        srptSwap.Visible              := False;
        srptDespesaCorretagem.Visible := False;
        srptOutrasContas.Visible      := False;
        end;
     4: begin
        srptOperCompr.Visible         := False;
        srptTitulosPrivados.Visible   := False;
        srptTitulosPublicos.Visible   := False;
        srptBolsas.Visible            := True;
        cabBolsas.Visible             := True;
        srptSwap.Visible              := False;
        srptDespesaCorretagem.Visible := False;
        srptOutrasContas.Visible      := False;
        end;
     5: begin
        srptOperCompr.Visible         := False;
        srptTitulosPrivados.Visible   := False;
        srptTitulosPublicos.Visible   := False;
        srptBolsas.Visible            := False;
        srptSwap.Visible              := True;
        cabSwap.Visible               := True;
        srptDespesaCorretagem.Visible := False;
        srptOutrasContas.Visible      := False;
        end;
     6: begin
        srptOperCompr.Visible         := False;
        srptTitulosPrivados.Visible   := False;
        srptTitulosPublicos.Visible   := False;
        srptBolsas.Visible            := False;
        srptSwap.Visible              := False;
        srptDespesaCorretagem.Visible := True;
        cabDespesaCorretagem.Visible  := True;
        srptOutrasContas.Visible      := False;
        end;
     7: begin
        srptOperCompr.Visible         := False;
        srptTitulosPrivados.Visible   := False;
        srptTitulosPublicos.Visible   := False;
        srptBolsas.Visible            := False;
        srptSwap.Visible              := False;
        srptDespesaCorretagem.Visible := False;
        srptOutrasContas.Visible      := True;
        cabOutrasContas.Visible       := True;
        end;
     else
        begin
        srptOperCompr.Visible         := False;
        srptTitulosPrivados.Visible   := False;
        srptTitulosPublicos.Visible   := False;
        srptBolsas.Visible            := False;
        srptSwap.Visible              := False;
        srptDespesaCorretagem.Visible := False;
        srptOutrasContas.Visible      := False;
        qryCarteiraFundoDet.Filter    := 'CODTIPREL = 0';
        end;
  end;
end;


procedure TDmRelCarteiraFundos.bndSumarioBeforePrint(Sender: TObject);
begin
   inherited;
   srptOperCompr.Visible         := False;
   srptTitulosPrivados.Visible   := False;
   srptTitulosPublicos.Visible   := False;
   srptBolsas.Visible            := False;
   srptSwap.Visible              := False;
   srptDespesaCorretagem.Visible := False;
   srptOutrasContas.Visible      := False;
   qryCarteiraFundoDet.Filter    := '';
end;

procedure TDmRelCarteiraFundos.rptCarteiraFundosStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpOperComprDet.Brush.Color := clWhite;
   shpTitulosPrivadosDet.Brush.Color := clWhite;
end;

procedure TDmRelCarteiraFundos.shpOperComprDetPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelCarteiraFundos.shpTitulosPrivadosDetPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelCarteiraFundos.shpTitulosPublicosDetPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelCarteiraFundos.shpBolsasDetPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelCarteiraFundos.shpSwapDetPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelCarteiraFundos.shpDespesaCorretagemDetPrint(
  Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelCarteiraFundos.shpOutrasContasDetPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelCarteiraFundos.RodapePrincipalBeforePrint(
  Sender: TObject);
begin
   inherited;
   qryCarteiraFundoDet.Filter    := 'DESCFUNDOINVEST = ''' + qryCarteiraFundoDESCFUNDOINVEST.AsString + '''';
end;

procedure TDmRelCarteiraFundos.RodapePrincipalAfterPrint(Sender: TObject);
begin
   inherited;
   qryCarteiraFundoDet.Filter    := 'DESCFUNDOINVEST = ''' + qryCarteiraFundoDESCFUNDOINVEST.AsString + ''' AND CODTIPREL = ' + qryCarteiraFundoCODTIPREL.AsString;
end;


end.
