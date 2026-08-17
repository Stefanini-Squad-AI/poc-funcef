unit FMovContratoConfissao;
{*******************************************************}
{ Analista Responsável: Helen V. Bianchi                }
{ Atualizado Em: 09/10/2011                             }
{ SOL: 136341 Kintana : 815095                          }
{*******************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  TEdNum, Grids, Wwdbigrd, Wwdbgrid, mFornecedor, TREdit, Mask, wwdbedit,
  Wwdbspin, wwdbdatetimepicker, CMDateTimePicker, wwdblook, Db, DBTables,
  Wwquery, Wwdatsrc, MontaSelect, uCMTypes, mOrcamento,  DBClient,
  uCMClientDataSet, uCmSqlParams,  TB97Tlwn, UDiasInUteis,  Provider,
  uCMFileUtils, mContrato, CMDBLookupCombo, Wwdotdot, Wwdbcomb,
  mTipoOperacao,UDataBase,UFuncoesImob,uCtrlImobDocumento,uCtrlParamIntegra,
  uCtrlPadrLancImovel,uCtrlPadroes,uComunsImobiliarioDB,uCtrlImobLancamento,
  uCtrlModeloHistorico,uCtrlCafxContab,uCtrlTipoCustoRecImov,uCtrlBloqueioImob,
  UModuloAdminImob,uCtrlContab;

type
  TfrmMovContratoConfissao = class(TfrmWizardMT)
    TabSheet2: TTabSheet;
    fcLabel2: TfcLabel;
    qryParcInamp: TwwQuery;
    qryParcInampCODDOCUMENTO: TFloatField;
    qryParcInampDATAVENCIMENTO: TDateTimeField;
    qryParcInampTIPORECEITA: TStringField;
    qryParcInampVALOR: TFloatField;
    qryParcInampALT: TFloatField;
    qryParcInampJUR: TFloatField;
    qryParcInampMUL: TFloatField;
    qryParcInampCOR: TFloatField;
    qryParcInampSALDO: TFloatField;
    qryParcInampIDCONTRATOIMOVEL: TFloatField;
    qryParcInampRECEBIDO: TFloatField;
    qryParcInampTOT_RECEBER: TFloatField;
    dsParcInamp: TwwDataSource;
    qryContrato: TwwQuery;
    qryContratoLOCATARIO: TStringField;
    qryContratoRESPONSAVEL: TStringField;
    qryContratoADMINISTRADORA: TStringField;
    qryContratoIDCONTRATOIMOVEL: TFloatField;
    grbContrato: TGroupBox;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtLocatario: TEdit;
    edtResponsavel: TEdit;
    edtAdministradora: TEdit;
    GroupBox2: TGroupBox;
    Label22: TLabel;
    Label4: TLabel;
    edtSaldo: TRealEdit;
    edtData: TEdit;
    grdParcelas: TwwDBGrid;
    gbPeriodoReajuste: TGroupBox;
    Label72: TLabel;
    DBSpnQtde: TwwDBSpinEdit;
    GroupBox4: TGroupBox;
    edtDataConfissao: TCMDateTimePicker;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Label3: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    qryParamImovel: TwwQuery;
    qryParamImovelIDPESSOA: TFloatField;
    qryParamImovelCODCENTRORESPON: TStringField;
    qryParamImovelUNIDNEGOC: TFloatField;
    qryParamImovelCODPORTFORMA: TFloatField;
    qryParamImovelFLGINTEGRACONTAB: TFloatField;
    qryParamImovelFLGINTEGRACAPCAR: TFloatField;
    qryParamImovelFLGINTEGRAGESTAO: TFloatField;
    qryParamImovelFLGINTEGRAATIVO: TFloatField;
    qryParamImovelFLGUSASCIMOVEL: TFloatField;
    qryParamImovelFLGUSASCLOCATARIO: TFloatField;
    qryParamImovelFLGALIMENTAALTER: TFloatField;
    qryParamImovelFLGALIMENTADATA: TStringField;
    qryParamImovelFLGALIMENTADEPREC: TFloatField;
    qryParamImovelPRAZOAVISO: TFloatField;
    qryParamImovelFLGAUTORESCISAO: TFloatField;
    qryParamImovelFLGMESPOSTERIOR: TFloatField;
    qryParamImovelFLGCONCATENAANO: TFloatField;
    qryParamImovelFLGSUGERECONTRATO: TFloatField;
    qryParamImovelFLGEXIBELABELCOBR: TFloatField;
    qryParamImovelFLGINTEGRARECEB: TFloatField;
    qryParamImovelFLGGERATXADMIN: TFloatField;
    qryParamImovelNOMEVLRAQUISICAO: TStringField;
    qryParamImovelFLGINTEGRAPAG: TFloatField;
    qryParamImovelFLGINTEGRAFOLHA: TFloatField;
    qryParamImovelQTDEMESPREVFOLHA: TFloatField;
    qryParamImovelPROXNUMCONTRATO: TFloatField;
    qryParamImovelFLGOBRIGATIVIDADE: TFloatField;
    qryParamImovelFLGVENCDIAUTIL: TFloatField;
    qryParamImovelFLGTOLERACOMPL: TFloatField;
    qryParamImovelFLGREAVALMERCADO: TFloatField;
    qryParamImovelFLGOBRIGACONTRATO: TFloatField;
    qryParamImovelFLGCOMISSAOALT: TFloatField;
    qryParamImovelFLGLANCRESCINDIDO: TFloatField;
    qryParamImovelFLGOBRIGAALTTIPO: TFloatField;
    qryParamImovelFLGINTEGRAORCAMEN: TFloatField;
    qryParamImovelIDTCUSTORECIMOCOM: TFloatField;
    qryParamImovelFLGUSAAP: TFloatField;
    qryParamImovelIDPROGRAMA: TFloatField;
    qryParamImovelIDEMPRESA: TFloatField;
    qryParamImovelCODCENTROCUSTO: TStringField;
    qryParamImovelFLGREEMBOLSOAUT: TFloatField;
    qryParamImovelFLGLANCPAGENCERRA: TFloatField;
    qryParamImovelFLGLANCRECENCERRA: TFloatField;
    qryParamImovelFLGALUGUELZERO: TFloatField;
    qryParamImovelFLGCONSIDERARESP: TFloatField;
    qryParamImovelFLGFILTRAREAJUSTE: TFloatField;
    qryParamImovelFLGFILTRAENCERRA: TFloatField;
    qryParamImovelFLGDIAUTILAP: TStringField;
    qryParamImovelFLGALTERAEVENTO: TFloatField;
    qryParamImovelFLGEVENTOUSUARIO: TFloatField;
    qryParamImovelFLGPARTPIM: TFloatField;
    qryParamImovelFLGPARTPDES: TFloatField;
    qryParamImovelFLGPARIM: TFloatField;
    qryParamImovelFLGPARCON: TFloatField;
    qryParamImovelFLGPARTDTPIM: TFloatField;
    qryParamImovelFLGPARTDIM: TFloatField;
    qryParamImovelFLGPARTDCON: TFloatField;
    qryParamImovelIDPESSOALOC: TFloatField;
    qryParamImovelIDLOCALIZACAO: TFloatField;
    qryParamImovelIDCLASSEBEM: TFloatField;
    qryParamImovelFLGMULTITIPO: TFloatField;
    qryParamImovelIDSITUACAO: TFloatField;
    qryParamImovelIDRECALIENACAO: TFloatField;
    qryParamImovelIDDESPAQUISICAO: TFloatField;
    qryParamImovelFLGHISTCONTDIFAP: TFloatField;
    qryParamImovelIDRECAMORTEXTRA: TFloatField;
    qryParamImovelIDRECPROJECAO: TFloatField;
    qryParamImovelIDRECAVISTA: TFloatField;
    qryParamImovelIDRECSINAL: TFloatField;
    qryParamImovelIDRECCORRECAO: TFloatField;
    qryParamImovelIDRECJUROS: TFloatField;
    qryParamImovelIDRECAMORTIZACAO: TFloatField;
    qryParamImovelCODALTJUROS: TFloatField;
    qryParamImovelCODALTCORRECAO: TFloatField;
    qryParamImovelCODALTMULTA: TFloatField;
    qryParamImovelFLGNUMPROPOSTA: TFloatField;
    qryParamImovelCODTIPIMOVELOBRA: TStringField;
    qryParamImovelIDRECPERDAS: TFloatField;
    qryParamImovelFLGINTCAFCONT: TFloatField;
    qryParamImovelFLGDIARIO: TStringField;
    qryParamImovelMESCOMPETENCIA: TFloatField;
    qryParamImovelANOCOMPETENCIA: TFloatField;
    qryParamImovelFLGUSAINVESTIMOB: TStringField;
    qryParamImovelFLGLANCRECINATIVO: TFloatField;
    qryParamImovelMESBLOQLANCTO: TFloatField;
    qryParamImovelIDTCUSTORECIMOALU: TFloatField;
    qryParamImovelFLGLANCPAGINATIVO: TStringField;
    qryParamImovelFLGAVISORESPON: TStringField;
    qryParamImovelFLGAVISOENCALUG: TStringField;
    qryParamImovelFLGAVISOREVALUG: TStringField;
    qryParamImovelFLGAVISOREAALUG: TStringField;
    qryParamImovelFLGAVISO: TStringField;
    qryParamImovelDIASAVISO: TFloatField;
    qryParamImovelFLGAVISOENCSEGUR: TStringField;
    qryParamImovelFLGAVISOENCFIANCA: TStringField;
    qryParamImovelTIPOIMOVELPATRO: TStringField;
    qryParamImovelIDGRUPOREGRA: TFloatField;
    qryParamImovelFLGAVISOCOBR: TStringField;
    qryParamImovelDIASAVISOCOBR: TFloatField;
    qryParamImovelFLGPREVFOLHA: TFloatField;
    qryParamImovelIDOPERATUALCM: TFloatField;
    qryParamImovelIDOPERATUALJUROS: TFloatField;
    qryParamImovelIDOPERPROVPER: TFloatField;
    qryParamImovelIDOPERATUALMULTA: TFloatField;
    qryParamImovelFLGLANCFORACOMP: TStringField;
    qryParamImovelIDOPERPROVREC: TFloatField;
    qryParamImovelFLGLOGORELAT: TStringField;
    qryParamImovelIDCARTACOBRANCA3: TFloatField;
    qryParamImovelIDCARTACOBRANCA2: TFloatField;
    qryParamImovelIDCARTACOBRANCA1: TFloatField;
    qryParamImovelIDCARTACOBRANCA4: TFloatField;
    qryParamImovelFLGCALCINADIMP: TStringField;
    qryParamImovelIDREGRAMULTA: TFloatField;
    qryParamImovelFLGBLOQRECALUGUEL: TFloatField;
    qryParamImovelFLGATUALDATAPROG: TFloatField;
    qryParamImovelFLGTIPODATAPROG: TStringField;
    qryParamImovelIDOPERABONOMULTA: TFloatField;
    qryParamImovelIDOPERABONOJUROS: TFloatField;
    qryParamImovelIDOPERABONOCM: TFloatField;
    qryParamImovelFLGINDMESANTERIOR: TFloatField;
    qryParamImovelMASCARACOMPL: TStringField;
    qryParamImovelFLGREGEVENTO: TFloatField;
    qryParamImovelFLGBLOQDTLANC: TFloatField;
    qryParamImovelFLGUSAUNIDADE: TFloatField;
    qryParamImovelDTULTFECH: TDateTimeField;
    qryParamImovelFLGAUTCOD: TStringField;
    qryParamImovelFLGVALCOD: TStringField;
    Panel4: TPanel;
    bbtnInsereAlterador: TBitBtn;
    btnExcluiAlterador: TBitBtn;
    Panel1: TPanel;
    Label14: TLabel;
    memObservacao: TMemo;
    GroupBox5: TGroupBox;
    qryParcInampSELECAO: TFloatField;
    UpdParcInamp: TUpdateSQL;
    qryContratoCONDATAASSINATURA: TDateTimeField;
    Label7: TLabel;
    edtConNumero: TEdit;
    edtConNome: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label13: TLabel;
    qryContratoCODTIPIMOVEL: TStringField;
    molTipoOperacao: TmolTipoOperacao;
    qryConfissaoXOper: TwwQuery;
    dsConfissaoXOper: TDataSource;
    upConfissaoXOper: TUpdateSQL;
    qryConfissaoXOperIDCONFISSAODIVIDA: TFloatField;
    qryConfissaoXOperIDTIPOCUSTORECIMO: TFloatField;
    qryConfissaoXOperFLGTIPOOPER: TStringField;
    qryConfissaoXOperVLROPERACAO: TFloatField;
    qryConfissaoXOperOBSERVACAO: TStringField;
    qryConfissaoXOperLANCNUMLAN: TFloatField;
    qryConfissaoXOperIDMODULO: TFloatField;
    qryConfissaoXOperDESC_TIPOOPER: TStringField;
    edtValorOperacao: TDBRealEdit;
    Label6: TLabel;
    edtSaldoAnterior: TDBRealEdit;
    Label19: TLabel;
    edtTotAcres: TDBRealEdit;
    Label8: TLabel;
    edTotDesc: TDBRealEdit;
    Label20: TLabel;
    edtNovoSaldoOper: TDBRealEdit;
    wwDBGrid1: TwwDBGrid;
    Label10: TLabel;
    edSaldoDev: TDBRealEdit;
    Label23: TLabel;
    cmDataIni: TCMDateTimePicker;
    Label9: TLabel;
    cmDtVencto: TCMDateTimePicker;
    Label11: TLabel;
    cmdtAmortiz: TCMDateTimePicker;
    Label12: TLabel;
    dbedtParc: TDBRealEdit;
    gbIntervalo: TGroupBox;
    dbspnPeriodo: TwwDBSpinEdit;
    dbcbPerParc: TwwDBComboBox;
    Label16: TLabel;
    dblcbIndCorr: TCMDBLookupCombo;
    Label17: TLabel;
    dbEdtJuros: TDBRealEdit;
    Label46: TLabel;
    dbedtMesRefReajuste: TwwDBSpinEdit;
    lblPeriod: TLabel;
    dbcbPerJur: TwwDBComboBox;
    Label47: TLabel;
    dbEdtMulta: TDBRealEdit;
    Label18: TLabel;
    Panel2: TPanel;
    bbAplicar: TBitBtn;
    bbExcluir: TBitBtn;
    DBgrdAlteradoresLanc: TwwDBGrid;
    dsCondResult: TwwDataSource;
    updCondResult: TUpdateSQL;
    qryCondResult: TwwQuery;
    qryCondResultIDCONDRESULT: TFloatField;
    qryCondResultIDCONFISSAODIVIDA: TFloatField;
    qryCondResultSALDODEVEDOR: TFloatField;
    qryCondResultINICIOCONFISSAO: TDateTimeField;
    qryCondResultPROXVENCTO: TDateTimeField;
    qryCondResultPROXAMORTIZACAO: TDateTimeField;
    qryCondResultPARCELAS: TFloatField;
    qryCondResultINDCORRECAO: TFloatField;
    qryCondResultDSCINDCORR: TStringField;
    qryCondResultMESREFREAJUSTE: TFloatField;
    qryCondResultTAXAJUROS: TFloatField;
    qryCondResultTAXAMULTA: TFloatField;
    qryCondResultIDMODULO: TFloatField;
    qryMoeda: TwwQuery;
    qryMoedaMOESIGLA: TStringField;
    qryMoedaFLGPERCVALOR: TStringField;
    qryMoedaMOEDESC: TStringField;
    qryMoedaMOECODIGO: TFloatField;
    Panel3: TPanel;
    lblProgress: TLabel;
    lblContador: TLabel;
    ProgressBar: TProgressBar;
    qryBaixaContraAlterador: TwwQuery;
    qryBaixaContraAlteradorIDBAIXACONTRA: TFloatField;
    qryBaixaContraAlteradorACRESDECRES: TStringField;
    qryBaixaContraAlteradorCODTIPIMOVEL: TStringField;
    qryBaixaContraAlteradorCODALTERADOR: TFloatField;
    qryBaixaContraAlteradorIDMODULO: TFloatField;
    qryConfissaoXDoc: TwwQuery;
    qryConfissaoXDocIDCONFISSAODIVIDA: TFloatField;
    qryConfissaoXDocCODDOCUMENTO: TFloatField;
    qryConfissaoXDocTIPO: TFloatField;
    qryConfissaoXDocIDMODULO: TFloatField;
    qryContratoCONNUMERO: TStringField;
    qryContratoCONNOME: TStringField;
    updLancamento: TUpdateSQL;
    qryLancamento: TwwQuery;
    qryLancamentoCONTRATO: TStringField;
    qryLancamentoIMOVEL: TStringField;
    qryLancamentoMESCOMPETENCIA: TFloatField;
    qryLancamentoANOCOMPETENCIA: TFloatField;
    qryLancamentoDATAVENCIMENTO: TDateTimeField;
    qryLancamentoDATALIMITE: TDateTimeField;
    qryLancamentoVLRLANCRECEB: TFloatField;
    qryLancamentoIDDOCUMENTO: TFloatField;
    qryLancamentoNODOCUMENTO: TFloatField;
    qryLancamentoDTINICTBDIARIA: TDateTimeField;
    qryLancamentoDTFIMCTBDIARIA: TDateTimeField;
    qryLancamentoCODTIPIMOVEL: TStringField;
    qryLancamentoDATAEMISSAO: TDateTimeField;
    qryLancamentoIDLANCIMOVEL: TFloatField;
    qryLancamentoIDPESSOA: TFloatField;
    qryLancamentoIDIMOVEL: TFloatField;
    qryLancamentoIDTIPOCUSTORECIMO: TFloatField;
    qryLancamentoIDCONTRATOIMOVEL: TFloatField;
    qryLancamentoDATALANCAMENTO: TDateTimeField;
    qryLancamentoMESREFERENCIA: TFloatField;
    qryLancamentoANOREFERENCIA: TFloatField;
    qryLancamentoRECPAG: TStringField;
    qryLancamentoVLRLANCOMRECEB: TFloatField;
    qryLancamentoMOEDARECEB: TFloatField;
    qryLancamentoIDFORCLI: TFloatField;
    qryLancamentoFLGAGRUPAR: TStringField;
    qryLancamentoFLGAGRUPADO: TFloatField;
    qryLancamentoFLGTIPOLANCAMENTO: TStringField;
    qryLancamentoFLGINTEGRADO: TFloatField;
    qryLancamentoFLGORIGEMLANC: TStringField;
    qryLancamentoIDUSUARIOSISTEMA: TFloatField;
    qryLancamentoVLRJUROS: TFloatField;
    qryLancamentoVLRMULTA: TFloatField;
    qryLancamentoVLRCORRECAOMON: TFloatField;
    qryLancamentoVLRCOMISSAO: TFloatField;
    qryLancamentoIDPROGRAMA: TFloatField;
    qryLancamentoIDEMPRESA: TFloatField;
    qryLancamentoCODCENTROCUSTO: TStringField;
    qryLancamentoCODPORTFORMA: TFloatField;
    qryLancamentoIDMODULO: TFloatField;
    qryContratoIDCONTRATOIMOVEL_1: TFloatField;
    updRateio: TUpdateSQL;
    qryRateio: TwwQuery;
    qryRateioIMOCODIGO: TStringField;
    qryRateioIMOVEL_EXTENSO: TStringField;
    qryRateioCODTIPIMOVEL: TStringField;
    qryRateioGXIPERCENTRATEIO: TFloatField;
    qryRateioPERCENT_RATEIO: TFloatField;
    qryRateioVALOR: TFloatField;
    qryRateio_CONTRATOEXTENSO: TStringField;
    qryRateioIDCONTRATOIMOVEL: TFloatField;
    qryRateioCONNUMERO: TStringField;
    qryRateioCONNOME: TStringField;
    qryRateioIDLOCATARIO: TFloatField;
    qryRateioVLR_PARCELA: TFloatField;
    qryRateioIMOAREA: TFloatField;
    qryRateioIDIMOVEL: TFloatField;
    qryRateioIMOFRACAOIDEAL: TFloatField;
    qryRateioCIMDESCRICAO: TStringField;
    qryContratoCODPORTFORMA: TFloatField;
    cdsBloqueioImob: TCMClientDataSet;
    qryContratoIDLOCATARIO: TFloatField;
    MemErro: TMemo;
    qryConfissaoDivida: TwwQuery;
    qryConfissaoDividaIDCONFISSAODIVIDA: TFloatField;
    qryConfissaoDividaIDCONTRATOIMOVEL: TFloatField;
    qryConfissaoDividaMESCONFISSAO: TFloatField;
    qryConfissaoDividaANOCONFISSAO: TFloatField;
    qryConfissaoDividaDATACONFISSAO: TDateTimeField;
    qryConfissaoDividaCONDRESULTANTES: TFloatField;
    qryConfissaoDividaVLRSALDO: TFloatField;
    qryConfissaoDividaIDMODULO: TFloatField;
    qryConfissaoXCond: TwwQuery;
    upConfissaoXCond: TUpdateSQL;
    qryConfissaoXCondIDCONDRESULT: TFloatField;
    qryConfissaoXCondIDCONFISSAODIVIDA: TFloatField;
    qryConfissaoXCondSALDODEVEDOR: TFloatField;
    qryConfissaoXCondINICIOCONFISSAO: TDateTimeField;
    qryConfissaoXCondPROXVENCTO: TDateTimeField;
    qryConfissaoXCondPROXAMORTIZACAO: TDateTimeField;
    qryCondResultPERIODO: TFloatField;
    qryCondResultPRAZO: TStringField;
    qryCondResultPERIODOTAXA: TStringField;
    qryConfissaoXCondPARCELAS: TFloatField;
    qryConfissaoXCondPERIODO: TFloatField;
    qryConfissaoXCondINDCORRECAO: TFloatField;
    qryConfissaoXCondMESREFREAJUSTE: TFloatField;
    qryConfissaoXCondTAXAJUROS: TFloatField;
    qryConfissaoXCondTAXAMULTA: TFloatField;
    qryConfissaoXCondIDMODULO: TFloatField;
    qryConfissaoXCondPRAZO: TStringField;
    qryConfissaoXCondPERIODOTAXA: TStringField;
    upConfissaoDivida: TUpdateSQL;
    upConfissaoXDoc: TUpdateSQL;
    qryConfissaoxOperacao: TwwQuery;
    upConfissaoxOperacao: TUpdateSQL;
    qryConfissaoxOperacaoIDCONFISSAODIVIDA: TFloatField;
    qryConfissaoxOperacaoIDTIPOCUSTORECIMO: TFloatField;
    qryConfissaoxOperacaoFLGTIPOOPER: TStringField;
    qryConfissaoxOperacaoVLROPERACAO: TFloatField;
    qryConfissaoxOperacaoOBSERVACAO: TStringField;
    qryConfissaoxOperacaoIDMODULO: TFloatField;
    qryConfissaoxOperacaoLANCNUMLAN: TFloatField;
    qryConfissaoDividaPLNCODIGO_OPER: TFloatField;
    qryConfissaoXDocIDCONDRESULT: TFloatField;
    Label21: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    qryTipoCustoRecImov: TwwQuery;
    qryTipoCustoRecImovFLGTIPOOPER: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure bbtnInsereAlteradorClick(Sender: TObject);
    procedure grdParcelasCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdParcelasTopRowChanged(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cboMesChange(Sender: TObject);
    procedure molTipoOperacaobtnBuscaTipoOperClick(Sender: TObject);
    procedure molTipoOperacaobtnLimpaTipoOperClick(Sender: TObject);
    procedure btnExcluiAlteradorClick(Sender: TObject);
    procedure bbAplicarClick(Sender: TObject);
    procedure bbExcluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cmDataIniExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtDataConfissaoExit(Sender: TObject);
    procedure grdParcelasDblClick(Sender: TObject);
    procedure cmDtVenctoExit(Sender: TObject);
    procedure cmdtAmortizExit(Sender: TObject);

  private
    { Private declarations }
    iDocumento          : integer;
    ParamContabeis      : TParamContabeisMT;
    CtrlImobDocumento   : TCtrlImobDocumento;
    CtrlParamIntegra    : TCtrlParamIntegra;
    CtrlPadrLancImovel  : TCtrlPadrLancImovel;
    ComunsImobiliarioDB : TComunsImobiliarioDB;
    CtrlLancamento      : TCtrlImobLancamento;
    _ModeloHist         : TCtrlModeloHistorico;
    CafxContab          : TCtrlCafxContab;
    CtrlTipoReceita     : TCtrlTipoCustoRecImov;
    CtrlBloqueioImob    : TCtrlBloqueioImob;
    CtrlContab          : TCtrlContab;

    fVlrTotal         : currency; // valor total geral
    fTotalParcela     : currency; // total geral dividido pelo nº de parcelas
    fVlrParcela       : currency; // valor  da Parcela
    
    procedure AtribuiPercentRateio;
    procedure CalculaOperacoes;
    function  VerificaPreenchimentoCondicao: Boolean;
    function  VerificaTotalCondicoes: Boolean;
    function  BaixaDocumentos       : Boolean;
    function  ContabilizaOperacao   : Boolean;
    function  InicializaParam   (const sCodTipImovel, sTipoOperacao, sAcresDes : String;
                                 const iTipoRec:Integer ): Boolean;  // Busca dados da parametrização contabil
    function  GeraLancamentos: Boolean;
    function  GravaLancamento(iDocumento: int64; iParcela, iParcelas: integer): Boolean;
    function  GravaConfissao: Boolean;
  public
    { Public declarations }
  end;

var
  frmMovContratoConfissao: TfrmMovContratoConfissao;
  IdContrato, IdCondResult : Integer ;
  fSaldoAtual,SaldoDev , iPlnCodigo: Double  ;
  sErro : String;
implementation

{$R *.DFM}
uses
   USistema, UMensErro,DMS,uVerificaPreenchimento,DBaseDados,uComunsImobiliario,
   uListaCamposHistCapCar,UDocumento,dImobiliario,dLancImovel,uModuloImobiliario;

{ TfrmCadContratoConfissao }

procedure TfrmMovContratoConfissao.FormShow(Sender: TObject);
Var ExtraiMes : String ;
begin
  inherited;
  PagControle.ActivePageIndex := 0;
  IdContrato := 0;
  cboMes.ItemIndex  := DiasInUteis.ExtraiMes(Date)-1;
  DBspnAno.Value    := DiasInUteis.ExtraiAno(Date);

  ExtraiMes := IntToStr(DiasInUteis.ExtraiMes(Date));
  edtDataConfissao.Text      := '01' + '/' + ExtraiMes + '/' + IntToStr(DiasInUteis.ExtraiAno(Date));
end;

procedure TfrmMovContratoConfissao.btnContinuarClick(Sender: TObject);
var iTotReg : Integer;
    iAnoAtual, iMesAtual, iDiaAtual : word;
begin
   if PagControle.ActivePage = tabSelecao then
   begin
      // Checa tela de seleção
       if idContrato <= 0  then
       begin
          MsgDlg('Selecione um Contrato','Erro',mtError,[mbOk],0);
          grbContrato.SetFocus;
          Exit;
       end;
       if edtDataConfissao.Text = '' then begin
          MsgDlg('Informe a Data da Confissão.','Erro',mtError,[mbOk],0);
          edtDataConfissao.SetFocus;
          Exit;
       end;
       iTotReg := 0;
       qryParcInamp.First;
       while not qryParcInamp.Eof do
       begin
          if qryParcInampSELECAO.AsInteger > 0 then
             iTotReg := iTotReg + 1;
          if iTotReg <> 0 then
             break;
          qryParcInamp.Next;
       end;
       if  iTotReg = 0  then
       begin
          MsgDlg('Selecione uma Parcela.','Erro',mtError,[mbOk],0);
          edtDataConfissao.SetFocus;
          Exit;
       end;
       if qryContratoCONDATAASSINATURA.Value > edtDataConfissao.Date then
       begin
          MsgDlg('A data Início da Confissão não pode ser inferior a data de Assinatura do Contrato.','Erro',mtError,[mbOk],0);
          edtDataConfissao.SetFocus;
          Exit;
       end;
       if (DBSpnQtde.Text = '0') or (DBSpnQtde.Text = '') then
       begin
          MsgDlg('É necessário pelo menos 1 condição resultante.','Erro',mtError,[mbOk],0);
          edtDataConfissao.SetFocus;
          Exit;
       end;
       if qryConfissaoXOper.eof then
       begin
         fSaldoAtual             := edtSaldo.Value;
         edtSaldoAnterior.Value  := fSaldoAtual;
         edtNovoSaldoOper.Value  := fSaldoAtual;
       end;

       PagControle.ActivePage  := TabSheet1;
       btnVoltar.Enabled       := True;
       btnConfirmar.Enabled    := False;
       btnContinuar.Enabled    := True;
       qryMoeda.Close;
       qryMoeda.Open;
       exit;
   end ;
   if PagControle.ActivePage = TabSheet1 then
   begin
      edSaldoDev.Value        := edtNovoSaldoOper.Value;
      PagControle.ActivePage  := TabSheet2;
      btnConfirmar.Enabled    := True ;
      btnContinuar.Enabled    := False;
      DecodeDate(now, iAnoAtual, iMesAtual, iDiaAtual);
      if cmDataIni.Text = '' then
      begin
         cmDataIni.Text   := '01' + '/' + IntToStr(iMesAtual) + '/' + IntToStr(ianoAtual) ;
         cmDtVencto.Text  := '01' + '/' + IntToStr(iMesAtual) + '/' + IntToStr(ianoAtual) ;
         cmdtAmortiz.Text := '01' + '/' + IntToStr(iMesAtual) + '/' + IntToStr(ianoAtual) ;
      end;
      exit;
   end;
end;

procedure TfrmMovContratoConfissao.bbtnInsereAlteradorClick(Sender: TObject);
var  fSaldoAnt :Double;
begin
  inherited;
  { Faz o Insert na query }
   if Trim(molTipoOperacao.sNomeOper) = '' then
   begin
      MsgDlg('Obrigatório informar o Tipo de Operação', 'Aviso', mtError, [mbOk], 0);
      Exit;
   end;
   if edtValorOperacao.Value = 0 then
   begin
      MsgDlg('Obrigatório informar o Valor da Operação', 'Aviso', mtError, [mbOk], 0);
      Exit;
   end;
   if memObservacao.Text = '' then
   begin
      MsgDlg('Obrigatório informar a Observação da Operação', 'Aviso', mtError, [mbOk], 0);
      Exit;
   end;
   qryConfissaoXOper.First;
   while not qryConfissaoXOper.eof do
   begin
        if qryConfissaoXOperIDTIPOCUSTORECIMO.Value  = molTipoOperacao.iTipoOper then
        begin
           MsgDlg('Operação já cadastrada.', 'Aviso', mtError, [mbOk], 0);
           Exit;
        end;
        qryConfissaoXOper.next;
   end;
   qryConfissaoXOper.Append;
   qryConfissaoXOper.FieldByName('IDCONFISSAODIVIDA').AsInteger := 0;
   qryConfissaoXOper.FieldByName('IDTIPOCUSTORECIMO').AsInteger := molTipoOperacao.iTipoOper;
   qryConfissaoXOper.FieldByName('FLGTIPOOPER').AsString        := molTipoOperacao.sTipoOper;
   qryConfissaoXOper.FieldByName('DESC_TIPOOPER').AsString      := molTipoOperacao.sNomeOper;
   qryConfissaoXOper.FieldByName('VLROPERACAO').AsFloat         := edtValorOperacao.Value;
   qryConfissaoXOper.FieldByName('OBSERVACAO').AsString         := memObservacao.Text;
   qryConfissaoXOper.Post;
   edtValorOperacao.Clear;
   CalculaOperacoes;
end;
procedure TfrmMovContratoConfissao.CalculaOperacoes;
begin
   { Varre a query para efetuar o somatorio de acréscimos e descontos e novo saldo }

   edtTotAcres.Value := 0;
   edTotDesc.Value   := 0;

   qryConfissaoXOper.DisableControls;
   qryConfissaoXOper.First;
   while not qryConfissaoXOper.eof do
   begin
     if qryConfissaoXOper.FieldByName('FLGTIPOOPER').AsString = 'A' then
        edtTotAcres.Value := edtTotAcres.Value + qryConfissaoXOper.FieldByName('VLROPERACAO').AsFloat;

     if qryConfissaoXOper.FieldByName('FLGTIPOOPER').AsString = 'D' then
        edTotDesc.Value := edTotDesc.Value + qryConfissaoXOper.FieldByName('VLROPERACAO').AsFloat;

     qryConfissaoXOper.Next;
   end;
   qryConfissaoXOper.First;
   qryConfissaoXOper.EnableControls;

   edtNovoSaldoOper.Value := edtSaldoAnterior.Value + edtTotAcres.Value - edTotDesc.Value;
end;

procedure TfrmMovContratoConfissao.grdParcelasCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmMovContratoConfissao.grdParcelasTopRowChanged(Sender: TObject);
begin
  inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmMovContratoConfissao.BitBtn1Click(Sender: TObject);
Var ExtraiMes : String ;
begin
  inherited;  
  dtmMS.MS_ContratoConfissao.Executar;
  Repaint;
  // redesenha o form na volta do MontaSelect
  if dtmMS.MS_ContratoConfissao.RetornouValor then
  begin
      if edtDataConfissao.Text = '' then
      begin
         cboMes.ItemIndex  := DiasInUteis.ExtraiMes(Date)-1;
         DBspnAno.Value    := DiasInUteis.ExtraiAno(Date);
         ExtraiMes := IntToStr(DiasInUteis.ExtraiMes(Date));
         edtDataConfissao.Text      := '01' + '/' + ExtraiMes + '/' + IntToStr(DiasInUteis.ExtraiAno(Date));
      end;
      IdContrato  := 0;    SaldoDev := 0; IdCondResult := 0;
      BitBtn2Click(Sender);
      if StrToInt(dtmMS.MS_ContratoConfissao.ValoresChave[0])  > 0 then
      begin
          edtConNumero.text := dtmMS.MS_ContratoConfissao.ValoresChave[1] ;
          edtConNome.text := dtmMS.MS_ContratoConfissao.ValoresChave[2]  ;
          qryContrato.Close ;
          qryContrato.ParamByName('pIDCONTRATOIMOVEL').AsFloat := StrTofloat(dtmMS.MS_ContratoConfissao.ValoresChave[0]);
          qryContrato.Open ;
          if qryContratoIDCONTRATOIMOVEL.Value > 0 then
          begin
              IdContrato             := StrToInt(dtmMS.MS_ContratoConfissao.ValoresChave[0]);
              edtLocatario.Text      := qryContratoLOCATARIO.Value;
              edtAdministradora.Text := qryContratoADMINISTRADORA.Value;
              edtResponsavel.Text    := qryContratoRESPONSAVEL.Value;
              qryParcInamp.Close;
              qryParcInamp.ParamByName('pIDCONTRATOIMOVEL').AsFloat := StrTofloat(dtmMS.MS_ContratoConfissao.ValoresChave[0]);
              qryParcInamp.Open ;
              if  qryParcInamp.eof then
              begin
                 MsgDlg('Não há parcelas inadimplentes para esse contrato .','Erro',mtError,[mbOk],0);
                 BitBtn2Click(Sender);
                 grbContrato.SetFocus;
                 Exit;
              end;
              qryParamImovel.Close;
              qryParamImovel.Open ;
              edtData.Text      := qryParamImovelDTULTFECH.AsString;
          end
          else
          begin
              MsgDlg('Contrato deve estar Vigente .','Erro',mtError,[mbOk],0);
              BitBtn2Click(Sender);
              grbContrato.SetFocus;
              Exit;
          end;
          qryConfissaoXOper.Close;
          qryConfissaoXOper.open;
          qryCondResult.Close;
          qryCondResult.Open;
      end;
  end;
end;

procedure TfrmMovContratoConfissao.BitBtn2Click(Sender: TObject);
begin
  inherited;
   IdContrato  := 0;
   SaldoDev    := 0;
   edtData.Clear;
   qryContrato.Close;
   qryParcInamp.Close;
   edtConNumero.clear;
   edtConNome.Clear;
   edtData.Clear;
   edtSaldo.Clear;
   edtConNumero.Clear;
   edtConNome.Clear;
   edtLocatario.Clear;
   edtAdministradora.Clear;
   edtResponsavel.Clear;
   sErro        := '';
   MemErro.Text := '';
   qryConfissaoXOper.close;
   qryConfissaoXOper.Open;
   iPlnCodigo   := 0;
   edtTotAcres.Value := 0;
   edTotDesc.Value   := 0;
end;

procedure TfrmMovContratoConfissao.cboMesChange(Sender: TObject);
var ExtraiMes : String;
begin
  inherited;
  ExtraiMes             := IntToStr(cboMes.ItemIndex + 1);
  edtDataConfissao.Text := '01' + '/' + ExtraiMes + '/' + DBspnAno.Text;
end;

procedure TfrmMovContratoConfissao.molTipoOperacaobtnBuscaTipoOperClick(
  Sender: TObject);
begin
  inherited;

  dtmMS.MS_TipoOperacao.Filtro.Add(' IDMODULO =  ' +  IntToStr(Sistema.IdModulo)) ;
  dtmMS.MS_TipoOperacao.Filtro.Add(' RECCUSTO = ''O'' ' ) ;
  molTipoOperacao.btnBuscaTipoOperClick(Sender);
  dtmMS.MS_TipoOperacao.Filtro.Clear;
end;

procedure TfrmMovContratoConfissao.molTipoOperacaobtnLimpaTipoOperClick(
  Sender: TObject);
begin
  inherited;
  molTipoOperacao.btnLimpaTipoOperClick(Sender);

end;

procedure TfrmMovContratoConfissao.btnExcluiAlteradorClick(
  Sender: TObject);
begin
  inherited;
  if MsgDlg('Confirma a Exclusão da Operação Selecionada?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
      qryConfissaoXOper.Delete;
      CalculaOperacoes;
   end;
end;

procedure TfrmMovContratoConfissao.bbAplicarClick(Sender: TObject);
begin
  inherited;
  if VerificaPreenchimentoCondicao then
  begin
      if IdCondResult = 0 then
         IdCondResult := 1
      else
         IdCondResult := IdCondResult + 1 ;

      qryCondResult.Insert;
      qryCondResultIDCONDRESULT.AsFloat       := IdCondResult;
      qryCondResultSALDODEVEDOR.AsFloat       := edSaldoDev.Value;
      qryCondResultINICIOCONFISSAO.AsDateTime := cmDataIni.Date;
      qryCondResultPROXVENCTO.AsDateTime      := cmDtVencto.Date;
      qryCondResultPROXAMORTIZACAO.AsDateTime := cmdtAmortiz.Date;
      qryCondResultPARCELAS.AsFloat           := dbedtParc.Value;
      qryCondResultPERIODO.AsFloat            := dbspnPeriodo.Value;
      qryCondResultPRAZO.AsString             := dbcbPerParc.Value;
      qryCondResultTAXAJUROS.AsFloat          := dbedtJuros.Value;
      qryCondResultTAXAMULTA.AsFloat          := dbEdtMulta.Value;
      qryCondResultPERIODOTAXA .AsString      := dbcbPerJur.Value;
      if dblcbIndCorr.Text <> '' then
      begin
         qryCondResultINDCORRECAO.AsInteger    := StrToInt(dblcbIndCorr.LookupValue);
         qryCondResultDSCINDCORR.AsString  := dblcbIndCorr.Text;
      end;
      qryCondResultMESREFREAJUSTE.AsFloat    := dbedtMesRefReajuste.Value;
      qryCondResult.Post;
   end;
end;
function TfrmMovContratoConfissao.VerificaPreenchimentoCondicao: Boolean;
var dDataIni : TDateTime;
    iQtde    : Double;
begin
   Result   := False;
   dDataIni := StrToDate('01/' + FormatFloat('00',cbomes.ItemIndex+1) + '/' + IntToStr(trunc(DBspnAno.Value)) );
   try
      if edSaldoDev.Value  <= 0 then
         raise EValidacao.CreateVal('Informe o Saldo Devedor ',edSaldoDev);

      if cmDataIni.Text = '' then
         raise EValidacao.CreateVal('Data de início da condição não foi preenchida',cmDataIni);
      if cmDataIni.Date > cmDtVencto.date then
         raise EValidacao.CreateVal('Data de início da condição não pode ser posterior a data de vencimento ',cmDataIni);

      if cmDataIni.Date < edtDataConfissao.Date then
         raise EValidacao.CreateVal('Data de início da condição não pode ser anterior a data de Assinatura do contrato ',cmDataIni);

      if cmDtVencto.Text = '' then
         raise EValidacao.CreateVal('Data do próximo vencimento não foi preenchida',cmDtVencto);
      if cmDtVencto.Date < dDataIni then
         raise EValidacao.CreateVal('Data do próximo vencimento não pode ser inferior ao início da Confissão',cmDtVencto);

      if dbEdtParc.Value <= 0 then
         raise EValidacao.CreateVal('Nr. de Parcelas deve ser preenchido',dbEdtParc);

      if dbspnPeriodo.Value <= 0 then
         raise EValidacao.CreateVal('Intervalo entre as Parcelas deve ser preenchido',dbSpnPeriodo);

      if dbcbPerParc.ItemIndex < 0 then
         raise EValidacao.CreateVal('Periodicidade das Parcelas deve ser preenchida',dbcbPerParc);

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;

procedure TfrmMovContratoConfissao.bbExcluirClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Confirma a Exclusão da Condição?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
      qryCondResult.Delete;
   end;
end;

procedure TfrmMovContratoConfissao.btnConfirmarClick(Sender: TObject);
var bResult : Boolean; iExercicio, iPeriodo :Integer  ;
begin
  inherited;
  if MsgDlg('Confirma a Confissão de Dívida?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
     Exit;
 end;
 sErro := '';
 MemErro.Text := '';
 if VerificaTotalCondicoes then
 begin
     sErro := '';
     MemErro.Text := '';
     sErro := 'Ocorreram ERROS durante a Confissão de Dívida.';
     try
         try
            StartTransacao;
            bResult := True;
            iPlnCodigo := 0;

            if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataConfissao.Text) then
            begin
               sErro := CtrlContab.MessageInfo;
               MsgDlg('Período bloqueado pela Contabilidade.', 'Aviso', mtWarning, [mbOk], 0);
               bResult := False;
            end;
            if bResult then bResult := GravaConfissao;
            if bResult then bResult := BaixaDocumentos;
            if bResult then bResult := ContabilizaOperacao;
            if bResult then bResult := GeraLancamentos;
            if bResult then
            begin
               CommitTransacao;
               MsgDlg('Confissão de Dívida gerada.','Aviso',mtWarning,[mbOk],0);
               PagControle.ActivePage := TabSelecao;
               btnConfirmar.Enabled   := False;
               btnVoltar.Enabled      := False;
               btnContinuar.Enabled   := True;
               BitBtn2Click(Sender);
               qryConfissaoXOper.Close;
               qryCondResult.Close;
            end
            else
            begin
               RollBackTransacao;
               MemErro.Text := sErro;
               Exit;
            end;

         except
            RollBackTransacao;
            MsgDlg('Ocorreram ERROS durante a Confissão de Dívida','Erro',mtError,[mbOk],0);
            MemErro.Text := sErro;
         end;
     finally
         EscondeProgresso(ProgressBar, lblProgress, lblContador);

     end;
 end;
end;
// -----------------------------------------------------------------------------
// Verifica o Valor total das condições com o Saldo devedor no processo anterior
// calculado pelo sistema.
//------------------------------------------------------------------------------
function TfrmMovContratoConfissao.VerificaTotalCondicoes: Boolean;
var fTotal : Extended;
    bZero  : Boolean;
    iQtde  : Integer;
begin
   Result := True;
   bZero  := False;
   fTotal := 0;
   iQtde  := 0;
   qryCondResult.DisableControls;
   qryCondResult.First;
   while not qryCondResult.eof do begin
      Inc(iQtde);
      if qryCondResultSALDODEVEDOR.AsFloat = 0 then
         bZero := True;
      fTotal := fTotal + qryCondResultSALDODEVEDOR.AsFloat;
      qryCondResult.Next;
   end;
   qryCondResult.EnableControls;
   if iQtde <> DBSpnQtde.Value then begin
      MsgDlg('Número de Condições cadastradas diferente do total Informado','Aviso',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   end;

   if (iQtde > 1) and (bZero) then begin
      MsgDlg('Existem condições sem valor de financiamento','Aviso',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   end;

   if ( (Arredonda(fTotal,2) <> Arredonda(edtNovoSaldoOper.Value,2))) then
   begin
         MsgDlg('O saldo das condições de pagamento informadas está diferente do Saldo Devedor da confissão de dívidas.','Aviso',mtWarning,[mbOk],0);
         Result := False;
         Exit;
   end;

end;
procedure TfrmMovContratoConfissao.cmDataIniExit(Sender: TObject);
begin
  inherited;
  if cmDataIni.Text <> '' then
  begin
      try
         if StrToDate(cmDataIni.Text) < StrToDate(edtDataConfissao.Text) then
            raise EValidacao.CreateVal('Início do Vencimento deve ser maior ou igual a Data da Confissão.',dbEdtParc);
          except
          on ev : EValidacao do begin
             if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
             Repaint;
             if ev.Control.CanFocus then ev.Control.SetFocus;
             Exit;
          end;
       end;
   end;
end;

function TfrmMovContratoConfissao.BaixaDocumentos: Boolean;
var  Saldo:Currency;
     sDebCreDoc,sSql:string;
     iAtual,iQuant :  Integer;
     iPlanilha : LongInt;
begin
   Result := False;
   iQuant := qryParcInamp.RecordCount;
   iAtual := 1;
   MostraProgresso(ProgressBar, lblProgress, lblContador, iQuant, 'Processando as Parcelas Inadimplentes Selecionadas...');

   qryParcInamp.First ;
   iPlanilha  := 0;
   while not qryParcInamp.eof do
   begin
       if qryParcInampSELECAO.AsInteger > 0 then
       begin
          CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
          CtrlImobDocumento.OpenTransaction := False;
          CtrlImobDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
          CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
          CtrlImobDocumento.IdUsuario       := Sistema.IdUsuario;
          CtrlImobDocumento.IdEspAcesso     := Sistema.idEspAcesso;
          CtrlImobDocumento.IdModulo        := Sistema.idModulo;
          qryBaixaContraAlterador.close;
          qryBaixaContraAlterador.ParamByName('CODTIPIMOVEL').AsString := qryContratoCODTIPIMOVEL.Value;
          if qryParcInampSALDO.value > 0 then
          begin
             Saldo  :=  qryParcInampSALDO.value;
             qryBaixaContraAlterador.ParamByName('ACRESDECRES').AsString := 'D' ;
             sDebCreDoc := 'C';
          end
          else
          begin
             Saldo  := qryParcInampSALDO.value  * (-1);
             qryBaixaContraAlterador.ParamByName('ACRESDECRES').AsString := 'A';
             sDebCreDoc := 'D' ;
          end;
          qryBaixaContraAlterador.Open;
          if not qryBaixaContraAlterador.IsEmpty then
          begin
              CtrlImobDocumento.Lanctodocum.SetValues(  edtDataConfissao.Date,
                                                        qryParcInampCODDOCUMENTO.AsInteger,
                                                        0,
                                                        Saldo,
                                                        0,
                                                        Saldo,
                                                        0,
                                                        iPlanilha,
                                                        0,
                                                        Sistema.idUsuario,
                                                        Sistema.idEmpresa,
                                                        0, 0, 0, 0,
                                                        qryBaixaContraAlteradorCODALTERADOR.asInteger,
                                                        '4', '', '', '', 'Contra Baixa Alterador - Confissão Dívida.', '', '', '',
                                                        sDebCreDoc,
                                                        Sistema.idModulo,
                                                        ParamIntegra.Plano,
                                                        Sistema.UsaPlanoPatro,
                                                        True);
              Result := True;
              if not CtrlIMobDocumento.Insert then
              begin
                 Result := False;
                 MsgDlg('Alterador não parametrizado. Não será possível gerar a Confissão de Dívida. ','Aviso',mtWarning,[mbOk],0);
                 sErro := sErro +' ' +  CtrlImobDocumento.MessageInfo ;
                 break;
              end;

              if CtrlIMobDocumento.PlnCodigo > 0 then
                   iplanilha := CtrlIMobDocumento.PlnCodigo;
          end
          else
          begin
              Result := False;
              MsgDlg('Alterador não parametrizado. Não será possível gerar a Confissão de Dívida. ','Aviso',mtWarning,[mbOk],0);
          end;
       end;
       qryParcInamp.Next;

       if not qryParcInamp.Eof then
       begin
            iAtual := iAtual + 1;
            AndaProgresso(ProgressBar, lblProgress, lblContador, iAtual, iQuant);
       end;
   end;
   if iPlanilha >   0 then
   begin
        sSql := 'UPDATE PLANILHA                   '+#13+
                '   SET PLNTOTDEB =   ' + ComunsImobiliario.StrTran(FloatToStr(edtSaldoAnterior.Value),',','.')  +#13+
                '       ,PLNTOTCRE =  ' + ComunsImobiliario.StrTran(FloatToStr(edtSaldoAnterior.Value),',','.')   +#13+
                ' WHERE PLNCODIGO =   ' + IntToStr(iplanilha) ;
        if not ExecutaQuery(dtmBaseDados.qry, sSql) then
        begin
           Result := False;
           raise exception.Create( 'Erro ao Atulizar dados da Planilha. ' );
       end;
   end;


end;

procedure TfrmMovContratoConfissao.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlImobDocumento := TCtrlImobDOcumento.Create;
  CtrlParamIntegra  := TCtrlParamIntegra.Create;
  CtrlImobDocumento.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                ComunsImobiliario.MensErroMT);
  CtrlPadrLancImovel  := TCtrlPadrLancIMovel.Create(Sistema.IdEmpresa, Sistema.IdModulo);
  CtrlPadrLancImovel.InitializeAs( Padroes );
  CtrlParamIntegra.InitializeAs(CtrlImobDocumento);
  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IdEmpresa, Sistema.IdModulo,
                                                     Sistema.IdUsuario, Sistema.IdEspAcesso,
                                                     Sistema.UsaPlanoPatro);
  ComunsImobiliarioDB.InitializeAs( Padroes );

  CtrlLancamento := TCtrlImobLancamento.Create;
  CtrlLancamento.InitializeAs(Padroes);
  _ModeloHist    := TCtrlModeloHistorico.Create;
  _ModeloHist.InitializeAs(Padroes);
  CafxContab  := TCtrlCafxContab.Create;
  CafxContab.InitializeAs(Padroes);
  CtrlTipoReceita := TCtrlTipoCustoRecImov.Create;

  CtrlTipoReceita.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                             ComunsImobiliario.MensErroMT);

  CtrlBloqueioImob := TCtrlBloqueioImob.Create;
  CtrlBloqueioImob.InitializeAs(CtrlTipoReceita);
  CtrlBloqueioImob.CdsBloqueioImob := cdsBloqueioImob;
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);
end;

procedure TfrmMovContratoConfissao.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlImobDocumento);
  FreeAndNil( CtrlPadrLancImovel );
  FreeAndNil( ComunsImobiliarioDB );
  FreeAndNil( CtrlLancamento );
  FreeAndNil(_ModeloHist);
  FreeAndNil( CafxContab);
  FreeAndNil( CtrlTipoReceita );
  FreeAndNil( CtrlBloqueioImob );
  FreeAndNil(CtrlContab);
