unit fLancDocCAPCAR;

interface

uses
  WIndows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadMestreDetCS,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97, uIntegraBack, MAHlpBtn, StdCtrls,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, fTelaAut, TabControlDetalhe, ExtCtrls,
  wwdbloOk, TREdit, wwdbedit, DBCtrls, uDocumento, TB97Tlbr, TB97Ctls, fCadastroCS,
  IvDictio, uCalcDv, IvMulti, IvEMulti, CMProcuraMask, CMProcuraSubTipo, CMDBLookupCombo,
  ppComm, ppProd, ppClass, ppReport, ppTypes, CMProcura, EditReg, wwdbdatetimepicker,
  CMDateTimePicker, Mask, CmEventosCadastro, ImgList;

type
  TContabDoc = record
    Plano, CodSubConta: integer;
    PlaConta, CodCentroCusto: string;
  end;

type
  ELancDocError = exception;
  TfrmLancDocCAPCAR = class(TfrmCadMestreDetalheCS)
    qryTipoRD: TwwQuery;
    updContabil: TUpdateSQL;
    dsContabil: TwwDataSource;
    qryContabil: TwwQuery;
    qryContabilPLACONTA: TstringField;
    qryContabilCODSUBCONTA: TFloatField;
    qryContabilNOME_1: TstringField;
    qryContabilNOME: TstringField;
    qryContabilLACDEBCRE: TstringField;
    qryContabilLACVALOR: TFloatField;
    qryContabilLACVALHIST: TFloatField;
    qryContabilLACHIST1: TstringField;
    qryContabilLACHIST2: TstringField;
    qryContabilLACHIST3: TstringField;
    qryContabilPLNCODIGO: TFloatField;
    qryContabilLACNUMLAN: TFloatField;
    qryContabilHITCODHIST: TstringField;
    qryContabilIDPESSOA: TFloatField;
    qryContabilIDEMPRESA: TFloatField;
    qryContabilIDMODULO: TFloatField;
    qryContabilUNIDNEGOC: TFloatField;
    qryContabilIDUSUARIOINCLUSAO: TFloatField;
    qryContabilCODCENTROCUSTO: TstringField;
    qryContabilPLANO: TFloatField;
    qryContabilLACTIPO: TstringField;
    qryContabilLACNUMDOC: TstringField;
    qryContabilLACHIST4: TstringField;
    qryContabilLACHIST5: TstringField;
    qryContabilLACTIPCONVOFICIAL: TstringField;
    qryContabilLACVALOFICIAL: TFloatField;
    qryContabilLACTIPCONVGER: TstringField;
    qryContabilLACVALGERENCIAL: TFloatField;
    qryContabilLACTIPCONVGEREN1: TstringField;
    qryContabilLACVALGEREN1: TFloatField;
    qryContabilLACTIPCONVGEREN2: TstringField;
    qryContabilLACVALGEREN2: TFloatField;
    qryContabilLACATOUTMOEDA: TstringField;
    qryContabilLACORIGEMAPLIC: TstringField;
    qryContabilTIPCODIGO: TstringField;
    qryContabilIDELEMDEMONSTRAT: TFloatField;
    qryContabilCODCENTROCUSTO_1: TstringField;
    qryCentroRespon: TwwQuery;
    qryCotacaoMoeda: TwwQuery;
    qryMoeda: TwwQuery;
    qryParamContab: TwwQuery;
    qryTipoDoc: TwwQuery;
    qryUnidNegoc: TwwQuery;
    qryCCusto: TwwQuery;
    qryPortForma: TwwQuery;
    qrySubConta: TwwQuery;
    qryAuxTipoRD: TwwQuery;
    lblValorMoeda: TLabel;
    dbeValorMoeda: TRealEdit;
    lblValor: TLabel;
    dbeValorCorrente: TRealEdit;
    tbsContabil: TTabSheet;
    dbgrdContabil: TwwDBGrid;
    pnlContabil: TPanel;
    lblCCusto: TLabel;
    lblAtividade: TLabel;
    lblValorMoedaCon: TLabel;
    lblValorCorrenteCon: TLabel;
    lblSubConta: TLabel;
    dbgDebitoCredito: TDBRadioGroup;
    gbHistorico: TGroupBox;
    dblcCCusto: TwwDBLookupCombo;
    dblcAtividade: TwwDBLookupCombo;
    dblcSubConta: TwwDBLookupCombo;
    sbtnEstornar: TToOlbarButton97;
    lblHistorico: TLabel;
    dbeHistorico: TwwDBEdit;
    dblcMoeda: TwwDBLookupCombo;
    lblMoeda: TLabel;
    gbDatas: TGroupBox;
    lblData: TLabel;
    dbeDataLanc: TCMDateTimePicker;
    lblEmissao: TLabel;
    dbeDataEmi: TCMDateTimePicker;
    dbeDataVenc: TCMDateTimePicker;
    lblVencimento: TLabel;
    dbeDataProgr: TCMDateTimePicker;
    lblProgramada: TLabel;
    dblcPortadorForma: TwwDBLookupCombo;
    lblPortadorForma: TLabel;
    gbOutros: TGroupBox;
    cbEnglobParc: TCheckBox;
    cbLancaBaixa: TCheckBox;
    cbIntegra: TCheckBox;
    dbeCompl: TwwDBEdit;
    lblNumDoc: TLabel;
    lblBarra: TLabel;
    qryDet: TwwQuery;
    qryDetCODDOCUMENTO: TFloatField;
    qryDetCODTIPRECDES: TstringField;
    qryDetRECPAG: TstringField;
    qryDetIDPESSOA: TFloatField;
    qryDetCODCENTRORESPON: TstringField;
    qryDetUNIDNEGOC: TFloatField;
    qryDetMOECODIGO: TFloatField;
    qryDetVALOR: TFloatField;
    qryDetVALOROUTRAMOEDA: TFloatField;
    qryDetIDUSUARIOINCLUSAO: TFloatField;
    qryDetNOME: TstringField;
    qryDetNOME_1: TstringField;
    qryDetCODCENTROCUSTO: TstringField;
    qryDetDESCRICAO: TstringField;
    qryDetMOESIGLA: TstringField;
    dblcTipoDoc: TwwDBLookupCombo;
    lblTipoDocum: TLabel;
    updDet: TUpdateSQL;
    qryAuxFuncao: TwwQuery;
    qryParamGlobal: TwwQuery;
    qryAux: TwwQuery;
    lblNumChBordero: TLabel;
    tbsLancamento: TTabSheet;
    dbgLancamentos: TwwDBGrid;
    qryLancamento: TwwQuery;
    dsLancamento: TwwDataSource;
    qryLancamentoCODDOCUMENTO: TFloatField;
    qryLancamentoNUMLANCTO: TFloatField;
    qryLancamentoCODALTERADOR: TFloatField;
    qryLancamentoPLNCODIGO: TFloatField;
    qryLancamentoDATALANCTO: TDateTimeField;
    qryLancamentoVALOR: TFloatField;
    qryLancamentoVALOROUTRAMOEDA: TFloatField;
    qryLancamentoDEBCRE: TstringField;
    qryLancamentoOPERACAO: TstringField;
    qryLancamentoHISTORICOCOMPL: TstringField;
    qryLancamentoIDUSUARIOINCLUSAO: TFloatField;
    qryLancamentoESTORNO: TFloatField;
    qryLancamentoCODDOCUMENTO_1: TFloatField;
    qryLancamentoNUMLANCTO_1: TFloatField;
    qryLancamentoIDUSUARIOINCLUSAO_1: TFloatField;
    qryLancamentoCODLANCFINANC: TFloatField;
    qryLancamentoCODPORTFORMA: TFloatField;
    qryLancamentoNUMLOTE: TFloatField;
    qryLancamentoNUMCHQBORDERO: TstringField;
    qryLancamentoDATACFLOAT: TDateTimeField;
    QryCotMoeda: TwwQuery;
    TbsAlteradores: TTabSheet;
    PnlAlteradores: TPanel;
    qryAlt: TwwQuery;
    QryAuxAlteradores: TwwQuery;
    lblModulo: TLabel;
    QryTipOper: TwwQuery;
    dbenNumDoc: TDBRealEdit;
    dbenChBordero: TDBRealEdit;
    qryCotacaoMoedaMOECODIGO: TFloatField;
    qryCotacaoMoedaCOTVALOR: TFloatField;
    qryCotacaoMoedaMOEDESC: TstringField;
    qryCotacaoMoedaMOESIGLA: TstringField;
    qryUnidNegocUNIDNEGOC: TFloatField;
    qryUnidNegocNOME: TstringField;
    qryUnidNegocUNECODIGO: TstringField;
    qryUnidNegocUNETIPO: TstringField;
    qryCentroResponCODCENTRORESPON: TstringField;
    qryCentroResponNOME: TstringField;
    qryCentroResponANALITICOSINTET: TstringField;
    CContabil: TCMProcuraMaskContabil;
    reValorCorrenteCon: TDBRealEdit;
    reValorMoedaCon: TDBRealEdit;
    CmpForCli: TCMProcuraForCli;
    Bevel1: TBevel;
    qryCentroResponCODCENTROCUSTO: TstringField;
    LblMesmaData: TLabel;
    Bevel3: TBevel;
    ScrollBox1: TScrollBox;
    dbeHist1: TwwDBEdit;
    dbeHist2: TwwDBEdit;
    dbeHist3: TwwDBEdit;
    dbeHist4: TwwDBEdit;
    dbHist5: TwwDBEdit;
    qryDetIDRESERVAORCAMEN: TFloatField;
    TbsGeral: TTabSheet;
    GpBarras: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    LblFormaPag: TLabel;
    DblCodForma: TwwDBLookupCombo;
    qryFormaPag: TwwQuery;
    qryFormaPagCODFORMA: TFloatField;
    qryFormaPagRECPAG: TStringField;
    qryFormaPagDESCRICAO: TStringField;
    DbeBarras: TwwDBEdit;
    DbeLInhaDigit: TwwDBEdit;
    GpConta: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    DbEdtConta: TwwDBEdit;
    DbEdtBanco: TwwDBEdit;
    DbEdtAgencia: TwwDBEdit;
    DBText1: TDBText;
    LblSubContaCli: TLabel;
    CmbSubConta: TwwDBLookupCombo;
    qrySubContaForCli: TwwQuery;
    qrySubContaCODSUBCONTA: TFloatField;
    qrySubContaNOMESUBCONTA: TstringField;
    qrySubContaForCliCODSUBCONTA: TFloatField;
    qrySubContaForCliNOMESUBCONTA: TstringField;
    qryCODDOCUMENTO: TFloatField;
    qryCODPORTFORMA: TFloatField;
    qryCODSUBCONTA: TFloatField;
    qryIDPESSOA: TFloatField;
    qryPLANO: TFloatField;
    qryPLACONTA: TstringField;
    qryMOECODIGO: TFloatField;
    qryNUMSLIP: TstringField;
    qryEMISBLOQ: TstringField;
    qryCODCENTROCUSTO: TstringField;
    qryIDFORCLI: TFloatField;
    qryIDMODULO: TFloatField;
    qryCODTIPDOC: TFloatField;
    qryRECPAG: TstringField;
    qryNODOCUMENTO: TFloatField;
    qryCOMPLDOCUMENTO: TstringField;
    qryDATAEMISSAO: TDateTimeField;
    qryDATAVENCTO: TDateTimeField;
    qryDATAPROGRAMADA: TDateTimeField;
    qrySTATUS: TstringField;
    qryNUMFATURA: TFloatField;
    qryOPERACAO: TstringField;
    qryIDUSUARIOINCLUSAO: TFloatField;
    qryNUMLANCTO: TFloatField;
    qryCODALTERADOR: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryDATALANCTO: TDateTimeField;
    qryVALOR: TFloatField;
    qryVALOROUTRAMOEDA: TFloatField;
    qryESTORNO: TFloatField;
    qryDEBCRE: TstringField;
    qryHISTORICOCOMPL: TstringField;
    qryCODLANCFINANC: TFloatField;
    qryNUMLOTE: TFloatField;
    qryNUMCHQBORDERO: TstringField;
    qryDATACFLOAT: TDateTimeField;
    qryNOME: TstringField;
    qryCODFORMA: TFloatField;
    qryNUMLEITCODBARRAS: TstringField;
    qryNUMDIGCODBARRAS: TstringField;
    qryCentroCusto: TwwQuery;
    qryCentroCustoCODCENTROCUSTO: TStringField;
    qryCentroCustoNOME: TStringField;
    qryBuscaCalcImposto: TwwQuery;
    BtnStatus: TToOlbarButton97;
    qryNUMFATURA_1: TstringField;
    qryFLGTIPOFATURA: TstringField;
    DbeNoDocumento: TwwDBEdit;
    qryTipoDocCODTIPDOC: TFloatField;
    qryTipoDocDESCRICAO: TstringField;
    qryTipoDocDEBCRE: TstringField;
    qryTipoDocFLGENGLOBAPARCELA: TstringField;
    Label7: TLabel;
    DbeValorLiquido: TRealEdit;
    qryVLRLIQUIDO: TFloatField;
    qryTipoDocFLGGERANUMDOC: TstringField;
    qryTipoDocFLGDOCFISCAL: TstringField;
    qryDetIDRATEIODOCUM: TFloatField;
    qryPortFormaCODPORTFORMA: TFloatField;
    qryPortFormaCODCENTROCUSTO: TstringField;
    qryPortFormaPLANO: TFloatField;
    qryPortFormaPLACONTA: TstringField;
    qryPortFormaLANCAFINANC: TstringField;
    qryPortFormaDMAIS: TFloatField;
    qryPortFormaDESCRICAO: TstringField;
    qryPortFormaCODARQUIVOREMESSA: TFloatField;
    qryPortFormaCODFORMAPAGTO: TFloatField;
    qryMoedaMOECODIGO: TFloatField;
    qryMoedaMOEDESC: TstringField;
    qryMoedaMOESIGLA: TstringField;
    qryNOMEMODULO: TstringField;
    DBText2: TDBText;
    qryAltCODALTERADOR: TFloatField;
    qryAltDESCRICAO: TstringField;
    qryAltACRESDECRES: TstringField;
    qryAltCONVERTE: TstringField;
    qryAltPLANO: TFloatField;
    qryAltPLACONTA: TstringField;
    qryAltCODCENTROCUSTO: TstringField;
    qryUNIDNEGOC2: TFloatField;
    qryValida: TwwQuery;
    qryValidaPLACONTA: TStringField;
    qryREFERENCIA: TstringField;
    qryOBS: TMemoField;
    Label8: TLabel;
    Dbereferencia: TwwDBEdit;
    Label9: TLabel;
    MemObs: TDBMemo;
    qryNUMAPGR: TFloatField;
    qryOLDAPGR: TFloatField;
    qryDetNOMECENTROCUSTO: TstringField;
    qryContabilPLANOME: TstringField;
    ImlDocs: TImageList;
    Label10: TLabel;
    DBText3: TDBText;
    qryNOMEUSUARIO: TstringField;
    qryDetPLACONTACREDITO: TstringField;
    PnlRateioGeral: TPanel;
    lblUnidNegoc: TLabel;
    lblCentroRespon: TLabel;
    lblTipoRD: TLabel;
    Label6: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    dblcCentroRespon: TwwDBLookupCombo;
    dblcTipoRD: TwwDBLookupCombo;
    CmbCentCusto: TwwDBLookupCombo;
    PageRateioPrev: TPageControl;
    TbsRateioGeral: TTabSheet;
    TbsPrevidencia: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    EdtImovel: TwwDBEdit;
    CmbPlano: TCMDBLookupCombo;
    CmbPatro: TCMDBLookupCombo;
    qryPlanoPrev: TwwQuery;
    qryPatroPrev: TwwQuery;
    qryProgramaPrev: TwwQuery;
    qryProgramaPrevIDPROGRAMA: TFloatField;
    qryProgramaPrevCODPROGRAMA: TStringField;
    qryProgramaPrevDESCPROGRAMA: TStringField;
    qryPatroPrevIDPESSOA: TFloatField;
    qryPatroPrevNOME: TStringField;
    qryDetPLANO: TFloatField;
    qryDetIDPATRO: TFloatField;
    qryDetIDPROGRAMA: TFloatField;
    qryDetNOMEPATRO: TstringField;
    qryDetDESCPLANO: TstringField;
    qryDetDESCPROGRAMA: TstringField;
    qryDetNUMIMOVEL: TstringField;
    qryCentroCustoSTATUSGRUPOCDC: TStringField;
    qryDetHITCODHIST: TstringField;
    qryPlanoPrevIDPLANOPREV: TFloatField;
    qryPlanoPrevNOME: TStringField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetNUMRESERVA: TFloatField;
    qryDetFLGOBRIGARESERVA: TstringField;
    qryDetNUMRESERVAOLD: TFloatField;
    qryDetVALORRESERVAOLD: TFloatField;
    qryRateioOrcamento: TwwQuery;
    qryRateioOrcamentoVALORRESERVA: TFloatField;
    qryRateioOrcamentoIDRESERVAORCAMEN: TFloatField;
    qryUpdOrcamem: TwwQuery;
    qryTipoRDCODTIPRECDES: TstringField;
    qryTipoRDRECPAG: TstringField;
    qryTipoRDPLACONTACREDITO: TstringField;
    qryTipoRDPLANO: TFloatField;
    qryTipoRDPLACONTA: TstringField;
    qryTipoRDDESCRICAO: TstringField;
    qryTipoRDANASINT: TstringField;
    qryTipoRDFLGOBRIGARESERVA: TstringField;
    qryTipoRDFLGCALCULAIMPOSTO: TstringField;
    qryTipoRDHITCODHIST: TstringField;
    qryContabilIDPLANOPREV: TFloatField;
    qryContabilIDPATRO: TFloatField;
    qryContabilNOMEPATRO: TstringField;
    qryContabilDESCPLANO: TstringField;
    BtnBuscaContaCor: TSpeedButton;
    qryIDCBANCARIA: TFloatField;
    qryDESCTIPOCONTA: TstringField;
    qryNUMBANCO: TstringField;
    qryNUMAGENCIA: TstringField;
    qryTIPOCONTA: TstringField;
    qryCONTACORRENTE: TstringField;
    GpDotorc: TPanel;
    SpeedButton1: TSpeedButton;
    ReResorc: TDBRealEdit;
    Label17: TLabel;
    PnlPrograma: TPanel;
    Label13: TLabel;
    CmbPrograma: TCMDBLookupCombo;
    edMoedaDet: TEdit;
    lblMoedaDet: TLabel;
    dbeValorMoedaDet: TRealEdit;
    lblValorOutDet: TLabel;
    dbeValorDet: TRealEdit;
    lblValorDet: TLabel;
    qryCentroCustoIDPROGRAMA: TFloatField;
    GrdAlteradores: TwwDBGrid;
    updAlteradores: TUpdateSQL;
    qryAlteradores: TwwQuery;
    dsAlteradores: TwwDataSource;
    lblAlterador: TLabel;
    lblValOut: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    EdtHist: TDBEdit;
    DtLancto: TCMDateTimePicker;
    DbROutraMoeda: TDBRealEdit;
    DbrValor: TDBRealEdit;
    dblkAlterador: TwwDBLookupCombo;
    DbrValLiquido: TDBRealEdit;
    DclAtivProjeto: TwwDBLookupCombo;
    qryAlteradoresDESCRICAO: TStringField;
    qryAlteradoresDATALANCTO: TDateTimeField;
    qryAlteradoresVALOROUTRAMOEDA: TFloatField;
    qryAlteradoresVALOR: TFloatField;
    qryAlteradoresHISTORICOCOMPL: TStringField;
    qryAlteradoresDEBCRE: TStringField;
    qryAlteradoresVLRLIQUIDO: TFloatField;
    qryAlteradoresUNIDNEGOC: TFloatField;
    qryAlteradoresIDPESSOA: TFloatField;
    qryAlteradoresNOME: TStringField;
    qryAlteradoresCODALTERADOR: TFloatField;
    qryAlteradoresCONTABILIZA: TStringField;
    CkbContabiliza: TDBCheckBox;
    qryDetVLRRESORCAMEN: TFloatField;
    EdtAutorizaAlteracao: TEditReg;
    PnlAp: TPanel;
    LblNumAp: TLabel;
    EdtNumAp: TwwDBEdit;
    BtnNumApgr: TSpeedButton;
    MsResORc: TMontaSelect;
    sbtnAlternarTipoDoc: TToolbarButton97;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure dbeValorMoedaExit(Sender: TObject);
    procedure dbeValorMoedaDetExit(Sender: TObject);
    procedure dblcUnidNegocExit(Sender: TObject);
    procedure dblcCCustoEnter(Sender: TObject);
    procedure reValorMoedaConExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnEstornarClick(Sender: TObject);
    procedure dblcMoedaExit(Sender: TObject);
    procedure dbeDataVencExit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dbeValorCorrenteChange(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dsLancamentoDataChange(Sender: TObject; Field: TField);
    procedure cbLancaBaixaClick(Sender: TObject);
    procedure CContabilExit(Sender: TObject);
    procedure CmpForCliEnter(Sender: TObject);
    procedure CmpForCliExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcTipoRDCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ReResorcExit(Sender: TObject);
    procedure dblcCentroResponExit(Sender: TObject);
    procedure DbeNoDocumentoExit(Sender: TObject);
    procedure dblcTipoDocExit(Sender: TObject);
    procedure dbeDataEmiExit(Sender: TObject);
    procedure BtnNumApgrClick(Sender: TObject);
    procedure dbeValorCorrenteExit(Sender: TObject);
    procedure CContabilApertouBotao(Sender: TObject);
    procedure CmbProgramaExit(Sender: TObject);
    procedure CmbPlanoExit(Sender: TObject);
    procedure CmbPatroExit(Sender: TObject);
    procedure CmbCentCustoExit(Sender: TObject);
    procedure dblcTipoRDExit(Sender: TObject);
    procedure CmbCentCustoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: boolean);
    procedure dblcCentroResponCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: boolean);
    procedure dblcUnidNegocCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: boolean);
    procedure CmpForCliApertouBotao(Sender: TObject);
    procedure CmbProgramaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: boolean);
    procedure CmbPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: boolean);
    procedure CmbPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: boolean);
    procedure BtnBuscaContaCorClick(Sender: TObject);
    procedure DclAtivProjetoExit(Sender: TObject);
    procedure dblkAlteradorExit(Sender: TObject);
    procedure DbrValorExit(Sender: TObject);
    procedure qryAlteradoresAfterInsert(DataSet: TDataSet);
    procedure PageRateioPrevChange(Sender: TObject);
    procedure pgctrlDetalheEnter(Sender: TObject);
    procedure cbEnglobParcClick(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnAlternarTipoDocClick(Sender: TObject);
  private
    IdForCliAdianto,
    rValorRateioComCompromisso,
    rValorComprometidoReserva: real;
    bValida: boolean;
    sContaCliFor,
    sContaContabil,
    sCentroCusto,
    sNomeCentroCusto,
    sNomeUnidNegoc,
    sDebCre,
    sTipoDC,
    sCCustoCliFor: string;
    iSubConta,
    iUnidNegoc: integer;
    rValorCorrente,
    rValorMoeda,
    rValorEdit,
    rValorCotacao: real;
    sHist1,
    sHist2,
    sHist3,
    sHist4,
    sHist5: string;
    sNomeCentroRespon,
    sCodCentroRespon: string;
    iModulo,
    iCodLancContab,
    iCodTipDoc,
    iSubContaCliFor,
    splano: LongInt;
    sDataLancamento: string;
    iCodLancFInanc,
    liEmpresa,
    iPlnCodigoP,
    iPlnCodigoOri,
    iNumLancto,
    iNumFatura,
    iMoeCodigo,
    liRetFuncao,
    liexercicio,
    liPeriodo,
    iPlnCodigo: integer;
    bMoveTab, bIntegraChecked: boolean;
    sStatus,
    sOperacao,
    cCCustd,
    cContad,
    ssubconta,
    cCCustc,
    cContac,
    ssubcontacre,
    sUnidNegoc: string;
    rValHistDed,
    rValHistCre: real;
    ContabDoc :TContabDoc;
    ativproj,
    cccusto,
    tpdesmb,
    crespom: string;
    fIdPlanoPrev,
    fIdPatro,
    iPatroDet,
    iPlanoPrevDet: real;
    sNomePlanoPrev,
    sNomePatro: string;
    idcidade,
    idpais: integer;
    codestado: string[3];
    function  BuscaNomeConta(sPlaconta: string; iPlano: integer): string;
    procedure MontaCentroDeCusto;
    procedure ExibeStatusDoc(bBaixado: boolean);
    procedure LancaAlteradores;
    procedure FazContabilizacao;
    procedure SelecionaFilhos;
    procedure FazerInsertContab;
//    procedure ExecutaPrevAdianto;
    procedure IncluiContabilidade;
    function  FazerQryPrIncipal: boolean;
    function  ConfereSaldo(iCodDocumento: integer; bVerificaLanc: boolean): boolean;
    function  VerificaParcelas(sNumFatura: string): boolean;
    function  IntegraorcamentoBack(NumReserva: integer; rValor: Real): boolean;
    function  ObrigaSubconta(sContaContabil: string): boolean;
    procedure SetaCentResponDesemb(iNumReserva: LongInt; bLimpa: boolean);
    procedure SetaEnglobaParcela;
    procedure AtualizaSaldo;
    function  CalcValAlteradores: double;
    procedure RegularizaPrevisao;
    procedure RegularizaAdiantamento;
    procedure Atualizaorcamento;
    procedure setaplanopatroglobal;
    function  TestaAlterador: boolean;
  public
    iCodLancCAPCAR: integer;
    sOldDataLancamento: string;
  end;

var
  frmLancDocCAPCAR: TfrmLancDocCAPCAR;

implementation

{$R *.DFM}

uses uCMTypes, uMensErro, uDataBase, dBaseDados, uAutorizacao, uSistema, uFuncaoGeral,
  uFuncoesUteisRH, uIea, uLancContab, uLancFinanc, uModulo, {FEstornoCAPCAR, FRegPrevAdianto,}
  uOrcamento, {FAgrupaDoc,} uImpostoRetido, uAvaliForn, uString, dReports,
  fMostraRelat, dDadosBancarios, uDiasUteis{, DCapCar};

procedure TfrmLancDocCAPCAR.CmeCadastroInsert(Sender: TObject);
begin
  IdForCliAdianto := 0;
  if (qry.Active) then
    qry.Close;

  if not(qry.Prepared) then
    qry.Prepare;

  qry.ParamByname('CODDOCUMENTO').asFloat := -1;
  qry.Open;

  inherited;

  PnlAp.Enabled := true;
  ExibeStatusDoc(false);
  bIntegraChecked := false;
  SetaCentResponDesemb(-1, true);
  cbLancaBaixa.Checked := false;
  cbLancaBaixaClick(Self);
  pnlMestre.Enabled := true;
  dbenChBordero.Enabled := false;
  lblNumChBordero.Enabled := false;
  cbEnglobParc.Checked := false;
  cbLancaBaixa.Checked := false;

  cbIntegra.Checked := (Modulo.PrevEfet <> 'E');

  iCodLancCAPCAR := 0;
  iCodLancContab := 0;
  SelecionaFilhos;
  qryDATALANCTO.asString := sDataLancamento;
  qryDATAEMISSAO.asString := sDataLancamento;
  qryDATAVENCTO.asString := sDataLancamento;
  qryDATAPROGRAMADA.asString := sDataLancamento;
  dbeDataLanc.Date := qryDATALANCTO.AsDateTime;
  dbeDataEmi.Date := qryDATAEMISSAO.AsDateTime;
  dbeDataVenc.Date := qryDATAVENCTO.AsDateTime;
  dbeDataProgr.Date := qryDATAPROGRAMADA.AsDateTime;
  dbeValorMoeda.Value := 0;
  dbeValorCorrente.Value := 0;
  DbeValorLiquido.Value := 0;
  dbeValorMoeda.Enabled := false;
  dbeValorCorrente.Enabled := true;
  qryCODTIPDOC.asInteger := iCodTipDoc;
  qryIDMODULO.asInteger := Sistema.IdModulo;
  qryIDUSUARIOINCLUSAO.asInteger := Sistema.IdUsuario;

  if (CmpForCli.CanFocus) then
    CmpForCli.SetFocus;

  if (Modulo.PrevEfet = 'A') then
    qryCODTIPDOC.asInteger := Modulo.CodAForne;

  ReResorc.Value := 0;
  SetaEnglobaParcela;
  with (qryAlteradores) do
  begin
    if (Active) then
    begin
      if (UpdatesPending) then
        CancelUpdates;
      Close;
    end;
    Open;
  end;
end;

procedure TfrmLancDocCAPCAR.CmeCadastroConfirma(Sender: TObject);
var
  iCodPortForma: integer;
  bExiste: boolean;
  // rValorImposto: Double;
  dtm: TdtmReports;
  rpt: TppReport;
  iPlnCodigoAd: integer;
  fCodRateio: double;
  sUpdRateio: string;
begin
  liEmpresa := Sistema.IdEmpresa;
  sStatus := '';
  iPlnCodigo := 0;
  iNumFatura := 0;
  iNumLancto := 0;
  if Modulo.PrevEfet = 'P' then 
  begin
    if not cbEnglobParc.Checked then
      sOperacao:='12'
    else
      sOperacao:='11';
  end
  else
    if Modulo.PrevEfet = 'A' then
    begin
      //if (cbLancaBaixa.Checked) then
      //begin
      //   sOperacao := '15';
      //   sStatus   := '2';
      //end
      //else
      sOperacao:='14';
    end
    else
    begin
      if not cbEnglobParc.Checked then
        sOperacao:='2'
      else
        sOperacao:='1';
      if cbLancaBaixa.Checked then
      begin
        sOperacao:='10';
        sStatus:='2';
      end;
    end;
  if CmeCadastro.Operacao = opInserir then
  begin
    try
      StartTransacao;
      iCodLancCAPCAR := 0;
      iPlnCodigoOri := 0;
      IncluiContabilidade;
      if iPlnCodigo = -1 then
        raise ELancDocError.Create('Não Foi Possível Contabilizar Documento.');
      iCodLancCAPCAR := Documento.GetCodigo(nil);
      if iCodLancCAPCAR <= 0 then
        raise ELancDocError.Create('Não Foi Possível Gerar CodDocumento.');
      if qryMOECODIGO.asInteger <> 0 then
        iMoeCodigo := qryMOECODIGO.asInteger
      else
        iMoeCodigo := -1;
      if dblcPortadorForma.Text <> '' then
        iCodPortForma := qryCODPORTFORMA.asInteger
      else
        iCodPortForma := -1;
      Documento.Obs := qryOBS.asString;
      Documento.Referencia := qryREFERENCIA.asString;
      Documento.IdContaBancaria := qryIdCBancaria.asInteger;
      if (not qryNUMAPGR.IsNull) and
         (not Documento.ValidaNumApGr(qryNUMAPGR.asInteger)) then
        raise EDataBaseError.Create(LblNumAp.Caption+' '+qryNUMAPGR.asString+
                                    ' já existe, favor Informar outro');
      Documento.NumApg := qryNUMAPGR.asInteger;
      Documento.Inserir(
        qryAuxFuncao,
        iCodLancCAPCAR,
        IntToStr(Sistema.IdModulo),
        InttoStr(sPlano),
        sContaCliFor,
        sCCustoCliFor,
        iMoeCodigo,
        StrtoInt(CmpForCli.ForCliReg.UnidNegoc),
        liEmpresa,qryIDFORCLI.asInteger,
        qryCODTIPDOC.asInteger,
        iCodPortForma,
        IntegraBack.RecPag,
        qryNODOCUMENTO.asFloat,
        qryCOMPLDOCUMENTO.asString,
        qryDATAEMISSAO.asString,
        qryDATAVENCTO.asString,
        qryDATAPROGRAMADA.asString,
        sStatus,
        iNumFatura,
        sOperacao,
        Sistema.IdUsuario,
        iSubContaCliFor,
        qryCODFORMA.asInteger,
        qryNUMLEITCODBARRAS.asString,
        qryNUMDIGCODBARRAS.asString,
        false,
        -1,-1,-1);
      iNumLancto := Documento.GerarNumLancto(nil, iCodLancCAPCAR);
      qryCODDOCUMENTO.asInteger := iCodLancCAPCAR;
      if iNumLancto <= 0 then
        raise ELancDocError.Create('Não Foi Possível Gerar NumLancto.');
      if iPlnCodigo > 0 then
        iPlnCodigoP := iPlnCodigo
      else
        iPlnCodigoP := -1;
      if IntegraBack.MascaraNoDocum <> '' then
      begin
        Documento.TipoFaturaLancto := qryCOMPLDOCUMENTO.asString;
        Documento.NumFaturaLancto  := qryNUMFATURA_1.asString;
        Documento.CodTipDoc        := qryCODTIPDOC.asInteger;
      end;
      Documento.Valorliquido := qryVLRLIQUIDO.asFloat;
      Documento.CriarLanctoDoc(
        qryAuxFuncao,
        iCodLancCAPCAR,
        iNumLancto,
        -1,
        iPlnCodigoP,
        qryDATALANCTO.asString,
        qryVALOR.asFloat,
        qryVALOROUTRAMOEDA.asFloat,
        -1,
        qryTipoDocDEBCRE.asString,
        sOperacao,
        qryHISTORICOCOMPL.asString,
        Sistema.idUsuario,
        false,
        -1,
        '');
        qryDet.First;
        //rValorImposto := 0;
      while (not qryDet.EOF) do
      begin
        //if (qryTipoRDFLGCALCULAIMPOSTO.asString = 'S') then
        //rValorImposto := rValorImposto + qrydetVALOR.asFloat;
        fCodRateio :=
          Documento.Rateio.Inserir(
            iCodLancCAPCAR,
            qryDetCodTipRecDes.asString,
            IntegraBack.RecPag,
            qryDetCodCentroRespon.asString,
            liEmpresa,
            qryDetVALOR.asFloat,
            qryDetVALOROUTRAMOEDA.asFloat,
            Sistema.IdUsuario,
            qryDetUnidNegoc.asInteger,
            qryDetIdReservaorcamen.asInteger,
            qryDetCODCENTROCUSTO.asString,
            qryDetIDPATRO.asFloat,
            qryDetIDPROGRAMA.asFloat,
            qryDetIDPLANOPREV.asFloat);

        qryDet.Edit;
        qryDetIDRATEIODOCUM.asFloat :=  fCodRateio;
        qryDet.Post;

        //DF 06/07 Gustavo
        //Gravação de Plano, PatrocInadora, Programa, NumImovel no RateioDocum
        if (not qryDetNUMIMOVEL.IsNull) then
        begin
          sUpdRateio :=
            'UPDATE '+
              'RATEIODOCUM '+
            'SET '+
              'NUMIMOVEL = ''' + qryDetNUMIMOVEL.asString +''''+' '+
            'WHERE '+
              'IDRATEIODOCUM = ' + FloatToStr(fCodRateio);
          if not ExecutarQuery(DtmBaseDados.Qry, sUpdRateio) then
            ELancDocError.Create('Erro ao atualizar "Número do Imóvel" ao lançar rateio de documento');
        end;
        //Fim DF 06/07 Gustavo
        qryDet.Next;
      end;

      //Lança e baixa para adiantamentos passa o 14 para o 15 e contabiliza a baixa
      if ((cbLancaBaixa.Checked) and (sOperacao = '14')) then
      begin
        iPlnCodigoAd := 0;
        Documento.CriarLanctoDoc(
          qryAuxFuncao,
          iCodLancCAPCAR,
          iNumLancto,
          -1,
          iPlnCodigoAd,
          qryDATALANCTO.asString,
          qryVALOR.asFloat,
          qryVALOROUTRAMOEDA.asFloat,
          -1,
          qryTipoDocDEBCRE.asString,
          '15',
          qryHISTORICOCOMPL.asString,
          Sistema.idUsuario,
          (IntegraBack.Contabilidade = 'S'),
          StrToInt(dblcPortadorForma.LookupValue),
          dbenChBordero.Text);

        Documento.baixa_adiantamento(DtmBaseDados.Qry,iCodLancCAPCAR,-1,qryDATALANCTO.asString);
      end;

      //Lança e Baixa
      if (sOperacao = '10') or ((Modulo.PrevEfet = 'A') and (cbLancaBaixa.Checked)) then
      begin
        iCodLancFInanc := 0;
        if qryPortFormaLANCAFINANC.asString = 'S' then
        begin
          if qryDEBCRE.asString = 'D' then
            qryDEBCRE.asString := 'C'
          else
            qryDEBCRE.asString := 'D';

          LancFInanc.FazerRateioCAPCAR(
            qry,
            'N',
            qryNUMCHQBORDERO.asString,
            qryDATACFLOAT.asString,
            IntegraBack.RecPag,
            0,
            qryCODPORTFORMA.asInteger,
            iCodLancFInanc);

          if not (Qry.State in [DsEdit,DsInsert]) then
            Qry.Edit;

          if qryDEBCRE.asString = 'D' then
            qryDEBCRE.asString := 'C'
          else
            qryDEBCRE.asString := 'D';

          if iCodLancFInanc = -1 then
            raise ELancDocError.Create('Não Foi Possível Lançar Documento no FInanceiro.');
        end;
        if iCodLancFInanc = 0 then
          iCodLancFInanc := -1;

        Documento.RecbToPagto.Inserir(
          qryAuxFuncao,
          iCodLancCAPCAR,
          iNumLancto,
          Sistema.idUsuario,
          iCodLancFInanc,
          qryCODPORTFORMA.asInteger,
          -1,
          qryNUMCHQBORDERO.asString,
          qryDATACFLOAT.asString,
          QryDATALANCTO.asString);
      end;

      LancaAlteradores;

      if (Modulo.PrevEfet = 'E') and
        {(rValorImposto > 0) and}
         (sOperacao <> '10') then
      begin
        ImpostoRetido.DataProgramada    := qryDATAPROGRAMADA.AsDateTime;
        ImpostoRetido.OperacaoDocumento := sOperacao;
        ImpostoRetido.IdForCli          := qryIDFORCLI.asInteger;
        ImpostoRetido.CodDocumento      := iCodLancCAPCAR;
        ImpostoRetido.NumLancto         := iNumLancto;
        ImpostoRetido.ValorLancto       := qryVALOR.asFloat;
        ImpostoRetido.ValorLiquido      := 0;
        ImpostoRetido.DataLancto        := qryDATALANCTO.AsDateTime;
        ImpostoRetido.DataEmissao       := qryDATAEMISSAO.AsDateTime;
        ImpostoRetido.DebCre            := qryTipoDocDEBCRE.asString;
        ImpostoRetido.MomentoLancamento := mlLancamento;
        ImpostoRetido.CodTipoDoc        := qryCODTIPDOC.asInteger;
        ImpostoRetido.Incluir;
      end;

      {
        RJ 27/07 Gustavo
        if Modulo.PrevEfet = 'E' then ExecutaPrevAdianto;
        A regularização do adiantamento passou a ser efetuada no Início do lançamento
        Fim RJ 27/07 Gustavo
      }

      if ((Modulo.PrevEfet =  'E') or
          (Modulo.PrevEfet =  'A')) then
      begin
        if Modulo.PrevEfet = 'E' then 
        begin
          RegularizaPrevisao;
          RegularizaAdiantamento;
        end;
        Atualizaorcamento;
        QryDet.First;
        while not QryDet.Eof do
        begin
          IntegraorcamentoBack(QryDetNumReserva.asInteger, QryDetValor.asFloat);
          QryDet.Next;
        end;
        QryDet.Next;
      end;

      CommiTTransacao;

      if ((Modulo.PrevEfet = 'E') or (Modulo.PrevEfet = 'P')) and 
          (cbEnglobParc.Checked) and
          (Application.MessageBox('Deseja Parcelar este documento agora ?',
                                  'Atenção',
                                  Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
      begin
{        AbrirForm(frmAgrupaDoc, TfrmAgrupaDoc, false); //ECF
        if Modulo.PrevEfet = 'E' then
          frmAgrupaDoc.MudaAgrupaTela('D')
        else
          frmAgrupaDoc.MudaAgrupaTela('L');
        frmAgrupaDoc.SetaParcelaDoc(
          QryDATALANCTO.asString,
          QryDATAEMISSAO.asString,
          QryCODTIPDOC.asString,
          QryCODPORTFORMA.asString,
          QryNODOCUMENTO.asString,
          QryDATAVENCTO.asString,
          QryIDFORCLI.asString,
          CmpForCli.ForCliReg.RazaoSocial,
          sContaCliFor,
          IntToStr(iSubContaCliFor),
          QryCODDOCUMENTO.asString,
          sCentroCusto,
          QryCODFORMA.asInteger,
          qryCOMPLDOCUMENTO.asString);  }
      end;

      if IntegraBack.RecPag = 'P' then
      begin
        AvaliForn.IdForCli     := QryIDFORCLI.asInteger;
        AvaliForn.IdPessoa     := Sistema.IdEmpresa;
        AvaliForn.RazaoSocial  := CmpForCli.ForCliReg.RazaoSocial;
        AvaliForn.CodDocumento := QryCODDOCUMENTO.asString;
        AvaliForn.NumDocumento := FuncaoGeral.Decode(QryCOMPLDOCUMENTO.asString,'',
                                  QryNODOCUMENTO.asString,
                                  QryNODOCUMENTO.asString + '/' +
                                  QryCOMPLDOCUMENTO.asString);
        AvaliForn.RecPag       := IntegraBack.RecPag;
        AvaliForn.Executar;
      end;

    except
      RollBackTransacao;
      MsgDlg('Inclusão Não Efetuada','Erro',mtError,[mbOk],0);
      raise;
      Exit;
    end;
  end;

  if CmeCadastro.Operacao = Opalterar then
  begin
    try
      StartTransacao;
      iPlnCodigoOri:=qryPLNCODIGO.asInteger;
      if QryContabil.UpdatesPendIng then
        IncluiContabilidade
      else
        iPlnCodigo := iPlnCodigoOri;
      if IntegraBack.Contabilidade = 'S' then
      begin
        qryContabil.First;
        bExiste := false;
        while not qryContabil.Eof do
        begin
          if (ContabDoc.PLANO = qryContabilPLANO.asInteger) and
             (ContabDoc.CODSUBCONTA = qryContabilCODSUBCONTA.asInteger) and
             (ContabDoc.PLACONTA = Trim(qryContabilPLACONTA.asString)) and
             (ContabDoc.CODCENTROCUSTO = Trim(qryContabilCODCENTROCUSTO.asString)) and
             (Trim(qryTipoDocDEBCRE.asString) = Trim(qryContabilLACDEBCRE.asString)) then
          begin
            bExiste := true;
            Break;
          end
          else
            qryContabil.Next;
        end;

        if not bExiste then
        begin
          ContabDoc.PLANO          := splano;
          ContabDoc.CODSUBCONTA    := iSubContaCliFor;
          ContabDoc.PLACONTA       := sContaCliFor;
          ContabDoc.CODCENTROCUSTO := sCCustoCliFor;
        end;
      end;

      if iPlnCodigo = -1 then
        raise ELancDocError.Create('Não Foi Possível Contabilizar Documento.');

      if qryMOECODIGO.asInteger <> 0 then
        iMoeCodigo := qryMOECODIGO.asInteger
      else
        iMoeCodigo := -1;

      Documento.Obs        := qryOBS.asString;
      Documento.Referencia := qryREFERENCIA.asString;
      Documento.IdContaBancaria := qryIdCBancaria.asInteger;

      if (not qryNUMAPGR.IsNull) and
         (qryOLDAPGR.asInteger <> qryNUMAPGR.asInteger) and
         (not Documento.ValidaNumApGr(qryNUMAPGR.asInteger)) then
        raise EDataBaseError.Create(LblNumAp.Caption + ' ' + qryNUMAPGR.asString +' já existe, favor Informar outro');

      Documento.NumApg     := qryNUMAPGR.asInteger;
      Documento.Alterar(
        qryAuxFuncao,
        iCodLancCAPCAR,
        iMoeCodigo,
        liEmpresa,
        qryIDFORCLI.asInteger,
        qryCODTIPDOC.asInteger,
        qryCODPORTFORMA.asInteger,
        qryDATAEMISSAO.asString,
        qryDATAVENCTO.asString,
        qryDATAPROGRAMADA.asString,
        sStatus,
        qryNUMFATURA.asInteger,
        qryNUMSLIP.asString,
        qryEMISBLOQ.asString,
        qryCODFORMA.asInteger,
        qryNUMLEITCODBARRAS.asString,
        qryNUMDIGCODBARRAS.asString,
        IntegraBack.RecPag,
        -1,-1,-1,
        ContabDoc.PLANO,
        ContabDoc.CODSUBCONTA,
        ContabDoc.PLACONTA,
        ContabDoc.CODCENTROCUSTO,
        sOperacao);

      if iCodLancCAPCAR = -1 then
      begin
        iCodLancCAPCAR:=qryCODDOCUMENTO.asInteger;
        raise ELancDocError.Create('Não Foi Possível Alterar Documento.');
      end;

      iCodLancContab:=iPlnCodigo;

      if iPlnCodigo > 0 then
        iPlnCodigoP:=iPlnCodigo
      else
        iPlnCodigoP:=-1;

      if IntegraBack.MascaraNoDocum <> '' then
      begin
        Documento.TipoFaturaLancto := qryCOMPLDOCUMENTO.asString;
        Documento.NumFaturaLancto  := qryNUMFATURA_1.asString;
        Documento.CodTipDoc        := qryCODTIPDOC.asInteger;
      end;

      Documento.Valorliquido := qryVLRLIQUIDO.asFloat;
      Documento.AlterarLanctoDoc(
        qryAuxFuncao,
        iCodLancCAPCAR,
        qryNUMLANCTO.asInteger,
        -1,
        iPlnCodigoP,
        qryDATALANCTO.asString,
        qryVALOR.asFloat,
        qryVALOROUTRAMOEDA.asFloat,
        -1,
        qryTipoDocDEBCRE.asString,
        qryHISTORICOCOMPL.asString,
        sOperacao,
        false,
        -1,
        '');

      if (Modulo.PrevEfet =  'E') and
         (sOperacao <> '10') then
      begin
        ImpostoRetido.OperacaoDocumento := sOperacao;
        ImpostoRetido.CodDocumento      := iCodLancCAPCAR;
        ImpostoRetido.NumLancto         := 0;
        ImpostoRetido.ValorLancto       := qryVALOR.asFloat;
        ImpostoRetido.ValorLiquido      := qryVLRLIQUIDO.asFloat;
        ImpostoRetido.DebCre            := qryTipoDocDEBCRE.asString;
        ImpostoRetido.Alterar;
      end;

      Documento.Rateio.Excluir(iCodLancCAPCAR,'','',0);
      qryDet.First;

      if (Modulo.PrevEfet = 'A') then 
        Documento.Cancelabaixa_adiantamento(DtmBaseDados.Qry, iCodLancCAPCAR,
                                            QryNumLancto.asInteger);

      while (not qryDet.EOF) do
      begin
        fCodRateio :=
          Documento.Rateio.Inserir(
            iCodLancCAPCAR,
            qryDetCodTipRecDes.asString,
            IntegraBack.RecPag,
            qryDetCodCentroRespon.asString,
            liEmpresa,
            qryDetVALOR.asFloat,
            qryDetVALOROUTRAMOEDA.asFloat,
            Sistema.IdUsuario,
            qryDetUnidNegoc.asInteger,
            qryDetIdReservaorcamen.asInteger,
            qryDetCODCENTROCUSTO.asString,
            qryDetIDPATRO.asFloat,
            qryDetIDPROGRAMA.asFloat,
            qryDetIDPLANOPREV.asFloat);

        qryDet.Edit;
        qryDetIDRATEIODOCUM.asFloat :=  fCodRateio;
        qryDet.Post;

        //DF 06/07 Gustavo
        //Gravação de Plano, PatrocInadora, Programa, NumImovel no RateioDocum
        if (not qryDetNUMIMOVEL.IsNull) then
        begin
          sUpdRateio :=
            'UPDATE '+
              'RATEIODOCUM '+
            'SET '+
              'NUMIMOVEL = ''' + qryDetNUMIMOVEL.asString + ''' '+' '+
            'WHERE '+
              'IDRATEIODOCUM = ' + FloatToStr(fCodRateio);

          if not ExecutarQuery(DtmBaseDados.Qry,sUpdRateio) then
            ELancDocError.Create('Erro ao atualizar "Número do Imóvel" ao lançar rateio de documento');
        end;
        //Fim DF 06/07 Gustavo
        qryDet.Next;
      end;

      iCodLancFInanc:=qryCODLANCFINANC.asInteger;

      Documento.RecbToPagto.Excluir(qryAuxFuncao,iCodLancCAPCAR,qryNUMLANCTO.asInteger);

      if qryCODLANCFINANC.asInteger <> 0 then
        LancFInanc.ExcluiFinanceiro(iCodLancFInanc);

      //Lança e baixa para adiantamentos passa o 14 para o 15 e contabiliza a baixa
      if ((cbLancaBaixa.Checked) and (sOperacao = '14')) then
      begin
        iPlnCodigoAd := 0;
        Documento.CriarLanctoDoc(
          qryAuxFuncao,
          iCodLancCAPCAR,
          iNumLancto,
          -1,
          iPlnCodigoAd,
          qryDATALANCTO.asString,
          qryVALOR.asFloat,
          qryVALOROUTRAMOEDA.asFloat,
          -1,
          qryTipoDocDEBCRE.asString,
          '15',
          qryHISTORICOCOMPL.asString,
          Sistema.idUsuario,
          (IntegraBack.Contabilidade = 'S'),
          StrToInt(dblcPortadorForma.LookupValue),
          dbenChBordero.Text);

        Documento.baixa_adiantamento(DtmBaseDados.Qry,iCodLancCAPCAR,-1,qryDATALANCTO.asString);
      end;

      //Lança e Baixa Simultânea
      if (sOperacao = '10') or ((Modulo.PrevEfet = 'A') and (cbLancaBaixa.Checked)) then
      begin
        iCodLancFInanc:=0;
        if qryPortFormaLANCAFINANC.asString = 'S' then
        begin
          if qryDEBCRE.asString = 'D' then
            qryDEBCRE.asString := 'C'
          else
            qryDEBCRE.asString := 'D';

          qryOPERACAO.asString := sOperacao;

          LancFInanc.FazerRateioCAPCAR(
            qry,
            'N',
            qryNUMCHQBORDERO.asString,
            qryDATACFLOAT.asString,
            IntegraBack.RecPag,
            0,
            qryCODPORTFORMA.asInteger,
            iCodLancFInanc);

          if not (Qry.State in [DsEdit,DsInsert]) then
            Qry.Edit;

          if (Modulo.PrevEfet = 'A') then 
            sOperacao := '15';

          if qryDEBCRE.asString = 'D' then
            qryDEBCRE.asString := 'C'
          else
            qryDEBCRE.asString := 'D';

          if iCodLancFInanc = -1 then
            raise ELancDocError.Create('Não Foi Possível Lançar Documento no FInanceiro.');
        end;

        if iCodLancFInanc = 0 then
          iCodLancFInanc := -1;

        Documento.RecbToPagto.Inserir(
          qryAuxFuncao,
          iCodLancCAPCAR,
          qryNUMLANCTO.asInteger,
          Sistema.idUsuario,
          iCodLancFInanc,
          qryCODPORTFORMA.asInteger,
          -1,
          qryNUMCHQBORDERO.asString,
          qryDATACFLOAT.asString,
          QryDATALANCTO.asString);

        if (Modulo.PrevEfet = 'A') and (cbLancaBaixa.Checked) then
          Documento.baixa_adiantamento(DtmBaseDados.Qry, iCodLancCAPCAR, -1, QryDATALANCTO.asString);
      end;

      if ((Modulo.PrevEfet =  'E') or
          (Modulo.PrevEfet =  'A')) then
      begin
        Atualizaorcamento;

        QryDet.First;
        while not QryDet.Eof do
        begin
          IntegraorcamentoBack(QryDetNumReserva.asInteger, QryDetValor.asFloat);
          QryDet.Next;
        end;
        QryDet.Next;
      end;
      if (trim(sOperacao) = '1') and (not qryNUMFATURA.IsNull) then
      begin
        qryAux.close;
        qryAux.sql.text:=
          'update '+
            'documento '+
          'set '+
            'status = ''2'' '+
          'where coddocumento = '+qryCODDOCUMENTO.asString;
        qryAux.execsql;
      end;

      if qry.UpdatesPendIng then
        qry.CancelUpdates;
      if qryDet.UpdatesPendIng then
        qryDet.CancelUpdates;
      if qryContabil.UpdatesPendIng then
        qryContabil.CancelUpdates;

      CommitTransacao;

      CmeCadastro.Find(Self);
    except
      RollBackTransacao;
      MsgDlg('Alteração Não Efetuada', 'Erro', mtError, [mbOk], 0);
      raise;
    end;
  end;

  if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) and (sOperacao = '2') then
  begin
    if Modulo.NomeReport <> '' then
    begin
      if (MsgDlg('Confirma a Impressão do Espelho do Documento "' + Modulo.NomeReport + '" ?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mryes) then
      begin
        dtm := TdtmReports(Application.FIndComponent(Modulo.FormEventos));
        if dtm <> nil then
        begin
          if Application.FIndComponent('frmMostraRelat') = nil then
            frmMostraRelat := nil;
          rpt := TppReport(dtm.FIndComponent(Modulo.PpReports));
          try
            Modulo.coddocumento := QryCodDocumento.asInteger;
            if (rpt <> nil) and (dtm.MostraParam(Modulo.FormParam)) then
            begin
              rpt.Device := dvPrInter;
              rpt.PrInt;
              rpt.Device := dvScreen;
            end;
          finally
            Modulo.coddocumento := 0;
          end;
        end;
      end;
    end;
  end;

  pnlMestre.Enabled := false;
end;

procedure TfrmLancDocCAPCAR.CmeCadastroDelete(Sender: TObject);
var
  sMens: string;
begin
  ExibeStatusDoc(false);

  liEmpresa := Sistema.IdEmpresa;

  if (qryESTORNO.asInteger <> 0) then
  begin
    MsgDlg('Este Lançamento foi estornado ou é um estorno. Proibido Excluir.','Erro',mtWarnIng,[mbOk],0);
    exit;
  end;

  if (IntegraBack.Contabilidade = 'S') and (cbIntegra.Checked = false) and
     ((qryIDMODULO.asInteger = 3) or (qryIDMODULO.asInteger = 4)) then
  begin
    //Testa se o período contábil está aberto ou fechado.
    liRetFuncao := TestaPeriodo(true, 'BASEDADOS', qryDATALANCTO.asString,
      IntToStr(Sistema.IdModulo), liExercicio, liPeriodo, liEmpresa, sMens);
    if (liRetFuncao <> 0) then
    begin
      MsgDlg('Este lançamento não pode ser excluido, somente pode ser estornado','Erro',mtError,[mbOk],0);
      exit;
    end;
  end;

  try
    StartTransacao;

    iCodLancCAPCAR  := qryCODDOCUMENTO.asInteger;
    iCodLancFInanc  := qryCODLANCFINANC.asInteger;
    iPlnCodigoOri   := qryPLNCODIGO.asInteger;
    sDataLancamento := qryDATALANCTO.asString;

    if (Modulo.PrevEfet = 'E') and (sOperacao <> '10') then
    begin
      ImpostoRetido.CodDocumento      := iCodLancCAPCAR;
      ImpostoRetido.NumLancto         := 0;
      ImpostoRetido.ExcluiAlteradores := true;
      ImpostoRetido.Excluir;
    end;

    Documento.Excluir(qryAuxFuncao,iCodLancCAPCAR,0);

    if (iCodLancCAPCAR = -1) then
    begin
      iCodLancCAPCAR := qryCODDOCUMENTO.asInteger;
      raise ELancDocError.Create('Não foi possível excluir o Documento.')
    end;

    if (qryCODLANCFINANC.asInteger <> 0) then
      LancFinanc.ExcluiFinanceiro(iCodLancFInanc);

    if (iPlnCodigoOri <> 0) then
      liRetFuncao := ExcluiLanc(true,iPlnCodigoOri,'BASEDADOS',
                     IntToStr(Sistema.IdModulo),
                     sPlano,
                     Sistema.IdEmpresa,
                     Sistema.IdUsuario,
                     true,
                     0,
                     IntegraBack.MascaraPlano);

    if (liRetFuncao < 0) then
      raise ELancDocError.Create('Não Foi Possível Excluir Lançamentos Contábeis.');

    qryDet.First;
    while not(qryDet.EOF) do
    begin
      if not(qryDetIDRESERVAORCAMEN.IsNull) then
        if (OrcamentoBack.EstornaCompromisso(qryDetNUMRESERVA.asInteger,
            qryDetVLRRESORCAMEN.asFloat,true) <> 0) then
          raise ELancDocError.Create('Não Foi Possível Estornar Compromisso orçamentário.');
      qryDet.Delete;
    end;

    CommitTransacao;
    MsgDlg('Documento Excluído Com Sucesso','Aviso',mtInformation,[mbOk],0);
    CmeCadastro.Find(Self);
  except
    RollBackTransacao;
    MsgDlg('Exclusão Não Efetuada','Erro',mtError,[mbOk],0);
    raise;
  end;
end;

procedure TfrmLancDocCAPCAR.SelecionaFilhos;
begin
   if qryDet.Active then qryDet.Close;
   if not qryDet.Prepared then qryDet.Prepare;
   qryDet.ParamByName('CODDOCUMENTO').asFloat := iCodLancCAPCAR;
   qryDet.Open;

   if qryLancamento.Active then qryLancamento.Close;
   if not qryLancamento.Prepared then qryLancamento.Prepare;
   qryLancamento.ParamByName('CODDOCUMENTO').asFloat := iCodLancCAPCAR;
   qryLancamento.Open;

   if qryContabil.Active then qryContabil.Close;
   if not qryContabil.Prepared then qryContabil.Prepare;
   qryContabil.ParamByName('PLNCODIGO').asFloat := iCodLancContab;
   qryContabil.Open;

   {FazQuery(QryGridAlt,'select LanctoDocum.CodAlterador,LanctoDocum.NumLancto, ' +
                       'Descricao,DataLancto,ValorOutraMoeda,Valor,HistoricoCompl, ' +
                       'LanctoDocum.DebCre ' +
                       'from LanctoDocum, TipoAlterador ' +
                       'where (LanctoDocum.CodAlterador <> 0) AND ' +
                       '(LanctoDocum.CodDocumento = '+ IntToStr(iCodLancCAPCAR) + ') AND '+
                       '(TipoAlterador.CodAlterador = LanctoDocum.CodAlterador)');}
end;


procedure TfrmLancDocCAPCAR.CmeDetalheInsert(Sender: TObject);
var
  bVazio :boolean;
begin
  bVazio := QryDet.IsEmpty;

  Inherited;

  if pgctrlDetalhe.ActivePage.PageIndex = 0 then
  begin

     if PnlRateioGeral.Visible then
        PageRateioPrev.ActivePage := TbsRateioGeral;

     orcamentoback.IdReserva := 0;
     QryDetNumReserva.asInteger := 0;

     if qryCentroRespon.IsEmpty then
     begin
        dblcCentroRespon.Enabled:=false;
        qrydetCODCENTRORESPON.asString:=sCodCentroRespon;
        qrydetNOME_1.asString:=sNomeCentroRespon;
     end;

     qrydetMOECODIGO.Clear;

     dbeValorMoedaDet.Value:=0;
     dbeValorDet.Value:=0;

     edMoedaDet.Text:='';
     IF qryMOECODIGO.asInteger <>0 then
     begin
        qrydetMOECODIGO.asInteger := qryMOECODIGO.asInteger;
        edMoedaDet.Text:=qryMoedaMOESIGLA.asString;
     end
     else
        dbeValorMoedaDet.Value:=0;

     CmbCentCusto.CloseUp(true);

    if not bVazio then
    begin
       if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;

       qryDetUNIDNEGOC.asString        := ativproj;
       dblcUnidNegoc.CloseUp(true);
       qryDetCODCENTRORESPON.asString  := crespom;
       dblcCentroRespon.CloseUp(true);
       qryDetCODTIPRECDES.asString     := tpdesmb;
       dblcTipoRD.CloseUp(true);
       qryDetCODCENTROCUSTO.asString   := cccusto;
       CmbCentCusto.CloseUp(true);

       if iPlanoPrevDet = 0 then
          QryDetIDPLANOPREV.Clear
       else
          begin
             QryDetIDPLANOPREV.asFloat := iPlanoPrevDet;
             CmbPlano.LookupValue      := FloatToStr(iPlanoPrevDet);
          end;
       CmbPlano.CloseUp(true);

       if iPatroDet = 0 then
          QryDetIDPATRO.Clear
       else
          begin
             QryDetIDPATRO.asFloat := iPatroDet;
             CmbPatro.LookupValue  := FloatToStr(iPatroDet);
          end;
       CmbPatro.CloseUp(true);

      // if iProgramaDet = 0 then
      //    QryDetIDPROGRAMA.Clear
      // else
      //    QryDetIDPROGRAMA.asFloat := iProgramaDet;

      // CmbPrograma.CloseUp(true);
    end
    else
        setaplanopatroglobal;

    if (Trim(crespom) = '') or
       (Trim(crespom) = '9999999999') then
    begin
       qryDetCODCENTRORESPON.asString  := '9999999999';
       dblcCentroRespon.CloseUp(true);
    end;

    MontaCentroDeCusto;
  end
  else
    if pgctrlDetalhe.ActivePage.PageIndex = 1 then
       begin
       qryContabilLACDEBCRE.asString := 'D';
       qryContabilPLANO.asInteger:=sPlano;
       qryContabilLACHIST1.asString:=sHist1;
       qryContabilLACHIST2.asString:=sHist2;
       qryContabilLACHIST3.asString:=sHist3;
       qryContabilLACHIST4.asString:=sHist4;
       qryContabilLACHIST5.asString:=sHist5;
       qryContabilLACNUMDOC.asString:=trim(dbenNumDoc.Text)+'/'+trim(dbeCompl.Text);

       IF qryMOECODIGO.asInteger <> 0 then
       begin
          reValorMoedaCon.Enabled:=true;
          reValorCorrenteCon.Enabled:=false;
       end
       else
       begin
          reValorMoedaCon.Enabled:=false;
          reValorCorrenteCon.Enabled:=true;
       end;
    end;
end;

procedure TfrmLancDocCAPCAR.CmeDetalheEdit(Sender: TObject);
begin
  Inherited;
  if (qry.State In ([dsInsert,dsEdit])) then
  begin
     if (pgctrlDetalhe.ActivePage.PageIndex = 0)  then
     begin
        if not (qryDet.State In ([dsInsert,dsEdit])) then qryDet.Edit;

        dblcTipoRD.Text:=qryDetDESCRICAO.Text;
        dblcCentroRespon.Text:=qryDetNOME_1.Text;
        dblcUnidNegoc.Text:=qryDetNOME.Text;
        qrydetMOECODIGO.Clear;
        dbeValorMoedaDet.Value:=qrydetVALOROUTRAMOEDA.asFloat;
        dbeValorDet.Value:=qrydetVALOR.asFloat;
        edMoedaDet.Text:='';

        if qryCentroRespon.IsEmpty then
        begin
           dblcCentroRespon.Enabled:=false;
           qrydetCODCENTRORESPON.asString:=sCodCentroRespon;
           qrydetNOME_1.asString:=sNomeCentroRespon;
        end;
        IF qryMOECODIGO.asInteger <>0 then
        begin
           qrydetMOECODIGO.asInteger := qryMOECODIGO.asInteger;
           edMoedaDet.Text:=qryMoedaMOESIGLA.asString;
        end
        else
           dbeValorMoedaDet.Value:=0;

        if not qrydetIdReservaorcamen.IsNull then
        begin
           orcamentoBack.NumReserva   := qrydetNumReserva.asInteger;
           orcamentoBack.ValorReserva := qrydetValor.asFloat;
           orcamentoback.IdReserva    := qrydetIdReservaorcamen.asInteger;
        end
        else
        begin
           orcamentoBack.NumReserva   := 0;
           orcamentoBack.ValorReserva := 0;
           orcamentoback.IdReserva    := 0;
        end;

        CmbCentCusto.CloseUp(true);

        setaplanopatroglobal;
     end;

     if (pgctrlDetalhe.ActivePage.PageIndex = 1)  and (qryContabil.State In ([dsInsert,dsEdit])) then
     begin
        IF qryMOECODIGO.asInteger <>0 then
        begin
           reValorMoedaCon.Enabled:=true;
           reValorCorrenteCon.Enabled:=false;
           if (reValorMoedaCon.Value = 0) and (rValorCotacao > 0) then
              reValorMoedaCon.Value := reValorCorrenteCon.Value / rValorCotacao;
        end
        else
        begin
           reValorMoedaCon.Value:=0;
           reValorMoedaCon.Enabled:=false;
           reValorCorrenteCon.Enabled:=true;
        end;
     end;
  end;
end;

procedure TfrmLancDocCAPCAR.CmeDetalheConfirma(Sender: TObject);
begin
  if CmeCadastro.Operacao In [OpInserir,OpAlterar] then
  begin
     if (pgctrlDetalhe.ActivePage.PageIndex = 0) and (qryDet.State In ([dsInsert,dsEdit])) then
        begin
           if (trim(dblcUnidNegoc.Text) = '') then
           begin
              if (IntegraBack.ObrigaAbc = 'S') then
              begin
                MsgDlg('Obrigatório preencher a Atividade','Erro',mtError,[mbOk],0);
                if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
                exit
              end
              else
              begin
                qryDetUNIDNEGOC.asFloat := -1;
                dblcUnidNegoc.LookupValue := '-1';
              end;
           end;

           if qryCentroRespon.isEmpty then
           begin
              qryDetNOME_1.Text := sNomeCentroRespon;
              qryDetCODCENTRORESPON.asString := '9999999999';
              dblcCentroRespon.LookupValue   := '9999999999';
           end
           else
           begin
              if (trim(dblcCentroRespon.Text) = '') then
              begin
                 if (IntegraBack.ObrigaCResPon = 'S') then
                 begin
                   MsgDlg('Obrigatório preencher o Centro de Responsabilidade','Erro',mtError,[mbOk],0);
                   if dblcCentroRespon.CanFocus then dblcCentroRespon.SetFocus;
                   exit
                 end
                 else
                 begin
                   qryDetCODCENTRORESPON.asString := '9999999999';
                   dblcCentroRespon.LookupValue   := '9999999999';
                   qrydetNOME_1.asString          :=sNomeCentroRespon;
                 end;
              end;

              qryDetNOME_1.Text:=dblcCentroRespon.Text;
              //qryDetCODCENTROCUSTO.Value:= qryCentroResponCodCentroCusto.Value;
           end;

           if trim(dblcTipoRD.Text) = '' then
           begin
              MsgDlg('Obrigatório preencher o Tipo de Recebimento/Desembolso','Erro',mtError,[mbOk],0);
              if dblcTipoRD.CanFocus then dblcTipoRD.SetFocus;
              exit;
           end;

           if (dbeValorMoedaDet.Value = 0) and (qryMOECODIGO.asInteger <> 0) then
           begin
              MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk],0);
              if dbeValorMoedaDet.CanFocus then dbeValorMoedaDet.SetFocus;
              exit;
           end;

           if (dbeValorDet.Value = 0) and (dbeValorCorrente.Value <> 0) then
           begin
              MsgDlg('Obrigatório preencher o Valor em Moeda Corrente','Erro',mtError,[mbOk],0);
              if dbeValorDet.CanFocus then dbeValorDet.SetFocus;
              exit;
           end;

           rValorEdit :=  rValorEdit - dbeValorDet.Value;

           {
             RJ 27/07 Gustavo
             if not IntegraorcamentoBack(Trunc(ReResorc.Value),dbeValorDet.Value) then Exit;
             A Integração com o orcamento passou a ser feita no fazer confirma.
             Fim RJ 27/07 Gustavo
           }

           qryDetDESCRICAO.Text := dblcTipoRD.Text;
           qryDetNOME.Text      := dblcUnidNegoc.Text;
           qryDetMOESIGLA.Text  := edMoedaDet.Text;
           qryDetVALOR.Value    := dbeValorDet.Value;
           qryDetVALOROUTRAMOEDA.Value:=dbeValorMoedaDet.Value;

           if qrydetCODDOCUMENTO.asInteger<=0 then
           begin
              qrydetRECPAG.asString:=qryTipoRDRECPAG.asString;
              qrydetCODDOCUMENTO.asInteger := qryCODDOCUMENTO.asInteger;
              qrydetIDPESSOA.asInteger := Sistema.IdEmpresa;
           end;

           //ReResorc.Value := 0;
        end;

     if (pgctrlDetalhe.ActivePage.PageIndex = 1) and (qryContabil.State In ([dsInsert,dsEdit])) then
        begin
           if CContabil.Valida <> VcOk then Exit;

           qryContabilPLANOME.asString := CContabil.Conta.Nome;

           if (trim(dblcAtividade.Text) = '') and (IntegraBack.ObrigaAbc = 'S') then
           begin
              MsgDlg('Obrigatório preencher a Atividade','Erro',mtError,[mbOk],0);
              if dblcAtividade.CanFocus then dblcAtividade.SetFocus;
              exit;
           end;
           if trim(dbeHist1.Text) = '' then
           begin
              MsgDlg('Obrigatório preencher pelo menos a primeira lInha do histórico','Erro',mtError,[mbOk],0);
              if dbeHist1.CanFocus then dbeHist1.SetFocus;
              exit;
           end;
           if (reValorMoedaCon.Value = 0) and (qryMOECODIGO.asInteger <> 0) then
           begin
              MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk],0);
              if reValorMoedaCon.CanFocus then reValorMoedaCon.SetFocus;
              exit;
           end;
           if reValorCorrenteCon.Value = 0 then
           begin
              MsgDlg('Obrigatório preencher o Valor','Erro',mtError,[mbOk],0);
              if reValorCorrenteCon.CanFocus then reValorCorrenteCon.SetFocus;
              exit;
           end;
           if qryContabilLACDEBCRE.asString = 'D' then
              qryContabilLACTIPO.asString:='0'
           else
              qryContabilLACTIPO.asString:='1';

           qryContabilNOME.Text:=dblcUnidNegoc.Text;
           qryContabilNOME_1.Text:=dblcCCusto.Text;
           qryContabilLACVALOR.Value:=reValorCorrenteCon.Value;
           qryContabilLACVALHIST.Value:=reValorMoedaCon.Value;
        end;
     SetaCentResponDesemb(-1,true);
  end;

  Inherited;

  if qryDet.state=dsInsert then
  begin
    qryDetCODCENTROCUSTO.asString   := cccusto  ;
    qryDetCODTIPRECDES.asString     := tpdesmb  ;
    qryDetUNIDNEGOC.asString        := ativproj ;

    if (Trim(crespom) = '') or (Trim(crespom) = '9999999999') then
    begin
       qryDetCODCENTRORESPON.asString  := '9999999999';
       qryDetNOME_1.Text               := sNomeCentroRespon;
    end
    else
       qryDetCODCENTRORESPON.asString  := crespom  ;

    MontaCentroDeCusto;
  end;
end;

procedure TfrmLancDocCAPCAR.CmeCadastroFind(Sender: TObject);
begin
     if (MontaSelect.RetornouValor) then
         begin
            iCodLancCAPCAR:=StrtoInt(MontaSelect.ValoresChave[0]);

            if FazerQryPrIncipal then
            begin

              ExibeStatusDoc((qrySTATUS.asInteger = 2));

              iCodLancContab                := qryPLNCODIGO.asInteger;
              iModulo                       := qryIDMODULO.asInteger;
              dbeValorMoeda.Value           := qryVALOROUTRAMOEDA.asFloat;
              dbeValorCorrente.Value        := qryVALOR.asFloat;
              DbeValorLiquido.Value         := qryVLRLIQUIDO.asFloat;
              sContaCliFor                  := qryPLACONTA.asString;
              sCCustoCliFor                 := qryCODCENTROCUSTO.asString;
              cbLancaBaixa.Checked          := ((qryOPERACAO.asString = '10') or (qryOPERACAO.asString = '15'));
              cbEnglobParc.Checked          := ((qryOPERACAO.asString = '1') or (qryOPERACAO.asString = '11'));
              cbIntegra.Checked             := (qryPLNCODIGO.asInteger = 0);

              SelecionaFilhos;

              SetaEnglobaParcela;
            end;
         end;
end;

procedure TfrmLancDocCAPCAR.CmeCadastroEdit(Sender: TObject);
begin
  Inherited;

  PnlAp.Enabled := (EdtAutorizaAlteracao.Text = 'S');

  ContabDoc.PLANO          := 0;
  ContabDoc.CODSUBCONTA    := 0;
  ContabDoc.PLACONTA       := '';
  ContabDoc.CODCENTROCUSTO := '';

  pnlMestre.Enabled:=true;
  if (IntegraBack.Contabilidade = 'S') and
     (cbIntegra.Checked = false) and
     ((qryIDMODULO.asInteger = 3) or
     (qryIDMODULO.asInteger = 4)) then
  begin
     sOldDataLancamento       := qryDATALANCTO.asString;
     ContabDoc.PLANO          := qryPLANO.asInteger;
     ContabDoc.CODSUBCONTA    := qryCODSUBCONTA.asInteger;
     ContabDoc.PLACONTA       := Trim(qryPLACONTA.asString);
     ContabDoc.CODCENTROCUSTO := Trim(qryCODCENTROCUSTO.asString);
  end
  else
     sOldDataLancamento       :=  '';  

  if qryESTORNO.asInteger <> 0 then
  begin
     MsgDlg('Este Lançamento foi estornado ou é um estorno. Proibido Alterar.','Erro',mtError,[mbOk],0);
     bbtnCancelar.Click;
     exit;
  end;

  if qryMOECODIGO.asInteger <> 0 then
  begin
    dbeValorMoeda.Enabled:=true;
    dbeValorCorrente.Enabled:=false;
  end
  else
  begin
    dbeValorMoeda.Enabled:=false;
    dbeValorCorrente.Enabled:=true;
  end;

  if CmpForCli.CanFocus then CmpForCli.SetFocus;

  bValida := true;
  //CmpForCliExit(Self);

  if cbLancaBaixa.Checked then
  begin
     dbenChBordero.Enabled := true;
     lblNumChBordero.Enabled := true;
  end
  else
  begin
     dbenChBordero.Enabled := false;
     lblNumChBordero.Enabled := false;
  end;

  bIntegraChecked := cbIntegra.Checked;

  DtmDadosBancarios.SetaContaPreferencial(QryIdForcli.asFloat,Qry);
end;

procedure TfrmLancDocCAPCAR.FazerInsertContab;
var sHistorico:string;
begin
   if (Trim(sContaContabil) <> '') then
   begin
       qryContabil.First;
       while (not qryContabil.Eof) do
       begin
          if (qryContabilPLACONTA.asString=sContaContabil) AND
             (qryContabilCODCENTROCUSTO.asString=sCentroCusto) AND
             (qryContabilUNIDNEGOC.asInteger=iUnidNegoc) AND
             (qryContabilCODSUBCONTA.asInteger=iSubConta) AND
             (qryContabilLACDEBCRE.asString=sDebCre) AND
             (qryContabilLACTIPO.asString=sTipoDC) AND
             (qryContabilIDPLANOPREV.asFloat=fIdPlanoPrev) AND
             (qryContabilIDPATRO.asFloat=fIdPatro) then
          begin
             dsContabil.DataSet.Edit;
             qryContabilLACVALOR.asFloat:=qryContabilLACVALOR.asFloat+rValorCorrente;
             qryContabilLACVALHIST.asFloat:=qryContabilLACVALHIST.asFloat+rValorMoeda;
             dsContabil.DataSet.Post;
             exit;
          end;
          qryContabil.Next
       end;

       sHistorico:='LANC. DOC. '+trim(dbenNumDoc.Text)+'/'+trim(dbeCompl.Text)+' '+trim(CmpForCli.ForCliReg.RazaoSocial)+' Vencimento: ' + dbeDataVenc.Text +' '+trim(dbeHistorico.Text);

       sHist1:='';
       sHist2:='';
       sHist3:='';
       sHist4:='';
       sHist5:='';

       FuncaoGeral.ArrumaHistorico(sHistorico,sHist1,sHist2,sHist3,sHist4,sHist5);

       dsContabil.DataSet.Insert;
       qryContabilPLACONTA.asString:=sContaContabil;
       qryContabilPLANO.asInteger:=sPlano;
       qryContabilCODCENTROCUSTO.asString:=sCentroCusto;
       qryContabilNOME_1.asString := sNomeCentroCusto;
       qryContabilUNIDNEGOC.asInteger:=iUnidNegoc;
       qryContabilNOME.asString:=sNomeUnidNegoc;
       qryContabilLACVALOR.asFloat:=rValorCorrente;
       qryContabilLACVALHIST.asFloat:=rValorMoeda;
       qryContabilLACHIST1.asString:=sHist1;
       qryContabilLACHIST2.asString:=sHist2;
       qryContabilLACHIST3.asString:=sHist3;
       qryContabilLACHIST4.asString:=sHist4;
       qryContabilLACHIST5.asString:=sHist5;
       qryContabilLACNUMDOC.asString:=trim(dbenNumDoc.Text)+'/'+trim(dbeCompl.Text);
       qryContabilLACDEBCRE.asString:=sDebCre;
       qryContabilLACTIPO.asString:=sTipoDC;
       qryContabilPLANOME.asString:=BuscaNomeConta(qryContabilPLACONTA.asString,qryContabilPLANO.asInteger);
       qryContabilHITCODHIST.asString:=QryDetHITCODHIST.asString;
       qryContabilIDPLANOPREV.asFloat:=fIdPlanoPrev;
       qryContabilIDPATRO.asFloat:=fIdPatro;
       qryContabilDESCPLANO.asString:=sNomePlanoPrev;
       qryContabilNOMEPATRO.asString:=sNomePatro;

       if iSubConta <> 0 then
          qryContabilCODSUBCONTA.asInteger:=iSubConta;

       dsContabil.DataSet.Post;
   end;
end;

Function TfrmLancDocCAPCAR.BuscaNomeConta(sPlaconta:string;iPlano: integer):string;
begin
  FazQuery(DtmBaseDados.Qry,'SELECT PLANOME FROM PLANOCONTA WHERE PLACONTA = ''' + Trim(sPlaconta) + ''' AND PLANO = ' + IntToStr(iPlano));
  Result := DtmBasedados.Qry.Fields[0].asString;
end;

procedure TfrmLancDocCAPCAR.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   Inherited;
   if (iModulo <> Sistema.IdModulo) then // ECF
   begin
      sbtnAlterar.Enabled :=false;
      sbtnApagar.Enabled  :=false;
   end
   else
   begin
      if (IntegraBack.Contabilidade = 'S') and (cbIntegra.Checked = false) and (sbtnInserir.Down = false) and (sbtnAlterar.Down = false) and (sbtnApagar.Down = false) then
      begin
         if IntegraBack.EstornaContab = 'S' then
            sbtnApagar.Enabled  :=false;
      end;
   end;
   sbtnEstornar.Enabled := (sbtnAlterar.Enabled) and (not bbtnConfirmar.Enabled);
end;

procedure TfrmLancDocCAPCAR.bbtnConfirmarClick(Sender: TObject);
var
    TotalRateioOM, TotalRateio, rTotalContab, rValorCliFor, rValorCheckForCli :Real;
    liPeriodo, liExercicio, liRetFuncao, liEmpresa                            :integer;
    bDuplicado                                                                :boolean;
    ifSubConta, ifPlano,iCodDoCumento                                         :LongInt;
    sMens, sNomeConta, sfCentroCusto, sObriga, sNome, sSubConta, sfPlaConta,placontacredito    :string;

begin

  if QrYDet.recordcount=0 then exit;
  if not Modulo.VerificaLInhaGrid(QrYDet,1,2,'Rateio de Documentos',true) then Exit;

  QrYDet.first;
  placontacredito :='';

  if (Integraback.Contabilidade='S') and (Modulo.ValidaCCBaixa)then
  begin
    try
      QrYDet.DisableControls;
      while not QrYDet.eof do
      begin
        if placontacredito='' then
           placontacredito:=qryDetPLACONTACREDITO.asString
        else
        begin
           if trim(placontacredito)<>trim(qryDetPLACONTACREDITO.asString) then
           begin
                 if Integraback.recpag='P' then
                     raise ELancDocError.Create('Conta Contábil para baixa diferentes. Verifique os Tipos de Desembolsos Selecionados.')
                 else
                     raise ELancDocError.Create('Conta Contábil para baixa diferentes. Verifique os Tipos de Recebimentos Selecionados.')  ;
                 break;
           end;
        end;
        QrYDet.next;
      end;
      QrYDet.EnableControls;
    except
        QrYDet.EnableControls;
        //exit;
        //DF 03/07 Gustavo
        //Ao lançar um documento - Correção no teste da vverifiação da conta contábil dos tipos de desembolso
        raise;
        //Fim DF 03/07 Gustavo
    end;
  end;

  if (Trim(DbeBarras.Text) <> '')
     and not IeaCm.ValidaCodBarrasSispag(DbeBarras.Text,11) then Exit;

  if (Trim(DbeLInhaDigit.Text) <> '')
     and not IeaCm.ValidaCodBarrasSispag(DbeLInhaDigit.Text,10) then Exit;

  if (Trim(dblcPortadorForma.Text) = '') then
  begin
     if (cbLancaBaixa.Checked) then
     begin
        MsgDlg('Obrigatório Indicar '+ lblPortadorForma.Caption ,'Erro',mtError,[mbOk],0);
        if dblcPortadorForma.CanFocus then dblcPortadorForma.SetFocus;
        exit;
     end;
  end
  else
    if (IntegraBack.RecPag = 'P') and
       (not qryPortFormaCODARQUIVOREMESSA.isNull) and
       (not qryPortFormaCODFORMAPAGTO.isNull) and
       IeaCm.ObrigaDadosBancarios(qryPortFormaCODARQUIVOREMESSA.asInteger,qryPortFormaCODFORMAPAGTO.asInteger) and
       ((DbEdtBanco.Text = '') or (DbEdtAgencia.Text = '') or (DbEdtConta.Text = '')) then
       begin
           MsgDlg('Esta forma de pagamento obriga a Indicação da conta bancária','Aviso',mtInformation,[mbOk],0);
           Exit;
       end;

  if (CmpForCli.Valida <> VcOk) then  exit;

  //if ObrigaSubconta(CmpForcli.ForCliReg.CContabil) then Exit;

  if ObrigaSubconta(sContaContabil) then Exit;

  if (trim(dbenNumDoc.Text)='') or (dbenNumDoc.Value = 0.00) then
     begin
       MsgDlg('Obrigatório preencher o Número do Documento','Erro',mtError,[mbOk],0);
       if dbenNumDoc.CanFocus then
          dbenNumDoc.SetFocus
       else
          if DbeNoDocumento.CanFocus then
             DbeNoDocumento.SetFocus;
       exit;
     end;

  if (Modulo.ObrigaFormaPagto) and (DblCodForma.Text = '') then
     begin
       MsgDlg('Obrigatório Indicar ' + LblFormaPag.Caption + ' na ''Pasta'' Geral','Erro',mtError,[mbOk],0);
       if DblCodForma.CanFocus then DblCodForma.SetFocus;
       exit;
     end;

  if trim(dbeDataEmi.text) = '' then
     begin
       MsgDlg('Obrigatório preencher a ' + lblEmissao.Caption,'Erro',mtError,[mbOk],0);
       if dbeDataEmi.CanFocus then dbeDataEmi.SetFocus;
       exit;
     end;

  if trim(dbeDataLanc.text) = '' then
     begin
       MsgDlg('Obrigatório preencher a ' + lblData.Caption,'Erro',mtError,[mbOk],0);
       if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
       exit;
     end;

  if trim(dbeDataVenc.text) = '' then
     begin
       MsgDlg('Obrigatório preencher a ' + lblVencimento.Caption,'Erro',mtError,[mbOk],0);
       if dbeDataVenc.CanFocus then dbeDataVenc.SetFocus;
       exit;
     end;

  if trim(dbeDataProgr.text) = '' then
     begin
       MsgDlg('Obrigatório preencher a ' + lblProgramada.Caption,'Erro',mtError,[mbOk],0);
       if dbeDataProgr.CanFocus then dbeDataProgr.SetFocus;
       exit;
     end;

  if StrToDate(dbeDataVenc.Text) < StrToDate(dbeDataEmi.Text) then
     begin
       MsgDlg('A ' + lblVencimento.Caption + ' não pode ser menor que ' + lblEmissao.Caption,'Erro',mtError,[mbOk],0);
       if dbeDataVenc.CanFocus then dbeDataVenc.SetFocus;
       exit;
     end;

  if StrToDate(dbeDataProgr.Text) < StrToDate(dbeDataLanc.Text)  then
     begin
       MsgDlg('A ' + lblProgramada.Caption + ' não pode ser menor que a ' + lblData.Caption,'Erro',mtError,[mbOk],0);
       if dbeDataProgr.CanFocus then dbeDataProgr.SetFocus;
       exit;
     end;

  if (Modulo.ExcluiContab)            and
     (CmeCadastro.Operacao = OpAlterar)   and
     (not QryContabil.UpdatesPendIng) then
  begin
     QryContabil.First;
     while not QryContabil.Eof Do QryContabil.Delete;
  end;

  bMoveTab := true;
  tbcDetalhe.TabIndex:=1;
  tbcDetalheChange(Sender);

  if (IntegraBack.Contabilidade = 'S') and
     (cbIntegra.Checked = false)       and
     (QryContabil.UpdatesPendIng)      and
     ((qryIDMODULO.asInteger = 3) or
     (qryIDMODULO.asInteger = 4)) then
  begin
     liEmpresa:=Sistema.IdEmpresa;


     if (CmeCadastro.Operacao = OpAlterar) and (sOldDataLancamento <> '') then
     begin
       liRetFuncao:=TestaPeriodo(true,'BASEDADOS',sOldDataLancamento,IntToStr(Sistema.IdModulo),liExercicio,
                                 liPeriodo,liEmpresa,sMens);
       if liRetFuncao <> 0 then
          begin
            if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
            exit;
          end;
     end;

     liRetFuncao:=TestaPeriodo(true,
                               'BASEDADOS',
                               qryDATALANCTO.asString,
                               IntToStr(Sistema.IdModulo),
                               liExercicio,
                               liPeriodo,
                               liEmpresa,sMens);
     if liRetFuncao <> 0 then
        begin
          if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
          exit;
        end;
  end;

  if (dbeValorMoeda.Value = 0) and (qryMOECODIGO.asInteger <> 0) then
     begin
       MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk],0);
       if dbeValorMoeda.CanFocus then dbeValorMoeda.SetFocus;
       exit;
     end;

  if dbeValorCorrente.Value = 0 then
     begin
       if (MsgDlg('Confirma o lançamento do documento com valor ''0''(Zero)?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrNo) then
       begin
        if dbeValorCorrente.CanFocus then dbeValorCorrente.SetFocus;
        exit;
       end;
     end;

  if trim(dblcTipoDoc.text) = '' then
     begin
       MsgDlg('Obrigatório preencher o Tipo de Documento','Erro',mtError,[mbOk],0);
       if dblcTipoDoc.CanFocus then dblcTipoDoc.SetFocus;
       exit;
     end;

  if (cbLancaBaixa.Checked) then
  begin
     if trim(dblcPortadorForma.text) = '' then
     begin

       QryCODPORTFORMA.Value := -1;

       if IntegraBack.RecPag = 'R' then
          MsgDlg('Obrigatório preencher a Cobrança','Erro',mtError,[mbOk],0)
       else
          MsgDlg('Obrigatório preencher a Forma de Pagamento','Erro',mtError,[mbOk],0);
       if dblcPortadorForma.CanFocus then dblcPortadorForma.SetFocus;
       exit;
     end;

     if trim(dbenChBordero.text) = '' then
     begin
       if IntegraBack.RecPag = 'R' then
          MsgDlg('Obrigatório preencher o Número do Lote de Recebimento','Erro',mtError,[mbOk],0)
       else
          MsgDlg('Obrigatório preencher o Número do Cheque/Borderô','Erro',mtError,[mbOk],0);
       if dbenChBordero.CanFocus then dbenChBordero.SetFocus;
       exit;
     end;

     if IntegraBack.RecPag = 'R' then
        qryDATACFLOAT.AsDateTime :=
        qryDATALANCTO.AsDateTime  +
        qryPortFormaDMAIS.asInteger
     else
        qryDATACFLOAT.AsDateTime :=
        qryDATALANCTO.AsDateTime  -
        qryPortFormaDMAIS.asInteger;

     if IntegraBack.Contabilidade = 'S' then
     begin
        sContaCliFor   :=qryPortFormaPLACONTA.asString;
        iSubContaCliFor:=iSubConta;
        sCCustoCliFor  :=qryPortFormaCODCENTROCUSTO.asString;
     end;
  end;

  TotalRateioOM:=0;
  TotalRateio  := 0;
  qryDet.First;

  while (not qryDet.EOF) do
  begin
     TotalRateio   := TotalRateio   + qrydetVALOR.asFloat;
     TotalRateioOM := TotalRateioOM + qrydetVALOROUTRAMOEDA.asFloat;
     qryDet.Next;
  end;

  if Format('%17.2f',[dbeValorCorrente.Value]) <> Format('%17.2f',[TotalRateio]) then
     begin
       MsgDlg('Total do Rateio não bate com o Valor do Lançamento','Erro',mtError,[mbOk],0);
       rValorEdit := dbeValorCorrente.Value - TotalRateio;
       exit;
     end;

  if (dbeValorMoeda.Value <> 0) and
     (Format('%17.2f',[dbeValorMoeda.Value]) <> Format('%17.2f',[TotalRateioOM])) then
     begin
       MsgDlg('Total do Rateio em outra moeda não bate com o Valor do Lançamento em outra moeda','Erro',mtError,[mbOk],0);
       exit;
     end;

  sDataLancamento            := qryDATALANCTO.asString;
  iCodTipDoc                 := qryCODTIPDOC.asInteger;
  qryVALOR.asFloat           := dbeValorCorrente.Value;
  qryVLRLIQUIDO.asFloat      := DbeValorLiquido.Value;
  qryVALOROUTRAMOEDA.asFloat := dbeValorMoeda.Value;
  qryIDPESSOA.asInteger      := Sistema.IdEmpresa;
  qryDEBCRE.asString         := qryTipoDocDEBCRE.asString;
  qryNOME.asString           := CmpForCli.ForCliReg.Nome;
  rTotalContab                               := 0;
  rValorCliFor                               := 0;

  if qryDEBCRE.asString = 'C' then
     rValorCheckForCli:=(dbeValorCorrente.Value * (-1))
  else
     rValorCheckForCli:=dbeValorCorrente.Value;
  if (IntegraBack.Contabilidade = 'S') then
     begin
        sObriga := '';
        sNome := '';
        sSubConta := '';
        funcaogeral.TestaContaCC(false,sPlano,sContaCliFor,sObriga,sNome,sSubConta);
        if Sobriga <> 'S' then
           sCCustoCliFor:='';

        if sSubConta <> 'S' then
           iSubContaCliFor:=0;
     end;
     if (IntegraBack.Contabilidade = 'S') and
     (cbIntegra.Checked = false) and
     ((qryIDMODULO.asInteger = 3) or (qryIDMODULO.asInteger = 4)) then
  begin
     qryContabil.First;
     while (not qryContabil.Eof) do
     begin
        if qryContabilLACDEBCRE.isNull then
        begin
          MsgDlg('Existem lançamentos contábeis sem a Indicação de D/C','Erro',mtError,[mbOk],0);
          exit;
        end;

        if qryContabilPLACONTA.isNull then
        begin
          MsgDlg('Existem lançamentos contábeis sem a Indicação da Conta Contábil','Erro',mtError,[mbOk],0);
          exit;
        end;

        if qryContabilUNIDNEGOC.isNull then
        begin
          MsgDlg('Existem lançamentos contábeis sem a Indicação da Unidade de Negócio','Erro',mtError,[mbOk],0);
          exit;
        end;

        if qryContabilLACVALOR.isNull then
        begin
          MsgDlg('Existem lançamentos contábeis sem a Indicação do Valor','Erro',mtError,[mbOk],0);
          exit;
        end;

        sObriga := '';
        sNome := '';
        sSubConta := '';
        funcaogeral.TestaContaCC(false,sPlano,qryContabilPLACONTA.asString,sObriga,sNome,sSubConta);

        if (Sobriga = 'S') and
           (Trim(qryContabilCODCENTROCUSTO.asString) = '') then
        begin
          MsgDlg('É obrigatório preencher o centro de custo da conta ' + qryContabilPLACONTA.asString,'Erro',mtError,[mbOk],0);
          exit;
        end
        else
        begin
           if (Sobriga <> 'S') and
              (not qryContabilCODCENTROCUSTO.isNull) then
           begin
            qryContabil.Edit;
            qryContabilCODCENTROCUSTO.Clear;
            qryContabil.Post;
           end;
        end;

        if (sSubConta = 'S') and (qryContabilCODSUBCONTA.asInteger = 0) then
        begin
          MsgDlg('É obrigatório preencher a sub-conta da conta ' + qryContabilPLACONTA.asString,'Erro',mtError,[mbOk],0);
          exit;
        end
        else
        begin
           if (sSubConta <> 'S') and
              (not qryContabilCODSUBCONTA.isNull) then
           begin
             qryContabil.Edit;
             qryContabilCODSUBCONTA.Clear;
             qryContabil.Post;
           end;
        end;

        if not FuncaoGeral.TestaContaxCC(sPlano,Sistema.IdEmpresa,qryContabilCODCENTROCUSTO.asString,qryContabilPLACONTA.asString,true) then Exit;

        if qryContabilLACDEBCRE.asString = 'D' then
           rTotalContab   := rTotalContab   +  qryContabilLACVALOR.asFloat
        else
           rTotalContab   := rTotalContab   - qryContabilLACVALOR.asFloat;

        if qryContabilPLACONTA.asString = sContaCliFor then
        begin
           sCCustoCliFor:=qryContabilCODCENTROCUSTO.asString;
           if qryContabilLACDEBCRE.asString = 'D' then
              rValorCliFor  := rValorCliFor + qryContabilLACVALOR.asFloat
           else
              rValorCliFor  := rValorCliFor - qryContabilLACVALOR.asFloat;
        end;

        if Integraback.recpag='P' then
        begin
        end
        else
        begin
        end;


        qryContabil.Next;
     end;
     if Format('%17.2f',[rTotalContab]) <> Format('%17.2f',[Modulo.ValorZero]) then
     begin
       MsgDlg('Total do Débito não bate com o Total do Crédito na Contabilização. Verifique','Erro',mtError,[mbOk],0);
       exit;
     end;

     if Format('%17.2f',[rValorCliFor]) <> Format('%17.2f',[rValorCheckForCli]) then
     begin

       if cbLancaBaixa.Checked then
          sNomeConta := 'Banco'
       else
         if IntegraBack.RecPag = 'R' then
            sNomeConta := 'Cliente'
         else
            sNomeConta := 'Favorecido';

       MsgDlg('O valor contabilizado na conta do ' + sNomeCOnta + ' deve ser igual ao valor do lançamento. Verifique','Erro',mtError,[mbOk],0);

       exit;
     end;
  end;

  if sbtnInserir.Down then
  begin
     bDuplicado:=Documento.ValidaNumDoc(qryAuxFuncao,IntegraBack.RecPag,qryIDFORCLI.asInteger,
                 StrToFloat(qryNODOCUMENTO.asString),qryCOMPLDOCUMENTO.asString,iCodDoCumento,ifSubConta,ifPlano,sfPlaConta,sfCentroCusto);
     if bDuplicado = true then
     begin
        MsgDlg('Já existe um documento lançado com este número. Verifique','Erro',mtError,[mbOk],0);
        if dbenNumDoc.CanFocus then
           dbenNumDoc.SetFocus
        else
           if DbeNoDocumento.CanFocus then
              DbeNoDocumento.SetFocus;
        exit;
     end;
  end;

  //Move Para Rateio
  bMoveTab := true;
  tbcDetalhe.TabIndex:=0;
  tbcDetalheChange(Sender);

  Inherited;

  dblcTipoRD.Enabled := false;

  if sbtnInserir.Down then
  begin
   //StgAlteradores.RowCount := 2;

   //For iGrid := 1 To 6 Do
   //    sTgAlteradores.Cells[iGrid,1] := '';

   sbtnInsDet.Down := true;
   rValorEdit := 1;
   bValida := false;
   bValida := true;
   if (CmpForCli.CanFocus) then
     CmpForCli.SetFocus;
  end;
end;

procedure TfrmLancDocCAPCAR.FormCreate(Sender: TObject);
begin
  if IntegraBack.RecPag = 'P' then
    EdtAutorizaAlteracao.RegPath := 'Software\CM\Contas a Pagar'
  else
    EdtAutorizaAlteracao.RegPath := 'Software\CM\Contas a Receber';

  EdtAutorizaAlteracao.Refresh;

  if (EdtAutorizaAlteracao.Text = '') then
    EdtAutorizaAlteracao.Text := 'N';

  qryaux.sql.clear; 
  qryaux.sql.add('select idcidades,idpais,codestado from pessoa p, endpess e'+
                  ' where p.idpessoa='+Inttostr(sistema.IdEmpresa)+ ' and '+
                  ' p.idendcomercial=e.idendereco');
  qryaux.open;
  if not qryaux.eof then
  begin
    idcidade  := qryaux.fieldbyname('idcidades').asInteger;
    idpais    := qryaux.fieldbyname('idpais').asInteger;
    codestado := qryaux.fieldbyname('codestado').asString;
  end;
  qryaux.Close;
  qryaux.sql.clear;

  DbeNoDocumento.Visible := (Trim(IntegraBack.MascaraNoDocum) <> '');
  dbenNumDoc.Visible     := not DbeNoDocumento.Visible;

  if DbeNoDocumento.Visible then
     qryNUMFATURA_1.EditMask :=  IntegraBack.MascaraNoDocum + ';1; ';

  dbeCompl.ReadOnly := IntegraBack.AssociaComplTipoFat;

  ExibeStatusDoc(false);

  iModulo:=0;
  inherited;
  ImpostoRetido := TImpostoRetido.Create;
  orcamentoBack := TorcamentoBack.Create;
  AvaliForn     := TAvaliForn.Create;

  cbIntegra.Checked := (IntegraBack.Contabilidade <> 'S');
  cbIntegra.Enabled := (IntegraBack.Contabilidade  = 'S');

  GpDotorc.Enabled := ((IntegraBack.Integraorcamento = 'S') AND (IntegraBack.RecPag = 'P'));
  GpBarras.Visible := (IntegraBack.RecPag = 'P');
  GpConta.Visible  := (IntegraBack.RecPag = 'P');

  if (GpDotorc.Enabled) then
    MsResORc.Filtro.Add('RESERVAORCAMEN.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  sPlano            := IntegraBack.Plano;
  CContabil.Plano   := sPlano;
  CContabil.Mascara := IntegraBack.MascaraPlano;
  sDataLancamento   := DateToStr(Date);
  iCodTipDoc        := 0;
  pnlMestre.Enabled := false;

  //sTgAlteradores.Cells[1,0] := 'Alterador';
  //sTgAlteradores.Cells[2,0] := 'Data Lcto';
  //sTgAlteradores.Cells[3,0] := 'Valor Outra Moeda';
  //sTgAlteradores.Cells[4,0] := 'Valor Moeda Corrente';
  //sTgAlteradores.Cells[5,0] := 'Valor Liquido';
  //sTgAlteradores.Cells[6,0] := 'Descricao';

  iCodLancCAPCAR := 0;
  iCodLancContab := 0;

  MontaSelect.Filtro.Add('TIPODOCRECPAG.RECPAG = '+QuotedStr(IntegraBack.RecPag));
  MontaSelect.Filtro.Add('DOCUMENTO.IDMODULO   = '+IntToStr(Sistema.IdModulo));
  MontaSelect.Filtro.Add('DOCUMENTO.RECPAG     = '+QuotedStr(IntegraBack.RecPag));
  MontaSelect.Filtro.Add('DOCUMENTO.IDPESSOA   = '+IntToStr(Sistema.idempresa));
  MontaSelect.Filtro.Add(
    'TIPODOCRECPAG.CODTIPDOC In (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG = '+
    QuotedStr(IntegraBack.RecPag) + ' and not exists (select 1 from UsuarioxTpdocto b '+
    'where (recpag = '+QuotedStr(Integraback.recpag)+') and (b.idusuario = ' +
    Inttostr(sistema.IdUsuario)+')) union SELECT CODTIPDOC FROM TIPODOCRECPAG a '+
    'WHERE (a.RECPAG = ' +QuotedStr(IntegraBack.RecPag)+ ') and exists (select 1 from '+
    'UsuarioxTpdocto b where (recpag = '+QuotedStr(Integraback.recpag)+
    ') and (a.codtipdoc = b.codtipdoc) and (b.idusuario = ' + Inttostr(sistema.idusuario)+')))');

  if (Modulo.PrevEfet = 'P') then
    MontaSelect.Filtro.Add('DOCUMENTO.OPERACAO = ''11'' OR DOCUMENTO.OPERACAO = ''12''')
  else
  if (Modulo.PrevEfet = 'A') then
    MontaSelect.Filtro.Add('DOCUMENTO.OPERACAO = ''14'' OR DOCUMENTO.OPERACAO = ''15''')
  else
    MontaSelect.Filtro.Add('DOCUMENTO.OPERACAO = ''1''  OR DOCUMENTO.OPERACAO = ''2'' OR DOCUMENTO.OPERACAO = ''10''');
  
  FazerQryPrIncipal;
  iModulo := qryIDMODULO.asInteger;
  SelecionaFilhos;

  if Modulo.PrevEfet = 'E' then
  begin
     if IntegraBack.RecPag = 'R' then
        Caption := 'Lançamento de Documentos no Contas a Receber'
     else
        Caption := 'Lançamento de Documentos no Contas a Pagar';
  end
  else
  begin

     if Modulo.PrevEfet = 'P' then
     begin
       lblEmissao.Caption := 'Início';
       lblData.Caption    := 'Quebra';
     end;

     if IntegraBack.RecPag = 'R' then
     begin
        qryDetDESCRICAO.DisplayLabel := 'Recebimento';
        qryDetNOME.DisplayLabel      := 'Projeto';

        if Modulo.PrevEfet = 'A' then
           Caption  := 'Lançamento de Adiantamento no Contas a Receber'
        else
           Caption  := 'Lançamento de Previsões no Contas a Receber';
     end
     else
     begin
       qryDetDESCRICAO.DisplayLabel := 'Desembolso';
       qryDetNOME.DisplayLabel      := 'Atividade';
     end;
     cbIntegra.Checked:=true;
  end;

  CmpForCli.Mensagens.EmBranco := CmpForCli.Caption + CmpForCli.Mensagens.EmBranco;
  CmpForCli.Mensagens.NaoExiste:= CmpForCli.Caption + CmpForCli.Mensagens.NaoExiste;

  QryFormaPag.ParamByName('PRECPAG').asString  := IntegraBack.RecPag;
  QryFormaPag.ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
  QryFormaPag.OPen;

  FazQuery(QryCentroCusto,'SELECT DISTINCT CODCENTROCUSTO, NOME, STATUSGRUPOCDC, IDPROGRAMA FROM CENTCUST WHERE 1=2');

  //Inclusão da Informações de plano, patrocInadora, program e Imóvel para previdência privada
  if (UpperCase(IntegraBack.TipoEmpresa) = 'P') then
  begin
     //if Sistema.UsaPlanoPatro then
     //   TbsPrevidencia.PageIndex := 0
     //else
     //   TbsPrevidencia.PageIndex := 1;

     PnlPrograma.Visible := true;
     PnlRateioGeral.Parent := TbsRateioGeral;
     QryPlanoPrev.Open;
     QryProgramaPrev.Open;
     QryPatroPrev.Open;
  end
  else
  begin
    PnlRateioGeral.Parent      := pnlControlesDet;
    qryDetNUMIMOVEL.Visible    := false;
    qryDetNOMEPATRO.Visible    := false;
    qryDetDESCPLANO.Visible    := false;
    qryDetDESCPROGRAMA.Visible := false;
    PnlPrograma.Visible := false;
  end;

  PageRateioPrev.Visible := (PnlRateioGeral.Parent = TbsRateioGeral);

  sbtnAlternarTipoDoc.Visible := (Sistema.IdModulo = PROCJUD) or (Sistema.IdModulo = MODAUTO);

  case (Sistema.IdModulo) of
    MODAUTO  : HelpContext := 4170023;
    MODCON   : HelpContext := 760022;
    MODFOL   : HelpContext := 210069;
    PROCJUD  : HelpContext := 1100016;
    PROCPREV : HelpContext := 1100016;
  end;
