unit DRelFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppRegion, ppModule, raCodMod, ppSubRpt,
  Grids, DBGrids, myChkBox, uCtrlContratoImovel, UComunsImobiliarioDB,
  uCMClientDataSet, ppParameter;


type
  TdtmRelFinanc = class(TdtmReports)
    qryContrato: TwwQuery;
    dsContrato: TwwDataSource;
    pplContato: TppBDEPipeline;
    rpContrato: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppLine6: TppLine;
    ppLabel17: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppRegion1: TppRegion;
    ppLabel31: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel32: TppLabel;
    ppDBText20: TppDBText;
    ppLabel37: TppLabel;
    ppDBText25: TppDBText;
    ppLabel38: TppLabel;
    ppDBText26: TppDBText;
    ppLabel39: TppLabel;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    qryExtrato: TwwQuery;
    dsExtrato: TwwDataSource;
    pplExtrato: TppBDEPipeline;
    rpExtrato: TppReport;
    qryExtratoIDPARCFINANCIMOV: TFloatField;
    qryExtratoIDCONDPAGIMOVEL: TFloatField;
    qryExtratoIDCONTRATOIMOVEL: TFloatField;
    qryExtratoCONNUMERO: TStringField;
    qryExtratoCONNOME: TStringField;
    qryExtratoCONDATAINICIO: TDateTimeField;
    qryExtratoRAZAOSOCIAL: TStringField;
    qryExtratoNOMEMESTRE: TStringField;
    qryExtratoCODDOCUMENTO: TFloatField;
    qryExtratoPLNCODIGO: TFloatField;
    qryExtratoNUMPARCELA: TStringField;
    qryExtratoDATAVENCIMENTO: TDateTimeField;
    qryExtratoVLRJUROS: TFloatField;
    qryExtratoVLRAMORTIZACAO: TFloatField;
    qryExtratoVLRSALDODEVEDOR: TFloatField;
    qryExtratoVLRPRESTATUALIZADA: TFloatField;
    qryExtratoVLRRESIDUO: TFloatField;
    qryExtratoVLRRESIDUOATUALI: TFloatField;
    qryExtratoVLRCORRIGIDOATRASO: TFloatField;
    qryExtratoVLRMULTAATRASO: TFloatField;
    qryExtratoVLRMORAATRASO: TFloatField;
    qryExtratoFLGTIPOLANC: TFloatField;
    qryExtratoDATAPAGAMENTO: TDateTimeField;
    qryExtratoVLRPAGO: TFloatField;
    qryExtratoCAL_TIPO: TStringField;
    qryExtratoVLRDIF: TFloatField;
    qryExtratoVLRPROPOSTA: TFloatField;
    qryInadSin: TwwQuery;
    dsInadSin: TwwDataSource;
    pplInadSin: TppBDEPipeline;
    rpInadSin: TppReport;
    ppHeaderBand5: TppHeaderBand;
    pplTitInadSin: TppLabel;
    ppLabel68: TppLabel;
    ppLine11: TppLine;
    ppDetailBand4: TppDetailBand;
    ppdbDet0: TppDBText;
    ppDBText54: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine9: TppLine;
    ppLabel70: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppGroup5: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    pplDet0: TppLabel;
    ppLabel88: TppLabel;
    ppLine10: TppLine;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppLabel72: TppLabel;
    ppDBCalc2: TppDBCalc;
    qryInadAna: TwwQuery;
    dsInadAna: TwwDataSource;
    pplInadAna: TppBDEPipeline;
    rpInadAna: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppTituloInadAna: TppLabel;
    ppLabel74: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText50: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine12: TppLine;
    ppLabel75: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    ppGroup6: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppdbComprador2: TppDBText;
    pplComprador2: TppLabel;
    pplGrupo2: TppLabel;
    ppdbGrupo2: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLine13: TppLine;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLine14: TppLine;
    ppLabel77: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppSummaryBand2: TppSummaryBand;
    ppLabel82: TppLabel;
    ppDBCalc4: TppDBCalc;
    qryImovAli: TwwQuery;
    dsImovAli: TwwDataSource;
    pplImovAli: TppBDEPipeline;
    rpImovAli: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel64: TppLabel;
    ppLabel73: TppLabel;
    ppLine15: TppLine;
    ppLabel76: TppLabel;
    pplComprador3: TppLabel;
    ppLabel80: TppLabel;
    ppLabel84: TppLabel;
    ppLine16: TppLine;
    ppDetailBand6: TppDetailBand;
    ppdbComprador3: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine17: TppLine;
    ppLabel85: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    ppLabel89: TppLabel;
    ppDBText62: TppDBText;
    pplnSeparador: TppLine;
    ppsCor: TppShape;
    ppsCor2: TppShape;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel96: TppLabel;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    pplSeparador4: TppLine;
    ppsCor4: TppShape;
    ppLabel79: TppLabel;
    ppDBText52: TppDBText;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand7: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppLabel86: TppLabel;
    ppLabel97: TppLabel;
    ppDBText66: TppDBText;
    ppLabel98: TppLabel;
    ppDBText67: TppDBText;
    ppLabel103: TppLabel;
    ppLabel105: TppLabel;
    ppDBText68: TppDBText;
    ppLabel106: TppLabel;
    ppDBText69: TppDBText;
    qryCondPag: TwwQuery;
    dsCondPag: TwwDataSource;
    pplCondPag: TppBDEPipeline;
    ppDBText21: TppDBText;
    ppLabel18: TppLabel;
    ppDBText22: TppDBText;
    ppLabel19: TppLabel;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppGroup7: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLine19: TppLine;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLine20: TppLine;
    ppLabel30: TppLabel;
    ppLabel33: TppLabel;
    qryExtratoIDCIDADES: TFloatField;
    qryExtratoIDPAIS: TFloatField;
    qryExtratoCODESTADO: TStringField;
    qryExtratoVLRPRESTACAO: TFloatField;
    qryExtratoFLGRESIDUOINCORP: TStringField;
    ppLabel40: TppLabel;
    ppDBText42: TppDBText;
    qryExtratoVLRCORRIG: TFloatField;
    qryListaContratos: TwwQuery;
    qryListaCondPag: TwwQuery;
    dsListaContratos: TwwDataSource;
    dsListaCondPag: TwwDataSource;
    pplListaContratos: TppBDEPipeline;
    pplListaCondPag: TppBDEPipeline;
    rpListaContratos: TppReport;
    ppHeaderBand8: TppHeaderBand;
    pplTitulo: TppLabel;
    ppLabel53: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppDBText75: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine7: TppLine;
    ppLabel54: TppLabel;
    ppSystemVariable15: TppSystemVariable;
    ppSystemVariable16: TppSystemVariable;
    ppGroup9: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppLabel55: TppLabel;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppGroup10: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel69: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppGroup11: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppLine18: TppLine;
    ppLabel118: TppLabel;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppLabel56: TppLabel;
    ppDBText82: TppDBText;
    ppLabel60: TppLabel;
    ppDBText83: TppDBText;
    ppLabel65: TppLabel;
    ppDBText84: TppDBText;
    ppLabel66: TppLabel;
    ppDBText44: TppDBText;
    ppDBText51: TppDBText;
    ppLabel71: TppLabel;
    ppDBText53: TppDBText;
    ppLabel78: TppLabel;
    ppDBText70: TppDBText;
    ppLabel81: TppLabel;
    ppDBText71: TppDBText;
    ppLabel83: TppLabel;
    ppDBText72: TppDBText;
    ppLabel87: TppLabel;
    ppDBText73: TppDBText;
    ppLabel92: TppLabel;
    ppDBText74: TppDBText;
    ppLabel108: TppLabel;
    ppDBText76: TppDBText;
    ppLabel109: TppLabel;
    ppDBText77: TppDBText;
    ppLine21: TppLine;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    qryExtratoFLGLANCINTEGRA: TFloatField;
    qryExtratoCAL_ABONO: TStringField;
    qryExtratoFLGCONCILIADO: TStringField;
    qryExtratoIDREPACTUA: TFloatField;
    qryExtratoTOT_ALTERADOR: TFloatField;
    qryExtratoTOT_DEVIDO: TFloatField;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    myDBCheckBox3: TmyDBCheckBox;
    ppLabel9: TppLabel;
    myDBCheckBox4: TmyDBCheckBox;
    ppLabel10: TppLabel;
    lblFormaCalculo: TppLabel;
    qryExtratoVLRNOMINAL: TFloatField;
    qryExtratoVLRSALDOATUAL: TFloatField;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppLabel6: TppLabel;
    ppLabel11: TppLabel;
    ppDBText5: TppDBText;
    qryExtratoIDDOCDIVERGE: TStringField;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    qryExtratoDATALIMITE: TDateTimeField;
    qryExtratoVLRRESIDUOCORRIG: TFloatField;
    updExtrato: TUpdateSQL;
    qryExtratoIDCORR_CONDPAG: TFloatField;
    qryExtratoMESREF_CONDPAG: TFloatField;
    qryExtratoTOT_CPMF: TFloatField;
    ppImgLogotipo: TppImage;
    ppLabel15: TppLabel;
    ppDBText78: TppDBText;
    qryExtratoTIPOCONDPAG: TStringField;
    qryExtratoNUMPARCELAS: TFloatField;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppDBText86: TppDBText;
    ppLabel114: TppLabel;
    ppDBText87: TppDBText;
    ppLabel115: TppLabel;
    ppDBText88: TppDBText;
    ppLabel116: TppLabel;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppLabel120: TppLabel;
    ppDBText92: TppDBText;
    ppLabel117: TppLabel;
    ppLabel121: TppLabel;
    ppDBText93: TppDBText;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLabel119: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppDBText91: TppDBText;
    ppDtInadAna: TppLabel;
    updInadAna: TUpdateSQL;
    qryExtratoDATA_CORRECAO: TDateTimeField;
    qryExtratoMESANO_VENCIMENTO: TStringField;
    qryExtratoMESANO_CALCULO: TStringField;
    qryExtratoNUMPARC: TFloatField;
    qryExtratoNUMDOC: TFloatField;
    qryExtratoDATA_BASE: TDateTimeField;
    qryExtratoDATACOBRES: TDateTimeField;
    qryResiduo: TwwQuery;
    qryResiduoIDCONDPAGIMOVEL: TFloatField;
    qryResiduoFLGTIPOLANC: TFloatField;
    qryResiduoVLRRESIDUO: TFloatField;
    qryResiduoDATAVENCIMENTO: TDateTimeField;
    qryResiduoPLNCODIGO: TFloatField;
    qryInadAnaIDPARCFINANCIMOV: TFloatField;
    qryInadAnaIDCONDPAGIMOVEL: TFloatField;
    qryInadAnaIDCONTRATOIMOVEL: TFloatField;
    qryInadAnaCONNUMERO: TStringField;
    qryInadAnaCONNOME: TStringField;
    qryInadAnaNOMECONTRATO: TStringField;
    qryInadAnaRAZAOSOCIAL: TStringField;
    qryInadAnaNUMPARCELA: TStringField;
    qryInadAnaDATAVENCIMENTO: TDateTimeField;
    qryInadAnaVLRPRESTACAO: TFloatField;
    qryInadAnaFLGTIPOLANC: TFloatField;
    qryInadAnaFLGLANCINTEGRA: TFloatField;
    qryInadAnaDATAPAGAMENTO: TDateTimeField;
    qryInadAnaVLRPAGO: TFloatField;
    qryInadAnaDIASDIF: TFloatField;
    qryInadAnaVLRCMATRASO: TFloatField;
    qryInadAnaVLRMULTAATRASO: TFloatField;
    qryInadAnaVLRMORAATRASO: TFloatField;
    qryInadAnaVLRDIF: TFloatField;
    qryInadAnaVLRCMCORRIG: TFloatField;
    qryInadAnaVLRMULTACORRIG: TFloatField;
    qryInadAnaVLRJUROSCORRIG: TFloatField;
    qryInadAnaVLRDEVIDO: TFloatField;
    qryInadAnaCAL_TIPO: TStringField;
    ppParameterList1: TppParameterList;
    ppHeaderBand4: TppHeaderBand;
    ppTituloExtrato: TppLabel;
    ppLabel43: TppLabel;
    ppdbDetalhe: TppDetailBand;
    pplSeparador3: TppLine;
    ppsCor3: TppShape;
    ppDBText32: TppDBText;
    ppdbtVencto: TppDBText;
    ppDBText34: TppDBText;
    ppDBText36: TppDBText;
    ppdbtSaldo: TppDBText;
    ppDBText41: TppDBText;
    ppDBText38: TppDBText;
    ppdbtTipo: TppDBText;
    ppDBText33: TppDBText;
    ppDBText43: TppDBText;
    ppDBText35: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText8: TppDBText;
    ppDBText27: TppDBText;
    ppDBText94: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppSystemVariable7: TppSystemVariable;
    ppLine5: TppLine;
    ppLabel44: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppGroup3: TppGroup;
    ghbExtrato: TppGroupHeaderBand;
    ppRegion3: TppRegion;
    ppLabel45: TppLabel;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppLabel46: TppLabel;
    ppDBText47: TppDBText;
    ppLabel47: TppLabel;
    ppDBText48: TppDBText;
    ppLabel48: TppLabel;
    ppDBText49: TppDBText;
    ppLabel49: TppLabel;
    ppDBText37: TppDBText;
    gfbExtrato: TppGroupFooterBand;
    ppRegion2: TppRegion;
    pplSaldoDev: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    iAtraso: TppVariable;
    ppLabel104: TppLabel;
    iSaldoTot: TppVariable;
    iDiverg: TppVariable;
    iResiduo: TppVariable;
    ppLabel107: TppLabel;
    ppLabel34: TppLabel;
    iAcerto: TppVariable;
    iSD: TppVariable;
    iResiduoAtual: TppVariable;
    ppLabel42: TppLabel;
    iPrestMes: TppVariable;
    ppLabelCorrecaoIncorp: TppLabel;
    CorrecaoIncorporada: TppVariable;
    lblDtLimite: TppLabel;
    relExtratolblDataCorrecao: TppLabel;
    ppGroup4: TppGroup;
    ppghCab: TppGroupHeaderBand;
    ppLine8: TppLine;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel67: TppLabel;
    ppLabel63: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel41: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel124: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    gfbCondPag: TppGroupFooterBand;
    ppRegion4: TppRegion;
    ppLabel26: TppLabel;
    ppDBText79: TppDBText;
    ppLabel52: TppLabel;
    ppLabel110: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBText85: TppDBText;
    vQtdeParcPaga: TppVariable;
    raCodeModule1: TraCodeModule;
    ppGroup12: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppSummaryBand5: TppSummaryBand;
    ppRegion5: TppRegion;
    ppLabel125: TppLabel;
    ppDBCalcVlrVenda: TppDBCalc;
    ppDBCalcVlrContabil: TppDBCalc;
    ppDBCalcVlrResult: TppDBCalc;
    ppRegion6: TppRegion;
    ppDBCalc15: TppDBCalc;
    ppLabel126: TppLabel;
    ppvarDiferenca: TppVariable;
    raCodeModule2: TraCodeModule;
    ppParameterList2: TppParameterList;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    procedure qryExtratoCalcFields(DataSet: TDataSet);
    procedure gfbExtratoAfterPrint(Sender: TObject);
    procedure gfbExtratoBeforePrint(Sender: TObject);
    procedure qryInadAnaCalcFields(DataSet: TDataSet);
    procedure pplnSeparadorPrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure rpListaContratosBeforePrint(Sender: TObject);
    procedure ppDetailBand7BeforePrint(Sender: TObject);
  private
    { Private declarations }
    fTotalResiduo : Double;
    function SomaResiduos(const iContrato : Integer; const dDataLimite : TDateTime) : Double;
  public
    { Public declarations }
    bSeparador, bCorLinha   : boolean;
    CorLinha, CorAtual      : TColor;
    dDataLimite             : TDateTime;
    sTitulo                 : String;
    function MostraParam(Form: string): boolean; Override;
  end;

