(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/09/2000
*******************************************************************************)

unit dRelCentralAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppMemo,
  ppStrtch, ppSubRpt, ppVar, ppRelatv, ppDBPipe, Grids, DBGrids, ppRichTx,
  uModulo, DBClient, uCMClientDataSet, Provider;

type
  TdtmRelCentralAP = class(TdtmReports)
    ppBDEPipelineServicos: TppBDEPipeline;
    ppReportServicos: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppDetailBand11: TppDetailBand;
    ppDBText53: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppGroup23: TppGroup;
    ppGroupHeaderBand23: TppGroupHeaderBand;
    ppDBText54: TppDBText;
    ppLabel61: TppLabel;
    ppGroupFooterBand23: TppGroupFooterBand;
    ppGroup24: TppGroup;
    ppGroupHeaderBand24: TppGroupHeaderBand;
    ppDBText55: TppDBText;
    ppGroupFooterBand24: TppGroupFooterBand;
    ppReportServicosGroup1: TppGroup;
    ppReportServicosGroupHeaderBand1: TppGroupHeaderBand;
    ppReportServicosDBText1: TppDBText;
    ppReportServicosGroupFooterBand1: TppGroupFooterBand;
    ppGroup26: TppGroup;
    ppGroupHeaderBand26: TppGroupHeaderBand;
    ppDBText57: TppDBText;
    ppGroupFooterBand26: TppGroupFooterBand;
    qryServicos: TwwQuery;
    dtsServicos: TwwDataSource;
    ppReportServicosLine1: TppLine;
    ppReportServicosLabel2: TppLabel;
    ppReportServicosLine2: TppLine;
    ppReportServicosLabel1: TppLabel;
    ppLabel13: TppLabel;
    ppReport1Label3: TppLabel;
    ppBDEPipelineRUB: TppBDEPipeline;
    ppReportRUB: TppReport;
    ppReportRUBLabel5: TppLabel;
    ppReportRUBLabel4: TppLabel;
    ppReportRUBHeaderBand1: TppHeaderBand;
    ppReportRUBDetailBand1: TppDetailBand;
    ppReportRUBDBText5: TppDBText;
    ppReportRUBFooterBand1: TppFooterBand;
    ppReportRUBGroup1: TppGroup;
    ppReportRUBGroupHeaderBand1: TppGroupHeaderBand;
    ppReportRUBDBText1: TppDBText;
    ppReportRUBLabel1: TppLabel;
    ppReportRUBGroupFooterBand1: TppGroupFooterBand;
    ppReportRUBGroup2: TppGroup;
    ppReportRUBGroupHeaderBand2: TppGroupHeaderBand;
    ppReportRUBDBText2: TppDBText;
    ppReportRUBGroupFooterBand2: TppGroupFooterBand;
    ppReportRUBGroup3: TppGroup;
    ppReportRUBGroupHeaderBand3: TppGroupHeaderBand;
    ppReportRUBDBText3: TppDBText;
    ppReportRUBGroupFooterBand3: TppGroupFooterBand;
    ppReportRUBGroup5: TppGroup;
    ppReportRUBGroupHeaderBand5: TppGroupHeaderBand;
    ppReportRUBDBText4: TppDBText;
    ppReportRUBGroupFooterBand5: TppGroupFooterBand;
    qryRUB: TwwQuery;
    dsRUB: TwwDataSource;
    ppReportRUBLabel2: TppLabel;
    ppReportRUBLine1: TppLine;
    ppReportRUBLabel6: TppLabel;
    ppReportRUBLine2: TppLine;
    ppBDEPipelineDoc: TppBDEPipeline;
    ppReportDoc: TppReport;
    ppReportDocHeaderBand1: TppHeaderBand;
    ppReportDocLabel2: TppLabel;
    ppReportDocDetailBand1: TppDetailBand;
    ppReportDocDBText1: TppDBText;
    ppReportDocFooterBand1: TppFooterBand;
    qryDoc: TwwQuery;
    dtsDoc: TwwDataSource;
    ppReportSituacao: TppReport;
    ppReport1Label1: TppLabel;
    ppReport1HeaderBand1: TppHeaderBand;
    ppReport1Label2: TppLabel;
    ppReport1DetailBand1: TppDetailBand;
    ppReport1DBText1: TppDBText;
    ppReport1FooterBand1: TppFooterBand;
    ppReportDocLine1: TppLine;
    ppReportDocLabel4: TppLabel;
    ppReportDocLabel5: TppLabel;
    ppReportDocLabel6: TppLabel;
    ppReportDocLine3: TppLine;
    ppReportSituacaoLabel1: TppLabel;
    ppReportSituacaoLine1: TppLine;
    ppReportSituacaoLine2: TppLine;
    ppReportSituacaoLabel2: TppLabel;
    qryRelEst: TwwQuery;
    dsRelEst: TwwDataSource;
    ppRelEst: TppBDEPipeline;
    ppHistAtend: TppBDEPipeline;
    dsHistAtend: TwwDataSource;
    qryHistAtend: TwwQuery;
    rpHistAtend: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLabel68: TppLabel;
    ppLine35: TppLine;
    ppLabel69: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppFooterBand13: TppFooterBand;
    ppLine36: TppLine;
    ppLabel112: TppLabel;
    rpHistAtendLabel1: TppLabel;
    rpHistAtendDBText1: TppDBText;
    rpHistAtendLabel2: TppLabel;
    rpHistAtendDBText2: TppDBText;
    rpHistAtendLabel3: TppLabel;
    rpHistAtendDBText3: TppDBText;
    rpHistAtendLabel4: TppLabel;
    rpHistAtendDBText4: TppDBText;
    rpHistAtendLabel5: TppLabel;
    rpHistAtendDBText5: TppDBText;
    rpHistAtendLabel6: TppLabel;
    rpHistAtendDBText6: TppDBText;
    rpHistAtendLabel7: TppLabel;
    rpHistAtendLabel8: TppLabel;
    rpHistAtendLabel9: TppLabel;
    rpHistAtendLabel11: TppLabel;
    rpHistAtendLabel12: TppLabel;
    rpHistAtendLabel13: TppLabel;
    rpHistAtendLabel14: TppLabel;
    rpHistAtendLine1: TppLine;
    rpHistAtendDBText7: TppDBText;
    rpHistAtendDBText8: TppDBText;
    rpHistAtendDBText9: TppDBText;
    rpHistAtendDBText11: TppDBText;
    rpHistAtendDBText12: TppDBText;
    rpHistAtendDBText13: TppDBText;
    rpHistAtendDBText14: TppDBText;
    rpHistAtendLabel15: TppLabel;
    rpHistAtendDBCalc1: TppDBCalc;
    QryAssuntoxAtend: TwwQuery;
    QryAssuntoxAtendNOME: TStringField;
    QryAssuntoxAtendIDPROCESSO: TFloatField;
    QryAssuntoxAtendIDRUB: TFloatField;
    QryAssuntoxAtendIDATEND: TFloatField;
    DsAssuntoxAtend: TwwDataSource;
    PpyAssuntoxAtend: TppBDEPipeline;
    rpHistAtendSubReport1: TppSubReport;
    rpHistAtendChildReport1DetailBand1: TppDetailBand;
    rpHistAtendChildReport1DBText1: TppDBText;
    rpHistAtendChildReport1DBText2: TppDBText;
    rpHistAtendChildReport1DBText3: TppDBText;
    rpHistAtendChildReport1DBText4: TppDBText;
    rpHistAtendChildReport1DBText5: TppDBText;
    rpHistAtendChildReport1DBMemo1: TppDBMemo;
    rpHistAtendChildReport1Label2: TppLabel;
    rpHistAtendChildReport1Label3: TppLabel;
    rpHistAtendChildReport1Label4: TppLabel;
    rpHistAtendChildReport1Label5: TppLabel;
    rpHistAtendChildReport1Label6: TppLabel;
    rpHistAtendChildReport1HeaderBand1: TppHeaderBand;
    qryHistAtendIDATEND: TFloatField;
    qryHistAtendCODATEND: TFloatField;
    qryHistAtendPATRO: TStringField;
    qryHistAtendPLANO: TStringField;
    qryHistAtendTITULAR: TStringField;
    qryHistAtendMATRICULA: TStringField;
    qryHistAtendCPF: TStringField;
    qryHistAtendINSCRICAONUMERO: TFloatField;
    qryHistAtendNOMESOLICITANTE: TStringField;
    qryHistAtendTELSOLICITANTE: TStringField;
    qryHistAtendCODATENDENTE: TStringField;
    qryHistAtendSTATUS: TStringField;
    qryHistAtendTIPO: TStringField;
    qryHistAtendDATAINICIO: TDateTimeField;
    qryHistAtendDATA: TDateTimeField;
    qryHistAtendNOMEUSUARIO: TStringField;
    qryHistAtendOBSERVACAO: TStringField;
    QryAssuntoxAtendDESCRESPATEN: TMemoField;
    ppReportServicosCalc1: TppSystemVariable;
    ppReportServicosCalc2: TppSystemVariable;
    ppReportSituacaoCalc1: TppSystemVariable;
    ppReportSituacaoCalc2: TppSystemVariable;
    ppCalc25: TppSystemVariable;
    ppCalc26: TppSystemVariable;
    ppReportDocCalc1: TppSystemVariable;
    ppReportDocCalc2: TppSystemVariable;
    ppReportRUBCalc1: TppSystemVariable;
    ppReportRUBCalc2: TppSystemVariable;
    QryAssuntoxAtendEXISTERAD: TFloatField;
    QryAssuntoxAtendEXISTERUB: TFloatField;
    qrysituacao: TwwQuery;
    dssituacao: TwwDataSource;
    ppsituacao: TppBDEPipeline;
    ppDBPipelRubsPendentes: TppDBPipeline;
    QryRelaRubsPendentes: TwwQuery;
    QryRelaRubsPendentesIDRUBS: TFloatField;
    QryRelaRubsPendentesMATRICULA: TStringField;
    QryRelaRubsPendentesIDPESSOA: TFloatField;
    QryRelaRubsPendentesNOME: TStringField;
    QryRelaRubsPendentesSERVICO_BENEFICIO: TStringField;
    DSRelaRubsPendentes: TwwDataSource;
    QryRelaRubsPendentesNOMEDOCUMENTO: TStringField;
    ppRelRubsPendentes: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    qryFun: TwwQuery;
    qryFunNOME: TStringField;
    qryFunRAZAOSOCIAL: TStringField;
    qryFunLOGRADOURO: TStringField;
    qryFunNUMERO: TStringField;
    qryFunCOMPLEMENTO: TStringField;
    qryFunBAIRRO: TStringField;
    qryFunCIDADE: TStringField;
    qryFunCODESTADO: TStringField;
    qryFunCEP: TStringField;
    qryFunIMAGEM: TBlobField;
    DSfun: TwwDataSource;
    ppDBPipeFun: TppDBPipeline;
    ppDBImage2: TppDBImage;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLine6: TppLine;
    ppLine8: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText6: TppDBText;
    QryRelaRubsPendentesDESCRICAO: TStringField;
    QryRelaRubsPendentesDDD: TStringField;
    QryRelaRubsPendentesNUMERO: TStringField;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine3: TppLine;
    ppLine4: TppLine;
    QryRelaRubsPendentesDATAMOV: TDateTimeField;
    qryRelaDocsReceb: TwwQuery;
    DSdocsReceb: TwwDataSource;
    ppBDEpDocsReceb: TppBDEPipeline;
    ppRDocsReceb: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLine9: TppLine;
    DsRelaProtocolo: TwwDataSource;
    qryRelaProtocolo: TwwQuery;
    ppBDERelaProtocolo: TppBDEPipeline;
    ppRrelaProtocolo: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppDBText18: TppDBText;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBText19: TppDBText;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppDBText20: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLabel22: TppLabel;
    ppLine10: TppLine;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDBText23: TppDBText;
    ppLabel26: TppLabel;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppDBText26: TppDBText;
    ppDBImage3: TppDBImage;
    ppLabel29: TppLabel;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppLine11: TppLine;
    ppSystemVariable5: TppSystemVariable;
    ppLabel30: TppLabel;
    ppLine12: TppLine;
    ppSystemVariable6: TppSystemVariable;
    ppLine13: TppLine;
    rpRelEst2: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    lblDataInicio: TppLabel;
    lblDataFim: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    pplblTempo: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    rpRelEstlblGrupo: TppLabel;
    ppDBText30: TppDBText;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppLabel47: TppLabel;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBTempoAtendimento: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppLabel48: TppLabel;
    ppDBText39: TppDBText;
    ppLabel49: TppLabel;
    ppDBText40: TppDBText;
    ppLabel50: TppLabel;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppLabel51: TppLabel;
    ppLine17: TppLine;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppDBText43: TppDBText;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLine14: TppLine;
    ppLabel44: TppLabel;
    ppDBText44: TppDBText;
    ppLabel52: TppLabel;
    ppDBText45: TppDBText;
    ppLabel53: TppLabel;
    ppDBText46: TppDBText;
    ppLabel54: TppLabel;
    ppDBText47: TppDBText;
    ppLine15: TppLine;
    LbCidade: TppLabel;
    rpRelEstdbTGrupo: TppDBText;
    ppLine18: TppLine;
    ppLabel55: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel56: TppLabel;
    ppLine19: TppLine;
    LbContador: TppLabel;
    ppLine20: TppLine;
    ppLine16: TppLine;
    qryRelEstIDTITULAR: TFloatField;
    qryRelEstIDATEND: TFloatField;
    qryRelEstCODATEND: TFloatField;
    qryRelEstNOMESOLICITANTE: TStringField;
    qryRelEstTELSOLICITANTE: TStringField;
    qryRelEstCODATENDENTE: TStringField;
    qryRelEstDATA: TDateTimeField;
    qryRelEstSTATUS: TStringField;
    qryRelEstPERGUNTA: TStringField;
    qryRelEstRESPOSTA: TStringField;
    qryRelEstOBSERVACAO: TStringField;
    qryRelEstTIPO: TStringField;
    qryRelEstMATRICULA: TStringField;
    qryRelEstCPF: TStringField;
    qryRelEstTITULAR: TStringField;
    qryRelEstINSCRICAONUMERO: TFloatField;
    qryRelEstPATRO: TStringField;
    qryRelEstPLANO: TStringField;
    qryRelEstNOMEUSUARIO: TStringField;
    qryRelEstDATAINICIO: TDateTimeField;
    qryRelEstDESCLOCALATEND: TStringField;
    qryRelEstNOMEASSUNTO: TStringField;
    qryRelEstSITUACAOPART: TStringField;
    qryRelEstDESCGRUPOASSUNTO: TStringField;
    qryRelEstTEMPOATENDIMENTO: TFloatField;
    qryRelEstIDPROCESSO: TFloatField;
    qryRelEstIDRUB: TFloatField;
    qryRelEstEXISTERAD: TFloatField;
    qryRelEstEXISTERUB: TFloatField;
    qryRelEstDESCRESPATEN: TMemoField;
    qryRelEstNOME: TStringField;
    qryRelEstCIDADE: TStringField;
    ppMemo1: TppMemo;
    qryRelaDocsRecebMATRICULA: TStringField;
    qryRelaDocsRecebNOME: TStringField;
    qryRelaDocsRecebNOMEDOCUMENTO: TStringField;
    qryRelaDocsRecebDATARECEB: TDateTimeField;
    qryRelaDocsRecebNOMEGRUPO: TStringField;
    qryRelaDocsRecebIDGRUPO: TFloatField;
    qryRelaDocsRecebIDRUBS: TFloatField;
    qryRelaDocsRecebBENEFICIOSERVICO: TStringField;
    ppLabel11: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText13: TppDBText;
    ppDBText11: TppDBText;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText29: TppDBText;
    ppLabel17: TppLabel;
    ppLine1: TppLine;
    ppDBText48: TppDBText;
    ppShape1: TppShape;
    ppLabel57: TppLabel;
    ppLabel31: TppLabel;
    ppShape2: TppShape;
    qryRelaDocsRecebOBS: TStringField;
    ppDBMemo1: TppDBMemo;
    ppLabel58: TppLabel;
    qryRelEstTempoFormatado: TStringField;
    ppSummaryBand1: TppSummaryBand;
    ppTempoTotal: TppLabel;
    ppLabel40: TppLabel;
    dsp: TDataSetProvider;
    cdsRelatProtocolo: TCMClientDataSet;
    procedure ppMemo1Print(Sender: TObject);
    procedure qryRelEstCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
  function MostraParam(Form: string): boolean; override;
    { Public declarations }
  end;

