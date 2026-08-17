object dtmLancImovel: TdtmLancImovel
  OldCreateOrder = False
  Left = 19
  Top = 128
  Height = 551
  Width = 775
  object qryInsertAlteraLanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO ALTERALANCIMOVEL'
      '('
      'IDDOCUMENTO,'
      'CODALTERADOR,'
      'VLRALTERADOR'
      ')'
      'VALUES'
      '('
      ':PIDDOCUMENTO,'
      ':PCODALTERADOR,'
      ':PVLRALTERADOR'
      ')'
      ''
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODALTERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRALTERADOR'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteAlteraLanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   ALTERALANCIMOVEL ALI'
      ''
      'WHERE'
      '   ( ALI.IDDOCUMENTO =:PIDDOCUMENTO )'
      
        '   AND ( (:PCODALTERADOR IS NULL) OR (ALI.CODALTERADOR =:PCODALT' +
        'ERADOR) )'
      ''
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 36
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODALTERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODALTERADOR'
        ParamType = ptUnknown
      end>
  end
  object qrySelectAlteraLanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   ALI.IDDOCUMENTO,'
      '   ALI.CODALTERADOR,'
      '   ALI.VLRALTERADOR,'
      ''
      '   TA.DESCRICAO'
      ''
      ''
      'FROM'
      '   ALTERALANCIMOVEL ALI, TIPOALTERADOR TA'
      ''
      'WHERE'
      
        '   ( (:PIDDOCUMENTO IS NULL) OR (ALI.IDDOCUMENTO =:PIDDOCUMENTO)' +
        ' )'
      
        '   AND ( (:PCODALTERADOR IS NULL) OR (ALI.CODALTERADOR =:PCODALT' +
        'ERADOR) )'
      '   AND ( ALI.CODALTERADOR = TA.CODALTERADOR )'
      '')
    ValidateWithMask = True
    Left = 48
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODALTERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODALTERADOR'
        ParamType = ptUnknown
      end>
    object qrySelectAlteraLancIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.IDDOCUMENTO'
    end
    object qrySelectAlteraLancCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.CODALTERADOR'
    end
    object qrySelectAlteraLancVLRALTERADOR: TFloatField
      FieldName = 'VLRALTERADOR'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.VLRALTERADOR'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qrySelectAlteraLancDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
  end
  object qryInsertObsLanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OBSLANCIMOVEL O'
      '   (O.IDDOCUMENTO, O.OBS)'
      '   VALUES'
      '   (:PIDDOCUMENTO, :POBS)'
      '')
    ValidateWithMask = True
    Left = 48
    Top = 140
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'POBS'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateObsLanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   OBSLANCIMOVEL O'
      ''
      'SET'
      '   O.OBS =:POBS'
      ''
      'WHERE'
      '   (O.IDDOCUMENTO =:PIDDOCUMENTO)'
      '')
    ValidateWithMask = True
    Left = 48
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'POBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteObsLanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   OBSLANCIMOVEL'
      'WHERE'
      '   (IDDOCUMENTO = :PIDDOCUMENTO)'
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qrySelectObsLanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   O.IDDOCUMENTO, O.OBS'
      ''
      'FROM'
      '   OBSLANCIMOVEL O'
      ''
      'WHERE'
      '   (O.IDDOCUMENTO =:PIDDOCUMENTO)'
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qrySelectObsLancIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'OBSLANCIMOVEL.IDDOCUMENTO'
    end
    object qrySelectObsLancOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'OBSLANCIMOVEL.OBS'
      BlobType = ftMemo
      Size = 1000
    end
  end
  object qryUpdateDesconto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   DESCONTOCONTRATO D'
      'SET'
      '   D.FLGCONCEDIDO = NULL'
      'WHERE'
      '   ( D.IDDESCONTO =:PIDDESCONTO )')
    ValidateWithMask = True
    Left = 168
    Top = 28
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDESCONTO'
        ParamType = ptUnknown
      end>
    object FloatField4: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.IDDOCUMENTO'
    end
    object FloatField5: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.CODALTERADOR'
    end
    object FloatField6: TFloatField
      FieldName = 'VLRALTERADOR'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.VLRALTERADOR'
    end
    object StringField2: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
  end
  object qrySelectDesconto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   D.IDDESCONTO,'
      '   D.IDCONTRATOIMOVEL,'
      '   D.DCCMESCOMPETENCIA,'
      '   D.DCCANOCOMPETENCIA,'
      '   D.CODALTERADOR,'
      '   D.DCCVLR,'
      '   D.FLGCONCEDIDO,'
      '   D.DCCDESCRICAO,  '
      ''
      '   A.DESCRICAO'
      ''
      'FROM'
      '   DESCONTOCONTRATO D, TIPOALTERADOR A'
      ''
      'WHERE'
      '   ( D.IDCONTRATOIMOVEL =:PIDCONTRATOIMOVEL )'
      
        '   AND ( (:PCODALTERADOR IS NULL) OR (D.CODALTERADOR =:PCODALTER' +
        'ADOR) )'
      
        '   AND ( (:PDCCMESCOMPETENCIA IS NULL) OR (D.DCCMESCOMPETENCIA =' +
        ':PDCCMESCOMPETENCIA) )'
      
        '   AND ( (:PDCCANOCOMPETENCIA IS NULL) OR (D.DCCANOCOMPETENCIA =' +
        ':PDCCANOCOMPETENCIA) )'
      
        '   AND ( (:PFLGCONCEDIDO IS NULL) OR (D.FLGCONCEDIDO =:PFLGCONCE' +
        'DIDO) )'
      '   AND ( D.CODALTERADOR = A.CODALTERADOR(+) )'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 168
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODALTERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODALTERADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PDCCMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PDCCMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PDCCANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PDCCANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGCONCEDIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGCONCEDIDO'
        ParamType = ptUnknown
      end>
    object qrySelectDescontoIDDESCONTO: TFloatField
      FieldName = 'IDDESCONTO'
    end
    object qrySelectDescontoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qrySelectDescontoDCCMESCOMPETENCIA: TFloatField
      FieldName = 'DCCMESCOMPETENCIA'
    end
    object qrySelectDescontoDCCANOCOMPETENCIA: TFloatField
      FieldName = 'DCCANOCOMPETENCIA'
    end
    object qrySelectDescontoCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object qrySelectDescontoDCCVLR: TFloatField
      FieldName = 'DCCVLR'
    end
    object qrySelectDescontoFLGCONCEDIDO: TFloatField
      FieldName = 'FLGCONCEDIDO'
    end
    object qrySelectDescontoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qrySelectDescontoDCCDESCRICAO: TStringField
      FieldName = 'DCCDESCRICAO'
      Size = 60
    end
  end
  object qryEstornaLancImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE LANCAMENTOSIMOVEL'
      'SET FLGESTORNADO = 1'
      'WHERE'
      '   IDDOCUMENTO =:PIDDOCUMENTO')
    ValidateWithMask = True
    Left = 288
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiLancImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LANCAMENTOSIMOVEL'
      
        'WHERE ( (:PIDDOCUMENTO IS NOT NULL) OR (:PIDLANCIMOVEL IS NOT NU' +
        'LL) )'
      
        '  AND ( (:PIDDOCUMENTO IS NULL)  OR (IDDOCUMENTO  = :PIDDOCUMENT' +
        'O) )'
      
        '  AND ( (:PIDLANCIMOVEL IS NULL) OR (IDLANCIMOVEL = :PIDLANCIMOV' +
        'EL) )'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 288
    Top = 28
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLANCIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLANCIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLANCIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryInsertLancImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO'
      '   LANCAMENTOSIMOVEL'
      '   ('
      '   IDLANCIMOVEL,'
      '   RECPAG,'
      '   IDPESSOA,'
      '   IDFORCLI,'
      '   IDIMOVEL,'
      '   CODTIPIMOVEL,'
      '   IDTIPOCUSTORECIMO,'
      '   IDCONTRATOIMOVEL,'
      '   ANOCOMPETENCIA,'
      '   MESCOMPETENCIA,'
      '   ANOREFERENCIA,'
      '   MESREFERENCIA,'
      '   DATALANCAMENTO,'
      '   DATAVENCIMENTO,'
      '   DATAEMISSAO,'
      '   VLRLANCOMPAGAR,'
      '   VLRLANCPAGAR,'
      '   MOEDAPAGAR,'
      '   IDUSUARIOSISTEMA,'
      '   FLGORIGEMLANC,'
      '   NODOCUMENTO,'
      '   IDDOCUMENTO,'
      '   NUMAPALT,'
      '   FLGINTEGRADO,'
      '   REFERENCIAAP,'
      '   CODFORMA,'
      '   CODCENTROCUSTO,'
      '   VLRLANCOMRECEB,'
      '   VLRLANCRECEB,'
      '   MOEDARECEB,'
      '   FLGAGRUPAR,'
      '   COMPLDOCUMENTO,'
      '   CODPORTFORMA,'
      '   IDCBANCARIA,'
      '   IDRESERVAORCAMEN,'
      '   IDMODULO,'
      '   DTINICTBDIARIA,'
      '   DTFIMCTBDIARIA,'
      '   OBS'
      '   )'
      '   VALUES'
      '   ('
      '   :PIDLANCIMOVEL,'
      '   :PRECPAG,'
      '   :PIDPESSOA,'
      '   :PIDFORCLI,'
      '   :PIDIMOVEL,'
      '   :PCODTIPIMOVEL,'
      '   :PIDTIPOCUSTORECIMO,'
      '   :PIDCONTRATOIMOVEL,'
      '   :PANOCOMPETENCIA,'
      '   :PMESCOMPETENCIA,'
      '   :PANOREFERENCIA,'
      '   :PMESREFERENCIA,'
      '   :PDATALANCAMENTO,'
      '   :PDATAVENCIMENTO,'
      '   :PDATAEMISSAO,'
      '   :PVLRLANCOMPAGAR,'
      '   :PVLRLANCPAGAR,'
      '   :PMOEDAPAGAR,'
      '   :PIDUSUARIOSISTEMA,'
      '   :PFLGORIGEMLANC,'
      '   :PNODOCUMENTO,'
      '   :PIDDOCUMENTO,'
      '   :PNUMAPALT,'
      '   :PFLGINTEGRADO,'
      '   :PREFERENCIAAP,'
      '   :PCODFORMA,'
      '   :PCODCENTROCUSTO,'
      '   :PVLRLANCOMRECEB,'
      '   :PVLRLANCRECEB,'
      '   :PMOEDARECEB,'
      '   :PFLGAGRUPAR,'
      '   :PCOMPLDOCUMENTO,'
      '   :PCODPORTFORMA,'
      '   :PIDCBANCARIA,'
      '   :PIDRESERVAORCAMEN,'
      '   :PIDMODULO,'
      '   :PDTINICTBDIARIA,'
      '   :PDTFIMCTBDIARIA,'
      '   :POBS'
      '   )'
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
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 288
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLANCIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAEMISSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRLANCOMPAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRLANCPAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMOEDAPAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOSISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGORIGEMLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PNODOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PNUMAPALT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGINTEGRADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PREFERENCIAAP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRLANCOMRECEB'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRLANCRECEB'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMOEDARECEB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGAGRUPAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCOMPLDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCBANCARIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESERVAORCAMEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTINICTBDIARIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTFIMCTBDIARIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'POBS'
        ParamType = ptUnknown
      end>
  end
  object updLancImovel: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTOSIMOVEL'
      'set'
      '  MOEDARECEB = :MOEDARECEB,'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  IDPESSOA = :IDPESSOA,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  IDTIPOCUSTORECIMO = :IDTIPOCUSTORECIMO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  DATALANCAMENTO = :DATALANCAMENTO,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  VLRLANCPAGAR = :VLRLANCPAGAR,'
      '  VLRLANCOMPAGAR = :VLRLANCOMPAGAR,'
      '  RECPAG = :RECPAG,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  ANOREFERENCIA = :ANOREFERENCIA,'
      '  MESCOMPETENCIA = :MESCOMPETENCIA,'
      '  ANOCOMPETENCIA = :ANOCOMPETENCIA,'
      '  FLGAGRUPAR = :FLGAGRUPAR,'
      '  FLGAGRUPADO = :FLGAGRUPADO,'
      '  FLGTIPOLANCAMENTO = :FLGTIPOLANCAMENTO,'
      '  MOEDAPAGAR = :MOEDAPAGAR,'
      '  VLRLANCOMRECEB = :VLRLANCOMRECEB,'
      '  VLRLANCRECEB = :VLRLANCRECEB,'
      '  VLRJUROS = :VLRJUROS,'
      '  VLRMULTA = :VLRMULTA,'
      '  VLRCORRECAOMON = :VLRCORRECAOMON,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  DATACORRECAO = :DATACORRECAO,'
      '  FLGMULTACALCULADA = :FLGMULTACALCULADA,'
      '  FLGINTEGRADO = :FLGINTEGRADO,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDUSUARIOSISTEMA = :IDUSUARIOSISTEMA,'
      '  FLGESTORNADO = :FLGESTORNADO,'
      '  FLGORIGEMLANC = :FLGORIGEMLANC,'
      '  NODOCUMENTO = :NODOCUMENTO,'
      '  FLGERRO = :FLGERRO,'
      '  IDADMINIMOVEL = :IDADMINIMOVEL,'
      '  ANOPRESTACAO = :ANOPRESTACAO,'
      '  MESPRESTACAO = :MESPRESTACAO,'
      '  FLGIMPORTADO = :FLGIMPORTADO,'
      '  VLRCOMISSAO = :VLRCOMISSAO,'
      '  IDRESERVAORCAMEN = :IDRESERVAORCAMEN,'
      '  IDRATEIODOCUM = :IDRATEIODOCUM,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  CODFORMA = :CODFORMA,'
      '  REFERENCIAAP = :REFERENCIAAP,'
      '  IDPROGRAMA = :IDPROGRAMA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDLANCREEMBDESP = :IDLANCREEMBDESP,'
      '  CODTIPIMOVEL = :CODTIPIMOVEL,'
      '  MSGERROINTEGRA = :MSGERROINTEGRA,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  IDCBANCARIA = :IDCBANCARIA,'
      '  NUMAPALT = :NUMAPALT'
      'where'
      '  IDLANCIMOVEL = :OLD_IDLANCIMOVEL')
    InsertSQL.Strings = (
      'insert into LANCAMENTOSIMOVEL'
      '  (MOEDARECEB, IDIMOVEL, IDCONTRATOIMOVEL, IDPESSOA, PLNCODIGO, '
      'IDTIPOCUSTORECIMO, '
      '   CODDOCUMENTO, DATALANCAMENTO, DATAVENCIMENTO, '
      'VLRLANCPAGAR, VLRLANCOMPAGAR, '
      '   RECPAG, MESREFERENCIA, ANOREFERENCIA, MESCOMPETENCIA, '
      'ANOCOMPETENCIA, '
      '   FLGAGRUPAR, FLGAGRUPADO, FLGTIPOLANCAMENTO, MOEDAPAGAR, '
      'VLRLANCOMRECEB, '
      '   VLRLANCRECEB, VLRJUROS, VLRMULTA, VLRCORRECAOMON, '
      'TRGDTINCLUSAO, TRGUSERINCLUSAO, '
      '   DATACORRECAO, FLGMULTACALCULADA, FLGINTEGRADO, IDFORCLI, '
      'IDUSUARIOSISTEMA, '
      '   FLGESTORNADO, FLGORIGEMLANC, NODOCUMENTO, FLGERRO, '
      'IDADMINIMOVEL, ANOPRESTACAO, '
      '   MESPRESTACAO, FLGIMPORTADO, VLRCOMISSAO, IDRESERVAORCAMEN, '
      'IDRATEIODOCUM, '
      '   IDDOCUMENTO, CODFORMA, REFERENCIAAP, IDPROGRAMA, IDEMPRESA, '
      'CODCENTROCUSTO, '
      '   IDLANCREEMBDESP, CODTIPIMOVEL, MSGERROINTEGRA, CODPORTFORMA, '
      'IDCBANCARIA, NUMAPALT)'
      'values'
      
        '  (:MOEDARECEB, :IDIMOVEL, :IDCONTRATOIMOVEL, :IDPESSOA, :PLNCOD' +
        'IGO, '
      ':IDTIPOCUSTORECIMO, '
      '   :CODDOCUMENTO, :DATALANCAMENTO, :DATAVENCIMENTO, '
      ':VLRLANCPAGAR, :VLRLANCOMPAGAR, '
      '   :RECPAG, :MESREFERENCIA, :ANOREFERENCIA, :MESCOMPETENCIA, '
      ':ANOCOMPETENCIA, '
      '   :FLGAGRUPAR, :FLGAGRUPADO, :FLGTIPOLANCAMENTO, :MOEDAPAGAR, '
      ':VLRLANCOMRECEB, '
      '   :VLRLANCRECEB, :VLRJUROS, :VLRMULTA, :VLRCORRECAOMON, '
      ':TRGDTINCLUSAO, '
      '   :TRGUSERINCLUSAO, :DATACORRECAO, :FLGMULTACALCULADA, '
      ':FLGINTEGRADO, '
      '   :IDFORCLI, :IDUSUARIOSISTEMA, :FLGESTORNADO, :FLGORIGEMLANC, '
      ':NODOCUMENTO, '
      '   :FLGERRO, :IDADMINIMOVEL, :ANOPRESTACAO, :MESPRESTACAO, '
      ':FLGIMPORTADO, '
      
        '   :VLRCOMISSAO, :IDRESERVAORCAMEN, :IDRATEIODOCUM, :IDDOCUMENTO' +
        ', '
      ':CODFORMA, '
      '   :REFERENCIAAP, :IDPROGRAMA, :IDEMPRESA, :CODCENTROCUSTO, '
      ':IDLANCREEMBDESP, '
      '   :CODTIPIMOVEL, :MSGERROINTEGRA, :CODPORTFORMA, :IDCBANCARIA,'
      ':NUMAPALT)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTOSIMOVEL'
      'where'
      '  IDLANCIMOVEL = :OLD_IDLANCIMOVEL')
    Left = 288
    Top = 104
  end
  object qryLancImovel: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryLancImovelCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   L.IDIMOVELMESTRE,'
      '   L.NOME_MESTRE,'
      '   L.NOME_IMOVEL,'
      '   L.IMOVEL_EXTENSO,'
      '   L.CONTRATO_EXTENSO,'
      '   L.DESCCUSTORECIMO,'
      '   L.FORCLI_DOC,'
      '   L.STATUS_DOC,'
      '   L.DOC_CAPCAR,'
      '   L.PLNPLANIL,'
      '   L.LOGIN_USUARIO,'
      '   L.NF_USUARIO,'
      '   L.NF_FORCLI,'
      '   L.RS_FORCLI,'
      '   L.VLRLANCOMRECEB,'
      '   L.VLRLANCOMPAGAR,'
      '   L.MOEDARECEB,'
      '   L.VLRLANCRECEB,'
      '   L.VLRLANCPAGAR,'
      '   L.MOEDAPAGAR,'
      '   L.IDFORCLI,'
      '   L.IDLANCIMOVEL,'
      '   L.IDPESSOA,'
      '   L.IDIMOVEL,'
      '   L.IDTIPOCUSTORECIMO,'
      '   L.RECPAG,'
      '   L.IDCONTRATOIMOVEL,'
      '   L.CODDOCUMENTO,'
      '   L.IDRATEIODOCUM,'
      '   L.PLNCODIGO,'
      '   L.DATALANCAMENTO,'
      '   L.DATAVENCIMENTO,'
      '   L.DATAEMISSAO,'
      '   L.DTINICTBDIARIA,'
      '   L.DTFIMCTBDIARIA,'
      '   L.MESCOMPETENCIA,'
      '   L.ANOCOMPETENCIA,'
      '   L.FLGTIPOLANCAMENTO,'
      '   L.FLGORIGEMLANC,'
      '   L.FLGESTORNADO,'
      '   L.TRGDTINCLUSAO,'
      '   L.TRGUSERINCLUSAO,'
      '   L.MESREFERENCIA,'
      '   L.ANOREFERENCIA,'
      '   L.FLGAGRUPAR,'
      '   L.FLGAGRUPADO,'
      '   L.VLRJUROS,'
      '   L.VLRMULTA,'
      '   L.VLRCORRECAOMON,'
      '   L.DATACORRECAO,'
      '   L.FLGMULTACALCULADA,'
      '   L.FLGINTEGRADO,'
      '   L.IDUSUARIOSISTEMA,'
      '   L.FLGERRO,'
      '   L.IDADMINIMOVEL,'
      '   L.ANOPRESTACAO,'
      '   L.MESPRESTACAO,'
      '   L.FLGIMPORTADO,'
      '   L.VLRCOMISSAO,'
      '   L.IDRESERVAORCAMEN,'
      '   L.IDDOCUMENTO,'
      '   L.DATA_BAIXA,'
      '   L.CODSUBCONTA,'
      '   L.FLGTIPOIMOVEL,'
      '   L.IMODATACONSTRUCAO,'
      '   L.IMOAREA,'
      '   L.IMOFRACAOIDEAL,'
      '   L.FLGSTATUSOCUPACAO,'
      '   L.QTDETOTALCOTAS,'
      '   L.IMOLOGRADOURO,'
      '   L.IMONUMERO,'
      '   L.IMOCOMPLEMENTO,'
      '   L.IMOBAIRRO,'
      '   L.IMONOMEENDERECO,'
      '   L.IMOCEP,'
      '   L.IDCARTEIRAINVEST,'
      '   L.CODTIPIMOVEL,'
      '   L.FLGATIVO,'
      '   L.IMOPERCENTRATEIO,'
      '   L.IMOMOEDACOMPRA,'
      '   L.IMOVLRCOMPRA,'
      '   L.IMODATACOMPRA,'
      '   L.IMOMATRICULA,'
      '   L.IMODATAHABITESE,'
      '   L.IDCARTORIO,'
      '   L.STATUS_IMOVEL,'
      '   L.IMOCODIGO,'
      '   L.IMOAREAGERENCIAL,'
      '   L.FLGCATIMOVEL,'
      '   L.IMOVLRREAVAL,'
      '   L.IMODATAREAVAL,'
      '   L.IMOVLRMERCADO,'
      '   L.IMODATAMERCADO,'
      '   L.IMOMOEDAREAVAL,'
      '   L.IMOMOEDAMERCADO,'
      '   L.CONNUMERO,'
      '   L.CONNOME,'
      '   L.CODPORTFORMA,'
      '   L.CONINDICEREAJUSTE,'
      '   L.IDLOCATARIO,'
      '   L.ADMIN_CONTRATO,'
      '   L.CONDATAASSINATURA,'
      '   L.CONDATAINICIO,'
      '   L.CONDATAFIM,'
      '   L.CONDATADENUNCIA,'
      '   L.CONVLRTOTAL,'
      '   L.FLGINDETERMINADO,'
      '   L.CONDIAVENCIMENTO,'
      '   L.CONVLRAJUSTADO,'
      '   L.FLGTIPOALUGUEL,'
      '   L.FLGTIPOCOBRANCA,'
      '   L.CONPERREAJUSTE,'
      '   L.CONDATAREAJUSTE,'
      '   L.CONPERCENTMORA,'
      '   L.CONPERMORA,'
      '   L.CONDIACOMPLEMENTO,'
      '   L.FLGMESPOSTERIOR,'
      '   L.CONVLRMULTA,'
      '   L.CONPERCENTMULTA,'
      '   L.CONVLRMORA,'
      '   L.CONMOEDAMORA,'
      '   L.CONINDICEMORA,'
      '   L.CONMOEDAMULTA,'
      '   L.FLGCOMPETALUGUEL,'
      '   L.STATUS_CONTRATO,'
      '   L.CONPROXREAJUSTE,'
      '   L.CONDATACARENCIA,'
      '   L.CONDATAAVDENUNCIA,'
      '   L.CONDATARENEGOC,'
      '   L.CONDATAAVRENEGOC,'
      '   L.CONDIASTOLERANCIA,'
      '   L.FLGTIPODIAVENC,'
      '   L.FLGTIPODIATOLERA,'
      '   L.FLGFIANCA,'
      '   L.CONDATAFIANCAFIM,'
      '   L.CONDATAFIANCAAV,'
      '   L.CONMESREFREAJUSTE,'
      '   L.FLGMORAPROPORC,'
      '   L.FLGTIPOCONTRATO,'
      '   L.FLGJUROSREMUNERA,'
      '   L.FLGREMUNERAALUG,'
      '   L.CONPERCENTJUROS,'
      '   L.CONPERCENTREMUNER,'
      '   L.IDMSGBOLETO,'
      '   L.CONTAXAADMIN,'
      '   L.FLGCOBRANCAAUTO,'
      '   L.CONDATAFIANCAINI,'
      '   L.CONDIASREPASSE,'
      '   L.IDCONANTERIOR,'
      '   L.CONBANCOFIANCA,'
      '   L.CONVLRFIANCA,'
      '   L.CONPERALUGUEL,'
      '   L.IDATIVIDADE,'
      '   L.CONDIASTOLERACOMP,'
      '   L.CONQUANTVAGAS,'
      '   L.CODTIPDOC,'
      '   L.NODOCUMENTO,'
      '   L.TOT_PAGAR,'
      '   L.TOT_PAGO,'
      '   L.TOT_RECEBER,'
      '   L.TOT_RECEBIDO,'
      '   L.MOEDA_LANC,'
      '   L.COD_MOEDA,'
      '   L.VALOR_OM_LANC,'
      '   L.VALOR_LANC,'
      '   L.PREVISTO,'
      '   L.EFETIVO,'
      '   L.CODFORMA,'
      '   L.REFERENCIAAP,'
      '   L.FORMARECPAG,'
      '   L.CODCENTROCUSTO, L.IDEMPRESA, L.NOME_CENTRO_CUSTO,'
      '   L.IDRECEITAREEMB,'
      '   L.NOSSONUMERO,'
      '   L.IDLANCREEMBDESP,'
      '   L.MSGERROINTEGRA,'
      '   L.PORTADOR_FORMA,'
      '   L.PORTADOR_FORMA_LANC,'
      '   L.FORMA_RECTOPAGTO,'
      '   L.IDCBANCARIA,'
      '   L.CODPORTFORMA_LANC,'
      '   L.IDPROGRAMA,'
      '   L.NUMAPALT,'
      '   T.IDOPERCONTAB,'
      '   PP.IDPATRO,'
      '   PP.IDPLANOPREV'
      ''
      'FROM'
      '   VWLANCAMENTO L,'
      '   TIPOCUSTORECIMOV T,'
      '   ( SELECT P.IDIMOVEL, P.IDPATRO, P.IDPLANOPREV'
      '       FROM PLANOPATROXIMOVEL P,'
      '            ( SELECT IDIMOVEL, COUNT(*) AS QTDE'
      '                FROM PLANOPATROXIMOVEL'
      '               GROUP BY IDIMOVEL ) QP'
      '      WHERE P.IDIMOVEL = QP.IDIMOVEL'
      '        AND QP.QTDE = 1 ) PP'
      ''
      'WHERE  L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO(+)'
      '   AND L.IDIMOVEL = PP.IDIMOVEL(+)'
      '   AND ( IDPESSOA =:PIDPESSOA )'
      
        '   AND ( (:PIDLANCIMOVEL IS NULL) OR (L.IDLANCIMOVEL =:PIDLANCIM' +
        'OVEL) )'
      '   AND ( (:PIDMODULO IS NULL) OR (L.IDMODULO = :PIDMODULO) )'
      
        '   AND ( (:PMESCOMPETENCIA IS NULL) OR (L.MESCOMPETENCIA =:PMESC' +
        'OMPETENCIA) )'
      
        '   AND ( (:PANOCOMPETENCIA IS NULL) OR (L.ANOCOMPETENCIA =:PANOC' +
        'OMPETENCIA) )'
      
        '   AND ( (:PANOMESCOMPETENCIAMAIOR IS NULL) OR ( :PANOMESCOMPETE' +
        'NCIAMAIOR > (TO_CHAR(L.ANOCOMPETENCIA, '#39'0000'#39')||TO_CHAR(L.MESCOM' +
        'PETENCIA, '#39'00'#39')) ) )'
      
        '   AND ( (:PANOMESCOMPETENCIAMENOR IS NULL) OR ( :PANOMESCOMPETE' +
        'NCIAMENOR < (TO_CHAR(L.ANOCOMPETENCIA, '#39'0000'#39')||TO_CHAR(L.MESCOM' +
        'PETENCIA, '#39'00'#39')) ) )'
      
        '   AND ( (:PFLGORIGEMLANC IS NULL) OR (L.FLGORIGEMLANC =:PFLGORI' +
        'GEMLANC) )'
      
        '   AND ( (:PFLGTIPOLANCAMENTO IS NULL) OR (L.FLGTIPOLANCAMENTO =' +
        ':PFLGTIPOLANCAMENTO) )'
      
        '   AND ( (:PFLGTIPOCONTRATO IS NULL) OR (L.FLGTIPOCONTRATO =:PFL' +
        'GTIPOCONTRATO) )'
      
        '   AND ( (:PCODPORTFORMA IS NULL) OR (L.CODPORTFORMA =:PCODPORTF' +
        'ORMA) )'
      
        '   AND ( (:PINDICEREAJUSTE IS NULL) OR (L.CONINDICEREAJUSTE =:PI' +
        'NDICEREAJUSTE) )'
      
        '   AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (L.IDCONTRATOIMOVEL =:P' +
        'IDCONTRATOIMOVEL) )'
      '   AND ( (:PIDIMOVEL IS NULL) OR (L.IDIMOVEL =:PIDIMOVEL) )'
      
        '   AND ( (:PIDTIPOCUSTORECIMO IS NULL) OR (L.IDTIPOCUSTORECIMO =' +
        ':PIDTIPOCUSTORECIMO) )'
      '   AND ( (:PIDFORCLI IS NULL) OR (L.IDFORCLI =:PIDFORCLI) )'
      
        '   AND ( (:PIDUSUARIOSISTEMA IS NULL) OR (L.IDUSUARIOSISTEMA =:P' +
        'IDUSUARIOSISTEMA) )'
      
        '   AND ( (:PIDADMINIMOVEL IS NULL) OR (L.IDADMINIMOVEL =:PIDADMI' +
        'NIMOVEL) )'
      
        '   AND ( (:PADMIN_CONTRATO IS NULL) OR (L.ADMIN_CONTRATO =:PADMI' +
        'N_CONTRATO) )'
      
        '   AND ( (:PIDRESPONSAVEL IS NULL) OR (L.IDRESPONSAVEL =:PIDRESP' +
        'ONSAVEL) )'
      '   AND ( (:PRECPAG IS NULL) OR (L.RECPAG =:PRECPAG) )'
      
        '   AND ( (:PTRGDTINCLUSAO IS NULL) OR (L.TRGDTINCLUSAO BETWEEN :' +
        'PTRGDTINCLUSAO1 AND :PTRGDTINCLUSAO2) )'
      
        '   AND ( (:PDATALANCAMENTO IS NULL) OR (L.DATALANCAMENTO BETWEEN' +
        ' :PDATALANCAMENTO1 AND :PDATALANCAMENTO2) )'
      
        '   AND ( (:PDATAVENCIMENTO IS NULL) OR (L.DATAVENCIMENTO BETWEEN' +
        ' :PDATAVENCIMENTO1 AND :PDATAVENCIMENTO2) )'
      ''
      '   AND ('
      
        '   ((:PRECEITAREEMBNULL IS NOT NULL) AND (L.IDRECEITAREEMB IS NO' +
        'T NULL)) OR  /* RECEITA DE REEMBOLSO NÃO NULA(LANÇAMENTOS REEMBO' +
        'LSÁVEIS) */'
      
        '   ((:PIDRECEITAREEMB IS NULL) OR (L.IDRECEITAREEMB =:PIDRECEITA' +
        'REEMB)))'
      ''
      '   AND ('
      
        '   ((:PRECEITAREEMBNOTNULL IS NOT NULL) AND (L.IDLANCREEMBDESP I' +
        'S NULL)) OR'
      
        '   ((:PIDLANCREEMBDESP IS NULL) OR (L.IDLANCREEMBDESP =:PIDLANCR' +
        'EEMBDESP)))'
      ''
      '   AND ('
      '   ((:PDOCNULL IS NOT NULL) AND (L.CODDOCUMENTO IS NULL)) OR'
      
        '   ((:PCODDOCUMENTO IS NULL) OR (L.CODDOCUMENTO =:PCODDOCUMENTO)' +
        '))'
      ''
      '   AND ('
      '   ((:PPLNNULL IS NOT NULL) AND (L.PLNCODIGO IS NULL)) OR'
      '   ((:PPLNCODIGO IS NULL) OR (L.PLNCODIGO =:PPLNCODIGO)))'
      ''
      '   AND ('
      
        '   ((:PINTEGRADONULL IS NOT NULL) AND (L.FLGINTEGRADO IS NULL)) ' +
        'OR'
      
        '   ((:PFLGINTEGRADO IS NULL) OR (L.FLGINTEGRADO =:PFLGINTEGRADO)' +
        '))'
      ''
      '   AND ('
      
        '   ((:PESTORNADONULL IS NOT NULL) AND (L.FLGESTORNADO IS NULL)) ' +
        'OR'
      
        '   ((:PFLGESTORNADO IS NULL) OR (L.FLGESTORNADO =:PFLGESTORNADO)' +
        '))'
      ''
      '   AND ('
      '   ((:PAGRUPARNULL IS NOT NULL) AND (L.FLGAGRUPAR IS NULL)) OR'
      '   ((:PFLGAGRUPAR IS NULL) OR (L.FLGAGRUPAR =:PFLGAGRUPAR)))'
      ''
      '   AND ('
      '   ((:PAGRUPADONULL IS NOT NULL) AND (L.FLGAGRUPADO IS NULL)) OR'
      '   ((:PFLGAGRUPADO IS NULL) OR (L.FLGAGRUPADO =:PFLGAGRUPADO)))'
      ''
      '   AND ('
      '   ((:PNODOCNULL IS NOT NULL) AND (L.NODOCUMENTO IS NULL)) OR'
      '   ((:PNODOCUMENTO IS NULL) OR (L.NODOCUMENTO =:PNODOCUMENTO)))'
      ''
      '   AND ('
      '   ((:PNODOCNULL IS NOT NULL) AND (L.NODOCUMENTO IS NULL)) OR'
      '   ((:PIDDOCUMENTO IS NULL) OR (L.IDDOCUMENTO =:PIDDOCUMENTO)))'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    UpdateObject = updLancImovel
    ValidateWithMask = True
    Left = 288
    Top = 92
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
        Name = 'PIDLANCIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOMESCOMPETENCIAMAIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOMESCOMPETENCIAMAIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOMESCOMPETENCIAMENOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOMESCOMPETENCIAMENOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGORIGEMLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGORIGEMLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOLANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOLANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PINDICEREAJUSTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PINDICEREAJUSTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
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
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOSISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOSISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PADMIN_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PADMIN_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PTRGDTINCLUSAO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECEITAREEMBNULL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRECEITAREEMB'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRECEITAREEMB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECEITAREEMBNOTNULL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLANCREEMBDESP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLANCREEMBDESP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PDOCNULL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPLNNULL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PINTEGRADONULL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGINTEGRADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGINTEGRADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PESTORNADONULL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGESTORNADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGESTORNADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PAGRUPARNULL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGAGRUPAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGAGRUPAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PAGRUPADONULL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGAGRUPADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGAGRUPADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PNODOCNULL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PNODOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PNODOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PNODOCNULL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryLancImovel_ORIGEMLANC: TStringField
      FieldKind = fkCalculated
      FieldName = '_ORIGEMLANC'
      Visible = False
      Size = 25
      Calculated = True
    end
    object qryLancImovel_MESCOMPETENCIA: TStringField
      FieldKind = fkCalculated
      FieldName = '_MESCOMPETENCIA'
      Visible = False
      Size = 15
      Calculated = True
    end
    object qryLancImovel_DESCERRO: TStringField
      FieldKind = fkCalculated
      FieldName = '_DESCERRO'
      Visible = False
      Size = 200
      Calculated = True
    end
    object qryLancImovelNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryLancImovelNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Size = 60
    end
    object qryLancImovelIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryLancImovelCONTRATO_EXTENSO: TStringField
      FieldName = 'CONTRATO_EXTENSO'
      Size = 83
    end
    object qryLancImovelDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object qryLancImovelFORCLI_DOC: TFloatField
      FieldName = 'FORCLI_DOC'
    end
    object qryLancImovelSTATUS_DOC: TStringField
      FieldName = 'STATUS_DOC'
      Size = 1
    end
    object qryLancImovelDOC_CAPCAR: TFloatField
      FieldName = 'DOC_CAPCAR'
    end
    object qryLancImovelPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
    end
    object qryLancImovelLOGIN_USUARIO: TStringField
      FieldName = 'LOGIN_USUARIO'
      FixedChar = True
    end
    object qryLancImovelNF_USUARIO: TStringField
      FieldName = 'NF_USUARIO'
      Size = 60
    end
    object qryLancImovelNF_FORCLI: TStringField
      FieldName = 'NF_FORCLI'
      Size = 60
    end
    object qryLancImovelRS_FORCLI: TStringField
      FieldName = 'RS_FORCLI'
      Size = 60
    end
    object qryLancImovelVLRLANCOMRECEB: TFloatField
      FieldName = 'VLRLANCOMRECEB'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancImovelVLRLANCOMPAGAR: TFloatField
      FieldName = 'VLRLANCOMPAGAR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancImovelMOEDARECEB: TFloatField
      FieldName = 'MOEDARECEB'
    end
    object qryLancImovelVLRLANCRECEB: TFloatField
      FieldName = 'VLRLANCRECEB'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancImovelVLRLANCPAGAR: TFloatField
      FieldName = 'VLRLANCPAGAR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancImovelMOEDAPAGAR: TFloatField
      FieldName = 'MOEDAPAGAR'
    end
    object qryLancImovelIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryLancImovelIDLANCIMOVEL: TFloatField
      FieldName = 'IDLANCIMOVEL'
    end
    object qryLancImovelIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryLancImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryLancImovelIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object qryLancImovelRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryLancImovelCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryLancImovelIDRATEIODOCUM: TFloatField
      FieldName = 'IDRATEIODOCUM'
    end
    object qryLancImovelPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryLancImovelDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object qryLancImovelDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryLancImovelMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object qryLancImovelANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryLancImovelFLGTIPOLANCAMENTO: TStringField
      FieldName = 'FLGTIPOLANCAMENTO'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelFLGORIGEMLANC: TStringField
      FieldName = 'FLGORIGEMLANC'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryLancImovelTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryLancImovelTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qryLancImovelMESREFERENCIA: TFloatField
      FieldName = 'MESREFERENCIA'
    end
    object qryLancImovelANOREFERENCIA: TFloatField
      FieldName = 'ANOREFERENCIA'
    end
    object qryLancImovelFLGAGRUPAR: TStringField
      FieldName = 'FLGAGRUPAR'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelFLGAGRUPADO: TFloatField
      FieldName = 'FLGAGRUPADO'
    end
    object qryLancImovelVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancImovelVLRMULTA: TFloatField
      FieldName = 'VLRMULTA'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancImovelVLRCORRECAOMON: TFloatField
      FieldName = 'VLRCORRECAOMON'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancImovelDATACORRECAO: TDateTimeField
      FieldName = 'DATACORRECAO'
    end
    object qryLancImovelFLGMULTACALCULADA: TFloatField
      FieldName = 'FLGMULTACALCULADA'
    end
    object qryLancImovelFLGINTEGRADO: TFloatField
      FieldName = 'FLGINTEGRADO'
    end
    object qryLancImovelIDUSUARIOSISTEMA: TFloatField
      FieldName = 'IDUSUARIOSISTEMA'
    end
    object qryLancImovelFLGERRO: TFloatField
      FieldName = 'FLGERRO'
    end
    object qryLancImovelIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
    end
    object qryLancImovelANOPRESTACAO: TFloatField
      FieldName = 'ANOPRESTACAO'
    end
    object qryLancImovelMESPRESTACAO: TFloatField
      FieldName = 'MESPRESTACAO'
    end
    object qryLancImovelFLGIMPORTADO: TFloatField
      FieldName = 'FLGIMPORTADO'
    end
    object qryLancImovelVLRCOMISSAO: TFloatField
      FieldName = 'VLRCOMISSAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancImovelIDRESERVAORCAMEN: TFloatField
      FieldName = 'IDRESERVAORCAMEN'
    end
    object qryLancImovelIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object qryLancImovelDATA_BAIXA: TDateTimeField
      FieldName = 'DATA_BAIXA'
    end
    object qryLancImovelCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qryLancImovelFLGTIPOIMOVEL: TFloatField
      FieldName = 'FLGTIPOIMOVEL'
    end
    object qryLancImovelIMODATACONSTRUCAO: TDateTimeField
      FieldName = 'IMODATACONSTRUCAO'
    end
    object qryLancImovelIMOAREA: TFloatField
      FieldName = 'IMOAREA'
    end
    object qryLancImovelIMOFRACAOIDEAL: TFloatField
      FieldName = 'IMOFRACAOIDEAL'
    end
    object qryLancImovelFLGSTATUSOCUPACAO: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelQTDETOTALCOTAS: TFloatField
      FieldName = 'QTDETOTALCOTAS'
    end
    object qryLancImovelIMOLOGRADOURO: TStringField
      FieldName = 'IMOLOGRADOURO'
      Size = 80
    end
    object qryLancImovelIMONUMERO: TStringField
      FieldName = 'IMONUMERO'
      Size = 8
    end
    object qryLancImovelIMOCOMPLEMENTO: TStringField
      FieldName = 'IMOCOMPLEMENTO'
    end
    object qryLancImovelIMOBAIRRO: TStringField
      FieldName = 'IMOBAIRRO'
    end
    object qryLancImovelIMONOMEENDERECO: TStringField
      FieldName = 'IMONOMEENDERECO'
      Size = 60
    end
    object qryLancImovelIMOCEP: TStringField
      FieldName = 'IMOCEP'
      Size = 8
    end
    object qryLancImovelIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryLancImovelCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryLancImovelFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object qryLancImovelIMOPERCENTRATEIO: TFloatField
      FieldName = 'IMOPERCENTRATEIO'
    end
    object qryLancImovelIMOMOEDACOMPRA: TFloatField
      FieldName = 'IMOMOEDACOMPRA'
    end
    object qryLancImovelIMOVLRCOMPRA: TFloatField
      FieldName = 'IMOVLRCOMPRA'
    end
    object qryLancImovelIMODATACOMPRA: TDateTimeField
      FieldName = 'IMODATACOMPRA'
    end
    object qryLancImovelIMOMATRICULA: TStringField
      FieldName = 'IMOMATRICULA'
    end
    object qryLancImovelIMODATAHABITESE: TDateTimeField
      FieldName = 'IMODATAHABITESE'
    end
    object qryLancImovelIDCARTORIO: TFloatField
      FieldName = 'IDCARTORIO'
    end
    object qryLancImovelSTATUS_IMOVEL: TStringField
      FieldName = 'STATUS_IMOVEL'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryLancImovelIMOAREAGERENCIAL: TFloatField
      FieldName = 'IMOAREAGERENCIAL'
    end
    object qryLancImovelFLGCATIMOVEL: TStringField
      FieldName = 'FLGCATIMOVEL'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelIMOVLRREAVAL: TFloatField
      FieldName = 'IMOVLRREAVAL'
    end
    object qryLancImovelIMODATAREAVAL: TDateTimeField
      FieldName = 'IMODATAREAVAL'
    end
    object qryLancImovelIMOVLRMERCADO: TFloatField
      FieldName = 'IMOVLRMERCADO'
    end
    object qryLancImovelIMODATAMERCADO: TDateTimeField
      FieldName = 'IMODATAMERCADO'
    end
    object qryLancImovelIMOMOEDAREAVAL: TFloatField
      FieldName = 'IMOMOEDAREAVAL'
    end
    object qryLancImovelIMOMOEDAMERCADO: TFloatField
      FieldName = 'IMOMOEDAMERCADO'
    end
    object qryLancImovelCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryLancImovelCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryLancImovelCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryLancImovelCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object qryLancImovelIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object qryLancImovelADMIN_CONTRATO: TFloatField
      FieldName = 'ADMIN_CONTRATO'
    end
    object qryLancImovelCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
    end
    object qryLancImovelCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryLancImovelCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
    object qryLancImovelCONDATADENUNCIA: TDateTimeField
      FieldName = 'CONDATADENUNCIA'
    end
    object qryLancImovelCONVLRTOTAL: TFloatField
      FieldName = 'CONVLRTOTAL'
    end
    object qryLancImovelFLGINDETERMINADO: TStringField
      FieldName = 'FLGINDETERMINADO'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelCONDIAVENCIMENTO: TFloatField
      FieldName = 'CONDIAVENCIMENTO'
    end
    object qryLancImovelCONVLRAJUSTADO: TFloatField
      FieldName = 'CONVLRAJUSTADO'
    end
    object qryLancImovelFLGTIPOALUGUEL: TStringField
      FieldName = 'FLGTIPOALUGUEL'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelFLGTIPOCOBRANCA: TStringField
      FieldName = 'FLGTIPOCOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
    end
    object qryLancImovelCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
    end
    object qryLancImovelCONPERCENTMORA: TFloatField
      FieldName = 'CONPERCENTMORA'
    end
    object qryLancImovelCONPERMORA: TStringField
      FieldName = 'CONPERMORA'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelCONDIACOMPLEMENTO: TFloatField
      FieldName = 'CONDIACOMPLEMENTO'
    end
    object qryLancImovelFLGMESPOSTERIOR: TFloatField
      FieldName = 'FLGMESPOSTERIOR'
    end
    object qryLancImovelCONVLRMULTA: TFloatField
      FieldName = 'CONVLRMULTA'
    end
    object qryLancImovelCONPERCENTMULTA: TFloatField
      FieldName = 'CONPERCENTMULTA'
    end
    object qryLancImovelCONVLRMORA: TFloatField
      FieldName = 'CONVLRMORA'
    end
    object qryLancImovelCONMOEDAMORA: TFloatField
      FieldName = 'CONMOEDAMORA'
    end
    object qryLancImovelCONINDICEMORA: TFloatField
      FieldName = 'CONINDICEMORA'
    end
    object qryLancImovelCONMOEDAMULTA: TFloatField
      FieldName = 'CONMOEDAMULTA'
    end
    object qryLancImovelFLGCOMPETALUGUEL: TStringField
      FieldName = 'FLGCOMPETALUGUEL'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelSTATUS_CONTRATO: TStringField
      FieldName = 'STATUS_CONTRATO'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelCONPROXREAJUSTE: TDateTimeField
      FieldName = 'CONPROXREAJUSTE'
    end
    object qryLancImovelCONDATACARENCIA: TDateTimeField
      FieldName = 'CONDATACARENCIA'
    end
    object qryLancImovelCONDATAAVDENUNCIA: TDateTimeField
      FieldName = 'CONDATAAVDENUNCIA'
    end
    object qryLancImovelCONDATARENEGOC: TDateTimeField
      FieldName = 'CONDATARENEGOC'
    end
    object qryLancImovelCONDATAAVRENEGOC: TDateTimeField
      FieldName = 'CONDATAAVRENEGOC'
    end
    object qryLancImovelCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
    end
    object qryLancImovelFLGTIPODIAVENC: TStringField
      FieldName = 'FLGTIPODIAVENC'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelFLGFIANCA: TStringField
      FieldName = 'FLGFIANCA'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelCONDATAFIANCAFIM: TDateTimeField
      FieldName = 'CONDATAFIANCAFIM'
    end
    object qryLancImovelCONDATAFIANCAAV: TDateTimeField
      FieldName = 'CONDATAFIANCAAV'
    end
    object qryLancImovelCONMESREFREAJUSTE: TStringField
      FieldName = 'CONMESREFREAJUSTE'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelFLGMORAPROPORC: TFloatField
      FieldName = 'FLGMORAPROPORC'
    end
    object qryLancImovelFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      FixedChar = True
      Size = 1
    end
    object qryLancImovelFLGJUROSREMUNERA: TFloatField
      FieldName = 'FLGJUROSREMUNERA'
    end
    object qryLancImovelFLGREMUNERAALUG: TFloatField
      FieldName = 'FLGREMUNERAALUG'
    end
    object qryLancImovelCONPERCENTJUROS: TFloatField
      FieldName = 'CONPERCENTJUROS'
    end
    object qryLancImovelCONPERCENTREMUNER: TFloatField
      FieldName = 'CONPERCENTREMUNER'
    end
    object qryLancImovelIDMSGBOLETO: TFloatField
      FieldName = 'IDMSGBOLETO'
    end
    object qryLancImovelCONTAXAADMIN: TFloatField
      FieldName = 'CONTAXAADMIN'
    end
    object qryLancImovelFLGCOBRANCAAUTO: TFloatField
      FieldName = 'FLGCOBRANCAAUTO'
    end
    object qryLancImovelCONDATAFIANCAINI: TDateTimeField
      FieldName = 'CONDATAFIANCAINI'
    end
    object qryLancImovelCONDIASREPASSE: TFloatField
      FieldName = 'CONDIASREPASSE'
    end
    object qryLancImovelIDCONANTERIOR: TFloatField
      FieldName = 'IDCONANTERIOR'
    end
    object qryLancImovelCONBANCOFIANCA: TFloatField
      FieldName = 'CONBANCOFIANCA'
    end
    object qryLancImovelCONVLRFIANCA: TFloatField
      FieldName = 'CONVLRFIANCA'
    end
    object qryLancImovelCONPERALUGUEL: TFloatField
      FieldName = 'CONPERALUGUEL'
    end
    object qryLancImovelIDATIVIDADE: TFloatField
      FieldName = 'IDATIVIDADE'
    end
    object qryLancImovelCONDIASTOLERACOMP: TFloatField
      FieldName = 'CONDIASTOLERACOMP'
    end
    object qryLancImovelCONQUANTVAGAS: TFloatField
      FieldName = 'CONQUANTVAGAS'
    end
    object qryLancImovelCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object qryLancImovelNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryLancImovelTOT_PAGAR: TFloatField
      FieldName = 'TOT_PAGAR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancImovelTOT_PAGO: TFloatField
      FieldName = 'TOT_PAGO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancImovelTOT_RECEBER: TFloatField
      FieldName = 'TOT_RECEBER'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancImovelTOT_RECEBIDO: TFloatField
      FieldName = 'TOT_RECEBIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancImovelMOEDA_LANC: TStringField
      FieldName = 'MOEDA_LANC'
      Size = 10
    end
    object qryLancImovelCOD_MOEDA: TFloatField
      FieldName = 'COD_MOEDA'
    end
    object qryLancImovelVALOR_OM_LANC: TFloatField
      FieldName = 'VALOR_OM_LANC'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancImovelVALOR_LANC: TFloatField
      FieldName = 'VALOR_LANC'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancImovelPREVISTO: TFloatField
      FieldName = 'PREVISTO'
    end
    object qryLancImovelEFETIVO: TFloatField
      FieldName = 'EFETIVO'
    end
    object qryLancImovelCODFORMA: TFloatField
      FieldName = 'CODFORMA'
    end
    object qryLancImovelREFERENCIAAP: TStringField
      FieldName = 'REFERENCIAAP'
      Size = 30
    end
    object qryLancImovelFORMARECPAG: TStringField
      FieldName = 'FORMARECPAG'
      Size = 30
    end
    object qryLancImovelCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryLancImovelIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryLancImovelNOME_CENTRO_CUSTO: TStringField
      FieldName = 'NOME_CENTRO_CUSTO'
      Size = 30
    end
    object qryLancImovelIDRECEITAREEMB: TFloatField
      FieldName = 'IDRECEITAREEMB'
    end
    object qryLancImovelNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
    end
    object qryLancImovelIDLANCREEMBDESP: TFloatField
      FieldName = 'IDLANCREEMBDESP'
    end
    object qryLancImovelMSGERROINTEGRA: TStringField
      FieldName = 'MSGERROINTEGRA'
      FixedChar = True
      Size = 120
    end
    object qryLancImovelPORTADOR_FORMA: TStringField
      FieldName = 'PORTADOR_FORMA'
      Size = 50
    end
    object qryLancImovelPORTADOR_FORMA_LANC: TStringField
      FieldName = 'PORTADOR_FORMA_LANC'
      Size = 50
    end
    object qryLancImovelFORMA_RECTOPAGTO: TStringField
      FieldName = 'FORMA_RECTOPAGTO'
      Size = 50
    end
    object qryLancImovelIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryLancImovelCODPORTFORMA_LANC: TFloatField
      FieldName = 'CODPORTFORMA_LANC'
    end
    object qryLancImovelIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object qryLancImovelIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
    end
    object qryLancImovelNUMAPALT: TFloatField
      FieldName = 'NUMAPALT'
    end
    object qryLancImovelDTINICTBDIARIA: TDateTimeField
      FieldName = 'DTINICTBDIARIA'
    end
    object qryLancImovelDTFIMCTBDIARIA: TDateTimeField
      FieldName = 'DTFIMCTBDIARIA'
    end
    object qryLancImovelIDOPERCONTAB: TFloatField
      FieldName = 'IDOPERCONTAB'
    end
    object qryLancImovelIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryLancImovelIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryLancImovelDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
  end
  object qryDeleteMsgBoleto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      '   MSGBOLETO'
      ''
      'WHERE'
      '   IDDOCUMENTO = :PIDDOCUMENTO')
    ValidateWithMask = True
    Left = 48
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateMsgBoleto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   OBSLANCIMOVEL'
      'WHERE'
      '   (IDDOCUMENTO = :PIDDOCUMENTO)')
    ValidateWithMask = True
    Left = 48
    Top = 276
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateLinhaMsg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   O.IDDOCUMENTO, O.OBS'
      ''
      'FROM'
      '   OBSLANCIMOVEL O'
      ''
      'WHERE'
      '   (O.IDDOCUMENTO =:PIDDOCUMENTO)')
    ValidateWithMask = True
    Left = 48
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'OBSLANCIMOVEL.IDDOCUMENTO'
    end
    object MemoField1: TMemoField
      FieldName = 'OBS'
      Origin = 'OBSLANCIMOVEL.OBS'
      BlobType = ftMemo
      Size = 1000
    end
  end
  object qryInsertLinhaMsg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO LINHAMSGBOLETO'
      '('
      'IDMSGBOLETO,'
      'LMBNUMLINHA,'
      'LMBTEXTOLINHA'
      ')'
      'VALUES'
      '('
      ':PIDMSGBOLETO,'
      ':PLMBNUMLINHA,'
      ':PLMBTEXTOLINHA'
      ')'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 252
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMSGBOLETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLMBNUMLINHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLMBTEXTOLINHA'
        ParamType = ptUnknown
      end>
    object FloatField2: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'OBSLANCIMOVEL.IDDOCUMENTO'
    end
    object MemoField2: TMemoField
      FieldName = 'OBS'
      Origin = 'OBSLANCIMOVEL.OBS'
      BlobType = ftMemo
      Size = 1000
    end
  end
  object qryInsertMsgBoleto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO MSGBOLETO'
      '('
      'IDMSGBOLETO,'
      'IDMODULO,'
      'MSGDESCRICAO,'
      'IDDOCUMENTO,'
      'FLGTIPOCONTRATO,'
      'FLGCURINGA'
      ')'
      'VALUES'
      '('
      ':PIDMSGBOLETO,'
      ':PIDMODULO,'
      ':PMSGDESCRICAO,'
      ':PIDDOCUMENTO,'
      ':PFLGTIPOCONTRATO,'
      ':PFLGCURINGA'
      ')'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMSGBOLETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMSGDESCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGCURINGA'
        ParamType = ptUnknown
      end>
  end
  object qrySelectMsgLanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.IDMSGBOLETO, M.MSGDESCRICAO, M.IDDOCUMENTO, M.IDMODULO,'
      ''
      '   L1.LMBTEXTOLINHA AS TEXTO_LINHA_1,'
      '   L2.LMBTEXTOLINHA AS TEXTO_LINHA_2,'
      '   L3.LMBTEXTOLINHA AS TEXTO_LINHA_3,'
      '   L4.LMBTEXTOLINHA AS TEXTO_LINHA_4,'
      '   L5.LMBTEXTOLINHA AS TEXTO_LINHA_5,'
      '   L6.LMBTEXTOLINHA AS TEXTO_LINHA_6,'
      '   L7.LMBTEXTOLINHA AS TEXTO_LINHA_7,'
      '   L8.LMBTEXTOLINHA AS TEXTO_LINHA_8,'
      '   L9.LMBTEXTOLINHA AS TEXTO_LINHA_9'
      ''
      'FROM'
      '   MSGBOLETO M,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 1'
      '   ) L1,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 2'
      '   ) L2,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 3'
      '   ) L3,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 4'
      '   ) L4,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 5'
      '   ) L5,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 6'
      '   ) L6,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 7'
      '   ) L7,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 8'
      '   ) L8,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 9'
      '   ) L9'
      ''
      'WHERE'
      '   ( (:PIDMSGBOLETO IS NULL) OR (M.IDMSGBOLETO =:PIDMSGBOLETO) )'
      
        '   AND ( (:PIDDOCUMENTO IS NULL) OR (M.IDDOCUMENTO =:PIDDOCUMENT' +
        'O) )'
      '   AND ( (:PIDMODULO IS NULL) OR (M.IDMODULO =:PIDMODULO) )'
      ''
      '   AND ( M.IDMSGBOLETO = L1.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L2.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L3.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L4.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L5.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L6.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L7.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L8.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L9.IDMSGBOLETO(+) )'
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 48
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMSGBOLETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMSGBOLETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end>
    object qrySelectMsgLancIDMSGBOLETO: TFloatField
      FieldName = 'IDMSGBOLETO'
    end
    object qrySelectMsgLancMSGDESCRICAO: TStringField
      FieldName = 'MSGDESCRICAO'
      Size = 60
    end
    object qrySelectMsgLancIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object qrySelectMsgLancTEXTO_LINHA_1: TStringField
      FieldName = 'TEXTO_LINHA_1'
      Size = 69
    end
    object qrySelectMsgLancTEXTO_LINHA_2: TStringField
      FieldName = 'TEXTO_LINHA_2'
      Size = 69
    end
    object qrySelectMsgLancTEXTO_LINHA_3: TStringField
      FieldName = 'TEXTO_LINHA_3'
      Size = 69
    end
    object qrySelectMsgLancTEXTO_LINHA_4: TStringField
      FieldName = 'TEXTO_LINHA_4'
      Size = 69
    end
    object qrySelectMsgLancTEXTO_LINHA_5: TStringField
      FieldName = 'TEXTO_LINHA_5'
      Size = 69
    end
    object qrySelectMsgLancTEXTO_LINHA_6: TStringField
      FieldName = 'TEXTO_LINHA_6'
      Size = 69
    end
    object qrySelectMsgLancTEXTO_LINHA_7: TStringField
      FieldName = 'TEXTO_LINHA_7'
      Size = 69
    end
    object qrySelectMsgLancTEXTO_LINHA_8: TStringField
      FieldName = 'TEXTO_LINHA_8'
      Size = 69
    end
    object qrySelectMsgLancTEXTO_LINHA_9: TStringField
      FieldName = 'TEXTO_LINHA_9'
      Size = 69
    end
    object qrySelectMsgLancIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
  end
  object qrySelectAlteraDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   LD.CODDOCUMENTO, LD.NUMLANCTO,'
      '   LD.CODALTERADOR, LD.PLNCODIGO,'
      '   LD.DATALANCTO, LD.VALOR, LD.VALOROUTRAMOEDA,'
      '   LD.DEBCRE, LD.OPERACAO, LD.HISTORICOCOMPL,'
      '   R.DATABAIXA,'
      
        '   DECODE(RTRIM(LD.OPERACAO),'#39'4'#39',A.DESCRICAO,'#39'LANÇAMENTO DE BAIX' +
        'A'#39') AS DESCRICAO,'
      ''
      '   D.NODOCUMENTO,'
      ''
      '   P.NOME, LD.TRGDTINCLUSAO'
      ''
      'FROM'
      
        '   LANCTODOCUM LD, TIPOALTERADOR A, DOCUMENTO D, PESSOA P, RECBT' +
        'OPAGTO R'
      ''
      'WHERE'
      '   ( LD.CODDOCUMENTO =:PCODDOCUMENTO )'
      '   AND ( RTRIM(LD.OPERACAO) in('#39'4'#39','#39'5'#39') )'
      '   AND ( LD.CODALTERADOR = A.CODALTERADOR(+) )'
      '   AND ( LD.CODDOCUMENTO = R.CODDOCUMENTO(+) )'
      '   AND ( LD.NUMLANCTO    = R.NUMLANCTO(+) )'
      '   AND ( LD.CODDOCUMENTO = D.CODDOCUMENTO )'
      '   AND ( P.IDPESSOA      = LD.IDUSUARIOINCLUSAO)'
      ''
      'ORDER BY'
      '   LD.DATALANCTO, A.DESCRICAO'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qrySelectAlteraDocDESCRICAO: TStringField
      DisplayLabel = 'Tipo do Alterador'
      DisplayWidth = 69
      FieldName = 'DESCRICAO'
      Origin = 'TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
    object qrySelectAlteraDocVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VALOR'
      Origin = 'LANCTODOCUM.VALOR'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qrySelectAlteraDocDATALANCTO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATALANCTO'
      Origin = 'LANCTODOCUM.DATALANCTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object qrySelectAlteraDocHISTORICOCOMPL: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 27
      FieldName = 'HISTORICOCOMPL'
      Origin = 'LANCTODOCUM.HISTORICOCOMPL'
      Visible = False
      Size = 60
    end
    object qrySelectAlteraDocCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'LANCTODOCUM.CODDOCUMENTO'
      Visible = False
    end
    object qrySelectAlteraDocNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = 'LANCTODOCUM.NUMLANCTO'
      Visible = False
    end
    object qrySelectAlteraDocCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'LANCTODOCUM.CODALTERADOR'
      Visible = False
    end
    object qrySelectAlteraDocPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'LANCTODOCUM.PLNCODIGO'
      Visible = False
    end
    object qrySelectAlteraDocVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
      Origin = 'LANCTODOCUM.VALOROUTRAMOEDA'
      Visible = False
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qrySelectAlteraDocDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Origin = 'LANCTODOCUM.DEBCRE'
      Visible = False
      Size = 1
    end
    object qrySelectAlteraDocOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Origin = 'LANCTODOCUM.OPERACAO'
      Visible = False
      Size = 2
    end
    object qrySelectAlteraDocNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
      Origin = 'DOCUMENTO.NODOCUMENTO'
      Visible = False
    end
    object qrySelectAlteraDocNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qrySelectAlteraDocTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qrySelectAlteraDocDATABAIXA: TDateTimeField
      FieldName = 'DATABAIXA'
    end
  end
  object qryDeleteLinhaMsg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      '   LINHAMSGBOLETO'
      ''
      'WHERE'
      '   ((:PIDMSGBOLETO IS NULL) OR (IDMSGBOLETO = :PIDMSGBOLETO))'
      
        '   AND ((:PLMBNUMLINHA IS NULL) OR (LMBNUMLINHA = :PLMBNUMLINHA)' +
        ')'
      '')
    ValidateWithMask = True
    Left = 48
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMSGBOLETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMSGBOLETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLMBNUMLINHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLMBNUMLINHA'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteMsgCnab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      '   MENSAGENSCNAB'
      ''
      'WHERE'
      '   CODDOCUMENTO = :PCODDOCUMENTO')
    ValidateWithMask = True
    Left = 48
    Top = 203
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   DOCUMENTO'
      'SET'
      '   EMISBLOQ = '#39'N'#39','
      '   CONTROLEREMESSA = NULL'
      'WHERE'
      '   CODDOCUMENTO = :PCODDOCUMENTO'
      ' ')
    ValidateWithMask = True
    Left = 174
    Top = 237
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qrySelectLancImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDRESERVAORCAMEN'
      '   '
      'FROM'
      '   VWLANCAMENTO'
      ''
      'WHERE'
      '   IDDOCUMENTO = :PIDDOCUMENTO')
    ValidateWithMask = True
    Left = 288
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qrySelectLancImovelIDRESERVAORCAMEN: TFloatField
      FieldName = 'IDRESERVAORCAMEN'
      Origin = 'BASEDADOS.VWLANCAMENTO.IDRESERVAORCAMEN'
    end
  end
  object qryDelConciliaDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM CONCILIADOC'
      'WHERE'
      
        '       ( (:PFLGTIPO IS NULL)          OR (FLGTIPO = :PFLGTIPO) )' +
        ' '
      
        '   AND ( (:PIDDOCUMENTO IS NULL)      OR (IDDOCUMENTO = :PIDDOCU' +
        'MENTO) )'
      
        '   AND ( (:PIDPARCFINANCIMOV IS NULL) OR (IDPARCFINANCIMOV = :PI' +
        'DPARCFINANCIMOV) )'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 297
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'PFLGTIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPARCFINANCIMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPARCFINANCIMOV'
        ParamType = ptUnknown
      end>
  end
  object qryInsConciliaDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CONCILIADOC'
      '('
      '  IDCONCILIADOC,'
      '  IDDOCUMENTO,'
      '  IDPARCFINANCIMOV,'
      '  IDUSUARIO,'
      '  IDDOCDIVERGE,'
      '  NUMLANCTODIVERGE,'
      '  DIFDIAS,'
      '  DIFVLR,'
      '  MOTIVO,'
      '  DATA,'
      '  FLGTIPO'
      ')'
      'VALUES'
      '('
      '  :PIDCONCILIADOC,'
      '  :PIDDOCUMENTO,'
      '  :PIDPARCFINANCIMOV,'
      '  :PIDUSUARIO,'
      '  :PIDDOCDIVERGE,'
      '  :PNUMLANCTODIVERGE,'
      '  :PDIFDIAS,'
      '  :PDIFVLR,'
      '  :PMOTIVO,'
      '  :PDATA,'
      '  :PFLGTIPO'
      ')')
    ValidateWithMask = True
    Left = 297
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONCILIADOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPARCFINANCIMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCDIVERGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PNUMLANCTODIVERGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PDIFDIAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PDIFVLR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMOTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPO'
        ParamType = ptUnknown
      end>
  end
  object qryConciliaDoc: TwwQuery
    OnCalcFields = qryConciliaDocCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  C.IDDOCUMENTO,'
      '  C.IDPARCFINANCIMOV,'
      '  C.IDUSUARIO,'
      '  C.IDDOCDIVERGE,'
      '  C.NUMLANCTODIVERGE,'
      '  C.DIFDIAS,'
      '  C.DIFVLR,'
      '  C.MOTIVO,'
      '  C.DATA,'
      '  C.FLGTIPO,'
      '  U.NOMEUSUARIO'
      ''
      'FROM'
      '   CONCILIADOC C, USUARIOSISTEMA U'
      ''
      'WHERE'
      '   C.IDUSUARIO = U.IDUSUARIO'
      
        '   AND ( (:PIDDOCUMENTO IS NULL) OR (C.IDDOCUMENTO = :PIDDOCUMEN' +
        'TO) )'
      
        '   AND ( (:PIDPARCFINANCIMOV IS NULL) OR (C.IDPARCFINANCIMOV = :' +
        'PIDPARCFINANCIMOV) )'
      
        '   AND ( (:PIDDOCDIVERGE IS NULL) OR (C.IDDOCDIVERGE = :PIDDOCDI' +
        'VERGE) )'
      ''
      ' ')
    ValidateWithMask = True
    Left = 296
    Top = 162
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPARCFINANCIMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPARCFINANCIMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCDIVERGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCDIVERGE'
        ParamType = ptUnknown
      end>
    object qryConciliaDocIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.CONCILIADOC.IDDOCUMENTO'
    end
    object qryConciliaDocIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.CONCILIADOC.IDUSUARIO'
    end
    object qryConciliaDocDIFDIAS: TFloatField
      FieldName = 'DIFDIAS'
      Origin = 'BASEDADOS.CONCILIADOC.DIFDIAS'
    end
    object qryConciliaDocDIFVLR: TFloatField
      FieldName = 'DIFVLR'
      Origin = 'BASEDADOS.CONCILIADOC.DIFVLR'
      DisplayFormat = '#,##0.00'
    end
    object qryConciliaDocMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Origin = 'BASEDADOS.CONCILIADOC.MOTIVO'
      Size = 200
    end
    object qryConciliaDocDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'BASEDADOS.CONCILIADOC.DATA'
    end
    object qryConciliaDocFLGTIPO: TStringField
      FieldName = 'FLGTIPO'
      Origin = 'BASEDADOS.CONCILIADOC.FLGTIPO'
      FixedChar = True
      Size = 1
    end
    object qryConciliaDocNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      Origin = 'BASEDADOS.USUARIOSISTEMA.NOMEUSUARIO'
      FixedChar = True
    end
    object qryConciliaDocTIPO_CONCILIACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TIPO_CONCILIACAO'
      Size = 50
      Calculated = True
    end
    object qryConciliaDocIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryConciliaDocIDDOCDIVERGE: TFloatField
      FieldName = 'IDDOCDIVERGE'
    end
    object qryConciliaDocNUMLANCTODIVERGE: TFloatField
      FieldName = 'NUMLANCTODIVERGE'
    end
  end
  object qryRegistraErroDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   LANCAMENTOSIMOVEL L'
      'SET'
      '   L.FLGERRO =:PFLGERRO,'
      '   L.MSGERROINTEGRA = :PMSGERROINTEGRA'
      'WHERE'
      '   L.IDDOCUMENTO =:PIDDOCUMENTO')
    ValidateWithMask = True
    Left = 168
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGERRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMSGERROINTEGRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qrySelectCorrecaoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DOC.DATAOPER,'
      '       DOC.DATABAIXA,'
      '       MUL.VLRDIA  AS VLRDIA_MUL,'
      '       JUR.VLRDIA  AS VLRDIA_JUR,'
      '       COR.VLRDIA  AS VLRDIA_COR,'
      '       MUL.VLRACUM AS VLRACUM_MUL,'
      '       JUR.VLRACUM AS VLRACUM_JUR,'
      '       COR.VLRACUM AS VLRACUM_COR,'
      
        '       (NVL(MUL.VLRDIA,0) + NVL(JUR.VLRDIA,0) + NVL(COR.VLRDIA,0' +
        '))    AS VLRDIA_TOTAL,'
      
        '       (NVL(MUL.VLRACUM,0) + NVL(JUR.VLRACUM,0) + NVL(COR.VLRACU' +
        'M,0)) AS VLRACUM_TOTAL'
      '  FROM ('
      
        '        SELECT DATAOPER, DATABAIXA, TO_CHAR(DATAOPER)||TO_CHAR(D' +
        'ATABAIXA) AS CHAVE'
      '          FROM LANCOPERDIAIMOB L'
      '         WHERE (L.CODDOCUMENTO = :pCODDOCUMENTO)'
      '           AND (L.IDOPERACAO   = :pIDOPERJUROS OR'
      '                L.IDOPERACAO   = :pIDOPERMULTA OR'
      '                L.IDOPERACAO   = :pIDOPERCM )'
      
        '         GROUP BY DATAOPER, DATABAIXA, TO_CHAR(DATAOPER)||TO_CHA' +
        'R(DATABAIXA)'
      '       ) DOC,'
      '       ('
      
        '        SELECT CODDOCUMENTO, DATAOPER, DATABAIXA, VLRDIA, VLRACU' +
        'M,'
      '               TO_CHAR(DATAOPER)||TO_CHAR(DATABAIXA) AS CHAVE'
      '          FROM LANCOPERDIAIMOB L'
      '         WHERE L.IDOPERACAO   = :pIDOPERMULTA'
      '           AND L.CODDOCUMENTO = :pCODDOCUMENTO'
      '       ) MUL,'
      '       ('
      
        '        SELECT CODDOCUMENTO, DATAOPER, DATABAIXA, VLRDIA, VLRACU' +
        'M,'
      '               TO_CHAR(DATAOPER)||TO_CHAR(DATABAIXA) AS CHAVE'
      '          FROM LANCOPERDIAIMOB L'
      '         WHERE L.IDOPERACAO   = :pIDOPERJUROS'
      '           AND L.CODDOCUMENTO = :pCODDOCUMENTO'
      '       ) JUR,'
      '       ('
      
        '        SELECT CODDOCUMENTO, DATAOPER, DATABAIXA, VLRDIA, VLRACU' +
        'M,'
      '               TO_CHAR(DATAOPER)||TO_CHAR(DATABAIXA) AS CHAVE'
      '          FROM LANCOPERDIAIMOB L'
      '         WHERE L.IDOPERACAO   = :pIDOPERCM'
      '           AND L.CODDOCUMENTO = :pCODDOCUMENTO'
      '       ) COR'
      ' WHERE (DOC.CHAVE = MUL.CHAVE(+) )'
      '   AND (DOC.CHAVE = JUR.CHAVE(+) )'
      '   AND (DOC.CHAVE = COR.CHAVE(+) )'
      ' ORDER BY DATAOPER, DATABAIXA'
      '')
    ValidateWithMask = True
    Left = 173
    Top = 308
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDOPERJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDOPERMULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDOPERCM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDOPERMULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDOPERJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDOPERCM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qrySelectCorrecaoDocDATAOPER: TDateTimeField
      FieldName = 'DATAOPER'
    end
    object qrySelectCorrecaoDocDATABAIXA: TDateTimeField
      FieldName = 'DATABAIXA'
    end
    object qrySelectCorrecaoDocVLRDIA_MUL: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRDIA_MUL'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object qrySelectCorrecaoDocVLRDIA_JUR: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRDIA_JUR'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object qrySelectCorrecaoDocVLRDIA_COR: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRDIA_COR'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object qrySelectCorrecaoDocVLRACUM_MUL: TFloatField
      FieldName = 'VLRACUM_MUL'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object qrySelectCorrecaoDocVLRACUM_JUR: TFloatField
      FieldName = 'VLRACUM_JUR'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object qrySelectCorrecaoDocVLRACUM_COR: TFloatField
      FieldName = 'VLRACUM_COR'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object qrySelectCorrecaoDocVLRDIA_TOTAL: TFloatField
      FieldName = 'VLRDIA_TOTAL'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object qrySelectCorrecaoDocVLRACUM_TOTAL: TFloatField
      FieldName = 'VLRACUM_TOTAL'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
  end
end
