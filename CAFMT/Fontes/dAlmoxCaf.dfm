object dtmAlmoxCaf: TdtmAlmoxCaf
  OldCreateOrder = True
  OnCreate = dtmAlmoxCafCreate
  OnDestroy = dtmAlmoxCafDestroy
  Left = 23
  Top = 81
  Height = 352
  Width = 509
  object qryRegistraBensPend: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO BENSPENDENTES'
      
        '  (IDBENSPENDENTES, IDPESSOA, IDITENSRECDEV, IDFORNSERV, IDMODUL' +
        'O, IDGRUPO,'
      
        '   IDCLASSEBEM, IDCONJUNTO, IDSITUACAO, CONTROLE, PLACA, DESBEM,' +
        ' IDNOTA,'
      '   COMPLNOTA, DTANOTA, DTAINCLUSAO, VALORG, NUMSERIE)'
      'VALUES'
      
        '  (:IDBENSPENDENTES, :IDPESSOA, :IDITENSRECDEV, :IDFORNSERV, :ID' +
        'MODULO, '
      
        '   :IDGRUPO, :IDCLASSEBEM, :IDCONJUNTO, :IDSITUACAO, :CONTROLE, ' +
        ':PLACA, '
      
        '   :DESBEM, :IDNOTA, :COMPLNOTA, :DTANOTA, :DTAINCLUSAO, :VALORG' +
        ', :NUMSERIE)')
    ValidateWithMask = True
    Left = 208
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBENSPENDENTES'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDITENSRECDEV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFORNSERV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCLASSEBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDSITUACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTROLE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLACA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDNOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'COMPLNOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DTANOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DTAINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'VALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMSERIE'
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
      '       PROXIMAPLACA,FLGCLSDESBEM     '
      'FROM   PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 40
    Top = 136
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
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 40
    Top = 184
  end
  object qryBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBEM,IDPESSOA,IDCONJUNTO,IDTERCEIRO,IDGRUPO,'
      '               CODSUBCONTA,IDCLASSEBEM,IDMODULO,IDITENSRECDEV,'
      '               IDFORNSERV,IDSITUACAO,IDIMAGEM,REGISTRO,CONTROLE,'
      '               PLACA,DESBEM,IDNOTA,COMPLNOTA,DTANOTA,NUMSERIE,'
      
        '               DTAINCLUSAO,VALHISTORICO,VALORG,CMBEM,VALFIS,VALG' +
        'ER,'
      
        '               DATAINICIODEP,VALDEPINI,TAXADEP,DEPLANC,CMDEP,DEP' +
        'FIS,'
      '               DEPGER,DATAULTDEP,DATARECALCDEP,FLGDEPREC,'
      '               PROPBAIXA,BAIXATOTAL,IDOPCIONAL,UNIDNEGOC,'
      '               ((VALORG + CMBEM) - (DEPLANC - CMDEP)) AS VALCTB'
      'FROM BEM'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '      AND (IDBEM        = :PIDBEM)')
    UpdateObject = updBem
    ValidateWithMask = True
    Left = 32
    Top = 8
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
    object qryBemIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BEM.IDBEM'
    end
    object qryBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BEM.IDPESSOA'
    end
    object qryBemIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = 'BEM.IDCONJUNTO'
    end
    object qryBemIDTERCEIRO: TFloatField
      FieldName = 'IDTERCEIRO'
      Origin = 'BEM.IDTERCEIRO'
    end
    object qryBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BEM.IDGRUPO'
    end
    object qryBemCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'BEM.CODSUBCONTA'
    end
    object qryBemIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = 'BEM.IDCLASSEBEM'
    end
    object qryBemIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BEM.IDMODULO'
    end
    object qryBemIDITENSRECDEV: TFloatField
      FieldName = 'IDITENSRECDEV'
      Origin = 'BEM.IDITENSRECDEV'
    end
    object qryBemIDFORNSERV: TFloatField
      FieldName = 'IDFORNSERV'
      Origin = 'BEM.IDFORNSERV'
    end
    object qryBemIDSITUACAO: TFloatField
      FieldName = 'IDSITUACAO'
      Origin = 'BEM.IDSITUACAO'
    end
    object qryBemIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
      Origin = 'BEM.IDIMAGEM'
    end
    object qryBemREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Origin = 'BEM.REGISTRO'
      Size = 1
    end
    object qryBemCONTROLE: TStringField
      FieldName = 'CONTROLE'
      Origin = 'BEM.CONTROLE'
      Size = 1
    end
    object qryBemPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = 'BEM.PLACA'
    end
    object qryBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Origin = 'BEM.DESBEM'
      Size = 200
    end
    object qryBemIDNOTA: TStringField
      FieldName = 'IDNOTA'
      Origin = 'BEM.IDNOTA'
      Size = 18
    end
    object qryBemCOMPLNOTA: TStringField
      FieldName = 'COMPLNOTA'
      Origin = 'BEM.COMPLNOTA'
      Size = 5
    end
    object qryBemDTANOTA: TDateTimeField
      FieldName = 'DTANOTA'
      Origin = 'BEM.DTANOTA'
    end
    object qryBemNUMSERIE: TStringField
      FieldName = 'NUMSERIE'
      Origin = 'BEM.NUMSERIE'
    end
    object qryBemDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
      Origin = 'BEM.DTAINCLUSAO'
    end
    object qryBemVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
      Origin = 'BEM.VALHISTORICO'
    end
    object qryBemVALORG: TFloatField
      FieldName = 'VALORG'
      Origin = 'BEM.VALORG'
    end
    object qryBemCMBEM: TFloatField
      FieldName = 'CMBEM'
      Origin = 'BEM.CMBEM'
    end
    object qryBemVALFIS: TFloatField
      FieldName = 'VALFIS'
      Origin = 'BEM.VALFIS'
    end
    object qryBemVALGER: TFloatField
      FieldName = 'VALGER'
      Origin = 'BEM.VALGER'
    end
    object qryBemDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
      Origin = 'BEM.DATAINICIODEP'
    end
    object qryBemVALDEPINI: TFloatField
      FieldName = 'VALDEPINI'
      Origin = 'BEM.VALDEPINI'
    end
    object qryBemTAXADEP: TFloatField
      FieldName = 'TAXADEP'
      Origin = 'BEM.TAXADEP'
    end
    object qryBemDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      Origin = 'BEM.DEPLANC'
    end
    object qryBemCMDEP: TFloatField
      FieldName = 'CMDEP'
      Origin = 'BEM.CMDEP'
    end
    object qryBemDEPFIS: TFloatField
      FieldName = 'DEPFIS'
      Origin = 'BEM.DEPFIS'
    end
    object qryBemDEPGER: TFloatField
      FieldName = 'DEPGER'
      Origin = 'BEM.DEPGER'
    end
    object qryBemDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'BEM.DATAULTDEP'
    end
    object qryBemDATARECALCDEP: TDateTimeField
      FieldName = 'DATARECALCDEP'
      Origin = 'BEM.DATARECALCDEP'
    end
    object qryBemFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
      Origin = 'BEM.FLGDEPREC'
    end
    object qryBemPROPBAIXA: TFloatField
      FieldName = 'PROPBAIXA'
      Origin = 'BEM.PROPBAIXA'
    end
    object qryBemBAIXATOTAL: TStringField
      FieldName = 'BAIXATOTAL'
      Origin = 'BEM.BAIXATOTAL'
      Size = 1
    end
    object qryBemVALCTB: TFloatField
      FieldName = 'VALCTB'
      Origin = '"CM.BEM".VALORG'
    end
    object qryBemIDOPCIONAL: TStringField
      FieldName = 'IDOPCIONAL'
      Size = 30
    end
    object qryBemUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
  end
  object updBem: TUpdateSQL
    ModifySQL.Strings = (
      'update BEM'
      'set'
      '  IDBEM = :IDBEM,'
      '  IDPESSOA = :IDPESSOA,'
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
      '  UNIDNEGOC = :UNIDNEGOC'
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
      '   FLGDEPREC, PROPBAIXA, BAIXATOTAL, IDOPCIONAL, UNIDNEGOC)'
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
      '   :UNIDNEGOC)')
    DeleteSQL.Strings = (
      'delete from BEM'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 32
    Top = 56
  end
  object qryEstornaValMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM VALORMOVIMENTACAO'
      'WHERE (IDMOVIMENTACAO = :PIDMOVIMENTACAO)'
      ' ')
    ValidateWithMask = True
    Left = 104
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDMOVIMENTACAO'
      Origin = 'VALORMOVIMENTACAO.IDMOVIMENTACAO'
    end
    object FloatField2: TFloatField
      FieldName = 'VALOFI'
      Origin = 'VALORMOVIMENTACAO.VALOFI'
    end
    object FloatField3: TFloatField
      FieldName = 'VALGER'
      Origin = 'VALORMOVIMENTACAO.VALGER'
    end
    object FloatField4: TFloatField
      FieldName = 'VALFIS'
      Origin = 'VALORMOVIMENTACAO.VALFIS'
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
    Left = 104
    Top = 8
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
  object qryEstornaBensPend: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM BENSPENDENTES'
      'WHERE (IDPESSOA      = :PIDPESSOA)'
      '  AND (IDITENSRECDEV = :PIDITENSRECDEV)')
    ValidateWithMask = True
    Left = 208
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDITENSRECDEV'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiItemRecDev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   BEM'
      'WHERE'
      '   IDITENSRECDEV =:ITEMRECDEV')
    ValidateWithMask = True
    Left = 136
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ITEMRECDEV'
        ParamType = ptUnknown
      end>
  end
  object qrySituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDSITUACAO, DESCSITUACAO'
      'FROM     SITUACAO'
      ''
      '')
    ValidateWithMask = True
    Left = 100
    Top = 184
  end
end
