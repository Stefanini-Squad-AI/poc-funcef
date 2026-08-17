unit dLancImovel;
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina ......: qryLancImovel - retirada dos campos:
AND ((:PANOMESCOMPETENCIAMAIOR IS NULL) OR (:PANOMESCOMPETENCIAMAIOR >
(TO_CHAR(L.ANOCOMPETENCIA, '0000')||TO_CHAR(L.MESCOMPETENCIA, '00'))))

AND ((:PANOMESCOMPETENCIAMENOR IS NULL) OR (:PANOMESCOMPETENCIAMENOR <
(TO_CHAR(L.ANOCOMPETENCIA, '0000')||TO_CHAR(L.MESCOMPETENCIA, '00'))))

SOL..........: SIG TIBERO
Data.........: 12/06/2018
Responsável..: Everson Luiz Pereira da Cunha
Descrição....: Melhorias para adequação ao TIBERO
--------------------------------------------------------------------------------
Rotina ......:
SOL..........: 127213
Kintana......: 672023
Data.........: 03/01/2011
Responsável..: Helen V. Bianchi
Descrição....: Add qryInsertLancImovelParc Campo IDCONDPAGAQUISPARC a +
-------------------------------------------------------------------------------}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TdtmLancImovel = class(TDataModule)
    qryInsertAlteraLanc: TwwQuery;
    qryDeleteAlteraLanc: TwwQuery;
    qrySelectAlteraLanc: TwwQuery;
    qryInsertObsLanc: TwwQuery;
    qryUpdateObsLanc: TwwQuery;
    qryDeleteObsLanc: TwwQuery;
    qrySelectObsLanc: TwwQuery;
    qrySelectObsLancIDDOCUMENTO: TFloatField;
    qrySelectObsLancOBS: TMemoField;
    qrySelectAlteraLancIDDOCUMENTO: TFloatField;
    qrySelectAlteraLancCODALTERADOR: TFloatField;
    qrySelectAlteraLancVLRALTERADOR: TFloatField;
    qrySelectAlteraLancDESCRICAO: TStringField;
    qryUpdateDesconto: TwwQuery;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField2: TStringField;
    qrySelectDesconto: TwwQuery;
    qryEstornaLancImovel: TwwQuery;
    qryExcluiLancImovel: TwwQuery;
    qryInsertLancImovel: TwwQuery;
    updLancImovel: TUpdateSQL;
    qryLancImovel: TwwQuery;
    qryLancImovel_ORIGEMLANC: TStringField;
    qryLancImovel_MESCOMPETENCIA: TStringField;
    qryLancImovel_DESCERRO: TStringField;
    qryDeleteMsgBoleto: TwwQuery;
    qryUpdateMsgBoleto: TwwQuery;
    qryUpdateLinhaMsg: TwwQuery;
    FloatField1: TFloatField;
    MemoField1: TMemoField;
    qryInsertLinhaMsg: TwwQuery;
    FloatField2: TFloatField;
    MemoField2: TMemoField;
    qryInsertMsgBoleto: TwwQuery;
    qrySelectMsgLanc: TwwQuery;
    qrySelectMsgLancIDMSGBOLETO: TFloatField;
    qrySelectMsgLancMSGDESCRICAO: TStringField;
    qrySelectMsgLancIDDOCUMENTO: TFloatField;
    qrySelectMsgLancTEXTO_LINHA_1: TStringField;
    qrySelectMsgLancTEXTO_LINHA_2: TStringField;
    qrySelectMsgLancTEXTO_LINHA_3: TStringField;
    qrySelectMsgLancTEXTO_LINHA_4: TStringField;
    qrySelectMsgLancTEXTO_LINHA_5: TStringField;
    qrySelectMsgLancTEXTO_LINHA_6: TStringField;
    qrySelectMsgLancTEXTO_LINHA_7: TStringField;
    qrySelectMsgLancTEXTO_LINHA_8: TStringField;
    qrySelectMsgLancTEXTO_LINHA_9: TStringField;
    qrySelectAlteraDoc: TwwQuery;
    qrySelectAlteraDocDESCRICAO: TStringField;
    qrySelectAlteraDocVALOR: TFloatField;
    qrySelectAlteraDocDATALANCTO: TDateTimeField;
    qrySelectAlteraDocHISTORICOCOMPL: TStringField;
    qrySelectAlteraDocCODDOCUMENTO: TFloatField;
    qrySelectAlteraDocNUMLANCTO: TFloatField;
    qrySelectAlteraDocCODALTERADOR: TFloatField;
    qrySelectAlteraDocPLNCODIGO: TFloatField;
    qrySelectAlteraDocVALOROUTRAMOEDA: TFloatField;
    qrySelectAlteraDocDEBCRE: TStringField;
    qrySelectAlteraDocOPERACAO: TStringField;
    qrySelectAlteraDocNODOCUMENTO: TFloatField;
    qryDeleteLinhaMsg: TwwQuery;
    qryDeleteMsgCnab: TwwQuery;
    qryUpdateDocumento: TwwQuery;
    qrySelectLancImovel: TwwQuery;
    qrySelectLancImovelIDRESERVAORCAMEN: TFloatField;
    qrySelectDescontoIDDESCONTO: TFloatField;
    qrySelectDescontoIDCONTRATOIMOVEL: TFloatField;
    qrySelectDescontoDCCMESCOMPETENCIA: TFloatField;
    qrySelectDescontoDCCANOCOMPETENCIA: TFloatField;
    qrySelectDescontoCODALTERADOR: TFloatField;
    qrySelectDescontoDCCVLR: TFloatField;
    qrySelectDescontoFLGCONCEDIDO: TFloatField;
    qrySelectDescontoDESCRICAO: TStringField;
    qryLancImovelNOME_MESTRE: TStringField;
    qryLancImovelNOME_IMOVEL: TStringField;
    qryLancImovelIMOVEL_EXTENSO: TStringField;
    qryLancImovelCONTRATO_EXTENSO: TStringField;
    qryLancImovelDESCCUSTORECIMO: TStringField;
    qryLancImovelFORCLI_DOC: TFloatField;
    qryLancImovelSTATUS_DOC: TStringField;
    qryLancImovelDOC_CAPCAR: TFloatField;
    qryLancImovelPLNPLANIL: TFloatField;
    qryLancImovelLOGIN_USUARIO: TStringField;
    qryLancImovelNF_USUARIO: TStringField;
    qryLancImovelNF_FORCLI: TStringField;
    qryLancImovelRS_FORCLI: TStringField;
    qryLancImovelVLRLANCOMRECEB: TFloatField;
    qryLancImovelVLRLANCOMPAGAR: TFloatField;
    qryLancImovelMOEDARECEB: TFloatField;
    qryLancImovelVLRLANCRECEB: TFloatField;
    qryLancImovelVLRLANCPAGAR: TFloatField;
    qryLancImovelMOEDAPAGAR: TFloatField;
    qryLancImovelIDFORCLI: TFloatField;
    qryLancImovelIDLANCIMOVEL: TFloatField;
    qryLancImovelIDPESSOA: TFloatField;
    qryLancImovelIDIMOVEL: TFloatField;
    qryLancImovelIDTIPOCUSTORECIMO: TFloatField;
    qryLancImovelRECPAG: TStringField;
    qryLancImovelIDCONTRATOIMOVEL: TFloatField;
    qryLancImovelCODDOCUMENTO: TFloatField;
    qryLancImovelIDRATEIODOCUM: TFloatField;
    qryLancImovelPLNCODIGO: TFloatField;
    qryLancImovelDATALANCAMENTO: TDateTimeField;
    qryLancImovelDATAVENCIMENTO: TDateTimeField;
    qryLancImovelMESCOMPETENCIA: TFloatField;
    qryLancImovelANOCOMPETENCIA: TFloatField;
    qryLancImovelFLGTIPOLANCAMENTO: TStringField;
    qryLancImovelFLGORIGEMLANC: TStringField;
    qryLancImovelFLGESTORNADO: TFloatField;
    qryLancImovelTRGDTINCLUSAO: TDateTimeField;
    qryLancImovelTRGUSERINCLUSAO: TStringField;
    qryLancImovelMESREFERENCIA: TFloatField;
    qryLancImovelANOREFERENCIA: TFloatField;
    qryLancImovelFLGAGRUPAR: TStringField;
    qryLancImovelFLGAGRUPADO: TFloatField;
    qryLancImovelVLRJUROS: TFloatField;
    qryLancImovelVLRMULTA: TFloatField;
    qryLancImovelVLRCORRECAOMON: TFloatField;
    qryLancImovelDATACORRECAO: TDateTimeField;
    qryLancImovelFLGMULTACALCULADA: TFloatField;
    qryLancImovelFLGINTEGRADO: TFloatField;
    qryLancImovelIDUSUARIOSISTEMA: TFloatField;
    qryLancImovelFLGERRO: TFloatField;
    qryLancImovelIDADMINIMOVEL: TFloatField;
    qryLancImovelANOPRESTACAO: TFloatField;
    qryLancImovelMESPRESTACAO: TFloatField;
    qryLancImovelFLGIMPORTADO: TFloatField;
    qryLancImovelVLRCOMISSAO: TFloatField;
    qryLancImovelIDRESERVAORCAMEN: TFloatField;
    qryLancImovelIDDOCUMENTO: TFloatField;
    qryLancImovelDATA_BAIXA: TDateTimeField;
    qryLancImovelCODSUBCONTA: TFloatField;
    qryLancImovelFLGTIPOIMOVEL: TFloatField;
    qryLancImovelIMODATACONSTRUCAO: TDateTimeField;
    qryLancImovelIMOAREA: TFloatField;
    qryLancImovelIMOFRACAOIDEAL: TFloatField;
    qryLancImovelFLGSTATUSOCUPACAO: TStringField;
    qryLancImovelQTDETOTALCOTAS: TFloatField;
    qryLancImovelIMOLOGRADOURO: TStringField;
    qryLancImovelIMONUMERO: TStringField;
    qryLancImovelIMOCOMPLEMENTO: TStringField;
    qryLancImovelIMOBAIRRO: TStringField;
    qryLancImovelIMONOMEENDERECO: TStringField;
    qryLancImovelIMOCEP: TStringField;
    qryLancImovelIDCARTEIRAINVEST: TFloatField;
    qryLancImovelCODTIPIMOVEL: TStringField;
    qryLancImovelFLGATIVO: TFloatField;
    qryLancImovelIMOPERCENTRATEIO: TFloatField;
    qryLancImovelIMOMOEDACOMPRA: TFloatField;
    qryLancImovelIMOVLRCOMPRA: TFloatField;
    qryLancImovelIMODATACOMPRA: TDateTimeField;
    qryLancImovelIMOMATRICULA: TStringField;
    qryLancImovelIMODATAHABITESE: TDateTimeField;
    qryLancImovelIDCARTORIO: TFloatField;
    qryLancImovelSTATUS_IMOVEL: TStringField;
    qryLancImovelIMOCODIGO: TStringField;
    qryLancImovelIMOAREAGERENCIAL: TFloatField;
    qryLancImovelFLGCATIMOVEL: TStringField;
    qryLancImovelIMOVLRREAVAL: TFloatField;
    qryLancImovelIMODATAREAVAL: TDateTimeField;
    qryLancImovelIMOVLRMERCADO: TFloatField;
    qryLancImovelIMODATAMERCADO: TDateTimeField;
    qryLancImovelIMOMOEDAREAVAL: TFloatField;
    qryLancImovelIMOMOEDAMERCADO: TFloatField;
    qryLancImovelCONNUMERO: TStringField;
    qryLancImovelCONNOME: TStringField;
    qryLancImovelCODPORTFORMA: TFloatField;
    qryLancImovelCONINDICEREAJUSTE: TFloatField;
    qryLancImovelIDLOCATARIO: TFloatField;
    qryLancImovelADMIN_CONTRATO: TFloatField;
    qryLancImovelCONDATAASSINATURA: TDateTimeField;
    qryLancImovelCONDATAINICIO: TDateTimeField;
    qryLancImovelCONDATAFIM: TDateTimeField;
    qryLancImovelCONDATADENUNCIA: TDateTimeField;
    qryLancImovelCONVLRTOTAL: TFloatField;
    qryLancImovelFLGINDETERMINADO: TStringField;
    qryLancImovelCONDIAVENCIMENTO: TFloatField;
    qryLancImovelCONVLRAJUSTADO: TFloatField;
    qryLancImovelFLGTIPOALUGUEL: TStringField;
    qryLancImovelFLGTIPOCOBRANCA: TStringField;
    qryLancImovelCONPERREAJUSTE: TFloatField;
    qryLancImovelCONDATAREAJUSTE: TDateTimeField;
    qryLancImovelCONPERCENTMORA: TFloatField;
    qryLancImovelCONPERMORA: TStringField;
    qryLancImovelCONDIACOMPLEMENTO: TFloatField;
    qryLancImovelFLGMESPOSTERIOR: TFloatField;
    qryLancImovelCONVLRMULTA: TFloatField;
    qryLancImovelCONPERCENTMULTA: TFloatField;
    qryLancImovelCONVLRMORA: TFloatField;
    qryLancImovelCONMOEDAMORA: TFloatField;
    qryLancImovelCONINDICEMORA: TFloatField;
    qryLancImovelCONMOEDAMULTA: TFloatField;
    qryLancImovelFLGCOMPETALUGUEL: TStringField;
    qryLancImovelSTATUS_CONTRATO: TStringField;
    qryLancImovelCONPROXREAJUSTE: TDateTimeField;
    qryLancImovelCONDATACARENCIA: TDateTimeField;
    qryLancImovelCONDATAAVDENUNCIA: TDateTimeField;
    qryLancImovelCONDATARENEGOC: TDateTimeField;
    qryLancImovelCONDATAAVRENEGOC: TDateTimeField;
    qryLancImovelCONDIASTOLERANCIA: TFloatField;
    qryLancImovelFLGTIPODIAVENC: TStringField;
    qryLancImovelFLGTIPODIATOLERA: TStringField;
    qryLancImovelFLGFIANCA: TStringField;
    qryLancImovelCONDATAFIANCAFIM: TDateTimeField;
    qryLancImovelCONDATAFIANCAAV: TDateTimeField;
    qryLancImovelCONMESREFREAJUSTE: TStringField;
    qryLancImovelFLGMORAPROPORC: TFloatField;
    qryLancImovelFLGTIPOCONTRATO: TStringField;
    qryLancImovelFLGJUROSREMUNERA: TFloatField;
    qryLancImovelFLGREMUNERAALUG: TFloatField;
    qryLancImovelCONPERCENTJUROS: TFloatField;
    qryLancImovelCONPERCENTREMUNER: TFloatField;
    qryLancImovelIDMSGBOLETO: TFloatField;
    qryLancImovelCONTAXAADMIN: TFloatField;
    qryLancImovelFLGCOBRANCAAUTO: TFloatField;
    qryLancImovelCONDATAFIANCAINI: TDateTimeField;
    qryLancImovelCONDIASREPASSE: TFloatField;
    qryLancImovelIDCONANTERIOR: TFloatField;
    qryLancImovelCONBANCOFIANCA: TFloatField;
    qryLancImovelCONVLRFIANCA: TFloatField;
    qryLancImovelCONPERALUGUEL: TFloatField;
    qryLancImovelIDATIVIDADE: TFloatField;
    qryLancImovelCONDIASTOLERACOMP: TFloatField;
    qryLancImovelCONQUANTVAGAS: TFloatField;
    qryLancImovelCODTIPDOC: TFloatField;
    qryLancImovelNODOCUMENTO: TFloatField;
    qryLancImovelTOT_PAGAR: TFloatField;
    qryLancImovelTOT_PAGO: TFloatField;
    qryLancImovelTOT_RECEBER: TFloatField;
    qryLancImovelTOT_RECEBIDO: TFloatField;
    qryLancImovelMOEDA_LANC: TStringField;
    qryLancImovelCOD_MOEDA: TFloatField;
    qryLancImovelVALOR_OM_LANC: TFloatField;
    qryLancImovelVALOR_LANC: TFloatField;
    qryLancImovelPREVISTO: TFloatField;
    qryLancImovelEFETIVO: TFloatField;
    qryLancImovelCODFORMA: TFloatField;
    qryLancImovelREFERENCIAAP: TStringField;
    qryLancImovelFORMARECPAG: TStringField;
    qryLancImovelCODCENTROCUSTO: TStringField;
    qryLancImovelIDEMPRESA: TFloatField;
    qryLancImovelNOME_CENTRO_CUSTO: TStringField;
    qryLancImovelIDRECEITAREEMB: TFloatField;
    qryLancImovelNOSSONUMERO: TStringField;
    qryLancImovelIDLANCREEMBDESP: TFloatField;
    qryLancImovelMSGERROINTEGRA: TStringField;
    qryLancImovelPORTADOR_FORMA: TStringField;
    qryLancImovelPORTADOR_FORMA_LANC: TStringField;
    qryLancImovelFORMA_RECTOPAGTO: TStringField;
    qrySelectDescontoDCCDESCRICAO: TStringField;
    qryLancImovelIDCBANCARIA: TFloatField;
    qryLancImovelCODPORTFORMA_LANC: TFloatField;
    qrySelectMsgLancIDMODULO: TFloatField;
    qryLancImovelIDIMOVELMESTRE: TFloatField;
    qryLancImovelIDPROGRAMA: TFloatField;
    qryDelConciliaDoc: TwwQuery;
    qryInsConciliaDoc: TwwQuery;
    qryConciliaDoc: TwwQuery;
    qryConciliaDocIDDOCUMENTO: TFloatField;
    qryConciliaDocIDUSUARIO: TFloatField;
    qryConciliaDocDIFDIAS: TFloatField;
    qryConciliaDocDIFVLR: TFloatField;
    qryConciliaDocMOTIVO: TStringField;
    qryConciliaDocDATA: TDateTimeField;
    qryConciliaDocFLGTIPO: TStringField;
    qryConciliaDocNOMEUSUARIO: TStringField;
    qryConciliaDocTIPO_CONCILIACAO: TStringField;
    qryConciliaDocIDPARCFINANCIMOV: TFloatField;
    qryConciliaDocIDDOCDIVERGE: TFloatField;
    qryRegistraErroDoc: TwwQuery;
    qryLancImovelNUMAPALT: TFloatField;
    qryLancImovelDTINICTBDIARIA: TDateTimeField;
    qryLancImovelDTFIMCTBDIARIA: TDateTimeField;
    qryConciliaDocNUMLANCTODIVERGE: TFloatField;
    qryLancImovelIDOPERCONTAB: TFloatField;
    qrySelectCorrecaoDoc: TwwQuery;
    qrySelectCorrecaoDocDATAOPER: TDateTimeField;
    qrySelectCorrecaoDocDATABAIXA: TDateTimeField;
    qrySelectCorrecaoDocVLRDIA_MUL: TFloatField;
    qrySelectCorrecaoDocVLRDIA_JUR: TFloatField;
    qrySelectCorrecaoDocVLRDIA_COR: TFloatField;
    qrySelectCorrecaoDocVLRACUM_MUL: TFloatField;
    qrySelectCorrecaoDocVLRACUM_JUR: TFloatField;
    qrySelectCorrecaoDocVLRACUM_COR: TFloatField;
    qrySelectCorrecaoDocVLRDIA_TOTAL: TFloatField;
    qrySelectCorrecaoDocVLRACUM_TOTAL: TFloatField;
    qryLancImovelIDPATRO: TFloatField;
    qryLancImovelIDPLANOPREV: TFloatField;
    qryLancImovelDATAEMISSAO: TDateTimeField;
    qrySelectAlteraDocNOME: TStringField;
    qrySelectAlteraDocTRGDTINCLUSAO: TDateTimeField;
    qrySelectAlteraDocDATABAIXA: TDateTimeField;
    qryInsertLancImovelParc: TwwQuery;

    procedure qryLancImovelCalcFields(DataSet: TDataSet);
    procedure qryConciliaDocCalcFields(DataSet: TDataSet);

  private { Private declarations }

  public { Public declarations }

  end;



