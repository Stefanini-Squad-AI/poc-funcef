unit uFlashRpt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,StdCtrls,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
  ppSubRpt, ppMemo, ppVar, ppRelatv, ppDBPipe, ppModule, ppTypes, daDataModule;

const sSqlCompConta = ' SELECT E.ELETIPOELEM, C.CODSUBCONTA, C.CODCENTROCUSTO, C.IDEMPRESA, '+
                      ' C.UNIDNEGOC, C.PLACONTA, C.PLANO, C.IDPATRO, C.IDPLANOPREV, C.FLGOPERACAO, '+
                      ' C.ELEMENTODEM, C.FLGOPERACAO '+
                      ' FROM COMPOELEMDEM C, ELEMDEMONSTRATIVO E WHERE '+
                      ' (C.IDELEMDEMONSTRAT = :IELEMDEMO) AND     '+
                      ' (E.ELETIPOELEM IN ('+#39+'C'+#39+','+#39+'S'+#39+')) AND '+
                      ' (C.IDELEMDEMONSTRAT = E.IDELEMDEMONSTRAT) '+
                      ' ORDER BY C.IDCOMPOELEMDEM ';

type
  TdtmFlashRpt = class(TdtmReports)
    pplFlashRpt: TppBDEPipeline;
    dsFlashRpt: TwwDataSource;
    qryFlashRpt: TwwQuery;
    ppFlashRpt: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    lblRoomsStats: TppLabel;
    lblToday: TppLabel;
    lblActualMTD: TppLabel;
    lblPOAMTD: TppLabel;
    lblTotalRooms: TppLabel;
    lblLessOut: TppLabel;
    lblLessHouseUse: TppLabel;
    lblSallableRooms: TppLabel;
    lblOcpRoomsPaid: TppLabel;
    lblCompRooms: TppLabel;
    lblTotalOcpRooms: TppLabel;
    lblPercOccup: TppLabel;
    lblAvgDailyRate: TppLabel;
    lblRoomsRevPar: TppLabel;
    lblRoomOcpGrp: TppLabel;
    lblRNCGrp: TppLabel;
    lblADRGrp: TppLabel;
    lblRoomsOcpTrans: TppLabel;
    lblRNCTrans: TppLabel;
    lblRoomsOcpRptGuest: TppLabel;
    lblRNCRptGuest: TppLabel;
    lblADRRptGuest: TppLabel;
    lblRoomsOcpChoice: TppLabel;
    lblRNCChoice: TppLabel;
    lblRoomsStayOver: TppLabel;
    lblRNCStayOvers: TppLabel;
    lblRoomsEarlyDept: TppLabel;
    lblRNCEarlyDept: TppLabel;
    lblRoomsOcpSDRes: TppLabel;
    lblRNCSameDayRes: TppLabel;
    lblRoomsOcpWalkins: TppLabel;
    lblRNCWalkins: TppLabel;
    lblRoomOcpNoShow: TppLabel;
    lblRNCNoShow: TppLabel;
    lblTotalGuest: TppLabel;
    lblGuestOcpRoom: TppLabel;
    lblCheckins: TppLabel;
    lblAvgLenStay: TppLabel;
    lblFoodStats: TppLabel;
    lblCovers: TppLabel;
    lblAvgCheck: TppLabel;
    ppLinhaDeptRev: TppBDEPipeline;
    dsLinhaDeptRev: TwwDataSource;
    ppComplimentary: TppBDEPipeline;
    dsComplimentary: TwwDataSource;
    qryComplimentary: TwwQuery;
    ppHouseUse: TppBDEPipeline;
    dsHouseUse: TwwDataSource;
    qryHouseUse: TwwQuery;
    ppOutOrder: TppBDEPipeline;
    dsOutOrder: TwwDataSource;
    qryOutOrder: TwwQuery;
    ppEstatHotel: TppBDEPipeline;
    dsEstatHotel: TwwDataSource;
    qryEstatHotel: TwwQuery;
    ppFlashRptDBText1: TppDBText;
    ppFlashRptDBText2: TppDBText;
    ppFlashRptDBText3: TppDBText;
    ppFlashRptDBText4: TppDBText;
    ppFlashRptDBText5: TppDBText;
    ppFlashRptDBText6: TppDBText;
    ppFlashRptDBText7: TppDBText;
    ppFlashRptDBText8: TppDBText;
    ppFlashRptDBText9: TppDBText;
    ppFlashRptDBText10: TppDBText;
    qryEstatHotelQTDEUHCORTESIAHOJE: TFloatField;
    qryEstatHotelQTDEUHNOSHOWHOJE: TFloatField;
    qryEstatHotelQTDEUHNOSHOWCOBHOJE: TFloatField;
    qryEstatHotelQTDEEXTENSOESHOJE: TFloatField;
    qryEstatHotelQTDERESERVASHOJE: TFloatField;
    qryEstatHotelQTDEUHWALKINHOJE: TFloatField;
    qryEstatHotelQTDECHEGADASHOJE: TFloatField;
    qryEstatHotelQTDEUSOCASAHOJE: TFloatField;
    qryEstatHotelQTDEOCUPADOHOJE: TFloatField;
    qryEstatHotelQTDEUHINDHOJE: TFloatField;
    qryEstatHotelQTDEUHGRPHOJE: TFloatField;
    qryEstatHotelQTDEHOSPEDEREPETEHOJE: TFloatField;
    qryEstatHotelQTDECOUVERTHOJE: TFloatField;
    qryEstatHotelQTDEPICKUPHOJE: TFloatField;
    qryEstatHotelQTDEBLOQUEADOHOJE: TFloatField;
    qryEstatHotelTOTALUHSHOJE: TFloatField;
    qryEstatHotelTOTDISPUHSHOJE: TFloatField;
    qryEstatHotelQTDHOSPEDESHOJE: TFloatField;
    qryEstatHotelQTDEUHCORTESIA: TFloatField;
    qryEstatHotelQTDEUHNOSHOW: TFloatField;
    qryEstatHotelQTDEUHNOSHOWCOB: TFloatField;
    qryEstatHotelQTDEEXTENSOES: TFloatField;
    qryEstatHotelQTDERESERVAS: TFloatField;
    qryEstatHotelQTDEUHWALKIN: TFloatField;
    qryEstatHotelQTDECHEGADAS: TFloatField;
    qryEstatHotelQTDEUSOCASA: TFloatField;
    qryEstatHotelQTDEOCUPADO: TFloatField;
    qryEstatHotelQTDEUHIND: TFloatField;
    qryEstatHotelQTDEUHGRP: TFloatField;
    qryEstatHotelQTDEHOSPEDEREPETE: TFloatField;
    qryEstatHotelQTDECOUVERT: TFloatField;
    qryEstatHotelQTDEPICKUP: TFloatField;
    qryEstatHotelQTDEBLOQUEADO: TFloatField;
    qryEstatHotelTOTALUHS: TFloatField;
    qryEstatHotelTOTDISPUHS: TFloatField;
    qryEstatHotelQTDHOSPEDES: TFloatField;
    qryEstatHotelQTDESELLABLEROOMS: TFloatField;
    qryEstatHotelQTDESELLABLEROOMSHOJE: TFloatField;
    qryEstatHotelQTDEROOMSPAID: TFloatField;
    qryEstatHotelQTDEROOMSPAIDHOJE: TFloatField;
    qryEstatHotelQTDEOCCUPIEDROOMS: TFloatField;
    qryEstatHotelQTDEOCCUPIEDROOMSHOJE: TFloatField;
    qryEstatHotelPERCOCCUPANCYHOJE: TFloatField;
    qryEstatHotelPERCOCCUPANCY: TFloatField;
    ppFlashRptDBText11: TppDBText;
    ppFlashRptDBText12: TppDBText;
    ppFlashRptDBText13: TppDBText;
    ppFlashRptDBText14: TppDBText;
    ppFlashRptDBText15: TppDBText;
    ppFlashRptDBText16: TppDBText;
    ppFlashRptDBText17: TppDBText;
    ppFlashRptDBText18: TppDBText;
    ppFlashRptDBText19: TppDBText;
    ppFlashRptDBText20: TppDBText;
    ppFlashRptDBText21: TppDBText;
    ppFlashRptDBText22: TppDBText;
    ppFlashRptDBText23: TppDBText;
    ppFlashRptDBText24: TppDBText;
    qryEstatHotelGROUPRNC: TFloatField;
    qryEstatHotelGROUPRNCHOJE: TFloatField;
    qryEstatHotelGROUPADRHOJE: TFloatField;
    qryEstatHotelGROUPADR: TFloatField;
    ppFlashRptDBText25: TppDBText;
    ppFlashRptDBText26: TppDBText;
    ppFlashRptDBText27: TppDBText;
    ppFlashRptDBText28: TppDBText;
    ppFlashRptDBText29: TppDBText;
    ppFlashRptDBText30: TppDBText;
    qryEstatHotelTRANSIENTRNC: TFloatField;
    qryEstatHotelTRANSIENTRNCHOJE: TFloatField;
    qryEstatHotelTRANSIENTADR: TFloatField;
    qryEstatHotelTRANSIENTADRHOJE: TFloatField;
    ppFlashRptDBText31: TppDBText;
    ppFlashRptDBText32: TppDBText;
    ppFlashRptDBText33: TppDBText;
    ppFlashRptDBText34: TppDBText;
    qryEstatHotelREPEATGUESTRNCHOJE: TFloatField;
    qryEstatHotelREPEATGUESTRNC: TFloatField;
    ppFlashRptDBText35: TppDBText;
    ppFlashRptDBText36: TppDBText;
    ppFlashRptDBText37: TppDBText;
    ppFlashRptDBText38: TppDBText;
    ppFlashRptDBText39: TppDBText;
    ppFlashRptDBText40: TppDBText;
    ppFlashRptDBText41: TppDBText;
    ppFlashRptDBText42: TppDBText;
    ppFlashRptDBText43: TppDBText;
    ppFlashRptDBText44: TppDBText;
    qryEstatHotelCHOICERSRNCHOJE: TFloatField;
    qryEstatHotelCHOICERSRNC: TFloatField;
    qryEstatHotelSTAYOVERSRNCHOJE: TFloatField;
    qryEstatHotelSTAYOVERSRNC: TFloatField;
    ppFlashRptDBText45: TppDBText;
    ppFlashRptDBText46: TppDBText;
    ppFlashRptDBText47: TppDBText;
    ppFlashRptDBText48: TppDBText;
    qryEstatHotelEARLYDEPLRNCHOJE: TFloatField;
    qryEstatHotelEARLYDEPLRNC: TFloatField;
    ppFlashRptDBText49: TppDBText;
    ppFlashRptDBText50: TppDBText;
    qryEstatHotelPICKUPRNCHOJE: TFloatField;
    qryEstatHotelPICKUPRNC: TFloatField;
    ppFlashRptDBText51: TppDBText;
    ppFlashRptDBText52: TppDBText;
    ppFlashRptDBText53: TppDBText;
    ppFlashRptDBText54: TppDBText;
    qryEstatHotelUHWALKINRNCHOJE: TFloatField;
    qryEstatHotelUHWALKINRNC: TFloatField;
    ppFlashRptDBText55: TppDBText;
    ppFlashRptDBText56: TppDBText;
    ppFlashRptDBText57: TppDBText;
    ppFlashRptDBText58: TppDBText;
    ppFlashRptDBText59: TppDBText;
    ppFlashRptDBText60: TppDBText;
    qryEstatHotelNOSHOWLRNCHOJE: TFloatField;
    qryEstatHotelNOSHOWLRNC: TFloatField;
    ppFlashRptDBText61: TppDBText;
    ppFlashRptDBText62: TppDBText;
    ppFlashRptDBText63: TppDBText;
    ppFlashRptDBText64: TppDBText;
    qryEstatHotelGUESTPEROCPROOMHOJE: TFloatField;
    qryEstatHotelGUESTPEROCPROOM: TFloatField;
    ppFlashRptDBText65: TppDBText;
    ppFlashRptDBText66: TppDBText;
    ppFlashRptDBText67: TppDBText;
    ppFlashRptDBText68: TppDBText;
    qryEstatHotelAVGLENGTHSTAYHOJE: TFloatField;
    qryEstatHotelAVGLENGTHSTAY: TFloatField;
    qryDatas: TwwQuery;
    qryDatasDATA: TDateTimeField;
    qryDatasCORTESIA: TIntegerField;
    qryDatasUSOCASA: TIntegerField;
    qryDatasTOTALGERAL2: TIntegerField;
    ppDatas: TppBDEPipeline;
    dsDatas: TwwDataSource;
    qryOcupacaoGrp: TwwQuery;
    qryOcupacaoGrpDATA: TDateTimeField;
    qryOcupacaoGrpQTDTENTATIVA: TFloatField;
    qryOcupacaoGrpQTDCHEGADAS: TFloatField;
    qryOcupacaoGrpQTDUSOCASA: TFloatField;
    qryOcupacaoGrpQTDCORTESIA: TFloatField;
    qryOcupacaoGrpQTDPERMUTAS: TFloatField;
    qryOcupacaoGrpQTDGARANT: TFloatField;
    qryOcupacaoGrpQTDNAOGARANT: TFloatField;
    qryOcupacaoGrpQTDADULTOS: TFloatField;
    qryOcupacaoGrpQTDCRIANCAS: TFloatField;
    qryOcupacao: TwwQuery;
    qryOcupacaoDATA: TDateTimeField;
    qryOcupacaoQTDUSOCASA: TFloatField;
    qryOcupacaoQTDCORTESIA: TFloatField;
    qryOcupacaoQTDPERMUTAS: TFloatField;
    qryOcupacaoQTDALLOTMENTS: TFloatField;
    qryOcupacaoQTDCHEGADAS: TFloatField;
    qryOcupacaoQTDGARANT: TFloatField;
    qryOcupacaoQTDNAOGARANT: TFloatField;
    qryOcupacaoQTDADULTOS: TFloatField;
    qryOcupacaoQTDCRIANCAS: TFloatField;
    qryOcupacaoQTDABATESALDOALLOT: TFloatField;
    qryCalResGrpTipoAllot: TwwQuery;
    qryCalResGrpTipoAllotDATA: TDateTimeField;
    qryCalResGrpTipoAllotQTDALLOTMENTS: TFloatField;
    qryCalResGrpTipoAllotQTDABATESALDOALLOT: TFloatField;
    qryQtdContrAllot: TwwQuery;
    qryQtdContrAllotDATA: TDateTimeField;
    qryQtdContrAllotQTDALLOT: TFloatField;
    qryAtuAllot: TwwQuery;
    qryAtuAllotDATA: TDateTimeField;
    qryAtuAllotQTDTIRAL: TFloatField;
    qryBloq: TwwQuery;
    qryBloqQTDBLOQ: TFloatField;
    qryBloqDATA: TDateTimeField;
    qryQtdUHNPF: TwwQuery;
    FloatField1: TFloatField;
    qryQtdUHPF: TwwQuery;
    qryQtdUHPFQTD: TFloatField;
    qryQtdUHPFDATA: TDateTimeField;
    qryReceitas: TwwQuery;
    qryReceitasDATA: TDateTimeField;
    qryReceitasRECEITA: TFloatField;
    qryReceitasRECEF: TFloatField;
    qryReceitasRECPREV: TFloatField;
    qryDatasTOTALUHS: TIntegerField;
    qryDatasROOMREVPAR: TCurrencyField;
    qryDatasAVGDAILYRATE: TCurrencyField;
    qryDatasTOTGUESTS: TIntegerField;
    qryDatasTOTOCPROOMS: TIntegerField;
    qryDatasPERCOCCUP: TFloatField;
    qryDatasDEMANDTAG: TStringField;
    qryComplimentaryNUMRESERVA: TFloatField;
    qryComplimentaryCODUH: TStringField;
    qryComplimentarySTATUSRESERVA: TFloatField;
    qryComplimentaryRAZAOSOCIAL: TStringField;
    qryComplimentaryTPHOSPEDE: TStringField;
    qryComplimentaryNOMEHOSPEDE: TStringField;
    qryHouseUseNUMRESERVA: TFloatField;
    qryHouseUseCODUH: TStringField;
    qryHouseUseSTATUSRESERVA: TFloatField;
    qryHouseUseRAZAOSOCIAL: TStringField;
    qryHouseUseTPHOSPEDE: TStringField;
    qryHouseUseNOMEHOSPEDE: TStringField;
    qryFlashRptIDHOTEL: TFloatField;
    qryFlashRptIDORIGEMPADRAO: TFloatField;
    qryFlashRptIDTIPODCPENSAREST: TFloatField;
    qryFlashRptIDTIPODCCAFEREST: TFloatField;
    qryFlashRptIDCARGOARRUMADEIR: TFloatField;
    qryFlashRptIDTIPODCISS: TFloatField;
    qryFlashRptIDTIPODCCARTAO: TFloatField;
    qryFlashRptIDTIPODCCAFE: TFloatField;
    qryFlashRptIDTIPODCDAYUSE: TFloatField;
    qryFlashRptIDTIPODCPENSAO: TFloatField;
    qryFlashRptCODCATEGTARBALCAO: TStringField;
    qryFlashRptIDTIPODCDIARIA: TFloatField;
    qryFlashRptMOEDANACIONAL: TFloatField;
    qryFlashRptIDGRUPODCCREDITO: TFloatField;
    qryFlashRptIDTIPODCNOSHOW: TFloatField;
    qryFlashRptIDTIPODCLCHECKOUT: TFloatField;
    qryFlashRptMOEDADOLAR: TFloatField;
    qryFlashRptIDTIPODCTXSERVICO: TFloatField;
    qryFlashRptIDTIPODCCHEQUE: TFloatField;
    qryFlashRptMASCSEGMENTO: TStringField;
    qryFlashRptIDTIPODCDINHEIRO: TFloatField;
    qryFlashRptIDMEIOPADRAO: TFloatField;
    qryFlashRptIDTIPODCDEPOSITO: TFloatField;
    qryFlashRptIDTIPODCDESCDIARIA: TFloatField;
    qryFlashRptCODSEGPADRAO: TStringField;
    qryFlashRptIDSTATUSUHVG: TFloatField;
    qryFlashRptIDTIPODCAFATURAR: TFloatField;
    qryFlashRptIDTIPODCDIFDIARIA: TFloatField;
    qryFlashRptIDSTATUSUHOC: TFloatField;
    qryFlashRptIDSTATUSGOVSUJO: TFloatField;
    qryFlashRptIDTIPODCDEVDEP: TFloatField;
    qryFlashRptIDTIPODCREFAMANHA: TFloatField;
    qryFlashRptIDSTATUSGOVLIMPO: TFloatField;
    qryFlashRptIDTIPODCTELEFONE: TFloatField;
    qryFlashRptIDTIPODCREFONTEM: TFloatField;
    qryFlashRptIDVEICULOPADRAO: TFloatField;
    qryFlashRptTXSERVICO: TFloatField;
    qryFlashRptIDTIPODCOUTROSREQ: TFloatField;
    qryFlashRptIDTIPODCTXTURISMO: TFloatField;
    qryFlashRptPERCIMPDIARIAS: TFloatField;
    qryFlashRptMASCTIPOENXOV: TStringField;
    qryFlashRptIDTIPODCCHEGANTEC: TFloatField;
    qryFlashRptCRI1_COMO_ADT: TStringField;
    qryFlashRptCRI2_COMO_ADT: TStringField;
    qryFlashRptPOSSUE_CRI1: TStringField;
    qryFlashRptPOSSUE_CRI2: TStringField;
    qryFlashRptHOTELFLAT: TStringField;
    qryFlashRptIDSTATUSUHBLOQ: TFloatField;
    qryFlashRptDATASISTEMA: TDateTimeField;
    qryFlashRptIDADEMAXCRI1: TFloatField;
    qryFlashRptIDADEMAXCRI2: TFloatField;
    qryFlashRptHORACHECKIN: TDateTimeField;
    qryFlashRptHORACHECKOUT: TDateTimeField;
    qryFlashRptTAXAPORLANC: TStringField;
    qryFlashRptIMPOSTOPORLANC: TStringField;
    qryFlashRptPERCISS: TFloatField;
    qryFlashRptTIPOPENSPADRAO: TStringField;
    qryFlashRptNUMMAXDIASRSV: TFloatField;
    qryFlashRptPASSOAUDITORIA: TFloatField;
    qryFlashRptIMPNOTASALDIFZERO: TStringField;
    qryFlashRptLANCARDICHECKIN: TStringField;
    qryFlashRptCONTABINTEGRADO: TStringField;
    qryFlashRptUSAYIELDMANAG: TStringField;
    qryFlashRptABRECONTAACOMP: TStringField;
    qryFlashRptINTEGRATELEFONIA: TStringField;
    qryFlashRptCARTAOIDENTIFICA: TStringField;
    qryFlashRptTXEXPRLAVANDERIA: TFloatField;
    qryFlashRptNUMDIASDELPOSCO: TFloatField;
    qryFlashRptCAFEEMDIMEDIA: TStringField;
    qryFlashRptCOEMDIMEDIATXOC: TStringField;
    qryFlashRptARREDONDAMENTODI: TFloatField;
    qryFlashRptPDVINTEGRADO: TStringField;
    qryFlashRptNUMDIASCONFRES: TFloatField;
    qryFlashRptNUMDIASDELRELAT: TFloatField;
    qryFlashRptINCNUMNOTAFOLHA: TStringField;
    qryFlashRptVALMINCONSCHTEF: TFloatField;
    qryFlashRptNUMMAXDIASREABCTA: TFloatField;
    qryFlashRptNUMMAXCONTASPEND: TFloatField;
    qryFlashRptLANCARDILIQUIDA: TStringField;
    qryFlashRptDIRIMAGENS: TStringField;
    qryFlashRptRELSUMARIODEBCRED: TStringField;
    qryFlashRptRELCHECKIN: TStringField;
    qryFlashRptRELPREVOCUPACAO: TStringField;
    qryFlashRptRELDEMONSTOCUP: TStringField;
    qryFlashRptRELSITUACAOUH: TStringField;
    qryFlashRptRELHOSPEDENACASA: TStringField;
    qryFlashRptRELCHECKOUT: TStringField;
    qryFlashRptRELEXTENSOES: TStringField;
    qryFlashRptRELSALDOHOSPEDE: TStringField;
    qryFlashRptRELBORDERODEBCRED: TStringField;
    qryFlashRptRELRECEBPAG: TStringField;
    qryFlashRptRELNOTAEMITANALIT: TStringField;
    qryFlashRptRELNOTAEMITSINTET: TStringField;
    qryFlashRptRELESTORNOEDESC: TStringField;
    qryFlashRptRELLANCTRANSF: TStringField;
    qryFlashRptRELSALDOCONTAS: TStringField;
    qryFlashRptRELHOSPEDEEMCURSO: TStringField;
    qryFlashRptRELRDS: TStringField;
    qryFlashRptRELESTPERNOITE: TStringField;
    qryFlashRptRELESTPROCEDENC: TStringField;
    qryFlashRptRELRESUMGERALATIV: TStringField;
    qryFlashRptNUMMAXANTRSV: TFloatField;
    qryFlashRptTRGDTINCLUSAO: TDateTimeField;
    qryFlashRptTRGUSERINCLUSAO: TStringField;
    qryFlashRptGAMEONDEMAND: TFloatField;
    qryFlashRptVIDEOONDEMAND: TFloatField;
    qryFlashRptIDUSUARIOPDV: TFloatField;
    qryFlashRptCABECALHOSLIP: TMemoField;
    qryFlashRptIDTIPODCGORJETA: TFloatField;
    qryFlashRptRODAPESLIP: TMemoField;
    qryFlashRptCADASTRACRI2: TStringField;
    qryFlashRptCADASTRACRI1: TStringField;
    qryFlashRptUSATENTATIVRES: TStringField;
    qryFlashRptDIRRELAUDITORIA: TStringField;
    qryFlashRptMODELOSLIP: TFloatField;
    qryFlashRptPOLCANCRESERVA: TStringField;
    qryFlashRptPOLCANCRESERVAING: TStringField;
    qryFlashRptDIRCOVERPAGE: TStringField;
    qryFlashRptPOLNOSHOWRESING: TStringField;
    qryFlashRptPOLNOSHOWRES: TStringField;
    qryFlashRptVLRCAFEPADRAO: TFloatField;
    qryFlashRptTIPOCONTAGEMCAFE: TFloatField;
    qryFlashRptMOEDACAFE: TFloatField;
    qryFlashRptIDCONTAPENSAO: TFloatField;
    qryFlashRptPROXNUMERONOTA: TFloatField;
    qryFlashRptACEITARESFPOOL: TStringField;
    qryFlashRptIDORIGEMCENTRES: TFloatField;
    qryFlashRptIDDOCCENTRES: TFloatField;
    qryFlashRptCODSEGCENTRES: TStringField;
    qryFlashRptIDVEICULOSCENTRES: TFloatField;
    qryFlashRptIDMEIOCENTRES: TFloatField;
    qryFlashRptIDMOTIVOCENTRES: TFloatField;
    qryFlashRptUCEMDIMEDIATXOC: TStringField;
    qryFlashRptIDTIPODCTELDDD: TFloatField;
    qryFlashRptIDTIPODCTELDDI: TFloatField;
    lblDataSistema: TppLabel;
    ppFlashRptDBText69: TppDBText;
    ppFlashRptDBText70: TppDBText;
    ppFoodStats: TppBDEPipeline;
    dsFoodStats: TwwDataSource;
    qryFoodStats: TwwQuery;
    ppFlashRptDBText71: TppDBText;
    ppFlashRptDBText72: TppDBText;
    qryNetRev: TwwQuery;
    dsNetRev: TwwDataSource;
    ppNetRev: TppBDEPipeline;
    ppRoomsDI: TppBDEPipeline;
    dsRoomsDI: TwwDataSource;
    qryRoomsDI: TwwQuery;
    qryRoomsDIAVGDIHOJE: TFloatField;
    qryRoomsDIAVGDI: TFloatField;
    qryRoomsDIREVPARHOJE: TFloatField;
    qryRoomsDIREVPAR: TFloatField;
    qryFoodStatsAVGCHECKHOJE: TCurrencyField;
    qryFoodStatsAVGCHECK: TCurrencyField;
    ppFlashRptShape1: TppShape;
    ppFlashRptShape2: TppShape;
    ppFlashRptSummaryBand4: TppSummaryBand;
    qryFoodStatsHOJELIQUIDO: TFloatField;
    qryFoodStatsACUMLIQUIDO: TFloatField;
    qryEmpresaProp: TwwQuery;
    dsEmpresaProp: TwwDataSource;
    pplEmpresaProp: TppBDEPipeline;
    qryEmpresaPropNOME: TStringField;
    qryEmpresaPropRAZAOSOCIAL: TStringField;
    qryEmpresaPropNUMDOCUMENTO: TStringField;
    qryEmpresaPropIMAGEM: TBlobField;
    ppFlashRptDBImage1: TppDBImage;
    qryPOA: TwwQuery;
    dsPOA: TwwDataSource;
    ppPOA: TppBDEPipeline;
    ppFlashRptDBText96: TppDBText;
    ppFlashRptDBText97: TppDBText;
    ppFlashRptDBText98: TppDBText;
    ppFlashRptDBText99: TppDBText;
    ppFlashRptDBText100: TppDBText;
    ppFlashRptDBText101: TppDBText;
    ppFlashRptDBText102: TppDBText;
    ppFlashRptDBText103: TppDBText;
    ppFlashRptDBText104: TppDBText;
    ppFlashRptDBText105: TppDBText;
    ppFlashRptDBText106: TppDBText;
    ppFlashRptDBText107: TppDBText;
    ppFlashRptDBText108: TppDBText;
    ppFlashRptDBText109: TppDBText;
    ppFlashRptDBText110: TppDBText;
    ppFlashRptDBText111: TppDBText;
    ppFlashRptDBText112: TppDBText;
    ppFlashRptDBText113: TppDBText;
    ppFlashRptDBText114: TppDBText;
    ppFlashRptDBText115: TppDBText;
    ppFlashRptDBText116: TppDBText;
    ppFlashRptDBText117: TppDBText;
    ppFlashRptDBText118: TppDBText;
    ppFlashRptDBText119: TppDBText;
    ppFlashRptDBText120: TppDBText;
    ppFlashRptDBText121: TppDBText;
    ppFlashRptDBText122: TppDBText;
    ppFlashRptDBText123: TppDBText;
    ppFlashRptDBText124: TppDBText;
    ppFlashRptDBText125: TppDBText;
    ppFlashRptDBText126: TppDBText;
    ppFlashRptDBText127: TppDBText;
    ppFlashRptDBText128: TppDBText;
    ppFlashRptDBText129: TppDBText;
    ppFlashRptDBText130: TppDBText;
    ppFlashRptDBText131: TppDBText;
    qryPOATOTALUHS: TFloatField;
    qryPOAQTDEBLOQUEADO: TFloatField;
    qryPOAQTDEUSOCASA: TFloatField;
    qryPOAQTDESELLABLEROOMS: TFloatField;
    qryPOAQTDEROOMSPAID: TFloatField;
    qryPOAQTDEUHCORTESIA: TFloatField;
    qryPOAQTDEOCCUPIEDROOMS: TFloatField;
    qryPOAPERCOCCUPANCY: TFloatField;
    qryPOAAVGDI: TFloatField;
    qryPOAREVPAR: TFloatField;
    qryPOAQTDEUHGRP: TFloatField;
    qryPOAGROUPRNC: TFloatField;
    qryPOAGROUPADR: TFloatField;
    qryPOAQTDEUHIND: TFloatField;
    qryPOATRANSIENTRNC: TFloatField;
    qryPOATRANSIENTADR: TFloatField;
    qryPOAQTDEHOSPEDEREPETE: TFloatField;
    qryPOAREPEATGUESTRNC: TFloatField;
    qryPOACHOICERS: TFloatField;
    qryPOACHOICERSRNC: TFloatField;
    qryPOAQTDEEXTENSOES: TFloatField;
    qryPOASTAYOVERSRNC: TFloatField;
    qryPOAQTDESAIANTECIPADA: TFloatField;
    qryPOAEARLYDEPLRNC: TFloatField;
    qryPOAQTDEPICKUP: TFloatField;
    qryPOAPICKUPRNC: TFloatField;
    qryPOAQTDEUHWALKIN: TFloatField;
    qryPOAUHWALKINRNC: TFloatField;
    qryPOAQTDEUHNOSHOWCOB: TFloatField;
    qryPOANOSHOWLRNC: TFloatField;
    qryPOAQTDHOSPEDES: TFloatField;
    qryPOAGUESTPEROCPROOM: TFloatField;
    qryPOAQTDECHEGADAS: TFloatField;
    qryPOAAVGLENGTHSTAY: TFloatField;
    qryPOAQTDECOUVERT: TFloatField;
    qryPOAAVGCHECK: TFloatField;
    qryPOAROOMS: TFloatField;
    qryPOAFOOD: TFloatField;
    qryPOABEVERAGE: TFloatField;
    qryPOATELEPHONE: TFloatField;
    qryPOAOTHER1: TFloatField;
    qryPOAOTHER2: TFloatField;
    qryPOAOTHER3: TFloatField;
    qryPOAOTHERINC: TFloatField;
    updPOA: TUpdateSQL;
    qryPOAID: TFloatField;
    qryLinhaPOA: TwwQuery;
    qryCompConta: TwwQuery;
    qryCompContaCODSUBCONTA: TFloatField;
    qryCompContaCODCENTROCUSTO: TStringField;
    qryCompContaIDEMPRESA: TFloatField;
    qryCompContaUNIDNEGOC: TFloatField;
    qryCompContaPLACONTA: TStringField;
    qryCompContaPLANO: TFloatField;
    qryCompContaIDPATRO: TFloatField;
    qryCompContaIDPLANOPREV: TFloatField;
    qrySaldos: TwwQuery;
    qryEstatHotelCHOICERSHOJE: TFloatField;
    qryEstatHotelCHOICERS: TFloatField;
    qryComplimentaryCHEGADA: TDateTimeField;
    qryComplimentaryPARTIDA: TDateTimeField;
    qryHouseUseCHEGADA: TDateTimeField;
    qryHouseUsePARTIDA: TDateTimeField;
    ppFlashRptTitleBand4: TppTitleBand;
    ppFlashRptDBImage2: TppDBImage;
    ppFlashRptLabel2: TppLabel;
    ppFlashRptLabel3: TppLabel;
    lblDataSistema1: TppLabel;
    ppFlashRptLabel5: TppLabel;
    ppFlashRptShape6: TppShape;
    ppRptComments: TppMemo;
    qryEstatHotelQTDEDAYUSEHOJE: TFloatField;
    qryEstatHotelQTDEDAYUSECOBHOJE: TFloatField;
    qryEstatHotelQTDEDAYUSE: TFloatField;
    qryEstatHotelQTDEDAYUSECOB: TFloatField;
    qryEstatHotelQTDESAIANTECIPADAHOJE: TFloatField;
    qryEstatHotelQTDESAIANTECIPADA: TFloatField;
    qryPOAOTHERINCROOM: TFloatField;
    qryLinhaDeptRev: TwwQuery;
    qryItemDeptRev: TwwQuery;
    qryRoomsDIHOJELIQGRP: TFloatField;
    qryRoomsDIACUMLIQGRP: TFloatField;
    qryRoomsDIHOJELIQIND: TFloatField;
    qryRoomsDIACUMLIQIND: TFloatField;
    qryItemDeptRevIDGRUPODEPTREV: TFloatField;
    qryItemDeptRevCOLUNA: TStringField;
    qryItemDeptRevIDELEMDEMONSTRAT: TFloatField;
    qryLinhaDeptRevIDGRUPODEPTREV: TFloatField;
    qryLinhaDeptRevNOMELINHA: TStringField;
    qryLinhaDeptRevPOSICAORELAT: TFloatField;
    updNetRev: TUpdateSQL;
    qryNetRevID: TFloatField;
    qryNetRevNETREVHOJE: TFloatField;
    qryNetRevNETREV: TFloatField;
    qryNetRevREVPARHOJE: TFloatField;
    qryNetRevREVPAR: TFloatField;
    ppFlashRptDeptRev: TppSubReport;
    ppFlashRptChildReport5: TppChildReport;
    ppFlashRptTitleBand3: TppTitleBand;
    ppFlashRptShape4: TppShape;
    lbl4DayFore: TppLabel;
    ppFlashRptDetailBand3: TppDetailBand;
    ppFlashRptDBText89: TppDBText;
    ppFlashRptChildReport5DBText2: TppDBText;
    ppFlashRptChildReport5DBText3: TppDBText;
    ppFlashRptChildReport5DBText4: TppDBText;
    ppFlashRptSummaryBand3: TppSummaryBand;
    updLinhaDeptRev: TUpdateSQL;
    ppFlashRpt4DayFore: TppSubReport;
    ppFlashRptChildReport1: TppChildReport;
    ppFlashRptTitleBand1: TppTitleBand;
    ppFlashRptShape3: TppShape;
    ppFlashRptLabel1: TppLabel;
    lblAvailableRooms: TppLabel;
    lblOcpRooms: TppLabel;
    lblPercOcup: TppLabel;
    lblAvgDRate: TppLabel;
    lblRevAvgR: TppLabel;
    lblNumGuests: TppLabel;
    lblDemandTag: TppLabel;
    ppFlashRptDetailBand1: TppDetailBand;
    ppFlashRptDBText73: TppDBText;
    ppFlashRptDBText74: TppDBText;
    ppFlashRptDBText75: TppDBText;
    ppFlashRptDBText76: TppDBText;
    ppFlashRptDBText77: TppDBText;
    ppFlashRptChildReport5DBText5: TppDBText;
    ppFlashRptChildReport5DBText6: TppDBText;
    ppFlashRptChildReport5DBText7: TppDBText;
    ppFlashRptSummaryBand1: TppSummaryBand;
    ppFlashRptCO: TppSubReport;
    ppFlashRptChildReport2: TppChildReport;
    ppFlashRptChildReport2TitleBand1: TppTitleBand;
    ppFlashRptChildReport2Shape1: TppShape;
    lblComplimentaryRooms: TppLabel;
    ppFlashRptChildReport2Label2: TppLabel;
    ppFlashRptChildReport2Label3: TppLabel;
    ppFlashRptChildReport2Label4: TppLabel;
    ppFlashRptChildReport2DetailBand1: TppDetailBand;
    ppFlashRptChildReport2Line2: TppLine;
    ppFlashRptChildReport2DBText1: TppDBText;
    ppFlashRptChildReport2DBText2: TppDBText;
    ppFlashRptChildReport2DBText3: TppDBText;
    ppFlashRptChildReport2DBText4: TppDBText;
    ppFlashRptChildReport2DBText5: TppDBText;
    ppFlashRptChildReport2SummaryBand1: TppSummaryBand;
    ppFlashRptHU: TppSubReport;
    ppFlashRptChildReport3: TppChildReport;
    ppFlashRptTitleBand2: TppTitleBand;
    ppFlashRptChildReport3Shape1: TppShape;
    lblHouseUse: TppLabel;
    ppFlashRptLabel9: TppLabel;
    ppFlashRptLabel17: TppLabel;
    ppFlashRptLabel25: TppLabel;
    ppFlashRptDetailBand2: TppDetailBand;
    ppFlashRptLine7: TppLine;
    ppFlashRptChildReport3DBText1: TppDBText;
    ppFlashRptChildReport3DBText2: TppDBText;
    ppFlashRptChildReport3DBText3: TppDBText;
    ppFlashRptChildReport3DBText4: TppDBText;
    ppFlashRptChildReport3DBText5: TppDBText;
    ppFlashRptSummaryBand2: TppSummaryBand;
    ppFlashRptOutOrder: TppSubReport;
    ppFlashRptChildReport4: TppChildReport;
    ppFlashRptTitleBand5: TppTitleBand;
    ppFlashRptShape5: TppShape;
    ppFlashRptLabel4: TppLabel;
    ppFlashRptLabel26: TppLabel;
    ppFlashRptLabel28: TppLabel;
    ppFlashRptDetailBand4: TppDetailBand;
    ppFlashRptLine6: TppLine;
    ppFlashRptChildReport4DBText1: TppDBText;
    ppFlashRptChildReport4DBText2: TppDBText;
    ppFlashRptChildReport4DBText3: TppDBText;
    ppFlashRptSummaryBand5: TppSummaryBand;
    qryLinhaDeptRevCOLHOJE: TFloatField;
    qryLinhaDeptRevCOLACUMULADO: TFloatField;
    qryLinhaDeptRevCOLORCADO: TFloatField;
    ppFlashRptChildReport1Line1: TppLine;
    lblTotalNetRev: TppLabel;
    ppFlashRptDBText92: TppDBText;
    ppFlashRptDBText93: TppDBText;
    lblTotalRevPar: TppLabel;
    ppFlashRptDBText94: TppDBText;
    ppFlashRptDBText95: TppDBText;
    ppFlashRptChildReport5DBText1: TppDBText;
    ppFlashRptChildReport5DBText8: TppDBText;
    qryNetRevNETREVORC: TFloatField;
    qryNetRevREVPARORC: TFloatField;
    qryCompContaELETIPOELEM: TStringField;
    qryItemDeptRevFLGRATEIO: TStringField;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    qrySumarioFlash: TwwQuery;
    dsSumarioFlash: TwwDataSource;
    ppSumarioFlash: TppBDEPipeline;
    rpSumarioFlash: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLabel5: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine3: TppLine;
    ppLabel6: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    qrySumarioFlashIDTIPODEBCRED: TFloatField;
    qrySumarioFlashTOTALMES: TFloatField;
    qrySumarioFlashTOTALDIA: TFloatField;
    qrySumarioFlashDESCDC: TStringField;
    qrySumarioFlashDESCGRUPO: TStringField;
    ppLabel7: TppLabel;
    lblDataSumario: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel14: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel9: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel15: TppLabel;
    ppLine4: TppLine;
    ppLabel10: TppLabel;
    ppLine5: TppLine;
    qrySumarioImpostos: TwwQuery;
    qrySumarioFlashTOTALDIALIQUIDO: TCurrencyField;
    qrySumarioFlashTOTALMESLIQUIDO: TFloatField;
    qrySumarioFlashTOTALDIAIMPOSTOS: TCurrencyField;
    qrySumarioFlashTOTALMESIMPOSTOS: TCurrencyField;
    qrySumarioImpostosIMPOSTOSMES: TFloatField;
    qrySumarioImpostosIMPOSTODIA: TFloatField;
    qrySumarioImpostosIDTIPODEBCRED: TFloatField;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLine6: TppLine;
    qryOutOrderDATAAVAL: TMemoField;
    qryOutOrderCODUH: TStringField;
    qryOutOrderDATAFIM: TDateTimeField;
    qryOutOrderOBSERVACAO: TStringField;
    qryOutOrderMOTIVO: TStringField;
    qryCouvert: TwwQuery;
    qryCouvertQTDECOUVERTHOJE: TFloatField;
    qryCouvertQTDECOUVERTACUM: TFloatField;
    qryFoodStatsQTDECOUVERTHOJE: TIntegerField;
    qryFoodStatsQTDECOUVERTACUM: TIntegerField;
    procedure qryEstatHotelCalcFields(DataSet: TDataSet);
    procedure qryDatasCalcFields(DataSet: TDataSet);
    procedure qryFoodStatsCalcFields(DataSet: TDataSet);
    procedure lblDataSistema1Print(Sender: TObject);
    procedure ppFlashRptSummaryBand4BeforePrint(Sender: TObject);
    procedure qrySumarioFlashCalcFields(DataSet: TDataSet);
    procedure ppFlashRptDBText103Format(Sender: TObject;
      DisplayFormat: String; DataType: TppDataType; Value: Variant;
      var Text: String);
  private
    { Private declarations }
    function CalculaOrcConta(qry : TwwQuery; idEmpresa, iPeriodo, iExercicio : Integer) : Double;
    function CalculaHojeConta(qry : TwwQuery; idEmpresa, iPeriodo, iExercicio : Integer; sDataRelat : string) : Double;
    function CalculaAcumConta(qry : TwwQuery; idEmpresa, iPeriodo, iExercicio : Integer; sDataRelatIni, sDataRelatFim: string) : Double;
    function CalculaSaldoOrc(idElemento : Double; idEmpresa, iPeriodo, iExercicio : Integer ) : Double;
    function CalculaSaldoHoje(idElemento : Double; idEmpresa, iPeriodo, iExercicio :Integer; sDataRelat : String ) : Double;
    function CalculaSaldoAcum(idElemento : Double; idEmpresa, iPeriodo, iExercicio :Integer; sDataRelatIni, sDataRelatFim : String) : Double;
  public
    { Public declarations }
    dDataRelat ,
    dDataRelatIni : TDateTime;
    sComments     : string;
    function CalculaHojeElemento(idElemento : integer; sFlgRateio : string) : Double;
    function CalculaAcumElemento(idElemento : integer; sFlgRateio : string) : Double;
    function CalculaOrcElemento(idElemento : integer; sFlgRateio : string)  : Double;
    function MostraParam(Form: string): boolean; override;
  end;

