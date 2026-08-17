object dtmFinanciamento: TdtmFinanciamento
  OldCreateOrder = False
  Left = 344
  Top = 194
  Height = 331
  Width = 635
  object updParc: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCFINANCIMOV'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL,'
      '  NUMPARCELA = :NUMPARCELA,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  VLRNOMINAL = :VLRNOMINAL,'
      '  VLRPRESTACAO = :VLRPRESTACAO,'
      '  VLRJUROS = :VLRJUROS,'
      '  VLRJUROSPARC = :VLRJUROSPARC,'
      '  VLRAMORTIZACAO = :VLRAMORTIZACAO,'
      '  VLRSALDODEVEDOR = :VLRSALDODEVEDOR,'
      '  VLRSALDOATUAL = :VLRSALDOATUAL,'
      '  VLRPRESTATUALIZADA = :VLRPRESTATUALIZADA,'
      '  VLRRESIDUO = :VLRRESIDUO,'
      '  VLRRESIDUOATUALI = :VLRRESIDUOATUALI,'
      '  VLRCORRSALDO = :VLRCORRSALDO,'
      '  VLRCORRIGIDOATRASO = :VLRCORRIGIDOATRASO,'
      '  VLRMULTAATRASO = :VLRMULTAATRASO,'
      '  VLRMORAATRASO = :VLRMORAATRASO,'
      '  FLGRESIDUOINCORP = :FLGRESIDUOINCORP,'
      '  FLGTIPOLANC = :FLGTIPOLANC,'
      '  DATALANCINTEGRA = :DATALANCINTEGRA,'
      '  FLGLANCINTEGRA = :FLGLANCINTEGRA,'
      '  FLGCONCILIADO = :FLGCONCILIADO,'
      '  IDINDCORRECAO = :IDINDCORRECAO,'
      '  FATORCORRECAO = :FATORCORRECAO'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    InsertSQL.Strings = (
      'insert into PARCFINANCIMOV'
      
        '  (IDPARCFINANCIMOV, CODDOCUMENTO, PLNCODIGO, IDCONDPAGIMOVEL, N' +
        'UMPARCELA, '
      
        '   DATAVENCIMENTO, VLRNOMINAL, VLRPRESTACAO, VLRJUROS, VLRJUROSP' +
        'ARC, VLRAMORTIZACAO, '
      
        '   VLRSALDODEVEDOR, VLRSALDOATUAL, VLRPRESTATUALIZADA, VLRRESIDU' +
        'O, VLRRESIDUOATUALI, '
      
        '   VLRCORRSALDO, VLRCORRIGIDOATRASO, VLRMULTAATRASO, VLRMORAATRA' +
        'SO, FLGRESIDUOINCORP, '
      
        '   FLGTIPOLANC, DATALANCINTEGRA, FLGLANCINTEGRA, FLGCONCILIADO, ' +
        'IDINDCORRECAO, '
      '   FATORCORRECAO)'
      'values'
      
        '  (:IDPARCFINANCIMOV, :CODDOCUMENTO, :PLNCODIGO, :IDCONDPAGIMOVE' +
        'L, :NUMPARCELA, '
      
        '   :DATAVENCIMENTO, :VLRNOMINAL, :VLRPRESTACAO, :VLRJUROS, :VLRJ' +
        'UROSPARC, '
      
        '   :VLRAMORTIZACAO, :VLRSALDODEVEDOR, :VLRSALDOATUAL, :VLRPRESTA' +
        'TUALIZADA, '
      
        '   :VLRRESIDUO, :VLRRESIDUOATUALI, :VLRCORRSALDO, :VLRCORRIGIDOA' +
        'TRASO, '
      
        '   :VLRMULTAATRASO, :VLRMORAATRASO, :FLGRESIDUOINCORP, :FLGTIPOL' +
        'ANC, :DATALANCINTEGRA, '
      
        '   :FLGLANCINTEGRA, :FLGCONCILIADO, :IDINDCORRECAO, :FATORCORREC' +
        'AO)')
    DeleteSQL.Strings = (
      'delete from PARCFINANCIMOV'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    Left = 144
    Top = 8
  end
  object qryCondPag: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CPI.IDCONTRATOIMOVEL,'
      '     CPI.IDCONDPAGIMOVEL,'
      '     CPI.INDCORRECAO,'
      '     CPI.IDINDCORRPROJ,'
      '     CPI.VLRFINANC,'
      '     CPI.DATAVENCIMENTO,'
      '     CPI.PRAZO,'
      '     CPI.PERIODO,'
      '     CPI.TAXAJUROS,'
      '     CPI.PERIODOTAXA,'
      '     CPI.NUMPARCELAS,'
      '     M.FLGPERCVALOR'
      'FROM'
      '     CONDPAGIMOVEL CPI,'
      '     MOEDA M'
      'WHERE'
      '      (CPI.IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL)'
      '  AND (M.MOECODIGO(+) = CPI.INDCORRECAO)'
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 79
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryCondPagINDCORRECAO: TFloatField
      DisplayWidth = 10
      FieldName = 'INDCORRECAO'
      Visible = False
    end
    object qryCondPagVLRFINANC: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRFINANC'
      Visible = False
    end
    object qryCondPagPRAZO: TStringField
      DisplayWidth = 1
      FieldName = 'PRAZO'
      Visible = False
      Size = 1
    end
    object qryCondPagPERIODO: TFloatField
      DisplayWidth = 10
      FieldName = 'PERIODO'
      Visible = False
    end
    object qryCondPagTAXAJUROS: TFloatField
      DisplayWidth = 10
      FieldName = 'TAXAJUROS'
      Visible = False
    end
    object qryCondPagPERIODOTAXA: TStringField
      DisplayWidth = 1
      FieldName = 'PERIODOTAXA'
      Visible = False
      Size = 1
    end
    object qryCondPagNUMPARCELAS: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMPARCELAS'
      Visible = False
    end
    object qryCondPagFLGPERCVALOR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERCVALOR'
      Visible = False
      Size = 1
    end
    object qryCondPagIDINDCORRPROJ: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDCORRPROJ'
      Visible = False
    end
    object qryCondPagDATAVENCIMENTO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAVENCIMENTO'
      Visible = False
    end
  end
  object qryContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CI.IDCONTRATOIMOVEL,'
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     CI.CONDATAASSINATURA,'
      '     CI.CONDATAINICIO,'
      '     CI.FLGTIPOCONTRATO,'
      '     CI.PERCTXJURMERC,'
      '     CI.PERITXJURMERC,'
      '     CI.CONTAXAADMIN,'
      '     CI.CONVLRAJUSTADO,'
      '     CI.PERALUGUELIDEAL,'
      '     CI.CONVLRTOTAL,'
      '     CI.CONDESCRICAO,'
      '     CI.VLRPROPOSTA,'
      '     CI.VLRPRESENTE,'
      '     CI.VLRCONTABIL,'
      '     CI.CONINDICEMORA,'
      '     CI.CONINDICEREAJUSTE,'
      '     CI.CONDATAREAJUSTE,'
      '     CI.CONPERREAJUSTE,'
      '     CI.IDLOCATARIO,'
      '     P.RAZAOSOCIAL'
      'FROM'
      '     PESSOA P,'
      '     CONTRATOIMOVEL CI'
      'WHERE'
      '       (CI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      '   AND (CI.IDLOCATARIO = P.IDPESSOA)'
      ' ')
    ValidateWithMask = True
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryContratoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = '"CM.CONTRATOIMOVEL".IDCONTRATOIMOVEL'
    end
    object qryContratoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
      Origin = '"CM.CONTRATOIMOVEL".CONNUMERO'
    end
    object qryContratoCONNOME: TStringField
      FieldName = 'CONNOME'
      Origin = '"CM.CONTRATOIMOVEL".CONNOME'
      Size = 60
    end
    object qryContratoCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAASSINATURA'
    end
    object qryContratoCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAINICIO'
    end
    object qryContratoFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      Origin = '"CM.CONTRATOIMOVEL".FLGTIPOCONTRATO'
      Size = 1
    end
    object qryContratoCONTAXAADMIN: TFloatField
      FieldName = 'CONTAXAADMIN'
      Origin = '"CM.CONTRATOIMOVEL".CONTAXAADMIN'
    end
    object qryContratoCONVLRAJUSTADO: TFloatField
      FieldName = 'CONVLRAJUSTADO'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRAJUSTADO'
    end
    object qryContratoCONVLRTOTAL: TFloatField
      FieldName = 'CONVLRTOTAL'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRTOTAL'
    end
    object qryContratoCONDESCRICAO: TMemoField
      FieldName = 'CONDESCRICAO'
      Origin = '"CM.CONTRATOIMOVEL".CONDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryContratoVLRPROPOSTA: TFloatField
      FieldName = 'VLRPROPOSTA'
      Origin = '"CM.CONTRATOIMOVEL".VLRPROPOSTA'
    end
    object qryContratoVLRPRESENTE: TFloatField
      FieldName = 'VLRPRESENTE'
      Origin = '"CM.CONTRATOIMOVEL".VLRPRESENTE'
    end
    object qryContratoVLRCONTABIL: TFloatField
      FieldName = 'VLRCONTABIL'
      Origin = '"CM.CONTRATOIMOVEL".VLRCONTABIL'
    end
    object qryContratoCONINDICEMORA: TFloatField
      FieldName = 'CONINDICEMORA'
      Origin = '"CM.CONTRATOIMOVEL".CONINDICEMORA'
    end
    object qryContratoCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONINDICEREAJUSTE'
    end
    object qryContratoCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONDATAREAJUSTE'
    end
    object qryContratoIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
      Origin = 'CONTRATOIMOVEL.IDLOCATARIO'
    end
    object qryContratoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryContratoPERALUGUELIDEAL: TFloatField
      FieldName = 'PERALUGUELIDEAL'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.PERALUGUELIDEAL'
    end
    object qryContratoPERCTXJURMERC: TFloatField
      FieldName = 'PERCTXJURMERC'
    end
    object qryContratoPERITXJURMERC: TStringField
      FieldName = 'PERITXJURMERC'
      FixedChar = True
      Size = 1
    end
  end
  object qryParc: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryParcCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDPARCFINANCIMOV,'
      '     CODDOCUMENTO,'
      '     PLNCODIGO,'
      '     IDCONDPAGIMOVEL,'
      '     NUMPARCELA,'
      '     DATAVENCIMENTO,'
      '     VLRNOMINAL,'
      '     VLRPRESTACAO,'
      '     VLRJUROS,'
      '     VLRJUROSPARC,'
      '     VLRAMORTIZACAO,'
      '     VLRSALDODEVEDOR,'
      '     VLRSALDOATUAL,'
      '     VLRPRESTATUALIZADA,'
      '     VLRRESIDUO,'
      '     VLRRESIDUOATUALI,'
      '     VLRCORRSALDO,'
      '     VLRCORRIGIDOATRASO,'
      '     VLRMULTAATRASO,'
      '     VLRMORAATRASO,'
      '     NVL(FLGRESIDUOINCORP,'#39'N'#39') AS FLGRESIDUOINCORP,'
      '     FLGTIPOLANC,'
      '     DATALANCINTEGRA,'
      '     FLGLANCINTEGRA,'
      '     FLGCONCILIADO,'
      '     IDINDCORRECAO,'
      '     FATORCORRECAO,'
      '     (0) AS IDCONTRATOIMOVEL'
      'FROM'
      '     PARCFINANCIMOV'
      'WHERE'
      '      (FLGTIPOLANC IN(1,2,3,4,5,7,8,9,10,11,12))'
      '  AND (IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL)'
      
        'ORDER BY IDCONDPAGIMOVEL, DATAVENCIMENTO, DECODE(FLGTIPOLANC,5,9' +
        '99,NUMPARCELA), DECODE(FLGTIPOLANC,11,0,DECODE(FLGTIPOLANC,5,4))')
    UpdateObject = updParc
    ValidateWithMask = True
    Left = 144
    Top = 36
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONDPAGIMOVEL'
        ParamType = ptInput
        Value = 136
      end>
    object qryParcNUMPARCELA: TFloatField
      DisplayLabel = 'Parcela'
      DisplayWidth = 7
      FieldName = 'NUMPARCELA'
      Origin = 'PARCFINANCIMOV.NUMPARCELA'
    end
    object qryParcDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCIMENTO'
      Origin = 'PARCFINANCIMOV.DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryParcCAL_TIPO: TStringField
      DisplayLabel = 'Tipo de Parcela'
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Size = 25
      Calculated = True
    end
    object qryParcVLRPRESTACAO: TFloatField
      DisplayLabel = 'Prestação Real'
      DisplayWidth = 11
      FieldName = 'VLRPRESTACAO'
      Origin = 'PARCFINANCIMOV.VLRPRESTACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRJUROS: TFloatField
      DisplayLabel = 'Juros Saldo'
      DisplayWidth = 10
      FieldName = 'VLRJUROS'
      Origin = 'PARCFINANCIMOV.VLRJUROS'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRAMORTIZACAO: TFloatField
      DisplayLabel = 'Amortização'
      DisplayWidth = 12
      FieldName = 'VLRAMORTIZACAO'
      Origin = 'PARCFINANCIMOV.VLRAMORTIZACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRSALDODEVEDOR: TFloatField
      DisplayLabel = 'Saldo Devedor'
      DisplayWidth = 13
      FieldName = 'VLRSALDODEVEDOR'
      Origin = 'PARCFINANCIMOV.VLRSALDODEVEDOR'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRPRESTATUALIZADA: TFloatField
      DisplayLabel = 'Prest. Atualizada'
      DisplayWidth = 13
      FieldName = 'VLRPRESTATUALIZADA'
      Origin = 'PARCFINANCIMOV.VLRPRESTATUALIZADA'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRRESIDUO: TFloatField
      DisplayLabel = 'Resíduo'
      DisplayWidth = 10
      FieldName = 'VLRRESIDUO'
      Origin = 'PARCFINANCIMOV.VLRRESIDUO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRRESIDUOATUALI: TFloatField
      DisplayLabel = 'Res. Atualizado'
      DisplayWidth = 12
      FieldName = 'VLRRESIDUOATUALI'
      Origin = 'PARCFINANCIMOV.VLRRESIDUOATUALI'
      DisplayFormat = '#,##0.00'
    end
    object qryParcPLNCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryParcFATORCORRECAO: TFloatField
      DisplayLabel = 'Fator'
      DisplayWidth = 10
      FieldName = 'FATORCORRECAO'
      DisplayFormat = '#0.000000'
    end
    object qryParcFLGTIPOLANC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGTIPOLANC'
      Visible = False
    end
    object qryParcVLRCORRIGIDOATRASO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRCORRIGIDOATRASO'
      Origin = 'PARCFINANCIMOV.VLRCORRIGIDOATRASO'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRMULTAATRASO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRMULTAATRASO'
      Origin = 'PARCFINANCIMOV.VLRMULTAATRASO'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRMORAATRASO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRMORAATRASO'
      Origin = 'PARCFINANCIMOV.VLRMORAATRASO'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryParcIDPARCFINANCIMOV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARCFINANCIMOV'
      Origin = 'PARCFINANCIMOV.IDPARCFINANCIMOV'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryParcCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Origin = 'PARCFINANCIMOV.CODDOCUMENTO'
      Visible = False
    end
    object qryParcIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Origin = 'PARCFINANCIMOV.IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryParcIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryParcFLGLANCINTEGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGLANCINTEGRA'
      Visible = False
    end
    object qryParcIDINDCORRECAO: TFloatField
      FieldName = 'IDINDCORRECAO'
      Visible = False
    end
    object qryParcDATALANCINTEGRA: TDateTimeField
      FieldName = 'DATALANCINTEGRA'
      Visible = False
    end
    object qryParcFLGRESIDUOINCORP: TStringField
      FieldName = 'FLGRESIDUOINCORP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryParcFLGCONCILIADO: TStringField
      FieldName = 'FLGCONCILIADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryParcVLRSALDOATUAL: TFloatField
      FieldName = 'VLRSALDOATUAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryParcVLRJUROSPARC: TFloatField
      DisplayLabel = 'Juros Parcela'
      FieldName = 'VLRJUROSPARC'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRNOMINAL: TFloatField
      DisplayLabel = 'Prestação Nominal'
      FieldName = 'VLRNOMINAL'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRCORRSALDO: TFloatField
      DisplayLabel = 'Correção Saldo'
      FieldName = 'VLRCORRSALDO'
      DisplayFormat = '#,##0.00'
    end
  end
  object qryVerifAmortiz: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     VLRSALDODEVEDOR,'
      '     VLRPRESTACAO,'
      '     FATORCORRECAO,'
      '     DATAVENCIMENTO,'
      '     VLRAMORTIZACAO'
      'FROM'
      '     PARCFINANCIMOV'
      ''
      'WHERE ( FLGTIPOLANC = 5 )'
      '  AND ( IDCONDPAGIMOVEL = :pCONDPAG)'
      '  AND ( TO_CHAR(DATAVENCIMENTO,'#39'MM'#39') = :MES)'
      '  AND ( TO_CHAR(DATAVENCIMENTO,'#39'YYYY'#39') = :ANO)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 207
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCONDPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANO'
        ParamType = ptUnknown
      end>
    object qryVerifAmortizVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
    end
    object qryVerifAmortizFATORCORRECAO: TFloatField
      FieldName = 'FATORCORRECAO'
    end
    object qryVerifAmortizDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryVerifAmortizVLRSALDODEVEDOR: TFloatField
      FieldName = 'VLRSALDODEVEDOR'
    end
    object qryVerifAmortizVLRAMORTIZACAO: TFloatField
      FieldName = 'VLRAMORTIZACAO'
    end
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
    Left = 149
    Top = 94
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
      '   M.MOECODIGO, C.COTVALOR, C.COTMESREF, M.MOEDESC, M.MOESIGLA '
      'FROM '
      '   COTACAOMOEDA C, MOEDA M '
      'WHERE '
      '   ( C.MOECODIGO =:INDICE )'
      
        '   AND ( (SUBSTR(C.COTMESREF, 3, 4)||SUBSTR(C.COTMESREF, 1, 2)) ' +
        '>=:ANOMESINI )'
      
        '   AND ( (SUBSTR(C.COTMESREF, 3, 4)||SUBSTR(C.COTMESREF, 1, 2)) ' +
        '<=:ANOMESFIM )'
      '   AND ( C.MOECODIGO = M.MOECODIGO )'
      'ORDER BY'
      '   C.COTDATA')
    ValidateWithMask = True
    Left = 148
    Top = 107
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
        Name = 'ANOMESFIM'
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
    Left = 40
    Top = 96
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
    Left = 40
    Top = 112
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
    Left = 302
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 381
    Top = 7
  end
  object qryUpdCondPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE CONDPAGIMOVEL'
      '   SET DATAFIM = TO_DATE(:pDATAFIM,'#39'DD/MM/YYYY'#39')'
      ' WHERE IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL')
    ValidateWithMask = True
    Left = 253
    Top = 165
    ParamData = <
      item
        DataType = ftString
        Name = 'pDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryCalcCorrecao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     MIN(CI.IDCONTRATOIMOVEL)  AS IDCONTRATOIMOVEL,'
      '     PR.IDPARCFINANCIMOV,'
      '     PR.IDCONDPAGIMOVEL,'
      '     MIN(PR.FLGTIPOLANC)       AS FLGTIPOLANC,'
      '     MIN(PR.NUMPARCELA)        AS NUMPARCELA,'
      '     MIN(PR.CODDOCUMENTO)      AS CODDOCUMENTO,'
      '     MIN(CI.IDCIDADES)         AS IDCIDADES,'
      '     MIN(CI.IDPAIS)            AS IDPAIS,'
      '     MIN(CI.CODESTADO)         AS CODESTADO,'
      '     MIN(PR.DATAVENCIMENTO)    AS DATAVENCIMENTO,'
      '     MIN(PR.DATALIMITE)        AS DATALIMITE,'
      '     MIN(PR.VLRPAGO)           AS VLRPAGO,'
      '     MIN(PR.DATAPAGAMENTO)     AS DATAPAGAMENTO,'
      '     MIN(PR.VLRMULTAATRASO)    AS VLRMULTAATRASO,'
      '     MIN(PR.VLRMORAATRASO)     AS VLRMORAATRASO,'
      '     MIN(PR.VLRCORRIGIDOATRASO) AS VLRCORRIGIDOATRASO,'
      '     MIN(PR.VLRPRESTCORRIG)    AS VLRPRESTCORRIG,'
      '     MIN(PR.VLRMULTACORRIG)    AS VLRMULTACORRIG,'
      '     MIN(PR.VLRJUROSCORRIG)    AS VLRJUROSCORRIG,'
      ''
      '     DECODE(MIN(PR.DATAPAGAMENTO), NULL,'
      
        '            ( DECODE(MIN(PR.FLGTIPOLANC),9,MIN(PR.VLRAMORTIZACAO' +
        '),MIN(PR.VLRPRESTACAO)) + NVL(MIN(ALT.TOT_ALTERADOR),0) ),'
      
        '            DECODE(MIN(PR.FLGTIPOLANC),9,MIN(PR.VLRAMORTIZACAO),' +
        'MIN(PR.VLRPRESTACAO))'
      '            ) AS VLRPRESTACAO'
      ''
      'FROM'
      '     PARCFINANCIMOV PR,'
      '     CONDPAGIMOVEL CP,'
      '     CONTRATOIMOVEL CI,'
      '     CONCILIADOC CD,'
      ''
      '     ( SELECT LD.CODDOCUMENTO, T.CODTIPIMOVEL,'
      
        '              SUM( DECODE(LD.DEBCRE,'#39'D'#39', LD.VALOR, (LD.VALOR * -' +
        '1)) ) AS TOT_ALTERADOR'
      '         FROM LANCTODOCUM LD, DOCUMENTO D, PARAMALIENACAO PA,'
      '              PARCFINANCIMOV P, CONDPAGIMOVEL C,  TIPOIMOVEL T,'
      
        '              ( SELECT DISTINCT C.IDCONTRATOIMOVEL, I.CODTIPIMOV' +
        'EL'
      
        '                  FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, IM' +
        'OVEL I'
      '                 WHERE CXI.IDIMOVEL = I.IDIMOVEL'
      '                   AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'
      '                   AND C.FLGTIPOCONTRATO = '#39'C'#39' ) TC'
      '        WHERE RTRIM(LD.OPERACAO) = '#39'4'#39
      '          AND LD.CODALTERADOR <> :PCPMF'
      '          AND PA.IDPESSOA = :pIDEMPRESA'
      '          AND LD.CODDOCUMENTO = D.CODDOCUMENTO'
      '          AND D.CODDOCUMENTO = P.CODDOCUMENTO'
      '          AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL'
      '          AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMOVEL'
      '          AND TC.CODTIPIMOVEL = T.CODTIPIMOVEL'
      '          AND ( PA.IDOPERATUALCM IS NULL OR'
      '                ( LD.CODALTERADOR <> T.CODALTCMAL AND'
      '                  LD.CODALTERADOR <> T.CODALTJRAL AND'
      '                  LD.CODALTERADOR <> T.CODALTMTAL ) )'
      '          AND D.IDMODULO = 135'
      '        GROUP BY LD.CODDOCUMENTO, T.CODTIPIMOVEL  )  ALT'
      'WHERE'
      
        '       ( PR.DATAVENCIMENTO < TO_DATE(TO_CHAR(SYSDATE,'#39'DD/MM/YYYY' +
        #39'),'#39'DD/MM/YYYY'#39') )'
      
        '   AND ( (PR.FLGCONCILIADO IS NULL) OR ((PR.FLGCONCILIADO <> '#39'S'#39 +
        ') AND (PR.FLGCONCILIADO <> '#39'C'#39')) )'
      '   AND (PR.FLGTIPOLANC IN (2,3,5,6,7,9))'
      '   AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '   AND (CP.IDCONDPAGIMOVEL  = PR.IDCONDPAGIMOVEL)'
      '   AND (PR.CODDOCUMENTO = ALT.CODDOCUMENTO(+) )'
      '   AND (PR.IDPARCFINANCIMOV = CD.IDPARCFINANCIMOV(+) )'
      '   AND ((:pDATAF IS NULL) OR (PR.DATAVENCIMENTO <= :pDATAF))'
      '   AND ((:pIDPESSOA IS NULL) OR (CI.IDLOCATARIO = :pIDPESSOA))'
      
        '   AND ((:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pIDRES' +
        'PONSAVEL))'
      
        '   AND ((:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pIDADM' +
        'INIMOVEL))'
      
        '   AND ((:pIDCONTRATO IS NULL) OR (CI.IDCONTRATOIMOVEL = :pIDCON' +
        'TRATO))'
      
        '   AND ((:pIDCONDPAGIMOVEL IS NULL) OR (CP.IDCONDPAGIMOVEL = :pI' +
        'DCONDPAGIMOVEL))'
      ''
      'GROUP BY PR.IDCONDPAGIMOVEL, PR.IDPARCFINANCIMOV'
      'ORDER BY DATAVENCIMENTO'
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
      ' '
      ' ')
    ControlType.Strings = (
      'CODDOCUMENTO;CheckBox;1;0'
      'CHKINTEGRA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 40
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCPMF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAF'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCalcCorrecaoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryCalcCorrecaoIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryCalcCorrecaoIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryCalcCorrecaoFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
    end
    object qryCalcCorrecaoVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
    end
    object qryCalcCorrecaoNUMPARCELA: TFloatField
      FieldName = 'NUMPARCELA'
    end
    object qryCalcCorrecaoIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object qryCalcCorrecaoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryCalcCorrecaoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryCalcCorrecaoVLRPAGO: TFloatField
      FieldName = 'VLRPAGO'
    end
    object qryCalcCorrecaoDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object qryCalcCorrecaoVLRMULTAATRASO: TFloatField
      FieldName = 'VLRMULTAATRASO'
    end
    object qryCalcCorrecaoVLRMORAATRASO: TFloatField
      FieldName = 'VLRMORAATRASO'
    end
    object qryCalcCorrecaoVLRCORRIGIDOATRASO: TFloatField
      FieldName = 'VLRCORRIGIDOATRASO'
    end
    object qryCalcCorrecaoVLRPRESTCORRIG: TFloatField
      FieldName = 'VLRPRESTCORRIG'
    end
    object qryCalcCorrecaoVLRMULTACORRIG: TFloatField
      FieldName = 'VLRMULTACORRIG'
    end
    object qryCalcCorrecaoVLRJUROSCORRIG: TFloatField
      FieldName = 'VLRJUROSCORRIG'
    end
    object qryCalcCorrecaoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryCalcCorrecaoDATALIMITE: TDateTimeField
      FieldName = 'DATALIMITE'
    end
    object qryCalcCorrecaoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
  end
  object qryUpdCorrecao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   PARCFINANCIMOV'
      'SET'
      '   DATALIMITE     = :pDATALIMITE,'
      '   VLRPRESTCORRIG = :pCORRIGIDO,'
      '   VLRMULTACORRIG = :pMULTA,'
      '   VLRJUROSCORRIG = :pMORA'
      'WHERE'
      '   ( IDPARCFINANCIMOV = :pIDPARCFINANCIMOV )'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 198
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pDATALIMITE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCORRIGIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pMULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pMORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPARCFINANCIMOV'
        ParamType = ptUnknown
      end>
  end
  object qryImovelxbem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDIMOVEL,'
      '       IDBEM'
      'FROM '
      '       IMOVELXBEM'
      'WHERE'
      '       IDIMOVEL = :pIDIMOVEL'
      '')
    ValidateWithMask = True
    Left = 153
    Top = 192
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
    object qryImovelxbemIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.IMOVELXBEM.IDIMOVEL'
    end
    object qryImovelxbemIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BASEDADOS.IMOVELXBEM.IDBEM'
    end
  end
  object qryInsParcExtra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO PARCEXTRAIMOV'
      ' ( IDPARCEXTRAIMOV,'
      '   IDPARCCOBRANCA,'
      '   IDPARCCOBRADA,'
      '   FLGTIPOCOBRANCA,'
      '   DATACOBRANCA'
      '   )'
      'VALUES'
      ' ( :PIDPARCEXTRAIMOV,'
      '   :PIDPARCCOBRANCA,'
      '   :PIDPARCCOBRADA,'
      '   :PFLGTIPOCOBRANCA,'
      '   :PDATACOBRANCA'
      '   )'
      '')
    ValidateWithMask = True
    Left = 263
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPARCEXTRAIMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPARCCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPARCCOBRADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATACOBRANCA'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object FloatField2: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object FloatField3: TFloatField
      DisplayWidth = 10
      FieldName = 'INDCORRECAO'
      Visible = False
    end
    object FloatField4: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRFINANC'
      Visible = False
    end
    object StringField1: TStringField
      DisplayWidth = 1
      FieldName = 'PRAZO'
      Visible = False
      Size = 1
    end
    object FloatField5: TFloatField
      DisplayWidth = 10
      FieldName = 'PERIODO'
      Visible = False
    end
    object FloatField6: TFloatField
      DisplayWidth = 10
      FieldName = 'TAXAJUROS'
      Visible = False
    end
    object StringField2: TStringField
      DisplayWidth = 1
      FieldName = 'PERIODOTAXA'
      Visible = False
      Size = 1
    end
    object FloatField7: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMPARCELAS'
      Visible = False
    end
    object StringField3: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERCVALOR'
      Visible = False
      Size = 1
    end
    object FloatField8: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDCORRPROJ'
      Visible = False
    end
    object DateTimeField1: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAVENCIMENTO'
      Visible = False
    end
  end
  object qryInsParcela: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO PARCFINANCIMOV'
      ' ( IDPARCFINANCIMOV,'
      '   IDCONDPAGIMOVEL,'
      '   CODDOCUMENTO,'
      '   PLNCODIGO,'
      '   VLRPRESTACAO,'
      '   DATAVENCIMENTO,'
      '   DATALANCINTEGRA,'
      '   NUMPARCELA,'
      '   FLGTIPOLANC,'
      '   FLGLANCINTEGRA,'
      '   DATALIMITE'
      '   )'
      'VALUES'
      ' ( :PIDPARCFINANCIMOV,'
      '   :PIDCONDPAGIMOVEL,'
      '   :PCODDOCUMENTO,'
      '   :PPLNCODIGO,'
      '   :PVLRPRESTACAO,'
      '   :PDATAVENCIMENTO,'
      '   :PDATALANCINTEGRA,'
      '   :PNUMPARCELA,'
      '   :PFLGTIPOLANC,'
      '   :PFLGLANCINTEGRA,'
      '   :PDATALIMITE'
      '   )'
      ''
      ' ')
    ValidateWithMask = True
    Left = 263
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPARCFINANCIMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRPRESTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCINTEGRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PNUMPARCELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGTIPOLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGLANCINTEGRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATALIMITE'
        ParamType = ptInput
      end>
    object FloatField9: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object FloatField10: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object FloatField11: TFloatField
      DisplayWidth = 10
      FieldName = 'INDCORRECAO'
      Visible = False
    end
    object FloatField12: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRFINANC'
      Visible = False
    end
    object StringField4: TStringField
      DisplayWidth = 1
      FieldName = 'PRAZO'
      Visible = False
      Size = 1
    end
    object FloatField13: TFloatField
      DisplayWidth = 10
      FieldName = 'PERIODO'
      Visible = False
    end
    object FloatField14: TFloatField
      DisplayWidth = 10
      FieldName = 'TAXAJUROS'
      Visible = False
    end
    object StringField5: TStringField
      DisplayWidth = 1
      FieldName = 'PERIODOTAXA'
      Visible = False
      Size = 1
    end
    object FloatField15: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMPARCELAS'
      Visible = False
    end
    object StringField6: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERCVALOR'
      Visible = False
      Size = 1
    end
    object FloatField16: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDCORRPROJ'
      Visible = False
    end
    object DateTimeField2: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAVENCIMENTO'
      Visible = False
    end
  end
  object qryVerifAmortiz_new: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     VLRSALDODEVEDOR,'
      '     VLRPRESTACAO,'
      '     FATORCORRECAO,'
      '     DATAVENCIMENTO,'
      '     VLRAMORTIZACAO'
      'FROM'
      '     PARCFINANCIMOV'
      ''
      'WHERE ( FLGTIPOLANC = 5 )'
      '  AND ( IDCONDPAGIMOVEL = :pCONDPAG)'
      '  AND ( TO_CHAR(DATAVENCIMENTO,'#39'MM'#39') = :MES)'
      '  AND ( TO_CHAR(DATAVENCIMENTO,'#39'YYYY'#39') = :ANO)'
      ' '
      ''
      ' ORDER BY DATAVENCIMENTO DESC '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 359
    Top = 72
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCONDPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ANO'
        ParamType = ptUnknown
      end>
    object qryVerifAmortiz_newVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
    end
    object qryVerifAmortiz_newFATORCORRECAO: TFloatField
      FieldName = 'FATORCORRECAO'
    end
    object qryVerifAmortiz_newDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object VLRSALDODEVEDOR: TFloatField
      FieldName = 'VLRSALDODEVEDOR'
    end
    object qryVerifAmortiz_newVLRAMORTIZACAO: TFloatField
      FieldName = 'VLRAMORTIZACAO'
    end
  end
end
