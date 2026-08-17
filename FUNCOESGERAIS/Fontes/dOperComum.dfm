object dtmOperComum: TdtmOperComum
  Left = 12
  Top = 128
  Height = 403
  Width = 713
  object qrySaldoCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTCARTINV, DATAMOVCARTINV, IDCARTEIRAINVEST,'
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
      '   ('
      '   ( (DATAMOVCARTINV <:DATAMOV) )'
      '   OR'
      
        '   ( (DATAMOVCARTINV =:DATAMOV) AND (IDHISTCARTINV <:HISTORICO) ' +
        ')'
      '   )'
      '   AND (SALDOVLRCARTINV IS NOT NULL)'
      ''
      'ORDER BY'
      '   DATAMOVCARTINV DESC, IDHISTCARTINV DESC')
    Params.Data = {
      010004000843415254454952410003040000000000000007444154414D4F5600
      0B080000002C845D40CB42000007444154414D4F56000B080000002C845D40CB
      42000009484953544F5249434F00030400000000000000}
    ValidateWithMask = True
    Left = 432
    Top = 194
    object qrySaldoCarteiraIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = '"CM.HISTCARTINV".IDHISTCARTINV'
    end
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
  end
  object qryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FLGGERACONTAB, FLGGERACAPCAR, CODTIPDOC,'
      '   RECPAG, NATUREZAOPERACAO   '
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   ( IDTIPOINVEST =:TIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:TIPOOERACAO ) ')
    Params.Data = {
      010002000A5449504F494E56455354000304000000000000000B5449504F4F45
      524143414F00030400000000000000}
    ValidateWithMask = True
    Left = 184
    Top = 174
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
  end
  object qryLancaDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 184
    Top = 32
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 640
    Top = 296
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
    Params.Data = {
      010003000A5449504F494E56455354000304000000000000000B5449504F4F45
      524143414F000304000000000000000B5449504F444553504553410003040000
      0000000000}
    ValidateWithMask = True
    Left = 184
    Top = 162
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
    Params.Data = {0100010005504C414E4F00030400000000000000}
    ValidateWithMask = True
    Left = 184
    Top = 20
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
      '   IDCARTEIRAINVEST, IDINVESTIMENTO, IDLOTE,  FLGCALCSALDO'
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
    Left = 304
    Top = 164
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
      ''
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
      '')
    Params.Data = {
      010004000843415254454952410003040000000000000007444154414D4F5600
      0B080000002C845D40CB42000007444154414D4F56000B080000002C845D40CB
      42000009484953544F5249434F00030400000000000000}
    ValidateWithMask = True
    Left = 304
    Top = 20
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
  end
  object qryFlgAtualSaldo2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDHISTCARTINV, DATAMOVCARTINV, IDLOTE,'
      '   IDCARTEIRAINVEST, IDINVESTIMENTO, FLGCALCSALDO'
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
      '')
    ValidateWithMask = True
    Left = 304
    Top = 152
    object qryFlgAtualSaldo2IDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = '"CM.HISTCARTINV".IDHISTCARTINV'
    end
    object qryFlgAtualSaldo2DATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Origin = '"CM.HISTCARTINV".DATAMOVCARTINV'
    end
    object qryFlgAtualSaldo2IDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = '"CM.HISTCARTINV".IDLOTE'
      Size = 10
    end
    object qryFlgAtualSaldo2IDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = '"CM.HISTCARTINV".IDCARTEIRAINVEST'
    end
    object qryFlgAtualSaldo2IDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = '"CM.HISTCARTINV".IDINVESTIMENTO'
    end
    object qryFlgAtualSaldo2FLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = '"CM.HISTCARTINV".FLGCALCSALDO'
      Size = 1
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
    Params.Data = {
      010003000B454D5052455341464F524E0003040000000000000006464F52434C
      490003040000000000000005504C414E4F00030400000000000000}
    ValidateWithMask = True
    Left = 184
    Top = 100
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
    Params.Data = {
      010003000B454D5052455341464F524E0003040000000000000006464F52434C
      490003040000000000000005504C414E4F00030400000000000000}
    ValidateWithMask = True
    Left = 184
    Top = 88
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
    Params.Data = {
      0100020005504C414E4F0003040000000000010005434F4E5441000102003000
      0100}
    ValidateWithMask = True
    Left = 184
    Top = 8
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
      '   H.IDOPERACAOINVEST, H.IDDESPOPERINVEST,'
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
      '   H.DATAMOVCARTINV, H.IDHISTCARTINV')
    Params.Data = {
      01000800084341525445495241000304000000000000000C494E56455354494D
      454E544F00030400000000000000044C4F54450001020030000000044C4F5445
      0001020030000000044C4F5445000102003000000007444154414D4F56000B08
      0000002C845D40CB42000007444154414D4F56000B080000002C845D40CB4200
      0009484953544F5249434F00030400000000000000}
    ValidateWithMask = True
    Left = 304
    Top = 92
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
  end
  object qrySaldoInvestimentoT: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H1.IDHISTCARTINV, H1.IDCARTEIRAINVEST, H1.DATAMOVCARTINV,'
      ''
      '   H1.SALDOCOTASCARTINV,'
      '   H1.SALDOVLRCARTINV,'
      '   H1.SALDOQTDEINVCART,'
      '   H1.SALDOVLRINVCART,'
      '   H1.SALDOATU,'
      '   H1.SALDOCAR,'
      '   H1.SALDOAQUI,'
      '   H1.SALDOREND,'
      '   H1.SALDOVARIACAO,'
      '   H1.SALDOJUROS,'
      '   H1.SALDOPREMIO,'
      '   H1.SALDOIRPROV,'
      '   H1.SALDOIRAPU,'
      '   H1.SALDOIOFPROV,'
      '   H1.SALDOIOFAPU,'
      '   H1.SALDOAGIO'
      ''
      'FROM'
      '   HISTCARTINV H1'
      ''
      'WHERE'
      '   ( IDCARTEIRAINVEST =:CARTEIRA )'
      '   AND ( IDINVESTIMENTO =:INVESTIMENTO )'
      '   AND'
      '   ('
      '   ( (:LOTE IS NOT NULL) AND (IDLOTE =:LOTE) )'
      '   OR'
      '   ( (:LOTE IS NULL) AND (IDLOTE IS NULL) )'
      '   )'
      ''
      '   AND (H1.DATAMOVCARTINV ='
      '         ('
      '         SELECT'
      '            MAX(H2.DATAMOVCARTINV)'
      '         FROM'
      '            HISTCARTINV H2'
      '         WHERE'
      '            ( H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST )'
      '            AND ( H2.IDINVESTIMENTO = H1.IDINVESTIMENTO )'
      '            AND'
      '            ('
      
        '            ( (H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE = H1.IDLOTE' +
        ') )'
      '            OR'
      '            ( (H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL) )'
      '            )'
      '            AND'
      '            ('
      '            ( (H2.DATAMOVCARTINV <:DATAMOV) )'
      '            OR'
      
        '            ( (H2.DATAMOVCARTINV =:DATAMOV) AND (H2.IDHISTCARTIN' +
        'V <:HISTORICO) )'
      '            )'
      '         )'
      '       )'
      ''
      '   AND (H1.IDHISTCARTINV ='
      '         ('
      '         SELECT'
      '            MAX(H3.IDHISTCARTINV)'
      '         FROM'
      '            HISTCARTINV H3'
      '         WHERE'
      '            ( H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST )'
      '            AND ( H3.IDINVESTIMENTO = H1.IDINVESTIMENTO )'
      '            AND'
      '            ('
      
        '            ( (H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOTE)' +
        ' )'
      '            OR'
      '            ( (H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL) )'
      '            )'
      '            AND'
      '            ( (H3.DATAMOVCARTINV = H1.DATAMOVCARTINV) )'
      '            AND'
      
        '            ( (H3.DATAMOVCARTINV <:DATAMOV) OR (H3.IDHISTCARTINV' +
        ' <:HISTORICO) )'
      '            )'
      '         )'
      ''
      '   AND ( SALDOVLRINVCART IS NOT NULL )'
      ''
      'ORDER BY'
      '   DATAMOVCARTINV DESC, IDHISTCARTINV DESC'
      ''
      '')
    Params.Data = {
      01000A00084341525445495241000304000000000000000C494E56455354494D
      454E544F00030400000000000000044C4F54450001020030000000044C4F5445
      0001020030000000044C4F5445000102003000000007444154414D4F56000B08
      0000002C845D40CB42000007444154414D4F56000B080000002C845D40CB4200
      0009484953544F5249434F0003040000000000000007444154414D4F56000B08
      0000002C845D40CB42000009484953544F5249434F00030400000000000000}
    ValidateWithMask = True
    Left = 432
    Top = 182
    object qrySaldoInvestimentoTIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qrySaldoInvestimentoTIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qrySaldoInvestimentoTDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qrySaldoInvestimentoTSALDOCOTASCARTINV: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
    end
    object qrySaldoInvestimentoTSALDOVLRCARTINV: TFloatField
      FieldName = 'SALDOVLRCARTINV'
    end
    object qrySaldoInvestimentoTSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qrySaldoInvestimentoTSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
    end
    object qrySaldoInvestimentoTSALDOATU: TFloatField
      FieldName = 'SALDOATU'
    end
    object qrySaldoInvestimentoTSALDOCAR: TFloatField
      FieldName = 'SALDOCAR'
    end
    object qrySaldoInvestimentoTSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object qrySaldoInvestimentoTSALDOREND: TFloatField
      FieldName = 'SALDOREND'
    end
    object qrySaldoInvestimentoTSALDOVARIACAO: TFloatField
      FieldName = 'SALDOVARIACAO'
    end
    object qrySaldoInvestimentoTSALDOJUROS: TFloatField
      FieldName = 'SALDOJUROS'
    end
    object qrySaldoInvestimentoTSALDOPREMIO: TFloatField
      FieldName = 'SALDOPREMIO'
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
      '   MOESIGLA,MOEPERIODICIDADE, FLGPERCVALOR'
      'FROM'
      '  MOEDA'
      'WHERE'
      '  ( MOECODIGO =:MOEDA )'
      '')
    Params.Data = {01000100054D4F45444100030400000000000000}
    ValidateWithMask = True
    Left = 184
    Top = 225
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
    Params.Data = {
      010021000D49444849535443415254494E560003040000000000000008434152
      5445495241000304000000000000000C494E56455354494D454E544F00030400
      0000000000000D44455350455341494E56455354000304000000000000000B44
      4553504553414341525400030400000000000000084F5045524143414F000304
      000000000000000A5449504F494E564553540003040000000000000008544950
      4F4F504552000304000000000000000444415441000B080000002C845D40CB42
      0000094D4F56494D454E544F000608000000000000000000000005434F544153
      0006080000000000000000000000044C4F544500010200300000000B464C4743
      5553544F44494100010200300000000E484953544D4F5643415254494E560001
      0200300000000F4E415455524D4F5643415254494E5600010200300000000D54
      49504D4F5643415254494E5600010200300000000C464C4743414C4353414C44
      4F00010200300000000B454D505245534150524F500003040000000000000006
      4D4F44554C4F0003040000000000000008504C414E494C484100030400000000
      00000009444F43554D454E544F0003040000000000000005504C414E4F000304
      000000000000000A5155414E5449444144450006080000000000000000000000
      0C4E415455524D4F564F50455200010200300000000652454350414700010200
      300000000A4C414E43414D454E544F0003040000000000000008564C524A5552
      4F5300060800000000000000000000000B564C52564152494143414F00060800
      0000000000000000000009564C52495250524F56000608000000000000000000
      000008564C52495241505500060800000000000000000000000A564C52494F46
      50524F56000608000000000000000000000009564C52494F4641505500060800
      0000000000000000000007564C524147494F0006080000000000000000000000}
    ValidateWithMask = True
    Left = 432
    Top = 66
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
    Params.Data = {01000100084F5045524143414F00030400000000000000}
    ValidateWithMask = True
    Left = 552
    Top = 184
    object qryBuscaHistPorOperIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = '"CM.HISTCARTINV".IDHISTCARTINV'
    end
    object qryBuscaHistPorOperFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = '"CM.HISTCARTINV".FLGCALCSALDO'
      Size = 1
    end
    object qryBuscaHistPorOperIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = '"CM.HISTCARTINV".IDCARTEIRAINVEST'
    end
    object qryBuscaHistPorOperIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = '"CM.HISTCARTINV".IDINVESTIMENTO'
    end
    object qryBuscaHistPorOperIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = '"CM.HISTCARTINV".IDLOTE'
      Size = 10
    end
    object qryBuscaHistPorOperDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Origin = '"CM.HISTCARTINV".DATAMOVCARTINV'
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
    Params.Data = {0100010009484953544F5249434F00030400000000000000}
    ValidateWithMask = True
    Left = 552
    Top = 172
    object qryBuscaHistPorHistIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = '"CM.HISTCARTINV".IDHISTCARTINV'
    end
    object qryBuscaHistPorHistFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = '"CM.HISTCARTINV".FLGCALCSALDO'
      Size = 1
    end
    object qryBuscaHistPorHistIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = '"CM.HISTCARTINV".IDCARTEIRAINVEST'
    end
    object qryBuscaHistPorHistIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = '"CM.HISTCARTINV".IDINVESTIMENTO'
    end
    object qryBuscaHistPorHistIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = '"CM.HISTCARTINV".IDLOTE'
      Size = 10
    end
    object qryBuscaHistPorHistDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Origin = '"CM.HISTCARTINV".DATAMOVCARTINV'
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
    Params.Data = {
      010004000843415254454952410003040000000000000007444154414D4F5600
      0B080000002C845D40CB42000007444154414D4F56000B080000002C845D40CB
      42000009484953544F5249434F00030400000000000000}
    ValidateWithMask = True
    Left = 552
    Top = 160
    object qryBuscaProxHistCartIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = '"CM.HISTCARTINV".IDHISTCARTINV'
    end
    object qryBuscaProxHistCartIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = '"CM.HISTCARTINV".IDCARTEIRAINVEST'
    end
    object qryBuscaProxHistCartIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = '"CM.HISTCARTINV".IDINVESTIMENTO'
    end
    object qryBuscaProxHistCartIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = '"CM.HISTCARTINV".IDLOTE'
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
    Params.Data = {
      0100020004464C4147000102003000000009484953544F5249434F0003040000
      0000000000}
    ValidateWithMask = True
    Left = 432
    Top = 256
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
    Params.Data = {
      01000800084341525445495241000304000000000000000C494E56455354494D
      454E544F00030400000000000000044C4F54450001020030000000044C4F5445
      0001020030000000044C4F5445000102003000000007444154414D4F56000B08
      0000002C845D40CB42000007444154414D4F56000B080000002C845D40CB4200
      0009484953544F5249434F00030400000000000000}
    ValidateWithMask = True
    Left = 552
    Top = 148
    object qryBuscaProxInvestIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = '"CM.HISTCARTINV".IDHISTCARTINV'
    end
    object qryBuscaProxInvestIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = '"CM.HISTCARTINV".IDINVESTIMENTO'
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
    Params.Data = {01000100074445535045534100030400000000000000}
    ValidateWithMask = True
    Left = 552
    Top = 96
    object qryBuscaHistDespIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = '"CM.HISTCARTINV".IDHISTCARTINV'
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
    Params.Data = {01000100084F5045524143414F00030400000000000000}
    ValidateWithMask = True
    Left = 552
    Top = 84
    object qryBuscaHistOperIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = '"CM.HISTCARTINV".IDHISTCARTINV'
    end
    object qryBuscaHistOperVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
      Origin = '"CM.HISTCARTINV".VLRMOVCARTINV'
    end
    object qryBuscaHistOperQTDEMOVINVCART: TFloatField
      FieldName = 'QTDEMOVINVCART'
      Origin = '"CM.HISTCARTINV".QTDEMOVINVCART'
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
    Params.Data = {
      010002000A5449504F494E5645535400030400000000000000085449504F4F50
      455200030400000000000000}
    ValidateWithMask = True
    Left = 432
    Top = 120
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
      '   FLGCALCSALDO     = '#39'1'#39
      'WHERE'
      '   IDDESPOPERINVEST =:DESPESA'
      '')
    Params.Data = {
      01000C000444415441000B080000002C845D40CB420000094D4F56494D454E54
      4F00060800000000000000000000000A5155414E544944414445000608000000
      00000000000000000B564C52564152494143414F000608000000000000000000
      000008564C524A55524F53000608000000000000000000000009564C52495250
      524F56000608000000000000000000000008564C524952415055000608000000
      00000000000000000A564C52494F4650524F5600060800000000000000000000
      0009564C52494F46415055000608000000000000000000000007564C52414749
      4F000608000000000000000000000005434F5441530006080000000000000000
      000000074445535045534100030400000000000000}
    ValidateWithMask = True
    Left = 432
    Top = 54
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
      '   FLGCALCSALDO     = '#39'1'#39
      'WHERE'
      '   ( IDOPERACAOINVEST =:OPERACAO )'
      '   AND ( IDDESPOPERINVEST IS NULL )'
      '')
    Params.Data = {
      01000C000444415441000B080000002C845D40CB420000094D4F56494D454E54
      4F00060800000000000000000000000A5155414E544944414445000608000000
      00000000000000000B564C52564152494143414F000608000000000000000000
      000008564C524A55524F53000608000000000000000000000009564C52495250
      524F56000608000000000000000000000008564C524952415055000608000000
      00000000000000000A564C52494F4650524F5600060800000000000000000000
      0009564C52494F46415055000608000000000000000000000007564C52414749
      4F000608000000000000000000000005434F5441530006080000000000000000
      000000084F5045524143414F00030400000000000000}
    ValidateWithMask = True
    Left = 432
    Top = 42
  end
  object qryParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPARAMINVEST,'
      ''
      '   MASCSETOREMISSOR, MOECODIGO, MASCCLASSIFINV,'
      '   VLRDIVERG, VLRCOTAINICART, DATAULTFECH,'
      '   FLGORDMOVINV, PERCPUORDMOVINV, PERCIMPRENDA,'
      '   MOEDAATU, PERCPARTICEMPR, PERCPARTICRECUR,'
      '   IDPARAMPATRLIQ, TIPOMENU, DATAULTFECHRF,'
      '   IDTIPODESPIRAPU, IDTIPODESPINVEST, MOEDAGER,'
      '   FLGPROVISIONAIRRF, FLGPROVISIONAIRRV, PUCDB,'
      '   DATAMOVCDBLIB, IDTIPODESPIRPROV, MOEDAATULIT,'
      '   IDPROGRAMA'
      ''
      'FROM'
      '   PARAMINVEST')
    ValidateWithMask = True
    Left = 552
    Top = 240
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
      Size = 1
    end
    object qryParamInvestFLGPROVISIONAIRRV: TStringField
      FieldName = 'FLGPROVISIONAIRRV'
      Origin = 'PARAMINVEST.FLGPROVISIONAIRRV'
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
  end
  object qryBuscaHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H.IDHISTCARTINV, H.FLGCALCSALDO, H.IDCARTEIRAINVEST,'
      '   H.IDINVESTIMENTO, H.IDLOTE, H.DATAMOVCARTINV,'
      '   H.PLANO, H.PLNCODIGO, H.CODDOCUMENTO'
      'FROM'
      '   HISTCARTINV H'
      'WHERE'
      '   H.IDHISTCARTINV =:HISTORICO OR'
      '   H.IDOPERACAOINVEST =:OPERACAO'
      'ORDER BY'
      '   IDHISTCARTINV DESC'
      '')
    Params.Data = {
      0100020009484953544F5249434F00030400000000000000084F504552414341
      4F00030400000000000000}
    ValidateWithMask = True
    Left = 552
    Top = 24
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
    Params.Data = {01000100084F5045524143414F00030400000000000000}
    ValidateWithMask = True
    Left = 552
    Top = 12
    object qryBuscaHistTransfVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
      Origin = '"CM.HISTCARTINV".VLRMOVCARTINV'
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
    Params.Data = {
      010006000A53414C444F56414C4F5200060800000000000000000000000E5641
      4C4F524D4F56494D454E544F00060800000000000000000000000E434F544153
      4D4F56494D454E544F00060800000000000000000000000A53414C444F434F54
      4153000608000000000000000000000004464C41470001020030000000094849
      53544F5249434F00030400000000000000}
    ValidateWithMask = True
    Left = 432
    Top = 30
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
    Params.Data = {0100010009484953544F5249434F00030400000000000000}
    ValidateWithMask = True
    Left = 192
    Top = 288
    object FloatField4: TFloatField
      FieldName = 'VLRMOVCARTINV'
      Origin = '"CM.HISTCARTINV".VLRMOVCARTINV'
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
    Params.Data = {01000100084F5045524143414F00030400000000000000}
    ValidateWithMask = True
    Left = 552
    Top = 72
    object qryBuscaTotDespVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
      Origin = '"CM.HISTCARTINV".VLRMOVCARTINV'
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
    Params.Data = {
      010003000556414C4F52000608000000000000000000000004464C4147000102
      003000000009484953544F5249434F00030400000000000000}
    ValidateWithMask = True
    Left = 432
    Top = 244
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
    Params.Data = {
      01001B000F53414C444F51544445494E56455354000608000000000000000000
      00001053414C444F56414C4F52494E5645535400060800000000000000000000
      00114D4F56494D454E544F415455415249414C00060800000000000000000000
      000D53414C444F415455415249414C0006080000000000000000000000114D4F
      56494D454E544F434152544549524100060800000000000000000000000D5341
      4C444F43415254454952410006080000000000000000000000124D4F56494D45
      4E544F41515549534943414F00060800000000000000000000000E53414C444F
      41515549534943414F00060800000000000000000000000F53414C444F52454E
      44494D454E544F00060800000000000000000000000D53414C444F5641524941
      43414F00060800000000000000000000000A53414C444F4A55524F5300060800
      00000000000000000000114D4F56494D454E544F564152494143414F00060800
      000000000000000000000E4D4F56494D454E544F4A55524F5300060800000000
      000000000000000F4D4F56494D454E544F5052454D494F000608000000000000
      00000000000B53414C444F5052454D494F00060800000000000000000000000F
      4D4F56494D454E544F495250524F5600060800000000000000000000000B5341
      4C444F495250524F5600060800000000000000000000000E4D4F56494D454E54
      4F495241505500060800000000000000000000000A53414C444F495241505500
      06080000000000000000000000104D4F56494D454E544F494F4650524F560006
      0800000000000000000000000C53414C444F494F4650524F5600060800000000
      000000000000000F4D4F56494D454E544F494F46415055000608000000000000
      00000000000B53414C444F494F4641505500060800000000000000000000000D
      4D4F56494D454E544F4147494F00060800000000000000000000000953414C44
      4F4147494F000608000000000000000000000004464C41470001020030000000
      09484953544F5249434F00030400000000000000}
    ValidateWithMask = True
    Left = 432
    Top = 18
  end
  object qryPadrLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPESSOA,'
      '   IDPADRLANCCONT,'
      ''
      '   IDTIPOINVEST, IDTIPOOPERACAO, IDTIPODESPINVEST,'
      '   IDCARTEIRAINVEST, CODTIPTITULO,'
      '   IDINVESTIMENTO,'
      '   IDFORCLI,'
      ''
      '   FLGPAGRECNAO, RECPAG,'
      '   CODCENTRORESPON, CODTIPRECDES, UNIDNEGOC,'
      ''
      '   PLANO, CONTADOPERFIN, CONTACOPERFIN,'
      '   CENCUSTDINVEST, CENCUSTCINVEST, IDEMPRESA,'
      '   CODSUBCONTAD, CODSUBCONTAC,'
      '   TIPCODIGO,'
      ''
      '   TIPMOVCARTINV, TIPLANCINVEST, HISTLANCINVEST,'
      '   IDREGRALANCONTINV, TIPFORNINV'
      ''
      'FROM'
      '   PADRLANCCONTINV'
      ''
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP )'
      '   AND ( IDEMPRESA =:EMPRESAPROP )'
      '   AND ( TIPMOVCARTINV =:TIPOMOV )'
      '   AND ( IDTIPOINVEST =:TIPOINVEST )'
      ''
      '   AND'
      '   (  ( (:TIPOLANC IS NOT NULL) AND (TIPLANCINVEST =:TIPOLANC) )'
      '   OR   (:TIPOLANC IS NULL) )'
      ''
      '   AND'
      
        '   (  ( (:TIPOOERACAO IS NOT NULL) AND (IDTIPOOPERACAO =:TIPOOER' +
        'ACAO) )'
      '   OR   (:TIPOOERACAO IS NULL) )'
      ''
      '   AND'
      
        '   (  ( (:TIPOTITULO IS NOT NULL) AND (CODTIPTITULO =:TIPOTITULO' +
        ') )'
      '   OR   (:TIPOTITULO IS NULL) )'
      ''
      '   AND'
      
        '   (  ( (:TIPODESPESA IS NOT NULL) AND (IDTIPODESPINVEST =:TIPOD' +
        'ESPESA) )'
      
        '   OR ( (:TIPODESPESA IS NULL) AND (IDTIPODESPINVEST IS NULL) ) ' +
        ')'
      ''
      '   AND'
      
        '   (  ( (:CARTEIRA IS NOT NULL) AND (IDCARTEIRAINVEST =:CARTEIRA' +
        ') )'
      '   OR   (:CARTEIRA IS NULL) )'
      ''
      '   AND'
      
        '   (  ( (:INVESTIMENTO IS NOT NULL) AND (IDINVESTIMENTO =:INVEST' +
        'IMENTO) )'
      '   OR   (:INVESTIMENTO IS NULL) )')
    Params.Data = {
      010016000B454D505245534150524F50000304000000000000000B454D505245
      534150524F5000030400000000000000075449504F4D4F560001020030000000
      0A5449504F494E5645535400030400000000000000085449504F4C414E430001
      020030000000085449504F4C414E430001020030000000085449504F4C414E43
      00010200300000000B5449504F4F45524143414F000304000000000000000B54
      49504F4F45524143414F000304000000000000000B5449504F4F45524143414F
      000304000000000000000A5449504F544954554C4F00010200300000000A5449
      504F544954554C4F00010200300000000A5449504F544954554C4F0001020030
      0000000B5449504F44455350455341000304000000000000000B5449504F4445
      5350455341000304000000000000000B5449504F444553504553410003040000
      0000000000084341525445495241000304000000000000000843415254454952
      4100030400000000000000084341525445495241000304000000000000000C49
      4E56455354494D454E544F000304000000000000000C494E56455354494D454E
      544F000304000000000000000C494E56455354494D454E544F00030400000000
      000000}
    ValidateWithMask = True
    Left = 56
    Top = 96
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
      'FROM '#9'CM.DESPOPERINVEST DOP'
      ''
      'WHERE '#9'(DOP.IDOPERACAOINVEST = :IDOPERACAOINVEST)'
      '')
    Params.Data = {010001001049444F5045524143414F494E5645535400030400000000000100}
    ValidateWithMask = True
    Left = 58
    Top = 179
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
    Params.Data = {
      010002000A5449504F494E56455354000304000000000000000B5449504F4F45
      524143414F00030400000000000000}
    ValidateWithMask = True
    Left = 184
    Top = 149
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
    Params.Data = {010001000C494E56455354494D454E544F00030400000000000000}
    ValidateWithMask = True
    Left = 280
    Top = 225
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = '"CM.INVESTIMENTO".DESCINVESTIMENTO'
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
    Params.Data = {0100010008434152544549524100030400000000000000}
    ValidateWithMask = True
    Left = 296
    Top = 289
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
  object QrySaldoVariacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.PLACONTA, C.PLAGRAU, C.PLANOME,'
      
        '   ((DECODE(SA.SALDOANT,NULL,0,SA.SALDOANT)+DECODE(SAL.SALDOMES,' +
        'NULL,0,SAL.SALDOMES)))'
      '    AS SALDO'
      'FROM'
      '   PLANOCONTA C,'
      '   (SELECT'
      '       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)'
      
        '           - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS S' +
        'ALDOANT'
      '    FROM PLANOSALDO'
      '    WHERE'
      '       (PLANO =:PLANO) AND'
      '       (PEREXERCICIO =:PEREXERCICIO) AND'
      '       ((IDPLANOPREV=:IDPLANOPREV) OR (IDPLANOPREV IS NULL)) AND'
      '       ((IDPATRO=:IDPATRO)         OR (IDPATRO IS NULL))     AND'
      '       ((PERNUMERO <:PERNUMERO)    OR (PERNUMERO IS NULL))   AND'
      '       (IDPESSOA =:IDPESSOA) AND'
      '       (RTRIM(PLACONTA) =:PLACONTA)'
      '   ) SA,'
      '   (SELECT'
      
        '       SUM(DECODE(L.LACDEBCRE,'#39'D'#39',L.LACVALOR,L.LACVALOR*-1)) AS ' +
        'SALDOMES'
      '    FROM PLANILHA P, LANCAMENTO L'
      '    WHERE (L.PLANO =:PLANO) AND'
      '          (P.PEREXERCICIO =:PEREXERCICIO) AND'
      '          (P.PERNUMERO =:PERNUMERO) AND'
      '          (P.IDPESSOA =:IDPESSOA) AND'
      
        '          ((L.IDPLANOPREV =:IDPLANOPREV) OR (L.IDPLANOPREV IS NU' +
        'LL)) AND'
      '          ((L.IDPATRO =:IDPATRO) OR (L.IDPATRO IS NULL)) AND'
      '          (P.PLNDATDIA <= :PLNDATDIA) AND'
      '          (P.PLNCODIGO = L.PLNCODIGO) AND'
      '          (RTRIM(L.PLACONTA) =:PLACONTA)'
      '   ) SAL'
      'WHERE'
      '    (C.PLANO =:PLANO) AND'
      '    (RTRIM(C.PLACONTA) =:PLACONTA)'
      'ORDER BY'
      ' C.PLACONTA')
    Params.Data = {
      0100110005504C414E4F000304000000000000000C5045524558455243494349
      4F000304000000000000000B4944504C414E4F50524556000304000000000000
      00074944504154524F00030400000000000000095045524E554D45524F000304
      00000000000000084944504553534F410003040000000000000008504C41434F
      4E5441000102003000000005504C414E4F000304000000000000000C50455245
      584552434943494F00030400000000000000095045524E554D45524F00030400
      000000000000084944504553534F41000304000000000000000B4944504C414E
      4F5052455600030400000000000000074944504154524F000304000000000000
      0009504C4E444154444941000904005A950A00000008504C41434F4E54410001
      02003000000005504C414E4F0003040000000000000008504C41434F4E544100
      01020030000000}
    ValidateWithMask = True
    Left = 432
    Top = 312
    object QrySaldoVariacaoPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
    object QrySaldoVariacaoPLAGRAU: TFloatField
      FieldName = 'PLAGRAU'
    end
    object QrySaldoVariacaoPLANOME: TStringField
      FieldName = 'PLANOME'
      Size = 40
    end
    object QrySaldoVariacaoSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
end