const

  DIARIAS        = 'DI';
  BARDAUH        = 'BU';
  BARES          = 'BA';
  ROOMSERVICE    = 'RS';
  RESTAURANTE    = 'RE';
  EVENTOS        = 'EV';
  BANQUETES      = 'BQ';
  LAVANDERIA     = 'LV';
  TELEFONE       = 'TL';
  BOUTIQUE       = 'BO';
  REQUERIMENTO   = 'RQ';
  DIVERSOS       = 'DV';
  ESTACIONAMENTO = 'ES';

var
  dtmFlashRpt: TdtmFlashRpt;

implementation

{$R *.DFM}
uses uDiasUteis, uDatabase, uLancContab, uSistema, FParamFlashRpt,
FParamSumarioFlash;

function TdtmFlashRpt.MostraParam(Form: string): boolean;
begin
  result := false;
  if (UPPERCASE(Form) = 'FRMPARAMFLASHRPT') then
  begin
    with TfrmParamFlashRpt.Create(Application) do
      Result := (ShowModal = mrOk);
  end
    else
      if (UPPERCASE(Form) = 'FRMPARAMSUMDCFLASH') then
      begin
        with TfrmParamSumDCFlash.Create(Application) do
          Result := (ShowModal = mrOk);
      end;
end;

function TdtmFlashRpt.CalculaOrcElemento(idElemento : integer; sFlgRateio : string): Double;
var iNumDiasMes,iDiaRelat,
    iEmpresaProp,
    iPeriodo,iExercicio : Integer;
    iMes,iAno : Word;
    sMens : String;
