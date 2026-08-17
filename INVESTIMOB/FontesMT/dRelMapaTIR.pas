unit dRelMapaTIR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, DBClient, ppModule, raCodMod, uCMClientDataSet,
  ppStrtch, ppRegion, ppMemo;
type
  TdtmRelMapaTIR = class(TdtmReports)
    cds: TClientDataSet;
    cdsSEGMENTO: TStringField;
    cdsIMOVEL_MESTRE: TStringField;
    cdsVALOR_CONTABIL: TFloatField;
    cdsULTREAVALIA: TFloatField;
    cdsRECEITA_LIQUIDA_MES: TFloatField;
    cdsRECEITA_LIQUIDA_ANO: TFloatField;
    cdsRENTAB_MES_NOMINAL: TFloatField;
    cdsRENTAB_MES_REAL: TFloatField;
    cdsRENTAB_MES_ATUARIAL: TFloatField;
    cdsRENTAB_ANO_NOMINAL: TFloatField;
    cdsRENTAB_ANO_REAL: TFloatField;
    cdsRENTAB_ANO_ATUARIAL: TFloatField;
    dts: TDataSource;
    dbppln: TppDBPipeline;
    pprpt: TppReport;
    cdsIDIMOVEL: TFloatField;
    cdsORDEM: TFloatField;
    cdsFLGTIPOINTERNO: TStringField;
    cdsIDSEGMENTO: TStringField;
    cdsULTREAVALANOANT: TFloatField;
    cdsULTREAVALMESANT: TFloatField;
    cdsULTREAVAL_NOMINAL: TFloatField;
    cdsULTREAVAL_REAL: TFloatField;
    cdsULTREAVAL_ATUARIAL: TFloatField;
    cdsTotais: TClientDataSet;
    cdsTotaisIDSEGMENTO: TStringField;
    cdsTotaisSEGMENTO: TStringField;
    cdsTotaisRENTAB_MES_NOMINAL: TFloatField;
    cdsTotaisRENTAB_MES_REAL: TFloatField;
    cdsTotaisRENTAB_MES_ATUARIAL: TFloatField;
    cdsTotaisRENTAB_ANO_NOMINAL: TFloatField;
    cdsTotaisRENTAB_ANO_REAL: TFloatField;
    cdsTotaisRENTAB_ANO_ATUARIAL: TFloatField;
    cdsTOTRENTAB_MES_NOMINAL: TFloatField;
    cdsTOTRENTAB_MES_REAL: TFloatField;
    cdsTOTRENTAB_MES_ATUARIAL: TFloatField;
    cdsTOTRENTAB_ANO_NOMINAL: TFloatField;
    cdsTOTRENTAB_ANO_REAL: TFloatField;
    cdsTOTRENTAB_ANO_ATUARIAL: TFloatField;
    cdsORIGEM: TFloatField;
    cdsFINRENTAB_MES_NOMINAL: TFloatField;
    cdsFINRENTAB_MES_REAL: TFloatField;
    cdsFINRENTAB_MES_ATUARIAL: TFloatField;
    cdsFINRENTAB_ANO_NOMINAL: TFloatField;
    cdsFINRENTAB_ANO_REAL: TFloatField;
    cdsFINRENTAB_ANO_ATUARIAL: TFloatField;
    cdsTotaisFINRENTAB_MES_NOMINAL: TFloatField;
    cdsTotaisFINRENTAB_MES_REAL: TFloatField;
    cdsTotaisFINRENTAB_MES_ATUARIAL: TFloatField;
    cdsTotaisFINRENTAB_ANO_NOMINAL: TFloatField;
    cdsTotaisFINRENTAB_ANO_REAL: TFloatField;
    cdsTotaisFINRENTAB_ANO_ATUARIAL: TFloatField;
    pprptResumo: TppReport;
    ppTitleBand2: TppTitleBand;
    ppLabel23: TppLabel;
    ppLine6: TppLine;
    ppLabel26: TppLabel;
    ppLabel29: TppLabel;
    pplblCompetenciaTot: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    pplblTipoSegmentoTot: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    pplblDiaTot: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppLabel40: TppLabel;
    ppLine7: TppLine;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppShape10: TppShape;
    ppLabel45: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppdbtxtRentAtuMesTotalFinal: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppdbtxtRentAtuAnoTotalFinal: TppDBText;
    ppLabel46: TppLabel;
    ppLine9: TppLine;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    pplblRentAtuMesTot2: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    pplblRentAtuAnoTot2: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppdbtxtRentAtuMesTotal: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppdbtxtRentAtuAnoTotal: TppDBText;
    ppLabel30: TppLabel;
    ppLine10: TppLine;
    ppLabel33: TppLabel;
    ppLabel36: TppLabel;
    pplblRentAtuMesTot1: TppLabel;
    ppLabel44: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppShape11: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    pplblRentAtuAnoTot1: TppLabel;
    ppDBText26: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLogotipoResumo: TppImage;
    lblEmpresaResumo: TppLabel;
    pplSistemaResumo: TppLabel;
    ppLine8: TppLine;
    ppLabel15: TppLabel;
    pplblAlienacaoRendaTot: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    cdsTITULO: TStringField;
    ppShape23: TppShape;
    ppHeaderBand1: TppHeaderBand;
    pplblEmpresa: TppLabel;
    ppLabel14: TppLabel;
    ppLine2: TppLine;
    ppLogoTipo: TppImage;
    rgParam: TppRegion;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    pplblCompetencia: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    pplblTipoSegmento: TppLabel;
    ppLabel24: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel25: TppLabel;
    pplblDia: TppLabel;
    pplblAlienacaoRenda: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppsCor: TppShape;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppdbtxtRentAtuAno: TppDBText;
    dbTxtRentMesNominal: TppDBText;
    ppDBText9: TppDBText;
    ppdbtxtRentAtuMes: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    pplblSistema: TppLabel;
    ppLine3: TppLine;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppShape9: TppShape;
    ppLabel9: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppdbtxtRentAtuMesTotFinal: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppdbtxtRentAtuAnoTotFinal: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    pplblRentAtuMes: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    pplblRentAtuAno: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel3: TppLabel;
    ppLabel1: TppLabel;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppLabel2: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText12: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine4: TppLine;
    ppLabel17: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBText7: TppDBText;
    ppDBText10: TppDBText;
    ppdbtxtRentAtuMesTot: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppdbtxtRentAtuAnoTot: TppDBText;
    ppShape8: TppShape;
    ppMemPatroPlano: TppMemo;
    ppMemPatroPlanoTot: TppMemo;
    procedure pprptBeforePrint(Sender: TObject);
    procedure pprptResumoBeforePrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bCorLinha : boolean;
    CorLinha, CorAtual : TColor;
  end;

