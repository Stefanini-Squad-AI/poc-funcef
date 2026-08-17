object dtmQuitacao: TdtmQuitacao
  OldCreateOrder = False
  Left = 306
  Top = 107
  Height = 480
  Width = 696
  object qryHistMovVirtual: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39' AS ITEDE' +
        'SCRICAO,'
      '   '#39'Atualização Débito'#39' AS EVENTO,'
      '   '#39'0000/00'#39' AS ANOMES,'
      ''
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRA' +
        'NCA ,'
      
        '   HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTM' +
        'O   ,'
      
        '   HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO   , HME.HMESALDODEV' +
        '    ,'
      '   HME.HMETXJUROS       , HME.HMEPARCELA'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME'
      ''
      'WHERE'
      '   HME.IDCONTRATOEMPTMO = -1')
    UpdateObject = updHistMovVirtual
    ValidateWithMask = True
    Left = 56
    Top = 176
    object qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovVirtualHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovVirtualHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovVirtualHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryHistMovVirtualHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryHistMovVirtualHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
      DisplayFormat = '#,##0.0000 %'
    end
    object qryHistMovVirtualHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
      DisplayFormat = '#00'
      EditFormat = '#00'
    end
    object qryHistMovVirtualEVENTO: TStringField
      FieldName = 'EVENTO'
      FixedChar = True
      Size = 18
    end
    object qryHistMovVirtualANOMES: TStringField
      Alignment = taCenter
      FieldName = 'ANOMES'
      FixedChar = True
      Size = 7
    end
    object qryHistMovVirtualITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovVirtualIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
  end
  object updHistMovVirtual: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  ITEDESCRICAO = :ITEDESCRICAO,'
      '  EVENTO = :EVENTO,'
      '  ANOMES = :ANOMES,'
      '  HMEANOCOMPETENCIA = :HMEANOCOMPETENCIA,'
      '  HMEMESCOMPETENCIA = :HMEMESCOMPETENCIA,'
      '  HMESEQCOBRANCA = :HMESEQCOBRANCA,'
      '  HMETIPOMOV = :HMETIPOMOV,'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO,'
      '  IDITEMEMPTMO = :IDITEMEMPTMO,'
      '  HMEDATAPREVISTA = :HMEDATAPREVISTA,'
      '  HMEVLRPREVISTO = :HMEVLRPREVISTO,'
      '  HMESALDODEV = :HMESALDODEV,'
      '  HMETXJUROS = :HMETXJUROS,'
      '  HMEPARCELA = :HMEPARCELA'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    InsertSQL.Strings = (
      'insert into HISTMOVEMPTMO'
      
        '  (ITEDESCRICAO, EVENTO, ANOMES, HMEANOCOMPETENCIA, HMEMESCOMPET' +
        'ENCIA, '
      
        '   HMESEQCOBRANCA, HMETIPOMOV, IDCONTRATOEMPTMO, IDITEMEMPTMO, H' +
        'MEDATAPREVISTA, '
      '   HMEVLRPREVISTO, HMESALDODEV, HMETXJUROS, HMEPARCELA)'
      'values'
      
        '  (:ITEDESCRICAO, :EVENTO, :ANOMES, :HMEANOCOMPETENCIA, :HMEMESC' +
        'OMPETENCIA, '
      
        '   :HMESEQCOBRANCA, :HMETIPOMOV, :IDCONTRATOEMPTMO, :IDITEMEMPTM' +
        'O, :HMEDATAPREVISTA, '
      '   :HMEVLRPREVISTO, :HMESALDODEV, :HMETXJUROS, :HMEPARCELA)')
    DeleteSQL.Strings = (
      'delete from HISTMOVEMPTMO'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 56
    Top = 224
  end
  object qryHistMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IRC.ITEDESCRICAO,'
      
        '   TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39') || '#39'/'#39' || HME.HMEANOCOMP' +
        'ETENCIA AS ANOMES,'
      ''
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRA' +
        'NCA,'
      
        '   HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTM' +
        'O  ,'
      
        '   HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO   , HME.HMESALDODEV' +
        '   ,'
      '   HME.HMETXJUROS       , HME.HMEPARCELA       ,'
      ''
      '   DECODE(HME.HMETIPOMOV, 0, '#39'Concessão'#39','
      '                          1, '#39'Parcela '#39','
      '                          2, '#39'Amortização'#39','
      '                          3, '#39'Quitação'#39','
      '                          4, '#39'Atualização Débito'#39') AS EVENTO'
      ''
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   ITEMXTIPOCONTR IRT,'
      '   ITEMEMPTMO     IRC'
      ''
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO )'
      '   AND ( IRT.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      '   AND ( HME.FLGBAIXADO        = 0 )'
      
        '   AND ( (HME.FLGESTORNADO     = 0 ) OR (HME.FLGESTORNADO IS NUL' +
        'L ) )'
      '   AND ( (HME.HMECENTRALIZA    = 1) OR (HME.HMEDESTACADO = 1) )'
      '   AND ( HME.IDITEMEMPTMO      = IRT.IDITEMEMPTMO )'
      '   AND ( IRT.IDITEMEMPTMO      = IRC.IDITEMEMPTMO )'
      ''
      'ORDER BY'
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA'
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryHistMovHMEANOCOMPETENCIA: TFloatField
      DisplayLabel = 'Ano'
      DisplayWidth = 7
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovHMEMESCOMPETENCIA: TFloatField
      DisplayLabel = 'Mês'
      DisplayWidth = 5
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovHMESEQCOBRANCA: TFloatField
      DisplayLabel = 'Seq.'
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovHMETIPOMOV: TFloatField
      DisplayWidth = 7
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovHMEDATAPREVISTA: TDateTimeField
      DisplayLabel = 'Previsão'
      DisplayWidth = 12
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovHMEVLRPREVISTO: TFloatField
      DisplayLabel = 'Valor Previsto'
      DisplayWidth = 7
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryHistMovHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryHistMovHMETXJUROS: TFloatField
      DisplayLabel = 'Tx Juros'
      FieldName = 'HMETXJUROS'
      DisplayFormat = '#,##0.0000 %'
      EditFormat = '#,##0.0000 %'
    end
    object qryHistMovHMEPARCELA: TFloatField
      DisplayLabel = 'Nº Parc.'
      FieldName = 'HMEPARCELA'
      DisplayFormat = '#00'
      EditFormat = '#00'
    end
    object qryHistMovEVENTO: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 18
      FieldName = 'EVENTO'
      Size = 18
    end
    object qryHistMovANOMES: TStringField
      Alignment = taCenter
      FieldName = 'ANOMES'
      Size = 44
    end
    object qryHistMovITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryHistMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
  end
  object qry: TwwQuery
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
      
        '   CNT.IDTIPOCONTREMPTMO, CNT.IDCBANCARIA    , CNT.IDMOTIVOCANC ' +
        '  , CNT.NUMPARCELAS ,'
      
        '   CNT.CODFORMAPAG      , CNT.PORTFORMAPAG   , CNT.PORTFORMAREC ' +
        '  , CNT.DATACANC    ,'
      
        '   CNT.DATACREDITO      , CNT.DATASITUACAO   , CNT.DATAASSINATUR' +
        'A , CNT.DATAPRIMPARC,'
      
        '   CNT.VLRCONTRATO      , CNT.VLRPARCELA     , CNT.TXJUROS      ' +
        '  ,'
      '   CNT.FLGSITUACAO      , CNT.FLGFORMAREC    , CNT.FLGFORMAPAG,'
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
      '   AND ( CNT.IDCONTRATOEMPTMO    = HME.IDCONTRATOEMPTMO )')
    ValidateWithMask = True
    Left = 32
    Top = 16
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
    object qryINSCRICAO: TFloatField
      FieldName = 'INSCRICAO'
    end
    object qryINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryDESCSITCONTRATO: TStringField
      FieldName = 'DESCSITCONTRATO'
    end
    object qryIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qrySITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
    object qryFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object qryPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
    object qryBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qryDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryBANCO: TStringField
      FieldName = 'BANCO'
      Size = 60
    end
    object qryCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryIDVERBA: TFloatField
      FieldName = 'IDVERBA'
    end
    object qryIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryIDMOTIVOCANC: TFloatField
      FieldName = 'IDMOTIVOCANC'
    end
    object qryCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object qryDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryDATACANC: TDateTimeField
      FieldName = 'DATACANC'
    end
    object qryVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryTXJUROS: TFloatField
      FieldName = 'TXJUROS'
      DisplayFormat = '#,##0.0000 %'
      EditFormat = '#,##0.0000 %'
    end
    object qryFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryDATAULTATUALIZA: TDateTimeField
      FieldName = 'DATAULTATUALIZA'
    end
  end
  object qryAtualizacoesPosteriores: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   HMEDATAATUALIZA'
      'FROM'
      '   HISTMOVEMPTMO H,'
      '   CONTRATOEMPTMO C'
      'WHERE'
      '       ( H.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )'
      '   AND ( H.HMEDATAATUALIZA  >:PHMEDATAATUALIZA )'
      '   AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO )')
    ValidateWithMask = True
    Left = 56
    Top = 272
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
    object qryAtualizacoesPosterioresHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAATUALIZA'
    end
  end
  object qryContratos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     IDCONTRATOEMPTMO'
      'FROM    '
      '     CONTRATOEMPTMO'
      'WHERE '
      '     IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 192
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryContratosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDCONTRATOEMPTMO'
    end
  end
  object qrySaldoDev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPESSOA,'
      '   HMEDATAATUALIZA,'
      '   HMESALDODEV, HMETXJUROS,'
      '   HMEPARCELA, HMENUMPARCELAS'
      'FROM'
      '   HISTMOVEMPTMO H, CONTRATOEMPTMO C,'
      '   ('
      '   SELECT'
      '      MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO HME,'
      '      CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC,'
      '      TIPOCONTREMPTMO TC'
      '   WHERE'
      '          ( C.IDPESSOA             =:PIDPESSOA )'
      '      AND ( HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )'
      '      AND ( ITC.ITCTRATASALDODEV  <> 0 )'
      '      AND ( HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )'
      '      AND ( C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO )'
      '      AND ( TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO )'
      '      AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '      AND ( HME.HMEDATAATUALIZA    =   ('
      '                                       SELECT'
      '                                          MAX(HMEDATAATUALIZA)'
      '                                       FROM'
      '                                          HISTMOVEMPTMO HME,'
      '                                          CONTRATOEMPTMO C,'
      '                                          ITEMXTIPOCONTR ITC,'
      '                                          TIPOCONTREMPTMO TC'
      '                                       WHERE'
      
        '                                              ( C.IDPESSOA      ' +
        '       =:PIDPESSOA )'
      
        '                                          AND ( HME.HMEDATAATUAL' +
        'IZA   <=TO_DATE(:PHMEDATAATUALIZA,'#39'DD/MM/YYYY'#39') )'
      
        '                                          AND ( ITC.ITCTRATASALD' +
        'ODEV  <> 0 )'
      
        '                                          AND ( HME.IDCONTRATOEM' +
        'PTMO   = C.IDCONTRATOEMPTMO )'
      
        '                                          AND ( C.IDTIPOCONTREMP' +
        'TMO    = TC.IDTIPOCONTREMPTMO )'
      
        '                                          AND ( TC.IDTIPOCONTREM' +
        'PTMO   = ITC.IDTIPOCONTREMPTMO )'
      
        '                                          AND ( HME.IDITEMEMPTMO' +
        '       = ITC.IDITEMEMPTMO )'
      '                                       )'
      '           )'
      '   ) M'
      'WHERE'
      '   ( H.IDHISTMOVEMPTMO = M.IDHISTMOVEMPTMO )'
      'AND C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 200
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
    object qrySaldoDevIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySaldoDevHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qrySaldoDevHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qrySaldoDevHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qrySaldoDevHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qrySaldoDevHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
  end
  object qryParcelasEmAberto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(H.HMEVLRPREVISTO) AS VALOR'
      'FROM HISTMOVEMPTMO H, CONTRATOEMPTMO C'
      'WHERE FLGBAIXADO = 0'
      'AND   IDPESSOA = :PIDPESSOA'
      'AND   H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO'
      'AND   HMETIPOMOV <> 0'
      '')
    ValidateWithMask = True
    Left = 200
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryParcelasEmAbertoVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEVLRPREVISTO'
    end
  end
end