begin
  iEmpresaProp := Sistema.IdEmpresa;
  iMes         := DiasUteis.ExtraiMes(dDataRelat);
  iAno         := DiasUteis.ExtraiAno(dDataRelat);
  iNumDiasMes  := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(iAno,iMes));
  iDiaRelat    := DiasUteis.ExtraiDia(dDataRelat);
  iPeriodo     := iMes;
  iExercicio   := iAno;
  TestaPeriodo(false,'BaseDados',DateToStr(dDataRelat),IntToStr(Sistema.idModulo),iExercicio,
               iPeriodo,iEmpresaProp,sMens);
  result := CalculaSaldoOrc(idElemento, Sistema.idEmpresa, iPeriodo, iExercicio);
  if (sFlgRateio = 'S') and
     (iNumDiasMes * iDiaRelat > 0) then
    result := (result / iNumDiasMes) * iDiaRelat;
end;

function TdtmFlashRpt.CalculaOrcConta(qry : TwwQuery; idEmpresa, iPeriodo, iExercicio : Integer) : Double;
var sSql : string;
begin
  result := 0;
  //Ano Atual Periodo Atual
  sSql :=        'SELECT SUM(DECODE(S.PLSORCADOCREDITO,NULL,0,S.PLSORCADOCREDITO) -               ';
  sSql := sSql + '           DECODE(S.PLSORCADODEBITO,NULL,0,S.PLSORCADODEBITO)) AS SALDOORC      ';
  sSql := sSql + 'FROM PLANOSALDO S                                                               ';
  sSql := sSql + 'WHERE (S.PLACONTA LIKE '+#39+qry.FieldByName('PLACONTA').AsString+'%'+#39+')';
  sSql := sSql + '  AND (S.PLSTIPO = ''A'')                                                       ';
  sSql := sSql + '  AND (S.IDPESSOA = '+IntToStr(IdEmpresa)+')                                    ';
  sSql := sSql + '  AND (S.PEREXERCICIO = '+IntToStr(iExercicio)+')                               ';
  sSql := sSql + '  AND (S.PERNUMERO  = '+IntToStr(iPeriodo)+')                                   ';
  if not qry.FieldByName('CODCENTROCUSTO').isNull then begin
     sSql := sSql + '   AND (S.CODCENTROCUSTO LIKE '+#39+qry.FieldByName('CODCENTROCUSTO').AsString+'%'+#39+')';
  end;
  if not qry.FieldByName('UNIDNEGOC').isNull then begin
     sSql := sSql + '   AND (S.UNIDNEGOC = '+qry.FieldByName('UNIDNEGOC').AsString+') ';
  end;
  if not qry.FieldByName('IDPATRO').isNull then begin
     sSql := sSql + '   AND (S.IDPATRO = '+qry.FieldByName('IDPATRO').AsString+') ';
  end;
  if not qry.FieldByName('IDPLANOPREV').isNull then begin
     sSql := sSql + '   AND (S.IDPLANOPREV = '+qry.FieldByName('IDPLANOPREV').AsString+') ';
  end;
  if not qry.FieldByName('CODSUBCONTA').isNull then begin
     sSql := sSql + '   AND (S.CODSUBCONTA = '+qry.FieldByName('CODSUBCONTA').AsString+') ';
  end;
  if FazQuery(qrySaldos,sSql) then
    result := qrySaldos.FieldByName('SALDOORC').AsFloat;
  qrySaldos.Close;
