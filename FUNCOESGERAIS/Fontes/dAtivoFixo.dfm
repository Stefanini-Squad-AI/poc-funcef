object dtmAtivoFixo: TdtmAtivoFixo
  OldCreateOrder = True
  OnCreate = dtmAtivoFixoCreate
  OnDestroy = dtmAtivoFixoDestroy
  Top = 139
  Height = 433
  Width = 799
  object qryRegistraMovimentacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTORICOMOVIMENTACAO'
      '           (IDMOVIMENTACAO,'
      '            IDBEM,'
      '            IDPESSOA,'
      '            IDMODULO,'
      '            IDTIPOMOVIMENTACAO,'
      '            DATAMOVIMENTACAO,'
      '            IDREAVALACRESC,'
      '            VALOFI,'
      '            VALFIS,'
      '            VALGER,'
      '            DATAULTDEP,'
      '            IDGRUPANT,'
      '            IDCONJANT,'
      '            IDLOCALANT,'
      '            IDRESPANT,'
      '            PLACAANT,'
      '            TAXADEPANT,'
      '            VALORGLAUDO,'
      '            OBSREAVAL,'
      '            PLNCODIGO,'
      '            IDESTORNO)'
      'VALUES     (:MOVIMENTACAO,'
      '            :BEM,'
      '            :EMPRESAPROP,'
      '            :MODULO,'
      '            :TIPOMOVIMENTACAO,'
      '            :DATAMOVIMENTACAO,'
      '            :IDREAVALACRESC,'
      '            :VALOFI,'
      '            :VALFIS,'
      '            :VALGER,'
      '            :DATAULTDEP,'
      '            :IDGRUPANT,'
      '            :IDCONJANT,'
      '            :IDLOCALANT,'
      '            :IDRESPANT,'
      '            :PLACAANT,'
      '            :TAXADEPANT,'
      '            :VALORGLAUDO,'
      '            :OBSREAVAL,'
      '            :PLANILHA,'
      '            :ESTORNO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 512
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'BEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDREAVALACRESC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOFI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONJANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOCALANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESPANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLACAANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TAXADEPANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORGLAUDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBSREAVAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANILHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ESTORNO'
        ParamType = ptUnknown
      end>
  end
  object qryBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBEM,IDPESSOA,IDCONJUNTO,IDTERCEIRO,IDGRUPO,'
      '       CODSUBCONTA,IDCLASSEBEM,IDMODULO,IDITENSRECDEV,'
      '       IDFORNSERV,IDSITUACAO,IDIMAGEM,REGISTRO,CONTROLE,'
      '       PLACA,DESBEM,IDNOTA,COMPLNOTA,DTANOTA,NUMSERIE,'
      '       DTAINCLUSAO,VALHISTORICO,VALORG,CMBEM,VALFIS,VALGER,'
      '       DATAINICIODEP,VALDEPINI,TAXADEP,DEPLANC,CMDEP,DEPFIS,'
      '       DEPGER,DATAULTDEP,DATARECALCDEP,FLGDEPREC,'
      '       PROPBAIXA,BAIXATOTAL,IDOPCIONAL,UNIDNEGOC,'
      '       PROCESSOAQUIS,EMPENHOAQUIS,PUBAUTOR,PUBEDITORA,PUBANO,'
      '       PRIORIDADE,DATAINSTALACAO,DATATERMINOGAR,'
      '       ((VALORG + CMBEM) - (DEPLANC + CMDEP)) AS VALCTB'
      'FROM BEM'
      'WHERE (IDBEM    = :PIDBEM)'
      '  AND (IDPESSOA = :PIDPESSOA)'
      '')
    UpdateObject = updBem
    ValidateWithMask = True
    Left = 32
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryBemIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = '"CM.BEM".IDBEM'
    end
    object qryBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.BEM".IDPESSOA'
    end
    object qryBemIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = '"CM.BEM".IDCONJUNTO'
    end
    object qryBemIDTERCEIRO: TFloatField
      FieldName = 'IDTERCEIRO'
      Origin = '"CM.BEM".IDTERCEIRO'
    end
    object qryBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = '"CM.BEM".IDGRUPO'
    end
    object qryBemCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = '"CM.BEM".CODSUBCONTA'
    end
    object qryBemIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = '"CM.BEM".IDCLASSEBEM'
    end
    object qryBemIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = '"CM.BEM".IDMODULO'
    end
    object qryBemIDITENSRECDEV: TFloatField
      FieldName = 'IDITENSRECDEV'
      Origin = '"CM.BEM".IDITENSRECDEV'
    end
    object qryBemIDFORNSERV: TFloatField
      FieldName = 'IDFORNSERV'
      Origin = '"CM.BEM".IDFORNSERV'
    end
    object qryBemIDSITUACAO: TFloatField
      FieldName = 'IDSITUACAO'
      Origin = '"CM.BEM".IDSITUACAO'
    end
    object qryBemIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
      Origin = '"CM.BEM".IDIMAGEM'
    end
    object qryBemREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Origin = '"CM.BEM".REGISTRO'
      Size = 1
    end
    object qryBemCONTROLE: TStringField
      FieldName = 'CONTROLE'
      Origin = '"CM.BEM".CONTROLE'
      Size = 1
    end
    object qryBemPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = '"CM.BEM".PLACA'
    end
    object qryBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Origin = '"CM.BEM".DESBEM'
      Size = 200
    end
    object qryBemIDNOTA: TStringField
      FieldName = 'IDNOTA'
      Origin = '"CM.BEM".IDNOTA'
      Size = 18
    end
    object qryBemCOMPLNOTA: TStringField
      FieldName = 'COMPLNOTA'
      Origin = '"CM.BEM".COMPLNOTA'
      Size = 5
    end
    object qryBemDTANOTA: TDateTimeField
      FieldName = 'DTANOTA'
      Origin = '"CM.BEM".DTANOTA'
    end
    object qryBemNUMSERIE: TStringField
      FieldName = 'NUMSERIE'
      Origin = '"CM.BEM".NUMSERIE'
    end
    object qryBemDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
      Origin = '"CM.BEM".DTAINCLUSAO'
    end
    object qryBemVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
      Origin = '"CM.BEM".VALHISTORICO'
    end
    object qryBemVALORG: TFloatField
      FieldName = 'VALORG'
      Origin = '"CM.BEM".VALORG'
    end
    object qryBemCMBEM: TFloatField
      FieldName = 'CMBEM'
      Origin = '"CM.BEM".CMBEM'
    end
    object qryBemVALFIS: TFloatField
      FieldName = 'VALFIS'
      Origin = '"CM.BEM".VALFIS'
    end
    object qryBemVALGER: TFloatField
      FieldName = 'VALGER'
      Origin = '"CM.BEM".VALGER'
    end
    object qryBemDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
      Origin = '"CM.BEM".DATAINICIODEP'
    end
    object qryBemVALDEPINI: TFloatField
      FieldName = 'VALDEPINI'
      Origin = '"CM.BEM".VALDEPINI'
    end
    object qryBemTAXADEP: TFloatField
      FieldName = 'TAXADEP'
      Origin = '"CM.BEM".TAXADEP'
    end
    object qryBemDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      Origin = '"CM.BEM".DEPLANC'
    end
    object qryBemCMDEP: TFloatField
      FieldName = 'CMDEP'
      Origin = '"CM.BEM".CMDEP'
    end
    object qryBemDEPFIS: TFloatField
      FieldName = 'DEPFIS'
      Origin = '"CM.BEM".DEPFIS'
    end
    object qryBemDEPGER: TFloatField
      FieldName = 'DEPGER'
      Origin = '"CM.BEM".DEPGER'
    end
    object qryBemDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = '"CM.BEM".DATAULTDEP'
    end
    object qryBemDATARECALCDEP: TDateTimeField
      FieldName = 'DATARECALCDEP'
      Origin = '"CM.BEM".DATARECALCDEP'
    end
    object qryBemFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
      Origin = '"CM.BEM".FLGDEPREC'
    end
    object qryBemPROPBAIXA: TFloatField
      FieldName = 'PROPBAIXA'
      Origin = '"CM.BEM".PROPBAIXA'
    end
    object qryBemBAIXATOTAL: TStringField
      FieldName = 'BAIXATOTAL'
      Origin = '"CM.BEM".BAIXATOTAL'
      Size = 1
    end
    object qryBemIDOPCIONAL: TStringField
      FieldName = 'IDOPCIONAL'
      Origin = '"CM.BEM".IDOPCIONAL'
      Size = 30
    end
    object qryBemUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = '"CM.BEM".UNIDNEGOC'
    end
    object qryBemPROCESSOAQUIS: TStringField
      FieldName = 'PROCESSOAQUIS'
      Origin = '"CM.BEM".PROCESSOAQUIS'
      Size = 30
    end
    object qryBemEMPENHOAQUIS: TStringField
      FieldName = 'EMPENHOAQUIS'
      Origin = '"CM.BEM".EMPENHOAQUIS'
      Size = 30
    end
    object qryBemPUBAUTOR: TStringField
      FieldName = 'PUBAUTOR'
      Origin = '"CM.BEM".PUBAUTOR'
      Size = 60
    end
    object qryBemPUBEDITORA: TStringField
      FieldName = 'PUBEDITORA'
      Origin = '"CM.BEM".PUBEDITORA'
      Size = 60
    end
    object qryBemPUBANO: TFloatField
      FieldName = 'PUBANO'
      Origin = '"CM.BEM".PUBANO'
    end
    object qryBemVALCTB: TFloatField
      FieldName = 'VALCTB'
      Origin = '"CM.BEM".VALORG'
    end
    object qryBemPRIORIDADE: TFloatField
      FieldName = 'PRIORIDADE'
      Origin = 'BASEDADOS.BEM.PRIORIDADE'
    end
    object qryBemDATAINSTALACAO: TDateTimeField
      FieldName = 'DATAINSTALACAO'
      Origin = 'BASEDADOS.BEM.DATAINSTALACAO'
    end
    object qryBemDATATERMINOGAR: TDateTimeField
      FieldName = 'DATATERMINOGAR'
      Origin = 'BASEDADOS.BEM.DATATERMINOGAR'
    end
  end
  object updBem: TUpdateSQL
    ModifySQL.Strings = (
      'update BEM'
      'set'
      '  IDCONJUNTO = :IDCONJUNTO,'
      '  IDTERCEIRO = :IDTERCEIRO,'
      '  IDGRUPO = :IDGRUPO,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  IDCLASSEBEM = :IDCLASSEBEM,'
      '  IDMODULO = :IDMODULO,'
      '  IDITENSRECDEV = :IDITENSRECDEV,'
      '  IDFORNSERV = :IDFORNSERV,'
      '  IDSITUACAO = :IDSITUACAO,'
      '  IDIMAGEM = :IDIMAGEM,'
      '  REGISTRO = :REGISTRO,'
      '  CONTROLE = :CONTROLE,'
      '  PLACA = :PLACA,'
      '  DESBEM = :DESBEM,'
      '  IDNOTA = :IDNOTA,'
      '  COMPLNOTA = :COMPLNOTA,'
      '  DTANOTA = :DTANOTA,'
      '  NUMSERIE = :NUMSERIE,'
      '  DTAINCLUSAO = :DTAINCLUSAO,'
      '  VALHISTORICO = :VALHISTORICO,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  VALFIS = :VALFIS,'
      '  VALGER = :VALGER,'
      '  DATAINICIODEP = :DATAINICIODEP,'
      '  VALDEPINI = :VALDEPINI,'
      '  TAXADEP = :TAXADEP,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  DEPFIS = :DEPFIS,'
      '  DEPGER = :DEPGER,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  DATARECALCDEP = :DATARECALCDEP,'
      '  FLGDEPREC = :FLGDEPREC,'
      '  PROPBAIXA = :PROPBAIXA,'
      '  BAIXATOTAL = :BAIXATOTAL,'
      '  IDOPCIONAL = :IDOPCIONAL,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  PROCESSOAQUIS = :PROCESSOAQUIS,'
      '  EMPENHOAQUIS = :EMPENHOAQUIS,'
      '  PUBAUTOR = :PUBAUTOR,'
      '  PUBEDITORA = :PUBEDITORA,'
      '  PUBANO = :PUBANO,'
      '  PRIORIDADE = :PRIORIDADE,'
      '  DATAINSTALACAO = :DATAINSTALACAO,'
      '  DATATERMINOGAR = :DATATERMINOGAR'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into BEM'
      
        '  (IDBEM, IDPESSOA, IDCONJUNTO, IDTERCEIRO, IDGRUPO, CODSUBCONTA' +
        ', IDCLASSEBEM, '
      
        '   IDMODULO, IDITENSRECDEV, IDFORNSERV, IDSITUACAO, IDIMAGEM, RE' +
        'GISTRO, '
      
        '   CONTROLE, PLACA, DESBEM, IDNOTA, COMPLNOTA, DTANOTA, NUMSERIE' +
        ', DTAINCLUSAO, '
      
        '   VALHISTORICO, VALORG, CMBEM, VALFIS, VALGER, DATAINICIODEP, V' +
        'ALDEPINI, '
      
        '   TAXADEP, DEPLANC, CMDEP, DEPFIS, DEPGER, DATAULTDEP, DATARECA' +
        'LCDEP, '
      
        '   FLGDEPREC, PROPBAIXA, BAIXATOTAL, IDOPCIONAL, UNIDNEGOC, PROC' +
        'ESSOAQUIS, '
      
        '   EMPENHOAQUIS, PUBAUTOR, PUBEDITORA, PUBANO, PRIORIDADE, DATAI' +
        'NSTALACAO, '
      '   DATATERMINOGAR)'
      'values'
      
        '  (:IDBEM, :IDPESSOA, :IDCONJUNTO, :IDTERCEIRO, :IDGRUPO, :CODSU' +
        'BCONTA, '
      
        '   :IDCLASSEBEM, :IDMODULO, :IDITENSRECDEV, :IDFORNSERV, :IDSITU' +
        'ACAO, :IDIMAGEM, '
      
        '   :REGISTRO, :CONTROLE, :PLACA, :DESBEM, :IDNOTA, :COMPLNOTA, :' +
        'DTANOTA, '
      
        '   :NUMSERIE, :DTAINCLUSAO, :VALHISTORICO, :VALORG, :CMBEM, :VAL' +
        'FIS, :VALGER, '
      
        '   :DATAINICIODEP, :VALDEPINI, :TAXADEP, :DEPLANC, :CMDEP, :DEPF' +
        'IS, :DEPGER, '
      
        '   :DATAULTDEP, :DATARECALCDEP, :FLGDEPREC, :PROPBAIXA, :BAIXATO' +
        'TAL, :IDOPCIONAL, '
      
        '   :UNIDNEGOC, :PROCESSOAQUIS, :EMPENHOAQUIS, :PUBAUTOR, :PUBEDI' +
        'TORA, :PUBANO, '
      '   :PRIORIDADE, :DATAINSTALACAO, :DATATERMINOGAR)')
    DeleteSQL.Strings = (
      'delete from BEM'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 32
    Top = 63
  end
  object qryRegistraValorMovimentacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO VALORMOVIMENTACAO'
      '               (IDMOVIMENTACAO,'
      '                VALOFI,'
      '                VALGER,'
      '                VALFIS)'
      'VALUES (:PIDMOVIMENTACAO,'
      '                :PVALOFI,'
      '                :PVALGER,'
      '                :PVALFIS)')
    ValidateWithMask = True
    Left = 254
    Top = 63
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALOFI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALFIS'
        ParamType = ptUnknown
      end>
  end
  object qryParamCaf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOEDAOFICIAL,MOEDAFISCAL,MOEDAGERENCIAL,NUMDIASANO,'
      '       MASCCODGRUPO,ALUGUELINTERNO,GERARREQMAT,'
      '       DATAULTDEP,DATARECALCDEP,DTAULTALUG,SEQBEMEMP,'
      '       EDITACODBEM,EDITACODGRUPO,SISTEMAS,DATAINICIAL,'
      '       ULTTXTCONTAB,FLGCALCCM,FLGTIPOCALC,MASCARACLASSE,'
      '       INTEGRACONTAB,INTEGRACAP,INTEGRACAR,PLANOVIGENTE,'
      '       FLGREAVAL,TIPOPERCTB,FLGREMOVEPLANCTB,ATIVPROJETO,'
      '       PROXIMAPLACA,FLGCLSDESBEM,DIGMASCPLACA,PATROPADRAO,'
      '       PLANPREVPADRAO'
      'FROM   PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 444
    Top = 63
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamCafMOEDAOFICIAL: TFloatField
      FieldName = 'MOEDAOFICIAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAOFICIAL'
    end
    object qryParamCafMOEDAFISCAL: TFloatField
      FieldName = 'MOEDAFISCAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAFISCAL'
    end
    object qryParamCafMOEDAGERENCIAL: TFloatField
      FieldName = 'MOEDAGERENCIAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAGERENCIAL'
    end
    object qryParamCafNUMDIASANO: TFloatField
      FieldName = 'NUMDIASANO'
      Origin = 'PARAMETROSCAFMANUT.NUMDIASANO'
    end
    object qryParamCafMASCCODGRUPO: TStringField
      FieldName = 'MASCCODGRUPO'
      Origin = 'PARAMETROSCAFMANUT.MASCCODGRUPO'
    end
    object qryParamCafALUGUELINTERNO: TFloatField
      FieldName = 'ALUGUELINTERNO'
      Origin = 'PARAMETROSCAFMANUT.ALUGUELINTERNO'
    end
    object qryParamCafGERARREQMAT: TFloatField
      FieldName = 'GERARREQMAT'
      Origin = 'PARAMETROSCAFMANUT.GERARREQMAT'
    end
    object qryParamCafDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'PARAMETROSCAFMANUT.DATAULTDEP'
    end
    object qryParamCafDATARECALCDEP: TDateTimeField
      FieldName = 'DATARECALCDEP'
      Origin = 'PARAMETROSCAFMANUT.DATARECALCDEP'
    end
    object qryParamCafDTAULTALUG: TDateTimeField
      FieldName = 'DTAULTALUG'
      Origin = 'PARAMETROSCAFMANUT.DTAULTALUG'
    end
    object qryParamCafSEQBEMEMP: TFloatField
      FieldName = 'SEQBEMEMP'
      Origin = 'PARAMETROSCAFMANUT.SEQBEMEMP'
    end
    object qryParamCafEDITACODBEM: TFloatField
      FieldName = 'EDITACODBEM'
      Origin = 'PARAMETROSCAFMANUT.EDITACODBEM'
    end
    object qryParamCafEDITACODGRUPO: TFloatField
      FieldName = 'EDITACODGRUPO'
      Origin = 'PARAMETROSCAFMANUT.EDITACODGRUPO'
    end
    object qryParamCafSISTEMAS: TStringField
      FieldName = 'SISTEMAS'
      Origin = 'PARAMETROSCAFMANUT.SISTEMAS'
      Size = 8
    end
    object qryParamCafDATAINICIAL: TDateTimeField
      FieldName = 'DATAINICIAL'
      Origin = 'PARAMETROSCAFMANUT.DATAINICIAL'
    end
    object qryParamCafULTTXTCONTAB: TDateTimeField
      FieldName = 'ULTTXTCONTAB'
      Origin = 'PARAMETROSCAFMANUT.ULTTXTCONTAB'
    end
    object qryParamCafFLGCALCCM: TFloatField
      FieldName = 'FLGCALCCM'
      Origin = 'PARAMETROSCAFMANUT.FLGCALCCM'
    end
    object qryParamCafFLGTIPOCALC: TStringField
      FieldName = 'FLGTIPOCALC'
      Origin = 'PARAMETROSCAFMANUT.FLGTIPOCALC'
      Size = 1
    end
    object qryParamCafMASCARACLASSE: TStringField
      FieldName = 'MASCARACLASSE'
      Origin = 'PARAMETROSCAFMANUT.MASCARACLASSE'
      Size = 15
    end
    object qryParamCafINTEGRACONTAB: TStringField
      FieldName = 'INTEGRACONTAB'
      Origin = 'PARAMETROSCAFMANUT.INTEGRACONTAB'
      Size = 1
    end
    object qryParamCafINTEGRACAP: TStringField
      FieldName = 'INTEGRACAP'
      Origin = 'PARAMETROSCAFMANUT.INTEGRACAP'
      Size = 1
    end
    object qryParamCafINTEGRACAR: TStringField
      FieldName = 'INTEGRACAR'
      Origin = 'PARAMETROSCAFMANUT.INTEGRACAR'
      Size = 1
    end
    object qryParamCafPLANOVIGENTE: TFloatField
      FieldName = 'PLANOVIGENTE'
    end
    object qryParamCafFLGREAVAL: TStringField
      FieldName = 'FLGREAVAL'
      Size = 1
    end
    object qryParamCafTIPOPERCTB: TStringField
      FieldName = 'TIPOPERCTB'
      Size = 2
    end
    object qryParamCafFLGREMOVEPLANCTB: TStringField
      FieldName = 'FLGREMOVEPLANCTB'
      Origin = '"CM.PARAMETROSCAFMANUT".FLGREMOVEPLANCTB'
      Size = 1
    end
    object qryParamCafATIVPROJETO: TFloatField
      FieldName = 'ATIVPROJETO'
    end
    object qryParamCafPROXIMAPLACA: TFloatField
      FieldName = 'PROXIMAPLACA'
      Origin = '"CM.PARAMETROSCAFMANUT".PROXIMAPLACA'
    end
    object qryParamCafFLGCLSDESBEM: TFloatField
      FieldName = 'FLGCLSDESBEM'
      Origin = '"CM.PARAMETROSCAFMANUT".FLGCLSDESBEM'
    end
    object qryParamCafDIGMASCPLACA: TFloatField
      FieldName = 'DIGMASCPLACA'
    end
    object qryParamCafPATROPADRAO: TFloatField
      FieldName = 'PATROPADRAO'
    end
    object qryParamCafPLANPREVPADRAO: TFloatField
      FieldName = 'PLANPREVPADRAO'
    end
  end
  object qryParamGlob: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNIDNEGOC, MASCARACC'
      'FROM     PARAMGLOBAL'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 444
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamGlobUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PARAMGLOBAL.UNIDNEGOC'
    end
    object qryParamGlobMASCARACC: TStringField
      FieldName = 'MASCARACC'
      Origin = 'PARAMGLOBAL.MASCARACC'
      Size = 18
    end
  end
  object qryCCrd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDCONJUNTO,'
      '       R.CODCENTROCUSTO,'
      '       R.PARTICIPACAO,'
      '       R.DTAINICIO,'
      '       R.DTAFIM,'
      '       CC.NOME,'
      '       CC.STATUSGRUPOCDC AS TIPO'
      'FROM RATEIODEPRECIACAO R,'
      '     CENTCUST CC'
      'WHERE (R.IDCONJUNTO     = :PIDCONJUNTO)'
      '  AND (R.IDEMPRESA      = :PIDEMPRESA)'
      '  AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      'ORDER BY R.CODCENTROCUSTO'
      ''
      '')
    ValidateWithMask = True
    Left = 184
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryCCrdIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qryCCrdCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryCCrdPARTICIPACAO: TFloatField
      FieldName = 'PARTICIPACAO'
    end
    object qryCCrdDTAINICIO: TDateTimeField
      FieldName = 'DTAINICIO'
    end
    object qryCCrdDTAFIM: TDateTimeField
      FieldName = 'DTAFIM'
    end
    object qryCCrdNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object qryCCrdTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object qryPlanoConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLATIPCONVGER,PLATIPCONVOFICIAL,PLANO,PLACCUST'
      'FROM   PLANOCONTA'
      'WHERE (PLANO           = :PPLANO)'
      '  AND (RTRIM(PLACONTA) = :PPLACONTA)'
      ''
      '')
    ValidateWithMask = True
    Left = 408
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptUnknown
      end>
    object qryPlanoContaPLATIPCONVGER: TStringField
      FieldName = 'PLATIPCONVGER'
      Origin = 'PLANOCONTA.PLATIPCONVGER'
      Size = 1
    end
    object qryPlanoContaPLATIPCONVOFICIAL: TStringField
      FieldName = 'PLATIPCONVOFICIAL'
      Origin = 'PLANOCONTA.PLATIPCONVOFICIAL'
      Size = 1
    end
    object qryPlanoContaPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PLANOCONTA.PLANO'
    end
    object qryPlanoContaPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Origin = 'PLANOCONTA.PLACCUST'
      Size = 1
    end
  end
  object qryConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO,PLACONTA,CODCENTROCUSTO,IDGRUPO,'
      '       IDTIPOMOVIMENTACAO,TIPOLANCAMENTO'
      'FROM   CONTASTIPOSMOVIMENTOGRUPOS'
      'WHERE (IDGRUPO            = :PIDGRUPO)'
      '  AND (IDTIPOMOVIMENTACAO = :PIDTIPOMOVIMENTACAO)'
      '  AND (TIPOLANCAMENTO     = :PTIPOLANCAMENTO)'
      '  AND (PLANO              = :PPLANO)')
    ValidateWithMask = True
    Left = 256
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PTIPOLANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end>
    object qryContaPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.PLANO'
    end
    object qryContaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.PLACONTA'
      Size = 18
    end
    object qryContaCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.CODCENTROCUSTO'
      Size = 10
    end
    object qryContaIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.IDGRUPO'
    end
    object qryContaIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.IDTIPOMOVIMENTACAO'
    end
    object qryContaTIPOLANCAMENTO: TStringField
      FieldName = 'TIPOLANCAMENTO'
      Origin = 'CONTASTIPOSMOVIMENTOGRUPOS.TIPOLANCAMENTO'
      Size = 1
    end
  end
  object qryGrupoCtb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.NOME'
      'FROM    GRUPO G,'
      '               PLANOGRUPO   PG'
      'WHERE (G.IDGRUPO     = :PIDGRUPO)'
      '      AND (PG.IDPESSOA = :PIDPESSOA)'
      '      AND (G.TIPO             = '#39'A'#39' )'
      '      AND (G.STATUS       = '#39'A'#39' )'
      '      AND (G.IDGRUPO     = PG.IDGRUPO)'
      'ORDER BY G.NOME'
      '')
    ValidateWithMask = True
    Left = 408
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryMontaCtb: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT LACNUMDOC,LACDEBCRE,LACHIST1,LACHIST2,LACHIST3,'
      '       LACHIST4, LACHIST5,CODCENTROCUSTO,UNIDNEGOC,'
      '       PLACONTA,LACVALOR,LACVALOFICIAL,LACVALGERENCIAL,'
      '       PLANO,CODSUBCONTA,IDPLANOPREV,IDPATRO'
      'FROM LANCAMENTO'
      'WHERE (PLNCODIGO = 0) ')
    UpdateObject = updMontaCtb
    ValidateWithMask = True
    Left = 184
    Top = 207
    object qryMontaCtbLACNUMDOC: TStringField
      FieldName = 'LACNUMDOC'
      Origin = 'LANCAMENTO.LACNUMDOC'
      Size = 15
    end
    object qryMontaCtbLACDEBCRE: TStringField
      FieldName = 'LACDEBCRE'
      Origin = 'LANCAMENTO.LACDEBCRE'
      Size = 1
    end
    object qryMontaCtbLACHIST1: TStringField
      FieldName = 'LACHIST1'
      Origin = 'LANCAMENTO.LACHIST1'
      Size = 40
    end
    object qryMontaCtbLACHIST2: TStringField
      FieldName = 'LACHIST2'
      Origin = 'LANCAMENTO.LACHIST2'
      Size = 40
    end
    object qryMontaCtbLACHIST3: TStringField
      FieldName = 'LACHIST3'
      Origin = 'LANCAMENTO.LACHIST3'
      Size = 40
    end
    object qryMontaCtbLACHIST4: TStringField
      FieldName = 'LACHIST4'
      Origin = 'LANCAMENTO.LACHIST4'
      Size = 40
    end
    object qryMontaCtbLACHIST5: TStringField
      FieldName = 'LACHIST5'
      Origin = 'LANCAMENTO.LACHIST5'
      Size = 40
    end
    object qryMontaCtbCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'LANCAMENTO.CODCENTROCUSTO'
      Size = 10
    end
    object qryMontaCtbUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'LANCAMENTO.UNIDNEGOC'
    end
    object qryMontaCtbPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'LANCAMENTO.PLACONTA'
      Size = 18
    end
    object qryMontaCtbLACVALOR: TFloatField
      FieldName = 'LACVALOR'
      Origin = 'LANCAMENTO.LACVALOR'
    end
    object qryMontaCtbLACVALOFICIAL: TFloatField
      FieldName = 'LACVALOFICIAL'
      Origin = 'LANCAMENTO.LACVALOFICIAL'
    end
    object qryMontaCtbLACVALGERENCIAL: TFloatField
      FieldName = 'LACVALGERENCIAL'
      Origin = 'LANCAMENTO.LACVALGERENCIAL'
    end
    object qryMontaCtbPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'LANCAMENTO.PLANO'
    end
    object qryMontaCtbCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'LANCAMENTO.CODSUBCONTA'
    end
    object qryMontaCtbIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'LANCAMENTO.IDPLANOPREV'
    end
    object qryMontaCtbIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'LANCAMENTO.IDPATRO'
    end
  end
  object updMontaCtb: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTO'
      'set'
      '  LACNUMDOC = :LACNUMDOC,'
      '  LACDEBCRE = :LACDEBCRE,'
      '  LACHIST1 = :LACHIST1,'
      '  LACHIST2 = :LACHIST2,'
      '  LACHIST3 = :LACHIST3,'
      '  LACHIST4 = :LACHIST4,'
      '  LACHIST5 = :LACHIST5,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  PLACONTA = :PLACONTA,'
      '  LACVALOR = :LACVALOR,'
      '  LACVALOFICIAL = :LACVALOFICIAL,'
      '  LACVALGERENCIAL = :LACVALGERENCIAL,'
      '  PLANO = :PLANO,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPATRO = :IDPATRO'
      'where'
      '  LACDEBCRE = :OLD_LACDEBCRE and'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO and'
      '  PLACONTA = :OLD_PLACONTA and'
      '  PLANO = :OLD_PLANO and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPATRO = :OLD_IDPATRO')
    InsertSQL.Strings = (
      'insert into LANCAMENTO'
      
        '  (LACNUMDOC, LACDEBCRE, LACHIST1, LACHIST2, LACHIST3, LACHIST4,' +
        ' LACHIST5, '
      
        '   CODCENTROCUSTO, UNIDNEGOC, PLACONTA, LACVALOR, LACVALOFICIAL,' +
        ' LACVALGERENCIAL, '
      '   PLANO, CODSUBCONTA, IDPLANOPREV, IDPATRO)'
      'values'
      
        '  (:LACNUMDOC, :LACDEBCRE, :LACHIST1, :LACHIST2, :LACHIST3, :LAC' +
        'HIST4, '
      
        '   :LACHIST5, :CODCENTROCUSTO, :UNIDNEGOC, :PLACONTA, :LACVALOR,' +
        ' :LACVALOFICIAL, '
      
        '   :LACVALGERENCIAL, :PLANO, :CODSUBCONTA, :IDPLANOPREV, :IDPATR' +
        'O)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTO'
      'where'
      '  LACDEBCRE = :OLD_LACDEBCRE and'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO and'
      '  PLACONTA = :OLD_PLACONTA and'
      '  PLANO = :OLD_PLANO and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPATRO = :OLD_IDPATRO')
    Left = 184
    Top = 255
  end
  object qryRegistraReaval: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO REAVAL'
      '               (IDMOVIMENTACAO,'
      '                VALORGLAUDO,'
      '                VALORGANT,'
      '                TAXADEPANT,'
      '                OBS)'
      'VALUES (:PIDMOVIMENTACAO,'
      '                :PVALORGLAUDO,'
      '                :PVALORGANT,'
      '                :PTAXADEPORG,'
      '                :POBS)')
    ValidateWithMask = True
    Left = 512
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALORGLAUDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALORGANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PTAXADEPORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'POBS'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraReavaliacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO REAVALIACAO'
      '        (IDREAVALIACAO,'
      '         IDMOVIMENTACAO,'
      '         IDBEM,'
      '         IDPESSOA,'
      '         DATAREAVALIACAO,'
      '         VALORG,'
      '         CMBEM,'
      '         VALFIS,'
      '         VALGER,'
      '         TAXADEP,'
      '         DEPLANC,'
      '         CMDEP,'
      '         DEPFIS,'
      '         DEPGER,'
      '         DATAULTDEP,'
      '         FLGDEPREC,'
      '         FLGULTREAVAL)'
      'VALUES (:PIDREAVALIACAO,'
      '        :PIDMOVIMENTACAO,'
      '        :PIDBEM,'
      '        :PIDPESSOA,'
      '        :PDATAREAVALIACAO,'
      '        :PVALORG,'
      '        :PCMBEM,'
      '        :PVALFIS,'
      '        :PVALGER,'
      '        :PTAXADEP,'
      '        :PDEPLANC,'
      '        :PCMDEP,'
      '        :PDEPFIS,'
      '        :PDEPGER,'
      '        :PDATAULTDEP,'
      '        :PFLGDEPREC,'
      '        :PFLGULTREAVAL)'
      '')
    ValidateWithMask = True
    Left = 512
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PTAXADEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGDEPREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGULTREAVAL'
        ParamType = ptUnknown
      end>
  end
  object qryReavaliacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREAVALIACAO,IDBEM,IDPESSOA,IDMOVIMENTACAO,'
      '               DATAREAVALIACAO,VALORG,CMBEM,VALFIS,VALGER,'
      '               DEPLANC,CMDEP,DEPFIS,DEPGER,DATAULTDEP,'
      '               FLGDEPREC,TAXADEP,FLGULTREAVAL,'
      '               ((VALORG + CMBEM)-(DEPLANC + CMDEP)) AS VALCTB'
      'FROM    REAVALIACAO'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '      AND (IDBEM        = :PIDBEM)'
      '')
    UpdateObject = updReavaliacao
    ValidateWithMask = True
    Left = 32
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryReavaliacaoIDREAVALIACAO: TFloatField
      FieldName = 'IDREAVALIACAO'
      Origin = '"CM.REAVALIACAO".IDREAVALIACAO'
    end
    object qryReavaliacaoIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = '"CM.REAVALIACAO".IDBEM'
    end
    object qryReavaliacaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.REAVALIACAO".IDPESSOA'
    end
    object qryReavaliacaoIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
      Origin = '"CM.REAVALIACAO".IDMOVIMENTACAO'
    end
    object qryReavaliacaoDATAREAVALIACAO: TDateTimeField
      FieldName = 'DATAREAVALIACAO'
      Origin = '"CM.REAVALIACAO".DATAREAVALIACAO'
    end
    object qryReavaliacaoVALORG: TFloatField
      FieldName = 'VALORG'
      Origin = '"CM.REAVALIACAO".VALORG'
    end
    object qryReavaliacaoCMBEM: TFloatField
      FieldName = 'CMBEM'
      Origin = '"CM.REAVALIACAO".CMBEM'
    end
    object qryReavaliacaoVALFIS: TFloatField
      FieldName = 'VALFIS'
      Origin = '"CM.REAVALIACAO".VALFIS'
    end
    object qryReavaliacaoVALGER: TFloatField
      FieldName = 'VALGER'
      Origin = '"CM.REAVALIACAO".VALGER'
    end
    object qryReavaliacaoDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      Origin = '"CM.REAVALIACAO".DEPLANC'
    end
    object qryReavaliacaoCMDEP: TFloatField
      FieldName = 'CMDEP'
      Origin = '"CM.REAVALIACAO".CMDEP'
    end
    object qryReavaliacaoDEPFIS: TFloatField
      FieldName = 'DEPFIS'
      Origin = '"CM.REAVALIACAO".DEPFIS'
    end
    object qryReavaliacaoDEPGER: TFloatField
      FieldName = 'DEPGER'
      Origin = '"CM.REAVALIACAO".DEPGER'
    end
    object qryReavaliacaoDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = '"CM.REAVALIACAO".DATAULTDEP'
    end
    object qryReavaliacaoFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
      Origin = '"CM.REAVALIACAO".FLGDEPREC'
    end
    object qryReavaliacaoVALCTB: TFloatField
      FieldName = 'VALCTB'
      Origin = '"CM.REAVALIACAO".VALORG'
    end
    object qryReavaliacaoTAXADEP: TFloatField
      FieldName = 'TAXADEP'
      Origin = 'REAVALIACAO.TAXADEP'
    end
    object qryReavaliacaoFLGULTREAVAL: TFloatField
      FieldName = 'FLGULTREAVAL'
      Origin = 'REAVALIACAO.FLGULTREAVAL'
    end
  end
  object updReavaliacao: TUpdateSQL
    ModifySQL.Strings = (
      'update REAVALIACAO'
      'set'
      '  IDREAVALIACAO = :IDREAVALIACAO,'
      '  IDBEM = :IDBEM,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDMOVIMENTACAO = :IDMOVIMENTACAO,'
      '  DATAREAVALIACAO = :DATAREAVALIACAO,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  VALFIS = :VALFIS,'
      '  VALGER = :VALGER,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  DEPFIS = :DEPFIS,'
      '  DEPGER = :DEPGER,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  FLGDEPREC = :FLGDEPREC,'
      '  TAXADEP = :TAXADEP,'
      '  FLGULTREAVAL = :FLGULTREAVAL'
      'where'
      '  IDREAVALIACAO = :OLD_IDREAVALIACAO')
    InsertSQL.Strings = (
      'insert into REAVALIACAO'
      
        '  (IDREAVALIACAO, IDBEM, IDPESSOA, IDMOVIMENTACAO, DATAREAVALIAC' +
        'AO, VALORG, '
      
        '   CMBEM, VALFIS, VALGER, DEPLANC, CMDEP, DEPFIS, DEPGER, DATAUL' +
        'TDEP, FLGDEPREC, '
      '   TAXADEP, FLGULTREAVAL)'
      'values'
      
        '  (:IDREAVALIACAO, :IDBEM, :IDPESSOA, :IDMOVIMENTACAO, :DATAREAV' +
        'ALIACAO, '
      
        '   :VALORG, :CMBEM, :VALFIS, :VALGER, :DEPLANC, :CMDEP, :DEPFIS,' +
        ' :DEPGER, '
      '   :DATAULTDEP, :FLGDEPREC, :TAXADEP, :FLGULTREAVAL)')
    DeleteSQL.Strings = (
      'delete from REAVALIACAO'
      'where'
      '  IDREAVALIACAO = :OLD_IDREAVALIACAO')
    Left = 32
    Top = 159
  end
  object qryRegistraBaixaBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO BAIXABEM'
      '               (IDMOVIMENTACAO,'
      '                IDMOTIVOBAIXA,'
      '                PROPBAIXAR,'
      '                OBS,'
      '                IDREAVAL)'
      'VALUES (:PIDMOVIMENTACAO,'
      '                :PIDMOTIVOBAIXA,'
      '                :PPROPBAIXAR,'
      '                :POBS,'
      '                :PIDREAVAL)'
      '')
    ValidateWithMask = True
    Left = 356
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOTIVOBAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPROPBAIXAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'POBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDREAVAL'
        ParamType = ptUnknown
      end>
  end
  object qryHistCtb: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTORICOMOVIMENTACAO  '
      'SET PLNCODIGO = :PPLNCODIGO'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)')
    ValidateWithMask = True
    Left = 408
    Top = 63
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qrySldContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBEM, B.TAXADEP, B.DATAULTDEP,'
      
        '       SB.VALORG                                            AS V' +
        'ALORG0,'
      
        '       SB.REAVVALORG                                        AS V' +
        'ALREAVACUM0,'
      
        '       (NVL(ATU.VALCMBEM,0) + NVL(ATU.VALCMREAV,0))         AS C' +
        'MBEMATU0,'
      
        '       (SB.CMBEM + SB.REAVCMBEM)                            AS C' +
        'MBEMACUM0,'
      
        '       (NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0))       AS D' +
        'EPLANCATU0,'
      
        '       (SB.DEPLANC + SB.REAVDEPLANC)                        AS D' +
        'EPLANCACUM0,'
      
        '       (SB.CMDEP + SB.REAVCMDEP)                            AS C' +
        'MDEPLANCACUM0,'
      '       (SB.VALORG + SB.CMBEM -'
      '        SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      
        '        SB.REAVDEPLANC - SB.REAVCMDEP)                      AS V' +
        'ALCTB0,'
      ''
      
        '       SB.ULTREAVVALORG                                     AS V' +
        'ALULTREAVACUM1,'
      
        '       NVL(ATU.VALCMULTREAV,0)                              AS V' +
        'ALULTCMREAVATU,'
      
        '       SB.ULTREAVCMBEM                                      AS V' +
        'ALULTCMREAVACUM1,'
      
        '       NVL(ATU.VALDEPULTREAV,0)                             AS V' +
        'ALULTDEPREAVATU,'
      
        '       SB.ULTREAVDEPLANC                                    AS V' +
        'ALULTDEPREAVACUM1,'
      
        '       SB.ULTREAVCMDEP                                      AS V' +
        'ALULTCMDEPREAVACUM1,'
      '       (SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)                AS V' +
        'ALCTB1,'
      ''
      
        '       (SB.REAVVALORG + SB.ULTREAVVALORG)                   AS S' +
        'UMPARCREAV,'
      '       (NVL(ATU.VALCMBEM,0) + NVL(ATU.VALCMREAV,0) +'
      
        '        NVL(ATU.VALCMULTREAV,0))                            AS S' +
        'UMCMBEMATU,'
      '       (SB.CMBEM + SB.REAVCMBEM +'
      
        '        SB.ULTREAVCMBEM)                                    AS S' +
        'UMCMBEMACUM,'
      '       (NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0) +'
      
        '        NVL(ATU.VALDEPULTREAV,0))                           AS S' +
        'UMDEPATU,'
      '       (SB.DEPLANC + SB.REAVDEPLANC +'
      
        '        SB.ULTREAVDEPLANC)                                  AS S' +
        'UMDEPACUM,'
      '       (SB.CMDEP + SB.REAVCMDEP +'
      
        '        SB.ULTREAVCMDEP)                                    AS S' +
        'UMCMDEPACUM,'
      '       (SB.VALORG + SB.CMBEM -'
      '        SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      '        SB.REAVDEPLANC - SB.REAVCMDEP) +'
      '       (SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)                AS S' +
        'UMVALCTB,'
      '       (SB.VALORG + SB.CMBEM -'
      '        SB.REAVVALORG + SB.REAVCMBEM) +'
      
        '       (SB.ULTREAVVALORG + SB.ULTREAVCMBEM)                 AS S' +
        'UMVALCTBIMOB,'
      ''
      
        '       B.DESBEM, B.IDGRUPO, B.IDCONJUNTO, C.DESCCONJUNTO, G.NOME' +
        ' AS DESCGRUPO'
      ''
      'FROM (SELECT SCB.IDBEM, SCB.DATASLDBEM,'
      '             SCB.VALORG, SCB.REAVVALORG, SCB.ULTREAVVALORG,'
      '             SCB.CMBEM, SCB.REAVCMBEM, SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP, SCB.REAVCMDEP, SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATAMOV)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.IDBEM = :PIDBEM)'
      '        AND (SCB.IDPESSOA = :PIDPESSOA)'
      '        AND (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB,'
      ''
      '     (SELECT ATX.IDBEM, ATX.DATAMOVIMENTACAO,'
      
        '             SUM(ATX.VLCMBEM) AS VALCMBEM, SUM(ATX.VLCMREAV) AS ' +
        'VALCMREAV,'
      
        '             SUM(ATX.VLDEPBEM) AS VALDEPBEM, SUM(ATX.VLDEPREAV) ' +
        'AS VALDEPREAV,'
      
        '             SUM(ATX.VLCMULTREAV) AS VALCMULTREAV, SUM(ATX.VLDEP' +
        'ULTREAV) AS VALDEPULTREAV'
      '      FROM ((SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                    HM.IDBEM,'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     42,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     34,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     50,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLCMBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLCMREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     17,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     43,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     35,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     51,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLDEPBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLCMULTREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM'
      '             WHERE (HM.IDBEM = :PIDBEM)'
      '               AND (HM.IDPESSOA = :PIDPESSOA)'
      '               AND (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '             ((SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALCMULTREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '               WHERE (HM.IDBEM = :PIDBEM)'
      '                 AND (HM.IDPESSOA = :PIDPESSOA)'
      '                 AND (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '                 AND (R.FLGULTREAVAL = 0)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '              (SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMULTREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '               WHERE (HM.IDBEM = :PIDBEM)'
      '                 AND (HM.IDPESSOA = :PIDPESSOA)'
      '                 AND (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '                 AND (R.FLGULTREAVAL = 1)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO))) ATX'
      '      GROUP BY ATX.IDBEM, ATX.DATAMOVIMENTACAO) ATU,'
      ''
      '     BEM B, GRUPO G, CONJUNTO C'
      ''
      'WHERE (B.IDBEM    = :PIDBEM)'
      '  AND (B.IDPESSOA = :PIDPESSOA)'
      '  AND (B.DATAINICIODEP <= :PDATAMOV)'
      '  AND (B.IDGRUPO = G.IDGRUPO(+))'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO(+))'
      '  AND (B.IDBEM = ATU.IDBEM(+))'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 104
    Top = 15
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO, MOEPERIODICIDADE, MOEDESC'
      'FROM   MOEDA'
      'WHERE (MOECODIGO = :PMOEDA)')
    ValidateWithMask = True
    Left = 444
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PMOEDA'
        ParamType = ptUnknown
      end>
    object qryMoedaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
    end
    object qryMoedaMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Origin = 'MOEDA.MOEPERIODICIDADE'
      Size = 1
    end
    object qryMoedaMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
  end
  object qryMoedaM: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COTVALOR               '
      'FROM COTACAOMOEDA         '
      'WHERE (MOECODIGO = :PMOEDA)'
      '      AND (COTMESREF = :PCOTMES)')
    ValidateWithMask = True
    Left = 444
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PMOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCOTMES'
        ParamType = ptUnknown
      end>
    object qryMoedaMCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'COTACAOMOEDA.COTVALOR'
    end
  end
  object qryMoedaD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COTVALOR               '
      'FROM COTACAOMOEDA         '
      'WHERE (MOECODIGO = :PMOEDA)'
      '      AND (COTDATA      = :PCOTDATA)')
    ValidateWithMask = True
    Left = 444
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PMOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PCOTDATA'
        ParamType = ptUnknown
      end>
    object qryMoedaDCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'COTACAOMOEDA.COTVALOR'
    end
  end
  object qryPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, NOME, FLGFORNSERV '
      'FROM PESSOA'
      'WHERE (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 444
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryPessoaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
    end
    object qryPessoaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryPessoaFLGFORNSERV: TFloatField
      FieldName = 'FLGFORNSERV'
      Origin = 'PESSOA.FLGFORNSERV'
    end
  end
  object qryGrupos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO,NOME,DEPRECIACAO AS TAXADEP,CLASSE,FLGSEMPLACA'
      'FROM GRUPO'
      'WHERE (TIPO = '#39'A'#39')'
      '  AND (IDGRUPO = :PIDGRUPO)')
    ValidateWithMask = True
    Left = 184
    Top = 63
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object qryGruposIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qryGruposNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryGruposTAXADEP: TFloatField
      FieldName = 'TAXADEP'
      Origin = 'GRUPO.DEPRECIACAO'
    end
    object qryGruposCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryGruposFLGSEMPLACA: TFloatField
      FieldName = 'FLGSEMPLACA'
      Origin = 'GRUPO.FLGSEMPLACA'
    end
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDPESSOA, CODSUBCONTA, NOMESUBCONTA'
      'FROM     SUBCONTA'
      'WHERE  (IDPESSOA = :PIDPESSOA)'
      '      AND  (CODSUBCONTA = :PIDSUBCONTA)')
    ValidateWithMask = True
    Left = 256
    Top = 63
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDSUBCONTA'
        ParamType = ptUnknown
      end>
  end
  object qryPlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLACA, DESBEM, IDBEM'
      'FROM BEM'
      'WHERE (PLACA = :PIDPLACA)')
    ValidateWithMask = True
    Left = 104
    Top = 63
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPLACA'
        ParamType = ptUnknown
      end>
  end
  object qrySituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDSITUACAO, DESCSITUACAO'
      'FROM     SITUACAO'
      'WHERE  (IDSITUACAO = :PIDSITUACAO)'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 104
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDSITUACAO'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO BEM (IDBEM,'
      '                 IDPESSOA,'
      '                 IDCONJUNTO,'
      '                 IDTERCEIRO,'
      '                 IDGRUPO,'
      '                 CODSUBCONTA,'
      '                 IDCLASSEBEM,'
      '                 IDMODULO,'
      '                 IDITENSRECDEV,'
      '                 IDFORNSERV,'
      '                 IDSITUACAO,'
      '                 IDIMAGEM,'
      '                 REGISTRO,'
      '                 CONTROLE,'
      '                 PLACA,'
      '                 NUMSERIE,'
      '                 DESBEM,'
      '                 IDNOTA,'
      '                 COMPLNOTA,'
      '                 DTANOTA,'
      '                 DTAINCLUSAO,'
      '                 VALHISTORICO,'
      '                 VALORG,'
      '                 CMBEM,'
      '                 VALFIS,'
      '                 VALGER,'
      '                 DATAINICIODEP,'
      '                 VALDEPINI,'
      '                 TAXADEP,'
      '                 DEPLANC,'
      '                 CMDEP,'
      '                 DEPFIS,'
      '                 DEPGER,'
      '                 DATAULTDEP,'
      '                 DATARECALCDEP,'
      '                 FLGDEPREC,'
      '                 PROPBAIXA,'
      '                 BAIXATOTAL,'
      '                 PRIORIDADE,'
      '                 DATAINSTALACAO,'
      '                 DATATERMINOGAR,'
      '                 IDOPCIONAL,'
      '                 UNIDNEGOC,'
      '                 PROCESSOAQUIS,'
      '                 EMPENHOAQUIS,'
      '                 PUBAUTOR,'
      '                 PUBEDITORA,'
      '                 PUBANO)'
      'VALUES          (:PIDBEM,'
      '                 :PIDPESSOA,'
      '                 :PIDCONJUNTO,'
      '                 :PIDTERCEIRO,'
      '                 :PIDGRUPO,'
      '                 :PSUBCONTA,'
      '                 :PIDCLASSEBEM,'
      '                 :PIDMODULO,'
      '                 :PIDITENSRECDEV,'
      '                 :PIDFORNSERV,'
      '                 :PIDSITUACAO,'
      '                 :PIDIMAGEM,'
      '                 :PREGISTRO,'
      '                 :PCONTROLE,'
      '                 :PPLACA,'
      '                 :PNUMSERIE,'
      '                 :PDESBEM,'
      '                 :PIDNOTA,'
      '                 :PCOMPLNOTA,'
      '                 :PDTANOTA,'
      '                 :PDTAINCLUSAO,'
      '                 :PVALHISTORICO,'
      '                 :PVALORG,'
      '                 :PCMBEM,'
      '                 :PVALFIS,'
      '                 :PVALGER,'
      '                 :PDATAINICIODEP,'
      '                 :PVALDEPINI,'
      '                 :PTAXADEP,'
      '                 :PDEPLANC,'
      '                 :PCMDEP,'
      '                 :PDEPFIS,'
      '                 :PDEPGER,'
      '                 :PDATAULTDEP,'
      '                 :PDATARECALCDEP,'
      '                 :PFLGDEPREC,'
      '                 :PPROPBAIXA,'
      '                 :PBAIXATOTAL,'
      '                 :PPRIORIDADE,'
      '                 :PDATAINSTALACAO,'
      '                 :PDATATERMINOGAR,'
      '                 :PIDOPCIONAL,'
      '                 :PUNIDNEGOC,'
      '                 :PPROCESSOAQUIS,'
      '                 :PEMPENHOAQUIS,'
      '                 :PPUBAUTOR,'
      '                 :PPUBEDITORA,'
      '                 :PPUBANO)'
      '')
    ValidateWithMask = True
    Left = 356
    Top = 63
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTERCEIRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCLASSEBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDITENSRECDEV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORNSERV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDSITUACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PREGISTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCONTROLE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPLACA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PDESBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIDNOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCOMPLNOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTANOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTAINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALHISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINICIODEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PVALDEPINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PTAXADEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'PDEPGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATARECALCDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGDEPREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPROPBAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PBAIXATOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPRIORIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINSTALACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATATERMINOGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIDOPCIONAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PUNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPROCESSOAQUIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PEMPENHOAQUIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPUBAUTOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPUBEDITORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPUBANO'
        ParamType = ptUnknown
      end>
  end
  object qryClasseBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCLASSEBEM,ANASINT,DESCRICAO'
      'FROM CLASSEDEBEM'
      'WHERE (IDCLASSEBEM = :PIDCLASSEBEM)')
    ValidateWithMask = True
    Left = 184
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCLASSEBEM'
        ParamType = ptUnknown
      end>
    object qryClasseBemIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = '"CM.CLASSEDEBEM".IDCLASSEBEM'
    end
    object qryClasseBemANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = '"CM.CLASSEDEBEM".ANASINT'
      Size = 1
    end
    object qryClasseBemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"CM.CLASSEDEBEM".DESCRICAO'
      Size = 60
    end
  end
  object qryContasxCc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO FROM CONTASXCC'
      'WHERE (IDEMPRESA             = :PIDEMPRESA)'
      '  AND (PLANO                 = :PPLANO)'
      '  AND (RTRIM(PLACONTA)       = :PPLACONTA)'
      '  AND (RTRIM(CODCENTROCUSTO) = :PCODCENTROCUSTO)')
    ValidateWithMask = True
    Left = 256
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODCENTROCUSTO'
        ParamType = ptUnknown
      end>
    object qryContasxCcCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CONTASXCC.CODCENTROCUSTO'
      Size = 10
    end
  end
  object qryContasxSubC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODSUBCONTA FROM CONTASXSUBC '
      'WHERE (IDPESSOA        = :PIDEMPRESA)'
      '  AND (PLANO           = :PPLANO)'
      '  AND (RTRIM(PLACONTA) = :PPLACONTA)'
      '  AND (CODSUBCONTA     = :PCODSUBCONTA)')
    ValidateWithMask = True
    Left = 408
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODSUBCONTA'
        ParamType = ptUnknown
      end>
    object qryContasxSubCCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'CONTASXSUBC.CODSUBCONTA'
    end
  end
  object qryRegistraBemTotal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE BEM'
      'SET CODSUBCONTA   = :PSUBCONTA,'
      '    UNIDNEGOC     = :PUNIDNEGOC,'
      '    CONTROLE      = '#39'T'#39','
      '    VALHISTORICO  = :PVALHISTORICO,'
      '    VALORG        = :PVALORG,'
      '    CMBEM         = 0,'
      '    VALFIS        = :PVALFIS,'
      '    VALGER        = :PVALGER,'
      '    VALDEPINI     = 0,'
      '    DEPLANC       = 0,'
      '    CMDEP         = 0,'
      '    DEPFIS        = 0,'
      '    DEPGER        = 0,'
      '    DATAINICIODEP = :PDATAINICIODEP,'
      '    DATAULTDEP    = :PDATAULTDEP,'
      '    DATARECALCDEP = :PDATARECALCDEP'
      'WHERE (IDBEM    = :PIDBEM)'
      '  AND (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 356
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PUNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALHISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINICIODEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATARECALCDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraAcrescimo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO ACRESCIMOVALOR'
      '                (IDACRESCIMO,'
      '                 IDPESSOA, '
      '                 IDBEM, '
      '                 IDMOVIMENTACAO, '
      '                 DATAACRESCIMO, '
      '                 VALORG, '
      '                 CMBEM,'
      '                 VALFIS, '
      '                 VALGER, '
      '                 TAXADEP,'
      '                 DEPLANC, '
      '                 CMDEP, '
      '                 DEPFIS, '
      '                 DEPGER, '
      '                 DATAULTDEP,'
      '                 FLGDEPREC)'
      'VALUES  (:PIDACRESCIMO,'
      '                 :PIDPESSOA, '
      '                 :PIDBEM, '
      '                 :PIDMOVIMENTACAO, '
      '                 :PDATAACRESCIMO, '
      '                 :PVALORG, '
      '                 :PCMBEM,'
      '                 :PVALFIS, '
      '                 :PVALGER,'
      '                 :PTAXADEP, '
      '                 :PDEPLANC, '
      '                 :PCMDEP, '
      '                 :PDEPFIS, '
      '                 :PDEPGER, '
      '                 :PDATAULTDEP,'
      '                 :PFLGDEPREC)')
    ValidateWithMask = True
    Left = 356
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDACRESCIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAACRESCIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVALGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PTAXADEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PDEPFIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PDEPGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGDEPREC'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraAcresc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO ACRESCVALOR'
      '           (IDMOVIMENTACAO,'
      '            IDTIPODESPESA,'
      '            OBS)'
      'VALUES     (:PIDMOVIMENTACAO,'
      '            :PIDTIPODESPESA,'
      '            :POBS)')
    ValidateWithMask = True
    Left = 356
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPODESPESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'POBS'
        ParamType = ptUnknown
      end>
  end
  object qryTipoDespAV: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPODESPESA,DESTIPODESPESA'
      'FROM    TIPODESPESAAV')
    ValidateWithMask = True
    Left = 328
    Top = 111
    object qryTipoDespAVIDTIPODESPESA: TFloatField
      FieldName = 'IDTIPODESPESA'
      Origin = 'TIPODESPESAAV.IDTIPODESPESA'
    end
    object qryTipoDespAVDESTIPODESPESA: TStringField
      FieldName = 'DESTIPODESPESA'
      Origin = 'TIPODESPESAAV.DESTIPODESPESA'
      Size = 50
    end
  end
  object qryAcrescimo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDACRESCIMO,IDPESSOA,IDBEM,IDMOVIMENTACAO,'
      '       DATAACRESCIMO,VALORG,CMBEM,VALFIS,VALGER,'
      '       TAXADEP,DEPLANC,CMDEP,DEPFIS,DEPGER,DATAULTDEP,'
      '       FLGDEPREC,'
      '       ((VALORG + CMBEM)-(DEPLANC + CMDEP)) AS VALCTB'
      'FROM   ACRESCIMOVALOR'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '      AND (IDBEM        = :PIDBEM)'
      '       ')
    UpdateObject = updAcrescimo
    ValidateWithMask = True
    Left = 32
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryAcrescimoIDACRESCIMO: TFloatField
      FieldName = 'IDACRESCIMO'
      Origin = 'ACRESCIMOVALOR.IDACRESCIMO'
    end
    object qryAcrescimoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'ACRESCIMOVALOR.IDPESSOA'
    end
    object qryAcrescimoIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'ACRESCIMOVALOR.IDBEM'
    end
    object qryAcrescimoIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
      Origin = 'ACRESCIMOVALOR.IDMOVIMENTACAO'
    end
    object qryAcrescimoDATAACRESCIMO: TDateTimeField
      FieldName = 'DATAACRESCIMO'
      Origin = 'ACRESCIMOVALOR.DATAACRESCIMO'
    end
    object qryAcrescimoVALORG: TFloatField
      FieldName = 'VALORG'
      Origin = 'ACRESCIMOVALOR.VALORG'
    end
    object qryAcrescimoCMBEM: TFloatField
      FieldName = 'CMBEM'
      Origin = 'ACRESCIMOVALOR.CMBEM'
    end
    object qryAcrescimoVALFIS: TFloatField
      FieldName = 'VALFIS'
      Origin = 'ACRESCIMOVALOR.VALFIS'
    end
    object qryAcrescimoVALGER: TFloatField
      FieldName = 'VALGER'
      Origin = 'ACRESCIMOVALOR.VALGER'
    end
    object qryAcrescimoTAXADEP: TFloatField
      FieldName = 'TAXADEP'
      Origin = 'ACRESCIMOVALOR.TAXADEP'
    end
    object qryAcrescimoDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      Origin = 'ACRESCIMOVALOR.DEPLANC'
    end
    object qryAcrescimoCMDEP: TFloatField
      FieldName = 'CMDEP'
      Origin = 'ACRESCIMOVALOR.CMDEP'
    end
    object qryAcrescimoDEPFIS: TFloatField
      FieldName = 'DEPFIS'
      Origin = 'ACRESCIMOVALOR.DEPFIS'
    end
    object qryAcrescimoDEPGER: TFloatField
      FieldName = 'DEPGER'
      Origin = 'ACRESCIMOVALOR.DEPGER'
    end
    object qryAcrescimoDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'ACRESCIMOVALOR.DATAULTDEP'
    end
    object qryAcrescimoFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
      Origin = 'ACRESCIMOVALOR.FLGDEPREC'
    end
    object qryAcrescimoVALCTB: TFloatField
      FieldName = 'VALCTB'
      Origin = 'ACRESCIMOVALOR.VALORG'
    end
  end
  object updAcrescimo: TUpdateSQL
    ModifySQL.Strings = (
      'update ACRESCIMOVALOR'
      'set'
      '  IDACRESCIMO = :IDACRESCIMO,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDBEM = :IDBEM,'
      '  IDMOVIMENTACAO = :IDMOVIMENTACAO,'
      '  DATAACRESCIMO = :DATAACRESCIMO,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  VALFIS = :VALFIS,'
      '  VALGER = :VALGER,'
      '  TAXADEP = :TAXADEP,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  DEPFIS = :DEPFIS,'
      '  DEPGER = :DEPGER,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  FLGDEPREC = :FLGDEPREC'
      'where'
      '  IDACRESCIMO = :OLD_IDACRESCIMO')
    InsertSQL.Strings = (
      'insert into ACRESCIMOVALOR'
      
        '  (IDACRESCIMO, IDPESSOA, IDBEM, IDMOVIMENTACAO, DATAACRESCIMO, ' +
        'VALORG, '
      
        '   CMBEM, VALFIS, VALGER, TAXADEP, DEPLANC, CMDEP, DEPFIS, DEPGE' +
        'R, DATAULTDEP, '
      '   FLGDEPREC)'
      'values'
      
        '  (:IDACRESCIMO, :IDPESSOA, :IDBEM, :IDMOVIMENTACAO, :DATAACRESC' +
        'IMO, :VALORG, '
      
        '   :CMBEM, :VALFIS, :VALGER, :TAXADEP, :DEPLANC, :CMDEP, :DEPFIS' +
        ', :DEPGER, '
      '   :DATAULTDEP, :FLGDEPREC)')
    DeleteSQL.Strings = (
      'delete from ACRESCIMOVALOR'
      'where'
      '  IDACRESCIMO = :OLD_IDACRESCIMO')
    Left = 32
    Top = 255
  end
  object qryRegistraReavalReaval: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO REAVALREAVAL'
      '               (IDMOVIMENTACAO,'
      '                IDREAVALIACAO,'
      '                TAXADEPORG)'
      'VALUES (:PIDMOVIMENTACAO,'
      '                :PIDREAVALIACAO,'
      '                :PTAXADEPORG)')
    ValidateWithMask = True
    Left = 512
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PTAXADEPORG'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraReavalAcresc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO REAVALACRESC'
      '               (IDMOVIMENTACAO,'
      '                IDACRESCIMO,'
      '                TAXADEPORG)'
      'VALUES (:PIDMOVIMENTACAO,'
      '                :PIDACRESCIMO,'
      '                :PTAXADEPORG)')
    ValidateWithMask = True
    Left = 512
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDACRESCIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PTAXADEPORG'
        ParamType = ptUnknown
      end>
  end
  object qryTipoMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOMOVIMENTACAO, DESCTIPOMOVIMENTACAO,'
      '               LANCAMENTO, IDCONTAB'
      'FROM TIPOMOVIMENTACAO')
    UpdateObject = updTipoMov
    ValidateWithMask = True
    Left = 104
    Top = 159
    object qryTipoMovIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
      Origin = 'TIPOMOVIMENTACAO.IDTIPOMOVIMENTACAO'
    end
    object qryTipoMovDESCTIPOMOVIMENTACAO: TStringField
      FieldName = 'DESCTIPOMOVIMENTACAO'
      Origin = 'TIPOMOVIMENTACAO.DESCTIPOMOVIMENTACAO'
      Size = 40
    end
    object qryTipoMovLANCAMENTO: TStringField
      FieldName = 'LANCAMENTO'
      Origin = 'TIPOMOVIMENTACAO.LANCAMENTO'
      Size = 1
    end
    object qryTipoMovIDCONTAB: TFloatField
      FieldName = 'IDCONTAB'
      Origin = 'TIPOMOVIMENTACAO.IDCONTAB'
    end
  end
  object updTipoMov: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOMOVIMENTACAO'
      'set'
      '  IDTIPOMOVIMENTACAO = :IDTIPOMOVIMENTACAO,'
      '  DESCTIPOMOVIMENTACAO = :DESCTIPOMOVIMENTACAO,'
      '  LANCAMENTO = :LANCAMENTO,'
      '  IDCONTAB = :IDCONTAB'
      'where'
      '  IDTIPOMOVIMENTACAO = :OLD_IDTIPOMOVIMENTACAO')
    InsertSQL.Strings = (
      'insert into TIPOMOVIMENTACAO'
      
        '  (IDTIPOMOVIMENTACAO, DESCTIPOMOVIMENTACAO, LANCAMENTO, IDCONTA' +
        'B)'
      'values'
      
        '  (:IDTIPOMOVIMENTACAO, :DESCTIPOMOVIMENTACAO, :LANCAMENTO, :IDC' +
        'ONTAB)')
    DeleteSQL.Strings = (
      'delete from TIPOMOVIMENTACAO'
      'where'
      '  IDTIPOMOVIMENTACAO = :OLD_IDTIPOMOVIMENTACAO')
    Left = 104
    Top = 207
  end
  object qryDeprecBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DEPRECIACAOBEM '
      '               (IDMOVIMENTACAO,'
      '                DATAULTDEP)'
      'VALUES (:PIDMOVIMENTACAO,'
      '                :PDATAULTDEP)')
    ValidateWithMask = True
    Left = 512
    Top = 303
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end>
  end
  object qryDeprecReav: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DEPRECIACAOREAVAL'
      '              (IDMOVIMENTACAO, '
      '               IDREAVALIACAO,'
      '               DATAULTDEP)'
      'VALUES (:PIDMOVIMENTACAO, '
      '                :PIDREAVALIACAO,'
      '                :PDATAULTDEP)')
    ValidateWithMask = True
    Left = 356
    Top = 193
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end>
  end
  object qryDeprecAcresc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DEPRECIACAOACRESC '
      '                        (IDMOVIMENTACAO,'
      '                         IDACRESCIMO,'
      '                         DATAULTDEP)'
      '         VALUES (:PIDMOVIMENTACAO,'
      '                         :PIDACRESCIMO,'
      '                         :PDATAULTDEP)')
    ValidateWithMask = True
    Left = 444
    Top = 193
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDACRESCIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAULTDEP'
        ParamType = ptUnknown
      end>
  end
  object qryMotivoBaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM MOTIVOBAIXA')
    ValidateWithMask = True
    Left = 328
    Top = 15
    object qryMotivoBaixaIDMOTIVOBAIXA: TFloatField
      FieldName = 'IDMOTIVOBAIXA'
      Origin = 'MOTIVOBAIXA.IDMOTIVOBAIXA'
    end
    object qryMotivoBaixaDESCMOTIVOBAIXA: TStringField
      FieldName = 'DESCMOTIVOBAIXA'
      Origin = 'MOTIVOBAIXA.DESCMOTIVOBAIXA'
      Size = 30
    end
  end
  object qryEstornaMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTORICOMOVIMENTACAO'
      'WHERE (IDBEM    = :PIDBEM)'
      '  AND (IDPESSOA = :PIDPESSOA)'
      '  AND (IDMOVIMENTACAO = :PIDMOVIM)'
      '')
    ValidateWithMask = True
    Left = 184
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDMOVIM'
        ParamType = ptUnknown
      end>
  end
  object qryEstornaReavaliacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM REAVALIACAO'
      'WHERE (IDBEM          = :PIDBEM)'
      '  AND (IDPESSOA       = :PIDPESSOA)'
      '  AND (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      '')
    ValidateWithMask = True
    Left = 368
    Top = 241
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryEstornaReaval: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM REAVAL'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ' ')
    ValidateWithMask = True
    Left = 317
    Top = 231
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryEstornaReavalReaval: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM REAVALREAVAL'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ' ')
    ValidateWithMask = True
    Left = 277
    Top = 257
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryEstornaReavalAcresc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM REAVALACRESC'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ' ')
    ValidateWithMask = True
    Left = 444
    Top = 241
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryUltMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV'
      'FROM   HISTORICOMOVIMENTACAO'
      'WHERE  (IDPESSOA = :PIDPESSOA)'
      '  AND  (IDBEM    = :PIDBEM)'
      '')
    ValidateWithMask = True
    Left = 104
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryUltMovDATAULTMOV: TDateTimeField
      FieldName = 'DATAULTMOV'
      Origin = '"CM.HISTORICOMOVIMENTACAO".DATAMOVIMENTACAO'
    end
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 32
    Top = 313
  end
  object qryEstornaBaixaBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM BAIXABEM'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ' ')
    ValidateWithMask = True
    Left = 373
    Top = 279
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraTransfLocal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO TRANSFLOCAL'
      '            (IDMOVIMENTACAO,'
      '             IDLOCALANT,'
      '             IDRESPANT)'
      '     VALUES (:PIDMOVIMENTACAO,'
      '             :PIDLOCALANT,'
      '             :PIDRESPANT)')
    ValidateWithMask = True
    Left = 356
    Top = 255
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDLOCALANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDRESPANT'
        ParamType = ptUnknown
      end>
  end
  object qryConjunto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDCONJUNTO, IDPESSOA, DESCCONJUNTO, IDLOCALIZACAO, IDRESP' +
        'ONSAVEL,'
      '       DISPONIVEL, ALUGADO'
      'FROM CONJUNTO'
      'WHERE (IDCONJUNTO = :PIDCONJUNTO)'
      '  AND (IDPESSOA   = :PIDPESSOA)'
      '  ')
    UpdateObject = updConjunto
    ValidateWithMask = True
    Left = 32
    Top = 367
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updConjunto: TUpdateSQL
    ModifySQL.Strings = (
      'update CONJUNTO'
      'set'
      '  IDCONJUNTO = :IDCONJUNTO,'
      '  IDPESSOA = :IDPESSOA,'
      '  DESCCONJUNTO = :DESCCONJUNTO,'
      '  IDLOCALIZACAO = :IDLOCALIZACAO,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  DISPONIVEL = :DISPONIVEL,'
      '  ALUGADO = :ALUGADO'
      'where'
      '  IDCONJUNTO = :OLD_IDCONJUNTO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into CONJUNTO'
      
        '  (IDCONJUNTO, IDPESSOA, DESCCONJUNTO, IDLOCALIZACAO, IDRESPONSA' +
        'VEL, DISPONIVEL, '
      '   ALUGADO)'
      'values'
      
        '  (:IDCONJUNTO, :IDPESSOA, :DESCCONJUNTO, :IDLOCALIZACAO, :IDRES' +
        'PONSAVEL, '
      '   :DISPONIVEL, :ALUGADO)')
    DeleteSQL.Strings = (
      'delete from CONJUNTO'
      'where'
      '  IDCONJUNTO = :OLD_IDCONJUNTO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 32
    Top = 417
  end
  object qryLocalizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOCALIZACAO, IDPESSOA, IDRESPONSAVEL,'
      '       NOME, CODCENTROCUSTO'
      'FROM LOCALIZACAO'
      'WHERE (IDPESSOA      = :PIDPESSOA)'
      '  AND (IDLOCALIZACAO = :PIDLOCALIZACAO)'
      '  ')
    ValidateWithMask = True
    Left = 256
    Top = 159
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCALIZACAO'
        ParamType = ptUnknown
      end>
    object qryLocalizacaoIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = '"CM.LOCALIZACAO".IDLOCALIZACAO'
    end
    object qryLocalizacaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.LOCALIZACAO".IDPESSOA'
    end
    object qryLocalizacaoIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = '"CM.LOCALIZACAO".IDRESPONSAVEL'
    end
    object qryLocalizacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.LOCALIZACAO".NOME'
      Size = 60
    end
    object qryLocalizacaoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = '"CM.LOCALIZACAO".CODCENTROCUSTO'
      Size = 10
    end
  end
  object qryEstornaBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM BEM'
      'WHERE (IDBEM    = :PIDBEM)'
      '  AND (IDPESSOA = :PIDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 109
    Top = 417
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryEstornaAcrescimo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM ACRESCIMOVALOR'
      'WHERE (IDBEM       = :PIDBEM)'
      '  AND (IDPESSOA    = :PIDPESSOA)'
      '  AND (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      '')
    ValidateWithMask = True
    Left = 280
    Top = 233
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryEstornaAcrescValor: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM ACRESCVALOR'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 303
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraTransfConj: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO TRANSFCONJUNTO'
      '            (IDMOVIMENTACAO,'
      '             IDCONJANT)'
      '     VALUES (:PIDMOVIMENTACAO,'
      '             :PIDCONJANT)')
    ValidateWithMask = True
    Left = 280
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONJANT'
        ParamType = ptUnknown
      end>
  end
  object qryRegistraTransfGrupo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO TRANSFGRUPO'
      '            (IDMOVIMENTACAO,'
      '             IDGRUPANT)'
      '     VALUES (:PIDMOVIMENTACAO,'
      '             :PIDGRUPANT)')
    ValidateWithMask = True
    Left = 392
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPANT'
        ParamType = ptUnknown
      end>
  end
  object qryResponsavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDRESPONSAVEL, P.NOME AS NOMERESPONSAVEL'
      'FROM RESPONSAVEL R, PESSOA P'
      'WHERE (R.IDRESPONSAVEL = :PIDRESP)'
      '  AND (R.IDRESPONSAVEL = P.IDPESSOA(+))'
      '')
    ValidateWithMask = True
    Left = 104
    Top = 311
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDRESP'
        ParamType = ptUnknown
      end>
    object qryResponsavelIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryResponsavelNOMERESPONSAVEL: TStringField
      FieldName = 'NOMERESPONSAVEL'
      Size = 60
    end
  end
  object qryRegistraTransfPlaca: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO TRANSFPLACA'
      '            (IDMOVIMENTACAO,'
      '             PLACAANT)'
      '     VALUES (:PIDMOVIMENTACAO,'
      '             :PPLACAANT)')
    ValidateWithMask = True
    Left = 209
    Top = 295
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPLACAANT'
        ParamType = ptUnknown
      end>
  end
  object qryUltDep: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAMOVIMENTACAO) AS DATAULTDEP'
      'FROM   HISTORICOMOVIMENTACAO'
      'WHERE  (IDPESSOA = :PIDPESSOA)'
      '  AND  (IDBEM    = :PIDBEM)'
      '  AND  (IDTIPOMOVIMENTACAO IN (14,18,35))')
    ValidateWithMask = True
    Left = 328
    Top = 63
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryUltDepDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
  end
  object qryRatPP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PPB.IDPLANOPREV,'
      '       PP.NOME AS DESCPLANOPREV,'
      '       PPB.IDPATRO,'
      '       P.NOME AS DESCPATRO,'
      '       PPB.PPBPERCRATEIO'
      'FROM PLANOPATROXBEM PPB,'
      '     PLANPREVCONTABIL PP,'
      '     PESSOA P'
      'WHERE (PPB.IDBEM    = :PIDBEM)'
      '  AND (PPB.IDPESSOA = :PIDEMPRESA)'
      '  AND (PPB.IDPLANOPREV = PP.IDPLANOPREV)'
      '  AND (PPB.IDPATRO     = P.IDPESSOA)'
      ''
      '')
    ValidateWithMask = True
    Left = 184
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryRatPPIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = '"CM.PLANOPATROXBEM".IDPLANOPREV'
    end
    object qryRatPPDESCPLANOPREV: TStringField
      FieldName = 'DESCPLANOPREV'
      Origin = 'PLANPREVCONTABIL.NOME'
      Size = 50
    end
    object qryRatPPIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = '"CM.PLANOPATROXBEM".IDPATRO'
    end
    object qryRatPPDESCPATRO: TStringField
      FieldName = 'DESCPATRO'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryRatPPPPBPERCRATEIO: TFloatField
      FieldName = 'PPBPERCRATEIO'
      Origin = '"CM.PLANOPATROXBEM".PPBPERCRATEIO'
    end
  end
  object sqlScript: TCMSQLScript
    Commit = ctNone
    DataBaseName = 'Basedados'
    Left = 377
    Top = 231
  end
  object qryUltReav: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOVIMENTACAO'
      'FROM   HISTORICOMOVIMENTACAO'
      'WHERE  (IDPESSOA = :PIDPESSOA)'
      '  AND  (IDBEM    = :PIDBEM)'
      '  AND  (IDTIPOMOVIMENTACAO IN (08,32))'
      '  AND  (DATAMOVIMENTACAO = :PDATAMOV)')
    ValidateWithMask = True
    Left = 328
    Top = 159
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object qryUltReavIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
    end
  end
  object qryRegistraDesmembramento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DESMEMBRAMENTO'
      '           (IDMOVIMENTACAO,'
      '            IDBEMRESULTANTE,'
      '            PROPORCAO)'
      'VALUES     (:IDMOVIMENTACAO,'
      '            :IDBEMRESULTANTE,'
      '            :PROPORCAO)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 512
    Top = 63
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBEMRESULTANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PROPORCAO'
        ParamType = ptUnknown
      end>
  end
  object qryBensResultantes: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT DM.IDBEMRESULTANTE AS IDBEM'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     DESMEMBRAMENTO DM'
      'WHERE (HM.IDBEM = :PIDBEMORIG)'
      '  AND (HM.IDTIPOMOVIMENTACAO = :PIDTIPOMOV)'
      '  AND (HM.IDMOVIMENTACAO = DM.IDMOVIMENTACAO)')
    ValidateWithMask = True
    Left = 392
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEMORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOMOV'
        ParamType = ptUnknown
      end>
    object qryBensResultantesIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BASEDADOS.DESMEMBRAMENTO.IDBEMRESULTANTE'
    end
  end
  object updSaldoContabilBem: TUpdateSQL
    ModifySQL.Strings = (
      'update SALDOCONTABBEM'
      'set'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  REAVVALORG = :REAVVALORG,'
      '  REAVCMBEM = :REAVCMBEM,'
      '  REAVDEPLANC = :REAVDEPLANC,'
      '  REAVCMDEP = :REAVCMDEP,'
      '  ULTREAVVALORG = :ULTREAVVALORG,'
      '  ULTREAVCMBEM = :ULTREAVCMBEM,'
      '  ULTREAVDEPLANC = :ULTREAVDEPLANC,'
      '  ULTREAVCMDEP = :ULTREAVCMDEP'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  DATASLDBEM = :OLD_DATASLDBEM')
    InsertSQL.Strings = (
      'insert into SALDOCONTABBEM'
      
        '  (IDBEM, IDPESSOA, DATASLDBEM, VALORG, CMBEM, DEPLANC, CMDEP, R' +
        'EAVVALORG, '
      
        '   REAVCMBEM, REAVDEPLANC, REAVCMDEP, ULTREAVVALORG, ULTREAVCMBE' +
        'M, ULTREAVDEPLANC, '
      '   ULTREAVCMDEP)'
      'values'
      
        '  (:IDBEM, :IDPESSOA, :DATASLDBEM, :VALORG, :CMBEM, :DEPLANC, :C' +
        'MDEP, :REAVVALORG, '
      
        '   :REAVCMBEM, :REAVDEPLANC, :REAVCMDEP, :ULTREAVVALORG, :ULTREA' +
        'VCMBEM, '
      '   :ULTREAVDEPLANC, :ULTREAVCMDEP)')
    DeleteSQL.Strings = (
      'delete from SALDOCONTABBEM'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  DATASLDBEM = :OLD_DATASLDBEM')
    Left = 224
    Top = 276
  end
  object qrySaldoContabBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT SCB.IDBEM, SCB.IDPESSOA, SCB.DATASLDBEM,'
      '       SCB.VALORG, SCB.CMBEM, SCB.DEPLANC, SCB.CMDEP,'
      
        '       SCB.REAVVALORG, SCB.REAVCMBEM, SCB.REAVDEPLANC, SCB.REAVC' +
        'MDEP,'
      
        '       SCB.ULTREAVVALORG, SCB.ULTREAVCMBEM, SCB.ULTREAVDEPLANC, ' +
        'SCB.ULTREAVCMDEP'
      'FROM SALDOCONTABBEM SCB,'
      '     (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '      FROM SALDOCONTABBEM'
      '      WHERE (IDBEM = :PIDBEM)'
      '        AND (IDPESSOA = :PIDPESSOA)'
      '        AND (DATASLDBEM <= :PDATASLD)'
      '      GROUP BY IDBEM) DTAMAX'
      'WHERE (SCB.IDBEM = :PIDBEM)'
      '  AND (SCB.IDPESSOA = :PIDPESSOA)'
      '  AND (SCB.IDBEM = DTAMAX.IDBEM)'
      '  AND (SCB.DATASLDBEM = DTAMAX.DATA)'
      'ORDER BY DATASLDBEM'
      '')
    UpdateObject = updSaldoContabilBem
    ValidateWithMask = True
    Left = 224
    Top = 262
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySaldoContabBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qrySaldoContabBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySaldoContabBemDATASLDBEM: TDateTimeField
      FieldName = 'DATASLDBEM'
    end
    object qrySaldoContabBemVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qrySaldoContabBemCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qrySaldoContabBemDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qrySaldoContabBemCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qrySaldoContabBemREAVVALORG: TFloatField
      FieldName = 'REAVVALORG'
    end
    object qrySaldoContabBemREAVCMBEM: TFloatField
      FieldName = 'REAVCMBEM'
    end
    object qrySaldoContabBemREAVDEPLANC: TFloatField
      FieldName = 'REAVDEPLANC'
    end
    object qrySaldoContabBemREAVCMDEP: TFloatField
      FieldName = 'REAVCMDEP'
    end
    object qrySaldoContabBemULTREAVVALORG: TFloatField
      FieldName = 'ULTREAVVALORG'
    end
    object qrySaldoContabBemULTREAVCMBEM: TFloatField
      FieldName = 'ULTREAVCMBEM'
    end
    object qrySaldoContabBemULTREAVDEPLANC: TFloatField
      FieldName = 'ULTREAVDEPLANC'
    end
    object qrySaldoContabBemULTREAVCMDEP: TFloatField
      FieldName = 'ULTREAVCMDEP'
    end
  end
  object MSBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona um Bem'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOARESP.NOME'
      'PESSOAFORN.NOME'
      'CLASSEDEBEM.DESCRICAO'
      'GRUPO.NOME'
      'BEM.IDNOTA'
      'BEM.DTAINCLUSAO'
      'BEM.VALHISTORICO'
      'BEM.DESBEM'
      'BEM.DESBEM'
      'BEM.BAIXATOTAL'
      'BEM.NUMSERIE'
      'BEM.PUBAUTOR'
      'BEM.PUBEDITORA'
      'BEM.PUBANO'
      'BEM.CONTROLE'
      '(BEM.VALORG+BEM.CMBEM-BEM.DEPLANC-BEM.CMDEP)')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Fornecedor'
      'Classe'
      'Grupo Contábil'
      'Documento Aquisição'
      'Data de Aquisição'
      'Valor de Aquisição'
      'Marca'
      'Modelo'
      'Bens Baixados (S/N)'
      'Nº de Série'
      'Autor'
      'Editora'
      'Ano Publicação'
      'Controle'
      'Valor Residual')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN')
    CamposChave.Strings = (
      'BEM.IDPESSOA'
      'BEM.IDBEM'
      'BEM.PLACA'
      'BEM.DESBEM'
      'CONJUNTO.IDLOCALIZACAO'
      'BEM.IDCONJUNTO')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'BEM.IDGRUPO=GRUPO.IDGRUPO(+)'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM(+)'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA(+)'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
      '1=1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '80'
      '100'
      '60'
      '60'
      '60'
      '60'
      '60'
      '18'
      '10'
      '10'
      '40'
      '40'
      '1'
      '20'
      '60'
      '60'
      '10'
      '1'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 296
    Top = 230
  end
  object sprSaldoContabBem: TwwStoredProc
    DatabaseName = 'Basedados'
    StoredProcName = 'SPRSALDOCONTABBEM'
    ValidateWithMask = True
    Left = 304
    Top = 288
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDBEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATASLDBEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVALORG'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PCMBEM'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PDEPLANC'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PCMDEP'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PREAVVALORG'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PREAVCMBEM'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PREAVDEPLANC'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PREAVCMDEP'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PULTREAVVALORG'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PULTREAVCMBEM'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PULTREAVDEPLANC'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftFloat
        Name = 'PULTREAVCMDEP'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'PCODMOV'
        ParamType = ptInput
        Value = 0
      end>
  end
end