end;

/////////////////////////////////////////////////
//Função utilizada para truncar um valor real
/////////////////////////////////////////////////
Function TruncVal(Value:Real;Casas:Integer):Real;
/////////////////////////////////////////////////
Var sValor:String;
    nPos:Integer;
begin
   //Transforma o valor em string
   sValor := FloatToStr(Value);

   //Verifica se possui pondo decimal
   nPos := Pos(DecimalSeparator,sValor);
   If ( nPos > 0 ) Then begin
      sValor := Copy(sValor,1,nPos+Casas);
   End;

   Result := StrToFloat(sValor);
end;

function TfrmMovContratoConfissao.ContabilizaOperacao: Boolean;
var iAtual,iQuant : Integer;
    sMens,sDtLancto,sHistoricoD , sSql : String;
    _cdsIntegra : TClientDataSet;
    dValorTotal , iPlnCodigo, saldo : Double;
    dValor: Currency;
begin
   Result      := True;
   sDtLancto   := DateToStr(edtDataConfissao.Date);
   iAtual      := 1;
   dValor      := 0;
   dValorTotal := 0;
   iQuant := qryConfissaoxOperacao.RecordCount;

   MostraProgresso(ProgressBar, lblProgress, lblContador, iQuant, 'Contabilizando Operação...');
   _cdsIntegra := TClientDataSet.Create(nil);
   try
     try
        qryConfissaoxOperacao.First;
        iPlnCodigo := 0 ;
        saldo      := 0 ;
        while not qryConfissaoxOperacao.Eof do
        begin
          if not InicializaParam( qryContratoCODTIPIMOVEL.AsString,'O',qryConfissaoxOperacaoFLGTIPOOPER.Value,
                                  qryConfissaoxOperacao.FieldByName('IDTIPOCUSTORECIMO').AsInteger) then
           begin
              Result := False;
              Break;
           end;

           _cdsIntegra.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(qryContratoIDCONTRATOIMOVEL.AsInteger);
           dValorTotal := 0;
           while not _cdsIntegra.Eof do
           begin
            if _cdsIntegra.RecNo = _cdsIntegra.RecordCount then
            begin
              dValor := qryConfissaoxOperacao.FieldByName('VLROPERACAO').AsFloat - dValorTotal;
              dValor := StrToFLoat(formatfloat('#0.00', dValor));
            end
            else
              dValor := (qryConfissaoxOperacao.FieldByName('VLROPERACAO').AsFloat *
                         _cdsIntegra.FieldByName('PERCENTRATEIO').asFloat) / 100;
              dValor := TruncVal( dValor, 2);
            dValorTotal := dValorTotal + dValor;
            sHistoricoD := ' Contrato: '+  qryContratoCONNUMERO.AsString + ' - ' +
                           ' Operação Confissão de Divida -';
            if  qryConfissaoxOperacaoFLGTIPOOPER.Value = 'A' then
                sHistoricoD := sHistoricoD +  ' Acréscimo.'
            else
                sHistoricoD := sHistoricoD +  ' Desconto.' ;
            if not CtrlLancamento.InsereLancaContab ( '2',
                                                      Sistema.idEmpresa,
                                                      Sistema.idModulo,
                                                      Sistema.idUsuario,
                                                      CtrlParamIntegra.Plano,
                                                      ParamContabeis.iUnidNegoc, 0, 0,
                                                      _cdsIntegra.FieldByName('IDPLANOPREV').asInteger,
                                                      _cdsIntegra.FieldByName('IDPATRO').asInteger,
                                                      iPlnCodigo, 0,
                                                      sDtLancto,
                                                      '',
                                                      sHistoricoD,
                                                      '',
                                                      '',
                                                      '',
                                                      '', //SHist5
                                                      '03',
                                                      ParamContabeis.sCentroCustoDebito,
                                                      ParamContabeis.sContaContabilDebito,
                                                      ParamContabeis.sCentroCustoCredito,
                                                      ParamContabeis.sContaContabilCredito,
                                                      '',
                                                      dValor,
                                                      False,
                                                      Sistema.UsaPlanoPatro,
                                                      -1,
                                                      Date, -1, -1, True, -1, False,
                                                      qryConfissaoxOperacao.FieldByName('VLROPERACAO').AsFloat) then
              raise Exception.Create ( CtrlLancamento.MessageInfo )
            else
               if iPlnCodigo = 0 then
                  iPlnCodigo := CtrlLancamento.RetornoPlnCodigo;
              _cdsIntegra.Next;
           end;
           qryConfissaoxOperacao.Edit;
           qryConfissaoxOperacao.FieldByName('LANCNUMLAN').AsInteger := CtrlLancamento.NumLancamento;
           qryConfissaoxOperacao.post;
           qryConfissaoxOperacao.ApplyUpdates;
           saldo := saldo + qryConfissaoxOperacao.FieldByName('VLROPERACAO').AsFloat ;
           qryConfissaoxOperacao.Next;
           if not qryConfissaoxOperacao.Eof then
           begin
            iAtual := iAtual + 1;
            AndaProgresso(ProgressBar, lblProgress, lblContador, iAtual, iQuant);
          end;
        end;
        qryConfissaoDivida.edit;
        qryConfissaoDividaPLNCODIGO_OPER.Value    := iPlnCodigo;
        qryConfissaoDivida.post;
        qryConfissaoDivida.ApplyUpdates;
        if iPlnCodigo >   0 then
        begin
            sSql := 'UPDATE PLANILHA                   '+#13+
                    '   SET PLNTOTDEB =   ' + ComunsImobiliario.StrTran(FloatToStr(saldo),',','.')  +#13+
                    '       ,PLNTOTCRE =  ' + ComunsImobiliario.StrTran(FloatToStr(saldo),',','.')   +#13+
                    ' WHERE PLNCODIGO =   ' + FloatToStr(iPlnCodigo) ;
            if not ExecutaQuery(dtmBaseDados.qry, sSql) then
            begin
               Result := False;
               raise exception.Create( 'Erro ao Atualizar dados da Planilha. ' );
           end;
        end;
     except
        on E : Exception do begin
           Result := False;
           MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
        end;
     end;
   finally
    FreeAndNil(_cdsIntegra);
   end;