end;

function TdtmFlashRpt.CalculaSaldoOrc(idElemento : Double; idEmpresa, iPeriodo, iExercicio :Integer):Double;
var rSaldo, rSaldoCalc : Double;
    qry : TwwQuery;
    Operacao : char;
begin
  rSaldo := 0;
  //
  qry := TwwQuery.Create(Self);
  qry.DatabaseName := 'BaseDados';
  //
  qry.Close;
  qry.Sql.Text := sSqlCompConta;
  qry.ParamByName('IELEMDEMO').AsFloat := idElemento; //Passar a linha gravada na tabela.
  qry.Open;
  qry.First;

  while not qry.EOF do
  begin
    if qry.FieldByName('ELETIPOELEM').AsString = 'C' then
      rSaldo := rSaldo + CalculaOrcConta(qry,IdEmpresa,iPeriodo,iExercicio)
    else
    begin
      rSaldoCalc := CalculaSaldoOrc(qry.FieldByName('ELEMENTODEM').AsInteger, idEmpresa, iPeriodo, iExercicio);
      if qry.FieldByName('FLGOPERACAO').AsString <> '' then
        Operacao := qry.FieldByName('FLGOPERACAO').AsString[1]
      else Operacao := 'S';
      case Operacao of
        'D' : if rSaldoCalc > 0 then rSaldo := rSaldo / rSaldoCalc;
        'M' : rSaldo := rSaldo * rSaldoCalc;
        'S' : rSaldo := rSaldo + rSaldoCalc;
        'U' : rSaldo := rSaldo - rSaldoCalc;
      end;
    end;
    qry.Next;
  end;

  qry.Close;
  qry.Free;

  Result := rSaldo;
