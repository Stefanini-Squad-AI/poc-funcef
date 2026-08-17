object dtmOperComum: TdtmOperComum
  OldCreateOrder = True
  Left = 113
  Top = 93
  Height = 597
  Width = 911
  object qrySaldoCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDHISTCARTINV, DATAMOVCARTINV, IDCARTEIRAINVEST, IDCARTEIRAGE' +
        'RENC,'
      ''
      '   SALDOCOTASCARTINV,'
      '   SALDOVLRCARTINV,'
      '   SALDOQTDEINVCART,'
      '   SALDOVLRINVCART'
      ''
      'FROM'
      '   HISTCARTINV'
      ''
      'WHERE'
      '   (IDCARTEIRAINVEST =:CARTEIRA)'
      '   AND'
      '   (IDCARTEIRAGERENC = :CARTEIRAGERENC)'
      '   AND'
      '   ('
      '   ( (DATAMOVCARTINV <:DATAMOV) )'
      '   OR'
      
        '   ( (DATAMOVCARTINV =:DATAMOV) AND (IDHISTCARTINV <:HISTORICO) ' +
        ')'
      '   )'
      ''
      'ORDER BY'
      '   DATAMOVCARTINV DESC, IDHISTCARTINV DESC'
      ' ')
    ValidateWithMask = True
    Left = 327
    Top = 350
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
    object qrySaldoCarteiraIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = 'HISTCARTINV.IDHISTCARTINV'
    end
    object qrySaldoCarteiraDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Origin = 'HISTCARTINV.DATAMOVCARTINV'
    end
    object qrySaldoCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCARTINV.IDCARTEIRAINVEST'
    end
    object qrySaldoCarteiraSALDOCOTASCARTINV: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
      Origin = 'HISTCARTINV.SALDOCOTASCARTINV'
    end
    object qrySaldoCarteiraSALDOVLRCARTINV: TFloatField
      FieldName = 'SALDOVLRCARTINV'
      Origin = 'HISTCARTINV.SALDOVLRCARTINV'
    end
    object qrySaldoCarteiraSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
      Origin = 'HISTCARTINV.SALDOQTDEINVCART'
    end
    object qrySaldoCarteiraSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
      Origin = 'HISTCARTINV.SALDOVLRINVCART'
    end
    object qrySaldoCarteiraIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'HISTCARTINV.IDCARTEIRAGERENC'
    end
  end
  object qryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FLGGERACONTAB, FLGGERACAPCAR, CODTIPDOC,'
      '   RECPAG, NATUREZAOPERACAO, FLGCONTAINVEST,'
      '   DESCTIPOOPERACAO, IDTIPOOPERCPVD'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   ( IDTIPOINVEST   =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 509
    Top = 135
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end>
    object qryTipoOperacaoFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'TIPOOPERACAO.FLGGERACONTAB'
    end
    object qryTipoOperacaoFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'TIPOOPERACAO.FLGGERACAPCAR'
    end
    object qryTipoOperacaoCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'TIPOOPERACAO.CODTIPDOC'
    end
    object qryTipoOperacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPOOPERACAO.RECPAG'
      Size = 1
    end
    object qryTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Size = 1
    end
    object qryTipoOperacaoFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCONTAINVEST'
    end
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoIDTIPOOPERCPVD: TFloatField
      FieldName = 'IDTIPOOPERCPVD'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERCPVD'
    end
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM DUAL')
    ValidateWithMask = True
    Left = 51
    Top = 65534
  end
  object qryDespXTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FLGGERACONTAB, FLGGERACAPCAR, CODTIPDOC,'
      '   RECPAG'
      'FROM'
      '   DESPESASXTIPOOPER'
      'WHERE'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( IDTIPODESPINVEST =:TIPODESPESA ) ')
    ValidateWithMask = True
    Left = 425
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPODESPESA'
        ParamType = ptUnknown
      end>
    object qryDespXTipoOperFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'DESPESASXTIPOOPER.FLGGERACONTAB'
    end
    object qryDespXTipoOperFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'DESPESASXTIPOOPER.FLGGERACAPCAR'
    end
    object qryDespXTipoOperCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'DESPESASXTIPOOPER.CODTIPDOC'
    end
    object qryDespXTipoOperRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'DESPESASXTIPOOPER.RECPAG'
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
    Left = 594
    Top = 310
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
  object qryFlgAtualSaldo13: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTCARTINV, DATAMOVCARTINV, NATURMOVCARTINV,'
      
        '   IDCARTEIRAINVEST, IDCARTEIRAGERENC, IDINVESTIMENTO, IDLOTE,  ' +
        'FLGCALCSALDO,'
      '   IDTIPOINVEST'
      ''
      'FROM'
      '   HISTCARTINV'
      ''
      'WHERE'
      '   ( FLGCALCSALDO = '#39'1'#39' )'
      '   OR ( FLGCALCSALDO = '#39'3'#39' )'
      '   OR ( FLGCALCSALDO = '#39'4'#39' )'
      ''
      'ORDER BY'
      '   DATAMOVCARTINV, IDHISTCARTINV'
      '')
    ValidateWithMask = True
    Left = 135
    Top = 143
    object qryFlgAtualSaldo13IDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = 'HISTCARTINV.IDHISTCARTINV'
    end
    object qryFlgAtualSaldo13DATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Origin = 'HISTCARTINV.DATAMOVCARTINV'
    end
    object qryFlgAtualSaldo13IDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCARTINV.IDCARTEIRAINVEST'
    end
    object qryFlgAtualSaldo13IDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCARTINV.IDINVESTIMENTO'
    end
    object qryFlgAtualSaldo13FLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = 'HISTCARTINV.FLGCALCSALDO'
      Size = 1
    end
    object qryFlgAtualSaldo13NATURMOVCARTINV: TStringField
      FieldName = 'NATURMOVCARTINV'
      Origin = 'HISTCARTINV.NATURMOVCARTINV'
      Size = 1
    end
    object qryFlgAtualSaldo13IDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCARTINV.IDLOTE'
      Size = 10
    end
    object qryFlgAtualSaldo13IDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'HISTCARTINV.IDTIPOINVEST'
    end
    object qryFlgAtualSaldo13IDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'HISTCARTINV.IDCARTEIRAGERENC'
    end
  end
  object qryFlgAtualSaldo2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTCARTINV, DATAMOVCARTINV, IDLOTE,'
      
        '   IDCARTEIRAINVEST, IDCARTEIRAGERENC, IDINVESTIMENTO, FLGCALCSA' +
        'LDO'
      ''
      'FROM'
      '   HISTCARTINV'
      ''
      'WHERE'
      '   ( FLGCALCSALDO = '#39'2'#39' )'
      '   OR ( FLGCALCSALDO = '#39'4'#39' )'
      ''
      'ORDER BY'
      '   DATAMOVCARTINV, IDHISTCARTINV'
      ''
      ' ')
    ValidateWithMask = True
    Left = 135
    Top = 132
    object qryFlgAtualSaldo2IDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = 'HISTCARTINV.IDHISTCARTINV'
    end
    object qryFlgAtualSaldo2DATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Origin = 'HISTCARTINV.DATAMOVCARTINV'
    end
    object qryFlgAtualSaldo2IDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCARTINV.IDLOTE'
      Size = 10
    end
    object qryFlgAtualSaldo2IDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCARTINV.IDCARTEIRAINVEST'
    end
    object qryFlgAtualSaldo2IDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCARTINV.IDINVESTIMENTO'
    end
    object qryFlgAtualSaldo2FLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = 'HISTCARTINV.FLGCALCSALDO'
      Size = 1
    end
    object qryFlgAtualSaldo2IDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'HISTCARTINV.IDCARTEIRAGERENC'
    end
  end
  object qryBuscaCli: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODSUBCONTA'
      'FROM'
      '   EMPRESACLIENTE'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAFORN ) AND'
      '   ( IDFORCLI =:FORCLI ) AND'
      '   ( PLANO =:PLANO )')
    ValidateWithMask = True
    Left = 51
    Top = 350
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAFORN'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryBuscaCliCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'EMPRESACLIENTE.CODSUBCONTA'
    end
  end
  object qryBuscaForn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODSUBCONTA'
      'FROM'
      '   EMPRESAFORN'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAFORN ) AND'
      '   ( IDFORCLI =:FORCLI ) AND'
      '   ( PLANO =:PLANO )')
    ValidateWithMask = True
    Left = 51
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAFORN'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end>
    object qryBuscaFornCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'EMPRESAFORN.CODSUBCONTA'
    end
  end
  object qryVerificaConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLASUBCONTA, PLACCUST'
      'FROM'
      '  PLANOCONTA'
      'WHERE'
      '  ( PLANO =:PLANO ) AND'
      '  ( PLACONTA =:CONTA ) AND'
      '  ( PLATIPO = '#39'A'#39')'
      '')
    ValidateWithMask = True
    Left = 425
    Top = 131
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
    object qryVerificaContaPLASUBCONTA: TStringField
      FieldName = 'PLASUBCONTA'
      Size = 1
    end
    object qryVerificaContaPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Size = 1
    end
  end
  object qryAtualizaSaldoIL: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H.IDHISTCARTINV, H.DATAMOVCARTINV, H.NATURMOVOPER,'
      '   H.IDOPERACAOINVEST, H.IDDESPOPERINVEST,H.IDTIPOINVEST,'
      '   H.SALDOQTDEINVCART, H.SALDOVLRINVCART,'
      
        '   H.VLRMOVCARTINV, H.COTASMOVCARTINV, H.NATURMOVCARTINV, H.QTDE' +
        'MOVINVCART,'
      
        '   H.MOVIMATU, H.SALDOATU, H.MOVIMCAR, H.SALDOCAR, H.MOVIMAQUI, ' +
        'H.SALDOAQUI, H.SALDOREND,'
      '   H.FLGCALCSALDO, H.TIPMOVCARTINV, H.VLRPREMIO,'
      
        '   H.IDCARTEIRAINVEST, H.IDINVESTIMENTO, H.IDLOTE, H.VLRJUROS, H' +
        '.VLRVARIACAO,'
      
        '   H.VLRIRPROV, H.VLRIRAPU, H.VLRIOFPROV, H.VLRIOFAPU, H.VLRAGIO' +
        ','
      ''
      '   DOP.IDTIPOOPERACAO, DOP.FLGCALCDIARIO'
      'FROM'
      '   HISTCARTINV H,'
      '   OPERACAOINVEST OP, DESPOPERINVEST DOP'
      'WHERE'
      '   ( H.IDCARTEIRAINVEST =:CARTEIRA )'
      '   AND ( H.IDINVESTIMENTO =:INVESTIMENTO )'
      '   AND'
      '   ('
      '   ( (:LOTE IS NOT NULL) AND (H.IDLOTE =:LOTE) )'
      '   OR'
      '   ( (:LOTE IS NULL) AND (H.IDLOTE IS NULL) )'
      '   )'
      '   AND'
      '   ('
      '   ( (H.DATAMOVCARTINV >:DATAMOV) )'
      '   OR'
      
        '   ( (H.DATAMOVCARTINV =:DATAMOV) AND (H.IDHISTCARTINV >=:HISTOR' +
        'ICO) )'
      '   )'
      '   AND ( H.IDOPERACAOINVEST = OP.IDOPERACAOINVEST(+) )'
      '   AND ( H.IDDESPOPERINVEST = DOP.IDDESPOPERINVEST(+) )'
      ''
      'ORDER BY'
      '   H.DATAMOVCARTINV, H.IDHISTCARTINV'
      ' ')
    ValidateWithMask = True
    Left = 425
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
    object qryAtualizaSaldoILIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryAtualizaSaldoILDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryAtualizaSaldoILNATURMOVOPER: TStringField
      FieldName = 'NATURMOVOPER'
      Size = 1
    end
    object qryAtualizaSaldoILIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryAtualizaSaldoILIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
    end
    object qryAtualizaSaldoILSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qryAtualizaSaldoILSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
    end
    object qryAtualizaSaldoILVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
    end
    object qryAtualizaSaldoILCOTASMOVCARTINV: TFloatField
      FieldName = 'COTASMOVCARTINV'
    end
    object qryAtualizaSaldoILNATURMOVCARTINV: TStringField
      FieldName = 'NATURMOVCARTINV'
      Size = 1
    end
    object qryAtualizaSaldoILQTDEMOVINVCART: TFloatField
      FieldName = 'QTDEMOVINVCART'
    end
    object qryAtualizaSaldoILMOVIMATU: TFloatField
      FieldName = 'MOVIMATU'
    end
    object qryAtualizaSaldoILSALDOATU: TFloatField
      FieldName = 'SALDOATU'
    end
    object qryAtualizaSaldoILMOVIMCAR: TFloatField
      FieldName = 'MOVIMCAR'
    end
    object qryAtualizaSaldoILSALDOCAR: TFloatField
      FieldName = 'SALDOCAR'
    end
    object qryAtualizaSaldoILMOVIMAQUI: TFloatField
      FieldName = 'MOVIMAQUI'
    end
    object qryAtualizaSaldoILSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object qryAtualizaSaldoILSALDOREND: TFloatField
      FieldName = 'SALDOREND'
    end
    object qryAtualizaSaldoILFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Size = 1
    end
    object qryAtualizaSaldoILTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Size = 3
    end
    object qryAtualizaSaldoILIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryAtualizaSaldoILIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryAtualizaSaldoILIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryAtualizaSaldoILVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
    end
    object qryAtualizaSaldoILVLRVARIACAO: TFloatField
      FieldName = 'VLRVARIACAO'
    end
    object qryAtualizaSaldoILVLRIRPROV: TFloatField
      FieldName = 'VLRIRPROV'
    end
    object qryAtualizaSaldoILVLRIRAPU: TFloatField
      FieldName = 'VLRIRAPU'
    end
    object qryAtualizaSaldoILVLRIOFPROV: TFloatField
      FieldName = 'VLRIOFPROV'
    end
    object qryAtualizaSaldoILVLRIOFAPU: TFloatField
      FieldName = 'VLRIOFAPU'
    end
    object qryAtualizaSaldoILVLRAGIO: TFloatField
      FieldName = 'VLRAGIO'
    end
    object qryAtualizaSaldoILIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryAtualizaSaldoILFLGCALCDIARIO: TFloatField
      FieldName = 'FLGCALCDIARIO'
    end
    object qryAtualizaSaldoILVLRPREMIO: TFloatField
      FieldName = 'VLRPREMIO'
    end
    object qryAtualizaSaldoILIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MOESIGLA,MOEPERIODICIDADE, FLGPERCVALOR'
      'FROM'
      '  MOEDA'
      'WHERE'
      '  ( MOECODIGO =:MOEDA )'
      '')
    ValidateWithMask = True
    Left = 233
    Top = 393
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOEDA'
        ParamType = ptUnknown
      end>
    object qryMoedaMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Origin = 'MOEDA.MOEPERIODICIDADE'
      Size = 1
    end
    object qryMoedaFLGPERCVALOR: TStringField
      FieldName = 'FLGPERCVALOR'
      Origin = 'MOEDA.FLGPERCVALOR'
      Size = 1
    end
    object qryMoedaMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
  end
  object qryInsertHistCartInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTCARTINV'
      '   (IDHISTCARTINV, IDCARTEIRAINVEST, IDINVESTIMENTO,'
      '   IDDESPOPERINVEST, IDDESPCARTINVEST, IDOPERACAOINVEST,'
      '   IDTIPOINVEST, IDTIPOOPERACAO, DATAMOVCARTINV,'
      '   VLRMOVCARTINV, COTASMOVCARTINV, IDLOTE, FLGCUSTODIA,'
      '   HISTMOVCARTINV, NATURMOVCARTINV, TIPMOVCARTINV, FLGCALCSALDO,'
      
        '   IDEMPRESAPROP, IDMODULO, PLNCODIGO, CODDOCUMENTO, PLANO, QTDE' +
        'MOVINVCART,'
      '   NATURMOVOPER, RECPAG, IDLANCIMOVEL, VLRJUROS, VLRVARIACAO,'
      
        '   VLRIRPROV, VLRIRAPU, VLRIOFPROV, VLRIOFAPU, VLRAGIO,VLRCPMFPR' +
        'OV,VLRCPMFAPU,'
      
        '   IDCORRETVALORES,IDPLANPREVCTBPATR,IDCARTEIRAGERENC, SALDOQTDE' +
        'CPMF)'
      'VALUES'
      '   (:IDHISTCARTINV, :CARTEIRA, :INVESTIMENTO, :DESPESAINVEST,'
      '   :DESPESACART, :OPERACAO, :TIPOINVEST, :TIPOOPER, :DATA,'
      '   :MOVIMENTO, :COTAS, :LOTE, :FLGCUSTODIA,'
      
        '   :HISTMOVCARTINV, :NATURMOVCARTINV, :TIPMOVCARTINV, :FLGCALCSA' +
        'LDO,'
      
        '   :EMPRESAPROP, :MODULO, :PLANILHA, :DOCUMENTO, :PLANO, :QUANTI' +
        'DADE,'
      '   :NATURMOVOPER, :RECPAG, :LANCAMENTO, :VLRJUROS, :VLRVARIACAO,'
      
        '   :VLRIRPROV, :VLRIRAPU, :VLRIOFPROV, :VLRIOFAPU, :VLRAGIO, :VL' +
        'RCPMFPROV, :VLRCPMFAPU,'
      
        '   :IDCORRETVALORES,:IDPLANPREVCTBPATR,:IDCARTEIRAGERENC, :SALDO' +
        'QTDECPMF)'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 425
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DESPESAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DESPESACART'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'COTAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGCUSTODIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'HISTMOVCARTINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NATURMOVCARTINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPMOVCARTINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGCALCSALDO'
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
        Name = 'PLANILHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NATURMOVOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'LANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRVARIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIRPROV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIRAPU'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIOFPROV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIOFAPU'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRAGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRCPMFPROV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRCPMFAPU'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOQTDECPMF'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaHistPorOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H.IDHISTCARTINV, H.FLGCALCSALDO, H.IDCARTEIRAINVEST,'
      '   H.IDINVESTIMENTO, H.IDLOTE, H.DATAMOVCARTINV'
      'FROM'
      '   HISTCARTINV H'
      'WHERE'
      '   H.IDOPERACAOINVEST =:OPERACAO'
      'ORDER BY'
      '   IDHISTCARTINV DESC')
    ValidateWithMask = True
    Left = 425
    Top = 38
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end>
    object qryBuscaHistPorOperIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = 'HISTCARTINV.IDHISTCARTINV'
    end
    object qryBuscaHistPorOperFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = 'HISTCARTINV.FLGCALCSALDO'
      Size = 1
    end
    object qryBuscaHistPorOperIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCARTINV.IDCARTEIRAINVEST'
    end
    object qryBuscaHistPorOperIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCARTINV.IDINVESTIMENTO'
    end
    object qryBuscaHistPorOperIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCARTINV.IDLOTE'
      Size = 10
    end
    object qryBuscaHistPorOperDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Origin = 'HISTCARTINV.DATAMOVCARTINV'
    end
  end
  object qryBuscaHistPorHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H.IDHISTCARTINV, H.FLGCALCSALDO, H.IDCARTEIRAINVEST,'
      '   H.IDINVESTIMENTO, H.IDLOTE, H.DATAMOVCARTINV'
      'FROM'
      '   HISTCARTINV H'
      'WHERE'
      '   IDHISTCARTINV =:HISTORICO')
    ValidateWithMask = True
    Left = 425
    Top = 26
    ParamData = <
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
    object qryBuscaHistPorHistIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = 'HISTCARTINV.IDHISTCARTINV'
    end
    object qryBuscaHistPorHistFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = 'HISTCARTINV.FLGCALCSALDO'
      Size = 1
    end
    object qryBuscaHistPorHistIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCARTINV.IDCARTEIRAINVEST'
    end
    object qryBuscaHistPorHistIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCARTINV.IDINVESTIMENTO'
    end
    object qryBuscaHistPorHistIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCARTINV.IDLOTE'
      Size = 10
    end
    object qryBuscaHistPorHistDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Origin = 'HISTCARTINV.DATAMOVCARTINV'
    end
  end
  object qryBuscaProxHistCart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H.IDHISTCARTINV, H.IDCARTEIRAINVEST, H.IDINVESTIMENTO,'
      '   H.IDLOTE'
      'FROM'
      '   HISTCARTINV H'
      'WHERE'
      '   ( H.IDCARTEIRAINVEST =:CARTEIRA )'
      '   AND'
      '   ('
      '   ( (H.DATAMOVCARTINV >:DATAMOV) )'
      '   OR'
      
        '   ( (H.DATAMOVCARTINV =:DATAMOV) AND (H.IDHISTCARTINV >:HISTORI' +
        'CO) )'
      '   )'
      'ORDER BY'
      '   DATAMOVCARTINV, IDHISTCARTINV'
      '')
    ValidateWithMask = True
    Left = 425
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
    object qryBuscaProxHistCartIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = 'HISTCARTINV.IDHISTCARTINV'
    end
    object qryBuscaProxHistCartIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCARTINV.IDCARTEIRAINVEST'
    end
    object qryBuscaProxHistCartIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCARTINV.IDINVESTIMENTO'
    end
    object qryBuscaProxHistCartIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCARTINV.IDLOTE'
      Size = 10
    end
  end
  object qryMarcaFlagHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTCARTINV'
      'SET'
      '   FLGCALCSALDO =:FLAG'
      'WHERE'
      '   IDHISTCARTINV =:HISTORICO')
    ValidateWithMask = True
    Left = 233
    Top = 350
    ParamData = <
      item
        DataType = ftString
        Name = 'FLAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaProxInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H.IDHISTCARTINV, H.IDINVESTIMENTO'
      'FROM'
      '   HISTCARTINV H'
      'WHERE'
      '   ( H.IDCARTEIRAINVEST =:CARTEIRA )'
      '   AND ( H.IDINVESTIMENTO =:INVESTIMENTO )'
      '   AND'
      '   ('
      '   ( (:LOTE IS NOT NULL) AND (H.IDLOTE =:LOTE) )'
      '   OR'
      '   ( (:LOTE IS NULL) AND (H.IDLOTE IS NULL) )'
      '   )'
      '   AND'
      '   ('
      '   ( (H.DATAMOVCARTINV >:DATAMOV) )'
      '   OR'
      
        '   ( (H.DATAMOVCARTINV =:DATAMOV) AND (H.IDHISTCARTINV >:HISTORI' +
        'CO) )'
      '   )'
      'ORDER BY'
      '   DATAMOVCARTINV, IDHISTCARTINV')
    ValidateWithMask = True
    Left = 425
    Top = 65534
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
    object qryBuscaProxInvestIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = 'HISTCARTINV.IDHISTCARTINV'
    end
    object qryBuscaProxInvestIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCARTINV.IDINVESTIMENTO'
    end
  end
  object qryBuscaHistDesp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTCARTINV'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   IDDESPOPERINVEST =:DESPESA')
    ValidateWithMask = True
    Left = 327
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DESPESA'
        ParamType = ptUnknown
      end>
    object qryBuscaHistDespIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = 'HISTCARTINV.IDHISTCARTINV'
    end
  end
  object qryBuscaHistOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTCARTINV, VLRMOVCARTINV, QTDEMOVINVCART'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   ( TIPMOVCARTINV = '#39'OPE'#39')'
      '   AND (IDOPERACAOINVEST =:OPERACAO )')
    ValidateWithMask = True
    Left = 327
    Top = 41
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end>
    object qryBuscaHistOperIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = 'HISTCARTINV.IDHISTCARTINV'
    end
    object qryBuscaHistOperVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
      Origin = 'HISTCARTINV.VLRMOVCARTINV'
    end
    object qryBuscaHistOperQTDEMOVINVCART: TFloatField
      FieldName = 'QTDEMOVINVCART'
      Origin = 'HISTCARTINV.QTDEMOVINVCART'
    end
  end
  object qryBuscaCustodia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TIPOCUSTODIA'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   ( IDTIPOINVEST =:TIPOINVEST )'
      '   AND ( IDTIPOOPERACAO =:TIPOOPER )')
    ValidateWithMask = True
    Left = 51
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOPER'
        ParamType = ptUnknown
      end>
    object qryBuscaCustodiaTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'TIPOOPERACAO.TIPOCUSTODIA'
      Size = 1
    end
  end
  object qryUpdateHistPorDesp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTCARTINV'
      'SET'
      '   DATAMOVCARTINV   =:DATA,'
      '   VLRMOVCARTINV    =:MOVIMENTO,'
      '   QTDEMOVINVCART   =:QUANTIDADE,'
      '   VLRVARIACAO      =:VLRVARIACAO,'
      '   VLRJUROS         =:VLRJUROS,'
      '   VLRIRPROV        =:VLRIRPROV,'
      '   VLRIRAPU         =:VLRIRAPU,'
      '   VLRIOFPROV       =:VLRIOFPROV,'
      '   VLRIOFAPU        =:VLRIOFAPU,'
      '   VLRAGIO          =:VLRAGIO,'
      '   COTASMOVCARTINV  =:COTAS,'
      '   FLGCALCSALDO     = '#39'1'#39','
      '   SALDOQTDECPMF    =:SALDOQTDECPMF'
      'WHERE'
      '   IDDESPOPERINVEST =:DESPESA'
      ' ')
    ValidateWithMask = True
    Left = 509
    Top = 39
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRVARIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIRPROV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIRAPU'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIOFPROV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIOFAPU'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRAGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'COTAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOQTDECPMF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DESPESA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateHistPorOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTCARTINV'
      'SET'
      '   DATAMOVCARTINV   =:DATA,'
      '   VLRMOVCARTINV    =:MOVIMENTO,'
      '   QTDEMOVINVCART   =:QUANTIDADE,'
      '   VLRVARIACAO      =:VLRVARIACAO,'
      '   VLRJUROS         =:VLRJUROS,'
      '   VLRIRPROV        =:VLRIRPROV,'
      '   VLRIRAPU         =:VLRIRAPU,'
      '   VLRIOFPROV       =:VLRIOFPROV,'
      '   VLRIOFAPU        =:VLRIOFAPU,'
      '   VLRAGIO          =:VLRAGIO,'
      '   COTASMOVCARTINV  =:COTAS,'
      '   FLGCALCSALDO     = '#39'1'#39','
      '   SALDOQTDECPMF = :SALDOQTDECPMF'
      'WHERE'
      '   ( IDOPERACAOINVEST =:OPERACAO )'
      '   AND ( IDDESPOPERINVEST IS NULL )'
      '')
    ValidateWithMask = True
    Left = 509
    Top = 27
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRVARIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIRPROV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIRAPU'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIOFPROV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIOFAPU'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRAGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'COTAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOQTDECPMF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H.IDHISTCARTINV, H.FLGCALCSALDO, H.IDCARTEIRAINVEST,'
      '   H.IDINVESTIMENTO, H.IDLOTE, H.DATAMOVCARTINV,'
      '   H.PLANO, H.PLNCODIGO, H.CODDOCUMENTO,H.IDTIPOINVEST '
      'FROM'
      '   HISTCARTINV H'
      'WHERE'
      '   H.IDHISTCARTINV =:HISTORICO OR'
      '   H.IDOPERACAOINVEST =:OPERACAO'
      'ORDER BY'
      '   IDHISTCARTINV DESC'
      '')
    ValidateWithMask = True
    Left = 327
    Top = 27
    ParamData = <
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end>
    object qryBuscaHistoricoIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = 'HISTCARTINV.IDHISTCARTINV'
    end
    object qryBuscaHistoricoFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = 'HISTCARTINV.FLGCALCSALDO'
      Size = 1
    end
    object qryBuscaHistoricoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCARTINV.IDCARTEIRAINVEST'
    end
    object qryBuscaHistoricoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCARTINV.IDINVESTIMENTO'
    end
    object qryBuscaHistoricoIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCARTINV.IDLOTE'
      Size = 10
    end
    object qryBuscaHistoricoDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Origin = 'HISTCARTINV.DATAMOVCARTINV'
    end
    object qryBuscaHistoricoPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'HISTCARTINV.PLANO'
    end
    object qryBuscaHistoricoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'HISTCARTINV.PLNCODIGO'
    end
    object qryBuscaHistoricoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'HISTCARTINV.CODDOCUMENTO'
    end
    object qryBuscaHistoricoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'HISTCARTINV.IDTIPOINVEST'
    end
  end
  object qryBuscaHistTransf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   VLRMOVCARTINV,'
      ''
      '   MOVIMAQUI, MOVIMCAR, MOVIMATU, VLRVARIACAO,'
      '   VLRJUROS, VLRPREMIO, VLRIRPROV, VLRIRAPU,'
      '   VLRIOFPROV, VLRIOFAPU, VLRAGIO'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   ( IDOPERACAOINVEST =:OPERACAO )'
      '   AND ( TIPMOVCARTINV = '#39'TRF'#39' )'
      '   AND ( NATURMOVCARTINV = '#39'D'#39' )'
      '')
    ValidateWithMask = True
    Left = 327
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end>
    object qryBuscaHistTransfVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
      Origin = 'HISTCARTINV.VLRMOVCARTINV'
    end
    object qryBuscaHistTransfMOVIMAQUI: TFloatField
      FieldName = 'MOVIMAQUI'
    end
    object qryBuscaHistTransfMOVIMCAR: TFloatField
      FieldName = 'MOVIMCAR'
    end
    object qryBuscaHistTransfMOVIMATU: TFloatField
      FieldName = 'MOVIMATU'
    end
    object qryBuscaHistTransfVLRVARIACAO: TFloatField
      FieldName = 'VLRVARIACAO'
    end
    object qryBuscaHistTransfVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
    end
    object qryBuscaHistTransfVLRPREMIO: TFloatField
      FieldName = 'VLRPREMIO'
    end
    object qryBuscaHistTransfVLRIRPROV: TFloatField
      FieldName = 'VLRIRPROV'
    end
    object qryBuscaHistTransfVLRIRAPU: TFloatField
      FieldName = 'VLRIRAPU'
    end
    object qryBuscaHistTransfVLRIOFPROV: TFloatField
      FieldName = 'VLRIOFPROV'
    end
    object qryBuscaHistTransfVLRIOFAPU: TFloatField
      FieldName = 'VLRIOFAPU'
    end
    object qryBuscaHistTransfVLRAGIO: TFloatField
      FieldName = 'VLRAGIO'
    end
  end
  object qryUpdateHistSaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTCARTINV'
      'SET'
      '   SALDOVLRCARTINV =:SALDOVALOR,'
      '   VLRMOVCARTINV =:VALORMOVIMENTO,'
      '   COTASMOVCARTINV =:COTASMOVIMENTO,'
      '   SALDOCOTASCARTINV =:SALDOCOTAS,'
      '   FLGCALCSALDO      =:FLAG'
      'WHERE'
      '   ( IDHISTCARTINV =:HISTORICO )'
      '')
    ValidateWithMask = True
    Left = 509
    Top = 15
    ParamData = <
      item
        DataType = ftFloat
        Name = 'SALDOVALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORMOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'COTASMOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOCOTAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
  end
  object qryDesmarcaFlagIni: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTCARTINV'
      'SET'
      '   FLGCALCSALDO = '#39#39
      'WHERE'
      '   IDHISTCARTINV =:HISTORICO')
    ValidateWithMask = True
    Left = 135
    Top = 87
    ParamData = <
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
    object FloatField4: TFloatField
      FieldName = 'VLRMOVCARTINV'
      Origin = 'HISTCARTINV.VLRMOVCARTINV'
    end
  end
  object qryBuscaTotDesp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(VLRMOVCARTINV) AS VLRMOVCARTINV'
      'FROM'
      '   HISTCARTINV                        '
      'WHERE'
      '   ( TIPMOVCARTINV = '#39'DOP'#39')'
      '   AND ( IDOPERACAOINVEST =:OPERACAO )')
    ValidateWithMask = True
    Left = 327
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptUnknown
      end>
    object qryBuscaTotDespVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
      Origin = 'HISTCARTINV.VLRMOVCARTINV'
    end
  end
  object qryUpdateHistFlagValor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTCARTINV'
      'SET'
      '   VLRMOVCARTINV =:VALOR,   '
      '   FLGCALCSALDO =:FLAG'
      'WHERE'
      '   IDHISTCARTINV =:HISTORICO')
    ValidateWithMask = True
    Left = 425
    Top = 306
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTCARTINV'
      'SET'
      '   SALDOQTDEINVCART  =:SALDOQTDEINVEST,'
      '   SALDOVLRINVCART   =:SALDOVALORINVEST,'
      '   MOVIMATU          =:MOVIMENTOATUARIAL,'
      '   SALDOATU          =:SALDOATUARIAL,'
      '   MOVIMCAR          =:MOVIMENTOCARTEIRA,'
      '   SALDOCAR          =:SALDOCARTEIRA,'
      '   MOVIMAQUI         =:MOVIMENTOAQUISICAO,'
      '   SALDOAQUI         =:SALDOAQUISICAO,'
      '   SALDOREND         =:SALDORENDIMENTO,'
      '   SALDOVARIACAO     =:SALDOVARIACAO,'
      '   SALDOJUROS        =:SALDOJUROS,'
      '   VLRVARIACAO       =:MOVIMENTOVARIACAO,'
      '   VLRJUROS          =:MOVIMENTOJUROS,'
      '   VLRPREMIO         =:MOVIMENTOPREMIO,'
      '   SALDOPREMIO       =:SALDOPREMIO,'
      '   VLRIRPROV         =:MOVIMENTOIRPROV,'
      '   SALDOIRPROV       =:SALDOIRPROV,'
      '   VLRIRAPU          =:MOVIMENTOIRAPU,'
      '   SALDOIRAPU        =:SALDOIRAPU,'
      '   VLRIOFPROV        =:MOVIMENTOIOFPROV,'
      '   SALDOIOFPROV      =:SALDOIOFPROV,'
      '   VLRIOFAPU         =:MOVIMENTOIOFAPU,'
      '   SALDOIOFAPU       =:SALDOIOFAPU,'
      '   VLRAGIO           =:MOVIMENTOAGIO,'
      '   SALDOAGIO         =:SALDOAGIO,'
      '   FLGCALCSALDO      =:FLAG'
      ''
      'WHERE'
      '   IDHISTCARTINV =:HISTORICO')
    ValidateWithMask = True
    Left = 509
    Top = 2
    ParamData = <
      item
        DataType = ftFloat
        Name = 'SALDOQTDEINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOVALORINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOVIMENTOATUARIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOATUARIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOVIMENTOCARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOCARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOVIMENTOAQUISICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOAQUISICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDORENDIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOVARIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOVIMENTOVARIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOVIMENTOJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOVIMENTOPREMIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOPREMIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOVIMENTOIRPROV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOIRPROV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOVIMENTOIRAPU'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOIRAPU'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOVIMENTOIOFPROV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOIOFPROV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOVIMENTOIOFAPU'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOIOFAPU'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MOVIMENTOAGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOAGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
  end
  object qryPadrLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPESSOA, IDPADRLANCCONT,'
      '   IDTIPOINVEST, IDTIPOOPERACAO, IDTIPODESPINVEST,'
      '   IDCARTEIRAINVEST, CODTIPTITULO,'
      '   IDINVESTIMENTO, IDFORCLI, FLGPAGRECNAO, RECPAG,'
      '   CODCENTRORESPON, CODTIPRECDES, UNIDNEGOC,'
      '   PLANO, CONTADOPERFIN, CONTACOPERFIN,'
      '   CENCUSTDINVEST, CENCUSTCINVEST, IDEMPRESA,'
      '   CODSUBCONTAD, CODSUBCONTAC, TIPCODIGO,'
      '   TIPMOVCARTINV, TIPLANCINVEST, HISTLANCINVEST,'
      '   IDREGRALANCONTINV, TIPFORNINV'
      ''
      'FROM PADRLANCCONTINV'
      ''
      'WHERE IDPESSOA          = :EMPRESAPROP'
      '  AND IDEMPRESA         = :EMPRESAPROP'
      '  AND TIPMOVCARTINV     = :TIPOMOV'
      '  AND IDTIPOINVEST      = :TIPOINVEST'
      
        '  AND ((:TIPOLANC       IS NULL)  OR (TIPLANCINVEST    = :TIPOLA' +
        'NC))'
      
        '  AND ((:TIPOOPERACAO   IS NULL)  OR (IDTIPOOPERACAO   = :TIPOOP' +
        'ERACAO))'
      
        '  AND ((:TIPOTITULO     IS NULL)  OR (CODTIPTITULO     = :TIPOTI' +
        'TULO))'
      
        '  AND (((:TIPODESPESA   IS NULL) AND (IDTIPODESPINVEST IS NULL))' +
        ' OR'
      '       (IDTIPODESPINVEST = :TIPODESPESA))'
      
        '  AND (((:CARTEIRA      IS NULL) AND (IDCARTEIRAINVEST IS NULL))' +
        ' OR'
      '       (IDCARTEIRAINVEST =:CARTEIRA))'
      '  AND (((:INVESTIMENTO IS NULL) AND (IDINVESTIMENTO IS NULL)) OR'
      '       (IDINVESTIMENTO = :INVESTIMENTO))')
    ValidateWithMask = True
    Left = 327
    Top = 131
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOLANC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOLANC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOTITULO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOTITULO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPODESPESA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPODESPESA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'INVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'INVESTIMENTO'
        ParamType = ptResult
      end>
    object qryPadrLancIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryPadrLancIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
    end
    object qryPadrLancIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryPadrLancIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryPadrLancIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
    end
    object qryPadrLancIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryPadrLancCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Size = 5
    end
    object qryPadrLancIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryPadrLancIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryPadrLancFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Size = 1
    end
    object qryPadrLancRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object qryPadrLancCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object qryPadrLancCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object qryPadrLancUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryPadrLancPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryPadrLancCONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Size = 18
    end
    object qryPadrLancCONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Size = 18
    end
    object qryPadrLancCENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Size = 10
    end
    object qryPadrLancCENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Size = 10
    end
    object qryPadrLancIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryPadrLancCODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
    end
    object qryPadrLancCODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
    end
    object qryPadrLancTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Size = 2
    end
    object qryPadrLancTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Size = 3
    end
    object qryPadrLancTIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Size = 1
    end
    object qryPadrLancHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Size = 60
    end
    object qryPadrLancIDREGRALANCONTINV: TFloatField
      FieldName = 'IDREGRALANCONTINV'
    end
    object qryPadrLancTIPFORNINV: TStringField
      FieldName = 'TIPFORNINV'
      Size = 2
    end
  end
  object QryDespesasOperacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'DOP.IDDESPOPERINVEST, DOP.IDOPERACAOINVEST,'
      '         NVL(DOP.VLRDESPOPER,0) AS VLRDESPOPER,'
      '         DOP.IDTIPODESPINVEST'
      'FROM '#9'DESPOPERINVEST DOP'
      ''
      'WHERE '#9'(DOP.IDOPERACAOINVEST = :IDOPERACAOINVEST)'
      '')
    ValidateWithMask = True
    Left = 135
    Top = 65534
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
    object QryDespesasOperacaoIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
    end
    object QryDespesasOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryDespesasOperacaoVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
    end
    object QryDespesasOperacaoIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
    end
  end
  object qryDespNegXTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPODESPINVEST, FLGGERACONTAB, FLGGERACAPCAR, CODTIPDOC,'
      '   RECPAG'
      'FROM'
      '   DESPESASXTIPOOPER'
      'WHERE'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( IDTIPODESPINVEST < 0 ) '
      'ORDER BY IDTIPODESPINVEST DESC')
    ValidateWithMask = True
    Left = 509
    Top = 148
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'DESPESASXTIPOOPER.FLGGERACONTAB'
    end
    object FloatField2: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'DESPESASXTIPOOPER.FLGGERACAPCAR'
    end
    object FloatField3: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'DESPESASXTIPOOPER.CODTIPDOC'
    end
    object StringField1: TStringField
      FieldName = 'RECPAG'
      Origin = 'DESPESASXTIPOOPER.RECPAG'
      Size = 1
    end
    object qryDespNegXTipoOperIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'DESPESASXTIPOOPER.IDTIPODESPINVEST'
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DESCINVESTIMENTO'
      'FROM'
      '  INVESTIMENTO'
      'WHERE'
      '  ( IDINVESTIMENTO =:INVESTIMENTO )'
      '')
    ValidateWithMask = True
    Left = 594
    Top = 354
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INVESTIMENTO'
        ParamType = ptUnknown
      end>
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
  end
  object qryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   DESCCARTINVEST, IDPLANOPREV, IDPATROCINADORA '
      'FROM CARTEIRAINVEST'
      'WHERE'
      '  ( IDCARTEIRAINVEST = :CARTEIRA)')
    ValidateWithMask = True
    Left = 51
    Top = 393
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end>
    object qryCarteiraDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'CARTEIRAINVEST.IDPLANOPREV'
    end
    object qryCarteiraIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Origin = 'CARTEIRAINVEST.IDPATROCINADORA'
    end
  end
  object QryLucroPrejuizo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  VLRMOVCARTINV, QTDEMOVINVCART'
      'FROM    HISTCARTINV'
      'WHERE '#9'(TIPMOVCARTINV    = '#39'OPE'#39') AND'
      '       '#9'(IDOPERACAOINVEST =:IDOPERACAOINVEST)')
    ValidateWithMask = True
    Left = 233
    Top = 131
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaTotDespOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  SUM(VLRMOVCARTINV) AS TOTVLRDESPOPER'
      'FROM    HISTCARTINV'
      'WHERE '#9'(TIPMOVCARTINV    = '#39'DOP'#39') AND'
      '         (IDOPERACAOINVEST =:IDOPERACAOINVEST)')
    ValidateWithMask = True
    Left = 51
    Top = 85
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryUpdHistCartInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTCARTINV SET VLRMOVCARTINV  =:VLRMOVCARTINV,'
      '                       FLGCALCSALDO   = '#39'4'#39
      'WHERE (IDHISTCARTINV =:IDHISTCARTINV)')
    ValidateWithMask = True
    Left = 425
    Top = 175
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VLRMOVCARTINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaCotacaoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATACOTACAO, VLRCONTABIL, QTDTITLOTE'
      'FROM COTACAOINVEST'
      'WHERE '#9'(IDINVESTIMENTO =:IDINVESTIMENTO) AND'
      '      '#9'(DATACOTACAO   <=:DATACOTACAO)'
      'ORDER BY DATACOTACAO DESC'
      ' ')
    ValidateWithMask = True
    Left = 135
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATACOTACAO'
        ParamType = ptUnknown
      end>
    object QryBuscaCotacaoInvestDATACOTACAO: TDateTimeField
      FieldName = 'DATACOTACAO'
      Origin = 'COTACAOINVEST.DATACOTACAO'
    end
    object QryBuscaCotacaoInvestVLRCONTABIL: TFloatField
      FieldName = 'VLRCONTABIL'
      Origin = 'COTACAOINVEST.VLRCONTABIL'
    end
    object QryBuscaCotacaoInvestQTDTITLOTE: TFloatField
      FieldName = 'QTDTITLOTE'
      Origin = 'COTACAOINVEST.QTDTITLOTE'
    end
  end
  object qryLocal: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 233
    Top = 65534
  end
  object qryLancaDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 233
    Top = 306
  end
  object QryLocal1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 233
    Top = 42
  end
  object QryBuscaTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT IDTIPOINVEST, IDTIPOOPERACAO, IDMERCADO,   DESCTIPOOPERAC' +
        'AO,'
      
        '       TIPOCUSTODIA, VENCIMENTO,     TIPCREDOR,   NATUREZAOPERAC' +
        'AO,'
      
        '       FLGTRANSF, FLGCORRET, FLGORDMOVINV, FLGTRATAIR,RECPAG , F' +
        'LGCONTAINVEST'
      'FROM'
      '    TIPOOPERACAO'
      'WHERE'
      '   (IDTIPOINVEST   = :IDTIPOINVEST) AND'
      '   (IDTIPOOPERACAO = :IDTIPOOPERACAO)'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 51
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object QryBuscaTipoOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOOPERACAO.IDTIPOINVEST'
    end
    object QryBuscaTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object QryBuscaTipoOperacaoIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'TIPOOPERACAO.IDMERCADO'
    end
    object QryBuscaTipoOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryBuscaTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Size = 1
    end
    object QryBuscaTipoOperacaoTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'TIPOOPERACAO.TIPOCUSTODIA'
      Size = 1
    end
    object QryBuscaTipoOperacaoVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'TIPOOPERACAO.VENCIMENTO'
    end
    object QryBuscaTipoOperacaoTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object QryBuscaTipoOperacaoFLGTRANSF: TStringField
      FieldName = 'FLGTRANSF'
      Origin = 'TIPOOPERACAO.FLGTRANSF'
      Size = 1
    end
    object QryBuscaTipoOperacaoFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      Origin = 'TIPOOPERACAO.FLGCORRET'
      Size = 1
    end
    object QryBuscaTipoOperacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
  end
  object QryVerFechamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DATAULTFECH'
      'FROM'
      '   PARAMINVEST')
    ValidateWithMask = True
    Left = 425
    Top = 85
  end
  object qryBuscaSubconta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   CV.SUBCONTAD,CV.SUBCONTAC'
      'FROM '
      '   CORRETVALORES CV'
      'WHERE '
      '   CV.IDCORRETVALORES = :IdCorretValores')
    ValidateWithMask = True
    Left = 51
    Top = 131
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdCorretValores'
        ParamType = ptUnknown
      end>
    object qryBuscaSubcontaSUBCONTAD: TFloatField
      FieldName = 'SUBCONTAD'
      Origin = 'CORRETVALORES.SUBCONTAD'
    end
    object qryBuscaSubcontaSUBCONTAC: TFloatField
      FieldName = 'SUBCONTAC'
      Origin = 'CORRETVALORES.SUBCONTAC'
    end
  end
  object qryAtualizaSaldoC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   HC.IDHISTCARTINV, HC.IDINVESTIMENTO, HC.IDLOTE, HC.NATURMOVOP' +
        'ER,'
      
        '   HC.IDOPERACAOINVEST, HC.SALDOCOTASCARTINV, HC.SALDOVLRCARTINV' +
        ','
      '   HC.VLRMOVCARTINV, HC.COTASMOVCARTINV, HC.NATURMOVCARTINV,'
      '   HC.IDDESPOPERINVEST, HC.FLGCALCSALDO,  HC.TIPMOVCARTINV,'
      '   HC.QTDEMOVINVCART, HC.DATAMOVCARTINV, HC.IDCARTEIRAINVEST,'
      
        '   HC.IDTIPOINVEST, HC.MOVIMAQUI, HC.IDTIPOOPERACAO AS IDTIPOOPE' +
        'RHIST,'
      '   DOP.IDTIPOOPERACAO, DOP.FLGCALCDIARIO'
      ''
      'FROM'
      '   HISTCARTINV HC, DESPOPERINVEST DOP'
      ''
      'WHERE'
      '   ( HC.IDCARTEIRAINVEST =:CARTEIRA )'
      '   AND'
      '   ('
      '   ( (HC.DATAMOVCARTINV >:DATAMOV) )'
      '   OR'
      
        '   ( (HC.DATAMOVCARTINV =:DATAMOV) AND (HC.IDHISTCARTINV >=:HIST' +
        'ORICO) )'
      '   )'
      '   AND ( HC.IDDESPOPERINVEST = DOP.IDDESPOPERINVEST(+) )'
      ''
      'ORDER BY'
      '   DATAMOVCARTINV, IDHISTCARTINV'
      ''
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
    Left = 327
    Top = 65534
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
    object qryAtualizaSaldoCIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryAtualizaSaldoCIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryAtualizaSaldoCIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryAtualizaSaldoCNATURMOVOPER: TStringField
      FieldName = 'NATURMOVOPER'
      Size = 1
    end
    object qryAtualizaSaldoCIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryAtualizaSaldoCSALDOCOTASCARTINV: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
    end
    object qryAtualizaSaldoCSALDOVLRCARTINV: TFloatField
      FieldName = 'SALDOVLRCARTINV'
    end
    object qryAtualizaSaldoCVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
    end
    object qryAtualizaSaldoCCOTASMOVCARTINV: TFloatField
      FieldName = 'COTASMOVCARTINV'
    end
    object qryAtualizaSaldoCNATURMOVCARTINV: TStringField
      FieldName = 'NATURMOVCARTINV'
      Size = 1
    end
    object qryAtualizaSaldoCIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
    end
    object qryAtualizaSaldoCFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Size = 1
    end
    object qryAtualizaSaldoCTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Size = 3
    end
    object qryAtualizaSaldoCQTDEMOVINVCART: TFloatField
      FieldName = 'QTDEMOVINVCART'
    end
    object qryAtualizaSaldoCDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryAtualizaSaldoCIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryAtualizaSaldoCIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryAtualizaSaldoCFLGCALCDIARIO: TFloatField
      FieldName = 'FLGCALCDIARIO'
    end
    object qryAtualizaSaldoCIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryAtualizaSaldoCMOVIMAQUI: TFloatField
      FieldName = 'MOVIMAQUI'
    end
    object qryAtualizaSaldoCIDTIPOOPERHIST: TFloatField
      FieldName = 'IDTIPOOPERHIST'
    end
  end
  object QryLanctoDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = :CODDOCUMENTO')
    ValidateWithMask = True
    Left = 233
    Top = 175
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryLotexDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'DELETE FROM LOTEXDOCUM WHERE CODDOCUMENTO =:CODDOCUMENTO AND FLG' +
        'BAIXA <> '#39'B'#39' ')
    ValidateWithMask = True
    Left = 233
    Top = 85
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryRateioDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM RATEIODOCUM WHERE CODDOCUMENTO =:CODDOCUMENTO ')
    ValidateWithMask = True
    Left = 425
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DOCUMENTO WHERE CODDOCUMENTO = :CODDOCUMENTO')
    ValidateWithMask = True
    Left = 143
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryPlanilha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM PLANILHA WHERE PLNCODIGO =:PLNCODIGO')
    ValidateWithMask = True
    Left = 327
    Top = 85
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object QryLancamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LANCAMENTO WHERE PLNCODIGO =:PLNCODIGO')
    ValidateWithMask = True
    Left = 233
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object QryRecbtoPagto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM RECBTOPAGTO WHERE CODDOCUMENTO =:CODDOCUMENTO')
    ValidateWithMask = True
    Left = 327
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryIrLitigio: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE IRLITIGIO SET PLANO = NULL, PLNCODIGO = NULL'
      'WHERE PLNCODIGO =:PLNCODIGO')
    ValidateWithMask = True
    Left = 594
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object QryHistCartInv: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE HISTCARTINV'
      'SET PLANO = NULL, PLNCODIGO = NULL'
      'WHERE PLNCODIGO =:PLNCODIGO '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 135
    Top = 175
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object qrySaldoCarteiraNull: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDHISTCARTINV, DATAMOVCARTINV, IDCARTEIRAINVEST, IDCARTEIRAGE' +
        'RENC,'
      ''
      '   SALDOCOTASCARTINV,'
      '   SALDOVLRCARTINV,'
      '   SALDOQTDEINVCART,'
      '   SALDOVLRINVCART'
      ''
      'FROM'
      '   HISTCARTINV'
      ''
      'WHERE'
      '   (IDCARTEIRAINVEST =:CARTEIRA)'
      '   AND'
      '   (IDCARTEIRAGERENC IS NULL) '
      '   AND'
      '   ('
      '   ( (DATAMOVCARTINV <:DATAMOV) )'
      '   OR'
      
        '   ( (DATAMOVCARTINV =:DATAMOV) AND (IDHISTCARTINV <:HISTORICO) ' +
        ')'
      '   )'
      ''
      'ORDER BY'
      '   DATAMOVCARTINV DESC, IDHISTCARTINV DESC'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 327
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
    object FloatField23: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = 'HISTCARTINV.IDHISTCARTINV'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Origin = 'HISTCARTINV.DATAMOVCARTINV'
    end
    object FloatField24: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCARTINV.IDCARTEIRAINVEST'
    end
    object FloatField25: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
      Origin = 'HISTCARTINV.SALDOCOTASCARTINV'
    end
    object FloatField26: TFloatField
      FieldName = 'SALDOVLRCARTINV'
      Origin = 'HISTCARTINV.SALDOVLRCARTINV'
    end
    object FloatField27: TFloatField
      FieldName = 'SALDOQTDEINVCART'
      Origin = 'HISTCARTINV.SALDOQTDEINVCART'
    end
    object FloatField28: TFloatField
      FieldName = 'SALDOVLRINVCART'
      Origin = 'HISTCARTINV.SALDOVLRINVCART'
    end
    object FloatField29: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
  end
  object qryBetaCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDCARTEIRAINVEST, IDCARTEIRAGERENC, SUM(PRODBETA) AS VLRBETAC' +
        'ART, TABELA.TOTALSALDO'
      'FROM'
      '   (SELECT DISTINCT'
      
        '       H1.IDCARTEIRAINVEST, H1.IDCARTEIRAGERENC, H1.IDINVESTIMEN' +
        'TO,'
      
        '       NVL(SALDO.SALDOQTDEINVCART,0) AS QTDE, SALDO.SALDOVLRINVC' +
        'ART AS SALDO,'
      '       SALDOTOTAL.TOTALQTDE, SALDOTOTAL.TOTALSALDO,'
      
        '       (SALDO.SALDOVLRINVCART / SALDOTOTAL.TOTALSALDO) as PERCEN' +
        'TUAL,'
      '       CB.VLRBETA,'
      
        '       ((SALDO.SALDOVLRINVCART / SALDOTOTAL.TOTALSALDO) * CB.VLR' +
        'BETA) AS PRODBETA'
      '    FROM'
      '       HISTCARTINV H1,'
      '       (SELECT'
      
        '           H1.IDHISTCARTINV, H1.IDCARTEIRAINVEST, H1.IDCARTEIRAG' +
        'ERENC, H1.DATAMOVCARTINV,'
      
        '           H1.IDINVESTIMENTO, H1.SALDOQTDEINVCART, H1.SALDOVLRIN' +
        'VCART'
      '        FROM'
      '           HISTCARTINV H1'
      '        WHERE'
      '           (IDCARTEIRAINVEST = :IDCARTEIRAINVEST) AND'
      
        '           (((:IDCARTEIRAGERENC IS NOT NULL) AND (IDCARTEIRAGERE' +
        'NC = :IDCARTEIRAGERENC)) OR ((:IDCARTEIRAGERENC IS NULL) AND (ID' +
        'CARTEIRAGERENC IS NULL))) AND'
      '           (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) AND'
      '           (IDLOTE IS NULL) AND'
      '           (H1.DATAMOVCARTINV = (SELECT'
      '                                    MAX(H2.DATAMOVCARTINV)'
      '                                 FROM'
      '                                    HISTCARTINV H2'
      '                                 WHERE'
      
        '                                    (H2.IDCARTEIRAINVEST(+) = H1' +
        '.IDCARTEIRAINVEST) AND'
      
        '                                    (((:IDCARTEIRAGERENC IS NOT ' +
        'NULL) AND (H2.IDCARTEIRAGERENC = H1.IDCARTEIRAINVEST)) OR ((:IDC' +
        'ARTEIRAGERENC IS NULL) AND (H2.IDCARTEIRAGERENC IS NULL))) AND'
      
        '                                    (H2.IDPLANPREVCTBPATR = :IDP' +
        'LANPREVCTBPATR) AND'
      
        '                                    (H2.IDINVESTIMENTO   = H1.ID' +
        'INVESTIMENTO )    AND'
      
        '                                    (((H1.IDLOTE IS NOT NULL) AN' +
        'D (H2.IDLOTE = H1.IDLOTE) ) OR ((H1.IDLOTE IS NULL) AND (H2.IDLO' +
        'TE IS NULL) ) )  AND'
      
        '                                    ((H2.DATAMOVCARTINV  < TO_DA' +
        'TE(:DATAMOVCARTINV,'#39'DD/MM/YYYY'#39')) OR'
      
        '                                    ((H2.DATAMOVCARTINV  = TO_DA' +
        'TE(:DATAMOVCARTINV,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                     (H2.IDHISTCARTINV    < 9999' +
        '999999))))) AND'
      ''
      '                                    (H1.IDHISTCARTINV = (SELECT'
      
        '                                                            MAX(' +
        'H3.IDHISTCARTINV)'
      '                                                         FROM'
      
        '                                                            HIST' +
        'CARTINV H3'
      '                                                         WHERE'
      
        '                                                            (H3.' +
        'IDCARTEIRAINVEST(+) = H1.IDCARTEIRAINVEST ) AND'
      
        '                                                            (((:' +
        'IDCARTEIRAGERENC IS NOT NULL) AND (H3.IDCARTEIRAGERENC = H1.IDCA' +
        'RTEIRAGERENC)) OR ((:IDCARTEIRAGERENC IS NULL) AND (H3.IDCARTEIR' +
        'AGERENC IS NULL))) AND'
      
        '                                                            (H3.' +
        'IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) AND'
      
        '                                                            (H3.' +
        'IDINVESTIMENTO = H1.IDINVESTIMENTO )     AND'
      
        '                                                            (((H' +
        '1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE' +
        ' IS NULL) AND (H3.IDLOTE IS NULL) ) )    AND'
      
        '                                                            (H3.' +
        'DATAMOVCARTINV   = H1.DATAMOVCARTINV)  AND'
      
        '                                                            ((H3' +
        '.DATAMOVCARTINV <  TO_DATE(:DATAMOVCARTINV,'#39'DD/MM/YYYY'#39')) OR'
      
        '                                                            (H3.' +
        'IDHISTCARTINV  <  999999999))))    AND'
      '           (SALDOVLRINVCART IS NOT NULL ) AND'
      '           (SALDOQTDEINVCART > 0)'
      '       ) SALDO,'
      '       (SELECT'
      
        '           SUM(TOTAL.QTDE) AS TOTALQTDE, SUM(TOTAL.SALDO) AS TOT' +
        'ALSALDO'
      '        FROM'
      '           (SELECT DISTINCT'
      
        '               H1.IDCARTEIRAINVEST, H1.IDCARTEIRAGERENC, H1.IDIN' +
        'VESTIMENTO,'
      
        '               SALDO.SALDOQTDEINVCART AS QTDE, SALDO.SALDOVLRINV' +
        'CART AS SALDO'
      '            FROM'
      '               HISTCARTINV H1,'
      '               (SELECT'
      
        '                   H1.IDHISTCARTINV, H1.IDCARTEIRAINVEST, H1.IDC' +
        'ARTEIRAGERENC,'
      '                   H1.DATAMOVCARTINV, H1.IDINVESTIMENTO,'
      '                   H1.SALDOQTDEINVCART, H1.SALDOVLRINVCART'
      '                FROM'
      '                   HISTCARTINV H1'
      '                WHERE'
      '                   (IDCARTEIRAINVEST = :IDCARTEIRAINVEST) AND'
      
        '                   (((:IDCARTEIRAGERENC IS NOT NULL) AND (IDCART' +
        'EIRAGERENC = :IDCARTEIRAGERENC)) OR ((:IDCARTEIRAGERENC IS NULL)' +
        ' AND (IDCARTEIRAGERENC IS NULL))) AND'
      '                   (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) AND'
      '                   (IDLOTE IS NULL) AND'
      '                   (H1.DATAMOVCARTINV = (SELECT'
      
        '                                            MAX(H2.DATAMOVCARTIN' +
        'V)'
      '                                         FROM'
      '                                            HISTCARTINV H2'
      '                                         WHERE'
      
        '                                            (H2.IDCARTEIRAINVEST' +
        '(+) = H1.IDCARTEIRAINVEST )AND'
      
        '                                            (((null IS NOT NULL)' +
        ' AND (H2.IDCARTEIRAGERENC = H1.IDCARTEIRAGERENC)) OR ((null IS N' +
        'ULL) AND (H2.IDCARTEIRAGERENC IS NULL))) AND'
      
        '                                            (H2.IDPLANPREVCTBPAT' +
        'R = :IDPLANPREVCTBPATR) AND'
      
        '                                            (H2.IDINVESTIMENTO  ' +
        ' = H1.IDINVESTIMENTO )    AND'
      
        '                                            (((H1.IDLOTE IS NOT ' +
        'NULL) AND (H2.IDLOTE = H1.IDLOTE) ) OR ((H1.IDLOTE IS NULL) AND ' +
        '(H2.IDLOTE IS NULL) ) )  AND'
      
        '                                            ((H2.DATAMOVCARTINV ' +
        ' < TO_DATE(:DATAMOVCARTINV,'#39'DD/MM/YYYY'#39')) OR'
      
        '                                            ((H2.DATAMOVCARTINV ' +
        ' = TO_DATE(:DATAMOVCARTINV,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                             (H2.IDHISTCARTINV  ' +
        '  < 9999999999))))) AND'
      '                   (H1.IDHISTCARTINV =  (SELECT'
      
        '                                            MAX(H3.IDHISTCARTINV' +
        ')'
      '                                         FROM'
      '                                            HISTCARTINV H3'
      '                                         WHERE'
      
        '                                            (H3.IDCARTEIRAINVEST' +
        '(+) = H1.IDCARTEIRAINVEST) AND'
      
        '                                            (((null IS NOT NULL)' +
        ' AND (H3.IDCARTEIRAGERENC = H1.IDCARTEIRAGERENC)) OR ((null IS N' +
        'ULL) AND (H3.IDCARTEIRAGERENC IS NULL))) AND'
      
        '                                            (H3.IDPLANPREVCTBPAT' +
        'R = :IDPLANPREVCTBPATR) AND'
      
        '                                            (H3.IDINVESTIMENTO =' +
        ' H1.IDINVESTIMENTO )            AND'
      
        '                                            (((H1.IDLOTE IS NOT ' +
        'NULL) AND (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H' +
        '3.IDLOTE IS NULL) ) )    AND'
      
        '                                            (H3.DATAMOVCARTINV  ' +
        ' = H1.DATAMOVCARTINV)  AND'
      
        '                                            ((H3.DATAMOVCARTINV ' +
        '<  TO_DATE(:DATAMOVCARTINV,'#39'DD/MM/YYYY'#39')) OR'
      
        '                                             (H3.IDHISTCARTINV  ' +
        '<  999999999))))    AND'
      '                   (SALDOVLRINVCART IS NOT NULL ) AND'
      '                   (SALDOQTDEINVCART > 0)'
      '               ) SALDO'
      '            WHERE'
      
        '               (H1.IDINVESTIMENTO(+) = SALDO.IDINVESTIMENTO)  AN' +
        'D'
      '               (H1.IDCARTEIRAINVEST = :IDCARTEIRAINVEST) AND'
      
        '               (((:IDCARTEIRAGERENC IS NOT NULL) AND (H1.IDCARTE' +
        'IRAGERENC = :IDCARTEIRAGERENC)) OR ((:IDCARTEIRAGERENC IS NULL) ' +
        'AND (H1.IDCARTEIRAGERENC IS NULL))) AND'
      '               (H1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)'
      '            ) TOTAL'
      '        ) SALDOTOTAL,'
      '        COTACAOBETA CB'
      '   WHERE'
      
        '     (H1.IDINVESTIMENTO = SALDO.IDINVESTIMENTO)               AN' +
        'D'
      
        '     (H1.IDINVESTIMENTO = CB.IDINVESTIMENTO)                  AN' +
        'D'
      
        '     (CB.DATACOTACAO = TO_DATE(:DATAMOVCARTINV,'#39'DD/MM/YYYY'#39')) AN' +
        'D'
      
        '     (CB.IDPARAMIMPEXCEL = :IDPARAMIMPEXCEL)                  AN' +
        'D'
      
        '     (H1.IDCARTEIRAINVEST = :IDCARTEIRAINVEST)                AN' +
        'D'
      
        '     (((:IDCARTEIRAGERENC IS NOT NULL) AND (H1.IDCARTEIRAGERENC ' +
        '= :IDCARTEIRAGERENC)) OR((:IDCARTEIRAGERENC IS NULL) AND (H1.IDC' +
        'ARTEIRAGERENC IS NULL))) AND'
      
        '     (H1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)              AN' +
        'D'
      '     NVL(SALDO.SALDOQTDEINVCART,0) > 0'
      '   ) TABELA'
      'GROUP BY IDCARTEIRAINVEST, IDCARTEIRAGERENC, TABELA.TOTALSALDO')
    ValidateWithMask = True
    Left = 425
    Top = 393
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPARAMIMPEXCEL'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end>
    object qryBetaCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBetaCarteiraVLRBETACART: TFloatField
      FieldName = 'VLRBETACART'
    end
    object qryBetaCarteiraTOTALSALDO: TFloatField
      FieldName = 'TOTALSALDO'
    end
  end
  object qryParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPARAMINVEST,'
      '   MASCSETOREMISSOR,'
      '   MOECODIGO,'
      '   MASCCLASSIFINV,'
      '   VLRDIVERG,'
      '   VLRCOTAINICART,'
      '   DATAULTFECH,'
      '   FLGORDMOVINV,'
      '   PERCPUORDMOVINV,'
      '   PERCIMPRENDA,'
      '   MOEDAATU,'
      '   PERCPARTICEMPR,'
      '   TRGDTINCLUSAO,'
      '   TRGUSERINCLUSAO,'
      '   PERCPARTICRECUR,'
      '   IDPARAMPATRLIQ,'
      '   TIPOMENU,'
      '   DATAULTFECHRF,'
      '   IDTIPODESPIRAPU,'
      '   IDTIPODESPINVEST,'
      '   MOEDAGER,'
      '   FLGPROVISIONAIRRF,'
      '   FLGPROVISIONAIRRV,'
      '   PUCDB,'
      '   DATAMOVCDBLIB,'
      '   IDTIPODESPIRPROV,'
      '   MOEDAATULIT,'
      '   IDPROGRAMA,'
      '   IDTIPOCLIENTECOR,'
      '   IDTIPOOPERDIRINC,'
      '   IDTIPOOPERDIRCIS,'
      '   IDTIPOOPERDIRDES,'
      '   IDTIPOOPERDIRGRU,'
      '   IDTIPOOPERDIRPER,'
      '   IDTIPOOPERDIRBON,'
      '   IDTIPOOPERDIRDIV,'
      '   IDTIPOOPERDIRSUB,'
      '   IDTIPOINVEST,'
      '   IDTIPOOPERDIRJUR,'
      '   IDTIPOCLIENTEEMI,'
      '   IDTIPOCLIENTECUS,'
      '   IDTIPOCONTRRF,'
      '   IDBVSP,'
      '   IDTIPOINVESTIDOR,'
      '   IDMERCADO,'
      '   IDTIPOOPERLIQPEND,'
      '   IDBMF,'
      '   IDTIPOCONTRFIN,'
      '   DATAULTFECHFDO,'
      '   DATAULTFECHBMF,'
      '   IDTPPERIODICIDADE,'
      '   DATAULTIMPCOT,'
      '   IDTIPOOPERDIRALT,'
      '   IDRAMOFORCOR,'
      '   IDRAMOFOREMI,'
      '   IDRAMOFORCUS,'
      '   FLGLIBERAIDLOTE,'
      '   IDTIPOOPERDIRRES,'
      '   FLGUSASUBCONTA,'
      '   PERCDEVRV,'
      '   PERCDEVBMF,'
      '   DIASEMANACPMF,'
      '   DIASUTEISCPMF,'
      '   IDCUSTODIARENFIX,'
      '   IDTIPOREGRARV,'
      '   IDTIPOREGRARF,'
      '   IDTIPOREGRABMF,'
      '   FLGIMPLANTRF,'
      '   FLGCONTABILIZA,'
      '   FLGINTCAPCAR,'
      '   IDCONTRAPARTERF,'
      '   IDAUTORIZAORDEM,'
      '   IDCLASSETIT,'
      '   FLGEMPACOES,'
      '   IDCARTEMPACOES,'
      '   IDREGRAEMPACOES,'
      '   IDMOTBLOQEMPAC,'
      '   FLGCARTGERENC,'
      '   IDINDEXPOUPANCA,'
      '   JUROSPOUPANCA,'
      '   IDTIPOOPERDIRMUL,'
      '   IDPLANPREVCTBPATR,'
      '   IDOPERAMORTPRINC,'
      '   IDOPERINCJUROS,'
      '   IDOPERPAGTOJUROS,'
      '   FLGESPECFUNDO,'
      '   FLGCOMPVARRV,'
      '   PRZVENCBMF,'
      '   PRZVENCCFIANCA,'
      '   IDTIPOREGRAFND,'
      '   IDCLASSPOUPBLOQ,'
      '   IDTIPOREGRARENT,'
      '   IDTIPOREGRAATUAR,'
      '   FLGPLANPREVCTBPAT,'
      '   IDCLASSNTN,'
      '   IDTIPOOPERDIRREE,'
      '   DATAULTFECHEMP,'
      '   IDTIPOOPERDIRPROV,'
      '   IDTIPOOPEROPCCP,'
      '   IDTIPOOPEROPCVD,'
      '   MOEDAEQM,'
      '   STARET,'
      '   DATAULTRET,'
      '   IDCARTOPCIND,'
      '   IDCARTOPC,'
      '   IDMOTBLOQOPC,'
      '   IDCARTAVISTA,'
      '   DIFMAXOPCIND,'
      '   IDTIPOREGRAOPCIN,'
      '   IDTIPOREGRAEMPAC,'
      '   IDTIPODESPDVCOR,'
      '   IDGRUPOREGRAINV,'
      '   FLGDEMO,'
      '   FLGINTFINLIQ,'
      '   DTMUDACPMF,'
      '   FLGRECPAGRV,'
      '   IDTIPOOPERDIRDSU,'
      '   DIFRESGFUNDOS,'
      '   FLGPOUPAPROPDIA,'
      '   IDTIPOOPERRFRAC,'
      '   IDTIPOOPERDIRDSA,'
      '   IDTIPOOPERDIRDSR,'
      '   FLGREGIMECXCOMP,'
      '   DTAREGIMECXCOMP,'
      '   PZORECCPMF,'
      '   DATAINIRECCPMF,'
      '   MASCSCLASSIFANBID,'
      '   FLGCONTABDIAUTIL,'
      '   FLGINTCONTABRF,'
      '   FLGINTCONTABRV,'
      '   FLGINTCONTABBMF,'
      '   FLGINTCONTABFRF,'
      '   FLGINTCONTABFRV,'
      '   FLGINTCONTABFIM,'
      '   FLGINTCONTABFDC,'
      '   FLGINTCONTABFIP,'
      '   FLGINTCONTABOPI,'
      '   IDMOTBLOQPENFDO,'
      '   IDCARTEIRARF,'
      '   REGRABOLETA,'
      '   DATARELMOVIMENTO,'
      '   DATARELINICIAL,'
      '   DATAVIGDIR,'
      '   TPDATAVIGDIR,'
      '   IDCARTORIGEMPACOES'
      'FROM'
      '   PARAMINVEST')
    ValidateWithMask = True
    Left = 328
    Top = 175
    object qryParamInvestIDPARAMINVEST: TFloatField
      FieldName = 'IDPARAMINVEST'
      Origin = 'PARAMINVEST.IDPARAMINVEST'
    end
    object qryParamInvestMASCSETOREMISSOR: TStringField
      FieldName = 'MASCSETOREMISSOR'
      Origin = 'PARAMINVEST.MASCSETOREMISSOR'
      Size = 15
    end
    object qryParamInvestMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'PARAMINVEST.MOECODIGO'
    end
    object qryParamInvestMASCCLASSIFINV: TStringField
      FieldName = 'MASCCLASSIFINV'
      Origin = 'PARAMINVEST.MASCCLASSIFINV'
      Size = 15
    end
    object qryParamInvestVLRDIVERG: TFloatField
      FieldName = 'VLRDIVERG'
      Origin = 'PARAMINVEST.VLRDIVERG'
    end
    object qryParamInvestVLRCOTAINICART: TFloatField
      FieldName = 'VLRCOTAINICART'
      Origin = 'PARAMINVEST.VLRCOTAINICART'
    end
    object qryParamInvestDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
      Origin = 'PARAMINVEST.DATAULTFECH'
    end
    object qryParamInvestFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'PARAMINVEST.FLGORDMOVINV'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestPERCPUORDMOVINV: TFloatField
      FieldName = 'PERCPUORDMOVINV'
      Origin = 'PARAMINVEST.PERCPUORDMOVINV'
    end
    object qryParamInvestPERCIMPRENDA: TFloatField
      FieldName = 'PERCIMPRENDA'
      Origin = 'PARAMINVEST.PERCIMPRENDA'
    end
    object qryParamInvestMOEDAATU: TFloatField
      FieldName = 'MOEDAATU'
      Origin = 'PARAMINVEST.MOEDAATU'
    end
    object qryParamInvestPERCPARTICEMPR: TFloatField
      FieldName = 'PERCPARTICEMPR'
      Origin = 'PARAMINVEST.PERCPARTICEMPR'
    end
    object qryParamInvestTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'PARAMINVEST.TRGDTINCLUSAO'
    end
    object qryParamInvestTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'PARAMINVEST.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryParamInvestPERCPARTICRECUR: TFloatField
      FieldName = 'PERCPARTICRECUR'
      Origin = 'PARAMINVEST.PERCPARTICRECUR'
    end
    object qryParamInvestIDPARAMPATRLIQ: TFloatField
      FieldName = 'IDPARAMPATRLIQ'
      Origin = 'PARAMINVEST.IDPARAMPATRLIQ'
    end
    object qryParamInvestTIPOMENU: TStringField
      FieldName = 'TIPOMENU'
      Origin = 'PARAMINVEST.TIPOMENU'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestDATAULTFECHRF: TDateTimeField
      FieldName = 'DATAULTFECHRF'
      Origin = 'PARAMINVEST.DATAULTFECHRF'
    end
    object qryParamInvestIDTIPODESPIRAPU: TFloatField
      FieldName = 'IDTIPODESPIRAPU'
      Origin = 'PARAMINVEST.IDTIPODESPIRAPU'
    end
    object qryParamInvestIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PARAMINVEST.IDTIPODESPINVEST'
    end
    object qryParamInvestMOEDAGER: TFloatField
      FieldName = 'MOEDAGER'
      Origin = 'PARAMINVEST.MOEDAGER'
    end
    object qryParamInvestFLGPROVISIONAIRRF: TStringField
      FieldName = 'FLGPROVISIONAIRRF'
      Origin = 'PARAMINVEST.FLGPROVISIONAIRRF'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestFLGPROVISIONAIRRV: TStringField
      FieldName = 'FLGPROVISIONAIRRV'
      Origin = 'PARAMINVEST.FLGPROVISIONAIRRV'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestPUCDB: TFloatField
      FieldName = 'PUCDB'
      Origin = 'PARAMINVEST.PUCDB'
    end
    object qryParamInvestDATAMOVCDBLIB: TDateTimeField
      FieldName = 'DATAMOVCDBLIB'
      Origin = 'PARAMINVEST.DATAMOVCDBLIB'
    end
    object qryParamInvestIDTIPODESPIRPROV: TFloatField
      FieldName = 'IDTIPODESPIRPROV'
      Origin = 'PARAMINVEST.IDTIPODESPIRPROV'
    end
    object qryParamInvestMOEDAATULIT: TFloatField
      FieldName = 'MOEDAATULIT'
      Origin = 'PARAMINVEST.MOEDAATULIT'
    end
    object qryParamInvestIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'PARAMINVEST.IDPROGRAMA'
    end
    object qryParamInvestIDTIPOCLIENTECOR: TFloatField
      FieldName = 'IDTIPOCLIENTECOR'
      Origin = 'PARAMINVEST.IDTIPOCLIENTECOR'
    end
    object qryParamInvestIDTIPOOPERDIRINC: TFloatField
      FieldName = 'IDTIPOOPERDIRINC'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRINC'
    end
    object qryParamInvestIDTIPOOPERDIRCIS: TFloatField
      FieldName = 'IDTIPOOPERDIRCIS'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRCIS'
    end
    object qryParamInvestIDTIPOOPERDIRDES: TFloatField
      FieldName = 'IDTIPOOPERDIRDES'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRDES'
    end
    object qryParamInvestIDTIPOOPERDIRGRU: TFloatField
      FieldName = 'IDTIPOOPERDIRGRU'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRGRU'
    end
    object qryParamInvestIDTIPOOPERDIRPER: TFloatField
      FieldName = 'IDTIPOOPERDIRPER'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRPER'
    end
    object qryParamInvestIDTIPOOPERDIRBON: TFloatField
      FieldName = 'IDTIPOOPERDIRBON'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRBON'
    end
    object qryParamInvestIDTIPOOPERDIRDIV: TFloatField
      FieldName = 'IDTIPOOPERDIRDIV'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRDIV'
    end
    object qryParamInvestIDTIPOOPERDIRSUB: TFloatField
      FieldName = 'IDTIPOOPERDIRSUB'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRSUB'
    end
    object qryParamInvestIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PARAMINVEST.IDTIPOINVEST'
    end
    object qryParamInvestIDTIPOOPERDIRJUR: TFloatField
      FieldName = 'IDTIPOOPERDIRJUR'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRJUR'
    end
    object qryParamInvestIDTIPOCLIENTEEMI: TFloatField
      FieldName = 'IDTIPOCLIENTEEMI'
      Origin = 'PARAMINVEST.IDTIPOCLIENTEEMI'
    end
    object qryParamInvestIDTIPOCLIENTECUS: TFloatField
      FieldName = 'IDTIPOCLIENTECUS'
      Origin = 'PARAMINVEST.IDTIPOCLIENTECUS'
    end
    object qryParamInvestIDTIPOCONTRRF: TFloatField
      FieldName = 'IDTIPOCONTRRF'
      Origin = 'PARAMINVEST.IDTIPOCONTRRF'
    end
    object qryParamInvestIDBVSP: TFloatField
      FieldName = 'IDBVSP'
      Origin = 'PARAMINVEST.IDBVSP'
    end
    object qryParamInvestIDTIPOINVESTIDOR: TFloatField
      FieldName = 'IDTIPOINVESTIDOR'
      Origin = 'PARAMINVEST.IDTIPOINVESTIDOR'
    end
    object qryParamInvestIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'PARAMINVEST.IDMERCADO'
    end
    object qryParamInvestIDTIPOOPERLIQPEND: TFloatField
      FieldName = 'IDTIPOOPERLIQPEND'
      Origin = 'PARAMINVEST.IDTIPOOPERLIQPEND'
    end
    object qryParamInvestIDBMF: TFloatField
      FieldName = 'IDBMF'
      Origin = 'PARAMINVEST.IDBMF'
    end
    object qryParamInvestIDTIPOCONTRFIN: TFloatField
      FieldName = 'IDTIPOCONTRFIN'
      Origin = 'PARAMINVEST.IDTIPOCONTRFIN'
    end
    object qryParamInvestDATAULTFECHFDO: TDateTimeField
      FieldName = 'DATAULTFECHFDO'
      Origin = 'PARAMINVEST.DATAULTFECHFDO'
    end
    object qryParamInvestDATAULTFECHBMF: TDateTimeField
      FieldName = 'DATAULTFECHBMF'
      Origin = 'PARAMINVEST.DATAULTFECHBMF'
    end
    object qryParamInvestIDTPPERIODICIDADE: TFloatField
      FieldName = 'IDTPPERIODICIDADE'
      Origin = 'PARAMINVEST.IDTPPERIODICIDADE'
    end
    object qryParamInvestDATAULTIMPCOT: TDateTimeField
      FieldName = 'DATAULTIMPCOT'
      Origin = 'PARAMINVEST.DATAULTIMPCOT'
    end
    object qryParamInvestIDTIPOOPERDIRALT: TFloatField
      FieldName = 'IDTIPOOPERDIRALT'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRALT'
    end
    object qryParamInvestIDRAMOFORCOR: TFloatField
      FieldName = 'IDRAMOFORCOR'
      Origin = 'PARAMINVEST.IDRAMOFORCOR'
    end
    object qryParamInvestIDRAMOFOREMI: TFloatField
      FieldName = 'IDRAMOFOREMI'
      Origin = 'PARAMINVEST.IDRAMOFOREMI'
    end
    object qryParamInvestIDRAMOFORCUS: TFloatField
      FieldName = 'IDRAMOFORCUS'
      Origin = 'PARAMINVEST.IDRAMOFORCUS'
    end
    object qryParamInvestFLGLIBERAIDLOTE: TStringField
      FieldName = 'FLGLIBERAIDLOTE'
      Origin = 'PARAMINVEST.FLGLIBERAIDLOTE'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestIDTIPOOPERDIRRES: TFloatField
      FieldName = 'IDTIPOOPERDIRRES'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRRES'
    end
    object qryParamInvestFLGUSASUBCONTA: TStringField
      FieldName = 'FLGUSASUBCONTA'
      Origin = 'PARAMINVEST.FLGUSASUBCONTA'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestPERCDEVRV: TFloatField
      FieldName = 'PERCDEVRV'
      Origin = 'PARAMINVEST.PERCDEVRV'
    end
    object qryParamInvestPERCDEVBMF: TFloatField
      FieldName = 'PERCDEVBMF'
      Origin = 'PARAMINVEST.PERCDEVBMF'
    end
    object qryParamInvestDIASEMANACPMF: TStringField
      FieldName = 'DIASEMANACPMF'
      Origin = 'PARAMINVEST.DIASEMANACPMF'
      Size = 7
    end
    object qryParamInvestDIASUTEISCPMF: TFloatField
      FieldName = 'DIASUTEISCPMF'
      Origin = 'PARAMINVEST.DIASUTEISCPMF'
    end
    object qryParamInvestIDCUSTODIARENFIX: TFloatField
      FieldName = 'IDCUSTODIARENFIX'
      Origin = 'PARAMINVEST.IDCUSTODIARENFIX'
    end
    object qryParamInvestIDTIPOREGRARV: TFloatField
      FieldName = 'IDTIPOREGRARV'
      Origin = 'PARAMINVEST.IDTIPOREGRARV'
    end
    object qryParamInvestIDTIPOREGRARF: TFloatField
      FieldName = 'IDTIPOREGRARF'
      Origin = 'PARAMINVEST.IDTIPOREGRARF'
    end
    object qryParamInvestIDTIPOREGRABMF: TFloatField
      FieldName = 'IDTIPOREGRABMF'
      Origin = 'PARAMINVEST.IDTIPOREGRABMF'
    end
    object qryParamInvestFLGIMPLANTRF: TStringField
      FieldName = 'FLGIMPLANTRF'
      Origin = 'PARAMINVEST.FLGIMPLANTRF'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestFLGCONTABILIZA: TStringField
      FieldName = 'FLGCONTABILIZA'
      Origin = 'PARAMINVEST.FLGCONTABILIZA'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestFLGINTCAPCAR: TStringField
      FieldName = 'FLGINTCAPCAR'
      Origin = 'PARAMINVEST.FLGINTCAPCAR'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestIDCONTRAPARTERF: TFloatField
      FieldName = 'IDCONTRAPARTERF'
      Origin = 'PARAMINVEST.IDCONTRAPARTERF'
    end
    object qryParamInvestIDAUTORIZAORDEM: TFloatField
      FieldName = 'IDAUTORIZAORDEM'
      Origin = 'PARAMINVEST.IDAUTORIZAORDEM'
    end
    object qryParamInvestIDCLASSETIT: TFloatField
      FieldName = 'IDCLASSETIT'
      Origin = 'PARAMINVEST.IDCLASSETIT'
    end
    object qryParamInvestFLGEMPACOES: TStringField
      FieldName = 'FLGEMPACOES'
      Origin = 'PARAMINVEST.FLGEMPACOES'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestIDCARTEMPACOES: TFloatField
      FieldName = 'IDCARTEMPACOES'
      Origin = 'PARAMINVEST.IDCARTEMPACOES'
    end
    object qryParamInvestIDREGRAEMPACOES: TFloatField
      FieldName = 'IDREGRAEMPACOES'
      Origin = 'PARAMINVEST.IDREGRAEMPACOES'
    end
    object qryParamInvestIDMOTBLOQEMPAC: TFloatField
      FieldName = 'IDMOTBLOQEMPAC'
      Origin = 'PARAMINVEST.IDMOTBLOQEMPAC'
    end
    object qryParamInvestFLGCARTGERENC: TStringField
      FieldName = 'FLGCARTGERENC'
      Origin = 'PARAMINVEST.FLGCARTGERENC'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestIDINDEXPOUPANCA: TFloatField
      FieldName = 'IDINDEXPOUPANCA'
      Origin = 'PARAMINVEST.IDINDEXPOUPANCA'
    end
    object qryParamInvestJUROSPOUPANCA: TFloatField
      FieldName = 'JUROSPOUPANCA'
      Origin = 'PARAMINVEST.JUROSPOUPANCA'
    end
    object qryParamInvestIDTIPOOPERDIRMUL: TFloatField
      FieldName = 'IDTIPOOPERDIRMUL'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRMUL'
    end
    object qryParamInvestIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'PARAMINVEST.IDPLANPREVCTBPATR'
    end
    object qryParamInvestIDOPERAMORTPRINC: TFloatField
      FieldName = 'IDOPERAMORTPRINC'
      Origin = 'PARAMINVEST.IDOPERAMORTPRINC'
    end
    object qryParamInvestIDOPERINCJUROS: TFloatField
      FieldName = 'IDOPERINCJUROS'
      Origin = 'PARAMINVEST.IDOPERINCJUROS'
    end
    object qryParamInvestIDOPERPAGTOJUROS: TFloatField
      FieldName = 'IDOPERPAGTOJUROS'
      Origin = 'PARAMINVEST.IDOPERPAGTOJUROS'
    end
    object qryParamInvestFLGESPECFUNDO: TStringField
      FieldName = 'FLGESPECFUNDO'
      Origin = 'PARAMINVEST.FLGESPECFUNDO'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestFLGCOMPVARRV: TStringField
      FieldName = 'FLGCOMPVARRV'
      Origin = 'PARAMINVEST.FLGCOMPVARRV'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestPRZVENCBMF: TFloatField
      FieldName = 'PRZVENCBMF'
      Origin = 'PARAMINVEST.PRZVENCBMF'
    end
    object qryParamInvestPRZVENCCFIANCA: TFloatField
      FieldName = 'PRZVENCCFIANCA'
      Origin = 'PARAMINVEST.PRZVENCCFIANCA'
    end
    object qryParamInvestIDTIPOREGRAFND: TFloatField
      FieldName = 'IDTIPOREGRAFND'
      Origin = 'PARAMINVEST.IDTIPOREGRAFND'
    end
    object qryParamInvestIDCLASSPOUPBLOQ: TFloatField
      FieldName = 'IDCLASSPOUPBLOQ'
      Origin = 'PARAMINVEST.IDCLASSPOUPBLOQ'
    end
    object qryParamInvestIDTIPOREGRARENT: TFloatField
      FieldName = 'IDTIPOREGRARENT'
      Origin = 'PARAMINVEST.IDTIPOREGRARENT'
    end
    object qryParamInvestIDTIPOREGRAATUAR: TFloatField
      FieldName = 'IDTIPOREGRAATUAR'
      Origin = 'PARAMINVEST.IDTIPOREGRAATUAR'
    end
    object qryParamInvestFLGPLANPREVCTBPAT: TStringField
      FieldName = 'FLGPLANPREVCTBPAT'
      Origin = 'PARAMINVEST.FLGPLANPREVCTBPAT'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestIDCLASSNTN: TFloatField
      FieldName = 'IDCLASSNTN'
      Origin = 'PARAMINVEST.IDCLASSNTN'
    end
    object qryParamInvestIDTIPOOPERDIRREE: TFloatField
      FieldName = 'IDTIPOOPERDIRREE'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRREE'
    end
    object qryParamInvestDATAULTFECHEMP: TDateTimeField
      FieldName = 'DATAULTFECHEMP'
      Origin = 'PARAMINVEST.DATAULTFECHEMP'
    end
    object qryParamInvestIDTIPOOPERDIRPROV: TFloatField
      FieldName = 'IDTIPOOPERDIRPROV'
      Origin = 'PARAMINVEST.IDTIPOOPERDIRPROV'
    end
    object qryParamInvestIDTIPOOPEROPCCP: TFloatField
      FieldName = 'IDTIPOOPEROPCCP'
      Origin = 'PARAMINVEST.IDTIPOOPEROPCCP'
    end
    object qryParamInvestIDTIPOOPEROPCVD: TFloatField
      FieldName = 'IDTIPOOPEROPCVD'
      Origin = 'PARAMINVEST.IDTIPOOPEROPCVD'
    end
    object qryParamInvestMOEDAEQM: TFloatField
      FieldName = 'MOEDAEQM'
      Origin = 'PARAMINVEST.MOEDAEQM'
    end
    object qryParamInvestSTARET: TStringField
      FieldName = 'STARET'
      Origin = 'PARAMINVEST.STARET'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestDATAULTRET: TDateTimeField
      FieldName = 'DATAULTRET'
      Origin = 'PARAMINVEST.DATAULTRET'
    end
    object qryParamInvestIDCARTOPCIND: TFloatField
      FieldName = 'IDCARTOPCIND'
      Origin = 'PARAMINVEST.IDCARTOPCIND'
    end
    object qryParamInvestIDCARTOPC: TFloatField
      FieldName = 'IDCARTOPC'
      Origin = 'PARAMINVEST.IDCARTOPC'
    end
    object qryParamInvestIDMOTBLOQOPC: TFloatField
      FieldName = 'IDMOTBLOQOPC'
      Origin = 'PARAMINVEST.IDMOTBLOQOPC'
    end
    object qryParamInvestIDCARTAVISTA: TFloatField
      FieldName = 'IDCARTAVISTA'
      Origin = 'PARAMINVEST.IDCARTAVISTA'
    end
    object qryParamInvestDIFMAXOPCIND: TFloatField
      FieldName = 'DIFMAXOPCIND'
      Origin = 'PARAMINVEST.DIFMAXOPCIND'
    end
    object qryParamInvestIDTIPOREGRAOPCIN: TFloatField
      FieldName = 'IDTIPOREGRAOPCIN'
      Origin = 'PARAMINVEST.IDTIPOREGRAOPCIN'
    end
    object qryParamInvestIDTIPOREGRAEMPAC: TFloatField
      FieldName = 'IDTIPOREGRAEMPAC'
      Origin = 'PARAMINVEST.IDTIPOREGRAEMPAC'
    end
    object qryParamInvestIDTIPODESPDVCOR: TFloatField
      FieldName = 'IDTIPODESPDVCOR'
      Origin = 'PARAMINVEST.IDTIPODESPDVCOR'
    end
    object qryParamInvestIDGRUPOREGRAINV: TFloatField
      FieldName = 'IDGRUPOREGRAINV'
      Origin = 'PARAMINVEST.IDGRUPOREGRAINV'
    end
    object qryParamInvestFLGDEMO: TStringField
      FieldName = 'FLGDEMO'
      Origin = 'PARAMINVEST.FLGDEMO'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestFLGINTFINLIQ: TStringField
      FieldName = 'FLGINTFINLIQ'
      Origin = 'PARAMINVEST.FLGINTFINLIQ'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestDTMUDACPMF: TDateTimeField
      FieldName = 'DTMUDACPMF'
      Origin = 'BASEDADOS.PARAMINVEST.DTMUDACPMF'
    end
    object qryParamInvestFLGRECPAGRV: TStringField
      FieldName = 'FLGRECPAGRV'
      Origin = 'BASEDADOS.PARAMINVEST.FLGRECPAGRV'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestIDTIPOOPERDIRDSU: TFloatField
      FieldName = 'IDTIPOOPERDIRDSU'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERDIRDSU'
    end
    object qryParamInvestDIFRESGFUNDOS: TFloatField
      FieldName = 'DIFRESGFUNDOS'
      Origin = 'BASEDADOS.PARAMINVEST.DIFRESGFUNDOS'
    end
    object qryParamInvestFLGPOUPAPROPDIA: TStringField
      FieldName = 'FLGPOUPAPROPDIA'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestIDTIPOOPERRFRAC: TFloatField
      FieldName = 'IDTIPOOPERRFRAC'
      Origin = 'BASEDADOS.PARAMINVEST.IDTIPOOPERRFRAC'
    end
    object qryParamInvestIDTIPOOPERDIRDSA: TFloatField
      FieldName = 'IDTIPOOPERDIRDSA'
    end
    object qryParamInvestIDTIPOOPERDIRDSR: TFloatField
      FieldName = 'IDTIPOOPERDIRDSR'
    end
    object qryParamInvestFLGREGIMECXCOMP: TStringField
      FieldName = 'FLGREGIMECXCOMP'
      Origin = 'BASEDADOS.PARAMINVEST.FLGREGIMECXCOMP'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestDTAREGIMECXCOMP: TDateTimeField
      FieldName = 'DTAREGIMECXCOMP'
      Origin = 'BASEDADOS.PARAMINVEST.DTAREGIMECXCOMP'
    end
    object qryParamInvestPZORECCPMF: TFloatField
      FieldName = 'PZORECCPMF'
      Origin = 'BASEDADOS.PARAMINVEST.PZORECCPMF'
    end
    object qryParamInvestDATAINIRECCPMF: TDateTimeField
      FieldName = 'DATAINIRECCPMF'
      Origin = 'BASEDADOS.PARAMINVEST.DATAINIRECCPMF'
    end
    object qryParamInvestMASCSCLASSIFANBID: TStringField
      FieldName = 'MASCSCLASSIFANBID'
      Origin = 'BASEDADOS.PARAMINVEST.MASCSCLASSIFANBID'
      Size = 15
    end
    object qryParamInvestFLGCONTABDIAUTIL: TStringField
      FieldName = 'FLGCONTABDIAUTIL'
      Origin = 'BASEDADOS."CM.PARAMINVEST".FLGCONTABDIAUTIL'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestIDMOTBLOQPENFDO: TFloatField
      FieldName = 'IDMOTBLOQPENFDO'
      Origin = 'BASEDADOS.PARAMINVEST.IDMOTBLOQPENFDO'
    end
    object qryParamInvestIDCARTEIRARF: TFloatField
      FieldName = 'IDCARTEIRARF'
      Origin = 'BASEDADOS.PARAMINVEST.IDCARTEIRARF'
    end
    object qryParamInvestFLGINTCONTABRF: TStringField
      FieldName = 'FLGINTCONTABRF'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABRF'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestFLGINTCONTABRV: TStringField
      FieldName = 'FLGINTCONTABRV'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABRV'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestFLGINTCONTABBMF: TStringField
      FieldName = 'FLGINTCONTABBMF'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABBMF'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestFLGINTCONTABFRF: TStringField
      FieldName = 'FLGINTCONTABFRF'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABFRF'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestFLGINTCONTABFRV: TStringField
      FieldName = 'FLGINTCONTABFRV'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABFRV'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestFLGINTCONTABFIM: TStringField
      FieldName = 'FLGINTCONTABFIM'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABFIM'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestFLGINTCONTABFDC: TStringField
      FieldName = 'FLGINTCONTABFDC'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABFDC'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestFLGINTCONTABFIP: TStringField
      FieldName = 'FLGINTCONTABFIP'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABFIP'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestFLGINTCONTABOPI: TStringField
      FieldName = 'FLGINTCONTABOPI'
      Origin = 'BASEDADOS.PARAMINVEST.FLGINTCONTABOPI'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestREGRABOLETA: TStringField
      FieldName = 'REGRABOLETA'
      Origin = 'BASEDADOS.PARAMINVEST.REGRABOLETA'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestDATAVIGDIR: TDateTimeField
      FieldName = 'DATAVIGDIR'
      Origin = 'BASEDADOS.PARAMINVEST.DATAVIGDIR'
    end
    object qryParamInvestTPDATAVIGDIR: TStringField
      FieldName = 'TPDATAVIGDIR'
      Origin = 'BASEDADOS.PARAMINVEST.TPDATAVIGDIR'
      FixedChar = True
      Size = 1
    end
    object qryParamInvestDATARELMOVIMENTO: TDateTimeField
      FieldName = 'DATARELMOVIMENTO'
      Origin = 'BASEDADOS.PARAMINVEST.DATARELMOVIMENTO'
    end
    object qryParamInvestDATARELINICIAL: TDateTimeField
      FieldName = 'DATARELINICIAL'
      Origin = 'BASEDADOS.PARAMINVEST.DATARELINICIAL'
    end
    object qryParamInvestIDCARTORIGEMPACOES: TFloatField
      FieldName = 'IDCARTORIGEMPACOES'
      Origin = 'BASEDADOS.PARAMINVEST.IDCARTORIGEMPACOES'
    end
  end
  object QrySaldoVariacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   SUM(DECODE(L.LACDEBCRE, '#39'D'#39', L.LACVALOR, (L.LACVALOR * (-1)))' +
        ') AS SALDO'
      'FROM'
      '   PLANILHA P, LANCAMENTO L, SUBCONTA SC'
      'WHERE'
      '   (L.PLNCODIGO = P.PLNCODIGO) AND'
      '   (P.IDPESSOA = :IDPESSOA) AND'
      '   (L.CODSUBCONTA = SC.CODSUBCONTA(+)) AND'
      '   (L.IDPESSOA = SC.IDPESSOA(+)) AND'
      '   (RTRIM(L.PLACONTA) >= :CONTAINI) AND'
      '   (RTRIM(L.PLACONTA) <= :CONTAFIM) AND'
      '   (P.PEREXERCICIO = :EXERCICIO) AND'
      '   (P.PLNDATDIA <= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) AND'
      
        '   (((:IDPLANOPREV IS NOT NULL) AND (L.IDPLANOPREV = :IDPLANOPRE' +
        'V)) OR (:IDPLANOPREV IS NULL)) AND'
      
        '   (((:IDPATRO IS NOT NULL) AND (L.IDPATRO = :IDPATRO)) OR (:IDP' +
        'ATRO IS NULL)) '
      'GROUP BY L.PLACONTA'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 327
    Top = 393
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end>
    object QrySaldoVariacaoSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object dsEmpresa: TwwDataSource
    AutoEdit = False
    DataSet = qryEmpresa
    Left = 509
    Top = 191
  end
  object qryEmpresa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EP.IDPESSOA, EP.NOMEEMPRESA, PE.RAZAOSOCIAL,'
      '       EN.IDENDERECO, EN.CEP, IM.IMAGEM'
      
        'FROM PESSOA PE, ENDPESS EN, CIDADES CI, ESTADO ES, IMAGENS IM, E' +
        'MPRESAPROP EP '
      'WHERE (EP.IDPESSOA = PE.IDPESSOA) AND'
      '      (PE.IDIMAGEM = IM.IDIMAGEM(+)) AND'
      '      (EN.IDENDERECO(+) = PE.IDENDCOMERCIAL) AND'
      '      (CI.IDCIDADES(+) = EN.IDCIDADES) AND'
      '      (ES.IDESTADO(+) = CI.IDESTADO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 509
    Top = 179
    object qryEmpresaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryEmpresaNOMEEMPRESA: TStringField
      FieldName = 'NOMEEMPRESA'
      Size = 60
    end
    object qryEmpresaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryEmpresaIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
    end
    object qryEmpresaCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryEmpresaIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
  end
  object pplEmpresa: TppBDEPipeline
    DataSource = dsEmpresa
    UserName = 'pplEmpresa'
    Left = 509
    Top = 202
    object pplEmpresappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplEmpresappField2: TppField
      FieldAlias = 'NOMEEMPRESA'
      FieldName = 'NOMEEMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplEmpresappField3: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplEmpresappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENDERECO'
      FieldName = 'IDENDERECO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplEmpresappField5: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 4
    end
    object pplEmpresappField6: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object UpdValorizacao: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  DATAMOVCARTINV = :DATAMOVCARTINV,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  VLRCOTA = :VLRCOTA,'
      '  SALDO = :SALDO,'
      '  VLRAPLICACAO = :VLRAPLICACAO,'
      '  VLRRESGATE = :VLRRESGATE'
      'where'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (DATAMOVCARTINV, QUANTIDADE, VLRCOTA, SALDO, VLRAPLICACAO, VLR' +
        'RESGATE)'
      'values'
      
        '  (:DATAMOVCARTINV, :QUANTIDADE, :VLRCOTA, :SALDO, :VLRAPLICACAO' +
        ', :VLRRESGATE)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV')
    Left = 509
    Top = 239
  end
  object QryValorizacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT HF.DATAMOVFUNDO AS DATA,0 AS QUANTIDADE, 0 AS VLRCOTA, SU' +
        'M(HF.SALDOVLRFUNDO) AS SALDO,'
      
        '0 AS SALDOCOT, NVL(APL.VLRMOVFUNDO,0) AS VLRAPLICACAO , NVL(RESG' +
        '.VLRMOVFUNDO,0) AS VLRRESGATE, 1 AS IDRELATORIO'
      'FROM    HISTFUNDO HF,'
      '  (SELECT DATAMOVFUNDO, SUM(VLRMOVFUNDO) AS VLRMOVFUNDO'
      '   FROM HISTFUNDO'
      
        '   WHERE IDFUNDOINVEST IN (SELECT IDFUNDOINVEST FROM FUNDOINVEST' +
        ' WHERE IDTIPOFUNDOINVEST IN (:sIDTIPOINVEST)) AND'
      '     TIPMOVFUNDO   = '#39'OPE'#39' AND'
      '     NATURMOVFUNDO = '#39'A'#39'   AND'
      '     DATAMOVFUNDO >= TO_DATE(:sDATAINI,'#39'DD/MM/YYYY'#39')  AND'
      '     DATAMOVFUNDO <= TO_DATE(:sDATAFIM,'#39'DD/MM/YYYY'#39')'
      '   GROUP BY DATAMOVFUNDO  ) APL,'
      '  (SELECT DATAMOVFUNDO, SUM(VLRMOVFUNDO) AS VLRMOVFUNDO'
      '   FROM HISTFUNDO'
      
        '   WHERE IDFUNDOINVEST IN (SELECT IDFUNDOINVEST FROM FUNDOINVEST' +
        ' WHERE IDTIPOFUNDOINVEST IN (:sIDTIPOINVEST)) AND'
      '     TIPMOVFUNDO   = '#39'OPE'#39' AND'
      '     NATURMOVFUNDO = '#39'D'#39'   AND'
      '     DATAMOVFUNDO >= TO_DATE(:sDATAINI,'#39'DD/MM/YYYY'#39') AND'
      '     DATAMOVFUNDO <= TO_DATE(:sDATAFIM,'#39'DD/MM/YYYY'#39')'
      '   GROUP BY DATAMOVFUNDO ) RESG'
      'WHERE'
      
        '(HF.IDHISTFUNDO IN (SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO FROM ' +
        'HISTFUNDO'
      
        '                    WHERE (DATAMOVFUNDO >= TO_DATE(:sDATAINI,'#39'DD' +
        '/MM/YYYY'#39')) AND'
      
        '                          (DATAMOVFUNDO <= TO_DATE(:sDATAFIM,'#39'DD' +
        '/MM/YYYY'#39'))'
      
        '                    GROUP BY IDFUNDOINVEST, DATAMOVFUNDO, DATAAP' +
        'LICACAO ))     AND'
      
        '(HF.IDFUNDOINVEST IN (SELECT IDFUNDOINVEST FROM FUNDOINVEST WHER' +
        'E IDTIPOFUNDOINVEST IN (:sIDTIPOINVEST))) AND'
      '(APL.DATAMOVFUNDO(+)   = HF.DATAMOVFUNDO) AND'
      '(RESG.DATAMOVFUNDO(+)  = HF.DATAMOVFUNDO)'
      'GROUP BY HF.DATAMOVFUNDO, APL.VLRMOVFUNDO, RESG.VLRMOVFUNDO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    UpdateObject = UpdValorizacao
    ValidateWithMask = True
    Left = 509
    Top = 220
    ParamData = <
      item
        DataType = ftString
        Name = 'sIDTIPOINVEST'
        ParamType = ptUnknown
        Value = '3'
      end
      item
        DataType = ftString
        Name = 'sDATAINI'
        ParamType = ptUnknown
        Value = '01/08/2001'
      end
      item
        DataType = ftString
        Name = 'sDATAFIM'
        ParamType = ptUnknown
        Value = '20/08/2001'
      end
      item
        DataType = ftString
        Name = 'sIDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sIDTIPOINVEST'
        ParamType = ptUnknown
      end>
    object QryValorizacaoDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object QryValorizacaoQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object QryValorizacaoVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
    end
    object QryValorizacaoSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object QryValorizacaoSALDOCOT: TFloatField
      FieldName = 'SALDOCOT'
    end
    object QryValorizacaoVLRAPLICACAO: TFloatField
      FieldName = 'VLRAPLICACAO'
    end
    object QryValorizacaoVLRRESGATE: TFloatField
      FieldName = 'VLRRESGATE'
    end
    object QryValorizacaoIDRELATORIO: TFloatField
      FieldName = 'IDRELATORIO'
    end
  end
  object dsValorizacao: TwwDataSource
    AutoEdit = False
    DataSet = QryValorizacao
    Left = 509
    Top = 230
  end
  object QryUpdSaldoHistCaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'UPDATE HISTCAIXA SET SLDHISTCAIXA = ROUND(SLDHISTCAIXA*:VALORIZA' +
        'CAO,2) WHERE'
      'IDHISTCAIXA IN (SELECT MAX(IDHISTCAIXA) FROM HISTCAIXA WHERE'
      
        '                DATAHISTCAIXA = :DATAHISTCAIXA GROUP BY DATAHIST' +
        'CAIXA)'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 509
    Top = 310
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALORIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHISTCAIXA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdDataUltFechRV: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'UPDATE PARAMINVEST SET DATAULTFECH = :DATAULTFECH, DATAULTFECHEM' +
        'P =:DATAULTFECHEMP'
      ''
      ' '
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 509
    Top = 354
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAULTFECH'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAULTFECHEMP'
        ParamType = ptUnknown
      end>
  end
  object qryHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CODDOCUMENTO, PLANO, PLNCODIGO'
      'FROM   '
      '   HISTCARTINV     '
      'WHERE '
      '   (IDTIPOINVEST   = :IDTIPOINVEST) AND'
      '   (IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      '   (DATAMOVCARTINV = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      ''
      '   ('
      
        '    (((:IDOPERACAOINVEST IS NOT NULL) AND (IDOPERACAOINVEST  = :' +
        'IDOPERACAOINVEST)) OR (:IDOPERACAOINVEST IS NULL))'
      '   AND'
      '    (IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST'
      '                          FROM OPERACAOINVEST '
      '                          WHERE '
      
        '                             (IDINVESTIMENTO = :IDINVESTIMENTO) ' +
        'AND'
      
        '                             (DATAOPERACAO = TO_DATE(:dDataRef,'#39 +
        'DD/MM/YYYY'#39')) AND'
      
        '                             (((:NUMDOCUMENTO IS NOT NULL) AND (' +
        'NUMDOCUMENTO  = :NUMDOCUMENTO)) OR (:NUMDOCUMENTO IS NULL))))'
      '   ) AND'
      '   (TIPMOVCARTINV IN ('#39'OPE'#39','#39'TRF'#39')) ')
    ValidateWithMask = True
    Left = 51
    Top = 437
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptInput
      end>
    object qryHistoricoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryHistoricoPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryHistoricoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
  end
  object qryOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDOPERACAOINVEST, IDOPERACAODIREITO, IDINVESTIMENTO, IDCUSTOD' +
        'IANTE,'
      '   IDCARTEIRAINVEST, QTDEOPERACAO'
      'FROM'
      '   OPERACAOINVEST'
      'WHERE'
      '   (IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      '   (DATAOPERACAO = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39')) AND'
      
        '   (((:NUMDOCUMENTO IS NOT NULL) AND (NUMDOCUMENTO  = :NUMDOCUME' +
        'NTO)) OR (:NUMDOCUMENTO IS NULL))'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 135
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptInput
      end>
    object qryOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryOperacaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryOperacaoIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryOperacaoQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryOperacaoIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
  end
  object qrySaldoInvestCustodia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT H.SALDOLIBERADO, H.SALDOBLOQUEADO, H.SALDOQTDECPMF'
      'FROM HISTCUSTODIA H'
      'WHERE (H.IDCUSTODIA ='
      '            (SELECT MAX(H1.IDCUSTODIA)'
      '             FROM HISTCUSTODIA H1'
      '             WHERE (H1.IDINVESTIMENTO = :IDINVESTIMENTO)'
      '               AND (H1.IDCARTEIRAINVEST = :IDCARTEIRAINVEST)'
      
        '               AND ((:IDCUSTODIANTE IS NULL) OR (IDCUSTODIANTE =' +
        ' :IDCUSTODIANTE))'
      '               AND (IDMOTIVOBLOQUEIO  = :IDMOTIVOBLOQUEIO)'
      '               AND (H1.DATAMOVCUSTOD ='
      '                       (SELECT MAX(H2.DATAMOVCUSTOD)'
      '                        FROM HISTCUSTODIA H2'
      
        '                        WHERE (H2.IDINVESTIMENTO = :IDINVESTIMEN' +
        'TO)'
      
        '                          AND (H2.IDCARTEIRAINVEST = :IDCARTEIRA' +
        'INVEST)'
      
        '                          AND ((:IDCUSTODIANTE IS NULL) OR (H2.I' +
        'DCUSTODIANTE = :IDCUSTODIANTE))'
      
        '                          AND (H2.IDMOTIVOBLOQUEIO  = :IDMOTIVOB' +
        'LOQUEIO)'
      
        '                          AND (H2.DATAMOVCUSTOD <= TO_DATE(:DATA' +
        'MOV,'#39'DD/MM/YYYY'#39'))'
      '                       )'
      '                   )'
      '            )'
      '      )'
      'ORDER BY H.IDCUSTODIA DESC'
      ' ')
    ValidateWithMask = True
    Left = 135
    Top = 437
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end>
    object qrySaldoInvestCustodiaSALDOLIBERADO: TFloatField
      FieldName = 'SALDOLIBERADO'
    end
    object qrySaldoInvestCustodiaSALDOBLOQUEADO: TFloatField
      FieldName = 'SALDOBLOQUEADO'
    end
    object qrySaldoInvestCustodiaSALDOQTDECPMF: TFloatField
      FieldName = 'SALDOQTDECPMF'
    end
  end
  object qryFlgContabil: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FLGGERACONTAB'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   IDTIPOOPERACAO = :IDTIPOOPERACAO'
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'VLRDESPOPER'#9'###,###,###,#0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 509
    Top = 89
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object qryFlgContabilFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'TIPOOPERACAO.FLGGERACONTAB'
    end
  end
  object qryBuscaPlanPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PA.IDPATRO, PA.IDPLANOPREV'
      'FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) AND'
      '   (PA.IDPATRO = PE.IDPESSOA)  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 233
    Top = 437
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end>
    object qryBuscaPlanPatroIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'PLANPREVCONTABPATRO.IDPATRO'
    end
    object qryBuscaPlanPatroIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'PLANPREVCONTABPATRO.IDPLANOPREV'
    end
  end
  object qryBuscaPlnCodigo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO, PLNCODIGO'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   IDHISTCARTINV = :IDHISTCARTINV '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 509
    Top = 265
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptUnknown
      end>
    object qryBuscaPlnCodigoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'HISTCARTINV.PLNCODIGO'
    end
    object qryBuscaPlnCodigoPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'HISTCARTINV.PLANO'
    end
  end
  object qryUpdOperCustodia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE  OPERCUSTODIA  SET'
      '        IDCUSTODIADEST    = NULL, IDCUSTODIAORIG     = NULL,'
      '        IDHISTCARTINVDEST = NULL, IDHISTCARTINVORIG  = NULL'
      'WHERE   IDOPERCUSTODIA=:IDOPERCUSTODIA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 509
    Top = 397
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCUSTODIA'
        ParamType = ptUnknown
      end>
    object FloatField10: TFloatField
      FieldName = 'IDCUSTODIA'
      Origin = 'HISTCUSTODIA.IDCUSTODIA'
    end
    object FloatField38: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'HISTCUSTODIA.IDOPERACAOINVEST'
    end
    object FloatField39: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCUSTODIA.IDCARTEIRAINVEST'
    end
    object FloatField40: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCUSTODIA.IDINVESTIMENTO'
    end
    object FloatField41: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'HISTCUSTODIA.IDCUSTODIANTE'
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'DATAMOVCUSTOD'
      Origin = 'HISTCUSTODIA.DATAMOVCUSTOD'
    end
    object FloatField42: TFloatField
      FieldName = 'QTDEMOVCUSTOD'
      Origin = 'HISTCUSTODIA.QTDEMOVCUSTOD'
    end
    object FloatField43: TFloatField
      FieldName = 'SALDOLIBERADO'
      Origin = 'HISTCUSTODIA.SALDOLIBERADO'
    end
    object FloatField44: TFloatField
      FieldName = 'SALDOBLOQUEADO'
      Origin = 'HISTCUSTODIA.SALDOBLOQUEADO'
    end
    object StringField4: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = 'HISTCUSTODIA.FLGCALCSALDO'
      Size = 1
    end
    object StringField14: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCUSTODIA.IDLOTE'
      Size = 10
    end
    object StringField15: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'HISTCUSTODIA.TIPOCUSTODIA'
      Size = 1
    end
    object FloatField45: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'HISTCUSTODIA.IDMOTIVOBLOQUEIO'
    end
  end
  object qryDelHistCartInv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTCARTINV'
      'WHERE'
      '   IDHISTCARTINV = :IDHISTCARTINV')
    ValidateWithMask = True
    Left = 509
    Top = 406
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptUnknown
      end>
    object FloatField5: TFloatField
      FieldName = 'IDCUSTODIA'
      Origin = 'HISTCUSTODIA.IDCUSTODIA'
    end
    object FloatField30: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'HISTCUSTODIA.IDOPERACAOINVEST'
    end
    object FloatField31: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCUSTODIA.IDCARTEIRAINVEST'
    end
    object FloatField32: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCUSTODIA.IDINVESTIMENTO'
    end
    object FloatField33: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'HISTCUSTODIA.IDCUSTODIANTE'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DATAMOVCUSTOD'
      Origin = 'HISTCUSTODIA.DATAMOVCUSTOD'
    end
    object FloatField34: TFloatField
      FieldName = 'QTDEMOVCUSTOD'
      Origin = 'HISTCUSTODIA.QTDEMOVCUSTOD'
    end
    object FloatField35: TFloatField
      FieldName = 'SALDOLIBERADO'
      Origin = 'HISTCUSTODIA.SALDOLIBERADO'
    end
    object FloatField36: TFloatField
      FieldName = 'SALDOBLOQUEADO'
      Origin = 'HISTCUSTODIA.SALDOBLOQUEADO'
    end
    object StringField11: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = 'HISTCUSTODIA.FLGCALCSALDO'
      Size = 1
    end
    object StringField12: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCUSTODIA.IDLOTE'
      Size = 10
    end
    object StringField13: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'HISTCUSTODIA.TIPOCUSTODIA'
      Size = 1
    end
    object FloatField37: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'HISTCUSTODIA.IDMOTIVOBLOQUEIO'
    end
  end
  object qryDelHistCustodia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTCUSTODIA'
      'WHERE'
      '   IDOPERCUSTODIA= :IDOPERCUSTODIA')
    ValidateWithMask = True
    Left = 509
    Top = 422
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCUSTODIA'
        ParamType = ptUnknown
      end>
    object FloatField20: TFloatField
      FieldName = 'IDCUSTODIA'
      Origin = 'HISTCUSTODIA.IDCUSTODIA'
    end
    object FloatField21: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'HISTCUSTODIA.IDOPERACAOINVEST'
    end
    object FloatField22: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCUSTODIA.IDCARTEIRAINVEST'
    end
    object FloatField6: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCUSTODIA.IDINVESTIMENTO'
    end
    object FloatField7: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'HISTCUSTODIA.IDCUSTODIANTE'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATAMOVCUSTOD'
      Origin = 'HISTCUSTODIA.DATAMOVCUSTOD'
    end
    object FloatField8: TFloatField
      FieldName = 'QTDEMOVCUSTOD'
      Origin = 'HISTCUSTODIA.QTDEMOVCUSTOD'
    end
    object FloatField9: TFloatField
      FieldName = 'SALDOLIBERADO'
      Origin = 'HISTCUSTODIA.SALDOLIBERADO'
    end
    object FloatField11: TFloatField
      FieldName = 'SALDOBLOQUEADO'
      Origin = 'HISTCUSTODIA.SALDOBLOQUEADO'
    end
    object StringField8: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = 'HISTCUSTODIA.FLGCALCSALDO'
      Size = 1
    end
    object StringField9: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCUSTODIA.IDLOTE'
      Size = 10
    end
    object StringField10: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'HISTCUSTODIA.TIPOCUSTODIA'
      Size = 1
    end
    object FloatField12: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'HISTCUSTODIA.IDMOTIVOBLOQUEIO'
    end
  end
  object qryDelOperCustodia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM OPERCUSTODIA'
      'WHERE'
      '   IDOPERCUSTODIA = :IDOPERCUSTODIA    ')
    ValidateWithMask = True
    Left = 509
    Top = 414
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCUSTODIA'
        ParamType = ptUnknown
      end>
    object FloatField13: TFloatField
      FieldName = 'IDCUSTODIA'
      Origin = 'HISTCUSTODIA.IDCUSTODIA'
    end
    object FloatField14: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'HISTCUSTODIA.IDOPERACAOINVEST'
    end
    object FloatField15: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCUSTODIA.IDCARTEIRAINVEST'
    end
    object FloatField16: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCUSTODIA.IDINVESTIMENTO'
    end
    object FloatField17: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'HISTCUSTODIA.IDCUSTODIANTE'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAMOVCUSTOD'
      Origin = 'HISTCUSTODIA.DATAMOVCUSTOD'
    end
    object FloatField18: TFloatField
      FieldName = 'QTDEMOVCUSTOD'
      Origin = 'HISTCUSTODIA.QTDEMOVCUSTOD'
    end
    object FloatField19: TFloatField
      FieldName = 'SALDOLIBERADO'
      Origin = 'HISTCUSTODIA.SALDOLIBERADO'
    end
    object FloatField46: TFloatField
      FieldName = 'SALDOBLOQUEADO'
      Origin = 'HISTCUSTODIA.SALDOBLOQUEADO'
    end
    object StringField5: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = 'HISTCUSTODIA.FLGCALCSALDO'
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCUSTODIA.IDLOTE'
      Size = 10
    end
    object StringField7: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'HISTCUSTODIA.TIPOCUSTODIA'
      Size = 1
    end
    object FloatField47: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'HISTCUSTODIA.IDMOTIVOBLOQUEIO'
    end
  end
  object qryInvestBase: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OP.IDINVESTBASE, OP.VLRPRECOEX, OP.DTAVENCTO,'
      '   AC.QTDELOTE,'
      '   (OP.VLRPRECOEX/AC.QTDELOTE) AS PRECOPORLOTE'
      'FROM'
      '   OPCOES OP, ACOESXBOLSA AC'
      'WHERE'
      '   (OP.IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      '   (OP.IDBOLSAVALORES = AC.IDBOLSAVALORES) AND'
      '   (OP.IDINVESTIMENTO = AC.IDACAO)'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 425
    Top = 350
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object qryInvestBaseIDINVESTBASE: TFloatField
      FieldName = 'IDINVESTBASE'
      Origin = 'OPCOES.IDINVESTBASE'
    end
    object qryInvestBaseVLRPRECOEX: TFloatField
      FieldName = 'VLRPRECOEX'
      Origin = 'OPCOES.VLRPRECOEX'
    end
    object qryInvestBaseDTAVENCTO: TDateTimeField
      FieldName = 'DTAVENCTO'
      Origin = 'OPCOES.DTAVENCTO'
    end
    object qryInvestBaseQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
      Origin = 'ACOESXBOLSA.QTDELOTE'
    end
    object qryInvestBasePRECOPORLOTE: TFloatField
      FieldName = 'PRECOPORLOTE'
      Origin = 'OPCOES.VLRPRECOEX'
    end
  end
  object qryBuscaOrdemOpc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   DISTINCT IDINVESTIMENTO'
      'FROM '
      '   ORDMOVINV'
      'WHERE '
      '   IDLOTE = :IDLOTE')
    ValidateWithMask = True
    Left = 594
    Top = 89
    ParamData = <
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end>
  end
  object QryBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BOL.IDBOLETA, BOL.OBSERVACAO'
      ''
      'FROM BOLETA BOL'
      ''
      'WHERE BOL.IDBOLETA = :IDBOLETA')
    ValidateWithMask = True
    Left = 594
    Top = 179
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
    object QryBoletaIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Origin = 'BOLETA.IDBOLETA'
      Size = 30
    end
    object QryBoletaOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'BOLETA.OBSERVACAO'
      BlobType = ftMemo
      Size = 300
    end
  end
  object qryBuscaBoletaTRC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDOPERCUSTODIA, IDHISTCARTINVDEST, IDHISTCARTINVORIG, DATAMOV' +
        'CUSTOD'
      'FROM'
      '   OPERCUSTODIA'
      'WHERE'
      '   IDBOLETA = :IDBOLETA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 594
    Top = 135
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
    object qryBuscaBoletaTRCIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
      Origin = 'OPERCUSTODIA.IDOPERCUSTODIA'
    end
    object qryBuscaBoletaTRCIDHISTCARTINVDEST: TFloatField
      FieldName = 'IDHISTCARTINVDEST'
      Origin = 'OPERCUSTODIA.IDHISTCARTINVDEST'
    end
    object qryBuscaBoletaTRCIDHISTCARTINVORIG: TFloatField
      FieldName = 'IDHISTCARTINVORIG'
      Origin = 'OPERCUSTODIA.IDHISTCARTINVORIG'
    end
    object qryBuscaBoletaTRCDATAMOVCUSTOD: TDateTimeField
      FieldName = 'DATAMOVCUSTOD'
      Origin = 'OPERCUSTODIA.DATAMOVCUSTOD'
    end
  end
  object QryHistCartInvPend: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE HISTCARTINV SET CODDOCUMENTO = NULL'
      'WHERE '
      '      CODDOCUMENTO =:CODDOCUMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 135
    Top = 350
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT PLANO'
      'FROM LANCAMENTO'
      'WHERE PLNCODIGO = :PLNCODIGO')
    ValidateWithMask = True
    Left = 327
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptResult
      end>
    object qryBuscaPlanoPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'LANCAMENTO.PLANO'
    end
  end
  object QryBuscaTpOpOperInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT FLGCONTAINVEST'
      'FROM   OPERACAOINVEST OI, TIPOOPERACAO TP'
      'WHERE  OI.IDOPERACAOINVEST  = :IDOPERACAOINVEST AND'
      '        TP.IDTIPOOPERACAO   = OI.IDTIPOOPERACAO')
    ValidateWithMask = True
    Left = 51
    Top = 175
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptResult
      end>
  end
  object qrySaldoInvNullTotal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(H1.SALDOCOTASCARTINV) AS SALDOCOTASCARTINV,'
      '   SUM(H1.SALDOVLRCARTINV) AS SALDOVLRCARTINV,'
      '   SUM(H1.SALDOQTDEINVCART) AS SALDOQTDEINVCART,'
      '   SUM(H1.SALDOVLRINVCART) AS SALDOVLRINVCART,'
      '   SUM(H1.SALDOATU) AS SALDOATU,'
      '   SUM(H1.SALDOCAR) AS SALDOCAR,'
      '   SUM(H1.SALDOAQUI) AS SALDOAQUI,'
      '   SUM(H1.SALDOREND) AS SALDOREND,'
      '   SUM(H1.SALDOVARIACAO) AS SALDOVARIACAO,'
      '   SUM(H1.SALDOJUROS) AS SALDOJUROS,'
      '   SUM(H1.SALDOPREMIO) AS SALDOPREMIO,'
      '   SUM(H1.SALDOIRPROV) AS SALDOIRPROV,'
      '   SUM(H1.SALDOIRAPU) AS SALDOIRAPU,'
      '   SUM(H1.SALDOIOFPROV) AS SALDOIOFPROV,'
      '   SUM(H1.SALDOIOFAPU) AS SALDOIOFAPU,'
      '   SUM(H1.SALDOAGIO) AS SALDOAGIO,'
      '   SUM(H1.SALDOQTDECPMF) AS SALDOQTDECPMF'
      ''
      
        'FROM  HISTCARTINV H1, (SELECT IDTIPOOPERDIRDIV,IDTIPOOPERDIRJUR ' +
        'FROM PARAMINVEST) P1'
      ''
      
        'WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (IDPLANPREVCTBPATR = :IDP' +
        'LANPREVCTBPATR))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL) OR (IDCARTEIRAINVEST = :IDCAR' +
        'TEIRAINVEST))'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (IDINVESTIMENTO = :IDINVESTI' +
        'MENTO))'
      '  AND (H1.IDHISTCARTINV ='
      '          (SELECT MAX(H2.IDHISTCARTINV)'
      '           FROM   HISTCARTINV H2'
      
        '           WHERE    ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '             AND    ((:IDCARTEIRAINVEST IS NULL) OR (H2.IDCARTEI' +
        'RAINVEST = :IDCARTEIRAINVEST))'
      
        '             AND    ((:IDINVESTIMENTO IS NULL) OR (H2.IDINVESTIM' +
        'ENTO = :IDINVESTIMENTO))'
      '             AND   (H2.DATAMOVCARTINV ='
      '                     (SELECT MAX(H3.DATAMOVCARTINV)'
      '                      FROM HISTCARTINV H3'
      
        '                      WHERE   ((:IDPLANPREVCTBPATR IS NULL) OR (' +
        'H3.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                        AND   ((:IDCARTEIRAINVEST IS NULL) OR (H' +
        '3.IDCARTEIRAINVEST = :IDCARTEIRAINVEST))'
      
        '                        AND   ((:IDINVESTIMENTO IS NULL) OR (H3.' +
        'IDINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                        AND ((H3.DATAMOVCARTINV   < TO_DATE(:DAT' +
        'AMOV,'#39'DD/MM/YYYY'#39')) OR'
      
        '                            ((H3.DATAMOVCARTINV   = TO_DATE(:DAT' +
        'AMOV,'#39'DD/MM/YYYY'#39'))   AND'
      
        '                             (H3.IDHISTCARTINV    < :HISTORICO )' +
        '))'
      
        '                        AND ((H3.IDTIPOOPERACAO NOT IN (P1.IDTIP' +
        'OOPERDIRDIV,P1.IDTIPOOPERDIRJUR)) OR'
      '                             (H3.IDTIPOOPERACAO IS NULL))'
      '                        AND  (H3.IDCARTEIRAGERENC IS NULL)'
      '                      )'
      '                  )'
      
        '             AND ((H2.IDTIPOOPERACAO NOT IN (P1.IDTIPOOPERDIRDIV' +
        ',P1.IDTIPOOPERDIRJUR)) OR'
      '                  (H2.IDTIPOOPERACAO IS NULL))'
      '             AND  (H2.IDHISTCARTINV < :HISTORICO)'
      '             AND  (H2.IDCARTEIRAGERENC IS NULL)'
      '          )'
      '      )'
      '  AND (NVL(SALDOQTDEINVCART,0) <> 0)'
      '  AND     (IDCARTEIRAGERENC IS NULL)'
      ' ')
    ValidateWithMask = True
    Left = 233
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptResult
      end>
    object qrySaldoInvNullTotalSALDOCOTASCARTINV: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
    end
    object qrySaldoInvNullTotalSALDOVLRCARTINV: TFloatField
      FieldName = 'SALDOVLRCARTINV'
    end
    object qrySaldoInvNullTotalSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qrySaldoInvNullTotalSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
    end
    object qrySaldoInvNullTotalSALDOATU: TFloatField
      FieldName = 'SALDOATU'
    end
    object qrySaldoInvNullTotalSALDOCAR: TFloatField
      FieldName = 'SALDOCAR'
    end
    object qrySaldoInvNullTotalSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object qrySaldoInvNullTotalSALDOREND: TFloatField
      FieldName = 'SALDOREND'
    end
    object qrySaldoInvNullTotalSALDOVARIACAO: TFloatField
      FieldName = 'SALDOVARIACAO'
    end
    object qrySaldoInvNullTotalSALDOJUROS: TFloatField
      FieldName = 'SALDOJUROS'
    end
    object qrySaldoInvNullTotalSALDOPREMIO: TFloatField
      FieldName = 'SALDOPREMIO'
    end
    object qrySaldoInvNullTotalSALDOIRPROV: TFloatField
      FieldName = 'SALDOIRPROV'
    end
    object qrySaldoInvNullTotalSALDOIRAPU: TFloatField
      FieldName = 'SALDOIRAPU'
    end
    object qrySaldoInvNullTotalSALDOIOFPROV: TFloatField
      FieldName = 'SALDOIOFPROV'
    end
    object qrySaldoInvNullTotalSALDOIOFAPU: TFloatField
      FieldName = 'SALDOIOFAPU'
    end
    object qrySaldoInvNullTotalSALDOAGIO: TFloatField
      FieldName = 'SALDOAGIO'
    end
    object qrySaldoInvNullTotalSALDOQTDECPMF: TFloatField
      FieldName = 'SALDOQTDECPMF'
    end
  end
  object qryHistGrupamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHISTCARTINV'
      'FROM  HISTCARTINV'
      
        'WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (IDPLANPREVCTBPATR = :IDP' +
        'LANPREVCTBPATR))'
      '  AND (IDCARTEIRAINVEST = :IDCARTEIRAINVEST )'
      '  AND (IDCARTEIRAGERENC IS NULL)'
      '  AND (IDINVESTIMENTO   = :IDINVESTIMENTO)'
      '  AND (IDHISTCARTINV ='
      '          (SELECT MAX(H2.IDHISTCARTINV)'
      '           FROM HISTCARTINV H2'
      
        '           WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      '             AND (H2.IDCARTEIRAINVEST = :IDCARTEIRAINVEST )'
      '             AND (IDCARTEIRAGERENC IS NULL)'
      '             AND (H2.IDINVESTIMENTO   = :IDINVESTIMENTO )'
      '             AND (H2.DATAMOVCARTINV ='
      '                     (SELECT MAX(H3.DATAMOVCARTINV)'
      '                      FROM HISTCARTINV H3'
      
        '                      WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H3' +
        '.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                        AND (H3.IDCARTEIRAINVEST = :IDCARTEIRAIN' +
        'VEST )'
      '                        AND (IDCARTEIRAGERENC IS NULL)'
      
        '                        AND (H3.IDINVESTIMENTO   = :IDINVESTIMEN' +
        'TO )'
      
        '                        AND (( (H3.DATAMOVCARTINV = TO_DATE(:DAT' +
        'AMOV,'#39'DD/MM/YYYY'#39')) AND'
      
        '                               (H3.IDHISTCARTINV    < :HISTORICO' +
        ' )))'
      
        '                        AND ((H3.IDTIPOOPERACAO = :iTIPOOPER) OR' +
        ' (H3.IDTIPOOPERACAO = :iTIPOOPERNOVO))'
      '                     )'
      '                 )'
      '             AND (H2.IDHISTCARTINV < :HISTORICO)'
      
        '             AND ((H2.IDTIPOOPERACAO = :iTIPOOPER) OR (H2.IDTIPO' +
        'OPERACAO = :iTIPOOPERNOVO))'
      '          )'
      '      )'
      '  AND (NVL(SALDOQTDEINVCART,0) <> 0)'
      
        '  AND ((IDTIPOOPERACAO = :iTIPOOPER) OR (IDTIPOOPERACAO = :iTIPO' +
        'OPERNOVO))'
      'ORDER BY DATAMOVCARTINV DESC, IDHISTCARTINV DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 135
    Top = 393
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPERNOVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPERNOVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPERNOVO'
        ParamType = ptUnknown
      end>
    object FloatField48: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
  end
  object qryHistGrupamentoGer: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTCARTINV'
      'FROM  HISTCARTINV'
      
        'WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (IDPLANPREVCTBPATR = :IDP' +
        'LANPREVCTBPATR))'
      '  AND (IDCARTEIRAINVEST = :IDCARTEIRAINVEST )'
      '  AND (IDCARTEIRAGERENC = :IDCARTEIRAGERENC)'
      '  AND (IDINVESTIMENTO   = :IDINVESTIMENTO)'
      '  AND (IDHISTCARTINV ='
      '          (SELECT MAX(H2.IDHISTCARTINV)'
      '           FROM HISTCARTINV H2'
      
        '           WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      '             AND (H2.IDCARTEIRAINVEST = :IDCARTEIRAINVEST )'
      '             AND (IDCARTEIRAGERENC = :IDCARTEIRAGERENC)'
      '             AND (H2.IDINVESTIMENTO   = :IDINVESTIMENTO )'
      '             AND (H2.DATAMOVCARTINV ='
      '                     (SELECT MAX(H3.DATAMOVCARTINV)'
      '                      FROM HISTCARTINV H3'
      
        '                      WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H3' +
        '.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                        AND (H3.IDCARTEIRAINVEST = :IDCARTEIRAIN' +
        'VEST )'
      
        '                        AND (IDCARTEIRAGERENC = :IDCARTEIRAGEREN' +
        'C)'
      
        '                        AND (H3.IDINVESTIMENTO   = :IDINVESTIMEN' +
        'TO )'
      
        '                        AND (( (H3.DATAMOVCARTINV = TO_DATE(:DAT' +
        'AMOV,'#39'DD/MM/YYYY'#39')) AND'
      
        '                               (H3.IDHISTCARTINV    < :HISTORICO' +
        ' )))'
      
        '                        AND (H3.IDTIPOOPERACAO IN (:iTIPOOPER,:i' +
        'TIPOOPERNOVO))'
      '                     )'
      '                 )'
      '             AND (H2.IDHISTCARTINV < :HISTORICO)'
      
        '             AND (H2.IDTIPOOPERACAO IN (:iTIPOOPER,:iTIPOOPERNOV' +
        'O))'
      '          )'
      '      )'
      '  AND (NVL(SALDOQTDEINVCART,0) <> 0)'
      '  AND (IDTIPOOPERACAO IN (:iTIPOOPER,:iTIPOOPERNOVO))'
      'ORDER BY DATAMOVCARTINV DESC, IDHISTCARTINV DESC'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 594
    Top = 220
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPERNOVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPERNOVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPERNOVO'
        ParamType = ptUnknown
      end>
    object FloatField67: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
  end
  object qrySaldoInvestimentoTNull: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H1.IDHISTCARTINV, H1.IDCARTEIRAINVEST, H1.DATAMOVCARTINV,'
      
        '   H1.SALDOCOTASCARTINV, H1.SALDOVLRCARTINV, H1.SALDOQTDEINVCART' +
        ', H1.SALDOVLRINVCART, H1.SALDOATU,'
      
        '   H1.SALDOCAR, H1.SALDOAQUI, H1.SALDOREND, H1.SALDOVARIACAO, H1' +
        '.SALDOJUROS, H1.SALDOPREMIO,'
      
        '   H1.SALDOIRPROV, H1.SALDOIRAPU, H1.SALDOIOFPROV, H1.SALDOIOFAP' +
        'U, H1.SALDOAGIO, H1.SALDOQTDECPMF,'
      '   H1.SALDOPROVPERDA'
      ''
      
        'FROM HISTCARTINV H1, (SELECT IDTIPOOPERDIRDIV,IDTIPOOPERDIRJUR,I' +
        'DTIPOOPERDIRMUL FROM PARAMINVEST) P1'
      ''
      
        'WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H1.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (H1.IDCARTEIRAINVEST = :IDCARTEIRAINVEST )'
      '  AND (H1.IDCARTEIRAGERENC IS NULL)'
      '  AND (H1.IDINVESTIMENTO   = :IDINVESTIMENTO)'
      
        '  AND (((:IDLOTE IS NOT NULL) AND (H1.IDLOTE = :IDLOTE) ) OR ((:' +
        'IDLOTE IS NULL) AND (H1.IDLOTE IS NULL)))'
      '  AND (H1.IDHISTCARTINV ='
      '          (SELECT MAX(H2.IDHISTCARTINV)'
      '           FROM HISTCARTINV H2'
      
        '           WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      '             AND (H2.IDCARTEIRAINVEST = :IDCARTEIRAINVEST )'
      '             AND (H2.IDCARTEIRAGERENC IS NULL)'
      '             AND (H2.IDINVESTIMENTO   = :IDINVESTIMENTO )'
      
        '             AND (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE = H1.I' +
        'DLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL)))'
      '             AND (H2.DATAMOVCARTINV ='
      '                     (SELECT MAX(H3.DATAMOVCARTINV)'
      '                      FROM HISTCARTINV H3'
      
        '                      WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H3' +
        '.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                        AND (H3.IDCARTEIRAINVEST = :IDCARTEIRAIN' +
        'VEST )'
      '                        AND (H3.IDCARTEIRAGERENC IS NULL)'
      
        '                        AND (H3.IDINVESTIMENTO   = :IDINVESTIMEN' +
        'TO )'
      
        '                        AND ( ( (H2.IDLOTE IS NOT NULL) AND (H3.' +
        'IDLOTE = H2.IDLOTE) ) OR'
      
        '                              ( (H2.IDLOTE IS NULL) AND (H3.IDLO' +
        'TE IS NULL) ))'
      
        '                        AND ( (H3.DATAMOVCARTINV   < TO_DATE(:DA' +
        'TAMOV,'#39'DD/MM/YYYY'#39') ) OR'
      
        '                              ( (H3.DATAMOVCARTINV = TO_DATE(:DA' +
        'TAMOV,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                (H3.IDHISTCARTINV    < :HISTORIC' +
        'O )))'
      
        '                        AND ((H3.IDTIPOOPERACAO NOT IN (NVL(P1.I' +
        'DTIPOOPERDIRDIV,0), (NVL(P1.IDTIPOOPERDIRDIV,0) + 10000),'
      
        '                                                        NVL(P1.I' +
        'DTIPOOPERDIRJUR,0), (NVL(P1.IDTIPOOPERDIRJUR,0) + 10000),'
      
        '                                                        NVL(P1.I' +
        'DTIPOOPERDIRMUL,0), (NVL(P1.IDTIPOOPERDIRMUL,0) + 10000),'
      
        '                                                        -70, -10' +
        '070)) OR'
      '                             (H3.IDTIPOOPERACAO IS NULL))'
      '                     )'
      '                 )'
      
        '             AND ((H2.IDTIPOOPERACAO NOT IN (NVL(P1.IDTIPOOPERDI' +
        'RDIV,0), (NVL(P1.IDTIPOOPERDIRDIV,0) + 10000),'
      
        '                                             NVL(P1.IDTIPOOPERDI' +
        'RJUR,0), (NVL(P1.IDTIPOOPERDIRJUR,0) + 10000),'
      
        '                                             NVL(P1.IDTIPOOPERDI' +
        'RMUL,0), (NVL(P1.IDTIPOOPERDIRMUL,0) + 10000),'
      '                                             -70, -10070)) OR'
      '                  (H2.IDTIPOOPERACAO IS NULL))'
      '             AND (H2.IDHISTCARTINV < :HISTORICO)'
      '          )'
      '      )'
      '  AND (NVL(SALDOQTDEINVCART,0) <> 0)'
      ''
      'ORDER BY DATAMOVCARTINV DESC, IDHISTCARTINV DESC'
      ' ')
    ValidateWithMask = True
    Left = 51
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
    object qrySaldoInvestimentoTNullIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qrySaldoInvestimentoTNullIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qrySaldoInvestimentoTNullDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qrySaldoInvestimentoTNullSALDOCOTASCARTINV: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
    end
    object qrySaldoInvestimentoTNullSALDOVLRCARTINV: TFloatField
      FieldName = 'SALDOVLRCARTINV'
    end
    object qrySaldoInvestimentoTNullSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qrySaldoInvestimentoTNullSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
    end
    object qrySaldoInvestimentoTNullSALDOATU: TFloatField
      FieldName = 'SALDOATU'
    end
    object qrySaldoInvestimentoTNullSALDOCAR: TFloatField
      FieldName = 'SALDOCAR'
    end
    object qrySaldoInvestimentoTNullSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object qrySaldoInvestimentoTNullSALDOREND: TFloatField
      FieldName = 'SALDOREND'
    end
    object qrySaldoInvestimentoTNullSALDOVARIACAO: TFloatField
      FieldName = 'SALDOVARIACAO'
    end
    object qrySaldoInvestimentoTNullSALDOJUROS: TFloatField
      FieldName = 'SALDOJUROS'
    end
    object qrySaldoInvestimentoTNullSALDOPREMIO: TFloatField
      FieldName = 'SALDOPREMIO'
    end
    object qrySaldoInvestimentoTNullSALDOIRPROV: TFloatField
      FieldName = 'SALDOIRPROV'
    end
    object qrySaldoInvestimentoTNullSALDOIRAPU: TFloatField
      FieldName = 'SALDOIRAPU'
    end
    object qrySaldoInvestimentoTNullSALDOIOFPROV: TFloatField
      FieldName = 'SALDOIOFPROV'
    end
    object qrySaldoInvestimentoTNullSALDOIOFAPU: TFloatField
      FieldName = 'SALDOIOFAPU'
    end
    object qrySaldoInvestimentoTNullSALDOAGIO: TFloatField
      FieldName = 'SALDOAGIO'
    end
    object qrySaldoInvestimentoTNullSALDOQTDECPMF: TFloatField
      FieldName = 'SALDOQTDECPMF'
    end
    object qrySaldoInvestimentoTNullSALDOPROVPERDA: TFloatField
      FieldName = 'SALDOPROVPERDA'
    end
  end
  object qrySaldoInvestimentoCartGer: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H1.IDHISTCARTINV, H1.IDCARTEIRAINVEST, H1.DATAMOVCARTINV,'
      
        '   H1.SALDOCOTASCARTINV, H1.SALDOVLRCARTINV, H1.SALDOQTDEINVCART' +
        ', H1.SALDOVLRINVCART, H1.SALDOATU,'
      
        '   H1.SALDOCAR, H1.SALDOAQUI, H1.SALDOREND, H1.SALDOVARIACAO, H1' +
        '.SALDOJUROS, H1.SALDOPREMIO,'
      
        '   H1.SALDOIRPROV, H1.SALDOIRAPU, H1.SALDOIOFPROV, H1.SALDOIOFAP' +
        'U, H1.SALDOAGIO, H1.SALDOQTDECPMF,'
      '   H1.SALDOPROVPERDA'
      ''
      
        'FROM HISTCARTINV H1, (SELECT IDTIPOOPERDIRDIV,IDTIPOOPERDIRJUR,I' +
        'DTIPOOPERDIRMUL FROM PARAMINVEST) P1'
      
        'WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H1.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (H1.IDCARTEIRAINVEST = :IDCARTEIRAINVEST)'
      '  AND (H1.IDCARTEIRAGERENC = :IDCARTEIRAGERENC)'
      '  AND (H1.IDINVESTIMENTO   = :IDINVESTIMENTO)'
      '  AND (H1.IDHISTCARTINV    ='
      '          (SELECT MAX(H2.IDHISTCARTINV)'
      '           FROM HISTCARTINV H2'
      
        '           WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      '             AND (H2.IDCARTEIRAINVEST  = :IDCARTEIRAINVEST )'
      '             AND (H2.IDCARTEIRAGERENC  = :IDCARTEIRAGERENC)'
      '             AND (H2.IDINVESTIMENTO    = :IDINVESTIMENTO )'
      '             AND (H2.DATAMOVCARTINV    ='
      '                     (SELECT MAX(H3.DATAMOVCARTINV)'
      '                      FROM HISTCARTINV H3'
      
        '                      WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H2' +
        '.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                        AND (H3.IDCARTEIRAINVEST = :IDCARTEIRAIN' +
        'VEST )'
      
        '                        AND (H3.IDCARTEIRAGERENC = :IDCARTEIRAGE' +
        'RENC)'
      
        '                        AND (H3.IDINVESTIMENTO   = :IDINVESTIMEN' +
        'TO )'
      
        '                        AND ( (H3.DATAMOVCARTINV   < TO_DATE(:DA' +
        'TAMOV,'#39'DD/MM/YYYY'#39') ) OR'
      
        '                              ( (H3.DATAMOVCARTINV   = TO_DATE(:' +
        'DATAMOV,'#39'DD/MM/YYYY'#39')) AND'
      
        '                                (H3.IDHISTCARTINV    < :HISTORIC' +
        'O )))'
      
        '                        AND ((H3.IDTIPOOPERACAO NOT IN (NVL(P1.I' +
        'DTIPOOPERDIRDIV,0), (NVL(P1.IDTIPOOPERDIRDIV,0) + 10000),'
      
        '                                                        NVL(P1.I' +
        'DTIPOOPERDIRJUR,0), (NVL(P1.IDTIPOOPERDIRJUR,0) + 10000),'
      
        '                                                        NVL(P1.I' +
        'DTIPOOPERDIRMUL,0), (NVL(P1.IDTIPOOPERDIRMUL,0) + 10000),'
      
        '                                                        -70, -10' +
        '070)) OR'
      '                             (H3.IDTIPOOPERACAO IS NULL))'
      '                     )'
      '                 )'
      
        '             AND ((H2.IDTIPOOPERACAO NOT IN (NVL(P1.IDTIPOOPERDI' +
        'RDIV,0), (NVL(P1.IDTIPOOPERDIRDIV,0) + 10000),'
      
        '                                             NVL(P1.IDTIPOOPERDI' +
        'RJUR,0), (NVL(P1.IDTIPOOPERDIRJUR,0) + 10000),'
      
        '                                             NVL(P1.IDTIPOOPERDI' +
        'RMUL,0), (NVL(P1.IDTIPOOPERDIRMUL,0) + 10000),'
      '                                             -70, -10070)) OR'
      '                  (H2.IDTIPOOPERACAO IS NULL))'
      '             AND (H2.IDHISTCARTINV     < :HISTORICO)'
      '          )'
      '      )'
      '  AND (NVL(SALDOQTDEINVCART,0) <> 0 )'
      ''
      'ORDER BY DATAMOVCARTINV DESC, IDHISTCARTINV DESC'
      ' ')
    ValidateWithMask = True
    Left = 135
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
    object qrySaldoInvestimentoCartGerIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qrySaldoInvestimentoCartGerIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qrySaldoInvestimentoCartGerDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qrySaldoInvestimentoCartGerSALDOCOTASCARTINV: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
    end
    object qrySaldoInvestimentoCartGerSALDOVLRCARTINV: TFloatField
      FieldName = 'SALDOVLRCARTINV'
    end
    object qrySaldoInvestimentoCartGerSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qrySaldoInvestimentoCartGerSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
    end
    object qrySaldoInvestimentoCartGerSALDOATU: TFloatField
      FieldName = 'SALDOATU'
    end
    object qrySaldoInvestimentoCartGerSALDOCAR: TFloatField
      FieldName = 'SALDOCAR'
    end
    object qrySaldoInvestimentoCartGerSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object qrySaldoInvestimentoCartGerSALDOREND: TFloatField
      FieldName = 'SALDOREND'
    end
    object qrySaldoInvestimentoCartGerSALDOVARIACAO: TFloatField
      FieldName = 'SALDOVARIACAO'
    end
    object qrySaldoInvestimentoCartGerSALDOJUROS: TFloatField
      FieldName = 'SALDOJUROS'
    end
    object qrySaldoInvestimentoCartGerSALDOPREMIO: TFloatField
      FieldName = 'SALDOPREMIO'
    end
    object qrySaldoInvestimentoCartGerSALDOIRPROV: TFloatField
      FieldName = 'SALDOIRPROV'
    end
    object qrySaldoInvestimentoCartGerSALDOIRAPU: TFloatField
      FieldName = 'SALDOIRAPU'
    end
    object qrySaldoInvestimentoCartGerSALDOIOFPROV: TFloatField
      FieldName = 'SALDOIOFPROV'
    end
    object qrySaldoInvestimentoCartGerSALDOIOFAPU: TFloatField
      FieldName = 'SALDOIOFAPU'
    end
    object qrySaldoInvestimentoCartGerSALDOAGIO: TFloatField
      FieldName = 'SALDOAGIO'
    end
    object qrySaldoInvestimentoCartGerSALDOQTDECPMF: TFloatField
      FieldName = 'SALDOQTDECPMF'
    end
    object qrySaldoInvestimentoCartGerSALDOPROVPERDA: TFloatField
      FieldName = 'SALDOPROVPERDA'
    end
  end
  object qryDelOperacaoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM OPERACAOINVEST'
      'WHERE'
      '   IDOPERCUSTODIA = :IDOPERCUSTODIA    '
      ' ')
    ValidateWithMask = True
    Left = 589
    Top = 414
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCUSTODIA'
        ParamType = ptUnknown
      end>
    object FloatField49: TFloatField
      FieldName = 'IDCUSTODIA'
      Origin = 'HISTCUSTODIA.IDCUSTODIA'
    end
    object FloatField50: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'HISTCUSTODIA.IDOPERACAOINVEST'
    end
    object FloatField51: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCUSTODIA.IDCARTEIRAINVEST'
    end
    object FloatField52: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCUSTODIA.IDINVESTIMENTO'
    end
    object FloatField53: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'HISTCUSTODIA.IDCUSTODIANTE'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'DATAMOVCUSTOD'
      Origin = 'HISTCUSTODIA.DATAMOVCUSTOD'
    end
    object FloatField54: TFloatField
      FieldName = 'QTDEMOVCUSTOD'
      Origin = 'HISTCUSTODIA.QTDEMOVCUSTOD'
    end
    object FloatField55: TFloatField
      FieldName = 'SALDOLIBERADO'
      Origin = 'HISTCUSTODIA.SALDOLIBERADO'
    end
    object FloatField56: TFloatField
      FieldName = 'SALDOBLOQUEADO'
      Origin = 'HISTCUSTODIA.SALDOBLOQUEADO'
    end
    object StringField2: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = 'HISTCUSTODIA.FLGCALCSALDO'
      Size = 1
    end
    object StringField3: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCUSTODIA.IDLOTE'
      Size = 10
    end
    object StringField16: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'HISTCUSTODIA.TIPOCUSTODIA'
      Size = 1
    end
    object FloatField57: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'HISTCUSTODIA.IDMOTIVOBLOQUEIO'
    end
  end
  object qryDocumentoNull: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE DOCUMENTO SET'
      '       IDPESSOA            = NULL,'
      '       CODFORMA            = NULL,'
      '       CODPORTFORMA        = NULL,'
      '       INDICECORRECAO      = NULL,'
      '       CODSUBCONTA         = NULL,'
      '       PLANO               = NULL,'
      '       PLACONTA            = NULL,'
      '       MOECODIGO           = NULL,'
      '       IDEMPRESA           = NULL,'
      '       CODCENTROCUSTO      = NULL,'
      '       IDFORCLI            = NULL,'
      '       IDMODULO            = NULL,'
      '       CODTIPDOC           = NULL,'
      '       RECPAG              = NULL,'
      '       NODOCUMENTO         = NULL,'
      '       COMPLDOCUMENTO      = NULL,'
      '       DATAEMISSAO         = NULL,'
      '       DATAVENCTO          = NULL,'
      '       DATAPROGRAMADA      = NULL,'
      '       STATUS              = NULL,'
      '       NUMFATURA           = NULL,'
      '       OPERACAO            = NULL,'
      '       IDUSUARIOINCLUSAO   = NULL,'
      '       NUMSLIP             = NULL,'
      '       EMISBLOQ            = NULL,'
      '       DATALIMITE          = NULL,'
      '       VALORDESCONTO       = NULL,'
      '       NOSSONUMERO         = NULL,'
      '       VALORJUROS          = NULL,'
      '       LOTETRANSMISSAO     = NULL,'
      '       CONTROLEREMESSA     = NULL,'
      '       DATAREMESSA         = NULL,'
      '       VLRMULTA            = NULL,'
      '       CODGRUPOCNAB        = NULL,'
      '       NUMAPGR             = NULL,'
      '       NUMLEITCODBARRAS    = NULL,'
      '       NUMDIGCODBARRAS     = NULL,'
      '       FLGEMITELANCBAIX    = NULL,'
      '       DATACORRECAO        = NULL,'
      '       PERCJUROSATUARIAL   = NULL,'
      '       PERCJUROSSIMPLES    = NULL,'
      '       TRGDTINCLUSAO       = NULL,'
      '       TRGUSERINCLUSAO     = NULL,'
      '       UNIDNEGOC           = NULL,'
      '       REFERENCIA          = NULL,'
      '       OBS                 = NULL,'
      '       FLGCONFIRMARECPAG   = NULL,'
      '       IDCBANCARIA         = NULL,'
      '       NUMCPBAIXA          = NULL,'
      '       GRUPODOC            = NULL,'
      '       FLGNAOCONCILIADO    = NULL,'
      '       CODGERADORINSS      = NULL,'
      '       FLGTIPODOCUMENTO    = NULL,'
      '       DATADISPONIB        = NULL,'
      '       IDSEGREGACRITER     = NULL,'
      '       IDPROCESSO          = NULL,'
      '       FLGCONTAINVEST      = NULL,'
      '       FLGIMPORTADO        = NULL,'
      '       PLACONTAANT         = NULL'
      'WHERE CODDOCUMENTO =:CODDOCUMENTO'
      ' ')
    ValidateWithMask = True
    Left = 327
    Top = 442
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryHistDesdobramento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHISTCARTINV'
      'FROM  HISTCARTINV'
      
        'WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (IDPLANPREVCTBPATR = :IDP' +
        'LANPREVCTBPATR))'
      '  AND (IDCARTEIRAINVEST = :IDCARTEIRAINVEST )'
      '  AND (IDCARTEIRAGERENC IS NULL)'
      '  AND (IDINVESTIMENTO   = :IDINVESTIMENTO)'
      '  AND (IDHISTCARTINV ='
      '          (SELECT MAX(H2.IDHISTCARTINV)'
      '           FROM HISTCARTINV H2'
      
        '           WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      '             AND (H2.IDCARTEIRAINVEST = :IDCARTEIRAINVEST )'
      '             AND (IDCARTEIRAGERENC IS NULL)'
      '             AND (H2.IDINVESTIMENTO   = :IDINVESTIMENTO )'
      '             AND (H2.DATAMOVCARTINV ='
      '                     (SELECT MAX(H3.DATAMOVCARTINV)'
      '                      FROM HISTCARTINV H3'
      
        '                      WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (H3' +
        '.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                        AND (H3.IDCARTEIRAINVEST = :IDCARTEIRAIN' +
        'VEST )'
      '                        AND (IDCARTEIRAGERENC IS NULL)'
      
        '                        AND (H3.IDINVESTIMENTO   = :IDINVESTIMEN' +
        'TO )'
      
        '                        AND (( (H3.DATAMOVCARTINV = TO_DATE(:DAT' +
        'AMOV,'#39'DD/MM/YYYY'#39')) AND'
      
        '                               (H3.IDHISTCARTINV    < :HISTORICO' +
        ' )))'
      
        '                        AND ((H3.IDTIPOOPERACAO = :iTIPOOPER) OR' +
        ' (H3.IDTIPOOPERACAO = :iTIPOOPERNOVO))'
      '                     )'
      '                 )'
      '             AND (H2.IDHISTCARTINV < :HISTORICO)'
      
        '             AND ((H2.IDTIPOOPERACAO = :iTIPOOPER) OR (H2.IDTIPO' +
        'OPERACAO = :iTIPOOPERNOVO))'
      '          )'
      '      )'
      '  AND (NVL(SALDOQTDEINVCART,0) <> 0)'
      
        '  AND ((IDTIPOOPERACAO = :iTIPOOPER) OR (IDTIPOOPERACAO = :iTIPO' +
        'OPERNOVO))'
      'ORDER BY DATAMOVCARTINV DESC, IDHISTCARTINV DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 423
    Top = 441
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HISTORICO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPERNOVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HISTORICO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPERNOVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'iTIPOOPERNOVO'
        ParamType = ptInput
      end>
    object qryHistDesdobramentoIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
  end
end