var
  dtmLancImovel: TdtmLancImovel;



implementation
{$R *.DFM}
uses
   uFuncoesImob;



procedure TdtmLancImovel.qryLancImovelCalcFields(DataSet: TDataSet);
begin
   // preenche com o mês de competência do lançamento
   qryLancImovel_MESCOMPETENCIA.AsString := MesExtenso(qrylancimovelMESCOMPETENCIA.AsInteger);

   // prenche a origem do lançamento (nome extenso)
   qryLancImovel_ORIGEMLANC.AsString := OrigemLancamento(qryLancImovelFLGORIGEMLANC.asString[1]);

   // preenche a descricao do erro
   qryLancImovel_DESCERRO.AsString := DescricaoErro(qryLancImovelFLGERRO.AsInteger);
end;



procedure TdtmLancImovel.qryConciliaDocCalcFields(DataSet: TDataSet);
begin
   if qryConciliaDocFLGTIPO.AsString = 'A' then
      qryConciliaDocTIPO_CONCILIACAO.AsString := 'Abono'
   else if qryConciliaDocFLGTIPO.AsString = 'D' then
      qryConciliaDocTIPO_CONCILIACAO.AsString := 'Gerado Doc. Complementar'
   else if qryConciliaDocFLGTIPO.AsString = 'L' then
      qryConciliaDocTIPO_CONCILIACAO.AsString := 'Liberada Responsabiliade de Pagamento.'
   else
      qryConciliaDocTIPO_CONCILIACAO.AsString := '';
end;

end.