end;

function TdtmFlashRpt.CalculaHojeElemento(idElemento : integer; sFlgRateio : string) : Double;
var iNumDiasMes,iDiaRelat,
    iPeriodo, iExercicio, iEmpresaProp : Integer;
    iMes, iAno : Word;
    sMens : string;
begin
  iEmpresaProp := Sistema.IdEmpresa;
  iMes         := DiasUteis.ExtraiMes(dDataRelat);
  iAno         := DiasUteis.ExtraiAno(dDataRelat);
  iNumDiasMes  := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(iAno,iMes));
  iDiaRelat    := DiasUteis.ExtraiDia(dDataRelat);
  iPeriodo     := iMes;
  iExercicio   := iAno;
  TestaPeriodo(false,'BaseDados',DateToStr(dDataRelat),IntToStr(Sistema.idModulo),iExercicio,
               iPeriodo,iEmpresaProp,sMens);
  result := CalculaSaldoHoje(idElemento, Sistema.IdEmpresa, iPeriodo, iExercicio, DateToStr(dDataRelat));
  if (sFlgRateio = 'S') and
     (iNumDiasMes * iDiaRelat > 0) then
    result := (result / iNumDiasMes) * iDiaRelat;
end;

function TdtmFlashRpt.CalculaHojeConta(qry : TwwQuery; idEmpresa, iPeriodo, iExercicio : Integer; sDataRelat : string) : Double;
var sSql : string;
begin
  result := 0;
  sSql :=        'SELECT SUM(DECODE(L.LACDEBCRE,'+#39+'C'+#39+',L.LACVALOR,L.LACVALOR*-1)) AS SALDOREA  ';
  sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L                                                         ';
  sSql := sSql + 'WHERE (L.PLACONTA LIKE '+#39+qry.FieldByName('PLACONTA').AsString+'%'+#39+') ';
  sSql := sSql + '  AND (P.IDPESSOA = '+IntToStr(IdEmpresa)+')                                  ';
  sSql := sSql + '  AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+')                                     ';
  sSql := sSql + '  AND (P.PERNUMERO  = '+IntToStr(iPeriodo)+')                                         ';
  if not qry.FieldByName('CODCENTROCUSTO').isNull then begin
     sSql := sSql + '   AND (L.CODCENTROCUSTO LIKE '+#39+qry.FieldByName('CODCENTROCUSTO').AsString+'%'+#39+') ';
  end;
  if not qry.FieldByName('UNIDNEGOC').isNull then begin
     sSql := sSql + '   AND (L.UNIDNEGOC = '+qry.FieldByName('UNIDNEGOC').AsString+') ';
  end;
  if not qry.FieldByName('IDPATRO').isNull then begin
     sSql := sSql + '   AND (L.IDPATRO = '+qry.FieldByName('IDPATRO').AsString+') ';
  end;
  if not qry.FieldByName('IDPLANOPREV').isNull then begin
     sSql := sSql + '   AND (L.IDPLANOPREV = '+qry.FieldByName('IDPLANOPREV').AsString+') ';
  end;
  if not qry.FieldByName('CODSUBCONTA').isNull then begin
     sSql := sSql + '   AND (L.CODSUBCONTA = '+qry.FieldByName('CODSUBCONTA').AsString+') ';
  end;
  sSql := sSql + '   AND (P.PLNDATDIA = TO_DATE('+#39+sDataRelat+#39+','+#39+'DD/MM/YYYY'+#39+'))  ';
  sSql := sSql + '   AND (L.PLNCODIGO = P.PLNCODIGO) ';
  if FazQuery(qrySaldos,sSql) then
     result := qrySaldos.FieldByName('SALDOREA').AsFloat;
  qrySaldos.Close;
