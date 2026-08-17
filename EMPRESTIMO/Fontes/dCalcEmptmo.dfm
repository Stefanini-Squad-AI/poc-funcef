object dtmCalcEmptmo: TdtmCalcEmptmo
  OldCreateOrder = False
  Left = 26
  Top = 47
  Height = 437
  Width = 712
  object qrySaldoMesAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HMEDATAATUALIZA,'
      '   HMESALDODEV, HMETXJUROS,'
      '   HMEPARCELA, HMENUMPARCELAS'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME,'
      '   ('
      '   SELECT'
      '      MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '      ITEMXTIPOCONTR ITC'
      '   WHERE'
      '          ( CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '      AND ( HME.HMEANOCOMPETENCIA  =:PANOCOMPETENCIA )'
      '      AND ( HME.HMEMESCOMPETENCIA  =:PMESCOMPETENCIA )'
      
        '      AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS ' +
        'NULL) )'
      '      AND ( ITC.ITCTRATASALDODEV   <> 0)'
      '      AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO)'
      '      AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO)'
      '      AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '   ) MAX'
      ''
      'WHERE'
      '   HME.IDHISTMOVEMPTMO = MAX.IDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 144
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptInput
      end>
    object qrySaldoMesAntHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMESALDODEV'
    end
    object qrySaldoMesAntHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qrySaldoMesAntHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qrySaldoMesAntHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qrySaldoMesAntHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
  end
  object qrySaldoAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HMEDATAATUALIZA,'
      '   HMESALDODEV, HMETXJUROS,'
      '   HMEPARCELA, HMENUMPARCELAS'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME,'
      '   ('
      '   SELECT'
      '      MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TCE'
      '   WHERE'
      '          ( CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '      AND ( HME.HMEDATAATUALIZA   <=:PHMEDATAATUALIZA )'
      '      AND ( ITC.ITCTRATASALDODEV  <> 0 )'
      
        '      AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS ' +
        'NULL) )'
      '      AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '      AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '      AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '      AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '      AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '   ) MAX'
      'WHERE'
      '   ( HME.IDHISTMOVEMPTMO = MAX.IDHISTMOVEMPTMO )'
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
    object qrySaldoAntHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qrySaldoAntHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qrySaldoAntHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qrySaldoAntHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qrySaldoAntHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
  end
  object qryParcelasEmAberto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(HME.HMEVLRPREVISTO) AS VALOR_DEVIDO'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME'
      ''
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )'
      '   AND ( HME.FLGBAIXADO       IS NOT NULL )'
      '   AND ( HME.HMEDATAPREVISTA  <=:PHMEDATAPREVISTA )'
      '   AND ( HME.HMETIPOMOV       IN (1, 2, 3, 4) )'
      
        '   AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL)' +
        ' )'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )'
      
        '   AND ( (HME.FLGQUITADO      = 0) OR (HME.FLGQUITADO   IS NULL)' +
        ' )'
      
        '   AND ( (HME.FLGABONADO      = 0) OR (HME.FLGABONADO   IS NULL)' +
        ' )'
      ''
      'GROUP BY'
      '   HME.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 144
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end>
    object qryParcelasEmAbertoVALOR_DEVIDO: TFloatField
      FieldName = 'VALOR_DEVIDO'
    end
  end
  object qryItens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDITEMEMPTMO, HME.HMETIPOMOV, HME.HMEORIGEM,'
      '   HME.HMEPARCELA, HME.HMENUMPARCELAS,'
      '   HME.HMECENTRALIZA, HME.HMEDESTACADO,'
      ''
      
        '   HME.HMEDATA, HME.HMEDATAPREVISTA, HME.HMEDATAEFETIVA, HME.HME' +
        'DATAATUALIZA, HME.HMEDATAVENCTO,'
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEANOCOBRA' +
        'NCA, HME.HMEMESCOBRANCA,'
      
        '   HME.HMEVLRPREVISTO, HME.HMEVLREFETIVO, HME.HMESALDODEV, HME.H' +
        'METXJUROS,'
      ''
      '   HME.HMEFORMACOBRANCA,'
      ''
      '   NVL(HME.FLGENVIO, 1)       AS FLGENVIO,'
      '   NVL(HME.FLGBAIXADO, 1)     AS FLGBAIXADO,'
      '   NVL(HME.FLGESTORNADO, 0)   AS FLGESTORNADO,'
      '   NVL(HME.FLGQUITADO, 0)     AS FLGQUITADO,'
      '   NVL(HME.FLGABONADO, 0)     AS FLGABONADO,'
      '   NVL(HME.FLGDIVERGPEND, 0)  AS FLGDIVERGPEND,'
      ''
      '   ITE.ITEDESCRICAO'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME, ITEMEMPTMO ITE'
      ''
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO )'
      ''
      '   AND ( HME.FLGESTORNADO     IS NULL )'
      '   AND ( HME.FLGABONADO       IS NULL )'
      '   AND ( HME.FLGQUITADO       IS NULL )'
      ''
      
        '   AND ( (:PHMETIPOMOV        IS NULL) OR (HME.HMETIPOMOV =:PHME' +
        'TIPOMOV) )'
      
        '   AND ( (:PHMEPARCELA        IS NULL) OR (HME.HMEPARCELA =:PHME' +
        'PARCELA) )'
      ''
      
        '   AND ( (:PFLGENVIO          IS NULL) OR (NVL(HME.FLGENVIO, 1) ' +
        '=:PFLGENVIO) )'
      
        '   AND ( (:PFLGBAIXADO        IS NULL) OR (NVL(HME.FLGBAIXADO, 1' +
        ') =:PFLGBAIXADO) )'
      
        '   AND ( (:PFLGDIVERGPEND     IS NULL) OR (NVL(HME.FLGDIVERGPEND' +
        ', 0) =:PFLGDIVERGPEND) )'
      ''
      
        '   AND ( (:PHMEANOCOMPETENCIA IS NULL) OR (HME.HMEANOCOMPETENCIA' +
        ' =:PHMEANOCOMPETENCIA) )'
      
        '   AND ( (:PHMEMESCOMPETENCIA IS NULL) OR (HME.HMEMESCOMPETENCIA' +
        ' =:PHMEMESCOMPETENCIA) )'
      ''
      
        '   AND ( (:PHMEDATAPREVISTA   IS NULL) OR (HME.HMEDATAPREVISTA  ' +
        '= TO_DATE(:PHMEDATAPREVISTA, '#39'DD/MM/YYYY'#39')) )'
      
        '   AND ( (:PHMEDATAEFETIVA    IS NULL) OR (HME.HMEDATAEFETIVA   ' +
        '= TO_DATE(:PHMEDATAEFETIVA, '#39'DD/MM/YYYY'#39')) )'
      
        '   AND ( (:PHMEDATAVENCTO     IS NULL) OR (HME.HMEDATAVENCTO    ' +
        '= TO_DATE(:PHMEDATAVENCTO, '#39'DD/MM/YYYY'#39')) )'
      
        '   AND ( (:PHMEDATAATUALIZA   IS NULL) OR (HME.HMEDATAATUALIZA  ' +
        '= TO_DATE(:PHMEDATAATUALIZA, '#39'DD/MM/YYYY'#39')) )'
      ''
      
        '   AND ( (:PCENTRALIZA        IS NULL) OR ((HME.HMECENTRALIZA = ' +
        '1) OR (HME.HMEDESTACADO = 1)) )'
      
        '   AND ( (:PAGRUPADO          IS NULL) OR ((HME.HMECENTRALIZA = ' +
        '0) AND (HME.HMEDESTACADO = 0)) )'
      '   AND ( ITE.IDITEMEMPTMO     > 0 )'
      ''
      '   AND ( HME.IDITEMEMPTMO     = ITE.IDITEMEMPTMO )'
      ''
      'ORDER BY'
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA')
    ValidateWithMask = True
    Left = 40
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGBAIXADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGBAIXADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDIVERGPEND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDIVERGPEND'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEDATAEFETIVA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEDATAEFETIVA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEDATAVENCTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEDATAVENCTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCENTRALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PAGRUPADO'
        ParamType = ptInput
      end>
    object qryItensIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryItensHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryItensHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryItensHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryItensHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryItensHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryItensHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryItensHMEDATA: TDateTimeField
      FieldName = 'HMEDATA'
    end
    object qryItensHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryItensHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryItensHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryItensHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryItensHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryItensHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryItensHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryItensHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryItensHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryItensHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryItensHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryItensHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryItensHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryItensFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
    end
    object qryItensFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryItensFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryItensFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object qryItensFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
    end
    object qryItensFLGDIVERGPEND: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object qryItensITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
  end
  object qryBuscaItens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   RCT.IDITEMEMPTMO,'
      '   RCT.ITCRECPAG,'
      '   RCT.IDREGRACALC,'
      '   RCT.ITCPRIORIDADE,'
      '   RCT.IDPROVENTON,'
      '   RCT.ITCEVENTO,'
      '   RCT.ITCSEQCALCULO,'
      '   RCT.ITCTRATASALDODEV,'
      ''
      '   RCT.FLGCENTRALIZA,'
      '   RCT.FLGDESTACADO,'
      ''
      '   TOTALGRUPO.IDITEMEMPTMO AS IDITEMCENTRALIZA,'
      ''
      '   IRC.ITEDESCRICAO'
      ''
      'FROM'
      '   ITEMXTIPOCONTR RCT,'
      '   ITEMEMPTMO IRC,'
      ''
      '   ('
      '   SELECT'
      '      IDITEMEMPTMO, ITCEVENTO'
      '   FROM'
      '      ITEMXTIPOCONTR'
      '   WHERE'
      '          ( IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      '      AND ( FLGCENTRALIZA     = 1 )'
      '   ) TOTALGRUPO'
      ''
      'WHERE'
      '       ( RCT.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      '   AND ( RCT.IDITEMEMPTMO      = IRC.IDITEMEMPTMO )'
      '   AND ( RCT.ITCEVENTO         = TOTALGRUPO.ITCEVENTO(+) )'
      '   AND'
      '   ('
      
        '   ((:PEVENTO = 0) AND ((RCT.ITCEVENTO =:PEVENTO) OR (RCT.ITCEVE' +
        'NTO = 1 AND RCT.FLGCENTRALIZA = 1)))'
      '   OR'
      '   ((:PEVENTO <> 0) AND (RCT.ITCEVENTO =:PEVENTO))'
      '   )'
      '   AND IRC.IDITEMEMPTMO > 0'
      ''
      'ORDER BY'
      '   RCT.ITCSEQCALCULO, RCT.ITCSEQCALCULO')
    ValidateWithMask = True
    Left = 40
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTipoContrEmptmo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEVENTO'
        ParamType = ptInput
      end>
    object qryBuscaItensIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryBuscaItensFLGCENTRALIZA: TFloatField
      FieldName = 'FLGCENTRALIZA'
    end
    object qryBuscaItensITCRECPAG: TStringField
      FieldName = 'ITCRECPAG'
      FixedChar = True
      Size = 1
    end
    object qryBuscaItensIDREGRACALC: TFloatField
      FieldName = 'IDREGRACALC'
    end
    object qryBuscaItensITCPRIORIDADE: TFloatField
      FieldName = 'ITCPRIORIDADE'
    end
    object qryBuscaItensIDPROVENTON: TFloatField
      FieldName = 'IDPROVENTON'
    end
    object qryBuscaItensITCEVENTO: TFloatField
      FieldName = 'ITCEVENTO'
    end
    object qryBuscaItensITCSEQCALCULO: TFloatField
      FieldName = 'ITCSEQCALCULO'
    end
    object qryBuscaItensIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryBuscaItensITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryBuscaItensITCTRATASALDODEV: TFloatField
      FieldName = 'ITCTRATASALDODEV'
    end
    object qryBuscaItensFLGDESTACADO: TFloatField
      FieldName = 'FLGDESTACADO'
    end
  end
end