end;

procedure TfrmLancDocCAPCAR.FormActivate(Sender: TObject);
var
  ssql :string;
begin
  Inherited;

  if (not IntegraBack.TipoOper) and (IntegraBack.Contabilidade = 'S') then
  begin
    QryTipOper.Close;
    MsgDlg('Para ter este sistema Integrado com a Contabilidade é necessário cadastrar o Tipo de Operação 03 no GlobalCM. Caso este código não seja cadastrado, este sistema não aceitará nenhum lançamento.','Atenção',mtWarnIng,[mbOk],0);
    Close;
    Exit;
  end;

  if QryAlt.Active then QryAlt.Close;
  QryAlt.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
  QryAlt.ParamByName('RECPAG').asString := IntegraBack.RecPag;
  QryAlt.Open;

  if IntegraBack.RecPag = 'R' then
  begin
  ssql:='  SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, '+
        '  FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG a '+
        ' WHERE a.RECPAG =  ''R'''+
        ' and not exists (select 1 from UsuarioxTpdocto b where recpag='+#39+Integraback.recpag+#39+' and b.idusuario='+Inttostr(sistema.IdUsuario)+') '+
        ' union SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, '+
        ' FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG a '+
        ' WHERE a.RECPAG =  ''R'' and  exists '+
        ' (select 1 from UsuarioxTpdocto b where recpag='+#39+Integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc  '+
        ' and b.idusuario='+Inttostr(sistema.IdUsuario)+') ORDER BY DEBCRE DESC,DESCRICAO  ';
  end
  else
  begin
  ssql:='  SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, '+
        '  FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG a '+
        ' WHERE a.RECPAG =  ''P'''+
        ' and not exists (select 1 from UsuarioxTpdocto b where recpag='+#39+Integraback.recpag+#39+' and b.idusuario='+Inttostr(sistema.IdUsuario)+') '+
        ' union SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, '+
        ' FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG a '+
        ' WHERE a.RECPAG =  ''P'' and  exists '+
        ' (select 1 from UsuarioxTpdocto b where recpag='+#39+Integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc  '+
        ' and b.idusuario='+Inttostr(sistema.IdUsuario)+') ORDER BY DEBCRE DESC,DESCRICAO  ';
  end  ;

  FazQuery(qryTipoDoc,ssql);

  FazQuery(qryPortForma,'SELECT CODPORTFORMA, CODCENTROCUSTO, PLANO, PLACONTA, LANCAFINANC, DMAIS, DESCRICAO, CODARQUIVOREMESSA, CODFORMAPAGTO ' +
                        'FROM PORTADORFORMA WHERE IDPESSOA = '+InttoStr(Sistema.idempresa)+' AND RECPAG = '''+IntegraBack.RecPag+''' ORDER BY DESCRICAO');

  if qryMoeda.Active then qryMoeda.Close;
  QryMoeda.Open;

  sNomeCentroRespon := '';
  sCodCentroRespon  := '';

  (*
  if not FazQuery(qryCentroRespon,'SELECT CODCENTRORESPON,NOME,ANALITICOSINTET, CODCENTROCUSTO FROM CENTRESPON WHERE IDPESSOA = '+InttoStr(Sistema.idempresa)+' AND CODCENTRORESPON <> ''9999999999'' and ativo=''S'' ORDER BY CODCENTRORESPON,ANALITICOSINTET,NOME') then
  begin
    FazQuery(qryCentroRespon,'SELECT CODCENTRORESPON,NOME,ANALITICOSINTET, CODCENTROCUSTO FROM CENTRESPON WHERE IDPESSOA = '+InttoStr(Sistema.idempresa)+' AND CODCENTRORESPON = ''9999999999''  and ativo=''S''');

    sNomeCentroRespon :=qryCentroResponNOME.asString;
    sCodCentroRespon  :=qryCentroResponCODCENTRORESPON.asString;

    FazQuery(qryCentroRespon,'SELECT CODCENTRORESPON,NOME,ANALITICOSINTET, CODCENTROCUSTO FROM CENTRESPON WHERE (IDPESSOA = '+InttoStr(Sistema.idempresa)+') AND (CODCENTRORESPON <> ''9999999999'')  and ativo=''S'' ORDER BY CODCENTRORESPON,ANALITICOSINTET,NOME');
  end;
  *)

  if not FazQuery(qryCentroRespon,
    'SELECT CEN.CODCENTRORESPON,CEN.NOME,CEN.ANALITICOSINTET,CEN.CODCENTROCUSTO '+
    'FROM CENTRESPON CEN, PESSOAXCRESP PES '+
    'WHERE (CEN.IDPESSOA = '+InttoStr(Sistema.idempresa)+') AND '+
    '(CEN.CODCENTRORESPON <> ''9999999999'') AND '+
    '(CEN.ATIVO=''S'') AND '+
    '(CEN.CODCENTRORESPON=PES.CODCENTRORESPON) AND '+
    '(PES.IDPESSOAACESSO='+InttoStr(Sistema.IdUsuario)+') '+
    'ORDER BY CEN.CODCENTRORESPON,CEN.ANALITICOSINTET,CEN.NOME') then
  begin
    FazQuery(qryCentroRespon,'SELECT CODCENTRORESPON,NOME,ANALITICOSINTET, CODCENTROCUSTO FROM CENTRESPON WHERE IDPESSOA = '+InttoStr(Sistema.idempresa)+' AND CODCENTRORESPON = ''9999999999''  and ativo=''S''');

    sNomeCentroRespon :=qryCentroResponNOME.asString;
    sCodCentroRespon  :=qryCentroResponCODCENTRORESPON.asString;

    FazQuery(qryCentroRespon,
      'SELECT CEN.CODCENTRORESPON,CEN.NOME,CEN.ANALITICOSINTET,CEN.CODCENTROCUSTO '+
      'FROM CENTRESPON CEN '+
      'WHERE (CEN.IDPESSOA = '+InttoStr(Sistema.idempresa)+') AND '+
      '(CEN.CODCENTRORESPON <> ''9999999999'') AND '+
      '(CEN.ATIVO=''S'') '+
      'ORDER BY CEN.CODCENTRORESPON,CEN.ANALITICOSINTET,CEN.NOME');
  end;

  qryUnidNegoc.Close;
  qryUnidNegoc.ParamByName('PIDPESSOA').asFloat := Sistema.idempresa;
  qryUnidNegoc.Open;

  qryUnidNegocUNECODIGO.EditMask := IntegraBack.MascaraUnidNegoc + ';0;_';
  qryCentroResponCODCENTRORESPON.EditMask := IntegraBack.MascaraCr + ';0;_';

  if (IntegraBack.Contabilidade = 'S') then
  begin
     FazQuery(qrySubContaForCli,
       'SELECT '+
         'NOMESUBCONTA, '+
         'CODSUBCONTA '+
       'FROM '+
         'SUBCONTA '+
       'WHERE '+
         '(IDPESSOA = '+IntToStr(Sistema.Idempresa)+') '+
       'ORDER BY NOMESUBCONTA');
     if not cbIntegra.Checked then
     begin
       tbsContabil.Enabled := true;
       FazQuery(qrySubConta,
         'SELECT '+
           'NOMESUBCONTA, '+
           'CODSUBCONTA '+
         'FROM '+
           'SUBCONTA '+
         'WHERE '+
           '(IDPESSOA = '+IntToStr(Sistema.Idempresa)+') '+
         'ORDER BY NOMESUBCONTA');
     end
     else
       tbsContabil.Enabled := false;
  end
  else
  begin
    tbsContabil.Enabled := false;
    CmbSubConta.Enabled := false;
  end;

  if Modulo.PrevEfet = 'P' then 
  begin
     cbIntegra.Enabled:=false;
     cbLancaBaixa.Enabled:=false;
  end
  else
     if Modulo.PrevEfet = 'A' then
     begin
        cbEnglobParc.Enabled:=false;
        cbLancaBaixa.Enabled:= true;
        cbIntegra.Enabled:=false;
     end;