end;

function TdtmFlashRpt.CalculaSaldoHoje(idElemento : Double; idEmpresa, iPeriodo, iExercicio :Integer;
                                       sDataRelat : String ) : Double;
var rSaldo, rSaldoCalc : Double;
    qry : TwwQuery;
    Operacao : char;
begin
  rSaldo := 0;
  //
  qry := TwwQuery.Create(Self);
  qry.DatabaseName := 'BaseDados';
  //
  qry.Close;
  qry.Sql.Text := sSqlCompConta;
  qry.ParamByName('IELEMDEMO').AsFloat := idElemento; //Passar a linha gravada na tabela.
  qry.Open;
  qry.First;

  while not qry.EOF do
  begin
    //Ano Atual Periodo Realizado
    if qry.FieldByName('ELETIPOELEM').AsString = 'C' then
      rSaldo := rSaldo + CalculaHojeConta(qry,IdEmpresa,iPeriodo,iExercicio,sDataRelat)
    else
    begin
      rSaldoCalc := CalculaSaldoHoje(qry.FieldByName('ELEMENTODEM').AsInteger, idEmpresa, iPeriodo, iExercicio, sDataRelat);
      if qry.FieldByName('FLGOPERACAO').AsString <> '' then
        Operacao := qry.FieldByName('FLGOPERACAO').AsString[1]
      else Operacao := 'S';
      case Operacao of
        'D' : if rSaldoCalc > 0 then rSaldo := rSaldo / rSaldoCalc;
        'M' : rSaldo := rSaldo * rSaldoCalc;
        'S' : rSaldo := rSaldo + rSaldoCalc;
        'U' : rSaldo := rSaldo - rSaldoCalc;
      end;
    end;
    qry.Next;
  end;

  qry.Close;
  qry.Free;

  result := rSaldo;
end;

function TdtmFlashRpt.CalculaAcumElemento(idElemento : integer; sFlgRateio : string) : Double;
var iNumDiasMes, iDiaRelat,
    iPeriodo,iExercicio,iEmpresaProp : Integer;
    iMes,iAno : Word;
    sMens : String;
begin
  iEmpresaProp := Sistema.IdEmpresa;
  iMes         := DiasUteis.ExtraiMes(dDataRelat);
  iAno         := DiasUteis.ExtraiAno(dDataRelat);
  iNumDiasMes  := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(iAno,iMes));
  iDiaRelat    := DiasUteis.ExtraiDia(dDataRelat);
  iPeriodo     := iMes;
  iExercicio   := iAno;
  TestaPeriodo(false,'BaseDados',DateToStr(dDataRelat),IntToStr(Sistema.idModulo),iExercicio,
               iPeriodo,iEmpresaProp,sMens);
  result := CalculaSaldoAcum(idElemento, Sistema.IdEmpresa, iPeriodo, iExercicio, DateToStr(dDataRelatIni), DateToStr(dDataRelat));
  if (sFlgRateio = 'S') and
     (iNumDiasMes * iDiaRelat > 0) then
    result := (result / iNumDiasMes) * iDiaRelat;
end;

function TdtmFlashRpt.CalculaAcumConta(qry : TwwQuery; idEmpresa, iPeriodo, iExercicio : Integer; sDataRelatIni, sDataRelatFim: string) : Double;
var sSql : string;
begin
  result := 0;
  sSql :=        'SELECT SUM(DECODE(L.LACDEBCRE,'+#39+'C'+#39+',L.LACVALOR,L.LACVALOR*-1)) AS SALDOREA ';
  sSql := sSql + 'FROM PLANILHA P, LANCAMENTO L                                                        ';
  sSql := sSql + 'WHERE (L.PLACONTA LIKE '+#39+qry.FieldByName('PLACONTA').AsString+'%'+#39+')';
  sSql := sSql + '  AND (P.IDPESSOA = '+IntToStr(IdEmpresa)+')                                 ';
  sSql := sSql + '  AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+')                                    ';
  sSql := sSql + '  AND (P.PERNUMERO  = '+IntToStr(iPeriodo)+')                                        ';
  if not qry.FieldByName('CODCENTROCUSTO').isNull then begin
     sSql := sSql + '   AND (L.CODCENTROCUSTO LIKE '+#39+qry.FieldByName('CODCENTROCUSTO').AsString+'%'+#39+') ';
  end;
  if not qry.FieldByName('UNIDNEGOC').isNull then begin
     sSql := sSql + '   AND (L.UNIDNEGOC = '+qry.FieldByName('UNIDNEGOC').AsString+') ';
  end;
  if not qry.FieldByName('IDPATRO').isNull then begin
     sSql := sSql + '   AND (L.IDPATRO = '+qry.FieldByName('IDPATRO').AsString+') ';
  end;
  if not qry.FieldByName('IDPLANOPREV').isNull then begin
     sSql := sSql + '   AND (L.IDPLANOPREV = '+qry.FieldByName('IDPLANOPREV').AsString+') ';
  end;
  if not qry.FieldByName('CODSUBCONTA').isNull then begin
     sSql := sSql + '   AND (L.CODSUBCONTA = '+qry.FieldByName('CODSUBCONTA').AsString+') ';
  end;
  sSql := sSql + '   AND (P.PLNDATDIA >= TO_DATE('+#39+sDataRelatIni+#39+','+#39+'DD/MM/YYYY'+#39+'))  ';
  sSql := sSql + '   AND (P.PLNDATDIA <= TO_DATE('+#39+sDataRelatFim+#39+','+#39+'DD/MM/YYYY'+#39+'))  ';
  sSql := sSql + '   AND (L.PLNCODIGO = P.PLNCODIGO) ';
  if FazQuery(qrySaldos,sSql) then
     result := qrySaldos.FieldByName('SALDOREA').AsFloat;
  qrySaldos.Close;
end;

function TdtmFlashRpt.CalculaSaldoAcum(idElemento : Double; idEmpresa, iPeriodo, iExercicio :Integer;
                                       sDataRelatIni, sDataRelatFim : String) : Double;
var rSaldo, rSaldoCalc : Double;
    qry : TwwQuery;
    Operacao : char;
begin
  rSaldo := 0;
  //
  qry := TwwQuery.Create(Self);
  qry.DatabaseName := 'BaseDados';
  //
  qry.Close;
  qry.Sql.Text := sSqlCompConta;
  qry.ParamByName('IELEMDEMO').AsFloat := idElemento; //Passar a linha gravada na tabela.
  qry.Open;
  qry.First;

  while not qry.EOF do
  begin
     //Ano Atual Periodo Realizado
    if qry.FieldByName('ELETIPOELEM').AsString = 'C' then
      rSaldo := rSaldo + CalculaAcumConta(qry,IdEmpresa,iPeriodo,iExercicio,sDataRelatIni,sDataRelatFim)
    else
    begin
      rSaldoCalc := CalculaSaldoAcum(qry.FieldByName('ELEMENTODEM').AsInteger, IdEmpresa, iPeriodo, iExercicio, sDataRelatIni, sDataRelatFim);
      if qry.FieldByName('FLGOPERACAO').AsString <> '' then
        Operacao := qry.FieldByName('FLGOPERACAO').AsString[1]
      else Operacao := 'S';
      case Operacao of
        'D' : if rSaldoCalc > 0 then rSaldo := rSaldo / rSaldoCalc;
        'M' : rSaldo := rSaldo * rSaldoCalc;
        'S' : rSaldo := rSaldo + rSaldoCalc;
        'U' : rSaldo := rSaldo - rSaldoCalc;
      end;
    end;
    qry.Next;
  end;

  qry.Close;
  qry.Free;
  
  result := rSaldo;
end;