var
  dtmRelCentralAP: TdtmRelCentralAP;
  dValorAcumulado, dValorAcumuladoCotas : double;
  dValorCotas ,dValorReal, dValorTotalCotas, dValorTotalReal : double;
  idplanoprev, idpessjur, idpessoa , idtiporeserva : String;
  Primeiro : boolean;
  Linhas, registros, iaux : Integer;
  slblvalant,
  slblvalpos,
  slblcotasant,
  slblcotaspos : String;
  Imprimiu, Fim : boolean;

implementation

uses FParamRelDocServ,FParamRelDocBenef, UAutorizacao,
     USistema,FParamRelHistAtend, FParamRelEst,
     FConfigRelRubs, FFiltroRelaDocs, fFiltroRelaProtocolo;

{$R *.DFM}

function TdtmRelCentralAP.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if UPPERCASE(Form)= 'FRMPARAMRELDOCSERV' then
        frm := TfrmParamRelDocServ.Create(Application)
     else
     if UPPERCASE(Form)= 'FRMPARAMRELDOCBENEF' then
        frm := TfrmParamRelDocBenef.Create(Application)
     else
       if UPPERCASE(Form)= 'FRMPARAMRELEST' then
         frm := TfrmParamRelEst.Create(Application)
     else
       if UPPERCASE(Form)= 'FRMPARAMRELHISTATEND' then
         frm := TfrmParamRelHistAtend.Create(Application)
     else
       if UPPERCASE(Form)= 'FRMCONFIGRELRUBS' then
         frm := TfrmConfigRelRubs.Create(Application)
     else
       if UPPERCASE(Form)= 'FRMFILTRORELADOCS' then
         frm := TFrmFiltroRelaDocs.Create(Application)
     else
       if UPPERCASE(Form)= 'FRMFILTRORELAPROTOCOLO' then
         frm := TFrmFiltroRelaProtocolo.Create(Application)
     else
        frm := nil;

     if frm = nil then
        Result := true
     else
     begin
          with frm do
          begin
               Result := (ShowModal = mrOk);
               free;
          end;
     end;
end;

procedure TdtmRelCentralAP.ppMemo1Print(Sender: TObject);
begin
  inherited;
  try
    ppMemo1.text := copy(qryRelEstDESCRESPATEN.asString, 1, 300);
  except
  end;
end;

procedure TdtmRelCentralAP.qryRelEstCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryRelEstTempoFormatado.AsString := SegundosParaHMS( qryRelEstTEMPOATENDIMENTO.AsInteger );
end;

end.