var
  dtmRelFinanc: TdtmRelFinanc;

implementation

{$R *.DFM}

Uses CRelContrato, DFinanciamento,
     CRelExtrato, CRelInadSin, CRelInadAna, CRelImovAli, DCalcDocumento,
     uCalcDocumento, UFuncoesImob, CRelListaContratos, UFuncAlienacao;

function TdtmRelFinanc.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if (AnsiUpperCase(Form) = 'RELCONTRATO') then
        frm := TRelContrato.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'RELEXTRATO') then
        frm := TRelExtrato.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'RELINADSIN') then
        frm := TRelInadSin.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'RELINADANA') then
        frm := TRelInadAna.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'RELIMOVALI') then
        frm := TRelImovAli.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'RELLISTACONTRATOS') then
        frm := TRelListaContratos.Create(Application)
     else
        frm := nil;

     if frm = nil then
        Result := false
     else begin
        with frm do begin
           Result := (ShowModal = mrOk);
           free;
        end;
     end;
end;

procedure TdtmRelFinanc.qryExtratoCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryExtratoCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryExtratoFLGTIPOLANC.AsInteger,qryExtratoFLGLANCINTEGRA.AsInteger);

  // Define Abono
  if qryExtratoFLGCONCILIADO.AsString = 'S' then begin
     if qryExtratoVLRPAGO.IsNull then begin
        if qryExtratoIDREPACTUA.IsNull then
             qryExtratoCAL_ABONO.AsString := 'Abonado'
        else qryExtratoCAL_ABONO.AsString := 'Repactuado';
     end else begin
        if qryExtratoVLRDIF.AsFloat = 0 then begin
           if (qryExtratoDATAPAGAMENTO.AsDateTime > qryExtratoDATALIMITE.AsDateTime) or
              (qryExtratoVLRPAGO.AsFloat <> qryExtratoVLRPRESTACAO.AsFloat) then begin
              qryExtratoCAL_ABONO.AsString := 'Abono Total';
           end else begin
              qryExtratoCAL_ABONO.AsString := '';
           end;
        end else begin
           if qryExtratoIDDOCDIVERGE.IsNull then begin
              if qryExtratoIDREPACTUA.IsNull then
                   qryExtratoCAL_ABONO.AsString := 'Abonado'
              else qryExtratoCAL_ABONO.AsString := 'Repactuado';
           end else begin
              qryExtratoCAL_ABONO.AsString := 'Cobrança';
           end;
        end;
     end;
  end else if qryExtratoFLGCONCILIADO.AsString = 'P' then begin
     qryExtratoCAL_ABONO.AsString := 'Abono Parcial';
  end else if qryExtratoFLGCONCILIADO.AsString = 'C' then begin
     qryExtratoCAL_ABONO.AsString := 'Cobrança';
  end else begin
     qryExtratoCAL_ABONO.AsString := '';
  end;