end;
// -----------------------------------------------------------------------------
// Carrega parâmetros para contabilização
// -----------------------------------------------------------------------------
function TfrmMovContratoConfissao.InicializaParam(const sCodTipImovel, sTipoOperacao,sAcresDes :String; const iTipoRec:Integer) : Boolean;
var iCodErro : Integer;
    bImovel : Boolean;
begin
   Result := True;
    CtrlPadrLancImovel.ZeraPadrLancContabil( ParamContabeis );
   // Busca a Parametrização Contábil
   if not CtrlPadrLancImovel.BuscaPadrLancContabil( ParamContabeis, iCodErro,
                                                   'O', False,
                                                   Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   qryConfissaoxOperacaoIDTIPOCUSTORECIMO.AsInteger,
                                                   qryContratoCODTIPIMOVEL.AsString,
                                                   -1,
                                                   qryContratoIDCONTRATOIMOVEL.AsInteger,
                                                   sAcresDes) then
   begin
      Result := False;
      MsgDlg('Alterador não parametrizado. Não será possível gerar a Confissão de Dívida. ','Aviso',mtWarning,[mbOk],0);
      sErro := sErro +' ' +  CtrlPadrLancImovel.MessageInfo ;
   end;
end;
function TfrmMovContratoConfissao.GeraLancamentos: Boolean;
var
   fValorRateado,fTotalRateado : currency;
   fSobraGeral       : currency; // controle do total restante
   fSobraParcela     : currency; // controle do valor restante de cada parcela
   fVlrParcelaImovel : currency; // valor do imóvel na Parcela
   iContador,j, i  : integer;
   iAno1,iMes1,iDia1 : word;
   fPercentRateio, fCount, fAtual   : double;
   fTotalQuery, fTotalAtual: double;
