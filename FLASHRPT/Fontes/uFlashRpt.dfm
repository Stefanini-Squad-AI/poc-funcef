inherited dtmFlashRpt: TdtmFlashRpt
  Left = 97
  Top = 139
  Width = 662
  Height = 429
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 141
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  inherited dsExemplo: TwwDataSource
    Left = 79
  end
  inherited qryExemplo: TwwQuery
    Left = 18
  end
  inherited rpExemplo: TppReport
    Left = 202
  end
  object pplFlashRpt: TppBDEPipeline
    DataSource = dsFlashRpt
    UserName = 'lFlashRpt'
    Left = 141
    Top = 72
  end
  object dsFlashRpt: TwwDataSource
    DataSet = qryFlashRpt
    Left = 79
    Top = 72
  end
  object qryFlashRpt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHOTEL, IDORIGEMPADRAO, IDTIPODCPENSAREST,'
      
        'IDTIPODCCAFEREST, IDCARGOARRUMADEIR, IDTIPODCISS, IDTIPODCCARTAO' +
        ','
      'IDTIPODCCAFE, IDTIPODCDAYUSE, IDTIPODCPENSAO, CODCATEGTARBALCAO,'
      'IDTIPODCDIARIA, MOEDANACIONAL, IDGRUPODCCREDITO, IDTIPODCNOSHOW,'
      
        'IDTIPODCLCHECKOUT, MOEDADOLAR, IDTIPODCTXSERVICO, IDTIPODCCHEQUE' +
        ','
      'MASCSEGMENTO, IDTIPODCDINHEIRO, IDMEIOPADRAO, IDTIPODCDEPOSITO,'
      
        'IDTIPODCDESCDIARIA, CODSEGPADRAO, IDSTATUSUHVG, IDTIPODCAFATURAR' +
        ','
      
        'IDTIPODCDIFDIARIA, IDSTATUSUHOC, IDSTATUSGOVSUJO, IDTIPODCDEVDEP' +
        ','
      
        'IDTIPODCREFAMANHA, IDSTATUSGOVLIMPO, IDTIPODCTELEFONE, IDTIPODCR' +
        'EFONTEM,'
      
        'IDVEICULOPADRAO, TXSERVICO, IDTIPODCOUTROSREQ, IDTIPODCTXTURISMO' +
        ','
      'PERCIMPDIARIAS, MASCTIPOENXOV, IDTIPODCCHEGANTEC, CRI1_COMO_ADT,'
      
        'CRI2_COMO_ADT, POSSUE_CRI1, POSSUE_CRI2, HOTELFLAT, IDSTATUSUHBL' +
        'OQ,'
      
        'DATASISTEMA, IDADEMAXCRI1, IDADEMAXCRI2, HORACHECKIN, HORACHECKO' +
        'UT,'
      
        'TAXAPORLANC, IMPOSTOPORLANC, PERCISS, TIPOPENSPADRAO, NUMMAXDIAS' +
        'RSV,'
      
        'PASSOAUDITORIA, IMPNOTASALDIFZERO, LANCARDICHECKIN, CONTABINTEGR' +
        'ADO,'
      
        'USAYIELDMANAG, ABRECONTAACOMP, INTEGRATELEFONIA, CARTAOIDENTIFIC' +
        'A,'
      
        'TXEXPRLAVANDERIA, NUMDIASDELPOSCO, CAFEEMDIMEDIA, COEMDIMEDIATXO' +
        'C,'
      'ARREDONDAMENTODI, PDVINTEGRADO, NUMDIASCONFRES, NUMDIASDELRELAT,'
      
        'INCNUMNOTAFOLHA, VALMINCONSCHTEF, NUMMAXDIASREABCTA, NUMMAXCONTA' +
        'SPEND,'
      
        'LANCARDILIQUIDA, DIRIMAGENS, RELSUMARIODEBCRED, RELCHECKIN, RELP' +
        'REVOCUPACAO,'
      
        'RELDEMONSTOCUP, RELSITUACAOUH, RELHOSPEDENACASA, RELCHECKOUT, RE' +
        'LEXTENSOES,'
      
        'RELSALDOHOSPEDE, RELBORDERODEBCRED, RELRECEBPAG, RELNOTAEMITANAL' +
        'IT,'
      
        'RELNOTAEMITSINTET, RELESTORNOEDESC, RELLANCTRANSF, RELSALDOCONTA' +
        'S,'
      
        'RELHOSPEDEEMCURSO, RELRDS, RELESTPERNOITE, RELESTPROCEDENC, RELR' +
        'ESUMGERALATIV,'
      
        'NUMMAXANTRSV, TRGDTINCLUSAO, TRGUSERINCLUSAO, GAMEONDEMAND, VIDE' +
        'OONDEMAND,'
      
        'IDUSUARIOPDV, CABECALHOSLIP, IDTIPODCGORJETA, RODAPESLIP, CADAST' +
        'RACRI2,'
      
        'CADASTRACRI1, USATENTATIVRES, DIRRELAUDITORIA, MODELOSLIP, POLCA' +
        'NCRESERVA,'
      
        'POLCANCRESERVAING, DIRCOVERPAGE, POLNOSHOWRESING, POLNOSHOWRES, ' +
        'VLRCAFEPADRAO,'
      
        'TIPOCONTAGEMCAFE, MOEDACAFE, IDCONTAPENSAO, PROXNUMERONOTA, ACEI' +
        'TARESFPOOL,'
      
        'IDORIGEMCENTRES, IDDOCCENTRES, CODSEGCENTRES, IDVEICULOSCENTRES,' +
        ' IDMEIOCENTRES,'
      'IDMOTIVOCENTRES, UCEMDIMEDIATXOC, IDTIPODCTELDDD, IDTIPODCTELDDI'
      'FROM PARAMHOTEL'
      'WHERE IDHOTEL = :IDHOTEL')
    ValidateWithMask = True
    Left = 18
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryFlashRptIDHOTEL: TFloatField
      FieldName = 'IDHOTEL'
    end
    object qryFlashRptIDORIGEMPADRAO: TFloatField
      FieldName = 'IDORIGEMPADRAO'
    end
    object qryFlashRptIDTIPODCPENSAREST: TFloatField
      FieldName = 'IDTIPODCPENSAREST'
    end
    object qryFlashRptIDTIPODCCAFEREST: TFloatField
      FieldName = 'IDTIPODCCAFEREST'
    end
    object qryFlashRptIDCARGOARRUMADEIR: TFloatField
      FieldName = 'IDCARGOARRUMADEIR'
    end
    object qryFlashRptIDTIPODCISS: TFloatField
      FieldName = 'IDTIPODCISS'
    end
    object qryFlashRptIDTIPODCCARTAO: TFloatField
      FieldName = 'IDTIPODCCARTAO'
    end
    object qryFlashRptIDTIPODCCAFE: TFloatField
      FieldName = 'IDTIPODCCAFE'
    end
    object qryFlashRptIDTIPODCDAYUSE: TFloatField
      FieldName = 'IDTIPODCDAYUSE'
    end
    object qryFlashRptIDTIPODCPENSAO: TFloatField
      FieldName = 'IDTIPODCPENSAO'
    end
    object qryFlashRptCODCATEGTARBALCAO: TStringField
      FieldName = 'CODCATEGTARBALCAO'
    end
    object qryFlashRptIDTIPODCDIARIA: TFloatField
      FieldName = 'IDTIPODCDIARIA'
    end
    object qryFlashRptMOEDANACIONAL: TFloatField
      FieldName = 'MOEDANACIONAL'
    end
    object qryFlashRptIDGRUPODCCREDITO: TFloatField
      FieldName = 'IDGRUPODCCREDITO'
    end
    object qryFlashRptIDTIPODCNOSHOW: TFloatField
      FieldName = 'IDTIPODCNOSHOW'
    end
    object qryFlashRptIDTIPODCLCHECKOUT: TFloatField
      FieldName = 'IDTIPODCLCHECKOUT'
    end
    object qryFlashRptMOEDADOLAR: TFloatField
      FieldName = 'MOEDADOLAR'
    end
    object qryFlashRptIDTIPODCTXSERVICO: TFloatField
      FieldName = 'IDTIPODCTXSERVICO'
    end
    object qryFlashRptIDTIPODCCHEQUE: TFloatField
      FieldName = 'IDTIPODCCHEQUE'
    end
    object qryFlashRptMASCSEGMENTO: TStringField
      FieldName = 'MASCSEGMENTO'
    end
    object qryFlashRptIDTIPODCDINHEIRO: TFloatField
      FieldName = 'IDTIPODCDINHEIRO'
    end
    object qryFlashRptIDMEIOPADRAO: TFloatField
      FieldName = 'IDMEIOPADRAO'
    end
    object qryFlashRptIDTIPODCDEPOSITO: TFloatField
      FieldName = 'IDTIPODCDEPOSITO'
    end
    object qryFlashRptIDTIPODCDESCDIARIA: TFloatField
      FieldName = 'IDTIPODCDESCDIARIA'
    end
    object qryFlashRptCODSEGPADRAO: TStringField
      FieldName = 'CODSEGPADRAO'
      Size = 10
    end
    object qryFlashRptIDSTATUSUHVG: TFloatField
      FieldName = 'IDSTATUSUHVG'
    end
    object qryFlashRptIDTIPODCAFATURAR: TFloatField
      FieldName = 'IDTIPODCAFATURAR'
    end
    object qryFlashRptIDTIPODCDIFDIARIA: TFloatField
      FieldName = 'IDTIPODCDIFDIARIA'
    end
    object qryFlashRptIDSTATUSUHOC: TFloatField
      FieldName = 'IDSTATUSUHOC'
    end
    object qryFlashRptIDSTATUSGOVSUJO: TFloatField
      FieldName = 'IDSTATUSGOVSUJO'
    end
    object qryFlashRptIDTIPODCDEVDEP: TFloatField
      FieldName = 'IDTIPODCDEVDEP'
    end
    object qryFlashRptIDTIPODCREFAMANHA: TFloatField
      FieldName = 'IDTIPODCREFAMANHA'
    end
    object qryFlashRptIDSTATUSGOVLIMPO: TFloatField
      FieldName = 'IDSTATUSGOVLIMPO'
    end
    object qryFlashRptIDTIPODCTELEFONE: TFloatField
      FieldName = 'IDTIPODCTELEFONE'
    end
    object qryFlashRptIDTIPODCREFONTEM: TFloatField
      FieldName = 'IDTIPODCREFONTEM'
    end
    object qryFlashRptIDVEICULOPADRAO: TFloatField
      FieldName = 'IDVEICULOPADRAO'
    end
    object qryFlashRptTXSERVICO: TFloatField
      FieldName = 'TXSERVICO'
    end
    object qryFlashRptIDTIPODCOUTROSREQ: TFloatField
      FieldName = 'IDTIPODCOUTROSREQ'
    end
    object qryFlashRptIDTIPODCTXTURISMO: TFloatField
      FieldName = 'IDTIPODCTXTURISMO'
    end
    object qryFlashRptPERCIMPDIARIAS: TFloatField
      FieldName = 'PERCIMPDIARIAS'
    end
    object qryFlashRptMASCTIPOENXOV: TStringField
      FieldName = 'MASCTIPOENXOV'
      Size = 10
    end
    object qryFlashRptIDTIPODCCHEGANTEC: TFloatField
      FieldName = 'IDTIPODCCHEGANTEC'
    end
    object qryFlashRptCRI1_COMO_ADT: TStringField
      FieldName = 'CRI1_COMO_ADT'
      Size = 1
    end
    object qryFlashRptCRI2_COMO_ADT: TStringField
      FieldName = 'CRI2_COMO_ADT'
      Size = 1
    end
    object qryFlashRptPOSSUE_CRI1: TStringField
      FieldName = 'POSSUE_CRI1'
      Size = 1
    end
    object qryFlashRptPOSSUE_CRI2: TStringField
      FieldName = 'POSSUE_CRI2'
      Size = 1
    end
    object qryFlashRptHOTELFLAT: TStringField
      FieldName = 'HOTELFLAT'
      Size = 1
    end
    object qryFlashRptIDSTATUSUHBLOQ: TFloatField
      FieldName = 'IDSTATUSUHBLOQ'
    end
    object qryFlashRptDATASISTEMA: TDateTimeField
      FieldName = 'DATASISTEMA'
    end
    object qryFlashRptIDADEMAXCRI1: TFloatField
      FieldName = 'IDADEMAXCRI1'
    end
    object qryFlashRptIDADEMAXCRI2: TFloatField
      FieldName = 'IDADEMAXCRI2'
    end
    object qryFlashRptHORACHECKIN: TDateTimeField
      FieldName = 'HORACHECKIN'
    end
    object qryFlashRptHORACHECKOUT: TDateTimeField
      FieldName = 'HORACHECKOUT'
    end
    object qryFlashRptTAXAPORLANC: TStringField
      FieldName = 'TAXAPORLANC'
      Size = 1
    end
    object qryFlashRptIMPOSTOPORLANC: TStringField
      FieldName = 'IMPOSTOPORLANC'
      Size = 1
    end
    object qryFlashRptPERCISS: TFloatField
      FieldName = 'PERCISS'
    end
    object qryFlashRptTIPOPENSPADRAO: TStringField
      FieldName = 'TIPOPENSPADRAO'
      Size = 1
    end
    object qryFlashRptNUMMAXDIASRSV: TFloatField
      FieldName = 'NUMMAXDIASRSV'
    end
    object qryFlashRptPASSOAUDITORIA: TFloatField
      FieldName = 'PASSOAUDITORIA'
    end
    object qryFlashRptIMPNOTASALDIFZERO: TStringField
      FieldName = 'IMPNOTASALDIFZERO'
      Size = 1
    end
    object qryFlashRptLANCARDICHECKIN: TStringField
      FieldName = 'LANCARDICHECKIN'
      Size = 1
    end
    object qryFlashRptCONTABINTEGRADO: TStringField
      FieldName = 'CONTABINTEGRADO'
      Size = 1
    end
    object qryFlashRptUSAYIELDMANAG: TStringField
      FieldName = 'USAYIELDMANAG'
      Size = 1
    end
    object qryFlashRptABRECONTAACOMP: TStringField
      FieldName = 'ABRECONTAACOMP'
      Size = 1
    end
    object qryFlashRptINTEGRATELEFONIA: TStringField
      FieldName = 'INTEGRATELEFONIA'
      Size = 1
    end
    object qryFlashRptCARTAOIDENTIFICA: TStringField
      FieldName = 'CARTAOIDENTIFICA'
      Size = 1
    end
    object qryFlashRptTXEXPRLAVANDERIA: TFloatField
      FieldName = 'TXEXPRLAVANDERIA'
    end
    object qryFlashRptNUMDIASDELPOSCO: TFloatField
      FieldName = 'NUMDIASDELPOSCO'
    end
    object qryFlashRptCAFEEMDIMEDIA: TStringField
      FieldName = 'CAFEEMDIMEDIA'
      Size = 1
    end
    object qryFlashRptCOEMDIMEDIATXOC: TStringField
      FieldName = 'COEMDIMEDIATXOC'
      Size = 1
    end
    object qryFlashRptARREDONDAMENTODI: TFloatField
      FieldName = 'ARREDONDAMENTODI'
    end
    object qryFlashRptPDVINTEGRADO: TStringField
      FieldName = 'PDVINTEGRADO'
      Size = 1
    end
    object qryFlashRptNUMDIASCONFRES: TFloatField
      FieldName = 'NUMDIASCONFRES'
    end
    object qryFlashRptNUMDIASDELRELAT: TFloatField
      FieldName = 'NUMDIASDELRELAT'
    end
    object qryFlashRptINCNUMNOTAFOLHA: TStringField
      FieldName = 'INCNUMNOTAFOLHA'
      Size = 1
    end
    object qryFlashRptVALMINCONSCHTEF: TFloatField
      FieldName = 'VALMINCONSCHTEF'
    end
    object qryFlashRptNUMMAXDIASREABCTA: TFloatField
      FieldName = 'NUMMAXDIASREABCTA'
    end
    object qryFlashRptNUMMAXCONTASPEND: TFloatField
      FieldName = 'NUMMAXCONTASPEND'
    end
    object qryFlashRptLANCARDILIQUIDA: TStringField
      FieldName = 'LANCARDILIQUIDA'
      Size = 1
    end
    object qryFlashRptDIRIMAGENS: TStringField
      FieldName = 'DIRIMAGENS'
      Size = 255
    end
    object qryFlashRptRELSUMARIODEBCRED: TStringField
      FieldName = 'RELSUMARIODEBCRED'
      Size = 1
    end
    object qryFlashRptRELCHECKIN: TStringField
      FieldName = 'RELCHECKIN'
      Size = 1
    end
    object qryFlashRptRELPREVOCUPACAO: TStringField
      FieldName = 'RELPREVOCUPACAO'
      Size = 1
    end
    object qryFlashRptRELDEMONSTOCUP: TStringField
      FieldName = 'RELDEMONSTOCUP'
      Size = 1
    end
    object qryFlashRptRELSITUACAOUH: TStringField
      FieldName = 'RELSITUACAOUH'
      Size = 1
    end
    object qryFlashRptRELHOSPEDENACASA: TStringField
      FieldName = 'RELHOSPEDENACASA'
      Size = 1
    end
    object qryFlashRptRELCHECKOUT: TStringField
      FieldName = 'RELCHECKOUT'
      Size = 1
    end
    object qryFlashRptRELEXTENSOES: TStringField
      FieldName = 'RELEXTENSOES'
      Size = 1
    end
    object qryFlashRptRELSALDOHOSPEDE: TStringField
      FieldName = 'RELSALDOHOSPEDE'
      Size = 1
    end
    object qryFlashRptRELBORDERODEBCRED: TStringField
      FieldName = 'RELBORDERODEBCRED'
      Size = 1
    end
    object qryFlashRptRELRECEBPAG: TStringField
      FieldName = 'RELRECEBPAG'
      Size = 1
    end
    object qryFlashRptRELNOTAEMITANALIT: TStringField
      FieldName = 'RELNOTAEMITANALIT'
      Size = 1
    end
    object qryFlashRptRELNOTAEMITSINTET: TStringField
      FieldName = 'RELNOTAEMITSINTET'
      Size = 1
    end
    object qryFlashRptRELESTORNOEDESC: TStringField
      FieldName = 'RELESTORNOEDESC'
      Size = 1
    end
    object qryFlashRptRELLANCTRANSF: TStringField
      FieldName = 'RELLANCTRANSF'
      Size = 1
    end
    object qryFlashRptRELSALDOCONTAS: TStringField
      FieldName = 'RELSALDOCONTAS'
      Size = 1
    end
    object qryFlashRptRELHOSPEDEEMCURSO: TStringField
      FieldName = 'RELHOSPEDEEMCURSO'
      Size = 1
    end
    object qryFlashRptRELRDS: TStringField
      FieldName = 'RELRDS'
      Size = 1
    end
    object qryFlashRptRELESTPERNOITE: TStringField
      FieldName = 'RELESTPERNOITE'
      Size = 1
    end
    object qryFlashRptRELESTPROCEDENC: TStringField
      FieldName = 'RELESTPROCEDENC'
      Size = 1
    end
    object qryFlashRptRELRESUMGERALATIV: TStringField
      FieldName = 'RELRESUMGERALATIV'
      Size = 1
    end
    object qryFlashRptNUMMAXANTRSV: TFloatField
      FieldName = 'NUMMAXANTRSV'
    end
    object qryFlashRptTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryFlashRptTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qryFlashRptGAMEONDEMAND: TFloatField
      FieldName = 'GAMEONDEMAND'
    end
    object qryFlashRptVIDEOONDEMAND: TFloatField
      FieldName = 'VIDEOONDEMAND'
    end
    object qryFlashRptIDUSUARIOPDV: TFloatField
      FieldName = 'IDUSUARIOPDV'
    end
    object qryFlashRptCABECALHOSLIP: TMemoField
      FieldName = 'CABECALHOSLIP'
      BlobType = ftMemo
      Size = 400
    end
    object qryFlashRptIDTIPODCGORJETA: TFloatField
      FieldName = 'IDTIPODCGORJETA'
    end
    object qryFlashRptRODAPESLIP: TMemoField
      FieldName = 'RODAPESLIP'
      BlobType = ftMemo
      Size = 2000
    end
    object qryFlashRptCADASTRACRI2: TStringField
      FieldName = 'CADASTRACRI2'
      Size = 1
    end
    object qryFlashRptCADASTRACRI1: TStringField
      FieldName = 'CADASTRACRI1'
      Size = 1
    end
    object qryFlashRptUSATENTATIVRES: TStringField
      FieldName = 'USATENTATIVRES'
      Size = 1
    end
    object qryFlashRptDIRRELAUDITORIA: TStringField
      FieldName = 'DIRRELAUDITORIA'
      Size = 255
    end
    object qryFlashRptMODELOSLIP: TFloatField
      FieldName = 'MODELOSLIP'
    end
    object qryFlashRptPOLCANCRESERVA: TStringField
      FieldName = 'POLCANCRESERVA'
      Size = 60
    end
    object qryFlashRptPOLCANCRESERVAING: TStringField
      FieldName = 'POLCANCRESERVAING'
      Size = 60
    end
    object qryFlashRptDIRCOVERPAGE: TStringField
      FieldName = 'DIRCOVERPAGE'
      Size = 255
    end
    object qryFlashRptPOLNOSHOWRESING: TStringField
      FieldName = 'POLNOSHOWRESING'
      Size = 60
    end
    object qryFlashRptPOLNOSHOWRES: TStringField
      FieldName = 'POLNOSHOWRES'
      Size = 60
    end
    object qryFlashRptVLRCAFEPADRAO: TFloatField
      FieldName = 'VLRCAFEPADRAO'
    end
    object qryFlashRptTIPOCONTAGEMCAFE: TFloatField
      FieldName = 'TIPOCONTAGEMCAFE'
    end
    object qryFlashRptMOEDACAFE: TFloatField
      FieldName = 'MOEDACAFE'
    end
    object qryFlashRptIDCONTAPENSAO: TFloatField
      FieldName = 'IDCONTAPENSAO'
    end
    object qryFlashRptPROXNUMERONOTA: TFloatField
      FieldName = 'PROXNUMERONOTA'
    end
    object qryFlashRptACEITARESFPOOL: TStringField
      FieldName = 'ACEITARESFPOOL'
      Size = 1
    end
    object qryFlashRptIDORIGEMCENTRES: TFloatField
      FieldName = 'IDORIGEMCENTRES'
    end
    object qryFlashRptIDDOCCENTRES: TFloatField
      FieldName = 'IDDOCCENTRES'
    end
    object qryFlashRptCODSEGCENTRES: TStringField
      FieldName = 'CODSEGCENTRES'
      Size = 10
    end
    object qryFlashRptIDVEICULOSCENTRES: TFloatField
      FieldName = 'IDVEICULOSCENTRES'
    end
    object qryFlashRptIDMEIOCENTRES: TFloatField
      FieldName = 'IDMEIOCENTRES'
    end
    object qryFlashRptIDMOTIVOCENTRES: TFloatField
      FieldName = 'IDMOTIVOCENTRES'
    end
    object qryFlashRptUCEMDIMEDIATXOC: TStringField
      FieldName = 'UCEMDIMEDIATXOC'
      Size = 1
    end
    object qryFlashRptIDTIPODCTELDDD: TFloatField
      FieldName = 'IDTIPODCTELDDD'
    end
    object qryFlashRptIDTIPODCTELDDI: TFloatField
      FieldName = 'IDTIPODCTELDDI'
    end
  end
  object ppFlashRpt: TppReport
    AutoStop = False
    DataPipeline = pplFlashRpt
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 202
    Top = 72
    Version = '5.5'
    mmColumnWidth = 197300
    object ppFlashRptTitleBand4: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppFlashRptDBImage2: TppDBImage
        UserName = 'ppFlashRptDBImage2'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresaProp
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 19579
        mmLeft = 4763
        mmTop = 1588
        mmWidth = 20373
        BandType = 1
      end
      object ppFlashRptLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppFlashRptLabel2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 29633
        BandType = 1
      end
      object ppFlashRptLabel3: TppLabel
        UserName = 'ppFlashRptLabel3'
        Caption = 'Daily Flash Report'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 80963
        mmTop = 8731
        mmWidth = 37042
        BandType = 1
      end
      object lblDataSistema1: TppLabel
        OnPrint = lblDataSistema1Print
        UserName = 'lblDataSistema1'
        Caption = 'lblDataSistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 86784
        mmTop = 15081
        mmWidth = 25400
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      PrintOnFirstPage = False
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Daily Flash Report'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 80963
        mmTop = 8731
        mmWidth = 37042
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object lblDataSistema: TppLabel
        OnPrint = lblDataSistema1Print
        UserName = 'lblDataSistema'
        Caption = 'lblDataSistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 86784
        mmTop = 15081
        mmWidth = 25400
        BandType = 0
      end
      object ppFlashRptDBImage1: TppDBImage
        UserName = 'ppFlashRptDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresaProp
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 19579
        mmLeft = 4763
        mmTop = 1588
        mmWidth = 20373
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 173302
      mmPrintPosition = 0
      object ppFlashRptShape2: TppShape
        UserName = 'ppFlashRptShape2'
        Brush.Color = clSilver
        mmHeight = 5821
        mmLeft = 0
        mmTop = 127794
        mmWidth = 203200
        BandType = 4
      end
      object ppFlashRptShape1: TppShape
        UserName = 'ppFlashRptShape1'
        Brush.Color = clSilver
        mmHeight = 7144
        mmLeft = 0
        mmTop = 0
        mmWidth = 203200
        BandType = 4
      end
      object lblRoomsStats: TppLabel
        UserName = 'lblRoomsStats'
        Caption = 'Rooms Statistics'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 2117
        mmWidth = 24077
        BandType = 4
      end
      object lblToday: TppLabel
        UserName = 'lblToday'
        Caption = 'Today'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 85990
        mmTop = 794
        mmWidth = 7938
        BandType = 4
      end
      object lblActualMTD: TppLabel
        UserName = 'lblActualMTD'
        Caption = 'Actual M-T-D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 129382
        mmTop = 265
        mmWidth = 9525
        BandType = 4
      end
      object lblPOAMTD: TppLabel
        UserName = 'lblPOAMTD'
        Caption = 'POA M-T-D'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 174890
        mmTop = 265
        mmWidth = 9525
        BandType = 4
      end
      object lblTotalRooms: TppLabel
        UserName = 'lblTotalRooms'
        Caption = 'Total Rooms'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 8202
        mmWidth = 15346
        BandType = 4
      end
      object lblLessOut: TppLabel
        UserName = 'lblLessOut'
        Caption = 'Less Out of Order Rooms'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 11642
        mmWidth = 31485
        BandType = 4
      end
      object lblLessHouseUse: TppLabel
        UserName = 'lblLessHouseUse'
        Caption = 'Less House Use Rooms'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 15081
        mmWidth = 28046
        BandType = 4
      end
      object lblSallableRooms: TppLabel
        UserName = 'lblSallableRooms'
        Caption = 'Sellable Rooms'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 18521
        mmWidth = 18256
        BandType = 4
      end
      object lblOcpRoomsPaid: TppLabel
        UserName = 'lblOcpRoomsPaid'
        Caption = 'Occupied Rooms Paid'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 21960
        mmWidth = 26988
        BandType = 4
      end
      object lblCompRooms: TppLabel
        UserName = 'lblCompRooms'
        Caption = 'Complimentary Rooms'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 25400
        mmWidth = 27781
        BandType = 4
      end
      object lblTotalOcpRooms: TppLabel
        UserName = 'lblTotalOcpRooms'
        Caption = 'Total Occupied Rooms'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 28840
        mmWidth = 28046
        BandType = 4
      end
      object lblPercOccup: TppLabel
        UserName = 'lblPercOccup'
        Caption = '% Occupancy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 32279
        mmWidth = 16933
        BandType = 4
      end
      object lblAvgDailyRate: TppLabel
        UserName = 'lblAvgDailyRate'
        Caption = 'Average Daily Rate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 35719
        mmWidth = 23548
        BandType = 4
      end
      object lblRoomsRevPar: TppLabel
        UserName = 'lblRoomsRevPar'
        Caption = 'Rooms RevPar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 3175
        mmTop = 39158
        mmWidth = 18785
        BandType = 4
      end
      object lblRoomOcpGrp: TppLabel
        UserName = 'lblRoomOcpGrp'
        Caption = '# of Rooms Occupied by Groups'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 43921
        mmWidth = 40746
        BandType = 4
      end
      object lblRNCGrp: TppLabel
        UserName = 'lblRNCGrp'
        Caption = 'Group Business - Room Nights Contribution %'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 47361
        mmWidth = 56886
        BandType = 4
      end
      object lblADRGrp: TppLabel
        UserName = 'lblADRGrp'
        Caption = 'ADR for Groups Business'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 50800
        mmWidth = 31221
        BandType = 4
      end
      object lblRoomsOcpTrans: TppLabel
        UserName = 'lblRoomsOcpTrans'
        Caption = '# of Rooms Occupied by Transient Guest'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 54240
        mmWidth = 50536
        BandType = 4
      end
      object lblRNCTrans: TppLabel
        UserName = 'lblRNCTrans'
        Caption = 'Transient Business - Room Nights Contribution %'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 57679
        mmWidth = 60061
        BandType = 4
      end
      object lblRoomsOcpRptGuest: TppLabel
        UserName = 'lblRoomsOcpRptGuest'
        Caption = '# of Rooms Occupied by Repeat Guest'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 64558
        mmWidth = 47361
        BandType = 4
      end
      object lblRNCRptGuest: TppLabel
        UserName = 'lblRNCRptGuest'
        Caption = 'Repeat Guest - Room Nights Contribution %'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 67998
        mmWidth = 53446
        BandType = 4
      end
      object lblADRRptGuest: TppLabel
        UserName = 'lblADRRptGuest'
        Caption = 'ADR for Transient Business'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 61119
        mmWidth = 33338
        BandType = 4
      end
      object lblRoomsOcpChoice: TppLabel
        UserName = 'lblRoomsOcpChoice'
        AutoSize = False
        Caption = '# of Rooms Occupied by Central Reservation Office'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 71438
        mmWidth = 63765
        BandType = 4
      end
      object lblRNCChoice: TppLabel
        UserName = 'lblRNCChoice'
        AutoSize = False
        Caption = 'Central Res. Office - Room Nights Contribution %'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 74877
        mmWidth = 61648
        BandType = 4
      end
      object lblRoomsStayOver: TppLabel
        UserName = 'lblRoomsStayOver'
        Caption = '# of Rooms Occupied by Stay Overs'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 78317
        mmWidth = 44186
        BandType = 4
      end
      object lblRNCStayOvers: TppLabel
        UserName = 'lblRNCStayOvers'
        Caption = 'Stay Overs - Room Nights Contribution %'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 81756
        mmWidth = 50271
        BandType = 4
      end
      object lblRoomsEarlyDept: TppLabel
        UserName = 'lblRoomsEarlyDept'
        Caption = '# of Rooms Not Occupied due to Early Departures'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 85196
        mmWidth = 61648
        BandType = 4
      end
      object lblRNCEarlyDept: TppLabel
        UserName = 'lblRNCEarlyDept'
        Caption = 'Early Departures - Lost Room Nights Contribution %'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 88636
        mmWidth = 63500
        BandType = 4
      end
      object lblRoomsOcpSDRes: TppLabel
        UserName = 'lblRoomsOcpSDRes'
        Caption = '# of Rooms Occupied by Same Day Reservations'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 92075
        mmWidth = 58738
        BandType = 4
      end
      object lblRNCSameDayRes: TppLabel
        UserName = 'lblRNCSameDayRes'
        Caption = 'Same Day Reservations - Room Nights Contribution %'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 95515
        mmWidth = 64823
        BandType = 4
      end
      object lblRoomsOcpWalkins: TppLabel
        UserName = 'lblRoomsOcpWalkins'
        Caption = '# of Rooms Occupied by Walk-ins'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 98954
        mmWidth = 41804
        BandType = 4
      end
      object lblRNCWalkins: TppLabel
        UserName = 'lblRNCWalkins'
        Caption = 'Walk-ins - Room Nights Contribution %'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 102394
        mmWidth = 47890
        BandType = 4
      end
      object lblRoomOcpNoShow: TppLabel
        UserName = 'lblRoomOcpNoShow'
        Caption = '# of Rooms Not Occupied due to No-Show'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 105834
        mmWidth = 52917
        BandType = 4
      end
      object lblRNCNoShow: TppLabel
        UserName = 'lblRNCNoShow'
        Caption = 'No-Show - Lost Room Nights Contribution %'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 109273
        mmWidth = 54769
        BandType = 4
      end
      object lblTotalGuest: TppLabel
        UserName = 'lblTotalGuest'
        Caption = '# of Total Guests'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 112713
        mmWidth = 20902
        BandType = 4
      end
      object lblGuestOcpRoom: TppLabel
        UserName = 'lblGuestOcpRoom'
        Caption = 'Guests per Occupied Room'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 116152
        mmWidth = 33602
        BandType = 4
      end
      object lblCheckins: TppLabel
        UserName = 'lblCheckins'
        Caption = '# of Check-ins'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 119592
        mmWidth = 17727
        BandType = 4
      end
      object lblAvgLenStay: TppLabel
        UserName = 'lblAvgLenStay'
        Caption = 'Average Length of Stay'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 123031
        mmWidth = 26988
        BandType = 4
      end
      object lblFoodStats: TppLabel
        UserName = 'lblFoodStats'
        Caption = 'Food Statistics'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 128852
        mmWidth = 21431
        BandType = 4
      end
      object lblCovers: TppLabel
        UserName = 'lblCovers'
        Caption = 'Covers'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 3440
        mmTop = 134673
        mmWidth = 8202
        BandType = 4
      end
      object lblAvgCheck: TppLabel
        UserName = 'lblAvgCheck'
        Caption = 'Average Check'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 3440
        mmTop = 138113
        mmWidth = 17463
        BandType = 4
      end
      object ppFlashRptDBText1: TppDBText
        UserName = 'ppFlashRptDBText1'
        AutoSize = True
        DataField = 'TOTALUHSHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 75406
        mmTop = 8202
        mmWidth = 21696
        BandType = 4
      end
      object ppFlashRptDBText2: TppDBText
        UserName = 'ppFlashRptDBText2'
        AutoSize = True
        DataField = 'TOTALUHS'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 126736
        mmTop = 8202
        mmWidth = 14552
        BandType = 4
      end
      object ppFlashRptDBText3: TppDBText
        UserName = 'ppFlashRptDBText3'
        AutoSize = True
        DataField = 'QTDEBLOQUEADOHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 64294
        mmTop = 11642
        mmWidth = 32808
        BandType = 4
      end
      object ppFlashRptDBText4: TppDBText
        UserName = 'ppFlashRptDBText4'
        AutoSize = True
        DataField = 'QTDEBLOQUEADO'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 115623
        mmTop = 11642
        mmWidth = 25665
        BandType = 4
      end
      object ppFlashRptDBText5: TppDBText
        UserName = 'ppFlashRptDBText5'
        AutoSize = True
        DataField = 'QTDEUSOCASAHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 69850
        mmTop = 15081
        mmWidth = 27252
        BandType = 4
      end
      object ppFlashRptDBText6: TppDBText
        UserName = 'ppFlashRptDBText6'
        AutoSize = True
        DataField = 'QTDEUSOCASA'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 121179
        mmTop = 15081
        mmWidth = 20108
        BandType = 4
      end
      object ppFlashRptDBText7: TppDBText
        UserName = 'ppFlashRptDBText7'
        AutoSize = True
        DataField = 'QTDESELLABLEROOMSHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 58738
        mmTop = 18521
        mmWidth = 38365
        BandType = 4
      end
      object ppFlashRptDBText8: TppDBText
        UserName = 'ppFlashRptDBText8'
        AutoSize = True
        DataField = 'QTDESELLABLEROOMS'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 110067
        mmTop = 18521
        mmWidth = 31221
        BandType = 4
      end
      object ppFlashRptDBText9: TppDBText
        UserName = 'ppFlashRptDBText9'
        AutoSize = True
        DataField = 'QTDEROOMSPAIDHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 65617
        mmTop = 21960
        mmWidth = 31485
        BandType = 4
      end
      object ppFlashRptDBText10: TppDBText
        UserName = 'ppFlashRptDBText10'
        AutoSize = True
        DataField = 'QTDEROOMSPAID'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 116946
        mmTop = 21960
        mmWidth = 24342
        BandType = 4
      end
      object ppFlashRptDBText11: TppDBText
        UserName = 'ppFlashRptDBText11'
        AutoSize = True
        DataField = 'QTDEUHCORTESIAHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 64558
        mmTop = 25400
        mmWidth = 32544
        BandType = 4
      end
      object ppFlashRptDBText12: TppDBText
        UserName = 'ppFlashRptDBText12'
        AutoSize = True
        DataField = 'QTDEUHCORTESIA'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 115888
        mmTop = 25400
        mmWidth = 25400
        BandType = 4
      end
      object ppFlashRptDBText13: TppDBText
        UserName = 'ppFlashRptDBText13'
        AutoSize = True
        DataField = 'QTDEOCCUPIEDROOMSHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 57944
        mmTop = 28840
        mmWidth = 39158
        BandType = 4
      end
      object ppFlashRptDBText14: TppDBText
        UserName = 'ppFlashRptDBText14'
        AutoSize = True
        DataField = 'QTDEOCCUPIEDROOMS'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 28840
        mmWidth = 32015
        BandType = 4
      end
      object ppFlashRptDBText15: TppDBText
        UserName = 'ppFlashRptDBText15'
        AutoSize = True
        DataField = 'PERCOCCUPANCYHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 64294
        mmTop = 32279
        mmWidth = 32808
        BandType = 4
      end
      object ppFlashRptDBText16: TppDBText
        UserName = 'ppFlashRptDBText16'
        AutoSize = True
        DataField = 'PERCOCCUPANCY'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 116152
        mmTop = 32279
        mmWidth = 25135
        BandType = 4
      end
      object ppFlashRptDBText17: TppDBText
        UserName = 'ppFlashRptDBText17'
        AutoSize = True
        DataField = 'AVGDIHOJE'
        DataPipeline = ppRoomsDI
        DisplayFormat = '$#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 80433
        mmTop = 35719
        mmWidth = 16669
        BandType = 4
      end
      object ppFlashRptDBText18: TppDBText
        UserName = 'ppFlashRptDBText18'
        AutoSize = True
        DataField = 'AVGDI'
        DataPipeline = ppRoomsDI
        DisplayFormat = '$#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 132292
        mmTop = 35719
        mmWidth = 8996
        BandType = 4
      end
      object ppFlashRptDBText19: TppDBText
        UserName = 'ppFlashRptDBText19'
        AutoSize = True
        DataField = 'REVPARHOJE'
        DataPipeline = ppRoomsDI
        DisplayFormat = '$0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 78317
        mmTop = 39158
        mmWidth = 18785
        BandType = 4
      end
      object ppFlashRptDBText20: TppDBText
        UserName = 'ppFlashRptDBText20'
        AutoSize = True
        DataField = 'REVPAR'
        DataPipeline = ppRoomsDI
        DisplayFormat = '$0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129911
        mmTop = 39158
        mmWidth = 11377
        BandType = 4
      end
      object ppFlashRptDBText21: TppDBText
        UserName = 'ppFlashRptDBText21'
        AutoSize = True
        DataField = 'QTDEUHGRPHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 72496
        mmTop = 43921
        mmWidth = 24606
        BandType = 4
      end
      object ppFlashRptDBText22: TppDBText
        UserName = 'ppFlashRptDBText22'
        AutoSize = True
        DataField = 'QTDEUHGRP'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 123825
        mmTop = 43921
        mmWidth = 17463
        BandType = 4
      end
      object ppFlashRptDBText23: TppDBText
        UserName = 'ppFlashRptDBText23'
        AutoSize = True
        DataField = 'GROUPRNCHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 74613
        mmTop = 47361
        mmWidth = 22490
        BandType = 4
      end
      object ppFlashRptDBText24: TppDBText
        UserName = 'ppFlashRptDBText24'
        AutoSize = True
        DataField = 'GROUPRNC'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 47361
        mmWidth = 15346
        BandType = 4
      end
      object ppFlashRptDBText25: TppDBText
        UserName = 'ppFlashRptDBText25'
        AutoSize = True
        DataField = 'GROUPADRHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '$#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 74613
        mmTop = 50800
        mmWidth = 22490
        BandType = 4
      end
      object ppFlashRptDBText26: TppDBText
        UserName = 'ppFlashRptDBText26'
        AutoSize = True
        DataField = 'GROUPADR'
        DataPipeline = ppEstatHotel
        DisplayFormat = '$#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 50800
        mmWidth = 15346
        BandType = 4
      end
      object ppFlashRptDBText27: TppDBText
        UserName = 'ppFlashRptDBText27'
        AutoSize = True
        DataField = 'QTDEUHINDHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 72761
        mmTop = 54240
        mmWidth = 24342
        BandType = 4
      end
      object ppFlashRptDBText28: TppDBText
        UserName = 'ppFlashRptDBText28'
        AutoSize = True
        DataField = 'QTDEUHIND'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 54240
        mmWidth = 17198
        BandType = 4
      end
      object ppFlashRptDBText29: TppDBText
        UserName = 'ppFlashRptDBText29'
        AutoSize = True
        DataField = 'TRANSIENTRNCHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 68792
        mmTop = 57679
        mmWidth = 28310
        BandType = 4
      end
      object ppFlashRptDBText30: TppDBText
        UserName = 'ppFlashRptDBText30'
        AutoSize = True
        DataField = 'TRANSIENTRNC'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 120121
        mmTop = 57679
        mmWidth = 21167
        BandType = 4
      end
      object ppFlashRptDBText31: TppDBText
        UserName = 'ppFlashRptDBText31'
        AutoSize = True
        DataField = 'TRANSIENTADRHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '$#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 68792
        mmTop = 61119
        mmWidth = 28310
        BandType = 4
      end
      object ppFlashRptDBText32: TppDBText
        UserName = 'ppFlashRptDBText32'
        AutoSize = True
        DataField = 'TRANSIENTADR'
        DataPipeline = ppEstatHotel
        DisplayFormat = '$#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 120121
        mmTop = 61119
        mmWidth = 21167
        BandType = 4
      end
      object ppFlashRptDBText33: TppDBText
        UserName = 'ppFlashRptDBText33'
        AutoSize = True
        DataField = 'QTDEHOSPEDEREPETEHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 58208
        mmTop = 64558
        mmWidth = 38894
        BandType = 4
      end
      object ppFlashRptDBText34: TppDBText
        UserName = 'ppFlashRptDBText34'
        AutoSize = True
        DataField = 'QTDEHOSPEDEREPETE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 109538
        mmTop = 64558
        mmWidth = 31750
        BandType = 4
      end
      object ppFlashRptDBText35: TppDBText
        UserName = 'ppFlashRptDBText35'
        AutoSize = True
        DataField = 'REPEATGUESTRNCHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 64558
        mmTop = 67998
        mmWidth = 32544
        BandType = 4
      end
      object ppFlashRptDBText36: TppDBText
        UserName = 'ppFlashRptDBText36'
        AutoSize = True
        DataField = 'REPEATGUESTRNC'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 115888
        mmTop = 67998
        mmWidth = 25400
        BandType = 4
      end
      object ppFlashRptDBText37: TppDBText
        UserName = 'ppFlashRptDBText37'
        AutoSize = True
        DataField = 'CHOICERSHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 76200
        mmTop = 71438
        mmWidth = 20902
        BandType = 4
      end
      object ppFlashRptDBText38: TppDBText
        UserName = 'ppFlashRptDBText38'
        AutoSize = True
        DataField = 'CHOICERS'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 127529
        mmTop = 71438
        mmWidth = 13758
        BandType = 4
      end
      object ppFlashRptDBText39: TppDBText
        UserName = 'ppFlashRptDBText39'
        AutoSize = True
        DataField = 'CHOICERSRNCHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 74877
        mmWidth = 26723
        BandType = 4
      end
      object ppFlashRptDBText40: TppDBText
        UserName = 'ppFlashRptDBText40'
        AutoSize = True
        DataField = 'CHOICERSRNC'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 121709
        mmTop = 74877
        mmWidth = 19579
        BandType = 4
      end
      object ppFlashRptDBText41: TppDBText
        UserName = 'ppFlashRptDBText41'
        AutoSize = True
        DataField = 'QTDEEXTENSOESHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 65881
        mmTop = 78317
        mmWidth = 31221
        BandType = 4
      end
      object ppFlashRptDBText42: TppDBText
        UserName = 'ppFlashRptDBText42'
        AutoSize = True
        DataField = 'QTDEEXTENSOES'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 117211
        mmTop = 78317
        mmWidth = 24077
        BandType = 4
      end
      object ppFlashRptDBText43: TppDBText
        UserName = 'ppFlashRptDBText43'
        AutoSize = True
        DataField = 'STAYOVERSRNCHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 68527
        mmTop = 81756
        mmWidth = 28575
        BandType = 4
      end
      object ppFlashRptDBText44: TppDBText
        UserName = 'ppFlashRptDBText44'
        AutoSize = True
        DataField = 'STAYOVERSRNC'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 119856
        mmTop = 81756
        mmWidth = 21431
        BandType = 4
      end
      object ppFlashRptDBText45: TppDBText
        UserName = 'ppFlashRptDBText45'
        AutoSize = True
        DataField = 'QTDESAIANTECIPADAHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 68527
        mmTop = 85196
        mmWidth = 28575
        BandType = 4
      end
      object ppFlashRptDBText46: TppDBText
        UserName = 'ppFlashRptDBText46'
        AutoSize = True
        DataField = 'QTDESAIANTECIPADA'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 111390
        mmTop = 85196
        mmWidth = 29898
        BandType = 4
      end
      object ppFlashRptDBText47: TppDBText
        UserName = 'ppFlashRptDBText47'
        AutoSize = True
        DataField = 'EARLYDEPLRNCHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 68263
        mmTop = 88636
        mmWidth = 28840
        BandType = 4
      end
      object ppFlashRptDBText48: TppDBText
        UserName = 'ppFlashRptDBText48'
        AutoSize = True
        DataField = 'EARLYDEPLRNC'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 119327
        mmTop = 88636
        mmWidth = 21960
        BandType = 4
      end
      object ppFlashRptDBText49: TppDBText
        UserName = 'ppFlashRptDBText49'
        AutoSize = True
        DataField = 'QTDEPICKUPHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 72231
        mmTop = 92075
        mmWidth = 24871
        BandType = 4
      end
      object ppFlashRptDBText50: TppDBText
        UserName = 'ppFlashRptDBText50'
        AutoSize = True
        DataField = 'QTDEPICKUP'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 123296
        mmTop = 92075
        mmWidth = 17992
        BandType = 4
      end
      object ppFlashRptDBText51: TppDBText
        UserName = 'ppFlashRptDBText51'
        AutoSize = True
        DataField = 'PICKUPRNCHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 74348
        mmTop = 95515
        mmWidth = 22754
        BandType = 4
      end
      object ppFlashRptDBText52: TppDBText
        UserName = 'ppFlashRptDBText52'
        AutoSize = True
        DataField = 'PICKUPRNC'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 95515
        mmWidth = 15610
        BandType = 4
      end
      object ppFlashRptDBText53: TppDBText
        UserName = 'ppFlashRptDBText53'
        AutoSize = True
        DataField = 'QTDEUHWALKINHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 66940
        mmTop = 98954
        mmWidth = 30163
        BandType = 4
      end
      object ppFlashRptDBText54: TppDBText
        UserName = 'ppFlashRptDBText54'
        AutoSize = True
        DataField = 'QTDEUHWALKIN'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 118269
        mmTop = 98954
        mmWidth = 23019
        BandType = 4
      end
      object ppFlashRptDBText55: TppDBText
        UserName = 'ppFlashRptDBText55'
        AutoSize = True
        DataField = 'UHWALKINRNCHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 69056
        mmTop = 102394
        mmWidth = 28046
        BandType = 4
      end
      object ppFlashRptDBText56: TppDBText
        UserName = 'ppFlashRptDBText56'
        AutoSize = True
        DataField = 'UHWALKINRNC'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 120386
        mmTop = 102394
        mmWidth = 20902
        BandType = 4
      end
      object ppFlashRptDBText57: TppDBText
        UserName = 'ppFlashRptDBText57'
        AutoSize = True
        DataField = 'QTDEUHNOSHOWCOBHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 60061
        mmTop = 105834
        mmWidth = 37042
        BandType = 4
      end
      object ppFlashRptDBText58: TppDBText
        UserName = 'ppFlashRptDBText58'
        AutoSize = True
        DataField = 'QTDEUHNOSHOWCOB'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 111125
        mmTop = 105834
        mmWidth = 30163
        BandType = 4
      end
      object ppFlashRptDBText59: TppDBText
        UserName = 'ppFlashRptDBText59'
        AutoSize = True
        DataField = 'NOSHOWLRNCHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 109273
        mmWidth = 26723
        BandType = 4
      end
      object ppFlashRptDBText60: TppDBText
        UserName = 'ppFlashRptDBText60'
        AutoSize = True
        DataField = 'NOSHOWLRNC'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 121444
        mmTop = 109273
        mmWidth = 19844
        BandType = 4
      end
      object ppFlashRptDBText61: TppDBText
        UserName = 'ppFlashRptDBText61'
        AutoSize = True
        DataField = 'QTDHOSPEDESHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 69586
        mmTop = 112713
        mmWidth = 27517
        BandType = 4
      end
      object ppFlashRptDBText62: TppDBText
        UserName = 'ppFlashRptDBText62'
        AutoSize = True
        DataField = 'QTDHOSPEDES'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 120915
        mmTop = 112713
        mmWidth = 20373
        BandType = 4
      end
      object ppFlashRptDBText63: TppDBText
        UserName = 'ppFlashRptDBText63'
        AutoSize = True
        DataField = 'GUESTPEROCPROOMHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 61648
        mmTop = 116152
        mmWidth = 35454
        BandType = 4
      end
      object ppFlashRptDBText64: TppDBText
        UserName = 'ppFlashRptDBText64'
        AutoSize = True
        DataField = 'GUESTPEROCPROOM'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 112977
        mmTop = 116152
        mmWidth = 28310
        BandType = 4
      end
      object ppFlashRptDBText65: TppDBText
        UserName = 'ppFlashRptDBText65'
        AutoSize = True
        DataField = 'QTDECHEGADASHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 66940
        mmTop = 119592
        mmWidth = 30163
        BandType = 4
      end
      object ppFlashRptDBText66: TppDBText
        UserName = 'ppFlashRptDBText66'
        AutoSize = True
        DataField = 'QTDECHEGADAS'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 118269
        mmTop = 119592
        mmWidth = 23019
        BandType = 4
      end
      object ppFlashRptDBText67: TppDBText
        UserName = 'ppFlashRptDBText67'
        AutoSize = True
        DataField = 'AVGLENGTHSTAYHOJE'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 65881
        mmTop = 123031
        mmWidth = 31221
        BandType = 4
      end
      object ppFlashRptDBText68: TppDBText
        UserName = 'ppFlashRptDBText68'
        AutoSize = True
        DataField = 'AVGLENGTHSTAY'
        DataPipeline = ppEstatHotel
        DisplayFormat = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 117211
        mmTop = 123031
        mmWidth = 24077
        BandType = 4
      end
      object ppFlashRptDBText69: TppDBText
        UserName = 'ppFlashRptDBText69'
        AutoSize = True
        DataField = 'QTDECOUVERTHOJE'
        DataPipeline = ppFoodStats
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 69056
        mmTop = 134673
        mmWidth = 28046
        BandType = 4
      end
      object ppFlashRptDBText70: TppDBText
        UserName = 'ppFlashRptDBText70'
        AutoSize = True
        DataField = 'QTDECOUVERTACUM'
        DataPipeline = ppFoodStats
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 112448
        mmTop = 134673
        mmWidth = 28840
        BandType = 4
      end
      object ppFlashRptDBText71: TppDBText
        UserName = 'ppFlashRptDBText71'
        AutoSize = True
        DataField = 'AVGCHECKHOJE'
        DataPipeline = ppFoodStats
        DisplayFormat = '$#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 74613
        mmTop = 138113
        mmWidth = 22490
        BandType = 4
      end
      object ppFlashRptDBText72: TppDBText
        UserName = 'ppFlashRptDBText72'
        AutoSize = True
        DataField = 'AVGCHECK'
        DataPipeline = ppFoodStats
        DisplayFormat = '$#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 138113
        mmWidth = 15346
        BandType = 4
      end
      object ppFlashRptDBText96: TppDBText
        UserName = 'ppFlashRptDBText96'
        AutoSize = True
        DataField = 'TOTALUHS'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 172773
        mmTop = 8202
        mmWidth = 14552
        BandType = 4
      end
      object ppFlashRptDBText97: TppDBText
        UserName = 'ppFlashRptDBText97'
        AutoSize = True
        DataField = 'QTDEBLOQUEADO'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 161661
        mmTop = 11642
        mmWidth = 25665
        BandType = 4
      end
      object ppFlashRptDBText98: TppDBText
        UserName = 'ppFlashRptDBText98'
        AutoSize = True
        DataField = 'QTDEUSOCASA'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 167217
        mmTop = 15081
        mmWidth = 20108
        BandType = 4
      end
      object ppFlashRptDBText99: TppDBText
        UserName = 'ppFlashRptDBText99'
        AutoSize = True
        DataField = 'QTDESELLABLEROOMS'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 156104
        mmTop = 18521
        mmWidth = 31221
        BandType = 4
      end
      object ppFlashRptDBText100: TppDBText
        UserName = 'ppFlashRptDBText100'
        AutoSize = True
        DataField = 'QTDEROOMSPAID'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 162984
        mmTop = 21960
        mmWidth = 24342
        BandType = 4
      end
      object ppFlashRptDBText101: TppDBText
        UserName = 'ppFlashRptDBText101'
        AutoSize = True
        DataField = 'QTDEUHCORTESIA'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 161925
        mmTop = 25400
        mmWidth = 25400
        BandType = 4
      end
      object ppFlashRptDBText102: TppDBText
        UserName = 'ppFlashRptDBText102'
        AutoSize = True
        DataField = 'QTDEOCCUPIEDROOMS'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 155311
        mmTop = 28840
        mmWidth = 32015
        BandType = 4
      end
      object ppFlashRptDBText103: TppDBText
        UserName = 'ppFlashRptDBText103'
        AutoSize = True
        DataField = 'PERCOCCUPANCY'
        DataPipeline = ppPOA
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        OnFormat = ppFlashRptDBText103Format
        mmHeight = 3175
        mmLeft = 162190
        mmTop = 32279
        mmWidth = 25135
        BandType = 4
      end
      object ppFlashRptDBText104: TppDBText
        UserName = 'ppFlashRptDBText104'
        AutoSize = True
        DataField = 'AVGDI'
        DataPipeline = ppPOA
        DisplayFormat = '$#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 178330
        mmTop = 35719
        mmWidth = 8996
        BandType = 4
      end
      object ppFlashRptDBText105: TppDBText
        UserName = 'ppFlashRptDBText105'
        AutoSize = True
        DataField = 'REVPAR'
        DataPipeline = ppPOA
        DisplayFormat = '$0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 175948
        mmTop = 39158
        mmWidth = 11377
        BandType = 4
      end
      object ppFlashRptDBText106: TppDBText
        UserName = 'ppFlashRptDBText106'
        AutoSize = True
        DataField = 'QTDEUHGRP'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 43921
        mmWidth = 17463
        BandType = 4
      end
      object ppFlashRptDBText107: TppDBText
        UserName = 'ppFlashRptDBText107'
        AutoSize = True
        DataField = 'GROUPRNC'
        DataPipeline = ppPOA
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 171980
        mmTop = 47361
        mmWidth = 15346
        BandType = 4
      end
      object ppFlashRptDBText108: TppDBText
        UserName = 'ppFlashRptDBText108'
        AutoSize = True
        DataField = 'GROUPADR'
        DataPipeline = ppPOA
        DisplayFormat = '$0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 171980
        mmTop = 50800
        mmWidth = 15346
        BandType = 4
      end
      object ppFlashRptDBText109: TppDBText
        UserName = 'ppFlashRptDBText109'
        AutoSize = True
        DataField = 'QTDEUHIND'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 170127
        mmTop = 54240
        mmWidth = 17198
        BandType = 4
      end
      object ppFlashRptDBText110: TppDBText
        UserName = 'ppFlashRptDBText110'
        AutoSize = True
        DataField = 'TRANSIENTRNC'
        DataPipeline = ppPOA
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 166159
        mmTop = 57679
        mmWidth = 21167
        BandType = 4
      end
      object ppFlashRptDBText111: TppDBText
        UserName = 'ppFlashRptDBText111'
        AutoSize = True
        DataField = 'TRANSIENTADR'
        DataPipeline = ppPOA
        DisplayFormat = '$0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 166159
        mmTop = 61119
        mmWidth = 21167
        BandType = 4
      end
      object ppFlashRptDBText112: TppDBText
        UserName = 'ppFlashRptDBText112'
        AutoSize = True
        DataField = 'QTDEHOSPEDEREPETE'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 155575
        mmTop = 64558
        mmWidth = 31750
        BandType = 4
      end
      object ppFlashRptDBText113: TppDBText
        UserName = 'ppFlashRptDBText113'
        AutoSize = True
        DataField = 'REPEATGUESTRNC'
        DataPipeline = ppPOA
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 161925
        mmTop = 67998
        mmWidth = 25400
        BandType = 4
      end
      object ppFlashRptDBText114: TppDBText
        UserName = 'ppFlashRptDBText114'
        AutoSize = True
        DataField = 'CHOICERS'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 173567
        mmTop = 71438
        mmWidth = 13758
        BandType = 4
      end
      object ppFlashRptDBText115: TppDBText
        UserName = 'ppFlashRptDBText115'
        AutoSize = True
        DataField = 'CHOICERSRNC'
        DataPipeline = ppPOA
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 167746
        mmTop = 74877
        mmWidth = 19579
        BandType = 4
      end
      object ppFlashRptDBText116: TppDBText
        UserName = 'ppFlashRptDBText116'
        AutoSize = True
        DataField = 'QTDEEXTENSOES'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 163248
        mmTop = 78317
        mmWidth = 24077
        BandType = 4
      end
      object ppFlashRptDBText117: TppDBText
        UserName = 'ppFlashRptDBText117'
        AutoSize = True
        DataField = 'STAYOVERSRNC'
        DataPipeline = ppPOA
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 165894
        mmTop = 81756
        mmWidth = 21431
        BandType = 4
      end
      object ppFlashRptDBText118: TppDBText
        UserName = 'ppFlashRptDBText118'
        AutoSize = True
        DataField = 'QTDESAIANTECIPADA'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 85196
        mmWidth = 29898
        BandType = 4
      end
      object ppFlashRptDBText119: TppDBText
        UserName = 'ppFlashRptDBText119'
        AutoSize = True
        DataField = 'EARLYDEPLRNC'
        DataPipeline = ppPOA
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 165365
        mmTop = 88636
        mmWidth = 21960
        BandType = 4
      end
      object ppFlashRptDBText120: TppDBText
        UserName = 'ppFlashRptDBText120'
        AutoSize = True
        DataField = 'QTDEPICKUP'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 169334
        mmTop = 92075
        mmWidth = 17992
        BandType = 4
      end
      object ppFlashRptDBText121: TppDBText
        UserName = 'ppFlashRptDBText121'
        AutoSize = True
        DataField = 'PICKUPRNC'
        DataPipeline = ppPOA
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 171715
        mmTop = 95515
        mmWidth = 15610
        BandType = 4
      end
      object ppFlashRptDBText122: TppDBText
        UserName = 'ppFlashRptDBText122'
        AutoSize = True
        DataField = 'QTDEUHWALKIN'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 164307
        mmTop = 98954
        mmWidth = 23019
        BandType = 4
      end
      object ppFlashRptDBText123: TppDBText
        UserName = 'ppFlashRptDBText123'
        AutoSize = True
        DataField = 'UHWALKINRNC'
        DataPipeline = ppPOA
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 166423
        mmTop = 102394
        mmWidth = 20902
        BandType = 4
      end
      object ppFlashRptDBText124: TppDBText
        UserName = 'ppFlashRptDBText124'
        AutoSize = True
        DataField = 'QTDEUHNOSHOWCOB'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157163
        mmTop = 105834
        mmWidth = 30163
        BandType = 4
      end
      object ppFlashRptDBText125: TppDBText
        UserName = 'ppFlashRptDBText125'
        AutoSize = True
        DataField = 'NOSHOWLRNC'
        DataPipeline = ppPOA
        DisplayFormat = '0.00%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 167482
        mmTop = 109273
        mmWidth = 19844
        BandType = 4
      end
      object ppFlashRptDBText126: TppDBText
        UserName = 'ppFlashRptDBText126'
        AutoSize = True
        DataField = 'QTDHOSPEDES'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 166952
        mmTop = 112713
        mmWidth = 20373
        BandType = 4
      end
      object ppFlashRptDBText127: TppDBText
        UserName = 'ppFlashRptDBText127'
        AutoSize = True
        DataField = 'GUESTPEROCPROOM'
        DataPipeline = ppPOA
        DisplayFormat = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 159015
        mmTop = 116152
        mmWidth = 28310
        BandType = 4
      end
      object ppFlashRptDBText128: TppDBText
        UserName = 'ppFlashRptDBText128'
        AutoSize = True
        DataField = 'QTDECHEGADAS'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 164307
        mmTop = 119592
        mmWidth = 23019
        BandType = 4
      end
      object ppFlashRptDBText129: TppDBText
        UserName = 'ppFlashRptDBText129'
        AutoSize = True
        DataField = 'AVGLENGTHSTAY'
        DataPipeline = ppPOA
        DisplayFormat = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 163248
        mmTop = 123031
        mmWidth = 24077
        BandType = 4
      end
      object ppFlashRptDBText130: TppDBText
        UserName = 'ppFlashRptDBText130'
        AutoSize = True
        DataField = 'QTDECOUVERT'
        DataPipeline = ppPOA
        DisplayFormat = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 166423
        mmTop = 134673
        mmWidth = 20902
        BandType = 4
      end
      object ppFlashRptDBText131: TppDBText
        UserName = 'ppFlashRptDBText131'
        AutoSize = True
        DataField = 'AVGCHECK'
        DataPipeline = ppPOA
        DisplayFormat = '$#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 171980
        mmTop = 138113
        mmWidth = 15346
        BandType = 4
      end
      object ppFlashRptDeptRev: TppSubReport
        UserName = 'ppFlashRptDeptRev'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 143140
        mmWidth = 203200
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppFlashRptChildReport5: TppChildReport
          AutoStop = False
          DataPipeline = ppLinhaDeptRev
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Template.SaveTo = stDatabase
          Version = '5.5'
          mmColumnWidth = 0
          object ppFlashRptTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppFlashRptShape4: TppShape
              UserName = 'ppFlashRptShape4'
              Brush.Color = clSilver
              mmHeight = 5292
              mmLeft = 265
              mmTop = 0
              mmWidth = 202936
              BandType = 1
            end
            object lbl4DayFore: TppLabel
              UserName = 'lbl4DayFore'
              Caption = 'Departmental Revenue'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 1323
              mmTop = 1058
              mmWidth = 33338
              BandType = 1
            end
          end
          object ppFlashRptDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppFlashRptDBText89: TppDBText
              UserName = 'ppFlashRptDBText89'
              DataField = 'NOMELINHA'
              DataPipeline = ppLinhaDeptRev
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3175
              mmLeft = 3439
              mmTop = 265
              mmWidth = 68792
              BandType = 4
            end
            object ppFlashRptChildReport5DBText2: TppDBText
              UserName = 'ppFlashRptChildReport5DBText2'
              DataField = 'COLHOJE'
              DataPipeline = ppLinhaDeptRev
              DisplayFormat = '$#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 81492
              mmTop = 265
              mmWidth = 15610
              BandType = 4
            end
            object ppFlashRptChildReport5DBText3: TppDBText
              UserName = 'ppFlashRptChildReport5DBText3'
              DataField = 'COLACUMULADO'
              DataPipeline = ppLinhaDeptRev
              DisplayFormat = '$#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 125677
              mmTop = 265
              mmWidth = 15610
              BandType = 4
            end
            object ppFlashRptChildReport5DBText4: TppDBText
              UserName = 'ppFlashRptChildReport5DBText4'
              DataField = 'COLORCADO'
              DataPipeline = ppLinhaDeptRev
              DisplayFormat = '$#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 171715
              mmTop = 265
              mmWidth = 15610
              BandType = 4
            end
          end
          object ppFlashRptSummaryBand3: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 12700
            mmPrintPosition = 0
            object lblTotalNetRev: TppLabel
              UserName = 'lblTotalNetRev'
              Caption = 'Total Net Revenue'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 41010
              mmTop = 1588
              mmWidth = 27517
              BandType = 7
            end
            object ppFlashRptDBText92: TppDBText
              UserName = 'ppFlashRptDBText92'
              AutoSize = True
              DataField = 'NETREVHOJE'
              DataPipeline = ppNetRev
              DisplayFormat = '$#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 71967
              mmTop = 1588
              mmWidth = 25135
              BandType = 7
            end
            object ppFlashRptDBText93: TppDBText
              UserName = 'ppFlashRptDBText93'
              AutoSize = True
              DataField = 'NETREV'
              DataPipeline = ppNetRev
              DisplayFormat = '$#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 125942
              mmTop = 1588
              mmWidth = 15346
              BandType = 7
            end
            object lblTotalRevPar: TppLabel
              UserName = 'lblTotalRevPar'
              Caption = 'Total RevPar'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 49213
              mmTop = 5821
              mmWidth = 19315
              BandType = 7
            end
            object ppFlashRptDBText94: TppDBText
              UserName = 'ppFlashRptDBText94'
              AutoSize = True
              DataField = 'REVPARHOJE'
              DataPipeline = ppNetRev
              DisplayFormat = '$#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 73025
              mmTop = 5821
              mmWidth = 24077
              BandType = 7
            end
            object ppFlashRptDBText95: TppDBText
              UserName = 'ppFlashRptDBText95'
              AutoSize = True
              DataField = 'REVPAR'
              DataPipeline = ppNetRev
              DisplayFormat = '$#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 127000
              mmTop = 5821
              mmWidth = 14288
              BandType = 7
            end
            object ppFlashRptChildReport5DBText1: TppDBText
              UserName = 'ppFlashRptChildReport5DBText1'
              AutoSize = True
              DataField = 'NETREVORC'
              DataPipeline = ppNetRev
              DisplayFormat = '$#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 164307
              mmTop = 1588
              mmWidth = 23019
              BandType = 7
            end
            object ppFlashRptChildReport5DBText8: TppDBText
              UserName = 'ppFlashRptChildReport5DBText8'
              AutoSize = True
              DataField = 'REVPARORC'
              DataPipeline = ppNetRev
              DisplayFormat = '$#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 165365
              mmTop = 5821
              mmWidth = 21960
              BandType = 7
            end
          end
        end
      end
      object ppFlashRpt4DayFore: TppSubReport
        UserName = 'ppFlashRpt4DayFore'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = ppFlashRptDeptRev
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 149490
        mmWidth = 203200
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppFlashRptChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDatas
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Version = '5.5'
          mmColumnWidth = 0
          object ppFlashRptTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 13494
            mmPrintPosition = 0
            object ppFlashRptShape3: TppShape
              UserName = 'ppFlashRptShape3'
              Brush.Color = clSilver
              mmHeight = 5292
              mmLeft = 0
              mmTop = 2381
              mmWidth = 203200
              BandType = 1
            end
            object ppFlashRptLabel1: TppLabel
              UserName = 'ppFlashRptLabel1'
              Caption = '4 Day Forecast'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 1852
              mmTop = 3175
              mmWidth = 21431
              BandType = 1
            end
            object lblAvailableRooms: TppLabel
              UserName = 'lblAvailableRooms'
              Caption = 'Available Rooms'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 35190
              mmTop = 8996
              mmWidth = 19844
              BandType = 1
            end
            object lblOcpRooms: TppLabel
              UserName = 'lblOcpRooms'
              Caption = 'Occupied Rooms'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 58738
              mmTop = 8996
              mmWidth = 21167
              BandType = 1
            end
            object lblPercOcup: TppLabel
              UserName = 'lblPercOcup'
              Caption = '% Occupancy'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 81756
              mmTop = 8996
              mmWidth = 16669
              BandType = 1
            end
            object lblAvgDRate: TppLabel
              UserName = 'lblAvgDRate'
              Caption = 'Average Daily Rate'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 101336
              mmTop = 8996
              mmWidth = 21960
              BandType = 1
            end
            object lblRevAvgR: TppLabel
              UserName = 'lblRevAvgR'
              Caption = 'Revenue per Available Room'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 126471
              mmTop = 8996
              mmWidth = 34660
              BandType = 1
            end
            object lblNumGuests: TppLabel
              UserName = 'lblNumGuests'
              Caption = '# Guests'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 165100
              mmTop = 8996
              mmWidth = 10583
              BandType = 1
            end
            object lblDemandTag: TppLabel
              UserName = 'lblDemandTag'
              Caption = 'Demand Tag'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 179123
              mmTop = 8996
              mmWidth = 15081
              BandType = 1
            end
            object ppFlashRptChildReport1Line1: TppLine
              UserName = 'ppFlashRptChildReport1Line1'
              Weight = 0.75
              mmHeight = 794
              mmLeft = 265
              mmTop = 13229
              mmWidth = 201877
              BandType = 1
            end
          end
          object ppFlashRptDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppFlashRptDBText73: TppDBText
              UserName = 'ppFlashRptDBText73'
              DataField = 'DATA'
              DataPipeline = ppDatas
              DisplayFormat = 'dd/mm'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 5821
              mmTop = 794
              mmWidth = 9525
              BandType = 4
            end
            object ppFlashRptDBText74: TppDBText
              UserName = 'ppFlashRptDBText74'
              DataField = 'TOTALUHS'
              DataPipeline = ppDatas
              DisplayFormat = '0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 36777
              mmTop = 794
              mmWidth = 15610
              BandType = 4
            end
            object ppFlashRptDBText75: TppDBText
              UserName = 'ppFlashRptDBText75'
              DataField = 'TOTOCPROOMS'
              DataPipeline = ppDatas
              DisplayFormat = '0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 60854
              mmTop = 794
              mmWidth = 15610
              BandType = 4
            end
            object ppFlashRptDBText76: TppDBText
              UserName = 'ppFlashRptDBText76'
              DataField = 'PERCOCCUP'
              DataPipeline = ppDatas
              DisplayFormat = '0.00%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 82286
              mmTop = 794
              mmWidth = 15610
              BandType = 4
            end
            object ppFlashRptDBText77: TppDBText
              UserName = 'ppFlashRptDBText77'
              DataField = 'AVGDAILYRATE'
              DataPipeline = ppDatas
              DisplayFormat = '$#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 104246
              mmTop = 794
              mmWidth = 15610
              BandType = 4
            end
            object ppFlashRptChildReport5DBText5: TppDBText
              UserName = 'ppFlashRptChildReport5DBText5'
              DataField = 'ROOMREVPAR'
              DataPipeline = ppDatas
              DisplayFormat = '$#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 135467
              mmTop = 794
              mmWidth = 15610
              BandType = 4
            end
            object ppFlashRptChildReport5DBText6: TppDBText
              UserName = 'ppFlashRptChildReport5DBText6'
              DataField = 'TOTGUESTS'
              DataPipeline = ppDatas
              DisplayFormat = '0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 165894
              mmTop = 794
              mmWidth = 8996
              BandType = 4
            end
            object ppFlashRptChildReport5DBText7: TppDBText
              UserName = 'ppFlashRptChildReport5DBText7'
              DataField = 'DEMANDTAG'
              DataPipeline = ppDatas
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 184415
              mmTop = 794
              mmWidth = 4763
              BandType = 4
            end
          end
          object ppFlashRptSummaryBand1: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 2381
            mmPrintPosition = 0
          end
        end
      end
      object ppFlashRptCO: TppSubReport
        UserName = 'ppFlashRptCO'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = ppFlashRpt4DayFore
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 155575
        mmWidth = 203200
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppFlashRptChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppComplimentary
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Version = '5.5'
          mmColumnWidth = 0
          object ppFlashRptChildReport2TitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 7938
            mmPrintPosition = 0
            object ppFlashRptChildReport2Shape1: TppShape
              UserName = 'ppFlashRptChildReport2Shape1'
              Brush.Color = clSilver
              ShiftWithParent = True
              mmHeight = 5292
              mmLeft = 0
              mmTop = 2381
              mmWidth = 203200
              BandType = 1
            end
            object lblComplimentaryRooms: TppLabel
              UserName = 'lblComplimentaryRooms'
              Caption = 'COMPLIMENTARY ROOMS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 794
              mmTop = 3175
              mmWidth = 45244
              BandType = 1
            end
            object ppFlashRptChildReport2Label2: TppLabel
              UserName = 'ppFlashRptChildReport2Label2'
              Caption = 'CH-IN'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 79375
              mmTop = 3175
              mmWidth = 10583
              BandType = 1
            end
            object ppFlashRptChildReport2Label3: TppLabel
              UserName = 'ppFlashRptChildReport2Label3'
              Caption = 'CH-OUT'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 95779
              mmTop = 3175
              mmWidth = 14023
              BandType = 1
            end
            object ppFlashRptChildReport2Label4: TppLabel
              UserName = 'ppFlashRptChildReport2Label4'
              Caption = 'COMPANY'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 145521
              mmTop = 3175
              mmWidth = 17992
              BandType = 1
            end
          end
          object ppFlashRptChildReport2DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppFlashRptChildReport2Line2: TppLine
              UserName = 'ppFlashRptChildReport2Line2'
              Position = lpBottom
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 5027
              mmWidth = 203200
              BandType = 4
            end
            object ppFlashRptChildReport2DBText1: TppDBText
              UserName = 'ppFlashRptChildReport2DBText1'
              DataField = 'CODUH'
              DataPipeline = ppComplimentary
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3704
              mmLeft = 794
              mmTop = 794
              mmWidth = 12171
              BandType = 4
            end
            object ppFlashRptChildReport2DBText2: TppDBText
              UserName = 'ppFlashRptChildReport2DBText2'
              DataField = 'NOMEHOSPEDE'
              DataPipeline = ppComplimentary
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3704
              mmLeft = 13758
              mmTop = 794
              mmWidth = 60325
              BandType = 4
            end
            object ppFlashRptChildReport2DBText3: TppDBText
              UserName = 'ppFlashRptChildReport2DBText3'
              DataField = 'CHEGADA'
              DataPipeline = ppComplimentary
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 76729
              mmTop = 794
              mmWidth = 16139
              BandType = 4
            end
            object ppFlashRptChildReport2DBText4: TppDBText
              UserName = 'ppFlashRptChildReport2DBText4'
              DataField = 'PARTIDA'
              DataPipeline = ppComplimentary
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 94986
              mmTop = 794
              mmWidth = 16139
              BandType = 4
            end
            object ppFlashRptChildReport2DBText5: TppDBText
              UserName = 'ppFlashRptChildReport2DBText5'
              DataField = 'RAZAOSOCIAL'
              DataPipeline = ppComplimentary
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3704
              mmLeft = 114829
              mmTop = 794
              mmWidth = 86254
              BandType = 4
            end
          end
          object ppFlashRptChildReport2SummaryBand1: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 265
            mmPrintPosition = 0
          end
        end
      end
      object ppFlashRptHU: TppSubReport
        UserName = 'ppFlashRptHU'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = ppFlashRptCO
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 161661
        mmWidth = 203200
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppFlashRptChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppHouseUse
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Version = '5.5'
          mmColumnWidth = 0
          object ppFlashRptTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 8202
            mmPrintPosition = 0
            object ppFlashRptChildReport3Shape1: TppShape
              UserName = 'ppFlashRptChildReport3Shape1'
              Brush.Color = clSilver
              ShiftWithParent = True
              mmHeight = 5292
              mmLeft = 0
              mmTop = 2381
              mmWidth = 203200
              BandType = 1
            end
            object lblHouseUse: TppLabel
              UserName = 'lblHouseUse'
              Caption = 'HOUSE USE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 794
              mmTop = 3175
              mmWidth = 20108
              BandType = 1
            end
            object ppFlashRptLabel9: TppLabel
              UserName = 'ppFlashRptLabel9'
              Caption = 'CH-IN'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 78846
              mmTop = 3175
              mmWidth = 10583
              BandType = 1
            end
            object ppFlashRptLabel17: TppLabel
              UserName = 'ppFlashRptLabel17'
              Caption = 'CH-OUT'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 95515
              mmTop = 3175
              mmWidth = 14023
              BandType = 1
            end
            object ppFlashRptLabel25: TppLabel
              UserName = 'ppFlashRptLabel25'
              Caption = 'COMPANY'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 145786
              mmTop = 3175
              mmWidth = 17992
              BandType = 1
            end
          end
          object ppFlashRptDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppFlashRptLine7: TppLine
              UserName = 'ppFlashRptLine7'
              Position = lpBottom
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 5027
              mmWidth = 203200
              BandType = 4
            end
            object ppFlashRptChildReport3DBText1: TppDBText
              UserName = 'ppFlashRptChildReport3DBText1'
              DataField = 'CODUH'
              DataPipeline = ppHouseUse
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3704
              mmLeft = 794
              mmTop = 794
              mmWidth = 12171
              BandType = 4
            end
            object ppFlashRptChildReport3DBText2: TppDBText
              UserName = 'ppFlashRptChildReport3DBText2'
              DataField = 'NOMEHOSPEDE'
              DataPipeline = ppHouseUse
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3704
              mmLeft = 13758
              mmTop = 794
              mmWidth = 60325
              BandType = 4
            end
            object ppFlashRptChildReport3DBText3: TppDBText
              UserName = 'ppFlashRptChildReport3DBText3'
              DataField = 'CHEGADA'
              DataPipeline = ppHouseUse
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 76729
              mmTop = 794
              mmWidth = 16139
              BandType = 4
            end
            object ppFlashRptChildReport3DBText4: TppDBText
              UserName = 'ppFlashRptChildReport3DBText4'
              DataField = 'PARTIDA'
              DataPipeline = ppHouseUse
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 94986
              mmTop = 794
              mmWidth = 16139
              BandType = 4
            end
            object ppFlashRptChildReport3DBText5: TppDBText
              UserName = 'ppFlashRptChildReport3DBText5'
              DataField = 'RAZAOSOCIAL'
              DataPipeline = ppHouseUse
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3704
              mmLeft = 114829
              mmTop = 794
              mmWidth = 87842
              BandType = 4
            end
          end
          object ppFlashRptSummaryBand2: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 265
            mmPrintPosition = 0
          end
        end
      end
      object ppFlashRptOutOrder: TppSubReport
        UserName = 'ppFlashRptOutOrder'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = ppFlashRptHU
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 167746
        mmWidth = 203200
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppFlashRptChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = ppOutOrder
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Version = '5.5'
          mmColumnWidth = 0
          object ppFlashRptTitleBand5: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 7408
            mmPrintPosition = 0
            object ppFlashRptShape5: TppShape
              UserName = 'ppFlashRptShape5'
              Brush.Color = clSilver
              ShiftWithParent = True
              mmHeight = 5292
              mmLeft = 0
              mmTop = 1588
              mmWidth = 203200
              BandType = 1
            end
            object ppFlashRptLabel4: TppLabel
              UserName = 'ppFlashRptLabel4'
              Caption = 'OUT OF ORDER ROOMS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 5292
              mmTop = 2381
              mmWidth = 39952
              BandType = 1
            end
            object ppFlashRptLabel26: TppLabel
              UserName = 'ppFlashRptLabel26'
              Caption = 'UNTIL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 50006
              mmTop = 2381
              mmWidth = 11377
              BandType = 1
            end
            object ppFlashRptLabel28: TppLabel
              UserName = 'ppFlashRptLabel28'
              Caption = 'REASON'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Garamond'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 66940
              mmTop = 2381
              mmWidth = 14552
              BandType = 1
            end
          end
          object ppFlashRptDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppFlashRptLine6: TppLine
              UserName = 'ppFlashRptLine6'
              Position = lpBottom
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 5027
              mmWidth = 203200
              BandType = 4
            end
            object ppFlashRptChildReport4DBText1: TppDBText
              UserName = 'ppFlashRptChildReport4DBText1'
              DataField = 'CODUH'
              DataPipeline = ppOutOrder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 15346
              mmTop = 529
              mmWidth = 14817
              BandType = 4
            end
            object ppFlashRptChildReport4DBText2: TppDBText
              UserName = 'ppFlashRptChildReport4DBText2'
              DataField = 'DATAFIM'
              DataPipeline = ppOutOrder
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 47096
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppFlashRptChildReport4DBText3: TppDBText
              UserName = 'ppFlashRptChildReport4DBText3'
              DataField = 'MOTIVO'
              DataPipeline = ppOutOrder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3704
              mmLeft = 67204
              mmTop = 529
              mmWidth = 135732
              BandType = 4
            end
          end
          object ppFlashRptSummaryBand5: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 265
            mmPrintPosition = 0
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 203200
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel3'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1852
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1852
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppFlashRptSummaryBand4: TppSummaryBand
      BeforePrint = ppFlashRptSummaryBand4BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppFlashRptShape6: TppShape
        UserName = 'ppFlashRptShape6'
        Brush.Color = clSilver
        mmHeight = 5821
        mmLeft = 265
        mmTop = 794
        mmWidth = 202936
        BandType = 7
      end
      object ppFlashRptLabel5: TppLabel
        UserName = 'ppFlashRptLabel5'
        Caption = 'Manager'#39's Comments'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Garamond'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 1852
        mmWidth = 32015
        BandType = 7
      end
      object ppRptComments: TppMemo
        UserName = 'ppRptComments'
        Caption = 'ppRptComments'
        CharWrap = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 5292
        mmLeft = 1058
        mmTop = 7408
        mmWidth = 202142
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
  end
  object ppLinhaDeptRev: TppBDEPipeline
    DataSource = dsLinhaDeptRev
    UserName = 'LinhaDeptRev'
    Left = 141
    Top = 128
  end
  object dsLinhaDeptRev: TwwDataSource
    DataSet = qryLinhaDeptRev
    Left = 79
    Top = 128
  end
  object ppComplimentary: TppBDEPipeline
    DataSource = dsComplimentary
    UserName = 'Complimentary'
    Left = 141
    Top = 184
  end
  object dsComplimentary: TwwDataSource
    DataSet = qryComplimentary
    Left = 79
    Top = 184
  end
  object qryComplimentary: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(M.DATACHEGREAL, R.DATACHEGPREVISTA) AS CHEGADA,'
      '       NVL(M.DATAPARTREAL, R.DATAPARTPREVISTA) AS PARTIDA,'
      '       R.NUMRESERVA,'
      '       R.CODUH,'
      '       R.STATUSRESERVA,'
      '       P.RAZAOSOCIAL,'
      '       TH.CODREDUZIDO AS TPHOSPEDE,'
      '       H.SOBRENOME ||'#39', '#39'|| H.NOME AS NOMEHOSPEDE'
      'FROM HOSPEDE H, PESSOA P, RESERVASFRONT R,'
      '     MOVIMENTOHOSPEDES M, TIPOHOSPEDE TH'
      'WHERE  (R.IDHOTEL = :IDHOTEL) AND'
      '(R.DATACHEGPREVISTA <= :DATAHOJE) AND'
      '(R.DATAPARTPREVISTA > :DATAHOJE) AND'
      '(TH.TIPOGRATUIDADE = :TIPO) AND'
      '(R.IDHOTEL=TH.IDHOTEL)  AND'
      '(TH.IDTIPOHOSPEDE=M.IDTIPOHOSPEDE) AND'
      '(M.IDRESERVASFRONT=R.IDRESERVASFRONT) AND'
      '(H.IDHOSPEDE= M.IDHOSPEDE) AND'
      '(P.IDPESSOA(+)=R.CLIENTERESERVANTE)'
      'ORDER BY R.CODUH')
    ValidateWithMask = True
    Left = 18
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end>
    object qryComplimentaryCHEGADA: TDateTimeField
      FieldName = 'CHEGADA'
    end
    object qryComplimentaryPARTIDA: TDateTimeField
      FieldName = 'PARTIDA'
    end
    object qryComplimentaryNUMRESERVA: TFloatField
      FieldName = 'NUMRESERVA'
    end
    object qryComplimentaryCODUH: TStringField
      FieldName = 'CODUH'
      Size = 8
    end
    object qryComplimentarySTATUSRESERVA: TFloatField
      FieldName = 'STATUSRESERVA'
    end
    object qryComplimentaryRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryComplimentaryTPHOSPEDE: TStringField
      FieldName = 'TPHOSPEDE'
      Size = 4
    end
    object qryComplimentaryNOMEHOSPEDE: TStringField
      FieldName = 'NOMEHOSPEDE'
      Size = 52
    end
  end
  object ppHouseUse: TppBDEPipeline
    DataSource = dsHouseUse
    UserName = 'HouseUse'
    Left = 141
    Top = 240
  end
  object dsHouseUse: TwwDataSource
    DataSet = qryHouseUse
    Left = 79
    Top = 240
  end
  object qryHouseUse: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(M.DATACHEGREAL, R.DATACHEGPREVISTA) AS CHEGADA,'
      '       NVL(M.DATAPARTREAL, R.DATAPARTPREVISTA) AS PARTIDA,'
      '       R.NUMRESERVA,'
      '       R.CODUH,'
      '       R.STATUSRESERVA,'
      '       P.RAZAOSOCIAL,'
      '       TH.CODREDUZIDO AS TPHOSPEDE,'
      '       H.SOBRENOME ||'#39', '#39'|| H.NOME AS NOMEHOSPEDE'
      'FROM HOSPEDE H, PESSOA P, RESERVASFRONT R,'
      '     MOVIMENTOHOSPEDES M, TIPOHOSPEDE TH'
      'WHERE  (R.IDHOTEL = :IDHOTEL) AND'
      '(R.DATACHEGPREVISTA <= :DATAHOJE) AND'
      '(R.DATAPARTPREVISTA > :DATAHOJE) AND'
      '(TH.TIPOGRATUIDADE = :TIPO) AND'
      '(R.IDHOTEL=TH.IDHOTEL)  AND'
      '(TH.IDTIPOHOSPEDE=M.IDTIPOHOSPEDE) AND'
      '(M.IDRESERVASFRONT=R.IDRESERVASFRONT) AND'
      '(H.IDHOSPEDE= M.IDHOSPEDE) AND'
      '(P.IDPESSOA(+)=R.CLIENTERESERVANTE)'
      'ORDER BY R.CODUH')
    ValidateWithMask = True
    Left = 18
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end>
    object qryHouseUseCHEGADA: TDateTimeField
      FieldName = 'CHEGADA'
    end
    object qryHouseUsePARTIDA: TDateTimeField
      FieldName = 'PARTIDA'
    end
    object qryHouseUseNUMRESERVA: TFloatField
      FieldName = 'NUMRESERVA'
    end
    object qryHouseUseCODUH: TStringField
      FieldName = 'CODUH'
      Size = 8
    end
    object qryHouseUseSTATUSRESERVA: TFloatField
      FieldName = 'STATUSRESERVA'
    end
    object qryHouseUseRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryHouseUseTPHOSPEDE: TStringField
      FieldName = 'TPHOSPEDE'
      Size = 4
    end
    object qryHouseUseNOMEHOSPEDE: TStringField
      FieldName = 'NOMEHOSPEDE'
      Size = 52
    end
  end
  object ppOutOrder: TppBDEPipeline
    DataSource = dsOutOrder
    UserName = 'OutOrder'
    Left = 141
    Top = 296
  end
  object dsOutOrder: TwwDataSource
    DataSet = qryOutOrder
    Left = 79
    Top = 296
  end
  object qryOutOrder: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select :DATA AS DATAAVAL,'
      '       B.CODUH, B.DATAFIM,'
      '       B.DESCRICAO AS OBSERVACAO, M.DESCRICAO AS MOTIVO'
      'from BLOQUEIOUH B, BLOQUEIOUHXMOTIVO BM, MOTIVOSFRONT M'
      'where'
      '    B.IDHOTEL = :IDHOTEL'
      'AND B.DATAINICIO <= :DATA'
      'AND B.DATAFIM > :DATA'
      'AND B.IDHOTEL = BM.IDHOTEL'
      'AND B.IDBLOQUEIOUH = BM.IDBLOQUEIOUH'
      'AND B.CODUH = BM.CODUH'
      'AND BM.IDMOTIVO = M.IDMOTIVO'
      'AND ('
      '(B.CODUH IN (SELECT U.CODUH FROM UH U WHERE U.CODUH = B.CODUH'
      '             AND U.IDHOTEL = B.IDHOTEL AND U.UHPOOL = '#39'S'#39')) OR'
      
        '(B.CODUH IN (SELECT PF.CODUH FROM POOLFLUTUANTE PF WHERE PF.CODU' +
        'H = B.CODUH'
      '             AND PF.IDHOTEL = B.IDHOTEL AND'
      '             PF.DATAINICIO <= :DATA AND PF.DATAFIM > :DATA ))'
      ')'
      'ORDER BY CODUH')
    ValidateWithMask = True
    Left = 18
    Top = 296
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end>
    object qryOutOrderDATAAVAL: TMemoField
      FieldName = 'DATAAVAL'
      BlobType = ftMemo
      Size = 2000
    end
    object qryOutOrderCODUH: TStringField
      FieldName = 'CODUH'
      FixedChar = True
      Size = 8
    end
    object qryOutOrderDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
    end
    object qryOutOrderOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 60
    end
    object qryOutOrderMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 60
    end
  end
  object ppEstatHotel: TppBDEPipeline
    DataSource = dsEstatHotel
    UserName = 'EstatHotel'
    Left = 397
    Top = 16
    object ppEstatHotelppField1: TppField
      FieldAlias = 'QTDEDAYUSEHOJE'
      FieldName = 'QTDEDAYUSEHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField2: TppField
      FieldAlias = 'QTDEDAYUSECOBHOJE'
      FieldName = 'QTDEDAYUSECOBHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField3: TppField
      FieldAlias = 'QTDEUHCORTESIAHOJE'
      FieldName = 'QTDEUHCORTESIAHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField4: TppField
      FieldAlias = 'QTDEUHNOSHOWHOJE'
      FieldName = 'QTDEUHNOSHOWHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField5: TppField
      FieldAlias = 'QTDEUHNOSHOWCOBHOJE'
      FieldName = 'QTDEUHNOSHOWCOBHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField6: TppField
      FieldAlias = 'QTDEEXTENSOESHOJE'
      FieldName = 'QTDEEXTENSOESHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField7: TppField
      FieldAlias = 'QTDERESERVASHOJE'
      FieldName = 'QTDERESERVASHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField8: TppField
      FieldAlias = 'QTDEUHWALKINHOJE'
      FieldName = 'QTDEUHWALKINHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField9: TppField
      FieldAlias = 'QTDECHEGADASHOJE'
      FieldName = 'QTDECHEGADASHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField10: TppField
      FieldAlias = 'QTDEUSOCASAHOJE'
      FieldName = 'QTDEUSOCASAHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField11: TppField
      FieldAlias = 'QTDEOCUPADOHOJE'
      FieldName = 'QTDEOCUPADOHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField12: TppField
      FieldAlias = 'QTDEUHINDHOJE'
      FieldName = 'QTDEUHINDHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField13: TppField
      FieldAlias = 'QTDEUHGRPHOJE'
      FieldName = 'QTDEUHGRPHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField14: TppField
      FieldAlias = 'QTDEHOSPEDEREPETEHOJE'
      FieldName = 'QTDEHOSPEDEREPETEHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField15: TppField
      FieldAlias = 'QTDECOUVERTHOJE'
      FieldName = 'QTDECOUVERTHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField16: TppField
      FieldAlias = 'QTDEPICKUPHOJE'
      FieldName = 'QTDEPICKUPHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField17: TppField
      FieldAlias = 'QTDEBLOQUEADOHOJE'
      FieldName = 'QTDEBLOQUEADOHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField18: TppField
      FieldAlias = 'QTDESAIANTECIPADAHOJE'
      FieldName = 'QTDESAIANTECIPADAHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField19: TppField
      FieldAlias = 'TOTALUHSHOJE'
      FieldName = 'TOTALUHSHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField20: TppField
      FieldAlias = 'TOTDISPUHSHOJE'
      FieldName = 'TOTDISPUHSHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField21: TppField
      FieldAlias = 'QTDHOSPEDESHOJE'
      FieldName = 'QTDHOSPEDESHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField22: TppField
      FieldAlias = 'QTDEDAYUSE'
      FieldName = 'QTDEDAYUSE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField23: TppField
      FieldAlias = 'QTDEDAYUSECOB'
      FieldName = 'QTDEDAYUSECOB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField24: TppField
      FieldAlias = 'QTDEUHCORTESIA'
      FieldName = 'QTDEUHCORTESIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField25: TppField
      FieldAlias = 'QTDEUHNOSHOW'
      FieldName = 'QTDEUHNOSHOW'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField26: TppField
      FieldAlias = 'QTDEUHNOSHOWCOB'
      FieldName = 'QTDEUHNOSHOWCOB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField27: TppField
      FieldAlias = 'QTDEEXTENSOES'
      FieldName = 'QTDEEXTENSOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField28: TppField
      FieldAlias = 'QTDERESERVAS'
      FieldName = 'QTDERESERVAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField29: TppField
      FieldAlias = 'QTDEUHWALKIN'
      FieldName = 'QTDEUHWALKIN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField30: TppField
      FieldAlias = 'QTDECHEGADAS'
      FieldName = 'QTDECHEGADAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField31: TppField
      FieldAlias = 'QTDEUSOCASA'
      FieldName = 'QTDEUSOCASA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField32: TppField
      FieldAlias = 'QTDEOCUPADO'
      FieldName = 'QTDEOCUPADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField33: TppField
      FieldAlias = 'QTDEUHIND'
      FieldName = 'QTDEUHIND'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField34: TppField
      FieldAlias = 'QTDEUHGRP'
      FieldName = 'QTDEUHGRP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField35: TppField
      FieldAlias = 'QTDEHOSPEDEREPETE'
      FieldName = 'QTDEHOSPEDEREPETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField36: TppField
      FieldAlias = 'QTDECOUVERT'
      FieldName = 'QTDECOUVERT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField37: TppField
      FieldAlias = 'QTDEPICKUP'
      FieldName = 'QTDEPICKUP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField38: TppField
      FieldAlias = 'QTDEBLOQUEADO'
      FieldName = 'QTDEBLOQUEADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField39: TppField
      FieldAlias = 'QTDESAIANTECIPADA'
      FieldName = 'QTDESAIANTECIPADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField40: TppField
      FieldAlias = 'TOTALUHS'
      FieldName = 'TOTALUHS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField41: TppField
      FieldAlias = 'TOTDISPUHS'
      FieldName = 'TOTDISPUHS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField42: TppField
      FieldAlias = 'QTDHOSPEDES'
      FieldName = 'QTDHOSPEDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField43: TppField
      FieldAlias = 'QTDESELLABLEROOMS'
      FieldName = 'QTDESELLABLEROOMS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField44: TppField
      FieldAlias = 'QTDESELLABLEROOMSHOJE'
      FieldName = 'QTDESELLABLEROOMSHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField45: TppField
      FieldAlias = 'QTDEROOMSPAID'
      FieldName = 'QTDEROOMSPAID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField46: TppField
      FieldAlias = 'QTDEROOMSPAIDHOJE'
      FieldName = 'QTDEROOMSPAIDHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField47: TppField
      FieldAlias = 'QTDEOCCUPIEDROOMS'
      FieldName = 'QTDEOCCUPIEDROOMS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField48: TppField
      FieldAlias = 'QTDEOCCUPIEDROOMSHOJE'
      FieldName = 'QTDEOCCUPIEDROOMSHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField49: TppField
      FieldAlias = 'PERCOCCUPANCYHOJE'
      FieldName = 'PERCOCCUPANCYHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField50: TppField
      FieldAlias = 'PERCOCCUPANCY'
      FieldName = 'PERCOCCUPANCY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField51: TppField
      FieldAlias = 'GROUPRNCHOJE'
      FieldName = 'GROUPRNCHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField52: TppField
      FieldAlias = 'GROUPRNC'
      FieldName = 'GROUPRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField53: TppField
      FieldAlias = 'GROUPADRHOJE'
      FieldName = 'GROUPADRHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField54: TppField
      FieldAlias = 'GROUPADR'
      FieldName = 'GROUPADR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField55: TppField
      FieldAlias = 'TRANSIENTRNCHOJE'
      FieldName = 'TRANSIENTRNCHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField56: TppField
      FieldAlias = 'TRANSIENTRNC'
      FieldName = 'TRANSIENTRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField57: TppField
      FieldAlias = 'TRANSIENTADRHOJE'
      FieldName = 'TRANSIENTADRHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField58: TppField
      FieldAlias = 'TRANSIENTADR'
      FieldName = 'TRANSIENTADR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField59: TppField
      FieldAlias = 'REPEATGUESTRNCHOJE'
      FieldName = 'REPEATGUESTRNCHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField60: TppField
      FieldAlias = 'REPEATGUESTRNC'
      FieldName = 'REPEATGUESTRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField61: TppField
      FieldAlias = 'CHOICERSHOJE'
      FieldName = 'CHOICERSHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField62: TppField
      FieldAlias = 'CHOICERS'
      FieldName = 'CHOICERS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 61
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField63: TppField
      FieldAlias = 'CHOICERSRNCHOJE'
      FieldName = 'CHOICERSRNCHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 62
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField64: TppField
      FieldAlias = 'CHOICERSRNC'
      FieldName = 'CHOICERSRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 63
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField65: TppField
      FieldAlias = 'STAYOVERSRNCHOJE'
      FieldName = 'STAYOVERSRNCHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 64
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField66: TppField
      FieldAlias = 'STAYOVERSRNC'
      FieldName = 'STAYOVERSRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 65
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField67: TppField
      FieldAlias = 'EARLYDEPLRNCHOJE'
      FieldName = 'EARLYDEPLRNCHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 66
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField68: TppField
      FieldAlias = 'EARLYDEPLRNC'
      FieldName = 'EARLYDEPLRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 67
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField69: TppField
      FieldAlias = 'PICKUPRNCHOJE'
      FieldName = 'PICKUPRNCHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 68
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField70: TppField
      FieldAlias = 'PICKUPRNC'
      FieldName = 'PICKUPRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 69
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField71: TppField
      FieldAlias = 'UHWALKINRNCHOJE'
      FieldName = 'UHWALKINRNCHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 70
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField72: TppField
      FieldAlias = 'UHWALKINRNC'
      FieldName = 'UHWALKINRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 71
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField73: TppField
      FieldAlias = 'NOSHOWLRNCHOJE'
      FieldName = 'NOSHOWLRNCHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 72
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField74: TppField
      FieldAlias = 'NOSHOWLRNC'
      FieldName = 'NOSHOWLRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 73
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField75: TppField
      FieldAlias = 'GUESTPEROCPROOMHOJE'
      FieldName = 'GUESTPEROCPROOMHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 74
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField76: TppField
      FieldAlias = 'GUESTPEROCPROOM'
      FieldName = 'GUESTPEROCPROOM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 75
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField77: TppField
      FieldAlias = 'AVGLENGTHSTAYHOJE'
      FieldName = 'AVGLENGTHSTAYHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 76
      Searchable = False
      Sortable = False
    end
    object ppEstatHotelppField78: TppField
      FieldAlias = 'AVGLENGTHSTAY'
      FieldName = 'AVGLENGTHSTAY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 77
      Searchable = False
      Sortable = False
    end
  end
  object dsEstatHotel: TwwDataSource
    DataSet = qryEstatHotel
    Left = 335
    Top = 16
  end
  object qryEstatHotel: TwwQuery
    OnCalcFields = qryEstatHotelCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ''
      '-- Estatística Hoje'
      ''
      
        '   SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDEUHCORTESIA, 0' +
        ')) AS QTDEUHCORTESIAHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDEUHNOSHOW, 0))' +
        ' AS QTDEUHNOSHOWHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDEUHNOSHOWCOB, ' +
        '0)) AS QTDEUHNOSHOWCOBHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDEEXTENSOES, 0)' +
        ') AS QTDEEXTENSOESHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDERESERVAS, 0))' +
        ' AS QTDERESERVASHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDEUHWALKIN, 0))' +
        ' AS QTDEUHWALKINHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDEDAYUSE, 0)) A' +
        'S QTDEDAYUSEHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDEDAYUSECOB, 0)' +
        ') AS QTDEDAYUSECOBHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDECHEGADAS, 0))' +
        ' AS QTDECHEGADASHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDEUSOCASA, 0)) ' +
        'AS QTDEUSOCASAHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDEOCUPADO, 0)) ' +
        'AS QTDEOCUPADOHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDEHOSPEDEREPETE' +
        ', 0)) AS QTDEHOSPEDEREPETEHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDECOUVERT, 0)) ' +
        'AS QTDECOUVERTHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDEPICKUP, 0)) A' +
        'S QTDEPICKUPHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDEBLOQUEADO, 0)' +
        ') AS QTDEBLOQUEADOHOJE'
      
        ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDESAIANTECIPADA' +
        ', 0)) AS QTDESAIANTECIPADAHOJE '
      ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE,'
      
        '      (EH.QTDEVAGOLIMPO + EH.QTDEVAGOSUJO + EH.QTDEOCUPADO + EH.' +
        'QTDEBLOQUEADO),0)) AS TOTALUHSHOJE'
      ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE,'
      
        '        (EH.QTDEVAGOLIMPO + EH.QTDEVAGOSUJO),0)) AS TOTDISPUHSHO' +
        'JE'
      ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE,'
      
        '        (EH.QTDEADULTOS + EH.QTDECRIANCAS1 + EH.QTDECRIANCAS2),0' +
        ')) AS QTDHOSPEDESHOJE'
      ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE,'
      
        '         DECODE(EH.IDORIGEM,:ORIGEM,(EH.QTDEOCUPADO-EH.QTDEUSOCA' +
        'SA),0),0)) AS CHOICERSHOJE'
      ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE,'
      
        '       DECODE(EH.TIPOREG,'#39'I'#39',(EH.QTDEOCUPADO-EH.QTDEUSOCASA),0),' +
        '0)) AS QTDEUHINDHOJE'
      ' , SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE,'
      
        '      DECODE(EH.TIPOREG,'#39'G'#39',(EH.QTDEOCUPADO-EH.QTDEUSOCASA),0),0' +
        ')) AS QTDEUHGRPHOJE'
      ''
      '-- Estatística Acumulada'
      ''
      ' , SUM(EH.QTDEUHCORTESIA) AS QTDEUHCORTESIA'
      ' , SUM(EH.QTDEUHNOSHOW) AS QTDEUHNOSHOW'
      ' , SUM(EH.QTDEUHNOSHOWCOB) AS QTDEUHNOSHOWCOB'
      ' , SUM(EH.QTDEEXTENSOES) AS QTDEEXTENSOES'
      ' , SUM(EH.QTDERESERVAS) AS QTDERESERVAS'
      ' , SUM(EH.QTDEUHWALKIN) AS QTDEUHWALKIN'
      ' , SUM(EH.QTDEDAYUSE) AS QTDEDAYUSE'
      ' , SUM(EH.QTDEDAYUSECOB) AS QTDEDAYUSECOB'
      ' , SUM(EH.QTDECHEGADAS) AS QTDECHEGADAS'
      ' , SUM(EH.QTDEUSOCASA) AS QTDEUSOCASA'
      ' , SUM(EH.QTDEOCUPADO) AS QTDEOCUPADO'
      ' , SUM(EH.QTDEHOSPEDEREPETE) AS QTDEHOSPEDEREPETE'
      ' , SUM(EH.QTDECOUVERT) AS QTDECOUVERT'
      ' , SUM(EH.QTDEPICKUP) AS QTDEPICKUP'
      ' , SUM(EH.QTDEBLOQUEADO) AS QTDEBLOQUEADO'
      ' , SUM(EH.QTDESAIANTECIPADA) AS QTDESAIANTECIPADA '
      
        ' , SUM((EH.QTDEVAGOLIMPO + EH.QTDEVAGOSUJO + EH.QTDEOCUPADO + EH' +
        '.QTDEBLOQUEADO)) AS TOTALUHS'
      ' , SUM((EH.QTDEVAGOLIMPO + EH.QTDEVAGOSUJO)) AS TOTDISPUHS'
      
        ' , SUM((EH.QTDEADULTOS + EH.QTDECRIANCAS1 + EH.QTDECRIANCAS2))  ' +
        'AS QTDHOSPEDES'
      
        ' , SUM(DECODE(EH.IDORIGEM,:ORIGEM,(EH.QTDEOCUPADO-EH.QTDEUSOCASA' +
        '),0)) AS CHOICERS'
      
        ' , SUM(DECODE(EH.TIPOREG,'#39'I'#39',(EH.QTDEOCUPADO-EH.QTDEUSOCASA),0))' +
        ' AS QTDEUHIND'
      
        ' , SUM(DECODE(EH.TIPOREG,'#39'G'#39',(EH.QTDEOCUPADO-EH.QTDEUSOCASA),0))' +
        ' AS QTDEUHGRP'
      'from'
      '                       ESTHOTEL EH'
      'where                 (EH.DATAREFERENCIA >= :DATAINI)'
      'AND                   (EH.DATAREFERENCIA < :DATAFIM)'
      'AND                   (to_char(EH.IDHOTEL)= to_char(:IDHOTEL))'
      '')
    ValidateWithMask = True
    Left = 274
    Top = 16
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryEstatHotelQTDEDAYUSEHOJE: TFloatField
      FieldName = 'QTDEDAYUSEHOJE'
    end
    object qryEstatHotelQTDEDAYUSECOBHOJE: TFloatField
      FieldName = 'QTDEDAYUSECOBHOJE'
    end
    object qryEstatHotelQTDEUHCORTESIAHOJE: TFloatField
      FieldName = 'QTDEUHCORTESIAHOJE'
    end
    object qryEstatHotelQTDEUHNOSHOWHOJE: TFloatField
      FieldName = 'QTDEUHNOSHOWHOJE'
    end
    object qryEstatHotelQTDEUHNOSHOWCOBHOJE: TFloatField
      FieldName = 'QTDEUHNOSHOWCOBHOJE'
    end
    object qryEstatHotelQTDEEXTENSOESHOJE: TFloatField
      FieldName = 'QTDEEXTENSOESHOJE'
    end
    object qryEstatHotelQTDERESERVASHOJE: TFloatField
      FieldName = 'QTDERESERVASHOJE'
    end
    object qryEstatHotelQTDEUHWALKINHOJE: TFloatField
      FieldName = 'QTDEUHWALKINHOJE'
    end
    object qryEstatHotelQTDECHEGADASHOJE: TFloatField
      FieldName = 'QTDECHEGADASHOJE'
    end
    object qryEstatHotelQTDEUSOCASAHOJE: TFloatField
      FieldName = 'QTDEUSOCASAHOJE'
    end
    object qryEstatHotelQTDEOCUPADOHOJE: TFloatField
      FieldName = 'QTDEOCUPADOHOJE'
    end
    object qryEstatHotelQTDEUHINDHOJE: TFloatField
      FieldName = 'QTDEUHINDHOJE'
    end
    object qryEstatHotelQTDEUHGRPHOJE: TFloatField
      FieldName = 'QTDEUHGRPHOJE'
    end
    object qryEstatHotelQTDEHOSPEDEREPETEHOJE: TFloatField
      FieldName = 'QTDEHOSPEDEREPETEHOJE'
    end
    object qryEstatHotelQTDECOUVERTHOJE: TFloatField
      FieldName = 'QTDECOUVERTHOJE'
    end
    object qryEstatHotelQTDEPICKUPHOJE: TFloatField
      FieldName = 'QTDEPICKUPHOJE'
    end
    object qryEstatHotelQTDEBLOQUEADOHOJE: TFloatField
      FieldName = 'QTDEBLOQUEADOHOJE'
    end
    object qryEstatHotelQTDESAIANTECIPADAHOJE: TFloatField
      FieldName = 'QTDESAIANTECIPADAHOJE'
    end
    object qryEstatHotelTOTALUHSHOJE: TFloatField
      FieldName = 'TOTALUHSHOJE'
    end
    object qryEstatHotelTOTDISPUHSHOJE: TFloatField
      FieldName = 'TOTDISPUHSHOJE'
    end
    object qryEstatHotelQTDHOSPEDESHOJE: TFloatField
      FieldName = 'QTDHOSPEDESHOJE'
    end
    object qryEstatHotelQTDEDAYUSE: TFloatField
      FieldName = 'QTDEDAYUSE'
    end
    object qryEstatHotelQTDEDAYUSECOB: TFloatField
      FieldName = 'QTDEDAYUSECOB'
    end
    object qryEstatHotelQTDEUHCORTESIA: TFloatField
      FieldName = 'QTDEUHCORTESIA'
    end
    object qryEstatHotelQTDEUHNOSHOW: TFloatField
      FieldName = 'QTDEUHNOSHOW'
    end
    object qryEstatHotelQTDEUHNOSHOWCOB: TFloatField
      FieldName = 'QTDEUHNOSHOWCOB'
    end
    object qryEstatHotelQTDEEXTENSOES: TFloatField
      FieldName = 'QTDEEXTENSOES'
    end
    object qryEstatHotelQTDERESERVAS: TFloatField
      FieldName = 'QTDERESERVAS'
    end
    object qryEstatHotelQTDEUHWALKIN: TFloatField
      FieldName = 'QTDEUHWALKIN'
    end
    object qryEstatHotelQTDECHEGADAS: TFloatField
      FieldName = 'QTDECHEGADAS'
    end
    object qryEstatHotelQTDEUSOCASA: TFloatField
      FieldName = 'QTDEUSOCASA'
    end
    object qryEstatHotelQTDEOCUPADO: TFloatField
      FieldName = 'QTDEOCUPADO'
    end
    object qryEstatHotelQTDEUHIND: TFloatField
      FieldName = 'QTDEUHIND'
    end
    object qryEstatHotelQTDEUHGRP: TFloatField
      FieldName = 'QTDEUHGRP'
    end
    object qryEstatHotelQTDEHOSPEDEREPETE: TFloatField
      FieldName = 'QTDEHOSPEDEREPETE'
    end
    object qryEstatHotelQTDECOUVERT: TFloatField
      FieldName = 'QTDECOUVERT'
    end
    object qryEstatHotelQTDEPICKUP: TFloatField
      FieldName = 'QTDEPICKUP'
    end
    object qryEstatHotelQTDEBLOQUEADO: TFloatField
      FieldName = 'QTDEBLOQUEADO'
    end
    object qryEstatHotelQTDESAIANTECIPADA: TFloatField
      FieldName = 'QTDESAIANTECIPADA'
    end
    object qryEstatHotelTOTALUHS: TFloatField
      FieldName = 'TOTALUHS'
    end
    object qryEstatHotelTOTDISPUHS: TFloatField
      FieldName = 'TOTDISPUHS'
    end
    object qryEstatHotelQTDHOSPEDES: TFloatField
      FieldName = 'QTDHOSPEDES'
    end
    object qryEstatHotelQTDESELLABLEROOMS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'QTDESELLABLEROOMS'
      Calculated = True
    end
    object qryEstatHotelQTDESELLABLEROOMSHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'QTDESELLABLEROOMSHOJE'
      Calculated = True
    end
    object qryEstatHotelQTDEROOMSPAID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'QTDEROOMSPAID'
      Calculated = True
    end
    object qryEstatHotelQTDEROOMSPAIDHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'QTDEROOMSPAIDHOJE'
      Calculated = True
    end
    object qryEstatHotelQTDEOCCUPIEDROOMS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'QTDEOCCUPIEDROOMS'
      Calculated = True
    end
    object qryEstatHotelQTDEOCCUPIEDROOMSHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'QTDEOCCUPIEDROOMSHOJE'
      Calculated = True
    end
    object qryEstatHotelPERCOCCUPANCYHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PERCOCCUPANCYHOJE'
      Calculated = True
    end
    object qryEstatHotelPERCOCCUPANCY: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PERCOCCUPANCY'
      Calculated = True
    end
    object qryEstatHotelGROUPRNCHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'GROUPRNCHOJE'
      Calculated = True
    end
    object qryEstatHotelGROUPRNC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'GROUPRNC'
      Calculated = True
    end
    object qryEstatHotelGROUPADRHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'GROUPADRHOJE'
      Calculated = True
    end
    object qryEstatHotelGROUPADR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'GROUPADR'
      Calculated = True
    end
    object qryEstatHotelTRANSIENTRNCHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TRANSIENTRNCHOJE'
      Calculated = True
    end
    object qryEstatHotelTRANSIENTRNC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TRANSIENTRNC'
      Calculated = True
    end
    object qryEstatHotelTRANSIENTADRHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TRANSIENTADRHOJE'
      Calculated = True
    end
    object qryEstatHotelTRANSIENTADR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TRANSIENTADR'
      Calculated = True
    end
    object qryEstatHotelREPEATGUESTRNCHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'REPEATGUESTRNCHOJE'
      Calculated = True
    end
    object qryEstatHotelREPEATGUESTRNC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'REPEATGUESTRNC'
      Calculated = True
    end
    object qryEstatHotelCHOICERSHOJE: TFloatField
      FieldName = 'CHOICERSHOJE'
    end
    object qryEstatHotelCHOICERS: TFloatField
      FieldName = 'CHOICERS'
    end
    object qryEstatHotelCHOICERSRNCHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CHOICERSRNCHOJE'
      Calculated = True
    end
    object qryEstatHotelCHOICERSRNC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CHOICERSRNC'
      Calculated = True
    end
    object qryEstatHotelSTAYOVERSRNCHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'STAYOVERSRNCHOJE'
      Calculated = True
    end
    object qryEstatHotelSTAYOVERSRNC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'STAYOVERSRNC'
      Calculated = True
    end
    object qryEstatHotelEARLYDEPLRNCHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EARLYDEPLRNCHOJE'
      Calculated = True
    end
    object qryEstatHotelEARLYDEPLRNC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EARLYDEPLRNC'
      Calculated = True
    end
    object qryEstatHotelPICKUPRNCHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PICKUPRNCHOJE'
      Calculated = True
    end
    object qryEstatHotelPICKUPRNC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PICKUPRNC'
      Calculated = True
    end
    object qryEstatHotelUHWALKINRNCHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'UHWALKINRNCHOJE'
      Calculated = True
    end
    object qryEstatHotelUHWALKINRNC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'UHWALKINRNC'
      Calculated = True
    end
    object qryEstatHotelNOSHOWLRNCHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'NOSHOWLRNCHOJE'
      Calculated = True
    end
    object qryEstatHotelNOSHOWLRNC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'NOSHOWLRNC'
      Calculated = True
    end
    object qryEstatHotelGUESTPEROCPROOMHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'GUESTPEROCPROOMHOJE'
      Calculated = True
    end
    object qryEstatHotelGUESTPEROCPROOM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'GUESTPEROCPROOM'
      Calculated = True
    end
    object qryEstatHotelAVGLENGTHSTAYHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'AVGLENGTHSTAYHOJE'
      Calculated = True
    end
    object qryEstatHotelAVGLENGTHSTAY: TFloatField
      FieldKind = fkCalculated
      FieldName = 'AVGLENGTHSTAY'
      Calculated = True
    end
  end
  object qryDatas: TwwQuery
    OnCalcFields = qryDatasCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATA FROM DATASIS WHERE'
      '    DATA >= :DATAINI'
      'AND DATA < :DATAFIM'
      'AND IDHOTEL = :IDHOTEL'
      'ORDER BY DATA')
    ValidateWithMask = True
    Left = 272
    Top = 72
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryDatasDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryDatasCORTESIA: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CORTESIA'
      Calculated = True
    end
    object qryDatasUSOCASA: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'USOCASA'
      Calculated = True
    end
    object qryDatasTOTALGERAL2: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TOTALGERAL'
      Calculated = True
    end
    object qryDatasTOTALUHS: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TOTALUHS'
      Calculated = True
    end
    object qryDatasROOMREVPAR: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ROOMREVPAR'
      Calculated = True
    end
    object qryDatasAVGDAILYRATE: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'AVGDAILYRATE'
      Calculated = True
    end
    object qryDatasTOTGUESTS: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TOTGUESTS'
      Calculated = True
    end
    object qryDatasTOTOCPROOMS: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TOTOCPROOMS'
      Calculated = True
    end
    object qryDatasPERCOCCUP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PERCOCCUP'
      Calculated = True
    end
    object qryDatasDEMANDTAG: TStringField
      FieldKind = fkCalculated
      FieldName = 'DEMANDTAG'
      Calculated = True
    end
  end
  object ppDatas: TppBDEPipeline
    DataSource = dsDatas
    UserName = 'Datas'
    Left = 397
    Top = 72
  end
  object dsDatas: TwwDataSource
    DataSet = qryDatas
    Left = 335
    Top = 72
  end
  object qryOcupacaoGrp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select D.DATA,'
      'SUM(DECODE(RG.STATUSRESERVA,8,a.qtduh,0)) AS QTDTENTATIVA,'
      
        'SUM(DECODE(RG.STATUSRESERVA,8,0,DECODE(A.DATACHEGADA,DATA,A.QTDU' +
        'H))) as QTDCHEGADAS,'
      'SUM(DECODE(S.TIPOGRATUIDADE,'#39'U'#39',1,0)) AS QTDUSOCASA,'
      'SUM(DECODE(S.TIPOGRATUIDADE,'#39'C'#39',1,0)) AS QTDCORTESIA,'
      'SUM(DECODE(C.TIPOCONTRATO,'#39'P'#39',1,0)) AS QTDPERMUTAS,'
      'SUM(DECODE(C.TIPOCONTRATO,'#39'A'#39',0,'#39'P'#39',0,'
      
        'DECODE(S.TIPOGRATUIDADE,'#39'U'#39',0,'#39'C'#39',0,DECODE(RG.STATUSRESERVA,1,a.' +
        'qtduh,2,a.qtduh,0)))) as QTDGARANT,'
      'SUM(DECODE(C.TIPOCONTRATO,'#39'A'#39',0,'#39'P'#39',0,'
      
        'DECODE(S.TIPOGRATUIDADE,'#39'U'#39',0,'#39'C'#39',0,DECODE(RG.STATUSRESERVA,0,a.' +
        'qtduh,0)))) as QTDNAOGARANT,'
      'SUM(A.ADULTO*a.qtduh) AS QTDADULTOS,'
      'SUM(A.CRIANCA1*a.qtduh + A.CRIANCA2*a.qtduh) AS QTDCRIANCAS'
      
        'from  DATASIS D, SEGMENTO S, CONTRCLIHOTEL C, ACOMODACAO A, RESE' +
        'RVAGRUPO RG'
      'where'
      '    (D.DATA >= :DATAINI)'
      'AND (D.DATA < :DATAFIM)'
      'AND (D.IDHOTEL = :IDHOTEL)'
      'AND (RG.STATUSRESERVA <= 2 OR RG.STATUSRESERVA = 8)'
      'AND (A.IDHOTEL = D.IDHOTEL)'
      'AND (A.DATACHEGADA <= D.DATA)'
      'AND (A.DATAPARTIDA > D.DATA)'
      'AND (RG.IDRESERVAGRUPO = A.IDRESERVAGRUPO) '
      'AND (S.CODSEGMENTO = RG.CODSEGMENTO)'
      'AND (S.IDHOTEL = RG.IDHOTEL)'
      'AND (C.IDFORCLI (+) = RG.CLIENTERESERVANTE)'
      'AND (C.CODCONTRATO (+) = RG.CONTRATOINICIAL)'
      'AND (C.IDHOTEL (+) = RG.IDHOTEL)'
      'GROUP BY DATA'
      '')
    ValidateWithMask = True
    Left = 272
    Top = 123
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryOcupacaoGrpDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryOcupacaoGrpQTDTENTATIVA: TFloatField
      FieldName = 'QTDTENTATIVA'
    end
    object qryOcupacaoGrpQTDCHEGADAS: TFloatField
      FieldName = 'QTDCHEGADAS'
    end
    object qryOcupacaoGrpQTDUSOCASA: TFloatField
      FieldName = 'QTDUSOCASA'
    end
    object qryOcupacaoGrpQTDCORTESIA: TFloatField
      FieldName = 'QTDCORTESIA'
    end
    object qryOcupacaoGrpQTDPERMUTAS: TFloatField
      FieldName = 'QTDPERMUTAS'
    end
    object qryOcupacaoGrpQTDGARANT: TFloatField
      FieldName = 'QTDGARANT'
    end
    object qryOcupacaoGrpQTDNAOGARANT: TFloatField
      FieldName = 'QTDNAOGARANT'
    end
    object qryOcupacaoGrpQTDADULTOS: TFloatField
      FieldName = 'QTDADULTOS'
    end
    object qryOcupacaoGrpQTDCRIANCAS: TFloatField
      FieldName = 'QTDCRIANCAS'
    end
  end
  object qryOcupacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATA,'
      
        'SUM(DECODE(R.STATUSRESERVA,7,0,DECODE(S.TIPOGRATUIDADE,'#39'U'#39',1,0))' +
        ') AS QTDUSOCASA,'
      
        'SUM(DECODE(R.STATUSRESERVA,7,0,DECODE(S.TIPOGRATUIDADE,'#39'C'#39',1,0))' +
        ') AS QTDCORTESIA,'
      'SUM(DECODE(R.STATUSRESERVA,7,0,'
      'DECODE(C.TIPOCONTRATO,'#39'P'#39',1,0))) AS QTDPERMUTAS,'
      'SUM(DECODE(R.STATUSRESERVA,7,0,'
      
        'DECODE(SIGN(DATA-  NVL(ALO.DATACUTOFF,DATA)),1,1,0))) AS QTDABAT' +
        'ESALDOALLOT,'
      'SUM(DECODE(R.STATUSRESERVA,7,0,'
      'DECODE(C.TIPOCONTRATO,'#39'A'#39',1,0))) AS QTDALLOTMENTS,'
      'SUM(DECODE(R.STATUSRESERVA,7,0,'
      
        'DECODE(R.DATACHEGADAREAL,NULL, DECODE(R.DATACHEGPREVISTA,DATA,1)' +
        '))) AS QTDCHEGADAS,'
      'SUM(DECODE(R.STATUSRESERVA,7,0,'
      'DECODE(C.TIPOCONTRATO,'#39'A'#39',0,'#39'P'#39',0,'
      
        'DECODE(S.TIPOGRATUIDADE,'#39'U'#39',0,'#39'C'#39',0,DECODE(R.STATUSRESERVA,1,1,2' +
        ',1,0))))) as QTDGARANT,'
      'SUM(DECODE(R.STATUSRESERVA,7,0,'
      'DECODE(C.TIPOCONTRATO,'#39'A'#39',0,'#39'P'#39',0,'
      
        'DECODE(S.TIPOGRATUIDADE,'#39'U'#39',0,'#39'C'#39',0,DECODE(R.STATUSRESERVA,0,1,0' +
        '))))) as QTDNAOGARANT,'
      'SUM(DECODE(R.STATUSRESERVA,7,0,R.ADULTOS)) AS QTDADULTOS,'
      
        'SUM(DECODE(R.STATUSRESERVA,7,0,R.CRIANCAS1 + R.CRIANCAS2)) AS QT' +
        'DCRIANCAS'
      ''
      
        'FROM SEGMENTO S, DATASIS D,ALLOTMENT ALO,CONTRCLIHOTEL C, RESERV' +
        'AREDUZ RD,RESERVASFRONT R'
      'WHERE'
      '    (D.DATA >= :DATAINI)'
      'AND (D.DATA < :DATAFIM)'
      'AND (D.IDHOTEL = :IDHOTEL)'
      'AND (RD.DATACHEGADA <= D.DATA)'
      'AND (RD.DATAPARTIDA > D.DATA)'
      'AND (RD.IDHOTEL = D.IDHOTEL)'
      'AND (R.IDROOMLIST IS NULL)'
      'AND (R.IDRESERVASFRONT = RD.IDRESERVASFRONT)'
      'AND (S.CODSEGMENTO = R.CODSEGMENTO)'
      'AND (S.IDHOTEL = R.IDHOTEL)'
      'AND (C.IDFORCLI (+) = R.CLIENTERESERVANTE)'
      'AND (C.CODCONTRATO (+) = R.CONTRATOINICIAL)'
      'AND (C.IDHOTEL (+) = R.IDHOTEL)'
      'AND (ALO.IDFORCLI (+)= C.IDFORCLI)'
      'AND (ALO.CODCONTRATO (+)= C.CODCONTRATO)'
      'AND (ALO.IDHOTEL (+)= C.IDHOTEL)'
      'AND ('
      '(R.CODUH IS NULL) OR'
      
        '(R.CODUH IN (SELECT U.CODUH FROM UH U WHERE U.CODUH = R.CODUH AN' +
        'D U.IDHOTEL = R.IDHOTEL AND U.UHPOOL = '#39'S'#39')) OR'
      
        '(R.CODUH IN (SELECT PF.CODUH FROM POOLFLUTUANTE PF WHERE PF.CODU' +
        'H = R.CODUH AND PF.IDHOTEL = R.IDHOTEL AND'
      '                  PF.DATAINICIO <= DATA AND PF.DATAFIM > DATA ))'
      ')'
      'GROUP BY DATA')
    ValidateWithMask = True
    Left = 337
    Top = 122
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryOcupacaoDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryOcupacaoQTDUSOCASA: TFloatField
      FieldName = 'QTDUSOCASA'
    end
    object qryOcupacaoQTDCORTESIA: TFloatField
      FieldName = 'QTDCORTESIA'
    end
    object qryOcupacaoQTDPERMUTAS: TFloatField
      FieldName = 'QTDPERMUTAS'
    end
    object qryOcupacaoQTDALLOTMENTS: TFloatField
      FieldName = 'QTDALLOTMENTS'
    end
    object qryOcupacaoQTDCHEGADAS: TFloatField
      FieldName = 'QTDCHEGADAS'
    end
    object qryOcupacaoQTDGARANT: TFloatField
      FieldName = 'QTDGARANT'
    end
    object qryOcupacaoQTDNAOGARANT: TFloatField
      FieldName = 'QTDNAOGARANT'
    end
    object qryOcupacaoQTDADULTOS: TFloatField
      FieldName = 'QTDADULTOS'
    end
    object qryOcupacaoQTDCRIANCAS: TFloatField
      FieldName = 'QTDCRIANCAS'
    end
    object qryOcupacaoQTDABATESALDOALLOT: TFloatField
      FieldName = 'QTDABATESALDOALLOT'
    end
  end
  object qryCalResGrpTipoAllot: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select D.DATA,'
      'SUM(A.QTDUH) AS QTDALLOTMENTS,'
      
        'SUM(DECODE(SIGN(DATA-  NVL(ALO.DATACUTOFF,DATA)),1,A.QTDUH,0)) A' +
        'S QTDABATESALDOALLOT'
      ''
      
        'from  DATASIS D, ACOMODACAO A, ALLOTMENT ALO, ALLOTMENTXTIPOUH A' +
        'LT, RESERVAGRUPO RG'
      'where '
      '    (D.DATA >= :DATAINI)'
      'AND (D.DATA < :DATAFIM)'
      'AND (D.IDHOTEL = :IDHOTEL)'
      'AND (RG.STATUSRESERVA <= 2)'
      'AND (A.IDHOTEL = D.IDHOTEL)'
      'AND (A.DATACHEGADA <= DATA)'
      'AND (A.DATAPARTIDA > DATA)'
      'AND (RG.IDRESERVAGRUPO = A.IDRESERVAGRUPO)'
      'AND (ALT.IDFORCLI     = RG.CLIENTERESERVANTE)'
      'AND (ALT.CODCONTRATO  = RG.CONTRATOINICIAL)'
      'AND (ALT.IDHOTEL      = A.IDHOTEL)'
      'AND (ALT.IDTIPOUH     = A.IDTIPOUH)'
      'AND (ALO.IDFORCLI     = ALT.IDFORCLI)'
      'AND (ALO.CODCONTRATO  = ALT.CODCONTRATO)'
      'AND (ALO.IDHOTEL      = ALT.IDHOTEL)'
      'GROUP BY DATA'
      ''
      '')
    ValidateWithMask = True
    Left = 408
    Top = 176
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryCalResGrpTipoAllotDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryCalResGrpTipoAllotQTDALLOTMENTS: TFloatField
      FieldName = 'QTDALLOTMENTS'
    end
    object qryCalResGrpTipoAllotQTDABATESALDOALLOT: TFloatField
      FieldName = 'QTDABATESALDOALLOT'
    end
  end
  object qryQtdContrAllot: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.DATA,'
      'SUM(ALT.QTDUH)AS QTDALLOT'
      
        'FROM DATASIS D, CONTRCLIHOTEL C,ALLOTMENTXTIPOUH ALT, ALLOTMENT ' +
        'A'
      'WHERE'
      '    D.DATA >= :DATAINI'
      'AND D.DATA < :DATAFIM'
      'AND D.IDHOTEL = :IDHOTEL'
      'AND A.IDHOTEL = D.IDHOTEL'
      'AND A.DATACUTOFF < D.DATA'
      'AND  C.DATAINICONTRATO <= D.DATA'
      'AND  C.DATAFIMCONTRATO >= D.DATA'
      'AND  C.IDHOTEL = A.IDHOTEL'
      'AND  C.IDFORCLI = A.IDFORCLI'
      'AND  C.CODCONTRATO = A.CODCONTRATO'
      'AND  ALT.IDHOTEL = A.IDHOTEL'
      'AND  ALT.IDFORCLI = A.IDFORCLI'
      'AND  ALT.CODCONTRATO = A.CODCONTRATO'
      ''
      'GROUP BY D.DATA')
    ValidateWithMask = True
    Left = 272
    Top = 222
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryQtdContrAllotDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryQtdContrAllotQTDALLOT: TFloatField
      FieldName = 'QTDALLOT'
    end
  end
  object qryAtuAllot: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DATA, SUM(QUATIDADE) AS QTDTIRAL  FROM DATASIS D,ALLOTMEN' +
        'T ALO , ATUALLOTMENT A'
      'WHERE'
      '  D.DATA >= :DATAINI'
      '  AND D.DATA < :DATAFIM'
      '  AND D.IDHOTEL = :IDHOTEL'
      '  AND A.FLGAUTOMATICO = '#39'N'#39
      '  AND A.IDHOTEL = D.IDHOTEL'
      '  AND A.DATAINI <= DATA'
      '  AND A.DATAFIM > DATA'
      '  AND ALO.IDFORCLI = A.IDFORCLI'
      '  AND ALO.CODCONTRATO = A.CODCONTRATO'
      '  AND ALO.IDHOTEL = A.IDHOTEL'
      '  AND ALO.DATACUTOFF < DATA'
      'GROUP BY DATA'
      'ORDER BY DATA')
    ValidateWithMask = True
    Left = 272
    Top = 174
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryAtuAllotDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = '"CM.CALRESERVAS".DATA'
    end
    object qryAtuAllotQTDTIRAL: TFloatField
      FieldName = 'QTDTIRAL'
      Origin = 'ATUALLOTMENT.QUATIDADE'
    end
  end
  object qryBloq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select DATA,SUM(1) AS QTDBLOQ from BLOQUEIOUH B, DATASIS D'
      'where '
      '    D.DATA >= :DATAINI'
      'AND D.DATA < :DATAFIM'
      'AND D.IDHOTEL = :IDHOTEL'
      'AND B.IDHOTEL = D.IDHOTEL'
      'AND B.DATAINICIO <= DATA'
      'AND B.DATAFIM > DATA'
      ''
      'AND ('
      
        '(B.CODUH IN (SELECT U.CODUH FROM UH U WHERE U.CODUH = B.CODUH AN' +
        'D U.IDHOTEL = B.IDHOTEL AND U.UHPOOL = '#39'S'#39')) OR'
      
        '(B.CODUH IN (SELECT PF.CODUH FROM POOLFLUTUANTE PF WHERE PF.CODU' +
        'H = B.CODUH AND PF.IDHOTEL = B.IDHOTEL AND'
      '                  PF.DATAINICIO <= DATA AND PF.DATAFIM > DATA ))'
      ')'
      'GROUP BY DATA'
      ''
      '')
    ValidateWithMask = True
    Left = 398
    Top = 122
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryBloqQTDBLOQ: TFloatField
      FieldName = 'QTDBLOQ'
    end
    object qryBloqDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
  object qryQtdUHNPF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select SUM(1) as QTD from UH U'
      'where'
      'U.IDHOTEL = :IDHOTEL'
      
        'AND CODUH NOT IN (SELECT DISTINCT PF.CODUH FROM POOLFLUTUANTE PF' +
        ' WHERE'
      'PF.IDHOTEL = U.IDHOTEL'
      'AND PF.CODUH = U.CODUH'
      'AND PF.DATAFIM > :DATA)'
      'AND U.UHPOOL = '#39'S'#39
      '')
    ValidateWithMask = True
    Left = 336
    Top = 174
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'QTD'
      Origin = 'UH.CODUH'
    end
  end
  object qryQtdUHPF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select DATA,SUM(1) as QTD from POOLFLUTUANTE PF,DATASIS D'
      'where '
      '    D.DATA >= :DATAINI'
      'AND D.DATA < :DATAFIM'
      'AND D.IDHOTEL = :IDHOTEL'
      'AND PF.IDHOTEL = D.IDHOTEL'
      'AND PF.DATAINICIO <= DATA'
      'AND PF.DATAFIM > DATA'
      'GROUP BY DATA')
    ValidateWithMask = True
    Left = 344
    Top = 222
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryQtdUHPFQTD: TFloatField
      FieldName = 'QTD'
      Origin = 'UH.CODUH'
    end
    object qryQtdUHPFDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
  object qryReceitas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATA,'
      'SUM(DECODE(R.STATUSRESERVA,7,0,'
      'R.VLRDIARIA* (1 - (R.PERCDESCONTODIARIA/100)))) as RECEITA,'
      'SUM('
      'DECODE('
      'STATUSRESERVA,2,'
      'R.VLRDIARIA* (1 - (R.PERCDESCONTODIARIA/100))'
      ')) AS RECEF,'
      ''
      'SUM('
      'DECODE('
      'STATUSRESERVA,'
      '0,R.VLRDIARIA* (1 - (R.PERCDESCONTODIARIA/100)),'
      '1,R.VLRDIARIA* (1 - (R.PERCDESCONTODIARIA/100)))) AS RECPREV'
      ''
      ''
      'FROM DATASIS D,RESERVAREDUZ RD, RESERVASFRONT R'
      'WHERE'
      '    (D.DATA >= :DATAINI)'
      'AND (D.DATA < :DATAFIM)'
      'AND (D.IDHOTEL = :IDHOTEL)'
      'AND (RD.DATACHEGADA <= D.DATA) '
      'AND (RD.DATAPARTIDA > D.DATA)'
      'AND (RD.IDHOTEL = D.IDHOTEL)'
      'AND (R.IDRESERVASFRONT = RD.IDRESERVASFRONT)'
      'AND ('
      '(R.CODUH IS NULL) OR'
      
        '(R.CODUH IN (SELECT U.CODUH FROM UH U WHERE U.CODUH = R.CODUH AN' +
        'D U.IDHOTEL = R.IDHOTEL AND U.UHPOOL = '#39'S'#39')) OR'
      
        '(R.CODUH IN (SELECT PF.CODUH FROM POOLFLUTUANTE PF WHERE PF.CODU' +
        'H = R.CODUH AND PF.IDHOTEL = R.IDHOTEL AND'
      '                  PF.DATAINICIO <= DATA AND PF.DATAFIM > DATA ))'
      ')'
      'GROUP BY DATA')
    ValidateWithMask = True
    Left = 408
    Top = 222
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryReceitasDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryReceitasRECEITA: TFloatField
      FieldName = 'RECEITA'
    end
    object qryReceitasRECEF: TFloatField
      FieldName = 'RECEF'
    end
    object qryReceitasRECPREV: TFloatField
      FieldName = 'RECPREV'
    end
  end
  object ppFoodStats: TppBDEPipeline
    DataSource = dsFoodStats
    UserName = 'FoodStats'
    Left = 597
    Top = 24
    object ppFoodStatsppField1: TppField
      FieldAlias = 'HOJELIQUIDO'
      FieldName = 'HOJELIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFoodStatsppField2: TppField
      FieldAlias = 'ACUMLIQUIDO'
      FieldName = 'ACUMLIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFoodStatsppField3: TppField
      FieldAlias = 'QTDECOUVERTHOJE'
      FieldName = 'QTDECOUVERTHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFoodStatsppField4: TppField
      FieldAlias = 'QTDECOUVERTACUM'
      FieldName = 'QTDECOUVERTACUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFoodStatsppField5: TppField
      FieldAlias = 'AVGCHECK'
      FieldName = 'AVGCHECK'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppFoodStatsppField6: TppField
      FieldAlias = 'AVGCHECKHOJE'
      FieldName = 'AVGCHECKHOJE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object dsFoodStats: TwwDataSource
    DataSet = qryFoodStats
    Left = 535
    Top = 24
  end
  object qryFoodStats: TwwQuery
    OnCalcFields = qryFoodStatsCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      '       SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE,'
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) ) -'
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) )*(BASE/100)*(PERCENTUAL/100)'
      '       , 0))/ :TXCONV AS HOJELIQUIDO,'
      ''
      '       SUM('
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) ) -'
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) )*(BASE/100)*(PERCENTUAL/100)'
      '       )/ :TXCONV AS ACUMLIQUIDO'
      ''
      'from'
      '       TIPODEBCREDHOTEL TH,'
      '       ESTHOTEL EH,'
      '       ESTHOTELDC ED,'
      '       ( select TH.IDTIPODEBCRED,'
      '         NVL(AVG(IP.BASE),0) AS BASE,'
      '         NVL(SUM(IP.PERCENTUAL),0) AS PERCENTUAL'
      '        from TIPODEBCREDHOTEL TH, IMPOSXTIPODCHOTEL IP'
      '        where (TH.IDHOTEL = :IDHOTEL)'
      '        and   (TH.GRUPOFIXO IN ('#39'BU'#39','#39'BA'#39','#39'RS'#39','#39'RE'#39','#39'BQ'#39','#39'EV'#39'))'
      '        and   (TH.IDHOTEL = IP.IDHOTEL (+))'
      '        and   (TH.IDTIPODEBCRED = IP.IDTIPODEBCRED (+))'
      '        group by TH.IDTIPODEBCRED ) TI'
      'where'
      '                    (EH.DATAREFERENCIA >= :DATAINI)'
      'and                 (EH.DATAREFERENCIA < :DATAFIM)'
      'and'#9'            (TO_CHAR(EH.IDHOTEL) = TO_CHAR(:IDHOTEL))'
      
        'and                 (TH.GRUPOFIXO IN ('#39'BU'#39','#39'BA'#39','#39'RS'#39','#39'RE'#39','#39'BQ'#39','#39 +
        'EV'#39'))'
      'and                 (ED.IDESTHOTEL  = EH.IDESTHOTEL)'
      'and                 (TH.IDHOTEL       = ED.IDHOTEL)'
      'and                 (TH.IDTIPODEBCRED = ED.IDTIPODEBCRED)'
      'and                 (TI.IDTIPODEBCRED = ED.IDTIPODEBCRED)'
      ' ')
    ValidateWithMask = True
    Left = 474
    Top = 24
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TXCONV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TXCONV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryFoodStatsHOJELIQUIDO: TFloatField
      FieldName = 'HOJELIQUIDO'
    end
    object qryFoodStatsACUMLIQUIDO: TFloatField
      FieldName = 'ACUMLIQUIDO'
    end
    object qryFoodStatsAVGCHECK: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'AVGCHECK'
      Calculated = True
    end
    object qryFoodStatsAVGCHECKHOJE: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'AVGCHECKHOJE'
      Calculated = True
    end
    object qryFoodStatsQTDECOUVERTHOJE: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'QTDECOUVERTHOJE'
      Calculated = True
    end
    object qryFoodStatsQTDECOUVERTACUM: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'QTDECOUVERTACUM'
      Calculated = True
    end
  end
  object qryNetRev: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 AS ID,'
      '0 AS NETREVHOJE,'
      '0 AS NETREV, '
      '0 AS NETREVORC,'
      '0 AS REVPARHOJE,'
      '0 AS REVPAR,'
      '0 AS REVPARORC,'
      'SUM(1) '
      'from  ESTHOTEL EH'
      'where 1=2'
      '')
    UpdateObject = updNetRev
    ValidateWithMask = True
    Left = 482
    Top = 192
    object qryNetRevID: TFloatField
      FieldName = 'ID'
    end
    object qryNetRevNETREVHOJE: TFloatField
      FieldName = 'NETREVHOJE'
    end
    object qryNetRevNETREV: TFloatField
      FieldName = 'NETREV'
    end
    object qryNetRevREVPARHOJE: TFloatField
      FieldName = 'REVPARHOJE'
    end
    object qryNetRevREVPAR: TFloatField
      FieldName = 'REVPAR'
    end
    object qryNetRevNETREVORC: TFloatField
      FieldName = 'NETREVORC'
    end
    object qryNetRevREVPARORC: TFloatField
      FieldName = 'REVPARORC'
    end
  end
  object dsNetRev: TwwDataSource
    DataSet = qryNetRev
    Left = 543
    Top = 192
  end
  object ppNetRev: TppBDEPipeline
    DataSource = dsNetRev
    UserName = 'NetRev'
    Left = 597
    Top = 192
  end
  object ppRoomsDI: TppBDEPipeline
    DataSource = dsRoomsDI
    UserName = 'RoomsDI'
    Left = 597
    Top = 80
    object ppRoomsDIppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'AVGDIHOJE'
      FieldName = 'AVGDIHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppRoomsDIppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'AVGDI'
      FieldName = 'AVGDI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppRoomsDIppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'REVPARHOJE'
      FieldName = 'REVPARHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppRoomsDIppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'REVPAR'
      FieldName = 'REVPAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppRoomsDIppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'HOJELIQGRP'
      FieldName = 'HOJELIQGRP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppRoomsDIppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'ACUMLIQGRP'
      FieldName = 'ACUMLIQGRP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppRoomsDIppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'HOJELIQIND'
      FieldName = 'HOJELIQIND'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppRoomsDIppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'ACUMLIQIND'
      FieldName = 'ACUMLIQIND'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
  end
  object dsRoomsDI: TwwDataSource
    DataSet = qryRoomsDI
    Left = 543
    Top = 80
  end
  object qryRoomsDI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      ''
      
        '       SUM(DECODE(EH.TIPOREG,'#39'G'#39', DECODE(TH.GRUPOFIXO, '#39'DI'#39', DEC' +
        'ODE(EH.DATAREFERENCIA, :DATAHOJE,'
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) ) -'
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) )*(BASE/100)*(PERCENTUAL/100)'
      '       ,0),0),0))/ :TXCONV AS HOJELIQGRP,'
      ''
      '       SUM(DECODE(EH.TIPOREG,'#39'G'#39', DECODE(TH.GRUPOFIXO, '#39'DI'#39','
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) ) -'
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) )*(BASE/100)*(PERCENTUAL/100)'
      '       ,0),0)) / :TXCONV AS ACUMLIQGRP,'
      ''
      
        '       SUM(DECODE(EH.TIPOREG,'#39'I'#39', DECODE(TH.GRUPOFIXO, '#39'DI'#39', DEC' +
        'ODE(EH.DATAREFERENCIA, :DATAHOJE,'
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) ) -'
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) )*(BASE/100)*(PERCENTUAL/100)'
      '       ,0),0),0))/ :TXCONV AS HOJELIQIND,'
      ''
      '       SUM(DECODE(EH.TIPOREG,'#39'I'#39', DECODE(TH.GRUPOFIXO, '#39'DI'#39','
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) ) -'
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) )*(BASE/100)*(PERCENTUAL/100)'
      '       ,0),0)) / :TXCONV AS ACUMLIQIND,'
      ''
      
        '         DECODE(:UHOCUPHOJE, 0, 0, (SUM(DECODE(EH.DATAREFERENCIA' +
        ', :DATAHOJE,'
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) ) -'
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) )*(BASE/100)*(PERCENTUAL/100)'
      '         , 0))/ :TXCONV) / :UHOCUPHOJE)  AS AVGDIHOJE,'
      ''
      '         DECODE(:UHOCUPACUM, 0, 0 ,(SUM('
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) ) -'
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) )*(BASE/100)*(PERCENTUAL/100)'
      '         ) / :TXCONV) / :UHOCUPACUM)  AS AVGDI,'
      ''
      
        '         DECODE(:TOTUHHOJE, 0, 0, (SUM(DECODE(EH.DATAREFERENCIA,' +
        ' :DATAHOJE, ('
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) ) -'
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) )*(BASE/100)*(PERCENTUAL/100)'
      '         ), 0))/ :TXCONV) / :TOTUHHOJE) AS REVPARHOJE,'
      ''
      '         DECODE(:TOTUHACUM, 0, 0, (SUM('
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) ) -'
      
        '(DECODE(ED.VLRESTPOOL, NULL, 0,ED.VLRESTPOOL) + DECODE(ED.TOTEST' +
        'ORNOPOOL, NULL, 0,ED.TOTESTORNOPOOL) + DECODE(ED.VLRESTFORAPOOL,' +
        ' NULL, 0,ED.VLRESTFORAPOOL) + DECODE(ED.TOTESTORNOFPOOL, NULL, 0' +
        ',ED.TOTESTORNOFPOOL) )*(BASE/100)*(PERCENTUAL/100)'
      '         )/ :TXCONV) / :TOTUHACUM) AS REVPAR'
      'from'
      '         TIPODEBCREDHOTEL TH,'
      '         ESTHOTEL EH,'
      '         ESTHOTELDC ED,'
      '       ( select TH.IDTIPODEBCRED,'
      '         NVL(AVG(IP.BASE),0) AS BASE,'
      '         NVL(SUM(IP.PERCENTUAL),0) AS PERCENTUAL'
      '        from TIPODEBCREDHOTEL TH, IMPOSXTIPODCHOTEL IP'
      '        where (TH.IDHOTEL = :IDHOTEL)'
      '        and   (TH.GRUPOFIXO = '#39'DI'#39')'
      '        and   (TH.IDHOTEL = IP.IDHOTEL (+))'
      '        and   (TH.IDTIPODEBCRED = IP.IDTIPODEBCRED (+))'
      '        group by TH.IDTIPODEBCRED ) TI'
      'where'
      '        (EH.DATAREFERENCIA >= :DATAINI)'
      'and     (EH.DATAREFERENCIA < :DATAFIM)'
      'and     (TO_CHAR(EH.IDHOTEL) = TO_CHAR(:IDHOTEL))'
      'and     (TH.GRUPOFIXO = '#39'DI'#39')'
      'and     (ED.IDESTHOTEL  = EH.IDESTHOTEL)'
      'and     (TH.IDHOTEL       = ED.IDHOTEL)'
      'and     (TH.IDTIPODEBCRED = ED.IDTIPODEBCRED)'
      'and     (TI.IDTIPODEBCRED = ED.IDTIPODEBCRED)')
    ValidateWithMask = True
    Left = 482
    Top = 80
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TXCONV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TXCONV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TXCONV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TXCONV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UHOCUPHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TXCONV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UHOCUPHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UHOCUPACUM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TXCONV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'UHOCUPACUM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TOTUHHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TXCONV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TOTUHHOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TOTUHACUM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TXCONV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TOTUHACUM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryRoomsDIAVGDIHOJE: TFloatField
      FieldName = 'AVGDIHOJE'
    end
    object qryRoomsDIAVGDI: TFloatField
      FieldName = 'AVGDI'
    end
    object qryRoomsDIREVPARHOJE: TFloatField
      FieldName = 'REVPARHOJE'
    end
    object qryRoomsDIREVPAR: TFloatField
      FieldName = 'REVPAR'
    end
    object qryRoomsDIHOJELIQGRP: TFloatField
      FieldName = 'HOJELIQGRP'
    end
    object qryRoomsDIACUMLIQGRP: TFloatField
      FieldName = 'ACUMLIQGRP'
    end
    object qryRoomsDIHOJELIQIND: TFloatField
      FieldName = 'HOJELIQIND'
    end
    object qryRoomsDIACUMLIQIND: TFloatField
      FieldName = 'ACUMLIQIND'
    end
  end
  object qryEmpresaProp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME,P.RAZAOSOCIAL,P.NUMDOCUMENTO, I.IMAGEM '
      'FROM PESSOA P,IMAGENS I'
      'WHERE (P.IDPESSOA = :pEmpresa)  AND'
      '      (P.IDIMAGEM = I.IDIMAGEM(+))'
      ''
      '')
    ValidateWithMask = True
    Left = 13
    Top = 351
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pEmpresa'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryEmpresaPropNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryEmpresaPropRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryEmpresaPropNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object qryEmpresaPropIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
  end
  object dsEmpresaProp: TwwDataSource
    DataSet = qryEmpresaProp
    Left = 82
    Top = 351
  end
  object pplEmpresaProp: TppBDEPipeline
    DataSource = dsEmpresaProp
    UserName = 'lEmpresaProp'
    Left = 144
    Top = 351
  end
  object qryPOA: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 AS ID,'
      
        '0 AS TOTALUHS, 0 AS QTDEBLOQUEADO, 0 AS QTDEUSOCASA, 0 AS QTDESE' +
        'LLABLEROOMS,'
      '0 AS QTDEROOMSPAID, 0 AS QTDEUHCORTESIA, 0 AS QTDEOCCUPIEDROOMS,'
      
        '0 AS PERCOCCUPANCY, 0 AS AVGDI, 0 AS REVPAR, 0 AS QTDEUHGRP, 0 A' +
        'S GROUPRNC,'
      
        '0 AS GROUPADR, 0 AS QTDEUHIND, 0 AS TRANSIENTRNC, 0 AS TRANSIENT' +
        'ADR,'
      
        '0 AS QTDEHOSPEDEREPETE, 0 AS REPEATGUESTRNC, 0 AS CHOICERS, 0 AS' +
        ' CHOICERSRNC,'
      '0 AS QTDEEXTENSOES, 0 AS STAYOVERSRNC, 0 AS QTDESAIANTECIPADA,'
      
        '0 AS EARLYDEPLRNC, 0 AS QTDEPICKUP, 0 AS PICKUPRNC, 0 AS QTDEUHW' +
        'ALKIN,'
      
        '0 AS UHWALKINRNC, 0 AS QTDEUHNOSHOWCOB, 0 AS NOSHOWLRNC, 0 AS QT' +
        'DHOSPEDES,'
      
        '0 AS GUESTPEROCPROOM, 0 AS QTDECHEGADAS, 0 AS AVGLENGTHSTAY, 0 A' +
        'S QTDECOUVERT,'
      
        '0 AS AVGCHECK, 0 AS ROOMS, 0 AS FOOD, 0 AS BEVERAGE, 0 AS OTHERI' +
        'NCROOM,'
      
        '0 AS TELEPHONE, 0 AS OTHER1, 0 AS OTHER2, 0 AS OTHER3, 0 AS OTHE' +
        'RINC,'
      'SUM(1) AS LINHA'
      'from  ESTHOTEL EH'
      'where 1=2'
      '')
    UpdateObject = updPOA
    ValidateWithMask = True
    Left = 332
    Top = 352
    object qryPOAID: TFloatField
      FieldName = 'ID'
    end
    object qryPOATOTALUHS: TFloatField
      FieldName = 'TOTALUHS'
    end
    object qryPOAQTDEBLOQUEADO: TFloatField
      FieldName = 'QTDEBLOQUEADO'
    end
    object qryPOAQTDEUSOCASA: TFloatField
      FieldName = 'QTDEUSOCASA'
    end
    object qryPOAQTDESELLABLEROOMS: TFloatField
      FieldName = 'QTDESELLABLEROOMS'
    end
    object qryPOAQTDEROOMSPAID: TFloatField
      FieldName = 'QTDEROOMSPAID'
    end
    object qryPOAQTDEUHCORTESIA: TFloatField
      FieldName = 'QTDEUHCORTESIA'
    end
    object qryPOAQTDEOCCUPIEDROOMS: TFloatField
      FieldName = 'QTDEOCCUPIEDROOMS'
    end
    object qryPOAPERCOCCUPANCY: TFloatField
      FieldName = 'PERCOCCUPANCY'
    end
    object qryPOAAVGDI: TFloatField
      FieldName = 'AVGDI'
    end
    object qryPOAREVPAR: TFloatField
      FieldName = 'REVPAR'
    end
    object qryPOAQTDEUHGRP: TFloatField
      FieldName = 'QTDEUHGRP'
    end
    object qryPOAGROUPRNC: TFloatField
      FieldName = 'GROUPRNC'
    end
    object qryPOAGROUPADR: TFloatField
      FieldName = 'GROUPADR'
    end
    object qryPOAQTDEUHIND: TFloatField
      FieldName = 'QTDEUHIND'
    end
    object qryPOATRANSIENTRNC: TFloatField
      FieldName = 'TRANSIENTRNC'
    end
    object qryPOATRANSIENTADR: TFloatField
      FieldName = 'TRANSIENTADR'
    end
    object qryPOAQTDEHOSPEDEREPETE: TFloatField
      FieldName = 'QTDEHOSPEDEREPETE'
    end
    object qryPOAREPEATGUESTRNC: TFloatField
      FieldName = 'REPEATGUESTRNC'
    end
    object qryPOACHOICERS: TFloatField
      FieldName = 'CHOICERS'
    end
    object qryPOACHOICERSRNC: TFloatField
      FieldName = 'CHOICERSRNC'
    end
    object qryPOAQTDEEXTENSOES: TFloatField
      FieldName = 'QTDEEXTENSOES'
    end
    object qryPOASTAYOVERSRNC: TFloatField
      FieldName = 'STAYOVERSRNC'
    end
    object qryPOAQTDESAIANTECIPADA: TFloatField
      FieldName = 'QTDESAIANTECIPADA'
    end
    object qryPOAEARLYDEPLRNC: TFloatField
      FieldName = 'EARLYDEPLRNC'
    end
    object qryPOAQTDEPICKUP: TFloatField
      FieldName = 'QTDEPICKUP'
    end
    object qryPOAPICKUPRNC: TFloatField
      FieldName = 'PICKUPRNC'
    end
    object qryPOAQTDEUHWALKIN: TFloatField
      FieldName = 'QTDEUHWALKIN'
    end
    object qryPOAUHWALKINRNC: TFloatField
      FieldName = 'UHWALKINRNC'
    end
    object qryPOAQTDEUHNOSHOWCOB: TFloatField
      FieldName = 'QTDEUHNOSHOWCOB'
    end
    object qryPOANOSHOWLRNC: TFloatField
      FieldName = 'NOSHOWLRNC'
    end
    object qryPOAQTDHOSPEDES: TFloatField
      FieldName = 'QTDHOSPEDES'
    end
    object qryPOAGUESTPEROCPROOM: TFloatField
      FieldName = 'GUESTPEROCPROOM'
    end
    object qryPOAQTDECHEGADAS: TFloatField
      FieldName = 'QTDECHEGADAS'
    end
    object qryPOAAVGLENGTHSTAY: TFloatField
      FieldName = 'AVGLENGTHSTAY'
    end
    object qryPOAQTDECOUVERT: TFloatField
      FieldName = 'QTDECOUVERT'
    end
    object qryPOAAVGCHECK: TFloatField
      FieldName = 'AVGCHECK'
    end
    object qryPOAROOMS: TFloatField
      FieldName = 'ROOMS'
    end
    object qryPOAFOOD: TFloatField
      FieldName = 'FOOD'
    end
    object qryPOABEVERAGE: TFloatField
      FieldName = 'BEVERAGE'
    end
    object qryPOATELEPHONE: TFloatField
      FieldName = 'TELEPHONE'
    end
    object qryPOAOTHER1: TFloatField
      FieldName = 'OTHER1'
    end
    object qryPOAOTHER2: TFloatField
      FieldName = 'OTHER2'
    end
    object qryPOAOTHER3: TFloatField
      FieldName = 'OTHER3'
    end
    object qryPOAOTHERINC: TFloatField
      FieldName = 'OTHERINC'
    end
    object qryPOAOTHERINCROOM: TFloatField
      FieldName = 'OTHERINCROOM'
    end
  end
  object dsPOA: TwwDataSource
    DataSet = qryPOA
    Left = 384
    Top = 352
  end
  object ppPOA: TppBDEPipeline
    DataSource = dsPOA
    UserName = 'POA'
    Left = 437
    Top = 352
    object ppPOAppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppPOAppField2: TppField
      FieldAlias = 'TOTALUHS'
      FieldName = 'TOTALUHS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppPOAppField3: TppField
      FieldAlias = 'QTDEBLOQUEADO'
      FieldName = 'QTDEBLOQUEADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppPOAppField4: TppField
      FieldAlias = 'QTDEUSOCASA'
      FieldName = 'QTDEUSOCASA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppPOAppField5: TppField
      FieldAlias = 'QTDESELLABLEROOMS'
      FieldName = 'QTDESELLABLEROOMS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppPOAppField6: TppField
      FieldAlias = 'QTDEROOMSPAID'
      FieldName = 'QTDEROOMSPAID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppPOAppField7: TppField
      FieldAlias = 'QTDEUHCORTESIA'
      FieldName = 'QTDEUHCORTESIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppPOAppField8: TppField
      FieldAlias = 'QTDEOCCUPIEDROOMS'
      FieldName = 'QTDEOCCUPIEDROOMS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppPOAppField9: TppField
      FieldAlias = 'PERCOCCUPANCY'
      FieldName = 'PERCOCCUPANCY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppPOAppField10: TppField
      FieldAlias = 'AVGDI'
      FieldName = 'AVGDI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppPOAppField11: TppField
      FieldAlias = 'REVPAR'
      FieldName = 'REVPAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppPOAppField12: TppField
      FieldAlias = 'QTDEUHGRP'
      FieldName = 'QTDEUHGRP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppPOAppField13: TppField
      FieldAlias = 'GROUPRNC'
      FieldName = 'GROUPRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppPOAppField14: TppField
      FieldAlias = 'GROUPADR'
      FieldName = 'GROUPADR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppPOAppField15: TppField
      FieldAlias = 'QTDEUHIND'
      FieldName = 'QTDEUHIND'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppPOAppField16: TppField
      FieldAlias = 'TRANSIENTRNC'
      FieldName = 'TRANSIENTRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppPOAppField17: TppField
      FieldAlias = 'TRANSIENTADR'
      FieldName = 'TRANSIENTADR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppPOAppField18: TppField
      FieldAlias = 'QTDEHOSPEDEREPETE'
      FieldName = 'QTDEHOSPEDEREPETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppPOAppField19: TppField
      FieldAlias = 'REPEATGUESTRNC'
      FieldName = 'REPEATGUESTRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppPOAppField20: TppField
      FieldAlias = 'CHOICERS'
      FieldName = 'CHOICERS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppPOAppField21: TppField
      FieldAlias = 'CHOICERSRNC'
      FieldName = 'CHOICERSRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppPOAppField22: TppField
      FieldAlias = 'QTDEEXTENSOES'
      FieldName = 'QTDEEXTENSOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppPOAppField23: TppField
      FieldAlias = 'STAYOVERSRNC'
      FieldName = 'STAYOVERSRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppPOAppField24: TppField
      FieldAlias = 'QTDESAIANTECIPADA'
      FieldName = 'QTDESAIANTECIPADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppPOAppField25: TppField
      FieldAlias = 'EARLYDEPLRNC'
      FieldName = 'EARLYDEPLRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppPOAppField26: TppField
      FieldAlias = 'QTDEPICKUP'
      FieldName = 'QTDEPICKUP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppPOAppField27: TppField
      FieldAlias = 'PICKUPRNC'
      FieldName = 'PICKUPRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppPOAppField28: TppField
      FieldAlias = 'QTDEUHWALKIN'
      FieldName = 'QTDEUHWALKIN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppPOAppField29: TppField
      FieldAlias = 'UHWALKINRNC'
      FieldName = 'UHWALKINRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppPOAppField30: TppField
      FieldAlias = 'QTDEUHNOSHOWCOB'
      FieldName = 'QTDEUHNOSHOWCOB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppPOAppField31: TppField
      FieldAlias = 'NOSHOWLRNC'
      FieldName = 'NOSHOWLRNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppPOAppField32: TppField
      FieldAlias = 'QTDHOSPEDES'
      FieldName = 'QTDHOSPEDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppPOAppField33: TppField
      FieldAlias = 'GUESTPEROCPROOM'
      FieldName = 'GUESTPEROCPROOM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppPOAppField34: TppField
      FieldAlias = 'QTDECHEGADAS'
      FieldName = 'QTDECHEGADAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppPOAppField35: TppField
      FieldAlias = 'AVGLENGTHSTAY'
      FieldName = 'AVGLENGTHSTAY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppPOAppField36: TppField
      FieldAlias = 'QTDECOUVERT'
      FieldName = 'QTDECOUVERT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppPOAppField37: TppField
      FieldAlias = 'AVGCHECK'
      FieldName = 'AVGCHECK'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppPOAppField38: TppField
      FieldAlias = 'ROOMS'
      FieldName = 'ROOMS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppPOAppField39: TppField
      FieldAlias = 'FOOD'
      FieldName = 'FOOD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppPOAppField40: TppField
      FieldAlias = 'BEVERAGE'
      FieldName = 'BEVERAGE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppPOAppField41: TppField
      FieldAlias = 'TELEPHONE'
      FieldName = 'TELEPHONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppPOAppField42: TppField
      FieldAlias = 'OTHER1'
      FieldName = 'OTHER1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppPOAppField43: TppField
      FieldAlias = 'OTHER2'
      FieldName = 'OTHER2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppPOAppField44: TppField
      FieldAlias = 'OTHER3'
      FieldName = 'OTHER3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppPOAppField45: TppField
      FieldAlias = 'OTHERINC'
      FieldName = 'OTHERINC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppPOAppField46: TppField
      FieldAlias = 'OTHERINCROOM'
      FieldName = 'OTHERINCROOM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
  end
  object updPOA: TUpdateSQL
    ModifySQL.Strings = (
      'update ESTHOTEL'
      'set'
      '  ID = :ID,'
      '  TOTALUHS = :TOTALUHS,'
      '  QTDEBLOQUEADO = :QTDEBLOQUEADO,'
      '  QTDEUSOCASA = :QTDEUSOCASA,'
      '  QTDESELLABLEROOMS = :QTDESELLABLEROOMS,'
      '  QTDEROOMSPAID = :QTDEROOMSPAID,'
      '  QTDEUHCORTESIA = :QTDEUHCORTESIA,'
      '  QTDEOCCUPIEDROOMS = :QTDEOCCUPIEDROOMS,'
      '  PERCOCCUPANCY = :PERCOCCUPANCY,'
      '  AVGDI = :AVGDI,'
      '  REVPAR = :REVPAR,'
      '  QTDEUHGRP = :QTDEUHGRP,'
      '  GROUPRNC = :GROUPRNC,'
      '  GROUPADR = :GROUPADR,'
      '  QTDEUHIND = :QTDEUHIND,'
      '  TRANSIENTRNC = :TRANSIENTRNC,'
      '  TRANSIENTADR = :TRANSIENTADR,'
      '  QTDEHOSPEDEREPETE = :QTDEHOSPEDEREPETE,'
      '  REPEATGUESTRNC = :REPEATGUESTRNC,'
      '  CHOICERS = :CHOICERS,'
      '  CHOICERSRNC = :CHOICERSRNC,'
      '  QTDEEXTENSOES = :QTDEEXTENSOES,'
      '  STAYOVERSRNC = :STAYOVERSRNC,'
      '  QTDESAIANTECIPADA = :QTDESAIANTECIPADA,'
      '  EARLYDEPLRNC = :EARLYDEPLRNC,'
      '  QTDEPICKUP = :QTDEPICKUP,'
      '  PICKUPRNC = :PICKUPRNC,'
      '  QTDEUHWALKIN = :QTDEUHWALKIN,'
      '  UHWALKINRNC = :UHWALKINRNC,'
      '  QTDEUHNOSHOWCOB = :QTDEUHNOSHOWCOB,'
      '  NOSHOWLRNC = :NOSHOWLRNC,'
      '  QTDHOSPEDES = :QTDHOSPEDES,'
      '  GUESTPEROCPROOM = :GUESTPEROCPROOM,'
      '  QTDECHEGADAS = :QTDECHEGADAS,'
      '  AVGLENGTHSTAY = :AVGLENGTHSTAY,'
      '  QTDECOUVERT = :QTDECOUVERT,'
      '  AVGCHECK = :AVGCHECK,'
      '  ROOMS = :ROOMS,'
      '  FOOD = :FOOD,'
      '  BEVERAGE = :BEVERAGE,'
      '  MEETROOM = :MEETROOM,'
      '  TELEPHONE = :TELEPHONE,'
      '  OTHER1 = :OTHER1,'
      '  OTHER2 = :OTHER2,'
      '  OTHER3 = :OTHER3,'
      '  OTHERINC = :OTHERINC'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into ESTHOTEL'
      
        '  (ID, TOTALUHS, QTDEBLOQUEADO, QTDEUSOCASA, QTDESELLABLEROOMS, ' +
        'QTDEROOMSPAID, '
      
        '   QTDEUHCORTESIA, QTDEOCCUPIEDROOMS, PERCOCCUPANCY, AVGDI, REVP' +
        'AR, QTDEUHGRP, '
      
        '   GROUPRNC, GROUPADR, QTDEUHIND, TRANSIENTRNC, TRANSIENTADR, QT' +
        'DEHOSPEDEREPETE, '
      
        '   REPEATGUESTRNC, CHOICERS, CHOICERSRNC, QTDEEXTENSOES, STAYOVE' +
        'RSRNC, '
      
        '   QTDESAIANTECIPADA, EARLYDEPLRNC, QTDEPICKUP, PICKUPRNC, QTDEU' +
        'HWALKIN, '
      
        '   UHWALKINRNC, QTDEUHNOSHOWCOB, NOSHOWLRNC, QTDHOSPEDES, GUESTP' +
        'EROCPROOM, '
      
        '   QTDECHEGADAS, AVGLENGTHSTAY, QTDECOUVERT, AVGCHECK, ROOMS, FO' +
        'OD, BEVERAGE, '
      '   MEETROOM, TELEPHONE, OTHER1, OTHER2, OTHER3, OTHERINC)'
      'values'
      
        '  (:ID, :TOTALUHS, :QTDEBLOQUEADO, :QTDEUSOCASA, :QTDESELLABLERO' +
        'OMS, :QTDEROOMSPAID, '
      
        '   :QTDEUHCORTESIA, :QTDEOCCUPIEDROOMS, :PERCOCCUPANCY, :AVGDI, ' +
        ':REVPAR, '
      
        '   :QTDEUHGRP, :GROUPRNC, :GROUPADR, :QTDEUHIND, :TRANSIENTRNC, ' +
        ':TRANSIENTADR, '
      
        '   :QTDEHOSPEDEREPETE, :REPEATGUESTRNC, :CHOICERS, :CHOICERSRNC,' +
        ' :QTDEEXTENSOES, '
      
        '   :STAYOVERSRNC, :QTDESAIANTECIPADA, :EARLYDEPLRNC, :QTDEPICKUP' +
        ', :PICKUPRNC, '
      
        '   :QTDEUHWALKIN, :UHWALKINRNC, :QTDEUHNOSHOWCOB, :NOSHOWLRNC, :' +
        'QTDHOSPEDES, '
      
        '   :GUESTPEROCPROOM, :QTDECHEGADAS, :AVGLENGTHSTAY, :QTDECOUVERT' +
        ', :AVGCHECK, '
      
        '   :ROOMS, :FOOD, :BEVERAGE, :MEETROOM, :TELEPHONE, :OTHER1, :OT' +
        'HER2, :OTHER3, '
      '   :OTHERINC)')
    DeleteSQL.Strings = (
      'delete from ESTHOTEL'
      'where'
      '  ID = :OLD_ID')
    Left = 279
    Top = 352
  end
  object qryLinhaPOA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLINHARELAT , IDELEMDEMONSTRAT, FLGRATEIO'
      'FROM LRELATXELEMDEMO'
      'WHERE IDHOTEL =:IDHOTEL'
      'ORDER BY IDLINHARELAT'
      '')
    ValidateWithMask = True
    Left = 226
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
  end
  object qryCompConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.ELETIPOELEM,C.CODSUBCONTA,C.CODCENTROCUSTO,C.IDEMPRESA,'
      
        '               C.UNIDNEGOC, C.PLACONTA,C.PLANO, C.IDPATRO, C.IDP' +
        'LANOPREV  '
      'FROM     COMPOELEMDEM C, ELEMDEMONSTRATIVO E '
      'WHERE (C.IDELEMDEMONSTRAT = :IELEMDEMO) AND '
      '      (E.ELETIPOELEM IN ('#39'C'#39','#39'S'#39'))  AND'
      '      (C.IDELEMDEMONSTRAT = E.IDELEMDEMONSTRAT)')
    ValidateWithMask = True
    Left = 485
    Top = 130
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IELEMDEMO'
        ParamType = ptUnknown
      end>
    object qryCompContaCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qryCompContaCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryCompContaIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryCompContaUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryCompContaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryCompContaPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryCompContaIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryCompContaIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryCompContaELETIPOELEM: TStringField
      FieldName = 'ELETIPOELEM'
      Size = 1
    end
  end
  object qrySaldos: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 545
    Top = 130
  end
  object qryLinhaDeptRev: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select g.idgrupodeptrev, g.nomelinha, g.posicaorelat, '
      '   0 AS colhoje,  0 AS colacumulado, 0 AS colorcado'
      'from grupodeptrev g'
      'where g.idhotel = :IDHOTEL'
      'order by g.posicaorelat'
      '')
    UpdateObject = updLinhaDeptRev
    ValidateWithMask = True
    Left = 18
    Top = 130
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryLinhaDeptRevIDGRUPODEPTREV: TFloatField
      FieldName = 'IDGRUPODEPTREV'
    end
    object qryLinhaDeptRevNOMELINHA: TStringField
      FieldName = 'NOMELINHA'
      Size = 60
    end
    object qryLinhaDeptRevPOSICAORELAT: TFloatField
      FieldName = 'POSICAORELAT'
    end
    object qryLinhaDeptRevCOLHOJE: TFloatField
      FieldName = 'COLHOJE'
    end
    object qryLinhaDeptRevCOLACUMULADO: TFloatField
      FieldName = 'COLACUMULADO'
    end
    object qryLinhaDeptRevCOLORCADO: TFloatField
      FieldName = 'COLORCADO'
    end
  end
  object qryItemDeptRev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select i.idgrupodeptrev, i.coluna, i.idelemdemonstrat, i.flgrate' +
        'io'
      'from itemdeptrev i'
      'where i.idgrupodeptrev = :idgrupodeptrev'
      'order by i.coluna, i.idelemdemonstrat')
    ValidateWithMask = True
    Left = 273
    Top = 282
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idgrupodeptrev'
        ParamType = ptUnknown
      end>
    object qryItemDeptRevIDGRUPODEPTREV: TFloatField
      FieldName = 'IDGRUPODEPTREV'
    end
    object qryItemDeptRevCOLUNA: TStringField
      FieldName = 'COLUNA'
      Size = 1
    end
    object qryItemDeptRevFLGRATEIO: TStringField
      FieldName = 'FLGRATEIO'
      Origin = 'ITEMDEPTREV.FLGRATEIO'
      Size = 1
    end
    object qryItemDeptRevIDELEMDEMONSTRAT: TFloatField
      FieldName = 'IDELEMDEMONSTRAT'
    end
  end
  object updNetRev: TUpdateSQL
    ModifySQL.Strings = (
      'update ESTHOTEL'
      'set'
      '  ID = :ID,'
      '  NETREVHOJE = :NETREVHOJE,'
      '  NETREV = :NETREV,'
      '  NETREVORC = :NETREVORC,'
      '  REVPARHOJE = :REVPARHOJE,'
      '  REVPAR = :REVPAR,'
      '  REVPARORC = :REVPARORC'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into ESTHOTEL'
      
        '  (ID, NETREVHOJE, NETREV, NETREVORC, REVPARHOJE, REVPAR, REVPAR' +
        'ORC)'
      'values'
      
        '  (:ID, :NETREVHOJE, :NETREV, :NETREVORC, :REVPARHOJE, :REVPAR, ' +
        ':REVPARORC)')
    DeleteSQL.Strings = (
      'delete from ESTHOTEL'
      'where'
      '  ID = :OLD_ID')
    Left = 598
    Top = 242
  end
  object updLinhaDeptRev: TUpdateSQL
    ModifySQL.Strings = (
      'update grupodeptrev'
      'set'
      '  IDGRUPODEPTREV = :IDGRUPODEPTREV,'
      '  NOMELINHA = :NOMELINHA,'
      '  POSICAORELAT = :POSICAORELAT,'
      '  COLHOJE = :COLHOJE,'
      '  COLACUMULADO = :COLACUMULADO,'
      '  COLORCADO = :COLORCADO'
      'where'
      '  IDGRUPODEPTREV = :OLD_IDGRUPODEPTREV')
    InsertSQL.Strings = (
      'insert into grupodeptrev'
      
        '  (IDGRUPODEPTREV, NOMELINHA, POSICAORELAT, COLHOJE, COLACUMULAD' +
        'O, COLORCADO)'
      'values'
      
        '  (:IDGRUPODEPTREV, :NOMELINHA, :POSICAORELAT, :COLHOJE, :COLACU' +
        'MULADO, '
      '   :COLORCADO)')
    DeleteSQL.Strings = (
      'delete from grupodeptrev'
      'where'
      '  IDGRUPODEPTREV = :OLD_IDGRUPODEPTREV')
    Left = 368
    Top = 280
  end
  object qrySumarioFlash: TwwQuery
    OnCalcFields = qrySumarioFlashCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT L.IDTIPODEBCRED,T.DESCRICAO AS DESCDC,G.DESCRICAO AS DESC' +
        'GRUPO,'
      'SUM(VLRLANCAMENTO) AS TOTALMES,'
      'SUM(DECODE(DATALANCAMENTO,:DATAFIM,VLRLANCAMENTO,0)) AS TOTALDIA'
      
        'FROM PARAMHOTEL P, GRUPODEBCRED G, TIPODEBCREDHOTEL T, LANCAMENT' +
        'OSFRONT L'
      'WHERE L.DATALANCAMENTO >= :DATAINI'
      'AND   L.DATALANCAMENTO <= :DATAFIM'
      'AND   L.IDHOTEL         = :IDHOTEL'
      'AND   T.IDTIPODEBCRED   = L.IDTIPODEBCRED'
      'AND   T.IDHOTEL         = L.IDHOTEL'
      'AND   G.IDGRUPODC       = T.IDGRUPODC'
      'AND   P.IDHOTEL         = L.IDHOTEL'
      'AND   G.IDGRUPODC       <> P.IDGRUPODCCREDITO'
      'GROUP BY L.IDTIPODEBCRED,T.DESCRICAO,G.DESCRICAO'
      'ORDER BY G.DESCRICAO,T.DESCRICAO'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 490
    Top = 304
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDHOTEL'
        ParamType = ptInput
      end>
    object qrySumarioFlashIDTIPODEBCRED: TFloatField
      FieldName = 'IDTIPODEBCRED'
    end
    object qrySumarioFlashTOTALMES: TFloatField
      FieldName = 'TOTALMES'
    end
    object qrySumarioFlashTOTALDIA: TFloatField
      FieldName = 'TOTALDIA'
    end
    object qrySumarioFlashDESCDC: TStringField
      FieldName = 'DESCDC'
      Size = 40
    end
    object qrySumarioFlashDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qrySumarioFlashTOTALDIALIQUIDO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOTALDIALIQUIDO'
      Calculated = True
    end
    object qrySumarioFlashTOTALMESLIQUIDO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTALMESLIQUIDO'
      Calculated = True
    end
    object qrySumarioFlashTOTALDIAIMPOSTOS: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOTALDIAIMPOSTOS'
      Calculated = True
    end
    object qrySumarioFlashTOTALMESIMPOSTOS: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOTALMESIMPOSTOS'
      Calculated = True
    end
  end
  object dsSumarioFlash: TwwDataSource
    DataSet = qrySumarioFlash
    Left = 527
    Top = 304
  end
  object ppSumarioFlash: TppBDEPipeline
    DataSource = dsSumarioFlash
    CloseDataSource = True
    UserName = 'SumarioFlash'
    Left = 565
    Top = 304
    object ppSumarioFlashppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPODEBCRED'
      FieldName = 'IDTIPODEBCRED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppSumarioFlashppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALMES'
      FieldName = 'TOTALMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppSumarioFlashppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALDIA'
      FieldName = 'TOTALDIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppSumarioFlashppField4: TppField
      FieldAlias = 'DESCDC'
      FieldName = 'DESCDC'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
    object ppSumarioFlashppField5: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object ppSumarioFlashppField6: TppField
      FieldAlias = 'TOTALDIALIQUIDO'
      FieldName = 'TOTALDIALIQUIDO'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 5
    end
    object ppSumarioFlashppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALMESLIQUIDO'
      FieldName = 'TOTALMESLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppSumarioFlashppField8: TppField
      FieldAlias = 'TOTALDIAIMPOSTOS'
      FieldName = 'TOTALDIAIMPOSTOS'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 7
    end
    object ppSumarioFlashppField9: TppField
      FieldAlias = 'TOTALMESIMPOSTOS'
      FieldName = 'TOTALMESIMPOSTOS'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 8
    end
  end
  object rpSumarioFlash: TppReport
    AutoStop = False
    DataPipeline = ppSumarioFlash
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 602
    Top = 304
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33867
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label11'
        Caption = 'Sumário FlashReport'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 74613
        mmTop = 8731
        mmWidth = 48154
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 33073
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel5: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5556
        mmLeft = 86254
        mmTop = 1588
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label1'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 81756
        mmTop = 14817
        mmWidth = 12700
        BandType = 0
      end
      object lblDataSumario: TppLabel
        UserName = 'lblDataSumario'
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 93663
        mmTop = 14817
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Valor Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 58208
        mmTop = 27781
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Impostos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 79111
        mmTop = 27517
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Valor Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 96309
        mmTop = 27517
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Valor Bruto Acumulado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 118534
        mmTop = 27517
        mmWidth = 33602
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Valor Líquido Acumulado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 157692
        mmTop = 27517
        mmWidth = 36513
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel6: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        OnPrint = LblSistemaPrint
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCGRUPO'
      DataPipeline = ppSumarioFlash
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'DESCGRUPO'
          DataPipeline = ppSumarioFlash
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 14288
          mmTop = 1588
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label9'
          Caption = 'Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 1588
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppLabel9: TppLabel
          UserName = 'Label3'
          Caption = 'Total do Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 1058
          mmWidth = 38100
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'TOTALDIA'
          DataPipeline = ppSumarioFlash
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 58473
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'TOTALMES'
          DataPipeline = ppSumarioFlash
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 134938
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'TOTALDIAIMPOSTOS'
          DataPipeline = ppSumarioFlash
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 76465
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'TOTALDIALIQUIDO'
          DataPipeline = ppSumarioFlash
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 98954
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'TOTALMESLIQUIDO'
          DataPipeline = ppSumarioFlash
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 177007
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCDC'
      DataPipeline = ppSumarioFlash
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'DESCDC'
          DataPipeline = ppSumarioFlash
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 794
          mmTop = 529
          mmWidth = 11642
          BandType = 3
          GroupNo = 1
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'TOTALDIA'
          DataPipeline = ppSumarioFlash
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 58473
          mmTop = 529
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'TOTALMES'
          DataPipeline = ppSumarioFlash
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 134938
          mmTop = 529
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'TOTALDIAIMPOSTOS'
          DataPipeline = ppSumarioFlash
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 76465
          mmTop = 529
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'TOTALDIALIQUIDO'
          DataPipeline = ppSumarioFlash
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 98954
          mmTop = 529
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'TOTALMESLIQUIDO'
          DataPipeline = ppSumarioFlash
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 177007
          mmTop = 794
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qrySumarioImpostos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'SUM(IL.VALOR) AS IMPOSTOSMES,'
      'SUM(DECODE(L.DATALANCAMENTO,:DATAFIM,IL.VALOR,0)) AS IMPOSTODIA,'
      'T.IDTIPODEBCRED'
      
        'FROM PARAMHOTEL P, TIPODEBCREDHOTEL T, LANCAMENTOSFRONT L, IMPOS' +
        'TOLANC IL'
      'WHERE L.DATALANCAMENTO >= :DATAINI'
      'AND   L.DATALANCAMENTO <= :DATAFIM'
      'AND   L.IDHOTEL         = :IDHOTEL'
      'AND   IL.IDLANCAMENTO   = L.IDLANCAMENTO'
      'AND   T.IDTIPODEBCRED   = L.IDTIPODEBCRED'
      'AND   T.IDHOTEL         = L.IDHOTEL'
      'AND   P.IDHOTEL         = L.IDHOTEL'
      'AND   T.IDGRUPODC       <> P.IDGRUPODCCREDITO'
      'GROUP BY T.IDTIPODEBCRED'
      ''
      '')
    ValidateWithMask = True
    Left = 512
    Top = 248
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDHOTEL'
        ParamType = ptInput
      end>
    object qrySumarioImpostosIMPOSTOSMES: TFloatField
      FieldName = 'IMPOSTOSMES'
    end
    object qrySumarioImpostosIMPOSTODIA: TFloatField
      FieldName = 'IMPOSTODIA'
    end
    object qrySumarioImpostosIDTIPODEBCRED: TFloatField
      FieldName = 'IDTIPODEBCRED'
    end
  end
  object qryCouvert: TwwQuery
    OnCalcFields = qryFoodStatsCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      
        '       SUM(DECODE(EH.DATAREFERENCIA, :DATAHOJE, EH.QTDECOUVERT, ' +
        '0)) AS QTDECOUVERTHOJE ,'
      '       SUM(EH.QTDECOUVERT) AS QTDECOUVERTACUM'
      'from'
      '       ESTHOTEL EH'
      'where'
      '                    (EH.DATAREFERENCIA >= :DATAINI)'
      'and                 (EH.DATAREFERENCIA < :DATAFIM)'
      'and'#9'            (TO_CHAR(EH.IDHOTEL) = TO_CHAR(:IDHOTEL))'
      '')
    ValidateWithMask = True
    Left = 602
    Top = 128
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAHOJE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDHOTEL'
        ParamType = ptInput
      end>
    object qryCouvertQTDECOUVERTHOJE: TFloatField
      FieldName = 'QTDECOUVERTHOJE'
    end
    object qryCouvertQTDECOUVERTACUM: TFloatField
      FieldName = 'QTDECOUVERTACUM'
    end
  end
end
