object dtmOperacaoInvest: TdtmOperacaoInvest
  OldCreateOrder = True
  OnDestroy = dtmOperacaoInvestDestroy
  Left = 196
  Top = 148
  Height = 381
  Width = 521
  object qrySaldoCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTCARTINV,'
      '   DATAMOVCARTINV, IDCARTEIRAINVEST, SALDOCOTASCARTINV,'
      '   SALDOVLRCARTINV, SALDOQTDEINVCART, SALDOVLRINVCART'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   (IDCARTEIRAINVEST = :IDCARTEIRA)'
      '   AND ( (DATAMOVCARTINV < :DATAMOV) OR'
      '              ((DATAMOVCARTINV = :DATAMOV)  AND'
      '               (IDHISTCARTINV <:IDHISTORICO)) )'
      '   AND (SALDOVLRCARTINV IS NOT NULL)'
      'ORDER BY'
      '   DATAMOVCARTINV DESC, IDHISTCARTINV DESC')
    ValidateWithMask = True
    Left = 312
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
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
        Name = 'IDHISTORICO'
        ParamType = ptUnknown
      end>
    object qrySaldoCarteiraDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Origin = '"CM.HISTCARTINV".DATAMOVCARTINV'
    end
    object qrySaldoCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = '"CM.HISTCARTINV".IDCARTEIRAINVEST'
    end
    object qrySaldoCarteiraSALDOCOTASCARTINV: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
      Origin = '"CM.HISTCARTINV".SALDOCOTASCARTINV'
    end
    object qrySaldoCarteiraSALDOVLRCARTINV: TFloatField
      FieldName = 'SALDOVLRCARTINV'
      Origin = '"CM.HISTCARTINV".SALDOVLRCARTINV'
    end
    object qrySaldoCarteiraSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
      Origin = '"CM.HISTCARTINV".SALDOQTDEINVCART'
    end
    object qrySaldoCarteiraSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
      Origin = '"CM.HISTCARTINV".SALDOVLRINVCART'
    end
    object qrySaldoCarteiraIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
  end
  object qryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FLGGERACONTAB, FLGGERACAPCAR, CODTIPDOC,'
      '   RECPAG   '
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) ')
    ValidateWithMask = True
    Left = 192
    Top = 208
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
  end
  object qryLancaDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 192
    Top = 280
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 192
    Top = 264
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
    Left = 192
    Top = 192
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
    Left = 192
    Top = 8
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
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTCARTINV, DATAMOVCARTINV, NATURMOVCARTINV, '
      '   IDCARTEIRAINVEST, IDINVESTIMENTO, IDLOTE,  FLGCALCSALDO'
      'FROM'
      '   CM.HISTCARTINV'
      'WHERE'
      
        '   ( (FLGCALCSALDO = '#39'1'#39')  OR (FLGCALCSALDO = '#39'3'#39')  OR (FLGCALCS' +
        'ALDO = '#39'4'#39') )'
      'ORDER BY'
      '   DATAMOVCARTINV, IDHISTCARTINV'
      '')
    ValidateWithMask = True
    Left = 440
    Top = 234
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
  end
  object qryAtualizaSaldoC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  HC.IDHISTCARTINV, HC.IDINVESTIMENTO, HC.IDLOTE, HC.NATURMOVOPE' +
        'R,'
      
        '  HC.IDOPERACAOINVEST, HC.SALDOCOTASCARTINV, HC.SALDOVLRCARTINV,' +
        ' '
      '  HC.VLRMOVCARTINV, HC.COTASMOVCARTINV, HC.NATURMOVCARTINV,'
      '  HC.IDDESPOPERINVEST, HC.FLGCALCSALDO,  HC.TIPMOVCARTINV,  '
      '  HC.QTDEMOVINVCART, HC.DATAMOVCARTINV, HC.IDCARTEIRAINVEST,'
      '  DO.IDTIPOOPERACAO,  DO.FLGCALCDIARIO'
      'FROM'
      '   HISTCARTINV HC, DESPOPERINVEST DO'
      'WHERE'
      '   (HC.IDCARTEIRAINVEST =:IDCARTEIRA)'
      '   AND ( (HC.DATAMOVCARTINV > :DATAMOV) OR'
      '              ((HC.DATAMOVCARTINV = :DATAMOV)  AND'
      '               (HC.IDHISTCARTINV >=:IDHISTORICO)) ) AND'
      '  (HC.IDDESPOPERINVEST = DO.IDDESPOPERINVEST(+))'
      'ORDER BY'
      '   DATAMOVCARTINV, IDHISTCARTINV'
      '')
    UpdateObject = updAtualizaSaldoC
    ValidateWithMask = True
    Left = 432
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
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
        Name = 'IDHISTORICO'
        ParamType = ptUnknown
      end>
    object qryAtualizaSaldoCIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'HISTCARTINV.IDOPERACAOINVEST'
    end
    object qryAtualizaSaldoCSALDOCOTASCARTINV: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
      Origin = 'HISTCARTINV.SALDOCOTASCARTINV'
    end
    object qryAtualizaSaldoCSALDOVLRCARTINV: TFloatField
      FieldName = 'SALDOVLRCARTINV'
      Origin = 'HISTCARTINV.SALDOVLRCARTINV'
    end
    object qryAtualizaSaldoCVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
      Origin = 'HISTCARTINV.VLRMOVCARTINV'
    end
    object qryAtualizaSaldoCCOTASMOVCARTINV: TFloatField
      FieldName = 'COTASMOVCARTINV'
      Origin = 'HISTCARTINV.COTASMOVCARTINV'
    end
    object qryAtualizaSaldoCNATURMOVCARTINV: TStringField
      FieldName = 'NATURMOVCARTINV'
      Size = 1
    end
    object qryAtualizaSaldoCIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryAtualizaSaldoCFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Size = 1
    end
    object qryAtualizaSaldoCIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
      Origin = 'HISTCARTINV.IDDESPOPERINVEST'
    end
    object qryAtualizaSaldoCIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCARTINV.IDINVESTIMENTO'
    end
    object qryAtualizaSaldoCIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCARTINV.IDLOTE'
      Size = 10
    end
    object qryAtualizaSaldoCIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryAtualizaSaldoCFLGCALCDIARIO: TFloatField
      FieldName = 'FLGCALCDIARIO'
    end
    object qryAtualizaSaldoCNATURMOVOPER: TStringField
      FieldName = 'NATURMOVOPER'
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
  end
  object updAtualizaSaldoC: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  IDHISTCARTINV = :IDHISTCARTINV,'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  SALDOCOTASCARTINV = :SALDOCOTASCARTINV,'
      '  SALDOVLRCARTINV = :SALDOVLRCARTINV,'
      '  VLRMOVCARTINV = :VLRMOVCARTINV,'
      '  COTASMOVCARTINV = :COTASMOVCARTINV,'
      '  NATURMOVCARTINV = :NATURMOVCARTINV,'
      '  FLGCALCSALDO = :FLGCALCSALDO'
      'where'
      '  IDHISTCARTINV = :OLD_IDHISTCARTINV')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (IDHISTCARTINV, IDOPERACAOINVEST, SALDOCOTASCARTINV, SALDOVLRC' +
        'ARTINV, '
      
        '   VLRMOVCARTINV, COTASMOVCARTINV, NATURMOVCARTINV, FLGCALCSALDO' +
        ')'
      'values'
      
        '  (:IDHISTCARTINV, :IDOPERACAOINVEST, :SALDOCOTASCARTINV, :SALDO' +
        'VLRCARTINV, '
      
        '   :VLRMOVCARTINV, :COTASMOVCARTINV, :NATURMOVCARTINV, :FLGCALCS' +
        'ALDO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDHISTCARTINV = :OLD_IDHISTCARTINV')
    Left = 432
    Top = 8
  end
  object qryFlgAtualSaldo2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTCARTINV, DATAMOVCARTINV,  IDLOTE,'
      '   IDCARTEIRAINVEST, IDINVESTIMENTO, FLGCALCSALDO'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   ( (FLGCALCSALDO = '#39'2'#39') OR (FLGCALCSALDO = '#39'4'#39') )'
      'ORDER BY'
      '   DATAMOVCARTINV, IDHISTCARTINV'
      '')
    ValidateWithMask = True
    Left = 440
    Top = 218
    object FloatField1: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = 'HISTCARTINV.IDHISTCARTINV'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Origin = 'HISTCARTINV.DATAMOVCARTINV'
    end
    object FloatField2: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCARTINV.IDCARTEIRAINVEST'
    end
    object FloatField3: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCARTINV.IDINVESTIMENTO'
    end
    object StringField1: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = 'HISTCARTINV.FLGCALCSALDO'
      Size = 1
    end
    object qryFlgAtualSaldo2IDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
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
    Left = 192
    Top = 80
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
    Left = 192
    Top = 64
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
      '  ( RTRIM(PLACONTA) =:CONTA ) AND'
      '  ( PLATIPO = '#39'A'#39')'
      '')
    ValidateWithMask = True
    Left = 192
    Top = 137
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
  object qryPadraoAtuTTCI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO,'
      '   CODTIPTITULO, IDPESSOA, IDTIPODESPINVEST, RECPAG,'
      '   IDFORCLI, CODTIPRECDES, IDCARTEIRAINVEST, CODSUBCONTAC,'
      '   CODSUBCONTAD, FLGPAGRECNAO, HISTLANCINVEST, PLANO,'
      '   CONTADOPERFIN, CONTACOPERFIN, CENCUSTCINVEST,'
      '   CENCUSTDINVEST, CODCENTRORESPON, UNIDNEGOC,'
      '   TIPMOVCARTINV, TIPLANCINVEST, IDEMPRESA'
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( TIPMOVCARTINV =:TIPOMOV ) AND'
      '   ( IDEMPRESA =:EMPRESAPROP ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( CODTIPTITULO =:TIPOTITULO ) ')
    ValidateWithMask = True
    Left = 440
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOTITULO'
        ParamType = ptUnknown
      end>
    object qryPadraoAtuTTCIIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoAtuTTCIIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoAtuTTCIIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoAtuTTCICODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoAtuTTCIIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoAtuTTCIIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoAtuTTCIRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoAtuTTCIIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoAtuTTCICODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoAtuTTCIIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoAtuTTCICODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoAtuTTCICODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoAtuTTCIFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoAtuTTCIHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoAtuTTCIPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoAtuTTCICONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoAtuTTCICONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoAtuTTCICENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoAtuTTCICENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoAtuTTCICODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoAtuTTCIUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoAtuTTCITIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoAtuTTCITIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoAtuTTCIIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
  end
  object qryPadraoAtuTT: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO,'
      '   CODTIPTITULO, IDPESSOA, IDTIPODESPINVEST, RECPAG,'
      '   IDFORCLI, CODTIPRECDES, IDCARTEIRAINVEST, CODSUBCONTAC,'
      '   CODSUBCONTAD, FLGPAGRECNAO, HISTLANCINVEST, PLANO,'
      '   CONTADOPERFIN, CONTACOPERFIN, CENCUSTCINVEST,'
      '   CENCUSTDINVEST, CODCENTRORESPON, UNIDNEGOC,'
      '   TIPMOVCARTINV, TIPLANCINVEST, IDEMPRESA'
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( TIPMOVCARTINV =:TIPOMOV ) AND'
      '   ( IDEMPRESA =:EMPRESAPROP ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( CODTIPTITULO =:TIPOTITULO ) AND'
      '   ( IDCARTEIRAINVEST =:CARTEIRA )')
    ValidateWithMask = True
    Left = 440
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOTITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end>
    object qryPadraoAtuTTIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoAtuTTIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoAtuTTIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoAtuTTCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoAtuTTIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoAtuTTIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoAtuTTRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoAtuTTIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoAtuTTCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoAtuTTIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoAtuTTCODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoAtuTTCODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoAtuTTFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoAtuTTHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoAtuTTPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoAtuTTCONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoAtuTTCONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoAtuTTCENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoAtuTTCENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoAtuTTCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoAtuTTUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoAtuTTTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoAtuTTTIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoAtuTTIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
  end
  object qryAtualizaSaldoIL: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  HC.IDHISTCARTINV, HC.DATAMOVCARTINV, HC.NATURMOVOPER,'
      
        '  HC.IDOPERACAOINVEST, HC.IDDESPOPERINVEST, HC.IDTIPOOPERACAO AS' +
        ' TIPOOPERACAO,'
      '  HC.SALDOQTDEINVCART, HC.SALDOVLRINVCART,'
      
        '  HC.VLRMOVCARTINV, HC.COTASMOVCARTINV, HC.NATURMOVCARTINV, HC.Q' +
        'TDEMOVINVCART,'
      
        '  HC.MOVIMATU, HC.SALDOATU, HC.MOVIMCAR, HC.SALDOCAR, HC.MOVIMAQ' +
        'UI, HC.SALDOAQUI, HC.SALDOREND,'
      
        '  HC.FLGCALCSALDO, HC.TIPMOVCARTINV, DO.IDTIPOOPERACAO,  DO.FLGC' +
        'ALCDIARIO,'
      
        '  HC.IDCARTEIRAINVEST, HC.IDINVESTIMENTO, HC.IDLOTE, HC.VLRJUROS' +
        ', HC.VLRVARIACAO, '
      
        '  HC.VLRIRPROV, HC.VLRIRAPU, HC.VLRIOFPROV, HC.VLRIOFAPU, HC.VLR' +
        'AGIO'
      ''
      'FROM'
      '   HISTCARTINV HC,'
      '   OPERACAOINVEST OP,'
      '   DESPOPERINVEST DO'
      'WHERE'
      '   (HC.IDCARTEIRAINVEST =:IDCARTEIRA)  AND'
      '   (HC.IDINVESTIMENTO =:IDINVESTIMENTO)  AND'
      
        '   (((:IDLOTE IS NOT NULL) AND (HC.IDLOTE =:IDLOTE)) OR ((:IDLOT' +
        'E IS NULL) AND (HC.IDLOTE IS NULL))) AND'
      '   ( (HC.DATAMOVCARTINV > :DATAMOV) OR'
      '     ((HC.DATAMOVCARTINV = :DATAMOV)  AND'
      '      (HC.IDHISTCARTINV >=:IDHISTORICO)) )  AND'
      '    (HC.IDOPERACAOINVEST'#9'= OP.IDOPERACAOINVEST(+)) AND'
      '    (HC.IDDESPOPERINVEST = DO.IDDESPOPERINVEST(+))'
      'ORDER BY'
      '   DATAMOVCARTINV, IDHISTCARTINV'
      ''
      ''
      ''
      '')
    UpdateObject = updAtualizaSaldoIL
    ValidateWithMask = True
    Left = 432
    Top = 97
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
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
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
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
        Name = 'IDHISTORICO'
        ParamType = ptUnknown
      end>
    object FloatField24: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'HISTCARTINV.IDOPERACAOINVEST'
    end
    object FloatField25: TFloatField
      FieldName = 'SALDOQTDEINVCART'
      Origin = 'HISTCARTINV.SALDOQTDEINVCART'
    end
    object FloatField26: TFloatField
      FieldName = 'SALDOVLRINVCART'
      Origin = 'HISTCARTINV.SALDOVLRINVCART'
    end
    object FloatField27: TFloatField
      FieldName = 'VLRMOVCARTINV'
      Origin = 'HISTCARTINV.VLRMOVCARTINV'
    end
    object FloatField28: TFloatField
      FieldName = 'COTASMOVCARTINV'
      Origin = 'HISTCARTINV.COTASMOVCARTINV'
    end
    object FloatField29: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object StringField14: TStringField
      FieldName = 'NATURMOVCARTINV'
      Size = 1
    end
    object StringField15: TStringField
      FieldName = 'FLGCALCSALDO'
      Size = 1
    end
    object qryAtualizaSaldoILDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryAtualizaSaldoILTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Size = 3
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
    object qryAtualizaSaldoILSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object qryAtualizaSaldoILSALDOREND: TFloatField
      FieldName = 'SALDOREND'
    end
    object qryAtualizaSaldoILMOVIMAQUI: TFloatField
      FieldName = 'MOVIMAQUI'
    end
    object qryAtualizaSaldoILQTDEMOVINVCART: TFloatField
      FieldName = 'QTDEMOVINVCART'
    end
    object qryAtualizaSaldoILIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
    end
    object qryAtualizaSaldoILIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryAtualizaSaldoILFLGCALCDIARIO: TFloatField
      FieldName = 'FLGCALCDIARIO'
    end
    object qryAtualizaSaldoILNATURMOVOPER: TStringField
      FieldName = 'NATURMOVOPER'
      Size = 1
    end
    object qryAtualizaSaldoILMOVIMATU: TFloatField
      FieldName = 'MOVIMATU'
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
    object qryAtualizaSaldoILVLRAGIO: TFloatField
      FieldName = 'VLRAGIO'
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
    object qryAtualizaSaldoILTIPOOPERACAO: TFloatField
      FieldName = 'TIPOOPERACAO'
    end
  end
  object updAtualizaSaldoIL: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  SALDOQTDEINVCART = :SALDOQTDEINVCART,'
      '  SALDOVLRINVCART = :SALDOVLRINVCART,'
      '  MOVIMATU = :MOVIMATU,'
      '  SALDOATU = :SALDOATU,'
      '  MOVIMCAR = :MOVIMCAR,'
      '  SALDOCAR = :SALDOCAR,'
      '  MOVIMAQUI = :MOVIMAQUI,'
      '  SALDOAQUI = :SALDOAQUI,'
      '  SALDOREND = :SALDOREND,'
      '  FLGCALCSALDO = :FLGCALCSALDO'
      'where'
      '  IDHISTCARTINV = :OLD_IDHISTCARTINV')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (SALDOQTDEINVCART, SALDOVLRINVCART, MOVIMATU, SALDOATU, MOVIMC' +
        'AR, SALDOCAR, '
      '   MOVIMAQUI, SALDOAQUI, SALDOREND, FLGCALCSALDO)'
      'values'
      
        '  (:SALDOQTDEINVCART, :SALDOVLRINVCART, :MOVIMATU, :SALDOATU, :M' +
        'OVIMCAR, '
      '   :SALDOCAR, :MOVIMAQUI, :SALDOAQUI, :SALDOREND, :FLGCALCSALDO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDHISTCARTINV = :OLD_IDHISTCARTINV')
    Left = 432
    Top = 86
  end
  object qrySaldoInvestimentoT: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H1.IDHISTCARTINV,'
      
        '   H1.IDCARTEIRAINVEST, H1.DATAMOVCARTINV,   H1.SALDOCOTASCARTIN' +
        'V,'
      '   H1.SALDOVLRCARTINV,  H1.SALDOQTDEINVCART, H1.SALDOVLRINVCART,'
      '   H1.SALDOATU,     H1.SALDOCAR,  H1.SALDOAQUI,'
      
        '   H1.SALDOREND,  H1.SALDOVARIACAO,  H1.SALDOJUROS,       H1.SAL' +
        'DOPREMIO,'
      
        '   H1.SALDOIRPROV, H1.SALDOIRAPU, H1.SALDOIOFPROV, H1.SALDOIOFAP' +
        'U, H1.SALDOAGIO'
      'FROM'
      '   HISTCARTINV H1'
      'WHERE'
      '   (IDCARTEIRAINVEST =:IDCARTEIRA) AND'
      '   (IDINVESTIMENTO =:IDINVESTIMENTO) AND'
      
        '   (((:IDLOTE IS NOT NULL) AND (IDLOTE =:IDLOTE)) OR ((:IDLOTE I' +
        'S NULL) AND (IDLOTE IS NULL))) AND'
      '   (H1.DATAMOVCARTINV ='
      '         (SELECT MAX(H2.DATAMOVCARTINV)'
      '          FROM   HISTCARTINV H2'
      
        '           WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST)    ' +
        '    AND'
      
        '                          (H2.IDINVESTIMENTO   = H1.IDINVESTIMEN' +
        'TO) AND'
      
        '                          (((H1.IDLOTE IS NOT NULL) AND (H2.IDLO' +
        'TE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))' +
        ') AND'
      
        '                          ((H2.DATAMOVCARTINV  < :DATAMOV) OR   ' +
        '      '
      
        '                          ((H2.DATAMOVCARTINV  = :DATAMOV) AND  ' +
        '             '
      
        '                          (H2.IDHISTCARTINV    <  :IDHISTORICO))' +
        '))) AND'
      '    (H1.IDHISTCARTINV   ='
      '         (SELECT MAX(H3.IDHISTCARTINV)'
      '          FROM   HISTCARTINV H3'
      
        '          WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST)     ' +
        '    AND'
      
        '                         (H3.IDINVESTIMENTO   = H1.IDINVESTIMENT' +
        'O)  AND'
      
        '                         (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOT' +
        'E =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL)))' +
        ' AND'
      
        '                         (H3.DATAMOVCARTINV   = H1.DATAMOVCARTIN' +
        'V)  AND'
      '                         ((H3.DATAMOVCARTINV <  :DATAMOV) OR'
      
        '                          (H3.IDHISTCARTINV  <  :IDHISTORICO))))' +
        '    AND'
      ''
      '   (SALDOVLRINVCART IS NOT NULL)'
      'ORDER BY'
      '   DATAMOVCARTINV DESC, IDHISTCARTINV DESC'
      ''
      '')
    ValidateWithMask = True
    Left = 312
    Top = 190
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
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
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTORICO'
        ParamType = ptUnknown
      end>
    object FloatField4: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCARTINV.IDCARTEIRAINVEST'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Origin = 'HISTCARTINV.DATAMOVCARTINV'
    end
    object FloatField5: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
      Origin = 'HISTCARTINV.SALDOCOTASCARTINV'
    end
    object FloatField6: TFloatField
      FieldName = 'SALDOVLRCARTINV'
      Origin = 'HISTCARTINV.SALDOVLRCARTINV'
    end
    object FloatField7: TFloatField
      FieldName = 'SALDOQTDEINVCART'
      Origin = 'HISTCARTINV.SALDOQTDEINVCART'
    end
    object FloatField8: TFloatField
      FieldName = 'SALDOVLRINVCART'
      Origin = 'HISTCARTINV.SALDOVLRINVCART'
    end
    object FloatField9: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object FloatField10: TFloatField
      FieldName = 'SALDOATU'
    end
    object FloatField11: TFloatField
      FieldName = 'SALDOCAR'
    end
    object qrySaldoInvestimentoTSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object qrySaldoInvestimentoTSALDOREND: TFloatField
      FieldName = 'SALDOREND'
    end
    object qrySaldoInvestimentoTSALDOJUROS: TFloatField
      FieldName = 'SALDOJUROS'
    end
    object qrySaldoInvestimentoTSALDOPREMIO: TFloatField
      FieldName = 'SALDOPREMIO'
    end
    object qrySaldoInvestimentoTSALDOVARIACAO: TFloatField
      FieldName = 'SALDOVARIACAO'
    end
    object qrySaldoInvestimentoTSALDOIRPROV: TFloatField
      FieldName = 'SALDOIRPROV'
    end
    object qrySaldoInvestimentoTSALDOIRAPU: TFloatField
      FieldName = 'SALDOIRAPU'
    end
    object qrySaldoInvestimentoTSALDOIOFPROV: TFloatField
      FieldName = 'SALDOIOFPROV'
    end
    object qrySaldoInvestimentoTSALDOIOFAPU: TFloatField
      FieldName = 'SALDOIOFAPU'
    end
    object qrySaldoInvestimentoTSALDOAGIO: TFloatField
      FieldName = 'SALDOAGIO'
    end
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MOEPERIODICIDADE, FLGPERCVALOR'
      'FROM'
      '  MOEDA'
      'WHERE'
      '  ( MOECODIGO =:MOEDA )'
      '')
    ValidateWithMask = True
    Left = 312
    Top = 233
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
  end
  object qryHistoricoCarteira: TwwQuery
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
      '   VLRIRPROV, VLRIRAPU, VLRIOFPROV, VLRIOFAPU, VLRAGIO)'
      'VALUES'
      '   (:IDHISTCARTINV, :CARTEIRA, :INVESTIMENTO, :DESPESAINVEST,'
      '   :DESPESACART, :OPERACAO, :TIPOINVEST, :TIPOOPER, :DATA,'
      '   :MOVIMENTO, :COTAS, :LOTE, :FLGCUSTODIA,'
      
        '   :HISTMOVCARTINV, :NATURMOVCARTINV, :TIPMOVCARTINV, :FLGCALCSA' +
        'LDO,'
      
        '   :EMPRESAPROP, :MODULO, :PLANILHA, :DOCUMENTO, :PLANO, :QUANTI' +
        'DADE,'
      '   :NATURMOVOPER, :RECPAG, :LANCAMENTO, :VLRJUROS, :VLRVARIACAO,'
      '   :VLRIRPROV, :VLRIRAPU, :VLRIOFPROV, :VLRIOFAPU, :VLRAGIO)')
    ValidateWithMask = True
    Left = 312
    Top = 136
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
      end>
  end
  object QryBuscaSaldoNova: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H1.IDHISTCARTINV, H1.TIPMOVCARTINV,'
      '   H1.IDCARTEIRAINVEST, H1.DATAMOVCARTINV, H1.SALDOCOTASCARTINV,'
      '   H1.SALDOVLRCARTINV, H1.SALDOQTDEINVCART, H1.SALDOVLRINVCART,'
      '   H1.SALDOATU, H1.SALDOCAR, H1.SALDOAQUI, H1.SALDOREND'
      'FROM'
      '   HISTCARTINV H1'
      'WHERE'
      '   (IDCARTEIRAINVEST =:IDCARTEIRA) AND'
      '   (IDINVESTIMENTO =:IDINVESTIMENTO) AND'
      
        '   (((:IDLOTE IS NOT NULL) AND (IDLOTE =:IDLOTE)) OR ((:IDLOTE I' +
        'S NULL) AND (IDLOTE IS NULL))) AND'
      '   (H1.IDHISTCARTINV   ='
      '         (SELECT MAX(H3.IDHISTCARTINV)'
      '          FROM   HISTCARTINV H3'
      '          WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDL' +
        'OTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND'
      
        '                ( (H3.DATAMOVCARTINV < TO_DATE(:DATAMOV,'#39'DD/MM/Y' +
        'YYY'#39')) OR '
      
        '                ( (H3.DATAMOVCARTINV = TO_DATE(:DATAMOV,'#39'DD/MM/Y' +
        'YYY'#39')) AND '
      
        '                  (H3.IDHISTCARTINV    < :IDHISTORICO) ) ) ) ) A' +
        'ND'
      '   (SALDOVLRINVCART IS NOT NULL)'
      'ORDER BY'
      '   DATAMOVCARTINV DESC, IDHISTCARTINV DESC')
    ValidateWithMask = True
    Left = 288
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
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
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
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
        Name = 'IDHISTORICO'
        ParamType = ptUnknown
      end>
    object QryBuscaSaldoNovaIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object QryBuscaSaldoNovaTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Size = 3
    end
    object QryBuscaSaldoNovaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryBuscaSaldoNovaDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object QryBuscaSaldoNovaSALDOCOTASCARTINV: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
    end
    object QryBuscaSaldoNovaSALDOVLRCARTINV: TFloatField
      FieldName = 'SALDOVLRCARTINV'
    end
    object QryBuscaSaldoNovaSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object QryBuscaSaldoNovaSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
    end
    object QryBuscaSaldoNovaSALDOATU: TFloatField
      FieldName = 'SALDOATU'
    end
    object QryBuscaSaldoNovaSALDOCAR: TFloatField
      FieldName = 'SALDOCAR'
    end
    object QryBuscaSaldoNovaSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object QryBuscaSaldoNovaSALDOREND: TFloatField
      FieldName = 'SALDOREND'
    end
  end
  object wwDataSource1: TwwDataSource
    DataSet = QryBuscaSaldoNova
    Left = 320
    Top = 8
  end
  object QrySaldoInvestimentoNova: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H1.IDHISTCARTINV,'
      '   H1.IDCARTEIRAINVEST, H1.DATAMOVCARTINV, H1.SALDOCOTASCARTINV,'
      '   H1.SALDOVLRCARTINV, H1.SALDOQTDEINVCART, H1.SALDOVLRINVCART,'
      '   H1.SALDOATU, H1.SALDOCAR, H1.SALDOAQUI, H1.SALDOREND'
      'FROM'
      '   HISTCARTINV H1'
      'WHERE'
      '   (IDCARTEIRAINVEST =:IDCARTEIRA) AND'
      '   (IDINVESTIMENTO =:IDINVESTIMENTO) AND'
      
        '   (((:IDLOTE IS NOT NULL) AND (IDLOTE =:IDLOTE)) OR ((:IDLOTE I' +
        'S NULL) AND (IDLOTE IS NULL))) AND'
      '   (H1.DATAMOVCARTINV ='
      '         (SELECT MAX(H2.DATAMOVCARTINV)'
      '          FROM   HISTCARTINV H2'
      '           WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      
        '                          (H2.IDINVESTIMENTO   = H1.IDINVESTIMEN' +
        'TO) AND'
      
        '                          (((H1.IDLOTE IS NOT NULL) AND (H2.IDLO' +
        'TE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))' +
        ') AND'
      
        '                          ((H2.DATAMOVCARTINV  < :DATAMOV) OR   ' +
        '      '
      
        '                          ((H2.DATAMOVCARTINV  = :DATAMOV) AND  ' +
        '             '
      
        '                          (H2.IDHISTCARTINV    <  :IDHISTORICO))' +
        '))) AND'
      '    (H1.IDHISTCARTINV   ='
      '         (SELECT MAX(H3.IDHISTCARTINV)'
      '          FROM   HISTCARTINV H3'
      '          WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      
        '                         (H3.IDINVESTIMENTO   = H1.IDINVESTIMENT' +
        'O) AND'
      
        '                         (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOT' +
        'E =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL)))' +
        ' AND'
      
        '                         (H3.DATAMOVCARTINV   = H1.DATAMOVCARTIN' +
        'V)  AND'
      '                         ((H3.DATAMOVCARTINV <  :DATAMOV) OR'
      
        '                          (H3.IDHISTCARTINV    <  :IDHISTORICO))' +
        '))  AND'
      ''
      '   (SALDOVLRINVCART IS NOT NULL)'
      'ORDER BY'
      '   DATAMOVCARTINV DESC, IDHISTCARTINV DESC'
      ''
      '')
    ValidateWithMask = True
    Left = 312
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
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
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTORICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTORICO'
        ParamType = ptUnknown
      end>
  end
  object qrySaldoCustodia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H1.IDCUSTODIA, H1.SALDOBLOQUEADO, H1.SALDOLIBERADO'
      'FROM'
      '   HISTCUSTODIA H1'
      'WHERE'
      '   (IDCARTEIRAINVEST =:IDCARTEIRA) AND'
      '   (IDINVESTIMENTO =:IDINVESTIMENTO) AND'
      
        '   (((:IDLOTE IS NOT NULL) AND (IDLOTE =:IDLOTE)) OR ((:IDLOTE I' +
        'S NULL) AND (IDLOTE IS NULL))) AND'
      '   (IDCUSTODIANTE =:IDCUSTODIANTE) AND'
      '   (H1.IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO) AND'
      '   (H1.DATAMOVCUSTOD ='
      '         (SELECT MAX(H2.DATAMOVCUSTOD)'
      '          FROM   HISTCUSTODIA H2'
      '           WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      
        '                          (H2.IDINVESTIMENTO   = H1.IDINVESTIMEN' +
        'TO) AND'
      
        '                          ((H2.IDLOTE = H1.IDLOTE) OR (H1.IDLOTE' +
        ' IS NULL)) AND'
      
        '                          (((H1.IDLOTE IS NOT NULL) AND (H2.IDLO' +
        'TE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))' +
        ') AND'
      
        '                          (H2.IDCUSTODIANTE   = H1.IDCUSTODIANTE' +
        ') AND'
      
        '        '#9'          (H2.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) A' +
        'ND'
      
        '                        ((H2.DATAMOVCUSTOD  <  :DATAMOV) OR     ' +
        '    '
      
        '                        ((H2.DATAMOVCUSTOD  =  :DATAMOV) AND    ' +
        '           '
      
        '                        (H2.IDCUSTODIA    <  :IDCUSTODIA))))) AN' +
        'D'
      '   (H1.IDCUSTODIA   ='
      '         (SELECT MAX(H3.IDCUSTODIA)'
      '          FROM   HISTCUSTODIA H3'
      '          WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      
        '                         (H3.IDINVESTIMENTO   = H1.IDINVESTIMENT' +
        'O) AND'
      
        '                         (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOT' +
        'E =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL)))' +
        ' AND'
      
        '                         (H3.IDCUSTODIANTE   = H1.IDCUSTODIANTE)' +
        ' AND'
      #9'         (H3.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND'
      
        '                         (H3.DATAMOVCUSTOD   = H1.DATAMOVCUSTOD)' +
        ' AND '
      '                         ((H3.DATAMOVCUSTOD < :DATAMOV) OR'
      '                          (H3.IDCUSTODIA    <  :IDCUSTODIA)))) '
      'ORDER BY'
      '   DATAMOVCUSTOD DESC, IDCUSTODIA DESC')
    ValidateWithMask = True
    Left = 440
    Top = 166
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
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
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
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
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIA'
        ParamType = ptUnknown
      end>
    object qrySaldoCustodiaIDCUSTODIA: TFloatField
      FieldName = 'IDCUSTODIA'
    end
    object qrySaldoCustodiaSALDOBLOQUEADO: TFloatField
      FieldName = 'SALDOBLOQUEADO'
    end
    object qrySaldoCustodiaSALDOLIBERADO: TFloatField
      FieldName = 'SALDOLIBERADO'
    end
  end
  object qryHistCustodia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTCUSTODIA'
      ''
      
        '   (IDCUSTODIA, IDOPERACAOINVEST, IDCARTEIRAINVEST, IDINVESTIMEN' +
        'TO, '
      '    IDCUSTODIANTE, DATAMOVCUSTOD, QTDEMOVCUSTOD, SALDOLIBERADO, '
      
        '    SALDOBLOQUEADO, FLGCALCSALDO, IDLOTE, TIPOCUSTODIA, IDMOTIVO' +
        'BLOQUEIO)'
      ''
      'VALUES'
      
        '   (:IDCUSTODIA, :IDOPERACAOINVEST, :IDCARTEIRAINVEST, :IDINVEST' +
        'IMENTO,'
      
        '    :IDCUSTODIANTE, :DATAMOVCUSTOD, :QTDEMOVCUSTOD, :SALDOLIBERA' +
        'DO,'
      
        '    :SALDOBLOQUEADO, :FLGCALCSALDO, :IDLOTE, :TIPOCUSTODIA, :IDM' +
        'OTIVOBLOQUEIO)')
    ValidateWithMask = True
    Left = 440
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCUSTODIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
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
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOVCUSTOD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'QTDEMOVCUSTOD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOLIBERADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SALDOBLOQUEADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGCALCSALDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOCUSTODIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptUnknown
      end>
    object StringField2: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object FloatField12: TFloatField
      FieldName = 'SALDOBLOQUEADO'
    end
    object FloatField13: TFloatField
      FieldName = 'SALDOLIBERADO'
    end
  end
end