begin
   Result := True;
   qryRateio.Close;
   qryRateio.ParamByName('PIDCONTRATOIMOVEL').AsInteger := qryContratoIDCONTRATOIMOVEL.AsInteger;
   qryRateio.Open;
   AtribuiPercentRateio;
   qryCondResult.First;
   while not(qryCondResult.EOF) do
   begin
       iContador := 1;
       qryRateio.First;
       fTotalRateado := Arredonda(qryCondResultSALDODEVEDOR.Value, 2);
       while not(qryRateio.EOF) do
       begin
            fValorRateado := Arredonda(qryCondResultSALDODEVEDOR.Value * qryRateio.FieldByName('GXIPERCENTRATEIO').AsFloat / 100, 2);
            fValorRateado := Arredonda(fValorRateado * qryRateio.FieldByName('PERCENT_RATEIO').AsFloat / 100, 2);
            qryRateio.Edit;
            // se for o ultimo registro da query colocar o valor restante nela
            if iContador = qryRateio.RecordCount then
               qryRateio.FieldByName('VALOR').AsFloat := fTotalRateado
            else
               qryRateio.FieldByName('VALOR').AsFloat := fValorRateado;
            qryRateio.Post;
            qryRateio.Next;
            fTotalRateado := fTotalRateado - fValorRateado;
            inc(iContador);
       end;
       // nº de parcelas
       j := trunc(qryCondResultPARCELAS.Value);
       // valor de cada parcela e Total TOTAL das parcelas
       fSobraGeral    := qryCondResultSALDODEVEDOR.Value;
       fTotalParcela  := Arredonda(qryCondResultSALDODEVEDOR.Value / j, 2);
       // loop para geração das parcelas
       for i := 1 to j do
       begin
            // definição do valor da parcela ----------------------------------------------------------
            // se for última parcela, o valor dessa parcela recebe a sobra
            if i <> j then
               fSobraParcela  := fTotalParcela
            else
                fSobraParcela  := fSobraGeral;
            // ----------------------------------------------------------------------------------------
            qryRateio.First;
            fTotalAtual := 0;
            fTotalQuery := qryRateio.Recordcount;
            // Guarda o nº de documento para os imóveis e já prepara o NoDocumento
            iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux);
            // Grava Tabela ConfissaoXDoc
            qryConfissaoXDoc.Close;
            qryConfissaoXDoc.Open;
            qryConfissaoXDoc.Insert;
            qryConfissaoXDocIDCONFISSAODIVIDA.Value := qryConfissaoDividaIDCONFISSAODIVIDA.Value;
            qryConfissaoXDocCODDOCUMENTO.Value      := iDocumento;
            qryConfissaoXDocTIPO.Value              := 1; // 0 - Baixado 1 - Gerado
            qryConfissaoXDocIDMODULO.Value          := Sistema.IdModulo;
            qryConfissaoXDocIDCONDRESULT.Value      := qryCondResultIDCONDRESULT.Value;
            qryConfissaoXDoc.Post;
            qryConfissaoXDoc.ApplyUpdates;
            while not(qryRateio.EOF) do
            begin
                 // ProgressBar
                 fAtual := 0;
                 fTotalAtual := fTotalAtual + 1;
                 AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fCount);
                 fVlrParcelaImovel := Arredonda(qryRateio.FieldByName('VALOR').AsFloat * (fTotalParcela / qryCondResultSALDODEVEDOR.Value), 2);
                 qryRateio.Edit;
                 // se for o ultimo registro da query colocar o valor restante nela
                 if (fTotalAtual = fTotalQuery) and (i = j) then
                    qryRateio.FieldByName('VLR_PARCELA').AsFloat := Arredonda(fSobraGeral,2)
                 else
                    qryRateio.FieldByName('VLR_PARCELA').AsFloat := fVlrParcelaImovel  ;
                 qryRateio.Post;
                 fSobraParcela  := fSobraParcela - fVlrParcelaImovel;
                 fSobraGeral    := fSobraGeral - fVlrParcelaImovel;
                 // Se o resultado for ZERO, não gerar lançamento
                 // No caso de rateio de contrato existem rateios com 0% (CONTRATOXIMOVEL.CIMPERCENTRATEIO)
                 if ( qryRateio.FieldByName('VALOR').AsFloat <> 0 ) then
                 begin
                      if not(GravaLancamento(iDocumento, i, j)) then
                      begin
                           // Se o resultado for ZERO, não gerar lançamento
                           // No caso de rateio de contrato existem rateios com 0% (CONTRATOXIMOVEL.CIMPERCENTRATEIO)
                           if ( qryRateio.FieldByName('VALOR').AsFloat <> 0 ) then
                           begin
                              if not(GravaLancamento(iDocumento, i, j)) then
                              begin
                                 Result := False;
                                 Break;
                              end;
                           end
                           else
                           begin
                              // Registro de ocorrência (NÃO ERRO) por valor fZERO
                              sErro := '- Valor ZERO --> ' + qryRateio.FieldByName('IMOVEL_EXTENSO').AsString;
                              if not(qryRateio.FieldByName('IDCONTRATOIMOVEL').isNULL) then
                                 sErro := sErro + ', ' + qryRateio.FieldByName('_CONTRATOEXTENSO').asString;
                              memErro.Lines.Add(sErro + ';' + #13);
                              Result := False;
                           end;
                      end;
                 end;
                 qryRateio.Next;
                 fAtual := fAtual + 1;
             end;
             EscondeProgresso(ProgressBar, lblProgress, lblContador);
       end; // for
       qryCondResult.next;
   end;
end;

procedure TfrmMovContratoConfissao.AtribuiPercentRateio;
var
   fAreaTotal: Extended;
   bFracaoIdeal: Boolean;  // a FCRT rateia suas despesas por aqui
begin
   qryRateio.First;
   // usar a area ideal como grupo para o lançamento da receitas por contrado
   bFracaoIdeal := false;
   fAreaTotal := 0;
   while not qryRateio.Eof do begin
      fAreaTotal := fAreaTotal + qryRateio.FieldByName('IMOAREA').AsFloat;
      qryRateio.Next;
   end;
   // se a area ideal não for preenchida usar a fração ideal
   if fAreaTotal = 0 then begin
      bFracaoIdeal := true;
      qryRateio.First;
      while not qryRateio.Eof do begin
         fAreaTotal := fAreaTotal + qryRateio.FieldByName('IMOFRACAOIDEAL').AsFloat;
         qryRateio.Next;
      end;
   end;
   qryRateio.First;
   while not qryRateio.Eof do begin
      if bFracaoIdeal then begin
         if qryRateio.FieldByName('IMOFRACAOIDEAL').AsFloat <> 0 then begin
            qryRateio.Edit;
            qryRateio.FieldByName('GXIPERCENTRATEIO').AsFloat := qryRateio.FieldByName('IMOFRACAOIDEAL').AsFloat / fAreaTotal * 100;
            qryRateio.Post;
         end;
      end else begin
         if qryRateio.FieldByName('IMOAREA').AsFloat <> 0 then begin
            qryRateio.Edit;
            qryRateio.FieldByName('GXIPERCENTRATEIO').AsFloat := qryRateio.FieldByName('IMOAREA').AsFloat / fAreaTotal * 100;
            qryRateio.Post;
         end;
      end;
      qryRateio.Next;
   end;
   qryRateio.First;
end;     
function TfrmMovContratoConfissao.GravaLancamento(iDocumento: int64;  iParcela,
                                                  iParcelas: integer): Boolean;
var
   x : integer;
   bBloqueioJudicial : Boolean;
   dLanc :String;
   iAnoVenc, iMesVenc, iDiaVenc: word;
begin
   try
      Result := True;
      bBloqueioJudicial := CtrlTipoReceita.ReceitaPossuiBloqueioJudicial(196); // 196 - Confissao de Divida
      with dtmLancImovel.qryInsertLancImovel do
      begin
         LimpaParametros(dtmLancImovel.qryInsertLancImovel);
         ParamByName('PIDLANCIMOVEL').AsInteger      := LeUltRegistro(nil, 'LANCAMENTOSIMOVEL');
         ParamByName('PRECPAG').AsString             := 'R';
         ParamByName('PIDPESSOA').AsInteger          := Sistema.idEmpresa;
         ParamByName('PIDFORCLI').AsInteger          := qryContratoIDLOCATARIO.AsInteger;
         ParamByName('PIDIMOVEL').AsInteger          := qryRateio.FieldByName('IDIMOVEL').AsInteger;
         ParamByName('PCODTIPIMOVEL').AsString       := qryRateio.FieldByName('CODTIPIMOVEL').AsString;
         ParamByName('PIDTIPOCUSTORECIMO').AsInteger := 196;// 196 - Confissao de Divida
         ParamByName('PIDCONTRATOIMOVEL').AsInteger  := qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger;

         ParamByName('PMOEDARECEB').AsInteger         := Modulo.iMoedaCorrente;
         ParamByName('PFLGINTEGRADO').AsInteger       := Ord(bBloqueioJudicial);

         ParamByName('PIDUSUARIOSISTEMA').AsInteger   := Sistema.IdUsuario;
         ParamByName('PFLGORIGEMLANC').AsString       := 'D'; // D = Confissao de Divida
         ParamByName('PCODPORTFORMA').AsInteger       := qryContratoCODPORTFORMA.AsInteger;
         ParamByName('PCODCENTROCUSTO').AsString      := Modulo.sCentroCusto;
         ParamByName('PFLGAGRUPAR').AsString          := 'S';

         // Campos variáveis em função da parcela --------------------------------------------------
         //ParamByName('PDATAVENCIMENTO').AsDateTime    := DiasInUteis.SomaMeses(qryCondResultINICIOCONFISSAO.Value, iParcela - 1);
         ParamByName('PDATAVENCIMENTO').AsDateTime    := DiasInUteis.SomaMeses(qryCondResultPROXVENCTO.Value, iParcela - 1);
         DecodeDate(ParamByName('PDATAVENCIMENTO').AsDateTime, iAnoVenc, iMesVenc, iDiaVenc);

         ParamByName('PDATALANCAMENTO').AsDateTime    := DiasInUteis.SomaMeses(qryCondResultINICIOCONFISSAO.Value, iParcela - 1);
         ParamByName('PDATAEMISSAO').AsDateTime       := ParamByName('PDATALANCAMENTO').AsDateTime ;

         ParamByName('PMESREFERENCIA').AsInteger      := iMesVenc;
         ParamByName('PANOREFERENCIA').AsInteger      := iAnoVenc;
         ParamByName('PMESCOMPETENCIA').AsInteger     := iMesVenc;
         ParamByName('PANOCOMPETENCIA').AsInteger     := iAnoVenc;
         // ----------------------------------------------------------------------------------------

         // Valor das parcelas (previamente calculado) ---------------------------------------------
         if iParcelas = 1 then begin
            ParamByName('PVLRLANCOMRECEB').AsFloat    := qryRateio.FieldByName('VALOR').AsFloat;
            ParamByName('PVLRLANCRECEB').AsFloat      := qryRateio.FieldByName('VALOR').AsFloat;
         end else begin
            ParamByName('PVLRLANCOMRECEB').AsFloat    := qryRateio.FieldByName('VLR_PARCELA').AsFloat;
            ParamByName('PVLRLANCRECEB').AsFloat      := qryRateio.FieldByName('VLR_PARCELA').AsFloat;
         end;

         // ----------------------------------------------------------------------------------------
         ParamByName('PIDDOCUMENTO').AsInteger        := iDocumento;
         ParamByName('PNODOCUMENTO').AsFloat          := iDocumento;

         // complemento do documento
         if iParcelas > 1 then
         ParamByName('PCOMPLDOCUMENTO').AsString      := IntToStr(iParcelas);

         ParamByName('PIDMODULO').AsInteger           := Sistema.IdModulo;
         ParamByName('POBS').AsString := 'Lançamento gerado pela Confissão de Divida .';
         ExecSQL;          
         if bBloqueioJudicial then
         begin
            cdsBloqueioImob.Data := CtrlBloqueioImob.LookupBloqueioImob(-1,iDocumento,-1,qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger);
            if cdsBloqueioImob.IsEmpty then cdsBloqueioImob.Insert
            else                            cdsBloqueioImob.Edit;

            cdsBloqueioImob.FieldByName('IDDOCUMENTOBLOQ').AsInteger  := iDocumento;
            cdsBloqueioImob.FieldByName('IDCONTRATOIMOVEL').AsInteger := qryRateio.FieldByName('IDCONTRATOIMOVEL').AsInteger;
            cdsBloqueioImob.Post;

            CtrlBloqueioImob.OpenTransaction := False;
            CtrlBloqueioImob.GravaBloqueioImob;
         end;
      end;
   except
      Result := False;
   end;
end;
function TfrmMovContratoConfissao.GravaConfissao: Boolean;
begin
    Result := True;
    Try
        // Grava Tabela Confissao Divida
        qryConfissaoDivida.Close;
        qryConfissaoDivida.Open;
        qryConfissaoDivida.Insert;
        qryConfissaoDividaIDCONFISSAODIVIDA.Value := LeUltRegistro(nil, 'CONFISSAODIVIDA');
        qryConfissaoDividaIDCONTRATOIMOVEL.Value  := qryContratoIDCONTRATOIMOVEL.value;
        qryConfissaoDividaMESCONFISSAO.value      := cboMes.ItemIndex+1;
        qryConfissaoDividaANOCONFISSAO.Value      := DBspnAno.Value;
        qryConfissaoDividaDATACONFISSAO.value     := edtDataConfissao.Date;
        qryConfissaoDividaCONDRESULTANTES.Value   := DBSpnQtde.Value;
        qryConfissaoDividaVLRSALDO.Value          := edtNovoSaldoOper.Value;
        qryConfissaoDividaIDMODULO.Value          := Sistema.IdModulo;
        qryConfissaoDividaPLNCODIGO_OPER.Value    := iPlnCodigo;
        qryConfissaoDivida.post;
        qryConfissaoDivida.ApplyUpdates;
        // Grava Tabela ConfissaoXDoc
        qryConfissaoXDoc.Close;
        qryConfissaoXDoc.Open;
        qryParcInamp.First;
        while not qryParcInamp.Eof do
        begin
          if qryParcInampSELECAO.AsInteger > 0 then
          begin
             qryConfissaoXDoc.Insert;
             qryConfissaoXDocIDCONFISSAODIVIDA.Value := qryConfissaoDividaIDCONFISSAODIVIDA.Value;
             qryConfissaoXDocCODDOCUMENTO.Value      := qryParcInampCODDOCUMENTO.Value;
             qryConfissaoXDocTIPO.Value              := 0; // 0 - Baixado 1 - Gerado
             qryConfissaoXDocIDMODULO.Value          := Sistema.IdModulo;
             qryConfissaoXDocIDCONDRESULT.Value      := 0;
             qryConfissaoXDoc.Post;
             qryConfissaoXDoc.ApplyUpdates;
          end; 
          qryParcInamp.Next;
        end;
        
        // Atualiza a Tabela ConfissaoXOper
        qryConfissaoxOperacao.Close;
        qryConfissaoxOperacao.Open;
        qryConfissaoXOper.First;
        while not qryConfissaoXOper.eof do
        begin
             qryConfissaoxOperacao.Insert;
             qryConfissaoxOperacaoIDCONFISSAODIVIDA.Value := qryConfissaoDividaIDCONFISSAODIVIDA.Value;
             qryConfissaoxOperacaoIDTIPOCUSTORECIMO.Value := qryConfissaoXOperIDTIPOCUSTORECIMO.Value;
             qryConfissaoxOperacaoFLGTIPOOPER.AsString    := qryConfissaoXOperFLGTIPOOPER.AsString;
             qryConfissaoxOperacaoVLROPERACAO.AsFloat     := qryConfissaoXOperVLROPERACAO.AsFloat;
             qryConfissaoxOperacaoOBSERVACAO.AsString     := qryConfissaoXOperOBSERVACAO.Value;
             qryConfissaoxOperacaoIDMODULO.AsString       := qryConfissaoDividaIDMODULO.AsString;
             qryConfissaoxOperacaoLANCNUMLAN.Value        := 0;
             qryConfissaoxOperacao.post;
             qryConfissaoxOperacao.ApplyUpdates; 
             qryConfissaoXOper.Next;
        end;

        // Grava Tabela ConfissaoXCondicao
        qryConfissaoXCond.Close;
        qryConfissaoXCond.Open;
        qryCondResult.First;
        while not qryCondResult.eof do
        begin
              if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,qryCondResultINICIOCONFISSAO.AsString) then
              begin
                  sErro := sErro + ' ' + CtrlContab.MessageInfo;
                  MsgDlg('Período bloqueado pela Contabilidade.', 'Aviso', mtWarning, [mbOk], 0);
                  Result := False;
                  break;
              end;
             qryConfissaoXCond.Insert;
             qryConfissaoXCondIDCONFISSAODIVIDA.Value := qryConfissaoDividaIDCONFISSAODIVIDA.Value;
             qryConfissaoXCondIDCONDRESULT.Value      := qryCondResultIDCONDRESULT.value;
             qryConfissaoXCondSALDODEVEDOR.Value      := qryCondResultSALDODEVEDOR.value;
             qryConfissaoXCondINICIOCONFISSAO.Value   := qryCondResultINICIOCONFISSAO.value;
             qryConfissaoXCondPROXVENCTO.Value        := qryCondResultPROXVENCTO.Value;
             qryConfissaoXCondPROXAMORTIZACAO.Value   := qryCondResultPROXAMORTIZACAO.Value;
             qryConfissaoXCondPARCELAS.Value          := qryCondResultPARCELAS.Value;
             qryConfissaoXCondPERIODO.Value           := qryCondResultPERIODO.value;
             qryConfissaoXCondPRAZO.Value             := qryCondResultPRAZO.value;
             qryConfissaoXCondINDCORRECAO.Value       := qryCondResultINDCORRECAO.Value;
             qryConfissaoXCondMESREFREAJUSTE.Value    := qryCondResultMESREFREAJUSTE.Value;
             qryConfissaoXCondTAXAJUROS.Value         := qryCondResultTAXAJUROS.value;
             qryConfissaoXCondPERIODOTAXA.Value       := qryCondResultPERIODOTAXA.value;
             qryConfissaoXCondTAXAMULTA.Value         := qryCondResultTAXAMULTA.Value;
             qryConfissaoXCondIDMODULO.Value          := Sistema.IdModulo;
             qryConfissaoXCond.post;
             qryConfissaoXCond.ApplyUpdates;
             qryCondResult.Next;
        end;
    except
       Result := False;
    end;

