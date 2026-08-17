object dtmDividaEP: TdtmDividaEP
  OldCreateOrder = False
  Left = 1
  Top = 1
  Height = 570
  Width = 798
  object qryContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INS.IDINSCRICAOEMPTMO AS INSCRICAO,'
      '   PPP.INSCRICAONUMERO,'
      '   DECODE(CNT.FLGSITUACAO,'#39'A'#39','#39'Ativo'#39','
      '                          '#39'C'#39','#39'Cancelado'#39','
      '                          '#39'E'#39','#39'Encerrado'#39','
      '                          '#39'Q'#39','#39'Quitado'#39','
      '                          '#39'R'#39','#39'Refinanciado'#39','
      '                          '#39'S'#39','#39'Suspenso'#39','
      
        '                          '#39'K'#39','#39'Pendente de Quitação'#39') AS DESCSIT' +
        'CONTRATO,'
      ''
      '   SIT.IDSITPART,'
      '   SIT.DESCRICAO AS SITUACAO,'
      '   SIT.FLGINTERNO,'
      '   PLV.NOME      AS PLANOPREV,'
      '   JUR.NOME      AS PATRO,'
      '   ELP.MATRICULA,'
      '   TIT.NOME      AS TITULAR,'
      '   BEN.NOME      AS BENEFICIARIO,'
      ''
      '   TIP.TCEDESCRICAO, TIP.IDTIPOEMPTMO,'
      ''
      '   TEM.DESCTIPOEMPTMO,'
      '   INS.DATAINSC,'
      '   BAN.NOME AS BANCO,'
      '   CTB.CONTACORRENTE, AGB.NUMAGENCIA,'
      ''
      
        '   CNT.IDCONTRATOEMPTMO , CNT.IDCONTRQUITACAO, CNT.IDPESSOA     ' +
        '  , CNT.IDBENEF     ,'
      
        '   CNT.IDINSCRICAOEMPTMO, CNT.IDPLANOPREV    , CNT.IDPATRO      ' +
        '  , CNT.IDVERBA     ,'
      '   CNT.IDTIPOCONTREMPTMO, CNT.IDCBANCARIA    , CNT.NUMPARCELAS ,'
      
        '   CNT.CODFORMAPAG      , CNT.PORTFORMAPAG   , CNT.PORTFORMAREC ' +
        '  , CNT.DATACANC    ,'
      
        '   CNT.DATACREDITO      , CNT.DATASITUACAO   , CNT.DATAASSINATUR' +
        'A , CNT.DATAPRIMPARC,'
      
        '   CNT.VLRCONTRATO      , CNT.VLRPARCELA     , CNT.TXJUROS      ' +
        '  ,'
      '   CNT.FLGSITUACAO      , CNT.FLGFORMAREC    , CNT.FLGFORMAPAG,'
      ''
      '   MOE.MOESIGLA,'
      ''
      '   HME.DATAULTATUALIZA'
      ''
      'FROM'
      '   PESSOA          JUR,'
      '   PESSOA          TIT,'
      '   PESSOA          BEN,'
      '   PESSOA          BAN,'
      '   AGENCIABANCARIA AGB,'
      '   CONTABANCARIA   CTB,'
      '   MOEDA           MOE,'
      '   PARTPREVPLAN    PPP,'
      '   ELEGPATRO       ELP,'
      '   TIPOCONTREMPTMO TIP,'
      '   TIPOEMPTMO      TEM,'
      '   SITPART         SIT,'
      '   CONTRATOEMPTMO  CNT,'
      '   INSCRICAOEMPTMO INS,'
      '   PLANPREV        PLV,'
      ''
      '   ('
      '   SELECT'
      '      IDCONTRATOEMPTMO,'
      '      MIN(HMEDATAATUALIZA) AS DATAULTATUALIZA'
      '   FROM'
      '      HISTMOVEMPTMO'
      '   WHERE'
      '          ( IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )'
      '      AND ( (FLGESTORNADO = 0) OR (FLGESTORNADO IS NULL) )'
      '   GROUP BY'
      '      IDCONTRATOEMPTMO'
      '   ) HME'
      ''
      'WHERE'
      '       ( CNT.IDCONTRATOEMPTMO    = :PIDCONTRATOEMPTMO )'
      '   AND ( PPP.FLGDESATIVADO       = 0 )'
      '   AND ( CNT.IDPESSOA            = PPP.IDPESSOA )'
      '   AND ( SIT.IDSITPART           = PPP.IDSITPART )'
      '   AND ( PLV.IDPLANOPREV         = PPP.IDPLANOPREV )'
      '   AND ( CNT.IDPATRO             = JUR.IDPESSOA )'
      '   AND ( CNT.IDPESSOA            = ELP.IDPESSOA )'
      '   AND ( CNT.IDPATRO             = ELP.IDPESSJUR )'
      '   AND ( CNT.IDPESSOA            = TIT.IDPESSOA )'
      '   AND ( CNT.IDBENEF             = BEN.IDPESSOA )'
      '   AND ( CNT.IDTIPOCONTREMPTMO   = TIP.IDTIPOCONTREMPTMO )'
      '   AND ( TIP.IDTIPOEMPTMO        = TEM.IDTIPOEMPTMO )'
      '   AND ( CNT.IDINSCRICAOEMPTMO   = INS.IDINSCRICAOEMPTMO(+) )'
      '   AND ( INS.IDCBANCARIA         = CTB.IDCBANCARIA(+) )'
      '   AND ( CTB.IDAGENCIA           = AGB.IDPESSOA(+) )'
      '   AND ( AGB.IDBANCO             = BAN.IDPESSOA(+) )'
      '   AND ( CNT.IDCONTRATOEMPTMO    = HME.IDCONTRATOEMPTMO )'
      '   AND ( CNT.MOECODIGO           = MOE.MOECODIGO )')
    ValidateWithMask = True
    Left = 48
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDContratoEmptmo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryContratoINSCRICAO: TFloatField
      FieldName = 'INSCRICAO'
    end
    object qryContratoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryContratoDESCSITCONTRATO: TStringField
      FieldName = 'DESCSITCONTRATO'
    end
    object qryContratoIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qryContratoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
    object qryContratoFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryContratoPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object qryContratoPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryContratoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryContratoTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
    object qryContratoBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qryContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryContratoDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryContratoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 60
    end
    object qryContratoCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryContratoNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryContratoIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryContratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryContratoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryContratoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryContratoIDVERBA: TFloatField
      FieldName = 'IDVERBA'
    end
    object qryContratoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryContratoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryContratoCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryContratoPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryContratoPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryContratoNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryContratoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContratoDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object qryContratoDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryContratoDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryContratoDATACANC: TDateTimeField
      FieldName = 'DATACANC'
    end
    object qryContratoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryContratoVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryContratoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
      DisplayFormat = '#,##0.0000 %'
      EditFormat = '#,##0.0000 %'
    end
    object qryContratoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryContratoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryContratoFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratoIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryContratoDATAULTATUALIZA: TDateTimeField
      FieldName = 'DATAULTATUALIZA'
    end
    object qryContratoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
  end
  object qryContratosTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     IDCONTRATOEMPTMO, IDPATRO'
      'FROM    '
      '     VWCONTRATOEP'
      'WHERE '
      '     IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 48
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryContratosTitularIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDCONTRATOEMPTMO'
    end
    object qryContratosTitularIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDPATRO'
    end
  end
end
