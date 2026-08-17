object dtmOperacaoInvest: TdtmOperacaoInvest
  OldCreateOrder = True
  OnDestroy = dtmOperacaoInvestDestroy
  Left = 108
  Top = 26
  Height = 580
  Width = 808
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
    Left = 440
    Top = 168
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
    Top = 331
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 440
    Top = 218
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
    Left = 312
    Top = 168
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
    Left = 440
    Top = 8
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
    Left = 312
    Top = 55
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
    Top = 55
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
    Left = 312
    Top = 105
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
  object qryPadraoDespFCTTCI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO,'
      '   CODTIPTITULO, IDPESSOA, IDTIPODESPINVEST, RECPAG, '
      '   IDFORCLI, CODTIPRECDES, IDCARTEIRAINVEST, CODSUBCONTAC, '
      '   CODSUBCONTAD, FLGPAGRECNAO, HISTLANCINVEST, PLANO, '
      '   CONTADOPERFIN, CONTACOPERFIN, CENCUSTCINVEST, '
      '   CENCUSTDINVEST, CODCENTRORESPON, UNIDNEGOC,'
      '   TIPMOVCARTINV, TIPLANCINVEST, IDEMPRESA'
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( TIPMOVCARTINV =:TIPOMOV ) AND'
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( IDTIPODESPINVEST =:TIPODESPESA ) AND'
      '   ( CODTIPTITULO =:TIPOTITULO ) AND'
      '   ( IDFORCLI =:FORCLI ) AND'
      '   ( IDCARTEIRAINVEST =:CARTEIRA )')
    ValidateWithMask = True
    Left = 64
    Top = 280
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
        DataType = ftString
        Name = 'TIPOLANC'
        ParamType = ptUnknown
      end
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
      end
      item
        DataType = ftString
        Name = 'TIPOTITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end>
    object qryPadraoDespFCTTCIIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoDespFCTTCIIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoDespFCTTCIIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoDespFCTTCICODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoDespFCTTCIIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoDespFCTTCIIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoDespFCTTCIRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoDespFCTTCIIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoDespFCTTCICODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoDespFCTTCIIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoDespFCTTCICODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoDespFCTTCICODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoDespFCTTCIFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoDespFCTTCIHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoDespFCTTCIPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoDespFCTTCICONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoDespFCTTCICONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoDespFCTTCICENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoDespFCTTCICENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoDespFCTTCICODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoDespFCTTCIUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoDespFCTTCITIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoDespFCTTCITIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoDespFCTTCIIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
  end
  object qryPadraoOperFCTTCI: TwwQuery
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
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDEMPRESA =:EMPRESAPROP ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( CODTIPTITULO =:TIPOTITULO ) AND'
      '   ( IDFORCLI =:FORCLI ) AND'
      '   ( IDCARTEIRAINVEST =:CARTEIRA )')
    ValidateWithMask = True
    Left = 64
    Top = 104
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
        DataType = ftString
        Name = 'TIPOLANC'
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
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOTITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end>
    object qryPadraoOperFCTTCIIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoOperFCTTCIIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoOperFCTTCIIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoOperFCTTCICODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoOperFCTTCIIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoOperFCTTCIIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoOperFCTTCIRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoOperFCTTCIIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoOperFCTTCICODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoOperFCTTCIIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoOperFCTTCICODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoOperFCTTCICODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoOperFCTTCIFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoOperFCTTCIHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoOperFCTTCIPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoOperFCTTCICONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoOperFCTTCICONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoOperFCTTCICENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoOperFCTTCICENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoOperFCTTCICODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoOperFCTTCIUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoOperFCTTCITIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoOperFCTTCITIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoOperFCTTCIIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
  end
  object qryPadraoOperFCTT: TwwQuery
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
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDEMPRESA =:EMPRESAPROP ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( CODTIPTITULO =:TIPOTITULO ) AND'
      '   ( IDFORCLI =:FORCLI ) ')
    ValidateWithMask = True
    Left = 64
    Top = 88
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
        DataType = ftString
        Name = 'TIPOLANC'
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
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOTITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FORCLI'
        ParamType = ptUnknown
      end>
    object qryPadraoOperFCTTIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoOperFCTTIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoOperFCTTIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoOperFCTTCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoOperFCTTIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoOperFCTTIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoOperFCTTRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoOperFCTTIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoOperFCTTCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoOperFCTTIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoOperFCTTCODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoOperFCTTCODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoOperFCTTFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoOperFCTTHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoOperFCTTPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoOperFCTTCONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoOperFCTTCONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoOperFCTTCENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoOperFCTTCENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoOperFCTTCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoOperFCTTUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoOperFCTTTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoOperFCTTTIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoOperFCTTIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
  end
  object qryPadraoOperFCCI: TwwQuery
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
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDEMPRESA =:EMPRESAPROP ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( IDFORCLI =:FORCLI ) AND'
      '   ( IDCARTEIRAINVEST =:CARTEIRA )')
    ValidateWithMask = True
    Left = 64
    Top = 72
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
        DataType = ftString
        Name = 'TIPOLANC'
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
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end>
    object qryPadraoOperFCCIIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoOperFCCIIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoOperFCCIIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoOperFCCICODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoOperFCCIIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoOperFCCIIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoOperFCCIRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoOperFCCIIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoOperFCCICODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoOperFCCIIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoOperFCCICODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoOperFCCICODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoOperFCCIFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoOperFCCIHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoOperFCCIPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoOperFCCICONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoOperFCCICONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoOperFCCICENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoOperFCCICENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoOperFCCICODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoOperFCCIUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoOperFCCITIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoOperFCCITIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoOperFCCIIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
  end
  object qryPadraoOperTTCI: TwwQuery
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
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDEMPRESA =:EMPRESAPROP ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( CODTIPTITULO =:TIPOTITULO ) AND'
      '   ( IDCARTEIRAINVEST =:CARTEIRA )')
    ValidateWithMask = True
    Left = 64
    Top = 56
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
        DataType = ftString
        Name = 'TIPOLANC'
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
        DataType = ftInteger
        Name = 'TIPOOERACAO'
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
    object qryPadraoOperTTCIIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoOperTTCIIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoOperTTCIIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoOperTTCICODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoOperTTCIIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoOperTTCIIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoOperTTCIRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoOperTTCIIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoOperTTCICODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoOperTTCIIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoOperTTCICODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoOperTTCICODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoOperTTCIFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoOperTTCIHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoOperTTCIPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoOperTTCICONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoOperTTCICONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoOperTTCICENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoOperTTCICENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoOperTTCICODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoOperTTCIUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoOperTTCITIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoOperTTCITIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoOperTTCIIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
  end
  object qryPadraoOperFC: TwwQuery
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
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDEMPRESA =:EMPRESAPROP ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( IDFORCLI =:FORCLI ) ')
    ValidateWithMask = True
    Left = 64
    Top = 40
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
        DataType = ftString
        Name = 'TIPOLANC'
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
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FORCLI'
        ParamType = ptUnknown
      end>
    object qryPadraoOperFCIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoOperFCIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoOperFCIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoOperFCCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoOperFCIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoOperFCIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoOperFCRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoOperFCIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoOperFCCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoOperFCIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoOperFCCODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoOperFCCODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoOperFCFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoOperFCHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoOperFCPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoOperFCCONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoOperFCCONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoOperFCCENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoOperFCCENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoOperFCCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoOperFCUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoOperFCTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoOperFCTIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoOperFCIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
  end
  object qryPadraoOperTT: TwwQuery
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
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDEMPRESA =:EMPRESAPROP ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( CODTIPTITULO =:TIPOTITULO ) '
      '')
    ValidateWithMask = True
    Left = 64
    Top = 24
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
        DataType = ftString
        Name = 'TIPOLANC'
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
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOTITULO'
        ParamType = ptUnknown
      end>
    object qryPadraoOperTTIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoOperTTIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoOperTTIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoOperTTCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoOperTTIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoOperTTIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoOperTTRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoOperTTIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoOperTTCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoOperTTIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoOperTTCODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoOperTTCODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoOperTTFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoOperTTHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoOperTTPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoOperTTCONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoOperTTCONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoOperTTCENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoOperTTCENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoOperTTCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoOperTTUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoOperTTTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoOperTTTIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoOperTTIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
  end
  object qryPadraoOperCI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO,'
      '   CODTIPTITULO, IDPESSOA, IDTIPODESPINVEST, RECPAG,'
      '   IDFORCLI, CODTIPRECDES, IDCARTEIRAINVEST, CODSUBCONTAC,'
      '   CODSUBCONTAD, FLGPAGRECNAO, HISTLANCINVEST, PLANO,'
      '   CONTADOPERFIN, CONTACOPERFIN, CENCUSTCINVEST,'
      '   CENCUSTDINVEST, CODCENTRORESPON, UNIDNEGOC,'
      '   TIPMOVCARTINV, TIPLANCINVEST, IDEMPRESA, TIPCODIGO'
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( TIPMOVCARTINV =:TIPOMOV ) AND'
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDEMPRESA =:EMPRESAPROP ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( IDCARTEIRAINVEST =:CARTEIRA )')
    ValidateWithMask = True
    Left = 64
    Top = 8
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
        DataType = ftString
        Name = 'TIPOLANC'
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
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end>
    object qryPadraoOperCIIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoOperCIIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoOperCIIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoOperCICODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoOperCIIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoOperCIIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoOperCIRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoOperCIIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoOperCICODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoOperCIIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoOperCICODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoOperCICODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoOperCIFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoOperCIHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoOperCIPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoOperCICONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoOperCICONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoOperCICENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoOperCICENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoOperCICODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoOperCIUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoOperCITIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoOperCITIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoOperCIIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
    object qryPadraoOperCITIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Origin = 'PADRLANCCONTINV.TIPCODIGO'
      Size = 2
    end
  end
  object qryPadraoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO,'
      '   CODTIPTITULO, IDPESSOA, IDTIPODESPINVEST, RECPAG,'
      '   IDFORCLI, CODTIPRECDES, IDCARTEIRAINVEST, CODSUBCONTAC,'
      '   CODSUBCONTAD, FLGPAGRECNAO, HISTLANCINVEST, PLANO,'
      '   CONTADOPERFIN, CONTACOPERFIN, CENCUSTCINVEST,'
      '   CENCUSTDINVEST, CODCENTRORESPON, UNIDNEGOC,'
      '   TIPMOVCARTINV, TIPLANCINVEST, IDEMPRESA, TIPCODIGO'
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( TIPMOVCARTINV =:TIPOMOV ) AND'
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDEMPRESA =:EMPRESAPROP ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) ')
    ValidateWithMask = True
    Left = 64
    Top = 8
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
        DataType = ftString
        Name = 'TIPOLANC'
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
        DataType = ftInteger
        Name = 'TIPOOERACAO'
        ParamType = ptUnknown
      end>
    object qryPadraoOperIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoOperIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoOperIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoOperCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoOperIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoOperIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoOperRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoOperIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoOperCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoOperIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoOperCODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoOperCODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoOperFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoOperHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoOperPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoOperCONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoOperCONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoOperCENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoOperCENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoOperCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoOperUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoOperTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoOperTIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoOperIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
    object qryPadraoOperTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Origin = 'PADRLANCCONTINV.TIPCODIGO'
      Size = 2
    end
  end
  object qryPadraoDespFCTT: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO,'
      '   CODTIPTITULO, IDPESSOA, IDTIPODESPINVEST, RECPAG, '
      '   IDFORCLI, CODTIPRECDES, IDCARTEIRAINVEST, CODSUBCONTAC, '
      '   CODSUBCONTAD, FLGPAGRECNAO, HISTLANCINVEST, PLANO, '
      '   CONTADOPERFIN, CONTACOPERFIN, CENCUSTCINVEST, '
      '   CENCUSTDINVEST, CODCENTRORESPON, UNIDNEGOC,'
      '   TIPMOVCARTINV, TIPLANCINVEST, IDEMPRESA'
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( TIPMOVCARTINV =:TIPOMOV ) AND'
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( IDTIPODESPINVEST =:TIPODESPESA ) AND'
      '   ( CODTIPTITULO =:TIPOTITULO ) AND'
      '   ( IDFORCLI =:FORCLI ) ')
    ValidateWithMask = True
    Left = 64
    Top = 264
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
        DataType = ftString
        Name = 'TIPOLANC'
        ParamType = ptUnknown
      end
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
      end
      item
        DataType = ftString
        Name = 'TIPOTITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FORCLI'
        ParamType = ptUnknown
      end>
    object qryPadraoDespFCTTIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoDespFCTTIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoDespFCTTIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoDespFCTTCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoDespFCTTIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoDespFCTTIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoDespFCTTRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoDespFCTTIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoDespFCTTCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoDespFCTTIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoDespFCTTCODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoDespFCTTCODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoDespFCTTFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoDespFCTTHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoDespFCTTPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoDespFCTTCONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoDespFCTTCONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoDespFCTTCENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoDespFCTTCENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoDespFCTTCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoDespFCTTUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoDespFCTTTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoDespFCTTTIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoDespFCTTIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
  end
  object qryPadraoDespFCCI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO,'
      '   CODTIPTITULO, IDPESSOA, IDTIPODESPINVEST, RECPAG, '
      '   IDFORCLI, CODTIPRECDES, IDCARTEIRAINVEST, CODSUBCONTAC, '
      '   CODSUBCONTAD, FLGPAGRECNAO, HISTLANCINVEST, PLANO, '
      '   CONTADOPERFIN, CONTACOPERFIN, CENCUSTCINVEST, '
      '   CENCUSTDINVEST, CODCENTRORESPON, UNIDNEGOC,'
      '   TIPMOVCARTINV, TIPLANCINVEST, IDEMPRESA'
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( TIPMOVCARTINV =:TIPOMOV ) AND'
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( IDTIPODESPINVEST =:TIPODESPESA ) AND'
      '   ( IDFORCLI =:FORCLI ) AND'
      '   ( IDCARTEIRAINVEST =:CARTEIRA )')
    ValidateWithMask = True
    Left = 64
    Top = 248
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
        DataType = ftString
        Name = 'TIPOLANC'
        ParamType = ptUnknown
      end
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
      end
      item
        DataType = ftInteger
        Name = 'FORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end>
    object qryPadraoDespFCCIIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoDespFCCIIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoDespFCCIIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoDespFCCICODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoDespFCCIIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoDespFCCIIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoDespFCCIRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoDespFCCIIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoDespFCCICODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoDespFCCIIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoDespFCCICODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoDespFCCICODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoDespFCCIFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoDespFCCIHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoDespFCCIPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoDespFCCICONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoDespFCCICONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoDespFCCICENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoDespFCCICENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoDespFCCICODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoDespFCCIUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoDespFCCITIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoDespFCCITIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoDespFCCIIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
  end
  object qryPadraoDespTTCI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO,'
      '   CODTIPTITULO, IDPESSOA, IDTIPODESPINVEST, RECPAG, '
      '   IDFORCLI, CODTIPRECDES, IDCARTEIRAINVEST, CODSUBCONTAC, '
      '   CODSUBCONTAD, FLGPAGRECNAO, HISTLANCINVEST, PLANO, '
      '   CONTADOPERFIN, CONTACOPERFIN, CENCUSTCINVEST, '
      '   CENCUSTDINVEST, CODCENTRORESPON, UNIDNEGOC,'
      '   TIPMOVCARTINV, TIPLANCINVEST, IDEMPRESA'
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( TIPMOVCARTINV =:TIPOMOV ) AND'
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( IDTIPODESPINVEST =:TIPODESPESA ) AND'
      '   ( CODTIPTITULO =:TIPOTITULO ) AND'
      '   ( IDCARTEIRAINVEST =:CARTEIRA )')
    ValidateWithMask = True
    Left = 64
    Top = 232
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
        DataType = ftString
        Name = 'TIPOLANC'
        ParamType = ptUnknown
      end
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
    object qryPadraoDespTTCIIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoDespTTCIIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoDespTTCIIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoDespTTCICODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoDespTTCIIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoDespTTCIIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoDespTTCIRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoDespTTCIIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoDespTTCICODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoDespTTCIIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoDespTTCICODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoDespTTCICODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoDespTTCIFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoDespTTCIHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoDespTTCIPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoDespTTCICONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoDespTTCICONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoDespTTCICENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoDespTTCICENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoDespTTCICODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoDespTTCIUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoDespTTCITIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoDespTTCITIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoDespTTCIIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
  end
  object qryPadraoDespFC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO,'
      '   CODTIPTITULO, IDPESSOA, IDTIPODESPINVEST, RECPAG, '
      '   IDFORCLI, CODTIPRECDES, IDCARTEIRAINVEST, CODSUBCONTAC, '
      '   CODSUBCONTAD, FLGPAGRECNAO, HISTLANCINVEST, PLANO, '
      '   CONTADOPERFIN, CONTACOPERFIN, CENCUSTCINVEST, '
      '   CENCUSTDINVEST, CODCENTRORESPON, UNIDNEGOC,'
      '   TIPMOVCARTINV, TIPLANCINVEST, IDEMPRESA'
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( TIPMOVCARTINV =:TIPOMOV ) AND'
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( IDTIPODESPINVEST =:TIPODESPESA ) AND'
      '   ( IDFORCLI =:FORCLI ) ')
    ValidateWithMask = True
    Left = 64
    Top = 216
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
        DataType = ftString
        Name = 'TIPOLANC'
        ParamType = ptUnknown
      end
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
      end
      item
        DataType = ftInteger
        Name = 'FORCLI'
        ParamType = ptUnknown
      end>
  end
  object qryPadraoDespTT: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO,'
      '   CODTIPTITULO, IDPESSOA, IDTIPODESPINVEST, RECPAG, '
      '   IDFORCLI, CODTIPRECDES, IDCARTEIRAINVEST, CODSUBCONTAC, '
      '   CODSUBCONTAD, FLGPAGRECNAO, HISTLANCINVEST, PLANO, '
      '   CONTADOPERFIN, CONTACOPERFIN, CENCUSTCINVEST, '
      '   CENCUSTDINVEST, CODCENTRORESPON, UNIDNEGOC,'
      '   TIPMOVCARTINV, TIPLANCINVEST, IDEMPRESA'
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( TIPMOVCARTINV =:TIPOMOV ) AND'
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( IDTIPODESPINVEST =:TIPODESPESA ) AND'
      '   ( CODTIPTITULO =:TIPOTITULO ) ')
    ValidateWithMask = True
    Left = 64
    Top = 200
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
        DataType = ftString
        Name = 'TIPOLANC'
        ParamType = ptUnknown
      end
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
      end
      item
        DataType = ftString
        Name = 'TIPOTITULO'
        ParamType = ptUnknown
      end>
    object qryPadraoDespTTIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoDespTTIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoDespTTIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoDespTTCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoDespTTIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoDespTTIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoDespTTRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoDespTTIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoDespTTCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoDespTTIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoDespTTCODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoDespTTCODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoDespTTFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoDespTTHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoDespTTPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoDespTTCONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoDespTTCONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoDespTTCENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoDespTTCENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoDespTTCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoDespTTUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoDespTTTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoDespTTTIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoDespTTIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
  end
  object qryPadraoDespCI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO,'
      '   CODTIPTITULO, IDPESSOA, IDTIPODESPINVEST, RECPAG, '
      '   IDFORCLI, CODTIPRECDES, IDCARTEIRAINVEST, CODSUBCONTAC, '
      '   CODSUBCONTAD, FLGPAGRECNAO, HISTLANCINVEST, PLANO, '
      '   CONTADOPERFIN, CONTACOPERFIN, CENCUSTCINVEST, '
      '   CENCUSTDINVEST, CODCENTRORESPON, UNIDNEGOC,'
      '   TIPMOVCARTINV, TIPLANCINVEST, IDEMPRESA'
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( TIPMOVCARTINV =:TIPOMOV ) AND'
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( IDTIPODESPINVEST =:TIPODESPESA ) AND'
      '   ( IDCARTEIRAINVEST =:CARTEIRA )')
    ValidateWithMask = True
    Left = 64
    Top = 184
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
        DataType = ftString
        Name = 'TIPOLANC'
        ParamType = ptUnknown
      end
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
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptUnknown
      end>
    object qryPadraoDespCIIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoDespCIIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoDespCIIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoDespCICODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoDespCIIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoDespCIIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoDespCIRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoDespCIIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoDespCICODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoDespCIIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoDespCICODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoDespCICODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoDespCIFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoDespCIHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoDespCIPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoDespCICONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoDespCICONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoDespCICENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoDespCICENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoDespCICODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoDespCIUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoDespCITIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoDespCITIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoDespCIIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
    end
  end
  object qryPadraoDesp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO,'
      '   CODTIPTITULO, IDPESSOA, IDTIPODESPINVEST, RECPAG, '
      '   IDFORCLI, CODTIPRECDES, IDCARTEIRAINVEST, CODSUBCONTAC, '
      '   CODSUBCONTAD, FLGPAGRECNAO, HISTLANCINVEST, PLANO, '
      '   CONTADOPERFIN, CONTACOPERFIN, CENCUSTCINVEST, '
      '   CENCUSTDINVEST, CODCENTRORESPON, UNIDNEGOC,'
      '   TIPMOVCARTINV, TIPLANCINVEST, IDEMPRESA'
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( TIPMOVCARTINV =:TIPOMOV ) AND'
      '   ( TIPLANCINVEST =:TIPOLANC ) AND'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) AND'
      '   ( IDTIPODESPINVEST =:TIPODESPESA ) ')
    ValidateWithMask = True
    Left = 64
    Top = 168
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
        DataType = ftString
        Name = 'TIPOLANC'
        ParamType = ptUnknown
      end
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
    object qryPadraoDespIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryPadraoDespIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryPadraoDespIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryPadraoDespCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryPadraoDespIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PADRLANCCONTINV.IDPESSOA'
    end
    object qryPadraoDespIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryPadraoDespRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'PADRLANCCONTINV.RECPAG'
      Size = 1
    end
    object qryPadraoDespIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PADRLANCCONTINV.IDFORCLI'
    end
    object qryPadraoDespCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'PADRLANCCONTINV.CODTIPRECDES'
      Size = 15
    end
    object qryPadraoDespIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryPadraoDespCODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryPadraoDespCODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryPadraoDespFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'PADRLANCCONTINV.FLGPAGRECNAO'
      Size = 1
    end
    object qryPadraoDespHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryPadraoDespPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PADRLANCCONTINV.PLANO'
    end
    object qryPadraoDespCONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTADOPERFIN'
      Size = 18
    end
    object qryPadraoDespCONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'PADRLANCCONTINV.CONTACOPERFIN'
      Size = 18
    end
    object qryPadraoDespCENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTCINVEST'
      Size = 10
    end
    object qryPadraoDespCENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'PADRLANCCONTINV.CENCUSTDINVEST'
      Size = 10
    end
    object qryPadraoDespCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PADRLANCCONTINV.CODCENTRORESPON'
      Size = 10
    end
    object qryPadraoDespUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryPadraoDespTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryPadraoDespTIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'PADRLANCCONTINV.TIPLANCINVEST'
      Size = 1
    end
    object qryPadraoDespIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PADRLANCCONTINV.IDEMPRESA'
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
    Top = 345
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
    Top = 331
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
    Left = 64
    Top = 405
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
    Top = 269
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
    Left = 192
    Top = 168
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
    Top = 331
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
      'SELECT H1.IDCUSTODIA, H1.SALDOBLOQUEADO, H1.SALDOLIBERADO'
      'FROM HISTCUSTODIA H1'
      'WHERE (IDINVESTIMENTO = :IDINVESTIMENTO)'
      '  AND (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)'
      '  AND (IDCARTEIRAINVEST = :IDCARTEIRA)'
      '  AND (IDCUSTODIANTE =:IDCUSTODIANTE)'
      '  AND (H1.IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO)'
      
        '  AND (((:IDLOTE IS NOT NULL) AND (IDLOTE =:IDLOTE)) OR ((:IDLOT' +
        'E IS NULL) AND (IDLOTE IS NULL)))'
      '  AND (H1.DATAMOVCUSTOD ='
      '         (SELECT MAX(H2.DATAMOVCUSTOD)'
      '          FROM HISTCUSTODIA H2'
      '          WHERE (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO)'
      '            AND (H2.IDPLANPREVCTBPATR = H1.IDPLANPREVCTBPATR)'
      '            AND (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST)'
      
        '            AND (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDL' +
        'OTE)) OR'
      '                 ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL)))'
      '            AND (H2.IDCUSTODIANTE   = H1.IDCUSTODIANTE)'
      '            AND (H2.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO)'
      
        '            AND ((H2.DATAMOVCUSTOD  <  TO_DATE(:DATAMOV,'#39'DD/MM/Y' +
        'YYY'#39')) OR'
      
        '                 ((H2.DATAMOVCUSTOD =  TO_DATE(:DATAMOV,'#39'DD/MM/Y' +
        'YYY'#39')) AND'
      '                  (H2.IDCUSTODIA    <  :IDCUSTODIA)))))'
      '  AND (H1.IDCUSTODIA   ='
      '         (SELECT MAX(H3.IDCUSTODIA)'
      '          FROM   HISTCUSTODIA H3'
      '          WHERE (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO)'
      '            AND (H3.IDPLANPREVCTBPATR = H1.IDPLANPREVCTBPATR)'
      '            AND (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST)'
      '            AND (H3.IDCUSTODIANTE   = H1.IDCUSTODIANTE)'
      '            AND (H3.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO)'
      
        '            AND (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDL' +
        'OTE)) OR'
      '                 ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL)))'
      '            AND (H3.DATAMOVCUSTOD   = H1.DATAMOVCUSTOD)'
      
        '            AND ((H3.DATAMOVCUSTOD < TO_DATE(:DATAMOV,'#39'DD/MM/YYY' +
        'Y'#39')) OR'
      '                 (H3.IDCUSTODIA    <  :IDCUSTODIA))))'
      'ORDER BY'
      '   DATAMOVCUSTOD DESC, IDCUSTODIA DESC'
      '')
    ValidateWithMask = True
    Left = 312
    Top = 218
    ParamData = <
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
        Name = 'IDCARTEIRA'
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
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
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
      
        '   (IDCUSTODIA, IDOPERACAOINVEST, IDCARTEIRAINVEST, IDINVESTIMEN' +
        'TO, '
      '    IDCUSTODIANTE, DATAMOVCUSTOD, QTDEMOVCUSTOD, SALDOLIBERADO, '
      
        '    SALDOBLOQUEADO, FLGCALCSALDO, IDLOTE, TIPOCUSTODIA, IDMOTIVO' +
        'BLOQUEIO, IDOPERCUSTODIA,'
      '    IDPLANPREVCTBPATR, FLGCONTAINVEST)'
      'VALUES'
      
        '   (:IDCUSTODIA, :IDOPERACAOINVEST, :IDCARTEIRAINVEST, :IDINVEST' +
        'IMENTO,'
      
        '    :IDCUSTODIANTE, :DATAMOVCUSTOD, :QTDEMOVCUSTOD, :SALDOLIBERA' +
        'DO,'
      
        '    :SALDOBLOQUEADO, :FLGCALCSALDO, :IDLOTE, :TIPOCUSTODIA, :IDM' +
        'OTIVOBLOQUEIO, :IDOPERCUSTODIA,'
      '    :IDPLANPREVCTBPATR, :FLGCONTAINVEST)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 218
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCUSTODIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
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
        Name = 'IDCUSTODIANTE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAMOVCUSTOD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QTDEMOVCUSTOD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SALDOLIBERADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SALDOBLOQUEADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGCALCSALDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPOCUSTODIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCUSTODIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGCONTAINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryLocal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      
        '        H.IDHISTCARTINV, H.IDCARTEIRAINVEST, H.IDINVESTIMENTO, H' +
        '.IDLOTE, h.DATAMOVCARTINV, H.IDOPERACAOINVEST, H.QTDEMOVINVCART,'
      
        '        OPR.QTDEOPERACAO, OPR.IDCUSTODIANTE, OPR.IDCUSTORIG, OPR' +
        '.IDCUSTDEST,'
      
        '        TOP.TIPOCUSTODIA, TOP.IDMOTIVOBLOQUEIO, TOP.FLGTRANSF,  ' +
        '       '
      
        '        TOP.TIPSALDOCARTORIG, TOP.MOTBLOQCARTORIG, TOP.TIPSALDOC' +
        'ARTDEST, '
      
        '        TOP.MOTBLOQCARTDEST FROM HISTCARTINV H, OPERACAOINVEST O' +
        'PR, TIPOOPERACAO TOP '
      'WHERE    '
      '    (H.FLGCUSTODIA = '#39'1'#39')       AND '
      '    (H.IDTIPOOPERACAO   = TOP.IDTIPOOPERACAO(+))         AND'
      '    (H.IDOPERACAOINVEST = OPR.IDOPERACAOINVEST(+)) '
      'ORDER BY H.DATAMOVCARTINV, H.IDHISTCARTINV')
    ValidateWithMask = True
    Left = 440
    Top = 105
  end
  object qryFlgAtualSaldo13: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTCARTINV, DATAMOVCARTINV, NATURMOVCARTINV,'
      
        '   IDCARTEIRAINVEST, IDCARTEIRAGERENC, IDINVESTIMENTO, IDLOTE,  ' +
        'FLGCALCSALDO,'
      '   IDTIPOINVEST,IDDESPOPERINVEST, IDPLANPREVCTBPATR'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      
        '   ( (FLGCALCSALDO = '#39'1'#39')  OR (FLGCALCSALDO = '#39'3'#39')  OR (FLGCALCS' +
        'ALDO = '#39'4'#39') )'
      'ORDER BY'
      '   DATAMOVCARTINV, IDHISTCARTINV'
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 440
    Top = 282
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
    object qryFlgAtualSaldo13IDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
      Origin = 'HISTCARTINV.IDDESPOPERINVEST'
    end
    object qryFlgAtualSaldo13IDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'HISTCARTINV.IDCARTEIRAGERENC'
    end
  end
  object qryFlgAtualSaldo2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTCARTINV, DATAMOVCARTINV,  IDLOTE,'
      
        '   IDCARTEIRAINVEST, IDCARTEIRAGERENC, IDINVESTIMENTO, FLGCALCSA' +
        'LDO,IDDESPOPERINVEST, IDPLANPREVCTBPATR'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   ( (FLGCALCSALDO = '#39'2'#39') OR (FLGCALCSALDO = '#39'4'#39') )'
      'ORDER BY'
      '   DATAMOVCARTINV, IDHISTCARTINV'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 440
    Top = 269
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
    object qryFlgAtualSaldo2IDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
      Origin = 'HISTCARTINV.IDDESPOPERINVEST'
    end
    object qryFlgAtualSaldo2IDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'HISTCARTINV.IDCARTEIRAGERENC'
    end
    object qryFlgAtualSaldo2IDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.HISTCARTINV.IDPLANPREVCTBPATR'
    end
  end
  object qryAtualizaSaldoILNull: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  HC.IDHISTCARTINV, HC.DATAMOVCARTINV, HC.NATURMOVOPER,'
      
        '  HC.IDOPERACAOINVEST, HC.IDDESPOPERINVEST, HC.IDTIPOOPERACAO AS' +
        ' TIPOOPERACAO,'
      '  HC.SALDOQTDEINVCART, HC.SALDOVLRINVCART,HC.IDTIPOINVEST,'
      
        '  HC.VLRMOVCARTINV, HC.COTASMOVCARTINV, HC.NATURMOVCARTINV, HC.Q' +
        'TDEMOVINVCART,'
      
        '  HC.MOVIMATU, HC.SALDOATU, HC.MOVIMCAR, HC.SALDOCAR, HC.MOVIMAQ' +
        'UI, HC.SALDOAQUI, HC.SALDOREND,'
      
        '  HC.FLGCALCSALDO, HC.TIPMOVCARTINV, DE.IDTIPOOPERACAO,  DE.FLGC' +
        'ALCDIARIO, DE.IDTIPODESPINVEST,'
      
        '  HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO, H' +
        'C.IDLOTE, HC.VLRJUROS,'
      
        '  HC.VLRVARIACAO, HC.VLRIRPROV, HC.VLRIRAPU, HC.VLRIOFPROV, HC.V' +
        'LRIOFAPU, HC.VLRAGIO,'
      
        '  HC.IDTIPOOPERACAO AS IDTIPOOPERHIST, TP.FLGCONTAINVEST, IV.DES' +
        'CINVESTIMENTO'
      ''
      
        'FROM HISTCARTINV HC, OPERACAOINVEST OP, DESPOPERINVEST DE, TIPOO' +
        'PERACAO TP, INVESTIMENTO IV'
      ''
      
        'WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (HC.IDCARTEIRAINVEST =:IDCARTEIRA)'
      '  AND (HC.IDINVESTIMENTO   =:IDINVESTIMENTO)'
      '  AND ( (HC.DATAMOVCARTINV > TO_DATE(:DATAMOV,'#39'DD/MM/YYYY'#39')) OR'
      
        '       ((HC.DATAMOVCARTINV = TO_DATE(:DATAMOV,'#39'DD/MM/YYYY'#39')) AND' +
        ' (HC.IDHISTCARTINV >=:IDHISTORICO)) )'
      
        '  AND ( (HC.DATAMOVCARTINV < TO_DATE(:DATAMOVPROX,'#39'DD/MM/YYYY'#39'))' +
        ' OR'
      
        '       ((HC.DATAMOVCARTINV = TO_DATE(:DATAMOVPROX,'#39'DD/MM/YYYY'#39'))' +
        ' AND (HC.IDHISTCARTINV >=:IDHISTORICO)) )'
      '  AND (HC.IDCARTEIRAGERENC IS NULL)'
      '  AND (HC.IDOPERACAOINVEST = OP.IDOPERACAOINVEST(+))'
      '  AND (HC.IDDESPOPERINVEST = DE.IDDESPOPERINVEST(+))'
      '  AND (HC.IDTIPOOPERACAO   = TP.IDTIPOOPERACAO(+))'
      '  AND (HC.IDINVESTIMENTO   = IV.IDINVESTIMENTO(+))  '
      ''
      'ORDER BY HC.DATAMOVCARTINV, HC.IDHISTCARTINV'
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updAtualizaSaldoIL
    ValidateWithMask = True
    Left = 192
    Top = 269
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
        Name = 'IDCARTEIRA'
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
        Name = 'DATAMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDHISTORICO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVPROX'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVPROX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDHISTORICO'
        ParamType = ptInput
      end>
  end
  object qrySaldoCarteiraNull: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTCARTINV,'
      '   DATAMOVCARTINV, IDCARTEIRAINVEST, SALDOCOTASCARTINV,'
      '   SALDOVLRCARTINV, SALDOQTDEINVCART, SALDOVLRINVCART'
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '       (IDCARTEIRAINVEST = :IDCARTEIRA)'
      ''
      '   AND'
      '       (IDCARTEIRAGERENC IS NULL)'
      '   AND ( (DATAMOVCARTINV < :DATAMOV) OR'
      '              ((DATAMOVCARTINV = :DATAMOV)  AND'
      '               (IDHISTCARTINV <:IDHISTORICO)) )'
      '   AND (SALDOVLRCARTINV IS NOT NULL)'
      'ORDER BY'
      '   DATAMOVCARTINV DESC, IDHISTCARTINV DESC'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 312
    Top = 392
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
    object DateTimeField4: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Origin = '"HISTCARTINV".DATAMOVCARTINV'
    end
    object FloatField37: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = '"HISTCARTINV".IDCARTEIRAINVEST'
    end
    object FloatField38: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
      Origin = '"HISTCARTINV".SALDOCOTASCARTINV'
    end
    object FloatField39: TFloatField
      FieldName = 'SALDOVLRCARTINV'
      Origin = '"HISTCARTINV".SALDOVLRCARTINV'
    end
    object FloatField40: TFloatField
      FieldName = 'SALDOQTDEINVCART'
      Origin = '"HISTCARTINV".SALDOQTDEINVCART'
    end
    object FloatField41: TFloatField
      FieldName = 'SALDOVLRINVCART'
      Origin = '"HISTCARTINV".SALDOVLRINVCART'
    end
    object FloatField42: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
  end
  object qryAtualizaSaldoCNull: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  HC.IDHISTCARTINV, HC.IDINVESTIMENTO, HC.IDLOTE, HC.NATURMOVOPE' +
        'R,'
      '  HC.IDOPERACAOINVEST, HC.SALDOCOTASCARTINV, HC.SALDOVLRCARTINV,'
      '  HC.VLRMOVCARTINV, HC.COTASMOVCARTINV, HC.NATURMOVCARTINV,'
      '  HC.IDDESPOPERINVEST, HC.FLGCALCSALDO,  HC.TIPMOVCARTINV,'
      
        '  HC.QTDEMOVINVCART, HC.DATAMOVCARTINV, HC.IDCARTEIRAINVEST, HC.' +
        'IDCARTEIRAGERENC,'
      
        '  HC.IDTIPOINVEST, HC.MOVIMAQUI, HC.IDTIPOOPERACAO AS IDTIPOOPER' +
        'HIST,'
      '  DO.IDTIPOOPERACAO,  DO.FLGCALCDIARIO,DO.IDTIPODESPINVEST'
      'FROM'
      '   HISTCARTINV HC, DESPOPERINVEST DO'
      'WHERE'
      '   (HC.IDCARTEIRAINVEST =:IDCARTEIRA)'
      ''
      '   AND'
      '  (HC.IDCARTEIRAGERENC  IS NULL)'
      ''
      '   AND ( (HC.DATAMOVCARTINV > :DATAMOV) OR'
      '              ((HC.DATAMOVCARTINV = :DATAMOV)  AND'
      '               (HC.IDHISTCARTINV >=:IDHISTORICO)) ) AND'
      '  (HC.IDDESPOPERINVEST = DO.IDDESPOPERINVEST(+))'
      'ORDER BY'
      '   DATAMOVCARTINV, IDHISTCARTINV'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updAtualizaSaldoC
    ValidateWithMask = True
    Left = 192
    Top = 392
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
    object FloatField14: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'HISTCARTINV.IDOPERACAOINVEST'
    end
    object FloatField15: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
      Origin = 'HISTCARTINV.SALDOCOTASCARTINV'
    end
    object FloatField16: TFloatField
      FieldName = 'SALDOVLRCARTINV'
      Origin = 'HISTCARTINV.SALDOVLRCARTINV'
    end
    object FloatField17: TFloatField
      FieldName = 'VLRMOVCARTINV'
      Origin = 'HISTCARTINV.VLRMOVCARTINV'
    end
    object FloatField18: TFloatField
      FieldName = 'COTASMOVCARTINV'
      Origin = 'HISTCARTINV.COTASMOVCARTINV'
    end
    object StringField3: TStringField
      FieldName = 'NATURMOVCARTINV'
      Size = 1
    end
    object FloatField19: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object StringField4: TStringField
      FieldName = 'FLGCALCSALDO'
      Size = 1
    end
    object FloatField20: TFloatField
      FieldName = 'IDDESPOPERINVEST'
      Origin = 'HISTCARTINV.IDDESPOPERINVEST'
    end
    object FloatField21: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCARTINV.IDINVESTIMENTO'
    end
    object StringField5: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCARTINV.IDLOTE'
      Size = 10
    end
    object FloatField22: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object FloatField23: TFloatField
      FieldName = 'FLGCALCDIARIO'
    end
    object StringField6: TStringField
      FieldName = 'NATURMOVOPER'
      Size = 1
    end
    object StringField7: TStringField
      FieldName = 'TIPMOVCARTINV'
      Size = 3
    end
    object FloatField30: TFloatField
      FieldName = 'QTDEMOVINVCART'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object FloatField31: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object FloatField32: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object FloatField33: TFloatField
      FieldName = 'IDTIPODESPINVEST'
    end
    object FloatField34: TFloatField
      FieldName = 'MOVIMAQUI'
    end
    object FloatField35: TFloatField
      FieldName = 'IDTIPOOPERHIST'
    end
    object FloatField36: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
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
      '  HC.IDDESPOPERINVEST, HC.FLGCALCSALDO,  HC.TIPMOVCARTINV,'
      
        '  HC.QTDEMOVINVCART, HC.DATAMOVCARTINV, HC.IDCARTEIRAINVEST, HC.' +
        'IDCARTEIRAGERENC,'
      
        '  HC.IDTIPOINVEST, HC.MOVIMAQUI, HC.IDTIPOOPERACAO AS IDTIPOOPER' +
        'HIST,'
      '  DO.IDTIPOOPERACAO,  DO.FLGCALCDIARIO,DO.IDTIPODESPINVEST'
      'FROM'
      '   HISTCARTINV HC, DESPOPERINVEST DO'
      'WHERE'
      '   (HC.IDCARTEIRAINVEST =:IDCARTEIRA)'
      ''
      '   AND'
      '  (HC.IDCARTEIRAGERENC  =:IDCARTEIRAGERENC)'
      ''
      '   AND ( (HC.DATAMOVCARTINV > :DATAMOV) OR'
      '              ((HC.DATAMOVCARTINV = :DATAMOV)  AND'
      '               (HC.IDHISTCARTINV >=:IDHISTORICO)) ) AND'
      '  (HC.IDDESPOPERINVEST = DO.IDDESPOPERINVEST(+))'
      'ORDER BY'
      '   DATAMOVCARTINV, IDHISTCARTINV'
      ' ')
    ValidateWithMask = True
    Left = 440
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
    object qryAtualizaSaldoCNATURMOVCARTINV: TStringField
      FieldName = 'NATURMOVCARTINV'
      Size = 1
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
    object qryAtualizaSaldoCIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryAtualizaSaldoCIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
    end
    object qryAtualizaSaldoCMOVIMAQUI: TFloatField
      FieldName = 'MOVIMAQUI'
    end
    object qryAtualizaSaldoCIDTIPOOPERHIST: TFloatField
      FieldName = 'IDTIPOOPERHIST'
    end
    object qryAtualizaSaldoCIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
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
      '  HC.SALDOQTDEINVCART, HC.SALDOVLRINVCART,HC.IDTIPOINVEST,'
      
        '  HC.VLRMOVCARTINV, HC.COTASMOVCARTINV, HC.NATURMOVCARTINV, HC.Q' +
        'TDEMOVINVCART,'
      
        '  HC.MOVIMATU, HC.SALDOATU, HC.MOVIMCAR, HC.SALDOCAR, HC.MOVIMAQ' +
        'UI, HC.SALDOAQUI, HC.SALDOREND,'
      
        '  HC.FLGCALCSALDO, HC.TIPMOVCARTINV, DE.IDTIPOOPERACAO,  DE.FLGC' +
        'ALCDIARIO, DE.IDTIPODESPINVEST,'
      
        '  HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO, H' +
        'C.IDLOTE, HC.VLRJUROS,'
      
        '  HC.VLRVARIACAO, HC.VLRIRPROV, HC.VLRIRAPU, HC.VLRIOFPROV, HC.V' +
        'LRIOFAPU, HC.VLRAGIO,'
      '  HC.IDTIPOOPERACAO AS IDTIPOOPERHIST, TP.FLGCONTAINVEST'
      ''
      
        'FROM HISTCARTINV HC, OPERACAOINVEST OP, DESPOPERINVEST DE, TIPOO' +
        'PERACAO TP'
      ''
      
        'WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (HC.IDCARTEIRAINVEST =:IDCARTEIRA)'
      
        '  AND (((:IDCARTEIRAGERENC IS NOT NULL) AND (HC.IDCARTEIRAGERENC' +
        ' = :IDCARTEIRAGERENC))   OR'
      '        (:IDCARTEIRAGERENC IS NULL) )'
      '  AND (HC.IDINVESTIMENTO =:IDINVESTIMENTO)'
      '  AND ( (HC.DATAMOVCARTINV > :DATAMOV) OR'
      
        '        ( (HC.DATAMOVCARTINV = :DATAMOV)  AND (HC.IDHISTCARTINV ' +
        '>= :IDHISTORICO) ) )'
      '  AND ( (HC.DATAMOVCARTINV  < :DATAMOVPROX) OR'
      
        '        ((HC.DATAMOVCARTINV = :DATAMOVPROX) AND (HC.IDHISTCARTIN' +
        'V >= :IDHISTORICO)) )'
      
        '  AND (((:IDLOTE IS NOT NULL) AND (HC.IDLOTE =:IDLOTE)) OR ((:ID' +
        'LOTE IS NULL) AND (HC.IDLOTE IS NULL)))'
      '  AND (HC.IDOPERACAOINVEST'#9'= OP.IDOPERACAOINVEST(+))'
      '  AND (HC.IDDESPOPERINVEST = DE.IDDESPOPERINVEST(+))'
      '  AND (HC.IDTIPOOPERACAO = TP.IDTIPOOPERACAO(+))'
      ''
      'ORDER BY DATAMOVCARTINV, IDHISTCARTINV'
      ' ')
    ValidateWithMask = True
    Left = 64
    Top = 392
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
        Name = 'IDCARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVPROX'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVPROX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTORICO'
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
    object qryAtualizaSaldoILIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryAtualizaSaldoILIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
    end
    object qryAtualizaSaldoILIDTIPOOPERHIST: TFloatField
      FieldName = 'IDTIPOOPERHIST'
    end
    object qryAtualizaSaldoILIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryAtualizaSaldoILFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
  end
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
      ''
      '   AND'
      '       (IDCARTEIRAGERENC = :IDCARTEIRAGERENC)'
      ''
      '   AND ( (DATAMOVCARTINV < :DATAMOV) OR'
      '              ((DATAMOVCARTINV = :DATAMOV)  AND'
      '               (IDHISTCARTINV <:IDHISTORICO)) )'
      '   AND (SALDOVLRCARTINV IS NOT NULL)'
      'ORDER BY'
      '   DATAMOVCARTINV DESC, IDHISTCARTINV DESC')
    ValidateWithMask = True
    Left = 192
    Top = 105
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
      Origin = '"HISTCARTINV".DATAMOVCARTINV'
    end
    object qrySaldoCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = '"HISTCARTINV".IDCARTEIRAINVEST'
    end
    object qrySaldoCarteiraSALDOCOTASCARTINV: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
      Origin = '"HISTCARTINV".SALDOCOTASCARTINV'
    end
    object qrySaldoCarteiraSALDOVLRCARTINV: TFloatField
      FieldName = 'SALDOVLRCARTINV'
      Origin = '"HISTCARTINV".SALDOVLRCARTINV'
    end
    object qrySaldoCarteiraSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
      Origin = '"HISTCARTINV".SALDOQTDEINVCART'
    end
    object qrySaldoCarteiraSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
      Origin = '"HISTCARTINV".SALDOVLRINVCART'
    end
    object qrySaldoCarteiraIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
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
    Left = 312
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
  object qryInsOperCustodia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OPERCUSTODIA'
      
        '(IDOPERCUSTODIA,    IDCUSTODIAORIG,    IDCUSTODIADEST, IDHISTCAR' +
        'TINVORIG, IDHISTCARTINVDEST,'
      
        ' IDCARTEIRAORIG,    IDCARTEIRADEST,    DATAMOVCUSTOD,  IDINVESTI' +
        'MENTO,    IDLOTE,'
      
        ' IDCUSTODIANTEORIG, IDCUSTODIANTEDEST, QUANTIDADE,     IDMOTIVOB' +
        'LOQORIG, IDMOTIVOBLOQDEST,'
      
        ' IDBOLETA,          IDPLANPREVCTBPATR, IDTIPOOPERACAO, IDPLANPRE' +
        'VCTBDEST)'
      'VALUES'
      
        '(:IDOPERCUSTODIA,    :IDCUSTODIAORIG,    :IDCUSTODIADEST, :IDHIS' +
        'TCARTINVORIG, :IDHISTCARTINVDEST,'
      
        ' :IDCARTEIRAORIG,    :IDCARTEIRADEST,    :DATAMOVCUSTOD,  :IDINV' +
        'ESTIMENTO,    :IDLOTE,'
      
        ' :IDCUSTODIANTEORIG, :IDCUSTODIANTEDEST, :QUANTIDADE,     :IDMOT' +
        'IVOBLOQORIG,  :IDMOTIVOBLOQDEST,'
      
        ' :IDBOLETA,          :IDPLANPREVCTBPATR, :IDTIPOOPERACAO, :IDPLA' +
        'NPREVCTBDEST)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 94
    Top = 346
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCUSTODIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIAORIG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIADEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINVORIG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINVDEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAORIG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRADEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVCUSTOD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTEORIG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTEDEST'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQORIG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQDEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBDEST'
        ParamType = ptUnknown
      end>
  end
  object qryUpdOperCustodia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERCUSTODIA SET'
      
        '   IDCUSTODIAORIG    = DECODE(SIGN(NVL(:IDCUSTODIAORIG,0)), 1, :' +
        'IDCUSTODIAORIG, IDCUSTODIAORIG),'
      
        '   IDCUSTODIADEST    = DECODE(SIGN(NVL(:IDCUSTODIADEST,0)), 1, :' +
        'IDCUSTODIADEST, IDCUSTODIADEST),'
      
        '   IDHISTCARTINVORIG = DECODE(SIGN(NVL(:IDHISTCARTINVORIG,0)), 1' +
        ', :IDHISTCARTINVORIG, IDHISTCARTINVORIG),'
      
        '   IDHISTCARTINVDEST = DECODE(SIGN(NVL(:IDHISTCARTINVDEST,0)), 1' +
        ', :IDHISTCARTINVDEST, IDHISTCARTINVDEST)'
      'WHERE'
      '   IDOPERCUSTODIA = :IDOPERCUSTODIA')
    ValidateWithMask = True
    Left = 64
    Top = 331
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCUSTODIAORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIAORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIADEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIADEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINVORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINVORIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINVDEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINVDEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCUSTODIA'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaAplicacaoRF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDOPERACAOINVEST,PUMERCADO,PRECOUNITOPERACAO,DATAOPERACAO'
      'FROM'
      '   OPERACAOINVEST'
      'WHERE'
      '   IDOPERACAOINVEST = (SELECT'
      '                          IDOPERACAOINVEST'
      '                       FROM'
      '                          HISTCARTINV'
      '                       WHERE'
      '                          IDINVESTIMENTO = :IDINVESTIMENTO AND'
      '                          IDLOTE = :IDLOTE AND'
      '                          NATURMOVCARTINV = '#39'A'#39' AND'
      '                          TIPMOVCARTINV IN ('#39'INI'#39','#39'OPE'#39') )')
    ValidateWithMask = True
    Left = 440
    Top = 55
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end>
    object qryBuscaAplicacaoRFIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaAplicacaoRFPUMERCADO: TFloatField
      FieldName = 'PUMERCADO'
    end
    object qryBuscaAplicacaoRFPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryBuscaAplicacaoRFDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
  end
  object QryBuscaOperPendentes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(QTDEOPERACAO) AS QTDEOPERACAO'
      'FROM   OPERACAOINVEST'
      'WHERE  IDOPERACAOORIGEM = :IDOPERACAOORIGEM'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 440
    Top = 391
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptResult
      end>
  end
end