var
  dtmRelMapaTIR: TdtmRelMapaTIR;

implementation

uses uSistema, uModuloImobiliario;

{$R *.DFM}


procedure TdtmRelMapaTIR.pprptBeforePrint(Sender: TObject);
begin
  inherited;
  // Carrega o Logotipo
  if ModuloImobiliario.InvestImob.bFlgLogoRelat then
       ppLogotipo.Picture := ModuloImobiliario.InvestImob.LogoTipo.Picture
  else ppLogotipo.Picture := nil;
  ppLblEmpresa.Text := Sistema.NomeEmpresa;
  ppLblSistema.Text := Sistema.NomeModulo;
end;

procedure TdtmRelMapaTIR.pprptResumoBeforePrint(Sender: TObject);
begin
  inherited;
  // Carrega o Logotipo
  if ModuloImobiliario.InvestImob.bFlgLogoRelat then
       ppLogotipoResumo.Picture := ModuloImobiliario.InvestImob.LogoTipo.Picture
  else ppLogotipoResumo.Picture := nil;
  lblEmpresaResumo.Text := Sistema.NomeEmpresa;
  pplSistemaResumo.Text := Sistema.NomeModulo;
end;

procedure TdtmRelMapaTIR.ppsCorPrint(Sender: TObject);
begin
   inherited;
   if bCorLinha then begin
      if CorAtual = clWhite then begin
         CorAtual := CorLinha;
      end else begin
         CorAtual := clWhite;
      end;
   end else begin
      CorAtual := clWhite;
   end;
   (Sender as TppShape).Brush.Color := CorAtual;
end;

end.