end;

procedure TfrmLancDocCAPCAR.tbcDetalheChange(Sender: TObject);
begin
  if (tbcDetalhe.TabIndex = 3) then
  begin
    if (not sbtnInserir.Down) or (Modulo.PrevEfet <> 'E') then
    begin
       tbcDetalhe.TabIndex := 0;
       pgctrlDetalhe.ActivePage := tbsDet;
       tbcDetalhe.TabIndex:=0;
       tbcDetalheChange(Self);
    end;
  end;

  if (tbcDetalhe.TabIndex = 0) and bMoveTab then
  begin
    pgctrlDetalhe.ActivePage:= TbsDet;
     bMoveTab := false;
  end;

  if (tbcDetalhe.TabIndex = 1) and bMoveTab then
  begin
     pgctrlDetalhe.ActivePage:= tbsContabil;
     bMoveTab := false;
  end;

  Inherited;

  if (IntegraBack.Contabilidade = 'S') and
     ((qryIDMODULO.asInteger = 3) or
     (qryIDMODULO.asInteger = 4)) and
     (qry.State In ([dsInsert,dsEdit])) then
  begin
     FazContabilizacao;
     CmeDetalhe.AtualizaBotoes(Self);
  end;

  if ((IntegraBack.Contabilidade <> 'S') or
      (cbIntegra.Checked = true)) and
      (qry.State In ([dsInsert,dsEdit])) then
  begin
      if tbcDetalhe.TabIndex = 1 then
      begin
         pgctrlDetalhe.ActivePage := tbsLancamento;
         tbcDetalhe.TabIndex:=2;
         tbcDetalheChange(Self);
      end;
  end;