end;

procedure TfrmMovContratoConfissao.edtDataConfissaoExit(Sender: TObject);
var ExtraiMes,ExtraiAno : String;
begin
  inherited;
  if edtDataConfissao.Text <> '' then
  begin
       ExtraiMes        := copy ( edtDataConfissao.Text , 4, 2 ) ;
       ExtraiAno        := copy ( edtDataConfissao.Text , 7, 4 ) ;
       cboMes.ItemIndex := StrToInt(ExtraiMes)-1 ;
       DBspnAno.Value   := StrToInt(ExtraiAno);
  end;
end;

procedure TfrmMovContratoConfissao.grdParcelasDblClick(Sender: TObject);
begin
  inherited;
  qryParcInamp.Edit;
  qryParcInampSELECAO.AsInteger := (qryParcInampSELECAO.AsInteger Xor 1);
  qryParcInamp.Post;
  if qryParcInampSELECAO.AsInteger = 1 then
     SaldoDev := SaldoDev +  qryParcInampSALDO.AsFloat
  else
     SaldoDev := SaldoDev - qryParcInampSALDO.AsFloat;
  edtSaldo.Text :=  FloatToStr(SaldoDev);
end;

procedure TfrmMovContratoConfissao.cmDtVenctoExit(Sender: TObject);
begin
  inherited;
  if cmDtVencto.Text <> '' then
  begin
      try
         if StrToDate(cmDtVencto.Text) < StrToDate(edtDataConfissao.Text) then
            raise EValidacao.CreateVal('Próximo Vencimento deve ser maior ou igual a Data da Confissão.',dbEdtParc);
          except
          on ev : EValidacao do begin
             if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
             Repaint;
             if ev.Control.CanFocus then ev.Control.SetFocus;
             Exit;
          end;
       end;
   end;
end;

procedure TfrmMovContratoConfissao.cmdtAmortizExit(Sender: TObject);
begin
  inherited;
  if cmdtAmortiz.Text <> '' then
  begin
      try
         if StrToDate(cmdtAmortiz.Text) < StrToDate(edtDataConfissao.Text) then
            raise EValidacao.CreateVal('Próximo Amortização deve ser maior ou igual a Data da Confissão.',dbEdtParc);
          except
          on ev : EValidacao do begin
             if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
             Repaint;
             if ev.Control.CanFocus then ev.Control.SetFocus;
             Exit;
          end;
       end;
   end;
end;

end.