end;



procedure TdtmRelFinanc.gfbExtratoAfterPrint(Sender: TObject);
begin
   inherited;
   lblDtLimite.Caption       := DateToStr(dDataLimite);
   iSD.Value                 := 0;
   iAtraso.Value             := 0;
   iDiverg.Value             := 0;
   iAcerto.Value             := 0;
   iResiduo.Value            := 0;
   iSaldoTot.Value           := 0;
   CorrecaoIncorporada.Value := 0;   
end;

procedure TdtmRelFinanc.gfbExtratoBeforePrint(Sender: TObject);
begin
   inherited;
   pplSaldoDev.Caption := 'Saldo Devedor vincendo em ' + DateToStr(dDataLimite);
   iSD.Value           := FuncAlienacao.CalcSaldoDevedor(qryExtratoIDCONTRATOIMOVEL.AsInteger, -1, dDataLimite);
end;

procedure TdtmRelFinanc.qryInadAnaCalcFields(DataSet: TDataSet);
begin
   inherited;
   qryInadAnaCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryInadAnaFLGTIPOLANC.AsInteger,qryInadAnaFLGLANCINTEGRA.AsInteger);
end;

procedure TdtmRelFinanc.pplnSeparadorPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;

procedure TdtmRelFinanc.ppsCorPrint(Sender: TObject);
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