end;

procedure TfrmLancDocCAPCAR.dbeValorMoedaExit(Sender: TObject);
begin
  Inherited;
  dbeValorCorrente.Value:=dbeValorMoeda.Value*rValorCotacao;
end;

procedure TfrmLancDocCAPCAR.dbeValorMoedaDetExit(Sender: TObject);
begin
  Inherited;
  dbeValorDet.Value:=dbeValorMoedaDet.Value*rValorCotacao;
end;

procedure TfrmLancDocCAPCAR.dblcUnidNegocExit(Sender: TObject);
begin
  Inherited;
  if QryDet.State In [DsEdit, DsInsert] then
  begin
     if qryMOECODIGO.asInteger <> 0 then
     begin
        qrydetMOECODIGO.asInteger:=qryMOECODIGO.asInteger;
        dbeValorMoedaDet.Enabled := true;
        dbeValorDet.Enabled := false;
     end
     else
     begin
        dbeValorMoedaDet.Enabled := false;
        dbeValorDet.Enabled := true;
     end;

     if (Trim(dblcUnidNegoc.Text)<>'') and  (ActiveControl.Tag <> 9999) and (qryUnidNegocUNETIPO.asString <> 'A') then
     begin
        MsgDlg('Atividade\Projeto tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
        if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
     end;

     ativproj:=qryUnidNegocUNIDNEGOC.asString;
  end;
end;

procedure TfrmLancDocCAPCAR.dblcCCustoEnter(Sender: TObject);
begin
  Inherited;
  FazQuery(qryCCusto,'SELECT CENT.CODCENTROCUSTO,CENT.NOME FROM CENTCUST CENT '+
                     'WHERE CENT.ATIVO = ''S'' AND CODCENTROCUSTO IN (SELECT CODCENTROCUSTO FROM CONTASxCC CONT '+
                     'WHERE CONT.IDEMPRESA = CENT.IDEMPRESA   AND '+
                     '      CONT.CODCENTROCUSTO= CENT.CODCENTROCUSTO   AND ' +
                     '      CONT.IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa) + ' AND ' +
                  //   '      CONT.PLANO = ' + InttoStr(sPlano) + ' AND ' +
                     '      CONT.PLANO = ' + qryTipoRDPLANO.asString + ' AND ' +
                     '      CONT.PLACONTA = '''+ CContabil.Conta.Numero + ''')');
end;

procedure TfrmLancDocCAPCAR.reValorMoedaConExit(Sender: TObject);
begin
  Inherited;
  reValorCorrenteCon.Value:=reValorMoedaCon.Value*rValorCotacao;
end;

procedure TfrmLancDocCAPCAR.bbtnCancelarClick(Sender: TObject);
begin
  SetaCentResponDesemb(-1,true);

  if not sbtnInsDet.Enabled then bbtnCancelarDetClick(Self);


  pnlMestre.Enabled:=false;

  Inherited;
end;

procedure TfrmLancDocCAPCAR.sbtnEstornarClick(Sender: TObject);
begin
{  tpdesmb   := ''; // ECF
  ativproj  := '';
  cccusto   := '';
  crespom   := '';
  splano:=qryPLANO.asInteger;
  if not qryCODDOCUMENTO.isNull then
     if ConfereSaldo(qryCODDOCUMENTO.asInteger,true) then Exit;
  Inherited;
  if qryESTORNO.asInteger <> 0 then
  begin
     MsgDlg('Este Lançamento foi estornado ou é um estorno. Proibido estornar outra vez.','Erro',mtError,[mbOk],0);
     sbtnEstornar.Down:=false;
     exit;
  end;

  frmEstornoCAPCAR:=TfrmEstornoCAPCAR.Create(Self);
  frmEstornoCAPCAR.liCodAnterior := iCodLancCAPCAR;
  frmEstornoCAPCAR.liNumLanc := 0;

  if (frmEstornoCAPCAR.ShowModal = mrOk) and (Modulo.PrevEfet = 'E') then
  begin
    try
      ImpostoRetido.CodDocumento := qryCODDOCUMENTO.asInteger;
      ImpostoRetido.NumLancto    := 0;
      ImpostoRetido.Excluir;
    except
      On E:exception Do
      MsgDlg('Erro ao Excluir Imposto.' + (#13+#10) + E.Message,'Erro',mtError,[mbOk],0);
    end;
  end;

  //FazerQryPrIncipal;
  sbtnEstornar.Down:=false;
  CmeCadastro.Find(Self);
}
end;

procedure TfrmLancDocCAPCAR.dblcMoedaExit(Sender: TObject);
begin
  Inherited;
  if not qryMOECODIGO.isNull then
  begin
     rValorCotacao:=FuncaoGeral.TestaCotacaoMoeda(qryMOECODIGO.asInteger,dbeDataLanc.Text,'S');
     if  (rValorCotacao = 0) then
     begin
        if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
        exit;
     end;
     dbeValorMoeda.Enabled:=true;
     dbeValorCorrente.Enabled:=false;
  end
  else
  begin
     dbeValorMoeda.Enabled:=false;
     dbeValorCorrente.Enabled:=true;
  end;
end;

procedure TfrmLancDocCAPCAR.dbeDataVencExit(Sender: TObject);
begin
  Inherited;
  if sbtnInserir.Down = true then
  begin
    //maria 08/2000
     if idcidade <> 0 then
       if not diasuteis.DiaUtil(dbeDataVenc.Date,idcidade,idpais,codestado,true,false,false) then
       begin
         if (Application.MessageBox('Data de vencimento não é um dia útil. Deseja alterar ?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
         begin
            if (Application.MessageBox('Lançar para o primeiro dia útil posterior?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
              dbeDataVenc.Date:=diasuteis.PrimeiroDiaUtilPosterior(dbeDataVenc.Date,idcidade,idpais,codestado,true,false,false)
            else
              dbeDataVenc.Date:=diasuteis.UltDiaUtilAnterior(dbeDataVenc.Date,idcidade,idpais,codestado,true,false,false);
         end;
      end;

     qryDATAPROGRAMADA.AsDateTime := strtodate(dbeDataVenc.text);
     dbeDataProgr.text := dbeDataVenc.text;
  end;
end;

(*procedure TfrmLancDocCAPCAR.ExecutaPrevAdianto;
var sSql: string;
begin
  if IntegraBack.RecPag = 'P' then
     sSql := ' Select D.NODOCUMENTO, D.DATAPROGRAMADA, L.VALOR, D.OPERACAO '+
             ' From Documento D, Pessoa P, LancToDocum L '+
             ' Where D.CodDocumento = L.CodDocumento '+
             ' and (D.IdPessoa = ' + IntToStr(Sistema.idEmpresa) + ') '+
             ' and (D.IdForCli = ' + IntToStr(CmpForCli.ForCliReg.Id)  + ') '+
             ' and (D.IdForCli = P.IdPessoa) '+
             ' and (D.Operacao IN (''11'',''12'',''13'',''15'')) '+
             ' and (D.RecPag = '''+ IntegraBack.RecPag +''') '+
             ' and ((D.Status <> ''2'') or (D.Status is Null)) ' +
             'UNION ' +
             ' Select D.NODOCUMENTO, D.DATAPROGRAMADA, L.VALOR, D.OPERACAO '+
             ' From Documento D, Pessoa P, LancToDocum L '+
             ' Where D.CodDocumento = L.CodDocumento '+
             ' and (D.IdPessoa = ' + IntToStr(Sistema.idEmpresa) + ') '+
             ' and (D.IdForCli IN (SELECT IDPESSOA FROM FORNXRAMO WHERE IDRAMOFORNECEDOR = ' + IntToStr(Modulo.RamoFornAdianto) + ')) ' +
             ' and (D.IdForCli = P.IdPessoa) '+
             ' and (D.Operacao IN (''11'',''12'',''13'',''15'')) '+
             ' and (D.RecPag = '''+ IntegraBack.RecPag +''') '+
             ' and ((D.Status <> ''2'') or (D.Status is Null)) '

  else
  BEgIn
     sSql := ' Select D.NODOCUMENTO, D.DATAPROGRAMADA, L.VALOR, D.OPERACAO '+
             ' From Documento D, Pessoa P, LancToDocum L '+
             ' Where D.CodDocumento = L.CodDocumento '+
             ' and (D.IdPessoa = ' + IntToStr(Sistema.idEmpresa) + ') '+
             ' and (D.IdForCli = ' + IntToStr(CmpForCli.ForCliReg.Id)  + ') '+
             ' and (D.IdForCli = P.IdPessoa) '+
             ' and (D.Operacao IN (''11'',''12'',''13'',''15'')) '+
             ' and (D.RecPag = '''+ IntegraBack.RecPag +''') '+
             ' and ((D.Status <> ''2'') or (D.Status is Null)) ' +
             ' UNION '+
             ' Select D.NODOCUMENTO, D.DATAPROGRAMADA, L.VALOR, D.OPERACAO '+
             ' From Documento D, LancToDocum L, CLIENTEPESS C '+
             ' Where D.CodDocumento = L.CodDocumento '+
             ' and (D.IdPessoa = '+ IntToStr(Sistema.idEmpresa)+ ') '+
             ' and (C.IDTIPOCLIENTE = ' + IntToStr(Modulo.IdTipocliAdianto) + ') '+
             ' and (D.IdForCli = C.IdPessoa) '+
             ' and (D.Operacao IN (''11'',''12'',''13'',''15'')) '+
             ' and (D.RecPag = '''+ IntegraBack.RecPag +''') '+
             ' and ((D.Status <> ''2'') or (D.Status is Null)) ';
  end;

{  if FazQuery(QryAux,sSql) then  //ECF
     if (Application.MessageBox('Existe adiantamento\previsão pendente. Deseja regularizar agora ?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
       AbrirFormModal(FRmRegPrevAdianto,TFRmRegPrevAdianto)
     else }
        IdForCliAdianto := 0;
end;*)

procedure TfrmLancDocCAPCAR.IncluiContabilidade;
var
  sMens,
  sHisto1,
  sHisto2,
  sHisto3,
  sHisto4,
  sHisto5,
  sHistorico: strIng;
begin
  if (IntegraBack.Contabilidade = 'S') and
     (cbIntegra.checked) and
     (not bIntegraChecked) and
     (iPlnCodigoOri > 0) then
  begin
    iPlncodigo := iPlnCodigoOri;

    if  Modulo.ExcluiPlanil then
      if not ExecutarQuery(DtmBaseDados.Qry,
                          'UPDATE '+
                            'LANCTODOCUM '+
                          'SET '+
                            'PLNCODIGO = NULL '+
                          'WHERE PLNCODIGO = '+IntToStr(iPlnCodigo)) then
        raise EDataBaseError.Create('Erro ao limpar Planilha do Lançamento do documento');

    if ExcluiLanc(true,
                  iPlncodigo,
                  'BASEDADOS',
                  IntToStr(Sistema.idModulo),
                  sPlano,
                  Sistema.idEmpresa,
                  Sistema.idUsuario,
                  true,
                  0,
                  IntegraBack.MascaraPlano) <> 0 then
    begin
      iPlnCodigo := -1;
      exit;
    end
    else
      iPlncodigo := 0;
  end;

  if (IntegraBack.Contabilidade = 'S') and
     (not cbIntegra.Checked) and
     ((qryIDMODULO.asInteger = 3) or
      (qryIDMODULO.asInteger = 4)) then
  begin
    iPlnCodigo := iPlnCodigoOri;
    if iPlnCodigo > 0 then
    begin
      if  Modulo.ExcluiPlanil then
        if not ExecutarQuery(DtmBaseDados.Qry,
                             'UPDATE '+
                               'LANCTODOCUM '+
                             'SET '+
                               'PLNCODIGO = NULL '+
                             'WHERE '+
                               'PLNCODIGO = '+IntToStr(iPlnCodigo)) then
          raise EDataBaseError.Create('Erro ao limpar Planilha do Lançamento do documento');

      if ExcluiLanc(true,
                    iPlncodigo,
                    'BASEDADOS',
                    IntToStr(Sistema.idModulo),
                    sPlano,
                    Sistema.idEmpresa,
                    Sistema.idUsuario,
                    Modulo.ExcluiPlanil,
                    0,
                    IntegraBack.MascaraPlano) <> 0 then
      begin
        iPlnCodigo := -1;
        exit;
      end;
    end;

    if (Modulo.ExcluiPlanil) and
       (CmeCadastro.Operacao = Opalterar) then
      iPlnCodigo := 0;

    qryContabil.First;
    if (not qryContabil.Eof) then
    begin
      qryContabil.First;
      liRetFuncao :=
        TestaPeriodo(
          true,
          'BaseDados',
          qryDATALANCTO.asString,
          IntToStr(Sistema.IdModulo),
          liExercicio,
          liPeriodo,
          liEmpresa,
          sMens);
      if liRetFuncao <> 0 then
      begin
        iPlnCodigo:=-1;
        exit;
      end;

      qryContabil.First;
      while (not qryContabil.EOF) do
      begin
        if trim(qryContabilUNIDNEGOC.asString) = '' then
          sUnidNegoc:= IntToStr(IntegraBack.uNidNegoc)
        else
          sUnidNegoc:=qryContabilUNIDNEGOC.asString;
        if qryContabilLACDEBCRE.asString = 'D' then
        begin
          cCCustd      := qryContabilCODCENTROCUSTO.asString;
          cContad      := qryContabilPLACONTA.asString;
          rValHistDed  := qryContabilLACVALHIST.asFloat;
          ssubconta    := qryContabilCODSUBCONTA.asString;
          cCCustc      := '';
          cContac      := '';
          rValHistCre  := 0;
          ssubcontacre := '';
        end
        else
        begin
          cCCustd      := '';
          cContad      := '';
          rValHistDed  := 0;
          ssubconta    := '';
          cCCustc      := qryContabilCODCENTROCUSTO.asString;
          cContac      := qryContabilPLACONTA.asString;
          rValHistCre  := qryContabilLACVALHIST.asFloat;
          ssubcontacre := qryContabilCODSUBCONTA.asString;
        end;

        sHistorico :=
          qryContabilLACHIST1.asString +
          qryContabilLACHIST2.asString +
          qryContabilLACHIST3.asString +
          qryContabilLACHIST4.asString +
          qryContabilLACHIST5.asString;

        FuncaoGeral.ArrumaHistorico(
          sHistorico,
          sHisto1,
          sHisto2,
          sHisto3,
          sHisto4,
          sHisto5);

        iPlnCodigo :=
          LANCACONTAB(
            true,
            'BASEDADOS',
            qryDATALANCTO.asString,
            IntToStr(Sistema.IdModulo),
            qryContabilLACTIPO.asString,
            qryContabilLACDEBCRE.asString,
            '', '', '', '', '', '', '', '', '', '',
            qryContabilLACNUMDOC.asString,
            sHisto1, sHisto2, sHisto3, sHisto4, sHisto5,
            '03',
            cCCustD, cContaD, cCCustC, cContaC,
            liExercicio, liPeriodo, liEmpresa,
            Sistema.IdUsuario,
            sPlano,
            qryContabilLACVALOR.asFloat,
            0, 0, 0, 0, 0, 0, 0, 0,
            sUnidNegoc,
            false,
            rValHistDed, rValHistCre,
            ssubconta,
            ssubcontacre,
            '', '',
            iPlnCodigo,
            sMens,
            IntegraBack.MascaraPlano,
            true,
            0,
            qryContabilIDPLANOPREV.asInteger,
            qryContabilIDPATRO.asInteger,
            Sistema.UsaPlanoPatro);

        if iPlnCodigo <= 0 then
          exit;
        qryContabil.Next;
      end;
    end;
  end;
end;

function TfrmLancDocCAPCAR.FazerQryPrIncipal:boolean;
begin
   if Qry.Active then Qry.Close;
   if not Qry.Prepared then Qry.Prepare;
   Qry.Params[0].asFloat := iCodLancCAPCAR;
   Qry.Open;
   Result := not Qry.IsEmpty;
end;

procedure TfrmLancDocCAPCAR.sbtnInserirClick(Sender: TObject);
begin
  tpdesmb  :='';
  ativproj := '';
  cccusto  :='';
  crespom  :='';
  splano:=Integraback.plano;
  bMoveTab := true;
  tbcDetalhe.TabIndex:=0;
  tbcDetalheChange(Sender);
  dblcTipoRD.Enabled := false;
  Inherited;
  rValorEdit := 1;
  bValida := false;
  bValida := true;
  sbtnInsDet.Click;
  sbtnInsDet.Down := true;
end;

procedure TfrmLancDocCAPCAR.bbtnOkDetClick(Sender: TObject);
begin
  if (tbcDetalhe.TabIndex = 3) then
  begin
     if TestaAlterador then
        AtualizaSaldo
     else
        Exit;
  end;

  Inherited;

  if tbcDetalhe.TabIndex = 0 then
  begin
     dbeValorDet.Value := rValorEdit;
     if Format('%17.2f',[dbeValorDet.Value])=Format('%17.2f',[Modulo.ValorZero]) then
        bbtnVoltarDet.Click;
  end;
end;

procedure TfrmLancDocCAPCAR.bbtnCancelarDetClick(Sender: TObject);
begin
  if (tbcDetalhe.TabIndex = 0) and (rValorEdit > 0) then
     rValorEdit := rValorEdit - qrydetVALOR.asFloat;

  Inherited;

  if (tbcDetalhe.TabIndex = 3) then AtualizaSaldo;
end;

procedure TfrmLancDocCAPCAR.bbtnVoltarDetClick(Sender: TObject);
begin
  Inherited;
  if (tbcDetalhe.TabIndex = 3) then AtualizaSaldo;
end;

procedure TfrmLancDocCAPCAR.sbtnInsDetClick(Sender: TObject);
begin
  Inherited;

  if (tbcDetalhe.TabIndex = 0) and (rValorEdit = 0) then
  begin
     MsgDlg('O Total do Rateio Já Foi Fechado!','Erro',mtError,[mbOk],0);
     bbtnCancelarDet.Click;
  end;

end;

procedure TfrmLancDocCAPCAR.sbtnAltDetClick(Sender: TObject);
begin
  Inherited;

  if tbcDetalhe.TabIndex = 0 then
  begin
     if PnlRateioGeral.Visible then
        PageRateioPrev.ActivePage := TbsRateioGeral;

     if QryDet.State <> DsEdit then QryDet.Edit;

     if (rValorEdit <> 0) and (QryDet.State = DsInsert) then
     begin
        rValorEdit := (rValorEdit + qrydetVALOR.asFloat);
        dbeValorDet.Value := rValorEdit
     end
     else
     begin
        rValorEdit := qrydetVALOR.asFloat;
        dbeValorDet.Value := qrydetVALOR.asFloat;
     end;

     MontaCentroDeCusto;
  end;
end;

procedure TfrmLancDocCAPCAR.LancaAlteradores;
var
  liPlanilha: integer;
begin
   try
      Documento.Operacao     := '4';
      Documento.CodDocumento := iCodLancCAPCAR;

      qryAlteradores.First;
      while not qryAlteradores.Eof Do
      begin
         Documento.NumLancto := Documento.GerarNumLancto(qryAux,Documento.CodDocumento);

         liPlanilha := 0;

         Documento.Valorliquido := QryalteradoresVLRLIQUIDO.asFloat;
         if QryalteradoresUNIDNEGOC.IsNull then
            Documento.UnidNegocioLancto := 0
         else
            Documento.UnidNegocioLancto := QryalteradoresUNIDNEGOC.asInteger;

         Documento.CriarLanctoDoc(qryAux,
                                  Documento.CodDocumento,
                                  Documento.NumLancto,
                                  QryalteradoresCODALTERADOR.asInteger,
                                  liPlanilha,
                                  QryalteradoresDATALANCTO.asString,
                                  QryalteradoresVALOR.asFloat,
                                  QryalteradoresVALOROUTRAMOEDA.asFloat,
                                  -1,
                                  QryalteradoresDEBCRE.asString,
                                  Documento.Operacao,
                                  QryalteradoresHISTORICOCOMPL.asString,
                                  Sistema.idUsuario,
                                  (QryalteradoresCONTABILIZA.asString = 'S'), -1, '');
         qryAlteradores.Next;
      end;
   except
     MsgDlg('Erro ao Incluir Alterado(res)','Erro',mtError,[mbOk],0);
     raise;
   end;
end;

procedure TfrmLancDocCAPCAR.sbtnExcluiDetClick(Sender: TObject);
begin
  if (tbcDetalhe.TabIndex = 0) then
     rValorEdit := rValorEdit + qrydetVALOR.asFloat;

  Inherited;
end;

procedure TfrmLancDocCAPCAR.FazContabilizacao;
var contabaixa:strIng;
begin
  try
     contabaixa:='';
     qryContabil.DisableControls;
     Screen.Cursor := CrHourGlass;
     if (pgctrlDetalhe.ActivePage.PageIndex = 1) and
        (qryContabil.isEmpty)                    and
        (CmpForCli.ForCliReg.RazaoSocial <> '')  then
     begin
        sContaCliFor:='';

        qryDet.First;
        while (not qryDet.Eof) do
        begin
           sContaContabil:='';
           sCentroCusto  :='';
           sNomeCentroCusto := '';
           iSubConta:=0;

           if not qryDetCODCENTROCUSTO.IsNull then
           begin
             if QryValida.Active then QryValida.Close;

             if qryDetIDPROGRAMA.IsNull then
                QryValida.Sql[10] := '  IDPROGRAMA IS NULL '
             else
                QryValida.Sql[10] := '  IDPROGRAMA = ' + qryDetIDPROGRAMA.asString;

             if not QryValida.Prepared then QryValida.Prepare;
             QryValida.ParamByName('CODTIPRECDES').asString   := qrydetCODTIPRECDES.asString;
             QryValida.ParamByName('RECPAG').asString         := IntegraBack.RecPag;
             QryValida.ParamByName('IDPESSOA').asInteger      := Sistema.IdEmpresa;
             QryValida.ParamByName('CODCENTROCUSTO').asString := qryDetCODCENTROCUSTO.asString;
             QryValida.ParamByName('IDEMPRESA').asFloat       := Sistema.IdEmpresa;

             QryValida.Open;

             if not QryValida.IsEmpty then
             begin
                sContaContabil   := QryValidaPLACONTA.asString;
                sCentroCusto     := qrydetCODCENTROCUSTO.asString;
                sNomeCentroCusto := CmbCentCusto.DisplayValue;
             end;

             QryValida.Close;
           end;

           //RJ 05/08 Gustavo     rosane aqui
           //Correção na seleção da conta a crédito para lançamento relacionados na tabela
           //aranha
           if ((sContaContabil = '') or (sContaCliFor = '')) and
              FazQuery(qryAuxTipoRD,'SELECT T.PLACONTACREDITO,T.PLACONTA,P.PLACCUST FROM TIPORECEBDESEMB T,PLANOCONTA P WHERE '+
                                    ' RTRIM(T.CODTIPRECDES) = '''+qrydetCODTIPRECDES.asString+''''+
                                    ' AND T.RECPAG = '''+qrydetRECPAG.asString+''''+
                                    ' AND T.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+
                                   // ' AND T.PLANO = ' + IntToStr(sPlano) +
                                    ' AND P.PLACONTA(+) = T.PLACONTA'+
                                    ' AND P.PLANO(+)    = T.PLANO') then
           begin
              if (sContaContabil = '') then
              begin
                 sContaContabil:=qryAuxTipoRD.FieldByName('PLACONTA').asString;

                 if qryAuxTipoRD.FieldByName('PLACCUST').asString = 'S' then
                    sCentroCusto  := qrydetCODCENTROCUSTO.asString;
              end;

              if (sContaCliFor = '') and
                 (trim(qryAuxTipoRD.FieldByName('PLACONTACREDITO').asString) <> '') then
                 sContaCliFor  := qryAuxTipoRD.FieldByName('PLACONTACREDITO').asString;
           end;
           //Fim RJ 05/08 Gustavo

           if trim(contabaixa)='' then
           begin
              if trim(sContaCliFor) ='' then
                 contabaixa:=CmpForCli.ForCliReg.CContabil
              else
                 contabaixa:=sContaCliFor  ;
           end
           else
           begin
             if (Modulo.ValidaCCBaixa) then
             begin
                if not qryDetPLACONTACREDITO.isnull then
                begin
                  if trim(contabaixa)<>trim(qryDetPLACONTACREDITO.asString) then
                  begin
                     if Integraback.recpag='P' then
                       raise ELancDocError.Create('Conta Contábil para baixa diferentes. Verifique os Tipos de Desembolsos Selecionados.')
                     else
                       raise ELancDocError.Create('Conta Contábil para baixa diferentes. Verifique os Tipos de Recebimentos Selecionados.')  ;
                  end;
                end
                else
                begin
                  if trim(contabaixa)<>trim(CmpForCli.ForCliReg.CContabil) then
                  begin
                     if Integraback.recpag='P' then
                       raise ELancDocError.Create('Conta Contábil para baixa diferentes. Verifique os Tipos de Desembolsos Selecionados.')
                     else
                       raise ELancDocError.Create('Conta Contábil para baixa diferentes. Verifique os Tipos de Recebimentos Selecionados.')  ;
                  end;
                end;
             end;
           end;

           if IntegraBack.RecPag = 'R' then
           begin
              if CmpForCli.ForCliReg.CReceita <> '' then
                 sContaContabil := CmpForCli.ForCliReg.CReceita;
           end
           else
           begin
              if CmpForCli.ForCliReg.CDespesa <> '' then
                 sContaContabil := CmpForCli.ForCliReg.CDespesa;
           end;

           sNomeUnidNegoc:= qrydetNOME.asString;
           iUnidNegoc    := qrydetUNIDNEGOC.asInteger;
           rValorCorrente:= qrydetVALOR.asFloat;
           rValorMoeda   := qrydetVALOROUTRAMOEDA.asFloat;
           fIdPlanoPrev := qryDetIDPLANOPREV.asFloat;
           fIdPatro := qryDetIDPATRO.asFloat;
           sNomePlanoPrev := qryDetDESCPLANO.asString;
           sNomePatro := qryDetNOMEPATRO.asString;

           if qryTipoDocDEBCRE.asString = 'D' then
           begin
             sDebCre:='C';
             sTipoDC:='1';
           end
           else
           begin
             sDebCre:='D';
             sTipoDC:='0';
           end;

           FazerInsertContab;
           qryDet.Next;
        end;

        qryDet.First;
        while (not qryDet.Eof) do
        begin
           sNomeCentroCusto := '';

           if {modulo.PrevEfet}'A' = 'A' then
           begin
              sContaCliFor   := CmpForCli.ForCliReg.CAdiantamento;
              sContaContabil := sContaCliFor;
              sCentroCusto   := CmpForCli.ForCliReg.CentroCusto;
              sCCustoCliFor  := sCentroCusto;

              if CmbSubConta.Text = '' then
              begin
                 if ObrigaSubconta(sContaContabil {CmpForcli.ForCliReg.CContabil}) then
                    raise ELancDocError.Create('A Conta Contábil de Adiantamento Obriga SubConta.')
                 else
                    iSubConta := 0;
              end
              else
                 iSubConta := StrToInt(CmbSubConta.LookupValue);

              iSubContaCliFor:= iSubConta;
           end
           else
           begin
              if cbLancaBaixa.Checked then
              begin
                 sContaCliFor   :=qryPortFormaPLACONTA.asString;
                 sContaContabil :=sContaCliFor;
                 iSubConta      :=0;
                 iSubContaCliFor:=iSubConta;
                 sCentroCusto   :=qryPortFormaCODCENTROCUSTO.asString;
                 sCCustoCliFor  :=sCentroCusto;
              end
              else
              begin
                 if (sContaCliFor = '') then
                     sContaCliFor  := CmpForCli.ForCliReg.CContabil;

                 sContaContabil    := sContaCliFor;

                 if CmbSubConta.Text = '' then
                 begin
                   if ObrigaSubconta(sContaContabil {CmpForcli.ForCliReg.CContabil}) then
                      raise ELancDocError.Create('A Conta Contábil de Baixa Obriga SubConta.')
                   else
                      iSubConta := 0;
                 end
                 else
                    iSubConta      := StrToInt(CmbSubConta.LookupValue);

                 iSubContaCliFor   := iSubConta;
                 sCentroCusto      := CmpForCli.ForCliReg.CentroCusto;
                 sCCustoCliFor     := sCentroCusto;
              end;
           end;

           sNomeUnidNegoc := qrydetNOME.asString;

           if CmpForCli.ForCliReg.UnidNegoc <> '0' then
              iUnidNegoc     := StrToInt(CmpForCli.ForCliReg.UnidNegoc)
           else
              iUnidNegoc     := qrydetUNIDNEGOC.asInteger;

           rValorCorrente := qrydetVALOR.asFloat;
           rValorMoeda    := qrydetVALOROUTRAMOEDA.asFloat;
           fIdPlanoPrev := qryDetIDPLANOPREV.asFloat;
           fIdPatro := qryDetIDPATRO.asFloat;
           sNomePlanoPrev := qryDetDESCPLANO.asString;
           sNomePatro := qryDetNOMEPATRO.asString;

           if qryTipoDocDEBCRE.asString = 'C' then
           begin
             sDebCre:='C';
             sTipoDC:='1';
           end
           else
           begin
             sDebCre:='D';
             sTipoDC:='0';
           end;


           FazerInsertContab;
           qryDet.Next;
        end;
     end;
   fInally
      Screen.Cursor := CrDefault;
      qryContabil.EnableControls;
   end;
end;

procedure TfrmLancDocCAPCAR.dbeValorCorrenteChange(Sender: TObject);
begin
  Inherited;
  if CmeCadastro.Operacao In [OpInserir,OpAlterar] then
  begin
     rValorEdit            := dbeValorCorrente.Value;
     if DbeValorLiquido.Value = 0 then
        DbeValorLiquido.Value := dbeValorCorrente.Value;
     dbeValorDet.Value     := dbeValorCorrente.Value;
  end;
end;

procedure TfrmLancDocCAPCAR.sbtnAlterarClick(Sender: TObject);
begin
  If QrySTATUS.asInteger = 2 then
  begin
     MsgDlg('Documento Baixado. Alteração Não Permitida','Atenção',mtInformation,[mbOk],0);
     sbtnAlterar.Down := false;
     exit;
  end;
  If Modulo.StatusIsAtivo(QryIDFORCLI.asInteger) Then
  Begin
    tpdesmb  := '';
    ativproj := '';
    cccusto  :='';
    crespom  := '';

    if not qryCODDOCUMENTO.isNull and
      (qryOPERACAO.asString <> '10') and
      (EdtAutorizaAlteracao.Text <> 'S') then
    begin
      if VerificaParcelas(qryNUMFATURA.asString) then Exit;
      if ConfereSaldo(qryCODDOCUMENTO.asInteger,false) then Exit;
    end;

    Inherited;

    rValorEdit := 0;

    splano:=qryPLANO.asInteger;
  End
  Else
    sbtnAlterar.Down := false;
end;

procedure TfrmLancDocCAPCAR.sbtnApagarClick(Sender: TObject);
begin
  if (qrySTATUS.asInteger = 2) then
  begin
    MsgDlg('Documento Baixado. Exclusão Não Permitida','Atenção',mtInformation,[mbOk],0);
    sbtnApagar.Down := false;
    exit;
  end;
  tpDesmb  := '';
  AtivProj := '';
  ccCusto  := '';
  cRespom  := '';
  splano   := qryPLANO.asInteger;
  if not(qryCODDOCUMENTO.isNull) and (qryOPERACAO.asString <> '10') then
  begin
    if VerificaParcelas(qryNUMFATURA.asString) then
      exit;
    if ConfereSaldo(qryCODDOCUMENTO.asInteger,true) then
      exit;
  end;
  inherited;
end;

procedure TfrmLancDocCAPCAR.dsLancamentoDataChange(Sender: TObject;
  Field: TField);
begin
  Inherited;
  if (not bbtnConfirmar.Enabled) and
     (not qryLancamento.IsEmpty) then
  begin
    if qryContabil.Active then qryContabil.Close;
    if not qryContabil.Prepared then qryContabil.Prepare;
    qryContabil.ParamByName('PLNCODIGO').asFloat := qryLancamentoPLNCODIGO.asInteger;
    qryContabil.Open;
  end;
end;

function TfrmLancDocCAPCAR.ConfereSaldo(iCodDocumento: integer;bVerificaLanc: boolean):boolean;
var rSaldo,rSaldoOm: Real;
begin
 Documento.Saldo.GetSaldoDoc(iCodDocumento,'',IntegraBack.RecPag,rSaldo,rSaldoOm);

 if bVerificalanc then      //maria 08/2000
    Result :=  ( ((qrySTATUS.asString = '2') and (qryOPERACAO.asString<>'10')) or
    (Format('%17.2f',[Abs(rSaldo)]) <> Format('%17.2f',[Abs(dbeValorCorrente.Value)])))
 else
    Result := ( ((qrySTATUS.asString = '2') and (qryOPERACAO.asString<>'10')) or
    (Format('%17.2f',[Abs(rSaldo)]) =Format('%17.2f',[Abs(Modulo.ValorZero)])));

 if Result then
    MsgDlg('Existem outros lançamentos para este documento, proibido alterar, excluir ou estornar','Erro',mtError,[mbOk],0);
end;

function TfrmLancDocCAPCAR.VerificaParcelas(sNumFatura: string):boolean;
begin
 if (sNumFatura = '0') or (sNumFatura = '') then
    Result := false
 else
 begin
    Result := FazQuery(DtmBaseDados.qry,'SELECT CODDOCUMENTO FROM DOCUMENTO WHERE NUMFATURA = ' + sNumFatura + ' AND OPERACAO = ''3''');
    DtmBaseDados.qry.Close;
    if Result then
       MsgDlg('O Documento foi Englobado\Parcelado, favor excluir as parcelas para modificar o documento','Erro',mtError,[mbOk],0);
 end;
end;

procedure TfrmLancDocCAPCAR.cbLancaBaixaClick(Sender: TObject);
begin
  Inherited;
  dbenChBordero.Enabled   := cbLancaBaixa.Checked;
  lblNumChBordero.Enabled := cbLancaBaixa.Checked;
  if not cbLancaBaixa.Checked then QryNumChqBordero.Clear;
end;

procedure TfrmLancDocCAPCAR.CContabilExit(Sender: TObject);
begin
  Inherited;
  CContabil.AceitaTipoConta := SoAnalitica;  
  dblcCCusto.Enabled   := CContabil.Conta.ObrigaCentrodeCusto;
  dblcSubConta.Enabled := CContabil.Conta.obrigaSubConta;
end;

procedure TfrmLancDocCAPCAR.CmpForCliEnter(Sender: TObject);
begin
  Inherited;
  dblcTipoRD.Enabled := false;
end;

procedure TfrmLancDocCAPCAR.CmpForCliExit(Sender: TObject);
begin
  Inherited;
  if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) and
     (ActiveControl <> nil) and (ActiveControl.Tag <> 9999) and bValida then
  begin
     if (CmpForCli.Valida = VcOk) And (Modulo.StatusIsAtivo(CmpForCli.ForCliReg.Id)) then
     begin
        {
          RJ 27/07 Gustavo
          A regularização do Adiantamento passou a ser feita na escolha do favorecido facilitando
          a implemtnação da 'devolução' da Reserva orçamentária caso tenha sido efetuada para
          o adiantamento a ser regularizado
          Fim RJ 27/07 Gustavo
        }

        if (CmeCadastro.Operacao = OpInserir) and
           (Modulo.PrevEfet = 'E') and
           (IdForCliAdianto <> CmpForCli.ForCliReg.Id) then
           begin
             IdForCliAdianto := CmpForCli.ForCliReg.Id;
             IF DtmDadosBancarios <> NIL THEN
             BEGIN
             {FuncaoGeral.FechaQry([DtmCapCar.qryAdtoPendente,
                                     DtmCapCar.qryPrevPendente],false,true);
             ExecutaPrevAdianto;}  //ECF
             END;
           end;

        QryCODSUBCONTA.asString := CmpForCli.ForCliReg.SubConta;
        CmbSubConta.LookupValue := CmpForCli.ForCliReg.SubConta;

        DtmDadosBancarios.SetaContaPreferencial(CmpForCli.ForCliReg.Id,Qry);

        if (IntegraBack.Contabilidade = 'S') and ((qryIDMODULO.asInteger = 3) or (qryIDMODULO.asInteger = 4)) then
        begin
           if (trim(CmpForCli.ForCliReg.CAdiantamento) = '') and
              (modulo.PrevEfet = 'A') then
           begin
             MsgDlg('Como a contabilidade está Integrada, é obrigatório preencher a conta contabil de Adiantamento','Erro',mtError,[mbOk],0);
             bbtnCancelar.Click;
             exit;
           end;
           if IntegraBack.RecPag = 'R' then
           begin
              if trim(CmpForCli.ForCliReg.CContabil) = '' then
              begin
                MsgDlg('Como a contabilidade está Integrada, é obrigatório preencher a conta contabil deste Cliente','Erro',mtError,[mbOk],0);
                bbtnCancelar.Click;
                exit;
              end;

              if CmpForCli.ForCliReg.CContabil = CmpForCli.ForCliReg.CReceita then
                 cbIntegra.Checked:=true;
           end
           else
           begin
              if trim(CmpForCli.ForCliReg.CContabil) = '' then
              begin
                MsgDlg('Como a contabilidade está Integrada, é obrigatório preencher a conta contabil deste Fornecedor','Erro',mtError,[mbOk],0);
                bbtnCancelar.Click;
                exit;
              end;
              if CmpForCli.ForCliReg.CContabil = CmpForCli.ForCliReg.CDespesa then
                 cbIntegra.Checked:=true;
           end;
        end;

        if DbeNoDocumento.Visible then
        begin
           qryCOMPLDOCUMENTO.asString := IntegraBack.BuscaCodigoFiscalReduzido(CmpForCli.ForCliReg.Id);
           if (Trim(qryCOMPLDOCUMENTO.asString) = '') and
              (IntegraBack.AssociaComplTipoFat) then
              begin
                 MsgDlg('Não foi cadastrada a Classificação Fiscal para este ' + CmpForCli.caption + ' ou o código reduzido da mesma não foi preenchido. Não é possível Inserir o documento.','Erro',mtError,[mbOk],0);
                 bbtnCancelar.Click;
                 exit;
              end;
        end;

        dblcTipoRD.Enabled := true;

        if IntegraBack.RecPag = 'P' then
        begin
           if not FazQuery(qryTipoRD,'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                                     'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                                     'TIPORECEBDESEMB T, FORNXDESEMB F ' +
                                     ' WHERE (T.ANASINT = ''A'') AND ' +
                                     '       (T.RECPAG        = '''+IntegraBack.RecPag+''') AND  ' +
                                     '       (T.IDPESSOA      = '+InttoStr(Sistema.idempresa)+ ') AND ' +
                                     '       (F.IDPESSOA      = '+IntToStr(CmpForCli.ForCliReg.Id) + ') AND ' +
                                     '       (F.RECPAG        = T.RECPAG) AND  ' +
                                     '       (F.IDEMPRESAPROP = T.IDPESSOA) AND ' +
                                     '       (F.CODTIPRECDES  = T.CODTIPRECDES) ' +
                                     ' ORDER BY T.DESCRICAO') then
           begin
             if not FazQuery(qryTipoRD,'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                             'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                             'TIPORECEBDESEMB T, RAMOXDESEMB R ' +
                             ' WHERE (T.ANASINT = ''A'') AND ' +
                             '       (T.RECPAG           = '''+IntegraBack.RecPag+''') AND  ' +
                             '       (T.IDPESSOA         = ' + InttoStr(Sistema.idempresa) + ') AND ' +
                             '       (R.IDRAMOFORNECEDOR IN (SELECT IDRAMOFORNECEDOR FROM FORNXRAMO WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) + ')) AND ' +
                             '       (R.RECPAG           = T.RECPAG)   AND ' +
                             '       (R.IDPESSOA         = T.IDPESSOA) AND ' +
                             '       (R.CODTIPRECDES     = T.CODTIPRECDES) ' +
                             ' ORDER BY T.DESCRICAO') then
                FazQuery(qryTipoRD,'SELECT CODTIPRECDES, RECPAG, PLACONTACREDITO, PLANO, PLACONTA, DESCRICAO, ANASINT, FLGOBRIGARESERVA, FLGCALCULAIMPOSTO, HITCODHIST ' +
                                   'FROM TIPORECEBDESEMB WHERE (ANASINT = ''A'') AND (RECPAG = ''' + IntegraBack.RecPag +
                                   ''') AND (IDPESSOA = '+InttoStr(Sistema.idempresa) + ') ORDER BY DESCRICAO');
           end
           else
           begin
            dblcTipoRD.LookupValue := qryTipoRDCODTIPRECDES.asString;
            dblcTipoRD.Text :=qryTipoRDDESCRICAO.asString;
           end;
        end
        else
        begin
           if not FazQuery(qryTipoRD,'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                                     'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                                     'TIPORECEBDESEMB T, CLIXRECEB F ' +
                                     ' WHERE (T.ANASINT = ''A'') AND ' +
                                     '       (T.RECPAG        = '''+IntegraBack.RecPag+''') AND  ' +
                                     '       (T.IDPESSOA      = '+InttoStr(Sistema.idempresa)+ ') AND ' +
                                     '       (F.IDPESSOA      = '+IntToStr(CmpForCli.ForCliReg.Id) + ') AND ' +
                                     '       (F.RECPAG        = T.RECPAG) AND  ' +
                                     '       (F.IDEMPRESA     = T.IDPESSOA) AND ' +
                                     '       (F.CODTIPRECDES  = T.CODTIPRECDES) ' +
                                     ' ORDER BY T.DESCRICAO') then
           begin
             if IntegraBack.TipoEmpresa = 'P' then
             begin
                if not FazQuery(qryTipoRD,'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                                'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                                'TIPORECEBDESEMB T, TIPOCLIXRECEB TR ' +
                                ' WHERE (T.ANASINT = ''A'') AND ' +
                                '       (T.RECPAG           = '''+IntegraBack.RecPag+''') AND  ' +
                                '       (T.IDPESSOA         = ' + InttoStr(Sistema.idempresa) + ') AND ' +
                                '       (TR.IDTIPOCLIENTE IN (SELECT IDTIPOCLIENTE FROM CLIXTIPOCLI WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) + ')) AND ' +
                                '       (TR.RECPAG           = T.RECPAG)   AND ' +
                                '       (TR.IDPESSOA         = T.IDPESSOA) AND ' +
                                '       (TR.CODTIPRECDES     = T.CODTIPRECDES) ' +
                                ' ORDER BY T.DESCRICAO') then
                   FazQuery(qryTipoRD,'SELECT CODTIPRECDES, RECPAG, PLACONTACREDITO, PLANO, PLACONTA, DESCRICAO, ANASINT, FLGOBRIGARESERVA, FLGCALCULAIMPOSTO, HITCODHIST  ' +
                                      'FROM TIPORECEBDESEMB WHERE (ANASINT = ''A'') AND (RECPAG = ''' + IntegraBack.RecPag +
                                      ''') AND (IDPESSOA = '+InttoStr(Sistema.idempresa) + ') ORDER BY DESCRICAO');
                end
                else
                begin
                if not FazQuery(qryTipoRD,'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                                'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                                'TIPORECEBDESEMB T, TIPOCLIXRECEB TR ' +
                                ' WHERE (T.ANASINT = ''A'') AND ' +
                                '       (T.RECPAG           = '''+IntegraBack.RecPag+''') AND  ' +
                                '       (T.IDPESSOA         = ' + InttoStr(Sistema.idempresa) + ') AND ' +
                                '       (TR.IDTIPOCLIENTE IN (SELECT IDTIPOCLIENTE FROM CLIENTEPESS WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) + ')) AND ' +
                                '       (TR.RECPAG           = T.RECPAG)   AND ' +
                                '       (TR.IDPESSOA         = T.IDPESSOA) AND ' +
                                '       (TR.CODTIPRECDES     = T.CODTIPRECDES) ' +
                                ' ORDER BY T.DESCRICAO') then
                   FazQuery(qryTipoRD,'SELECT CODTIPRECDES, RECPAG, PLACONTACREDITO, PLANO, PLACONTA, DESCRICAO, ANASINT, FLGOBRIGARESERVA, FLGCALCULAIMPOSTO, HITCODHIST ' +
                                      'FROM TIPORECEBDESEMB WHERE (ANASINT = ''A'') AND (RECPAG = ''' + IntegraBack.RecPag +
                                      ''') AND (IDPESSOA = '+InttoStr(Sistema.idempresa) + ') ORDER BY DESCRICAO');
                end;
           end
           else
           begin
            dblcTipoRD.LookupValue := qryTipoRDCODTIPRECDES.asString;
            dblcTipoRD.Text :=qryTipoRDDESCRICAO.asString;
           end;
        end;

        qryTipoRD.Fields[0].EditMask := IntegraBack.MascaraRecDes + ';0;_';
        dblcTipoRD.Closeup(true);

     end
     else
     begin
        dblcTipoRD.Enabled := true;
        dblcTipoRD.Closeup(true);
        dblcTipoRD.Enabled := false;
        If CmpForCli.CanFocus Then CmpForCli.SetFocus;
        Exit;
     end;

     if DbeNoDocumento.CanFocus then
        DbeNoDocumento.SetFocus
     else
        if dbenNumDoc.CanFocus then
           dbenNumDoc.SetFocus;
  end;
end;

procedure TfrmLancDocCAPCAR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ImpostoRetido.Free;
  orcamentoBack.Free;
  AvaliForn.Free;
  FuncaoGeral.FechaQry([Qry, QryValida], false, true);
end;

procedure TfrmLancDocCAPCAR.dblcTipoRDCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: boolean);
begin
  Inherited;
  if QryDet.State In [DsEdit, DsInsert] then
  begin
    MontaCentroDeCusto;
    if qryDet.State In [DsEdit, DsInsert] then
    begin
       qryDetDescricao.asString := dblcTipoRD.Text;
       if not qryTipoRDPLACONTACREDITO.isnull then
          qryDetPLACONTACREDITO.asString := qryTipoRDPLACONTACREDITO.asString
       else
          qryDetPLACONTACREDITO.asString := CmpForCli.ForCliReg.CContabil  ;
       tpdesmb:=qryTipoRDCODTIPRECDES.asString;
       qryDetHITCODHIST.asString := qryTipoRDHITCODHIST.asString;
    end;
  end;
end;

procedure TfrmLancDocCAPCAR.SpeedButton1Click(Sender: TObject);
begin
  Inherited;
  MsResORc.Executar;
  if MsResORc.RetornouValor then
  begin
    if not (QryDet.State In [DsEdit, DsInsert]) then
      QryDet.Edit;
    QryDetNUMRESERVA.asInteger := StrToInt(MsResORc.ValoresChave[1]);
    qryDetIDRESERVAORCAMEN.asFloat := StrToFloat(MsResORc.ValoresChave[0]);
    ReResorc.Value := QryDetNUMRESERVA.asInteger;
    SetaCentResponDesemb(qryDetIDRESERVAORCAMEN.asInteger, false);
  end;
end;

procedure TfrmLancDocCAPCAR.ReResorcExit(Sender: TObject);
var
  iValorRetorno: integer;
begin
  Inherited;
  if (ActiveControl.Tag <> 9999) and (not qryDetNUMRESERVA.IsNull) then
  begin
    iValorRetorno := OrcamentoBack.BuscaIdNumReserva(0, qryDetNUMRESERVA.asInteger, true);
    if iValorRetorno > 0 then
    begin
      OrcamentoBack.IdReserva := iValorRetorno;
      qryDetIDRESERVAORCAMEN.asFloat := iValorRetorno;
      SetaCentResponDesemb(iValorRetorno, false);
    end
    else
    begin
      qryDetNUMRESERVA.Clear;
      //ReResorc.Value := 0;
      if ReResorc.CanFocus then
        ReResorc.SetFocus;
      SetaCentResponDesemb(-1, true);
    end;
  end
  else
    if (qryDetNUMRESERVA.asInteger <= 0) then
    begin
      orcamentoback.IdReserva := 0;
      qryDetIDRESERVAORCAMEN.Clear;
      SetaCentResponDesemb(-1, true);
    end;
end;

procedure TfrmLancDocCAPCAR.dblcCentroResponExit(Sender: TObject);
begin
  Inherited;
  if QryDet.State In [DsEdit, DsInsert] then
  begin
     if (Trim(dblcCentroRespon.Text)<>'') and (ActiveControl.Tag <> 9999) and (qryCentroResponANALITICOSINTET.asString <> 'A') then
     begin
        MsgDlg('Centro de Responsabilidade tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
        if dblcCentroRespon.CanFocus then dblcCentroRespon.SetFocus;
     end;

     crespom:= qryCentroResponCODCENTRORESPON.asString;
  end;
end;

function TfrmLancDocCAPCAR.IntegraorcamentoBack(NumReserva:integer; rValor: Real):boolean;
var
  rValorCompromisso :Double;
begin
   Result := true;
   if GpDotorc.Enabled then
   begin
    if (CmeCadastro.Operacao = OpAlterar) and
       (not QryDetNumReservaOld.IsNull) and
       (orcamentoBack.EstornaCompromisso(QryDetNumReservaOld.asInteger,qryDetVLRRESORCAMEN.asFloat,true) <> 0) then
       raise ELancDocError.Create('Não Foi Possível Estornar Compromisso orçamentário.');

    if (QryDetFLGOBRIGARESERVA.asString = 'S') and
       (NumReserva = 0) then
       begin
          if GpDotorc.CanFocus then GpDotorc.SetFocus;
          raise ELancDocError.Create('O ' + lblTipoRD.Caption + ' Obriga a Indicação de Reserva orçamentária');
       end
       else
       begin
          if (NumReserva <> 0) then
          begin
             if (rValorComprometidoReserva <> 0.00) and (rValorRateioComCompromisso <> 0.00) then
                rValorCompromisso := (rValor * rValorComprometidoReserva)/rValorRateioComCompromisso
             else
                rValorCompromisso := rValor;    //tirar
             //showmessage('valor sem formatar '+floattostr(rValorCompromisso));
            // showmessage('valor formatado '+(Format('%17.2f',[rValorCompromisso])));
            // showmessage('Reserva '+floattostr(NumReserva));
             
             if (orcamentoBack.EfetivaCompromisso(Trunc(NumReserva),rValorCompromisso,true) <> 0) then
                raise ELancDocError.Create('Não Foi Possível Efetivar Compromisso orçamentário.')
             else
                 //Grava o valor do VLRRESORCAMEN de acordo com o valor do compromisso orçamentário
               Documento.GravaValorCompromisso(qryDetIDRATEIODOCUM.asInteger,rValorCompromisso);    //aqui
          end;
       end;
   end;
end;

function TfrmLancDocCAPCAR.ObrigaSubconta(sContaContabil: string):boolean;
begin
  if (IntegraBack.Contabilidade = 'S') and (CmbSubConta.Text = '') then
  begin
    FazQuery(DtmbaseDados.Qry,'SELECT PLASUBCONTA FROM PLANOCONTA WHERE PLACONTA = ''' + sContaContabil + ''' AND PLANO = ' + IntToStr(sPlano));
    Result := (DtmbaseDados.Qry.Fields[0].asString = 'S');
    if Result then
    begin
      MsgDlg('A Conta "' + CmpForcli.ForCliReg.CContabil + '" obriga subconta. Informar na "Pasta Geral" em ' + LblSubContaCli.Caption,'Erro',mtError,[mbOk],0);
      if CmbSubConta.CanFocus then CmbSubConta.SetFocus;
    end;
  end
  else
    Result := false;
end;

procedure TfrmLancDocCAPCAR.SetaCentResponDesemb(iNumReserva:LongInt;bLimpa: boolean);
var
  sFiltroDesemb, sFiltroCRespon: string;
begin
  if (not bLimpa) and
     FazQuery(DtmBaseDados.Qry,'SELECT ' +
                               ' CP.CODCENTRORESPON, CP.CODTIPRECDES ' +
                               'FROM ' +
                               ' COMPCONTASORCAMEN CP, RESERVAORCAMEN RE ' +
                               'WHERE ' +
                               ' (RE.IDRESERVAORCAMEN = ' + IntToStr(iNumReserva) + ') AND ' +
                               ' (RE.IDPLANOORCAMEN = CP.IDPLANOORCAMEN)     AND ' +
                               ' (RE.IDCONTAORCAMEN = CP.IDCONTAORCAMEN)') then
  begin
    sFiltroDesemb  := '';
    sFiltroCRespon := '';

    while not DtmBaseDados.Qry.Eof Do
    begin
      if not DtmBaseDados.Qry.FieldByname('CODTIPRECDES').isNull then
         if sFiltroDesemb = '' then
            sFiltroDesemb  := ' CODTIPRECDES = ''' + Espaco(DtmBaseDados.Qry.FieldByname('CODTIPRECDES').asString,15) + ''''
         else
            sFiltroDesemb  := sFiltroDesemb + ' OR CODTIPRECDES = ''' + Espaco(DtmBaseDados.Qry.FieldByname('CODTIPRECDES').asString,15) + '''';

      if not DtmBaseDados.Qry.FieldByname('CODCENTRORESPON').isNull then
         if sFiltroCRespon = '' then
            sFiltroCRespon := ' CODCENTRORESPON = ''' + Espaco(DtmBaseDados.Qry.FieldByname('CODCENTRORESPON').asString,10) + ''''
         else
            sFiltroCRespon := sFiltroCRespon + ' OR CODCENTRORESPON = ''' + Espaco(DtmBaseDados.Qry.FieldByname('CODCENTRORESPON').asString,10) + '''';
      DtmBaseDados.Qry.Next;
    end;

    if sFiltroDesemb <> '' then
    begin
      qryTipoRD.Filter         := sFiltroDesemb;
      qryTipoRD.Filtered       := true;
    end
    else
    begin
      qryTipoRD.Filtered       := false;
      qryTipoRD.Filter         := '';
    end;

    if sFiltroCRespon <> '' then
    begin
      qryCentroRespon.Filter   := sFiltroCRespon;
      qryCentroRespon.Filtered := true;
    end
    else
    begin
      qryCentroRespon.Filtered       := false;
      qryCentroRespon.Filter         := '';
    end;
  end
  else
  begin
    qryTipoRD.Filtered       := false;
    qryTipoRD.Filter         := '';
    qryCentroRespon.Filtered := false;
    qryCentroRespon.Filter   := '';
  end;
end;

procedure TfrmLancDocCAPCAR.ExibeStatusDoc(bBaixado: boolean);
var
  rSaldo, rSaldoOM: real;
begin
  try
    BtnStatus.Glyph := nil;

    if (qryESTORNO.asInteger <> 0) then
    begin
      BtnStatus.Caption := 'Doc. Estornado\Cancelado';
      ImlDocs.GetBitmap(2,BtnStatus.Glyph);
    end
    else
    begin
      if (bBaixado) then
      begin
       BtnStatus.Caption := 'Documento Baixado ';
       ImlDocs.GetBitmap(1,BtnStatus.Glyph);
      end
      else
      begin
        Documento.Saldo.GetSaldoDoc(qryCODDOCUMENTO.asInteger,'',IntegraBack.RecPag,rSaldo,rSaldoOM);
        if (rSaldo = 0) then
          BtnStatus.Caption := 'Documento Em Aberto '
        else
          BtnStatus.Caption := 'Documento Em Aberto '  + (#13+#10) + 'Saldo: '+ FormatFloat('#,##0.00',rSaldo);
        ImlDocs.GetBitmap(0,BtnStatus.Glyph);
      end;
    end;
  except
    MsgDlg('Erro ao associar imagens','Erro',mtError,[mbOk],0);
  end;
end;


procedure TfrmLancDocCAPCAR.DbeNoDocumentoExit(Sender: TObject);
var
  sNoDocum: string;
begin
  inherited;
  if (CmeCadastro.Operacao in [Opalterar,OpInserir]) and (ActiveControl.tag <> 9999) and
     (DbeNoDocumento.Visible) then
  begin
    sNodocum := qryNUMFATURA_1.asString;
    while (Pos('.',sNodocum) <> 0) do
      Delete(sNoDocum,Pos('.',sNodocum),1);

    if Trim(sNoDocum) <> '' then
    begin
       qryNODOCUMENTO.asString := sNoDocum;
       if QryIDFORCLI.isNull then
       begin
          if CmpForCli.CanFocus then CmpForCli.SetFocus;
       end
       else
         if dbeDataEmi.CanFocus then dbeDataEmi.SetFocus;
    end
    else
      if dbeDataEmi.CanFocus then dbeDataEmi.SetFocus;
  end;
end;

procedure TfrmLancDocCAPCAR.SetaEnglobaParcela;
var
  sNumDocumento, sAuxMasacara :string;
begin
  Inherited;
  if (dblcTipoDoc.Text <> '') and
     (CmeCadastro.Operacao In [OpInserir, OpAlterar]) then
  begin
     cbEnglobParc.Enabled := ((Modulo.PrevEfet <> 'A') AND ((qryTipoDocFLGENGLOBAPARCELA.asString = 'A') OR (qryTipoDocFLGENGLOBAPARCELA.IsNull)));
     cbEnglobParc.Checked := (qryTipoDocFLGENGLOBAPARCELA.asString = 'S');
  end;

  if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) and
     (qryTipoDocFLGGERANUMDOC.asString = 'S') and
     (dbenNumDoc.Value = 0.00) and
     (dblcTipoDoc.Text <> '') then
  begin
    if IntegraBack.MascaraNoDocum <> '' then
    begin
       sNumDocumento := IntToStr(Documento.GetCodigo(nil));
       qryNODOCUMENTO.asFloat := StrToFloat(sNumDocumento);
       sAuxMasacara := IntegraBack.MascaraNoDocum;
       while Pos('9',sAuxMasacara) <> 0 Do
             sAuxMasacara[Pos('9',sAuxMasacara)] := '0';
       sNumDocumento := Copy(sAuxMasacara,1,Length(sAuxMasacara) - Length(sNumDocumento)) + sNumDocumento;
       qryNUMFATURA_1.asString := sNumDocumento;
       DbeNoDocumentoExit(Self);
    end
    else
    begin
       if (trim(dblcTipoDoc.text) <> '') and (qryNODOCUMENTO.asFloat = 0) then
          qryNODOCUMENTO.asFloat := Documento.GetCodigo(nil);
    end;
  end;
end;

procedure TfrmLancDocCAPCAR.dblcTipoDocExit(Sender: TObject);
begin
  Inherited;
  SetaEnglobaParcela;
end;

procedure TfrmLancDocCAPCAR.MontaCentroDeCusto;
var
  sSql :string;
begin
  //Se não Integrar com a contabilidade pega todos os CC ativos;
  //Se a contabil do TD não obriga CC pega todos os CC ativos;
  //Se a contabil do TD obriga CC pega os CC do conas x CC;
  //Se a contabil do TD estiver vazia pega da TRDxCCxCONTAxPLANO
  //   sem considerar a CONTA e considerando o programa caso Informado;

  dblcTipoRD.LookupValue := dblcTipoRD.LookupValue;

  if cbIntegra.Checked then
     FazQuery(QryCentroCusto,'SELECT DISTINCT CODCENTROCUSTO, NOME, STATUSGRUPOCDC, IDPROGRAMA FROM CENTCUST WHERE ATIVO = ''S'' AND IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ' ORDER BY CODCENTROCUSTO, STATUSGRUPOCDC DESC')
  else
  begin
     if not qryTipoRDPLACONTA.IsNull then
     begin
       FazQuery(Dtmbasedados.Qry,'SELECT PLACCUST FROM PLANOCONTA WHERE PLANO = ' + IntToStr(sPlano) +
                                    ' AND PLACONTA = ''' + Trim(qryTipoRDPLACONTA.asString) + '''');

       if Dtmbasedados.Qry.FieldByName('PLACCUST').asString = 'S' then
          sSql := 'SELECT DISTINCT CENT.CODCENTROCUSTO,CENT.NOME, CENT.STATUSGRUPOCDC, CENT.IDPROGRAMA FROM CENTCUST CENT '+
                          'WHERE CENT.ATIVO = ''S'' AND CODCENTROCUSTO IN (SELECT CODCENTROCUSTO FROM CONTASxCC CONT '+
                          'WHERE CONT.IDEMPRESA = CENT.IDEMPRESA   AND '+
                          '      CONT.CODCENTROCUSTO= CENT.CODCENTROCUSTO   AND ' +
                          '      CONT.IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa) + ' AND ' +
                          '      CONT.PLANO = ' + InttoStr(sPlano) + ' AND ' +
                          '      RTRIM(CONT.PLACONTA) = '''+ Trim(qryTipoRDPLACONTA.asString) + ''') ORDER BY CENT.CODCENTROCUSTO, CENT.STATUSGRUPOCDC DESC'
       else
          sSql := 'SELECT DISTINCT CODCENTROCUSTO,NOME, STATUSGRUPOCDC, IDPROGRAMA FROM CENTCUST WHERE ATIVO = ''S'' AND IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ' ORDER BY CODCENTROCUSTO, STATUSGRUPOCDC DESC';

       if FazQuery(QryCentroCusto,sSql) then
       begin
         if (not qryCentroResponCodCentroCusto.IsNull) and
            (qryDetCODCENTROCUSTO.IsNull) then
         begin
          if not (qryDet.State In [DsEdit,DsInsert]) then qryDet.Edit;
                 qryDetCODCENTROCUSTO.asString := qryCentroResponCodCentroCusto.asString;
           if QryCentroCusto.Locate('CODCENTROCUSTO',qryCentroResponCodCentroCusto.asString,[]) then
           begin

             CmbCentCusto.LookupValue      := qryCentroResponCodCentroCusto.asString;
             CmbCentCusto.DisplayValue     := QryCentroCustoNOME.asString;
           end
           else
             CmbCentCusto.Clear;
         end
         else
         begin
           if not qryDetCODCENTROCUSTO.IsNull then
           begin
             CmbCentCusto.LookupValue      := qryDetCODCENTROCUSTO.asString;
             CmbCentCusto.DisplayValue     := QryCentroCustoNOME.asString;
           end;
         end;
       end
       else
       begin
         FazQuery(QryCentroCusto,'SELECT DISTINCT CODCENTROCUSTO,NOME, STATUSGRUPOCDC, IDPROGRAMA FROM CENTCUST WHERE 1=2');
         if not qryDetCODCENTROCUSTO.IsNull then
         begin
           CmbCentCusto.LookupValue      := qryDetCODCENTROCUSTO.asString;
           CmbCentCusto.DisplayValue     := QryCentroCustoNOME.asString;
         end
         else
           CmbCentCusto.Clear;
       end;
     end
     else
     begin
       sSql := ' SELECT DISTINCT C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC, C.IDPROGRAMA FROM TIPORDXCCXCONTA T, CENTCUST C WHERE C.ATIVO = ''S'' AND ' +
                                      ' (T.RECPAG = ''' + IntegraBack.RecPag + ''') AND ' +
                                      ' (T.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND  ' +
                                      ' (RTRIM(T.CODTIPRECDES) = ''' + Trim(dblcTipoRD.LookupValue) + ''') AND ' +
                                      FuncaoGeral.Decode(qryDetIDPROGRAMA.IsNull,true,'',' (T.IDPROGRAMA = ' +  qryDetIDPROGRAMA.asString + ') AND ') +
                                      ' (T.IDPESSOA = C.IDEMPRESA) AND  ' +
                                      ' (C.CODCENTROCUSTO = T.CODCENTROCUSTO) ORDER BY C.CODCENTROCUSTO, C.STATUSGRUPOCDC DESC';

       if not FazQuery(QryCentroCusto,sSql) then
       begin
          FazQuery(QryCentroCusto,'SELECT DISTINCT CODCENTROCUSTO, NOME, STATUSGRUPOCDC, IDPROGRAMA FROM CENTCUST WHERE ATIVO = ''S'' AND IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ' ORDER BY CODCENTROCUSTO, STATUSGRUPOCDC DESC');

          if not qryDetCODCENTROCUSTO.IsNull then
          begin
            CmbCentCusto.LookupValue      := qryDetCODCENTROCUSTO.asString;
            CmbCentCusto.DisplayValue     := QryCentroCustoNOME.asString;
          end
          else
            CmbCentCusto.Clear;
       end;
     end;
  end;
end;

procedure TfrmLancDocCAPCAR.dbeDataEmiExit(Sender: TObject);
begin
  Inherited;
  if sbtnInserir.Down = true then
  begin
     qryDATALANCTO.AsDateTime := strtodate(dbeDataEmi.text);
     dbeDataLanc.text := dbeDataEmi.text;
  end;
end;

procedure TfrmLancDocCAPCAR.BtnNumApgrClick(Sender: TObject);
begin
  Inherited;
  qryNUMAPGR.asInteger := LeUltRegistro(nil,'SEQAPGR');
end;

procedure TfrmLancDocCAPCAR.AtualizaSaldo;
var
  rSaldoAtualizaDoc :Double;
begin
  if (CmeCadastro.Operacao = OpInserir) then
  begin
    rSaldoAtualizaDoc := dbeValorCorrente.Value + CalcValAlteradores;

    BtnStatus.Caption    := 'Documento Em Aberto '  + (#13+#10) + 'Saldo: '+ FormatFloat('#,##0.00',rSaldoAtualizaDoc);
  end;
end;

function TfrmLancDocCAPCAR.CalcValAlteradores:Double;
begin
   Result := 0;

   if not qryAlteradores.IsEmpty then
   begin
      if qryAlteradores.State In [DsEdit, DsInsert] then
      begin
         if QryalteradoresDEBCRE.asString = 'C' then
            Result := Result + QryalteradoresValor.asFloat
         else
            Result := Result - QryalteradoresValor.asFloat;
      end
      else
      begin
         while not qryAlteradores.Eof Do
         begin
            if QryalteradoresDEBCRE.asString = 'C' then
               Result := Result + QryalteradoresValor.asFloat
            else
               Result := Result - QryalteradoresValor.asFloat;
            qryAlteradores.Next;
         end;
         qryAlteradores.First;
      end;
   end;
end;


procedure TfrmLancDocCAPCAR.dbeValorCorrenteExit(Sender: TObject);
begin
  Inherited;
  AtualizaSaldo;
end;

procedure TfrmLancDocCAPCAR.CContabilApertouBotao(Sender: TObject);
begin
  Inherited;
  CContabil.AceitaTipoConta := Indiferente;
end;

procedure TfrmLancDocCAPCAR.CmbProgramaExit(Sender: TObject);
begin
  Inherited;
  if QryDet.State In [DsEdit, DsInsert] then
  begin
     qryDetDESCPROGRAMA.asString := CmbPrograma.Text;
   // iProgramaDet := QryDetIDPROGRAMA.asFloat;
  end;
end;

procedure TfrmLancDocCAPCAR.CmbPlanoExit(Sender: TObject);
begin
  Inherited;
  if QryDet.State In [DsEdit, DsInsert] then
  begin
     iPlanoPrevDet := QryDetIDPLANOPREV.asFloat;
     qryDetDESCPLANO.asString := CmbPlano.Text;
  end;
end;

procedure TfrmLancDocCAPCAR.CmbPatroExit(Sender: TObject);
begin
  Inherited;
  if QryDet.State In [DsEdit, DsInsert] then
  begin
     qryDetNOMEPATRO.asString := CmbPatro.Text;
     iPatroDet := QryDetIDPATRO.asFloat;
  end;
end;

procedure TfrmLancDocCAPCAR.CmbCentCustoExit(Sender: TObject);
begin
  Inherited;
  if QryDet.State In [DsEdit, DsInsert] then
  begin
     if (Trim(CmbCentCusto.Text)<>'') and (ActiveControl.Tag <> 9999) and (QryCentroCustoSTATUSGRUPOCDC.asString <> 'A') then
     begin
        MsgDlg('Centro de custo tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
        if CmbCentCusto.CanFocus then CmbCentCusto.SetFocus;
     end;

    cccusto:=QryCentroCustoCODCENTROCUSTO.asString;
    qryDetNOMECENTROCUSTO.asString := CmbCentCusto.Text;
  end;
end;

procedure TfrmLancDocCAPCAR.dblcTipoRDExit(Sender: TObject);
begin
  Inherited;
  if QryDet.State In [DsEdit, DsInsert] then
  begin
    tpdesmb:=qryTipoRDCODTIPRECDES.asString;
    qryDetFLGOBRIGARESERVA.asString := qryTipoRDFLGOBRIGARESERVA.asString;
  end;
end;

procedure TfrmLancDocCAPCAR.CmbCentCustoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: boolean);
begin
  Inherited;
  if QryDet.State In [DsEdit, DsInsert] then
  begin
    if (Trim(CmbCentCusto.Text)<>'') and (ActiveControl.Tag <> 9999) and (QryCentroCustoSTATUSGRUPOCDC.asString <> 'A') then
    begin
       MsgDlg('Centro de custo tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
       if CmbCentCusto.CanFocus then CmbCentCusto.SetFocus;
    end;

    cccusto:=QryCentroCustoCODCENTROCUSTO.asString;
    qryDetNOMECENTROCUSTO.asString := CmbCentCusto.Text;

    if not QryCentroCustoIDPROGRAMA.isNull then
       qryDetIDPROGRAMA.asFloat := QryCentroCustoIDPROGRAMA.asFloat
    else
       qryDetIDPROGRAMA.Clear;
  end;
end;

procedure TfrmLancDocCAPCAR.dblcCentroResponCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: boolean);
begin
  Inherited;
  if QryDet.State In [DsEdit, DsInsert] then
  begin
     if (Trim(dblcCentroRespon.Text)<>'') and (ActiveControl.Tag <> 9999) and (qryCentroResponANALITICOSINTET.asString <> 'A') then
     begin
        MsgDlg('Centro de Responsabilidade tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
        if dblcCentroRespon.CanFocus then dblcCentroRespon.SetFocus;
     end;

     crespom:= qryCentroResponCODCENTRORESPON.asString;
  end;
end;

procedure TfrmLancDocCAPCAR.dblcUnidNegocCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: boolean);
begin
  Inherited;
  if QryDet.State In [DsEdit, DsInsert] then
  begin
     if qryMOECODIGO.asInteger <> 0 then
     begin
        qrydetMOECODIGO.asInteger:=qryMOECODIGO.asInteger;
        dbeValorMoedaDet.Enabled := true;
        dbeValorDet.Enabled := false;
     end
     else
     begin
        dbeValorMoedaDet.Enabled := false;
        dbeValorDet.Enabled := true;
     end;

     if (Trim(dblcUnidNegoc.Text)<>'') and  (ActiveControl.Tag <> 9999) and (qryUnidNegocUNETIPO.asString <> 'A') then
     begin
        MsgDlg('Atividade\Projeto tem de ser analítico','Atenção',mtWarnIng,[mbOk],0);
        if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
     end;

     ativproj:=qryUnidNegocUNIDNEGOC.asString;
  end;

end;

{
  DF 10/07 Gustavo
  Correção na validação do Registro do Rateio: Inclusão das colunas Programa,
  Plano, PatrocInadore e Número do Imóvel no teste.
  Alteração no tipo de dado da coluna Número do Imóvel no Rateio: Passou de
  Number para varchar2(60)
  Fim DF 10/07 Gustavo
}


{
  DF 11/07 Gustavo
  Inclusão da coluna Analítico/SIntético para o centro de custo do reteio
  ordenação das consultas de centro de custo pelo Código e Pelo Status (A/S)
  Implementação da restrição para lançamentos em centros de custo analíticos
  Fim DF 11/07 Gustavo
}

{
  DF 12/07 Gustavo
  Gravação do histórico padrão Indicado no tipo de recebimento/desembolso na contabilização
  do lançamento
  Correção da ordem de Tabulação dos controles do Rateio;
  Correção do bloqueio dos controles do rateio no momento da edição dos registros;
  Fim DF 12/07 Gustavo
}

procedure TfrmLancDocCAPCAR.CmpForCliApertouBotao(Sender: TObject);
begin
  Inherited;
  IdForCliAdianto := QryIdForCli.asFloat;
end;

{
  RJ 27/07 Gustavo
  Implemtação da reguarização do adiantamento em função da seleção no momento
  da escolha do Favorecido\Cliente
  Fim RJ 27/07 Gustavo
}

procedure TfrmLancDocCAPCAR.RegularizaAdiantamento;
{var
  rValorZero: Real;}
begin
{  if DtmCapCar.qryAdtoPendente.Active and DtmCapCar.qryAdtoPendente.UpdatesPendIng then
     try
        rValorZero := 0.00;
        DtmCapCar.qryAdtoPendente.First;
        while not DtmCapCar.qryAdtoPendente.EOF do
        begin
           if (DtmCapCar.qryAdtoPendenteSTATUS.Value = '2') and
              (Format('%17.2f',[DtmCapCar.qryAdtoPendenteVLRBAIXA.asFloat]) <> Format('%17.2f',[rValorZero])) then
           begin
               Documento.RegularizaAdto(frmLancDocCAPCAR.qry.FieldByName('CODDOCUMENTO').asInteger,
                                        DtmCapCar.qryAdtoPendente.FieldByName('CODDOCUMENTO').asInteger,
                                        frmLancDocCAPCAR.qry.FieldByName('DATALANCTO').asString,
                                        frmLancDocCAPCAR.qry.FieldByName('NODOCUMENTO').asString + ' ' +frmLancDocCAPCAR.qry.FieldByName('COMPLDOCUMENTO').asString,
                                        DtmCapCar.qryAdtoPendente.FieldByName('DOCUM').asString,
                                        frmLancDocCAPCAR.CmpForCli.ForCliReg.RazaoSocial,
                                        DtmCapCar.qryAdtoPendente.FieldByName('VLRBAIXA').asFloat);
           end;
           DtmCapCar.qryAdtoPendente.Next;
        end;
     except
        MsgDlg('Regularização de Adianamento não Efetuada','Erro',mtError,[mbOk],0);
        raise;
     end;
} //ECF
end;

procedure TfrmLancDocCAPCAR.RegularizaPrevisao;
{var
  sValor: string;}
begin
{  if DtmCapCar.qryPrevPendente.Active and DtmCapCar.qryPrevPendente.UpdatesPendIng then
     try
      sValor := FloatToStr((DtmCapCar.qryPrevPendente.FieldByName('VALRES').asFloat - DtmCapCar.qryPrevPendente.FieldByName('VLRBAIXA').asFloat));

      while Pos('.',sValor) <> 0 Do  Delete(sValor,Pos('.',sValor),1);

      DtmCapCar.qryPrevPendente.First;

      while not DtmCapCar.qryPrevPendente.Eof Do
      begin
        if DtmCapCar.qryPrevPendente.FieldByName('STATUS').asString = '2' then
        begin
          if Format('%17.2f',[DtmCapCar.qryPrevPendente.FieldByName('VALRES').asFloat]) = Format('%17.2f',[DtmCapCar.qryPrevPendente.FieldByName('VLRBAIXA').asFloat]) then
             ExecutarQuery(DtmBaseDados.qry,'Delete From LancToDocum Where CodDocumento = '+ DtmCapCar.qryPrevPendente.FieldByName('CODDOCUMENTO').asString)
          else
             ExecutarQuery(DtmBaseDados.qry,' Update Lanctodocum Set Valor = '+ sValor +
                           ' Where CodDocumento = '+ DtmCapCar.qryPrevPendente.FieldByName('CODDOCUMENTO').asString);
        end;
        DtmCapCar.qryPrevPendente.Next;
      end;
     except
        MsgDlg('Regularização de Previsão não Efetuada','Erro',mtError,[mbOk],0);
        raise;
     end;
} //ECF
end;

procedure TfrmLancDocCAPCAR.Atualizaorcamento;
{var
   rTotAdiantamento, rValorZero: Real;}
begin
  rValorRateioComCompromisso := 0.00;
  rValorComprometidoReserva := 0.00;
//  rValorZero := 0.00;
//  rTotAdiantamento := 0.00;
 //showmessage('empresa '+Modulo.PrevEfet)    ;
// showmessage('orcamento '+IntegraBack.Integraorcamento);

{  if (DtmCapCar.qryAdtoPendente.Active) and
     (DtmCapCar.qryAdtoPendente.UpdatesPendIng) and
     (IntegraBack.Integraorcamento = 'S') and
     (Modulo.PrevEfet = 'E') then
     try
      //showmessage('1 ');
        //Soma efetivamente os valores do rateio que tem compromisso associado para
        //efetivação de compromisso já ultilizado por um adiantamento/previsão
        QryDet.First;
        while not QryDet.Eof Do
        begin
           if QryDetNumReserva.asInteger > 0 then
              rValorRateioComCompromisso := rValorRateioComCompromisso + QryDetValor.asFloat;
           QryDet.Next;
        end;

        DtmCapCar.qryAdtoPendente.First;

        while not DtmCapCar.qryAdtoPendente.EOF do
        begin
            //showmessage('2 ');
           if (DtmCapCar.qryAdtoPendenteSTATUS.Value = '2') and
              (Format('%17.2f',[DtmCapCar.qryAdtoPendenteVLRBAIXA.asFloat]) <> Format('%17.2f',[rValorZero])) then
              rTotAdiantamento := rTotAdiantamento + DtmCapCar.qryAdtoPendente.FieldByName('VLRBAIXA').asFloat;
           DtmCapCar.qryAdtoPendente.Next;
        end;

        DtmCapCar.qryAdtoPendente.First;

        while not DtmCapCar.qryAdtoPendente.EOF do
        begin
           if (DtmCapCar.qryAdtoPendenteSTATUS.Value = '2') and
              (Format('%17.2f',[DtmCapCar.qryAdtoPendenteVLRBAIXA.asFloat]) <> Format('%17.2f',[rValorZero])) then
           begin
              // showmessage('3 ');
                 if QryRateioOrcamento.Active then QryRateioOrcamento.Close;
                 if not QryRateioOrcamento.Prepared then QryRateioOrcamento.Prepare;
                 QryRateioOrcamento.ParamByName('VALDIFERENCA').asFloat := qryVALOR.asFloat - rTotAdiantamento;
                 QryRateioOrcamento.ParamByName('VALADIANTO').asFloat := DtmCapCar.qryAdtoPendente.FieldByName('VLRBAIXA').asFloat;
                 QryRateioOrcamento.ParamByName('CODDOCUMENTO').asFloat := DtmCapCar.qryAdtoPendente.FieldByName('CODDOCUMENTO').asFloat;
                 QryRateioOrcamento.Open;

                 if QryRateioOrcamentoVALORRESERVA.asFloat <> 0.00 then
                 begin
                    // showmessage('4 ');
                    if QryRateioOrcamentoVALORRESERVA.asFloat < 0 then
                    //Valor do Adiantamento é maior que o do documento altera/Devolve para o compromisso de origem
                    begin
                       QryUpdorcamem.ParamByName('VALOR').asFloat := QryRateioOrcamentoVALORRESERVA.asFloat * -1;
                       QryUpdorcamem.ParamByName('ID').asFloat := QryRateioOrcamentoIDRESERVAORCAMEN.asFloat;
                       QryUpdorcamem.ExecSql;
                    end
                    else
                      rValorComprometidoReserva := rValorComprometidoReserva + QryRateioOrcamentoVALORRESERVA.asFloat;
                    //Valor do Documento é Maior que o do adiantamento
                 end;

                 QryRateioOrcamento.Close;
           end;
           DtmCapCar.qryAdtoPendente.Next;
        end;
     except
        MsgDlg('Erro ao atualizar contas orcamentárias','Erro',mtError,[mbOk],0);
        raise;
     end;
}  //ECF
end;

procedure TfrmLancDocCAPCAR.CmbProgramaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: boolean);
begin
  Inherited;
 // iProgramaDet := QryDetIDPROGRAMA.asFloat;
  qryDetDESCPROGRAMA.asString := CmbPrograma.Text;
end;

procedure TfrmLancDocCAPCAR.CmbPatroCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: boolean);
begin
  Inherited;
  iPatroDet := QryDetIDPATRO.asFloat;
  qryDetNOMEPATRO.asString := CmbPatro.Text;
end;

procedure TfrmLancDocCAPCAR.CmbPlanoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: boolean);
begin
  Inherited;
  iPlanoPrevDet := QryDetIDPLANOPREV.asFloat;
  qryDetDESCPLANO.asString := CmbPlano.Text;
end;

procedure TfrmLancDocCAPCAR.BtnBuscaContaCorClick(Sender: TObject);
begin
  Inherited;
  if CmeCadastro.Operacao In [OpInserir, OpAlterar] then
  begin
     With DtmDadosBancarios Do
     begin
        SetaFiltroMs(qryIDFORCLI.asFloat);
        if MsContaCor.Executar = MrOk then
        begin
          qryIDCBANCARIA.asFloat := StrToFloat(MsContaCor.ValoresChave[0]); //CONTABANCARIA.IDCBANCARIA
          qryCONTACORRENTE.asString := MsContaCor.ValoresChave[1]; //CONTABANCARIA.CONTACORRENTE
          qryNUMBANCO.asString := MsContaCor.ValoresChave[2]; //BANCO.NUMBANCO
          qryNUMAGENCIA.asString := MsContaCor.ValoresChave[3]; //AGENCIABANCARIA.NUMAGENCIA
          qryDESCTIPOCONTA.asString := MsContaCor.ValoresChave[4]; //CONTABANCARIA.TIPOCONTA
        end;
     end;
  end;
end;

procedure TfrmLancDocCAPCAR.setaplanopatroglobal;
begin
   if qryDetIDPLANOPREV.IsNull and
      (IntegraBack.PlanoPrevGlobal > 0) then
   begin
      qryDetIDPLANOPREV.asFloat := IntegraBack.PlanoPrevGlobal;
      CmbPlano.Lookupvalue := IntToStr(IntegraBack.PlanoPrevGlobal);
      iPlanoPrevDet := IntegraBack.PlanoPrevGlobal;
      CmbPlano.CloseUp(true);
      CmbPlanoExit(Self);
   end;

   if qryDetIDPATRO.IsNull and
      (IntegraBack.PatroGlobal > 0) then
   begin
      iPatroDet := IntegraBack.PatroGlobal;
      CmbPatro.Lookupvalue := IntToStr(IntegraBack.PatroGlobal);
      qryDetIDPATRO.asFloat := IntegraBack.PatroGlobal;
      CmbPatro.CloseUp(true);
      CmbPatroExit(Self);
   end;
end;

procedure TfrmLancDocCAPCAR.DclAtivProjetoExit(Sender: TObject);
begin
  Inherited;
  if (Trim(DclAtivProjeto.Text) <> '') and
     (qryAlteradores.State In [DsEdit,DsInsert]) then
     QryalteradoresNOME.asString := DclAtivProjeto.Text;
end;

procedure TfrmLancDocCAPCAR.dblkAlteradorExit(Sender: TObject);
begin
  Inherited;
  if (Trim(dblkAlterador.Text) <> '') and
     (qryAlteradores.State In [DsEdit,DsInsert]) then
  begin
   QryalteradoresDESCRICAO.asString := dblkAlterador.Text;
   QryalteradoresDEBCRE.asString := qryAltAcresDecres.asString;
  end;
end;

Function TfrmLancDocCAPCAR.TestaAlterador:boolean;
begin
  Result := false;
  if Trim(dblkAlterador.Text) = '' then
    MsgDlg('O Alterador não foi Informado','Erro',mtError,[mbOk],0)
  else
  if (DbrValor.Value = 0.00) then
    MsgDlg('O Valor do Alterador não foi Informado','Erro',mtError,[mbOk],0)
  else
  if (dtLancto.Text = '') then
    MsgDlg('A Data de Lançamento do Alterador não foi Informada','Erro',mtError,[mbOk],0)
  else
    Result := true;

  if not(Result) then
    Abort;
end;

procedure TfrmLancDocCAPCAR.DbrValorExit(Sender: TObject);
begin
  inherited;
  if (qryAlteradores.State In [DsEdit,DsInsert]) then
    qryAlteradoresVLRLIQUIDO.asFloat := qryAlteradoresVALOR.asFloat;
end;

procedure TfrmLancDocCAPCAR.qryAlteradoresAfterInsert(DataSet: TDataSet);
begin
  Inherited;
  if not cbIntegra.Checked then
  begin
     QryalteradoresCONTABILIZA.asString := 'S';
     CkbContabiliza.Enabled := true;
  end
  else
  begin
     QryalteradoresCONTABILIZA.asString := 'N';
     CkbContabiliza.Enabled := cbIntegra.Enabled;
  end;
end;

procedure TfrmLancDocCAPCAR.PageRateioPrevChange(Sender: TObject);
begin
  Inherited;
  if PageRateioPrev.ActivePage=TbsRateioGeral then
     if dblcunidnegoc.canfocus then
        dblcunidnegoc.setfocus;
end;

procedure TfrmLancDocCAPCAR.pgctrlDetalheEnter(Sender: TObject);
begin
  Inherited;
  if PageRateioPrev.ActivePage=TbsRateioGeral then
     if dblcunidnegoc.canfocus then
        dblcunidnegoc.setfocus;
end;

procedure TfrmLancDocCAPCAR.cbEnglobParcClick(Sender: TObject);
begin
  Inherited;
  BtnNumApgr.Enabled := not cbEnglobParc.checked;
  if sbtnInserir.Down then   EdtNumAp.text:='';
end;

procedure TfrmLancDocCAPCAR.sbtnAlternarTipoDocClick(Sender: TObject);
begin
  if (IntegraBack.RecPag = 'P') then
    IntegraBack.RecPag := 'R'
  else
    IntegraBack.RecPag := 'P';

  if (IntegraBack.RecPag = 'P') then
  begin
    LblNumAp.Caption             := 'Nº da AP';
    lblTipoRD.Caption            := 'Tipo de Desembolso';
    qryDetDESCRICAO.DisplayLabel := 'Desembolso';
    qryDetNOME.DisplayLabel      := 'Atividade';
    Caption                      := 'Manutenção de Documentos do Contas a Pagar';
    CmpForCli.Caption            := ' Favorecido ';
    CmpForCli.ForCli             := fcFornecedor;
    lblPortadorForma.Caption     := 'Contas/Caixas x Forma de Pag';
    lblNumChBordero.Caption      := 'No. Ch./Borderô';
    LblFormaPag.Caption          := 'Forma de Pagamento';
    LblSubContaCli.Caption       := 'Sub-Conta Fornecedor';
  end
  else
  begin
    LblNumAp.Caption             := 'Nº da GR';
    qryDetDESCRICAO.DisplayLabel := 'Recebimento';
    qryDetNOME.DisplayLabel      := 'Projeto';
    lblTipoRD.Caption            := 'Tipo de Recebimento';
    Caption                      := 'Manutenção de Documentos do Contas a Receber';
    CmpForCli.Caption            := ' Cliente ';
    CmpForCli.ForCli             := fcCliente;
    lblPortadorForma.Caption     := 'Contas/Caixas x Tipo Cobr';
    lblNumChBordero.Caption      := 'No. Recebto.';
    LblFormaPag.Caption          := 'Tipos de Cobrança';
  end;

  MontaSelect.Filtro[10] := 'TIPODOCRECPAG.RECPAG = '+QuotedStr(IntegraBack.RecPag);
  MontaSelect.Filtro[11] := 'DOCUMENTO.IDMODULO   = '+IntToStr(Sistema.IdModulo);
  MontaSelect.Filtro[12] := 'DOCUMENTO.RECPAG     = '+QuotedStr(IntegraBack.RecPag);
  MontaSelect.Filtro[13] := 'DOCUMENTO.IDPESSOA   = '+IntToStr(Sistema.idempresa);
  MontaSelect.Filtro[14] :=
    'TIPODOCRECPAG.CODTIPDOC In (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG = '+
    QuotedStr(IntegraBack.RecPag) + ' and not exists (select 1 from UsuarioxTpdocto b '+
    'where (recpag = '+QuotedStr(Integraback.recpag)+') and (b.idusuario = ' +
    Inttostr(sistema.IdUsuario)+')) union SELECT CODTIPDOC FROM TIPODOCRECPAG a '+
    'WHERE (a.RECPAG = ' +QuotedStr(IntegraBack.RecPag)+ ') and exists (select 1 from '+
    'UsuarioxTpdocto b where (recpag = '+QuotedStr(Integraback.recpag)+
    ') and (a.codtipdoc = b.codtipdoc) and (b.idusuario = ' + Inttostr(sistema.idusuario)+')))';

  sbtnAlternarTipoDoc.Down := false;
end;

end.
