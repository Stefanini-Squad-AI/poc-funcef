object dtmImobiliario: TdtmImobiliario
  OldCreateOrder = True
  Left = 20
  Top = 142
  Height = 541
  Width = 999
  object Temporizador: TTimer
    Enabled = False
    OnTimer = TemporizadorTimer
    Left = 728
    Top = 296
  end
  object qryContratosRescisao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOIMOVEL,'
      '   C.CONNUMERO, C.CONNOME,'
      '   CONDATAINICIO, CONDATAFIM'
      ''
      'FROM'
      '   CONTRATOIMOVEL C'
      ''
      'WHERE'
      '   ( FLGSTATUS = '#39'V'#39' )'
      '   AND ( C.IDPESSOA =:PIDPESSOA )'
      
        '   AND ( (CONDATAFIM <=:PCONDATAFIM) AND (C.FLGINDETERMINADO <> ' +
        #39'S'#39') )'
      
        '   AND ( (:PIDCONTRATOIMOVEL IS NULL ) OR ( C.IDCONTRATOIMOVEL =' +
        ':PIDCONTRATOIMOVEL ) )'
      
        '   AND ( (:PFLGTIPOCONTRATO IS NULL) OR (C.FLGTIPOCONTRATO =:PFL' +
        'GTIPOCONTRATO) )'
      
        '   AND ( (:PCODPORTFORMA IS NULL) OR (C.CODPORTFORMA =:PCODPORTF' +
        'ORMA) )'
      
        '   AND ( (:PINDICEREAJUSTE IS NULL) OR (C.CONINDICEREAJUSTE =:PI' +
        'NDICEREAJUSTE) )   '
      
        '   AND ( (:PIDADMINIMOVEL IS NULL) OR (C.IDADMINIMOVEL =:PIDADMI' +
        'NIMOVEL) )'
      
        '   AND ( (:PIDRESPONSAVEL IS NULL) OR (C.IDRESPONSAVEL =:PIDRESP' +
        'ONSAVEL) )'
      
        '   AND ( (:PIDTIPOCUSTORECIMO IS NULL) OR (C.IDTIPOCUSTORECIMO =' +
        ':PIDTIPOCUSTORECIMO) )'
      
        '   AND ( (:PFLGCOBRANCAAUTO IS NULL ) OR ( C.FLGCOBRANCAAUTO =:P' +
        'FLGCOBRANCAAUTO ) )'
      ' '
      ' '
      ' ')
    UpdateObject = updContratosRescisao
    ValidateWithMask = True
    Left = 48
    Top = 68
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PCONDATAFIM'
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
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
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
        Name = 'PFLGCOBRANCAAUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGCOBRANCAAUTO'
        ParamType = ptUnknown
      end>
    object qryContratosRescisaoCONNUMERO: TStringField
      DisplayLabel = 'Nº Contrato'
      DisplayWidth = 15
      FieldName = 'CONNUMERO'
      Origin = 'CONTRATOIMOVEL.CONNUMERO'
    end
    object qryContratosRescisaoCONNOME: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 48
      FieldName = 'CONNOME'
      Origin = 'CONTRATOIMOVEL.CONNOME'
      Size = 60
    end
    object qryContratosRescisaoCONDATAINICIO: TDateTimeField
      DisplayLabel = 'Data Início'
      DisplayWidth = 9
      FieldName = 'CONDATAINICIO'
      Origin = 'CONTRATOIMOVEL.CONDATAINICIO'
    end
    object qryContratosRescisaoCONDATAFIM: TDateTimeField
      DisplayLabel = 'Data Fim'
      DisplayWidth = 9
      FieldName = 'CONDATAFIM'
      Origin = 'CONTRATOIMOVEL.CONDATAFIM'
    end
    object qryContratosRescisaoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = '"CM.CONTRATOIMOVEL".IDCONTRATOIMOVEL'
      Visible = False
    end
  end
  object updContratosRescisao: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTOSIMOVEL'
      'set'
      '  IDLANCIMOVEL = :IDLANCIMOVEL,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDTIPOCUSTORECIMO = :IDTIPOCUSTORECIMO,'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  DATALANCAMENTO = :DATALANCAMENTO,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  RECPAG = :RECPAG,'
      '  FLGAGRUPAR = :FLGAGRUPAR,'
      '  FLGAGRUPADO = :FLGAGRUPADO,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  ANOREFERENCIA = :ANOREFERENCIA,'
      '  MESCOMPETENCIA = :MESCOMPETENCIA,'
      '  ANOCOMPETENCIA = :ANOCOMPETENCIA,'
      '  FLGTIPOLANCAMENTO = :FLGTIPOLANCAMENTO,'
      '  MOEDAPAGAR = :MOEDAPAGAR,'
      '  MOEDARECEB = :MOEDARECEB,'
      '  VLRLANCOMPAGAR = :VLRLANCOMPAGAR,'
      '  VLRLANCPAGAR = :VLRLANCPAGAR,'
      '  VLRLANCOMRECEB = :VLRLANCOMRECEB,'
      '  VLRLANCRECEB = :VLRLANCRECEB,'
      '  DATACORRECAO = :DATACORRECAO,'
      '  FLGORIGEMLANC = :FLGORIGEMLANC,'
      '  FLGESTORNADO = :FLGESTORNADO'
      'where'
      '  IDLANCIMOVEL = :OLD_IDLANCIMOVEL')
    InsertSQL.Strings = (
      'insert into LANCAMENTOSIMOVEL'
      
        '  (IDLANCIMOVEL, IDPESSOA, IDIMOVEL, IDTIPOCUSTORECIMO, IDCONTRA' +
        'TOIMOVEL, '
      
        '   CODDOCUMENTO, PLNCODIGO, DATALANCAMENTO, DATAVENCIMENTO, RECP' +
        'AG, FLGAGRUPAR, '
      
        '   FLGAGRUPADO, MESREFERENCIA, ANOREFERENCIA, MESCOMPETENCIA, AN' +
        'OCOMPETENCIA, '
      
        '   FLGTIPOLANCAMENTO, MOEDAPAGAR, MOEDARECEB, VLRLANCOMPAGAR, VL' +
        'RLANCPAGAR, '
      
        '   VLRLANCOMRECEB, VLRLANCRECEB, DATACORRECAO, FLGORIGEMLANC, FL' +
        'GESTORNADO)'
      'values'
      
        '  (:IDLANCIMOVEL, :IDPESSOA, :IDIMOVEL, :IDTIPOCUSTORECIMO, :IDC' +
        'ONTRATOIMOVEL, '
      
        '   :CODDOCUMENTO, :PLNCODIGO, :DATALANCAMENTO, :DATAVENCIMENTO, ' +
        ':RECPAG, '
      
        '   :FLGAGRUPAR, :FLGAGRUPADO, :MESREFERENCIA, :ANOREFERENCIA, :M' +
        'ESCOMPETENCIA, '
      
        '   :ANOCOMPETENCIA, :FLGTIPOLANCAMENTO, :MOEDAPAGAR, :MOEDARECEB' +
        ', :VLRLANCOMPAGAR, '
      
        '   :VLRLANCPAGAR, :VLRLANCOMRECEB, :VLRLANCRECEB, :DATACORRECAO,' +
        ' :FLGORIGEMLANC, '
      '   :FLGESTORNADO)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTOSIMOVEL'
      'where'
      '  IDLANCIMOVEL = :OLD_IDLANCIMOVEL')
    Left = 48
    Top = 56
  end
  object qryContratosReajuste: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRATOIMOVEL,   C.CONNUMERO,       C.CONNOME,'
      '       C.CONDATAINICIO,      C.CONDATAFIM,      C.FLGSTATUS,'
      
        '       C.CONDATAREAJUSTE,    C.CONPROXREAJUSTE, C.CONPERREAJUSTE' +
        ','
      '       C.CONINDICEREAJUSTE,  M.MOESIGLA,'
      
        '       C.MOECODIGO,          C.CONVLRTOTAL,     C.CONVLRAJUSTADO' +
        ','
      
        '       DECODE(C.CONPERCREAJUSTE, NULL, 1, (1+(C.CONPERCREAJUSTE/' +
        '100)) ) AS PERCENTFIXO,'
      '       0 AS PERCENTREAJUSTE, 0 AS PERCENTVLRANO'
      '  FROM CONTRATOIMOVEL C, MOEDA M'
      ' WHERE ( C.CONINDICEREAJUSTE = M.MOECODIGO(+) )'
      '   AND ( C.IDPESSOA =:PIDPESSOA )'
      
        '   AND ( ( C.CONDATAFIM >=:PCONDATAFIM ) OR ( C.FLGINDETERMINADO' +
        ' = '#39'S'#39' ) )'
      
        '   AND ( ((:DATAINI IS NULL) AND (:DATAFIM IS NULL)) OR (C.CONPR' +
        'OXREAJUSTE BETWEEN :DATAINI AND :DATAFIM) )'
      
        '   AND ( (:PIDCONTRATOIMOVEL IS NULL ) OR ( C.IDCONTRATOIMOVEL =' +
        ':PIDCONTRATOIMOVEL ) )'
      
        '   AND ( (:PFLGTIPOCONTRATO IS NULL)   OR (C.FLGTIPOCONTRATO =:P' +
        'FLGTIPOCONTRATO) )'
      
        '   AND ( (:PCODPORTFORMA IS NULL)      OR (C.CODPORTFORMA =:PCOD' +
        'PORTFORMA) )'
      
        '   AND ( (:PINDICEREAJUSTE IS NULL)    OR (C.CONINDICEREAJUSTE =' +
        ':PINDICEREAJUSTE) )'
      
        '   AND ( (:PIDADMINIMOVEL IS NULL)     OR (C.IDADMINIMOVEL =:PID' +
        'ADMINIMOVEL) )'
      
        '   AND ( (:PIDRESPONSAVEL IS NULL)     OR (C.IDRESPONSAVEL =:PID' +
        'RESPONSAVEL) )'
      
        '   AND ( (:PIDTIPOCUSTORECIMO IS NULL) OR (C.IDTIPOCUSTORECIMO =' +
        ':PIDTIPOCUSTORECIMO) )'
      
        '   AND ( (:PFLGCOBRANCAAUTO IS NULL )  OR ( C.FLGCOBRANCAAUTO =:' +
        'PFLGCOBRANCAAUTO ) )'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updContratosReajuste
    ValidateWithMask = True
    Left = 71
    Top = 124
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PCONDATAFIM'
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
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
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
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
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
        Name = 'PFLGCOBRANCAAUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGCOBRANCAAUTO'
        ParamType = ptUnknown
      end>
    object qryContratosReajusteCONNUMERO: TStringField
      DisplayLabel = 'Nº Contrato'
      DisplayWidth = 9
      FieldName = 'CONNUMERO'
    end
    object qryContratosReajusteCONNOME: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 22
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryContratosReajusteCONDATAREAJUSTE: TDateTimeField
      DisplayLabel = 'Reajuste'
      DisplayWidth = 7
      FieldName = 'CONDATAREAJUSTE'
    end
    object qryContratosReajusteCONINDICEREAJUSTE: TFloatField
      DisplayLabel = 'Índice'
      DisplayWidth = 5
      FieldName = 'CONINDICEREAJUSTE'
    end
    object qryContratosReajustePERCENTREAJUSTE: TFloatField
      DisplayLabel = '% Reajsute'
      DisplayWidth = 9
      FieldName = 'PERCENTREAJUSTE'
    end
    object qryContratosReajusteCONPROXREAJUSTE: TDateTimeField
      DisplayLabel = 'Próximo'
      DisplayWidth = 6
      FieldName = 'CONPROXREAJUSTE'
    end
    object qryContratosReajusteCONVLRTOTAL: TFloatField
      DisplayLabel = 'Vlr. Anterior'
      DisplayWidth = 10
      FieldName = 'CONVLRTOTAL'
      DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      EditFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
    end
    object qryContratosReajusteCONVLRAJUSTADO: TFloatField
      DisplayLabel = 'Novo Vlr.'
      DisplayWidth = 10
      FieldName = 'CONVLRAJUSTADO'
      DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      EditFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
    end
    object qryContratosReajusteCONDATAINICIO: TDateTimeField
      DisplayLabel = 'Data Início'
      DisplayWidth = 9
      FieldName = 'CONDATAINICIO'
      Visible = False
    end
    object qryContratosReajusteCONDATAFIM: TDateTimeField
      DisplayLabel = 'Data Fim'
      DisplayWidth = 9
      FieldName = 'CONDATAFIM'
      Visible = False
    end
    object qryContratosReajusteCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
      Visible = False
    end
    object qryContratosReajusteIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryContratosReajusteMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryContratosReajusteMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryContratosReajustePERCENTVLRANO: TFloatField
      FieldName = 'PERCENTVLRANO'
    end
    object qryContratosReajustePERCENTFIXO: TFloatField
      FieldName = 'PERCENTFIXO'
    end
    object qryContratosReajusteFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      FixedChar = True
      Size = 1
    end
  end
  object updContratosReajuste: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOIMOVEL'
      'set'
      '  CONDATAINICIO = :CONDATAINICIO,'
      '  CONDATAFIM = :CONDATAFIM,'
      '  CONDATAREAJUSTE = :CONDATAREAJUSTE,'
      '  CONPROXREAJUSTE = :CONPROXREAJUSTE,'
      '  CONVLRTOTAL = :CONVLRTOTAL,'
      '  CONVLRAJUSTADO = :CONVLRAJUSTADO'
      'where'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
    InsertSQL.Strings = (
      'insert into CONTRATOIMOVEL'
      
        '  (CONDATAINICIO, CONDATAFIM, CONDATAREAJUSTE, CONPROXREAJUSTE, ' +
        'CONVLRTOTAL, '
      '   CONVLRAJUSTADO)'
      'values'
      
        '  (:CONDATAINICIO, :CONDATAFIM, :CONDATAREAJUSTE, :CONPROXREAJUS' +
        'TE, :CONVLRTOTAL, '
      '   :CONVLRAJUSTADO)')
    DeleteSQL.Strings = (
      'delete from CONTRATOIMOVEL'
      'where'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
    Left = 48
    Top = 112
  end
  object qryIndice: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.MOECODIGO, M.MOEDESC, M.MOESIGLA,'
      '   M.MOEPERIODICIDADE, M.MOEINATIVO,'
      '   M.FLGPERCVALOR, M.DATAINICIO, M.DATAFIM'
      'FROM'
      '   MOEDA M'
      'WHERE'
      '   M.MOECODIGO =:MOEDA')
    ValidateWithMask = True
    Left = 432
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOEDA'
        ParamType = ptUnknown
      end>
    object qryIndiceMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
    end
    object qryIndiceMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object qryIndiceMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
    object qryIndiceMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Origin = 'MOEDA.MOEPERIODICIDADE'
      Size = 1
    end
    object qryIndiceMOEINATIVO: TStringField
      FieldName = 'MOEINATIVO'
      Origin = 'MOEDA.MOEINATIVO'
      Size = 1
    end
    object qryIndiceFLGPERCVALOR: TStringField
      FieldName = 'FLGPERCVALOR'
      Origin = 'MOEDA.FLGPERCVALOR'
      Size = 1
    end
    object qryIndiceDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'MOEDA.DATAINICIO'
    end
    object qryIndiceDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
      Origin = 'MOEDA.DATAFIM'
    end
  end
  object qryCotacoesIntervalo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.MOECODIGO, C.COTVALOR, C.COTMESREF, M.MOEDESC, M.MOESIGLA,'
      
        '   (SUBSTR(C.COTMESREF, 3, 4)||SUBSTR(C.COTMESREF, 1, 2)) AS ANO' +
        'MES'
      'FROM'
      '   COTACAOMOEDA C, MOEDA M'
      'WHERE'
      '   ( C.MOECODIGO =:INDICE )'
      '   -- os dois parâmetros abaixo para cotação mensal'
      
        '   AND ( (:ANOMESINI IS NULL) OR ((SUBSTR(C.COTMESREF, 3, 4)||SU' +
        'BSTR(C.COTMESREF, 1, 2)) >= :ANOMESINI) )'
      
        '   AND ( (:ANOMESFIM IS NULL) OR ((SUBSTR(C.COTMESREF, 3, 4)||SU' +
        'BSTR(C.COTMESREF, 1, 2)) <= :ANOMESFIM) )'
      '   -- os dois parâmetros abaixo para cotação diária'
      '   AND ( (:PDATAINI  IS NULL) OR (C.COTDATA >= :PDATAINI) )'
      '   AND ( (:PDATAFIM  IS NULL) OR (C.COTDATA <= :PDATAFIM) )'
      '   AND ( C.MOECODIGO = M.MOECODIGO )'
      'ORDER BY'
      '   C.COTDATA'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INDICE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANOMESFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end>
    object qryCotacoesIntervaloMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryCotacoesIntervaloCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
    end
    object qryCotacoesIntervaloCOTMESREF: TStringField
      FieldName = 'COTMESREF'
      Size = 6
    end
    object qryCotacoesIntervaloMOEDESC: TStringField
      FieldName = 'MOEDESC'
    end
    object qryCotacoesIntervaloMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryCotacoesIntervaloANOMES: TStringField
      FieldName = 'ANOMES'
      Size = 6
    end
  end
  object qryCotacaoExata: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.MOECODIGO, C.COTVALOR, M.MOEDESC, M.MOESIGLA'
      ''
      'FROM'
      '   COTACAOMOEDA C, MOEDA M'
      ''
      'WHERE'
      '   ( C.MOECODIGO =:MOEDA )'
      '   AND ( C.COTDATA =:DATA )'
      '   AND ( C.MOECODIGO = M.MOECODIGO )'
      ''
      'ORDER BY'
      '   C.COTDATA DESC')
    ValidateWithMask = True
    Left = 48
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end>
    object qryCotacaoExataMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
    end
    object qryCotacaoExataCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'COTACAOMOEDA.COTVALOR'
    end
    object qryCotacaoExataMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object qryCotacaoExataMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
  end
  object qryCotacaoNaoExata: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.MOECODIGO, C.COTVALOR, M.MOEDESC, M.MOESIGLA'
      ''
      'FROM'
      '   COTACAOMOEDA C, MOEDA M'
      ''
      'WHERE'
      '   ( C.MOECODIGO =:MOEDA )'
      '   AND ( C.COTDATA <=:DATA )'
      '   AND ( C.MOECODIGO = M.MOECODIGO )'
      ''
      'ORDER BY'
      '   C.COTDATA DESC')
    ValidateWithMask = True
    Left = 48
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end>
    object qryCotacaoNaoExataMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
    end
    object qryCotacaoNaoExataCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'COTACAOMOEDA.COTVALOR'
    end
    object qryCotacaoNaoExataMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object qryCotacaoNaoExataMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
  end
  object qryExcluiHistLanc_OLD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTCARTINV'
      'WHERE'
      '   IDHISTCARTINV =:PIDHISTCARTINV')
    ValidateWithMask = True
    Left = 304
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDHISTCARTINV'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaHistLanc_OLD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H.IDHISTCARTINV'
      ''
      'FROM'
      '   HISTCARTINV H'
      ''
      'WHERE'
      '   H.IDLANCIMOVEL IN'
      '   ('
      '   SELECT'
      '      L.IDLANCIMOVEL'
      '   FROM'
      '      LANCAMENTOSIMOVEL L'
      '   WHERE'
      '      L.IDDOCUMENTO =:PIDDOCUMENTO'
      '   )'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 304
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryBuscaHistLanc_OLDIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
  end
  object qryExcluiLancContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LANCAMENTO'
      'WHERE'
      '   ( PLNCODIGO =:PPLNCODIGO)'
      ' ')
    ValidateWithMask = True
    Left = 304
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiPlanilha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM PLANILHA'
      'WHERE'
      '   ( PLNCODIGO =:PPLNCODIGO)'
      ' ')
    ValidateWithMask = True
    Left = 304
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 728
    Top = 248
  end
  object qryDataVencAluguel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOIMOVEL,'
      '   C.CONNUMERO, C.CONNOME,'
      ''
      '   C.CONDIAVENCIMENTO, C.FLGTIPODIAVENC,'
      '   C.CONDIACOMPLEMENTO,'
      '   C.CONDIASTOLERANCIA, FLGTIPODIATOLERA,'
      '   C.FLGINDETERMINADO,'
      ''
      '   C.IDPAIS, C.CODESTADO, C.IDCIDADES,'
      '   C.FLGCOMPETALUGUEL'
      ''
      'FROM'
      '   CONTRATOIMOVEL C'
      ''
      'WHERE'
      '   ( C.IDPESSOA =:EMPRESAPROP )'
      
        '   AND ( (:CONTRATO IS NULL) OR (C.IDCONTRATOIMOVEL =:CONTRATO) ' +
        ')'
      
        '   AND ( (:TIPOCONTRATO IS NULL) OR (C.FLGTIPOCONTRATO =:TIPOCON' +
        'TRATO) )'
      
        '   AND ( (:PORTADORFORMA IS NULL) OR (C.CODPORTFORMA =:PORTADORF' +
        'ORMA) )'
      
        '   AND ( (:ADMINISTRADORA IS NULL) OR (C.IDADMINIMOVEL =:ADMINIS' +
        'TRADORA) )'
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORTADORFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORTADORFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ADMINISTRADORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ADMINISTRADORA'
        ParamType = ptUnknown
      end>
    object qryDataVencAluguelIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = '"CM.CONTRATOIMOVEL".IDCONTRATOIMOVEL'
    end
    object qryDataVencAluguelCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
      Origin = '"CM.CONTRATOIMOVEL".CONNUMERO'
    end
    object qryDataVencAluguelCONNOME: TStringField
      FieldName = 'CONNOME'
      Origin = '"CM.CONTRATOIMOVEL".CONNOME'
      Size = 60
    end
    object qryDataVencAluguelCONDIAVENCIMENTO: TFloatField
      FieldName = 'CONDIAVENCIMENTO'
      Origin = '"CM.CONTRATOIMOVEL".CONDIAVENCIMENTO'
    end
    object qryDataVencAluguelFLGTIPODIAVENC: TStringField
      FieldName = 'FLGTIPODIAVENC'
      Origin = '"CM.CONTRATOIMOVEL".FLGTIPODIAVENC'
      Size = 1
    end
    object qryDataVencAluguelIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = '"CM.CONTRATOIMOVEL".IDPAIS'
    end
    object qryDataVencAluguelCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = '"CM.CONTRATOIMOVEL".CODESTADO'
      Size = 3
    end
    object qryDataVencAluguelIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = '"CM.CONTRATOIMOVEL".IDCIDADES'
    end
    object qryDataVencAluguelCONDIACOMPLEMENTO: TFloatField
      FieldName = 'CONDIACOMPLEMENTO'
      Origin = '"CM.CONTRATOIMOVEL".CONDIACOMPLEMENTO'
    end
    object qryDataVencAluguelCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
      Origin = '"CM.CONTRATOIMOVEL".CONDIASTOLERANCIA'
    end
    object qryDataVencAluguelFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      Origin = '"CM.CONTRATOIMOVEL".FLGTIPODIATOLERA'
      Size = 1
    end
    object qryDataVencAluguelFLGINDETERMINADO: TStringField
      FieldName = 'FLGINDETERMINADO'
      Origin = 'CONTRATOIMOVEL.FLGINDETERMINADO'
      Size = 1
    end
    object qryDataVencAluguelFLGCOMPETALUGUEL: TStringField
      FieldName = 'FLGCOMPETALUGUEL'
      Origin = '"CM.CONTRATOIMOVEL".FLGCOMPETALUGUEL'
      Size = 1
    end
  end
  object qryDocumentosCNAB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   VW.IDLANCIMOVEL,'
      
        '   VW.CODDOCUMENTO, VW.DATAVENCIMENTO AS DATAVENCTO, VW.CODPORTF' +
        'ORMA'
      ''
      'FROM'
      '   VWLANCAMENTO VW'
      ''
      'WHERE'
      '   ( VW.IDCONTRATOIMOVEL =:PIDCONTRATOIMOVEL )'
      ''
      '   AND ( VW.CODDOCUMENTO IS NOT NULL )'
      '   AND ( VW.CODPORTFORMA IS NOT NULL )'
      '   AND ( VW.DATAVENCIMENTO IS NOT NULL )'
      ''
      '   AND ( VW.RECPAG = '#39'R'#39' )'
      '   AND ( VW.FLGAGRUPAR = '#39'S'#39' )'
      ''
      '   AND ( (VW.FLGINTEGRADO IS NULL) OR (VW.FLGINTEGRADO <> 0) )'
      '   AND ( (VW.FLGESTORNADO IS NULL) OR (VW.FLGESTORNADO <> 1) )'
      ''
      '   AND ( (VW.EMISBLOQ <> '#39'S'#39') OR (VW.EMISBLOQ IS NULL) )'
      
        '   AND ( (RTRIM(VW.STATUS_DOC) <> '#39'2'#39') OR (VW.STATUS_DOC IS NULL' +
        ') )'
      ''
      'ORDER BY'
      '   VW.DATAVENCIMENTO')
    ValidateWithMask = True
    Left = 432
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryDocumentosCNABCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryDocumentosCNABDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object qryDocumentosCNABCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryDocumentosCNABIDLANCIMOVEL: TFloatField
      FieldName = 'IDLANCIMOVEL'
    end
  end
  object qryContratosAgrupar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DISTINCT(VW.IDCONTRATOIMOVEL)'
      ''
      'FROM'
      '   VWLANCAMENTO VW'
      ''
      'WHERE'
      '   ( VW.RECPAG = '#39'R'#39' )'
      ''
      '   AND ( VW.FLGAGRUPAR = '#39'S'#39' )'
      '   AND ( (VW.FLGINTEGRADO IS NULL) OR (VW.FLGINTEGRADO <> 0) )'
      '   AND ( (VW.FLGAGRUPADO IS NULL) OR (VW.FLGAGRUPADO <> 1) )'
      '   AND ( (VW.FLGESTORNADO IS NULL) OR (VW.FLGESTORNADO <> 1) )'
      ''
      '   AND ( VW.CODDOCUMENTO IS NOT NULL )'
      '   AND ( VW.CODPORTFORMA IS NOT NULL )'
      ''
      '   AND ( (VW.EMISBLOQ <> '#39'S'#39') OR (VW.EMISBLOQ IS NULL) )'
      
        '   AND ( (RTRIM(VW.STATUS_DOC) <> '#39'2'#39') OR (VW.STATUS_DOC IS NULL' +
        ') )'
      
        '   AND ( (:PMESCOMPETENCIA IS NULL) OR (VW.MESCOMPETENCIA =:PMES' +
        'COMPETENCIA) )'
      
        '   AND ( (:PANOCOMPETENCIA IS NULL) OR (VW.ANOCOMPETENCIA =:PANO' +
        'COMPETENCIA) )'
      
        '   AND ( (:PDATAVENCIMENTOINI IS NULL) OR (VW.DATAVENCIMENTO BET' +
        'WEEN :PDATAVENCIMENTOINI AND :PDATAVENCIMENTOFIM) )'
      ' ')
    ValidateWithMask = True
    Left = 560
    Top = 136
    ParamData = <
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
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTOINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTOFIM'
        ParamType = ptUnknown
      end>
    object qryContratosAgruparIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
  end
  object qryMsgLinhaBoleto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   LMBTEXTOLINHA'
      'FROM'
      '   LINHAMSGBOLETO'
      'WHERE'
      '   ( IDMSGBOLETO =:PIDMSGBOLETO )'
      '   AND ( LMBNUMLINHA =:PLMBNUMLINHA )'
      '')
    ValidateWithMask = True
    Left = 560
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDMSGBOLETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLMBNUMLINHA'
        ParamType = ptUnknown
      end>
    object qryMsgLinhaBoletoLMBTEXTOLINHA: TStringField
      FieldName = 'LMBTEXTOLINHA'
      Origin = 'LINHAMSGBOLETO.LMBTEXTOLINHA'
      Size = 69
    end
  end
  object qryMsgBoleto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDMSGBOLETO'
      'FROM'
      '   CONTRATOIMOVEL'
      'WHERE'
      '   IDCONTRATOIMOVEL =:PIDCONTRATOIMOVEL'
      ' ')
    ValidateWithMask = True
    Left = 560
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryMsgBoletoIDMSGBOLETO: TFloatField
      FieldName = 'IDMSGBOLETO'
      Origin = 'CONTRATOIMOVEL.IDMSGBOLETO'
    end
  end
  object qryMarcaImovelOcupado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   IMOVEL'
      'SET'
      '   FLGSTATUSOCUPACAO = '#39'O'#39
      'WHERE'
      '   ( (:IMOVEL IS NULL) OR (IDIMOVEL =:IMOVEL) )'
      ''
      '   AND IDIMOVEL IN'
      '      ('
      '      SELECT'
      '         X.IDIMOVEL'
      '      FROM'
      '         CONTRATOIMOVEL C, CONTRATOXIMOVEL X'
      '      WHERE'
      '         ( C.FLGSTATUS = '#39'V'#39' )'
      '         AND ( X.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      
        '         AND ( (:CONTRATO IS NULL) OR (C.IDCONTRATOIMOVEL =:CONT' +
        'RATO) )'
      '      )')
    ValidateWithMask = True
    Left = 432
    Top = 276
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
  end
  object qryMarcaImovelDesocupado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   IMOVEL'
      'SET'
      '   FLGSTATUSOCUPACAO = '#39'D'#39
      'WHERE'
      '   ( (:IMOVEL IS NULL) OR (IDIMOVEL =:IMOVEL) )'
      ''
      '   AND IDIMOVEL NOT IN'
      '      ('
      '      SELECT'
      '         X.IDIMOVEL'
      '      FROM'
      '         CONTRATOIMOVEL C, CONTRATOXIMOVEL X'
      '      WHERE'
      '         ( C.FLGSTATUS = '#39'V'#39' )'
      '         AND ( X.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      
        '         AND ( (:CONTRATO IS NULL) OR (C.IDCONTRATOIMOVEL =:CONT' +
        'RATO) )'
      '      )')
    ValidateWithMask = True
    Left = 432
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DOCUMENTO'
      'WHERE'
      '   ( CODDOCUMENTO =:PCODDOCUMENTO)')
    ValidateWithMask = True
    Left = 304
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiLanctoDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LANCTODOCUM'
      'WHERE'
      '   ( CODDOCUMENTO =:PCODDOCUMENTO)')
    ValidateWithMask = True
    Left = 304
    Top = 188
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiRateioDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM RATEIODOCUM'
      'WHERE'
      '   ( CODDOCUMENTO =:PCODDOCUMENTO)')
    ValidateWithMask = True
    Left = 304
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiRecbtoPagto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM RECBTOPAGTO'
      'WHERE'
      '   ( CODDOCUMENTO =:PCODDOCUMENTO)')
    ValidateWithMask = True
    Left = 304
    Top = 164
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiLotexDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LOTEXDOCUM'
      'WHERE'
      '   ( CODDOCUMENTO =:PCODDOCUMENTO)'
      '   AND (FLGBAIXA = '#39'C'#39')')
    ValidateWithMask = True
    Left = 304
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryContratoRescindido: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   FLGSTATUS'
      'FROM'
      '   CONTRATOIMOVEL'
      'WHERE'
      '   IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL')
    ValidateWithMask = True
    Left = 48
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryContratoRescindidoFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = '"CM.CONTRATOIMOVEL".FLGSTATUS'
      Size = 1
    end
  end
  object qryLancamentosFolha: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATOIMOVEL,'
      '   C.CONNUMERO, C.CONNOME,'
      '   C.CONDATAINICIO, C.CONDATAFIM,'
      ''
      '   (IM.IMONOME||'#39' - '#39'||I.IMONOME) AS IMOVEL_EXTENSO,'
      ''
      '   L.IDLANCIMOVEL, L.NODOCUMENTO,'
      '   L.IDIMOVEL, L.DATALANCAMENTO,'
      '   L.DATAVENCIMENTO, L.VLRLANCPAGAR, L.VLRLANCOMPAGAR,'
      '   L.RECPAG, L.MESREFERENCIA, L.ANOREFERENCIA,'
      '   L.MESCOMPETENCIA, L.ANOCOMPETENCIA, L.FLGAGRUPAR,'
      
        '   L.VLRLANCOMRECEB, L.VLRLANCRECEB, L.VLRJUROS, L.FLGORIGEMLANC' +
        ','
      '   L.VLRMULTA, L.VLRCORRECAOMON, L.FLGORIGEM,'
      ''
      '   L.CODDOCUMENTO,'
      '   L.PLNCODIGO,'
      '   NVL(L.CODDOCUMENTO, -1) AS DOCUMENTO,'
      '   NVL(L.PLNCODIGO, -1) AS PLANILHA,'
      ''
      '   DECODE(D.STATUS, NULL, '#39#39', RTRIM(D.STATUS)) AS STATUS'
      ''
      'FROM'
      '   DOCUMENTO D,'
      '   IMOVEL I, IMOVEL IM,'
      '   CONTRATOIMOVEL C,'
      '   LANCAMENTOSIMOVEL L'
      ''
      'WHERE'
      '   ( I.FLGTIPOIMOVEL = 1 )'
      '   AND ( IM.FLGTIPOIMOVEL = 0 )'
      ''
      '   AND ( L.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( L.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      '   AND ( L.CODDOCUMENTO = D.CODDOCUMENTO(+) )'
      ''
      '   AND ( C.IDPESSOA =:EMPRESAPROP )'
      '   AND ( L.MESCOMPETENCIA =:MESCOMPETENCIA )'
      '   AND ( L.ANOCOMPETENCIA =:ANOCOMPETENCIA )'
      ''
      '   AND'
      '   (  ( (:ORIGEM IS NOT NULL) AND (L.FLGORIGEMLANC =:ORIGEM) )'
      '   OR   (:ORIGEM IS NULL) )'
      ''
      '   AND'
      
        '   (  ( (:TIPOLANC IS NOT NULL) AND (L.FLGTIPOLANCAMENTO =:TIPOL' +
        'ANC) )'
      '   OR   (:TIPOLANC IS NULL) )'
      ''
      '   AND'
      
        '   (  ( (:TIPOCONTRATO IS NOT NULL) AND (C.FLGTIPOCONTRATO =:TIP' +
        'OCONTRATO) )'
      '   OR   (:TIPOCONTRATO IS NULL) )'
      ''
      '   AND'
      
        '   (  ( (:PORTADORFORMA IS NOT NULL) AND (C.CODPORTFORMA =:PORTA' +
        'DORFORMA) )'
      '   OR   (:PORTADORFORMA IS NULL) )'
      ''
      '   AND'
      
        '   (  ( (:ADMINISTRADORA IS NOT NULL) AND (C.IDADMINIMOVEL =:ADM' +
        'INISTRADORA) )'
      '   OR   (:ADMINISTRADORA IS NULL) )'
      ''
      '   AND'
      
        '   (  ( (:CONTRATO IS NOT NULL) AND (C.IDCONTRATOIMOVEL =:CONTRA' +
        'TO) )'
      '   OR   (:CONTRATO IS NULL) )'
      ' ')
    UpdateObject = updLancamentosFolha
    ValidateWithMask = True
    Left = 432
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORTADORFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORTADORFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORTADORFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ADMINISTRADORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ADMINISTRADORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ADMINISTRADORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
    object qryLancamentosFolhaCONNUMERO: TStringField
      DisplayLabel = 'Nº Contrato'
      DisplayWidth = 12
      FieldName = 'CONNUMERO'
      Origin = '"CM.CONTRATOIMOVEL".CONNUMERO'
    end
    object qryLancamentosFolhaCONNOME: TStringField
      DisplayLabel = 'Nome Contrato'
      DisplayWidth = 28
      FieldName = 'CONNOME'
      Origin = '"CM.CONTRATOIMOVEL".CONNOME'
      Size = 60
    end
    object qryLancamentosFolhaIMOVEL_EXTENSO: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 28
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryLancamentosFolhaVLRLANCRECEB: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 13
      FieldName = 'VLRLANCRECEB'
      Origin = 'LANCAMENTOSIMOVEL.VLRLANCRECEB'
    end
    object qryLancamentosFolhaDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Data Venc.'
      DisplayWidth = 10
      FieldName = 'DATAVENCIMENTO'
      Origin = 'LANCAMENTOSIMOVEL.DATAVENCIMENTO'
    end
    object qryLancamentosFolhaMESCOMPETENCIA: TFloatField
      DisplayLabel = 'Mês'
      DisplayWidth = 5
      FieldName = 'MESCOMPETENCIA'
      Origin = 'LANCAMENTOSIMOVEL.MESCOMPETENCIA'
    end
    object qryLancamentosFolhaANOCOMPETENCIA: TFloatField
      DisplayLabel = 'Ano'
      DisplayWidth = 5
      FieldName = 'ANOCOMPETENCIA'
      Origin = 'LANCAMENTOSIMOVEL.ANOCOMPETENCIA'
    end
    object qryLancamentosFolhaDOCUMENTO: TFloatField
      DisplayLabel = 'Nº documento'
      DisplayWidth = 20
      FieldName = 'DOCUMENTO'
    end
    object qryLancamentosFolhaIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Origin = 'LANCAMENTOSIMOVEL.IDIMOVEL'
      Visible = False
    end
    object qryLancamentosFolhaPLANILHA: TFloatField
      DisplayLabel = 'P'
      DisplayWidth = 10
      FieldName = 'PLANILHA'
      Visible = False
    end
    object qryLancamentosFolhaCONDATAINICIO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'CONDATAINICIO'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAINICIO'
      Visible = False
    end
    object qryLancamentosFolhaCONDATAFIM: TDateTimeField
      DisplayWidth = 10
      FieldName = 'CONDATAFIM'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAFIM'
      Visible = False
    end
    object qryLancamentosFolhaIDLANCIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLANCIMOVEL'
      Origin = 'LANCAMENTOSIMOVEL.IDLANCIMOVEL'
      Visible = False
    end
    object qryLancamentosFolhaNODOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'NODOCUMENTO'
      Origin = 'LANCAMENTOSIMOVEL.NODOCUMENTO'
      Visible = False
    end
    object qryLancamentosFolhaCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Origin = 'LANCAMENTOSIMOVEL.CODDOCUMENTO'
      Visible = False
    end
    object qryLancamentosFolhaDATALANCAMENTO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATALANCAMENTO'
      Origin = 'LANCAMENTOSIMOVEL.DATALANCAMENTO'
      Visible = False
    end
    object qryLancamentosFolhaVLRLANCPAGAR: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRLANCPAGAR'
      Origin = 'LANCAMENTOSIMOVEL.VLRLANCPAGAR'
      Visible = False
    end
    object qryLancamentosFolhaVLRLANCOMPAGAR: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRLANCOMPAGAR'
      Origin = 'LANCAMENTOSIMOVEL.VLRLANCOMPAGAR'
      Visible = False
    end
    object qryLancamentosFolhaRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'LANCAMENTOSIMOVEL.RECPAG'
      Visible = False
      Size = 1
    end
    object qryLancamentosFolhaMESREFERENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'MESREFERENCIA'
      Origin = 'LANCAMENTOSIMOVEL.MESREFERENCIA'
      Visible = False
    end
    object qryLancamentosFolhaANOREFERENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'ANOREFERENCIA'
      Origin = 'LANCAMENTOSIMOVEL.ANOREFERENCIA'
      Visible = False
    end
    object qryLancamentosFolhaFLGAGRUPAR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGAGRUPAR'
      Origin = 'LANCAMENTOSIMOVEL.FLGAGRUPAR'
      Visible = False
      Size = 1
    end
    object qryLancamentosFolhaVLRLANCOMRECEB: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRLANCOMRECEB'
      Origin = 'LANCAMENTOSIMOVEL.VLRLANCOMRECEB'
      Visible = False
    end
    object qryLancamentosFolhaVLRJUROS: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRJUROS'
      Origin = 'LANCAMENTOSIMOVEL.VLRJUROS'
      Visible = False
    end
    object qryLancamentosFolhaFLGORIGEMLANC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGORIGEMLANC'
      Origin = 'LANCAMENTOSIMOVEL.FLGORIGEMLANC'
      Visible = False
      Size = 1
    end
    object qryLancamentosFolhaVLRMULTA: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRMULTA'
      Origin = 'LANCAMENTOSIMOVEL.VLRMULTA'
      Visible = False
    end
    object qryLancamentosFolhaVLRCORRECAOMON: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRCORRECAOMON'
      Origin = 'LANCAMENTOSIMOVEL.VLRCORRECAOMON'
      Visible = False
    end
    object qryLancamentosFolhaFLGORIGEM: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGORIGEM'
      Origin = 'LANCAMENTOSIMOVEL.FLGORIGEM'
      Visible = False
    end
    object qryLancamentosFolhaPLNCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
      Origin = 'LANCAMENTOSIMOVEL.PLNCODIGO'
      Visible = False
    end
    object qryLancamentosFolhaSTATUS: TStringField
      DisplayWidth = 1
      FieldName = 'STATUS'
      Visible = False
      Size = 1
    end
    object qryLancamentosFolhaIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = '"CM.CONTRATOIMOVEL".IDCONTRATOIMOVEL'
      Visible = False
    end
  end
  object updLancamentosFolha: TUpdateSQL
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
      '  DATACORRECAO = :DATACORRECAO,'
      '  FLGMULTACALCULADA = :FLGMULTACALCULADA,'
      '  FLGINTEGRADO = :FLGINTEGRADO,'
      '  IDUSUARIOSISTEMA = :IDUSUARIOSISTEMA,'
      '  FLGORIGEM = :FLGORIGEM,'
      '  FLGESTORNADO = :FLGESTORNADO,'
      '  IDFORCLI = :IDFORCLI,'
      '  FLGORIGEMLANC = :FLGORIGEMLANC,'
      '  NODOCUMENTO = :NODOCUMENTO,'
      '  FLGERRO = :FLGERRO'
      'where'
      '  IDLANCIMOVEL = :OLD_IDLANCIMOVEL and'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL and'
      '  PLNCODIGO = :OLD_PLNCODIGO and'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO and'
      '  DATALANCAMENTO = :OLD_DATALANCAMENTO and'
      '  DATAVENCIMENTO = :OLD_DATAVENCIMENTO and'
      '  VLRLANCPAGAR = :OLD_VLRLANCPAGAR and'
      '  VLRLANCOMPAGAR = :OLD_VLRLANCOMPAGAR and'
      '  RECPAG = :OLD_RECPAG and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  ANOREFERENCIA = :OLD_ANOREFERENCIA and'
      '  MESCOMPETENCIA = :OLD_MESCOMPETENCIA and'
      '  ANOCOMPETENCIA = :OLD_ANOCOMPETENCIA and'
      '  FLGAGRUPAR = :OLD_FLGAGRUPAR and'
      '  VLRLANCOMRECEB = :OLD_VLRLANCOMRECEB and'
      '  VLRLANCRECEB = :OLD_VLRLANCRECEB and'
      '  VLRJUROS = :OLD_VLRJUROS and'
      '  VLRMULTA = :OLD_VLRMULTA and'
      '  VLRCORRECAOMON = :OLD_VLRCORRECAOMON and'
      '  FLGORIGEM = :OLD_FLGORIGEM and'
      '  FLGORIGEMLANC = :OLD_FLGORIGEMLANC and'
      '  NODOCUMENTO = :OLD_NODOCUMENTO')
    InsertSQL.Strings = (
      'insert into LANCAMENTOSIMOVEL'
      
        '  (IDLANCIMOVEL, MOEDARECEB, IDIMOVEL, IDCONTRATOIMOVEL, IDPESSO' +
        'A, PLNCODIGO, '
      
        '   IDTIPOCUSTORECIMO, CODDOCUMENTO, DATALANCAMENTO, DATAVENCIMEN' +
        'TO, VLRLANCPAGAR, '
      
        '   VLRLANCOMPAGAR, RECPAG, MESREFERENCIA, ANOREFERENCIA, MESCOMP' +
        'ETENCIA, '
      
        '   ANOCOMPETENCIA, FLGAGRUPAR, FLGAGRUPADO, FLGTIPOLANCAMENTO, M' +
        'OEDAPAGAR, '
      
        '   VLRLANCOMRECEB, VLRLANCRECEB, VLRJUROS, VLRMULTA, VLRCORRECAO' +
        'MON, DATACORRECAO, '
      
        '   FLGMULTACALCULADA, FLGINTEGRADO, IDUSUARIOSISTEMA, FLGORIGEM,' +
        ' FLGESTORNADO, '
      '   IDFORCLI, FLGORIGEMLANC, NODOCUMENTO, FLGERRO)'
      'values'
      
        '  (:IDLANCIMOVEL, :MOEDARECEB, :IDIMOVEL, :IDCONTRATOIMOVEL, :ID' +
        'PESSOA, '
      
        '   :PLNCODIGO, :IDTIPOCUSTORECIMO, :CODDOCUMENTO, :DATALANCAMENT' +
        'O, :DATAVENCIMENTO, '
      
        '   :VLRLANCPAGAR, :VLRLANCOMPAGAR, :RECPAG, :MESREFERENCIA, :ANO' +
        'REFERENCIA, '
      
        '   :MESCOMPETENCIA, :ANOCOMPETENCIA, :FLGAGRUPAR, :FLGAGRUPADO, ' +
        ':FLGTIPOLANCAMENTO, '
      
        '   :MOEDAPAGAR, :VLRLANCOMRECEB, :VLRLANCRECEB, :VLRJUROS, :VLRM' +
        'ULTA, :VLRCORRECAOMON, '
      
        '   :DATACORRECAO, :FLGMULTACALCULADA, :FLGINTEGRADO, :IDUSUARIOS' +
        'ISTEMA, '
      
        '   :FLGORIGEM, :FLGESTORNADO, :IDFORCLI, :FLGORIGEMLANC, :NODOCU' +
        'MENTO, '
      '   :FLGERRO)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTOSIMOVEL'
      'where'
      '  IDLANCIMOVEL = :OLD_IDLANCIMOVEL and'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL and'
      '  PLNCODIGO = :OLD_PLNCODIGO and'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO and'
      '  DATALANCAMENTO = :OLD_DATALANCAMENTO and'
      '  DATAVENCIMENTO = :OLD_DATAVENCIMENTO and'
      '  VLRLANCPAGAR = :OLD_VLRLANCPAGAR and'
      '  VLRLANCOMPAGAR = :OLD_VLRLANCOMPAGAR and'
      '  RECPAG = :OLD_RECPAG and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  ANOREFERENCIA = :OLD_ANOREFERENCIA and'
      '  MESCOMPETENCIA = :OLD_MESCOMPETENCIA and'
      '  ANOCOMPETENCIA = :OLD_ANOCOMPETENCIA and'
      '  FLGAGRUPAR = :OLD_FLGAGRUPAR and'
      '  VLRLANCOMRECEB = :OLD_VLRLANCOMRECEB and'
      '  VLRLANCRECEB = :OLD_VLRLANCRECEB and'
      '  VLRJUROS = :OLD_VLRJUROS and'
      '  VLRMULTA = :OLD_VLRMULTA and'
      '  VLRCORRECAOMON = :OLD_VLRCORRECAOMON and'
      '  FLGORIGEM = :OLD_FLGORIGEM and'
      '  FLGORIGEMLANC = :OLD_FLGORIGEMLANC and'
      '  NODOCUMENTO = :OLD_NODOCUMENTO')
    Left = 180
    Top = 316
  end
  object qryInsertGrupoRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO GRUPORATEIO'
      '   (IDGRUPORATEIO, GRRDESCRICAO, IMOCODIGO)'
      'VALUES'
      '   (:PIDGRUPORATEIO, :PGRRDESCRICAO, :PIMOCODIGO)')
    ValidateWithMask = True
    Left = 176
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PGRRDESCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMOCODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryInsertGrupoXImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO GRUPOXIMOVEL'
      '   (IDGRUPORATEIO, IDIMOVEL, GXIPERCENTRATEIO)'
      'VALUES'
      '   (:PIDGRUPORATEIO, :PIDIMOVEL, :PGXIPERCENTRATEIO)')
    ValidateWithMask = True
    Left = 176
    Top = 92
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PGXIPERCENTRATEIO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiGrupoXImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM GRUPOXIMOVEL'
      'WHERE IDGRUPORATEIO IN'
      '('
      'SELECT'
      '   G.IDGRUPORATEIO'
      'FROM'
      '   GRUPORATEIO G'
      'WHERE'
      '   ( G.IMOCODIGO =:PIMOCODIGO )'
      ')')
    ValidateWithMask = True
    Left = 176
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'PIMOCODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryImovel: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IDIMOVELMESTRE, I.IDIMOVEL, I.IDPESSOA,'
      ''
      '   I.IMONOME, I.IMOCODIGO,'
      '   I.IDCARTORIO, I.IMOMATRICULA,'
      ''
      '   I.CODTIPIMOVEL,'
      '   I.IDADMINIMOVEL, I.IDMARCA,'
      '   I.IDCARTEIRAINVEST, I.CODSUBCONTA,'
      ''
      '   I.IDPAIS, I.IDCIDADES, I.IMONOMEENDERECO,'
      '   I.IMOBAIRRO, I.IMOCEP,'
      '   I.IMOLOGRADOURO, I.IMONUMERO, I.IMOCOMPLEMENTO,'
      ''
      '   I.IMODATACONSTRUCAO, I.IMODATAHABITESE,'
      '   I.IMOFRACAOIDEAL, I.IMOAREA, I.IMOAREAGERENCIAL,'
      ''
      '   I.FLGTIPOIMOVEL, I.FLGSTATUSOCUPACAO,'
      '   I.FLGATIVO, I.FLGSTATUS, I.FLGCATIMOVEL,'
      ''
      '   I.IMODATACOMPRA,  I.IMOMOEDACOMPRA,  I.IMOVLRCOMPRA,'
      '   I.IMODATAMERCADO, I.IMOMOEDAMERCADO, I.IMOVLRMERCADO,'
      '   I.IMODATAREAVAL,  I.IMOMOEDAREAVAL,  I.IMOVLRREAVAL,'
      ''
      
        '   I.IMOPERCENTRATEIO,I.IMOVAGAS,I.IDDAIEACARTEIRA,I.IDCARTEIRAS' +
        'PC,'
      
        '   I.IMODESCRICAO,I.INDICECOMPRA,I.TAXACOMPRA, I.IMOAREACOMUM,I.' +
        'IMOAREATOTAL, I.CODIMOVELSPC, I.IMOOBSERVACAO'
      ''
      'FROM'
      '   IMOVEL I'
      ''
      'WHERE'
      '   ( I.IDPESSOA =:PIDEMPRESAPROP )'
      
        '   AND ( (:PFLGTIPOIMOVEL IS NULL ) OR (I.FLGTIPOIMOVEL =:PFLGTI' +
        'POIMOVEL) )'
      
        '   AND ( (:PIDIMOVELMESTRE IS NULL ) OR (I.IDIMOVELMESTRE =:PIDI' +
        'MOVELMESTRE) )'
      '   AND ( (:PIDIMOVEL IS NULL ) OR (I.IDIMOVEL =:PIDIMOVEL) )'
      '   AND ( (:PIMOCODIGO IS NULL ) OR (I.IMOCODIGO =:PIMOCODIGO) )'
      
        '   AND ( (:PIMOMATRICULA IS NULL ) OR (I.IMOMATRICULA =:PIMOMATR' +
        'ICULA) )'
      
        '   AND ( (:PCODTIPIMOVEL IS NULL ) OR (I.CODTIPIMOVEL =:PCODTIPI' +
        'MOVEL) )'
      
        '   AND ( (:PIDADMINIMOVEL IS NULL ) OR (I.IDADMINIMOVEL =:PIDADM' +
        'INIMOVEL) )'
      
        '   AND ( (:PIDCARTEIRAINVEST IS NULL ) OR (I.IDCARTEIRAINVEST =:' +
        'PIDCARTEIRAINVEST) )'
      
        '   AND ( (:PFLGSTATUSOCUPACAO IS NULL ) OR (I.FLGSTATUSOCUPACAO ' +
        '=:PFLGSTATUSOCUPACAO) )'
      '   AND ( (:PFLGSTATUS IS NULL ) OR (I.FLGSTATUS =:PFLGSTATUS) )'
      '   AND ( (:PFLGATIVO IS NULL ) OR (I.FLGATIVO =:PFLGATIVO) )'
      ''
      'ORDER BY IDIMOVEL'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 432
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGTIPOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGTIPOIMOVEL'
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
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PIMOCODIGO'
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
        DataType = ftString
        Name = 'PIMOMATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
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
        Name = 'PIDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUSOCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUSOCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUS'
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
        Name = 'PFLGATIVO'
        ParamType = ptUnknown
      end>
    object qryImovelIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
      Origin = '"CM.IMOVEL".IDIMOVELMESTRE'
    end
    object qryImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = '"CM.IMOVEL".IDIMOVEL'
    end
    object qryImovelIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.IMOVEL".IDPESSOA'
    end
    object qryImovelIMONOME: TStringField
      FieldName = 'IMONOME'
      Origin = '"CM.IMOVEL".IMONOME'
      Size = 60
    end
    object qryImovelIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Origin = '"CM.IMOVEL".IMOCODIGO'
      Size = 15
    end
    object qryImovelIDCARTORIO: TFloatField
      FieldName = 'IDCARTORIO'
      Origin = '"CM.IMOVEL".IDCARTORIO'
    end
    object qryImovelIMOMATRICULA: TStringField
      FieldName = 'IMOMATRICULA'
      Origin = '"CM.IMOVEL".IMOMATRICULA'
    end
    object qryImovelCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = '"CM.IMOVEL".CODTIPIMOVEL'
      Size = 5
    end
    object qryImovelIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
      Origin = '"CM.IMOVEL".IDADMINIMOVEL'
    end
    object qryImovelIDMARCA: TFloatField
      FieldName = 'IDMARCA'
      Origin = '"CM.IMOVEL".IDMARCA'
    end
    object qryImovelIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = '"CM.IMOVEL".IDCARTEIRAINVEST'
    end
    object qryImovelCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = '"CM.IMOVEL".CODSUBCONTA'
    end
    object qryImovelIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = '"CM.IMOVEL".IDPAIS'
    end
    object qryImovelIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = '"CM.IMOVEL".IDCIDADES'
    end
    object qryImovelIMOBAIRRO: TStringField
      FieldName = 'IMOBAIRRO'
      Origin = '"CM.IMOVEL".IMOBAIRRO'
    end
    object qryImovelIMOCEP: TStringField
      FieldName = 'IMOCEP'
      Origin = '"CM.IMOVEL".IMOCEP'
      Size = 8
    end
    object qryImovelIMONUMERO: TStringField
      FieldName = 'IMONUMERO'
      Origin = '"CM.IMOVEL".IMONUMERO'
      Size = 8
    end
    object qryImovelIMOCOMPLEMENTO: TStringField
      FieldName = 'IMOCOMPLEMENTO'
      Origin = '"CM.IMOVEL".IMOCOMPLEMENTO'
    end
    object qryImovelIMODATACONSTRUCAO: TDateTimeField
      FieldName = 'IMODATACONSTRUCAO'
      Origin = '"CM.IMOVEL".IMODATACONSTRUCAO'
    end
    object qryImovelIMODATAHABITESE: TDateTimeField
      FieldName = 'IMODATAHABITESE'
      Origin = '"CM.IMOVEL".IMODATAHABITESE'
    end
    object qryImovelIMOFRACAOIDEAL: TFloatField
      FieldName = 'IMOFRACAOIDEAL'
      Origin = '"CM.IMOVEL".IMOFRACAOIDEAL'
    end
    object qryImovelIMOAREA: TFloatField
      FieldName = 'IMOAREA'
      Origin = '"CM.IMOVEL".IMOAREA'
    end
    object qryImovelIMOAREAGERENCIAL: TFloatField
      FieldName = 'IMOAREAGERENCIAL'
      Origin = '"CM.IMOVEL".IMOAREAGERENCIAL'
    end
    object qryImovelFLGTIPOIMOVEL: TFloatField
      FieldName = 'FLGTIPOIMOVEL'
      Origin = '"CM.IMOVEL".FLGTIPOIMOVEL'
    end
    object qryImovelFLGSTATUSOCUPACAO: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      Origin = '"CM.IMOVEL".FLGSTATUSOCUPACAO'
      Size = 1
    end
    object qryImovelFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
      Origin = '"CM.IMOVEL".FLGATIVO'
    end
    object qryImovelFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = '"CM.IMOVEL".FLGSTATUS'
      Size = 1
    end
    object qryImovelFLGCATIMOVEL: TStringField
      FieldName = 'FLGCATIMOVEL'
      Origin = '"CM.IMOVEL".FLGCATIMOVEL'
      Size = 1
    end
    object qryImovelIMODATACOMPRA: TDateTimeField
      FieldName = 'IMODATACOMPRA'
      Origin = '"CM.IMOVEL".IMODATACOMPRA'
    end
    object qryImovelIMOMOEDACOMPRA: TFloatField
      FieldName = 'IMOMOEDACOMPRA'
      Origin = '"CM.IMOVEL".IMOMOEDACOMPRA'
    end
    object qryImovelIMOVLRCOMPRA: TFloatField
      FieldName = 'IMOVLRCOMPRA'
      Origin = '"CM.IMOVEL".IMOVLRCOMPRA'
    end
    object qryImovelIMODATAMERCADO: TDateTimeField
      FieldName = 'IMODATAMERCADO'
      Origin = '"CM.IMOVEL".IMODATAMERCADO'
    end
    object qryImovelIMOMOEDAMERCADO: TFloatField
      FieldName = 'IMOMOEDAMERCADO'
      Origin = '"CM.IMOVEL".IMOMOEDAMERCADO'
    end
    object qryImovelIMOVLRMERCADO: TFloatField
      FieldName = 'IMOVLRMERCADO'
      Origin = '"CM.IMOVEL".IMOVLRMERCADO'
    end
    object qryImovelIMODATAREAVAL: TDateTimeField
      FieldName = 'IMODATAREAVAL'
      Origin = '"CM.IMOVEL".IMODATAREAVAL'
    end
    object qryImovelIMOMOEDAREAVAL: TFloatField
      FieldName = 'IMOMOEDAREAVAL'
      Origin = '"CM.IMOVEL".IMOMOEDAREAVAL'
    end
    object qryImovelIMOVLRREAVAL: TFloatField
      FieldName = 'IMOVLRREAVAL'
      Origin = '"CM.IMOVEL".IMOVLRREAVAL'
    end
    object qryImovelIMOPERCENTRATEIO: TFloatField
      FieldName = 'IMOPERCENTRATEIO'
      Origin = '"CM.IMOVEL".IMOPERCENTRATEIO'
    end
    object qryImovelIMONOMEENDERECO: TStringField
      FieldName = 'IMONOMEENDERECO'
      Origin = 'IMOVEL.IMONOMEENDERECO'
      Size = 60
    end
    object qryImovelIMOLOGRADOURO: TStringField
      FieldName = 'IMOLOGRADOURO'
      Origin = 'IMOVEL.IMOLOGRADOURO'
      Size = 80
    end
    object qryImovelIMOVAGAS: TFloatField
      FieldName = 'IMOVAGAS'
      Origin = 'BASEDADOS.IMOVEL.IMOVAGAS'
    end
    object qryImovelIDDAIEACARTEIRA: TFloatField
      FieldName = 'IDDAIEACARTEIRA'
      Origin = 'BASEDADOS.IMOVEL.IDDAIEACARTEIRA'
    end
    object qryImovelIDCARTEIRASPC: TFloatField
      FieldName = 'IDCARTEIRASPC'
      Origin = 'BASEDADOS.IMOVEL.IDCARTEIRASPC'
    end
    object qryImovelIMODESCRICAO: TMemoField
      FieldName = 'IMODESCRICAO'
      Origin = 'BASEDADOS.IMOVEL.IMODESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryImovelINDICECOMPRA: TFloatField
      FieldName = 'INDICECOMPRA'
      Origin = 'BASEDADOS.IMOVEL.INDICECOMPRA'
    end
    object qryImovelTAXACOMPRA: TFloatField
      FieldName = 'TAXACOMPRA'
      Origin = 'BASEDADOS.IMOVEL.TAXACOMPRA'
    end
    object qryImovelIMOAREACOMUM: TFloatField
      FieldName = 'IMOAREACOMUM'
      Origin = 'BASEDADOS.IMOVEL.IMOAREACOMUM'
    end
    object qryImovelIMOAREATOTAL: TFloatField
      FieldName = 'IMOAREATOTAL'
      Origin = 'BASEDADOS.IMOVEL.IMOAREATOTAL'
    end
    object qryImovelCODIMOVELSPC: TFloatField
      FieldName = 'CODIMOVELSPC'
      Origin = 'BASEDADOS.IMOVEL.CODIMOVELSPC'
    end
    object qryImovelIMOOBSERVACAO: TMemoField
      FieldName = 'IMOOBSERVACAO'
      Origin = 'BASEDADOS.IMOVEL.IMOOBSERVACAO'
      BlobType = ftMemo
      Size = 2000
    end
  end
  object qryGrupoRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   G.IDGRUPORATEIO'
      'FROM'
      '   GRUPORATEIO G'
      'WHERE'
      '   ( G.IMOCODIGO =:PIMOCODIGO )')
    ValidateWithMask = True
    Left = 176
    Top = 68
    ParamData = <
      item
        DataType = ftString
        Name = 'PIMOCODIGO'
        ParamType = ptUnknown
      end>
    object qryGrupoRateioIDGRUPORATEIO: TFloatField
      FieldName = 'IDGRUPORATEIO'
      Origin = '"CM.GRUPORATEIO".IDGRUPORATEIO'
    end
  end
  object qryParamContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   PARAMCONTAB P'
      'WHERE'
      '   ( P.IDPESSOA =:PIDPESSOA )')
    ValidateWithMask = True
    Left = 560
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamContabIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PARAMCONTAB.IDPESSOA'
    end
    object qryParamContabPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PARAMCONTAB.PLANO'
    end
    object qryParamContabPACMOEDACOTAS: TFloatField
      FieldName = 'PACMOEDACOTAS'
      Origin = 'PARAMCONTAB.PACMOEDACOTAS'
    end
    object qryParamContabPACHISTDEFSUP: TStringField
      FieldName = 'PACHISTDEFSUP'
      Origin = 'PARAMCONTAB.PACHISTDEFSUP'
      Size = 4
    end
    object qryParamContabPACCONRESULT: TStringField
      FieldName = 'PACCONRESULT'
      Origin = 'PARAMCONTAB.PACCONRESULT'
      Size = 18
    end
    object qryParamContabPACFORMDEFITECN: TStringField
      FieldName = 'PACFORMDEFITECN'
      Origin = 'PARAMCONTAB.PACFORMDEFITECN'
      Size = 18
    end
    object qryParamContabPACTIPOPERLANC: TStringField
      FieldName = 'PACTIPOPERLANC'
      Origin = 'PARAMCONTAB.PACTIPOPERLANC'
      Size = 2
    end
    object qryParamContabPACRESEMAT: TStringField
      FieldName = 'PACRESEMAT'
      Origin = 'PARAMCONTAB.PACRESEMAT'
      Size = 18
    end
    object qryParamContabPACREDUZA: TFloatField
      FieldName = 'PACREDUZA'
      Origin = 'PARAMCONTAB.PACREDUZA'
    end
    object qryParamContabPACPROGPREV: TStringField
      FieldName = 'PACPROGPREV'
      Origin = 'PARAMCONTAB.PACPROGPREV'
      Size = 18
    end
    object qryParamContabPACPERDAGANHO: TStringField
      FieldName = 'PACPERDAGANHO'
      Origin = 'PARAMCONTAB.PACPERDAGANHO'
      Size = 18
    end
    object qryParamContabPACRESECONT: TStringField
      FieldName = 'PACRESECONT'
      Origin = 'PARAMCONTAB.PACRESECONT'
      Size = 18
    end
    object qryParamContabPACREVEDEFITECN: TStringField
      FieldName = 'PACREVEDEFITECN'
      Origin = 'PARAMCONTAB.PACREVEDEFITECN'
      Size = 18
    end
    object qryParamContabPACREDUZP: TFloatField
      FieldName = 'PACREDUZP'
      Origin = 'PARAMCONTAB.PACREDUZP'
    end
    object qryParamContabPACFORMSUPETECN: TStringField
      FieldName = 'PACFORMSUPETECN'
      Origin = 'PARAMCONTAB.PACFORMSUPETECN'
      Size = 18
    end
    object qryParamContabPACTIPOPERMOEDA: TStringField
      FieldName = 'PACTIPOPERMOEDA'
      Origin = 'PARAMCONTAB.PACTIPOPERMOEDA'
      Size = 2
    end
    object qryParamContabPACREDUZR: TFloatField
      FieldName = 'PACREDUZR'
      Origin = 'PARAMCONTAB.PACREDUZR'
    end
    object qryParamContabPACREVESUPETECN: TStringField
      FieldName = 'PACREVESUPETECN'
      Origin = 'PARAMCONTAB.PACREVESUPETECN'
      Size = 18
    end
    object qryParamContabPACDEFITECN: TStringField
      FieldName = 'PACDEFITECN'
      Origin = 'PARAMCONTAB.PACDEFITECN'
      Size = 18
    end
    object qryParamContabPACREDUZD: TFloatField
      FieldName = 'PACREDUZD'
      Origin = 'PARAMCONTAB.PACREDUZD'
    end
    object qryParamContabPACFDOCOBOSCRISC: TStringField
      FieldName = 'PACFDOCOBOSCRISC'
      Origin = 'PARAMCONTAB.PACFDOCOBOSCRISC'
      Size = 18
    end
    object qryParamContabPACREDUZC: TFloatField
      FieldName = 'PACREDUZC'
      Origin = 'PARAMCONTAB.PACREDUZC'
    end
    object qryParamContabPACREDUAI: TFloatField
      FieldName = 'PACREDUAI'
      Origin = 'PARAMCONTAB.PACREDUAI'
    end
    object qryParamContabPACREDUPI: TFloatField
      FieldName = 'PACREDUPI'
      Origin = 'PARAMCONTAB.PACREDUPI'
    end
    object qryParamContabPACREDURI: TFloatField
      FieldName = 'PACREDURI'
      Origin = 'PARAMCONTAB.PACREDURI'
    end
    object qryParamContabPACREDUDI: TFloatField
      FieldName = 'PACREDUDI'
      Origin = 'PARAMCONTAB.PACREDUDI'
    end
    object qryParamContabPACREDUCI: TFloatField
      FieldName = 'PACREDUCI'
      Origin = 'PARAMCONTAB.PACREDUCI'
    end
    object qryParamContabPACREDUAF: TFloatField
      FieldName = 'PACREDUAF'
      Origin = 'PARAMCONTAB.PACREDUAF'
    end
    object qryParamContabPACREDUPF: TFloatField
      FieldName = 'PACREDUPF'
      Origin = 'PARAMCONTAB.PACREDUPF'
    end
    object qryParamContabPACREDURF: TFloatField
      FieldName = 'PACREDURF'
      Origin = 'PARAMCONTAB.PACREDURF'
    end
    object qryParamContabPACREDUDF: TFloatField
      FieldName = 'PACREDUDF'
      Origin = 'PARAMCONTAB.PACREDUDF'
    end
    object qryParamContabPACREDUCF: TFloatField
      FieldName = 'PACREDUCF'
      Origin = 'PARAMCONTAB.PACREDUCF'
    end
    object qryParamContabPACDIAMES: TStringField
      FieldName = 'PACDIAMES'
      Origin = 'PARAMCONTAB.PACDIAMES'
      Size = 1
    end
    object qryParamContabPACDEBCRE: TStringField
      FieldName = 'PACDEBCRE'
      Origin = 'PARAMCONTAB.PACDEBCRE'
      Size = 1
    end
    object qryParamContabPACTOTPLANERRO: TFloatField
      FieldName = 'PACTOTPLANERRO'
      Origin = 'PARAMCONTAB.PACTOTPLANERRO'
    end
    object qryParamContabPACTOTAIS: TStringField
      FieldName = 'PACTOTAIS'
      Origin = 'PARAMCONTAB.PACTOTAIS'
      Size = 1
    end
    object qryParamContabPACDEBCREPLANERRO: TFloatField
      FieldName = 'PACDEBCREPLANERRO'
      Origin = 'PARAMCONTAB.PACDEBCREPLANERRO'
    end
    object qryParamContabPACCODRED: TStringField
      FieldName = 'PACCODRED'
      Origin = 'PARAMCONTAB.PACCODRED'
      Size = 1
    end
    object qryParamContabPACPAGINA: TFloatField
      FieldName = 'PACPAGINA'
      Origin = 'PARAMCONTAB.PACPAGINA'
    end
    object qryParamContabPACULTDAT: TDateTimeField
      FieldName = 'PACULTDAT'
      Origin = 'PARAMCONTAB.PACULTDAT'
    end
    object qryParamContabPACENCER: TStringField
      FieldName = 'PACENCER'
      Origin = 'PARAMCONTAB.PACENCER'
      Size = 1
    end
    object qryParamContabPACINDICE: TStringField
      FieldName = 'PACINDICE'
      Origin = 'PARAMCONTAB.PACINDICE'
      Size = 3
    end
    object qryParamContabPACATSAL: TStringField
      FieldName = 'PACATSAL'
      Origin = 'PARAMCONTAB.PACATSAL'
      Size = 1
    end
    object qryParamContabPACMANTEM: TStringField
      FieldName = 'PACMANTEM'
      Origin = 'PARAMCONTAB.PACMANTEM'
      Size = 1
    end
    object qryParamContabPACMOEDAGERENCIAL: TFloatField
      FieldName = 'PACMOEDAGERENCIAL'
      Origin = 'PARAMCONTAB.PACMOEDAGERENCIAL'
    end
    object qryParamContabPACMOEDAGEREN1: TFloatField
      FieldName = 'PACMOEDAGEREN1'
      Origin = 'PARAMCONTAB.PACMOEDAGEREN1'
    end
    object qryParamContabPACMOEDAGEREN2: TFloatField
      FieldName = 'PACMOEDAGEREN2'
      Origin = 'PARAMCONTAB.PACMOEDAGEREN2'
    end
    object qryParamContabPACMOEDAOFICIAL: TFloatField
      FieldName = 'PACMOEDAOFICIAL'
      Origin = 'PARAMCONTAB.PACMOEDAOFICIAL'
    end
    object qryParamContabIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'PARAMCONTAB.IDUSUARIOINCLUSAO'
    end
    object qryParamContabPACSUBGRP1: TStringField
      FieldName = 'PACSUBGRP1'
      Origin = 'PARAMCONTAB.PACSUBGRP1'
      Size = 15
    end
    object qryParamContabPACSUBGRP2: TStringField
      FieldName = 'PACSUBGRP2'
      Origin = 'PARAMCONTAB.PACSUBGRP2'
      Size = 15
    end
    object qryParamContabPACSUBGRP3: TStringField
      FieldName = 'PACSUBGRP3'
      Origin = 'PARAMCONTAB.PACSUBGRP3'
      Size = 15
    end
    object qryParamContabPACSUBGRP4: TStringField
      FieldName = 'PACSUBGRP4'
      Origin = 'PARAMCONTAB.PACSUBGRP4'
      Size = 15
    end
    object qryParamContabPACREDUZO: TFloatField
      FieldName = 'PACREDUZO'
      Origin = 'PARAMCONTAB.PACREDUZO'
    end
    object qryParamContabPACREDUOI: TFloatField
      FieldName = 'PACREDUOI'
      Origin = 'PARAMCONTAB.PACREDUOI'
    end
    object qryParamContabPACREDUOF: TFloatField
      FieldName = 'PACREDUOF'
      Origin = 'PARAMCONTAB.PACREDUOF'
    end
    object qryParamContabPACEXERCICIOATUAL: TFloatField
      FieldName = 'PACEXERCICIOATUAL'
      Origin = 'PARAMCONTAB.PACEXERCICIOATUAL'
    end
    object qryParamContabPACPERNULLATUALIZ: TFloatField
      FieldName = 'PACPERNULLATUALIZ'
      Origin = 'PARAMCONTAB.PACPERNULLATUALIZ'
    end
    object qryParamContabPACESTORNA: TStringField
      FieldName = 'PACESTORNA'
      Origin = 'PARAMCONTAB.PACESTORNA'
      Size = 1
    end
    object qryParamContabPACOBRIGAHIST: TStringField
      FieldName = 'PACOBRIGAHIST'
      Origin = 'PARAMCONTAB.PACOBRIGAHIST'
      Size = 1
    end
    object qryParamContabPACDOBRADA: TStringField
      FieldName = 'PACDOBRADA'
      Origin = 'PARAMCONTAB.PACDOBRADA'
      Size = 1
    end
    object qryParamContabPACTIPOPERRESULT: TStringField
      FieldName = 'PACTIPOPERRESULT'
      Origin = 'PARAMCONTAB.PACTIPOPERRESULT'
      Size = 2
    end
    object qryParamContabPACREDUZE: TFloatField
      FieldName = 'PACREDUZE'
      Origin = 'PARAMCONTAB.PACREDUZE'
    end
    object qryParamContabPACREDUEI: TFloatField
      FieldName = 'PACREDUEI'
      Origin = 'PARAMCONTAB.PACREDUEI'
    end
    object qryParamContabPACREDUEF: TFloatField
      FieldName = 'PACREDUEF'
      Origin = 'PARAMCONTAB.PACREDUEF'
    end
    object qryParamContabPACTIPOPERIMPTXT: TStringField
      FieldName = 'PACTIPOPERIMPTXT'
      Origin = 'PARAMCONTAB.PACTIPOPERIMPTXT'
      Size = 2
    end
    object qryParamContabPACOBRIGADATA: TStringField
      FieldName = 'PACOBRIGADATA'
      Origin = 'PARAMCONTAB.PACOBRIGADATA'
      Size = 1
    end
    object qryParamContabPACCONTRANATUR: TStringField
      FieldName = 'PACCONTRANATUR'
      Origin = 'PARAMCONTAB.PACCONTRANATUR'
      Size = 1
    end
    object qryParamContabPACCORRESPOND: TStringField
      FieldName = 'PACCORRESPOND'
      Origin = 'PARAMCONTAB.PACCORRESPOND'
      Size = 1
    end
    object qryParamContabPACORDEMSUBCONTA: TStringField
      FieldName = 'PACORDEMSUBCONTA'
      Origin = 'PARAMCONTAB.PACORDEMSUBCONTA'
      Size = 1
    end
    object qryParamContabPACNUMDOC: TStringField
      FieldName = 'PACNUMDOC'
      Origin = 'PARAMCONTAB.PACNUMDOC'
      Size = 1
    end
    object qryParamContabPACATIVPROJ: TStringField
      FieldName = 'PACATIVPROJ'
      Origin = 'PARAMCONTAB.PACATIVPROJ'
      Size = 1
    end
    object qryParamContabPACTIPOOPER: TStringField
      FieldName = 'PACTIPOOPER'
      Origin = 'PARAMCONTAB.PACTIPOOPER'
      Size = 1
    end
    object qryParamContabPACVALIDAPROC: TStringField
      FieldName = 'PACVALIDAPROC'
      Origin = 'PARAMCONTAB.PACVALIDAPROC'
      Size = 1
    end
    object qryParamContabFLGTIPOFECHAMENTO: TStringField
      FieldName = 'FLGTIPOFECHAMENTO'
      Origin = 'PARAMCONTAB.FLGTIPOFECHAMENTO'
      Size = 1
    end
    object qryParamContabDATAULTFECHA: TDateTimeField
      FieldName = 'DATAULTFECHA'
      Origin = 'PARAMCONTAB.DATAULTFECHA'
    end
    object qryParamContabIDULTREFERENCIA: TFloatField
      FieldName = 'IDULTREFERENCIA'
      Origin = 'PARAMCONTAB.IDULTREFERENCIA'
    end
    object qryParamContabTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.PARAMCONTAB.TRGDTINCLUSAO'
    end
    object qryParamContabTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.PARAMCONTAB.TRGUSERINCLUSAO'
      Size = 30
    end
  end
  object qryContratoXImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '-- Foi adicionado ao Join da query o campo IMOVEL IP'
      'SELECT'
      '   CX.CIMDTINI, CX.CIMDTFIM,'
      '   CX.IDCONTRATOIMOVEL, CX.IDIMOVEL,'
      '   CX.CIMVLRALUGUEL, CX.CIMVLRAJUSTADO,'
      ''
      '   -- Daniel - 24085'
      
        '   DECODE(I.IDIMOVELPAI,NULL,I.IMONOME,DECODE(I.IMONOME,NULL,IP.' +
        'IMONOME,IP.IMONOME||'#39' - '#39'||I.IMONOME) )  AS NOME_IMOVEL,'
      ''
      '   IM.IMONOME AS NOME_MESTRE,'
      '   I.CODTIPIMOVEL'
      'FROM'
      '   CONTRATOXIMOVEL CX,'
      '   IMOVEL I, IMOVEL IP, IMOVEL IM'
      ''
      'WHERE'
      '       ( CX.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      ''
      '   AND ( I.IDIMOVELPAI = IP.IDIMOVEL(+) )'
      ''
      
        '   AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (CX.IDCONTRATOIMOVEL =:' +
        'PIDCONTRATOIMOVEL) )'
      '   AND ( (:PIDIMOVEL IS NULL) OR (CX.IDIMOVEL =:PIDIMOVEL) )'
      ''
      
        '  AND ( (:PANOMES IS NULL) OR ( (CX.CIMDTFIM IS NOT NULL AND TO_' +
        'CHAR(:PANOMES,'#39'YYYYMM'#39') BETWEEN TO_CHAR(CX.CIMDTINI,'#39'YYYYMM'#39') AN' +
        'D TO_CHAR(CX.CIMDTFIM,'#39'YYYYMM'#39') OR'
      
        '        (CX.CIMDTFIM IS NULL AND TO_CHAR(:PANOMES,'#39'YYYYMM'#39') >= T' +
        'O_CHAR(CX.CIMDTINI,'#39'YYYYMM'#39')))) )'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 224
    Top = 304
    ParamData = <
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
        DataType = ftDateTime
        Name = 'PANOMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PANOMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PANOMES'
        ParamType = ptUnknown
      end>
    object qryContratoXImovelIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'CONTRATOXIMOVEL.IDCONTRATOIMOVEL'
    end
    object qryContratoXImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'CONTRATOXIMOVEL.IDIMOVEL'
    end
    object qryContratoXImovelCIMVLRALUGUEL: TFloatField
      FieldName = 'CIMVLRALUGUEL'
      Origin = 'CONTRATOXIMOVEL.CIMVLRALUGUEL'
    end
    object qryContratoXImovelCIMVLRAJUSTADO: TFloatField
      FieldName = 'CIMVLRAJUSTADO'
      Origin = 'CONTRATOXIMOVEL.CIMVLRAJUSTADO'
    end
    object qryContratoXImovelNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Origin = '"CM.IMOVEL".IMONOME'
      Size = 60
    end
    object qryContratoXImovelNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Origin = '"CM.IMOVEL".IMONOME'
      Size = 60
    end
    object qryContratoXImovelCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.IMOVEL.CODTIPIMOVEL'
      Size = 5
    end
    object qryContratoXImovelCIMDTINI: TDateTimeField
      FieldName = 'CIMDTINI'
      Origin = 'BASEDADOS.CONTRATOXIMOVEL.CIMDTINI'
    end
    object qryContratoXImovelCIMDTFIM: TDateTimeField
      FieldName = 'CIMDTFIM'
      Origin = 'BASEDADOS.CONTRATOXIMOVEL.CIMDTFIM'
    end
  end
  object qryUpdateCXI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   CONTRATOXIMOVEL'
      'SET'
      '   CIMVLRAJUSTADO =:PCIMVLRAJUSTADO,'
      '   CIMVLRALUGUEL =:PCIMVLRALUGUEL'
      'WHERE'
      '   IDCONTRATOIMOVEL =:PIDCONTRATOIMOVEL AND'
      '   IDIMOVEL =:PIDIMOVEL'
      '')
    ValidateWithMask = True
    Left = 648
    Top = 247
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PCIMVLRAJUSTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PCIMVLRALUGUEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
    object FloatField25: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object FloatField26: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object FloatField27: TFloatField
      FieldName = 'CIMVLRALUGUEL'
    end
    object FloatField28: TFloatField
      FieldName = 'CIMVLRAJUSTADO'
    end
    object FloatField29: TFloatField
      FieldName = 'MOECODIGO'
    end
    object FloatField30: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object FloatField31: TFloatField
      FieldName = 'CONDIAVENCIMENTO'
    end
    object FloatField32: TFloatField
      FieldName = 'CONDIACOMPLEMENTO'
    end
    object StringField11: TStringField
      FieldName = 'FLGTIPOALUGUEL'
      Size = 1
    end
    object StringField12: TStringField
      FieldName = 'FLGTIPOCOBRANCA'
      Size = 1
    end
    object FloatField33: TFloatField
      FieldName = 'FLGMESPOSTERIOR'
    end
    object StringField13: TStringField
      FieldName = 'FLGCOMPETALUGUEL'
      Size = 1
    end
    object StringField14: TStringField
      FieldName = 'FLGSTATUS'
      Size = 1
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'CONPROXREAJUSTE'
    end
    object FloatField34: TFloatField
      FieldName = 'CONPERREAJUSTE'
    end
    object StringField15: TStringField
      FieldName = 'IMONOME'
      Size = 60
    end
  end
  object qryUpdateContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '   CONTRATOIMOVEL '
      'SET '
      '   CONVLRAJUSTADO =:VALOR,'
      '   CONDATAREAJUSTE =:DATAREAJUSTE,'
      '   CONPROXREAJUSTE =:DATAPROXREAJUSTE'
      'WHERE '
      '   IDCONTRATOIMOVEL =:CONTRATO')
    ValidateWithMask = True
    Left = 432
    Top = 328
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAREAJUSTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAPROXREAJUSTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
  end
  object qryContratosFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRATOIMOVEL,'
      '       C.CONNUMERO, C.CONNOME,'
      '       C.IDTIPOCUSTORECIMO,'
      
        '       C.IDLOCATARIO, C.CONDATAINICIO, C.CONDATACARENCIA, C.COND' +
        'ATAINICAREN,'
      '       C.MOECODIGO, C.CONDIAVENCIMENTO,'
      '       C.CONDIACOMPLEMENTO, C.FLGTIPOALUGUEL,'
      '       C.FLGTIPOCOBRANCA, C.FLGMESPOSTERIOR,'
      '       C.FLGCOMPETALUGUEL, C.FLGSTATUS, C.CONDATAREAJUSTE,'
      '       C.CONPROXREAJUSTE, C.CONPERREAJUSTE,'
      '       C.FLGTIPODIAVENC,'
      '       C.IDPAIS, C.CODESTADO, C.IDCIDADES,'
      '       C.CONINDICEREAJUSTE, C.CONVLRAJUSTADO,'
      '       C.CONDATAFIM, C.CONPERALUGUEL, C.FLGINDETERMINADO,'
      '       C.IDMSGBOLETO,'
      
        '       C.CONDIASTOLERANCIA, C.FLGTIPODIATOLERA, C.CONDIASREPASSE' +
        ','
      '       C.CONVLRMULTA, C.CONMOEDAMULTA, C.CONPERCENTMULTA,'
      
        '       C.CONVLRMORA, C.CONMOEDAMORA, C.CONPERCENTMORA, C.CONPERM' +
        'ORA,'
      '       C.FLGMORAPROPORC, C.CODPORTFORMA'
      ''
      '  FROM CONTRATOIMOVEL C'
      ' WHERE ( C.IDPESSOA = :PIDPESSOA )'
      '   AND ( C.FLGTIPOCONTRATO = :PFLGTIPOCONTRATO )'
      '   AND ( C.CONDATAINICIO <= :PCONDATAINICIO )'
      
        '   AND ( ( C.CONDATAFIM >= :PCONDATAFIM ) OR ( C.FLGINDETERMINAD' +
        'O = '#39'S'#39' ) )'
      
        '   AND (    ( (C.CONDATAINICAREN IS NULL) AND (C.CONDATACARENCIA' +
        ' < TO_DATE(:PCONDATAFIMCARENCIA,'#39'DD/MM/YYYY'#39') ) )'
      
        '         OR ( TO_DATE(TO_CHAR(C.CONDATAINICAREN,'#39'DD/MM/YYYY'#39'),'#39'D' +
        'D/MM/YYYY'#39') - TO_DATE(:PCONDATAINICARENCIA,'#39'DD/MM/YYYY'#39') > 0 )'
      
        '         OR ( TO_DATE(:PCONDATAFIMCARENCIA,'#39'DD/MM/YYYY'#39') - TO_DA' +
        'TE(TO_CHAR(C.CONDATACARENCIA,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39') > 0 )  ' +
        '  )'
      ''
      
        '   AND ( (:PIDCONTRATOIMOVEL IS NULL ) OR (C.IDCONTRATOIMOVEL = ' +
        ':PIDCONTRATOIMOVEL) )'
      
        '   AND ( (:PFLGCOBRANCAAUTO IS NULL ) OR ( C.FLGCOBRANCAAUTO =:P' +
        'FLGCOBRANCAAUTO ) )'
      
        '   AND ( (:PIDADMINIMOVEL IS NULL) OR (C.IDADMINIMOVEL =:PIDADMI' +
        'NIMOVEL) )'
      
        '   AND ( (:PIDRESPONSAVEL IS NULL) OR (C.IDRESPONSAVEL =:PIDRESP' +
        'ONSAVEL) )'
      
        '   AND ( (:PCODPORTFORMA IS NULL) OR (C.CODPORTFORMA =:PCODPORTF' +
        'ORMA) )'
      
        '   AND ( (:PINDICEREAJUSTE IS NULL) OR (C.CONINDICEREAJUSTE =:PI' +
        'NDICEREAJUSTE) )'
      
        '   AND ( (:PIDTIPOCUSTORECIMO IS NULL) OR (C.IDTIPOCUSTORECIMO =' +
        ':PIDTIPOCUSTORECIMO) )'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 292
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PCONDATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PCONDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCONDATAFIMCARENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCONDATAINICARENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCONDATAFIMCARENCIA'
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
        Name = 'PFLGCOBRANCAAUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGCOBRANCAAUTO'
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
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
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
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end>
    object qryContratosFolhaIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = '"CM.CONTRATOIMOVEL".IDCONTRATOIMOVEL'
    end
    object qryContratosFolhaIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = '"CM.CONTRATOIMOVEL".IDTIPOCUSTORECIMO'
    end
    object qryContratosFolhaIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
      Origin = '"CM.CONTRATOIMOVEL".IDLOCATARIO'
    end
    object qryContratosFolhaCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAINICIO'
    end
    object qryContratosFolhaCONDATACARENCIA: TDateTimeField
      FieldName = 'CONDATACARENCIA'
      Origin = '"CM.CONTRATOIMOVEL".CONDATACARENCIA'
    end
    object qryContratosFolhaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = '"CM.CONTRATOIMOVEL".MOECODIGO'
    end
    object qryContratosFolhaCONDIAVENCIMENTO: TFloatField
      FieldName = 'CONDIAVENCIMENTO'
      Origin = '"CM.CONTRATOIMOVEL".CONDIAVENCIMENTO'
    end
    object qryContratosFolhaCONDIACOMPLEMENTO: TFloatField
      FieldName = 'CONDIACOMPLEMENTO'
      Origin = '"CM.CONTRATOIMOVEL".CONDIACOMPLEMENTO'
    end
    object qryContratosFolhaFLGTIPOALUGUEL: TStringField
      FieldName = 'FLGTIPOALUGUEL'
      Origin = '"CM.CONTRATOIMOVEL".FLGTIPOALUGUEL'
      Size = 1
    end
    object qryContratosFolhaFLGTIPOCOBRANCA: TStringField
      FieldName = 'FLGTIPOCOBRANCA'
      Origin = '"CM.CONTRATOIMOVEL".FLGTIPOCOBRANCA'
      Size = 1
    end
    object qryContratosFolhaFLGMESPOSTERIOR: TFloatField
      FieldName = 'FLGMESPOSTERIOR'
      Origin = '"CM.CONTRATOIMOVEL".FLGMESPOSTERIOR'
    end
    object qryContratosFolhaFLGCOMPETALUGUEL: TStringField
      FieldName = 'FLGCOMPETALUGUEL'
      Origin = '"CM.CONTRATOIMOVEL".FLGCOMPETALUGUEL'
      Size = 1
    end
    object qryContratosFolhaFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = '"CM.CONTRATOIMOVEL".FLGSTATUS'
      Size = 1
    end
    object qryContratosFolhaCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAREAJUSTE'
    end
    object qryContratosFolhaCONPROXREAJUSTE: TDateTimeField
      FieldName = 'CONPROXREAJUSTE'
      Origin = '"CM.CONTRATOIMOVEL".CONPROXREAJUSTE'
    end
    object qryContratosFolhaCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
      Origin = '"CM.CONTRATOIMOVEL".CONPERREAJUSTE'
    end
    object qryContratosFolhaFLGTIPODIAVENC: TStringField
      FieldName = 'FLGTIPODIAVENC'
      Origin = '"CM.CONTRATOIMOVEL".FLGTIPODIAVENC'
      Size = 1
    end
    object qryContratosFolhaIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = '"CM.CONTRATOIMOVEL".IDPAIS'
    end
    object qryContratosFolhaCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = '"CM.CONTRATOIMOVEL".CODESTADO'
      Size = 3
    end
    object qryContratosFolhaIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = '"CM.CONTRATOIMOVEL".IDCIDADES'
    end
    object qryContratosFolhaCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
      Origin = '"CM.CONTRATOIMOVEL".CONINDICEREAJUSTE'
    end
    object qryContratosFolhaCONVLRAJUSTADO: TFloatField
      FieldName = 'CONVLRAJUSTADO'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRAJUSTADO'
    end
    object qryContratosFolhaCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAFIM'
    end
    object qryContratosFolhaCONPERALUGUEL: TFloatField
      FieldName = 'CONPERALUGUEL'
      Origin = '"CM.CONTRATOIMOVEL".CONPERALUGUEL'
    end
    object qryContratosFolhaCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
      Origin = '"CM.CONTRATOIMOVEL".CONNUMERO'
    end
    object qryContratosFolhaCONNOME: TStringField
      FieldName = 'CONNOME'
      Origin = '"CM.CONTRATOIMOVEL".CONNOME'
      Size = 60
    end
    object qryContratosFolhaFLGINDETERMINADO: TStringField
      FieldName = 'FLGINDETERMINADO'
      Origin = 'CONTRATOIMOVEL.FLGINDETERMINADO'
      Size = 1
    end
    object qryContratosFolhaIDMSGBOLETO: TFloatField
      FieldName = 'IDMSGBOLETO'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.IDMSGBOLETO'
    end
    object qryContratosFolhaCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONDIASTOLERANCIA'
    end
    object qryContratosFolhaFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.FLGTIPODIATOLERA'
      FixedChar = True
      Size = 1
    end
    object qryContratosFolhaCONVLRMULTA: TFloatField
      FieldName = 'CONVLRMULTA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONVLRMULTA'
    end
    object qryContratosFolhaCONMOEDAMULTA: TFloatField
      FieldName = 'CONMOEDAMULTA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONMOEDAMULTA'
    end
    object qryContratosFolhaCONPERCENTMULTA: TFloatField
      FieldName = 'CONPERCENTMULTA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONPERCENTMULTA'
    end
    object qryContratosFolhaCONVLRMORA: TFloatField
      FieldName = 'CONVLRMORA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONVLRMORA'
    end
    object qryContratosFolhaCONMOEDAMORA: TFloatField
      FieldName = 'CONMOEDAMORA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONMOEDAMORA'
    end
    object qryContratosFolhaCONPERCENTMORA: TFloatField
      FieldName = 'CONPERCENTMORA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONPERCENTMORA'
    end
    object qryContratosFolhaCONPERMORA: TStringField
      FieldName = 'CONPERMORA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONPERMORA'
      FixedChar = True
      Size = 1
    end
    object qryContratosFolhaFLGMORAPROPORC: TFloatField
      FieldName = 'FLGMORAPROPORC'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.FLGMORAPROPORC'
    end
    object qryContratosFolhaCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CODPORTFORMA'
    end
    object qryContratosFolhaCONDIASREPASSE: TFloatField
      FieldName = 'CONDIASREPASSE'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONDIASREPASSE'
    end
    object qryContratosFolhaCONDATAINICAREN: TDateTimeField
      FieldName = 'CONDATAINICAREN'
    end
  end
  object qryVerificaConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLACONTA, PLANOME, PLASUBCONTA, PLACCUST'
      'FROM'
      '  PLANOCONTA'
      'WHERE'
      '  ( PLANO =:PLANO ) AND'
      '  ( RTRIM(PLACONTA) =:CONTA ) AND'
      '  ( PLATIPO = '#39'A'#39')'
      ''
      ' ')
    ValidateWithMask = True
    Left = 688
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTA'
        ParamType = ptUnknown
      end>
    object qryVerificaContaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryVerificaContaPLANOME: TStringField
      FieldName = 'PLANOME'
      Size = 40
    end
    object qryVerificaContaPLASUBCONTA: TStringField
      FieldName = 'PLASUBCONTA'
      Size = 1
    end
    object qryVerificaContaPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Size = 1
    end
  end
  object qryConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  PLANO, PLANOME, PLACONTA, PLATIPO, PLACCUST, PLASUBCONTA'
      'FROM'
      '  PLANOCONTA'
      'WHERE'
      '  ( PLANO =:PLANO )')
    ValidateWithMask = True
    Left = 688
    Top = 124
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryContaPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PLANOCONTA.PLANO'
    end
    object qryContaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PLANOCONTA.PLACONTA'
      Size = 18
    end
    object qryContaPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'PLANOCONTA.PLANOME'
      Size = 40
    end
    object qryContaPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'PLANOCONTA.PLATIPO'
      Size = 1
    end
    object qryContaPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Origin = '"CM.PLANOCONTA".PLACCUST'
      Size = 1
    end
    object qryContaPLASUBCONTA: TStringField
      FieldName = 'PLASUBCONTA'
      Origin = '"CM.PLANOCONTA".PLASUBCONTA'
      Size = 1
    end
  end
  object qryRecDesXTipoImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CX.CODTIPIMOVEL, CX.IDTIPOCUSTORECIMO,'
      ''
      '   CX.IDPESSOA,'
      '   CX.UNIDNEGOC, CX.PLANO, CX.IDEMPRESA,'
      '   CX.CODCENTRORESPON, CX.FLGRESPPAGAMENTO, CX.TIPCODIGO,'
      '   CX.CODTIPDESEMB,'
      '   CX.CODTIPRECEB, CX.CONTARESULT, CX.CONTADEBCRE,'
      '   CX.SUBCONTARESULT, CX.SUBCONTADEBCRE,'
      '   CX.CENTROCUSTORESULT, CX.CENTROCUSTODEBCRE,'
      '   CX.FLGINTEGRACONTAB, CX.FLGINTEGRACAPCAR,'
      '   CX.RECPAG'
      ''
      'FROM'
      '   RECDESXTIPOIMOVEL CX'
      ''
      'WHERE'
      
        '   ( (:PCODTIPIMOVEL IS NULL) OR (CX.CODTIPIMOVEL =:PCODTIPIMOVE' +
        'L) )'
      
        '   AND ( (:PIDTIPOCUSTORECIMO IS NULL) OR (CX.IDTIPOCUSTORECIMO ' +
        '=:PIDTIPOCUSTORECIMO) )'
      '   AND ( (:PRECPAG IS NULL) OR (CX.RECPAG =:PRECPAG) )')
    ValidateWithMask = True
    Left = 560
    ParamData = <
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
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
        Name = 'PIDTIPOCUSTORECIMO'
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
      end>
    object qryRecDesXTipoImovelCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'RECDESXTIPOIMOVEL.CODTIPIMOVEL'
      Size = 5
    end
    object qryRecDesXTipoImovelIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'RECDESXTIPOIMOVEL.IDTIPOCUSTORECIMO'
    end
    object qryRecDesXTipoImovelIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'RECDESXTIPOIMOVEL.IDPESSOA'
    end
    object qryRecDesXTipoImovelUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'RECDESXTIPOIMOVEL.UNIDNEGOC'
    end
    object qryRecDesXTipoImovelPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'RECDESXTIPOIMOVEL.PLANO'
    end
    object qryRecDesXTipoImovelIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'RECDESXTIPOIMOVEL.IDEMPRESA'
    end
    object qryRecDesXTipoImovelCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'RECDESXTIPOIMOVEL.CODCENTRORESPON'
      Size = 10
    end
    object qryRecDesXTipoImovelFLGRESPPAGAMENTO: TStringField
      FieldName = 'FLGRESPPAGAMENTO'
      Origin = 'RECDESXTIPOIMOVEL.FLGRESPPAGAMENTO'
      Size = 1
    end
    object qryRecDesXTipoImovelTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Origin = 'RECDESXTIPOIMOVEL.TIPCODIGO'
      Size = 2
    end
    object qryRecDesXTipoImovelCODTIPDESEMB: TStringField
      FieldName = 'CODTIPDESEMB'
      Origin = 'RECDESXTIPOIMOVEL.CODTIPDESEMB'
      Size = 15
    end
    object qryRecDesXTipoImovelCODTIPRECEB: TStringField
      FieldName = 'CODTIPRECEB'
      Origin = 'RECDESXTIPOIMOVEL.CODTIPRECEB'
      Size = 15
    end
    object qryRecDesXTipoImovelCONTARESULT: TStringField
      FieldName = 'CONTARESULT'
      Origin = 'RECDESXTIPOIMOVEL.CONTARESULT'
      Size = 18
    end
    object qryRecDesXTipoImovelCONTADEBCRE: TStringField
      FieldName = 'CONTADEBCRE'
      Origin = 'RECDESXTIPOIMOVEL.CONTADEBCRE'
      Size = 18
    end
    object qryRecDesXTipoImovelSUBCONTARESULT: TFloatField
      FieldName = 'SUBCONTARESULT'
      Origin = 'RECDESXTIPOIMOVEL.SUBCONTARESULT'
    end
    object qryRecDesXTipoImovelSUBCONTADEBCRE: TFloatField
      FieldName = 'SUBCONTADEBCRE'
      Origin = 'RECDESXTIPOIMOVEL.SUBCONTADEBCRE'
    end
    object qryRecDesXTipoImovelCENTROCUSTORESULT: TStringField
      FieldName = 'CENTROCUSTORESULT'
      Origin = 'RECDESXTIPOIMOVEL.CENTROCUSTORESULT'
      Size = 10
    end
    object qryRecDesXTipoImovelCENTROCUSTODEBCRE: TStringField
      FieldName = 'CENTROCUSTODEBCRE'
      Origin = 'RECDESXTIPOIMOVEL.CENTROCUSTODEBCRE'
      Size = 10
    end
    object qryRecDesXTipoImovelRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'RECDESXTIPOIMOVEL.RECPAG'
      Size = 1
    end
    object qryRecDesXTipoImovelFLGINTEGRACONTAB: TFloatField
      FieldName = 'FLGINTEGRACONTAB'
      Origin = 'RECDESXTIPOIMOVEL.FLGINTEGRACONTAB'
    end
    object qryRecDesXTipoImovelFLGINTEGRACAPCAR: TFloatField
      FieldName = 'FLGINTEGRACAPCAR'
      Origin = 'RECDESXTIPOIMOVEL.FLGINTEGRACAPCAR'
    end
  end
  object qryInsertConImo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO REAJUSTECONIMO'
      '   ( IDREAJUSTECONIMO, IDCONTRATOIMOVEL, IDIMOVEL,'
      '   RCODATA, FLGTIPOREAJUSTE, RCOVLRALUGUEL,'
      '   RCOVLRCONTRATO, RCOMOTIVO, RCODATAPROXIMO,'
      '   RCOPERCENT )'
      'VALUES'
      '   ( :PIDREAJUSTECONIMO, :PIDCONTRATOIMOVEL, :PIDIMOVEL,'
      '   :PRCODATA, :PFLGTIPOREAJUSTE, :PRCOVLRALUGUEL,'
      '   :PRCOVLRCONTRATO, :PRCOMOTIVO, :PRCODATAPROXIMO,'
      '   :PRCOPERCENT )')
    ValidateWithMask = True
    Left = 176
    Top = 377
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDREAJUSTECONIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRCODATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGTIPOREAJUSTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRCOVLRALUGUEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRCOVLRCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRCOMOTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRCODATAPROXIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRCOPERCENT'
        ParamType = ptUnknown
      end>
  end
  object qryCC_Imovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM('
      '   SCB.VALORG + SCB.CMBEM - SCB.DEPLANC - SCB.CMDEP +'
      '   SCB.REAVVALORG + SCB.REAVCMBEM - SCB.REAVDEPLANC -'
      '   SCB.REAVCMDEP + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM -'
      '   SCB.ULTREAVDEPLANC - SCB.ULTREAVCMDEP'
      '   ) AS SUMVALCTB,'
      ''
      '   SUM('
      '   SCB.VALORG + SCB.CMBEM + SCB.REAVVALORG +'
      '   SCB.REAVCMBEM + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM'
      '   ) AS SUMVALCTBIMOB'
      ''
      'FROM'
      '   SALDOCONTABBEM SCB, IMOVELXBEM IXB,'
      ''
      '   ('
      '   SELECT'
      '      IDBEM, MAX(DATASLDBEM) AS DATA'
      '   FROM'
      '      SALDOCONTABBEM'
      '   WHERE'
      '      ( (:PDATAMOV IS NULL) OR (DATASLDBEM <=:PDATAMOV) )'
      '   GROUP BY'
      '      IDBEM'
      '   ) DTAMAX'
      ''
      'WHERE'
      '   ( (:PIDIMOVEL IS NULL) OR (IXB.IDIMOVEL =:PIDIMOVEL) )'
      '   AND ( SCB.DATASLDBEM = DTAMAX.DATA )'
      '   AND ( SCB.IDBEM = DTAMAX.IDBEM )'
      '   AND ( SCB.IDBEM = IXB.IDBEM )')
    ValidateWithMask = True
    Left = 300
    Top = 374
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
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
    object qryCC_ImovelSUMVALCTB: TFloatField
      FieldName = 'SUMVALCTB'
    end
    object qryCC_ImovelSUMVALCTBIMOB: TFloatField
      FieldName = 'SUMVALCTBIMOB'
    end
  end
  object qryParamImob: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.IDPESSOA,'
      '   P.CODCENTRORESPON,'
      '   P.UNIDNEGOC,'
      '   P.CODPORTFORMA,'
      '   P.FLGINTEGRACONTAB,'
      '   P.FLGINTEGRACAPCAR,'
      '   P.FLGINTEGRAGESTAO,'
      '   P.FLGINTEGRAATIVO,'
      '   P.FLGUSASCIMOVEL,'
      '   P.FLGUSASCLOCATARIO,'
      '   P.FLGALIMENTAALTER,'
      '   P.FLGALIMENTADATA,'
      '   P.FLGALIMENTADEPREC,'
      '   P.FLGSUGERECONTRATO,'
      '   P.FLGCONCATENAANO,'
      '   P.PROXNUMCONTRATO,'
      '   P.FLGVENCDIAUTIL,'
      '   P.PRAZOAVISO,'
      '   P.FLGAUTORESCISAO,'
      '   P.FLGOBRIGATIVIDADE,'
      '   P.FLGINTEGRARECEB,'
      '   P.FLGINTEGRAPAG,'
      '   P.NOMEVLRAQUISICAO,'
      '   P.FLGINTEGRAFOLHA,'
      '   P.FLGGERATXADMIN,'
      '   P.QTDEMESPREVFOLHA,'
      '   P.FLGMESPOSTERIOR,'
      '   P.FLGREAVALMERCADO,'
      '   P.FLGOBRIGACONTRATO,'
      '   P.FLGCOMISSAOALT,'
      '   P.FLGLANCRESCINDIDO,'
      '   P.IDTCUSTORECIMOCOM,'
      '   P.FLGUSAAP, FLGDIAUTILAP,'
      '   P.FLGCONSIDERARESP, P.FLGREEMBOLSOAUT,'
      '   P.FLGALUGUELZERO,'
      '   P.FLGFILTRAREAJUSTE, P.FLGFILTRAENCERRA,'
      '   P.CODCENTROCUSTO, P.IDEMPRESA,'
      '   P.IDPROGRAMA,'
      '   P.FLGPARTPIM, P.FLGPARTPDES, P.FLGPARIM,'
      '   P.FLGPARCON, P.FLGPARTDTPIM, P.FLGPARTDIM,'
      '   P.FLGPARTDCON,'
      
        '   P.IDLOCALIZACAO, P.IDPESSOALOC, P.IDCLASSEBEM, P.FLGMULTITIPO' +
        ','
      '   P.IDSITUACAO, P.FLGHISTCONTDIFAP, P.CODTIPIMOVELOBRA,'
      ''
      '   P.MASCARACOMPL'
      ''
      'FROM'
      '   PARAMIMOVEL P'
      ''
      'WHERE'
      '   ( P.IDPESSOA =:PIDPESSOA )'
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 560
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamImobCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PARAMIMOVEL.CODCENTRORESPON'
      Size = 10
    end
    object qryParamImobUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PARAMIMOVEL.UNIDNEGOC'
    end
    object qryParamImobCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'PARAMIMOVEL.CODPORTFORMA'
    end
    object qryParamImobFLGINTEGRACONTAB: TFloatField
      FieldName = 'FLGINTEGRACONTAB'
      Origin = 'PARAMIMOVEL.FLGINTEGRACONTAB'
    end
    object qryParamImobFLGINTEGRACAPCAR: TFloatField
      FieldName = 'FLGINTEGRACAPCAR'
      Origin = 'PARAMIMOVEL.FLGINTEGRACAPCAR'
    end
    object qryParamImobFLGINTEGRAGESTAO: TFloatField
      FieldName = 'FLGINTEGRAGESTAO'
      Origin = 'PARAMIMOVEL.FLGINTEGRAGESTAO'
    end
    object qryParamImobFLGINTEGRAATIVO: TFloatField
      FieldName = 'FLGINTEGRAATIVO'
      Origin = 'PARAMIMOVEL.FLGINTEGRAATIVO'
    end
    object qryParamImobFLGUSASCIMOVEL: TFloatField
      FieldName = 'FLGUSASCIMOVEL'
      Origin = 'PARAMIMOVEL.FLGUSASCIMOVEL'
    end
    object qryParamImobFLGUSASCLOCATARIO: TFloatField
      FieldName = 'FLGUSASCLOCATARIO'
      Origin = 'PARAMIMOVEL.FLGUSASCLOCATARIO'
    end
    object qryParamImobFLGALIMENTAALTER: TFloatField
      FieldName = 'FLGALIMENTAALTER'
      Origin = 'PARAMIMOVEL.FLGALIMENTAALTER'
    end
    object qryParamImobFLGALIMENTADATA: TStringField
      FieldName = 'FLGALIMENTADATA'
      Origin = 'PARAMIMOVEL.FLGALIMENTADATA'
      Size = 1
    end
    object qryParamImobFLGALIMENTADEPREC: TFloatField
      FieldName = 'FLGALIMENTADEPREC'
      Origin = 'PARAMIMOVEL.FLGALIMENTADEPREC'
    end
    object qryParamImobFLGSUGERECONTRATO: TFloatField
      FieldName = 'FLGSUGERECONTRATO'
      Origin = 'PARAMIMOVEL.FLGSUGERECONTRATO'
    end
    object qryParamImobFLGCONCATENAANO: TFloatField
      FieldName = 'FLGCONCATENAANO'
      Origin = 'PARAMIMOVEL.FLGCONCATENAANO'
    end
    object qryParamImobPRAZOAVISO: TFloatField
      FieldName = 'PRAZOAVISO'
      Origin = 'PARAMIMOVEL.PRAZOAVISO'
    end
    object qryParamImobFLGAUTORESCISAO: TFloatField
      FieldName = 'FLGAUTORESCISAO'
      Origin = 'PARAMIMOVEL.FLGAUTORESCISAO'
    end
    object qryParamImobFLGOBRIGATIVIDADE: TFloatField
      FieldName = 'FLGOBRIGATIVIDADE'
      Origin = 'PARAMIMOVEL.FLGOBRIGATIVIDADE'
    end
    object qryParamImobFLGINTEGRARECEB: TFloatField
      FieldName = 'FLGINTEGRARECEB'
      Origin = 'PARAMIMOVEL.FLGINTEGRARECEB'
    end
    object qryParamImobFLGINTEGRAPAG: TFloatField
      FieldName = 'FLGINTEGRAPAG'
      Origin = 'PARAMIMOVEL.FLGINTEGRAPAG'
    end
    object qryParamImobNOMEVLRAQUISICAO: TStringField
      FieldName = 'NOMEVLRAQUISICAO'
      Origin = 'PARAMIMOVEL.NOMEVLRAQUISICAO'
      Size = 30
    end
    object qryParamImobFLGINTEGRAFOLHA: TFloatField
      FieldName = 'FLGINTEGRAFOLHA'
      Origin = 'PARAMIMOVEL.FLGINTEGRAFOLHA'
    end
    object qryParamImobFLGGERATXADMIN: TFloatField
      FieldName = 'FLGGERATXADMIN'
      Origin = 'PARAMIMOVEL.FLGGERATXADMIN'
    end
    object qryParamImobQTDEMESPREVFOLHA: TFloatField
      FieldName = 'QTDEMESPREVFOLHA'
      Origin = 'PARAMIMOVEL.QTDEMESPREVFOLHA'
    end
    object qryParamImobFLGMESPOSTERIOR: TFloatField
      FieldName = 'FLGMESPOSTERIOR'
      Origin = 'PARAMIMOVEL.FLGMESPOSTERIOR'
    end
    object qryParamImobIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PARAMIMOVEL.IDPESSOA'
    end
    object qryParamImobPROXNUMCONTRATO: TFloatField
      FieldName = 'PROXNUMCONTRATO'
    end
    object qryParamImobFLGVENCDIAUTIL: TFloatField
      FieldName = 'FLGVENCDIAUTIL'
    end
    object qryParamImobFLGREAVALMERCADO: TFloatField
      FieldName = 'FLGREAVALMERCADO'
      Origin = 'PARAMIMOVEL.FLGREAVALMERCADO'
    end
    object qryParamImobFLGOBRIGACONTRATO: TFloatField
      FieldName = 'FLGOBRIGACONTRATO'
      Origin = 'PARAMIMOVEL.FLGOBRIGACONTRATO'
    end
    object qryParamImobFLGCOMISSAOALT: TFloatField
      FieldName = 'FLGCOMISSAOALT'
      Origin = 'PARAMIMOVEL.FLGCOMISSAOALT'
    end
    object qryParamImobFLGLANCRESCINDIDO: TFloatField
      FieldName = 'FLGLANCRESCINDIDO'
      Origin = 'PARAMIMOVEL.FLGLANCRESCINDIDO'
    end
    object qryParamImobIDTCUSTORECIMOCOM: TFloatField
      FieldName = 'IDTCUSTORECIMOCOM'
      Origin = 'PARAMIMOVEL.IDTCUSTORECIMOCOM'
    end
    object qryParamImobFLGUSAAP: TFloatField
      FieldName = 'FLGUSAAP'
      Origin = 'PARAMIMOVEL.FLGUSAAP'
    end
    object qryParamImobCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryParamImobIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryParamImobIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
    end
    object qryParamImobFLGREEMBOLSOAUT: TFloatField
      FieldName = 'FLGREEMBOLSOAUT'
      Origin = 'PARAMIMOVEL.FLGREEMBOLSOAUT'
    end
    object qryParamImobFLGCONSIDERARESP: TFloatField
      FieldName = 'FLGCONSIDERARESP'
    end
    object qryParamImobFLGALUGUELZERO: TFloatField
      FieldName = 'FLGALUGUELZERO'
    end
    object qryParamImobFLGDIAUTILAP: TStringField
      FieldName = 'FLGDIAUTILAP'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGDIAUTILAP'
      FixedChar = True
      Size = 1
    end
    object qryParamImobFLGFILTRAREAJUSTE: TFloatField
      FieldName = 'FLGFILTRAREAJUSTE'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGFILTRAREAJUSTE'
    end
    object qryParamImobFLGFILTRAENCERRA: TFloatField
      FieldName = 'FLGFILTRAENCERRA'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGFILTRAENCERRA'
    end
    object qryParamImobFLGPARTPIM: TFloatField
      FieldName = 'FLGPARTPIM'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTPIM'
    end
    object qryParamImobFLGPARTPDES: TFloatField
      FieldName = 'FLGPARTPDES'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTPDES'
    end
    object qryParamImobFLGPARIM: TFloatField
      FieldName = 'FLGPARIM'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARIM'
    end
    object qryParamImobFLGPARCON: TFloatField
      FieldName = 'FLGPARCON'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARCON'
    end
    object qryParamImobFLGPARTDTPIM: TFloatField
      FieldName = 'FLGPARTDTPIM'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTDTPIM'
    end
    object qryParamImobFLGPARTDIM: TFloatField
      FieldName = 'FLGPARTDIM'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTDIM'
    end
    object qryParamImobFLGPARTDCON: TFloatField
      FieldName = 'FLGPARTDCON'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTDCON'
    end
    object qryParamImobIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qryParamImobIDPESSOALOC: TFloatField
      FieldName = 'IDPESSOALOC'
    end
    object qryParamImobIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
    end
    object qryParamImobFLGMULTITIPO: TFloatField
      FieldName = 'FLGMULTITIPO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGMULTITIPO'
    end
    object qryParamImobIDSITUACAO: TFloatField
      FieldName = 'IDSITUACAO'
    end
    object qryParamImobFLGHISTCONTDIFAP: TFloatField
      FieldName = 'FLGHISTCONTDIFAP'
    end
    object qryParamImobCODTIPIMOVELOBRA: TStringField
      FieldName = 'CODTIPIMOVELOBRA'
      Size = 5
    end
    object qryParamImobMASCARACOMPL: TStringField
      FieldName = 'MASCARACOMPL'
      Origin = 'BASEDADOS."CM.PARAMIMOVEL".MASCARACOMPL'
      FixedChar = True
      Size = 15
    end
  end
  object qryExcluiLancamentos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      ''
      'FROM'
      '   LANCAMENTOSIMOVEL'
      ''
      'WHERE'
      '   ( IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL )'
      '   AND ( DATAVENCIMENTO > :PDATAVENCIMENTO )'
      '   AND ( FLGINTEGRADO = 0 )'
      ' ')
    ValidateWithMask = True
    Left = 304
    Top = 242
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryMarcaAgrupado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   LANCAMENTOSIMOVEL L'
      'SET'
      '   L.FLGAGRUPADO = 1'
      'WHERE'
      '   IDLANCIMOVEL =:PIDLANCIMOVEL')
    ValidateWithMask = True
    Left = 560
    Top = 99
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLANCIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qrySaidaSistema: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(IDLANCIMOVEL) AS CONTAGEM'
      ''
      'FROM'
      '   LANCAMENTOSIMOVEL'
      ''
      'WHERE'
      '   ( IDPESSOA =:PIDPESSOA )'
      '   AND ('
      '   ((:PINTEGRADONULL IS NOT NULL) AND (FLGINTEGRADO IS NULL)) OR'
      '   ((:PFLGINTEGRADO IS NULL) OR (FLGINTEGRADO =:PFLGINTEGRADO)))'
      '   AND ( ( :PIDMODULO IS NULL ) OR ( IDMODULO = :PIDMODULO ) )'
      ' ')
    ValidateWithMask = True
    Left = 180
    Top = 237
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
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
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end>
    object qrySaidaSistemaCONTAGEM: TFloatField
      FieldName = 'CONTAGEM'
      Origin = 'BASEDADOS.LANCAMENTOSIMOVEL.IDLANCIMOVEL'
    end
  end
  object qrySaldoImovelInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HC.SALDOVLRINVCART, HC.SALDOQTDEINVCART,'
      '   HC.DATAMOVCARTINV, HC.IDHISTCARTINV'
      ''
      'FROM'
      '   HISTCARTINV HC,'
      ''
      '   ('
      '   SELECT'
      
        '      IDINVESTIMENTO, MAX(DATAMOVCARTINV) AS DATA, MAX(IDHISTCAR' +
        'TINV) AS HISTORICO'
      '   FROM'
      '      HISTCARTINV'
      '   WHERE'
      '      ( IDINVESTIMENTO =:PIDINVESTIMENTO )'
      '   GROUP BY'
      '      IDINVESTIMENTO'
      '   ) HCM'
      ''
      'WHERE'
      '   ( HC.IDINVESTIMENTO =:PIDINVESTIMENTO )'
      '   AND ( HC.DATAMOVCARTINV <=:PDATAMOVCARTINV )'
      '   AND ( HC.IDEMPRESAPROP =:PIDEMPRESAPROP )'
      '   AND ( HC.IDINVESTIMENTO = HCM.IDINVESTIMENTO )'
      '   AND ( HC.DATAMOVCARTINV = HCM.DATA )'
      '   AND ( HC.IDHISTCARTINV = HCM.HISTORICO )')
    ValidateWithMask = True
    Left = 48
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOVCARTINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qrySaldoImovelInvestSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
    end
    object qrySaldoImovelInvestSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qrySaldoImovelInvestDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qrySaldoImovelInvestIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
  end
  object qryCC_Mestre: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM('
      '   SCB.VALORG + SCB.CMBEM - SCB.DEPLANC - SCB.CMDEP +'
      '   SCB.REAVVALORG + SCB.REAVCMBEM - SCB.REAVDEPLANC -'
      '   SCB.REAVCMDEP + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM -'
      '   SCB.ULTREAVDEPLANC - SCB.ULTREAVCMDEP'
      '   ) AS SUMVALCTB,'
      ''
      '   SUM('
      '   SCB.VALORG + SCB.CMBEM + SCB.REAVVALORG +'
      '   SCB.REAVCMBEM + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM'
      '   ) AS SUMVALCTBIMOB'
      ''
      'FROM'
      '   SALDOCONTABBEM SCB, IMOVELXBEM IXB, IMOVEL I'
      ''
      '   ('
      '   SELECT'
      '      IDBEM, MAX(DATASLDBEM) AS DATA'
      '   FROM'
      '      SALDOCONTABBEM'
      '   WHERE'
      '      ( (:PDATAMOV IS NULL) OR (DATASLDBEM <=:PDATAMOV) )'
      '   GROUP BY'
      '      IDBEM'
      '   ) DTAMAX'
      ''
      'WHERE'
      
        '   ( (:PIDIMOVELMESTRE IS NULL) OR (I.IDIMOVELMESTRE =:PIDIMOVEL' +
        'MESTRE) )'
      '   AND ( SCB.DATASLDBEM = DTAMAX.DATA )'
      '   AND ( SCB.IDBEM = DTAMAX.IDBEM )'
      '   AND ( SCB.IDBEM = IXB.IDBEM )'
      '   AND ( IXB.IDIMOVEL = I.IDIMOVEL )')
    ValidateWithMask = True
    Left = 300
    Top = 362
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDATAMOV'
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
      end>
    object qryCC_MestreSUMVALCTB: TFloatField
      FieldName = 'SUMVALCTB'
    end
    object qryCC_MestreSUMVALCTBIMOB: TFloatField
      FieldName = 'SUMVALCTBIMOB'
    end
  end
  object qryPadrLancImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLI.IDPADRLANCIMOVEL,'
      '   PLI.IDMODULO,'
      '   PLI.RECPAG,'
      '   PLI.DESCPADRLANCIMO,'
      '   PLI.FLGINTEGRACAPCAR,'
      '   PLI.FLGINTEGRACONTAB,'
      '   PLI.IDPESSOA,'
      ''
      '   PLI.CODTIPIMOVEL,'
      '   PLI.IDTIPOCUSTORECIMO,'
      '   PLI.IDIMOVEL,'
      '   PLI.IDCONTRATOIMOVEL,'
      ''
      '   PLI.CODCENTRORESPON,'
      '   PLI.CODTIPRECDES,'
      ''
      '   PLI.PLANO,'
      '   PLI.IDEMPRESA,'
      '   PLI.CONTARESULT,'
      '   PLI.CENTROCUSTORESULT,'
      '   PLI.CONTADEBCRE,'
      '   PLI.CENTROCUSTODEBCRE,'
      ''
      '   PLI.UNIDNEGOC,'
      '   PLI.TIPCODIGO,'
      ''
      '   TRD.ATIVO AS RECDES_ATIVO,'
      '   CCD.ATIVO AS CCUSTD_ATIVO,'
      '   CCR.ATIVO AS CCUSTR_ATIVO'
      ''
      'FROM'
      '   PADRLANCIMOVEL PLI,'
      '   TIPORECEBDESEMB TRD,'
      '   CENTCUST CCD,'
      '   CENTCUST CCR'
      ''
      'WHERE'
      '       ( PLI.CODTIPRECDES = TRD.CODTIPRECDES(+) )'
      '   AND ( PLI.CENTROCUSTODEBCRE = CCD.CODCENTROCUSTO(+) )'
      '   AND ( PLI.CENTROCUSTORESULT = CCR.CODCENTROCUSTO(+) )'
      '   AND ( PLI.IDPESSOA = TRD.IDPESSOA(+) )'
      '   AND ( PLI.RECPAG = TRD.RECPAG(+) )'
      '   AND ( PLI.IDPESSOA =:PIDPESSOA )'
      '   AND ( PLI.IDMODULO =:PIDMODULO )'
      '   AND ( PLI.RECPAG =:PRECPAG )'
      '   AND ( PLI.FLGDIARIO = :PFLGDIARIO )'
      ''
      '   AND ('
      
        '   ((:PTIPIMOVELNULL IS NOT NULL) AND (PLI.CODTIPIMOVEL IS NULL)' +
        ') OR    -- SE QUISER TIPO IMOVEL NULO PASSOR LIXO PARA ESTE PARA' +
        'METRO E -1 PARA O DE BAIXO'
      
        '   ((:PCODTIPIMOVEL IS NULL) OR (PLI.CODTIPIMOVEL =:PCODTIPIMOVE' +
        'L)))    -- SE QUISER SELECIONAR UM TIPO DE IMOVEL PASSAR VALOR P' +
        'ARA ESTE PARAMETRO E NULO PARA O ANTERIOR'
      ''
      '   AND ('
      
        '   ((:PCUSTORECIMONULL IS NOT NULL) AND (PLI.IDTIPOCUSTORECIMO I' +
        'S NULL)) OR'
      
        '   ((:PIDTIPOCUSTORECIMO IS NULL) OR (PLI.IDTIPOCUSTORECIMO =:PI' +
        'DTIPOCUSTORECIMO)))'
      ''
      '   AND ('
      '   ((:PIMOVELNULL IS NOT NULL) AND (PLI.IDIMOVEL IS NULL)) OR'
      '   ((:PIDIMOVEL IS NULL) OR (PLI.IDIMOVEL =:PIDIMOVEL)))'
      ''
      '   AND ('
      
        '   ((:PCONTRATONULL IS NOT NULL) AND (PLI.IDCONTRATOIMOVEL IS NU' +
        'LL)) OR'
      
        '   ((:PIDCONTRATOIMOVEL IS NULL) OR (PLI.IDCONTRATOIMOVEL =:PIDC' +
        'ONTRATOIMOVEL)))'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGDIARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PTIPIMOVELNULL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCUSTORECIMONULL'
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
        DataType = ftString
        Name = 'PIMOVELNULL'
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
        DataType = ftString
        Name = 'PCONTRATONULL'
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
      end>
    object qryPadrLancImovelIDPADRLANCIMOVEL: TFloatField
      FieldName = 'IDPADRLANCIMOVEL'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDPADRLANCIMOVEL'
    end
    object qryPadrLancImovelIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDMODULO'
    end
    object qryPadrLancImovelRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryPadrLancImovelDESCPADRLANCIMO: TStringField
      FieldName = 'DESCPADRLANCIMO'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.DESCPADRLANCIMO'
      Size = 120
    end
    object qryPadrLancImovelFLGINTEGRACAPCAR: TFloatField
      FieldName = 'FLGINTEGRACAPCAR'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.FLGINTEGRACAPCAR'
    end
    object qryPadrLancImovelFLGINTEGRACONTAB: TFloatField
      FieldName = 'FLGINTEGRACONTAB'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.FLGINTEGRACONTAB'
    end
    object qryPadrLancImovelIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDPESSOA'
    end
    object qryPadrLancImovelCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.CODTIPIMOVEL'
      Size = 5
    end
    object qryPadrLancImovelIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDTIPOCUSTORECIMO'
    end
    object qryPadrLancImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDIMOVEL'
    end
    object qryPadrLancImovelIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDCONTRATOIMOVEL'
    end
    object qryPadrLancImovelCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object qryPadrLancImovelCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object qryPadrLancImovelPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.PLANO'
    end
    object qryPadrLancImovelIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDEMPRESA'
    end
    object qryPadrLancImovelCONTARESULT: TStringField
      FieldName = 'CONTARESULT'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.CONTARESULT'
      FixedChar = True
      Size = 18
    end
    object qryPadrLancImovelCENTROCUSTORESULT: TStringField
      FieldName = 'CENTROCUSTORESULT'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.CENTROCUSTORESULT'
      FixedChar = True
      Size = 10
    end
    object qryPadrLancImovelCONTADEBCRE: TStringField
      FieldName = 'CONTADEBCRE'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.CONTADEBCRE'
      FixedChar = True
      Size = 18
    end
    object qryPadrLancImovelCENTROCUSTODEBCRE: TStringField
      FieldName = 'CENTROCUSTODEBCRE'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.CENTROCUSTODEBCRE'
      FixedChar = True
      Size = 10
    end
    object qryPadrLancImovelUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.UNIDNEGOC'
    end
    object qryPadrLancImovelTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.TIPCODIGO'
      FixedChar = True
      Size = 2
    end
    object qryPadrLancImovelRECDES_ATIVO: TStringField
      FieldName = 'RECDES_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qryPadrLancImovelCCUSTD_ATIVO: TStringField
      FieldName = 'CCUSTD_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qryPadrLancImovelCCUSTR_ATIVO: TStringField
      FieldName = 'CCUSTR_ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object qryIntegraContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MASCARA'
      'FROM'
      '   PLANO'
      'WHERE'
      '   ( PLANO =:PLANO )')
    ValidateWithMask = True
    Left = 304
    Top = 300
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryIntegraContabMASCARA: TStringField
      FieldName = 'MASCARA'
      Origin = 'PLANO.MASCARA'
      Size = 25
    end
  end
  object qryContratosVlrAno: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CV.IDCONTRATOXVLRANO,'
      '       CV.IDCONTRATOIMOVEL,'
      '       CV.IDIMOVEL,'
      '       CV.ANOINICIO,'
      '       CV.VALOR,'
      '       CV.FLGCORRIGE,'
      '       CI.CIMVLRAJUSTADO'
      '  FROM CONTRATOXVLRANO CV, CONTRATOXIMOVEL CI'
      ' WHERE CI.IDCONTRATOIMOVEL = CV.IDCONTRATOIMOVEL'
      '   AND CI.IDIMOVEL = CV.IDIMOVEL        '
      '   AND CV.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL'
      '   AND CV.ANOINICIO = :PANOINICIO'
      '   AND ( (:PIDIMOVEL IS NULL) OR (CV.IDIMOVEL = :PIDIMOVEL) )'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 180
    Top = 164
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOINICIO'
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
    object qryContratosVlrAnoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.CONTRATOXVLRANO.IDCONTRATOIMOVEL'
    end
    object qryContratosVlrAnoIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.CONTRATOXVLRANO.IDIMOVEL'
    end
    object qryContratosVlrAnoANOINICIO: TFloatField
      FieldName = 'ANOINICIO'
      Origin = 'BASEDADOS.CONTRATOXVLRANO.ANOINICIO'
    end
    object qryContratosVlrAnoVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BASEDADOS.CONTRATOXVLRANO.VALOR'
    end
    object qryContratosVlrAnoFLGCORRIGE: TStringField
      FieldName = 'FLGCORRIGE'
      Origin = 'BASEDADOS.CONTRATOXVLRANO.FLGCORRIGE'
      FixedChar = True
      Size = 1
    end
    object qryContratosVlrAnoCIMVLRAJUSTADO: TFloatField
      FieldName = 'CIMVLRAJUSTADO'
      Origin = 'BASEDADOS.CONTRATOXIMOVEL.CIMVLRAJUSTADO'
    end
    object qryContratosVlrAnoIDCONTRATOXVLRANO: TFloatField
      FieldName = 'IDCONTRATOXVLRANO'
      Origin = 'BASEDADOS.CONTRATOXVLRANO.IDCONTRATOXVLRANO'
    end
  end
end