procedure TdtmRelFinanc.rpListaContratosBeforePrint(Sender: TObject);
begin
   inherited;
   pplTitulo.Caption := sTitulo;
end;

procedure TdtmRelFinanc.ppDetailBand7BeforePrint(Sender: TObject);
begin
  inherited;
  lblFormaCalculo.Caption := FuncAlienacao.TipoCalculo(qryCondPag.FieldByName('FORMACALCULO').AsInteger);
end;



function TdtmRelFinanc.SomaResiduos(const iContrato: Integer; const dDataLimite: TDateTime): Double;
begin
   fTotalResiduo := 0;
   qryResiduo.Close;
   qryResiduo.ParamByName('PIDCONTRATO').AsInteger := iContrato;
   qryResiduo.Open;

   while not qryResiduo.eof do
   begin
      if qryResiduoDATAVENCIMENTO.AsDateTime <= dDataLimite then
      begin
         if   qryResiduoFLGTIPOLANC.AsInteger = 1 then fTotalResiduo := 0
         else if not qryResiduoPLNCODIGO.IsNull then
                 fTotalResiduo := fTotalResiduo + qryResiduoVLRRESIDUO.AsFloat;
      end;
      qryResiduo.Next;
   end;
   Result := fTotalResiduo;
end;



end.
