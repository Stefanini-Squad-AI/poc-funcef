unit dLookImobiliario;

interface
 
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, MontaSelect, Wwdatsrc;

type
  TdtmLookImobiliario = class(TDataModule)
    qryLookMoeda: TwwQuery;
    qryLookMoedaMOESIGLA: TStringField;
    qryLookMoedaMOECODIGO: TFloatField;
    qryLookMoedaMOEDESC: TStringField;
    qryLookMarca: TwwQuery;
    qryLookMarcaMRCNOME: TStringField;
    qryLookMarcaIDMARCA: TFloatField;
    qryLookAtividade: TwwQuery;
    qryATVDESCRICAO: TStringField;
    qryIDATIVIDADE: TFloatField;
    qryLookProprietario: TwwQuery;
    qryLookProprietarioNOME: TStringField;
    qryLookProprietarioIDPROPRIETARIOUH: TFloatField;
    qryLookProprietarioRAZAOSOCIAL: TStringField;
    qryLookTipoImovel: TwwQuery;
    qryLookResponsavel: TwwQuery;
    qryLookResponsavelNOME: TStringField;
    qryLookResponsavelIDRESPONSAVEL: TFloatField;
    qryLookResponsavelRAZAOSOCIAL: TStringField;
    qryLookOutroDadoXTipoImo: TwwQuery;
    qryLookOutroDadoXTipoImoODODESCRICAO: TStringField;
    qryLookOutroDadoXTipoImoIDOUTRODADO: TFloatField;
    qryLookIndicador: TwwQuery;
    qryLookOutroDado: TwwQuery;
    qryLookOutroDadoIDOUTRODADO: TFloatField;
    qryLookOutroDadoODODESCRICAO: TStringField;
    qryLookIndicadorIDINDICADORIMOVEL: TFloatField;
    qryLookIndicadorINMDESCRICAO: TStringField;
    qryLookIndicadorFLGTIPOVALOR: TStringField;
    qryLookIndicadorXTipoImo: TwwQuery;
    qryLookIndicadorXTipoImoIDINDICADORIMOVEL: TFloatField;
    qryLookIndicadorXTipoImoINMDESCRICAO: TStringField;
    qryLookIndicadorXTipoImoFLGTIPOVALOR: TStringField;
    qryLookGrupo: TwwQuery;
    qryLookGrupoIDGRUPO: TFloatField;
    qryLookGrupoNOME: TStringField;
    qryLookGrupoCLASSE: TStringField;
    qryLookAlterador: TwwQuery;
    qryLookAlteradorCODALTERADOR: TFloatField;
    qryLookAlteradorDESCRICAO: TStringField;
    qryLookAlteradorRECPAG: TStringField;
    qryLookAlteradorACRESDECRES: TStringField;
    qryLookAlteradorXTipoImo: TwwQuery;
    qryLookAlteradorXTipoImoCODTIPIMOVEL: TStringField;
    qryLookAlteradorXTipoImoCODALTERADOR: TFloatField;
    qryLookAlteradorXTipoImoDESCRICAO: TStringField;
    qryLookAlteradorXTipoImoACRESDECRES: TStringField;
    qryLookAlteradorXTipoImoRECPAG: TStringField;
    qryLookBanco: TwwQuery;
    qryLookBancoRAZAOSOCIAL: TStringField;
    qryLookBancoNOME: TStringField;
    qryLookBancoNUMBANCO: TStringField;
    qryLookBancoIDPESSOA: TFloatField;
    qryLookMsgBoleto: TwwQuery;
    qryLookMsgBoletoMSGDESCRICAO: TStringField;
    qryLookMsgBoletoIDMSGBOLETO: TFloatField;
    qryLookCidade: TwwQuery;
    qryLookCidadeNOME: TStringField;
    qryLookCidadeIDCIDADES: TFloatField;
    qryLookCidadeCODESTADO: TStringField;
    qryLookCidadeIDPAIS: TFloatField;
    qryLookCidadeCODMUNICIPIO: TStringField;
    qryLookCidadeIDESTADO: TFloatField;
    qryLookEstado: TwwQuery;
    qryLookEstadoCODESTADO: TStringField;
    qryLookEstadoNOMEESTADO: TStringField;
    qryLookEstadoIDPAIS: TFloatField;
    qryLookEstadoIDESTADO: TFloatField;
    qryLookPais: TwwQuery;
    qryLookPaisNOMEPAIS: TStringField;
    qryLookPaisIDPAIS: TFloatField;
    qryLookUnidNegocio: TwwQuery;
    qryLookUnidNegocioNOME: TStringField;
    qryLookUnidNegocioUNIDNEGOC: TFloatField;
    qryLookTipOper: TwwQuery;
    qryLookTipOperTIPDESCRICAO: TStringField;
    qryLookTipOperTIPCODIGO: TStringField;
    qryLookCCDebCre: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    qryLookCCResult: TwwQuery;
    StringField6: TStringField;
    StringField7: TStringField;
    qryLookSCResult: TwwQuery;
    qryLookSCResultSUBCONTARESULT: TFloatField;
    qryLookSCResultNOMESUBCONTA: TStringField;
    qryLookSCDebCre: TwwQuery;
    qryLookSCDebCreSUBCONTADEBCRE: TFloatField;
    qryLookSCDebCreNOMESUBCONTA: TStringField;
    qryLookCentroRespon: TwwQuery;
    qryLookCentroResponNOME: TStringField;
    qryLookCentroResponCODCENTRORESPON: TStringField;
    qryLookTipoReceb: TwwQuery;
    qryLookTipoRecebDESCRICAO: TStringField;
    qryLookTipoRecebCODTIPRECDES: TStringField;
    qryLookTipoRecebRECPAG: TStringField;
    qryLookTipoDesemb: TwwQuery;
    qryLookTipoDesembDESCRICAO: TStringField;
    qryLookTipoDesembCODTIPRECDES: TStringField;
    qryLookTipoDesembRECPAG: TStringField;
    qryLookPortadorForma: TwwQuery;
    qryLookPortadorFormaCODPORTFORMA: TFloatField;
    qryLookPortadorFormaDESCRICAO: TStringField;
    qryLookTipoRecDes: TwwQuery;
    qryLookTipoRecDesDESCCUSTORECIMO: TStringField;
    qryLookTipoRecDesIDTIPOCUSTORECIMO: TFloatField;
    qryLookTipoRecDesRECCUSTO: TStringField;
    qryLookTipoRecDesCODTIPDOC: TFloatField;
    qryLookTipoRecDesFLGOBRIGAORC: TFloatField;
    qryLookFormaRecPag: TwwQuery;
    qryLookFormaRecPagCODFORMA: TFloatField;
    qryLookFormaRecPagRECPAG: TStringField;
    qryLookFormaRecPagDESCRICAO: TStringField;
    qryLookFormaRecPagIDPESSOA: TFloatField;
    qryLookGrupoRateio: TwwQuery;
    qryLookGrupoRateioIDGRUPORATEIO: TFloatField;
    qryLookGrupoRateioGRRDESCRICAO: TStringField;
    qryLookCentroCusto: TwwQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    qryLookCarteira: TwwQuery;
    qryLookCarteiraDESCCARTINVEST: TStringField;
    qryLookCarteiraIDCARTEIRAINVEST: TFloatField;
    qryLookCarteiraIDGESTORCARTEIRA: TFloatField;
    qryLookPlanoConta: TwwQuery;
    qryLookPlanoContaPLANO: TFloatField;
    qryLookPlanoContaPLACONTA: TStringField;
    qryLookPlanoContaPLATIPO: TStringField;
    qryLookPlanoContaPLANOME: TStringField;
    qryLookUsuario: TwwQuery;
    qryLookUsuarioIDUSUARIO: TFloatField;
    qryLookUsuarioNOME: TStringField;
    qryLookUsuarioRAZAOSOCIAL: TStringField;
    qryLookUsuarioNOMEUSUARIO: TStringField;
    qryLookFormaRecPagFLGDADOSBANCARIOS: TStringField;
    qryLookContaBancaria: TwwQuery;
    qryLookContaBancariaCONTACORRENTE: TStringField;
    qryLookContaBancariaFLGCONTAPREF: TFloatField;
    qryLookContaBancariaNUMAGENCIA: TStringField;
    qryLookContaBancariaNUMBANCO: TStringField;
    qryLookContaBancariaIDCBANCARIA: TFloatField;
    qryLookPortadorFormaIDCONFIGBARRAS: TFloatField;
    qryLookIndicadorPorTipo: TwwQuery;
    qryLookIndicadorPorTipoDATAAPURADO: TDateTimeField;
    qryLookIndicadorPorTipoVLRAPURADO: TFloatField;
    qryLookIndicadorPorTipoINMDESCRICAO: TStringField;
    qryLookIndicadorPorTipoFLGTIPOVALOR: TStringField;
    qryLookIndicadorPorData: TwwQuery;
    qryLookIndicadorPorDataDATAAPURADO: TDateTimeField;
    qryLookIndicadorPorDataINMDESCRICAO: TStringField;
    qryLookIndicadorPorDataVLRAPURADO: TFloatField;
    qryLookIndicadorPorDataFLGTIPOVALOR: TStringField;
    qryLookTipoImovelCODTIPIMOVEL: TStringField;
    qryLookTipoImovelDESCTIPOIMOVEL: TStringField;
    qryLookTipoImovelIDGRUPOTERRENO: TFloatField;
    qryLookTipoImovelIDGRUPOEDIFICACAO: TFloatField;
    qryLookTipoImovelIDGRUPOINST: TFloatField;
    qryLookTipoImovelIDGRUPOELET: TFloatField;
    qryLookTipoImovelIDGRUPOAR: TFloatField;
    qryLookTipoImovelIDGRUPOVEICULO: TFloatField;
    qryLookTipoImovelIDGRUPOUTILITARIO: TFloatField;
    qryLookTipoImovelIDGRUPOMAQUINA: TFloatField;
    qryLookTipoImovelIDGRUPOMOVEL: TFloatField;
    qryLookLocalizacao: TwwQuery;
    qryLookLocalizacaoIDLOCALIZACAO: TFloatField;
    qryLookLocalizacaoIDPESSOA: TFloatField;
    qryLookLocalizacaoIDTIPOAREA: TFloatField;
    qryLookLocalizacaoIDRESPONSAVEL: TFloatField;
    qryLookLocalizacaoIDEMPRESA: TFloatField;
    qryLookLocalizacaoNOME: TStringField;
    qryLookLocalizacaoCODCENTROCUSTO: TStringField;
    qryLookLocalizacaoENDERECO: TStringField;
    qryLookLocalizacaoTRGDTINCLUSAO: TDateTimeField;
    qryLookLocalizacaoTRGUSERINCLUSAO: TStringField;
    qryLookLocalizacaoFLGLOCSAITEMP: TFloatField;
    qryLookClasseBem: TwwQuery;
    qryLookClasseBemIDCLASSEBEM: TFloatField;
    qryLookClasseBemCODHIERARQ: TStringField;
    qryLookClasseBemANASINT: TStringField;
    qryLookClasseBemDESCRICAO: TStringField;
    qryLookClasseBemTRGDTINCLUSAO: TDateTimeField;
    qryLookClasseBemTRGUSERINCLUSAO: TStringField;
    qryLookClasseBemIDGRUPO: TFloatField;
    qryLookClasseBemMASCARAIDOPCIONAL: TStringField;
    qryLookLocatario: TwwQuery;
    qryLookLocatarioIDLOCATARIO: TFloatField;
    qryLookLocatarioNOME: TStringField;
    qryLookLocatarioRAZAOSOCIAL: TStringField;
    qryLookSituacao: TwwQuery;
    qryLookSituacaoIDSITUACAO: TFloatField;
    qryLookSituacaoDESCSITUACAO: TStringField;
    qrySaldoBemXImovelouMestre: TwwQuery;
    qrySaldoBemXImovelouMestre_GRUPO: TStringField;
    qryLookTipoRecDesIDTIPODESPESA: TFloatField;
    qrySaldoBemXImovelouMestreIDIMOVEL: TFloatField;
    qrySaldoBemXImovelouMestreNOME_MESTRE: TStringField;
    qrySaldoBemXImovelouMestreNOME_IMOVEL: TStringField;
    qrySaldoBemXImovelouMestreIMOVEL_EXTENSO: TStringField;
    qrySaldoBemXImovelouMestreIDBEM: TFloatField;
    qrySaldoBemXImovelouMestrePLACA: TFloatField;
    qrySaldoBemXImovelouMestreDESBEM: TStringField;
    qrySaldoBemXImovelouMestreIXBGRUPO: TStringField;
    qrySaldoBemXImovelouMestreIMOCODIGO: TStringField;
    qrySaldoBemXImovelouMestreIMOMATRICULA: TStringField;
    qrySaldoBemXImovelouMestreCODTIPIMOVEL: TStringField;
    qrySaldoBemXImovelouMestreDESCTIPOIMOVEL: TStringField;
    qrySaldoBemXImovelouMestreFLGATIVO: TFloatField;
    qrySaldoBemXImovelouMestreSTATUS_IMOVEL: TStringField;
    qrySaldoBemXImovelouMestreFLGSTATUSOCUPACAO: TStringField;
    qrySaldoBemXImovelouMestreFLGSEMPLACA: TFloatField;
    qrySaldoBemXImovelouMestreIDLOCALIZACAO: TFloatField;
    qrySaldoBemXImovelouMestreIDRESPONSAVEL: TFloatField;
    qrySaldoBemXImovelouMestreIMOAREA: TFloatField;
    qrySaldoBemXImovelouMestreIMOAREAGERENCIAL: TFloatField;
    qrySaldoBemXImovelouMestreIMOFRACAOIDEAL: TFloatField;
    qrySaldoBemXImovelouMestreIMOPERCENTRATEIO: TFloatField;
    qrySaldoBemXImovelouMestreIMOMOEDACOMPRA: TFloatField;
    qrySaldoBemXImovelouMestreIMOVLRCOMPRA: TFloatField;
    qrySaldoBemXImovelouMestreIMODATACOMPRA: TDateTimeField;
    qrySaldoBemXImovelouMestreMOEDA_COMPRA: TStringField;
    qrySaldoBemXImovelouMestreIMOMOEDAREAVAL: TFloatField;
    qrySaldoBemXImovelouMestreIMOVLRREAVAL: TFloatField;
    qrySaldoBemXImovelouMestreIMODATAREAVAL: TDateTimeField;
    qrySaldoBemXImovelouMestreMOEDA_REAVAL: TStringField;
    qrySaldoBemXImovelouMestreIMOMOEDAMERCADO: TFloatField;
    qrySaldoBemXImovelouMestreIMOVLRMERCADO: TFloatField;
    qrySaldoBemXImovelouMestreIMODATAMERCADO: TDateTimeField;
    qrySaldoBemXImovelouMestreMOEDA_MERCADO: TStringField;
    qrySaldoBemXImovelouMestreCONTROLE: TStringField;
    qrySaldoBemXImovelouMestreBAIXATOTAL: TStringField;
    qrySaldoBemXImovelouMestreDTAINCLUSAO: TDateTimeField;
    qrySaldoBemXImovelouMestreFLGDEPREC: TFloatField;
    qrySaldoBemXImovelouMestreDATAULTDEP: TDateTimeField;
    qrySaldoBemXImovelouMestreDATAINICIODEP: TDateTimeField;
    qrySaldoBemXImovelouMestreTAXADEP: TFloatField;
    qrySaldoBemXImovelouMestreIDGRUPO: TFloatField;
    qrySaldoBemXImovelouMestreIDCLASSEBEM: TFloatField;
    qrySaldoBemXImovelouMestreVALHISTORICO: TFloatField;
    qrySaldoBemXImovelouMestreNOMEFORN: TStringField;
    qrySaldoBemXImovelouMestreCODGRUPO: TStringField;
    qrySaldoBemXImovelouMestreDESCGRUPO: TStringField;
    qrySaldoBemXImovelouMestreTIPOGRUPO: TStringField;
    qrySaldoBemXImovelouMestreCODCENTROCUSTO: TStringField;
    qrySaldoBemXImovelouMestreDESCCCUSTO: TStringField;
    qrySaldoBemXImovelouMestreTIPOCCUSTO: TStringField;
    qrySaldoBemXImovelouMestreCODCLASSEBEM: TStringField;
    qrySaldoBemXImovelouMestreDESCCLASSEBEM: TStringField;
    qrySaldoBemXImovelouMestreTIPOCLASSEBEM: TStringField;
    qrySaldoBemXImovelouMestreDESCCONJUNTO: TStringField;
    qrySaldoBemXImovelouMestreIDCONJUNTO: TFloatField;
    qrySaldoBemXImovelouMestreDESCLOCAL: TStringField;
    qrySaldoBemXImovelouMestreNOMERESP: TStringField;
    qrySaldoBemXImovelouMestreSUMVALCTB: TFloatField;
    qrySaldoBemXImovelouMestreSUMVALCTBIMOB: TFloatField;
    qryLookFornecedor: TwwQuery;
    qryLookFornecedorIDFORCLI: TFloatField;
    qryLookFornecedorNOME: TStringField;
    qryLookFornecedorRAZAOSOCIAL: TStringField;
    qryLookTipoImovelCODALTMULTA: TFloatField;
    qryLookTipoImovelCODALTJUROS: TFloatField;
    qryLookTipoImovelCODALTCORRMON: TFloatField;
    qryLookTipoImovelALTERADOR_MULTA: TStringField;
    qryLookTipoImovelALTERADOR_JUROS: TStringField;
    qryLookTipoImovelALTERADOR_CORRECAO: TStringField;
    qryLookIndicadorXTipoImoRECPAG: TStringField;
    qryLookTipoRecDesFLGDIARIO: TStringField;
    qryLookPlanoPrev: TwwQuery;
    qryLookPlanoPrevIDPLANOPREV: TFloatField;
    qryLookPlanoPrevNOME: TStringField;
    qryLookPatrocinadora: TwwQuery;
    qryLookPatrocinadoraIDPESSOA: TFloatField;
    qryLookPatrocinadoraNOME: TStringField;
    qryLookSegmentoSPC: TwwQuery;
    qryLookSegmentoSPCIDCARTEIRASPC: TFloatField;
    qryLookSegmentoSPCDESCARTEIRASPC: TStringField;

    procedure qrySaldoBemXImovelouMestreCalcFields(DataSet: TDataSet);

  private { Private declarations }

  public { Public declarations }

  end;



var
  dtmLookImobiliario: TdtmLookImobiliario;



implementation
{$R *.DFM}
uses
   uSistema, uModulo, uCAF;



procedure TdtmLookImobiliario.qrySaldoBemXImovelouMestreCalcFields(DataSet: TDataSet);
begin
   qrySaldoBemXImovelouMestre_GRUPO.AsString := CAF.GrupoExtenso(qrySaldoBemXImovelouMestreIXBGRUPO.asString);
end;



end.