procedure TdtmFlashRpt.qryEstatHotelCalcFields(DataSet: TDataSet);
begin
  inherited;
  if DataSet.State <> dsInactive then
  begin
    // Sellable Rooms Hoje
    DataSet.FieldByName('QTDESELLABLEROOMSHOJE').AsFloat :=
      DataSet.FieldByName('TOTALUHSHOJE').AsFloat      -
      DataSet.FieldByName('QTDEBLOQUEADOHOJE').AsFloat -
      DataSet.FieldByName('QTDEUSOCASAHOJE').AsFloat;

    // Sellable Rooms Acumulado
    DataSet.FieldByName('QTDESELLABLEROOMS').AsFloat :=
      DataSet.FieldByName('TOTALUHS').AsFloat      -
      DataSet.FieldByName('QTDEBLOQUEADO').AsFloat -
      DataSet.FieldByName('QTDEUSOCASA').AsFloat;

    // Occupied Rooms Paid Hoje
    DataSet.FieldByName('QTDEROOMSPAIDHOJE').AsFloat :=
      DataSet.FieldByName('QTDEOCUPADOHOJE').AsFloat    -
      DataSet.FieldByName('QTDEUHCORTESIAHOJE').AsFloat -
      DataSet.FieldByName('QTDEUSOCASAHOJE').AsFloat;

    // Occupied Rooms Paid Acumulado
    DataSet.FieldByName('QTDEROOMSPAID').AsFloat :=
      DataSet.FieldByName('QTDEOCUPADO').AsFloat    -
      DataSet.FieldByName('QTDEUHCORTESIA').AsFloat -
      DataSet.FieldByName('QTDEUSOCASA').AsFloat;

    // Total Occupied Rooms Hoje
    DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat :=
      DataSet.FieldByName('QTDEROOMSPAIDHOJE').AsFloat +
      DataSet.FieldByName('QTDEUHCORTESIAHOJE').AsFloat;

    // Total Occupied Rooms Acumulado
    DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat :=
      DataSet.FieldByName('QTDEROOMSPAID').AsFloat +
      DataSet.FieldByName('QTDEUHCORTESIA').AsFloat;

    // % of Occupancy Hoje
    if DataSet.FieldByName('TOTALUHSHOJE').AsFloat > 0 then
      DataSet.FieldByName('PERCOCCUPANCYHOJE').AsFloat := 100 *
        (DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat /
        DataSet.FieldByName('TOTALUHSHOJE').AsFloat)
    else DataSet.FieldByName('PERCOCCUPANCYHOJE').AsFloat := 0;

    // % of Occupancy Acumulado
    if DataSet.FieldByName('TOTALUHS').AsFloat > 0 then
      DataSet.FieldByName('PERCOCCUPANCY').AsFloat := 100 *
        (DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat /
        DataSet.FieldByName('TOTALUHS').AsFloat)
    else DataSet.FieldByName('PERCOCCUPANCY').AsFloat := 0;

    // Group Business - Room Nigths Contribution % Hoje
    if DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat > 0 then
      DataSet.FieldByName('GROUPRNCHOJE').AsFloat := 100 *
        (DataSet.FieldByName('QTDEUHGRPHOJE').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat)
    else DataSet.FieldByName('GROUPRNCHOJE').AsFloat := 0; 

    // Group Business - Room Nigths Contribution % Acumulado
    if DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat > 0 then
      DataSet.FieldByName('GROUPRNC').AsFloat := 100 *
        (DataSet.FieldByName('QTDEUHGRP').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat)
    else DataSet.FieldByName('GROUPRNC').AsFloat := 0;

    // ADR for Group Business Hoje
    if DataSet.FieldByName('QTDEUHGRPHOJE').AsFloat > 0 then
      DataSet.FieldByName('GROUPADRHOJE').AsFloat :=
        (qryRoomsDI.FieldByName('HOJELIQGRP').AsFloat /
         DataSet.FieldByName('QTDEUHGRPHOJE').AsFloat)
    else DataSet.FieldByName('GROUPADRHOJE').AsFloat := 0;

    // ADR for Group Business Acumulado
    if DataSet.FieldByName('QTDEUHGRP').AsFloat > 0 then
      DataSet.FieldByName('GROUPADR').AsFloat :=
        (qryRoomsDI.FieldByName('ACUMLIQGRP').AsFloat /
         DataSet.FieldByName('QTDEUHGRP').AsFloat)
    else DataSet.FieldByName('GROUPADR').AsFloat := 0;

    // Transient Business - Room Nights Contribution % Hoje
    if DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat > 0 then
      DataSet.FieldByName('TRANSIENTRNCHOJE').AsFloat := 100 *
        (DataSet.FieldByName('QTDEUHINDHOJE').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat)
    else DataSet.FieldByName('TRANSIENTRNCHOJE').AsFloat := 0;

    // Transient Business - Room Nights Contribution % Acumulado
    if DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat > 0 then
      DataSet.FieldByName('TRANSIENTRNC').AsFloat := 100 *
        (DataSet.FieldByName('QTDEUHIND').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat)
    else DataSet.FieldByName('TRANSIENTRNC').AsFloat := 0;

    // ADR for Transient Business Hoje
    if DataSet.FieldByName('QTDEUHINDHOJE').AsFloat > 0 then
      DataSet.FieldByName('TRANSIENTADRHOJE').AsFloat :=
        (qryRoomsDI.FieldByName('HOJELIQIND').AsFloat /
        DataSet.FieldByName('QTDEUHINDHOJE').AsFloat)
    else DataSet.FieldByName('TRANSIENTADRHOJE').AsFloat := 0;

    // ADR for Transient Business Acumulado
    if DataSet.FieldByName('QTDEUHIND').AsFloat > 0 then
      DataSet.FieldByName('TRANSIENTADR').AsFloat :=
        (qryRoomsDI.FieldByName('ACUMLIQIND').AsFloat /
         DataSet.FieldByName('QTDEUHIND').AsFloat)
    else DataSet.FieldByName('TRANSIENTADR').AsFloat := 0;

    // Repeat Guest - Room Nights Contribution Hoje
    if DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat > 0 then
      DataSet.FieldByName('REPEATGUESTRNCHOJE').AsFloat := 100 *
        (DataSet.FieldByName('QTDEHOSPEDEREPETEHOJE').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat)
    else DataSet.FieldByName('REPEATGUESTRNCHOJE').AsFloat := 0;

    // Repeat Guest - Room Nights Contribution Acumulado
    if DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat > 0 then
      DataSet.FieldByName('REPEATGUESTRNC').AsFloat := 100 *
        (DataSet.FieldByName('QTDEHOSPEDEREPETE').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat)
    else DataSet.FieldByName('REPEATGUESTRNC').AsFloat := 0;

    // Choice RS - Room Nigths Contribution % Hoje
    if DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat > 0 then
      DataSet.FieldByName('CHOICERSRNCHOJE').AsFloat := 100 *
        (DataSet.FieldByName('CHOICERSHOJE').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat)
    else DataSet.FieldByName('CHOICERSRNCHOJE').AsFloat := 0;

    // Choice RS - Room Nigths Contribution % Acumulado
    if DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat > 0 then
      DataSet.FieldByName('CHOICERSRNC').AsFloat := 100 *
        (DataSet.FieldByName('CHOICERS').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat)
    else DataSet.FieldByName('CHOICERSRNC').AsFloat := 0;

    // Stay Overs - Room Nigths Contribution % Hoje
    if DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat > 0 then
      DataSet.FieldByName('STAYOVERSRNCHOJE').AsFloat := 100 *
        (DataSet.FieldByName('QTDEEXTENSOESHOJE').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat)
    else DataSet.FieldByName('STAYOVERSRNCHOJE').AsFloat := 0;

    // Stay Overs - Room Nigths Contribution % Acumulado
    if DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat > 0 then
      DataSet.FieldByName('STAYOVERSRNC').AsFloat := 100 *
        (DataSet.FieldByName('QTDEEXTENSOES').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat)
    else DataSet.FieldByName('STAYOVERSRNC').AsFloat := 0;

    // Early Departures - Lost Room Nigths Contribution % Hoje
    if DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat > 0 then
      DataSet.FieldByName('EARLYDEPLRNCHOJE').AsFloat := 100 *
        (DataSet.FieldByName('QTDESAIANTECIPADAHOJE').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat)
    else DataSet.FieldByName('EARLYDEPLRNCHOJE').AsFloat := 0;

    // Early Departures - Lost Room Nigths Contribution % Acumulado
    if DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat > 0 then
      DataSet.FieldByName('EARLYDEPLRNC').AsFloat := 100 *
        (DataSet.FieldByName('QTDESAIANTECIPADA').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat)
    else DataSet.FieldByName('EARLYDEPLRNC').AsFloat := 0;

    // Same Day Reservations - Room Nights Contribution % Hoje
    if DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat > 0 then
      DataSet.FieldByName('PICKUPRNCHOJE').AsFloat := 100 *
        (DataSet.FieldByName('QTDEPICKUPHOJE').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat)
    else DataSet.FieldByName('PICKUPRNCHOJE').AsFloat := 0;

    // Same Day Reservations - Room Nights Contribution % Acumulado
    if DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat > 0 then
      DataSet.FieldByName('PICKUPRNC').AsFloat := 100 *
        (DataSet.FieldByName('QTDEPICKUP').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat)
    else DataSet.FieldByName('PICKUPRNC').AsFloat := 0;

    // Walk-ins - Room Nights Contribution % Hoje
    if DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat > 0 then
      DataSet.FieldByName('UHWALKINRNCHOJE').AsFloat := 100 *
        (DataSet.FieldByName('QTDEUHWALKINHOJE').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat)
    else DataSet.FieldByName('UHWALKINRNCHOJE').AsFloat := 0;

    // Walk-ins - Room Nights Contribution % Acumulado
    if DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat > 0 then
      DataSet.FieldByName('UHWALKINRNC').AsFloat := 100 *
        (DataSet.FieldByName('QTDEUHWALKIN').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat)
    else DataSet.FieldByName('UHWALKINRNC').AsFloat := 0;

    // No-Show - Lost Room Nights Contribution % Hoje
    if DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat > 0 then
      DataSet.FieldByName('NOSHOWLRNCHOJE').AsFloat := 100 *
        (DataSet.FieldByName('QTDEUHNOSHOWCOBHOJE').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat)
    else DataSet.FieldByName('NOSHOWLRNCHOJE').AsFloat := 0;

    // No-Show - Lost Room Nights Contribution % Acumulado
    if DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat > 0 then
      DataSet.FieldByName('NOSHOWLRNC').AsFloat := 100 *
        (DataSet.FieldByName('QTDEUHNOSHOWCOB').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat)
    else DataSet.FieldByName('NOSHOWLRNC').AsFloat := 0;

    // Guests per Occupied Room Hoje
    if DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat > 0 then
      DataSet.FieldByName('GUESTPEROCPROOMHOJE').AsFloat :=
        (DataSet.FieldByName('QTDHOSPEDESHOJE').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat)
    else DataSet.FieldByName('GUESTPEROCPROOMHOJE').AsFloat := 0;

    // Guests per Occupied Room Acumulado
    if DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat > 0 then
      DataSet.FieldByName('GUESTPEROCPROOM').AsFloat := 
        (DataSet.FieldByName('QTDHOSPEDES').AsFloat /
         DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat)
    else DataSet.FieldByName('GUESTPEROCPROOM').AsFloat := 0;

    // Average Length of Stay Hoje
    if DataSet.FieldByName('QTDECHEGADASHOJE').AsFloat > 0 then
      DataSet.FieldByName('AVGLENGTHSTAYHOJE').AsFloat := 
        (DataSet.FieldByName('QTDEOCCUPIEDROOMSHOJE').AsFloat /
         DataSet.FieldByName('QTDECHEGADASHOJE').AsFloat)
    else DataSet.FieldByName('AVGLENGTHSTAYHOJE').AsFloat := 0;

    // Average Length of Stay Acumulado
    if DataSet.FieldByName('QTDECHEGADAS').AsFloat > 0 then
      DataSet.FieldByName('AVGLENGTHSTAY').AsFloat :=
        (DataSet.FieldByName('QTDEOCCUPIEDROOMS').AsFloat /
         DataSet.FieldByName('QTDECHEGADAS').AsFloat)
    else DataSet.FieldByName('AVGLENGTHSTAY').AsFloat := 0;

  end;
