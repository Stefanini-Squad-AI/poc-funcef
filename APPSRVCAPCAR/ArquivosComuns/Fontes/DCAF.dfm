object dtmCAF: TdtmCAF
  OldCreateOrder = False
  Left = 61
  Top = 95
  Height = 541
  Width = 717
  object qryInsImovelxbem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO IMOVELXBEM'
      '   (IDIMOVEL, IDBEM, IDPESSOA, IXBGRUPO, IXBPERCENT)'
      'VALUES'
      '   (:PIDIMOVEL, :PIDBEM, :PIDPESSOA, :PIXBGRUPO, :PIXBPERCENT)'
      ' ')
    ValidateWithMask = True
    Left = 49
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
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
        DataType = ftString
        Name = 'PIXBGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIXBPERCENT'
        ParamType = ptUnknown
      end>
  end
  object qryPlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(*)'
      'FROM BEM'
      'WHERE PLACA = :PPLACA')
    ValidateWithMask = True
    Left = 160
    Top = 22
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLACA'
        ParamType = ptUnknown
      end>
    object qryPlacaCOUNT: TFloatField
      FieldName = 'COUNT(*)'
    end
  end
  object qryInsConjunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CONJUNTO'
      
        '   (IDCONJUNTO, IDPESSOA, IDLOCALIZACAO, IDRESPONSAVEL, DESCCONJ' +
        'UNTO)'
      'VALUES'
      
        '   (:PIDCONJUNTO, :PIDPESSOA, :PIDLOCALIZACAO, :PIDRESPONSAVEL, ' +
        ':PDESCCONJUNTO)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 234
    Top = 27
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCALIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PDESCCONJUNTO'
        ParamType = ptUnknown
      end>
  end
  object qryInsRateioDepreciacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO RATEIODEPRECIACAO'
      
        '   (IDCONJUNTO, IDEMPRESA, CODCENTROCUSTO, PARTICIPACAO, DTAINIC' +
        'IO)'
      'VALUES'
      
        '   (:PIDCONJUNTO, :PIDEMPRESA, :PCODCENTROCUSTO, :PPARTICIPACAO,' +
        ' :PDTAINICIO)'
      ' ')
    ValidateWithMask = True
    Left = 350
    Top = 25
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
      end
      item
        DataType = ftString
        Name = 'PCODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPARTICIPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTAINICIO'
        ParamType = ptUnknown
      end>
  end
  object qryInsertLancImovelxbem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO LANCIMOVELXBEM'
      '   ('
      '   IDLANCIMOVEL,'
      '   IDBEM,'
      '   IDPESSOA,'
      '   VLRMOV,'
      '   FLGTIPOMOV,'
      '   FLGNUMMOV,'
      '   IDMOVIMENTACAO'
      '   )'
      ''
      'VALUES'
      '   ('
      '   :PIDLANCIMOVEL,'
      '   :PIDBEM,'
      '   :PIDPESSOA,'
      '   :PVLRMOV,'
      '   :PFLGTIPOMOV,'
      '   :PFLGNUMMOV,'
      '   :PIDMOVIMENTACAO'
      '   )'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLANCIMOVEL'
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
        DataType = ftFloat
        Name = 'PVLRMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGNUMMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
  end
  object qryImovelXBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IM.IMONOME || '#39' - '#39' || I.IMONOME AS IMOVEL_EXTENSO, I.IMOCODI' +
        'GO,'
      
        '   IB.IDIMOVEL, IB.IDBEM, IB.IXBPERCENT, IB.IXBGRUPO, B.IDGRUPO,' +
        ' I.CODTIPIMOVEL,'
      
        '   B.IDCONJUNTO, C.IDLOCALIZACAO, C.IDRESPONSAVEL, B.DESBEM, G.N' +
        'OME AS NOME_GRUPO,'
      '   0 AS VLR_BEM, 1 AS SEL_BEM'
      'FROM'
      
        '   IMOVEL I, IMOVEL IM, IMOVELXBEM IB, BEM B, CONJUNTO C, GRUPO ' +
        'G'
      'WHERE'
      '   IB.IDBEM = B.IDBEM'
      '   AND (I.IDIMOVEL = IB.IDIMOVEL)'
      '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      '   AND ( B.IDGRUPO = G.IDGRUPO(+))'
      '   AND ( B.IDCONJUNTO = C.IDCONJUNTO(+) )'
      
        '   AND ( (:PBAIXATOTAL IS NULL) OR (B.BAIXATOTAL = :PBAIXATOTAL)' +
        ' )'
      '   AND ( (:PGRUPO IS NULL) OR (IB.IXBGRUPO = :PGRUPO) )'
      '   AND ( (:PIDIMOVEL IS NULL) OR (IB.IDIMOVEL = :PIDIMOVEL) )'
      
        '   AND ( (:PIDIMOVELMESTRE IS NULL) OR ((I.IDIMOVELMESTRE = :PID' +
        'IMOVELMESTRE) AND (I.FLGATIVO = 1)) )'
      '   AND ( (:PIDBEM    IS NULL) OR (IB.IDBEM = :PIDBEM) )'
      
        '   AND ( (:PDATAINCLUSAO IS NULL) OR (B.DTAINCLUSAO = :PDATAINCL' +
        'USAO) )'
      ''
      'ORDER BY IMOVEL_EXTENSO, IDIMOVEL, DESBEM'
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
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updImovelxBem
    ControlType.Strings = (
      'SEL_BEM;CheckBox;1;0')
    ValidateWithMask = True
    Left = 49
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'PBAIXATOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PBAIXATOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINCLUSAO'
        ParamType = ptUnknown
      end>
    object qryImovelXBemSEL_BEM: TFloatField
      DisplayWidth = 5
      FieldName = 'SEL_BEM'
    end
    object qryImovelXBemDESBEM: TStringField
      DisplayLabel = 'Bem'
      DisplayWidth = 200
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryImovelXBemNOME_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 60
      FieldName = 'NOME_GRUPO'
      Size = 60
    end
    object qryImovelXBemVLR_BEM: TFloatField
      DisplayLabel = '   '
      DisplayWidth = 3
      FieldName = 'VLR_BEM'
      Visible = False
      DisplayFormat = '###,###,##0.00'
    end
    object qryImovelXBemIXBGRUPO: TStringField
      DisplayWidth = 9
      FieldName = 'IXBGRUPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryImovelXBemIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryImovelXBemIDBEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBEM'
      Visible = False
    end
    object qryImovelXBemIMOVEL_EXTENSO: TStringField
      DisplayWidth = 123
      FieldName = 'IMOVEL_EXTENSO'
      Visible = False
      Size = 123
    end
    object qryImovelXBemCODTIPIMOVEL: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPIMOVEL'
      Visible = False
      Size = 5
    end
    object qryImovelXBemIMOCODIGO: TStringField
      DisplayWidth = 15
      FieldName = 'IMOCODIGO'
      Visible = False
      Size = 15
    end
    object qryImovelXBemIXBPERCENT: TFloatField
      DisplayWidth = 10
      FieldName = 'IXBPERCENT'
      Visible = False
      DisplayFormat = '##0.00%'
    end
    object qryImovelXBemIDGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPO'
      Visible = False
    end
    object qryImovelXBemIDCONJUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONJUNTO'
      Visible = False
    end
    object qryImovelXBemIDLOCALIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOCALIZACAO'
      Visible = False
    end
    object qryImovelXBemIDRESPONSAVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRESPONSAVEL'
      Visible = False
    end
  end
  object updImovelxBem: TUpdateSQL
    Left = 49
    Top = 134
  end
  object qryDelLancImovelxBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LANCIMOVELXBEM'
      'WHERE (IDPESSOA     = :PIDPESSOA)'
      '  AND (IDLANCIMOVEL = :PIDLANCIMOVEL)'
      '  AND ( (:PIDBEM IS NULL) OR (IDBEM = :PIDBEM) ) '
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 47
    Top = 44
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLANCIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
  end
  object qryDelImovelxBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM IMOVELXBEM'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '  AND (IDIMOVEL = :PIDIMOVEL)'
      '  AND ( (:PIDBEM IS NULL) OR (IDBEM = :PIDBEM) )'
      ''
      ' ')
    ValidateWithMask = True
    Left = 49
    Top = 147
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
  end
  object qryDelConjunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM CONJUNTO'
      'WHERE IDPESSOA   = :PIDPESSOA'
      '  AND IDCONJUNTO = :PIDCONJUNTO'
      '')
    ValidateWithMask = True
    Left = 234
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end>
  end
  object qryDelRateioDepreciacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM RATEIODEPRECIACAO'
      'WHERE IDEMPRESA  = :PIDEMPRESA'
      '  AND IDCONJUNTO = :PIDCONJUNTO'
      '')
    ValidateWithMask = True
    Left = 350
    Top = 39
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end>
  end
  object qryUpdImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   IMOVEL'
      'SET'
      '   CODTIPIMOVEL   = :PCODTIPIMOVEL,'
      '   IMODATACOMPRA  = :PIMODATACOMPRA,'
      '   IMOVLRCOMPRA   = :PIMOVLRCOMPRA,'
      '   IMOMOEDACOMPRA = :PIMOMOEDACOMPRA,'
      '   FLGSTATUS      = :PFLGSTATUS,  -- '#39'N'#39' IMÓVEL EM CARTEIRA'
      '   FLGATIVO       = :PFLGATIVO    -- 1'
      'WHERE'
      '   IDIMOVEL = :PIDIMOVEL'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 353
    Top = 106
    ParamData = <
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PIMODATACOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOVLRCOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIMOMOEDACOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryInsDesmembraImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DESMEMBRAIMOVEL'
      '('
      'IDIMOVELINI, IDIMOVELFIM,'
      'IDEVENTOIMOVELINI, IDEVENTOIMOVELFIM,'
      'FLGTIPODESMEMBRA, DMRDATA, DMRPERCENT'
      ')'
      'VALUES'
      '('
      ':PIDIMOVELINI, :PIDIMOVELFIM,'
      ':PIDEVENTOIMOVELINI, :PIDEVENTOIMOVELFIM,'
      ':PFLGTIPODESMEMBRA, :PDMRDATA, :PDMRPERCENT'
      ')'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 108
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDIMOVELINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDIMOVELFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDEVENTOIMOVELINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDEVENTOIMOVELFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGTIPODESMEMBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDMRDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDMRPERCENT'
        ParamType = ptUnknown
      end>
  end
  object qryRateioDepreciacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONJUNTO,'
      '       CODCENTROCUSTO,'
      '       PARTICIPACAO,'
      '       DTAFIM'
      'FROM   RATEIODEPRECIACAO'
      'WHERE  (:PIDCONJUNTO IS NULL) OR (IDCONJUNTO = :PIDCONJUNTO)'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 350
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end>
    object qryRateioDepreciacaoIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = 'BASEDADOS.RATEIODEPRECIACAO.IDCONJUNTO'
    end
    object qryRateioDepreciacaoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.RATEIODEPRECIACAO.CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryRateioDepreciacaoPARTICIPACAO: TFloatField
      FieldName = 'PARTICIPACAO'
      Origin = 'BASEDADOS.RATEIODEPRECIACAO.PARTICIPACAO'
    end
    object qryRateioDepreciacaoDTAFIM: TDateTimeField
      FieldName = 'DTAFIM'
      Origin = 'BASEDADOS.RATEIODEPRECIACAO.DTAFIM'
    end
  end
  object qryInsImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO IMOVEL I'
      '   ('
      '   I.IDIMOVEL, I.IDIMOVELMESTRE, I.IDPESSOA,'
      '   I.IMONOME, I.IMOCODIGO, I.IMOMATRICULA,'
      ''
      '   I.IDPAIS,'
      '   I.IDMARCA, I.IDADMINIMOVEL, I.FLGTIPOIMOVEL,'
      ''
      '   I.IMOLOGRADOURO, I.IMONUMERO,'
      '   I.IMOCOMPLEMENTO, I.IMOBAIRRO, I.IDCIDADES,'
      '   I.IMONOMEENDERECO, I.IMOCEP, I.CODSUBCONTA,'
      '   I.CODTIPIMOVEL, I.IMOPERCENTRATEIO,'
      ''
      '   I.IMODESCRICAO, I.IMOOBSERVACAO,'
      '   I.FLGSTATUS, I.FLGATIVO, I.IDCARTORIO,'
      '   I.FLGSTATUSOCUPACAO, I.QTDETOTALCOTAS,'
      ''
      
        '   I.IMOAREA, I.IMOAREAGERENCIAL, I.IMOAREACOMUM, I.IMOAREATOTAL' +
        ','
      '   I.IMOFRACAOIDEAL, I.IMOVAGAS,'
      '   I.IMODATACONSTRUCAO, I.IMODATAHABITESE,'
      ''
      '   I.IMOVLRCOMPRA, I.IMOMOEDACOMPRA, I.IMODATACOMPRA,'
      '   I.IMOVLRREAVAL, I.IMOMOEDAREAVAL, I.IMODATAREAVAL,'
      '   I.IMOVLRMERCADO, I.IMOMOEDAMERCADO, I.IMODATAMERCADO'
      '   )'
      '   VALUES'
      '   ('
      '   :PIDIMOVEL, :PIDIMOVELMESTRE, :PIDPESSOA,'
      '   :PIMONOME, :PIMOCODIGO, :PIMOMATRICULA,'
      ''
      '   :PIDPAIS,'
      '   :PIDMARCA, :PIDADMINIMOVEL, :PFLGTIPOIMOVEL,'
      ''
      '   :PIMOLOGRADOURO, :PIMONUMERO,'
      '   :PIMOCOMPLEMENTO, :PIMOBAIRRO, :PIDCIDADES,'
      '   :PIMONOMEENDERECO, :PIMOCEP, :PCODSUBCONTA,'
      '   :PCODTIPIMOVEL, :PIMOPERCENTRATEIO,'
      ''
      '   :PIMODESCRICAO, :PIMOOBSERVACAO,'
      '   :PFLGSTATUS, :PFLGATIVO, :PIDCARTORIO,'
      '   :PFLGSTATUSOCUPACAO, :PQTDETOTALCOTAS,'
      ''
      
        '   :PIMOAREA, :PIMOAREAGERENCIAL, :PIMOAREACOMUM, :PIMOAREATOTAL' +
        ','
      '   :PIMOFRACAOIDEAL, :PIMOVAGAS,'
      '   :PIMODATACONSTRUCAO, :PIMODATAHABITESE,'
      ''
      '   :PIMOVLRCOMPRA, :PIMOMOEDACOMPRA, :PIMODATACOMPRA,'
      '   :PIMOVLRREAVAL, :PIMOMOEDAREAVAL, :PIMODATAREAVAL,'
      '   :PIMOVLRMERCADO, :PIMOMOEDAMERCADO, :PIMODATAMERCADO'
      '   )'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMONOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMOCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMOMATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPAIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMARCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGTIPOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMOLOGRADOURO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMONUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMOCOMPLEMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMOBAIRRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCIDADES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMONOMEENDERECO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMOCEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIMOPERCENTRATEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMODESCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMOOBSERVACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCARTORIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUSOCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PQTDETOTALCOTAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOAREA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOAREAGERENCIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOAREACOMUM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOAREATOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOFRACAOIDEAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIMOVAGAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PIMODATACONSTRUCAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PIMODATAHABITESE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOVLRCOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIMOMOEDACOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PIMODATACOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOVLRREAVAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIMOMOEDAREAVAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PIMODATAREAVAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOVLRMERCADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIMOMOEDAMERCADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PIMODATAMERCADO'
        ParamType = ptUnknown
      end>
  end
  object qryInsInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO INVESTIMENTO'
      ' ( IDINVESTIMENTO,'
      '   DESCINVESTIMENTO,'
      '   IDTIPOINVEST )'
      'VALUES'
      ' ( :PIDINVESTIMENTO,'
      '   :PDESCINVESTIMENTO,'
      '   :PIDTIPOINVEST )'
      '')
    ValidateWithMask = True
    Left = 192
    Top = 230
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PDESCINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object qryDelImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM IMOVEL'
      'WHERE IDPESSOA = :PIDPESSOA'
      '  AND IDIMOVEL = :PIDIMOVEL'
      ''
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 221
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryDelInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM INVESTIMENTO'
      'WHERE IDINVESTIMENTO = :PIDINVESTIMENTO'
      '')
    ValidateWithMask = True
    Left = 192
    Top = 245
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDINVESTIMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryDelDesmembraImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DESMEMBRAIMOVEL'
      'WHERE IDIMOVELFIM = :PIDIMOVELFIM'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 122
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVELFIM'
        ParamType = ptUnknown
      end>
  end
  object qryLookAcrescimoValor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDACRESCIMO, IDMOVIMENTACAO'
      'FROM'
      '   ACRESCIMOVALOR'
      'WHERE'
      '   ( (:PIDACRESCIMO IS NULL) OR ( IDACRESCIMO = :PIDACRESCIMO) )'
      
        '   AND ( (:PIDMOVIMENTACAO IS NULL) OR (IDMOVIMENTACAO = :PIDMOV' +
        'IMENTACAO) )'
      ' ')
    ValidateWithMask = True
    Left = 353
    Top = 212
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDACRESCIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDACRESCIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end>
    object qryLookAcrescimoValorIDACRESCIMO: TFloatField
      FieldName = 'IDACRESCIMO'
      Origin = 'BASEDADOS.ACRESCIMOVALOR.IDACRESCIMO'
    end
    object qryLookAcrescimoValorIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
      Origin = 'BASEDADOS.ACRESCIMOVALOR.IDMOVIMENTACAO'
    end
  end
  object qryUpdObraLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '      CAFOBRALANC'
      'SET'
      '      IDLANCIMOVEL = :PIDLANCIMOVEL'
      'WHERE'
      '      (IDPESSOA   = :PIDPESSOA)'
      '  AND (IDOBRALANC = :PIDOBRALANC)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 353
    Top = 257
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLANCIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDOBRALANC'
        ParamType = ptUnknown
      end>
  end
  object qryUpdStatusImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   IMOVEL'
      'SET'
      '   FLGSTATUS = :PFLGSTATUS,'
      '   FLGATIVO  = :PFLGATIVO     -- 1 Ativo 0 Inativo'
      'WHERE'
      '   IDIMOVEL = :PIDIMOVEL'
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 353
    Top = 154
    ParamData = <
      item
        DataType = ftString
        Name = 'PFLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryInsTransferencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO TRANSFBEMIMOVEL'
      
        '   (IDMOVIMENTACAO, IDIMOVELORIG, IDIMOVELDEST, FLGOPERACAO, COD' +
        'TIPIMOVELANT)'
      'VALUES'
      
        '   (:PIDMOVIMENTACAO, :PIDIMOVELORIG, :PIDIMOVELDEST, :PFLGOPERA' +
        'CAO, :PCODTIPIMOVELANT)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 73
    Top = 274
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELDEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVELANT'
        ParamType = ptUnknown
      end>
  end
  object qryDelTransferencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM TRANSFBEMIMOVEL'
      
        'WHERE ( (:PIDIMOVELORIG IS NULL)   OR (IDIMOVELORIG = :PIDIMOVEL' +
        'ORIG) )'
      
        '  AND ( (:PIDMOVIMENTACAO IS NULL) OR (IDMOVIMENTACAO = :PIDMOVI' +
        'MENTACAO) )'
      
        '  AND ( (:PFLGOPERACAO IS NULL)    OR (FLGOPERACAO = :PFLGOPERAC' +
        'AO) )')
    ValidateWithMask = True
    Left = 72
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVELORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object qryInsReavalia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO REAVALIAXREAVALIA'
      ' ( IDPESSOA,'
      '   IDIMOVEL,'
      '   IDBEM,'
      '   IDREAVALIACAO,'
      '   IDAVALIADOR,'
      '   DATAREAVALIACAO,'
      '   VLRREAVALIA,'
      '   VIDAUTIL )'
      'VALUES'
      ' ( :PIDPESSOA,'
      '   :PIDIMOVEL,'
      '   :PIDBEM,'
      '   :PIDREAVALIACAO,'
      '   :PIDAVALIADOR,'
      '   :PDATAREAVALIACAO,'
      '   :PVLRREAVALIA,'
      '   :PVIDAUTIL )'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 301
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDAVALIADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRREAVALIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PVIDAUTIL'
        ParamType = ptUnknown
      end>
  end
  object qryDelReavalia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM REAVALIAXREAVALIA'
      'WHERE ( (:PIDIMOVEL IS NULL) OR (IDIMOVEL = :PIDIMOVEL) )'
      '  AND ( (:PIDBEM    IS NULL) OR (IDBEM    = :PIDBEM) )'
      
        '  AND ( (:PIDREAVALIACAO IS NULL)   OR (IDREAVALIACAO   = :PIDRE' +
        'AVALIACAO) )'
      
        '  AND ( (:PIDAVALIADOR   IS NULL)   OR (IDAVALIADOR     = :PIDAV' +
        'ALIADOR) )'
      
        '  AND ( (:PDATAREAVALIACAO IS NULL) OR (DATAREAVALIACAO = :PDATA' +
        'REAVALIACAO) )'
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 315
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDAVALIADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDAVALIADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAREAVALIACAO'
        ParamType = ptUnknown
      end>
  end
  object qryReavalia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   R.IDIMOVEL,'
      '   R.IDBEM,'
      '   R.IDREAVALIACAO,'
      '   R.IDAVALIADOR,'
      '   R.DATAREAVALIACAO,'
      '   IM.IMONOME || '#39' - '#39' || I.IMONOME AS IMOVEL_ESTENSO'
      'FROM'
      '   REAVALIAXREAVALIA R,'
      '   IMOVEL I,'
      '   IMOVEL IM'
      'WHERE'
      '       ( (:PIDIMOVEL IS NULL) OR (R.IDIMOVEL = :PIDIMOVEL) )'
      '   AND ( (:PIDBEM    IS NULL) OR (R.IDBEM    = :PIDBEM) )'
      
        '   AND ( (:PIDAVALIADOR     IS NULL) OR (R.IDAVALIADOR     = :PI' +
        'DAVALIADOR) )'
      
        '   AND ( (:PDATAREAVALIACAO IS NULL) OR (R.DATAREAVALIACAO = :PD' +
        'ATAREAVALIACAO) )'
      '   AND ( R.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      ''
      '')
    ValidateWithMask = True
    Left = 193
    Top = 329
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDAVALIADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDAVALIADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAREAVALIACAO'
        ParamType = ptUnknown
      end>
    object qryReavaliaIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.REAVALIAXREAVALIA.IDIMOVEL'
    end
    object qryReavaliaIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BASEDADOS.REAVALIAXREAVALIA.IDBEM'
    end
    object qryReavaliaIDREAVALIACAO: TFloatField
      FieldName = 'IDREAVALIACAO'
      Origin = 'BASEDADOS.REAVALIAXREAVALIA.IDREAVALIACAO'
    end
    object qryReavaliaDATAREAVALIACAO: TDateTimeField
      FieldName = 'DATAREAVALIACAO'
      Origin = 'BASEDADOS.REAVALIAXREAVALIA.DATAREAVALIACAO'
    end
    object qryReavaliaIMOVEL_ESTENSO: TStringField
      FieldName = 'IMOVEL_ESTENSO'
      Origin = 'BASEDADOS.IMOVEL.IMONOME'
      Size = 123
    end
    object qryReavaliaIDAVALIADOR: TFloatField
      FieldName = 'IDAVALIADOR'
      Origin = 'BASEDADOS.REAVALIAXREAVALIA.IDAVALIADOR'
    end
  end
  object qryTransferencia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.IDMOVIMENTACAO,'
      '       T.IDIMOVELORIG,'
      '       T.IDIMOVELDEST,'
      '       T.CODTIPIMOVELANT,'
      '       H.IDBEM,'
      '       H.DATAMOVIMENTACAO,'
      '       H.IDGRUPANT,'
      '       H.IDCONJANT,'
      '       H.IDLOCALANT'
      '        '
      '  FROM TRANSFBEMIMOVEL T,'
      '       HISTORICOMOVIMENTACAO H'
      ''
      
        ' WHERE ( (:PIDIMOVELORIG IS NULL) OR (T.IDIMOVELORIG = :PIDIMOVE' +
        'LORIG) )'
      
        '   AND ( (:PIDIMOVELDEST IS NULL) OR (T.IDIMOVELDEST = :PIDIMOVE' +
        'LDEST) )'
      
        '   AND ( (:PDATAMOVIMENTACAO IS NULL) OR (H.DATAMOVIMENTACAO = :' +
        'PDATAMOVIMENTACAO) )   '
      '   AND (T.IDMOVIMENTACAO = H.IDMOVIMENTACAO)   '
      ''
      ' ')
    ValidateWithMask = True
    Left = 73
    Top = 302
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVELORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELDEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELDEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVIMENTACAO'
        ParamType = ptUnknown
      end>
    object qryTransferenciaIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
    end
    object qryTransferenciaIDIMOVELORIG: TFloatField
      FieldName = 'IDIMOVELORIG'
    end
    object qryTransferenciaIDIMOVELDEST: TFloatField
      FieldName = 'IDIMOVELDEST'
    end
    object qryTransferenciaIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryTransferenciaDATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
    end
    object qryTransferenciaIDGRUPANT: TFloatField
      FieldName = 'IDGRUPANT'
    end
    object qryTransferenciaIDCONJANT: TFloatField
      FieldName = 'IDCONJANT'
    end
    object qryTransferenciaIDLOCALANT: TFloatField
      FieldName = 'IDLOCALANT'
    end
    object qryTransferenciaCODTIPIMOVELANT: TStringField
      FieldName = 'CODTIPIMOVELANT'
      Size = 5
    end
  end
  object qryLookDesmembramento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   D.DMRDATA, D.IDIMOVELINI, D.IDIMOVELFIM, D.DMRPERCENT,'
      '   IM.IMONOME||'#39' - '#39'||I.IMONOME AS NOME_IMOVEL'
      'FROM'
      '   DESMEMBRAIMOVEL D, IMOVEL I, IMOVEL IM'
      'WHERE'
      '   (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      '   AND (I.IDIMOVEL = D.IDIMOVELINI)'
      
        '   AND ( (:PFLGTIPODESMEMBRA IS NULL) OR ( FLGTIPODESMEMBRA = :P' +
        'FLGTIPODESMEMBRA) )'
      
        '   AND ( (:PIDIMOVELFIM IS NULL) OR (IDIMOVELFIM = :PIDIMOVELFIM' +
        ') )'
      
        '   AND ( (:PIDIMOVELINI IS NULL) OR (IDIMOVELINI = :PIDIMOVELINI' +
        ') )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 193
    Top = 137
    ParamData = <
      item
        DataType = ftString
        Name = 'PFLGTIPODESMEMBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPODESMEMBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELINI'
        ParamType = ptUnknown
      end>
    object qryLookDesmembramentoDMRDATA: TDateTimeField
      FieldName = 'DMRDATA'
    end
    object qryLookDesmembramentoIDIMOVELINI: TFloatField
      FieldName = 'IDIMOVELINI'
    end
    object qryLookDesmembramentoIDIMOVELFIM: TFloatField
      FieldName = 'IDIMOVELFIM'
    end
    object qryLookDesmembramentoDMRPERCENT: TFloatField
      FieldName = 'DMRPERCENT'
    end
    object qryLookDesmembramentoNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Origin = 'BASEDADOS.IMOVEL.IMONOME'
      Size = 123
    end
  end
  object updDesmembramentos: TUpdateSQL
    Left = 193
    Top = 167
  end
  object qryDesmembramentos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '-- ESTA QUERY É VIRTUAL COM TODA A VIDA DO IMÓVEL'
      'SELECT'
      
        '   D.DMRDATA, D.IDIMOVELINI, D.IDIMOVELFIM, D.DMRPERCENT, 0 AS P' +
        'ERC_ACUM,'
      
        '   '#39'                                                            ' +
        #39' AS NOME_IMOVEL'
      'FROM'
      '   DESMEMBRAIMOVEL D'
      'WHERE'
      '   1=2'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updDesmembramentos
    ValidateWithMask = True
    Left = 193
    Top = 153
    object qryDesmembramentosDMRDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 18
      FieldName = 'DMRDATA'
    end
    object qryDesmembramentosNOME_IMOVEL: TStringField
      DisplayLabel = 'Nome Imóvel'
      DisplayWidth = 60
      FieldName = 'NOME_IMOVEL'
      FixedChar = True
      Size = 60
    end
    object qryDesmembramentosDMRPERCENT: TFloatField
      DisplayLabel = '% Desmembrado'
      DisplayWidth = 10
      FieldName = 'DMRPERCENT'
    end
    object qryDesmembramentosPERC_ACUM: TFloatField
      DisplayLabel = 'Fator s/ Imovel Atual'
      DisplayWidth = 10
      FieldName = 'PERC_ACUM'
    end
    object qryDesmembramentosIDIMOVELINI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVELINI'
      Visible = False
    end
    object qryDesmembramentosIDIMOVELFIM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVELFIM'
      Visible = False
    end
  end
  object qryLookBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBEM, IDGRUPO, IDCONJUNTO, DESBEM'
      'FROM'
      '   BEM'
      'WHERE'
      '   ( (:PIDBEM IS NULL) OR (IDBEM = :PIDBEM) )'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 359
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryLookBemIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BASEDADOS.BEM.IDBEM'
    end
    object qryLookBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.BEM.IDGRUPO'
    end
    object qryLookBemIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = 'BASEDADOS.BEM.IDCONJUNTO'
    end
    object qryLookBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Origin = 'BASEDADOS.BEM.DESBEM'
      Size = 200
    end
  end
  object qryLookObra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCAFOBRA,'
      '       IDPESSOA,'
      '       IDMODULO,'
      '       IDGRUPO,'
      '       CODSUBCONTA,'
      '       UNIDNEGOC,'
      '       DESCCAFOBRA,'
      '       DTAINICIOOBRA,'
      '       DTAENCERRAOBRA,'
      '       FLGOBRA,'
      '       IDTIPOCUSTORECIMO,'
      '       IDIMOVEL'
      'FROM   CAFOBRA'
      'WHERE  ((:PIDCAFOBRA IS NULL) OR (IDCAFOBRA = :PIDCAFOBRA))'
      '  AND  ((:PIDIMOVEL IS NULL)  OR (IDIMOVEL  = :PIDIMOVEL))'
      ''
      '')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 64
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
    object qryLookObraIDCAFOBRA: TFloatField
      FieldName = 'IDCAFOBRA'
      Origin = 'BASEDADOS.CAFOBRA.IDCAFOBRA'
    end
    object qryLookObraIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.CAFOBRA.IDPESSOA'
    end
    object qryLookObraIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.CAFOBRA.IDGRUPO'
    end
    object qryLookObraCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'BASEDADOS.CAFOBRA.CODSUBCONTA'
    end
    object qryLookObraUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.CAFOBRA.UNIDNEGOC'
    end
    object qryLookObraDESCCAFOBRA: TStringField
      FieldName = 'DESCCAFOBRA'
      Origin = 'BASEDADOS.CAFOBRA.DESCCAFOBRA'
      Size = 250
    end
    object qryLookObraDTAINICIOOBRA: TDateTimeField
      FieldName = 'DTAINICIOOBRA'
      Origin = 'BASEDADOS.CAFOBRA.DTAINICIOOBRA'
    end
    object qryLookObraDTAENCERRAOBRA: TDateTimeField
      FieldName = 'DTAENCERRAOBRA'
      Origin = 'BASEDADOS.CAFOBRA.DTAENCERRAOBRA'
    end
    object qryLookObraFLGOBRA: TFloatField
      FieldName = 'FLGOBRA'
      Origin = 'BASEDADOS.CAFOBRA.FLGOBRA'
    end
    object qryLookObraIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryLookObraIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'BASEDADOS.CAFOBRA.IDTIPOCUSTORECIMO'
    end
    object qryLookObraIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.CAFOBRA.IDIMOVEL'
    end
  end
  object qryReavaliaObra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT L.IDOBRALANC, L.IDCAFOBRA'
      '  FROM CAFOBRALANC L, CAFOBRA O'
      ' WHERE L.IDCAFOBRA = O.IDCAFOBRA'
      '   AND ((:PIDIMOVEL IS NULL) OR (O.IDIMOVEL = :PIDIMOVEL))'
      '   AND L.IDLANCIMOVEL IS NULL'
      '   AND L.FLGDESMEMBOBRA <> 1'
      '   AND L.DTALANCAMENTO = :PDTALANCAMENTO'
      '')
    ValidateWithMask = True
    Left = 193
    Top = 378
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTALANCAMENTO'
        ParamType = ptUnknown
      end>
    object qryReavaliaObraIDOBRALANC: TFloatField
      FieldName = 'IDOBRALANC'
      Origin = 'BASEDADOS.CAFOBRALANC.IDOBRALANC'
    end
    object qryReavaliaObraIDCAFOBRA: TFloatField
      FieldName = 'IDCAFOBRA'
      Origin = 'BASEDADOS.CAFOBRALANC.IDCAFOBRA'
    end
  end
  object qryLookObraLanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select DTALANCAMENTO'
      '  FROM CAFOBRALANC'
      ' WHERE IDLANCIMOVEL IS NULL'
      '   AND IDCAFOBRA = :PCAFOBRA'
      '   AND DTALANCAMENTO >= :PDTLIMITE'
      ''
      ''
      ' ')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 64
    Top = 374
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCAFOBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTLIMITE'
        ParamType = ptUnknown
      end>
  end
  object qryLookObraReav: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT O.IDIMOVEL, I.IMOCODIGO, L.IDGRUPO,'
      '       DECODE(L.IDGRUPO, T.IDGRUPOTERRENO, '#39'T'#39','
      '                         T.IDGRUPOEDIFICACAO, '#39'E'#39','
      '                         T.IDGRUPOINST, '#39'I'#39', NULL) AS TIPO,'
      '       SUM(L.VALOFI) AS SALDO'
      '  FROM CAFOBRA O,'
      '       CAFOBRALANC L, '
      '       IMOVEL I,'
      '       PARAMINVESTIMOB P, TIPOIMOVEL T'
      ' WHERE L.IDCAFOBRA = O.IDCAFOBRA'
      '   AND O.IDIMOVEL = I.IDIMOVEL(+)'
      '   AND I.IDPESSOA = P.IDPESSOA'
      '   AND P.CODTIPIMOVELOBRA = T.CODTIPIMOVEL'
      '   AND O.DTAENCERRAOBRA IS NULL'
      '   AND ((:PIDIMOVEL IS NULL) OR (O.IDIMOVEL = :PIDIMOVEL))'
      '   AND ((:PIDGRUPO IS NULL) OR (L.IDGRUPO = :PIDGRUPO))'
      '   AND L.DTALANCAMENTO <= :PDTLIMITE'
      ' GROUP BY O.IDIMOVEL, I.IMOCODIGO, L.IDGRUPO,'
      '          DECODE(L.IDGRUPO, T.IDGRUPOTERRENO, '#39'T'#39','
      '                            T.IDGRUPOEDIFICACAO, '#39'E'#39','
      '                            T.IDGRUPOINST, '#39'I'#39', NULL)'
      ''
      ''
      ' ')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 64
    Top = 389
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTLIMITE'
        ParamType = ptUnknown
      end>
    object qryLookObraReavIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.CAFOBRA.IDIMOVEL'
    end
    object qryLookObraReavIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.CAFOBRALANC.IDGRUPO'
    end
    object qryLookObraReavSALDO: TFloatField
      FieldName = 'SALDO'
      Origin = 'BASEDADOS.CAFOBRALANC.VALOFI'
    end
    object qryLookObraReavIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryLookObraReavTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object qryDelAtivoCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM ATIVOCOTA'
      'WHERE IDIMOVEL = :PIDIMOVEL'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 296
    Top = 373
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryPlacaComPrefixo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(MAX(SUBSTR(PLACA,2,6)),0) AS PLACA'
      'FROM BEM'
      'WHERE SUBSTR(PLACA,1,1) IN (6,7,8)'
      'AND   IDMODULO = 54'
      ' ')
    ValidateWithMask = True
    Left = 376
    Top = 398
    object qryPlacaComPrefixoPLACA: TStringField
      FieldName = 'PLACA'
      Size = 6
    end
  end
end
