object DtmCmBackDocumento: TDtmCmBackDocumento
  OldCreateOrder = True
  Left = 11
  Top = 102
  Height = 535
  Width = 879
  object QryInsertRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO RATEIODOCUM'
      
        '  (CODDOCUMENTO,    CODTIPRECDES,      RECPAG,    CODCENTRORESPO' +
        'N,  IDPESSOA, VALOR,'
      
        '   VALOROUTRAMOEDA, IDUSUARIOINCLUSAO, UNIDNEGOC, IDRESERVAORCAM' +
        'EN, IDRATEIODOCUM, CODCENTROCUSTO, IDEMPRESA,'
      '   IDPATRO, IDPROGRAMA, IDPLANOPREV, IDPROCESSO)'
      'VALUES'
      
        '  (:CODDOCUMENTO,   :CODTIPRECDES,     :RECPAG,   :CODCENTRORESP' +
        'ON, :IDPESSOA,     ROUND(:VALOR,2),'
      
        '   ROUND(:VALOROUTRAMOEDA,2) ,:IDUSUARIOINCLUSAO,:UNIDNEGOC,:IDR' +
        'ESERVAORCAMEN,:IDRATEIODOCUM,:CODCENTROCUSTO, :IDEMPRESA,'
      '   :IDPATRO, :IDPROGRAMA, :IDPLANOPREV, :IDPROCESSO)'
      ' ')
    ValidateWithMask = True
    Left = 145
    Top = 9
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTRORESPON'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOROUTRAMOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIOINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESERVAORCAMEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRATEIODOCUM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROGRAMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object QryUpdRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE RATEIODOCUM SET'
      '  CODDOCUMENTO      = :CODDOCUMENTO,'
      '  CODTIPRECDES      = :CODTIPRECDES,'
      '  RECPAG            = :RECPAG,'
      '  CODCENTRORESPON   = :CODCENTRORESPON,'
      '  IDPESSOA          = :IDPESSOA,'
      '  VALOR             = ROUND(:VALOR, 2),'
      '  VALOROUTRAMOEDA   = ROUND(:VALOROUTRAMOEDA,2),'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  UNIDNEGOC         = :UNIDNEGOC,'
      '  IDRESERVAORCAMEN  = :IDRESERVAORCAMEN,'
      '  CODCENTROCUSTO    = :CODCENTROCUSTO,'
      '  IDEMPRESA         = :IDEMPRESA,'
      '  IDPATRO           = :IDPATRO,'
      '  IDPROGRAMA        = :IDPROGRAMA,'
      '  IDPLANOPREV       = :IDPLANOPREV'
      'WHERE'
      '  IDRATEIODOCUM = :IDRATEIODOCUM'
      '')
    ValidateWithMask = True
    Left = 145
    Top = 57
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTRORESPON'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOROUTRAMOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIOINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESERVAORCAMEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROGRAMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRATEIODOCUM'
        ParamType = ptUnknown
      end>
  end
  object QryDelRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      '  RATEIODOCUM'
      'WHERE'
      '  IDRATEIODOCUM = :IDRATEIODOCUM'
      '')
    ValidateWithMask = True
    Left = 145
    Top = 105
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRATEIODOCUM'
        ParamType = ptUnknown
      end>
  end
  object QryInsereDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DOCUMENTO'
      
        '  (CODDOCUMENTO, MOECODIGO, IDPESSOA, IDFORCLI, CODTIPDOC, CODPO' +
        'RTFORMA, RECPAG,'
      
        '   NODOCUMENTO, COMPLDOCUMENTO, DATAEMISSAO, DATAVENCTO, DATAPRO' +
        'GRAMADA, STATUS,'
      
        '   NUMFATURA, PLANO, PLACONTA, CODCENTROCUSTO, OPERACAO, IDUSUAR' +
        'IOINCLUSAO,'
      
        '   IDMODULO, CODSUBCONTA, CODFORMA, NUMLEITCODBARRAS, NUMDIGCODB' +
        'ARRAS, EMISBLOQ,'
      
        '   VALORJUROS, VLRMULTA, INDICECORRECAO, UNIDNEGOC, REFERENCIA, ' +
        'OBS, IDEMPRESA,'
      '   NUMAPGR, IDCBANCARIA, FLGNAOCONCILIADO, DATADISPONIB)'
      'VALUES'
      
        '  (:CODDOCUMENTO, :MOECODIGO, :IDPESSOA, :IDFORCLI, :CODTIPDOC, ' +
        ':CODPORTFORMA, :RECPAG,'
      
        '   :NODOCUMENTO, :COMPLDOCUMENTO, :DATAEMISSAO, :DATAVENCTO, :DA' +
        'TAPROGRAMADA, :STATUS,'
      
        '   :NUMFATURA, :PLANO, :PLACONTA, :CODCENTROCUSTO, :OPERACAO, :I' +
        'DUSUARIOINCLUSAO,'
      
        '   :IDMODULO, :CODSUBCONTA, :CODFORMA, :NUMLEITCODBARRAS, :NUMDI' +
        'GCODBARRAS, :EMISBLOQ,'
      
        '   :VALORJUROS, :VLRMULTA, :INDICECORRECAO, :UNIDNEGOC, :REFEREN' +
        'CIA, :OBS, :IDEMPRESA,'
      '   :NUMAPGR, :IDCBANCARIA, :FLGNAOCONCILIADO, :DATADISPONIB)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 71
    Top = 9
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODTIPDOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NODOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'COMPLDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAEMISSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAVENCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAPROGRAMADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMFATURA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIOINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMLEITCODBARRAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMDIGCODBARRAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'EMISBLOQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRMULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'INDICECORRECAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'REFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMAPGR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCBANCARIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGNAOCONCILIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATADISPONIB'
        ParamType = ptUnknown
      end>
  end
  object QryAlteraDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE DOCUMENTO SET'
      '  MOECODIGO            = :MOECODIGO,'
      '  IDPESSOA             = :IDPESSOA,'
      '  IDFORCLI             = :IDFORCLI,'
      '  CODTIPDOC            = :CODTIPDOC,'
      '  CODPORTFORMA         = :CODPORTFORMA,'
      '  RECPAG               = :RECPAG,'
      '  DATAEMISSAO          = :DATAEMISSAO,'
      '  DATAVENCTO           = :DATAVENCTO,'
      '  DATAPROGRAMADA       = :DATAPROGRAMADA,'
      '  STATUS               = :STATUS,'
      '  NUMFATURA            = :NUMFATURA,'
      '  PLANO                = :PLANO,'
      '  PLACONTA             = :PLACONTA,'
      '  CODCENTROCUSTO       = :CODCENTROCUSTO,'
      '  OPERACAO             = :OPERACAO,'
      '  CODSUBCONTA          = :CODSUBCONTA,'
      '  CODFORMA             = :CODFORMA,'
      '  NUMLEITCODBARRAS     = :NUMLEITCODBARRAS,'
      '  NUMDIGCODBARRAS      = :NUMDIGCODBARRAS,'
      '  EMISBLOQ             = :EMISBLOQ,'
      '  VALORJUROS           = :VALORJUROS,'
      '  VLRMULTA             = :VLRMULTA,'
      '  INDICECORRECAO       = :INDICECORRECAO,'
      '  REFERENCIA           = :REFERENCIA,'
      '  OBS                  = :OBS,'
      '  NUMSLIP              = :NUMSLIP,'
      '  IDEMPRESA            = :IDEMPRESA,'
      '  NUMAPGR              = :NUMAPGR,'
      '  IDCBANCARIA          = :IDCBANCARIA,'
      '  FLGNAOCONCILIADO     = :FLGNAOCONCILIADO,'
      '  DATADISPONIB     = :DATADISPONIB'
      'WHERE'
      '  CODDOCUMENTO =:CODDOCUMENTO')
    ValidateWithMask = True
    Left = 80
    Top = 57
    ParamData = <
      item
        DataType = ftFloat
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODTIPDOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAEMISSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAVENCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAPROGRAMADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMFATURA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMLEITCODBARRAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMDIGCODBARRAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'EMISBLOQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRMULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'INDICECORRECAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'REFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMSLIP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMAPGR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCBANCARIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGNAOCONCILIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATADISPONIB'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryValidaNumApGr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NUMAPGR FROM DOCUMENTO WHERE NUMAPGR = :NUMAPGR')
    ValidateWithMask = True
    Left = 278
    Top = 9
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMAPGR'
        ParamType = ptUnknown
      end>
    object QryValidaNumApGrNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
      Origin = '"CM.DOCUMENTO".NUMAPGR'
    end
  end
  object Qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 13
    Top = 9
  end
  object QryDelRateioDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      '  RATEIODOCUM'
      'WHERE'
      '  CODDOCUMENTO = :CODDOCUMENTO')
    ValidateWithMask = True
    Left = 145
    Top = 153
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TIPORDXCCXCONTA.PLACONTA'
      'FROM'
      '  TIPORDXCCXCONTA'
      'WHERE'
      '  RTRIM(TIPORDXCCXCONTA.CODTIPRECDES) = :CODTIPRECDES AND'
      '  TIPORDXCCXCONTA.RECPAG = :RECPAG AND'
      '  TIPORDXCCXCONTA.IDPESSOA = :IDPESSOA AND'
      '  RTRIM(TIPORDXCCXCONTA.CODCENTROCUSTO) = :CODCENTROCUSTO AND'
      '  TIPORDXCCXCONTA.IDEMPRESA = :IDEMPRESA AND'
      '  TIPORDXCCXCONTA.IDPROGRAMA = :IDPROGRAMA'
      '')
    ValidateWithMask = True
    Left = 212
    Top = 9
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROGRAMA'
        ParamType = ptUnknown
      end>
    object QryBuscaContaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
  end
  object QryBuscaContaTrd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TIPORECEBDESEMB.PLACONTA'
      'FROM'
      '  TIPORECEBDESEMB'
      'WHERE'
      '  RTRIM(TIPORECEBDESEMB.CODTIPRECDES) = :CODTIPRECDES AND'
      '  TIPORECEBDESEMB.RECPAG = :RECPAG AND'
      '  TIPORECEBDESEMB.IDPESSOA = :IDPESSOA'
      ''
      '')
    ValidateWithMask = True
    Left = 211
    Top = 57
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryBuscaContaTrdPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
  end
  object QryInsereLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO LANCTODOCUM'
      
        ' (CODDOCUMENTO, NUMLANCTO, CODALTERADOR, PLNCODIGO, DATALANCTO, ' +
        'VALOR,'
      
        '  VALOROUTRAMOEDA, ESTORNO, DEBCRE, OPERACAO, HISTORICOCOMPL, ID' +
        'USUARIOINCLUSAO,'
      
        '  NUMFATURA, FLGTIPOFATURA, CODTIPDOC, VLRLIQUIDO, IDPESSOA, UNI' +
        'DNEGOC, NUMLOTEMANUAL)'
      'VALUES'
      
        '  (:CODDOCUMENTO, :NUMLANCTO, :CODALTERADOR, :PLNCODIGO, :DATALA' +
        'NCTO, ROUND(:VALOR,2),'
      
        '   ROUND(:VALOROUTRAMOEDA,2), :ESTORNO, :DEBCRE, :OPERACAO, :HIS' +
        'TORICOCOMPL, :IDUSUARIOINCLUSAO,'
      
        '   :NUMFATURA, :FLGTIPOFATURA, :CODTIPDOC, :VLRLIQUIDO, :IDPESSO' +
        'A, :UNIDNEGOC, :NUMLOTEMANUAL)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 344
    Top = 9
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMLANCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODALTERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATALANCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOROUTRAMOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ESTORNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DEBCRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'HISTORICOCOMPL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIOINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMFATURA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGTIPOFATURA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODTIPDOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRLIQUIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMLOTEMANUAL'
        ParamType = ptUnknown
      end>
  end
  object QryAlteraLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE LANCTODOCUM SET'
      '  CODALTERADOR = :CODALTERADOR,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  DATALANCTO = :DATALANCTO,'
      '  VALOR = ROUND(:VALOR,2),'
      '  VALOROUTRAMOEDA = ROUND(:VALOROUTRAMOEDA,2),'
      '  ESTORNO = :ESTORNO,'
      '  DEBCRE = :DEBCRE,'
      '  OPERACAO = :OPERACAO,'
      '  HISTORICOCOMPL = :HISTORICOCOMPL,'
      '  NUMFATURA = :NUMFATURA,'
      '  FLGTIPOFATURA = :FLGTIPOFATURA,'
      '  CODTIPDOC = :CODTIPDOC,'
      '  VLRLIQUIDO = :VLRLIQUIDO,'
      '  IDPESSOA = :IDPESSOA,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  NUMLOTEMANUAL = :NUMLOTEMANUAL'
      'WHERE'
      '  CODDOCUMENTO = :CODDOCUMENTO AND'
      '  NUMLANCTO = :NUMLANCTO')
    ValidateWithMask = True
    Left = 344
    Top = 59
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODALTERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATALANCTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOROUTRAMOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ESTORNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DEBCRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'HISTORICOCOMPL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMFATURA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGTIPOFATURA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODTIPDOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRLIQUIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMLOTEMANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMLANCTO'
        ParamType = ptUnknown
      end>
  end
  object QryTestaSubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  PLASUBCONTA '
      'FROM '
      '  PLANOCONTA '
      'WHERE '
      '  PLANO = :PLANO AND '
      '  PLACONTA = :PLACONTA'
      '')
    ValidateWithMask = True
    Left = 344
    Top = 110
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end>
    object QryTestaSubContaPLASUBCONTA: TStringField
      FieldName = 'PLASUBCONTA'
      Origin = 'PLANOCONTA.PLASUBCONTA'
      Size = 1
    end
  end
  object QryBuscaSubcDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CODSUBCONTA FROM DOCUMENTO WHERE CODDOCUMENTO = :CODDOCUM' +
        'ENTO')
    ValidateWithMask = True
    Left = 344
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QryBuscaSubcDocumentoCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'DOCUMENTO.CODSUBCONTA'
    end
  end
  object QryResOrcamen: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDRESERVAORCAMEN, VLRRESORCAMEN'
      'FROM'
      '  RATEIODOCUM'
      'WHERE'
      '  CODDOCUMENTO = :CODDOCUMENTO AND'
      '  IDRESERVAORCAMEN IS NOT NULL')
    ValidateWithMask = True
    Left = 145
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QryResOrcamenIDRESERVAORCAMEN: TFloatField
      FieldName = 'IDRESERVAORCAMEN'
      Origin = 'RATEIODOCUM.IDRESERVAORCAMEN'
    end
    object QryResOrcamenVLRRESORCAMEN: TFloatField
      FieldName = 'VLRRESORCAMEN'
      Origin = 'RATEIODOCUM.VLRRESORCAMEN'
    end
  end
  object QryUpdResOrcamen: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '  RESERVAORCAMEN'
      'SET'
      '  FLGRESERVA = :FLGRESERVA,'
      '  VLRCOMPROMISSO = VLRCOMPROMISSO - :VLRCOMPROMISSO'
      'WHERE'
      '  IDRESERVAORCAMEN = :IDRESERVAORCAMEN')
    ValidateWithMask = True
    Left = 145
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'FLGRESERVA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRCOMPROMISSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESERVAORCAMEN'
        ParamType = ptUnknown
      end>
  end
  object QryUpdValorCompromisso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '  RATEIODOCUM'
      'SET'
      '  VLRRESORCAMEN = :VLRRESORCAMEN'
      'WHERE'
      '  IDRATEIODOCUM = :IDRATEIODOCUM')
    ValidateWithMask = True
    Left = 241
    Top = 248
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VLRRESORCAMEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRATEIODOCUM'
        ParamType = ptUnknown
      end>
  end
  object qryTestaRateioRad: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROCESSO, CODCENTRORESPON'
      'FROM RATEIODOCUM'
      'WHERE (CODDOCUMENTO = :CODDOCUMENTO)'
      '  AND (CODCENTRORESPON = :CODCENTRORESPON)'
      '  AND (IDPESSOA = :IDPESSOA)')
    ValidateWithMask = True
    Left = 145
    Top = 305
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTRORESPON'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updValorProcessoRad: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE RADINSTPROCESSO SET VALOR = VALOR + :VALOR'
      'WHERE (IDPROCESSO = :IDPROCESSO)')
    ValidateWithMask = True
    Left = 249
    Top = 305
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object QryDelRateioDocRecDes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      '  RATEIODOCUM'
      'WHERE'
      '  CODDOCUMENTO = :CODDOCUMENTO AND'
      '  RECPAG = :RECPAG AND'
      '  RTRIM(CODTIPRECDES) = RTRIM(:CODTIPRECDES)'
      ' ')
    ValidateWithMask = True
    Left = 214
    Top = 105
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end>
  end
  object QryParamDocs: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  L.DATALANCTO,'
      '  L.ESTORNO,'
      '  L.PLNCODIGO,'
      '  D.OPERACAO,'
      '  D.NUMFATURA'
      'FROM'
      '  DOCUMENTO D,'
      '  LANCTODOCUM L'
      'WHERE'
      '  D.CODDOCUMENTO = :CODDOCUMENTO AND'
      '  D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '  D.OPERACAO = L.OPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 464
    Top = 32
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaParamBaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   L.CODDOCUMENTO,'
      '   L.NUMLANCTO,'
      '   L.DATALANCTO,'
      '   P.DESCRICAO'
      'FROM'
      '   LANCTODOCUM L,'
      '   RECBTOPAGTO R,'
      '   PORTADORFORMA P'
      'WHERE'
      '   (L.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '   ((RTRIM(L.OPERACAO) = '#39'5'#39') OR (RTRIM(L.OPERACAO) = '#39'15'#39')) AND'
      '   (L.CODDOCUMENTO = R.CODDOCUMENTO) AND'
      '   (L.NUMLANCTO = R.NUMLANCTO) AND'
      '   (P.CODPORTFORMA(+) = R.CODPORTFORMA)')
    ValidateWithMask = True
    Left = 464
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryDadosDelImpLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  L.CODDOCUMENTO,'
      '  L.NUMLANCTO,'
      '  L.PLNCODIGO,'
      '  L.OPERACAO AS OPERLANC,'
      '  D.OPERACAO AS OPERDOC,'
      '  L.ESTORNO'
      'FROM'
      '  LANCTODOCUM L, DOCUMENTO D'
      'WHERE'
      '  (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  (RTRIM(D.OPERACAO) <> '#39'5'#39') AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 464
    Top = 128
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryDadosDelOrc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   R.IDRESERVAORCAMEN, '
      '   O.NUMRESERVA, '
      '   R.VLRRESORCAMEN '
      'FROM '
      '   RATEIODOCUM R, RESERVAORCAMEN O'
      'WHERE '
      '   R.CODDOCUMENTO = :CODDOCUMENTO AND'
      '   R.IDRESERVAORCAMEN = O.IDRESERVAORCAMEN')
    ValidateWithMask = True
    Left = 464
    Top = 176
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryDadosDelLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  L.FLAGCANCEL, L.NUMLOTE'
      'FROM '
      '  LOTEPAGTO L, '
      '  LOTEXDOCUM LX '
      'WHERE '
      '  L.NUMLOTE = LX.NUMLOTE AND'
      '  LX.CODDOCUMENTO = :CODDOCUMENTO')
    ValidateWithMask = True
    Left = 464
    Top = 224
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QrySelLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  L.CODDOCUMENTO,'
      '  L.NUMLANCTO,'
      '  L.PLNCODIGO,'
      '  L.OPERACAO AS OPERLANC,'
      '  D.OPERACAO AS OPERDOC,'
      '  L.ESTORNO'
      'FROM'
      '  LANCTODOCUM L, DOCUMENTO D'
      'WHERE'
      '  (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  (L.NUMLANCTO = :NUMLANCTO) AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 464
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMLANCTO'
        ParamType = ptUnknown
      end>
  end
  object QryRecuperaParamIntegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  P.IMPGENERICA,'
      '        P.IDTIPOCLIADIANTO,'
      '        P.CODADFORNE,'
      '        P.HISTPADFINAN,'
      '        P.IDRAMOFORNECEDOR,'
      '        P.IDIMPRESSORA,'
      '        P.FLGESTEXCFINANC,'
      '        P.FLGEMITELANCBAIX,'
      '        P.FLGOBRIGFORMAPGTO,'
      '        P.FLGCOMPLTIPOFAT,'
      '        P.MASCARANODOCUM,'
      '        P.FLGCORRIGEDOCAUTO,'
      '        P.FLGEXCLUICONTAB,'
      '        P.FLGCONTROLACHEQUE,'
      '        P.FLGLANCAFLOAT,'
      '        P.FLGEXCLUIPLANIL,'
      '        R.NAME,'
      '        R.FORMEVENTOS,'
      '        R.FORMPARAMREL,'
      '        R.PPREPORT,'
      '        R.IDREPORTS,'
      '        R.ORIGEMCM,'
      '        P.FLGTRDXCCXCONTA,'
      '        P.FLGTRDXIMPOSTOS,'
      '        P.CODTIPDOCCPMF,'
      '        P.FLGVALIDACCBAIXA,'
      '        P.FLGMODADDOCPG,'
      '        P.FLGSLIPAUTO,'
      '        P.FLGBAIXACHQ,'
      '        P.FLGOPAUTO,'
      '        P.FLGRADLOTE'
      'FROM    PARAMCAP P,'
      '        REPORTS R'
      'WHERE   IDPESSOA    = :IDPESSOA'
      '  AND   RECPAG      = :RECPAG'
      '  AND   P.IDREPORTS = R.IDREPORTS (+)'
      '  AND   P.ORIGEMCM  = R.ORIGEMCM  (+)')
    ValidateWithMask = True
    Left = 141
    Top = 393
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptInput
      end>
  end
  object qryTipoDocRecPag: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 261
    Top = 393
  end
  object QryGetTipoProcesso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOPROCESSO FROM RADTIPOPROCESSO'
      'WHERE ( IDREFERENCIA = :IDREFERENCIA )')
    ValidateWithMask = True
    Left = 365
    Top = 393
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDREFERENCIA'
        ParamType = ptInput
      end>
  end
  object qryUsaRAD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FLGRAD FROM EMPRESAPROP '
      'WHERE ( IDPESSOA = :IDPESSOA )')
    ValidateWithMask = True
    Left = 453
    Top = 393
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  object qryDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  * FROM DOCUMENTO WHERE CODDOCUMENTO = :CODDOCUMENTO')
    ValidateWithMask = True
    Left = 37
    Top = 393
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryAtuRADDoc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 453
    Top = 345
  end
  object qryExcluirRAD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE RADINSTPROCESSO '
      'SET FLGOK = '#39'E'#39' '
      'WHERE IDPROCESSO = :IDPROCESSO')
    ValidateWithMask = True
    Left = 525
    Top = 393
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPROCESSO'
        ParamType = ptInput
      end>
  end
end