end;

procedure TdtmFlashRpt.qryDatasCalcFields(DataSet: TDataSet);
var
//    Tentativas,
    AConfGrp, ConfGrp,
    Allotment, QtdResAllotment,
    QtdResAbateAllot,
    AConfInd,ConfInd, TotalAConf,
    TotalConf, Cortesias, UsoCasa,
    Permuta, TotalGeral,
//  Disponivel,
    qtdUH, TotalInd,
    Adultos,Criancas : integer;
//    , qtdBloq: integer;
    PercOcupacao: single;
    DiMedia, RoomRevPar : Currency;
begin
  inherited;
//  Tentativas      := 0;
  AConfGrp        := 0;
  ConfGrp         := 0;
  QtdResAllotment := 0;
  AConfInd        := 0;
  ConfInd         := 0;
  Cortesias       := 0;
  UsoCasa         := 0;
  Permuta         := 0;
  Adultos         := 0;
  Criancas        := 0;
  DiMedia         := 0;
  RoomRevPar      := 0;
//  qtdBloq         := 0;
  QtdResAbateAllot:= 0;

  if qryOcupacaoGrp.Locate('DATA',qryDatas.FieldByName('DATA').AsDateTime,[]) then
  begin
//    Tentativas := qryOcupacaoGrp.FieldByName('QTDTENTATIVA').AsInteger;
    AConfGrp   := qryOcupacaoGrp.FieldByName('QTDNAOGARANT').AsInteger;
    ConfGrp    := qryOcupacaoGrp.FieldByName('QTDGARANT').AsInteger;
    Cortesias  := qryOcupacaoGrp.FieldByName('QTDCORTESIA').AsInteger;
    UsoCasa    := qryOcupacaoGrp.FieldByName('QTDUSOCASA').AsInteger;
    Permuta    := qryOcupacaoGrp.FieldByName('QTDPERMUTAS').AsInteger;
    Adultos    := qryOcupacaoGrp.FieldByName('QTDADULTOS').AsInteger;
    Criancas   := qryOcupacaoGrp.FieldByName('QTDCRIANCAS').AsInteger;
  end;

  if qryOcupacao.Locate('DATA',qryDatas.FieldByName('DATA').AsDateTime,[]) then
  begin
    QtdResAllotment := qryOcupacao.FieldByName('QTDALLOTMENTS').AsInteger;
    QtdResAbateAllot:= qryOcupacao.FieldByName('QTDABATESALDOALLOT').AsInteger;
    AConfInd        := qryOcupacao.FieldByName('QTDNAOGARANT').AsInteger;
    ConfInd         := qryOcupacao.FieldByName('QTDGARANT').AsInteger;
    Cortesias       := Cortesias + qryOcupacao.FieldByName('QTDCORTESIA').AsInteger;
    UsoCasa         := UsoCasa + qryOcupacao.FieldByName('QTDUSOCASA').AsInteger;
    Permuta         := Permuta + qryOcupacao.FieldByName('QTDPERMUTAS').AsInteger;
    Adultos         := Adultos  + qryOcupacao.FieldByName('QTDADULTOS').AsInteger;
    Criancas        := Criancas + qryOcupacao.FieldByName('QTDCRIANCAS').AsInteger;
  end;

  if qryCalResGrpTipoAllot.Locate('DATA',qryDatas.FieldByName('DATA').AsDateTime,[]) then
  begin
    QtdResAllotment := QtdResAllotment + qryCalResGrpTipoAllot.FieldByName('QTDALLOTMENTS').AsInteger;
    QtdResAbateAllot:= QtdResAbateAllot + qryCalResGrpTipoAllot.FieldByName('QTDABATESALDOALLOT').AsInteger;
  end;

  Allotment := 0;
  if qryQtdContrAllot.Locate('DATA',qryDatas.FieldByName('DATA').AsDateTime,[]) then
  begin
    Allotment := qryQtdContrAllot.FieldByName('QTDALLOT').AsInteger;
    if qryAtuAllot.Locate('DATA',qryDatas.FieldByName('DATA').AsDateTime,[]) then
      Allotment := Allotment + qryAtuAllot.FieldByName('QTDTIRAL').AsInteger;
    Allotment := Allotment - QtdResAbateAllot;
  end;

//  if qryBloq.Locate('DATA',qryDatas.FieldByName('DATA').AsDateTime,[]) then
//    qtdBloq := qryBloq.FieldByName('QTDBLOQ').AsInteger;

  qtdUH := qryQtdUHNPF.FieldByName('QTD').AsInteger;
  if qryqtdUHPF.Locate('DATA',qryDatas.FieldByName('DATA').AsDateTime,[]) then
    qtdUh := qtdUH + qryqtdUHPF.FieldByName('QTD').AsInteger;

  TotalAConf      := AConfGrp + AConfInd + Allotment;
  TotalConf       := QtdResAllotment + ConfGrp + ConfInd + Cortesias + UsoCasa + Permuta;
  TotalGeral      := TotalAConf + TotalConf;
  TotalInd        := AConfInd + QtdResAllotment + ConfInd + Cortesias + UsoCasa + Permuta;

  if qtdUH > 0 then PercOcupacao := TotalGeral / qtdUH
  else PercOcupacao := 0;

  if qryReceitas.Locate('DATA',qryDatas.FieldByName('DATA').AsDateTime,[]) then
  begin
    if TotalGeral > 0 then
      DiMedia := qryReceitas.FieldByName('RECEITA').AsCurrency / TotalInd;
    if qtdUH > 0 then
      RoomRevPar := qryReceitas.FieldByName('RECEITA').AsCurrency / qtdUH;
  end;
  
  qryDatas.FieldByName('TOTOCPROOMS').AsInteger := TotalGeral - UsoCasa;
  qryDatas.FieldByName('PERCOCCUP').AsFloat := PercOcupacao*100;
  qryDatas.FieldByName('CORTESIA').AsInteger := Cortesias;
  qryDatas.FieldByName('USOCASA').AsInteger := UsoCasa;
  qryDatas.FieldByName('TOTALGERAL').AsInteger := TotalGeral;
  qryDatas.FieldByName('TOTGUESTS').AsInteger := Adultos + Criancas;
  qryDatas.FieldByName('AVGDAILYRATE').AsCurrency := DiMedia;
  qryDatas.FieldByName('ROOMREVPAR').AsCurrency := RoomRevPar;
  qryDatas.FieldByName('TOTALUHS').AsInteger := qtdUH;
  
  // Demand Tag
  if (PercOcupacao < 0.5) then qryDatas.FieldByName('DEMANDTAG').AsString := 'C'
  else
    if (PercOcupacao > 0.75) then qryDatas.FieldByName('DEMANDTAG').AsString := 'A'
    else qryDatas.FieldByName('DEMANDTAG').AsString := 'B';
end;

procedure TdtmFlashRpt.qryFoodStatsCalcFields(DataSet: TDataSet);
begin
  inherited;
  if DataSet.State <> dsInactive then
  begin
    // Qtde Couvert Hoje
    DataSet.FieldByName('QTDECOUVERTHOJE').AsInteger := qryCouvert.FieldByName('QTDECOUVERTHOJE').AsInteger;

    // Qtde Couvert Acumulado
    DataSet.FieldByName('QTDECOUVERTACUM').AsInteger := qryCouvert.FieldByName('QTDECOUVERTACUM').AsInteger;

    // Average Check Hoje
    if DataSet.FieldByName('QTDECOUVERTHOJE').AsInteger > 0 then
      DataSet.FieldByName('AVGCHECKHOJE').AsCurrency :=
       (DataSet.FieldByName('HOJELIQUIDO').AsCurrency /
        DataSet.FieldByName('QTDECOUVERTHOJE').AsInteger)
    else DataSet.FieldByName('AVGCHECKHOJE').AsCurrency := 0;
    // Average Check Acumulado
    if DataSet.FieldByName('QTDECOUVERTACUM').AsInteger > 0 then
      DataSet.FieldByName('AVGCHECK').AsCurrency :=
       (DataSet.FieldByName('ACUMLIQUIDO').AsCurrency /
        DataSet.FieldByName('QTDECOUVERTACUM').AsInteger)
    else DataSet.FieldByName('AVGCHECK').AsCurrency := 0;
  end;
end;

procedure TdtmFlashRpt.lblDataSistema1Print(Sender: TObject);
begin
  inherited;
  TppLabel(Sender).Text := FormatDateTime('dd/mm/yyyy', dDataRelat);
end;

procedure TdtmFlashRpt.ppFlashRptSummaryBand4BeforePrint(Sender: TObject);
begin
  inherited;
  ppRptComments.Lines.Clear;
  if sComments <> '' then
    ppRptComments.Lines.Text := sComments;
end;

procedure TdtmFlashRpt.qrySumarioFlashCalcFields(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    if qrySumarioImpostos.Locate('IDTIPODEBCRED',FieldByName('IDTIPODEBCRED').AsFloat,[]) then
    begin
      FieldByName('TOTALDIAIMPOSTOS').AsCurrency := qrySumarioImpostos.FieldByName('IMPOSTODIA').AsCurrency;
      FieldByName('TOTALMESIMPOSTOS').AsCurrency := qrySumarioImpostos.FieldByName('IMPOSTOSMES').AsCurrency;
      FieldByName('TOTALDIALIQUIDO').AsCurrency  := FieldByName('TOTALDIA').AsCurrency - qrySumarioImpostos.FieldByName('IMPOSTODIA').AsCurrency;
      FieldByName('TOTALMESLIQUIDO').AsCurrency  := FieldByName('TOTALMES').AsCurrency - qrySumarioImpostos.FieldByName('IMPOSTOSMES').AsCurrency;
    end;
  end;
end;

procedure TdtmFlashRpt.ppFlashRptDBText103Format(Sender: TObject;
  DisplayFormat: String; DataType: TppDataType; Value: Variant;
  var Text: String);
begin
  inherited;
  Value := 100*Value;
  Text := FormatFloat('0.00%',Value);
end;

end.
