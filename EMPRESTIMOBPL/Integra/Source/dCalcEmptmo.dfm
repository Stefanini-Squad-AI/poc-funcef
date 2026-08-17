object dtmCalcEmptmo: TdtmCalcEmptmo
  OldCreateOrder = False
  Left = 412
  Top = 115
  Height = 532
  Width = 858
  object qrySaldoMesAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HMEDATAATUALIZA,'
      '   HMESALDODEV,'
      '   HMETXJUROS,'
      '   HMEPARCELA,'
      '   HMENUMPARCELAS'
      'FROM'
      '   HISTMOVEMPTMO HME,'
      '   ('
      '   SELECT'
      '      MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO  HME,'
      '      CONTRATOEMPTMO CON,'
      '      ITEMXTIPOCONTR ITC'
      '   WHERE'
      '          ( CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '      AND ( HME.HMEANOCOMPETENCIA  =:PANOCOMPETENCIA )'
      '      AND ( HME.HMEMESCOMPETENCIA  =:PMESCOMPETENCIA )'
      '      AND ( HME.HMEDATAATUALIZA    ='
      '            ('
      '            SELECT'
      '               MAX(H.HMEDATAATUALIZA) AS HMEDATAATUALIZA'
      '            FROM'
      '               HISTMOVEMPTMO   H,'
      '               CONTRATOEMPTMO  C,'
      '               ITEMXTIPOCONTR  I'
      '            WHERE'
      '                   ( C.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '               AND ( H.HMEANOCOMPETENCIA  =:PANOCOMPETENCIA )'
      '               AND ( H.HMEMESCOMPETENCIA  =:PMESCOMPETENCIA )'
      '               AND ( I.ITCTRATASALDODEV  <> 0 )'
      
        '               AND ( (H.FLGESTORNADO      = 0) OR (H.FLGESTORNAD' +
        'O IS NULL) )'
      '               AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )'
      
        '               AND ( C.IDTIPOCONTREMPTMO  = I.IDTIPOCONTREMPTMO ' +
        ')'
      '               AND ( H.IDITEMEMPTMO       = I.IDITEMEMPTMO )'
      '            )'
      '          )'
      
        '      AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS ' +
        'NULL) )'
      '      AND ( ITC.ITCTRATASALDODEV   <> 0)'
      '      AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO)'
      '      AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO)'
      '      AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '   ) MAX'
      'WHERE'
      '   HME.IDHISTMOVEMPTMO = MAX.IDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 168
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
      end
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
      'SELECT '
      '   HME.HMEDATAATUALIZA,'
      '   HME.HMESALDODEV,'
      '   HME.HMETXJUROS,'
      '   HME.HMEPARCELA,'
      '   HME.HMEPARCELAALT,'
      '   HME.HMENUMPARCELAS'
      'FROM ('
      '    SELECT '
      '        H.*,'
      '        ROW_NUMBER() OVER ('
      '            PARTITION BY H.IDCONTRATOEMPTMO '
      
        '            ORDER BY H.HMEDATAATUALIZA DESC, H.IDHISTMOVEMPTMO D' +
        'ESC'
      '        ) AS RN'
      '    FROM HISTMOVEMPTMO H'
      '    JOIN CONTRATOEMPTMO C '
      '      ON H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO '
      '     AND C.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      '    JOIN ITEMXTIPOCONTR I'
      '      ON H.IDITEMEMPTMO = I.IDITEMEMPTMO'
      '     AND I.ITCTRATASALDODEV <> 0'
      '    JOIN TIPOCONTREMPTMO T'
      '      ON T.IDTIPOCONTREMPTMO = I.IDTIPOCONTREMPTMO'
      '     AND C.IDTIPOCONTREMPTMO = T.IDTIPOCONTREMPTMO'
      '    WHERE H.HMEDATAATUALIZA <= :PHMEDATAATUALIZA'
      '      AND (H.FLGESTORNADO = 0 OR H.FLGESTORNADO IS NULL)'
      ') HME'
      'WHERE HME.RN = 1')
    ValidateWithMask = True
    Left = 712
    Top = 72
    ParamData = <
      item
        DataType = ftFloat
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
    object qrySaldoAntHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
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
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.FLGBAIXADO            = 0'
      '   AND HME.HMEDATAEFETIVA        IS NULL'
      '   AND HME.HMEVLREFETIVO         IS NULL'
      '   AND HME.HMEDATAPREVISTA      <=:PHMEDATAPREVISTA'
      '   AND HME.HMETIPOMOV            NOT IN (0, 5, 8)'
      '   AND (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACADO = 1)'
      '   AND NVL(HME.FLGSUSPENSAO, 0)  = 0'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0'
      ''
      'GROUP BY'
      '   HME.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 168
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
      'SELECT '
      '   HME.IDHISTMOVEMPTMO,'
      ''
      '   HME.IDITEMEMPTMO,'
      ''
      '   DECODE(HME.HMETIPOMOV, -2, -2,'
      '                          -1, -1,'
      '                           0,  0,'
      '                           1,  2,'
      '                           2,  6,'
      '                           3,  9,'
      '                           4,  7,'
      '                           5,  1,'
      '                           6,  3,'
      '                           7,  4,'
      '                           8,  5,'
      '                               8'
      '         ) AS ORDENACAO,'
      ''
      
        '   HME.HMETIPOMOV, HME.HMEORIGEM,  HME.HMESEQCOBRANCA, HME.IDITE' +
        'MCENTRALIZA,'
      '   HME.HMEPARCELA, HME.HMEPARCELAALT, HME.HMENUMPARCELAS,'
      
        '   HME.HMECENTRALIZA, HME.HMEDESTACADO, HME.HMEPRIORIDADE, HME.H' +
        'MERECPAG,'
      ''
      
        '   HME.HMEDATA, HME.HMEDATAPREVISTA, HME.HMEDATAEFETIVA, HME.HME' +
        'DATAATUALIZA, HME.HMEDATAVENCTO,'
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEANOCOBRA' +
        'NCA, HME.HMEMESCOBRANCA,'
      
        '   HME.HMEVLRPREVISTO, HME.HMEVLREFETIVO, HME.HMESALDODEV, HME.H' +
        'METXJUROS, HME.IDREGRA,'
      ''
      '   HME.HMEFORMACOBRANCA, HME.IDRUBRICA,'
      ''
      '   NVL(HME.FLGENVIO, 1)       AS FLGENVIO,'
      '   NVL(HME.FLGBAIXADO, 1)     AS FLGBAIXADO,'
      '   NVL(HME.FLGESTORNADO, 0)   AS FLGESTORNADO,'
      '   NVL(HME.FLGQUITADO, 0)     AS FLGQUITADO,'
      '   NVL(HME.FLGABONADO, 0)     AS FLGABONADO,'
      '   NVL(HME.FLGDIVERGPEND, 0)  AS FLGDIVERGPEND,'
      '   NVL(HME.FLGTIPODIVERG, 0 ) AS FLGTIPODIVERG,'
      ''
      '   DECODE(NVL(HME.FLGSUSPENSAO, 0), 0, 0,'
      
        '                                       NVL(NVL(HME.IDTIPOSUSPEMP' +
        'TMO, CON.IDTIPOSUSPEMPTMO), NVL(HME.FLGSUSPENSAO, 0))'
      '         ) AS FLGSUSPENSAO,'
      ''
      '   ITE.ITEDESCRICAO,'
      '   HME.CODDOCUMENTO,'
      '   HME.IDTMPDESC,'
      '   HME.PLNCODIGO,'
      '   HME.PLNCODIGOESTORNO'
      ''
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   CONTRATOEMPTMO CON,'
      '   ITEMEMPTMO     ITE'
      ''
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      ''
      
        '   AND ( (:PIDITEMEMPTMO        IS NULL) OR (ITE.IDITEMEMPTMO =:' +
        'PIDITEMEMPTMO) )'
      ''
      '   AND ( ITE.IDITEMEMPTMO       > 0 )'
      '   AND ( HME.HMETIPOMOV         NOT IN (5, 8) )'
      ''
      '   AND NVL(HME.FLGESTORNADO, 0) = 0'
      '   AND NVL(HME.FLGQUITADO, 0)   = 0'
      ''
      
        '   AND ( (:PABONODIVERG         = 1)     OR (NVL(HME.FLGABONADO,' +
        ' 0)    = 0) )'
      ''
      
        '   AND ( (:PHMETIPOMOV          IS NULL) OR (HME.HMETIPOMOV     ' +
        '        =:PHMETIPOMOV) )'
      
        '   AND ( (:PHMEPARCELA          IS NULL) OR (HME.HMEPARCELA     ' +
        '        =:PHMEPARCELA) )'
      ''
      
        '   AND ( (:PFLGENVIO            IS NULL) OR (NVL(HME.FLGENVIO, 1' +
        ')       =:PFLGENVIO) )'
      
        '   AND ( (:PFLGBAIXADO          IS NULL) OR (NVL(HME.FLGBAIXADO,' +
        ' 1)     =:PFLGBAIXADO) )'
      
        '   AND ( (:PFLGDIVERGPEND       IS NULL) OR (NVL(HME.FLGDIVERGPE' +
        'ND, 0)  =:PFLGDIVERGPEND) )'
      ''
      
        '   AND ( (:PHMEANOCOMPETENCIA   IS NULL) OR (HME.HMEANOCOMPETENC' +
        'IA      =:PHMEANOCOMPETENCIA) )'
      
        '   AND ( (:PHMEMESCOMPETENCIA   IS NULL) OR (HME.HMEMESCOMPETENC' +
        'IA      =:PHMEMESCOMPETENCIA) )'
      ''
      
        '   AND ( (:PHMEDATAPREVISTA     IS NULL) OR (HME.HMEDATAPREVISTA' +
        '        = TO_DATE(:PHMEDATAPREVISTA, '#39'DD/MM/YYYY'#39')) )'
      
        '   AND ( (:PHMEDATAEFETIVA      IS NULL) OR (HME.HMEDATAEFETIVA ' +
        '        = TO_DATE(:PHMEDATAEFETIVA, '#39'DD/MM/YYYY'#39')) )'
      
        '   AND ( (:PHMEDATAVENCTO       IS NULL) OR (HME.HMEDATAVENCTO  ' +
        '        = TO_DATE(:PHMEDATAVENCTO, '#39'DD/MM/YYYY'#39')) )'
      
        '   AND ( (:PHMEDATAATUALIZA     IS NULL) OR (HME.HMEDATAATUALIZA' +
        '        = TO_DATE(:PHMEDATAATUALIZA, '#39'DD/MM/YYYY'#39')) )'
      ''
      
        '   AND ( (:PCENTRALIZA          IS NULL) OR ((HME.HMECENTRALIZA ' +
        '= 1) OR (HME.HMEDESTACADO = 1)) )'
      
        '   AND ( (:PAGRUPADO            IS NULL) OR ((HME.HMECENTRALIZA ' +
        '= 0) AND (HME.HMEDESTACADO = 0)) )'
      ''
      
        '   AND ( (:PEVENTOEXCLUSAO      IS NULL) OR (HME.HMETIPOMOV     ' +
        '       <>:PEVENTOEXCLUSAO) )'
      ''
      '   AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO'
      '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO'
      ''
      'ORDER BY'
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA')
    ValidateWithMask = True
    Left = 712
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PABONODIVERG'
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
      end
      item
        DataType = ftInteger
        Name = 'PEVENTOEXCLUSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEVENTOEXCLUSAO'
        ParamType = ptInput
      end>
    object qryItensIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryItensIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryItensORDENACAO: TFloatField
      FieldName = 'ORDENACAO'
    end
    object qryItensHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryItensHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryItensHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryItensIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryItensHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryItensHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
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
    object qryItensHMEPRIORIDADE: TFloatField
      FieldName = 'HMEPRIORIDADE'
    end
    object qryItensHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
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
    object qryItensIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryItensHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryItensIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
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
    object qryItensFLGTIPODIVERG: TFloatField
      FieldName = 'FLGTIPODIVERG'
    end
    object qryItensFLGSUSPENSAO: TFloatField
      FieldName = 'FLGSUSPENSAO'
    end
    object qryItensITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryItensCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryItensPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryItensPLNCODIGOESTORNO: TFloatField
      FieldName = 'PLNCODIGOESTORNO'
    end
    object qryItensIDTMPDESC: TFloatField
      FieldName = 'IDTMPDESC'
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
      
        '   DECODE(RCT.ITCEVENTO, -2, -2, -1, -1, 0, 0, 1, 2, 2, 6, 3, 9,' +
        ' 4, 7, 5, 1, 6, 3, 7, 4, 8, 5, 8) AS ORDENACAO,'
      '   RCT.ITCEVENTO,'
      '   RCT.ITCSEQCALCULO,'
      '   RCT.ITCTRATASALDODEV,'
      '   RCT.FLGCENTRALIZA,'
      '   RCT.FLGDESTACADO,'
      '   RCT.FLGGRAVAZERO,'
      '   TOTALGRUPO.IDITEMEMPTMO AS IDITEMCENTRALIZA,'
      '   IRC.ITEDESCRICAO'
      'FROM'
      '   ITEMXTIPOCONTR RCT,'
      '   ITEMEMPTMO IRC,'
      '   ('
      '   SELECT'
      '      IDITEMEMPTMO, ITCEVENTO'
      '   FROM'
      '      ITEMXTIPOCONTR'
      '   WHERE'
      '          ( IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      '      AND ( FLGCENTRALIZA     = 1 )'
      '   ) TOTALGRUPO'
      'WHERE'
      '       ( RCT.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      '   AND'
      '   ('
      
        '   ((:PEVENTO = 0) AND ((RCT.ITCEVENTO =:PEVENTO) OR (RCT.ITCEVE' +
        'NTO = 1 AND RCT.FLGCENTRALIZA = 1)))'
      '   OR'
      '   ((:PEVENTO <> 0) AND (RCT.ITCEVENTO =:PEVENTO))'
      '   )'
      '   AND IRC.IDITEMEMPTMO > 0'
      '   AND ( RCT.IDITEMEMPTMO      = IRC.IDITEMEMPTMO )'
      '   AND ( RCT.ITCEVENTO         = TOTALGRUPO.ITCEVENTO(+) )'
      'ORDER BY'
      '   RCT.ITCSEQCALCULO, RCT.ITCSEQCALCULO')
    ValidateWithMask = True
    Left = 64
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
    object qryBuscaItensFLGGRAVAZERO: TFloatField
      FieldName = 'FLGGRAVAZERO'
    end
    object qryBuscaItensORDENACAO: TFloatField
      FieldName = 'ORDENACAO'
    end
  end
  object qryItensEmAberto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '    HME.IDCONTRATOEMPTMO, HME.IDHISTMOVEMPTMO,'
      '    HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,'
      '    HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEVLRPREVISTO'
      'FROM'
      '    HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV           NOT IN (0, 5, 8)'
      '   AND HME.FLGBAIXADO           = 0'
      '   AND HME.HMEDATAEFETIVA       IS NULL'
      '   AND HME.HMEVLREFETIVO        IS NULL'
      '   AND HME.HMEVLRPREVISTO      <> 0'
      '   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1)'
      ''
      '   AND NVL(HME.FLGESTORNADO, 0) = 0'
      '   AND NVL(HME.FLGSUSPENSAO, 0) = 0'
      '   AND NVL(HME.FLGQUITADO, 0)   = 0'
      '   AND NVL(HME.FLGABONADO, 0)   = 0'
      ''
      
        '   AND (:PFILTRODATA            IS NULL OR (:PFILTRODATA IS NOT ' +
        'NULL AND HME.HMEDATAVENCTO + 7 < :PHMEDATAVENCTO))'
      
        '   AND (:PFILTROMES             IS NULL OR (:PFILTROMES  IS NOT ' +
        'NULL AND (TRIM(TO_CHAR(HME.HMEANOCOBRANCA,'#39'0000'#39')) || trim(TO_CH' +
        'AR(HME.HMEMESCOBRANCA,'#39'00'#39')) < :PHMEANOCOBRANCA || :PHMEMESCOBRA' +
        'NCA)))'
      '   ')
    ValidateWithMask = True
    Left = 256
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTRODATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTRODATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAVENCTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTROMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTROMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end>
    object qryItensEmAbertoIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryItensEmAbertoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryItensEmAbertoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryItensEmAbertoHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryItensEmAbertoHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryItensEmAbertoHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryItensEmAbertoHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
  end
  object qryParcelasNaoPagas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    HME.IDHISTMOVEMPTMO,'
      '    HME.HMEVLRPREVISTO,'
      '    HME.HMEPARCELA,'
      '    HME.HMEDATAVENCTO,'
      '    HME.HMEDATAPREVISTA'
      'FROM'
      '    HISTMOVEMPTMO HME'
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO )'
      '   AND ( HME.HMETIPOMOV       IN (1, 7) )'
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMEDATAEFETIVA   IS NULL )'
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      '   AND ( HME.HMEVLRPREVISTO   > 0 )'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )'
      '   AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO = 0) )'
      '   AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO = 0) )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0)' +
        ' )'
      'ORDER BY'
      '   HME.IDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 168
    Top = 208
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcelasNaoPagasIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryParcelasNaoPagasHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryParcelasNaoPagasHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryParcelasNaoPagasHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryParcelasNaoPagasHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
  end
  object qryParcelasAtrasadas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    HME.IDHISTMOVEMPTMO,'
      '    HME.HMEVLRPREVISTO,'
      '    HME.HMEPARCELA,'
      '    HME.HMEDATAVENCTO,'
      '    HME.HMEDATAPREVISTA'
      'FROM'
      '    HISTMOVEMPTMO HME'
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO )'
      '   AND ( HME.HMEDATAPREVISTA  <=:PHMEDATAPREVISTA )'
      '   AND ( HME.HMETIPOMOV       IN (1, 7) )'
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMEDATAEFETIVA   IS NULL )'
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      '   AND ( HME.HMEVLRPREVISTO   > 0 )'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )'
      '   AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO = 0) )'
      '   AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO = 0) )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0)' +
        ' )'
      'ORDER BY'
      '   HME.IDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 168
    Top = 264
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end>
    object qryParcelasAtrasadasIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
    object qryParcelasAtrasadasHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEVLRPREVISTO'
    end
    object qryParcelasAtrasadasHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEPARCELA'
    end
    object qryParcelasAtrasadasHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAVENCTO'
    end
    object qryParcelasAtrasadasHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAPREVISTA'
    end
  end
  object qryVerificaInsertValorZERO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(FLGGRAVAZERO, 0) AS FLGGRAVAZERO'
      'FROM'
      '   ITEMXTIPOCONTR'
      'WHERE'
      '       IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO'
      '   AND IDITEMEMPTMO      =:PIDITEMEMPTMO')
    ValidateWithMask = True
    Left = 328
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end>
    object qryVerificaInsertValorZEROFLGGRAVAZERO: TFloatField
      FieldName = 'FLGGRAVAZERO'
    end
  end
  object qryParcelasAVencer: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    HME.IDHISTMOVEMPTMO,'
      '    HME.IDITEMEMPTMO,'
      ''
      '    DECODE(HME.HMETIPOMOV, -2, -2,'
      '                           -1, -1,'
      '                            0,  0,'
      '                            1,  2,'
      '                            2,  6,'
      '                            3,  9,'
      '                            4,  7,'
      '                            5,  1,'
      '                            6,  3,'
      '                            7,  4,'
      '                            8,  5,'
      '                                8'
      '          ) AS ORDENACAO,'
      ''
      '    HME.HMETIPOMOV,'
      '    HME.HMEORIGEM,'
      '    HME.HMEVLRPREVISTO,'
      ''
      '    NVL(HME.HMEVLREFETIVO, 0) AS HMEVLREFETIVO,'
      ''
      '    HME.HMEPARCELA,'
      '    HME.HMENUMPARCELAS,'
      '    HME.HMEDATAVENCTO,'
      '    HME.HMEDATAPREVISTA,'
      '    HME.HMEDATAEFETIVA,'
      '    HME.HMEDATAATUALIZA,'
      '    HME.HMECENTRALIZA,'
      '    HME.HMEDESTACADO,'
      ''
      '    NVL(HME.FLGENVIO, 1)       AS FLGENVIO,'
      '    NVL(HME.FLGBAIXADO, 1)     AS FLGBAIXADO,'
      '    NVL(HME.FLGESTORNADO, 0)   AS FLGESTORNADO,'
      '    NVL(HME.FLGQUITADO, 0)     AS FLGQUITADO,'
      '    NVL(HME.FLGABONADO, 0)     AS FLGABONADO,'
      '    NVL(HME.FLGDIVERGPEND, 0)  AS FLGDIVERGPEND,'
      '    NVL(HME.FLGTIPODIVERG, 0)  AS FLGTIPODIVERG, '
      ''
      '    DECODE(NVL(HME.FLGSUSPENSAO, 0), 0, 0,'
      
        '                                        NVL(NVL(HME.IDTIPOSUSPEM' +
        'PTMO, CON.IDTIPOSUSPEMPTMO), NVL(HME.FLGSUSPENSAO, 0))'
      '          ) AS FLGSUSPENSAO,'
      ''
      '    HME.HMEFORMACOBRANCA,'
      '    HME.HMEANOCOMPETENCIA,'
      '    HME.HMEMESCOMPETENCIA,'
      '    HME.HMEANOCOBRANCA,'
      '    HME.HMEMESCOBRANCA,'
      '    HME.HMESALDODEV,'
      '    HME.HMETXJUROS,'
      '    HME.IDTMPDESC,'
      '    HME.CODDOCUMENTO'
      ''
      'FROM'
      '    HISTMOVEMPTMO  HME,'
      '    CONTRATOEMPTMO CON'
      ''
      'WHERE'
      '       HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND HME.HMEDATAPREVISTA  >=:PHMEDATAPREVISTA'
      '   AND HME.HMETIPOMOV       IN (1, 6, 7)'
      '   AND HME.FLGBAIXADO       IS NULL'
      '   AND HME.HMEDATAEFETIVA   IS NOT NULL'
      '   AND HME.HMEVLREFETIVO    IS NOT NULL'
      '   AND HME.HMEVLRPREVISTO   > 0'
      '   AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   AND (HME.FLGQUITADO      IS NULL OR HME.FLGQUITADO = 0)'
      '   AND (HME.FLGABONADO      IS NULL OR HME.FLGABONADO = 0)'
      '   AND (HME.FLGESTORNADO    IS NULL OR HME.FLGESTORNADO = 0)'
      ''
      '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO'
      ''
      'ORDER BY'
      '   HME.IDHISTMOVEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 64
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end>
    object qryParcelasAVencerIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryParcelasAVencerIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryParcelasAVencerHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryParcelasAVencerHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryParcelasAVencerHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryParcelasAVencerHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryParcelasAVencerHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryParcelasAVencerHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryParcelasAVencerHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryParcelasAVencerHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryParcelasAVencerHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryParcelasAVencerHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryParcelasAVencerHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryParcelasAVencerFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
    end
    object qryParcelasAVencerFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryParcelasAVencerFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryParcelasAVencerFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
    end
    object qryParcelasAVencerHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryParcelasAVencerHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryParcelasAVencerHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryParcelasAVencerHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryParcelasAVencerHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryParcelasAVencerHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryParcelasAVencerHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryParcelasAVencerFLGSUSPENSAO: TFloatField
      FieldName = 'FLGSUSPENSAO'
    end
    object qryParcelasAVencerORDENACAO: TFloatField
      FieldName = 'ORDENACAO'
    end
    object qryParcelasAVencerHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryParcelasAVencerFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object qryParcelasAVencerFLGDIVERGPEND: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object qryParcelasAVencerFLGTIPODIVERG: TFloatField
      FieldName = 'FLGTIPODIVERG'
    end
    object qryParcelasAVencerIDTMPDESC: TFloatField
      FieldName = 'IDTMPDESC'
    end
    object qryParcelasAVencerCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
  end
  object qrySeguroAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(HMEVLRPREVISTO) AS HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDITEMEMPTMO         =:PIDITEMEMPTMO'
      '   AND HME.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '   AND NVL(HME.FLGESTORNADO, 0) = 0')
    ValidateWithMask = True
    Left = 329
    Top = 100
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qrySeguroAntHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryDependIRRF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(COUNT(*), 0) AS QUANT'
      'FROM'
      '   DEPENTIT'
      'WHERE'
      '       FLGCONTAIMPOSTOR = 1'
      '   AND IDTITULAR        =:PIDTITULAR'
      
        '   AND NVL(FIMIMPOSTOR,to_date(:PFIMIMPOSTOR,'#39'DD/MM/YYYY'#39') +1) >' +
        ' to_date(:PFIMIMPOSTOR,'#39'DD/MM/YYYY'#39')')
    ValidateWithMask = True
    Left = 64
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PFIMIMPOSTOR'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PFIMIMPOSTOR'
        ParamType = ptInput
      end>
    object qryDependIRRFQUANT: TFloatField
      FieldName = 'QUANT'
    end
  end
  object qrySaldoParcelaAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HST.HMEDATAATUALIZA,'
      '   HST.HMESALDODEV,'
      '   HST.HMETXJUROS,'
      '   HST.HMEPARCELA,'
      '   HST.HMEPARCELAALT,'
      '   HST.HMENUMPARCELAS'
      'FROM'
      '   HISTMOVEMPTMO HST,'
      ''
      '   ('
      '   SELECT'
      '      MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO'
      '  FROM'
      '      HISTMOVEMPTMO   HME'
      '   WHERE'
      '          ( HME.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO )'
      '      AND ( HME.HMETIPOMOV         NOT IN (4, 5) )'
      
        '      AND ( :PALTERAPARCELA        IS NULL OR (:PALTERAPARCELA I' +
        'S NOT NULL AND HME.HMETIPOMOV in (1, 2, 3)) )'
      
        '      AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS ' +
        'NULL) )'
      '      AND ( HME.HMEDATAATUALIZA    ='
      '            ('
      '            SELECT '
      '               MAX(H.HMEDATAATUALIZA) AS HMEDATAATUALIZA'
      '            FROM'
      '               HISTMOVEMPTMO   H'
      '            WHERE'
      '                   ( H.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO )'
      '               AND ( H.HMETIPOMOV         NOT IN (4, 5) )'
      
        '               AND ( :PALTERAPARCELA   IS NULL OR (:PALTERAPARCE' +
        'LA IS NOT NULL AND H.HMETIPOMOV in (1, 2, 3)) )'
      '               AND ( H.HMEDATAATUALIZA   <= :PHMEDATAATUALIZA)'
      
        '               AND ( (H.FLGESTORNADO      = 0) OR (H.FLGESTORNAD' +
        'O IS NULL) )'
      
        '               AND ( NVL(H.HMEPARCELA,0) <> 0 or NVL(H.HMENUMPAR' +
        'CELAS,0) <> 0 )'
      '            )'
      '          )'
      '   ) MAX'
      'WHERE'
      '   ( HST.IDCONTRATOEMPTMO   = :PIDCONTRATOEMPTMO )'
      '   AND ( HST.IDHISTMOVEMPTMO = MAX.IDHISTMOVEMPTMO )'
      ' ')
    ValidateWithMask = True
    Left = 712
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PALTERAPARCELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PALTERAPARCELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PALTERAPARCELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PALTERAPARCELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qrySaldoParcelaAntHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qrySaldoParcelaAntHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qrySaldoParcelaAntHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qrySaldoParcelaAntHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qrySaldoParcelaAntHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
    object qrySaldoParcelaAntHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
  end
  object qryUpdateSituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   CONTRATOEMPTMO CON'
      'SET'
      '   CON.FLGSITUACAO   =:PFLGSITUACAO,'
      '   CON.DATASITUACAO  =:PDATASITUACAO,'
      '   CON.DATACANC      =:PDATACANC'
      'WHERE'
      '   CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 336
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'PFLGSITUACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATASITUACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATACANC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qrySituacaoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.FLGSITUACAO'
      'FROM'
      '   CONTRATOEMPTMO CON'
      'WHERE'
      '   CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 368
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qrySituacaoContratoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object qryUltDataAtualiza: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   MAX(HMEDATAPREVISTA) AS HMEDATAATUALIZA'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  CON,'
      '   ITEMXTIPOCONTR  ITC,'
      '   TIPOCONTREMPTMO TCE'
      'WHERE'
      '       CON.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '   AND ITC.ITCTRATASALDODEV    <> 0'
      '   AND NVL(HME.FLGESTORNADO, 0) = 0'
      '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO'
      '   AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 440
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryUltDataAtualizaHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
  end
  object qryPossuiAtualizacaoDiaria: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DISTINCT HMEDATAATUALIZA'
      'FROM'
      '   HISTMOVEMPTMO  HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV            = 5'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEDATAATUALIZA       =:PHMEDATAATUALIZA')
    ValidateWithMask = True
    Left = 320
    Top = 424
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
    object DateTimeField1: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAATUALIZA'
    end
  end
  object qrySaldoAntAtuDia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HMEDATAATUALIZA,'
      '   HMESALDODEV,'
      '   HMETXJUROS,'
      '   HMEPARCELA,'
      '   HMEPARCELAALT,'
      '   HMENUMPARCELAS'
      'FROM'
      '   ('
      '   SELECT'
      '      HME.HMEDATAATUALIZA,'
      '      HME.HMESALDODEV,'
      '      HME.HMETXJUROS,'
      '      HME.HMEPARCELA,'
      '      HME.HMEPARCELAALT,'
      '      HME.HMENUMPARCELAS,'
      '      HME.IDCONTRATOEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO HME,'
      '      CONTRATOEMPTMO CON,'
      '      ITEMXTIPOCONTR ITC'
      '   WHERE'
      '          HME.IDCONTRATOEMPTMO          = :PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV                between 0 and 9'
      '      AND HME.HMEDATAPREVISTA           ='
      '(SELECT MAX(h.hmedataprevista) '
      '                                           FROM histmovemptmo h'
      
        '                                                JOIN contratoemp' +
        'tmo c ON c.idcontratoemptmo = h.idcontratoemptmo'
      
        '                                                JOIN itemxtipoco' +
        'ntr ixt ON ixt.iditememptmo = h.iditememptmo'
      
        '                                                                ' +
        '        AND ixt.idtipocontremptmo = c.idtipocontremptmo'
      
        '                                           WHERE h.idcontratoemp' +
        'tmo = :PIDCONTRATOEMPTMO'
      
        '                                           AND   NVL(h.flgestorn' +
        'ado,0) = 0'
      
        '                                           AND   h.hmetipomov be' +
        'tween 0 and 9'
      
        '                                           AND   h.hmedataprevis' +
        'ta <= :PHMEDATAATUALIZA'
      
        '                                           AND   ixt.itctratasal' +
        'dodev <> 0)'
      '      AND ITC.ITCTRATASALDODEV          <> 0'
      '      AND NVL(HME.FLGESTORNADO, 0)      = 0'
      '      AND HME.IDCONTRATOEMPTMO          = CON.IDCONTRATOEMPTMO'
      '      AND CON.IDTIPOCONTREMPTMO         = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO              = ITC.IDITEMEMPTMO'
      '   ORDER BY'
      
        '      ITC.ITCORDEMEXTRATO DESC, HME.HMESEQCOBRANCA DESC, HME.IDH' +
        'ISTMOVEMPTMO DESC'
      '   )'
      'WHERE'
      '   ROWNUM = 1')
    ValidateWithMask = True
    Left = 716
    Top = 191
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
    object qrySaldoAntAtuDiaHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qrySaldoAntAtuDiaHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qrySaldoAntAtuDiaHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qrySaldoAntAtuDiaHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qrySaldoAntAtuDiaHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
    object qrySaldoAntAtuDiaHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
  end
  object qryExisteQuitacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTMOVEMPTMO'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV            = 3'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      
        '   AND (HME.HMEVLREFETIVO        IS NULL OR HME.HMEVLREFETIVO = ' +
        'HME.HMEVLRPREVISTO)'
      ' ')
    ValidateWithMask = True
    Left = 408
    Top = 318
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object FloatField1: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
  end
  object qryParcelaAtrasadaEmAberto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '   AND HMETIPOMOV             = 1'
      '   AND HME.FLGBAIXADO         = 0'
      '   AND HME.HMEDATAPREVISTA    <:PHMEDATAPREVISTA'
      
        '   AND ( :PFLGEXCEPCIONAL     = 1 AND HME.HMEMESCOBRANCA <>:PHME' +
        'MESCOBRANCA AND HME.HMEANOCOBRANCA <=:PHMEANOCOBRANCA )'
      '   AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO      = 1 )'
      '   AND ( HME.FLGQUITADO       IS NULL OR HME.FLGQUITADO    = 0 )'
      '   AND ( HME.FLGABONADO       IS NULL OR HME.FLGABONADO    = 0 )'
      '   AND ( HME.FLGESTORNADO     IS NULL OR HME.FLGESTORNADO  = 0 )'
      '   AND ( HME.FLGSUSPENSAO     IS NULL OR HME.FLGSUSPENSAO  = 0 )'
      '   AND HMEVLREFETIVO         IS NULL'
      '   AND HMEDATAEFETIVA        IS NULL'
      ' ')
    ValidateWithMask = True
    Left = 248
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGEXCEPCIONAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end>
    object FloatField3: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
  end
  object qryDataMorte: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DATAMORTE'
      'FROM'
      '   PESSOAFISICA'
      'WHERE'
      '   IDPESSOA =:PIDPESSOA')
    ValidateWithMask = True
    Left = 64
    Top = 304
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryDataMorteDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
      Origin = 'BASEDADOS.PESSOAFISICA.DATAMORTE'
    end
  end
  object qryTotalPrevPerda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(HME.HMEVLRPREVISTO) AS VLR_TOTAL'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.IDITEMEMPTMO          =:PIDITEMEMPTMO'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0')
    ValidateWithMask = True
    Left = 64
    Top = 368
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end>
    object qryTotalPrevPerdaVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
  end
  object qryLimpaRepasse: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   CONTRATOXBENEFSEG CXB'
      'SET'
      '   CXB.VLRSALDOREC = NULL,'
      '   CXB.VLRREPASSE  = NULL,'
      '   CXB.DATAREPASSE = NULL'
      'WHERE'
      '   CXB.IDINSCRICAOEMPTMO = ('
      '                           SELECT'
      '                              IDINSCRICAOEMPTMO'
      '                           FROM'
      '                              CONTRATOEMPTMO'
      '                           WHERE'
      
        '                              IDCONTRATOEMPTMO =:PIDCONTRATOEMPT' +
        'MO'
      '                           )')
    ValidateWithMask = True
    Left = 64
    Top = 216
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryPossuiAtualizacaoDiariaExt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DISTINCT DATAPREVISTA HMEDATAATUALIZA'
      'FROM'
      '   HMEATUDIARIA  HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.DATAPREVISTA       =:PHMEDATAATUALIZA'
      'UNION'
      'SELECT'
      '   DATAPREVISTA'
      'FROM'
      '   cm.hmeatudiariaext  HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.DATAPREVISTA       <=:PHMEDATAATUALIZA')
    ValidateWithMask = True
    Left = 64
    Top = 440
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
      end
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
    object DateTimeField2: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAATUALIZA'
    end
  end
  object qryHistMovXDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(*) AS QUANT'
      'FROM'
      '   HISTMOVXDOCUM HMD'
      'WHERE'
      '       HMD.HMDCODDOCUMENTO =:PHMDCODDOCUMENTO'
      '   AND HMD.IDHISTMOVEMPTMO =:PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 256
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PHMDCODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
    object qryHistMovXDocumQUANT: TFloatField
      FieldName = 'QUANT'
    end
  end
  object qrySaldoAntAtuDiaDivergNOVO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HMEDATAATUALIZA,'
      '   HMESALDODEV,'
      '   HMETXJUROS,'
      '   HMEPARCELA,'
      '   HMEPARCELAALT,'
      '   HMENUMPARCELAS'
      'FROM'
      '   ('
      '   SELECT'
      '      HME.HMEDATAATUALIZA,'
      '      HME.HMESALDODEV,'
      '      HME.HMETXJUROS,'
      '      HME.HMEPARCELA,'
      '      HME.HMEPARCELAALT,'
      '      HME.HMENUMPARCELAS,'
      '      HME.IDCONTRATOEMPTMO'
      '   FROM'
      '      PREPARAHISTMOVEMPTMO HME,'
      '      CONTRATOEMPTMO CON,'
      '      ITEMXTIPOCONTR ITC'
      '   WHERE'
      '          HME.IDCONTRATOEMPTMO          =:PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV                between 0 and 9'
      '      AND HME.HMEDATAPREVISTA           =:PHMEDATAATUALIZA'
      '      AND ITC.ITCTRATASALDODEV          <> 0'
      '      AND NVL(HME.FLGESTORNADO, 0)      = 0'
      '      AND HME.IDCONTRATOEMPTMO          = CON.IDCONTRATOEMPTMO'
      '      AND CON.IDTIPOCONTREMPTMO         = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO              = ITC.IDITEMEMPTMO'
      '   ORDER BY'
      
        '      ITC.ITCORDEMEXTRATO DESC, HME.HMESEQCOBRANCA DESC, HME.IDH' +
        'ISTMOVEMPTMO DESC'
      '   )'
      'WHERE'
      '   ROWNUM = 1')
    ValidateWithMask = True
    Left = 864
    Top = 190
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
  end
  object qrySaldoParcelaAntDivergNOVO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   HST.HMEDATAATUALIZA,'
      '   HST.HMESALDODEV,'
      '   HST.HMETXJUROS,'
      '   HST.HMEPARCELA,'
      '   HST.HMEPARCELAALT,'
      '   HST.HMENUMPARCELAS'
      'FROM'
      '   PREPARAHISTMOVEMPTMO HST,'
      ''
      '   ('
      '   SELECT '
      '      MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO'
      '   FROM'
      '      PREPARAHISTMOVEMPTMO   HME'
      '   WHERE'
      '          ( HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '      AND ( HME.HMETIPOMOV         NOT IN (4, 5) )'
      
        '      AND ( :PALTERAPARCELA        IS NULL OR (:PALTERAPARCELA I' +
        'S NOT NULL AND HME.HMETIPOMOV in (1, 2, 3)) )'
      
        '      AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS ' +
        'NULL) )'
      '      AND ( HME.HMEDATAATUALIZA    ='
      '            ('
      '            SELECT '
      '               MAX(H.HMEDATAATUALIZA) AS HMEDATAATUALIZA'
      '            FROM'
      '               PREPARAHISTMOVEMPTMO   H'
      '            WHERE'
      '                   ( H.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '               AND ( H.HMETIPOMOV         NOT IN (4, 5) )'
      
        '               AND ( :PALTERAPARCELA      IS NULL OR (:PALTERAPA' +
        'RCELA IS NOT NULL AND H.HMETIPOMOV in (1, 2, 3)) )'
      '               AND ( H.HMEDATAATUALIZA   <=:PHMEDATAATUALIZA )'
      
        '               AND ( (H.FLGESTORNADO      = 0) OR (H.FLGESTORNAD' +
        'O IS NULL) )'
      
        '               AND ( NVL(H.HMEPARCELA,0) <> 0 or NVL(H.HMENUMPAR' +
        'CELAS,0) <> 0 )'
      '            )'
      '          )'
      '   ) MAX'
      'WHERE'
      '   ( HST.IDHISTMOVEMPTMO = MAX.IDHISTMOVEMPTMO )'
      ' ')
    ValidateWithMask = True
    Left = 864
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PALTERAPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PALTERAPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PALTERAPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PALTERAPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
  end
  object qrySaldoAntDivergNOVO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   HMEDATAATUALIZA,'
      '   HMESALDODEV,'
      '   HMETXJUROS,'
      '   HMEPARCELA,'
      '   HMEPARCELAALT,'
      '   HMENUMPARCELAS'
      'FROM'
      '   PREPARAHISTMOVEMPTMO HME,'
      ''
      '   ('
      '   SELECT '
      '      MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO'
      '   FROM'
      '      PREPARAHISTMOVEMPTMO   HME,'
      '      CONTRATOEMPTMO  CON,'
      '      ITEMXTIPOCONTR  ITC,'
      '      TIPOCONTREMPTMO TCE'
      '   WHERE'
      '          ( CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '      AND ( ITC.ITCTRATASALDODEV  <> 0 )'
      
        '      AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS ' +
        'NULL) )'
      '      AND ( HME.HMEDATAATUALIZA    ='
      '            ('
      '            SELECT '
      '               MAX(H.HMEDATAATUALIZA) AS HMEDATAATUALIZA'
      '            FROM'
      '               PREPARAHISTMOVEMPTMO   H,'
      '               CONTRATOEMPTMO  C,'
      '               ITEMXTIPOCONTR  I'
      '            WHERE'
      '                   ( C.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '               AND ( H.HMEDATAATUALIZA   <=:PHMEDATAATUALIZA )'
      '               AND ( I.ITCTRATASALDODEV  <> 0 )'
      
        '               AND ( (H.FLGESTORNADO      = 0) OR (H.FLGESTORNAD' +
        'O IS NULL) )'
      '               AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )'
      
        '               AND ( C.IDTIPOCONTREMPTMO  = I.IDTIPOCONTREMPTMO ' +
        ')'
      '               AND ( H.IDITEMEMPTMO       = I.IDITEMEMPTMO )'
      '            )'
      '          )'
      '      AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '      AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '      AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '      AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '   ) MAX'
      'WHERE'
      '   ( HME.IDHISTMOVEMPTMO = MAX.IDHISTMOVEMPTMO )')
    ValidateWithMask = True
    Left = 864
    Top = 72
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
  end
  object qryItensDivergNOVO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   HME.IDHISTMOVEMPTMO,'
      ''
      '   HME.IDITEMEMPTMO,'
      ''
      '   DECODE(HME.HMETIPOMOV, -2, -2,'
      '                          -1, -1,'
      '                           0,  0,'
      '                           1,  2,'
      '                           2,  6,'
      '                           3,  9,'
      '                           4,  7,'
      '                           5,  1,'
      '                           6,  3,'
      '                           7,  4,'
      '                           8,  5,'
      '                               8'
      '         ) AS ORDENACAO,'
      ''
      
        '   HME.HMETIPOMOV, HME.HMEORIGEM,  HME.HMESEQCOBRANCA, HME.IDITE' +
        'MCENTRALIZA,'
      '   HME.HMEPARCELA, HME.HMEPARCELAALT, HME.HMENUMPARCELAS,'
      
        '   HME.HMECENTRALIZA, HME.HMEDESTACADO, HME.HMEPRIORIDADE, HME.H' +
        'MERECPAG,'
      ''
      
        '   HME.HMEDATA, HME.HMEDATAPREVISTA, HME.HMEDATAEFETIVA, HME.HME' +
        'DATAATUALIZA, HME.HMEDATAVENCTO,'
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEANOCOBRA' +
        'NCA, HME.HMEMESCOBRANCA,'
      
        '   HME.HMEVLRPREVISTO, HME.HMEVLREFETIVO, HME.HMESALDODEV, HME.H' +
        'METXJUROS, HME.IDREGRA,'
      ''
      '   HME.HMEFORMACOBRANCA, HME.IDRUBRICA,'
      ''
      '   NVL(HME.FLGENVIO, 1)       AS FLGENVIO,'
      '   NVL(HME.FLGBAIXADO, 1)     AS FLGBAIXADO,'
      '   NVL(HME.FLGESTORNADO, 0)   AS FLGESTORNADO,'
      '   NVL(HME.FLGQUITADO, 0)     AS FLGQUITADO,'
      '   NVL(HME.FLGABONADO, 0)     AS FLGABONADO,'
      '   NVL(HME.FLGDIVERGPEND, 0)  AS FLGDIVERGPEND,'
      '   NVL(HME.FLGTIPODIVERG, 0 ) AS FLGTIPODIVERG,'
      ''
      '   DECODE(NVL(HME.FLGSUSPENSAO, 0), 0, 0,'
      
        '                                       NVL(NVL(HME.IDTIPOSUSPEMP' +
        'TMO, CON.IDTIPOSUSPEMPTMO), NVL(HME.FLGSUSPENSAO, 0))'
      '         ) AS FLGSUSPENSAO,'
      ''
      '   ITE.ITEDESCRICAO,'
      '   HME.CODDOCUMENTO,'
      '   HME.PLNCODIGO,'
      '   HME.PLNCODIGOESTORNO'
      ''
      'FROM'
      '   PREPARAHISTMOVEMPTMO  HME,'
      '   CONTRATOEMPTMO CON,'
      '   ITEMEMPTMO     ITE'
      ''
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      ''
      
        '   AND ( (:PIDITEMEMPTMO        IS NULL) OR (ITE.IDITEMEMPTMO =:' +
        'PIDITEMEMPTMO) )'
      ''
      '   AND ( ITE.IDITEMEMPTMO       > 0 )'
      '   AND ( HME.HMETIPOMOV         NOT IN (5, 8) )'
      ''
      '   AND NVL(HME.FLGESTORNADO, 0) = 0'
      '   AND NVL(HME.FLGQUITADO, 0)   = 0'
      ''
      
        '   AND ( (:PABONODIVERG         = 1)     OR (NVL(HME.FLGABONADO,' +
        ' 0)    = 0) )'
      ''
      
        '   AND ( (:PHMETIPOMOV          IS NULL) OR (HME.HMETIPOMOV     ' +
        '        =:PHMETIPOMOV) )'
      
        '   AND ( (:PHMEPARCELA          IS NULL) OR (HME.HMEPARCELA     ' +
        '        =:PHMEPARCELA) )'
      ''
      
        '   AND ( (:PFLGENVIO            IS NULL) OR (NVL(HME.FLGENVIO, 1' +
        ')       =:PFLGENVIO) )'
      
        '   AND ( (:PFLGBAIXADO          IS NULL) OR (NVL(HME.FLGBAIXADO,' +
        ' 1)     =:PFLGBAIXADO) )'
      
        '   AND ( (:PFLGDIVERGPEND       IS NULL) OR (NVL(HME.FLGDIVERGPE' +
        'ND, 0)  =:PFLGDIVERGPEND) )'
      ''
      
        '   AND ( (:PHMEANOCOMPETENCIA   IS NULL) OR (HME.HMEANOCOMPETENC' +
        'IA      =:PHMEANOCOMPETENCIA) )'
      
        '   AND ( (:PHMEMESCOMPETENCIA   IS NULL) OR (HME.HMEMESCOMPETENC' +
        'IA      =:PHMEMESCOMPETENCIA) )'
      ''
      
        '   AND ( (:PHMEDATAPREVISTA     IS NULL) OR (HME.HMEDATAPREVISTA' +
        '        = TO_DATE(:PHMEDATAPREVISTA, '#39'DD/MM/YYYY'#39')) )'
      
        '   AND ( (:PHMEDATAEFETIVA      IS NULL) OR (HME.HMEDATAEFETIVA ' +
        '        = TO_DATE(:PHMEDATAEFETIVA, '#39'DD/MM/YYYY'#39')) )'
      
        '   AND ( (:PHMEDATAVENCTO       IS NULL) OR (HME.HMEDATAVENCTO  ' +
        '        = TO_DATE(:PHMEDATAVENCTO, '#39'DD/MM/YYYY'#39')) )'
      
        '   AND ( (:PHMEDATAATUALIZA     IS NULL) OR (HME.HMEDATAATUALIZA' +
        '        = TO_DATE(:PHMEDATAATUALIZA, '#39'DD/MM/YYYY'#39')) )'
      ''
      
        '   AND ( (:PCENTRALIZA          IS NULL) OR ((HME.HMECENTRALIZA ' +
        '= 1) OR (HME.HMEDESTACADO = 1)) )'
      
        '   AND ( (:PAGRUPADO            IS NULL) OR ((HME.HMECENTRALIZA ' +
        '= 0) AND (HME.HMEDESTACADO = 0)) )'
      ''
      
        '   AND ( (:PEVENTOEXCLUSAO      IS NULL) OR (HME.HMETIPOMOV     ' +
        '       <>:PEVENTOEXCLUSAO) )'
      ''
      '   AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO'
      '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO'
      ''
      'ORDER BY'
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA')
    ValidateWithMask = True
    Left = 864
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PABONODIVERG'
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
      end
      item
        DataType = ftInteger
        Name = 'PEVENTOEXCLUSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEVENTOEXCLUSAO'
        ParamType = ptInput
      end>
    object FloatField2: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object FloatField4: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object FloatField5: TFloatField
      FieldName = 'ORDENACAO'
    end
    object FloatField6: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object FloatField7: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object FloatField8: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object FloatField9: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object FloatField10: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object FloatField11: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
    object FloatField12: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object FloatField13: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object FloatField14: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object FloatField15: TFloatField
      FieldName = 'HMEPRIORIDADE'
    end
    object StringField1: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'HMEDATA'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object DateTimeField7: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object FloatField16: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object FloatField17: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object FloatField18: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object FloatField19: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object FloatField20: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object FloatField21: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object FloatField22: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object FloatField23: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object FloatField24: TFloatField
      FieldName = 'IDREGRA'
    end
    object StringField2: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object FloatField25: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object FloatField26: TFloatField
      FieldName = 'FLGENVIO'
    end
    object FloatField27: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object FloatField28: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object FloatField29: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object FloatField30: TFloatField
      FieldName = 'FLGABONADO'
    end
    object FloatField31: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object FloatField32: TFloatField
      FieldName = 'FLGTIPODIVERG'
    end
    object FloatField33: TFloatField
      FieldName = 'FLGSUSPENSAO'
    end
    object StringField3: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object FloatField34: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object FloatField35: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object FloatField36: TFloatField
      FieldName = 'PLNCODIGOESTORNO'
    end
  end
  object qryExisteQuitacaoAberto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, HME.HMEDATA'
      '  FROM HISTMOVEMPTMO HME'
      'WHERE HME.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      'AND HME.HMECENTRALIZA = 1'
      'AND HME.HMETIPOMOV = 3'
      'AND HME.FLGBAIXADO = 0'
      'AND HME.HMEVLREFETIVO IS NULL'
      'AND HME.HMEDATAEFETIVA IS NULL'
      'AND NVL(HME.Flgestornado,0) = 0'
      '         '
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 259
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qrySaldoAntAtuDiaANTIGA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   HMEDATAATUALIZA,'
      '   HMESALDODEV,'
      '   HMETXJUROS,'
      '   HMEPARCELA,'
      '   HMEPARCELAALT,'
      '   HMENUMPARCELAS'
      'FROM'
      '   ('
      '   SELECT '
      '      HME.HMEDATAATUALIZA,'
      '      HME.HMESALDODEV,'
      '      HME.HMETXJUROS,'
      '      HME.HMEPARCELA,'
      '      HME.HMEPARCELAALT,'
      '      HME.HMENUMPARCELAS,'
      '      HME.IDCONTRATOEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO HME,'
      '      CONTRATOEMPTMO CON,'
      '      ITEMXTIPOCONTR ITC'
      '   WHERE'
      '          HME.IDCONTRATOEMPTMO          =:PIDCONTRATOEMPTMO'
      '      AND HME.HMETIPOMOV                between 0 and 9'
      '      AND HME.HMEDATAPREVISTA           ='
      '(SELECT MAX(h.hmedataprevista) '
      '                                           FROM histmovemptmo h'
      
        '                                                JOIN contratoemp' +
        'tmo c ON c.idcontratoemptmo = h.idcontratoemptmo'
      
        '                                                JOIN itemxtipoco' +
        'ntr ixt ON ixt.iditememptmo = h.iditememptmo'
      
        '                                                                ' +
        '        AND ixt.idtipocontremptmo = c.idtipocontremptmo'
      
        '                                           WHERE h.idcontratoemp' +
        'tmo =:PIDCONTRATOEMPTMO'
      
        '                                           AND   NVL(h.flgestorn' +
        'ado,0) = 0'
      
        '                                           AND   h.hmetipomov be' +
        'tween 0 and 9'
      
        '                                           AND   h.hmedataprevis' +
        'ta <= :PHMEDATAATUALIZA'
      
        '                                           AND   ixt.itctratasal' +
        'dodev <> 0)'
      '      AND ITC.ITCTRATASALDODEV          <> 0'
      '      AND NVL(HME.FLGESTORNADO, 0)      = 0'
      '      AND HME.IDCONTRATOEMPTMO          = CON.IDCONTRATOEMPTMO'
      '      AND CON.IDTIPOCONTREMPTMO         = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO              = ITC.IDITEMEMPTMO'
      '   ORDER BY'
      
        '      ITC.ITCORDEMEXTRATO DESC, HME.HMESEQCOBRANCA DESC, HME.IDH' +
        'ISTMOVEMPTMO DESC'
      '   )'
      'WHERE'
      '   ROWNUM = 1')
    ValidateWithMask = True
    Left = 596
    Top = 191
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
    object DateTimeField8: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object FloatField37: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object FloatField38: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object FloatField39: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object FloatField40: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
    object FloatField41: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
  end
  object qryMinDataVencto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MIN(HME.HMEDATAVENCTO) AS HMEDATAVENCTO'
      'FROM'
      '    HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV           NOT IN (0, 5, 8)'
      '   AND HME.FLGBAIXADO           = 0'
      '   AND HME.HMEDATAEFETIVA       IS NULL'
      '   AND HME.HMEVLREFETIVO        IS NULL'
      '   AND HME.HMEVLRPREVISTO      <> 0'
      '   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1)'
      ''
      '   AND NVL(HME.FLGESTORNADO, 0) = 0'
      '   AND NVL(HME.FLGSUSPENSAO, 0) = 0'
      '   AND NVL(HME.FLGQUITADO, 0)   = 0'
      '   AND NVL(HME.FLGABONADO, 0)   = 0'
      ''
      
        '   AND (:PFILTRODATA            IS NULL OR (:PFILTRODATA IS NOT ' +
        'NULL AND HME.HMEDATAVENCTO + 7 < :PHMEDATAVENCTO))'
      
        '   AND (:PFILTROMES             IS NULL OR (:PFILTROMES  IS NOT ' +
        'NULL AND (TRIM(TO_CHAR(HME.HMEANOCOBRANCA,'#39'0000'#39')) || trim(TO_CH' +
        'AR(HME.HMEMESCOBRANCA,'#39'00'#39')) < :PHMEANOCOBRANCA || :PHMEMESCOBRA' +
        'NCA)))'
      '   ')
    ValidateWithMask = True
    Left = 368
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTRODATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTRODATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAVENCTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTROMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTROMES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end>
    object DateTimeField10: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
  end
  object qryItensEmAberto_Auxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 256
    Top = 184
  end
end
